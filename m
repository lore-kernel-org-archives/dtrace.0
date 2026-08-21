Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6484C9542
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328670; cv=none; b=oi+SUxvBtJxIs3ufiQm8rGKRCq8VwlpZFmaQAJzPm2J2ZnR5QxOBT1hS0jWqryaHrR2T1udrwZYc7KdlwhC9JmqQG7AWkGXXmNh05oT5OlyVF1N9cO++h2hUmqfFYHdR14cOfUz2bA8ONPApQjEbycudo3VvIVpHOoLt1Dw5J8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328670; c=relaxed/simple;
	bh=7XWYKfacnnxDzCFGzpBUFAzZGXaC425TcdjPJ8Mbfnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SWTeE7yBjrp2JTRN/SsnpiA5+gIxeHBkcIFMaDI8zorzb5KYSjOk10Azms3tMnGZziT+QWSX8UcDrIxMY7waL24HVgKvmy/V2wADzMP6rZyZ0IZPFyCgld5Xtt/MLrDm1X4cQ1xdApnKoP4IdqUNvum7Z18vS+Oc42hUC1h856A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CxG9rzZP; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CxG9rzZP"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LCpMnN2338579
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=e++if
	mstChVq+ngCh8iWwO/VqPEQvvPpy6hPMgUpNAc=; b=CxG9rzZPxR/gla5lFx+gI
	UWUUfiY35/7Jy4idmxq5N9hfHNZjbQtAzsMhjTcq48XgR+Z2pAUbOpuzCIh0bQhh
	1iLAr7tAIor1G8BDCnYkMmSNZE5QyeFIBpzurGuhcMTu82LwBg2OeTo+MYRDsNOH
	nvDHyi8jVAnb2ZcyqtBOdEgoiBfBsSq2C3gkm6C/OPZeRziW8n0fze2JLaQRYn2d
	ErsggkRuXDSV8+DWegc5Y7yYAYN/X8XZzqe4xWMhs26xmzISEA6eWRWO8D/JGs1F
	SLR/905ZJsmyYllYhmEEXuQyiGiXzLgF2NdVUB+u7lHYYBdHrGTO5Tya2JktOD0l
	g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g4ydbnapf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:06 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67LG5Ctp029289
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4g2ejgcmx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:05 +0000 (GMT)
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67LGB2F0014592
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:05 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-51-128.vpn.oracle.com [10.154.51.128])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4g2ejgcmux-3;
	Fri, 21 Aug 2026 16:11:05 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v5 02/11] libdtrace: share vmlinux BTF/CTF globally to support faster startup
Date: Fri, 21 Aug 2026 17:10:50 +0100
Message-ID: <20260821161100.41710-3-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260821161100.41710-1-alan.maguire@oracle.com>
References: <20260821161100.41710-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 phishscore=0 mlxlogscore=958 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608210126
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfXz/r49St8RnwD
 ztXELxegBfcdIAjw8Ifc++rKGxo0Es0KQ2LFnGPN5BgY1A5YWZrY8hfcMZYkabFSoTu0xL4RJEO
 tBVGc5VjWnUHjW0fcYim/I689dlmT9NQS/n2MDH7SpDdVm7UpTH+ZWjxWiNOHV03LII0eDotLd+
 qp9aTG3DkGcUQfQo9I9kx6Xudy5z9oU3dnb75l7uLicQnpMgPnmr+NmxmsKwQP69Iv721O/nJZX
 rONTFQUG2TBPQYDoh91x9Etbj3kr+Hy0Q25os0JRFDqIVNkx4PoipHCKxfF/tscdkHbrxo6sr+m
 M1LoerjowQ3n7Uely7Tp2O1d6KUvdwtvPA5GeWX4Q8T4Kd9A9okoGTn7Oo+5Cnip3pql486Wdn5
 FqgS3LnxU4M3wqN8WM1iIB6lx7ckhUGZE6ctVir7OnS7vSk9GchTPWj4tIIRSU8+2HwZyhejbu6
 XRe9a6ok5mcpGI7Owaw==
X-Proofpoint-ORIG-GUID: ZCxgui8sQ-QVhzTRxPStlnuCdKVLhsrP
X-Proofpoint-GUID: ZCxgui8sQ-QVhzTRxPStlnuCdKVLhsrP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX7RYzlmjhlyli
 gBUr0v5kD6qORcaOG/gT9v8DhybN7MHqvKfLJsy7zwTnFobNieaEz8ievVxfxSWxt08N++oYHFk
 yxebYE5ceOhONxeeGsIqyWO/AqGQWE0R+fe/cNH3gcsiNe8Advif
X-Authority-Analysis: v=2.4 cv=GpJyPE1C c=1 sm=1 tr=0 ts=6a88789a b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x4eqshVgHu-cdnggieHk:22 a=yPCof4ZbAAAA:8 a=UCG5rGdL4dqLu4bsYP0A:9
 a=WmVTiCyuxqgg3mnwYu6p:22

In a multiple DTrace session per process environment, it makes sense
to avoid doing expensive operations like reading in vmlinux BTF and
converting it to CTF more than once. Shared (vmlinux) BTF and CTF
generated from it are shared and reference-counted globally here
to cut down on cost.  With this change, we can launch ~1 DTrace
session per second.

Note that we need to handle case where  -xbtfpath/DTRACE_OPT_BTFPATH
are used as non-default BTF paths; in such cases global shared
BTF is not used in the handle.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_btf.c  | 92 ++++++++++++++++++++++++++++++++++++++++++++-
 libdtrace/dt_btf.h  |  1 +
 libdtrace/dt_impl.h |  4 +-
 libdtrace/dt_open.c |  5 +--
 4 files changed, 94 insertions(+), 8 deletions(-)

diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
index 1f793397..e7980969 100644
--- a/libdtrace/dt_btf.c
+++ b/libdtrace/dt_btf.c
@@ -693,6 +693,9 @@ dt_btf_to_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp, dt_btf_t *btf)
 	ctf_dict_t	*ctf;
 	ctf_encoding_t	enc = { CTF_INT_SIGNED, 0, 0 };
 
+	if (dmp == NULL && dtp->dt_shared_ctf)
+		return dtp->dt_shared_ctf;
+
 	ctf = ctf_create(&dtp->dt_ctferr);
 	if (ctf == NULL)
 		return NULL;
@@ -764,6 +767,81 @@ out:
 }
 #endif
 
+static dt_btf_t *dt_shared_btf = NULL;
+#ifdef HAVE_LIBCTF
+static ctf_dict_t *dt_shared_ctf = NULL;
+static int dt_shared_ctfmodel = -1;
+#endif
+static pthread_mutex_t dt_shared_mutex = PTHREAD_MUTEX_INITIALIZER;
+static int dt_shared_refcnt = 0;
+
+static int
+dt_shared_get(dtrace_hdl_t *dtp, dt_module_t *dmp)
+{
+	int	rc = -1;
+
+	pthread_mutex_lock(&dt_shared_mutex);
+	if (!dt_shared_btf)
+		dt_shared_btf = dt_btf_load_file(dtp, "/sys/kernel/btf/vmlinux");
+	if (!dt_shared_btf)
+		goto out;
+
+#ifdef HAVE_LIBCTF
+	/* BTF-to-CTF type IDs and CTF data models cannot be shared. */
+	if (dt_shared_ctf && dt_shared_ctfmodel != dtp->dt_conf.dtc_ctfmodel)
+		goto out;
+
+	if (!dt_shared_ctf) {
+		dt_shared_ctf = dt_btf_to_ctf(dtp, NULL, dt_shared_btf);
+		if (!dt_shared_ctf) {
+			dt_btf_destroy(dtp, dt_shared_btf);
+			dt_shared_btf = NULL;
+			goto out;
+		}
+		dt_shared_ctfmodel = dtp->dt_conf.dtc_ctfmodel;
+	}
+	dtp->dt_shared_ctf = dmp->dm_ctfp = dt_shared_ctf;
+#endif
+	dtp->dt_shared_btf = dmp->dm_btf = dt_shared_btf;
+	dt_shared_refcnt++;
+	rc = 0;
+out:
+	pthread_mutex_unlock(&dt_shared_mutex);
+	return rc;
+}
+
+void
+dt_shared_put(dtrace_hdl_t *dtp)
+{
+	int shared;
+
+	pthread_mutex_lock(&dt_shared_mutex);
+	shared = dtp->dt_shared_btf && dtp->dt_shared_btf == dt_shared_btf;
+	if (shared && --dt_shared_refcnt != 0)
+		goto out;
+
+	dt_btf_destroy(dtp, dtp->dt_shared_btf);
+	dtp->dt_shared_btf = NULL;
+	if (shared)
+		dt_shared_btf = NULL;
+
+#ifdef HAVE_LIBCTF
+	if (shared) {
+		if (dt_shared_ctf != NULL)
+			ctf_close(dt_shared_ctf);
+		dt_shared_ctf = NULL;
+		dt_shared_ctfmodel = -1;
+	} else {
+		if (dtp->dt_shared_ctf != NULL)
+			ctf_close(dtp->dt_shared_ctf);
+	}
+	dtp->dt_shared_ctf = NULL;
+#endif
+
+out:
+	pthread_mutex_unlock(&dt_shared_mutex);
+}
+
 dt_btf_t *
 dt_btf_load_module(dtrace_hdl_t *dtp, dt_module_t *dmp)
 {
@@ -774,6 +852,13 @@ dt_btf_load_module(dtrace_hdl_t *dtp, dt_module_t *dmp)
 	if (dmp->dm_btf)
 		return dmp->dm_btf;
 
+	/* Share only the system-default vmlinux BTF. */
+	if (dtp->dt_btf_path == NULL &&
+	    strcmp(dmp->dm_name, "vmlinux") == 0) {
+		if (dt_shared_get(dtp, dmp) == 0)
+			return dmp->dm_btf;
+	}
+
 	/*
 	 * Default: /sys/kernel/btf/<module>
 	 * If "none", disable BTF.
@@ -899,9 +984,12 @@ dt_btf_lookup_name_kind(dtrace_hdl_t *dtp, dt_module_t *dmp, const char *name,
 	if (strcmp(name, "void") == 0)
 		return 0;
 
-	/* Ensure the shared BTF is loaded. */
-	if (!dtp->dt_shared_btf)
+	/* Ensure the vmlinux BTF base is loaded before considering a module. */
+	if (!dtp->dt_shared_btf) {
 		dt_btf_load_module(dtp, dtp->dt_exec);
+		if (!dtp->dt_shared_btf)
+			return -ENOENT;
+	}
 
 	/* If the module does not have BTF data yet, try to load it. */
 	if (!btf) {
diff --git a/libdtrace/dt_btf.h b/libdtrace/dt_btf.h
index 2c921a03..b1ed2b65 100644
--- a/libdtrace/dt_btf.h
+++ b/libdtrace/dt_btf.h
@@ -18,6 +18,7 @@ typedef struct dt_btf		dt_btf_t;
 typedef struct bpf_btf_info	btf_info_t;
 
 extern void dt_btf_destroy(dtrace_hdl_t *, dt_btf_t *);
+extern void dt_shared_put(dtrace_hdl_t *);
 extern dt_btf_t *dt_btf_load_module(dtrace_hdl_t *, dt_module_t *);
 extern ctf_dict_t *dt_btf_module_ctf(dtrace_hdl_t *, dt_module_t *);
 extern const char *dt_btf_get_string(dtrace_hdl_t *, const dt_btf_t *,
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 7db2ba93..7ccdc271 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -305,8 +305,8 @@ struct dtrace_hdl {
 	char *dt_ctfa_path;	/* path to vmlinux.ctfa */
 	ctf_archive_t *dt_ctfa; /* ctf archive for the entire kernel tree */
 	char *dt_btf_path;	/* path to vmlinux.btf */
-	struct dt_btf *dt_shared_btf; /* BTF data for the kernel (shared) */
-	ctf_file_t *dt_shared_ctf; /* Handle to the shared CTF */
+	struct dt_btf *dt_shared_btf; /* BTF data shared by kernel modules */
+	ctf_file_t *dt_shared_ctf; /* CTF shared by kernel modules */
 	dt_htab_t *dt_kernpaths; /* hash table of dt_kern_path_t's */
 	dt_module_t *dt_exec;	/* pointer to executable module */
 	dt_module_t *dt_cdefs;	/* pointer to C dynamic type module */
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 30b8758d..352cec49 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -1299,10 +1299,7 @@ dtrace_close(dtrace_hdl_t *dtp)
 	dt_htab_destroy(dtp->dt_mods);
 	dt_htab_destroy(dtp->dt_kernpaths);
 
-	if (dtp->dt_shared_btf != NULL)
-		dt_btf_destroy(dtp, dtp->dt_shared_btf);
-	if (dtp->dt_shared_ctf != NULL)
-		ctf_close(dtp->dt_shared_ctf);
+	dt_shared_put(dtp);
 	if (dtp->dt_ctfa != NULL)
 		ctf_arc_close(dtp->dt_ctfa);
 
-- 
2.43.5

