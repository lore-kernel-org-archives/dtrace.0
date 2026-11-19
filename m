Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795072311;
	b=T7L4yoGdxRSfYI8vd4924FyFQxzPk66n9iZH1JFKe2ll5PL/23Hs27g2cTXNYQfWamJC
	 ZwoTiV5v0qu2pe4n7O1I6UwXDvzyIWgYWG5H6OeC0L36GAXpYiqbu1pP4HYhqDrN3Ecwr
	 WWO/kz9H+3Q+YIgcSvlyQqTrrVx/P0nKSe8uqQLgHI7ngGfSXUcjQXVuokA2l/uGmoPZB
	 Kpi7KNOzWIRUckbooy0cDp6gldzH53H8coOCPxedkDWqMBFQzFGjLSIjcDQGq7BrXAbK1
	 QE2JiEsLg/oQpLo9saasoQXcRURCLxbS2dxiVAQ9TWhFeXr2nypP4W5byYFnB4IkXUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072311;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=/IlEXxaHUR+pAdJD8lE/ubOMUOt39n1YPQJHNrPKxAA=;
	b=zlrYRhSyCZO3mApA34GLoRVRIVldPVJeq5Xiu4tTaWf9JbiAPf0PgXV165DbY2+c98LZ
	 UaLR2D+h551BUCV8Z3V0uqKi1UnmyrSM4KT90L7vCpAgNCj/7f0stGqby3VWe661RcEi6
	 IbuigaF4FsKxb+HyDF/emsB+OHcRxsr/Vz56iBAHRuHZFfc7vSqPOtHL8SxsFaMUm0UWJ
	 rgNQzMGWGRp35Hz6s3fiNtSACbOidz2nuZAt8HBEJ9jQuMpltn6Zd05PDIar2M5mZa4Uc
	 GCvqptHXyYHtMacamlOPtcm9dEkfPGBCp6R3HvgYx6/gOYu3DVns/fj8C7SbEI6kyzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fQE+doLw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E10E606A324
	for <dtrace@lists.linux.dev>; Thu, 19 Nov 2026 07:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fQE+doLw
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795072311;
	b=ZijPfaAqmPNpvAY6p0y5oWDf1VRwGXfYzS2pLDp+Xppukh9hFdFt0e0MQiINuR+AXBvH
	 YSJuae2GTQTVabyv307Oh/NZ03IGq3ZZ8zB3TffTlwckaAd2VA9oCjD1QRaWhikyJ4Z2R
	 L5eQysfovq8KSPm5z//rcOWX99+WDMv10FZOjy08dBvowzb6MwRzIbCezGkweceh7GPa6
	 bdSkZtg8vJ3vTrLqT1RAf1h2cfiLlg6ZxGQ3IPhMzkD9W9SN98q+ylsMfJG3MmVlb5SmC
	 aN1gTpz5HbUtpuZ/+7kZC97ZsblFB5sEBM7OFyB2c9nXTskrIaYguPXGNkBjD0d+8tQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795072311;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=/IlEXxaHUR+pAdJD8lE/ubOMUOt39n1YPQJHNrPKxAA=;
	b=Z8iImavzMms/SZeJO2jOfeMPWtc5nhMMX0FJZ71COhbu3Hez3qtYJ03F6aYLJegnHOa0
	 GotjMwPvB2QhAkjhOEwBL2YfR8Ms12f7mJVuEn0Idc9vXIjV4yHZ9eBqo4mqgiXXs3/LC
	 dFu/11794HzwMVcXbg+UjlRx3ee2P4Is9c/22hqu+Jfl+wCtMCIe0lhIQuvn1eH0Orn8W
	 rmWM+VLxIcYVbCDjoS7/kTyOEWxjg6kZRUay8IalD9glLz2RyMqQHIgaaWcPbvC/4ExDy
	 o/ssqjtBvLrOnxonyyZtVMKIW4w9bLNTcv2FdcJwbd+RpijCWRqzQAU6Rc9tSD312XQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 082B21F000C5;
	Thu, 19 Nov 2026 07:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795072311;
	bh=/IlEXxaHUR+pAdJD8lE/ubOMUOt39n1YPQJHNrPKxAA=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=fQE+doLwca+eaq72TWZwlQNxnE5um1cUddoza80vANSZViPEuouDbk3IzouGciIbt
	 I5qFpQgk946Daoj0wdFyVIleLmKz0gK07oBuFlleDy3CwHeeOb0D97205B34ajYk7U
	 jeFKo6USiRA+tzhmw/DybL/+dqc8RzwbMy9nWrr4fqDt8pyNQltLKs9oDg7wdYLGWa
	 iFAJWdxj+68BGzX0HlfTgRL+oqCGnhQXryl8kAKCgfnpzO8nH43wzrs16gzODB1vBP
	 MZSpf8bNJpDst3Q0rv0H0amZbdtZ/roRrW1zCF1kkZotH13EAO+xgDgsHli1XQrvTd
	 7kIOIR6hmemGw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5D4164B14A;
	Thu, 19 Nov 2026 07:11:49 +0000 (UTC)
From: Eslam Almorshdy via B4 Relay <devnull+ealmorshdy.d-matrix.ai@kernel.org>
Subject: [PATCH v2 0/2] Fix a readlink() typo in Psystem_daemon()
Date: Thu, 19 Nov 2026 07:11:40 +0000
Message-Id: <20261119-b4-bug008-daemon-readlink-v2-0-c4bc5fbf156f@d-matrix.ai>
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NTQ6CMBBGr0K6dkynKKAr72FY9GeAUSmmBYIh3
 F3AC7h8yfveN4tIgSmKazKLQCNH7vwK6pAI22hfE7BbWSipMkQswJzADLWUBThNbechkHYv9k/
 IckpTiWll7Fms+3egiqe9fS9/HAfzINtvwc1oOPZd+OznI27ePz8jggQscnsho5RDvDlodR94O
 moW5bIsX4xWZyPWAAAA
X-Change-ID: 20261118-b4-bug008-daemon-readlink-67e33013fbc5
To: dtrace@lists.linux.dev
Cc: Nick Alcock <nix@esperi.org.uk>, 
 Kris Van Hees <kris.van.hees@oracle.com>, 
 Eslam Almorshdy <ealmorshdy@d-matrix.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795072309; l=1174;
 i=ealmorshdy@d-matrix.ai; s=20261015; h=from:subject:message-id;
 bh=O9ZxxWCzSpnDvu7L3W+H3IcaMBTRbBPC9pJO5VMeoiQ=;
 b=mAlxtV/SgZG7Dnb6mENRAD7iOfpRVXmF6nV395DXsB3xqramcPJOgnIAY1At4uVkMSZPQnMvP
 zAQNAC3G8q2D68Bh3sSilYYqQW1dQlnf0skZn3D5e+9DUExLwAq6hYi
X-Developer-Key: i=ealmorshdy@d-matrix.ai; a=ed25519;
 pk=E4tVAIvp2rvz2CB7Re6YVMP6FiUVSxuq0TUtjGQL5NM=
X-Endpoint-Received: by B4 Relay for ealmorshdy@d-matrix.ai/20261015 with
 auth_id=1187
X-Original-From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
Reply-To: ealmorshdy@d-matrix.ai

Psystem_daemon() tests readlink() == 0, but readlink() returns the
number of bytes stored or -1, so the "regular file outside /var" rule
never applied: every root process without a terminal was a system
daemon wherever systemd doesn't decide.

Patch 1 is the one-character fix.  Patch 2 adds a test that hides
/run/systemd with unshare, so the rule is exercised on systemd hosts
too.  On systems without systemd Patch 1 also turns pid/tst.emptystack,
tst.float, tst.manypids and tst.probemod green.

Changes since v1:
- Patch 2: moved the /var guard up and used [[ ]] (Kris).

---
Eslam Almorshdy (2):
      libproc: fix readlink() typo in Psystem_daemon()
      test: add test for system daemons with regular files as streams

 libproc/Pcontrol.c                            |  2 +-
 test/unittest/proc/tst.system-daemon-files.r  |  2 +
 test/unittest/proc/tst.system-daemon-files.sh | 95 +++++++++++++++++++++++++++
 3 files changed, 98 insertions(+), 1 deletion(-)
---
base-commit: 61fea621160ea4b6302874c62a723da105b44883
change-id: 20261118-b4-bug008-daemon-readlink-67e33013fbc5

Best regards,
--  
Eslam Almorshdy <ealmorshdy@d-matrix.ai>


