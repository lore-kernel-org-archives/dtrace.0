Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56742332EBB
	for <dtrace@lists.linux.dev>; Wed,  4 Mar 2026 08:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611291; cv=none; b=StVg5SUUA88uLyybMW24+3vsgtJ/HNVC66kbjqSXTtBaWR/NeUvyw3Io85QjYoXKa/RR5+5mkyrhhtL/ZdcXa66LLkyhB8l6+8dygdRNM3KvFSkhTRXmmzM/Kd8THYXVU/R3u7gh3rOAm0a7qY+2wthEkZl9nHJyup1MgjAbLL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611291; c=relaxed/simple;
	bh=nntdKyczcSIYZFeVro+EifdWwHgT/zjI7shQvtEg2C4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tSNzJm8DgyzrNhvyTbXPJWGOjv79OhigszDvurZ3eSVALNqwwR15c9eeNhURRuLthGISUtZwgK23q26/RsUPa/y7auf0ySsL345gLKMrYV++5bbz1ofQBfRARRQvex8Xolk/gDr5GpZla3Mk7CCHzeXl1yYVFaYclvIYBoahiqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=i7rR9uVy; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="i7rR9uVy"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6247hG0e2303895
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=glLjL
	s4muPHLY5JiwXA85YbQfStt0/OYVpD+JDlcVeE=; b=i7rR9uVyPMayFVht1siwK
	3XsOwDMtB78W8UyqaY4pb6c6qnct9f6eVFZrR1qTlTuVlRl8pby6R3eVKWOhKjd/
	YG7l9t4M/h3PqaO1xlbygyHo8UUSrO5BZ1aBK3cT6G/KxMY6QCvh3JhsQJR3rIay
	ba/EKm68K5bT5iASPrY7vZP/jl2Arxmk/hrpkU6Ai5IvgcSi4SsvH8oblbXPdHxn
	Wps2dtsqrXAY1ClQCr2bEpt1L60rE9TbHT8xF183ZmMq9z0Iw/qRIPzY+40RKyGW
	X/3Tt/q16xBM6bcL2Khb7w9HB+Q+5IEEZaGM6LUwYjwCkIKLF3RzJ+LSufyIExVG
	g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cpgkjr0sm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 08:01:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6246hlSj001521
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:01:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ckptfs2v6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 08:01:28 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62481RYa023337
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:01:28 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-62-133.vpn.oracle.com [10.154.62.133])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4ckptfs2t1-2;
	Wed, 04 Mar 2026 08:01:27 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v5 1/9] dt_lex: support '/' in probe descriptors
Date: Wed,  4 Mar 2026 08:01:17 +0000
Message-ID: <20260304080125.649031-2-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260304080125.649031-1-alan.maguire@oracle.com>
References: <20260304080125.649031-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603040063
X-Authority-Analysis: v=2.4 cv=GvtPO01C c=1 sm=1 tr=0 ts=69a7e6d9 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=3I1J8UUJPc9JN9BFgKH3:22 a=yPCof4ZbAAAA:8 a=9ZV2k7MTi4OcniJEdH0A:9 cc=ntf
 awl=host:13812
X-Proofpoint-ORIG-GUID: dSEXcN4hvfv5kzHm-Ja13yGOR05mBG5U
X-Proofpoint-GUID: dSEXcN4hvfv5kzHm-Ja13yGOR05mBG5U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2MyBTYWx0ZWRfX/5Jdik0DSkPE
 VEXv5PsnFTeHDqzZ/chWpphBYVHj1i1+SekLkF4V3ZFhBW4eGncHHln2JLTD0Aojv4dG7slV599
 rzM9s9+ZWUzZOyk79zpLUqAQ5d0Lt1Ay7IkqJLolFo5VjELjeyTeTFnMiM9CNyJpTKogwBEyf6k
 Q/QWwkksQ29c2LFyct/4Mli4ICDhAO0b3Pw69F6L2Qi/BTWIMcSvScX29acJHXxT3BmasM+rJGN
 +17m1r6H9AfS1GPj3/d/1fvRHvrynIDem+xXadBy4OJ3a1ylc6TW9XTTCShYzqjzqOcjH15+QFl
 hXqNJ25w6MPXY7Fgif/+NXSqArSM71bThcz7N6zGQSpw2tRsXp+7d4XrQEVMgNRDKWANVI50sB+
 OaI0n98o8JAI0U2z+DNO/Y38ykQecy1Y4PwS2A6/FlFl4AfiLgGPP7iIMMIlEqcrFsUotyaSydf
 YcSEhL3kTex008RXcjqgqca7GdG2PHpGYz1awKCc=

This will allow us to support paths in module descriptions.
Add '/' to regexp, but then constrain usage to probe module.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_lex.l  | 2 +-
 libdtrace/dt_subr.c | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

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
diff --git a/libdtrace/dt_subr.c b/libdtrace/dt_subr.c
index 6d06c2b5..73db5939 100644
--- a/libdtrace/dt_subr.c
+++ b/libdtrace/dt_subr.c
@@ -119,6 +119,12 @@ dtrace_xstr2desc(dtrace_hdl_t *dtp, dtrace_probespec_t spec, const char *s,
 		memcpy(name + len, v, vlen);
 		memcpy(name + len + vlen, w, wlen);
 
+		/* Only allow '/' in probemod */
+		if (strchr(name, '/') != NULL && spec != DTRACE_PROBESPEC_MOD) {
+			free(name);
+			return dt_set_errno(dtp, EDT_BADPROBE);
+		}
+
 		switch (spec) {
 		case DTRACE_PROBESPEC_PROVIDER:
 			pdp->prv = name;
-- 
2.43.5

