Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E2228DF06
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 21:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752184780; cv=none; b=kRfMV3ZXGgaLIEb12MxRDwlyBDHhix78gDz0eaH+pCuATUtwe8I90uTNAeZAR2rZMrsyBMkvX7+baSu5sy0QtTBLw8/j1U4Yvv8P2m17vEQb3VziaVsR97Sp1NprUwzD6EBV+EFtLyg0WXQ839VRvluz8Fugi28kIk+r5UlChd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752184780; c=relaxed/simple;
	bh=ljAgV4JxcO9kagYYGwMr34svIc9Hcj9Q8jod5ml0YKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T18moe7GF/cSbcTupH/oW4ovoXsXQ2d0djKJ3sH73Io8Ukq5WgtWAuo2w4SRHiH2KlhJLsOrzrH3YbQcNHhSjg6qWNj38Qkp+dtLHK0sz6Kn/OBX41jkYa7KqmWWnI0hTYrfi9XTLrncTfY5CZA9GUsh32nBNwe9MAyvReX7ruo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ut6DQHof; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ut6DQHof"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ALqQ14000560
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 21:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=RXgw+
	yNi2KSp4koZGJ6O3abKDcR5SXeiNnVF1PbL3D8=; b=Ut6DQHof/y/V0uhF8lhpw
	An7mTEcApBQt8SKUEqGF9WQ/b0+YDjAtC35lNGubPySbUCIdI/FXGF4q0okS1MR4
	xRlWNDu0g7jgZD4CLw4LgoUM8rDzebIpmDk3t5jfqNyIIbPZCYJ3fRskbCVDjtCI
	nYvuPNZppWjyUzU+blOJFqwMFrFRIwcXTaMfKx5nCpPOSgxg5IVi2JUUlJTLIfyT
	WFOQwOdap5PVJ4QqYcDWk4+Opn7RQrPgErsPUBqwVl43POyP7kVShxlzhpisxmq7
	Y85HlW8cgkAvntfAj2keyAdze2y0phovdmQ7Yjg218keNiGehykDV5VO4aj5zYlg
	w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47tntc809q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 21:59:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56AKCMSk014180
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 21:59:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ptgdmda3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 21:59:36 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56ALxVoN035912
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 21:59:35 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-49-108.vpn.oracle.com [10.154.49.108])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 47ptgdmd7y-5;
	Thu, 10 Jul 2025 21:59:35 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v5 4/6] selftests/usdt: add test for stapsdt notes in shared library
Date: Thu, 10 Jul 2025 22:59:28 +0100
Message-ID: <20250710215930.82067-5-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250710215930.82067-1-alan.maguire@oracle.com>
References: <20250710215930.82067-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507100185
X-Proofpoint-GUID: sg-1sa5MQleCmPEXgmJUAUS9Y-4cWSoU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDE4NSBTYWx0ZWRfX0uzC3Sbyfb9u aQq1zwvixvWyaeP9SqLdcS4Awx854nDYGjhdurs6u7zZ8b08/Ni7ivYu9PiWNnJ3/Vd6QIoNpBB cjX+Kj0KccjqVrJtZnH19i82YhOwLYX0b4+fVSOAwj8tF8bM/BbWxqHQSZro7T8c7p45wtEs8Ix
 RpVRGFQ8K1N9iriMeRUPWdAVqh5nLBEDhcVMGDmaZsgp6MFVt4Gsis+NZ0TmUkEVxybg2zyJPhv 938jETaiaViW0caEP5BJA1zWloxy1Pm3ti/d2Isn6RfmDvn0coEdrZKheW9g7o0Ago2KAQqOjl1 T+9Nxltp9Wjqoyn18J40JgNDAij95umMh1heXjbGnDp19IW2oxuzTWTKcJ+DCYsJ8ULSwhHSfv5
 PUM0fAFnz+ulzLthEbpSlbKlyxrtCoYoQvXN2x/ueX2KJ92L+GIy6EdKo4vZ+gCBqMrUitxJ
X-Authority-Analysis: v=2.4 cv=HsF2G1TS c=1 sm=1 tr=0 ts=687037c9 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=H-sOoKR7IU3-zD7f7cAA:9 cc=ntf awl=host:13600
X-Proofpoint-ORIG-GUID: sg-1sa5MQleCmPEXgmJUAUS9Y-4cWSoU

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

