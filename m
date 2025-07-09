Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3108B298996
	for <dtrace@lists.linux.dev>; Wed,  9 Jul 2025 14:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752072436; cv=none; b=Qyl8aj3ttOp54oUR6B/Kas+d4sMpO3pkwSEZ3y1doRwKTQGv7wk3nDsVI5Uouq2k0j1vRy75xzuWxMquhCHW1zfTIIytdiWNcR+3UPs1q68e3HRq+jEHVQx/9tDH2holfVGXDj6yybjaRROsUHxU1+MMOVVs5nEGLDS5ouRhX1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752072436; c=relaxed/simple;
	bh=QTIJCz+f18McO9iCg112dJKGgSH4tv5iQzFoTijebIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hOUxg5imCSjwW/CD7z50CtIMn3f0NZuED3l76bKdSoyyvuZzIMEP0QVxV8tH+kKLv/Do8Kn07tXWf+jDH49Zl0ASSEgEeAOBdSsEHTl6l2ycgLudPrO00ZkihXRrxSUx41yuLLL3yVIpT1zE5I1ZObrxy2upJgJJHLDOgaNo4MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Nl79Z33+; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Nl79Z33+"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569DZBro005796
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=ZiFvX
	KLFvKmmnmZgcZo28IbjYkFRyh5yk9vpDr+nzZY=; b=Nl79Z33+1e1SjiLLugXi8
	L3QZdqn6vGM6/Au01MWuzO76jpJ8uVV2vOUtprauqMT9TjCgIsDkyqoIOt+KVJGZ
	iCN9uGyCf/551jne7c8kqr/+Im957ksf5ZbJ5ae9EvYpoiHU8HJojcjaQM5Cvdoc
	ROnjK144imdWZZxupOumxMRKCDhkk31B0tYTAfXv3W5ENhekZRW5eMzrh3IEMXgc
	uX7O1pvj8UVhoESwf3kWJH1OXYiksthfG0djOgKkZWls1Gyrog9JCWEDXcUQWnf/
	JNWmv1OwpqpL56jTQLLcfa/nrq6k5bpDaxiaKlFCW7atK1OvhlajnStjRKGodsT0
	g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ss85g8pd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 14:47:14 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 569E75vR023586
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:47:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ptgbap5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 14:47:13 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 569Ek38i034091
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:47:12 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-63-52.vpn.oracle.com [10.154.63.52])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47ptgbanwh-8;
	Wed, 09 Jul 2025 14:47:12 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v4 7/7] unittest/tcp: update test.x
Date: Wed,  9 Jul 2025 15:47:00 +0100
Message-ID: <20250709144700.20591-8-alan.maguire@oracle.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDEzMyBTYWx0ZWRfX4SgcJvmrDCrt b+9lFM/Ss3i2pO0yIOKAQLLNxRqoteNRjWezXD4M5pnPXgZhhOxTiKkPNiSuvutKJQzbg/wema8 QXClAyG2TD7twrZacOIE8F64MudOakBvx+WcV5nU4hjd5YpgMa3WthR0J3DZvzAHIuK9a6ixT49
 3vL+kxRCOVFaCYignG3NB148bzwYQcNsiHS6P7rrSsoYl3kEC0nLcHHVrtIgsUo1A2NUqgwfOes Xfj5Lf9HDPwZ+ehj0OKf0W7WnsdXqL7Q2+XyKmYt5zCpM1B7k/lRVgvl3640hFq3HlK/E3Bxzf1 fYc/0aTyhCIcSZsV3O1dpk3w/0D5UbvT8rUqoy2mqpzQBSOZXcLwTgf8BpILx1FRvwdl7SRnfjE
 6htO/f+1Nux1ip3ULIBIM8j0tESK4xfk7JvL01PF4X3etySypcI4kFBDPel6W7k2NwjDojRH
X-Authority-Analysis: v=2.4 cv=a+Qw9VSF c=1 sm=1 tr=0 ts=686e80f2 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=upKd8Dwp5rUs3EEe2TIA:9
X-Proofpoint-ORIG-GUID: nzUI-HlycBxEfOwyXWue0o7cF2rFkL2Y
X-Proofpoint-GUID: nzUI-HlycBxEfOwyXWue0o7cF2rFkL2Y

Now that the tcp provider is supported, update test.x.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 test/unittest/tcp/test.x | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/test/unittest/tcp/test.x b/test/unittest/tcp/test.x
index e0ea2a5d..4de906a9 100755
--- a/test/unittest/tcp/test.x
+++ b/test/unittest/tcp/test.x
@@ -1,16 +1,10 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2017, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2017, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
-check_provider tcp
-if (( $? != 0 )); then
-        echo "Could not load tcp provider"
-        exit 1
-fi
-
 if grep -qF ../ip/client.ip.pl $_test &&
    ! perl -MIO::Socket::IP -e 'exit(0);' 2>/dev/null; then
 	echo "No IO::Socket::IP"
-- 
2.39.3

