Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA46226E17F
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755886604; cv=none; b=pCexsfUpbDJhi/gUmJ36vOzC/Jl03PF1/DFdv0u/YsWkEThrxbpuqGKZnB9lcgO6hUViGorNxkxx9nLF0r6jsM3XApI+Jb5CaFnpH/0zaIjFSAfOaLTvh7BqPXQrTreTVL1OSZ62vyt28+rUP064kLiaZNla1RZQdvqt5kPlzAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755886604; c=relaxed/simple;
	bh=i9UF1idX0GlbaPkynfgT99uE0wLRRidIIeTBqgypXqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OCF/XwkUD2egXbrvqIaQ6fHSHNspFe6kpeaAGVC9pxTOIk6uoA/xjfJyz89UE3n/ixlovNzJEuaqu61dfnnd38MDz+hlKRa6AbJ3Nv1PNzDLfgnSnHWsCqzmrUPx5QMm38fxFwdlY+dbVhOvW2Hm6xIXNecwHLuSEfpe7+OkqS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XNkvPWgw; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XNkvPWgw"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHtrI8030187
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=k9iyV
	rigbSQCFZD7XWZr9cQn39cWblRQ6L4U8m+WXGM=; b=XNkvPWgwp0M/PuA1pZmFx
	MkL4hG2vLfCRPmq7qeWJ2a0pV2EopLioGWR3ZgO+ZBmlsymXPGagispHDRFo/ORk
	ucFMwSiypPy2QjRshmySRHYUV2sAFQoEDMYDxGYbxLqXrxeYspy3YdM3JjlDPqYP
	fqn5ocP9z0eUvYtg1pGQebXoL4Barj0H7jK0NSTvKayEPloe9qOof6XgXVMfcKc0
	zaG+ZgY7DFDpwlGjcp6eBzskt5G+8f9OJUGSvLn5iMvAOQEd8EDm5VwKvSlZgv8i
	MjkmDW4b1m8GLzs9zUEd4ynuHvpuALYS/ncSeIgrE02PMf5vqQQXa56tTH/0AjYh
	g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48pw1dr2h4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHHa35020792
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48nj6hndk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:35 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57MIGU4O009458
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:35 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-56-42.vpn.oracle.com [10.154.56.42])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 48nj6hndg2-6;
	Fri, 22 Aug 2025 18:16:35 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH 5/5] test: Add udp to expecetd providers
Date: Fri, 22 Aug 2025 19:16:29 +0100
Message-ID: <20250822181629.30972-6-alan.maguire@oracle.com>
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
X-Authority-Analysis: v=2.4 cv=OIAn3TaB c=1 sm=1 tr=0 ts=68a8b404 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=2OwXVqhp2XgA:10 a=yPCof4ZbAAAA:8 a=HejCxUBzJBncv5ocT6cA:9 cc=ntf
 awl=host:12069
X-Proofpoint-ORIG-GUID: G3qd1cgA7NC_sHdTHqhO71Oo_W41ndTh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDE2MCBTYWx0ZWRfX3Zouq58m/PdO
 XZB1bibrqTyj1oXarTRQhQMzjxjP3OnxsJixTijXEQD5z3c07tmULdf88YLSCBHmiiWyza81N24
 FeYGXPS0sOFvd+g0jvuxTcIQVK3P8eFPOY01VxJMaIb7rnjSUZpRNPQyWZ0T/OReLCdVKMUzMPT
 wcgMX9Z50pK0vrsb3q1tMccfLR5BuY3VY/3ARr9or9VFwIFH5FUnraiYPuvY9QM50gjyeZr2/3c
 Pbbb7r7Urh35CGNocjq6IJywjXusEke5NukX9PtZhu+PCETyBfIGPi4vSR/u4zmdoQnloaibx7T
 7JHnXdqBytAWEcBfavXR8M+LkRI/O99pI/iVJzjUgy+MTLENf+NcgYB//0MyMaIUJDQjEOK0Ahr
 ileQVfLt1U4kHnoHGMheCSwKFrPPpg==
X-Proofpoint-GUID: G3qd1cgA7NC_sHdTHqhO71Oo_W41ndTh

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 test/unittest/dtrace-util/tst.ListProbes.r  | 1 +
 test/unittest/dtrace-util/tst.ListProbes.sh | 1 +
 2 files changed, 2 insertions(+)

diff --git a/test/unittest/dtrace-util/tst.ListProbes.r b/test/unittest/dtrace-util/tst.ListProbes.r
index ad557253..a1e185d4 100644
--- a/test/unittest/dtrace-util/tst.ListProbes.r
+++ b/test/unittest/dtrace-util/tst.ListProbes.r
@@ -12,3 +12,4 @@ sched
 sdt
 syscall
 tcp
+udp
diff --git a/test/unittest/dtrace-util/tst.ListProbes.sh b/test/unittest/dtrace-util/tst.ListProbes.sh
index a747a045..744bb8ad 100755
--- a/test/unittest/dtrace-util/tst.ListProbes.sh
+++ b/test/unittest/dtrace-util/tst.ListProbes.sh
@@ -70,6 +70,7 @@ $dtrace $dt_flags -l \
     $2 == "sdt"      { mycheck($2, $1,   600,   6000); next }
     $2 == "syscall"  { mycheck($2, $1,   300,   3000); next }
     $2 == "tcp"      { mycheck($2, $1,     8,      8); next }
+    $2 == "udp"      { mycheck($2, $1,     2,      2); next }	
     # nothing for usdt
 
     # Unrecognized line.
-- 
2.43.5

