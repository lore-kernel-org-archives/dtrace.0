Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B8E37C0F0
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768832614; cv=none; b=YxgGU90zgW2n8o6/swPircIeRBPUeMYzbd6v3p453Sa2I0B/MPnHUwPxameix+6AKgkEoIF7Xixk4KTaG2aSABlR4gFXuVjI0STMoCPHSQPEgzREPePpk9gl2A6V0aEI5s1Rwq3U3ZrQgR3CNjrdwvbyOiC5+FEQy3K3pJkiCg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768832614; c=relaxed/simple;
	bh=3SwmpVdIxIru1cKpW9/uYG9FmPxjfs9ua9knX6zw5Ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pWNJvswWQ4SILAZk758sMncWMnTo3U7nKb0E+Z2MRh5tMZV9STWcu/NMZ5yfZizgJcFjcwj1bcjpW2aygxuncJ2ZQXtx2Mca1TAsWTr449OFjdkWKpIHsaV31keW2LmpWVT/BOB6Fv4S+gm+ZerYcuMG0Kf0IgzwEYUCHbdUXII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EUSJm+Se; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EUSJm+Se"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JBDUES1512405
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=tHHeY
	t7EMeyqUSbnHyESziyZcI0RKe0mNMNJFEBrjUw=; b=EUSJm+SeUPU9zqBR8s1/E
	NnkfYx6jbrzZ/dWW/R/C6GTbt3kAuDxkzMkGlXH9P83wcPNyAVJalOj7jXNBmIwY
	ltDRHPM8zklKFnQabtylXQwhmJgBSR4WiMdjmDZXJwj5zYdGcAfXm1EUFKXFrFeH
	bKc8bMJEuWKwITM77vQV7QOgy2NT16Ho9HrucrKZ8fd9kotnn8Je+7iMhwiMu7Wo
	A7BTkRhtJzU3T4FO9mWrhysnLkfH0ct/JJg8ZRO2nzss9BWxtKo7F/NFZd7/g5Gx
	ElgOVdQoQJEq/sbNQsyjoUyVntD6lxcZDJ9mRmwt8ZRFMAqZi6cTx6qfxXwd4TAY
	Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4br21qabc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60JDoPYu022610
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4br0vc6yut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:31 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60JEIDjm015145
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:30 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-51-213.vpn.oracle.com [10.154.51.213])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4br0vc6ye3-7;
	Mon, 19 Jan 2026 14:23:30 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v4 6/9] stapsdt: add test for listing systemwide probes in object
Date: Mon, 19 Jan 2026 14:22:57 +0000
Message-ID: <20260119142300.975014-7-alan.maguire@oracle.com>
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
X-Proofpoint-GUID: Lig3avROs2ZQ-DIPefjDKeM1AiYKh-kS
X-Proofpoint-ORIG-GUID: Lig3avROs2ZQ-DIPefjDKeM1AiYKh-kS
X-Authority-Analysis: v=2.4 cv=QdJrf8bv c=1 sm=1 tr=0 ts=696e3e64 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=eXpHH4PNQhkuFDgJz9sA:9 cc=ntf awl=host:12109
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEyMCBTYWx0ZWRfX4vuzcALMElQl
 ATn3YXz00PIPOA2oCXPrNurlGUQ+HpQeNhYWYk0gvJkmXlkY07SyCphxmkFc93CBgTtBhWujp5T
 ImSS825tT8WoyErPKsMA16cxNF1ESICsT2t5+RuUhKMys5qm09+fab0tqFlm7u3V/1Ph36X1ypO
 zlgj/eKbEg2LMohEvVh90dYOslHMTj3vd11gI2liStFE2957eDsmHICYFq/L5M3XJ9c2ebf+20O
 PTKwKn0lHqbzuaucO+F495wNhsz+pt9MQWZanlfKPCpies4MiE11I9dxQ6sYpMVGWj03gqkhzMa
 AO8/7kQA47VX39tKwIjmhna2H+9m9hgkgKL92mibElnW1HUU2BrkErwTq5jOKtPvBA9Tuxc6qla
 BA+GFaGyKm4g9YgvKbR7OUZpTJdEZhcaL/jt+b6F0SYBtEIkowfLqRx0/dcKWI4LNvlBftF1sMU
 uEyBrhXEMoyuQ5UfsCEzLUb5qUHnR/wPRbPTh0FU=

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

