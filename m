Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EE278C75
	for <dtrace@lists.linux.dev>; Mon,  8 Jul 2024 14:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720450454; cv=none; b=ME7AzOl1ylXaeozGQo7r2V74noCzeBjTD+54GKHF3PiIbE9oeg75arBu6QsvCa6HzRBPxAK402/mpCa1FxEeLp9LTV02D018cwvJnaGWpWxoQ6dfja+wF82SJ953opOG9xnpqOY4atPOGvLN5lcGlfTL8w4XWyVa5jqjKvMV4LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720450454; c=relaxed/simple;
	bh=knnFCAF+SepRnc3ng7fnkoYu2Xr9Yj6YC9mSnz5dPKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RTS287/pIhVVdoNV+pACEEVC9ZNkaDcXl+WHj60XDWJyF0pUV5LH5WydXxY1vnSZaV6kffW+btmeqbMRgBA2SW65zU3VloZRfLB5c0CUxKdYqj1TctvZr8RDukKXEjoZU8pccgFJGVKbq6KPZ/NqJ/tRfGHeKKzzt81lOCB3sAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gRRMkTlj; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gRRMkTlj"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4687fcuZ004442
	for <dtrace@lists.linux.dev>; Mon, 8 Jul 2024 14:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=corp-2023-11-20; bh=L
	ELa3gYpnV1l7vXFqWZzMvWuBa6VmnqtbOg/QI59N2w=; b=gRRMkTljghNjXX9ny
	Vc+b/PR8UQFRXbciHChx/fQ4MX44pOWeEgkjXQ2NakzT+u/D4bSrJqYVK+n9IwnX
	d8D6JOymrv0ZueT2UvwkaaENm84Vt2vkcF0yg9kBKm14nXJrEZ5kVR48xlS5VOAw
	ZdULaeLXF/r9KbbKxzc6IvEX5bmJXzBM9JfPZIH3235IZGsrCdpwPUdhSjNlvPTi
	O6AX+zhNEFeEM8lFfxW2P3vNayil5QjXER+K7zSUh9P5yA33GED8UgcYQG2cl69f
	OEeFmzjkvaeZQKH83Oty7PShy0+YSHOLrsBveKz634kotkl8p8KFIOesb7WNOoyV
	bQL7w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 406xfsju63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 08 Jul 2024 14:54:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 468Er0OI005052
	for <dtrace@lists.linux.dev>; Mon, 8 Jul 2024 14:54:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 407tvc8j7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 08 Jul 2024 14:54:11 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 468Es7xu014056
	for <dtrace@lists.linux.dev>; Mon, 8 Jul 2024 14:54:11 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-205-48.vpn.oracle.com [10.175.205.48])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 407tvc8j2a-3;
	Mon, 08 Jul 2024 14:54:10 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>,
        Eugene Loh <eugene.loh@oracle.com>
Subject: [PATCH v4 3/3] unittest/print: add test covering module-defined type
Date: Mon,  8 Jul 2024 15:54:04 +0100
Message-ID: <20240708145404.1673045-3-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20240708145404.1673045-1-alan.maguire@oracle.com>
References: <20240708145404.1673045-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_09,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407080111
X-Proofpoint-ORIG-GUID: 3dHfaQbFKkJ8lpRvmdwKA60aeCEIbA7b
X-Proofpoint-GUID: 3dHfaQbFKkJ8lpRvmdwKA60aeCEIbA7b

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

