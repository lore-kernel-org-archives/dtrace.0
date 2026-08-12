Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575F132F764
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786540945; cv=none; b=mkYpa13jziWvdUgxdyCkr1g5VGfw1HtA5BxiN73ot1NZWh+ZlaRSGgBJL8obqBj7LeDvKvDwHzKP4/9kgYpdzdQrRegCCN1PSF2hw+99qYqGlVJqtgzK5FiMkoPE+Dy4pD9uBvXoPL/EW36Hmma9wdq4hkUw9wCwq4q1d2F/8TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786540945; c=relaxed/simple;
	bh=qW4gYJi7YD4pNwukQjYPDcf9GgiuJfJ8wizNJ6jRz9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GQboycD4IWIsSnbaKyRcODzYwbQQttV3UL/qsF6MeJgx+H9azWr+N+kJA836Kppt17fosi6HyDxTcLQXegYvV996pcpXIO5PPS0wyg+G2cS5zC/dJHwCrc/HC9VkmLP3d8aSkDocugBGcsDb7C8zdv40av1QPjwFOjCsMrh0/qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=n8xt9BH+; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="n8xt9BH+"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BLdvY13332836
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=Gq1vn
	kzQyZ2k5auEEeTKVH4JPy0BaH3hdBkDuNfH17Y=; b=n8xt9BH+Hw90Z7eBeQRdX
	kZyvcEEtrRplnTr8EoM8dJJTJLL8oUwXbiRrnQzdy2TevjisbsoFzZxGwFMrgdue
	OE+HTkumysqdq52CZTnmB5e3rHfz+0XMocR+b6DRsDox1fxTp/IORWphBLIsgxwm
	zJgB/ksb/RMXWE4owaUwVXaZSxOMTbkkhU4hAVMU9MPg2ge4PtE4T8bJFD5i93f8
	kG6F6pDoy9EkAmG+6Jp12x2CTZmaPa+5j3lKiLs8NSMPgbNQrck/T2K54oohA58q
	d9eVEDUk9+BQBydemuFs+o/1ptWUiptpZR16fc+FN9sp8G9fFX9jN8z+mzCZpgqF
	Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4fwvk6epq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67CDKkU3002943
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4fwtwsse61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:21 +0000 (GMT)
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67CDMEBu010792
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:20 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-57-125.vpn.oracle.com [10.154.57.125])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4fwtwsse20-7;
	Wed, 12 Aug 2026 13:22:20 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v4 6/9] runtest.sh: Export PYTHONPATH when running tests in-tree
Date: Wed, 12 Aug 2026 14:22:07 +0100
Message-ID: <20260812132212.527871-7-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260812132212.527871-1-alan.maguire@oracle.com>
References: <20260812132212.527871-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608120109
X-Authority-Analysis: v=2.4 cv=GaknWwXL c=1 sm=1 tr=0 ts=6a7c738e b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=RD47p0oAkeU5bO7t-o6f:22 a=yPCof4ZbAAAA:8 a=XaNk8tykWZnhEcX8sLUA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13509
X-Proofpoint-ORIG-GUID: 9ojvwi5mYfqs0jNbS9CtrrEgRFvVE3qM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEwOCBTYWx0ZWRfX5clcTelmObwd
 lyRy0s+36kX/WTpdwBcorMatZn6Iwd+Dr9m5lBKo4jtZ8S1ctqc21q9XkysPh8FmyfzZDpRTRA8
 VH0od/iwF3QIOFkjCOxIcjDndMgOrrrV2CM78t6Dh4EPFpgNfcfP
X-Proofpoint-GUID: 9ojvwi5mYfqs0jNbS9CtrrEgRFvVE3qM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEwOCBTYWx0ZWRfX3htZx1xn49p7
 40dfWRGxfs65zwDSjzd0hR9BC6pNYl2bEkSSx1T7PBxJafWcartdeAH6hQiPHVkzkaoEy2EZO8d
 sHWvsZ5qrjXIM3wyakpD6wZxJL0QcsuFVlPn67VEeHp0PjQLRZgb0SzPdJbgd90xlal1ff+tm9G
 /Zi7TgQfIK3qut+a3zZP0dY09E/GLP0eQcCi8wJhN5MDicVl61HxGx77G3RWQUDvTmDUJEyptNF
 0Xpw2TOn/MtABIwZ8r9pk6irSTnb0Hqkr0ht2SZeON68FZaA7kiX5BOq2T+XC0A6VcYgXY/Zgei
 ajd5iWGFwkZcxe9HOIdGQGkZRXjKYph1i6nyOOG2QxySXuVKHujBiKdBsJHkPeIOZEc0+HkagBP
 9J5/Vj5r5NHf6tndHqgiXdEHk7GywUtOnosbaqQ3ydU2FcIV4Ig3y9OZtPPIXb1G2fr5y24gQ6o
 Xf5AnloddbDeE/pGvzIQLlQjgnHVC8/UnMzPq1B4=

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

