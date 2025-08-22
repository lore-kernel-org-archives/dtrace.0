Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5D135975
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755886603; cv=none; b=nDGe0Z4T9G44GVPw2Jfw+XwMal70a8Nkp55/x6yBGYjM2YV17GGM//ySgLag4h2h7j7cq6hu1/e2KBuAueBzRuZ7PsnNc/EhHQsjMXsbLEMLD3DTmb0hjRsZKQBuxow2g4sfXqEqZLBQ9fMhD8Uw9T984ZuhASYccLi6O+Jm15E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755886603; c=relaxed/simple;
	bh=AbxVilaFzwpx7ZXehCInqZ74RykwlVMrE8eCTi3G0Eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZhRin0GJfUJIvErWodqLDT7H/dIWJ21TXG4A0GyMEmj68nca1M3oBK+vNaCOo7TugcKxnAnfGaavsqLPMYk61rVTfbQzViJGZ9N+NIKTTCuEtTPSHrZgUOTGw+jib1ZXczR9BWUIphGtkS120oPxQiuzj2I0AN1zgzsvV5Z5584=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=q0f8gC7C; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="q0f8gC7C"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHvK8u027874
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=44M3N
	au2Y0cEHnsyHVNeUCI7L9ZYcVB1tbBkyBwXEHQ=; b=q0f8gC7COpqcHCeiG0Rse
	LWOQdLlwfs/Q+lxxfwRBr+A0aB7frUz5BsQbPR+SxnRdfj/Rpt+LZh3L9o5sc+aT
	xwq1Y1BxCPLbNo1ug8GxbpCSrzdNH71a64Gs1oiUI41T9Pnb6HUBqVP+2oJYYE+k
	GsbgZCs9mwNIrHFQ8AxblsHURySqWBmpJJYYcRoKQBT9RKzPIz/Anzn8WHDhCwyi
	YBEfKnIst6F00355TQD5sJfB9mlHJ8whniEakO26KK+GJHbV7u2k5B0kWqNfFooV
	G/C+AULgLt+KPvwdRnQzTnTRHM31QsuiZDzZ0cZtlHCLnM+G/aOfpi9SSFJoxptd
	A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48pw1t8230-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57MGacO7020632
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48nj6hndje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:34 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57MIGU4I009458
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:33 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-56-42.vpn.oracle.com [10.154.56.42])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 48nj6hndg2-4;
	Fri, 22 Aug 2025 18:16:33 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH 3/5] unittest/udp: update test.x now that udp provider is present
Date: Fri, 22 Aug 2025 19:16:27 +0100
Message-ID: <20250822181629.30972-4-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250822181629.30972-1-alan.maguire@oracle.com>
References: <20250822181629.30972-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508220167
X-Proofpoint-GUID: 6S2_zxpyyphjibmqnvIH5HZaJyXmcBSn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDE2MCBTYWx0ZWRfX4f1mLIdCwz5+
 VvQ498UOaXVnr2j45eqIESmb70Bx6+VSOoHhUraRemNBSroPneM0WLYtzpe0GXtG/D25XxeeVf6
 Q8TedKP1SuA2o6vylw5n3M3w/e5x6cM2TK69CfnNjwLcyrGx0PCyWcCBeGl/dbltA6TH4jjSwLR
 hQeF83V75kt62KT3NSWv3HG/6/vmpI/bhw19OYAmbOXvlIfWU38wEepq/hkpmTyog1nH6Ikl3RE
 RKZ5X6F4p4GJYvp2M4VGUEk1/axavTZkh/fWsjAxh118DJUFi1wJ+8wi2PyW8v+aoNHx4REfUrH
 WY2rPjcttiziON87ANZEqXZCQ43yzEUiNS+MEbrh6O6dnkr/6ekeJEWB+rZp0cyr1Qca+A3V05H
 6Ws4s0y+VuRSJiSSIds1oW/1Xy98Zg==
X-Authority-Analysis: v=2.4 cv=JYi8rVKV c=1 sm=1 tr=0 ts=68a8b402 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=2OwXVqhp2XgA:10 a=yPCof4ZbAAAA:8 a=k_26e3Bk4TQu3a3YMIQA:9 cc=ntf
 awl=host:12069
X-Proofpoint-ORIG-GUID: 6S2_zxpyyphjibmqnvIH5HZaJyXmcBSn

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 test/unittest/udp/test.x | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/test/unittest/udp/test.x b/test/unittest/udp/test.x
index d3d7a598..2ff8d675 100755
--- a/test/unittest/udp/test.x
+++ b/test/unittest/udp/test.x
@@ -1,14 +1,10 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2017, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2017, 2025 Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
-if ! check_provider udp; then
-        echo "Could not load udp provider"
-        exit 1
-fi
 if ! perl -MIO::Socket::IP -e 'exit(0);' 2>/dev/null; then
 	exit 1
 fi
-- 
2.43.5

