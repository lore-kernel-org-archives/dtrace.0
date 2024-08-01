Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997701494DD
	for <dtrace@lists.linux.dev>; Thu,  1 Aug 2024 21:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722547758; cv=none; b=cai0pFcZUXt5SRlBPtCZYHrR/CYqd0uvjbNLokWg3Wq6eBipLXbdz4hFHz5nfQC4j+HRamWvuIUv/n5WDXDPbeqTbqDkERVZImX+uD8lxfbTA6lrQGCRFORiZ6CMBeah/f2eyQkMCh+CxUQadLVogQbXVulIhLugMxk8X1yyOOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722547758; c=relaxed/simple;
	bh=KLCm3Y7+k8X3QDX7+wBCzwwngJTGMh/oaZR5QtTlRZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pBv4xOs/UNkJtSzytqc2J+aEcBBVUlzdPlXZSWgW4mWBELuUE9VKHVhljSYuwJfodVU8FUX9u52h9Yvudld6DX/fvv3MghXJT3xdmjvfPGpKxuMvResscRvUGHPikTYYEW9HFtiwFHsCcnSmR8m6vA16WLkSPF0StNPIfg3TOgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mPnrP0Gf; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mPnrP0Gf"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471L63o2022154
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 21:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=corp-2023-11-20; bh=rucq5wj7TI1VRR
	bqXaGGbaK1kdjRsYH7afXxDoBXG5U=; b=mPnrP0GftRAYk9AfDitKBr8oo0EVLF
	4EGSxZwk869WGg5Gfe3Iez0E2k8qycvuARelvsHqyZ57fSvreoNGNso1qbjgkUKY
	S/7eAC/71hqaBU8RBIMvydKENr13pZcHUbhyrzYJUpoVM6Z3TncmQ+nVFYYvIgnE
	52rIIed/PVI6ukerg0pL6J49iVJQZmucnU9AZG6SvNq39TBTk7CzQlwG1uG342gd
	LJdk4apN5IwXxtcax39STJsrZ1d8X90Q+gfRZmuGfCfZCrkhDzKdhdPoue46OJGb
	+r31GBo6Btsq8M4qSvVKngu8R3HCQgMdJ7bmk5MYclTh5l/DgeW/N8lg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mrxc2w34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 21:29:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 471JiVa8019097
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 21:29:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40qjmu7ax9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 21:29:14 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 471LTE9L003475
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 21:29:14 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-222-237.vpn.oracle.com [10.175.222.237])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 40qjmu7awr-1;
	Thu, 01 Aug 2024 21:29:13 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>,
        Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH v5 1/2] print() action: identify ctf object used for print
Date: Thu,  1 Aug 2024 22:29:11 +0100
Message-ID: <20240801212912.2300220-1-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_19,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408010143
X-Proofpoint-GUID: UtUWmgWHGVUA1hpbh8SEp4nFnXlPM9ag
X-Proofpoint-ORIG-GUID: UtUWmgWHGVUA1hpbh8SEp4nFnXlPM9ag

when generating code for print() action we need to identify source
of CTF; is it shared CTF, cdefs or ddefs or another module?
Rework the print() action to be a printf()like function under the
hood using the format specifier as module name.  We can then
do away with dt_print_print(), calling dt_print_type() directly
from consume.

Suggested-by: Kris Van Hees <kris.van.hees@oracle.com>
Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_cg.c      | 10 ++++++++--
 libdtrace/dt_consume.c | 28 +++-------------------------
 libdtrace/dt_impl.h    |  1 +
 libdtrace/dt_printf.c  | 28 ++++++++++++++++++++++++----
 libdtrace/dt_printf.h  |  6 ++++--
 5 files changed, 40 insertions(+), 33 deletions(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index a1c24e37..164f9e5f 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -20,6 +20,7 @@
 #include <dt_dctx.h>
 #include <dt_cg.h>
 #include <dt_grammar.h>
+#include <dt_module.h>
 #include <dt_parser.h>
 #include <dt_printf.h>
 #include <dt_provider.h>
@@ -2838,8 +2839,11 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
 	ctf_file_t	*fp = addr->dn_ctfp;
 	ctf_id_t	type = addr->dn_type;
 	char		n[DT_TYPE_NAMELEN];
+	dt_module_t	*dmp;
+	dt_pfargv_t	*pfp;
 	size_t		size;
 
+	dmp = dt_module_lookup_by_ctf(dtp, fp);
 	type = ctf_type_reference(fp, type);
 	if (type == CTF_ERR)
 		longjmp(yypcb->pcb_jmpbuf, EDT_CTF);
@@ -2849,11 +2853,13 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
 			"print( ) argument #1 reference has type '%s' with size 0; cannot print( ) it.\n",
 			ctf_type_name(fp, type, n, sizeof(n)));
 
+	pfp = dt_printf_create(dtp, dmp->dm_name);
+
 	/* reserve space for addr/type, data/size */
 	addr_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
-			      sizeof(uint64_t), 8, NULL, type);
+			      sizeof(uint64_t), 8, pfp, type);
 	data_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
-			      size, 8, NULL, size);
+			      size, 8, NULL, 0);
 
 	dt_cg_node(addr, &pcb->pcb_ir, drp);
 	dt_cg_check_ptr_arg(dlp, drp, addr, NULL);
diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index e9b33cfc..07856746 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -507,7 +507,7 @@ dt_nullrec()
 	return DTRACE_CONSUME_NEXT;
 }
 
-static int
+int
 dt_read_scalar(caddr_t addr, const dtrace_recdesc_t *rec, uint64_t *valp)
 {
 	addr += rec->dtrd_offset;
@@ -1983,25 +1983,6 @@ dt_print_trace(dtrace_hdl_t *dtp, FILE *fp, dtrace_recdesc_t *rec,
 	return dt_print_rawbytes(dtp, fp, data, rec->dtrd_size);
 }
 
-static int
-dt_print_print(dtrace_hdl_t *dtp, FILE *fp, dtrace_recdesc_t *rec,
-	       const caddr_t buf)
-{
-	dtrace_recdesc_t *data_rec = rec + 1;
-	size_t max_size = dtp->dt_options[DTRACEOPT_PRINTSIZE];
-	size_t size = (size_t)data_rec->dtrd_arg;
-	uint64_t printaddr;
-
-	if (size > max_size)
-		size = max_size;
-
-	if (dt_read_scalar(buf, rec, &printaddr) < 0)
-		return dt_set_errno(dtp, EDT_PRINT);
-
-	return dt_print_type(dtp, fp, printaddr, (ctf_id_t)rec->dtrd_arg,
-			     (caddr_t)buf + data_rec->dtrd_offset, size);
-}
-
 /*
  * The lifecycle of speculation buffers is as follows:
  *
@@ -2562,11 +2543,8 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
 			func = dtrace_freopen;
 			break;
 		case DTRACEACT_PRINT:
-			n = dt_print_print(dtp, fp, rec, data);
-			if (n < 0)
-				return -1;
-			i += n - 1;
-			continue;
+			func = dt_print_type;
+			break;
 		default:
 			break;
 		}
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 01313ff3..88b31ce0 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -789,6 +789,7 @@ extern int dt_buffered_flush(dtrace_hdl_t *, dtrace_probedata_t *,
     const dtrace_recdesc_t *, const dtrace_aggdata_t *, uint32_t flags);
 extern void dt_buffered_disable(dtrace_hdl_t *);
 extern void dt_buffered_destroy(dtrace_hdl_t *);
+extern int dt_read_scalar(caddr_t, const dtrace_recdesc_t *, uint64_t *);
 
 extern uint64_t dt_stddev(uint64_t *, uint64_t);
 
diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
index 50842216..e999498c 100644
--- a/libdtrace/dt_printf.c
+++ b/libdtrace/dt_printf.c
@@ -14,6 +14,7 @@
 #include <limits.h>
 #include <port.h>
 
+#include <dt_module.h>
 #include <dt_printf.h>
 #include <dt_string.h>
 #include <dt_impl.h>
@@ -2235,15 +2236,34 @@ err:
 }
 
 int
-dt_print_type(dtrace_hdl_t *dtp, FILE *fp, uint64_t printaddr,
-	      ctf_id_t type, caddr_t data, size_t size)
+dt_print_type(dtrace_hdl_t *dtp, FILE *fp, void *fmtdata,
+	      const dtrace_probedata_t *data, const dtrace_recdesc_t *recs,
+	      uint_t nrecs, const void *buf, size_t len)
 {
+	const char *modname = ((dt_pfargv_t *)fmtdata)->pfv_format;
+	size_t max_size = dtp->dt_options[DTRACEOPT_PRINTSIZE];
+	ctf_id_t type = (ctf_id_t)recs->dtrd_arg;
+	const dtrace_recdesc_t *data_rec = recs + 1;
+	size_t size = data_rec->dtrd_size;
+	caddr_t addr_data = (caddr_t)buf;
 	struct dt_visit_arg dva;
+	uint64_t printaddr;
+	dt_module_t *dmp;
 
+	if (size > max_size)
+		size = max_size;
+
+	if (dt_read_scalar(addr_data, recs, &printaddr) < 0)
+		return dt_set_errno(dtp, EDT_PRINT);
+
+	dmp = dt_module_lookup_by_name(dtp, modname);
+	if (!dmp) {
+		return dt_set_errno(dtp, EDT_PRINT);
+	}
 	dva.dv_dtp = dtp;
 	dva.dv_fp = fp;
-	dva.dv_ctfp = dtp->dt_ddefs->dm_ctfp;
-	dva.dv_data = data;
+	dva.dv_ctfp = dmp->dm_ctfp;
+	dva.dv_data = addr_data + data_rec->dtrd_offset;
 	dva.dv_size = size;
 	dva.dv_last_depth = 0;
 	dva.dv_startindent = DT_PRINT_STARTINDENT;
diff --git a/libdtrace/dt_printf.h b/libdtrace/dt_printf.h
index 9771c4a8..4f4386a5 100644
--- a/libdtrace/dt_printf.h
+++ b/libdtrace/dt_printf.h
@@ -108,8 +108,10 @@ extern int dt_print_ustack(dtrace_hdl_t *, FILE *,
     const char *, caddr_t, uint64_t);
 extern int dt_print_mod(dtrace_hdl_t *, FILE *, const char *, caddr_t);
 extern int dt_print_umod(dtrace_hdl_t *, FILE *, const char *, caddr_t);
-extern int dt_print_type(dtrace_hdl_t *, FILE *, uint64_t, ctf_id_t,
-			 caddr_t, size_t);
+extern int dt_print_type(dtrace_hdl_t *dtp, FILE *fp, void *fmtdata,
+			 const dtrace_probedata_t *data,
+			 const dtrace_recdesc_t *recs,
+			 uint_t nrecs, const void *buf, size_t len);
 
 #ifdef	__cplusplus
 }
-- 
2.43.5

