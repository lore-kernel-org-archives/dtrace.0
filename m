Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185D41FDA94
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 19:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755201086; cv=none; b=qPTj5xQzs5ZIcnByR69/WPyJtI1qi64E6GAkUKSrXIiChFDaKGAdiDuEw8FalnytJ3wXAgvyJKTu6077WLxLGgAYV/1O7cqfCUyMzsccIEcAbf1YAQNhqcQeLQ3fnBkwDSADyqkKMvQjOBReG5lViWozMSdyQvL7w8H+5Av9ILs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755201086; c=relaxed/simple;
	bh=O7XJ7wRFRGrbSIp1xeFrABkgK2g6KGt47Z4wcfVtglk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lIdsqcOoD8itW25KA/QZ6bn+WsAWONSigTea5Nc1aIS5Gzv4LmnqaectHzYgBjA3ejsTRByap8L+0cRwzuz9kG+OQ0tl5bF5i2HyFPFutGOF1NbUTHt4whFSxhZiH2YowDh+BznvIjn8HGDKujE+7thulK6f8/FUM5z3die5xGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (3.a.c.0.0.0.0.0.0.0.0.0.0.0.0.0.a.5.c.d.c.d.9.1.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:19dc:dc5a::ca3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id CFFA6340D2E;
	Thu, 14 Aug 2025 19:51:23 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: Kris Van Hees via DTrace-devel <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev,  Kris Van Hees <kris.van.hees@oracle.com>
Subject: Re: [DTrace-devel] [PATCH] bpf: force generating code that all
 verifiers accept
In-Reply-To: <SJ0PR10MB5672B2F52AD47A7F26420D14C22AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Organization: Gentoo
References: <SJ0PR10MB5672B2F52AD47A7F26420D14C22AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
User-Agent: mu4e 1.12.12; emacs 31.0.50
Date: Thu, 14 Aug 2025 20:51:21 +0100
Message-ID: <87h5y9k7gm.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Kris Van Hees via DTrace-devel <dtrace-devel@oss.oracle.com> writes:

> The compiler could optimize val = *valp in a way where the verifier on
> older kernels would complain.  We use inline assembler to force the
> not optimize this expression and instead to always read the value as a
> scalar.

I'd mention a known-bad kernel version and some testcase which
definitely hit it, so we know when we can remove it in future.

>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  bpf/get_dvar.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/bpf/get_dvar.c b/bpf/get_dvar.c
> index 073cca57c..aa14eca58 100644
> --- a/bpf/get_dvar.c
> +++ b/bpf/get_dvar.c
> @@ -150,7 +150,24 @@ noinline void *dt_get_assoc(uint32_t id, const char *tuple, uint64_t store,
>  		if (valp == 0)
>  			return dt_no_dvar();
>  		*valp = (uint64_t)valp;
> -		val = *valp;
> +		/*
> +		 * We used to do:
> +		 *	val = *valp;
> +		 * but the compiler could use knowledge that *valp is valp from
> +		 * the assignment above, and use that same value (whith is a
> +		 * map_value address).  Older kernels do not allow a map_value
> +		 * address to be used as map key, and a verifier failure would
> +		 * be triggered by this code optimization.
> +		 *
> +		 * We use inline assembler to force reading the value from the
> +		 * map value rather than allowing the compiler to optimize this
> +		 * code.  This works for all kernels.
> +		 */
> +		asm ("ldxdw %0, %1" \
> +			: "=r" (val) \
> +			: "m" (*valp) \
> +			: /* no clobber */
> +		);
>  	} else {
>  		/*
>  		 * Record the value (used as key into the dvars map), and if we
