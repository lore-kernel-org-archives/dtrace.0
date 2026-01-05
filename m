Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F1E33B6F9
	for <dtrace@lists.linux.dev>; Mon,  5 Jan 2026 12:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616056; cv=none; b=e04hOu4W0THnr9unPNJkAWYeBUSpAwB16WDlo/doXIT2Bqx+Ln0fS8IOK7YXbidEnWAEsfJGQ3t1KxqbDKnQP421pI9ti3r/o6lROX99QTPrjTFa7ioq1oQVgixIT08hv/N7YclsOdBXRPoE3n3ARGdnh980Zm+xNzSWgmVyrjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616056; c=relaxed/simple;
	bh=06sVfuT93vXd7Y98F2691Yqv73QigRKYlySfgrNJpSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gsczc3Lhx2kYfU6pSlzFu5+HMoV7OkCSBJ2orQ1jDkvSR4ml8/vcvmMMR7O1MQa8bfDBofNcYGBj1dRp0oA1h3iI2JkE9UNcqge3ch1jOe5Uvtyg4gQPW/o/kBEBbLIcaGCaA1foT+sBxKb6+YLlTSopvY2ESEkobaMMky8DJdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hrg/wGlK; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hrg/wGlK"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 604N4ajM199353
	for <dtrace@lists.linux.dev>; Mon, 5 Jan 2026 12:27:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=CCj7Z
	HMCXig9ka2werLWT1TzXW4desV/dqZz9iN5/KI=; b=hrg/wGlKZDecFZOu9TtAT
	3tUjs8Yx4aipiPnPKyp44ZQyT7alV8Soq0Ela3wIEVfZ1RI1XL/E/QEcV5Pt86bA
	6x9ZKo9oAFYakjE1USWsx9i2q3s8Zk/Se8zxa9xYS3sB3CeMNPh/nA8zmOmoFerb
	t3afT95LFoPbTG27pY52yhnGCZ90m3GhtxGdqqp/6u4PKSHxMp7MkBb/TWus3Kqi
	JI3e19gimWrhaQyA5gmEP9XPDE1BuQlcbz3CMtYolzViDFd3g83T1xEFYF1u9Vs3
	igu1gl52WsF7C9YllMBbFCQtr4K63AywwzJN5UPWHB3MPaNRYSDTekJ1VFH8Apix
	g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bev1qsn3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 05 Jan 2026 12:27:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 605C02dR015397
	for <dtrace@lists.linux.dev>; Mon, 5 Jan 2026 12:27:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4besj72qbd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 05 Jan 2026 12:27:32 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 605CRTWd034842
	for <dtrace@lists.linux.dev>; Mon, 5 Jan 2026 12:27:32 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-54-206.vpn.oracle.com [10.154.54.206])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4besj72qa8-3;
	Mon, 05 Jan 2026 12:27:32 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2 2/6] test: add systemwide stapsdt note test
Date: Mon,  5 Jan 2026 12:27:24 +0000
Message-ID: <20260105122728.436769-3-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260105122728.436769-1-alan.maguire@oracle.com>
References: <20260105122728.436769-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601050109
X-Proofpoint-GUID: DY4aZiczV8WseGKGEztHWQWv11thzmpu
X-Authority-Analysis: v=2.4 cv=Ec7FgfmC c=1 sm=1 tr=0 ts=695bae35 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=JEC0fJkXhVgF0k8_IpoA:9
X-Proofpoint-ORIG-GUID: DY4aZiczV8WseGKGEztHWQWv11thzmpu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEwOSBTYWx0ZWRfX3+qeXPtwqUkK
 cXTWJeFLr5Oh1vOXT8UstLMX/P8hMEdqnXhdARP5gMKLEtBncgqhJsWdrMtwyKDoAuWxGedJXJR
 hEVwZOBkxZSxz3O1Jeob8DLKyYgoWruge52/VX61BpG0JZuxB2fGBPHd7VREJoDZ5Wil2HeIaHk
 9k48p0obbP5QYYA+Ex/RLNvBkpUDfvf9rxpyfpn41AKTdFv8VXGNZby5PV6zuLNhw7LTqTY/O/1
 TjNr/+hVksbth8WEpCLUW181nHCgTBMZUz/cTV56BA6q2TZKk0Jtx/R/rdGHvzzHdve0uFTaHq5
 jvZQvO2pskWuv/G/RTmocyHC10c2dBRjg1aUS0UrxgToLqd8ISQ+0jEpgLQPF+FdHAkxhSQB2nA
 obuCaYes8VbEXnWH+7gqqvisoK/VXyT6P/SVlD8tEGHeiVjCwsIwxjrc1MNk1JWvaNmBbFjA5sp
 lgsvDJsNlEhxDWI1Ucw==

Add test verifying that systemwide stapsdt probe firing
is detected and we retrieve arguments correctly.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 .../usdt/tst.stapsdt-notes-systemwide.r       |  2 +
 .../usdt/tst.stapsdt-notes-systemwide.sh      | 51 +++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide.sh

diff --git a/test/unittest/usdt/tst.stapsdt-notes-systemwide.r b/test/unittest/usdt/tst.stapsdt-notes-systemwide.r
new file mode 100644
index 00000000..48ee5472
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-systemwide.r
@@ -0,0 +1,2 @@
+test:args:2:./test:val:18
+
diff --git a/test/unittest/usdt/tst.stapsdt-notes-systemwide.sh b/test/unittest/usdt/tst.stapsdt-notes-systemwide.sh
new file mode 100755
index 00000000..2014aceb
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-systemwide.sh
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
+export PATH=.:$PATH
+
+$dtrace -c './test arg1val' -qs /dev/stdin <<EOF
+test_prov*:test::args
+{
+	printf("%s:%s:%li:%s:%s:%li\n", probemod, probename,
+	       arg0, copyinstr(arg1), copyinstr(arg2), arg3);
+}
+
+EOF
+status=$?
+
+exit $status
-- 
2.43.5

