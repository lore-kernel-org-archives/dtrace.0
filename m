Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BD92DAFBE
	for <dtrace@lists.linux.dev>; Wed,  9 Jul 2025 14:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752072429; cv=none; b=Q2EvPPkrJxZIgAAoZWrmVRe8b9QpBagqp2mQx6JGnyeDVrE3rkszgBiuZ+o+WY4dJZkZrdGD4bWk4ADX0BOz9VzJ/Y8NuIARtjxDVOpxxDVbQ6rmgRfvnp7pwf+LjDc7N9eOgyUHAqgXIw7tb5QM4s11C4T9t7DhB/RVBUHiU6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752072429; c=relaxed/simple;
	bh=qO+YX3eCBfu89KU2qX1JbDKU4KyJiPH72WhIMn7EJj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i0e9vQdp7RgJfYPrTmIhfYzJrrEY4GAb2d1x9dsNZtpHzSdQe7VV02PMyefF6XgLdCNdGaG7ftu5NUIblZ5MvSe+TyE45OCPLcIiJo6UOEsL2AjLH1WZ3zsu06++KhynjujaANzfmZ0Eji05IhK3T2M1P7KauETThHiYTRE8RmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Z24t/I7q; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Z24t/I7q"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569ELxwU030945
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=pdtFs
	wOCIWwhfcPRB8dcE6n74HMdYGZtU4qCrWXtPe8=; b=Z24t/I7qX1CutOFN6HaO2
	uUXe363yx4ahhcVNEfVUZC3HvmtZf0UWiioGf1/1tpV09RGgny8qB86VyXuSt4wN
	w4o/vt7e5bxmHf8IrhdUdgdL0X8TScwFOYKEQp6J27W9MIRZQiQDZQt3aBKuWBUm
	UaiDTwzVkqAXH6M8uCEBAIORlc1mxBij8TEOjSLWyD2lEVZQ+CUsbwJMsvVkncNZ
	gXOmufVT4wHLS0Ry4AjeYKEepIW7Z6yAsLj3En6sPydmSCNaKevJGw9HKP5dYliV
	8oVdsJqbhPaONkV9P7tjptkDaZScGOsOqtsWYU+/xForPVHRjQw1nVEkX6V5YDj7
	A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47st4801sb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 14:47:06 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 569D4MRu024391
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:47:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ptgbap09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 14:47:05 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 569Ek38T034091
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:47:05 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-63-52.vpn.oracle.com [10.154.63.52])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47ptgbanwh-3;
	Wed, 09 Jul 2025 14:47:05 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v4 2/7] cg: bump number of TSLOTS to 6
Date: Wed,  9 Jul 2025 15:46:55 +0100
Message-ID: <20250709144700.20591-3-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250709144700.20591-1-alan.maguire@oracle.com>
References: <20250709144700.20591-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_03,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507090133
X-Authority-Analysis: v=2.4 cv=S8bZwJsP c=1 sm=1 tr=0 ts=686e80ea b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=dkZhMPbv5MG23FMVbAcA:9
X-Proofpoint-GUID: Oba15cNHXlGY_eK6qohJeRysYayKe-re
X-Proofpoint-ORIG-GUID: Oba15cNHXlGY_eK6qohJeRysYayKe-re
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDEzMyBTYWx0ZWRfX2+Gk2eJ39B4Y 8WPuYtvj+QuvUIbn6mF9tTFAyc4gx3haEelNzNsmNDfJSx60xtrddFrnUtZMVvjBvdAeB5fZjH8 XXWiowWa7dULzcwQ7MziLNKbYwDmTa8VSTeBUM7pWfyCSRJqh0iVYaxX/UpIvcJabVjnUlQEuY6
 4FzbdPVPAbo1Cpg1FVlAftaVC9RVZmpgXspUAoZnC207CAgYQnaslsilL+qjtpT4ma6t0Dnnloq XoWLJoLtMuqVjPSWjwapVsigRghpliDvS81uQjXDYgiusyFcns8cbMRXNgN5iopMqehhvoU+T1s vCn3S38Hbb0/epzV6eeFFSYtcNQDn5NQ60+2VSv88wxlWkcC4Tn1eld6yVIrSfhw+4sV3hRKR6g
 /h9+GqmIfnkvXVLOTGCBLwcDiKYfKvVCHzpAOYYOLbn6qPEYGRIFA//oSpbuWkP/neYWO66Z

Because of the ternary operations using inet_ntoa*() in the
TCP translators more temporary string slots are needed.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_impl.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 2adc1252..a47b6d40 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -203,14 +203,16 @@ typedef struct dt_kern_path {
 #define DT_DM_KERN_UNLOADED	0x8	/* module not loaded into the kernel */
 
 /*
- * Why do we need (only) 4 slots?  The maximum amount of string arguments to
+ * Why do we need 6 slots?  The maximum amount of string arguments to
  * any function is 2, and if the result is a string as well, that means we may
  * need 3 temporary strings during code generation for that function.
+ * However if operations like inet_ntoa6 are used in ternary operations we need 
+ * 2x the number of slots for left and right.
  *
  * Since string functions can be nested, we can (at most) end up with 1 tstring
  * (from a nested function for which we already generated code) along with a
  * nested function being processed which needs 3 temporary strings as mentioned
- * above.  That brings us to a total of 4.
+ * above.
  *
  * Each tstring needs to be large enough to hold the largest possible string
  * and accomodate the largest known need for tstring space in subroutines.
@@ -222,7 +224,7 @@ typedef struct dt_kern_path {
  * - cleanpath() holds a prepended '/' char, a string, an appended '/' char,
  *   and a terminating NUL char, or STRSZ + 3 chars altogether
  */
-#define DT_TSTRING_SLOTS	4
+#define DT_TSTRING_SLOTS	6
 #define DT_TSTRING_SIZE(dtp)	\
 		MAX(P2ROUNDUP((dtp)->dt_options[DTRACEOPT_STRSIZE] + 3, 8), \
 		    72)
-- 
2.39.3

