Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E988637BE81
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768832616; cv=none; b=Rhw7d1L55MuvTj8F9BjdUhdGICLvD92q96f1wKEbcDI/v2d95Yskv2hXYMH4xFFZ7h3FawPTDPFJdrPhXgPicIt21u8k1iPrsZ4u+qtLGKJFCGpA3X1+WqHzy2un2V8/PufQmA5/gWe1XZZMkrVwgM0hrgLopkx/+3zIU83HLIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768832616; c=relaxed/simple;
	bh=d69JIeEjBNj4DOPdgGmc7KIMG3r+IidGALqygAHK0xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rQv7sDW2Q5A5Jk9h2BO6/ILj0vRk6YKi+9R4VxXK+0K0PEQiwLZYY1UQV2r2Vnl4sbFvfs7iAaVJts5+MQYxwAMIFlJkBNiYiCVnzhJkJGc8JxgutpZa5W3ak1GKlVSVIlhwiRR990jhk1z5SGm3xMcrq1lNEwkJYCtBbB/niBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Zc9XDu+b; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Zc9XDu+b"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JBDU5Z1341867
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=cU2jY
	STB3Fae8wbX2k7MOURnClCA2ooBEA3FS0eyXwM=; b=Zc9XDu+bfwwf/pSMjjtMn
	xsrPTTyACH9Nn0AIZBNP5JNFzOgHYfx5aUdX0ibU8bcHwcjE6R8g/5yPQdlX6kDv
	NtuIQFG7qiQ3cuFkDe1yGZlrj9GDdu2dk2TAxxmGT/Thv4XpRNRDxW/tj3TSg8mM
	tjKJZjbPRXvCahBMdDzdkkw4/TBD0f2ccYZPREdnJg2t1HrcnvzPxDRiOnitGoqz
	nlPXjuToUnnWwzzRSpdFbr5XosL865kcTb8GqZF5CTVKSKxfFLWBBFDCEdwu9Wk0
	15z+6NuU71U2cDlxPwqbCCFqEypyzZN73t4vTg3LONLvItpU11uiYIJOzMrMkoUN
	A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4br170acv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60JCp0GM022532
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4br0vc6yvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:32 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60JEIDjp015145
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:31 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-51-213.vpn.oracle.com [10.154.51.213])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4br0vc6ye3-8;
	Mon, 19 Jan 2026 14:23:31 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v4 7/9] stapsdt: add test for listing systemwide probes in absolute path object
Date: Mon, 19 Jan 2026 14:22:58 +0000
Message-ID: <20260119142300.975014-8-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260119142300.975014-1-alan.maguire@oracle.com>
References: <20260119142300.975014-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601190120
X-Proofpoint-ORIG-GUID: TyEVxGbnW466MNiAgWGmVqb_xMmPDIed
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEyMCBTYWx0ZWRfX486bx4aqxX9U
 OE3X9aSM5VTrsOzdveo4O84RGzKxOUO4kbt1Zyj3TOBz41qzZENjEg2iZleUpRBxiN4Bo89ll1M
 RUExOHwsUT71Us8Rd7H+Fy8wasoNktNl110yvCCVUSVFqq0rcXnouItgILp2kGoESOy4qd+1uOq
 5ofcICsa3/wsErMX3s9f1MTaVEQcAcem+meHdCieZfCgch3I9hm6x+HYqPvv4urlNzhGsAxbYo3
 B7WKNu+IPPQVtKAkZ6/KT8aArZzGQepEkSJaUixPmn0X75ecl2WAv7rxQDMGzUo1ibTxKtAaOsb
 FJ0dggiIUIF9pZ00+MeVn+aNW+lwBK51LNZRE7RdJ4xTZO9Bcx1YHjGKCY/tda8SwPm56U7OjEa
 Qwx+noMhuN0X8b8jtpsS+Q0jVDlXzJ1md1Yt7nicB7Cz8nfOn2FRe8Eoc9HWcEXcMcZMZycrylY
 hO29ZOm/P+Opqiy5IB6WFV8x8tVJyNlQihm4NDjU=
X-Proofpoint-GUID: TyEVxGbnW466MNiAgWGmVqb_xMmPDIed
X-Authority-Analysis: v=2.4 cv=FvoIPmrq c=1 sm=1 tr=0 ts=696e3e64 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=gfbp12JJLI_0ST-XH08A:9 cc=ntf awl=host:12109

Verify using an absolute path for listing succeeds for -l and -lv.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 .../tst.stapsdt-notes-systemwide-l-abspath.sh | 48 +++++++++++++++++++
 ...tst.stapsdt-notes-systemwide-lv-abspath.sh | 48 +++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-l-abspath.sh
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-lv-abspath.sh

diff --git a/test/unittest/usdt/tst.stapsdt-notes-systemwide-l-abspath.sh b/test/unittest/usdt/tst.stapsdt-notes-systemwide-l-abspath.sh
new file mode 100755
index 00000000..878e8502
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-systemwide-l-abspath.sh
@@ -0,0 +1,48 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+# This test covers stapsdt probes fired by the STAP_PROBEn macros,
+# testing listing probes.
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
+	STAP_PROBE(test_prov, zero);
+	STAP_PROBE1(test_prov, one, argc);
+	STAP_PROBE2(test_prov, two, 2, 3);
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
+TEST_PROG=$(pwd)/test
+
+$dtrace -lm test_prov\*:$TEST_PROG
+status=$?
+
+exit $status
diff --git a/test/unittest/usdt/tst.stapsdt-notes-systemwide-lv-abspath.sh b/test/unittest/usdt/tst.stapsdt-notes-systemwide-lv-abspath.sh
new file mode 100755
index 00000000..d0ff3e84
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-systemwide-lv-abspath.sh
@@ -0,0 +1,48 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+# This test covers stapsdt probes fired by the STAP_PROBEn macros,
+# testing listing probes.
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
+	STAP_PROBE(test_prov, zero);
+	STAP_PROBE1(test_prov, one, argc);
+	STAP_PROBE2(test_prov, two, argc, argv[0][0]);
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
+TEST_PROG=$(pwd)/test
+
+$dtrace -lvm test_prov\*:$TEST_PROG
+status=$?
+
+exit $status
-- 
2.43.5

