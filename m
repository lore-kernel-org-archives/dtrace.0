Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BF51B4240
	for <dtrace@lists.linux.dev>; Thu,  5 Jun 2025 21:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749159227; cv=none; b=M2sm3uT7JZssODtsEb3HEMohTnU7D+YmDFp70aQSbdtB/EwPX2UVHwDN6YMhjOy7hGFWSsHOD61MLSzMDHHhwdsLHQ8ctjJsRkOUL1u4O+YKgXGZeyJjYOx03K4KA6T7hOrbECzbPPrKATvvbqTiSXN8G+z0v+gR8cqg9c9wQvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749159227; c=relaxed/simple;
	bh=P75b5XrGc7DNWjccEYeONPPC/4YPJwqOmbi2jA04jaU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TPTXmT0Yst+6788nHCdhYgO7O7J4ySoHWj/FsQYJgjOymtCEynBxg6vS4QnbEfrmZQf/+yTLj2NMLRLJMbtDuWRcegS6I6oazci0+xPQUCnbkKlCCAIMej8y1+glOT5M1nBBv9h+3AMVXiPftAmu00YRBPp5sumX92mch3PcIl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RhWtv0gP; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RhWtv0gP"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555Kvsfv031179
	for <dtrace@lists.linux.dev>; Thu, 5 Jun 2025 21:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=0DUeUfvWwQFt8epfdeSGffO8OingR
	UTZWrplKvKsfY4=; b=RhWtv0gP2O6qbf3ZrGl2JeY/WjUuRBaLY62P6UPWjUw3i
	3ZvIQSh9deap6jmpZsNFKN67o0jQ+bh2DT4Ui4ksMXh47GmsxPfzX8xYuQemewbk
	4z86DiJnNhd07f3sS1N9BeiCq0eVt5VoRFfWG/xEOFmVE7UoB0h/Bui3wdduMVrP
	LoTL+rkxDKF25TB+z7MhCwSeWAKJveqBzokjxMwP7xvbVP/GSa8uaGXklR1/RM0B
	pM1dhEiFFToQtDhFuinXrPKCGjOEHyQ/UQ1nbTKWc/2MS9FBVldZWlELXVyAC982
	KvkjD0+9VU/aQvgFnZ5bjffJEQCqfuGJSSN7TDsxA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8bpy27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Jun 2025 21:33:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 555K17Ol030930
	for <dtrace@lists.linux.dev>; Thu, 5 Jun 2025 21:33:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7ckmr0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Jun 2025 21:33:43 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 555LXHux037398
	for <dtrace@lists.linux.dev>; Thu, 5 Jun 2025 21:33:43 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-51-236.vpn.oracle.com [10.154.51.236])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 46yr7ckmq6-1;
	Thu, 05 Jun 2025 21:33:42 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [RFC PATCH 0/2] DTrace TCP provider
Date: Thu,  5 Jun 2025 22:33:39 +0100
Message-ID: <20250605213341.1410405-1-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506050194
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE5MyBTYWx0ZWRfX31uc03KC1xCR U1uGXcE9s3PfbsahgPD6PYVmGPNPck3gqr1PXwgWaoHSggAWHNcfUzTg5M8Li2Ka5CJVIEjyA0J PlmZ9UVN8MVwPsTas7Q3zIO/EY6Tse87Q60EBgZktllhafFWRnvKYlMiM7u76KvFrobmgtIL7X8
 t+O043YhG758aWpoIh3HsoE0BOMYy6Ab+m7qNfNlfClDrDUtYNPC+p4MxNMjXCRTGpltzAEvNAx V8hThyqLomNe/MAU5T/RdYrO5cJJaCSAnsTFtcDWSVjEIC5OSpABjCLMeP3FGOTnLV6vzaR7Ut2 9xRpf/tNodi4ixI6VLnpCdHxjnKPWKq8m5cS24ovKpuOBCi+Q/0ie+YdQ+HOHqiKLI0gjmKGqHC
 8Hzz3k5vPabOO93lTc3s3oIjl4s7S2Q9mKD/H/A5/w+GanH4udZU82W3R8TrMXNebxtyjiYc
X-Proofpoint-GUID: lWDFwys2wG59D8BkThbn2GFym_6fMFr7
X-Proofpoint-ORIG-GUID: lWDFwys2wG59D8BkThbn2GFym_6fMFr7
X-Authority-Analysis: v=2.4 cv=H+Dbw/Yi c=1 sm=1 tr=0 ts=68420d38 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6IFa9wvqVegA:10 a=rOQlyrnEiZY0jdiiXb8A:9 cc=ntf awl=host:14714

This series is a first draft of TCP provider support, where the
probes are implemented via underlying fbt and sdt probes.

Due to the use of the sock/inet_sock_set_state tracepoint, intended
for ~5.15 kernels and later.  Tried replacing this with

fbt::tcp_set_state:entry

but this misses a few state transitions.

A few things that need tidying up; haul get_member() functionality
duplicated in dt_prov_tcp.c from dt_prov_ip.c into a common
function (in dt_cg.c maybe?).  Note that we needed to bump the
DT_STRING_SLOTS to 8 to prevent assert failures; likely a
result of the complex translator dances with inet_ntoa*()s etc.

All tests under test/unitest/tcp pass unmodified on an upstream
(6.15) kernel.  For 5.15, we see missing state-change to
SYN_RECV; on further inspection it appears that while the probe
fires, we do not get accurate IP address info in args[2].
This works on upstream, so it may be that something changed
in clone socket logic as we call the probe with the newsk.

Goes without saying needs more testing and cleanups, but does
implement all TCP provider probes:

accept-established, accept-refused, connnect-request,
connect-established, connect-refused, receive, send,
state-change

so it's a start at least.

Alan Maguire (2):
  dtrace: add tcp provider
  dtrace: sync dlibs with tcp.d, ip.d and net.d changes

 dlibs/aarch64/5.14/ip.d  |   1 -
 dlibs/aarch64/5.14/net.d |   6 +-
 dlibs/aarch64/5.14/tcp.d |  43 +++--
 dlibs/aarch64/5.16/ip.d  |   1 -
 dlibs/aarch64/5.16/net.d |   6 +-
 dlibs/aarch64/5.16/tcp.d |  43 +++--
 dlibs/aarch64/6.1/ip.d   |   1 -
 dlibs/aarch64/6.1/net.d  |   6 +-
 dlibs/aarch64/6.1/tcp.d  |  43 +++--
 dlibs/aarch64/6.10/ip.d  |   1 -
 dlibs/aarch64/6.10/net.d |   6 +-
 dlibs/aarch64/6.10/tcp.d |  43 +++--
 dlibs/x86_64/5.14/ip.d   |   1 -
 dlibs/x86_64/5.14/net.d  |   6 +-
 dlibs/x86_64/5.14/tcp.d  |  43 +++--
 dlibs/x86_64/5.16/ip.d   |   1 -
 dlibs/x86_64/5.16/net.d  |   6 +-
 dlibs/x86_64/5.16/tcp.d  |  43 +++--
 dlibs/x86_64/6.1/ip.d    |   1 -
 dlibs/x86_64/6.1/net.d   |   6 +-
 dlibs/x86_64/6.1/tcp.d   |  43 +++--
 dlibs/x86_64/6.10/ip.d   |   1 -
 dlibs/x86_64/6.10/net.d  |   6 +-
 dlibs/x86_64/6.10/tcp.d  |  43 +++--
 libdtrace/Build          |   2 +
 libdtrace/dt_impl.h      |   2 +-
 libdtrace/dt_prov_tcp.c  | 397 +++++++++++++++++++++++++++++++++++++++
 libdtrace/dt_provider.c  |   1 +
 libdtrace/dt_provider.h  |   1 +
 libdtrace/ip.d           |   1 -
 libdtrace/net.d          |   6 +-
 libdtrace/tcp.d          |  43 +++--
 32 files changed, 654 insertions(+), 199 deletions(-)
 create mode 100644 libdtrace/dt_prov_tcp.c

-- 
2.43.5

