Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567CF37C92F
	for <dtrace@lists.linux.dev>; Wed,  4 Mar 2026 08:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611291; cv=none; b=c13jVMW0N9ky97arsBANw9pwG+3PT3mg5UZzWnb0h7H1TexcK+6H5oqRmTGqAqECtuhs02oEf1OGe0x/I/DPawYy504oEI9ssIU3fFrW9gmAM+FR6f2jxxXucrJLRk+Urdc+NUhuAqG/R+PNmLGjKFkHJ2r3mPfU+hcJ43d7W50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611291; c=relaxed/simple;
	bh=oq4w0+Pw10JBIy1t5/1deHCcTEAtGbkVrCp3bAmZXmE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m3Vq7EQkbNVmMhGpV1SHx1LrIZPQWeEz+IFg2g6fvnWSHEfaExjZlVj93owcIP50UFEZ9PelywChit5ucPMg39CINolO6EstWZAUrWSRy05v3xGtWxmPru07ijfdAxkQqCvU/FxcFSfVa6AAEgafue3umNHzLreSBO7xVBHbbas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iak2rc/+; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iak2rc/+"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6247acRV3540336
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=IiuLDRgGl/mQ+ubaMKRBEb3fttqaA
	s/lFUCnXkcFa20=; b=iak2rc/+AEPNaxGmV6VHgMxgEQ+GpTaqrY99UDTtKFi9K
	d75adcQQ5nCgzhuFgJ8ykmBzRl28GyUpJgghXsocKx03sRYRS9LFCIIAK5OsaDZh
	XQA9tGqejuoCiUGh0e+fd+ivldcWYB/X4wqZ3vQNHYcrIPRog4wt/wa62k3Imc5L
	FM5OgYwAZepGNPkuXlZTgTHiYRNMo4iuUqqQcLwL6/h0295UlqoUpFciBghNPn2/
	vdRAri1gNglryGoKgnM7l6Pa0/ku6Ps0FGsJ6iS+X/LsIhdj/kc2CqQUVnwqUhuq
	c1EQc6HffHy0EyCJXsths155gUmiEEJBhTu4SSE/Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cpgge81ap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 08:01:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6246mOLj001370
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:01:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ckptfs2tw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 08:01:27 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62481RYX023337
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:01:27 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-62-133.vpn.oracle.com [10.154.62.133])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4ckptfs2t1-1;
	Wed, 04 Mar 2026 08:01:26 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v5 0/9] stapsdt provider: simple system-wide probing
Date: Wed,  4 Mar 2026 08:01:16 +0000
Message-ID: <20260304080125.649031-1-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=673 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603040063
X-Proofpoint-GUID: aUmM6e6b8ndm23FmsrQWq4vYJ1UPJF0w
X-Authority-Analysis: v=2.4 cv=YLSSCBGx c=1 sm=1 tr=0 ts=69a7e6d8 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=BqU2WV_vvsyTyxaotp0D:22 a=yd1v-jI48DuB1Fn-pHwA:9 cc=ntf awl=host:13812
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2MyBTYWx0ZWRfXy/Bw2Tfse6UD
 lu+PdCZeV/5N2Nn+nb8zPP7Ds3PeIP8ISJ8Fr86SeZIMMeQpqbYkV2JY4haMcwRM2VQ68NRvxiA
 27d5m4EEJ34RA944IFLBhCpAeGhzICKlF4vLx0Lsm10POAbBeOtt/Ab3JSoQpAAQJdgBVr6JpnT
 ZfkgXTRtQ9Ql7SklgE2GowPCqazyiE2/9D7qNH08YEZPvmdd41QpMZWyKNwFljwqs6HnyIw5kYE
 N3E74mY0nYQK7gNsYeqokYUMSYxVptCuoIMq2dc76qckcEtJgB0ub1r3Qq1Kqod2ZnfrsHeBt+9
 GZ0pk3Dtb30zUmWN4nhAjCt2vJXLnxEET2ss8dljhvERN3Mp4vEIo6qgSAYqSbTM0aYWkWRaOz9
 A4ITIeJeYaWLKgALXApA4MigyTElBmYtaf0VVymKa4IPyVvaojWjVsVX3ejXulDkBXSq8j2W8MT
 ohs+jmQefcqpLObDIptNKra2InVxHD3Ka6yb6nt0=
X-Proofpoint-ORIG-GUID: aUmM6e6b8ndm23FmsrQWq4vYJ1UPJF0w

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

Changes since v4:

- Restrict '/' to module names (Kris, patch 1)
- Name probes as provider0 rather than provider* (Kris, patch 2)
- Resync with devel branch

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
 libdtrace/dt_pid.c                            | 174 +++++++++---
 libdtrace/dt_prov_uprobe.c                    |  15 +-
 libdtrace/dt_subr.c                           |   6 +
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
 17 files changed, 1125 insertions(+), 51 deletions(-)
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

