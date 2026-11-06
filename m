Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969986;
	b=k5mGoK7Cje2I1UWX1T5yna5FkZf0O0yvhQx5GHeCb1KTdRQ/ViXSBcSxUrU4pyUUH/d5
	 B/rkvf8YAzV3RJXYo1aP/IiQb0Qq2J2ehGk3cTR4vXN107Q0mdnE+i3EzMqoAs//XDh/I
	 4YEwfeeYW9vF+r+8JZEv2elRVpnlXCkbGtct9jiihsP250RQKWW4RIroY4Oehe+FN4SCo
	 XS4amR1FuAxfnWPeit0hG18xTclnT/fsFn+YAWmk5JXQE7KLzHHzLWkTpy9ecwgXF/Thc
	 WeAq8lQmaqJSu6MNfmlAOnCRDVaTF4D8IIy+int/PyfpJiMxoVmyxE01jRXAx1agyvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969986;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-DCC--Metrics;
	bh=u2N6+HDBLrHv3Ztyn/cIy5PynhjMrA2ON9GWzSeLT2A=;
	b=4uQ7MZk0wm0akEfhFMUwSmkZifG5mj112omFnJyhH8JDCbc/UeP3ma2zVuoFz6WWe69x
	 XPSamDb4vuCs/Sv16DlVi6Cu3JrwS/frtuQZhF1BBl8skhsuWhBm6nstm3iTHuTwUNCa9
	 i3Ew3a0Ws4tCrMfmwpPjYcP++1tgJAmgHaXH0qpYKGRKfRHlQu2mE34dPlRJYnhYDObbF
	 prjC7hjc1SsrmkFot4TsbFk/qdwRiJJ2mzKLR+Ra6JDqfdZNfjDC0LMG87BuO64X/DRbw
	 23YLsRE0GhQLueo0dMBjRHeO0wHEgR+fHQOoiftQ4Iy6uLZfKrfoZzrDb3Tzxj2lQOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87616606A326
	for <dtrace@lists.linux.dev>; Fri,  6 Nov 2026 12:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87616606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6A6CxfPG014802
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 12:59:42 GMT
From: Nix <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 10/20] libdtrace: retain descriptors for cached module
 BTF IDs
In-Reply-To: <56247e0c69f34acca1cc8c20ffafc4bd@oracle.com>
References: <56247e0c69f34acca1cc8c20ffafc4bd@oracle.com>
Emacs: impress your (remaining) friends and neighbors.
Date: Fri, 06 Nov 2026 12:59:41 +0000
Message-ID: <87a4nmt8si.fsf@esperi.org.uk>
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

On 30 Oct 2026, Kris Van Hees outgrape:

> ---
>  libdtrace/dt_btf.c               | 79 ++++++++++++++++++++++++++++++--
>  libdtrace/dt_impl.h              |  1 +
>  libdtrace/dt_open.c              |  1 +
>  test/triggers/module-discovery.c | 11 +++++
>  4 files changed, 88 insertions(+), 4 deletions(-)
>
> diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
> index 617b0128..727e5f54 100644
> --- a/libdtrace/dt_btf.c
> +++ b/libdtrace/dt_btf.c
> @@ -1479,17 +1479,67 @@ dt_btf_lookup_name_kind(dtrace_hdl_t *dtp, dt_module_t *dmp, const char *name,
>  	return id;
>  }
>  
> +/*
> + * Retain a descriptor as well as the ID: otherwise an unloaded object's ID
> + * could be reused and a later enumeration could mistake it for a cached one.
> + * Only IDs assigned to modules are retained, bounding descriptor use by the
> + * number of modules discovered by this handle.
> + */

I suppose just not reusing IDs in general, and having them only
increment, would end up using too many? (I can't remember under what
circumstances they're reused, but I didn't think it was *common*.)

How it interacts with the earlier change to never remove dt_modules when
their corresponding kernel module is unloaded is unclear to me -- is
this the bit that ensures that an unloaded module never gets reused (and
instead we load a new one if the module is reloaded into the kernel), or
what?

-- 
NULL && (void)
