Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8ED0253B40
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753866129; cv=none; b=C4ioCaTq/SQNbekQcfsHqZ0jsiJ/JUNrLa5dsFAr1Ev4MTKCeowtQsnYYSzT+DRA+40euIQfaYUiL7E4UAzup/3BJNghecc+1BmKSFdUl4UDJhl1DoQl97BkebeKhnJa/ljXploqltWug2SXqcZiXQUZvI+MEvHMb07vnMQWvAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753866129; c=relaxed/simple;
	bh=RqguugQ63yO4QfDD3pZlVuuxB8Z/vphYPM8UrHof+Gg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mis7TGBZ/+whMOYEzfJac0iXGHMRwO0NZoTZ5ktjXjKRP0LbmGyaK42Z8YE66MO7revbvVhZXuVBU+I8EyR4LSXubQbqG5c9Oh9actqxX9RVuXR3Gthcd5gfx+vyu1vUrBQvFEI90eajxtbSggan6o6SBPgvQP2crYckKoi7trk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gshbS/uo; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gshbS/uo"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U7g1po010373
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=dD46d
	D2i8stt/0PLvHdjtxV9yA1GQpudS+RDDymQkZw=; b=gshbS/uow8LVA3gJfAdQv
	bssVR7bW9ftiB7QUytWwqMx6x2DSBMQ2UTs2DwFKjxlyKVcqTxoA8Na6g31eOVp1
	/BbGfN3UIY5xqRcvAPoUKlhVbQ5xdGahGu5peQOxlNen75tQ48yQo4QBHeH4KrXc
	VHFPl/Wrx/p6ueoeRiG4JgvESiHhgWPbIGOZw2KNtGjjM6BAFXJlKOGposfj3Q0v
	umrGMLIpwEW1IKltNbYgkT9qD5r1BQ6CTPBZE2pH+fricrV6wY3aswhjZJLD/Jyk
	klIvTlUEoMEWhtGnytH0bL4nuDWS0/ExicvtSN8E9rMYjbMAxwR5WlroG3wD5zss
	w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q2e1n30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:02:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56U8r1tf038709
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:02:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 484nfapvjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:02:00 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56U91nJ0033990
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:01:59 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-51-28.vpn.oracle.com [10.154.51.28])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 484nfapvax-8;
	Wed, 30 Jul 2025 09:01:59 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v7 7/7] selftests/usdt: add is-enabled stapsdt tests using semaphores
Date: Wed, 30 Jul 2025 10:01:48 +0100
Message-ID: <20250730090148.2141954-8-alan.maguire@oracle.com>
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
X-Proofpoint-GUID: kNE5ARfhiBcMc8WNBEAcXv0S3433dXLU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA2MyBTYWx0ZWRfX3ZiFXFW+1zR3
 vjsxgEt8Iltml0rTx79nm8xA0xnVA/vUWy4MJ6N6e4Bl0V6UK1ANwHNb0+/GOlbch+uRtDp25XK
 ER3KAtXGmWA1tAAthx7NjrvXxeU1YbZdFlu5EXS6x9Y9V3CXWVu5IIfeLroUGaiw2IyKsUcukd/
 fJEdCIGS9ugCK84gO1XyxTko38QsMqvnPEj5Clh1LCgPd3zG2Ws8oF9eTGRW/VlfhZzfqMsEB+d
 yTXwpqEWkYHMaLPQjHKwZ32kgA3r41bk2koVmllMtGd0D7U41aFKQ/n/MGo/f3WAu6RPfMS+tUH
 PHsbvddD2n9YEnHIVWuP7ixuRARVeL9wcNuUf++1yAjnrq1RmHbqd82WjKF4dUp07Typ78ALYuZ
 berRTirtVo99YRZfjm9iT+G1kXgjsvLn4M6ekDJQIPhBpyWJGz6oSF0PDqt4GhVbZExZNQRs
X-Proofpoint-ORIG-GUID: kNE5ARfhiBcMc8WNBEAcXv0S3433dXLU
X-Authority-Analysis: v=2.4 cv=A+5sP7WG c=1 sm=1 tr=0 ts=6889df89 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=WdP4LP-unDLZMAqStP4A:9

Is-eanbled probes are implemented using semaphores where the
semaphore address is specified in the ELF notes and passed
in at probe creation time to have the kernel reference-count
probes; this allows us to have argument assembly code that
only gets executed when the stapsdt probe is in use.

Test is-enabled probes and ensure that the kernel-controlled
semaphore is not incremented for disabled probes.  Also test
that provider/probe names with double-underscores are converted
to dashes, i.e. one__probe because :one-probe.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 .../usdt/tst.stapsdt-notes-isenabled.r        |  13 ++
 .../usdt/tst.stapsdt-notes-isenabled.sh       | 152 ++++++++++++++++++
 2 files changed, 165 insertions(+)
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-isenabled.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-isenabled.sh

diff --git a/test/unittest/usdt/tst.stapsdt-notes-isenabled.r b/test/unittest/usdt/tst.stapsdt-notes-isenabled.r
new file mode 100644
index 00000000..b088b285
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-isenabled.r
@@ -0,0 +1,13 @@
+test:main:zero-probe
+test:main:one-probe:1
+test:main:two-probe:2:3
+test:main:three-probe:4:5:7
+test:main:four-probe:7:8:9:10
+test:main:five-probe:11:12:13:14:15
+test:main:six-probe:16:17:18:19:20:21
+test:main:seven-probe:22:23:24:25:26:27:28
+test:main:eight-probe:29:30:31:32:33:34:35:36
+test:main:nine-probe:37:38:39:40:41:42:43:44:45
+test:main:eleven-probe:56:57:58:59:60:61:62:63:64:65
+test:main:twelve-probe:67:68:69:70:71:72:73:74:75:76
+
diff --git a/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh b/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
new file mode 100755
index 00000000..cd711da2
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
@@ -0,0 +1,152 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
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
+cat > test.c <<EOF
+#include <stdio.h>
+#define _SDT_HAS_SEMAPHORES 1
+#include <sdt_notes.h>
+
+unsigned short test__prov_zero__probe_semaphore = 0;
+unsigned short test__prov_one__probe_semaphore = 0;
+unsigned short test__prov_two__probe_semaphore = 0;
+unsigned short test__prov_three__probe_semaphore = 0;
+unsigned short test__prov_four__probe_semaphore = 0;
+unsigned short test__prov_five__probe_semaphore = 0;
+unsigned short test__prov_six__probe_semaphore = 0;
+unsigned short test__prov_seven__probe_semaphore = 0;
+unsigned short test__prov_eight__probe_semaphore = 0;
+unsigned short test__prov_nine__probe_semaphore = 0;
+unsigned short test__prov_ten__probe_semaphore = 0;
+unsigned short test__prov_eleven__probe_semaphore = 0;
+unsigned short test__prov_twelve__probe_semaphore = 0;
+
+int
+main(int argc, char **argv)
+{
+	if (test__prov_zero__probe_semaphore)
+		STAP_PROBE(test__prov, zero__probe);
+	if (test__prov_one__probe_semaphore)
+		STAP_PROBE1(test__prov, one__probe, argc);
+	if (test__prov_two__probe_semaphore)
+		STAP_PROBE2(test__prov, two__probe, 2, 3);
+	if (test__prov_three__probe_semaphore)
+		STAP_PROBE3(test__prov, three__probe, 4, 5, 7);
+	if (test__prov_four__probe_semaphore)
+		STAP_PROBE4(test__prov, four__probe, 7, 8, 9, 10);
+	if (test__prov_five__probe_semaphore)
+		STAP_PROBE5(test__prov, five__probe, 11, 12, 13, 14, 15);
+	if (test__prov_six__probe_semaphore)
+		STAP_PROBE6(test__prov, six__probe, 16, 17, 18, 19, 20, 21);
+	if (test__prov_seven__probe_semaphore)
+		STAP_PROBE7(test__prov, seven__probe, 22, 23, 24, 25, 26, 27, 28);
+	if (test__prov_eight__probe_semaphore)
+		STAP_PROBE8(test__prov, eight__probe, 29, 30, 31, 32, 33, 34, 35, 36);
+	if (test__prov_nine__probe_semaphore)
+		STAP_PROBE9(test__prov, nine__probe, 37, 38, 39, 40, 41, 42, 43, 44, 45);
+	if (test__prov_ten__probe_semaphore) {
+		printf("should not see this since ten probe is not enabled!\n");
+		STAP_PROBE10(test__prov, ten__probe, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55);
+		fflush(stdout);
+	}
+	if (test__prov_eleven__probe_semaphore)
+		STAP_PROBE11(test__prov, eleven__probe, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66);
+	if (test__prov_twelve__probe_semaphore)
+		STAP_PROBE12(test__prov, twelve__probe, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78);
+}
+EOF
+
+${CC} ${CFLAGS} -o test test.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test.c" >& 2
+	exit 1
+fi
+
+$dtrace -c ./test -qs /dev/stdin <<EOF
+test-prov\$target:::zero-probe
+{
+	printf("%s:%s:%s\n", probemod, probefunc, probename);
+}
+
+test-prov\$target:::one-probe
+{
+	printf("%s:%s:%s:%li\n", probemod, probefunc, probename, arg0);
+}
+
+test-prov\$target:::two-probe
+{
+	printf("%s:%s:%s:%li:%li\n", probemod, probefunc, probename, arg0, arg1);
+}
+
+test-prov\$target:::three-probe
+{
+	printf("%s:%s:%s:%li:%li:%li\n", probemod, probefunc, probename, arg0, arg1,
+	       arg2);
+}
+
+test-prov\$target:::four-probe
+{
+	printf("%s:%s:%s:%li:%li:%li:%li\n", probemod, probefunc, probename, arg0, arg1,
+	       arg2, arg3);
+}
+
+test-prov\$target:::five-probe
+{
+	printf("%s:%s:%s:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
+	       arg0, arg1, arg2, arg3, arg4);
+}
+
+test-prov\$target:::six-probe
+{
+	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
+	       arg0, arg1, arg2, arg3, arg4, arg5);
+}
+
+test-prov\$target:::seven-probe
+{
+	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
+	       arg0, arg1, arg2, arg3, arg4, arg5, arg6);
+}
+
+test-prov\$target:::eight-probe
+{
+	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
+	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
+}
+
+test-prov\$target:::nine-probe
+{
+	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
+	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
+}
+
+test-prov\$target:::eleven-probe,
+test-prov\$target:::twelve-probe
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

