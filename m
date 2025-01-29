Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA1D14F9FF
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738161851; cv=none; b=OutsbvEZcdzeFnS4z3selv1vid6L6aiqBCjOmLQKOD2l45HiBnwaLyqqnjGOBwx3AaAs+aX5hh7AuNS0euM5Fu5P62lKdK78ErimdBZsK9JPrzaXjfZwVpdUlzI09PVKUfdsYF35VG1Zs1gdNAf4moQD5ltNtx5EUXWBxB72Xl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738161851; c=relaxed/simple;
	bh=7n0ur632Rsrp85QRjgV3wZjgtr1pbdq1z6ybe6AA0x4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pjrAuUUmxbumh41AOSYwG7mHnZv1femBQqKp4pTbQlg8J+wlwmPWiUpDmpng4lmbV0Ytt0kxAW8DSfxLb3FYwjlcfAjL/l1uP+Nu22ac4TFDYo8NO3rmmbZe+JlreKOccQVa3k6B9KQ/pAkoRDUyP+gOHfMvykYb0qlVcaba9HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MSN1ZZsI; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MSN1ZZsI"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TEY0lC031380
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=Y+jXB
	5NcxjBZrXs6f6Ri9cihPD2QLY8zG0kkDG7vdAk=; b=MSN1ZZsIA1yn1mYveYS2X
	JNnu/DLOX/8Ehbf6LvjbC3Ja+h963yWEvqIaVbw3SgmBpEUZTKc7KrKX9B0EtDEe
	PpueM5yEekBg/pY4HvbUN5q95Bx/WMcDh6TE2Pcq4H5VLAeeJN9oIZ8quwRN2lgt
	Qq1S9oonFlp/mK41hpcrqdjerLt4go27xFF02ffX6Jh323PWUbnySviLrYtsDMEe
	fcMC/0QsfrwAMiR5umunuv3tZjQb8Pm8zCAxNJI9YqsJobwnpMMAQ7qiApZ7nHb/
	cdqsDem25H0mij5Zq0HDB1euuZAS3RWB3I2w7LzSr+ePWSDQFqMhuMEQv8mCDHjO
	w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44fp1a81f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:44:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50TE5N6c003410
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:44:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpd9w4tb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:44:07 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50TEi2WR027701
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:44:06 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-177-216.vpn.oracle.com [10.175.177.216])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 44cpd9w4qr-5;
	Wed, 29 Jan 2025 14:44:06 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH 4/4] selftests/usdt: add test covering different forms of USDT note args
Date: Wed, 29 Jan 2025 14:44:01 +0000
Message-ID: <20250129144401.505186-5-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250129144401.505186-1-alan.maguire@oracle.com>
References: <20250129144401.505186-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_02,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501290119
X-Proofpoint-GUID: 9TlWuYZhrby0QcgB6LtfCZO_4UcqEF-M
X-Proofpoint-ORIG-GUID: 9TlWuYZhrby0QcgB6LtfCZO_4UcqEF-M

Add a test exercising various arg types supported by USDT notes;
register values, register + offset and constants.  The test generates
a binary with probes represented as follows on x86_64:

Displaying notes found in: .note.stapsdt
  Owner                 Data size       Description
  stapsdt              0x00000048       NT_STAPSDT (SystemTap probe descriptors)
    Provider: test_prov
    Name: args
    Location: 0x0000000000400557, Base: 0x00000000004005f8, Semaphore: 0x0000000000000000
    Arguments: -4@-4(%rbp) 8@%rax 8@%rdx -4@$18

Verify we get expected data for the probe arguments.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_pid.c                        | 61 ++++++++++++++---------
 test/unittest/usdt/tst.usdt-notes-args.r  |  2 +
 test/unittest/usdt/tst.usdt-notes-args.sh | 51 +++++++++++++++++++
 3 files changed, 91 insertions(+), 23 deletions(-)
 create mode 100644 test/unittest/usdt/tst.usdt-notes-args.r
 create mode 100755 test/unittest/usdt/tst.usdt-notes-args.sh

diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 5608e380..cac52616 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -960,7 +960,7 @@ static int dt_usdt_note_parse_arg(char **argstr, struct dt_usdt_arg *a)
 
 static int dt_usdt_notes_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 			       dtrace_probedesc_t *pdp, dt_pcb_t *pcb,
-			       const dt_provider_t *pvp, const char *path,
+			       const dt_provider_t *pvp, char *path,
 			       unsigned long base_addr)
 {
 	Elf *elf;
@@ -969,8 +969,10 @@ static int dt_usdt_notes_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 	GElf_Nhdr nhdr;
 	size_t shstrndx, noff, doff, off, n;
 	Elf_Data *data;
+	GElf_Ehdr ehdr;
 	int i, ret = 0;
 	int fd = -1;
+	char *mod;
 
 	dt_dprintf("Scanning for USDT probes in ELF notes in '%s' (pid %i) matching %s:%s:%s\n",
 		   path, dpr->dpr_pid, pdp->mod, pdp->fun, pdp->prb);
@@ -982,17 +984,38 @@ static int dt_usdt_notes_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 			     path, strerror(errno));
 		return -1;
 	}
+	mod = strrchr(path, '/');
+	if (mod)
+		mod++;
+	else
+		mod = path;
 	elf = elf_begin(fd, ELF_C_READ_MMAP, NULL);   // ELF_C_READ ?
 	assert(elf_kind(elf) == ELF_K_ELF);
 	elf_getshdrstrndx(elf, &shstrndx);
 
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
+			ret = -1;
+			goto out;
+		}
+	}
+
 	while (1) {
 		char *secname;
 
 		scn = elf_nextscn(elf, scn);
 		if (scn == NULL) {
 			/* no ELF notes found, not an error */
-			return 0;
+			goto out;
 		}
 		assert(gelf_getshdr(scn, &shdr) != NULL);
 
@@ -1010,7 +1033,6 @@ static int dt_usdt_notes_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 		pid_probespec_t psp = {0};
 		char *prv, *prb;
 		const char *fun;
-		char mod[PATH_MAX];
 		char *dbuf = (char *)data->d_buf;
 		long *addrs = data->d_buf + doff; /* 3 addrs are loc/base/semaphore */
 		GElf_Sym sym;
@@ -1057,12 +1079,7 @@ static int dt_usdt_notes_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 			   prv, prb, path, addrs[0], addrs[1], nargs);
 		psp.pps_type = DTPPT_USDT;
 		psp.pps_prv = prv;
-		if (dt_Pobjname(dtp, dpr->dpr_pid, base_addr + addrs[0], mod,
-				sizeof(mod)) == NULL) {
-			dt_dprintf("cannot determine mod name for 0x%lx\n", addrs[0]);
-			mod[0] = '\0';
-		}
-		psp.pps_mod = basename(mod);
+		psp.pps_mod = mod;
 		psp.pps_prb = prb;
 		if (elf_getphdrnum(elf, &n))
 			continue;
@@ -1124,6 +1141,7 @@ static int dt_usdt_notes_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 			break;
 	}
 out:
+	elf_end(elf);
 	close(fd);
 	return ret;
 }
@@ -1557,9 +1575,10 @@ dt_pid_create_usdt_notes_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 	const dt_provider_t *pvp;
 	char path[PATH_MAX + 1];
 	dt_proc_t *dpr = NULL;
+	char line[1024];
 	FILE *fp = NULL;
 	pid_t pid = 0;
-	int err;
+	int err = 0;
 
 	/* only specific pids are support for ELF notes for now... */
 	while (isdigit(*(pidstr - 1)))
@@ -1580,13 +1599,8 @@ dt_pid_create_usdt_notes_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 	}
 	dpr = dt_proc_lookup(dtp, pid);
 	assert(dpr != NULL);
-	snprintf(path, sizeof(path), "/proc/%d/exe", dpr->dpr_pid);
-	err = dt_usdt_notes_parse(dtp, dpr, pdp, pcb, pvp, path, 0);
-	if (err)
-		goto out;
 
 	snprintf(path, sizeof(path), "/proc/%d/maps", pid);
-
 	fp = fopen(path, "r");
 	if (!fp) {
 		dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
@@ -1594,20 +1608,21 @@ dt_pid_create_usdt_notes_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 		err = 1;
 		goto out;
 	}
-	do {
+	while (fgets(line, sizeof(line) - 1, fp) != NULL) {
 		long addr_start, addr_end, file_offset;
 		long dev_major, dev_minor;
 		unsigned long inode;
 		char name[PATH_MAX + 1];
 		char perm[5];
+		int ret;
 
-
-		if (fscanf(fp,
-		       "%lx-%lx %4s %lx %lx:%lx %lu %[^\n]",
-		       &addr_start, &addr_end, perm, &file_offset,
-		       &dev_major, &dev_minor, &inode, name) != 8 ||
-		    !strchr(perm, 'x') || strchr(name, '[') != NULL)
+		ret = sscanf(line,
+			     "%lx-%lx %4s %lx %lx:%lx %lu %[^\n]",
+			     &addr_start, &addr_end, perm, &file_offset,
+			     &dev_major, &dev_minor, &inode, name);
+		if (ret != 8 || !strchr(perm, 'x') || strchr(name, '[') != NULL)
 			continue;
+
 		/* libstapsdt uses an memfd-based library to dynamically create
 		 * stapsdt notes for dynamic languages like python; we need
 		 * the associated /proc/<pid>/fds/ fd to read these notes.
@@ -1642,7 +1657,7 @@ dt_pid_create_usdt_notes_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 				goto out;
 			}
 		}
-	} while (!feof(fp));
+	}
 out:
 	if (fp)
 		fclose(fp);
diff --git a/test/unittest/usdt/tst.usdt-notes-args.r b/test/unittest/usdt/tst.usdt-notes-args.r
new file mode 100644
index 00000000..42bca19f
--- /dev/null
+++ b/test/unittest/usdt/tst.usdt-notes-args.r
@@ -0,0 +1,2 @@
+test:main:args:2:./test:val:18
+
diff --git a/test/unittest/usdt/tst.usdt-notes-args.sh b/test/unittest/usdt/tst.usdt-notes-args.sh
new file mode 100755
index 00000000..7c8ea37b
--- /dev/null
+++ b/test/unittest/usdt/tst.usdt-notes-args.sh
@@ -0,0 +1,51 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+# This test covers all USDT probes fired by the DTRACE_PROBEn macros.
+# Arguments values are checked only for first 10 arguments because
+# there is support for arg0 ... arg9 only at this moment.
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+CC=/usr/bin/gcc
+CFLAGS="-I${PWD}/test/unittest/usdt"
+
+DIRNAME="$tmpdir/usdt-notes.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+cat > test.c <<EOF
+#include <sdt_notes.h>
+
+int
+main(int argc, char **argv)
+{
+	DTRACE_PROBE4(test_prov, args, argc, argv[0], argv[1] + 4, 18);
+}
+EOF
+
+${CC} ${CFLAGS} -o test test.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test.c" >& 2
+	exit 1
+fi
+
+$dtrace -c './test arg1val' -qs /dev/stdin <<EOF
+test_prov\$target:::args
+{
+	printf("%s:%s:%s:%li:%s:%s:%li\n", probemod, probefunc, probename,
+	       arg0, copyinstr(arg1), copyinstr(arg2), arg3);
+}
+
+EOF
+status=$?
+
+exit $status
-- 
2.43.5

