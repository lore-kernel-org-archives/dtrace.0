Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F4D33B6F4
	for <dtrace@lists.linux.dev>; Mon,  5 Jan 2026 12:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616055; cv=none; b=m8yDN6mrCVQPShlKjSKUFj8uvd4FnI0Kb9nxjgg/W8iySJk4eHG7ftcUogDxpv1Wx5PJQ/nLqO1ipvXK4OstneeDl/8bFV1AzgnOldm3zAW20amFK+E6IFJYd33WEDsZWEt0NkzYknphUy3Q3VC0+XZvE8h8ImZ4fQT7kvCCC3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616055; c=relaxed/simple;
	bh=XtDoqkUDHKzC2e/D8XpeJR4Jpngtcjkci7OP/D2a15Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IS9KYpX5TiAzwefbq09nN2QxoIdNSPIhtomsIVYuiftP2GitWo5nYET+YW2U1nXj95lmfZts+PI5pBTzebBoFpHDWYPmyrxqf/cHxj2H2gntcik21TCfzs+sWnb3YNfp8iKEvyj0b6MupccE3EaAz7OmRhha8jRgWLSOKNh71bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ag0bWniR; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ag0bWniR"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 604Ng77V160295
	for <dtrace@lists.linux.dev>; Mon, 5 Jan 2026 12:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=vjn8gwW3xHKa7NBv4AtUNRTpxXb1b
	fE8hDccTA+LMJQ=; b=Ag0bWniR9S8y25kY7qb/TUS/b3JU3c2qXWqm4PRpXLlvs
	SWnnz86Eoz1zvJvUxf31cx4aJxWP+I4ZVuGNmrMfmj8QWTh5A5SLwV4Lc1dnzxto
	pv2OtUnxrO9MgkoUA6dUcBRj0JefIhqdfGIWIIi1/TgzvqZ/c1LBJpRig4yorgDu
	hhXtLfZ4gRQTW+5ZsNpNKWqlE6reBG5p4j4acptfe/VNfH4lL662XfdgVqnKNEx8
	EwbwaHvneQ5UGsZtOQ3WBsmrK+GVnP3F04OKAlE8Oyy5kUtGsyaMXGJe2bhLnfBL
	bV4ESU328VAy0Fp3w6kLMwPCD5ZNvaFYwpsuzCsZg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bev5qhm7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 05 Jan 2026 12:27:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 605CCVg1015471
	for <dtrace@lists.linux.dev>; Mon, 5 Jan 2026 12:27:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4besj72qan-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 05 Jan 2026 12:27:30 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 605CRTWX034842
	for <dtrace@lists.linux.dev>; Mon, 5 Jan 2026 12:27:29 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-54-206.vpn.oracle.com [10.154.54.206])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4besj72qa8-1;
	Mon, 05 Jan 2026 12:27:29 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2 0/6] stapsdt provider: simple system-wide probing
Date: Mon,  5 Jan 2026 12:27:22 +0000
Message-ID: <20260105122728.436769-1-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxlogscore=374 phishscore=0 malwarescore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601050109
X-Proofpoint-GUID: sgKx9JD_9fL25a6cRwEhcv5bw4eFXR8t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEwOSBTYWx0ZWRfXz2Z8I8uIiDmn
 +TTMh2SQOZiF5T/M2FULMDwHH/H6IBHqknVz1Tbz0l4IOcZjAHioR/15wNJi1DCJobMzHPC6oJw
 TPmTWdrFLkqbUgT/ruLjwgtZQPAC70VAOW3RSKfGGC4LnI3wa/EQzdiZPQmqLvKzNzCQz5Zikpd
 PzWF/zi0mtvDI6rc5BRauWPNK7EgwoqtHEwW21BkMhuWmTiBOkmexf7IYz9XDEyrehhzAB4Fp3O
 54A/qHR4Aq+dCZGpmbirB8F833pkY6djtJSsDyeZ8+crDFcj4J8hJMjP2V4RTMopUURG3mamAY3
 kQuml4sLCjvoVuud4dAIr/h9Ka9Tt0/8lv9iOYc3lc6LJuMgbAAkqqE1X+O8bZTZUwkpCIb8E2C
 M3eNlO25fpWsqPNG80PVoZfPakGUBmk158UP5b+rl4BlAmYFJa/vXspPlT4ZVBRx9IN0/aDz3TN
 noAyvsOY1lYxiTxyBzw==
X-Proofpoint-ORIG-GUID: sgKx9JD_9fL25a6cRwEhcv5bw4eFXR8t
X-Authority-Analysis: v=2.4 cv=cePfb3DM c=1 sm=1 tr=0 ts=695bae32 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=6PAqfKcE7sRvyB4F-EEA:9

This series adds wildcard support to stapsdt probes to allow
tracing system-wide; this has caveats due to the way the kernel
implements probe addition.  In essence, probes are added on a
per-inode basis (actually in the VMA associated with the inode)
so it is necessary to identify the file where probes are found.
Probes will fire for existing and new processes (the RFC incorrectly
said they will not work for existing binaries; they in fact do).

Patch 1 describes the approach; to facilitate systemwide tracing
we need to tell DTrace the name of the binary/library via the
module field in the probe specifier; we then use [LD_LIBRARY_]PATH
to resolve the full path.  ELF reading of the file and insertion
of probes then proceeds in a similar manner to per-pid tracing.
Full path specification in module name is not supported since
DTrace does not allow a '/' in a module name.

Patches 2-5 test various aspects of systemwide probes; basic
binary support, library support, listing support and is-enabled
probes support.

Patch 6 updates docs to describe wildcard support.

Changes since RFC:

- update documentation/commit messages to reflect that we also
  catch existing programs/libraries when probes are enabled
- fixup provider name for wildcard probes to be 'provider*'
  rather than using the confusing 'provider-1' since the
  latter is the concatenation of probename and pid (-1 is
  used to connote all pids)
- add test for is-enabled systemwide probes

Alan Maguire (6):
  stapsdt provider: support systemwide probing
  test: add systemwide stapsdt note test
  test: add systemwide stapsdt note test for library
  stapsdt: add test for listing systemwide probes in object
  stapsdt: add systemwide test for is-enabled probes
  documentation: update stapsdt docs to describe wildcard support

 .../reference/dtrace_providers_stapsdt.md     |  45 ++++-
 libdtrace/dt_pid.c                            | 158 ++++++++++++----
 libdtrace/dt_prov_uprobe.c                    |  17 +-
 .../tst.stapsdt-notes-systemwide-isenabled.r  |  13 ++
 .../tst.stapsdt-notes-systemwide-isenabled.sh | 177 ++++++++++++++++++
 .../usdt/tst.stapsdt-notes-systemwide-l.sh    |  48 +++++
 .../usdt/tst.stapsdt-notes-systemwide-lib.r   |  14 ++
 .../usdt/tst.stapsdt-notes-systemwide-lib.sh  | 142 ++++++++++++++
 .../usdt/tst.stapsdt-notes-systemwide-lv.sh   |  48 +++++
 .../usdt/tst.stapsdt-notes-systemwide.r       |   2 +
 .../usdt/tst.stapsdt-notes-systemwide.sh      |  51 +++++
 11 files changed, 672 insertions(+), 43 deletions(-)
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide-isenabled.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-isenabled.sh
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-l.sh
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide-lib.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-lib.sh
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-lv.sh
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide.sh

-- 
2.43.5

