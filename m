Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14330367
	for <dtrace@lists.linux.dev>; Tue, 20 Aug 2024 00:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724112684; cv=none; b=tGbYxeMi4WAueXJe7VKNiRP8RBlzY5nOzaU0avv/vKZAzjMHoQAdBOkdEVSpsGf+GL9VMnWTSoOiN8UHT3X1orGq5CVMBiVsZC4NwWfifunIKi3edkM5kFVsM31oJQAHh+rJ/2Fgu8MgfWsOFb39Xzs5phtFNmA9IQZF7TSjoxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724112684; c=relaxed/simple;
	bh=4ZTRy9ofyiYxS1I2luoboWX8l+0caXc9KLKK8nDEa1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BgTkbAi+U9aJEbw7zsRFBZsHrIp6aNI9hudNEx7IFXwdwT9NbDQB8d3TSLMlC2kMfmB+R+lnQTw3UMYqEwInDu91d4cuBgwD3QZWea0NrcqHQ9wdroEyGMvX2UUyTh5OPUrWNhzZx55x7b/HBrCEBTvGjllf6H2NepBKU8lfgd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: dtrace@lists.linux.dev
Cc: Sam James <sam@gentoo.org>
Subject: [PATCH 3/3] test: fix exit code in tst.newprobes.sh
Date: Tue, 20 Aug 2024 01:10:22 +0100
Message-ID: <6ab9502eb62a6d4be913b5032fd6b1f54fe7627f.1724112622.git.sam@gentoo.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1724112622.git.sam@gentoo.org>
References: <cover.1724112622.git.sam@gentoo.org>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

$status is never assigned, just use $?.
---
 test/unittest/pid/tst.newprobes.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/test/unittest/pid/tst.newprobes.sh b/test/unittest/pid/tst.newprobes.sh
index a4944688..0980d3b3 100755
--- a/test/unittest/pid/tst.newprobes.sh
+++ b/test/unittest/pid/tst.newprobes.sh
@@ -44,4 +44,4 @@ tick-1s
 }
 EOF
 
-exit $status
+exit $?
-- 
2.46.0

