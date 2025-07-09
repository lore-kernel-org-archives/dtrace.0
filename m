Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576B728F523
	for <dtrace@lists.linux.dev>; Wed,  9 Jul 2025 14:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752072427; cv=none; b=n/Q9AmVnyanKVL6tOEKvUQF0WQdJBQWMmfrlVFnxzj/wFLi3VexEM0NIczFDLQS2RugLd4J41+ZK2krchWO/0MfUN5nROuFjNc+zBh03HrdOn1a8Gpg/jfrNvRdkksGAHWiJob8sct9J/vyQUe3I6yCKt6tyGVvNY+p1APRZAto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752072427; c=relaxed/simple;
	bh=ph8XVnkk7wsAIxHbRs/Ympm1tZPo0M7kE+XOHXnJR0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZVNkmb+6Uc2e8hwim2hi/FlOoacbBn/axBIxxxWnXOJ89qlhYh/jeTcjtvGaAip3x9RGtBMfOkVKTjPS9B1jjDi8m/vHBanAj4+U4EgY+mLM/7acduo9KEO0iqnaCB1kv1MiVfoZmkZDfwTEquXL5pq20M9OKa/leXaL6MSEd6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ToX0SEUt; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ToX0SEUt"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569EMCK6031663
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=iifuN7dYycZLVuuj6nKHumpulWrE7
	notHtTSvStGQhU=; b=ToX0SEUt/Fsm3GOJ2j3WKFH5Z2N9aAddD8Gp7qujeaTw+
	d5BFQ/MXCGj4Pe44J9SOwxm+aA5JEwhdrTYSksjTt1mw5ZVuINPuDqVqYB1uQykq
	494ZzbjVKZ0DZjbPXtosxaD17iEbRiZlVpGhJna4eJ6O6laRjbPHyOM6cFNFFh0i
	/G3IoGVi6z1lpT65F9/qrW2PqBCnayoUjIcf8/7XNNw4bWdCaTdCoJ6HyOlO0aX3
	I3aVdQxjf2HsODVw6dUBxeYBqhvqq44lLxkMTG2WmMNP+YyuqUGu4CcV4JO6kPJc
	0owbW/Xf7B75PeAW0HeXFCY0skJ2pCJrYHrBpyPeA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47st4801s5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 14:47:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 569D0RBc023621
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:47:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ptgbanxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 14:47:03 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 569Ek38N034091
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:47:02 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-63-52.vpn.oracle.com [10.154.63.52])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47ptgbanwh-1;
	Wed, 09 Jul 2025 14:47:02 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v4 0/7] DTrace TCP provider
Date: Wed,  9 Jul 2025 15:46:53 +0100
Message-ID: <20250709144700.20591-1-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
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
X-Authority-Analysis: v=2.4 cv=S8bZwJsP c=1 sm=1 tr=0 ts=686e80e8 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=Wb1JkmetP80A:10 a=yAdl2c52cjyukN4dM_wA:9
X-Proofpoint-GUID: wZjRTmE5ZYkSPmZH_LnuSFCeUZfjdD_L
X-Proofpoint-ORIG-GUID: wZjRTmE5ZYkSPmZH_LnuSFCeUZfjdD_L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDEzMyBTYWx0ZWRfX6VBw//UUweDd P9ThkHvidlod3Ai6SVCLBvngLIgbAfpNqRwUadiTQL44bz5094yVN/MDbqgSQCux0MJDrAfPxsp 8ak18Iwk/4rUAh32LVDliSDDTX932SsC5Dt6qhq0hM5NGpPG6cYSPCw2kzARb9cfMdGH5+DqC4v
 EYNBUmphl98KK3xN5PTm026UILV8c9em8VNPZmSE1BF98oFhRR2muoUwTTt1wdrbNvXGdvEJac7 tY1TceFLMmIaRnsU1EJyXLC/Zs210lyZoe91kYam+YF/OCJPMPn9q5Ld/bk9idgoxcIwVt03Ke5 RARs+hdK8+ZKvZlcNcbc+yLadfIjnovFtgwIHi1AGH9Wzwkl1cnJbv8Yl7bm4anptk9fpc7/6J4
 MUhyXpHkPTuY/TZUPl3AbkF5/MqrZMYQQ9EU3Vc3IqQ9Z8uqmBNu1vbx7CnTx0iiRpBFFPvP

This series adds TCP provider support, where the probes are
implemented via underlying fbt and sdt probes.

Due to the use of the sock/inet_sock_set_state tracepoint, intended
for ~5.15 kernels and later.  Tried replacing this with

fbt::tcp_set_state:entry

but this misses a few state transitions, so stuck with using
the tracepoint.

All tests under test/unittest/tcp pass unmodified on an upstream
(6.15) kernel and 5.15 UEK7U3 kernel.  The updated remote address
retrieval patch helps ensure tests can all be run.

It implements all documented TCP provider probes:

accept-established, accept-refused, connnect-request,
connect-established, connect-refused, receive, send,
state-change

Changes since v3:

- fix patch 2 to really use/describe 6 tstring slots (patch 2)

Changes since v2:

- document tslots change properly, add test (Eugene, patch 2, 3)
- move more generic type definitions to net.d
- retain depends_on provider tcp in tcp.d (Kris, patch 5)
- use depends_on library ip.d to ensure loading order (patch 5)
- revert tcp flags to uint8_t (Kris, patch 5)
- improve comments in tcp.d (Kris, Eugene, patch 5)
- fix up handling of ip:::send for older kernels to avoid null
  dereferences (Eugene, patch 5)
- fix up provider arguments to match spec (Eugene, patch 5)

Changes since RFC:

- fixed issues with test failures on UEK7 due to missing
  SYN_RCV state change
- moved get_member() to dt_cg.c (patch 1)

Alan Maguire (7):
  cg: move get_member() to dt_cg.c
  cg: bump number of TSLOTS to 6
  test/operators: extend ternary tests to cover inet_ntoa*()s
  providers: move network-generic definitions to net.d
  tcp: new provider
  dlibs: sync ip.d, net.d and tcp.d
  unittest/tcp: update test.x

 dlibs/aarch64/5.11/ip.d               |  27 +-
 dlibs/aarch64/5.11/net.d              |  31 +-
 dlibs/aarch64/5.11/tcp.d              |  67 +++--
 dlibs/aarch64/5.12/ip.d               |  27 +-
 dlibs/aarch64/5.12/net.d              |  31 +-
 dlibs/aarch64/5.12/tcp.d              |  67 +++--
 dlibs/aarch64/5.14/ip.d               |  27 +-
 dlibs/aarch64/5.14/net.d              |  31 +-
 dlibs/aarch64/5.14/tcp.d              |  67 +++--
 dlibs/aarch64/5.16/ip.d               |  27 +-
 dlibs/aarch64/5.16/net.d              |  31 +-
 dlibs/aarch64/5.16/tcp.d              |  67 +++--
 dlibs/aarch64/5.2/ip.d                |  27 +-
 dlibs/aarch64/5.2/net.d               |  31 +-
 dlibs/aarch64/5.2/tcp.d               |  67 +++--
 dlibs/aarch64/5.6/ip.d                |  27 +-
 dlibs/aarch64/5.6/net.d               |  31 +-
 dlibs/aarch64/5.6/tcp.d               |  67 +++--
 dlibs/aarch64/6.1/ip.d                |  27 +-
 dlibs/aarch64/6.1/net.d               |  31 +-
 dlibs/aarch64/6.1/tcp.d               |  67 +++--
 dlibs/aarch64/6.10/ip.d               |  27 +-
 dlibs/aarch64/6.10/net.d              |  31 +-
 dlibs/aarch64/6.10/tcp.d              |  67 +++--
 dlibs/x86_64/5.11/ip.d                |  27 +-
 dlibs/x86_64/5.11/net.d               |  31 +-
 dlibs/x86_64/5.11/tcp.d               |  67 +++--
 dlibs/x86_64/5.12/ip.d                |  27 +-
 dlibs/x86_64/5.12/net.d               |  31 +-
 dlibs/x86_64/5.12/tcp.d               |  67 +++--
 dlibs/x86_64/5.14/ip.d                |  27 +-
 dlibs/x86_64/5.14/net.d               |  31 +-
 dlibs/x86_64/5.14/tcp.d               |  67 +++--
 dlibs/x86_64/5.16/ip.d                |  27 +-
 dlibs/x86_64/5.16/net.d               |  31 +-
 dlibs/x86_64/5.16/tcp.d               |  67 +++--
 dlibs/x86_64/5.2/ip.d                 |  27 +-
 dlibs/x86_64/5.2/net.d                |  31 +-
 dlibs/x86_64/5.2/tcp.d                |  67 +++--
 dlibs/x86_64/5.6/ip.d                 |  27 +-
 dlibs/x86_64/5.6/net.d                |  31 +-
 dlibs/x86_64/5.6/tcp.d                |  67 +++--
 dlibs/x86_64/6.1/ip.d                 |  27 +-
 dlibs/x86_64/6.1/net.d                |  31 +-
 dlibs/x86_64/6.1/tcp.d                |  67 +++--
 dlibs/x86_64/6.10/ip.d                |  27 +-
 dlibs/x86_64/6.10/net.d               |  31 +-
 dlibs/x86_64/6.10/tcp.d               |  67 +++--
 libdtrace/Build                       |   2 +
 libdtrace/dt_cg.c                     |  39 +++
 libdtrace/dt_cg.h                     |   2 +
 libdtrace/dt_impl.h                   |   8 +-
 libdtrace/dt_prov_ip.c                |  45 +--
 libdtrace/dt_prov_tcp.c               | 413 ++++++++++++++++++++++++++
 libdtrace/dt_provider.c               |   1 +
 libdtrace/dt_provider.h               |   1 +
 libdtrace/ip.d                        |  27 +-
 libdtrace/net.d                       |  31 +-
 libdtrace/tcp.d                       |  67 +++--
 test/unittest/operators/tst.ternary.d |  20 +-
 test/unittest/operators/tst.ternary.r |   2 +
 test/unittest/tcp/test.x              |   8 +-
 62 files changed, 1679 insertions(+), 987 deletions(-)
 create mode 100644 libdtrace/dt_prov_tcp.c

-- 
2.39.3

