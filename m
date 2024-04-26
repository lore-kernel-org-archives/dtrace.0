Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEF81474BD
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 13:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714138415; cv=none; b=PBMpjQCy26iWg+pNQMXFJMCTBr4VArjowvEOA++fuuL8fOOlXypXS5kz8yEn8k30wRArsbol6+9Ygtyr/eRn7hKiz4eDyTnM1t7mbBQwuW5D9qfc9g7Z+yViKSrtUIpKfHYScCjGGNLmX23jlKLE31FtSjAKDNzTJ7QwMBg92oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714138415; c=relaxed/simple;
	bh=HBQjC7V+NlfiLyWFbte6sx7TOXhBjoULU827YXBneZ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Kg4BmAuHtfDGK/LEHotyjlDSFFd3P+tQBs7v7Dwi2Lx+nJhmaGGHcfQi3uJaiVDRRBS1IIOjX+rmUXYmapj/5euxt8TX9eG8X+UKF2dAVtkfgNyW1UjWdDucA26UtSwV8MTEWaQ2RJn6kZ0niRMZvJnQY6SaHHaJxTfqzEOAOZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=grkV2Dvc; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="grkV2Dvc"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43Q8TkAF008310
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 13:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2023-11-20;
 bh=llIG6JjjLlw8heQRRk/aQlkbOvncMSEattPWJ+KRgdg=;
 b=grkV2DvcscUp069/Uzf8pQghzhxfdn7uAeTYdA3ZEWN5lp22Jq1ILMBLhC8cd3lIYXYg
 LWttK5FumjpUjJRObFTuAGqtdZJcT2fKAjNoLmTScLFAHY1y+XBcTD+V4NyMmReDhUA8
 sSWEZZ7tiHUk88zJE1l4PoO8/+qSlrEu7oDpxwYxk5abJVu4CYAhTRjvHH0FTAVJTrAs
 Br46NNJ8FdigQYyu6C6RmpHhf+OPqnccn/E8yM3iHXKTsLo9YJb+aACtwvqbXW7IZrn6
 VuPg0kXjvt76IgxCMAWca7MTTOv//wp2QPbk9/NONScrHqaJI3jcvrYIr44pbA+Pl4Rg 4w== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xm5kbwv4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 13:33:33 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 43QBRKCP001732
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 13:33:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3xm45cdrh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 13:33:32 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43QDXTA1009511
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 13:33:31 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-218-239.vpn.oracle.com [10.175.218.239])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3xm45cdrdr-2;
	Fri, 26 Apr 2024 13:33:31 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>,
        Eugene Loh <eugene.loh@oracle.com>
Subject: [PATCH v3 2/2] unittest/print: add test covering module-defined type
Date: Fri, 26 Apr 2024 14:33:27 +0100
Message-Id: <20240426133327.578092-2-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240426133327.578092-1-alan.maguire@oracle.com>
References: <20240426133327.578092-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_12,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404260089
X-Proofpoint-GUID: 0QGPhTGGdGq1GiG3whHH9V-Z_XA_F87v
X-Proofpoint-ORIG-GUID: 0QGPhTGGdGq1GiG3whHH9V-Z_XA_F87v

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
2.39.3

