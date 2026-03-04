Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFD038657B
	for <dtrace@lists.linux.dev>; Wed,  4 Mar 2026 08:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611296; cv=none; b=NlCM97r2JGPqFLmnX0ZXH5M8BH4/z2dnMeqs4MMTqqJ7cl37Th75VyRSlrZBCqGjvskmuL6xOeOmLjuMCPBwfN72qQ16j7uAu07OuHTU0d/r4q/2YR8Rzyk7rGkrJ4g+oRDDqpnfg6XoNAt7jo9MB827D5Hp95mRJelhugIkRLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611296; c=relaxed/simple;
	bh=3SwmpVdIxIru1cKpW9/uYG9FmPxjfs9ua9knX6zw5Ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JVUr9kGtP/0wA6QTb84bG77cAhWuztdwAMokYbtoa2rjxE2TPNNtbftePTkoBBktGEnFfS3lzJk9oeXUb7ryhMJJzhtr82ki43VDTTUN/PRf14LsXNd4Y3xJR3GUm81hGM5bNuCQ5lTTBklLKBdly3k7ql4MK9m0d+IyGl9dUqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=K9ub5f+R; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="K9ub5f+R"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6247hF0k2303789
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=tHHeY
	t7EMeyqUSbnHyESziyZcI0RKe0mNMNJFEBrjUw=; b=K9ub5f+RyPoFZr4jQBizL
	D/8L9xY6qkoi1iEWZU2NGpjC6ZjXQu2Ih/OnLMZwBL4BTRzMD0fkC4louxc0YjGK
	OeE6JJIMt/b6yAyXDd1dNjHVm+kVQQOtPhNBGIzjj9QM447Fk7saoYbZYqfpggdw
	4MsoKL02BRpX+pHo1koi7Jzh/M45M7+3MndYkvZh1BxcyR8vZ0svDHg3+Z7l7QPO
	jbHeLCifj8JOg6pPV+PUGqKa2g2cA0WbICWvDjKCXWm9mPcilft+r6Z8PQlJTvPw
	ZA9u/oGI4UDOYc6ZvcK/pJRWb+NqacMIMRQRQSVHgtS9EzajLqqFSaMa9VafIiAv
	w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cpgkjr0sy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 08:01:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6246p0KT001588
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:01:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ckptfs317-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 08:01:33 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62481RYp023337
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:01:32 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-62-133.vpn.oracle.com [10.154.62.133])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4ckptfs2t1-7;
	Wed, 04 Mar 2026 08:01:32 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v5 6/9] stapsdt: add test for listing systemwide probes in object
Date: Wed,  4 Mar 2026 08:01:22 +0000
Message-ID: <20260304080125.649031-7-alan.maguire@oracle.com>
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
X-Authority-Analysis: v=2.4 cv=GvtPO01C c=1 sm=1 tr=0 ts=69a7e6dd b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=3I1J8UUJPc9JN9BFgKH3:22 a=yPCof4ZbAAAA:8 a=eXpHH4PNQhkuFDgJz9sA:9 cc=ntf
 awl=host:13812
X-Proofpoint-ORIG-GUID: 4oeVfqeabJTEhdFCOFHJc0PEPi-dev3M
X-Proofpoint-GUID: 4oeVfqeabJTEhdFCOFHJc0PEPi-dev3M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2MyBTYWx0ZWRfX/iTsb4upikm2
 8WQfYYVihe0+kLVpPQJnbZWkeN9tWUriHQgA7bzWvVytlJ3HjV27XQGdfK8CVBmFhFUoL7ep/kz
 ihIrwXlF4DmSe+31iBsAbKTuezk5jTSOL4iJTOhxqBPjrFT6eJcMk5JHDnwbLyiaN94SZIVTCCc
 FaOUs0XlZXpk3u+4EX2EtPqASMVtH70nCBNwz1TCizH6BODCdNuUci0JarD8kiroVqKFfzNSIwb
 P6g+oNKlClTQaqNK3DFXnjlwMmpbDX2lswUHP/brzfIVGtzyQn5vyWthtsBO1ZnCw15h0+HhYOH
 z3SM5hQ1hDIx35fN6Er4O3gcr9G3ZaJJIosa2gKBsDjKOgf+7jMDt9YTxrfQLsnxlVTtitqKW13
 wT3GPV8MOOKQ40eRS15nEcr2xXAZV1GefJiaInaYcjcFE0q3RMHE39Bw2MPGW8SHG7DpK8Dsgqt
 zHMdJSoxIacVq7NJjlotxtDBtu5kc2dM8oVN5LBI=

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

