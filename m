Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FE64D8D92
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328671; cv=none; b=AnF3rjjBVV2oFzbNHujZLXlkmWOTbwX+qva9cH+3u5u1kzeCQC5qHdWR41kDBUkDCSAx8/nzu9ihzvxDciaDQcLch6mw3o177qeYQeYBgCCh+yC7llIcImVapSIkQov44ZGuMp7XV/xCW6t5Ni4PCWtoA+nWyAWOiqs5fMY5wZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328671; c=relaxed/simple;
	bh=p965gEK99DkITHcyvY2UvZDQ0+NlxesXf05/P6GD1KI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ieTAK3Mb6Gce1zEK22w64bdJzwmML1oY5RWausALJceb6HakB/haGDqqwQWTmZU2I8u5moBLGhPFSnFErFO9WVmY+NrV+EMKS/vGuYu4vE4O7nc32I+ffCy90XCse4EeTaWcOM1XdSFrdOkFuYnqkwBZ6O487glV1ZK1ExfOHLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bnyTxB/H; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bnyTxB/H"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LCpPvK3706409
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=/Lt/Y
	LlO1gE69W2zq3d5GNnVMHuo7b6tZEPfdBfA8CM=; b=bnyTxB/HeSiI+WhEzXxd/
	zICy9/o+h8eeG1uf6yI0TK9myXsUgnJHoSOrEl3Q1ZS4hzz/VHArVBRZUr0Lw7oI
	s+6imtL+RXfqYyRlu1/sfZ1/E4RGpqZrvsyLYwbnXMDwhpNNQ46VYscAkUBL8aVs
	gVTRJmo7olFWRFTRolWSRskcPAdio+tD77lutTiXcHu71+Nv2rgC2OS6RzoVDF1r
	BIygVjLquCiAq9Hco5yjyIGKsAaD9GO02LvkkmzSzHcWSbZlgS7r2Rx9ge3CFhNE
	lHZRCMLn3N2SMFjbxXLnbpkSb0BI8PK2lEsX+1hcWN9qCkbdsfsnzkmqCG1m/Wf4
	Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g4yd9der7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67LG5C0U029242
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4g2ejgcmxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:06 +0000 (GMT)
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67LGB2F3014592
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:06 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-51-128.vpn.oracle.com [10.154.51.128])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4g2ejgcmux-4;
	Fri, 21 Aug 2026 16:11:06 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v5 03/11] libdtrace: avoid BTF probes for ranged built-in modules
Date: Fri, 21 Aug 2026 17:10:51 +0100
Message-ID: <20260821161100.41710-4-alan.maguire@oracle.com>
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
 phishscore=0 mlxlogscore=949 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608210126
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX/52uxdatODIT
 iXwJGHdLA2EeMazVqCHiJ29r3M2B17jYaYig6IoUsKKSyYCQMR20D5FFPXQxcJzQirpZYG+dnIU
 puJJhwGOlUgac7CRSd0+WeeQlmI1DgY6YsbEjzOvVlUBmB64KvhD
X-Proofpoint-GUID: 8xxxoqhmblZFR-g9leaTnSPHgif9VzB1
X-Proofpoint-ORIG-GUID: 8xxxoqhmblZFR-g9leaTnSPHgif9VzB1
X-Authority-Analysis: v=2.4 cv=fbCdDUQF c=1 sm=1 tr=0 ts=6a88789c b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=BqU2WV_vvsyTyxaotp0D:22 a=yPCof4ZbAAAA:8 a=o_oq1EHSvvWxQPPCeTIA:9
 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX0YEQLJuQEtOw
 to7bTFHhGpnBJcWjdxQXcFxyY2dOq7nVBIebKdcfrkzCwPh6+9+RoDSLWtJfjBYhwFino6VWdV0
 4t5WlGovWAn0zR25/DtCD3ng+1c9d1zIBuON0A9IFZvFoFKtMTW9WQdLFzREf+PjxDX0XFE/Yku
 aho3w96xbuoXFG/q30wanDM3W0lmksZC0wW+SG/jckLjj17OmDDiHKo6FcaKmX+di0NNl30q9L+
 NtlLrKw7cbEZmWqgk3wJreNFm5JXVxRq0jmcB6C5Yg7ggAo/bdyqsDqWJOutoUz17PrZ9mEFUCg
 IdNmgv0LDo5BqbufDdHcfw+YErzAPNX8fuHlQDW+e4K75hsa3+wn7vezpd31milq2hyIJ0MrroH
 PnG7sRfNacZcXIRaDu7FLEsN8ax6ag1/ZD9mU9nw21ezRTB4ewdwf9cIcoUWyb5bw/CaA2jcoey
 mUEha5fYfFGV0qsi27A==

When /proc/kallsyms is used with modules.builtin.ranges, libdtrace can
attribute symbols linked into vmlinux to their individual built-in objects,
such as bitrev or atomic64_test.  This creates module objects for those
names.

These objects have no per-module BTF file under /sys/kernel/btf.  Avoid
probing for one when modules.builtin.ranges has identified the module as
built in, and use the shared vmlinux BTF directly instead.

Keep the existing lookup path for loadable modules and for an explicitly
configured BTF directory.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_btf.c    |  8 ++++++--
 libdtrace/dt_impl.h   |  1 +
 libdtrace/dt_module.c | 20 +++++++++++++++++++-
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
index e7980969..93ecf5cd 100644
--- a/libdtrace/dt_btf.c
+++ b/libdtrace/dt_btf.c
@@ -915,8 +915,12 @@ dt_btf_module_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 	if (!dtp->dt_shared_ctf && dtp->dt_shared_btf && btf == dtp->dt_shared_btf)
 		dtp->dt_shared_ctf = ctf;
 
-	dt_dprintf("Generated %s CTF from BTF (%d types).\n", dmp->dm_name,
-		   btf->type_cnt);
+	if (btf == dtp->dt_shared_btf && strcmp(dmp->dm_name, "vmlinux") != 0)
+		dt_dprintf("Created %s CTF import from shared vmlinux BTF.\n",
+		    dmp->dm_name);
+	else
+		dt_dprintf("Generated %s CTF from BTF (%d types).\n", dmp->dm_name,
+		    btf->type_cnt);
 #endif
 
 	return ctf;
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 7ccdc271..38c5ff0b 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -201,6 +201,7 @@ typedef struct dt_kern_path {
 #define DT_DM_KERNEL		0x2	/* module is associated with a kernel object */
 #define DT_DM_CTF_ARCHIVED	0x4	/* module found in a CTF archive */
 #define DT_DM_KERN_UNLOADED	0x8	/* module not loaded into the kernel */
+#define DT_DM_KERN_BUILTIN	0x10	/* module is linked into vmlinux */
 
 /*
  * Why do we need (only) 4 slots?  The maximum amount of string arguments to
diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
index 00978911..ea6d56c3 100644
--- a/libdtrace/dt_module.c
+++ b/libdtrace/dt_module.c
@@ -871,6 +871,19 @@ dt_kern_module_find_btf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 	if (dtp->dt_shared_btf == NULL && strcmp(dmp->dm_name, "vmlinux") != 0)
 		return;
 
+	/*
+	 * modules.builtin.ranges identifies this object as linked into vmlinux.
+	 * Such objects cannot have a per-module BTF object, so use the shared
+	 * vmlinux BTF directly.  Retain the usual lookup for an explicitly
+	 * configured BTF directory and every other module.
+	 */
+	if (dtp->dt_btf_path == NULL && (dmp->dm_flags & DT_DM_KERN_BUILTIN)) {
+		dmp->dm_btf = dtp->dt_shared_btf;
+		dt_dprintf("Using shared vmlinux BTF for built-in module %s.\n",
+		    dmp->dm_name);
+		return;
+	}
+
 	dt_dprintf("Loading BTF for module %s.\n", dmp->dm_name);
 
 	/*
@@ -1405,6 +1418,7 @@ dt_modsym_update(dtrace_hdl_t *dtp, const char *line, dt_kasstate_t *state)
 {
 	dt_kallsym_t	sym;
 	char		*modname;
+	int		builtin = 0;
 
 	if ((line[0] == '\n') || (line[0] == 0))
 		return 0;
@@ -1440,8 +1454,10 @@ dt_modsym_update(dtrace_hdl_t *dtp, const char *line, dt_kasstate_t *state)
 			char	*s;
 
 			s = dt_kasstate_modname(state, sym.addr, sym.name);
-			if (s != NULL)
+			if (s != NULL) {
 				strncpy(sym.mod, s, PATH_MAX);
+				builtin = 1;
+			}
 		}
 	}
 
@@ -1511,6 +1527,8 @@ dt_modsym_update(dtrace_hdl_t *dtp, const char *line, dt_kasstate_t *state)
 			if (err != 0)
 				return err;
 		}
+		if (builtin)
+			dmp->dm_flags |= DT_DM_KERN_BUILTIN;
 
 		err = dt_modsym_addsym(dtp, dmp, &sym, state);
 		if (err != 0)
-- 
2.43.5

