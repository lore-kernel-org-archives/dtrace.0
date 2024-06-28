Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F7E158DDC
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 17:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719595001; cv=none; b=Cnt2ikWZZAMYCVeI6uHU2Rb1ZCNvRXg429WCAGTidJoSx1WEZUYLaOB3rFu8bAAixm7UiiOrwd4H8+PRWoOlh79eTOZDm3EMsPOmum/5ktK6lmieK68vPxEovTUtrk2wZuHPCpHJbNYxfT2Pc+ZxUxCUkxWnwS4DayWEo/ADsys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719595001; c=relaxed/simple;
	bh=I54roGFIFSnSTDxVtoi/dD/X5b1zfEN3quyArw2cJEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MJTTXOMWnTFG3fxeH1TsNbrXQa73G0JhQynudN3Ue9MW5y+jdj8duuqEy9rz36BgQPrZ7NdwPXdSHW6qtokugLsTXQP4hcB7HMDWbaEKSJRGrUO2ngnBLznZYMCdUiZ55PrhDkDWi6U7bzjzRESi03E0xolLPuohTjZKXKVIhnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cQvy8sER; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cQvy8sER"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SH5lJM000527
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 17:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=corp-2023-11-20; bh=Qyzadh5JtsUMa4
	qeDVpTN5BGCKb9/dk/1e5mA8fvFlw=; b=cQvy8sERxeI0awjmaycUorCXTaz3Mz
	dAAjmcevDoOBbVwCig5JSzPRzcJFK+a1vrChZRcMi6FODW3q0lyxMNM0Lw5gxZFG
	sjR2+fzi4cu78BGAkKZA4GVlUqUkXmmgaww98P0Eln7C1/vn2SdKZYMAcxyhA42m
	ySqWaEHemGm6KnB2iOcKqvTeem4CEEL8JC6tHn46bhGavXroWJkAWpGWQxpXFJ6q
	tOPYdcCGAgiqtiYqmYdqbRUBhON1BIW+uedDEF8UYQfbJShzar8V4PtN4/ZMM6U4
	SCb7btDIYhImNmFSh144e0ApWYEvKOhJMgbElDNhpnXEquUuCfEVUf+w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywnhb8rfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 17:16:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45SH6Pn1017872
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 17:16:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2by4x6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 17:16:37 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 45SHGaPw012968
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 17:16:36 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-222-155.vpn.oracle.com [10.175.222.155])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3ywn2by4wu-1;
	Fri, 28 Jun 2024 17:16:36 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2 1/2] sched: fix firing of sched:::on-cpu
Date: Fri, 28 Jun 2024 18:16:33 +0100
Message-ID: <20240628171634.2801954-1-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_12,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406280128
X-Proofpoint-GUID: HTdZLSZbtyqUWCxRyg-aD03OMuas_Ljm
X-Proofpoint-ORIG-GUID: HTdZLSZbtyqUWCxRyg-aD03OMuas_Ljm

sched:::on-cpu is not firing very often versus off-cpu.  It appears
that - for recent kernels at least - fbt::schedule_tail:entry
placement is wrong.  The only way to efficiently ensure firing in
the right place - when the new task has been just scheduled in -
is to use fbt::__perf_event_task_sched_in:entry as it

- fires at the right time
- is not static, so not subject to inlining or other optimizations
- is stable across kernel versions.

However the downside is it will not be called unless context switch
perf events are enabled.  So the most efficient method is to
perf_event_open() such an event but not attach anything to it.
Also explored was attaching to cpc:::sched_switch-all-1 and weeding
out off-cpu events, but that required a copy in of task state,
comparison etc so in such a hot codepath a more precise attach
is preferable.

With this in place we get sensible on/off cpu numbers:

$ dtrace -n 'sched:::*-cpu { @c[probename] = count();}'
dtrace: description 'sched:::*-cpu ' matched 2 probes
^C

  off-cpu                                                        1454
  on-cpu                                                         1454

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_prov_sched.c | 48 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/libdtrace/dt_prov_sched.c b/libdtrace/dt_prov_sched.c
index 2749385a..3e9d4f6b 100644
--- a/libdtrace/dt_prov_sched.c
+++ b/libdtrace/dt_prov_sched.c
@@ -9,6 +9,9 @@
 #include <assert.h>
 #include <errno.h>
 
+#include <linux/perf_event.h>
+#include <perfmon/pfmlib_perf_event.h>
+
 #include "dt_dctx.h"
 #include "dt_cg.h"
 #include "dt_provider_sdt.h"
@@ -25,7 +28,7 @@ static probe_dep_t	probes[] = {
 	{ "off-cpu",
 	  DTRACE_PROBESPEC_NAME,	"rawtp:sched::sched_switch" },
 	{ "on-cpu",
-	  DTRACE_PROBESPEC_NAME,	"fbt::schedule_tail:entry" },
+	  DTRACE_PROBESPEC_NAME,	"fbt::__perf_event_task_sched_in:entry" },
 	{ "surrender",
 	  DTRACE_PROBESPEC_NAME,	"fbt::do_sched_yield:entry" },
 	{ "tick",
@@ -141,13 +144,54 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	return 0;
 }
 
+/* We need a custom enabling for on-cpu probes to ensure that the fbt function
+ * __perf_event_task_sched_in is called.  __perf_event_task_sched_in
+ * will not be called unless context switch perf events have been enabled,
+ * so we do that here by opening a context switch count perf event but not
+ * attaching anything to it to minimize overhead.  The alternative - attaching
+ * to cpc:::context_switches-all-1 and weeding out on- versus off-cpu events
+ * via a trampoline is too expensive.  This approach works stably across
+ * kernels because __perf_event_task_sched_in() is not static, so not potentially
+ * subject to inlining or other optimizations.
+ */
+static void enable(dtrace_hdl_t *dtp, dt_probe_t *prp)
+{
+	struct perf_event_attr attr = {};
+	int swfd;
+
+	if (strcmp(prp->desc->prb, "on-cpu") != 0)
+		return dt_sdt_enable(dtp, prp);
+
+	memset(&attr, 0, sizeof(attr));
+	attr.size = sizeof(attr);
+	attr.type = PERF_TYPE_SOFTWARE;
+	attr.config = PERF_COUNT_SW_CONTEXT_SWITCHES;
+	attr.freq = 1;
+	attr.sample_freq = 1000;
+	attr.context_switch = 1;
+
+	swfd = dt_perf_event_open(&attr, -1, 0, -1, 0);
+	if (swfd < 0)
+		dt_dprintf("open of context_switch perf event open failed: %d\n", errno);
+	else
+		prp->prv_data = (void *)(long)swfd;
+	dt_sdt_enable(dtp, prp);
+}
+		
+static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
+{
+	if (prp->prv_data)
+		close((int)(long)prp->prv_data);
+}
+
 dt_provimpl_t	dt_sched = {
 	.name		= prvname,
 	.prog_type	= BPF_PROG_TYPE_UNSPEC,
 	.populate	= &populate,
-	.enable		= &dt_sdt_enable,
+	.enable		= &enable,
 	.load_prog	= &dt_bpf_prog_load,
 	.trampoline	= &trampoline,
 	.probe_info	= &dt_sdt_probe_info,
+	.detach		= &detach,
 	.destroy	= &dt_sdt_destroy,
 };
-- 
2.43.5

