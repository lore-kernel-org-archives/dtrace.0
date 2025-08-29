Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB460286402
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 08:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756455860; cv=none; b=hNw7Sx3087kAQfCPE00ZRXhl3s1qeWqCux/Hm/Ws/YLvNWBVMGQZxQ8eTz8RLCrTf/Se0Y2+xJ5La7ejT3lJfIhcjb5BEfmAAFYgU0khYMlUfwtcuGmjaXBSzfwd7geINIbamEQMnKBalIrzeh8beSauSlkdfOnAygGq4daOX44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756455860; c=relaxed/simple;
	bh=7UhUV6iGnvAh11JL8hF5OXCkypVLeb0bXsV4reHv7k8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ny2qbzbBm6OLEHxEy3djwSln/jcg4JLR0OPiMP9xD19uLoHZqUyoK/fB3+i+RQ72hKAVfE0uM/nsL2f4eZ92nklIYgRxoPVfltdKPN3KJJe/JBlBhLaX7vRNwOBD2Seql4C2xnDJ1jF5S6XbAfjUUHZ3yM/I/pOtnkBlBLRcpSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dSPqvrEF; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dSPqvrEF"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T8465x010954
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 08:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=2jPrg
	2xTxdAhigBHLt3hg33Szzfy0vqHBLMV2Y/10pU=; b=dSPqvrEFD6idBppSfueKt
	BnG4hnajghqhoki9Ah2Ri+htpdjh+sFNeIlabMM/dmiioZUpDZ8KUgb29i+IgWFn
	cIZ7zdizLikM0D+IYL4/TGvCRbv6ah/xxs9SatvdvgJGW7l3j6oXQN+0/nSsVeu2
	SGZx/xMUbLZU541cP7bfrKofmM3MnrYrpNvbcXP2nqSSjDig8sbcZCOd8vUIfoHp
	8MsgLNRMTuWaJ7T2aT2NCp8UwEcsz6zGno7bbjyZyXfWEcUJHi6siFU0E+aE5Jvh
	etO6RJ2KC7EjOzwfEod677+Dpx1jAtOe6ElLVOYY8U3FTW7ZbcHvo/iHXWYxP0OT
	w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q4jat2kr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 08:24:18 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57T8M7pT018957
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 08:24:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48q43cyha2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 08:24:17 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57T8OEWx038773
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 08:24:17 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-58-49.vpn.oracle.com [10.154.58.49])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 48q43cyh7v-3;
	Fri, 29 Aug 2025 08:24:17 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>,
        Eugene Loh <eugene.loh@oracle.com>
Subject: [PATCH v2 2/2] test/unittest/udp: enable IPv4 remote udp test
Date: Fri, 29 Aug 2025 09:24:12 +0100
Message-ID: <20250829082412.25687-3-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250829082412.25687-1-alan.maguire@oracle.com>
References: <20250829082412.25687-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508290070
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAxOCBTYWx0ZWRfXy6gpvIYj48g/
 QMY+Zg07YnapL80rnx/fxsCGBlV38YAj2UYtDxiwGr2qsUxnDezfG+Z6kOfVUV/sBZjjFyzFbwI
 HkbtcKB0bQ/Qp2TVsoD+JZLMGoFZSs3W5hRlHwKzUYYpMCy0r3g54N1eOPOm5iEY6JxEkpxScnY
 vTZrLVJwQVH9Hc6rsivb0GfXWEjuAS0rdR0TTRuHCK0oWDU0v7+g+ViR1upnYgvGIwZqpEZERHz
 QATv+MZrw6VVCBCKvY5ietfBDtsNzMtDzTU2nTYuj6hRYFyBwby4pF31+TG/jbUISHsiTnv2XNz
 O+z0abBaRI5NiFB5Y5nm+vkU2GZvk5Qzml7dVioeby2EGvEeDVIfjKN2nMbZpbJFGd3A6CqZVXy
 xr/hfbxR
X-Proofpoint-GUID: GyU4l-X-bNGUpovzOHi_n7yUqFhUW6tH
X-Authority-Analysis: v=2.4 cv=IZWHWXqa c=1 sm=1 tr=0 ts=68b163b2 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=2OwXVqhp2XgA:10 a=yPCof4ZbAAAA:8 a=PSl-8CEfTEZFWXh7UYAA:9
X-Proofpoint-ORIG-GUID: GyU4l-X-bNGUpovzOHi_n7yUqFhUW6tH

It just tests send so we can send to remote address
and verify probe firing.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
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

