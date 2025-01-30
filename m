Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7701BB6BC
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 14:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738248199; cv=none; b=X6bx/dUcrm/3rSQ9JrEMhLoGdMceihrurUc8REkc0c5pFPkjtEZItqMVM79PIgsdAVicKpHiA0tWte2uVyF/z8x7+o4MeQkU/sVFx4YCj2/A95TiAF3FgOAXoQqWT7CmEhHTMoMpCBEboKEjUKQ4Jj8ZDS6Nt+MPmzm74/5Z+RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738248199; c=relaxed/simple;
	bh=jAW1Hkhyd93IkoTXHBkLwJVqEKhwhbxV75aruKA9jPw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uG5icNZ5pdQLshXDUaScW0uyUOGwPhNQAs27HkbR0lRLceJiKkRIEv28jc2lwSFXN5SDhEZzLDbzAF+wXvvAihaL88sZ2nzmcHj+bE6VDPuYh5y0/M28aEfuhGGVSNgaubphkxvhfuAoSNuWQp+LxE041Loainqq7T3NM6nMGKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=huv5uJvV; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="huv5uJvV"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UEQuLq001674
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 14:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2023-11-20; bh=kW1N8+MCs+/EIe+jPYQPVilXWQDkk
	Li6vYBygecbnrQ=; b=huv5uJvVFdV8D73mxsRipIWroFYVMhDXK01iikch6TS6E
	wfLbHao2ydiBeQNWrnC9bLMYZL4vbkkhY3jjnzsrFi8kfAEJhKsexIIHBuVb7ohf
	DNNEwrMVhNe+VWAVS5trb9INSqSmgYyrTnIr2X6lKidPH5YdE1LlSKXCa3HLWSaw
	YAX46cRks61SyveqsrFa1yAo5oLqSKT1GDj+0fD9k4mU9WZoI1ojxnIp2LHrSXtM
	LSUiM9kqctpfHjfJaICtkQGMoQXyj7zqcjmyuTcWKO0qBzTB1dq6D5uNkiZxAZuD
	XfaR2/Ns7WvEvHWL0tDbTj4+tru+YYNzHHFpyBRdA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44gb6qr214-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 14:43:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50UDm1NG005314
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 14:43:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpdba4ex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 14:43:09 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50UEh9DQ004912
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 14:43:09 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-172-30.vpn.oracle.com [10.175.172.30])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 44cpdba4dq-1;
	Thu, 30 Jan 2025 14:43:08 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v3 0/4] add support for stapsdt probes
Date: Thu, 30 Jan 2025 14:43:03 +0000
Message-ID: <20250130144307.1297654-1-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_06,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=712 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501300112
X-Proofpoint-GUID: p8Oe9qwqi5HPfnDX5zQ3u5xqcgkNB_DP
X-Proofpoint-ORIG-GUID: p8Oe9qwqi5HPfnDX5zQ3u5xqcgkNB_DP

As well as using dtrace -G to generate USDT probes, programs and
libraries may have added static probes via stapsdt ELF notes.
This series adds support for such probes.  Patch 1 adds the support,    
while patches 2-4 add tests covering that support.

Changes since v2:

- updated terminology to distinguish stapsdt from USDT probes

Alan Maguire (4):
  support stapsdt ELF-note-defined static probes
  selftests/usdt: add test for stapsdt note-defined probe firing, args
  selftests/usdt: add test for stapsdt notes in shared library
  selftests/usdt: add test covering different forms of stapsdt note args

 include/dtrace/pid.h                         |  29 ++
 libdtrace/dt_cg.c                            |  47 ++
 libdtrace/dt_cg.h                            |   1 +
 libdtrace/dt_pid.c                           | 467 +++++++++++++++++
 libdtrace/dt_prov_uprobe.c                   |  19 +-
 test/unittest/usdt/sdt_notes.h               | 504 +++++++++++++++++++
 test/unittest/usdt/tst.stapsdt-notes-args.r  |   2 +
 test/unittest/usdt/tst.stapsdt-notes-args.sh |  50 ++
 test/unittest/usdt/tst.stapsdt-notes-lib.r   |  14 +
 test/unittest/usdt/tst.stapsdt-notes-lib.sh  | 145 ++++++
 test/unittest/usdt/tst.stapsdt-notes.r       |  14 +
 test/unittest/usdt/tst.stapsdt-notes.sh      | 121 +++++
 12 files changed, 1406 insertions(+), 7 deletions(-)
 create mode 100644 test/unittest/usdt/sdt_notes.h
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-args.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-args.sh
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-lib.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-lib.sh
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes.sh

-- 
2.43.5

