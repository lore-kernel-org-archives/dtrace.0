Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23807E9
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738162532; cv=none; b=BA/0JOhZYqROXxKdW+AZkzvmx4UqElORd67A2KXXzLv/gZj3eR7NFWDTIQw8in6042gX7HCTPF9HEHLRpOsfDFPXzOMHOivLfS37TF3IYkdrMHNftSw/nHAsVGd6KnSLZyOq9Y9PohleQqZ5DtVAJlYW2f9ikHITglTITTfLEL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738162532; c=relaxed/simple;
	bh=w3QhamZdilEKSjnrb2Ej0igc11MV4eSIpInsT8nCwDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XqNhhoP/zAsCbojESVEvVNe+Tz7ksRkg232YtT/es0IjC0PgdTMCMN8caR9jlmjcc8y6IDc5bMS8oUlTmGAzNHhaSbX6/k/LL9cRQaFbP7qAEMZ+ov+eaFB6IkXA65BZsAfqS+hpAAyQAV7pPXjKaJwv2I80hxxQCrMkt8zXC1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JBWA62CP; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JBWA62CP"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TEY0nZ031380
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=cgnC8
	2zj/aBJVMBGHNumEhjDxZvbkyk6kJl91yc80V4=; b=JBWA62CPxMRAxNZRfy67j
	o6Cr8PME/ZtIZ+HFpeVX/TlucCbz6/eOixCshJ6ty12DH2FRck63yw5pDvHabMFH
	rU4dyK/SglsrZMtIC272Nw32/4eXg0UsNgDT0MguGzMRT412KzfKKB4mnJSaJt8e
	BzKKo5xIrCeL3KWy+hxs6BpPqY8mPuubdiPOgoEdTDRo+fU61QGdU22tyPfNQ6dF
	pm6kpRYfnaUBTF8kFV+2Co5fOfVt857cdoQPYiccwHVdOorT2cU/t5/zgMyY1H2g
	c9hxffZNOdmjELoKLuzAfTn6k5puJwHPAmm6KPTH0hK5ruBpcjOd4rxuMnsdO6M+
	A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44fp1a82cr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:55:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50TDCHrV024067
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:55:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpd9upx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:55:28 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50TEtOVD016122
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:55:28 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-177-216.vpn.oracle.com [10.175.177.216])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 44cpd9uptg-5;
	Wed, 29 Jan 2025 14:55:28 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2 4/4] selftests/usdt: add test covering different forms of USDT note args
Date: Wed, 29 Jan 2025 14:55:22 +0000
Message-ID: <20250129145522.512341-5-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250129145522.512341-1-alan.maguire@oracle.com>
References: <20250129145522.512341-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_02,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501290120
X-Proofpoint-GUID: ynOJvYqpNvuRPunyW7ailcNczwHME5kp
X-Proofpoint-ORIG-GUID: ynOJvYqpNvuRPunyW7ailcNczwHME5kp

Add a test exercising various arg types supported by USDT notes;
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
 test/unittest/usdt/tst.usdt-notes-args.r  |  2 +
 test/unittest/usdt/tst.usdt-notes-args.sh | 51 +++++++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 test/unittest/usdt/tst.usdt-notes-args.r
 create mode 100755 test/unittest/usdt/tst.usdt-notes-args.sh

diff --git a/test/unittest/usdt/tst.usdt-notes-args.r b/test/unittest/usdt/tst.usdt-notes-args.r
new file mode 100644
index 00000000..42bca19f
--- /dev/null
+++ b/test/unittest/usdt/tst.usdt-notes-args.r
@@ -0,0 +1,2 @@
+test:main:args:2:./test:val:18
+
diff --git a/test/unittest/usdt/tst.usdt-notes-args.sh b/test/unittest/usdt/tst.usdt-notes-args.sh
new file mode 100755
index 00000000..7c8ea37b
--- /dev/null
+++ b/test/unittest/usdt/tst.usdt-notes-args.sh
@@ -0,0 +1,51 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+# This test covers all USDT probes fired by the DTRACE_PROBEn macros.
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
+#include <sdt_notes.h>
+
+int
+main(int argc, char **argv)
+{
+	DTRACE_PROBE4(test_prov, args, argc, argv[0], argv[1] + 4, 18);
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

