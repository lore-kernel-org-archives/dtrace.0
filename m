Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80E347DF93
	for <dtrace@lists.linux.dev>; Fri, 15 May 2026 13:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778852660; cv=none; b=puKrpimOYH2asfURny61610nnhcskx2GP9NPZeyHG4lW3tU3TTwbCfiBeYOeVzCfws/qRZHT21p7+eg087BLwpgN/U+0+UH4jqr+jZ+SHb++icDe6nLDh+Yak6iZKd/OoFPv+rrFdE04fQnLC9kGdTXxq52XhNQBx5t8zeGQnqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778852660; c=relaxed/simple;
	bh=/wjFWbYUqj9R1hilJ/vtfqCm0FRj9qD2zedU+U17ka0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pUdKzV9ThAbKAyoABcbKPEaYC6TbPAWx/c+E2apGTvcBHCTLJS/r2wV5GTWWHSlbeqlW10eoKo7BjfacGBtXRgmIrQJO1nBD5qDJ4rUWOXQpGrq7/HrItvc8NXy6Zy7po9z1RX8eNoN1OkLXRacAD6JSJXcqob+5PtVzJ5gmXRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DFObEoOi; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DFObEoOi"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FCTCOr122379
	for <dtrace@lists.linux.dev>; Fri, 15 May 2026 13:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=HTEHscy7Wwk8M1oRKsbLdw1k3Eapw
	kxx6vuhrAAKHxc=; b=DFObEoOiTlPYXky+icw58LAthjWZkQ0Ozejy0KHzn0FVL
	QWdgUSs+paOq3QF+lH0UrlCYTmGIg5v/i+Bs3+rScK4oryRo8hxk5OXW7/oz+raF
	pdDgO6YPlm6jXdk/fUvyjhMhljmChmQSChHZrrz1dD/w5K0eFFj13+WxTey5/uck
	OPexNBDxdFJoRbfcKBXBkOF2s0UDtw/7bGvKNyXsyUc+KqM3MCarjqwmgq2U0YWo
	nMP4A3HAFTgfOslYqjVSZ5ylNkkypPCrYq7yjeC870Dp+LbQgOpoUzWh1Fw9da3/
	uDKDchzkb4M9LnpIhyfkWiQEXfHwr+4oeqkuysvnQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4e5m20hbpv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 May 2026 13:44:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 64FDdiVj030893
	for <dtrace@lists.linux.dev>; Fri, 15 May 2026 13:44:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4e5kw11je5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 May 2026 13:44:17 +0000 (GMT)
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64FDiGWw004626
	for <dtrace@lists.linux.dev>; Fri, 15 May 2026 13:44:16 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-60-220.vpn.oracle.com [10.154.60.220])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4e5kw11jd6-1;
	Fri, 15 May 2026 13:44:16 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH 0/3] Add python bindings for libdtrace interfaces
Date: Fri, 15 May 2026 14:44:12 +0100
Message-ID: <20260515134415.355507-1-alan.maguire@oracle.com>
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
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2605130000 definitions=main-2605150139
X-Authority-Analysis: v=2.4 cv=DeMnbPtW c=1 sm=1 tr=0 ts=6a072331 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=u09merj4yOzoCRqrzKQA:9
X-Proofpoint-ORIG-GUID: Snx1QNpJuac8SYAsI4iaGhuW9ecjbYA1
X-Proofpoint-GUID: Snx1QNpJuac8SYAsI4iaGhuW9ecjbYA1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEzOSBTYWx0ZWRfXzr2NKZK39KUb
 rN1olxUFKKi85qFWUJQT6ssX5VRmT7jF0s34L2RJKUtOAJPy4sr/0KqOBG9ueDrHUJ0o/s3rNnu
 o/VMJ0cm1GFlVnaLmuha+NEYKHmqTjO5xRNNG4lHrYAJfxC3LV18n6IQ+eygB06jjd9xq8yjo5f
 p9gW6E+Exr90BEMwF+wP6xHKf1WVdFu/pmvZRn3+nHHCslFdrrG0RPxEBE1LZIiz/HPEKIvTx/G
 gqppqYWttJHsKI7cCJjTC57lG/M0XI0CZ7qnMDR5ck0px3dQloeFHiVRpY0lO5HVcu2qWoBKp7s
 l0mOerueiZ/nBNE5SKIsJZ9RCaiMZdRJRgMX/mkLzzan6+DoUZjoGMMgDVFVUlCdCPc5zzZ22FH
 TeaoCun2SrLJtgJaemLGiWx/UTnZI7uroQtqY3N87IDBnyI6QDp2uKaADygjzscR95QCfNprtKu
 JkMUKvROwlFXiaQVeIw==

Having python bindings for libdtrace interfaces to compile, run
and collect information from DTrace programs is valuable because
it will help integration into metric collection frameworks like
PCP.  This series adds python bindings for DTrace (patch 1)
and provides tests for them (patches 2, 3).  The support is
similar to what cmd/dtrace.c can do; compile a program,
enable probes, run it and collect data.  Support is also
added to grab or create processes as is done by
dtrace -p, -c options.

For description, see the README in patch 1 and the tests.

Alan Maguire (3):
  python: Add cpython bindings for libdtrace
  runtest.sh: Export PYTHONPATH when running tests in-tree
  test/unittest: Add basic python bindings tests

 GNUmakefile                             |    2 +
 bindings/Build                          |   35 +
 bindings/python/README.md               |   68 ++
 bindings/python/pyproject.toml          |    3 +
 bindings/python/setup.py                |   52 +
 bindings/python/src/pydtrace_module.c   | 1187 +++++++++++++++++++++++
 configure                               |    4 +-
 dtrace.spec                             |   29 +-
 runtest.sh                              |    2 +
 test/unittest/python/tst.aggr.sh        |   59 ++
 test/unittest/python/tst.proc-create.sh |   56 ++
 test/unittest/python/tst.proc-grab.sh   |   81 ++
 12 files changed, 1575 insertions(+), 3 deletions(-)
 create mode 100644 bindings/Build
 create mode 100644 bindings/python/README.md
 create mode 100644 bindings/python/pyproject.toml
 create mode 100644 bindings/python/setup.py
 create mode 100644 bindings/python/src/pydtrace_module.c
 create mode 100755 test/unittest/python/tst.aggr.sh
 create mode 100755 test/unittest/python/tst.proc-create.sh
 create mode 100755 test/unittest/python/tst.proc-grab.sh

-- 
2.43.5

