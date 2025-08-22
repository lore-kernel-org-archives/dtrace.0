Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A65628B4FD
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755886603; cv=none; b=HNw4cEfy16H4YPobPF2jpYz1CxNbFlGVxokNaobaI600oKq7rXhezLdIYhpnsf6sq7u0m2OluPq1B4Jg4QD1LvD4FwZLD0Us7TliVnIDHcGrdrBq1roT7vqV72o44/koLFq/4S2C+Xfd3aN1EGZji+8w9MtbzDPnjZW0YR0ci44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755886603; c=relaxed/simple;
	bh=1hKqEMfpDiESTdVBcupCydg303lL2gH+noDMpBMLGyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qQqaFqta9IMght9E8jsy70UMOl2FFrEe1pNP0CTaSeilWPSECGYK7QH6TCrIjAVb/J8mGw60TbH0x7VFkjfTsL5JCi+2Ott6rutGmvF1L5psrFpuM7UWf/RDcPMqh0fbw6LezA3lT5D+bTVzLdkInTIlm4i71hloURl3UH+knxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fNROJjeD; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fNROJjeD"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHWmLw027888
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=doCnA0+6CJ6dd8uL4IVYFk7IEbNer
	+DOmpqwJrEzycE=; b=fNROJjeDhaAj0JBW9uStJysuZqpyUt5e7IPn5sRwC4Frz
	ZbXCVXCs060ytqXdiPED0J3eYEhQxXRM3XGD5dfySqetfct/qe9qqjrrRZFiHFvb
	vaPozzkRnGpW/nMnc7Ic2f18CiCCoLaWNXp3fmfSk6zTOxJU8KIeDtzKmFfhsT9K
	6EbwKigjWJYOTdBaWdQCJXMAy9FomU7dNU+SQB02J0/I+VlontFUtGW/dyFfZgW6
	6TV4a8SyCLRN0BYNxscCXBnF4szpzlo4glmUVusvbsPl3MuqpUSdzY+di3uUoE57
	BkJ6a00/xZvBq3rdk6uFht/TAd5thnqpgD4OjG9Yw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48pw19g2cp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57MGPpAD020572
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48nj6hndgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:30 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57MIGU49009458
	for <dtrace@lists.linux.dev>; Fri, 22 Aug 2025 18:16:30 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-56-42.vpn.oracle.com [10.154.56.42])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 48nj6hndg2-1;
	Fri, 22 Aug 2025 18:16:30 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH 0/5] udp provider
Date: Fri, 22 Aug 2025 19:16:24 +0100
Message-ID: <20250822181629.30972-1-alan.maguire@oracle.com>
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
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=564
 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508220167
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDE2MCBTYWx0ZWRfX3kKwHTZ2LrSN
 1F8WqqdAbbVWFlPJxfsHw7DbZtWUaAfrpip94qy9odhnPedJKlQsVhIUoVlK7cR8elyQrXuMGQl
 RKkPYUULEk7RsFVIY5oRsrHxuWFIDlziYa6W42ZWTzP/3MpV5nGHgEwxVYSca7SWM22CjInrABL
 SNLf+VjXdxFXQWWVNe/ePE1p6PQk1uXVhydSlXIFn8D2jPDgkLbxRd38b2M60X4QQGfNpxqtAiQ
 Yc9hlSb3QojEerfV060pzjFjoa6N6A3AwKlhIR9x63r3gaIVTcnGN7MK8N0sQGP2oPyG+4K68O6
 ihpvbM8I2wrJMGfAjojhF4oEbOZF+UXwxy6DDkvyQjeXbpT3chxUADB1xkAhFtG+NCcjTzN3QTA
 hMI9Fpec432o4+wBQz2yqUOWYcMB2A==
X-Proofpoint-GUID: A84D0PuORTFe8UGv83DzqhbN2bdY-re7
X-Proofpoint-ORIG-GUID: A84D0PuORTFe8UGv83DzqhbN2bdY-re7
X-Authority-Analysis: v=2.4 cv=EvbSrTcA c=1 sm=1 tr=0 ts=68a8b403 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=2OwXVqhp2XgA:10 a=P8Y4fAoRJ8Cak_J7rJwA:9 cc=ntf awl=host:12069

This series adds UDP provider support, where the probes are
implemented via underlying fbt probes.

Probes are

udp:::send
udp:::receive

Arguemnts args[0-4] are

pktinfo_t *, csinfo_t *, ipinfo_t *, udpsinfo_t *, udpinfo_t *

Patch 1 implements the provider.

Patch 2 syncs the new udp.d with dlibs.

Patches 3/4/5 update tests.

Alan Maguire (5):
  udp: new provider
  dlibs: sync dlibs with libdtrace/udp.d
  unittest/udp: update test.x now that udp provider is present
  test/unittest/udp: enable IPv4 remote udp test
  test: Add udp to expecetd providers

 dlibs/aarch64/5.11/udp.d                    |  11 +-
 dlibs/aarch64/5.12/udp.d                    |  11 +-
 dlibs/aarch64/5.14/udp.d                    |  11 +-
 dlibs/aarch64/5.16/udp.d                    |  11 +-
 dlibs/aarch64/5.2/udp.d                     |  11 +-
 dlibs/aarch64/5.6/udp.d                     |  11 +-
 dlibs/aarch64/6.1/udp.d                     |  11 +-
 dlibs/aarch64/6.10/udp.d                    |  11 +-
 dlibs/x86_64/5.11/udp.d                     |  11 +-
 dlibs/x86_64/5.12/udp.d                     |  11 +-
 dlibs/x86_64/5.14/udp.d                     |  11 +-
 dlibs/x86_64/5.16/udp.d                     |  11 +-
 dlibs/x86_64/5.2/udp.d                      |  11 +-
 dlibs/x86_64/5.6/udp.d                      |  11 +-
 dlibs/x86_64/6.1/udp.d                      |  11 +-
 dlibs/x86_64/6.10/udp.d                     |  11 +-
 libdtrace/Build                             |   2 +
 libdtrace/dt_prov_udp.c                     | 170 ++++++++++++++++++++
 libdtrace/dt_provider.c                     |   1 +
 libdtrace/dt_provider.h                     |   1 +
 libdtrace/udp.d                             |  11 +-
 test/unittest/dtrace-util/tst.ListProbes.r  |   1 +
 test/unittest/dtrace-util/tst.ListProbes.sh |   1 +
 test/unittest/udp/test.x                    |   6 +-
 test/unittest/udp/tst.ipv4remoteudp.sh      |  11 +-
 25 files changed, 284 insertions(+), 96 deletions(-)
 create mode 100644 libdtrace/dt_prov_udp.c

-- 
2.43.5

