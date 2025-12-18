Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0484C92
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 17:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766078640; cv=none; b=EvoyMVZdONtdSg3EsHFTb49LsUufKW5lgO8qDXm3NqlOrIj3PjUpulLvWFdjh9Wv1iMu8XDFqHgF4gl5jSGRX3xcpLrVgKlG72ku9F6r8DKd6J9qWK2KroPvDUCQ5sikzRsCQJDzukrv3MWXirj62cZjuHNsGrIrNeXuoNDthjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766078640; c=relaxed/simple;
	bh=OXL3p/yrLmZD3QWTJyHfYVlNCr4YjeOqpbuTYmawi5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g9Mt9k/Gh+df2obt3LmSzbQeAtifIUX/ETCFGU8psl5+CqdKxKxpKPVhohQt0JIwKlRZqm9P12WYAuLsR80ws8g78SifqqRJHu5K1Ywv0Xm+f0azwimNnEgT0CgQdxKvEjEKf77KQxnK+P96u1+3dsq51sc5VcPcitOZWmQmYQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FuO9Z2Mi; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FuO9Z2Mi"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIDCNXs938583
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 17:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=YO3YFCEBIob7avfhoodUfxrI8Dan/
	+0QgBqZikrU+Y0=; b=FuO9Z2MiDh/cpfyG7f1rrbg/ijP5xdrc0XqETZugc7Iyj
	0ylWfpCIP3EKd3EY3Nc+PqVdDIcIQSzKmY95/5yEH8AJwkInM21qd75492zHlNMB
	Ub+X4LoUiVcaj1T7ydjchubULYKzdf17BfdLSEkRSGoqppl9zEGdbahDKbJm45eg
	GmkFMl1WNB8fTouPwAU4kMd+CCeZeA9GgfWOLWGI0ABf6DgKgrVjjb0yRoKptxSu
	ZeD+XTeSbTwkkRPgAsfC1FY434ziekg4z2OKQZqRObQnvrgyJAt4lqiF4p+YCyHR
	QqTUlWmKOKq6qluh+HBCkfv2tNvIoStlIdZFf1KcQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b0xja84sp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 17:23:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIH5noF016320
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 17:23:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4b0xkpq6wg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 17:23:55 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BIHNtS2002775
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 17:23:55 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-104-22.vpn.oracle.com [10.154.104.22])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4b0xkpq6v9-1;
	Thu, 18 Dec 2025 17:23:55 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [RFC patch 0/4] stapsdt provider: simple system-wide probing
Date: Thu, 18 Dec 2025 17:23:50 +0000
Message-ID: <20251218172354.3206787-1-alan.maguire@oracle.com>
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
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 mlxscore=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 mlxlogscore=433
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512180143
X-Authority-Analysis: v=2.4 cv=TbWbdBQh c=1 sm=1 tr=0 ts=694438ac b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=0MNMWEXTOEOGPSYGRGgA:9 cc=ntf
 awl=host:12110
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE0MyBTYWx0ZWRfX5yg+owQ4ZsgC
 pgAHeMKC908GXx7fM7CJdmZ+1vF5DP8gOD8qb9FXktFsGEKb6K3lZTGwTNjNPzZNeg23NA1EFzp
 Vef5qI+2rhRvxET0pAspEhz7XPwXFBJmHz7M8+Fi29zr6aUiRiAdkpcC80UmZlA1jz2L8VGeO3w
 23qIKLEDkk9FgKy8A0TswvLXhwzOB1D/KXv6jwwoshBzZ8qXklwYZ+ll+Ef27sqpVk3lhl0kmDu
 zQmvhouYsjfMbgjNgX2SzDrpqO39Oh/a9qwPqh0Yyov856m1SC22ltl+ZxCsy+mHnIzgHBuxZtv
 HhRzpyXLuaF70Qh75lk4waEay451j0c1oEL24meqNIC2XSLjz1V24o0e8wTElFytinJh46UBxmo
 I9wUPpEOv/gZtKF+5jDT4n2y/s1EbP3eMAR+XD3i3ms2xHc3wxI=
X-Proofpoint-ORIG-GUID: 6tauWeeva_OH-GrhZZ2RbeWSRmIa7lQG
X-Proofpoint-GUID: 6tauWeeva_OH-GrhZZ2RbeWSRmIa7lQG

This series adds wildcard support to stapsdt probes to allow
tracing system-wide; this has caveats due to the way the kernel
implements probe addition.  In essence, probes will fire for
new programs launched since instrumentation was attached, but
will work for libraries in existing programs.  See example
in patch 4 for how we can use this to trace libpython system-wide.

Patch 1 describes the approach; to facilitate systemwide tracing
we need to tell DTrace the name of the binary/library via the
module field in the probe specifier; we then use [LD_LIBRARY_]PATH
to resolve the full path.  ELF reading of the file and insertion
of probes then proceeds in a similar manner to per-pid tracing.

Patches 2/3 are tests for binary/library tracing, and patch 4
updates docs.

Alan Maguire (4):
  stapsdt provider: support systemwide probing
  test: add systemwide stapsdt note test
  test: add systemwide stapsdt note test for library
  documentation: update stapsdt docs to describe wildcard support

 .../reference/dtrace_providers_stapsdt.md     |  41 ++++-
 libdtrace/dt_pid.c                            | 158 ++++++++++++++----
 libdtrace/dt_prov_uprobe.c                    |  12 +-
 .../usdt/tst.stapsdt-notes-systemwide-lib.r   |  14 ++
 .../usdt/tst.stapsdt-notes-systemwide-lib.sh  | 142 ++++++++++++++++
 .../usdt/tst.stapsdt-notes-systemwide.r       |   2 +
 .../usdt/tst.stapsdt-notes-systemwide.sh      |  51 ++++++
 7 files changed, 378 insertions(+), 42 deletions(-)
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide-lib.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-lib.sh
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide.sh

-- 
2.43.5

