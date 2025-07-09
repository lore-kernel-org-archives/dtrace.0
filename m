Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CDF2E3AF9
	for <dtrace@lists.linux.dev>; Wed,  9 Jul 2025 14:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752070193; cv=none; b=asgFmobhpzWvv0i8jhoi9zluyeh3y+vLjDBK54k3Un2h7/bTT9AOCXq9MjVI7VJ7aTud7Un/+OhSiQDDxl9FHqAMlIAqJpHOuqU2r4kiNNwuU0CzdRfrufSi5CYHXw/pUx5kkyagct4dk/PNbdnXlazbjM6amNp38QmTl2Ar8+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752070193; c=relaxed/simple;
	bh=2VBSsuyriyP4B6D7tDwUc00a+dM6xcC9YRjp5VO0V+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mJbuBaq1qLTOZgLtYV+Ze8cYFisn9Hu1OREzjUWJB+UpcZCWIikNx/L3PV4e3ayDyKviEs/1K/x1sJdd20hrOXSSZ/DJQLTsDSsqjIK3o2jS+uvfOMcetXkB1RgquOMeIX0e8u9+LmSYKE3DWrWojJsodNNHfnft5WtibWXqEn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=R21zbuyi; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="R21zbuyi"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569DZDrK023175
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=k1AjC8HZoR+1yhP4nooRP7NKfAgnb
	35OkKteBab1t+c=; b=R21zbuyi0jZpryI71BY6Msge/jcYhBOffcz4YkAPp53D1
	vVZgHhUZdkJ0mrkq1MTVUgTMYTFKRxV/hqgIC+4vph4kguOTnFXmDg8IJsFDj19g
	cd3tGmM0FM2GFE9js8CsXo679j1uFgZkFhIlhVthV+JJpAcyP6cU7x17148EXl/z
	PrN/1Erss/Etb8qlHphV/lDNF5Wq0Zy/V7AQdRprHUWXC8dXigq8LA04SgYLftzk
	k1yUv+/GUOizt7mS3Vv9BJSd0/fivRsMzobCVPpeRsSZAoLfjeORCNjB+i8HIp3Z
	plTFqgN0GiQHPpa/R5LwLBTLHpR2lCKYaOWPfAysg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47srt685v8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 14:09:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 569CbNtu021384
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:09:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ptgb0pmd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 14:09:50 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 569E9o1T028485
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 14:09:50 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-63-52.vpn.oracle.com [10.154.63.52])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47ptgb0pk2-1;
	Wed, 09 Jul 2025 14:09:49 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v3 0/7] DTrace TCP provider
Date: Wed,  9 Jul 2025 15:09:41 +0100
Message-ID: <20250709140948.15090-1-alan.maguire@oracle.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507090128
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDEyNyBTYWx0ZWRfXxUIKtyrhSfxp MmGbDHWkniz8WASECdIUf0PK3oHbhOFAFH0JXK9tra9Iq3xwrlaEU2whuowVUHxvMmWJLXBmvRs fZEHcERR0Q5FgVoQXxoXcsZKUNybmyuTTLZ9Dn5H3vRauQJlLo5j8TPdIaxubiKHTuHTSKKrvmS
 KxjyUDPDAddtdhA9KGH/AZGyHnoGqcUX8m9H7gTSFYUdro87r4b2G39oiGPXxAt5b4jF4l7Yxdz JzX3Jb4ulM3Fy6CzT0KIjFFiR8eibDD30MhdAgFYGC3A9wswgo2Qa8Qc0TenGMu7P+h+SGjkVQN SoEiNpK8dUditOB1AOYoDC6g2z1L0y8eg3dgnpQLzDbFhzt54qUzhO7mhFWu+lzPnXNppFlDj8P
 IYJBkonJcg3nO1XmkM10fBhsGnPuv227+F0tKB1aSvhhdfdE3Y+NGKtIQRaXhCKynmwQlMfV
X-Proofpoint-ORIG-GUID: NEYzVK4KUkYFtpzghfk0z9MBHqFv7N9Y
X-Authority-Analysis: v=2.4 cv=WIV/XmsR c=1 sm=1 tr=0 ts=686e782f cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=Wb1JkmetP80A:10 a=yAdl2c52cjyukN4dM_wA:9
X-Proofpoint-GUID: NEYzVK4KUkYFtpzghfk0z9MBHqFv7N9Y

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
 libdtrace/dt_impl.h                   |   9 +-
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
 62 files changed, 1680 insertions(+), 987 deletions(-)
 create mode 100644 libdtrace/dt_prov_tcp.c

-- 
2.39.3

