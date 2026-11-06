Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972415;
	b=eEfI4bOAnQMzLE78RJvML+R7eeO1B2uN+ESX6e/G8+glzXlJOvw8vwb1N7jjnTJU66qC
	 /MFFjeji/hT1l6GnMIGvMPBnbakK38DSi3FVxvHoHSxnG324wxQ/wZkSc+2nsOCya/tvV
	 dQTTTPcOKglgx9N2jo2x3kf/2CuVJAwYkRDO8uLr96Ce3UjGA0zhMKF8Hf9BpqUPIjKc6
	 kjoOcsB+mPWKXS206gL1o2tXlWRUIKm/G/d77CesMEhhc75vZTiKvYYtoC3GTQ27BK0Tt
	 J6CeRSAtwqb4S7EXYmm3eN4PRP9z0+PnGU8VgMrrjv8Y5axiqcVs633DFQ2hTdV0h1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972415;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-DCC-wuwien-Metrics;
	bh=9nDnFRlVYm39sJOJ78v4bMiR+XURU9ehOCA+yspMMkQ=;
	b=h+l3ZOF+5asEFQ1qlO5Gd892sFAn3ipAVgHyIUp/HIjNfWi/c5ZzMYJBd2solig7no6P
	 lxgXYa1DZiv7heqRO3xBuCG4CaQwdJmrRgyidO3TY9rZTXDBPAOczcN7nDCD+SZN1ftuM
	 dwiQt/iqCdseXXh+4Z+JK4ObGCc2J7SpkDX56EnMk0bzwrxVaBHoQ/Q0CFqwrl7DAlFo2
	 GPqVY1SrwXsqdmNs6T+4IrpDcQMqc3Evb1stE8EAEGZNMe4fyFFJYv9mNCN00hJU1eI7A
	 +v21hBczvzL31FppE4rgVKSmVBjQzf6lebpRi+0dGASdQGNnr+azDmTnPMe8khvrICQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3682A606A330
	for <dtrace@lists.linux.dev>; Fri,  6 Nov 2026 13:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3682A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6A6DeAIN015847
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 13:40:11 GMT
From: Nick Alcock <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 19/20] test: fix modpath test
In-Reply-To: <48eb9d0eb1ac2856fe443912ec9a335a@oracle.com>
References: <48eb9d0eb1ac2856fe443912ec9a335a@oracle.com>
Emacs: where editing text is like playing Paganini on a glass harmonica.
Date: Fri, 06 Nov 2026 13:40:10 +0000
Message-ID: <87pkwiqds5.fsf@esperi.org.uk>
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
X-DCC-wuwien-Metrics: loom 1290; Body=3 Fuz1=3 Fuz2=3

On 30 Oct 2026, Kris Van Hees spake thusly:

> The empty CTF case was failing because BTF was still providing the types
> needed through the BTF-to-CTF conversion fallback.

Ow.

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nix@esperi.org.uk>

(the other things this change does are all reasonable cleanups too.)

-- 
NULL && (void)
