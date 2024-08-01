Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0A114A0AB
	for <dtrace@lists.linux.dev>; Thu,  1 Aug 2024 21:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722547759; cv=none; b=Log1iRt0QXFw5gWYRsYw9R/+E9ApafV0ji1T11sjqSEcObSQllSOXhm1C5KXwVn/rieDj5SBr1TOUd0303yccywqwsl7sZHoHZUpd/y1YpiHQEL1pCKA50qtqNet/IHF4sahwY1CsCnYdvnbGfP9au3LUoudqUOwSLZVLdJttws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722547759; c=relaxed/simple;
	bh=knnFCAF+SepRnc3ng7fnkoYu2Xr9Yj6YC9mSnz5dPKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hUbiiOhFqrYyhWNL5E1hFv09k9yQPf5YLZpw3FsHmTm+awJOcxnzA4qRhgccndw1ULIhQlUIrU9wSqGG0zPIe5iA3he5v3VpIjQ8QgCg5C9OIo+TamffVYpY4hd8oQ+3vqZyyGOccGtoM+tXhtpAnXkaAWqeRuY3TjqmMYqWm/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YbmrUDeQ; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YbmrUDeQ"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471L67kM018699
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 21:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=corp-2023-11-20; bh=L
	ELa3gYpnV1l7vXFqWZzMvWuBa6VmnqtbOg/QI59N2w=; b=YbmrUDeQtk7Rz0Wc5
	JWv7jes+ZK20qzFQnH5oiDIZ+FZWB3YAgHNw0VXHio99uSDbKw5iiTuMKZfay9A5
	WfH1YUSS43uS7GW6po/Ag9AMrXlVW8rapIv1FiGElibpBMWGfjHvUU+UMdjCB/VO
	zbClBiBv/sSjq2p2xCBm8fZAuhOB6eRDVLDw8c+tzYYpq3mOMK8l3yfZ6uHApeeB
	SL4HPAOoVpConPwvWIDnYy9A+OTgAj9rBx9kDNO7G9wRHqcn0n8j37dcy/FOLkJF
	FKYYSB3gHi171CJjxbyzIL7LFOnR7bk5jaj1cj04c1ey59JVWRN6EmfRZKglR100
	O02IA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mqp22ucv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 21:29:16 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 471LPoBZ019025
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 21:29:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40qjmu7axt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 21:29:15 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 471LTE9O003475
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 21:29:15 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-222-237.vpn.oracle.com [10.175.222.237])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 40qjmu7awr-2;
	Thu, 01 Aug 2024 21:29:15 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>,
        Eugene Loh <eugene.loh@oracle.com>
Subject: [PATCH v5 2/2] unittest/print: add test covering module-defined type
Date: Thu,  1 Aug 2024 22:29:12 +0100
Message-ID: <20240801212912.2300220-2-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20240801212912.2300220-1-alan.maguire@oracle.com>
References: <20240801212912.2300220-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_19,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408010143
X-Proofpoint-ORIG-GUID: zBDWqdwqBu2ALKDgLYe7UJ8DgfQ2dSih
X-Proofpoint-GUID: zBDWqdwqBu2ALKDgLYe7UJ8DgfQ2dSih

print() action tests do not cover module-defined types.  Add a test
using a module-defined type that has not changed recently.

struct tun_page was chosen since it is identical in UEK6U3 and upstream
and declared in tun.c which is a module on most distros.

Added tun to test/modules as suggested by Eugene.

Suggested-by: Nick Alcock <nick.alcock@oracle.com>
Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/modules                            |  1 +
 test/unittest/print/tst.print.modtype.d | 18 ++++++++++++++++++
 test/unittest/print/tst.print.modtype.r |  6 ++++++
 3 files changed, 25 insertions(+)
 create mode 100644 test/unittest/print/tst.print.modtype.d
 create mode 100644 test/unittest/print/tst.print.modtype.r

diff --git a/test/modules b/test/modules
index 53dc5544..0f01d6e0 100644
--- a/test/modules
+++ b/test/modules
@@ -2,3 +2,4 @@ ext4
 isofs
 nfs
 rds
+tun
diff --git a/test/unittest/print/tst.print.modtype.d b/test/unittest/print/tst.print.modtype.d
new file mode 100644
index 00000000..ed68b492
--- /dev/null
+++ b/test/unittest/print/tst.print.modtype.d
@@ -0,0 +1,18 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/* @@nosort */
+
+#pragma D option quiet
+
+BEGIN
+{
+	tun_page = (struct tun_page *)alloca(sizeof (struct tun_page));
+	tun_page->page = (struct page *)0xfeedfacefeedface;
+	tun_page->count = 123;
+	print(tun_page);
+	exit(0);
+}
diff --git a/test/unittest/print/tst.print.modtype.r b/test/unittest/print/tst.print.modtype.r
new file mode 100644
index 00000000..b9736607
--- /dev/null
+++ b/test/unittest/print/tst.print.modtype.r
@@ -0,0 +1,6 @@
+{ptr} = *
+                                            (struct tun_page) {
+                                             .page = (struct page *){ptr},
+                                             .count = (int)123,
+                                            }
+
-- 
2.43.5

