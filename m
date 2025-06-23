Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1786623909F
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 10:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750673603; cv=none; b=MKsJqOA8HLbxnmsPz6gvONkRzJLEapGVUqk9kWTBykuT5KO2YhvQFS6QtsARixcv+CQIlM3M8CH+ocMHE1H9dEPwM6QW431pEw6sU76IKb2zy5/w1k0IJgxz6sNdOagOp5JQKvpvXNiupdthpkVr9nAsZKD6dASp6RrwqQBfpxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750673603; c=relaxed/simple;
	bh=hhKT0boX3vGPy3z/s4ZTbWqGDvWTRoeeQl8OeXLSu+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hq+3zemc9XkNMY2ix2vIZUcR7w14mAtedsI3xyZRA0LTG2TsxJRpcL0ziROlDiBrQ+9XUPv4PycJU+M3/SYA5sVEVcWRjg8RzwHYcwxABlr+kDWjgx+FgfVyIMSTdpTIkoVMYDjIuYfSJSOLnwYEQlHj95+2vNuSS6kLDs6+vDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KKkpKNTo; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KKkpKNTo"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N8ppQN030947
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 10:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=/NrsT
	eE2btwzVrjbVtcuseTxfrquXoXldP3S4Hs9VmQ=; b=KKkpKNToGdbZeoMGE7Sk3
	MQO5BHzVdSyLx1SWCUu3eIGztsAyqBFa6B0aHXwpx0+2QGw6EoeD71zZFK9JvQeQ
	NALielurLTawJ/VscEQ1JzB7Y8gMRU6usiTtDHktxH2C/ZeQQOpcnvBShyf7dJRN
	Q7+i7xOAEnFlIFWyOj9cVY9obYWw9TWaaaCav8yQco6fADKbNL5f7GAn1IVxvny7
	orjong7/3QN9+25bcInHSAit4DnTts0iHOFgf8B+x7xZRV+G/6SGqQgCOWvKGK3s
	c1aRYW8uNy18IV2xJLrK0XItaiT1zBdJgtN8C7yXPMoxLIXxaTuiFv7CjBYNc88O
	w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8y2cs9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 10:13:21 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9K489005022
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 10:13:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq25ef3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 10:13:20 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55NADCnx007270
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 10:13:19 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-58-219.vpn.oracle.com [10.154.58.219])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47ehq25ebq-6;
	Mon, 23 Jun 2025 10:13:19 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v4 5/5] selftests/usdt: add test covering different forms of stapsdt note args
Date: Mon, 23 Jun 2025 11:13:10 +0100
Message-ID: <20250623101310.1649756-6-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250623101310.1649756-1-alan.maguire@oracle.com>
References: <20250623101310.1649756-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506230060
X-Proofpoint-ORIG-GUID: 86ttK2tExm7t5hSlwgfIOHzzCXiNH2en
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2MCBTYWx0ZWRfXzOL7pCE1yBVU oLiIhNg7OA5xFUZQ1iEhsBQL46NEPKEkrZGjO/FVJl+10/BUneYetGdxAyw4/qNte2dHGyYt0Qn RsgFrYIrzBmET+S/DCP8Qrra66Xjm/82xHRcZ20yUgYjbmhad/UAfo1Cfvto9zulqe3LB6KG1UD
 ykf6vPOHgHx3eTDsQRbDzs7svTFzVMf3Yqw2ihsLuH+Ddvo/kFMuHjwJCqvgn6Y9Vl1LegbvydS WB9hqGGICF7Br3R0J0aCvK7TMmarKZxtaAr3+ZX40D6lHGN9wxziRqGquG/di3IINe+VhBSbMiE rqs4FNfjCDtBoNJl28ikseX6sstpXcnXruVWKy/ld0Am9y5l83++v6SXwC8GFDwmfg8SyuXR26d
 2PJ/LEs37+zYn3reo84Es9Ccx94QBHKrBs4xYnoLGk9x8f9osaX4VbjsywnwvDzUswYCPcYb
X-Proofpoint-GUID: 86ttK2tExm7t5hSlwgfIOHzzCXiNH2en
X-Authority-Analysis: v=2.4 cv=PqSTbxM3 c=1 sm=1 tr=0 ts=685928c1 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=JEC0fJkXhVgF0k8_IpoA:9

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

