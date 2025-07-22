Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B8A2BE7B6
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753178877; cv=none; b=Nc6Yauthi/0m6WgcjTYbORnxMK5fnUDrX2GSkDrSnENUKbks5CQWBFj/Bu5YEsYLheWf9f6Nvb6xccpzQuyJhfowq6IPHKn9oDorsNTIchTFmevdQdy4TRKK2YvoX9mS0lkTMvRO9YIGTZQDOnGxgsqF4wZjK70dNIswGnkFsZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753178877; c=relaxed/simple;
	bh=jLwjRjg2dAOqIfgOM5ucWjIx9tCcCBtBXW74H/537Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NsWJ57wjD/gXhQlA99XnNXSO1RacYS+gWP8b/RyPZKnHQzTWZ5zHNK0aaPPjFvxr9V4Mn85PChqBhohn5nBn0biEGWnIrZccU2V+WOPnSk80unu2c8q2NMUcPj4rxTZ4p8Qqe6fK7fEy26D7yvazcYeqBZu5ZoVeebXVy9oL5h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=D4sba6I9; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="D4sba6I9"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M5TCx4029312
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=0ySNk
	cdhjX5RODzkvBwM0yX8iMY8Bv7DLT/tOtPN1Gs=; b=D4sba6I9kuGflWyeCWUI/
	pNrjswNH0dx8wxGEo/HE8dcTHD6fMUj1nHo8V922ywS758RewaL6DenkuqlZkq8E
	sDusgv19W+0GDIIFi1wHFtOWMF6J7sHTVmfHxBQcV/vQ7moqMmsv6qC1jawfYuiJ
	9auPHc7jWpWuXyJ+Ik+aUU6Mc/u6zbNySo+YYwPw7qX2FTqibtWvX0nAjTfF+VSe
	VpPyJFbfIGJisRRadBtzDk+CdyIlmKAVYpM2hx1MFYf/7uS/U+6+5/U7w5YZMNk9
	+yZuTynwHNsZBAWaaDT2Ri3XrQXZ78mheQtfBkZb+EnDMh9v/pskF+XkJ8YRfbN5
	A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805gpn0ac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:07:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56M99ijl011509
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:07:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801t940gs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:07:52 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56MA7o69011213
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:07:52 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-50-138.vpn.oracle.com [10.154.50.138])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4801t940f1-2;
	Tue, 22 Jul 2025 10:07:52 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>,
        Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH v5 1/6] cg: refactor get_member() to use dt_cg_ctf_offsetof
Date: Tue, 22 Jul 2025 11:07:44 +0100
Message-ID: <20250722100749.233821-2-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250722100749.233821-1-alan.maguire@oracle.com>
References: <20250722100749.233821-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0
 mlxlogscore=904 bulkscore=0 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507220083
X-Authority-Analysis: v=2.4 cv=TfGWtQQh c=1 sm=1 tr=0 ts=687f62f9 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=zpN_kqVs7Qq-kE_EGE4A:9
X-Proofpoint-GUID: f4BNyuvKYQTbVFlHO09NfJ0XBFeITzaY
X-Proofpoint-ORIG-GUID: f4BNyuvKYQTbVFlHO09NfJ0XBFeITzaY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA4NCBTYWx0ZWRfX6cVeG8gU1lWO
 6kq527geab/j8TlRW7KEsuvrEWAdJfhJ/QeFfDxWb6OncIDSOJlSPaqFj39NJFgJeWqQtemXbl9
 oKFDBibsRRzwPgEunP0UKbCvqzigr0iHp2IqOeWvW5iS+OnwwAy2GGC3nGRV0el8NKKl/Gu8zXy
 mNZGqpUrB6XEDmWFW5ZxcrBsYByPfsi330e0aL9HvCMpBK1z/Ou9Nj+LgdHnyhxXpatUFiJ1N4h
 GMN+xl1SXayfXWu04d3qbjjCnDoE8eHUjXed9R1H04X8SQo+XtVQCmO2YzJ1osSHZeAbTtb/bhR
 zKq9OuP0Bla0ihmk889C2yNVFHDy+GDysW8kWv04gE18Nx+CAvkf3cynn0qb7/kguhpcRQrm++v
 z0bHeCmakJR5azAlRcwKxy2yV6lN5zW7BjI3ehCVwV1+RViMpiSXbzff7wKR5/2imuTrtJaz

Add an optional ldopp parameter to support retrieving load size.

and rename get_member() to dt_cg_tramp_get_member() as it is
intended for trampoline context.

It will be used by both dt_prov_ip.c and dt_prov_tcp.c.

Co-developed-by: Kris Van Hees <kris.van.hees@oracle.com>
Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_cg.c          | 57 ++++++++++++++++++++++----
 libdtrace/dt_cg.h          |  4 +-
 libdtrace/dt_prov_io.c     | 84 +++++++++++++++++++-------------------
 libdtrace/dt_prov_ip.c     | 45 ++------------------
 libdtrace/dt_prov_proc.c   |  4 +-
 libdtrace/dt_prov_sched.c  |  2 +-
 libdtrace/dt_prov_uprobe.c |  4 +-
 7 files changed, 102 insertions(+), 98 deletions(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 0607cd4e..80d8c8e3 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -1893,7 +1893,7 @@ dt_cg_clsflags(dt_pcb_t *pcb, dtrace_actkind_t kind, const dt_node_t *dnp)
  */
 int
 dt_cg_ctf_offsetof(const char *structname, const char *membername,
-		   size_t *sizep, int relaxed)
+		   size_t *sizep, uint_t *ldopp, int relaxed)
 {
 	dtrace_typeinfo_t sym;
 	ctf_file_t *ctfp;
@@ -1913,12 +1913,51 @@ dt_cg_ctf_offsetof(const char *structname, const char *membername,
 		longjmp(yypcb->pcb_jmpbuf, EDT_NOCTF);
 	}
 
-	if (sizep)
-		*sizep = ctf_type_size(ctfp, ctm.ctm_type);
+	if (sizep || ldopp) {
+		uint_t ldop;
+
+		ldop = dt_cg_ldsize(NULL, ctfp, ctm.ctm_type, sizep);
+		if (ldopp)
+			*ldopp = ldop;
+	}
 
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
+void
+dt_cg_tramp_get_member(dt_pcb_t *pcb, const char *name, int reg,
+		       const char *member)
+{
+	dtrace_hdl_t		*dtp = pcb->pcb_hdl;
+	dt_irlist_t		*dlp = &pcb->pcb_ir;
+	int			offset;
+	size_t			size;
+	uint_t			ldop;
+
+	offset = dt_cg_ctf_offsetof(name, member, &size, &ldop, 0);
+	if (offset ==  -1)
+		return;
+
+	emit(dlp, BPF_MOV_REG(BPF_REG_3, reg));
+	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, offset));
+	emit(dlp, BPF_MOV_IMM(BPF_REG_2, size));
+	emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
+	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_BASE));
+	emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel]));
+	emit(dlp, BPF_LOAD(ldop, BPF_REG_0, BPF_REG_FP, DT_TRAMP_SP_BASE));
+}
+
 static void
 dt_cg_act_breakpoint(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
 {
@@ -2210,7 +2249,7 @@ dt_cg_act_pcap(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
 	 */
 	dt_cg_node(addr, dlp, drp);
 
-	off = dt_cg_ctf_offsetof("struct sk_buff", "len", NULL, 0);
+	off = dt_cg_ctf_offsetof("struct sk_buff", "len", NULL, NULL, 0);
 
 	if (dt_regset_xalloc_args(drp) == -1)
 		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
@@ -2230,7 +2269,7 @@ dt_cg_act_pcap(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
 	emit(dlp,  BPF_LOAD(BPF_DW, lenreg, BPF_REG_FP, DT_STK_SP));
 	emit(dlp,  BPF_LOAD(BPF_W, lenreg, lenreg, 0));
 
-	off = dt_cg_ctf_offsetof("struct sk_buff", "data_len", NULL, 0);
+	off = dt_cg_ctf_offsetof("struct sk_buff", "data_len", NULL, NULL, 0);
 
 	if (dt_regset_xalloc_args(drp) == -1)
 		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
@@ -2253,7 +2292,7 @@ dt_cg_act_pcap(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
 		   BPF_STORE(BPF_W, BPF_REG_9, size_off, lenreg));
 
 	/* Copy the packet data to the output buffer. */
-	off = dt_cg_ctf_offsetof("struct sk_buff", "data", NULL, 0);
+	off = dt_cg_ctf_offsetof("struct sk_buff", "data", NULL, NULL, 0);
 
 	if (dt_regset_xalloc_args(drp) == -1)
 		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
@@ -4977,11 +5016,11 @@ dt_cg_uregs(unsigned int idx, dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp
 			char *memnames[] = { "ds", "es", "fsbase", "gsbase", "trap_nr" };
 
 			/* Look up task->thread offset. */
-			offset = dt_cg_ctf_offsetof("struct task_struct", "thread", NULL, 0);
+			offset = dt_cg_ctf_offsetof("struct task_struct", "thread", NULL, NULL, 0);
 
 			/* Add the thread->member offset. */
 			offset += dt_cg_ctf_offsetof("struct thread_struct",
-						     memnames[idx - 21], &size, 0);
+						     memnames[idx - 21], &size, NULL, 0);
 
 			/* Get task. */
 			if (dt_regset_xalloc_args(drp) == -1)
@@ -5051,7 +5090,7 @@ dt_cg_uregs(unsigned int idx, dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp
 		/* Copy contents at task->stack to %fp+DT_STK_SP (scratch space). */
 		emit(dlp, BPF_MOV_REG(BPF_REG_3, BPF_REG_0));
 		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3,
-		    dt_cg_ctf_offsetof("struct task_struct", "stack", NULL, 0)));
+		    dt_cg_ctf_offsetof("struct task_struct", "stack", NULL, NULL, 0)));
 		emit(dlp, BPF_MOV_IMM(BPF_REG_2, sizeof(uint64_t)));
 		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_FP, DT_STK_SP));
 		emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel]));
diff --git a/libdtrace/dt_cg.h b/libdtrace/dt_cg.h
index 81b79399..3d8d6a9f 100644
--- a/libdtrace/dt_cg.h
+++ b/libdtrace/dt_cg.h
@@ -43,7 +43,9 @@ extern void dt_cg_tramp_epilogue(dt_pcb_t *pcb);
 extern void dt_cg_tramp_epilogue_advance(dt_pcb_t *pcb, dt_activity_t act);
 extern void dt_cg_tramp_error(dt_pcb_t *pcb);
 extern int dt_cg_ctf_offsetof(const char *structname, const char *membername,
-			      size_t *sizep, int relaxed);
+			      size_t *sizep, uint_t *ldopp, int relaxed);
+extern void dt_cg_tramp_get_member(dt_pcb_t *pcb, const char *name, int reg,
+				   const char *member);
 extern uint_t dt_cg_ldsize(dt_node_t *dnp, ctf_file_t *ctfp, ctf_id_t type,
 			 ssize_t *ret_size);
 extern uint_t bpf_ldst_size(ssize_t size, int store);
diff --git a/libdtrace/dt_prov_io.c b/libdtrace/dt_prov_io.c
index 823904d7..fc45870c 100644
--- a/libdtrace/dt_prov_io.c
+++ b/libdtrace/dt_prov_io.c
@@ -181,7 +181,7 @@ static void io_nfs_args_v1(dt_pcb_t *pcb, dt_irlist_t *dlp, uint_t exitlbl,
 	dt_cg_tramp_get_var(pcb, "this->-io-bio", 1, BPF_REG_6);
 
 	/* Fill in bi_opf */
-	off = dt_cg_ctf_offsetof("struct bio", "bi_opf", &siz, 0);
+	off = dt_cg_ctf_offsetof("struct bio", "bi_opf", &siz, NULL, 0);
 	siz = bpf_ldst_size(siz, 1);
 	if (strstr(uprb, "read"))
 		emit(dlp, BPF_STORE_IMM(siz, BPF_REG_6, off, REQ_OP_READ));
@@ -198,13 +198,13 @@ static void io_nfs_args_v1(dt_pcb_t *pcb, dt_irlist_t *dlp, uint_t exitlbl,
 		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(2)));
 	} else {
 		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(1)));
-		off = dt_cg_ctf_offsetof("struct nfs_pgio_header", "res", NULL, 0)
-		    + dt_cg_ctf_offsetof("struct nfs_pgio_res", "count", &siz, 0);
+		off = dt_cg_ctf_offsetof("struct nfs_pgio_header", "res", NULL, NULL, 0)
+		    + dt_cg_ctf_offsetof("struct nfs_pgio_res", "count", &siz, NULL, 0);
 		deref_r3(dlp, exitlbl, off, siz, BPF_REG_0);
 	}
 
-	off = dt_cg_ctf_offsetof("struct bio", "bi_iter", NULL, 0)
-	    + dt_cg_ctf_offsetof("struct bvec_iter", "bi_size", &siz, 0);
+	off = dt_cg_ctf_offsetof("struct bio", "bi_iter", NULL, NULL, 0)
+	    + dt_cg_ctf_offsetof("struct bvec_iter", "bi_size", &siz, NULL, 0);
 	siz = bpf_ldst_size(siz, 1);
 	emit(dlp, BPF_STORE(siz, BPF_REG_6, off, BPF_REG_0));
 
@@ -218,25 +218,25 @@ static void io_nfs_args_v1(dt_pcb_t *pcb, dt_irlist_t *dlp, uint_t exitlbl,
 		/* use hdr->inode, hdr is arg1 */
 		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(1)));
 
-		off = dt_cg_ctf_offsetof("struct nfs_pgio_header", "inode", &siz, 0);
+		off = dt_cg_ctf_offsetof("struct nfs_pgio_header", "inode", &siz, NULL, 0);
 		deref_r3(dlp, exitlbl, off, siz, BPF_REG_3);
 	}
 
-	off = dt_cg_ctf_offsetof("struct nfs_inode", "fileid", &siz, 0)
-	    - dt_cg_ctf_offsetof("struct nfs_inode", "vfs_inode", NULL, 0);
+	off = dt_cg_ctf_offsetof("struct nfs_inode", "fileid", &siz, NULL, 0)
+	    - dt_cg_ctf_offsetof("struct nfs_inode", "vfs_inode", NULL, NULL, 0);
 	deref_r3(dlp, exitlbl, off, siz, BPF_REG_0);
 
-	off = dt_cg_ctf_offsetof("struct bio", "bi_iter", NULL, 0)
-	    + dt_cg_ctf_offsetof("struct bvec_iter", "bi_sector", &siz, 0);
+	off = dt_cg_ctf_offsetof("struct bio", "bi_iter", NULL, NULL, 0)
+	    + dt_cg_ctf_offsetof("struct bvec_iter", "bi_sector", &siz, NULL, 0);
 	siz = bpf_ldst_size(siz, 1);
 	emit(dlp, BPF_STORE(siz, BPF_REG_6, off, BPF_REG_0));
 
 	/*
 	 * bio.bi_bdev = 0;
 	 */
-	off = dt_cg_ctf_offsetof("struct bio", "bi_bdev", &siz, 1);
+	off = dt_cg_ctf_offsetof("struct bio", "bi_bdev", &siz, NULL, 1);
 	if (off == -1)
-		off = dt_cg_ctf_offsetof("struct bio", "bi_disk", &siz, 0);
+		off = dt_cg_ctf_offsetof("struct bio", "bi_disk", &siz, NULL, 0);
 	siz = bpf_ldst_size(siz, 1);
 	emit(dlp, BPF_STORE_IMM(siz, BPF_REG_6, off, 0));
 
@@ -278,7 +278,7 @@ static void io_nfs_args_v2(dt_pcb_t *pcb, dt_irlist_t *dlp, uint_t exitlbl,
 	dt_cg_tramp_get_var(pcb, "this->-io-bio", 1, BPF_REG_6);
 
 	/* Fill in bi_opf */
-	off = dt_cg_ctf_offsetof("struct bio", "bi_opf", &siz, 0);
+	off = dt_cg_ctf_offsetof("struct bio", "bi_opf", &siz, NULL, 0);
 	siz = bpf_ldst_size(siz, 1);
 	if (strstr(uprb, "read"))
 		emit(dlp, BPF_STORE_IMM(siz, BPF_REG_6, off, REQ_OP_READ));
@@ -294,16 +294,16 @@ static void io_nfs_args_v2(dt_pcb_t *pcb, dt_irlist_t *dlp, uint_t exitlbl,
 	 */
 	if (strcmp(prb, "start") == 0) {
 		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(0)));
-		off = dt_cg_ctf_offsetof("struct nfs_pgio_header", "args", NULL, 0)
-		    + dt_cg_ctf_offsetof("struct nfs_pgio_args", "count", &siz, 0);
+		off = dt_cg_ctf_offsetof("struct nfs_pgio_header", "args", NULL, NULL, 0)
+		    + dt_cg_ctf_offsetof("struct nfs_pgio_args", "count", &siz, NULL, 0);
 	} else {
 		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(1)));
-		off = dt_cg_ctf_offsetof("struct nfs_pgio_header", "res", NULL, 0)
-		    + dt_cg_ctf_offsetof("struct nfs_pgio_res", "count", &siz, 0);
+		off = dt_cg_ctf_offsetof("struct nfs_pgio_header", "res", NULL, NULL, 0)
+		    + dt_cg_ctf_offsetof("struct nfs_pgio_res", "count", &siz, NULL, 0);
 	}
 	deref_r3(dlp, exitlbl, off, siz, BPF_REG_0);
-	off = dt_cg_ctf_offsetof("struct bio", "bi_iter", NULL, 0)
-	    + dt_cg_ctf_offsetof("struct bvec_iter", "bi_size", &siz, 0);
+	off = dt_cg_ctf_offsetof("struct bio", "bi_iter", NULL, NULL, 0)
+	    + dt_cg_ctf_offsetof("struct bvec_iter", "bi_size", &siz, NULL, 0);
 	siz = bpf_ldst_size(siz, 1);
 	emit(dlp, BPF_STORE(siz, BPF_REG_6, off, BPF_REG_0));
 
@@ -316,25 +316,25 @@ static void io_nfs_args_v2(dt_pcb_t *pcb, dt_irlist_t *dlp, uint_t exitlbl,
 	else
 		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(1)));
 
-	off = dt_cg_ctf_offsetof("struct nfs_pgio_header", "inode", &siz, 0);
+	off = dt_cg_ctf_offsetof("struct nfs_pgio_header", "inode", &siz, NULL, 0);
 	deref_r3(dlp, exitlbl, off, siz, BPF_REG_3);
 
-	off = dt_cg_ctf_offsetof("struct nfs_inode", "fileid", &siz, 0)
-	    - dt_cg_ctf_offsetof("struct nfs_inode", "vfs_inode", NULL, 0);
+	off = dt_cg_ctf_offsetof("struct nfs_inode", "fileid", &siz, NULL, 0)
+	    - dt_cg_ctf_offsetof("struct nfs_inode", "vfs_inode", NULL, NULL, 0);
 
 	deref_r3(dlp, exitlbl, off, siz, BPF_REG_0);
 
-	off = dt_cg_ctf_offsetof("struct bio", "bi_iter", NULL, 0)
-	    + dt_cg_ctf_offsetof("struct bvec_iter", "bi_sector", &siz, 0);
+	off = dt_cg_ctf_offsetof("struct bio", "bi_iter", NULL, NULL, 0)
+	    + dt_cg_ctf_offsetof("struct bvec_iter", "bi_sector", &siz, NULL, 0);
 	siz = bpf_ldst_size(siz, 1);
 	emit(dlp, BPF_STORE(siz, BPF_REG_6, off, BPF_REG_0));
 
 	/*
 	 * bio.bi_bdev = 0;
 	 */
-	off = dt_cg_ctf_offsetof("struct bio", "bi_bdev", &siz, 1);
+	off = dt_cg_ctf_offsetof("struct bio", "bi_bdev", &siz, NULL, 1);
 	if (off == -1)
-		off = dt_cg_ctf_offsetof("struct bio", "bi_disk", &siz, 0);
+		off = dt_cg_ctf_offsetof("struct bio", "bi_disk", &siz, NULL, 0);
 	siz = bpf_ldst_size(siz, 1);
 	emit(dlp, BPF_STORE_IMM(siz, BPF_REG_6, off, 0));
 
@@ -379,14 +379,14 @@ static void io_xfs_args(dt_pcb_t *pcb, dt_irlist_t *dlp, uint_t exitlbl)
 
 	/* bio.bi_opf = (bp->b_flags & XBF_WRITE) ? REQ_OP_WRITE : REQ_OP_READ; */
 	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(0)));
-	off = dt_cg_ctf_offsetof("struct xfs_buf", "b_flags", &siz, 0);
+	off = dt_cg_ctf_offsetof("struct xfs_buf", "b_flags", &siz, NULL, 0);
 	deref_r3(dlp, exitlbl, off, siz, BPF_REG_0);
 	emit(dlp, BPF_ALU64_IMM(BPF_AND, BPF_REG_0, XBF_WRITE));
 	{
 		uint_t Lzero = dt_irlist_label(dlp);
 		uint_t Ldone = dt_irlist_label(dlp);
 
-		off = dt_cg_ctf_offsetof("struct bio", "bi_opf", &siz, 0);
+		off = dt_cg_ctf_offsetof("struct bio", "bi_opf", &siz, NULL, 0);
 		siz = bpf_ldst_size(siz, 1);
 
 		emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, Lzero));
@@ -403,10 +403,10 @@ static void io_xfs_args(dt_pcb_t *pcb, dt_irlist_t *dlp, uint_t exitlbl)
 	 * bio.bi_iter.bi_size = bp->b_length;
 	 */
 	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(0)));
-	off = dt_cg_ctf_offsetof("struct xfs_buf", "b_length", &siz, 0);
+	off = dt_cg_ctf_offsetof("struct xfs_buf", "b_length", &siz, NULL, 0);
 	deref_r3(dlp, exitlbl, off, siz, BPF_REG_0);
-	off = dt_cg_ctf_offsetof("struct bio", "bi_iter", NULL, 0)
-	    + dt_cg_ctf_offsetof("struct bvec_iter", "bi_size", &siz, 0);
+	off = dt_cg_ctf_offsetof("struct bio", "bi_iter", NULL, NULL, 0)
+	    + dt_cg_ctf_offsetof("struct bvec_iter", "bi_size", &siz, NULL, 0);
 	siz = bpf_ldst_size(siz, 1);
 	emit(dlp, BPF_STORE(siz, BPF_REG_6, off, BPF_REG_0));
 
@@ -446,12 +446,12 @@ static void io_xfs_args(dt_pcb_t *pcb, dt_irlist_t *dlp, uint_t exitlbl)
 	 *     }
 	 */
 	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(0)));
-	off = dt_cg_ctf_offsetof("struct xfs_buf", "b_maps", &siz, 0);
+	off = dt_cg_ctf_offsetof("struct xfs_buf", "b_maps", &siz, NULL, 0);
 	deref_r3(dlp, exitlbl, off, siz, BPF_REG_3);
-	off = dt_cg_ctf_offsetof("struct xfs_buf_map", "bm_bn", &siz, 0);
+	off = dt_cg_ctf_offsetof("struct xfs_buf_map", "bm_bn", &siz, NULL, 0);
 	deref_r3(dlp, exitlbl, off, siz, BPF_REG_0);
-	off = dt_cg_ctf_offsetof("struct bio", "bi_iter", NULL, 0)
-	    + dt_cg_ctf_offsetof("struct bvec_iter", "bi_sector", &siz, 0);
+	off = dt_cg_ctf_offsetof("struct bio", "bi_iter", NULL, NULL, 0)
+	    + dt_cg_ctf_offsetof("struct bvec_iter", "bi_sector", &siz, NULL, 0);
 	siz = bpf_ldst_size(siz, 1);
 	emit(dlp, BPF_STORE(siz, BPF_REG_6, off, BPF_REG_0));
 
@@ -459,24 +459,24 @@ static void io_xfs_args(dt_pcb_t *pcb, dt_irlist_t *dlp, uint_t exitlbl)
 	 * bio.bi_bdev = (bp)->b_target->bt_bdev
 	 */
 	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(0)));
-	off = dt_cg_ctf_offsetof("struct xfs_buf", "b_target", &siz, 0);
+	off = dt_cg_ctf_offsetof("struct xfs_buf", "b_target", &siz, NULL, 0);
 	assert(siz == sizeof(void *));
 	deref_r3(dlp, exitlbl, off, 8, BPF_REG_3);
-	off = dt_cg_ctf_offsetof("struct xfs_buftarg", "bt_bdev", &siz, 0);
+	off = dt_cg_ctf_offsetof("struct xfs_buftarg", "bt_bdev", &siz, NULL, 0);
 	deref_r3(dlp, exitlbl, off, siz, BPF_REG_3);
-	off = dt_cg_ctf_offsetof("struct bio", "bi_bdev", &siz, 1);
+	off = dt_cg_ctf_offsetof("struct bio", "bi_bdev", &siz, NULL, 1);
 	if (off == -1)
-		off = dt_cg_ctf_offsetof("struct bio", "bi_disk", &siz, 0);
+		off = dt_cg_ctf_offsetof("struct bio", "bi_disk", &siz, NULL, 0);
 	siz = bpf_ldst_size(siz, 1);
 	emit(dlp, BPF_STORE(siz, BPF_REG_6, off, BPF_REG_0));
 
 	/* Populate bi_partno if it exists. */
-	off = dt_cg_ctf_offsetof("struct bio", "bi_partno", &siz, 1);
+	off = dt_cg_ctf_offsetof("struct bio", "bi_partno", &siz, NULL, 1);
 	if (off >= 0) {
 		int	poff;
 		size_t	psiz;
 
-		poff = dt_cg_ctf_offsetof("struct block_device", "bd_partno", &psiz, 0);
+		poff = dt_cg_ctf_offsetof("struct block_device", "bd_partno", &psiz, NULL, 0);
 		siz = bpf_ldst_size(siz, 1);
 		deref_r3(dlp, exitlbl, poff, psiz, BPF_REG_0);
 		emit(dlp, BPF_STORE(siz, BPF_REG_6, off, BPF_REG_0));
@@ -542,7 +542,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 			size_t	size;
 			size_t	off;
 
-			off = dt_cg_ctf_offsetof("struct request", "bio", &size, 0);
+			off = dt_cg_ctf_offsetof("struct request", "bio", &size, NULL, 0);
 			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(0)));
 			deref_r3(dlp, exitlbl, off, size, BPF_REG_0);
 
diff --git a/libdtrace/dt_prov_ip.c b/libdtrace/dt_prov_ip.c
index c4a3a6e2..922cfd8d 100644
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
+	dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6, "sk");
 	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
 
 	/*
@@ -150,11 +113,11 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	 *	skb_network_header(skb)	=	(include/linux/ip.h)
 	 *	skb->head + skb->network_header	(include/linux/skbuff.h)
 	 */
-	get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
+	dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
 	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
 	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
 	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(5), BPF_REG_0));
-	get_member(pcb, "struct sk_buff", BPF_REG_6, "network_header");
+	dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6, "network_header");
 	emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
 	emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
 	emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(5), BPF_REG_0));
@@ -168,7 +131,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	else
 		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(5), 0));
 
-	get_member(pcb, "struct sk_buff", BPF_REG_6, "dev");
+	dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6, "dev");
 	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(3), BPF_REG_0));
 
 	return 0;
diff --git a/libdtrace/dt_prov_proc.c b/libdtrace/dt_prov_proc.c
index 15fde6c9..cf08ce7f 100644
--- a/libdtrace/dt_prov_proc.c
+++ b/libdtrace/dt_prov_proc.c
@@ -206,7 +206,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, SIGKILL, lbl_keep));
 
 		emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_current_task));
-		off = dt_cg_ctf_offsetof("struct task_struct", "signal", &sz, 0);
+		off = dt_cg_ctf_offsetof("struct task_struct", "signal", &sz, NULL, 0);
 		emit(dlp, BPF_MOV_REG(BPF_REG_3, BPF_REG_0));
 		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, off));
 		emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
@@ -214,7 +214,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		emit(dlp, BPF_MOV_IMM(BPF_REG_2, sz));
 		emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_read));
 		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_FP, DT_TRAMP_SP_SLOT(0)));
-		off = dt_cg_ctf_offsetof("struct signal_struct", "group_exit_code", &sz, 0);
+		off = dt_cg_ctf_offsetof("struct signal_struct", "group_exit_code", &sz, NULL, 0);
 		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, off));
 		emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
 		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_SLOT(0)));
diff --git a/libdtrace/dt_prov_sched.c b/libdtrace/dt_prov_sched.c
index a548e679..25f745c1 100644
--- a/libdtrace/dt_prov_sched.c
+++ b/libdtrace/dt_prov_sched.c
@@ -101,7 +101,7 @@ static void get_cpuinfo(dtrace_hdl_t *dtp, dt_irlist_t *dlp, uint_t exitlbl)
 	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(0)));
 
 	/* Turn it into a pointer to its cpu member. */
-	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, dt_cg_ctf_offsetof("struct rq", "cpu", NULL, 1)));
+	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, dt_cg_ctf_offsetof("struct rq", "cpu", NULL, NULL, 1)));
 
 	/* Call bpf_probe_read_kernel(%fp + DT_TRAMP_SP_SLOT[0], sizeof(int), %r3) */
 	emit(dlp, BPF_MOV_IMM(BPF_REG_2, (int) sizeof(int)));
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index cf5cfd43..0b60bf57 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -250,11 +250,11 @@ get_asm_reg(dt_provider_t *pvp, const char *name)
 		     i++, rp++) {
 #if defined(__amd64)
 			rp->off = dt_cg_ctf_offsetof("struct pt_regs",
-						      rp->mname, NULL, 0) +
+						      rp->mname, NULL, NULL, 0) +
 				  rp->moff;
 #elif defined(__aarch64__)
 			rp->off = dt_cg_ctf_offsetof("struct user_pt_regs",
-						      rp->mname, NULL, 0) +
+						      rp->mname, NULL, NULL, 0) +
 				  rp->moff;
 #endif
 
-- 
2.43.5

