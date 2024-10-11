Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBBA20C496
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 10:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728642497; cv=none; b=m0o+Dmq3jDeopvN/KEw9vbJiNUKcVZBQTpmUI1ADfcSTghCzxEhKcGXtc9eXPaNPAs8heCpw/eHXlEjtF6J1Z3Fo8wsJmJUKIxnpHBUo6FZ0dG0Nhnkw27sRnCwwlgKLgBi/FUVXHFLmiaKl1TX0lsQSf/HOtg28KGVmS2rNFgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728642497; c=relaxed/simple;
	bh=PNjolcUb9XhZoec8tXeNfZq2xcTE2/qA3aEDxGr8AqI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tdGqp6+Em2BtzrJCwBHrYYuJG90SAQxgVbBBHj/DInJmbP1TgqTacBn2msnFjQ/2ZzdLuhmQvdO+5Rg/2jDj+Z+Vzf6KZWGq6oZCh8MTBvU/KrlwD6/RXVXmlc/xXBM0t/kYB0wbTeE3RajvcXc11DTl0u5OVDWyBvJ4Vb5UJdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aRkke3Oe; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aRkke3Oe"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B8BeTV026139
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 10:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2023-11-20; bh=/teDBt2Mt5RLAO7VojAmjN+LywSSN
	ke0Lzv5Bi70TnM=; b=aRkke3OeLd4ENh7K1ysicuaJCn0EGpyfNQfe65fWdVe9q
	aRUbpFnZWMHEyXdd8WrgM0an1NhHtCAAukDy/guSOtkJLTFCZWWYplZGuJn6MFZ6
	VOC24ZP/r6WjNL2n9+cBp5e0lCuxChaZAVM+UG7/b3q0FcljQ+ebr1ODBGI8hPz1
	52+zPBtkAGk5U6pQ9kCohxbsPYjrtaIs2jvjij25bUARzBBCvDUXKrkxoSHdmWae
	dR6MWyPCD9yxXjMofuIMb2nRoJCaj86c941fC4fm/Ch+K3iZTp+DdmhGtzsQbXbz
	04bzFTUiChP6uaVsxc6Ft1LP+Wqi0SqGl7elCaocQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42306emks8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 10:28:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49B8spSw028039
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 10:28:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 422uwhfkca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 10:28:12 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49BASCj2024278
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 10:28:12 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-192-195.vpn.oracle.com [10.175.192.195])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 422uwhfkc1-1;
	Fri, 11 Oct 2024 10:28:11 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2 dtrace 0/3] fprobe fallback kprobe support, sched fix
Date: Fri, 11 Oct 2024 11:28:07 +0100
Message-ID: <20241011102810.989562-1-alan.maguire@oracle.com>
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
 definitions=2024-10-11_08,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410110072
X-Proofpoint-GUID: O-H3b3rhWcwzCLiM46AkBb2EtVMBpWdL
X-Proofpoint-ORIG-GUID: O-H3b3rhWcwzCLiM46AkBb2EtVMBpWdL

This series is focused on solving a few issues with fprobe-based
attachment which prevent us being able to attach to functions
like finish_task_switch.isra.0.  Such functions are present in
available_filter_functions, but because they either lack BTF
representations or those representations are named without the
.isra suffix, attachment via fentry/fexit is currently impossible.
Falling back to kprobe attach is the best solution here.

As Kris pointed out [1] at compilation time, trampolines have not yet been
set up, so we can replace the provider underlying fbt at that time.
Do so if any fprobes do not have associated BTF (as this will mean they
cannot be attached).

Patch 1 allows tracing of "."-suffixed functions like
finish_task_switch.isra.0.  Patch 2 supports kprobe implementation
fallback when BTF is not present for a to-be-traced fprobe function.
Patch 3 then uses the fact we can now trace "."-suffixed functions
(with kprobe fallback) by using fbt:vmlinux:finish_task_switch*:return
as the kprobe dependent event for on-cpu.

Tested on upstream, 5.15 and 5.4 kernels.

Changes since v1:

- simplified approach by just swapping out probe impl when BTF lookup fails
  (Kris, patch 2)

[1] https://lore.kernel.org/dtrace/20241009140236.883884-1-alan.maguire@oracle.com/

Alan Maguire (3):
  fbt: support "."-suffixed functions for kprobes
  fbt: revert to kprobe impl if we cannot find BTF for fprobe function
  sched: fix on-cpu firing for kernels < 5.16

 libdtrace/dt_bpf.h        |  5 +++++
 libdtrace/dt_prov_fbt.c   | 39 ++++++++++++++++++++++++++++-----------
 libdtrace/dt_prov_sched.c | 23 ++---------------------
 3 files changed, 35 insertions(+), 32 deletions(-)

-- 
2.43.5

