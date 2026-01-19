Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EF937BE9E
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768832609; cv=none; b=I7SQPSuxSRY1kW6gdhQeUy3Smq9bgOKEf4fDkNZmO2nkKRQ6VpQFHXSeGQeNpWQe93cASNxExRW6F5VXHcBlHGweP9YwiLyOxT5+k47/dCh5IZXBoaFXRQzwZH5sHF1VIgG5yvxB9cDPK3/TO92f44UoM3uN+pd7xwzZP2bQHAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768832609; c=relaxed/simple;
	bh=x/LezFJL2Gzb5Q9AJV1xvgTDmJXcK2hOJ08SgXm7PuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NUOTlFzudx02dL/jjVTvTR5iSHcyNzrz32QHSkRd4LOz13vMz/mCoWO9tFGfPOIBXEHmmeoCjuOvIB6Q7C6L1nDMU8YFITPcWxwZM/mF3w+XpwNJYOcRAEDbQUX6izLv0TiMb0ScEXQDGDg+0q+rMzbVv5DC+rNdPlx8rc2hpSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HbMIYd9X; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HbMIYd9X"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JBDPa31420907
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=y94Px
	2sjlstn69iOV9GlMkFd8fsDGlian/kv8wuqiy4=; b=HbMIYd9Xx3HS+zyZhcCZg
	1MAFI2e8Y0ccjD4oV3go/Z3CoBNbHE2beW9YzZiwWlazXZ2BUh3qYIM9YRPLlmD5
	nCHnNbUnWzur69nuy4cbiWI/hlaqiQimIanYyhz4C+EM6DG2V/W+lyHLdldX6VlS
	MhLDX8cvjeNnZa3SZLD9CrdIZCD5un5czRkilT3UpdgeKWhC3wFViF+34UVTYPIW
	NJn11Kp6T/rX0GJcA7qvWweIk82yP7za+1Trai2jAJ5nIXmd6wmU9HGTb9OrwYIH
	WHppV2AeJkW8rnXJLwDQQi/YM4VTBmSUjoxqgVf8OZbi0xHqbCVobivmv+4djSBn
	A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4br0u9jcjn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:26 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60JCqaYv022439
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4br0vc6ys0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:26 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60JEIDjX015145
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:25 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-51-213.vpn.oracle.com [10.154.51.213])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4br0vc6ye3-2;
	Mon, 19 Jan 2026 14:23:25 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v4 1/9] dt_lex: support '/' in probe descriptors
Date: Mon, 19 Jan 2026 14:22:52 +0000
Message-ID: <20260119142300.975014-2-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260119142300.975014-1-alan.maguire@oracle.com>
References: <20260119142300.975014-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601190120
X-Authority-Analysis: v=2.4 cv=OJUqHCaB c=1 sm=1 tr=0 ts=696e3e5e b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=bDO3_MxgGZTu5gFHrc4A:9 cc=ntf awl=host:12109
X-Proofpoint-GUID: pRkgYfjwEzkqXUMhjHdEVRALmBcbbxC9
X-Proofpoint-ORIG-GUID: pRkgYfjwEzkqXUMhjHdEVRALmBcbbxC9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEyMCBTYWx0ZWRfXx00CgnfMin4N
 JE1i7REr4dLCfRicabfG4g+8Te09gxPbjGL4Xd7xNaGKW5dwv9PlZxI/CFzxImO4j/PA04mk1L7
 YbMiStEexX6pUXWHT7CRT9atW5S2VVZEak5uE4dvjNbL+so6HlkwYUl0Z1cu2ABt5X8il5rsQ6j
 gjoIQKBaHke0R2pSWN6E3eEpvx69Rxorep5w2TN7X1oMMAC3MepAZ7ZkHVpGTOKkAsGCfSRUieK
 0/rioypzuGbEm9uY1ngSPz2xmTu/1wjT03fccYJkUNQXI1DQt5WXkotDsTY3o0gNZPBzeK9Akll
 g6yY9lQf42HzwAPKkhGbyvpOwk1vpQGjd+spU233K+TKzVfkXNGYYz68+iJ3QkDrpq7hu2sAudW
 upgwa1xp+4DCmPn/48OopFLIYelajoN3EB55FBZMmHe2d03Iugd1K3psDhFIk1UTCmwOBnFhmXc
 VnhVHBCcZJTUB+5Zuz/2B4US/RIsKsN/4NAu3i6E=

This will allow us to support paths in module descriptions.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_lex.l | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_lex.l b/libdtrace/dt_lex.l
index fd70aa0a..a8268c44 100644
--- a/libdtrace/dt_lex.l
+++ b/libdtrace/dt_lex.l
@@ -48,7 +48,7 @@ static size_t dt_input(char *buf, size_t max_size);
 %s S0 S1 S2 S3 S4 S5 SIDENT
 
 RGX_AGG		"@"[a-zA-Z_][0-9a-zA-Z_]*
-RGX_PSPEC	[-$:a-zA-Z_.?*\\\[\]!][-$:0-9a-zA-Z_.`?*\\\[\]!]*
+RGX_PSPEC	[-$:a-zA-Z_.?*\\\[\]!][-$:0-9a-zA-Z_.`/?*\\\[\]!]*
 RGX_IDENT	([a-zA-Z_`][0-9a-zA-Z_`]*)|([0-9][0-9a-zA-Z_]*`[0-9a-zA-Z_`]*)
 RGX_INT		([0-9]+|0[xX][0-9A-Fa-f]+)[uU]?[lL]?[lL]?
 RGX_FP		([0-9]+("."?)[0-9]*|"."[0-9]+)((e|E)("+"|-)?[0-9]+)?[fFlL]?
-- 
2.43.5

