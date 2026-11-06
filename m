Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969700;
	b=1QU1TjTGMa/b5o2RKkRpZ3sMn4Eeus0eb6p5uOqPXKcBtt49gSLqhVbGrAx6HGcEG/QZ
	 Sm01liWDiv482AWEPUGFET1jIoVSzTc5odsWn112EUpzg7Pt9o2CO+e5roP7CJTNq3c3q
	 4hMj7Y/+KpIIBSYHBo9EtTYkI4cLnxzs/Q5c5BRgjU9O6KTUM5GSrxhAbvrFtf8T/vhX1
	 WOwbNMXZ0VKUjuiSc8egeZHhPWrbjbOCzx/siUObf3bO3Vjmm9gEasYTu2xOwgpeK8uxh
	 NKNyfjpjB97CpTGoAxFgd93faU3Jmsj4KRHciibbBy+eXJ+O4jXvSlZwL+FDUp535GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969700;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-DCC--Metrics;
	bh=B/9M1YkKvZe4Pdhq4+KCS+u5KTWVv2gTpLCGv0A0/qk=;
	b=1YcY5oPK7TcK9SfL92FMcGVZl0FHZO3vtxV8qWt+rPBniYYfzpiW+BrSplnOPYXA9yNa
	 E4w8UXR/tqrmBPuzzhVJBcV1WKpCO5knTFVH6M6uWpZWfg3bD6qfXGWxwcAxpD1GnpEWp
	 6/1xKzbRvGKJbzhVXPjfoO/Ux/Mb64v23Iy5qM+J4WcTJFgtNaCyW4/dEI+f6A5JkdLPv
	 gNtLyj+By+Ghc3qegRkFqe2OdAkGo0gZ4fjMnMK3N5yRUIdUnsudxduAnMH8aZMUNVoB/
	 ga9c1tmYAyRs0sz5RN45Vvl180uz5Qov4UWlt/SKin5DGaL1rAtkNTIbU86/hKRiaxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20DA606A326
	for <dtrace@lists.linux.dev>; Fri,  6 Nov 2026 12:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D20DA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6A6CstQu014663
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 12:54:56 GMT
From: Nick Alcock <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 08/20] libdtrace: grow module address ranges geometrically
In-Reply-To: <aa68020442985d905ffea22f1039e4eb@oracle.com>
References: <aa68020442985d905ffea22f1039e4eb@oracle.com>
Emacs: is that a Lisp interpreter in your editor, or are you just happy to
 see me?
Date: Fri, 06 Nov 2026 12:54:55 +0000
Message-ID: <87ik2at90g.fsf@esperi.org.uk>
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

On 30 Oct 2026, Kris Van Hees verbalised:

> ---
>  libdtrace/dt_impl.h   |  2 ++
>  libdtrace/dt_module.c | 21 +++++++++++++++------
>  2 files changed, 17 insertions(+), 6 deletions(-)

I honestly thought we were already doing this.

Reviewed-by: Nick Alcock <nix@esperi.org.uk>

> -	new_range = realloc(*range, sizeof(struct dtrace_addr_range) *
> -	    (*size+1));

Ew. I am ashamed (though addr ranges are rare enough that it's probably
not *disastrous*, it's not good).

-- 
NULL && (void)
