Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C75B44CF3E
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786540939; cv=none; b=JWTTFz/Yrneh0xAcl6Lydw/Xa1StEMsC3/B17hPTxA+mJBZY6ocvRNkZnosTp24l+U7FhJJQIzAQ3mWF+PvlzJO2BEA7LNlXPutAztpIb1PPU1LSKjcRlqKzP4kj4EqhBh0hLlRGbBOrJ2R0kLRVHaAYNxTlncN5++R9ithyBJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786540939; c=relaxed/simple;
	bh=VSbWV+dBsFKHF87Rt2p4YQfLqwuTOFCDa7XJiJItAps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BHXy5HDBlHTKx961Cn/0Or7zDUUI5YXKu8JG9ZRWHJkPpBom30aUTUFKxEXsge303QfKi8U18xUQHDAR/6X6xivqeOYyGV1y/muKHkBjNw9Gzr0qg7iRlb6w4rmK6RayjXcbHf8B4Bqqc8vaAhFn9BqVkt7dHp/pECA3hMB22t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DNzSUvPb; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DNzSUvPb"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BLd13a3577998
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=kPQw2
	1bRKXTbwdaNSBbKONXldMFlTuL+Luy4wZnrlQE=; b=DNzSUvPbtQqvEcFWl8xOd
	OW5RTrflG1VHzup9o7XxC6lVKtx1LC3VskcHXShU0RM5fruN0YaWUuS/C9C+QyHv
	XZnWsUDFrRlaTENoBgiFNeF4t7hmkmRYCT2rkGmYqMS6T0o4ZCYfuFB5Uuc0UkMS
	KgjGcBIHstmmvifeCZJ9xgDOzUzHvqm9PZL8JvKlr2AYs7ntITlWtJ5VqupXIk6X
	/5/unnXVtcfsEk2Zub1SUWCyauatTLuCSBsObhfAUCFCmBYDYlmdQJajqbcqurTW
	JNnvddFZIaumWWTG7REJJnSIFX/2b1tcSII+QMZGGZwkae/NqLWxVeyy/tTZ9OOl
	w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4fwvkcpn26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:16 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67CDKdSQ002209
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4fwtwsse33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:15 +0000 (GMT)
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67CDMEBf010792
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:15 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-57-125.vpn.oracle.com [10.154.57.125])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4fwtwsse20-2;
	Wed, 12 Aug 2026 13:22:14 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v4 1/9] libdtrace: Support multiple DTrace handles per process
Date: Wed, 12 Aug 2026 14:22:02 +0100
Message-ID: <20260812132212.527871-2-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260812132212.527871-1-alan.maguire@oracle.com>
References: <20260812132212.527871-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608120109
X-Proofpoint-GUID: -GGPzDxtbm7x-5hLWzgxmwoFaa8GyiiK
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEwOSBTYWx0ZWRfX1gP4uWRlmOpS
 N2Rmx+x2mB+Tj9LlCTI81dEsfmMTfL9DMcZfWRsZhE1vDRRl4Dq8F3tjhYKniTwC4i+wCCFOhc0
 rJHE+fFjamXuyKbupPzu687EKBJu8wXA7AnO0210Dlmg0T37RZ1h
X-Authority-Analysis: v=2.4 cv=aepRWxot c=1 sm=1 tr=0 ts=6a7c7388 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=yPCof4ZbAAAA:8 a=RU-WIvMboFAsKU7_LnEA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13509
X-Proofpoint-ORIG-GUID: -GGPzDxtbm7x-5hLWzgxmwoFaa8GyiiK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEwOSBTYWx0ZWRfX5npNTlqhBdh9
 poJlDObdtdmKnoOeWpDjjINVzNlXCpeY7fV9pMrcC4glnEYDHKRz6lpwz9qEL3KzPdiBhVdgjZa
 TPkA+tH1YBoRwKOEYaPJkIRoFqYNMM6x/p3sLRxt4beq3HQCqWaZArRmbqM4/6pLfksIej6RaLq
 Wna4mDokxnYQSn/CY/rMKH3/Z2UxpzFdGeQrc/L7NtWlhr5V0/NE+MbzZC3MwySpNiM88X0qHQo
 AA080qp/G/uuvRTtMI0WKJ1fcNGmfxPWKtH65R1l8SF39j+Qg9bJddzJtCa9jjjDVeqtHzSYHLf
 4pvd7q1DWGGsGrK5r2t/EN8CMtscojtYoiJ89CQ8qYhL9vJsQ9EDawB0eFOOkF8KY2qrYRca4RZ
 yBGDQpoA/kujZpPU5rNf0AYz4AVhChlZZUsqt11cAgRFDPqoNhCKTsj3ysgEqPo4PVZnwPTpbZz
 6Kr/rnbGbJ8AkJElBM2kOQZ7HEaTGymdaRmNKrog=

For use cases like PCP we require multiple DTrace handles
in a process; to fix this ensure we tie global map creation
to the handle and also allow BEGIN and END probes to already
exist.  Later work can capitalize on efficiences like sharing
kernel type info, but for now this is enough to make multiple
instances work.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_bpf.c         | 6 ++----
 libdtrace/dt_impl.h        | 1 +
 libdtrace/dt_prov_dtrace.c | 6 +++++-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 146a66e3..be8a4229 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -25,8 +25,6 @@
 #include <dt_btf.h>
 #include <port.h>
 
-static boolean_t	dt_gmap_done = 0;
-
 #define BPF_CG_LICENSE	"GPL";
 
 int
@@ -1076,11 +1074,11 @@ int
 dt_bpf_gmap_create(dtrace_hdl_t *dtp)
 {
 	/* If we already created the global maps, return success. */
-	if (dt_gmap_done)
+	if (dtp->dt_gmap_done)
 		return 0;
 
 	/* Mark global maps creation as completed. */
-	dt_gmap_done = 1;
+	dtp->dt_gmap_done = 1;
 
 #define CREATE_MAP(name) \
 	if (gmap_create_##name(dtp) == -1) \
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 5282efbd..7db2ba93 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -433,6 +433,7 @@ struct dtrace_hdl {
 	dt_list_t dt_lib_dep_sorted;	/* dependency sorted library list */
 	dt_global_pcap_t dt_pcap; /* global tshark/pcap state */
 	char *dt_freopen_filename; /* filename for freopen() action */
+	boolean_t dt_gmap_done;	/* global map created */
 };
 
 /*
diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
index 4b788507..8118ab23 100644
--- a/libdtrace/dt_prov_dtrace.c
+++ b/libdtrace/dt_prov_dtrace.c
@@ -243,7 +243,11 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 			close(fd);
 		}
 		free(spec);
-		if (rc == -1)
+		/*
+		 * Multiple handles in a process mean we may have BEGIN/END
+		 * uprobe events already.
+		 * */
+		if (rc == -1 && errno != EEXIST)
 			return -ENOENT;
 
 		/* open format file */
-- 
2.43.5

