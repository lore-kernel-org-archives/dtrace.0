Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F210D2C2ABF
	for <dtrace@lists.linux.dev>; Wed,  9 Jul 2025 14:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752070197; cv=none; b=e1Nb2kzwPraktjZnoXYbqXaPYhHb+8fLu8Lhs/bO1QW0kw4lZhoHRMjUtSGdfhr84eA6xnu+tybXks2pD+Dur4g458BjalWHACb4VUk1gTCtD/RKVRWNb5nKMgTbuVR66AP7RRxH4yidduHWVYpE7vGgleLeihA4CWp/82eqh/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752070197; c=relaxed/simple;
	bh=AICUCXgFLE1yHsJgdRLKJy/7N0+OZn033ErsiqFHjmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZviFkWJN10jVRNUqVb/BMQm5v9qw9o+PfoutGtXe/AZnj6E3arL5aOLiafHLl6e4FypAwYoOjVkOOS7vcgq+3kCt9NfZ23+kX/4PKZZt0ezfJjiS03ezc7HiATOrukW5RpkHCS3Ch3XBKZW1wi/6MagQgSQyiBPprkvg6lPssT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ym2xa7Sp; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ym2xa7Sp"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569DZBkl005796
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=Eekda
	8eJiQdUpq9ByuxnQNL9kqtPQMK/aiAItGHPLAU=; b=Ym2xa7Sp6ueLLOWPAZ1h1
	5jutRdGJBG7YSOOcbOzgdj7xGtObHoRoBfN2Pz/0GBrv3MudloipofTfy0YB+bsl
	A4OCd4pAfv3MGTSxhYA6YS5dRttxpKo98T4vW9zXFsIQYEiJNuglf4DlMEZtTlQu
	PsllwjY/CqxPbgERKor7GtD8ijmo4WTrGVUiZWDkSf1QSQyJgt557htTXfQGId6P
	nZVe2SPy5/QugEKSwNmI+A1SXVgQTouaKHPCyReIdrzTAs0Qm5w3PgVGTwQOgYvZ
	ctmjAVc4leTOm02n8Y36gQ4+KMwwJfc4M8iEwKXE9IqxuhhIhNnCjWub8JxdMwCC
	A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ss85g579-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 14:09:54 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 569E8jPH021616
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:09:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ptgb0ppg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 14:09:53 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 569E9o1Z028485
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:09:53 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-63-52.vpn.oracle.com [10.154.63.52])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47ptgb0pk2-3;
	Wed, 09 Jul 2025 14:09:52 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v3 2/7] cg: bump number of TSLOTS to 6
Date: Wed,  9 Jul 2025 15:09:43 +0100
Message-ID: <20250709140948.15090-3-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250709140948.15090-1-alan.maguire@oracle.com>
References: <20250709140948.15090-1-alan.maguire@oracle.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507090128
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDEyNyBTYWx0ZWRfXzegMUOUzvkLJ 1dibY1e04SwrHiy4JGJfixUiuh7uYGfEMhJz05oLJEU0emqArDziwMyuH//8km2L0vBqLuhllU/ k7wwxvMkcwgn6x2fyQTzXJ4jnQ8yb/PSygaNn9atHPlQozRLbE4wAUESw7KGUWcF5E6OeJPnIIX
 dCXlwtKxGDgC2CsdY5QL5kuUOQvt6MywWFnU4BfZfcKRv9MhwMklPl7A9aozQ0vyVgniOwTojmu +uph27RB2Tsu0U+mpLJ3jXTPHa3IR1f7mcvUhHEPSOABFlGOgIIccEfiOcIkCEdc0bGW6EwJiva NaIS3H4XqOqXAfzOSoJMUNHWmfyBJNBe6NlkReHUUaRm9wspb3vjGjfIgxaH9LMewxmGFkixsdf
 4ISFZU0hScBp1FwHZHuc1XRABh+kQh66dJefBuoxABUL4jR+E9VnZHXyrQ35DrFPyfEcbPbS
X-Authority-Analysis: v=2.4 cv=a+Qw9VSF c=1 sm=1 tr=0 ts=686e7832 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=dkZhMPbv5MG23FMVbAcA:9
X-Proofpoint-ORIG-GUID: zNE5Y-f_79RNv247hQ9e7xFm7VATf1pR
X-Proofpoint-GUID: zNE5Y-f_79RNv247hQ9e7xFm7VATf1pR

Because of the ternary operations using inet_ntoa*() in the
TCP translators more temporary string slots are needed.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_impl.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 2adc1252..b8c0f94c 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -203,14 +203,17 @@ typedef struct dt_kern_path {
 #define DT_DM_KERN_UNLOADED	0x8	/* module not loaded into the kernel */
 
 /*
- * Why do we need (only) 4 slots?  The maximum amount of string arguments to
+ * Why do we need 8 slots?  The maximum amount of string arguments to
  * any function is 2, and if the result is a string as well, that means we may
  * need 3 temporary strings during code generation for that function.
+ * However if operations like inet_ntoa6 are used in ternary operations we need 
+ * 2x the number of slots for left and right.
  *
  * Since string functions can be nested, we can (at most) end up with 1 tstring
  * (from a nested function for which we already generated code) along with a
  * nested function being processed which needs 3 temporary strings as mentioned
- * above.  That brings us to a total of 4.
+ * above.  That brings us to a total of 4, but since the ternary case requires
+ * 2x we need 8 in total.
  *
  * Each tstring needs to be large enough to hold the largest possible string
  * and accomodate the largest known need for tstring space in subroutines.
@@ -222,7 +225,7 @@ typedef struct dt_kern_path {
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

