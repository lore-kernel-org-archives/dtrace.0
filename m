Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269E12D3EFB
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753178875; cv=none; b=C67IENR+9Ti9KSaHvU1w0N2i0/pHmcPjvOS6pz1ZDvXmSWdzilnZHH8ReWTlc5kzwUyn37jyTPvODy18f6DDtbPyqOid7/3xCI5LwxJMAwMzKsVzzTgro3iZ6hoTnERdhp4R9laX85STc/yZ89c0FkMnHqWuSwl58/6zxLnjNvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753178875; c=relaxed/simple;
	bh=ZHHOHLTzIYxRVKMzYiQ0Iu+/DPqpaOFYLxZxEn6NrQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qyVuazBwkOgjDovEgvQxrrFtwTj/VkH83a1wnBtu/2PCNnfEItUiiDfwRyQAgxMqYlzSISZaQhVWnspQ9weLq3jHKHFGeYzfY/Gl2VKnBbAYc+4PFcwSFjpjiavEV3YIDd50v3ZKIcbmOtN/hqHH9btGzbikmsZPib5uA4st5XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BY/fR9cQ; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BY/fR9cQ"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M5TCmO021337
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=LCB6w3Ytk3VI78VDUWr5EYkpcRZKC
	PCFL9F6EdhUrv0=; b=BY/fR9cQqGSCI7JljWFdImLEtdyKlsd/4W3yU0QOphefM
	FIKSndyYgDMMm8g4RR/Md5zoZaUfjEcEjf5XfefI1yYiu+cZwZfZj0zQtVWhb49P
	eMgse9Dt9aI5OcoqMlFCBihPJmg8HXHS9H1EgvzVvj+MoJFUpuhTZaKpR4ey75Ou
	Sq8/0niFKLx9ZFc3BFHwgfeqHIDGrTPom9Dk4jIvQAEcBDM3dimKlPKjQ7IAV57M
	fF22TiRMBYZB/sYcFfV0YLc5YA8QIcHYNX77y+a8C1tu8gKjyCMhn3PeOs/xUmNx
	3+WwbWAF0nhLfsJJLE9iRn2A+5ha/r20btK9ktb7Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805e9mywt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:07:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56M8rWkq011305
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:07:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801t940g0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:07:51 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56MA7o66011213
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:07:51 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-50-138.vpn.oracle.com [10.154.50.138])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4801t940f1-1;
	Tue, 22 Jul 2025 10:07:50 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v5 0/6] DTrace TCP provider
Date: Tue, 22 Jul 2025 11:07:43 +0100
Message-ID: <20250722100749.233821-1-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
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
X-Authority-Analysis: v=2.4 cv=eqbfzppX c=1 sm=1 tr=0 ts=687f62f8 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=Wb1JkmetP80A:10 a=hbgyJdv1LYcNoG2A1HYA:9
X-Proofpoint-GUID: GakO7aq6NFbaQ_KiVO4RJuSXcV3de8XP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA4NCBTYWx0ZWRfXzkWdk5ZvfCk3
 EyN3EB13bl3sw44Z7rK3qO9ZvRvxExl5lr4U58DENyMVhU/l6752jWoIUhp7aL0IkS3jvxavL+5
 i9vJeW4JbIoqzT2nxBes4WvwmXtKb09J3yHD8S/Br9kskxryEIlmMv6IFEN3D7kddFOlKT0+WwQ
 paV6ubTetTSz2ApL52LoIQvVinWEUZMeqypn21KV9gLYNMtNzkiD+qJaT0QTwlyIwLhR3tA6oLt
 aZRg1DLZsB2ngeq+vlhJdomO5evm//weuG4FcBezbxe/yrGWTXCSyTBfzdO04jG+OV5haCUuiC5
 uKROKnwXmsy9ZPSFaE6zWtaw7aDoKq+ovkwdjsYWziQ+EhNY6zchzDdub3Aj9ju6flTSISE3vZ0
 6RM+k8tBivoETVuRivMsVrTdKlG6TpnITN0ppcrYA9H1IOhuzqr5c3QUTfJFMF8OTU7X+hyq
X-Proofpoint-ORIG-GUID: GakO7aq6NFbaQ_KiVO4RJuSXcV3de8XP

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

Note that to function correctly this series depends on the
cg-related patches:

parser: add dt_node_is_tstring()
cg: validate tstring alloc/free
cg: optimize ternary expressions for strings
tstring: fix leaks

Changes since v4:

- updated patch 1 to rename dt_cg_get_member() to
  dt_cg_tramp_get_member() and have it make use of
  dt_cg_ctf_offsetof() (Kris, patch 1)
- remove tslot update patch since it is handled elsewhere
  (Kris)
- added R-Bs from Kris

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

Alan Maguire (6):
  cg: refactor get_member() to use dt_cg_ctf_offsetof
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
 libdtrace/dt_cg.c                     |  57 +++-
 libdtrace/dt_cg.h                     |   4 +-
 libdtrace/dt_prov_io.c                |  84 +++---
 libdtrace/dt_prov_ip.c                |  45 +--
 libdtrace/dt_prov_proc.c              |   4 +-
 libdtrace/dt_prov_sched.c             |   2 +-
 libdtrace/dt_prov_tcp.c               | 413 ++++++++++++++++++++++++++
 libdtrace/dt_prov_uprobe.c            |   4 +-
 libdtrace/dt_provider.c               |   1 +
 libdtrace/dt_provider.h               |   1 +
 libdtrace/ip.d                        |  27 +-
 libdtrace/net.d                       |  31 +-
 libdtrace/tcp.d                       |  67 +++--
 test/unittest/operators/tst.ternary.d |  20 +-
 test/unittest/operators/tst.ternary.r |   2 +
 test/unittest/tcp/test.x              |   8 +-
 65 files changed, 1731 insertions(+), 1041 deletions(-)
 create mode 100644 libdtrace/dt_prov_tcp.c

-- 
2.43.5

