Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CADF3659E9
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768832611; cv=none; b=pdd2x/y+kPDuM/XUcvOZjATaMVDcxl64uoU+PVQjPRqgFmy2CnfCvILRMLapxWcpAlAeVQiCZSTbuRFR6WoBVcPVwPcnQa9P61jX1x2AzxUkmLBB4/uvUe6XuxI2FBVETfcr3RJAyRQDGqg7kr/JxJY4AgA/elKXxpNI2/Y8PJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768832611; c=relaxed/simple;
	bh=/q6uOvdkSbda82mbW9HsOD89fGMc4ecTI2p9tD3b4UA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E01RuPSsPPsSbmh4NdIHbiy96WOurDsPBpiNOfNje/NilHy9FBNpo4rmpweNK6WSOOKJmypU7CpZ4Edgqdz3esXaG2H9jnDWqmjbEeXk53HZNa7+HbkigGo61Ki+cRVYXE0E7vUUVdOOmiIFMWQhqlrEN8tK9eeiAndE34Rks+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PHjPrrzV; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PHjPrrzV"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JBDOH01512387
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=sVnbT
	A5FfNCxGjnCEk+Q4Hp0XvI3Ykw7XVCzW42b+6E=; b=PHjPrrzVaJ2p+6RG1GwCS
	aI3Esid/LtuFrbIPfynU+0sLtDbnnJxdUcrMZQG/9j1hwxi1iGGMd+XR+mVNhpVn
	Ayt4xyrOiSFFhocFvGZmMAB+KzrRhD6EryAFMOSANiWqzvfFIjY5z0LfT0S5xwcW
	emROd20EsuKwFZ3ZEItWXHt03wxSTC2bbcQt13blqTuvlu1KTlbweEzKoCDexCj5
	KQw66AoSbPeznQSE/r1xVSpc2pqFQLdZvIglMA3aVDpr/iuLsTwt8i9M51J5X5q3
	YuLEI6QYoyk7UQ/xjKLktDF124cKpugqR9+ExwHZxOWLwsxMTMUPrqQVXJnhJLvA
	A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4br21qabbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60JD0au3022493
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4br0vc6ysr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:28 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60JEIDjd015145
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:27 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-51-213.vpn.oracle.com [10.154.51.213])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4br0vc6ye3-4;
	Mon, 19 Jan 2026 14:23:27 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v4 3/9] test: add systemwide stapsdt note test
Date: Mon, 19 Jan 2026 14:22:54 +0000
Message-ID: <20260119142300.975014-4-alan.maguire@oracle.com>
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
X-Proofpoint-GUID: tDlrBXUfaAXo2-hQ19wHL_Bxe6xCqEyC
X-Proofpoint-ORIG-GUID: tDlrBXUfaAXo2-hQ19wHL_Bxe6xCqEyC
X-Authority-Analysis: v=2.4 cv=QdJrf8bv c=1 sm=1 tr=0 ts=696e3e60 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=JEC0fJkXhVgF0k8_IpoA:9 cc=ntf awl=host:12109
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEyMCBTYWx0ZWRfX91WqondGkL4B
 lCJy63Np8JvDDo22GOwDjqjry2PYnf36gV64jNlkpQ2aWIrWX/nY26gLGAPG87uDpysqX4Ryo5w
 exO5RMVuKJhYNP6O5eQGxIFgoTc6IcWLH4az4JhcRLHgrP1LbcarsZ8+lMOJ1cWPHAGaD6K1sWb
 0/reGkT+dY7xYYnbJOfORMbbkWgz2XWc0Zo9P1dnO01xNui32I+fEsVPNFak6y6mMzBlCwrNadp
 G61y5e+MSK6SItFoj2TTxrVGsMQD3Reh0bWbdldSgdbmWjTYGaruTjQZBXV13xXBjfImn2RXXfH
 MruweP37IsXg/O+yhGAhTzE+DENUw+nxivSwCXB899OSwfyh74pF0+cf3KsWprNpO4/WC92DEmC
 Z2Sw43lnJAGPLVeS1RlPqkyjS63CV8wblH0x9Fyulr3Wx7XX034fEs/7QbBShPU2KdPHsW+sL/9
 nyNmUwzNcRRHfBxufYXJx3H5WTHX4ajg8ti6ATVY=

Add test verifying that systemwide stapsdt probe firing
is detected and we retrieve arguments correctly.

We launch multiple instances of the program:

- one before DTrace starts
- one with -c
- two via system() when DTrace is already running

We ensure that we see 4 sets of firings for 4 different
probes to ensure we catch previously-running programs
and programs run after DTrace starts.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 .../usdt/tst.stapsdt-notes-systemwide.r       |  5 ++
 .../usdt/tst.stapsdt-notes-systemwide.sh      | 89 +++++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide.sh

diff --git a/test/unittest/usdt/tst.stapsdt-notes-systemwide.r b/test/unittest/usdt/tst.stapsdt-notes-systemwide.r
new file mode 100644
index 00000000..679d835c
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-systemwide.r
@@ -0,0 +1,5 @@
+test:args:2:./test:val:18
+test:args:2:./test:val:18
+test:args:2:./test:val:18
+test:args:2:./test:val:18
+
diff --git a/test/unittest/usdt/tst.stapsdt-notes-systemwide.sh b/test/unittest/usdt/tst.stapsdt-notes-systemwide.sh
new file mode 100755
index 00000000..5d5c6f09
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-systemwide.sh
@@ -0,0 +1,89 @@
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
+#include <unistd.h>
+#include <sdt_notes.h>
+
+int
+main(int argc, char **argv)
+{
+	int i;
+
+	for (i = 0; i < 20; i++) {
+		STAP_PROBE4(test_prov, args, argc, argv[0], argv[1] + 4, 18);
+		sleep(1);
+	}
+	return 0;
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
+# Launch one program before DTrace starts
+
+./test arg1val &
+
+sleep 1
+
+# Launch another with dtrace -c
+$dtrace -w -c './test arg1val' -qs /dev/stdin <<EOF
+
+BEGIN
+{
+	pids = 0;
+	afters = 0;
+}
+
+test_prov*:test::args
+/ !done[pid] /
+{
+	printf("%s:%s:%li:%s:%s:%li\n", probemod, probename,
+	       arg0, copyinstr(arg1), copyinstr(arg2), arg3);
+	done[pid] = 1;  
+	pids++;
+}
+
+/* And launch two more with system() */
+profile:::tick-1s
+/ afters < 2 /
+{
+	system("./test arg1val &");
+	afters++;
+}
+
+profile:::tick-1s
+/ pids == 4 && afters == 2 /
+{
+	exit(0);
+}
+
+EOF
+status=$?
+
+exit $status
-- 
2.43.5

