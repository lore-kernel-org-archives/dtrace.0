Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E413A3A5449
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784647498; cv=none; b=ZX19f9EkFG3ttxIT4I+mPLCQKRBcdgT4hiZSPyq68O1RhgQI0+7pvOlml+Or0yeN7XVlF9m+VSmdxaQc/bfxXmgb+queWGZeFMZT8VpW+ffBUujhiEyVdTE7XT79SB7i9+79MmhkS4cARlQOhDsELHIkKDIn2fJoXh4q2CakhmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784647498; c=relaxed/simple;
	bh=VSbWV+dBsFKHF87Rt2p4YQfLqwuTOFCDa7XJiJItAps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u5YrbCADI5ohT/uADZjg/rvV/wxzS5gLBzTZ2CFHAZz0jXnIYBVc65yeZ8/OJIURkSViUyFS0A2Ivog0SsLQ3WxAbP8YlEi0pbWW+MLai3dRPeTeC40HUGxXcuE9/pQTV23AbI0eERBKeOCdjDHb51GmE8CleQDP1RXCtdJ73TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nDjYGmOo; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nDjYGmOo"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LEb6Dk362848
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=kPQw2
	1bRKXTbwdaNSBbKONXldMFlTuL+Luy4wZnrlQE=; b=nDjYGmOo2rIpTdhVZ7GFU
	IKE4i37dp5rIkizDefrrEEmirZW3b85CTOyqW9phCznnheNmGSi0C/DPqfjlfHBJ
	AJHctNKnu0L22/iFE8W8SzedNrtfRlGLAkvYIGO2/vKH9rHgWwjf4lS+o5JOOaG3
	Fbqnz+2f2Z+6uolwVqljeQYREa6k+RByHVlLqe6QT8zun2V26tXe1VDveUoh7jTI
	kXmBR3dXo4Fs2WxZM/wRS1V1TH55JjW+0ZfHlLIPD/9uTfY7Sp05HqZWuUBOfLN8
	mmF2YmCDfr/yJMZdPxW54U7k2prtc40ZxHlz4hXHiKo6e7sIoA9yf8aivY+KTdRq
	Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4fg1n3knc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:24:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 66LFIgbC035979
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:24:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ffyxpw2ba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:24:55 +0000 (GMT)
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66LFOrpF020536
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:24:54 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-48-223.vpn.oracle.com [10.154.48.223])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4ffyxpw29w-2;
	Tue, 21 Jul 2026 15:24:54 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v3 1/7] libdtrace: Support multiple DTrace handles per process
Date: Tue, 21 Jul 2026 16:24:45 +0100
Message-ID: <20260721152452.184842-2-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260721152452.184842-1-alan.maguire@oracle.com>
References: <20260721152452.184842-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2606160000
 definitions=main-2607210162
X-Proofpoint-GUID: ibWrHrDuIJFNQ01e6tvsaYZbJ4VdVGvT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2MyBTYWx0ZWRfX2jCshjykz2wM
 JxLVcUG//Yyd5oh1aIe1zlwxeEsG9YXt1c8Q4SkDlicgonS2UeMhXZbncJDVKHdl8PrSB+oER+1
 7t+zY88Ezeyrrv+dVd59hS5muSxmSl+ODEGvQ6LVu3oNVIw96k9G
X-Proofpoint-ORIG-GUID: ibWrHrDuIJFNQ01e6tvsaYZbJ4VdVGvT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2MyBTYWx0ZWRfX9Pf0cLgVTtAG
 qbWD3JFuI08RS0EPWmvjuO97BQ440X/ICsNU0+pbjZNqsVxFHBZ5hcDJo8TlZVkJ+sFG8Z7rZiH
 jO5B2XxWrasq2XC/A83b48ZOAoKOt2enJTu9lL1J7n9wzJsZUyLr84Kg50OuTJg+10YG8aIRPwX
 0RSJEDKo1X9+/hclBF9f/r2yoJTRVt6nz4jJmwrz2wt/E2XumNmpyLl2bVu0nZAioZTRrWDs04V
 GtR85KidoTI1BD0+iVyE1iiQI6vVdWuD5DEZQj+hpKNFbc/j6RpggZTQzP58MzvoGfKMr9aeRB0
 hp8QcP95mfQ2yuoq2V+zQrR3ZRXNDTadjL84lGlnXLHGqMzQAt/AfJvvxVRdBfNvqBAGUu94jjT
 6uZXd1BSyDJS7VbOG2lrkM9YbwTCp83TVIG1yqp8JZLTYenGfNhYui764VpGGQs4ZJuz0c5JKC0
 p5zbR1SMwXF1r/HWhOhEo7K4gJfIL69PnncArFlw=
X-Authority-Analysis: v=2.4 cv=PryjqQM3 c=1 sm=1 tr=0 ts=6a5f8f47 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=o5oIOnhZENCTenyL_yNV:22 a=yPCof4ZbAAAA:8 a=RU-WIvMboFAsKU7_LnEA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12218

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

