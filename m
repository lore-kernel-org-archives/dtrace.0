Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534844;
	b=a7MgUSSyG9HfzqojS8ZqbNqa8sRhytMchGVKhKJDft482AEI1HPfFP7y2dRjeabu/J+c
	 DjHR1KntmEXbyXBDYzllND6FzCJ+FGQ3/0Sgscxs1Sd0IWq9qM7d/Asihev891rad3vHc
	 96H8DtVRBf4GyISk4wsnEczcXqD0ZmCXI+tJLfH7fOxs16O/GJkYBXXHO5LYBfCZh6JaF
	 CkK2R1OGBbKET9CJC6J/dJUWDIrAkkuMgFFQATcb1s3DxsZXJ2WsX4OPUHEUgjV4Ooj7N
	 BU9Vly9pF0bdp32Xy2Th19cnrLhylDki2iY8JvYXIhme+56RzJUiksAjtZQ/jb8yzhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534844;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-DCC--Metrics;
	bh=VBBRbVw/FfVrZn8uZEJEAmS5rLdPQ/BHQxSGAfrhCLk=;
	b=yzUAsByd9JSHcwkwZqIf5InpzPPXFuZmeX1KqhAmb/1L+UolrNT2GYa/kgOBhlXSRGHV
	 tOZrcRL7bKY2cQHoTJqtc9hS599k96kVN9ykEGQrK1dnrj+LhV+XflNJzw/iBbvafa1tl
	 8VHzyBddluPBTQGUp2EW/ecOkwGHo7SYdnL10yQ/j+2+8p7fwduss92ZuTKFw6EZjCPAr
	 YSOZlVkgsE0TCJnPb7NbkdRW4gWEkD+w08Cmo0Q4PCKwLfAteWqoeiD7GUzYOfJ5pbD95
	 aL8zTMbvXIeT+FtP4uqLBOcLmhJ5qdqThxbb4r9K/PwrDPRFIewxQ5YP54EGRTQlX9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289AB606A31E
	for <dtrace@lists.linux.dev>; Tue, 24 Nov 2026 15:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 289AB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6AOFeelk023135
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 24 Nov 2026 15:40:40 GMT
From: Nick Alcock <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 10/20] libdtrace: retain descriptors for cached module
 BTF IDs
In-Reply-To: <au9KzkbyxnlvGB62@kvh-deb-bpf>
References: <56247e0c69f34acca1cc8c20ffafc4bd@oracle.com>
	<87a4nmt8si.fsf@esperi.org.uk> <au9KzkbyxnlvGB62@kvh-deb-bpf>
Emacs: because you deserve a brk today.
Date: Tue, 24 Nov 2026 15:40:40 +0000
Message-ID: <87eccagruv.fsf@esperi.org.uk>
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

On 7 Nov 2026, Kris Van Hees told this:

> On Fri, Nov 06, 2026 at 12:59:41PM +0000, Nix wrote:
>> On 30 Oct 2026, Kris Van Hees outgrape:
>> 
>> > ---
>> >  libdtrace/dt_btf.c               | 79 ++++++++++++++++++++++++++++++--
>> >  libdtrace/dt_impl.h              |  1 +
>> >  libdtrace/dt_open.c              |  1 +
>> >  test/triggers/module-discovery.c | 11 +++++
>> >  4 files changed, 88 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
>> > index 617b0128..727e5f54 100644
>> > --- a/libdtrace/dt_btf.c
>> > +++ b/libdtrace/dt_btf.c
>> > @@ -1479,17 +1479,67 @@ dt_btf_lookup_name_kind(dtrace_hdl_t *dtp, dt_module_t *dmp, const char *name,
>> >  	return id;
>> >  }
>> >  
>> > +/*
>> > + * Retain a descriptor as well as the ID: otherwise an unloaded object's ID
>> > + * could be reused and a later enumeration could mistake it for a cached one.
>> > + * Only IDs assigned to modules are retained, bounding descriptor use by the
>> > + * number of modules discovered by this handle.
>> > + */
>> 
>> I suppose just not reusing IDs in general, and having them only
>> increment, would end up using too many? (I can't remember under what
>> circumstances they're reused, but I didn't think it was *common*.)
>
> The thing is that we have no control over the IDs...  They are provided
> by the BTF subsystem, and we should not make any assumptions about them
> in terms of wether they could be reused or not.
>
>> How it interacts with the earlier change to never remove dt_modules when
>> their corresponding kernel module is unloaded is unclear to me -- is
>> this the bit that ensures that an unloaded module never gets reused (and
>> instead we load a new one if the module is reloaded into the kernel), or
>> what?
>
> This really has to do with the way the BTF subsystem handles modules and
> associates IDs with them.  OUr own view of modules is independent from
> that.

Aha, makes sense.

Reviewed-by: Nick Alcock <nix@esperi.org.uk>

-- 
NULL && (void)
