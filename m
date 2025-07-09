Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056D12E54BC
	for <dtrace@lists.linux.dev>; Wed,  9 Jul 2025 14:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752070200; cv=none; b=cEvdPydtqmBsRoOheM6iSsi4bwMcnw27D6MVd09JIyINxPOsaa9Hzd3J5zO0RCf9iB8TpYkkbgDe3q6++bXqvtfPjCSpEhkfz+htCsVwvVsRUHEmCyhpIgoRhVUyS/Wjf8wtC4FW+1VjCeqU76NzRkdI7V1h0EsgpLDu4GDE9cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752070200; c=relaxed/simple;
	bh=/bkOwoejxKmMg9Cv5/enE5jN3OLeG82zqMl/NYr7qIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mnRZYeErToipHMVbU5LMCJGf+ipHRiE4RNK1PT+cMhjc4+ixK6Bv4xAI0jjvum6PNS5q+LJ2NpA6fPBIg0AsgdygGdWrQh2owD7LKPJzcTuzZ4BFdM0XQ5CpmYZbF2JZ/ztkbils8wzH9yvVEQIA2uo+Ak+ujDeoTKCYSqTNCns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=A1jKhvIG; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="A1jKhvIG"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569E6pmC027411
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=IvKqZ
	lqb5RtmHkv7HQnMYdXUmBILb4u6C08co8qvyJQ=; b=A1jKhvIG8939p4iocBsUG
	nSJH5Dg5niMSzrB+vpVu3svoTQzGNybMvvkUBsEnz8kJivmSs8VU67UfDgLBH/AN
	D5T9GXhkNMXylwsFapl08C4AD3/nj5HgQOgObXu+EEPDWzgj+XzgMDCOBtYHY15P
	TYLO7ohRxrbTxMA2KjEEq1d3pBfjTR6RfExreZs4xRcbU7SBq+fiEmg/XXjwc2ZK
	oSf61mb/uJHlbcVQP9ZJk7FmKa7vuYNBfXBFYgNykQw4j+Q5T9BfkRfoX+DJ8jcd
	SvJPcTdIDyTHYRN1r7n8MsIAnKSxJC/YWOs0CKP9UTMpHfXMPmttzrcSCLuFaRhP
	w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ssw68078-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 14:09:57 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 569CtnTG021376
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:09:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ptgb0ps1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 14:09:56 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 569E9o1f028485
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:09:56 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-63-52.vpn.oracle.com [10.154.63.52])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47ptgb0pk2-5;
	Wed, 09 Jul 2025 14:09:55 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v3 4/7] providers: move network-generic definitions to net.d
Date: Wed,  9 Jul 2025 15:09:45 +0100
Message-ID: <20250709140948.15090-5-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250709140948.15090-1-alan.maguire@oracle.com>
References: <20250709140948.15090-1-alan.maguire@oracle.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507090128
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDEyNyBTYWx0ZWRfXzk01pxzDxN11 LaaJmNlvCrT9VBCsWles6zJrj738jXndzfZjFgwac0UB9hxR63IRTnSMInkiU4Iw2gXv4x7Y67L 6IdygW1KOjgToYcm5BGaCuHqdJqz+VGM771GGU2CAYmOBEdKje8Z8ze5wevoEtZdCtmHC5e42ZF
 MC9sw8E+t0iHZjvIrXWd9/lQzKTwjoQKZMDanub0Fb/qpy9xkJziTysy4ga5Xh6iHRQ6/S5MdAC moJQzJqWL4xuEe5GXBR8M7wYOTqfMylSzWdV0BaFZBhvuxvK1HEGX4lbNfAcpQnrYZKSWNA9Sc1 ddP1lPYXFCwAGt+bp/j7Vj75TC/nChCqO8YTPFLTTzlYClmMauczZQM6tKn6v/daTlpBqcBIg/W
 CVwUfJ7icD86exFiW0glLulvROsZV4QkM9XoDqr47Jl7V24Uaat/2jH6gKvhAq/qak6M/lxM
X-Proofpoint-GUID: 1Z1_LOQ1fhsllujmhQaXNIPxv-cp6nxq
X-Authority-Analysis: v=2.4 cv=KZrSsRYD c=1 sm=1 tr=0 ts=686e7835 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=T-mFTDMhS4KWiEwUP_MA:9
X-Proofpoint-ORIG-GUID: 1Z1_LOQ1fhsllujmhQaXNIPxv-cp6nxq

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

