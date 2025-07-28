Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DB7273D6F
	for <dtrace@lists.linux.dev>; Mon, 28 Jul 2025 16:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753720594; cv=none; b=tsi2aNHmy8A9bc3oUODL+XaP5v2By5LxTHcdT//xuaCRxr/7CMfJf21P7Knslvpmiiqs3tlRDWqY5bUgtnh8hzXWaasB078LiATIYnZoO/mP3obkYEAVoAjdnGWo2k8+OvODfvTAu/Ttwcjz4ZnQIxu7ANGNqVAzF0+poIarS/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753720594; c=relaxed/simple;
	bh=lvCMcrfdSNjj4WGdyleoerNJ4IU3ibXBMCIKIMMHLuk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sBCpp7/9LPpn/zqZzG8lY5rVSNIv40zel+nIsrtApwfdJ4IrPWzOVFk3VJOliZLP7gbFDRhv5e3nnzvJKy1Zo+ydrnRXz3/MZx+hIxWUQTD1xnZfIKQ3On2qeynSUveQprBAkCBJ5MuJaiCykwD0i1dM1UrSqDEdeXLsoBByvDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VVRrTfJa; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VVRrTfJa"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SFfrNF012079
	for <dtrace@lists.linux.dev>; Mon, 28 Jul 2025 16:36:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=arW4cq1NEOvkpYuMHkoKQVrvovrYL
	sJ0TWjONc+YpDI=; b=VVRrTfJaAHrmYHH7rDx+QZadUMSpDKOV9T0LoSWKexhLj
	46BvrgmFOyvvZCxgaLdkb2CSP0m9obS7PHbIItnTSE5C23EkCPjeDa+hu2/MzHpj
	EHy2/33zwzHF5RZ3f+4umiD8eC2UBz+KUSGnH3qzZqv4gFfrybgG31N2SmZrqB3d
	xNoQwsSIh9JrE+l2P2r0hEt9Xi7Kb5SCI9gxVssGcZt8Gz8TynxEBUlAbU428Pri
	AIYbBSruSBAsyLxGs9Cn+Hq4RwlypQ/wd3Ew2CWhdktkic+qWl7bC8YrrxnLD/O9
	DJTknIqUPDxOR8TUlEJPDgWryYBHNIsXd18ffClUQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q29ntn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Jul 2025 16:36:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56SFv6Yf038440
	for <dtrace@lists.linux.dev>; Mon, 28 Jul 2025 16:36:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 484nf8keu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Jul 2025 16:36:14 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56SGaEgo007818
	for <dtrace@lists.linux.dev>; Mon, 28 Jul 2025 16:36:14 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-50-230.vpn.oracle.com [10.154.50.230])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 484nf8kesj-1;
	Mon, 28 Jul 2025 16:36:14 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v6 0/7] add support for stapsdt probes
Date: Mon, 28 Jul 2025 17:36:04 +0100
Message-ID: <20250728163611.1570773-1-alan.maguire@oracle.com>
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
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507280122
X-Proofpoint-ORIG-GUID: _uzZ6jtGi1jumnngBI_2QCVPt-7HbwiZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDEyMiBTYWx0ZWRfXzg52tDN4S26h
 2SdcBaqXEPIMISX6IhuOzF8bVshSk1JEuJKFaB3CBxHg96GzcxeVAkcUUbbtwKIjzlr3FW44NvD
 HoEUSewipiEmaYGeVVXb+gI/r1WmORd8wAQ06W+YmeoEws3+Gx2QfvnxN3ujqENXK82OcrItc3x
 Q0c0ogPEhZO1H63cE1C5L9elhngC/Rggag1iOQ9gB2r2/9pUySgM1enP0rAGilUpymFjGBp6SXA
 6YPlqEJE1u9nKu9LkvF+3oT1/W1oeBdOMj5PSZh7aaQVf4Lbmp9gjwzlefvNXcd+yXl0i0HSXlg
 QrJxhSgL8+VEWO3ZTUOfsE3GgYHAbUiDmP35SQMw6gnYernIGzkqn4biOPeZ8wXMsDvRv0LaAdf
 mI6C1a7GGNz7YDTyOJNygxSqet/aA3uNqTLV1GnXgPIWN4tupEYATlYLYTk+l0LsDepnBLHR
X-Authority-Analysis: v=2.4 cv=FvIF/3rq c=1 sm=1 tr=0 ts=6887a70f cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=Wb1JkmetP80A:10 a=06CfEAHARNktU8VKROQA:9
X-Proofpoint-GUID: _uzZ6jtGi1jumnngBI_2QCVPt-7HbwiZ

As well as using dtrace -G to generate USDT probes, programs and
libraries may have added static probes via stapsdt ELF notes.
This series adds support for such probes.  Patch 1 prepares for
this support by adding counting to parsing of stapsdt probe args
(since they do not include an explicit arg count); Patch 2 adds
the support, while patches 3-7 add tests covering that support.

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
 libdtrace/dt_pid.c                            | 284 ++++++++++
 libdtrace/dt_prov_uprobe.c                    |  72 ++-
 test/unittest/usdt/sdt_notes.h                | 504 ++++++++++++++++++
 test/unittest/usdt/tst.stapsdt-notes-args.r   |   2 +
 test/unittest/usdt/tst.stapsdt-notes-args.sh  |  50 ++
 .../usdt/tst.stapsdt-notes-isenabled.r        |  14 +
 .../usdt/tst.stapsdt-notes-isenabled.sh       | 151 ++++++
 test/unittest/usdt/tst.stapsdt-notes-lib.r    |  14 +
 test/unittest/usdt/tst.stapsdt-notes-lib.sh   | 145 +++++
 test/unittest/usdt/tst.stapsdt-notes-pie.sh   | 121 +++++
 test/unittest/usdt/tst.stapsdt-notes.r        |  14 +
 test/unittest/usdt/tst.stapsdt-notes.sh       | 121 +++++
 13 files changed, 1481 insertions(+), 13 deletions(-)
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
2.39.3

