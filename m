Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1B420E02C
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729094057; cv=none; b=KRbgzDRfDNxFnsBzuAJbUutBvQfQijvd21m7lD7ZNuhfYsNodPD3F6jeJfBrp6PZ/mvEqVfmxYSlCnwTaMjikT6tfW/6Ev+1RsZbyP5R012B9GltdUsaP2jJwJkU4e4fS6vUEyfFCHquKWvJkmDClznNm4202+XK0D+dkRYlNq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729094057; c=relaxed/simple;
	bh=dYrujaK82DJNAkuRcPXw5wbAQA+MYJm9D5o3o/CEeCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cbi3buS72uXgyHhWcb/Lj0Ezl1My5iBJBTtdn0rjU/TDrfhy/vc8palWUrN9qgTvK1HKXZySaPbAf277DzldVr3QEkxxDi+v2aKVMOahKhSM3cKh+uTzMEBcG3A3scmlkghFV/xkUhZOYVc+Brlh3tuCPew9hvYHpVbIaOAztkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LOODr5SA; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LOODr5SA"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GFfwhh021953
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=AkuGW
	qZgtwNZOCY1DVwxzBLy2LDqgfZdPMnyBwaqPJc=; b=LOODr5SA5NFUH3iTFqLhT
	ARjUgPNnYot+6sBtTJoe186qOHlMPS9Ga8KxD4ouNLVNLKV8oYBhOAV/x9J0+RA/
	BjG5p9oWw3SZwWkBiAs5RwtGu/5c3VwWY0rQghmrVVK00pFszBrZQm3rzl9yRpZg
	QgUSNj01ifs1odxUyRppVUm0byt5id+pPcIFtmGxD4Hq3vUbXDt7IirpuumxNt9s
	sRraLcrFDWT7sRWK65jLUWOPrL7/brs2GWLNtqgfwWeCdVAXYxSrr+q/P7vSgUi4
	jMIauuB3M1XOEUPBtGI/RA646P5qtHjkEABXDCiIT5q8V61hUlI0t6FXVn2ykASs
	A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427g1aky6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:54:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49GF6ipI027154
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:54:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjfk26b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:54:12 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49GFsBrD014752
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:54:12 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-205-31.vpn.oracle.com [10.175.205.31])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 427fjfk24u-2;
	Wed, 16 Oct 2024 15:54:11 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v3 dtrace 1/4] dt_provider_tp: add optional event data, freed on tp free
Date: Wed, 16 Oct 2024 16:54:06 +0100
Message-ID: <20241016155409.4038017-2-alan.maguire@oracle.com>
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
X-Proofpoint-GUID: XC3Rg5uKmW_gpyo0V49wZbkNBTBO-Xni
X-Proofpoint-ORIG-GUID: XC3Rg5uKmW_gpyo0V49wZbkNBTBO-Xni

It will be used to store suffixed function name for kprobe attach to
"foo.isra.0"-style functions.  Such functions use the unsuffixed form
as probe name, so we need to store the full function name to support
attach.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_provider_tp.c | 27 +++++++++++++++++++++++++++
 libdtrace/dt_provider_tp.h |  8 ++++++++
 2 files changed, 35 insertions(+)

diff --git a/libdtrace/dt_provider_tp.c b/libdtrace/dt_provider_tp.c
index 50df2328..fc3c216a 100644
--- a/libdtrace/dt_provider_tp.c
+++ b/libdtrace/dt_provider_tp.c
@@ -33,6 +33,7 @@
 struct tp_probe {
 	uint32_t	event_id;	/* tracepoint event id or BTF id */
 	int		event_fd;	/* tracepoint perf event fd */
+	void		*event_data;	/* optional data */
 };
 
 /*
@@ -313,6 +314,8 @@ dt_tp_detach(dtrace_hdl_t *dtp, tp_probe_t *tpp)
 void
 dt_tp_destroy(dtrace_hdl_t *dtp, tp_probe_t *tpp)
 {
+	if (tpp && tpp->event_data)
+		free(tpp->event_data);
 	dt_free(dtp, tpp);
 }
 
@@ -334,6 +337,30 @@ dt_tp_probe_insert(dtrace_hdl_t *dtp, dt_provider_t *prov, const char *prv,
 	return dt_probe_insert(dtp, prov, prv, mod, fun, prb, tpp);
 }
 
+dt_probe_t *
+dt_tp_probe_insert_data(dtrace_hdl_t *dtp, dt_provider_t *prov, const char *prv,
+			const char *mod, const char *fun, const char *prb,
+			void *data)
+{
+	tp_probe_t	*tpp;
+
+	dt_probe_t *prp = dt_tp_probe_insert(dtp, prov, prv, mod, fun, prb);
+
+	if (prp) {
+		tpp = prp->prv_data;
+		tpp->event_data = data;
+	}
+	return prp;
+}
+
+void *
+dt_tp_get_event_data(const dt_probe_t *prp)
+{
+	tp_probe_t	*tpp = prp->prv_data;
+
+	return tpp->event_data;
+}
+
 uint32_t
 dt_tp_get_event_id(const dt_probe_t *prp)
 {
diff --git a/libdtrace/dt_provider_tp.h b/libdtrace/dt_provider_tp.h
index e7d52876..66a9bd80 100644
--- a/libdtrace/dt_provider_tp.h
+++ b/libdtrace/dt_provider_tp.h
@@ -41,6 +41,14 @@ extern struct dt_probe *dt_tp_probe_insert(dtrace_hdl_t *dtp,
 					   dt_provider_t *prov,
 					   const char *prv, const char *mod,
 					   const char *fun, const char *prb);
+extern struct dt_probe *dt_tp_probe_insert_data(dtrace_hdl_t *dtp,
+						dt_provider_t *prov,
+						const char *prv,
+						const char *mod,
+						const char *fun,
+						const char *prb,
+						void *data);
+extern void *dt_tp_get_event_data(const struct dt_probe *prp);
 extern uint32_t dt_tp_get_event_id(const struct dt_probe *prp);
 extern void dt_tp_set_event_id(const struct dt_probe *prp, uint32_t id);
 extern int dt_tp_probe_info(dtrace_hdl_t *dtp, FILE *f, int skip,
-- 
2.43.5

