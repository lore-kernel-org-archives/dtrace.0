Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6C729A326
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755886604; cv=none; b=tFxxvJmVN5h0PPtz7byo9iGi8QrD+MYeufer2stnlHpDnL+mwLOVlwT6pJC2uRF2OGQXqi3Bd1O8JX50264C3AsXHodWamt0DyFi5yzkxNkB4pev34jZ3cD6oQD39Rkkbla87y6IAfGyuI/dkAOlKpIgLyft0Tfhrnk8QyaxJWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755886604; c=relaxed/simple;
	bh=NUq0c5aZEFvOCSoRuXgBOhwO1epU5plGcRKmaqq4pj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tuyB5HcFdfjdvMFWhRJygPkkUYH++1U3iuIMdbWjgz+Xxd+wFuKkBasSmkbOeAia+hK6pQeJY3eW8VVCjTXnjYQBqfuU7HRoCte23phDPiVdu9RwLSaZX277ZGm+y+D8qp+KDUqJnanNzWF2uCn6yezScuy9EKhP7Mehl95dJWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZuwhKyb4; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZuwhKyb4"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHvsbp028377
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=Cyk5l
	iYoQfXuLxSx09/csMLzeceofaOhpxUNys/PlUM=; b=ZuwhKyb42nTz0NFqJXZci
	/4BOxCNvlbmokF7jd3I6X3mesvoj2FyEfv6MPhuqMINz2Z+y8TneCTsg0yuzCJ/W
	92HV57zGDaQsB8EW60pCblYmvAe2c6vR4UHfg6/SGLqzJisuO/0bDWu9gXWAj1B4
	btEvFAJ94P7FIRVNeHJX3fQ+qIxFIUvjZzPSvUdPdIYDzk+meclTFjnOvEJHyCg9
	ZUayxrrMxRe9P/dJYskL55qoDhjK5WjSxxJ0I0KshlXAH+tPDzfgwt3WivS3oSrC
	NTng0+YF36aoFH2SgHJKAlEGPOl+hKlj1m1j4CXZc2GHkp5/pR5/BmxvKiqmdInT
	A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48pw1t8231-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHNYVx020789
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48nj6hndjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:35 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57MIGU4L009458
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:34 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-56-42.vpn.oracle.com [10.154.56.42])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 48nj6hndg2-5;
	Fri, 22 Aug 2025 18:16:34 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH 4/5] test/unittest/udp: enable IPv4 remote udp test
Date: Fri, 22 Aug 2025 19:16:28 +0100
Message-ID: <20250822181629.30972-5-alan.maguire@oracle.com>
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
X-Proofpoint-GUID: j84jevyapydIylLBqGDGweV_Gj6m79Q0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDE2MCBTYWx0ZWRfX5Za4GBT43/Kf
 i01loJGGBn7ehAzpAklHuzRulAkuAWdV552qWe99v+BgASO6S3Lftl+vf6oglCl9i/uSr5b/k0Y
 if8d6O8SzzDCinnuEyFbQSbWo+QAQuww1FiruVnE3jLD8xQZ/FRFkPzdksWI/u7LKf8WIBBWah4
 I8sFstxtD+dhFVcSmvS57CntLazHS/jOBoT786fX9haRaIvrhteiCYLWKdqW7KTjYAfQizJQ2gx
 a7Py4mzmXqBhHWyQ9yOgNWvEIt25jNwQx3ZYw46LwV3IawWwKJIAeLPtTTSqpuz8lk+31H3PaqS
 seghELmBHD6wLGbo/8VhSRYNNww6I1Ke9OAPlqIciyRcDAqb97T+q3Bo0/WW0+SRR5XXKAfPIVt
 2d6AY0WhnZ4O2A9sLc7q7TmYzpjbmA==
X-Authority-Analysis: v=2.4 cv=JYi8rVKV c=1 sm=1 tr=0 ts=68a8b403 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=2OwXVqhp2XgA:10 a=yPCof4ZbAAAA:8 a=PSl-8CEfTEZFWXh7UYAA:9 cc=ntf
 awl=host:12069
X-Proofpoint-ORIG-GUID: j84jevyapydIylLBqGDGweV_Gj6m79Q0

It just tests send so we can send to remote address
and verify probe firing.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 test/unittest/udp/tst.ipv4remoteudp.sh | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/test/unittest/udp/tst.ipv4remoteudp.sh b/test/unittest/udp/tst.ipv4remoteudp.sh
index 89309cfc..62ed186a 100755
--- a/test/unittest/udp/tst.ipv4remoteudp.sh
+++ b/test/unittest/udp/tst.ipv4remoteudp.sh
@@ -13,9 +13,7 @@
 #
 # 1. A change to the ip stack breaking expected probe behavior,
 #    which is the reason we are testing.
-# 2. No physical network interface is plumbed and up.
-# 3. No other hosts on this subnet are reachable and listening on rpcbind.
-# 4. An unlikely race causes the unlocked global send/receive
+# 2. An unlikely race causes the unlocked global send/receive
 #    variables to be corrupted.
 #
 # This test sends a UDP message using perl and checks that at least the
@@ -25,8 +23,6 @@
 # 1 x udp:::send (UDP sent)
 #
 
-# @@skip: not sure what port 31337 is supposed to be
-
 if (( $# != 1 )); then
 	echo "expected one argument: <dtrace-path>" >&2
 	exit 2
@@ -41,7 +37,10 @@ if [[ ! -x $getaddr ]]; then
 	echo "could not find or execute sub program: $getaddr" >&2
 	exit 3
 fi
-read source dest <<<`$getaddr ipv4 2>/dev/null`
+set -- $($getaddr ipv4)
+source="$1"
+dest="$2"
+
 if (( $? != 0 )) || [[ -z $dest ]]; then
 	exit 67
 fi
-- 
2.43.5

