Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA66516FF23
	for <dtrace@lists.linux.dev>; Tue, 25 Jun 2024 16:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719332559; cv=none; b=L0x7DIw0JaobQvMuXE+fkRlGOWhZxaLS67jTVf31RxWj3EGscado/clVEtDzwmW+Gw+XlAoC8CRKfdNk0awLVXk9uSokFrpD7Z2G58RlaFfreMALec2EHWqvlGfbAyvz1/J6uUUe7Tz7akKnKrJ6Mjm43IBo9vegEJOkZQbjpv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719332559; c=relaxed/simple;
	bh=fc6g5EGhSaxI3ED4Tc+WAZ86WRdctPwuHhDICgXoM8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r4+JYbQgWnHBs9jMKrP5uryE3RWQAFt43z+aoyYArvuZM3Esk4kw2xpuquR70VdhdbShkVdy2dMACE1mPnSOpm/GLQQvAqTfXQBIOp++cw0Lt/q2tVBJIuGZiApnsSmckf+2ib1fdnTOmYfGo7YwVeBOhYAtdbz9uKT9nuQLb3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=g1x85TOU; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="g1x85TOU"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PD3XEW022210
	for <dtrace@lists.linux.dev>; Tue, 25 Jun 2024 16:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=corp-2023-11-20; bh=S
	7lns0gppB09V2uy59q7gKHr+fc7OjTDwwbvN4o9GTc=; b=g1x85TOUd0aNb86y0
	eF5x4Gqrm7vjrYzrF0Em5rkGWM8ddRQc74/OjpFa29PEO1+9alwRU9kEXPpGfVTs
	CN2WXrNDv0I9tjkT7tFX/qCEe1CV1KW/rI8hUAYS4R3Kntidc9tEX5N5+2gqNslh
	BVMLruSGPePLdN0wvuJ2uGRT8TsgX76KqC4y+5jhYgMb/VpWlOfWa4fa6zlZgzmA
	oQjYDh9Jy45jSDJLJW1tLJ3sGZgwkjP2kXOb/dtl1t9zQKzi0k0jZg3iRf4zcQRw
	YY+WDg2D2Kj2lhJOLg7EQB5PIBUL7QLKnCJMdHBimCyJ4tl2HYmBhBDrc6GINeJI
	WTyAw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywn1d127h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 25 Jun 2024 16:22:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45PFiwUS018108
	for <dtrace@lists.linux.dev>; Tue, 25 Jun 2024 16:22:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn27s9f7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 25 Jun 2024 16:22:35 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 45PGMXnc008409
	for <dtrace@lists.linux.dev>; Tue, 25 Jun 2024 16:22:35 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-163-9.vpn.oracle.com [10.175.163.9])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3ywn27s9cn-2;
	Tue, 25 Jun 2024 16:22:34 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH 2/2] unittest/sched: remove dtv2 xfail
Date: Tue, 25 Jun 2024 17:22:30 +0100
Message-ID: <20240625162230.1439537-2-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240625162230.1439537-1-alan.maguire@oracle.com>
References: <20240625162230.1439537-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_11,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406250119
X-Proofpoint-GUID: ZeaJvr-SIIIpcmKAorZzlUUadputspb0
X-Proofpoint-ORIG-GUID: ZeaJvr-SIIIpcmKAorZzlUUadputspb0

...since tst.oncpu.d test passes now.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 test/unittest/sched/tst.oncpu.d | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/test/unittest/sched/tst.oncpu.d b/test/unittest/sched/tst.oncpu.d
index d2c2ce57..7a33bab4 100644
--- a/test/unittest/sched/tst.oncpu.d
+++ b/test/unittest/sched/tst.oncpu.d
@@ -1,11 +1,10 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
-/* @@xfail: dtv2 */
 /* @@timeout: 15 */
 
 #pragma D option switchrate=100hz
-- 
2.43.0

