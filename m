Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7088D238C26
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 10:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750673603; cv=none; b=STzg+FJ6f5d+BRq1Vd2QF6SnBMmCD73z8ZIEmnX6eMgAzS+y1zkMBIDjOQ2hN+BGy/hPhvv4L30Mj2LDXdACkQkpfMELIFDFVF5/wN6ueJXBoPNsIzJwX0S+PPq/jDNMMPzY8XHA1cOytA6BPH+oGbctVoGqsLwJDiWqY+dPrQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750673603; c=relaxed/simple;
	bh=fxJLlcsDtPDiPJi8V6MfNarowDGAOdBe4lSd6RoR4jU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ng2BM4YhHQruv0XfuQP+OHQyRNGfHOrahxd6t9s8LhVaztrOey010I9NAPezhEwxSniLRMuMb6Wj6qn3WuxL1SOEoYHQi0dby2asag8kGz82m1bLW1v3MEtnGt1+ys240SeAcAuCYR9f0uV/hkmWVDznouy6+l29QkAD441eOuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Sigq1EXx; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Sigq1EXx"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N8pMPI000769
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 10:13:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=lOhUg
	AeSrIMxCWMoDcy6CFI3E2oYiSXlDfNU31+yiAQ=; b=Sigq1EXxWNuthvQ2fo7FS
	anDhi3OiBF1LBj1O2cwRaWf/UoHR8FcXJex0XodQRp2riIwjyGb97vyH6x22F4VM
	bLKfw1CZCuikP9ql63tCPymgXONW72MUqyzfJZ/+iOdMoEMaetnFQXGZCcHj1cWb
	jz1fl/+d9a3waOLlT/IkRcTBmMEI6/luHx/qsUn2CmLKn9pVZUlBdXwJGdNzQap7
	fcLVkLpcI5sDU+zaTrHr8e7L6vtSNWnyi3ITEx2TPvuNWEfugyHxYoiag5MU0V+B
	B3omOPP/ekVJKJ6+3ITjCasdq4SeKYk/recI3/f0QyPAinQyP044XXRcsp9e4of9
	Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt79951-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 10:13:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9SaxC005652
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 10:13:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq25eed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 10:13:18 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55NADCnu007270
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 10:13:18 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-58-219.vpn.oracle.com [10.154.58.219])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47ehq25ebq-5;
	Mon, 23 Jun 2025 10:13:18 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v4 4/5] selftests/usdt: add test for stapsdt notes in shared library
Date: Mon, 23 Jun 2025 11:13:09 +0100
Message-ID: <20250623101310.1649756-5-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250623101310.1649756-1-alan.maguire@oracle.com>
References: <20250623101310.1649756-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506230060
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2MCBTYWx0ZWRfX8Yxc4nY2njO8 T28zF07BQ7ezZHi5xxXMfB/u2+r/MG5okzJ8IRzuFmHR/M3Of1PL7jxJTFDnqCCsJRPNG/Opi7k xIGHRJKBBxAfEEwv/m/+jqo9Ls3eooRtb4uH4AyUMy18t505AmWF9fAv/s9SLxDUsmLCoVxJeHG
 4gYhME3UzXD2US3AwSANkKDTersJRVGzhIG/lPq7F0Y8CNImgdj+0ZBLx5yMtFT9eSh+LNRK4nF u23yomH9ZkAKrB7eZKuUPBM8MPbxIPwZUBBLCzGXa3JfiRkqLFr2M57CcHAfDw7H83OvGuzQda1 3E+/bv8gO8k6xi+3sd/CRiWVY4Tj96xV0IZJbLMsBHiVLdcUxM7atmfDMa9SN4o5nrS7muQmKqc
 G0jYcO6WErNjGo5CTzotco7AYm/68qiV/p3eDWPX3zgM5SbF+HEoOS9KmlgnKG9E0LV7u8hl
X-Proofpoint-GUID: ZrFI98Yee4zp2DmlpyVtwunEjZCcNEET
X-Authority-Analysis: v=2.4 cv=QNpoRhLL c=1 sm=1 tr=0 ts=685928c0 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=H-sOoKR7IU3-zD7f7cAA:9
X-Proofpoint-ORIG-GUID: ZrFI98Yee4zp2DmlpyVtwunEjZCcNEET

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
index 00000000..c85121c4
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-lib.r
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
diff --git a/test/unittest/usdt/tst.stapsdt-notes-lib.sh b/test/unittest/usdt/tst.stapsdt-notes-lib.sh
new file mode 100755
index 00000000..bb4ed1cc
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
+	printf("%s:%s\n", probemod, probename);
+}
+
+test_prov\$target:::one
+{
+	printf("%s:%s:%li\n", probemod, probename, arg0);
+}
+
+test_prov\$target:::two
+{
+	printf("%s:%s:%li:%li\n", probemod, probename, arg0, arg1);
+}
+
+test_prov\$target:::three
+{
+	printf("%s:%s:%li:%li:%li\n", probemod, probename, arg0, arg1,
+	       arg2);
+}
+
+test_prov\$target:::four
+{
+	printf("%s:%s:%li:%li:%li:%li\n", probemod, probename, arg0, arg1,
+	       arg2, arg3);
+}
+
+test_prov\$target:::five
+{
+	printf("%s:%s:%li:%li:%li:%li:%li\n", probemod, probename,
+	       arg0, arg1, arg2, arg3, arg4);
+}
+
+test_prov\$target:::six
+{
+	printf("%s:%s:%li:%li:%li:%li:%li:%li\n", probemod, probename,
+	       arg0, arg1, arg2, arg3, arg4, arg5);
+}
+
+test_prov\$target:::seven
+{
+	printf("%s:%s:%li:%li:%li:%li:%li:%li:%li\n", probemod, probename,
+	       arg0, arg1, arg2, arg3, arg4, arg5, arg6);
+}
+
+test_prov\$target:::eight
+{
+	printf("%s:%s:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probename,
+	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
+}
+
+test_prov\$target:::nine
+{
+	printf("%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probename,
+	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
+}
+
+test_prov\$target:::ten,
+test_prov\$target:::eleven,
+test_prov\$target:::twelve
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

