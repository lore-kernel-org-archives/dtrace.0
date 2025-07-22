Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FB222B5A5
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753178878; cv=none; b=HB2AcZiHV8xj8BT7YG6aBhT0EFJ8LzOh3u7mApQGNV5W+dI8AWde8SDLscniqwKoXg8OwpDKkc76ITFiWziay5g0f/lQdK61Pde1/fzZ+LZmKr25CS+/bhKHuW48ZGq7iMVH0/lnIMg0UHNejj/sec01h7A2jAuOdiPDPqAehz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753178878; c=relaxed/simple;
	bh=9tLW48D50V3+0dFHFZx4ccywOllIi8rQ/B7A+y2CxEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oGrQiNHeXu7PhCfTA6iho+akCT4kjIjGZl+J9iPCTEWaKfbrLZAUiEKeew1v72SfAL2GlOSFeeKDCDfJRWNUBGXLA5kJnzXA8S+SQ5yS6NVGArjrUVitt+pShLMv2F4jFhMRsJXybvliCMgPdRL0Njz48aVhiiLp+QIw8Ox6NkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nRbEWKnt; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nRbEWKnt"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M5TCso021334
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=URra1
	aU4TCyWfRepCZFGxR02w6s3Keb73MLm+UoxW1w=; b=nRbEWKntONYDYKvIObR5p
	e6V22fP7puvbL+Vu7y/tKmLXXUBCER30slIFXvAppr5hk30GJXYMGL85X6e4Nn9m
	PRadP0ZY/RuQfnObzQ5XgVA7ujdGCMREhCqhLpZllcwQVfb8n2NYWW6ZQLi0JQUb
	JeYqTky8j5VZo+x+fVRLlOinJjaH7L0yOlIp5ZDFQ9OUglRB6Z+hIB/T1esEYgbA
	wOUmGyuQlW8WCbwWATuv13vtPOM2tJJdeWj5NPoCrwK7ksYigIVM+9cU4nElv6wa
	jSh1D++F8yelFY5RXuIysTewYA2/arINswl5BkbvLM8E6Y08aZXRpQO33HgI9pZg
	A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805e9myww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:07:55 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56M8LQx8010759
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:07:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801t940hu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:07:54 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56MA7o6C011213
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:07:54 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-50-138.vpn.oracle.com [10.154.50.138])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4801t940f1-3;
	Tue, 22 Jul 2025 10:07:54 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>,
        Eugene Loh <eugene.loh@oracle.com>,
        Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH v5 2/6] test/operators: extend ternary tests to cover inet_ntoa*()s
Date: Tue, 22 Jul 2025 11:07:45 +0100
Message-ID: <20250722100749.233821-3-alan.maguire@oracle.com>
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
 mlxlogscore=547 bulkscore=0 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507220083
X-Authority-Analysis: v=2.4 cv=eqbfzppX c=1 sm=1 tr=0 ts=687f62fb b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=AtMPcZrpWxHZxtp0EUcA:9
X-Proofpoint-GUID: m-d7qcLtnaa9xwsnvTEsXEFd5X6KbvYr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA4NCBTYWx0ZWRfX+P1XKylfesvl
 +Z/Ih4hVQoS9Wnnx/eX3l/EsGQ1pPL9Tj0ztYhxJN2fjSdQA9pxOpxTIKiMLPMk1tnXsJFdoRJK
 k8c/k4WBjsTEkd9pDdEN/UEah3gIshBDDWjm/XLu450e9HJuG27ZVYzKO7L7fRgDvKjpwd1gEgp
 6shImmwVSlfp1YDlrFeagW9o+P5PjJR9wf3m5B/aJ2hTAqHkNLpaOgGDIRYwmDeKhLOWGO/lia4
 AiTRt8NOsfa7M10OMeDQja8QTj9vH28jVdfSMGfz3z0edZus7ZIO5x3KLPV2kF2tyarPX8GVRCk
 AeAZaL9yb8IGJFTAuxEyrLRqhDhw6l4gwkTMzmaY1bqeWMz3kjdQ3H8Xl90fszzuZG8IIFnGqFB
 08mjog0X/hd+jSKp2uCfNCHTmdElvSvFBBIhBGG3J4R6VXZ4S5d2i7bKz7RWoFh9mX2fvChk
X-Proofpoint-ORIG-GUID: m-d7qcLtnaa9xwsnvTEsXEFd5X6KbvYr

inet_ntoa*() require temporary strings and ternary operators
need temporaries for left and right; ensure ternary ops succeed
with inet_ntoa*()s.

Suggested-by: Eugene Loh <eugene.loh@oracle.com>
Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
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
2.43.5

