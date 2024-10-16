Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E20F20E03D
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729094057; cv=none; b=Mcr7pGv1OSbK/qSx9kFG8cnOkNgy3gnkctXXSPMXBp/96lH5PBka+g+4ITirip0TQqiiXrXltHviVLwUC4dCohNFnKI4czJpoojAnjSLCixqIfCnmEtopL48o2fzjQ7MD5tG0XP6sIq+o4JAtRT+BLlEtShwfO35i3CL55jvsjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729094057; c=relaxed/simple;
	bh=o7XXDdK51eBjbM4DsU/mbymbJ36ALpXsnUVGUZ6bhTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j3dP4Q14zYuDiDSVGAry3SD1Iqn+nw12xPvCWSsT4ZWmpY9Zd+TgjSlNqvSfMCjIbVIPff007da7NFiNJm39dR2YbLpLbx+0t3v3li5lSnyRQJdgPPCmIt2DblI4NBICUDqmireQ9PbijbjI5wWS0DNcHGEnITHlPwmcuoJb6Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dl21o9vl; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dl21o9vl"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GFfwra021949
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=WwN/O
	B7RQlHwiIhTAnDtjD5qRcBCJH/OaN7m9ZZq8UU=; b=dl21o9vlKXEZFB79OPEMg
	eKPsgL9y7h3PViOsABgbf88b8vmIMuR0YkG2C/Pb9wPFs406OTdhPI5OX1abVQva
	+1Faq3Bkq0L4SPpKDRVQahLT7Z5/EXOEj8xne65niAopKYlBsy3FKaVru8Kh1vQ5
	4NdLIVjKRfJy6L9w9m6G4/c/lLN815cxHlQRK2mzHc+3RiXtPScm6EWqFGPuQJ/h
	wnf78YVtpYWjejuvtcjowR7fWsu8pi9AlzrFq/ec8tMD0xMTADJjw9G9s5UAb0zg
	X/s+XGxTluKi3wGVONNsFWn+oZBWb+Wsl6uLb6yS17nxAQrPkp71hAaK00RnpFgc
	w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427g1aky6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:54:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49GFNMAE027308
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:54:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjfk26y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:54:13 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49GFsBrG014752
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:54:13 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-205-31.vpn.oracle.com [10.175.205.31])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 427fjfk24u-3;
	Wed, 16 Oct 2024 15:54:12 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v3 dtrace 2/4] fbt: support "."-suffixed functions for kprobes
Date: Wed, 16 Oct 2024 16:54:07 +0100
Message-ID: <20241016155409.4038017-3-alan.maguire@oracle.com>
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
X-Proofpoint-GUID: AZsQSpEIHmoD-WWx0UQk7oKfjU8tLNjx
X-Proofpoint-ORIG-GUID: AZsQSpEIHmoD-WWx0UQk7oKfjU8tLNjx

gcc adds suffixes when it carries out optimizations, but often
these leave parameters to functions intact.  Many of these functions
(like finish_task_switch()) are important for tracing (and they
are present in available_filter_functions so are traceable) so it is
valuable to support probing them.  For kprobes, the probe name removes
the "." suffix, so store it as additional tp event data for kprobe
attach (attach time is the only time we need the full function name).

fprobe does not support such functions, so the kprobe impl is always
used in such cases.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_prov_fbt.c | 76 ++++++++++++++++++++++++++++++++---------
 1 file changed, 59 insertions(+), 17 deletions(-)

diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 21f63ddf..06ea78ca 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -21,6 +21,7 @@
 #include <assert.h>
 #include <errno.h>
 #include <fcntl.h>
+#include <port.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -63,8 +64,8 @@ static const dtrace_pattr_t	pattr = {
  */
 static int populate(dtrace_hdl_t *dtp)
 {
-	dt_provider_t		*prv;
-	dt_provimpl_t		*impl;
+	dt_provider_t		*default_prv, *kprobe_prv = NULL;
+	dt_provimpl_t		*default_impl;
 	FILE			*f;
 	char			*buf = NULL;
 	char			*p;
@@ -73,17 +74,25 @@ static int populate(dtrace_hdl_t *dtp)
 	dtrace_syminfo_t	sip;
 	dtrace_probedesc_t	pd;
 
-	impl = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? &dt_fbt_fprobe : &dt_fbt_kprobe;
+	default_impl = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? &dt_fbt_fprobe : &dt_fbt_kprobe;
 
-	prv = dt_provider_create(dtp, prvname, impl, &pattr, NULL);
-	if (prv == NULL)
+	default_prv = dt_provider_create(dtp, prvname, default_impl, &pattr, NULL);
+	if (default_prv == NULL)
 		return -1;			/* errno already set */
+	if (default_impl == &dt_fbt_kprobe)
+		kprobe_prv = default_prv;
 
 	f = fopen(PROBE_LIST, "r");
 	if (f == NULL)
 		return 0;
 
 	while (getline(&buf, &n, f) >= 0) {
+		dt_provimpl_t	*impl = default_impl;
+		dt_provider_t	*prv = default_prv;
+		char		fun[DTRACE_FUNCNAMELEN] = {};
+		void		*entry_data = NULL;
+		void		*return_data = NULL;
+
 		/*
 		 * Here buf is either "funcname\n" or "funcname [modname]\n".
 		 * The last line may not have a linefeed.
@@ -106,10 +115,6 @@ static int populate(dtrace_hdl_t *dtp)
 				p++;
 		}
 
-		/* Weed out synthetic symbol names (that are invalid). */
-		if (strchr(buf, '.') != NULL)
-			continue;
-
 #define strstarts(var, x) (strncmp(var, x, strlen (x)) == 0)
 		/* Weed out __ftrace_invalid_address___* entries. */
 		if (strstarts(buf, "__ftrace_invalid_address__") ||
@@ -129,6 +134,31 @@ static int populate(dtrace_hdl_t *dtp)
 		} else
 			mod = p;
 
+		/* '.'-suffixed functions (e.g. foo.isra.0) must always be
+		 * kprobe-backed as fprobe does not support them.  They
+		 * are represented with their unsuffixed names however, so
+		 * the full name including suffix is stored as data associated
+		 * with the tp event.
+		 */
+		strlcpy(fun, buf, sizeof(fun));
+		if (strchr(buf, '.') != NULL) {
+			char *suffix;
+
+			impl = &dt_fbt_kprobe;
+			if (!kprobe_prv) {
+				kprobe_prv = dt_provider_create(dtp, prvname,
+								impl, &pattr,
+								NULL);
+				if (kprobe_prv == NULL)
+					return -1;
+			}
+			prv = kprobe_prv;
+			suffix = strchr(fun, '.');
+			*suffix = '\0';
+			entry_data = strdup(buf);
+			return_data = strdup(buf);
+		}
+
 		/*
 		 * Due to the lack of module names in
 		 * TRACEFS/available_filter_functions, there are some duplicate
@@ -138,14 +168,16 @@ static int populate(dtrace_hdl_t *dtp)
 		pd.id = DTRACE_IDNONE;
 		pd.prv = prvname;
 		pd.mod = mod;
-		pd.fun = buf;
+		pd.fun = fun;
 		pd.prb = "entry";
 		if (dt_probe_lookup(dtp, &pd) != NULL)
 			continue;
 
-		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "entry"))
+		if (dt_tp_probe_insert_data(dtp, prv, prvname, mod, fun,
+					    "entry", entry_data))
 			n++;
-		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "return"))
+		if (dt_tp_probe_insert_data(dtp, prv, prvname, mod, fun,
+					    "return", return_data))
 			n++;
 	}
 
@@ -363,10 +395,11 @@ static int kprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 {
 	if (!dt_tp_probe_has_info(prp)) {
-		char	*fn;
-		FILE	*f;
-		size_t	len;
-		int	fd, rc = -1;
+		char		*fn;
+		const char	*fun;
+		FILE		*f;
+		size_t		len;
+		int		fd, rc = -1;
 
 		/*
 		 * Register the kprobe with the tracing subsystem.  This will
@@ -376,9 +409,18 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 		if (fd == -1)
 			return -ENOENT;
 
+		/* If actual function name contained a '.', it is stored in
+		 * tp data; use non-suffix name for event as event names
+		 * cannot contain a '.'.  User-visible probe name does
+		 * not contain a '.'.
+		 */
+		fun = dt_tp_get_event_data(prp);
+		if (!fun)
+			fun = prp->desc->fun;
+
 		rc = dprintf(fd, "%c:" FBT_GROUP_FMT "/%s %s\n",
 			     prp->desc->prb[0] == 'e' ? 'p' : 'r',
-			     FBT_GROUP_DATA, prp->desc->fun, prp->desc->fun);
+			     FBT_GROUP_DATA, prp->desc->fun, fun);
 		close(fd);
 		if (rc == -1)
 			return -ENOENT;
-- 
2.43.5

