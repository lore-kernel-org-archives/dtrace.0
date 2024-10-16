Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954AB207A2E
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729094061; cv=none; b=W7pFfVqQ2BpMOs5Ja4ZnSBWPL0qljpmn6tX7EpV+GtOVzrSPV0K3SSD/NNLVDjYe8++6Chx6xb7MftO0px59bYZgxXTcyYPxYyWfqJyNm/F0bd/jUH8Oj2iTZmCAWXwkFbkN65p26k2x25knm8jbeHktwoTUlcC3wii8rZz6vXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729094061; c=relaxed/simple;
	bh=e+iREkPaBgyXYEDbuFy/KVyDXQkGbsi3JTu1tqR2ayw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZP1QliJAw3/WCIb1OkZMwa808emuQj1yKAtzbDMVoajxWnhCJtTWUwvqbYxpFqCw16n7Lj4WO8fo4SEBC+sdpAMkuc6wDInoQ0xBKFKuLl4BWLgG0T8DeezlcrOIRatZJ1GpWUKNkGdjOnEaJi8fHCloL0ISXFyGMbB+u6ucRvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dorVUH53; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dorVUH53"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GFfxiu021971
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=2N8bt
	X4EsIhJ4pEE1xM3IgtS7PpH5r7QU8cYUXZ72ng=; b=dorVUH53o0Q2nFxffiFQt
	KmIO8tSRKvlRfRAnWWV1fUvlMjVjrOfvA3qXpjhsXbevZi6DCLTVj0l8WXejivq2
	+kixjettrpv9Q0czPI98dfxnxnq4cjVQB4juC3Gk7m2x++y7fC9FSg5xonmReahB
	cJFOjWNEhErHCt8wV1cHfIQfyhEByya5oYQXeTl1R0OwaXS7X12K2HNynHGgwNQI
	7GxjDTz8M2oT6YjsQFk4us1iQC9ySGXXFN4WmPaEY2du6n0FAEdj7PjdqRAT2WYl
	myzTJMfkYShtRs0uj6alNpPDM46T1B5jQCJwhPqt76uvRmPmUiIH7HeVsf3YtIWF
	w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427g1aky73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:54:16 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49GFKWqi027261
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:54:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjfk283-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:54:15 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49GFsBrM014752
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:54:14 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-205-31.vpn.oracle.com [10.175.205.31])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 427fjfk24u-5;
	Wed, 16 Oct 2024 15:54:14 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v3 dtrace 4/4] sched: fix on-cpu firing for kernels < 5.16
Date: Wed, 16 Oct 2024 16:54:09 +0100
Message-ID: <20241016155409.4038017-5-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20241016155409.4038017-1-alan.maguire@oracle.com>
References: <20241016155409.4038017-1-alan.maguire@oracle.com>
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
X-Proofpoint-GUID: Dk3SsCkZd3CR8RC0B3bb8iDxDyiWt4cY
X-Proofpoint-ORIG-GUID: Dk3SsCkZd3CR8RC0B3bb8iDxDyiWt4cY

The solution for sched:::on-cpu firing (probing
__perf_event_task_sched_in) only works on 5.16 and later as
the relevant function is not in available_filter_functions
in earlier kernels.

Instead use the fbt::finish_task_switch:return probe as this
will cover .isra.0-suffixed optimizations if they are applied
to finish_task_switch().

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_prov_sched.c | 23 ++---------------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/libdtrace/dt_prov_sched.c b/libdtrace/dt_prov_sched.c
index 4fbd24ab..796f39af 100644
--- a/libdtrace/dt_prov_sched.c
+++ b/libdtrace/dt_prov_sched.c
@@ -28,7 +28,7 @@ static probe_dep_t	probes[] = {
 	{ "off-cpu",
 	  DTRACE_PROBESPEC_NAME,	"rawtp:sched::sched_switch" },
 	{ "on-cpu",
-	  DTRACE_PROBESPEC_NAME,	"fbt::__perf_event_task_sched_in:entry" },
+	  DTRACE_PROBESPEC_NAME,	"fbt:vmlinux:finish_task_switch:return" },
 	{ "surrender",
 	  DTRACE_PROBESPEC_NAME,	"fbt::do_sched_yield:entry" },
 	{ "tick",
@@ -157,26 +157,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
  */
 static void enable(dtrace_hdl_t *dtp, dt_probe_t *prp)
 {
-	struct perf_event_attr attr = {};
-	int swfd;
-
-	if (strcmp(prp->desc->prb, "on-cpu") != 0)
-		return dt_sdt_enable(dtp, prp);
-
-	memset(&attr, 0, sizeof(attr));
-	attr.size = sizeof(attr);
-	attr.type = PERF_TYPE_SOFTWARE;
-	attr.config = PERF_COUNT_SW_CONTEXT_SWITCHES;
-	attr.freq = 1;
-	attr.sample_freq = 1000;
-	attr.context_switch = 1;
-
-	swfd = dt_perf_event_open(&attr, -1, 0, -1, 0);
-	if (swfd < 0)
-		dt_dprintf("perf event open failed for context_switch: %d\n", errno);
-	else
-		prp->prv_data = (void *)(long)swfd;
-	dt_sdt_enable(dtp, prp);
+	return dt_sdt_enable(dtp, prp);
 }
 
 static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
-- 
2.43.5

