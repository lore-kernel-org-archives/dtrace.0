Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61DD32F764
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786540938; cv=none; b=n3aQALTBOxcYthiAW02qOYKH7Kfci9pKAXAbLCGVzUookLb7lDTFm1MY9ghDJrl9Ewjio5OiElMN1d6bY1Es9gUKU1QdMtSmWTCttwcmI9f/yooW3gibNq6ROOv3UDVlOrR3jDtiiWzBfO70k/QHf6nyDF0zNQVOiDabXEpGJr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786540938; c=relaxed/simple;
	bh=kot62J7WIMdiRABb4ckDhJoHuWGLb1WDgS2l63aTdx4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I14RHIEVgs3Wspqd8wNoUfrsAfnJ8g1cDImFAV4hIiuZCW+HNirnogprlyalIvPBpjQ6smXg/CqNb3oGbWT/P9XPVwzdQBy6wDSRKVqMyyqiVW/co5Lzb2yZe3VWRXgCTRjRttaJyf5pUTQynYDO9E8Hxl+Clx6XwrCIAsabpFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mO7mytIz; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mO7mytIz"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C3aBf4147247
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=UKo1c771+raccfhQ4ecnY6S4FKRgK
	alWdzgQcFzLhmk=; b=mO7mytIzd1GF5zavjk0eY68lqYP6cMJ1IQMQ1zwIqT0b/
	Mlm4YwrW4viuLIXJpu0Trv6QY2q74357Xf+BT8gcZcX4o8QdGDuNxpXxkiFaLhVg
	WBVFV4J2hZOkSnQ/hzRGo/GEGAPWdeE2z+5GvxsYStdPK6oLN3iXY3u5xUWRO20c
	jCq6Kvys+0Koj/JyL4lwGgtPcCTvez1qQlobbXwTk8shetzDyxuzBByMcSqphNcK
	SHC93WkeQPWeM043rnxWMYljxhLm8YnOP1UjgkPBmInhQ7vStrFE6j0z5V6y4kBt
	ZzC8Rfq+U6AjO3lUFCzdHbJtr/O7JI3hB0fj0Rdew==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4fwvesxr5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67CDKdWV002231
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4fwtwsse2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:14 +0000 (GMT)
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67CDMEBc010792
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:14 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-57-125.vpn.oracle.com [10.154.57.125])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4fwtwsse20-1;
	Wed, 12 Aug 2026 13:22:13 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v4 0/9] Add python, PCP support via libdtrace interfaces
Date: Wed, 12 Aug 2026 14:22:01 +0100
Message-ID: <20260812132212.527871-1-alan.maguire@oracle.com>
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
 definitions=2026-08-12_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608120109
X-Authority-Analysis: v=2.4 cv=R8wz39RX c=1 sm=1 tr=0 ts=6a7c7387 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=QugR1suX0Guz043_SfgA:9 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13509
X-Proofpoint-GUID: Un1mKDy7NAIG1QouWnz13zPPtsshZocH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEwOSBTYWx0ZWRfXz7D/af+AK/V+
 zq6GO4Hh+11BmNfca/FhjBHwTUeGfmE0a1B4NNTaKLLaNrTFMA8kUg3ajxKODSKgNchCUPAVeku
 +BRYdc+TyIsDS4U6Eo1v4xtWvkURpbkh71z6pbpjcbK/VaISMeRa16WbwiPsQ1+tQ38+ZxlNx1f
 UIsNqR8WbiCYOj2+4Vn7dgpK5DjxnD9lEVj1ATL29ssZTWFKPlW2/o22ZjbiZI/Kc520C2kowCO
 xPAxyAIdYuIKpsGXN3fx96sQx7r3hHwmwSXtaTLSbDDNPbonGAUC6Gh9B9FB2eILGlrFs+WY01/
 XOQ6D5PB841eiXwvLyB9BcJLj0rHHaK7ZXcnyRoilioFg/SsEHC5CxnJZzRyMLiOtdd/VzJ8l3X
 Q/dDkRqYnLMP6u90U0PHgbqBlzx1FzxBzOzgTpuZvnZ9GBPEYYLKAAO3yR9Z7xVkIfrVLMGkLUZ
 rEG+gkzTi6CykuNq7nEyMrhV3HTmk5cfy0wxG3P4=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEwOSBTYWx0ZWRfX8nFBu6tQnMe3
 ooqDN8MaUUmCvLku+XNl/bqICtine16DpEE7HnA3ECK6eljSvGbE9BIe+vhAPfW7zU2v/m78mgc
 e1hVfCXQipZ5DTzBbh4xomSU898+oC3ak3UthjDcx7/RAZlpdjpq
X-Proofpoint-ORIG-GUID: Un1mKDy7NAIG1QouWnz13zPPtsshZocH

Having python bindings for libdtrace interfaces to compile, run
and collect information from DTrace programs is valuable because
it could help integration into metric collection frameworks like
PCP.  This series adds python bindings for DTrace (patch 4)
and provides tests for them (patch 7).  The support is
similar to what cmd/dtrace.c can do; compile a program,
enable probes, run it and collect data.  Support is also
added to grab or create processes as is done by
dtrace -p, -c options.  Aggregation snapshot walk is also
supported, with aggregation values filled out as raw values,
ints, lists of function names for stack keys and dicts for
quantized aggregations.

For detailed description/usage see the README in patch 4 and the
tests.

Patch 8 then provides a consumer of python support - a Performance
Co-Pilot (PCP) Performance Metric Data Agent (PMDA) which enables
flexible metric collection via DTrace scripts.  See the README.md
in patch 8 for more details.

In order to support an environment where we have multiple handles
per process, some prep work is required.  Patch 1 fixes some issues
with multiple handle use, while patch 2 improves sharing for
vmlinux BTF (and CTF generated from it if needed) which multiple
handles in a process image will benefit from.  The upper bound
of per-process handles is now limited by the maximum number of
BPF programs attachable to a uprobe which is 64 (BPF_TRACE_MAX_PROGS)
which is encountered with attaches to the BEGIN probe.

Patch 3 makes available some of the functions used in calculating
stddev() values which is useful for the python bindings since they
do not use the print callbacks to do this.

Patch 4 is the cpython bindings themselves; the README.md describes
their usage.  Patch 5 packages them and patches 6 and 7 facilitate
testing them.

Patch 8 then builds the PCP PMDA using the python bindings while
patch 9 packages them in a pcp-pmda-dtrace package.

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

Alan Maguire (9):
  libdtrace: Support multiple DTrace handles per process
  libdtrace: share vmlinux BTF/CTF globally to support faster startup
  libdtrace: Refactor math functions into dt_math.h
  python: Add cpython bindings for libdtrace
  dtrace.spec: add python bindings packaging
  runtest.sh: Export PYTHONPATH when running tests in-tree
  test: add tests for python bindings
  dtrace: Add a PCP PMDA to expose DTrace data as metrics
  dtrace.spec: Add optional PCP PMDA packaging pcp-pmda-dtrace

 GNUmakefile                                   |    2 +
 bindings/Build                                |   35 +
 bindings/python/README.md                     |  167 ++
 bindings/python/pyproject.toml                |    3 +
 bindings/python/setup.py                      |   67 +
 bindings/python/src/pydtrace_module.c         | 1997 +++++++++++++++++
 configure                                     |    4 +-
 dtrace.spec                                   |   58 +-
 libdtrace/dt_aggregate.c                      |    1 +
 libdtrace/dt_bpf.c                            |    6 +-
 libdtrace/dt_btf.c                            |   79 +-
 libdtrace/dt_btf.h                            |    1 +
 libdtrace/dt_consume.c                        |  340 +--
 libdtrace/dt_impl.h                           |    7 +-
 libdtrace/dt_math.h                           |  358 +++
 libdtrace/dt_open.c                           |    5 +-
 libdtrace/dt_printf.c                         |    1 +
 libdtrace/dt_prov_dtrace.c                    |    6 +-
 pcp/Build                                     |   56 +
 pcp/Install                                   |   37 +
 pcp/README.md                                 |  260 +++
 pcp/Remove                                    |   27 +
 pcp/autostart.d/.gitkeep                      |    0
 pcp/dtrace.conf                               |   12 +
 pcp/examples/packet_drop_reasons.d            |   14 +
 pcp/examples/packet_drop_reasons.json         |    8 +
 pcp/examples/syscall_counts.d                 |   11 +
 pcp/examples/syscall_counts.json              |    8 +
 pcp/pmdadtrace.python                         | 1232 ++++++++++
 runtest.sh                                    |    2 +
 test/unittest/python/tst.aggr-actions.sh      |  133 ++
 test/unittest/python/tst.aggr-change.sh       |   75 +
 test/unittest/python/tst.aggr-stack.sh        |   61 +
 test/unittest/python/tst.aggr.sh              |   58 +
 test/unittest/python/tst.exit.sh              |   64 +
 test/unittest/python/tst.multi-session-end.sh |   75 +
 test/unittest/python/tst.multi-session.sh     |   58 +
 test/unittest/python/tst.proc-create.sh       |   56 +
 test/unittest/python/tst.proc-exit.sh         |   57 +
 test/unittest/python/tst.proc-grab.sh         |   81 +
 40 files changed, 5165 insertions(+), 357 deletions(-)
 create mode 100644 bindings/Build
 create mode 100644 bindings/python/README.md
 create mode 100644 bindings/python/pyproject.toml
 create mode 100644 bindings/python/setup.py
 create mode 100644 bindings/python/src/pydtrace_module.c
 create mode 100644 libdtrace/dt_math.h
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

-- 
2.43.5

