Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AB223ABB5
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 13:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563902; cv=none; b=KgMjWm2jf1berq6/0aUiREHz7vZASYyvtwGSISKre4BcFjQ2A2i70pQs1MUapLUZQeJtzvcWeUp3n7++Hhf3kUzrMfARFpkzwjQB0eS6jdj1IuCHvyd+h0XTSgv+MWOu7YfOTJsDDYV1aKPXRWyaha4mFb3tIc/h0ybALspNfdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563902; c=relaxed/simple;
	bh=lumOQubRcuQop2zcy/VDjfD3TooQnDuqir7FgG8kUE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pd5GCu4wQhNHMXUlmOWLWx9qelKRrcWFCJ6DXSGcTD9IsuaMxXAkx+waDBTU1UgfmBSLw7rj4frek6xeRiLL4eAz64f3KOf6wSeMHEpnTTVptAJj1J3+sY8L8lZWb/CfLbo8iR4Y7c3ncPXcVR4ST+j6UX6d3wui9tqzsDz4+aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AgiEgc7I; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AgiEgc7I"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ADBcWD011866
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 13:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=UuK2R
	2l09tOUUsrobNiqMjAmxRYXpmJjVtndLsed1HQ=; b=AgiEgc7IMGfFpiu+UM3MJ
	slga7leyDwJofat+zK+f08HSvtItd+xTVtV1BsHmPuOIPdl0W+HEx4bjDowqakyC
	kX4Ii06gBewjU08vv9jyNS/dDf4ibYFd8u88nc293pXHVJGrVFZlAVH28L4ch6iE
	BF3SjTVcvR2OH+Cq/JP94uXykwWwTig4J8crJd4U8g2SjakfFvuIJntAW6jR1wwI
	58/kphemkJWo+u/YcrFM8He8OSpSHBJxePdkdAbFlNEDUttzh0vu2fz0Nrh0qIW/
	mXzBpmBIX95sFsY9nVxGoswwvTiJz2mXqvJVwLcP5aEQAJ2C+LWIC7cmo7PnGC3Q
	w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c74vbfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 13:58:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACoBs7003330
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 13:58:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv8s9j2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 13:58:18 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55ADwElk009385
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 13:58:17 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-54-217.vpn.oracle.com [10.154.54.217])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 474bv8s9f6-4;
	Tue, 10 Jun 2025 13:58:17 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2 3/4] dtrace: add tcp provider
Date: Tue, 10 Jun 2025 14:58:12 +0100
Message-ID: <20250610135813.15746-4-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250610135813.15746-1-alan.maguire@oracle.com>
References: <20250610135813.15746-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506100110
X-Authority-Analysis: v=2.4 cv=LIpmQIW9 c=1 sm=1 tr=0 ts=684839fa b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=1XWaLZrsAAAA:8 a=g5ew_HD3eyLdADT0_1wA:9 cc=ntf awl=host:14714
X-Proofpoint-ORIG-GUID: 2DxLKa3BydEiNZRwskRokp6YxFI0NjRi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDExMCBTYWx0ZWRfX0eMe+5KgEtoQ hO7W0efZBjnxrO/eCwS6klOySpASmX78Xv+1zir7zU+13z9WUk1nKLZMx6nRmRp7enh5fO8SRVE PIrg2F+CexEqcI8qqVaGMxKqdSZ4XG0ksVh63RPIoeSiPy0Vim0U+r7fj/ddQ+9+lL7d0qSdlRF
 ie/MrQf1nzc6jZPIFf31S76sa8eVUQTTXKxtgANmwR0DDzlwKCPWSdJ73CaOMbR8e1clshxcXzS FAoZpUspT+1qqvA6wdn1p33fH0DOJGhLOwUtUVBLAof/Ce0pyLjW4Dnm/4EXIn6LfAh1/3egBQw 6l2F6amNkef1wN0gWrN3hiR4I6rtHcVatqHj1lC1vyh2A3YDKnBeBPo2ZuP3TkcfjWMlFQ6iS18
 gPeeyzzINuUcVdemq85GkfKU0u4VPK9OejeA2b2SDjHGPHSfKkhoAEts5Fj3Dkfjq9OdkOIV
X-Proofpoint-GUID: 2DxLKa3BydEiNZRwskRokp6YxFI0NjRi

Based upon various fbt probe points support TCP send, receive,
state-change, accept-established, accept-refused, connect-request,
connect-established and connect-refused probes.

A few tweaks were needed to tcp.d to support the probes fully.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/Build         |   2 +
 libdtrace/dt_prov_tcp.c | 405 ++++++++++++++++++++++++++++++++++++++++
 libdtrace/dt_provider.c |   1 +
 libdtrace/dt_provider.h |   1 +
 libdtrace/ip.d          |   1 -
 libdtrace/net.d         |   6 +-
 libdtrace/tcp.d         |  52 +++---
 7 files changed, 443 insertions(+), 25 deletions(-)
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
 
diff --git a/libdtrace/dt_prov_tcp.c b/libdtrace/dt_prov_tcp.c
new file mode 100644
index 00000000..75e1e3a9
--- /dev/null
+++ b/libdtrace/dt_prov_tcp.c
@@ -0,0 +1,405 @@
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
+#include <netinet/in.h>
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
+	{ "state-change",
+	  DTRACE_PROBESPEC_NAME,	"fbt::inet_csk_clone_lock:entry" },
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
+	/*
+	 * We construct the tcp::: probe arguments as
+	 * follows:
+	 *      args[0] = skb
+	 *      args[1] = sk
+	 *      args[2] = ip_hdr(skb) [if available]
+	 *      args[3] = sk [struct tcp_sock *]
+	 *      args[4] = tcp_hdr(skb)
+	 *      args[5] = sk->sk_state
+	 *      args[6] = sk->sk_state
+	 *      args[7] = NET_PROBE_INBOUND (0x1) | NET_PROBE_OUTBOUND (0x0)
+	 */
+
+	if (strcmp(prp->desc->prb, "state-change") == 0) {
+		int newstatearg;
+		int skip_state = 0;
+		int check_proto = IPPROTO_TCP;
+
+		/* For pre-6.14 kernels, inet_sock_state_change() to
+		 * TCP_SYN_RCV is broken in that the cloned socket has
+		 * not yet copied info of interest like addresses, ports.
+		 * This is fixed in 6.14 via
+		 *
+		 * commit a3a128f611a965fddf8a02dd45716f96e0738e00
+		 * Author: Eric Dumazet <edumazet@google.com>
+		 * Date:   Wed Feb 12 13:13:28 2025 +0000
+		 *
+		 * inet: consolidate inet_csk_clone_lock()
+		 *
+		 * To work around this we trace inet_csk_clone_lock and
+		 * use the reqsk (arg1) as the means to populate the
+		 * struct tcpinfo.  We need then to explicitly set the
+		 * state to TCP_SYN_RCV and also skip the case where
+		 * inet_sock_set_state() specifies TCP_SYN_RCV otherwise
+		 * we will get a probe double-firing.
+		 */
+		if (strcmp(uprp->desc->fun, "inet_csk_clone_lock") == 0) {
+			skarg = 1;
+			newstatearg = 2;
+			check_proto = 0;
+			emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(2),
+						BPF_TCP_SYN_RECV));
+		} else if (strcmp(uprp->desc->fun, "tcp_time_wait") == 0) {
+			skarg = 0;
+			newstatearg = 1;
+		} else {
+			skarg = 0;
+			newstatearg = 2;
+			skip_state = BPF_TCP_SYN_RECV;
+		}
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(skarg)));
+		emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_6, 0, exitlbl));
+		/* check it is a TCP socket */
+		if (check_proto) {
+			dt_cg_get_member(pcb, "struct sock", BPF_REG_6,
+					 "sk_protocol");
+			emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0,
+						 IPPROTO_TCP, exitlbl));
+		}
+		/* save sk */
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(skarg)));
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(3), BPF_REG_6));
+
+		/* save new state */
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(newstatearg)));
+		if (skip_state) {
+			emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_6, skip_state,
+						 exitlbl));
+		}
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
+	dt_cg_get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
+	if (have_iphdr)
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
+	else
+		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(2), 0));
+
+	if (have_iphdr) {
+		dt_cg_get_member(pcb, "struct sk_buff", BPF_REG_6,
+				 "network_header");
+		emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
+	}
+	/*
+	 * tcp_hdr(skb) =
+	 *	skb_transport_header(skb) =		(include/linux/ip.h)
+	 *	skb->head + skb->transport_header	(include/linux/skbuff.h)
+	 */
+	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(tcparg)));
+	if (tcparg) {
+		/* struct ip_reply_arg * has a kvec containing the tcp header */
+		dt_cg_get_member(pcb, "struct kvec", BPF_REG_6, "iov_base");
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
+	} else {
+		dt_cg_get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
+		dt_cg_get_member(pcb, "struct sk_buff", BPF_REG_6,
+				 "transport_header");
+		emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
+	}
+
+	if (!skarg_maybe_null) {
+		/* save sk state */
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(3)));
+		dt_cg_get_member(pcb, "struct sock_common", BPF_REG_6,
+				 "skc_state");
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
index 54e310cb..d4beea87 100644
--- a/libdtrace/tcp.d
+++ b/libdtrace/tcp.d
@@ -8,7 +8,6 @@
 #pragma D depends_on module vmlinux
 #pragma D depends_on library net.d
 #pragma D depends_on provider ip
-#pragma D depends_on provider tcp
 
 inline int TH_FIN =	0x01;
 inline int TH_SYN =	0x02;
@@ -60,7 +59,7 @@ typedef struct tcpinfo {
 	uint32_t tcp_seq;		/* sequence number */
 	uint32_t tcp_ack;		/* acknowledgment number */
 	uint8_t tcp_offset;		/* data offset, in bytes */
-	uint8_t tcp_flags;		/* flags */
+	uint16_t tcp_flags;		/* flags */
 	uint16_t tcp_window;		/* window size */
 	uint16_t tcp_checksum;		/* checksum */
 	uint16_t tcp_urgent;		/* urgent data pointer */
@@ -111,13 +110,16 @@ translator tcpinfo_t < struct tcphdr *T > {
 	tcp_seq = T ? ntohl(T->seq) : 0;
 	tcp_ack = T ? ntohl(T->ack_seq) : 0;
 	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
-	tcp_flags = T ? *(uint8_t *)(T + 13) : 0;
+	tcp_flags = T ? *((uint8_t *)T + 13) : 0;
 	tcp_window = T ? ntohs(T->window) : 0;
 	tcp_checksum = T ? ntohs(T->check) : 0;
 	tcp_urgent = T ? ntohs(T->urg_ptr) : 0;
 	tcp_hdr = (uintptr_t)T;
 };
 
+inline int tcp_fullsock[struct tcp_sock *sk] =
+	(((struct sock_common *)sk)->skc_state != TCP_STATE_SYN_RECEIVED &&
+	 ((struct sock_common *)sk)->skc_state != TCP_STATE_TIME_WAIT);
 /*
  * In the main we simply translate from the "struct [tcp_]sock *" to
  * a tcpsinfo_t *.  However there are a few exceptions:
@@ -158,47 +160,45 @@ translator tcpsinfo_t < struct tcp_sock *T > {
             ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_daddr)[2] &&
 	    ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr)[3])
 	    : 0;
-	tcps_lport = (T && ((struct inet_sock *)T)->inet_sport != 0) ?
+	tcps_lport = T && ((struct inet_sock *)T)->inet_sport != 0 &&
+	    tcp_fullsock[T] ?
 	    ntohs(((struct inet_sock *)T)->inet_sport) :
 	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
-	    ntohs(((struct sock *)T)->__sk_common.skc_num) :
+	    ((struct sock *)T)->__sk_common.skc_num :
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
@@ -229,3 +229,9 @@ translator tcpsinfo_t < struct tcp_sock *T > {
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
2.39.3

