Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD2229614C
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 13:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563904; cv=none; b=W91Czh9tpJfzd6YP3I7UEe8Yq5oVE6b85eoguhR+S1byTRjHN3UeeTRfchewf98zg34GnA5FhPPK3YnadLgboqFsRPcFKmgj/Pu9xdo0D5TxHnyqWoINPjCYnU88K2YMCNXFzHl3V/0qkaghYgmlXL9H4IlSPWaZmbAYhz4nQ/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563904; c=relaxed/simple;
	bh=Nr1DsBHRqn0vEaJxLKmQZt0uT6NxaBa7XcYZVoCutl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eB+YzItNYpMMOl04xTn4Gq7+6xZOVazJe7tFwsni+6uZN00/hBBtynUchtrCk2Jx16EU7jQhB2gIzRuEWOLLgZzFf8YLnFVs4UYrbu3jLOOhooKF3LbMvB4zbUW1wySljeRH1R8v84zkSw57USfTNphU9jbkXgfRFzIrz+v6vjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GSyfYHQB; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GSyfYHQB"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ADC354031794
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 13:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=5mj3r
	sjYyXsvK3uTtPDMzy4hPPjw65COan0slBAAjno=; b=GSyfYHQBlUfy3XrmeK0OO
	5vNQUvsq02Wn5XDs9LrqixQC1dgt6qtc7oLfBi8l8vKSCV5Xpbn1/rWzxzj9T0Zq
	DH6Q4vI9x8lU4OXxY1zf4wcfMiLapaBSeVyHXvtprhNHsvdEEwdwHP4hTZWELyt2
	HmIeIBeBGZqdYS2jGtyIU3kjxXQQ5Mi6+KmvDdSrJpW1MRC78XwxsijQ0Vy3i1ZL
	Bq+YrHXHxwUi2eK3TRgPMzCNMdc5RarTG22xhz+9jrHbzO/SfBie0zz9/3op36Fp
	Nk2p/aOTm9zUytZV1JJR3AWPV+ScSSOnn4YN3zrKSh4Ek7bKP8ttRQBS5DsKVinb
	A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4752xjup7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 13:58:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55ADGv9x003893
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 13:58:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv8s9jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 13:58:19 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55ADwEln009385
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 13:58:18 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-54-217.vpn.oracle.com [10.154.54.217])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 474bv8s9f6-5;
	Tue, 10 Jun 2025 13:58:18 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2 4/4] dtrace: sync dlibs with tcp.d, ip.d and net.d changes
Date: Tue, 10 Jun 2025 14:58:13 +0100
Message-ID: <20250610135813.15746-5-alan.maguire@oracle.com>
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
 mlxlogscore=956 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506100110
X-Authority-Analysis: v=2.4 cv=K4AiHzWI c=1 sm=1 tr=0 ts=684839fb b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=GI9oEGFv0F0OguADOJ0A:9 cc=ntf awl=host:14714
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDExMCBTYWx0ZWRfXwtLD7+UR8VKP sizzL8z0r9jB8cum3KwjYjJCsmJ00t/rL/Ex64++lPt3fa5jXb1LmvpSak8NGe3L9FOH8ZthW2V zpwYacc4ejFgMbOm6iZhKzK3b9Aex5oO2oow/KkcUtlidb2znyzrxjGjPEj4fU8wD00LAELVHtV
 yL0vvuAbIbdNf3ERWnHaWaM7qCncwVc6HyLE6SzhFLzUreHoAksukWrzZ4ZWZ8xJ/MP1w7Y18pV tyQBMYbLU74jc4bzqfDIfCapYzjyV5BhZOt6bHy0Tu6EzIqul5WkVK1WZlNWvuLujgn/alNinMU gGnhTLnp0Gq680ooqS73iFAfFIo7hRUu8PYu7YpH5idYdWzVAXRUrP624e22w27z8Kgfd1RA5T2
 B1xrK9WF6lUBwQALEHlKsipU3BWQdTbdlMeiakJ5gaVEtwqIrN2KwnK8LSwwQ77G1ODMeZga
X-Proofpoint-ORIG-GUID: 4ceJTOioxFNnVKGuNSQrsBnfmOikAvk-
X-Proofpoint-GUID: 4ceJTOioxFNnVKGuNSQrsBnfmOikAvk-

As part of adding tcp provider tcp.d, ip.d and net.d were changed;
sync the version-specific dlibs.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 dlibs/aarch64/5.14/ip.d  |  1 -
 dlibs/aarch64/5.14/net.d |  6 ++++-
 dlibs/aarch64/5.14/tcp.d | 52 ++++++++++++++++++++++------------------
 dlibs/aarch64/5.16/ip.d  |  1 -
 dlibs/aarch64/5.16/net.d |  6 ++++-
 dlibs/aarch64/5.16/tcp.d | 52 ++++++++++++++++++++++------------------
 dlibs/aarch64/6.1/ip.d   |  1 -
 dlibs/aarch64/6.1/net.d  |  6 ++++-
 dlibs/aarch64/6.1/tcp.d  | 52 ++++++++++++++++++++++------------------
 dlibs/aarch64/6.10/ip.d  |  1 -
 dlibs/aarch64/6.10/net.d |  6 ++++-
 dlibs/aarch64/6.10/tcp.d | 52 ++++++++++++++++++++++------------------
 dlibs/x86_64/5.14/ip.d   |  1 -
 dlibs/x86_64/5.14/net.d  |  6 ++++-
 dlibs/x86_64/5.14/tcp.d  | 52 ++++++++++++++++++++++------------------
 dlibs/x86_64/5.16/ip.d   |  1 -
 dlibs/x86_64/5.16/net.d  |  6 ++++-
 dlibs/x86_64/5.16/tcp.d  | 52 ++++++++++++++++++++++------------------
 dlibs/x86_64/6.1/ip.d    |  1 -
 dlibs/x86_64/6.1/net.d   |  6 ++++-
 dlibs/x86_64/6.1/tcp.d   | 52 ++++++++++++++++++++++------------------
 dlibs/x86_64/6.10/ip.d   |  1 -
 dlibs/x86_64/6.10/net.d  |  6 ++++-
 dlibs/x86_64/6.10/tcp.d  | 52 ++++++++++++++++++++++------------------
 24 files changed, 272 insertions(+), 200 deletions(-)

diff --git a/dlibs/aarch64/5.14/ip.d b/dlibs/aarch64/5.14/ip.d
index f8b77f12..d59bb436 100644
--- a/dlibs/aarch64/5.14/ip.d
+++ b/dlibs/aarch64/5.14/ip.d
@@ -51,7 +51,6 @@ inline int TCP_MIN_HEADER_LENGTH =	20;
  * to the net namespace (nd_net in struct net_device).
  */
 typedef uint64_t	netstackid_t;
-typedef __be32		ipaddr_t;
 typedef struct in6_addr	in6_addr_t;
 
 /*
diff --git a/dlibs/aarch64/5.14/net.d b/dlibs/aarch64/5.14/net.d
index 6ac34287..45b5cba3 100644
--- a/dlibs/aarch64/5.14/net.d
+++ b/dlibs/aarch64/5.14/net.d
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
diff --git a/dlibs/aarch64/5.14/tcp.d b/dlibs/aarch64/5.14/tcp.d
index 54e310cb..d4beea87 100644
--- a/dlibs/aarch64/5.14/tcp.d
+++ b/dlibs/aarch64/5.14/tcp.d
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
diff --git a/dlibs/aarch64/5.16/ip.d b/dlibs/aarch64/5.16/ip.d
index f8b77f12..d59bb436 100644
--- a/dlibs/aarch64/5.16/ip.d
+++ b/dlibs/aarch64/5.16/ip.d
@@ -51,7 +51,6 @@ inline int TCP_MIN_HEADER_LENGTH =	20;
  * to the net namespace (nd_net in struct net_device).
  */
 typedef uint64_t	netstackid_t;
-typedef __be32		ipaddr_t;
 typedef struct in6_addr	in6_addr_t;
 
 /*
diff --git a/dlibs/aarch64/5.16/net.d b/dlibs/aarch64/5.16/net.d
index 6ac34287..45b5cba3 100644
--- a/dlibs/aarch64/5.16/net.d
+++ b/dlibs/aarch64/5.16/net.d
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
diff --git a/dlibs/aarch64/5.16/tcp.d b/dlibs/aarch64/5.16/tcp.d
index 54e310cb..d4beea87 100644
--- a/dlibs/aarch64/5.16/tcp.d
+++ b/dlibs/aarch64/5.16/tcp.d
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
diff --git a/dlibs/aarch64/6.1/ip.d b/dlibs/aarch64/6.1/ip.d
index f8b77f12..d59bb436 100644
--- a/dlibs/aarch64/6.1/ip.d
+++ b/dlibs/aarch64/6.1/ip.d
@@ -51,7 +51,6 @@ inline int TCP_MIN_HEADER_LENGTH =	20;
  * to the net namespace (nd_net in struct net_device).
  */
 typedef uint64_t	netstackid_t;
-typedef __be32		ipaddr_t;
 typedef struct in6_addr	in6_addr_t;
 
 /*
diff --git a/dlibs/aarch64/6.1/net.d b/dlibs/aarch64/6.1/net.d
index 6ac34287..45b5cba3 100644
--- a/dlibs/aarch64/6.1/net.d
+++ b/dlibs/aarch64/6.1/net.d
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
diff --git a/dlibs/aarch64/6.1/tcp.d b/dlibs/aarch64/6.1/tcp.d
index 54e310cb..d4beea87 100644
--- a/dlibs/aarch64/6.1/tcp.d
+++ b/dlibs/aarch64/6.1/tcp.d
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
diff --git a/dlibs/aarch64/6.10/ip.d b/dlibs/aarch64/6.10/ip.d
index f8b77f12..d59bb436 100644
--- a/dlibs/aarch64/6.10/ip.d
+++ b/dlibs/aarch64/6.10/ip.d
@@ -51,7 +51,6 @@ inline int TCP_MIN_HEADER_LENGTH =	20;
  * to the net namespace (nd_net in struct net_device).
  */
 typedef uint64_t	netstackid_t;
-typedef __be32		ipaddr_t;
 typedef struct in6_addr	in6_addr_t;
 
 /*
diff --git a/dlibs/aarch64/6.10/net.d b/dlibs/aarch64/6.10/net.d
index 6ac34287..45b5cba3 100644
--- a/dlibs/aarch64/6.10/net.d
+++ b/dlibs/aarch64/6.10/net.d
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
diff --git a/dlibs/aarch64/6.10/tcp.d b/dlibs/aarch64/6.10/tcp.d
index 54e310cb..d4beea87 100644
--- a/dlibs/aarch64/6.10/tcp.d
+++ b/dlibs/aarch64/6.10/tcp.d
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
diff --git a/dlibs/x86_64/5.14/ip.d b/dlibs/x86_64/5.14/ip.d
index f8b77f12..d59bb436 100644
--- a/dlibs/x86_64/5.14/ip.d
+++ b/dlibs/x86_64/5.14/ip.d
@@ -51,7 +51,6 @@ inline int TCP_MIN_HEADER_LENGTH =	20;
  * to the net namespace (nd_net in struct net_device).
  */
 typedef uint64_t	netstackid_t;
-typedef __be32		ipaddr_t;
 typedef struct in6_addr	in6_addr_t;
 
 /*
diff --git a/dlibs/x86_64/5.14/net.d b/dlibs/x86_64/5.14/net.d
index 6ac34287..45b5cba3 100644
--- a/dlibs/x86_64/5.14/net.d
+++ b/dlibs/x86_64/5.14/net.d
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
diff --git a/dlibs/x86_64/5.14/tcp.d b/dlibs/x86_64/5.14/tcp.d
index 54e310cb..d4beea87 100644
--- a/dlibs/x86_64/5.14/tcp.d
+++ b/dlibs/x86_64/5.14/tcp.d
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
diff --git a/dlibs/x86_64/5.16/ip.d b/dlibs/x86_64/5.16/ip.d
index f8b77f12..d59bb436 100644
--- a/dlibs/x86_64/5.16/ip.d
+++ b/dlibs/x86_64/5.16/ip.d
@@ -51,7 +51,6 @@ inline int TCP_MIN_HEADER_LENGTH =	20;
  * to the net namespace (nd_net in struct net_device).
  */
 typedef uint64_t	netstackid_t;
-typedef __be32		ipaddr_t;
 typedef struct in6_addr	in6_addr_t;
 
 /*
diff --git a/dlibs/x86_64/5.16/net.d b/dlibs/x86_64/5.16/net.d
index 6ac34287..45b5cba3 100644
--- a/dlibs/x86_64/5.16/net.d
+++ b/dlibs/x86_64/5.16/net.d
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
diff --git a/dlibs/x86_64/5.16/tcp.d b/dlibs/x86_64/5.16/tcp.d
index 54e310cb..d4beea87 100644
--- a/dlibs/x86_64/5.16/tcp.d
+++ b/dlibs/x86_64/5.16/tcp.d
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
diff --git a/dlibs/x86_64/6.1/ip.d b/dlibs/x86_64/6.1/ip.d
index f8b77f12..d59bb436 100644
--- a/dlibs/x86_64/6.1/ip.d
+++ b/dlibs/x86_64/6.1/ip.d
@@ -51,7 +51,6 @@ inline int TCP_MIN_HEADER_LENGTH =	20;
  * to the net namespace (nd_net in struct net_device).
  */
 typedef uint64_t	netstackid_t;
-typedef __be32		ipaddr_t;
 typedef struct in6_addr	in6_addr_t;
 
 /*
diff --git a/dlibs/x86_64/6.1/net.d b/dlibs/x86_64/6.1/net.d
index 6ac34287..45b5cba3 100644
--- a/dlibs/x86_64/6.1/net.d
+++ b/dlibs/x86_64/6.1/net.d
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
diff --git a/dlibs/x86_64/6.1/tcp.d b/dlibs/x86_64/6.1/tcp.d
index 54e310cb..d4beea87 100644
--- a/dlibs/x86_64/6.1/tcp.d
+++ b/dlibs/x86_64/6.1/tcp.d
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
diff --git a/dlibs/x86_64/6.10/ip.d b/dlibs/x86_64/6.10/ip.d
index f8b77f12..d59bb436 100644
--- a/dlibs/x86_64/6.10/ip.d
+++ b/dlibs/x86_64/6.10/ip.d
@@ -51,7 +51,6 @@ inline int TCP_MIN_HEADER_LENGTH =	20;
  * to the net namespace (nd_net in struct net_device).
  */
 typedef uint64_t	netstackid_t;
-typedef __be32		ipaddr_t;
 typedef struct in6_addr	in6_addr_t;
 
 /*
diff --git a/dlibs/x86_64/6.10/net.d b/dlibs/x86_64/6.10/net.d
index 6ac34287..45b5cba3 100644
--- a/dlibs/x86_64/6.10/net.d
+++ b/dlibs/x86_64/6.10/net.d
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
diff --git a/dlibs/x86_64/6.10/tcp.d b/dlibs/x86_64/6.10/tcp.d
index 54e310cb..d4beea87 100644
--- a/dlibs/x86_64/6.10/tcp.d
+++ b/dlibs/x86_64/6.10/tcp.d
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

