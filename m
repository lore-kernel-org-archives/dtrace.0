Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5291BAECE
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 20:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724962568; cv=none; b=V5bYQkhemtQX75qy7embq2AyqwqnLXC6sEdJ9L2tTd01bwcL/qtHF5UGrY3VE3jIvxjhHcIXifPz7NZFH8QxSIKktDK9qxQb9o0f0PzcN1xkPH44Xp2uu19a8ffODxcPSDcAkLuBS/Zbl7qmRUHRYa3NAmVmPXo1658Uk3dKmBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724962568; c=relaxed/simple;
	bh=BnwMRzeFqm8SHehLU2hYsltcfovFu4H8ZQCMRz0+OkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TjdMz7ovZaCXgPcEXgL9zzz3B1mNuV8m7ekLCzmlr4IhfUCAk13CryhXOcBTkB0dWr/P0WSYdc84aFkrBadPPGM64Us4BDC+XPG2WOWAIPFQ5fBpglt6L4WWdUT9zh4dxwpimAKUwgm6P/1dPWmuOBNh0ZKZnpGVCnr2pTpoE7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: dtrace@lists.linux.dev
Cc: Sam James <sam@gentoo.org>
Subject: [PATCH 4/6] test: fix 'CPU' typo
Date: Thu, 29 Aug 2024 21:15:44 +0100
Message-ID: <86c371866cc52c58d8ab5d838a23974b3c23ba2c.1724962546.git.sam@gentoo.org>
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

---
 test/unittest/drops/drp.DTRACEDROP_AGGREGATION.r.p   | 2 +-
 test/unittest/drops/drp.DTRACEDROP_PRINCIPAL.end.r.p | 2 +-
 test/unittest/drops/drp.DTRACEDROP_PRINCIPAL.r.p     | 2 +-
 test/unittest/drops/test.drop-cpu-ids.r.p            | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/test/unittest/drops/drp.DTRACEDROP_AGGREGATION.r.p b/test/unittest/drops/drp.DTRACEDROP_AGGREGATION.r.p
index 5c91fc50..e028c2dc 100755
--- a/test/unittest/drops/drp.DTRACEDROP_AGGREGATION.r.p
+++ b/test/unittest/drops/drp.DTRACEDROP_AGGREGATION.r.p
@@ -1,3 +1,3 @@
 #!/bin/sed -f
-# Rewrite reports that have a variable CPI ID in them to make them generic.
+# Rewrite reports that have a variable CPU ID in them to make them generic.
 s/CPU [0-9][0-9]*/CPU #/g
diff --git a/test/unittest/drops/drp.DTRACEDROP_PRINCIPAL.end.r.p b/test/unittest/drops/drp.DTRACEDROP_PRINCIPAL.end.r.p
index 5c91fc50..e028c2dc 100755
--- a/test/unittest/drops/drp.DTRACEDROP_PRINCIPAL.end.r.p
+++ b/test/unittest/drops/drp.DTRACEDROP_PRINCIPAL.end.r.p
@@ -1,3 +1,3 @@
 #!/bin/sed -f
-# Rewrite reports that have a variable CPI ID in them to make them generic.
+# Rewrite reports that have a variable CPU ID in them to make them generic.
 s/CPU [0-9][0-9]*/CPU #/g
diff --git a/test/unittest/drops/drp.DTRACEDROP_PRINCIPAL.r.p b/test/unittest/drops/drp.DTRACEDROP_PRINCIPAL.r.p
index 5c91fc50..e028c2dc 100755
--- a/test/unittest/drops/drp.DTRACEDROP_PRINCIPAL.r.p
+++ b/test/unittest/drops/drp.DTRACEDROP_PRINCIPAL.r.p
@@ -1,3 +1,3 @@
 #!/bin/sed -f
-# Rewrite reports that have a variable CPI ID in them to make them generic.
+# Rewrite reports that have a variable CPU ID in them to make them generic.
 s/CPU [0-9][0-9]*/CPU #/g
diff --git a/test/unittest/drops/test.drop-cpu-ids.r.p b/test/unittest/drops/test.drop-cpu-ids.r.p
index 5c91fc50..e028c2dc 100755
--- a/test/unittest/drops/test.drop-cpu-ids.r.p
+++ b/test/unittest/drops/test.drop-cpu-ids.r.p
@@ -1,3 +1,3 @@
 #!/bin/sed -f
-# Rewrite reports that have a variable CPI ID in them to make them generic.
+# Rewrite reports that have a variable CPU ID in them to make them generic.
 s/CPU [0-9][0-9]*/CPU #/g
-- 
2.46.0

