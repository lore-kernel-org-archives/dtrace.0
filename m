Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513EB1BA88F
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 20:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724962565; cv=none; b=f2aaz9osxQ62LciJ41nQlKv/Oj0/VdaUFsRhT5huC1eliUGmCi34yUVt31nZyx8Rd6yqGcTWDrY9VxvZ1HNBljDPTQISDQE1AUttYB8HJYVejTNLo+1ILahismGh40/L715VKhmUY9WKVsqPg9oOL6klqwRIWZl4LGPN37+6JBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724962565; c=relaxed/simple;
	bh=y7nG9dM66SfG+zppIoCDxhM4hpoeMqLCYUBEGM89Op8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DhFGXudwEbe9elw7urJxJf7PhjGvJYtRifnkBfa1VzEcWBd/7OpTkqElqqAJo+SrCS7GSmQe3b10j9LFfz+jNtaWaohJrQ4IuuIoW0ETJ902f0W+pI/7676ZQCYeCkLCi1tawUu2yicKjjYcjV0k7i0II0ls7Xfapml3rp6Yq1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: dtrace@lists.linux.dev
Cc: Sam James <sam@gentoo.org>
Subject: [PATCH 1/6] test: fix missing line continuation in tst.perf-types.sh
Date: Thu, 29 Aug 2024 21:15:41 +0100
Message-ID: <7a1c6618639a057dc267d2e0dc9c9d8afea6b0b1.1724962546.git.sam@gentoo.org>
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

base-commit: 98848d2e4994e916317db3328dc560128235791a
-- 
2.46.0

