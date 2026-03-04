Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5443346FA8
	for <dtrace@lists.linux.dev>; Wed,  4 Mar 2026 08:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611300; cv=none; b=Nc5zZcBIBwSHCHQ2H5JXx2LmavA1A6juseMQJsnPjT+fNufHgdFID5nD2f9Qox3r+HNJI1hlvzDO1Z/98PZezJYWU+EQIoeYVWihS66OIvGUohZ98Le125lE6rH9HVt3/TwRbqdNmrftblSl+sPO9HR2XQJQhIFVp6nU8vCOJ08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611300; c=relaxed/simple;
	bh=MLJcfcru+yUOwe7kslKHfOcwRygWuIqn3kvxcyhvrr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kp3cWk3JgTl0nhk1uyv2YQx+zeN0YjRYUHAUM4AVCSo/XgRAmCqWQ2xO8uxmeiXP8PZBGsx404jhGaMbzlSG1xEOfZJLXs6R31LyCMqp+wILV+Jt/yRTxAExkIci6mVb5DAdQJARZApTWKBGu/ZueKK6FYgKR7rrHp0DoI9CNr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rEI5qqq3; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rEI5qqq3"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6247aVjb3540186
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=+EGCF
	K9KVAi9fpy7qyugGZC/rqC2CfzCiN3iLffFdqk=; b=rEI5qqq3M9UKSJT3UvhVT
	RBI+zbclST/w1+YbA7VWrDxrHM9DWEHRKNemJLaodAPzkRCx2FYWXyFO5a4oVpVV
	NfJx1LjqLwLkWwZVFcK8VYHqXwV+R3OkfKEwOHhjjUHBMTNJiZkjaXakzNFXSH+6
	/v7EEe+pL8Ta2XFFkf8nwfc2/5gforOteaBKOuFB8ds1qhFOToYfQG/ynEhGBO4G
	nGViea5iK9+KoQb44GQ35VayKDeHr7hCc6MSJdeBKhYaFe5oBCeX0/bxxbFp98Bl
	8bBIdwjBVdejR1zvKgTDMmAaMr2/W21Mti9PuU/iM6XaI2NpC8vbgfoQigZFvMLJ
	A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cpgge81bh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 08:01:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6246mRb6012659
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:01:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ckptfs32e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 08:01:35 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62481RYv023337
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:01:34 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-62-133.vpn.oracle.com [10.154.62.133])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4ckptfs2t1-9;
	Wed, 04 Mar 2026 08:01:34 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v5 8/9] stapsdt: add systemwide test for is-enabled probes
Date: Wed,  4 Mar 2026 08:01:24 +0000
Message-ID: <20260304080125.649031-9-alan.maguire@oracle.com>
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
X-Proofpoint-GUID: Fc8IW5EbtORkeSk7Lir3AICaCrICtQX0
X-Authority-Analysis: v=2.4 cv=YLSSCBGx c=1 sm=1 tr=0 ts=69a7e6e0 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=BqU2WV_vvsyTyxaotp0D:22 a=yPCof4ZbAAAA:8 a=_3dpwaqSn8EPyJj7YXgA:9 cc=ntf
 awl=host:13812
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2MyBTYWx0ZWRfXxVkEpVM+/1NV
 8ftrEKvjeRgkSHBwYPZVx8yoQB+bXlM7xuN0zawQepYB23zyeS13N86YQHh7KBpCg6YxxD4WS7R
 Be9/W99w0Ecsl6KsA3XRT7qjyg1qq15Z5trBcBjPUNBjiIn1Hy8kTDsHzAM4YGpq4MHE6/ANAhv
 4Nu5zi0XfHqTJTcknay+UI3LVgMNTwOTlxb++J0/8CS7Cw60aZIyqiirGDiye5NF5y9/6rT+Y68
 hZV+XOTc31IEZIsKmG0CfMO5mkMvJcAppf0SXkcTXMLKDuR7XVaRmqLLNGKCE1YMIoAg+a+ZHOY
 RnywB4p6a6tGAxeZ0tVOhEh0sV9opV5dXnEovAnOS/zlZFI8kEV2bA9x/wGkfxTv5aSTa4AmbKa
 D4FOOb2FWvJhAaSjqCINwC+q7Q5T5glhzucHFK9r2U3I1Cmmxw8zCFv3CLD+0gY308EYk5Jnd1E
 r+BiWtzXYbRMqWS1wuVrfQ/PUCjweSg+aX5gt5Y4=
X-Proofpoint-ORIG-GUID: Fc8IW5EbtORkeSk7Lir3AICaCrICtQX0

Add is-enabled probes to library and ensure they fire with expected
arguments when enabled.

Same approach is taken as is used for system-wide libs, but
semaphores must be placed in .probes section to ensure they
work correctly for both existing and new processes (the
semaphore counts are managed by the kernel).

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 .../tst.stapsdt-notes-systemwide-isenabled.r  |  13 +
 .../tst.stapsdt-notes-systemwide-isenabled.sh | 266 ++++++++++++++++++
 2 files changed, 279 insertions(+)
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
index 00000000..80c7c83c
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-systemwide-isenabled.sh
@@ -0,0 +1,266 @@
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
+#define SEC(name) __attribute__((section(name), used))
+
+#define SEMA_DEFINE(name)					\
+	__extension__ unsigned short test_prov_##name##_semaphore \
+	__attribute__((unused)) SEC(".probes")
+
+#define SEMA_ENABLED(name)					\
+	__builtin_expect (test_prov_##name##_semaphore, 0)
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
+	system("./test &");
+	afters++;
+}
+
+test_prov*:libstapsdttest.so::zero,
+test_prov*:libstapsdttest.so::one,
+test_prov*:libstapsdttest.so::two,
+test_prov*:libstapsdttest.so::three,
+test_prov*:libstapsdttest.so::four,
+test_prov*:libstapsdttest.so::five,
+test_prov*:libstapsdttest.so::six,
+test_prov*:libstapsdttest.so::seven,
+test_prov*:libstapsdttest.so::eight,
+test_prov*:libstapsdttest.so::nine,
+test_prov*:libstapsdttest.so::eleven,
+test_prov*:libstapsdttest.so::twelve
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
+/ fired[probename] == 4 /
+{
+	printf("%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probename,
+	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
+	fired[probename]++;
+	donecount++;
+}
+
+test_prov*:libstapsdttest.so::eleven,
+test_prov*:libstapsdttest.so::twelve
+/ fired[probename] == 4 /
+{
+	printf("%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probename,
+	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
+	fired[probename]++;
+	donecount++;
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

