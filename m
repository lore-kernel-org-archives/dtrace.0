Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80F9185955
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 17:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766078642; cv=none; b=MZ42/FNCZ1eXGGzO0RPuXQ70218SixzhlH38HM7ILLT2yLpebzgYvywViOVBTKUAdBO+SHeibQZ47A9g4XmvV7lfFwFX0CJkwgAdhSqcBD0u4WObPRAmvBDWsGokAVsl4hfHQCTr8wutSrTOHiryynXYykiccLj9a+BdBg0yc5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766078642; c=relaxed/simple;
	bh=MIhIK5nZHzCxGcDT8rhgINB7RWvQ6Lme5gCux5mYVE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a6KG27EDRMDlgJClzSdcRLZMbgbm/ncGbfxfn2ADqgC+EzscEUXpSzY/aXoM6T1Zs9rO4J9dHa8IoXTdl+6/fH5ssI1+CPxL/EtIEZtxMjcvEBvLxnQd941+t2+XylYGhpMdrypCgDkz2akGVJmgFiwxHHdTkOITauqdmFXBRDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KL12+SPb; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KL12+SPb"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIDCOtb1002899
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 17:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=dr/ET
	0yq3ny53XV09fBKJitXkepD9B7FKXvq9tIRi9g=; b=KL12+SPb9PD8hNnizwxZN
	fWctArIf7TKgjUVMofzXZwdmMrLXT7c4u8XIczgqE5WjpniiYlfiHDynTQ/qUAIB
	bgFExdXAx/hLcvH0wreCx6bsGD7IhlCweDCIMlsvMbb7H3LJweoYT02kS2DL+T8J
	Y7qK6YP6PQkU1Cf41lhlYzrlqr09HmQpD8eGj4h2nwM9VrZKTQpyhRXaQB83yb8q
	KJKb0zx2cp1vckvN4iFLsUceuTKs51A5T9buMuHzzgNlDD4GFdMme20ANZ64E3Gu
	RPOYouqys7XyItPZPC9jsDSg4YXHwg7Cilj1LkE5jKquz2uqAfMshqwv+ZC2NGTD
	w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b47n89394-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 17:23:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIH3Yk1016420
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 17:23:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4b0xkpq6y6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 17:23:57 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BIHNtS8002775
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 17:23:57 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-104-22.vpn.oracle.com [10.154.104.22])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4b0xkpq6v9-3;
	Thu, 18 Dec 2025 17:23:56 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [RFC patch 2/4] test: add systemwide stapsdt note test
Date: Thu, 18 Dec 2025 17:23:52 +0000
Message-ID: <20251218172354.3206787-3-alan.maguire@oracle.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE0MyBTYWx0ZWRfX7xzGyBa0nAjj
 j6ztf94pMSV1p8AiRWizYdhNZyaV08Dx7dGwF0xrkQalLZuUB3gR2XBUGCxYlXn2DwDlU7wHtz8
 9vo5osvOS3dae8HSNGD1tJXUAslnSxrtvC2P5g2z5L5TZRkWqRBbVXEmTy2ePZsXUWe/WRtEvDc
 WF1VGKDa7+U557ZOj+7aMO9FYUnmHXEMFuoM+LOFnG0Fslx2wDlqdcbCntBfuro0KHzUuoBiNJg
 UgC+WxPCpFGu2IdCrj8WtEOSV6F++ueesgQoKpNIoX1BHz/keeqQgIuCDuR7FcxXKDNO64IlIGZ
 8XoHwCif3g9+zksr+8On9D1tdPInkn3aNk6+2hcl7mNmnNyoFZkw8KupOReemVY0uEuu+uqKr1h
 cdovZpB374G3xY/rnxq1GWQ/TOCt76Ht2sUKW3uq3lGTat1sNz0=
X-Proofpoint-ORIG-GUID: 07H7P8qfcorUy7Rera1BvpTT9-WYejMd
X-Authority-Analysis: v=2.4 cv=Vq0uwu2n c=1 sm=1 tr=0 ts=694438ae b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=JEC0fJkXhVgF0k8_IpoA:9 cc=ntf awl=host:12110
X-Proofpoint-GUID: 07H7P8qfcorUy7Rera1BvpTT9-WYejMd

Add test verifying that systemwide stapsdt probe firing
is detected and we retrieve arguments correctly.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 .../usdt/tst.stapsdt-notes-systemwide.r       |  2 +
 .../usdt/tst.stapsdt-notes-systemwide.sh      | 51 +++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide.sh

diff --git a/test/unittest/usdt/tst.stapsdt-notes-systemwide.r b/test/unittest/usdt/tst.stapsdt-notes-systemwide.r
new file mode 100644
index 00000000..48ee5472
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-systemwide.r
@@ -0,0 +1,2 @@
+test:args:2:./test:val:18
+
diff --git a/test/unittest/usdt/tst.stapsdt-notes-systemwide.sh b/test/unittest/usdt/tst.stapsdt-notes-systemwide.sh
new file mode 100755
index 00000000..2014aceb
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-systemwide.sh
@@ -0,0 +1,51 @@
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
+export PATH=.:$PATH
+
+$dtrace -c './test arg1val' -qs /dev/stdin <<EOF
+test_prov*:test::args
+{
+	printf("%s:%s:%li:%s:%s:%li\n", probemod, probename,
+	       arg0, copyinstr(arg1), copyinstr(arg2), arg3);
+}
+
+EOF
+status=$?
+
+exit $status
-- 
2.43.5

