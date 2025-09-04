Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B29028A701
	for <dtrace@lists.linux.dev>; Thu,  4 Sep 2025 09:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756976512; cv=none; b=I0QtL7gqRQMXkflnAfIWWjhXuX9TZ5waOl+Y8MFxmEK19K80wVdiqiXy48EhQ87zK39IAL1A7qza//aciULbQXsRqj5goyoHIaJtEOMYLCRPwNFOsIRPrkzHqbQxSTu3/3TqeETaMoXs/D0izLmJS53XRHfLDZD9vZm7rqaRRuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756976512; c=relaxed/simple;
	bh=NYtbARx7cOIKmmelo2+WOGRAU6PEhG7ykxmakkpVdqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HNx+d5DEK3c8uQcGz9pywS1oaCgGm/2r/FCll3/v3+/Y94KXipRdKtIYH2Y1hPebmW5L1kO8OTTq+5Bv8L1oIV+pWqcQCqAHc5OnPL0hn/41ZtUhMktyEmrsm9gWGriNa78ToZmKGIYFacXPk+Z2mqBh7u4qI8tQY6DAsxHESxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MtpJKFPB; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MtpJKFPB"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5847OgeP031837
	for <dtrace@lists.linux.dev>; Thu, 4 Sep 2025 09:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=p4BMkyus+r4rWiCtF8+evfly5Uacc
	NiuaLPA8Y/pv+Y=; b=MtpJKFPBUpiVDE3J/1deY8SAqoDVCHL4cscGt+LN9a8wC
	YDWQsPOS5ThA7a7dYt1kaGxslhfPb1BKs5Siiz+5w224jtB0CrwUTkWTHq/lDJzi
	DXmQhNJqfc3pjFWi+GJIcOQJzw0fTI7ctLsYSmwP6SVMhCnQBNd7DLRswreiRX1x
	+8e/pDqup8tPd2HfSOrAdCk86DalJWiTlXOEDLZ9KKIgjlkaw4KdhPkOjLSQHP05
	6L0Ib6bXs06MZNjGjh/QPN2PLHvxT8YFWtof3Js+sa4FPHV8CF9nPsRzQKbby0Bh
	w8Jj55aDo5kK4CcM3VWgmSKkza9J2Yok9ElWfJJFQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48y6brg63e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 04 Sep 2025 09:01:50 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58490GRE040023
	for <dtrace@lists.linux.dev>; Thu, 4 Sep 2025 09:01:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48uqrhdqvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 04 Sep 2025 09:01:48 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 58491m12034122
	for <dtrace@lists.linux.dev>; Thu, 4 Sep 2025 09:01:48 GMT
Received: from bpf.nl.oracle.com (dhcp-10-154-224-28.vpn.oracle.com [10.154.224.28])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 48uqrhdquh-1;
	Thu, 04 Sep 2025 09:01:48 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2] enum: support declarations with a trailing comma
Date: Thu,  4 Sep 2025 10:01:46 +0100
Message-ID: <20250904090146.1047400-1-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509040088
X-Authority-Analysis: v=2.4 cv=QLdoRhLL c=1 sm=1 tr=0 ts=68b9557e b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=yJojWOMRYYMA:10 a=yPCof4ZbAAAA:8 a=au_fEubTuk-04qcyEo8A:9 cc=ntf
 awl=host:12068
X-Proofpoint-ORIG-GUID: 2QnHnAcngonnXXjQmkIbWOQZNcVOkqMk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDA3NCBTYWx0ZWRfX0ldxvABJMyo9
 Rz+MzhRDYe8mqL8TpuApLuuJaV28ygLaplIhzP8yKeTpEpYVcBGyfqKiBjrBwDSHGExnDFEBVqx
 JqPRTU3MhnlpWb04+Uqj+GchJBX9BqK4EK80ME6P2CLU+uRIyObw9xD/WgDVGiP6RaFhOZfyc1Y
 6nDuNltlBSj5XqYjN2G7d82Envmr4xDXH6mPDFWnXZqmIZ5J+7Z97kHFc8wdfTjgAHpI6aqWOB7
 EKya0E9bu4suQPVUrkHWM/BGek30bNsrVCzb5v374wlnELYoTp1FKw/pGiHEuvoVJA8x/4aItN5
 rOd8is2BllYvhUpiRKeXKoWBRCbT8qf6EYQ3zoulxlm3IDiHctLPFsW7l9VNVNq0ukwoQKWyPMW
 QSl58FUuJk+4ToARxrnZVZido1RSYQ==
X-Proofpoint-GUID: 2QnHnAcngonnXXjQmkIbWOQZNcVOkqMk

When doing python tracing, it was recently observed that #include'ing
a file with enum declarations with trailing commas fails; this is
due to the D grammar being strict about the last enumerator value
not having a trailing comma.  So

enum foo {
	BAR,
	BAZ
};

is permitted, but

enum foo {
	BAR,
	BAZ,
};

is not.  The latter pattern is used quite frequently in #include
files, especially where conditional compilation of some enum
values is done.

Relax this constraint and add a test to validate that D compilation
succeeds with the trailing comma in an enum declaration.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>

Changes since v1:

- fixed commit description, updated test to cover enum, anon enum,
  typedef enum variations for both trailing comma case and without it
---
 libdtrace/dt_grammar.y                     |  3 +-
 test/unittest/enum/tst.EnumTrailingComma.d | 66 ++++++++++++++++++++++
 2 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 test/unittest/enum/tst.EnumTrailingComma.d

diff --git a/libdtrace/dt_grammar.y b/libdtrace/dt_grammar.y
index 677cd869..7984b85d 100644
--- a/libdtrace/dt_grammar.y
+++ b/libdtrace/dt_grammar.y
@@ -702,7 +702,8 @@ enum_definition:
 
 enumerator_list:
 		enumerator
-	|	enumerator_list DT_TOK_COMMA enumerator
+	|	enumerator DT_TOK_COMMA enumerator_list
+	|	enumerator DT_TOK_COMMA
 	;
 
 enumerator:	DT_TOK_IDENT { dt_decl_enumerator($1, NULL); }
diff --git a/test/unittest/enum/tst.EnumTrailingComma.d b/test/unittest/enum/tst.EnumTrailingComma.d
new file mode 100644
index 00000000..fcf200e9
--- /dev/null
+++ b/test/unittest/enum/tst.EnumTrailingComma.d
@@ -0,0 +1,66 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION:
+ * Enumerations should support declaration with a trailing comma for
+ * the last enumeration value as well as non-comma case.
+ *
+ * SECTION: Type and Constant Definitions/Enumerations
+ *
+ * NOTES:
+ *
+ */
+
+#pragma D option quiet
+
+enum colors {
+	RED = 1,
+	GREEN = 2,
+	BLUE = 3, 
+};
+
+enum weather {
+	CLOUDY,
+	SUNNY
+};
+
+enum {
+	CIRCLE,
+	SQUARE,
+	TRIANGLE,
+};
+
+enum {
+	HEXAGON,
+	OCTAGON
+};
+
+typedef enum {
+	RIGHT,
+	LEFT,
+} horizontal_t;
+
+typedef enum {
+	UP,
+	DOWN
+} vertical_t;
+
+typedef enum motor_transport {
+	CAR,
+	MOTORBIKE,
+} motor_transport_t;
+
+typedef enum nonmotor_transport {
+	BIKE,
+	SKATEBOARD
+} nonmotor_trasport_t;
+
+BEGIN
+{
+	exit(0);
+}
-- 
2.43.5

