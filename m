Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1830534DB74
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323102; cv=none; b=IYrrWMdxdWAO6JsoRvKJva1UeoMqk6bYWHC4I3OK3pKB3B06Srl2BEeO3yOriEVmZnfgt2Cm+bq8T/U3A6sER2lHs9WUNl8TkeHjjM9t+uMrbxtkFQf1PsYM31JGcv2NS9pmqJkRL8P+2tUFPp1v6EoCfWnkAueyyzoZM9bapDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323102; c=relaxed/simple;
	bh=EXP+ODsnQf+Z+Bw3srIO+o/N6rLGJSviRv+E36fcmGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ne0DJCPhu7x/CvJHpEYiv0PGWXO5D8gb1ixsTK82PI7TGro+RfaRMF7xM40ktfHEUrderG3cgNXVKtWa2nSI5wC2ncoKgQjGbaKfwlsiAQFp98uw1yqoByqBupMkzgos72JXXgXWmBX12ZLEWAzVwGdP12lM5MDTIVoTF4Okx/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=T4oCDg4e; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="T4oCDg4e"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DGKSv12682266
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=t/NHu
	kHhXZ0v5zUXG6+gWNVZbODptf8lYneIJWzmRK8=; b=T4oCDg4enECCYftlRw6po
	ok1tmXx2RhM8SUJO3Dp/3P+IfVQXUkt9NH2QTOxdZogb4BZxXpS4rI/dbCojYdzx
	G659Q/+bcrHf6jwk7TLb2wuf1kDLoRJkh0ifw1bSAtNdN4ke2va+W9Ya8gVEIBH/
	hlxc1ofwu2GE+YXeQOaeo6OfTN4gkRHzRwvqzNjhr7xGGzVdlDLp6qGNI+Mq+C2r
	4j6FqdcuIC8C4y+Oac9JHdhrsSF3yeJ3759u88J0IjBjtOLP2Jsr7tgm8MwP5M8u
	D21q2txGB0dyax/X7phrg71m3n21ozOQMqC3wW8Vgpu1HaVnaRyH3zmqcBCmxAin
	w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkntb3tph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60DGVx0i004548
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd78xjtk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:38 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60DGpYB7031305
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:38 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-50-89.vpn.oracle.com [10.154.50.89])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4bkd78xjpd-4;
	Tue, 13 Jan 2026 16:51:38 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v3 3/9] test: add systemwide stapsdt note test
Date: Tue, 13 Jan 2026 16:51:26 +0000
Message-ID: <20260113165132.2454591-4-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260113165132.2454591-1-alan.maguire@oracle.com>
References: <20260113165132.2454591-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601130140
X-Proofpoint-GUID: nThNrfHa4uIYz98_d5mnO2aCSQZ-tdSK
X-Proofpoint-ORIG-GUID: nThNrfHa4uIYz98_d5mnO2aCSQZ-tdSK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX90RUYtXJegCq
 BGmj66RU7vlL3VgMxqgNedayXleCxHbvla/N3L8ZB+9/UGqTeNzkDfmkh4CZmj4NqIxlDgoLgcg
 r+S0MBibqlZW3hrCsobdJebe0P9d+NmGyyNXRH1yM6Iw6sIhL5RIljSVOYP9mx6U8O4+IKtoEGi
 osfxgPgxZYYGZM5Aq4i90ggEm8jpSWE891ehBzIsAAuKgs7ohl4QMIjYX7QUE5LXRssGQmA0b6f
 qf3+TjD+Nx0FUbs5OpCJHZHvVrI75QhcDaGhsRDeofNCkxfMxVtdhOwjJ5/c54jvHDBRYeROSnw
 w4Ztrl+L/nQz9Adwvj0rGM2KBWs1i/27B8WM3qLVrmpX2XcmHj/QleBweyfYYjZKfEUte4PTD7W
 UBCaD4c6eyeNFvCIbqnzuTHVLOnXB35ZF7JU+WWY2xFqNCyCC/WeXLMV0yikdH1gbk94ch8esrP
 KIrLDttoQkf52D3KTpg==
X-Authority-Analysis: v=2.4 cv=fIc0HJae c=1 sm=1 tr=0 ts=6966781b cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=JEC0fJkXhVgF0k8_IpoA:9

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
index 00000000..d4de6d2b
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-systemwide.sh
@@ -0,0 +1,51 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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

