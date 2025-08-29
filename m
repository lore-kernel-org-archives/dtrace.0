Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1512877C1
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 08:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756455857; cv=none; b=rT4Qfwhb5//uj1r/qm4PJPhBA1onV5sCHhLsFxg7ZacZpHIZtCKodGq/c3VeFgMNYGxli6jeCa/i0Cppz9FJRYwOVpJg7QBx6Q/7uMbnqxXjSX3OxXXuVe8fCRXQql1hG3OLafqSUyYe0Q5vX49EYojiA+GWpB6rdqBAW6CBhNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756455857; c=relaxed/simple;
	bh=OKYd2d4JxEyA2m+B16OlPJkIOskntrz6a6Nxn6+ipvU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M4HzMpptfUJshoFuPgfNQI/icuYiw0EsMLPdRCE3v000pmFwodj5qAdUXcwDRhp3gP0TjrTz4WSG0O4lHcIzbsolMCM8xTwHnG/I3G0bAFM+95Nc/x+NiXrwxEAKfkQccpTayWLddf0x6eXv9+1VMRSFko5dib8GupSkqovBgPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hRjDQXaQ; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hRjDQXaQ"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T849CN020494
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 08:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=AogpFc7+pG4OkZwifFwABxAXoHp/M
	B9ezlwqr6Y5hXc=; b=hRjDQXaQV+K19RtupQfYysg2POter2J7hEDuT9PDLRY08
	8JL0TeeYW547xsbTdxNy6NDrtN8O/02EgBfE2+rH8kJ2CSLfIuMqI0lS62upC87e
	VJa7vIzxddHAjxeUdCQlfbtxtaEWpHOOvFiUB6Kc1d4lA6pEW2PefFOs+S2lsWcf
	D163lSgDK597I9SxFakrDAUUFVRDGetXYWGZnyVKkIShoxGVaKK0tf0y2vnBTSuo
	D89HBgztrCw4KKEtnr8oD2rRFpmnN8KEHK6DmWqcfM94NpUEAilkjDf2GGjMJwdO
	hdx83m46BsjIJtz0Hamy7z+i5sJBczoiQVgzJHfuQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q67921vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 08:24:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57T8M7pR018957
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 08:24:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48q43cyh8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 08:24:14 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57T8OEWr038773
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 08:24:14 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-58-49.vpn.oracle.com [10.154.58.49])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 48q43cyh7v-1;
	Fri, 29 Aug 2025 08:24:13 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2 0/2] udp: new provider
Date: Fri, 29 Aug 2025 09:24:10 +0100
Message-ID: <20250829082412.25687-1-alan.maguire@oracle.com>
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
 definitions=2025-08-29_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=783 suspectscore=0
 mlxscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508290070
X-Proofpoint-GUID: hjePoGiNVuD1SeMVqs2_UsJB8PNjxfmw
X-Proofpoint-ORIG-GUID: hjePoGiNVuD1SeMVqs2_UsJB8PNjxfmw
X-Authority-Analysis: v=2.4 cv=NrLRc9dJ c=1 sm=1 tr=0 ts=68b163af cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=2OwXVqhp2XgA:10 a=P8Y4fAoRJ8Cak_J7rJwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNSBTYWx0ZWRfX/JIgt39zX6fS
 9l44brvFj97AEPLxfUC9zXzXK4ds8Vk4LhtMk1/9E75uURN1tM51Rc8f1oY1S0yPl/DZNV4jxdy
 ZFA0Ce5pCiXk465/pu4tETQfJsRfjl8n5h+2UN15kEo54rjUCICVvXExaR888/QwTyy+LTmB4gE
 16u8Sumgw08XJ+QKuGzhd+uxlAsBExXTFlsHxwuvVTPuYQC+v2qP45rVBVyRw5UkWOzCY7QxPq9
 FeiCY6sCTLjy9AvJWWAqgOTq+k+QcvE6tpoBlDuzur1tqQgxXGdQhPuPpcn1MectI7qerpkNLR5
 XnGh+/3d5tPIGX9uB0XkS6sMxpbHn4NN6oauZhXmTK0EEuIPzoGD7ZnQlpWTqkxJxqpB0ao/Cl0
 KThkMNe/

This series adds UDP provider support, where the probes are
implemented via underlying raw fbt probes.

Probes are

udp:::send
udp:::receive

Arguemnts args[0-4] are

pktinfo_t *, csinfo_t *, ipinfo_t *, udpsinfo_t *, udpinfo_t *

Patch 1 implements the provider.

Patch 2 fixes up the remote IPv4 UDP test.

To work on UEK6, the following not-yet-landed patches are required

cg: fix offset for > 8 bit bitfields in dt_cg_ctf_offsetof()
Convert ip6_finish_output to rawfbt

Changes since v1:

- squashed dlibs, test.x and provider test changes into patch 1
  (Eugene)
- switched to rawfbt due to issues seen on UEK6 and risks with static
  functions (Eugene)

Alan Maguire (2):
  udp: new provider
  test/unittest/udp: enable IPv4 remote udp test

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

