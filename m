Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972335;
	b=DjxRIgzjExPFBMqTeYb5Aie/W4m/P7KAoWqRhkv/g6qikVtyVdcsnFoGKyN8peWgjEn1
	 CwpM7p/MaqY8j+kAQNf+8rcFut0TrQJ+KPHKnoaqc6WhQ43IpH67IwlNddMD8CnaZyqAR
	 NW7m+YBlrgYjR0JHstuRRHWf5cC5sA5C6j65J8KjVwzYZU4IzFVsAw8djgeJpOYxbAcId
	 6ogfaI/xlMj2JhuguUNw1sd3pqQxuuDW+mWxc21kwiQ41q/PnqFFblaczSVDtu9sKzXFn
	 5zRTh+oIhVJ2jKMwSNLzUxMjuXltjZKP12DV4RNCiEme24Wl/Kc3iZxOP1+Tghh+avA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972335;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-DCC-wuwien-Metrics;
	bh=CFszXH5DDyB9VbW/qwuA6vpaA8w/3tq2X7TZSdC2M3E=;
	b=2RFhxbxAVEpVUDXNnkTnJEMrEBldLkMks9TpBxii+D25Neb5V/JdRooT1h6Z0CY2KOmN
	 tO5X9I8qwo++XQceJVjOb4PyBcj1IJSvkz8oZtkSi9J0LkiibPxxVm6H6+xxHtfsLX9Ci
	 kIdH907LNCM11HtTDoSP5rtG862AB8KepC6YN2fNieTd4S8JpWQCxeSZ32GqVF259e57c
	 6tZmqriXhLIN7ChNOABvKMm08qi5GAQtKBBiCDEy6tOx5jsXSV43cS2nYBQlQG9OVSN3T
	 /aXdaG6q9Yjhys4rBtcS0n2nKKwZ51CifybCHLR9AqOnzx96stxYumhjC7t9bdqqSnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14E0606A329
	for <dtrace@lists.linux.dev>; Fri,  6 Nov 2026 13:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B14E0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6A6DcpUd015793
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 13:38:51 GMT
From: Nick Alcock <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 18/20] test: use fully qualified probe descriptions
In-Reply-To: <f8d62d6bda17dac591158d0bdedffef8@oracle.com>
References: <f8d62d6bda17dac591158d0bdedffef8@oracle.com>
Emacs: Our Lady of Perpetual Garbage Collection
Date: Fri, 06 Nov 2026 13:38:51 +0000
Message-ID: <87tsluqduc.fsf@esperi.org.uk>
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

> Qualify probe descriptions in standalone D tests, embedded and generated D
> programs, and preprocessor definitions. Update expected diagnostics that
> echo the qualified descriptions.
> 
> Preserve abbreviated or invalid descriptions where probe specification or
> matching is the subject of the test.

This has been long needed and long put off by everyone :) I suppose it
only really matters now that systemwide uprobes can introduce entirely
arbitrary new probe names that might match any of these.

I looked at a few, they look reaonable, and checked the match-specific
ones. If these had genuinely broken anything, at least the non-XFAILed
ones would be screaming, too. (Did you check the XFAILed ones' log
output to make sure they weren't failing for new reasons now?)

Reviewed-by: Nick Alcock <nix@esperi.org.uk>

-- 
NULL && (void)
