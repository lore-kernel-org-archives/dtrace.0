Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793970606;
	b=LyidwnF72ONItRzGz6J4CE6zqwJSQm5QV1AB4cqzJO0TBBDGj9uPk3787zJ22920lrLn
	 3o2Jvxbw/tEmbVvy86OE2BrsN4t7rZcoF+rqa1gAbFblit6uixDBAUUn2dccRt9c4b2yQ
	 5JJ+M2Jvy9NFrxJsFWWOff5LFo4vNv+BXgwbX/Y/jz7En1TMc7gmnZZ0d4Uu/wUul84ll
	 610iCkCyZX2uuYIk4wnLZ/4riBZnPNqtv91U3U+xJV/DsXGG9B2sSHk/+BAC0hAMIYlLy
	 xuOR1CpR0PhCJ+ionGxSoNo7hSg9/vKgiYLaHsuhkfczQbary4gGX1F17R8WT5AMXog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970606;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-DCC-wuwien-Metrics;
	bh=+x5VxSnH08VqX45jvLGIMttdxaDur6Crv0WO5nIiYnM=;
	b=nJPRBSOcL9BjFvh1S5ww/9/Tpx4iGsMWIlXBCq9UwSoht3zbqlMoLBljL4oCLVVEe8+k
	 nHSjcSVuDEqjtCFYyRLR20o/mZQ/EUzUVL4AdzEYH1pEQaR7H9U+FsdD47WL/QBLhAe+A
	 EOWzGWqETThBTZ29pnZTufR07PIcsA0QXw175R50kSgbZVJq/rBbIItLkLyloVvfy6CrG
	 AXHKqmATX/iSuy2bCSg8Y0cvw68J5orPkJ3CR8wE2zDX7CqFyCkclJmmvnunKsjNa3ava
	 rAUd84y0FMm+7Z/Xd4ldw7EEOOpwqprTuUmOlrAWRsRIgMrJgIvPOYM36tcSuAzJ0tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BBA606A32F
	for <dtrace@lists.linux.dev>; Fri,  6 Nov 2026 13:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02BBA606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6A6DA1vt015092
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 13:10:02 GMT
From: Nick Alcock <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 14/20] test: detect strlen corruption of strtab rodata
 and zeros
In-Reply-To: <9a6be1ae2acce8402d1cf79e4a2e7b42@oracle.com>
References: <9a6be1ae2acce8402d1cf79e4a2e7b42@oracle.com>
Emacs: resistance is futile; you will be assimilated and byte-compiled.
Date: Fri, 06 Nov 2026 13:10:01 +0000
Message-ID: <87se1ertqu.fsf@esperi.org.uk>
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

On 30 Oct 2026, Kris Van Hees verbalised:

> + * ASSERTION: strlen() must not overwrite the IPv6 lookup table in the
> + *            rodata block of the strtab map.

... I'm not surprised you didn't spot this. Who would expect a strlen to
overwrite anything? But now it works via dt_bpf_probe_read_str, it's
writing into (a temporary entry in) the strtab as a side-effect, with a
STRSZ max...

-- 
NULL && (void)
