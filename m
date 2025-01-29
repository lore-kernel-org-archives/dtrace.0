Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AEA14F9FF
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738161848; cv=none; b=NEsNp9lh4vtZJcJHx1N5Ff1X1kQY7D5fIugQDQFrBTDnDXHVdt0KBGW4O2VR3gHBNiU+nXP7KBUo9hc4hSZpQmdOsoCUTNjz4XlCoT07NyOAj2GQ6iRPxpokcT0UIJrFDRWOGzqyfeYNSv5uJyID1GxdrWTGVjNkxknkfkJsQ78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738161848; c=relaxed/simple;
	bh=7AKlZmDBBTxpUVNZaYwLJMC479asGLvtf3csIXN7aZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qlFmha4IyirpqQBUsrJd+N4sXt0R17TNqqhCWlqNSgZI9IObX/QSZXaIFv2trq7Kjv75dBGBavPahI0eom1TuSwW9mNfJFaeDTAaqPPw6bypV8HDTrz3mqgORF27m2ukJp+i1PPTfWFlpqgggAUhV0VGUhAGQ7jm4XcBjsTa3Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=B1YT+Io1; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="B1YT+Io1"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TEYD2x006625
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=9RZ8M
	i22hrWm8k3wlao0vVzw2lVcskwXk7x84rLROJU=; b=B1YT+Io1WvzwFulWzQP1u
	N8p9qiwENuYFablRPKmBC/dMUCS54eUtl0E9CzUKIrrP8+S0m8KE4macdSDAYWGK
	2e5aN/oSIEjsYTeOJ/pARtocpHCUBIVPO59QuSQOPk+ktkzXs/sW64BKgtAh2Tfv
	CGF2nb/ndu6aQB+aJyj8d6govc+pWsKNO+VmO57xshjWCSBnauN0ppehfNhZd3rZ
	3erZp0h4CsKfmNEeC4SPXnhqYNc1C3OLR7ErQtOo0WA9Do1ndPydYTlEYhFEDwrQ
	ujpNdFVesBME8zEUOAx6cdWRyI9GgyXseTRsG6GihF2O+Fy4PSb9xeQECYZ5xkeZ
	g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44fmut873d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:44:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50TD2eOa004279
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:44:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpd9w4rx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:44:04 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50TEi2WI027701
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:44:03 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-177-216.vpn.oracle.com [10.175.177.216])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 44cpd9w4qr-2;
	Wed, 29 Jan 2025 14:44:03 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH 1/4] USDT: support ELF-note-defined probes
Date: Wed, 29 Jan 2025 14:43:58 +0000
Message-ID: <20250129144401.505186-2-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250129144401.505186-1-alan.maguire@oracle.com>
References: <20250129144401.505186-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_02,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501290119
X-Proofpoint-GUID: lHYQaQth9yZq109ty4mqkC-szot-MFg7
X-Proofpoint-ORIG-GUID: lHYQaQth9yZq109ty4mqkC-szot-MFg7

As well as using dtrace -G to generate USDT probes, they can be added
via ELF notes describing the probe.

Read ELF notes from /proc/<pid>/exe and associated libraries,
 and parse them to retrieve uprobe address and argument-related info
to create the associated uprobe.

The painful part here is retrieving info from the string of USDT arguments
in the ELF note such that we can generate trampoline code to retrieve the
probe arguments.  Probe arguments can be either constants, register values
or dereferences from register values (plus offset).  Use bpf_probe_read[_user]
for the latter case.

Translating from the register names in the USDT argument string is
platform-specific, so we use arrays mapping the register names used
to the appropriate pt_regs field name, along with an offset (for the
aarch64 case where the regs[] array in user_pt_regs is used).

Wildcarded pid USDT probes are not yet supported; a specific
pid is required.

As well as supporting ELF-note defined probes in programs and
libraries, this patch supports dynamically-created probes that
are created via libstapsdt [1].  libstapsdt allows dynamic languages
like python to declare and fire probes by dynamically creating
a memfd-based shared library containing ELF notes for the probes.
With these changes we can also trace these probes.  This is very
useful since libstapsdt has python, NodeJS, go and luaJIT bindings.

[1] https://github.com/linux-usdt/libstapsdt

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 include/dtrace/pid.h       |  29 +++
 libdtrace/dt_cg.c          |  47 ++++
 libdtrace/dt_cg.h          |   1 +
 libdtrace/dt_pid.c         | 451 +++++++++++++++++++++++++++++++++++++
 libdtrace/dt_prov_uprobe.c |  19 +-
 5 files changed, 540 insertions(+), 7 deletions(-)

diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
index c53e6004..a8e26da4 100644
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
@@ -44,6 +65,14 @@ typedef struct pid_probespec {
 	size_t pps_xargvlen;			/* (high estimate of) length of array */
 	int8_t *pps_argmap;			/* mapped arg indexes */
 
+	int pps_nuargs;				/* number of arg specs in
+						 * pps_uargs
+						 */
+	dt_usdt_arg_t pps_uargs[DT_USDT_MAX_ARGS];
+						/* USDT ELF note-defined
+						 * provider arguments.
+						 */
+
 	/*
 	 * Fields below this point do not apply to underlying probes.
 	 */
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index e7e3a132..2c8f8210 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -651,6 +651,53 @@ dt_cg_tramp_copy_rval_from_regs(dt_pcb_t *pcb)
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
index fb26c125..24257f0b 100644
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
index 4d53c023..5608e380 100644
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
@@ -780,6 +782,351 @@ validate_dof_record(const char *path, const dof_parsed_t *parsed,
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
+		   " %d @ \[ %[a-z0-9] , %d ] %n",
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
+#if defined(__x86_64__)
+			  " %d @ $%ld %n", &a->ua_val_sz, &a->ua_const_val, &len)
+#else
+			  " %d @ %ld %n", &a->ua_val_sz, &a->ua_const_val, &len)
+#endif
+			  == 2) {
+		a->ua_type = DT_USDT_ARG_CONST;
+	} else if (sscanf(arg,
+#if defined(__aarch64__)
+			   " %d @ %7[a-z0-9] %n", &a->ua_val_sz, reg, &len)
+#else
+			  " %d @ %%%7s %n", &a->ua_val_sz, reg, &len)
+#endif
+	    == 2) {
+		    a->ua_type = DT_USDT_ARG_REG;
+	} else {
+		return -1;
+	}
+	if (strlen(reg) > 0) {
+		int i;
+
+#if defined(__aarch64__)
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
+			       const dt_provider_t *pvp, const char *path,
+			       unsigned long base_addr)
+{
+	Elf *elf;
+	Elf_Scn *scn = NULL;
+	GElf_Shdr shdr;
+	GElf_Nhdr nhdr;
+	size_t shstrndx, noff, doff, off, n;
+	Elf_Data *data;
+	int i, ret = 0;
+	int fd = -1;
+
+	dt_dprintf("Scanning for USDT probes in ELF notes in '%s' (pid %i) matching %s:%s:%s\n",
+		   path, dpr->dpr_pid, pdp->mod, pdp->fun, pdp->prb);
+
+	fd = open(path, O_RDONLY);
+	if (fd < 0) {
+		dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
+			     "Cannot open %s: %s\n",
+			     path, strerror(errno));
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
+			while (dt_usdt_note_parse_arg(&argstr,
+						&psp.pps_uargs[nargs]) == 0 &&
+			       nargs < DT_USDT_MAX_ARGS) {
+				dt_usdt_note_print_arg(&psp.pps_uargs[nargs]);
+				nargs++;
+			}
+			psp.pps_nuargs = nargs;
+
+		}
+		dt_dprintf("found ELF note for provider '%s', probe '%s' in %s, loc 0x%lx, base 0x%lx, nargs %d\n",
+			   prv, prb, path, addrs[0], addrs[1], nargs);
+		psp.pps_type = DTPPT_USDT;
+		psp.pps_prv = prv;
+		if (dt_Pobjname(dtp, dpr->dpr_pid, base_addr + addrs[0], mod,
+				sizeof(mod)) == NULL) {
+			dt_dprintf("cannot determine mod name for 0x%lx\n", addrs[0]);
+			mod[0] = '\0';
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
+			if (base_addr)
+				psp.pps_off = addrs[0];
+			else
+				psp.pps_off = addrs[0] - phdr.p_vaddr + phdr.p_offset;
+			break;
+		}
+		if (!psp.pps_off)
+			continue;
+		psp.pps_nameoff = 0;
+
+		pmp = Paddr_to_map(dpr->dpr_proc, base_addr + addrs[0]);
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
+		if (dt_Plookup_by_addr(dtp, dpr->dpr_pid, base_addr + addrs[0],
+				       &fun, &sym) == 0)
+			psp.pps_fun = (char *)fun;
+		else
+			psp.pps_fun = "";
+		psp.pps_dev = pmp->pr_dev;
+		psp.pps_inum = pmp->pr_inum;
+		psp.pps_pid = dpr->dpr_pid;
+		psp.pps_nameoff = 0;
+
+		dt_dprintf("providing %s:%s:%s:%s for pid %d at addr 0x%lx\n", psp.pps_prv,
+			   psp.pps_mod, psp.pps_fun, psp.pps_prb, psp.pps_pid,
+			   base_addr + addrs[0]);
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
+	return ret;
+}
 
 /*
  * Create underlying probes relating to the probespec passed on input.
@@ -1202,6 +1549,108 @@ dt_pid_create_pid_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *p
 	return err;
 }
 
+static int
+dt_pid_create_usdt_notes_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
+				dt_pcb_t *pcb)
+{
+	const char *pidstr = &pdp->prv[strlen(pdp->prv)];
+	const dt_provider_t *pvp;
+	char path[PATH_MAX + 1];
+	dt_proc_t *dpr = NULL;
+	FILE *fp = NULL;
+	pid_t pid = 0;
+	int err;
+
+	/* only specific pids are support for ELF notes for now... */
+	while (isdigit(*(pidstr - 1)))
+		pidstr--;
+	if (strlen(pidstr) > 0)
+		pid = atoll(pidstr);
+	if (!Pexists(pid))
+		return 0;
+	pvp = dt_provider_lookup(dtp, "usdt");
+	assert(pvp != NULL);
+
+	if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING |
+			      DTRACE_PROC_SHORTLIVED) < 0) {
+		dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
+			     "failed to grab process %d",
+			     (int)pid);
+		return 1;
+	}
+	dpr = dt_proc_lookup(dtp, pid);
+	assert(dpr != NULL);
+	snprintf(path, sizeof(path), "/proc/%d/exe", dpr->dpr_pid);
+	err = dt_usdt_notes_parse(dtp, dpr, pdp, pcb, pvp, path, 0);
+	if (err)
+		goto out;
+
+	snprintf(path, sizeof(path), "/proc/%d/maps", pid);
+
+	fp = fopen(path, "r");
+	if (!fp) {
+		dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
+			     "no /proc/%d/maps found", (int)pid);
+		err = 1;
+		goto out;
+	}
+	do {
+		long addr_start, addr_end, file_offset;
+		long dev_major, dev_minor;
+		unsigned long inode;
+		char name[PATH_MAX + 1];
+		char perm[5];
+
+
+		if (fscanf(fp,
+		       "%lx-%lx %4s %lx %lx:%lx %lu %[^\n]",
+		       &addr_start, &addr_end, perm, &file_offset,
+		       &dev_major, &dev_minor, &inode, name) != 8 ||
+		    !strchr(perm, 'x') || strchr(name, '[') != NULL)
+			continue;
+		/* libstapsdt uses an memfd-based library to dynamically create
+		 * stapsdt notes for dynamic languages like python; we need
+		 * the associated /proc/<pid>/fds/ fd to read these notes.
+		 */
+		if (strncmp(name, "/memfd:", strlen("/memfd:")) == 0) {
+			DIR *d;
+			struct dirent *dirent;
+			char *deleted;
+
+			deleted = strstr(name, " (deleted)");
+			*deleted = '\0';
+			snprintf(path, sizeof(path), "/proc/%d/fd", pid);
+			d = opendir(path);
+			if (d == NULL)
+				continue;
+			while ((dirent = readdir(d)) != NULL) {
+				struct stat s;
+
+				snprintf(path, sizeof(path), "/proc/%d/fd/%s",
+					 pid, dirent->d_name);
+				if (stat(path, &s) != 0 || s.st_ino != inode)
+					continue;
+				if (dt_usdt_notes_parse(dtp, dpr, pdp, pcb, pvp,
+							path, addr_start) != 0) {
+					err = 1;
+					goto out;
+				}
+			}
+		} else {
+			if (dt_usdt_notes_parse(dtp, dpr, pdp, pcb, pvp, name, addr_start) != 0) {
+				err = 1;
+				goto out;
+			}
+		}
+	} while (!feof(fp));
+out:
+	if (fp)
+		fclose(fp);
+	dt_pid_fix_mod(NULL, pdp, dtp, dpr->dpr_pid);
+	dt_proc_release_unlock(dtp, pid);
+	return err;
+}
+
 int
 dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
 {
@@ -1273,6 +1722,8 @@ dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *
 	free(globpat);
 	globfree(&globbuf);
 
+	err = dt_pid_create_usdt_notes_probes(pdp, dtp, pcb);
+
 	/* If no errors, report success. */
 	if (err == 0)
 		return 0;
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 78d9aed6..08b60b44 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -51,6 +51,7 @@ static const char	prvname[] = "uprobe";
 #define PP_IS_ENABLED	0x4
 #define PP_IS_USDT	0x8
 #define PP_IS_MAPPED	0x10
+#define PP_IS_USDT_NOTE	0x20
 
 typedef struct dt_uprobe {
 	dev_t		dev;
@@ -58,6 +59,7 @@ typedef struct dt_uprobe {
 	char		*fn;
 	uint64_t	off;
 	int		flags;
+	dt_usdt_arg_t	uargs[DT_USDT_MAX_ARGS];
 	tp_probe_t	*tp;
 	int		argc;		   /* number of args */
 	dt_argdesc_t	*args;		   /* args array (points into argvbuf) */
@@ -651,7 +653,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	pd.prb = prb;
 
 	dt_dprintf("Providing underlying probe %s:%s:%s:%s @ %lx\n", psp->pps_prv,
-		   psp->pps_mod, psp->pps_fn, psp->pps_prb, psp->pps_off);
+		   psp->pps_mod, psp->pps_fun, psp->pps_prb, psp->pps_off);
 	uprp = dt_probe_lookup(dtp, &pd);
 	if (uprp == NULL) {
 		dt_provider_t	*pvp;
@@ -671,6 +673,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 		upp->off = psp->pps_off;
 		upp->fn = strdup(psp->pps_fn);
 		upp->tp = dt_tp_alloc(dtp);
+		memcpy(&upp->uargs, psp->pps_uargs, sizeof(upp->uargs));
 		if (upp->tp == NULL)
 			goto fail;
 
@@ -702,11 +705,11 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	    break;
 	case DTPPT_USDT:
 	    upp->flags |= PP_IS_USDT;
+	    if (psp->pps_nuargs)
+		    upp->flags |= PP_IS_USDT_NOTE;
+	    break;
+	default:
 	    break;
-	default: ;
-	    /*
-	     * No flags needed for other types.
-	     */
 	}
 
         return uprp;
@@ -973,8 +976,10 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	/* In some cases, we know there are no USDT probes. */  // FIXME: add more checks
 	if (upp->flags & PP_IS_RETURN)
 		goto out;
-
-	dt_cg_tramp_copy_args_from_regs(pcb, 0);
+	else if (upp->flags & PP_IS_USDT_NOTE)
+		dt_cg_tramp_copy_args_from_usdt_spec(pcb, upp->uargs);
+	else
+		dt_cg_tramp_copy_args_from_regs(pcb, 0);
 
 	/*
 	 * Apply arg mappings, if needed.
-- 
2.43.5

