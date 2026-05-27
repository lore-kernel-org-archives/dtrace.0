Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B032FD7BE
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779907860; cv=none; b=UY9QOUfog1TNsheE7U0GOuXCttd1VKdfja8xcQZ91DdpAf+M2EjhowaOdUmMnx1YAM/GV8O74Y1V7/IOl50ZVrx+MaWTSF+rUajDbTDsRratbAI4f4W0J8fI8u56brWeda7vso4DFe+94dRfXoqiszcYXk5a8oaWsybdpHDdK/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779907860; c=relaxed/simple;
	bh=nTxEUT/7OvthlXE0gnNOKjnzRp4v0QNL+5IETdrSSpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OJAGJaahxTy09Dji42C6wtQkDGMnSnjbm4Wq7Y8tKTqc988JeUIlT79YiltI3OoJj8jsvfBKfuIRkXbcKJqr+i+ozxMMgEF/yiPe19bu4Ggj2TnC/WKz7H/DvfC7ytA+GhgetGzpFdNpsCRko9eMc8GNnIAEB9kJOBOL1NqehEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DwC7wnM+; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DwC7wnM+"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RFSj2N2916463
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=w6wMf
	LhJ7ktedwbDUi1L10UkYJjTWxY/rgBWjYicBHU=; b=DwC7wnM+XFQkzZrOVp8f9
	ij4MYfwiv6g4ea/2PidDoddpE3JdjxaFE8sPx54CwAMIqd5K3WnWyit7WwQCeSWO
	cG4CnXWGboHdSuoafIEkRHsZHrD/9b7EHhDFQreyQSpYFvxW01Hbm/ERiFfzBZQ0
	HGveusZ4ClWkT8AePu21RBQoGKLGVz+5APgpyIYcpZMTXOk1hXX/dxCwYmsB5LD+
	+kf4ni4JQFHgrFmFpAMO9Wkd7T1bX7sTHjAqUNd7i68NyPqM6BJXNFanqR7VPSsR
	SHgjNGoBrofhQYnpUJPQdnN4V5O3Boe958kuuV+42jdRaZQ2QYO2YeLX/Mp9e19E
	g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4eb4ebx1d5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:50:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 64RIoasm031339
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:50:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4edjse4t6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:50:56 +0000 (GMT)
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64RIomga033024
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:50:51 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-48-144.vpn.oracle.com [10.154.48.144])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4edjse4sc8-3;
	Wed, 27 May 2026 18:50:51 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2 2/7] libdtrace: share vmlinux BTF/CTF globally to support faster startup
Date: Wed, 27 May 2026 19:49:58 +0100
Message-ID: <20260527185004.2267741-3-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260527185004.2267741-1-alan.maguire@oracle.com>
References: <20260527185004.2267741-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2605130000 definitions=main-2605270189
X-Proofpoint-ORIG-GUID: Tv5uelAPdW_QF2m-JktsEoxQVUZrlREu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDE4OSBTYWx0ZWRfXyof6Ay7OYwdv
 ZKgVTolZsZHKHd5qHInTeoWUAk0+8SobVkExnNvlwsg0GgbecwIb/SvNd42+wI8N/2KJHw7ViI5
 cdZeXxMD1GsQo4F1s1v2rwGvLH6UCw4XCCWMm/aPbqVouBlljka9v8KdKOCNO7zW/HRqCtg5qwY
 zp9KG88tEfQkKX83Y8W4wXI48PUHj8Q0tWPabqDc55Fs6bPPqA2UWsjMPulv6OxeZ6+Ke+uE/LK
 hxT76JNXGSwIiGCk+eU46tWKKvgPSmYrQCoxcg/DSFlQi+X7wQNN9lfdqnVFtTdyrCMlFsgV9Ow
 yv0nygYy29DZR75MGcSslktpIsLCjolLXnvhgyXZHNqyQQO8yIJtUF7myGPU5TenOJaZlRBbGWM
 d4997j/U/CZb5Bry00a/WCFxM1tDtWfvocai4kzMlJvCljc+GxRTdSseGbCYo1CiyariSFPnIoD
 jfn8t8xEi+VwoHhL8jlLYnWWX8HRR0YbfSWBB6SY=
X-Authority-Analysis: v=2.4 cv=QJpYgALL c=1 sm=1 tr=0 ts=6a173d12 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=yPCof4ZbAAAA:8 a=8FyWth4MJFja956ti98A:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13706
X-Proofpoint-GUID: Tv5uelAPdW_QF2m-JktsEoxQVUZrlREu

In a multiple DTrace session per process environment, it makes sense
to avoid doing expensive operations like reading in vmlinux BTF and
converting it to CTF more than once. Shared (vmlinux) BTF and CTF
generated from it are shared and reference-counted globally here
to cut down on cost.  With this change, we can launch ~1 DTrace
session per second.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_btf.c  | 57 ++++++++++++++++++++++++++++++++++++++++++---
 libdtrace/dt_btf.h  |  1 +
 libdtrace/dt_open.c |  5 +---
 3 files changed, 56 insertions(+), 7 deletions(-)

diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
index 1f793397..0730a531 100644
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
@@ -764,6 +767,52 @@ out:
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
+		if (!dt_shared_ctf) {
+			ctf_dict_t *ctf = dt_btf_to_ctf(dtp, NULL, dt_shared_btf);
+
+			if (ctf)
+				dtp->dt_shared_ctf = dt_shared_ctf = dmp->dm_ctfp = ctf;
+		} else {
+			dtp->dt_shared_ctf = dmp->dm_ctfp = dt_shared_ctf;
+		}
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
+	if (dt_shared_refcnt == 0) {
+		ctf_close(dtp->dt_shared_ctf);
+		dtp->dt_shared_ctf = dt_shared_ctf = NULL;
+	}
+	pthread_mutex_unlock(&dt_shared_mutex);
+}
+
 dt_btf_t *
 dt_btf_load_module(dtrace_hdl_t *dtp, dt_module_t *dmp)
 {
@@ -774,6 +823,11 @@ dt_btf_load_module(dtrace_hdl_t *dtp, dt_module_t *dmp)
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
@@ -792,9 +846,6 @@ dt_btf_load_module(dtrace_hdl_t *dtp, dt_module_t *dmp)
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

