Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A04F4C8FF7
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328683; cv=none; b=iog+mB88ND8rH0mdeBbUmjeIdBs5OpjiwcL3aE9Ehfp4X6gBEcJ4Wv7Oggx3xj+5UhEFH8/xIWlaoTashsWThwv8UtV33jGLInOe4v5g5szsHnvggW3lC2OxOBnkJMp0to2jfKF2E2yznwADVCs/55L9zjnfVCN28LRfSpFQPUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328683; c=relaxed/simple;
	bh=RpD2lvaEzxVpiNQGoNt/uAWr6+mulmeZJBvbwsqnwas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PEgI0Azg0cTHEzPALBOqIMMxQHf2pHUe/7NEm1Uw4R3NkjWy99DX3HgYC9PuiVFr8mlKGQVRALUIKaWOaAJonTnK5hnBYMpJPIBg0VeCKPFJk9Ej1HmCN6t0JPfsqeuR09f9floj2zj9YIrSf/5WuV/Lku0ZlEbrKnbwf2lB8F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aISwMCzp; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aISwMCzp"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LCpMnQ2338579
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=qYWqk
	uoytM+Ehj1bnv+6SKmCoZ+/u2oX66TP8OIwsv4=; b=aISwMCzpvbE+nch1JISvp
	/xHd9XMRgoUssALCEwe7V/IaC+2h2qnGRrz57c8stf91v5lWEpzWeJVCAfdbdyJc
	gawx/xCB9h+IzPQ75T1atZNBC0vaWBgg6C82tA+kgWtfy6ktEWXiFiPOvkyCMHrB
	IYMsnQaBilNTQPglVLxjgTEfbISL7K+ohivknZCHzJ69mK22FUgpSE95SZI47bWp
	6csG00qBBKbeeM0G/80l4KtXTy0YFoa1csFUFfsr4k06DXplyKWp1JkLVfI3yr1n
	XapAOohUD4Wvq16/XHjkc5//Enc75SmXBagISOjML1Gfv2D8E12d9MECpkFcAtMO
	g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g4ydbnaq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67LG5C5a029259
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4g2ejgcn4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:17 +0000 (GMT)
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67LGB2FR014592
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:17 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-51-128.vpn.oracle.com [10.154.51.128])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4g2ejgcmux-12;
	Fri, 21 Aug 2026 16:11:17 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v5 11/11] test: Add a test for the PCP ManagedDTraceScript interface
Date: Fri, 21 Aug 2026 17:10:59 +0100
Message-ID: <20260821161100.41710-12-alan.maguire@oracle.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX4DV9oJ1dwxhZ
 NjLVHnKUcFqiAQfKQsTR8NoxaeLXN0czY1UId14VVwEPdUb8qwzyrTHUQ6mDz1+jn+VFhG71JS5
 btisE3YHwQywtUT3z1W+HagdHOCBKax6AuHwARp3PgCht/V5JUj3WCIBpAsChmPG55Pi18qtAYG
 ftAa+dKUREuJcNKxdSVBrl7ODEc0nKb0Busoe5lQX2DGgi01O6hz3UCuy7bmyrx2nAC+pC04UXK
 Z1ajNpTTE3uvRN4RXQu84ijwTUREXR1z7YhPR6f4xzAZ/d03vrVgHmNdTsbJWG/aIrB0DjxYveH
 W54sisbHOV78JUVEHjo5tCjxtOJC+z9jzZopOi9eXd85wsNusWe6a11W1fNffcdowVku8xrjq7I
 jTC7SBv0QxHl0HcNh9uH96C95Raniok6FzZAGpKB8lqsGZEXDe/2tDG/B31RadTDqcMEHZUenfY
 KtyE/stgQ5ssMFgVJNA==
X-Proofpoint-ORIG-GUID: 3eJJ_0LelQyGlUQRE1K_HV8pLNq7oA_H
X-Proofpoint-GUID: 3eJJ_0LelQyGlUQRE1K_HV8pLNq7oA_H
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX1ZczH8H3u2ko
 IG58FbTHHTECASQYH+xurO61sJ1sKnPjjC0Q9IvlRte3vzIzDFbjeaHr+/9Ln6nI8KAu7DLT9bU
 Et5agmO0XJAT1sP3NSQwmy3lAJnWkpyMf9XvINtl9kKUSEUoj7Go
X-Authority-Analysis: v=2.4 cv=GpJyPE1C c=1 sm=1 tr=0 ts=6a8878a8 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x4eqshVgHu-cdnggieHk:22 a=yPCof4ZbAAAA:8 a=rwxNElBc6Oe9k5UGXKQA:9
 a=WmVTiCyuxqgg3mnwYu6p:22

Since tests cannot rely on a full PCP configuration, do
limited testing of a ManagedDTraceScript, ensuring that
we can create it, start it and that it collects data.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 test/unittest/python/tst.pcp.sh | 69 +++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100755 test/unittest/python/tst.pcp.sh

diff --git a/test/unittest/python/tst.pcp.sh b/test/unittest/python/tst.pcp.sh
new file mode 100755
index 00000000..acc68854
--- /dev/null
+++ b/test/unittest/python/tst.pcp.sh
@@ -0,0 +1,69 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# Test the PCP ManagedDTraceScript with a real DTrace session.
+# @@timeout: 60
+
+if [ $# -ne 1 ]; then
+    echo "usage: $0 <dtrace>" >&2
+    exit 2
+fi
+
+if ! "$DTRACE_PYTHON" -c 'import dtrace, cpmapi, cpmda, pcp.pmapi, pcp.pmda' \
+    >/dev/null 2>&1; then
+    echo "DTrace or PCP Python bindings are unavailable"
+    exit 2
+fi
+
+tmpdir=$(mktemp -d)
+cleanup() { rm -rf "$tmpdir"; }
+trap cleanup EXIT
+
+cat >"$tmpdir/test.py" <<'EOF'
+#!/usr/bin/env python3
+import importlib.machinery
+import importlib.util
+import time
+
+loader = importlib.machinery.SourceFileLoader("pmdadtrace", "pcp/pmdadtrace.python")
+spec = importlib.util.spec_from_loader("pmdadtrace", loader)
+pmdadtrace = importlib.util.module_from_spec(spec)
+spec.loader.exec_module(pmdadtrace)
+
+created = []
+script = pmdadtrace.ManagedDTraceScript(
+    "tick_test", "profile:::tick-1s /$1 == 1/ { @ticks = count(); }", False,
+    {"quiet": True}, ".", None, None, [], ["1"], 0,
+    print,
+)
+script._data_callbacks = {
+    "create_metric": lambda entry: created.append(("metric", entry.metric)),
+    "create_instance": lambda entry: created.append(
+        ("instance", entry.metric, entry.instance)
+    ),
+    "update_instance": lambda entry: None,
+    "remove_instance": lambda entry: None,
+    "refresh_metrics": lambda: None,
+}
+
+ok, error = script.start()
+if not ok:
+    raise SystemExit(f"unable to start ManagedDTraceScript: {error}")
+time.sleep(15)
+script.stop()
+
+entries = script.latest_aggregations()
+if script.state() == "error":
+    raise SystemExit(f"ManagedDTraceScript failed: {script.last_error()}")
+if not any(entry.metric.endswith(".ticks") for entry in entries.values()):
+    raise SystemExit(f"tick aggregation was not published: {entries}")
+if not any(item[0] == "instance" for item in created):
+    raise SystemExit(f"tick metric instance was not created: {created}")
+EOF
+
+chmod +x "$tmpdir/test.py"
+timeout 60 "$DTRACE_PYTHON" "$tmpdir/test.py"
-- 
2.43.5

