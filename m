Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1A43CBE6B
	for <dtrace@lists.linux.dev>; Fri,  5 Jun 2026 22:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697545; cv=none; b=fpgYed44+lGHlGvmd2aBwgRBdNme2jSc2QVj/Yi42Zh3JQKqKgPcSVIQj+HRxK9GVGzCuyGrqC/a+cLcu8CSIVujoNt85lJep5WZsRxOSEHZFJZQ0Dca/HdcUXk55/xgJ8X1h8qW/SGraXTPsoFCgyb+n7b5YyZWxaQNVx5j3XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697545; c=relaxed/simple;
	bh=baT8y36eFcFd6rTaqmAtqzwun5KW6pJmJqIcdSOkIZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mTGYdM1j//UX6wubZrRHBUjzf6KvEfr0xvCA6RI0UhTX+tUOZz8IvtpW2YpCAJ6CkBwF+HXv1Av0GySnGkCMmRzbn7fqz/mlhaJECKvFnG7rvUzUwU+F/ImUBUahC28aXVVsjoee5JKLRYMnSUQq5y58ssiGL1tOXgCQ6YvC0aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qJPtTeOj; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qJPtTeOj"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 655IXXij2381442;
	Fri, 5 Jun 2026 22:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=0/pyd
	d4dKKmaLderHdTrhP1rbC1mtDsoG+ekw7xLArU=; b=qJPtTeOjwrcMMMJXjzyJB
	/XFuEyez2tKmDHmvOhitR5bQ6XvWFEXKO6e/mViF31PvbMosDE5ovhwwCL/NjCRu
	YhlSyOByRcvXv3GGEwkFqY/kBBobGKrd8uE2PR+9JuUCryj4il3X4sq8LCTLM81X
	DWke+E9jD8aa+O9AsCONd6POPreihcSiySDos5/hp2V0jNyfKYg4MkRrWeETLWiG
	vTK7IPfDrQ3C8mqLANoR28540+lLmUG+teTW4slvF28XiPA69ofWAxoSc5v6yVpy
	gYyT1TO/HopxSfaeUWqAkwzHiq57zlYmIFLfB0Hnir0WSLwWtpUuBESkFg40P+GM
	g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4efptbty4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Jun 2026 22:12:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 655MAP89033010;
	Fri, 5 Jun 2026 22:12:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ek326nvvv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Jun 2026 22:12:21 +0000 (GMT)
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 655MCIun039322;
	Fri, 5 Jun 2026 22:12:21 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-53-60.vpn.oracle.com [10.154.53.60])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4ek326nvu6-3;
	Fri, 05 Jun 2026 22:12:20 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>,
        OpenAI Codex <codex@openai.com>
Subject: [PATCH 2/6] libdtrace: do not taint scalar alloca member loads
Date: Fri,  5 Jun 2026 23:12:13 +0100
Message-ID: <20260605221217.1211791-3-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260605221217.1211791-1-alan.maguire@oracle.com>
References: <20260605221217.1211791-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=987 phishscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2605130000 definitions=main-2606050219
X-Authority-Analysis: v=2.4 cv=I6dVgtgg c=1 sm=1 tr=0 ts=6a2349c7 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8 a=LG5T7v2SAAAA:8
 a=U_gbk2aEUc9IbmRI1f8A:9 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22
 cc=ntf awl=host:12313
X-Proofpoint-GUID: ayiLPo3N-qYI6YOZj2Kav0yWe-ec4BDb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDIxOSBTYWx0ZWRfX+psZZ5I/S8Wc
 k97Fe3kWahWGubpRmV3n5vVQzHUiUTE84dSR52l6BvsrVXE/3rvJUzqlLAn3nqpw2s7Cz4kKjvS
 qjMeZ6VNTJ61u5c5N929945kGvMUbJJPkn2CCBu9O+EHfY1olNy18BcPsMkXymO+e8wgOeZICH7
 GabRbFbdipX25fKd6smhiSpHsF4jPb7JCQMW/p1b31VZM44QEiSRv9K+jF8SqBYLXcfTnFV0vTF
 toHOfesJQ8OeaFS+B968qxTVSlYnbIungNkSyVpJY6U1f1mrixFkjmsy81ZRccdBJmfQCea7cM/
 O5o2z4acs/WjttMoK57HrGTBDYi0RIM22OV6EEuaFWfCManiXmBezVOxUr2nVR2JsCKiNnrmKi4
 g6OK/70WWFB0uzoow6a69MYinVUhbOfPsxpJ3ygXbTGViy6MMwHs8pylxRIbIYAjdHyWHMMgtWt
 hR8zBsr1vOiyfH2+C4cKQqepORVv/JZLIRYiJf/M=
X-Proofpoint-ORIG-GUID: ayiLPo3N-qYI6YOZj2Kav0yWe-ec4BDb

Member access on an alloca-backed struct propagated DT_NF_ALLOCA from the
base expression unconditionally.  This is correct when the result still
denotes  storage inside the alloca buffer, but wrong for scalar member
loads: after the load, the result is an ordinary scalar value.

This caused values such as copyin(...)->myint to be treated later as
scratch offsets, producing bogus pointer-like values and bad reads.

Only propagate alloca taint for member expressions that remain
by reference.  Preserve address-taking of alloca-backed members,
and update store codegen so writes to scalar memebers inside alloca
storage still bounds-check and convert the alloca offset correctly.

Add a regression test for assigning a scalar member loaded from
alloca-backed storage to a normal scalar variable.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
Assisted-by: OpenAI Codex (GPT-5) <codex@openai.com>
---
 libdtrace/dt_cg.c                             |  9 ++---
 libdtrace/dt_parser.c                         | 15 ++++++--
 .../tst.alloca-struct-scalar-load-taint.d     | 35 +++++++++++++++++++
 3 files changed, 52 insertions(+), 7 deletions(-)
 create mode 100644 test/unittest/funcs/alloca/tst.alloca-struct-scalar-load-taint.d

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 0859e9cb..e97e9abc 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -3788,13 +3788,15 @@ dt_cg_store(dt_node_t *src, dt_irlist_t *dlp, dt_regset_t *drp, dt_node_t *dst)
 
 	/*
 	 * If we're storing into a writable lvalue that is a dereference of an
-	 * alloca pointer or if we are storing into a writable alloca lvalue,
-	 * we need to do bounds-checking and turn the offset value into a real
-	 * pointer.
+	 * alloca pointer, a member of an alloca pointer, or if we are storing
+	 * into a writable alloca lvalue, we need to do bounds-checking and
+	 * turn the offset value into a real pointer.
 	 */
 	if (dst->dn_flags & DT_NF_WRITABLE && dst->dn_flags & DT_NF_LVALUE &&
 	    ((dst->dn_op == DT_TOK_DEREF &&
 	      dst->dn_child->dn_flags & DT_NF_ALLOCA) ||
+	     ((dst->dn_op == DT_TOK_DOT || dst->dn_op == DT_TOK_PTR) &&
+	      dst->dn_left->dn_flags & DT_NF_ALLOCA) ||
 	     dst->dn_flags & DT_NF_ALLOCA)) {
 		assert(!(dst->dn_flags & DT_NF_BITFIELD));
 
@@ -7496,7 +7498,6 @@ dt_cg_node(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 			 * pointer, bounds-check the pointer reference.
 			 */
 			if (dnp->dn_left->dn_flags & DT_NF_ALLOCA) {
-				assert(dnp->dn_flags & DT_NF_ALLOCA);
 				dt_cg_alloca_access_check(dlp, drp, dnp->dn_reg,
 							  DT_ISIMM, size);
 				dt_cg_alloca_ptr(dlp, drp, dnp->dn_reg,
diff --git a/libdtrace/dt_parser.c b/libdtrace/dt_parser.c
index e71c0985..3e1351d2 100644
--- a/libdtrace/dt_parser.c
+++ b/libdtrace/dt_parser.c
@@ -3179,7 +3179,6 @@ dt_cook_op1(dt_node_t *dnp, uint_t idflags)
 		if ((cp->dn_flags & DT_NF_USERLAND) &&
 		    (kind == CTF_K_POINTER || (dnp->dn_flags & DT_NF_REF)))
 			dnp->dn_flags |= DT_NF_USERLAND;
-		break;
 
 		/* Dereferenced pointers cannot be alloca pointers any more.  */
 		dnp->dn_flags &= ~(DT_NF_ALLOCA | DT_NF_NONASSIGN);
@@ -3251,6 +3250,11 @@ dt_cook_op1(dt_node_t *dnp, uint_t idflags)
 			 cp->dn_op == DT_TOK_DEREF &&
 			 (cp->dn_child->dn_flags & DT_NF_ALLOCA))
 			dt_cook_taint_alloca(dnp, NULL, cp->dn_child);
+		else if (cp->dn_kind == DT_NODE_OP2 &&
+			 (cp->dn_op == DT_TOK_DOT ||
+			  cp->dn_op == DT_TOK_PTR) &&
+			 (cp->dn_left->dn_flags & DT_NF_ALLOCA))
+			dt_cook_taint_alloca(dnp, NULL, cp->dn_left);
 		break;
 
 	case DT_TOK_SIZEOF:
@@ -4049,8 +4053,13 @@ asgn_common:
 		if (lp->dn_flags & DT_NF_WRITABLE)
 			dnp->dn_flags |= DT_NF_WRITABLE;
 
-		/* Transfer alloca taint. */
-		if (lp->dn_flags & DT_NF_ALLOCA)
+		/*
+		 * Only propagate alloca taint when the member access still
+		 * denotes storage inside the alloca buffer.  Scalar members
+		 * are loaded from the alloca buffer and yield ordinary values.
+		 */
+		if ((lp->dn_flags & DT_NF_ALLOCA) &&
+		    (dnp->dn_flags & DT_NF_REF))
 			dt_cook_taint_alloca(dnp, NULL, lp);
 
 		if (xflags && (kind == CTF_K_POINTER ||
diff --git a/test/unittest/funcs/alloca/tst.alloca-struct-scalar-load-taint.d b/test/unittest/funcs/alloca/tst.alloca-struct-scalar-load-taint.d
new file mode 100644
index 00000000..8aa071be
--- /dev/null
+++ b/test/unittest/funcs/alloca/tst.alloca-struct-scalar-load-taint.d
@@ -0,0 +1,35 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Loading a scalar struct member from alloca()ed storage does not
+ *	      taint the scalar value as an alloca() pointer.
+ *
+ * SECTION: Actions and Subroutines/alloca()
+ */
+
+#pragma D option quiet
+
+struct foo {
+	int	c;
+} *ptr;
+
+BEGIN
+{
+	ptr = alloca(sizeof(struct foo));
+	ptr->c = 12;
+
+	depth = ptr->c;
+	depth = 13;
+
+	exit(depth == 13 ? 0 : 1);
+}
+
+ERROR
+{
+	exit(1);
+}
-- 
2.43.5

