Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9432A37C10D
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768832607; cv=none; b=tDg9+/1NDNuyAzvkHkeAY/yhBJQyvbq0Gj7brtBRijfx6PBPtMOzQKVBXAhfw5PQE6WUo5xkhbzWwRsvhVgm7dM8g2uXZp38dV+qtruI6rLnBtafGVnrtuuk+zrHq9DRIh0PyBKZtU5+jBMMqPnG4BDUfhsiXQvlfp9Ft8n7+VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768832607; c=relaxed/simple;
	bh=W+MQr+PGfdjszxBLlEKpvm0VaEc3Xpu5+W0DJle6jQU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mQeXqbOZGV9rY2qR0U5m16QqDE1IM5/g05Zi3fo2obYDeDPl5nOFNtxo/78IssuSRJ55oJOaGJQqCLAevysPq7SMiAMPda93mX9xflxIQHczq/EHIWOp55kzDQQjWONjnD3W1kf3GPQCRrqGK97J4saSDRW8iWwvdn081bZ0FzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=H13hdtqi; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="H13hdtqi"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JBDU5X1341867
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=VhUEvc95Kll10CMZaL9F2ijwcKa6u
	0yzZvgcD4jZ4+4=; b=H13hdtqiEOsPQJjyqC6HW476/upsaM0cfUYDQkPnoygHG
	TdO3c6kaBPh80Zw3Fog+dTfklwq8Uvj2Bgc3RTSuiFIB+ZjLSgXlENQZQ5+knNKZ
	1bTzBHoVqLNBoPwbrmvd1B82+LVWGjmUHgE2GdZLieGj2pwVWKgoJVI3NjzOy/dA
	k87TPggu+fwOUmKKK1lI0cCOa3w3wWI5gW2gscnoCTrjQ5r8Bk6kJxRuXVUV0Ta9
	V8uGB9Qhy4aFZmzZpaw7EzuL0Vw+xwBUgd/ZzIdTQdBmakCe3KEdVX5Scf/CMf9j
	bRnP1Eu8Y0Ut1YY6ysnM0DvdBBV7pIzeZi/Zdpbyw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4br170acun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60JD3IW1022445
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4br0vc6yqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:23 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60JEIDjU015145
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:22 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-51-213.vpn.oracle.com [10.154.51.213])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4br0vc6ye3-1;
	Mon, 19 Jan 2026 14:23:21 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v4 0/9] stapsdt provider: simple system-wide probing
Date: Mon, 19 Jan 2026 14:22:51 +0000
Message-ID: <20260119142300.975014-1-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=720 mlxscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601190120
X-Proofpoint-ORIG-GUID: T1A9_PmaPUcmNHv2zUjcXIvp3zFoPND6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEyMCBTYWx0ZWRfX35LDQX83lGa1
 7KCA0xtpj65ZWEHuwby93QOE3TmfU+XTHHxTApp4FMUtKvaOIHKdqk26S8piXAxVdzrVaOVMOjX
 YloCiEuTyAlPvv33wOJ36ZVGV5RF3M5f/7BkVrZ41hYoEQirXONPFX8X06vSqi55VhGGVoqVsyS
 M7yhM2asdPyd8e/1mnGY8D13WpoHEOnvgbAIJSmBmjR5TDaWOemYGZAmgNfH/WE8kw/0nRUTznH
 HQw8PE+UxR2MSStvWSQ6QJ6Clk3u5Wmjmt5dM0cuXoaHHDTl1LsW+0pEOCaUevgjl18M4RJcuhD
 z/HQgMF51zLDhutQ9qCwOt+1PuRCvAgCosYK6T8sxBERoSwoETG9RR1uaIh8aTSOKOIA+X7xGrN
 r0Z8kz8NgBgC1olho7nzdZI2qU0zmxdrnf9UcSeEi9izN8HLa9b0nnpg/8JXxZi3bRkIiygSeJH
 sURn/h/JMK9byKDKPX5xv6o83ZmTQyrhSl5LuH34=
X-Proofpoint-GUID: T1A9_PmaPUcmNHv2zUjcXIvp3zFoPND6
X-Authority-Analysis: v=2.4 cv=FvoIPmrq c=1 sm=1 tr=0 ts=696e3e5c b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=BDVDvJwvZC1jpQH69wEA:9 cc=ntf
 awl=host:12109

This series adds wildcard support to stapsdt probes to allow
tracing system-wide; this has caveats due to the way the kernel
implements probe addition.  In essence, probes are added on a
per-inode basis (actually in the VMA associated with the inode)
so it is necessary to identify the file where probes are found.
Probes will fire for existing and new processes (the RFC incorrectly
said they will not work for existing binaries; they in fact do).

Patch 2 describes the approach; to facilitate systemwide tracing
we need to tell DTrace the name of the binary/library via either
using module absolute path (patch 1 updates parsing to support use
of a '/' in a module descriptor to faciliate this support) or an
module name; to expand this we then use [LD_LIBRARY_]PATH
to resolve the full path.  ELF reading of the file and insertion
of probes then proceeds in a similar manner to per-pid tracing.

Patches 3-8 test various aspects of systemwide probes; basic
binary support, library support, listing support and is-enabled
probes support, and use of absolute paths.

Tests ensure wildcards work for

1. a process started prior to DTrace
2. a process started by DTrace (-c)
3. two processes started after DTrace is running
   (via system())

Patch 9 updates docs to describe stapsdt wildcard support.

Changes since v3:

- Semaphores need to be more carefully declared to handle
  the is-enabled case where the process is not running when
  DTrace starts tracing; the kernel handles reference counts
  so the probes must be added to the ".probes" section; see
  patches 8/9 for how this is done.
- Modified tests to start an instance of the test program
  prior to DTrace execution and start two further during
  DTrace execution; ensure we see probe firings for all
  4 of these processes before declaring success (Kris,
  patches 3, 4, 5, 8)

Changes since v2:

- support absolute paths (patch 1, 2)
- add tests for absolute paths (patch 4, 7)
- document systemwide probe support for listing/using absolute
  paths (patch 9)

Changes since RFC:

- update documentation/commit messages to reflect that we also
  catch existing programs/libraries when probes are enabled
- fixup provider name for wildcard probes to be 'provider*'
  rather than using the confusing 'provider-1' since the
  latter is the concatenation of probename and pid (-1 is
  used to connote all pids)
- add test for is-enabled systemwide probes


*** BLURB HERE ***

Alan Maguire (9):
  dt_lex: support '/' in probe descriptors
  stapsdt provider: support systemwide probing
  test: add systemwide stapsdt note test
  test: add systemwide stapsdt note test using absolute path
  test: add systemwide stapsdt note test for library
  stapsdt: add test for listing systemwide probes in object
  stapsdt: add test for listing systemwide probes in absolute path
    object
  stapsdt: add systemwide test for is-enabled probes
  documentation: update stapsdt docs to describe wildcard support

 .../reference/dtrace_providers_stapsdt.md     |  91 +++++-
 libdtrace/dt_lex.l                            |   2 +-
 libdtrace/dt_pid.c                            | 177 +++++++++---
 libdtrace/dt_prov_uprobe.c                    |  17 +-
 .../tst.stapsdt-notes-systemwide-abspath.r    |   5 +
 .../tst.stapsdt-notes-systemwide-abspath.sh   |  89 ++++++
 .../tst.stapsdt-notes-systemwide-isenabled.r  |  13 +
 .../tst.stapsdt-notes-systemwide-isenabled.sh | 266 ++++++++++++++++++
 .../tst.stapsdt-notes-systemwide-l-abspath.sh |  48 ++++
 .../usdt/tst.stapsdt-notes-systemwide-l.sh    |  48 ++++
 .../usdt/tst.stapsdt-notes-systemwide-lib.r   |  14 +
 .../usdt/tst.stapsdt-notes-systemwide-lib.sh  | 215 ++++++++++++++
 ...tst.stapsdt-notes-systemwide-lv-abspath.sh |  48 ++++
 .../usdt/tst.stapsdt-notes-systemwide-lv.sh   |  48 ++++
 .../usdt/tst.stapsdt-notes-systemwide.r       |   5 +
 .../usdt/tst.stapsdt-notes-systemwide.sh      |  89 ++++++
 16 files changed, 1123 insertions(+), 52 deletions(-)
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide-abspath.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-abspath.sh
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide-isenabled.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-isenabled.sh
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-l-abspath.sh
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-l.sh
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide-lib.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-lib.sh
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-lv-abspath.sh
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-lv.sh
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide.sh

-- 
2.43.5

