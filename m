Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5562C3988F9
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784647497; cv=none; b=LZNkL2w3z8UNmo+rWyY+7/7/YqHM2RQxU3JD4WAnon+LWDIMZSrUN2vNRrWpbvJUHZ/y91FVl3n+apKJ8diDVoFlxKKzvVoXJooeRYl4nq/GMnw7sWqVJdnGC6FNu5gBrTFu3SuxGdl0yl9ClJuyrjGTNawYHLpTRz7W7S33h84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784647497; c=relaxed/simple;
	bh=qq3sf3BLnyat+uh4KKm7qeZmSIplInOu5h3OJ/Jai1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vh2S79Vi2m3H0yGphTZiXFMqEjB6rHYTVBShYeU2rjso8XEu5P5sv8I2qs6p2z0il4muT4V23rgKTDaWb6dUHlLi0DGCeyOzZpYnDaC19w4JE/j17rr7pf6824M9/IBznYm4oJa1KEZW0i4kM0y3lLPKuklJVAJAi1ELrnjSLDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oZo/ApXJ; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oZo/ApXJ"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LEe8RZ330441
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=8PW6kq2r5G8RIwP/6mmqlWM8zWlqR
	YXfpVxy/JA3RCM=; b=oZo/ApXJdcdNcF2Hfs858GhN4JQqsw/zgRinWI5mhz0qP
	YgTBlGf+G6CMNzHhBuNAKezAzwB55/j63GaliBc6Y9A9OgW5nt1d2yIOjv4K1A6n
	2D2HxU/TRc7JEgTgqZwdSrJIYYyk07RdDhpROvAZ1LOALF+oC6lXJHhuAl4IhGAM
	KEep23R9KAt/Iue0bq+qRJFBKHLzmZrqXUI516Ma+JTBmc28zaTb8wANH05RkW7h
	dMN2iyCfHe2zIzssaLJJ7RYwOnu3iN+7pzsSKQ+YfQvQeir/lDo7Lvgfr6grMdn/
	WwFzo37R7qgETQcYPjBWAAArAd62yzQBe3eOD39EA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4fg21q3nm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:24:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 66LFIk1t036379
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:24:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ffyxpw2ak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:24:54 +0000 (GMT)
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66LFOrpC020536
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:24:53 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-48-223.vpn.oracle.com [10.154.48.223])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4ffyxpw29w-1;
	Tue, 21 Jul 2026 15:24:53 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v3 0/7] Add python bindings for libdtrace interfaces
Date: Tue, 21 Jul 2026 16:24:44 +0100
Message-ID: <20260721152452.184842-1-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2MyBTYWx0ZWRfX8I1Qc3C8KbmP
 8dFwkZPSrwiQx5lA361FHN6l1xyEyQPl4OHyyCwzOvgNaqVY7E/wjvAyFqbraEMmSANV0bfOfiZ
 RndKsL3yZlK7Rg75UCibZpLkHzg+Hgwi1J32aYbPnvah/eY0Rtu+8riS6lpy3r1Aen62iGhM/7i
 abf+JjqNLnYY7yPwjcp1vZ9RTpgHWje1t8h5sRJHYnjSQVJB1+TVzNfORoV1WvfVVz4YbdAFdKn
 c4rR0whqr2HOcPm9vmPOE9vDRd4hPZg4t6RyuQMT+ja7c9rB57xHpRr4ntezV0vMHdRi77S4POO
 52OZ911+PTTlGjzfGY/BBwyWlMGgrlAhPW7g36RKzfBsM1V4EGtItJLVPeT1owIynXpC1CVL/Ki
 Bm+UfMccIIwD/OGmqD4nMqH1Jyjwu0nW14Upnz7h0ppdKnkxszaFvySpnukwnhpcaPuh46/9eCV
 7JJ+Ex+WDfZmCB72Qozk9t8Hkd2QGlOqTyvoZNJw=
X-Proofpoint-GUID: vHGcWAq-hfnfW76MCBzzAvqs-_6QrBdl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2MyBTYWx0ZWRfX8HQk4i5EcTMI
 f4BermbeqQN0KBrnXI7NQkoR36BKjXgd6UdWNty+ecZnY/sEUvcos5WZyGx3OsCoefiazPWlLqz
 372UNIuOAXN3B2VUde71x0vsKsRShtHdKzN4CRPSmtrr92jDYO4b
X-Authority-Analysis: v=2.4 cv=ALkdLnG8 c=1 sm=1 tr=0 ts=6a5f8f47 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=7Gl3-_t3PgB9XO-mQDs3:22 a=E6ctDJ_QUnxlkTKZDt8A:9 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12218
X-Proofpoint-ORIG-GUID: vHGcWAq-hfnfW76MCBzzAvqs-_6QrBdl

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

Changes since v2:

- Fixed some handle lifetime issues and related potential segfaults
  in error paths (patch 4)
- Fixed up packaging to derive python package version from DTrace
  version (patch 5)

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
 bindings/python/setup.py                  |   66 +
 bindings/python/src/pydtrace_module.c     | 1932 +++++++++++++++++++++
 configure                                 |    4 +-
 dtrace.spec                               |   29 +-
 libdtrace/dt_aggregate.c                  |    1 +
 libdtrace/dt_bpf.c                        |    6 +-
 libdtrace/dt_btf.c                        |   61 +-
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
 28 files changed, 3309 insertions(+), 356 deletions(-)
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

