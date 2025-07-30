Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB319442C
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753866128; cv=none; b=up7UO3WmhfR3j7NKWIQq+KYQ4cBVuawAC5eWq7SZxn54+dowenecZ9ANN6Pszfhm8p2wVAEnY0q7/y1z6ZTJ0EQoBNnUk9cHhM6Ud9ySFNbSFsNlOgR3U0tsGE8tLudKldWzQRQjHp+ST+pe+qRsoJtEso/wEVv6lhSFELItW5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753866128; c=relaxed/simple;
	bh=hAr/9jC8Gl9z9BamwbKFnsRexJCnhngRreGCwcqdi+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eDsA7R7tOjVRcGCf22Z1lp2DOyFjEjWkyk2kENqLxh+3S6fqSHLDaOHyTv97oKHYev4n4rr2gJJ0n+oqvPKgfdZYMtJswzetcUXBV8HLxP5BKTZOA9SIwhzqf8k4XlyHuj5NDVvWrG8dcNw4VNwbRuLVcxSFfcEvBvE83c6suCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=i2HDoNvS; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="i2HDoNvS"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U7gieB019920
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=Q/zWD
	KixCWAi77nNEOZfefa3tO03BUyaqofism29KAk=; b=i2HDoNvSQ1tZZ8b7yXdhE
	EAmFl9jahJ5dIoJTztjnlCEoLmXj7pWvK+v53DtRENzJ0ZlWVfPmenLalILYobLD
	jCqm5Tt2uc4++5Ra/sVXKX2ZBy5CJShfLGtI858Rs/oCIxttmm06NDYs6mnTqfq+
	JYXOIa/ZYAdzyox/rmFIWaKfujMXhJsR1Qet5QcxUa9b3ATUJYkU6dxBov9kyEzq
	m7mWko5zVIqCwdrXJfbCl3weQYeuV2qz8B1kNSTNIauAii9xo7h9e81iEWaxD/2n
	BsMYmlNHiGMJL6XMgAmaZkO57YrDZFUwNkPI2A0X35Gcp5N6W1dMMiYnAj6b7Rg3
	A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q4yhdyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:01:59 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56U7QvqI038880
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:01:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 484nfapvhu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:01:58 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56U91nIv033990
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:01:58 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-51-28.vpn.oracle.com [10.154.51.28])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 484nfapvax-7;
	Wed, 30 Jul 2025 09:01:58 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v7 6/7] selftests/usdt: add test for stapsdt note-defined probe firing in -fPIE binary
Date: Wed, 30 Jul 2025 10:01:47 +0100
Message-ID: <20250730090148.2141954-7-alan.maguire@oracle.com>
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
X-Proofpoint-GUID: zQ3Bd0OPKAjARSnG4oxS-b4jI3sqWMuw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA2MyBTYWx0ZWRfX2yYNEHAP4bT2
 z8SDqyiK+HGLOFTsHUAaxFYjBXlkfbAsOyfNgCGdX4KdprKXxjPNwYGh/I5OrILTSY+Rk8a1c8c
 d978a1Exb/dpIdrL7ei5m/lcefXLn3mnJaYcu2HkSnxAf9m0xam3I7Hcrf/7owZijX5Tqb5JjL6
 VnMRR0VBxwgIIXUS5iNh3MM7XZ3ixAeBhZspxpyYE/P2eYL5d4stwAPfVdyBZen33ieWEZoJDVi
 7CfUtMf/svhhA9YP/zc06wbyp/ZylUQAm1MRVE6I3VVuhrqf5mem8v0frb676YQmRMHibyNMb6u
 l3pO8wTV7qa45e90Fy66HR7Uw1qcjS+q8iwN9ZsftDlT34aidCiXL5zCyat6tm50Jkr69rMfGE+
 osyxLUV9pP1E85j3e2SCoiKdq4BElADjD6V0/4K4wQlJ1QrJYFZfPBUTHeVn/OeKo8zANjDy
X-Authority-Analysis: v=2.4 cv=ZMjXmW7b c=1 sm=1 tr=0 ts=6889df87 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=eXpHH4PNQhkuFDgJz9sA:9
X-Proofpoint-ORIG-GUID: zQ3Bd0OPKAjARSnG4oxS-b4jI3sqWMuw

Add test identical to the binary test ensuring that -fPIE is specified
in CFLAGS; this verifies that compilers that use such flags by default
(as is the case for Debian) can instrument stapsdt notes.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 test/unittest/usdt/tst.stapsdt-notes-pie.sh | 121 ++++++++++++++++++++
 1 file changed, 121 insertions(+)
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-pie.sh

diff --git a/test/unittest/usdt/tst.stapsdt-notes-pie.sh b/test/unittest/usdt/tst.stapsdt-notes-pie.sh
new file mode 100755
index 00000000..08ee06da
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-pie.sh
@@ -0,0 +1,121 @@
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
+CFLAGS="-fPIE -I${PWD}/test/unittest/usdt"
+
+DIRNAME="$tmpdir/usdt-notes.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+cat > test.c <<EOF
+#include <sdt_notes.h>
+
+int
+main(int argc, char **argv)
+{
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
2.43.5

