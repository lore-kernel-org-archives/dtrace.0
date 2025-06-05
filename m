Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4160B1B4240
	for <dtrace@lists.linux.dev>; Thu,  5 Jun 2025 21:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749159231; cv=none; b=fI4H15uOg/EIk7NoeVm0mYkvoI25LwzHBVH/zeei7xgf6rWTWOGdZkv4ypAwBLmlJpSaJBBODE51cAK7HT9leT3+gvnap9VjP4wuIjMLOuM0eXTlE693AdINtp4OXGjtPCpaAUV/6B1ksxpJM/jr7BZG37Slr5BH/LrTY+wX38s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749159231; c=relaxed/simple;
	bh=4dAQDxGEU7vDy28LusH0te4WmTR/0MsHWn/++BcksnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xht9x1cuLXaAUViJcY5cC378SU7edDPiaVEoTlRV4ovcSN4ly/QKn8mdZFwKFlubXjJ56xqrryV6EgMTr4yYNo1n9bUDfBxrObvdsWjLtDONXY8RcrKlyR1DoziuMCBtDxzgNG/M/Pls6c4A7uZ2/Ge7fsHOIoC1+la8EdXw/xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EBdGWIGS; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EBdGWIGS"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555KvrCR015204
	for <dtrace@lists.linux.dev>; Thu, 5 Jun 2025 21:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=TA77Z
	MFoNCaF0K/XHWsxWC6m9WxVRlpzGtmVdJfesEg=; b=EBdGWIGSep0cCztH0jbbH
	Ni5DB0eUgAJBIUnIOEcyBdyzkR65/nRE1d+GCYlZWfBiXE7r3ZSgkhx5C1rj9kUw
	v+taIiCn3H/M6AvkMMc2+b9Ha4AOkawbuffLRWT5zk9bQCsMJDyJeG+f6f5sHDkK
	Od+wqSePqPKN1t1I2sLxLn5YDootVSEWViib5jsRkqnSjRYJgui99yuVf9719SzJ
	Fz52QXQjfw4rlj8FyRrg77N2UXXbIhAh5tKc1dsjVl4tkdliPt4P9FKZoW0XPK5Q
	jaxTsBL5HJdle74NzaaPuOVCUeT6Im7Axpjg2Bg3kM5ELTWm1Y/Pi25NzqyCuTKJ
	A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8cy0he-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Jun 2025 21:33:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 555LJhBi030799
	for <dtrace@lists.linux.dev>; Thu, 5 Jun 2025 21:33:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7ckms2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Jun 2025 21:33:45 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 555LXHv5037398
	for <dtrace@lists.linux.dev>; Thu, 5 Jun 2025 21:33:45 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-51-236.vpn.oracle.com [10.154.51.236])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 46yr7ckmq6-3;
	Thu, 05 Jun 2025 21:33:44 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [RFC 2/2] dtrace: sync dlibs with tcp.d, ip.d and net.d changes
Date: Thu,  5 Jun 2025 22:33:41 +0100
Message-ID: <20250605213341.1410405-3-alan.maguire@oracle.com>
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
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=951
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506050194
X-Proofpoint-GUID: MTShM4VsDsANsdI8toe20tiZyI3ioL3J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE5NCBTYWx0ZWRfX8EFItT0/vrJ6 voQtFiUjMRSWwyvARYV2Ulwbsn45z+e5R1cyeqExeZuF0RcefHnt4pnhOPSIBuIWWtH+imEBo5i WOLClQCXNJTAZXrgJ3/L3YPGGb6vpy0aqU7/0tyNUoyjXW0Re2BssGG+3Odjd2Qb35gi+s8pY7J
 QTKIBz15KOQnopfIJeFD4A7p4EYcpTpLvirA6sNKtD1XZplT8iVDTwqH41p88DiAKT5zX4txJfb JzOJGDbyVLsswpdNve00AROJZXc0tIxP7SP6TagaEFOrRzdmj+73WJfEYjocHbzdWHWas+C87zg c8/YvLAB42XAYmbU+iNPBPJPFzcElYoJOHhhK8kVW8qK2L23pB0t1TdSie/+SMLDaof9Wzy9gzf
 FPd+EBLfU9KDr0Uev+Kkr4M3SYAOqcvp8KwU6hrLQBq6HIimU1Np0ZdOgpHzUMNHYXNavw5a
X-Authority-Analysis: v=2.4 cv=KaTSsRYD c=1 sm=1 tr=0 ts=68420d3b b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=AoaZgczik7lq2bnRj1cA:9 cc=ntf awl=host:14714
X-Proofpoint-ORIG-GUID: MTShM4VsDsANsdI8toe20tiZyI3ioL3J

As part of adding tcp provider tcp.d, ip.d and net.d were changed;
sync the version-specific dlibs.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 dlibs/aarch64/5.14/ip.d  |  1 -
 dlibs/aarch64/5.14/net.d |  6 +++++-
 dlibs/aarch64/5.14/tcp.d | 43 +++++++++++++++++++++-------------------
 dlibs/aarch64/5.16/ip.d  |  1 -
 dlibs/aarch64/5.16/net.d |  6 +++++-
 dlibs/aarch64/5.16/tcp.d | 43 +++++++++++++++++++++-------------------
 dlibs/aarch64/6.1/ip.d   |  1 -
 dlibs/aarch64/6.1/net.d  |  6 +++++-
 dlibs/aarch64/6.1/tcp.d  | 43 +++++++++++++++++++++-------------------
 dlibs/aarch64/6.10/ip.d  |  1 -
 dlibs/aarch64/6.10/net.d |  6 +++++-
 dlibs/aarch64/6.10/tcp.d | 43 +++++++++++++++++++++-------------------
 dlibs/x86_64/5.14/ip.d   |  1 -
 dlibs/x86_64/5.14/net.d  |  6 +++++-
 dlibs/x86_64/5.14/tcp.d  | 43 +++++++++++++++++++++-------------------
 dlibs/x86_64/5.16/ip.d   |  1 -
 dlibs/x86_64/5.16/net.d  |  6 +++++-
 dlibs/x86_64/5.16/tcp.d  | 43 +++++++++++++++++++++-------------------
 dlibs/x86_64/6.1/ip.d    |  1 -
 dlibs/x86_64/6.1/net.d   |  6 +++++-
 dlibs/x86_64/6.1/tcp.d   | 43 +++++++++++++++++++++-------------------
 dlibs/x86_64/6.10/ip.d   |  1 -
 dlibs/x86_64/6.10/net.d  |  6 +++++-
 dlibs/x86_64/6.10/tcp.d  | 43 +++++++++++++++++++++-------------------
 24 files changed, 224 insertions(+), 176 deletions(-)

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
index 54e310cb..97c00191 100644
--- a/dlibs/aarch64/5.14/tcp.d
+++ b/dlibs/aarch64/5.14/tcp.d
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
index 54e310cb..97c00191 100644
--- a/dlibs/aarch64/5.16/tcp.d
+++ b/dlibs/aarch64/5.16/tcp.d
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
index 54e310cb..97c00191 100644
--- a/dlibs/aarch64/6.1/tcp.d
+++ b/dlibs/aarch64/6.1/tcp.d
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
index 54e310cb..97c00191 100644
--- a/dlibs/aarch64/6.10/tcp.d
+++ b/dlibs/aarch64/6.10/tcp.d
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
index 54e310cb..97c00191 100644
--- a/dlibs/x86_64/5.14/tcp.d
+++ b/dlibs/x86_64/5.14/tcp.d
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
index 54e310cb..97c00191 100644
--- a/dlibs/x86_64/5.16/tcp.d
+++ b/dlibs/x86_64/5.16/tcp.d
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
index 54e310cb..97c00191 100644
--- a/dlibs/x86_64/6.1/tcp.d
+++ b/dlibs/x86_64/6.1/tcp.d
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
index 54e310cb..97c00191 100644
--- a/dlibs/x86_64/6.10/tcp.d
+++ b/dlibs/x86_64/6.10/tcp.d
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

