Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB57427CCE2
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 08:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756455860; cv=none; b=bIKxKq4vCpUX3nL7CTqeoIA65B80qvv2UXCSO8ymvGy09Ho7at/zW/1PN9H57hTUyKeSM5HyRknuCQ9ywI1tzQbJ7Y5xA3vTCEtiOzhtD1HkHiULzctaA5nG8zAqn0BY70M/5j+bVYQBO4/gnfzyGRmtIa7tNf+BW/64/yJ9pEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756455860; c=relaxed/simple;
	bh=7rCus0vhvWk2jt+BNDPtbrryPONhhIlAP8vu8A/1aiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KRruWtaQDevvhVYLmcmOIIikBDFmroK90DJ4mesjZjm9kU2jIY7rOlKKYOlgtC451EXGCHl193KWq2VM+0FB6krVOSsgqXFFqyPFpnqjBZSFte29nAztAVt/+HTBo/xdAqWi3JS1UeikYuduYW0WGaTES1IM5iSGD4Mks1Ft7m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OFK5smWQ; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OFK5smWQ"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T844TT031869
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 08:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=DBDBQ
	hBVHKSon0WaOCAw+Ujq8F2RZXDgOoXgCcNcXhc=; b=OFK5smWQ7RLBrzT6vrAXo
	wH7N2hFr1z4YfkD0hjLB56TyhdlS3+6lrsUFIhY9bQL40j0KmWtA7xRKXAfBl0zi
	n0BPX1gSx/uLTjQIy1kRxNCak6ueW4pf51FRhQWp1ama9B0S5ZlPDqp+PNqFslxO
	ezgCzqttztN8FW8RuGOVPO1KcQUorukIgCLzfdHzXMhy8hGTnqUFpoLNihNuStZw
	4RInqBS/+xZPk37USemB7YbZns0RYhyyJj5RatpG+S6UpRVBiI5H/rhRE53SiamU
	Alt/dDbEY81xBlWrADw6kDiMo2d8yejNmJGC4NVndAh9+FTN1YspFuFocP+Gop02
	g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q48et4pr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 08:24:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57T6gwL9019585
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 08:24:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48q43cyh9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 08:24:16 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57T8OEWu038773
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 08:24:15 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-58-49.vpn.oracle.com [10.154.58.49])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 48q43cyh7v-2;
	Fri, 29 Aug 2025 08:24:15 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2 1/2] udp: new provider
Date: Fri, 29 Aug 2025 09:24:11 +0100
Message-ID: <20250829082412.25687-2-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250829082412.25687-1-alan.maguire@oracle.com>
References: <20250829082412.25687-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508290070
X-Proofpoint-GUID: XAzF5x2cWKpDLRBy8gzVWSpwu1sSjnSg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAxNCBTYWx0ZWRfX+aNOK1X7zqSu
 V9yYTMejpPdD3KWGVucaeaz1oq8AXOoAYGhF/XKFFsxUn0rh83vFMkkf8LBpi+k2FreLLjNwA8M
 RwKkK0j6AJZQhsqsWWFN7MZlX4lTxWljxjRPm2gizUP9WfExbBfv9LeK8Ut6honjOekw5gyKXJs
 VrdPsCfyTAeHcivAP9sR8IZs6poZKa9050wublFL9W16ftdNnbLIugiMkuUxKF38hGukgIC3EKQ
 uQJWpf/lgBlRNejd4FOKbrR0H9VZHUc8l7H++rQWw+V/vovuFo9RiO4MiGclQqpM2yoFZYFtxUM
 cvxuE//DQelHiqfz2iZQdasNByLV+BoxMhbL2JMpy1VcaDUf6rTWNdpxQt0aGt/O28ywK4N1Uow
 /5YOqXLW
X-Authority-Analysis: v=2.4 cv=FtgF/3rq c=1 sm=1 tr=0 ts=68b163b1 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=2OwXVqhp2XgA:10 a=yPCof4ZbAAAA:8 a=oknAwnuRSb_eTYsUZQcA:9
X-Proofpoint-ORIG-GUID: XAzF5x2cWKpDLRBy8gzVWSpwu1sSjnSg

Support UDP send and receive, using raw fbt probes; since
udp.d changes sync dlibs also.  Update test.x provider check
for udp, and add udp to expected providers.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 dlibs/aarch64/5.11/udp.d                    |  11 +-
 dlibs/aarch64/5.12/udp.d                    |  11 +-
 dlibs/aarch64/5.14/udp.d                    |  11 +-
 dlibs/aarch64/5.16/udp.d                    |  11 +-
 dlibs/aarch64/5.2/udp.d                     |  11 +-
 dlibs/aarch64/5.6/udp.d                     |  11 +-
 dlibs/aarch64/6.1/udp.d                     |  11 +-
 dlibs/aarch64/6.10/udp.d                    |  11 +-
 dlibs/x86_64/5.11/udp.d                     |  11 +-
 dlibs/x86_64/5.12/udp.d                     |  11 +-
 dlibs/x86_64/5.14/udp.d                     |  11 +-
 dlibs/x86_64/5.16/udp.d                     |  11 +-
 dlibs/x86_64/5.2/udp.d                      |  11 +-
 dlibs/x86_64/5.6/udp.d                      |  11 +-
 dlibs/x86_64/6.1/udp.d                      |  11 +-
 dlibs/x86_64/6.10/udp.d                     |  11 +-
 libdtrace/Build                             |   2 +
 libdtrace/dt_prov_udp.c                     | 170 ++++++++++++++++++++
 libdtrace/dt_provider.c                     |   1 +
 libdtrace/dt_provider.h                     |   1 +
 libdtrace/udp.d                             |  11 +-
 test/unittest/dtrace-util/tst.ListProbes.r  |   1 +
 test/unittest/dtrace-util/tst.ListProbes.sh |   1 +
 test/unittest/udp/test.x                    |   6 +-
 24 files changed, 279 insertions(+), 90 deletions(-)
 create mode 100644 libdtrace/dt_prov_udp.c

diff --git a/dlibs/aarch64/5.11/udp.d b/dlibs/aarch64/5.11/udp.d
index 0e44ed64..e5a0fc9b 100644
--- a/dlibs/aarch64/5.11/udp.d
+++ b/dlibs/aarch64/5.11/udp.d
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
diff --git a/dlibs/aarch64/5.12/udp.d b/dlibs/aarch64/5.12/udp.d
index 0e44ed64..e5a0fc9b 100644
--- a/dlibs/aarch64/5.12/udp.d
+++ b/dlibs/aarch64/5.12/udp.d
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
diff --git a/dlibs/aarch64/5.14/udp.d b/dlibs/aarch64/5.14/udp.d
index 0e44ed64..e5a0fc9b 100644
--- a/dlibs/aarch64/5.14/udp.d
+++ b/dlibs/aarch64/5.14/udp.d
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
diff --git a/dlibs/aarch64/5.16/udp.d b/dlibs/aarch64/5.16/udp.d
index 0e44ed64..e5a0fc9b 100644
--- a/dlibs/aarch64/5.16/udp.d
+++ b/dlibs/aarch64/5.16/udp.d
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
diff --git a/dlibs/aarch64/5.2/udp.d b/dlibs/aarch64/5.2/udp.d
index 0e44ed64..e5a0fc9b 100644
--- a/dlibs/aarch64/5.2/udp.d
+++ b/dlibs/aarch64/5.2/udp.d
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
diff --git a/dlibs/aarch64/5.6/udp.d b/dlibs/aarch64/5.6/udp.d
index 0e44ed64..e5a0fc9b 100644
--- a/dlibs/aarch64/5.6/udp.d
+++ b/dlibs/aarch64/5.6/udp.d
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
diff --git a/dlibs/aarch64/6.1/udp.d b/dlibs/aarch64/6.1/udp.d
index 0e44ed64..e5a0fc9b 100644
--- a/dlibs/aarch64/6.1/udp.d
+++ b/dlibs/aarch64/6.1/udp.d
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
diff --git a/dlibs/aarch64/6.10/udp.d b/dlibs/aarch64/6.10/udp.d
index 0e44ed64..e5a0fc9b 100644
--- a/dlibs/aarch64/6.10/udp.d
+++ b/dlibs/aarch64/6.10/udp.d
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
diff --git a/dlibs/x86_64/5.11/udp.d b/dlibs/x86_64/5.11/udp.d
index 0e44ed64..e5a0fc9b 100644
--- a/dlibs/x86_64/5.11/udp.d
+++ b/dlibs/x86_64/5.11/udp.d
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
diff --git a/dlibs/x86_64/5.12/udp.d b/dlibs/x86_64/5.12/udp.d
index 0e44ed64..e5a0fc9b 100644
--- a/dlibs/x86_64/5.12/udp.d
+++ b/dlibs/x86_64/5.12/udp.d
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
diff --git a/dlibs/x86_64/5.14/udp.d b/dlibs/x86_64/5.14/udp.d
index 0e44ed64..e5a0fc9b 100644
--- a/dlibs/x86_64/5.14/udp.d
+++ b/dlibs/x86_64/5.14/udp.d
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
diff --git a/dlibs/x86_64/5.16/udp.d b/dlibs/x86_64/5.16/udp.d
index 0e44ed64..e5a0fc9b 100644
--- a/dlibs/x86_64/5.16/udp.d
+++ b/dlibs/x86_64/5.16/udp.d
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
diff --git a/dlibs/x86_64/5.2/udp.d b/dlibs/x86_64/5.2/udp.d
index 0e44ed64..e5a0fc9b 100644
--- a/dlibs/x86_64/5.2/udp.d
+++ b/dlibs/x86_64/5.2/udp.d
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
diff --git a/dlibs/x86_64/5.6/udp.d b/dlibs/x86_64/5.6/udp.d
index 0e44ed64..e5a0fc9b 100644
--- a/dlibs/x86_64/5.6/udp.d
+++ b/dlibs/x86_64/5.6/udp.d
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
diff --git a/dlibs/x86_64/6.1/udp.d b/dlibs/x86_64/6.1/udp.d
index 0e44ed64..e5a0fc9b 100644
--- a/dlibs/x86_64/6.1/udp.d
+++ b/dlibs/x86_64/6.1/udp.d
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
diff --git a/dlibs/x86_64/6.10/udp.d b/dlibs/x86_64/6.10/udp.d
index 0e44ed64..e5a0fc9b 100644
--- a/dlibs/x86_64/6.10/udp.d
+++ b/dlibs/x86_64/6.10/udp.d
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
diff --git a/libdtrace/Build b/libdtrace/Build
index 3540d1c1..722f787d 100644
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
@@ -120,6 +121,7 @@ dt_prov_sched.c_CFLAGS := -Wno-pedantic
 dt_prov_sdt.c_CFLAGS := -Wno-pedantic
 dt_prov_syscall.c_CFLAGS := -Wno-pedantic
 dt_prov_tcp.c_CFLAGS := -Wno-pedantic
+dt_prov_udp.c_CFLAGS := -Wno-pedantic
 dt_prov_uprobe.c_CFLAGS := -Wno-pedantic
 dt_debug.c_CFLAGS := -Wno-prio-ctor-dtor
 
diff --git a/libdtrace/dt_prov_udp.c b/libdtrace/dt_prov_udp.c
new file mode 100644
index 00000000..33a975a5
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
+	  DTRACE_PROBESPEC_NAME,	"rawfbt::udp_queue_rcv_skb:entry" },
+	{ "receive",
+	  DTRACE_PROBESPEC_NAME,	"rawfbt::udpv6_queue_rcv_skb:entry" },
+	{ "send",
+	  DTRACE_PROBESPEC_NAME,	"rawfbt::ip_send_skb:entry" },
+	{ "send",
+	  DTRACE_PROBESPEC_NAME,	"rawfbt::ip6_send_skb:entry" },
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
diff --git a/test/unittest/dtrace-util/tst.ListProbes.r b/test/unittest/dtrace-util/tst.ListProbes.r
index ad557253..a1e185d4 100644
--- a/test/unittest/dtrace-util/tst.ListProbes.r
+++ b/test/unittest/dtrace-util/tst.ListProbes.r
@@ -12,3 +12,4 @@ sched
 sdt
 syscall
 tcp
+udp
diff --git a/test/unittest/dtrace-util/tst.ListProbes.sh b/test/unittest/dtrace-util/tst.ListProbes.sh
index a747a045..744bb8ad 100755
--- a/test/unittest/dtrace-util/tst.ListProbes.sh
+++ b/test/unittest/dtrace-util/tst.ListProbes.sh
@@ -70,6 +70,7 @@ $dtrace $dt_flags -l \
     $2 == "sdt"      { mycheck($2, $1,   600,   6000); next }
     $2 == "syscall"  { mycheck($2, $1,   300,   3000); next }
     $2 == "tcp"      { mycheck($2, $1,     8,      8); next }
+    $2 == "udp"      { mycheck($2, $1,     2,      2); next }	
     # nothing for usdt
 
     # Unrecognized line.
diff --git a/test/unittest/udp/test.x b/test/unittest/udp/test.x
index d3d7a598..2ff8d675 100755
--- a/test/unittest/udp/test.x
+++ b/test/unittest/udp/test.x
@@ -1,14 +1,10 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2017, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2017, 2025 Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
-if ! check_provider udp; then
-        echo "Could not load udp provider"
-        exit 1
-fi
 if ! perl -MIO::Socket::IP -e 'exit(0);' 2>/dev/null; then
 	exit 1
 fi
-- 
2.43.5

