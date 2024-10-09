Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CA5199FB4
	for <dtrace@lists.linux.dev>; Wed,  9 Oct 2024 14:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728482571; cv=none; b=Z1BowK4S461fJ7V41zphqPXHDT0iKwFVEeOFfSlssMM3amyScvR6Un+UMTjE9uH9xizzefMMQBzMm842vL6QU7mHnIEl4IqLDOg8UH2GZuo8WyKOVSm1I3uDDiLfHhl4qiwAA+0OZkbDSxsfRXY5tXI/PrW9FbrC7J4W/d2mqf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728482571; c=relaxed/simple;
	bh=mBIOW/hrhklA+NwWTMDu+myRYgnAVk9SxaMg/wbc3hg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OkLA4AXlioZ6L8LJ2TK00/GrkVgMzyEn6KlB5Dp8pDD6lxTakmRMe5InVmNOIyuP00FpFqejxc4uH7ESZjpWSy+yveHF53S0ufZpZfecIgqnKtxZJu6777dB2FDkPxfThEJjmBUgDYVdH3rHwouGmvRdFnttgretxXVcz3OFJwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WhtAzBL6; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WhtAzBL6"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 499Dfir3004443
	for <dtrace@lists.linux.dev>; Wed, 9 Oct 2024 14:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=+GyX/
	l/ayg9SlkuSgPmSGD2sNbDnHXKSPH6GYQed3V4=; b=WhtAzBL60a5tWIBOoadwS
	PG3cHs1jJ1he1e3OKUixsuKJMuKCREqQ9/mJfuzoWGwKmu5VW5kLJC6In3N+Vdln
	IZu6OkG4qk7QBt725vLDRuJ9dPBCFaFtsv+GF36WFSVX/z4hE9PRSxrTztGmyp/+
	/dHjEQ3Cvvsf6x01OnPPMAZuOmQCdE8N+5NDTOmhL7NlOfn5iXwzKiYgj4TOAM5c
	S2KcBSBoLzTBo8ZDxQBeaUQYdB6VwgSiHdGwk6v6xFNojVmNIbMBB8LSODqWsogT
	WKLI6StBwjt+iNEWu4j8ZvgPZTxa5KiWDbaFRXZK67a9Vnz/Hl5uNDC3NFGT1KmU
	w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 422yyv8d0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Oct 2024 14:02:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 499DdR4e019136
	for <dtrace@lists.linux.dev>; Wed, 9 Oct 2024 14:02:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 422uwex0ja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Oct 2024 14:02:39 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 499E2bOk010849
	for <dtrace@lists.linux.dev>; Wed, 9 Oct 2024 14:02:38 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-194-86.vpn.oracle.com [10.175.194.86])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 422uwex0gk-2;
	Wed, 09 Oct 2024 14:02:38 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH dtrace 1/3] dtrace: add support for probe-specific prog types, stack skips
Date: Wed,  9 Oct 2024 15:02:34 +0100
Message-ID: <20241009140236.883884-2-alan.maguire@oracle.com>
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
X-Proofpoint-GUID: wHnsDe7szYEX53FM4sbYhpLFoav4qmvB
X-Proofpoint-ORIG-GUID: wHnsDe7szYEX53FM4sbYhpLFoav4qmvB

Because fprobe-based tracing does not support all the functions
kprobes+available_filter_functions do, it would be useful to
fall back to a kprobe-based prog where fentry/fexit is not
feasible.

However there are a few blockers to that today.

First, we specify program type and number of stack frames to
skip on a provider basis.  Add support for a probe-specific
callback function that provider implementations can use
to return these values.

Secondly, the tp event id is ambiguous - it can represent a BTF
or a trace event id.  Add a field to allow specification, as
this will be useful in determining whether a probe has a kprobe
or a BTF (fentry/fexit)-based attachment.  This can be used
in provider implementation methods to determine which trampoline
to use for example.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_bpf.c         |  4 ++--
 libdtrace/dt_cc.c          |  2 +-
 libdtrace/dt_probe.c       | 16 ++++++++++++++++
 libdtrace/dt_probe.h       |  2 ++
 libdtrace/dt_prov_fbt.c    |  2 +-
 libdtrace/dt_prov_rawtp.c  |  2 +-
 libdtrace/dt_prov_sdt.c    |  2 +-
 libdtrace/dt_provider.h    |  4 ++++
 libdtrace/dt_provider_tp.c | 12 +++++++++++-
 libdtrace/dt_provider_tp.h |  9 +++++++--
 10 files changed, 46 insertions(+), 9 deletions(-)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index ad11d178..20b564aa 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -117,7 +117,7 @@ int
 dt_bpf_prog_load(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 		 const dtrace_difo_t *dp, uint32_t lvl, char *buf, size_t sz)
 {
-	return dt_bpf_prog_attach(prp->prov->impl->prog_type, 0, 0, 0, dp,
+	return dt_bpf_prog_attach(dt_probe_prog_type(dtp, prp), 0, 0, 0, dp,
 				  lvl, buf, sz);
 }
 
@@ -1226,7 +1226,7 @@ dt_bpf_make_progs(dtrace_hdl_t *dtp, uint_t cflags)
 		 * Enabled probes with no trampoline act like they exist but
 		 * no code is generated for them.
 		 */
-		if (prp->prov->impl->prog_type == BPF_PROG_TYPE_UNSPEC)
+		if (dt_probe_prog_type(dtp, prp) == BPF_PROG_TYPE_UNSPEC)
 			continue;
 
 		dp = dt_construct(dtp, prp, cflags, NULL);
diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index 4202771a..ce0fd60b 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -1182,7 +1182,7 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 				nrp->dofr_data = DMEM_STACK(dtp);
 				continue;
 			case DT_CONST_STACK_SKIP:
-				nrp->dofr_data = prp->prov->impl->stack_skip;
+				nrp->dofr_data = dt_probe_stack_skip(dtp, prp);
 				continue;
 			}
 
diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
index 686e2a66..4be7a81c 100644
--- a/libdtrace/dt_probe.c
+++ b/libdtrace/dt_probe.c
@@ -1378,3 +1378,19 @@ dtrace_id2desc(dtrace_hdl_t *dtp, dtrace_id_t id, dtrace_probedesc_t *pdp)
 
         return 0;
 }
+
+int
+dt_probe_prog_type(dtrace_hdl_t *dtp, const dt_probe_t *prp)
+{
+	if (prp->prov->impl->get_prog_type)
+		return prp->prov->impl->get_prog_type(dtp, prp);
+	return prp->prov->impl->prog_type;
+}
+
+int
+dt_probe_stack_skip(dtrace_hdl_t *dtp, const dt_probe_t *prp)
+{
+	if (prp->prov->impl->get_stack_skip)
+		return prp->prov->impl->get_stack_skip(dtp, prp);
+	return prp->prov->impl->stack_skip;
+}
diff --git a/libdtrace/dt_probe.h b/libdtrace/dt_probe.h
index 2a78cb9c..03bac787 100644
--- a/libdtrace/dt_probe.h
+++ b/libdtrace/dt_probe.h
@@ -103,6 +103,8 @@ extern void dt_probe_init(dtrace_hdl_t *dtp);
 extern void dt_probe_detach_all(dtrace_hdl_t *dtp);
 extern void dt_probe_fini(dtrace_hdl_t *dtp);
 extern void dt_probe_stats(dtrace_hdl_t *dtp);
+extern int dt_probe_prog_type(dtrace_hdl_t *, const dt_probe_t *);
+extern int dt_probe_stack_skip(dtrace_hdl_t *, const dt_probe_t *);
 
 #ifdef	__cplusplus
 }
diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 21f63ddf..718aadbe 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -239,7 +239,7 @@ static int fprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 	if (btf_id <= 0)
 		goto done;
 
-	dt_tp_set_event_id(prp, btf_id);
+	dt_tp_set_event_id(prp, btf_id, TP_EVENT_ID_BTF);
 
 	if (strcmp(desc->prb, "return") == 0) {
 		/* Void function return probes only provide 1 argument. */
diff --git a/libdtrace/dt_prov_rawtp.c b/libdtrace/dt_prov_rawtp.c
index 778a6f9c..22a18050 100644
--- a/libdtrace/dt_prov_rawtp.c
+++ b/libdtrace/dt_prov_rawtp.c
@@ -221,7 +221,7 @@ done:
 static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 		      int *argcp, dt_argdesc_t **argvp)
 {
-	dt_tp_set_event_id(prp, UINT32_MAX);
+	dt_tp_set_event_id(prp, UINT32_MAX, TP_EVENT_ID_TRACEPOINT);
 
 #ifdef HAVE_LIBCTF
 	int			rc, i;
diff --git a/libdtrace/dt_prov_sdt.c b/libdtrace/dt_prov_sdt.c
index 675e0458..8d43282a 100644
--- a/libdtrace/dt_prov_sdt.c
+++ b/libdtrace/dt_prov_sdt.c
@@ -241,7 +241,7 @@ static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 	if (rc < 0 || id == 0)
 		return dt_set_errno(dtp, EDT_ENABLING_ERR);
 
-	dt_tp_set_event_id(prp, id);
+	dt_tp_set_event_id(prp, id, TP_EVENT_ID_TRACEPOINT);
 
 	if (asprintf(&str, "struct trace_event_raw_%s", prp->desc->prb) == -1)
 		return dt_set_errno(dtp, EDT_NOMEM);
diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
index 17b1844c..724d72d7 100644
--- a/libdtrace/dt_provider.h
+++ b/libdtrace/dt_provider.h
@@ -44,7 +44,11 @@ typedef struct dt_argdesc {
 typedef struct dt_provimpl {
 	const char *name;			/* provider generic name */
 	int prog_type;				/* BPF program type */
+	int (*get_prog_type)(dtrace_hdl_t *dtp, /* probe-specific type */
+			     const struct dt_probe *prp);
 	uint32_t stack_skip;			/* # of stack frames to skip */
+	int (*get_stack_skip)(dtrace_hdl_t *dtp,/* probe-specific # */
+			      const struct dt_probe *prp);
 	int (*populate)(dtrace_hdl_t *dtp);	/* register probes */
 	int (*provide)(dtrace_hdl_t *dtp,	/* provide probes */
 		       const dtrace_probedesc_t *pdp);
diff --git a/libdtrace/dt_provider_tp.c b/libdtrace/dt_provider_tp.c
index 50df2328..f8e68f24 100644
--- a/libdtrace/dt_provider_tp.c
+++ b/libdtrace/dt_provider_tp.c
@@ -33,6 +33,7 @@
 struct tp_probe {
 	uint32_t	event_id;	/* tracepoint event id or BTF id */
 	int		event_fd;	/* tracepoint perf event fd */
+	tp_event_id_type event_type;	/* tracepoint event or BTF-based */
 };
 
 /*
@@ -342,12 +343,21 @@ dt_tp_get_event_id(const dt_probe_t *prp)
 	return tpp->event_id;
 }
 
+tp_event_id_type
+dt_tp_get_event_id_type(const dt_probe_t *prp)
+{
+	tp_probe_t	*tpp = prp->prv_data;
+
+	return tpp->event_type;
+}
+
 void
-dt_tp_set_event_id(const dt_probe_t *prp, uint32_t id)
+dt_tp_set_event_id(const dt_probe_t *prp, uint32_t id, tp_event_id_type type)
 {
 	tp_probe_t	*tpp = prp->prv_data;
 
 	tpp->event_id = id;
+	tpp->event_type = type;
 }
 
 /*
diff --git a/libdtrace/dt_provider_tp.h b/libdtrace/dt_provider_tp.h
index e7d52876..09002fa8 100644
--- a/libdtrace/dt_provider_tp.h
+++ b/libdtrace/dt_provider_tp.h
@@ -28,9 +28,14 @@ extern "C" {
 
 typedef struct tp_probe tp_probe_t;
 
+typedef enum {
+	TP_EVENT_ID_TRACEPOINT = 0,
+	TP_EVENT_ID_BTF
+} tp_event_id_type;
+
 extern tp_probe_t *dt_tp_alloc(dtrace_hdl_t *dtp);
 extern int dt_tp_attach(dtrace_hdl_t *dtp, tp_probe_t *tpp, int bpf_fd);
-extern void dt_tp_set_event_id(const struct dt_probe *prp, uint32_t id);
+extern void dt_tp_set_event_id(const struct dt_probe *prp, uint32_t id, tp_event_id_type);
 extern int dt_tp_has_info(const tp_probe_t *tpp);
 extern int dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip,
 			    tp_probe_t *tpp, int *argcp, dt_argdesc_t **argvp);
@@ -42,7 +47,7 @@ extern struct dt_probe *dt_tp_probe_insert(dtrace_hdl_t *dtp,
 					   const char *prv, const char *mod,
 					   const char *fun, const char *prb);
 extern uint32_t dt_tp_get_event_id(const struct dt_probe *prp);
-extern void dt_tp_set_event_id(const struct dt_probe *prp, uint32_t id);
+extern tp_event_id_type dt_tp_get_event_id_type(const struct dt_probe *prp);
 extern int dt_tp_probe_info(dtrace_hdl_t *dtp, FILE *f, int skip,
 			    const struct dt_probe *prp, int *argcp,
 			    dt_argdesc_t **argvp);
-- 
2.43.5

