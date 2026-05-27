Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5607D18FDBD
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779907858; cv=none; b=OHhV8FUBoj3WWN4N71bzjPlj/EVJAFPHO6uIMmm50rfZkxQ9ZbbLxwN+fTL3tBDbWR5K+opns+nmRxLmRpevxhNogiDqDlLRWuPV6mxrDP3lcHnwrMBeNNvKUOXSrnYo3WY7z3+YRIi2IY/yOrL7BqYJDT5v7QQ1KO84nnGsTJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779907858; c=relaxed/simple;
	bh=SiFFaWBd7HyyKxpTgkRB1ofo2n0x+oh1aw7lKK0eFqA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S9eyWgu1uVI52AcitfZTUEtPfgiLjGnPEfmP7tt6lkHwfbGXfSzF1aGvs4HwTKONIGR8ZDDUkkbooqOlk34ma5ho1Sm5vaqTRT8Bfdo6L4z1WqtbOfV87cFHKzuiEwfEjLeDvgalfr2ulNKIEFi7xJnPYrsEBrWY9/L/0dn0qQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TQgfOYuJ; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TQgfOYuJ"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64REa8se3747326
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=ExV0VlNPoavKojfdjYAkcM8TvGwWQ
	TkkdEmh08BH8sc=; b=TQgfOYuJ1bcEc7KJ8cdOGuz9d2K7JdT1Bzgg94YGGAQyX
	lQq5D26teHjx84yNSJJxtwCs+XJ3Hf2b1lNhpl5UsG3xwkVG5iuJI3HqOS7J3sfG
	MIqVK7Z1DCVNaZGmNfDlwAW0bgDyTVCnz+dfc5zTIWfS8ZbJblnEufjn7VojoUtT
	nOJwE/07I04yUK0HRlhhKQRX/+C87dnxDOPJkHTX0JNNvxYKWJZC5D6yyMxlNMTy
	ys6EhMHvcpz4CapitEvfxGm7jjguLp2HXHH7oL1PHZWU/q9DryYpEFNtNivdQvCI
	5p0+hTTaUZLDaucSGGzL7CyDSVKtFV65uet1YYxOQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4eb495p1qf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:50:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 64RIodLH031462
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:50:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4edjse4t4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:50:55 +0000 (GMT)
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64RIomgU033024
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:50:48 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-48-144.vpn.oracle.com [10.154.48.144])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4edjse4sc8-1;
	Wed, 27 May 2026 18:50:47 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2 0/7] Add python bindings for libdtrace interfaces
Date: Wed, 27 May 2026 19:49:56 +0100
Message-ID: <20260527185004.2267741-1-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2605130000 definitions=main-2605270189
X-Proofpoint-GUID: P2e9bi_nVYfKmPfDndIn2X6XaE6OGnx-
X-Proofpoint-ORIG-GUID: P2e9bi_nVYfKmPfDndIn2X6XaE6OGnx-
X-Authority-Analysis: v=2.4 cv=Ld8MLDfi c=1 sm=1 tr=0 ts=6a173d10 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=o5oIOnhZENCTenyL_yNV:22 a=E6ctDJ_QUnxlkTKZDt8A:9 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13706
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDE4OSBTYWx0ZWRfX/MyOURqJwfai
 gEB4DrGN7WUvvUWcwZeWpsx7rBvRtTSkUsdKbBtIpkYap0Yg5kv/jvipKv6eXnFTfCz6pfxsj1T
 Gf0MAwFOOgTocbGEm5LYd9bN8I/ZEQHP7ICpkcUSdmp/34KeXv//khew0vykQdHMS5pc/77AAlq
 VniKGl2cPE9fN4nlz3WMhHtQThru8sfRQoTdDCtf2aH+ude5ZZ3+CI5tOaYxXp+nDIvZIlwPp0d
 A4VmMSQ+vYceuDbBO8v9HCKz4ttk3ByadkBPfnfI/B/2ALEQPHTrNi8hX+zbaCapnEzSnR7Ex3H
 FB/EDBBIDkImHQaNvZG6S6I4NlCg6p82mrGX0nc/pO7P0usEhg0Bpx8jElYa1a4IkoyWQH4ZeDN
 +HSlwjPWwSsQfgEzBDWWnrwrsFmn6ecHoPA+zCjT9VolGO6j55rWbZR1rmFZGPIrWLiU4PRuBup
 JMNyDVEOdYms1GrzlC7Lwft+nHWsXP4bzf92eRGQ=

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

Changes since v1:

- Fixed multi-handle issues (patches 1/2)
- Improved aggregation representation of stacks, added stddev and
  *quantize representations (patch 4)
- Expanded tests to cover multi-handle, aggregation value validation
  (patch 7)

Alan Maguire (7):
  libdtrace: Support multiple DTrace handles per process
  libdtrace: share vmlinux BTF/CTF globally to support faster startup
  libdtrace: Refactor math functions into dt_math.h
  python: Add cpython bindings for libdtrace
  dtrace.spec: add python bindings packaging
  runtest.sh: Export PYTHONPATH when running tests in-tree
  test: add tests for python bindings

 GNUmakefile                               |    2 +
 bindings/Build                            |   35 +
 bindings/python/README.md                 |  167 ++
 bindings/python/pyproject.toml            |    3 +
 bindings/python/setup.py                  |   52 +
 bindings/python/src/pydtrace_module.c     | 1887 +++++++++++++++++++++
 configure                                 |    4 +-
 dtrace.spec                               |   29 +-
 libdtrace/dt_aggregate.c                  |    1 +
 libdtrace/dt_bpf.c                        |    6 +-
 libdtrace/dt_btf.c                        |   57 +-
 libdtrace/dt_btf.h                        |    1 +
 libdtrace/dt_consume.c                    |  340 +---
 libdtrace/dt_impl.h                       |    3 +-
 libdtrace/dt_math.h                       |  358 ++++
 libdtrace/dt_open.c                       |    5 +-
 libdtrace/dt_printf.c                     |    1 +
 libdtrace/dt_prov_dtrace.c                |    6 +-
 runtest.sh                                |    2 +
 test/unittest/python/tst.aggr-actions.sh  |  133 ++
 test/unittest/python/tst.aggr-change.sh   |   75 +
 test/unittest/python/tst.aggr-stack.sh    |   61 +
 test/unittest/python/tst.aggr.sh          |   58 +
 test/unittest/python/tst.exit.sh          |   64 +
 test/unittest/python/tst.multi-session.sh |   58 +
 test/unittest/python/tst.proc-create.sh   |   56 +
 test/unittest/python/tst.proc-exit.sh     |   57 +
 test/unittest/python/tst.proc-grab.sh     |   81 +
 28 files changed, 3246 insertions(+), 356 deletions(-)
 create mode 100644 bindings/Build
 create mode 100644 bindings/python/README.md
 create mode 100644 bindings/python/pyproject.toml
 create mode 100644 bindings/python/setup.py
 create mode 100644 bindings/python/src/pydtrace_module.c
 create mode 100644 libdtrace/dt_math.h
 create mode 100755 test/unittest/python/tst.aggr-actions.sh
 create mode 100755 test/unittest/python/tst.aggr-change.sh
 create mode 100755 test/unittest/python/tst.aggr-stack.sh
 create mode 100755 test/unittest/python/tst.aggr.sh
 create mode 100755 test/unittest/python/tst.exit.sh
 create mode 100755 test/unittest/python/tst.multi-session.sh
 create mode 100755 test/unittest/python/tst.proc-create.sh
 create mode 100755 test/unittest/python/tst.proc-exit.sh
 create mode 100755 test/unittest/python/tst.proc-grab.sh

-- 
2.43.5

