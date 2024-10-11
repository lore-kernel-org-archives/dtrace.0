Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC94A2101A6
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 10:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728642497; cv=none; b=C82x4AYcfrBwTB962dXqI3FeY2S8nchoptIclaIl9iEfazbyp2Y0X9gH3GzRww7NIBRYqc9IfVy4D3qYXB7zAmoCP6KwM3ZQ16yjuC/+d7pnYiqOR9VlrV69U+TGKgehLvTz0PjnYXAZWH74ZoRm/fYiweZGkccT3T/qQeZIuSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728642497; c=relaxed/simple;
	bh=7ZGZ/pmz853Q0UTzMJFLCsTGNh3+WbWyfAuvsG7BowU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B/WGj2kNskIN80I83Szx9O97ZJ3Ocq3giPBEEhbPC1r+1v/T12Dygm7dDt/crbdCtyKm1ImUqoL93BrUVN+JYKeFdQJ67aVxZS7Cno8Zz3TIybqGS7mTJuqS/jQigBu4A0Fbm7bKiv0hhOk6vW8AgCw9YjvlDSU5aFxkVwfQ4po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hjPH+ggT; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hjPH+ggT"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B8Beto026089
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 10:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=zTzLo
	TDfONMVIe2gzEaJWPNskbLYqwVXzuVWx7v9vCY=; b=hjPH+ggTh+kAaCLOgleRc
	mZZ8QCihpmaducRW4IRNnujnGBC3gr1Pf4NSto/Jme5J5C0JUdm8ljorPFz8uNfK
	lp7xFusNextpX+ZXQZ/q7LzSFGDKUYuh74UtXWudsD9MSHfCA0sRxNVqXULbsZT+
	ot1NW4q/94exGsfYr0aBKP/F2oXQFGP1PdNHQ4d8NDZAFYCIQoSELwyQgGAobq1g
	C3Oh4BM5l38YalLgbMk8nXPwoZ5EGP6qUaNLo7Bsgry+48iHAtuV52IPQ75xTTcZ
	PZbLdkWGg5rRfbM2qbyMisz+v2i7S9bzSDQSWYXQBS0qNpAT5LOfCS6Ciz4Ux8/P
	g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42306emks9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 10:28:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49B8soDI027922
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 10:28:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 422uwhfkcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 10:28:13 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49BASCj5024278
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 10:28:13 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-192-195.vpn.oracle.com [10.175.192.195])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 422uwhfkc1-2;
	Fri, 11 Oct 2024 10:28:12 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2 dtrace 1/3] fbt: support "."-suffixed functions for kprobes
Date: Fri, 11 Oct 2024 11:28:08 +0100
Message-ID: <20241011102810.989562-2-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20241011102810.989562-1-alan.maguire@oracle.com>
References: <20241011102810.989562-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_08,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410110072
X-Proofpoint-GUID: YCoupsZaubDlzByS4-Eq2-V6EC0Zc_6I
X-Proofpoint-ORIG-GUID: YCoupsZaubDlzByS4-Eq2-V6EC0Zc_6I

gcc adds suffixes when it carries out optimizations, but often
these leave parameters to functions intact.  Many of these functions
(like finish_task_switch()) are important for tracing (and they
are present in available_filter_functions so are traceable) so it is
valuable to support probing them.  For kprobes, all that is needed
is to ensure that the event name does not contain a ".".

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_prov_fbt.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 21f63ddf..0ba0fb71 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -106,10 +106,6 @@ static int populate(dtrace_hdl_t *dtp)
 				p++;
 		}
 
-		/* Weed out synthetic symbol names (that are invalid). */
-		if (strchr(buf, '.') != NULL)
-			continue;
-
 #define strstarts(var, x) (strncmp(var, x, strlen (x)) == 0)
 		/* Weed out __ftrace_invalid_address___* entries. */
 		if (strstarts(buf, "__ftrace_invalid_address__") ||
@@ -363,7 +359,7 @@ static int kprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 {
 	if (!dt_tp_probe_has_info(prp)) {
-		char	*fn;
+		char	*fn, *event, *s;
 		FILE	*f;
 		size_t	len;
 		int	fd, rc = -1;
@@ -376,22 +372,37 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 		if (fd == -1)
 			return -ENOENT;
 
+		if (asprintf(&event, "%s", prp->desc->fun) < 0)
+			return -ENOMEM;
+		/* replace possible "." in event name as "." is not supported
+		 * in trace event names, and function could be named foo.isra.0
+		 */
+		for (s = strchr(event, '.'); s != NULL && *s != '\0'; s++) {
+			if (*s == '.')
+				*s = '_';
+		}
+
 		rc = dprintf(fd, "%c:" FBT_GROUP_FMT "/%s %s\n",
 			     prp->desc->prb[0] == 'e' ? 'p' : 'r',
-			     FBT_GROUP_DATA, prp->desc->fun, prp->desc->fun);
+			     FBT_GROUP_DATA, event, prp->desc->fun);
 		close(fd);
-		if (rc == -1)
+		if (rc == -1) {
+			free(event);
 			return -ENOENT;
+		}
 
 		/* create format file name */
 		len = snprintf(NULL, 0, "%s" FBT_GROUP_FMT "/%s/format",
-			       EVENTSFS, FBT_GROUP_DATA, prp->desc->fun) + 1;
+			       EVENTSFS, FBT_GROUP_DATA, event) + 1;
 		fn = dt_alloc(dtp, len);
-		if (fn == NULL)
+		if (fn == NULL) {
+			free(event);
 			return -ENOENT;
+		}
 
 		snprintf(fn, len, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
-			 FBT_GROUP_DATA, prp->desc->fun);
+			 FBT_GROUP_DATA, event);
+		free(event);
 
 		/* open format file */
 		f = fopen(fn, "r");
-- 
2.43.5

