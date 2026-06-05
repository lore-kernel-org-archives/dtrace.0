Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B0D38C41B
	for <dtrace@lists.linux.dev>; Fri,  5 Jun 2026 22:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697544; cv=none; b=qPAyDgfyzebYDkIBPzNPav5uNGbxj2hbeyk4S3oJlonhHjc3cnSPpGxHSYAuvY+NnueruhiuOL1WTwuTLuzLXKMsfZ5bDa1wNLBFC+oIwLRTwSvAek0WeEQ+cvdPuvqsNy1zQW/TOwyPh52w4axISbCch1NSAWeI3FUkP37L5I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697544; c=relaxed/simple;
	bh=TdEtMbunCivpV+z8sogV7aOXomj7E2qcRxXxO/u7qX8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mXoAk2c5utMYr6+lQpB/WfgIIcwm/8hRIntcYpU5yNL+iCjQjUTPQHokAPms5DFW/Zz2kkg3n1hZhKpglqsIItepcUSRPrDtkbb7djHGuyd2D81iViNQJnWGJ75W5yX0tP4E3m8Wv3qsniebi2SGAal0VjXZ/LgISm2jESNYcl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OehgYcOi; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OehgYcOi"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 655IY1p0461407
	for <dtrace@lists.linux.dev>; Fri, 5 Jun 2026 22:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=GFeZSv/NqrnAnMH31OmuOXhIosboo
	MP7yme5iJMNA6Y=; b=OehgYcOiD3O6BRamyacEbqsofZiqlbzMnqan/GukncreR
	6NOI/JCnZ/z+SJXBOzlFXSmh8Hab48/ZzrAK8GVi4CqtXt1ru/e33UymkT96AUJE
	8JQEP4p1VaUQgukFX3xE4tHnUCOTl5pgExnqpJSSTpw156MUtUmBFxIg3znt1alN
	I/l/QvYxFk7JkRbW6YfrN47fPhUsykB0SuQjpg5OCv9H06KLAs64HA5RWgc9sxVP
	U5Ai6xNAPR+j3W7U+VSLtGhq2EBlbgk2BML+DOsYd8oMVO47rBzD4C931yBE9bml
	HszfsnzO68aVTvK+jrj8qBEfCcueKmvW1qAgiJkrw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4efresawe2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 05 Jun 2026 22:12:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 655MAQvn033128
	for <dtrace@lists.linux.dev>; Fri, 5 Jun 2026 22:12:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ek326nvuq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 05 Jun 2026 22:12:19 +0000 (GMT)
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 655MCIuh039322
	for <dtrace@lists.linux.dev>; Fri, 5 Jun 2026 22:12:19 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-53-60.vpn.oracle.com [10.154.53.60])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4ek326nvu6-1;
	Fri, 05 Jun 2026 22:12:18 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH 0/6] dtrace: support user-space symbol resolution via uresolve()
Date: Fri,  5 Jun 2026 23:12:11 +0100
Message-ID: <20260605221217.1211791-1-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2605130000 definitions=main-2606050219
X-Authority-Analysis: v=2.4 cv=U4Wiy+ru c=1 sm=1 tr=0 ts=6a2349c4 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=7Gl3-_t3PgB9XO-mQDs3:22 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8
 a=m9S7k9NsMskcTv4K2-0A:9 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22
 cc=ntf awl=host:12313
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDIxOSBTYWx0ZWRfX/qnURyUe2xqf
 TEwkHFiJzGhHN+YlB5Axqgu6wf6QNEWUWzptCgs99LXqs5vNghyIc60faTahLY6S636anoxKQZM
 A7pFwAYSJbW3IGSdcyLA0Gn7fh135BCn+p9l3rj4shnoeU+4WFDU47G4LGFUlezLfkvbBuhfL+1
 csqMr04YmIbMsC3nWOTiWS5PTF3YSN28Dp414gBpTjl0z8jj4oHNirYfDpzyMWHHN1Y7ff7FC79
 dg0qSIp91uKroG4W0iW6w5u908XE1CiGPzWN4RD2/Ux90Bgf4Hu6HvaqFAS+miPeYX3ktazaLY1
 /+TyvTb1wqcwcaiQ/wahyyGNgb1cgUjCo5LynWER5rCRnwVvJW+gwjHno0RbT3/ITm6grveL8yF
 XIwi2mPthzbCkJyW/bfE7pmrj2lSW9ifQCy5vHGFbyxp2lLjFDlwlXRT588WP/WS4aZZa5beJBz
 g4K5n0W76CKZvN343Nv7k5e/8Jy7d7BCS8pOCJjE=
X-Proofpoint-ORIG-GUID: xZCrBprOFGFFy_5vDVCgIXv2MA0-C7y-
X-Proofpoint-GUID: xZCrBprOFGFFy_5vDVCgIXv2MA0-C7y-

Resolution of userspace symbols is added via subfunction

uresolve("name"[,fallback])

which returns the runtime-resolved address of the symbol for use
in probe context like copyin()ing values.

At cg time DTrace records the relative symbol offset and at runtime
we compute the actual location by utilizing the probe context
userspace instruction pointer and the cg-recorded probe offset;

runtime_symbol_addr = symbol_offset + userspace_pc - probe_offset

Note that this series - since it adds support for systemwide
probes to uresolve() - depends on the patches in [1], so a
clean devel branch will need the systemwide probe patches
applied.

Patches 1 and 2 fix a few issues encountered when using uresolve()
to help construct python stacks.  Patch 3 adds the recording of
the probe offset used in the above computation in machine state.
Patch 4 adds uresolve() support, while patch 5 adds negative and
positive tests for symbol resolution.  Patch 6 documents uresolve().

One specific application of this is to walk python stacks; for
python3.6 we can uresolve("_PyThreadState_Current") and walk
stack frames from there.

[1] https://lore.kernel.org/dtrace/20260304080125.649031-1-alan.maguire@oracle.com/

Alan Maguire (6):
  libdtrace: Pack declared bitfields into C storage units
  libdtrace: do not taint scalar alloca member loads
  dtrace: add 'probeoff' variable to record relative offset of probes
  dtrace: Add uresolve(symbol_name[, optional_fallback]) for symbol
    lookup
  test,funcs: add uresolve() tests
  docs: document uresolve() in the user guide

 bpf/get_bvar.c                                |   7 +
 doc/userguide/index.md                        |   1 +
 doc/userguide/reference/dtrace_functions.md   |   4 +
 doc/userguide/reference/function_uresolve.md  |  61 +++
 include/dtrace/dif_defines.h                  |   4 +-
 libdtrace/dt_bpf.c                            |   1 +
 libdtrace/dt_cg.c                             | 503 +++++++++++++++++-
 libdtrace/dt_dctx.h                           |   2 +
 libdtrace/dt_decl.c                           | 198 +++++--
 libdtrace/dt_decl.h                           |   6 +
 libdtrace/dt_open.c                           |   4 +
 libdtrace/dt_parser.c                         |  15 +-
 libdtrace/dt_probe.h                          |   1 +
 libdtrace/dt_prov_uprobe.c                    |  66 ++-
 test/unittest/bitfields/tst.SizeofBitField.d  |   6 +-
 test/unittest/bitfields/tst.SizeofBitField.r  |  12 +-
 .../tst.alloca-struct-scalar-load-taint.d     |  35 ++
 test/unittest/funcs/uresolve/err.nofallback.d |  21 +
 test/unittest/funcs/uresolve/err.nofallback.r |   2 +
 test/unittest/funcs/uresolve/tst.fallback.d   |  25 +
 test/unittest/funcs/uresolve/tst.fallback.r   |   2 +
 test/unittest/funcs/uresolve/tst.positive.sh  | 144 +++++
 22 files changed, 1054 insertions(+), 66 deletions(-)
 create mode 100644 doc/userguide/reference/function_uresolve.md
 create mode 100644 test/unittest/funcs/alloca/tst.alloca-struct-scalar-load-taint.d
 create mode 100644 test/unittest/funcs/uresolve/err.nofallback.d
 create mode 100644 test/unittest/funcs/uresolve/err.nofallback.r
 create mode 100644 test/unittest/funcs/uresolve/tst.fallback.d
 create mode 100644 test/unittest/funcs/uresolve/tst.fallback.r
 create mode 100755 test/unittest/funcs/uresolve/tst.positive.sh

-- 
2.43.5

