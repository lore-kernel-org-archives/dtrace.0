Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27BD3988F9
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784647502; cv=none; b=P3cf2oWz+kLyRA+1OkOhCZtVBE3w3BEcBGJ2LeOGhUJosTo45tN8Tud1SZeGDqKuODVIYlaF6uIF5kExNBBQLM/H3p+u5F3qZkGFrBZyc41XVY7fM6J3nWLZGKRjbyxiRuxylfBig9DDeErT1KA48rfv68tI3AW9ZsJhINiI4oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784647502; c=relaxed/simple;
	bh=qW4gYJi7YD4pNwukQjYPDcf9GgiuJfJ8wizNJ6jRz9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ej8qO2zWpzXmKAfdoLnpcPzpfh4Qt/M36DFcJ0JXWSamhi2yEJXUzRM8khG6H0JFNepPgABUDPSJkgVxEF9m/2q3StG0Gp3yKFKdzsO9qVi/srvuq0G8pJ+aKTF7Caa24BG6JfT+FRW9NhPmZ0B6IPmxyOUt9AcucSi5w8Xz5Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aQxPIroa; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aQxPIroa"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LEeerV522653
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:25:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=Gq1vn
	kzQyZ2k5auEEeTKVH4JPy0BaH3hdBkDuNfH17Y=; b=aQxPIroaG2U9CCS8G5daJ
	QbaSc9wUvPkAln6CI11kOBoEP7E5uTOgcdTO2Z8bw+VcitK4dS57FtAzVgI0VHxg
	Xr4oR4dQyjCAzY4auZk/fa5ydTIoS+GGXy1GU+OBePqvhXHUtn0w4DF8F+rKn7EO
	rcd5Q40k/pvOc/e3tjDsvhJdD2ZeY0xYEKguU9oHn9htuu1LvauZbz8sSXrg4Tc7
	UzU8rtYq5WdjRMLzL1yHSepFrkxPmb/q3M1KPNifH2bOOS4bO+CrTbjmHenqOW3R
	gHYQ5AM3mpaDGTMZLkPKrUUvArtY/LIaR8uA7b1z2KKSW1gk0m/XHi4tB+Zq3iRO
	A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4fg1sqkqbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:25:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 66LFIk20036379
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:24:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ffyxpw2e5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:24:59 +0000 (GMT)
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66LFOrpU020536
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:24:59 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-48-223.vpn.oracle.com [10.154.48.223])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4ffyxpw29w-7;
	Tue, 21 Jul 2026 15:24:59 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v3 6/7] runtest.sh: Export PYTHONPATH when running tests in-tree
Date: Tue, 21 Jul 2026 16:24:50 +0100
Message-ID: <20260721152452.184842-7-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260721152452.184842-1-alan.maguire@oracle.com>
References: <20260721152452.184842-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2606160000
 definitions=main-2607210162
X-Proofpoint-ORIG-GUID: oixm0vQ9eO0rl1gvrhWm4w5fnnk4qAzc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2MyBTYWx0ZWRfX2rTu96X9oN61
 6N8PvOGWR+BoxZABppuNLPnTXadKucZbUXwYNYMUV0zQRcRWsPzM5S45g1dCE43MGovU8fSuC8u
 UYXo0dRi5zoKx/B9PQPpgpJu5Jayw1X6gAji7Qk5kQ2U31w0J4+KqxBBic/QTZ8+p10ndlE7+he
 94tZ0DKXuO36N2cMZwRf1YhvD+5HJ0Di9Z1K828hH2r0wKtufd/Qh7CIELpmmgPmWcYWm4UIPm0
 q+3THJHC3RP4/R5jF/LkR1/tdoeSmlgKanTaJX+zdqur6Vlj+I2vWSCK4VS2H6ReJaNRFE0r6xL
 QkyNEqeZtVouoWgF2F/5i8MREdRZAU3QlpeBXx4QJQAjZRGD7+/PPUABG/rlph+ZfFt3EiE5YPz
 eyLnxsA6P2FhrcIpBLwjdUitq7GcwwyQUoLCKUjCybAawLwCNzwviEjkjH9nXaNAykpA7l2OowK
 Vw3Mrj8YicWBLghPvwykhmodyZFTbx9n6SJlE6/0=
X-Authority-Analysis: v=2.4 cv=auyCzyZV c=1 sm=1 tr=0 ts=6a5f8f4d b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8 a=XaNk8tykWZnhEcX8sLUA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12218
X-Proofpoint-GUID: oixm0vQ9eO0rl1gvrhWm4w5fnnk4qAzc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2MyBTYWx0ZWRfX+VWToaFFhasY
 hAjGfPD52jZNoDG+fkIPi3rZP7hcZlLuoNxelqX5tWnya85yc+NRfH2a6EkLCqu+5h/R2snjCQK
 5mROy3eNgm+W/+WwmnjUTKq07dpg70MeKuYzqxcOnrdje56wgESR

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

