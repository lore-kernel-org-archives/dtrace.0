Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BB832F764
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786540940; cv=none; b=Ary6WJsGr+iN9uNGVEkMtDeDakNKAmeDoqOfEwsMzBdvdWbFaHZUrfSE6nuCu+V7F6tFK83HInaJ4SAz9RlyszJLyKAb9vvg2nlr6ONTTuYSwBR8RFz8Ok0pVwcGfTXVIErjoiDe2bUCzloXco3PRZQOBVLj59xGCFb6dHVosw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786540940; c=relaxed/simple;
	bh=TMqXc8UyMZ5qGbZ7W14byL+SPuoBNnCUiamKQvzpUu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uhHkivH8ylatMeMPXfptn26Gah9rNAKSdTKqtq62mMifIxDaVRkaVOeWVkP2PVjNzSgJnhn4+XjewFm7/PmEP1j9vpeQMloX18DlgSb7KIXoDWlcVhPJOpE1JLbdPDVH4eYPGJ3DkCoXH38qJgw1Y2c1A7Nx38nyF+cq5cePMwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PSi3k8SY; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PSi3k8SY"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C3aBf6147247
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=ThCXa
	85uzupbIGKMckb/OORlCTNI+0tWG0mHvxgDy4w=; b=PSi3k8SYZn+U7JXbeu8ns
	SHfCdszILZz6YwNEElBKTqRrtHx85W24Q9kBpFyM7KIc4VAKo8LibFqoSqe+Rz2K
	yhvvcLNe1vFEqcTfYeZbAeOhaZmn4Q458jdx/ogux81x9sGVWm7kGHhN1nEqktyM
	5Q64/XobX82RooPZcHV9PJoceGnlCpyxofXEsFSkz4pjuUFihc9aFwePx8DSVSP5
	YMhJDI+2CCDvB+bj/ClC9MQbXjMenId4PceBiEOIYZGXdWZ+S8InEVpRLhHhlk+h
	aWKmI2hpdawgoB8JmPGnrWOIU35RQgDQzr2jHNisbQP3O6FE0d5ktIGz0CFAPSPB
	Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4fwvesxr5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67CDKekC002321
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4fwtwsse3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:16 +0000 (GMT)
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67CDMEBi010792
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:15 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-57-125.vpn.oracle.com [10.154.57.125])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4fwtwsse20-3;
	Wed, 12 Aug 2026 13:22:15 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v4 2/9] libdtrace: share vmlinux BTF/CTF globally to support faster startup
Date: Wed, 12 Aug 2026 14:22:03 +0100
Message-ID: <20260812132212.527871-3-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260812132212.527871-1-alan.maguire@oracle.com>
References: <20260812132212.527871-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608120109
X-Authority-Analysis: v=2.4 cv=R8wz39RX c=1 sm=1 tr=0 ts=6a7c7389 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8 a=UCG5rGdL4dqLu4bsYP0A:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13509
X-Proofpoint-GUID: AbGFnSIMIr9MVI2ilf3mtdUAloNYL6By
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEwOSBTYWx0ZWRfX5eu62N50HNfY
 oq93M6432OZGo0HFlGOsaaA3SCiKWbON595F+Z67IaEXvqnYh8F3HMYAyiHTSCEQ4Trwdflt7Mi
 Alb8ZsWOT9eIr9rj+gx8fTCefdfuWKuwubKz5vAOlDwDY44vUysBvyQLkR5S2QQ3jUX/hpgmY/7
 VvDYhTJuC2qxYpnyzUKZjTBnHwAO2BUK9RocJJqbGnWqqdrLnIftDfgyCHkSsKeFjg9TcU3wGoV
 H7eSupCXHb2g5m9G9nXx2KvaIA1MpPjdwoKvhzc5vbqTq52QtVymLKibuGNemepZxTZrZiFkqOm
 a5X/VyTyeFEFWvmH9WG9fgW8E5PnElGJxQ2VbyVbzzB8Q/Grk474VHJWvyqNwrO2Tnk2Su0ilx1
 HNJuaJb366hTLsA5SDIMvct+2WG8p8uy1kuSX79nCgRl4CUCdRQuw8lmc0PPnn6BWKhlO6fvPLk
 0TG+KRYjBJx1dkDozAbxsaJoS60i+xVTE4zT9WiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEwOSBTYWx0ZWRfXwi8FJbza3Ej2
 2SL7WNzKVp9fzO/sSfJKmVePCvYHNKznlHNssYVEum7ISpq2Phvui5QnDyE+CyYcJDrAGeu+jq3
 2fVAeFPbDtANd0pZvDg6PIhNsxrT7CDFbYvVowSmiDhavjAbdpP5
X-Proofpoint-ORIG-GUID: AbGFnSIMIr9MVI2ilf3mtdUAloNYL6By

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
 libdtrace/dt_btf.c  | 79 +++++++++++++++++++++++++++++++++++++++++++--
 libdtrace/dt_btf.h  |  1 +
 libdtrace/dt_impl.h |  4 +--
 libdtrace/dt_open.c |  5 +--
 4 files changed, 81 insertions(+), 8 deletions(-)

diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
index 1f793397..7ec824be 100644
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
@@ -764,6 +767,68 @@ out:
 }
 #endif
 
+static dt_btf_t *dt_shared_btf = NULL;
+#ifdef HAVE_LIBCTF
+static ctf_dict_t *dt_shared_ctf = NULL;
+#endif
+static pthread_mutex_t dt_shared_mutex = PTHREAD_MUTEX_INITIALIZER;
+static int dt_shared_refcnt = 0;
+
+static int
+dt_shared_get(dtrace_hdl_t *dtp, dt_module_t *dmp)
+{
+	pthread_mutex_lock(&dt_shared_mutex);
+	if (!dt_shared_btf)
+		dt_shared_btf = dt_btf_load_file(dtp, "/sys/kernel/btf/vmlinux");
+	if (dt_shared_btf) {
+		dt_shared_refcnt++;
+		dtp->dt_shared_btf = dmp->dm_btf = dt_shared_btf;
+#ifdef HAVE_LIBCTF
+		if (!dt_shared_ctf) {
+			ctf_dict_t *ctf = dt_btf_to_ctf(dtp, NULL, dt_shared_btf);
+
+			if (ctf)
+				dtp->dt_shared_ctf = dt_shared_ctf = dmp->dm_ctfp = ctf;
+		} else {
+			dtp->dt_shared_ctf = dmp->dm_ctfp = dt_shared_ctf;
+		}
+#endif
+	}
+	pthread_mutex_unlock(&dt_shared_mutex);
+	if (!dt_shared_btf)
+		return -1;
+	return 0;
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
+		ctf_close(dt_shared_ctf);
+		dt_shared_ctf = NULL;
+	} else {
+		ctf_close(dtp->dt_shared_ctf);
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
@@ -774,6 +839,13 @@ dt_btf_load_module(dtrace_hdl_t *dtp, dt_module_t *dmp)
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
@@ -899,9 +971,12 @@ dt_btf_lookup_name_kind(dtrace_hdl_t *dtp, dt_module_t *dmp, const char *name,
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

