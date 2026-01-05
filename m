Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE7433B6F7
	for <dtrace@lists.linux.dev>; Mon,  5 Jan 2026 12:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616058; cv=none; b=thXXkr6vMAt7O95nZnfrHhBGAHNxUR4/bewYUkEqSv8lIm6RtTjztPSddSkuCTDL7DmN0P+eegVsZz2S6VbGd7QlDQwXdtfLZRZPV215C0+Yva4XIzBFXZL+XB4QS/juKrxo11UQ/mYg8ZfTEJki+ht5N6zYXvIwM5qtCc16lhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616058; c=relaxed/simple;
	bh=eK0mApaeFC5oydL8qbhodblpdAKe6tVGvLMWpM4UVfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lN1vVeffWbj9Pn53jjzyVB9YowQuurpnDQgU5KRZCCp0KX67a+U1GmXqEzlzVV8RWvHgG1O1kDpzJoGnnQAjeI5C+hpNm60Zh+et+h9otZPXUhcgZANaRbg8dSOfGgpvGJHMsSZit0Zt4R6QbrgHcTYB/FpWsgZs2x+A/tbdPVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hpOraBJG; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hpOraBJG"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6050xYYT065215
	for <dtrace@lists.linux.dev>; Mon, 5 Jan 2026 12:27:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=eKjNR
	E59dSYhUmdZ+ktMW8qaleWSN3cifkSPeAYDl/c=; b=hpOraBJGHA5v/to/v2k54
	O7vPnRRj6QuQ18kifFDOpHJfudHxzKhlR98C8h4BQT7PiwZn51iUSOXS8hFgzvy3
	NjKM6fVYPxmXZDeHoq8mxxwCuQvyF0ljCE90OzSwNEsteuBnPUXc1MXQHH8zmEi8
	UtRA5xAt9DzkgkWBQe5sl+1rgMdK8tqB4JY87slJqlWw4KFFMhc4wPSoPzF84Nof
	11rhP1hgUM0ZHgeMr2efuYt3y9ews0WngLqMDwXxAnZaXg+DQBBt7yiO3arAhVdR
	MK7KQGbqo1smmeeyZ+khac3EPrAQM37S2IJ/Qru8ovLTGtlJ6mpKHmzsUvspudlJ
	w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bev1t9kqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 05 Jan 2026 12:27:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 605AgvHH015445
	for <dtrace@lists.linux.dev>; Mon, 5 Jan 2026 12:27:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4besj72qca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 05 Jan 2026 12:27:35 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 605CRTWj034842
	for <dtrace@lists.linux.dev>; Mon, 5 Jan 2026 12:27:35 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-54-206.vpn.oracle.com [10.154.54.206])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4besj72qa8-5;
	Mon, 05 Jan 2026 12:27:34 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2 4/6] stapsdt: add test for listing systemwide probes in object
Date: Mon,  5 Jan 2026 12:27:26 +0000
Message-ID: <20260105122728.436769-5-alan.maguire@oracle.com>
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
X-Proofpoint-ORIG-GUID: V5UErIjAdMZ543gC-26Egx6Lz7oOsbF3
X-Authority-Analysis: v=2.4 cv=CKknnBrD c=1 sm=1 tr=0 ts=695bae38 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=eXpHH4PNQhkuFDgJz9sA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEwOSBTYWx0ZWRfX6KY54uV7oVx3
 WNtskw+a+BdibYKqtLLZZh7sdZaZdy8q615fH7ZzGfeZueJVCStG8xsiy77Ko7A2fG7O025VlcX
 KApFwV7orP82LBfzWP9geCWt3jsk5OglO/K2SlhAQMopGKUqaTQmIiDc8rw5sFB78BLvC5zSfgd
 d8u/FPVh4SJRV5xKcVcg6mU4kuVWhHts/7g26xOh3BfI2qVdaarIlrCWhRYLWPQfKm9NtTnhx3h
 F4p0fJD0eXVhaaUqhkek5vHXm3d7QaJRnx0QRIvTiYTVSzx8FF0pTMi0tQwBBFU+Xl3U6Pn08jH
 RkoBKpNjmjleIqsepUUiSrdxKH0ciw+4wDK+AnQ5jXADw/2WWOeAu3dgtyii2z/yWmRZoueRVaP
 PhOS+YdlCxsOjq11cdh2TZbpHi+v30c6aOHR8voMrHrK823HsDOG0K5VKOHHbu7561CcrHlauu6
 LEAsB1IFdEJiYXRmPEQ==
X-Proofpoint-GUID: V5UErIjAdMZ543gC-26Egx6Lz7oOsbF3

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
index 00000000..db867c55
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
index 00000000..5c15342f
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

