Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FB0218ABD
	for <dtrace@lists.linux.dev>; Mon, 28 Jul 2025 16:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753720580; cv=none; b=diYewM0doyMdMIkTC9TYd1A2iYzJSCkIW6aH+bLpxEG3m92jJCWehXtPPxqSfLPa6hRaQOnvkynF50XoNHj+UwrYVhpW5nrxNB4T2kz8kRJ11O1RPB5GjgpNo98llfyLcRNkxYD4hJDguWPK4anf0TDIxwmzSKl0qMaaaxch7BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753720580; c=relaxed/simple;
	bh=N2MFLA+oz3kvbVNHBW9dBOAoR1dPEm2cO/J/1YRA0aY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tFrn+04XDbSWo0Mp2YnzpHCcNULQsk0SqdvsDHbYipy5SUtmnnxKef8Oaapc9FKLqy3chxRpMXmwpNkdSoe0rjoRErwktTSLXrrW1TUL/k1GocZzhogb2tPYdXNvHfoCYIT+VulYrU9ckgdYCy+/f1DUD+JD2N0nqqAijx5C6Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=n24VbpEE; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="n24VbpEE"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SFfnJI018345
	for <dtrace@lists.linux.dev>; Mon, 28 Jul 2025 16:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=9R1S1
	Zr3biTs1KEzUJpie8oW5YpjUWSvr4z6ZJHKsbw=; b=n24VbpEElT+P0+0Cmns5F
	iRfCrHjrZGuUpnCOHSrPNNLOl4kt/m4HQSlqQHHXbHqgwO2l0Tf4f/9fuX92YtoO
	tfV+lSfb5pjD1IXysD2SmtjL1DNEZJAfGBicV4DnVKg8UwVyeS49dfuArHq8lAWz
	kw+VTvSTZgXbHZwUm+bCYpLHYOciF8RvMO8Z6Xj2g2RUC3nHDwrIrhkNEajGHVss
	7P+d9rdPU6sgq9Pylkey8DagE7dch1AeIAh99A+sDW1nLoKK/lBOf1SyvzGXhnZA
	0JaNJ/Ve3ZXNZ+kNRjr66IUSnA4O6FE9V7CNIzvJ9UFDxCYQ7fr8h8AqlrBqU2cS
	w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q72ws5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Jul 2025 16:36:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56SFL38X037805
	for <dtrace@lists.linux.dev>; Mon, 28 Jul 2025 16:36:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 484nf8kevg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Jul 2025 16:36:16 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56SGaEgr007818
	for <dtrace@lists.linux.dev>; Mon, 28 Jul 2025 16:36:15 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-50-230.vpn.oracle.com [10.154.50.230])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 484nf8kesj-2;
	Mon, 28 Jul 2025 16:36:15 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v6 1/7] usdt: have copy_args() count args while parsing them
Date: Mon, 28 Jul 2025 17:36:05 +0100
Message-ID: <20250728163611.1570773-2-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250728163611.1570773-1-alan.maguire@oracle.com>
References: <20250728163611.1570773-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507280122
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDEyMiBTYWx0ZWRfXzVmsn7aWPZEA
 /qVHcH/hB3o7hk55cffdeHEBfPNhuPC9PGjojgXGIHW4T6B2iGemy7rXEsCqj197ebY6SvTlZXc
 Z8m/muC2JB0sPg7/4bXfzb0Zhgykm+SEGFa4+cH9jqIS8cSR9gPfKbwALxGWI6AYdSrAC5qL4LD
 bFyqVgQo2UlH7Z1TOirsrpxP+fL3dQn1w4xyAnqBZdgXVmOLk6/xZtjEGr/uaLwsG/V1eepyQ3t
 wPjhoS1065rR5x/njIrg1+XzBKEnrs0cAf0IYBhxmaXGyU2YSHyphp4NnC47JYXiDTUaCiamL+Y
 sOhCVlpe25QGIqjnhApRCFeXtoVK9Nv7Muiq1CpvXeTC4gMPIn+FrJFsK89+sruFWkA6tEPGKKi
 pMMvFiGMWOGcTfLgRtH8H0DD95NRXDmU3rwwNYQnoxVwkKKbbM2xDAzMb2rbaNyRowfdvw/M
X-Authority-Analysis: v=2.4 cv=ZO3XmW7b c=1 sm=1 tr=0 ts=6887a701 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=mS2X3ElE5GbO5w5oFH8A:9
X-Proofpoint-GUID: Rev_45WrXdLiiLbWiOvEjJ_BO8m1JGRr
X-Proofpoint-ORIG-GUID: Rev_45WrXdLiiLbWiOvEjJ_BO8m1JGRr

stapsdt probes do not include an argument count, so the only
way to count them is to parse the parameter string.  Adjust
copy_args() to set upp->sargc while parsing upp->sargv.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index f60bdceb..99b97b75 100644
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
+	for (i = 0; *p != '\0'; i++) {
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
2.39.3

