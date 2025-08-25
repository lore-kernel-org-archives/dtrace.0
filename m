Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E68A26E175
	for <dtrace@lists.linux.dev>; Mon, 25 Aug 2025 17:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756142176; cv=none; b=FyYD4HqWxiHl6DIx/OwD2tzhxpx5mfAhM0WdkmubX2bolQKzKK64Bm6wZdDV9nQAw1jtxXR6d9errnzMIWwN7XGs9ErehbaZrgsKWlLdFww9dkGLCFDLs6vjlVUyV76PVp56Fx06YSFRv+4LhDpXRr2ABnnYr/d6z0h2+ao6dgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756142176; c=relaxed/simple;
	bh=8aJc+lIVkNGpmvfSzIfP+3KssIbCKifVXdUXa4piQuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cs+BYb3gXETEzZQGBCUiZfiNvmsbfDEBBHIen1aOd9Hnam7WI+VmrLs2TdZN6d+7V8s9SMsihJ81zwsbmsF5AbU4xPNhNGsayfh7ZIRLCzBkvYuXAf+JCn1KfxDkB/KaDV+3FLe7sDryt/+jGLwX6rcQcZB7GexO5ghyn1e6K2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=InV7uC7Q; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="InV7uC7Q"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PGuMxO001010
	for <dtrace@lists.linux.dev>; Mon, 25 Aug 2025 17:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=2hje2e7Nv7hQqlHwHcQfJjrg8+cn1
	AvkNwifINVgiHs=; b=InV7uC7QFxEJRA6kekH06DQnDXiJyy2MQKx1vY8JXpV+F
	9MqheVZDrW+dbkM5+3S58gMK9kyRF81BAB5D+b66vJ/VfmFR1gHctPXMTH3j91pF
	u46X+z9I6wpYv6FjOfyFad5oEW4kHw3JcFh9y2ya20TFwmQgFEKi1PX6Ty7XsAo0
	C63gUtU4/YL/vWqaqEyf14sufRL/da6LsmcsFHeXt46xaljHy9eSl2wfJpi2xKiu
	r38+cLKjTkBzPglNsLevj9fz6hKIoIzRcYCmzEOEuzU1UjPg+moEa5QKrv7eJQeD
	pN7qnz88nhV5CFS2wSdB70Q/T5chUEg4eRIe6xHWA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q4e22tat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 25 Aug 2025 17:16:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57PGA91V027290
	for <dtrace@lists.linux.dev>; Mon, 25 Aug 2025 17:16:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48q438e92e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 25 Aug 2025 17:16:11 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57PHGBVV036626
	for <dtrace@lists.linux.dev>; Mon, 25 Aug 2025 17:16:11 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-57-204.vpn.oracle.com [10.154.57.204])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 48q438e90k-1;
	Mon, 25 Aug 2025 17:16:11 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>,
        Eugene Loh <eugene.loh@oracle.com>
Subject: [PATCH] tcp provider: use __ip_queue_xmit() as it is non-static on 5.4
Date: Mon, 25 Aug 2025 18:16:05 +0100
Message-ID: <20250825171605.486689-1-alan.maguire@oracle.com>
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
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2508250155
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAxNyBTYWx0ZWRfX5/M8yfIXzGPG
 LRSNkMa2eUkhIfFYmrPGbsl0gL3KoyHQPIcTPV1nsdSKGk8Ams2qY51+azfiRXsjDbNO2hK5HYL
 B0BKKXNWIqBy/rPoRRGi8VROEeTLnFmljfmbs2uABoXbm3e1z1TWDui9FGVuUaDwquu/6hESuIW
 bh+2OgM1YzXAwMipXZdCz1l2Matiw7UgwQB5drorHDoCzoC6Gs8zBV5bckBOaBzNha8Srj8uxFA
 lmpKvo6jc9HsNdc+jKh8vf5XjoRSE4dbo3RvHziA2QPuU6+AkBI6sPF5jDX4Um3t1TFddtMZ743
 UgbR+p4DHM5JI/Xb/PBNJIJc12bBbBwcC/tydfCz8e55xIectRprPb9ImosFNkYQzONt6KzrDlT
 X+j1JCax
X-Proofpoint-ORIG-GUID: t9auOY7_0b_yL9om-X5Hw8IAjZXXVKAA
X-Proofpoint-GUID: t9auOY7_0b_yL9om-X5Hw8IAjZXXVKAA
X-Authority-Analysis: v=2.4 cv=IauHWXqa c=1 sm=1 tr=0 ts=68ac9a5d cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=2OwXVqhp2XgA:10 a=yPCof4ZbAAAA:8 a=Aqzb0fwpqbfrKlvjTioA:9

On older kernels - 5.4 to be precise - ip_queue_xmit() is a static
function, so it is better to instrument __ip_queue_xmit() as it
is extern so not prone to optimization on 5.4 and later kernels.
With this change, the following previously-failing-on-UEK6U3 tcp tests
pass (and continue to pass when tested on an upstream kernel):

tst.ipv4localtcp.sh
tst.ipv4remotetcp.sh
tst.ipv6localtcp.sh

More work is required to fix up the tcpstate tests for UEK6U3.

Reported-by: Eugene Loh <eugene.loh@oracle.com>
Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_prov_tcp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/libdtrace/dt_prov_tcp.c b/libdtrace/dt_prov_tcp.c
index ebdcfbc9..a191efe1 100644
--- a/libdtrace/dt_prov_tcp.c
+++ b/libdtrace/dt_prov_tcp.c
@@ -37,7 +37,10 @@ static probe_dep_t	probes[] = {
 	{ "connect-refused",
 	  DTRACE_PROBESPEC_NAME,	"fbt::tcp_reset:entry" },
 	{ "connect-request",
-	  DTRACE_PROBESPEC_NAME,	"fbt::ip_queue_xmit:entry" },
+	/* ip_queue_xmit() is static for older kernels so use __ip_queue_xmit()
+	 * which is non-static for older and newer kernels.
+	 */
+	  DTRACE_PROBESPEC_NAME,	"fbt::__ip_queue_xmit:entry" },
 	/* ip6_xmit has > 6 args so cannot fentry on aarch64; use rawfbt */
 	{ "connect-request",
 	  DTRACE_PROBESPEC_NAME,	"rawfbt::ip6_xmit:entry" },
@@ -48,7 +51,7 @@ static probe_dep_t	probes[] = {
 	{ "receive",
 	  DTRACE_PROBESPEC_NAME,	"fbt::tcp_v4_send_reset:entry" },
 	{ "send",
-	  DTRACE_PROBESPEC_NAME,	"fbt::ip_queue_xmit:entry" },
+	  DTRACE_PROBESPEC_NAME,	"fbt::__ip_queue_xmit:entry" },
 	/* ip_send_unicast_reply has 10 args so cannot fentry; use rawfbt */
 	{ "send",
 	  DTRACE_PROBESPEC_NAME,	"rawfbt::ip_send_unicast_reply:entry" },
-- 
2.43.5

