Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEFE152E0F
	for <dtrace@lists.linux.dev>; Thu, 25 Apr 2024 20:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714077920; cv=none; b=TxXAFZtTSkq8+s6sfmYiJglzcgTlY4qOFPsHFRkQKkvjnNP9342G1LaLyd1jwzWuLQ+AufHunWpchhz+votO9HhKoumSehQ+BZBW9DRs2SkVr9OkE8s0F/QWmqrSmcMq0CFCH8BhhSVk/ThWToxbRNHMPvoDL2IpWcR2wYUPR6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714077920; c=relaxed/simple;
	bh=wHmtGFnelNi108lPQ+lqBeqy52hnQv/Lh7Eb2/A00bg=;
	h=Message-Id:Date:From:To:Subject; b=TzF5mgKMiTKi1wXlID2oawBOv11Y3VcF/KzDMsQo//Zs8Gf5t4F6kkJvfZNurxUX9cZsia9S1VNMP2trpw1pTYSuZV1OZN7cDZPzbQcv+rWtPY5ZMzm06jPGVJ4bD/NqrcUV74j3lljihPdltPHY9LUVleO3/HwmlLFFI8CYBi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Obh6s5mt; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Obh6s5mt"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43PHO1sP023683
	for <dtrace@lists.linux.dev>; Thu, 25 Apr 2024 20:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 from : to : subject; s=corp-2023-11-20;
 bh=0Fc3xPH++Hy7ktvHbL9emrmF2E9kLrbF2Jdb0bEw31I=;
 b=Obh6s5mtKo5ylNu7T+3xNsCoyy7X4nllhS9Y6gTd0RBg770mzW+5GJTpmnZAIF/V+2GY
 IqjMJsGxGLys+x9SXXg7gG0Z68/txGCjZkx+jq0PG+OAdOxqznyQVqC0j7WmsQ0ulCAj
 lgu7fsajKxrQ4+KLx3M5TPtvC82HsZwHWxQYANgfa05eCnaw6ebS5DwS1b+kdq9hFJsq
 dtC/53yN0Kl0qKhLykbdYeMmcCk4PpX7pS2J0f5sOBb1WucBVkBCNKkybFfl/KzUAZ4D
 7iLoxumnZ5WV5/l+Ldvqy4AZB3YtQQ3nR3Vp0vyrTGbpFCIqi6NL/XIWGnK2d4WttcTH nA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xm44f42m2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 25 Apr 2024 20:45:17 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 43PJ6Ma4035551
	for <dtrace@lists.linux.dev>; Thu, 25 Apr 2024 20:45:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3xm45ax8pq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <dtrace@lists.linux.dev>; Thu, 25 Apr 2024 20:45:16 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43PKjFQ9020523
	for <dtrace@lists.linux.dev>; Thu, 25 Apr 2024 20:45:15 GMT
Message-Id: <202404252045.43PKjFQ9020523@pps.reinject>
Received: from localhost (dhcp-10-65-177-248.vpn.oracle.com [10.65.177.248])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3xm45ax8nv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 25 Apr 2024 20:45:15 +0000
Date: Thu, 25 Apr 2024 16:45:14 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] bpf, btf: store BTF dict id for kernel modules
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_20,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=895
 bulkscore=0 mlxscore=0 suspectscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404250150
X-Proofpoint-ORIG-GUID: zInmFAx9UrOnQA8SLjkurKCIn_waGkwL
X-Proofpoint-GUID: zInmFAx9UrOnQA8SLjkurKCIn_waGkwL
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>

BPF requires a file descriptor (provided by the kernel) to be associated
with BTF type ids for loadble kernel modules.  This file descriptor can
only be obtained from the kernel based on a BTF dict id for the module,
and these ids are assigned dynamically at runtime when modules are
loaded.

After kernel modules are initialized for DTrace, the corresponding BTF
dict ids are associated with their modules.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_bpf.c  | 58 +++++++++++++++++++++++++++++++++++++++++++--
 libdtrace/dt_bpf.h  |  4 ++++
 libdtrace/dt_btf.c  | 55 +++++++++++++++++++++++++++++++++++++++++-
 libdtrace/dt_btf.h  |  5 +++-
 libdtrace/dt_impl.h |  3 +++
 libdtrace/dt_open.c |  2 +-
 6 files changed, 122 insertions(+), 5 deletions(-)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 2e43e545..b680026a 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -121,6 +121,60 @@ dt_bpf_prog_load(const dt_probe_t *prp, const dtrace_difo_t *dp,
 				  lvl, buf, sz);
 }
 
+/*
+ * Get BTF dict information based on its fd.
+ */
+int
+dt_bpf_btf_get_info_by_fd(int fd, btf_info_t *info, uint32_t *size)
+{
+	union bpf_attr	attr;
+	int		rc;
+
+	memset(&attr, 0, sizeof(attr));
+	attr.info.bpf_fd = fd;
+	attr.info.info = (uint64_t)info;
+	attr.info.info_len = *size;
+
+	rc = dt_bpf(BPF_OBJ_GET_INFO_BY_FD, &attr);
+	if (rc == 0)
+		*size = attr.info.info_len;
+
+	return rc;
+}
+
+/*
+ * Get a file descriptor for a BTF dict based on its id.
+ */
+int
+dt_bpf_btf_get_fd_by_id(uint32_t id)
+{
+	union bpf_attr	attr;
+
+	memset(&attr, 0, sizeof(attr));
+	attr.btf_id = id;
+
+	return dt_bpf(BPF_BTF_GET_FD_BY_ID, &attr);
+}
+
+/*
+ * Get the id for the "next" BTF dict based on a given id (0 to get the first).
+ */
+int
+dt_bpf_btf_get_next_id(uint32_t curr, uint32_t *next)
+{
+	union bpf_attr	attr;
+	int		rc;
+
+	memset(&attr, 0, sizeof(attr));
+	attr.start_id = curr;
+
+	rc = dt_bpf(BPF_BTF_GET_NEXT_ID, &attr);
+	if (rc == 0)
+		*next = attr.next_id;
+
+	return rc;
+}
+
 /*
  * Create a named BPF map.
  */
diff --git a/libdtrace/dt_bpf.h b/libdtrace/dt_bpf.h
index f9ff7756..5f8e315a 100644
--- a/libdtrace/dt_bpf.h
+++ b/libdtrace/dt_bpf.h
@@ -12,6 +12,7 @@
 #include <linux/bpf.h>
 #include <linux/perf_event.h>
 #include <dtrace/difo.h>
+#include <dt_btf.h>
 #include <dt_impl.h>
 
 struct dtrace_hdl;
@@ -65,6 +66,9 @@ extern int dt_bpf(enum bpf_cmd cmd, union bpf_attr *attr);
 extern int dt_bpf_gmap_create(struct dtrace_hdl *);
 extern int dt_bpf_lockmem_error(struct dtrace_hdl *dtp, const char *msg);
 
+extern int dt_bpf_btf_get_info_by_fd(int fd, btf_info_t *info, uint32_t *size);
+extern int dt_bpf_btf_get_fd_by_id(uint32_t id);
+extern int dt_bpf_btf_get_next_id(uint32_t curr, uint32_t *next);
 extern int dt_bpf_map_lookup(int fd, const void *key, void *val);
 extern int dt_bpf_map_next_key(int fd, const void *key, void *nxt);
 extern int dt_bpf_map_update(int fd, const void *key, const void *val);
diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
index 286e9e10..c315f086 100644
--- a/libdtrace/dt_btf.c
+++ b/libdtrace/dt_btf.c
@@ -13,7 +13,8 @@
 #include <linux/btf.h>
 
 #include <dt_impl.h>
-#include <dt_btf.h>
+#include <dt_bpf.h>
+#include <dt_module.h>
 
 typedef struct btf_header	btf_header_t;
 typedef struct btf_type		btf_type_t;
@@ -891,3 +892,55 @@ dt_btf_lookup_name_kind(dtrace_hdl_t *dtp, dt_btf_t *btf, const char *name,
 
 	return -ENOENT;
 }
+
+int
+dt_btf_get_module_ids(dtrace_hdl_t *dtp)
+{
+	uint32_t	id = 0;
+
+	for (;;) {
+		int		rc, fd;
+		btf_info_t	info;
+		char		name[PATH_MAX];
+		uint32_t	size = sizeof(info);
+		dt_module_t	*dmp;
+
+		rc = dt_bpf_btf_get_next_id(id, &id);
+		if (rc) {
+			if (errno == EPERM)
+				return 0;	/* Not supported. */
+			if (errno == ENOENT)
+				return 0;	/* Done. */
+
+			return dt_set_errno(dtp, errno);
+		}
+
+		fd = dt_bpf_btf_get_fd_by_id(id);
+		if (fd < 0) {
+			if (errno == ENOENT)
+				continue;	/* Module got unloaded? */
+
+			return dt_set_errno(dtp, errno);
+		}
+
+		memset(&info, 0, size);
+		info.name = (uint64_t)name;
+		info.name_len = sizeof(name);
+		rc = dt_bpf_btf_get_info_by_fd(fd, &info, &size);
+		close(fd);
+		if (rc)
+			return dt_set_errno(dtp, errno);
+
+		dmp = dt_module_lookup_by_name(dtp, name);
+		if (dmp == NULL)
+			continue;
+
+		dmp->dm_btf_id = id;
+	}
+}
+
+int
+dt_btf_module_fd(const dt_module_t *dmp)
+{
+	return dmp->dm_btf_id ? dt_bpf_btf_get_fd_by_id(dmp->dm_btf_id) : 0;
+}
diff --git a/libdtrace/dt_btf.h b/libdtrace/dt_btf.h
index 0146386b..60256f12 100644
--- a/libdtrace/dt_btf.h
+++ b/libdtrace/dt_btf.h
@@ -15,7 +15,8 @@
 extern "C" {
 #endif
 
-typedef struct dt_btf	dt_btf_t;
+typedef struct dt_btf		dt_btf_t;
+typedef struct bpf_btf_info	btf_info_t;
 
 extern void dt_btf_destroy(dtrace_hdl_t *, dt_btf_t *);
 extern dt_btf_t *dt_btf_load_module(dtrace_hdl_t *, dt_module_t *);
@@ -23,6 +24,8 @@ extern ctf_dict_t *dt_btf_module_ctf(dtrace_hdl_t *, dt_module_t *);
 extern const char *dt_btf_get_string(dtrace_hdl_t *, dt_btf_t *, uint32_t);
 extern int32_t dt_btf_lookup_name_kind(dtrace_hdl_t *, dt_btf_t *,
 				       const char *, uint32_t);
+extern int dt_btf_get_module_ids(dtrace_hdl_t *);
+extern int dt_btf_module_fd(const dt_module_t *);
 
 #ifdef	__cplusplus
 }
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 7cf71060..0c154875 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -159,6 +159,7 @@ typedef struct dt_module {
 	ctf_sect_t dm_ctdata;	/* CTF data for module */
 	ctf_sect_t dm_symtab;	/* symbol table */
 	ctf_sect_t dm_strtab;	/* string table */
+	uint32_t dm_btf_id;	/* BTF dict id */
 	struct dt_btf *dm_btf;	/* BTF data for module */
 
 	/*
@@ -339,6 +340,8 @@ struct dtrace_hdl {
 	char *dt_ctfa_path;	/* path to vmlinux.ctfa */
 	ctf_archive_t *dt_ctfa; /* ctf archive for the entire kernel tree */
 	struct dt_btf *dt_shared_btf; /* BTF data for the kernel (shared) */
+	int dt_btf_cnt;		/* BTF id count */
+	int *dt_btf_fds;	/* BTF id-to-fd mapping */
 	ctf_file_t *dt_shared_ctf; /* Handle to the shared CTF */
 	dt_htab_t *dt_kernpaths; /* hash table of dt_kern_path_t's */
 	dt_module_t *dt_exec;	/* pointer to executable module */
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 8c3d3133..225bec50 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -29,7 +29,6 @@
 
 #include <dt_impl.h>
 #include <dt_bpf.h>
-#include <dt_btf.h>
 #include <dt_pcap.h>
 #include <dt_program.h>
 #include <dt_module.h>
@@ -1155,6 +1154,7 @@ dt_vopen(int version, int flags, int *errp,
 		return set_open_errno(dtp, errp, dtp->dt_errno);
 
 	dt_bpf_init(dtp);
+	dt_btf_get_module_ids(dtp);
 
 	return dtp;
 }
-- 
2.42.0

