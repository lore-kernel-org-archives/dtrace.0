Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DEB1C0DF0
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 17:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719595002; cv=none; b=VD4jz38CQse4ycPpnSrUNiWl1QomZPDAjm5XVuXtqOZTxyI1QWHdRuolFO+i9rQuFYY5KrcqK79e+PONPrmYJqD0CEvWOPbUb8u9bzV1EnwzYFncGypzoQAjRXzXvWRoYahPMG11eGxCqtUmJakwxQaoaZwbysb1ds9VIiAAq/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719595002; c=relaxed/simple;
	bh=IPXHGHFQqUFcKTjc2vQsaIeXCQ6360usrXHOXJrZNnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a0pyypC/TE0PpZGsfvEK/7UhIgrSOGv3ExPgq5o3qNAywS1P39S7ab4qK5xvgObQn+7X8VyAEYxxO6QQDuExQZ34uuLDf0Zc5gqY4R/kAYgz0yfAbHNagiDYYN0dGr9ygtIrMUPRQ3wWdlI8XXwEgoa6u2oOyWkfKsmmMgxyGnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DsGFtK3K; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DsGFtK3K"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SGv9sv015670
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 17:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=corp-2023-11-20; bh=w
	ydYHXFsEUOoEi0fmEUyZSuMgsvPqJehujbMEhA2BSM=; b=DsGFtK3KICohluZon
	rie2+JVk5igqzenAwQqUJ7wRKDytUk6eOpoKPWffAAqzxbzorLgWpGrHyIrF+Hgd
	g/GfYY1K63QrJRAT0jUWWfqNVagUJv65AC8GWQXrCRln/KPj3gS3wLV3wwbe0XCz
	zAcUdx1bQE4zXbrWKsyXyY3N7S+XPvJPHrx3kN3x7gxeU3gvNnOT/QHJd1GUkIpS
	0rcd98F3M0Kx0R2/aAXCmaZBeA+ZFXgS//a2ZOpil1OP+puasHTTCVaDgM/dq3IF
	BiQRY+0L/CMAO5LFssEDDUC6sNh6xGYxUJUnGh3nn8F8cOwSKjRpOc2IK3TQ7rA/
	SPAYA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywnd2rs4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 17:16:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45SGcseL017844
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 17:16:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2by4xy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 17:16:38 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 45SHGaQ1012968
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 17:16:38 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-222-155.vpn.oracle.com [10.175.222.155])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3ywn2by4wu-2;
	Fri, 28 Jun 2024 17:16:37 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2 2/2] unittest/sched: remove dtv2 xfail
Date: Fri, 28 Jun 2024 18:16:34 +0100
Message-ID: <20240628171634.2801954-2-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20240628171634.2801954-1-alan.maguire@oracle.com>
References: <20240628171634.2801954-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_12,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406280128
X-Proofpoint-ORIG-GUID: K5SKBuSRkmv4TTYjFbuxY5Elvl3MfN4n
X-Proofpoint-GUID: K5SKBuSRkmv4TTYjFbuxY5Elvl3MfN4n

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
2.43.5

