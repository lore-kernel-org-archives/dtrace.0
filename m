Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2DC49629
	for <dtrace@lists.linux.dev>; Tue, 25 Jun 2024 16:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719332558; cv=none; b=DYMlggq/Z58lDJ+mqgbRERtsItrgs5e92+YPXuR86eqG6OrAPG+IFO5mNWKwtZfQL/Z7VmqGouxaRstLbI6WFrU7YyLpNLLVZcHiLQQ78PawLRL8v513x1IHMG3eZiqvTEh94UYayDcS1WyE33rg6v1fJHNDY/pi/NhGs02dyD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719332558; c=relaxed/simple;
	bh=qr+pqn7E2EmPGCxe4GPvHaAyken+e1JoLx/3+IKFmrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FILgZ4jEhVAQmAH8k1yBUEH96OVtdVgL8iSZHwcwGocj9h97Dd7lArbnGWLxYePD/b9R4JNlQPlX+fedl+fWvNI6lMVK1oLMvVNykccEy1kKawPytRSVpO87iQnSEK/aV+fN72GHUC4Q9j6D+z2QKBqzfAHEcxGnZfBnKPeUfZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=m4WXokwa; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="m4WXokwa"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PD3VTq013974
	for <dtrace@lists.linux.dev>; Tue, 25 Jun 2024 16:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=corp-2023-11-20; bh=7wy1AJCGsv064s
	KXpA3KL7aMo2CBg3Pm6zk3jUuxyGE=; b=m4WXokwaq1Hh1hIaLPKR5/LJhOT9iO
	LVmH3m6G+80zaTgwJYOVPbMxgiy+QykVveOWA1GbvNmjd0KxiSA4PFzO8x4TGBBH
	H0P4u/2kon9s5waQs2henON8hdTgehiigol++zUmX0wVsv4cgGz2lvvfkZs2veb4
	ZvEgXs+JyFC1Qr+gwU3AB2Acq6uzvjlRdd6Z6R4ODkJ/YRfkFJrFUMORrMO6HnOZ
	TQd4O7gRllpLWS3akCAaGb6ysWmTsHIj1eioWqMlzgeH0mq/lzMn+dSgF66gWtJP
	CszLEVXMJ6O7kLDaiZgvxIe23CPWdIdQ0ChVYbAWpj4jvQIfAQTJNRWw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywp7sh751-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 25 Jun 2024 16:22:34 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45PFHeDt017780
	for <dtrace@lists.linux.dev>; Tue, 25 Jun 2024 16:22:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn27s9e9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 25 Jun 2024 16:22:33 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 45PGMXnZ008409
	for <dtrace@lists.linux.dev>; Tue, 25 Jun 2024 16:22:33 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-163-9.vpn.oracle.com [10.175.163.9])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3ywn27s9cn-1;
	Tue, 25 Jun 2024 16:22:33 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH 1/2] sched: fix firing of sched:::on-cpu
Date: Tue, 25 Jun 2024 17:22:29 +0100
Message-ID: <20240625162230.1439537-1-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_11,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406250119
X-Proofpoint-GUID: rUHCLF9LjADYkchMwzkGRoXGVUvkf3R3
X-Proofpoint-ORIG-GUID: rUHCLF9LjADYkchMwzkGRoXGVUvkf3R3

sched:::on-cpu is not firing very often versus off-cpu.  It appears
that - for recent kernels at least - fbt::schedule_tail:entry
placement is wrong.  We can instead rely on the cpc:::context_switches-all-1
probe to carry out on-cpu firing since the associated SW perf event
fires for context switches.  With that in place, we see sensible
off/on-cpu numbers:

$ dtrace -n 'sched:::*-cpu { @c[probename] = count();}'
dtrace: description 'sched:::*-cpu ' matched 2 probes
^C

  on-cpu                                                         6491
  off-cpu                                                        6492

...and can easily do off-cpu analysis:

$ dtrace -n 'sched:::off-cpu { start[execname, pid] = timestamp;} sched:::on-cpu /start[execname,pid]/ { @offcpu[execname, pid] = avg(timestamp - start[execname, pid]); }'
dtrace: description 'sched:::off-cpu ' matched 2 probes
^C

  gdbus                                                  3086             1415
  Web Content                                         1427650             1644
  dbus-daemon                                            1347             1804
...

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_prov_sched.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_prov_sched.c b/libdtrace/dt_prov_sched.c
index 2749385a..74166543 100644
--- a/libdtrace/dt_prov_sched.c
+++ b/libdtrace/dt_prov_sched.c
@@ -25,7 +25,7 @@ static probe_dep_t	probes[] = {
 	{ "off-cpu",
 	  DTRACE_PROBESPEC_NAME,	"rawtp:sched::sched_switch" },
 	{ "on-cpu",
-	  DTRACE_PROBESPEC_NAME,	"fbt::schedule_tail:entry" },
+	  DTRACE_PROBESPEC_NAME,	"cpc:::context_switches-all-1" },
 	{ "surrender",
 	  DTRACE_PROBESPEC_NAME,	"fbt::do_sched_yield:entry" },
 	{ "tick",
-- 
2.43.0

