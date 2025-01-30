Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6321E98F3
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 14:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738248203; cv=none; b=IB2mm6zWHV6n0hG7YX/uOQYsyEwxGa13JkZULyCo4TP+oue4x2CCcJgX6V636FD3CzEOitKNE7CcNBRkN1EfK/S7hcDU30ZF5UFt+NO7E8AwVxg/jgSrAMuQOaJMTuqh8Uwl10St9wB7Xy/vpgEyEji88TuktPpldDczwSjwLFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738248203; c=relaxed/simple;
	bh=hhKT0boX3vGPy3z/s4ZTbWqGDvWTRoeeQl8OeXLSu+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R+8A0bYj1iiqWbcUzFcjnMSGFei1Bls2lZdLfNK6HjQ3l5XD3EiV4CBMBNX/FoWFFNgJViGL1OywR9DSbSy5bJ7MyDLANOrKdYkgEeDo6tU3E3cvmRw74l6NdoKD2xRJkorChGwg1ck08iCXLO1kReffM/d6/m0dK/OESxWn6b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TgXBF6cm; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TgXBF6cm"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UEarwf016612
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 14:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=/NrsT
	eE2btwzVrjbVtcuseTxfrquXoXldP3S4Hs9VmQ=; b=TgXBF6cmiGpDdBV9uTJrN
	LwFFcbucytOlSJ+e0gAiODLta+5+/qxenwjN29ai3B+44Sn3MufcLOURRoOo6SuW
	ayP4BeVMcuPRsyWVNVDdPY1P1/ERDS8mJdTtOz4QWHIUJc/LEZw5IbuiB/ZvA8A6
	ftf94GR2HJqwranFOJiRjS4f2NtKRLUfqNb0+4smNKxSlUJ0URhTZpH+spldcAmA
	8QyvrQ0YFEHUaECCfhEcf+JBDg4OZc6SY/LbBGUfsKAEp7raI17MORB1JLUhv73b
	i5XNmVY1CnYIztM/lSGdBf9mznP+VCFm4M9j84kd6lgeIpAsKpDYPn64noqRQXec
	g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44gbbcg0gb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 14:43:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50UEeHMs002813
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 14:43:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpdba4hm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 14:43:13 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50UEh9Dc004912
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 14:43:13 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-172-30.vpn.oracle.com [10.175.172.30])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 44cpdba4dq-5;
	Thu, 30 Jan 2025 14:43:12 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v3 4/4] selftests/usdt: add test covering different forms of stapsdt note args
Date: Thu, 30 Jan 2025 14:43:07 +0000
Message-ID: <20250130144307.1297654-5-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250130144307.1297654-1-alan.maguire@oracle.com>
References: <20250130144307.1297654-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_06,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501300112
X-Proofpoint-GUID: _4Oo8gMiPuRKkiq1MgKFLlAwlY6cmeZ3
X-Proofpoint-ORIG-GUID: _4Oo8gMiPuRKkiq1MgKFLlAwlY6cmeZ3

Add a test exercising various arg types supported by stapsdt notes;
register values, register + offset and constants.  The test generates
a binary with probes represented as follows on x86_64:

Displaying notes found in: .note.stapsdt
  Owner                 Data size       Description
  stapsdt              0x00000048       NT_STAPSDT (SystemTap probe descriptors)
    Provider: test_prov
    Name: args
    Location: 0x0000000000400557, Base: 0x00000000004005f8, Semaphore: 0x0000000000000000
    Arguments: -4@-4(%rbp) 8@%rax 8@%rdx -4@$18

Verify we get expected data for the probe arguments.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 test/unittest/usdt/tst.stapsdt-notes-args.r  |  2 +
 test/unittest/usdt/tst.stapsdt-notes-args.sh | 50 ++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-args.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-args.sh

diff --git a/test/unittest/usdt/tst.stapsdt-notes-args.r b/test/unittest/usdt/tst.stapsdt-notes-args.r
new file mode 100644
index 00000000..42bca19f
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-args.r
@@ -0,0 +1,2 @@
+test:main:args:2:./test:val:18
+
diff --git a/test/unittest/usdt/tst.stapsdt-notes-args.sh b/test/unittest/usdt/tst.stapsdt-notes-args.sh
new file mode 100755
index 00000000..82097808
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-args.sh
@@ -0,0 +1,50 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+# This test covers stapsdt probes fired by the STAP_PROBEn macros,
+# testing various argument forms (constant, register, deref etc).
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
+#include <sdt_notes.h>
+
+int
+main(int argc, char **argv)
+{
+	STAP_PROBE4(test_prov, args, argc, argv[0], argv[1] + 4, 18);
+}
+EOF
+
+${CC} ${CFLAGS} -o test test.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test.c" >& 2
+	exit 1
+fi
+
+$dtrace -c './test arg1val' -qs /dev/stdin <<EOF
+test_prov\$target:::args
+{
+	printf("%s:%s:%s:%li:%s:%s:%li\n", probemod, probefunc, probename,
+	       arg0, copyinstr(arg1), copyinstr(arg2), arg3);
+}
+
+EOF
+status=$?
+
+exit $status
-- 
2.43.5

