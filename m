Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9973828DF06
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 21:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752184777; cv=none; b=k9b9WDfcftJpluC8UAFDlWbaCTduGGC0qrHDkxWwmSwJLuLkmKpPd9CGfx37lVv+Ji5PWYlt1OZUX+SKe3OPluYgj/hHKWQ3oY/IGEOZ3dgaEIR0uFjg8zVjA+RXjLze3kzAe5C2jLiSvaM+cCrq+0pl2qsS8Iu4qbEa7jbYZfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752184777; c=relaxed/simple;
	bh=dAjCkBSb60xvur+Q+FRFsgSgqiJ6+SFxi5IxYfyKq6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GKl3wQ+1NwkfuJoHtUqfmUV6dxKgz1ybdtSSbP8FD0QJFB6GYDAss1Z3LbGUjoKF1UAUMOMQrEsMqEYvXE4eSfasWhVTSn4QpnfPuTHy/S8cMJP0g/QwPU7x2uoaYBhulrsCwTVs9SFcKHTHQ5Z31tnHy+L/j4gFvV2HapriLiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qksSey0u; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qksSey0u"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ALYt5A005511
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 21:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=sOjU6
	AU3/z5tzymv6xb28QOl1ZV2A2hyiFdNg/lFaCU=; b=qksSey0uZGdEjsKevjmyu
	6lIPJQyMUy4nRQRHTUOME1VEmM2IGAQXOd0RAI+bpHXEPpOsvEnqQximmYMVbRRk
	MnugAZ8P1PCYYggU+yEe4ZPApy5hbOpIm8pl4eI21eyNBs9diSV1aJ8WFN7rc60G
	iX5mG5cQIl0Mh4jswKjFVAjT6SEU7vZTG+DIzymtwd6qY3Uj+Gj7viZwXFlL7RIQ
	hvb3RWGNvTuO3jiS1iCXW6JWrYiwEYSlOW8tnSY0PbwFdJe95meDxC58raL1J2YE
	Of0RxIue5fe3PNnV+tmX0wjOEAnRiDlkbOISPRwAOlo9z0GG794lL5FF0cYSTt5s
	Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47tmq68489-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 21:59:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56AJmisE013536
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 21:59:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ptgdmd92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 21:59:33 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56ALxVoE035912
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 21:59:32 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-49-108.vpn.oracle.com [10.154.49.108])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 47ptgdmd7y-2;
	Thu, 10 Jul 2025 21:59:32 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v5 1/6] usdt: have copy_args() count args while parsing them
Date: Thu, 10 Jul 2025 22:59:25 +0100
Message-ID: <20250710215930.82067-2-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250710215930.82067-1-alan.maguire@oracle.com>
References: <20250710215930.82067-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507100185
X-Authority-Analysis: v=2.4 cv=ZvHtK87G c=1 sm=1 tr=0 ts=687037c6 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=mS2X3ElE5GbO5w5oFH8A:9 cc=ntf awl=host:13600
X-Proofpoint-GUID: M_ZaWYuAE5hXWYSDNjJpjD4uGJSnUTSa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDE4NSBTYWx0ZWRfX3iovk5DUh0iZ gBeD5pRDryCGdnLBvPSQdwWsawo7aN2EZIPU8M0Tks7V1z9F6gsdn4P3zTsbwv+Gi66/j4B4048 urQAUkU/2ylzXplXe/uWTJtrISIPU+z/orxweQEXiN/c/MuXmszYX72VZJ69m9qIK1sKzBd11x3
 Uth+WlQRSwG7R0em+BCn7SBvJl0oymQOTWhn0FQc+uzf22xoiIWi/PfcQV20pjisXtDIoPnaJ8M mK+F2+51ggrSh2vCR6hxe9m6I8Ge2a2/4bWv6/EH93wEvqaEoV52gXtPAnMqYnUQzmWOscZ4gNj ScpCgUehcXl7aeSJrvamtFrgjv5q2o+IJhd3S8LOPOYLi1KQz0wjcLZI+cMu8WLkYdH9hqSxrA1
 sWNkrbrvXOo/bB0JP6UI9aHrRVAg54rRS7Qfp2v3uFUiWcXqT8nV3Bk4dJY8+xzeT2Oyu4Rj
X-Proofpoint-ORIG-GUID: M_ZaWYuAE5hXWYSDNjJpjD4uGJSnUTSa

stapsdt probes do not include an argument count, so the only
way to count them is to parse the parameter string.  Adjust
copy_args() to set upp->sargc while parsing upp->sargv.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index cf5cfd43..2cbd8910 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -1145,9 +1145,9 @@ static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
 }
 
 /*
- * Generate code that populates the probe arguments.
+ * Generate code that populates, counts the probe arguments.
  */
-static void copy_args(dt_pcb_t *pcb, const dt_uprobe_t *upp)
+static void copy_args(dt_pcb_t *pcb, dt_uprobe_t *upp)
 {
 	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
 	dt_irlist_t	*dlp = &pcb->pcb_ir;
@@ -1158,7 +1158,7 @@ static void copy_args(dt_pcb_t *pcb, const dt_uprobe_t *upp)
 
 	assert(pvp != NULL);
 
-	for (i = 0; i < upp->sargc; i++) {
+	for (i = 0; strlen(p) > 0; i++) {
 		int	ssize, disp, len;
 		char	*reg = NULL;
 		int64_t	val = 0;
@@ -1425,6 +1425,7 @@ static void copy_args(dt_pcb_t *pcb, const dt_uprobe_t *upp)
 			usdt_error(pcb, "Unknown format in arg%d spec", i);
 #endif
 	}
+	upp->sargc = i;
 }
 
 /*
@@ -1445,7 +1446,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	dtrace_hdl_t		*dtp = pcb->pcb_hdl;
 	dt_irlist_t		*dlp = &pcb->pcb_ir;
 	const dt_probe_t	*uprp = pcb->pcb_probe;
-	const dt_uprobe_t	*upp = uprp->prv_data;
+	dt_uprobe_t		*upp = uprp->prv_data;
 	const list_probe_t	*pop;
 	uint_t			lbl_exit = pcb->pcb_exitlbl;
 	dt_ident_t		*usdt_prids = dt_dlib_get_map(dtp, "usdt_prids");
@@ -1519,7 +1520,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	if (upp->flags & PP_IS_RETURN)
 		goto out;
 
-	if (upp->sargc)
+	if (upp->sargv)
 		copy_args(pcb, upp);
 	else
 		dt_cg_tramp_copy_args_from_regs(pcb, 0);
-- 
2.43.5

