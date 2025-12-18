Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1477E2836B1
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 17:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766078647; cv=none; b=pJEmLWd1/TTUgd49aaG+j65hD7nam95wNMRjy7g/R14NBRPR3PIClDH8MuSqHXpu8+JZBOjDgUrAPrDR9wbhTyOPCwP2ZCe5Z7UxCKpe8HedQnGtl0zWOIyKk30jOfj7itbELrBMm6eDrR/PY04hTJ5G/DFBYx6z4nyPRWr1yak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766078647; c=relaxed/simple;
	bh=wFwjqxLrMXNiE0mclM5ifJiahELszpe90bydtIduHJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sJPqAbOjxUT5pCEOlPEDwp0291uMf2Zahn0NoFpIbbAmm99Q17nKjT8RgUa7i01Tb8pw9yBLm2iw7G3X6Yfrjt9jiWgHGyAaKf3G+T1tup+Z8dJwQmvP0/DF7df6b4JtW9igMuwQzi3lin5o8T5CG/OL2y3Sx1+x08BHyMBCcYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MkVT8Iuz; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MkVT8Iuz"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIDCFpQ973103
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 17:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=RpNwb
	+8bxvMcjYBNrH84IGJ+EtrMDqQLHSlWt63zSi8=; b=MkVT8Iuz4y0yRZ4gj+Skk
	SWkT05DMgU1WAxZz84NOIDNH9iIZS9UT/fGlvbHdX4EL90nAMx6kWVIe5X8YdEpc
	HB18oAJWIC7ldz/7fSqM0I0Ap3jUA334AfvsCjlX1BhIL/cPodxQ/oieNgmWSWOl
	JjQPMU9Ij42bILLgLu05/KzK8JEwbxZHtxdnJKq2lmHfbEECy4k7M9DZ9SXPccsJ
	SZ8D9QZDmI2Y/JPYYRSZpaxXLetm8a2J+eNBc2NcPr6lSOV0m6B1nibECDMzXU5T
	volS3crBOGsBnnERqokICC03AK2GNHy0rF00fqVS42oZQasTx8X17m8vDinB9eFI
	g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b47ay949w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 17:23:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIGpKap016709
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 17:23:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4b0xkpq700-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 17:23:58 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BIHNtSB002775
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 17:23:58 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-104-22.vpn.oracle.com [10.154.104.22])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4b0xkpq6v9-4;
	Thu, 18 Dec 2025 17:23:57 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [RFC patch 3/4] test: add systemwide stapsdt note test for library
Date: Thu, 18 Dec 2025 17:23:53 +0000
Message-ID: <20251218172354.3206787-4-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251218172354.3206787-1-alan.maguire@oracle.com>
References: <20251218172354.3206787-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 mlxscore=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512180143
X-Authority-Analysis: v=2.4 cv=foDRpV4f c=1 sm=1 tr=0 ts=694438af b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=H-sOoKR7IU3-zD7f7cAA:9 cc=ntf awl=host:12110
X-Proofpoint-GUID: YuQ7OlGGL70yaQjODtbuqafUGqPbFcey
X-Proofpoint-ORIG-GUID: YuQ7OlGGL70yaQjODtbuqafUGqPbFcey
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE0MyBTYWx0ZWRfXx8P/6KI+RfyK
 FfMyiGm3a9t3e81fTn9z/PqCNfaFxSXIOEkgovmW34K6QsGUIluUKOXshGsdooszQTwDma1gwrd
 KkSmFI5T1+1JFrE8D4FWhQOnrkhHpz0g+d4TNy4YMXsjZuGdWbMMR2RwD7TnER/4r/iZ8sBCjne
 cF+Hiz/vM2rSBU0JB/luFApFtMsI374TOrTAhVKdj26cY9QrhnHczphaMSJX6YyziEvEHMFZOIf
 2dJQJM7WiB7uEpvbTYrA6FKzfZkeQw6aip5LfaJEF8vuC0b2wPfgZBJk2ucyHi8DX+LkZQjf9y+
 rd/+gwY2tRBXgJ6hHRUeiR8myuZDa+NJrsxUPzr4Ow2QprpjMLLAPl5Fk2X1Rl/EkDM/PBjwNor
 kB7MxtF/4KBfkD13I3fr1hMGbfDsczA445sT036+IgZQmj4B+g8=

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
index 00000000..5264bc52
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-systemwide-lib.sh
@@ -0,0 +1,142 @@
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

