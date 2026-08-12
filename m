Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5030B332601
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786540946; cv=none; b=K+TDMtj45YUW1TxFgCpc8BDZ3Ri2vHepiannjiV1CqgTr8YyGzE/Spg8bwIstrOv8nc8XKjlIC2vZQtOFKemTJxqeApG3V0jnH87SdfTRWKfk40P3/Hg9E2ajoxynqj4BXhePnvGXsb6I4HZMlt6d0r44FlNaABCWCrbsMRFTfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786540946; c=relaxed/simple;
	bh=QeW+PkFnb4S2b85Vtirj89EtvNt3tg8TOagh666KvBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GegSbcRQ+qbQvrE6e0cXGDFU6GB0t1M59XP8tmjqgxITpfrUWdQCJDbKwUJgnv8u6SHKO56ahpQst31NMPorHn6soqldr5p0RvA/ZdyRcIW8nZmAUMbmHSJVCI11rlH54agR+yLzgTMHhTWnsL7GxEw0m7P2cuARYLqmstkhy4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aq6ctgeJ; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aq6ctgeJ"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BLeZwC3271014
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=FDbdo
	Q4RUrzxt3nLgaWPGlk8e/shp94phD+/Jh3OA/Y=; b=aq6ctgeJ1JYqiGifOrkLx
	8X63uxgqwtKBg/aShZlXKCqsx4cCfVw/7HBug/tW7fndxGt2vpfUcmv8YZznByLI
	ZJ/CDsdKTAbyCF+2PfKbpI9Cf8IBIAXaDnNGJUFS2nbv9InXd7XQSfulriFoQ98g
	xHiKoAEvnRuwcp0CEimo4kvmlGx+NzJIBYcIIk3PbcNcMi4C1s3NU6okR/YrB5uP
	MJBVOLs8RXhqR2z0RTJYGSmlvRO3/WYybNV3F9diLhvKis9jwbgZHoUobqJ7bvNW
	wI4hFchNqilkub5eWvc72AQ0JJbiGh8v7jDHubFav1kS4SsMs0M5323uoYBQluig
	g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4fww0sxp7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:23 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67CDKgRb002445
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4fwtwsse69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:22 +0000 (GMT)
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67CDMEBx010792
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:21 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-57-125.vpn.oracle.com [10.154.57.125])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4fwtwsse20-8;
	Wed, 12 Aug 2026 13:22:21 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v4 7/9] test: add tests for python bindings
Date: Wed, 12 Aug 2026 14:22:08 +0100
Message-ID: <20260812132212.527871-8-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260812132212.527871-1-alan.maguire@oracle.com>
References: <20260812132212.527871-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608120109
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEwOSBTYWx0ZWRfX5IaWhtAv3rgU
 eZAbDwz6g9ETb88owIeGXvFDpH5vEIqQ0Dxz7SZEUBAktyOf9uq8eJSlveNsqdM5HHA1WwWLT2O
 s28GvvXUAug2dTelPgCXulMG13/ey1hqSpzKTeWNTKeL+WAkZm75
X-Proofpoint-ORIG-GUID: h9_R50IdKpDi4-UF0CR8czNnHoE58p7Q
X-Proofpoint-GUID: h9_R50IdKpDi4-UF0CR8czNnHoE58p7Q
X-Authority-Analysis: v=2.4 cv=FcAHAp+6 c=1 sm=1 tr=0 ts=6a7c738f b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=7Gl3-_t3PgB9XO-mQDs3:22 a=yPCof4ZbAAAA:8 a=2RSktCCaafP5T8_Xz6UA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13509
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEwOSBTYWx0ZWRfXw0DrXtlYhx+X
 bXCIMdlwAlo9M3n2tJWO7bHD7O6nyr2v6IoUWhInFqXd5g/CEsYSSQp5x7jxd27GXUlHE9OGmrz
 Yd0tJg0eOKZVf7vuO7bcjfdhkd0+Ork733Xk3mdSX0Gl5dMFml3UfqSgtmUFiGViJoPnMPl3ekd
 PjtHzhH98DfjNraD4iPU4zSSCoVFh6MV59CLeGzkc6mmsalPTfJKx9NNeHQm6Y+bJGFVn0Osd+2
 4TpY041AsC8B9bA6aNQZ4eyxRIFrgR5Nn9NtedGn0ILcIl5iQ1ETeqxbGLLuP6Mujfs4sUv1IV+
 Wb7dHBPfl8ActlpUwV3kDgf48FoQLYV9tMawkCo5gaW0SMTWeZ0UVqcPrNn/DiOJsd4dgQPNq+D
 JvVBjN1o/4l5mzJIbINmV2/pVERejJnVzWwDJvrhiT9OK4D0my5C4oh4jy42Y4mZz9Q/ijOboHc
 1qVvagtiPI8jdvtqBVtBCRc4ul5WnLFpVPGGnpks=

Add tests covering aggregation snapshot, update, handling of
stack keys.  Also test process creation/grabbing, and ensure
we detect processes going away or exit() calls in dt.work().
Also ensure that multiple sessions can exist in the process
image, and that closing a handle does not effect operation of
another handle in the same process.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 test/unittest/python/tst.aggr-actions.sh      | 133 ++++++++++++++++++
 test/unittest/python/tst.aggr-change.sh       |  75 ++++++++++
 test/unittest/python/tst.aggr-stack.sh        |  61 ++++++++
 test/unittest/python/tst.aggr.sh              |  58 ++++++++
 test/unittest/python/tst.exit.sh              |  64 +++++++++
 test/unittest/python/tst.multi-session-end.sh |  75 ++++++++++
 test/unittest/python/tst.multi-session.sh     |  58 ++++++++
 test/unittest/python/tst.proc-create.sh       |  56 ++++++++
 test/unittest/python/tst.proc-exit.sh         |  57 ++++++++
 test/unittest/python/tst.proc-grab.sh         |  81 +++++++++++
 10 files changed, 718 insertions(+)
 create mode 100755 test/unittest/python/tst.aggr-actions.sh
 create mode 100755 test/unittest/python/tst.aggr-change.sh
 create mode 100755 test/unittest/python/tst.aggr-stack.sh
 create mode 100755 test/unittest/python/tst.aggr.sh
 create mode 100755 test/unittest/python/tst.exit.sh
 create mode 100755 test/unittest/python/tst.multi-session-end.sh
 create mode 100755 test/unittest/python/tst.multi-session.sh
 create mode 100755 test/unittest/python/tst.proc-create.sh
 create mode 100755 test/unittest/python/tst.proc-exit.sh
 create mode 100755 test/unittest/python/tst.proc-grab.sh

diff --git a/test/unittest/python/tst.aggr-actions.sh b/test/unittest/python/tst.aggr-actions.sh
new file mode 100755
index 00000000..8fd22c8c
--- /dev/null
+++ b/test/unittest/python/tst.aggr-actions.sh
@@ -0,0 +1,133 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# Ensure aggregation actions return expected values.
+
+if [ $# -ne 1 ]; then
+    echo "usage: $0 <dtrace>" >&2
+    exit 2
+fi
+
+dtrace=$1
+
+tmpdir=$(mktemp -d)
+cleanup() {
+    rm -rf "$tmpdir"
+}
+trap cleanup EXIT
+
+cat >"$tmpdir"/script.d <<EOF
+#!/usr/bin/env python3
+from pathlib import Path
+from subprocess import Popen
+
+from dtrace import DTraceSession
+
+prog = r"""
+BEGIN
+{
+    @counts = count();
+    @counts = count();
+    @counts = count();
+    @sums = sum(100);
+    @sums = sum(50);
+    @sums = sum(32);
+    @avgs = avg(4);
+    @avgs = avg(5);
+    @mins = min(100);
+    @mins = min(99);
+    @mins = min(101);
+    @maxs = max(12);
+    @maxs = max(19);
+    @maxs = max(-4);
+    @stddevs = stddev(5000000000);
+    @stddevs = stddev(5000000100);
+    @stddevs = stddev(5000000200);
+    @stddevs = stddev(5000000300);
+    @stddevs = stddev(5000000400);
+    @stddevs = stddev(5000000500);
+    @stddevs = stddev(5000000600);
+    @stddevs = stddev(5000000700);
+    @stddevs = stddev(5000000800);
+    @stddevs = stddev(5000000900);
+    @quants = quantize(1);
+    @quants = quantize(2);
+    @quants = quantize(1);
+    @quants = quantize(3);
+    @quants = quantize(128);
+    @lquants = lquantize(1, 1, 10, 2);
+    @lquants = lquantize(3, 1, 10, 2);
+    @lquants = lquantize(1, 1, 10, 2);
+    @lquants = lquantize(9, 1, 10, 2);
+    @lquants = lquantize(9, 1, 10, 2);
+    @lquants = lquantize(1, 1, 10, 2);
+    @llquants = llquantize(1, 3, 1, 4, 3);
+    @llquants = llquantize(26, 3, 1, 4, 3);
+    @llquants = llquantize(2, 3, 1, 4, 3);
+    @llquants = llquantize(13, 3, 1, 4, 3);
+    @llquants = llquantize(6, 3, 1, 4, 3);
+    @llquants = llquantize(81, 3, 1, 4, 3);
+    exit(0);
+}
+"""
+
+with DTraceSession() as dt:
+    p = dt.compile(prog)
+    dt.enable(p)
+    dt.go()
+    pid = Popen(["/bin/sleep", "1"]).wait()
+    dt.stop()
+    dt.agg_snap()
+    rows = dt.agg_walk()
+
+if not rows:
+    raise SystemExit("no rows returned")
+
+for row in rows:
+    if row["name"] == "counts":
+       v = int(row["value"])
+       if v != 3:
+           raise SystemExit(f"unexpected count value {v}")
+    if row["name"] == "avgs":
+       v = float(row["value"])
+       if v != 4.5:
+           raise SystemExit(f"unexpected avg value {v}")
+    if row["name"] == "sums":
+       v = int(row["value"])
+       if v != 182:
+           raise SystemExit(f"unexpected sum value {v}")
+    if row["name"] == "mins":
+       v = int(row["value"])
+       if v != 99:
+           raise SystemExit(f"unexpected min value {v}")
+    if row["name"] == "maxs":
+       v = int(row["value"])
+       if v != 19:
+           raise SystemExit(f"unexpected max value {v}")
+    if row["name"] == "stddevs":
+       v = int(row["value"])
+       if v != 287:
+           raise SystemExit(f"unexecpted stddev value {v}")
+    if row["name"] == "quants":
+       v = row["value"]
+       if v != {1:2, 2:2, 128:1}:
+           raise SystemExit(f"unexecpted quantize value {v}")
+    if row["name"] == "lquants":
+       v = row["value"]
+       if v != {1:3, 3:1, 9:2}:
+           raise SystemExit(f"unexecpted lquantize value {v}")
+    if row["name"] == "llquants":
+       v = row["value"]
+       if v != {0:2, 9:1, 18:1, 27:1, 162:1}:
+           raise SystemExit(f"unexecpted llquantize value {v}")
+
+EOF
+
+chmod +x "$tmpdir/script.d"
+PATH="$tmpdir:$PATH"
+
+$tmpdir/script.d
diff --git a/test/unittest/python/tst.aggr-change.sh b/test/unittest/python/tst.aggr-change.sh
new file mode 100755
index 00000000..318e17ba
--- /dev/null
+++ b/test/unittest/python/tst.aggr-change.sh
@@ -0,0 +1,75 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# Ensure aggregation values are updated across dt.work() calls.
+
+if [ $# -ne 1 ]; then
+    echo "usage: $0 <dtrace>" >&2
+    exit 2
+fi
+
+dtrace=$1
+
+tmpdir=$(mktemp -d)
+cleanup() {
+    rm -rf "$tmpdir"
+}
+trap cleanup EXIT
+
+cat >"$tmpdir"/script.d <<EOF
+#!/usr/bin/env python3
+from pathlib import Path
+from subprocess import Popen
+
+from dtrace import DTraceSession
+
+prog = r"""
+syscall:::entry
+{
+    @counts["syscalls"] = count();
+}
+"""
+
+with DTraceSession() as dt:
+    p = dt.compile(prog)
+    dt.enable(p)
+    dt.go()
+    pid = Popen(["/bin/sleep", "1"]).wait()
+    dt.work()
+    dt.agg_snap()
+    rows = dt.agg_walk()
+    if not rows:
+        raise SystemExit("no rows returned")
+    entry = rows[0]
+    val1 = int(entry["value"])
+    pid = Popen(["/bin/sleep", "1"]).wait()
+    dt.work()
+    dt.agg_snap()
+    rows = dt.agg_walk()
+    if not rows:
+        raise SystemExit("no rows returned")
+    entry = rows[0]
+    val2 = int(entry["value"])
+    if val2 <= val1:
+        raise SystemExit("aggr value unchanged")
+    dt.stop()
+    
+    rows = dt.agg_walk()
+
+if not rows:
+    raise SystemExit("no rows returned")
+
+entry = rows[0]
+if "keys" not in entry or "value" not in entry:
+    raise SystemExit("missing keys or value")
+
+EOF
+
+chmod +x "$tmpdir/script.d"
+PATH="$tmpdir:$PATH"
+
+$tmpdir/script.d
diff --git a/test/unittest/python/tst.aggr-stack.sh b/test/unittest/python/tst.aggr-stack.sh
new file mode 100755
index 00000000..a9259636
--- /dev/null
+++ b/test/unittest/python/tst.aggr-stack.sh
@@ -0,0 +1,61 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# Ensure aggregation can retrieve kernel stack key.
+
+if [ $# -ne 1 ]; then
+    echo "usage: $0 <dtrace>" >&2
+    exit 2
+fi
+
+dtrace=$1
+
+tmpdir=$(mktemp -d)
+cleanup() {
+    rm -rf "$tmpdir"
+}
+trap cleanup EXIT
+
+cat >"$tmpdir"/script.d <<EOF
+#!/usr/bin/env python3
+from pathlib import Path
+from subprocess import Popen
+
+from dtrace import DTraceSession
+
+prog = r"""
+syscall:::entry
+{
+    @counts[stack()] = count();
+}
+"""
+
+with DTraceSession() as dt:
+    p = dt.compile(prog)
+    dt.enable(p)
+    dt.go()
+    pid = Popen(["/bin/sleep", "1"]).wait()
+    dt.stop()
+    dt.agg_snap()
+    rows = dt.agg_walk()
+
+if not rows:
+    raise SystemExit("no rows returned")
+
+entry = rows[0]
+if "keys" not in entry or "value" not in entry:
+    raise SystemExit("missing keys or value")
+
+if len(entry["keys"][0]) < 2:
+    raise SystemExit("missing stack list")
+
+EOF
+
+chmod +x "$tmpdir/script.d"
+PATH="$tmpdir:$PATH"
+
+$tmpdir/script.d
diff --git a/test/unittest/python/tst.aggr.sh b/test/unittest/python/tst.aggr.sh
new file mode 100755
index 00000000..15c46f0c
--- /dev/null
+++ b/test/unittest/python/tst.aggr.sh
@@ -0,0 +1,58 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# Ensure aggregation can be retrieved from simple D script.
+
+if [ $# -ne 1 ]; then
+    echo "usage: $0 <dtrace>" >&2
+    exit 2
+fi
+
+dtrace=$1
+
+tmpdir=$(mktemp -d)
+cleanup() {
+    rm -rf "$tmpdir"
+}
+trap cleanup EXIT
+
+cat >"$tmpdir"/script.d <<EOF
+#!/usr/bin/env python3
+from pathlib import Path
+from subprocess import Popen
+
+from dtrace import DTraceSession
+
+prog = r"""
+syscall:::entry
+{
+    @counts[execname, probefunc] = count();
+}
+"""
+
+with DTraceSession() as dt:
+    p = dt.compile(prog)
+    dt.enable(p)
+    dt.go()
+    pid = Popen(["/bin/sleep", "1"]).wait()
+    dt.stop()
+    dt.agg_snap()
+    rows = dt.agg_walk()
+
+if not rows:
+    raise SystemExit("no rows returned")
+
+entry = rows[0]
+if "keys" not in entry or "value" not in entry:
+    raise SystemExit("missing keys or value")
+
+EOF
+
+chmod +x "$tmpdir/script.d"
+PATH="$tmpdir:$PATH"
+
+$tmpdir/script.d
diff --git a/test/unittest/python/tst.exit.sh b/test/unittest/python/tst.exit.sh
new file mode 100755
index 00000000..def6b0ec
--- /dev/null
+++ b/test/unittest/python/tst.exit.sh
@@ -0,0 +1,64 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# Ensure we see exit() from script with dt.status().
+
+if [ $# -ne 1 ]; then
+    echo "usage: $0 <dtrace>" >&2
+    exit 2
+fi
+
+dtrace=$1
+
+tmpdir=$(mktemp -d)
+cleanup() {
+    rm -rf "$tmpdir"
+}
+trap cleanup EXIT
+
+cat >"$tmpdir"/script.d <<EOF
+#!/usr/bin/env python3
+from pathlib import Path
+from subprocess import Popen
+
+from dtrace import DTraceSession, DTRACE_STATUS_EXITED
+
+prog = r"""
+syscall:::entry
+{
+    c++;
+}
+
+syscall:::entry
+/ c > 1024 /
+{
+    exit(0);
+}
+"""
+
+with DTraceSession() as dt:
+    p = dt.compile(prog)
+    dt.enable(p)
+    dt.go()
+    exited = False
+    iters = 0
+    while iters < 10:
+        pid = Popen(["/bin/sleep", "1"]).wait()
+        if dt.status() == DTRACE_STATUS_EXITED:
+            exited = True
+        iters += 1
+    dt.stop()
+
+if exited != True:
+    raise SystemExit("missing DTRACE_STATUS_EXIT")
+
+EOF
+
+chmod +x "$tmpdir/script.d"
+PATH="$tmpdir:$PATH"
+
+$tmpdir/script.d
diff --git a/test/unittest/python/tst.multi-session-end.sh b/test/unittest/python/tst.multi-session-end.sh
new file mode 100755
index 00000000..dfc3503f
--- /dev/null
+++ b/test/unittest/python/tst.multi-session-end.sh
@@ -0,0 +1,75 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# Ensure END probes remain attached when another DTrace session in the same
+# process closes.
+
+if [ $# -ne 1 ]; then
+    echo "usage: $0 <dtrace>" >&2
+    exit 2
+fi
+
+tmpdir=$(mktemp -d)
+cleanup() {
+    rm -rf "$tmpdir"
+}
+trap cleanup EXIT
+
+cat >"$tmpdir/script.d" <<'EOF'
+#!/usr/bin/env python3
+from dtrace import DTraceSession
+
+
+program = r'''
+END
+{
+    @ended = count();
+}
+'''
+
+
+def start_session():
+    session = DTraceSession()
+    program_handle = session.compile(program)
+    session.enable(program_handle)
+    session.go()
+    return session
+
+
+def assert_end_fired(session, survivor):
+    session.stop()
+    session.agg_snap()
+    rows = session.agg_walk()
+
+    for row in rows:
+        if row["name"] == "ended" and int(row["value"]) == 1:
+            return
+
+    raise SystemExit(f"END probe did not fire for surviving handle {survivor}")
+
+
+# Closing A must not remove B's shared END uprobe.
+handle_a = start_session()
+handle_b = start_session()
+try:
+    handle_a.close()
+    assert_end_fired(handle_b, "B")
+finally:
+    handle_b.close()
+
+# Closing B must not remove A's shared END uprobe.
+handle_a = start_session()
+handle_b = start_session()
+try:
+    handle_b.close()
+    assert_end_fired(handle_a, "A")
+finally:
+    handle_a.close()
+EOF
+
+chmod +x "$tmpdir/script.d"
+"$tmpdir/script.d"
diff --git a/test/unittest/python/tst.multi-session.sh b/test/unittest/python/tst.multi-session.sh
new file mode 100755
index 00000000..7389c126
--- /dev/null
+++ b/test/unittest/python/tst.multi-session.sh
@@ -0,0 +1,58 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# Ensure multiple sessions within same process image work.
+
+if [ $# -ne 1 ]; then
+    echo "usage: $0 <dtrace>" >&2
+    exit 2
+fi
+
+dtrace=$1
+
+tmpdir=$(mktemp -d)
+cleanup() {
+    rm -rf "$tmpdir"
+}
+trap cleanup EXIT
+
+cat >"$tmpdir"/script.d <<EOF
+#!/usr/bin/env python3
+from pathlib import Path
+from subprocess import Popen
+
+from dtrace import DTraceSession
+
+prog = r"""
+syscall::read:entry
+{
+    @counts["syscalls"] = count();
+}
+"""
+
+dts = {}
+max_sessions = 10
+
+try:
+    for i in range(max_sessions):
+        dts[i] = DTraceSession()
+        p = dts[i].compile(prog)
+        dts[i].enable(p)
+        dts[i].go()
+        dts[i].work()
+except Exception as exc:
+        raise SystemExit(f"got err with {i} multiple sessions: {exc}")
+finally:
+    for j in range(i):
+        dts[i].close()
+
+EOF
+
+chmod +x "$tmpdir/script.d"
+PATH="$tmpdir:$PATH"
+
+$tmpdir/script.d
diff --git a/test/unittest/python/tst.proc-create.sh b/test/unittest/python/tst.proc-create.sh
new file mode 100755
index 00000000..e9d2d466
--- /dev/null
+++ b/test/unittest/python/tst.proc-create.sh
@@ -0,0 +1,56 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# Validate tracing of a spawned command.
+
+if [ $# -ne 1 ]; then
+    echo "usage: $0 <dtrace>" >&2
+    exit 2
+fi
+
+dtrace=$1
+
+tmpdir=$(mktemp -d)
+cleanup() {
+    rm -rf "$tmpdir"
+}
+trap cleanup EXIT
+
+cat >"$tmpdir"/script.py <<'EOF'
+#!/usr/bin/env python3
+from subprocess import Popen
+from dtrace import DTraceSession
+
+prog = r"""
+syscall::read:entry
+{
+    @calls[execname] = count();
+}
+"""
+
+with DTraceSession() as dt:
+    p = dt.compile(prog)
+    dt.enable(p)
+    dt.go()
+    proc = dt.proc_create(["/bin/echo", "hello"])
+    dt.proc_continue(proc)
+    dt.proc_release(proc)
+    dt.stop()
+    dt.agg_snap()
+    rows = dt.agg_walk()
+
+if not rows:
+    raise SystemExit("no aggregation rows")
+
+names = {tuple(entry["keys"]) for entry in rows}
+if not any("echo" in key for key in names):
+    raise SystemExit("expected echo entry in aggregation")
+EOF
+
+chmod +x "$tmpdir/script.py"
+
+$tmpdir/script.py
diff --git a/test/unittest/python/tst.proc-exit.sh b/test/unittest/python/tst.proc-exit.sh
new file mode 100755
index 00000000..d4962f37
--- /dev/null
+++ b/test/unittest/python/tst.proc-exit.sh
@@ -0,0 +1,57 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# Ensure we see stopped state when traced process goes away.
+
+if [ $# -ne 1 ]; then
+    echo "usage: $0 <dtrace>" >&2
+    exit 2
+fi
+
+dtrace=$1
+
+tmpdir=$(mktemp -d)
+cleanup() {
+    rm -rf "$tmpdir"
+}
+trap cleanup EXIT
+
+cat >"$tmpdir"/script.d <<EOF
+#!/usr/bin/env python3
+from pathlib import Path
+from subprocess import Popen
+
+from dtrace import DTraceSession, DTRACE_STATUS_STOPPED
+
+prog = r"""
+syscall:::entry
+{
+    c++;
+}
+"""
+
+with DTraceSession() as dt:
+    p = dt.compile(prog)
+    dt.enable(p)
+    dt.go()
+    proc = dt.proc_create(["/bin/sleep", "5"])
+    dt.proc_continue(proc)
+    Popen(["/bin/sleep", "10"]).wait()
+    dt.work()
+    status = dt.status()
+    dt.proc_release(proc)
+    dt.stop()
+
+if status != DTRACE_STATUS_STOPPED:
+    raise SystemExit(f"missing DTRACE_STATUS_STOPPED: got {status}")
+
+EOF
+
+chmod +x "$tmpdir/script.d"
+PATH="$tmpdir:$PATH"
+
+$tmpdir/script.d
diff --git a/test/unittest/python/tst.proc-grab.sh b/test/unittest/python/tst.proc-grab.sh
new file mode 100755
index 00000000..21faca65
--- /dev/null
+++ b/test/unittest/python/tst.proc-grab.sh
@@ -0,0 +1,81 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# Ensure Python bindings can grab an existing process and trace its syscalls.
+
+if [ $# -ne 1 ]; then
+    echo "usage: $0 <dtrace>" >&2
+    exit 2
+fi
+
+dtrace=$1
+
+tmpdir=$(mktemp -d)
+cleanup() {
+    rm -rf "$tmpdir"
+}
+trap cleanup EXIT
+
+# Start a long-lived helper shell to grab.
+sleep_inf="$tmpdir/sleep.sh"
+cat >"$sleep_inf" <<'EOF'
+#!/bin/bash
+while :; do
+    sleep 1
+done
+EOF
+chmod +x "$sleep_inf"
+"$sleep_inf" &
+helper=$!
+
+cat >"$tmpdir"/script.py <<'EOF'
+#!/usr/bin/env python3
+import os
+import sys
+from subprocess import Popen
+from dtrace import DTraceSession
+
+prog = r"""
+syscall:::entry
+/ pid == $target /
+{
+    @counts[execname, probefunc] = count();
+}
+"""
+
+pid = int(os.environ["TARGET_PID"])
+
+with DTraceSession() as dt:
+    proc = dt.proc_grab_pid(pid)
+    if proc.getpid() != pid:
+        raise SystemExit("grabbed PID mismatch")
+    p = dt.compile(prog)
+    dt.enable(p)
+    dt.go()
+    dt.proc_continue(proc)
+    Popen(["/bin/sleep", "5"]).wait()
+    dt.stop()
+    dt.proc_release(proc)
+    dt.agg_snap()
+    rows = dt.agg_walk()
+
+if not rows:
+    raise SystemExit("no rows returned")
+
+entry = rows[0]
+if "keys" not in entry or "value" not in entry:
+    raise SystemExit("missing keys or value")
+EOF
+
+chmod +x "$tmpdir/script.py"
+export TARGET_PID=$helper
+$tmpdir/script.py
+ret=$?
+
+kill $helper
+wait $helper 2>/dev/null || true
+exit $ret
-- 
2.43.5

