Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4D13AA4F1
	for <dtrace@lists.linux.dev>; Fri,  5 Jun 2026 22:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697547; cv=none; b=SPgxd8MHLvtRjYhPGZAUAlG4vOfxKXdk7de73mwE2C6m47rlGk154exyKYZB6VH7A6uXP8gDgHqy3UnQxyqt3UrlngxeMFumDFlqqhskHv6wN6CDFjiEh5BYVU/lO14MwXNohJTfWDdxYPlP6ZRzHJ+9x87qG2ntZUXzhZ8s4Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697547; c=relaxed/simple;
	bh=Nrg/RXtS9rwumjEmUr38sDZp5Yg43iS8A4uXw2IRhY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bLlT7s0NQINzjnxcsFNhlo4qlWqgjb/KGcyoFY6uYqYRl8TXzjycljn5918bQns2dF3T3sQPFchdKiU0zWlM9Pf+TNsDh2MgZ3XUqkxk4oQQjxkVU0y3ir1Xx+tTVeCNLTFsNV69GG3ljvfx2N2kmW3hNZr9d+pu5hAiOzuKB7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Weujsm6j; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Weujsm6j"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 655IY0Sl461383;
	Fri, 5 Jun 2026 22:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=kGSWn
	H8iMFE+qwkVt/zpC1wBwFNoU8FvgObzvnlIfyE=; b=Weujsm6jHB9IiVtX140v+
	OMwfXgBwQd6OVxeO9tfmwalXHLwuO0dVKn35X0Y1KHzK1p2WOBf/V9fFoQ0Ysk+L
	AKahr/yFBnCk1kRc/SIoVrMDQILzJ55R+c49Iid6K58N1Q5MzU21zvSgdPtHa9CQ
	BhTvsNv8R1+ep7OPiNrk0B/hvBp/tejxWVuN9c+XkmLUoH8NjiEsmHvO4clDI0ja
	ye+NpcfptXtblo8qVO2kmuC6fZmg7gDuuag8KJ/xGKc4jLRFdGdd/qtx4uUmEylx
	5sl/5sUILOFq/7CVF/D4V5eD0RBlxNQ56IGISH9nPDgSgNtopCrHM8s3NQKx8Y4F
	A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4efresawe5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Jun 2026 22:12:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 655MAPit032988;
	Fri, 5 Jun 2026 22:12:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ek326nvxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Jun 2026 22:12:23 +0000 (GMT)
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 655MCIut039322;
	Fri, 5 Jun 2026 22:12:23 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-53-60.vpn.oracle.com [10.154.53.60])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4ek326nvu6-5;
	Fri, 05 Jun 2026 22:12:22 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>,
        OpenAI Codex <codex@openai.com>
Subject: [PATCH 4/6] dtrace: Add uresolve(symbol_name[, optional_fallback]) for symbol lookup
Date: Fri,  5 Jun 2026 23:12:15 +0100
Message-ID: <20260605221217.1211791-5-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260605221217.1211791-1-alan.maguire@oracle.com>
References: <20260605221217.1211791-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2605130000 definitions=main-2606050219
X-Authority-Analysis: v=2.4 cv=U4Wiy+ru c=1 sm=1 tr=0 ts=6a2349c9 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=7Gl3-_t3PgB9XO-mQDs3:22 a=yPCof4ZbAAAA:8 a=LG5T7v2SAAAA:8
 a=Suke_gzcvfCIMIGJJBoA:9 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22
 cc=ntf awl=host:12313
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDIxOSBTYWx0ZWRfX2fdzZiaubvq0
 XkI2bQEzZ+Tvemyf8UVoRYSn5wEgRc/9dzZaYlFIRjlXNOHJUpCGNqafqsOUupWObHi0p0dy8lR
 M52frG8Ng4LuxXPUhXn2zuehtx+JUiK4UEZeMScP1j4NMj8663KUzR6+6WW+/VyCgSFUT/wsKKC
 0ZVfKZOat9MOuXV34GHkXbg3tf/tlXn8I+vNHkrLwGPN2IqPZTBewg+8Ufk5UWjSRZD1stfZb/s
 ERHHIIaoaREekMfKEGo31n4mPpszLhdaDkWKaWEziUNEjEXzMkodGO2Xa0rGsXlgc8e50RlmU8F
 pAv4DoRzOfWjS4ScDcIxLXfGL7GSHvyeH36g1AGE+PjoZwYUPU8DbL6RGqpVxGAIUOA1T47ZZvR
 pJ2Qwynum4p/PwrEOaDMftboWl8WsebEi023P4QeABmjnVfTTV4mwRm+212beDVoJoWWU0epCNF
 ZPBbxK663vH/5HWmVLPfy5Ciedz9LiN4mxb6n6Bw=
X-Proofpoint-ORIG-GUID: b64lhWzMjVyAnfnExn1L3aMBPLd-lpgW
X-Proofpoint-GUID: b64lhWzMjVyAnfnExn1L3aMBPLd-lpgW

Add uresolve(symbol[, fallback]) to resolve user-space symbols from D
scripts.  uresolve() resolves a symbol to an object-relative offset at
compile time, then computes the process-specific runtime address at probe
fire time as:

    current uprobe IP - probe offset + symbol offset

For pid$target probes, use the target process and its /proc/<pid>/maps state
to find the symbol and translate it to the same object-relative coordinate
used by uprobes.  For system-wide uprobes, resolve the offset from the probed
object file.  In both cases, address generation is shared and remains dynamic;
the presence of a target process does not bake in an absolute address.

Use bpf_get_func_ip() when available so system-wide uprobes use the actual
probed instruction address rather than a saved pt_regs IP that may contain
the resume address.  Retain the saved-IP path as a fallback.

This allows scripts to locate process-local data such as
_PyThreadState_Current across ASLR and across system-wide probes firing in
different processes.  The optional fallback argument is returned when the
symbol cannot be resolved; without it, resolution failure remains a
compile-time error.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
Assisted-by: OpenAI Codex (GPT-5) <codex@openai.com>
---
 include/dtrace/dif_defines.h |   3 +-
 libdtrace/dt_bpf.c           |   1 +
 libdtrace/dt_cg.c            | 456 +++++++++++++++++++++++++++++++++++
 libdtrace/dt_open.c          |   2 +
 libdtrace/dt_probe.h         |   1 +
 libdtrace/dt_prov_uprobe.c   |  58 ++++-
 6 files changed, 516 insertions(+), 5 deletions(-)

diff --git a/include/dtrace/dif_defines.h b/include/dtrace/dif_defines.h
index edb98f06..63b8c293 100644
--- a/include/dtrace/dif_defines.h
+++ b/include/dtrace/dif_defines.h
@@ -213,8 +213,9 @@
 #define DIF_SUBR_LINK_NTOP		45
 #define DIF_SUBR_STACK			46
 #define DIF_SUBR_USTACK			47
+#define DIF_SUBR_URESOLVE		48
 
-#define DIF_SUBR_MAX			47
+#define DIF_SUBR_MAX			48
 
 typedef uint32_t	dif_instr_t;
 
diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 146a66e3..aecd71d9 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -470,6 +470,7 @@ dt_bpf_init_helpers(dtrace_hdl_t *dtp)
 	BPF_HELPER_MAP(probe_read_user_str, probe_read_str);
 	BPF_HELPER_MAP(probe_read_kernel, probe_read);
 	BPF_HELPER_MAP(probe_read_kernel_str, probe_read_str);
+	BPF_HELPER_MAP(get_func_ip, unspec);
 	BPF_HELPER_MAP(get_current_task_btf, unspec);
 	BPF_HELPER_MAP(task_pt_regs, unspec);
 #undef BPF_HELPER_MAP
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 1bd73e11..16c58e35 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -11,6 +11,9 @@
 #include <setjmp.h>
 #include <assert.h>
 #include <errno.h>
+#include <ctype.h>
+#include <fcntl.h>
+#include <unistd.h>
 
 #include <sys/socket.h>			/* needed for if_arp.h on OL7/x86 */
 #include <linux/if_arp.h>		/* ARPHRD_ETHER ARPHRD_INFINIBAND */
@@ -6988,6 +6991,458 @@ dt_cg_subr_link_ntop(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 	dt_regset_free(drp, type->dn_reg);
 }
 
+static const char *
+dt_cg_basename(const char *path)
+{
+	const char	*p;
+
+	p = strrchr(path, '/');
+	return p != NULL ? p + 1 : path;
+}
+
+static int
+dt_cg_parse_objname(const char *mod, Lmid_t *lmidp, const char **objp)
+{
+	char	*end;
+
+	if (mod == NULL || mod[0] == '\0' || strisglob(mod))
+		return -1;
+
+	if (strncmp(mod, "LM", 2) == 0 && isdigit((unsigned char)mod[2])) {
+		*lmidp = strtoul(mod + 2, &end, 16);
+		if (*end != '`' || end[1] == '\0' || strchr(end + 1, '`'))
+			return -1;
+
+		*objp = end + 1;
+		return 0;
+	}
+
+	*lmidp = PR_LMID_EVERY;
+	*objp = mod;
+	return 0;
+}
+
+static int
+dt_cg_probe_objname(const dt_probe_t *prp, Lmid_t *lmidp, const char **objp)
+{
+	if (prp == NULL || prp->desc == NULL)
+		return -1;
+
+	return dt_cg_parse_objname(prp->desc->mod, lmidp, objp);
+}
+
+static int
+dt_cg_obj_matches_path(const char *obj, const char *path)
+{
+	const char	*base;
+	Lmid_t		lmid;
+
+	if (obj == NULL || path == NULL)
+		return 0;
+
+	if (dt_cg_parse_objname(obj, &lmid, &obj) == -1)
+		return 0;
+
+	base = dt_cg_basename(path);
+	return strcmp(obj, path) == 0 || strcmp(obj, base) == 0;
+}
+
+static int
+dt_cg_elf_sym_to_offset(Elf *elf, const GElf_Sym *sym, uint64_t *offp)
+{
+	GElf_Ehdr	ehdr;
+	size_t		i, phnum;
+	uint64_t	base = 0;
+
+	if (sym->st_shndx == SHN_UNDEF ||
+	    gelf_getehdr(elf, &ehdr) == NULL ||
+	    elf_getphdrnum(elf, &phnum) != 0)
+		return -1;
+
+	/*
+	 * Match the object-relative coordinate used by uprobe offsets.  For
+	 * ET_DYN, libproc computes file_dyn_base from the first PT_LOAD
+	 * segment's page offset.  For ET_EXEC, the load bias is zero and the
+	 * first segment's vaddr remains part of the object-relative offset.
+	 */
+	for (i = 0; i < phnum; i++) {
+		GElf_Phdr	phdr;
+
+		if (gelf_getphdr(elf, i, &phdr) == NULL ||
+		    phdr.p_type != PT_LOAD)
+			continue;
+
+		if (ehdr.e_type == ET_EXEC)
+			base = phdr.p_vaddr;
+		else if (ehdr.e_type == ET_DYN && phdr.p_align != 0)
+			base = phdr.p_vaddr & (phdr.p_align - 1);
+
+		break;
+	}
+
+	if (i == phnum || sym->st_value < base)
+		return -1;
+
+	*offp = sym->st_value - base;
+	return 0;
+}
+
+static int
+dt_cg_elf_lookup_symtab(Elf *elf, int type, const char *name, GElf_Sym *symp)
+{
+	Elf_Scn		*scn = NULL;
+
+	while ((scn = elf_nextscn(elf, scn)) != NULL) {
+		GElf_Shdr	shdr;
+		Elf_Data	*data;
+		size_t		i, nsyms;
+
+		if (gelf_getshdr(scn, &shdr) == NULL ||
+		    shdr.sh_type != type ||
+		    shdr.sh_entsize == 0)
+			continue;
+
+		data = elf_getdata(scn, NULL);
+		if (data == NULL)
+			continue;
+
+		nsyms = shdr.sh_size / shdr.sh_entsize;
+		for (i = 0; i < nsyms; i++) {
+			GElf_Sym	sym;
+			const char	*s;
+			uchar_t		stype;
+
+			if (gelf_getsym(data, i, &sym) == NULL ||
+			    sym.st_name == 0 ||
+			    sym.st_shndx == SHN_UNDEF)
+				continue;
+
+			stype = GELF_ST_TYPE(sym.st_info);
+			if (stype == STT_FILE || stype == STT_SECTION)
+				continue;
+
+			s = elf_strptr(elf, shdr.sh_link, sym.st_name);
+			if (s != NULL && strcmp(s, name) == 0) {
+				*symp = sym;
+				return 0;
+			}
+		}
+	}
+
+	return -1;
+}
+
+static int
+dt_cg_elf_lookup_offset(const char *path, const char *name, uint64_t *offp)
+{
+	GElf_Sym	sym;
+	Elf		*elf = NULL;
+	int		fd, rc = -1;
+
+	fd = open(path, O_RDONLY);
+	if (fd < 0)
+		return -1;
+
+	elf = elf_begin(fd, ELF_C_READ_MMAP, NULL);
+	if (elf == NULL || elf_kind(elf) != ELF_K_ELF)
+		goto out;
+
+	if (dt_cg_elf_lookup_symtab(elf, SHT_SYMTAB, name, &sym) == -1 &&
+	    dt_cg_elf_lookup_symtab(elf, SHT_DYNSYM, name, &sym) == -1)
+		goto out;
+
+	rc = dt_cg_elf_sym_to_offset(elf, &sym, offp);
+
+out:
+	if (elf != NULL)
+		elf_end(elf);
+	close(fd);
+	return rc;
+}
+
+typedef struct dt_cg_uresolve_arg {
+	const char	*name;
+	const char	*obj;
+	int		explicit_obj;
+	int		nmatches;
+	int		no_path;
+	int		no_symbol;
+	int		bad_object;
+	int		different_offset;
+	uint64_t	off;
+} dt_cg_uresolve_arg_t;
+
+static int
+dt_cg_uresolve_probe(dtrace_hdl_t *dtp, dt_probe_t *prp, void *arg)
+{
+	dt_cg_uresolve_arg_t	*uap = arg;
+	const char		*path;
+	uint64_t		off;
+
+	path = dt_probe_uprobe_path(prp);
+	if (path == NULL) {
+		uap->no_path = 1;
+		return 1;
+	}
+
+	if (uap->explicit_obj && !dt_cg_obj_matches_path(uap->obj, path)) {
+		uap->bad_object = 1;
+		return 1;
+	}
+
+	if (dt_cg_elf_lookup_offset(path, uap->name, &off) != 0) {
+		uap->no_symbol = 1;
+		return 1;
+	}
+
+	if (uap->nmatches++ == 0) {
+		uap->off = off;
+		return 0;
+	}
+
+	if (uap->off != off) {
+		uap->different_offset = 1;
+		return 1;
+	}
+
+	return 0;
+}
+
+static int
+dt_cg_uresolve_from_probe_file(dt_node_t *dnp, dt_node_t *arg,
+			       const char *name, const char *obj,
+			       int explicit_obj, int allow_fallback,
+			       uint64_t *offp)
+{
+	dt_cg_uresolve_arg_t	uarg = { 0 };
+	dtrace_hdl_t		*dtp = yypcb->pcb_hdl;
+
+	uarg.name = name;
+	uarg.obj = obj;
+	uarg.explicit_obj = explicit_obj;
+
+	if (yypcb->pcb_pdesc != NULL)
+		dt_probe_iter(dtp, yypcb->pcb_pdesc, dt_cg_uresolve_probe,
+			      NULL, &uarg);
+	else if (yypcb->pcb_probe != NULL)
+		dt_cg_uresolve_probe(dtp, yypcb->pcb_probe, &uarg);
+
+	if (uarg.bad_object)
+		dnerror(arg, D_PROC_NAME, "uresolve( ) object %s does not "
+			"match the current uprobe object\n", obj);
+	if (uarg.no_path)
+		dnerror(dnp, D_PROC_NAME, "uresolve( ) requires a unique "
+			"uprobe object path for this probe\n");
+	if (uarg.no_symbol) {
+		if (allow_fallback)
+			return -1;
+
+		dnerror(arg, D_PROC_FUNC, "failed to resolve user symbol %s "
+			"in the current uprobe object\n", arg->dn_string);
+	}
+
+	if (uarg.nmatches == 0) {
+		dnerror(dnp, D_PROC_NAME, "uresolve( ) cannot determine the "
+			"current uprobe object\n");
+	}
+
+	if (uarg.different_offset)
+		dnerror(arg, D_PROC_FUNC, "uresolve( ) matched multiple "
+			"uprobe objects with different offsets for symbol %s\n",
+			arg->dn_string);
+
+	*offp = uarg.off;
+	return 0;
+}
+
+static int
+dt_cg_uresolve_from_target(dt_node_t *dnp, dt_node_t *arg, pid_t pid,
+			   Lmid_t lmid, const char *obj, const char *name,
+			   int allow_fallback, uint64_t *offp)
+{
+	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
+	const prmap_t	*mapp, *first;
+	GElf_Sym	sym;
+	pid_t		gpid;
+	int		err = 0;
+
+	gpid = dt_proc_grab_lock(dtp, pid,
+	    DTRACE_PROC_WAITING | DTRACE_PROC_SHORTLIVED);
+	if (gpid <= 0)
+		dnerror(dnp, D_PROC_GRAB, "failed to grab target process %d "
+			"for uresolve( )\n", pid);
+
+	if (dt_Pxlookup_by_name(dtp, gpid, lmid, obj, name,
+	    &sym, NULL) != 0) {
+		err = 1;
+	} else if ((mapp = dt_Paddr_to_map(dtp, gpid, sym.st_value)) == NULL ||
+	    mapp->pr_file == NULL ||
+	    (first = mapp->pr_file->first_segment) == NULL ||
+	    sym.st_value < first->pr_vaddr) {
+		err = 1;
+	} else {
+		*offp = sym.st_value - first->pr_vaddr;
+	}
+
+	dt_proc_release_unlock(dtp, gpid);
+
+	if (err == 0)
+		return 0;
+
+	if (allow_fallback)
+		return -1;
+
+	dnerror(arg, D_PROC_FUNC, "failed to resolve target user symbol %s\n",
+		arg->dn_string);
+}
+
+static void
+dt_cg_uresolve_emit_offset_addr(dt_node_t *dnp, dt_irlist_t *dlp,
+				dt_regset_t *drp, uint64_t symoff)
+{
+	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
+	int	treg;
+
+	/*
+	 * Compute the current object base from the saved user PC and the
+	 * uprobe offset, then add the compile-time-resolved symbol offset.
+	 * When available, use the kernel's current uprobe IP directly because
+	 * the saved register block may not reliably carry the breakpoint
+	 * address for system-wide uprobes across different processes.
+	 */
+	if (dtp->dt_bpfhelper[BPF_FUNC_get_func_ip] != BPF_FUNC_unspec) {
+		if (dt_regset_xalloc_args(drp) == -1)
+			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
+		if (dt_regset_xalloc(drp, BPF_REG_0) == -1)
+			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
+
+		dt_cg_access_dctx(BPF_REG_1, dlp, drp, DCTX_CTX);
+		emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_get_func_ip]));
+		dt_regset_free_args(drp);
+
+		if ((dnp->dn_reg = dt_regset_alloc(drp)) == -1)
+			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
+
+		emit(dlp, BPF_MOV_REG(dnp->dn_reg, BPF_REG_0));
+		dt_regset_free(drp, BPF_REG_0);
+	} else {
+		if ((dnp->dn_reg = dt_regset_alloc(drp)) == -1)
+			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
+
+		if ((treg = dt_regset_alloc(drp)) == -1)
+			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
+
+		dt_cg_access_dctx(treg, dlp, drp, DCTX_MST);
+		emit(dlp, BPF_LOAD(BPF_DW, dnp->dn_reg, treg,
+				   DMST_REGS + PT_REGS_IP));
+		dt_regset_free(drp, treg);
+	}
+
+	if ((treg = dt_regset_alloc(drp)) == -1)
+		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
+
+	dt_cg_access_dctx(treg, dlp, drp, DCTX_MST);
+	emit(dlp, BPF_LOAD(BPF_DW, treg, treg, DMST_PROFF));
+	emit(dlp, BPF_ALU64_REG(BPF_SUB, dnp->dn_reg, treg));
+	dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, treg, symoff);
+	emit(dlp, BPF_ALU64_REG(BPF_ADD, dnp->dn_reg, treg));
+
+	dt_regset_free(drp, treg);
+}
+
+static void
+dt_cg_subr_uresolve(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
+{
+	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
+	dt_node_t	*arg = dnp->dn_args;
+	dt_node_t	*fallback;
+	dt_ident_t	*tidp;
+	pid_t		pid = 0;
+	char		*spec, *tick;
+	const char	*obj = NULL;
+	const char	*name;
+	Lmid_t		lmid = PR_LMID_EVERY;
+	uint64_t	off = 0;
+	int		err = 0, explicit_obj = 0;
+	int		use_fallback = 0;
+
+	if (arg == NULL || (arg->dn_list != NULL &&
+	    arg->dn_list->dn_list != NULL))
+		dnerror(dnp, D_PROTO_LEN, "uresolve( ) prototype mismatch: "
+			"expected 1 or 2 arguments\n");
+
+	if (arg->dn_kind != DT_NODE_STRING)
+		dnerror(arg, D_PROTO_ARG, "uresolve( ) argument #1 must be "
+			"a string constant\n");
+
+	fallback = arg->dn_list;
+	tidp = dt_idhash_lookup(dtp->dt_macros, "target");
+	if (tidp != NULL)
+		pid = tidp->di_id;
+
+	spec = strdup(arg->dn_string);
+	if (spec == NULL)
+		longjmp(yypcb->pcb_jmpbuf, EDT_NOMEM);
+
+	tick = strrchr(spec, '`');
+	if (tick != NULL) {
+		*tick = '\0';
+		obj = spec;
+		name = tick + 1;
+		explicit_obj = 1;
+
+		if (*obj == '\0' || *name == '\0')
+			err = 1;
+	} else {
+		name = spec;
+	}
+
+	if (err != 0) {
+		free(spec);
+		dnerror(arg, D_PROC_NAME, "uresolve( ) argument must be "
+			"\"symbol\" or \"object`symbol\"\n");
+	}
+
+	if (pid == 0) {
+		if (dt_cg_uresolve_from_probe_file(dnp, arg, name, obj,
+		    explicit_obj, fallback != NULL, &off) != 0)
+			use_fallback = 1;
+		goto done;
+	}
+
+	if (explicit_obj) {
+		if (dt_cg_parse_objname(obj, &lmid, &obj) != 0) {
+			free(spec);
+			dnerror(arg, D_PROC_NAME, "uresolve( ) object %s is "
+				"not a valid user object name\n", arg->dn_string);
+		}
+	} else if (dt_cg_probe_objname(yypcb->pcb_probe, &lmid, &obj) != 0) {
+		const char	*path = dt_probe_uprobe_path(yypcb->pcb_probe);
+
+		if (path != NULL) {
+			obj = path;
+			lmid = PR_LMID_EVERY;
+		} else {
+			free(spec);
+			dnerror(arg, D_PROC_NAME, "unqualified uresolve( ) "
+				"requires a concrete probe module\n");
+		}
+	}
+
+	if (dt_cg_uresolve_from_target(dnp, arg, pid, lmid, obj, name,
+	    fallback != NULL, &off) != 0)
+		use_fallback = 1;
+
+done:
+	free(spec);
+
+	if (use_fallback) {
+		dt_cg_node(fallback, dlp, drp);
+		dnp->dn_reg = fallback->dn_reg;
+	} else
+		dt_cg_uresolve_emit_offset_addr(dnp, dlp, drp, off);
+}
+
 typedef void dt_cg_subr_f(dt_node_t *, dt_irlist_t *, dt_regset_t *);
 
 static dt_cg_subr_f *_dt_cg_subr[DIF_SUBR_MAX + 1] = {
@@ -7039,6 +7494,7 @@ static dt_cg_subr_f *_dt_cg_subr[DIF_SUBR_MAX + 1] = {
 	[DIF_SUBR_LINK_NTOP]		= &dt_cg_subr_link_ntop,
 	[DIF_SUBR_STACK]		= &dt_cg_subr_stack,
 	[DIF_SUBR_USTACK]		= &dt_cg_subr_ustack,
+	[DIF_SUBR_URESOLVE]		= &dt_cg_subr_uresolve,
 };
 
 static void
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index ca00788a..0505e2ff 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -330,6 +330,8 @@ static const dt_ident_t _dtrace_globals[] = {
 	DT_VERS_1_2, &dt_idops_func, "_usymaddr(uintptr_t)" },
 { "uregs", DT_IDENT_ARRAY, 0, DIF_VAR_UREGS, DT_ATTR_STABCMN, DT_VERS_1_0,
 	&dt_idops_regs, NULL },
+{ "uresolve", DT_IDENT_FUNC, 0, DIF_SUBR_URESOLVE, DT_ATTR_STABCMN,
+	DT_VERS_2_0, &dt_idops_func, "uintptr_t(string, [uintptr_t])" },
 { "ustack", DT_IDENT_FUNC, DT_IDFLG_DPTR, DIF_SUBR_USTACK, DT_ATTR_STABCMN,
 	DT_VERS_1_0, &dt_idops_func, "dt_stack_t([uint32_t], [uint32_t])" },
 { "ustackdepth", DT_IDENT_SCALAR, 0, DIF_VAR_USTACKDEPTH,
diff --git a/libdtrace/dt_probe.h b/libdtrace/dt_probe.h
index 54053cd3..bff47055 100644
--- a/libdtrace/dt_probe.h
+++ b/libdtrace/dt_probe.h
@@ -102,6 +102,7 @@ typedef int dt_dependent_f(dtrace_hdl_t *dtp, dt_probe_t *prp, void *arg);
 extern int dt_probe_dependent_iter(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 				   dt_dependent_f *func, void *arg);
 
+extern const char *dt_probe_uprobe_path(const dt_probe_t *prp);
 
 extern void dt_probe_init(dtrace_hdl_t *dtp);
 extern void dt_probe_detach_all(dtrace_hdl_t *dtp);
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index d53b1e43..9a481f59 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -307,6 +307,47 @@ typedef struct uprobe_data {
 	int	ref_shift;
 } uprobe_data_t;
 
+dt_provimpl_t	dt_pid;
+dt_provimpl_t	dt_usdt;
+dt_provimpl_t	dt_stapsdt;
+
+const char *
+dt_probe_uprobe_path(const dt_probe_t *prp)
+{
+	const dt_uprobe_t	*upp;
+	const list_probe_t	*pup;
+	const char		*path = NULL;
+
+	if (prp == NULL || prp->prov == NULL)
+		return NULL;
+
+	if (prp->prov->impl == &dt_uprobe) {
+		upp = prp->prv_data;
+		return upp != NULL ? upp->fn : NULL;
+	}
+
+	if (prp->prov->impl != &dt_pid &&
+	    prp->prov->impl != &dt_usdt &&
+	    prp->prov->impl != &dt_stapsdt)
+		return NULL;
+
+	for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
+		if (pup->probe == NULL || pup->probe->prv_data == NULL)
+			return NULL;
+
+		upp = pup->probe->prv_data;
+		if (upp->fn == NULL)
+			return NULL;
+
+		if (path == NULL)
+			path = upp->fn;
+		else if (strcmp(path, upp->fn) != 0)
+			return NULL;
+	}
+
+	return path;
+}
+
 static const dtrace_pattr_t	pattr = {
 { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
 { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
@@ -315,10 +356,6 @@ static const dtrace_pattr_t	pattr = {
 { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
 };
 
-dt_provimpl_t	dt_pid;
-dt_provimpl_t	dt_usdt;
-dt_provimpl_t	dt_stapsdt;
-
 #define UPROBE_CONFIG	"/sys/bus/event_source/devices/uprobe/"
 #define PERF_TYPE_FILE	(UPROBE_CONFIG "type")
 #define RET_FLAG_FILE	(UPROBE_CONFIG "format/retprobe")
@@ -1392,6 +1429,19 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	 */
 	dt_cg_tramp_copy_regs(pcb);
 
+	/*
+	 * On some architectures the saved user IP in the uprobe pt_regs is the
+	 * resume address rather than the probed instruction address.  Normalize
+	 * the saved IP to the actual uprobe address when the kernel can provide
+	 * it so consumers such as uresolve() can derive the correct object base.
+	 */
+	if (dtp->dt_bpfhelper[BPF_FUNC_get_func_ip] != BPF_FUNC_unspec) {
+		emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_8));
+		emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_get_func_ip]));
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7,
+				    DMST_REGS + PT_REGS_IP, BPF_REG_0));
+	}
+
 	/*
 	 * Record the uprobe instrumentation offset in the probe context.
 	 * This is the same object-relative offset passed to perf_event_open()
-- 
2.43.5

