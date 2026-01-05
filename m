Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF9933B6F5
	for <dtrace@lists.linux.dev>; Mon,  5 Jan 2026 12:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616060; cv=none; b=bvr2kbz56C8rbpdhX0UCIwUYfQwoq3XkHl6Cf+HYv+FgAo9xQ/ehEDfzfhXMk87g1rKWcJNdeQZCAO4dDKfZEBaUr7BurmVqGg2/KWcB2Jku5g7aHrp7cvnN/unSavhMV1LFTT/N6nCWFYfM7EXBDTBRqEv3tT5XuRQmBIkeJlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616060; c=relaxed/simple;
	bh=GSz8Q8J4i/2ta1UHx7QeXmrSd29AMIKkJ49MdWVdlWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H1rW2pxI8ns8qEEa1N0T684+xX++dfH7OPHIjVWgEZDfETE5AQrN3h+hWr8Z6N1iZw6fNt8RCOyT8laMrNXMoKfekKqTpINmFNLZ+fAbLH6OyIcEj3rRTQwF54RjzEgLIeAusLzLHWCzgEay+qkHVAoA9+nv0xM4kSgvMOKB+lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=o394bzbK; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="o394bzbK"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6053OBMe298866
	for <dtrace@lists.linux.dev>; Mon, 5 Jan 2026 12:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=wAoC9
	Vw17fYXV52I6yEU62n0GHQ4+q4/E+oFAaNYiLw=; b=o394bzbKnRGDbK9126g0E
	MIaH76MiGHUdpzgfWbb9WsM3ndyMhw8T5Aoiy82/GA7ES8Ct9vdCaN+Ks8vxMK/F
	aBF1zMQeyqAiuhzp/orfKbPA1HFxAHFxP3iXnH7rr75ChjFvm3jXqsHkXMOwEE09
	8iolbFRSaxAoiNCDSuzn/UvlJuve0QIGcHJYJl8hegx2isMUOy9dq6f4MtMjOZWO
	YANOhu5An+yOudSjzSTOVohV+JqdFhvG0YpOqif1GomInmrSgbTVp9qIL81eHFt5
	S3kTG4y3GsqjUATs3hXED0CH5eHdfi98wtqjYAcFnBWNibEbiti3gH5DawqXXzyt
	g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bev641kme-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 05 Jan 2026 12:27:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 605A44eg015545
	for <dtrace@lists.linux.dev>; Mon, 5 Jan 2026 12:27:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4besj72qcv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 05 Jan 2026 12:27:36 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 605CRTWm034842
	for <dtrace@lists.linux.dev>; Mon, 5 Jan 2026 12:27:36 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-54-206.vpn.oracle.com [10.154.54.206])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4besj72qa8-6;
	Mon, 05 Jan 2026 12:27:36 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2 5/6] stapsdt: add systemwide test for is-enabled probes
Date: Mon,  5 Jan 2026 12:27:27 +0000
Message-ID: <20260105122728.436769-6-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260105122728.436769-1-alan.maguire@oracle.com>
References: <20260105122728.436769-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601050109
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEwOSBTYWx0ZWRfXyEgQilov5/vp
 FKnZjTFiQixn85Y4EtDEycLvusUkpr6hxvvb82vJuMn9tGLG4Qg45aWekmXRWivWgY+RZzIuOqk
 olvR0ew4ptoO8gzN2E48+PexgVee7OC6hY+zB6CluuFJgSXTiHBLL3a4g7HtWLWuwFsFc93Y5ED
 1OggtHnXNn7jI3uzwdifa4a92uTPiK+bW3yCipWtK23Ao0qYX9rgfYLVPeu/zVwsxda4o4mr/qn
 ZHx3+Wbr1r0I+38yBy4RJpKzG2AnZacrb/us7B2GdNzPyxuGa3j/cHtH31gwH91s50QRsjHhPdB
 c+WKlq/qZlUbHCyqiZTa+rPJ7OLhTefv/MaNUNTcvsZRbJZeXWReZVWPV7rEzbrxtglRVIGHzP5
 YUvB53nTwCI2zqoTMM96HdEOHoRYJi7NIXT2bPhryuxkg8SpC3z5gF5rTSw7z3q3UYtQHGm2qFo
 ZnuarE3GOO9PSjVuu4A==
X-Authority-Analysis: v=2.4 cv=W6w1lBWk c=1 sm=1 tr=0 ts=695bae39 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=zVDwAqWSci8khojUUtgA:9
X-Proofpoint-GUID: OM95uiI2qJ2wR9Vwu6vCAB9VtpaKEBbF
X-Proofpoint-ORIG-GUID: OM95uiI2qJ2wR9Vwu6vCAB9VtpaKEBbF

Add is-enabled probes to library and ensure they fire with expected
arguments when enabled.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 .../tst.stapsdt-notes-systemwide-isenabled.r  |  13 ++
 .../tst.stapsdt-notes-systemwide-isenabled.sh | 177 ++++++++++++++++++
 2 files changed, 190 insertions(+)
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide-isenabled.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-isenabled.sh

diff --git a/test/unittest/usdt/tst.stapsdt-notes-systemwide-isenabled.r b/test/unittest/usdt/tst.stapsdt-notes-systemwide-isenabled.r
new file mode 100644
index 00000000..d7824fb5
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-systemwide-isenabled.r
@@ -0,0 +1,13 @@
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
+libstapsdttest.so:eleven:56:57:58:59:60:61:62:63:64:65
+libstapsdttest.so:twelve:67:68:69:70:71:72:73:74:75:76
+
diff --git a/test/unittest/usdt/tst.stapsdt-notes-systemwide-isenabled.sh b/test/unittest/usdt/tst.stapsdt-notes-systemwide-isenabled.sh
new file mode 100755
index 00000000..7835a147
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-systemwide-isenabled.sh
@@ -0,0 +1,177 @@
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
+#include <stdio.h>
+#define _SDT_HAS_SEMAPHORES 1
+#include <sdt_notes.h>
+
+#define SEMA_DEFINE(name)					\
+	unsigned short test_prov_##name##_semaphore = 0
+
+#define SEMA_ENABLED(name)					\
+	test_prov_##name##_semaphore
+
+SEMA_DEFINE(zero);
+SEMA_DEFINE(one);
+SEMA_DEFINE(two);
+SEMA_DEFINE(three);
+SEMA_DEFINE(four);
+SEMA_DEFINE(five);
+SEMA_DEFINE(six);
+SEMA_DEFINE(seven);
+SEMA_DEFINE(eight);
+SEMA_DEFINE(nine);
+SEMA_DEFINE(ten);
+SEMA_DEFINE(eleven);
+SEMA_DEFINE(twelve);
+
+void
+libfn(int argc, char **argv)
+{
+	if (argc == 0 && argv == 0)
+		return;
+	if (SEMA_ENABLED(zero))
+		STAP_PROBE(test_prov, zero);
+	if (SEMA_ENABLED(one))
+		STAP_PROBE1(test_prov, one, argc);
+	if (SEMA_ENABLED(two))
+		STAP_PROBE2(test_prov, two, 2, 3);
+	if (SEMA_ENABLED(three))
+		STAP_PROBE3(test_prov, three, 4, 5, 7);
+	if (SEMA_ENABLED(four))
+		STAP_PROBE4(test_prov, four, 7, 8, 9, 10);
+	if (SEMA_ENABLED(five))
+		STAP_PROBE5(test_prov, five, 11, 12, 13, 14, 15);
+	if (SEMA_ENABLED(six))
+		STAP_PROBE6(test_prov, six, 16, 17, 18, 19, 20, 21);
+	if (SEMA_ENABLED(seven))
+		STAP_PROBE7(test_prov, seven, 22, 23, 24, 25, 26, 27, 28);
+	if (SEMA_ENABLED(eight))
+		STAP_PROBE8(test_prov, eight, 29, 30, 31, 32, 33, 34, 35, 36);
+	if (SEMA_ENABLED(nine))
+		STAP_PROBE9(test_prov, nine, 37, 38, 39, 40, 41, 42, 43, 44, 45);
+	if (SEMA_ENABLED(ten)) {
+		printf("should not see this since ten probe is not enabled!\n");
+		STAP_PROBE10(test_prov, ten, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55);
+		fflush(stdout);
+	}
+	if (SEMA_ENABLED(eleven))
+		STAP_PROBE11(test_prov, eleven, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66);
+	if (SEMA_ENABLED(twelve))
+		STAP_PROBE12(test_prov, twelve, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78);
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
+$dtrace -c './test' -qs /dev/stdin <<EOF
+test_prov*:libstapsdttest.so::zero
+{
+	printf("%s:%s\n", probemod, probename);
+}
+
+test_prov*:libstapsdttest.so::one
+{
+	printf("%s:%s:%li\n", probemod, probename, arg0);
+}
+
+test_prov*:libstapsdttest.so::two
+{
+	printf("%s:%s:%li:%li\n", probemod, probename, arg0, arg1);
+}
+
+test_prov*:libstapsdttest.so::three
+{
+	printf("%s:%s:%li:%li:%li\n", probemod, probename, arg0, arg1,
+	       arg2);
+}
+
+test_prov*:libstapsdttest.so::four
+{
+	printf("%s:%s:%li:%li:%li:%li\n", probemod, probename, arg0, arg1,
+	       arg2, arg3);
+}
+
+test_prov*:libstapsdttest.so::five
+{
+	printf("%s:%s:%li:%li:%li:%li:%li\n", probemod, probename,
+	       arg0, arg1, arg2, arg3, arg4);
+}
+
+test_prov*:libstapsdttest.so::six
+{
+	printf("%s:%s:%li:%li:%li:%li:%li:%li\n", probemod, probename,
+	       arg0, arg1, arg2, arg3, arg4, arg5);
+}
+
+test_prov*:libstapsdttest.so::seven
+{
+	printf("%s:%s:%li:%li:%li:%li:%li:%li:%li\n", probemod, probename,
+	       arg0, arg1, arg2, arg3, arg4, arg5, arg6);
+}
+
+test_prov*:libstapsdttest.so::eight
+{
+	printf("%s:%s:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probename,
+	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
+}
+
+test_prov*:libstapsdttest.so::nine
+{
+	printf("%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probename,
+	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
+}
+
+test_prov*:libstapsdttest.so::eleven,
+test_prov*:libstapsdttest.so::twelve
+{
+	printf("%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probename,
+	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
+}
+EOF
+status=$?
+
+exit $status
-- 
2.43.5

