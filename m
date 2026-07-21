Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092733988F9
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784647499; cv=none; b=G3hcbznwnr3y52Qtxit5PBNqWKA48tvNvSvmnJNBw8jtAbsqABSjMTw20ksjfSDtL4O1OuhIYrSchczd1MZN/dD8KO1tPp5yn9VaCyE5f/1nF1un0CO5ebeTxZcju5qIkD5OT9mgNkNlKzSFkU2p4nP83Es5udqHd73+jm7d2JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784647499; c=relaxed/simple;
	bh=ywWOQIkC3M34X4TYM9+9p1Ot+oJkgV4D2ssn/KjNIEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j+9p0xDhzUy9QTg5FLHireW8hmGoc89ZvgDngrSzAhsZPwT62Dq3zaqNKWu7vD1WLaI04i/nYc0c1S3sVKID1XF5ZzTEpxKDLK5YW0nDoCIUogLXtwnXaYs04SoGY0K4U0VvBJLYIFUIQPn0oHxtkOa4wMjon9m+bFnKqocetBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VQGJQH9u; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VQGJQH9u"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LEeeZA522638
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=Y0ET+
	ke/+NQ6fHjyeWvdBTUYukrgGqDNn4rGM+1SG/s=; b=VQGJQH9uIBlTUm1Z1UX/L
	HMcafV3QxABkN7v7khhd4Bg8slauDj3/jTODSR+6vaBNnsX08FhP2cP/7jZdzZHp
	ykcrDn/xA8s+sGTaDCIv4J+nGOYkfHFvVd5wpKza5JDiKHC1kGJzipIXNIbCYdOF
	W+hjRdfsYdUjTiA/0TkGwrGOzwkFeEB9eTvOwE3tBStLLEF/jD+OeignihmawySD
	kY4xfUw/FAvECLUBuA1dsZoCmIpdsGFU5YJ/LAWLqR4R7kXxzCpFMV4SbHZGcPjy
	o2sbDN+8Prv7iG8rmW3YSrZEImWzSaqS4bfRbhc1Ukv1Mn4EmEjYJdv3l8KPfhJ8
	g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4fg1sqkqbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:24:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 66LFIgBu035916
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:24:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ffyxpw2c1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:24:55 +0000 (GMT)
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66LFOrpI020536
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:24:55 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-48-223.vpn.oracle.com [10.154.48.223])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4ffyxpw29w-3;
	Tue, 21 Jul 2026 15:24:55 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v3 2/7] libdtrace: share vmlinux BTF/CTF globally to support faster startup
Date: Tue, 21 Jul 2026 16:24:46 +0100
Message-ID: <20260721152452.184842-3-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260721152452.184842-1-alan.maguire@oracle.com>
References: <20260721152452.184842-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2606160000
 definitions=main-2607210162
X-Proofpoint-ORIG-GUID: vsh8NGYBjJfBUnSzm45hK8b4FXLkZrvZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2MyBTYWx0ZWRfX1Q9eo4Nne28L
 cgKtEwnXfLM5M9kii7gPSpLT53z+BybhQtLcoGPxbeTFprYH128QE/FYPhYp0XsdJ/5WNrcFIOG
 mIyHSKeIlsWIPzO5EREjrhc+MMIzg4sXupLo+2s1gRjiNm4WeQQtWW4UQRv/t9lmnFkOlEbmU5Y
 uEg2r1HV6sRJ82UsvBEUXmQF12wONVCGz4DG8ZREM7YlFvMicuUxqlPpnnU8hHlFMz79kIt8xo0
 02Ej4uONtGVpvVK1Dzyculaael9J2h2WCEdf+mpFy2cCCp6PShqQAKhFI5o9PDi41xVyHLVkBD7
 TPEMFWyjXpzEzL4khtLghPhphrnhOsJuH9yiJRXNmeh+8ut6qtNI+ayETbTUNYI75SfrhJoMYSi
 fQfHKkyLxYfV4QSn4fk/LHM+jinlcnngKaXJrEEt4bdfjNk16EtDBUtkQE+5RkHe0+M3GkEVM2W
 ZBGN4jUB9R6wqqVX+kbthFErrZYVD0KG3ztgFpyo=
X-Authority-Analysis: v=2.4 cv=auyCzyZV c=1 sm=1 tr=0 ts=6a5f8f49 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8 a=8FyWth4MJFja956ti98A:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12218
X-Proofpoint-GUID: vsh8NGYBjJfBUnSzm45hK8b4FXLkZrvZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2MyBTYWx0ZWRfX4vWOB5wOnB+a
 Y6Pu44h0CpQmLM3ajzq+9OGs9rS5+D+KGinVRoJrtY3VFoU23WXTYaNk99KpxSBf3bMUmvcauBt
 E3hCdiANODyCKOiAxlCBngRBJ9PJiqn7fHOuswOJTE709pep1YR0

In a multiple DTrace session per process environment, it makes sense
to avoid doing expensive operations like reading in vmlinux BTF and
converting it to CTF more than once. Shared (vmlinux) BTF and CTF
generated from it are shared and reference-counted globally here
to cut down on cost.  With this change, we can launch ~1 DTrace
session per second.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_btf.c  | 61 ++++++++++++++++++++++++++++++++++++++++++---
 libdtrace/dt_btf.h  |  1 +
 libdtrace/dt_open.c |  5 +---
 3 files changed, 60 insertions(+), 7 deletions(-)

diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
index 1f793397..e46336f9 100644
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
@@ -764,6 +767,56 @@ out:
 }
 #endif
 
+static dt_btf_t *dt_shared_btf = NULL;
+static ctf_dict_t *dt_shared_ctf = NULL;
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
+	pthread_mutex_lock(&dt_shared_mutex);
+	if (dtp->dt_shared_btf && dtp->dt_shared_btf == dt_shared_btf) {
+		if (--dt_shared_refcnt == 0) {
+			dt_btf_destroy(dtp, dtp->dt_shared_btf);
+			dtp->dt_shared_btf = dt_shared_btf = NULL;
+		}
+	}
+#ifdef HAVE_LIBCTF
+	if (dt_shared_refcnt == 0) {
+		ctf_close(dtp->dt_shared_ctf);
+		dtp->dt_shared_ctf = dt_shared_ctf = NULL;
+	}
+#endif
+	pthread_mutex_unlock(&dt_shared_mutex);
+}
+
 dt_btf_t *
 dt_btf_load_module(dtrace_hdl_t *dtp, dt_module_t *dmp)
 {
@@ -774,6 +827,11 @@ dt_btf_load_module(dtrace_hdl_t *dtp, dt_module_t *dmp)
 	if (dmp->dm_btf)
 		return dmp->dm_btf;
 
+	if (strcmp(dmp->dm_name, "vmlinux") == 0) {
+		if (dt_shared_get(dtp, dmp) == 0)
+			return dmp->dm_btf;
+	}
+
 	/*
 	 * Default: /sys/kernel/btf/<module>
 	 * If "none", disable BTF.
@@ -792,9 +850,6 @@ dt_btf_load_module(dtrace_hdl_t *dtp, dt_module_t *dmp)
 	btf = dt_btf_load_file(dtp, fn);
 	free(fn);
 
-	if (btf && !dtp->dt_shared_btf && strcmp(dmp->dm_name, "vmlinux") == 0)
-		dtp->dt_shared_btf = btf;
-
 	return dmp->dm_btf = btf;
 }
 
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

