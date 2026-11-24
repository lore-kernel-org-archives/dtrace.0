Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534200;
	b=y9L5VcjBqxJTi0okS+WAN6NftqX/XjHdIU06w0v0OCxy2xoqyrJ3Me8dBHbfBfMn+2ng
	 TMcRnqeo/peKMnrd0y0QYcGwTjDbx3FF6dh1gaN8UEdQ8x1E8clULur9SLO+WpS4WlSZS
	 lN7St8Yic4wcKdHFdD3R/ChM0sX3+A7yD6UGFcunOHzoc/cfafeOThnuI2heFPkjhQLXw
	 KT5pvZKVtTCEPLwKA4vcFFAcdHqVsBmuKLTQDoKIbWRTuuZ9E0CGdtYBzICyedn+gkQZo
	 FpJJiFD5uqmhoth83hOYexCRloBpL4NAlyAvchP+UrszSnIdijjHQcO2GZUXkpLOYPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534200;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-DCC--Metrics;
	bh=G912j6CnY0O79HrZ78q/Ox8akdGdtWh3yrA+KUct3wQ=;
	b=YrvnUe9YnPxIbWqWb6UnrDmbEjZ6fE658wiexg8+6loVruRPqZzcYyeQ0/d8Yp3vm9cW
	 2CqWMnPSQmv+i/1TAbgHVuMc/qSuZazNRL+t/EH61+5MWy5p6auRlwOxfRjEs9dWB0CqA
	 d18U29jtVeTNfCVcR8YHyZCLbHMbJ3bd8y5Xq6dc7pZ7ljysm/99mAjkttrGdtQfNDpGd
	 a/PFv+nV3Vy/PVuCrRF1VwMelZY66ENGPRlTwxAkW/1lSt4kpFUwbK1L9TiSINe1vmyb2
	 +IVfWQv6u8lPubpJDie8MUenC8ES1jvrlYqjUmJrnQIsSCQcvqsTbKE6Aksi/+yIwxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BED8606A323
	for <dtrace@lists.linux.dev>; Tue, 24 Nov 2026 15:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BED8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6AOFTsmT022779
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 24 Nov 2026 15:29:55 GMT
From: Nick Alcock <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 02/20] libdtrace: retain module metadata across
 incremental discovery
In-Reply-To: <auy9ycnMQuLGDW4V@oracle.com>
References: <10c34e1100164e736b99534a57e74cfa@oracle.com>
	<878q37usm6.fsf@esperi.org.uk> <auy9ycnMQuLGDW4V@oracle.com>
Emacs: impress your (remaining) friends and neighbors.
Date: Tue, 24 Nov 2026 15:29:54 +0000
Message-ID: <87zeuygsct.fsf@esperi.org.uk>
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

On 5 Nov 2026, Kris Van Hees outgrape:

> On Thu, Nov 05, 2026 at 04:53:53PM +0000, Nick Alcock wrote:
>> On 30 Oct 2026, Kris Van Hees spake thusly:
>> 
>> > Stop unloading cached modules in dtrace_update(), including vmlinux. Keep
>> > discovered symbol tables, ranges, types, and BTF IDs for the handle lifetime
>> > while collecting newly loaded modules. Module disappearance or reloading no
>> > longer replaces cached metadata.
>> 
>> Hm. Interesting. I considered doing this back in the day but more or
>> less immediately hit problems with wanting to remove dtrace.ko and
>> loading a modified one.
>
> Since we no longer have a dtrace.ko, that is not an issue.

My point was that people who are trying to debug kernel modules are
going to want the new one to be picked up if they reload it -- but it
looks like you are doing so, you just keep the old one around as well.

>> I guess we don't care about replacement of modules with bugfixed ones
>> any more? (What happens if someone does it?)
>
> Well, is a module is unloaded and reloaded with a different content, then an
> active tracing session already will face trouble because there is e.g. a
> potential that addresses were put in the trace buffer based on the old version
> of the module, but symbol resolution takes place in the consumer using the new
> version, and thus you get wrong results.  Of ocurse, that would be (possibly)

Yeah.  Ideally this would be a good quality-of-life thing (if you unload
an dmoule and load a new one, of course you want foo` to refer to the
new foo.ko now, not the dead one) -- but given this, it's actually
desirable to keep foo` referring to the old one, since we can't
recompile and re-resolve everything.

> of short duration - but either way, the system changing underneath us is just
> not a case that we can really deal with.  That was something we could deal with

Yeah.

> much better when dtrace had an important piece living in the kernel because we
> could (in a pretty seamless way) re-enable probes based on the enablings that
> were stored in the kernel.  Now we would have to react to a module unloading
> and reloading from userspace which means there would be delays and all kinds of
> side effects that would disrupt ongoing tracing anyway.

I suspect most of those side effects existed anyway, since it's not like
we halted every running process while the enablings were adjusted.
Putting things in userspace just makes them (a lot) more obvious.

>> > Separate failed ELF-load cleanup from module destruction, retaining the
>> > existing handle ownership of shared CTF and BTF. Document the new lifetime
>> > contract and cover incremental discovery with both kernel symbol formats.
>> 
>> (I don't really know what this series is for, or why you're doing this.
>> Is the point of this incremental discovery? Or is it just that the
>> compiler resolves these things to addresses, so having them change just
>> causes trouble because the resolution is already done? If so, this seems
>> reasonable -- one hopes that the verifier would trap cases where the
>> addresses used now resolve to something else.)
>
> Combination of all the above :)  The main purpose is remove complexity that is
> no longer really beneficial to the operation of DTrace, and also to makes it
> easier to simply and streamline the code that handles modules symbol and type
> data - the extra complexity was lowering performance without really offering
> much of a benefit.

Makes sense. If we want to dynamically adjust to changing module sets,
we wouldn't do it like this any more anyway :)


NULL && (void)
