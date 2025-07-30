Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF11C267B12
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753866120; cv=none; b=WYjVtJcLJIAnnCJsJ6QnirokhHfX9aQHMDa1gyws1AGGQktxu+gvJb7pNEH/UDS5gK4kpHdEj4DFy9cIt7tow47+0sYpxB/U8aLVUA/fR9kPBfEcAqDyWqkmIGzIp7Qbh5P4mgUxB1jW+OHgUT+nMrLHvtFOfx2Ue5J5+vvs5NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753866120; c=relaxed/simple;
	bh=ljAgV4JxcO9kagYYGwMr34svIc9Hcj9Q8jod5ml0YKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HOxi2pjqj7YTGFVS3xgYk1SC6OkWNoCPhV8mk+mXQhBLZySOobrXVoUCGdynjWvBOfQy2k4HMoQXwug0Ks1CPJawO2kA3jfdLXgy6YfvrFr+pD9Di3hbJ2RLVYO6ePVIgngsHU8fHMsR5rmP/E22zWQVQ+wdRCMVx8kHz10WqZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ClPwfYzl; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ClPwfYzl"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U7gBvB012459
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=RXgw+
	yNi2KSp4koZGJ6O3abKDcR5SXeiNnVF1PbL3D8=; b=ClPwfYzlViArWiie65z7x
	pbccC7jBrDCU9PA+T2G18TgG3OnAC8hCdxn52YGsTk+wln0LZriR5X2Zgb+AXLsg
	xVhvwTntu5IFxPxfi9WHJrP3t8zMn+EPMOZmJUNtge60x1fUYUVPoTUCOs9fTqyu
	+Q9fidb3Tu5TIlJduGajME6wAJ0Wfs1NJV8GeOZuyl7cnuEpQNCo5h58zJULhbtd
	YC/pgchxI9HvtSvrUfBxnOZZa++wahlIbcchMfOUW01aVSyePyyrLr8vddHMVu6N
	2XhbqlS2v7tVRScN+rUHhZLPcur4jEXMepwzAWWpfEc7GjSqJJV8jeW/V9KrS2q3
	g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484qjwsfxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:01:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56U8pm3W037819
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:01:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 484nfapvfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:01:56 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56U91nIp033990
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:01:55 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-51-28.vpn.oracle.com [10.154.51.28])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 484nfapvax-5;
	Wed, 30 Jul 2025 09:01:55 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v7 4/7] selftests/usdt: add test for stapsdt notes in shared library
Date: Wed, 30 Jul 2025 10:01:45 +0100
Message-ID: <20250730090148.2141954-5-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250730090148.2141954-1-alan.maguire@oracle.com>
References: <20250730090148.2141954-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_03,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507300062
X-Authority-Analysis: v=2.4 cv=OvdPyz/t c=1 sm=1 tr=0 ts=6889df84 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=H-sOoKR7IU3-zD7f7cAA:9
X-Proofpoint-GUID: fbC6F2qp3ZZ5eS4893UCHQyy9QkaOvpn
X-Proofpoint-ORIG-GUID: fbC6F2qp3ZZ5eS4893UCHQyy9QkaOvpn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA2MyBTYWx0ZWRfX4apWc9NB7yRk
 aKedeY7jL7p7wdEddvbe+xf3aWm3QHD6Hq0XkTcah6/uzxg+Y/a24+zYwQdsnr+YIvnOJ2VHF3c
 NgXbafIK7+NlAmsZSK/3xa9ge2D5HxZdXM7THfzB+ZIlfxySadApXP+lqZz8B8ey8XjZZc/WQu5
 viFPdL2A8sE0UtUu0YcWN82G/YnhdbQWLxaxNdyLEs7xpjaOXLPSD/yJH3GTWAFSuVei4ChyWVd
 5JIt9eMLu88vZCzmDlbAEyf28QSCw9TjU50x/MU00YbLfL683TQiaorumoft9WOCc81VORolccg
 mDTQTdbTzPO0Z/RSZC0U/q6qT5vf0eh4eu4Y+FKgPIwcVjMqhCDkt74wvuhu/SupZMCd6T++5hw
 EXBv5ZmvpP34sCkBnbmw2xILQCNhIiRKEf0zZ6Ume1/+k06tYwFX3vtgMTIYCnM6W+v3GGJs

To ensure stapsdt notes are found/fire for shared libraries, create
a shared library and trace the stapsdt probes in it.  To ensure the
library is loaded when DTrace has started, call it early in the
program lifetime and sleep until DTrace starts; at that point
trace the probes with the pid and ensure they fire with expected args.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 test/unittest/usdt/tst.stapsdt-notes-lib.r  |  14 ++
 test/unittest/usdt/tst.stapsdt-notes-lib.sh | 145 ++++++++++++++++++++
 2 files changed, 159 insertions(+)
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-lib.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-lib.sh

diff --git a/test/unittest/usdt/tst.stapsdt-notes-lib.r b/test/unittest/usdt/tst.stapsdt-notes-lib.r
new file mode 100644
index 00000000..7c667a4d
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-lib.r
@@ -0,0 +1,14 @@
+libstapsdttest.so:libfn:zero
+libstapsdttest.so:libfn:one:1
+libstapsdttest.so:libfn:two:2:3
+libstapsdttest.so:libfn:three:4:5:7
+libstapsdttest.so:libfn:four:7:8:9:10
+libstapsdttest.so:libfn:five:11:12:13:14:15
+libstapsdttest.so:libfn:six:16:17:18:19:20:21
+libstapsdttest.so:libfn:seven:22:23:24:25:26:27:28
+libstapsdttest.so:libfn:eight:29:30:31:32:33:34:35:36
+libstapsdttest.so:libfn:nine:37:38:39:40:41:42:43:44:45
+libstapsdttest.so:libfn:ten:46:47:48:49:50:51:52:53:54:55
+libstapsdttest.so:libfn:eleven:56:57:58:59:60:61:62:63:64:65
+libstapsdttest.so:libfn:twelve:67:68:69:70:71:72:73:74:75:76
+
diff --git a/test/unittest/usdt/tst.stapsdt-notes-lib.sh b/test/unittest/usdt/tst.stapsdt-notes-lib.sh
new file mode 100755
index 00000000..6fd5808e
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-lib.sh
@@ -0,0 +1,145 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
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
+	libfn(0, 0);
+	sleep(10);
+	libfn(argc, argv);
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

