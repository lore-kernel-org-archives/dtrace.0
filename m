Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EA035975
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755886601; cv=none; b=XcddQO3/uo0xSNYnasEQH7Ej5b1DWi3+GWZ9xlLUS5s7PeUQE5U6fp2W4AtuZikSCnxSfTIIZHDeNKSC+ExsrTsRV+skcLmfZdYT9TpQCCqFebT+xPIduWZB4xqzMtR42Opy+vVILciTUzydBwRsJChgJoCi+vRUMzuXEufp6s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755886601; c=relaxed/simple;
	bh=y2CKisTgfffiCGMwzV7Ab43ZgUWLgrwcvuceYkdlZag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZeltWbmR3309AxZfoYplqVMUH2S+IxQMf9j/CsqRoyzQXSDgAbwdFhjdilrxE967U/fXBSNKlEEmBzEKVraGexoZXLgq9Gj8yH1h0gPS2FHmkhANCVbpHZYm9lMZCBi0VKODJ7dfG4bitEbRpLKIHmrN9fVD6YjQLS9ueQGPzOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=I21kCmQM; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="I21kCmQM"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHtu3n030320
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=VCJ1Z
	X0J0ZD9hPIC3UqmZjj3JbgppwdgSxCZWaKMiy0=; b=I21kCmQMPivyCTEpDUXxy
	WAqUQpldmWPJ+Z+u885NZaexJBA6VqcLJdBat9vU2q9snedZT7XVwV9nWMFJljGf
	xOLEUp3IXZTPd6YDrR4ifptU3f/MdHK+m3qkBsxSPWHfPbHtpwaBxrOiJyDyWbnL
	nXp4SNFmPy99ewLjw1ZnKx3kr/80iLIewWd3BuncOZ+rxqLrI+BXy5TX+A6PH0C5
	XTHkKa//xPByUL+xtgrh+oK9VlkDt4ItILdrRLFp2WD1MPeccWrYAvO0m1gw2XQR
	tsq9or/8+DZteT9wA4vYb9P6Qjq144OpfLHAV3FhokQyBnUBKbTOc65EZA53L+tF
	w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48pw1dr2h0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57MGJmOo020776
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48nj6hndhc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:31 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57MIGU4C009458
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:31 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-56-42.vpn.oracle.com [10.154.56.42])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 48nj6hndg2-2;
	Fri, 22 Aug 2025 18:16:31 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH 1/5] udp: new provider
Date: Fri, 22 Aug 2025 19:16:25 +0100
Message-ID: <20250822181629.30972-2-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250822181629.30972-1-alan.maguire@oracle.com>
References: <20250822181629.30972-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508220167
X-Authority-Analysis: v=2.4 cv=OIAn3TaB c=1 sm=1 tr=0 ts=68a8b400 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=2OwXVqhp2XgA:10 a=yPCof4ZbAAAA:8 a=DsaXyGl2azo3Lt5B0Y0A:9 cc=ntf
 awl=host:12069
X-Proofpoint-ORIG-GUID: 0ah3VmvJtGjSjvmLUsxJ17VwtL1noBRF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDE2MCBTYWx0ZWRfXxgLa5s6i9+jY
 ivHyrGTOnVjdtkumiJOAU155Dr5isjl9XIuKPc1+MmVHjGvPrRtssKt7iIFPswFLSCNd2ImkfnW
 a55RKeH/ZM/z2aU8vj5Rw+y2zmbrtAzl6F6J3kctFGDMJ2QgBUon9Al/ha5rI4i7E/wNLZDiIyx
 maafGm66ENV0kG9l7cRW6jOdOQgy95kFS04jHOIafLYjUTDTKKApjsuX+/sKD6XJri00mm2ZLKk
 TrjX87mpfX1KS4DTsuPF0yBmmo8YF0WM+xfGs5pk+Z1wOZY98hdv1MIxWw4puaJGCcYFqMGVccd
 dOcBxCJ4saUzOya77cEqvSE6SkREuKyPHPS7KE1mxkQsnxvk1J45YTZcie+iiNyRQukpolpoXlr
 4eVWVCMAjEjW21LM7ZgjKbQpmxOVwA==
X-Proofpoint-GUID: 0ah3VmvJtGjSjvmLUsxJ17VwtL1noBRF

Based upon fbt probes support UDP send, receive.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/Build         |   2 +
 libdtrace/dt_prov_udp.c | 170 ++++++++++++++++++++++++++++++++++++++++
 libdtrace/dt_provider.c |   1 +
 libdtrace/dt_provider.h |   1 +
 libdtrace/udp.d         |  11 +--
 5 files changed, 180 insertions(+), 5 deletions(-)
 create mode 100644 libdtrace/dt_prov_udp.c

diff --git a/libdtrace/Build b/libdtrace/Build
index b0862ffa..5caf3462 100644
--- a/libdtrace/Build
+++ b/libdtrace/Build
@@ -59,6 +59,7 @@ libdtrace-build_SOURCES = dt_aggregate.c \
 			  dt_prov_sdt.c \
 			  dt_prov_syscall.c \
 			  dt_prov_tcp.c \
+			  dt_prov_udp.c \
 			  dt_prov_uprobe.c \
 			  dt_provider.c \
 			  dt_provider_sdt.c \
@@ -118,6 +119,7 @@ dt_prov_sched.c_CFLAGS := -Wno-pedantic
 dt_prov_sdt.c_CFLAGS := -Wno-pedantic
 dt_prov_syscall.c_CFLAGS := -Wno-pedantic
 dt_prov_tcp.c_CFLAGS := -Wno-pedantic
+dt_prov_udp.c_CFLAGS := -Wno-pedantic
 dt_prov_uprobe.c_CFLAGS := -Wno-pedantic
 dt_debug.c_CFLAGS := -Wno-prio-ctor-dtor
 
diff --git a/libdtrace/dt_prov_udp.c b/libdtrace/dt_prov_udp.c
new file mode 100644
index 00000000..fdbbf18d
--- /dev/null
+++ b/libdtrace/dt_prov_udp.c
@@ -0,0 +1,170 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ *
+ * The 'udp' SDT provider for DTrace-specific probes.
+ */
+#include <assert.h>
+#include <errno.h>
+#include <netinet/in.h>
+
+#include "dt_dctx.h"
+#include "dt_cg.h"
+#include "dt_provider_sdt.h"
+#include "dt_probe.h"
+
+static const char		prvname[] = "udp";
+static const char		modname[] = "vmlinux";
+
+enum {
+	NET_PROBE_OUTBOUND = 0,
+	NET_PROBE_INBOUND,
+};
+
+static probe_dep_t	probes[] = {
+	{ "receive",
+	  DTRACE_PROBESPEC_NAME,	"fbt::udp_queue_rcv_skb:entry" },
+	{ "receive",
+	  DTRACE_PROBESPEC_NAME,	"fbt::udpv6_queue_rcv_skb:entry" },
+	{ "send",
+	  DTRACE_PROBESPEC_NAME,	"fbt::ip_send_skb:entry" },
+	{ "send",
+	  DTRACE_PROBESPEC_NAME,	"fbt::ip6_send_skb:entry" },
+	{ NULL, }
+};
+
+static probe_arg_t probe_args[] = {
+
+	{ "receive", 0, { 0, 0, "struct sk_buff *", "pktinfo_t *" } },
+	{ "receive", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
+	{ "receive", 2, { 2, 0, "void_ip_t *", "ipinfo_t *" } },
+	{ "receive", 3, { 3, 0, "struct udp_sock *", "udpsinfo_t *" } },
+	{ "receive", 4, { 4, 0, "struct udphdr *", "udpinfo_t *" } },
+
+	{ "send", 0, { 0, 0, "struct sk_buff *", "pktinfo_t *" } },
+	{ "send", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
+	{ "send", 2, { 2, 0, "void_ip_t *", "ipinfo_t *" } },
+	{ "send", 3, { 3, 0, "struct udp_sock *", "udpsinfo_t *" } },
+	{ "send", 4, { 4, 0, "struct udphdr *", "udpinfo_t *" } },
+
+	{ NULL, }
+};
+
+static const dtrace_pattr_t	pattr = {
+{ DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
+{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
+{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
+{ DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
+{ DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
+};
+
+/*
+ * Provide all the "udp" SDT probes.
+ */
+static int populate(dtrace_hdl_t *dtp)
+{
+	return dt_sdt_populate(dtp, prvname, modname, &dt_udp, &pattr,
+			       probe_args, probes);
+}
+
+/*
+ * Generate a BPF trampoline for a SDT probe.
+ *
+ * The trampoline function is called when a SDT probe triggers, and it must
+ * satisfy the following prototype:
+ *
+ *	int dt_udp(void *data)
+ *
+ * The trampoline will populate a dt_dctx_t struct and then call the function
+ * that implements the compiled D clause.  It returns the value that it gets
+ * back from that function.
+ */
+static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
+{
+	dt_irlist_t	*dlp = &pcb->pcb_ir;
+	dt_probe_t	*prp = pcb->pcb_probe;
+	dt_probe_t	*uprp = pcb->pcb_parent_probe;
+	int		skbarg = 1;
+	int		direction;
+
+	/*
+	 * We construct the udp::: probe arguments as follows:
+	 *      arg0 = skb
+	 *      arg1 = sk
+	 *      arg2 = ip_hdr(skb) [if available]
+	 *      arg3 = sk [struct udp_sock *]
+	 *      arg4 = udp_hdr(skb)
+	 *      arg5 = NET_PROBE_INBOUND (0x1) | NET_PROBE_OUTBOUND (0x0)
+	 * arg5 never makes it into supported args[], it is simply set to
+	 * help inform translators about whether it is an inbound/outbound probe
+	 */
+
+	if (strcmp(prp->desc->prb, "receive") == 0) {
+		direction = NET_PROBE_INBOUND;
+		/* get sk from arg0, store in arg3 */
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(0)));
+		emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_6, 0, exitlbl));
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(3), BPF_REG_6));
+	} else {
+		if (strcmp(uprp->desc->fun, "ip6_send_skb") == 0)
+			skbarg = 0;
+		direction = NET_PROBE_OUTBOUND;
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(skbarg)));
+		/* get sk from skb->sk, store in arg3 */
+		dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6, "sk");
+		emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, exitlbl));
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(3), BPF_REG_0));
+	}
+
+	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(skbarg)));
+	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_6));
+
+	/* Now get sk from arg3, store it in arg1 and ensure it is UDP */
+	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(3)));
+	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
+	dt_cg_tramp_get_member(pcb, "struct sock", BPF_REG_6,
+			       "sk_protocol");
+	emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, IPPROTO_UDP, exitlbl));
+
+	/*
+	 * ip_hdr(skb) =
+	 *	skb_network_header(skb)	=	(include/linux/ip.h)
+	 *	skb->head + skb->network_header	(include/linux/skbuff.h)
+	 */
+	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(0)));
+	dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
+	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
+
+	dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6,
+			       "network_header");
+	emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
+
+	/*
+	 * udp_hdr(skb) =
+	 *	skb_transport_header(skb) =		(include/linux/ip.h)
+	 *	skb->head + skb->transport_header	(include/linux/skbuff.h)
+	 */
+	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(0)));
+	dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
+	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
+	dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6,
+			       "transport_header");
+	emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
+
+	emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(5), direction));
+
+	return 0;
+}
+
+dt_provimpl_t	dt_udp = {
+	.name		= prvname,
+	.prog_type	= BPF_PROG_TYPE_UNSPEC,
+	.populate	= &populate,
+	.enable		= &dt_sdt_enable,
+	.load_prog	= &dt_bpf_prog_load,
+	.trampoline	= &trampoline,
+	.probe_info	= &dt_sdt_probe_info,
+	.destroy	= &dt_sdt_destroy,
+};
diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
index b9a7196b..848fdc13 100644
--- a/libdtrace/dt_provider.c
+++ b/libdtrace/dt_provider.c
@@ -41,6 +41,7 @@ const dt_provimpl_t *dt_providers[] = {
 	&dt_sdt,
 	&dt_syscall,
 	&dt_tcp,
+	&dt_udp,
 	&dt_uprobe,
 	&dt_usdt,
 	NULL
diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
index 9d60e5ec..dc126671 100644
--- a/libdtrace/dt_provider.h
+++ b/libdtrace/dt_provider.h
@@ -89,6 +89,7 @@ extern dt_provimpl_t dt_sched;
 extern dt_provimpl_t dt_sdt;
 extern dt_provimpl_t dt_syscall;
 extern dt_provimpl_t dt_tcp;
+extern dt_provimpl_t dt_udp;
 extern dt_provimpl_t dt_uprobe;
 extern dt_provimpl_t dt_usdt;
 
diff --git a/libdtrace/udp.d b/libdtrace/udp.d
index 0e44ed64..e5a0fc9b 100644
--- a/libdtrace/udp.d
+++ b/libdtrace/udp.d
@@ -7,6 +7,7 @@
 
 #pragma D depends_on module vmlinux
 #pragma D depends_on library net.d
+#pragma D depends_on library ip.d
 #pragma D depends_on provider udp
 
 /*
@@ -48,24 +49,24 @@ translator udpsinfo_t < struct udp_sock *S > {
 	 */
 	udps_addr = (uintptr_t)S;
 	udps_lport = arg4 ?
-	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->source) :
+	    (arg5 == NET_PROBE_OUTBOUND ? ntohs(((struct udphdr *)arg4)->source) :
 	    ntohs(((struct udphdr *)arg4)->dest)) : 0;
 	udps_rport = arg4 ?
 	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->dest) :
 	    ntohs(((struct udphdr *)arg4)->source)) : 0;
 	udps_laddr = arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
-            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->saddr :
+            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->saddr :
 	    &((struct iphdr *)arg2)->daddr) :
 	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
-	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->saddr :
+	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->saddr :
 	    &((struct ipv6hdr *)arg2)->daddr) :
 	    "<unknown>";
 	udps_raddr =
 	    arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
-            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->daddr :
+            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->daddr :
 	    &((struct iphdr *)arg2)->saddr) :
 	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
-	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->daddr :
+	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->daddr :
 	    &((struct ipv6hdr *)arg2)->saddr) :
 	    "<unknown>";
 };
-- 
2.43.5

