Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96EE3451BB
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323106; cv=none; b=A4dIUN8Iv9/7wS3u2kkG1gcr35Wx4hW53wifn15AxxygeH8gLbYaZIGr1ADhiOX2C47iNvPqW8B5FItcippgDgOKSRsyC1e5MxkAf27iELz7b+S1J+1udAbDsM66uEk0FB9dpSIn74jxCx7xBMnqP5QL9TUuKs50+2V/8Oz78mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323106; c=relaxed/simple;
	bh=3SwmpVdIxIru1cKpW9/uYG9FmPxjfs9ua9knX6zw5Ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eXgDPCFVLXM5fsE0gv5YqKQ/T4exr8g2iiVaknKyC2U/PbzGHvx+WFyTdTmxhUOATK9+CoWzKmabG+ffsZgguBK/0EGjF3tD5o3GF1eQO05wmA3d06z19zwQRWdhlCoSQPHGVtECyqv/gpMCOmNcXZJ5vqm7n/S0gBWfA7NFciU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Kjx1a3jf; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Kjx1a3jf"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DGOu532686260
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=tHHeY
	t7EMeyqUSbnHyESziyZcI0RKe0mNMNJFEBrjUw=; b=Kjx1a3jfa1e1ztK7Jw4Fy
	hnizSbnNL3CtZ0a0QzCA34awFOYblsDY0LyUmEDVdT/EjITW12I3pFuGMDs49b0P
	ZcgFMH6H0kDVI6+HjAgiILcfh8l6e4xHviu+jSo+kFYi02NutV1FZCUCWwuGGwaQ
	X+jaNKpEdoWe/mC3Vhs8YxXHi3OAdm/rZJ/dgF1AzMx90wBiBIJgFy2InKkVQ35n
	u6Gc6fADA461GWvZAm8D90vJagIoygj1lVbZw3xX/cDO91OH7yrQJSTMo/rrzP25
	+J68lGdgRqBdSiTR1kYlc7v0pwKLgx2yzWfbmN+Md8MqnDsYfWf6UOxSgCZ5Qtki
	w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkntb3tpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60DGEWer004868
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd78xjwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:42 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60DGpYBG031305
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:42 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-50-89.vpn.oracle.com [10.154.50.89])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4bkd78xjpd-7;
	Tue, 13 Jan 2026 16:51:42 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v3 6/9] stapsdt: add test for listing systemwide probes in object
Date: Tue, 13 Jan 2026 16:51:29 +0000
Message-ID: <20260113165132.2454591-7-alan.maguire@oracle.com>
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
X-Proofpoint-GUID: RzAnEQn-vU9d_HZx1ethAaL_yZKulpxF
X-Proofpoint-ORIG-GUID: RzAnEQn-vU9d_HZx1ethAaL_yZKulpxF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX8ZZlucvP4y7l
 bga/VlqCzidPr2WDRd4k/+WXpboaG/IIJqKoxgMJTgoFW6Ps3bep7aB8FyO/6zfitkLz4vbjLn6
 V4oICnwDjbjmWoGPZ9dhOegwYf0K4zxMLhe9QyGDZHvg6HnPsGDmJkGnjFBZBc8UB/c4lDRW1Ey
 qqW6MDP31yZ3NG0tciK6V9iPWqxeKUGQuO6T3h4pIGVi73grxNNDS+2N38agjL4X/ykJj2jpi1Q
 HTkPLe3Y4Pbu7YZ4oRJv9roVmAQ1nShE/ZealFaWNI4V3RiwW4amaFsAj4yCjfYNtjYI3hz+g/l
 HGWiU+6COkULRZBkgEdtK+R7/3zfIyhOLNVgGV3CVHggLEi8NUkcP781WU9J6mbzbH9qIYCqrUZ
 sX8HddOo02cm1pzIOa103psP7Ctg6ugAlr6cvrHFt1r+Kdw0s93TuVHaO+Qzz+840Un6cL/U/vb
 XMDQSTEw4HMKzZj5FDQ==
X-Authority-Analysis: v=2.4 cv=fIc0HJae c=1 sm=1 tr=0 ts=6966781f cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=eXpHH4PNQhkuFDgJz9sA:9

Need to use -lm since we need to specify module level to
identify the object.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 .../usdt/tst.stapsdt-notes-systemwide-l.sh    | 48 +++++++++++++++++++
 .../usdt/tst.stapsdt-notes-systemwide-lv.sh   | 48 +++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-l.sh
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-lv.sh

diff --git a/test/unittest/usdt/tst.stapsdt-notes-systemwide-l.sh b/test/unittest/usdt/tst.stapsdt-notes-systemwide-l.sh
new file mode 100755
index 00000000..fab71973
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-systemwide-l.sh
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
+export PATH=.:$PATH
+
+$dtrace -c './test arg1val' -lm test_prov\*:test
+status=$?
+
+exit $status
diff --git a/test/unittest/usdt/tst.stapsdt-notes-systemwide-lv.sh b/test/unittest/usdt/tst.stapsdt-notes-systemwide-lv.sh
new file mode 100755
index 00000000..e77eaf38
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-systemwide-lv.sh
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
+export PATH=.:$PATH
+
+$dtrace -c './test arg1val' -lvm test_prov\*:test
+status=$?
+
+exit $status
-- 
2.43.5

