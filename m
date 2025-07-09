Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD89328F523
	for <dtrace@lists.linux.dev>; Wed,  9 Jul 2025 14:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752072435; cv=none; b=n8r2e4Gh/4DJleAMJlJd9QRW+4IFxLbSbdlfEA9hAiw2GSRTlPtTc/azR+z5U96UdXiyq8WOB9tyzTe1wddp7mtnqplpVpc1lgYQBHOM5jZfYp07Y6NKPjTDF7HOd/2q7Qp5Fqt6wNe3q8/ObqGEBhsPiBpSOQ+YF1MZAxD5byY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752072435; c=relaxed/simple;
	bh=ZVl04PBytfJjFM/SSdxGpvKILHWsMfj6tiDDY1+bo3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qfRNx6w3jCQLEbRIMDG99pl6ygdO+B0gAcYXbmUnpbj51bF5uRJjQNKu2VtqMOFxBuCtxc6XvGjhTfHwBBhhkqU3irVfTUGs62xcxwNTaLX1EogbzTxgbPBpfEv2nqHBtCHYlVDu8Wi915ndjutF/YjON2AKWqs5bF1oGfPcPVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JpG8bFAs; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JpG8bFAs"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569EMBfp015605
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=zsjAV
	Ho/TL00buVHfyN3gc1LgApDcSODg+OlrmHnxp8=; b=JpG8bFAsMpG8MeDWpbMf3
	Q0v8MZRRiq65f3aCzd0wM1MR3dMl7kpC+a4uccL7dtxtX3C69KVVaQQwXrTyFwBr
	+Z8JSpOeFIgaYYoJM6+n4p4pOfHTnkx3PPWibFk/dkkSy+AU4fJDa/WOkZagd/W5
	feZSd4QplQ6ctBRvf1MvJgI5jbRj/dkDrpNe7Ly8G4YMlnBdDT+u8GTn0raHIF7C
	42nzefW7djdCJGgvm5wuIilymi1/gl60KffVhXfzXC9mMKKDBVQJQnBYlSM1Y+S1
	BfLBJtylrqsM6BLFie2lcItxw3yVsFMVRGy4fdN2PPzwJHbb3mvCVFnRENd1dT+O
	A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47st4801w6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 14:47:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 569D4X4o023658
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:47:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ptgbap47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 14:47:10 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 569Ek38c034091
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:47:09 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-63-52.vpn.oracle.com [10.154.63.52])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47ptgbanwh-6;
	Wed, 09 Jul 2025 14:47:09 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v4 5/7] tcp: new provider
Date: Wed,  9 Jul 2025 15:46:58 +0100
Message-ID: <20250709144700.20591-6-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250709144700.20591-1-alan.maguire@oracle.com>
References: <20250709144700.20591-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_03,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507090133
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDEzMyBTYWx0ZWRfXzh3fgCdGGdaN 0qyaBDIy4bkJcrUUx6LcGrvqAG8+8f6DAn5C6b86t7QsKakBcdazx2O6wEIAmMk+rPAN/Fn+jaf n8PJF86LHOsr8T5XlfYQN1MEdRke4C3FqUrq1BKIFF62/i/9ujAv0rXHZr4Rh34luyKKssrKf5E
 DzgokqHGUPJi9ts+9yWuuSg8hr38lTi4T5Jp2RzBSwso+menM4lZh6NUFJ94GpwBqfcpU3IlrrC I7+GWKjTO6aThQ2P4JVZuG/4ApH1NBovz/0/oeNvSrU84BMjNCrHucl04X+Gv/hxbmUAlr/BnUw ZyVWjvevwKC9waMmwz4/b9DK1xMNKLNzV1Z/rXAVJuBdMt43j3VhHzjSgWJ8DK3OQegVMxfAYLG
 VPaDlSonk13bMlMapHl4qJvysjfuYbzpdRY/fEiSCCZ4hDFblI6DsLx8/G5/XdKtj4OO/fcT
X-Proofpoint-ORIG-GUID: MsanePwdSvTHNyg5135n0KQ9oUgabhDd
X-Authority-Analysis: v=2.4 cv=RqTFLDmK c=1 sm=1 tr=0 ts=686e80ef b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=1XWaLZrsAAAA:8 a=_hgXXr9cxrujdmcvVOQA:9
X-Proofpoint-GUID: MsanePwdSvTHNyg5135n0KQ9oUgabhDd

Based upon various fbt probe points support TCP send, receive,
state-change, accept-established, accept-refused, connect-request,
connect-established and connect-refused probes.

A few tweaks were needed to tcp.d to support the probes fully.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/Build         |   2 +
 libdtrace/dt_prov_tcp.c | 413 ++++++++++++++++++++++++++++++++++++++++
 libdtrace/dt_provider.c |   1 +
 libdtrace/dt_provider.h |   1 +
 libdtrace/ip.d          |   2 +-
 libdtrace/net.d         |   6 +-
 libdtrace/tcp.d         |  67 ++++---
 7 files changed, 462 insertions(+), 30 deletions(-)
 create mode 100644 libdtrace/dt_prov_tcp.c

diff --git a/libdtrace/Build b/libdtrace/Build
index 219ff9b3..b0862ffa 100644
--- a/libdtrace/Build
+++ b/libdtrace/Build
@@ -58,6 +58,7 @@ libdtrace-build_SOURCES = dt_aggregate.c \
 			  dt_prov_sched.c \
 			  dt_prov_sdt.c \
 			  dt_prov_syscall.c \
+			  dt_prov_tcp.c \
 			  dt_prov_uprobe.c \
 			  dt_provider.c \
 			  dt_provider_sdt.c \
@@ -116,6 +117,7 @@ dt_prov_rawtp.c_CFLAGS := -Wno-pedantic
 dt_prov_sched.c_CFLAGS := -Wno-pedantic
 dt_prov_sdt.c_CFLAGS := -Wno-pedantic
 dt_prov_syscall.c_CFLAGS := -Wno-pedantic
+dt_prov_tcp.c_CFLAGS := -Wno-pedantic
 dt_prov_uprobe.c_CFLAGS := -Wno-pedantic
 dt_debug.c_CFLAGS := -Wno-prio-ctor-dtor
 
diff --git a/libdtrace/dt_prov_tcp.c b/libdtrace/dt_prov_tcp.c
new file mode 100644
index 00000000..84b4954f
--- /dev/null
+++ b/libdtrace/dt_prov_tcp.c
@@ -0,0 +1,413 @@
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
+	{ "accept-established", 5, { 5, 0, "void", "void" } },
+
+	{ "accept-refused", 0, { 0, 0, "struct sk_buff *", "pktinfo_t *" } },
+	{ "accept-refused", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
+	{ "accept-refused", 2, { 2, 0, "void_ip_t *", "ipinfo_t *" } },
+	{ "accept-refused", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t *" } },
+	{ "accept-refused", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t *" } },
+	{ "accept-refused", 5, { 5, 0, "void", "void"} },
+
+	{ "connect-established", 0, { 0, 0, "struct sk_buff *", "pktinfo_t *" } },
+	{ "connect-established", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
+	{ "connect-established", 2, { 2, 0, "void_ip_t *", "ipinfo_t *" } },
+	{ "connect-established", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t *" } },
+	{ "connect-established", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t *" } },
+	{ "connect-established", 5, { 5, 0, "void", "void"} },
+
+	{ "connect-refused", 0, { 0, 0, "struct sk_buff *", "pktinfo_t *" } },
+	{ "connect-refused", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
+	{ "connect-refused", 2, { 2, 0, "void_ip_t *", "ipinfo_t *" } },
+	{ "connect-refused", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t *" } },
+	{ "connect-refused", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t *" } },
+	{ "connect-refused", 5, { 5, 0, "void", "void"} },
+
+	{ "connect-request", 0, { 0, 0, "struct sk_buff *", "pktinfo_t *" } },
+	{ "connect-request", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
+	{ "connect-request", 2, { 2, 0, "__dtrace_tcp_void_ip_t *", "ipinfo_t *" } },
+	{ "connect-request", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t *" } },
+	{ "connect-request", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t *" } },
+	{ "connect-request", 5, { 5, 0, "void", "void"} },
+
+	{ "receive", 0, { 0, 0, "struct sk_buff *", "pktinfo_t *" } },
+	{ "receive", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
+	{ "receive", 2, { 2, 0, "void_ip_t *", "ipinfo_t *" } },
+	{ "receive", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t *" } },
+	{ "receive", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t *" } },
+	{ "receive", 5, { 5, 0, "void", "void"} },
+
+	{ "send", 0, { 0, 0, "struct sk_buff *", "pktinfo_t *" } },
+	{ "send", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
+	{ "send", 2, { 2, 0, "__dtrace_tcp_void_ip_t *", "ipinfo_t *" } },
+	{ "send", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t *" } },
+	{ "send", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t *" } },
+	{ "send", 5, { 5, 0, "void", "void"} },
+
+	{ "state-change", 0, { 0, 0, "void", "void", } },
+	{ "state-change", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
+	{ "state-change", 2, { 2, 0, "void", "void" } },
+	{ "state-change", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t *" } },
+	{ "state-change", 4, { 4, 0, "void", "void" } },
+	{ "state-change", 5, { 5, 0, "int", "tcplsinfo_t *" } },
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
+	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
+	dt_irlist_t	*dlp = &pcb->pcb_ir;
+	dt_probe_t	*prp = pcb->pcb_probe;
+	dt_probe_t	*uprp = pcb->pcb_parent_probe;
+	int		direction, have_iphdr;
+	int		skarg = 0, skbarg = 1, tcparg = 0;
+	int		skarg_maybe_null;
+	int		skstate = 0;
+
+	/*
+	 * We construct the tcp::: probe arguments as follows:
+	 *      arg0 = skb
+	 *      arg1 = sk
+	 *      arg2 = ip_hdr(skb) [if available]
+	 *      arg3 = sk [struct tcp_sock *]
+	 *      arg4 = tcp_hdr(skb)
+	 *      arg5 = new_sk_state [for state_change]
+	 *      arg6 = NET_PROBE_INBOUND (0x1) | NET_PROBE_OUTBOUND (0x0) |
+	 *      	  NET_PROBE_STATE (0x2)
+	 * arg6 never makes it into supported args[], it is simply set to
+	 * help inform translators about whether it is an inbound, outbound or
+	 * state transition probe.
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
+		 * struct tcpinfo.  We need then to explictly set the
+		 * state to TCP_SYN_RCV and also skip the case where
+		 * inet_sock_set_state() specifies TCP_SYN_RCV otherwise
+		 * we will get a probe double-firing.  So we set skip_state
+		 * to that state to avoid that double-firing.
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
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(3), BPF_REG_6));
+
+		/* save new state */
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(newstatearg)));
+		if (skip_state) {
+			emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_6, skip_state,
+						 exitlbl));
+		}
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(5), BPF_REG_6));
+
+		/* save sk */
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(3)));
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_6));
+
+		/* save empty args */
+		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(0), 0));
+		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(2), 0));
+		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(4), 0));
+
+		/* NET_PROBE_STATE */
+		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(6),
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
+			dtrace_typeinfo_t	sym;
+			ctf_funcinfo_t		fi;
+			int rc;
+
+			/* Newer kernels pass the original socket as second
+			 * arg to ip_send_unicast_reply(); if that function
+			 * has an extra (> 9) argument we know we have to
+			 * find sk, skb in arg1, arg2 not arg0, arg1.
+			 * tcp header is in ip_reply_arg which is in
+			 * arg5/arg6 depending on whether extra parameter
+			 * for original sk is present.
+			 */
+			rc = dtrace_lookup_by_type(dtp, DTRACE_OBJ_EVERY,
+						   uprp->desc->fun, &sym);
+			if (rc == 0 &&
+			    ctf_type_kind(sym.dtt_ctfp, sym.dtt_type) == CTF_K_FUNCTION &&
+			    ctf_func_type_info(sym.dtt_ctfp, sym.dtt_type, &fi) == 0 &&
+			    fi.ctc_argc > 9) {
+				/* NULL sk in arg1 not arg2 (dont want ctl_sk) */
+				skarg = 1;
+				/* skb in arg2 not arg1 */
+				skbarg = 2;
+				tcparg = 6;
+			} else {
+				skarg = 0;
+				skbarg = 1;
+				tcparg = 5;
+			}
+			have_iphdr = 1;
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
+	}
+	emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(6), direction));
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
index 0c459aba..b9a7196b 100644
--- a/libdtrace/dt_provider.c
+++ b/libdtrace/dt_provider.c
@@ -40,6 +40,7 @@ const dt_provimpl_t *dt_providers[] = {
 	&dt_sched,
 	&dt_sdt,
 	&dt_syscall,
+	&dt_tcp,
 	&dt_uprobe,
 	&dt_usdt,
 	NULL
diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
index 2a3bba80..8a0280cc 100644
--- a/libdtrace/dt_provider.h
+++ b/libdtrace/dt_provider.h
@@ -86,6 +86,7 @@ extern dt_provimpl_t dt_rawtp;
 extern dt_provimpl_t dt_sched;
 extern dt_provimpl_t dt_sdt;
 extern dt_provimpl_t dt_syscall;
+extern dt_provimpl_t dt_tcp;
 extern dt_provimpl_t dt_uprobe;
 extern dt_provimpl_t dt_usdt;
 
diff --git a/libdtrace/ip.d b/libdtrace/ip.d
index b498bc07..493b75a0 100644
--- a/libdtrace/ip.d
+++ b/libdtrace/ip.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
diff --git a/libdtrace/net.d b/libdtrace/net.d
index 4c7bc61f..f1291696 100644
--- a/libdtrace/net.d
+++ b/libdtrace/net.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -52,7 +52,9 @@ typedef struct csinfo {
 
 /*
  * We use these values to determine if a probe point is associated
- * with sending (outbound) or receiving (inbound).
+ * with sending (outbound) or receiving (inbound) or a state-related
+ * probe (i.e. neither inbound our outbound).
  */
 inline int NET_PROBE_OUTBOUND =		0x00;
 inline int NET_PROBE_INBOUND =		0x01;
+inline int NET_PROBE_STATE =		0x02;
diff --git a/libdtrace/tcp.d b/libdtrace/tcp.d
index 54e310cb..48d9adb4 100644
--- a/libdtrace/tcp.d
+++ b/libdtrace/tcp.d
@@ -1,13 +1,13 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2010, 2017, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2010, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
 #pragma D depends_on module vmlinux
 #pragma D depends_on library net.d
-#pragma D depends_on provider ip
+#pragma D depends_on library ip.d
 #pragma D depends_on provider tcp
 
 inline int TH_FIN =	0x01;
@@ -111,30 +111,38 @@ translator tcpinfo_t < struct tcphdr *T > {
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
 
+/* timewait sockets and inet connection sockets do not populate all fields
+ * and are not classified as full sockets; this inline helps translators
+ * spot them and act appropriately.
+ */
+inline int tcp_fullsock[struct tcp_sock *sk] =
+	(((struct sock_common *)sk)->skc_state != TCP_STATE_SYN_RECEIVED &&
+	 ((struct sock_common *)sk)->skc_state != TCP_STATE_TIME_WAIT);
 /*
  * In the main we simply translate from the "struct [tcp_]sock *" to
  * a tcpsinfo_t *.  However there are a few exceptions:
  *
- * - tcps_state is always derived from arg6.  The reason is that in some
+ * - tcps_state for state-change is arg5.  The reason is that in some
  * state transitions sock->sk_state does not reflect the actual TCP
  * connection state.  For example the TIME_WAIT state is handled in
  * Linux by creating a separate timewait socket and the state of the
  * original socket is CLOSED.  In some other cases we also need to
- * instrument state transition prior to the update of sk_state.  To do
- * all of this we rely on arg6.
+ * instrument state transition _prior_ to the update of sk_state.  To do
+ * all of this we rely on arg5 to hold the new state. arg6 is set to
+ * NET_PROBE_STATE to quickly identify state-change probes.
  * - we sometimes need to retrieve local/remote port/address settings from
  * TCP and IP headers directly, for example prior to the address/port
  * being committed to the socket.  To do this effectively we need to know
  * if the packet data is inbound (in which case the local IP/port are the
  * destination) or outbound (in which case the local IP/port are the source).
- * arg7 is set to 0 for outbound traffic and 1 for inbound so we use these
+ * arg6 is set to 0 for outbound traffic and 1 for inbound so we use these
  * to reconstruct the address/port info where necessary.  arg2 used for IP
  * information while arg4 contains the TCP header, so it is used for port data.
  * NET_PROBE_INBOUND is defined as 1, NET_PROBE_OUTBOUND as 0 in net.d.
@@ -158,47 +166,49 @@ translator tcpsinfo_t < struct tcp_sock *T > {
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
+	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
+	    inet_ntoa(&((struct iphdr *)arg2)->saddr) :
+	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
+	    inet_ntoa6(&((struct ipv6hdr *)arg2)->saddr) :
 	    "<unknown>";
-	tcps_state = arg6;
+	/* For state-change we probe right before state has changed, but
+	 * provider definition wants new state in tcps_state; for
+	 * state-change probes the trampoline stores it in arg5.
+	 */
+	tcps_state = arg6 == NET_PROBE_STATE ? arg5 :
+	    T ? ((struct sock *)T)->__sk_common.skc_state : 0;
 	tcps_iss = T ?
 	    T->snd_una - (uint32_t)T->bytes_acked : 0;
 	tcps_suna = T ? T->snd_una : 0;
@@ -225,7 +235,10 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 	    T->rcv_nxt - (uint32_t)T->bytes_received : 0;
 };
 
+/* state-change trampoline stores new state in arg5; at time of firing,
+ * state has not been updated, so last state is in tcp_sock state.
+ */
 #pragma D binding "1.6.3" translator
 translator tcplsinfo_t < int I > {
-	tcps_state = I;
+	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
 };
-- 
2.39.3

