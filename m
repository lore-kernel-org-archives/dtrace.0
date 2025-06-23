Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85E8239072
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 10:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750673597; cv=none; b=As73EIbW1wZJ5Tq3360ujUwkFI6IqXs1CNyZjt/zYxi4y22oyHrEGe69CWaQOT+7a8vGXF1VamHc3eNrQiK06hceu5bYJ8+nv4Hzv4WXBN3a2SE0gRo0XPetuXAmPiCnVL70ttikmLtSDKV84JpuhO3w1BsGn6bjxEqsv06KuMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750673597; c=relaxed/simple;
	bh=o8XorQUMm5a1khYiyYtWdSZa1jiOOrCvrvVRVf1joI8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NOB0u8Fb4dKpKFD7HSjbxLakY3birhKM8v2oMoelk1NUSoEH6AeQp9l4K27sCT/32XYq7Y8ASoNs8XLG+As9P/ievzmePz4IHhONlaBDZDuEnQRurQtHV9PB+vVZnlhFT2qRD5tR2/v91eavYuD9Z6aoEJIMXDFtd79NcjREMWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fxBYkxIK; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fxBYkxIK"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N8pRw0032094
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 10:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=y/NWf/g6b0PF4jas5dvfEYTaxGzqV
	Bo1jXTjMWkpfZc=; b=fxBYkxIK4yWsk6cqXhc/aA0TEQSregZ+R9jghJN2SIKvM
	yUmbWrsCvoifKU5xi5S7cAi+ejN6PhyUC9aFCWxMbpKDM6yrAgLVY4NbKwbIYS3b
	LJEOANHB6E12FdTb36G9H2P1Cqw348cHmQ4qmOWLEMMBGTMEnPhbt5IY/LdJwe8Q
	dJcbbRVTqVkZcofQu8aTvsIrxpVSDQRNdA9o3KPUc9bjrEgZPyJyJF18JD0/bNfp
	wdyvrOFRzF4PHY3NdmutN3j/oeqBVErUfM2G6QQREuanGY/NhKQ158/P2wtqAeJP
	uwxy63pUDEZaNPDaYfgdmBfqqUNz3qLWysXyq8ang==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt5h9bg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 10:13:14 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9gaJt005018
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 10:13:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq25ecp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 10:13:13 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55NADCni007270
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 10:13:12 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-58-219.vpn.oracle.com [10.154.58.219])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47ehq25ebq-1;
	Mon, 23 Jun 2025 10:13:12 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v4 0/5] add support for stapsdt probes
Date: Mon, 23 Jun 2025 11:13:05 +0100
Message-ID: <20250623101310.1649756-1-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=902
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506230060
X-Proofpoint-GUID: JQXLgj732ZhakSfPlK1FybcGu_PQPArq
X-Authority-Analysis: v=2.4 cv=PMYP+eqC c=1 sm=1 tr=0 ts=685928ba cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6IFa9wvqVegA:10 a=soS89ZaN0qLyo0Q28VAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2MCBTYWx0ZWRfX48xsjHrACbHo EGVUnMVnZklVWNgbJuIe1/0u+vzSg020Dle56uEV+0QisMAtTIXxmc1zO3ZvX2yNizVy7mUUwY5 AB2LcK29R7taAnmbeMxkg2q0Kb9ngqc4hTQoXFbH7r93p6HwLe/FLyGW8uU/9N7asRBzg+8JKVu
 xwC4tByWsfpPu8FrFf+zFHtPb5Qba0AWvPCO+aSiBSa2wZvIucWqwZusrl5/w0eP/+XlE4X83aC Uar55a2pcCv9TCTQ7droGMTiEMO460yTFfoiDQ+7ApCxTeASfgeudjQJfbQo4IanBRSBfxBo5pC 3PBn5LqeAVIKQEHoIP7YrEQ/7iWJJBQjcAe3adD3czkXiTmxEq5yKtAEQii4CvbfUyGjllZaKXu
 HkistalZhQ7UoVI+r45FLeNxjeuqsuTfixQ3sea9wFxTCdZWci5WyN5qlQLKGlWT0w5riSaP
X-Proofpoint-ORIG-GUID: JQXLgj732ZhakSfPlK1FybcGu_PQPArq

As well as using dtrace -G to generate USDT probes, programs and
libraries may have added static probes via stapsdt ELF notes.
This series adds support for such probes.  Patch 1 prepares for
this support by adding counting to parsing of stapsdt probe args
(since they do not include an explicit arg count); Patch 2 adds
the support, while patches 3-5 add tests covering that support.

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

Alan Maguire (5):
  usdt: have copy_args() count args while parsing them
  support stapsdt ELF-note-defined static probes
  selftests/usdt: add test for stapsdt note-defined probe firing, args
  selftests/usdt: add test for stapsdt notes in shared library
  selftests/usdt: add test covering different forms of stapsdt note args

 include/dtrace/pid.h                         |   1 +
 libdtrace/dt_pid.c                           | 288 +++++++++++
 libdtrace/dt_prov_uprobe.c                   |  54 +-
 test/unittest/usdt/sdt_notes.h               | 504 +++++++++++++++++++
 test/unittest/usdt/tst.stapsdt-notes-args.r  |   2 +
 test/unittest/usdt/tst.stapsdt-notes-args.sh |  50 ++
 test/unittest/usdt/tst.stapsdt-notes-lib.r   |  14 +
 test/unittest/usdt/tst.stapsdt-notes-lib.sh  | 145 ++++++
 test/unittest/usdt/tst.stapsdt-notes.r       |  14 +
 test/unittest/usdt/tst.stapsdt-notes.sh      | 121 +++++
 10 files changed, 1184 insertions(+), 9 deletions(-)
 create mode 100644 test/unittest/usdt/sdt_notes.h
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-args.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-args.sh
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-lib.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-lib.sh
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes.sh

-- 
2.43.5

