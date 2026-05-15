Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328E147DFA9
	for <dtrace@lists.linux.dev>; Fri, 15 May 2026 13:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778852664; cv=none; b=DLAaFQrTDkxlSsQ4uvwO6CM5dafUjNdxXpqqLfQtYB1HqC8HSbkCHTQ1zQl+B7uTF3zStpr5TFfl4CrR0tfDoeIkwXH4JQlOKA8wn8Ldzd7J0O0hqMXC86BdLlrpBqjkmObz0jwYwEIUfaRoj9oBT07zfsXbB9O+a6Nup629JGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778852664; c=relaxed/simple;
	bh=S+j0f7NdmoCeIs0n2bFnNElAxnVEPlxBiFx1FFrDbEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XgzqoHoPT+qGP7x6QcnT8DttwlHyg7enIRjxN9tCIBTVcUsfhyAxHYEqFoDzWc2S/SAkRZGannHF94x9Mwp3C+RkBlmN8ZCrEUx8wacXgWsIHM2CKRjhLf5RPuMP+R4EHG293HaqQjUDWuXF6NDxtnocph3JNFEhnXOMFUHIwjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RpJp9qrZ; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RpJp9qrZ"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FCTqvO122867
	for <dtrace@lists.linux.dev>; Fri, 15 May 2026 13:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=WHl8F
	H9Wx6wCfZTVv4yvaXsQ4z32mdA1huoJmaFzwik=; b=RpJp9qrZxK9bXPmNid4i7
	C3VLfA2Cx6EUjC6GOXs4jj0+x/rNNuof43clu4PmmmxpkEFdqVdM1kY6ptIm9rEL
	UH6HgAsVw4Z6eO/Jz5ELzePYh20RB005Xz0bRrlCtjXmzRQMD6BGIMLm3SHpmDMJ
	N1LFVWLFnd87YfffzkivIKweFzDcpqPj62tbTI05+J0Nj5ia5yvKd+KfHxrxG3Fx
	z4b8xdIGCsntYz1ii99RwUwDl0gNoRf/38wXdxLhqsyFk5z8PA3mH9n+xHcmJdws
	op8++RZO9e9oxAhV/gW4eB868VwHjINiFiJLRKMn+tGbW7pNXPp+eID3zeXJKbtz
	g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4e5m20hbq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 May 2026 13:44:22 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 64FDdiW4030900
	for <dtrace@lists.linux.dev>; Fri, 15 May 2026 13:44:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4e5kw11jgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 May 2026 13:44:21 +0000 (GMT)
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64FDiGX7004626
	for <dtrace@lists.linux.dev>; Fri, 15 May 2026 13:44:21 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-60-220.vpn.oracle.com [10.154.60.220])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4e5kw11jd6-4;
	Fri, 15 May 2026 13:44:20 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH 3/3] test/unittest: Add basic python bindings tests
Date: Fri, 15 May 2026 14:44:15 +0100
Message-ID: <20260515134415.355507-4-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260515134415.355507-1-alan.maguire@oracle.com>
References: <20260515134415.355507-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2605130000 definitions=main-2605150139
X-Authority-Analysis: v=2.4 cv=DeMnbPtW c=1 sm=1 tr=0 ts=6a072336 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8 a=i1baO68ohIEWPVIOrv8A:9
X-Proofpoint-ORIG-GUID: yTyIJ-ZB-mnkjICGaXRQ7LAADhDlQxao
X-Proofpoint-GUID: yTyIJ-ZB-mnkjICGaXRQ7LAADhDlQxao
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEzOSBTYWx0ZWRfX80ge7nsdN2MY
 Z6rfxWXHneW5DLwRk4wnncx5aaX528EgboTKxSV/RV9ymgOza1YjEozlBILMgmVXYEgKm8IgY4g
 R7mPB7xUljiOQ7mPbxvCbW2HMhqVd6wCVcTqQK5e+HGPpzf5iW6JFwQjYu2ZRoeaZ4ejS7k7Wie
 CXuAvgmndACj7GPFMgt1sTbT8y7B8312At56NBq/TlpPgXWubd9e+IcjeUWihJGv+XXTZ4vLllV
 bxyyrfdC2C6rUN0Uy4MSIRiXcQ0r1WWJOsZ8xkEeNIbYGPIzQGXNl8BgNUxzi0tzQ4NYb/LVfCk
 3VpMYQxkwQgXDJfPq/ZOHEoiRbDMUyIEQWexwyUFTrJSJeh7Vy3pYuo2Dw78Lf2XTtyU8uEmzGT
 Db8jknVIKDRZ/ijX+1EhRWmAz5ZLsuerchDIQa9hIKx0eTtnsxowvGHS2rbaEMXjrAnEAkFwds1
 oWcUp5x+W1J7J6f7F7Q==

Add tests to read an aggregation from a python-invoked DTrace
session, grab a process and trace it, and create a process
and trace it.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 test/unittest/python/tst.aggr.sh        | 59 ++++++++++++++++++
 test/unittest/python/tst.proc-create.sh | 56 +++++++++++++++++
 test/unittest/python/tst.proc-grab.sh   | 81 +++++++++++++++++++++++++
 3 files changed, 196 insertions(+)
 create mode 100755 test/unittest/python/tst.aggr.sh
 create mode 100755 test/unittest/python/tst.proc-create.sh
 create mode 100755 test/unittest/python/tst.proc-grab.sh

diff --git a/test/unittest/python/tst.aggr.sh b/test/unittest/python/tst.aggr.sh
new file mode 100755
index 00000000..9c2daa67
--- /dev/null
+++ b/test/unittest/python/tst.aggr.sh
@@ -0,0 +1,59 @@
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
+print("keys=", str(entry["keys"]), "value=", str(entry["value"]))
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

