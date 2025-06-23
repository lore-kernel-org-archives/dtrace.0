Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D480238C26
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 10:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750673600; cv=none; b=iZicgvNvnqEtD+4pqkbnPF9CAg2S4CfFd7tCueliMZLNa1SlwNnUaK5yP4H6eC0QCiq+s0NZ0tze9vWQSQAmC43Ie/5I2rOfnyOKwFfcQDekHA5QF3t2HiKEUgOHV7jaGHz/5Ukg2jb/oyBvuKdW0xnK1R0/ndvh3NK16dhUOZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750673600; c=relaxed/simple;
	bh=VTXmDFF8bMjwMuLaG2Q6/R4u+iggh2wxCnwBa+gb+Ps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cFx6ysmtYB33qUEMOSOrT3kdW5ht+xLXK19/fx6hST3MDjL1kSEaqsQj3T00PfFvF5R60xcYSocY6lhiIvZ2i6sUU+CD1uPrXWJcQKSMMifpzU0k9FuoL9h8WYv8Rc89280AU0ZObAzifz+vX3UaYBTN9TDA9CCEXGFkX+rrFRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JS1h6fGo; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JS1h6fGo"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N8pPws000840
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 10:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=+JPli
	4G6mi0B7JbJJU8kcRrM+83zrScUOfsrCApMajg=; b=JS1h6fGoNvFvCPMXr/S7h
	Nb28MyMgaHjx2O8xp8uKL4H+RZqsgpoO4lYabVd1dBYjVSoWK5gIi5+FONpkOkVp
	5i5YG9FZbMOSI8LPkWdeR7Cjlc2MKef3il+08xAQHgas1ojNz3CHSHJZVUdFYTiv
	034jZs9GMZwWpNeHwQ6C5IAKAOH4dUITWSqaNbtun4tjCM+RgbvbKQeMfgf4O7Kl
	mjKqf/roD30fj+mAyTXXOcwMTL65Iw1ALMB73ImlaySg/e4kVkWPb5mhFq1PvXdh
	Jy822L/o+nSI3X1AvRWpy92ajAuYmUIltvLG+9AYPvVQQoSyi3GkThVRVVDpK7BY
	w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt7994y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 10:13:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9dFFh008012
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 10:13:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq25edq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 10:13:16 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55NADCno007270
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 10:13:15 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-58-219.vpn.oracle.com [10.154.58.219])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47ehq25ebq-3;
	Mon, 23 Jun 2025 10:13:14 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v4 2/5] support stapsdt ELF-note-defined static probes
Date: Mon, 23 Jun 2025 11:13:07 +0100
Message-ID: <20250623101310.1649756-3-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250623101310.1649756-1-alan.maguire@oracle.com>
References: <20250623101310.1649756-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506230060
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2MCBTYWx0ZWRfXwkkH7gE0zkZL ioQVKdjizby1eqwfHFKavqs//FgsqN3d9nnGV94NLAxThKvO0od1xt+QE/McFYVmmvuBi8o2dkS Z6EvPf7iWr/VF8a1wCXlguHJmq8zbRvI4k4aEvHFNsHQ+4sKG9BotTv3x54uKpODqEo9OT+YAPn
 iOcAnseYgZeSqC4f67e5oT7fJadNyeKETiOvsbHOtXb5iSlX0xx6dovWx3gXHZOFXGtuK23I91a NT6uO2OIX85NYeORgjlUnmiC4YMWTK6VgPgWqDMPPU45/4SpcLZZ1KmRRjafY2agMQUhRIDIwGr ++pD6zyNzK6b4L0NjQUN7Y0nYOfxgEh0uPz8IK1N1yGJmaztIFpvXWIlz/MAiw1wjpcukJIFXrh
 ya/WNkBZD9IZ62KJOpKMAe7kZuI38cMidn4ho0QEuS5XlS0yUxdJfJpmzIBKE/ztwKZQd6eY
X-Proofpoint-GUID: G_sYdfL9KC5F97hS_pTa8hDKkJ4esX-4
X-Authority-Analysis: v=2.4 cv=QNpoRhLL c=1 sm=1 tr=0 ts=685928bd cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=yPCof4ZbAAAA:8 a=BMKkcS51_EspNcNP4GMA:9
X-Proofpoint-ORIG-GUID: G_sYdfL9KC5F97hS_pTa8hDKkJ4esX-4

As well as using dtrace -G to generate USDT probes, programs and
libraries may have added static probes via stapsdt ELF notes.

Read ELF notes from binaries from /proc/ maps associated with processes
and parse them to retrieve uprobe address and argument-related info
to create the associated uprobe.

Probe arguments can be either constants, register values or dereferences
or dereferences from register values (plus offset), identical to the
updated USDT ELF note handling.

A new provider - stapsdt - implements this support, as stapsdt probes do
not dynamically register themselves with DTrace.  This makes them less
powerful than DTrace-based USDT probes, but they do exist in programs and
libraries so should be supported.

As well as supporting ELF-note stapsdt defined probes in programs and
libraries, this patch supports dynamically-created probes that
are created via libstapsdt [1].  libstapsdt allows dynamic languages
like python to declare and fire probes by dynamically creating
a memfd-based shared library containing ELF notes for the probes.
With these changes we can also trace these probes.  This is very
useful since libstapsdt has python, NodeJS, go and luaJIT bindings.

[1] https://github.com/linux-usdt/libstapsdt

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 include/dtrace/pid.h       |   1 +
 libdtrace/dt_pid.c         | 288 +++++++++++++++++++++++++++++++++++++
 libdtrace/dt_prov_uprobe.c |  43 +++++-
 3 files changed, 328 insertions(+), 4 deletions(-)

diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
index 8d4b6432..99093bc9 100644
--- a/include/dtrace/pid.h
+++ b/include/dtrace/pid.h
@@ -24,6 +24,7 @@ typedef enum pid_probetype {
 	DTPPT_OFFSETS,
 	DTPPT_ABSOFFSETS,
 	DTPPT_USDT,
+	DTPPT_STAPSDT,
 	DTPPT_IS_ENABLED
 } pid_probetype_t;
 
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index d12b7919..6581b087 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -38,6 +38,9 @@
 #include <dt_pid.h>
 #include <dt_string.h>
 
+#define SEC_STAPSDT_NOTE	".note.stapsdt"
+#define NAME_STAPSDT_NOTE	"stapsdt"
+
 /*
  * Information on a PID probe.
  */
@@ -1262,6 +1265,288 @@ dt_pid_create_pid_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *p
 	return err;
 }
 
+static int
+dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
+		 dt_pcb_t *pcb, const dt_provider_t *pvp, char *path,
+		 unsigned long base_addr)
+{
+	Elf *elf = NULL;
+	Elf_Scn *scn = NULL;
+	GElf_Shdr shdr;
+	GElf_Nhdr nhdr;
+	size_t shstrndx, noff, doff, off, n;
+	Elf_Data *data;
+	GElf_Ehdr ehdr;
+	int i, err = 0;
+	int fd = -1;
+	char *mod;
+
+	fd = open(path, O_RDONLY);
+	if (fd < 0) {
+		dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
+			     "Cannot open %s: %s\n",
+			     path, strerror(errno));
+		return -1;
+	}
+	mod = strrchr(path, '/');
+	if (mod)
+		mod++;
+	else
+		mod = path;
+
+	elf = elf_begin(fd, ELF_C_READ_MMAP, NULL);   // ELF_C_READ ?
+	assert(elf_kind(elf) == ELF_K_ELF);
+	elf_getshdrstrndx(elf, &shstrndx);
+
+	if (gelf_getehdr(elf, &ehdr)) {
+		switch (ehdr.e_type) {
+		case ET_EXEC:
+			/* binary does not require base addr adjustment */
+			base_addr = 0;
+			break;
+		case ET_DYN:
+			break;
+		default:
+			dt_dprintf("unexpected ELF hdr type 0x%x for '%s'\n",
+				   ehdr.e_type, path);
+			err = -1;
+			goto out;
+		}
+	}
+
+	while ((scn = elf_nextscn(elf, scn)) != NULL) {
+		char *secname;
+
+		assert(gelf_getshdr(scn, &shdr) != NULL);
+
+		secname = elf_strptr(elf, shstrndx, shdr.sh_name);
+		if (strcmp(secname, SEC_STAPSDT_NOTE) == 0 &&
+		    shdr.sh_type == SHT_NOTE)
+			break;
+	}
+	/* No ELF notes, just bail. */
+	if (scn == NULL)
+		goto out;
+	data = elf_getdata(scn, 0);
+	for (off = 0;
+	     (off = gelf_getnote(data, off, &nhdr, &noff, &doff)) > 0;) {
+		pid_probespec_t psp = {0};
+		char *prv, *prb;
+		const char *fun;
+		char *dbuf = (char *)data->d_buf;
+		long *addrs = data->d_buf + doff; /* 3 addrs are loc/base/semaphore */
+		GElf_Sym sym;
+		const prmap_t *pmp;
+
+		if (strncmp(dbuf + noff, NAME_STAPSDT_NOTE, nhdr.n_namesz) != 0)
+			continue;
+		prv = dbuf + doff + (3*sizeof(long));
+		/* ensure prv/prb is null-terminated */
+		if (strlen(prv) >= nhdr.n_descsz)
+			continue;
+		prb = prv + strlen(prv) + 1;
+		if (strlen(prb) >= nhdr.n_descsz)
+			continue;
+		if (strncmp(pdp->prv, prv, strlen(prv)) != 0)
+			continue;
+		/* skip unmatched, non-wildcarded probes */
+		if (strcmp(pdp->prb, "*") != 0 &&
+		    (strlen(pdp->prb) > 0 && strcmp(pdp->prb, prb) != 0))
+			continue;
+		if (prb + strlen(prb) + 1 < dbuf + doff + nhdr.n_descsz)
+			psp.pps_sargv = prb + strlen(prb) + 1;
+
+		psp.pps_type = DTPPT_STAPSDT;
+		psp.pps_prv = prv;
+		psp.pps_mod = mod;
+		psp.pps_prb = prb;
+		if (elf_getphdrnum(elf, &n))
+			continue;
+		for (i = 0; i < n; i++) {
+			GElf_Phdr phdr;
+
+			if (!gelf_getphdr(elf, i, &phdr))
+				break;
+
+			if (addrs[0] < phdr.p_vaddr ||
+			    addrs[0] > phdr.p_vaddr + phdr.p_memsz)
+				continue;
+			if (base_addr)
+				psp.pps_off = addrs[0];
+			else
+				psp.pps_off = addrs[0] - phdr.p_vaddr + phdr.p_offset;
+			break;
+		}
+		if (!psp.pps_off)
+			continue;
+		psp.pps_nameoff = 0;
+
+		pmp = Paddr_to_map(dpr->dpr_proc, base_addr + addrs[0]);
+		if (!pmp) {
+			dt_dprintf("%i: cannot determine 0x%lx's mapping\n",
+				   Pgetpid(dpr->dpr_proc), psp.pps_off);
+			continue;
+		}
+		psp.pps_fn = Pmap_mapfile_name(dpr->dpr_proc, pmp);
+		if (psp.pps_fn == NULL) {
+			dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
+				     "Cannot get name of mapping containing probe %s for pid %d\n",
+				     psp.pps_prb, dpr->dpr_pid);
+			err = -1;
+			break;
+		}
+		if (dt_Plookup_by_addr(dtp, dpr->dpr_pid, base_addr + addrs[0],
+				       &fun, &sym) == 0)
+			psp.pps_fun = (char *)fun;
+		else
+			psp.pps_fun = "";
+		psp.pps_dev = pmp->pr_dev;
+		psp.pps_inum = pmp->pr_inum;
+		psp.pps_pid = dpr->dpr_pid;
+		psp.pps_nameoff = 0;
+
+		if (pvp->impl->provide_probe(dtp, &psp) < 0) {
+			dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
+				     "failed to instantiate probe %s for pid %d: %s",
+				     psp.pps_prb, psp.pps_pid,
+			dtrace_errmsg(dtp, dtrace_errno(dtp)));
+			err = -1;
+		}
+		free(psp.pps_fn);
+		if (err == -1)
+			break;
+	}
+
+out:
+	elf_end(elf);
+	close(fd);
+	return err;
+}
+
+static void
+dt_pid_create_stapsdt_probes_proc(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
+				  dt_pcb_t *pcb, const dt_provider_t *pvp,
+				  dt_proc_t *dpr, const char *proc_map)
+{
+	char line[1024];
+	FILE *fp = NULL;
+	pid_t pid;
+
+	assert(dpr != NULL);
+
+	pid = dpr->dpr_pid;
+	fp = fopen(proc_map, "r");
+	if (!fp)
+		return;
+
+	while (fgets(line, sizeof(line) - 1, fp) != NULL) {
+		long addr_start, addr_end, file_offset;
+		long dev_major, dev_minor;
+		unsigned long inode;
+		char name[PATH_MAX + 1];
+		char path[PATH_MAX + 1];
+		char perm[5];
+		int ret;
+
+		ret = sscanf(line,
+			     "%lx-%lx %4s %lx %lx:%lx %lu %[^\n]",
+			     &addr_start, &addr_end, perm, &file_offset,
+			     &dev_major, &dev_minor, &inode, name);
+		if (ret != 8 || !strchr(perm, 'x') || strchr(name, '[') != NULL)
+			continue;
+
+		/* libstapsdt uses an memfd-based library to dynamically create
+		 * stapsdt notes for dynamic languages like python; we need
+		 * the associated /proc/<pid>/fds/ fd to read these notes.
+		 */
+		if (strncmp(name, "/memfd:", strlen("/memfd:")) == 0) {
+			DIR *d;
+			struct dirent *dirent;
+			char *deleted;
+
+			deleted = strstr(name, " (deleted)");
+			if (deleted)
+				*deleted = '\0';
+			snprintf(path, sizeof(path), "/proc/%d/fd", pid);
+			d = opendir(path);
+			if (d == NULL)
+				continue;
+			while ((dirent = readdir(d)) != NULL) {
+				struct stat s;
+
+				snprintf(path, sizeof(path), "/proc/%d/fd/%s",
+					 pid, dirent->d_name);
+				if (stat(path, &s) != 0 || s.st_ino != inode)
+					continue;
+				if (dt_stapsdt_parse(dtp, dpr, pdp, pcb, pvp,
+						     path, addr_start) != 0)
+					break;
+			}
+		} else {
+			if (dt_stapsdt_parse(dtp, dpr, pdp, pcb, pvp, name,
+					     addr_start) != 0)
+				break;
+		}
+	}
+	fclose(fp);
+}
+
+static int
+dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
+{
+	int i, nmatches = 0, err = 0;
+	const dt_provider_t *pvp;
+	char *globpat = NULL;
+	const char *pidstr;
+	glob_t globbuf;
+	bool wildcard;
+	pid_t pid;
+
+	assert(pcb != NULL);
+
+	pidstr = &pdp->prv[strlen(pdp->prv)];
+
+	while (isdigit(*(pidstr - 1)) || *(pidstr - 1) == '*')
+		pidstr--;
+	if (strlen(pidstr) == 0)
+		return 0;
+	wildcard = strchr(pidstr, '*');
+	asprintf(&globpat, "/proc/%s/maps", pidstr);
+	nmatches = glob(globpat, 0, NULL, &globbuf) ? 0 : globbuf.gl_pathc;
+	pvp = dt_provider_lookup(dtp, "stapsdt");
+	assert(pvp != NULL);
+
+	for (i = 0; i < nmatches; i++) {
+		dt_proc_t *dpr = NULL;
+
+		pidstr = globbuf.gl_pathv[i] + strlen("/proc/");
+		pid = atoll(pidstr);
+		if (pid <= 0)
+			continue;
+		if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING |
+				      DTRACE_PROC_SHORTLIVED) < 0) {
+			if (wildcard)
+				continue;
+			dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
+				     "failed to grab process %d",
+				     (int)pid);
+			err = 1;
+			break;
+		}
+		dpr = dt_proc_lookup(dtp, pid);
+		if (dpr) {
+			dt_pid_create_stapsdt_probes_proc(pdp, dtp, pcb,
+							  pvp, dpr,
+							  globbuf.gl_pathv[i]);
+			dt_proc_release_unlock(dtp, pid);
+		}
+	}
+	free(globpat);
+	globfree(&globbuf);
+
+	return err;
+}
+
 int
 dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
 {
@@ -1319,6 +1604,9 @@ dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *
 	free(globpat);
 	globfree(&globbuf);
 
+	if (err == 0)
+		err = dt_pid_create_stapsdt_probes(pdp, dtp, pcb);
+
 	/* If no errors, report success. */
 	if (err == 0)
 		return 0;
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 2cbd8910..b91cf810 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -313,12 +313,15 @@ static const dtrace_pattr_t	pattr = {
 
 dt_provimpl_t	dt_pid;
 dt_provimpl_t	dt_usdt;
+dt_provimpl_t	dt_stapsdt;
 
 static int populate(dtrace_hdl_t *dtp)
 {
 	if (dt_provider_create(dtp, dt_uprobe.name, &dt_uprobe, &pattr,
 			       NULL) == NULL ||
 	    dt_provider_create(dtp, dt_pid.name, &dt_pid, &pattr,
+			       NULL) == NULL ||
+	    dt_provider_create(dtp, dt_stapsdt.name, &dt_stapsdt, &pattr,
 			       NULL) == NULL)
 		return -1;			/* errno already set */
 
@@ -477,8 +480,8 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
 
 		prp_next = dt_list_next(prp);
 
-		/* Make sure it is an overlying USDT probe. */
-		if (prp->prov->impl != &dt_usdt)
+		/* Make sure it is an overlying USDT, stapsdt probe. */
+		if (prp->prov->impl != &dt_usdt && prp->prov->impl != &dt_stapsdt)
 			continue;
 
 		/* FIXME passing in NULL pcb and dpr wreaks havoc on error reporting? */
@@ -637,6 +640,7 @@ static int add_probe_uprobe(dtrace_hdl_t *dtp, dt_probe_t *prp)
 	return 0;
 }
 
+/* shared between usdt, stapsdt probes */
 static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
 {
 	char				probnam[DTRACE_FULLNAMELEN], *p;
@@ -890,6 +894,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	case DTPPT_OFFSETS:
 	case DTPPT_ABSOFFSETS:
 	case DTPPT_USDT:
+	case DTPPT_STAPSDT:
 		snprintf(prb, sizeof(prb), "%lx", psp->pps_off);
 		break;
 	default:
@@ -904,7 +909,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	pd.prb = prb;
 
 	dt_dprintf("Providing underlying probe %s:%s:%s:%s @ %lx\n", psp->pps_prv,
-		   psp->pps_mod, psp->pps_fn, psp->pps_prb, psp->pps_off);
+		   psp->pps_mod, psp->pps_fun, psp->pps_prb, psp->pps_off);
 	uprp = dt_probe_lookup(dtp, &pd);
 	if (uprp == NULL) {
 		dt_provider_t	*pvp;
@@ -1108,11 +1113,24 @@ static int provide_usdt_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp)
 	return provide_probe(dtp, psp, psp->pps_prb, &dt_usdt, PP_IS_FUNCALL);
 }
 
+static int provide_stapsdt_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp)
+{
+	if (psp->pps_type != DTPPT_STAPSDT &&
+	    psp->pps_type != DTPPT_IS_ENABLED) {
+		dt_dprintf("pid: unknown stapsdt probe type %i\n", psp->pps_type);
+		return -1;
+	}
+
+	return provide_probe(dtp, psp, psp->pps_prb, &dt_stapsdt, PP_IS_FUNCALL);
+}
+
+
 static void enable(dtrace_hdl_t *dtp, dt_probe_t *prp, int is_usdt)
 {
 	const list_probe_t	*pup;
 
-	assert(prp->prov->impl == &dt_pid || prp->prov->impl == &dt_usdt);
+	assert(prp->prov->impl == &dt_pid || prp->prov->impl == &dt_usdt ||
+	       prp->prov->impl == &dt_stapsdt);
 
 	/*
 	 * We need to enable the underlying probes (if not enabled yet).
@@ -1144,6 +1162,11 @@ static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
 	enable(dtp, prp, 1);
 }
 
+static void enable_stapsdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
+{
+	enable(dtp, prp, 1);
+}
+
 /*
  * Generate code that populates, counts the probe arguments.
  */
@@ -1875,3 +1898,15 @@ dt_provimpl_t	dt_usdt = {
 	.discover	= &discover,
 	.add_probe	= &add_probe_usdt,
 };
+
+/*
+ * Used for stapsdt probes.
+ */
+dt_provimpl_t	dt_stapsdt = {
+	.name		= "stapsdt",
+	.prog_type	= BPF_PROG_TYPE_UNSPEC,
+	.provide_probe	= &provide_stapsdt_probe,
+	.enable		= &enable_stapsdt,
+	.probe_destroy	= &probe_destroy,
+	.add_probe	= &add_probe_usdt,
+};
-- 
2.43.5

