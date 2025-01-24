Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27911D5142
	for <dtrace@lists.linux.dev>; Fri, 24 Jan 2025 02:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737687066; cv=none; b=KsWkNJetXy0eWYSI0GnDlnjghgttrQ78TCKq2HUkR24246759P4J65W0ZbA+eGnT6CHDKIS1R8HJQ1bprBafmyVds0NvxGce2GMmSMwE+7OOerQQZ0/RlPHzf7wVP5L+xaRuhkibYeE+INsyLKBExR4tCo7L0hAJ0NQxj8n9IWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737687066; c=relaxed/simple;
	bh=5WZLuce/8eWKInUWvh4OddC+fAwpS4kFQZWpp18Z2e8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UxwSxHMu4AamZfP6NAeF11s9MtYweVEhh8WXXYsXMomMGf0zwPgbB3xEEHv7l02+mrCPt8ce70M+0rWRs9dQz+BqiSouXq4luQG02GOx7IzRSK+G7nMWIctXUlz0mRtAJchDx/9dvbECMK2TFy38cH8wjeNyy2oQXanVE3UqkGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.. (unknown [82.8.138.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam@gentoo.org)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 877823431E3;
	Fri, 24 Jan 2025 02:51:03 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: dtrace@lists.linux.dev
Cc: Sam James <sam@gentoo.org>
Subject: [PATCH 4/4] test: allow overriding CC, OBJCOPY, OBJDUMP, NM, ...
Date: Fri, 24 Jan 2025 02:49:50 +0000
Message-ID: <6df5a570b768a59808b2b197b9b5cdeaed426958.1737686990.git.sam@gentoo.org>
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

Bug: https://github.com/oracle/dtrace-utils/issues/75
Signed-off-by: Sam James <sam@gentoo.org>
---
 test/expensive/locking/tst.DestructionDoubleUnlock.sh   | 2 +-
 test/internals/headers/tst.header-endianness.sh         | 2 +-
 test/unittest/aggs/tst.aggmod_full2.sh                  | 2 +-
 test/unittest/arrays/tst.uregsarray-check.sh            | 2 +-
 test/unittest/bitfields/tst.bitfield-offset.x           | 8 ++++----
 test/unittest/builtinvar/tst.errno3.sh                  | 2 +-
 test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh     | 2 +-
 test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh   | 2 +-
 test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh     | 2 +-
 test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh | 2 +-
 test/unittest/misc/tst.include.sh                       | 2 +-
 test/unittest/options/tst.ctypes.sh                     | 6 +++---
 test/unittest/options/tst.dtypes.sh                     | 6 +++---
 test/unittest/options/tst.linktype.sh                   | 4 ++--
 test/unittest/options/tst.strip.sh                      | 4 ++--
 test/unittest/pid/tst.offsets.sh                        | 2 +-
 test/unittest/usdt/tst.allargs.sh                       | 2 +-
 test/unittest/usdt/tst.badguess.sh                      | 2 +-
 test/unittest/usdt/tst.dlclose1.sh                      | 2 +-
 test/unittest/usdt/tst.dlclose2.sh                      | 2 +-
 test/unittest/usdt/tst.dlclose3.sh                      | 2 +-
 test/unittest/usdt/tst.eliminate.sh                     | 6 +++---
 test/unittest/usdt/tst.enabled.sh                       | 2 +-
 test/unittest/usdt/tst.enabled2.sh                      | 2 +-
 test/unittest/usdt/tst.entryreturn.sh                   | 2 +-
 test/unittest/usdt/tst.exec-dof-replacement.sh          | 2 +-
 test/unittest/usdt/tst.execstack.sh                     | 6 +++---
 test/unittest/usdt/tst.fork.sh                          | 2 +-
 test/unittest/usdt/tst.guess32.sh                       | 2 +-
 test/unittest/usdt/tst.guess64.sh                       | 2 +-
 test/unittest/usdt/tst.header.sh                        | 2 +-
 test/unittest/usdt/tst.lingering.sh                     | 2 +-
 test/unittest/usdt/tst.link-idempotence.sh              | 2 +-
 test/unittest/usdt/tst.linkpriv.sh                      | 2 +-
 test/unittest/usdt/tst.linkunpriv.sh                    | 2 +-
 test/unittest/usdt/tst.manyprobes.sh                    | 2 +-
 test/unittest/usdt/tst.manyprocs.sh                     | 2 +-
 test/unittest/usdt/tst.multiple.sh                      | 2 +-
 test/unittest/usdt/tst.multitrace.sh                    | 2 +-
 test/unittest/usdt/tst.onlyenabled.sh                   | 2 +-
 test/unittest/usdt/tst.pie.sh                           | 2 +-
 test/unittest/usdt/tst.reeval.sh                        | 2 +-
 test/unittest/usdt/tst.static.sh                        | 2 +-
 test/unittest/usdt/tst.static2.sh                       | 2 +-
 test/unittest/usdt/tst.user.sh                          | 2 +-
 test/utils/workload_analyze_loop.sh                     | 2 +-
 46 files changed, 59 insertions(+), 59 deletions(-)

diff --git a/test/expensive/locking/tst.DestructionDoubleUnlock.sh b/test/expensive/locking/tst.DestructionDoubleUnlock.sh
index c9b9eadc..c0f7156a 100755
--- a/test/expensive/locking/tst.DestructionDoubleUnlock.sh
+++ b/test/expensive/locking/tst.DestructionDoubleUnlock.sh
@@ -28,7 +28,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS=
 
 DIRNAME="$tmpdir/destruction-double-unlock.$$.$RANDOM"
diff --git a/test/internals/headers/tst.header-endianness.sh b/test/internals/headers/tst.header-endianness.sh
index e45cc597..317ea90c 100755
--- a/test/internals/headers/tst.header-endianness.sh
+++ b/test/internals/headers/tst.header-endianness.sh
@@ -10,7 +10,7 @@
 set -e
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 OLDDIRNAME=${PWD}
 CFLAGS="-I${OLDDIRNAME}/include -I${OLDDIRNAME}/uts/common"
 
diff --git a/test/unittest/aggs/tst.aggmod_full2.sh b/test/unittest/aggs/tst.aggmod_full2.sh
index 66cfc002..48988a1a 100755
--- a/test/unittest/aggs/tst.aggmod_full2.sh
+++ b/test/unittest/aggs/tst.aggmod_full2.sh
@@ -17,7 +17,7 @@
 ##
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS=
 
 DIRNAME="$tmpdir/aggs-aggmod_full2.$$.$RANDOM"
diff --git a/test/unittest/arrays/tst.uregsarray-check.sh b/test/unittest/arrays/tst.uregsarray-check.sh
index f55d36d0..648072b4 100755
--- a/test/unittest/arrays/tst.uregsarray-check.sh
+++ b/test/unittest/arrays/tst.uregsarray-check.sh
@@ -7,7 +7,7 @@
 #
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS=
 
 DIRNAME="$tmpdir/arrays-uregsarray-check.$$.$RANDOM"
diff --git a/test/unittest/bitfields/tst.bitfield-offset.x b/test/unittest/bitfields/tst.bitfield-offset.x
index ae57c2b5..b1f21da4 100755
--- a/test/unittest/bitfields/tst.bitfield-offset.x
+++ b/test/unittest/bitfields/tst.bitfield-offset.x
@@ -12,8 +12,8 @@
 # skip the test, since we can't possibly tell what it was
 # generated by.
 
-if ! objdump --ctf=.ctf --ctf-parent=shared_ctf /bin/true > /dev/null 2>&1 && \
-    LANG=C objdump --ctf=.ctf --ctf-parent=shared_ctf /bin/true 2>&1 | \
+if ! ${OBJDUMP:-objdump} --ctf=.ctf --ctf-parent=shared_ctf /bin/true > /dev/null 2>&1 && \
+    LANG=C ${OBJDUMP:-objdump} --ctf=.ctf --ctf-parent=shared_ctf /bin/true 2>&1 | \
     grep 'unrecognized option' > /dev/null 2>&1; then
     exit 2
 fi
@@ -21,7 +21,7 @@ fi
 ctfa=$tmpdir/vmlinux.ctfa
 trap "rm -f $ctfa" EXIT ERR
 
-objcopy --add-section=.ctf=/lib/modules/$(uname -r)/kernel/vmlinux.ctfa /bin/true $ctfa
+${OBJCOPY:-objcopy} --add-section=.ctf=/lib/modules/$(uname -r)/kernel/vmlinux.ctfa /bin/true $ctfa
 
-objdump --ctf=.ctf --ctf-parent=shared_ctf $ctfa |\
+${OBJDUMP:-objdump} --ctf=.ctf --ctf-parent=shared_ctf $ctfa |\
     gawk '/Version: 3/ { exit 1; } /Version: / { exit 0; }'
diff --git a/test/unittest/builtinvar/tst.errno3.sh b/test/unittest/builtinvar/tst.errno3.sh
index 7546152f..5985a0d3 100755
--- a/test/unittest/builtinvar/tst.errno3.sh
+++ b/test/unittest/builtinvar/tst.errno3.sh
@@ -7,7 +7,7 @@
 #
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 
 DIRNAME="$tmpdir/builtinvar-errno3.$$.$RANDOM"
 mkdir -p $DIRNAME
diff --git a/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
index f8083f2c..5de50001 100755
--- a/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
@@ -22,7 +22,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS=
 
 DIRNAME="$tmpdir/list-probes-func-usdt.$$.$RANDOM"
diff --git a/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
index dc6cb100..0c0694ce 100755
--- a/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
@@ -22,7 +22,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS=
 
 DIRNAME="$tmpdir/list-probes-module-usdt.$$.$RANDOM"
diff --git a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
index 59b8dca5..21e6b841 100755
--- a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
@@ -22,7 +22,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS=
 
 DIRNAME="$tmpdir/list-probes-name-usdt.$$.$RANDOM"
diff --git a/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
index 64fc185d..4d325386 100755
--- a/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
@@ -22,7 +22,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS=
 
 DIRNAME="$tmpdir/list-probes-provider-usdt.$$.$RANDOM"
diff --git a/test/unittest/misc/tst.include.sh b/test/unittest/misc/tst.include.sh
index 9d9989a3..738b4794 100755
--- a/test/unittest/misc/tst.include.sh
+++ b/test/unittest/misc/tst.include.sh
@@ -13,7 +13,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS=
 
 DIR="$tmpdir/misc-include.$$.$RANDOM"
diff --git a/test/unittest/options/tst.ctypes.sh b/test/unittest/options/tst.ctypes.sh
index 30a6c9b1..19c76792 100755
--- a/test/unittest/options/tst.ctypes.sh
+++ b/test/unittest/options/tst.ctypes.sh
@@ -14,14 +14,14 @@ if [ ! -r $tmpdir/ctypes.ctf ]; then
 	exit 1
 fi
 
-if objdump --help | grep ctf >/dev/null; then
-	objcopy --add-section=.ctf=$tmpdir/ctypes.ctf /bin/true $tmpdir/ctypes.o
+if ${OBJDUMP:-objdump} --help | grep ctf >/dev/null; then
+	${OBJCOPY:-objcopy} --add-section=.ctf=$tmpdir/ctypes.ctf /bin/true $tmpdir/ctypes.o
 	if [ $? -ne 0 ]; then
 		echo "ERROR: Failed to create ELF object from ctypes.ctf"
 		exit 1
 	fi
 
-	objdump --ctf=.ctf $tmpdir/ctypes.o | \
+	${OBJDUMP:-objdump} --ctf=.ctf $tmpdir/ctypes.o | \
 		gawk '/CTF_VERSION/ { found = 1; next; }
 		     found && $1 ~ /0x[0-9A-Fa-f]+:/ { cnt++; next; }
 		     END { print "C CTF data" (found ? " " : " NOT ") "found";
diff --git a/test/unittest/options/tst.dtypes.sh b/test/unittest/options/tst.dtypes.sh
index 441de098..658793c7 100755
--- a/test/unittest/options/tst.dtypes.sh
+++ b/test/unittest/options/tst.dtypes.sh
@@ -14,14 +14,14 @@ if [ ! -r $tmpdir/dtypes.ctf ]; then
 	exit 1
 fi
 
-if objdump --help | grep ctf >/dev/null; then
-	objcopy --add-section=.ctf=$tmpdir/dtypes.ctf /bin/true $tmpdir/dtypes.o
+if ${OBJDUMP:-objdump} --help | grep ctf >/dev/null; then
+	${OBJCOPY:-objcopy} --add-section=.ctf=$tmpdir/dtypes.ctf /bin/true $tmpdir/dtypes.o
 	if [ $? -ne 0 ]; then
 		echo "ERROR: Failed to create ELF object from dtypes.ctf"
 		exit 1
 	fi
 
-	objdump --ctf=.ctf $tmpdir/dtypes.o | \
+	${OBJDUMP:-objdump} --ctf=.ctf $tmpdir/dtypes.o | \
 		gawk '/CTF_VERSION/ { found = 1; next; }
 		     found && $1 ~ /0x[0-9A-Fa-f]+:/ { cnt++; next; }
 		     END { print "D CTF data" (found ? " " : " NOT ") "found";
diff --git a/test/unittest/options/tst.linktype.sh b/test/unittest/options/tst.linktype.sh
index 564d9b0f..15bc649b 100755
--- a/test/unittest/options/tst.linktype.sh
+++ b/test/unittest/options/tst.linktype.sh
@@ -9,7 +9,7 @@
 # @@nosort
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS=
 
 DIRNAME="$tmpdir/linktype.$$.$RANDOM"
@@ -61,7 +61,7 @@ function mytest() {
 	fi
 
 	# report whether the file format is recognized
-	objdump --file-headers prov.o |& gawk '
+	${OBJDUMP:-objdump} --file-headers prov.o |& gawk '
 	    /format not recognized/ {
 		print "objdump does NOT recognize file format";
 		exit(0);
diff --git a/test/unittest/options/tst.strip.sh b/test/unittest/options/tst.strip.sh
index 054955fb..1124ccc5 100755
--- a/test/unittest/options/tst.strip.sh
+++ b/test/unittest/options/tst.strip.sh
@@ -7,7 +7,7 @@
 #
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS=
 
 DIRNAME="$tmpdir/strip.$$.$RANDOM"
@@ -48,7 +48,7 @@ fi
 
 # link with and without -xstrip, dumping the DOF section
 
-objdump="objdump --full-contents --section=.SUNW_dof prov.o"
+objdump="${OBJDUMP:-objdump} --full-contents --section=.SUNW_dof prov.o"
 
 $dtrace $dt_flags -G -xstrip -s prov.d test.o
 if [ $? -ne 0 ]; then
diff --git a/test/unittest/pid/tst.offsets.sh b/test/unittest/pid/tst.offsets.sh
index cc1a440d..795553b0 100755
--- a/test/unittest/pid/tst.offsets.sh
+++ b/test/unittest/pid/tst.offsets.sh
@@ -85,7 +85,7 @@ fi
 # hot and cold instructions in the function.
 #
 
-objdump -d a.out | gawk '
+${OBJDUMP:-objdump} -d a.out | gawk '
 BEGIN {
 	pc0 = 0;	# First PC of loopfunc()
 	pcjump = 0;	# PC of the jump
diff --git a/test/unittest/usdt/tst.allargs.sh b/test/unittest/usdt/tst.allargs.sh
index 179552b6..3404b62b 100755
--- a/test/unittest/usdt/tst.allargs.sh
+++ b/test/unittest/usdt/tst.allargs.sh
@@ -15,7 +15,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS="-std=gnu89 $test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.badguess.sh b/test/unittest/usdt/tst.badguess.sh
index b6ff9e23..45044c32 100755
--- a/test/unittest/usdt/tst.badguess.sh
+++ b/test/unittest/usdt/tst.badguess.sh
@@ -11,7 +11,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.dlclose1.sh b/test/unittest/usdt/tst.dlclose1.sh
index a6bad02b..a62da006 100755
--- a/test/unittest/usdt/tst.dlclose1.sh
+++ b/test/unittest/usdt/tst.dlclose1.sh
@@ -29,7 +29,7 @@
 # The second should not.
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS=
 
 DIRNAME="$tmpdir/usdt-dlclose1.$$.$RANDOM"
diff --git a/test/unittest/usdt/tst.dlclose2.sh b/test/unittest/usdt/tst.dlclose2.sh
index 907685a6..1f7064ad 100755
--- a/test/unittest/usdt/tst.dlclose2.sh
+++ b/test/unittest/usdt/tst.dlclose2.sh
@@ -15,7 +15,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS=
 
 DIRNAME="$tmpdir/usdt-dlclose2.$$.$RANDOM"
diff --git a/test/unittest/usdt/tst.dlclose3.sh b/test/unittest/usdt/tst.dlclose3.sh
index 0b70906f..f65ba4e6 100755
--- a/test/unittest/usdt/tst.dlclose3.sh
+++ b/test/unittest/usdt/tst.dlclose3.sh
@@ -21,7 +21,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS=
 
 DIRNAME="$tmpdir/usdt-dlclose3.$$.$RANDOM"
diff --git a/test/unittest/usdt/tst.eliminate.sh b/test/unittest/usdt/tst.eliminate.sh
index e74896bb..b0174fca 100755
--- a/test/unittest/usdt/tst.eliminate.sh
+++ b/test/unittest/usdt/tst.eliminate.sh
@@ -16,7 +16,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
@@ -71,13 +71,13 @@ if [ $? -ne 0 ]; then
 	exit 1
 fi
 
-nm test.o | grep \$dtrace > /dev/null
+${NM:-nm} test.o | grep \$dtrace > /dev/null
 if [ $? -ne 0 ]; then
 	echo "no temporary symbols in the object file" >& 2
 	exit 1
 fi
 
-nm test | grep \$dtrace > /dev/null
+${NM:-nm} test | grep \$dtrace > /dev/null
 if [ $? -eq 0 ]; then
 	echo "failed to eliminate temporary symbols" >& 2
 	exit 1
diff --git a/test/unittest/usdt/tst.enabled.sh b/test/unittest/usdt/tst.enabled.sh
index 4cd1eccd..d444a1fd 100755
--- a/test/unittest/usdt/tst.enabled.sh
+++ b/test/unittest/usdt/tst.enabled.sh
@@ -11,7 +11,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.enabled2.sh b/test/unittest/usdt/tst.enabled2.sh
index 1732085e..7d7648fa 100755
--- a/test/unittest/usdt/tst.enabled2.sh
+++ b/test/unittest/usdt/tst.enabled2.sh
@@ -15,7 +15,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.entryreturn.sh b/test/unittest/usdt/tst.entryreturn.sh
index 84af9672..3c0cba9a 100755
--- a/test/unittest/usdt/tst.entryreturn.sh
+++ b/test/unittest/usdt/tst.entryreturn.sh
@@ -13,7 +13,7 @@ fi
 # @@xfail: dtv2, no wildcard usdt probes yet
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.exec-dof-replacement.sh b/test/unittest/usdt/tst.exec-dof-replacement.sh
index 6d547cce..191f749f 100755
--- a/test/unittest/usdt/tst.exec-dof-replacement.sh
+++ b/test/unittest/usdt/tst.exec-dof-replacement.sh
@@ -14,7 +14,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.execstack.sh b/test/unittest/usdt/tst.execstack.sh
index e7b59105..75586dfb 100755
--- a/test/unittest/usdt/tst.execstack.sh
+++ b/test/unittest/usdt/tst.execstack.sh
@@ -11,11 +11,11 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
-OBJDUMP=/usr/bin/objdump
-READELF=/usr/bin/readelf
+OBJDUMP=${OBJDUMP:-/usr/bin/objdump}
+READELF=${READELF:-/usr/bin/readelf}
 
 DIRNAME="$tmpdir/usdt-execstack.$$.$RANDOM"
 mkdir -p $DIRNAME
diff --git a/test/unittest/usdt/tst.fork.sh b/test/unittest/usdt/tst.fork.sh
index 9b2b372a..75cf99fd 100755
--- a/test/unittest/usdt/tst.fork.sh
+++ b/test/unittest/usdt/tst.fork.sh
@@ -12,7 +12,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.guess32.sh b/test/unittest/usdt/tst.guess32.sh
index 7a130e17..8ae4fb00 100755
--- a/test/unittest/usdt/tst.guess32.sh
+++ b/test/unittest/usdt/tst.guess32.sh
@@ -11,7 +11,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.guess64.sh b/test/unittest/usdt/tst.guess64.sh
index 23b7a241..1141d5e4 100755
--- a/test/unittest/usdt/tst.guess64.sh
+++ b/test/unittest/usdt/tst.guess64.sh
@@ -11,7 +11,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.header.sh b/test/unittest/usdt/tst.header.sh
index c5e411be..05813c1e 100755
--- a/test/unittest/usdt/tst.header.sh
+++ b/test/unittest/usdt/tst.header.sh
@@ -11,7 +11,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.lingering.sh b/test/unittest/usdt/tst.lingering.sh
index 079acb75..d1a1b03c 100755
--- a/test/unittest/usdt/tst.lingering.sh
+++ b/test/unittest/usdt/tst.lingering.sh
@@ -14,7 +14,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.link-idempotence.sh b/test/unittest/usdt/tst.link-idempotence.sh
index 643ba10c..62f2a518 100755
--- a/test/unittest/usdt/tst.link-idempotence.sh
+++ b/test/unittest/usdt/tst.link-idempotence.sh
@@ -11,7 +11,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.linkpriv.sh b/test/unittest/usdt/tst.linkpriv.sh
index 2c89f5d4..0e95dcac 100755
--- a/test/unittest/usdt/tst.linkpriv.sh
+++ b/test/unittest/usdt/tst.linkpriv.sh
@@ -11,7 +11,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS="-std=gnu99 $test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.linkunpriv.sh b/test/unittest/usdt/tst.linkunpriv.sh
index 9ef38639..1775db82 100755
--- a/test/unittest/usdt/tst.linkunpriv.sh
+++ b/test/unittest/usdt/tst.linkunpriv.sh
@@ -13,7 +13,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS="$test_cppflags"
 
 DIRNAME="$tmpdir/usdt-linkunpriv.$$.$RANDOM"
diff --git a/test/unittest/usdt/tst.manyprobes.sh b/test/unittest/usdt/tst.manyprobes.sh
index c0deb8df..080d9cda 100755
--- a/test/unittest/usdt/tst.manyprobes.sh
+++ b/test/unittest/usdt/tst.manyprobes.sh
@@ -11,7 +11,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 DIRNAME="$tmpdir/usdt-manyprobes.$$.$RANDOM"
diff --git a/test/unittest/usdt/tst.manyprocs.sh b/test/unittest/usdt/tst.manyprocs.sh
index 58550302..05cc8717 100755
--- a/test/unittest/usdt/tst.manyprocs.sh
+++ b/test/unittest/usdt/tst.manyprocs.sh
@@ -14,7 +14,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.multiple.sh b/test/unittest/usdt/tst.multiple.sh
index 440a7d7b..e6eab3e5 100755
--- a/test/unittest/usdt/tst.multiple.sh
+++ b/test/unittest/usdt/tst.multiple.sh
@@ -11,7 +11,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.multitrace.sh b/test/unittest/usdt/tst.multitrace.sh
index 262c7828..b73dd830 100755
--- a/test/unittest/usdt/tst.multitrace.sh
+++ b/test/unittest/usdt/tst.multitrace.sh
@@ -14,7 +14,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.onlyenabled.sh b/test/unittest/usdt/tst.onlyenabled.sh
index d3487834..8d84e3ec 100755
--- a/test/unittest/usdt/tst.onlyenabled.sh
+++ b/test/unittest/usdt/tst.onlyenabled.sh
@@ -11,7 +11,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.pie.sh b/test/unittest/usdt/tst.pie.sh
index 0d62c376..4ddae43e 100755
--- a/test/unittest/usdt/tst.pie.sh
+++ b/test/unittest/usdt/tst.pie.sh
@@ -11,7 +11,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS="-fno-inline -pie $test_cppflags"
 LDFLAGS="-pie $test_ldflags"
 
diff --git a/test/unittest/usdt/tst.reeval.sh b/test/unittest/usdt/tst.reeval.sh
index 371eee3d..9d49755a 100755
--- a/test/unittest/usdt/tst.reeval.sh
+++ b/test/unittest/usdt/tst.reeval.sh
@@ -12,7 +12,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.static.sh b/test/unittest/usdt/tst.static.sh
index 81b3ba04..d6dd4a7b 100755
--- a/test/unittest/usdt/tst.static.sh
+++ b/test/unittest/usdt/tst.static.sh
@@ -11,7 +11,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.static2.sh b/test/unittest/usdt/tst.static2.sh
index 115a9551..b7b1be16 100755
--- a/test/unittest/usdt/tst.static2.sh
+++ b/test/unittest/usdt/tst.static2.sh
@@ -15,7 +15,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.user.sh b/test/unittest/usdt/tst.user.sh
index 30513acc..30e897e3 100755
--- a/test/unittest/usdt/tst.user.sh
+++ b/test/unittest/usdt/tst.user.sh
@@ -13,7 +13,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
+CC=${CC:-/usr/bin/gcc}
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/utils/workload_analyze_loop.sh b/test/utils/workload_analyze_loop.sh
index 3bbadf78..1fb8c0b2 100755
--- a/test/utils/workload_analyze_loop.sh
+++ b/test/utils/workload_analyze_loop.sh
@@ -13,7 +13,7 @@ if [ ! -e $prog ]; then
 	exit 1
 fi
 
-objdump -d $prog | gawk -v myarch=$(uname -m) '
+${OBJDUMP:-objdump} -d $prog | gawk -v myarch=$(uname -m) '
 # decide whether to track instructions (which we number n = 1, 2, 3, ...) or not (n < 0)
 # specifically, do not track instructions until we find the disassembly for <main>
 BEGIN { n = -1; }
-- 
2.48.1

