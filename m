Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8267247DF8F
	for <dtrace@lists.linux.dev>; Fri, 15 May 2026 13:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778852663; cv=none; b=GTYR8hpQOMscFUJ87F6nGzVyMIg8YqZ7Jj7UcJJr7hz18es2CSqSLhG4rau/5uZbX53gILq8ipqRgDJUo+EKA/oBCrBmhfoEzoPuZbnlyhc2OA4rNyfJU/X5NtGbE3FyqBaxwcykKcPBBrFWNu32vCkGs5u9JE/xA8weU3+1aBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778852663; c=relaxed/simple;
	bh=X2VjcXBjRMeGxY+Sm3GK16yzw6rEICY0a27+IYwVH2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XaSK+L9Z+Ikuy2sCbMoKIkSOJULTcMhWd3QJzo/70mPKCMI1ChBsJP7nvvh/26h4y5hDLrhzlQpnYWkZPcqaewtSJbfePPCfmvxgVCTyJUev3jIIR6+pVWTIvgRuKbzjRFZJKIZVl7n5Pt/UIl3yWsDiqQPhpqtJKqY4LyLMX8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Y8VW0qDe; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Y8VW0qDe"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FCTg44122697
	for <dtrace@lists.linux.dev>; Fri, 15 May 2026 13:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=0FKoq
	SVQq3tDl+b4Wl3DRTXJRl7VpiPGhYoJf+97OT0=; b=Y8VW0qDeliHxTxys+V81S
	HEcrSdnp8ChyXZcIPVsVAK6AQeIfpd4m7RCYbiWvMk3Nzavp8Ycvr8h6YVmayVUx
	RQzlYCubfZ68zS2woA1Bz5C85vsZdEWmHoROunb7+OMReMKZjLTXw0wlmB59kf77
	xaHvRyyr+u6+ADxqSd9ybt7wBzSPgapDoRzkRI9Sz3d9NI2ewDg/xG4Ke7+/LFpj
	ucsmK6itIVJWDqT4IV7nNa+oXBQaht4c6VfAVL9mxobtUM5H6GjFw4pKKvn4AecJ
	rVfw4hzbzJ4zILEuNJ/Ny8K4xGYUldiCGrNnytUnsphfB03GiWpbvTMV/xCuFqbU
	Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4e5m20hbpy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 May 2026 13:44:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 64FDdjKL031037
	for <dtrace@lists.linux.dev>; Fri, 15 May 2026 13:44:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4e5kw11jf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 May 2026 13:44:18 +0000 (GMT)
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64FDiGX1004626
	for <dtrace@lists.linux.dev>; Fri, 15 May 2026 13:44:18 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-60-220.vpn.oracle.com [10.154.60.220])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4e5kw11jd6-2;
	Fri, 15 May 2026 13:44:17 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH 1/3] python: Add cpython bindings for libdtrace
Date: Fri, 15 May 2026 14:44:13 +0100
Message-ID: <20260515134415.355507-2-alan.maguire@oracle.com>
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
X-Authority-Analysis: v=2.4 cv=DeMnbPtW c=1 sm=1 tr=0 ts=6a072333 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8 a=MX8paWkhEIAvWLYA4Q8A:9
 a=O8hF6Hzn-FEA:10
X-Proofpoint-ORIG-GUID: bpdge5WRqzW5YnNCckib4PDkd5MLijyX
X-Proofpoint-GUID: bpdge5WRqzW5YnNCckib4PDkd5MLijyX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEzOSBTYWx0ZWRfX18HA5JavS2ON
 efofL7+oPgV5Hc1TvPA+X/qFMK5SYKKU+tUWe5vOcd6i0TvW3mstlf/yjcaRSivba0rzB2mDMHs
 969s2absvMbkpP/pm1z9pV81I9R43ut3qaPiLNVGshH9VMf+br94yuYLpW7ckyAl4UfSWHQt6rb
 qQ/H1pyQ8SXlWYUkHDoVLlpthzMbn8R7ZdXmX6+AmKd9odIHCTkTd5k9yAPy4/inuFTaHJCh+vJ
 UyD4M3USdcqM1FW7KbDui4Wwki7qVcmWlGUh9wjNIroaXANKVuYdD4n29hNi5xHAuq5GjaVrOZZ
 yV7+qS8IcTaFohV8JDSlgixQ/5ppmPl1CwW441bY5DY392IuaRUjb3INeHF8pGbEgyZuMzm5XwV
 uotx8BX8AtoVgHGtsHs3vMMNhcH7wFtr5VOkMpZ0uNW4yLlVfvelD00Cu+he96JbIJXZBVNbE/n
 eONwLcf8qbKrRCHPdaQ==

This set of bindings allows interaction with DTrace programs
from python using libdtrace interfaces under the hood.

The process is to

1. Instantiate a PyDTraceSession
2. Compile a program string via session.compile()
3. Enable probes via session.enable(program)
4. Control execution via session.go() session.stop()
5. Consume data: use session.consume() to retrieve probe data

For example to run DTrace for 5 seconds, collecting systemcalls
aggregated by executable name and system call:

from dtrace import DTraceSession
import time

DURATION=5

PROGRAM = r"""
 syscall:::entry
 {
  @counts[execname, probefunc] = count();
 }
"""

with DTraceSession() as dt:
    prog = dt.compile(PROGRAM)
    info = dt.enable(prog)
    dt.go()
    end = time.monotonic() + DURATION
    print(f"Enabled program; matched {info['matches']} probes.")
    try:
        while time.monotonic() < end:
            time.sleep(0.1)       # reduce CPU burn when idle
    except KeyboardInterrupt:
        print(f"Exiting...\n")
    finally:
        dt.stop()
        # Snapshot aggregations and display results
        dt.agg_snap()
        for record in dt.agg_walk("valrev"):
            print(f"{record['keys'][0]:<40} {record['keys'][1]:<40} {record['value']:<10}")

$ sudo python3 syscall.py
Enabled program; matched 367 probes.
python3                        pselect6                       50
ruby                           futex                          34

Python bindings are built by default, but specifying --without-python
to ./configure avoids building them. A python3-dtrace package is
added to dtrace.spec.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
Assisted-by: OpenAI Codex CLI
---
 GNUmakefile                           |    2 +
 bindings/Build                        |   35 +
 bindings/python/README.md             |   68 ++
 bindings/python/pyproject.toml        |    3 +
 bindings/python/setup.py              |   52 ++
 bindings/python/src/pydtrace_module.c | 1187 +++++++++++++++++++++++++
 configure                             |    4 +-
 dtrace.spec                           |   29 +-
 8 files changed, 1377 insertions(+), 3 deletions(-)
 create mode 100644 bindings/Build
 create mode 100644 bindings/python/README.md
 create mode 100644 bindings/python/pyproject.toml
 create mode 100644 bindings/python/setup.py
 create mode 100644 bindings/python/src/pydtrace_module.c

diff --git a/GNUmakefile b/GNUmakefile
index 10530f3c..a2f906cb 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -106,6 +106,8 @@ INSTPKGCONFIGDIR = $(DESTDIR)$(PKGCONFIGDIR)
 TESTDIR = $(LIBDIR)/dtrace/testsuite
 INSTTESTDIR = $(DESTDIR)$(TESTDIR)
 WITH_SYSTEMD = y
+WITH_PYTHON = y
+PYTHON ?= python3
 TARGETS =
 
 DTRACE ?= $(objdir)/dtrace
diff --git a/bindings/Build b/bindings/Build
new file mode 100644
index 00000000..1ca74a2a
--- /dev/null
+++ b/bindings/Build
@@ -0,0 +1,35 @@
+# Python bindings integration
+
+PYTHON_SRC_DIR := bindings/python
+PYTHON_BINDINGS_OUT := $(objdir)/bindings/python
+PYTHON_BINDINGS_STAMP := $(PYTHON_BINDINGS_OUT)/.built
+PYTHON_SITEARCH ?= $(shell $(PYTHON) -c 'import sysconfig; print(sysconfig.get_path("platlib"))')
+
+ifeq ($(WITH_PYTHON),y)
+TARGETS += bindings-python
+PHONIES += bindings-python install-python
+
+bindings-python: $(PYTHON_BINDINGS_STAMP)
+
+$(PYTHON_BINDINGS_STAMP): $(objdir)/libdtrace.so \
+	$(wildcard $(PYTHON_SRC_DIR)/src/*.c) \
+	$(PYTHON_SRC_DIR)/setup.py \
+	$(PYTHON_SRC_DIR)/pyproject.toml
+	$(call describe-target,PYTHON,$(PYTHON_BINDINGS_OUT))
+	mkdir -p $(PYTHON_BINDINGS_OUT)
+	cd $(PYTHON_SRC_DIR) && \
+		$(PYTHON) setup.py build_ext \
+	    --build-lib $(abspath $(PYTHON_BINDINGS_OUT)) \
+	    --build-temp $(abspath $(PYTHON_BINDINGS_OUT))/temp
+	touch $@
+
+install:: install-python
+
+install-python: $(PYTHON_BINDINGS_STAMP)
+	$(call describe-install-target,$(PYTHON_SITEARCH),$(notdir $(wildcard $(PYTHON_BINDINGS_OUT)/dtrace*.so)))
+	mkdir -p $(DESTDIR)$(PYTHON_SITEARCH)
+	install -m 755 $(PYTHON_BINDINGS_OUT)/dtrace*.so $(DESTDIR)$(PYTHON_SITEARCH)
+endif
+
+clean::
+	rm -rf $(PYTHON_BINDINGS_OUT)
diff --git a/bindings/python/README.md b/bindings/python/README.md
new file mode 100644
index 00000000..29fccfc3
--- /dev/null
+++ b/bindings/python/README.md
@@ -0,0 +1,68 @@
+# Python bindings for libdtrace
+
+This directory contains Python bindings for the `libdtrace` consumer API. The
+extension allows Python applications to compile D programs, enable and control
+tracing, and inspect aggregation results (including associative arrays) without
+shelling out to the `dtrace` CLI.
+
+## Requirements
+
+- Python 3.6 or newer
+- A built copy of `libdtrace` from this source tree (run `make libdtrace`)
+- A working C compiler toolchain and Python development headers
+
+## Building and installing (editable)
+
+```bash
+# Build libdtrace first (from repository root)
+$ make libdtrace
+
+# Install the bindings into your current Python environment
+$ cd bindings/python
+$ python3 -m pip install --upgrade build
+$ python3 -m pip install -e .
+```
+
+By default the build looks for headers under `../include` and `../libdtrace`,
+and for the shared library under `../build`. You can override the search paths
+with environment variables:
+
+- `DTRACE_INCLUDE_DIRS`: colon-separated list of additional include paths
+- `DTRACE_LIBRARY_DIRS`: colon-separated list of additional library paths
+- `DTRACE_EXTRA_COMPILE_ARGS`: extra compiler flags (space separated)
+- `DTRACE_EXTRA_LINK_ARGS`: extra linker flags (space separated)
+
+Example:
+
+```bash
+$ DTRACE_INCLUDE_DIRS=/opt/dtrace/include \
+  DTRACE_LIBRARY_DIRS=/opt/dtrace/lib \
+  python3 -m pip install -e .
+```
+
+## Quick start
+
+```python
+from dtrace import DTraceSession
+
+program = """
+#pragma D option quiet
+syscall::open*:entry
+{
+    @counts[execname] = count();
+}
+"""
+
+with DTraceSession() as dt:
+    compiled = dt.compile(program)
+    dt.enable(compiled)
+    dt.go()
+    # ... run workload here ...
+    dt.agg_snap()
+    for entry in dt.agg_walk():
+        print(entry["keys"], entry["samples"], entry["value"])
+```
+
+This is an early-stage binding: probe record consumption (`dtrace_consume`) and
+formatted aggregation output are still on the roadmap. Contributions and bug
+reports are welcome.
diff --git a/bindings/python/pyproject.toml b/bindings/python/pyproject.toml
new file mode 100644
index 00000000..7b959378
--- /dev/null
+++ b/bindings/python/pyproject.toml
@@ -0,0 +1,3 @@
+[build-system]
+requires = ["setuptools>=64", "wheel"]
+build-backend = "setuptools.build_meta"
diff --git a/bindings/python/setup.py b/bindings/python/setup.py
new file mode 100644
index 00000000..8be047b7
--- /dev/null
+++ b/bindings/python/setup.py
@@ -0,0 +1,52 @@
+import os
+from pathlib import Path
+from typing import List
+
+from setuptools import Extension, setup
+
+ROOT = Path(__file__).resolve().parents[2]
+
+# Default include directories assume an in-tree build of libdtrace.
+default_include_dirs = [
+    str(ROOT / "include"),
+    str(ROOT / "libdtrace"),
+    str(ROOT / "include" / "dtrace"),
+    str(ROOT / "build"),
+]
+
+default_library_dirs: List[str] = []
+if (ROOT / "build").exists():
+    default_library_dirs.append(str(ROOT / "build"))
+
+extra_include = os.environ.get("DTRACE_INCLUDE_DIRS")
+if extra_include:
+    default_include_dirs.extend(p for p in extra_include.split(os.pathsep) if p)
+
+extra_library = os.environ.get("DTRACE_LIBRARY_DIRS")
+if extra_library:
+    default_library_dirs.extend(p for p in extra_library.split(os.pathsep) if p)
+
+extra_link_args = os.environ.get("DTRACE_EXTRA_LINK_ARGS", "").split()
+extra_compile_args = os.environ.get("DTRACE_EXTRA_COMPILE_ARGS", "").split()
+
+ext_modules = [
+    Extension(
+        "dtrace",
+        sources=["src/pydtrace_module.c"],
+        include_dirs=default_include_dirs,
+        libraries=["dtrace"],
+        library_dirs=default_library_dirs,
+        extra_compile_args=extra_compile_args,
+        extra_link_args=extra_link_args,
+    )
+]
+
+setup(
+    name="dtrace",
+    version="0.1.0",
+    description="Python bindings for libdtrace",
+    author="Oracle Linux DTrace maintainers",
+    license="UPL",
+    python_requires=">=3.6",
+    ext_modules=ext_modules,
+)
diff --git a/bindings/python/src/pydtrace_module.c b/bindings/python/src/pydtrace_module.c
new file mode 100644
index 00000000..c96179b0
--- /dev/null
+++ b/bindings/python/src/pydtrace_module.c
@@ -0,0 +1,1187 @@
+/*
+ * Python bindings for libdtrace.
+ *
+ * This module exposes a thin object oriented wrapper around libdtrace so that
+ * Python applications can compile, enable, and control tracing programs while
+ * also consuming aggregation results as native Python objects.
+ *
+ * Oracle Linux DTrace is licensed under the Universal Permissive License v 1.0.
+ */
+
+#define PY_SSIZE_T_CLEAN
+#include <Python.h>
+
+#include <stdint.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/types.h>
+
+#include <dtrace.h>
+#include "dt_aggregate.h"
+
+#ifndef UNUSED
+#define UNUSED(x) ((void)(x))
+#endif
+
+typedef struct {
+    PyObject_HEAD
+    dtrace_hdl_t *dtp;
+    int closed;
+} PyDTraceSession;
+
+typedef struct {
+    PyObject_HEAD
+    PyDTraceSession *session;
+    dtrace_prog_t *prog;
+} PyDTraceProgram;
+
+typedef struct {
+    PyObject_HEAD
+    PyDTraceSession *session;
+    struct dtrace_proc *proc;
+} PyDTraceProc;
+
+static PyObject *PyExc_DTraceError = NULL;
+
+/* ------------------------------------------------------------------------- */
+/* Utility helpers                                                           */
+/* ------------------------------------------------------------------------- */
+
+static int
+ensure_open(PyDTraceSession *self)
+{
+    if (self->closed || self->dtp == NULL) {
+        PyErr_SetString(PyExc_DTraceError, "DTrace session is closed");
+        return -1;
+    }
+
+    return 0;
+}
+
+static PyObject *
+raise_dtrace_error_with_code(dtrace_hdl_t *dtp, int error, const char *ctx)
+{
+    const char *msg = dtp != NULL ? dtrace_errmsg(dtp, error) : "unknown error";
+
+    if (ctx != NULL)
+        PyErr_Format(PyExc_DTraceError, "%s: %s", ctx, msg);
+    else
+        PyErr_SetString(PyExc_DTraceError, msg);
+
+    return NULL;
+}
+
+static PyObject *
+raise_dtrace_error(PyDTraceSession *self, const char *ctx)
+{
+    int error = dtrace_errno(self->dtp);
+    return raise_dtrace_error_with_code(self->dtp, error, ctx);
+}
+
+static inline uint64_t
+read_uint(const void *addr, size_t size)
+{
+    switch (size) {
+    case 1:
+        return *((const uint8_t *)addr);
+    case 2:
+        return *((const uint16_t *)addr);
+    case 4:
+        return *((const uint32_t *)addr);
+    case 8:
+        return *((const uint64_t *)addr);
+    default:
+        return 0;
+    }
+}
+
+static inline int64_t
+read_sint(const void *addr, size_t size)
+{
+    switch (size) {
+    case 1:
+        return *((const int8_t *)addr);
+    case 2:
+        return *((const int16_t *)addr);
+    case 4:
+        return *((const int32_t *)addr);
+    case 8:
+        return *((const int64_t *)addr);
+    default:
+        return 0;
+    }
+}
+
+static PyObject *
+bytes_or_string_from_buffer(const char *addr, size_t size)
+{
+    if (size == 0)
+        return PyBytes_FromStringAndSize("", 0);
+
+    if (addr[size - 1] == '\0') {
+        size_t n = strnlen(addr, size);
+        return PyUnicode_DecodeUTF8(addr, (Py_ssize_t)n, "replace");
+    }
+
+    return PyBytes_FromStringAndSize(addr, (Py_ssize_t)size);
+}
+
+static const char *
+agg_action_label(uint16_t action)
+{
+    switch (action) {
+    case DT_AGG_AVG:
+        return "avg";
+    case DT_AGG_COUNT:
+        return "count";
+    case DT_AGG_LLQUANTIZE:
+        return "llquantize";
+    case DT_AGG_LQUANTIZE:
+        return "lquantize";
+    case DT_AGG_MAX:
+        return "max";
+    case DT_AGG_MIN:
+        return "min";
+    case DT_AGG_QUANTIZE:
+        return "quantize";
+    case DT_AGG_STDDEV:
+        return "stddev";
+    case DT_AGG_SUM:
+        return "sum";
+    default:
+        return "unknown";
+    }
+}
+
+static PyObject *
+convert_record_value(const dtrace_recdesc_t *rec, caddr_t base, uint64_t normal)
+{
+    caddr_t addr = base + rec->dtrd_offset;
+    size_t size = rec->dtrd_size;
+
+    if (normal == 0)
+        normal = 1;
+
+    switch (rec->dtrd_action) {
+    case DT_AGG_AVG: {
+        if (size < sizeof(int64_t) * 2)
+            return PyFloat_FromDouble(0.0);
+
+        const int64_t *data = (const int64_t *)addr;
+        if (data[0] == 0)
+            return PyFloat_FromDouble(0.0);
+
+        long double avg = (long double)data[1] / (long double)normal / (long double)data[0];
+        return PyFloat_FromDouble((double)avg);
+    }
+
+    case DT_AGG_SUM:
+    case DT_AGG_MIN:
+    case DT_AGG_MAX:
+    case DT_AGG_COUNT: {
+        int64_t value = read_sint(addr, size);
+        value /= (int64_t)normal;
+        return PyLong_FromLongLong(value);
+    }
+
+    case DT_AGG_STDDEV:
+    case DT_AGG_QUANTIZE:
+    case DT_AGG_LQUANTIZE:
+    case DT_AGG_LLQUANTIZE:
+        return PyBytes_FromStringAndSize((const char *)addr, (Py_ssize_t)size);
+
+    default:
+        break;
+    }
+
+    switch (size) {
+    case 1:
+    case 2:
+    case 4:
+    case 8: {
+        int64_t value = read_sint(addr, size);
+        value /= (int64_t)normal;
+        return PyLong_FromLongLong(value);
+    }
+    default:
+        return bytes_or_string_from_buffer((const char *)addr, size);
+    }
+}
+
+static PyObject *
+convert_key_value(const dtrace_recdesc_t *rec, caddr_t base)
+{
+    caddr_t addr = base + rec->dtrd_offset;
+    size_t size = rec->dtrd_size;
+
+    switch (size) {
+    case 1:
+    case 2:
+    case 4:
+    case 8:
+        return PyLong_FromLongLong(read_sint(addr, size));
+    default:
+        return bytes_or_string_from_buffer((const char *)addr, size);
+    }
+}
+
+static PyObject *
+convert_aggdata(const dtrace_aggdata_t *aggdata)
+{
+    const dtrace_aggdesc_t *agg = aggdata->dtada_desc;
+    const dtrace_recdesc_t *counter_rec = &agg->dtagd_drecs[DT_AGGDATA_COUNTER];
+    const dtrace_recdesc_t *value_rec = &agg->dtagd_drecs[DT_AGGDATA_RECORD];
+    PyObject *entry = PyDict_New();
+
+    if (entry == NULL)
+        return NULL;
+
+    PyObject *name = agg->dtagd_name != NULL ? PyUnicode_FromString(agg->dtagd_name) : Py_None;
+    if (name == NULL)
+        goto error;
+    if (name == Py_None)
+        Py_INCREF(Py_None);
+    if (PyDict_SetItemString(entry, "name", name) < 0) {
+        Py_DECREF(name);
+        goto error;
+    }
+    Py_DECREF(name);
+
+    PyObject *aggid = PyLong_FromLong(agg->dtagd_varid);
+    if (aggid == NULL)
+        goto error;
+    if (PyDict_SetItemString(entry, "id", aggid) < 0) {
+        Py_DECREF(aggid);
+        goto error;
+    }
+    Py_DECREF(aggid);
+
+    PyObject *action = PyUnicode_FromString(agg_action_label(value_rec->dtrd_action));
+    if (action == NULL)
+        goto error;
+    if (PyDict_SetItemString(entry, "action", action) < 0) {
+        Py_DECREF(action);
+        goto error;
+    }
+    Py_DECREF(action);
+
+    PyObject *keys = PyList_New(0);
+    if (keys == NULL)
+        goto error;
+
+    for (uint_t i = 1; i < agg->dtagd_nkrecs; i++) {
+        const dtrace_recdesc_t *rec = &agg->dtagd_krecs[i];
+        PyObject *item = convert_key_value(rec, aggdata->dtada_key);
+
+        if (item == NULL) {
+            Py_DECREF(keys);
+            goto error;
+        }
+
+        if (PyList_Append(keys, item) < 0) {
+            Py_DECREF(item);
+            Py_DECREF(keys);
+            goto error;
+        }
+        Py_DECREF(item);
+    }
+
+    if (PyDict_SetItemString(entry, "keys", keys) < 0) {
+        Py_DECREF(keys);
+        goto error;
+    }
+    Py_DECREF(keys);
+
+    uint64_t samples = read_uint(aggdata->dtada_data + counter_rec->dtrd_offset,
+                                 counter_rec->dtrd_size);
+    PyObject *samples_obj = PyLong_FromUnsignedLongLong(samples);
+    if (samples_obj == NULL)
+        goto error;
+    if (PyDict_SetItemString(entry, "samples", samples_obj) < 0) {
+        Py_DECREF(samples_obj);
+        goto error;
+    }
+    Py_DECREF(samples_obj);
+
+    uint64_t normal = agg->dtagd_normal ? agg->dtagd_normal : 1;
+    PyObject *normal_obj = PyLong_FromUnsignedLongLong(normal);
+    if (normal_obj == NULL)
+        goto error;
+    if (PyDict_SetItemString(entry, "normal", normal_obj) < 0) {
+        Py_DECREF(normal_obj);
+        goto error;
+    }
+    Py_DECREF(normal_obj);
+
+    PyObject *value = convert_record_value(value_rec, aggdata->dtada_data, normal);
+    if (value == NULL)
+        goto error;
+    if (PyDict_SetItemString(entry, "value", value) < 0) {
+        Py_DECREF(value);
+        goto error;
+    }
+    Py_DECREF(value);
+
+    PyObject *raw = PyBytes_FromStringAndSize(
+        (const char *)(aggdata->dtada_data + value_rec->dtrd_offset),
+        (Py_ssize_t)value_rec->dtrd_size);
+    if (raw == NULL)
+        goto error;
+    if (PyDict_SetItemString(entry, "raw", raw) < 0) {
+        Py_DECREF(raw);
+        goto error;
+    }
+    Py_DECREF(raw);
+
+    return entry;
+
+error:
+    Py_DECREF(entry);
+    return NULL;
+}
+
+/* ------------------------------------------------------------------------- */
+/* Aggregation walk context                                                  */
+/* ------------------------------------------------------------------------- */
+
+typedef struct {
+    PyObject *list;
+} agg_walk_ctx_t;
+
+static int
+agg_walk_callback(const dtrace_aggdata_t *aggdata, void *arg)
+{
+    agg_walk_ctx_t *ctx = (agg_walk_ctx_t *)arg;
+    PyObject *entry = convert_aggdata(aggdata);
+
+    if (entry == NULL)
+        return DTRACE_AGGWALK_ERROR;
+
+    if (PyList_Append(ctx->list, entry) < 0) {
+        Py_DECREF(entry);
+        return DTRACE_AGGWALK_ERROR;
+    }
+
+    Py_DECREF(entry);
+    return DTRACE_AGGWALK_NEXT;
+}
+
+/* ------------------------------------------------------------------------- */
+/* PyDTraceProgram                                                           */
+/* ------------------------------------------------------------------------- */
+
+static void
+PyDTraceProgram_dealloc(PyDTraceProgram *self)
+{
+    Py_XDECREF(self->session);
+    PyObject_Del(self);
+}
+
+static PyTypeObject PyDTraceProgramType;
+
+static PyObject *
+PyDTraceProgram_new(PyTypeObject *type, PyObject *args, PyObject *kwds)
+{
+    UNUSED(args);
+    UNUSED(kwds);
+    PyDTraceProgram *self = (PyDTraceProgram *)type->tp_alloc(type, 0);
+    if (self != NULL) {
+        self->session = NULL;
+        self->prog = NULL;
+    }
+    return (PyObject *)self;
+}
+
+static PyMethodDef PyDTraceProgram_methods[] = {
+    {NULL, NULL, 0, NULL}
+};
+
+static PyTypeObject PyDTraceProgramType = {
+    PyVarObject_HEAD_INIT(NULL, 0)
+    .tp_name = "dtrace.DTraceProgram",
+    .tp_basicsize = sizeof(PyDTraceProgram),
+    .tp_flags = Py_TPFLAGS_DEFAULT,
+    .tp_new = PyDTraceProgram_new,
+    .tp_dealloc = (destructor)PyDTraceProgram_dealloc,
+    .tp_methods = PyDTraceProgram_methods,
+};
+
+/* ------------------------------------------------------------------------- */
+/* PyDTraceSession                                                           */
+/* ------------------------------------------------------------------------- */
+
+static void
+PyDTraceSession_dealloc(PyDTraceSession *self)
+{
+    if (self->dtp != NULL && !self->closed)
+        dtrace_close(self->dtp);
+
+    self->dtp = NULL;
+    self->closed = 1;
+    PyObject_Del(self);
+}
+
+static PyObject *
+PyDTraceSession_new(PyTypeObject *type, PyObject *args, PyObject *kwds)
+{
+    UNUSED(args);
+    UNUSED(kwds);
+    PyDTraceSession *self = (PyDTraceSession *)type->tp_alloc(type, 0);
+    if (self != NULL) {
+        self->dtp = NULL;
+        self->closed = 1;
+    }
+    return (PyObject *)self;
+}
+
+static int
+PyDTraceSession_init(PyDTraceSession *self, PyObject *args, PyObject *kwds)
+{
+    static char *kwlist[] = {"version", "flags", NULL};
+    int version = DTRACE_VERSION;
+    unsigned int flags = 0;
+    int err = 0;
+
+    if (!PyArg_ParseTupleAndKeywords(args, kwds, "|Ii", kwlist,
+                                     &version, &flags))
+        return -1;
+
+    self->dtp = dtrace_open(version, flags, &err);
+    if (self->dtp == NULL)
+        return raise_dtrace_error_with_code(NULL, err, "dtrace_open") == NULL ? -1 : -1;
+
+    if (dtrace_init(self->dtp) != 0) {
+        raise_dtrace_error(self, "dtrace_init");
+        dtrace_close(self->dtp);
+        self->dtp = NULL;
+        return -1;
+    }
+    if (dtrace_setopt(self->dtp, "aggsize", "4m") != 0 ||
+	dtrace_setopt(self->dtp, "bufsize", "4m") != 0) {
+	raise_dtrace_error(self, "dtrace_setopt");
+	dtrace_close(self->dtp);
+	self->dtp = NULL;
+	return -1;
+    }
+    self->closed = 0;
+    return 0;
+}
+
+static PyObject *
+PyDTraceSession_close(PyDTraceSession *self, PyObject *Py_UNUSED(args))
+{
+    if (!self->closed && self->dtp != NULL) {
+        dtrace_close(self->dtp);
+        self->dtp = NULL;
+        self->closed = 1;
+    }
+
+    Py_RETURN_NONE;
+}
+
+static PyObject *
+PyDTraceSession_enter(PyDTraceSession *self, PyObject *Py_UNUSED(args))
+{
+    if (ensure_open(self) < 0)
+        return NULL;
+
+    Py_INCREF(self);
+    return (PyObject *)self;
+}
+
+static PyObject *
+PyDTraceSession_exit(PyDTraceSession *self, PyObject *args)
+{
+    UNUSED(args);
+
+    if (!self->closed && self->dtp != NULL) {
+        dtrace_close(self->dtp);
+        self->dtp = NULL;
+        self->closed = 1;
+    }
+
+    Py_RETURN_FALSE;
+}
+
+static PyObject *
+PyDTraceSession_setopt(PyDTraceSession *self, PyObject *args, PyObject *kwds)
+{
+    static char *kwlist[] = {"option", "value", NULL};
+    const char *opt = NULL;
+    PyObject *value_obj = Py_None;
+    PyObject *value_str = NULL;
+    const char *cvalue = NULL;
+
+    if (ensure_open(self) < 0)
+        return NULL;
+
+    if (!PyArg_ParseTupleAndKeywords(args, kwds, "s|O", kwlist,
+                                     &opt, &value_obj))
+        return NULL;
+
+    if (value_obj == Py_None) {
+        cvalue = NULL;
+    } else {
+        PyObject *string_obj = PyObject_Str(value_obj);
+        if (string_obj == NULL)
+            return NULL;
+        value_str = PyUnicode_AsEncodedString(string_obj, "utf-8", "replace");
+        Py_DECREF(string_obj);
+        if (value_str == NULL)
+            return NULL;
+        cvalue = PyBytes_AS_STRING(value_str);
+    }
+
+    if (dtrace_setopt(self->dtp, opt, cvalue) != 0) {
+        Py_XDECREF(value_str);
+        return raise_dtrace_error(self, "dtrace_setopt");
+    }
+
+    Py_XDECREF(value_str);
+    Py_RETURN_NONE;
+}
+
+static PyObject *
+PyDTraceSession_compile(PyDTraceSession *self, PyObject *args, PyObject *kwds)
+{
+    static char *kwlist[] = {"program", "cflags", "argv", "spec", NULL};
+    const char *source = NULL;
+    unsigned int cflags = 0;
+    PyObject *argv_obj = NULL;
+    int spec = DTRACE_PROBESPEC_NAME;
+    PyObject *argv_seq = NULL;
+    char **argv = NULL;
+    PyObject **encoded = NULL;
+    Py_ssize_t argc = 0;
+    dtrace_prog_t *prog = NULL;
+    PyDTraceProgram *wrapper = NULL;
+
+    if (ensure_open(self) < 0)
+        return NULL;
+
+    if (!PyArg_ParseTupleAndKeywords(args, kwds, "s|IOi", kwlist,
+                                     &source, &cflags, &argv_obj, &spec))
+        return NULL;
+
+    if (argv_obj != NULL && argv_obj != Py_None) {
+        argv_seq = PySequence_Fast(argv_obj, "argv must be a sequence of strings");
+        if (argv_seq == NULL)
+            return NULL;
+
+        argc = PySequence_Fast_GET_SIZE(argv_seq);
+        if (argc > 0) {
+            argv = PyMem_Calloc((size_t)argc, sizeof(char *));
+            encoded = PyMem_Calloc((size_t)argc, sizeof(PyObject *));
+            if (argv == NULL || encoded == NULL) {
+                PyMem_Free(argv);
+                PyMem_Free(encoded);
+                Py_DECREF(argv_seq);
+                return PyErr_NoMemory();
+            }
+
+            for (Py_ssize_t i = 0; i < argc; i++) {
+                PyObject *item = PySequence_Fast_GET_ITEM(argv_seq, i);
+                PyObject *string_obj = PyObject_Str(item);
+                if (string_obj == NULL) {
+                    Py_DECREF(argv_seq);
+                    goto compile_error;
+                }
+                encoded[i] = PyUnicode_AsEncodedString(string_obj, "utf-8", "replace");
+                Py_DECREF(string_obj);
+                if (encoded[i] == NULL) {
+                    Py_DECREF(argv_seq);
+                    goto compile_error;
+                }
+                argv[i] = PyBytes_AS_STRING(encoded[i]);
+            }
+        }
+    }
+
+    prog = dtrace_program_strcompile(self->dtp, source,
+                                     (dtrace_probespec_t)spec,
+                                     cflags,
+                                     (int)argc,
+                                     argv);
+
+    Py_XDECREF(argv_seq);
+
+    if (prog == NULL) {
+        for (Py_ssize_t i = 0; i < argc; i++)
+            Py_XDECREF(encoded[i]);
+        PyMem_Free(encoded);
+        PyMem_Free(argv);
+        return raise_dtrace_error(self, "dtrace_program_strcompile");
+    }
+
+    wrapper = (PyDTraceProgram *)PyObject_CallObject((PyObject *)&PyDTraceProgramType, NULL);
+    if (wrapper == NULL) {
+        for (Py_ssize_t i = 0; i < argc; i++)
+            Py_XDECREF(encoded[i]);
+        PyMem_Free(encoded);
+        PyMem_Free(argv);
+        return NULL;
+    }
+
+    Py_INCREF(self);
+    wrapper->session = self;
+    wrapper->prog = prog;
+
+    for (Py_ssize_t i = 0; i < argc; i++)
+        Py_XDECREF(encoded[i]);
+    PyMem_Free(encoded);
+    PyMem_Free(argv);
+
+    return (PyObject *)wrapper;
+
+compile_error:
+    for (Py_ssize_t i = 0; i < argc; i++)
+        Py_XDECREF(encoded[i]);
+    PyMem_Free(encoded);
+    PyMem_Free(argv);
+    return NULL;
+}
+
+static PyObject *
+PyDTraceSession_enable(PyDTraceSession *self, PyObject *args, PyObject *kwds)
+{
+    static char *kwlist[] = {"program", NULL};
+    PyDTraceProgram *program = NULL;
+    dtrace_proginfo_t info;
+    PyObject *result = NULL;
+    PyObject *tmp = NULL;
+    PyObject *attr = NULL;
+
+    if (ensure_open(self) < 0)
+        return NULL;
+
+    if (!PyArg_ParseTupleAndKeywords(args, kwds, "O!", kwlist,
+                                     &PyDTraceProgramType, &program))
+        return NULL;
+
+    if (program->session != self) {
+        PyErr_SetString(PyExc_ValueError, "program was created by a different session");
+        return NULL;
+    }
+
+    memset(&info, 0, sizeof(info));
+
+    if (dtrace_program_exec(self->dtp, program->prog, &info) != 0)
+        return raise_dtrace_error(self, "dtrace_program_exec");
+
+    result = PyDict_New();
+    if (result == NULL)
+        return NULL;
+
+    tmp = PyLong_FromUnsignedLong(info.dpi_aggregates);
+    if (tmp == NULL || PyDict_SetItemString(result, "aggregations", tmp) < 0)
+        goto enable_error;
+    Py_DECREF(tmp);
+
+    tmp = PyLong_FromUnsignedLong(info.dpi_recgens);
+    if (tmp == NULL || PyDict_SetItemString(result, "recgens", tmp) < 0)
+        goto enable_error;
+    Py_DECREF(tmp);
+
+    tmp = PyLong_FromUnsignedLong(info.dpi_matches);
+    if (tmp == NULL || PyDict_SetItemString(result, "matches", tmp) < 0)
+        goto enable_error;
+    Py_DECREF(tmp);
+
+    tmp = PyLong_FromUnsignedLong(info.dpi_speculations);
+    if (tmp == NULL || PyDict_SetItemString(result, "speculations", tmp) < 0)
+        goto enable_error;
+    Py_DECREF(tmp);
+
+    attr = PyDict_New();
+    if (attr == NULL)
+        goto enable_error;
+
+    tmp = PyLong_FromUnsignedLong(info.dpi_descattr.dtat_name);
+    if (tmp == NULL || PyDict_SetItemString(attr, "name", tmp) < 0)
+        goto enable_error;
+    Py_DECREF(tmp);
+
+    tmp = PyLong_FromUnsignedLong(info.dpi_descattr.dtat_data);
+    if (tmp == NULL || PyDict_SetItemString(attr, "data", tmp) < 0)
+        goto enable_error;
+    Py_DECREF(tmp);
+
+    tmp = PyLong_FromUnsignedLong(info.dpi_descattr.dtat_class);
+    if (tmp == NULL || PyDict_SetItemString(attr, "class", tmp) < 0)
+        goto enable_error;
+    Py_DECREF(tmp);
+
+    if (PyDict_SetItemString(result, "descattr", attr) < 0)
+        goto enable_error;
+    Py_DECREF(attr);
+    attr = NULL;
+
+    attr = PyDict_New();
+    if (attr == NULL)
+        goto enable_error;
+
+    tmp = PyLong_FromUnsignedLong(info.dpi_stmtattr.dtat_name);
+    if (tmp == NULL || PyDict_SetItemString(attr, "name", tmp) < 0)
+        goto enable_error;
+    Py_DECREF(tmp);
+
+    tmp = PyLong_FromUnsignedLong(info.dpi_stmtattr.dtat_data);
+    if (tmp == NULL || PyDict_SetItemString(attr, "data", tmp) < 0)
+        goto enable_error;
+    Py_DECREF(tmp);
+
+    tmp = PyLong_FromUnsignedLong(info.dpi_stmtattr.dtat_class);
+    if (tmp == NULL || PyDict_SetItemString(attr, "class", tmp) < 0)
+        goto enable_error;
+    Py_DECREF(tmp);
+
+    if (PyDict_SetItemString(result, "stmtattr", attr) < 0)
+        goto enable_error;
+    Py_DECREF(attr);
+    attr = NULL;
+
+    return result;
+
+enable_error:
+    Py_XDECREF(attr);
+    Py_XDECREF(tmp);
+    Py_DECREF(result);
+    return NULL;
+}
+
+static PyObject *
+PyDTraceSession_go(PyDTraceSession *self, PyObject *args, PyObject *kwds)
+{
+    static char *kwlist[] = {"cflags", NULL};
+    unsigned int cflags = 0;
+    int rc;
+
+    if (ensure_open(self) < 0)
+        return NULL;
+
+    if (!PyArg_ParseTupleAndKeywords(args, kwds, "|I", kwlist, &cflags))
+        return NULL;
+
+    Py_BEGIN_ALLOW_THREADS
+    rc = dtrace_go(self->dtp, cflags);
+    Py_END_ALLOW_THREADS
+
+    if (rc != 0)
+        return raise_dtrace_error(self, "dtrace_go");
+
+    Py_RETURN_NONE;
+}
+
+static PyObject *
+PyDTraceSession_stop(PyDTraceSession *self, PyObject *Py_UNUSED(args))
+{
+    if (ensure_open(self) < 0)
+        return NULL;
+
+    if (dtrace_stop(self->dtp) != 0)
+        return raise_dtrace_error(self, "dtrace_stop");
+
+    Py_RETURN_NONE;
+}
+
+static PyObject *
+PyDTraceSession_update(PyDTraceSession *self, PyObject *Py_UNUSED(args))
+{
+    if (ensure_open(self) < 0)
+        return NULL;
+
+    if (dtrace_update(self->dtp) != 0)
+        return raise_dtrace_error(self, "dtrace_update");
+
+    Py_RETURN_NONE;
+}
+
+static PyObject *
+PyDTraceSession_status(PyDTraceSession *self, PyObject *Py_UNUSED(args))
+{
+    if (ensure_open(self) < 0)
+        return NULL;
+
+    int status = dtrace_status(self->dtp);
+    if (status == DTRACE_STATUS_ERROR)
+        return raise_dtrace_error(self, "dtrace_status");
+
+    return PyLong_FromLong(status);
+}
+
+static PyObject *
+PyDTraceSession_consume(PyDTraceSession *self, PyObject *Py_UNUSED(args))
+{
+    UNUSED(self);
+    PyErr_SetString(PyExc_NotImplementedError, "consume() not implemented yet");
+    return NULL;
+}
+
+static PyObject *
+PyDTraceSession_agg_snap(PyDTraceSession *self, PyObject *Py_UNUSED(args))
+{
+    if (ensure_open(self) < 0)
+        return NULL;
+
+    if (dtrace_aggregate_snap(self->dtp) != 0)
+        return raise_dtrace_error(self, "dtrace_aggregate_snap");
+
+    Py_RETURN_NONE;
+}
+
+static PyObject *
+PyDTraceSession_agg_clear(PyDTraceSession *self, PyObject *Py_UNUSED(args))
+{
+    if (ensure_open(self) < 0)
+        return NULL;
+
+    dtrace_aggregate_clear(self->dtp);
+    Py_RETURN_NONE;
+}
+
+static dtrace_aggregate_walk_f *
+resolve_agg_walk(const char *mode)
+{
+    if (mode == NULL || strcmp(mode, "default") == 0)
+        return dtrace_aggregate_walk;
+    if (strcmp(mode, "keys") == 0)
+        return dtrace_aggregate_walk_keysorted;
+    if (strcmp(mode, "values") == 0)
+        return dtrace_aggregate_walk_valsorted;
+    if (strcmp(mode, "keyrev") == 0)
+        return dtrace_aggregate_walk_keyrevsorted;
+    if (strcmp(mode, "valrev") == 0)
+        return dtrace_aggregate_walk_valrevsorted;
+    if (strcmp(mode, "keyvar") == 0)
+        return dtrace_aggregate_walk_keyvarsorted;
+    if (strcmp(mode, "valvar") == 0)
+        return dtrace_aggregate_walk_valvarsorted;
+    if (strcmp(mode, "keyvarrev") == 0)
+        return dtrace_aggregate_walk_keyvarrevsorted;
+    if (strcmp(mode, "valvarrev") == 0)
+        return dtrace_aggregate_walk_valvarrevsorted;
+    return NULL;
+}
+
+static PyObject *
+PyDTraceSession_agg_walk(PyDTraceSession *self, PyObject *args, PyObject *kwds)
+{
+    static char *kwlist[] = {"mode", NULL};
+    const char *mode = "values";
+    dtrace_aggregate_walk_f *walker = NULL;
+    agg_walk_ctx_t ctx;
+    int rc;
+
+    if (ensure_open(self) < 0)
+        return NULL;
+
+    if (!PyArg_ParseTupleAndKeywords(args, kwds, "|s", kwlist, &mode))
+        return NULL;
+
+    walker = resolve_agg_walk(mode);
+    if (walker == NULL) {
+        PyErr_SetString(PyExc_ValueError, "unknown aggregation walk mode");
+        return NULL;
+    }
+
+    ctx.list = PyList_New(0);
+    if (ctx.list == NULL)
+        return NULL;
+
+    rc = walker(self->dtp, agg_walk_callback, &ctx);
+    if (rc != 0) {
+        Py_DECREF(ctx.list);
+        return raise_dtrace_error(self, "dtrace_aggregate_walk");
+    }
+
+    return ctx.list;
+}
+
+/* ------------------------------------------------------------------------- */
+/* PyDTraceProc                                                              */
+/* ------------------------------------------------------------------------- */
+
+static PyObject *
+PyDTraceProc_new(PyTypeObject *type, PyObject *args, PyObject *kwds)
+{
+    UNUSED(args);
+    UNUSED(kwds);
+    PyDTraceProc *self = (PyDTraceProc *)type->tp_alloc(type, 0);
+    if (self != NULL) {
+        self->session = NULL;
+        self->proc = NULL;
+    }
+    return (PyObject *)self;
+}
+
+static void
+PyDTraceProc_dealloc(PyDTraceProc *self)
+{
+    if (self->session) {
+        if (self->proc && self->session->dtp)
+            dtrace_proc_release(self->session->dtp, self->proc);
+
+        Py_XDECREF(self->session);
+    }
+    PyObject_Del(self);
+}
+
+static PyObject *
+PyDTraceProc_getpid(PyDTraceProc *self, PyObject *Py_UNUSED(args))
+{
+    int pid = 0;
+    
+    if (self->session)
+        pid = dtrace_proc_getpid(self->session->dtp, self->proc);
+
+    return PyLong_FromLong(pid);
+}
+
+static PyMethodDef PyDTraceProc_methods[] = {
+    {"getpid", (PyCFunction)PyDTraceProc_getpid, METH_NOARGS, "Get pid."},
+    {NULL, NULL, 0, NULL}
+};
+
+static PyTypeObject PyDTraceProcType = {
+     PyVarObject_HEAD_INIT(NULL, 0)
+    .tp_name = "dtrace.DTraceProc",
+    .tp_basicsize = sizeof(PyDTraceProc),
+    .tp_flags = Py_TPFLAGS_DEFAULT,
+    .tp_new = PyDTraceProc_new,
+    .tp_dealloc = (destructor)PyDTraceProc_dealloc,
+    .tp_methods = PyDTraceProc_methods,
+};
+
+#define PROC_CREATE_ARGC_MAX	32
+
+static PyObject *
+PyDTraceSession_proc_create(PyDTraceSession *self, PyObject *args, PyObject *kwds)
+{
+	static char *kwlist[] = {"args", NULL};
+	PyObject *arglist = NULL;
+	char *argvlist[PROC_CREATE_ARGC_MAX];
+	struct dtrace_proc *proc = NULL;
+	PyDTraceProc *retproc;
+	PyObject *ret = NULL;
+	Py_ssize_t i, size;
+
+	if (ensure_open(self) < 0)
+		return NULL;
+
+	if (!PyArg_ParseTupleAndKeywords(args, kwds, "O!", kwlist, &PyList_Type,
+				         &arglist))
+	    return NULL;
+	size = PyList_Size(arglist);
+	if (size < 1) {
+		PyErr_SetString(PyExc_ValueError, "empty arglist for proc_create");
+		return NULL;
+	}
+	for (i = 0; i < size; i++) {
+		PyObject *item = PyList_GetItem(arglist, i);
+
+		if (!PyUnicode_Check(item)) {
+			PyErr_SetString(PyExc_ValueError, "non-string in argument list");
+			return NULL;
+		}
+		argvlist[i] = (char *)PyUnicode_AsUTF8(item);
+	}
+	argvlist[i] = NULL;
+	proc = dtrace_proc_create(self->dtp, argvlist[0], argvlist, 0);
+	if (proc == NULL) {
+		return raise_dtrace_error(self, "dtrace_proc_create");
+	}
+
+	ret = PyDTraceProcType.tp_alloc(&PyDTraceProcType, 0);
+	if (ret == NULL)
+		return ret;
+	retproc = (PyDTraceProc *)ret;
+	retproc->session= self;
+	Py_INCREF(self);
+	retproc->proc = proc;
+
+	return ret;
+}
+
+static PyObject *
+PyDTraceSession_proc_grab_pid(PyDTraceSession *self, PyObject *args, PyObject *kwds)
+{
+	static char *kwlist[] = {"pid", NULL};
+	struct dtrace_proc *proc = NULL;
+        PyDTraceProc *retproc;
+	PyObject *ret;
+	int pid;
+
+	if (!PyArg_ParseTupleAndKeywords(args, kwds, "i", kwlist, &pid))
+		return NULL;
+
+	proc = dtrace_proc_grab_pid(self->dtp, pid, 0);
+	if (!proc)
+		return raise_dtrace_error(self, "dtrace_proc_grab_pid");
+	ret = PyDTraceProcType.tp_alloc(&PyDTraceProcType, 0);
+	if (ret == NULL)
+		return ret;
+	retproc = (PyDTraceProc *)ret;
+	retproc->session = self;
+	Py_INCREF(self);
+	retproc->proc = proc;
+
+	return ret;
+}
+
+static PyObject *
+PyDTraceSession_proc_continue(PyDTraceSession *self, PyObject *args, PyObject *kwds)
+{
+    static char *kwlist[] = {"proc", NULL};
+    PyDTraceProc *proc = NULL;
+
+    if (!PyArg_ParseTupleAndKeywords(args, kwds, "O!", kwlist, &PyDTraceProcType,
+					 &proc))
+        return NULL;
+    if (proc->session != self) {
+            PyErr_SetString(PyExc_ValueError, "proc was created by a different session");
+            return NULL;
+        }
+
+
+    dtrace_proc_continue(self->dtp, proc->proc);
+
+    Py_RETURN_NONE;
+}
+
+static PyObject *
+PyDTraceSession_proc_release(PyDTraceSession *self, PyObject *args, PyObject *kwds)
+{
+    static char *kwlist[] = {"proc", NULL};
+    PyDTraceProc *proc;
+
+    if (!PyArg_ParseTupleAndKeywords(args, kwds, "O!", kwlist, &PyDTraceProcType,
+                                         &proc))
+        return NULL;
+
+    dtrace_proc_release(self->dtp, proc->proc);
+
+    Py_RETURN_NONE;
+}
+
+static PyMethodDef PyDTraceSession_methods[] = {
+    {"close", (PyCFunction)PyDTraceSession_close, METH_NOARGS, "Close the session."},
+    {"__enter__", (PyCFunction)PyDTraceSession_enter, METH_NOARGS, "Context manager entry."},
+    {"__exit__", (PyCFunction)PyDTraceSession_exit, METH_VARARGS, "Context manager exit."},
+    {"setopt", (PyCFunction)PyDTraceSession_setopt, METH_VARARGS | METH_KEYWORDS, "Set a DTrace option."},
+    {"compile", (PyCFunction)PyDTraceSession_compile, METH_VARARGS | METH_KEYWORDS, "Compile a program from a string."},
+    {"enable", (PyCFunction)PyDTraceSession_enable, METH_VARARGS | METH_KEYWORDS, "Enable a compiled program."},
+    {"go", (PyCFunction)PyDTraceSession_go, METH_VARARGS | METH_KEYWORDS, "Start tracing."},
+    {"stop", (PyCFunction)PyDTraceSession_stop, METH_NOARGS, "Stop tracing."},
+    {"update", (PyCFunction)PyDTraceSession_update, METH_NOARGS, "Push pending state changes."},
+    {"status", (PyCFunction)PyDTraceSession_status, METH_NOARGS, "Retrieve tracing status."},
+    {"consume", (PyCFunction)PyDTraceSession_consume, METH_NOARGS, "Consume buffered records (not implemented)."},
+    {"agg_snap", (PyCFunction)PyDTraceSession_agg_snap, METH_NOARGS, "Snapshot aggregation buffers."},
+    {"agg_clear", (PyCFunction)PyDTraceSession_agg_clear, METH_NOARGS, "Clear aggregation buffers."},
+    {"agg_walk", (PyCFunction)PyDTraceSession_agg_walk, METH_VARARGS | METH_KEYWORDS, "Return aggregation results."},
+    {"proc_create", (PyCFunction)PyDTraceSession_proc_create, METH_VARARGS | METH_KEYWORDS, "Create process with args for tracing."},
+    {"proc_grab_pid", (PyCFunction)PyDTraceSession_proc_grab_pid, METH_VARARGS | METH_KEYWORDS, "Grab pid."},
+    {"proc_continue", (PyCFunction)PyDTraceSession_proc_continue, METH_VARARGS | METH_KEYWORDS, "Continue proc execution."},
+    {"proc_release", (PyCFunction)PyDTraceSession_proc_release, METH_VARARGS | METH_KEYWORDS, "Relase proc."},
+    {NULL, NULL, 0, NULL}
+};
+
+static PyTypeObject PyDTraceSessionType = {
+    PyVarObject_HEAD_INIT(NULL, 0)
+    .tp_name = "dtrace.DTraceSession",
+    .tp_basicsize = sizeof(PyDTraceSession),
+    .tp_flags = Py_TPFLAGS_DEFAULT,
+    .tp_new = PyDTraceSession_new,
+    .tp_init = (initproc)PyDTraceSession_init,
+    .tp_dealloc = (destructor)PyDTraceSession_dealloc,
+    .tp_methods = PyDTraceSession_methods,
+};
+
+/* ------------------------------------------------------------------------- */
+/* Module definition                                                         */
+/* ------------------------------------------------------------------------- */
+
+static struct PyModuleDef pydtrace_module = {
+    PyModuleDef_HEAD_INIT,
+    .m_name = "dtrace",
+    .m_doc = "Python bindings for libdtrace.",
+    .m_size = -1,
+};
+
+PyMODINIT_FUNC
+PyInit_dtrace(void)
+{
+    PyObject *m;
+
+    if (PyType_Ready(&PyDTraceSessionType) < 0)
+        return NULL;
+    if (PyType_Ready(&PyDTraceProgramType) < 0)
+        return NULL;
+    if (PyType_Ready(&PyDTraceProcType) < 0)
+	    return NULL;
+
+    m = PyModule_Create(&pydtrace_module);
+    if (m == NULL)
+        return NULL;
+
+    PyExc_DTraceError = PyErr_NewException("dtrace.DTraceError", PyExc_RuntimeError, NULL);
+    if (PyExc_DTraceError == NULL) {
+        Py_DECREF(m);
+        return NULL;
+    }
+
+    Py_INCREF(&PyDTraceSessionType);
+    if (PyModule_AddObject(m, "DTraceSession", (PyObject *)&PyDTraceSessionType) < 0) {
+        Py_DECREF(&PyDTraceSessionType);
+        Py_DECREF(m);
+        return NULL;
+    }
+
+    Py_INCREF(&PyDTraceProgramType);
+    if (PyModule_AddObject(m, "DTraceProgram", (PyObject *)&PyDTraceProgramType) < 0) {
+        Py_DECREF(&PyDTraceProgramType);
+        Py_DECREF(m);
+        return NULL;
+    }
+
+    Py_INCREF(&PyDTraceProcType);
+     if (PyModule_AddObject(m, "DTraceProc", (PyObject *)&PyDTraceProcType) < 0) {
+         Py_DECREF(&PyDTraceProcType);
+         Py_DECREF(m);
+         return NULL;
+    }
+
+    Py_INCREF(PyExc_DTraceError);
+    if (PyModule_AddObject(m, "DTraceError", PyExc_DTraceError) < 0) {
+        Py_DECREF(PyExc_DTraceError);
+        Py_DECREF(m);
+        return NULL;
+    }
+
+    if (PyModule_AddIntConstant(m, "DTRACE_VERSION", DTRACE_VERSION) < 0) {
+        Py_DECREF(m);
+        return NULL;
+    }
+
+    if (PyModule_AddIntConstant(m, "DTRACE_STATUS_NONE", DTRACE_STATUS_NONE) < 0) {
+        Py_DECREF(m);
+        return NULL;
+    }
+    if (PyModule_AddIntConstant(m, "DTRACE_STATUS_OKAY", DTRACE_STATUS_OKAY) < 0) {
+        Py_DECREF(m);
+        return NULL;
+    }
+    if (PyModule_AddIntConstant(m, "DTRACE_STATUS_EXITED", DTRACE_STATUS_EXITED) < 0) {
+        Py_DECREF(m);
+        return NULL;
+    }
+    if (PyModule_AddIntConstant(m, "DTRACE_STATUS_FILLED", DTRACE_STATUS_FILLED) < 0) {
+        Py_DECREF(m);
+        return NULL;
+    }
+    if (PyModule_AddIntConstant(m, "DTRACE_STATUS_STOPPED", DTRACE_STATUS_STOPPED) < 0) {
+        Py_DECREF(m);
+        return NULL;
+    }
+
+    return m;
+}
diff --git a/configure b/configure
index 403b1a09..1927b17f 100755
--- a/configure
+++ b/configure
@@ -112,6 +112,7 @@ EOF
         make help-overrides-header help-overrides-option
         cat >&2 <<'EOF'
 --with-systemd=[yes/no]		Install the systemd unit files (default: yes)
+--with-python=[yes/no]		Build the Python bindings (default: yes)
 EOF
         echo >&2
         make help-overrides
@@ -199,6 +200,8 @@ for option in "$@"; do
         --kernel-obj-suffix=*) write_make_var KERNELBLDNAME "$option";;
         --with-systemd|--with-systemd=y*) write_make_var WITH_SYSTEMD "y";;
         --with-systemd=n*|--without-systemd) write_make_var WITH_SYSTEMD "";;
+        --with-python|--with-python=y*) write_make_var WITH_PYTHON "y";;
+        --with-python=n*|--without-python) write_make_var WITH_PYTHON "";;
         HAVE_ELF_GETSHDRSTRNDX=*) write_config_var ELF_GETSHDRSTRNDX "$option";;
         --with-libctf=*) write_config_var LIBCTF "$option";;
         HAVE_LIBCTF=*) write_config_var LIBCTF "$option";;
@@ -245,4 +248,3 @@ cat build/.config/*.h > build/config.h
 cat build/.config/*.mk > build/config.mk
 
 exit 0
-
diff --git a/dtrace.spec b/dtrace.spec
index d72baf9d..a16cb62a 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -40,12 +40,18 @@
 # Build DTrace without LTO.
 %global _lto_cflags %{nil}
 
+%bcond_without python
+
 BuildRequires: rpm
 Name:         dtrace
 License:      Universal Permissive License (UPL), Version 1.0
 Group:        Development/Tools
 Requires:     cpp elfutils-libelf zlib libpcap libpfm
 BuildRequires: glibc-headers bison flex zlib-devel elfutils-libelf-devel
+
+%if %{with python}
+BuildRequires: python3-devel python3-setuptools
+%endif
 BuildRequires: systemd systemd-devel glibc-static %{glibc32} wireshark
 BuildRequires: libpcap-devel valgrind-devel libpfm-devel libbpf-devel
 %if "%{?dist}" == ".el7"
@@ -128,6 +134,18 @@ Group:	      Development/System
 %description testsuite
 The DTrace testsuite.
 
+%if %{with python}
+%package -n python3-dtrace
+Summary:      Python bindings for libdtrace
+Requires:     python3
+Requires:     %{name}%{?_isa} = %{version}-%{release}
+Group:        Development/Libraries
+
+%description -n python3-dtrace
+Python extension module providing access to libdtrace.
+
+%endif
+
 Installed in /usr/lib64/dtrace/testsuite.
 
 'make check' here is just like 'make check' in the source tree, except that
@@ -137,7 +155,7 @@ it always tests the installed DTrace.
 %setup -q
 
 %build
-make -j $(getconf _NPROCESSORS_ONLN) %{bpfc} %{maybe_use_fuse2}
+make -j $(getconf _NPROCESSORS_ONLN) %{bpfc} %{maybe_use_fuse2} %{?with_python:WITH_PYTHON=y PYTHON=%{__python3}}
 
 # Force off debuginfo splitting.  We have no debuginfo in dtrace proper,
 # and the testsuite requires debuginfo for proper operation.
@@ -152,7 +170,7 @@ make -j $(getconf _NPROCESSORS_ONLN) %{bpfc} %{maybe_use_fuse2}
 mkdir -p $RPM_BUILD_ROOT/usr/sbin
 make DESTDIR=$RPM_BUILD_ROOT VERSION=%{version} \
      HDRPREFIX="$RPM_BUILD_ROOT/usr/include" \
-     install install-test
+     install install-test %{?with_python:install-python}      PYTHON=%{__python3}
 
 %if "%{?dist}" == ".el7"
 sed -i '/^ProtectSystem=/d; /^ProtectControlGroups=/d; /^RuntimeDirectory/d;' $RPM_BUILD_ROOT/usr/lib/systemd/system/dtprobed.service
@@ -230,6 +248,13 @@ systemctl start dtprobed || :
 %{_includedir}/sys/dtrace.h
 %{_includedir}/sys/dtrace_types.h
 
+
+%if %{with python}
+%files -n python3-dtrace
+%defattr(-,root,root,-)
+%{python3_sitearch}/dtrace*.so
+%doc bindings/python/README.md
+%endif
 %files testsuite
 %defattr(-,root,root,-)
 %{_libdir}/dtrace/testsuite
-- 
2.43.5

