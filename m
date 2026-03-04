Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB6E388E6B
	for <dtrace@lists.linux.dev>; Wed,  4 Mar 2026 08:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611294; cv=none; b=S2hekKJnZ0Dl+VN/iJRyCscgSTjKoDPQlexc7+Ls+xoVyLnm7HT6lqbusbvU754kpSSddLoSDYL3n5ZeNsW5hnj51WUCAdP0jwwXg7WcSzKtbpN8vngGv1bVekT1jZlImwtogeZtLJJQWYeq04+ANOejNrXl2fkrctlFY5ZqzFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611294; c=relaxed/simple;
	bh=/q6uOvdkSbda82mbW9HsOD89fGMc4ecTI2p9tD3b4UA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O45A4GEc3fmBX8eYoKd7FDrr06+NWRmsTH8bV9S0IucRo2/W+mZHcIU5FUiBrouRx9rcxrqJKi55UTvFBIseE41UyTicid7i4tQGh9H84OUu9Xh6bDGTEM0D8ZwomIeGmVDgY1OaPbT4NrQhpoohEZhMKoRTVYy2Cgv5r7NArbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=L32baxQA; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="L32baxQA"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6247hLN92304038
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=sVnbT
	A5FfNCxGjnCEk+Q4Hp0XvI3Ykw7XVCzW42b+6E=; b=L32baxQAfM3Oa/BL/R7WI
	3ReJ52deEyyCyXGtKN9OdDE8el6SS3ha1DZyBekv3+KNMzbRhh/nG/40xzZuLNOM
	u0TOPL3qgmS/+QdltpG7uWSLHAZn9NpqKD03Vvde3/druEQPlFVejijUllcdBMS6
	idWDXRSV6yvzDl9n+9tGKdRTZVwgrje4pXrEGPmcQ4O4WuWLl9Dngy2d5mLoTZ0l
	RytrLSBC0LGc19+m7S4vYXq5dkwFhhQs8LrstBcJX+tyLzG2sKFkKh/QRd7t8b+y
	IEwO8Zi7srpfJX9AG0jCPwZ1esPjFSpEs7WdxZafPO0DffO9XEYro0rHPl5mXlDl
	Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cpgkjr0ss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 08:01:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6246l23U001789
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:01:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ckptfs2x5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 08:01:30 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62481RYg023337
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:01:30 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-62-133.vpn.oracle.com [10.154.62.133])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4ckptfs2t1-4;
	Wed, 04 Mar 2026 08:01:29 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v5 3/9] test: add systemwide stapsdt note test
Date: Wed,  4 Mar 2026 08:01:19 +0000
Message-ID: <20260304080125.649031-4-alan.maguire@oracle.com>
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
X-Authority-Analysis: v=2.4 cv=GvtPO01C c=1 sm=1 tr=0 ts=69a7e6db b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=3I1J8UUJPc9JN9BFgKH3:22 a=yPCof4ZbAAAA:8 a=JEC0fJkXhVgF0k8_IpoA:9 cc=ntf
 awl=host:13812
X-Proofpoint-ORIG-GUID: RRu4dNWUJujMUspXEGPoQJYuZ8fH5GYo
X-Proofpoint-GUID: RRu4dNWUJujMUspXEGPoQJYuZ8fH5GYo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2MyBTYWx0ZWRfX1yBSigpqKFF+
 UHLULhxkKIE3OEbvRTdMzFyhTP4hRTdEZmKhiJmc4iwyIbzif1IvmlNh2EkBRTs0PuMSJN4JWs+
 MO6fKgIdtmHH0TGPX3l2rKLxmybnLFs97Q17z/eVxVuW3TzhR6uUDQz7SGWJIn6dQBH5W2gS7AB
 B5jkQkpubAykOUR+Xp6s1/+u398NsNAEc4XJB8ia2eNGITyI4My/DvW0dK52c08OMtJwryG+Ovi
 HxTs4FMl+NFH3QzEU/+EhuOr3Z8C7XdqVME2kzuASUPKMX9vlcXC3CpktmBX5NzIqc26kGvOlGQ
 Rm/EUDGXn8mh/PsDcvFAqnSgxFFTIftlm9vOv9asiKrf5Bh+nAd8rg9IaLuqrD55CjVg0wFSyZu
 zDeeJ7J/2+BYZNIorkPSSvoxOHX3LhjY6MXftDq0vsfksk1XvHjEGWLz7RdAZM1Ji6SC45bVelN
 z3TD7aAOserSNR1fyrjEvHxpTFuTQ/2SVxmcRZq0=

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

