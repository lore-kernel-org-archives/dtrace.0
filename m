Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DDE2E6139
	for <dtrace@lists.linux.dev>; Wed,  9 Jul 2025 14:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752070205; cv=none; b=O4A8Kr0QYX1YBCIeksqQW+S9EnuOOGuiGQz6Lfvj5c0eUHYmEsyUCcu5qo2dObmug/GpENpet68W79kyiChiYpbaiKJAVMYEg4ttw0pCCoESKYSuE2ogYbVGpR/aqdWeMEUW4pxYzadb1V9Mz+1NlRbFkwxx1XFf2H9T9iyvCZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752070205; c=relaxed/simple;
	bh=QTIJCz+f18McO9iCg112dJKGgSH4tv5iQzFoTijebIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XA7C5uqadr9OMCS9xxtPzrFQEf2d4SRHeJq25vU7ESZru6sp0spcvq8O9o0w66h2reEDASrSHNt/BWc1p/s3DGCB6iY9NB0i/JbD9UiozhnRPZcGvImEnL6dFkrFDH3I76HQj31MuZsr9bXWqSYURaiXEfv7PuXByXts7dF8NXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ncUM7dEx; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ncUM7dEx"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569DZBGQ005802
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=ZiFvX
	KLFvKmmnmZgcZo28IbjYkFRyh5yk9vpDr+nzZY=; b=ncUM7dExCK1cYviIHqaXR
	QA2NnmWF2C/Ws8doiyDTKBIZb7sA69wbf3rcBcMBPIW5cpjQSkZw7cQLHcvfRDwX
	BMKIOoRFRf9Ho9jaaiqR7/df/X/og3SRusgqFyrsLQjay0ieAdJ+Gra/dmBPWAIy
	0krqwlGMGlVZ+zwkxWrpnXD5faTBX2s+P1Ck3SbMKW+zfOv3M4soO+CdqU2XWY1c
	B/5XIe+o7QHyaxel8tphuebKuQXq4jVJILsM06wqMy9hxdl4+e/YwHDvlIDcYzMH
	gOgr+5EopAo0EkjEKsLn+/SUdOKXlgmCDajK2EpWHwA4oD54VTabYWbB/XAVPtPY
	w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ss85g57h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 14:10:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 569CVd33021599
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:10:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ptgb0pws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 14:10:01 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 569E9o1o028485
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:10:00 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-63-52.vpn.oracle.com [10.154.63.52])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47ptgb0pk2-8;
	Wed, 09 Jul 2025 14:10:00 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v3 7/7] unittest/tcp: update test.x
Date: Wed,  9 Jul 2025 15:09:48 +0100
Message-ID: <20250709140948.15090-8-alan.maguire@oracle.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDEyNyBTYWx0ZWRfX96gkb2qdQpgk hn2h75V6rs29f9Mzf8BP7xCt0rZjhEgjl+cWJErzzi+HDRbDrY06LEj0+NTGOK5zxqbFFImQlX6 yD2wSN9cZQCnD0ydPu8oyX7Jm+HYbzFAyI/edrsilxGtLzS6k5xu4N2JaRQAiYVm/ca+ZUHNal2
 VXVpDNLIqr6XfdDev8lQxnhuMduqpyd1CYmBmVSpIJMHM2IadHwUSF+56YsTGG6tQAgc/mLPP1y KzLS3TZ1bcnnhz0tpuKkoaKQ0qja5ZKkYM6/pnUjL/5omUOD8Rd49pTfjVdoVsgJA5IGBWQDIlq 1Xodqv75Blo8BvgXAwhE/m3DbU9ZgL8uh75Q/R8RMsQkjafU1fpA3uwHOlKvRMK397NzQhrBuGN
 nX52mWyxW0mWQegjp+KO9TdjsJK1uMon5ON0H+KCZhZwq4iCwJUhyQm9iNpWj+JhVhmCPu7t
X-Authority-Analysis: v=2.4 cv=a+Qw9VSF c=1 sm=1 tr=0 ts=686e783a cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=upKd8Dwp5rUs3EEe2TIA:9
X-Proofpoint-ORIG-GUID: vYcNq6qyJmz02EtxfQYggaPxVRP6cgpS
X-Proofpoint-GUID: vYcNq6qyJmz02EtxfQYggaPxVRP6cgpS

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

