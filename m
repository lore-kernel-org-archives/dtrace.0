Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534C73890E8
	for <dtrace@lists.linux.dev>; Wed,  4 Mar 2026 08:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611294; cv=none; b=nB2NEl9DTt616W32hQA5k+0FrQJPnhOyHKAX/X7gPRk6ZFrUWGM0EAX4A4gD3pEjGv3yoEukKOAvMU6QU6xbW14giNqGY5QAEN0xlU7CsIqN8ADYd3UNhDrqxh50z/wXf7HhMZ+TrUlbeUc0ojm4j6c/1tGGhumuwzuPzeJSpOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611294; c=relaxed/simple;
	bh=DfnjVWZ1SIsFNZKP3m6vIRt7YZkROcrARTUSoYK2vVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GXqVNuPf7nFKk7EGe9QHzv5bhAiZCyCCeLA2x+zDHTskhyaueZunefk/RaatWrtBdsVvjiYwhq4Nk3MbvF8ePSiLp818l7Y+fK3iAd7Y6ImW+1h52m7kJNG+8tpPwt7yPwMYTl+Sn+6atV6aIq5esdBrf6pLVIxT8BYRIDKrip8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nxIqyLNy; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nxIqyLNy"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6247hF2N2303813
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=v/Wur
	q1045iHvQBhfHRs/P0KJYlxdiZL9kvtJgiYHDA=; b=nxIqyLNy0zBovKcF7BQn6
	BoS8oWUW4G2ckg3LMJ7P3KPGVhg4zwaOORe39wmJBhFyw7NvwQ7WD6T9vwW1qCO6
	e0A0HgfikyxRdyzQ+ndRBjLCkq36/ms0tE92YZt5OiYCyTsin3HDiK2DPCXP2YeG
	QlcYCEYmnos1gCDrc7IjoVDH/3KZ1+Ewng+3gmO0xLL4RzzXV4lvZEv0KBkpEfrG
	rpeArrm2B6CiCEx6eN2KHg3I3ZMhKiYuzIClfaqYTifbYmRr3P9Ka6rCpLbhz5RI
	qq1eDrcMmXAmn8m24zydnx0k/oM1EpXRM817KnpBNcGVB5NbtaK4LdOCGYvrbVGC
	g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cpgkjr0sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 08:01:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6246jgii001680
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:01:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ckptfs2yb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 08:01:31 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62481RYj023337
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:01:31 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-62-133.vpn.oracle.com [10.154.62.133])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4ckptfs2t1-5;
	Wed, 04 Mar 2026 08:01:30 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v5 4/9] test: add systemwide stapsdt note test using absolute path
Date: Wed,  4 Mar 2026 08:01:20 +0000
Message-ID: <20260304080125.649031-5-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260304080125.649031-1-alan.maguire@oracle.com>
References: <20260304080125.649031-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603040063
X-Authority-Analysis: v=2.4 cv=GvtPO01C c=1 sm=1 tr=0 ts=69a7e6dc b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=3I1J8UUJPc9JN9BFgKH3:22 a=yPCof4ZbAAAA:8 a=JEC0fJkXhVgF0k8_IpoA:9 cc=ntf
 awl=host:13812
X-Proofpoint-ORIG-GUID: NzOQjbrxaQfTy4xT7FQP1LIqzsRhybeu
X-Proofpoint-GUID: NzOQjbrxaQfTy4xT7FQP1LIqzsRhybeu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2MyBTYWx0ZWRfX7Y+V1aqN825u
 Sb22Sar6uv/3XGS64yTiaQwdNRY4wgRoPq2M9i6Bd5/GNNbxEd2hKlBuvczfVTqRWppmDaoZ2Uo
 0tLUWD7DxAFL4ahbv+eTyFSUXXEvU4MJwh/+IR5AmF8HLvJyfbzsUdfyDilGjqNHiqEhVJQuxPt
 WFcqtqd4RtxFXwDM7VkH3F38buUgEWwURa6huIzcPlmMwkAFmwcUlj+RZE1N6diHPo1HiPFT3sN
 Ht5BZVPBurX/30HDa+UKpqoaLREtO1E6yplXRD4U+7Om1vrXf55ZAR9B3C1BJqWbV96eWlmyJDj
 r0xlqQWzBIv+zNwU3KsyybI4DrIRRUZDpjjcYoVNjburr+RxKC9lC8kcxNj0XO4ZRG5qf0mAF3j
 l4woEDdtcXs/JXzqU0MWqMDodKDnGWuvZomFQ6gzecdsDvDPA13garJjeNwOyHDQQvwc+9XAYty
 er3Y8B00Ph3GuADsYFV+2nWTnjNBZCygJtVEdyFg=

Add test verifying that systemwide stapsdt probe firing
is detected and we retrieve arguments correctly where
the specified module path is an absolute path.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 .../tst.stapsdt-notes-systemwide-abspath.r    |  5 ++
 .../tst.stapsdt-notes-systemwide-abspath.sh   | 89 +++++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide-abspath.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-abspath.sh

diff --git a/test/unittest/usdt/tst.stapsdt-notes-systemwide-abspath.r b/test/unittest/usdt/tst.stapsdt-notes-systemwide-abspath.r
new file mode 100644
index 00000000..679d835c
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-systemwide-abspath.r
@@ -0,0 +1,5 @@
+test:args:2:./test:val:18
+test:args:2:./test:val:18
+test:args:2:./test:val:18
+test:args:2:./test:val:18
+
diff --git a/test/unittest/usdt/tst.stapsdt-notes-systemwide-abspath.sh b/test/unittest/usdt/tst.stapsdt-notes-systemwide-abspath.sh
new file mode 100755
index 00000000..fe36df90
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-systemwide-abspath.sh
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
+export TESTPROG="$(pwd)/test"
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
+test_prov*:$TESTPROG::args
+/ !done[pid] /
+{
+	printf("%s:%s:%li:%s:%s:%li\n", basename(probemod), probename,
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

