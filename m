Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296231BA877
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 20:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724962566; cv=none; b=dACS/KvBWGdtv0CpfjJIMX0iycTO9OTEGzUPzme+/9aaaRXZdYRBOBzBXptdG8UP9a2s8/esVHckMPE8a6nq4r6SH7YDhsg+mB/pxSzA+uSoudY2Ey/+DyHSEW1ShTcV6aKQa0LKeMemBg25ekJ3VwgsPTaPaVSNV1jyPRzSEGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724962566; c=relaxed/simple;
	bh=2WseSaj1Y9F2AHkn0PKMTeAnQG1LDxoBsm2BuT1W/6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qW/kXtcgyeXFx3uzdatEzJEGLd51oLhwGEOpmpkhrJcS3fU8ysRowqVGO84v+JYlZ/9pn9HkDaL/hqgxJiUq4ztZDt3nRyIh5+ytUyPzzd34NqbUT3vr4IASJI7aEAx6zfgQrzKyR+7Ua7UGGU6CqwWycpCanfcClDCvvAz7JtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: dtrace@lists.linux.dev
Cc: Sam James <sam@gentoo.org>
Subject: [PATCH 2/6] test: fix broken shebang in tst.plddGrab32.sh
Date: Thu, 29 Aug 2024 21:15:42 +0100
Message-ID: <fdd1e771719e70c32b6870d15fe77e2a8afb6777.1724962546.git.sam@gentoo.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <7a1c6618639a057dc267d2e0dc9c9d8afea6b0b1.1724962546.git.sam@gentoo.org>
References: <7a1c6618639a057dc267d2e0dc9c9d8afea6b0b1.1724962546.git.sam@gentoo.org>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

shellcheck reports:
```
 In test/internals/libproc/tst.plddGrab32.sh line 2:
 #!/bin/bash
 ^-- SC1128 (error): The shebang must be on the first line. Delete blanks and move comments.
```
---
 test/internals/libproc/tst.plddGrab32.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/test/internals/libproc/tst.plddGrab32.sh b/test/internals/libproc/tst.plddGrab32.sh
index a22e2367..c69213ac 100755
--- a/test/internals/libproc/tst.plddGrab32.sh
+++ b/test/internals/libproc/tst.plddGrab32.sh
@@ -1,4 +1,3 @@
-
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-- 
2.46.0

