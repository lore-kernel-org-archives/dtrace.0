Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F2634DB48
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323105; cv=none; b=gm6+CqgXSmZQM2gUuffUBgwpr0VYSFh+LAobjczl40zMVRecig6XfEew6DTPSRW2Gt1irkOF5+KRA9beOD3zMF5gRkHog+8W6wZCaohmqHpSgljNc6WMzE2+0+BlB9gSYMfEZ7kiyHc1O/khv85cOr6JRQOCNj7Z8Z619Svic10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323105; c=relaxed/simple;
	bh=TPHCaDRy3s/u8hjnzIQIxEje9PEYfNpeZB0cEdWFAYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fNfB+jrnLqLT5iMX8f7zmGF+clqVWPEeg+UodtIYdMI7n0WlfwLyan98oytAgLLVbLsvrfq8ey5B3d2yJ8o10W6h4wqeuf1UEbCy2KHDy2L1n1TKHjbArxgeTpNy27cLbmRiGv3z7mzi1lvSHRKvnn25V86DF2Ga+thoHBBEIjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BLOywriW; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BLOywriW"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DGDcKE3333478
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=6HyM0
	2zGVZTdEEGSEMnRYLk+tcR9P0GIubVDYZOTFFs=; b=BLOywriWnV9ZaLtyWDbei
	DvIYX+1gYxUGXD03/D3gh4PkoViLbpXKLL5lonnUZegffEIkSAVyI9ZwUSOHHZ8D
	iHUIBY1yQx0BrufNDCR4qjvDqImEhu+j/3prq+F0eh6N4aYbUaF5iN5GWwN8ThPs
	NjebHBib3kIIpM+WWDyw5bz3/t2giWPeRHLXYkTs3i62pNtbHJhHqJQvVZPLHbLa
	z609BMCNmlodWiBO2CZ8xEMZ/8odbHEEwuxbT4iZ9K+M3VmwF6iTdPEBV+97N1YW
	/pZlli5UAyiBO651VPRJY6rTCSciETk3l0weMOjoZjOEbLfsu7cS7ZumiCPOArRD
	w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkrp8ktt8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:42 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60DGChtf001833
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd78xjv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:41 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60DGpYBD031305
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:41 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-50-89.vpn.oracle.com [10.154.50.89])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4bkd78xjpd-6;
	Tue, 13 Jan 2026 16:51:40 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v3 5/9] test: add systemwide stapsdt note test for library
Date: Tue, 13 Jan 2026 16:51:28 +0000
Message-ID: <20260113165132.2454591-6-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260113165132.2454591-1-alan.maguire@oracle.com>
References: <20260113165132.2454591-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601130140
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfXy7OwnIOfRmAa
 6Ayxo4d1s+2GSe4p+63VCME1E4qayRGFBpnPblTuEVStsL3rg27HUe5C57SrYHjN8NaTalt4c1T
 UOt7MCYBEtoOni9xertmifr+86O9B/vd9BKrDmbnkf0gCbWUNiRVFEwoAIY2NcuPUctfWp5hyHG
 x/aYUiXzOSOcdCLFvTm63LNxL170qw4dVZWQYFqU8GGEoZIxPVL5jzb1GvFr+YFaYVbL1D5LehC
 IPuNqNW90i7x6AyT0mP3nRYQKeEVL4mkxBpYayVY1Sp2Yo6sBciaS3K0c+WiUoicqlR/G1ETab6
 C/a3bNpeu2wO/sNu4nIJxggOUP8zDFQr3DDI37xf1eje1oVwyZujk9e2xp0/2P61nPn4a7LajdH
 bW+nQT7l9MT8zI/Pki8yV+DBnzUgdFRO0Lo6iM1jkpKa8UnTBEbKu2KwruWCVsy10X6JRZt4syC
 yI/9IndfuyHzFvJ1ydA==
X-Authority-Analysis: v=2.4 cv=YcGwJgRf c=1 sm=1 tr=0 ts=6966781e cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=H-sOoKR7IU3-zD7f7cAA:9
X-Proofpoint-GUID: 7BCl76mnr5oRxllUYlOHCi07U_Ptrp8p
X-Proofpoint-ORIG-GUID: 7BCl76mnr5oRxllUYlOHCi07U_Ptrp8p

Add test verifying that systemwide stapsdt probe firing
is detected and we retrieve arguments correctly for
a shared library.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 .../usdt/tst.stapsdt-notes-systemwide-lib.r   |  14 ++
 .../usdt/tst.stapsdt-notes-systemwide-lib.sh  | 142 ++++++++++++++++++
 2 files changed, 156 insertions(+)
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
index 00000000..1199cfac
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-systemwide-lib.sh
@@ -0,0 +1,142 @@
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
+test_prov*:libstapsdttest.so::ten,
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

