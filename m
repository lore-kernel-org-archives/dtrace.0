Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E5C79CD
	for <dtrace@lists.linux.dev>; Wed, 21 Aug 2024 06:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724222324; cv=none; b=Tnh4+66HUrKeFexbdk7FgPYom+WErNEufqrAh5Ut8z3uOnhs3+drs+IzuUaGOjFMUlpOouTbPELAcehqa5H57OmslTu6cOzXBcg1ogCJ1AhWXI4WR8yk/Eei5E9ta/1aRPnTt76VKBOU/o5w9qtJ+T0wnRlpArDMVWpQlCX6fGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724222324; c=relaxed/simple;
	bh=2WseSaj1Y9F2AHkn0PKMTeAnQG1LDxoBsm2BuT1W/6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AeGoE4Knxc1WxjiNorNpNoi0vmS6YqzBac9o2YX6SMm2uLmOH/S/GIKF1Fn+50sdZMLBgv8qPz8doVG1OHDL29C20bMIlVf0cxoaqd6oPwbUIb6z0MdXgFoDTf5RKk4nomZUGYjDYYLixg9omxfQsF7X2wjHIhj597q7G3BDjis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: dtrace@lists.linux.dev
Cc: Sam James <sam@gentoo.org>
Subject: [PATCH 2/2] test: fix broken shebang in tst.plddGrab32.sh
Date: Wed, 21 Aug 2024 07:38:31 +0100
Message-ID: <db9fbae9a032ecdef8a59494c325d2805472e07b.1724222311.git.sam@gentoo.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <d37b6af95e62cb8d03b7adb182106bfa909f4ea8.1724222311.git.sam@gentoo.org>
References: <d37b6af95e62cb8d03b7adb182106bfa909f4ea8.1724222311.git.sam@gentoo.org>
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

