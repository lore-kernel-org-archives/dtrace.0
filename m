Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3F8293B5A
	for <dtrace@lists.linux.dev>; Wed,  9 Jul 2025 14:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752072432; cv=none; b=Wrc/FhjXXH67vrvTPzEhmz3R18Ob6e2XLJLJoZGXrtuCQesFb+6Y1BexsPXLt3QJvdxVUBynn4juqpag2J2goej3HitJv9wUIBFRWCb4xDZaejTATB29WNdgXrYRzlfXW0U/bBLwRixvudwSCQPpOX0Mxhj0JWgQENQtMK2B+fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752072432; c=relaxed/simple;
	bh=/bkOwoejxKmMg9Cv5/enE5jN3OLeG82zqMl/NYr7qIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HwjSIpH7Kvc1vR/6MrOtblfbx+bh5HMaX6S21ucyQCZ98auSEa6/LLCi2ccaNUp4Jboo38QVJj6ij1LEgVzmHFWGW+g811XGTlJX040qAI6A7eSUIhjn9xJug1ZxfDLP3v+7HRjxqUlHbvM/+8uyuqLA3Qq5tjwNy1OCDG/a4TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mAS5sHho; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mAS5sHho"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569ELwI6030938
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=IvKqZ
	lqb5RtmHkv7HQnMYdXUmBILb4u6C08co8qvyJQ=; b=mAS5sHhogRc7A8U4MiZmF
	JChdyvRsZmRzdrw77CknSqBTmgfeL7+4Zi1TvXjiAX1B7UgAghoAVokiAp+UqvpC
	LKrOzS99e9VcIimDqA8+27rw/v4kwUHTrWR6m4xmm4JN/WaPqJmGMPE3UJxrZBCe
	lD7uSZoo8JCd8blSfpry/5sxZL+2d7o513gts6zWatTJe5Jmsh8/BP5nhmiP2Zhy
	DjVSTLLm0l4BBjh4ATEbo2Zp20ZzDDPFwmNirzTX6/Qsmo4crM3Qq2kcgM8SGEWO
	THlMJ1qO1gMUuUxWo2MJNmswlEC4g5POa7OZ1d/MAbhMDoXbPWPm7FpsspRRGL6Z
	Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47st4801sj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 14:47:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 569D4MRw024391
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:47:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ptgbap2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 14:47:08 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 569Ek38Z034091
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:47:08 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-63-52.vpn.oracle.com [10.154.63.52])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47ptgbanwh-5;
	Wed, 09 Jul 2025 14:47:08 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v4 4/7] providers: move network-generic definitions to net.d
Date: Wed,  9 Jul 2025 15:46:57 +0100
Message-ID: <20250709144700.20591-5-alan.maguire@oracle.com>
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
X-Authority-Analysis: v=2.4 cv=S8bZwJsP c=1 sm=1 tr=0 ts=686e80ee b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=T-mFTDMhS4KWiEwUP_MA:9
X-Proofpoint-GUID: bHQ6flhBgRgf8_nide6orfA-65Ug2jDd
X-Proofpoint-ORIG-GUID: bHQ6flhBgRgf8_nide6orfA-65Ug2jDd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDEzMyBTYWx0ZWRfX4O73FipEC/B7 YX/snss+LBdaDwLnz5QrQgzRvwR/72FsbSbAM2c6IYa5OvLm7XtsZiDPXaDtaLB8Td8wFBt5iha ggAQA22GWrrMjLCDe95DM9aZK5gb/9kydai3WJKTM661stsWXF42kdh+RJgbCu3N29s+5Qte/Hy
 e7izEDkJaP2j5lUckR3AO6lba5Y/DJ1z6rUzoRqh/cBH0na6j7fyjfUrHqmoarj99QjsaIisSs7 I6kKXIk+pAqoKf/yjfUmoS+syT+Vxyvfn6iFexXQVhbBQrojL+vajf3I6/m3hIab63SomBUnf+f hJcLxWZyoC28BV/JXAiIWJS94yKxoocKp1PQuEIt0wJLFkYm0sVEwNaFxCRRj4uU6XwrSVhb6AV
 JTSElRk4f8p5fzZPRdUHiyf3c5neCsRn4bE0kac59JFVT2Apz2EZQ4bym9w09FNlCNKEV4EB

tcp.d and ip.d both need some of these generic definitions so move them
to the net.d library they both depend on.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/ip.d  | 25 -------------------------
 libdtrace/net.d | 25 +++++++++++++++++++++++++
 2 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/libdtrace/ip.d b/libdtrace/ip.d
index f8b77f12..b498bc07 100644
--- a/libdtrace/ip.d
+++ b/libdtrace/ip.d
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
diff --git a/libdtrace/net.d b/libdtrace/net.d
index 6ac34287..4c7bc61f 100644
--- a/libdtrace/net.d
+++ b/libdtrace/net.d
@@ -25,6 +25,31 @@ typedef struct conninfo {
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
  * with sending (outbound) or receiving (inbound).
-- 
2.39.3

