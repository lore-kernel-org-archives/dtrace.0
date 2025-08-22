Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4E329BD87
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755886605; cv=none; b=E9fKgJsXrfbHhCLYr3Is33eyrKjiwUuuyydjb2j6UI9VqBshIo7MyQZtQaTftu18vM0efTJp2W+jlo0DZHpRvkBGtQvrjp2xTYBpKS1rVQbpAo35zy6gWuFspbadg28d+bS3J43T28+3MHvevBh+ZwIyLQGCFD4Ig1or7mGFSKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755886605; c=relaxed/simple;
	bh=GL/HNMeG5Uq+/UQNlJubP0U/PNNs9+KPZRchN39+570=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D1JWxUFyz0oudz+RacomRbHvwWs2XnnGIa07t+XFqfQ/cmKtjjugD04gyLsHl53FlzcKZ6ymE7yxfFzhwWxsmeuiZMNd2QK9fpq1viucYHMGZ9hSfktzahTOrDC0pKG5UYxDmHXiEaVoSTTn2M+5cEBA5Aw0qivY8UPoy1ElNns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XtPXF6ce; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XtPXF6ce"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHWxGG028824
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=I71wG
	QoRhtAyKhCe+M0EyfBTjTbYUYJrnOGRuihq0fE=; b=XtPXF6ceRzv5/+mUUJE2c
	ooXJ6+u2C8YGFvSA3QWZxNeqo1m53U56fwONltKLMaXbBn+gpGOjCPF+vsSYQgS7
	e8caOT286/xtnfzeKkz88p2EHihrwUmMcDkEFcTyS2vEKMMjRzo+1dC90N1FFpEx
	WnC2UHF/a7yGSaocXUJ18Tt1xXJCzTR4q7FZ3/rfvSw9sz6ZB+KXFvnaxxwcWB6c
	x3EJnBlQHK2rRqPxqGKNoNOT8+x4Cx2tNIt/S7cCnCVkTeYfOeWRzPQDF9emLRG6
	pZsHh/7UcPOG1F+9W6Ba4MW1X7Boazzs8g/V98t+rFuUpsV1638V89JOvAJ4iX6y
	w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48pw19g2cq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHknJ4020714
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48nj6hndj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:33 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57MIGU4F009458
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:32 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-56-42.vpn.oracle.com [10.154.56.42])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 48nj6hndg2-3;
	Fri, 22 Aug 2025 18:16:32 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH 2/5] dlibs: sync dlibs with libdtrace/udp.d
Date: Fri, 22 Aug 2025 19:16:26 +0100
Message-ID: <20250822181629.30972-3-alan.maguire@oracle.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDE2MCBTYWx0ZWRfX4vnhABdalxwx
 FKnLv+wxqKnTi8Y3LL6DZpOo1htVAKGeERnJ+pcCe4SBd9XCop4il0p68ShfnzfTflnMyMUsBRE
 ocdfTJS43nObpngVbs/0XxASZWjcqB2HiSM390xIRYZr6pCHAvnLiTBG5bTVDau1lZR4K/OAupZ
 Drq0NM/7X1LVi5HcypiUxAiMA/jBiNgzzwQxtM+kuC5NejNabcQ2slDXApltQguHKcJtQ2SErVs
 Uu2/rO+zSIw6MqDavxWmDg1gbj4Yd+iB3Lq/rI2wWt+paACA6IT3IVSaJnrtqO8z9DzzEg0j8gs
 BMQfloekuDBRCgR4IvtUMYIGTqs/SfkKLE0xu7RqY3HGvVf0KNLidM8EqXNVbwc4y0E50Lnn7ll
 ny7p/ZOhw1G5mq6xpV08eMgtrrMoFQ==
X-Proofpoint-GUID: eVEwPmQ2fAtbPCdxmaC4S-WeYYlJ_DwG
X-Proofpoint-ORIG-GUID: eVEwPmQ2fAtbPCdxmaC4S-WeYYlJ_DwG
X-Authority-Analysis: v=2.4 cv=EvbSrTcA c=1 sm=1 tr=0 ts=68a8b402 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=2OwXVqhp2XgA:10 a=yPCof4ZbAAAA:8 a=A8FmdrveNgKYHmWA7BMA:9 cc=ntf
 awl=host:12069

Sync dlibs versions with updated udp.d.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 dlibs/aarch64/5.11/udp.d | 11 ++++++-----
 dlibs/aarch64/5.12/udp.d | 11 ++++++-----
 dlibs/aarch64/5.14/udp.d | 11 ++++++-----
 dlibs/aarch64/5.16/udp.d | 11 ++++++-----
 dlibs/aarch64/5.2/udp.d  | 11 ++++++-----
 dlibs/aarch64/5.6/udp.d  | 11 ++++++-----
 dlibs/aarch64/6.1/udp.d  | 11 ++++++-----
 dlibs/aarch64/6.10/udp.d | 11 ++++++-----
 dlibs/x86_64/5.11/udp.d  | 11 ++++++-----
 dlibs/x86_64/5.12/udp.d  | 11 ++++++-----
 dlibs/x86_64/5.14/udp.d  | 11 ++++++-----
 dlibs/x86_64/5.16/udp.d  | 11 ++++++-----
 dlibs/x86_64/5.2/udp.d   | 11 ++++++-----
 dlibs/x86_64/5.6/udp.d   | 11 ++++++-----
 dlibs/x86_64/6.1/udp.d   | 11 ++++++-----
 dlibs/x86_64/6.10/udp.d  | 11 ++++++-----
 16 files changed, 96 insertions(+), 80 deletions(-)

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
-- 
2.43.5

