Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D3B32F764
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786540949; cv=none; b=oxsjqnAftgRvjAprcDeDXsoOHjk0vFwsJ3whQDtzRzIHHBjK8/AeeXFImsMo63LnsNQNvJd57Sj3CEQCnfXYC7L/Xr9A58NyvX5yVKFCGetyJYssjlv7h/oZgW8Sgu//NAs1QLZYK6geTRDzBb/NAts/usSlrWWZqHy+SSV+2Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786540949; c=relaxed/simple;
	bh=OP2XdeuEF9jtnQzy773tnhYJYFEvTjyEU1SwYxtoRnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mt5IC0mrGamt28xaK83sbWElin7i28bBEqQNmTnIjqUwpQUjwASC+s9/sypQCV+lklpkrMh5n/4dd7yUpch2vBT+du2ohO3ko5aryWMemPh6cgaUBPBYXgNIg9ZegIrVKbfsyvE9gsnCyHYnuBlXJ81SZqntaC9aKCiW1p9XHIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=c07ty45X; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="c07ty45X"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C2QfbB030999
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=CyWoNNFSS/Ntm76z1KMutV0RZUkQ7cW+FR4fbey9fkE=; b=
	c07ty45XnjNxjH8RMyzVN4n1B+3VzdmwwOfklS9ONCNoXQLDS0KKHfbm59vpthgN
	5Mo/UhfBmZ3XwGqTcKtM62DhDOwrXuMXbpw6rYuS9nSIDGIbeJD2CVwvMw+MMNO1
	o6pLvw3hEY3FXucvv1IynfrxzwF7fc08WAfdY1NhK6YRFvyp/Jq1CiOLhmPd4bW2
	+LiLJknXcMoR0CbWhocUwP7/hut7ntYXi8/o3AN/0EhyiR5OO7XDtn+j/SWV5KTk
	Noh673rZJ5ssoeThqIcrI2CGUnY7S4upMMA+8R7kZa0eluORlpdQspTsmw31/DrR
	57ZVc8fhnAp3evyiYh9W5w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4fwvesxr66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67CDKjmD002695
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4fwtwsse6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:23 +0000 (GMT)
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67CDMEC2010792
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:22 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-57-125.vpn.oracle.com [10.154.57.125])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4fwtwsse20-9;
	Wed, 12 Aug 2026 13:22:22 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v4 8/9] dtrace: Add a PCP PMDA to expose DTrace data as metrics
Date: Wed, 12 Aug 2026 14:22:09 +0100
Message-ID: <20260812132212.527871-9-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260812132212.527871-1-alan.maguire@oracle.com>
References: <20260812132212.527871-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608120109
X-Authority-Analysis: v=2.4 cv=R8wz39RX c=1 sm=1 tr=0 ts=6a7c7390 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8
 a=mDV3o1hIAAAA:8 a=sQDrKMPzCu-wlfy1D0UA:9 a=MYSxoHUtoyCdOmrE:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13509
X-Proofpoint-GUID: Wyk_c9zFhLnLV7zK4s0nniJccKrf4kOb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEwOSBTYWx0ZWRfX6pUX5xwheK69
 PfDyKN8whems7Qgx2iXCa2FL25u60/BCPo93/Ye9euY9PkLMZ8Bbf3vk5w0VY7z1xDEmsPQueK1
 wzBGWZbHrmrz4GFP45U5PJNM15LjGXUEu8im0bgdPanbUTTzi3um0AsKUM7+SAW3CxFnyaNucqe
 9rDlbDIq5L1nw5jIaaXHHsnLlTvLdJ+DECcSDyRzn7comZGwp8Hz/Voze2OV3cgEzgUWh3/XRSp
 43EBWd3P09Y67OW2nnFPnmr/GYFljOMTMNUF18ou0oqbr6qJFZDeb6equF63iaMg2y3w2LGix6N
 V+w1tI3whOcU1DsPldrpN+wZrp4hiMQXbylpTTDjj7mEo3kbeVR9qB1dzpsMeMaWJs2QUSWx0Yh
 HusWYzn57gxRCnMFNfCAPROr4EWm1TJKPD2mFtI2x1xRPacCHlbhi9jfB4Fr4B3ICPNzDAg1eDT
 N0Vm60Zb9HZx+lr1g5gZnFiCm52Td6spLINgm+sQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEwOSBTYWx0ZWRfX34xe5zxl1IxI
 5JA7zfqK79wstTNVW7u1tVd2QU5hDujUM+7mAdNns4/2CFdHkVgHDoXa31+k3Ij8W72XyF3szo4
 XHz7P8/6L3nJIp7WGf1Kegccp9skOvb9EATKhlYzIC6uUu6ELA0S
X-Proofpoint-ORIG-GUID: Wyk_c9zFhLnLV7zK4s0nniJccKrf4kOb

This PMDA exposes a way of running DTrace scripts through PCP via the
libdtrace Python bindings. Scripts can be registered dynamically via
`pmstore(1)` calls and optionally autostarted from an on-disk directory when
the PMDA is launched using the autostart.d/ directory.

To register and run a DTrace script to count read system calls:

$ pmstore dtrace.control.register '{"name":"read_syscalls","program":"syscall::read:entry { @c[probefunc] = count(); }", "autostart":"true"}'

Now we see the aggregation data exposed as the metric
`dtrace.scripts.data.read_syscalls.c`, with one instance per
aggregation key:

$ pminfo -f dtrace

dtrace.scripts.data.read_syscalls.c
    inst [0 or "read"] value 9536

dtrace.scripts.runtime_seconds
    inst [0 or "read_syscalls"] value 2
...

To stop, unregister

$ pmstore dtrace.control.stop read_syscalls

$ pmstore dtrace.control.unregister read_syscalls

By default, dynamic registration is restricted to root only;
other users can be added in dtrace.conf.

See pcp/README.md for details.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 pcp/Build                             |   56 ++
 pcp/Install                           |   37 +
 pcp/README.md                         |  260 ++++++
 pcp/Remove                            |   27 +
 pcp/autostart.d/.gitkeep              |    0
 pcp/dtrace.conf                       |   12 +
 pcp/examples/packet_drop_reasons.d    |   14 +
 pcp/examples/packet_drop_reasons.json |    8 +
 pcp/examples/syscall_counts.d         |   11 +
 pcp/examples/syscall_counts.json      |    8 +
 pcp/pmdadtrace.python                 | 1232 +++++++++++++++++++++++++
 11 files changed, 1665 insertions(+)
 create mode 100644 pcp/Build
 create mode 100755 pcp/Install
 create mode 100644 pcp/README.md
 create mode 100755 pcp/Remove
 create mode 100644 pcp/autostart.d/.gitkeep
 create mode 100644 pcp/dtrace.conf
 create mode 100644 pcp/examples/packet_drop_reasons.d
 create mode 100644 pcp/examples/packet_drop_reasons.json
 create mode 100644 pcp/examples/syscall_counts.d
 create mode 100644 pcp/examples/syscall_counts.json
 create mode 100755 pcp/pmdadtrace.python

diff --git a/pcp/Build b/pcp/Build
new file mode 100644
index 00000000..754db762
--- /dev/null
+++ b/pcp/Build
@@ -0,0 +1,56 @@
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+PMDA_NAME := dtrace
+PMDA_OBJDIR := $(DESTDIR)/var/lib/pcp/pmdas/$(PMDA_NAME)
+PMDA_AUTOSTART_OBJDIR := $(PMDA_OBJDIR)/autostart.d
+PMDA_EXAMPLE_OBJDIR := $(PMDA_OBJDIR)/examples
+
+PMDA_EXEC_SCRIPTS := Install Remove pmdadtrace.python
+PMDA_DATA_FILES := README.md dtrace.conf
+PMDA_AUTOSTART_SRC := $(wildcard pcp/autostart.d/*)
+PMDA_AUTOSTART_FILES := $(notdir $(PMDA_AUTOSTART_SRC))
+PMDA_EXAMPLE_SRC := $(wildcard pcp/examples/*)
+PMDA_EXAMPLE_FILES := $(notdir $(PMDA_EXAMPLE_SRC))
+
+PHONIES += install-pmda-$(PMDA_NAME) install-pmda
+
+install:: install-pmda
+
+install-pmda:: install-pmda-$(PMDA_NAME)
+
+install-pmda-$(PMDA_NAME)::
+	$(call describe-install-target,$(PMDA_OBJDIR),$(PMDA_EXEC_SCRIPTS) $(PMDA_DATA_FILES))
+	mkdir -p $(PMDA_OBJDIR) $(PMDA_AUTOSTART_OBJDIR)
+	for f in $(PMDA_EXEC_SCRIPTS); do \
+		install -m 755 pcp/$$f $(PMDA_OBJDIR); \
+	done
+	for f in $(PMDA_DATA_FILES); do \
+		install -m 644 pcp/$$f $(PMDA_OBJDIR); \
+	done
+ifneq ($(PMDA_AUTOSTART_FILES),)
+	$(call describe-install-target,$(PMDA_AUTOSTART_OBJDIR),$(PMDA_AUTOSTART_FILES))
+	mkdir -p $(PMDA_OBJDIR) $(PMDA_AUTOSTART_OBJDIR)
+	for f in $(PMDA_AUTOSTART_FILES); do \
+		mode=644; \
+		case $$f in \
+			*.d) mode=755 ;; \
+		*) ;; \
+		esac; \
+		install -m $$mode pcp/autostart.d/$$f $(PMDA_AUTOSTART_OBJDIR); \
+	done
+endif
+ifneq ($(PMDA_EXAMPLE_FILES),)
+	$(call describe-install-target,$(PMDA_EXAMPLE_OBJDIR),$(PMDA_EXAMPLE_FILES))
+	mkdir -p $(PMDA_OBJDIR) $(PMDA_EXAMPLE_OBJDIR)
+	for f in $(PMDA_EXAMPLE_FILES); do \
+		mode=644; \
+		case $$f in \
+			*.d) mode=755 ;; \
+		*) ;; \
+		esac; \
+		install -m $$mode pcp/examples/$$f $(PMDA_EXAMPLE_OBJDIR); \
+	done
+endif
diff --git a/pcp/Install b/pcp/Install
new file mode 100755
index 00000000..1103bbd2
--- /dev/null
+++ b/pcp/Install
@@ -0,0 +1,37 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
+#
+# Copyright (c) 2026, Oracle and/or its affiliates.
+#
+# This program is free software; you can redistribute it and/or
+# modify it under the terms of the GNU General Public
+# License v2 as published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# General Public License for more details.
+#
+# You should have received a copy of the GNU General Public
+# License along with this program.  If not, see <https://www.gnu.org/licenses/>.
+#
+
+. $PCP_DIR/etc/pcp.env
+. $PCP_SHARE_DIR/lib/pmdaproc.sh
+
+iam=dtrace
+domain=487
+pmda_interface=2
+# Extend PMNS with the shipped namespace fragment
+pmns_update=true
+pmnsfile=$iam
+python_user=root
+python_group=root
+python_opt=true
+daemon_opt=false
+
+ipc_prot="binary notready"
+
+pmdaSetup
+pmdaInstall -U root
+exit
diff --git a/pcp/README.md b/pcp/README.md
new file mode 100644
index 00000000..b8c7b012
--- /dev/null
+++ b/pcp/README.md
@@ -0,0 +1,260 @@
+# SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
+#
+# Copyright (c) 2026, Oracle and/or its affiliates.
+#
+# This program is free software; you can redistribute it and/or
+# modify it under the terms of the GNU General Public
+# License v2 as published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# General Public License for more details.
+#
+# You should have received a copy of the GNU General Public
+# License along with this program.  If not, see <https://www.gnu.org/licenses/>.
+#
+
+
+# dtrace PMDA
+
+This PMDA provides support to collect PCP metrics from DTrace scripts via the
+libdtrace Python bindings. Scripts can be registered dynamically via
+`pmstore(1)` calls and optionally autostarted from an on-disk directory when
+the PMDA is launched.
+
+# Dynamic-script authorization
+
+Dynamic script registration is enabled only for `root` by default. To change
+the policy, edit the root-owned `$PCP_PMDAS_DIR/dtrace/dtrace.conf` file:
+
+```
+[dynamic_scripts]
+enabled = true
+auth_enabled = true
+allowed_users = root,mydtraceuser
+```
+
+When authentication is enabled, every write to `dtrace.control.*` must come
+from an authenticated PCP user named in `allowed_users`. Local `pmstore`
+clients are identified using their Unix UID; remote clients require PCP
+authentication. Leave `auth_enabled` set to `true`: disabling it allows every
+client with `pmcd` store permission to run DTrace programs with the PMDA's
+privileges.
+
+# Metrics
+
+- `dtrace.control.*` metrics are writable strings consumed by the PMDA to
+  register, unregister, start, stop, or reload scripts.  Payloads for
+  `dtrace.control.register` must be JSON objects containing at least the
+  `name` and `program` fields and optional `options` (libdtrace `setopt`
+  key/value pairs), `autostart`, `pid`, `command`, and `defines` fields. `pid` attaches
+  to an existing process, while `command` is the JSON equivalent of
+  `dtrace -c`: it starts a whitespace- and quote-split command under DTrace
+  control. The two target fields are mutually exclusive and initialize
+  `$target` before the program is compiled. `defines` may be an object mapping
+  macro names to values (use `null` for an unvalued macro), or an array of
+  `NAME`/`NAME=VALUE` strings; it enables preprocessing and passes definitions
+  to cpp.
+- `dtrace.scripts.*` metrics form an instance domain over the registered
+  scripts and report each script's current state, autostart flag, last error
+  message, and runtime in seconds.
+
+For example, to create a script which counts system calls that automatically
+starts and collects metrics:
+
+```
+$ pmstore dtrace.control.register '{"name":"syscalls","program":"syscall:::entry { @c[probefunc] = count(); }", "autostart":"true"}'
+dtrace.control.register old value="" new value="{"name":"syscalls","program":"syscall:::entry { @c[probefunc] = count(); }", "autostart":"true"}"
+$ pminfo -f dtrace
+
+dtrace.scripts.data.syscalls.c
+    inst [0 or "bpf"] value 5360
+    inst [1 or "access"] value 278
+    inst [2 or "poll"] value 7949
+    inst [3 or "close"] value 7693
+    inst [4 or "mmap"] value 525
+    inst [5 or "rename"] value 26
+...
+```
+
+Each instance of the metric 'dtrace.scripts.data.syscalls.c' represents
+the aggregation keys/values associated with aggregation '@c'.
+
+Aggregation names beginning with `__` are reserved for internal DTrace use.
+They are still available to the script, but the PMDA does not publish them as
+PCP metrics.  For example, `@__scratch = count();` is intentionally hidden,
+while `@scratch = count();` is exported.
+
+To target a running process, supply its PID and use `$target` in the program:
+
+```
+$ pmstore dtrace.control.register '{"name":"target_reads","pid":1234,"program":"pid$target::read:entry { @reads = count(); }","autostart":true}'
+```
+
+To create a target process, use `command` (the JSON equivalent of `dtrace -c`):
+
+```
+$ pmstore dtrace.control.register '{"name":"sleep","command":"/bin/sleep 30","program":"pid$target::sleep:entry { @calls = count(); }","autostart":true}'
+```
+
+The register payload supports the following keys.  `name` and `program` are
+required; the other keys are optional:
+
+```json
+{
+  "name": "example",
+  "program": "syscall:::entry { @calls[PROBEFUNC] = count(); }",
+  "autostart": true,
+  "separator": ";",
+  "options": {
+    "bufsize": "4m",
+    "aggrate": "1s",
+    "quiet": true
+  },
+  "compile": {
+    "zdefs": true
+  },
+  "defines": {
+    "SAMPLE_RATE": 97,
+    "BUILD_LABEL": "production",
+    "FEATURE_ENABLED": null
+  }
+}
+```
+
+The `compile` object controls compile-time flags.  `zdefs` is equivalent to
+the `dtrace -Z` option and allows probe descriptions that match no probes.
+
+`defines` enables the C preprocessor and accepts either an object, as above,
+or an array of `NAME`/`NAME=VALUE` strings:
+
+```json
+{
+  "name": "conditional",
+  "program": "BEGIN { trace(SAMPLE_RATE); }",
+  "defines": ["SAMPLE_RATE=10", "FEATURE_ENABLED"]
+}
+```
+
+For target selection, specify exactly one of `pid` or `command`:
+
+```json
+{
+  "name": "existing-process",
+  "pid": 1234,
+  "program": "pid$target:::entry { @calls = count(); }"
+}
+```
+
+```json
+{
+  "name": "new-process",
+  "command": "/usr/bin/sleep 30",
+  "program": "pid$target:::entry { @calls = count(); }"
+}
+```
+
+To stop and unregister the script
+
+```
+$ pmstore dtrace.control.unregister syscalls
+```
+
+or to simply stop (while retaining metrics):
+
+```
+$ pmstore dtrace.control.stop syscalls
+```
+
+# Profiling
+
+It is possible to profile using stack keys, and the instance names
+that represent the call stacks can be made to be compatible with
+the expected flamegraph format of `function1;function2`.  To do this,
+the default "." key separator that is used to concatenate key values
+must be overridden with a ";" , i.e.
+
+```
+"separator":";"
+```
+
+For example:
+
+```
+$ pmstore dtrace.control.register '{"name":"profile","program":"profile:::profile-97 { @profile[stack()] = count(); }", "autostart":"true", "separator":";"}'
+dtrace.control.register old value="" new value="{"name":"profile","program":"profile:::profile-97 { @profile[stack()] = count(); }", "autostart":"true"}"
+
+$ pminfo -f dtrace
+
+dtrace.scripts.data.profile.profile
+    inst [0 or "vmlinux`entry_SYSCALL_64_after_hwframe+0x76;vmlinux`do_syscall_64+0xb1;vmlinux`x64_sys_call+0x1cc6;vmlinux`__x64_sys_read+0x1d;vmlinux`ksys_read+0x6d;vmlinux`vfs_read+0xbf;vmlinux`seq_read+0xf9;vmlinux`seq_read_iter+0x2c6;vmlinux`show_smap+0xe7;vmlinux`__show_smap+0x1d1;vmlinux`seq_put_decimal_ull_width+0xae;vmlinux`strlen+0xc"] value 1
+    inst [1 or "vmlinux`entry_SYSCALL_64_after_hwframe+0x76;vmlinux`__audit_syscall_exit+0xa"] value 1
+...
+```
+
+# Autostart
+
+Scripts placed under `$PCP_PMDAS_DIR/dtrace/autostart.d/` with a `.d`
+extension are started automatically when the PMDA becomes ready. Optional
+metadata can be provided by placing a matching `.json` file alongside the `.d`
+file; its contents should mirror the register payload structure (for example,
+to define libdtrace options).
+
+An example pair is provided:
+
+- `examples/syscall_counts.d` – counts system call entries by name.
+- `examples/syscall_counts.json` – marks the script for autostart and
+  enlarges the libdtrace buffers to reduce drops under load.
+- metrics then appear under dtrace.scripts.data.syscall_counts.counts`,
+  with one instance per aggregation key (in this case syscall name):
+
+```
+# pminfo -f dtrace.scripts.data.syscall_counts.counts
+
+dtrace.scripts.data.syscall_counts.counts
+    inst [0 or "mmap"] value 7959
+    inst [1 or "futex"] value 574830
+    inst [2 or "exit"] value 202
+    inst [3 or "dup2"] value 168
+    inst [4 or "times"] value 575
+...
+```
+
+# Installation
+
+First ensure that dtrace and its associated python bindings are installed
+and running.
+
+```
+# cd $PCP_PMDAS_DIR/dtrace
+```
+
+Check there is no clash in the Performance Metrics domain defined in
+as `domain=` in `Install`. If there is a clash, edit the file.
+
+Then run
+
+```
+   # sudo ./Install
+```
+
+Verify PMDA Is running
+
+```
+   # pminfo -f dtrace
+```
+
+# De-installation
+
+```
+# cd $PCP_PMDAS_DIR/dtrace
+# sudo ./Remove
+```
+
+# Troubleshooting
+
+ + Ensure the DTrace Python bindings are installed (`python3 -c 'import dtrace'`).
+ + Confirm the PMDA log (`$PCP_LOG_DIR/pmcd/dtrace.log`) for script errors.
+ + When debugging autostart scripts, temporarily move files out of
+   `autostart.d/` to disable them.
diff --git a/pcp/Remove b/pcp/Remove
new file mode 100755
index 00000000..c8e6315a
--- /dev/null
+++ b/pcp/Remove
@@ -0,0 +1,27 @@
+#! /bin/sh
+# SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
+#
+# Copyright (c) 2026, Oracle and/or its affiliates.
+#
+# This program is free software; you can redistribute it and/or
+# modify it under the terms of the GNU General Public
+# License v2 as published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# General Public License for more details.
+#
+# You should have received a copy of the GNU General Public
+# License along with this program.  If not, see <https://www.gnu.org/licenses/>.
+#
+
+. $PCP_DIR/etc/pcp.env
+. $PCP_SHARE_DIR/lib/pmdaproc.sh
+
+iam=dtrace
+
+pmdaSetup
+pmdaRemove
+exit
+
diff --git a/pcp/autostart.d/.gitkeep b/pcp/autostart.d/.gitkeep
new file mode 100644
index 00000000..e69de29b
diff --git a/pcp/dtrace.conf b/pcp/dtrace.conf
new file mode 100644
index 00000000..6863cc51
--- /dev/null
+++ b/pcp/dtrace.conf
@@ -0,0 +1,12 @@
+# DTrace PMDA configuration
+#
+# Dynamic scripts execute with the PMDA's privileges.  The default policy
+# permits only the authenticated root user to control them.
+[dynamic_scripts]
+enabled = true
+
+# When enabled, only authenticated users named in allowed_users may write to
+# dtrace.control.*.  Disabling this is unsafe: any client permitted by pmcd to
+# store a metric can execute a DTrace program as the PMDA user.
+auth_enabled = true
+allowed_users = root
diff --git a/pcp/examples/packet_drop_reasons.d b/pcp/examples/packet_drop_reasons.d
new file mode 100644
index 00000000..c2516691
--- /dev/null
+++ b/pcp/examples/packet_drop_reasons.d
@@ -0,0 +1,14 @@
+/* Count packet drops by reason (SOCKET_CLOSE) etc */
+
+BEGIN
+{
+	drop_reasons = (char **)`drop_reasons_core;
+	num_core_reasons = *(size_t *)(`drop_reasons_core+sizeof(char *));
+}
+
+sdt:::kfree_skb
+/arg4 < num_core_reasons /
+{
+	reason = stringof(drop_reasons[arg4]);
+	@drops[reason] = count();
+}
diff --git a/pcp/examples/packet_drop_reasons.json b/pcp/examples/packet_drop_reasons.json
new file mode 100644
index 00000000..3b26f0f4
--- /dev/null
+++ b/pcp/examples/packet_drop_reasons.json
@@ -0,0 +1,8 @@
+{
+  "name": "packet_drop_reasons",
+  "autostart": true,
+  "options": {
+    "bufsize": "16m",
+    "aggsize": "8m"
+  }
+}
diff --git a/pcp/examples/syscall_counts.d b/pcp/examples/syscall_counts.d
new file mode 100644
index 00000000..ec475bcf
--- /dev/null
+++ b/pcp/examples/syscall_counts.d
@@ -0,0 +1,11 @@
+/* Count system call invocations per syscall name */
+
+syscall:::entry
+{
+    @counts[probefunc] = count();
+}
+
+END
+{
+    printf("Tracing stopped for syscall_counts (see PCP metrics for live data)\n");
+}
diff --git a/pcp/examples/syscall_counts.json b/pcp/examples/syscall_counts.json
new file mode 100644
index 00000000..d4248fbc
--- /dev/null
+++ b/pcp/examples/syscall_counts.json
@@ -0,0 +1,8 @@
+{
+  "name": "syscall_counts",
+  "autostart": true,
+  "options": {
+    "bufsize": "16m",
+    "aggsize": "8m"
+  }
+}
diff --git a/pcp/pmdadtrace.python b/pcp/pmdadtrace.python
new file mode 100755
index 00000000..b8429f3d
--- /dev/null
+++ b/pcp/pmdadtrace.python
@@ -0,0 +1,1232 @@
+#!/usr/bin/env pmpython
+# SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
+
+# Copyright (c) 2026, Oracle and/or its affiliates.
+
+"""DTrace Performance Metrics Domain Agent.
+
+This PMDA allows DTrace scripts to be registered dynamically through pmstore
+and supports autostarting scripts from a configuration directory. Scripts are
+executed using the libdtrace Python bindings.
+"""
+
+import atexit
+import configparser
+import json
+import os
+import pwd
+import re
+import shlex
+import threading
+import time
+from collections import defaultdict
+from numbers import Number
+from pathlib import Path
+from typing import Any, Callable, Dict, Iterable, List, NamedTuple, Optional, Set, Tuple
+
+try:
+    from dtrace import DTraceError, DTraceSession, DTraceProgram  # type: ignore
+except ImportError:  # pragma: no cover - fallback for in-tree testing
+    _HERE = Path(__file__).resolve()
+    for candidate in (_HERE.parents[2] / "bindings" / "python" / "src",):
+        if candidate.is_dir() and str(candidate) not in os.sys.path:
+            os.sys.path.insert(0, str(candidate))
+    from dtrace import DTraceError, DTraceSession, DTraceProgram  # type: ignore  # noqa: E402
+
+import cpmapi as c_api
+import cpmda
+
+_DTRACE_GLOBAL_LOCK = threading.RLock()
+from pcp.pmapi import pmContext as PCP
+from pcp.pmapi import pmUnits
+from pcp.pmda import PMDA, pmdaGetContext, pmdaIndom, pmdaInstid, pmdaMetric
+
+_SANITIZE_COMPONENT = re.compile(r"[^A-Za-z0-9_\+\.;`]+")
+_IGNORED_AGGREGATION_PREFIX = "__"
+
+def _sanitize_component(value: Any) -> str:
+    if isinstance(value, bytes):
+        value = value.decode("utf-8", errors="ignore")
+    text = str(value) if value is not None else ""
+    safe = _SANITIZE_COMPONENT.sub("_", text).strip("_")
+    return safe or "value"
+
+class AggregationEntry(NamedTuple):
+    metric: str
+    instance: str
+    script: str
+    source: str
+    value: int 
+    samples: Optional[int]
+    normal: Optional[int]
+    action: str
+    keys: Tuple[str, ...]
+
+class DataInstance:
+
+    def __init__(
+        self,
+        metric: 'DataMetric',
+        instance: str,
+        id:int,
+        value: Any
+    ) -> None:
+        self._metric = metric
+        self._instance = instance
+        self._instance_id = id
+        self._value = value
+        self._instid = pmdaInstid(self._instance_id, instance)
+        metric._data_indom_insts.append(self._instid)
+
+class DataMetric:
+
+    def __init__(
+        self,
+        metric: pmdaMetric,
+        pmid: str,
+        name: str,
+        cluster: int,
+        script: str,
+        variant: str,
+        indom: int,
+        indom_id: int,
+        metric_id: int,
+        instance_next: int,
+    ) -> None:
+        self.metric = metric
+        self.pmid = pmid
+        self.name = name
+        self.cluster = cluster
+        self.script = script
+        self.variant = variant
+        self.indom = indom
+        self.indom_id = indom_id
+        self.metric_id = metric_id
+        self._instance_next = instance_next
+        self._data_instances = {}
+        self._data_instance_ids = {}
+        self._data_indom_insts = []
+
+class ManagedDTraceScript:
+    """Wraps a DTrace script lifecycle using libdtrace."""
+
+    _START_TIMEOUT = 10.0
+    _POLL_INTERVAL = 1.0
+
+    def __init__(
+        self,
+        name: str,
+        program: str,
+        autostart: bool,
+        options: Optional[Dict[str, Any]],
+        separator: Optional[str],
+        pid: Optional[int],
+        command: Optional[List[str]],
+        defines: Optional[List[str]],
+        compile_flags: int,
+        logger,
+    ) -> None:
+        self.name = name
+        self.program = program
+        self.autostart = autostart
+        self.options = dict(options or {})
+        self.options.setdefault("quiet", True)
+        self.separator = separator or "."
+        self.pid = pid
+        self.command = list(command) if command else None
+        self.defines = list(defines or [])
+        self.compile_flags = compile_flags
+        self._log = logger
+        self._lock = threading.RLock()
+        self._thread: Optional[threading.Thread] = None
+        self._stop_thread: Optional[threading.Thread] = None
+        self._stop = threading.Event()
+        self._session: Optional[DTraceSession] = None
+        self._state = "stopped"
+        self._last_error = ""
+        self._started_at: Optional[float] = None
+        self._data_callbacks = {
+        }
+        self._aggregation_cache: Dict[str, AggregationEntry] = {}
+
+    # ------------------------------------------------------------------
+    # Public accessors
+    # ------------------------------------------------------------------
+    def metric_prefix(self) -> str:
+        return "dtrace.scripts.data." + _sanitize_component(self.name) + "."
+
+    def state(self) -> str:
+        with self._lock:
+            return self._state
+
+    def last_error(self) -> str:
+        with self._lock:
+            return self._last_error
+
+    def is_running(self) -> bool:
+        return self.state() == "running"
+
+    def runtime_seconds(self) -> int:
+        with self._lock:
+            if self._state != "running" or self._started_at is None:
+                return 0
+            return int(time.time() - self._started_at)
+
+    # ------------------------------------------------------------------
+    # Lifecycle helpers
+    # ------------------------------------------------------------------
+    def start(self) -> Tuple[bool, str]:
+        self._log(f"script {self.name} starting")
+        with self._lock:
+            if self._thread and self._thread.is_alive():
+                return True, ""
+            self._stop.clear()
+            self._state = "starting"
+            self._thread = threading.Thread(
+                target=self._run, name=f"dtrace:{self.name}", daemon=True
+            )
+            self._thread.start()
+
+        deadline = time.time() + self._START_TIMEOUT
+        while time.time() < deadline:
+            state = self.state()
+            if state == "running":
+                return True, ""
+            if state == "error":
+                return False, self.last_error() or "failed to start"
+            time.sleep(0.1)
+
+        if self.state() == "running":
+            return True, ""
+        return False, self.last_error() or "timeout waiting for DTrace startup"
+
+    def stop(self) -> None:
+        self._log(f"script {self.name} stopping")
+        with self._lock:
+            if not self._thread:
+                self._state = "stopped"
+                return
+        self._stop.set()
+
+    def update_definition(
+        self,
+        program: str,
+        options: Optional[Dict[str, Any]],
+        pid: Optional[int],
+        command: Optional[List[str]],
+        defines: Optional[List[str]],
+        compile_flags: int,
+    ) -> None:
+        restart = self.is_running()
+        if restart:
+            self.stop()
+        with self._lock:
+            self.program = program
+            if options is not None:
+                self.options = options
+            self.pid = pid
+            self.command = list(command) if command else None
+            self.defines = list(defines or [])
+            self.compile_flags = compile_flags
+        if restart:
+            ok, error = self.start()
+            if not ok:
+                self._log(f"failed to restart script {self.name}: {error}")
+
+    # ------------------------------------------------------------------
+    # Internal execution loop
+    # ------------------------------------------------------------------
+    def _run(self) -> None:
+        self._log(f"script {self.name} running")
+        target = None
+        try:
+            session = DTraceSession()
+        except Exception as exc:  # pylint: disable=broad-except
+            self._fail("session creation", str(exc))
+            return
+
+        with self._lock:
+            self._session = session
+            self._last_error = ""
+
+        try:
+            # Compilation uses global variables; lock to prevent interference
+            with _DTRACE_GLOBAL_LOCK:
+                self._apply_options(session)
+                for macro in self.defines:
+                    session.setopt("cpp", None)
+                    session.setopt("define", macro)
+                if self.pid is not None:
+                    target = session.proc_grab_pid(self.pid)
+                elif self.command is not None:
+                    target = session.proc_create(self.command)
+                compiled = session.compile(self.program, cflags=self.compile_flags)
+            session.enable(compiled)
+            session.go()
+            if target is not None:
+                session.proc_continue(target)
+            with self._lock:
+                self._state = "running"
+                self._started_at = time.time()
+
+            while not self._stop.is_set():
+                set = self._stop.wait(timeout=self._POLL_INTERVAL)
+                if set:
+                    break
+                try:
+                    session.work()
+                    session.agg_snap()
+                    updates = self._walk_aggregations(session)
+                    # encourage thread yield
+                    time.sleep(0.001)
+                except DTraceError as exc:  # pragma: no cover - runtime error path
+                    self._fail("session execution", str(exc))
+                    break
+
+        except Exception as exc:  # pylint: disable=broad-except
+            self._fail("session initiation", str(exc))
+        finally:
+            try:
+                session.stop()
+                # Ensure we get final view of data (truncated aggregations etc)
+                session.agg_snap()
+                updates = self._walk_aggregations(session)
+                self._log(f"session stopped for {self.name}")
+            except Exception:  # pragma: no cover - best effort cleanup
+                pass
+            if target is not None:
+                try:
+                    session.proc_release(target)
+                except Exception:  # pragma: no cover - best effort cleanup
+                    pass
+            try:
+                session.close()
+                self._log(f"session closed for {self.name}")
+            except Exception:  # pragma: no cover - best effort cleanup
+                pass
+            with self._lock:
+                if self._state == "running":
+                    self._state = "stopped"
+                self._session = None
+
+    def _apply_options(self, session: DTraceSession) -> None:
+        self._log(f"applying options to {self.name}")
+        if not self.options:
+            return
+        for key, value in self._normalize_options(self.options):
+            try:
+                session_setopt = session.setopt
+            except AttributeError:  # pragma: no cover - safety net
+                continue
+            try:
+                session_setopt(key, value)
+            except Exception as exc:  # pylint: disable=broad-except
+                self._log(
+                    f"unable to set option '{key}' for script {self.name}: {exc}"
+                )
+
+    @staticmethod
+    def _normalize_options(options: Dict[str, Any]) -> Iterable[Tuple[str, Optional[str]]]:
+        for key, value in options.items():
+            if isinstance(value, bool):
+                yield str(key), None if value else "0"
+            elif value is None:
+                yield str(key), None
+            else:
+                yield str(key), str(value)
+
+    def _fail(self, ctx: str, message: str) -> None:
+        with self._lock:
+            self._state = "error"
+            self._last_error = message
+        self._log(f"script {self.name} encountered an error during {ctx}: {message}")
+        with self._lock:
+            self._aggregation_cache.clear()
+
+
+    def register_data_callbacks(
+        self,
+        pmda
+    ) -> None:
+        with self._lock:
+            for key in pmda._data_callbacks.keys():
+                self._data_callbacks[key] = pmda._data_callbacks[key]
+
+    def unregister_data_callbacks(
+        self,
+        pmda
+      ):
+        remove_metrics = None
+        with self._lock:
+            if "remove_metrics" in self._data_callbacks:
+                remove_metrics = self._data_callbacks["remove_metrics"]
+            self._data_callbacks = {}
+            if remove_metrics is not None:
+                remove_metrics(self)
+
+    def latest_aggregations(self) -> Dict[str, AggregationEntry]:
+        with self._lock:
+            return dict(self._aggregation_cache)
+
+    def _walk_aggregations(self, session: DTraceSession) -> Dict[str, AggregationEntry]:
+        try:
+            snapshot = session.agg_walk()
+        except Exception as exc:  # pylint: disable=broad-except
+            self._log(f"aggregation walk failed for {self.name}: {exc}")
+            return {}
+
+        updates: Dict[Tuple, AggregationEntry] = {}
+        for record in snapshot:
+            metric_name = self._metric_name_from_record(record)
+            if not metric_name:
+                continue
+            instance_name = self._data_instance_from_record(record)
+            if not instance_name:
+                continue
+            entry = AggregationEntry(
+                metric=metric_name,
+                instance=instance_name,
+                script=self.name,
+                source=record.get("name", ""),
+                value=self._coerce_int(record.get("value")),
+                samples=self._coerce_int(record.get("samples")),
+                normal=self._coerce_int(record.get("normal")),
+                action=str(record.get("action", "")),
+                keys=tuple(str(k) for k in record.get("keys", [])),
+            )
+            updates[(metric_name, instance_name)] = entry
+        with self._lock:
+            previous = self._aggregation_cache
+            self._aggregation_cache = updates
+
+        current_keys = set(updates)
+        previous_keys = set(previous)
+        created = current_keys - previous_keys
+        removed = previous_keys - current_keys
+
+        refresh = False
+        for key in created:
+            entry = updates[key]
+            try:
+                with self._lock:
+                    if "create_metric" in self._data_callbacks:
+                        self._data_callbacks["create_metric"](entry)
+                    if "create_instance" in self._data_callbacks:
+                        self._data_callbacks["create_instance"](entry)
+                        refresh = True
+            except Exception as exc:  # pylint: disable=broad-except
+                self._log(
+                    f"create callback error for {self.name}:{entry.metric}: {exc}"
+                )
+
+        for key in current_keys & previous_keys:
+            entry = updates[key]
+            try:
+                with self._lock:
+                    if "update_instance" in self._data_callbacks:
+                        self._data_callbacks["update_instance"](entry)
+            except Exception as exc:  # pylint: disable=broad-except
+                self._log(
+                    f"update callback error for {self.name}:{entry.metric}: {exc}"
+                )
+
+        for key in removed:
+            entry = previous[key]
+            try:
+                with self._lock:
+                    if "remove_instance" in self._data_callbacks:
+                        self._data_callbacks["remove_instance"](entry)
+                        refresh = True
+            except Exception as exc:  # pylint: disable=broad-except
+                self._log(
+                    f"remove callback error for {self.name}:{entry.metric}: {exc}"
+                )
+        if refresh: 
+            with self._lock:
+                if "refresh_metrics" in self._data_callbacks:
+                    self._data_callbacks["refresh_metrics"]()
+        return updates
+
+    def _metric_name_from_record(self, record: Dict[str, Any]) -> Optional[str]:
+        source = record.get("name")
+        if not source or str(source).startswith(_IGNORED_AGGREGATION_PREFIX):
+            return None
+        return self.metric_prefix() + _sanitize_component(source)
+
+    def _data_instance_from_record(self, record: Dict[str, Any]) -> Optional[str]:
+        parts = []
+        for key in record.get("keys", []):
+            # key component may be a list (stack)
+            if isinstance(key, list):
+                k = self.separator.join(key)
+            else:
+                k = key
+            parts.append(_sanitize_component(k))
+        return self.separator.join(parts)
+
+    @staticmethod
+    def _coerce_int(value: Any) -> Optional[int]:
+        if value is None:
+            return None
+        if isinstance(value, int):
+            return value
+        if isinstance(value, Number):
+            return int(value)
+        try:
+            return int(value)
+        except (TypeError, ValueError):
+            return None
+
+class DTracePMDA(PMDA):
+    """PCP PMDA providing DTrace control and state metrics."""
+
+    class Control:
+        CLUSTER = 0
+        REGISTER = 0
+        UNREGISTER = 1
+        START = 2
+        STOP = 3
+        RELOAD = 4
+
+    class Scripts:
+        CLUSTER = 1
+        STATE = 0
+        AUTOSTART = 1
+        LAST_ERROR = 2
+        RUNTIME = 3
+
+    class Data:
+        CLUSTER = 2
+
+    def _create_metric(self, entry: AggregationEntry):
+        if entry.metric in self._data_metrics:
+            return
+        metric_id = self._metric_next
+        indom = self._indom_next
+        indom_id = self.indom(indom)
+        self.add_indom(pmdaIndom(indom_id, []), "DTrace metric data", "DTrace data for metric")
+        self._indom_next += 1
+
+        metric = pmdaMetric(
+                            self.pmid(indom, metric_id),
+                            c_api.PM_TYPE_DOUBLE,
+                            indom_id,
+                            c_api.PM_SEM_DISCRETE,
+                            self._units_none,
+        )
+        try:
+            self.add_metric(entry.metric, metric)
+        except Exception as exc:
+            self.log(f"failed to add metric {entry.metric}: {exc}")
+        self._data_metrics[entry.metric] = DataMetric(
+                                                      metric=metric,
+                                                      pmid=metric.m_desc.pmid,
+                                                      name=entry.metric,
+                                                      script=entry.script,
+                                                      cluster=self.Data.CLUSTER,
+                                                      variant=entry.source,
+                                                      indom=indom,
+                                                      indom_id=indom_id,
+                                                      metric_id=metric_id,
+                                                      instance_next=0
+        )
+        self._data_metric_ids[(indom, metric_id)] = self._data_metrics[entry.metric]
+
+    def _create_instance(self, entry: AggregationEntry):
+
+        names = (entry.metric, entry.instance)
+        if entry.metric not in self._data_metrics:
+            return
+        metric = self._data_metrics[entry.metric]
+        if entry.instance in metric._data_instances:
+            return
+        instance_id = metric._instance_next
+        metric._instance_next += 1
+        metric._data_instances[entry.instance] = DataInstance(metric,
+                                                              entry.instance,
+                                                              instance_id,
+                                                              entry.value)
+        metric._data_instance_ids[instance_id] = metric._data_instances[entry.instance]
+
+    def _update_instance(self, entry: AggregationEntry):
+        if entry.metric not in self._data_metrics:
+            return
+        metric = self._data_metrics[entry.metric]
+        if entry.instance not in metric._data_instances:
+            return
+        instance = metric._data_instances[entry.instance]
+        instance._value = entry.value
+
+    def _remove_instance_by_name(self, m:str, i:str):
+        if m not in self._data_metrics:
+            return
+        metric = self._data_metrics[m]
+        if i not in metric._data_instances:
+            return
+        instance = metric._data_instances[i]
+        if instance._instid in metric._data_indom_insts:
+            metric._data_indom_insts.remove(instance._instid)
+        if instance._instance_id in metric._data_instance_ids:
+            metric._data_instance_ids.pop(instance._instance_id, None)
+
+    def _remove_instance(self, entry: AggregationEntry):
+        self._log(f"removing instance {entry.metric}, {entry.instance}")
+        self._remove_instance_by_name(entry.metric, entry.instance)
+
+    def _remove_metrics(self, script:ManagedDTraceScript):
+        prefix = script.metric_prefix()
+        self.log(f"removing metrics for {script.name}")
+        for m in list(self._data_metrics.keys()):
+            if not m.startswith(prefix):
+                continue
+            metric = self._data_metrics[m]
+            indom = metric.indom
+            metric_id = metric.metric_id
+            self.replace_indom(metric.indom_id, [])
+            self._data_metrics.pop(m, None)
+            self._data_metric_ids.pop((indom, metric_id), None)
+            self.remove_metric(m, metric.metric)
+
+    def _refresh_metrics(self):
+        self._rebuild_data_indom()
+        self.set_notify_change()
+        cpmda.set_need_refresh()
+
+    def __init__(self, name: str, domain: int) -> None:
+        super().__init__(name, domain)
+
+        self.set_user("root")
+
+        self._lock = threading.RLock()
+        (
+            self._dynamic_scripts_enabled,
+            self._auth_enabled,
+            self._allowed_users,
+        ) = self._load_control_config()
+        self._ctx_usernames: Dict[int, str] = {}
+        self._scripts: Dict[str, ManagedDTraceScript] = {}
+        self._inst_map: Dict[Tuple, str] = {}
+        self._next_inst = 0
+        self._indom_next = 2
+        self._data_metrics: Dict[str, DataMetric] = {}
+        self._data_metric_ids: Dict[Tuple, DataMetric] = {}
+        self._metric_next = 0
+
+        self.script_indom_id = self.indom(0)
+
+        self._data_callbacks = {
+                "create_metric" : self._create_metric,
+                "remove_metrics" : self._remove_metrics,
+                "refresh_metrics" : self._refresh_metrics,
+                "create_instance" : self._create_instance,
+                "update_instance" : self._update_instance,
+                "remove_instance" : self._remove_instance
+        }
+        self.script_indom = pmdaIndom(self.script_indom_id, [])
+        self.add_indom(self.script_indom, "DTrace scripts", "Registered scripts")
+
+        self._units_none = pmUnits()
+        self._units_seconds = pmUnits(0, 1, 0, 0, c_api.PM_TIME_SEC, 0)
+
+        # Require credential PDUs to avoid TYPE-0 handshake downgrade.
+        self.set_comm_flags(cpmda.PMDA_FLAG_AUTHORIZE)
+
+        self.log(f"Adding metrics for PMDA..")
+        self.add_metric(
+            "dtrace.control.register",
+            pmdaMetric(
+                self.pmid(self.Control.CLUSTER, self.Control.REGISTER),
+                c_api.PM_TYPE_STRING,
+                c_api.PM_INDOM_NULL,
+                c_api.PM_SEM_INSTANT,
+                self._units_none,
+            ),
+            "Register a DTrace script via JSON payload",
+        )
+        self.add_metric(
+            "dtrace.control.unregister",
+            pmdaMetric(
+                self.pmid(self.Control.CLUSTER, self.Control.UNREGISTER),
+                c_api.PM_TYPE_STRING,
+                c_api.PM_INDOM_NULL,
+                c_api.PM_SEM_INSTANT,
+                self._units_none,
+            ),
+            "Unregister an existing DTrace script",
+        )
+        self.add_metric(
+            "dtrace.control.start",
+            pmdaMetric(
+                self.pmid(self.Control.CLUSTER, self.Control.START),
+                c_api.PM_TYPE_STRING,
+                c_api.PM_INDOM_NULL,
+                c_api.PM_SEM_INSTANT,
+                self._units_none,
+            ),
+            "Start a registered DTrace script",
+        )
+        self.add_metric(
+            "dtrace.control.stop",
+            pmdaMetric(
+                self.pmid(self.Control.CLUSTER, self.Control.STOP),
+                c_api.PM_TYPE_STRING,
+                c_api.PM_INDOM_NULL,
+                c_api.PM_SEM_INSTANT,
+                self._units_none,
+            ),
+            "Stop a running DTrace script",
+        )
+        self.add_metric(
+            "dtrace.control.reload",
+            pmdaMetric(
+                self.pmid(self.Control.CLUSTER, self.Control.RELOAD),
+                c_api.PM_TYPE_STRING,
+                c_api.PM_INDOM_NULL,
+                c_api.PM_SEM_INSTANT,
+                self._units_none,
+            ),
+            "Reload autostart scripts from disk",
+        )
+
+        self.add_metric(
+            "dtrace.scripts.state",
+            pmdaMetric(
+                self.pmid(self.Scripts.CLUSTER, self.Scripts.STATE),
+                c_api.PM_TYPE_STRING,
+                self.script_indom_id,
+                c_api.PM_SEM_DISCRETE,
+                self._units_none,
+            ),
+            "State of each registered DTrace script",
+        )
+        self.add_metric(
+            "dtrace.scripts.autostart",
+            pmdaMetric(
+                self.pmid(self.Scripts.CLUSTER, self.Scripts.AUTOSTART),
+                c_api.PM_TYPE_U32,
+                self.script_indom_id,
+                c_api.PM_SEM_DISCRETE,
+                self._units_none,
+            ),
+            "Whether the script autostarts on PMDA load",
+        )
+        self.add_metric(
+            "dtrace.scripts.last_error",
+            pmdaMetric(
+                self.pmid(self.Scripts.CLUSTER, self.Scripts.LAST_ERROR),
+                c_api.PM_TYPE_STRING,
+                self.script_indom_id,
+                c_api.PM_SEM_DISCRETE,
+                self._units_none,
+            ),
+            "Most recent error message for the script",
+        )
+        self.add_metric(
+            "dtrace.scripts.runtime_seconds",
+            pmdaMetric(
+                self.pmid(self.Scripts.CLUSTER, self.Scripts.RUNTIME),
+                c_api.PM_TYPE_U64,
+                self.script_indom_id,
+                c_api.PM_SEM_INSTANT,
+                self._units_seconds,
+            ),
+            "Seconds the script has been running",
+        )
+
+        self.set_fetch_callback(self._fetch_callback)
+        self.set_store_callback(self._store_callback)
+        self.set_attribute_callback(self._attribute_callback)
+        self.set_endcontext_callback(self._endcontext_callback)
+        self.set_user("root")
+
+        self._autostart_dir = (
+            Path(PCP.pmGetConfig("PCP_PMDAS_DIR")) / self.read_name() / "autostart.d"
+        )
+
+        atexit.register(self._shutdown_scripts)
+
+        if not self._in_pmda_setup():
+            # If running a newer pcp python binding that supports credentials,
+            # explicitly tell the C layer how to fall back if the server is old.
+            if cpmda and hasattr(cpmda, 'pmdaSetFlags'):
+                try:
+                    # PMDA_FLAG_CREDS_OPTIONAL allows the agent to handle
+                    # credentials if sent, but fall back seamlessly if an
+                    # older pmcd sends nothing.
+                    # PMDA_FLAG_CREDS_OPTIONAL constant value is typically 0x4
+                    cpmda.pmdaSetFlags(0x4)
+                except Exception:
+                    pass
+            try:
+                self.connect_pmcd()
+            except Exception as e:
+                sys.stderr.write(f"Connection failed: {str(e)}\n")
+                sys.exit(1)
+            self.reload_autostart()
+            self.pmda_ready()
+            self.log("Ready to process DTrace control requests.")
+
+    # ------------------------------------------------------------------
+    # Store callback handling control metrics
+    # ------------------------------------------------------------------
+    @staticmethod
+    def _load_control_config() -> Tuple[bool, bool, Set[str]]:
+        """Load the root-owned dynamic-script authorization policy."""
+        config = configparser.ConfigParser()
+        config_path = (
+            Path(PCP.pmGetConfig("PCP_PMDAS_DIR")) / "dtrace" / "dtrace.conf"
+        )
+
+        # Secure defaults: do not permit dynamically supplied programs.
+        enabled = False
+        auth_enabled = True
+        allowed_users: Set[str] = set()
+
+        try:
+            config.read(config_path)
+            if not config.has_section("dynamic_scripts"):
+                return enabled, auth_enabled, allowed_users
+
+            enabled = config.getboolean(
+                "dynamic_scripts", "enabled", fallback=enabled
+            )
+            auth_enabled = config.getboolean(
+                "dynamic_scripts", "auth_enabled", fallback=auth_enabled
+            )
+            configured_users = config.get(
+                "dynamic_scripts", "allowed_users", fallback=""
+            )
+        except (OSError, ValueError, configparser.Error):
+            return False, True, set()
+
+        allowed_users = {
+            user.strip() for user in configured_users.split(",") if user.strip()
+        }
+        return enabled, auth_enabled, allowed_users
+
+    def _attribute_callback(self, ctx: int, attr: int, value: str) -> None:
+        """Associate an authenticated client identity with its PCP context."""
+        if attr == cpmda.PMDA_ATTR_USERNAME:
+            with self._lock:
+                self._ctx_usernames[ctx] = value
+            return
+
+        if attr != cpmda.PMDA_ATTR_USERID:
+            return
+
+        try:
+            username = pwd.getpwuid(int(value)).pw_name
+        except (KeyError, OverflowError, ValueError):
+            # Do not retain an earlier, less trustworthy identity.
+            with self._lock:
+                self._ctx_usernames.pop(ctx, None)
+            return
+
+        with self._lock:
+            self._ctx_usernames[ctx] = username
+
+    def _endcontext_callback(self, ctx: int) -> None:
+        with self._lock:
+            self._ctx_usernames.pop(ctx, None)
+
+    def _control_store_permitted(self) -> bool:
+        if not self._dynamic_scripts_enabled:
+            return False
+        if not self._auth_enabled:
+            return True
+
+        try:
+            ctx = pmdaGetContext()
+        except Exception:  # pragma: no cover - PMDA library failure
+            return False
+
+        with self._lock:
+            username = self._ctx_usernames.get(ctx)
+        return username is not None and username in self._allowed_users
+
+    def _store_callback(self, cluster: int, item: int, inst: int, value: Any) -> int:
+        self.log(f"store callback")
+        if cluster != self.Control.CLUSTER:
+            return c_api.PM_ERR_PMID
+
+        if not self._control_store_permitted():
+            self.err("DTrace control store denied by dynamic-script policy")
+            return c_api.PM_ERR_PERMISSION
+
+        if isinstance(value, bytes):
+            text = value.decode("utf-8", errors="ignore")
+        else:
+            text = str(value)
+
+        if item == self.Control.REGISTER:
+            return self._handle_register(text)
+        if item == self.Control.UNREGISTER:
+            return self._handle_unregister(text)
+        if item == self.Control.START:
+            return self._handle_start(text)
+        if item == self.Control.STOP:
+            return self._handle_stop(text)
+        if item == self.Control.RELOAD:
+            self.reload_autostart()
+            return 0
+        return c_api.PM_ERR_PMID
+
+    def _handle_register(self, payload: str) -> int:
+        self.log(f"handle register {payload}")
+        try:
+            data = json.loads(payload)
+        except json.JSONDecodeError:
+            self.err("register payload must be valid JSON")
+            return c_api.PM_ERR_VALUE
+        if not isinstance(data, dict):
+            self.err("register payload must be a JSON object")
+            return c_api.PM_ERR_VALUE
+
+        name = data.get("name")
+        program = data.get("program")
+        if not name or not isinstance(name, str) or not program:
+            self.err("register payload requires string 'name' and 'program'")
+            return c_api.PM_ERR_VALUE
+
+        self.log(f"program is {program}")
+        options = data.get("options") if isinstance(data.get("options"), dict) else {}
+        separator = data.get("separator") if isinstance(data.get("separator"), str) else "."
+        autostart = bool(data.get("autostart", False))
+        pid, command = self._parse_target(data)
+        if pid is None and command is None and (
+            "pid" in data or "command" in data
+        ):
+            return c_api.PM_ERR_VALUE
+        defines = self._parse_defines(data.get("defines"))
+        if defines is None:
+            return c_api.PM_ERR_VALUE
+        compile_flags = self._parse_compile_flags(data.get("compile"))
+        if compile_flags is None:
+            return c_api.PM_ERR_VALUE
+        self.log(f"autostart is {autostart}")
+
+        with self._lock:
+            script = self._scripts.get(name)
+            if script:
+                script.autostart = autostart
+                script.separator = separator
+                script.update_definition(
+                    program, options, pid, command, defines, compile_flags
+                )
+            else:
+                script = ManagedDTraceScript(
+                    name, program, autostart, options, separator, pid, command,
+                    defines,
+                    compile_flags,
+                    self.log,
+                )
+                self._scripts[name] = script
+                self._assign_instance(name)
+            script.register_data_callbacks(self)
+
+        if autostart:
+            self.log(f"starting script {name}...")
+            ok, error = script.start()
+            if not ok:
+                self.err(f"failed to start script {name}: {error}")
+            self.log(f"script {name} started ok")
+        return 0
+
+    def _parse_target(
+        self, data: Dict[str, Any]
+    ) -> Tuple[Optional[int], Optional[List[str]]]:
+        """Validate JSON equivalents of dtrace(1)'s -p and -c options."""
+        pid = data.get("pid")
+        command = data.get("command")
+
+        if pid is not None and command is not None:
+            self.err("register payload must specify only one of 'pid' or 'command'")
+            return None, None
+
+        if pid is not None:
+            if isinstance(pid, bool) or not isinstance(pid, int) or pid <= 0:
+                self.err("register payload 'pid' must be a positive integer")
+                return None, None
+            if pid > 0x7fffffff:
+                self.err("register payload 'pid' is out of range")
+                return None, None
+            return pid, None
+
+        if command is not None:
+            if not isinstance(command, str):
+                self.err("register payload 'command' must be a non-empty string")
+                return None, None
+            try:
+                argv = shlex.split(command)
+            except ValueError:
+                self.err("register payload 'command' has invalid shell quoting")
+                return None, None
+            if not argv:
+                self.err("register payload 'command' must be a non-empty string")
+                return None, None
+            return None, argv
+
+        return None, None
+
+    def _parse_defines(self, value: Any) -> Optional[List[str]]:
+        """Validate macro definitions and return NAME[=VALUE] strings."""
+        if value is None:
+            return []
+        items = value.items() if isinstance(value, dict) else value
+        if not isinstance(value, (dict, list)):
+            self.err("register payload 'defines' must be an object or array")
+            return None
+        result = []
+        for item in items:
+            if isinstance(value, dict):
+                name, macro_value = item
+                if not isinstance(name, str) or not re.fullmatch(
+                    r"[A-Za-z_][A-Za-z0-9_]*", name
+                ):
+                    self.err("register payload has invalid macro name")
+                    return None
+                result.append(name if macro_value is None else f"{name}={macro_value}")
+            elif not isinstance(item, str) or not re.fullmatch(
+                r"[A-Za-z_][A-Za-z0-9_]*(=.*)?", item
+            ):
+                self.err(
+                    "register payload 'defines' entries must be NAME or NAME=VALUE"
+                )
+                return None
+            else:
+                result.append(item)
+        return result
+
+    def _parse_compile_flags(self, value: Any) -> Optional[int]:
+        """Translate supported compile-time flags to libdtrace cflags."""
+        if value is None:
+            return 0
+        if not isinstance(value, dict):
+            self.err("register payload 'compile' must be an object")
+            return None
+        flags = 0
+        if value.get("zdefs", False):
+            flags |= c_api.DTRACE_C_ZDEFS
+        unknown = set(value) - {"zdefs"}
+        if unknown:
+            self.err("unsupported compile option(s): " + ", ".join(sorted(unknown)))
+            return None
+        return flags
+
+    def _handle_unregister(self, name: str) -> int:
+        name = name.strip()
+        if not name:
+            return c_api.PM_ERR_VALUE
+        script = None
+        with self._lock:
+            script = self._scripts.pop(name, None)
+            if script is None:
+                return c_api.PM_ERR_NAME
+            self._rebuild_instances_locked()
+        if script is not None:
+            if script._state != "stopped":
+                script.stop()
+            script.unregister_data_callbacks(self)
+        return 0
+
+    def _handle_start(self, name: str) -> int:
+        self.log(f"handle start {name}")
+        name = name.strip()
+        if not name:
+            return c_api.PM_ERR_VALUE
+        script = self._scripts.get(name)
+        if script is None:
+            return c_api.PM_ERR_NAME
+        ok, error = script.start()
+        if not ok:
+            self.err(f"start failed for {name}: {error}")
+            return c_api.PM_ERR_GENERIC
+        return 0
+
+    def _handle_stop(self, name: str) -> int:
+        self.log(f"handle stop {name}")
+        name = name.strip()
+        if not name:
+            return c_api.PM_ERR_VALUE
+        script = self._scripts.get(name)
+        if script is None:
+            return c_api.PM_ERR_NAME
+        script.stop()
+        return 0
+
+    # ------------------------------------------------------------------
+    # Fetch callback serving metric values
+    # ------------------------------------------------------------------
+    def _fetch_callback(self, cluster: int, item: int, inst: int):
+        if cluster > self.Scripts.CLUSTER:
+            ids = (cluster, item)
+            if ids not in self._data_metric_ids:
+                return [cpmda.PMDA_FETCH_NOVALUES, 0]
+            metric = self._data_metric_ids[(cluster, item)]
+            if inst not in metric._data_instance_ids:
+                return [cpmda.PMDA_FETCH_NOVALUES, 0]
+            instance = metric._data_instance_ids[inst]
+            value = instance._value
+            if value is None:
+                return [cpmda.PMDA_FETCH_NOVALUES, 0]
+            return [value, 1]
+        if cluster == self.Control.CLUSTER:
+            # Control metrics are write-only, but returning NOVALUES causes
+            # clients like pmstore to abort before issuing the store PDU.
+            # Hand back an empty string so the store callback still fires.
+            return ["", 1]
+
+        if cluster != self.Scripts.CLUSTER:
+            return [c_api.PM_ERR_PMID, 0]
+
+        name = self._inst_map.get(inst)
+        if not name:
+            return [c_api.PM_ERR_INST, 0]
+        script = self._scripts.get(name)
+        if not script:
+            return [c_api.PM_ERR_INST, 0]
+
+        if item == self.Scripts.STATE:
+            return [script.state(), 1]
+        if item == self.Scripts.AUTOSTART:
+            return [1 if script.autostart else 0, 1]
+        if item == self.Scripts.LAST_ERROR:
+            return [script.last_error(), 1]
+        if item == self.Scripts.RUNTIME:
+            return [script.runtime_seconds(), 1]
+
+        return [c_api.PM_ERR_PMID, 0]
+
+    # ------------------------------------------------------------------
+    # Autostart support
+    # ------------------------------------------------------------------
+    def reload_autostart(self) -> None:
+        if not self._autostart_dir.is_dir():
+            return
+
+        autostart_names = set()
+        for script_path in sorted(self._autostart_dir.glob("*.d")):
+            try:
+                program = script_path.read_text()
+            except OSError as exc:  # pragma: no cover - filesystem error
+                self.err(f"unable to read {script_path}: {exc}")
+                continue
+
+            metadata = self._load_metadata(script_path)
+            name = metadata.get("name") or script_path.stem
+            options = metadata.get("options") if isinstance(metadata.get("options"), dict) else {}
+            separator = metadata.get("separator") if isinstance(metadata.get("separator"), str) else "."
+            pid, command = self._parse_target(metadata)
+            if pid is None and command is None and (
+                "pid" in metadata or "command" in metadata
+            ):
+                self.err(f"invalid target in autostart metadata {script_path}")
+                continue
+            defines = self._parse_defines(metadata.get("defines"))
+            if defines is None:
+                self.err(f"invalid macro definitions in {script_path}")
+                continue
+            compile_flags = self._parse_compile_flags(metadata.get("compile"))
+            if compile_flags is None:
+                self.err(f"invalid compile options in {script_path}")
+                continue
+
+            autostart_names.add(name)
+
+            with self._lock:
+                script = self._scripts.get(name)
+                if script:
+                    script.autostart = True
+                    script.separator = separator
+                    script.update_definition(
+                        program, options, pid, command, defines, compile_flags
+                    )
+                else:
+                    script = ManagedDTraceScript(
+                        name, program, True, options, separator, pid, command,
+                        defines,
+                        compile_flags,
+                        self.log,
+                    )
+                    self._scripts[name] = script
+                    self._assign_instance(name)
+                    script.register_data_callbacks(self)
+
+            ok, error = script.start()
+            if not ok:
+                self.err(f"autostart of {name} failed: {error}")
+
+        with self._lock:
+            for name, script in self._scripts.items():
+                script.autostart = name in autostart_names or script.autostart
+
+    def _load_metadata(self, script_path: Path) -> Dict[str, Any]:
+        self.log("load metadata")
+        meta_path = script_path.with_suffix(".json")
+        if not meta_path.is_file():
+            return {}
+        try:
+            return json.loads(meta_path.read_text())
+        except (OSError, json.JSONDecodeError) as exc:  # pragma: no cover
+            self.err(f"failed to parse metadata {meta_path}: {exc}")
+            return {}
+
+    # ------------------------------------------------------------------
+    # Instance domain management
+    # ------------------------------------------------------------------
+    def _assign_instance(self, name: str) -> None:
+        self.log("assign instance")
+        with self._lock:
+            inst_id = self._next_inst
+            self._next_inst += 1
+            self._inst_map[inst_id] = name
+            self._rebuild_indom()
+
+    def _rebuild_instances_locked(self) -> None:
+        # assumes caller holds self._lock
+        self._inst_map = {
+            idx: name for idx, name in enumerate(sorted(self._scripts.keys()))
+        }
+        self._next_inst = len(self._inst_map)
+        self._rebuild_indom()
+
+    def _rebuild_data_indom(self) -> None:
+        with self._lock:
+            for m in self._data_metrics.values():
+                self.replace_indom(m.indom_id, m._data_indom_insts)
+
+
+    def _rebuild_indom(self) -> None:
+        insts = [pmdaInstid(inst, name) for inst, name in sorted(self._inst_map.items())]
+        self.replace_indom(self.script_indom_id, insts)
+
+    # ------------------------------------------------------------------
+    # Teardown helpers
+    # ------------------------------------------------------------------
+    def _shutdown_scripts(self) -> None:
+        with self._lock:
+            scripts = list(self._scripts.values())
+        for script in scripts:
+            script.unregister_data_callbacks(self)
+            script.stop()
+
+    # ------------------------------------------------------------------
+    @staticmethod
+    def _in_pmda_setup() -> bool:
+        return bool(os.environ.get("PCP_PYTHON_DOMAIN") or os.environ.get("PCP_PYTHON_PMNS"))
+
+
+def main() -> None:
+    domain = -1
+    with open(os.path.dirname(os.path.abspath(__file__)) + "/Install") as f:
+        for line in f:
+            if "domain=" in line:
+                 domain = int(line.split("=")[1].strip())
+    if domain == -1 :
+        print("No domain value in Install, exiting.")
+    else:
+        DTracePMDA("dtrace", 487).run()
+
+
+if __name__ == "__main__":
+    main()
-- 
2.43.5

