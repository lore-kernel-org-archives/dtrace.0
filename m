Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969591;
	b=CiI+lhKjMyDgUMQ3zf76lgrh/pKeoQ2c4AiwDc9TYuycjLYDy5R1/XTyF5DonQG1BAnK
	 IdxtpgZOl2ViUsM8tanTfrKUfbxXmfUL3IPR1nfhAHmZadu/GwGcYEvCrR+IVdlHyKmsJ
	 Ibkkd43q9wem5ayVgqQDC+kVjGiCRQugJG5R1o9oJdp8S5SNPxu65C1gDLrobDefzOxzy
	 29pxr3nAZLGvi59DesjXAKl/X+O2I5sdO7H1/JP/NnylvJqYnHCxiaJpG+WSJpTNvi43V
	 AJ9HBuKJYn+hWRJD+VfcPP2efUfd6YCXDoFlPNemkPeHnChyPbqW4NOYSk0AqJTaoMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969591;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-DCC--Metrics;
	bh=mKHQlrOL80K2TmIhizlsjD43FNnbb2aAqyhYLlxqGyE=;
	b=rm6nwUWiFqlIdONX+IBWPYv2CpifF8pozq4wh042HWcWtoyGTbWfPut2tv1u3dFLBOTV
	 2F+YSYQuqpVrWlxG6rgh/H56+9mRPMJ0l/HY9vMJiyXA8XQSU3ahWbpXmYEEVtGacbbEA
	 DGXvRi1br0HttcLGAQ7LEDB6wDRVXMWquGXnSBD2Xr6gngRGGq0DF/KOk67BwwpLVAhmR
	 8gbXBvXG75nw5HutbDvQmIcjM9C9gtIriiagSSPedEAQh+6uls7Ypaiqzv4jQa2x9Ku10
	 dKBIEYDzLYaJu8209zefGIH2l5RF6BJKCS8dRnsMmnzgvQxyXJsH3MP94+05Fm/jU5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82658606A329
	for <dtrace@lists.linux.dev>; Fri,  6 Nov 2026 12:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82658606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6A6Cr6mn014608
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 12:53:06 GMT
From: Nix <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 06/20] btf: convert kernel types to CTF on demand
In-Reply-To: <155d3efad06100688e3878b86d99cdd7@oracle.com>
References: <155d3efad06100688e3878b86d99cdd7@oracle.com>
Emacs: more than just a Lisp interpreter, a text editor as well!
Date: Fri, 06 Nov 2026 12:53:06 +0000
Message-ID: <87qzgyt93h.fsf@esperi.org.uk>
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

> Index BTF type names while decoding, and initialize CTF dictionaries without
> converting every BTF type.  Materialize requested named types and their
> reachable dependencies through a common CTF lookup helper, including direct
> compiler and provider lookups of shared kernel types.

Nice speedup!

> Reserve aggregate shells before converting references so recursive typedefs

Maybe 'wrappers'? 'Skeletons'? Shells seems a bit... strange to me,
terminology-wise. (Also, 'shell' is rather overloaded in Unix already.)

> and callback prototypes work regardless of the requested root.  Grow the
> shared parent dictionary lazily for split BTF, and roll back newly added
> CTF types and cache entries when conversion fails.  Prefer available
> aggregate definitions over forward references.
>
> Advance the BTF function parameter iterator and preserve packed member
> offsets so converted prototypes and conversion retries retain their BTF
> information.
>
> Reject split conversion when archive-backed shared CTF has no matching
> BTF-to-CTF parent mapping, leaving the module to the existing CTF fallback.
> Keep this guard with lazy conversion so provider header generation also
> works when the kernel CTF archive is present.
>
> Add synthetic coverage for lazy conversion, recursive graphs, pointer
> lookups, bitfields, forwards, split and parent-only BTF, failure recovery,
> and ordinary CTF dictionaries.

There doesn't seem to be any attempt to preserve IDs here -- I guess we
don't care? (In particular, aggregate types end up in a completely
different place in the type ID space than they did before, before
everything else... which makes me worry slightly, though it *should*
work.)

-- 
NULL && (void)
