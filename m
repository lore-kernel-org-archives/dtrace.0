Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E89273D6F
	for <dtrace@lists.linux.dev>; Mon, 28 Jul 2025 16:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753720587; cv=none; b=meI3J4TUQqj1mYG/JmhZv61+ZhGg7LL1OX67ZwmNyklV6Oa1szWaN+BXR03/eFJQAglpCtWOMBqlPkK2DGbliJNA1KfzprkLx+qX0/iYyd1NaSJujmhKQrDU45iGuJQEIQPEbQSM17n8KJbIsbuw9PDkF2iTEGiUQOP56mWoFx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753720587; c=relaxed/simple;
	bh=RVZEecXynemekel9WJLONwlHF8+Zv9J6M0C+5qKcscY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tY/lrLqcMp9Xg6UppcP2c0DsOuQi7nXzUcs4tFDvCJwxr+V79qqEOJBym06yMPLHbMA4q/b2RnifuyZOW2ohPJi+PiOLuut04K4ESyPu+Zzuk625C5lHGKi8anDB3vTfekC2LxgSq7qA94kVQUOL3gZmXWsYSblyVS/ltwXWybo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AsjmNn16; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AsjmNn16"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SFfq7i009372
	for <dtrace@lists.linux.dev>; Mon, 28 Jul 2025 16:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=/f2Z8
	RfYWU4ioCrKVlFMiL3zHxPh5cbZNFx4MRubHN0=; b=AsjmNn16edNjW5rlgB5Yn
	DNt3UB3abL/dTUIqttj0wLVWrR60cNk/jsbDI7YR1J9oneMuhnt8fY3uKarc8st3
	OqGnep1KAw/rrqzDM8E3zV5Y5cdheXM1grNr7WOvQN8bsgcAfhBJ4MdbyQnpfc/t
	/ynsrMProi7OVSWJn684h6B53EwGFYX800HxxyuZta8WkPoTOJbTPuhaRMhsLMcF
	Cop9ogs7m6HVe9jq7qhiqUonUMrjDBB4EMPY55Fp71LsSGEhE245NMPOZp/64BkG
	YY4u3YtuVza2gwHNuEOAGI2oaFXc+jcSuMT/G2kATggRyuD8cBVgXK2Suf/yqiIb
	g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q5wnmkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Jul 2025 16:36:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56SFbMAU038511
	for <dtrace@lists.linux.dev>; Mon, 28 Jul 2025 16:36:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 484nf8kf0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Jul 2025 16:36:22 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56SGaEh2007818
	for <dtrace@lists.linux.dev>; Mon, 28 Jul 2025 16:36:22 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-50-230.vpn.oracle.com [10.154.50.230])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 484nf8kesj-5;
	Mon, 28 Jul 2025 16:36:22 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v6 4/7] selftests/usdt: add test for stapsdt notes in shared library
Date: Mon, 28 Jul 2025 17:36:08 +0100
Message-ID: <20250728163611.1570773-5-alan.maguire@oracle.com>
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
X-Proofpoint-ORIG-GUID: rndFUuKphyUUGRCshCtMMxJ6ZOIjpi3p
X-Authority-Analysis: v=2.4 cv=LdA86ifi c=1 sm=1 tr=0 ts=6887a707 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=H-sOoKR7IU3-zD7f7cAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDEyMiBTYWx0ZWRfX9qiK8UhLfJNc
 H5RXEPErDNMO6u3VGBJJRjR55Kf6xr043LVV0jCTcsNme3t3TRSug2VQJRS2qkBDio1dHMuRVmT
 KC/uipPFH4DhtvDyO2GBD4ZCf0IZ0DnaHVv1mK7CC3P7yqltXcCVgwuMPS6H2cGsoZg8O0dKXMi
 emZWqgAKBffufHiszaM8F203A3JuXLLon/HzrfWdxliKBSH6AXm+++Wvr36t6cmfCgFjmkig2rH
 bC+wGkXzpnQ8rT4X3abGpoQCotUDGG6ffKkcJAdJcS0WGSANFo3nHD9/WEokPIMfRQxd1yDnIAB
 Vqycy8kLY082CHqnHaSDh17msYjgX53dhwWeLd0mC/Oczzth+AKVooJpd7GGoUOHvmoNLCu86r4
 qXIMJbkvljrxxZ+v1wyGQBpEzvFsLNZIcxZi5xj+w45cOwyZ8rhjvETrRcmOcgm0lXCEXp5h
X-Proofpoint-GUID: rndFUuKphyUUGRCshCtMMxJ6ZOIjpi3p

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
2.39.3

