Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534472;
	b=nDgsdsL3m4hRBNVXO6oVJJLDzKpdltEceKGpWNVF5TD0IsndXqpQVBQGoglwxik/z3gp
	 P6D4CWZm1+p0ezowalfhnVFZjz78PhP2saGxEqiPUoxNc4iYBGwOE9Gz/ReVUAbgZPjLT
	 +yyDHEn9LFyq7OKHrTYmybTKPvDKJuGcAD08pC5tCHhTAGuannXsvxFcX1fljMCM0ifer
	 bFt1q1pfVA88YcsG4T2dtAncHbcCUoRo/jkrJ5V6oM3TPNvHN5RiLG/stAvWXhkfCOY9X
	 aq3T9aZTsgXxUICRpTUkakL3w9scnyvwYCrw5EvTbeMJR9u8olH/pn1wrJcBlXAww3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534472;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-DCC--Metrics;
	bh=2lsVuvIQkSCrjLrPH7iuUSFP7G+HvHT608+/hrXexh4=;
	b=DRkaei/aLuxuNVcszjWaOzPVWc3ALhwkFcw2dBOL6cO+voMJxYOcwJTBZnsR9bk/Ocmt
	 nGW9xk9t35/VkeZM2a2KASFZ92tKxeoYwyBWbSL+vpqSFZ0YYMqKIkNTJKaxiLkD8dZnz
	 NrLlKuH9/CjRf9/kZ2rvL+Wz+Ee8pGWgzt/nzQq+22A1V3m4y6MryVt3ody23AlFqrz6e
	 wrXPHZ/iI9+XxWv7wnX9qlkqUFeE/dE93yiCK9Zf6tjVGUCTkxAK1emTfPrGrm1q5X6Vi
	 NZdo0yQ+Y3bfP3lahUHiVeT/QZomvITlfy5cDTrNU0q6Om6IAcG7SB0JTHY01cq43Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38258606A31E
	for <dtrace@lists.linux.dev>; Tue, 24 Nov 2026 15:34:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38258606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6AOFYS9c022932
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 24 Nov 2026 15:34:28 GMT
From: Nick Alcock <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 03/20] ctf: give shared kernel types a synthetic module
 owner
In-Reply-To: <au5C9hJYCjivlKhJ@oracle.com>
References: <307cf8d7cbf63295d5448222112686f5@oracle.com>
	<874iduuo8s.fsf@esperi.org.uk> <au5C9hJYCjivlKhJ@oracle.com>
Emacs: no job too big... no job.
Date: Tue, 24 Nov 2026 15:34:28 +0000
Message-ID: <87v75mgs57.fsf@esperi.org.uk>
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

On 6 Nov 2026, Kris Van Hees verbalised:

> On Fri, Nov 06, 2026 at 12:40:35PM +0000, Nix wrote:
>> On 30 Oct 2026, Kris Van Hees stated:
>> 
>> > Store the shared dictionary in shared_ctf->dm_ctfp and remove dt_shared_ctf
>> > from the DTrace handle.
>> 
>> This is effectively reversing a change I made ten years ago :P because
>> having it as a separate module was too problematic given that it didn't
>> correspond to a *real* module any more (in particular, we don't want
>> people to be able to look it up by name with `, etc.)
>> 
>> As far as I could tell, all the advantages of being a module were
>> actually disadvantages for the shared dict, and no advantages were left.
>> It's not actually a module, and none of the things you can do to modules
>> should be doable on the shared CTF, and it didn't make the code simpler
>> to conflate the two either.
>> 
>> So... what benefits does this bring?
>
> It makes it cleaner to be able to e.g. share the module data between multiple
> handles within the same process (which we will be doing with the PCP support
> Alan contributed).  It also avoids needing to store the shared_ctf data in the
> handle itself, because it is truly associated with kernel module data.

It... is? I dropped it because there was literally nothing in the
dt_module that actually related to the shared, because it was *not* a
module. I'm wondering if what we're missing here is a layer of
abstraction between modules (which have address ranges, names, probes
associated with them etc) and the CTF stuff, so that modules connect to
one of those, and so dos the shared CTF etc, while still not having the
shared CTF appear to be a module, since it really isn't one.

For sharing stuff between multiple handles, I guess what we really want
is for shared_ctf to be refcounted -- which, conveniently, it already
is! Of course, libdtrace-ctf provides no way to get access to it, but
you shuold find that calling ctf_ref() on a dict will suffice to bump
its refcount when you stuff it into another handle. That might be all
you need. No need to keep around the whole module thing just to
implement a refcount :)

-- 
NULL && (void)
