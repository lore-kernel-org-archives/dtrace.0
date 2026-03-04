Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160EA3659F8
	for <dtrace@lists.linux.dev>; Wed,  4 Mar 2026 08:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611295; cv=none; b=jmVoV0tNNMBvH7/7m1kNJOUe0rPVob2EWJlXAA/Ks6UgoSY7hqHlly/LMVIqYOXWToEWPwmkFFkbAgxuCzP/45mkEOyu7yxpHoJKse5sVQYoFWmC5f96it7rgvfvdF6wYaYmY4+0VizKXLORy+FiGJXUEnsSo0pN92V9BdmLzYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611295; c=relaxed/simple;
	bh=TYlETgVYxCKMvxyD38KN6mEEoeiODMWrPm3YH4HIo/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xv1fEsYuhMRMVIlBebjE2OhigBM3HYXQU8M6S1ZbdSfCSp79mPqEaNAS13Sx/9Cd8GLhZvZ3FAoyQNMZ2n7kCedkd6lazB7Ktxm17yChzvkmy6xggPB+/bR0hY0R4n4iPQ2Czt6jvnavUsjgDV46bwJxFWegMeyVMHTg+iHnYOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LouQARMK; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LouQARMK"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6247aUxD3540036
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=kSRa9
	xR/q91DBAIWYg4feHxD94fzcuHHes0PwM/XkAo=; b=LouQARMKXwJ0O3/AHtP43
	HGxtnvWSqAOFJMRWmYqc9sNOjcZf9BBuhQ72Tu/oT9Ls0T1uVCFB0SuAzJ65dDzf
	/G5dk8NJub1euinxh7p3qJUyeG5BGHkxSTEaGtYl+so4D2ZmI+kXkCXATYBdmL1x
	65qmgorcJTN2IDJqihQEMUN08mK/LujlGkR1gywjKCl+9qnMtPU+IyBQLDBnRg3U
	HPttOJWW5B6BK71oXzO4pEje46g21ZnDzEfBrKJGK18M2w1sDs2WPci+9bLyrFU8
	QC0kC52aD2iq0h3c7hjhd5hqUlbaWYKQsc13acXhtKUZti1ADQD7e88Ums3PvP/8
	A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cpgge81b8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 08:01:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6246TKeK001384
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:01:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ckptfs30c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 08:01:32 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62481RYm023337
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:01:31 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-62-133.vpn.oracle.com [10.154.62.133])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4ckptfs2t1-6;
	Wed, 04 Mar 2026 08:01:31 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v5 5/9] test: add systemwide stapsdt note test for library
Date: Wed,  4 Mar 2026 08:01:21 +0000
Message-ID: <20260304080125.649031-6-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260304080125.649031-1-alan.maguire@oracle.com>
References: <20260304080125.649031-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603040063
X-Proofpoint-GUID: dO21fXK1KlYLI61FUFqnLX-i32L5OI0S
X-Authority-Analysis: v=2.4 cv=YLSSCBGx c=1 sm=1 tr=0 ts=69a7e6dd b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=BqU2WV_vvsyTyxaotp0D:22 a=yPCof4ZbAAAA:8 a=GktFRiQuDf5q_9bFk3EA:9 cc=ntf
 awl=host:13812
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2MyBTYWx0ZWRfXy4DUk+rLzMKr
 8/bT8XiIhEQHk51C8a9C4MKfgoIHamrZr/yA60Akhq7B3KfjmqWYKVXs4JJ4russ+gy2Qe06Cxr
 mTFQ2F2jZl3g7M4uxGNKwbcV1Ap4LQ8tRVE12yLaKZGFzfSCrTAIjnRgcinFkz9gzGWDzWfxsj6
 TPvtL91mw9UhYuBeltcKIUFLxzBLdK35FKZkpYQDBdsx8mq/s8P8IMMIN+ftKD0Mv8dty2UzbO8
 9mLp1uwPPiTd+clsZavwkmhQUUtck0YF85DxmuvY/kBjKPjpmfieRds8WtCPaKkZ5+CwMXWIt/v
 rC0nSqvmKrg6t2tTR7pVb894kmUDGLX02b8M3iF+4G80m38n7l0/pXrf1eXfkIozm2EkcBXVbR7
 m4Zk4+PBFUsVCLG6OkA9Ah7w2gq5o9a68g5YkTRPCwXlBm11IX7ftnC8X22yzBFtVgXz7cx8EMW
 CwzvQy0Ql8jQxUIIu6Ok4m1XNzlcl45IJdWlq3yU=
X-Proofpoint-ORIG-GUID: dO21fXK1KlYLI61FUFqnLX-i32L5OI0S

Add test verifying that systemwide stapsdt probe firing
is detected and we retrieve arguments correctly for
a shared library.  Do this for program with library
that is started before, during (via -c) and two after
(using system) to ensure we see probe firings in all cases.

Count probe firings uniquely per pid for each probe until
we see last one; then print probe arguments.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 .../usdt/tst.stapsdt-notes-systemwide-lib.r   |  14 ++
 .../usdt/tst.stapsdt-notes-systemwide-lib.sh  | 215 ++++++++++++++++++
 2 files changed, 229 insertions(+)
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide-lib.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-lib.sh

diff --git a/test/unittest/usdt/tst.stapsdt-notes-systemwide-lib.r b/test/unittest/usdt/tst.stapsdt-notes-systemwide-lib.r
new file mode 100644
index 00000000..c85121c4
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-systemwide-lib.r
@@ -0,0 +1,14 @@
+libstapsdttest.so:zero
+libstapsdttest.so:one:1
+libstapsdttest.so:two:2:3
+libstapsdttest.so:three:4:5:7
+libstapsdttest.so:four:7:8:9:10
+libstapsdttest.so:five:11:12:13:14:15
+libstapsdttest.so:six:16:17:18:19:20:21
+libstapsdttest.so:seven:22:23:24:25:26:27:28
+libstapsdttest.so:eight:29:30:31:32:33:34:35:36
+libstapsdttest.so:nine:37:38:39:40:41:42:43:44:45
+libstapsdttest.so:ten:46:47:48:49:50:51:52:53:54:55
+libstapsdttest.so:eleven:56:57:58:59:60:61:62:63:64:65
+libstapsdttest.so:twelve:67:68:69:70:71:72:73:74:75:76
+
diff --git a/test/unittest/usdt/tst.stapsdt-notes-systemwide-lib.sh b/test/unittest/usdt/tst.stapsdt-notes-systemwide-lib.sh
new file mode 100755
index 00000000..d1ac0af8
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-systemwide-lib.sh
@@ -0,0 +1,215 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+# This test covers all stapsdt probes fired by the STAP_PROBEn macros.
+# Arguments values are checked only for first 10 arguments because
+# there is support for arg0 ... arg9 only at this moment.
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+CC=/usr/bin/gcc
+CFLAGS="-I${PWD}/test/unittest/usdt"
+
+DIRNAME="$tmpdir/usdt-notes.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+cat > libstapsdttest.c <<EOF
+#include <sdt_notes.h>
+
+void
+libfn(int argc, char **argv)
+{
+	if (argc == 0 && argv == 0)
+		return;
+	STAP_PROBE(test_prov, zero);
+	STAP_PROBE1(test_prov, one, argc);
+	STAP_PROBE2(test_prov, two, 2, 3);
+	STAP_PROBE3(test_prov, three, 4, 5, 7);
+	STAP_PROBE4(test_prov, four, 7, 8, 9, 10);
+	STAP_PROBE5(test_prov, five, 11, 12, 13, 14, 15);
+	STAP_PROBE6(test_prov, six, 16, 17, 18, 19, 20, 21);
+	STAP_PROBE7(test_prov, seven, 22, 23, 24, 25, 26, 27, 28);
+	STAP_PROBE8(test_prov, eight, 29, 30, 31, 32, 33, 34, 35, 36);
+	STAP_PROBE9(test_prov, nine, 37, 38, 39, 40, 41, 42, 43, 44, 45);
+	STAP_PROBE10(test_prov, ten, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55);
+	STAP_PROBE11(test_prov, eleven, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66);
+	STAP_PROBE12(test_prov, twelve, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78);
+}
+EOF
+
+cat > test.c <<EOF
+
+#include <unistd.h>
+
+extern void libfn(int argc, char **argv);
+
+int
+main(int argc, char **argv)
+{
+	int i;
+
+	for (i = 0; i < 20; i++) {
+		libfn(argc, argv);
+		sleep(1);
+	}
+	return 0;
+}
+EOF
+
+${CC} ${CFLAGS} -c -fpic libstapsdttest.c
+${CC} -shared -o libstapsdttest.so libstapsdttest.o
+${CC} -L. ${CFLAGS} -o test test.c -lstapsdttest
+if [ $? -ne 0 ]; then
+	echo "failed to compile test.c" >& 2
+	exit 1
+fi
+
+export LD_LIBRARY_PATH=.:${LD_LIBRARY_PATH}
+
+# Launch one program before DTrace starts
+
+./test &
+
+sleep 1
+
+# Launch another with dtrace -c
+$dtrace -w -c './test' -qs /dev/stdin <<EOF
+
+BEGIN
+{
+	donecount = 0;
+	afters = 0;
+}
+
+/* And launch two more with system() */
+profile:::tick-1s
+/ afters < 2 /
+{
+        system("./test &");
+        afters++;
+}
+
+test_prov*:libstapsdttest.so::*
+/ !done[probename, pid] && fired[probename] < 4 /
+{
+	fired[probename]++;
+	done[probename, pid] = 1;
+}
+
+test_prov*:libstapsdttest.so::zero
+/ fired[probename] == 4 /
+{
+	printf("%s:%s\n", probemod, probename);
+	fired[probename]++;
+	donecount++;
+}
+
+test_prov*:libstapsdttest.so::one
+/ fired[probename] == 4 /
+{
+	printf("%s:%s:%li\n", probemod, probename, arg0);
+	fired[probename]++;
+	donecount++;
+}
+
+test_prov*:libstapsdttest.so::two
+/ fired[probename] == 4 /
+{
+	printf("%s:%s:%li:%li\n", probemod, probename, arg0, arg1);
+	fired[probename]++;
+	donecount++;
+}
+
+test_prov*:libstapsdttest.so::three
+/ fired[probename] == 4 /
+{
+	printf("%s:%s:%li:%li:%li\n", probemod, probename, arg0, arg1,
+	       arg2);
+	fired[probename]++;
+	donecount++;
+}
+
+test_prov*:libstapsdttest.so::four
+/ fired[probename] == 4 /
+{
+	printf("%s:%s:%li:%li:%li:%li\n", probemod, probename, arg0, arg1,
+	       arg2, arg3);
+	fired[probename]++;
+	donecount++;
+}
+
+test_prov*:libstapsdttest.so::five
+/ fired[probename] == 4 /
+{
+	printf("%s:%s:%li:%li:%li:%li:%li\n", probemod, probename,
+	       arg0, arg1, arg2, arg3, arg4);
+	fired[probename]++;
+	donecount++;
+}
+
+test_prov*:libstapsdttest.so::six
+/ fired[probename] == 4 /
+{
+	printf("%s:%s:%li:%li:%li:%li:%li:%li\n", probemod, probename,
+	       arg0, arg1, arg2, arg3, arg4, arg5);
+	fired[probename]++;
+	donecount++;
+}
+
+test_prov*:libstapsdttest.so::seven
+/ fired[probename] == 4 /
+{
+	printf("%s:%s:%li:%li:%li:%li:%li:%li:%li\n", probemod, probename,
+	       arg0, arg1, arg2, arg3, arg4, arg5, arg6);
+	fired[probename]++;
+	donecount++;
+}
+
+test_prov*:libstapsdttest.so::eight
+/ fired[probename] == 4 /
+{
+	printf("%s:%s:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probename,
+	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
+	fired[probename]++;
+	donecount++;
+}
+
+test_prov*:libstapsdttest.so::nine
+/ fired[probename] == 4/
+{
+	printf("%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probename,
+	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
+	fired[probename]++;
+	donecount++;
+}
+
+test_prov*:libstapsdttest.so::ten,
+test_prov*:libstapsdttest.so::eleven,
+test_prov*:libstapsdttest.so::twelve
+/ fired[probename] == 4 /
+{
+	printf("%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probename,
+	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
+	fired[probename]++;
+	donecount;
+}
+
+profile:::tick-1s
+/ donecount == 12 && afters == 2 /
+{
+	exit(0);
+}
+
+EOF
+status=$?
+
+exit $status
-- 
2.43.5

