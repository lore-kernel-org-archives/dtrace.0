Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54017273D6F
	for <dtrace@lists.linux.dev>; Mon, 28 Jul 2025 16:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753720592; cv=none; b=mR7LwmZ5+y1DX8iltWn3+2zVumubqf+EylmrQorFk34w4siiacHooXE1uMKSREBkeeoMNAbdpW7Au7HeqDkpnwK4jGHg0lDy/g5pV/b5esglSfmqFcM8hKUglmVsAZ+ZjVc1vU6KebnjgjSBvqUEbGCm6iIoEGX4pA/VYTrRID8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753720592; c=relaxed/simple;
	bh=fph+1lxTS2FJdCUsZaM7t9W8DalQtL89mlkNLzeR3ZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZSIwTezt29Ibxbk+QextW2W54ZJVcf0j7Jey9eJ6LPIV6qoJIWF+5R/R+2BBCdrG47ocyhKFbBMAE48yPDNRMtbXInr11h5dYLZ7gMaBhYygkmqcW3pQdXlamFCaO8KsvtzypJ7zWZFUviFSALSDKJsFPQO5PaVUA+MeY7MI0Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Jc6rsTPt; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Jc6rsTPt"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SFfkJC022774
	for <dtrace@lists.linux.dev>; Mon, 28 Jul 2025 16:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=9xOBh
	8i1kOdaW3nZArzklBsdpDDIhD+cir4Q+UbItl8=; b=Jc6rsTPtdaueAWPCTGGDW
	igyCsmLBPniZGTS+PGWIE37ffwit9dw1QYIoB1iZr+j7UU5giVP58rsEMh8TvfXJ
	WLiMRTjP/5z2ZHe0kQ7Z6XQgIElnbuEE58RQpvTPWj0K2c+RYPXLwy4X0TOhxrEa
	FfOs3EdM13g0wVuOxzgjwVyz5IFzsmFWxAfzxg4/oz4PRlu1EdleRZBnLQqAN+6W
	DiLT7V5d5nh4B4my76xtohG6i2x8ZCyFvWJGCncFPKFwsGYr6AE42r719gJNC5iv
	QLrjYzJyoEISFRAqMyjPZeXGvqEyU6UcIhJqtZCynA1TJF1PjNChg6v3Kr7nwgi4
	w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q2dwv9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Jul 2025 16:36:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56SFmb7p038532
	for <dtrace@lists.linux.dev>; Mon, 28 Jul 2025 16:36:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 484nf8kf3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Jul 2025 16:36:28 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56SGaEhB007818
	for <dtrace@lists.linux.dev>; Mon, 28 Jul 2025 16:36:27 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-50-230.vpn.oracle.com [10.154.50.230])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 484nf8kesj-8;
	Mon, 28 Jul 2025 16:36:27 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v6 7/7] selftests/usdt: add is-enabled stapsdt tests using semaphores
Date: Mon, 28 Jul 2025 17:36:11 +0100
Message-ID: <20250728163611.1570773-8-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250728163611.1570773-1-alan.maguire@oracle.com>
References: <20250728163611.1570773-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507280122
X-Proofpoint-GUID: 6W1NcQ7NGe6rMk9kVYA9zCjQJYcJfYM2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDEyMiBTYWx0ZWRfX2dF3uO14+zsC
 BAZrMW8ihlibpfVSshC/JsPzaJqbJ5bwJtOKq2UlnGoJSR9U+W7Jlzt3p1stNbU7eFBZdOphdXK
 H+oB/7nguxIGpk933affq2vq1oRTB35LJKwsKkLDNrSMGbGW/MGKOCywDvOYAGYaPnr9IMXvztj
 xuaxhVQjb6uyUcRw11OLEabrtVMkwQfjQ/xwxtO0Kwvsk0bsAtwmmOdBYvRnUK3pn4u0ZHcDAnq
 Deq870omDE6M7TFpj98kkh6jA2cL7bPgd43A0hEPPdrkag6kqicNrJ81ee7EBeGvy2q7/Bf7J8O
 cX3qzFZFIQDoY6sxe23DT54RGIz9G8zSpQ+q6Sd7fEv/KZAGy2+eGsdxJlBLq7xHK9dcxqHeEea
 SrXSaoG9eB8RqIscLPvE6146N5OpFG1TebX26YRYMjj9a3sznpmmWOk3MURDzqcLRTQN81fZ
X-Proofpoint-ORIG-GUID: 6W1NcQ7NGe6rMk9kVYA9zCjQJYcJfYM2
X-Authority-Analysis: v=2.4 cv=A+5sP7WG c=1 sm=1 tr=0 ts=6887a70d cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=QSkC1J0LPL5t1_viwQ8A:9

Is-eanbled probes are implemented using semaphores where the
semaphore address is specified in the ELF notes and passed
in at probe creation time to have the kernel reference-count
probes; this allows us to have argument assembly code that
only gets executed when the stapsdt probe is in use.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 .../usdt/tst.stapsdt-notes-isenabled.r        |  14 ++
 .../usdt/tst.stapsdt-notes-isenabled.sh       | 151 ++++++++++++++++++
 2 files changed, 165 insertions(+)
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-isenabled.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-isenabled.sh

diff --git a/test/unittest/usdt/tst.stapsdt-notes-isenabled.r b/test/unittest/usdt/tst.stapsdt-notes-isenabled.r
new file mode 100644
index 00000000..db6d18cb
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-isenabled.r
@@ -0,0 +1,14 @@
+test:main:zero
+test:main:one:1
+test:main:two:2:3
+test:main:three:4:5:7
+test:main:four:7:8:9:10
+test:main:five:11:12:13:14:15
+test:main:six:16:17:18:19:20:21
+test:main:seven:22:23:24:25:26:27:28
+test:main:eight:29:30:31:32:33:34:35:36
+test:main:nine:37:38:39:40:41:42:43:44:45
+test:main:ten:46:47:48:49:50:51:52:53:54:55
+test:main:eleven:56:57:58:59:60:61:62:63:64:65
+test:main:twelve:67:68:69:70:71:72:73:74:75:76
+
diff --git a/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh b/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
new file mode 100755
index 00000000..99fcc844
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
@@ -0,0 +1,151 @@
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
+#define _SDT_HAS_SEMAPHORES 1
+#include <sdt_notes.h>
+
+#define SEC(name) __attribute__((section(name), used))
+
+unsigned short test_prov_zero_semaphore SEC(".probes");
+unsigned short test_prov_one_semaphore SEC(".probes");
+unsigned short test_prov_two_semaphore SEC(".probes");
+unsigned short test_prov_three_semaphore SEC(".probes");
+unsigned short test_prov_four_semaphore SEC(".probes");
+unsigned short test_prov_five_semaphore SEC(".probes");
+unsigned short test_prov_six_semaphore SEC(".probes");
+unsigned short test_prov_seven_semaphore SEC(".probes");
+unsigned short test_prov_eight_semaphore SEC(".probes");
+unsigned short test_prov_nine_semaphore SEC(".probes");
+unsigned short test_prov_ten_semaphore SEC(".probes");
+unsigned short test_prov_eleven_semaphore SEC(".probes");
+unsigned short test_prov_twelve_semaphore SEC(".probes");
+
+int
+main(int argc, char **argv)
+{
+	if (test_prov_zero_semaphore)
+		STAP_PROBE(test_prov, zero);
+	if (test_prov_one_semaphore)
+		STAP_PROBE1(test_prov, one, argc);
+	if (test_prov_two_semaphore)
+		STAP_PROBE2(test_prov, two, 2, 3);
+	if (test_prov_three_semaphore)
+		STAP_PROBE3(test_prov, three, 4, 5, 7);
+	if (test_prov_four_semaphore)
+		STAP_PROBE4(test_prov, four, 7, 8, 9, 10);
+	if (test_prov_five_semaphore)
+		STAP_PROBE5(test_prov, five, 11, 12, 13, 14, 15);
+	if (test_prov_six_semaphore)
+		STAP_PROBE6(test_prov, six, 16, 17, 18, 19, 20, 21);
+	if (test_prov_seven_semaphore)
+		STAP_PROBE7(test_prov, seven, 22, 23, 24, 25, 26, 27, 28);
+	if (test_prov_eight_semaphore)
+		STAP_PROBE8(test_prov, eight, 29, 30, 31, 32, 33, 34, 35, 36);
+	if (test_prov_nine_semaphore)
+		STAP_PROBE9(test_prov, nine, 37, 38, 39, 40, 41, 42, 43, 44, 45);
+	if (test_prov_ten_semaphore)
+		STAP_PROBE10(test_prov, ten, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55);
+	if (test_prov_eleven_semaphore)
+		STAP_PROBE11(test_prov, eleven, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66);
+	if (test_prov_twelve_semaphore)
+		STAP_PROBE12(test_prov, twelve, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78);
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
2.39.3

