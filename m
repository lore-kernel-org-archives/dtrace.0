Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1537925B2E8
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 13:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563899; cv=none; b=WABZSRhTUGCQo1Nb4XAShNLfwVxKEhBl6ZdycJWC34CardVQimdaQQll4bynZrSQWEnWMjie/pCFloznaaxWQZClvMEGq9/ll4DZ3XW50aA0CGLZaiyfZ4DbRD2Hz45w7WIjPCW1UFCd5NPA+ilAEQp5xrVUejhER+glszi0W1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563899; c=relaxed/simple;
	bh=IHMIbcbTc+f9iK23uYAzntQ3JzWg6smZwWj+D73Su/s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h7UTYIB+W2hbWqUqYldMMS2WZUymU2Hzema1C3rsHOhdmpGtae9DpBc79+adezjGVZI51eY2P38tr1TcYu2MtpW+3cHOTgurCihTM6iXALd+L049ObvnEIf6Hc4eJUEGQ83xsQnUgBzhAgvs9lh8kxBPKH5MuS2AQYP6q3aw2ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=a58bQ8GM; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="a58bQ8GM"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ADCKS2031896
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 13:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=oKFCkOGBxAv7idTX+U+4XmUOKFdWt
	HudpzYbNT7HqRc=; b=a58bQ8GMipQEFLEeiwTRbZ1fpGawiVRtXocJmTSEHHuj0
	rPbVnPMgzukvFIlpV2svVHokPfLjNlRT3Vv1tFfyu2Vlqdk8EEJUcECjpCbD4CMY
	tFgBd+1tBj+aJaVfvhr3kfdLYFIgtgIIswzh3nFtS+MhYibmNQqjknsvJ3tZto4Q
	1+IQPgXSoAnF7U7rTdvDyM6h0SR6UJmMYv+V+u6IYR1EF9VXsT+tZOww+3EQhXO7
	fWQ8nWGcTYVGdCgmYjquX/W0e0UcPil18OPPbzDv5h+DUlXJAQGRLrpQcSxK2EUE
	xeuOqNyI7r7fe2v1P8DR+U741TOGS2zMf9s0uLLFA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4752xjup7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 13:58:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55ADEa83003303
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 13:58:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv8s9fv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 13:58:15 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55ADwElb009385
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 13:58:14 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-54-217.vpn.oracle.com [10.154.54.217])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 474bv8s9f6-1;
	Tue, 10 Jun 2025 13:58:14 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2 0/4] DTrace TCP provider
Date: Tue, 10 Jun 2025 14:58:09 +0100
Message-ID: <20250610135813.15746-1-alan.maguire@oracle.com>
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
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506100110
X-Authority-Analysis: v=2.4 cv=K4AiHzWI c=1 sm=1 tr=0 ts=684839f7 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6IFa9wvqVegA:10 a=ybYD-m52w_t6r0dH5vgA:9 cc=ntf awl=host:14714
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDExMCBTYWx0ZWRfX2BOirWNwlJk1 Yj3sN8HWhaszilU4GMmxSVenfWNZAGR0nIYkaXlxUY84M+GFcDhRHpgMgyHrvDrGFREJrTvN/GX yjov/DFhERqQvePkJ8yVMRXEJq9F1C1WfVcaIkOLypoXYwVsKbfJwh9DhW6pXTbFSfJPXJfpOf5
 acX5BYzIzbAu+RUGazskTbw4N4hKG/GMGjvAIzWigTO/0Kh3nuNNmg230d9dNrOwGJypxZF9aVB WRVteVkpSpZA8m+HB5o0sk9ZoXt4wm0fuDTEn7VZvJYjdxqNGjiBYy6EYpRQbBbOvWWlaLIiibE G+8pVzgW+DISK7ik8Mz5Oh/47hmsKQ2pqIWdjwrxLGV+89b3hjOR7ZNAOBu2V9P9tQhoJ5n+DtG
 Z+kaMnNO8N8U4jy48FGMsUVIcblKzUbWRE1KD1w0BtxGSAnG2x3OJBOedlbg0DylXlnFqfv8
X-Proofpoint-ORIG-GUID: RX-XXxAqGPUS7NJ23encPn0vBLKOfWSm
X-Proofpoint-GUID: RX-XXxAqGPUS7NJ23encPn0vBLKOfWSm

This series is a first draft of TCP provider support, where the
probes are implemented via underlying fbt and sdt probes.

Due to the use of the sock/inet_sock_set_state tracepoint, intended
for ~5.15 kernels and later.  Tried replacing this with

fbt::tcp_set_state:entry

but this misses a few state transitions, so stuck with using
the tracepoint.

All tests under test/unittest/tcp pass unmodified on an upstream
(6.15) kernel and 5.15 UEK7U3 kernel.

It implements all documented TCP provider probes:

accept-established, accept-refused, connnect-request,
connect-established, connect-refused, receive, send,
state-change

Changes since RFC:

- fixed issues with test failures on UEK7 due to missing
  SYN_RCV state change
- moved get_member() to dt_cg.c (patch 1)

Alan Maguire (4):
  dtrace: move get_member() to dt_cg.c
  dt_impl: bump number of TSLOTS to 8
  dtrace: add tcp provider
  dtrace: sync dlibs with tcp.d, ip.d and net.d changes

 dlibs/aarch64/5.14/ip.d  |   1 -
 dlibs/aarch64/5.14/net.d |   6 +-
 dlibs/aarch64/5.14/tcp.d |  52 ++---
 dlibs/aarch64/5.16/ip.d  |   1 -
 dlibs/aarch64/5.16/net.d |   6 +-
 dlibs/aarch64/5.16/tcp.d |  52 ++---
 dlibs/aarch64/6.1/ip.d   |   1 -
 dlibs/aarch64/6.1/net.d  |   6 +-
 dlibs/aarch64/6.1/tcp.d  |  52 ++---
 dlibs/aarch64/6.10/ip.d  |   1 -
 dlibs/aarch64/6.10/net.d |   6 +-
 dlibs/aarch64/6.10/tcp.d |  52 ++---
 dlibs/x86_64/5.14/ip.d   |   1 -
 dlibs/x86_64/5.14/net.d  |   6 +-
 dlibs/x86_64/5.14/tcp.d  |  52 ++---
 dlibs/x86_64/5.16/ip.d   |   1 -
 dlibs/x86_64/5.16/net.d  |   6 +-
 dlibs/x86_64/5.16/tcp.d  |  52 ++---
 dlibs/x86_64/6.1/ip.d    |   1 -
 dlibs/x86_64/6.1/net.d   |   6 +-
 dlibs/x86_64/6.1/tcp.d   |  52 ++---
 dlibs/x86_64/6.10/ip.d   |   1 -
 dlibs/x86_64/6.10/net.d  |   6 +-
 dlibs/x86_64/6.10/tcp.d  |  52 ++---
 libdtrace/Build          |   2 +
 libdtrace/dt_cg.c        |  39 ++++
 libdtrace/dt_cg.h        |   2 +
 libdtrace/dt_impl.h      |   2 +-
 libdtrace/dt_prov_ip.c   |  45 +----
 libdtrace/dt_prov_tcp.c  | 405 +++++++++++++++++++++++++++++++++++++++
 libdtrace/dt_provider.c  |   1 +
 libdtrace/dt_provider.h  |   1 +
 libdtrace/ip.d           |   1 -
 libdtrace/net.d          |   6 +-
 libdtrace/tcp.d          |  52 ++---
 35 files changed, 761 insertions(+), 267 deletions(-)
 create mode 100644 libdtrace/dt_prov_tcp.c

-- 
2.39.3

