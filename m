Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216FF494819
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328676; cv=none; b=e6zg4uwxU16J50A4yqYbIkHJpM3koNcO2qvJzRv0LnDfKWuzb8oBSVCvh5H4LrFp3myFh0Aa4YHZDiqH6LJKhR9cI9NQb3Fpg7hQ2JLfY7vH+HYdCPZnXJTRI8iOwpgTZwQyxS8Xy8l/xD50kG5MJsi9c3s+Wb7Tx7I5R3GAfww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328676; c=relaxed/simple;
	bh=X8/D6CjEDaazs7ScC/GEIqGMse9gV9gFFvvyKbzSEcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SoOz/Tv53DiZIIs7odqKjVt1pSkCYWDruBjZCDGrZ5PqP0DmEjR0QMVX/KJoaZQJh+nr8wIZlfUzoPw3WJzVevHmuQ8tdVvtJUJPxbx1QcSO4axJyO0+f4lFhQHRjklNSSJoN30s8H6iZ13+VxvVJAW906ktLEaKuDdHvjFiLjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Fx2rwEfE; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Fx2rwEfE"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LCp1Tn2418341
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=6UOJp
	Qp6NyURhGk2nH/F87EfpJYiicFtAizwEPQZDUw=; b=Fx2rwEfE/aHyWvWaBxEGr
	rVBY93669znE7iFK+RATK7btynAAU1sGEach4J6M9t4uWns3UBxk1BYX2T6P+j4o
	0YzqDhmoQFh8FSiR1iao9BueIucthB8/hoL7IhifXTvA97zdXXqgLsXzFpp7/i+v
	4gYdNAUtYQ8vOxOwFs47TWaH7e31Vs+MqwlFo7Jg49+ojehwFU7xcs2nePffLmNK
	e3qRR+Jhg3PkgtgiPkYJTxuCoHsJiIu7EXPGVavt6HhdLTJobKd/L995EoyWal97
	W+8Gxi5ZzM8v3EprxSCkSmy1myMktPzSNhM4ZbMkB3Scbvu3BgMC10PtNEzq+eXl
	g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g4yd9wcjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67LG5Cm4029239
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4g2ejgcn22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:12 +0000 (GMT)
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67LGB2FF014592
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:12 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-51-128.vpn.oracle.com [10.154.51.128])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4g2ejgcmux-8;
	Fri, 21 Aug 2026 16:11:11 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v5 07/11] runtest.sh: Prepare Python bindings for in-tree testing
Date: Fri, 21 Aug 2026 17:10:55 +0100
Message-ID: <20260821161100.41710-8-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260821161100.41710-1-alan.maguire@oracle.com>
References: <20260821161100.41710-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608210126
X-Authority-Analysis: v=2.4 cv=VNvtWdPX c=1 sm=1 tr=0 ts=6a8878a1 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=3I1J8UUJPc9JN9BFgKH3:22 a=yPCof4ZbAAAA:8 a=dO4ejgokKLiuvOV_dNoA:9
 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-ORIG-GUID: joNLmU-NVv0f9PtltSradr8q8OV1keIW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX2YaAD5HSDhj9
 Z2FboHIlbqL/wocBPAxDko7WA54dBfz4CY59C5pZTgHFU425HIZ0bELLn06McC6UYIyUHqw9vtY
 Q29w5ff748oCRRkIYSoDkWoHI9bhhKDxmo8DMFyQbJK68+jaEfMgKrKTTc+7WOx3m9+DPrAXOQy
 eRNCvsqUvt2sPEcHQHvYASqqYwQnRSeD+EX9JUdLgmkMpV64Vqmif6wN2SEC0QPZoeUwgb80LEd
 jQcuCtNxv4afTr6Tof+iWgYQ/7EtN2KX5MkivaMbRz82XBY56XD928MJa4N11iMMjd2mvzrV3l5
 c66VovEV1p0LiVed9hW73h6IVFbHd2ZXBOdTUt1VBbgRH5orf5EHi6qYITlavL6IXhw4VnBuNsT
 tXF5DmHJUWIsE7IqLJ1Cjs/IZfMjE1hQ5m1qAUihvZktgYeFGn2X/sMw600Qekh//Qr6RotviLA
 xieyUxb+jkwjwRaIEDQ==
X-Proofpoint-GUID: joNLmU-NVv0f9PtltSradr8q8OV1keIW
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfXzBl0xXEaRqh1
 HsqT3o8wWqIrMs9QnUfE9kiDoxmeL4Hp56lxMxjr2QsE7Tcns09dHCKGJVZyGjIDz669Tof9Qcq
 b6tBEUSi5zBWo3viDsMZqt+QjVSJ1xlEQa83/SiYOHQru2O4Ojqe

Export the in-tree Python binding directory so tests can import the build
output without installing it.

Also export the Python interpreter selected by the build as
DTRACE_PYTHON.  runtest.sh preserves that setting when invoked by make,
accepts it from a caller that sources the runner, and otherwise falls
back to PYTHON or python3.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 Makecheck  | 3 +++
 runtest.sh | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/Makecheck b/Makecheck
index 928fadb5..87db1065 100644
--- a/Makecheck
+++ b/Makecheck
@@ -19,6 +19,9 @@
 # DTrace:
 # check-qa-smoke: Runs the smoke testsuite.
 
+DTRACE_PYTHON := $(PYTHON)
+export DTRACE_PYTHON
+
 ifndef always-installed
 git_version=.git-version
 RUNTEST=./runtest.sh
diff --git a/runtest.sh b/runtest.sh
index 9f06a499..ca230ca7 100755
--- a/runtest.sh
+++ b/runtest.sh
@@ -19,6 +19,8 @@ unset CDPATH
 unset POSIXLY_CORRECT  # Interferes with 'wait'
 export LC_COLLATE="C"
 export dtrace="/usr/sbin/dtrace"
+DTRACE_PYTHON="${DTRACE_PYTHON:-${PYTHON:-python3}}"
+export DTRACE_PYTHON
 
 arch="$(uname -m)"
 
@@ -552,6 +554,7 @@ export LANGUAGE=C
 
 if [[ -z $USE_INSTALLED ]]; then
     dtrace="$(pwd)/build*/dtrace"
+    PYTHONPATH="$(pwd)/build/bindings/python${PYTHONPATH:+:$PYTHONPATH}"
     test_libdir="$(pwd)/build/dlibs"
     test_ldflags="-L$(pwd)/build"
     test_cppflags="-I$(pwd)/include -I$(pwd)/uts/common -I$(pwd)/build -I$(pwd)/libdtrace -DARCH_$arch"
@@ -562,6 +565,7 @@ if [[ -z $USE_INSTALLED ]]; then
     dtprobed_flags="-n $helper_device -s${tmpdir}/run/dtrace -F"
     export DTRACE_DOF_INIT_DEVNAME="/dev/$helper_device"
     export DTRACE_OPT_DOFSTASHPATH="${tmpdir}/run/dtrace"
+    export PYTHONPATH
 
     if [[ -z $(eval echo $dtrace) ]]; then
     	echo "No dtraces available." >&2
-- 
2.43.5

