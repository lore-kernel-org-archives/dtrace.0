Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3761E492
	for <dtrace@lists.linux.dev>; Wed,  9 Jul 2025 14:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752072431; cv=none; b=Lf3z0meWpcQu30uRFbgWY04wEtQ40fFJtGFeNij831RoeX4mes+zSOUEwjuhCQukKDkzvUxIkgwoRm48Fe4mmFGVqgGo7VzDRuNTneaIVtZ/4yGYQ+KE9r/w7tyccouZCkUR1ZLnuEvjFZBDSMBx2/o0RVSH4GaITxd7Rz15324=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752072431; c=relaxed/simple;
	bh=2EOLPD5r+z+5/8EjAICHjxOokUYGWb/hUEFBBPKN/ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IS313TszwlNtRfq9KKC6XVJ5ue9VkjjQNf8xo5sLQGqJD/7paMpjZ0LV3NpD45Vn+gRBYHFyLQ/mDqnFnlxl++hNcCh3s6HmdKm1wFP7nf88AeX4575n0pH7h0LqD/6bBm2D955Pte9m99TnPtLOSHIKnB/bJaI+3Tq1SWeBCmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CCtCQWUy; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CCtCQWUy"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569DZBWs005809
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=tXo1s
	dtWmsLvoHMbqj4m3Sl6OYHMnteodTjn64ndSqc=; b=CCtCQWUytWQLBUNigYe1i
	weugGr4wB4dUKpIB8pHpxwUZcAw3UwFAliOL/vO3W6Pj6pD31OBYEFZKvgJPCj2I
	WWRSQoLXuDIb23bQE4LGEJt77i6xx1RBTRLliHMV/bRvvoruCqmLvaPP4Y7D75kd
	oAQYzPFNnh1JF0azJdE68UpGfWX5Low/MvSlmG6JP6s4ng8dc2LVJOhcXxrNuzWd
	Ax8oCucdLYcWtwZEarjTSfBXzXKYQmGXL8SiypQd94gsUK4sFO8GTn/OeBCR9YFy
	4dHIy2HdBcH37OAKYJwsypM93PjrBcXe3it0g2RMG+joqfI46ZZ2o5L+JlLnMwsi
	w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ss85g8nw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 14:47:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 569EUY98023632
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:47:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ptgbap1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 14:47:07 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 569Ek38W034091
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:47:07 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-63-52.vpn.oracle.com [10.154.63.52])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47ptgbanwh-4;
	Wed, 09 Jul 2025 14:47:07 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>,
        Eugene Loh <eugene.loh@oracle.com>
Subject: [PATCH v4 3/7] test/operators: extend ternary tests to cover inet_ntoa*()s
Date: Wed,  9 Jul 2025 15:46:56 +0100
Message-ID: <20250709144700.20591-4-alan.maguire@oracle.com>
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
 malwarescore=0 mlxscore=0 mlxlogscore=612 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507090133
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDEzMyBTYWx0ZWRfX44sQp8u6dHXz 6Gj69492tDntkWZsGd5o6P8QhOxGOyQb8Ah++EwEZdrxMKbnmIutb0Mqna7i7aAGvq9X5+vYv5p HDZgbTI2Gv5+0orX3j7RJZTHMwmmYXkidgllyOWP8ZBL9Lt5Hpo7AlfU4P24zgadt+SINcZGggZ
 YM8De/F/uBD5G44Z7ObHTyVlymx8EkD/jzobyfCQm6kzaZzvJqg0YP8cTLS18j03QluhyWO1x8P PHlhMxeGEpsoKZtKi/oYJo9pA1A3AutZavK0fob/0uM5jtIDU7AVYXJs6vjYpPR35/jUopl/m6o fxM3ecY79AtDK1tU/87AEEv4LYxsJ9sLMTCcMPxqTqYsj7CXIaeQGsX2rJTi++DlytD9K+6gMwg
 omjWYLH59j2/G4WSvHtOr4enTyrpJ9ZTbsrsJVpe+URcFrdT5bH36Wbo6WnGsdKU+iv3/AAX
X-Authority-Analysis: v=2.4 cv=a+Qw9VSF c=1 sm=1 tr=0 ts=686e80ec b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=AtMPcZrpWxHZxtp0EUcA:9
X-Proofpoint-ORIG-GUID: 2ZzQAXaeU4TgKgIJM0brlsFsrilDg_Cp
X-Proofpoint-GUID: 2ZzQAXaeU4TgKgIJM0brlsFsrilDg_Cp

inet_ntoa*() require temporary strings and ternary operators
need temporaries for left and right; ensure ternary ops succeed
with inet_ntoa*()s.

Suggested-by: Eugene Loh <eugene.loh@oracle.com>
Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 test/unittest/operators/tst.ternary.d | 20 +++++++++++++++++++-
 test/unittest/operators/tst.ternary.r |  2 ++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/test/unittest/operators/tst.ternary.d b/test/unittest/operators/tst.ternary.d
index 9d47fcc2..aeced7ac 100644
--- a/test/unittest/operators/tst.ternary.d
+++ b/test/unittest/operators/tst.ternary.d
@@ -8,7 +8,10 @@
 /*
  * ASSERTION:
  *  Test the ternary operator.  Test left-hand side true, right-hand side true,
- *  and multiple nested instances of the ternary operator.
+ *  and multiple nested instances of the ternary operator.  Since inet_ntoa*()
+ *  relies on temporary strings, and ternary operators need both left- and
+ *  right-side temporaries, test ternary inet_ntoa*() also.
+ *
  *
  * SECTION:  Types, Operators, and Expressions/Conditional Expressions
  */
@@ -18,10 +21,25 @@
 BEGIN
 {
 	x = 0;
+	y = 1;
 	printf("x is %s\n", x == 0 ? "zero" : "one");
 	x = 1;
 	printf("x is %s\n", x == 0 ? "zero" : "one");
 	x = 2;
 	printf("x is %s\n", x == 0 ? "zero" : x == 1 ? "one" : "two");
+	ipaddr = (ipaddr_t *)alloca(sizeof(ipaddr_t));
+	ipaddr2 = (in6_addr_t *)alloca(sizeof(in6_addr_t));
+	ipaddr2->in6_u.u6_addr32[0] = 0xffffffff;
+	ipaddr2->in6_u.u6_addr32[1] = 0xffffffff;
+	ipaddr2->in6_u.u6_addr32[2] = 0xffffffff;
+	ipaddr2->in6_u.u6_addr32[3] = 0xffffffff;
+	printf("ipaddr is %s\n", x > 1 ? inet_ntoa(ipaddr) :
+				 x > 2 ? inet_ntoa(ipaddr) :
+				 x > 3 ? inet_ntoa(ipaddr) :
+				 inet_ntoa(ipaddr));
+	printf("ipaddr2 is %s\n", x > 1 ? inet_ntoa6(ipaddr2) :
+				  x > 2 ? inet_ntoa6(ipaddr2) :
+				  x > 3 ? inet_ntoa6(ipaddr2) :
+				  inet_ntoa6(ipaddr2));
 	exit(0);
 }
diff --git a/test/unittest/operators/tst.ternary.r b/test/unittest/operators/tst.ternary.r
index ec30800e..72201682 100644
--- a/test/unittest/operators/tst.ternary.r
+++ b/test/unittest/operators/tst.ternary.r
@@ -1,4 +1,6 @@
 x is zero
 x is one
 x is two
+ipaddr is 0.0.0.0
+ipaddr2 is ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff
 
-- 
2.39.3

