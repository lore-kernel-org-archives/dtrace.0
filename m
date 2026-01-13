Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552963451BB
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323104; cv=none; b=bANGRWcKXPaz22H7QHO8B0Sh1Jaw8S/meww60acDBqlCZIRpyVEBwU9l8ajylfd5r6mNmRMMCfyx9vneGj55fCUQv8BAfGC0RtWir7oI3tUaOBfeswRymE1rHmKIcIsuV67bNUqoH1VV8ZaM66WlmsqD1oU4NYjy+2RA4aYuVbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323104; c=relaxed/simple;
	bh=Y05IM7zypf1QhYdtYCNcYFYsTBwcWW8+z7Qnh8GtMZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X+SipwRtvv0zsB7ECJo48cKeDDYFs1WjQK177VXAdrxu6DusmDB2vE4k26A3S78w141x9jQiBcAfNGjXzXB3r9tbq2fcG6sS+DNDjk3gZvPa9g06NrCQ1GSWtD4jPe8BGTuTguMUrgigiqzkyqRSnPw65amF6ch15FZkYVSReiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fCgq+E7E; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fCgq+E7E"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DFxWZr2682127
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=nk+YZ
	rCyl0L3kVAr5BYWZ/nw07AKGVezWAmqvizjbQo=; b=fCgq+E7EwdFTt+TyVy90Z
	tfdZ+ZqEhxF+G7ZA0/mwgGsuim1Ic1A3lxjRkmlEIDYf4pyRH7Rp0SRJyMjc8zV4
	scymyjaZ83oLNW5QJCTZod+YnA07bJOQ0m4w2lucDyDPiQQgw5HJhP/RMT4re72L
	csTOEk/kJtTy+ND9nRUNcEmOdaJmavSoa5ilsn+QTwU9Ifkjs/rVtO6Gdl1Hlpxm
	or/AyZpCI4j1xvNcGvcYg6f1o/XrME5ZPUlM1W0hLs6+U42QXxRONGauRz41UuD3
	ZL0tAG0QtS3YtP3DlKBMxtFTkFrjjUxsDmnb3i3ruNk15wryiffTA9PED3hJGedS
	w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkntb3tpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:42 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60DGEWen004868
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd78xjuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:40 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60DGpYBA031305
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:39 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-50-89.vpn.oracle.com [10.154.50.89])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4bkd78xjpd-5;
	Tue, 13 Jan 2026 16:51:39 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v3 4/9] test: add systemwide stapsdt note test using absolute path
Date: Tue, 13 Jan 2026 16:51:27 +0000
Message-ID: <20260113165132.2454591-5-alan.maguire@oracle.com>
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
X-Proofpoint-GUID: IyCWYJRVlNDMzgeYNfPHFuL6-7_ravR9
X-Proofpoint-ORIG-GUID: IyCWYJRVlNDMzgeYNfPHFuL6-7_ravR9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX8KQFGIGiLhxx
 hZOd7RtLkDjfcsgcwU1BdoMN5ej6VF2tvcCy5x7ZUHbZ9BlJhNSb1RtJw9DiYNEBv0ADhOld/2n
 IcXLpe//9yigq/wrswj76qR20LZ/bYWUKv1TFPFoIm8v8RQyf3ykzAhlyA4fjBvNToVSQIF9KcO
 sFwrpUWtZbm/7XW2xj9jGhIUKo8aD/OvVRvKvWNtDaF9QYu/XVZNYvzMkVBnItORO2mH/2AT5/1
 ghh0sm1vyWWZXw4+DTjix1QRmz/ig+vodPU3eHa4HbZCidnTuPUyp2vm0vQoXx38+0Xp2iUXdzI
 pCGQNZm//xPG2GBuYKt8oq0hAH5HclCt/DA/bw/YDmO5t7f53iCQKahmezDLXh2CMVs1ganrhg+
 o55Ofmjsy6R58oXE/UQ9k/2u0dBcirsyUCvKHLp7c5R6ltP3sFArdGyjRsT05MhlAGvWTLTolJh
 Oiy1tAnHrR5X+xpNTiA==
X-Authority-Analysis: v=2.4 cv=fIc0HJae c=1 sm=1 tr=0 ts=6966781e cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=JEC0fJkXhVgF0k8_IpoA:9

Add test verifying that systemwide stapsdt probe firing
is detected and we retrieve arguments correctly where
the specified module path is an absolute path.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 .../tst.stapsdt-notes-systemwide-abspath.r    |  2 +
 .../tst.stapsdt-notes-systemwide-abspath.sh   | 51 +++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide-abspath.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-abspath.sh

diff --git a/test/unittest/usdt/tst.stapsdt-notes-systemwide-abspath.r b/test/unittest/usdt/tst.stapsdt-notes-systemwide-abspath.r
new file mode 100644
index 00000000..48ee5472
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-systemwide-abspath.r
@@ -0,0 +1,2 @@
+test:args:2:./test:val:18
+
diff --git a/test/unittest/usdt/tst.stapsdt-notes-systemwide-abspath.sh b/test/unittest/usdt/tst.stapsdt-notes-systemwide-abspath.sh
new file mode 100755
index 00000000..b2dc61ed
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-systemwide-abspath.sh
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
+export TESTPROG="$(pwd)/test"
+
+$dtrace -c './test arg1val' -qs /dev/stdin <<EOF
+test_prov*:$TESTPROG::args
+{
+	printf("%s:%s:%li:%s:%s:%li\n", basename(probemod), probename,
+	       arg0, copyinstr(arg1), copyinstr(arg2), arg3);
+}
+
+EOF
+status=$?
+
+exit $status
-- 
2.43.5

