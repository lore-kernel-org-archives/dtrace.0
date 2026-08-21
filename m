Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6A64C041B
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328669; cv=none; b=pXllmA8HzC0kstMDEOC422p5ET6bOPCZ/8RXt77RHicfY3Xcsck4M8vDe3bD+p6i6B82+uO9z775ZkO7l5DmdnvXXzKnjbOuSnoSoCotYhUZXZKHulyrJOpN3+R6mxXlsFU+y9Q8UQxkBmz4FEcneCFEFbRltarJL+YCuL/CKyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328669; c=relaxed/simple;
	bh=VSbWV+dBsFKHF87Rt2p4YQfLqwuTOFCDa7XJiJItAps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CeO+iiZj8RudtcxoDrpV8fke8Ktnol2nCfX0tvN92X4Jar6xLb9pOSHckBj0bgey5Oc7m6ipzjK3OA2+X/J6V8fFco9+Br8DsIh63Qe0eoKJKpU0gtgU5sedxu+BJptW1UU+DkArg54aSAB886YfobcbROjPw5ol9yIkoPxCkq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LTnX6YRi; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LTnX6YRi"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LCp1I92418342
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=kPQw2
	1bRKXTbwdaNSBbKONXldMFlTuL+Luy4wZnrlQE=; b=LTnX6YRidKBH+RrneYmNo
	9ibYiBIRcOlPT0N4Hu2TyGerNn38HdQ802JVid1ktxhVbJEFuEllIU5sdw3PJ0Wb
	PqGwau317ZkvOAyh7GDnuo7fYzhBNuu+fd1Rw7SdqHiKuyDtnWMGXDSFYWMXgbxX
	S941pDwYOAOw8nW+nirN4I7mULG+cud/SreX1sw1mWTFg9f6HoFTx6UdpL3Pks84
	lPiPNnFXc6CRkoqi4nGJmtuKO5hEIi4+4Na3uIpP6uGy45nDKtYbKxWQqtLs1lEO
	uQhKyXFCHszpVpGWFkzSBY3/AJgbMbe+uh5PTXV1pXJ+X1NwLmk60A3/yJPWr+oq
	Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g4yd9wcjg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:05 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67LG5CQK029269
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4g2ejgcmwn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:04 +0000 (GMT)
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67LGB2Ev014592
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:03 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-51-128.vpn.oracle.com [10.154.51.128])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4g2ejgcmux-2;
	Fri, 21 Aug 2026 16:11:03 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v5 01/11] libdtrace: Support multiple DTrace handles per process
Date: Fri, 21 Aug 2026 17:10:49 +0100
Message-ID: <20260821161100.41710-2-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260821161100.41710-1-alan.maguire@oracle.com>
References: <20260821161100.41710-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608210126
X-Authority-Analysis: v=2.4 cv=VNvtWdPX c=1 sm=1 tr=0 ts=6a887899 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=3I1J8UUJPc9JN9BFgKH3:22 a=yPCof4ZbAAAA:8 a=RU-WIvMboFAsKU7_LnEA:9
 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-ORIG-GUID: 9RsYHzfuQb6tP4oRdPDGMOCks5oDPDAb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfXyLnPThOwRdSl
 w7hpaqnniCdfPodXWt6gMY6iAtyaOkV2U8JEOK4ZD/HT/n+0aHGbf80T82zgY2HwI95/BrjFbZv
 zW9RSd8rv0LW9LVHJYWR9aXqvjpAZt0664tew00/ygzJf42MpyjiGJDaC0mGub4OJN7E6MS61nH
 MxvpI9FHYTjIAxuXbqEKdoE3KZiP0C4Uh4ndP9WQ75w42AKJULLrVmKFkABZk8b+I/Yj8lUYlIa
 V32kh0jX3768ULGOEVCzv1CQ1EyJzaKBEtpvV60v8VxR6F8+nuhx9c0jKgDxFCeNaygj8AxynQi
 iB0qOvri29juPezneGsuhoxIhSf+xbaq4q8YQFC3wTTsn8B/4FbLr/gaDFA/AewU6bEnMyMaW1b
 HDpsHacucDSOM7QbbWsjo8oZZf3vcyNG2va537U2u3px2Dak6tAWdZzg1NuPBAa/ho8WVp3K7M4
 0kaSVLI0aDJn4ks5FOQ==
X-Proofpoint-GUID: 9RsYHzfuQb6tP4oRdPDGMOCks5oDPDAb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX0nczI6bQ9bYE
 /3D9qQZZ3iXupNRWqL39yJu4Hjn1zzsb5ZN9sMSS31rJz0yKySw6yWMwsOGqursETnGkb7MqYSq
 pvVRkxXiWRgka+LWBJZ6aDMHBXtStLmvZbDdmtJE4614u3AAqidC

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

