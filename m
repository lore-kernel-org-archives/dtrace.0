Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957F921C165
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 21:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752184776; cv=none; b=a7kqVplFkddL5MjX4P0dStl9DrDAp6+Dv/mlBRtg3wxL+/te247QlDUBF9I0oUDQMQ8FvkqOCA49GGMyEAJCw/bli3vEMU/0Wv94Ag4lGsk06B4xfUFZvI1reIUyskD8WKtVtWidn55ZaU/csHMbbNIq8hQK8hHM6b/Bq0VMDYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752184776; c=relaxed/simple;
	bh=ZdvGPecJnv7Ns5gLl0dijNGjttlgxcfYh70OUFuksdM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ftKLakZDg8o5wMqVDwxEZqgjrcsvv/M3VU1kmtzzOhEnalxkwvo8K8v894XGuh5SsA06WluAhUbB8r+aVMBvNwWQVLeu/QuWc4G2cxVK2wx660SRZ9b85wp8+/MmU7N7ivdVcO/YKxhnVaGhRH14QAq2jcU9cx4TosxUaUdEH8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XGE7FfXc; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XGE7FfXc"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ALYs5a005496
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 21:59:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=gwFAhiT2W2H8SRMqhfTtMfFUHtRvK
	mmNBdeN4stASO0=; b=XGE7FfXcQ1N+VeevajoNjAXKma4YM3bNPg2SZp3NkfFZt
	RJaV7qiOpU8HCsdoL45VCle4UdRgc0vLY8rGgijrtlf/dl2ECYNa8odPObPaLYS/
	Yn2o1TdjLHjpgELQhoPghdVoC/75kijzeGOrcqWdHj3AIF9PFd4BEtTVHzldeRDd
	2o73AsnNWHvFLA3DyJz4CzRzhmBc8q6CTxPYUOkZ1aETNwTGnqpLFgY6YbeL/jXe
	L10Sg4a81np10e9D3ROupVLCk+44sPudLYpSS8Lvf738TzIlbIyDFLALK/NxDoaO
	KxsbFlBddu+kg2A8ywPA3WYh+YgY7CG6OHUNkA5KA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47tmq68486-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 21:59:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56ALZR7K013590
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 21:59:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ptgdmd8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 21:59:32 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56ALxVoB035912
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 21:59:31 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-49-108.vpn.oracle.com [10.154.49.108])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 47ptgdmd7y-1;
	Thu, 10 Jul 2025 21:59:31 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v5 0/6] add support for stapsdt probes
Date: Thu, 10 Jul 2025 22:59:24 +0100
Message-ID: <20250710215930.82067-1-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507100185
X-Authority-Analysis: v=2.4 cv=ZvHtK87G c=1 sm=1 tr=0 ts=687037c5 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=Wb1JkmetP80A:10 a=soS89ZaN0qLyo0Q28VAA:9 cc=ntf awl=host:13600
X-Proofpoint-GUID: h5jYdrhfyE7fuE7Ds_6iQELTgKQQmJ-A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDE4NSBTYWx0ZWRfXxwduTInCJgwv vStrc+cKIl7g3eydQWM07eACIxjIPerY0QSZzpYQQwNEujxj3geg5Ceedjay4KVOp0JNVRnYAIq QwCAHM/R+9RDdFFj5H8KDrZDl3o/XQkwOOQJfzfAi3O/0sgTzJrmQSASx0W9YHFg+knG0bM/KhJ
 f/nJqYDirHht4VTBrNLZUevNGW53wFGNQ0dh5Rz8Qc1WLUQxSIzlK+DVUdYuTuqAI6NBovzvsL2 iuyoGRbubEQBRyCFHZxRanOCwO7S1C2cO0xUoaGh9sohT1gLpmbd/cdz6XpNs4fJCjry8tqIUZR a23Ln4RPUfs0WQg5steoHl5sBnr6Xlk/KAD/AnhQMWhI6PWZykWecvB57K/0SVAnTxHME5QsOdm
 gkQIFflX5qwRXxFEriveivYrwPQM3hGUhFadj5H3IDwzHq4MZVz5elsQKQfuao6z+GsdzaxA
X-Proofpoint-ORIG-GUID: h5jYdrhfyE7fuE7Ds_6iQELTgKQQmJ-A

As well as using dtrace -G to generate USDT probes, programs and
libraries may have added static probes via stapsdt ELF notes.
This series adds support for such probes.  Patch 1 prepares for
this support by adding counting to parsing of stapsdt probe args
(since they do not include an explicit arg count); Patch 2 adds
the support, while patches 3-6 add tests covering that support.

Changes since v4:

- fix up address computation to work for libraries and -fPIE
  binaries; add a test for the latter (Kris, patches 2,6)
- do mapfile, Paddr_to_map() lookups once for stapsdt probes
  (Kris, patch 2)

Changes since v3:

- merged with USDT ELF note changes; since these use the same
argument-parsing/access code, no need to add code for this now (patch 2)
- updated said ELF note parsing to count as well as parse arguments
since stapsdt probes do not provide an arg count (patch 1)
- added explicit stapsdt provider to reflect that stapsdt probes
are fundamentally different and do not auto-register for discovery
via ioctl (patch 2, Kris)
- added simple pid wildcarding support for /proc map parsing.

Changes since v2:

- updated terminology to distinguish stapsdt from USDT probes

Alan Maguire (6):
  usdt: have copy_args() count args while parsing them
  support stapsdt ELF-note-defined static probes
  selftests/usdt: add test for stapsdt note-defined probe firing, args
  selftests/usdt: add test for stapsdt notes in shared library
  selftests/usdt: add test covering different forms of stapsdt note args
  selftests/usdt: add test for stapsdt note-defined probe firing in
    -fPIE binary

 include/dtrace/pid.h                         |   1 +
 libdtrace/dt_pid.c                           | 292 +++++++++++
 libdtrace/dt_prov_uprobe.c                   |  54 +-
 test/unittest/usdt/sdt_notes.h               | 504 +++++++++++++++++++
 test/unittest/usdt/tst.stapsdt-notes-args.r  |   2 +
 test/unittest/usdt/tst.stapsdt-notes-args.sh |  50 ++
 test/unittest/usdt/tst.stapsdt-notes-lib.r   |  14 +
 test/unittest/usdt/tst.stapsdt-notes-lib.sh  | 145 ++++++
 test/unittest/usdt/tst.stapsdt-notes-pie.sh  | 121 +++++
 test/unittest/usdt/tst.stapsdt-notes.r       |  14 +
 test/unittest/usdt/tst.stapsdt-notes.sh      | 121 +++++
 11 files changed, 1309 insertions(+), 9 deletions(-)
 create mode 100644 test/unittest/usdt/sdt_notes.h
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-args.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-args.sh
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-lib.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-lib.sh
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-pie.sh
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes.sh

-- 
2.43.5

