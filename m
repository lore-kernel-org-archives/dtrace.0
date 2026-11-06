Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793970849;
	b=Yd1u3v9sG6cqnarc++PuAekkk1ScluI8GB3YjZyQ0MrjehFkueqa8MVz3NfmCuGy1xVz
	 JpCflAdNvLJp/v8cCw6TXUaaCT1+QkUzpTC75s6b2oDUd+nRl6al/K2WRvsKDpgHKTaka
	 mfkeAg4soci/TVAuHILdRHoNvm5oQlnzrLxL/Un6Fgv/9biLgFW7VlllRUCAc4T0v9Hmk
	 hXJvl4XqhrS06PJa1r6C2DijQh/L/lpb5pUOKu5kD6OGTVQGIhgjKmQVfrLCGroAcSnuR
	 EPLLmVz4DBZYOl2M2vG/jUEgKntvCv3LKU2lHLuHWOHbKHEVeJOJE+BPJ8REKcJJg1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970849;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-DCC-wuwien-Metrics;
	bh=kBaWoLOt6tqaAd5fDoR8vx21ZqhP07R46BVgg6okeQg=;
	b=l915sAeeKXuOpd2DtjI15FQWgmram4zBK7GEMF/rNGGLrHDJ9uHvF/mq8tbafe/1N3Kv
	 Avga8PTi0UWJomIauTAmUM9LVxyjX6RB7mTkwQvPF4H8H2uGP3aP8P955pPBWPbxSwveI
	 YBYwauXRsbA0QdACLux9fGV6bKOj3+qeHwr6Bw6eT5PtqlrbR2gErkZDifAee/fvN2R7T
	 nKBy7UqIJ1RWDahjrTUTqtQrZHoraajMa1eIfM49DidTzhklL/N9qyAlhMs2sK/ClTkB5
	 hC1QgJk02KAB6SINUA5PuiRg6t2XjU+zMIAjyiFWj8Y+Rdglje4xMTnkK7myKA851uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA1D606A32D
	for <dtrace@lists.linux.dev>; Fri,  6 Nov 2026 13:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BA1D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6A6DE4ZT015180
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 13:14:05 GMT
From: Nick Alcock <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 14/20] test: detect strlen corruption of strtab rodata
 and zeros
In-Reply-To: <87se1ertqu.fsf@esperi.org.uk>
References: <9a6be1ae2acce8402d1cf79e4a2e7b42@oracle.com>
	<87se1ertqu.fsf@esperi.org.uk>
Emacs: freely redistributable; void where prohibited by law.
Date: Fri, 06 Nov 2026 13:14:04 +0000
Message-ID: <87eccyrtk3.fsf@esperi.org.uk>
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

On 6 Nov 2026, Nick Alcock told this:

> On 30 Oct 2026, Kris Van Hees verbalised:
>
>> + * ASSERTION: strlen() must not overwrite the IPv6 lookup table in the
>> + *            rodata block of the strtab map.
>
> ... I'm not surprised you didn't spot this. Who would expect a strlen to
> overwrite anything? But now it works via dt_bpf_probe_read_str, it's
> writing into (a temporary entry in) the strtab as a side-effect, with a
> STRSZ max...

Oh yeah, and

Reviewed-by: Nick Alcock <nix@esperi.org.uk>

-- 
NULL && (void)
