Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10E02AD02
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753866126; cv=none; b=u5/ZkVkDAyjv/VykFTH+uwGDKteEIQ5PIVhrhY560u1NauBCS3QrDli1n0rP2ATrL7KPKn0NkMLaY6MYENMXs+41S5xiukhtS7r03ZRaCArijJX4YLamhk9o8ZIoyAVXCMLzB20eEoqSPPCQUBd0SlRGpq0F4Rnj0a/sEbjXM7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753866126; c=relaxed/simple;
	bh=hhKT0boX3vGPy3z/s4ZTbWqGDvWTRoeeQl8OeXLSu+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ocPQAtHO717A/TIHsCxhr37iAWm0yYiNjhxIGRrWjddjXb6Ey96/LEcCrM+Gv8AT3FN6MsHwNj0A4fLzVzhmrRhvUmYXY0KGQP1bWWF+EcMe503QM+Y80ns3IFbn7bLDLLpBFWZLxYnk7b65kXfr4VdaQ0O+p38IYGsYeEhrPdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GcrwtjXM; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GcrwtjXM"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U7gja3008533
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=/NrsT
	eE2btwzVrjbVtcuseTxfrquXoXldP3S4Hs9VmQ=; b=GcrwtjXMawCYO+638RdCb
	ISSFXvFKnlVhsYQwA23lWBeZ3cCxdkuZ2hJks77fq//Ywg79OQs30dnBqk7OIY29
	sfOj2wQsMD+1jl9VBk/CfRVbIaPcGReTKDRNTUUJUkH4Z3jECllWIt5CdYMxR0Yo
	+r7SgP+79H1ysUzCcGLgjp+Z2JEvhjilvBdLf/2FzCFi5HpsTmmo9SnRXr8H3/8g
	Fe9Thprr3KOam7yl/6ARL8GGraRaKM5ZGUVT953ffoHmue9fUlWzm4CCfn8OXYGM
	oKkAheUrEwxbLysDOqMaT/jWIMANUuwOmGxCnlYcsnZs9tdqStPtBdwOTgpeb6tv
	A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q731fvv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:01:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56U8AuIW038464
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:01:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 484nfapvgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:01:57 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56U91nIs033990
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:01:56 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-51-28.vpn.oracle.com [10.154.51.28])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 484nfapvax-6;
	Wed, 30 Jul 2025 09:01:56 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v7 5/7] selftests/usdt: add test covering different forms of stapsdt note args
Date: Wed, 30 Jul 2025 10:01:46 +0100
Message-ID: <20250730090148.2141954-6-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250730090148.2141954-1-alan.maguire@oracle.com>
References: <20250730090148.2141954-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_03,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507300062
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA2MyBTYWx0ZWRfXw7FZbNf8FFI1
 1HcfGNUWl2XvEhAXjG7GrpkpT8Df2ZV6mF/Luclq2UQbwZAw2F5zPdClngD69adBPTkuFfhmv5J
 sGgpFgNgjC0LK4KjMJy5BhAk4r+TIVHdblyumPbDg0Twphpg3pzAYXf7fDFhajv6wBM+Q4U34Iq
 kBu5y/CtEKbmh+pC8MwuT3UI0+V2TaZM+kSEuYVaNerGxq7uHTEjd1DsLvGA2Q47BQFz+m2ypds
 j+l5UEoutg4aQt1Nf62OmpEg/WJ81B0Ta0gszPGYtc7JKscOUWbxIPDKqcO3faL3KvwU8bJSEqP
 2/RRRc/qvl9dTEOHYZIsbcXKxxgCnEghsxsFLexUhqirx+lOj2U+/qBEY6tf6hARGzoJMlIo3F4
 5BafNwlvq3Nr9yKBWe81i4Vg+idfFwaXr02J86I07Hn5vzkR0z4RiTMH68IBiftDF8Hi0W7Y
X-Authority-Analysis: v=2.4 cv=ZO3XmW7b c=1 sm=1 tr=0 ts=6889df86 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=JEC0fJkXhVgF0k8_IpoA:9
X-Proofpoint-GUID: nDiE2La9FAlXcdj6EPx4wLijBQqXcvqX
X-Proofpoint-ORIG-GUID: nDiE2La9FAlXcdj6EPx4wLijBQqXcvqX

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
2.43.5

