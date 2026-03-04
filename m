Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBA2388E56
	for <dtrace@lists.linux.dev>; Wed,  4 Mar 2026 08:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611293; cv=none; b=B1YjVzFzkfUAKFOZXL9NTmCOQJA5KUUNZt+ctt1M/KVVjCTrygws21QJjlhhzWUHrpNBDVanxLWDcoLKx9WtvigCvHdgjpX0+kaOG7jIFNgPcAf/H9U5+TGN4Eks21rPXYnJhLps1vFXUJzH57IQ6jFGsnxwWHHzbzK32EYSupA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611293; c=relaxed/simple;
	bh=Q+l67S/Po2mUVy45YjCasRmwlhlti+YdW/jza3BLb9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PJ2UtcF09aqInypfkcr0MEKvmklNmbGKT8/eNoNbFqmFpLymBJYVH51Mo1fu8Ut3fhknZVLxb3K9kTZ3wunNCu4YGTUqwGm1e8jo7cbaLusiZKqENM9mnUr/U9+J6unDEkc/JWqWf5/H4pgSNoSEeLhFapvOtG/a+7tRvDWEh+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kB1QUxpf; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kB1QUxpf"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6247hLN82304038
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=9+dwT
	kc1HG9XG5/sIlzSNHgnmAQHn/u/c+vZ9SRfqHs=; b=kB1QUxpf7vaubT8uqnm2M
	Jq3KNieKYWYKdp/r2kpd3a04ht8i4Br/K9z7W3nhJJDOEQctNNrIYAfE1zZgJxOH
	DmkNejS2UHJU/0thWZjXECMlJELA1UlmABD835meDC6vMh+pY8wYw+/ZG1yPovyS
	X2j0p9oRcQsTBqqJ3OjpvqGND0qwyrp9nlEaoH0D++cDohxqq9S+Q07sjvWd0HIF
	oqyKPNWm5yHCnaew/S+74hHq45LNh2SObV4yAQQuB+se6URkYwaLfpOuMNKcT+4j
	G5zz9B5n95xd7dc/Mq6Cc6f367O7SYPz7EaE3yjP0Wouyz6cJu4IKUnjuz8rrPPH
	A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cpgkjr0sq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 08:01:30 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6246jiH7001421
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:01:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ckptfs2w4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 08:01:29 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62481RYd023337
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:01:29 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-62-133.vpn.oracle.com [10.154.62.133])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4ckptfs2t1-3;
	Wed, 04 Mar 2026 08:01:28 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v5 2/9] stapsdt provider: support systemwide probing
Date: Wed,  4 Mar 2026 08:01:18 +0000
Message-ID: <20260304080125.649031-3-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260304080125.649031-1-alan.maguire@oracle.com>
References: <20260304080125.649031-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603040063
X-Authority-Analysis: v=2.4 cv=GvtPO01C c=1 sm=1 tr=0 ts=69a7e6da b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=3I1J8UUJPc9JN9BFgKH3:22 a=yPCof4ZbAAAA:8 a=N_mudra7H56v1t7999YA:9 cc=ntf
 awl=host:13812
X-Proofpoint-ORIG-GUID: _LmQOJ5y8xW_8bpytkVfTR5JC5JTO83M
X-Proofpoint-GUID: _LmQOJ5y8xW_8bpytkVfTR5JC5JTO83M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2MyBTYWx0ZWRfX7bRYjplQ7izE
 k2mkz1C+Cio5M0TV3GbXSgfyxiOnJJunBa2qDJwKjeKQNBiwNxQ/dMIkKrxuZfULMVyVkNMngcU
 ez0TrxyzwSBc3Q+TyQR0X9C9y9LHEW4fJ7D5XJkfmEJ5U1WtRtoHVS1e0FqHiRhEK/T2PLQaJPM
 789F/yEcCbGxjbKu5Pl2z/qe2wnHTUKlaGA5cpEeJwwh/ApPHATJzRKt415C6MRGh171zuGztBK
 C5tVsZ3SS5j3VL2UvwOR2QFvSdKNQAPAyMx/+f/WrtAmfml6kMShCsk6cz/rtrGkmpcjii81VW5
 1S1171Xa5DhM3wP0aiZLRwQjuntlk9dHKslfu1X9PaqQE+Xq8P1+g1UXfV87NEbVEez+bCcvV/W
 842eCS1JWzLAAmxhP2vvpAGc9E4KevsLoVbtPcNQvHUExmi8ODJBc10SwCzpLa+bedVvn3o2tM5
 iayvATk3sihYZzo917gPlS/CxHcZCXKVt46PeweY=

For stapsdt probes we can do systemwide probing by having
the kernel insert traps into the VMAs associated with a file.

The key problem for DTrace is how to specify a file path in
a module in a provider:module:function:probe specification.

Here the approach (also used by libbpf) is to support both
absolute paths and to expand binary/library names into full
paths using [LD_LIBRARY_]PATH from a binary/library name; so
specifying

myprov*:myprog::myprobe

causes us to search /usr/bin, /usr/sbin and PATH directories
to find myprog to instrument it.  If the module contains .so
we check /usr/lib, /usr/lib64 and LD_LIBRARY_PATH.  This is
beneficial as it allows scripts to be interoperable across
distros that use different directories for locating binaries.

The other part that was needed was fixups to offsets that are
optionally provided in .stapsdt.base and the addrs[1] value.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_pid.c         | 174 ++++++++++++++++++++++++++++---------
 libdtrace/dt_prov_uprobe.c |  15 ++--
 2 files changed, 144 insertions(+), 45 deletions(-)

diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 7e6e5d90..e8969d7c 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -7,7 +7,9 @@
 
 #include <sys/ioctl.h>
 #include <sys/types.h>
+#include <sys/stat.h>
 #include <sys/sysmacros.h>
+#include <unistd.h>
 #include <stddef.h>
 #include <assert.h>
 #include <ctype.h>
@@ -34,11 +36,13 @@
 
 #include <dt_impl.h>
 #include <dt_program.h>
+#include <dt_probe.h>
 #include <dt_provider.h>
 #include <dt_pid.h>
 #include <dt_string.h>
 
 #define SEC_STAPSDT_NOTE	".note.stapsdt"
+#define SEC_STAPSDT_BASE	".stapsdt.base"
 #define NAME_STAPSDT_NOTE	"stapsdt"
 
 /*
@@ -1262,9 +1266,10 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
 		 const dt_provider_t *pvp, char *path, unsigned long addr_start)
 {
 	size_t shstrndx, noff, doff, off, n;
+	Elf_Scn *scn = NULL, *nscn = NULL;
 	const prmap_t *pmp = NULL;
+	unsigned long base = 0;
 	char *mapfile = NULL;
-	Elf_Scn *scn = NULL;
 	Elf *elf = NULL;
 	GElf_Shdr shdr;
 	GElf_Ehdr ehdr;
@@ -1281,11 +1286,16 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
 			     path, strerror(errno));
 		return -1;
 	}
-	mod = strrchr(path, '/');
-	if (mod)
-		mod++;
-	else
-		mod = path;
+
+	if (strlen(pdp->mod) == 0) {
+		mod = strrchr(path, '/');
+		if (mod)
+			mod++;
+		else
+			mod = path;
+	} else {
+		mod = (char *)pdp->mod;
+	}
 
 	elf = elf_begin(fd, ELF_C_READ_MMAP, NULL);   // ELF_C_READ ?
 
@@ -1317,12 +1327,14 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
 		secname = elf_strptr(elf, shstrndx, shdr.sh_name);
 		if (strcmp(secname, SEC_STAPSDT_NOTE) == 0 &&
 		    shdr.sh_type == SHT_NOTE)
-			break;
+			nscn = scn;
+		if (strcmp(secname, SEC_STAPSDT_BASE) == 0)
+			base = shdr.sh_addr;
 	}
 	/* No ELF notes, just bail. */
-	if (scn == NULL)
+	if (nscn == NULL)
 		goto out;
-	data = elf_getdata(scn, 0);
+	data = elf_getdata(nscn, 0);
 	for (off = 0;
 	     (off = gelf_getnote(data, off, &nhdr, &noff, &doff)) > 0;) {
 		char prvname[DTRACE_PROVNAMELEN];
@@ -1386,37 +1398,57 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
 				psp.pps_refcntr_off = addrs[2] - phdr.p_vaddr + phdr.p_offset;
 		}
 
+		/* readjust based on optional .stapsdt.base, note base addr. */
+		if (base && addrs[1])
+			psp.pps_off += base - addrs[1];
+
 		if (!psp.pps_off)
 			continue;
 		psp.pps_nameoff = 0;
 
-		if (!pmp)
-			pmp = Paddr_to_map(dpr->dpr_proc, addr_start + addrs[0]);
-		if (!pmp) {
-			dt_dprintf("%i: cannot determine 0x%lx's mapping\n",
-				   Pgetpid(dpr->dpr_proc), psp.pps_off);
-			continue;
-		}
-		if (!mapfile)
-			mapfile = Pmap_mapfile_name(dpr->dpr_proc, pmp);
+		if (dpr) {
+			if (!pmp)
+				pmp = Paddr_to_map(dpr->dpr_proc, addr_start + addrs[0]);
+			if (!pmp) {
+				dt_dprintf("%i: cannot determine 0x%lx's mapping\n",
+					   Pgetpid(dpr->dpr_proc), psp.pps_off);
+				continue;
+			}
+			if (!mapfile)
+				mapfile = Pmap_mapfile_name(dpr->dpr_proc, pmp);
+			if (!mapfile) {
+				dt_pid_error(dtp, dpr, D_PROC_USDT,
+					"Cannot get name of mapping containing probe %s for pid %d\n",
+					psp.pps_prb, dpr->dpr_pid);
+				err = -1;
+				break;
+			}
+			psp.pps_fn = mapfile;
+			if (dt_Plookup_by_addr(dtp, dpr->dpr_pid, addr_start + addrs[0],
+					       &fun, &sym) == 0)
+				psp.pps_fun = (char *)fun;
+			else
+				psp.pps_fun = no_fun;
+			psp.pps_dev = pmp->pr_dev;
+			psp.pps_inum = pmp->pr_inum;
+			psp.pps_pid = dpr->dpr_pid;
+			psp.pps_nameoff = 0;
+		} else {
+			struct stat stats = {};
 
-		if (!mapfile) {
-			dt_pid_error(dtp, dpr, D_PROC_USDT,
-				"Cannot get name of mapping containing probe %s for pid %d\n",
-				psp.pps_prb, dpr->dpr_pid);
-			err = -1;
-			break;
-		}
-		psp.pps_fn = mapfile;
-		if (dt_Plookup_by_addr(dtp, dpr->dpr_pid, addr_start + addrs[0],
-				       &fun, &sym) == 0)
-			psp.pps_fun = (char *)fun;
-		else
+			if (stat(path, &stats)) {
+				dt_pid_error(dtp, dpr, D_PROC_USDT,
+					     "failed to stat() %s", path);
+				dtrace_errmsg(dtp, dtrace_errno(dtp));
+				err = -1;
+			}
+			psp.pps_mod = mod;
+			psp.pps_dev = stats.st_dev;
+			psp.pps_inum = stats.st_ino;
+			psp.pps_fn = path;
 			psp.pps_fun = no_fun;
-		psp.pps_dev = pmp->pr_dev;
-		psp.pps_inum = pmp->pr_inum;
-		psp.pps_pid = dpr->dpr_pid;
-		psp.pps_nameoff = 0;
+			psp.pps_pid = -1;
+		}
 
 		if (pvp->impl->provide_probe(dtp, &psp) < 0) {
 			dt_pid_error(dtp, dpr, D_PROC_USDT,
@@ -1507,6 +1539,52 @@ dt_pid_create_stapsdt_probes_proc(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 	fclose(fp);
 }
 
+static int expand_modpath(const char *mod, char *path, size_t pathsz)
+{
+	const char *searches[2] = {};
+	int perm, i;
+
+	if (mod[0] == '/') {
+		strlcpy(path, mod, pathsz);
+		return 0;
+	}
+	if (strstr(mod, ".so")) {
+		searches[0] = getenv("LD_LIBRARY_PATH");
+		searches[1] = "/usr/lib64:/usr/lib";
+		perm = R_OK;
+	} else {
+		searches[0] = getenv("PATH");
+		searches[1] = "/usr/bin/:/usr/sbin";
+		perm = R_OK | X_OK;
+	}
+
+	for (i = 0; i < sizeof(searches)/sizeof(const char *); i++) {
+		const char *s, *n;
+
+		if (!searches[i])
+			continue;
+
+		for (s = searches[i]; s != NULL; s = n) {
+			int len;
+
+			if (*s == ':')
+				s++;
+			n = strchr(s, ':');
+			if (n)
+				len = n - s;
+			else
+				len = strlen(s);
+			snprintf(path, pathsz, "%.*s/%s", len, s, mod);
+			/* make sure accessible */
+			if (faccessat(AT_FDCWD, path, perm, AT_EACCESS) < 0)
+				continue;
+			dt_dprintf("%s: found full path '%s'\n", mod, path);
+			return 0;
+		}
+	}
+	return -ENOENT;
+}
+
 static int
 dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp)
 {
@@ -1521,14 +1599,25 @@ dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp)
 
 	pidstr = &pdp->prv[len];
 
-	while (isdigit(*(pidstr - 1)))
-		pidstr--;
-	if (strlen(pidstr) == 0)
-		return 0;
-
 	pvp = dt_provider_lookup(dtp, "stapsdt");
 	assert(pvp != NULL);
 
+	while (isdigit(*(pidstr - 1)))
+		pidstr--;
+	if (strlen(pidstr) == 0) {
+		char m[PATH_MAX];
+
+		/* only full pid wildcards are supported. */
+		if (*(pidstr - 1) != '*')
+			return 0;
+		if (isdigit(*(pidstr - 2)))
+			return 0;
+		if (dt_probe_lookup(dtp, pdp) != NULL)
+			return 0;
+		if (expand_modpath(pdp->mod, m, sizeof(m)))
+			return 0;
+		return dt_stapsdt_parse(dtp, NULL, pdp, pvp, m, 0);
+	}
 	pid = atoll(pidstr);
 	if (pid <= 0)
 		return 0;
@@ -1620,8 +1709,13 @@ dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp)
 	free(globpat);
 	globfree(&globbuf);
 
-	if (err == 0)
+	if (err == 0) {
 		err = dt_pid_create_stapsdt_probes(pdp, dtp);
+		if (err != 0) {
+			dt_dprintf("stapsdt probe creation %s:%s:%s:%s failed: %d\n",
+				   pdp->prv, pdp->mod, pdp->fun, pdp->prb, err);
+		}
+	}
 
 	/* If no errors, report success. */
 	if (err == 0)
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index e575b072..d2d2b1a4 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -507,7 +507,7 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
 			list_probe_t		*pup = prp->prv_data;
 			dt_uprobe_t		*upp = pup->probe->prv_data;
 
-			if (Pexists(upp->pid))
+			if (upp->pid == -1 || Pexists(upp->pid))
 				continue;
 		}
 
@@ -629,7 +629,7 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
 		assert(0);   // FIXME do something here
 
 	/* Even though we just enabled this, check it's still live. */
-	if (!Pexists(pid)) {
+	if (pid != -1 && !Pexists(pid)) {
 		probe_disable(dtp, prp);
 		dt_bpf_map_delete(fd, &pdp->id);
 
@@ -909,7 +909,8 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
 	dt_probe_t		*prp, *uprp;
 	list_probe_t		*pop, *pup;
 
-	snprintf(prv, sizeof(prv), "%s%d", psp->pps_prv, psp->pps_pid);
+	snprintf(prv, sizeof(prv), "%s%d", psp->pps_prv,
+		 psp->pps_pid == -1 ? 0 : psp->pps_pid);
 
 	pd.id = DTRACE_IDNONE;
 	pd.prv = prv;
@@ -934,6 +935,7 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
 		return -1;
 
 	upp = uprp->prv_data;
+	upp->pid = psp->pps_pid;
 	upp->flags |= flags;
 
 	/* Look up the overlying probe. */
@@ -1542,7 +1544,7 @@ static int uprobe_create(dtrace_hdl_t *dtp, const dt_uprobe_t *upp,
 	attr.uprobe_path = (uint64_t)upp->fn;
 	attr.probe_offset = upp->off;
 
-	return dt_perf_event_open(&attr, upp->pid, -1, -1, 0);
+	return dt_perf_event_open(&attr, upp->pid, upp->pid == -1 ? 0 : -1, -1, 0);
 }
 
 static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
@@ -1553,7 +1555,10 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
 	assert(upp->fn != NULL);
 
 	upp->fd = uprobe_create(dtp, upp, upp->refcntr_off);
-
+	if (upp->fd < 0) {
+		dt_dprintf("uprobe_create failed: %d\n", upp->fd);
+		return upp->fd;
+	}
 	/* attach BPF program to the probe */
 	if (ioctl(upp->fd, PERF_EVENT_IOC_SET_BPF, bpf_fd) < 0)
 		return -errno;
-- 
2.43.5

