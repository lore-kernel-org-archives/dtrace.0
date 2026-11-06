Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793970989;
	b=XVH+GQ1+PnNEgm0KVfGx1vK7Z2G1DAxKMOJMiEg1mgXH/14H85zda4eRjIGaqjPaT2HT
	 XvAic1CAabxK4aExzww8Lj4QtxR9+1BwNKhBrnWZ7Ref5HBe+RxGGXTpNVP35iEf+wleL
	 9q6pV9oY4gSUvw0bjGIbVZpLhQl12dVnazdkUBNKZ4e7REp+QNCfgruulejpmIr6gKK0S
	 KLdt6pJ104SBqtrvzcNsREQbr2DOhMQx8WcJs1PdaLEVnncU8uR9+ALnwIc5hjFBIeKjM
	 VrB7+TJVSpmBXeDH4NeQjGGz8vesNSMVd98NrDi1NbT8K1FJpFV0kLzldFSP7E2kojQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970989;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-DCC-wuwien-Metrics;
	bh=g3CbzMQEUcy//uxV1kuIHHcVRBPN8/bAsBhBVnDkY88=;
	b=G5kChVl1bzl6w27U1N0/XuCkzm4OJmB4aAvHL6e+ket+Ydb84b9ASp7KOtkpzne4PRFS
	 NWodns90wF1M6QHehoorn5jPmkcyZ+hq1gCglRUMiIScuf/Q6SG7Ea1F3KMoEcXgpQqnb
	 HnWSUsmltTWU/FO+Wdtfqk9agFI4GOyLmnZIpgN4rYteCLr2ZKNogc5JujW9J43jer+Fl
	 WvRvYePb7igOtCrHDAloAA0DstmuhI77t5JPbvjjEacb3cb8GrKO4qsODN1LTIAX71wlV
	 E8GqpqHmLrrk08+nc93KE9ffZF315U+0klo97roOn6CLtih2UFB+45wffGV6M/pcQZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08251606A330
	for <dtrace@lists.linux.dev>; Fri,  6 Nov 2026 13:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08251606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6A6DGP1K015253
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 13:16:25 GMT
From: Nick Alcock <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 15/20] libdtrace: search both ELF symbol tables for
 module symbols
In-Reply-To: <87ik2artkr.fsf@esperi.org.uk>
References: <9a3ef30ca35af2d994b6f8a42a8e6700@oracle.com>
	<87ik2artkr.fsf@esperi.org.uk>
Emacs: the only text editor known to get indigestion.
Date: Fri, 06 Nov 2026 13:16:24 +0000
Message-ID: <877biqrtg7.fsf@esperi.org.uk>
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

On 6 Nov 2026, Nick Alcock said:

> On 30 Oct 2026, Kris Van Hees said:
>
>> Keep independent symbol and address indices for SHT_SYMTAB and SHT_DYNSY=
M,
>> loading strings through each table=E2=80=99s sh_link. Search .symtab bef=
ore .dynsym
>> and include dynamic-only names in module symbol iteration.
>
> Yet noather place where one or the other strtab was overlooked. These
> mistakes all date right back to Solaris...
>
>> Preserve .symtab indices for CTF, place dynamic and external symbols in
>> separate ID ranges, and use .dynsym for CTF when .symtab is absent. Allow
>
> Except in old dicts (CTFv2, or v3 in the absence of the CTF_F_DYNSTR
> dict flag), .dynsym should be searched unconditionally for CTF.
> Preferring the symtab is wrong. (I suspect this code is basically never
> run, since it's all symtypetab stuff, and the symtypetab isn't emitted
> for kernel CTF.)

... oh wait, this is for uprobes. The symtab in use for that follows the
above rules then (and libctf does the symtypetab lookup for you, if
uprobes is using that. Don't implement it yourself simply because CTFv4
redoes this completely while retaining almost the same user-visible API,
and you don't want to change everything twice! v4 always uses the
dynsymtab, unconditionally.)

--=20
NULL && (void)
