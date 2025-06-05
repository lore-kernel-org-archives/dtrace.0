Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F7E1FC7D2
	for <dtrace@lists.linux.dev>; Thu,  5 Jun 2025 21:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749159229; cv=none; b=XB0+rM8AgQblEEMbKmzvnOFlU3x5i0pTXrFt1zrPcKvCXuPLX4qmj/W9FNnkMl4QzMD8kLr7+Of2NXadVS8K232W36AGTxHIf4rUS8bn8qq0tAlnh/tPl8rZ4IBzL8MEpYBixVqT46BGSRubop/O7hvahyQx535jH+4kuJdztJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749159229; c=relaxed/simple;
	bh=f6otknpfK4StOwaM74lJuBg2bpD0GTBFlIehwwd/E4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AnjwkXyu4mQd1CkEk/Iirl9kpi1PxJS/XjAfvh5wIzzJTUuIBSe1I/K2y7wJPDTg1YCov9T/1nV/Szsh+vZS2PVQsoeuPy4f8ax3Qsh9k4B6ooxx7u3uzCLIt4HKsOK1Yy1MyUR25S8+99X8hDJZhLcnWS7vbLtOsqymtM7ZH0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cqNtyGjg; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cqNtyGjg"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555KvrGZ031161
	for <dtrace@lists.linux.dev>; Thu, 5 Jun 2025 21:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=W8nBA
	WxRRmxZMHR8VrM8eDBv2tNmaVjewGxFw3Abn+w=; b=cqNtyGjghSknJvkaAdMdN
	8eh1h+e4NY27V01mQmC8q1m16Lomwt22CLvuQQ6l28Zl7BqmERmCNRlCtJtX8EE3
	1yI9QK4sa8MY5VHbPPNB/HzUeDwP3CdFYUI1t2wl4KMm7iNA4bl6lWFj8YcoPFVJ
	JkrWibwhe0fzuBiSSuSzL6agsXmZABKyoh2BQf4msOgpD/WPzB50fhDuD8Iww4B2
	Zv1HuIZJoxFLtuvaPTWpxpupxTpKvhc8C4z7SCtWXfpOQDZrS5vfs4Y67JYJ9elK
	cI66Zl5CMDXRHGGtsk6FqAP8qWR2SIlZYMxbTl5wn+VbF6ZNdvpYHR3zgQqf2bUk
	w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8bpy2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Jun 2025 21:33:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 555Jll3U030614
	for <dtrace@lists.linux.dev>; Thu, 5 Jun 2025 21:33:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7ckmrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Jun 2025 21:33:44 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 555LXHv2037398
	for <dtrace@lists.linux.dev>; Thu, 5 Jun 2025 21:33:44 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-51-236.vpn.oracle.com [10.154.51.236])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 46yr7ckmq6-2;
	Thu, 05 Jun 2025 21:33:43 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [RFC 1/2] dtrace: add tcp provider
Date: Thu,  5 Jun 2025 22:33:40 +0100
Message-ID: <20250605213341.1410405-2-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250605213341.1410405-1-alan.maguire@oracle.com>
References: <20250605213341.1410405-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506050194
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE5MyBTYWx0ZWRfXw50ImM+DdeBn fTic+d8esPigNE9Ay1JIngd9vK8dAy5g7yWzKQGJV0tcBwC85ThcIgbj8xRuta7h2Ln65qnWEPm bnfEtL7V+Oxj0FVv6KodUvUwx3nREtwVeuVbg9/yL+A+nPf//Nd2S+ggPFdVdEAfo/ArbD7Glt1
 t/vIOP83dTUvW5MgZ590QJ0FY+svWMs71nsH6vHYl1AfSFi9EYPpilbHZKi9VbKhndyOsLfX2pN OPFsmosmz6zwrFdQsro95SOaURT0VufU7cyBP0atBCjLI8g8h8ZLYWTxfxT3hxvxk3PcNXZdr93 CBS2q7k3t+FKDd42/HvbXU49Xr6xts9TLTOWTEh/TJFqCIYzXw2fdNM9fuwXPP005iOjJaTnqA0
 O/H6qryHnZQBpLnPAoxQgj77rKPf2nbFY94EeMNv78kJ5IsuLqoJr3dfIGdkKMrIzcBgVgZT
X-Proofpoint-GUID: bvYVVZUUtelQF3EX-3TyW3VAyv5aA452
X-Proofpoint-ORIG-GUID: bvYVVZUUtelQF3EX-3TyW3VAyv5aA452
X-Authority-Analysis: v=2.4 cv=H+Dbw/Yi c=1 sm=1 tr=0 ts=68420d39 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=2-Bk3GgmSuHOFZOBpO8A:9 cc=ntf awl=host:14714

Based upon various fbt probe points support TCP send, receive,
state-change, accept-established, accept-refused, connect-request,
connect-established and connect-refused probes.

A few tweaks were needed to tcp.d to support the probes fully.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/Build         |   2 +
 libdtrace/dt_impl.h     |   2 +-
 libdtrace/dt_prov_tcp.c | 397 ++++++++++++++++++++++++++++++++++++++++
 libdtrace/dt_provider.c |   1 +
 libdtrace/dt_provider.h |   1 +
 libdtrace/ip.d          |   1 -
 libdtrace/net.d         |   6 +-
 libdtrace/tcp.d         |  43 +++--
 8 files changed, 430 insertions(+), 23 deletions(-)
 create mode 100644 libdtrace/dt_prov_tcp.c

diff --git a/libdtrace/Build b/libdtrace/Build
index 7e6e8a38..a5439354 100644
--- a/libdtrace/Build
+++ b/libdtrace/Build
@@ -59,6 +59,7 @@ libdtrace-build_SOURCES = dt_aggregate.c \
 			  dt_prov_sched.c \
 			  dt_prov_sdt.c \
 			  dt_prov_syscall.c \
+			  dt_prov_tcp.c \
 			  dt_prov_uprobe.c \
 			  dt_provider.c \
 			  dt_provider_sdt.c \
@@ -117,6 +118,7 @@ dt_prov_rawtp.c_CFLAGS := -Wno-pedantic
 dt_prov_sched.c_CFLAGS := -Wno-pedantic
 dt_prov_sdt.c_CFLAGS := -Wno-pedantic
 dt_prov_syscall.c_CFLAGS := -Wno-pedantic
+dt_prov_tcp.c_CFLAGS := -Wno-pedantic
 dt_prov_uprobe.c_CFLAGS := -Wno-pedantic
 dt_debug.c_CFLAGS := -Wno-prio-ctor-dtor
 
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 68fb8ec5..10424f9c 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -218,7 +218,7 @@ typedef struct dt_kern_path {
  * - cleanpath() holds a prepended '/' char, a string, an appended '/' char,
  *   and a terminating NUL char, or STRSZ + 3 chars altogether
  */
-#define DT_TSTRING_SLOTS	4
+#define DT_TSTRING_SLOTS	8
 #define DT_TSTRING_SIZE(dtp)	\
 		MAX(P2ROUNDUP((dtp)->dt_options[DTRACEOPT_STRSIZE] + 3, 8), \
 		    72)
diff --git a/libdtrace/dt_prov_tcp.c b/libdtrace/dt_prov_tcp.c
new file mode 100644
index 00000000..cdc9ca45
--- /dev/null
+++ b/libdtrace/dt_prov_tcp.c
@@ -0,0 +1,397 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ *
+ * The 'tcp' SDT provider for DTrace-specific probes.
+ */
+#include <assert.h>
+#include <errno.h>
+
+#include "dt_dctx.h"
+#include "dt_cg.h"
+#include "dt_provider_sdt.h"
+#include "dt_probe.h"
+
+static const char		prvname[] = "tcp";
+static const char		modname[] = "vmlinux";
+
+enum {
+	NET_PROBE_OUTBOUND = 0,
+	NET_PROBE_INBOUND,
+	NET_PROBE_STATE
+};
+
+static probe_dep_t	probes[] = {
+	/* does not fire on UEK7 unless rawfbt; no idea why... */
+	{ "accept-established",
+	  DTRACE_PROBESPEC_NAME,	"rawfbt::tcp_init_transfer:entry" },
+	{ "accept-refused",
+	  DTRACE_PROBESPEC_NAME,	"fbt::tcp_v4_send_reset:entry" },
+	{ "accept-refused",
+	  DTRACE_PROBESPEC_NAME,	"fbt::tcp_v6_send_reset:entry" },
+	{ "connect-established",
+	  DTRACE_PROBESPEC_NAME,	"fbt::tcp_finish_connect:entry" },
+	{ "connect-refused",
+	  DTRACE_PROBESPEC_NAME,	"fbt::tcp_reset:entry" },
+	{ "connect-request",
+	  DTRACE_PROBESPEC_NAME,	"fbt::ip_queue_xmit:entry" },
+	/* ip6_xmit has > 6 args so cannot fentry on aarch64; use rawfbt */
+	{ "connect-request",
+	  DTRACE_PROBESPEC_NAME,	"rawfbt::ip6_xmit:entry" },
+	{ "receive",
+	  DTRACE_PROBESPEC_NAME,	"fbt::tcp_rcv_established:entry" },
+	{ "receive",
+	  DTRACE_PROBESPEC_NAME,	"fbt::tcp_rcv_state_process:entry" },
+	{ "receive",
+	  DTRACE_PROBESPEC_NAME,	"fbt::tcp_v4_send_reset:entry" },
+	{ "send",
+	  DTRACE_PROBESPEC_NAME,	"fbt::ip_queue_xmit:entry" },
+	/* ip_send_unicast_reply has 10 args so cannot fentry; use rawfbt */
+	{ "send",
+	  DTRACE_PROBESPEC_NAME,	"rawfbt::ip_send_unicast_reply:entry" },
+	{ "send",
+	  DTRACE_PROBESPEC_NAME,	"fbt::ip_build_and_send_pkt" },
+	/* ip6_xmit has > 6 args so cannot fentry on aarch64; use rawfbt */
+	{ "send",
+	  DTRACE_PROBESPEC_NAME,	"rawfbt::ip6_xmit:entry" },
+	{ "state-change",
+	  DTRACE_PROBESPEC_NAME,	"sdt:::inet_sock_set_state" },
+	{ "state-change",
+	  DTRACE_PROBESPEC_NAME,	"fbt::tcp_time_wait:entry" },
+	{ NULL, }
+};
+
+static probe_arg_t probe_args[] = {
+	{ "accept-established", 0, { 0, 0, "struct sk_buff *", "pktinfo_t *" } },
+	{ "accept-established", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
+	{ "accept-established", 2, { 2, 0, "void_ip_t *", "ipinfo_t *" } },
+	{ "accept-established", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t *" } },
+	{ "accept-established", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t *" } },
+	{ "accept-established", 5, { 5, 0, "unsigned char", "int"} },
+	{ "accept-established", 6, { 6, 0, "unsigned char", "tcplsinfo_t *" } },
+	{ "accept-established", 7, { 7, 0, "int", "int" } },
+
+	{ "accept-refused", 0, { 0, 0, "struct sk_buff *", "pktinfo_t *" } },
+	{ "accept-refused", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
+	{ "accept-refused", 2, { 2, 0, "void_ip_t *", "ipinfo_t *" } },
+	{ "accept-refused", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t *" } },
+	{ "accept-refused", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t *" } },
+	{ "accept-refused", 5, { 5, 0, "unsigned char", "int"} },
+	{ "accept-refused", 6, { 6, 0, "unsigned char", "tcplsinfo_t *" } },
+	{ "accept-refused", 7, { 7, 0, "int", "int" } },
+
+	{ "connect-established", 0, { 0, 0, "struct sk_buff *", "pktinfo_t *" } },
+	{ "connect-established", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
+	{ "connect-established", 2, { 2, 0, "void_ip_t *", "ipinfo_t *" } },
+	{ "connect-established", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t *" } },
+	{ "connect-established", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t *" } },
+	{ "connect-established", 5, { 5, 0, "unsigned char", "int"} },
+	{ "connect-established", 6, { 6, 0, "unsigned char", "tcplsinfo_t *" } },
+	{ "connect-established", 7, { 7, 0, "int", "int" } },
+
+	{ "connect-refused", 0, { 0, 0, "struct sk_buff *", "pktinfo_t *" } },
+	{ "connect-refused", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
+	{ "connect-refused", 2, { 2, 0, "void_ip_t *", "ipinfo_t *" } },
+	{ "connect-refused", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t *" } },
+	{ "connect-refused", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t *" } },
+	{ "connect-refused", 5, { 5, 0, "unsigned char", "int"} },
+	{ "connect-refused", 6, { 6, 0, "unsigned char", "tcplsinfo_t *" } },
+	{ "connect-refused", 7, { 7, 0, "int", "int" } },
+
+	{ "connect-request", 0, { 0, 0, "struct sk_buff *", "pktinfo_t *" } },
+	{ "connect-request", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
+	{ "connect-request", 2, { 2, 0, "__dtrace_tcp_void_ip_t *", "ipinfo_t *" } },
+	{ "connect-request", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t *" } },
+	{ "connect-request", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t *" } },
+	{ "connect-request", 5, { 5, 0, "unsigned char", "int"} },
+	{ "connect-request", 6, { 6, 0, "unsigned char", "tcplsinfo_t *" } },
+	{ "connect-request", 7, { 7, 0, "int", "int" } },
+
+	{ "receive", 0, { 0, 0, "struct sk_buff *", "pktinfo_t *" } },
+	{ "receive", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
+	{ "receive", 2, { 2, 0, "void_ip_t *", "ipinfo_t *" } },
+	{ "receive", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t *" } },
+	{ "receive", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t *" } },
+	{ "receive", 5, { 5, 0, "unsigned char", "int"} },
+	{ "receive", 6, { 6, 0, "unsigned char", "tcplsinfo_t *" } },
+	{ "receive", 7, { 7, 0, "int", "int" } },
+
+	{ "send", 0, { 0, 0, "struct sk_buff *", "pktinfo_t *" } },
+	{ "send", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
+	{ "send", 2, { 2, 0, "__dtrace_tcp_void_ip_t *", "ipinfo_t *" } },
+	{ "send", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t *" } },
+	{ "send", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t *" } },
+	{ "send", 5, { 5, 0, "unsigned char", "int"} },
+	{ "send", 6, { 6, 0, "unsigned char", "tcplsinfo_t *" } },
+	{ "send", 7, { 7, 0, "int", "int" } },
+
+	{ "state-change", 0, { 0, 0, "void *", "void *", } },
+	{ "state-change", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
+	{ "state-change", 2, { 2, 0, "void *", "void *" } },
+	{ "state-change", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t *" } },
+	{ "state-change", 4, { 4, 0, "void *", "void *" } },
+	{ "state-change", 5, { 5, 0, "void *", "void *" } },
+	{ "state-change", 6, { 6, 0, "struct sock *", "tcplsinfo_t *" } },
+	{ "state-change", 7, { 7, 0, "int", "int" } },
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
+ * Provide all the "tcp" SDT probes.
+ */
+static int populate(dtrace_hdl_t *dtp)
+{
+	return dt_sdt_populate(dtp, prvname, modname, &dt_tcp, &pattr,
+			       probe_args, probes);
+}
+
+/*
+ * Retrieve the value of a member in a given struct.
+ *
+ * Entry:
+ *	reg = TYPE *ptr
+ *
+ * Return:
+ *	%r0 = ptr->member
+ * Clobbers:
+ *	%r1 .. %r5
+ */
+static int get_member(dt_pcb_t *pcb, const char *name, int reg,
+		      const char *member) {
+	dtrace_hdl_t		*dtp = pcb->pcb_hdl;
+	dt_irlist_t		*dlp = &pcb->pcb_ir;
+	dtrace_typeinfo_t	tt;
+	ctf_membinfo_t		ctm;
+	size_t			size;
+	uint_t			ldop;
+
+	if (dtrace_lookup_by_type(dtp, DTRACE_OBJ_KMODS, name, &tt) == -1 ||
+	    ctf_member_info(tt.dtt_ctfp, tt.dtt_type, member, &ctm) == CTF_ERR)
+		return -1;
+
+	ldop = dt_cg_ldsize(NULL, tt.dtt_ctfp, ctm.ctm_type, &size);
+
+	emit(dlp, BPF_MOV_REG(BPF_REG_3, reg));
+	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, ctm.ctm_offset / NBBY));
+	emit(dlp, BPF_MOV_IMM(BPF_REG_2, size));
+	emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
+	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_BASE));
+	emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel]));
+	emit(dlp, BPF_LOAD(ldop, BPF_REG_0, BPF_REG_FP, DT_TRAMP_SP_BASE));
+
+	return 0;
+}
+
+/*
+ * Generate a BPF trampoline for a SDT probe.
+ *
+ * The trampoline function is called when a SDT probe triggers, and it must
+ * satisfy the following prototype:
+ *
+ *	int dt_tcp(void *data)
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
+	int		direction, have_iphdr;
+	int		skarg = 0, skbarg = 1, tcparg = 0;
+	int		skarg_maybe_null;
+	int		skstate = 0;
+
+	if (strcmp(prp->desc->prb, "state-change") == 0) {
+		int newstatearg;
+
+		if (strcmp(uprp->desc->fun, "tcp_time_wait") == 0)
+			newstatearg = 1;
+		else
+			newstatearg = 2;
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(0)));
+		emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_6, 0, exitlbl));
+		/* check it is a TCP socket */
+		get_member(pcb, "struct sock", BPF_REG_6, "sk_protocol");
+		emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, 6, exitlbl));
+
+		/* save sk */
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(0)));
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(3), BPF_REG_6));
+
+		/* save new state */
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(newstatearg)));
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(6), BPF_REG_6));
+
+		/* save sk */
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(3)));
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_6));
+
+		/* save empty args */
+		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(0), 0));
+		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(2), 0));
+		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(4), 0));
+		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(5), 0));
+
+		/* NET_PROBE_STATE */
+		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(7),
+					NET_PROBE_STATE));
+		return 0;
+	}
+
+	if (strcmp(prp->desc->prb, "accept-established") == 0) {
+		direction = NET_PROBE_OUTBOUND;
+		have_iphdr = 1;
+		/* skb in arg2 not arg1 */
+		skbarg = 2;
+		skarg_maybe_null = 0;
+		/* ensure arg1 is BPF_SOCK_OPS_PASSIVE_ESTABLISHED_CB */
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(1)));
+		emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_6,
+					 BPF_SOCK_OPS_PASSIVE_ESTABLISHED_CB,
+					 exitlbl));
+	} else if (strcmp(prp->desc->prb, "receive") == 0 ||
+		   strcmp(prp->desc->prb, "accept-refused") == 0) {
+		direction = NET_PROBE_INBOUND;
+		have_iphdr = 1;
+		if (strcmp(uprp->desc->fun, "tcp_v4_send_reset") == 0 ||
+		    strcmp(uprp->desc->fun, "tcp_v6_send_reset") == 0)
+			skarg_maybe_null = 1;
+		else
+			skarg_maybe_null = 0;
+	} else if (strcmp(prp->desc->prb, "connect-established") == 0) {
+		direction = NET_PROBE_INBOUND;
+		have_iphdr = 1;
+		skarg_maybe_null = 0;
+	} else if (strcmp(prp->desc->prb, "connect-refused") == 0) {
+		direction = NET_PROBE_INBOUND;
+		have_iphdr = 1;
+		skarg_maybe_null = 0;
+		skstate = BPF_TCP_SYN_SENT;
+	} else {
+		direction = NET_PROBE_OUTBOUND;
+		if (strcmp(uprp->desc->fun, "ip_send_unicast_reply") == 0) {
+			/* NULL sk in arg1 not arg2 (we dont want ctl_sk) */
+			skarg = 1;
+			/* skb in arg2 not arg1 */
+			skbarg = 2;
+			have_iphdr = 1;
+			/* tcp hdr in ip_reply_arg * */
+			tcparg = 6;
+			skarg_maybe_null = 1;
+		} else if (strcmp(uprp->desc->fun, "ip_build_and_send_pkt") == 0) {
+			skarg = 1;
+			skbarg = 0;
+			have_iphdr = 0;
+			skarg_maybe_null = 1;
+		} else if (strcmp(prp->desc->prb, "connect-request") == 0) {
+			skstate = BPF_TCP_SYN_SENT;
+			have_iphdr = 0;
+			skarg_maybe_null = 0;
+		} else {
+			have_iphdr = 0;
+			skarg_maybe_null = 0;
+		}
+	}
+	/*
+	 * We construct the tcp:::(receive,send) probe arguments as
+	 * follows:
+	 *	args[0] = skb
+	 *	args[1] = sk
+	 *	args[2] = ip_hdr(skb) [if available]
+	 *	args[3] = sk [struct tcp_sock *]
+	 *	args[4] = tcp_hdr(skb)
+	 *	args[5] = sk->sk_state
+	 *	args[6] = sk->sk_state
+	 *	args[7] = NET_PROBE_INBOUND (0x1) | NET_PROBE_OUTBOUND (0x0)
+	 */
+
+	/* first save sk to args[3]; this avoids overwriting it when we
+	 * populate args[0,1] below.
+	 */
+	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(skarg)));
+	/* only allow NULL sk for ip_send_unicast_reply() */
+	if (!skarg_maybe_null)
+		emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_6, 0, exitlbl));
+	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(3), BPF_REG_6));
+
+	/* then save skb to args[0] */
+	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(skbarg)));
+	emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_6, 0, exitlbl));
+	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_6));
+
+	/* next save sk to args[1] now that we have skb in args[0] */
+	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(3)));
+	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_6));
+
+	/*
+	 * ip_hdr(skb) =
+	 *	skb_network_header(skb)	=	(include/linux/ip.h)
+	 *	skb->head + skb->network_header	(include/linux/skbuff.h)
+	 */
+	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(0)));
+	get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
+	if (have_iphdr)
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
+	else
+		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(2), 0));
+
+	if (have_iphdr) {
+		get_member(pcb, "struct sk_buff", BPF_REG_6, "network_header");
+		emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
+	}
+	/*
+	 * tcp_hdr(skb) =
+	 *	skb_transport_header(skb) =		(include/linux/ip.h)
+	 *	skb->head + skb->transport_header	(include/linux/skbuff.h)
+	 */
+	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(tcparg)));
+	if (tcparg) {
+		get_member(pcb, "struct kvec", BPF_REG_6, "iov_base");
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
+	} else {
+		get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
+		get_member(pcb, "struct sk_buff", BPF_REG_6, "transport_header");
+		emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
+	}
+
+	if (!skarg_maybe_null) {
+		/* save sk state */
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(3)));
+		get_member(pcb, "struct sock_common", BPF_REG_6, "skc_state");
+		/* ensure sk state - if specified - is what we expect */
+		if (skstate)
+			emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, skstate,
+						 exitlbl));
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(5), BPF_REG_0));
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(6), BPF_REG_0));
+	}
+	emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(7), direction));
+
+	return 0;
+}
+
+dt_provimpl_t	dt_tcp = {
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
index 0c621197..798e67ee 100644
--- a/libdtrace/dt_provider.c
+++ b/libdtrace/dt_provider.c
@@ -41,6 +41,7 @@ const dt_provimpl_t *dt_providers[] = {
 	&dt_sched,
 	&dt_sdt,
 	&dt_syscall,
+	&dt_tcp,
 	&dt_uprobe,
 	&dt_usdt,
 	NULL
diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
index 59a8d62e..4db89b45 100644
--- a/libdtrace/dt_provider.h
+++ b/libdtrace/dt_provider.h
@@ -87,6 +87,7 @@ extern dt_provimpl_t dt_rawtp;
 extern dt_provimpl_t dt_sched;
 extern dt_provimpl_t dt_sdt;
 extern dt_provimpl_t dt_syscall;
+extern dt_provimpl_t dt_tcp;
 extern dt_provimpl_t dt_uprobe;
 extern dt_provimpl_t dt_usdt;
 
diff --git a/libdtrace/ip.d b/libdtrace/ip.d
index f8b77f12..d59bb436 100644
--- a/libdtrace/ip.d
+++ b/libdtrace/ip.d
@@ -51,7 +51,6 @@ inline int TCP_MIN_HEADER_LENGTH =	20;
  * to the net namespace (nd_net in struct net_device).
  */
 typedef uint64_t	netstackid_t;
-typedef __be32		ipaddr_t;
 typedef struct in6_addr	in6_addr_t;
 
 /*
diff --git a/libdtrace/net.d b/libdtrace/net.d
index 6ac34287..45b5cba3 100644
--- a/libdtrace/net.d
+++ b/libdtrace/net.d
@@ -25,9 +25,13 @@ typedef struct conninfo {
 	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
 } conninfo_t;
 
+typedef __be32 ipaddr_t;
+
 /*
  * We use these values to determine if a probe point is associated
- * with sending (outbound) or receiving (inbound).
+ * with sending (outbound) or receiving (inbound) or a state-related
+ * probe (i.e. neither in our outbound).
  */
 inline int NET_PROBE_OUTBOUND =		0x00;
 inline int NET_PROBE_INBOUND =		0x01;
+inline int NET_PROBE_STATE =		0x02;
diff --git a/libdtrace/tcp.d b/libdtrace/tcp.d
index 54e310cb..97c00191 100644
--- a/libdtrace/tcp.d
+++ b/libdtrace/tcp.d
@@ -60,7 +60,7 @@ typedef struct tcpinfo {
 	uint32_t tcp_seq;		/* sequence number */
 	uint32_t tcp_ack;		/* acknowledgment number */
 	uint8_t tcp_offset;		/* data offset, in bytes */
-	uint8_t tcp_flags;		/* flags */
+	uint16_t tcp_flags;		/* flags */
 	uint16_t tcp_window;		/* window size */
 	uint16_t tcp_checksum;		/* checksum */
 	uint16_t tcp_urgent;		/* urgent data pointer */
@@ -111,7 +111,7 @@ translator tcpinfo_t < struct tcphdr *T > {
 	tcp_seq = T ? ntohl(T->seq) : 0;
 	tcp_ack = T ? ntohl(T->ack_seq) : 0;
 	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
-	tcp_flags = T ? *(uint8_t *)(T + 13) : 0;
+	tcp_flags = T ? *((uint8_t *)T + 13) : 0;
 	tcp_window = T ? ntohs(T->window) : 0;
 	tcp_checksum = T ? ntohs(T->check) : 0;
 	tcp_urgent = T ? ntohs(T->urg_ptr) : 0;
@@ -164,41 +164,38 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 	    ntohs(((struct sock *)T)->__sk_common.skc_num) :
 	    arg4 != NULL ?
 	    ntohs(arg7 == NET_PROBE_INBOUND ?
-	    ((struct tcphdr *)arg4)->dest : ((struct tcphdr *)arg4)->source) :
+		  ((struct tcphdr *)arg4)->dest :
+		  ((struct tcphdr *)arg4)->source) :
 	    0;
 	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
 	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
 	    arg4 != NULL ?
 	    ntohs(arg7 == NET_PROBE_INBOUND ?
-            ((struct tcphdr *)arg4)->source : ((struct tcphdr *)arg4)->dest) :
+		  ((struct tcphdr *)arg4)->source :
+		  ((struct tcphdr *)arg4)->dest) :
 	    0;
 	tcps_laddr =
 	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
 	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_rcv_saddr) :
 	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
 	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr) :
-	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
-	    &((struct iphdr *)arg2)->daddr : &((struct iphdr *)arg2)->saddr) :
-	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
-	    &((struct ipv6hdr *)arg2)->daddr :
-	    &((struct ipv6hdr *)arg2)->saddr) :
+	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
+	    inet_ntoa(&((struct iphdr *)arg2)->daddr) :
+	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
+	    inet_ntoa6(&((struct ipv6hdr *)arg2)->daddr) :
 	    "<unknown>";
 	tcps_raddr =
 	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
 	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_daddr) :
 	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
 	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_daddr) :
-	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
-	    &((struct iphdr *)arg2)->saddr : &((struct iphdr *)arg2)->daddr) :
-	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
-	    &((struct ipv6hdr *)arg2)->saddr :
-	    &((struct ipv6hdr *)arg2)->daddr) :
-	    "<unknown>";
-	tcps_state = arg6;
+	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
+	    inet_ntoa(&((struct iphdr *)arg2)->saddr) :
+	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
+	    inet_ntoa6(&((struct ipv6hdr *)arg2)->saddr) :
+	    "<unknown";
+	tcps_state = arg7 == NET_PROBE_STATE ? arg6 :
+	    T ? ((struct sock *)T)->__sk_common.skc_state : 0;
 	tcps_iss = T ?
 	    T->snd_una - (uint32_t)T->bytes_acked : 0;
 	tcps_suna = T ? T->snd_una : 0;
@@ -229,3 +226,9 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 translator tcplsinfo_t < int I > {
 	tcps_state = I;
 };
+
+/* For tracepoint, the last state is in the sock state, next passed as arg6 */
+#pragma D binding "1.6.3" translator
+translator tcplsinfo_t < struct sock *S > {
+	tcps_state = S ? S->__sk_common.skc_state : 0;
+};
-- 
2.43.5

