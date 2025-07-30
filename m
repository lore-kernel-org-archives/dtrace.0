Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889333C38
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753866119; cv=none; b=DKtLXI/zR4z3pxEtXDWcP4f0mh4S6ZQbAUhG9EhYFiYW/hl9+X6H/ZFKkpPVBbcGlWKgeXf/f0l9Y9oYeUWUywc+qx2hZFjsiHpgFu4tIqSpE8PSR4Ivi+WB+GMFlYvRdLM+NouLroFnDMZL3sUN331LMcwl4F3YmYgaHkqqSgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753866119; c=relaxed/simple;
	bh=F7itzaSfszm/BQbmcXmJK/6vU6hREI/JuBu0V0J7RaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sf+ykD/3M+QwURfuf/p5lDftXFJcKkNbPA/M82WvMDtWt/VlGyvPuR1K65K8chhCRGM8RNl4Jg3CCYt9AKF41h9+LyQcWIm8WFgIEU3y6+O8T0fFjh0hkppWLoFFTxj3BXgbJO81jWNtgt0KNYAwzXJtTiu1NKmuZVIQKzAQXEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CUXelA10; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CUXelA10"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U7g9lv012434
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=R3ghxGuJGMExeUzt2F+WnNVEUB1y2
	sCYrjeNOZ0+aFM=; b=CUXelA10joNS+tl0dl/nxbfWyemHVnh6HEEU2NZRd5iXC
	wtrbc9LY2mmRx69WHkuMXTcv16pS1PZPv4J628oGzKE3x5NsvFThmnEZBna+iJZz
	PrsP8+otFeEs7yy3kvEYu6RJC/Zk7RMkjsx/knS49jqK8TYVI709c8aUhXjU3Iu/
	2UVFCCrvz/HNCAskclSY2kuEzefzcm2EtWW2tBT3PIA5oUTksAQwp/8vxOx+DHmI
	R3Bkf68kN/MIUZj3g3M4zNtbtVJcoONdAbTqbOd5/smArIu/uz0dD8vDqlkduWbG
	C2eqjZt628S1m8/sM8TaecZFQRV3C4L1iw/xhk8cA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484qjwsfxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:01:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56U8BDbi038712
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:01:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 484nfapvby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:01:50 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56U91nId033990
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:01:50 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-51-28.vpn.oracle.com [10.154.51.28])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 484nfapvax-1;
	Wed, 30 Jul 2025 09:01:49 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v7 0/7] add support for stapsdt probes
Date: Wed, 30 Jul 2025 10:01:41 +0100
Message-ID: <20250730090148.2141954-1-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_03,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507300062
X-Authority-Analysis: v=2.4 cv=OvdPyz/t c=1 sm=1 tr=0 ts=6889df7f cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=Wb1JkmetP80A:10 a=06CfEAHARNktU8VKROQA:9
X-Proofpoint-GUID: W_arNxnALhZk-UbP5I9B8vC5kn2Xf2yC
X-Proofpoint-ORIG-GUID: W_arNxnALhZk-UbP5I9B8vC5kn2Xf2yC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA2MyBTYWx0ZWRfXy3R9D8BZH+1n
 ujn4SzsNNppyC4mLqMm+PkTOE3nKMtA2D6mzujmv87mAa8AG8XNGa4/HsT1+BoCWAizad+WdzVg
 Iu8N9Gj8+FD+ZPiKB6X4bxWzOBcAptPN9cDj38Mov0ZlPKsMP57vpHzgNkivSLI8SHceAt7yj4W
 VKZmEkuGQqlMEnsCOhF6mZZqNH5aQVrsLs3DXgmzj3i8u54caG+3TcWI5pB/9Zp8vt27QKZnkh7
 es2vV1a3RY3bGf/pgHnoprixrwtt1DWrPRzBh9O8xUT/sqb2JJM4b1FFPoceKtisv2bvawdbmah
 0NmhQIjDtvO6Gb59r8FNvX8eMF6gDfsjQDAlxVVzrrUzaGDXaaW7DZw0VECFc6MO4cqqGn1sMeg
 eJZl7khQVleIW1IEWb7RjdfjK1Ok4QzwbVgorIrQCokoXDwyDtLukEuEHEHfoY9+TQeKGGpY

As well as using dtrace -G to generate USDT probes, programs and
libraries may have added static probes via stapsdt ELF notes.
This series adds support for such probes.  Patch 1 prepares for
this support by adding counting to parsing of stapsdt probe args
(since they do not include an explicit arg count); Patch 2 adds
the support, while patches 3-7 add tests covering that support.

Changes since v6:

- merge with latest devel branch
- support conversion from double-underscore to dash in provider
  and probe names and test this (patches 2, 7)
- enhance is-enabled test to cover disabled probes, ensuring
  semaphore-guarded codepath for disabled probe is not executed
  (Kris, patch 7)

Changes since v5:

- update copy_args() to remove strlen() check on every iteration
  (Kris, patch 1)
- restrict to specific pid probing, removing wildcard support for
  now (Kris, patch 2)
- add support for semaphores for is-enabled like stapsdt probes
  (Kris, patch 2)
- add test for semaphore support (patch 7)

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

Alan Maguire (7):
  usdt: have copy_args() count args while parsing them
  support stapsdt ELF-note-defined static probes
  selftests/usdt: add test for stapsdt note-defined probe firing, args
  selftests/usdt: add test for stapsdt notes in shared library
  selftests/usdt: add test covering different forms of stapsdt note args
  selftests/usdt: add test for stapsdt note-defined probe firing in
    -fPIE binary
  selftests/usdt: add is-enabled stapsdt tests using semaphores

 include/dtrace/pid.h                          |   2 +
 libdtrace/dt_pid.c                            | 291 ++++++++++
 libdtrace/dt_prov_uprobe.c                    |  74 ++-
 test/unittest/usdt/sdt_notes.h                | 504 ++++++++++++++++++
 test/unittest/usdt/tst.stapsdt-notes-args.r   |   2 +
 test/unittest/usdt/tst.stapsdt-notes-args.sh  |  50 ++
 .../usdt/tst.stapsdt-notes-isenabled.r        |  13 +
 .../usdt/tst.stapsdt-notes-isenabled.sh       | 152 ++++++
 test/unittest/usdt/tst.stapsdt-notes-lib.r    |  14 +
 test/unittest/usdt/tst.stapsdt-notes-lib.sh   | 145 +++++
 test/unittest/usdt/tst.stapsdt-notes-pie.sh   | 121 +++++
 test/unittest/usdt/tst.stapsdt-notes.r        |  14 +
 test/unittest/usdt/tst.stapsdt-notes.sh       | 121 +++++
 13 files changed, 1488 insertions(+), 15 deletions(-)
 create mode 100644 test/unittest/usdt/sdt_notes.h
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-args.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-args.sh
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-isenabled.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-lib.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-lib.sh
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-pie.sh
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes.sh

-- 
2.43.5

