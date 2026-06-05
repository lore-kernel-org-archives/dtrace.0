Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF9430566F
	for <dtrace@lists.linux.dev>; Fri,  5 Jun 2026 22:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697548; cv=none; b=Dnt35AVtq+UznNA7ow2GfXpe95jp16L4oqaZM22czcElCdIO6wbEsarNbydUmUrdh/lKA965m67EH0Jsoyx0OY4FejdMGj0VwkKyanmFOOczcMMNZnTtb1ae8SNws+9vdtHn+J8nq/CvpbVkCAJJrp+mYMMFY5eCjeIBt1j/5nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697548; c=relaxed/simple;
	bh=ebA6GPlSoG6TrP4eRQnpdLxA7Rv+KvpyLtoNIioJNkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e7GqpVzrqqFxkXNTlP+U9/o/rPXgpQGnL77jMsKcxhk90Xcvqlp9IJfeGAhM319tayOC3nMKyAB8yrk//MKPZW/f53EzjKufNapQqMUvGeyNvItsiMTlzZkt0dFPvFZD/Tyv6+tA5gslOvgpLTi1TdvklabEMZ+N95cLxCSQODc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EWh2nFzn; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EWh2nFzn"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 655IXww61823831;
	Fri, 5 Jun 2026 22:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=af7hr
	9RnzpNDT7tK61pqYLGb+03fejXrF09+cAVg1mY=; b=EWh2nFznRxqiWAW5AJY2i
	n9bEQDyRqdzSB1lfddrhHDsqNEgeZ0y7wVQrKAZSxR6TeZfbQHBBYSyg7pKz33Da
	87uZ8VVK0G1OUll6c2BtxhKovcf+w8qICA0WYVUm6tSfHu/SEOyAqOuljSsbefco
	0LIHvMFFDnkMQemXSFDC2MMUUW3pqg10hG7CyH3I6GLAgIjwUKiMb5Fr1Fyj08vb
	wonDmFNUz+JnOW2g30k5HZYi0ZU3Gb3x2CTislzSdANruhjXnB0qJzMH1a4fLN95
	bMXRA/GvTyq7AuWqU+Z9611m++rFye1sdLeHuV46p49tzwR2a8HzlOZUZazBUZV4
	g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4efqs6tv5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Jun 2026 22:12:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 655MAPT7032945;
	Fri, 5 Jun 2026 22:12:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ek326nvxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Jun 2026 22:12:24 +0000 (GMT)
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 655MCIuw039322;
	Fri, 5 Jun 2026 22:12:24 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-53-60.vpn.oracle.com [10.154.53.60])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4ek326nvu6-6;
	Fri, 05 Jun 2026 22:12:23 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>,
        OpenAI Codex <codex@openai.com>
Subject: [PATCH 5/6] test,funcs: add uresolve() tests
Date: Fri,  5 Jun 2026 23:12:16 +0100
Message-ID: <20260605221217.1211791-6-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260605221217.1211791-1-alan.maguire@oracle.com>
References: <20260605221217.1211791-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2605130000 definitions=main-2606050219
X-Proofpoint-ORIG-GUID: exFxW7jJ8yRoOwsge6V2aRilDoV16u67
X-Authority-Analysis: v=2.4 cv=POQ/P/qC c=1 sm=1 tr=0 ts=6a2349ca b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=yPCof4ZbAAAA:8 a=LG5T7v2SAAAA:8
 a=WpdpMKT01fetNpuYkVEA:9 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22
 cc=ntf awl=host:12313
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDIxOSBTYWx0ZWRfXwsp3H0UAfWmP
 A3TAAzmv4iXqz8vTR7Bi2+0ZVo+3EGuSbX7M7MD3KvPyS27R/p4OTuJHzNkHGYUTJU8KwsGm4mK
 RGmMW0mMG6AOF1mDuRieETzgl3HHempzk5WxmwdFCmkTPK+o7FZmq2R00TTbGP7OWkaIOB0U2Me
 IVSjAAX0PHY0+foCb8QKRdILqbwsjPJHJzSrA7HIbM3iGLpQJvSbMwodvlu49J8/weaH/NOaKAX
 ZTz+Z+mpoZNhHkqEe3ZK5xYGXbGXqIgtjAcsR7VXCCqNgqeEYKHEAhgx1BCrdHvpNNugz5Cc6RF
 EzXDETzPXatkdfnohYhOjCMc9zaf5k/8EVt/tBx4IcYxx5u2vnTfwL/KiT7N8eUPWmhjApI+Oj4
 B6nuv99NJh/T5rpZFmdU4m4wNidpyrwMjiFkwNxgQQne3kGdMnzemBj2pqfcnPvAPYrn/wCTgDH
 eQrB+hUSjRzfp7ccRkV6qkaV2PHtzJw+pF+0fatE=
X-Proofpoint-GUID: exFxW7jJ8yRoOwsge6V2aRilDoV16u67

Add test for uresolve() symbol lookup failure with/without fallback.
Also add positive test which does per-target and systemwide context
uresolve() lookups, ensuring expected value is found.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
Assisted-by: OpenAI Codex (GPT-5) <codex@openai.com>
---
 test/unittest/funcs/uresolve/err.nofallback.d |  21 +++
 test/unittest/funcs/uresolve/err.nofallback.r |   2 +
 test/unittest/funcs/uresolve/tst.fallback.d   |  25 +++
 test/unittest/funcs/uresolve/tst.fallback.r   |   2 +
 test/unittest/funcs/uresolve/tst.positive.sh  | 144 ++++++++++++++++++
 5 files changed, 194 insertions(+)
 create mode 100644 test/unittest/funcs/uresolve/err.nofallback.d
 create mode 100644 test/unittest/funcs/uresolve/err.nofallback.r
 create mode 100644 test/unittest/funcs/uresolve/tst.fallback.d
 create mode 100644 test/unittest/funcs/uresolve/tst.fallback.r
 create mode 100755 test/unittest/funcs/uresolve/tst.positive.sh

diff --git a/test/unittest/funcs/uresolve/err.nofallback.d b/test/unittest/funcs/uresolve/err.nofallback.d
new file mode 100644
index 00000000..5d6a1e87
--- /dev/null
+++ b/test/unittest/funcs/uresolve/err.nofallback.d
@@ -0,0 +1,21 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: longsleep */
+
+/*
+ * ASSERTION: uresolve() withot fallback for unknown symbol fails.
+ *
+ * SECTION: Functions and Variables/uresolve()
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	x = uresolve("a.out`__dtrace_no_such_symbol__");
+}
diff --git a/test/unittest/funcs/uresolve/err.nofallback.r b/test/unittest/funcs/uresolve/err.nofallback.r
new file mode 100644
index 00000000..b93f9f78
--- /dev/null
+++ b/test/unittest/funcs/uresolve/err.nofallback.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/funcs/uresolve/err.nofallback.d: line 20: failed to resolve target user symbol a.out`__dtrace_no_such_symbol__
diff --git a/test/unittest/funcs/uresolve/tst.fallback.d b/test/unittest/funcs/uresolve/tst.fallback.d
new file mode 100644
index 00000000..a2d5e203
--- /dev/null
+++ b/test/unittest/funcs/uresolve/tst.fallback.d
@@ -0,0 +1,25 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: longsleep */
+
+/*
+ * ASSERTION: uresolve() returns its optional fallback value when a target
+ * user symbol cannot be resolved.
+ *
+ * SECTION: Functions and Variables/uresolve()
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	x = uresolve("a.out`__dtrace_no_such_symbol__", 0);
+	y = uresolve("a.out`__dtrace_no_such_symbol2__", 0xdeadbeef);
+	printf("%lu %lx\n", (unsigned long)x, (unsigned long)y);
+	exit(0);
+}
diff --git a/test/unittest/funcs/uresolve/tst.fallback.r b/test/unittest/funcs/uresolve/tst.fallback.r
new file mode 100644
index 00000000..a224d874
--- /dev/null
+++ b/test/unittest/funcs/uresolve/tst.fallback.r
@@ -0,0 +1,2 @@
+0 deadbeef
+
diff --git a/test/unittest/funcs/uresolve/tst.positive.sh b/test/unittest/funcs/uresolve/tst.positive.sh
new file mode 100755
index 00000000..a552695b
--- /dev/null
+++ b/test/unittest/funcs/uresolve/tst.positive.sh
@@ -0,0 +1,144 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+# @@timeout: 80
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+DIRNAME="$tmpdir/uresolve.$$.$RANDOM"
+holdpid=
+firepid=
+
+cleanup()
+{
+	if [ -n "$holdpid" ]; then
+		kill "$holdpid" >/dev/null 2>&1
+		wait "$holdpid" >/dev/null 2>&1
+		holdpid=
+	fi
+	if [ -n "$firepid" ]; then
+		kill "$firepid" >/dev/null 2>&1
+		wait "$firepid" >/dev/null 2>&1
+		firepid=
+	fi
+}
+
+trap cleanup EXIT
+
+fail()
+{
+	echo "ERROR: $1"
+	if [ -f D.out ]; then
+		echo "==== DTrace output"
+		cat D.out
+	fi
+	cleanup
+	exit 1
+}
+
+mkdir -p "$DIRNAME" || exit 1
+cd "$DIRNAME" || exit 1
+
+cat > prov.d <<EOF
+provider uresolve_tst {
+	probe go();
+};
+EOF
+
+cat > main.c <<EOF
+#include <signal.h>
+#include <string.h>
+#include <unistd.h>
+#include "prov.h"
+
+volatile int uresolve_tst_value = 0x12345678;
+
+__attribute__((noinline)) void
+uresolve_tst_fire(void)
+{
+	URESOLVE_TST_GO();
+}
+
+int
+main(int argc, char **argv)
+{
+	int i;
+
+	if (argc > 1 && strcmp(argv[1], "hold") == 0) {
+		for (;;)
+			pause();
+	}
+
+	if (argc > 1 && strcmp(argv[1], "wait") == 0) {
+		for (i = 0; i < 400 && !URESOLVE_TST_GO_ENABLED(); i++)
+			usleep(50000);
+		if (!URESOLVE_TST_GO_ENABLED())
+			return 2;
+		sleep(2);
+	}
+
+	uresolve_tst_fire();
+	return 0;
+}
+EOF
+
+$dtrace $dt_flags -h -s prov.d || fail "failed to generate USDT header"
+$CC $test_cppflags -O0 -fPIE -fno-inline -c main.c ||
+	fail "failed to compile test object"
+$dtrace $dt_flags -G -s prov.d main.o || fail "failed to generate USDT DOF"
+$CC $test_ldflags -fPIE -pie -Wl,--export-dynamic -o main main.o prov.o ||
+	fail "failed to link test program"
+
+$dtrace $dt_flags -q -c ./main -n '
+pid$target:a.out:uresolve_tst_fire:entry
+{
+	this->val = (int *)copyin(uresolve("a.out`uresolve_tst_value"),
+	    sizeof(int));
+	exit(*this->val == 0x12345678 ? 0 : 1);
+}' > D.out 2>&1 || fail "pid target uresolve failed"
+
+$dtrace $dt_flags -q -c "./main wait" -n '
+uresolve_tst$target:::go
+{
+	this->val = (int *)copyin(uresolve("uresolve_tst_value"),
+	    sizeof(int));
+	exit(*this->val == 0x12345678 ? 0 : 1);
+}' > D.out 2>&1 || fail "target USDT uresolve failed"
+
+./main hold &
+holdpid=$!
+sleep 1
+
+$dtrace $dt_flags -Zq -p "$holdpid" -n '
+uresolve_tst*:::go
+/pid != $target/
+{
+	this->val = (int *)copyin(uresolve("a.out`uresolve_tst_value"),
+	    sizeof(int));
+	exit(*this->val == 0x12345678 ? 0 : 1);
+}
+
+tick-1s
+/i++ > 30/
+{
+	exit(1);
+}' > D.out 2>&1 &
+dtpid=$!
+
+sleep 1
+./main wait &
+firepid=$!
+wait "$dtpid" || fail "system-wide USDT uresolve with target failed"
+wait "$firepid" >/dev/null 2>&1
+firepid=
+
+cleanup
+exit 0
-- 
2.43.5

