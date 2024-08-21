Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2305167DB7
	for <dtrace@lists.linux.dev>; Wed, 21 Aug 2024 06:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724222324; cv=none; b=FSTvnAYsNTcnG7nqmOKWXFhiriT+0u4nmsUtQHggA8F0YGDX/3fu3wzLxNnLFYZNxhyEJBlm79dEMzk2gL+PxVlNO5K6hCklIf8AGGXjtQWpgZNoZQQN/JohVrodTkCR5r1KRqHvD7TeEpoxAq8yCY0AIh4hr8NUn1NAQwEpHrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724222324; c=relaxed/simple;
	bh=NsuhfFwYlktLWzUlRgnhK1BTjy9EnOKIJI6mtCNQIzk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jqzmS5WFqvg309dE4lrLg9DsB8qTTFX4BHTwoCFNi38lNwwhtFCK1qWWWUTaPqUkHZ0TpTf4w5G53WyNTsXKiM0XSJ3c4k3kpa+gm6VSgyBZR228HvIc4lXjO3pPPbS134Jxu5VGP011qmy62/GXrwUOhjBAa21WbRzzOIs68DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: dtrace@lists.linux.dev
Cc: Sam James <sam@gentoo.org>
Subject: [PATCH 1/2] test: fix missing line continuation in tst.perf-types.sh
Date: Wed, 21 Aug 2024 07:38:30 +0100
Message-ID: <d37b6af95e62cb8d03b7adb182106bfa909f4ea8.1724222311.git.sam@gentoo.org>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

shellcheck reports:
```
In test/unittest/sdt/tst.perf-types.sh line 14:
    -n 'END / hitany == 0 / { exit(1); }'
    ^-- SC2215 (warning): This flag is used as a command name. Bad line break or missing [ .. ]?
```

Add the missing '\'.
---
 test/unittest/sdt/tst.perf-types.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/test/unittest/sdt/tst.perf-types.sh b/test/unittest/sdt/tst.perf-types.sh
index 636ed029..2b076110 100755
--- a/test/unittest/sdt/tst.perf-types.sh
+++ b/test/unittest/sdt/tst.perf-types.sh
@@ -10,5 +10,5 @@
 dtrace=$1
 
 exec $dtrace $dt_flags -c "find /dev/dtrace -exec /bin/true ;" \
-    -n 'perf:::sched_process_fork { trace(args[0]->pid); trace (args[1]->pid); hitany = 1; }'
+    -n 'perf:::sched_process_fork { trace(args[0]->pid); trace (args[1]->pid); hitany = 1; }' \
     -n 'END / hitany == 0 / { exit(1); }'

base-commit: c84954cdc6fb017034e2c3fe4445a7c8981d35e9
prerequisite-patch-id: a4540f51354b7c598c0dcd82d58673b6a4a9b500
prerequisite-patch-id: e90d8bdf0311e4fee22a9c739cd11ebe55bd50d7
prerequisite-patch-id: 29233b111338f9765741269a440bae137b06a80d
-- 
2.46.0

