Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1A447DF93
	for <dtrace@lists.linux.dev>; Fri, 15 May 2026 13:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778852662; cv=none; b=KmVOH28BibO2Tt46iIGEU7CCZcj4YUwyspJZV4/bAUk1JQev/T2LJQ4cvHmbTjP7PckOxv6WA3vkQJj5LiqBTvoHrybwDhcKfo7xdMbteUQD0DsZ5a4S2RcAayHWBKOT6VEMARcGeGdAFApMdtbKYSs8DAUj4+FbYVGRjBVD5mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778852662; c=relaxed/simple;
	bh=qW4gYJi7YD4pNwukQjYPDcf9GgiuJfJ8wizNJ6jRz9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MFT7Z+h6NGd9PS4pxVPolWxi3jU53NjQY5qZJ6KAnri0O/0n0mobYTS8CRm17y75ccpj7dykDo6m1x2XXahKt6oOstT7oYVavAst3PE7QQijiRsHDxZvHEHSpR1FxezXY8t1anHDDvpHecOQvTUU46YCsXXD6dHvUrz77CZEZiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DnI1iB25; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DnI1iB25"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FCTE342715157
	for <dtrace@lists.linux.dev>; Fri, 15 May 2026 13:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=Gq1vn
	kzQyZ2k5auEEeTKVH4JPy0BaH3hdBkDuNfH17Y=; b=DnI1iB25t7WBL21JXZ4P1
	dY/gzjWf6o5MOELV/lyXGbh76ihEZcqbMqIc77sGB5W59j163UxJ9XoegECIThi0
	7UXFIcJHbKHuimVUOPMobLdqxcxAg+84jxCY2GF/+Z6U+o71ak/iN8BjTpFJnDiW
	BtAqNsQfO6k/bOAuubdMGrQFCBbjF8nh/41fkmUY+0RW1tCoGZ2AsI3EzgSwDMyT
	3SeEY4LhlZx7ct1XWnU80jL7kPOaa6k+omoAKjo6GX5fU3RwLZ5ICAeEMEHOvCYU
	JdY5Fy7bgKqPnM9yi7LSFurrpw8Q+pc9Cflg1QT5il40gH2vcUmI4Vr2B8OcAjAk
	Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4e5m1rsc66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 May 2026 13:44:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 64FDdiYa030872
	for <dtrace@lists.linux.dev>; Fri, 15 May 2026 13:44:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4e5kw11jfv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 May 2026 13:44:20 +0000 (GMT)
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64FDiGX4004626
	for <dtrace@lists.linux.dev>; Fri, 15 May 2026 13:44:19 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-60-220.vpn.oracle.com [10.154.60.220])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4e5kw11jd6-3;
	Fri, 15 May 2026 13:44:19 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH 2/3] runtest.sh: Export PYTHONPATH when running tests in-tree
Date: Fri, 15 May 2026 14:44:14 +0100
Message-ID: <20260515134415.355507-3-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260515134415.355507-1-alan.maguire@oracle.com>
References: <20260515134415.355507-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2605130000 definitions=main-2605150139
X-Proofpoint-ORIG-GUID: -sI6Ge2P3dl_ZQ2C6WZ0j3DcC5Jf9f-n
X-Authority-Analysis: v=2.4 cv=OvJ/DS/t c=1 sm=1 tr=0 ts=6a072334 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=7Gl3-_t3PgB9XO-mQDs3:22 a=yPCof4ZbAAAA:8 a=XaNk8tykWZnhEcX8sLUA:9
X-Proofpoint-GUID: -sI6Ge2P3dl_ZQ2C6WZ0j3DcC5Jf9f-n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEzOSBTYWx0ZWRfX3NE2WyrolEII
 SdYrrZ3sCsukfxqFFiwBzi9IeOki2aDXFtKBIeyCzbL+NMEkJ2OOROjDqChGes5xm+OZVU9LLq8
 GOm/dLteFgUhQ8hnuq1mIigmSoCdiWF4ybHG2IG1AKgYVtotTQMaVXN+TxsGQgPWcxDyMG+nK4b
 oJQ3r34ftycNJhNq/fipFilsHtXIimgrRxhWzjc/YtQ3YTbXDuqAkuBmFxm6EPwRSJd8x6rEuQ1
 W/oPZA2cJ1nvdn7emlVNpsn/6PV8UwNjJV1ZjeFk8N3ChNX4juhr0a1UPM51H/IN91ksa5Ccl+Z
 lcuBQ26WZZMmyxCfRlR1gkqMbMEZpI7yDMH9nZRMzGhYQr7QCuuXWohsEwWZnbqFjCX+cvljZxi
 X+ygj+ME5/9fsfcAsonea7H0KQmFFdoLwzJeOttlf0zASJGJyhvqUW61KCSq3wmtbtKxdTNRaN3
 rnsCqicRgHsbpllYmYA==

This will allow us to test python bindings when built, but not
installed.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 runtest.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/runtest.sh b/runtest.sh
index 9f06a499..c0ccffc6 100755
--- a/runtest.sh
+++ b/runtest.sh
@@ -552,6 +552,7 @@ export LANGUAGE=C
 
 if [[ -z $USE_INSTALLED ]]; then
     dtrace="$(pwd)/build*/dtrace"
+    PYTHONPATH="$(pwd)/build/bindings/python${PYTHONPATH:+:$PYTHONPATH}"
     test_libdir="$(pwd)/build/dlibs"
     test_ldflags="-L$(pwd)/build"
     test_cppflags="-I$(pwd)/include -I$(pwd)/uts/common -I$(pwd)/build -I$(pwd)/libdtrace -DARCH_$arch"
@@ -562,6 +563,7 @@ if [[ -z $USE_INSTALLED ]]; then
     dtprobed_flags="-n $helper_device -s${tmpdir}/run/dtrace -F"
     export DTRACE_DOF_INIT_DEVNAME="/dev/$helper_device"
     export DTRACE_OPT_DOFSTASHPATH="${tmpdir}/run/dtrace"
+    export PYTHONPATH
 
     if [[ -z $(eval echo $dtrace) ]]; then
     	echo "No dtraces available." >&2
-- 
2.43.5

