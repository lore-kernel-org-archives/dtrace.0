Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC4F29008F
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 21:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752184781; cv=none; b=UyXNkg080Kop2d0/rgm5VKWQQHQJ4u1Hzirt3lo668S5Dp5ehGTcgZKW7fyf18JL6KJW2x7BreEUymb5YwnYidn+i01IugEfR73HLRIsmr8fmxpT8R3847Z3P80GboUmUHxLpoO352MW1ajHRu2xlS9XJl9xUHYNJW37L48eNpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752184781; c=relaxed/simple;
	bh=hAr/9jC8Gl9z9BamwbKFnsRexJCnhngRreGCwcqdi+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qqCoqM3P9SWV5pcy9RuqxSKgXpM2wpnI+hXu0JEhjUONidI+ucHAhmzc88ATB+FdsmSl/6r3+0J4Z+IxfuNsCMglDRe7nlycNF2TZIRSj/Mzh8743RAXivybD70al/29bp4mRhto6zL0iD/UcJgFueoOPl5W1IybO0UxYNgRHK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qC7HAlRH; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qC7HAlRH"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ALqLuD000476
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 21:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=Q/zWD
	KixCWAi77nNEOZfefa3tO03BUyaqofism29KAk=; b=qC7HAlRHV5VRzlke8MLh/
	kmietidYy09r4Gp7s9I2YjLYxVoCVlHDca1enZOTUxSqgMJhS3Gz07c+quObafZ1
	F8RjHVwCRi21V5L81e33ddLfQKhttD+dSusUgPSGImZd1dK+zS3YV7K6JY3Fjmc3
	czG3/jKKoRf/hZiNuEMuImapVQeqqvisWvsC6lzGbIhnnQNpw7pxTkb5i2sPufb/
	6CJDdGTKN5F1m5KI0ryCLYYAHeipZviSAL/SL45kDzENoO3JWghFv/GYoT3sILxs
	xoylNy8BnsA0dKaqB8N6SSaIf9NfYd+/+F2ibon7DJqNgWhQGPf+s4gKyw5zKIay
	g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47tntc809s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 21:59:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56AK0YFI013546
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 21:59:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ptgdmdb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 21:59:38 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56ALxVoT035912
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 21:59:37 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-49-108.vpn.oracle.com [10.154.49.108])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 47ptgdmd7y-7;
	Thu, 10 Jul 2025 21:59:37 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v5 6/6] selftests/usdt: add test for stapsdt note-defined probe firing in -fPIE binary
Date: Thu, 10 Jul 2025 22:59:30 +0100
Message-ID: <20250710215930.82067-7-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250710215930.82067-1-alan.maguire@oracle.com>
References: <20250710215930.82067-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507100185
X-Proofpoint-GUID: ElEU66W1JnzGKQKPW5e7cv11ROD0ZEZu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDE4NSBTYWx0ZWRfXyiLOaZCliIJc m48LIXf+GveUGe/ZOi+WLKjRtV5U16EWrIxB1iNWtOY6LYTWCt8VxClE/d9BZbQ5yqb5/R+sLL9 45HTLBUF3rKevxA3SSvP4teTxXTLmwbATDIR/hQp0D3EqJIQfMzkE794LeOtJuia4Hwv7qLZj09
 s02inXbjDp6rYjgDbr3n8Pb4YeESiYivYatUIkfNcDtYdz2CDoVWv6hRn0koGA3p6lAad1Hahi3 I/ERKkTwNDm4BKaszRbE1NGrNZjmVEIn+45TOCx1TMhu3++P440zpZK/YIDkjED1wJOxANMgfYA ZzbUUSvpdaDgOITSKsIO7zhPYXM00qagNVuwi17W36nUscfhGaXMle2wQhX8yxEFQNqauWvylgj
 KxkbxTVtcPDPMiGosj6tyeRgtaNUyGJoKiO0bdeoCMT7lZ6Al8NVPrdGnrdDTvDUthoqTaHV
X-Authority-Analysis: v=2.4 cv=HsF2G1TS c=1 sm=1 tr=0 ts=687037cb b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=eXpHH4PNQhkuFDgJz9sA:9 cc=ntf awl=host:13600
X-Proofpoint-ORIG-GUID: ElEU66W1JnzGKQKPW5e7cv11ROD0ZEZu

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

