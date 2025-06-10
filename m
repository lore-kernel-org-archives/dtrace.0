Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20B229614C
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 13:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563900; cv=none; b=J9gkkUTBep22UD0/51qRlRa4oBmNYrSYw+/jm9OYNjwX5upE4aRWGKkgrWfShXP0uhXLzO6pdi6Yew803oWYmn2HTB6MfcrUe9/GzZtCWIEvbuBklrHe9VngNwcbPP26VtZpO6pL71amcxhh7LDZ4tJE/ThY+/s7ce/CxGF3HaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563900; c=relaxed/simple;
	bh=X3s2b1uqgr2+sgjmarj2OZ8T+2uOesW3nz7hFtyOmNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q1BE9DbXZyJsWQ8SJ1gk17F+QZcxJmwlYk4K7EVqYdSeNR5c08lU44DkuhdB/zIlkMEu6lVpu1qBGAHb7n3syVcq3Rzp8wOcd8Dl+wYCjVknRzR/P0f9nY/1PqdK/TBDPJSqZXqn6O+zqNOnPy96hHm2v3NCw/gJ+Xy5ofIS5iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=H99SDhir; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="H99SDhir"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ADBhQJ030311
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 13:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=1GsXF
	mqjg9CBjsditNVGhnc443I+desljNDrM+ay3WQ=; b=H99SDhirUtBgPXcvZJppG
	DIxW1FsoWyFk4g412cnq8A7QcoE0MhQZT97N9heX4v0e+Nd28mKk8yibrCvVx5R6
	hjXF84AkaItFJF8PVKlfoyUIrj4GV06i97V+saqE8CbIZAXjL/9b22umochgqxDz
	h1TwN82Mask8Mf/ifflkz/qE7Ta2qnSj3N/869ddZLEa4ms55qRPF8hvU/5JkMzu
	3DRmQ+VYMEUIYbUse4t5wOqSBTY+K2+6uSW56CD4sD6r7DLTe9TCsQB3vAqeKilL
	L7Wb24IJdtZtqEym3tXi/2Oi0PiBOp3WN3Lsdm32i3ifp64H8kKl4AqtvBFp3sGK
	g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4752xjup7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 13:58:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55AD3VYo003297
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 13:58:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv8s9h9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 13:58:17 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55ADwElh009385
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 13:58:16 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-54-217.vpn.oracle.com [10.154.54.217])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 474bv8s9f6-3;
	Tue, 10 Jun 2025 13:58:16 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2 2/4] dt_impl: bump number of TSLOTS to 8
Date: Tue, 10 Jun 2025 14:58:11 +0100
Message-ID: <20250610135813.15746-3-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250610135813.15746-1-alan.maguire@oracle.com>
References: <20250610135813.15746-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506100110
X-Authority-Analysis: v=2.4 cv=K4AiHzWI c=1 sm=1 tr=0 ts=684839f9 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=sS8Lm2rz3Zxas_9yxm8A:9 cc=ntf awl=host:14714
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDExMCBTYWx0ZWRfX32kuIYnTHHoj fz4Olm4UwzxHmRNWzKOogTUPDvEIVFY/szD1QJvwve+0cwp6cLhLfD+QqIrzh8CkzViBw/2Batc COdgITeGnnzmLNJ+qkA5SPVfoQzx7yiYM+TK411lCnh5cg7iEijCquwpfc114bYg5a3kBE8JHw3
 h45DLGXBeNy1bFBRCdzqy0Q9aO9N2XpFcmK34qDmY0H+ObKR8pIHPWSxsIjpV9A3T2HRSdIwI90 Y1/yt7Xw+BkQq2X1fXCYz+rQzyLNiRLfLhunnVNpCgwY5DNpkUmHP28r0RDYZVLw1G/bVPDzQGs z+m/X2w/8LB4KH94sPsnT6fXkxRK4XWEtHLij99O6aPd31IcKr3f/F73lcaPZ/iaqOF1NnoeWKO
 Ax6rS1keQI6FBlbkF9dLSoNr0bbUlNzArE0xN7sHS17/Ypm3hpWRiRZoK4I13V5sqjXTA0zp
X-Proofpoint-ORIG-GUID: BXngmAL9MuWc-ynuTFG8w2QXXSMc-QDp
X-Proofpoint-GUID: BXngmAL9MuWc-ynuTFG8w2QXXSMc-QDp

Because of the complexity of the TCP translators, more tslots are
needed.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_impl.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 68fb8ec5..10424f9c 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -218,7 +218,7 @@ typedef struct dt_kern_path {
  * - cleanpath() holds a prepended '/' char, a string, an appended '/' char,
  *   and a terminating NUL char, or STRSZ + 3 chars altogether
  */
-#define DT_TSTRING_SLOTS	4
+#define DT_TSTRING_SLOTS	8
 #define DT_TSTRING_SIZE(dtp)	\
 		MAX(P2ROUNDUP((dtp)->dt_options[DTRACEOPT_STRSIZE] + 3, 8), \
 		    72)
-- 
2.39.3

