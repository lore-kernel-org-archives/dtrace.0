Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4FD37C0F0
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768832616; cv=none; b=p72k+WJC88bYib87Paq6/UctfSBr59/+mwgHMg1B7/Hnonk7Coj5N8Rc1C+/SP/21z861ftlKQv5WeL9piK6C7+JIfAAZBE+ARtU4jlLNqq9SS1NP7174arjAIyJIOzRch+Z0diecX++eq3GMjdz3XiXvqd3H2Ogy87oPiifvYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768832616; c=relaxed/simple;
	bh=MLJcfcru+yUOwe7kslKHfOcwRygWuIqn3kvxcyhvrr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q3AB8RXI+bTkrt6UDc4axXCQAusX03HvbamYBu4A3qZzcsaOjo+7Y6ix3SikNGzVG00CSDqP8kRneyH/jt0UxWTCl/JMfPNscy/t8PXmNQnjgI4H9M32UIPHOCuHuIyC9cjEgb02lPCw8U64Z5e9q/drVkEPh8XWaJyoBJdMFEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OhIVxRYJ; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OhIVxRYJ"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JBDajY1421047
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=+EGCF
	K9KVAi9fpy7qyugGZC/rqC2CfzCiN3iLffFdqk=; b=OhIVxRYJyetbzHRGtElIm
	N9VFYRy0d97HoXRx+xyVYWqAJk09FMFG0lc5WTJoscYYl4b5RXLdsiovQy4szRyp
	aGOENVTBKuxUuHc68Ejz30laeGuDhkH3UGqdSJ/aOV4wnjNY14/5FCRJwZ1z26/j
	4IV+8ZsD2Z6WAB86yer95eLIFFa2laMdcDknBE8eUionobrbjpFS+k2xK5rz3PBq
	5JBaAx5E6BY8YiEeRGyrC2MKQzRcDQ7li4Mm1bzhlPO5JwMUdLnceQJHJQGml1kd
	WP5o3sJoiiIizJRG+emAr1QcxznR9sge8/BOrTBatbsXiaLfARD21MRyWvVLTwQC
	A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4br0u9jckh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60JD0p69021893
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4br0vc6yvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:33 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60JEIDjs015145
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:32 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-51-213.vpn.oracle.com [10.154.51.213])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4br0vc6ye3-9;
	Mon, 19 Jan 2026 14:23:32 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v4 8/9] stapsdt: add systemwide test for is-enabled probes
Date: Mon, 19 Jan 2026 14:22:59 +0000
Message-ID: <20260119142300.975014-9-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260119142300.975014-1-alan.maguire@oracle.com>
References: <20260119142300.975014-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601190120
X-Authority-Analysis: v=2.4 cv=OJUqHCaB c=1 sm=1 tr=0 ts=696e3e65 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=_3dpwaqSn8EPyJj7YXgA:9 cc=ntf awl=host:12109
X-Proofpoint-GUID: Nh1eM-p4ntgmpN8HT4ktJ-SMkmZbrSyr
X-Proofpoint-ORIG-GUID: Nh1eM-p4ntgmpN8HT4ktJ-SMkmZbrSyr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEyMCBTYWx0ZWRfX/f6RBGHkue8E
 +Qr8LbqHsaY0c893YP3AvdUnrUkdH7s750R7hwORUycgMJPx5uFLHqSCn9r1EhNKEFf70U+yhLL
 E8Glo+kjtdanFV2o5EpswZ05EvyECSasx0833LXtlzfYw6YReYs0vuWCWcljL+zUUiApBTedY5l
 vz62t90U8xDWbIXmqjuEWSOf5dqzzAVUP73YLiCgQLejnm9qb+FqU/DGsvuckB+u6AccAe9H0AF
 mU1e3AvzwnMmuavTpfnu6OO6MDavMeKcZhenhF2Pf2SDpNY8dYGMwJewo1HhJW8nSMXoxTIqiQf
 O+AgtMSqYLbST5uLupP9JKO2fheXsoks5k/HZTLkks5108Q2R9jRXwmnxB0lWemNyBI9CIxGPvM
 XToVWsAygzYYcqcsHxK9HjgDCpB4fhs8hy33ru3If/amn1r/EV6Mbr3jsnyOSf4TDnml7qX07KU
 pnqzneWjvnCXIFIND0rutn36IUWUPd3O2QY37+Rk=

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

