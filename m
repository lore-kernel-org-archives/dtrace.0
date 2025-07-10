Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964F421C165
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 21:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752184781; cv=none; b=YUd/rhP8jb8s+aauBfnmxv0FoZuo1TxtUe/NEubZMWE1eJvsYUcrEyR08rsaU2BhQzbnPR3RqNUaDdJj26U8jrF/kP9F1onWPkVrjor9/CQqi3Zno2mv9ZkKqQZcxIE9wdIn+WVnai92VupRnDPUi/UMQ3q3hnTU4ifYZVRbB1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752184781; c=relaxed/simple;
	bh=hhKT0boX3vGPy3z/s4ZTbWqGDvWTRoeeQl8OeXLSu+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JCxIsULbeQbcdLUFMSEE/zp8Cfk+HMqn/3vTPtLRvz0f81MsaKw3g82nI0r4i7/rDQf4aMLL21AGBW02M5mXGa9Iybeb9gu7G/l7M3mzwCXPSqOoB7apQlo0wVihmkaqooXU/qkJ6PuHHePScm9kumYjC8gToQ04HhiY0FdCpYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ahkWypTq; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ahkWypTq"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ALZ2J1028467
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 21:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=/NrsT
	eE2btwzVrjbVtcuseTxfrquXoXldP3S4Hs9VmQ=; b=ahkWypTqEUoiGLDsSoxm8
	n2t4MpvYBYRR2vfjtaHlc70IIjxxdjvLjLYrCdBUqG/aS1bUk6QxxZmxJcsUEfr7
	YMRaOFz5IJVjgN2CsWoK1PQO50IISjNtBJKmBflBwxJ6W+DO0XedKFK4X3DlS/Bd
	TPl1dQQ1rHi7Cp/I5uR9LOJTtsGPtG1JwQMHI/YLd9zH9TN8bw33IdFpQu4mYWeZ
	J/l7OJIk3bsFA+HPJgw3QmAMn0XdsXrCvVIKB5Bxgxi5l/Cx+jNhTmwVkw+C/Uvk
	c62fj+AASmem/eVFIb4cvFbV5iMZ6iFTpOMx8f++oiMxafXRRVKVShuzCazn2xfU
	g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47tkan89wc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 21:59:38 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56AJmisF013536
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 21:59:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ptgdmdak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 21:59:37 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56ALxVoQ035912
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 21:59:36 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-49-108.vpn.oracle.com [10.154.49.108])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 47ptgdmd7y-6;
	Thu, 10 Jul 2025 21:59:36 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v5 5/6] selftests/usdt: add test covering different forms of stapsdt note args
Date: Thu, 10 Jul 2025 22:59:29 +0100
Message-ID: <20250710215930.82067-6-alan.maguire@oracle.com>
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
X-Proofpoint-GUID: CjHySnB77l7n7tmtRG30J8HH2Zk43YNK
X-Authority-Analysis: v=2.4 cv=boJMBFai c=1 sm=1 tr=0 ts=687037ca b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=JEC0fJkXhVgF0k8_IpoA:9 cc=ntf awl=host:13600
X-Proofpoint-ORIG-GUID: CjHySnB77l7n7tmtRG30J8HH2Zk43YNK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDE4NSBTYWx0ZWRfXzNLFG4WanoLG l8SqHdPAC87YFpqqUFPgzP+mZZdX8mL+Xe0w0gaQDgW0mykHmEamKXFtV410wBcaxTpOoqtkswQ nzoFt9LfnVoEg2IhzcD617hNMeusycfyGWSMMvCDF0vJVBDJk8JhGL8ly64yRNBAAtT9Okgk1FU
 KVC3oLqw7K1jbJvnegLjblzGXg6xdaRQ9ALbmYqDoF6YAeER9SKGBfc8Sg5ksVsNPNRSun6cQSI CG1JaBNlAtpzWRETNlxTjaL31SyDMnFI2gG4VtmBrvRNMODdn3WMQEhabeMZwS6JjuXooqwifv/ uuQmyPS7oS1ioqdSJcH/Laj04YDP24exBcpQFR44HaOQ3hEe5/T3acTg0ZN1wuEOdzEIUkopwM4
 5jClAnJfWF2Ga/U43XKNGDQx26QVFn7bvLcSYwt5WS5liKWO5pS3P9xQqxYnfHJvbml9aqqy

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

