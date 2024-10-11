Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48899210C2C
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 10:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728642497; cv=none; b=JHscSTszJjNmK5cL5oc4M+IGmVy54U+WPuCskzREhPDwH1ocvN0Xw4me//rkaA1o1rOHLH3K1Rfc38JI+Pp/HUjokhFFL6ayhls6hMXP0f4tfttPAPKp+SIMMHfLloAZ2Zc70Iobybj+Vo4dF7vlHcB8UgutxyUsuMohyOFqy/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728642497; c=relaxed/simple;
	bh=/lCScSYSMwVS192JdQX39irroW8seN02q1WKYpLoX4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nr0+Yv3l9jdQnhPx1o6uFjPsKd2g5bj1SR1QVKX/6oJMSI4xDcIx6WACoh/9Tkanqu60BOi9o3Gy4ajxfDhrzH2HHpSGptFUHKWlEtvGwUl9dyLCliTG1mkx89btol1yS1t1yOvzLtoPUCyra6DrQt4xyEpGy763XTMGunyvX6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JaD9quOy; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JaD9quOy"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B8BtWR016225
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 10:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=ZeT37
	TRldKIF4rJ0WoLJYVzj/P04odbZERYdOsvWiqA=; b=JaD9quOyhHjw3LaVnNhm7
	ygzyB9RmnxZX/JgjSImrRwsKmEdodkWSGWdiIusv/2upESYi8afLP0Ec5BYeRJj5
	wiG0PB3B+y04mm9vQvJWwp/RZ4eEa7ILQ5ZHLhiGozcUGyGZ4OMYAYyXLp7yjhph
	JVwVxIq+CSpBaxM6RvUf7THuu99/uWoEJzi8vjlu4VDn26bjJx9q8qkNUY7bSch8
	q6Lx6RCwgKLWWJZ0KTeaMSVc3gmp/sRW4+G1eV7ZOO+u6Q6LtunSf7ys2R0/VtE0
	DQOWJ3FD0ir+OqP87F+GwYGi3YI52AIK0QzLjznAl4g1wV4l6VxzEOJ4+8xVG9z5
	A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42300e4r48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 10:28:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49B8soAO027905
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 10:28:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 422uwhfkd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 10:28:14 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49BASCj8024278
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 10:28:14 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-192-195.vpn.oracle.com [10.175.192.195])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 422uwhfkc1-3;
	Fri, 11 Oct 2024 10:28:13 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2 dtrace 2/3] fbt: revert to kprobe impl if we cannot find BTF for fprobe function
Date: Fri, 11 Oct 2024 11:28:09 +0100
Message-ID: <20241011102810.989562-3-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20241011102810.989562-1-alan.maguire@oracle.com>
References: <20241011102810.989562-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_08,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=966 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410110072
X-Proofpoint-GUID: ji5rb6n0yfnqc_qjeJJVEgYseO9HnIlO
X-Proofpoint-ORIG-GUID: ji5rb6n0yfnqc_qjeJJVEgYseO9HnIlO

When using fprobes, it is possible the to-be-probed function does not
have a BTF representation.  If this occurs, revert to using the kprobe
implementation.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_bpf.h      | 5 +++++
 libdtrace/dt_prov_fbt.c | 8 +++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_bpf.h b/libdtrace/dt_bpf.h
index 5716d232..dc4eb64d 100644
--- a/libdtrace/dt_bpf.h
+++ b/libdtrace/dt_bpf.h
@@ -32,6 +32,11 @@ extern "C" {
 					(dtp)->dt_bpffeatures |= (feat); \
 				} while (0)
 
+#define BPF_UNSET_FEATURE(dtp, feat) \
+				do { \
+					(dtp)->dt_bpffeatures ^= (feat); \
+				} while (0)
+
 #define DT_CONST_PRID			1
 #define DT_CONST_ARGC			2
 #define DT_CONST_STBSZ			3
diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 0ba0fb71..15ffa137 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -232,8 +232,14 @@ static int fprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 
 	btf_id = dt_btf_lookup_name_kind(dtp, dmp->dm_btf, desc->fun,
 					 BTF_KIND_FUNC);
-	if (btf_id <= 0)
+	if (btf_id <= 0) {
+		if (btf_id == -ENOENT) {
+			dt_dprintf("fbt: cannot use fprobes, reverting to kprobes\n");
+			BPF_UNSET_FEATURE(dtp, BPF_FEAT_FENTRY);
+			prp->prov->impl = &dt_fbt_kprobe;
+		}
 		goto done;
+	}
 
 	dt_tp_set_event_id(prp, btf_id);
 
-- 
2.43.5

