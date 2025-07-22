Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED612D29D8
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753178879; cv=none; b=Z5EO7VpgUdjhpUj3kbWSjIUQ7hKoJgqwA2fWByZObtJOyezdKlyQysNlgkVQHIax1vsoY1a0zcTdUgUWuKv42465b7Y2eLtplBmoTRh9QnxHd5qa0OdPzrh9o2Y4uUyH8sjfXRbgy9MBXoV1Eg2wkdNTcZAGqgfm3O5CU+k0kkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753178879; c=relaxed/simple;
	bh=FaRXc7rbwcDNvLMYJ9WCaxcUWNHQLenTUfL8kPqR3ZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UBgl2ZFi1GZKksZMHMjYWFyitzn/OZxJn2+vuGQhR+7wFiraZ40z4zwwJ3HTGVwA8M1uX0dMQjBdQQKVCdBUyldb0O8e6OWT/tBJ0TkexNDl25N6oh92aHPeRXWfyuqXB/Fcgy52Km3UPtfs8mG6sgAmNttgdHUA6BWSlZncZJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NKB8u86K; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NKB8u86K"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M5TCx5029312
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=VVsfg
	+nKQiCc0q+CMvgbKppJ55xJG1pmiw8zjbZM/to=; b=NKB8u86KFwZ6SGVPWYKX2
	/DICFvccApWNWVebp6cLODwhRuTNlDlTNLzKqpWcGEY8YQ3LhwsdbfIY6iIVrKFr
	lVi9s4nKFKpzPBRlbZbhROj84pTZ3vs9NDvQd4GEAdWaRD4Hf5/XqdOAxuClQrsT
	hk8QmuOBO12ndR1lJGlSS4mpnG3BcIfGseHB3h/GQBFpbOxO+CiS9ShdgFbMcgzn
	B59c943XsUjAjqS7zv0nbk1klSpCmoLEthGO6hqKcqStoiPPl1Yhfk5q7cRrV9VZ
	VWnH1XE6mLw6k8N33lsk8dbJQgUCkC8LCknwIABEzizTLEthmM4/Rp14yc84zkM9
	A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805gpn0ae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:07:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56M8SdBB011708
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:07:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801t940jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:07:56 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56MA7o6F011213
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:07:55 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-50-138.vpn.oracle.com [10.154.50.138])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4801t940f1-4;
	Tue, 22 Jul 2025 10:07:55 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>,
        Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH v5 3/6] providers: move network-generic definitions to net.d
Date: Tue, 22 Jul 2025 11:07:46 +0100
Message-ID: <20250722100749.233821-4-alan.maguire@oracle.com>
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
X-Authority-Analysis: v=2.4 cv=TfGWtQQh c=1 sm=1 tr=0 ts=687f62fc b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=FU0t1Jxay5rIEeezET0A:9
X-Proofpoint-GUID: ddOQSJocMzPY_9WzBvL_zYTPbB16-ceE
X-Proofpoint-ORIG-GUID: ddOQSJocMzPY_9WzBvL_zYTPbB16-ceE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA4NCBTYWx0ZWRfX8jLpw2Y4SB5z
 Byox+0d7OrLdq5egOjtZTiKgn3kWC3geL4HBuVWDS5TyUafbYS+xr+6fwzgfWOmIOqzeeU1Lnof
 wdxKyT8TnwVtxWsbamYSvDZJk7sskFJpA6fiRJ3e9YmzFzHAHIlA6Xg4h8Ztx7KVAE7xyCugzmh
 5hUfxGcKQsWejwQVLpYu3xprfwhqVJbfj/10EVTPS65Zl134S9eM4wm91M+IoehbepyVS+Lp8d7
 hslzNmdwPPsD0iegtEb5dEp8PA4Aht7qEPBhapEXum5yuviIbMJg9Z2jRO5lGsaMgvLlMIdmGLG
 +1dBWONzWGXDtCIVsgqgBQma9M7OjxPbj+OQb7QnPqrtuGZJ3KIhQFCmI+S+gEwLDBB0MVwB5OR
 g7HjKxku2SmlRWzF+UJWbVN2Q/7vhrsNNYO2nADsStFwldN1VXA9Vbf3gWuFDeWKpojFPLjp

tcp.d and ip.d both need some of these generic definitions so move them
to the net.d library they both depend on.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
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
2.43.5

