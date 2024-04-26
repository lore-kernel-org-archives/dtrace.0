Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF74145B1C
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 13:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714138414; cv=none; b=Aq29b3aqWzjFV/anVtBtQQ6/t8U8sWjH1fzjxEun+XBHhu61rhZ93sKPq/7imb8OEaPUfMW2S3YZEzkhFH7fxhT1xIEAgfpOuizgg6kCZetPGiatZ02uUYiZtYS1WDzT7y+TJULlnv0pKF4EWJ8AUDnpmyqq4oA1+iRppPRk+Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714138414; c=relaxed/simple;
	bh=CFQE/ippBNVUAMGynLb9z9qrUKjnuEnCUqEyz9gY44w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZRWk/hZT1aqs6Jwf/b2YuadqCwsgmQtES5ysuUL6oFB1NyPTzpl/KbHVBu0tGLVFtqwsHk2Tl9IdVpo7P6HQfHSz4fY5LKbi7c4K+HyjiSa8OE7BR+wNdl7UVaDlRKRPM8Fz+BNQo53UocJQibokZLEKgAsTfPopKexTU7974xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Okw9x36A; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Okw9x36A"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43Q8Tkxv008320
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 13:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-11-20; bh=qctHdv58rQM5QWpDSl8UbFT1phRlOQk7w/Wz63t7IzU=;
 b=Okw9x36A2PDMFfs8kry7oAftAFVM/lBWfWQcq4Q1b0KdonfFyeZZi/tKTbdZGofoZ19i
 FEwGh3RK4I/1nkaMqMIzLiazeBPMc+dOI0WIWzUMJraAKIkXHgGtKtbPJahZUuWptqnf
 oRpcbiqB9jL+I/qO7TliOOfjEc0ML43w9FVxCho21YVp1/KbghbYTBDldgloD19M9MBq
 SkFiNeTED/d5oEIR4IBIhFmEsGJcufG9o3GuHq181Mj81OxVX5uYeuvksHLrfmSVQpvm
 Wa1/2QZb/H3MCuuFOYsC+uvEZzQDstUqJAgoGU0Te+139pPCSAMb0wdPvFpiAgFnptmL iA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xm5kbwv4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 13:33:31 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 43QCI0pH001805
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 13:33:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3xm45cdrf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 13:33:29 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43QDXT9w009511
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 13:33:29 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-218-239.vpn.oracle.com [10.175.218.239])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3xm45cdrdr-1;
	Fri, 26 Apr 2024 13:33:29 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v3 1/2] print() action: identify ctf object used for print
Date: Fri, 26 Apr 2024 14:33:26 +0100
Message-Id: <20240426133327.578092-1-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_12,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404260089
X-Proofpoint-GUID: 3Q44KBd6CGeZsTvv8whDj3YJV_XJdGKG
X-Proofpoint-ORIG-GUID: 3Q44KBd6CGeZsTvv8whDj3YJV_XJdGKG

when generating code for print() action we need to identify source
of CTF; is it shared CTF, cdefs or ddefs or another module?
Introduce a module id scheme where the module id can be stored
at cg time for later retrieval at print time; this allows us
to later look up the module and its associated CTF without relying
on possibly freed pointers.

Under the hood, the id scheme uses a monotonic counter coupled
with the hash of the modules name; the latter allows us to quickly
look up the right bucket via dt_htab_find_hval().

This fixes an issue encountered when using a shared kernel type
with alloca()ed memory; DTrace assumed the type was in ddefs
and it wasn't so it wasn't displayed.  This change fixes that and
all tests continue to pass.  Also tested that it works with
kernel module-defined types now:

dtrace: description 'fbt::ieee80211_rx_napi:entry ' matched 1 probe
CPU     ID                    FUNCTION:NAME
  7 123161          ieee80211_rx_napi:entry 0xffff9f8980fa08e0 = *
                                            (struct ieee80211_hw) {
                                             .conf = (struct ieee80211_conf) {
                                              .listen_interval = (u16)10,
                                              .long_frame_max_tx_count = (u8)4,
                                              .short_frame_max_tx_count = (u8)7,
                                             },

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_cg.c      |  7 ++++++-
 libdtrace/dt_consume.c |  7 +++++--
 libdtrace/dt_htab.c    | 17 +++++++++++++++++
 libdtrace/dt_htab.h    |  2 ++
 libdtrace/dt_impl.h    |  1 +
 libdtrace/dt_module.c  | 30 ++++++++++++++++++++++++++++++
 libdtrace/dt_module.h  |  1 +
 libdtrace/dt_printf.c  | 12 +++++++++---
 libdtrace/dt_printf.h  |  2 +-
 9 files changed, 72 insertions(+), 7 deletions(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 27246a40..30cccdaf 100644
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
@@ -2832,7 +2833,9 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
 	ctf_id_t	type = addr->dn_type;
 	char		n[DT_TYPE_NAMELEN];
 	size_t		size;
+	dt_module_t	*dmp;
 
+	dmp = dt_module_lookup_by_ctf(dtp, fp);
 	type = ctf_type_reference(fp, type);
 	if (type == CTF_ERR)
 		longjmp(yypcb->pcb_jmpbuf, EDT_CTF);
@@ -2842,9 +2845,11 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
 			"print( ) argument #1 reference has type '%s' with size 0; cannot print( ) it.\n",
 			ctf_type_name(fp, type, n, sizeof(n)));
 
-	/* reserve space for addr/type, data/size */
+	/* reserve space for addr/type, module identification, data/size */
 	addr_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
 			      sizeof(uint64_t), 8, NULL, type);
+	dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
+		   sizeof(uint64_t), 8, NULL, (uint64_t)dmp->dm_id);
 	data_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
 			      size, 8, NULL, size);
 
diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index dec2314b..432b4e12 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -1987,9 +1987,11 @@ static int
 dt_print_print(dtrace_hdl_t *dtp, FILE *fp, dtrace_recdesc_t *rec,
 	       const caddr_t buf)
 {
-	dtrace_recdesc_t *data_rec = rec + 1;
+	dtrace_recdesc_t *ctf_rec = rec + 1;
+	dtrace_recdesc_t *data_rec = rec + 2;
 	size_t max_size = dtp->dt_options[DTRACEOPT_PRINTSIZE];
 	size_t size = (size_t)data_rec->dtrd_arg;
+	unsigned long dm_id = (unsigned long)ctf_rec->dtrd_arg;
 	uint64_t printaddr;
 
 	if (size > max_size)
@@ -1998,7 +2000,8 @@ dt_print_print(dtrace_hdl_t *dtp, FILE *fp, dtrace_recdesc_t *rec,
 	if (dt_read_scalar(buf, rec, &printaddr) < 0)
 		return dt_set_errno(dtp, EDT_PRINT);
 
-	return dt_print_type(dtp, fp, printaddr, (ctf_id_t)rec->dtrd_arg,
+	return dt_print_type(dtp, fp, printaddr, dm_id,
+			     (ctf_id_t)rec->dtrd_arg,
 			     (caddr_t)buf + data_rec->dtrd_offset, size);
 }
 
diff --git a/libdtrace/dt_htab.c b/libdtrace/dt_htab.c
index 478c728a..3c167cb5 100644
--- a/libdtrace/dt_htab.c
+++ b/libdtrace/dt_htab.c
@@ -229,6 +229,23 @@ void *dt_htab_find(const dt_htab_t *htab, const void *entry,
 	return ent;
 }
 
+/* Find an entry in the hashtable, using the provided callback function as a
+ * secondary comparison function to differentiate between entries in a bucket.
+ * A pre-computed hash value is passed in.
+ */
+void *dt_htab_find_hval(const dt_htab_t *htab, uint32_t hval,
+			dt_htab_ecmp_fn *cmpf, void *arg)
+{
+	int		idx = hval & htab->mask;
+	dt_hbucket_t	*bucket;
+
+	for (bucket = htab->tab[idx]; bucket; bucket = bucket->next) {
+		if (cmpf(bucket->head, arg))
+			return bucket->head;
+	}
+	return NULL;
+}
+
 /*
  * Remove an entry from the hashtable.  If we are deleting the last entry in a
  * bucket, get rid of the bucket.
diff --git a/libdtrace/dt_htab.h b/libdtrace/dt_htab.h
index d39ae65e..1ce5a80d 100644
--- a/libdtrace/dt_htab.h
+++ b/libdtrace/dt_htab.h
@@ -100,6 +100,8 @@ extern void *dt_htab_lookup(const dt_htab_t *htab, const void *entry);
 typedef int dt_htab_ecmp_fn(const void *entry, void *arg);
 extern void *dt_htab_find(const dt_htab_t *htab, const void *entry,
 			  dt_htab_ecmp_fn *cmpf, void *arg);
+extern void *dt_htab_find_hval(const dt_htab_t *htab, uint32_t hval,
+			       dt_htab_ecmp_fn *cmpf, void *arg);
 extern size_t dt_htab_entries(const dt_htab_t *htab);
 extern int dt_htab_delete(dt_htab_t *htab, void *entry);
 extern void *dt_htab_next(const dt_htab_t *htab, dt_htab_next_t **it);
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 2dfb64d6..2bd1dafe 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -136,6 +136,7 @@ typedef struct dt_module {
 	dt_list_t dm_list;	/* list forward/back pointers */
 	char dm_name[DTRACE_MODNAMELEN]; /* string name of module */
 	char dm_file[PATH_MAX]; /* file path of module */
+	unsigned long dm_id;	/* id of module */
 	uint_t dm_flags;	/* module flags (see below) */
 	struct dt_hentry dm_he;	/* htab links */
 	dtrace_hdl_t *dm_dtp;	/* backpointer to the dtrace instance */
diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
index 1e730426..7697f73b 100644
--- a/libdtrace/dt_module.c
+++ b/libdtrace/dt_module.c
@@ -35,6 +35,8 @@
 #define KSYM_NAME_MAX 128		    /* from kernel/scripts/kallsyms.c */
 #define GZCHUNKSIZE (1024*512)		    /* gzip uncompression chunk size */
 
+unsigned int module_idx = 0;
+
 static void
 dt_module_unload(dtrace_hdl_t *dtp, dt_module_t *dmp);
 
@@ -50,6 +52,12 @@ dt_module_hval(const dt_module_t *mod)
 	return str2hval(mod->dm_name, 0);
 }
 
+/* id is combination of hash and index */
+static void dt_module_init_id(dt_module_t *dmp)
+{
+	dmp->dm_id = ((unsigned long)dt_module_hval(dmp)) << 32 | module_idx++;
+}
+
 static int
 dt_module_cmp(const dt_module_t *p, const dt_module_t *q)
 {
@@ -150,6 +158,7 @@ dt_module_create(dtrace_hdl_t *dtp, const char *name)
 
 	memset(dmp, 0, sizeof(dt_module_t));
 	strlcpy(dmp->dm_name, name, sizeof(dmp->dm_name));
+	dt_module_init_id(dmp);
 	if (dt_htab_insert(dtp->dt_mods, dmp) < 0) {
 		free(dmp);
 		return NULL;
@@ -193,6 +202,27 @@ dt_module_lookup_by_ctf(dtrace_hdl_t *dtp, ctf_file_t *ctfp)
 	return ctfp ? ctf_getspecific(ctfp) : NULL;
 }
 
+static int
+dt_module_idmatch(const dt_module_t *m1, dt_module_t *m2)
+{
+	return m1->dm_id == m2->dm_id;
+}
+
+/* High-order 32 bits of id are hash value, low order the module index.
+ * This allows us to limit cost of search based on bucket size.
+ */
+dt_module_t *
+dt_module_lookup_by_id(dtrace_hdl_t *dtp, unsigned long id)
+{
+	uint32_t hval = id >> 32;
+	dt_module_t tmpl;
+
+	tmpl.dm_id = id;
+
+	return dt_htab_find_hval(dtp->dt_mods, hval, (dt_htab_ecmp_fn *)dt_module_idmatch,
+				 &tmpl);
+}
+
 static int
 dt_module_init_elf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 {
diff --git a/libdtrace/dt_module.h b/libdtrace/dt_module.h
index 56df17a6..68dadfc6 100644
--- a/libdtrace/dt_module.h
+++ b/libdtrace/dt_module.h
@@ -18,6 +18,7 @@ extern dt_module_t *dt_module_create(dtrace_hdl_t *, const char *);
 
 extern dt_module_t *dt_module_lookup_by_name(dtrace_hdl_t *, const char *);
 extern dt_module_t *dt_module_lookup_by_ctf(dtrace_hdl_t *, ctf_file_t *);
+extern dt_module_t *dt_module_lookup_by_id(dtrace_hdl_t *, unsigned long);
 
 extern ctf_file_t *dt_module_getctf(dtrace_hdl_t *, dt_module_t *);
 extern dt_ident_t *dt_module_extern(dtrace_hdl_t *, dt_module_t *,
diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
index 50842216..108adc23 100644
--- a/libdtrace/dt_printf.c
+++ b/libdtrace/dt_printf.c
@@ -14,6 +14,7 @@
 #include <limits.h>
 #include <port.h>
 
+#include <dt_module.h>
 #include <dt_printf.h>
 #include <dt_string.h>
 #include <dt_impl.h>
@@ -2236,13 +2237,18 @@ err:
 
 int
 dt_print_type(dtrace_hdl_t *dtp, FILE *fp, uint64_t printaddr,
-	      ctf_id_t type, caddr_t data, size_t size)
+	      unsigned long dm_id, ctf_id_t type, caddr_t data, size_t size)
 {
 	struct dt_visit_arg dva;
+	dt_module_t *dmp = dt_module_lookup_by_id(dtp, dm_id);
 
+	if (!dmp) {
+		dt_dprintf("error retrieving CTF for print() action\n");
+		return dt_set_errno(dtp, EDT_CTF);
+	}
+	dva.dv_ctfp = dt_module_getctf(dtp, dmp);
 	dva.dv_dtp = dtp;
 	dva.dv_fp = fp;
-	dva.dv_ctfp = dtp->dt_ddefs->dm_ctfp;
 	dva.dv_data = data;
 	dva.dv_size = size;
 	dva.dv_last_depth = 0;
@@ -2260,5 +2266,5 @@ dt_print_type(dtrace_hdl_t *dtp, FILE *fp, uint64_t printaddr,
 	if (dt_print_close_parens(&dva, 0) < 0)
 		return -1;
 
-	return 2;
+	return 3;
 }
diff --git a/libdtrace/dt_printf.h b/libdtrace/dt_printf.h
index 9771c4a8..8d55d82b 100644
--- a/libdtrace/dt_printf.h
+++ b/libdtrace/dt_printf.h
@@ -108,7 +108,7 @@ extern int dt_print_ustack(dtrace_hdl_t *, FILE *,
     const char *, caddr_t, uint64_t);
 extern int dt_print_mod(dtrace_hdl_t *, FILE *, const char *, caddr_t);
 extern int dt_print_umod(dtrace_hdl_t *, FILE *, const char *, caddr_t);
-extern int dt_print_type(dtrace_hdl_t *, FILE *, uint64_t, ctf_id_t,
+extern int dt_print_type(dtrace_hdl_t *, FILE *, uint64_t, unsigned long, ctf_id_t,
 			 caddr_t, size_t);
 
 #ifdef	__cplusplus
-- 
2.39.3

