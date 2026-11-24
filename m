Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534727;
	b=4Yl+50+ZlD9HPC8yP4R2sKM3qEuTfVCQGJfCUQt0dAKr0rfR3Yx7gvZDknEQaDqintvc
	 REqK9z8uq3H0jcp7DIrDzZuuZCCFXTYr7KWGKpdV55xFG1qpu7aMjpv/hLGBWe4HkzqBi
	 yGpe9PMDIb/sHxW7kMUjnEaeuqNoGVfMDz1/lcSzL08fm84rONlViYhnAIaTY00zoemws
	 J1l0ykv3hrVqKQJl5lWfN7gKNrhvI/kivgRiHMPYcJYCYACG9RXQykOyXOvpTZn0Any8h
	 W978sj0EQcT16PB/0YU6VvjNvyCGv2j5G7U9ddd92xmhJW/5TdQgh4vdsALeePj0plA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534727;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-DCC--Metrics;
	bh=pRXV8/d6LP70w3aBbPDMY1ocphDQLkbpZwVuXdjGMqg=;
	b=Z7an+jIcnTgJlPKNcviCnAcBHTEOtiQkDmHBBqvl0aL1zH49MWZNEy7SWwD2s7xRAQVd
	 e+1JPtxSYZeU25ovZOOF4JAlNe8CwuLsWNIyMqVmOBzE34+ngOkLDDX9znOL2gHpoRbHI
	 njGSYJFbQm4hlUm+Ea0rCxD4yqrFHAKE8j9rocodAkAEpDr+k4dnNRl1ZZTr629usJWo8
	 68bub2PBTHNJG9butJfRR0ykqJh/GeMwPbeEMfPAREnERBCkWPDBbEGd7qsbOisZhAmvH
	 HkYuj+yL4z9itqMS5bpSXNW4viyE3CJLUaTvSrxvbacrl0aXgZVakiXB1oomvc3o2qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AD8606A31E
	for <dtrace@lists.linux.dev>; Tue, 24 Nov 2026 15:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06AD8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6AOFchwq023090
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 24 Nov 2026 15:38:43 GMT
From: Nick Alcock <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 06/20] btf: convert kernel types to CTF on demand
In-Reply-To: <au9HhRL-aJnNJCiw@kvh-deb-bpf>
References: <155d3efad06100688e3878b86d99cdd7@oracle.com>
	<87qzgyt93h.fsf@esperi.org.uk> <au9HhRL-aJnNJCiw@kvh-deb-bpf>
Emacs: there's a reason it comes with a built-in psychotherapist.
Date: Tue, 24 Nov 2026 15:38:43 +0000
Message-ID: <87mrqygry4.fsf@esperi.org.uk>
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

On 7 Nov 2026, Kris Van Hees outgrape:

> On Fri, Nov 06, 2026 at 12:53:06PM +0000, Nix wrote:
>> On 30 Oct 2026, Kris Van Hees said:
>> 
>> > Index BTF type names while decoding, and initialize CTF dictionaries without
>> > converting every BTF type.  Materialize requested named types and their
>> > reachable dependencies through a common CTF lookup helper, including direct
>> > compiler and provider lookups of shared kernel types.
>> 
>> Nice speedup!
>> 
>> > Reserve aggregate shells before converting references so recursive typedefs
>> 
>> Maybe 'wrappers'? 'Skeletons'? Shells seems a bit... strange to me,
>> terminology-wise. (Also, 'shell' is rather overloaded in Unix already.)
>
> I will go with "werappers".

Without the typo ;P

>> > Add synthetic coverage for lazy conversion, recursive graphs, pointer
>> > lookups, bitfields, forwards, split and parent-only BTF, failure recovery,
>> > and ordinary CTF dictionaries.
>> 
>> There doesn't seem to be any attempt to preserve IDs here -- I guess we
>> don't care? (In particular, aggregate types end up in a completely
>> different place in the type ID space than they did before, before
>> everything else... which makes me worry slightly, though it *should*
>> work.)
>
> As far as I can see, preserving IDs is not really needed, because the
> BTF is of course the authoritative source in this case, and we construct
> the CTF from it.  The construction process is, as far as I can see, safe
> and ensures that IDs are as they ought to be.
> 
> I honestly cannot see any way this can go wrong, even thugh things are
> going to be in a different order.  We never actually care about the
> order, right?

We don't care about the order, but if things refer to the reordered
things by ID, those IDs will now be different (since the IDs and the
ordering are the same thing). But we only refer to things by name,
right? In which case this will be fine. (We were already, in effect,
renumbering everything due to the ctf_add_type() into the D dictionary
whenever a vmlinux type was referenced anyway.)

So:

Reviewed-by: Nick Alcock <nix@esperi.org.uk>

-- 
NULL && (void)
