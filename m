Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5801D2D29D8
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753178888; cv=none; b=oIEdcWqqtcNsZ2iZ8r9ySNmIPpBRzokZEgdHTqz5mhAEi8Ypd74E2YqDeU71bCsRZwE1yIV+LNq2lnK3UyyEnVMz0xiBykjpH7irgixA+Y24bI2xTPr1ERyuZwbG9L5sRTKDttzYoLgbeQG6kTvzv9Aeayy0UzP0r84deq39IxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753178888; c=relaxed/simple;
	bh=3GEs0kJryWfFJnTHNsJmEgTGtgzGwYI5BW74fb9oGoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ld+tWrMpL9OWGRGMD0a7s1+8A90mLR7lT4rSItWHwBU2ldA8Izczjate7O3D/FRpUptirfsEgg0y2JkcjrOcICoMC+3n4TOH84EPdzktoORhkY7VNmWY2cNS6cb4YYshyCaIJ95k8fLHD37gLGAUWHxwzz6efgZfs+tvFCWb2as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iQCIUqUQ; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iQCIUqUQ"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M5TCsp021334
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=8g7ac
	iIaXmUxYMbxoATn2pG2dyBkJzrmWtOkqWTS50w=; b=iQCIUqUQzmUJVzd1CprwF
	cEGe17EdcBdDD13mjiO1ESIce123KDNDNeg3Guvs6MPyqUj9tUqYJSCFagVjKVhf
	RTk6ecTZU51csTfJKo2HO/XlfQMYHltrjmSc7ollSazvhALAC9IhgfrqB+EBhY2I
	tORNwICY3HWOGeEXnF1b7J9YVsmEEGb7Up7iER5FEwIDahdL1yxXNV92jkX8bfo0
	RlY4N5Zt26TeIKnwzGAXY2LxYm24WbfptcZisb1ZA80NxfeyIACD9tuEdD0ch8n3
	4ZwLrojcUPLC5aeHlmlO5IkF4SfHCnJ0hohLcQjQvpULlU0wLRMcXzfImddEyeKQ
	g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805e9myx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:08:00 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56M8R6Pl010800
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:08:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801t940m9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:07:59 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56MA7o6L011213
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:07:59 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-50-138.vpn.oracle.com [10.154.50.138])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4801t940f1-6;
	Tue, 22 Jul 2025 10:07:58 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>,
        Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH v5 5/6] dlibs: sync ip.d, net.d and tcp.d
Date: Tue, 22 Jul 2025 11:07:48 +0100
Message-ID: <20250722100749.233821-6-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250722100749.233821-1-alan.maguire@oracle.com>
References: <20250722100749.233821-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507220083
X-Authority-Analysis: v=2.4 cv=eqbfzppX c=1 sm=1 tr=0 ts=687f6300 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=Y0Ti5DWBUdgk3VTIWqAA:9
 a=7YNkJrQCDtm0XhcG:21
X-Proofpoint-GUID: owCo4uQS085B9NCWyswyLmo-fR1DF_qc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA4NCBTYWx0ZWRfX4zMljx4zPTsQ
 BpQDFn9VYr+rSf6Gb+bg8bxwl+ug6r0kLGIbeSCNF1UmL4kYsWj2I2ez/T/stW05p0uChTEhK1g
 NRmk7xATyjYLRCKTXiZC4eNFfw0xd/0H9CjaaXYxZS8X+9WTBiiWLUyUYLJDvY3UPSD6qmH7aSw
 rHYRh6RG9Z/R72SUntHpzhm44VDK7DZhK3wHwsHeV8MFOq/ZTt1DwsRn0d90kzinNMoTOs38a36
 Rvh4j/8P7PvuZrxH7rra+OPwmC91R8VfNR5F2g1KFEXP5NYVfGrCZkHeL3qxZ04oM6nqyB5ABS+
 rujrgWd7OkcbbMcO8b34RdIvHGZstHHjPizYaUf64USSdzp63Zm75rybggahGJ99Viq8Q1jRlLw
 qahRvGMQp1oya/e9Yu355uZnLx+B2Pjq3Y4miRiVLdhYJ6ueicpE9iPq9iRRDe9NWodb+3jR
X-Proofpoint-ORIG-GUID: owCo4uQS085B9NCWyswyLmo-fR1DF_qc

Sync dlibs with libdtrace versions.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dlibs/aarch64/5.11/ip.d  | 27 +---------------
 dlibs/aarch64/5.11/net.d | 31 +++++++++++++++++--
 dlibs/aarch64/5.11/tcp.d | 67 ++++++++++++++++++++++++----------------
 dlibs/aarch64/5.12/ip.d  | 27 +---------------
 dlibs/aarch64/5.12/net.d | 31 +++++++++++++++++--
 dlibs/aarch64/5.12/tcp.d | 67 ++++++++++++++++++++++++----------------
 dlibs/aarch64/5.14/ip.d  | 27 +---------------
 dlibs/aarch64/5.14/net.d | 31 +++++++++++++++++--
 dlibs/aarch64/5.14/tcp.d | 67 ++++++++++++++++++++++++----------------
 dlibs/aarch64/5.16/ip.d  | 27 +---------------
 dlibs/aarch64/5.16/net.d | 31 +++++++++++++++++--
 dlibs/aarch64/5.16/tcp.d | 67 ++++++++++++++++++++++++----------------
 dlibs/aarch64/5.2/ip.d   | 27 +---------------
 dlibs/aarch64/5.2/net.d  | 31 +++++++++++++++++--
 dlibs/aarch64/5.2/tcp.d  | 67 ++++++++++++++++++++++++----------------
 dlibs/aarch64/5.6/ip.d   | 27 +---------------
 dlibs/aarch64/5.6/net.d  | 31 +++++++++++++++++--
 dlibs/aarch64/5.6/tcp.d  | 67 ++++++++++++++++++++++++----------------
 dlibs/aarch64/6.1/ip.d   | 27 +---------------
 dlibs/aarch64/6.1/net.d  | 31 +++++++++++++++++--
 dlibs/aarch64/6.1/tcp.d  | 67 ++++++++++++++++++++++++----------------
 dlibs/aarch64/6.10/ip.d  | 27 +---------------
 dlibs/aarch64/6.10/net.d | 31 +++++++++++++++++--
 dlibs/aarch64/6.10/tcp.d | 67 ++++++++++++++++++++++++----------------
 dlibs/x86_64/5.11/ip.d   | 27 +---------------
 dlibs/x86_64/5.11/net.d  | 31 +++++++++++++++++--
 dlibs/x86_64/5.11/tcp.d  | 67 ++++++++++++++++++++++++----------------
 dlibs/x86_64/5.12/ip.d   | 27 +---------------
 dlibs/x86_64/5.12/net.d  | 31 +++++++++++++++++--
 dlibs/x86_64/5.12/tcp.d  | 67 ++++++++++++++++++++++++----------------
 dlibs/x86_64/5.14/ip.d   | 27 +---------------
 dlibs/x86_64/5.14/net.d  | 31 +++++++++++++++++--
 dlibs/x86_64/5.14/tcp.d  | 67 ++++++++++++++++++++++++----------------
 dlibs/x86_64/5.16/ip.d   | 27 +---------------
 dlibs/x86_64/5.16/net.d  | 31 +++++++++++++++++--
 dlibs/x86_64/5.16/tcp.d  | 67 ++++++++++++++++++++++++----------------
 dlibs/x86_64/5.2/ip.d    | 27 +---------------
 dlibs/x86_64/5.2/net.d   | 31 +++++++++++++++++--
 dlibs/x86_64/5.2/tcp.d   | 67 ++++++++++++++++++++++++----------------
 dlibs/x86_64/5.6/ip.d    | 27 +---------------
 dlibs/x86_64/5.6/net.d   | 31 +++++++++++++++++--
 dlibs/x86_64/5.6/tcp.d   | 67 ++++++++++++++++++++++++----------------
 dlibs/x86_64/6.1/ip.d    | 27 +---------------
 dlibs/x86_64/6.1/net.d   | 31 +++++++++++++++++--
 dlibs/x86_64/6.1/tcp.d   | 67 ++++++++++++++++++++++++----------------
 dlibs/x86_64/6.10/ip.d   | 27 +---------------
 dlibs/x86_64/6.10/net.d  | 31 +++++++++++++++++--
 dlibs/x86_64/6.10/tcp.d  | 67 ++++++++++++++++++++++++----------------
 48 files changed, 1120 insertions(+), 880 deletions(-)

diff --git a/dlibs/aarch64/5.11/ip.d b/dlibs/aarch64/5.11/ip.d
index f8b77f12..493b75a0 100644
--- a/dlibs/aarch64/5.11/ip.d
+++ b/dlibs/aarch64/5.11/ip.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
 
 inline int TCP_MIN_HEADER_LENGTH =	20;
 
-/*
- * For compatibility with Solaris.  Here the netstackid will be the pointer
- * to the net namespace (nd_net in struct net_device).
- */
-typedef uint64_t	netstackid_t;
-typedef __be32		ipaddr_t;
-typedef struct in6_addr	in6_addr_t;
-
-/*
- * pktinfo is where packet ID info can be made available for deeper
- * analysis if packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
- */
-typedef struct pktinfo {
-	uintptr_t pkt_addr;
-} pktinfo_t;
-
-/*
- * csinfo is where connection state info is made available.
- */
-typedef struct csinfo {
-	uintptr_t cs_addr;
-	uint64_t cs_cid;
-} csinfo_t;
-
 /*
  * ipinfo contains common IP info for both IPv4 and IPv6.
  */
diff --git a/dlibs/aarch64/5.11/net.d b/dlibs/aarch64/5.11/net.d
index 6ac34287..f1291696 100644
--- a/dlibs/aarch64/5.11/net.d
+++ b/dlibs/aarch64/5.11/net.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -25,9 +25,36 @@ typedef struct conninfo {
 	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
 } conninfo_t;
 
+/*
+ * For compatibility with Solaris.  Here the netstackid will be the pointer
+ * to the net namespace (nd_net in struct net_device).
+ */
+typedef uint64_t	netstackid_t;
+typedef __be32		ipaddr_t;
+typedef struct in6_addr	in6_addr_t;
+
+/*
+ * pktinfo is where packet ID info can be made available for deeper
+ * analysis if packet IDs become supported by the kernel in the future.
+ * The pkt_addr member is currently always NULL.
+ */
+typedef struct pktinfo {
+	uintptr_t pkt_addr;
+} pktinfo_t;
+
+/*
+ * csinfo is where connection state info is made available.
+ */
+typedef struct csinfo {
+	uintptr_t cs_addr;
+	uint64_t cs_cid;
+} csinfo_t;
+
 /*
  * We use these values to determine if a probe point is associated
- * with sending (outbound) or receiving (inbound).
+ * with sending (outbound) or receiving (inbound) or a state-related
+ * probe (i.e. neither inbound our outbound).
  */
 inline int NET_PROBE_OUTBOUND =		0x00;
 inline int NET_PROBE_INBOUND =		0x01;
+inline int NET_PROBE_STATE =		0x02;
diff --git a/dlibs/aarch64/5.11/tcp.d b/dlibs/aarch64/5.11/tcp.d
index 54e310cb..48d9adb4 100644
--- a/dlibs/aarch64/5.11/tcp.d
+++ b/dlibs/aarch64/5.11/tcp.d
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
diff --git a/dlibs/aarch64/5.12/ip.d b/dlibs/aarch64/5.12/ip.d
index f8b77f12..493b75a0 100644
--- a/dlibs/aarch64/5.12/ip.d
+++ b/dlibs/aarch64/5.12/ip.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
 
 inline int TCP_MIN_HEADER_LENGTH =	20;
 
-/*
- * For compatibility with Solaris.  Here the netstackid will be the pointer
- * to the net namespace (nd_net in struct net_device).
- */
-typedef uint64_t	netstackid_t;
-typedef __be32		ipaddr_t;
-typedef struct in6_addr	in6_addr_t;
-
-/*
- * pktinfo is where packet ID info can be made available for deeper
- * analysis if packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
- */
-typedef struct pktinfo {
-	uintptr_t pkt_addr;
-} pktinfo_t;
-
-/*
- * csinfo is where connection state info is made available.
- */
-typedef struct csinfo {
-	uintptr_t cs_addr;
-	uint64_t cs_cid;
-} csinfo_t;
-
 /*
  * ipinfo contains common IP info for both IPv4 and IPv6.
  */
diff --git a/dlibs/aarch64/5.12/net.d b/dlibs/aarch64/5.12/net.d
index 6ac34287..f1291696 100644
--- a/dlibs/aarch64/5.12/net.d
+++ b/dlibs/aarch64/5.12/net.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -25,9 +25,36 @@ typedef struct conninfo {
 	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
 } conninfo_t;
 
+/*
+ * For compatibility with Solaris.  Here the netstackid will be the pointer
+ * to the net namespace (nd_net in struct net_device).
+ */
+typedef uint64_t	netstackid_t;
+typedef __be32		ipaddr_t;
+typedef struct in6_addr	in6_addr_t;
+
+/*
+ * pktinfo is where packet ID info can be made available for deeper
+ * analysis if packet IDs become supported by the kernel in the future.
+ * The pkt_addr member is currently always NULL.
+ */
+typedef struct pktinfo {
+	uintptr_t pkt_addr;
+} pktinfo_t;
+
+/*
+ * csinfo is where connection state info is made available.
+ */
+typedef struct csinfo {
+	uintptr_t cs_addr;
+	uint64_t cs_cid;
+} csinfo_t;
+
 /*
  * We use these values to determine if a probe point is associated
- * with sending (outbound) or receiving (inbound).
+ * with sending (outbound) or receiving (inbound) or a state-related
+ * probe (i.e. neither inbound our outbound).
  */
 inline int NET_PROBE_OUTBOUND =		0x00;
 inline int NET_PROBE_INBOUND =		0x01;
+inline int NET_PROBE_STATE =		0x02;
diff --git a/dlibs/aarch64/5.12/tcp.d b/dlibs/aarch64/5.12/tcp.d
index 54e310cb..48d9adb4 100644
--- a/dlibs/aarch64/5.12/tcp.d
+++ b/dlibs/aarch64/5.12/tcp.d
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
diff --git a/dlibs/aarch64/5.14/ip.d b/dlibs/aarch64/5.14/ip.d
index f8b77f12..493b75a0 100644
--- a/dlibs/aarch64/5.14/ip.d
+++ b/dlibs/aarch64/5.14/ip.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
 
 inline int TCP_MIN_HEADER_LENGTH =	20;
 
-/*
- * For compatibility with Solaris.  Here the netstackid will be the pointer
- * to the net namespace (nd_net in struct net_device).
- */
-typedef uint64_t	netstackid_t;
-typedef __be32		ipaddr_t;
-typedef struct in6_addr	in6_addr_t;
-
-/*
- * pktinfo is where packet ID info can be made available for deeper
- * analysis if packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
- */
-typedef struct pktinfo {
-	uintptr_t pkt_addr;
-} pktinfo_t;
-
-/*
- * csinfo is where connection state info is made available.
- */
-typedef struct csinfo {
-	uintptr_t cs_addr;
-	uint64_t cs_cid;
-} csinfo_t;
-
 /*
  * ipinfo contains common IP info for both IPv4 and IPv6.
  */
diff --git a/dlibs/aarch64/5.14/net.d b/dlibs/aarch64/5.14/net.d
index 6ac34287..f1291696 100644
--- a/dlibs/aarch64/5.14/net.d
+++ b/dlibs/aarch64/5.14/net.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -25,9 +25,36 @@ typedef struct conninfo {
 	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
 } conninfo_t;
 
+/*
+ * For compatibility with Solaris.  Here the netstackid will be the pointer
+ * to the net namespace (nd_net in struct net_device).
+ */
+typedef uint64_t	netstackid_t;
+typedef __be32		ipaddr_t;
+typedef struct in6_addr	in6_addr_t;
+
+/*
+ * pktinfo is where packet ID info can be made available for deeper
+ * analysis if packet IDs become supported by the kernel in the future.
+ * The pkt_addr member is currently always NULL.
+ */
+typedef struct pktinfo {
+	uintptr_t pkt_addr;
+} pktinfo_t;
+
+/*
+ * csinfo is where connection state info is made available.
+ */
+typedef struct csinfo {
+	uintptr_t cs_addr;
+	uint64_t cs_cid;
+} csinfo_t;
+
 /*
  * We use these values to determine if a probe point is associated
- * with sending (outbound) or receiving (inbound).
+ * with sending (outbound) or receiving (inbound) or a state-related
+ * probe (i.e. neither inbound our outbound).
  */
 inline int NET_PROBE_OUTBOUND =		0x00;
 inline int NET_PROBE_INBOUND =		0x01;
+inline int NET_PROBE_STATE =		0x02;
diff --git a/dlibs/aarch64/5.14/tcp.d b/dlibs/aarch64/5.14/tcp.d
index 54e310cb..48d9adb4 100644
--- a/dlibs/aarch64/5.14/tcp.d
+++ b/dlibs/aarch64/5.14/tcp.d
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
diff --git a/dlibs/aarch64/5.16/ip.d b/dlibs/aarch64/5.16/ip.d
index f8b77f12..493b75a0 100644
--- a/dlibs/aarch64/5.16/ip.d
+++ b/dlibs/aarch64/5.16/ip.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
 
 inline int TCP_MIN_HEADER_LENGTH =	20;
 
-/*
- * For compatibility with Solaris.  Here the netstackid will be the pointer
- * to the net namespace (nd_net in struct net_device).
- */
-typedef uint64_t	netstackid_t;
-typedef __be32		ipaddr_t;
-typedef struct in6_addr	in6_addr_t;
-
-/*
- * pktinfo is where packet ID info can be made available for deeper
- * analysis if packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
- */
-typedef struct pktinfo {
-	uintptr_t pkt_addr;
-} pktinfo_t;
-
-/*
- * csinfo is where connection state info is made available.
- */
-typedef struct csinfo {
-	uintptr_t cs_addr;
-	uint64_t cs_cid;
-} csinfo_t;
-
 /*
  * ipinfo contains common IP info for both IPv4 and IPv6.
  */
diff --git a/dlibs/aarch64/5.16/net.d b/dlibs/aarch64/5.16/net.d
index 6ac34287..f1291696 100644
--- a/dlibs/aarch64/5.16/net.d
+++ b/dlibs/aarch64/5.16/net.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -25,9 +25,36 @@ typedef struct conninfo {
 	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
 } conninfo_t;
 
+/*
+ * For compatibility with Solaris.  Here the netstackid will be the pointer
+ * to the net namespace (nd_net in struct net_device).
+ */
+typedef uint64_t	netstackid_t;
+typedef __be32		ipaddr_t;
+typedef struct in6_addr	in6_addr_t;
+
+/*
+ * pktinfo is where packet ID info can be made available for deeper
+ * analysis if packet IDs become supported by the kernel in the future.
+ * The pkt_addr member is currently always NULL.
+ */
+typedef struct pktinfo {
+	uintptr_t pkt_addr;
+} pktinfo_t;
+
+/*
+ * csinfo is where connection state info is made available.
+ */
+typedef struct csinfo {
+	uintptr_t cs_addr;
+	uint64_t cs_cid;
+} csinfo_t;
+
 /*
  * We use these values to determine if a probe point is associated
- * with sending (outbound) or receiving (inbound).
+ * with sending (outbound) or receiving (inbound) or a state-related
+ * probe (i.e. neither inbound our outbound).
  */
 inline int NET_PROBE_OUTBOUND =		0x00;
 inline int NET_PROBE_INBOUND =		0x01;
+inline int NET_PROBE_STATE =		0x02;
diff --git a/dlibs/aarch64/5.16/tcp.d b/dlibs/aarch64/5.16/tcp.d
index 54e310cb..48d9adb4 100644
--- a/dlibs/aarch64/5.16/tcp.d
+++ b/dlibs/aarch64/5.16/tcp.d
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
diff --git a/dlibs/aarch64/5.2/ip.d b/dlibs/aarch64/5.2/ip.d
index f8b77f12..493b75a0 100644
--- a/dlibs/aarch64/5.2/ip.d
+++ b/dlibs/aarch64/5.2/ip.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
 
 inline int TCP_MIN_HEADER_LENGTH =	20;
 
-/*
- * For compatibility with Solaris.  Here the netstackid will be the pointer
- * to the net namespace (nd_net in struct net_device).
- */
-typedef uint64_t	netstackid_t;
-typedef __be32		ipaddr_t;
-typedef struct in6_addr	in6_addr_t;
-
-/*
- * pktinfo is where packet ID info can be made available for deeper
- * analysis if packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
- */
-typedef struct pktinfo {
-	uintptr_t pkt_addr;
-} pktinfo_t;
-
-/*
- * csinfo is where connection state info is made available.
- */
-typedef struct csinfo {
-	uintptr_t cs_addr;
-	uint64_t cs_cid;
-} csinfo_t;
-
 /*
  * ipinfo contains common IP info for both IPv4 and IPv6.
  */
diff --git a/dlibs/aarch64/5.2/net.d b/dlibs/aarch64/5.2/net.d
index 6ac34287..f1291696 100644
--- a/dlibs/aarch64/5.2/net.d
+++ b/dlibs/aarch64/5.2/net.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -25,9 +25,36 @@ typedef struct conninfo {
 	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
 } conninfo_t;
 
+/*
+ * For compatibility with Solaris.  Here the netstackid will be the pointer
+ * to the net namespace (nd_net in struct net_device).
+ */
+typedef uint64_t	netstackid_t;
+typedef __be32		ipaddr_t;
+typedef struct in6_addr	in6_addr_t;
+
+/*
+ * pktinfo is where packet ID info can be made available for deeper
+ * analysis if packet IDs become supported by the kernel in the future.
+ * The pkt_addr member is currently always NULL.
+ */
+typedef struct pktinfo {
+	uintptr_t pkt_addr;
+} pktinfo_t;
+
+/*
+ * csinfo is where connection state info is made available.
+ */
+typedef struct csinfo {
+	uintptr_t cs_addr;
+	uint64_t cs_cid;
+} csinfo_t;
+
 /*
  * We use these values to determine if a probe point is associated
- * with sending (outbound) or receiving (inbound).
+ * with sending (outbound) or receiving (inbound) or a state-related
+ * probe (i.e. neither inbound our outbound).
  */
 inline int NET_PROBE_OUTBOUND =		0x00;
 inline int NET_PROBE_INBOUND =		0x01;
+inline int NET_PROBE_STATE =		0x02;
diff --git a/dlibs/aarch64/5.2/tcp.d b/dlibs/aarch64/5.2/tcp.d
index 54e310cb..48d9adb4 100644
--- a/dlibs/aarch64/5.2/tcp.d
+++ b/dlibs/aarch64/5.2/tcp.d
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
diff --git a/dlibs/aarch64/5.6/ip.d b/dlibs/aarch64/5.6/ip.d
index f8b77f12..493b75a0 100644
--- a/dlibs/aarch64/5.6/ip.d
+++ b/dlibs/aarch64/5.6/ip.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
 
 inline int TCP_MIN_HEADER_LENGTH =	20;
 
-/*
- * For compatibility with Solaris.  Here the netstackid will be the pointer
- * to the net namespace (nd_net in struct net_device).
- */
-typedef uint64_t	netstackid_t;
-typedef __be32		ipaddr_t;
-typedef struct in6_addr	in6_addr_t;
-
-/*
- * pktinfo is where packet ID info can be made available for deeper
- * analysis if packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
- */
-typedef struct pktinfo {
-	uintptr_t pkt_addr;
-} pktinfo_t;
-
-/*
- * csinfo is where connection state info is made available.
- */
-typedef struct csinfo {
-	uintptr_t cs_addr;
-	uint64_t cs_cid;
-} csinfo_t;
-
 /*
  * ipinfo contains common IP info for both IPv4 and IPv6.
  */
diff --git a/dlibs/aarch64/5.6/net.d b/dlibs/aarch64/5.6/net.d
index 6ac34287..f1291696 100644
--- a/dlibs/aarch64/5.6/net.d
+++ b/dlibs/aarch64/5.6/net.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -25,9 +25,36 @@ typedef struct conninfo {
 	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
 } conninfo_t;
 
+/*
+ * For compatibility with Solaris.  Here the netstackid will be the pointer
+ * to the net namespace (nd_net in struct net_device).
+ */
+typedef uint64_t	netstackid_t;
+typedef __be32		ipaddr_t;
+typedef struct in6_addr	in6_addr_t;
+
+/*
+ * pktinfo is where packet ID info can be made available for deeper
+ * analysis if packet IDs become supported by the kernel in the future.
+ * The pkt_addr member is currently always NULL.
+ */
+typedef struct pktinfo {
+	uintptr_t pkt_addr;
+} pktinfo_t;
+
+/*
+ * csinfo is where connection state info is made available.
+ */
+typedef struct csinfo {
+	uintptr_t cs_addr;
+	uint64_t cs_cid;
+} csinfo_t;
+
 /*
  * We use these values to determine if a probe point is associated
- * with sending (outbound) or receiving (inbound).
+ * with sending (outbound) or receiving (inbound) or a state-related
+ * probe (i.e. neither inbound our outbound).
  */
 inline int NET_PROBE_OUTBOUND =		0x00;
 inline int NET_PROBE_INBOUND =		0x01;
+inline int NET_PROBE_STATE =		0x02;
diff --git a/dlibs/aarch64/5.6/tcp.d b/dlibs/aarch64/5.6/tcp.d
index 54e310cb..48d9adb4 100644
--- a/dlibs/aarch64/5.6/tcp.d
+++ b/dlibs/aarch64/5.6/tcp.d
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
diff --git a/dlibs/aarch64/6.1/ip.d b/dlibs/aarch64/6.1/ip.d
index f8b77f12..493b75a0 100644
--- a/dlibs/aarch64/6.1/ip.d
+++ b/dlibs/aarch64/6.1/ip.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
 
 inline int TCP_MIN_HEADER_LENGTH =	20;
 
-/*
- * For compatibility with Solaris.  Here the netstackid will be the pointer
- * to the net namespace (nd_net in struct net_device).
- */
-typedef uint64_t	netstackid_t;
-typedef __be32		ipaddr_t;
-typedef struct in6_addr	in6_addr_t;
-
-/*
- * pktinfo is where packet ID info can be made available for deeper
- * analysis if packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
- */
-typedef struct pktinfo {
-	uintptr_t pkt_addr;
-} pktinfo_t;
-
-/*
- * csinfo is where connection state info is made available.
- */
-typedef struct csinfo {
-	uintptr_t cs_addr;
-	uint64_t cs_cid;
-} csinfo_t;
-
 /*
  * ipinfo contains common IP info for both IPv4 and IPv6.
  */
diff --git a/dlibs/aarch64/6.1/net.d b/dlibs/aarch64/6.1/net.d
index 6ac34287..f1291696 100644
--- a/dlibs/aarch64/6.1/net.d
+++ b/dlibs/aarch64/6.1/net.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -25,9 +25,36 @@ typedef struct conninfo {
 	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
 } conninfo_t;
 
+/*
+ * For compatibility with Solaris.  Here the netstackid will be the pointer
+ * to the net namespace (nd_net in struct net_device).
+ */
+typedef uint64_t	netstackid_t;
+typedef __be32		ipaddr_t;
+typedef struct in6_addr	in6_addr_t;
+
+/*
+ * pktinfo is where packet ID info can be made available for deeper
+ * analysis if packet IDs become supported by the kernel in the future.
+ * The pkt_addr member is currently always NULL.
+ */
+typedef struct pktinfo {
+	uintptr_t pkt_addr;
+} pktinfo_t;
+
+/*
+ * csinfo is where connection state info is made available.
+ */
+typedef struct csinfo {
+	uintptr_t cs_addr;
+	uint64_t cs_cid;
+} csinfo_t;
+
 /*
  * We use these values to determine if a probe point is associated
- * with sending (outbound) or receiving (inbound).
+ * with sending (outbound) or receiving (inbound) or a state-related
+ * probe (i.e. neither inbound our outbound).
  */
 inline int NET_PROBE_OUTBOUND =		0x00;
 inline int NET_PROBE_INBOUND =		0x01;
+inline int NET_PROBE_STATE =		0x02;
diff --git a/dlibs/aarch64/6.1/tcp.d b/dlibs/aarch64/6.1/tcp.d
index 54e310cb..48d9adb4 100644
--- a/dlibs/aarch64/6.1/tcp.d
+++ b/dlibs/aarch64/6.1/tcp.d
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
diff --git a/dlibs/aarch64/6.10/ip.d b/dlibs/aarch64/6.10/ip.d
index f8b77f12..493b75a0 100644
--- a/dlibs/aarch64/6.10/ip.d
+++ b/dlibs/aarch64/6.10/ip.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
 
 inline int TCP_MIN_HEADER_LENGTH =	20;
 
-/*
- * For compatibility with Solaris.  Here the netstackid will be the pointer
- * to the net namespace (nd_net in struct net_device).
- */
-typedef uint64_t	netstackid_t;
-typedef __be32		ipaddr_t;
-typedef struct in6_addr	in6_addr_t;
-
-/*
- * pktinfo is where packet ID info can be made available for deeper
- * analysis if packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
- */
-typedef struct pktinfo {
-	uintptr_t pkt_addr;
-} pktinfo_t;
-
-/*
- * csinfo is where connection state info is made available.
- */
-typedef struct csinfo {
-	uintptr_t cs_addr;
-	uint64_t cs_cid;
-} csinfo_t;
-
 /*
  * ipinfo contains common IP info for both IPv4 and IPv6.
  */
diff --git a/dlibs/aarch64/6.10/net.d b/dlibs/aarch64/6.10/net.d
index 6ac34287..f1291696 100644
--- a/dlibs/aarch64/6.10/net.d
+++ b/dlibs/aarch64/6.10/net.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -25,9 +25,36 @@ typedef struct conninfo {
 	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
 } conninfo_t;
 
+/*
+ * For compatibility with Solaris.  Here the netstackid will be the pointer
+ * to the net namespace (nd_net in struct net_device).
+ */
+typedef uint64_t	netstackid_t;
+typedef __be32		ipaddr_t;
+typedef struct in6_addr	in6_addr_t;
+
+/*
+ * pktinfo is where packet ID info can be made available for deeper
+ * analysis if packet IDs become supported by the kernel in the future.
+ * The pkt_addr member is currently always NULL.
+ */
+typedef struct pktinfo {
+	uintptr_t pkt_addr;
+} pktinfo_t;
+
+/*
+ * csinfo is where connection state info is made available.
+ */
+typedef struct csinfo {
+	uintptr_t cs_addr;
+	uint64_t cs_cid;
+} csinfo_t;
+
 /*
  * We use these values to determine if a probe point is associated
- * with sending (outbound) or receiving (inbound).
+ * with sending (outbound) or receiving (inbound) or a state-related
+ * probe (i.e. neither inbound our outbound).
  */
 inline int NET_PROBE_OUTBOUND =		0x00;
 inline int NET_PROBE_INBOUND =		0x01;
+inline int NET_PROBE_STATE =		0x02;
diff --git a/dlibs/aarch64/6.10/tcp.d b/dlibs/aarch64/6.10/tcp.d
index 54e310cb..48d9adb4 100644
--- a/dlibs/aarch64/6.10/tcp.d
+++ b/dlibs/aarch64/6.10/tcp.d
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
diff --git a/dlibs/x86_64/5.11/ip.d b/dlibs/x86_64/5.11/ip.d
index f8b77f12..493b75a0 100644
--- a/dlibs/x86_64/5.11/ip.d
+++ b/dlibs/x86_64/5.11/ip.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
 
 inline int TCP_MIN_HEADER_LENGTH =	20;
 
-/*
- * For compatibility with Solaris.  Here the netstackid will be the pointer
- * to the net namespace (nd_net in struct net_device).
- */
-typedef uint64_t	netstackid_t;
-typedef __be32		ipaddr_t;
-typedef struct in6_addr	in6_addr_t;
-
-/*
- * pktinfo is where packet ID info can be made available for deeper
- * analysis if packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
- */
-typedef struct pktinfo {
-	uintptr_t pkt_addr;
-} pktinfo_t;
-
-/*
- * csinfo is where connection state info is made available.
- */
-typedef struct csinfo {
-	uintptr_t cs_addr;
-	uint64_t cs_cid;
-} csinfo_t;
-
 /*
  * ipinfo contains common IP info for both IPv4 and IPv6.
  */
diff --git a/dlibs/x86_64/5.11/net.d b/dlibs/x86_64/5.11/net.d
index 6ac34287..f1291696 100644
--- a/dlibs/x86_64/5.11/net.d
+++ b/dlibs/x86_64/5.11/net.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -25,9 +25,36 @@ typedef struct conninfo {
 	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
 } conninfo_t;
 
+/*
+ * For compatibility with Solaris.  Here the netstackid will be the pointer
+ * to the net namespace (nd_net in struct net_device).
+ */
+typedef uint64_t	netstackid_t;
+typedef __be32		ipaddr_t;
+typedef struct in6_addr	in6_addr_t;
+
+/*
+ * pktinfo is where packet ID info can be made available for deeper
+ * analysis if packet IDs become supported by the kernel in the future.
+ * The pkt_addr member is currently always NULL.
+ */
+typedef struct pktinfo {
+	uintptr_t pkt_addr;
+} pktinfo_t;
+
+/*
+ * csinfo is where connection state info is made available.
+ */
+typedef struct csinfo {
+	uintptr_t cs_addr;
+	uint64_t cs_cid;
+} csinfo_t;
+
 /*
  * We use these values to determine if a probe point is associated
- * with sending (outbound) or receiving (inbound).
+ * with sending (outbound) or receiving (inbound) or a state-related
+ * probe (i.e. neither inbound our outbound).
  */
 inline int NET_PROBE_OUTBOUND =		0x00;
 inline int NET_PROBE_INBOUND =		0x01;
+inline int NET_PROBE_STATE =		0x02;
diff --git a/dlibs/x86_64/5.11/tcp.d b/dlibs/x86_64/5.11/tcp.d
index 54e310cb..48d9adb4 100644
--- a/dlibs/x86_64/5.11/tcp.d
+++ b/dlibs/x86_64/5.11/tcp.d
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
diff --git a/dlibs/x86_64/5.12/ip.d b/dlibs/x86_64/5.12/ip.d
index f8b77f12..493b75a0 100644
--- a/dlibs/x86_64/5.12/ip.d
+++ b/dlibs/x86_64/5.12/ip.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
 
 inline int TCP_MIN_HEADER_LENGTH =	20;
 
-/*
- * For compatibility with Solaris.  Here the netstackid will be the pointer
- * to the net namespace (nd_net in struct net_device).
- */
-typedef uint64_t	netstackid_t;
-typedef __be32		ipaddr_t;
-typedef struct in6_addr	in6_addr_t;
-
-/*
- * pktinfo is where packet ID info can be made available for deeper
- * analysis if packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
- */
-typedef struct pktinfo {
-	uintptr_t pkt_addr;
-} pktinfo_t;
-
-/*
- * csinfo is where connection state info is made available.
- */
-typedef struct csinfo {
-	uintptr_t cs_addr;
-	uint64_t cs_cid;
-} csinfo_t;
-
 /*
  * ipinfo contains common IP info for both IPv4 and IPv6.
  */
diff --git a/dlibs/x86_64/5.12/net.d b/dlibs/x86_64/5.12/net.d
index 6ac34287..f1291696 100644
--- a/dlibs/x86_64/5.12/net.d
+++ b/dlibs/x86_64/5.12/net.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -25,9 +25,36 @@ typedef struct conninfo {
 	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
 } conninfo_t;
 
+/*
+ * For compatibility with Solaris.  Here the netstackid will be the pointer
+ * to the net namespace (nd_net in struct net_device).
+ */
+typedef uint64_t	netstackid_t;
+typedef __be32		ipaddr_t;
+typedef struct in6_addr	in6_addr_t;
+
+/*
+ * pktinfo is where packet ID info can be made available for deeper
+ * analysis if packet IDs become supported by the kernel in the future.
+ * The pkt_addr member is currently always NULL.
+ */
+typedef struct pktinfo {
+	uintptr_t pkt_addr;
+} pktinfo_t;
+
+/*
+ * csinfo is where connection state info is made available.
+ */
+typedef struct csinfo {
+	uintptr_t cs_addr;
+	uint64_t cs_cid;
+} csinfo_t;
+
 /*
  * We use these values to determine if a probe point is associated
- * with sending (outbound) or receiving (inbound).
+ * with sending (outbound) or receiving (inbound) or a state-related
+ * probe (i.e. neither inbound our outbound).
  */
 inline int NET_PROBE_OUTBOUND =		0x00;
 inline int NET_PROBE_INBOUND =		0x01;
+inline int NET_PROBE_STATE =		0x02;
diff --git a/dlibs/x86_64/5.12/tcp.d b/dlibs/x86_64/5.12/tcp.d
index 54e310cb..48d9adb4 100644
--- a/dlibs/x86_64/5.12/tcp.d
+++ b/dlibs/x86_64/5.12/tcp.d
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
diff --git a/dlibs/x86_64/5.14/ip.d b/dlibs/x86_64/5.14/ip.d
index f8b77f12..493b75a0 100644
--- a/dlibs/x86_64/5.14/ip.d
+++ b/dlibs/x86_64/5.14/ip.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
 
 inline int TCP_MIN_HEADER_LENGTH =	20;
 
-/*
- * For compatibility with Solaris.  Here the netstackid will be the pointer
- * to the net namespace (nd_net in struct net_device).
- */
-typedef uint64_t	netstackid_t;
-typedef __be32		ipaddr_t;
-typedef struct in6_addr	in6_addr_t;
-
-/*
- * pktinfo is where packet ID info can be made available for deeper
- * analysis if packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
- */
-typedef struct pktinfo {
-	uintptr_t pkt_addr;
-} pktinfo_t;
-
-/*
- * csinfo is where connection state info is made available.
- */
-typedef struct csinfo {
-	uintptr_t cs_addr;
-	uint64_t cs_cid;
-} csinfo_t;
-
 /*
  * ipinfo contains common IP info for both IPv4 and IPv6.
  */
diff --git a/dlibs/x86_64/5.14/net.d b/dlibs/x86_64/5.14/net.d
index 6ac34287..f1291696 100644
--- a/dlibs/x86_64/5.14/net.d
+++ b/dlibs/x86_64/5.14/net.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -25,9 +25,36 @@ typedef struct conninfo {
 	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
 } conninfo_t;
 
+/*
+ * For compatibility with Solaris.  Here the netstackid will be the pointer
+ * to the net namespace (nd_net in struct net_device).
+ */
+typedef uint64_t	netstackid_t;
+typedef __be32		ipaddr_t;
+typedef struct in6_addr	in6_addr_t;
+
+/*
+ * pktinfo is where packet ID info can be made available for deeper
+ * analysis if packet IDs become supported by the kernel in the future.
+ * The pkt_addr member is currently always NULL.
+ */
+typedef struct pktinfo {
+	uintptr_t pkt_addr;
+} pktinfo_t;
+
+/*
+ * csinfo is where connection state info is made available.
+ */
+typedef struct csinfo {
+	uintptr_t cs_addr;
+	uint64_t cs_cid;
+} csinfo_t;
+
 /*
  * We use these values to determine if a probe point is associated
- * with sending (outbound) or receiving (inbound).
+ * with sending (outbound) or receiving (inbound) or a state-related
+ * probe (i.e. neither inbound our outbound).
  */
 inline int NET_PROBE_OUTBOUND =		0x00;
 inline int NET_PROBE_INBOUND =		0x01;
+inline int NET_PROBE_STATE =		0x02;
diff --git a/dlibs/x86_64/5.14/tcp.d b/dlibs/x86_64/5.14/tcp.d
index 54e310cb..48d9adb4 100644
--- a/dlibs/x86_64/5.14/tcp.d
+++ b/dlibs/x86_64/5.14/tcp.d
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
diff --git a/dlibs/x86_64/5.16/ip.d b/dlibs/x86_64/5.16/ip.d
index f8b77f12..493b75a0 100644
--- a/dlibs/x86_64/5.16/ip.d
+++ b/dlibs/x86_64/5.16/ip.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
 
 inline int TCP_MIN_HEADER_LENGTH =	20;
 
-/*
- * For compatibility with Solaris.  Here the netstackid will be the pointer
- * to the net namespace (nd_net in struct net_device).
- */
-typedef uint64_t	netstackid_t;
-typedef __be32		ipaddr_t;
-typedef struct in6_addr	in6_addr_t;
-
-/*
- * pktinfo is where packet ID info can be made available for deeper
- * analysis if packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
- */
-typedef struct pktinfo {
-	uintptr_t pkt_addr;
-} pktinfo_t;
-
-/*
- * csinfo is where connection state info is made available.
- */
-typedef struct csinfo {
-	uintptr_t cs_addr;
-	uint64_t cs_cid;
-} csinfo_t;
-
 /*
  * ipinfo contains common IP info for both IPv4 and IPv6.
  */
diff --git a/dlibs/x86_64/5.16/net.d b/dlibs/x86_64/5.16/net.d
index 6ac34287..f1291696 100644
--- a/dlibs/x86_64/5.16/net.d
+++ b/dlibs/x86_64/5.16/net.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -25,9 +25,36 @@ typedef struct conninfo {
 	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
 } conninfo_t;
 
+/*
+ * For compatibility with Solaris.  Here the netstackid will be the pointer
+ * to the net namespace (nd_net in struct net_device).
+ */
+typedef uint64_t	netstackid_t;
+typedef __be32		ipaddr_t;
+typedef struct in6_addr	in6_addr_t;
+
+/*
+ * pktinfo is where packet ID info can be made available for deeper
+ * analysis if packet IDs become supported by the kernel in the future.
+ * The pkt_addr member is currently always NULL.
+ */
+typedef struct pktinfo {
+	uintptr_t pkt_addr;
+} pktinfo_t;
+
+/*
+ * csinfo is where connection state info is made available.
+ */
+typedef struct csinfo {
+	uintptr_t cs_addr;
+	uint64_t cs_cid;
+} csinfo_t;
+
 /*
  * We use these values to determine if a probe point is associated
- * with sending (outbound) or receiving (inbound).
+ * with sending (outbound) or receiving (inbound) or a state-related
+ * probe (i.e. neither inbound our outbound).
  */
 inline int NET_PROBE_OUTBOUND =		0x00;
 inline int NET_PROBE_INBOUND =		0x01;
+inline int NET_PROBE_STATE =		0x02;
diff --git a/dlibs/x86_64/5.16/tcp.d b/dlibs/x86_64/5.16/tcp.d
index 54e310cb..48d9adb4 100644
--- a/dlibs/x86_64/5.16/tcp.d
+++ b/dlibs/x86_64/5.16/tcp.d
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
diff --git a/dlibs/x86_64/5.2/ip.d b/dlibs/x86_64/5.2/ip.d
index f8b77f12..493b75a0 100644
--- a/dlibs/x86_64/5.2/ip.d
+++ b/dlibs/x86_64/5.2/ip.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
 
 inline int TCP_MIN_HEADER_LENGTH =	20;
 
-/*
- * For compatibility with Solaris.  Here the netstackid will be the pointer
- * to the net namespace (nd_net in struct net_device).
- */
-typedef uint64_t	netstackid_t;
-typedef __be32		ipaddr_t;
-typedef struct in6_addr	in6_addr_t;
-
-/*
- * pktinfo is where packet ID info can be made available for deeper
- * analysis if packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
- */
-typedef struct pktinfo {
-	uintptr_t pkt_addr;
-} pktinfo_t;
-
-/*
- * csinfo is where connection state info is made available.
- */
-typedef struct csinfo {
-	uintptr_t cs_addr;
-	uint64_t cs_cid;
-} csinfo_t;
-
 /*
  * ipinfo contains common IP info for both IPv4 and IPv6.
  */
diff --git a/dlibs/x86_64/5.2/net.d b/dlibs/x86_64/5.2/net.d
index 6ac34287..f1291696 100644
--- a/dlibs/x86_64/5.2/net.d
+++ b/dlibs/x86_64/5.2/net.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -25,9 +25,36 @@ typedef struct conninfo {
 	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
 } conninfo_t;
 
+/*
+ * For compatibility with Solaris.  Here the netstackid will be the pointer
+ * to the net namespace (nd_net in struct net_device).
+ */
+typedef uint64_t	netstackid_t;
+typedef __be32		ipaddr_t;
+typedef struct in6_addr	in6_addr_t;
+
+/*
+ * pktinfo is where packet ID info can be made available for deeper
+ * analysis if packet IDs become supported by the kernel in the future.
+ * The pkt_addr member is currently always NULL.
+ */
+typedef struct pktinfo {
+	uintptr_t pkt_addr;
+} pktinfo_t;
+
+/*
+ * csinfo is where connection state info is made available.
+ */
+typedef struct csinfo {
+	uintptr_t cs_addr;
+	uint64_t cs_cid;
+} csinfo_t;
+
 /*
  * We use these values to determine if a probe point is associated
- * with sending (outbound) or receiving (inbound).
+ * with sending (outbound) or receiving (inbound) or a state-related
+ * probe (i.e. neither inbound our outbound).
  */
 inline int NET_PROBE_OUTBOUND =		0x00;
 inline int NET_PROBE_INBOUND =		0x01;
+inline int NET_PROBE_STATE =		0x02;
diff --git a/dlibs/x86_64/5.2/tcp.d b/dlibs/x86_64/5.2/tcp.d
index 54e310cb..48d9adb4 100644
--- a/dlibs/x86_64/5.2/tcp.d
+++ b/dlibs/x86_64/5.2/tcp.d
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
diff --git a/dlibs/x86_64/5.6/ip.d b/dlibs/x86_64/5.6/ip.d
index f8b77f12..493b75a0 100644
--- a/dlibs/x86_64/5.6/ip.d
+++ b/dlibs/x86_64/5.6/ip.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
 
 inline int TCP_MIN_HEADER_LENGTH =	20;
 
-/*
- * For compatibility with Solaris.  Here the netstackid will be the pointer
- * to the net namespace (nd_net in struct net_device).
- */
-typedef uint64_t	netstackid_t;
-typedef __be32		ipaddr_t;
-typedef struct in6_addr	in6_addr_t;
-
-/*
- * pktinfo is where packet ID info can be made available for deeper
- * analysis if packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
- */
-typedef struct pktinfo {
-	uintptr_t pkt_addr;
-} pktinfo_t;
-
-/*
- * csinfo is where connection state info is made available.
- */
-typedef struct csinfo {
-	uintptr_t cs_addr;
-	uint64_t cs_cid;
-} csinfo_t;
-
 /*
  * ipinfo contains common IP info for both IPv4 and IPv6.
  */
diff --git a/dlibs/x86_64/5.6/net.d b/dlibs/x86_64/5.6/net.d
index 6ac34287..f1291696 100644
--- a/dlibs/x86_64/5.6/net.d
+++ b/dlibs/x86_64/5.6/net.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -25,9 +25,36 @@ typedef struct conninfo {
 	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
 } conninfo_t;
 
+/*
+ * For compatibility with Solaris.  Here the netstackid will be the pointer
+ * to the net namespace (nd_net in struct net_device).
+ */
+typedef uint64_t	netstackid_t;
+typedef __be32		ipaddr_t;
+typedef struct in6_addr	in6_addr_t;
+
+/*
+ * pktinfo is where packet ID info can be made available for deeper
+ * analysis if packet IDs become supported by the kernel in the future.
+ * The pkt_addr member is currently always NULL.
+ */
+typedef struct pktinfo {
+	uintptr_t pkt_addr;
+} pktinfo_t;
+
+/*
+ * csinfo is where connection state info is made available.
+ */
+typedef struct csinfo {
+	uintptr_t cs_addr;
+	uint64_t cs_cid;
+} csinfo_t;
+
 /*
  * We use these values to determine if a probe point is associated
- * with sending (outbound) or receiving (inbound).
+ * with sending (outbound) or receiving (inbound) or a state-related
+ * probe (i.e. neither inbound our outbound).
  */
 inline int NET_PROBE_OUTBOUND =		0x00;
 inline int NET_PROBE_INBOUND =		0x01;
+inline int NET_PROBE_STATE =		0x02;
diff --git a/dlibs/x86_64/5.6/tcp.d b/dlibs/x86_64/5.6/tcp.d
index 54e310cb..48d9adb4 100644
--- a/dlibs/x86_64/5.6/tcp.d
+++ b/dlibs/x86_64/5.6/tcp.d
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
diff --git a/dlibs/x86_64/6.1/ip.d b/dlibs/x86_64/6.1/ip.d
index f8b77f12..493b75a0 100644
--- a/dlibs/x86_64/6.1/ip.d
+++ b/dlibs/x86_64/6.1/ip.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
 
 inline int TCP_MIN_HEADER_LENGTH =	20;
 
-/*
- * For compatibility with Solaris.  Here the netstackid will be the pointer
- * to the net namespace (nd_net in struct net_device).
- */
-typedef uint64_t	netstackid_t;
-typedef __be32		ipaddr_t;
-typedef struct in6_addr	in6_addr_t;
-
-/*
- * pktinfo is where packet ID info can be made available for deeper
- * analysis if packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
- */
-typedef struct pktinfo {
-	uintptr_t pkt_addr;
-} pktinfo_t;
-
-/*
- * csinfo is where connection state info is made available.
- */
-typedef struct csinfo {
-	uintptr_t cs_addr;
-	uint64_t cs_cid;
-} csinfo_t;
-
 /*
  * ipinfo contains common IP info for both IPv4 and IPv6.
  */
diff --git a/dlibs/x86_64/6.1/net.d b/dlibs/x86_64/6.1/net.d
index 6ac34287..f1291696 100644
--- a/dlibs/x86_64/6.1/net.d
+++ b/dlibs/x86_64/6.1/net.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -25,9 +25,36 @@ typedef struct conninfo {
 	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
 } conninfo_t;
 
+/*
+ * For compatibility with Solaris.  Here the netstackid will be the pointer
+ * to the net namespace (nd_net in struct net_device).
+ */
+typedef uint64_t	netstackid_t;
+typedef __be32		ipaddr_t;
+typedef struct in6_addr	in6_addr_t;
+
+/*
+ * pktinfo is where packet ID info can be made available for deeper
+ * analysis if packet IDs become supported by the kernel in the future.
+ * The pkt_addr member is currently always NULL.
+ */
+typedef struct pktinfo {
+	uintptr_t pkt_addr;
+} pktinfo_t;
+
+/*
+ * csinfo is where connection state info is made available.
+ */
+typedef struct csinfo {
+	uintptr_t cs_addr;
+	uint64_t cs_cid;
+} csinfo_t;
+
 /*
  * We use these values to determine if a probe point is associated
- * with sending (outbound) or receiving (inbound).
+ * with sending (outbound) or receiving (inbound) or a state-related
+ * probe (i.e. neither inbound our outbound).
  */
 inline int NET_PROBE_OUTBOUND =		0x00;
 inline int NET_PROBE_INBOUND =		0x01;
+inline int NET_PROBE_STATE =		0x02;
diff --git a/dlibs/x86_64/6.1/tcp.d b/dlibs/x86_64/6.1/tcp.d
index 54e310cb..48d9adb4 100644
--- a/dlibs/x86_64/6.1/tcp.d
+++ b/dlibs/x86_64/6.1/tcp.d
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
diff --git a/dlibs/x86_64/6.10/ip.d b/dlibs/x86_64/6.10/ip.d
index f8b77f12..493b75a0 100644
--- a/dlibs/x86_64/6.10/ip.d
+++ b/dlibs/x86_64/6.10/ip.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
 
 inline int TCP_MIN_HEADER_LENGTH =	20;
 
-/*
- * For compatibility with Solaris.  Here the netstackid will be the pointer
- * to the net namespace (nd_net in struct net_device).
- */
-typedef uint64_t	netstackid_t;
-typedef __be32		ipaddr_t;
-typedef struct in6_addr	in6_addr_t;
-
-/*
- * pktinfo is where packet ID info can be made available for deeper
- * analysis if packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
- */
-typedef struct pktinfo {
-	uintptr_t pkt_addr;
-} pktinfo_t;
-
-/*
- * csinfo is where connection state info is made available.
- */
-typedef struct csinfo {
-	uintptr_t cs_addr;
-	uint64_t cs_cid;
-} csinfo_t;
-
 /*
  * ipinfo contains common IP info for both IPv4 and IPv6.
  */
diff --git a/dlibs/x86_64/6.10/net.d b/dlibs/x86_64/6.10/net.d
index 6ac34287..f1291696 100644
--- a/dlibs/x86_64/6.10/net.d
+++ b/dlibs/x86_64/6.10/net.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -25,9 +25,36 @@ typedef struct conninfo {
 	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
 } conninfo_t;
 
+/*
+ * For compatibility with Solaris.  Here the netstackid will be the pointer
+ * to the net namespace (nd_net in struct net_device).
+ */
+typedef uint64_t	netstackid_t;
+typedef __be32		ipaddr_t;
+typedef struct in6_addr	in6_addr_t;
+
+/*
+ * pktinfo is where packet ID info can be made available for deeper
+ * analysis if packet IDs become supported by the kernel in the future.
+ * The pkt_addr member is currently always NULL.
+ */
+typedef struct pktinfo {
+	uintptr_t pkt_addr;
+} pktinfo_t;
+
+/*
+ * csinfo is where connection state info is made available.
+ */
+typedef struct csinfo {
+	uintptr_t cs_addr;
+	uint64_t cs_cid;
+} csinfo_t;
+
 /*
  * We use these values to determine if a probe point is associated
- * with sending (outbound) or receiving (inbound).
+ * with sending (outbound) or receiving (inbound) or a state-related
+ * probe (i.e. neither inbound our outbound).
  */
 inline int NET_PROBE_OUTBOUND =		0x00;
 inline int NET_PROBE_INBOUND =		0x01;
+inline int NET_PROBE_STATE =		0x02;
diff --git a/dlibs/x86_64/6.10/tcp.d b/dlibs/x86_64/6.10/tcp.d
index 54e310cb..48d9adb4 100644
--- a/dlibs/x86_64/6.10/tcp.d
+++ b/dlibs/x86_64/6.10/tcp.d
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
2.43.5

