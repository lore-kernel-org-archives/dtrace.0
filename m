Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7304320E03D
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729094060; cv=none; b=MhW8fqW9ByCXh5yPOkkbj2w6bHrqp9tfOeVq/77VHpMp86TRdmR1XwvwqgE8viwldejfQpC38/ba4ANdVfo27a2L8JJnmwEfwc0UkFiLVLyPKsxgTJ8OXBmNpOCoijrz4FCqo9N3XZgptPFRtMwCQJyaGAFs7hhUJEjlI9Z78Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729094060; c=relaxed/simple;
	bh=NLQV4crjyH6OwxPjQaoZrZ/T2k1Oy4rbclh9dqu7rUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EqdArVIcNrreA5tdTcW21sDQ20hcSa3RbvVebCVgkFJ/kxCExbWE4uifEx9Wojw/20VsxScCpC23FFlLNAiAgK2qEySAOntdOgv6ezBfJb0ZbCvFtZVqLhg0SB5dtvxL919lSA0jFQGiSX1R8UWyUPPMMl3RweqNQ4seVsw53s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cLfKdC+T; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cLfKdC+T"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GFfg0R028860
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=hPuqn
	Uto518I2Oyzisuu2ozXagBnoM0AHV00Zm7/fEY=; b=cLfKdC+TcbEfOczOad6QC
	GXixi66KRAazx/xtmxmOIEoeU0Juqw6lRyYCbHsvocmosnn06GgVUQrtocbLssSt
	PDnUe79vfiBlLIvCvYGZ4oIjNNmW23DsfGPfXcZTHirWU2VbMyir4eURL3H/SQHx
	9HulYRvDf8J2YUHxFFC16ECcBLir/4rIvEwQfIrg6NXPZKLQuEg6ezGGbb5SAfmr
	jcBsWaGlOm4I41ciBJSoMRtoAFxqeF72SU+0SmRPzW0DM9nCBeVnkefi26mhbi8O
	BiRFmFOwLzGLQlK1WE34OgkZRxicqA94x0NWnQu5ZPHjfSpEcTWXCcmJOvSvDOTU
	g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427h5cmfk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:54:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49GFhSxH027314
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:54:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjfk27f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:54:14 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49GFsBrJ014752
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:54:14 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-205-31.vpn.oracle.com [10.175.205.31])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 427fjfk24u-4;
	Wed, 16 Oct 2024 15:54:13 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v3 dtrace 3/4] fbt: avoid mix of kprobe, fprobe implementations for used probes
Date: Wed, 16 Oct 2024 16:54:08 +0100
Message-ID: <20241016155409.4038017-4-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20241016155409.4038017-1-alan.maguire@oracle.com>
References: <20241016155409.4038017-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-16_13,2024-10-16_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410160100
X-Proofpoint-ORIG-GUID: i3_YI0hspKtjo2IUtjpxNsMczi97wfRy
X-Proofpoint-GUID: i3_YI0hspKtjo2IUtjpxNsMczi97wfRy

If we have a mix of kprobe and fprobe implementations, it causes problems
for DTrace since we cannot guarantee execution in program order.

When fprobes are active, the only place kprobes are used as fbt
implementation is for "."-suffixed functions that cannot be supported
by fprobe.  However, by using kprobes for this case, we run the risk of
mixing fprobe and kprobe.  So use probe_info callbacks (invoked when
setting context during compilation) to count instances of fbt probe use
for each provider/implementation.  If we have a mix of fprobes and kprobes,
revert to using the kprobe implementation for the existing fprobes.
This involves setting provider impl to kprobes, and resetting event
id for any existing fprobes (since it will be set to the BTF id of the
function).

There is no risk in having multiple probes for the same function since
a kprobe for a "."-suffixed function will not be added if the
unsuffixed probe already exists (in practice, such a case is not seen
but is not impossible).

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_prov_fbt.c | 66 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 2 deletions(-)

diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 06ea78ca..259cf674 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -76,7 +76,7 @@ static int populate(dtrace_hdl_t *dtp)
 
 	default_impl = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? &dt_fbt_fprobe : &dt_fbt_kprobe;
 
-	default_prv = dt_provider_create(dtp, prvname, default_impl, &pattr, NULL);
+	default_prv = dt_provider_create(dtp, prvname, default_impl, &pattr, 0);
 	if (default_prv == NULL)
 		return -1;			/* errno already set */
 	if (default_impl == &dt_fbt_kprobe)
@@ -148,7 +148,7 @@ static int populate(dtrace_hdl_t *dtp)
 			if (!kprobe_prv) {
 				kprobe_prv = dt_provider_create(dtp, prvname,
 								impl, &pattr,
-								NULL);
+								0);
 				if (kprobe_prv == NULL)
 					return -1;
 			}
@@ -187,6 +187,56 @@ static int populate(dtrace_hdl_t *dtp)
 	return n;
 }
 
+static int
+fbt_unset_event_id(dtrace_hdl_t *dtp, dt_probe_t *prp, dt_provider_t *prv)
+{
+	if (prp->prov == prv)
+		dt_tp_set_event_id(prp, 0);
+	return 0;
+}
+
+/* Ensure we do not have a mix of kprobe and fprobe implementations for
+ * _actually used_ probes; fall back to using kprobe implementation for
+ * fprobe provider if so.
+ */
+void fbt_check_impl(struct dtrace_hdl *dtp, dt_provider_t *fbt_prv)
+{
+	dt_htab_next_t          *it = NULL;
+	dt_provider_t		*pvp;
+	dtrace_probedesc_t	fbt_desc = {	.prv = "fbt",
+						.mod = "",
+						.fun = "",
+						.prb = ""
+					   };
+
+
+	/* count number of used probes for provider + impl */
+	fbt_prv->prv_data++;
+
+	/* check other provider + impl (if any) */
+	while ((pvp = dt_htab_next(dtp->dt_provs, &it)) != NULL) {
+		if (pvp == fbt_prv || strcmp(pvp->desc.dtvd_name, "fbt") != 0)
+			continue;
+		if (pvp->prv_data == 0)
+			return;
+		/* already done? */
+		if (pvp->impl == fbt_prv->impl)
+			return;
+		/* multiple fprobe, kprobe probes; revert to kprobes */
+		if (fbt_prv->impl != &dt_fbt_kprobe)
+			pvp = fbt_prv;
+		break;
+	}
+	if (!pvp)
+		return;
+	dt_dprintf("reverting to kprobe impl for %s due to fprobe/kprobe mix\n",
+		   pvp->desc.dtvd_name);
+	pvp->impl = &dt_fbt_kprobe;
+	dt_probe_iter(dtp, &fbt_desc, (dt_probe_f *)fbt_unset_event_id, NULL,
+		      pvp);
+
+}
+
 /*******************************\
  * FPROBE-based implementation *
 \*******************************/
@@ -296,6 +346,8 @@ static int fprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 		goto done;
 	}
 
+	fbt_check_impl(dtp, prp->prov);
+
 	argc = dt_btf_func_argc(dtp, dmp->dm_btf, btf_id);
 	if (argc == 0)
 		goto done;
@@ -453,6 +505,15 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 	return dt_tp_probe_attach(dtp, prp, bpf_fd);
 }
 
+static int kprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
+			     int *argcp, dt_argdesc_t **argvp)
+{
+	fbt_check_impl(dtp, prp->prov);
+	*argcp = 0;
+	*argvp = NULL;
+	return 0;
+}
+
 /*
  * Try to clean up system resources that may have been allocated for this
  * probe.
@@ -502,6 +563,7 @@ dt_provimpl_t	dt_fbt_kprobe = {
 	.load_prog	= &dt_bpf_prog_load,
 	.trampoline	= &kprobe_trampoline,
 	.attach		= &kprobe_attach,
+	.probe_info	= &kprobe_probe_info,
 	.detach		= &kprobe_detach,
 	.probe_destroy	= &dt_tp_probe_destroy,
 };
-- 
2.43.5

