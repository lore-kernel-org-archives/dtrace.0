Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526822;
	b=SI4zu810tyE64+0dABI+vVlJcsIEurX11DtH8mkM8LsbWluCVYXinwLGGoPoWnJ6OY8h
	 jqYXYQaxns7kSJiCb3+TWy0LLQ7FfJ4x/X1h1CNq13c3/zTp+uMznwP82spFGQsN2UB21
	 1CTT30RZBtf+iy5A3vzR4Ctnt5o4PEq9UfmJavanRifVbjWbApm6wE2Ot40hHr1ptIEd+
	 fl1DikEewqd3V4eIPsPhwt6FyiotEkx7nvg51ElktLqI1kvf+lbDPWhZTFiCYRS8mvYhW
	 FtYUC2gpCd8w9l3n3rxZSHAu0PGCRb1UEw01JfVmztdv3o2rzDEGsd9AAkd2tWr9QMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526822;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-DCC-wuwien-Metrics;
	bh=JwWMDj98crJu+pBehJkMPgC2Y/FkYT1SbPkqob5vS8g=;
	b=AD0TXzYN283pSXCKFpFIxc60T18QJ4LoZ/Q5lm8kK59gqEfQQXhJOfgsIUJ72xZYEHvm
	 MMUqAw7t8gCIEHyyES24wyQ5deGg0iqfttkDsc4RMwsolzt4Qo+iI3B/Uz4XqJiu5UxUE
	 8LUZ08DBhSUJumbV9RltB4JRKm2CcMzM3vm3DcmcKbGfVQPx7JT2nLIi9svT4L8Q2Q5Vd
	 873+Yf6Xirmx7dlcz3HIC23rcYvh/XskYuUmShWgemfzolz/3Vc4EPl9rs9h36uqzFC7h
	 NlyfF8XiJW44GRkvwxaJ39mDig2aLJJhQ/EF3e7DxzfmXyf5W5dGkwL/W6CVjNXXSsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DAD606A31E
	for <dtrace@lists.linux.dev>; Tue, 24 Nov 2026 13:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4DAD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6AODQurI019957
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 24 Nov 2026 13:26:57 GMT
From: Nix <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 15/20] libdtrace: search both ELF symbol tables for
 module symbols
In-Reply-To: <au5Gojt8RguVHIzM@oracle.com>
References: <9a3ef30ca35af2d994b6f8a42a8e6700@oracle.com>
	<87ik2artkr.fsf@esperi.org.uk> <877biqrtg7.fsf@esperi.org.uk>
	<au5Gojt8RguVHIzM@oracle.com>
Emacs: ... it's not just a way of life, it's a text editor!
Date: Tue, 24 Nov 2026 13:26:56 +0000
Message-ID: <87mrqyicm7.fsf@esperi.org.uk>
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

On 6 Nov 2026, Kris Van Hees said:

> On Fri, Nov 06, 2026 at 01:16:24PM +0000, Nick Alcock wrote:
>> On 6 Nov 2026, Nick Alcock said:
>>=20
>> > On 30 Oct 2026, Kris Van Hees said:
>> >
>> >> Keep independent symbol and address indices for SHT_SYMTAB and SHT_DY=
NSYM,
>> >> loading strings through each table=C3=A2?Ts sh_link. Search .symtab b=
efore .dynsym
>> >> and include dynamic-only names in module symbol iteration.
>> >
>> > Yet noather place where one or the other strtab was overlooked. These
>> > mistakes all date right back to Solaris...
>> >
>> >> Preserve .symtab indices for CTF, place dynamic and external symbols =
in
>> >> separate ID ranges, and use .dynsym for CTF when .symtab is absent. A=
llow
>> >
>> > Except in old dicts (CTFv2, or v3 in the absence of the CTF_F_DYNSTR
>> > dict flag), .dynsym should be searched unconditionally for CTF.
>> > Preferring the symtab is wrong. (I suspect this code is basically never
>> > run, since it's all symtypetab stuff, and the symtypetab isn't emitted
>> > for kernel CTF.)
>>=20
>> ... oh wait, this is for uprobes. The symtab in use for that follows the
>> above rules then (and libctf does the symtypetab lookup for you, if
>> uprobes is using that. Don't implement it yourself simply because CTFv4
>> redoes this completely while retaining almost the same user-visible API,
>> and you don't want to change everything twice! v4 always uses the
>> dynsymtab, unconditionally.)
>
> But I do not have CTFv4 righr now, so we need this.

If it's necessary, fine, but you'll probably have to throw it all out
again :) using .dynsym and its linked strtab is obviously necessary,
though.

--=20
NULL && (void)
