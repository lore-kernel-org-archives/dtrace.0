Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750B4167DAC
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738162528; cv=none; b=lVPz5thtU9kolTny5ur9ctmtzFqDSTPEeaIQ2qcSTecPzTf1lDqu1UdnWHud1sffYfg08C9QHArFSj7rMhDe5PqLKMXfKPmiDyYdwB2BblYhYohNHuRke3SmxVb2g+7M7fhZXZqeEzm4w98nboLzJJAnIfMsNUX5n7gJmmwnJZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738162528; c=relaxed/simple;
	bh=wXg91XQGu0Jta79uKJg9gjhLWhpAxiF0SsnRobkiP6o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oaqi/FOV+PL589do4GmYYEMptPseFGYpM1lxVQI9n4H9DWewZcenH1ITjF7Nx6YKrBDx1yl3vgYpTmvIxFwivCu/Hx0oHVxC1Fjj/5nwafyM0ZRuyfEyfjViFg1lcjNjyGRm5m61mbufnME/nJgprC0upClcCcRQdDLbq44bIBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nmE6Ruwx; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nmE6Ruwx"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TEXudd030033
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2023-11-20; bh=mlElWKRIr93R96c6R7G5Cdrwhuao2
	6dEDVeMjE3dwAQ=; b=nmE6RuwxE0DS8z1HPwTzwbBfj3LHiE1ySCj1Etf4nF6ot
	4MZMyG59IV7Hz+0mHanqRcD7GMwBNBitsexmzlivkgGbxZ01dySXogrPHj96lMi1
	dNOINZWdek2AnGPjqXC70bfLHYy5Q8/JwVJwjih2E2+R5GK4ntm9qIkyK10mEDQC
	fkYFrIIwzt4haWI52mnB0fEmqDg3tX3IPCKHbXue/nL76TaoyUx4t+tkQVUZgdoE
	5xMM4KzjdP9nc1zHyHFa0aZwKdBhj9ImdOhQqFo1NlNcD+AxO4V5hg1kjaQppa8x
	E2yoe8CY+nSnz8JpjrHJF0bd061MvnOaVYx19T9Ng==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44fn2ug6vx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:55:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50TD9Nif022586
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:55:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpd9upu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:55:24 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50TEtOV1016122
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:55:24 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-177-216.vpn.oracle.com [10.175.177.216])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 44cpd9uptg-1;
	Wed, 29 Jan 2025 14:55:23 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2 0/4] ELF note-based USDT support
Date: Wed, 29 Jan 2025 14:55:18 +0000
Message-ID: <20250129145522.512341-1-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_02,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 mlxlogscore=954 bulkscore=0 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501290120
X-Proofpoint-ORIG-GUID: XnVxY5LiwDF0dAGN5fga7w5a1L9_iqCE
X-Proofpoint-GUID: XnVxY5LiwDF0dAGN5fga7w5a1L9_iqCE

This series adds support (patch 1) for ELF-note defined USDT
probes in binaries and libraries; patches 2-4 add tests.

Basic pid-specific USDT support is added; i.e. it is necessary
to specify the target pid in the provider name such as
"example1234" ; future work could add pid wildcarding.

ELF note defined probes are defined by including sys/sdt.h
from the systemtap-sdt-devel package, and are defined in
C programs via

DTRACE_PROBEn(provider, probe, [args...])

See the tests for concrete examples.

For python, go, etc, USDT probes can be added via libstapsdt [1]
and associated language-specific bindings.  This allows users
of those languages to add USDT probes too.  For example, the
following example program adds a "pythonapp" probe "firstProbe"
using the python-specific libstapsdt binding:

#!/usr/bin/python3
from time import sleep
import stapsdt
provider = stapsdt.Provider("pythonapp")
probe = provider.add_probe(
"firstProbe", stapsdt.ArgTypes.uint64, stapsdt.ArgTypes.int32)
provider.load()
while True:
    print("Firing probe...")
    if probe.fire("My little probe", 42):
        print("Probe fired!")
    sleep(1)

We can then trace this via dtrace:

# dtrace -n 'pythonapp503211:::* { printf("args %s, %d\n", copyinstr(arg0), arg1); }'

dtrace: description 'pythonapp503211:::* ' matched 1 probe
CPU     ID                    FUNCTION:NAME
  6 286628                      :firstProbe args My little probe, 42

[1] https://github.com/linux-usdt/libstapsdt

Alan Maguire (4):
  USDT: support ELF-note-defined probes
  selftests/usdt: add test for USDT note-defined probe firing, args
  selftests/usdt: add test for USDT notes in shared library
  selftests/usdt: add test covering different forms of USDT note args

 include/dtrace/pid.h                      |  29 ++
 libdtrace/dt_cg.c                         |  47 ++
 libdtrace/dt_cg.h                         |   1 +
 libdtrace/dt_pid.c                        | 466 ++++++++++++++++++++
 libdtrace/dt_prov_uprobe.c                |  19 +-
 test/unittest/usdt/sdt_notes.h            | 504 ++++++++++++++++++++++
 test/unittest/usdt/tst.usdt-notes-args.r  |   2 +
 test/unittest/usdt/tst.usdt-notes-args.sh |  51 +++
 test/unittest/usdt/tst.usdt-notes-lib.r   |  14 +
 test/unittest/usdt/tst.usdt-notes-lib.sh  | 145 +++++++
 test/unittest/usdt/tst.usdt-notes.r       |  14 +
 test/unittest/usdt/tst.usdt-notes.sh      | 121 ++++++
 12 files changed, 1406 insertions(+), 7 deletions(-)
 create mode 100644 test/unittest/usdt/sdt_notes.h
 create mode 100644 test/unittest/usdt/tst.usdt-notes-args.r
 create mode 100755 test/unittest/usdt/tst.usdt-notes-args.sh
 create mode 100644 test/unittest/usdt/tst.usdt-notes-lib.r
 create mode 100755 test/unittest/usdt/tst.usdt-notes-lib.sh
 create mode 100644 test/unittest/usdt/tst.usdt-notes.r
 create mode 100755 test/unittest/usdt/tst.usdt-notes.sh

-- 
2.43.5

