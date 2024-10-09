Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D8E1A2554
	for <dtrace@lists.linux.dev>; Wed,  9 Oct 2024 14:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728482562; cv=none; b=XWHtOiyINC7t+y52avlBwbrC0Utyyv2bUQ2BwwpnBzXuOabRgPq7kY4hx6kPSPmATGXHrc+mprdoFUd3SoLlkdpeaGcYiKlP3TaBoONpUsMNsgyKUHuYh74JTDedPk6j21m83j4TwcWqSBXdvVI0wuHHeco2JFh5k/eOa9QvCAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728482562; c=relaxed/simple;
	bh=MVre81Fk3ZV6zH1R0odkAH3l62y6LpvGb385n6D03ss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hK0HTTn9CSABgoKbgq2co5lm0WtwqEU6Hdd6L0VAnURs56yrV2qG6Td+4sOSLoDprudJKZce1u5fRFJDCXZm78UQPwt0RcD3IuBY1WXwLXQuzbvG0j5LpAZSy0tZ50hmhHn3E+biNV6CHd5ReGKJ+MmXWXw7ZG24+7TJ9MkSXyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PpLOEMs9; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PpLOEMs9"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 499DfgPo002135
	for <dtrace@lists.linux.dev>; Wed, 9 Oct 2024 14:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2023-11-20; bh=jHjqmOoVJH8FU6dc4Hc/8mIAH5YjW
	7FCmKpHWBFxRwA=; b=PpLOEMs9Abvs+2WYSXbfi6h3UhIGl4km/bGhnFCUXGhRF
	vEBaJ4bMxYLxergxO8ssNdNFvv8jixHJmHQPVujuQAyUV6Bf9iglKs64VX4S82lA
	iqsboTUlBuSsSR8UM5hFbEJphvdX3dSP7v5dVMYfAfNpJr4hNh/os/lKmuhuLssx
	Q/ELcV3bmkiP7OJDDjlghjh8Gl6Ykua5ALoeDachDc8x6RdYH27UISS7674+8/VJ
	2p0R3STgdbI2tEHGfD6iQ4h7tESiM7BLFhIM4rYKSKk/TPpqJJ28iz4dvtyzSppm
	OIxQ7mQTLB2jyuSfLQTqXMPMbbQYy2LeBTMmB8mUg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42308drbcr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Oct 2024 14:02:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 499DrVZF019235
	for <dtrace@lists.linux.dev>; Wed, 9 Oct 2024 14:02:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 422uwex0hm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Oct 2024 14:02:38 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 499E2bOh010849
	for <dtrace@lists.linux.dev>; Wed, 9 Oct 2024 14:02:37 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-194-86.vpn.oracle.com [10.175.194.86])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 422uwex0gk-1;
	Wed, 09 Oct 2024 14:02:37 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH dtrace 0/3] fprobe fallback kprobe support, sched fix
Date: Wed,  9 Oct 2024 15:02:33 +0100
Message-ID: <20241009140236.883884-1-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_12,2024-10-09_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=926 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410090086
X-Proofpoint-ORIG-GUID: hmYo3THXEa90tuT0kU8sMflfv8AshoRP
X-Proofpoint-GUID: hmYo3THXEa90tuT0kU8sMflfv8AshoRP

This series is focused on solving a few issues with fprobe-based
attachment which prevent us being able to attach to functions
like finish_task_switch.isra.0.  Such functions are present in
available_filter_functions, but because they either lack BTF
representations or those representations are named without the
.isra suffix, attachment via fentry/fexit is currently impossible.
Falling back to kprobe attach is the best solution here.

However providers have been written with the implicit assumption
that certain aspects of the probes are shared across the provider;
program type, stack skips etc.  Patch 1 addresses this by providing
optional provider implementation callbacks to return these values
for a specific probe.  Patch 2 then updates the fbt provider to
use these mechanisms to support fallback to kprobe and to support
"."-suffixed functions.  Finally patch 3 can then specify
fbt::finish_task_switch*:return as the underlying probe for
sched:::on-cpu.

Tested on upstream, UEK7 (5.15-based kernel) and UEK6 (5.4-based).

Alan Maguire (3):
  dtrace: add support for probe-specific prog types, stack skips
  fbt: support ".isra.0" suffixed functions
  sched: fix on-cpu firing for kernels < 5.16

 libdtrace/dt_bpf.c         |  4 +-
 libdtrace/dt_cc.c          |  2 +-
 libdtrace/dt_probe.c       | 16 ++++++++
 libdtrace/dt_probe.h       |  2 +
 libdtrace/dt_prov_fbt.c    | 84 +++++++++++++++++++++++++++++++-------
 libdtrace/dt_prov_rawtp.c  |  2 +-
 libdtrace/dt_prov_sched.c  | 23 +----------
 libdtrace/dt_prov_sdt.c    |  2 +-
 libdtrace/dt_provider.h    |  4 ++
 libdtrace/dt_provider_tp.c | 12 +++++-
 libdtrace/dt_provider_tp.h |  9 +++-
 11 files changed, 117 insertions(+), 43 deletions(-)

-- 
2.43.5

