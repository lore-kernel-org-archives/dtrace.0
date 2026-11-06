Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968842;
	b=Ia+TiZdft/jIUHx1k7j749mSIdJ3WaqEMQy6b9XetMVSL92utLTFo8c71hPLyM+g0vvl
	 IG0dGIfo1QogKPSzsnjsA2FOaYTTAjBtMerguOnec+ZG/y//YeCY1vJlN9My6YpOfe4oO
	 tn8wQyoO61Ys3nfwMe5fQ9EEef1wf0z0n1oW1pe7MQh3MBO7am7WvzrZcv/HOv+hHTFpc
	 7vZQkS/BF7zzu9f7VDxPfLLxr/vsWClVRV0MCT/XziTFc2i3HD4dC1QqD+Ffb2daQocjV
	 YzoRi7nNP8m1+CXa09LJm5jH8HrtKkhKa8vMgW9h1VAkVqBWu7nhPSK0XKD7BP7upOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968842;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-DCC--Metrics;
	bh=3mHaTLVM7T/jOP+4ahs5dt6bJ37viwpkKHwd3OJHI1k=;
	b=ZSbk+rkensN/1zNk4LBr7mwpNgZOR7ruNio8TVZrkV251hGQVLq3N9jUFb5VkUs0clRT
	 ftoKIm//VHDYf6FtIfjp2n+dLe2DniNRClz+YujTQZZMwTOB84hWUGaz3kdmjBsmCfYqG
	 upqZ1IZKgwRpbscXRAr+mAPo4VnyThBoXaFaHE2eEizbK3INX3V8DxTS1Ool8yAJ/aOBo
	 FpPJjotKSFLtYrHr4OixgZ18jS/rzp/bXAYec6HsNDD337PhoQEFUe8JDigpKK6YVtpzO
	 V+H2jO2CWABBYQanZo+Mo/VaEzNcOqzqZjpOl2squO8sLVO3gosSBILYnzjgtLac6lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953E6606A326
	for <dtrace@lists.linux.dev>; Fri,  6 Nov 2026 12:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 953E6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6A6CeZYW014232
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 12:40:36 GMT
From: Nix <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 03/20] ctf: give shared kernel types a synthetic module
 owner
In-Reply-To: <307cf8d7cbf63295d5448222112686f5@oracle.com>
References: <307cf8d7cbf63295d5448222112686f5@oracle.com>
Emacs: if SIGINT doesn't work, try a tranquilizer.
Date: Fri, 06 Nov 2026 12:40:35 +0000
Message-ID: <874iduuo8s.fsf@esperi.org.uk>
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

On 30 Oct 2026, Kris Van Hees stated:

> Store the shared dictionary in shared_ctf->dm_ctfp and remove dt_shared_ctf
> from the DTrace handle.

This is effectively reversing a change I made ten years ago :P because
having it as a separate module was too problematic given that it didn't
correspond to a *real* module any more (in particular, we don't want
people to be able to look it up by name with `, etc.)

As far as I could tell, all the advantages of being a module were
actually disadvantages for the shared dict, and no advantages were left.
It's not actually a module, and none of the things you can do to modules
should be doable on the shared CTF, and it didn't make the code simpler
to conflate the two either.

So... what benefits does this bring?

-- 
NULL && (void)
