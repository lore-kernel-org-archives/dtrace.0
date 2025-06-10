Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1531123ABB5
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 13:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563899; cv=none; b=gLr850wro5ZI83wE/HKDxGrG8sojuXE8SZiF6cnwXCWiiIlkvL52kPOKbtQ3YTAXcmAVEtOzRLorUzr189dIV2v8d2ipBuR4BjWUr1UXiLN3bEbLnCgdPRs/jypSp0a8aCPB75oPapM7so8yJQcq0jlSVH7y2X9aiLz9IVZU67k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563899; c=relaxed/simple;
	bh=Hz1pj157N1xWUlh1kBvYYZEJZ/Wo4DKqOWIDIbbX0Gk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UXaGM4tF+sPhsjrAq+3/Rntr3o8u1siej4VHNugTeYSFXPclPvI3W4LBx0GwJroH6Yc1jwBThNuTM2tN3+W4rmvbVI4CrLHHV9EnaV3BN3kRjxDaWo0OdPar3iCPipprm2z6lsCLQSi5n5pK6ACpk/BybPXIBclGO6P6IEUogS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hDEWnjMo; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hDEWnjMo"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ADBw00008729
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 13:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=odxow
	JaeRVxnGdeQTd9lOtnzlyTzv4RCy70NanCVdK8=; b=hDEWnjMoonfkFYc6MLktM
	AbzEd57J3GlzhcY4mieiBfHlzysOH9Kqow4j7hjknGGWItmCzgjQEqI6mqR/FcZ0
	XHzBBpttN9iYInlwdMdZuKc+k02nxdAJGLZ+FyMlr0HT8d9YCELwbyZvA19+N3Ge
	+V4Di/PYPh4BDMA/X3naMMX44Fa3wUwaaZGtOcvJmCRnmIALAQLy/09S2vRlJCqY
	G711qdP4C1gIhkm5XNkBpIeogERiSkVh9LxQG5wgpf4Rw4diolNIM3YuNbd9y481
	yCxqvsKk+LgCcXUZqQ74+7+X23W377jW4mg8hcJkxbBA8VMRZWKprFL+0X5VWIKZ
	Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474buf4ars-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 13:58:16 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55ADBmxu004011
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 13:58:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv8s9gn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 13:58:16 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55ADwEle009385
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 13:58:15 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-54-217.vpn.oracle.com [10.154.54.217])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 474bv8s9f6-2;
	Tue, 10 Jun 2025 13:58:15 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2 1/4] dtrace: move get_member() to dt_cg.c
Date: Tue, 10 Jun 2025 14:58:10 +0100
Message-ID: <20250610135813.15746-2-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250610135813.15746-1-alan.maguire@oracle.com>
References: <20250610135813.15746-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=902 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506100110
X-Authority-Analysis: v=2.4 cv=RZGQC0tv c=1 sm=1 tr=0 ts=684839f8 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=1bOlLxNdFkaxJKR0TgMA:9 cc=ntf awl=host:14714
X-Proofpoint-GUID: j9QtTrpnlE2QKVJGXad3hm4_ziOTI_JS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDExMCBTYWx0ZWRfXwJl/NV5TOqhg UiC8KV7l4DBm2qV/SNZuqVl5eUv0rVf1nYHyhJN7QN7Ad+9esJ2RbB+6cMsEe9WE4VpNS66wyko Pjn+BLO+PlqmZwsdqmU63/EA6xtFZtkuK+zN/kZ9Axhok6TBAS1cHFFhdjDp864uQGQX+dbjPgP
 0GKmJmpzrQD7OkHIglweaVOjcff/z/JJRyEuVNFJoevfUvCGXlpuQX+8GLhYY7Gm+z2ANDcuRaz PjRismEthJeZkAa9KIi3Mr2k8LRRcryXXjoGbnCN8ejgYCGysbl4FJgcq7/32i1zfSSVuQDl9Km FxSuS+hFBq4BJCOXsy4TC8RFiao8WO4YeQWtfN2NAUbRF8ZkFoHssYyYjwAi/go73iRlsTA7AJO
 jgHfTNJhXXStH9lpZKVxfA+yMBgqBFdP8SlvvQRUmUSetA6KyrqXUbcEyL/d5Wd4JvxOCm+F
X-Proofpoint-ORIG-GUID: j9QtTrpnlE2QKVJGXad3hm4_ziOTI_JS

It will be used by both dt_prov_ip.c and dt_prov_tcp.c.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_cg.c      | 39 ++++++++++++++++++++++++++++++++++++
 libdtrace/dt_cg.h      |  2 ++
 libdtrace/dt_prov_ip.c | 45 ++++--------------------------------------
 3 files changed, 45 insertions(+), 41 deletions(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index c68a5d45..ad761d3b 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -1901,6 +1901,45 @@ dt_cg_ctf_offsetof(const char *structname, const char *membername,
 	return (ctm.ctm_offset / NBBY);
 }
 
+/*
+ * Retrieve the value of a member in a given struct.
+ *
+ * Entry:
+ *      reg = TYPE *ptr
+ *
+ * Return:
+ *      %r0 = ptr->member
+ * Clobbers:
+ *      %r1 .. %r5
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
index fb26c125..c4aa610a 100644
--- a/libdtrace/dt_cg.h
+++ b/libdtrace/dt_cg.h
@@ -43,6 +43,8 @@ extern void dt_cg_tramp_epilogue_advance(dt_pcb_t *pcb, dt_activity_t act);
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

