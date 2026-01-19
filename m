Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71D837C0F0
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768832610; cv=none; b=avdvepHR4b8tewA3oIgOFOx+4NTky3eGtRlwFNEQN4UJwn8vS65ZGls18P5qMEptd24Jyt7zzc8S76eVI4BSgR1BBgukTlJRzGhc5G/l+KFYpluO5PN47rteOAfYHXormBzIjb2aRd0umEihDXDUS9jA4CafmE35mOxRRts/MsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768832610; c=relaxed/simple;
	bh=ixWzj9zLh4/Kb48dqrKRyj4bwAjnhyJW6uf67NuhW3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n1QOf8jolMbHSY8HtjX8yPM+39SY2zSLsqeGUsQP8swEZy3T2KRf5VMf6LgWzG8hrgWQUdWK/SXHUP9XVb5wbE8CHSmGIH51AiAqtKtePJjV5TWsAPyWyk7hkTy2cXFNakSKj7H4AYh3wHv4TJqv2mVubqmWRr3IEmsE4/nMQo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VaOAgIuU; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VaOAgIuU"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JBDhev1342126
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=XKSPP
	5Z40xVAkVO+3a9ObM0XUW4ebbDTKHujKbOXVV8=; b=VaOAgIuUdmQQZAgNX1mP7
	A5fSKbXhNRU/hgGejzBgzuyUqgq0yQOU2mYT5r5bMiYQ1bUSzKON7zpcwDH3ExaB
	uPNFO1TpVS5NIAdM8jZsNacHI98GVQ6z3nFVZkBtymy37mqcKeEIq0tc/0rOiF1H
	EBuAizFXskRFTiAUodmbyFPF2nqo2rST+eVFtEqRzbtvdHOhhl2wlRWRyTnu1pN4
	ootGVIM4ANL/WJ4QjLqY3GR20vzak7ul2IB0WMiE39dHqHHHTWxrTCQx7Fb8PzGd
	IS2b6/XwGUoXjUDXGci/38ZFkod6J2gJzxeD9Yf/PySES3zH3+4NVRfW9k+ZDU8r
	w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4br170acut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60JCIMJr022670
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4br0vc6ysd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:27 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60JEIDja015145
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:26 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-51-213.vpn.oracle.com [10.154.51.213])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4br0vc6ye3-3;
	Mon, 19 Jan 2026 14:23:26 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v4 2/9] stapsdt provider: support systemwide probing
Date: Mon, 19 Jan 2026 14:22:53 +0000
Message-ID: <20260119142300.975014-3-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260119142300.975014-1-alan.maguire@oracle.com>
References: <20260119142300.975014-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601190120
X-Proofpoint-ORIG-GUID: IKdw0g0QmbsZxvmhsTBW-K-38i-6rCHq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEyMCBTYWx0ZWRfX8uO2HXHrXO6c
 ZmdFtS8f9lon9WidVPlVWZhGS8Id3TI2TRCiYzP4yY19NWFEB95lElYmpOilDx11NS5qtUEhWgq
 LyVDeAPkqAfrmHTDNRsozwu20Wp4RluyZgCx/qCMOyj5uO6C3/rsaPi0gB2k+5mHzgiF+pGaGs8
 A1hY5/6LykimfKNb2nLnyJ7Zu6fnspY9jMaHIPkZ7u47Y6VsNDDhka334nUAWJbX9apEFFMxL4O
 w7O1OLnk+TiCt2k0du7xDMyKOOeaQBDgBNqVh3x99zs6XteCip95ALL8X0nBiXcAFC22s/5a+xU
 gzCnZPEkgLNipUKZLZZWPiMwpiS5VCdwjuB/5Qn6BGXw6eltiJt+GeQH2Oi9o95BfyT/dyNRjkp
 ASKUso9hbe86hXNTEEU6BdhHiEYcqGjYmL/UUTpmH9X4RLiy+WlF25ljXVLo03NAdFdzmdWXfkM
 LuWFAKDh1VOvXMw7QgKE20fOiauW9yoyX57IZEHs=
X-Proofpoint-GUID: IKdw0g0QmbsZxvmhsTBW-K-38i-6rCHq
X-Authority-Analysis: v=2.4 cv=FvoIPmrq c=1 sm=1 tr=0 ts=696e3e5f b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=N_mudra7H56v1t7999YA:9 cc=ntf awl=host:12109

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
 libdtrace/dt_pid.c         | 177 ++++++++++++++++++++++++++++---------
 libdtrace/dt_prov_uprobe.c |  17 ++--
 2 files changed, 148 insertions(+), 46 deletions(-)

diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 36a5883b..bd352455 100644
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
@@ -1267,9 +1271,10 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
 		 unsigned long addr_start)
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
@@ -1287,11 +1292,16 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
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
 
@@ -1323,12 +1333,14 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
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
@@ -1385,38 +1397,59 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
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
+						   Pgetpid(dpr->dpr_proc), psp.pps_off);
+				continue;
+			}
+			if (!mapfile)
+				mapfile = Pmap_mapfile_name(dpr->dpr_proc, pmp);
 
-		if (!mapfile) {
-			dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
-				     "Cannot get name of mapping containing probe %s for pid %d\n",
-				     psp.pps_prb, dpr->dpr_pid);
-			err = -1;
-			break;
-		}
-		psp.pps_fn = mapfile;
-		if (dt_Plookup_by_addr(dtp, dpr->dpr_pid, addr_start + addrs[0],
-				       &fun, &sym) == 0)
-			psp.pps_fun = (char *)fun;
-		else
-			psp.pps_fun = no_fun;
-		psp.pps_dev = pmp->pr_dev;
-		psp.pps_inum = pmp->pr_inum;
-		psp.pps_pid = dpr->dpr_pid;
-		psp.pps_nameoff = 0;
+			if (!mapfile) {
+				dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
+					     "Cannot get name of mapping containing probe %s for pid %d\n",
+					     psp.pps_prb, dpr->dpr_pid);
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
 
+			if (stat(path, &stats)) {
+				dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
+					     "failed to stat() %s", path);
+				dtrace_errmsg(dtp, dtrace_errno(dtp));
+				err = -1;
+				break;
+			}
+			psp.pps_mod = mod;
+			psp.pps_dev = stats.st_dev;
+			psp.pps_inum = stats.st_ino;
+			psp.pps_fn = path;
+			psp.pps_fun = no_fun;
+			psp.pps_pid = -1;
+		}
 		if (pvp->impl->provide_probe(dtp, &psp) < 0) {
 			dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
 				     "failed to instantiate probe %s for pid %d: %s",
@@ -1506,6 +1539,52 @@ dt_pid_create_stapsdt_probes_proc(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
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
 dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
 {
@@ -1522,14 +1601,25 @@ dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_
 
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
+		return dt_stapsdt_parse(dtp, NULL, pdp, pcb, pvp, m, 0);
+	}
 	pid = atoll(pidstr);
 	if (pid <= 0)
 		return 0;
@@ -1612,8 +1702,13 @@ dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *
 	free(globpat);
 	globfree(&globbuf);
 
-	if (err == 0)
+	if (err == 0) {
 		err = dt_pid_create_stapsdt_probes(pdp, dtp, pcb);
+		if (err != 0) {
+			dt_dprintf("stapsdt probe creation %s:%s:%s:%s failed: %d\n",
+				   pdp->prv, pdp->mod, pdp->fun, pdp->prb, err);
+		}
+	}
 
 	/* If no errors, report success. */
 	if (err == 0)
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index e94827f2..7b41270a 100644
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
 
@@ -919,7 +919,10 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
 	dt_probe_t		*prp, *uprp;
 	list_probe_t		*pop, *pup;
 
-	snprintf(prv, sizeof(prv), "%s%d", psp->pps_prv, psp->pps_pid);
+	if (psp->pps_pid == -1)
+		snprintf(prv, sizeof(prv), "%s*", psp->pps_prv);
+	else
+		snprintf(prv, sizeof(prv), "%s%d", psp->pps_prv, psp->pps_pid);
 
 	pd.id = DTRACE_IDNONE;
 	pd.prv = prv;
@@ -944,6 +947,7 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
 		return -1;
 
 	upp = uprp->prv_data;
+	upp->pid = psp->pps_pid;
 	upp->flags |= flags;
 
 	/* Look up the overlying probe. */
@@ -1552,7 +1556,7 @@ static int uprobe_create(dtrace_hdl_t *dtp, const dt_uprobe_t *upp,
 	attr.uprobe_path = (uint64_t)upp->fn;
 	attr.probe_offset = upp->off;
 
-	return dt_perf_event_open(&attr, upp->pid, -1, -1, 0);
+	return dt_perf_event_open(&attr, upp->pid, upp->pid == -1 ? 0 : -1, -1, 0);
 }
 
 static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
@@ -1563,7 +1567,10 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
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

