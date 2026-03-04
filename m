Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58E33890F8
	for <dtrace@lists.linux.dev>; Wed,  4 Mar 2026 08:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611297; cv=none; b=X9RxuCDNyQ69ZW0vJhMXk5mZJ2aqvmBYqODwiHV4nGmqy2JZEqJ8JAEEWSSXqgHKMyQp6bPkrqlwPKOIY/ADhHZ1OZ0Fk5M28DNz1lsVCYRZJayKamRN4PInmPZQt4IjGVNZMVRxqHgQjwFBk2gGEu653blHr/ShAVEnQpsBkaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611297; c=relaxed/simple;
	bh=d69JIeEjBNj4DOPdgGmc7KIMG3r+IidGALqygAHK0xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cyBBeKwozcgeete40287F0kBZor7DBD1EWxdVzGW3gqMcsVHerl27YFWwzvrw0z0tNhSCZQmVx36/VDttXbtU/WcaCf46TAZpASjusxrGof/yAofmc11BXhkz2vDie2OSHHtlgDZJDrCd1x2jIW9lhVdPpEEdqKysHpYK82pAXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=E0iM41eH; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="E0iM41eH"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6247acxu3540323
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=cU2jY
	STB3Fae8wbX2k7MOURnClCA2ooBEA3FS0eyXwM=; b=E0iM41eHeQu1RK45Z2dLr
	jb4XztHYaIFO+JGsOUhhhJUurC5mpZzqRQsKDR/Wi97a3SwbpK4lwuDjnRe5cdgm
	6nzbpZlBksZVqQWCxeD+HlB4EJuQJqC4TjayajUa95znj7Q1JNIoCkWZMjqrc1z5
	9RYIeFdz0sz++sM4Rkl24cXdUpoOvbk6bDhdDPf+nH+JPdjfNyKf2gheUoMn8lS7
	Va/sj0mZas5gAPW66fHWsuaBK+ugnIJrsXvxwzoC0Zox53MfpDCcyjNvX6FEXcvS
	d9W5jl6i2rl4iNaLTF1bimHgPiv3tEW7iK+cG02VVnc7b/5fWMYL3cdXi/YMI0Mq
	w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cpgge81be-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 08:01:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6246hlSn001521
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:01:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ckptfs31r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 08:01:34 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62481RYs023337
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:01:33 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-62-133.vpn.oracle.com [10.154.62.133])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4ckptfs2t1-8;
	Wed, 04 Mar 2026 08:01:33 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v5 7/9] stapsdt: add test for listing systemwide probes in absolute path object
Date: Wed,  4 Mar 2026 08:01:23 +0000
Message-ID: <20260304080125.649031-8-alan.maguire@oracle.com>
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
X-Proofpoint-GUID: vFSiov2V22XxSvF0I-Y0SEANVDqrbbmn
X-Authority-Analysis: v=2.4 cv=YLSSCBGx c=1 sm=1 tr=0 ts=69a7e6de b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=BqU2WV_vvsyTyxaotp0D:22 a=yPCof4ZbAAAA:8 a=gfbp12JJLI_0ST-XH08A:9 cc=ntf
 awl=host:13812
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2MyBTYWx0ZWRfX9RsjZ8AtJc9b
 GQPdLei+5ntOwi9zi0TUFsC88pQpyJL8gFykmncdjRkBCv53+05W4DxtkrvYA9UGXPSScPOR7JB
 eJu9WEnBqkp6LAvS9A4Hd6yJ5S8UNpEX2P34trFAiFaOZhzSRsRdnK3fy9H33glO1gqAShwSazx
 WbcF5xqLbOUrEOpUrYQGo2tV2Y8kFaTTNcbe4AEPHgPQLyoRyszSZVkKVXj2NOG2C/1Qnh1eF1S
 IG3UZ4yst0npWHd7guIjARrMw14Zc3NE/kc/PY4E+GSkjkTox//ebJJaqvu5O77zVlq+Hf3qVcE
 zR3PdItKwhuvI6G6GoFNPnogn/M4gb9LAM3voT9U9JUVMa0sC/LkV+cQfM5wjWcfu2znHDXj6I5
 iK699apuQbPLz8kvOFrvB/PLowD7Zu4thiUxhe4Y8mmJ/QvP6x0JPYZWgrpNxShPJcw/eJ/owzb
 sRpRhKRWEprBUL5nk/gLn5J17X5ASU+pwfAyItNg=
X-Proofpoint-ORIG-GUID: vFSiov2V22XxSvF0I-Y0SEANVDqrbbmn

Verify using an absolute path for listing succeeds for -l and -lv.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 .../tst.stapsdt-notes-systemwide-l-abspath.sh | 48 +++++++++++++++++++
 ...tst.stapsdt-notes-systemwide-lv-abspath.sh | 48 +++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-l-abspath.sh
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-lv-abspath.sh

diff --git a/test/unittest/usdt/tst.stapsdt-notes-systemwide-l-abspath.sh b/test/unittest/usdt/tst.stapsdt-notes-systemwide-l-abspath.sh
new file mode 100755
index 00000000..878e8502
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-systemwide-l-abspath.sh
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
+TEST_PROG=$(pwd)/test
+
+$dtrace -lm test_prov\*:$TEST_PROG
+status=$?
+
+exit $status
diff --git a/test/unittest/usdt/tst.stapsdt-notes-systemwide-lv-abspath.sh b/test/unittest/usdt/tst.stapsdt-notes-systemwide-lv-abspath.sh
new file mode 100755
index 00000000..d0ff3e84
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-systemwide-lv-abspath.sh
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
+TEST_PROG=$(pwd)/test
+
+$dtrace -lvm test_prov\*:$TEST_PROG
+status=$?
+
+exit $status
-- 
2.43.5

