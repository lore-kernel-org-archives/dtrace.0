Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAE91B982E
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738162531; cv=none; b=stxbsSf3zPpfWzhw25v3a9/MDdLIl5ocoMoPpiYRsJ46EpANsajjzepUWQ1Y6xBtE8a8m4y7T7cJJzNjFlDSL6Mf40XjzHaUsJAsC5/Q7K+Rp9Nq4YjkC8jyCE24QFm1eGlAmPDqTKqBUOdmpvzoQjz1HMtZUryuAeWt6BQ7hTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738162531; c=relaxed/simple;
	bh=0rECvzMSUTobj19nufXw5C1HOPoFPU/c6ERZgrQB3qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FGcP5IQwTemfFTD4TzzNNNxPHIP2qX7X6gmEMUKFP2ayBpIrFyzwMeYRvIH6zlx4swHBSmjFokEVQgoEjWrw9JRi25tyyASj3ZSZO8lAURCFjDNZtjmXozdXWDjUAAoHf9gHTIFKqkw5OYFlcXuevW4DuSQuOv/xQved74if5Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HclvaNlU; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HclvaNlU"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TEY0gf030118
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=D3ufs
	ChwwhfZNTGtsIwDZk/vg5xe/07xt3qOUUWisJw=; b=HclvaNlURsdELKYb09+YE
	xK8NNoO+fQk45XWFCcBBx1IG+XPrMpxrTZZkx+ffBTDFtvk5+gUY2cilM6omouBB
	PsVwzxAKPUdofFaYJRNW2uKIdd/LUdK9CWJPdpYN1e6V7gUGswAUDzNb6EZK7urQ
	s5d90oG1Hy2+dcqWWuGVWNn33CwXr8Sj6pEFzrPbVME5pzZMTFJ5NMwj5B793Mri
	c9T5uc1yudoYj5/p9Flf1oy7qesMj+pd7Hh6mnIkkjRBhdPQGSHk+2m1Fm2eOoNF
	8cYXILABQLI2ZEoU6N8BZDj3F86D2VvX6bw9pHC2Z+vyAt3LmskmDf/ptkp6+3Jm
	w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44fn2ug6w3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:55:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50TEk7UD024087
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:55:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpd9upw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:55:27 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50TEtOVA016122
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:55:27 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-177-216.vpn.oracle.com [10.175.177.216])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 44cpd9uptg-4;
	Wed, 29 Jan 2025 14:55:27 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2 3/4] selftests/usdt: add test for USDT notes in shared library
Date: Wed, 29 Jan 2025 14:55:21 +0000
Message-ID: <20250129145522.512341-4-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250129145522.512341-1-alan.maguire@oracle.com>
References: <20250129145522.512341-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_02,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501290120
X-Proofpoint-ORIG-GUID: 892tUQWm_63yBCMx1dMGwqC7xNoKQ644
X-Proofpoint-GUID: 892tUQWm_63yBCMx1dMGwqC7xNoKQ644

To ensure USDT notes are found/fire for shared libraries, create
a shared library and trace the USDT probes in it.  To ensure the
library is loaded when DTrace has started, call it early in the
program lifetime and sleep until DTrace starts; at that point
trace the probes with the pid and ensure they fire with expected args.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 test/unittest/usdt/tst.usdt-notes-lib.r  |  14 +++
 test/unittest/usdt/tst.usdt-notes-lib.sh | 145 +++++++++++++++++++++++
 2 files changed, 159 insertions(+)
 create mode 100644 test/unittest/usdt/tst.usdt-notes-lib.r
 create mode 100755 test/unittest/usdt/tst.usdt-notes-lib.sh

diff --git a/test/unittest/usdt/tst.usdt-notes-lib.r b/test/unittest/usdt/tst.usdt-notes-lib.r
new file mode 100644
index 00000000..cab7b6d5
--- /dev/null
+++ b/test/unittest/usdt/tst.usdt-notes-lib.r
@@ -0,0 +1,14 @@
+libusdttest.so:libfn:zero
+libusdttest.so:libfn:one:1
+libusdttest.so:libfn:two:2:3
+libusdttest.so:libfn:three:4:5:7
+libusdttest.so:libfn:four:7:8:9:10
+libusdttest.so:libfn:five:11:12:13:14:15
+libusdttest.so:libfn:six:16:17:18:19:20:21
+libusdttest.so:libfn:seven:22:23:24:25:26:27:28
+libusdttest.so:libfn:eight:29:30:31:32:33:34:35:36
+libusdttest.so:libfn:nine:37:38:39:40:41:42:43:44:45
+libusdttest.so:libfn:ten:46:47:48:49:50:51:52:53:54:55
+libusdttest.so:libfn:eleven:56:57:58:59:60:61:62:63:64:65
+libusdttest.so:libfn:twelve:67:68:69:70:71:72:73:74:75:76
+
diff --git a/test/unittest/usdt/tst.usdt-notes-lib.sh b/test/unittest/usdt/tst.usdt-notes-lib.sh
new file mode 100755
index 00000000..ed87e9f5
--- /dev/null
+++ b/test/unittest/usdt/tst.usdt-notes-lib.sh
@@ -0,0 +1,145 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+# This test covers all USDT probes fired by the DTRACE_PROBEn macros.
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
+cat > libusdttest.c <<EOF
+#include <sdt_notes.h>
+
+void
+libfn(int argc, char **argv)
+{
+	if (argc == 0 && argv == 0)
+		return;
+	DTRACE_PROBE(test_prov, zero);
+	DTRACE_PROBE1(test_prov, one, argc);
+	DTRACE_PROBE2(test_prov, two, 2, 3);
+	DTRACE_PROBE3(test_prov, three, 4, 5, 7);
+	DTRACE_PROBE4(test_prov, four, 7, 8, 9, 10);
+	DTRACE_PROBE5(test_prov, five, 11, 12, 13, 14, 15);
+	DTRACE_PROBE6(test_prov, six, 16, 17, 18, 19, 20, 21);
+	DTRACE_PROBE7(test_prov, seven, 22, 23, 24, 25, 26, 27, 28);
+	DTRACE_PROBE8(test_prov, eight, 29, 30, 31, 32, 33, 34, 35, 36);
+	DTRACE_PROBE9(test_prov, nine, 37, 38, 39, 40, 41, 42, 43, 44, 45);
+	DTRACE_PROBE10(test_prov, ten, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55);
+	DTRACE_PROBE11(test_prov, eleven, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66);
+	DTRACE_PROBE12(test_prov, twelve, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78);
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
+	libfn(0, 0);
+	sleep(10);
+	libfn(argc, argv);
+	return 0;
+}
+EOF
+
+${CC} ${CFLAGS} -c -fpic libusdttest.c
+${CC} -shared -o libusdttest.so libusdttest.o
+${CC} -L. ${CFLAGS} -o test test.c -lusdttest
+if [ $? -ne 0 ]; then
+	echo "failed to compile test.c" >& 2
+	exit 1
+fi
+
+export LD_LIBRARY_PATH=.:${LD_LIBRARY_PATH}
+LD_LIBRARY_PATH=.:${LD_LIBRARY_PATH} ./test &
+PID=$!
+sleep 5
+$dtrace -p $PID -qs /dev/stdin <<EOF
+test_prov\$target:::zero
+{
+	printf("%s:%s:%s\n", probemod, probefunc, probename);
+}
+
+test_prov\$target:::one
+{
+	printf("%s:%s:%s:%li\n", probemod, probefunc, probename, arg0);
+}
+
+test_prov\$target:::two
+{
+	printf("%s:%s:%s:%li:%li\n", probemod, probefunc, probename, arg0, arg1);
+}
+
+test_prov\$target:::three
+{
+	printf("%s:%s:%s:%li:%li:%li\n", probemod, probefunc, probename, arg0, arg1,
+	       arg2);
+}
+
+test_prov\$target:::four
+{
+	printf("%s:%s:%s:%li:%li:%li:%li\n", probemod, probefunc, probename, arg0, arg1,
+	       arg2, arg3);
+}
+
+test_prov\$target:::five
+{
+	printf("%s:%s:%s:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
+	       arg0, arg1, arg2, arg3, arg4);
+}
+
+test_prov\$target:::six
+{
+	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
+	       arg0, arg1, arg2, arg3, arg4, arg5);
+}
+
+test_prov\$target:::seven
+{
+	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
+	       arg0, arg1, arg2, arg3, arg4, arg5, arg6);
+}
+
+test_prov\$target:::eight
+{
+	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
+	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
+}
+
+test_prov\$target:::nine
+{
+	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
+	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
+}
+
+test_prov\$target:::ten,
+test_prov\$target:::eleven,
+test_prov\$target:::twelve
+{
+	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
+	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
+}
+EOF
+status=$?
+
+exit $status
-- 
2.43.5

