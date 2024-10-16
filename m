Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B4F1384B3
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729094056; cv=none; b=TEiio3lQTKth5yN1b23MMQLHM2IYx6AfiRfYUbxKZA4gjpJYEKzlKg11dnCYgcvLbaJI8yz6J6XJJNW3c15HRag59MwRSoiiT/WwKDd4DANLxgXO8AoKp1Lx/6FXS5EtbAosQvNVLqJWTwmcT3BYX8ROVCjIZuxzbEK79K1IIag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729094056; c=relaxed/simple;
	bh=aG+O9tGtWLSBTf3ick442cAHaP1bUB89FDH/ybBMpkk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uN3osYg2AJ9dgGJUMPSR24vF48kDn5yRL1xsXbvmp3FymcgHFbNeod+kgEcmKs4OQmzVJOZYy//+piiX8sPThwD8pY7152hJGcezVENTrc0JKPW4tgBausg922A1EHy22wEGLNih0okI1R8TjO/5Hzs/KKTzN7EK4Mis1wTAYfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hs4Wkzbr; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hs4Wkzbr"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GFflk8022478
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2023-11-20; bh=J7XfrK53fEC8nasrPlQbIDbPZZ3dk
	i5n9f0Bwo97V1w=; b=hs4WkzbrjnlyjaLxMOVF2n/7Pdxyzxgh+Xuyg9qWRc2WQ
	UG57ynYG9OSjl6Ly3bXfulVr1jeBGx/xp39UPz220TwjmArezrTBa5b6Lqa2kTTO
	XcsNx0+RzpChWRZO7jVvP0PPwIRnWxDZ9ch8+gs0D+UyPLvH83IOCTzrPpTQyOid
	/aZbWwuo9srDOIEwGS8V6Xkiys89I3VDE2O7ShLbR/rASk791Cs91XkUb9CmCaHY
	T45r+YHNoqFVa5jPPLiKMO0utEJj1zV6Av4tnZHXCTnTrcPzFn9UG2lg903Dlmlm
	fEbhhA0MKrSHILV5ndxfz3nMrnqG+PxFlCWQe8l3A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427h09kn2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:54:12 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49GEgJM3027164
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:54:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjfk25v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:54:11 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49GFsBrA014752
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:54:11 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-205-31.vpn.oracle.com [10.175.205.31])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 427fjfk24u-1;
	Wed, 16 Oct 2024 15:54:10 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v3 dtrace 0/4] kprobe support for .isra.0, sched fix
Date: Wed, 16 Oct 2024 16:54:05 +0100
Message-ID: <20241016155409.4038017-1-alan.maguire@oracle.com>
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
 definitions=2024-10-16_13,2024-10-16_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410160100
X-Proofpoint-GUID: F4JORTP8Px4T2yZojHuz3KUsWECg3FMX
X-Proofpoint-ORIG-GUID: F4JORTP8Px4T2yZojHuz3KUsWECg3FMX

This series is focused on solving a few issues with fprobe-based
attachment which prevent us being able to attach to functions
like finish_task_switch.isra.0.  Such functions are present in
available_filter_functions, and represent real function boundaries
(since they correspond to the mcount function boundary sites)
but because they either lack BTF representations, or because
those BTF representations are named without the .isra suffix, attach
via fentry/fexit is currently impossible.  Falling back to the
kprobe implementation is the best solution here.

However, for stability, it is best to represent the probes for
these functions without the ".isra" suffix, so we need to store
the full function name (with suffix) in the tracepoint data when
the probe is populated.  Patch 1 supports this.

Patch 2 ensures that we use kprobe implementation for any "."-suffixed
functions.  An additional fbt provider with kprobe implementation is
created to support this (so as not to  disturb existing fprobes for other
functions).  At kprobe attach we use the full function name stored
as tp event data to carry out attach.

Next we need to ensure we do not end up with a mix of kprobes and
fprobes.  Ideally we would do this in a more fine-grained manner, but
for now just ensure we do not have an fprobe/kprobe mix program-wide.
When fprobes are active, we will only use kprobes for "."-suffixed
functions that are used, so in practice such mixes will be relatively
rare.

As Kris pointed out [1] at compilation time, trampolines have not yet been
set up, so we can replace the provider underlying fbt at that time.
The probe_info() callbacks are used to check for a mix of kprobe and
fprobe implementations; we check for multiple fbt providers which
have a count of used probes > 0; if this occurs, switch the fbt provider
using fprobe to use the kprobe implementation and reset any event
ids associated with fprobes from the BTF id used in fprobes to 0.

Finally we can then use fbt::finish_task_switch:return as the
dependent probe for sched:::on-cpu, as we now can probe it even
if it becomes finish_task_switch.isra.0.

So to recap:

Patch 1 supports storing/freeing event data with tp events.
Patch 2 allows tracing of "."-suffixed functions like
finish_task_switch.isra.0 via a kprobe-backed fbt implementation.
Patch 3 ensures we do not end up with a kprobe/fprobe mix.
Patch 4 then uses the fact we can now trace "."-suffixed functions
(with kprobe fallback) by using fbt:vmlinux:finish_task_switch:return
as the kprobe dependent event for sched:::on-cpu  . This function is
often optimized to become finish_task_switch.isra.0.

Tested on upstream, 5.15 and 5.4 kernels.

Changes since v2:

- probe function name exposed drops the suffix (Kris, patches 1, 2)
- restrict kprobe use to "."-suffixed functions; this makes their use
  less likely in the fprobe environment.  Do this instead of creating
  a "fake" fprobe probe with kprobe backing (Kris, patch 2)
- modify fallback logic to handle kprobe/fprobe mix (patch 3)
- modify sched:::on-cpu to use fbt::finish_task_switch:return ; no
  wildcard needed now that probe function name is unsuffixed.

Changes since v1:

- simplified approach by just swapping out probe impl when BTF lookup fails
  (Kris, patch 2)

[1] https://lore.kernel.org/dtrace/20241009140236.883884-1-alan.maguire@oracle.com/

Alan Maguire (4):
  dt_provider_tp: add optional event data, freed on tp free
  fbt: support "."-suffixed functions for kprobes
  fbt: avoid mix of kprobe, fprobe implementations for used probes
  sched: fix on-cpu firing for kernels < 5.16

 libdtrace/dt_prov_fbt.c    | 138 ++++++++++++++++++++++++++++++++-----
 libdtrace/dt_prov_sched.c  |  23 +------
 libdtrace/dt_provider_tp.c |  27 ++++++++
 libdtrace/dt_provider_tp.h |   8 +++
 4 files changed, 158 insertions(+), 38 deletions(-)

-- 
2.43.5

