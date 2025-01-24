Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0967240BF5
	for <dtrace@lists.linux.dev>; Fri, 24 Jan 2025 02:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737687065; cv=none; b=P0y7ToNMe5LvleIdU0LYiJvQ88f5PwRci1mZ+PT4CvskcUsUd3Dy8sDrCOavOo9IPFHfJX57jxkk4vPLUACE92tnhbD+ESBD0koiGM/MJOZnwDrKPzgHE/anCQG88AxNCYwDsUnybnCFsZwEVTdJ7pDd1p9BmJgxBzerdEoc9Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737687065; c=relaxed/simple;
	bh=mcoQRBPB68g5lCQ44idk5JGY2hp8neCffsrJXmU95fs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GeWy4djCB0nsAMgZEbLFhfP79p0cdeUDDZ1/jEyvhfWwhXC190m2EZLJjlq/lpQHI2/MbNtrbsD8XXeKML/k2gklesBkrpsOY7Blov9WPy/RrzyCc84eOsNHhqcmPpFF1JUEzv6Z40NQDPbf7LQ0HIeldyw2xZY/K9+WoQyy/Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.. (unknown [82.8.138.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam@gentoo.org)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 9216C3430F5;
	Fri, 24 Jan 2025 02:51:02 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: dtrace@lists.linux.dev
Cc: Sam James <sam@gentoo.org>
Subject: [PATCH 3/4] test: finalize porting small awk stragglers to gawk
Date: Fri, 24 Jan 2025 02:49:49 +0000
Message-ID: <6801a6bc93d311d2cbb3289d607e4918422e262c.1737686990.git.sam@gentoo.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1737686990.git.sam@gentoo.org>
References: <cover.1737686990.git.sam@gentoo.org>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We missed some in 8a1264bf0e818c8624be250eb5174714b62ed93c because some
other test changes landed before it landed.

Signed-off-by: Sam James <sam@gentoo.org>
---
 test/unittest/builtinvar/tst.id_ERROR.sh         |  2 +-
 test/unittest/error/tst.clause_scope-regular.r.p |  2 +-
 test/unittest/variables/bvar/tst.arg3-ERROR-b.sh |  2 +-
 test/unittest/variables/bvar/tst.arg3-ERROR.sh   | 14 +++++++-------
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/test/unittest/builtinvar/tst.id_ERROR.sh b/test/unittest/builtinvar/tst.id_ERROR.sh
index 082ebd0c..480d99a3 100755
--- a/test/unittest/builtinvar/tst.id_ERROR.sh
+++ b/test/unittest/builtinvar/tst.id_ERROR.sh
@@ -30,7 +30,7 @@ fi
 
 # Get the ERROR probe ID from "dtrace -l" output.
 
-id=`$dtrace $dt_flags -ln dtrace:::ERROR |& awk '/^ *[0-9]* *dtrace *ERROR *$/ { print $1 }'`
+id=`$dtrace $dt_flags -ln dtrace:::ERROR |& gawk '/^ *[0-9]* *dtrace *ERROR *$/ { print $1 }'`
 
 # Construct expected output.
 
diff --git a/test/unittest/error/tst.clause_scope-regular.r.p b/test/unittest/error/tst.clause_scope-regular.r.p
index f7a200c4..bf7e2614 100755
--- a/test/unittest/error/tst.clause_scope-regular.r.p
+++ b/test/unittest/error/tst.clause_scope-regular.r.p
@@ -1,4 +1,4 @@
-#!/usr/bin/awk -f
+#!/usr/bin/gawk -f
 
 # This report has a variable probe ID in it.
 {
diff --git a/test/unittest/variables/bvar/tst.arg3-ERROR-b.sh b/test/unittest/variables/bvar/tst.arg3-ERROR-b.sh
index 2f6e51c3..97661b75 100755
--- a/test/unittest/variables/bvar/tst.arg3-ERROR-b.sh
+++ b/test/unittest/variables/bvar/tst.arg3-ERROR-b.sh
@@ -50,7 +50,7 @@ BEGIN
 }
 EOT
 
-awk 'BEGIN {
+gawk 'BEGIN {
 	ok = 0;
      }
 
diff --git a/test/unittest/variables/bvar/tst.arg3-ERROR.sh b/test/unittest/variables/bvar/tst.arg3-ERROR.sh
index 38cb38df..b5460b6c 100755
--- a/test/unittest/variables/bvar/tst.arg3-ERROR.sh
+++ b/test/unittest/variables/bvar/tst.arg3-ERROR.sh
@@ -49,7 +49,7 @@ fi
 
 # Parse the disassembly output for start PCs for the dt_clause_n.
 
-awk '
+gawk '
 BEGIN { phase = 0 }
 
 # Look for disassembly of dtrace:::BEGIN.
@@ -70,7 +70,7 @@ phase == 3 && NF == 0 { exit(0) }
 phase == 3 { next }
 ' disasm.out > dt_clause_start_pcs.txt
 if [ $? -ne 0 ]; then
-	echo ERROR: awk
+	echo ERROR: gawk
 	dump_files disasm.out dt_clause_start_pcs.txt
 	exit 1
 fi
@@ -80,7 +80,7 @@ fi
 for n in 0 1 2 3 4 5; do
 	echo dt_clause_$n >> dt_clause_start_pcs.txt.check
 done
-if ! awk '{print $2}' dt_clause_start_pcs.txt | diff - dt_clause_start_pcs.txt.check; then
+if ! gawk '{print $2}' dt_clause_start_pcs.txt | diff - dt_clause_start_pcs.txt.check; then
 	echo ERROR: did not find all expected dt_clause_n
 	dump_files disasm.out dt_clause_start_pcs.txt
 fi
@@ -94,10 +94,10 @@ fi
 # dt_probe_error() is the problematic one.  We look for those calls.
 for n in 1 2 3 4; do
 	# For dt_clause_$n, find the starting PC.
-	pc=`awk '$2 == "dt_clause_'$n'" { print $1 }' dt_clause_start_pcs.txt`
+	pc=`gawk '$2 == "dt_clause_'$n'" { print $1 }' dt_clause_start_pcs.txt`
 
 	# Look for the starting PC and then the second dt_probe_error().
-	awk '
+	gawk '
 	BEGIN { phase = 0 }
 
 	# Look for disassembly of dtrace:::BEGIN.
@@ -120,7 +120,7 @@ done
 
 # Do a sanity check on DTrace's error output.
 
-awk '/^dtrace: error in dt_clause_[1-4] for probe ID 1 \(dtrace:::BEGIN): invalid address \(0x40) at BPF pc [0-9]*$/ { print $NF }' \
+gawk '/^dtrace: error in dt_clause_[1-4] for probe ID 1 \(dtrace:::BEGIN): invalid address \(0x40) at BPF pc [0-9]*$/ { print $NF }' \
   disasm.out > err_pcs.txt.chk1
 if ! diff -q err_pcs.txt err_pcs.txt.chk1; then
 	echo ERROR: problem with DTrace error output
@@ -130,7 +130,7 @@ fi
 
 # Check the D script output... the arg3 values reported by the dtrace:::ERROR probe.
 
-if ! awk 'NF != 0 { print strtonum("0x"$NF) }' D.out | diff -q - err_pcs.txt; then
+if ! gawk 'NF != 0 { print strtonum("0x"$NF) }' D.out | diff -q - err_pcs.txt; then
 	echo ERROR: D script output looks wrong
 	dump_files D.out err_pcs.txt
 	exit 1
-- 
2.48.1

