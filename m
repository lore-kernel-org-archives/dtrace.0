Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F0A30566F
	for <dtrace@lists.linux.dev>; Fri,  5 Jun 2026 22:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697545; cv=none; b=VKGm1cj6ka7W3c2xEuiMyrvv2TkUvX9z/kKP0jcXVm76enM97MVL1TZfiW3CCoocdyOOIvi6uBiBMyNOsFk7yamo6T4XZYodE2Z4mmOxUX+0l+AjTEd3x2CNXphmgJi9Fl5B8I6AaK/mGzPZCdduSX4tfCcNW41dY+wKqZ+8Mw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697545; c=relaxed/simple;
	bh=QM9KIt1OeFzGYbP4NbAsO34ZfwpZmUWjHjjH8dXSdf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GVOyCptWOF9UVkWWWGYNgOO34mwdI75TXhC7InYxP12N6JAPDaIYkPCUbk26NHl1YXFlmDpvyCAyEs4BMBJmEd6KnJHIkdwFd73Avp6FvHJgoPFObDAFzgqmrUKwXv8W/dW5Jq5vsLkxv+J4iaCZkO3fPWdPkhUTL5ADQ/i/fqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=sbf9tYay; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sbf9tYay"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 655IXScr2381019
	for <dtrace@lists.linux.dev>; Fri, 5 Jun 2026 22:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=62kGZ
	y2AegPIWx9lP+H3F/FlYMltIbnvMPchF/GbSMk=; b=sbf9tYayB47P/hjLvdqq0
	H7oP6vHRXbsWEdQLtmtMiVCAxO8miKIvwlxCMG2QxOfmv1OEemEO5B7x3iYPQgi9
	MOCTqOyDSK/LPXBK0BUqYDLIbV3e8PmFQjeV3/LEcNQc7c5Klu/YxEcDX7zuDRgz
	pkc0rUgZBSGajpfQS0Jp8u5Q7isOXCpYwnuMIxo+HzzfmOW0Jdzto8lIeXz/RBNX
	Yz5q4eP74sGTImmijxuQh+YJyV1WYVElg0BYQ2htBJBoS8wM1bOEMamhd390Xh2t
	QWLLtAfyD3PBSmHhVv5LRJdbqm7QYntShNhRaZGxpNN4T5elrmzS/moAUzqOF2gZ
	Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4efptbty4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 05 Jun 2026 22:12:23 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 655MARIb033230
	for <dtrace@lists.linux.dev>; Fri, 5 Jun 2026 22:12:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ek326nvwr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 05 Jun 2026 22:12:22 +0000 (GMT)
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 655MCIuq039322
	for <dtrace@lists.linux.dev>; Fri, 5 Jun 2026 22:12:22 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-53-60.vpn.oracle.com [10.154.53.60])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4ek326nvu6-4;
	Fri, 05 Jun 2026 22:12:21 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH 3/6] dtrace: add 'probeoff' variable to record relative offset of probes
Date: Fri,  5 Jun 2026 23:12:14 +0100
Message-ID: <20260605221217.1211791-4-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260605221217.1211791-1-alan.maguire@oracle.com>
References: <20260605221217.1211791-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2605130000 definitions=main-2606050219
X-Authority-Analysis: v=2.4 cv=I6dVgtgg c=1 sm=1 tr=0 ts=6a2349c7 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8 a=kbG2aKVCqpdHdf6kI4MA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12313
X-Proofpoint-GUID: Xudz_53YxpJORSO-Fsu0vRltKaE00Er6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDIxOSBTYWx0ZWRfX1GPpbWKipkSk
 G0MCMHCRh9R7Il+suf03mBlwDfAkKdbpN/EiNxwxu4VFoVUu2vZA1a/1k+xWFyY+wlbAoA7gAdF
 HC/U5etiGF0zXC8lm3Gfh9yOhldyuHXIJo09uhis0ZWs0bt/rIRxhr95UctvIhldvD9eLdu87yd
 ZrIOau4cdVDxA6j8EPkD/Hd0JhcVJYleUsqlzR4YxGE4lTE4gdFUTTxrTHKN/4peFS83bLXIoJI
 5GfgOmzFpwKe8C5sn/f3QfmpT+k5H8CdazEY9Cui2IR1jx0wbFUFezlNexNb6ZacFQpX4ZNqHkF
 FOO3msW8HEKSH+8Fup1pQhfyLTlptvqdFKKLFDhqY7uVW3T+K4NaelZ2HGrx9tMtN4JJcUWOOOY
 3eJ3LIeBePfLbExt1ERVKuN71QE5nUHOf3CnyAkKk4x7yEDeaH8ZN2qm31Yc1vJ5kSzIAoV3bTF
 BXZXda1PVUdbLO64rudganJL//RIeEJ3yEbicckM=
X-Proofpoint-ORIG-GUID: Xudz_53YxpJORSO-Fsu0vRltKaE00Er6

Record probe offset in machine state and make it accesible
via 'probeoff' variable.  Having this is valuable as it will
allow dynamic computation of runtime variable offsets by giving
us the base address of a library.  For example, we can determine
the base address of the python libpython3 library via:

python$target:::function-entry
{
	base_addr = uregs[R_PC] - probeoff;
...

This will handle ASLR and will work for specific targets and
system-wide probes.

Since uregs[R_PC] will give us the runtime address of the python
probe, subtracting probeoff will give us the relative address used
at attach time.  For example if 0x7ff925cd7f0d is the uregs
program counter value and 0xd7f0d is the probeoff value, we now
know the library base address is 0x7ff925c00000.

Once we have this, dynamic resolution of variables becomes easy
because we just need the symbol table offset for the variable
and we can add the library base address computed as above.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 bpf/get_bvar.c               | 7 +++++++
 include/dtrace/dif_defines.h | 1 +
 libdtrace/dt_cg.c            | 5 +++++
 libdtrace/dt_dctx.h          | 2 ++
 libdtrace/dt_open.c          | 2 ++
 libdtrace/dt_prov_uprobe.c   | 8 ++++++++
 6 files changed, 25 insertions(+)

diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
index 99a6503d..2b53b7d1 100644
--- a/bpf/get_bvar.c
+++ b/bpf/get_bvar.c
@@ -203,6 +203,13 @@ noinline uint64_t dt_bvar_probedesc(const dt_dctx_t *dctx, uint32_t idx)
 	}
 }
 
+noinline uint64_t dt_bvar_probeoff(const dt_dctx_t *dctx)
+{
+	dt_mstate_t	*mst = dctx->mst;
+
+	return mst->proff;
+}
+
 noinline uint64_t dt_bvar_stackdepth(const dt_dctx_t *dctx)
 {
 	uint32_t	bufsiz = (uint32_t) (uint64_t) (&STKSIZ);
diff --git a/include/dtrace/dif_defines.h b/include/dtrace/dif_defines.h
index a18614d2..edb98f06 100644
--- a/include/dtrace/dif_defines.h
+++ b/include/dtrace/dif_defines.h
@@ -163,6 +163,7 @@
 #define DIF_VAR_ERRNO		0x0120
 #define DIF_VAR_CURCPU		0x0121
 #define DIF_VAR_EXECARGS	0x0122
+#define DIF_VAR_PROBEOFF	0x0123
 
 #define DIF_SUBR_RAND			0
 #define DIF_SUBR_MUTEX_OWNED		1
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index e97e9abc..1bd73e11 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -288,6 +288,11 @@ dt_cg_tramp_prologue_act(dt_pcb_t *pcb, dt_activity_t act)
 	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_0, roundup(sizeof(dt_mstate_t), 8)));
 	emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_9, DCTX_BUF, BPF_REG_0));
 
+	/*
+	 *	dctx.mst->proff = 0;
+	 */
+	emit(dlp,  BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_PROFF, 0));
+
 	/*
 	 *	mem = buf + roundup(dtp->dt_maxreclen, 8);
 	 *				// add %r0, roundup(dtp->dt_maxreclen,
diff --git a/libdtrace/dt_dctx.h b/libdtrace/dt_dctx.h
index 5bf21345..797c8fd2 100644
--- a/libdtrace/dt_dctx.h
+++ b/libdtrace/dt_dctx.h
@@ -30,6 +30,7 @@ typedef struct dt_mstate {
 	uint32_t	tag;		/* Tag (for future use) */
 	uint32_t	scratch_top;	/* Current top of scratch space */
 	int32_t		syscall_errno;	/* syscall errno */
+	uint64_t	proff;		/* Probe offset */
 	uint64_t	specsize;	/* speculation size */
 	uint64_t	scalarizer;	/* used to scalarize pointers */
 	uint64_t	fault;		/* DTrace fault flags */
@@ -44,6 +45,7 @@ typedef struct dt_mstate {
 #define DMST_STID		offsetof(dt_mstate_t, stid)
 #define DMST_TAG		offsetof(dt_mstate_t, tag)
 #define DMST_SCRATCH_TOP	offsetof(dt_mstate_t, scratch_top)
+#define DMST_PROFF		offsetof(dt_mstate_t, proff)
 #define DMST_ERRNO		offsetof(dt_mstate_t, syscall_errno)
 #define DMST_SPECSIZE		offsetof(dt_mstate_t, specsize)
 #define DMST_SCALARIZER		offsetof(dt_mstate_t, scalarizer)
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 30b8758d..ca00788a 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -240,6 +240,8 @@ static const dt_ident_t _dtrace_globals[] = {
 	DT_ATTR_STABCMN, DT_VERS_1_0, &dt_idops_type, "string" },
 { "probeprov", DT_IDENT_SCALAR, 0, DIF_VAR_PROBEPROV,
 	DT_ATTR_STABCMN, DT_VERS_1_0, &dt_idops_type, "string" },
+{ "probeoff", DT_IDENT_SCALAR, 0, DIF_VAR_PROBEOFF,
+	DT_ATTR_STABCMN, DT_VERS_2_0, &dt_idops_type, "uint64_t" },
 { "progenyof", DT_IDENT_FUNC, 0, DIF_SUBR_PROGENYOF,
 	DT_ATTR_STABCMN, DT_VERS_1_0,
 	&dt_idops_func, "int(pid_t)" },
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index b1b852ce..d53b1e43 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -1392,6 +1392,14 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	 */
 	dt_cg_tramp_copy_regs(pcb);
 
+	/*
+	 * Record the uprobe instrumentation offset in the probe context.
+	 * This is the same object-relative offset passed to perf_event_open()
+	 * as attr.probe_offset.
+	 */
+	dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, BPF_REG_0, upp->off);
+	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_PROFF, BPF_REG_0));
+
 	/*
 	 * pid probes.
 	 *
-- 
2.43.5

