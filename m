Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7157A1AED49
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 20:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724963458; cv=none; b=H/XHh2IEGGoLRxAZIU/srH1MFweLH+yB/JzVWxFJWDvje1wIkYA+subNgpmQCrsz3LkTjq+Md6bEwiGZpEYPhQn+4Xwqe1aTa6NLt1jU0tWGP6Ufdq8oRkWX9jgtftWjzk7Ed5hFvjabLmBH1uZxg9hDU1KAiAXSuceTVjNKmN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724963458; c=relaxed/simple;
	bh=npOivoR1vqrQT/rbCk6a6EAGKjp1lFLoKiBiBnfykeI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=msEVV0suq+YxsyIK9d99CWbZVf/kW1xcrEY/GM7wbjvUbGRq0lI4aRhILT7fiUjtvy47vQpbIyQHtlxBBBkphB7ibmidiApWByxp+oXZviMtJeWSnWwbmkfePCrCXHWDEWwadEEVXpEmh4Z3oNViGq80KTcz4KacDHJzOspKdEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: "eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev,  eugene.loh@oracle.com
Subject: Re: [DTrace-devel] [PATCH 12/19] Increase size of BPF probes map
In-Reply-To: <20240829052558.3525-12-eugene.loh@oracle.com> (eugene loh's
	message of "Thu, 29 Aug 2024 01:25:51 -0400")
Organization: Gentoo
References: <20240829052558.3525-1-eugene.loh@oracle.com>
	<20240829052558.3525-12-eugene.loh@oracle.com>
Date: Thu, 29 Aug 2024 21:30:50 +0100
Message-ID: <87o75bf4w5.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com> writes:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> We are going to support discovery of new probes after dtrace is
> launched.  For example, there could be a pid or USDT probe with a
> wildcard pid specification that could be matched by a process that
> has not yet started.  Or, a process could load a shared library.
>
> This means the probe map will have to grow.  For now, just wire in
> some headroom, as ugly a hack as this is.
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_bpf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index 70803e3c..75e48962 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -920,7 +920,7 @@ gmap_create_probes(dtrace_hdl_t *dtp)
>  
>  	fd = create_gmap(dtp, "probes", BPF_MAP_TYPE_HASH, sizeof(uint32_t),
>  			 sizeof(dt_bpf_probe_t),
> -			 dt_list_length(&dtp->dt_enablings));
> +			 dt_list_length(&dtp->dt_enablings) + 1000);

I think this might merit a FIXME comment. Also, maybe a static_assert
(or a #define for now with a comment above it saying it's a temporary
hack) to ensure it matches the + 1000 from 'Create the BPF usdt_prids map'?

>  	if (fd == -1)
>  		return -1;
