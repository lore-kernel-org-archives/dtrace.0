Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F001A0BFF
	for <dtrace@lists.linux.dev>; Wed,  9 Oct 2024 14:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728482564; cv=none; b=naTKQQoxlzkHf5qiw5W6eCZqzpyEJ26ZrcghkKa8PqnH37m7RyP7+quWJUZIAZRn62vcU2zZjiIN+uAuTf/Uhubjpn3r6jMmPa42x/jp9rxKJ+6YL39WwbE6hZXyVVy1wsKI4BMR/EduEK3TFPwMjqbTiou0wxG7fTG8PLYiWa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728482564; c=relaxed/simple;
	bh=QwQNCUEfQs4vHr4hmHn7kHFtawxkT1JFQsjpsNbr2p4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DqOntJHz5rHVoTOI/WwuavMYjWAbmDoL3on/AmwOIpZuleflAz3saV9IJjbd0c8mK3thnoB3wq/U3cS4+bbHNTuxX6l/eXaTVC0SF5FPCJZjDGvPcnRZLrJos58AHqCK1Iyos0zg/B66GssT2AXGoO+Isb7Bql1z3+L5y71XLF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gmZd832A; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gmZd832A"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 499Dffpj032264
	for <dtrace@lists.linux.dev>; Wed, 9 Oct 2024 14:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=Mgbuu
	PGB3p/2VdEUSDipJqtsmY95ykoYuegN3WRTb5A=; b=gmZd832ANLYG/81Dx4Nsr
	vlfEpMv3Be0P6S10fikpls7SLP/OkuHiRyb//t1iVLJbycfva3f4OX9QGot2iaAu
	CkVfXXIYqvx6CGNytdtRAqMq6uMJ0I9tpztdScyPiMKdZKLTdBlQyJdFe4tmB1d7
	ihGJqWpJd9y7jHA7E68bJ1T8LpuwT+SIL+EnsMY741DdfrugAtCiAS9h3hoK1Vpy
	qaUW563xtoO5vm4MmuVq/Xo8v+spi0K/wr4Qb1akz+sCFpyatZ3oLq921QD7WA/C
	KmpasEN0bjcIgz9ucXMbYuwoQitZT/PRVot2tmCjKtvLHG/hkSttnC2M6exQuwJ2
	Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42302pg7ck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Oct 2024 14:02:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 499CEnCN019080
	for <dtrace@lists.linux.dev>; Wed, 9 Oct 2024 14:02:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 422uwex0k8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Oct 2024 14:02:40 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 499E2bOn010849
	for <dtrace@lists.linux.dev>; Wed, 9 Oct 2024 14:02:39 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-194-86.vpn.oracle.com [10.175.194.86])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 422uwex0gk-3;
	Wed, 09 Oct 2024 14:02:39 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH dtrace 2/3] fbt: support ".isra.0" suffixed functions
Date: Wed,  9 Oct 2024 15:02:35 +0100
Message-ID: <20241009140236.883884-3-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20241009140236.883884-1-alan.maguire@oracle.com>
References: <20241009140236.883884-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_12,2024-10-09_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410090086
X-Proofpoint-ORIG-GUID: MwyBVQfAfVF2iH7chcT8eBcHiYNNuDL_
X-Proofpoint-GUID: MwyBVQfAfVF2iH7chcT8eBcHiYNNuDL_

gcc adds suffixes when it carries out optimizations, but often
these leave parameters to functions intact.  Many of these functions
(like finish_task_switch()) are important for tracing (and they
are present in available_filter_functions so are traceable) so it is
valuable to support probing them.  For kprobes, all that is needed
is to ensure that the event name does not contain a ".".

For fprobes the situation is more complex - the function may be
in BTF, but even if it is, its BTF representation does not have
a "." suffix so searching kallsyms based on the BTF name fails.
As a result it is desirable to fall back to using kprobes for
such cases.  Implement fallbacks in the fprobe provider methods
which use kprobe trampoline, attachment etc to cover these cases.
Having callback functions for stack size/prog type allows us to
dynamically determine these values on a per-probe basis.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_prov_fbt.c | 82 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 69 insertions(+), 13 deletions(-)

diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 718aadbe..a7c2627a 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -57,6 +57,10 @@ static const dtrace_pattr_t	pattr = {
 { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_ISA },
 };
 
+static int kprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl);
+static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd);
+static void kprobe_detach(dtrace_hdl_t *dtp, const dt_probe_t *prp);
+
 /*
  * Scan the PROBE_LIST file and add entry and return probes for every function
  * that is listed.
@@ -106,10 +110,6 @@ static int populate(dtrace_hdl_t *dtp)
 				p++;
 		}
 
-		/* Weed out synthetic symbol names (that are invalid). */
-		if (strchr(buf, '.') != NULL)
-			continue;
-
 #define strstarts(var, x) (strncmp(var, x, strlen (x)) == 0)
 		/* Weed out __ftrace_invalid_address___* entries. */
 		if (strstarts(buf, "__ftrace_invalid_address__") ||
@@ -176,6 +176,10 @@ static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	dt_irlist_t	*dlp = &pcb->pcb_ir;
 	dt_probe_t	*prp = pcb->pcb_probe;
 
+	/* legacy kprobe fallback? */
+	if (dt_tp_get_event_id_type(prp) == TP_EVENT_ID_TRACEPOINT)
+		return kprobe_trampoline(pcb, exitlbl);
+
 	dt_cg_tramp_prologue(pcb);
 
 	if (strcmp(pcb->pcb_probe->desc->prb, "entry") == 0) {
@@ -236,8 +240,12 @@ static int fprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 
 	btf_id = dt_btf_lookup_name_kind(dtp, dmp->dm_btf, desc->fun,
 					 BTF_KIND_FUNC);
-	if (btf_id <= 0)
+	if (btf_id <= 0) {
+		/* No BTF info, we will fall back to kprobe */
+		if (btf_id == -ENOENT)
+			return 0;
 		goto done;
+	}
 
 	dt_tp_set_event_id(prp, btf_id, TP_EVENT_ID_BTF);
 
@@ -294,6 +302,10 @@ static int fprobe_prog_load(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 	const dtrace_probedesc_t	*desc = prp->desc;
 	dt_module_t			*dmp;
 
+	/* legacy kprobe fallback? */
+	if (dt_tp_get_event_id_type(prp) == TP_EVENT_ID_TRACEPOINT)
+		return dt_bpf_prog_load(dtp, prp, dp, lvl, buf, sz);
+
 	atype = strcmp(desc->prb, "entry") == 0 ? BPF_TRACE_FENTRY
 						: BPF_TRACE_FEXIT;
 
@@ -312,6 +324,34 @@ static int fprobe_prog_load(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 	return rc;
 }
 
+static int fprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
+{
+	if (dt_tp_get_event_id_type(prp) == TP_EVENT_ID_TRACEPOINT)
+		return kprobe_attach(dtp, prp, bpf_fd);
+	return dt_tp_probe_attach_raw(dtp, prp, bpf_fd);
+}
+
+static void fprobe_detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
+{
+	if (dt_tp_get_event_id_type(prp) == TP_EVENT_ID_TRACEPOINT)
+		return kprobe_detach(dtp, prp);
+	return dt_tp_probe_detach(dtp, prp);
+}
+
+static int fprobe_prog_type(dtrace_hdl_t *dtp, const dt_probe_t *prp)
+{
+	if (dt_tp_get_event_id_type(prp) == TP_EVENT_ID_TRACEPOINT)
+		return BPF_PROG_TYPE_KPROBE;
+	return BPF_PROG_TYPE_TRACING;
+}
+
+static int fprobe_stack_skip(dtrace_hdl_t *dtp, const dt_probe_t *prp)
+{
+	if (dt_tp_get_event_id_type(prp) == TP_EVENT_ID_TRACEPOINT)
+		return 0;
+	return 4;
+}
+
 /*******************************\
  * KPROBE-based implementation *
 \*******************************/
@@ -363,7 +403,7 @@ static int kprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 {
 	if (!dt_tp_probe_has_info(prp)) {
-		char	*fn;
+		char	*fn, *fun, *suffix;
 		FILE	*f;
 		size_t	len;
 		int	fd, rc = -1;
@@ -376,22 +416,36 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 		if (fd == -1)
 			return -ENOENT;
 
+		/* remove possible .isra.0 suffix as "." is not supported in
+		 * trace event names.
+		 */
+		if (asprintf(&fun, "%s", prp->desc->fun) < 0)
+			return -ENOMEM;
+		suffix = strchr(fun, '.');
+		if (suffix)
+			*suffix = '\0';
+
 		rc = dprintf(fd, "%c:" FBT_GROUP_FMT "/%s %s\n",
 			     prp->desc->prb[0] == 'e' ? 'p' : 'r',
-			     FBT_GROUP_DATA, prp->desc->fun, prp->desc->fun);
+			     FBT_GROUP_DATA, fun, prp->desc->fun);
 		close(fd);
-		if (rc == -1)
+		if (rc == -1) {
+			free(fun);
 			return -ENOENT;
+		}
 
 		/* create format file name */
 		len = snprintf(NULL, 0, "%s" FBT_GROUP_FMT "/%s/format",
-			       EVENTSFS, FBT_GROUP_DATA, prp->desc->fun) + 1;
+			       EVENTSFS, FBT_GROUP_DATA, fun) + 1;
 		fn = dt_alloc(dtp, len);
-		if (fn == NULL)
+		if (fn == NULL) {
+			free(fun);
 			return -ENOENT;
+		}
 
 		snprintf(fn, len, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
-			 FBT_GROUP_DATA, prp->desc->fun);
+			 FBT_GROUP_DATA, fun);
+		free(fun);
 
 		/* open format file */
 		f = fopen(fn, "r");
@@ -443,13 +497,15 @@ static void kprobe_detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
 dt_provimpl_t	dt_fbt_fprobe = {
 	.name		= prvname,
 	.prog_type	= BPF_PROG_TYPE_TRACING,
+	.get_prog_type  = fprobe_prog_type,
 	.stack_skip	= 4,
+	.get_stack_skip	= fprobe_stack_skip,
 	.populate	= &populate,
 	.load_prog	= &fprobe_prog_load,
 	.trampoline	= &fprobe_trampoline,
-	.attach		= &dt_tp_probe_attach_raw,
+	.attach		= &fprobe_attach,
 	.probe_info	= &fprobe_probe_info,
-	.detach		= &dt_tp_probe_detach,
+	.detach		= &fprobe_detach,
 	.probe_destroy	= &dt_tp_probe_destroy,
 };
 
-- 
2.43.5

