Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793970825;
	b=Z4awVxUdSdYSgbKEPF4nZv7WQldH+cfM/1qRyVcYzE2C/cXb3gM4gYu3sOteLR5LL5dW
	 LF8tX/5aQP5rwrOF46LWPuW+3z4/sWdl1zjQJ/ZFLP5JkYq6Yg69mvQ6LIsv9KDmWI3Nq
	 dkXMkVA5jG0ucA0iDn1fYhTbEi4YDwMgJhqKmcud60rpszpdkpmZP4ZIqar+Vx0sZp0w5
	 JHZ9mlrBqZciX4RuFhVcXn9oFTwJfiL0RxFJF1ZoW/vHFyNbSS3FV6k4Pmac6r0Pgy0yt
	 EVxluXKRIQOU6LZPny9hCyQgVOrLR7s7/smEzXP7OLIhSJqOphaAUYvO1GbrJyoKKXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970825;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-DCC-wuwien-Metrics;
	bh=jahF8XQ/FKP+cxZel60gH5Q4r7SITqmRMpJg1W8F7f4=;
	b=E8yvQY/4htlTj6pxtBfTcSJILR2Le0Rzf7YQ/rweDURZwKCUe3rLGVSrFxVlS0V3NRd1
	 l0292ODd2LNSWtwrA8OILe0qmJdK9Oceq7Bs0V3v8cPcD66oQro0+bNnDQHRneYmFZihk
	 Mjgb3Nh3ibZZDb5X5PQxnwuq2eIw3QYtlZ0/MZdpGOXexywwu/NfKC3GEZSXgrJIwArtG
	 iPunyOXAfL24Z9r/6p1bhW5wL+tNqQ4g/6xxwdCTnuHe7klOlouUXkHzOSl1iGcXljSBm
	 MWdQzqcCP9FVXwS6S4+6T/D/1R+qbeC7Q8NzCWyLh9TEl20CF4Lbz4/ORhHvEDVH3nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF29606A326
	for <dtrace@lists.linux.dev>; Fri,  6 Nov 2026 13:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABF29606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6A6DDeng015166
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 13:13:40 GMT
From: Nick Alcock <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 15/20] libdtrace: search both ELF symbol tables for
 module symbols
In-Reply-To: <9a3ef30ca35af2d994b6f8a42a8e6700@oracle.com>
References: <9a3ef30ca35af2d994b6f8a42a8e6700@oracle.com>
Emacs: ballast for RAM.
Date: Fri, 06 Nov 2026 13:13:40 +0000
Message-ID: <87ik2artkr.fsf@esperi.org.uk>
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

On 30 Oct 2026, Kris Van Hees said:

> Keep independent symbol and address indices for SHT_SYMTAB and SHT_DYNSYM,
> loading strings through each table=E2=80=99s sh_link. Search .symtab befo=
re .dynsym
> and include dynamic-only names in module symbol iteration.

Yet noather place where one or the other strtab was overlooked. These
mistakes all date right back to Solaris...

> Preserve .symtab indices for CTF, place dynamic and external symbols in
> separate ID ranges, and use .dynsym for CTF when .symtab is absent. Allow

Except in old dicts (CTFv2, or v3 in the absence of the CTF_F_DYNSTR
dict flag), .dynsym should be searched unconditionally for CTF.
Preferring the symtab is wrong. (I suspect this code is basically never
run, since it's all symtypetab stuff, and the symtypetab isn't emitted
for kernel CTF.)

--=20
NULL && (void)
