Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD8820A5DD
	for <dtrace@lists.linux.dev>; Wed,  3 Sep 2025 14:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756911070; cv=none; b=HhpHk2l8vL/YHuAAbTZK2cN16pC4FPx5JCqknu+W3PvBer3AviDxJLi0DZEpusbtcGF2QGCPvSJ9gcWK3GRXJCuR4SoMliSkoBpsvZkXEHm5KiMQJJHw3SNFt6lT5FCRtUx5ERZQYTSGYVRC56XiSz7XpYZrMtaFZ4la1Yz9bsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756911070; c=relaxed/simple;
	bh=IZJB8Zu5mhwGnCRmWMuNYPIrdSqQQq1ha3k3fXdLY+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lF85xquCxeRm+xE7cw76LcYf+BcerJSkLg0tdusar3mNVdb81NLvZWwxhw4Wa1pKr0kMTVbir4cH2mJ7CsI2Cl1p3L5mjbQtSlMsSF9tqyO/babJr3PrPVVUXEXe/hjo42YElrbe+1J3X+i+nztaJsh19GzxXubj7Khc7En3T+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gNOmL0A6; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gNOmL0A6"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5839MoHA015585
	for <dtrace@lists.linux.dev>; Wed, 3 Sep 2025 14:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=HJcgaTP+ajwn36xyDYIGXwdTNPNQI
	cb4NXP5j9sk1sw=; b=gNOmL0A67IfsWGh7bH6Xodl+OaXDoLq7NgjSvI/WFQRJ7
	LsjVCrDUi5d7JVLMqbjJIEOpPjOEEXQyX3j1ySLAiqUfpE1DHhYBV5bL9GfSyovd
	7Es+TmaWNRyw2Fw77qnA7MmDhmldbkNOyOQiPdMX9jQ9tTw2F/8yWQda109qvTnr
	l//Lqa62caeU7QGKzH1Ig1x9mK0VsO5gUQEN+DnPdxZftlVoougN4P+wLY74rOLK
	RwbQXO0OXZ3VE3pWoNhV0/RZI9B8nGcHgSS5H5R+iGhRSk1N++5M6HgthI/Qkge1
	Da1IdmRBR36TFU0VGOpnWf1qILOOf9vf40VpHtsmQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48ussypd46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 03 Sep 2025 14:51:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 583DXOdS036393
	for <dtrace@lists.linux.dev>; Wed, 3 Sep 2025 14:51:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48uqrae3qc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 03 Sep 2025 14:51:06 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 583Ep6mn024418
	for <dtrace@lists.linux.dev>; Wed, 3 Sep 2025 14:51:06 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-59-232.vpn.oracle.com [10.154.59.232])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 48uqrae3p1-1;
	Wed, 03 Sep 2025 14:51:06 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH] enum: support declarations with a trailing comma
Date: Wed,  3 Sep 2025 15:51:04 +0100
Message-ID: <20250903145104.856314-1-alan.maguire@oracle.com>
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
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509030149
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzNCBTYWx0ZWRfXxsHCZkfIWQ5z
 4OhlTpumSRcjdAdieOnpWF0MAxpVLvKhfbcRGxyHu15r1zt9Q9r4PQtrWERN4EIxLjnbGj72itg
 IFC3vaW4hssd1jT+1R4aDhRKE206WtrDaoGophhgAt3sU9YTRT1i3LpDLcytCqxL1pzsoq1bHlU
 GOay4pbkR3BrcMTndR05RkWx6uPOBYbAX/jpJe5pT+Rij9oqrWULy6iZpnntVS3svdYqG4pBmKI
 LBCyfdRAnhs/OcM43/7Iqi1YDbpkk6Q43d+7A1mVZymeN+OrMdUH1QEI+OvazpMcZGUER3E0tKe
 tY190VXqzhkhXTkqREEIld+knsZW8/9eTxUqc5nWuDn820RA2/4+1gTlySxzJhmd37rp9LGU8KR
 0VZE+mc9
X-Authority-Analysis: v=2.4 cv=X/9SKHTe c=1 sm=1 tr=0 ts=68b855db b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=yJojWOMRYYMA:10 a=yPCof4ZbAAAA:8 a=au_fEubTuk-04qcyEo8A:9
X-Proofpoint-ORIG-GUID: vihLsfiLhPu_V4evK8hJoAX8mM86Xt6T
X-Proofpoint-GUID: vihLsfiLhPu_V4evK8hJoAX8mM86Xt6T

When doing python tracing, it was recently observed that #include'ing
a file with enum declarations with trailing commas fails; this is
due to the D grammar being strict about the last enumerator value
not having a trailing comma.  So

typedef enum foo {
	BAR,
	BAZ
};

is permitted, but

typdef enum foo {
	BAR,
	BAZ,
};

is not.  The latter pattern is used quite frequently in #include
files, especially where conditional compilation of some enum
values is done.

Relax this constraint and add a test to validate that D compilation
succeeds with the trailing comma in an enum declaration.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_grammar.y                     |  3 +-
 test/unittest/enum/tst.EnumTrailingComma.d | 36 ++++++++++++++++++++++
 2 files changed, 38 insertions(+), 1 deletion(-)
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
index 00000000..0414498b
--- /dev/null
+++ b/test/unittest/enum/tst.EnumTrailingComma.d
@@ -0,0 +1,36 @@
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
+ * the last enumeration value.
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
+enum shapes {
+	CIRCLE,
+	SQUARE,
+	TRIANGLE,
+};
+
+BEGIN
+{
+	exit(0);
+}
-- 
2.43.5

