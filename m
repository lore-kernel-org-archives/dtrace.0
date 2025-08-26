Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6835929BDB6
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 13:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756213931; cv=none; b=j9uUwvgzA9wnufKf84iRIYVv3My6P6c8XT8D2CjDotzvvQu/ndYlWqQPPCgu4R1XIiV3zYvOuFekFNN2FroqJ0w59qgzBKFIl8/JYRmUcjgZvQ22lNUawdc6na/GpOqHIhphpVDx7AL5jChC9JOdwV4QR6MHBiiH1afBT3NxIUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756213931; c=relaxed/simple;
	bh=tm59q/SsOoUKjSDtGkvIfAeQ6iOvtOlF3aHjjz58K8o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jmr+cHmKUo9gTWe1InWYhA1x0ujpZVFFmw4xvbSJ5kn0RcHmETatMmdRo09CRAu593hIlVEq5+FdS1faSH6D3kV8z+cRsdDt2tzJ1MGtYFZrniw9ThjhnD+sBpauTwmSLcw4rDcH2lGVzc1TqDKrpHbBhHkPDpg7U34LmzCR6yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=k58yGNCc; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="k58yGNCc"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QCGvmH022280
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 13:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=Ao33rfR9nHa2oue4ox5UkPzSl7kAa
	d7ntlZEQtdZEPc=; b=k58yGNCcGzZ8O6MreeMgkZSdx12WLrGVDyZvwQDft8Qnx
	DNezFIgtG8gfDPUzkCl18uDJbBgpwshLKsFKuIE+wvSBvuHuFDKgdBKoEVbARlTl
	IDkv10xVPDxzToGw/Hq6aZhDpY2px5e6+udssXJfujuzyAC0mpeY7z12oYzcC/ZZ
	qIZq8kVPU5amoiy6AzY9zzIK3CcbnKfr44YBjD+1SxYee3FAFY1llHFi/miVfmZ+
	NA4qKyaEaLPtKIpdzaQov+UwO/mbFpjxnEb8F8W7oe/YI8Q5lmxr0XKhTzlqs1Dw
	LHzL0oIUQNS9ihgZf6uBMVy7h8WZOuzdS1FeUHyxg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q678vcsp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 13:12:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57QBF3oP005049
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 13:12:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48qj89rych-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 13:12:04 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57QDC3Vw006663
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 13:12:03 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-57-105.vpn.oracle.com [10.154.57.105])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 48qj89rybb-1;
	Tue, 26 Aug 2025 13:12:03 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>,
        Eugene Loh <eugene.loh@oracle.com>
Subject: [PATCH] tcp provider: support tcp:::accept-established in absence of skb
Date: Tue, 26 Aug 2025 14:12:02 +0100
Message-ID: <20250826131202.632027-1-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2508260115
X-Proofpoint-GUID: 2H7AdJzF5z6Iz9hgxR8jnAbMpuZ3rD_U
X-Proofpoint-ORIG-GUID: 2H7AdJzF5z6Iz9hgxR8jnAbMpuZ3rD_U
X-Authority-Analysis: v=2.4 cv=NrLRc9dJ c=1 sm=1 tr=0 ts=68adb2a6 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=2OwXVqhp2XgA:10 a=yPCof4ZbAAAA:8 a=SABcxCR_ejh6aFv60_gA:9
 a=x6-yGuKwGvF0zPjG:21 cc=ntf awl=host:12068
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNSBTYWx0ZWRfX4swjft+yWZGG
 k5NjePEkBWBm6wayYYS6CHRPwEM0eQ9HSvhnj9Yglt7y+669VhII9B0zAFDzsxZjp5tpQfAzpRH
 Svvry9DhmdlzeO1rOuPobBGjpW1iKf+DIAY594whtRLJY/mqz+SsrOpcjzqnWX/LXjaltZxOkS5
 hgHfKnf+nqotTaxMxmPoBnZbzzN2QDdDimo6HFkm9zBi897LTulLVUezGXYlVSCyokEXj2heRFp
 Ox9hjmfl+BE4gpddFFH1wF1DPBasnAw9MzcADQMugX85ycGIWdM+HEnntHnVndX+bP0S1kEWy7n
 ShbfoSgNs4V/n5mmSbbqKjTIRqm5R99BSd/gO1Kx+nC7JvcvbOUNQCNIJaVUoi3+ct+1hRqIEtH
 Howd80vvS99Ouy5Id6tpTqo5KzFvhA==

On a 5.4 kernel, the function we instrument for tcp:::accept-established
(tcp_init_transfer()) does not have a struct sk_buff * as argument;
that does not appear until 5.10.  As a result we need to fake up
the IP and TCP headers from the TCP socket.  We can reuse existing
code (ensuring to mark accept-established correctly as an _INBOUND
probe) once we fix up references in ip.d to be arg6 and not arg7 (this
parameter is used to mark a probe point as inbound, outbound or as a
state change).  We need to ensure that args[2] is translated from
a __dtrace_tcp_void_ip_t * to get this to work for the IP header.

For the TCP header we need a similar solution; add a
__dtrace_tcp_void_tcp_t type and translate from either the tcp header
passed in (if non-null) or use arg3 (the socket) to fill out the TCP
header info.  We can get the ports, seq/ack and because we know that
only accept-established is used we know the flags will just be an
ACK.

With this in place (along with previous fixes for the TCP provider)
the TCP state-related tests finally pass on a 5.4 kernel.

Reported-by: Eugene Loh <eugene.loh@oracle.com>
Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 dlibs/aarch64/5.11/ip.d  | 12 +++---
 dlibs/aarch64/5.11/tcp.d | 34 +++++++++++++++-
 dlibs/aarch64/5.12/ip.d  | 12 +++---
 dlibs/aarch64/5.12/tcp.d | 34 +++++++++++++++-
 dlibs/aarch64/5.14/ip.d  | 12 +++---
 dlibs/aarch64/5.14/tcp.d | 34 +++++++++++++++-
 dlibs/aarch64/5.16/ip.d  | 12 +++---
 dlibs/aarch64/5.16/tcp.d | 34 +++++++++++++++-
 dlibs/aarch64/5.2/ip.d   | 12 +++---
 dlibs/aarch64/5.2/tcp.d  | 34 +++++++++++++++-
 dlibs/aarch64/5.6/ip.d   | 12 +++---
 dlibs/aarch64/5.6/tcp.d  | 34 +++++++++++++++-
 dlibs/aarch64/6.1/ip.d   | 12 +++---
 dlibs/aarch64/6.1/tcp.d  | 34 +++++++++++++++-
 dlibs/aarch64/6.10/ip.d  | 12 +++---
 dlibs/aarch64/6.10/tcp.d | 34 +++++++++++++++-
 dlibs/x86_64/5.11/ip.d   | 12 +++---
 dlibs/x86_64/5.11/tcp.d  | 34 +++++++++++++++-
 dlibs/x86_64/5.12/ip.d   | 12 +++---
 dlibs/x86_64/5.12/tcp.d  | 34 +++++++++++++++-
 dlibs/x86_64/5.14/ip.d   | 12 +++---
 dlibs/x86_64/5.14/tcp.d  | 34 +++++++++++++++-
 dlibs/x86_64/5.16/ip.d   | 12 +++---
 dlibs/x86_64/5.16/tcp.d  | 34 +++++++++++++++-
 dlibs/x86_64/5.2/ip.d    | 12 +++---
 dlibs/x86_64/5.2/tcp.d   | 34 +++++++++++++++-
 dlibs/x86_64/5.6/ip.d    | 12 +++---
 dlibs/x86_64/5.6/tcp.d   | 34 +++++++++++++++-
 dlibs/x86_64/6.1/ip.d    | 12 +++---
 dlibs/x86_64/6.1/tcp.d   | 34 +++++++++++++++-
 dlibs/x86_64/6.10/ip.d   | 12 +++---
 dlibs/x86_64/6.10/tcp.d  | 34 +++++++++++++++-
 libdtrace/dt_prov_tcp.c  | 85 ++++++++++++++++++++++++----------------
 libdtrace/ip.d           | 12 +++---
 libdtrace/tcp.d          | 34 +++++++++++++++-
 35 files changed, 698 insertions(+), 169 deletions(-)

diff --git a/dlibs/aarch64/5.11/ip.d b/dlibs/aarch64/5.11/ip.d
index 493b75a0..95520b4a 100644
--- a/dlibs/aarch64/5.11/ip.d
+++ b/dlibs/aarch64/5.11/ip.d
@@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
  * In some cases where the ipinfo_t * is NULL we wish to construct IP info
  * using the struct tcp_sock * (arg3).  In order to map local IP to source
  * or destination IP address appropriately we need to check if the associated
- * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
- * the value is stored in arg7.  If inbound, we map the local IP address to
+ * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
+ * the value is stored in arg6.  If inbound, we map the local IP address to
  * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
  */
 #pragma D binding "1.5" translator
@@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
 	    "<unknown>";
@@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
 	    "<unknown>";
diff --git a/dlibs/aarch64/5.11/tcp.d b/dlibs/aarch64/5.11/tcp.d
index 48d9adb4..8f87aa57 100644
--- a/dlibs/aarch64/5.11/tcp.d
+++ b/dlibs/aarch64/5.11/tcp.d
@@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
 	    ((struct sock *)T)->__sk_common.skc_num :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->dest :
 		  ((struct tcphdr *)arg4)->source) :
 	    0;
 	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
 	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->source :
 		  ((struct tcphdr *)arg4)->dest) :
 	    0;
@@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 translator tcplsinfo_t < int I > {
 	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
 };
+
+/* Use struct tcp_sock * to fill out tcp header info where we do not have
+ * an sk_buff with struct tcphdr * available; currently only used for
+ * the tcp:::accept-established case where the struct sk_buff * is not
+ * available on < 5.10 kernels.
+ */
+typedef void * __dtrace_tcp_void_tcp_t;
+
+#pragma D binding "1.6.3" translator
+translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
+	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
+		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
+		    0;
+	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
+		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
+		    0;
+	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
+		  0;
+	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
+		  0;
+	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
+	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
+	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
+		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
+		     0;
+	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
+	tcp_hdr = (uintptr_t)T;
+};
diff --git a/dlibs/aarch64/5.12/ip.d b/dlibs/aarch64/5.12/ip.d
index 493b75a0..95520b4a 100644
--- a/dlibs/aarch64/5.12/ip.d
+++ b/dlibs/aarch64/5.12/ip.d
@@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
  * In some cases where the ipinfo_t * is NULL we wish to construct IP info
  * using the struct tcp_sock * (arg3).  In order to map local IP to source
  * or destination IP address appropriately we need to check if the associated
- * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
- * the value is stored in arg7.  If inbound, we map the local IP address to
+ * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
+ * the value is stored in arg6.  If inbound, we map the local IP address to
  * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
  */
 #pragma D binding "1.5" translator
@@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
 	    "<unknown>";
@@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
 	    "<unknown>";
diff --git a/dlibs/aarch64/5.12/tcp.d b/dlibs/aarch64/5.12/tcp.d
index 48d9adb4..8f87aa57 100644
--- a/dlibs/aarch64/5.12/tcp.d
+++ b/dlibs/aarch64/5.12/tcp.d
@@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
 	    ((struct sock *)T)->__sk_common.skc_num :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->dest :
 		  ((struct tcphdr *)arg4)->source) :
 	    0;
 	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
 	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->source :
 		  ((struct tcphdr *)arg4)->dest) :
 	    0;
@@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 translator tcplsinfo_t < int I > {
 	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
 };
+
+/* Use struct tcp_sock * to fill out tcp header info where we do not have
+ * an sk_buff with struct tcphdr * available; currently only used for
+ * the tcp:::accept-established case where the struct sk_buff * is not
+ * available on < 5.10 kernels.
+ */
+typedef void * __dtrace_tcp_void_tcp_t;
+
+#pragma D binding "1.6.3" translator
+translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
+	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
+		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
+		    0;
+	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
+		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
+		    0;
+	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
+		  0;
+	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
+		  0;
+	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
+	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
+	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
+		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
+		     0;
+	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
+	tcp_hdr = (uintptr_t)T;
+};
diff --git a/dlibs/aarch64/5.14/ip.d b/dlibs/aarch64/5.14/ip.d
index 493b75a0..95520b4a 100644
--- a/dlibs/aarch64/5.14/ip.d
+++ b/dlibs/aarch64/5.14/ip.d
@@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
  * In some cases where the ipinfo_t * is NULL we wish to construct IP info
  * using the struct tcp_sock * (arg3).  In order to map local IP to source
  * or destination IP address appropriately we need to check if the associated
- * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
- * the value is stored in arg7.  If inbound, we map the local IP address to
+ * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
+ * the value is stored in arg6.  If inbound, we map the local IP address to
  * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
  */
 #pragma D binding "1.5" translator
@@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
 	    "<unknown>";
@@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
 	    "<unknown>";
diff --git a/dlibs/aarch64/5.14/tcp.d b/dlibs/aarch64/5.14/tcp.d
index 48d9adb4..8f87aa57 100644
--- a/dlibs/aarch64/5.14/tcp.d
+++ b/dlibs/aarch64/5.14/tcp.d
@@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
 	    ((struct sock *)T)->__sk_common.skc_num :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->dest :
 		  ((struct tcphdr *)arg4)->source) :
 	    0;
 	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
 	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->source :
 		  ((struct tcphdr *)arg4)->dest) :
 	    0;
@@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 translator tcplsinfo_t < int I > {
 	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
 };
+
+/* Use struct tcp_sock * to fill out tcp header info where we do not have
+ * an sk_buff with struct tcphdr * available; currently only used for
+ * the tcp:::accept-established case where the struct sk_buff * is not
+ * available on < 5.10 kernels.
+ */
+typedef void * __dtrace_tcp_void_tcp_t;
+
+#pragma D binding "1.6.3" translator
+translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
+	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
+		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
+		    0;
+	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
+		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
+		    0;
+	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
+		  0;
+	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
+		  0;
+	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
+	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
+	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
+		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
+		     0;
+	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
+	tcp_hdr = (uintptr_t)T;
+};
diff --git a/dlibs/aarch64/5.16/ip.d b/dlibs/aarch64/5.16/ip.d
index 493b75a0..95520b4a 100644
--- a/dlibs/aarch64/5.16/ip.d
+++ b/dlibs/aarch64/5.16/ip.d
@@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
  * In some cases where the ipinfo_t * is NULL we wish to construct IP info
  * using the struct tcp_sock * (arg3).  In order to map local IP to source
  * or destination IP address appropriately we need to check if the associated
- * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
- * the value is stored in arg7.  If inbound, we map the local IP address to
+ * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
+ * the value is stored in arg6.  If inbound, we map the local IP address to
  * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
  */
 #pragma D binding "1.5" translator
@@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
 	    "<unknown>";
@@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
 	    "<unknown>";
diff --git a/dlibs/aarch64/5.16/tcp.d b/dlibs/aarch64/5.16/tcp.d
index 48d9adb4..8f87aa57 100644
--- a/dlibs/aarch64/5.16/tcp.d
+++ b/dlibs/aarch64/5.16/tcp.d
@@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
 	    ((struct sock *)T)->__sk_common.skc_num :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->dest :
 		  ((struct tcphdr *)arg4)->source) :
 	    0;
 	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
 	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->source :
 		  ((struct tcphdr *)arg4)->dest) :
 	    0;
@@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 translator tcplsinfo_t < int I > {
 	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
 };
+
+/* Use struct tcp_sock * to fill out tcp header info where we do not have
+ * an sk_buff with struct tcphdr * available; currently only used for
+ * the tcp:::accept-established case where the struct sk_buff * is not
+ * available on < 5.10 kernels.
+ */
+typedef void * __dtrace_tcp_void_tcp_t;
+
+#pragma D binding "1.6.3" translator
+translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
+	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
+		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
+		    0;
+	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
+		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
+		    0;
+	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
+		  0;
+	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
+		  0;
+	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
+	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
+	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
+		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
+		     0;
+	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
+	tcp_hdr = (uintptr_t)T;
+};
diff --git a/dlibs/aarch64/5.2/ip.d b/dlibs/aarch64/5.2/ip.d
index 493b75a0..95520b4a 100644
--- a/dlibs/aarch64/5.2/ip.d
+++ b/dlibs/aarch64/5.2/ip.d
@@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
  * In some cases where the ipinfo_t * is NULL we wish to construct IP info
  * using the struct tcp_sock * (arg3).  In order to map local IP to source
  * or destination IP address appropriately we need to check if the associated
- * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
- * the value is stored in arg7.  If inbound, we map the local IP address to
+ * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
+ * the value is stored in arg6.  If inbound, we map the local IP address to
  * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
  */
 #pragma D binding "1.5" translator
@@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
 	    "<unknown>";
@@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
 	    "<unknown>";
diff --git a/dlibs/aarch64/5.2/tcp.d b/dlibs/aarch64/5.2/tcp.d
index 48d9adb4..8f87aa57 100644
--- a/dlibs/aarch64/5.2/tcp.d
+++ b/dlibs/aarch64/5.2/tcp.d
@@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
 	    ((struct sock *)T)->__sk_common.skc_num :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->dest :
 		  ((struct tcphdr *)arg4)->source) :
 	    0;
 	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
 	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->source :
 		  ((struct tcphdr *)arg4)->dest) :
 	    0;
@@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 translator tcplsinfo_t < int I > {
 	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
 };
+
+/* Use struct tcp_sock * to fill out tcp header info where we do not have
+ * an sk_buff with struct tcphdr * available; currently only used for
+ * the tcp:::accept-established case where the struct sk_buff * is not
+ * available on < 5.10 kernels.
+ */
+typedef void * __dtrace_tcp_void_tcp_t;
+
+#pragma D binding "1.6.3" translator
+translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
+	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
+		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
+		    0;
+	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
+		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
+		    0;
+	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
+		  0;
+	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
+		  0;
+	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
+	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
+	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
+		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
+		     0;
+	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
+	tcp_hdr = (uintptr_t)T;
+};
diff --git a/dlibs/aarch64/5.6/ip.d b/dlibs/aarch64/5.6/ip.d
index 493b75a0..95520b4a 100644
--- a/dlibs/aarch64/5.6/ip.d
+++ b/dlibs/aarch64/5.6/ip.d
@@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
  * In some cases where the ipinfo_t * is NULL we wish to construct IP info
  * using the struct tcp_sock * (arg3).  In order to map local IP to source
  * or destination IP address appropriately we need to check if the associated
- * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
- * the value is stored in arg7.  If inbound, we map the local IP address to
+ * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
+ * the value is stored in arg6.  If inbound, we map the local IP address to
  * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
  */
 #pragma D binding "1.5" translator
@@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
 	    "<unknown>";
@@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
 	    "<unknown>";
diff --git a/dlibs/aarch64/5.6/tcp.d b/dlibs/aarch64/5.6/tcp.d
index 48d9adb4..8f87aa57 100644
--- a/dlibs/aarch64/5.6/tcp.d
+++ b/dlibs/aarch64/5.6/tcp.d
@@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
 	    ((struct sock *)T)->__sk_common.skc_num :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->dest :
 		  ((struct tcphdr *)arg4)->source) :
 	    0;
 	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
 	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->source :
 		  ((struct tcphdr *)arg4)->dest) :
 	    0;
@@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 translator tcplsinfo_t < int I > {
 	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
 };
+
+/* Use struct tcp_sock * to fill out tcp header info where we do not have
+ * an sk_buff with struct tcphdr * available; currently only used for
+ * the tcp:::accept-established case where the struct sk_buff * is not
+ * available on < 5.10 kernels.
+ */
+typedef void * __dtrace_tcp_void_tcp_t;
+
+#pragma D binding "1.6.3" translator
+translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
+	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
+		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
+		    0;
+	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
+		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
+		    0;
+	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
+		  0;
+	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
+		  0;
+	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
+	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
+	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
+		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
+		     0;
+	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
+	tcp_hdr = (uintptr_t)T;
+};
diff --git a/dlibs/aarch64/6.1/ip.d b/dlibs/aarch64/6.1/ip.d
index 493b75a0..95520b4a 100644
--- a/dlibs/aarch64/6.1/ip.d
+++ b/dlibs/aarch64/6.1/ip.d
@@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
  * In some cases where the ipinfo_t * is NULL we wish to construct IP info
  * using the struct tcp_sock * (arg3).  In order to map local IP to source
  * or destination IP address appropriately we need to check if the associated
- * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
- * the value is stored in arg7.  If inbound, we map the local IP address to
+ * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
+ * the value is stored in arg6.  If inbound, we map the local IP address to
  * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
  */
 #pragma D binding "1.5" translator
@@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
 	    "<unknown>";
@@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
 	    "<unknown>";
diff --git a/dlibs/aarch64/6.1/tcp.d b/dlibs/aarch64/6.1/tcp.d
index 48d9adb4..8f87aa57 100644
--- a/dlibs/aarch64/6.1/tcp.d
+++ b/dlibs/aarch64/6.1/tcp.d
@@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
 	    ((struct sock *)T)->__sk_common.skc_num :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->dest :
 		  ((struct tcphdr *)arg4)->source) :
 	    0;
 	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
 	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->source :
 		  ((struct tcphdr *)arg4)->dest) :
 	    0;
@@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 translator tcplsinfo_t < int I > {
 	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
 };
+
+/* Use struct tcp_sock * to fill out tcp header info where we do not have
+ * an sk_buff with struct tcphdr * available; currently only used for
+ * the tcp:::accept-established case where the struct sk_buff * is not
+ * available on < 5.10 kernels.
+ */
+typedef void * __dtrace_tcp_void_tcp_t;
+
+#pragma D binding "1.6.3" translator
+translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
+	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
+		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
+		    0;
+	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
+		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
+		    0;
+	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
+		  0;
+	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
+		  0;
+	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
+	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
+	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
+		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
+		     0;
+	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
+	tcp_hdr = (uintptr_t)T;
+};
diff --git a/dlibs/aarch64/6.10/ip.d b/dlibs/aarch64/6.10/ip.d
index 493b75a0..95520b4a 100644
--- a/dlibs/aarch64/6.10/ip.d
+++ b/dlibs/aarch64/6.10/ip.d
@@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
  * In some cases where the ipinfo_t * is NULL we wish to construct IP info
  * using the struct tcp_sock * (arg3).  In order to map local IP to source
  * or destination IP address appropriately we need to check if the associated
- * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
- * the value is stored in arg7.  If inbound, we map the local IP address to
+ * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
+ * the value is stored in arg6.  If inbound, we map the local IP address to
  * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
  */
 #pragma D binding "1.5" translator
@@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
 	    "<unknown>";
@@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
 	    "<unknown>";
diff --git a/dlibs/aarch64/6.10/tcp.d b/dlibs/aarch64/6.10/tcp.d
index 48d9adb4..8f87aa57 100644
--- a/dlibs/aarch64/6.10/tcp.d
+++ b/dlibs/aarch64/6.10/tcp.d
@@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
 	    ((struct sock *)T)->__sk_common.skc_num :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->dest :
 		  ((struct tcphdr *)arg4)->source) :
 	    0;
 	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
 	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->source :
 		  ((struct tcphdr *)arg4)->dest) :
 	    0;
@@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 translator tcplsinfo_t < int I > {
 	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
 };
+
+/* Use struct tcp_sock * to fill out tcp header info where we do not have
+ * an sk_buff with struct tcphdr * available; currently only used for
+ * the tcp:::accept-established case where the struct sk_buff * is not
+ * available on < 5.10 kernels.
+ */
+typedef void * __dtrace_tcp_void_tcp_t;
+
+#pragma D binding "1.6.3" translator
+translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
+	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
+		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
+		    0;
+	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
+		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
+		    0;
+	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
+		  0;
+	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
+		  0;
+	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
+	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
+	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
+		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
+		     0;
+	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
+	tcp_hdr = (uintptr_t)T;
+};
diff --git a/dlibs/x86_64/5.11/ip.d b/dlibs/x86_64/5.11/ip.d
index 493b75a0..95520b4a 100644
--- a/dlibs/x86_64/5.11/ip.d
+++ b/dlibs/x86_64/5.11/ip.d
@@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
  * In some cases where the ipinfo_t * is NULL we wish to construct IP info
  * using the struct tcp_sock * (arg3).  In order to map local IP to source
  * or destination IP address appropriately we need to check if the associated
- * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
- * the value is stored in arg7.  If inbound, we map the local IP address to
+ * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
+ * the value is stored in arg6.  If inbound, we map the local IP address to
  * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
  */
 #pragma D binding "1.5" translator
@@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
 	    "<unknown>";
@@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
 	    "<unknown>";
diff --git a/dlibs/x86_64/5.11/tcp.d b/dlibs/x86_64/5.11/tcp.d
index 48d9adb4..8f87aa57 100644
--- a/dlibs/x86_64/5.11/tcp.d
+++ b/dlibs/x86_64/5.11/tcp.d
@@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
 	    ((struct sock *)T)->__sk_common.skc_num :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->dest :
 		  ((struct tcphdr *)arg4)->source) :
 	    0;
 	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
 	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->source :
 		  ((struct tcphdr *)arg4)->dest) :
 	    0;
@@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 translator tcplsinfo_t < int I > {
 	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
 };
+
+/* Use struct tcp_sock * to fill out tcp header info where we do not have
+ * an sk_buff with struct tcphdr * available; currently only used for
+ * the tcp:::accept-established case where the struct sk_buff * is not
+ * available on < 5.10 kernels.
+ */
+typedef void * __dtrace_tcp_void_tcp_t;
+
+#pragma D binding "1.6.3" translator
+translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
+	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
+		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
+		    0;
+	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
+		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
+		    0;
+	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
+		  0;
+	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
+		  0;
+	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
+	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
+	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
+		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
+		     0;
+	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
+	tcp_hdr = (uintptr_t)T;
+};
diff --git a/dlibs/x86_64/5.12/ip.d b/dlibs/x86_64/5.12/ip.d
index 493b75a0..95520b4a 100644
--- a/dlibs/x86_64/5.12/ip.d
+++ b/dlibs/x86_64/5.12/ip.d
@@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
  * In some cases where the ipinfo_t * is NULL we wish to construct IP info
  * using the struct tcp_sock * (arg3).  In order to map local IP to source
  * or destination IP address appropriately we need to check if the associated
- * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
- * the value is stored in arg7.  If inbound, we map the local IP address to
+ * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
+ * the value is stored in arg6.  If inbound, we map the local IP address to
  * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
  */
 #pragma D binding "1.5" translator
@@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
 	    "<unknown>";
@@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
 	    "<unknown>";
diff --git a/dlibs/x86_64/5.12/tcp.d b/dlibs/x86_64/5.12/tcp.d
index 48d9adb4..8f87aa57 100644
--- a/dlibs/x86_64/5.12/tcp.d
+++ b/dlibs/x86_64/5.12/tcp.d
@@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
 	    ((struct sock *)T)->__sk_common.skc_num :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->dest :
 		  ((struct tcphdr *)arg4)->source) :
 	    0;
 	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
 	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->source :
 		  ((struct tcphdr *)arg4)->dest) :
 	    0;
@@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 translator tcplsinfo_t < int I > {
 	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
 };
+
+/* Use struct tcp_sock * to fill out tcp header info where we do not have
+ * an sk_buff with struct tcphdr * available; currently only used for
+ * the tcp:::accept-established case where the struct sk_buff * is not
+ * available on < 5.10 kernels.
+ */
+typedef void * __dtrace_tcp_void_tcp_t;
+
+#pragma D binding "1.6.3" translator
+translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
+	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
+		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
+		    0;
+	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
+		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
+		    0;
+	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
+		  0;
+	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
+		  0;
+	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
+	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
+	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
+		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
+		     0;
+	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
+	tcp_hdr = (uintptr_t)T;
+};
diff --git a/dlibs/x86_64/5.14/ip.d b/dlibs/x86_64/5.14/ip.d
index 493b75a0..95520b4a 100644
--- a/dlibs/x86_64/5.14/ip.d
+++ b/dlibs/x86_64/5.14/ip.d
@@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
  * In some cases where the ipinfo_t * is NULL we wish to construct IP info
  * using the struct tcp_sock * (arg3).  In order to map local IP to source
  * or destination IP address appropriately we need to check if the associated
- * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
- * the value is stored in arg7.  If inbound, we map the local IP address to
+ * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
+ * the value is stored in arg6.  If inbound, we map the local IP address to
  * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
  */
 #pragma D binding "1.5" translator
@@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
 	    "<unknown>";
@@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
 	    "<unknown>";
diff --git a/dlibs/x86_64/5.14/tcp.d b/dlibs/x86_64/5.14/tcp.d
index 48d9adb4..8f87aa57 100644
--- a/dlibs/x86_64/5.14/tcp.d
+++ b/dlibs/x86_64/5.14/tcp.d
@@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
 	    ((struct sock *)T)->__sk_common.skc_num :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->dest :
 		  ((struct tcphdr *)arg4)->source) :
 	    0;
 	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
 	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->source :
 		  ((struct tcphdr *)arg4)->dest) :
 	    0;
@@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 translator tcplsinfo_t < int I > {
 	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
 };
+
+/* Use struct tcp_sock * to fill out tcp header info where we do not have
+ * an sk_buff with struct tcphdr * available; currently only used for
+ * the tcp:::accept-established case where the struct sk_buff * is not
+ * available on < 5.10 kernels.
+ */
+typedef void * __dtrace_tcp_void_tcp_t;
+
+#pragma D binding "1.6.3" translator
+translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
+	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
+		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
+		    0;
+	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
+		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
+		    0;
+	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
+		  0;
+	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
+		  0;
+	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
+	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
+	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
+		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
+		     0;
+	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
+	tcp_hdr = (uintptr_t)T;
+};
diff --git a/dlibs/x86_64/5.16/ip.d b/dlibs/x86_64/5.16/ip.d
index 493b75a0..95520b4a 100644
--- a/dlibs/x86_64/5.16/ip.d
+++ b/dlibs/x86_64/5.16/ip.d
@@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
  * In some cases where the ipinfo_t * is NULL we wish to construct IP info
  * using the struct tcp_sock * (arg3).  In order to map local IP to source
  * or destination IP address appropriately we need to check if the associated
- * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
- * the value is stored in arg7.  If inbound, we map the local IP address to
+ * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
+ * the value is stored in arg6.  If inbound, we map the local IP address to
  * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
  */
 #pragma D binding "1.5" translator
@@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
 	    "<unknown>";
@@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
 	    "<unknown>";
diff --git a/dlibs/x86_64/5.16/tcp.d b/dlibs/x86_64/5.16/tcp.d
index 48d9adb4..8f87aa57 100644
--- a/dlibs/x86_64/5.16/tcp.d
+++ b/dlibs/x86_64/5.16/tcp.d
@@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
 	    ((struct sock *)T)->__sk_common.skc_num :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->dest :
 		  ((struct tcphdr *)arg4)->source) :
 	    0;
 	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
 	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->source :
 		  ((struct tcphdr *)arg4)->dest) :
 	    0;
@@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 translator tcplsinfo_t < int I > {
 	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
 };
+
+/* Use struct tcp_sock * to fill out tcp header info where we do not have
+ * an sk_buff with struct tcphdr * available; currently only used for
+ * the tcp:::accept-established case where the struct sk_buff * is not
+ * available on < 5.10 kernels.
+ */
+typedef void * __dtrace_tcp_void_tcp_t;
+
+#pragma D binding "1.6.3" translator
+translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
+	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
+		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
+		    0;
+	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
+		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
+		    0;
+	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
+		  0;
+	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
+		  0;
+	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
+	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
+	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
+		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
+		     0;
+	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
+	tcp_hdr = (uintptr_t)T;
+};
diff --git a/dlibs/x86_64/5.2/ip.d b/dlibs/x86_64/5.2/ip.d
index 493b75a0..95520b4a 100644
--- a/dlibs/x86_64/5.2/ip.d
+++ b/dlibs/x86_64/5.2/ip.d
@@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
  * In some cases where the ipinfo_t * is NULL we wish to construct IP info
  * using the struct tcp_sock * (arg3).  In order to map local IP to source
  * or destination IP address appropriately we need to check if the associated
- * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
- * the value is stored in arg7.  If inbound, we map the local IP address to
+ * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
+ * the value is stored in arg6.  If inbound, we map the local IP address to
  * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
  */
 #pragma D binding "1.5" translator
@@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
 	    "<unknown>";
@@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
 	    "<unknown>";
diff --git a/dlibs/x86_64/5.2/tcp.d b/dlibs/x86_64/5.2/tcp.d
index 48d9adb4..8f87aa57 100644
--- a/dlibs/x86_64/5.2/tcp.d
+++ b/dlibs/x86_64/5.2/tcp.d
@@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
 	    ((struct sock *)T)->__sk_common.skc_num :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->dest :
 		  ((struct tcphdr *)arg4)->source) :
 	    0;
 	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
 	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->source :
 		  ((struct tcphdr *)arg4)->dest) :
 	    0;
@@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 translator tcplsinfo_t < int I > {
 	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
 };
+
+/* Use struct tcp_sock * to fill out tcp header info where we do not have
+ * an sk_buff with struct tcphdr * available; currently only used for
+ * the tcp:::accept-established case where the struct sk_buff * is not
+ * available on < 5.10 kernels.
+ */
+typedef void * __dtrace_tcp_void_tcp_t;
+
+#pragma D binding "1.6.3" translator
+translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
+	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
+		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
+		    0;
+	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
+		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
+		    0;
+	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
+		  0;
+	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
+		  0;
+	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
+	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
+	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
+		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
+		     0;
+	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
+	tcp_hdr = (uintptr_t)T;
+};
diff --git a/dlibs/x86_64/5.6/ip.d b/dlibs/x86_64/5.6/ip.d
index 493b75a0..95520b4a 100644
--- a/dlibs/x86_64/5.6/ip.d
+++ b/dlibs/x86_64/5.6/ip.d
@@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
  * In some cases where the ipinfo_t * is NULL we wish to construct IP info
  * using the struct tcp_sock * (arg3).  In order to map local IP to source
  * or destination IP address appropriately we need to check if the associated
- * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
- * the value is stored in arg7.  If inbound, we map the local IP address to
+ * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
+ * the value is stored in arg6.  If inbound, we map the local IP address to
  * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
  */
 #pragma D binding "1.5" translator
@@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
 	    "<unknown>";
@@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
 	    "<unknown>";
diff --git a/dlibs/x86_64/5.6/tcp.d b/dlibs/x86_64/5.6/tcp.d
index 48d9adb4..8f87aa57 100644
--- a/dlibs/x86_64/5.6/tcp.d
+++ b/dlibs/x86_64/5.6/tcp.d
@@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
 	    ((struct sock *)T)->__sk_common.skc_num :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->dest :
 		  ((struct tcphdr *)arg4)->source) :
 	    0;
 	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
 	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->source :
 		  ((struct tcphdr *)arg4)->dest) :
 	    0;
@@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 translator tcplsinfo_t < int I > {
 	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
 };
+
+/* Use struct tcp_sock * to fill out tcp header info where we do not have
+ * an sk_buff with struct tcphdr * available; currently only used for
+ * the tcp:::accept-established case where the struct sk_buff * is not
+ * available on < 5.10 kernels.
+ */
+typedef void * __dtrace_tcp_void_tcp_t;
+
+#pragma D binding "1.6.3" translator
+translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
+	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
+		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
+		    0;
+	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
+		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
+		    0;
+	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
+		  0;
+	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
+		  0;
+	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
+	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
+	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
+		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
+		     0;
+	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
+	tcp_hdr = (uintptr_t)T;
+};
diff --git a/dlibs/x86_64/6.1/ip.d b/dlibs/x86_64/6.1/ip.d
index 493b75a0..95520b4a 100644
--- a/dlibs/x86_64/6.1/ip.d
+++ b/dlibs/x86_64/6.1/ip.d
@@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
  * In some cases where the ipinfo_t * is NULL we wish to construct IP info
  * using the struct tcp_sock * (arg3).  In order to map local IP to source
  * or destination IP address appropriately we need to check if the associated
- * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
- * the value is stored in arg7.  If inbound, we map the local IP address to
+ * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
+ * the value is stored in arg6.  If inbound, we map the local IP address to
  * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
  */
 #pragma D binding "1.5" translator
@@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
 	    "<unknown>";
@@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
 	    "<unknown>";
diff --git a/dlibs/x86_64/6.1/tcp.d b/dlibs/x86_64/6.1/tcp.d
index 48d9adb4..8f87aa57 100644
--- a/dlibs/x86_64/6.1/tcp.d
+++ b/dlibs/x86_64/6.1/tcp.d
@@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
 	    ((struct sock *)T)->__sk_common.skc_num :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->dest :
 		  ((struct tcphdr *)arg4)->source) :
 	    0;
 	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
 	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->source :
 		  ((struct tcphdr *)arg4)->dest) :
 	    0;
@@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 translator tcplsinfo_t < int I > {
 	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
 };
+
+/* Use struct tcp_sock * to fill out tcp header info where we do not have
+ * an sk_buff with struct tcphdr * available; currently only used for
+ * the tcp:::accept-established case where the struct sk_buff * is not
+ * available on < 5.10 kernels.
+ */
+typedef void * __dtrace_tcp_void_tcp_t;
+
+#pragma D binding "1.6.3" translator
+translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
+	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
+		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
+		    0;
+	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
+		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
+		    0;
+	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
+		  0;
+	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
+		  0;
+	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
+	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
+	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
+		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
+		     0;
+	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
+	tcp_hdr = (uintptr_t)T;
+};
diff --git a/dlibs/x86_64/6.10/ip.d b/dlibs/x86_64/6.10/ip.d
index 493b75a0..95520b4a 100644
--- a/dlibs/x86_64/6.10/ip.d
+++ b/dlibs/x86_64/6.10/ip.d
@@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
  * In some cases where the ipinfo_t * is NULL we wish to construct IP info
  * using the struct tcp_sock * (arg3).  In order to map local IP to source
  * or destination IP address appropriately we need to check if the associated
- * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
- * the value is stored in arg7.  If inbound, we map the local IP address to
+ * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
+ * the value is stored in arg6.  If inbound, we map the local IP address to
  * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
  */
 #pragma D binding "1.5" translator
@@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
 	    "<unknown>";
@@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
 	    "<unknown>";
diff --git a/dlibs/x86_64/6.10/tcp.d b/dlibs/x86_64/6.10/tcp.d
index 48d9adb4..8f87aa57 100644
--- a/dlibs/x86_64/6.10/tcp.d
+++ b/dlibs/x86_64/6.10/tcp.d
@@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
 	    ((struct sock *)T)->__sk_common.skc_num :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->dest :
 		  ((struct tcphdr *)arg4)->source) :
 	    0;
 	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
 	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->source :
 		  ((struct tcphdr *)arg4)->dest) :
 	    0;
@@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 translator tcplsinfo_t < int I > {
 	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
 };
+
+/* Use struct tcp_sock * to fill out tcp header info where we do not have
+ * an sk_buff with struct tcphdr * available; currently only used for
+ * the tcp:::accept-established case where the struct sk_buff * is not
+ * available on < 5.10 kernels.
+ */
+typedef void * __dtrace_tcp_void_tcp_t;
+
+#pragma D binding "1.6.3" translator
+translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
+	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
+		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
+		    0;
+	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
+		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
+		    0;
+	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
+		  0;
+	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
+		  0;
+	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
+	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
+	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
+		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
+		     0;
+	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
+	tcp_hdr = (uintptr_t)T;
+};
diff --git a/libdtrace/dt_prov_tcp.c b/libdtrace/dt_prov_tcp.c
index a191efe1..44ed2bc9 100644
--- a/libdtrace/dt_prov_tcp.c
+++ b/libdtrace/dt_prov_tcp.c
@@ -72,9 +72,9 @@ static probe_dep_t	probes[] = {
 static probe_arg_t probe_args[] = {
 	{ "accept-established", 0, { 0, 0, "struct sk_buff *", "pktinfo_t *" } },
 	{ "accept-established", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
-	{ "accept-established", 2, { 2, 0, "void_ip_t *", "ipinfo_t *" } },
+	{ "accept-established", 2, { 2, 0, "__dtrace_tcp_void_ip_t *", "ipinfo_t *" } },
 	{ "accept-established", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t *" } },
-	{ "accept-established", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t *" } },
+	{ "accept-established", 4, { 4, 0, "__dtrace_tcp_void_tcp_t *", "tcpinfo_t *" } },
 	{ "accept-established", 5, { 5, 0, "void", "void" } },
 
 	{ "accept-refused", 0, { 0, 0, "struct sk_buff *", "pktinfo_t *" } },
@@ -166,8 +166,11 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	dt_probe_t	*uprp = pcb->pcb_parent_probe;
 	int		direction, have_iphdr;
 	int		skarg = 0, skbarg = 1, tcparg = 0;
-	int		skarg_maybe_null;
+	int		skarg_maybe_null, have_skb = 1;
 	int		skstate = 0;
+	dtrace_typeinfo_t sym;
+	ctf_funcinfo_t	fi;
+	int		rc;
 
 	/*
 	 * We construct the tcp::: probe arguments as follows:
@@ -258,11 +261,24 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	}
 
 	if (strcmp(prp->desc->prb, "accept-established") == 0) {
-		direction = NET_PROBE_OUTBOUND;
+		direction = NET_PROBE_INBOUND;
 		have_iphdr = 1;
-		/* skb in arg2 not arg1 */
-		skbarg = 2;
-		skarg_maybe_null = 0;
+		/* on older (5.4) kernels, tcp_init_transfer() only has 2
+		 * args, i.e. no struct skb * third argument.
+ 		 */
+		rc = dtrace_lookup_by_type(dtp, DTRACE_OBJ_EVERY,
+					   uprp->desc->fun, &sym);
+		if (rc == 0 &&
+		    ctf_type_kind(sym.dtt_ctfp, sym.dtt_type) == CTF_K_FUNCTION &&
+		    ctf_func_type_info(sym.dtt_ctfp, sym.dtt_type, &fi) == 0 &&
+		    fi.ctc_argc > 2) {
+			/* skb in arg2 not arg1 */
+			skbarg = 2;
+			skarg_maybe_null = 0;
+		} else {
+			have_skb = 0;
+			have_iphdr = 0;
+		}
 		/* ensure arg1 is BPF_SOCK_OPS_PASSIVE_ESTABLISHED_CB */
 		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(1)));
 		emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_6,
@@ -289,10 +305,6 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	} else {
 		direction = NET_PROBE_OUTBOUND;
 		if (strcmp(uprp->desc->fun, "ip_send_unicast_reply") == 0) {
-			dtrace_typeinfo_t	sym;
-			ctf_funcinfo_t		fi;
-			int rc;
-
 			/* Newer kernels pass the original socket as second
 			 * arg to ip_send_unicast_reply(); if that function
 			 * has an extra (> 9) argument we know we have to
@@ -344,10 +356,14 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_6, 0, exitlbl));
 	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(3), BPF_REG_6));
 
-	/* then save skb to args[0] */
-	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(skbarg)));
-	emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_6, 0, exitlbl));
-	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_6));
+	if (have_skb) {
+		/* then save skb to args[0] */
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(skbarg)));
+		emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_6, 0, exitlbl));
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_6));
+	} else {
+		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(0), 0));
+	}
 
 	/* next save sk to args[1] now that we have skb in args[0] */
 	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(3)));
@@ -358,34 +374,37 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	 *	skb_network_header(skb)	=	(include/linux/ip.h)
 	 *	skb->head + skb->network_header	(include/linux/skbuff.h)
 	 */
-	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(0)));
-	dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
-	if (have_iphdr)
+	if (have_skb && have_iphdr) {
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(0)));
+		dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
 		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
-	else
-		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(2), 0));
-
-	if (have_iphdr) {
 		dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6,
-				 "network_header");
+				       "network_header");
 		emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
+	} else {
+		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(2), 0));
 	}
+
 	/*
 	 * tcp_hdr(skb) =
 	 *	skb_transport_header(skb) =		(include/linux/ip.h)
 	 *	skb->head + skb->transport_header	(include/linux/skbuff.h)
 	 */
-	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(tcparg)));
-	if (tcparg) {
-		/* struct ip_reply_arg * has a kvec containing the tcp header */
-		dt_cg_tramp_get_member(pcb, "struct kvec", BPF_REG_6, "iov_base");
-		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
+	if (have_skb) {
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(tcparg)));
+		if (tcparg) {
+			/* struct ip_reply_arg * has a kvec containing the tcp header */
+			dt_cg_tramp_get_member(pcb, "struct kvec", BPF_REG_6, "iov_base");
+			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
+		} else {
+			dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
+			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
+			dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6,
+					 "transport_header");
+			emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
+		}
 	} else {
-		dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
-		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
-		dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6,
-				 "transport_header");
-		emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
+		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(4), 0));
 	}
 
 	if (!skarg_maybe_null) {
diff --git a/libdtrace/ip.d b/libdtrace/ip.d
index 493b75a0..95520b4a 100644
--- a/libdtrace/ip.d
+++ b/libdtrace/ip.d
@@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
  * In some cases where the ipinfo_t * is NULL we wish to construct IP info
  * using the struct tcp_sock * (arg3).  In order to map local IP to source
  * or destination IP address appropriately we need to check if the associated
- * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
- * the value is stored in arg7.  If inbound, we map the local IP address to
+ * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
+ * the value is stored in arg6.  If inbound, we map the local IP address to
  * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
  */
 #pragma D binding "1.5" translator
@@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
 	    "<unknown>";
@@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
 	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
-	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
 	    arg3 != NULL &&
 	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
-	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
 	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
 	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
 	    "<unknown>";
diff --git a/libdtrace/tcp.d b/libdtrace/tcp.d
index 48d9adb4..8f87aa57 100644
--- a/libdtrace/tcp.d
+++ b/libdtrace/tcp.d
@@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
 	    ((struct sock *)T)->__sk_common.skc_num :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->dest :
 		  ((struct tcphdr *)arg4)->source) :
 	    0;
 	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
 	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
 	    arg4 != NULL ?
-	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ntohs(arg6 == NET_PROBE_INBOUND ?
 		  ((struct tcphdr *)arg4)->source :
 		  ((struct tcphdr *)arg4)->dest) :
 	    0;
@@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
 translator tcplsinfo_t < int I > {
 	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
 };
+
+/* Use struct tcp_sock * to fill out tcp header info where we do not have
+ * an sk_buff with struct tcphdr * available; currently only used for
+ * the tcp:::accept-established case where the struct sk_buff * is not
+ * available on < 5.10 kernels.
+ */
+typedef void * __dtrace_tcp_void_tcp_t;
+
+#pragma D binding "1.6.3" translator
+translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
+	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
+		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
+		    0;
+	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
+		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
+		    0;
+	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
+		  0;
+	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
+		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
+		  0;
+	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
+	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
+	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
+		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
+		     0;
+	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
+	tcp_hdr = (uintptr_t)T;
+};
-- 
2.43.5

