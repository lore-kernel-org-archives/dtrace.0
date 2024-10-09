Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BDE199FB4
	for <dtrace@lists.linux.dev>; Wed,  9 Oct 2024 14:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728482566; cv=none; b=g28OSLSDn59K0awCxotAfzFMvRaS3YG+6FKDtPIXfG7I5LIu3nPFXVFlveA7YhugP51qpoJ/6prJFR3Vv//luJYZHA4cQspZdTRy2YKJa8tHMTa9rWIVKN+R9rVtt6isfX7wYL8yJbcccVOtiYMODIQ3jUU1PDq5lI9O/+/7uh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728482566; c=relaxed/simple;
	bh=+QWu3pBQMGZMZFO0Q1a8wNS2FIqw2sXEnQzRbxDOIBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X1qQM2lg3f2axJV5nzNN8Xnkv84cObk2o3Sy0j1ZtpSq3n50csYz45yUDEbSV3U6ktZAiKDApKXxyoDRvpFhorCowidt6zeiDsWJKOcLgfwa8yFllI4stmBQMbLhITA0qvN+MldtIxg7lIQEzDaAZxkzUMnBpMLh5vnqh6RY2RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aA9NWvK/; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aA9NWvK/"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 499DfmUr030858
	for <dtrace@lists.linux.dev>; Wed, 9 Oct 2024 14:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=hH4vJ
	xlLrmgo1mwvZQiO8Y0PCDSYzjuBrQV3hL5+2uA=; b=aA9NWvK/rey9Af6rBJrqC
	zPEEylYLliT9+C3Hqe+KWipPMpoUmu4gVxdT2z0R4JPuDsmBGRgio31tVoQNpdrC
	2MbFzZUC1dX8Nzd6bXt/3LMCgDvcO7TsS3dw9h9mIh7c5nkj7PAD6v0pfZ1u9GXu
	cYxANMVMjd6lrwLuPT5ZkvEDlJX9o7ScalNgp6Qo/sVb/rhbfZcX2YHsvGX2OISs
	jowc6H75MCkUY0v9O/IyLcIjASAgkO5w0wCV0TJ5I+DmVIjo6A5fUvb9tZyOwMl7
	qgC0i2rANE8uYA9y3qnzGCFZgbuvSdOZNadT2dlxT4ivBUd5VznKFMT1XMfGwcCU
	A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42306egbta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Oct 2024 14:02:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 499CMIqh019185
	for <dtrace@lists.linux.dev>; Wed, 9 Oct 2024 14:02:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 422uwex0m5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Oct 2024 14:02:41 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 499E2bOq010849
	for <dtrace@lists.linux.dev>; Wed, 9 Oct 2024 14:02:40 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-194-86.vpn.oracle.com [10.175.194.86])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 422uwex0gk-4;
	Wed, 09 Oct 2024 14:02:40 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH dtrace 3/3] sched: fix on-cpu firing for kernels < 5.16
Date: Wed,  9 Oct 2024 15:02:36 +0100
Message-ID: <20241009140236.883884-4-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20241009140236.883884-1-alan.maguire@oracle.com>
References: <20241009140236.883884-1-alan.maguire@oracle.com>
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
 malwarescore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410090086
X-Proofpoint-GUID: ornUwmD7u-dezT3Mb8kkcIoeoZANrrVV
X-Proofpoint-ORIG-GUID: ornUwmD7u-dezT3Mb8kkcIoeoZANrrVV

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

