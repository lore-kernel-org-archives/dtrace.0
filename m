Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D0A1304AA
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 04:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714105886; cv=none; b=q7eIoo6yWKWJf7DYFEZrshqTdVS2GL1f/75HAdNeutv26E4iHUBsjX1jvYvDiezWEC54Tt4FPe9vLoZiguCNC3UoVcwq7V4UsLycr3nOpqhMeJ1uCzHBsMA9iRzP+aW/InCrhS1ttSC9rm7m8PhfO4R3y62eoueXEYZjRL3p86k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714105886; c=relaxed/simple;
	bh=iam8MwFE/G258bb7PcXtNiw73gGBsx5MYTiSEbWWHf8=;
	h=Message-Id:Date:From:To:Subject; b=uvz5Hcp5JJEpXkcs00AQrwH7ONlQ7Wuj8cxl1tuihKYm72n6E8HF8xyQmhjtzpRTFPKaCsg5LAIFHFR7VJdd2QWv9iOTLLtbvybs+23v+RAD9m9FyIRXXkCYO4NIJZoJVCN9k1DDC46dq2WNDBDZF6gQIqWTL5huBTGJJSC6jvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CQDX/9+B; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CQDX/9+B"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43Q43lWo019245
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 04:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 from : to : subject; s=corp-2023-11-20;
 bh=nDRO0bwx4eQ/g0uluko7Vu9suRpctSyDFU7xyeHkb+Q=;
 b=CQDX/9+BWzpqksq+lE33bMjVZhnPQVYsqzJ+/8gSgVNM4gUhkGIX17sLml08dQzEKDo2
 a+pLYIVeMxYVU5FcDQF8y4RrjPUzoEwgxc8VP9JDcGQCwx7p7jl/5jLTwd2TZMMDNf3T
 yGQqSI9dgKevvbrJbrKlelEj6E5DSOUpSR8YGqo4MNb6y1N+fKX03NhdNePmvcqXy2h7
 UDQljjjMcyPoAuOTTlTY3csq8rv1bUngv98YTnr484WyDjqjYlu/+4iB1yHnyWMIDY1D
 vIjwrRqfMrn2nLZxUpGhdMTyxIqaVpLvKc91iOfj4vjrq9pMH2cB+1tLwtX3tQPseOlL kg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xm5auvpp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 04:31:23 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 43Q1KMup030845
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 04:31:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3xm45b8wh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 04:31:22 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43Q4VLTS004320
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 04:31:21 GMT
Message-Id: <202404260431.43Q4VLTS004320@pps.reinject>
Received: from localhost (dhcp-10-65-180-123.vpn.oracle.com [10.65.180.123])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3xm45b8wge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 26 Apr 2024 04:31:21 +0000
Date: Fri, 26 Apr 2024 00:31:20 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: use a more stable data item
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_04,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404260027
X-Proofpoint-ORIG-GUID: RQXjCLZ0V9rqOZuZwhBGOGhrN7KohkLF
X-Proofpoint-GUID: RQXjCLZ0V9rqOZuZwhBGOGhrN7KohkLF
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>

The runtime bounds check exception for dynamically sized arrays in
kernel structures depended on a kernel symbol that is not quite as
stable as expected.  Use a member from the mm_struct instead.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d
index 62c2e9a5..4d8dfd0b 100644
--- a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d
+++ b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d
@@ -15,7 +15,7 @@
 BEGIN
 {
 	i = pid - pid;			/* Non-constant 0 value. */
-	trace(`__start_BTF[i]);
+	trace(curthread->mm->cpu_bitmap[i]);
 	exit(0);
 }
 
-- 
2.42.0

