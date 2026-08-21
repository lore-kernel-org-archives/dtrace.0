Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAECB4A33F6
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328678; cv=none; b=bJpHjhh3Gi62NON91Wq49XLUzRzXW0f/XbhWVaFu4XqEqJuphnTQPPj6RzNOXe4zkWoYajM9H+mMrvg8LlaY/06zZPozp/SXGBt6TCawLHMGzmQ9X3wIIEJX7rdCvXgPDoO4nCk0P2NMjvYU9JLYtUnlZu5FNmKxEchS21YSJKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328678; c=relaxed/simple;
	bh=LkTZYfjzttf0QHwYor3hs+iTLf7lr16/aVXp3O/kpr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WnrQY7fiwd/2ZSaHAh0Hmd67q2uoA6CyUVxGAJ419LNrRf4kH0TgbWf/DtTgEvH76nCnTKcCXfNCy5XbwsXQdiBnrGJbmyW8wYq4k1chM2X8ikwQCyA7fhtoA2Ja+LXcA/TXIo+CwPxKQ9dahOh1YeNMb5IT3dCky/5FBAEgktM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=N+7IfSnp; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="N+7IfSnp"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LCtNMe2418672
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=/2J2Q
	K18Eo6f6f5xq1I+JzraOjUjE2yzbtjQBQ3H9n4=; b=N+7IfSnpNzYDvLdc7PnOC
	cs6PLKIQCyWI+n0CovJPoxvnh43mke073KDEeLJ5WDBwZFn/MU1vbMicTDv5Qmur
	D3MrxDFbVEm1NqHiCZLDnIh1eq8P4HOltqypq4JjCt30ntFq/4mh01bj81bQErg1
	7w+aoKkFZJ/izflsM9bJ784JnhU1qtiGcRmPVxYWaLs+SDEWaOPeJ6w7WkdL46Zd
	xTgQtoetiAtRgIPDtIBSR6MqrghtTXDjTUpzsR50GnfLDwHnKcW+fQfvFarCub89
	fzu+kO3WFxCqIZHIZoSPQSFApNT4OxFbncyyTwweu/kvCHW59Wf1B3QiE5jCzDZP
	A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g4ydddamv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:14 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67LG5CFC029317
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4g2ejgcn2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:13 +0000 (GMT)
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67LGB2FI014592
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:13 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-51-128.vpn.oracle.com [10.154.51.128])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4g2ejgcmux-9;
	Fri, 21 Aug 2026 16:11:13 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v5 08/11] test: add tests for python bindings
Date: Fri, 21 Aug 2026 17:10:56 +0100
Message-ID: <20260821161100.41710-9-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260821161100.41710-1-alan.maguire@oracle.com>
References: <20260821161100.41710-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608210126
X-Proofpoint-GUID: CKarG6vDkx0h4uvjEvsJpgtq21x8KtGs
X-Proofpoint-ORIG-GUID: CKarG6vDkx0h4uvjEvsJpgtq21x8KtGs
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfXzXW5hX6iiwU9
 oMdF998q19IftXiYTkduRp22uOxFLlLXFqRCyZOqXBFhBr+aIN7fiss7Db6aMI+1k6KWApvHSQc
 p0q+AKHGDU/b9unyL32LhaDceH/wgoyAFSWdiWXhWLRMR7O0jFhu
X-Authority-Analysis: v=2.4 cv=BdjoFLt2 c=1 sm=1 tr=0 ts=6a8878a2 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=RD47p0oAkeU5bO7t-o6f:22 a=yPCof4ZbAAAA:8 a=LtPLczNxp6PVsQumPEcA:9
 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfXwsqrl5VGPxRD
 vZ1o3GDVG0XP2V6l0hEA7bXHNlzDfk9uL6At7eYKKgPGThEvqe37ajkkAhJY7j9i3T5Ru5aUk96
 ae2WnV5yzu7vMHsbkp4LHlWIpg9Z50NQQatxZsfEhNDzxDd+/mC63q/pIyGbRqcMuAkLyGnUO/Q
 wfnVGwgrXZKrEcS+dDTp9qx4AaABhBh/aI94c+A32Hq/E3rJy0bl8nFFpxmuJtirMxJ4i2K9nr4
 O5DA99ZNZ6htrWRhOPVnWfQ7LmyOVticqbKm7In0iaH6g54gsa2EqK6mUkl4RGWKnskP+mhRKkM
 nFqLUlqmlkEDIpyuk1vgTe/yoMXADR61e96Db44qP+3/Hiy865m3KeHZhFPMxFJVvZCOCztKoZz
 kOT9tlfEmZ++qfQXwCX6x0YMWMWAjTMbAqTu4gQnWFbG15+dk5pLWlBZn00Tu3jQZ8IMtfaOcuG
 xg07afwEhrpuLzKkpqQ==

Add tests covering aggregation snapshot, handling of keys,
values.  Also test process creation/grabbing, and ensure
we detect processes going away or exit() calls in dt.work().
Also ensure that multiple sessions can exist in the process
image, and that closing a handle does not effect operation of
another handle in the same process.  Test compile-time and
general setopt() options.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 test/unittest/python/test.x                   |  17 ++
 test/unittest/python/tst.aggr-actions.sh      | 152 ++++++++++++++++++
 test/unittest/python/tst.aggr-change.sh       |  74 +++++++++
 test/unittest/python/tst.aggr-clear.sh        |  44 +++++
 test/unittest/python/tst.aggr-keys.sh         |  89 ++++++++++
 test/unittest/python/tst.aggr-stack.sh        |  62 +++++++
 test/unittest/python/tst.aggr.sh              |  58 +++++++
 test/unittest/python/tst.compile-opts.sh      |  50 ++++++
 test/unittest/python/tst.exit.sh              |  67 ++++++++
 test/unittest/python/tst.multi-session-end.sh |  89 ++++++++++
 test/unittest/python/tst.multi-session.sh     |  62 +++++++
 test/unittest/python/tst.proc-create.sh       |  71 ++++++++
 test/unittest/python/tst.proc-exit.sh         |  57 +++++++
 test/unittest/python/tst.proc-grab.sh         |  84 ++++++++++
 test/unittest/python/tst.setopt.sh            |  30 ++++
 test/unittest/python/tst.work-error.sh        |  36 +++++
 16 files changed, 1042 insertions(+)
 create mode 100755 test/unittest/python/test.x
 create mode 100755 test/unittest/python/tst.aggr-actions.sh
 create mode 100755 test/unittest/python/tst.aggr-change.sh
 create mode 100755 test/unittest/python/tst.aggr-clear.sh
 create mode 100755 test/unittest/python/tst.aggr-keys.sh
 create mode 100755 test/unittest/python/tst.aggr-stack.sh
 create mode 100755 test/unittest/python/tst.aggr.sh
 create mode 100755 test/unittest/python/tst.compile-opts.sh
 create mode 100755 test/unittest/python/tst.exit.sh
 create mode 100755 test/unittest/python/tst.multi-session-end.sh
 create mode 100755 test/unittest/python/tst.multi-session.sh
 create mode 100755 test/unittest/python/tst.proc-create.sh
 create mode 100755 test/unittest/python/tst.proc-exit.sh
 create mode 100755 test/unittest/python/tst.proc-grab.sh
 create mode 100755 test/unittest/python/tst.setopt.sh
 create mode 100755 test/unittest/python/tst.work-error.sh

diff --git a/test/unittest/python/test.x b/test/unittest/python/test.x
new file mode 100755
index 00000000..36ea27d6
--- /dev/null
+++ b/test/unittest/python/test.x
@@ -0,0 +1,17 @@
+#!/bin/bash
+#
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# Skip the Python binding tests when the bindings were not built or installed.
+#
+
+if ! "$DTRACE_PYTHON" -c 'import dtrace' >/dev/null 2>&1; then
+	echo "Python bindings are unavailable"
+	exit 2
+fi
+
+exit 0
diff --git a/test/unittest/python/tst.aggr-actions.sh b/test/unittest/python/tst.aggr-actions.sh
new file mode 100755
index 00000000..f09d3b13
--- /dev/null
+++ b/test/unittest/python/tst.aggr-actions.sh
@@ -0,0 +1,152 @@
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
+expected = {
+    "counts", "sums", "avgs", "mins", "maxs", "stddevs", "quants",
+    "lquants", "llquants",
+}
+seen = set()
+
+if not rows:
+    raise SystemExit("no rows returned")
+
+for row in rows:
+    if row["name"] == "counts":
+       seen.add(row["name"])
+       v = int(row["value"])
+       if v != 3:
+           raise SystemExit(f"unexpected count value {v}")
+    if row["name"] == "avgs":
+       seen.add(row["name"])
+       v = float(row["value"])
+       if v != 4.5:
+           raise SystemExit(f"unexpected avg value {v}")
+    if row["name"] == "sums":
+       seen.add(row["name"])
+       v = int(row["value"])
+       if v != 182:
+           raise SystemExit(f"unexpected sum value {v}")
+    if row["name"] == "mins":
+       seen.add(row["name"])
+       v = int(row["value"])
+       if v != 99:
+           raise SystemExit(f"unexpected min value {v}")
+    if row["name"] == "maxs":
+       seen.add(row["name"])
+       v = int(row["value"])
+       if v != 19:
+           raise SystemExit(f"unexpected max value {v}")
+    if row["name"] == "stddevs":
+       seen.add(row["name"])
+       v = int(row["value"])
+       if v != 287:
+           raise SystemExit(f"unexecpted stddev value {v}")
+    if row["name"] == "quants":
+       seen.add(row["name"])
+       v = row["value"]
+       if v != {1:2, 2:2, 128:1}:
+           raise SystemExit(f"unexecpted quantize value {v}")
+    if row["name"] == "lquants":
+       seen.add(row["name"])
+       v = row["value"]
+       if v != {1:3, 3:1, 9:2}:
+           raise SystemExit(f"unexecpted lquantize value {v}")
+    if row["name"] == "llquants":
+       seen.add(row["name"])
+       v = row["value"]
+       if v != {0:2, 9:1, 18:1, 27:1, 162:1}:
+           raise SystemExit(f"unexecpted llquantize value {v}")
+
+missing = expected - seen
+if missing:
+    raise SystemExit(f"missing aggregation(s): {sorted(missing)}")
+
+EOF
+
+chmod +x "$tmpdir/script.d"
+PATH="$tmpdir:$PATH"
+
+"$DTRACE_PYTHON" "$tmpdir/script.d"
diff --git a/test/unittest/python/tst.aggr-change.sh b/test/unittest/python/tst.aggr-change.sh
new file mode 100755
index 00000000..7c3f8594
--- /dev/null
+++ b/test/unittest/python/tst.aggr-change.sh
@@ -0,0 +1,74 @@
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
+"$DTRACE_PYTHON" "$tmpdir/script.d"
diff --git a/test/unittest/python/tst.aggr-clear.sh b/test/unittest/python/tst.aggr-clear.sh
new file mode 100755
index 00000000..912bab0c
--- /dev/null
+++ b/test/unittest/python/tst.aggr-clear.sh
@@ -0,0 +1,44 @@
+#!/bin/bash
+#
+# Ensure aggregation buffers can be cleared through the Python binding.
+
+if [ $# -ne 1 ]; then
+    echo "usage: $0 <dtrace>" >&2
+    exit 2
+fi
+
+tmpdir=$(mktemp -d)
+cleanup() { rm -rf "$tmpdir"; }
+trap cleanup EXIT
+
+cat >"$tmpdir/script.py" <<'EOF'
+#!/usr/bin/env python3
+from dtrace import DTraceSession
+
+program = r'''
+BEGIN
+{
+    @counts = count();
+}
+'''
+
+with DTraceSession() as session:
+    compiled = session.compile(program)
+    session.enable(compiled)
+    session.go()
+    session.stop()
+    session.agg_snap()
+    if not session.agg_walk():
+        raise SystemExit("aggregation was not populated")
+    session.agg_clear()
+    session.agg_snap()
+    rows = session.agg_walk()
+    if not rows:
+        raise SystemExit("aggregation descriptor disappeared after agg_clear()")
+    for row in rows:
+        if row["name"] == "counts" and int(row["value"]) != 0:
+            raise SystemExit(f"aggregation was not cleared: {row}")
+EOF
+
+chmod +x "$tmpdir/script.py"
+"$DTRACE_PYTHON" "$tmpdir/script.py"
diff --git a/test/unittest/python/tst.aggr-keys.sh b/test/unittest/python/tst.aggr-keys.sh
new file mode 100755
index 00000000..e81b1c2d
--- /dev/null
+++ b/test/unittest/python/tst.aggr-keys.sh
@@ -0,0 +1,89 @@
+#!/bin/bash
+#
+# Verify Python aggregation-key decoding for zero, string, numeric, and
+# mixed key tuples.
+#
+
+if [ $# -ne 1 ]; then
+	echo "usage: $0 <dtrace>" >&2
+	exit 2
+fi
+
+tmpdir=$(mktemp -d)
+trap 'rm -rf "$tmpdir"' EXIT
+
+cat >"$tmpdir/script.py" <<'EOF'
+#!/usr/bin/env python3
+from dtrace import DTraceSession
+
+program = r'''
+BEGIN
+{
+	@zero = count();
+	@string["alpha"] = count();
+	@numeric[17] = count();
+	@mixed["irq", 17] = count();
+}
+
+fbt::schedule:entry
+{
+	@symkey[sym(caller)] = count();
+	@modkey[mod(caller)] = count();
+	@stackkey[stack()] = count();
+}
+
+pid$target::getopt*:entry
+{
+	@usymkey[usym(ucaller)] = count();
+	@umodkey[umod(ucaller)] = count();
+}
+
+profile:::tick-5s
+{
+	exit(0);
+}
+'''
+
+with DTraceSession() as session:
+    from dtrace import DTRACE_C_ZDEFS
+    target = session.proc_create(["/bin/sleep", "2"])
+    program_obj = session.compile(program, cflags=DTRACE_C_ZDEFS)
+    session.enable(program_obj)
+    session.go()
+    session.proc_continue(target)
+    import time
+    time.sleep(2)
+    session.proc_release(target)
+    session.stop()
+    session.agg_snap()
+    rows = session.agg_walk()
+
+def hashable_key(key):
+    return tuple(hashable_key(item) for item in key) if isinstance(key, list) else key
+
+seen = {
+    (row["name"], tuple(hashable_key(key) for key in row["keys"]))
+    for row in rows
+}
+expected = {
+    ("zero", ()),
+    ("string", (("alpha",),)),
+    ("numeric", ((17,),)),
+    ("mixed", (("irq",), (17,))),
+}
+missing = expected - seen
+if missing:
+    raise SystemExit(f"missing aggregation keys: {missing}; rows={rows}")
+print(f"rows={rows}")
+
+for name in ("symkey", "modkey", "usymkey", "umodkey"):
+    matching = [row for row in rows if row["name"] == name]
+    if not matching or not isinstance(matching[0]["keys"][0], list):
+        raise SystemExit(f"symbolic key was not formatted: {name}: {matching}")
+stack_rows = [row for row in rows if row["name"] == "stackkey"]
+if not stack_rows or not isinstance(stack_rows[0]["keys"][0], list):
+    raise SystemExit(f"stack key was not formatted: {stack_rows}")
+EOF
+
+chmod +x "$tmpdir/script.py"
+"$DTRACE_PYTHON" "$tmpdir/script.py"
diff --git a/test/unittest/python/tst.aggr-stack.sh b/test/unittest/python/tst.aggr-stack.sh
new file mode 100755
index 00000000..1b398a04
--- /dev/null
+++ b/test/unittest/python/tst.aggr-stack.sh
@@ -0,0 +1,62 @@
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
+if not entry["keys"] or not isinstance(entry["keys"][0], list) or \
+   not entry["keys"][0] or len(entry["keys"][0][0]) < 2:
+    raise SystemExit("missing stack list")
+
+EOF
+
+chmod +x "$tmpdir/script.d"
+PATH="$tmpdir:$PATH"
+
+"$DTRACE_PYTHON" "$tmpdir/script.d"
diff --git a/test/unittest/python/tst.aggr.sh b/test/unittest/python/tst.aggr.sh
new file mode 100755
index 00000000..235de73d
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
+"$DTRACE_PYTHON" "$tmpdir/script.d"
diff --git a/test/unittest/python/tst.compile-opts.sh b/test/unittest/python/tst.compile-opts.sh
new file mode 100755
index 00000000..7e0c3e61
--- /dev/null
+++ b/test/unittest/python/tst.compile-opts.sh
@@ -0,0 +1,50 @@
+#!/bin/bash
+#
+# Ensure compile flags and preprocessor macro arguments are accepted.
+
+if [ $# -ne 1 ]; then
+    echo "usage: $0 <dtrace>" >&2
+    exit 2
+fi
+
+tmpdir=$(mktemp -d)
+cleanup() { rm -rf "$tmpdir"; }
+trap cleanup EXIT
+
+cat >"$tmpdir/script.py" <<'EOF'
+#!/usr/bin/env python3
+from dtrace import DTRACE_C_ZDEFS, DTraceSession
+
+program = r'''
+missing-provider:::missing-probe
+{
+    @missing = count();
+}
+
+BEGIN
+{
+    @value = sum(TEST_VALUE);
+}
+'''
+
+with DTraceSession() as session:
+    compiled = session.compile(
+        program,
+        cflags=DTRACE_C_ZDEFS,
+        defines=["TEST_VALUE=42"],
+    )
+    session.enable(compiled)
+    session.go()
+    session.stop()
+    session.agg_snap()
+    rows = session.agg_walk()
+
+values = {row["name"]: row["value"] for row in rows}
+if int(values.get("value", -1)) != 42:
+    raise SystemExit(f"macro definition was not applied: {values}")
+if "missing" in values:
+    raise SystemExit("missing probe unexpectedly generated an aggregation")
+EOF
+
+chmod +x "$tmpdir/script.py"
+"$DTRACE_PYTHON" "$tmpdir/script.py"
diff --git a/test/unittest/python/tst.exit.sh b/test/unittest/python/tst.exit.sh
new file mode 100755
index 00000000..0d5dfb42
--- /dev/null
+++ b/test/unittest/python/tst.exit.sh
@@ -0,0 +1,67 @@
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
+from dtrace import DTraceSession, DTRACE_STATUS_EXITED, DTRACE_STATUS_STOPPED
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
+            break
+        iters += 1
+    if not exited:
+        raise SystemExit("missing DTRACE_STATUS_EXIT")
+    work_status, _ = dt.work()
+    if work_status != DTRACE_STATUS_STOPPED:
+        raise SystemExit(f"exit() was not drained by work(): got {work_status}")
+    dt.stop()
+
+EOF
+
+chmod +x "$tmpdir/script.d"
+PATH="$tmpdir:$PATH"
+
+"$DTRACE_PYTHON" "$tmpdir/script.d"
diff --git a/test/unittest/python/tst.multi-session-end.sh b/test/unittest/python/tst.multi-session-end.sh
new file mode 100755
index 00000000..cf3430c2
--- /dev/null
+++ b/test/unittest/python/tst.multi-session-end.sh
@@ -0,0 +1,89 @@
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
+def close_session(session):
+    if session is not None:
+        try:
+            session.close()
+        except Exception:
+            pass
+
+
+# Closing A must not remove B's shared END uprobe.
+handle_a = handle_b = None
+try:
+    handle_a = start_session()
+    handle_b = start_session()
+    handle_a.close()
+    handle_a = None
+    assert_end_fired(handle_b, "B")
+finally:
+    close_session(handle_a)
+    close_session(handle_b)
+
+# Closing B must not remove A's shared END uprobe.
+handle_a = handle_b = None
+try:
+    handle_a = start_session()
+    handle_b = start_session()
+    handle_b.close()
+    handle_b = None
+    assert_end_fired(handle_a, "A")
+finally:
+    close_session(handle_a)
+    close_session(handle_b)
+EOF
+
+chmod +x "$tmpdir/script.d"
+"$DTRACE_PYTHON" "$tmpdir/script.d"
diff --git a/test/unittest/python/tst.multi-session.sh b/test/unittest/python/tst.multi-session.sh
new file mode 100755
index 00000000..3709ca1a
--- /dev/null
+++ b/test/unittest/python/tst.multi-session.sh
@@ -0,0 +1,62 @@
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
+sessions = []
+max_sessions = 10
+
+try:
+    for i in range(max_sessions):
+        session = DTraceSession()
+        sessions.append(session)
+        p = session.compile(prog)
+        session.enable(p)
+        session.go()
+        session.work()
+except Exception as exc:
+    raise SystemExit(f"got err with {i} multiple sessions: {exc}")
+finally:
+    for session in sessions:
+        try:
+            session.close()
+        except Exception:
+            pass
+
+EOF
+
+chmod +x "$tmpdir/script.d"
+PATH="$tmpdir:$PATH"
+
+"$DTRACE_PYTHON" "$tmpdir/script.d"
diff --git a/test/unittest/python/tst.proc-create.sh b/test/unittest/python/tst.proc-create.sh
new file mode 100755
index 00000000..95e9db85
--- /dev/null
+++ b/test/unittest/python/tst.proc-create.sh
@@ -0,0 +1,71 @@
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
+import time
+
+from dtrace import DTRACE_STATUS_STOPPED, DTraceSession
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
+    deadline = time.monotonic() + 5
+    try:
+        while time.monotonic() < deadline:
+            status, _ = dt.work()
+            if status == DTRACE_STATUS_STOPPED:
+                break
+            time.sleep(0.05)
+        else:
+            raise SystemExit("created process did not complete")
+    finally:
+        dt.proc_release(proc)
+    dt.agg_snap()
+    rows = dt.agg_walk()
+
+if not rows:
+    raise SystemExit("no aggregation rows")
+
+def flatten(key):
+    if isinstance(key, list):
+        return [item for child in key for item in flatten(child)]
+    return [key]
+
+names = [flatten(entry["keys"]) for entry in rows]
+if not any("echo" in key for key in names):
+    raise SystemExit("expected echo entry in aggregation")
+EOF
+
+chmod +x "$tmpdir/script.py"
+
+"$DTRACE_PYTHON" "$tmpdir/script.py"
diff --git a/test/unittest/python/tst.proc-exit.sh b/test/unittest/python/tst.proc-exit.sh
new file mode 100755
index 00000000..2c7d02da
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
+"$DTRACE_PYTHON" "$tmpdir/script.d"
diff --git a/test/unittest/python/tst.proc-grab.sh b/test/unittest/python/tst.proc-grab.sh
new file mode 100755
index 00000000..5655303b
--- /dev/null
+++ b/test/unittest/python/tst.proc-grab.sh
@@ -0,0 +1,84 @@
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
+helper=
+
+tmpdir=$(mktemp -d)
+cleanup() {
+    if [ -n "$helper" ]; then
+        kill "$helper" 2>/dev/null || true
+        wait "$helper" 2>/dev/null || true
+    fi
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
+"$DTRACE_PYTHON" "$tmpdir/script.py"
+ret=$?
+
+exit $ret
diff --git a/test/unittest/python/tst.setopt.sh b/test/unittest/python/tst.setopt.sh
new file mode 100755
index 00000000..1efc8c06
--- /dev/null
+++ b/test/unittest/python/tst.setopt.sh
@@ -0,0 +1,30 @@
+#!/bin/bash
+#
+# Ensure valid and invalid options are handled through the Python binding.
+
+if [ $# -ne 1 ]; then
+    echo "usage: $0 <dtrace>" >&2
+    exit 2
+fi
+
+tmpdir=$(mktemp -d)
+cleanup() { rm -rf "$tmpdir"; }
+trap cleanup EXIT
+
+cat >"$tmpdir/script.py" <<'EOF'
+#!/usr/bin/env python3
+from dtrace import DTraceError, DTraceSession
+
+with DTraceSession() as session:
+    session.setopt("bufsize", "4m")
+    session.setopt("quiet", None)
+    try:
+        session.setopt("not-a-dtrace-option", "1")
+    except DTraceError:
+        pass
+    else:
+        raise SystemExit("invalid option was accepted")
+EOF
+
+chmod +x "$tmpdir/script.py"
+"$DTRACE_PYTHON" "$tmpdir/script.py"
diff --git a/test/unittest/python/tst.work-error.sh b/test/unittest/python/tst.work-error.sh
new file mode 100755
index 00000000..abf6e589
--- /dev/null
+++ b/test/unittest/python/tst.work-error.sh
@@ -0,0 +1,36 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# Ensure libdtrace errors from work() are reported as Python exceptions.
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
+cat >"$tmpdir/script.py" <<'EOF'
+#!/usr/bin/env python3
+from dtrace import DTraceError, DTraceSession
+
+
+with DTraceSession() as session:
+    try:
+        session.work()
+    except DTraceError:
+        pass
+    else:
+        raise SystemExit("work() did not report its libdtrace error")
+EOF
+
+chmod +x "$tmpdir/script.py"
+"$DTRACE_PYTHON" "$tmpdir/script.py"
-- 
2.43.5

