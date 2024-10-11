Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F208212623
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 10:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728642499; cv=none; b=gbAlzoV78bvABiYTTjTOTqgNod+28uFeab05pjuar94xOEM5xgvtTD4n9pEmhYdgioJQPn12wJeRw5yxbq77QEN9yu/7fr118+S3dS0+h3a8GB2Wb5gSS3uL1RvTYc6xal1JtsP5lpKL/rsCNukW0yxE8/1KqxcszVFnt41swpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728642499; c=relaxed/simple;
	bh=+QWu3pBQMGZMZFO0Q1a8wNS2FIqw2sXEnQzRbxDOIBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qba1J+bLDA+X7YpqyUjibdAmwxJZvO/DgfB3Ktl5UixNqfglHzR/DvlEmb+m7oLUIkKVO7si8E2L2W+5GWaCErmjVhEVc2usAzPL0ogbffaUhu3F7KHo86BaaCgbc8IM7GqZzbI7iYEdgjXSvhXgIrdYe4saR3CfET7SxaXjCOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FYilA8gf; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FYilA8gf"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B8Bfn5012295
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 10:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=hH4vJ
	xlLrmgo1mwvZQiO8Y0PCDSYzjuBrQV3hL5+2uA=; b=FYilA8gfXs9DhJBRr2chI
	+g/joEJljOQgTRKJ0EVmySFaB8JeFoqvfZczv0t8WGBO74QyhrnGCQc3OGpk53WK
	hoI4RZ7LCvVFOJ90oR457+RM1m4EUzziw/NVYWzYTS2HctAnXZpn939/qmR4IkAG
	M2gwDFB4MQqNstWz7HDvxOnXHpdebDU8g4IZNsM48Uc7tMzj6nrl5OWO+ZCR9L43
	G4eddg1ImnNAkwUbbR475dfEhq0Dl9Zja5Pjf5HvYrW6HxTW4FMZfujbU9PXFEsF
	jdDlQ53YYmxsK0uoREhn+eztZvbxf+2tM2bSgcl0FSTVViPb3xOe+sdzRBkNQMMp
	Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42308dvjd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 10:28:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49B8soDK027922
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 10:28:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 422uwhfkdc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 10:28:15 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49BASCjB024278
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 10:28:14 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-192-195.vpn.oracle.com [10.175.192.195])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 422uwhfkc1-4;
	Fri, 11 Oct 2024 10:28:14 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2 dtrace 3/3] sched: fix on-cpu firing for kernels < 5.16
Date: Fri, 11 Oct 2024 11:28:10 +0100
Message-ID: <20241011102810.989562-4-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20241011102810.989562-1-alan.maguire@oracle.com>
References: <20241011102810.989562-1-alan.maguire@oracle.com>
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
X-Proofpoint-ORIG-GUID: GlBNDXjMcJQB11nHTvkc-fGAuECpW3mH
X-Proofpoint-GUID: GlBNDXjMcJQB11nHTvkc-fGAuECpW3mH

The solution for sched:::on-cpu firing (probing
__perf_event_task_sched_in) only works on 5.16 and later as
the relevant function is not in available_filter_functions
in earlier kernels.

Instead use the fbt::finish_task_switch*:return probe as this
will cover .isra.0-suffixed optimizations if they are applied
to finish_task_switch().

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_prov_sched.c | 23 ++---------------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/libdtrace/dt_prov_sched.c b/libdtrace/dt_prov_sched.c
index 4fbd24ab..e9a1b0c9 100644
--- a/libdtrace/dt_prov_sched.c
+++ b/libdtrace/dt_prov_sched.c
@@ -28,7 +28,7 @@ static probe_dep_t	probes[] = {
 	{ "off-cpu",
 	  DTRACE_PROBESPEC_NAME,	"rawtp:sched::sched_switch" },
 	{ "on-cpu",
-	  DTRACE_PROBESPEC_NAME,	"fbt::__perf_event_task_sched_in:entry" },
+	  DTRACE_PROBESPEC_NAME,	"fbt:vmlinux:finish_task_switch*:return" },
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

