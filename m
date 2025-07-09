Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51022E54BC
	for <dtrace@lists.linux.dev>; Wed,  9 Jul 2025 14:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752070198; cv=none; b=fm5MALTuNpeJ4e+3PLjVrqDlSdwRPwNEpYxeRGs9FzB0LkfOwjXKg/e9gAnF1VtJEjZTgxPW8TOPRJgw/yoVO1Z4AD3JEsXabo82guXdmvhwfrdLCr7+2g+baORTZ57vwm4uaaE7nBH5g3rbHpPg7U3Jum92zm9jFWM+DRxrAtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752070198; c=relaxed/simple;
	bh=2EOLPD5r+z+5/8EjAICHjxOokUYGWb/hUEFBBPKN/ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rUqxWLj+36+Crs5XSsu1Dxcmx4/+8Ymw22581ZQHRrvGCWgm5dW+x1VHIjd1vSEItxeJiSvQlif5HVv7GbOT07Kn7ppnsXE1CZRClymjXuzzJdA+wF6irEDBp04mSZI17IMVEuGcoNskSUN72cFWRJ84acf0dQEPYgLF0IvcYNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UEkrhNNz; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UEkrhNNz"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569DZDSb000809
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=tXo1s
	dtWmsLvoHMbqj4m3Sl6OYHMnteodTjn64ndSqc=; b=UEkrhNNz86n+Jku3NPOz/
	PIBbzSeEWTOQWefK655bwmxXDt1ZYlWL9AgxsOiPZr/hpDspkGv8YF4mmFFHl/rb
	OqQdyJUq2cihSe9KqzsGcp73nE0u1MgW4ln3Wy4VJ5rQBF0sf5cqoAZ7YTEz/t/o
	saWt99i/52qR3TXCSfKzFKCLTWIifOTZXgW1is3+od1DvNR5jKmMirbmThVp+ShV
	qGylncQTnMslN/fAyueWVV9sq+W1/lpwgmn2tTC79E+L8tLeNs6cZiXeiYGLnrVX
	485hzyXfXIF2CExtclSrkPElkIQrUuEw/azNvgBqDdGfjI5OJJppAJiZ/wDRLcJu
	g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47sscvg2jc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 14:09:55 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 569CVd2t021599
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:09:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ptgb0pqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 14:09:55 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 569E9o1c028485
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:09:54 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-63-52.vpn.oracle.com [10.154.63.52])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47ptgb0pk2-4;
	Wed, 09 Jul 2025 14:09:54 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>,
        Eugene Loh <eugene.loh@oracle.com>
Subject: [PATCH v3 3/7] test/operators: extend ternary tests to cover inet_ntoa*()s
Date: Wed,  9 Jul 2025 15:09:44 +0100
Message-ID: <20250709140948.15090-4-alan.maguire@oracle.com>
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
 mlxlogscore=612 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507090128
X-Proofpoint-GUID: qolnkx6ahv9XOToRQgQK-BA_8rbcuO9q
X-Proofpoint-ORIG-GUID: qolnkx6ahv9XOToRQgQK-BA_8rbcuO9q
X-Authority-Analysis: v=2.4 cv=Je+8rVKV c=1 sm=1 tr=0 ts=686e7833 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=AtMPcZrpWxHZxtp0EUcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDEyNyBTYWx0ZWRfX3S+EhQlgmByS ggWH0xixXQheq8VE3pkm/vAURQ+A7Gsn64SkkCRfVPmseOY+zrqriz5dwkulTpobEIfuwZUVycF YBe59QX14tU+6vGSab8n6XOxuCaByCk2EeMm1xdhBPxOKaMxKk1g1/464v7KmJPeGJSe0rM8DUm
 1yheMm8Q43yU7YeNZRbtGCWqN7uOWIwFUC+qf1+Wnubrvex/3TzNS/wbfa8Pv0/CjMIKlaI8jo9 aMfzsjB7wx7mtDRBDKWNQERvIomLpz3HXZAftvhie+WXXXkLErCXgDvVrDIINU85I+uzhZbnfO8 JSDgQEsajKRXJp9zhUwvS/DonybIssrSEhlO/RAkw6ywgDmzJf50L87IPcndIDAGJwnSU5+d4zk
 GgGJpR2NBWN0REgZj/BJs1Gc3yv7V74yYnPb7oECXR9fhZCrCT7iRdGBWsbO0elOdRNWG0uh

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

