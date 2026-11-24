Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527796;
	b=A1Eroxyx0xX2jRMzrWy+RkEnA9z4EgHZcI3pnefascimY0bvkWI/RFoDKRV4kMln0fZD
	 Ed6Xj+QHfqlAnAfSI/v94orUPWKMR1heGihlMNfRZ+jgkekA8odeaK09D8eeJka5EMmKl
	 OZQknPOVyx+MyIUF8GBPOeAu5hUGtAc5xTvyQ/+isTNnWFdVLi5+sS7/Upbee7XZW07O7
	 kVYc4RvBcAFvu+2t6aPkPAioM/GnMNwvJXYdITcqXo2CrAcaTzckpR3JVTtEOJYqd0gox
	 L39V/EXXehW8wMqX5hIM+hr1poC7gMEcz8zwTG53AXL11sEqzX3Rw/7bxYtuCgTgrAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527796;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-DCC-wuwien-Metrics;
	bh=9PbrJgXIqvo1FOSeIer7EAlpCsAvVePHaCbebTT9WfI=;
	b=y71hh3VfY1mZnxAKiEb1682FzN2brLSSpN1lXtcV7zKlwNFc6A5VCbk8Z0a6aM437tEk
	 UuIV9gBgrusuVxDSPh1R2cnB0M1qoCWipnUPfY7z20vMyzp3KHuY3Vtlex+dbVT2wNk38
	 B/aI9mokcQMcO1ii4JqK7G3NrZf5QmBAK59sj7R432tq+wLHCl+1sCpRsUnjyy08Pwr6x
	 0UKpXKVFjJP+5zuyHzEUKE0ZkPwI4T/D1c51Poxbo5Sa385X96L7Yf7Dy9H8MK59wFdcG
	 o3cQelhd0FxO0xiumw2TBULAZie0VjG6AtYCBSAwV0s3x0AtbXTHBAIgiu8bFiqN72A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8806F606A327
	for <dtrace@lists.linux.dev>; Tue, 24 Nov 2026 13:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8806F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6AODh6AL020279
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 24 Nov 2026 13:43:11 GMT
From: Nix <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 15/20] libdtrace: search both ELF symbol tables for
 module symbols
In-Reply-To: <au9MFmAqmdIFmrGJ@kvh-deb-bpf>
References: <9a3ef30ca35af2d994b6f8a42a8e6700@oracle.com>
	<87ik2artkr.fsf@esperi.org.uk> <au9MFmAqmdIFmrGJ@kvh-deb-bpf>
Emacs: it's not slow --- it's stately.
Date: Tue, 24 Nov 2026 13:43:06 +0000
Message-ID: <87ik1mibv9.fsf@esperi.org.uk>
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-DCC-wuwien-Metrics: loom 1290; Body=3 Fuz1=3 Fuz2=3

On 7 Nov 2026, Kris Van Hees uttered the following:

> On Fri, Nov 06, 2026 at 01:13:40PM +0000, Nick Alcock wrote:
>> On 30 Oct 2026, Kris Van Hees said:
>>=20
>> > Keep independent symbol and address indices for SHT_SYMTAB and SHT_DYN=
SYM,
>> > loading strings through each table=E2=80=99s sh_link. Search .symtab b=
efore .dynsym
>> > and include dynamic-only names in module symbol iteration.
>>=20
>> Yet noather place where one or the other strtab was overlooked. These
>> mistakes all date right back to Solaris...
>>=20
>> > Preserve .symtab indices for CTF, place dynamic and external symbols in
>> > separate ID ranges, and use .dynsym for CTF when .symtab is absent. Al=
low
>>=20
>> Except in old dicts (CTFv2, or v3 in the absence of the CTF_F_DYNSTR
>> dict flag), .dynsym should be searched unconditionally for CTF.
>> Preferring the symtab is wrong. (I suspect this code is basically never
>> run, since it's all symtypetab stuff, and the symtypetab isn't emitted
>> for kernel CTF.)
>
> So are you saying that this should be updated (and some other existing
> code) to give preference to .dynsym for lookups, and fallback to .symtab
> if the symbol is not found in .dynsym?

At the very least. libctf simply never looks in .symtab at all unless
the appropriate bug-compat flag is turned on. For you (without easy
access to info on whether that flag is set), it makes most sense to
check both as you suggest.

--=20
NULL && (void)
