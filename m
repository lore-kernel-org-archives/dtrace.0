Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DD534D938
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323101; cv=none; b=tQv7mAZewIeecFWpsszXmGDHub6D91aS7xcbBS4UqhLp3yvzqj42MATyN///H4xMUJcK08XTIvX6e/j4AlgrM7K4HxvYbZ6PjU283W8WI1P4Be4q3IkG2c+9LUxuzsFKWUbZqiWMPxCqP1ZZg2duxrwY1lOPog4Iv2/9enJjXFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323101; c=relaxed/simple;
	bh=x/LezFJL2Gzb5Q9AJV1xvgTDmJXcK2hOJ08SgXm7PuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tex5GgsXGLdqRyIiXU46RjJ3WNu6zYLXpppt1Ov4e864HD1JG/PUxPOQMMkQZjnoQsdZKQLGBiUsOCrbuK8HYSaO31teDons+UKoo9DASdo+iwIhgoktUzq//JqhaD7Y4Gg31PMUSFB8RvWqEwQrj3g8+nvWH14q8dnUtTGwSrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IPEvv4g2; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IPEvv4g2"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DG5s2a3330407
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=y94Px
	2sjlstn69iOV9GlMkFd8fsDGlian/kv8wuqiy4=; b=IPEvv4g2tyJF+u0lL2Z1G
	ZOglT9OBBjUu8/nS9HIU3xytcANupvombNADCZ2Z5vWxvrfzVuDgYRaRO0J3fL37
	mIUVq25O6Ogrzj+IfMG+K/qcgzEGSwmkVK7vjKLuKffpSB1mKtvcutR1SfbpYVoc
	AG+KKe6ETlKqiZ+6nU9LHrK/Al3paLywnm/SLimbIgZkXq1lNW6JtLnf+UgJAUSW
	4K6zc85hS0GcHIx2aU8wostJwtKeu+/z+NYezIFcdUHdt4Bjg4qoYBcMTIHQOcfM
	TBVLMHZEp4vXjb4SEcPFofV3RrgXXAZkqU4M0RkVsk0Ka3BZ5A1HZFq4coEtNDMw
	Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkrp8ktsu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60DGF300004598
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd78xjru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:36 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60DGpYB1031305
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:35 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-50-89.vpn.oracle.com [10.154.50.89])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4bkd78xjpd-2;
	Tue, 13 Jan 2026 16:51:35 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v3 1/9] dt_lex: support '/' in probe descriptors
Date: Tue, 13 Jan 2026 16:51:24 +0000
Message-ID: <20260113165132.2454591-2-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260113165132.2454591-1-alan.maguire@oracle.com>
References: <20260113165132.2454591-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601130140
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX7O2EdrRXVvl0
 fKvD2ztRmO5h8zGUcizfrjjQaHFlfRkQDg1LZObtCR8EYrv8Suc7AFwcqrt6aXZJKaHobG+E73R
 ud2qKSQk6dt74Ld1/VvnREdNPUSyldABP/i2ExZ2QLxegwup2oVsVjymf44g0pIufEw/WZUA7kV
 T5Nbj9fHU3rOlz6UNou7Do+zN3YqyBoVWkXItTLFGvXjJKzESexlgd7j1z4T//NF/sMN6NJDn+u
 jQCp093jkKHqrCUNIJUlhIlWQOsys+sWuphpxHFwonjQMZWG9CSnhyfoP/MuPboIPpDcQs4dh5K
 XpK5yri+wFPBFsd6wtsWaJnClC5roHlDOTngdwOCIuij6U8OHc9/Fz2+KzNQx+DGxyl4VgV8IUy
 33hozdgLUVgnszdcmrZ50AcFJfBB/6leFG/qGCWbncUseoOtowep90MoHuuSgafDk2+TO55KCSd
 HP5McXrxGR3pHDXEAnA==
X-Authority-Analysis: v=2.4 cv=YcGwJgRf c=1 sm=1 tr=0 ts=6966781a cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=bDO3_MxgGZTu5gFHrc4A:9
X-Proofpoint-GUID: UV7i-EwqvVdANmEN0vmDPbAS9mGQgBUN
X-Proofpoint-ORIG-GUID: UV7i-EwqvVdANmEN0vmDPbAS9mGQgBUN

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

