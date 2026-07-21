Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBCC3988F9
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784647504; cv=none; b=FX1e66vTV7Kq6CdBPCWCRvLwoBHrBVFHH/7OEppNXg80kk64fcbEeVa/iRoFWBuqz+Y9ESTt4L9cpWRlb7EayeF3rq0ItUA0QI0WEJS2xsmcdGkxzJ/a5ejbtX0uzBIxLle14QMTBdhXAf2NdkiEzBvpZlQaYrLUKVjxPlmz7lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784647504; c=relaxed/simple;
	bh=FSdX1TxkXI/nu17KPDPlVBQyAGE/D89rVBAq6gGCzfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DKBUEvYjEwSlP2z0yCsVhGzmePaKMTGs5ygbQ7FdIyUEj6wnKBFKYIB+f/N5FSmN+P9aF2F/8+EErbztd8hkA+2c/gbHy62OaJm8m5lwvro0doN8zU2eeEEyUeZMSQeNp1F+H15zIfvMVjvWA7tS07YHIdDwBfTwzrO/9cVpsyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=V0WSXPtE; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="V0WSXPtE"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LEdvpI330191
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=r/ob2
	mKM8eP5qHc08TwhxFPJf0L1HrWEko+QQYElPI0=; b=V0WSXPtEL0gDJpV6WDrbE
	Uvqk7VkOxADIG7G2uSMHvkGgxHQQMc5/eA2LnKG3ZCGYtXGJAka9vzYrMpk+6i8f
	QYRrAZN3KjcsZ3CZsB3UdoHSCaUGDT/Dj8s5rDxCPmSnEYq0qfyOEUsasYuO3uaj
	v3rSNkI2ZvqoIyau3by/kSWEvYkf3O7jPsOU4kSHvzfNfrCQ3Xww66RO5YABmCLR
	H9t5xO3SMVAbFk9hxDaCO1pvjI67kGhkdvKj/FklVNihi+8N3JUC9XrQ0tB+wd/J
	zIkXzF28B83VIQu7RKAFKuE3rbhHYmwMmtgdzZ2IJopmVSPkvbPGBgZ6KRibylpH
	g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4fg21q3nmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:25:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 66LFIkjm036361
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:25:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ffyxpw2f0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:25:00 +0000 (GMT)
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66LFOrpX020536
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:25:00 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-48-223.vpn.oracle.com [10.154.48.223])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4ffyxpw29w-8;
	Tue, 21 Jul 2026 15:25:00 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v3 7/7] test: add tests for python bindings
Date: Tue, 21 Jul 2026 16:24:51 +0100
Message-ID: <20260721152452.184842-8-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260721152452.184842-1-alan.maguire@oracle.com>
References: <20260721152452.184842-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2606160000
 definitions=main-2607210162
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2MyBTYWx0ZWRfXw81wYy24zHE2
 1AlJplFAuilqMzVFgAS0uRdlAlS7yKNVC9DUlV9BehrBCqHRPg8SuKBNFzyAnbByDNyIzM2kVlb
 wd+GyUPBL7z8eAoENOG1Wvwgq223e6pA/3eVHPIf/rTAqHOB4C1bVgpJSbPQuU0bHh98zNoYkwg
 gUI4YJD7TGl9/YlvJhqZu6w+ny4YUMh9QPq3+r501syB9d+hECNp0VCNfwDlxx9ywHUwZihFV+g
 wU4gAYqKBOpj9PjRFDfHhv72CuhEobnQheLC1ay/v+SrntHoqcMvGmXOf7GHRvLttZ3qBUuFvO5
 Cdvv0eK8aAv6SNEg8OlJmE3g8S383qhajF5ZXmnqQPZJFlSy0yahT0Xpc/EUv0K0enXL/0kqddN
 yaIa9t2Y8Q9COteMu3s/nviscUnvThQUFQT+iDli0vTZJdqWAt3B8ZUmvfVjSfeuefE6VaW6+Sb
 ZsJFEb35uCQ4VIUSKwYkZTRp7JTWBH2jKtXp1wJw=
X-Proofpoint-GUID: -I9VK9bJD0odmWQc_DeFPqG8Mobc1DG3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2MyBTYWx0ZWRfXw/ixlbRuRf7B
 m4tOh3A5VmVbjr5utXYi+IIlqHF27gMm9O2pID6XFTP5Yizrn4oAvOVLCN71tEn4QJyBuVE/M2e
 UCvl9XPkDVKnenbmXvXTGznK5rbisVsUfVIMebaJitjSK0MElKyA
X-Authority-Analysis: v=2.4 cv=ALkdLnG8 c=1 sm=1 tr=0 ts=6a5f8f4e b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=7Gl3-_t3PgB9XO-mQDs3:22 a=yPCof4ZbAAAA:8 a=rbBSjWO7cLacCaIVboQA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12218
X-Proofpoint-ORIG-GUID: -I9VK9bJD0odmWQc_DeFPqG8Mobc1DG3

Add tests covering aggregation snapshot, update, handling of
stack keys.  Also test process creation/grabbing, and ensure
we detect processes going away or exit() calls in dt.work().
Also ensure that multiple sessions can exist in the process
image.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 test/unittest/python/tst.aggr-actions.sh  | 133 ++++++++++++++++++++++
 test/unittest/python/tst.aggr-change.sh   |  75 ++++++++++++
 test/unittest/python/tst.aggr-stack.sh    |  61 ++++++++++
 test/unittest/python/tst.aggr.sh          |  58 ++++++++++
 test/unittest/python/tst.exit.sh          |  64 +++++++++++
 test/unittest/python/tst.multi-session.sh |  58 ++++++++++
 test/unittest/python/tst.proc-create.sh   |  56 +++++++++
 test/unittest/python/tst.proc-exit.sh     |  57 ++++++++++
 test/unittest/python/tst.proc-grab.sh     |  81 +++++++++++++
 9 files changed, 643 insertions(+)
 create mode 100755 test/unittest/python/tst.aggr-actions.sh
 create mode 100755 test/unittest/python/tst.aggr-change.sh
 create mode 100755 test/unittest/python/tst.aggr-stack.sh
 create mode 100755 test/unittest/python/tst.aggr.sh
 create mode 100755 test/unittest/python/tst.exit.sh
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

