Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969141;
	b=gPBhmpn1BHY88cwBi5Hx6bNNTUFdXJCNP0RUgnTzSH0Hv3uAgONO03P3IVBjZ65HTgka
	 QoySxAG037VbE4/Um+Rc44zrsXj5EgMX2RzoLNnOWKMk6kuzz4zWpJ0CtSg3fMWMjTifq
	 5q1BsY9dTc+pAtc749HiQ7arFyYUVpHZkX126u/tRDFgQIlUIMz5Xj+m99t+UMJy7Wx3i
	 iM0JDdu/qJSHXFxgUrZcKo9etjXnTbJKuO12y7SIJjipcFa4uNZDuxtzNoSEd4YVsiSOv
	 JVUVKJKOZjxvcLr3P9ZZ3fqc0VTxq+0ihDoPJQVBPrxzMOzY08W0ZWqNB3LaJ94qWtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969141;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-DCC--Metrics;
	bh=nmhAhSp+D7EM/EP/crF3FYSAA2U5j3OKUkb6grmTPKo=;
	b=hhfoavHCrOqoEcxbDLBBAm9xdFiLNCwe1+OmqFvyG0K/ILoJ1iC98BI0jyjev3qV9jL7
	 i8VvtME/an8XjTFl2XeBoV3MRfQrwbDmFuSsvs4DHQZ5HlqdRWYwexGn6k1zsINjSyqJO
	 FheBbmc6gGDh7xeYcE/MhVM4l1iDh0jUlhCxwvIlEl8sW5LFBHGFUF3L2WoK3owl+LNOq
	 cAYgpnLenoOmj+dWBcdh/wO1TzAqCXAj+tDsYDc1w6kFWCl/X0gWE+qnuWXk7/kuLDrKq
	 udCaFdJIIjlZMmydmRAzDmBZQ08uhY6y2QM3n4bgp0+DFzBfsTuwtD8XCa5RZw6vOSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16F0606A336
	for <dtrace@lists.linux.dev>; Fri,  6 Nov 2026 12:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C16F0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6A6CjZFY014372
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 12:45:36 GMT
From: Nick Alcock <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 04/20] btf: deprecate dt_shared_btf and introduce
 btf->parent instead
In-Reply-To: <031b190cb7679c63673baf89f0389b9a@oracle.com>
References: <031b190cb7679c63673baf89f0389b9a@oracle.com>
Emacs: resistance is futile; you will be assimilated and byte-compiled.
Date: Fri, 06 Nov 2026 12:45:35 +0000
Message-ID: <87zevmt9g0.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-DCC--Metrics: loom 1102; Body=3 Fuz1=3 Fuz2=3

On 30 Oct 2026, Kris Van Hees uttered the following:

> All module BTF (except vmlinux) share a common ancestor (the BTF data of
> the vmlinux module).  Represent this with a btf->parent reference.
>
> For vmlinux, btf->parent will be NULL.

This seems like a good idea regardless.

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nix@esperi.org.uk>

> ---
>  libdtrace/dt_btf.c                        | 517 +++++++++++++---------
>  libdtrace/dt_btf.h                        |  19 +-
>  libdtrace/dt_impl.h                       |   2 +-
>  libdtrace/dt_module.c                     |  18 +-
>  libdtrace/dt_open.c                       |   2 -
>  libdtrace/dt_prov_fbt.c                   |  16 +-
>  test/unittest/btf/test.x                  |   8 +
>  test/unittest/btf/tst.elf-vmlinux.sh      |  31 ++
>  test/unittest/btf/tst.elf-vmlinux.x       |   8 +
>  test/unittest/btf/tst.invalid-fallback.sh |  31 ++
>  test/unittest/btf/tst.invalid-fallback.x  |   8 +
>  test/unittest/btf/tst.module-btf.sh       |  46 ++
>  test/unittest/btf/tst.module-btf.x        |  13 +
>  test/unittest/btf/tst.module-local.sh     |  63 +++
>  test/unittest/btf/tst.module-local.x      |  18 +
>  test/unittest/btf/tst.module-parent.sh    |  46 ++
>  test/unittest/btf/tst.module-parent.x     |  13 +
>  test/unittest/btf/tst.raw-vmlinux.sh      |  30 ++
>  test/unittest/options/tst.ctf-only.sh     |  27 ++
>  test/unittest/options/tst.ctf-only.x      |   8 +
>  20 files changed, 693 insertions(+), 231 deletions(-)
>  create mode 100755 test/unittest/btf/test.x
>  create mode 100755 test/unittest/btf/tst.elf-vmlinux.sh
>  create mode 100755 test/unittest/btf/tst.elf-vmlinux.x
>  create mode 100755 test/unittest/btf/tst.invalid-fallback.sh
>  create mode 100755 test/unittest/btf/tst.invalid-fallback.x
>  create mode 100755 test/unittest/btf/tst.module-btf.sh
>  create mode 100755 test/unittest/btf/tst.module-btf.x
>  create mode 100755 test/unittest/btf/tst.module-local.sh
>  create mode 100755 test/unittest/btf/tst.module-local.x
>  create mode 100755 test/unittest/btf/tst.module-parent.sh
>  create mode 100755 test/unittest/btf/tst.module-parent.x
>  create mode 100755 test/unittest/btf/tst.raw-vmlinux.sh
>  create mode 100755 test/unittest/options/tst.ctf-only.sh
>  create mode 100755 test/unittest/options/tst.ctf-only.x
>
> diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
> index dce44987..194a251c 100644
> --- a/libdtrace/dt_btf.c
> +++ b/libdtrace/dt_btf.c
> @@ -32,8 +32,8 @@ struct dt_btf {
>  	size_t		size;			/* raw BTF data size */
>  	btf_header_t	*hdr;			/* BTF header */
>  	char		*sdata;			/* string data */
> -	uint32_t	ssize;			/* string data size */

(this seems to be unused, so dropping it is ok.)

> +	/*
> +	 * If we were not able to read the BTF data, and we are constructing
> +	 * 'shared_ctf', we need space for the default 'void' type.
> +	 */

Isn't shared_ctf already gone by this point?

-- 
NULL && (void)
