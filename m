Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287631BA88F
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 20:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724962567; cv=none; b=AJwg77RossQ0AIblhF1WxM7iyipsX9O3VRRzOgTpANEKfIFI+YulLHOPjnqKtA6B6aUQ41Tn8qxVBv7PiE2/pssYoMwxSin/BeYwEJRTJU47U4008eG4eNO/h6hw+1mUVeJESPlXy+LPRVFph2/hMaFZsUtv9N9PzgRCPhLEQlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724962567; c=relaxed/simple;
	bh=rOPRiY4i9QYgn/aYZath6Ypad/O6f5QUkKRbUaFn/R8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZY8HOWCrL094oNfhxUmn6BDOiGTU7x43+uG6lBG5YTX9JKU0nj+SUQK9PB9rtIgDsxRumf+77m2eqsZViopcYETQ2ezHU5nuwV+OHvoX3U96kI9Jng5cW6i+BMFfhVoUfly65ypwa+zSfyjjnOBgCwqhyH+netcH8Ubt9aDfN+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: dtrace@lists.linux.dev
Cc: Sam James <sam@gentoo.org>
Subject: [PATCH 3/6] test: awk -> gawk where we use strtonum
Date: Thu, 29 Aug 2024 21:15:43 +0100
Message-ID: <469de3f6038706e4589a497400090368c301c740.1724962546.git.sam@gentoo.org>
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
 test/unittest/aggs/tst.aggpercpu.sh                       | 2 +-
 test/unittest/arrays/tst.uregsarray-check.sh              | 2 +-
 test/unittest/codegen/tst.kernel_read_scalar_regspill.r.p | 2 +-
 test/unittest/cpc/tst.args_kernel.sh                      | 2 +-
 test/unittest/cpc/tst.args_user.sh                        | 2 +-
 test/unittest/pid/tst.offsets.sh                          | 4 ++--
 test/unittest/profile-n/tst.args_kernel.sh                | 2 +-
 test/unittest/profile-n/tst.args_user.sh                  | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/test/unittest/aggs/tst.aggpercpu.sh b/test/unittest/aggs/tst.aggpercpu.sh
index 6092bd17..2103546c 100755
--- a/test/unittest/aggs/tst.aggpercpu.sh
+++ b/test/unittest/aggs/tst.aggpercpu.sh
@@ -43,7 +43,7 @@ fi
 # Examine the results.
 #
 
-awk '
+gawk '
     # The expected value for the aggregation is aggval.
     # The expected value on a CPU is (m * cpu + b).
     # The default value on a CPU that did not fire is defval.
diff --git a/test/unittest/arrays/tst.uregsarray-check.sh b/test/unittest/arrays/tst.uregsarray-check.sh
index b672666e..99dd6980 100755
--- a/test/unittest/arrays/tst.uregsarray-check.sh
+++ b/test/unittest/arrays/tst.uregsarray-check.sh
@@ -79,7 +79,7 @@ fi
 
 # post processing
 
-awk '
+gawk '
 BEGIN { DTrace_PC = DTrace_SP = instructions = local_variable = -1 }
 
 # the first file has DTrace output
diff --git a/test/unittest/codegen/tst.kernel_read_scalar_regspill.r.p b/test/unittest/codegen/tst.kernel_read_scalar_regspill.r.p
index 48aa84f7..3c0e9dd2 100755
--- a/test/unittest/codegen/tst.kernel_read_scalar_regspill.r.p
+++ b/test/unittest/codegen/tst.kernel_read_scalar_regspill.r.p
@@ -1,4 +1,4 @@
-#!/usr/bin/awk -f
+#!/usr/bin/gawk -f
 
 NR == 1 { val = base = strtonum("0x"$1); }
 NR > 1 { val = strtonum("0x"$1); }
diff --git a/test/unittest/cpc/tst.args_kernel.sh b/test/unittest/cpc/tst.args_kernel.sh
index 23b45a7e..9d7bb652 100755
--- a/test/unittest/cpc/tst.args_kernel.sh
+++ b/test/unittest/cpc/tst.args_kernel.sh
@@ -54,7 +54,7 @@ echo "summary of D output (occurrences, arg0, arg1)"
 cat D.out
 
 # check the PCs
-read ntotal nwarn nerror <<< `awk '
+read ntotal nwarn nerror <<< `gawk '
 BEGIN { ntotal = nwarn = nerror = 0; }
 
 # file reports 1:occurrences, 2:arg0, 3:arg1
diff --git a/test/unittest/cpc/tst.args_user.sh b/test/unittest/cpc/tst.args_user.sh
index f7b13dde..16feddf3 100755
--- a/test/unittest/cpc/tst.args_user.sh
+++ b/test/unittest/cpc/tst.args_user.sh
@@ -58,7 +58,7 @@ echo "summary of D output (occurrences, arg0, arg1)"
 cat D.out
 
 # check the PCs
-read ntotal narg0 narg1 nwarn nerror <<< `awk '
+read ntotal narg0 narg1 nwarn nerror <<< `gawk '
 BEGIN { ntotal = narg0 = narg1 = nwarn = nerror = 0; }
 
 # one file has the PCs that are in the inner loop
diff --git a/test/unittest/pid/tst.offsets.sh b/test/unittest/pid/tst.offsets.sh
index c0b23fa9..63344698 100755
--- a/test/unittest/pid/tst.offsets.sh
+++ b/test/unittest/pid/tst.offsets.sh
@@ -85,7 +85,7 @@ fi
 # hot and cold instructions in the function.
 #
 
-objdump -d a.out | awk '
+objdump -d a.out | gawk '
 BEGIN {
 	pc0 = 0;	# First PC of loopfunc()
 	pcjump = 0;	# PC of the jump
@@ -142,7 +142,7 @@ fi
 # Use files pcs.out and D.out to check results.
 #
 
-awk '
+gawk '
 BEGIN {
    # Determine the expected counts for cold and hot instructions
    ncold = '$nouter';
diff --git a/test/unittest/profile-n/tst.args_kernel.sh b/test/unittest/profile-n/tst.args_kernel.sh
index f8582fc3..c47f699f 100755
--- a/test/unittest/profile-n/tst.args_kernel.sh
+++ b/test/unittest/profile-n/tst.args_kernel.sh
@@ -49,7 +49,7 @@ echo "summary of D output (occurrences, arg0, arg1)"
 cat D.out
 
 # check the PCs
-read ntotal nwarn nerror <<< `awk '
+read ntotal nwarn nerror <<< `gawk '
 BEGIN { ntotal = nwarn = nerror = 0; }
 
 # file reports 1:occurrences, 2:arg0, 3:arg1
diff --git a/test/unittest/profile-n/tst.args_user.sh b/test/unittest/profile-n/tst.args_user.sh
index 2e7bee09..1eaadd9e 100755
--- a/test/unittest/profile-n/tst.args_user.sh
+++ b/test/unittest/profile-n/tst.args_user.sh
@@ -53,7 +53,7 @@ echo "summary of D output (occurrences, arg0, arg1)"
 cat D.out
 
 # check the PCs
-read ntotal narg0 narg1 nwarn nerror <<< `awk '
+read ntotal narg0 narg1 nwarn nerror <<< `gawk '
 BEGIN { ntotal = narg0 = narg1 = nwarn = nerror = 0; }
 
 # one file has the PCs that are in the inner loop
-- 
2.46.0

