Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B91218ABD
	for <dtrace@lists.linux.dev>; Mon, 28 Jul 2025 16:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753720589; cv=none; b=JfU3OJ2iOLoVX/wVwLd4W3/VAVlHZvZeW2jhMiHPNIRtCGmemUOoG9Bhy8yTmcfjUt9kCQIGaabLRV5TXgvq4GULgzDgyW3QSOVv4idLh81LTLm4yBHGY8HCNqNLrGOcHF1TqERsVZMAY1BTqRf01yOtOeaI8dVwHQkTWhTVQ6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753720589; c=relaxed/simple;
	bh=GnIYdMookfOLC/jxNos9Ah/ANO9kdFXYizHZxNcfMzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oSxsZXTRyxkgqNKHEiBF+95Tjmh9DmnDIbkAxuoBU+0by13d5TvqN8kgJmlaKQdXNXzyvfEPdUQhWPOTn8SDKhgWShaOvL8bZ9Ri17vJ0R0w72YmIoQqznfTo6R3TD8XkBA+1hA2kOVCBevQGolrBOOxQvfI9ACURWeFDw05Un0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZPhdskNN; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZPhdskNN"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SFfnFb003078
	for <dtrace@lists.linux.dev>; Mon, 28 Jul 2025 16:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=xD+HC
	pN992ZGgwAEoFIPgqLkUuOVj/5lvIPnzpsu1lk=; b=ZPhdskNNkvHW+7vQxr6d9
	DuD2ghcyZwzz2W7Z9uF2g9ArDNLAffo3uUAfk+BZcB7IBSJAiZgzXqlxJN0SToX4
	Kh5LnAR7yFMAXe6YKB5B50kd6wPZfklQiKZwU/Xg4XZ8fhbzPKNMvaKkk6y9ePS5
	AMTH7tpoLKqmuioDCo+cpAoUUm5I4Jnx2eyInkAdPYIzJDrH2YDx63qDdeotluRC
	MgZA5+9tNVANsj8+TE+s1Skxka/i2XtBcqI9rOgZrSBZmTgAtN28gEBgCqo4HpuR
	bBYof28SWzpxhtIq+SZcV6dytvGmtA/QZcrRhL5CwflVwtyyVNZ5QLk8ymGOjjrk
	g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q4ydqw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Jul 2025 16:36:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56SFPYjM038378
	for <dtrace@lists.linux.dev>; Mon, 28 Jul 2025 16:36:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 484nf8kf1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Jul 2025 16:36:24 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56SGaEh5007818
	for <dtrace@lists.linux.dev>; Mon, 28 Jul 2025 16:36:24 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-50-230.vpn.oracle.com [10.154.50.230])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 484nf8kesj-6;
	Mon, 28 Jul 2025 16:36:24 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v6 5/7] selftests/usdt: add test covering different forms of stapsdt note args
Date: Mon, 28 Jul 2025 17:36:09 +0100
Message-ID: <20250728163611.1570773-6-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250728163611.1570773-1-alan.maguire@oracle.com>
References: <20250728163611.1570773-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507280122
X-Proofpoint-GUID: 8vu2s0onPVQQey7X40thiffeZwXccvKA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDEyMiBTYWx0ZWRfXzciKqn3oARWf
 WF4E4Sh0kM48xaSL1Ei83yUQqAv8e5OWTLSR4mqnQ6jHGdiNnvE24oe6cimktSml63zBMScT+Vm
 eJgCCYHirIGOUSlUsJ5IdnW+KkRsCpQyNVAyq2HTNmWT+Mk6vlM/8QkMphpw/BSWLKY4E2YwDo6
 m5srLU9fk3AwYD+sFbnVsj0XUBLj9H4dHzydkwpEDfYCALFC3cxhOUwHQS4wM92Ft4JageeLnwj
 9ilKCqUsTRlszb9Cy7e3vJrY4TQ6PZS/IS36RT2avtWFosvThP4HktAIY9LnRoNSD78SoeBoP8n
 iW50j6AItCLabq/7ilY7HOtAn7pvK3HEbAy/Zb0fjJdUUHUpnw+bpEpK3lCj8zVcE5IfvwgChM5
 ZZMDIYlNtyyhUJXQateAZx8GX88SpvPBSSejal4fey2J5IsFSRSrok6nbh0OWY12N379+IiH
X-Authority-Analysis: v=2.4 cv=ZMjXmW7b c=1 sm=1 tr=0 ts=6887a709 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=JEC0fJkXhVgF0k8_IpoA:9
X-Proofpoint-ORIG-GUID: 8vu2s0onPVQQey7X40thiffeZwXccvKA

Add a test exercising various arg types supported by stapsdt notes;
register values, register + offset and constants.  The test generates
a binary with probes represented as follows on x86_64:

Displaying notes found in: .note.stapsdt
  Owner                 Data size       Description
  stapsdt              0x00000048       NT_STAPSDT (SystemTap probe descriptors)
    Provider: test_prov
    Name: args
    Location: 0x0000000000400557, Base: 0x00000000004005f8, Semaphore: 0x0000000000000000
    Arguments: -4@-4(%rbp) 8@%rax 8@%rdx -4@$18

Verify we get expected data for the probe arguments.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 test/unittest/usdt/tst.stapsdt-notes-args.r  |  2 +
 test/unittest/usdt/tst.stapsdt-notes-args.sh | 50 ++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-args.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-args.sh

diff --git a/test/unittest/usdt/tst.stapsdt-notes-args.r b/test/unittest/usdt/tst.stapsdt-notes-args.r
new file mode 100644
index 00000000..42bca19f
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-args.r
@@ -0,0 +1,2 @@
+test:main:args:2:./test:val:18
+
diff --git a/test/unittest/usdt/tst.stapsdt-notes-args.sh b/test/unittest/usdt/tst.stapsdt-notes-args.sh
new file mode 100755
index 00000000..82097808
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-args.sh
@@ -0,0 +1,50 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
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
+
+$dtrace -c './test arg1val' -qs /dev/stdin <<EOF
+test_prov\$target:::args
+{
+	printf("%s:%s:%s:%li:%s:%s:%li\n", probemod, probefunc, probename,
+	       arg0, copyinstr(arg1), copyinstr(arg2), arg3);
+}
+
+EOF
+status=$?
+
+exit $status
-- 
2.39.3

