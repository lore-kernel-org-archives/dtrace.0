Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2481A4D8DB7
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328684; cv=none; b=YsW5RDmE+mLWeRppSIcDfSXv/Ck37M4B/j1MRGd96+ESh7wtCk24/U+yBaK/4Tf1CgEc/E5YtPqw8+nZGdCTwRaYDii8umDiPAJuFN5efjdEesmg2yZxuHErrGsCmVke0MANKZ+2mU4XBxlrHN14R+Cb624udWv+JifZNRXPdxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328684; c=relaxed/simple;
	bh=heLQMGxVb4WrlAm8IWr2ZwiNHeyLXezqkzLsyzf32LA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XIQ12R+tke/4MRssnNqQnsMWra9eM/LhcybTlI7t9UQOAKj/KLWlmcI3qmCGIpejofXojaVQEXCKa5oWLB+P2FoXtk1MsXNiw1RbnVb42ei8LmRYPLvzm4UOuttuU1dhdygsIrCUfmqNm/Htmn0Ou33R2QBGzFfdfSUlZotU7a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CN8dUzxb; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CN8dUzxb"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LCpHBt2338290
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=l/t9w
	pEDXlB1kzrgglq7e0meCHHnztSGi8vi2+yAKqk=; b=CN8dUzxbaYqfRLHv4S6mW
	+RjO1AlDUgLzcFmo/8vTcZu7IXkPESdy4N9t8ZsGhI5tSAFP7uNDK+E7IJQGh8Qg
	r3Fqlkrio8kgAzpbdCWSfp0wMTNLTgPg+KwHuG+ii/cYmrURZKvSuiggH5/B5IkR
	NgIY8H74ztLygGdMuTbDZUnqwRFCV8Ig63FPEW/O1n1k96EQYFAK94+ydXPteeSs
	7n4FXrd+K4BKTJPhkR2qaqeq4JmOosLHucy/7RLN1cJN4LG/DWv16x+/mNA4xa31
	luZgk1Ss2igkgVEOLPoE7Bhz1UBczBdLca1DU1jmIngRfXdAAkDzom7BvqpLzoSi
	A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g4ydbnaq0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67LG5DJv029362
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4g2ejgcn38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:15 +0000 (GMT)
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67LGB2FL014592
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:14 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-51-128.vpn.oracle.com [10.154.51.128])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4g2ejgcmux-10;
	Fri, 21 Aug 2026 16:11:14 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v5 09/11] dtrace: Add a PCP PMDA to expose DTrace data as metrics
Date: Fri, 21 Aug 2026 17:10:57 +0100
Message-ID: <20260821161100.41710-10-alan.maguire@oracle.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX5B2dv1tS2xSL
 yQupzeDuzReA10M1oCze7Tq4zET+un/Q+1h7FG+Mo+T1LTh3VrkY3FsiIhffwJxoiJ36YVJtVAl
 k6PrX7mjFuOM34es+LJd8nEKfG13TSMZpe5tQByHvahh3oY2dKXJAxyJ7miTPSFcxZISarzwOLz
 YalIdy/NVgGPhZyti+djq6Pu7m0qrYFzCmrg3PmWYQHea3+Pfpyxm5oouMv3DiiIiGYWJsksGmt
 Rr25QN1hOEx8tjsWC8ganAEzHIY2GzCn6mcdYles1uQzOWUWzaTXvpEM1hPvClgP0sM9EIUFVdG
 fuL/XDvLkgYDUojScCy2ajlM8RYw2CMrOmhHmKHlM1/JA+ttS+o3wU8osWluZ+CxGx6+p62EHLb
 jLKbOlE4XO3cNPRfBlsP9r6LOfBw9IV0lq/56DVeNse3/hPqUUlyHlUgwrU3b0rlNsw3yVytSJN
 bhHwrgZOMSrfVOJ9dEw==
X-Proofpoint-ORIG-GUID: wJ4UjR4ji6AJ-0IKE5ZRarXwbuFyE3nK
X-Proofpoint-GUID: wJ4UjR4ji6AJ-0IKE5ZRarXwbuFyE3nK
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfXw88KEbgsz1HW
 jFb+8DojOZ1sbd3wIHB9E6MygwsRbb7q5ycSFLeEQROaRdqB0rtcMOaNxQPG2Ol/lgnMth2F4IB
 WqniNatL80+gLcpd2zlx8fzTln/7CWob5e3uMPBqweNhC5FJKLJ+
X-Authority-Analysis: v=2.4 cv=GpJyPE1C c=1 sm=1 tr=0 ts=6a8878a4 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x4eqshVgHu-cdnggieHk:22 a=yPCof4ZbAAAA:8 a=mDV3o1hIAAAA:8
 a=iqstUyhd8PTt2GpZ6wAA:9 a=bNHVytC1AEOPWFH4:21 a=L03L2QfmqWoA:10
 a=O8hF6Hzn-FEA:10 a=WmVTiCyuxqgg3mnwYu6p:22

This PMDA exposes a way of running DTrace scripts through PCP via the
libdtrace Python bindings. Scripts can be registered dynamically via
`pmstore(1)` calls and optionally autostarted from an on-disk directory when
the PMDA is launched using the autostart.d/ directory.

To register and run a DTrace script to count read system calls:

$ pmstore dtrace.control.register '{"name":"read_syscalls","program":"syscall::read:entry { @c[probefunc] = count(); }", "autostart":true}'

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
 GNUmakefile                           |    1 +
 configure                             |    3 +
 pcp/Build                             |   66 +
 pcp/Install                           |   37 +
 pcp/README.md                         |  343 +++++
 pcp/Remove                            |   26 +
 pcp/autostart/.gitkeep                |    0
 pcp/dtrace.conf                       |   12 +
 pcp/examples/io_times.d               |   28 +
 pcp/examples/io_times.json            |    8 +
 pcp/examples/irq_times.d              |   51 +
 pcp/examples/irq_times.json           |    8 +
 pcp/examples/packet_drop_reasons.d    |   16 +
 pcp/examples/packet_drop_reasons.json |    8 +
 pcp/examples/profile_kernel.d         |   33 +
 pcp/examples/profile_kernel.json      |   11 +
 pcp/examples/syscall_counts.d         |    8 +
 pcp/examples/syscall_counts.json      |    8 +
 pcp/pmdadtrace.1                      |  135 ++
 pcp/pmdadtrace.python                 | 1664 +++++++++++++++++++++++++
 20 files changed, 2466 insertions(+)
 create mode 100644 pcp/Build
 create mode 100755 pcp/Install
 create mode 100644 pcp/README.md
 create mode 100755 pcp/Remove
 create mode 100644 pcp/autostart/.gitkeep
 create mode 100644 pcp/dtrace.conf
 create mode 100644 pcp/examples/io_times.d
 create mode 100644 pcp/examples/io_times.json
 create mode 100644 pcp/examples/irq_times.d
 create mode 100644 pcp/examples/irq_times.json
 create mode 100644 pcp/examples/packet_drop_reasons.d
 create mode 100644 pcp/examples/packet_drop_reasons.json
 create mode 100644 pcp/examples/profile_kernel.d
 create mode 100644 pcp/examples/profile_kernel.json
 create mode 100644 pcp/examples/syscall_counts.d
 create mode 100644 pcp/examples/syscall_counts.json
 create mode 100644 pcp/pmdadtrace.1
 create mode 100755 pcp/pmdadtrace.python

diff --git a/GNUmakefile b/GNUmakefile
index e26a1d84..eb30f2e9 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -109,6 +109,7 @@ WITH_SYSTEMD = y
 PYTHON ?= python3
 PYTHON_BINDINGS_AVAILABLE := $(shell $(PYTHON) -c 'import os, sysconfig, setuptools; assert os.path.isfile(os.path.join(sysconfig.get_path("include"), "Python.h"))' >/dev/null 2>&1 && echo y)
 WITH_PYTHON ?= $(PYTHON_BINDINGS_AVAILABLE)
+WITH_PCP ?= y
 TARGETS =
 
 DTRACE ?= $(objdir)/dtrace
diff --git a/configure b/configure
index fce22e9f..30681f59 100755
--- a/configure
+++ b/configure
@@ -113,6 +113,7 @@ EOF
         cat >&2 <<'EOF'
 --with-systemd=[yes/no]		Install the systemd unit files (default: yes)
 --with-python=[yes/no]		Build the Python bindings (default: enabled when prerequisites are present)
+--with-pcp=[yes/no]		Install the PCP PMDA (default: yes)
 EOF
         echo >&2
         make help-overrides
@@ -202,6 +203,8 @@ for option in "$@"; do
         --with-systemd=n*|--without-systemd) write_make_var WITH_SYSTEMD "";;
         --with-python|--with-python=y*) write_make_var WITH_PYTHON "y";;
         --with-python=n*|--without-python) write_make_var WITH_PYTHON "";;
+        --with-pcp|--with-pcp=y*) write_make_var WITH_PCP "y";;
+        --with-pcp=n*|--without-pcp) write_make_var WITH_PCP "";;
         HAVE_ELF_GETSHDRSTRNDX=*) write_config_var ELF_GETSHDRSTRNDX "$option";;
         --with-libctf=*) write_config_var LIBCTF "$option";;
         HAVE_LIBCTF=*) write_config_var LIBCTF "$option";;
diff --git a/pcp/Build b/pcp/Build
new file mode 100644
index 00000000..8ca52542
--- /dev/null
+++ b/pcp/Build
@@ -0,0 +1,66 @@
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+PMDA_NAME := dtrace
+PMDA_OBJDIR := $(DESTDIR)/var/lib/pcp/pmdas/$(PMDA_NAME)
+PMDA_AUTOSTART_OBJDIR := $(PMDA_OBJDIR)/autostart
+PMDA_EXAMPLE_OBJDIR := $(PMDA_OBJDIR)/examples
+
+PMDA_EXEC_SCRIPTS := Install Remove pmdadtrace.python
+PMDA_DATA_FILES := README.md dtrace.conf
+PMDA_MANPAGE := pmdadtrace.1
+PMDA_AUTOSTART_SRC := $(wildcard pcp/autostart/*)
+PMDA_AUTOSTART_FILES := $(notdir $(PMDA_AUTOSTART_SRC))
+PMDA_EXAMPLE_SRC := $(wildcard pcp/examples/*)
+PMDA_EXAMPLE_FILES := $(notdir $(PMDA_EXAMPLE_SRC))
+
+# PCP support is enabled by default for source-tree builds.
+ifeq ($(WITH_PYTHON),y)
+ifeq ($(WITH_PCP),y)
+PHONIES += install-pmda-$(PMDA_NAME) install-pmda
+
+install:: install-pmda
+
+install-pmda:: install-pmda-$(PMDA_NAME)
+
+install-pmda-$(PMDA_NAME)::
+	$(call describe-install-target,$(PMDA_OBJDIR),$(PMDA_EXEC_SCRIPTS) $(PMDA_DATA_FILES))
+	$(call describe-install-target,$(INSTMANDIR),$(PMDA_MANPAGE))
+	mkdir -p $(PMDA_OBJDIR) $(PMDA_AUTOSTART_OBJDIR) $(INSTMANDIR)/man1
+	for f in $(PMDA_EXEC_SCRIPTS); do \
+		install -m 755 pcp/$$f $(PMDA_OBJDIR); \
+	done
+	for f in $(PMDA_DATA_FILES); do \
+		install -m 644 pcp/$$f $(PMDA_OBJDIR); \
+	done
+	install -m 644 pcp/$(PMDA_MANPAGE) $(INSTMANDIR)/man1
+ifneq ($(PMDA_AUTOSTART_FILES),)
+	$(call describe-install-target,$(PMDA_AUTOSTART_OBJDIR),$(PMDA_AUTOSTART_FILES))
+	mkdir -p $(PMDA_OBJDIR) $(PMDA_AUTOSTART_OBJDIR)
+	for f in $(PMDA_AUTOSTART_FILES); do \
+		mode=644; \
+		case $$f in \
+			*.d) mode=755 ;; \
+		*) ;; \
+		esac; \
+		install -m $$mode pcp/autostart/$$f $(PMDA_AUTOSTART_OBJDIR); \
+	done
+endif
+
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
+
+endif
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
index 00000000..a0753144
--- /dev/null
+++ b/pcp/README.md
@@ -0,0 +1,343 @@
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
+  key/value pairs), `autostart`, `exitonly`, `top`, `bottom`, `pid`, `command`,
+  `args`, and `defines` fields. `pid` attaches
+  to an existing process, while `command` is the JSON equivalent of
+  `dtrace -c`: it starts a whitespace- and quote-split command under DTrace
+  control. The two target fields are mutually exclusive and initialize
+  `$target` before the program is compiled. `args` is an array of string operands
+  supplied to the D program as positional macro arguments `$1`, `$2`, and so on.
+  `defines` may be an object mapping
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
+$ pmstore dtrace.control.register '{"name":"syscalls","program":"syscall:::entry { @c[probefunc] = count(); }", "autostart":true}'
+dtrace.control.register old value="" new value="{"name":"syscalls","program":"syscall:::entry { @c[probefunc] = count(); }", "autostart":true}"
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
+## Quantized aggregations
+
+`quantize()`, `lquantize()`, and `llquantize()` aggregations are exported as
+histograms.  Each PCP instance is one inclusive bucket range and its value is
+the DTrace count for that range.  This layout is suitable for Grafana's
+pre-bucketed heatmap input.
+
+For a quantized aggregation with keys, the key is included in the metric name,
+so buckets for separate keys remain distinct.  For example:
+
+```d
+@iowait["device_mapper"] = quantize(args[0]);
+```
+
+produces `dtrace.scripts.data.<script>.iowait.device_mapper`, with instances
+such as `512-1023` and `8388608-16777215`.  A quantized aggregation with no
+keys instead uses `dtrace.scripts.data.<script>.<aggregation>` and the same
+range instances.
+
+The range scheme follows the DTrace aggregation action:
+
+- `quantize()` uses power-of-two ranges: `0-0`, `1-1`, `2-3`, `4-7`, and so
+  on. Negative buckets are represented by their inclusive negative ranges.
+- `lquantize()` uses the program's declared base and step; for example a
+  bucket beginning at `20` with a step of `10` is named `20-29`. Its underflow
+  and overflow buckets are named with `-inf` and `inf` endpoints.
+- `llquantize()` uses the factor, magnitude range, and steps declared by the
+  program to generate its log-linear ranges, such as `1000-1999` and
+  `2000-3999`.
+
+Only buckets with non-zero DTrace counts are exported.  A bucket can therefore
+disappear from the PCP instance domain when its count is zero on a later
+snapshot.
+
+Script names must map uniquely to PCP metric prefixes.  The PMDA rejects a
+registration, or skips an autostart script, when its sanitized name collides
+with an existing script name.  Sanitization retains ASCII letters, digits,
+`_`, `+`, `.`, `;`, `:`, and backticks; each run of other characters is replaced
+with `_`, leading and trailing underscores are removed, and an empty result is
+named `value`.
+
+Integer scalar aggregations use 64-bit PCP metric types, preserving exact
+values.  `count` and `stddev` use unsigned `PM_TYPE_U64`; `sum`, `min`, and
+`max` use signed `PM_TYPE_64`.  Floating aggregations such as `avg` use
+`PM_TYPE_DOUBLE`.
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
+  "exitonly": true,
+  "top": 10,
+  "separator": ";",
+  "options": {
+    "bufsize": "4m",
+    "aggrate": "1s",
+    "quiet": true
+  },
+  "compile": {
+    "zdefs": true
+  },
+  "args": ["1234", "read"],
+  "defines": {
+    "SAMPLE_RATE": 97,
+    "BUILD_LABEL": "production",
+    "FEATURE_ENABLED": null
+  }
+}
+```
+
+For example, a program containing `/pid == $1/` can be registered with
+`"args": ["1234"]`. For a string value, use `$$1` in the D program to force
+string-token interpretation. `args` is unrelated to `command`, whose operands
+are passed to the target process created by DTrace.
+
+`exitonly` defaults to `false`.  When enabled, the PMDA does not
+snapshot or walk aggregations while the script is running; it publishes the
+final aggregation view only after the DTrace session terminates or is stopped.
+This is useful with, for example, `END { trunc(@stacks, 10); }`, so that only
+the final top ten stacks are exported.  It does not limit DTrace aggregation
+memory while the script runs; use the DTrace `aggsize` option for that.
+
+`top` and `bottom` are mutually exclusive optional non-negative limits applied
+independently to each aggregation on every PMDA update. They publish the
+highest- or lowest-valued aggregation entries respectively. Entries outside the
+selected limit are removed from PCP. The limits apply to aggregation entries,
+not individual quantization buckets, and do not limit DTrace aggregation
+memory.
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
+Stopping is asynchronous: the store request acknowledges once shutdown has
+been requested.  Check `dtrace.scripts.state` until it reports `stopped` if
+you need to wait for DTrace cleanup to finish.
+
+# Profiling
+
+It is possible to profile using stack keys, and the instance names
+that represent the call stacks can be made to be compatible with
+the PCP Flame Graph panel's expected comma-delimited stack format of
+`function1,function2`. To do this,
+the default "." key separator that is used to concatenate key values
+must be overridden with a `,`, i.e.
+
+```
+"separator":";"
+```
+
+Stack frames are normalized to `module:function` form and their DTrace
+`+0x...` offsets are removed before the instance name is generated.
+
+For example:
+
+```
+$ pmstore dtrace.control.register '{"name":"profile","program":"profile:::profile-97 { @profile[stack()] = count(); }", "autostart":true, "separator":","}'
+dtrace.control.register old value="" new value="{"name":"profile","program":"profile:::profile-97 { @profile[stack()] = count(); }", "autostart":true}"
+
+$ pminfo -f dtrace
+
+dtrace.scripts.data.profile.profile
+    inst [0 or "vmlinux:entry_SYSCALL_64_after_hwframe,vmlinux:do_syscall_64,vmlinux:x64_sys_call,vmlinux:__x64_sys_read,vmlinux:ksys_read,vmlinux:vfs_read,vmlinux:seq_read,vmlinux:seq_read_iter,vmlinux:show_smap,vmlinux:__show_smap,vmlinux:seq_put_decimal_ull_width,vmlinux:strlen"] value 1
+    inst [1 or "vmlinux:entry_SYSCALL_64_after_hwframe,vmlinux:__audit_syscall_exit"] value 1
+...
+```
+
+# Autostart
+
+Scripts placed under `$PCP_PMDAS_DIR/dtrace/autostart/` with a `.d`
+extension are started automatically when the PMDA becomes ready. Optional
+metadata can be provided by placing a matching `.json` file alongside the `.d`
+file; its contents should mirror the register payload structure (for example,
+to define libdtrace options).
+
+Examples are provided:
+
+- `examples/irq_times.*` - measure min, max, and average IRQ/softirq
+  handler execution time
+- `examples/syscall_counts.*` - count syscalls by name
+- `examples/packet_drop_reasons.*` - count packets dropped by drop reason
+  string
+
+To run, copy .d and .json files under autostart prior to install.
+Metrics then appear under dtrace.scripts.data.syscall_counts.counts`,
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
+   `autostart/` to disable them.
diff --git a/pcp/Remove b/pcp/Remove
new file mode 100755
index 00000000..ecbf902a
--- /dev/null
+++ b/pcp/Remove
@@ -0,0 +1,26 @@
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
diff --git a/pcp/autostart/.gitkeep b/pcp/autostart/.gitkeep
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
diff --git a/pcp/examples/io_times.d b/pcp/examples/io_times.d
new file mode 100644
index 00000000..9a6e7dd7
--- /dev/null
+++ b/pcp/examples/io_times.d
@@ -0,0 +1,28 @@
+#!/usr/sbin/dtrace -Cqs
+
+/* Provide histogram of io times, wait completion times by device. */
+
+io:::start
+{
+	iostart[curthread] = timestamp;
+}
+
+io:::wait-start
+{
+	iowstart[curthread] = timestamp;
+}
+
+io:::done
+/ iostart[curthread] /
+{
+	@iotime[args[1]->dev_name] = quantize((timestamp - iostart[curthread])/1000);
+	iostart[curthread] = 0;
+}
+
+
+io:::wait-done
+/ iowstart[curthread] /
+{
+	@iowait[args[1]->dev_name] = quantize((timestamp - iowstart[curthread])/1000);
+	iowstart[curthread] = 0;
+}
diff --git a/pcp/examples/io_times.json b/pcp/examples/io_times.json
new file mode 100644
index 00000000..da65b5cc
--- /dev/null
+++ b/pcp/examples/io_times.json
@@ -0,0 +1,8 @@
+{
+  "name": "io_times",
+  "autostart": true,
+  "options": {
+    "bufsize": "16m",
+    "aggsize": "8m"
+  }
+}
diff --git a/pcp/examples/irq_times.d b/pcp/examples/irq_times.d
new file mode 100644
index 00000000..63d74a56
--- /dev/null
+++ b/pcp/examples/irq_times.d
@@ -0,0 +1,51 @@
+#!/usr/sbin/dtrace -s
+
+/* Count avg/max/min irq/softirq times */
+
+BEGIN
+{
+	softirq_names[0] = "hi";
+	softirq_names[1] = "timer";
+	softirq_names[2] = "net_tx";
+	softirq_names[3] = "net_rx";
+	softirq_names[4] = "block";
+	softirq_names[5] = "irq_poll";
+	softirq_names[6] = "tasklet";
+	softirq_names[7] = "sched";
+	softirq_names[8] = "hrtimer";
+	softirq_names[9] = "rcu";
+	softirq_max = 9;
+}
+
+sdt:::irq_handler_entry,
+sdt:::softirq_entry
+{
+	self->start = timestamp;
+}
+
+rawtp:irq::irq_handler_entry
+{
+	self->start = timestamp;
+	self->name = ((struct irqaction *)arg1)->name;
+}
+
+sdt:::irq_handler_exit
+/self->start/
+{
+	this->t = timestamp;
+	@irq_avg_time_ns[stringof(self->name)] = avg(this->t - self->start);
+	@irq_max_time_ns[stringof(self->name)] = max(this->t - self->start);
+	@irq_min_time_ns[stringof(self->name)] = min(this->t - self->start);
+	self->start = 0;
+	self->name = 0;
+}
+
+sdt:::softirq_exit
+/self->start && arg0 <= softirq_max /
+{
+        this->t = timestamp;
+        @softirq_avg_time_ns[softirq_names[arg0]] = avg(this->t - self->start);
+        @softirq_max_time_ns[softirq_names[arg0]] = max(this->t - self->start);
+        @softirq_min_time_ns[softirq_names[arg0]] = min(this->t - self->start);
+        self->start = 0;
+}
diff --git a/pcp/examples/irq_times.json b/pcp/examples/irq_times.json
new file mode 100644
index 00000000..3f8d4de8
--- /dev/null
+++ b/pcp/examples/irq_times.json
@@ -0,0 +1,8 @@
+{
+  "name": "irq_times",
+  "autostart": true,
+  "options": {
+    "bufsize": "16m",
+    "aggsize": "8m"
+  }
+}
diff --git a/pcp/examples/packet_drop_reasons.d b/pcp/examples/packet_drop_reasons.d
new file mode 100644
index 00000000..8ae0a3b4
--- /dev/null
+++ b/pcp/examples/packet_drop_reasons.d
@@ -0,0 +1,16 @@
+#!/usr/sbin/dtrace -s
+
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
diff --git a/pcp/examples/profile_kernel.d b/pcp/examples/profile_kernel.d
new file mode 100644
index 00000000..b106a14d
--- /dev/null
+++ b/pcp/examples/profile_kernel.d
@@ -0,0 +1,33 @@
+#!/usr/sbin/dtrace -Cqs
+
+/* Profile kernel stacks for RUNTIME_MAX sec (default 1 min) */
+
+#ifndef RUNTIME_MAX
+#define RUNTIME_MAX		60
+#endif
+
+#ifndef STACKS_MAX
+#define STACKS_MAX		512
+#endif
+
+BEGIN
+{
+	runtime = 0;
+}
+
+profile:::profile-97
+{
+	@kstacks[stack()] = count();
+}
+
+profile:::tick-10s
+{
+	runtime += 10;
+}
+
+profile:::tick-10s
+/ runtime > RUNTIME_MAX /
+{
+	trunc(@kstacks, STACKS_MAX);
+	exit(0);
+}
diff --git a/pcp/examples/profile_kernel.json b/pcp/examples/profile_kernel.json
new file mode 100644
index 00000000..c82d90fc
--- /dev/null
+++ b/pcp/examples/profile_kernel.json
@@ -0,0 +1,11 @@
+{
+  "name": "profile_kernel",
+  "defines": { "RUNTIME_MAX": 60, "STACKS_MAX": 512 },
+  "autostart": true,
+  "separator": ",",
+  "exitonly": true,
+  "options": {
+    "bufsize": "16m",
+    "aggsize": "8m"
+  }
+}
diff --git a/pcp/examples/syscall_counts.d b/pcp/examples/syscall_counts.d
new file mode 100644
index 00000000..fd288917
--- /dev/null
+++ b/pcp/examples/syscall_counts.d
@@ -0,0 +1,8 @@
+#!/usr/sbin/dtrace -s
+
+/* Count system call invocations per syscall name */
+
+syscall:::entry
+{
+    @counts[probefunc] = count();
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
diff --git a/pcp/pmdadtrace.1 b/pcp/pmdadtrace.1
new file mode 100644
index 00000000..be6f6246
--- /dev/null
+++ b/pcp/pmdadtrace.1
@@ -0,0 +1,135 @@
+.TH PMDADTRACE 1 "August 2026" "Performance Co-Pilot" "PMDA"
+.SH NAME
+\f3pmdadtrace\f1 \- DTrace performance metrics domain agent
+.SH SYNOPSIS
+\f3$PCP_PMDAS_DIR/dtrace/Install\f1
+.br
+\f3pmstore dtrace.control.register\f1 \f2json\f1
+.SH DESCRIPTION
+\f3pmdadtrace\f1 is a Performance Co-Pilot (PCP) PMDA that runs DTrace
+programs and exports their aggregations as PCP metrics. It is started by
+\f3pmcd\f1(1) after installation; it is not normally invoked directly.
+.PP
+Scripts may be loaded from the autostart directory when the PMDA starts, or
+registered dynamically by writing a JSON object to
+\f3dtrace.control.register\f1 with \f3pmstore\f1(1). The PMDA uses the
+libdtrace Python bindings and therefore requires DTrace and those bindings to
+be installed.
+.SH INSTALLATION
+Install the PMDA as root:
+.PP
+.EX
+# cd $PCP_PMDAS_DIR/dtrace
+# ./Install
+.EE
+.PP
+The installation registers the PMDA with \f3pmcd\f1. Check that it is
+available with:
+.PP
+.EX
+$ pminfo dtrace
+.EE
+.SH DYNAMIC SCRIPTS
+The value written to \f3dtrace.control.register\f1 must be a JSON object with
+the required string members \f3name\f1 and \f3program\f1. For example:
+.PP
+.EX
+$ pmstore dtrace.control.register '{
+  "name":"by_pid",
+   "program":"syscall:::entry /pid == $1/ { @calls = count(); }",
+   "args":["1234"], "autostart":true}'
+.EE
+.PP
+The optional members are:
+.TP
+\f3args\f1
+An array of strings supplied as positional D-script macro arguments. The
+first element is \f3$1\f1, the second is \f3$2\f1, and so on. The PMDA
+supplies the script name as \f3$0\f1. Use \f3$$1\f1 when the value must be
+interpreted as a D string token.
+.TP
+\f3autostart\f1
+A boolean. If true, start the script immediately.
+.TP
+\f3options\f1
+An object of libdtrace \f3setopt\f1 options and values, for example
+\f3{"aggsize":"4m", "quiet":true}\f1.
+.TP
+\f3compile\f1
+An object of compile-time options. \f3zdefs:true\f1 is equivalent to the
+DTrace \f3-Z\f1 option.
+.TP
+\f3defines\f1
+Either an object mapping C preprocessor macro names to values, or an array of
+\f3NAME\f1 and \f3NAME=VALUE\f1 strings. This enables C preprocessing.
+.TP
+\f3pid\f1
+A positive process ID. The PMDA attaches to that process before compiling the
+program, so the program can use \f3$target\f1.
+.TP
+\f3command\f1
+A shell-quoted command string. The PMDA creates this command under DTrace
+control, analogous to \f3dtrace -c\f1, and makes its process ID available as
+\f3$target\f1. \f3command\f1 and \f3pid\f1 are mutually exclusive.
+.TP
+\f3separator\f1
+The string used to join aggregation keys in PCP instance names. The default
+is \f3.\f1; \f3,\f1 is required for stack data consumed by the PCP Flame
+Graph panel.
+.TP
+\f3exitonly\f1
+A boolean. If true, aggregation data is published only after the DTrace
+session stops.
+.TP
+\f3top\f1, \f3bottom\f1
+Mutually exclusive non-negative limits selecting the largest or smallest
+aggregation entries to export.
+.PP
+\f3args\f1 applies to the D program at compile time. It is unrelated to
+\f3command\f1, whose arguments are for the target process.
+.PP
+Registered scripts can be stopped, restarted, or removed with:
+.PP
+.EX
+$ pmstore dtrace.control.stop by_pid
+$ pmstore dtrace.control.start by_pid
+$ pmstore dtrace.control.unregister by_pid
+.EE
+.SH AUTOSTART SCRIPTS
+Place a D program ending in \f3.d\f1 in
+\f3$PCP_PMDAS_DIR/dtrace/autostart/\f1. A matching \f3.json\f1 file can
+contain the optional members described above; \f3name\f1 defaults to the
+basename of the D program. Reload the directory with:
+.PP
+.EX
+$ pmstore dtrace.control.reload 1
+.EE
+.SH METRICS
+\f3dtrace.scripts\f1 contains an instance domain for registered scripts,
+including their state, autostart flag, last error, and running time.
+\f3dtrace.scripts.data.\f1\f2script\f1\f3.\f1\f2aggregation\f1 metrics
+contain exported DTrace aggregation values. Each aggregation key becomes a
+PCP instance. Script names are sanitized for use in PCP metric names, and
+names that sanitize to the same value cannot both be registered.
+.SH SECURITY
+Dynamic registration runs DTrace programs with the PMDA's privileges. By
+default it is permitted only for root. Configure the root-owned
+\f3$PCP_PMDAS_DIR/dtrace/dtrace.conf\f1 file to enable authenticated access
+for specific PCP users. Do not disable authentication unless every client
+with permission to store PMDA metrics is trusted.
+.SH FILES
+.TP
+\f3$PCP_PMDAS_DIR/dtrace/pmdadtrace.python\f1
+The PMDA implementation.
+.TP
+\f3$PCP_PMDAS_DIR/dtrace/dtrace.conf\f1
+Dynamic-script authorization policy.
+.TP
+\f3$PCP_PMDAS_DIR/dtrace/autostart/\f1
+Autostart D programs and their optional JSON metadata.
+.TP
+\f3$PCP_LOG_DIR/pmcd/dtrace.log\f1
+PMDA diagnostic log.
+.SH SEE ALSO
+\f3dtrace\f1(8), \f3pmcd\f1(1), \f3pminfo\f1(1), \f3pmstore\f1(1), and
+\f3PCPIntro\f1(1).
diff --git a/pcp/pmdadtrace.python b/pcp/pmdadtrace.python
new file mode 100755
index 00000000..7f33d118
--- /dev/null
+++ b/pcp/pmdadtrace.python
@@ -0,0 +1,1664 @@
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
+import sys
+import threading
+import time
+from collections import defaultdict
+from numbers import Number
+from pathlib import Path
+from typing import Any, Callable, Dict, Iterable, List, NamedTuple, Optional, Set, Tuple, Union
+
+try:
+    from dtrace import (  # type: ignore
+        DTRACE_C_ZDEFS,
+        DTraceError,
+        DTraceSession,
+        DTraceProgram,
+        DTRACE_STATUS_EXITED,
+        DTRACE_STATUS_FILLED,
+        DTRACE_STATUS_STOPPED,
+    )
+except ImportError:  # pragma: no cover - fallback for in-tree testing
+    _HERE = Path(__file__).resolve()
+    for candidate in (_HERE.parents[2] / "bindings" / "python" / "src",):
+        if candidate.is_dir() and str(candidate) not in os.sys.path:
+            os.sys.path.insert(0, str(candidate))
+    from dtrace import (  # type: ignore  # noqa: E402
+        DTRACE_C_ZDEFS,
+        DTraceError,
+        DTraceSession,
+        DTraceProgram,
+        DTRACE_STATUS_EXITED,
+        DTRACE_STATUS_FILLED,
+        DTRACE_STATUS_STOPPED,
+    )
+
+import cpmapi as c_api
+import cpmda
+
+_DTRACE_GLOBAL_LOCK = threading.RLock()
+from pcp.pmapi import pmContext as PCP
+from pcp.pmapi import pmUnits
+from pcp.pmda import PMDA, pmdaGetContext, pmdaIndom, pmdaInstid, pmdaMetric
+
+_SANITIZE_COMPONENT = re.compile(r"[^A-Za-z0-9_\+\.,;:`]+")
+_STACK_FRAME_OFFSET = re.compile(r"\+0x[0-9A-Fa-f]+$")
+_IGNORED_AGGREGATION_PREFIX = "__"
+_QUANTIZED_ACTIONS = {"quantize", "lquantize", "llquantize"}
+_UNSIGNED_INTEGER_ACTIONS = {"count", "stddev"}
+_SIGNED_INTEGER_ACTIONS = {"sum", "min", "max"}
+_INTEGER_ACTIONS = _UNSIGNED_INTEGER_ACTIONS | _SIGNED_INTEGER_ACTIONS
+# PCP pmIDs reserve 12 bits for their cluster component.
+_PCP_PMID_CLUSTER_BITS = 12
+_PCP_PMID_MAX_CLUSTER = (1 << _PCP_PMID_CLUSTER_BITS) - 1
+
+def _sanitize_component(value: Any) -> str:
+    if isinstance(value, bytes):
+        value = value.decode("utf-8", errors="ignore")
+    text = str(value) if value is not None else ""
+    safe = _SANITIZE_COMPONENT.sub("_", text).strip("_")
+    return safe or "value"
+
+
+def _flamegraph_frame(value: Any) -> str:
+    """Format a DTrace stack frame for folded-stack consumers."""
+    frame = _STACK_FRAME_OFFSET.sub("", str(value))
+    return frame.replace("`", ":")
+
+class AggregationEntry(NamedTuple):
+    metric: str
+    instance: str
+    script: str
+    source: str
+    value: Optional[Union[int, float]]
+    samples: Optional[int]
+    normal: Optional[int]
+    action: str
+    keys: Tuple[str, ...]
+
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
+        args: Optional[List[str]],
+        compile_flags: int,
+        logger,
+        exitonly: bool = False,
+        top: Optional[int] = None,
+        bottom: Optional[int] = None,
+    ) -> None:
+        if top is not None and bottom is not None:
+            raise ValueError("top and bottom are mutually exclusive")
+        self.name = name
+        self.program = program
+        self.autostart = autostart
+        self.autostart_source: Optional[str] = None
+        self.options = dict(options or {})
+        self.options.setdefault("quiet", True)
+        self.separator = separator or "."
+        self.pid = pid
+        self.command = list(command) if command else None
+        self.defines = list(defines or [])
+        self.args = list(args or [])
+        self.compile_flags = compile_flags
+        self._log = logger
+        self.exitonly = exitonly
+        self.top = top
+        self.bottom = bottom
+        self._lock = threading.RLock()
+        self._thread: Optional[threading.Thread] = None
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
+    def stop(self, wait: bool = False) -> None:
+        """Request that the script stop, optionally waiting for its worker.
+
+        Control stores run on the PMDA IPC thread.  They must not wait for
+        DTrace teardown, which can take longer than pmcd's pipe timeout.
+        """
+        self._log(f"script {self.name} stopping")
+        with self._lock:
+            thread = self._thread
+            if not thread:
+                self._state = "stopped"
+                return
+            if self._state != "error":
+                self._state = "stopping"
+        self._stop.set()
+        if wait and thread is not threading.current_thread():
+            thread.join(timeout=self._START_TIMEOUT)
+        with self._lock:
+            if not thread.is_alive() and self._thread is thread:
+                self._thread = None
+
+    def update_definition(
+        self,
+        program: str,
+        options: Optional[Dict[str, Any]],
+        pid: Optional[int],
+        command: Optional[List[str]],
+        defines: Optional[List[str]],
+        args: Optional[List[str]],
+        compile_flags: int,
+        exitonly: bool,
+        top: Optional[int],
+        bottom: Optional[int],
+    ) -> None:
+        if top is not None and bottom is not None:
+            raise ValueError("top and bottom are mutually exclusive")
+        with self._lock:
+            restart = self._thread is not None and self._thread.is_alive()
+        if restart:
+            self.stop(wait=True)
+        with self._lock:
+            self.program = program
+            if options is not None:
+                self.options = options
+            self.pid = pid
+            self.command = list(command) if command else None
+            self.defines = list(defines or [])
+            self.args = list(args or [])
+            self.compile_flags = compile_flags
+            self.exitonly = exitonly
+            self.top = top
+            self.bottom = bottom
+        if restart:
+            with self._lock:
+                if self._thread is not None and self._thread.is_alive():
+                    self._log(f"unable to restart script {self.name}: "
+                              "previous worker did not stop")
+                    return
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
+                if self.pid is not None:
+                    target = session.proc_grab_pid(self.pid)
+                elif self.command is not None:
+                    target = session.proc_create(self.command)
+                compiled = session.compile(
+                    self.program,
+                    cflags=self.compile_flags,
+                    argv=[self.name, *self.args],
+                    defines=self.defines,
+                )
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
+                    # The bindings release the GIL for this non-capturing
+                    # work call and, when enabled, the aggregation snapshot.
+                    status, _ = session.work()
+                    if not self.exitonly:
+                        session.agg_snap()
+                        self._walk_aggregations(session)
+                    if status in (
+                        DTRACE_STATUS_EXITED,
+                        DTRACE_STATUS_FILLED,
+                        DTRACE_STATUS_STOPPED,
+                    ):
+                        break
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
+                self._walk_aggregations(session)
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
+                if self._state in ("starting", "running", "stopping"):
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
+            snapshot = self._aggregation_snapshot(session)
+        except Exception as exc:  # pylint: disable=broad-except
+            self._log(f"aggregation walk failed for {self.name}: {exc}")
+            return {}
+
+        updates: Dict[Tuple, AggregationEntry] = {}
+        for record in snapshot:
+            action = str(record.get("action", ""))
+            metric_name = self._metric_name_from_record(
+                record, include_keys=(action in _QUANTIZED_ACTIONS)
+            )
+            if not metric_name:
+                continue
+            instance_name = self._data_instance_from_record(record)
+            if not instance_name:
+                continue
+            value = record.get("value")
+
+            if action in _QUANTIZED_ACTIONS and isinstance(value, dict):
+                for bucket, count in value.items():
+                    quantized_instance = self._quantized_bucket_range(
+                        action, bucket, record.get("quantization")
+                    )
+                    entry = AggregationEntry(
+                        metric=metric_name,
+                        instance=quantized_instance,
+                        script=self.name,
+                        source=record.get("name", ""),
+                        value=self._coerce_int(count),
+                        samples=self._coerce_int(record.get("samples")),
+                        normal=self._coerce_int(record.get("normal")),
+                        action=action,
+                        keys=self._key_names_from_record(record),
+                    )
+                    updates[(metric_name, entry.instance)] = entry
+                continue
+
+            entry = AggregationEntry(
+                metric=metric_name,
+                instance=instance_name,
+                script=self.name,
+                source=record.get("name", ""),
+                value=(
+                    self._coerce_int(value)
+                    if action in _INTEGER_ACTIONS
+                    else self._coerce_float(value)
+                ),
+                samples=self._coerce_int(record.get("samples")),
+                normal=self._coerce_int(record.get("normal")),
+                action=action,
+                keys=self._key_names_from_record(record),
+            )
+            updates[(metric_name, instance_name)] = entry
+        with self._lock:
+            previous = self._aggregation_cache
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
+                        created_metric = self._data_callbacks["create_metric"](
+                            entry
+                        )
+                        if created_metric is False:
+                            updates.pop(key)
+                            continue
+                    if "create_instance" in self._data_callbacks:
+                        self._data_callbacks["create_instance"](entry)
+                        refresh = True
+            except Exception as exc:  # pylint: disable=broad-except
+                updates.pop(key)
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
+        with self._lock:
+            self._aggregation_cache = updates
+        return updates
+
+    def _aggregation_snapshot(self, session: DTraceSession) -> List[Dict[str, Any]]:
+        """Return the aggregation records selected for one PMDA update."""
+        if self.top is None and self.bottom is None:
+            return session.agg_walk()
+
+        records = []
+        for limit, mode in ((self.top, "valvarrev"),
+                            (self.bottom, "valvar")):
+            if limit is None or limit == 0:
+                continue
+            selected = defaultdict(int)
+            for record in session.agg_walk(mode=mode):
+                aggid = record.get("id")
+                if selected[aggid] >= limit:
+                    continue
+                selected[aggid] += 1
+                records.append(record)
+        return records
+
+    def _metric_name_from_record(
+        self, record: Dict[str, Any], include_keys: bool = False
+    ) -> Optional[str]:
+        source = record.get("name")
+        if not source or str(source).startswith(_IGNORED_AGGREGATION_PREFIX):
+            return None
+        metric = self.metric_prefix() + _sanitize_component(source)
+        if include_keys and record.get("keys"):
+            metric += "." + self._data_instance_from_record(record)
+        return metric
+
+    def _data_instance_from_record(self, record: Dict[str, Any]) -> Optional[str]:
+        parts = []
+        for key in record.get("keys", []):
+            # Each binding key is represented as a list.  A scalar key is a
+            # one-element list; a stack key is a nested list of frames.
+            if isinstance(key, list):
+                if key and isinstance(key[0], list):
+                    k = self.separator.join(
+                        _flamegraph_frame(frame) for frame in reversed(key[0])
+                    )
+                elif key:
+                    k = key[0]
+                else:
+                    k = "value"
+            else:
+                k = key
+            parts.append(_sanitize_component(k))
+        return self.separator.join(parts) if parts else "value"
+
+    def _quantized_instance_name(self, instance: str, bucket: Any) -> str:
+        """Append a quantization bucket using the script's key separator."""
+        return self.separator.join((
+            instance,
+            "bucket",
+            _sanitize_component(bucket),
+        ))
+
+    @staticmethod
+    def _quantize_bucket_range(bucket: Any) -> str:
+        """Return the inclusive value range for a quantize() bucket."""
+        try:
+            value = int(bucket)
+        except (TypeError, ValueError):
+            return _sanitize_component(bucket)
+        if value > 0:
+            return f"{value}-{2 * value - 1}"
+        if value < 0:
+            return f"{2 * value + 1}-{value}"
+        return "0-0"
+
+    @classmethod
+    def _quantized_bucket_range(
+        cls, action: str, bucket: Any, metadata: Any
+    ) -> str:
+        if action == "quantize":
+            return cls._quantize_bucket_range(bucket)
+        if not isinstance(metadata, dict):
+            return _sanitize_component(bucket)
+        try:
+            value = int(bucket)
+            if action == "lquantize":
+                base, step, levels = (int(metadata[key]) for key in
+                                      ("base", "step", "levels"))
+                if value == base - 1:
+                    return f"-inf-{value}"
+                if value == base + levels * step:
+                    return f"{value}-inf"
+                return f"{value}-{value + step - 1}"
+            if action == "llquantize":
+                factor = int(metadata["factor"])
+                low = factor ** int(metadata["lmag"])
+                high = factor ** (int(metadata["hmag"]) + 1)
+                if value == 0:
+                    return f"{-low + 1}-{low - 1}"
+                if value > 0:
+                    if value >= high:
+                        return f"{value}-inf"
+                    return f"{value}-{cls._llquantize_next(value, metadata, high) - 1}"
+                upper = -value
+                lower = cls._llquantize_next(upper, metadata, high)
+                return f"{-lower + 1}-{value}"
+        except (KeyError, TypeError, ValueError):
+            pass
+        return _sanitize_component(bucket)
+
+    @staticmethod
+    def _llquantize_next(value: int, metadata: Dict[str, Any], high: int) -> int:
+        """Return the next positive llquantize boundary, or its overflow."""
+        factor = int(metadata["factor"])
+        steps = int(metadata["steps"])
+        for magnitude in range(int(metadata["lmag"]), int(metadata["hmag"]) + 1):
+            scale = factor ** (magnitude + 1) // steps
+            for step in range(steps // factor + 1, steps + 1):
+                boundary = step * scale
+                if boundary > value:
+                    return boundary
+        return high
+
+    def _key_names_from_record(self, record: Dict[str, Any]) -> Tuple[str, ...]:
+        """Return stable printable components for the binding key list."""
+        names = []
+        for key in record.get("keys", []):
+            if isinstance(key, list) and key and isinstance(key[0], list):
+                names.append(self.separator.join(
+                    _flamegraph_frame(frame) for frame in reversed(key[0])
+                ))
+            elif isinstance(key, list):
+                names.append(str(key[0]) if key else "value")
+            else:
+                names.append(str(key))
+        return tuple(names)
+
+    @staticmethod
+    def _coerce_float(value: Any) -> Optional[float]:
+        if value is None:
+            return None
+        try:
+            return float(value)
+        except (TypeError, ValueError):
+            return None
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
+    def _script_name_collision_locked(self, name: str) -> Optional[str]:
+        """Return a distinct script name with the same PCP metric prefix."""
+        sanitized = _sanitize_component(name)
+        for existing_name in self._scripts:
+            if (
+                existing_name != name
+                and _sanitize_component(existing_name) == sanitized
+            ):
+                return existing_name
+        return None
+
+    def _create_metric(self, entry: AggregationEntry) -> bool:
+        if entry.metric in self._data_metrics:
+            return True
+        metric_id = self._metric_next
+        with self._lock:
+            if self._free_data_slots:
+                indom, indom_id = self._free_data_slots.pop()
+                self._exhausted_metrics.discard(entry.metric)
+            elif entry.metric in self._exhausted_metrics:
+                return False
+            else:
+                if self._indom_next > _PCP_PMID_MAX_CLUSTER:
+                    if entry.metric not in self._exhausted_metrics:
+                        self.err(
+                            "dynamic metric limit reached; cannot add "
+                            f"{entry.metric}"
+                        )
+                        self._exhausted_metrics.add(entry.metric)
+                    return False
+                indom = self._indom_next
+                indom_id = self.indom(indom)
+                self._indom_next += 1
+                self.add_indom(
+                    pmdaIndom(indom_id, []),
+                    "DTrace metric data",
+                    "DTrace data for metric",
+                )
+
+        metric_type = self._metric_type_for_action(entry.action)
+        metric = pmdaMetric(
+                            self.pmid(indom, metric_id),
+                            metric_type,
+                            indom_id,
+                            c_api.PM_SEM_DISCRETE,
+                            self._units_none,
+        )
+        try:
+            self.add_metric(entry.metric, metric)
+        except Exception as exc:
+            self.log(f"failed to add metric {entry.metric}: {exc}")
+            with self._lock:
+                self._free_data_slots.append((indom, indom_id))
+            return False
+        self._data_metrics[entry.metric] = DataMetric(
+                                                      metric=metric,
+                                                      pmid=metric.m_desc.pmid,
+                                                      name=entry.metric,
+                                                      script=entry.script,
+                                                      cluster=indom,
+                                                      variant=entry.source,
+                                                      indom=indom,
+                                                      indom_id=indom_id,
+                                                      metric_id=metric_id,
+                                                      instance_next=0
+        )
+        self._data_metric_ids[(indom, metric_id)] = self._data_metrics[entry.metric]
+        return True
+
+    @staticmethod
+    def _metric_type_for_action(action: str) -> int:
+        if action in _QUANTIZED_ACTIONS or action in _UNSIGNED_INTEGER_ACTIONS:
+            return c_api.PM_TYPE_U64
+        if action in _SIGNED_INTEGER_ACTIONS:
+            return c_api.PM_TYPE_64
+        return c_api.PM_TYPE_DOUBLE
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
+        instance = metric._data_instances.pop(i, None)
+        if instance is None:
+            return
+        if instance._instid in metric._data_indom_insts:
+            metric._data_indom_insts.remove(instance._instid)
+        metric._data_instance_ids.pop(instance._instance_id, None)
+
+    def _remove_instance(self, entry: AggregationEntry):
+        self._remove_instance_by_name(entry.metric, entry.instance)
+
+    def _remove_metrics(self, script:ManagedDTraceScript):
+        prefix = script.metric_prefix()
+        free_slots = []
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
+            free_slots.append((indom, metric.indom_id))
+        if free_slots:
+            self.set_notify_change()
+            with self._lock:
+                self._free_data_slots.extend(free_slots)
+                self._exhausted_metrics.clear()
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
+        self._indom_next = max(self.Control.CLUSTER, self.Scripts.CLUSTER) + 1
+        self._free_data_slots: List[Tuple[int, int]] = []
+        self._exhausted_metrics: Set[str] = set()
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
+            Path(PCP.pmGetConfig("PCP_PMDAS_DIR")) / self.read_name() / "autostart"
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
+            self.pmda_ready()
+            self.log("Ready to process DTrace control requests.")
+            threading.Thread(
+                target=self.reload_autostart,
+                name="dtrace:autostart",
+                daemon=True,
+            ).start()
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
+        if (
+            not isinstance(name, str)
+            or not name
+            or not isinstance(program, str)
+            or not program
+        ):
+            self.err("register payload requires string 'name' and 'program'")
+            return c_api.PM_ERR_VALUE
+
+        self.log(f"program is {program}")
+        options = data.get("options") if isinstance(data.get("options"), dict) else {}
+        separator = data.get("separator") if isinstance(data.get("separator"), str) else "."
+        autostart = data.get("autostart", False)
+        if not isinstance(autostart, bool):
+            self.err("register payload 'autostart' must be a boolean")
+            return c_api.PM_ERR_VALUE
+        exitonly = data.get("exitonly", False)
+        if not isinstance(exitonly, bool):
+            self.err("register payload 'exitonly' must be a boolean")
+            return c_api.PM_ERR_VALUE
+        valid, top = self._parse_aggregation_limit(data, "top", "register payload")
+        if not valid:
+            return c_api.PM_ERR_VALUE
+        valid, bottom = self._parse_aggregation_limit(
+            data, "bottom", "register payload"
+        )
+        if not valid:
+            return c_api.PM_ERR_VALUE
+        if top is not None and bottom is not None:
+            self.err("register payload 'top' and 'bottom' are mutually exclusive")
+            return c_api.PM_ERR_VALUE
+        pid, command = self._parse_target(data)
+        if pid is None and command is None and (
+            "pid" in data or "command" in data
+        ):
+            return c_api.PM_ERR_VALUE
+        defines = self._parse_defines(data.get("defines"))
+        if defines is None:
+            return c_api.PM_ERR_VALUE
+        args = self._parse_args(data.get("args"))
+        if args is None:
+            return c_api.PM_ERR_VALUE
+        compile_flags = self._parse_compile_flags(data.get("compile"))
+        if compile_flags is None:
+            return c_api.PM_ERR_VALUE
+        self.log(f"autostart is {autostart}")
+
+        with self._lock:
+            conflict = self._script_name_collision_locked(name)
+            if conflict is not None:
+                self.err(
+                    f"script name {name!r} conflicts with {conflict!r} "
+                    "after PCP name sanitization"
+                )
+                return c_api.PM_ERR_VALUE
+            script = self._scripts.get(name)
+            if script:
+                existing = True
+                script.autostart = autostart
+                script.separator = separator
+            else:
+                existing = False
+                script = ManagedDTraceScript(
+                    name, program, autostart, options, separator, pid, command,
+                    defines, args,
+                    compile_flags,
+                    self.log,
+                    exitonly,
+                    top,
+                    bottom,
+                )
+                self._scripts[name] = script
+                self._assign_instance(name)
+        if existing:
+            script.update_definition(
+                program, options, pid, command, defines, args, compile_flags,
+                exitonly,
+                top,
+                bottom,
+            )
+        script.register_data_callbacks(self)
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
+    def _parse_aggregation_limit(
+        self, data: Dict[str, Any], field: str, context: str
+    ) -> Tuple[bool, Optional[int]]:
+        if field not in data:
+            return True, None
+        value = data[field]
+        if isinstance(value, bool) or not isinstance(value, int) or value < 0:
+            self.err(f"{context} '{field}' must be a non-negative integer")
+            return False, None
+        return True, value
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
+    def _parse_args(self, value: Any) -> Optional[List[str]]:
+        """Validate positional D-script arguments supplied as JSON strings."""
+        if value is None:
+            return []
+        if not isinstance(value, list) or not all(
+            isinstance(item, str) for item in value
+        ):
+            self.err("register payload 'args' must be an array of strings")
+            return None
+        return list(value)
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
+            flags |= DTRACE_C_ZDEFS
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
+        autostart_paths = set()
+        loaded_autostart_paths = {}
+        for script_path in sorted(self._autostart_dir.glob("*.d")):
+            source = str(script_path)
+            autostart_paths.add(source)
+            try:
+                program = script_path.read_text(encoding="utf-8")
+            except OSError as exc:  # pragma: no cover - filesystem error
+                self.err(f"unable to read {script_path}: {exc}")
+                continue
+
+            metadata = self._load_metadata(script_path)
+            if metadata is None:
+                continue
+            name = metadata.get("name", script_path.stem)
+            if not isinstance(name, str) or not name:
+                self.err(f"invalid name in autostart metadata {script_path}")
+                continue
+            options = metadata.get("options") if isinstance(metadata.get("options"), dict) else {}
+            separator = metadata.get("separator") if isinstance(metadata.get("separator"), str) else "."
+            exitonly = metadata.get("exitonly", False)
+            if not isinstance(exitonly, bool):
+                self.err(f"invalid exitonly in autostart metadata {script_path}")
+                continue
+            valid, top = self._parse_aggregation_limit(
+                metadata, "top", f"autostart metadata {script_path}"
+            )
+            if not valid:
+                continue
+            valid, bottom = self._parse_aggregation_limit(
+                metadata, "bottom", f"autostart metadata {script_path}"
+            )
+            if not valid:
+                continue
+            if top is not None and bottom is not None:
+                self.err(
+                    f"autostart metadata {script_path} specifies both "
+                    "'top' and 'bottom'"
+                )
+                continue
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
+            args = self._parse_args(metadata.get("args"))
+            if args is None:
+                self.err(f"invalid script arguments in {script_path}")
+                continue
+            compile_flags = self._parse_compile_flags(metadata.get("compile"))
+            if compile_flags is None:
+                self.err(f"invalid compile options in {script_path}")
+                continue
+
+            loaded_autostart_paths[source] = name
+
+            with self._lock:
+                conflict = self._script_name_collision_locked(name)
+                if conflict is not None:
+                    self.err(
+                        f"autostart name {name!r} conflicts with {conflict!r} "
+                        "after PCP name sanitization"
+                    )
+                    continue
+                script = self._scripts.get(name)
+                if script:
+                    existing = True
+                    script.autostart = True
+                    script.autostart_source = source
+                    script.separator = separator
+                else:
+                    existing = False
+                    script = ManagedDTraceScript(
+                        name, program, True, options, separator, pid, command,
+                        defines, args,
+                        compile_flags,
+                        self.log,
+                        exitonly,
+                        top,
+                        bottom,
+                    )
+                    script.autostart_source = source
+                    self._scripts[name] = script
+                    self._assign_instance(name)
+            if existing:
+                script.update_definition(
+                    program, options, pid, command, defines, args, compile_flags,
+                    exitonly,
+                    top,
+                    bottom,
+                )
+            script.register_data_callbacks(self)
+
+            ok, error = script.start()
+            if not ok:
+                self.err(f"autostart of {name} failed: {error}")
+
+        stale_scripts = []
+        with self._lock:
+            for name, script in list(self._scripts.items()):
+                source = script.autostart_source
+                replacement = loaded_autostart_paths.get(source)
+                if source is None or (
+                    source in autostart_paths and replacement in (None, name)
+                ):
+                    continue
+                self._scripts.pop(name)
+                stale_scripts.append(script)
+            if stale_scripts:
+                self._rebuild_instances_locked()
+
+        for script in stale_scripts:
+            self.log(f"removing deleted autostart script {script.name}")
+            script.stop()
+            script.unregister_data_callbacks(self)
+
+    def _load_metadata(self, script_path: Path) -> Optional[Dict[str, Any]]:
+        meta_path = script_path.with_suffix(".json")
+        if not meta_path.is_file():
+            return {}
+        try:
+            metadata = json.loads(meta_path.read_text(encoding="utf-8"))
+        except (OSError, json.JSONDecodeError) as exc:  # pragma: no cover
+            self.err(f"failed to parse metadata {meta_path}: {exc}")
+            return None
+        if not isinstance(metadata, dict):
+            self.err(f"metadata {meta_path} must be a JSON object")
+            return None
+        return metadata
+
+    # ------------------------------------------------------------------
+    # Instance domain management
+    # ------------------------------------------------------------------
+    def _assign_instance(self, name: str) -> None:
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
+            # Process teardown has no PMDA IPC deadline, so wait for DTrace
+            # to release its resources before the interpreter exits.
+            script.stop(wait=True)
+
+    # ------------------------------------------------------------------
+    @staticmethod
+    def _in_pmda_setup() -> bool:
+        return bool(os.environ.get("PCP_PYTHON_DOMAIN") or os.environ.get("PCP_PYTHON_PMNS"))
+
+
+def main() -> None:
+    domain = -1
+    install_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "Install")
+    with open(install_path, encoding="utf-8") as f:
+        for line in f:
+            line = line.strip()
+            if not line or line.startswith("#") or not line.startswith("domain="):
+                continue
+            try:
+                domain = int(line.split("=", 1)[1].strip())
+            except ValueError:
+                print(f"Invalid domain value in {install_path}")
+                return
+            break
+    if domain == -1:
+        print("No domain value in Install, exiting.")
+    else:
+        DTracePMDA("dtrace", domain).run()
+
+
+if __name__ == "__main__":
+    main()
-- 
2.43.5

