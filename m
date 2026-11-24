Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534587;
	b=Z9RoVe2PM8Dxi8GACEehx2QXLscf2BV1VNA8lZ4IQBkGmvaiO6AmVa0R5jHf/Fag9HVM
	 XAzcPcHuYTytA8UjhZIcRyBpA677JH49N9I/wiM4GmISJv64/fn7hvDNrD0dB2HsBD7WL
	 bgbS1/mLTEvN5kYVLxcuxKn9RTe+r2geKDF98qIjbEuXqsA1ve3sHHz7wDmh6aB8EejHi
	 xTuJiP4OT5Hg6fiXYX03z28OT0C4iq5UfanpfqIANh3xAoOWiB8XCvJ9vYQUum9UAlxfB
	 3Vj6flPP+yIA8iqi8sxXs0dQirtAwz4WwcA+p2c4KdsFiFjVTYJZ/BunTzzuBYo9F8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534587;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-DCC--Metrics;
	bh=qenIgANk3cWfmgbCLmYKwvwCHl39qH1Nc1AaR0Yp8zo=;
	b=WsqeA6l7x1Fykr5ik00O/hm/6IlYVEuVLpvInW5PYYCLTdB4kK8tobd21NrJ5I7Kb3ph
	 5ctWzRKr3hDIW3anQbD0tcFblqX2MEwN3ke+zrY8cUzSlSIm8JLIkLearl24FlC8Navut
	 4ES16wZ0wKiHWzUVO3YRBHuX00CnH6g/cGdcH5SDAE2GPCso4O56vWH6ETLndufhfZB1Y
	 b45nMWKW0Kamz/nSCkVSf0i99MRRd3FSp3o148qgY52xcuBVdOzmusTxoCRKIf+W3FrCH
	 0f+9Tcr+qWwZqDCY4HVUb8mlp52/wxml/Kz+JzfZqheakAjBJt3SWnpqltex3+g28tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F71606A31E
	for <dtrace@lists.linux.dev>; Tue, 24 Nov 2026 15:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40F71606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6AOFaN8L023016
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 24 Nov 2026 15:36:23 GMT
From: Nick Alcock <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 04/20] btf: deprecate dt_shared_btf and introduce
 btf->parent instead
In-Reply-To: <au9GHLiocuIxRTZ6@kvh-deb-bpf>
References: <031b190cb7679c63673baf89f0389b9a@oracle.com>
	<87zevmt9g0.fsf@esperi.org.uk> <au9GHLiocuIxRTZ6@kvh-deb-bpf>
Emacs: ed  ::  20-megaton hydrogen bomb : firecracker
Date: Tue, 24 Nov 2026 15:36:23 +0000
Message-ID: <87qzgags20.fsf@esperi.org.uk>
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

> On Fri, Nov 06, 2026 at 12:45:35PM +0000, Nick Alcock wrote:
>> On 30 Oct 2026, Kris Van Hees uttered the following:
> <...>
>> > +	/*
>> > +	 * If we were not able to read the BTF data, and we are constructing
>> > +	 * 'shared_ctf', we need space for the default 'void' type.
>> > +	 */
>> 
>> Isn't shared_ctf already gone by this point?
>
> This is referring to the "shared_ctf" pseudo-module.

Oh right. (As noted, I suspect this pseudo-module can be replaced by just
keeping around a shared_ctf ctf_dict pointer and calling ctf_ref() on it
when you clone up a new handle.)

-- 
NULL && (void)
