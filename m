Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4392834D91F
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323098; cv=none; b=sbbnq2A//XOshaeBN7p4P2asE/idW/WbNhGZbeor5qsEjGgUr49o34mJrOyZO9OyumW2YXbQmbA0KYnPl8vXZkreO6K5O9YFvmDjg3OO8Pb5tFoKRryQ9z4rHgVOMtwZbFRG4arYDRbWpA4Hv4h6PsAFEvV7cQMLcnOQ1QJeAbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323098; c=relaxed/simple;
	bh=5ABX2MWMxYoAIESo/Yxt7eQTRRzd69QVzfIwDBD1jI8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uPeOA+OzCdPqmW/S0U6NgQIHogxWLGpLXfimgF0yT4QKTTevLNPqfGq9Cq1yKklZMzVBHQBdOzlxu+PqvUlcBDC1WEqwGeCQotMvISKgo+MTakE8Vv59Zt1oF71TU5MbGoqTAY9ySGtwcw54Tkfya3lfUAdPoa9mGrnGmd7YcEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jIcqn71k; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jIcqn71k"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DFxWZo2682127
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=6hMk31lYKH9ClaGFw6Gc+XpQqLwch
	M2nnRtMe0IAx0A=; b=jIcqn71ko5RPhzJIknqB2cbsIFbAVXOx1bnQGlm46e7Mw
	nHzrWs0gabuFmSrtGFWJ3q+Mwd982F+sB/THXGNiqgSkmcE8DnXIs4D8wfnheJtv
	WVEhuq5FyVHgjZxU/KRFdNWKPan/9wphSfyHNSwss3FXTZq/5JOEsrKHVBdxKJ2V
	sRAqDYrysVxh6L4So+fOHfQfvsgiJLZqXe9W5OG+BpaJwy4p8xBDDliH5EnJQE1F
	lOhWL2P1DAjeSG23d1l2bffjSSlbGz/l89ABrWjv4hZqhqlxabIpmsN1Hdp/Ihd0
	P1Clq6wU73uoUKrn3bogaiwyylZgQ8weDQdNeqUkg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkntb3tp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60DGRYDq003921
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd78xjqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:34 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60DGpYAw031305
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:34 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-50-89.vpn.oracle.com [10.154.50.89])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4bkd78xjpd-1;
	Tue, 13 Jan 2026 16:51:34 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v3 0/9] stapsdt provider: simple system-wide probing
Date: Tue, 13 Jan 2026 16:51:23 +0000
Message-ID: <20260113165132.2454591-1-alan.maguire@oracle.com>
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
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 mlxlogscore=406 adultscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601130140
X-Proofpoint-GUID: E4hjq9ciQQXKoB7cMNWErbh9TRsQPN8S
X-Proofpoint-ORIG-GUID: E4hjq9ciQQXKoB7cMNWErbh9TRsQPN8S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX58Eeh12JfGI6
 BIBfplvNGU3FIU2NpHlUHIeaLuR5x2iXnnUGvO5sMP4EPdaxouJkjKLn9RHzqAHPMQ0ZQFBkUvE
 gXr7Xla3FGylvV762jBLTL64DZrBHno+445AoPeONGuotNU4TFOS72HsLLWS0bFszuC3ex9cxud
 f49XydzeX6vIW+BaQ0go4I7swReIc0C0gVYe9NuWhs0RDTVMAg+/7Nb1OZp+onwS6KcaTzAhLvL
 MRVdGDXsqq0SgeYltqAe5Z0Osin3IYRqR9rUsJILCmjkzLNM5cCGJI033yvl5oWnCD4B2A6j6zh
 24cSnVUDQbT7f6YM17uQQ9waMF/E5jVz+d3JXymDCxCeIVRqM7jzTfTO1g3Z3fGNDF1yeaXLizA
 a5EAACPDRkvMyRvuLNfhlZEsLsEKSEDsS/K2Rwd0F89THt6xDNck8jzdBxSMSF6Z4+FBIExI2cq
 ExoRNFvth8duRx3VjwQ==
X-Authority-Analysis: v=2.4 cv=fIc0HJae c=1 sm=1 tr=0 ts=69667817 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=LP9uwuJrBvOb0ndDvXwA:9

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

Patch 9 updates docs to describe stapsdt wildcard support.

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

 .../reference/dtrace_providers_stapsdt.md     |  54 +++++-
 libdtrace/dt_lex.l                            |   2 +-
 libdtrace/dt_pid.c                            | 177 ++++++++++++++----
 libdtrace/dt_prov_uprobe.c                    |  17 +-
 .../tst.stapsdt-notes-systemwide-abspath.r    |   2 +
 .../tst.stapsdt-notes-systemwide-abspath.sh   |  51 +++++
 .../tst.stapsdt-notes-systemwide-isenabled.r  |  13 ++
 .../tst.stapsdt-notes-systemwide-isenabled.sh | 177 ++++++++++++++++++
 .../tst.stapsdt-notes-systemwide-l-abspath.sh |  48 +++++
 .../usdt/tst.stapsdt-notes-systemwide-l.sh    |  48 +++++
 .../usdt/tst.stapsdt-notes-systemwide-lib.r   |  14 ++
 .../usdt/tst.stapsdt-notes-systemwide-lib.sh  | 142 ++++++++++++++
 ...tst.stapsdt-notes-systemwide-lv-abspath.sh |  48 +++++
 .../usdt/tst.stapsdt-notes-systemwide-lv.sh   |  48 +++++
 .../usdt/tst.stapsdt-notes-systemwide.r       |   2 +
 .../usdt/tst.stapsdt-notes-systemwide.sh      |  51 +++++
 16 files changed, 845 insertions(+), 49 deletions(-)
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

