Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD687293B5A
	for <dtrace@lists.linux.dev>; Wed,  9 Jul 2025 14:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752072428; cv=none; b=gg+Vwl8B4hkTJICIOd2a1fG9uu/EYBJ6XBJkwt96ccmpliA787ijL3D34F+KhzZefoXdmCxPY2iX9+er4aE7/uIHBZWcb+4O17wbCJQXn7FiTCBcilH21mljPu3Yw6xAQgx692xL6D7inhXEBnaM8djmhylPjfqzJkRg0zWKKuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752072428; c=relaxed/simple;
	bh=Sh4vipkIbAVc6v12OVup7dJwnHXL+RFSBbT4ZcVSMns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X/65sy5dG0U7GmaILIjlpfXrqn72QFEhf8deI95BvBIyWm6y0EpiDbJ42U9BOajFn9Nm/7XiHtkkQQuZF2u/yPsiEhNBB+yxBVAIKtVTMEypNBNahBoj4Js74fFPSvQ/ASZcisLDk8Pzhw3xB+3pY96gF6Cn+aRntFEmi/Pizdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DzqpzLKr; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DzqpzLKr"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569DZAD5005760
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=5mr4U
	sJ5blxcQtMsOa2mxQErd3bskZbF7sITXvarGQI=; b=DzqpzLKrv4eitvTfBt+G5
	LzHZaPyO3UbZkTMlammKj6NGSbokEFY4ams4LdjzwhdRGyaEGp1q/K1TwxNAJ9gM
	+ZfmmpTtwO1qpjw39aViGOV5VZnuoXVRIkDznZo5TETgwwsoxjBBRTAx5t9e4sbP
	SscHPJwrgOGXLgJDFkvxBAY2dSYSTb60PvCdcTOvN1ti/jzaaPpNA2EQ/YXt+0jY
	x13W1IBYAmqtUuBJTysQlnLEB2gp4z4uYevCmRdSgdZTbPt+r1PU1mwHOhHrw6Jv
	uc5lKHL+eXgi6ttHYtZRhuUJE7NBofDmU3QU3GzbERTEeVIzfG8QrwB6fAVq5+4/
	Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ss85g8np-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 14:47:05 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 569EFJJR023596
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:47:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ptgbany7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 14:47:04 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 569Ek38Q034091
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:47:04 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-63-52.vpn.oracle.com [10.154.63.52])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47ptgbanwh-2;
	Wed, 09 Jul 2025 14:47:03 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>,
        Eugene Loh <eugene.loh@oracle.com>
Subject: [PATCH v4 1/7] cg: move get_member() to dt_cg.c
Date: Wed,  9 Jul 2025 15:46:54 +0100
Message-ID: <20250709144700.20591-2-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250709144700.20591-1-alan.maguire@oracle.com>
References: <20250709144700.20591-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_03,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=997 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507090133
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDEzMyBTYWx0ZWRfX01Df9P6jFFpx 4HalMiHy6QyOsuqQYYz3+NsLgPSIQCpoHMhRHaGpBSQwi/RNw2EN6E7hIBdqUXW6sLpSx6ETgWB jFmzcF0oLEoPiUAgpEq16jTw5pqTMCpZ7EX1rkCeArFvtHNJ9vrQJSTdCoZjxt7wDT3gM4JsvVr
 aYBDnVyoJwUu9KxBm1jRKUSmw9tEFLHBP0XBJmLC5Kfi9jMyxSaDdS3Uqo8yuB6Op48jNTCNfmr yq823rWyu33Yfy6wGbsX9L1fk1TUu7XCA0JOfwmr5zQyKoTaq1g/CqVcK3htq6F6BgEZmK0U4QK BsbJTgZCpDulRNnslZAdoIEoWTx45BfTwt2JP3w4JnILkUUMGuofGyWnWC502QqgN8sb3mwpW8s
 UmydMix+9TFb7+UwkxfX0V85PDliFCu3omgFmjL+LjZPG5uOUodkYFJOBzxX4nkHarEuwjm7
X-Authority-Analysis: v=2.4 cv=a+Qw9VSF c=1 sm=1 tr=0 ts=686e80e9 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=1bOlLxNdFkaxJKR0TgMA:9
X-Proofpoint-ORIG-GUID: mPjJ0S7g3G6FzJXFhN5LssBicqad_GXf
X-Proofpoint-GUID: mPjJ0S7g3G6FzJXFhN5LssBicqad_GXf

It will be used by both dt_prov_ip.c and dt_prov_tcp.c.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_cg.c      | 39 ++++++++++++++++++++++++++++++++++++
 libdtrace/dt_cg.h      |  2 ++
 libdtrace/dt_prov_ip.c | 45 ++++--------------------------------------
 3 files changed, 45 insertions(+), 41 deletions(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index bd0763d6..d6fc8259 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -1901,6 +1901,45 @@ dt_cg_ctf_offsetof(const char *structname, const char *membername,
 	return (ctm.ctm_offset / NBBY);
 }
 
+/*
+ * Retrieve the value of a member in a given struct.
+ *
+ * Entry:
+ *	reg = TYPE *ptr
+ *
+ * Return:
+ *	%r0 = ptr->member
+ * Clobbers:
+ *	%r1 .. %r5
+ */
+int
+dt_cg_get_member(dt_pcb_t *pcb, const char *name, int reg,
+		 const char *member)
+{
+	dtrace_hdl_t		*dtp = pcb->pcb_hdl;
+	dt_irlist_t		*dlp = &pcb->pcb_ir;
+	dtrace_typeinfo_t	tt;
+	ctf_membinfo_t		ctm;
+	size_t			size;
+	uint_t			ldop;
+
+	if (dtrace_lookup_by_type(dtp, DTRACE_OBJ_KMODS, name, &tt) == -1 ||
+	    ctf_member_info(tt.dtt_ctfp, tt.dtt_type, member, &ctm) == CTF_ERR)
+		return -1;
+
+	ldop = dt_cg_ldsize(NULL, tt.dtt_ctfp, ctm.ctm_type, &size);
+
+	emit(dlp, BPF_MOV_REG(BPF_REG_3, reg));
+	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, ctm.ctm_offset / NBBY));
+	emit(dlp, BPF_MOV_IMM(BPF_REG_2, size));
+	emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
+	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_BASE));
+	emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel]));
+	emit(dlp, BPF_LOAD(ldop, BPF_REG_0, BPF_REG_FP, DT_TRAMP_SP_BASE));
+
+	return 0;
+}
+
 static void
 dt_cg_act_breakpoint(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
 {
diff --git a/libdtrace/dt_cg.h b/libdtrace/dt_cg.h
index 81b79399..36f587d3 100644
--- a/libdtrace/dt_cg.h
+++ b/libdtrace/dt_cg.h
@@ -44,6 +44,8 @@ extern void dt_cg_tramp_epilogue_advance(dt_pcb_t *pcb, dt_activity_t act);
 extern void dt_cg_tramp_error(dt_pcb_t *pcb);
 extern int dt_cg_ctf_offsetof(const char *structname, const char *membername,
 			      size_t *sizep, int relaxed);
+extern int dt_cg_get_member(dt_pcb_t *pcb, const char *name, int reg,
+			    const char *member);
 extern uint_t dt_cg_ldsize(dt_node_t *dnp, ctf_file_t *ctfp, ctf_id_t type,
 			 ssize_t *ret_size);
 extern uint_t bpf_ldst_size(ssize_t size, int store);
diff --git a/libdtrace/dt_prov_ip.c b/libdtrace/dt_prov_ip.c
index c4a3a6e2..37f91e3d 100644
--- a/libdtrace/dt_prov_ip.c
+++ b/libdtrace/dt_prov_ip.c
@@ -62,43 +62,6 @@ static int populate(dtrace_hdl_t *dtp)
 			       probe_args, probes);
 }
 
-/*
- * Retrieve the value of a member in a given struct.
- *
- * Entry:
- *	reg = TYPE *ptr
- *
- * Return:
- *	%r0 = ptr->member
- * Clobbers:
- *	%r1 .. %r5
- */
-static int get_member(dt_pcb_t *pcb, const char *name, int reg,
-		      const char *member) {
-	dtrace_hdl_t		*dtp = pcb->pcb_hdl;
-	dt_irlist_t		*dlp = &pcb->pcb_ir;
-	dtrace_typeinfo_t	tt;
-	ctf_membinfo_t		ctm;
-	size_t			size;
-	uint_t			ldop;
-
-	if (dtrace_lookup_by_type(dtp, DTRACE_OBJ_KMODS, name, &tt) == -1 ||
-	    ctf_member_info(tt.dtt_ctfp, tt.dtt_type, member, &ctm) == CTF_ERR)
-		return -1;
-
-	ldop = dt_cg_ldsize(NULL, tt.dtt_ctfp, ctm.ctm_type, &size);
-
-	emit(dlp, BPF_MOV_REG(BPF_REG_3, reg));
-	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, ctm.ctm_offset / NBBY));
-	emit(dlp, BPF_MOV_IMM(BPF_REG_2, size));
-	emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
-	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_BASE));
-	emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel]));
-	emit(dlp, BPF_LOAD(ldop, BPF_REG_0, BPF_REG_FP, DT_TRAMP_SP_BASE));
-
-	return 0;
-}
-
 /*
  * Generate a BPF trampoline for a SDT probe.
  *
@@ -142,7 +105,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 
 	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_6));
 
-	get_member(pcb, "struct sk_buff", BPF_REG_6, "sk");
+	dt_cg_get_member(pcb, "struct sk_buff", BPF_REG_6, "sk");
 	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
 
 	/*
@@ -150,11 +113,11 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	 *	skb_network_header(skb)	=	(include/linux/ip.h)
 	 *	skb->head + skb->network_header	(include/linux/skbuff.h)
 	 */
-	get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
+	dt_cg_get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
 	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
 	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
 	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(5), BPF_REG_0));
-	get_member(pcb, "struct sk_buff", BPF_REG_6, "network_header");
+	dt_cg_get_member(pcb, "struct sk_buff", BPF_REG_6, "network_header");
 	emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
 	emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
 	emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(5), BPF_REG_0));
@@ -168,7 +131,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	else
 		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(5), 0));
 
-	get_member(pcb, "struct sk_buff", BPF_REG_6, "dev");
+	dt_cg_get_member(pcb, "struct sk_buff", BPF_REG_6, "dev");
 	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(3), BPF_REG_0));
 
 	return 0;
-- 
2.39.3

