Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AC3442C
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753866121; cv=none; b=p4ClZrIaUuy9VC8SVBX8aG9BCNZeakZlklAVBqcG/RnR7igI/me4wZJU6abUTq8rMomXFgyylb/W5xvBf2Exot0r/hBVUR+o/wgyvFXsMD1+7naKqrh7QMw8RS4N7MmnJGzE+Jen/EcKwdWrOAayGUzfAARotZcYy4eFe5Mj12k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753866121; c=relaxed/simple;
	bh=XydGrSJW9DTJjDpNvKg30aJ+T6A/D3jq40M7QQaSflI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NN52JzzBNY87ZUCFhkK6kvSaU5PKdpsNXd79KEeHA57CqfVb/7u4t4mrv3CnSGeOIxmUUB/kiUjfk24LwZMj2ADCAxifxkW8NJkmtyNcx3NrpQOBSY7zNl3iir3JrSUekMOi6m8eyjhiTSZ7ZZXy+IVDyksdnVw7PK9srGfP9T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=amhDDHpi; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="amhDDHpi"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U7g5Pj003701
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=yfyIW
	WC7K7/4Y06x7cPGVAKSFq5EPNTLG0n8LwZ6MB4=; b=amhDDHpiGfY6UNx6QqAqx
	zjFfb17qkCmGgiGA/ShTMjQ3hvJrVOf4r3TuWYlVSyDzVMFltDsiv0qQYnuF9L0B
	jOgpi110154+4zYDVTqGm7AhJFOhlqSrZ0JQXVEkB/ZPpSmHc1evFzODB7rY110X
	VOmNXhVIIZsaatzM9Z21BpMhbKC2aa9NDznY/c5BPgxgap4UZlrkZ16HENMfsSXP
	h3cA8nieONMZWPUBx5METRdVi2nUm6UHQLdpnz3IkjI9mx+6qJ4DI2cRR39HZy7e
	kN0cJGf5RPK+lzq0gVvN6tDco63fIREuiv+m6nsJUgOEotCqrx0y9cM0vdaqbRiI
	w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q4e9j3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:01:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56U8khBo038623
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:01:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 484nfapvcw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:01:51 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56U91nIg033990
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 09:01:51 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-51-28.vpn.oracle.com [10.154.51.28])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 484nfapvax-2;
	Wed, 30 Jul 2025 09:01:51 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v7 1/7] usdt: have copy_args() count args while parsing them
Date: Wed, 30 Jul 2025 10:01:42 +0100
Message-ID: <20250730090148.2141954-2-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250730090148.2141954-1-alan.maguire@oracle.com>
References: <20250730090148.2141954-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_03,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507300062
X-Proofpoint-ORIG-GUID: 4U62saPfscjzFWgOqgKiFNpgOgVlA_yl
X-Proofpoint-GUID: 4U62saPfscjzFWgOqgKiFNpgOgVlA_yl
X-Authority-Analysis: v=2.4 cv=QZtmvtbv c=1 sm=1 tr=0 ts=6889df80 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=mS2X3ElE5GbO5w5oFH8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA2MyBTYWx0ZWRfX/lu0/hQADsBA
 YD0ZUs3ZjzlEWCiCq1H8UyUuouv1Z2pm6151YaAzTumq1dFFeO1mckjuPKi0OhjkJ/QkYaF9/Mu
 Sx1ruAYFPCrLlX074MF6B9tAAy+FX97QKrg7+huHmBFT2wmy5S16PRbiblXrf//TnEjvMtR/dCV
 K+On369PwC+egbTi+RcWQDRddFgFSB2jfEYYvA29ez5grdQ0fGibLhW4jvS58wL0stUZ+NPwD67
 ZbTvNt3KIlo/FDpLwuBQr/sNYbqm/yvREOqni+8MoDbJW/j0fH0Yuqc9q3VfDzthHZ3nMHANAKg
 39Rv81FdkPDo4LcZAsl9QaUunr/1vHMa966u1ytGiapJmh0qe8de4kUgWs//9fyEeSQTCHnBKdh
 vRVMyMLCWqaW1+uLS42J7nno0WT2T92Gv6nK4FZDAOLU9ba0oElQEIkmTeSdxVLIPVZqZ6oV

stapsdt probes do not include an argument count, so the only
way to count them is to parse the parameter string.  Adjust
copy_args() to set upp->sargc while parsing upp->sargv.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 8e7aa4b0..b974e94b 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -1153,9 +1153,9 @@ static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
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
@@ -1166,7 +1166,7 @@ static void copy_args(dt_pcb_t *pcb, const dt_uprobe_t *upp)
 
 	assert(pvp != NULL);
 
-	for (i = 0; i < upp->sargc; i++) {
+	for (i = 0; *p != '\0'; i++) {
 		int	ssize, disp, len;
 		char	*reg = NULL;
 		int64_t	val = 0;
@@ -1433,6 +1433,7 @@ static void copy_args(dt_pcb_t *pcb, const dt_uprobe_t *upp)
 			usdt_error(pcb, "Unknown format in arg%d spec", i);
 #endif
 	}
+	upp->sargc = i;
 }
 
 /*
@@ -1453,7 +1454,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	dtrace_hdl_t		*dtp = pcb->pcb_hdl;
 	dt_irlist_t		*dlp = &pcb->pcb_ir;
 	const dt_probe_t	*uprp = pcb->pcb_probe;
-	const dt_uprobe_t	*upp = uprp->prv_data;
+	dt_uprobe_t		*upp = uprp->prv_data;
 	const list_probe_t	*pop;
 	uint_t			lbl_exit = pcb->pcb_exitlbl;
 	dt_ident_t		*usdt_prids = dt_dlib_get_map(dtp, "usdt_prids");
@@ -1527,7 +1528,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	if (upp->flags & PP_IS_RETURN)
 		goto out;
 
-	if (upp->sargc)
+	if (upp->sargv)
 		copy_args(pcb, upp);
 	else
 		dt_cg_tramp_copy_args_from_regs(pcb, 0);
-- 
2.43.5

