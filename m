Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739AC34D91F
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323107; cv=none; b=nZbsS0xpOhEzNzrGuB/vcTowrHUVStetKLNZVvma7fdldp/h26mTtQBINNF+KeASrvtsYBzyWbwnPi5AiY0Mznj0GweexLxvSus+LtHpKEA2zOcxq3a3BAqhwFfgdawQcJDDMP4sajHqENJvNCmoZJ2wFBVwNThdIRjq+3ahaI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323107; c=relaxed/simple;
	bh=d69JIeEjBNj4DOPdgGmc7KIMG3r+IidGALqygAHK0xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K/7UxbNgB8d5dyFVf0cuVPS+3jqUyHezmRGiz1CZAEAb/CNrvbFDViJS+KmYA6KLVag/tEdvAUf5v0hgFTp7JKLQ5vmadI2R4yjHcLI6xGQV1msv27JaIhiJEG7xkFQc59FV/YZ5rh18omFz0C0SFJq/OCHYiCN/3Qpg0je9T/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Iy2u0IKo; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Iy2u0IKo"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DGH5NT2811623
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=cU2jY
	STB3Fae8wbX2k7MOURnClCA2ooBEA3FS0eyXwM=; b=Iy2u0IKoFw4RUpvboj/qu
	ozfp1b5F7Sae/Ag7rovKERSMOgGltpbWRPhU0HcTd6FGEJxHKj+OwGSfy2Uoly/u
	rraS2uTJX3kXb+u3vEhWyB8ZODXVOJk/Hx5QBQ0qh1eTtd3xz6o89UiTZaepiIGo
	d3YI2+DXMFlZ+1MPEuFnlvl2PxJZhYVy5qU+pv99EP3uRFiMwsOYZZ3wodGgc8Cb
	7Xhv8E6euSL3B3h8U/WQdV6zKAoDxyv8CS9X4DdhW9qbHXoDZ25o9cWdXFvyndZj
	OmkOx0i7a9IoytM/9QJ9rVdwXHI8+AQFkdl0d8GODXeIFF/DYtY8aQ37rv0ZlTJO
	Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkh7nkxbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60DG6PQE003910
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd78xjxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:44 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60DGpYBJ031305
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:43 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-50-89.vpn.oracle.com [10.154.50.89])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4bkd78xjpd-8;
	Tue, 13 Jan 2026 16:51:43 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v3 7/9] stapsdt: add test for listing systemwide probes in absolute path object
Date: Tue, 13 Jan 2026 16:51:30 +0000
Message-ID: <20260113165132.2454591-8-alan.maguire@oracle.com>
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
X-Proofpoint-GUID: ohEg0OYbxBjDEAZFJuSjx5XWHseQtGw4
X-Authority-Analysis: v=2.4 cv=X7Bf6WTe c=1 sm=1 tr=0 ts=69667821 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=gfbp12JJLI_0ST-XH08A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX4g5Lk+vUaY1u
 vNojqZ5Obkax2ZL0Zg48+NCI0I3CyZULxbEWgT/4RDlXN/Yv5Aa3jHGQs65nVDXBEvksGAMVYtZ
 BYWfgcWPI7aSQdTg1YxWiPn+RnKLDB7CvoaY/RZwIcizYDRjB/U467UQzWPpPqMwkJkKt3Dei6m
 4dNVHgelNTHr6pKaDApfYlFOlS/wK/RQYhPFWZC+xybicAQLbvAEYcbKIM2U2KN0VG5dTILOsqE
 FedviMjhnpYzFRO8s0+c/Xh6LXwSTCraYWdXYMm0qTsd0hI8+bDXSceqewpW6r3X4qKXgPVVrRo
 f9xodrnqOAOZf0zkuFOfW8fvdjvmQ3BoF3hhnxLf3aQdbQ+ol1f+RJtV4GZY9y2DLdMt43YirM6
 ADczQM4n8y1mG9KaukBjTgi1j6gc3/3p5DR9S3yemwIrXKkksJzCTl5sxOYQxBgEQDJQT6AxrYy
 xEcsHwnYXH/wOn6ty4A==
X-Proofpoint-ORIG-GUID: ohEg0OYbxBjDEAZFJuSjx5XWHseQtGw4

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

