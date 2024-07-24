Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F62E154C17
	for <dtrace@lists.linux.dev>; Wed, 24 Jul 2024 09:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721813015; cv=none; b=BMZbgHR2aVoBUYurrfSSdK2A0CJUsmirE3O4wMVD75tgDRIPXk3O+qpEomcjKtczrcVBjDWBuZDRMmZRYwHmfAGP9dU+MSR72Uc1GgKLvjhh5ydPJTxQi6/bOpPwgki/YosymKkEuwnjDtSSWRFUcLWHWTJEXDofW7QtBEnuDMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721813015; c=relaxed/simple;
	bh=iAI9nCJ1kgszvA4WVgFSSxTsq3GH1lqWsvNMzIutZCM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U2YzWkKkhCqPT3GJlVHioBhfe9CfpB0HzNksvWqPdcFOaJ7HTzfnDu5QIx7B8v++rmh9yf/xnE13tnwgRDt4hrMkIQ5LDsxhfcyMH8mzfJaxyM3lzQYgO+oVSdryw29ywnMeax28QA+YF4Vzeug5P+q3R50rHqtDC3toHsjhMwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TS6ZQVSg; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TS6ZQVSg"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46O5onIZ005369
	for <dtrace@lists.linux.dev>; Wed, 24 Jul 2024 09:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=corp-2023-11-20; bh=fEsdTv6FZv10ww
	hN5Js2fdq2VbhjSbDiH4BOS22j1xI=; b=TS6ZQVSgyQbZrLSwwtRtyX3TK5CSZV
	cM7QhkecTalR1+OFWVIhFaa8o7aG+LxmBhoNksFc+XjIZQYTNDAhHpxYowKIRqWP
	lkd3EWg5ncNMI+/cq6098aELO5RY/MFhbIGOb7yNePt4L8hrIpiTEIytQy/Gx7cv
	nfChDrrsggCsUd7e8r1zBFpq0gff1PtWaLao84Grh8XamXUXUz1HfJWuxoM/LdFR
	IiWpfgbDbbal34QJ+YaCX6qAw8VZ1dwKv8dyyOo4uqdW0DIECJV1Ls2rYmVeOQpD
	CXoa/xq5bR7huQwAQVn8zo9eJdGrRD8JVAEPXoHkFcTCncIW/cStm1Zg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40hft0ghh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 24 Jul 2024 09:23:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46O8boZ8040140
	for <dtrace@lists.linux.dev>; Wed, 24 Jul 2024 09:23:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40h26nkhge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 24 Jul 2024 09:23:30 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 46O9NUeO021748
	for <dtrace@lists.linux.dev>; Wed, 24 Jul 2024 09:23:30 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-217-11.vpn.oracle.com [10.175.217.11])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 40h26nkhf9-1;
	Wed, 24 Jul 2024 09:23:30 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH 1/2] USDT: support ELF-note-defined probes
Date: Wed, 24 Jul 2024 10:23:27 +0100
Message-ID: <20240724092328.653371-1-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-24_07,2024-07-23_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407240069
X-Proofpoint-GUID: V1hFKGDl-Uhbf-BLPSMliT7ymiq6_Aww
X-Proofpoint-ORIG-GUID: V1hFKGDl-Uhbf-BLPSMliT7ymiq6_Aww

As well as using dtrace -G to generate USDT probes, they can be added
via ELF notes describing the probe.

Read ELF notes from /proc/<pid>/exe and parse them to retrieve uprobe
address and argument-related information to create the associated uprobe.
The painful part here is retrieving info from the string of USDT arguments
in the ELF note such that we can generate trampoline code to retrieve the
probe arguments.

Probe arguments can be either constants, register values or dereferences
from register values (plus offset).  Use bpf_probe_read[_user] for the
latter case.

Translating from the register names in the USDT argument string is
platform-specific, so we use arrays mapping the register names used
to the appropriate pt_regs field name, along with an offset (for the
aarch64 case where the regs[] array in user_pt_regs is used).

Like in the standard USDT case, wildcarded USDT probes are not yet
supported.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 include/dtrace/pid.h       |  29 ++-
 libdtrace/dt_cg.c          |  47 +++++
 libdtrace/dt_cg.h          |   1 +
 libdtrace/dt_pid.c         | 349 +++++++++++++++++++++++++++++++++++++
 libdtrace/dt_prov_uprobe.c |  13 +-
 5 files changed, 434 insertions(+), 5 deletions(-)

diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
index 1fd594b6..cf6d1004 100644
--- a/include/dtrace/pid.h
+++ b/include/dtrace/pid.h
@@ -26,6 +26,27 @@ typedef enum pid_probetype {
 	DTPPT_IS_ENABLED
 } pid_probetype_t;
 
+#define DT_USDT_MAX_ARGS     10
+
+enum dt_usdt_arg_type {
+	DT_USDT_ARG_NONE = 0,
+	DT_USDT_ARG_CONST,
+	DT_USDT_ARG_REG,
+	DT_USDT_ARG_REG_DEREF
+};
+
+struct dt_usdt_arg {
+	enum dt_usdt_arg_type ua_type;
+	int ua_val_sz;
+	int ua_val_off;
+	int64_t ua_const_val;
+	const char *ua_regs_name;	/* pt_regs/user_pt_regs */
+	const char *ua_regs_field;	/* x0/rsp etc */
+	int ua_regs_field_off;		/* used for array regs[] */
+};
+
+typedef struct dt_usdt_arg dt_usdt_arg_t;
+
 typedef struct pid_probespec {
 	pid_probetype_t pps_type;		/* probe type */
 	char *pps_prv;				/* provider (without pid) */
@@ -36,7 +57,13 @@ typedef struct pid_probespec {
 	ino_t pps_inum;				/* object inode */
 	char *pps_fn;				/* object full filename */
 	uint64_t pps_off;			/* probe offset (in object) */
-
+	int pps_nargs;				/* number of arg specs in
+						 * pps_args.
+						 */
+	dt_usdt_arg_t pps_args[DT_USDT_MAX_ARGS];
+						/* USDT ELF note-defined
+						 * provider arguments.
+						 */
 	/*
 	 * Fields below this point do not apply to underlying probes.
 	 */
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 27246a40..60edc153 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -666,6 +666,53 @@ dt_cg_tramp_copy_rval_from_regs(dt_pcb_t *pcb)
 		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), 0));
 }
 
+void
+dt_cg_tramp_copy_args_from_usdt_spec(dt_pcb_t *pcb, const dt_usdt_arg_t *args)
+{
+	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
+	dt_irlist_t	*dlp = &pcb->pcb_ir;
+	int		reg_val_off, i;
+
+	for (i = 0; i < DT_USDT_MAX_ARGS; i++) {
+		const dt_usdt_arg_t *arg = &args[i];
+		uint_t lbl_ok = dt_irlist_label(dlp);
+
+		switch (arg->ua_type) {
+		case DT_USDT_ARG_NONE:
+			return;
+		case DT_USDT_ARG_CONST:
+			emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i),
+						arg->ua_const_val));
+			break;
+		case DT_USDT_ARG_REG:
+		case DT_USDT_ARG_REG_DEREF:
+			reg_val_off = dt_cg_ctf_offsetof(arg->ua_regs_name,
+							 arg->ua_regs_field, NULL, 0);
+			reg_val_off += arg->ua_regs_field_off;
+			emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_8,
+					    reg_val_off));
+			/* do direct register value copy */
+			if (arg->ua_type == DT_USDT_ARG_REG) {
+				emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i),
+						     BPF_REG_0));
+				break;
+			}
+			/* otherwise call bpf_probe_read[_user] to get dereferenced value.
+			 */
+			emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_7));
+			emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DMST_ARG(i)));
+			emit(dlp, BPF_MOV_IMM(BPF_REG_2, abs(arg->ua_val_sz)));
+			emit(dlp, BPF_MOV_REG(BPF_REG_3, BPF_REG_0));
+			emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, arg->ua_val_off));
+			emit(dlp,  BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_user]));
+			emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, lbl_ok));
+			emit(dlp,  BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), 0));
+			emitl(dlp, lbl_ok, BPF_NOP());
+			break;
+		}
+	}
+}
+
 static dt_node_t *
 dt_cg_tramp_var(const char *name)
 {
diff --git a/libdtrace/dt_cg.h b/libdtrace/dt_cg.h
index 0a7c7ba6..ab421434 100644
--- a/libdtrace/dt_cg.h
+++ b/libdtrace/dt_cg.h
@@ -28,6 +28,7 @@ extern void dt_cg_tramp_copy_regs(dt_pcb_t *pcb);
 extern void dt_cg_tramp_copy_args_from_regs(dt_pcb_t *pcb, int called);
 extern void dt_cg_tramp_copy_pc_from_regs(dt_pcb_t *pcb);
 extern void dt_cg_tramp_copy_rval_from_regs(dt_pcb_t *pcb);
+extern void dt_cg_tramp_copy_args_from_usdt_spec(dt_pcb_t *pcb, const dt_usdt_arg_t *args);
 extern void dt_cg_tramp_decl_var(dt_pcb_t *pcb, dt_ident_t *idp);
 extern void dt_cg_tramp_get_var(dt_pcb_t *pcb, const char *name, int isstore,
 				int reg);
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 02ed7511..9bc26539 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -28,6 +28,8 @@
 #if defined(__amd64)
 #include <disasm.h>
 #endif
+#include <unistd.h>
+#include <linux/kernel.h>
 
 #include <port.h>
 #include <dof_parser.h>
@@ -776,6 +778,351 @@ validate_dof_record(const char *path, const dof_parsed_t *parsed,
 	return 1;
 }
 
+#define SEC_USDT_NOTE	".note.stapsdt"
+#define NAME_USDT_NOTE	"stapsdt"
+
+struct pt_regs_info {
+	const char ua_name[8];
+	const char name[8];
+	int off;
+} pt_regs_info[] = {
+
+#if defined(__aarch64__)
+	{ "sp", "sp",	0 },
+	{ "x0", "regs", 0 },
+	{ "x1", "regs", 1 * sizeof(unsigned long) },
+	{ "x2", "regs", 2 * sizeof(unsigned long) },
+	{ "x3", "regs", 3 * sizeof(unsigned long) },
+	{ "x4", "regs", 4 * sizeof(unsigned long) },
+	{ "x5", "regs", 5 * sizeof(unsigned long) },
+	{ "x6", "regs", 6 * sizeof(unsigned long) },
+	{ "x7", "regs", 7 * sizeof(unsigned long) },
+	{ "x8", "regs", 8 * sizeof(unsigned long) },
+	{ "x9", "regs", 9 * sizeof(unsigned long) },
+	{ "x10", "regs", 10 * sizeof(unsigned long) },
+	{ "x11", "regs", 11 * sizeof(unsigned long) },
+	{ "x12", "regs", 12 * sizeof(unsigned long) },
+	{ "x13", "regs", 13 * sizeof(unsigned long) },
+	{ "x14", "regs", 14 * sizeof(unsigned long) },
+	{ "x15", "regs", 15 * sizeof(unsigned long) },
+	{ "x16", "regs", 16 * sizeof(unsigned long) },
+	{ "x17", "regs", 17 * sizeof(unsigned long) },
+	{ "x18", "regs", 18 * sizeof(unsigned long) },
+	{ "x19", "regs", 19 * sizeof(unsigned long) },
+	{ "x20", "regs", 20 * sizeof(unsigned long) },
+	{ "x21", "regs", 21 * sizeof(unsigned long) },
+	{ "x222", "regs", 22 * sizeof(unsigned long) },
+	{ "x23", "regs", 23 * sizeof(unsigned long) },
+	{ "x24", "regs", 24 * sizeof(unsigned long) },
+	{ "x25", "regs", 25 * sizeof(unsigned long) },
+	{ "x26", "regs", 26 * sizeof(unsigned long) },
+	{ "x27", "regs", 27 * sizeof(unsigned long) },
+	{ "x28", "regs", 28 * sizeof(unsigned long) },
+	{ "x29", "regs", 29 * sizeof(unsigned long) },
+	{ "x30", "regs", 30 * sizeof(unsigned long) },
+	{ "x31", "regs", 31 * sizeof(unsigned long) }
+#else
+	{ "rip", "ip", 0 },
+	{ "eip", "ip", 0 },
+	{ "rax", "ax", 0 },
+	{ "eax", "ax", 0 },
+	{ "ax",  "ax", 0 },
+	{ "al",  "ax", 0 },
+	{ "rbx", "bx", 0 },
+	{ "ebx", "bx", 0 },
+	{ "bx",  "bx", 0 },
+	{ "bl",  "bx", 0 },
+	{ "rcx", "cx", 0 },
+	{ "ecx", "cx", 0 },
+	{ "cx",  "cx", 0 },
+	{ "cl",  "cx", 0 },
+	{ "rdx", "dx", 0 },
+	{ "edx", "dx", 0 },
+	{ "dx",  "dx", 0 },
+	{ "dl",  "dx", 0 },
+	{ "rsi", "si", 0 },
+	{ "esi", "si", 0 },
+	{ "si",  "si", 0 },
+	{ "sil", "si", 0 },
+	{ "rdi", "di", 0 },
+	{ "edi", "di", 0 },
+	{ "di",  "di", 0 },
+	{ "dil", "di", 0 },
+	{ "rbp", "bp", 0 },
+	{ "ebp", "bp", 0 },
+	{ "bp",  "bp", 0 },
+	{ "bpl", "bp", 0 },
+	{ "rsp", "sp", 0 },
+	{ "esp", "sp", 0 },
+	{ "sp",  "sp", 0 },
+	{ "spl", "sp", 0 }
+#endif
+};
+
+static void dt_usdt_note_print_arg(dt_usdt_arg_t *a)
+{
+	switch (a->ua_type) {
+	case DT_USDT_ARG_NONE:
+		return;
+	case DT_USDT_ARG_CONST:
+		dt_dprintf("CONST %ld\n", a->ua_const_val);
+		break;
+	case DT_USDT_ARG_REG_DEREF:
+		dt_dprintf("REG DEREF (%s.%s + %d) + %d\n",
+			   a->ua_regs_name, a->ua_regs_field,
+			   a->ua_regs_field_off, a->ua_val_off);
+		break;
+	case DT_USDT_ARG_REG:
+		dt_dprintf("REG VALUE (%s.%s + %d)\n",
+			   a->ua_regs_name, a->ua_regs_field,
+			   a->ua_regs_field_off);
+		break;
+	}
+}
+
+/* retrieve arguments; space-separated string of arguments of form:
+ * [-]numbytes@[optional_offset_from(]%regname[)]
+ *
+ * for example:
+ *
+ * -4@-4(%rbp) means memory dereference of 4 bytes, 4 bytes
+ * offset from %rbp value.
+ * 8@(%rax) means memory dereference of 8 bytes from
+ * rax register value (no offset)
+ * 8@%rax means 8 bytes from rax register value (no deref).
+ * 4@$32 means 4 byte constant value 32
+ */
+static int dt_usdt_note_parse_arg(char **argstr, struct dt_usdt_arg *a)
+{
+	char *arg = *argstr;
+	char reg[8] = {};
+	int len;
+
+	if (sscanf(arg,
+#if defined(__aarch64__)
+		   " %d @ \[ %[a-z0-9] , %ld ] %n",
+		   &a->ua_val_sz, reg, &a->ua_val_off, &len)
+#else
+		   " %d @ %d ( %%%8[^)] ) %n",
+		   &a->ua_val_sz, &a->ua_val_off, reg, &len)
+#endif
+	    == 3) {
+		a->ua_type = DT_USDT_ARG_REG_DEREF;
+	} else if (sscanf(arg,
+#if defined(__aarch64__)
+			  " %d @ \[ %7[a-z0-9] ] %n", &a->ua_val_sz, reg, &len)
+#else
+			  " %d @ ( %%%7[^)] ) %n", &a->ua_val_sz, reg, &len)
+#endif
+	    == 2) {
+		a->ua_type = DT_USDT_ARG_REG_DEREF;
+	} else if (sscanf(arg,
+#if defined(__aarch64__)
+			   " %d @ %7[a-z0-9] %n", &a->ua_val_sz, reg, &len)
+#else
+			  " %d @ %%%7s %n", &a->ua_val_sz, reg, &len)
+#endif
+	    == 2) {
+		    a->ua_type = DT_USDT_ARG_REG;
+	} else if (sscanf(arg,
+			  " %d @ $%ld %n", &a->ua_val_sz, &a->ua_const_val,
+			  &len) == 2) {
+		    a->ua_type = DT_USDT_ARG_CONST;
+	} else {
+		return -1;
+	}
+	if (strlen(reg) > 0) {
+		int i;
+
+#if defined(__aarch64)
+		a->ua_regs_name = "struct user_pt_regs";
+#else
+		a->ua_regs_name = "struct pt_regs";
+#endif
+		for (i = 0; i < ARRAY_SIZE(pt_regs_info); i++) {
+			if (strcmp(pt_regs_info[i].ua_name, reg))
+				continue;
+			a->ua_regs_field = pt_regs_info[i].name;
+			a->ua_regs_field_off = pt_regs_info[i].off;
+		}
+	}
+	*argstr += len;
+	return 0;
+}
+
+static int dt_usdt_notes_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr,
+			       dtrace_probedesc_t *pdp, dt_pcb_t *pcb,
+			       const dt_provider_t *pvp)
+{
+	Elf *elf;
+	Elf_Scn *scn = NULL;
+	GElf_Shdr shdr;
+	GElf_Nhdr nhdr;
+	size_t shstrndx, noff, doff, off, n;
+	Elf_Data *data;
+	char *fname;
+	int i, ret = 0;
+	int fd = -1;
+
+	dt_dprintf("Scanning for usdt probes in ELF notes in %i matching %s:%s:%s\n",
+		   dpr->dpr_pid, pdp->mod, pdp->fun, pdp->prb);
+
+	if (asprintf(&fname, "/proc/%d/exe", dpr->dpr_pid) < 0) {
+		dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
+			     "Cannot allocate name for /proc/%d/exe\n",
+			     dpr->dpr_pid);
+		return -1;
+	}
+
+	fd = open(fname, O_RDONLY);
+	if (fd < 0) {
+		dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
+			     "Cannot open %s: %s\n",
+			     fname, strerror(errno));
+		return -1;
+	}
+	elf = elf_begin(fd, ELF_C_READ_MMAP, NULL);   // ELF_C_READ ?
+	assert(elf_kind(elf) == ELF_K_ELF);
+	elf_getshdrstrndx(elf, &shstrndx);
+
+	while (1) {
+		char *secname;
+
+		scn = elf_nextscn(elf, scn);
+		if (scn == NULL) {
+			/* no ELF notes found, not an error */
+			return 0;
+		}
+		assert(gelf_getshdr(scn, &shdr) != NULL);
+
+		secname = elf_strptr(elf, shstrndx, shdr.sh_name);
+		if (strcmp(secname, SEC_USDT_NOTE) == 0 &&
+		    shdr.sh_type == SHT_NOTE)
+			break;
+	}
+	/* No ELF notes, just bail. */
+	if (scn == NULL)
+		goto out;
+	data = elf_getdata(scn, 0);
+	for (off = 0;
+	     (off = gelf_getnote(data, off, &nhdr, &noff, &doff)) > 0;) {
+		pid_probespec_t psp = {0};
+		char *prv, *prb;
+		const char *fun;
+		char mod[PATH_MAX];
+		char *dbuf = (char *)data->d_buf;
+		long *addrs = data->d_buf + doff; /* 3 addrs are loc/base/semaphore */
+		GElf_Sym sym;
+		const prmap_t *pmp;
+		int nargs = 0;
+
+		if (strncmp(dbuf + noff, NAME_USDT_NOTE, nhdr.n_namesz) != 0)
+			continue;
+		prv = dbuf + doff + (3*sizeof(long));
+		/* ensure prv/prb is null-terminated */
+		assert(strlen(prv) < nhdr.n_descsz);
+		prb = prv + strlen(prv) + 1;
+		assert(strlen(prb) < nhdr.n_descsz);
+		if (strncmp(pdp->prv, prv, strlen(prv)) != 0)
+			continue;
+		if (strcmp(pdp->prb, "*") != 0 && strcmp(pdp->prb, prb) != 0)
+			continue;
+		/* retrieve arguments; space-separated string of arguments
+		 * in form:
+		 * [-]numbytes@[optional_offset_from(]%regname[)]
+		 *
+		 * for example:
+		 *
+		 * -4@-4(%rbp) means memory dereference of 4 bytes, 4 bytes
+		 * offset from %rbp value.
+		 * 8@(%rax) means memory dereference of 8 bytes from
+		 * rax register value (no offset)
+		 * 8@%rax means 8 bytes from rax register value (no deref).
+		 * 4@$32 means 4 byte constant value 32
+		 */
+		if (prb + strlen(prb) + 1 < dbuf + doff + nhdr.n_descsz) {
+			char *argstr = prb + strlen(prb) + 1;
+
+			dt_dprintf("parsing arguments in '%s'\n",
+				   argstr);
+			while (dt_usdt_note_parse_arg(&argstr, &psp.pps_args[nargs]) == 0) {
+				dt_usdt_note_print_arg(&psp.pps_args[nargs]);
+				nargs++;
+				dt_dprintf("parsed %d arg, remainder '%s'\n",
+					   nargs, argstr);
+			}
+			psp.pps_nargs = nargs;
+
+		}
+		dt_dprintf("found ELF note for provider '%s', probe '%s' in %s, loc 0x%lx, base 0x%lx\n",
+			   prv, prb, fname, addrs[0], addrs[1]);
+		psp.pps_type = DTPPT_OFFSETS;
+		psp.pps_prv = prv;
+		if (dt_Pobjname(dtp, dpr->dpr_pid, addrs[0], mod, sizeof(mod)) == NULL) {
+			dt_dprintf("cannot determine mod name for 0x%lx\n", addrs[0]);
+			continue;
+		}
+		psp.pps_mod = basename(mod);
+		psp.pps_prb = prb;
+		if (elf_getphdrnum(elf, &n))
+			continue;
+		for (i = 0; i < n; i++) {
+			GElf_Phdr phdr;
+
+			if (!gelf_getphdr(elf, i, &phdr))
+				break;
+
+			if (addrs[0] < phdr.p_vaddr ||
+			    addrs[0] > phdr.p_vaddr + phdr.p_memsz)
+				continue;
+			psp.pps_off = addrs[0] - phdr.p_vaddr + phdr.p_offset;
+			break;
+		}
+		if (!psp.pps_off)
+			continue;
+		psp.pps_nameoff = 0;
+
+		pmp = Paddr_to_map(dpr->dpr_proc, addrs[0]);
+		if (!pmp) {
+			dt_dprintf("%i: cannot determine 0x%lx's mapping\n",
+				   Pgetpid(dpr->dpr_proc), psp.pps_off);
+			continue;
+		}
+		psp.pps_fn = Pmap_mapfile_name(dpr->dpr_proc, pmp);
+		if (psp.pps_fn == NULL) {
+			dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
+				     "Cannot get name of mapping containing probe %s for pid %d\n",
+				     psp.pps_prb, dpr->dpr_pid);
+			ret = -1;
+			break;
+		}
+		if (dt_Plookup_by_addr(dtp, dpr->dpr_pid, addrs[0], &fun, &sym) == 0)
+			psp.pps_fun = (char *)fun;
+		else
+			psp.pps_fun = "";
+		psp.pps_dev = pmp->pr_dev;
+		psp.pps_inum = pmp->pr_inum;
+		psp.pps_pid = dpr->dpr_pid;
+		psp.pps_nameoff = 0;
+
+		dt_dprintf("providing %s:%s:%s:%s for pid %d\n", psp.pps_prv,
+			   psp.pps_mod, psp.pps_fun, psp.pps_prb, psp.pps_pid);
+		if (pvp->impl->provide_probe(dtp, &psp) < 0) {
+			dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
+				     "failed to instantiate probe %s for pid %d: %s",
+				     psp.pps_prb, psp.pps_pid,
+				     dtrace_errmsg(dtp, dtrace_errno(dtp)));
+			ret = -1;
+		}
+		free(psp.pps_fn);
+		if (ret == -1)
+			break;
+	}
+out:
+	close(fd);
+	free(fname);
+	return ret;
+}
 
 /*
  * Create underlying probes relating to the probespec passed on input.
@@ -810,6 +1157,8 @@ dt_pid_create_usdt_probes(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t
 	if (Pstate(dpr->dpr_proc) == PS_DEAD)
 		return 0;
 
+	(void) dt_usdt_notes_parse(dtp, dpr, pdp, pcb, pvp);
+
 	/*
 	 * Look for DOF matching this probe in the global probe DOF stash, in
 	 * /run/dtrace/probes/$pid/$pid$prv/$mod/$fun/$prb: glob expansion means
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index e1f7e23f..8b1ebc98 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -28,6 +28,7 @@ static const char	prvname_is_enabled[] = "uprobe__is_enabled";
 #define PP_IS_RETURN	1
 #define PP_IS_FUNCALL	2
 #define PP_IS_ENABLED	4
+#define PP_IS_USDT_NOTE	8
 
 typedef struct dt_uprobe {
 	dev_t		dev;
@@ -35,6 +36,7 @@ typedef struct dt_uprobe {
 	char		*fn;
 	uint64_t	off;
 	int		flags;
+	dt_usdt_arg_t	args[DT_USDT_MAX_ARGS];
 	tp_probe_t	*tp;
 	dt_list_t	probes;		/* pid/USDT probes triggered by it */
 } dt_uprobe_t;
@@ -179,6 +181,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 		upp->off = psp->pps_off;
 		upp->fn = strdup(psp->pps_fn);
 		upp->tp = dt_tp_alloc(dtp);
+		memcpy(&upp->args, psp->pps_args, sizeof(upp->args));
 		if (upp->tp == NULL)
 			goto fail;
 
@@ -196,10 +199,10 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	case DTPPT_IS_ENABLED:
 	    upp->flags |= PP_IS_ENABLED;
 	    break;
-	default: ;
-	    /*
-	     * No flags needed for other types.
-	     */
+	default:
+	if (psp->pps_nargs)
+		upp->flags |= PP_IS_USDT_NOTE;
+	break;
 	}
 
 	return prp;
@@ -409,6 +412,8 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	dt_cg_tramp_copy_regs(pcb);
 	if (upp->flags & PP_IS_RETURN)
 		dt_cg_tramp_copy_rval_from_regs(pcb);
+	else if (upp->flags & PP_IS_USDT_NOTE)
+		dt_cg_tramp_copy_args_from_usdt_spec(pcb, upp->args);
 	else
 		dt_cg_tramp_copy_args_from_regs(pcb,
 						!(upp->flags & PP_IS_FUNCALL));
-- 
2.39.3

