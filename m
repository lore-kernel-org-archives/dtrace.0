Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECCF1B8EAE
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 20:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724962574; cv=none; b=Lb0IX9nDPmgyhRTO6krHI87sosxG96hcBo8OnD5baC9jeGWNVZAtwHtERYNVciGSV1Fwk36RdWtgnfVoIu/XGmSVGfOtyyDoJ9FXNLkSCAqogUPN11YrdrRReovN/z0oHSw+dRlGeyRotpIlaNrrrDxp8ItPVFXGRcLrc6TVlIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724962574; c=relaxed/simple;
	bh=mPFs+t0UArFo1EBcBzRvYaXZlnKO9cEc71aNPYt7j2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H9F9KyiY5/VI0/Q30KaW97y/AIuZMQZ1Ejt6TgruCk8PLxFK//Gu4AZsY0QgUpXcI+FGuBKJ/whz2us2iwJm8nzKrWNjT3l7/6RxQjaTSCKpRrLxUE5mYbJu44UMzLSq0y8hyKV2zH+1AwEnw3Kw/v5Cn9pwkNGxb2IJjm3IVTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: dtrace@lists.linux.dev
Cc: Sam James <sam@gentoo.org>
Subject: [PATCH 6/6] test: awk -> gawk universally
Date: Thu, 29 Aug 2024 21:15:46 +0100
Message-ID: <87e99a41e1b76c18181de5778ce3fdfe2348e971.1724962546.git.sam@gentoo.org>
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

It doesn't feel worth it to keep playing whack-a-mole with gawkisms;
just unconditionally call 'gawk' instead of 'awk' to avoid issues where
e.g. /usr/bin/awk is provided by mawk instead.

Kris already analysed a few non-obvious cases where e.g. we used regex
extensions. It's not a good use of time.

Besides, we have a few tests which *definitely* require gawk, and
there's no interest in rewriting those, so using awk elsewhere doesn't
gain us anything.

Kept comments referring to awk the tool. This commit is best reviewed
with --word-diff.

Note: I've *not* done anything outside of tests as that's a slightly
more controversial decision.
---
 runtest.sh                                         |  8 ++++----
 test/stress/options/tst.cpu-BEGIN.sh               |  2 +-
 test/stress/options/tst.cpu-END.sh                 |  2 +-
 test/stress/options/tst.cpu-cpc.sh                 |  2 +-
 test/stress/options/tst.cpu-profile.sh             |  2 +-
 test/stress/options/tst.cpu-syscall.sh             |  2 +-
 test/stress/options/tst.cpu-tick.sh                |  2 +-
 test/unittest/actions/freopen/tst.badfreopen.sh    |  2 +-
 test/unittest/actions/raise/tst.sigdefs.sh         |  2 +-
 test/unittest/actions/symmod/tst.symmod.sh         |  2 +-
 test/unittest/actions/trace/tst.array.r.p          |  2 +-
 test/unittest/aggs/tst.aggmod_full.sh              | 14 +++++++-------
 test/unittest/aggs/tst.aggmod_full.x               |  2 +-
 test/unittest/aggs/tst.aggmod_full2.sh             |  6 +++---
 test/unittest/aggs/tst.aggmod_full2.x              |  2 +-
 test/unittest/aggs/tst.multicpus.sh                |  2 +-
 test/unittest/bitfields/tst.bitfield-offset.x      |  2 +-
 test/unittest/codegen/tst.ALLOCA.r.p               |  2 +-
 test/unittest/codegen/tst.DPTR.r.p                 |  2 +-
 test/unittest/codegen/tst.kernel_read_str.r.p      |  2 +-
 .../consumer/tst.merge_ranges_bug25767469.x        |  2 +-
 test/unittest/cpc/tst.allcpus.sh                   |  4 ++--
 test/unittest/cpc/tst.args_kernel.sh               |  2 +-
 test/unittest/cpc/tst.args_user.sh                 |  4 ++--
 test/unittest/cpc/tst.instructions.sh              |  2 +-
 test/unittest/cpc/tst.list_cpc.sh                  |  2 +-
 test/unittest/disasm/tst.ann-agg.sh                |  2 +-
 test/unittest/disasm/tst.ann-bvar.sh               |  2 +-
 test/unittest/disasm/tst.ann-endian.sh             |  2 +-
 test/unittest/disasm/tst.ann-gvar-agg.sh           |  2 +-
 test/unittest/disasm/tst.ann-gvar-assoc.sh         |  2 +-
 test/unittest/disasm/tst.ann-js-neg.sh             |  2 +-
 test/unittest/disasm/tst.ann-reg-spill.sh          |  2 +-
 test/unittest/disasm/tst.ann-str_assoc.sh          |  2 +-
 test/unittest/disasm/tst.ann-str_gvar.sh           |  2 +-
 test/unittest/disasm/tst.ann-str_lvar.sh           |  2 +-
 test/unittest/disasm/tst.ann-str_tvar.sh           |  2 +-
 test/unittest/disasm/tst.ann-strconst-strtab.sh    |  2 +-
 test/unittest/disasm/tst.ann-strconst.sh           |  2 +-
 test/unittest/disasm/tst.ann-tramp-lvar.sh         |  2 +-
 test/unittest/disasm/tst.ann-tramp-tvar.sh         |  2 +-
 test/unittest/disasm/tst.ann-tvar-assoc.sh         |  2 +-
 test/unittest/disasm/tst.ann-tvar.sh               |  2 +-
 test/unittest/disasm/tst.ann-var.sh                |  2 +-
 test/unittest/disasm/tst.vartab-bvar-uregs0.sh     |  2 +-
 test/unittest/disasm/tst.vartab-bvar.sh            |  2 +-
 test/unittest/dtrace-util/tst.DisOption.sh         |  6 +++---
 .../dtrace-util/tst.ListProbesModuleClause.sh      |  2 +-
 test/unittest/error/tst.fault-location.sh          |  2 +-
 .../fbtprovider/err.D_ARGS_IDX.void-void.x         |  2 +-
 test/unittest/fbtprovider/err.D_ARGS_IDX.void.x    |  2 +-
 test/unittest/funcs/alloca/tst.alloca0-values.sh   |  2 +-
 test/unittest/funcs/tst.rand_inter.sh              |  4 ++--
 test/unittest/funcs/tst.rand_intra.sh              |  4 ++--
 test/unittest/io/check_io_probe_args.sh            |  8 ++++----
 test/unittest/io/tst.local.sh                      |  2 +-
 test/unittest/io/tst.local2.sh                     | 10 +++++-----
 test/unittest/io/tst.lv-done.r.p                   |  2 +-
 test/unittest/io/tst.nfs2.sh                       |  6 +++---
 test/unittest/io/tst.wait.sh                       |  2 +-
 test/unittest/ip/tst.ipv6localicmp.sh              |  2 +-
 test/unittest/ip/tst.ipv6remoteicmp.sh             |  2 +-
 .../lockstat/tst.lv-adaptive-acquire-error.r.p     |  2 +-
 .../lquantize/tst.normalize-bug26261502.sh         |  2 +-
 test/unittest/misc/tst.parser1.sh                  |  2 +-
 test/unittest/misc/tst.parser2.sh                  |  2 +-
 test/unittest/misc/tst.parser4.sh                  |  2 +-
 test/unittest/options/err.ctfpath.sh               |  2 +-
 test/unittest/options/tst.S.sh                     |  2 +-
 test/unittest/options/tst.core.sh                  |  2 +-
 test/unittest/options/tst.cppargs.sh               |  2 +-
 test/unittest/options/tst.cpphdrs.sh               |  2 +-
 test/unittest/options/tst.cpu-BEGIN.sh             |  2 +-
 test/unittest/options/tst.cpu-END.sh               |  2 +-
 test/unittest/options/tst.cpu-cpc.sh               |  2 +-
 test/unittest/options/tst.cpu-profile.sh           |  2 +-
 test/unittest/options/tst.cpu-syscall.sh           |  2 +-
 test/unittest/options/tst.cpu-tick.sh              |  2 +-
 test/unittest/options/tst.ctfpath.sh               |  2 +-
 test/unittest/options/tst.ctypes.sh                |  4 ++--
 test/unittest/options/tst.debug.sh                 |  2 +-
 test/unittest/options/tst.dtypes.sh                |  4 ++--
 test/unittest/options/tst.knodefs.sh               |  2 +-
 test/unittest/options/tst.linktype.sh              |  2 +-
 test/unittest/options/tst.modpath.sh               |  6 +++---
 test/unittest/options/tst.modpath.x                |  2 +-
 test/unittest/options/tst.strip.sh                 |  4 ++--
 test/unittest/options/tst.switchrate.sh            |  2 +-
 test/unittest/options/tst.verbose.sh               |  2 +-
 test/unittest/options/tst.version.sh               |  2 +-
 test/unittest/pid/tst.offsets.sh                   |  2 +-
 test/unittest/pid/tst.probemod.sh                  |  2 +-
 test/unittest/printf/tst.wide-bug30404549.sh       |  2 +-
 test/unittest/printf/tst.wide.sh                   |  2 +-
 test/unittest/profile-n/tst.args_kernel.sh         |  2 +-
 test/unittest/profile-n/tst.args_user.sh           |  4 ++--
 test/unittest/profile-n/tst.ufunc.sh               |  2 +-
 test/unittest/profile-n/tst.umod.sh                |  2 +-
 test/unittest/profile-n/tst.usym.sh                |  2 +-
 .../providers/rawtp/err.lockmem-too-low.sh         |  2 +-
 .../providers/rawtp/tst.lv-sched_process_fork.r.p  |  2 +-
 test/unittest/sched/tst.lv-dequeue.r.p             |  2 +-
 test/unittest/scripting/tst.egid.sh                |  2 +-
 test/unittest/scripting/tst.euid.sh                |  2 +-
 test/unittest/scripting/tst.sid-valid.sh           |  2 +-
 test/unittest/usdt/tst.dlclose1.r.p                |  2 +-
 .../ustack/tst.jstack_unprintable-bug26045010.sh   |  4 ++--
 test/unittest/variables/bvar/tst.curcpu_cpu_id.sh  |  2 +-
 test/unittest/variables/bvar/tst.id-valid.sh       |  2 +-
 test/unittest/variables/bvar/tst.offset-blank.sh   |  2 +-
 .../unittest/variables/gvar/tst.alignment-array.sh |  2 +-
 test/unittest/variables/gvar/tst.alignment-char.sh |  2 +-
 test/unittest/variables/gvar/tst.alignment-int.sh  |  2 +-
 test/unittest/variables/gvar/tst.alignment-long.sh |  2 +-
 test/unittest/variables/gvar/tst.alignment-ptr.sh  |  2 +-
 .../unittest/variables/gvar/tst.alignment-short.sh |  2 +-
 .../variables/gvar/tst.alignment-struct-2.sh       |  2 +-
 .../variables/gvar/tst.alignment-struct.sh         |  2 +-
 test/unittest/variables/gvar/tst.undecl-offset.sh  |  2 +-
 .../unittest/variables/lvar/tst.alignment-array.sh |  2 +-
 test/unittest/variables/lvar/tst.alignment-char.sh |  2 +-
 test/unittest/variables/lvar/tst.alignment-int.sh  |  2 +-
 test/unittest/variables/lvar/tst.alignment-long.sh |  2 +-
 test/unittest/variables/lvar/tst.alignment-ptr.sh  |  2 +-
 .../unittest/variables/lvar/tst.alignment-short.sh |  2 +-
 .../variables/lvar/tst.alignment-struct-2.sh       |  2 +-
 .../variables/lvar/tst.alignment-struct.sh         |  2 +-
 .../unittest/variables/tvar/tst.alignment-array.sh |  2 +-
 test/unittest/variables/tvar/tst.alignment-char.sh |  2 +-
 test/unittest/variables/tvar/tst.alignment-int.sh  |  2 +-
 test/unittest/variables/tvar/tst.alignment-long.sh |  2 +-
 test/unittest/variables/tvar/tst.alignment-ptr.sh  |  2 +-
 .../unittest/variables/tvar/tst.alignment-short.sh |  2 +-
 .../variables/tvar/tst.alignment-struct-2.sh       |  2 +-
 .../variables/tvar/tst.alignment-struct.sh         |  2 +-
 test/utils/clean_probes.sh                         |  2 +-
 test/utils/perf_count_event.sh                     |  2 +-
 test/utils/workload_analyze_loop.sh                |  2 +-
 138 files changed, 171 insertions(+), 171 deletions(-)

diff --git a/runtest.sh b/runtest.sh
index c720a8c9..681d748d 100755
--- a/runtest.sh
+++ b/runtest.sh
@@ -209,7 +209,7 @@ is_interpreter_file()
     if [[ ! -e $1 ]]; then
         return 1
     fi
-    if [[ $(awk '{print $1; exit}' $1) != "#!dtrace" ]]; then
+    if [[ $(gawk '{print $1; exit}' $1) != "#!dtrace" ]]; then
         return 1
     fi
 
@@ -629,7 +629,7 @@ for dt in $dtrace; do
     fi
 
     # Write out a list of loaded providers.
-    DTRACE_DEBUG= $dt -l | tail -n +2 | awk '{print $2;}' | sort -u > $tmpdir/providers
+    DTRACE_DEBUG= $dt -l | tail -n +2 | gawk '{print $2;}' | sort -u > $tmpdir/providers
 
     unset LD_LIBRARY_PATH
     break
@@ -1504,7 +1504,7 @@ if [[ -n $regression ]]; then
 else
     # Test summary.
 
-    awk -f - $SUMFILE <<'EOF' | tee -a $LOGFILE $SUMFILE
+    gawk -f - $SUMFILE <<'EOF' | tee -a $LOGFILE $SUMFILE
 {
 	rc = 0;
 }
@@ -1543,7 +1543,7 @@ for name in build*; do
         genhtml --frames --show-details -o $logdir/coverage \
                 --title "DTrace userspace coverage" \
                 --highlight --legend $logdir/coverage/coverage.lcov | \
-            awk 'BEGIN { quiet=1; } { if (!quiet) { print ($0); } } /^Overall coverage rate:$/ { quiet=0; }' | \
+            gawk 'BEGIN { quiet=1; } { if (!quiet) { print ($0); } } /^Overall coverage rate:$/ { quiet=0; }' | \
             tee -a $LOGFILE $SUMFILE
     fi
 done
diff --git a/test/stress/options/tst.cpu-BEGIN.sh b/test/stress/options/tst.cpu-BEGIN.sh
index 24d60767..46bed505 100755
--- a/test/stress/options/tst.cpu-BEGIN.sh
+++ b/test/stress/options/tst.cpu-BEGIN.sh
@@ -11,7 +11,7 @@ dtrace=$1
 nerr=0
 
 # Loop over CPUs.
-for cpu0 in `awk '/^processor[ 	]*: [0-9]*$/ {print $3}' /proc/cpuinfo`; do
+for cpu0 in `gawk '/^processor[ 	]*: [0-9]*$/ {print $3}' /proc/cpuinfo`; do
 	# Observe where DTrace runs.
 	cpu=`$dtrace $dt_flags -xcpu=$cpu0 -qn 'BEGIN { trace(cpu); exit(0); }'`
 
diff --git a/test/stress/options/tst.cpu-END.sh b/test/stress/options/tst.cpu-END.sh
index 0568d6db..200cc4cc 100755
--- a/test/stress/options/tst.cpu-END.sh
+++ b/test/stress/options/tst.cpu-END.sh
@@ -11,7 +11,7 @@ dtrace=$1
 nerr=0
 
 # Loop over CPUs.
-for cpu0 in `awk '/^processor[ 	]*: [0-9]*$/ {print $3}' /proc/cpuinfo`; do
+for cpu0 in `gawk '/^processor[ 	]*: [0-9]*$/ {print $3}' /proc/cpuinfo`; do
 	# Observe where DTrace runs.
 	cpu=`$dtrace $dt_flags -xcpu=$cpu0 -qn 'BEGIN { exit(0) } END { trace(cpu); }'`
 
diff --git a/test/stress/options/tst.cpu-cpc.sh b/test/stress/options/tst.cpu-cpc.sh
index 99e1c5dd..18e9b30a 100755
--- a/test/stress/options/tst.cpu-cpc.sh
+++ b/test/stress/options/tst.cpu-cpc.sh
@@ -11,7 +11,7 @@ dtrace=$1
 nerr=0
 
 # Loop over CPUs.
-for cpu0 in `awk '/^processor[ 	]*: [0-9]*$/ {print $3}' /proc/cpuinfo`; do
+for cpu0 in `gawk '/^processor[ 	]*: [0-9]*$/ {print $3}' /proc/cpuinfo`; do
 	# Observe where DTrace runs.
 	cpu=`$dtrace $dt_flags -xcpu=$cpu0 -qn 'cpc:::cpu_clock-all-100000000 { trace(cpu); exit(0); }'`
 
diff --git a/test/stress/options/tst.cpu-profile.sh b/test/stress/options/tst.cpu-profile.sh
index 51745f8b..31b28176 100755
--- a/test/stress/options/tst.cpu-profile.sh
+++ b/test/stress/options/tst.cpu-profile.sh
@@ -11,7 +11,7 @@ dtrace=$1
 nerr=0
 
 # Loop over CPUs.
-for cpu0 in `awk '/^processor[ 	]*: [0-9]*$/ {print $3}' /proc/cpuinfo`; do
+for cpu0 in `gawk '/^processor[ 	]*: [0-9]*$/ {print $3}' /proc/cpuinfo`; do
 	# Observe where DTrace runs.
 	cpu=`$dtrace $dt_flags -xcpu=$cpu0 -qn 'profile-100ms { trace(cpu); exit(0); }'`
 
diff --git a/test/stress/options/tst.cpu-syscall.sh b/test/stress/options/tst.cpu-syscall.sh
index 33f3295c..6fb09d48 100755
--- a/test/stress/options/tst.cpu-syscall.sh
+++ b/test/stress/options/tst.cpu-syscall.sh
@@ -101,7 +101,7 @@ fi
 # Get CPU list and form expected-results file.
 #
 
-cpulist=`awk '/^processor[ 	]: [0-9]*$/ { print $3 }' /proc/cpuinfo`
+cpulist=`gawk '/^processor[ 	]: [0-9]*$/ { print $3 }' /proc/cpuinfo`
 echo $cpulist
 
 echo > expect.txt
diff --git a/test/stress/options/tst.cpu-tick.sh b/test/stress/options/tst.cpu-tick.sh
index 0d0c04d7..a38ee78b 100755
--- a/test/stress/options/tst.cpu-tick.sh
+++ b/test/stress/options/tst.cpu-tick.sh
@@ -11,7 +11,7 @@ dtrace=$1
 nerr=0
 
 # Loop over CPUs.
-for cpu0 in `awk '/^processor[ 	]*: [0-9]*$/ {print $3}' /proc/cpuinfo`; do
+for cpu0 in `gawk '/^processor[ 	]*: [0-9]*$/ {print $3}' /proc/cpuinfo`; do
 	# Observe where DTrace runs.
 	cpu=`$dtrace $dt_flags -xcpu=$cpu0 -qn 'tick-100ms { trace(cpu); exit(0); }'`
 
diff --git a/test/unittest/actions/freopen/tst.badfreopen.sh b/test/unittest/actions/freopen/tst.badfreopen.sh
index 39efd16e..916692f1 100755
--- a/test/unittest/actions/freopen/tst.badfreopen.sh
+++ b/test/unittest/actions/freopen/tst.badfreopen.sh
@@ -67,7 +67,7 @@ if [ "$status" -eq 0 ]; then
 		status=100
 	fi
 	
-	i=`wc -l $errfile | awk '{ print $1 }'`
+	i=`wc -l $errfile | gawk '{ print $1 }'`
 
 	if [ "$i" -lt 6 ]; then
 		echo "$0: expected at least 6 lines of stderr, found $i lines"
diff --git a/test/unittest/actions/raise/tst.sigdefs.sh b/test/unittest/actions/raise/tst.sigdefs.sh
index 1e2ddc8f..d3ffb534 100755
--- a/test/unittest/actions/raise/tst.sigdefs.sh
+++ b/test/unittest/actions/raise/tst.sigdefs.sh
@@ -20,7 +20,7 @@ BEGIN
 EOF
 
 cat /usr/include/signal.h \
-| awk '
+| gawk '
     /SIGRTMIN/ || /SIGRTMAX/ || /SIGSTKSZ/ { next }
     /^#define[[:blank:]]*SIG[[:alnum:]]/ { signum[$2] = $3 }
     END {
diff --git a/test/unittest/actions/symmod/tst.symmod.sh b/test/unittest/actions/symmod/tst.symmod.sh
index f34a538d..2950c9b7 100755
--- a/test/unittest/actions/symmod/tst.symmod.sh
+++ b/test/unittest/actions/symmod/tst.symmod.sh
@@ -9,7 +9,7 @@
 dtrace=$1
 
 # pick a test symbol from /proc/kallsyms
-read ADD NAM MOD <<< `awk '/ ksys_write/ {print $1, $3, $4}' /proc/kallsyms`
+read ADD NAM MOD <<< `gawk '/ ksys_write/ {print $1, $3, $4}' /proc/kallsyms`
 
 # a blank module means the module is vmlinux
 if [ x$MOD == x ]; then
diff --git a/test/unittest/actions/trace/tst.array.r.p b/test/unittest/actions/trace/tst.array.r.p
index 3ee0b5a9..b8cc8daf 100755
--- a/test/unittest/actions/trace/tst.array.r.p
+++ b/test/unittest/actions/trace/tst.array.r.p
@@ -1,4 +1,4 @@
-#!/usr/bin/awk -f
+#!/usr/bin/gawk -f
 
 # Some Linux kernel versions leave garbage at the end of the string.
 { sub(/( [0-9A-F]{2}){9}  /, " 00 00 00 00 00 00 00 00 00  "); }
diff --git a/test/unittest/aggs/tst.aggmod_full.sh b/test/unittest/aggs/tst.aggmod_full.sh
index 120879d5..31d5cd23 100755
--- a/test/unittest/aggs/tst.aggmod_full.sh
+++ b/test/unittest/aggs/tst.aggmod_full.sh
@@ -42,7 +42,7 @@ dtrace=$1
 # progress variables (read the timeout listed above)
 # (use "@''@" instead of "@@" so that runtest.sh will not see this line)
 
-timeout=`awk '/^# @''@timeout: [0-9]/ {print $NF}' $0 | head -1`
+timeout=`gawk '/^# @''@timeout: [0-9]/ {print $NF}' $0 | head -1`
 progress_stop_time=$((`date +%s` + $timeout - 5))
 progress_done=0
 progress_goal=0
@@ -74,7 +74,7 @@ cd $DIRNAME
 #   . type (3rd field) is "a"
 #   . type (3rd field) is "A"
 # - can add special cases based on symbol name (4th field)
-awk '
+gawk '
 NF == 4 && $4 == "__init_scratch_begin" {
   while ($4 != "__init_scratch_end") getline;
   next;
@@ -98,7 +98,7 @@ for x in \[*; do
 	#     dtrace: failed to enable $modname.d:
 	#       DIF program exceeds maximum program size
 	shuf $x \
-	| awk '{printf "@[mod(0x%s)] = count();\n", $1;}' \
+	| gawk '{printf "@[mod(0x%s)] = count();\n", $1;}' \
 	| split --lines=600 - $modname@
 
 	# increment progress goal by the number of addresses
@@ -142,7 +142,7 @@ while [[ $(find . -name "*@*" -print -quit | wc -l) -gt 0 ]]; do
 	echo "}" >> D.d
 
 	# run D script
-	$dtrace -q $dt_flags -s D.d -c echo | awk 'NF>0' >& D.out
+	$dtrace -q $dt_flags -s D.d -c echo | gawk 'NF>0' >& D.out
 	status=$?
 	if [[ "$status" -ne 0 ]]; then
 		report_error "$tst: dtrace failed"
@@ -186,8 +186,8 @@ while [[ $(find . -name "*@*" -print -quit | wc -l) -gt 0 ]]; do
 	fi
 
 	# extract the data
-	check_modname=`awk '{print $1}' D.out`
-	check_count=`awk '{print $2}' D.out`
+	check_modname=`gawk '{print $1}' D.out`
+	check_count=`gawk '{print $2}' D.out`
 
 	# special case
 	[[ $modname == "ctf" ]] && modname="shared_ctf"
@@ -233,7 +233,7 @@ if [[ $progress_done -lt $progress_done_min ]]; then
 	exit 1
 fi
 
-echo $progress_done $progress_goal | awk '
+echo $progress_done $progress_goal | gawk '
 {printf "SUCCESS: tested %d of %d addresses = %.1f%%\n", $1, $2, 100. * $1 / $2;}'
 exit 0
 
diff --git a/test/unittest/aggs/tst.aggmod_full.x b/test/unittest/aggs/tst.aggmod_full.x
index f06df66e..bfb4bc18 100755
--- a/test/unittest/aggs/tst.aggmod_full.x
+++ b/test/unittest/aggs/tst.aggmod_full.x
@@ -16,7 +16,7 @@
 # often of the form __key.*.  If there are few (2-3), the bug is present
 # and this test should not be run.
 
-nzero=`awk '/ 0 /; / _end$/ || / __brk_limit$/ {exit(0);}' /proc/kallmodsyms  | wc -l`
+nzero=`gawk '/ 0 /; / _end$/ || / __brk_limit$/ {exit(0);}' /proc/kallmodsyms  | wc -l`
 
 if [[ $nzero -lt 20 ]]; then
 	echo "unpatched kernel? /proc/kallmodsyms symbol sizes look suspicious"
diff --git a/test/unittest/aggs/tst.aggmod_full2.sh b/test/unittest/aggs/tst.aggmod_full2.sh
index 100eb561..bb984af1 100755
--- a/test/unittest/aggs/tst.aggmod_full2.sh
+++ b/test/unittest/aggs/tst.aggmod_full2.sh
@@ -173,7 +173,7 @@ fi
 # having the trigger bounce among CPUs.  Then the (per-CPU) aggsize
 # could be reduced.
 $dtrace $dt_flags -xstrsize=48 -xaggsize=16m -c ./a.out -o output.txt -s /dev/stdin << EOF \
-    2> errors.txt | sort | uniq -c | awk '{print $1, $2}' > modules.txt
+    2> errors.txt | sort | uniq -c | gawk '{print $1, $2}' > modules.txt
 test_prov\$target:::
 {
 	@[mod(arg0), copyinstr(arg1)] = count();
@@ -201,7 +201,7 @@ fi
 #     - sorted by module name
 # ==================================================
 
-awk '
+gawk '
     NF>0 {
         if ($1 != $2) { print "ERROR module name mismatch:", $0 };
         print $3, $1;
@@ -212,7 +212,7 @@ if [[ `grep -c "ERROR module name mismatch" output2.txt` -gt 0 ]]; then
 	echo "ERROR: DTrace mismatches between mod(addr) and modname"
 	echo "  first  column is mod(addr)"
 	echo "  second column is modname"
-	awk '/ERROR module name mismatch/ {print $5, $6}' output2.txt
+	gawk '/ERROR module name mismatch/ {print $5, $6}' output2.txt
 	exit 1
 fi
 
diff --git a/test/unittest/aggs/tst.aggmod_full2.x b/test/unittest/aggs/tst.aggmod_full2.x
index 9d684954..3660504a 100755
--- a/test/unittest/aggs/tst.aggmod_full2.x
+++ b/test/unittest/aggs/tst.aggmod_full2.x
@@ -24,7 +24,7 @@ fi
 # often of the form __key.*.  If there are few (2-3), the bug is present
 # and this test should not be run.
 
-nzero=`awk '/ 0 /; / _end$/ || / __brk_limit$/ {exit(0);}' /proc/kallmodsyms  | wc -l`
+nzero=`gawk '/ 0 /; / _end$/ || / __brk_limit$/ {exit(0);}' /proc/kallmodsyms  | wc -l`
 
 if [[ $nzero -lt 20 ]]; then
 	echo "unpatched kernel? /proc/kallmodsyms symbol sizes look suspicious"
diff --git a/test/unittest/aggs/tst.multicpus.sh b/test/unittest/aggs/tst.multicpus.sh
index 23b5c08d..bc436684 100755
--- a/test/unittest/aggs/tst.multicpus.sh
+++ b/test/unittest/aggs/tst.multicpus.sh
@@ -43,7 +43,7 @@ fi
 # Examine the results.
 #
 
-awk '
+gawk '
     BEGIN {
         xcnt = xavg = xstm = xstd = xsum = 0;
         xmin = +1000000000;
diff --git a/test/unittest/bitfields/tst.bitfield-offset.x b/test/unittest/bitfields/tst.bitfield-offset.x
index 783e15fe..ae57c2b5 100755
--- a/test/unittest/bitfields/tst.bitfield-offset.x
+++ b/test/unittest/bitfields/tst.bitfield-offset.x
@@ -24,4 +24,4 @@ trap "rm -f $ctfa" EXIT ERR
 objcopy --add-section=.ctf=/lib/modules/$(uname -r)/kernel/vmlinux.ctfa /bin/true $ctfa
 
 objdump --ctf=.ctf --ctf-parent=shared_ctf $ctfa |\
-    awk '/Version: 3/ { exit 1; } /Version: / { exit 0; }'
+    gawk '/Version: 3/ { exit 1; } /Version: / { exit 0; }'
diff --git a/test/unittest/codegen/tst.ALLOCA.r.p b/test/unittest/codegen/tst.ALLOCA.r.p
index 49503319..158a693e 100755
--- a/test/unittest/codegen/tst.ALLOCA.r.p
+++ b/test/unittest/codegen/tst.ALLOCA.r.p
@@ -1,4 +1,4 @@
-#!/usr/bin/awk -f
+#!/usr/bin/gawk -f
 
 # set flag to look for the clause
 BEGIN { read_clause = 0 }
diff --git a/test/unittest/codegen/tst.DPTR.r.p b/test/unittest/codegen/tst.DPTR.r.p
index c49fb909..2a7c0701 100755
--- a/test/unittest/codegen/tst.DPTR.r.p
+++ b/test/unittest/codegen/tst.DPTR.r.p
@@ -1,4 +1,4 @@
-#!/usr/bin/awk -f
+#!/usr/bin/gawk -f
 
 # set flag to look for the clause
 BEGIN { read_clause = 0 }
diff --git a/test/unittest/codegen/tst.kernel_read_str.r.p b/test/unittest/codegen/tst.kernel_read_str.r.p
index 76273310..93c46bfa 100755
--- a/test/unittest/codegen/tst.kernel_read_str.r.p
+++ b/test/unittest/codegen/tst.kernel_read_str.r.p
@@ -1,4 +1,4 @@
-#!/usr/bin/awk -f
+#!/usr/bin/gawk -f
 
 { print; }
 /^Linux version / { ok = 1; exit(0); }
diff --git a/test/unittest/consumer/tst.merge_ranges_bug25767469.x b/test/unittest/consumer/tst.merge_ranges_bug25767469.x
index 94239b47..7e265f2f 100755
--- a/test/unittest/consumer/tst.merge_ranges_bug25767469.x
+++ b/test/unittest/consumer/tst.merge_ranges_bug25767469.x
@@ -12,7 +12,7 @@
 # often of the form __key.*.  If there are few (2-3), the bug is present
 # and this test should not be run.
 
-nzero=`awk '/ 0 /; / _end$/ || / __brk_limit$/ {exit(0);}' /proc/kallmodsyms  | wc -l`
+nzero=`gawk '/ 0 /; / _end$/ || / __brk_limit$/ {exit(0);}' /proc/kallmodsyms  | wc -l`
 
 if [[ $nzero -lt 20 ]]; then
 	echo "unpatched kernel? /proc/kallmodsyms symbol sizes look suspicious"
diff --git a/test/unittest/cpc/tst.allcpus.sh b/test/unittest/cpc/tst.allcpus.sh
index 94304801..1a09267b 100755
--- a/test/unittest/cpc/tst.allcpus.sh
+++ b/test/unittest/cpc/tst.allcpus.sh
@@ -28,9 +28,9 @@ cpc:::cpu_clock-all-1000000000
 tick-2s
 {
 	exit(0);
-}' | awk 'NF != 0 {print}' | sort > dtrace.out
+}' | gawk 'NF != 0 {print}' | sort > dtrace.out
 
-awk '/^processor/ {print $3}' /proc/cpuinfo | sort > cpuinfo.out
+gawk '/^processor/ {print $3}' /proc/cpuinfo | sort > cpuinfo.out
 
 if ! diff -q dtrace.out cpuinfo.out > /dev/null; then
 	echo dtrace output
diff --git a/test/unittest/cpc/tst.args_kernel.sh b/test/unittest/cpc/tst.args_kernel.sh
index 9d7bb652..81baec47 100755
--- a/test/unittest/cpc/tst.args_kernel.sh
+++ b/test/unittest/cpc/tst.args_kernel.sh
@@ -43,7 +43,7 @@ $dtrace $dt_flags -qn '
 	/pid == $target/
 	{
 		printf("%x %x\n", arg0, arg1);
-	}' -c "$utils/$target $niters" | awk 'NF == 2' | sort | uniq -c > D.out
+	}' -c "$utils/$target $niters" | gawk 'NF == 2' | sort | uniq -c > D.out
 if [[ $? -ne 0 ]]; then
 	echo ERROR running DTrace
 	cat D.out
diff --git a/test/unittest/cpc/tst.args_user.sh b/test/unittest/cpc/tst.args_user.sh
index 16feddf3..73643364 100755
--- a/test/unittest/cpc/tst.args_user.sh
+++ b/test/unittest/cpc/tst.args_user.sh
@@ -18,7 +18,7 @@ cd $tmpfile
 target=workload_user
 
 # dump the loop PCs
-$utils/workload_analyze_loop.sh $target | awk 'NF == 1' > PCs.txt
+$utils/workload_analyze_loop.sh $target | gawk 'NF == 1' > PCs.txt
 echo PCs in the loop: `cat PCs.txt`
 
 # determine number of iterations for target number of seconds
@@ -47,7 +47,7 @@ $dtrace $dt_flags -qn '
 	/pid == $target/
 	{
 		printf("%x %x\n", arg0, arg1);
-	}' -c "$utils/$target $niters" | awk 'NF == 2' | sort | uniq -c > D.out
+	}' -c "$utils/$target $niters" | gawk 'NF == 2' | sort | uniq -c > D.out
 if [[ $? -ne 0 ]]; then
 	echo ERROR running DTrace
 	cat D.out
diff --git a/test/unittest/cpc/tst.instructions.sh b/test/unittest/cpc/tst.instructions.sh
index a4663837..a7fad3e7 100755
--- a/test/unittest/cpc/tst.instructions.sh
+++ b/test/unittest/cpc/tst.instructions.sh
@@ -23,7 +23,7 @@ if [ $niters -lt 0 ]; then
 fi
 
 # determine the number of instructions per loop iteration
-ninstructions_per_iter=`$utils/workload_analyze_loop.sh workload_user | awk '{print $1; exit 0}'`
+ninstructions_per_iter=`$utils/workload_analyze_loop.sh workload_user | gawk '{print $1; exit 0}'`
 if [ $ninstructions_per_iter -lt 0 ]; then
 	echo could not determine number of instructions per loop
 	exit 1
diff --git a/test/unittest/cpc/tst.list_cpc.sh b/test/unittest/cpc/tst.list_cpc.sh
index 4455ea49..6b040f11 100755
--- a/test/unittest/cpc/tst.list_cpc.sh
+++ b/test/unittest/cpc/tst.list_cpc.sh
@@ -20,7 +20,7 @@ if [ $? -ne 0 ]; then
 	exit 1
 fi
 
-awk '
+gawk '
 BEGIN { cpu_clock = task_clock = 0 }
 $2 == "cpc" && index($3, "perf_count_sw_cpu_clock-") { cpu_clock = 1; next }
 $2 == "cpc" && index($3, "perf_count_sw_task_clock-") { task_clock = 1; next }
diff --git a/test/unittest/disasm/tst.ann-agg.sh b/test/unittest/disasm/tst.ann-agg.sh
index 3f8e74a4..48ec3706 100755
--- a/test/unittest/disasm/tst.ann-agg.sh
+++ b/test/unittest/disasm/tst.ann-agg.sh
@@ -17,6 +17,6 @@ BEGIN
 	@myvar_agg_min = min(myvar_global);
 	exit(0);
 }
-' 2>&1 | awk '/ call dt_get_agg/ { sub(/^[^:]+: /, ""); print; }'
+' 2>&1 | gawk '/ call dt_get_agg/ { sub(/^[^:]+: /, ""); print; }'
 
 exit $?
diff --git a/test/unittest/disasm/tst.ann-bvar.sh b/test/unittest/disasm/tst.ann-bvar.sh
index 1986de66..6dc43424 100755
--- a/test/unittest/disasm/tst.ann-bvar.sh
+++ b/test/unittest/disasm/tst.ann-bvar.sh
@@ -47,6 +47,6 @@ sdt:task::task_rename
 	trace(walltimestamp);
 	exit(0);
 }
-' 2>&1 | awk '/ call dt_get_bvar/ { sub(/^[^:]+: /, ""); print; }'
+' 2>&1 | gawk '/ call dt_get_bvar/ { sub(/^[^:]+: /, ""); print; }'
 
 exit $?
diff --git a/test/unittest/disasm/tst.ann-endian.sh b/test/unittest/disasm/tst.ann-endian.sh
index df3ac9c1..2bba127a 100755
--- a/test/unittest/disasm/tst.ann-endian.sh
+++ b/test/unittest/disasm/tst.ann-endian.sh
@@ -16,7 +16,7 @@ sdt:task::task_rename
 	htonll(1234);
 }
 ' 2>&1 | \
-	awk '/ tobe / {
+	gawk '/ tobe / {
                 sub(/^[^:]+: /, "");
 		sub(/^dc [0-9] /, "dc X ");
 		sub(/%r[0-9],/, "%rX,");
diff --git a/test/unittest/disasm/tst.ann-gvar-agg.sh b/test/unittest/disasm/tst.ann-gvar-agg.sh
index 81f1c511..1b6ece91 100755
--- a/test/unittest/disasm/tst.ann-gvar-agg.sh
+++ b/test/unittest/disasm/tst.ann-gvar-agg.sh
@@ -17,6 +17,6 @@ BEGIN
 	myvar_global = 0xdeadbeef;
 	exit(0);
 }
-' 2>&1 | grep -A4 deadbeef | awk '/myvar_/ {print $NF}'
+' 2>&1 | grep -A4 deadbeef | gawk '/myvar_/ {print $NF}'
 
 exit $?
diff --git a/test/unittest/disasm/tst.ann-gvar-assoc.sh b/test/unittest/disasm/tst.ann-gvar-assoc.sh
index 6690967d..4528be96 100755
--- a/test/unittest/disasm/tst.ann-gvar-assoc.sh
+++ b/test/unittest/disasm/tst.ann-gvar-assoc.sh
@@ -17,6 +17,6 @@ BEGIN
 	trace(ld[5]);
 	exit(0);
 }
-' 2>&1 | awk '/ call dt_get_assoc/ { sub(/^[^:]+: /, ""); print; }'
+' 2>&1 | gawk '/ call dt_get_assoc/ { sub(/^[^:]+: /, ""); print; }'
 
 exit $?
diff --git a/test/unittest/disasm/tst.ann-js-neg.sh b/test/unittest/disasm/tst.ann-js-neg.sh
index 0914d3fe..6b266e83 100755
--- a/test/unittest/disasm/tst.ann-js-neg.sh
+++ b/test/unittest/disasm/tst.ann-js-neg.sh
@@ -14,7 +14,7 @@ BEGIN, syscall::write:return
 	exit(0);
 }
 ' 2>&1 | \
-	awk '/js[a-z]+/ {
+	gawk '/js[a-z]+/ {
 		sub(/^[^:]+: /, "");
 		sub(/ +!.*$/, "");
 		sub(/ [0-9a-f]{4} /, " XXXX ");
diff --git a/test/unittest/disasm/tst.ann-reg-spill.sh b/test/unittest/disasm/tst.ann-reg-spill.sh
index 16786947..bfcebaaf 100755
--- a/test/unittest/disasm/tst.ann-reg-spill.sh
+++ b/test/unittest/disasm/tst.ann-reg-spill.sh
@@ -22,6 +22,6 @@ BEGIN
 	i = 9;
 	trace(++a + (++b + (++c + (++d + (++e + (++f + (++g + (++h + ++i))))))));
 	exit(0);
-}' 2>&1 | awk '/! (spill|restore)/ { sub(/^[^:]+: /, ""); print; next; }
+}' 2>&1 | gawk '/! (spill|restore)/ { sub(/^[^:]+: /, ""); print; next; }
 	       { s = $0; }
 	       END { print s; }'
diff --git a/test/unittest/disasm/tst.ann-str_assoc.sh b/test/unittest/disasm/tst.ann-str_assoc.sh
index 05d42705..6f36d5d2 100755
--- a/test/unittest/disasm/tst.ann-str_assoc.sh
+++ b/test/unittest/disasm/tst.ann-str_assoc.sh
@@ -14,6 +14,6 @@ BEGIN
 	CheckVariable[1234] = "abc";
 	trace(CheckVariable[1234]);
 }
-' 2>&1 | awk '/ call dt_get_assoc/ { sub(/^[^:]+: /, ""); print; }'
+' 2>&1 | gawk '/ call dt_get_assoc/ { sub(/^[^:]+: /, ""); print; }'
 
 exit $?
diff --git a/test/unittest/disasm/tst.ann-str_gvar.sh b/test/unittest/disasm/tst.ann-str_gvar.sh
index 6b2d4d52..74f6b6a6 100755
--- a/test/unittest/disasm/tst.ann-str_gvar.sh
+++ b/test/unittest/disasm/tst.ann-str_gvar.sh
@@ -14,7 +14,7 @@ BEGIN
 	CheckVariable = "abc";
 	trace(CheckVariable);
 }
-' 2>&1 | awk '/ CheckV/ {
+' 2>&1 | gawk '/ CheckV/ {
 		sub(/^[^:]+: /, "");          # strip line number
 
 		gsub(/%r[0-9]/, "%rX");       # hide reg numbers
diff --git a/test/unittest/disasm/tst.ann-str_lvar.sh b/test/unittest/disasm/tst.ann-str_lvar.sh
index 2708dab3..d80c0c99 100755
--- a/test/unittest/disasm/tst.ann-str_lvar.sh
+++ b/test/unittest/disasm/tst.ann-str_lvar.sh
@@ -14,7 +14,7 @@ BEGIN
 	this->CheckVariable = "abc";
 	trace(this->CheckVariable);
 }
-' 2>&1 | awk '/this->CheckV/ {
+' 2>&1 | gawk '/this->CheckV/ {
 		sub(/^[^:]+: /, "");          # strip line number
 
 		gsub(/%r[0-9]/, "%rX");       # hide reg numbers
diff --git a/test/unittest/disasm/tst.ann-str_tvar.sh b/test/unittest/disasm/tst.ann-str_tvar.sh
index ebbdf8be..b5d42a82 100755
--- a/test/unittest/disasm/tst.ann-str_tvar.sh
+++ b/test/unittest/disasm/tst.ann-str_tvar.sh
@@ -14,6 +14,6 @@ BEGIN
 	self->CheckVariable = "abc";
 	trace(self->CheckVariable);
 }
-' 2>&1 | awk '/ call dt_get_tvar/ { sub(/^[^:]+: /, ""); print; }'
+' 2>&1 | gawk '/ call dt_get_tvar/ { sub(/^[^:]+: /, ""); print; }'
 
 exit $?
diff --git a/test/unittest/disasm/tst.ann-strconst-strtab.sh b/test/unittest/disasm/tst.ann-strconst-strtab.sh
index 76a65604..fdbe0203 100755
--- a/test/unittest/disasm/tst.ann-strconst-strtab.sh
+++ b/test/unittest/disasm/tst.ann-strconst-strtab.sh
@@ -22,7 +22,7 @@ BEGIN
 	exit(0);
 }
 ' 2>&1 | \
-	awk '/^Disassembly of/ {
+	gawk '/^Disassembly of/ {
 		kind = $3;
 		next;
 	     }
diff --git a/test/unittest/disasm/tst.ann-strconst.sh b/test/unittest/disasm/tst.ann-strconst.sh
index 81e1268c..7ddaee42 100755
--- a/test/unittest/disasm/tst.ann-strconst.sh
+++ b/test/unittest/disasm/tst.ann-strconst.sh
@@ -15,7 +15,7 @@ BEGIN
 	exit(0);
 }
 ' 2>&1 | \
-	awk '/ ! "strconst"/ {
+	gawk '/ ! "strconst"/ {
 		sub(/^[^:]+: /, "");
 		sub(/^07 [0-9] /, "07 X ");
 		sub(/[0-9a-f]{8}    add/, "XXXXXXXX    add");
diff --git a/test/unittest/disasm/tst.ann-tramp-lvar.sh b/test/unittest/disasm/tst.ann-tramp-lvar.sh
index 03f67ad6..3f25f4b6 100755
--- a/test/unittest/disasm/tst.ann-tramp-lvar.sh
+++ b/test/unittest/disasm/tst.ann-tramp-lvar.sh
@@ -14,7 +14,7 @@ io:::start
 {
 	exit(0);
 }
-' 2>&1 | awk '/this->/ {
+' 2>&1 | gawk '/this->/ {
 		sub(/^[^:]+: /, "");
 
 		gsub(/%r[0-9]/, "%rX");
diff --git a/test/unittest/disasm/tst.ann-tramp-tvar.sh b/test/unittest/disasm/tst.ann-tramp-tvar.sh
index c66e264c..a36dcff9 100755
--- a/test/unittest/disasm/tst.ann-tramp-tvar.sh
+++ b/test/unittest/disasm/tst.ann-tramp-tvar.sh
@@ -14,6 +14,6 @@ io:::wait-done
 {
 	exit(0);
 }
-' 2>&1 | awk '/ call dt_get_tvar/ { sub(/^[^:]+: /, ""); print; }'
+' 2>&1 | gawk '/ call dt_get_tvar/ { sub(/^[^:]+: /, ""); print; }'
 
 exit $?
diff --git a/test/unittest/disasm/tst.ann-tvar-assoc.sh b/test/unittest/disasm/tst.ann-tvar-assoc.sh
index 354d8fbe..3b0d6080 100755
--- a/test/unittest/disasm/tst.ann-tvar-assoc.sh
+++ b/test/unittest/disasm/tst.ann-tvar-assoc.sh
@@ -17,6 +17,6 @@ BEGIN
 	trace(self->ld[5]);
 	exit(0);
 }
-' 2>&1 | awk '/ call dt_get_assoc/ { sub(/^[^:]+: /, ""); print; }'
+' 2>&1 | gawk '/ call dt_get_assoc/ { sub(/^[^:]+: /, ""); print; }'
 
 exit $?
diff --git a/test/unittest/disasm/tst.ann-tvar.sh b/test/unittest/disasm/tst.ann-tvar.sh
index 729e703c..6c47566d 100755
--- a/test/unittest/disasm/tst.ann-tvar.sh
+++ b/test/unittest/disasm/tst.ann-tvar.sh
@@ -16,6 +16,6 @@ BEGIN
 	self->three = 42;
 	exit(0);
 }
-' 2>&1 | awk '/ call dt_get_tvar/ { sub(/^[^:]+: /, ""); print; }'
+' 2>&1 | gawk '/ call dt_get_tvar/ { sub(/^[^:]+: /, ""); print; }'
 
 exit $?
diff --git a/test/unittest/disasm/tst.ann-var.sh b/test/unittest/disasm/tst.ann-var.sh
index 68a827b6..60063b33 100755
--- a/test/unittest/disasm/tst.ann-var.sh
+++ b/test/unittest/disasm/tst.ann-var.sh
@@ -50,4 +50,4 @@ BEGIN {
     trace(this->CheckVariable_x);
     trace(      CheckVariable_Y);
     trace(this->CheckVariable_z);
-}' |& awk '/ ! (|this->)CheckVariable_/ { print $NF }'
+}' |& gawk '/ ! (|this->)CheckVariable_/ { print $NF }'
diff --git a/test/unittest/disasm/tst.vartab-bvar-uregs0.sh b/test/unittest/disasm/tst.vartab-bvar-uregs0.sh
index 9a37f4bd..41ddce1a 100755
--- a/test/unittest/disasm/tst.vartab-bvar-uregs0.sh
+++ b/test/unittest/disasm/tst.vartab-bvar-uregs0.sh
@@ -23,7 +23,7 @@ sdt:task::task_rename
 	trace(uregs[0]);
 	exit(0);
 }
-' 2>&1 | awk '
+' 2>&1 | gawk '
 BEGIN {
 	rc = 1;
 }
diff --git a/test/unittest/disasm/tst.vartab-bvar.sh b/test/unittest/disasm/tst.vartab-bvar.sh
index 996cc332..098c1f45 100755
--- a/test/unittest/disasm/tst.vartab-bvar.sh
+++ b/test/unittest/disasm/tst.vartab-bvar.sh
@@ -56,7 +56,7 @@ sdt:task::task_rename
 	trace(walltimestamp);
 	exit(0);
 }
-' 2>&1 | awk '
+' 2>&1 | gawk '
 BEGIN {
 	rc = 1;
 }
diff --git a/test/unittest/dtrace-util/tst.DisOption.sh b/test/unittest/dtrace-util/tst.DisOption.sh
index 8ed86b53..f473f838 100755
--- a/test/unittest/dtrace-util/tst.DisOption.sh
+++ b/test/unittest/dtrace-util/tst.DisOption.sh
@@ -68,7 +68,7 @@ function run_dtrace() {
     fi
 
     # Avoid differences due to different BOOTTM values.
-    awk '/: 18 [0-9] 0 / && /lddw/ {
+    gawk '/: 18 [0-9] 0 / && /lddw/ {
 	    sub(/0x[0-9a-f]+/, 0x0);
 	    sub(/[0-9a-f]{8}/, "00000000");
 	    print;
@@ -89,7 +89,7 @@ function run_dtrace() {
     # Avoid differences due to different tgid values in predicates.
     # If we see bpf_get_current_pid_tgid, omit the 3rd line if it's
     # "jne %r0, ..." since the check value will change from run to run.
-    awk '/call bpf_get_current_pid_tgid/ { ncount = 0 }
+    gawk '/call bpf_get_current_pid_tgid/ { ncount = 0 }
 	{ ncount++ }
 	ncount == 3 && /^[ :0-9a-f]* jne *%r0, / { next }
 	{ print; }' $1.err > $1.tmp
@@ -133,7 +133,7 @@ for x in 0 1 2 3; do
     touch $x.chk
 done
 
-awk '
+gawk '
 BEGIN { f = "/dev/null"; lastlineblank = 0; }
 lastlineblank == 1 {
     # if previous line was blank, see if we should change output file
diff --git a/test/unittest/dtrace-util/tst.ListProbesModuleClause.sh b/test/unittest/dtrace-util/tst.ListProbesModuleClause.sh
index e1344f49..24c55acb 100755
--- a/test/unittest/dtrace-util/tst.ListProbesModuleClause.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesModuleClause.sh
@@ -19,6 +19,6 @@
 dtrace=$1
 
 $dtrace $dt_flags -lm vmlinux'/probefunc == "read"/{printf("FOUND");}' \
-| awk 'NF == 5 && $3 == "vmlinux" { print "success"; exit }'
+| gawk 'NF == 5 && $3 == "vmlinux" { print "success"; exit }'
 
 exit 0
diff --git a/test/unittest/error/tst.fault-location.sh b/test/unittest/error/tst.fault-location.sh
index 8bf04779..714d863b 100755
--- a/test/unittest/error/tst.fault-location.sh
+++ b/test/unittest/error/tst.fault-location.sh
@@ -24,7 +24,7 @@ ERROR
 	exit(1);
 }
 ' 2>&1 | \
-	awk -vDTRACEFLT_DIVZERO=4 \
+	gawk -vDTRACEFLT_DIVZERO=4 \
 	    'BEGIN {
 		rc = 1;
 	     }
diff --git a/test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.x b/test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.x
index 64d198ef..35e10c72 100755
--- a/test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.x
+++ b/test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.x
@@ -1,7 +1,7 @@
 #!/bin/bash
 
 # Skip test if FBT probes do not provide argument datatype info.
-types=`$dtrace -lvn fbt::oops_enter:return | awk '/^[ 	]*args\[/ { $1 = ""; print }' | sort -u`
+types=`$dtrace -lvn fbt::oops_enter:return | gawk '/^[ 	]*args\[/ { $1 = ""; print }' | sort -u`
 
 if [[ -z "$types" ]]; then
 	echo "FBT probes without args[] type info"
diff --git a/test/unittest/fbtprovider/err.D_ARGS_IDX.void.x b/test/unittest/fbtprovider/err.D_ARGS_IDX.void.x
index 47953c7a..46cb9d0d 100755
--- a/test/unittest/fbtprovider/err.D_ARGS_IDX.void.x
+++ b/test/unittest/fbtprovider/err.D_ARGS_IDX.void.x
@@ -1,7 +1,7 @@
 #!/bin/bash
 
 # Skip test if FBT probes do not provide argument datatype info.
-types=`$dtrace -lvn fbt::exit_creds:return | awk '/^[ 	]*args\[/ { $1 = ""; print }' | sort -u`
+types=`$dtrace -lvn fbt::exit_creds:return | gawk '/^[ 	]*args\[/ { $1 = ""; print }' | sort -u`
 
 if [[ -z "$types" ]]; then
 	echo "FBT probes without args[] type info"
diff --git a/test/unittest/funcs/alloca/tst.alloca0-values.sh b/test/unittest/funcs/alloca/tst.alloca0-values.sh
index fce42423..07b2393a 100755
--- a/test/unittest/funcs/alloca/tst.alloca0-values.sh
+++ b/test/unittest/funcs/alloca/tst.alloca0-values.sh
@@ -25,7 +25,7 @@ BEGIN {
 }
 EOT
 
-awk '/:BEGIN/ && $2 == $3 && $3 == $4 && $4 == $5 { exit(0); }
+gawk '/:BEGIN/ && $2 == $3 && $3 == $4 && $4 == $5 { exit(0); }
      /:BEGIN/ { print; exit(1); }' $tmpfile
 
 status=$?
diff --git a/test/unittest/funcs/tst.rand_inter.sh b/test/unittest/funcs/tst.rand_inter.sh
index 132611c1..e1d60964 100755
--- a/test/unittest/funcs/tst.rand_inter.sh
+++ b/test/unittest/funcs/tst.rand_inter.sh
@@ -65,7 +65,7 @@ fi
 
 # Now the postprocessing.
 
-awk '
+gawk '
     BEGIN {
         nDistributions = noutlier2 = noutlier3 = noutlier4 = 0;
         nbins = 16;
@@ -172,7 +172,7 @@ if [ $? -ne 0 ]; then
 	exit 1
 fi
 
-n=`awk '/number of iterations/ { print $4 }' $tmpfile`
+n=`gawk '/number of iterations/ { print $4 }' $tmpfile`
 echo inter-word correlations tested for $n random numbers
 echo success
 rm -f $tmpfile $tmpfile.summary
diff --git a/test/unittest/funcs/tst.rand_intra.sh b/test/unittest/funcs/tst.rand_intra.sh
index f086c0d7..8afb124d 100755
--- a/test/unittest/funcs/tst.rand_intra.sh
+++ b/test/unittest/funcs/tst.rand_intra.sh
@@ -46,7 +46,7 @@ fi
 
 # Now the postprocessing.
 
-awk '
+gawk '
     BEGIN {
         nDistributions = noutlier2 = noutlier3 = noutlier4 = 0;
         nbins = 16;
@@ -153,7 +153,7 @@ if [ $? -ne 0 ]; then
 	exit 1
 fi
 
-n=`awk '/upper-bit errors/ { print $8 }' $tmpfile`
+n=`gawk '/upper-bit errors/ { print $8 }' $tmpfile`
 echo intra-word correlations tested for $n random numbers
 echo success
 rm -f $tmpfile $tmpfile.summary
diff --git a/test/unittest/io/check_io_probe_args.sh b/test/unittest/io/check_io_probe_args.sh
index 69b653e1..8e1f5a4c 100755
--- a/test/unittest/io/check_io_probe_args.sh
+++ b/test/unittest/io/check_io_probe_args.sh
@@ -179,7 +179,7 @@ fi
 #
 
 rm -f statname.txt
-awk 'NF == 23 { print $16, $17, $22 }' $infile | sort | uniq > statname.txt
+gawk 'NF == 23 { print $16, $17, $22 }' $infile | sort | uniq > statname.txt
 while read mymajor myminor mystatname; do
     read mymajor0 myminor0 <<< $(ls -l /dev | gawk '$NF == "'$mystatname'" { print $(NF-5), $(NF-4) }' | tr ',' ' ')
 
@@ -212,7 +212,7 @@ gawk '{
 echo "BEGIN { exit(0); }" >> D.d
 echo "ERROR { printf(\"%d nfs\\n\", x) }" >> D.d
 
-$dtrace $dt_flags -qs D.d | sort | awk 'NF != 0' > majnam.chk
+$dtrace $dt_flags -qs D.d | sort | gawk 'NF != 0' > majnam.chk
 
 if ! diff majnam.txt majnam.chk > /dev/null; then
     echo "  ERROR: major number mismatch with name"
@@ -257,8 +257,8 @@ fi
 
 gawk 'NF == 23 { print $21, $16 }' $infile | sort | uniq > map-name-to-major.txt
 nmaps=`cat map-name-to-major.txt | wc -l`
-nnames=`awk '{print $1}' map-name-to-major.txt | sort | uniq | wc -l`
-nmajor=`awk '{print $2}' map-name-to-major.txt | sort | uniq | wc -l`
+nnames=`gawk '{print $1}' map-name-to-major.txt | sort | uniq | wc -l`
+nmajor=`gawk '{print $2}' map-name-to-major.txt | sort | uniq | wc -l`
 if [ $nnames -ne $nmaps -o $nmajor -ne $nmaps ]; then
     echo "  ERROR: name-to-major-number is not a one-to-one mapping"
     cat map-name-to-major.txt
diff --git a/test/unittest/io/tst.local.sh b/test/unittest/io/tst.local.sh
index 551fcb36..d3dbf171 100755
--- a/test/unittest/io/tst.local.sh
+++ b/test/unittest/io/tst.local.sh
@@ -30,7 +30,7 @@ mkdir $iodir
 test/triggers/io-mount-local.sh $iodir $fstype $fsoptions
 
 # determine the statname
-mount=`losetup -j $iodir.img | awk 'BEGIN { FS = ":" } ; {print $1}'`
+mount=`losetup -j $iodir.img | gawk 'BEGIN { FS = ":" } ; {print $1}'`
 statname=`basename $mount`
 
 $dtrace $dt_flags -c "test/triggers/doio.sh $tempfile $filesize test/triggers/io-mount-local.sh $iodir $fstype $fsoptions" -qs /dev/stdin <<EODTRACE
diff --git a/test/unittest/io/tst.local2.sh b/test/unittest/io/tst.local2.sh
index c16f288e..685a3ba0 100755
--- a/test/unittest/io/tst.local2.sh
+++ b/test/unittest/io/tst.local2.sh
@@ -39,7 +39,7 @@ dd if=/dev/zero of=$iodir.img bs=1024 count=$((300*1024)) status=none
 mkfs.xfs $iodir.img > /dev/null
     mkdir $iodir
         mount -t xfs -o $fsoptions $iodir.img $iodir
-            devnam=`losetup -j $iodir.img | awk 'BEGIN { FS = ":" } ; {print $1}'`
+            devnam=`losetup -j $iodir.img | gawk 'BEGIN { FS = ":" } ; {print $1}'`
             statname=`basename $devnam`
             $rundt -o log.write -c ./write.sh
 
@@ -94,18 +94,18 @@ END {
 }
 EOF
 
-myaddr=`awk '$3 == "xfs_end_bio"       {print $1}' /proc/kallsyms`
+myaddr=`gawk '$3 == "xfs_end_bio"       {print $1}' /proc/kallsyms`
 echo check start bytes in log.write with xfs_end_bio address $myaddr
-awk -v myflags=520 -v nrecflag=1 -v myiodone=$myaddr -f awk.txt log.write
+gawk -v myflags=520 -v nrecflag=1 -v myiodone=$myaddr -f awk.txt log.write
 if [ $? -ne 0 ]; then
     echo "  ERROR: post-processing error log.write"
     cat log.write
     retval=1
 fi
 
-myaddr=`awk '$3 == "iomap_read_end_io" {print $1}' /proc/kallsyms`
+myaddr=`gawk '$3 == "iomap_read_end_io" {print $1}' /proc/kallsyms`
 echo check start bytes in log.read with iomap_read_end_io address $myaddr
-awk -v myflags=460 -v nrecflag=2 -v myiodone=$myaddr -f awk.txt log.read
+gawk -v myflags=460 -v nrecflag=2 -v myiodone=$myaddr -f awk.txt log.read
 if [ $? -ne 0 ]; then
     echo "  ERROR: post-processing error log.read"
     cat log.read
diff --git a/test/unittest/io/tst.lv-done.r.p b/test/unittest/io/tst.lv-done.r.p
index c538e345..6b395d65 100755
--- a/test/unittest/io/tst.lv-done.r.p
+++ b/test/unittest/io/tst.lv-done.r.p
@@ -1,4 +1,4 @@
-#!/usr/bin/awk -f
+#!/usr/bin/gawk -f
 NR == 1 { next; }
 NR == 2 { print "PROBE", $2, $3, $NF; next; }
 /^ *[0-9]+/ { exit; }
diff --git a/test/unittest/io/tst.nfs2.sh b/test/unittest/io/tst.nfs2.sh
index 8f5f260a..41a7a465 100755
--- a/test/unittest/io/tst.nfs2.sh
+++ b/test/unittest/io/tst.nfs2.sh
@@ -33,7 +33,7 @@ mkdir $exdir
     mkdir $iodir
         mount -t nfs -o nfsvers=3 127.0.0.1:$exdir $iodir
             $rundt "dd if=/dev/urandom of=$tempfile count=$filesize bs=1 status=none" -o log.write
-            myinode=`stat $tempfile  | awk '/	Inode: / {print $4}'`
+            myinode=`stat $tempfile  | gawk '/	Inode: / {print $4}'`
         umount $iodir
         # flush caches and remount to force IO
 	echo 3 > /proc/sys/vm/drop_caches
@@ -87,7 +87,7 @@ END {
 EOF
 
 echo check start bytes in log.write
-awk -v myflags=520 -v spill=4095 -f awk.txt log.write
+gawk -v myflags=520 -v spill=4095 -f awk.txt log.write
 if [ $? -ne 0 ]; then
     echo "  ERROR: post-processing error log.write"
     cat log.write
@@ -95,7 +95,7 @@ if [ $? -ne 0 ]; then
 fi
 
 echo check start bytes in log.read
-awk -v myflags=460 -v spill=0 -f awk.txt log.read
+gawk -v myflags=460 -v spill=0 -f awk.txt log.read
 if [ $? -ne 0 ]; then
     echo "  ERROR: post-processing error log.read"
     cat log.read
diff --git a/test/unittest/io/tst.wait.sh b/test/unittest/io/tst.wait.sh
index 2887908c..016b922e 100755
--- a/test/unittest/io/tst.wait.sh
+++ b/test/unittest/io/tst.wait.sh
@@ -27,7 +27,7 @@ mkdir $iodir
 test/triggers/io-mount-local.sh $iodir $fstype $fsoptions
 
 # determine the statname
-mount=`losetup -j $iodir.img | awk 'BEGIN { FS = ":" } ; {print $1}'`
+mount=`losetup -j $iodir.img | gawk 'BEGIN { FS = ":" } ; {print $1}'`
 statname=`basename $mount`
 
 $dtrace $dt_flags -c "test/triggers/doio.sh $tempfile $filesize test/triggers/io-mount-local.sh $iodir $fstype $fsoptions" -qs /dev/stdin <<EODTRACE
diff --git a/test/unittest/ip/tst.ipv6localicmp.sh b/test/unittest/ip/tst.ipv6localicmp.sh
index 1807c4f3..79de9603 100755
--- a/test/unittest/ip/tst.ipv6localicmp.sh
+++ b/test/unittest/ip/tst.ipv6localicmp.sh
@@ -32,7 +32,7 @@ local=::1
 /sbin/ip -o route get to $local > /dev/null || exit 67
 
 $dtrace $dt_flags -c "ping6 -q $local -c 3" -qs /dev/stdin <<EOF | \
-    awk '/ip::/ { print $0 }' | sort -n
+    gawk '/ip::/ { print $0 }' | sort -n
 ip:::send
 /args[2]->ip_saddr == "$local" && args[2]->ip_daddr == "$local" &&
     args[5]->ipv6_nexthdr == IPPROTO_ICMPV6/
diff --git a/test/unittest/ip/tst.ipv6remoteicmp.sh b/test/unittest/ip/tst.ipv6remoteicmp.sh
index 0b79f889..90fd48b4 100755
--- a/test/unittest/ip/tst.ipv6remoteicmp.sh
+++ b/test/unittest/ip/tst.ipv6remoteicmp.sh
@@ -47,7 +47,7 @@ fi
 nolinkdest="$(printf "%s" "$dest" | sed 's,%.*,,')"
 
 $dtrace $dt_flags -c "ping6 -c 6 $dest" -qs /dev/stdin <<EOF | \
-    awk '/ip:::/ { print $0 }' | sort -n
+    gawk '/ip:::/ { print $0 }' | sort -n
 /* 
  * We use a size match to include only things that are big enough to
  * be pings, rather than neighbor solicitations/advertisements.
diff --git a/test/unittest/lockstat/tst.lv-adaptive-acquire-error.r.p b/test/unittest/lockstat/tst.lv-adaptive-acquire-error.r.p
index c538e345..6b395d65 100755
--- a/test/unittest/lockstat/tst.lv-adaptive-acquire-error.r.p
+++ b/test/unittest/lockstat/tst.lv-adaptive-acquire-error.r.p
@@ -1,4 +1,4 @@
-#!/usr/bin/awk -f
+#!/usr/bin/gawk -f
 NR == 1 { next; }
 NR == 2 { print "PROBE", $2, $3, $NF; next; }
 /^ *[0-9]+/ { exit; }
diff --git a/test/unittest/lquantize/tst.normalize-bug26261502.sh b/test/unittest/lquantize/tst.normalize-bug26261502.sh
index cab6845f..35c6c685 100755
--- a/test/unittest/lquantize/tst.normalize-bug26261502.sh
+++ b/test/unittest/lquantize/tst.normalize-bug26261502.sh
@@ -57,7 +57,7 @@ if [ "$status" -ne 0 ]; then
 	exit $status
 fi
 
-n=`awk '/ < / {print $2}' $file`
+n=`gawk '/ < / {print $2}' $file`
 if [ "$n" -ne 9 ]; then
 	echo $tst: lowest-bucket name should be '"< 9"' but is '"< '$n'"'
 	cat $file
diff --git a/test/unittest/misc/tst.parser1.sh b/test/unittest/misc/tst.parser1.sh
index 14bf28a6..aebd41e7 100755
--- a/test/unittest/misc/tst.parser1.sh
+++ b/test/unittest/misc/tst.parser1.sh
@@ -78,7 +78,7 @@ EOF
 
 # Check results.
 
-awk '
+gawk '
 # Look for the BEGIN clause.
 /PDESC :::BEGIN / {
         # Print until we get the next clause.
diff --git a/test/unittest/misc/tst.parser2.sh b/test/unittest/misc/tst.parser2.sh
index e9ad1c5c..6c2616ce 100755
--- a/test/unittest/misc/tst.parser2.sh
+++ b/test/unittest/misc/tst.parser2.sh
@@ -82,7 +82,7 @@ EOF
 
 # Check results.
 
-awk '
+gawk '
 # Look for the BEGIN clause.
 /PDESC :::BEGIN / {
         # Print until we get the next clause.
diff --git a/test/unittest/misc/tst.parser4.sh b/test/unittest/misc/tst.parser4.sh
index 13701d8f..65f441c8 100755
--- a/test/unittest/misc/tst.parser4.sh
+++ b/test/unittest/misc/tst.parser4.sh
@@ -82,7 +82,7 @@ EOF
 
 # Check results.
 
-awk '
+gawk '
 # Look for the BEGIN clause.
 /PDESC :::BEGIN / {
         # Print until we get the next clause.
diff --git a/test/unittest/options/err.ctfpath.sh b/test/unittest/options/err.ctfpath.sh
index c629624c..9a4aa812 100755
--- a/test/unittest/options/err.ctfpath.sh
+++ b/test/unittest/options/err.ctfpath.sh
@@ -9,7 +9,7 @@
 dtrace=$1
 
 $dtrace $dt_flags -xdebug -xctfpath=/dev/null -n 'BEGIN { exit(0); }' |&
-  awk '/Cannot open CTF archive \/dev\/null/ {
+  gawk '/Cannot open CTF archive \/dev\/null/ {
 	sub(/^[^:]+: /, "");
 	sub(/:.*$/, "");
 	print;
diff --git a/test/unittest/options/tst.S.sh b/test/unittest/options/tst.S.sh
index 3d5e057d..5e2a9135 100755
--- a/test/unittest/options/tst.S.sh
+++ b/test/unittest/options/tst.S.sh
@@ -9,7 +9,7 @@
 dtrace=$1
 
 $dtrace $dt_flags -S -n 'BEGIN { exit(0); }' 2>&1 | \
-	awk '{ print; }
+	gawk '{ print; }
 	     /^Disassembly of clause :::BEGIN/ { hdr = 1; next; }
 	     /^[0-9]{4} [0-9]{5}: [0-9a-f]{2} / { ins++; next; }
 	     END {
diff --git a/test/unittest/options/tst.core.sh b/test/unittest/options/tst.core.sh
index 18727c6a..df1b1bbd 100755
--- a/test/unittest/options/tst.core.sh
+++ b/test/unittest/options/tst.core.sh
@@ -10,7 +10,7 @@ dtrace=$1
 
 $dtrace $dt_flags -xcore -n 'BEGIN { exit(0); }'
 file core | tee /dev/stderr | \
-	awk 'BEGIN { rc = 1; }
+	gawk 'BEGIN { rc = 1; }
 	     /ELF/ && /core file/ && /dtrace/ { rc = 0; next; }
 	     END { exit(rc); }'
 rc=$?
diff --git a/test/unittest/options/tst.cppargs.sh b/test/unittest/options/tst.cppargs.sh
index 9f60b162..043dae4e 100755
--- a/test/unittest/options/tst.cppargs.sh
+++ b/test/unittest/options/tst.cppargs.sh
@@ -9,7 +9,7 @@
 dtrace=$1
 
 $dtrace $dt_flags -xcppargs='-H -dM' -Cs /dev/stdin << EOT 2>&1 | \
-	awk '/^\.+/ && /\.h$/ { cnt++; }
+	gawk '/^\.+/ && /\.h$/ { cnt++; }
 	     /invalid control directive: #define/ { cnt = -cnt; }
 	     { print; }
 	     END { exit(cnt < 0 ? 0 : 1); }'
diff --git a/test/unittest/options/tst.cpphdrs.sh b/test/unittest/options/tst.cpphdrs.sh
index b3362c74..22025c4a 100755
--- a/test/unittest/options/tst.cpphdrs.sh
+++ b/test/unittest/options/tst.cpphdrs.sh
@@ -9,7 +9,7 @@
 dtrace=$1
 
 $dtrace $dt_flags -xcpphdrs -Cs /dev/stdin << EOT 2>&1 | \
-	awk '/^\.+/ && /\.h$/ { cnt++; }
+	gawk '/^\.+/ && /\.h$/ { cnt++; }
 	     { print; }
 	     END { exit(cnt > 0 ? 0 : 1); }'
 #include <linux/posix_types.h>
diff --git a/test/unittest/options/tst.cpu-BEGIN.sh b/test/unittest/options/tst.cpu-BEGIN.sh
index b62fdc23..1fbdab41 100755
--- a/test/unittest/options/tst.cpu-BEGIN.sh
+++ b/test/unittest/options/tst.cpu-BEGIN.sh
@@ -9,7 +9,7 @@
 dtrace=$1
 
 # Pick a CPU at random.
-cpulist=( `awk '/^processor[ 	]*: [0-9]*$/ {print $3}' /proc/cpuinfo` )
+cpulist=( `gawk '/^processor[ 	]*: [0-9]*$/ {print $3}' /proc/cpuinfo` )
 ncpus=${#cpulist[@]}
 cpu0=${cpulist[$((RANDOM % $ncpus))]}
 
diff --git a/test/unittest/options/tst.cpu-END.sh b/test/unittest/options/tst.cpu-END.sh
index 4e19c54b..52b8ed4e 100755
--- a/test/unittest/options/tst.cpu-END.sh
+++ b/test/unittest/options/tst.cpu-END.sh
@@ -9,7 +9,7 @@
 dtrace=$1
 
 # Pick a CPU at random.
-cpulist=( `awk '/^processor[ 	]*: [0-9]*$/ {print $3}' /proc/cpuinfo` )
+cpulist=( `gawk '/^processor[ 	]*: [0-9]*$/ {print $3}' /proc/cpuinfo` )
 ncpus=${#cpulist[@]}
 cpu0=${cpulist[$((RANDOM % $ncpus))]}
 
diff --git a/test/unittest/options/tst.cpu-cpc.sh b/test/unittest/options/tst.cpu-cpc.sh
index c5778a66..e839a753 100755
--- a/test/unittest/options/tst.cpu-cpc.sh
+++ b/test/unittest/options/tst.cpu-cpc.sh
@@ -9,7 +9,7 @@
 dtrace=$1
 
 # Pick a CPU at random.
-cpulist=( `awk '/^processor[ 	]*: [0-9]*$/ {print $3}' /proc/cpuinfo` )
+cpulist=( `gawk '/^processor[ 	]*: [0-9]*$/ {print $3}' /proc/cpuinfo` )
 ncpus=${#cpulist[@]}
 cpu0=${cpulist[$((RANDOM % $ncpus))]}
 
diff --git a/test/unittest/options/tst.cpu-profile.sh b/test/unittest/options/tst.cpu-profile.sh
index 9efe12db..ab437aca 100755
--- a/test/unittest/options/tst.cpu-profile.sh
+++ b/test/unittest/options/tst.cpu-profile.sh
@@ -9,7 +9,7 @@
 dtrace=$1
 
 # Pick a CPU at random.
-cpulist=( `awk '/^processor[ 	]*: [0-9]*$/ {print $3}' /proc/cpuinfo` )
+cpulist=( `gawk '/^processor[ 	]*: [0-9]*$/ {print $3}' /proc/cpuinfo` )
 ncpus=${#cpulist[@]}
 cpu0=${cpulist[$((RANDOM % $ncpus))]}
 
diff --git a/test/unittest/options/tst.cpu-syscall.sh b/test/unittest/options/tst.cpu-syscall.sh
index 3ebb585c..401839d5 100755
--- a/test/unittest/options/tst.cpu-syscall.sh
+++ b/test/unittest/options/tst.cpu-syscall.sh
@@ -101,7 +101,7 @@ fi
 # Get CPU list and form expected-results file.
 #
 
-cpulist=`awk '/^processor[ 	]: [0-9]*$/ { print $3 }' /proc/cpuinfo`
+cpulist=`gawk '/^processor[ 	]: [0-9]*$/ { print $3 }' /proc/cpuinfo`
 echo $cpulist
 
 echo > expect.txt
diff --git a/test/unittest/options/tst.cpu-tick.sh b/test/unittest/options/tst.cpu-tick.sh
index 88163acc..5a4a5ed1 100755
--- a/test/unittest/options/tst.cpu-tick.sh
+++ b/test/unittest/options/tst.cpu-tick.sh
@@ -9,7 +9,7 @@
 dtrace=$1
 
 # Pick a CPU at random.
-cpulist=( `awk '/^processor[ 	]*: [0-9]*$/ {print $3}' /proc/cpuinfo` )
+cpulist=( `gawk '/^processor[ 	]*: [0-9]*$/ {print $3}' /proc/cpuinfo` )
 ncpus=${#cpulist[@]}
 cpu0=${cpulist[$((RANDOM % $ncpus))]}
 
diff --git a/test/unittest/options/tst.ctfpath.sh b/test/unittest/options/tst.ctfpath.sh
index 9382a6e1..eb7a64d9 100755
--- a/test/unittest/options/tst.ctfpath.sh
+++ b/test/unittest/options/tst.ctfpath.sh
@@ -12,7 +12,7 @@ dtrace=$1
 # First determine the location of the vmlinux CTF archive.
 #
 ctf=`$dtrace $dt_flags -xdebug |&
-	awk '/Loaded shared CTF from/ { $0 = $NF; sub(/\.$/, ""); print; }'`
+	gawk '/Loaded shared CTF from/ { $0 = $NF; sub(/\.$/, ""); print; }'`
 
 $dtrace $dt_flags -xctfpath=$ctf -n 'BEGIN { exit(0); }'
 
diff --git a/test/unittest/options/tst.ctypes.sh b/test/unittest/options/tst.ctypes.sh
index 7b3c318c..30a6c9b1 100755
--- a/test/unittest/options/tst.ctypes.sh
+++ b/test/unittest/options/tst.ctypes.sh
@@ -22,14 +22,14 @@ if objdump --help | grep ctf >/dev/null; then
 	fi
 
 	objdump --ctf=.ctf $tmpdir/ctypes.o | \
-  		awk '/CTF_VERSION/ { found = 1; next; }
+		gawk '/CTF_VERSION/ { found = 1; next; }
 		     found && $1 ~ /0x[0-9A-Fa-f]+:/ { cnt++; next; }
 		     END { print "C CTF data" (found ? " " : " NOT ") "found";
 			   exit(cnt > 0 ? 0 : 1); }'
 	rc=$?
 else
 	ctf_dump $tmpdir/ctypes.ctf | \
-		awk '/CTF file:/ { found = 1; next; }
+		gawk '/CTF file:/ { found = 1; next; }
 		     found && /ID [0-9A-Fa-f]+:/ { cnt++; next; }
 		     END { print "C CTF data" (found ? " " : " NOT ") "found";
 			   exit(cnt > 0 ? 0 : 1); }'
diff --git a/test/unittest/options/tst.debug.sh b/test/unittest/options/tst.debug.sh
index 0af09155..a0cfc339 100755
--- a/test/unittest/options/tst.debug.sh
+++ b/test/unittest/options/tst.debug.sh
@@ -9,7 +9,7 @@
 dtrace=$1
 
 $dtrace $dt_flags -xdebug -n 'BEGIN { exit(0); }' 2>&1 | \
-	awk '$2 == "DEBUG" && int($3) > 0 {
+	gawk '$2 == "DEBUG" && int($3) > 0 {
 		cnt[$1]++;
 	     }
 	     END {
diff --git a/test/unittest/options/tst.dtypes.sh b/test/unittest/options/tst.dtypes.sh
index d6b444e7..441de098 100755
--- a/test/unittest/options/tst.dtypes.sh
+++ b/test/unittest/options/tst.dtypes.sh
@@ -22,14 +22,14 @@ if objdump --help | grep ctf >/dev/null; then
 	fi
 
 	objdump --ctf=.ctf $tmpdir/dtypes.o | \
-		awk '/CTF_VERSION/ { found = 1; next; }
+		gawk '/CTF_VERSION/ { found = 1; next; }
 		     found && $1 ~ /0x[0-9A-Fa-f]+:/ { cnt++; next; }
 		     END { print "D CTF data" (found ? " " : " NOT ") "found";
 			   exit(cnt > 0 ? 0 : 1); }'
 	rc=$?
 else
 	ctf_dump $tmpdir/dtypes.ctf | \
-		awk '/CTF file:/ { found = 1; next; }
+		gawk '/CTF file:/ { found = 1; next; }
 		     found && /ID [0-9A-Fa-f]+:/ { cnt++; next; }
 		     END { print "D CTF data" (found ? " " : " NOT ") "found";
 			   exit(cnt > 0 ? 0 : 1); }'
diff --git a/test/unittest/options/tst.knodefs.sh b/test/unittest/options/tst.knodefs.sh
index 791a51ee..ab9f619e 100755
--- a/test/unittest/options/tst.knodefs.sh
+++ b/test/unittest/options/tst.knodefs.sh
@@ -10,7 +10,7 @@ dtrace=$1
 
 $dtrace $dt_flags -xlinkmode=dynamic -xknodefs \
 	-Sn 'BEGIN { trace((string)&`linux_banner); exit(0); }' 2>&1 | \
-	awk '/^KREL/ {
+	gawk '/^KREL/ {
 		print;
 		while (getline == 1) {
 			if (NF == 0)
diff --git a/test/unittest/options/tst.linktype.sh b/test/unittest/options/tst.linktype.sh
index 25bcaae0..e1ac9545 100755
--- a/test/unittest/options/tst.linktype.sh
+++ b/test/unittest/options/tst.linktype.sh
@@ -61,7 +61,7 @@ function mytest() {
 	fi
 
 	# report whether the file format is recognized
-	objdump --file-headers prov.o |& awk '
+	objdump --file-headers prov.o |& gawk '
 	    /format not recognized/ {
 		print "objdump does NOT recognize file format";
 		exit(0);
diff --git a/test/unittest/options/tst.modpath.sh b/test/unittest/options/tst.modpath.sh
index 0f269123..7060a716 100755
--- a/test/unittest/options/tst.modpath.sh
+++ b/test/unittest/options/tst.modpath.sh
@@ -53,9 +53,9 @@ fi
 # nbasic and nfinal should be substantial and likely identical (but
 # we allow a generous tolerance).
 
-nbasic=`awk '/^[	 ]*args\[/ && !/uint64_t/ && !/void \*/' basic.out | wc -l`
-nempty=`awk '/^[	 ]*args\[/ && !/uint64_t/ && !/void \*/' empty.out | wc -l`
-nfinal=`awk '/^[	 ]*args\[/ && !/uint64_t/ && !/void \*/' final.out | wc -l`
+nbasic=`gawk '/^[	 ]*args\[/ && !/uint64_t/ && !/void \*/' basic.out | wc -l`
+nempty=`gawk '/^[	 ]*args\[/ && !/uint64_t/ && !/void \*/' empty.out | wc -l`
+nfinal=`gawk '/^[	 ]*args\[/ && !/uint64_t/ && !/void \*/' final.out | wc -l`
 
 if [ $nempty -ne 0 ]; then
 	echo ERROR: empty check turned up some CTF info
diff --git a/test/unittest/options/tst.modpath.x b/test/unittest/options/tst.modpath.x
index 6d483535..928f00cc 100755
--- a/test/unittest/options/tst.modpath.x
+++ b/test/unittest/options/tst.modpath.x
@@ -9,7 +9,7 @@ fi
 # Skip test if CTF info is not used for rawtp args[] types.  (If all rawtp
 # args[] types are "uint64_t", this is a symptom of our using the back-up
 # trial-and-error method.)
-types=`$dtrace -lvP rawtp | awk '/^[ 	]*args/ { $1 = ""; print }' | sort -u`
+types=`$dtrace -lvP rawtp | gawk '/^[ 	]*args/ { $1 = ""; print }' | sort -u`
 if [ "$types" == " uint64_t" ]; then
 	echo "not using CTF for rawtp args types"
 	exit 2
diff --git a/test/unittest/options/tst.strip.sh b/test/unittest/options/tst.strip.sh
index 2378b1a8..4df78ca5 100755
--- a/test/unittest/options/tst.strip.sh
+++ b/test/unittest/options/tst.strip.sh
@@ -69,8 +69,8 @@ $objdump >& out.default.txt
 # but not in the stripped case -- but here we settle for the stripped
 # case simply being smaller than the default case.
 
-nbytes_stripped=`wc -c out.stripped.txt | awk '{print $1}'`
-nbytes_default=`wc -c out.default.txt | awk '{print $1}'`
+nbytes_stripped=`wc -c out.stripped.txt | gawk '{print $1}'`
+nbytes_default=`wc -c out.default.txt | gawk '{print $1}'`
 
 echo "number of bytes:"
 echo "    stripped: $nbytes_stripped"
diff --git a/test/unittest/options/tst.switchrate.sh b/test/unittest/options/tst.switchrate.sh
index e47d78d9..0090caff 100755
--- a/test/unittest/options/tst.switchrate.sh
+++ b/test/unittest/options/tst.switchrate.sh
@@ -21,7 +21,7 @@ for nexpect in 1 16; do
 	# Time it.  Round to the nearest number of seconds with int(t+0.5).
 	nactual=`/usr/bin/time -f "%e" \
 	    $dtrace -xswitchrate=${nexpect}sec -qn 'BEGIN { exit(0) }' \
-	    |& awk 'NF != 0 {print int($1 + 0.5)}'`
+	    |& gawk 'NF != 0 {print int($1 + 0.5)}'`
 
 	# Check the actual number of seconds to the expected value.
 	# Actually, the actual time might be a few seconds longer than expected.
diff --git a/test/unittest/options/tst.verbose.sh b/test/unittest/options/tst.verbose.sh
index b9e1bdef..90ab5a62 100755
--- a/test/unittest/options/tst.verbose.sh
+++ b/test/unittest/options/tst.verbose.sh
@@ -9,7 +9,7 @@
 dtrace=$1
 
 $dtrace $dt_flags -xverbose -n 'BEGIN { exit(0); }' 2>&1 | \
-	awk '{ print; }
+	gawk '{ print; }
 	     /^Disassembly of clause :::BEGIN/ { hdr = 1; next; }
 	     /^[0-9]{4} [0-9]{5}: [0-9a-f]{2} / { ins++; next; }
 	     END {
diff --git a/test/unittest/options/tst.version.sh b/test/unittest/options/tst.version.sh
index cd069aa7..ffffcdd8 100755
--- a/test/unittest/options/tst.version.sh
+++ b/test/unittest/options/tst.version.sh
@@ -8,7 +8,7 @@
 
 dtrace=$1
 
-myversion=`$dtrace $dt_flags -V | awk '{ print $NF }'`
+myversion=`$dtrace $dt_flags -V | gawk '{ print $NF }'`
 echo version is $myversion
 
 $dtrace $dt_flags -xversion=$myversion -qn 'BEGIN { exit(0) }'
diff --git a/test/unittest/pid/tst.offsets.sh b/test/unittest/pid/tst.offsets.sh
index 63344698..a8070a54 100755
--- a/test/unittest/pid/tst.offsets.sh
+++ b/test/unittest/pid/tst.offsets.sh
@@ -263,7 +263,7 @@ END {
 if [ $? -ne 0 ]; then
 	cat   D.out
 	cat pcs.out
-	echo ERROR: awk postprocess
+	echo ERROR: gawk postprocess
 	exit 1
 fi
 
diff --git a/test/unittest/pid/tst.probemod.sh b/test/unittest/pid/tst.probemod.sh
index ef278b9e..5a6dcdbe 100755
--- a/test/unittest/pid/tst.probemod.sh
+++ b/test/unittest/pid/tst.probemod.sh
@@ -22,7 +22,7 @@ dtrace=$1
 # sleep(1)
 #
 names=`ldd /bin/sleep | \
-	awk '/libc.so/ {
+	gawk '/libc.so/ {
 		n = split($1, a, /\./);
 		l = a[1];
 		s = l;
diff --git a/test/unittest/printf/tst.wide-bug30404549.sh b/test/unittest/printf/tst.wide-bug30404549.sh
index 7605a94a..3c3eb650 100755
--- a/test/unittest/printf/tst.wide-bug30404549.sh
+++ b/test/unittest/printf/tst.wide-bug30404549.sh
@@ -17,7 +17,7 @@ fi
 dtrace=$1
 
 # abbreviate output to a simple statement of length.  raw output is big (29M)
-$dtrace -qs /dev/stdin << EOF | awk '{ print length($0); }'
+$dtrace -qs /dev/stdin << EOF | gawk '{ print length($0); }'
 BEGIN
 {
 	printf("%10000000d\n", 1);
diff --git a/test/unittest/printf/tst.wide.sh b/test/unittest/printf/tst.wide.sh
index 2c3a3197..479ab8d3 100755
--- a/test/unittest/printf/tst.wide.sh
+++ b/test/unittest/printf/tst.wide.sh
@@ -17,7 +17,7 @@ fi
 dtrace=$1
 
 # abbreviate output, where the raw output of prints is big (29M)
-$dtrace -qs /dev/stdin << EOF | awk '{
+$dtrace -qs /dev/stdin << EOF | gawk '{
   if (match($0, "  +"))
     printf("%s{%d* }%s\n", substr($0, 1, RSTART - 1),
       RLENGTH, substr($0, RSTART + RLENGTH));
diff --git a/test/unittest/profile-n/tst.args_kernel.sh b/test/unittest/profile-n/tst.args_kernel.sh
index c47f699f..e1bd95db 100755
--- a/test/unittest/profile-n/tst.args_kernel.sh
+++ b/test/unittest/profile-n/tst.args_kernel.sh
@@ -38,7 +38,7 @@ $dtrace $dt_flags -qn '
 	/pid == $target/
 	{
 		printf("%x %x\n", arg0, arg1);
-	}' -c "$utils/$target $niters" | awk 'NF == 2' | sort | uniq -c > D.out
+	}' -c "$utils/$target $niters" | gawk 'NF == 2' | sort | uniq -c > D.out
 if [[ $? -ne 0 ]]; then
 	echo ERROR running DTrace
 	cat D.out
diff --git a/test/unittest/profile-n/tst.args_user.sh b/test/unittest/profile-n/tst.args_user.sh
index 1eaadd9e..8d36e569 100755
--- a/test/unittest/profile-n/tst.args_user.sh
+++ b/test/unittest/profile-n/tst.args_user.sh
@@ -18,7 +18,7 @@ cd $tmpfile
 target=workload_user
 
 # dump the loop PCs
-$utils/workload_analyze_loop.sh $target | awk 'NF == 1' > PCs.txt
+$utils/workload_analyze_loop.sh $target | gawk 'NF == 1' > PCs.txt
 echo PCs in the loop: `cat PCs.txt`
 
 # determine number of iterations for target number of seconds
@@ -42,7 +42,7 @@ $dtrace $dt_flags -qn '
 	/pid == $target/
 	{
 		printf("%x %x\n", arg0, arg1);
-	}' -c "$utils/$target $niters" | awk 'NF == 2' | sort | uniq -c > D.out
+	}' -c "$utils/$target $niters" | gawk 'NF == 2' | sort | uniq -c > D.out
 if [[ $? -ne 0 ]]; then
 	echo ERROR running DTrace
 	cat D.out
diff --git a/test/unittest/profile-n/tst.ufunc.sh b/test/unittest/profile-n/tst.ufunc.sh
index 28b7c05b..54090f35 100755
--- a/test/unittest/profile-n/tst.ufunc.sh
+++ b/test/unittest/profile-n/tst.ufunc.sh
@@ -53,7 +53,7 @@ if ! grep -q 'bash`[a-zA-Z_]' $tmpfile; then
 fi
 
 # Check that functions are unique.  (Exclude shared libraries and unresolved addresses.)
-if awk '!/^ *lib/ && !/^ *0x/ {print $1}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
+if gawk '!/^ *lib/ && !/^ *0x/ {print $1}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
 	echo ERROR: duplicate ufunc
 	status=1
 fi
diff --git a/test/unittest/profile-n/tst.umod.sh b/test/unittest/profile-n/tst.umod.sh
index ea4f7ec5..a5b1127f 100755
--- a/test/unittest/profile-n/tst.umod.sh
+++ b/test/unittest/profile-n/tst.umod.sh
@@ -53,7 +53,7 @@ if ! grep -wq 'bash' $tmpfile; then
 fi
 
 # Check that modules are unique.  (Exclude shared libraries and unresolved addresses.)
-if awk '!/^ *lib/ && !/^ *0x/ {print $1}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
+if gawk '!/^ *lib/ && !/^ *0x/ {print $1}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
 	echo ERROR: duplicate umod
 	status=1
 fi
diff --git a/test/unittest/profile-n/tst.usym.sh b/test/unittest/profile-n/tst.usym.sh
index 72ff4fd4..634e633b 100755
--- a/test/unittest/profile-n/tst.usym.sh
+++ b/test/unittest/profile-n/tst.usym.sh
@@ -53,7 +53,7 @@ if ! grep -q 'bash`[a-zA-Z_]' $tmpfile; then
 fi
 
 # Check that symbols are unique.  (Exclude shared libraries and unresolved addresses.)
-if awk '!/^ *lib/ && !/^ *0x/ {print $1}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
+if gawk '!/^ *lib/ && !/^ *0x/ {print $1}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
 	echo ERROR: duplicate usym
 	status=1
 fi
diff --git a/test/unittest/providers/rawtp/err.lockmem-too-low.sh b/test/unittest/providers/rawtp/err.lockmem-too-low.sh
index 760f9821..0c3d9a3c 100755
--- a/test/unittest/providers/rawtp/err.lockmem-too-low.sh
+++ b/test/unittest/providers/rawtp/err.lockmem-too-low.sh
@@ -28,7 +28,7 @@ if $dtrace -xlockmem=1 -n 'BEGIN { exit(0); }' &> /dev/null; then
 fi
 
 $dtrace -xlockmem=1 -lvn rawtp:::sched_process_fork |& \
-    awk 'BEGIN {
+    gawk 'BEGIN {
 	     err = 0;  # lockmem error messages
 	     CTF = 0;  # arg types indicating CTF info
 	     try = 0;  # arg types indicating trial-and-error
diff --git a/test/unittest/providers/rawtp/tst.lv-sched_process_fork.r.p b/test/unittest/providers/rawtp/tst.lv-sched_process_fork.r.p
index e83bac90..98aec2cd 100755
--- a/test/unittest/providers/rawtp/tst.lv-sched_process_fork.r.p
+++ b/test/unittest/providers/rawtp/tst.lv-sched_process_fork.r.p
@@ -1,4 +1,4 @@
-#!/usr/bin/awk -f
+#!/usr/bin/gawk -f
 NR == 1 { next; }
 NR == 2 { print "PROBE", $2, $3, $NF; next; }
 /args\[[0-9]+\]: uint64_t$/ { sub(/:.*$/, ": TYPE-OK"); }
diff --git a/test/unittest/sched/tst.lv-dequeue.r.p b/test/unittest/sched/tst.lv-dequeue.r.p
index c538e345..6b395d65 100755
--- a/test/unittest/sched/tst.lv-dequeue.r.p
+++ b/test/unittest/sched/tst.lv-dequeue.r.p
@@ -1,4 +1,4 @@
-#!/usr/bin/awk -f
+#!/usr/bin/gawk -f
 NR == 1 { next; }
 NR == 2 { print "PROBE", $2, $3, $NF; next; }
 /^ *[0-9]+/ { exit; }
diff --git a/test/unittest/scripting/tst.egid.sh b/test/unittest/scripting/tst.egid.sh
index 094731a7..b9f38819 100755
--- a/test/unittest/scripting/tst.egid.sh
+++ b/test/unittest/scripting/tst.egid.sh
@@ -56,7 +56,7 @@ fi
 
 #Get the groupid of the calling process using ps
 
-groupid=`ps -o pid,gid | grep "$$ " | awk '{print $2}' 2>/dev/null`
+groupid=`ps -o pid,gid | grep "$$ " | gawk '{print $2}' 2>/dev/null`
 if [ $? -ne 0 ]; then
 	echo "unable to get uid of the current process with pid = $$" >&2
 	exit 1
diff --git a/test/unittest/scripting/tst.euid.sh b/test/unittest/scripting/tst.euid.sh
index 4c7f7d74..fc86182e 100755
--- a/test/unittest/scripting/tst.euid.sh
+++ b/test/unittest/scripting/tst.euid.sh
@@ -48,7 +48,7 @@ EOF
 
 chmod 555 $dfilename
 
-userid=`ps -o pid,uid | grep "$$ " | awk '{print $2}' 2>/dev/null`
+userid=`ps -o pid,uid | grep "$$ " | gawk '{print $2}' 2>/dev/null`
 if [ $? -ne 0 ]; then
 	print -u2 "unable to get uid of the current process with pid = $$"
 	exit 1
diff --git a/test/unittest/scripting/tst.sid-valid.sh b/test/unittest/scripting/tst.sid-valid.sh
index 4df1a0d2..c8faf7e8 100755
--- a/test/unittest/scripting/tst.sid-valid.sh
+++ b/test/unittest/scripting/tst.sid-valid.sh
@@ -50,7 +50,7 @@ EOF
 
 chmod 555 $dfilename
 
-sessionid=`ps -o pid,sid | grep "$$ " | awk '{print $2}' 2>/dev/null`
+sessionid=`ps -o pid,sid | grep "$$ " | gawk '{print $2}' 2>/dev/null`
 if [ $? -ne 0 ]; then
 	echo "unable to get sid of the current process with pid = $$" >&2
 	exit 1
diff --git a/test/unittest/usdt/tst.dlclose1.r.p b/test/unittest/usdt/tst.dlclose1.r.p
index 5c3b2580..85725f3b 100755
--- a/test/unittest/usdt/tst.dlclose1.r.p
+++ b/test/unittest/usdt/tst.dlclose1.r.p
@@ -1,4 +1,4 @@
-#!/usr/bin/awk -f
+#!/usr/bin/gawk -f
 {
 	# ignore the specific probe ID or process ID
 	# (the script ensures the process ID is consistent)
diff --git a/test/unittest/ustack/tst.jstack_unprintable-bug26045010.sh b/test/unittest/ustack/tst.jstack_unprintable-bug26045010.sh
index c5fca2a5..ac3d5852 100755
--- a/test/unittest/ustack/tst.jstack_unprintable-bug26045010.sh
+++ b/test/unittest/ustack/tst.jstack_unprintable-bug26045010.sh
@@ -89,10 +89,10 @@ kill %1
 wait
 
 # check results
-n=`sed 's/[[:print:]]//g' $file | awk 'BEGIN {x = 0}; NF>0 {x += 1}; END {print x}'`
+n=`sed 's/[[:print:]]//g' $file | gawk 'BEGIN {x = 0}; NF>0 {x += 1}; END {print x}'`
 if [ $n -gt 0 ]; then
         echo $tst: $n lines have unprintable characters
-        sed 's/[[:print:]]//g' $file | awk 'NF>0'
+        sed 's/[[:print:]]//g' $file | gawk 'NF>0'
         echo "==================== file start"
         cat $file
         echo "==================== file end"
diff --git a/test/unittest/variables/bvar/tst.curcpu_cpu_id.sh b/test/unittest/variables/bvar/tst.curcpu_cpu_id.sh
index b3ed129a..c436d4ac 100755
--- a/test/unittest/variables/bvar/tst.curcpu_cpu_id.sh
+++ b/test/unittest/variables/bvar/tst.curcpu_cpu_id.sh
@@ -30,7 +30,7 @@ profile-3 {
 tick-2 {
 	exit(0);
 }
-' | awk '
+' | gawk '
 BEGIN {
         nevents = 0;
         nerrors = 0;
diff --git a/test/unittest/variables/bvar/tst.id-valid.sh b/test/unittest/variables/bvar/tst.id-valid.sh
index c34679f4..aa3b5590 100755
--- a/test/unittest/variables/bvar/tst.id-valid.sh
+++ b/test/unittest/variables/bvar/tst.id-valid.sh
@@ -30,7 +30,7 @@ profile-3 {
 tick-2 {
 	exit(0);
 }
-' | awk '
+' | gawk '
 BEGIN {
         nevents = 0;
         nerrors = 0;
diff --git a/test/unittest/variables/bvar/tst.offset-blank.sh b/test/unittest/variables/bvar/tst.offset-blank.sh
index 3881ca2e..8fe11b4a 100755
--- a/test/unittest/variables/bvar/tst.offset-blank.sh
+++ b/test/unittest/variables/bvar/tst.offset-blank.sh
@@ -22,7 +22,7 @@ BEGIN
 	trace(pid);
 	exit(0);
 }
-' 2>&1 | awk '
+' 2>&1 | gawk '
 BEGIN {
 	rc = 1;
 }
diff --git a/test/unittest/variables/gvar/tst.alignment-array.sh b/test/unittest/variables/gvar/tst.alignment-array.sh
index 9422af15..a74666d1 100755
--- a/test/unittest/variables/gvar/tst.alignment-array.sh
+++ b/test/unittest/variables/gvar/tst.alignment-array.sh
@@ -26,7 +26,7 @@ BEGIN
 	var[3] = 0x1234;
 	exit(0);
 }
-' 2>&1 | awk '
+' 2>&1 | gawk '
 BEGIN {
 	rc = 1;
 }
diff --git a/test/unittest/variables/gvar/tst.alignment-char.sh b/test/unittest/variables/gvar/tst.alignment-char.sh
index ea4b5932..e3d52bef 100755
--- a/test/unittest/variables/gvar/tst.alignment-char.sh
+++ b/test/unittest/variables/gvar/tst.alignment-char.sh
@@ -25,7 +25,7 @@ BEGIN
 	var = 0x12;
 	exit(0);
 }
-' 2>&1 | awk '
+' 2>&1 | gawk '
 BEGIN {
 	rc = 1;
 }
diff --git a/test/unittest/variables/gvar/tst.alignment-int.sh b/test/unittest/variables/gvar/tst.alignment-int.sh
index 2c948b71..c07ee504 100755
--- a/test/unittest/variables/gvar/tst.alignment-int.sh
+++ b/test/unittest/variables/gvar/tst.alignment-int.sh
@@ -25,7 +25,7 @@ BEGIN
 	var = 0x12345678;
 	exit(0);
 }
-' 2>&1 | awk '
+' 2>&1 | gawk '
 BEGIN {
 	rc = 1;
 }
diff --git a/test/unittest/variables/gvar/tst.alignment-long.sh b/test/unittest/variables/gvar/tst.alignment-long.sh
index c7dde5f5..262f26b4 100755
--- a/test/unittest/variables/gvar/tst.alignment-long.sh
+++ b/test/unittest/variables/gvar/tst.alignment-long.sh
@@ -25,7 +25,7 @@ BEGIN
 	var = 0x1234567887654321ull;
 	exit(0);
 }
-' 2>&1 | awk '
+' 2>&1 | gawk '
 BEGIN {
 	rc = 1;
 }
diff --git a/test/unittest/variables/gvar/tst.alignment-ptr.sh b/test/unittest/variables/gvar/tst.alignment-ptr.sh
index 7c82b5ed..b2bf9503 100755
--- a/test/unittest/variables/gvar/tst.alignment-ptr.sh
+++ b/test/unittest/variables/gvar/tst.alignment-ptr.sh
@@ -25,7 +25,7 @@ BEGIN
 	var = 0;
 	exit(0);
 }
-' 2>&1 | awk '
+' 2>&1 | gawk '
 BEGIN {
 	rc = 1;
 }
diff --git a/test/unittest/variables/gvar/tst.alignment-short.sh b/test/unittest/variables/gvar/tst.alignment-short.sh
index 41f97371..9453556b 100755
--- a/test/unittest/variables/gvar/tst.alignment-short.sh
+++ b/test/unittest/variables/gvar/tst.alignment-short.sh
@@ -25,7 +25,7 @@ BEGIN
 	var = 0x1234;
 	exit(0);
 }
-' 2>&1 | awk '
+' 2>&1 | gawk '
 BEGIN {
 	rc = 1;
 }
diff --git a/test/unittest/variables/gvar/tst.alignment-struct-2.sh b/test/unittest/variables/gvar/tst.alignment-struct-2.sh
index 2bd18500..db285ab3 100755
--- a/test/unittest/variables/gvar/tst.alignment-struct-2.sh
+++ b/test/unittest/variables/gvar/tst.alignment-struct-2.sh
@@ -26,7 +26,7 @@ BEGIN
 	var.w = 0x1234;
 	exit(0);
 }
-' 2>&1 | awk '
+' 2>&1 | gawk '
 BEGIN {
 	rc = 1;
 }
diff --git a/test/unittest/variables/gvar/tst.alignment-struct.sh b/test/unittest/variables/gvar/tst.alignment-struct.sh
index 5c59e12f..2dab1bf7 100755
--- a/test/unittest/variables/gvar/tst.alignment-struct.sh
+++ b/test/unittest/variables/gvar/tst.alignment-struct.sh
@@ -26,7 +26,7 @@ BEGIN
 	var.u = 0x1234;
 	exit(0);
 }
-' 2>&1 | awk '
+' 2>&1 | gawk '
 BEGIN {
 	rc = 1;
 }
diff --git a/test/unittest/variables/gvar/tst.undecl-offset.sh b/test/unittest/variables/gvar/tst.undecl-offset.sh
index e608c860..81c43454 100755
--- a/test/unittest/variables/gvar/tst.undecl-offset.sh
+++ b/test/unittest/variables/gvar/tst.undecl-offset.sh
@@ -24,7 +24,7 @@ BEGIN
 	b = a;
 	exit(0);
 }
-' 2>&1 | awk '
+' 2>&1 | gawk '
 BEGIN {
 	rc = 1;
 }
diff --git a/test/unittest/variables/lvar/tst.alignment-array.sh b/test/unittest/variables/lvar/tst.alignment-array.sh
index 2b6d115e..4b5b4351 100755
--- a/test/unittest/variables/lvar/tst.alignment-array.sh
+++ b/test/unittest/variables/lvar/tst.alignment-array.sh
@@ -26,7 +26,7 @@ BEGIN
 	this->var[3] = 0x1234;
 	exit(0);
 }
-' 2>&1 | awk '
+' 2>&1 | gawk '
 BEGIN {
 	rc = 1;
 }
diff --git a/test/unittest/variables/lvar/tst.alignment-char.sh b/test/unittest/variables/lvar/tst.alignment-char.sh
index 320c71d9..0e8e8ca0 100755
--- a/test/unittest/variables/lvar/tst.alignment-char.sh
+++ b/test/unittest/variables/lvar/tst.alignment-char.sh
@@ -25,7 +25,7 @@ BEGIN
 	this->var = 0x12;
 	exit(0);
 }
-' 2>&1 | awk '
+' 2>&1 | gawk '
 BEGIN {
 	rc = 1;
 }
diff --git a/test/unittest/variables/lvar/tst.alignment-int.sh b/test/unittest/variables/lvar/tst.alignment-int.sh
index f819ab1b..06800d65 100755
--- a/test/unittest/variables/lvar/tst.alignment-int.sh
+++ b/test/unittest/variables/lvar/tst.alignment-int.sh
@@ -25,7 +25,7 @@ BEGIN
 	this->var = 0x12345678;
 	exit(0);
 }
-' 2>&1 | awk '
+' 2>&1 | gawk '
 BEGIN {
 	rc = 1;
 }
diff --git a/test/unittest/variables/lvar/tst.alignment-long.sh b/test/unittest/variables/lvar/tst.alignment-long.sh
index cf465ae6..6415a079 100755
--- a/test/unittest/variables/lvar/tst.alignment-long.sh
+++ b/test/unittest/variables/lvar/tst.alignment-long.sh
@@ -25,7 +25,7 @@ BEGIN
 	this->var = 0x1234567887654321ull;
 	exit(0);
 }
-' 2>&1 | awk '
+' 2>&1 | gawk '
 BEGIN {
 	rc = 1;
 }
diff --git a/test/unittest/variables/lvar/tst.alignment-ptr.sh b/test/unittest/variables/lvar/tst.alignment-ptr.sh
index 5a9ccbd2..3f196e75 100755
--- a/test/unittest/variables/lvar/tst.alignment-ptr.sh
+++ b/test/unittest/variables/lvar/tst.alignment-ptr.sh
@@ -25,7 +25,7 @@ BEGIN
 	this->var = 0;
 	exit(0);
 }
-' 2>&1 | awk '
+' 2>&1 | gawk '
 BEGIN {
 	rc = 1;
 }
diff --git a/test/unittest/variables/lvar/tst.alignment-short.sh b/test/unittest/variables/lvar/tst.alignment-short.sh
index 54b64b8e..db7f9afb 100755
--- a/test/unittest/variables/lvar/tst.alignment-short.sh
+++ b/test/unittest/variables/lvar/tst.alignment-short.sh
@@ -25,7 +25,7 @@ BEGIN
 	this->var = 0x1234;
 	exit(0);
 }
-' 2>&1 | awk '
+' 2>&1 | gawk '
 BEGIN {
 	rc = 1;
 }
diff --git a/test/unittest/variables/lvar/tst.alignment-struct-2.sh b/test/unittest/variables/lvar/tst.alignment-struct-2.sh
index d970ae6d..f7a2b194 100755
--- a/test/unittest/variables/lvar/tst.alignment-struct-2.sh
+++ b/test/unittest/variables/lvar/tst.alignment-struct-2.sh
@@ -26,7 +26,7 @@ BEGIN
 	this->var.w = 0x1234;
 	exit(0);
 }
-' 2>&1 | awk '
+' 2>&1 | gawk '
 BEGIN {
 	rc = 1;
 }
diff --git a/test/unittest/variables/lvar/tst.alignment-struct.sh b/test/unittest/variables/lvar/tst.alignment-struct.sh
index 065e41ff..ae072fba 100755
--- a/test/unittest/variables/lvar/tst.alignment-struct.sh
+++ b/test/unittest/variables/lvar/tst.alignment-struct.sh
@@ -26,7 +26,7 @@ BEGIN
 	this->var.u = 0x1234;
 	exit(0);
 }
-' 2>&1 | awk '
+' 2>&1 | gawk '
 BEGIN {
 	rc = 1;
 }
diff --git a/test/unittest/variables/tvar/tst.alignment-array.sh b/test/unittest/variables/tvar/tst.alignment-array.sh
index 05abecd7..6a25087f 100755
--- a/test/unittest/variables/tvar/tst.alignment-array.sh
+++ b/test/unittest/variables/tvar/tst.alignment-array.sh
@@ -25,7 +25,7 @@ BEGIN
 	self->var[3] = 0x1234;
 	exit(0);
 }
-' 2>&1 | awk '
+' 2>&1 | gawk '
 BEGIN {
 	rc = 1;
 }
diff --git a/test/unittest/variables/tvar/tst.alignment-char.sh b/test/unittest/variables/tvar/tst.alignment-char.sh
index d4284399..f7060ba0 100755
--- a/test/unittest/variables/tvar/tst.alignment-char.sh
+++ b/test/unittest/variables/tvar/tst.alignment-char.sh
@@ -25,7 +25,7 @@ BEGIN
 	self->var = 0x12;
 	exit(0);
 }
-' 2>&1 | awk '
+' 2>&1 | gawk '
 BEGIN {
 	rc = 1;
 }
diff --git a/test/unittest/variables/tvar/tst.alignment-int.sh b/test/unittest/variables/tvar/tst.alignment-int.sh
index 48947790..ec6db159 100755
--- a/test/unittest/variables/tvar/tst.alignment-int.sh
+++ b/test/unittest/variables/tvar/tst.alignment-int.sh
@@ -25,7 +25,7 @@ BEGIN
 	self->var = 0x12345678;
 	exit(0);
 }
-' 2>&1 | awk '
+' 2>&1 | gawk '
 BEGIN {
 	rc = 1;
 }
diff --git a/test/unittest/variables/tvar/tst.alignment-long.sh b/test/unittest/variables/tvar/tst.alignment-long.sh
index 2cde5847..9072b89f 100755
--- a/test/unittest/variables/tvar/tst.alignment-long.sh
+++ b/test/unittest/variables/tvar/tst.alignment-long.sh
@@ -25,7 +25,7 @@ BEGIN
 	self->var = 0x1234567887654321ull;
 	exit(0);
 }
-' 2>&1 | awk '
+' 2>&1 | gawk '
 BEGIN {
 	rc = 1;
 }
diff --git a/test/unittest/variables/tvar/tst.alignment-ptr.sh b/test/unittest/variables/tvar/tst.alignment-ptr.sh
index ac179b3c..3b11bda4 100755
--- a/test/unittest/variables/tvar/tst.alignment-ptr.sh
+++ b/test/unittest/variables/tvar/tst.alignment-ptr.sh
@@ -25,7 +25,7 @@ BEGIN
 	self->var = 0;
 	exit(0);
 }
-' 2>&1 | awk '
+' 2>&1 | gawk '
 BEGIN {
 	rc = 1;
 }
diff --git a/test/unittest/variables/tvar/tst.alignment-short.sh b/test/unittest/variables/tvar/tst.alignment-short.sh
index db1cf1b2..c71cece3 100755
--- a/test/unittest/variables/tvar/tst.alignment-short.sh
+++ b/test/unittest/variables/tvar/tst.alignment-short.sh
@@ -25,7 +25,7 @@ BEGIN
 	self->var = 0x1234;
 	exit(0);
 }
-' 2>&1 | awk '
+' 2>&1 | gawk '
 BEGIN {
 	rc = 1;
 }
diff --git a/test/unittest/variables/tvar/tst.alignment-struct-2.sh b/test/unittest/variables/tvar/tst.alignment-struct-2.sh
index 2f9d6dba..9b518608 100755
--- a/test/unittest/variables/tvar/tst.alignment-struct-2.sh
+++ b/test/unittest/variables/tvar/tst.alignment-struct-2.sh
@@ -25,7 +25,7 @@ BEGIN
 	self->var.w = 0x1234;
 	exit(0);
 }
-' 2>&1 | awk '
+' 2>&1 | gawk '
 BEGIN {
 	rc = 1;
 }
diff --git a/test/unittest/variables/tvar/tst.alignment-struct.sh b/test/unittest/variables/tvar/tst.alignment-struct.sh
index 197edd8e..e6907548 100755
--- a/test/unittest/variables/tvar/tst.alignment-struct.sh
+++ b/test/unittest/variables/tvar/tst.alignment-struct.sh
@@ -25,7 +25,7 @@ BEGIN
 	self->var.u = 0x1234;
 	exit(0);
 }
-' 2>&1 | awk '
+' 2>&1 | gawk '
 BEGIN {
 	rc = 1;
 }
diff --git a/test/utils/clean_probes.sh b/test/utils/clean_probes.sh
index b0337e81..8292b309 100755
--- a/test/utils/clean_probes.sh
+++ b/test/utils/clean_probes.sh
@@ -23,7 +23,7 @@ fi
 	echo '==='
 	cat ${EVENTS}
 } | \
-	awk -v kfn=${KPROBES} -v ufn=${UPROBES} \
+	gawk -v kfn=${KPROBES} -v ufn=${UPROBES} \
 	    'function getTimestamp(dt) {
 		 cmd = "date +\"%s.%N\"";
 		 cmd | getline dt;
diff --git a/test/utils/perf_count_event.sh b/test/utils/perf_count_event.sh
index 606a18d6..957363e5 100755
--- a/test/utils/perf_count_event.sh
+++ b/test/utils/perf_count_event.sh
@@ -20,7 +20,7 @@ shift
 #   If the output is no good, report -1.
 #   If the output is time in msec, convert to nsec.
 #   Otherwise, just report the count.
-perf stat -e $event --no-big-num -x\  $utils/$* |& awk '
+perf stat -e $event --no-big-num -x\  $utils/$* |& gawk '
 /^[^0-9]/ { print -1; exit 1 }
 / msec / { print int(1000000. * $1); exit 0 }
 { print $1; exit 0 }'
diff --git a/test/utils/workload_analyze_loop.sh b/test/utils/workload_analyze_loop.sh
index 28f5fb4b..3bbadf78 100755
--- a/test/utils/workload_analyze_loop.sh
+++ b/test/utils/workload_analyze_loop.sh
@@ -13,7 +13,7 @@ if [ ! -e $prog ]; then
 	exit 1
 fi
 
-objdump -d $prog | awk -v myarch=$(uname -m) '
+objdump -d $prog | gawk -v myarch=$(uname -m) '
 # decide whether to track instructions (which we number n = 1, 2, 3, ...) or not (n < 0)
 # specifically, do not track instructions until we find the disassembly for <main>
 BEGIN { n = -1; }
-- 
2.46.0

