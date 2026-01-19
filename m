Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3A637BE9A
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768832612; cv=none; b=elSIXI75ULlh3fy2+zl+7zZDNhhRthWGb7AreKOYviypqRluwW1i+fwRBWkAkufX8TwlbyLNkP4ricYTvb7lNTh7wckEfrzpMioRYG7bjJ0Z6oP7lSfF5sKrhCA8pNl62dcK+bj5toODYrubU+kLCDLUNMtwqsIRuJ7B/WhcvX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768832612; c=relaxed/simple;
	bh=DfnjVWZ1SIsFNZKP3m6vIRt7YZkROcrARTUSoYK2vVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tlZJ1Zju9/3frq4aS0NF98NPQJiY7RCsdZqE/pyMJPYkANNPpK9JGGjdfgbh765C7njYyCOqndVaekE6kLJu0xXLL7FRo0H4MHvyOQ5/8JwFxH2P6ZScedDAqHQ+ONv3KmkrYxDmEIBEapkXpdLUNjVYVne5wlpm6DNVrWRdr5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hyp3MGTn; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hyp3MGTn"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JBDajW1421047
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=v/Wur
	q1045iHvQBhfHRs/P0KJYlxdiZL9kvtJgiYHDA=; b=hyp3MGTnvIDiL1v93Dij8
	04GfGaKA/bc6gvQnm+1TGt6kz6d8fhWJfUslWZUyU0mFv2DAufVIANOrHgwT8a6W
	/L4KcQha2ko16JDxA5kw6m3YkV/RgIZK+Z7SvWnBoydqYkPk9HFQntSbRh3Y8fJ9
	FP7IfAxNxl87DvGO6zBjU6+rrX0LqRENVNHW19K2cVBfWH11V3FsBkTAal/Dp6Q5
	+QPYz2cVEp5g83Hy7D9g5Jlm80ayCiT+SuEuuM9kdg7zeCgxvZpvq2PiopMD8T4W
	2eeQqSDG6h6+F9WzDSl3LFHpml1v5yZmadINWqGE49kb7pze4ryhwOrL+LoBC3xe
	Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4br0u9jcjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60JD0p67021893
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4br0vc6ytc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:29 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60JEIDjg015145
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:28 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-51-213.vpn.oracle.com [10.154.51.213])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4br0vc6ye3-5;
	Mon, 19 Jan 2026 14:23:28 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v4 4/9] test: add systemwide stapsdt note test using absolute path
Date: Mon, 19 Jan 2026 14:22:55 +0000
Message-ID: <20260119142300.975014-5-alan.maguire@oracle.com>
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
X-Authority-Analysis: v=2.4 cv=OJUqHCaB c=1 sm=1 tr=0 ts=696e3e61 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=JEC0fJkXhVgF0k8_IpoA:9 cc=ntf awl=host:12109
X-Proofpoint-GUID: HgjMCUBHvHa6djxzBx_hyUTtKzzqY2jL
X-Proofpoint-ORIG-GUID: HgjMCUBHvHa6djxzBx_hyUTtKzzqY2jL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEyMCBTYWx0ZWRfX8Gp2Z8ye4OQF
 VPvbnALk8o0l3L1CJ8J+AHHwcTP0NY7ggN2GZLjCAt3NBd9rSoL7FfkWMnmfCvC9SqsMevE4Kgp
 7owR2H/rkaSszA7f8EPGDxMh2pnjXiG5ITfUlXL3Q/KiLXNVLS8uWcztBzaW5pJG7HkmcU6uSfO
 eUlDquycVuyUbRkwdbJzxnZSkfe1/4qZSRJI6iUfO/N8XSHOqUWgrzsidQzAt86QB4tnSpB+9X+
 mjrUZlvs1ov1x22yAG+Zcr6nRd6EiYE46ymta94k0Yt+IShVa9d1oo2Pnz0xe2vphGV6P+9HLp0
 2++Nz305phxyzl0NdU/3iAgkZ3bqMtQ9tjIPSrlqrm583UHBvRAef9XWQ90XQovqnBTHUj/uU7H
 YlYJCZdiBbobsEz7yweYJksmR6HaXjBx0rvsbA93N25mKTcA9bSHv8M9O+w9gYrXjYsQtkvpu+2
 pNPX9/zgtkA5adzpF/1UdAa39UyCte4bDsy/riE0=

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

