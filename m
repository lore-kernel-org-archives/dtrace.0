Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19185238C26
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 10:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750673597; cv=none; b=GQatfRUF3BDHETuKLge3K9P17ca1Sv7ttzFGK8VYwlsTI64Cj+McG5xSa3zJQXpEhQbCObNV1WJtbfIxenrgrdOss3oMO/WaX7LF+KG3+aU8IjxLcwzBvuwWoyUvs38CauJAOoULitp1xs5JYn2P51suvlUaMZW33e5Lm28e2pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750673597; c=relaxed/simple;
	bh=dAjCkBSb60xvur+Q+FRFsgSgqiJ6+SFxi5IxYfyKq6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EcN5HyM0vGOH4N1QYNHLk+KAPEUyTyFAUSWLwm3LEGL0fkYBym/KKs6w4dnXedF83eF5GQE5ZXSpMtcI4Wy3RB2Ly+/iwulvS7FM5DAthULP+wCSzMjymwdt2rpdeKP48NKz5f2x5KlSjD/ygQk1eXsdfKKHXoFqDer8D3W3Zt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fv/ODF3s; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fv/ODF3s"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N8pQBL027107
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 10:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=sOjU6
	AU3/z5tzymv6xb28QOl1ZV2A2hyiFdNg/lFaCU=; b=fv/ODF3sEq/lyJ9oTKbqq
	oqw0BLpglh3b+K1/rEqvyeSUPsRPzkz4b7+dLJma5Z32dMsR3rPKLFIPC+LVhVJH
	10kOdjxkvCZr95iULkmTkAQO+Yz0rnKhtFFTIN2pINE1EQQX2uWKRBuTMEsc6slE
	Fo/B3mtQypIhRonODT3acRiGSyCRUejowJsK6k4+VtLZdSUZd9m5yw7wccJaemP0
	a2l+vIj3wlRNfkGaCto9Yi4zbm01GQl/ztoHgCKJ2eL6+6JKVLKqBsvFs3qOUYvr
	2UcwLkrDB2Gbud1bECd04JWooyydVGlmIR7UNH2lJJIXImglF4zkEy1liq0rLADw
	Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8mtcap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 10:13:14 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9k5GW006903
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 10:13:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq25ed4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 10:13:14 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55NADCnl007270
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 10:13:13 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-58-219.vpn.oracle.com [10.154.58.219])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47ehq25ebq-2;
	Mon, 23 Jun 2025 10:13:13 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v4 1/5] usdt: have copy_args() count args while parsing them
Date: Mon, 23 Jun 2025 11:13:06 +0100
Message-ID: <20250623101310.1649756-2-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250623101310.1649756-1-alan.maguire@oracle.com>
References: <20250623101310.1649756-1-alan.maguire@oracle.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506230060
X-Authority-Analysis: v=2.4 cv=IcWHWXqa c=1 sm=1 tr=0 ts=685928bb cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=mS2X3ElE5GbO5w5oFH8A:9
X-Proofpoint-ORIG-GUID: fI935hZabnV0cBmt1p-_0BPwAp-vVzoy
X-Proofpoint-GUID: fI935hZabnV0cBmt1p-_0BPwAp-vVzoy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2MCBTYWx0ZWRfX0ANgR76uyyV5 FAGznJKv9U4RwcaSMX0xbnZVjsEp7hairXYxaRThw2XBIzwJrIxFPdXmY1efkLXJAkT+rOqOpmz ZZtpllNWonEC9TNvxyJ7Ozia876v5Y3PP0MXGsLPUsZCeerU1I1GG0uD725YKnLwnX92+oAR+Z/
 TVaTNJ9kJyG4cXQcZefGHVwKng2bOhDn8ccYjhWhVcYAvW9G3eMquwM/Cl+jVRJfDcBkOhX3kX1 QuoszWaEYKOb4h71GYt0ztpkbwon92KFPewYlkmnGwXvSMxG5jWmfewOz/7iweJSa8zPcmBTzQ4 UtsuFA4l6dwIB31I5AvfRm0xtFaSmEWhr6JHLfaUY8w9pILFTM+Pw/dcbW5n9FSku88dFIetNTL
 vAn96eZquE6eC0yIX85ATkkU4dgY7ZTqJ4T1puxpE/lGNqgN8KvqR38r0iUkqLxPHZMJZWIV

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

