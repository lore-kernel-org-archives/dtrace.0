Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793970050;
	b=r34sppS4Y5Boaxy+gYAxOexJL/2wJPLrDpADCgHZTJZImXu6gcAlGTRF2l3DR72edWv8
	 MVhwX0Zd7HKhVt0d04Aq6HTe1qiaRZ98bBNcMrgxJ3d5NVH+gVnZMwA1FDnhMqZu0liRB
	 T7ps8CFSqL5rNu9eY1pV4uNEMQp/t73/x3kBv4Xj2CAW26nywcJ7gsoNDGU7psqJWyBA6
	 sdsfiVRvxY8TwyhFAORtH3Dr807Ab2Xx4AiTtogmcakm46tm7H2fsD+0KWIHq9c3qBHQe
	 C97PAdNpF3t7RicPPDTvYvKT5mjbnyS18f6eY2EzB6AyPwuhWpOd+NZva56SbdpLYTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970050;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-DCC--Metrics;
	bh=W6nMOox8yb5ml/7NIVP372irsT3UIqReeG5cihQd0Rs=;
	b=SjofT1CnFIjzReiwD7IRXG73w3EAPm3nfcNzmeLSOgWBrO/G8OeZ1txoBMo6vWVCcGQB
	 DuWcyejy6huJQXHN8CwhkUg0RdyMmizIOcX+Enpw7ba3O2cyy0gvqmHN7HVtn6t+CI07B
	 1DUtV38SDLIwWso7g5i1Ngdtv7u2EKsrMjyW42LmP4SHAVho+3Py/FfE9xbsSLL3L1Z/y
	 QBgl5tUstSBV8u9AHky1EIzaTFYLWl8PhsRlBhzDAhW3XX6wjZmMdddQJuFFGciIL415V
	 12U3OMc+PRqYIXi5ZUTnYvXDj0wg1yiukgIT4VKcc6+MK4dJ13Jt4Q9XWKRGpvY2kqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFA4606A329
	for <dtrace@lists.linux.dev>; Fri,  6 Nov 2026 13:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FFA4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6A6D0jmF014849
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 13:00:46 GMT
From: Nick Alcock <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 11/20] libdtrace: cache missing kernel CTF archives
 until paths change
In-Reply-To: <24b4b0f9f1f1b21146f37d5f08386734@oracle.com>
References: <24b4b0f9f1f1b21146f37d5f08386734@oracle.com>
Emacs: because Hell was full.
Date: Fri, 06 Nov 2026 13:00:45 +0000
Message-ID: <875wyat8qq.fsf@esperi.org.uk>
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

On 30 Oct 2026, Kris Van Hees said:

> ---
>  libdtrace/dt_impl.h        |  1 +
>  libdtrace/dt_module.c      | 16 +++++++++++--
>  libdtrace/dt_options.c     |  3 +++
>  test/triggers/Build        |  1 +
>  test/triggers/shared-ctf.c | 49 ++++++++++++++++++++++++++++++++++++++
>  5 files changed, 68 insertions(+), 2 deletions(-)

... why on earth would they ever be missing? Surely fixing that instead
is a good idea? (Or is this something to do with chroots and containers
and the CTFA being in a filesystem path whose meaning will change in the
middle of execution or something?)

-- 
NULL && (void)
