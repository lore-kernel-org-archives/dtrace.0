Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFED1A262D
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779907863; cv=none; b=TqQt9Ecp0CP2/dFU0UPR4ORt565hnAvSd+jZ2Mdhy01kwTRgvoehs3lwUlvWF5hkcNipqGk/7erZ9KQFpEkybVw7AueqH726iqiHnxFPZz3nItZVKfSsz3P98KDBaiCAhFKOV8DMvKloNMW+XghGuK567UJQ3uWrafq0vYk27W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779907863; c=relaxed/simple;
	bh=qW4gYJi7YD4pNwukQjYPDcf9GgiuJfJ8wizNJ6jRz9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dqVnd2ARJ5k+Fj3SHSonQbSoat6McWg9zhKt0R1+5zGSvO4+8nQ0G8hxyaAyRL6lYoeO3882DUKJeFJIQxSmtBrBmroVv12R6cXf0GgWNIzhYo6Slpms6Y/tSDUG06nQqLc0bwP0dmachfbfy2StAo0QKADrnje46MIKLQC6cbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CyzZrpIV; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CyzZrpIV"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RENDlm3541269
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=Gq1vn
	kzQyZ2k5auEEeTKVH4JPy0BaH3hdBkDuNfH17Y=; b=CyzZrpIVRAX/UzFQIn06D
	MjsAhq5dm+aHSdkjir5j7+DCrLoKfNqx5uNXHs3pwa5TkZsKRoFzaoN/1WU0dqT4
	Qm5o/kV7Kwb5e34TaHy8t4jhs7ZmPnABuHYtZEY8ZsTsmD6digkh9oaLrwFCjoR0
	iz01++UL4EcWKJJtM7sKy+xDvfLm34le4dPdj78ZgPiPgbm92Viqck9aibtuTnoi
	98BhvqRR3e1mproqVcAQp9uGw957iFhKk4C+EooF/dSbRhu/tD1mN62IvgSaPgYy
	rEYOGTCSoY8zH2MKTU0vCxaDtIcPb5rL38ioSrct7rPTMqeP0MFZKF39wttO/AOJ
	A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4eb48c63hx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:51:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 64RIocrx031390
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:51:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4edjse4tcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:51:00 +0000 (GMT)
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64RIomgm033024
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:51:00 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-48-144.vpn.oracle.com [10.154.48.144])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4edjse4sc8-7;
	Wed, 27 May 2026 18:50:59 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2 6/7] runtest.sh: Export PYTHONPATH when running tests in-tree
Date: Wed, 27 May 2026 19:50:02 +0100
Message-ID: <20260527185004.2267741-7-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260527185004.2267741-1-alan.maguire@oracle.com>
References: <20260527185004.2267741-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2605130000 definitions=main-2605270189
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDE4OSBTYWx0ZWRfX5GW5zzbfqEdg
 eOZJqRlpVYptb6EA9Yu28E1R4t9HGPQzRqiKaafcspKsWW9xpVICGZfFSYIzTv4x2Dpt/9Wfc0C
 bBpIKH29WPYiGZOqitx0GMdyo44bZEoEAh02fm6oe6OYLz96jt1nCmdIUxwb9RRyk9pXR5yc/NP
 gTZ/Vps+KE9BmNom+PTYAvykA7aAXpDrJFN0hhGcEOiMYIPi19x7LL8AXa3bE7PWvDChwHcQnEb
 tgidjnpEB7fAfDvgqS0g3GVnhXFui+uawpDaqLReY0LnsdDZQZ6tmBDAmn+CUS9IfBVps1Wxu6T
 BjmzZUwFhlNvfTYgXSzIqw3H8hCZMRUtDjRVz8nYmA7QOyRZVG+jGRueGruAIy+8wdyMs9CDwo2
 UzvX0Y43lEhfqZzugW6N2beDcgREwS85lmskXfKW/Y6hf44AE+yygRcf/y52KHfMcjeKSdvmmmQ
 M5uhM16V55xfWolkQ0MiG14wbwOUvW9+2gckuRAA=
X-Proofpoint-GUID: G0i93z5UuyCBogenp6kOOle9IqCFDMVk
X-Proofpoint-ORIG-GUID: G0i93z5UuyCBogenp6kOOle9IqCFDMVk
X-Authority-Analysis: v=2.4 cv=XfG5Co55 c=1 sm=1 tr=0 ts=6a173d15 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=3I1J8UUJPc9JN9BFgKH3:22 a=yPCof4ZbAAAA:8 a=XaNk8tykWZnhEcX8sLUA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13706

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

