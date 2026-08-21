Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB17E492505
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328667; cv=none; b=a1KQPUlQ2gXrWdN0ehTb3tbbOJvyd9FWnPvBWvgr2mofzmBhaGXXCWP28ZpI1hMRO3obtyPR+N4iOk4UX1XcrYDNgXc+If7eBJOIwYkEDvUVdsVlOwmbOoFtZj1+CAAP7DrDEUjlCeZNHdjHDcXdkQ0Qo3WbFKYtx0GWT7DlLlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328667; c=relaxed/simple;
	bh=/h6l/j4vYDu44BZ6GmIo1fVNc78EsJDGZBfEO1AThhU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u53akh5G8V5hekzMOAjkn4P7XOO8vv75tODsQ7142pYn0XTGAYJO1yVcWQKYJR1Qhch/WVLyNX8fSgWbhQu4Pr+K/CHqb4qVat7FnEfXexI5Pk28nOM+uK/ZF2eewvFq2hTTaEp2SmquPTZXbr3TY/4PS40jG3rcdjVjBqkP+1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OpRKqst2; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OpRKqst2"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LCpPG03706408
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=AGaWBz2NkyWp3fto35TT2c25ViwL2
	LdrBwvMyx34LUY=; b=OpRKqst2TvsRmXMhkwhGTunowvHcQ0eK0aoL9NBwiCwP+
	HfsK10GKLNnHP+3uKZHbNbxvlgIPu6CPrDBzTWFGPR1++U/nXbBA9TBlh+mYKl6E
	GL+Ju2CtQv/JXSwfLmUhgsPa7U+zHn8c1ovcOqrREPXc1+8XjrDGL//CCGHU+9nO
	deR9xSDOnDTomLJw0zPE86yOYLIo8NtB+oPrTP2uEWFldEPdkMyyOJoXUVR4BOiD
	Lx3gDR9j9ujaGBOpmSpwgrgSN7ROlL/E83GN3Gagx7PGOYpgeNvJ6YX3Y/A9GQJn
	rL6iiVZJOJ3ZqAMp7x46rpYbRbKztLH69S5kTxrMg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g4yd9deqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:04 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67LG5CvT029251
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4g2ejgcmvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:03 +0000 (GMT)
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67LGB2Es014592
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:02 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-51-128.vpn.oracle.com [10.154.51.128])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4g2ejgcmux-1;
	Fri, 21 Aug 2026 16:11:02 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v5 00/11] Add python, PCP support via libdtrace interfaces
Date: Fri, 21 Aug 2026 17:10:48 +0100
Message-ID: <20260821161100.41710-1-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX1YwGYkW4RnYd
 5lQFezkg6i9Yl/s8NaLZH9JHGzBCxQt1HEv17nsPcCKH23wR/d6QlenJS6MURvqVfItx6qQFe+G
 b/Svm1GponBclrN0k2uXknaAB2cyCdkEe28kD2ZsZzRqGsbAnskz
X-Proofpoint-GUID: Zua_GAgdQWq1bANvOevT8B6BriSd8Btb
X-Proofpoint-ORIG-GUID: Zua_GAgdQWq1bANvOevT8B6BriSd8Btb
X-Authority-Analysis: v=2.4 cv=fbCdDUQF c=1 sm=1 tr=0 ts=6a887898 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=BqU2WV_vvsyTyxaotp0D:22 a=Wa6Xp3zxepOylKXmTiAA:9 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfXxv5eKN2yCRRG
 FX0Saq2ve9NECSx1F4QgbqfC8Cl+584ndQ4VpoCHyuH3yWThJ2YuQxcW2N7C4F4e1Nc+urnLlPN
 wN+JPmm7+5hlHqoj85utuJ2RR+K7jPsHjVEFvAsmQxMsdUhIM/mZYREs+9+cVpWq/qezzmY3TfU
 bwH8I/ztF6BdbXppxzZqaJ+NPotnJ79ULa/JU5OehOg5rUzobtE2dvjDRLnfR+Y0jqK5smuWjFH
 5rZa2+wyWrQiiw+pGtnWIp2PH/EmzhhdotEBodjKjOF/xqduMnTW3f/bKgrBE+zV4xhmcbsy0dj
 RJFGNm/GjOuxxleYnCiPc+brA4AIaa0wEFc3aZNgaPsbfCmh80wwI+d1qaTcwzpuq9v9xAHLKXl
 cKil4+YIW4mcs0jgeMVW8I7PtRW/MIhi6e+LmLB0n8qjI/h8ITKbyLcnjCvk9G6rHaXtmktyuMC
 vvxkJjnjVQ1cSGJyoPw==

Having python bindings for libdtrace interfaces to compile, run
and collect information from DTrace programs is valuable because
it could help integration into metric collection frameworks like
PCP.  This series adds python bindings for DTrace (patch 5)
and provides tests for them (patch 8).  The support is
similar to what cmd/dtrace.c can do; compile a program,
enable probes, run it and collect data.  Support is also
added to grab or create processes as is done by
dtrace -p, -c options.  Aggregation snapshot walk is also
supported, with aggregation values filled out as raw values,
ints, lists of function names for stack keys and dicts for
quantized aggregations.

For detailed description/usage see the README in patch 4 and the
tests.

Patch 9 then provides a consumer of python support - a Performance
Co-Pilot (PCP) Performance Metric Data Agent (PMDA) which enables
flexible metric collection via DTrace scripts.  See the README.md
in patch 9 for more details.

In order to support an environment where we have multiple handles
per process, some prep work is required.  Patch 1 fixes some issues
with multiple handle use, while patch 2 improves sharing for
vmlinux BTF (and CTF generated from it if needed) which multiple
handles in a process image will benefit from.  The upper bound
of per-process handles is now limited by the maximum number of
BPF programs attachable to a uprobe which is 64 (BPF_TRACE_MAX_PROGS)
which is encountered with attaches to the BEGIN probe.

Patch 3 fixes an issue that surfaced during testing - we try to
load BTF for builtin modules when we have modules.builtin.ranges -
to avoid this we mark DTrace modules as builtin and have them
share vmlinux BTF.

Patch 4 provides libdtrace APIs to compute aggregation keys/values
rather than having the python bindings reach too deeply into the
implementation.

Patch 5 is the cpython bindings themselves; the README.md describes
their usage.  Patch 6 packages them and patches 7 and 8 facilitate
testing them.

Patch 9 then builds the PCP PMDA using the python bindings while
patch 10 packages them in a pcp-pmda-dtrace package.  Finally
patch 11 provides some basic testing in the absence of a full
PCP setup.

Changes since v4:

- Fixed issues in libdtrace with module.builtin.ranges (patch 3)
- Instead of sharing math header and doing aggr computations in
  the python code, provide libdtrace APIs to compute keys/values
  (patch 4)
- Fixed issues around python/pcp package dependencies (Kris,
  patches 6, 10)
- Fixed issues around pmdadtrace deleted/re-added stats (Kris,
  patch 5)
- Fixed dynamic PMDA number use in pmdadtrace.python (Kris,
  patch 9)
- Fixed session close issues for multi-session test (Kris,
  patch 8)
- Fixed support to allow multiple defines to be passed in
  (patch 5)
- Added tests for compile time/setopt options including defines
  and added an aggregation clear test to improve coverage
  (patch 8)
- Fixed up pmdadtrace to handle compile-time options properly
  (patch 9)

Changes since v3:

- Fixed up issues identified by Kris around custom BTF path (patch 2)
- Added PCP patches 8/9

Changes since v2:

- Fixed some handle lifetime issues and related potential segfaults
  in error paths (patch 4)
- Fixed up packaging to derive python package version from DTrace
  version (patch 5)

Changes since v1:

- Fixed multi-handle issues (patches 1/2)
- Improved aggregation representation of stacks, added stddev and
  *quantize representations (patch 4)


Alan Maguire (11):
  libdtrace: Support multiple DTrace handles per process
  libdtrace: share vmlinux BTF/CTF globally to support faster startup
  libdtrace: avoid BTF probes for ranged built-in modules
  libdtrace: Add aggregation key/value computation APIs
  python: Add cpython bindings for libdtrace
  dtrace.spec: add python bindings packaging
  runtest.sh: Prepare Python bindings for in-tree testing
  test: add tests for python bindings
  dtrace: Add a PCP PMDA to expose DTrace data as metrics
  dtrace.spec: Add PCP PMDA packaging pcp-pmda-dtrace
  test: Add a test for the PCP ManagedDTraceScript interface

 GNUmakefile                                   |    4 +
 Makecheck                                     |    3 +
 bindings/Build                                |   39 +
 bindings/python/README.md                     |  205 ++
 bindings/python/pyproject.toml                |    3 +
 bindings/python/setup.py                      |   67 +
 bindings/python/src/pydtrace_module.c         | 2057 +++++++++++++++++
 configure                                     |    7 +-
 dtrace.spec                                   |   88 +-
 libdtrace/dt_aggregate.c                      |  517 +++++
 libdtrace/dt_bpf.c                            |    6 +-
 libdtrace/dt_btf.c                            |  100 +-
 libdtrace/dt_btf.h                            |    1 +
 libdtrace/dt_impl.h                           |    6 +-
 libdtrace/dt_module.c                         |   20 +-
 libdtrace/dt_open.c                           |    5 +-
 libdtrace/dt_prov_dtrace.c                    |    6 +-
 libdtrace/dtrace.h                            |   83 +
 libdtrace/libdtrace.ver                       |    3 +
 pcp/Build                                     |   66 +
 pcp/Install                                   |   37 +
 pcp/README.md                                 |  343 +++
 pcp/Remove                                    |   26 +
 pcp/autostart/.gitkeep                        |    0
 pcp/dtrace.conf                               |   12 +
 pcp/examples/io_times.d                       |   28 +
 pcp/examples/io_times.json                    |    8 +
 pcp/examples/irq_times.d                      |   51 +
 pcp/examples/irq_times.json                   |    8 +
 pcp/examples/packet_drop_reasons.d            |   16 +
 pcp/examples/packet_drop_reasons.json         |    8 +
 pcp/examples/profile_kernel.d                 |   33 +
 pcp/examples/profile_kernel.json              |   11 +
 pcp/examples/syscall_counts.d                 |    8 +
 pcp/examples/syscall_counts.json              |    8 +
 pcp/pmdadtrace.1                              |  135 ++
 pcp/pmdadtrace.python                         | 1664 +++++++++++++
 runtest.sh                                    |    4 +
 test/unittest/python/test.x                   |   17 +
 test/unittest/python/tst.aggr-actions.sh      |  152 ++
 test/unittest/python/tst.aggr-change.sh       |   74 +
 test/unittest/python/tst.aggr-clear.sh        |   44 +
 test/unittest/python/tst.aggr-keys.sh         |   89 +
 test/unittest/python/tst.aggr-stack.sh        |   62 +
 test/unittest/python/tst.aggr.sh              |   58 +
 test/unittest/python/tst.compile-opts.sh      |   50 +
 test/unittest/python/tst.exit.sh              |   67 +
 test/unittest/python/tst.multi-session-end.sh |   89 +
 test/unittest/python/tst.multi-session.sh     |   62 +
 test/unittest/python/tst.pcp.sh               |   69 +
 test/unittest/python/tst.proc-create.sh       |   71 +
 test/unittest/python/tst.proc-exit.sh         |   57 +
 test/unittest/python/tst.proc-grab.sh         |   84 +
 test/unittest/python/tst.setopt.sh            |   30 +
 test/unittest/python/tst.work-error.sh        |   36 +
 55 files changed, 6778 insertions(+), 19 deletions(-)
 create mode 100644 bindings/Build
 create mode 100644 bindings/python/README.md
 create mode 100644 bindings/python/pyproject.toml
 create mode 100644 bindings/python/setup.py
 create mode 100644 bindings/python/src/pydtrace_module.c
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
 create mode 100755 test/unittest/python/tst.pcp.sh
 create mode 100755 test/unittest/python/tst.proc-create.sh
 create mode 100755 test/unittest/python/tst.proc-exit.sh
 create mode 100755 test/unittest/python/tst.proc-grab.sh
 create mode 100755 test/unittest/python/tst.setopt.sh
 create mode 100755 test/unittest/python/tst.work-error.sh

-- 
2.43.5

