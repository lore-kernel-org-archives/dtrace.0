Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5BC28A1F3
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753178886; cv=none; b=h/fQ+1Lxow9rPWEyIfAFmnK8xbCrw4QM0uiDo39ZBwOsH2Nyhzov5M0abNGVGyxHklo9DmIlHl8Fz/HwDKfVz6kkPtz4Ges3Vrq3UYEpBRYePRPAzX72G+8lr78/xRAJMl+QogZcvNsIPX2HerfQyTlHbTfsuAXMo5YbXmE6QeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753178886; c=relaxed/simple;
	bh=i2NYjPNuvydaXN3UzaeGH/mTOdDxPVVdDfswDmSLKlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mrthr8zoZ2z/obU3p6JHHs8xFRSCiOyc281/3Ux4zF+lUyyhRyJ5jrlDoCHNh7gttVU4tdE54oiQ/dP4/PL4y9Y3OY3ZUqE//LNoGfuW2yAhDxiRGW9BlfLaauewVpjn1OoWUAfjR4Ce0GSurE+lkw4qZFC/oNRrEXSoJ/JrgnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Z1J0Hy5Z; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Z1J0Hy5Z"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M5TCqi009172
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=Ng0D1
	UlOox49nUk6oBZi/BugTbIGiOZb0g74s9aAf1Y=; b=Z1J0Hy5ZsI8KiOoGlL6Fe
	LS2Bodu8/7qBHsEEC/R5nT9iyYljdr/yyvBbI9wRFI7ONhIaoEsIfQit7i2Wgi0E
	134HOyTd4QLojVkWzYxTN+pMGHZru43KujoZwx2vSt/qB7UM66brS6CL21fG9dnc
	/3ST9EC6rfUpHsCOXiBAQAAZZ/8AyXhj6Vjw9y4zq0hHYN6i/XwRIEIYXoQJZ42M
	73O7spIJFjqZZGu1/reidgq8Ovjk6ii5Q1j6iLIideeYPOsAivmWHXPnV0AjXBQY
	rmoSJBrOGsYHNexzBmquLqP70ntw8jGs7sz2gt3LnIeUuS0+2A5Gfq4Inrt+83iQ
	g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805tx4ywt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:08:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56M8L6B1011001
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:08:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801t940nj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:08:01 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56MA7o6O011213
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:08:00 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-50-138.vpn.oracle.com [10.154.50.138])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4801t940f1-7;
	Tue, 22 Jul 2025 10:08:00 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>,
        Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH v5 6/6] unittest/tcp: update test.x
Date: Tue, 22 Jul 2025 11:07:49 +0100
Message-ID: <20250722100749.233821-7-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250722100749.233821-1-alan.maguire@oracle.com>
References: <20250722100749.233821-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507220083
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA4NCBTYWx0ZWRfX8VSZJggYipCL
 PU7Ym6nWwzMgVD0MCDNo9KSExXGNHpNVRnGelvuRBJxQUT+hMYz3yw/hkMAqaCmujy+Z+H89I52
 eoBcN49REXFG4WmUCdGQtRB57vFIcmeeSrSXM1D1E96NNL0gJci9ELsDfZ4eB1+9D4SIYVtJEHa
 JGM3pTpWMeI0LV/inPoirSw5m1XKrWayqEvhW6FRVaTLw+LodNJHyiqTdXTeSk+VbOWPoE/qYVf
 atXAQ2IQ1UlqsYmIKKMsM/w30SaSwKjsVnjOqGSOdvR7eDgkfY0ELt7KLjKJ96vl4Vtf+DGy2mU
 fFDID0qcNTkjNYZ53yzGhJgCmyKmquksLcv/zKMD7TBIGDEQdbxt5WsfzxYVSuXBKLSNeOQINo0
 6IdtUOrBCoP35WmuAto119299nx/59hx2+RHieMrhUq4BuuxBe8cmB387ChQ5TH+CKJzxclZ
X-Proofpoint-GUID: 4y_rvUOycLUs50mrwatU_VrQ4L1uETIu
X-Authority-Analysis: v=2.4 cv=IsYecK/g c=1 sm=1 tr=0 ts=687f6302 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=l2JBA6lF9nk3RhcyZFsA:9
X-Proofpoint-ORIG-GUID: 4y_rvUOycLUs50mrwatU_VrQ4L1uETIu

Now that the tcp provider is supported, update test.x.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
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
2.43.5

