Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1BD2139C9
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779907861; cv=none; b=mZT7PQbF8hyyxMcI/SNz+bRMLU/yfd2FHp5rzB8og/HPxqrptB/TE9RexDWmY+Uxlw+rM5l4gWSAd57K84PpciwbcB79U3Csuc0X0F/RxpooRudSiRzzSZGkXLYKeI07Hf8rWxlgfb0gUyOE3qcCxAmisebf4g5CBaMVfixg/Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779907861; c=relaxed/simple;
	bh=VSbWV+dBsFKHF87Rt2p4YQfLqwuTOFCDa7XJiJItAps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B2VQx13nwieXKKDrS1ykib7J0a61QXZ3MgdIdmyzaA9hDt4pS25ZWlJkdCc/kyxxAYKvNCje6mtklX14RCgPCho2ecuN9MKPXoh7Ioqym536BMZyzqSdDLGIk2jPoLMU8bw0NAYRUM1R0TgSTRD3W7cyT7FeX+y1wH01q0ZAg8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mzhDcL8H; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mzhDcL8H"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RElmJ41631214
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=kPQw2
	1bRKXTbwdaNSBbKONXldMFlTuL+Luy4wZnrlQE=; b=mzhDcL8HV63JZ6xo7xvma
	KkbWgQ8zsmnv7Z7S5zdI1TlAf+MgKqtgHJEuKrYVnHVUkpIJvfvatpW2npMa6pg1
	uYX3sUmoI8iwiCBXIkaHHcIFbRO0o8SWmmOzNsMRnvJTnoFsLpNg3cAFN/Xy3ZL8
	+PPKI/XRZqfYo2nBWor7bghKMphkIOvpRCZKSD42HB63SOBimGb5cNsB5UDlRCZc
	KVJ9bCvgKLyJEG/uB39/7DrbE0K1nSMNgIHDs2HIRA7+mVp3CaHvUcnJ3xwPU6t2
	jP0wJWxF2nlHARLowWJ++/yG2GCPAq5bpssHo8R0gbFimHDQWuxPqZ6CqR/dqXxy
	Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4eb47gp2q0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:50:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 64RIoZ6j031320
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:50:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4edjse4t5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:50:57 +0000 (GMT)
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64RIomgX033024
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:50:49 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-48-144.vpn.oracle.com [10.154.48.144])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4edjse4sc8-2;
	Wed, 27 May 2026 18:50:49 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2 1/7] libdtrace: Support multiple DTrace handles per process
Date: Wed, 27 May 2026 19:49:57 +0100
Message-ID: <20260527185004.2267741-2-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260527185004.2267741-1-alan.maguire@oracle.com>
References: <20260527185004.2267741-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2605130000 definitions=main-2605270189
X-Proofpoint-GUID: lSXvP16R7PaHE6Zha7oG5t4GLi7TrPym
X-Authority-Analysis: v=2.4 cv=LtmiDHdc c=1 sm=1 tr=0 ts=6a173d13 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=RD47p0oAkeU5bO7t-o6f:22 a=yPCof4ZbAAAA:8 a=RU-WIvMboFAsKU7_LnEA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13706
X-Proofpoint-ORIG-GUID: lSXvP16R7PaHE6Zha7oG5t4GLi7TrPym
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDE4OSBTYWx0ZWRfX1kxHAzuEKDQD
 wybMbHbUs0sQbOjDDsx9wmua6fqlQfwKDTO3IWhYr6H5POuWNiQpmk8iuBN4SOVFWFSRnHzLcIG
 tBZt4L2DwtudWVKQVr7FJvjc0d3n/tI5yJ3ITutgfdfIQmFvT0CK2Yw5DW/DbMVJmhriAxkW5Ds
 Ig4y1+3Ng/fc9w7wljUoqtlVo6Eqz8Wvi1Glt7MOUW+xZjKu4hUI7/ip6wfnGB17FxcCBlXJ5lV
 qpcMzvMI364FuQN3vlcNWVDllmPMvRqCutgC3vZdotq80N1j0BiU8Ljw4H2YkcDkFn6NuIPRsZG
 YyJMN/IrnLucAQ4AQSU0LRr8MPewivLEDIONFMNQJzYFx5ItpFK4/l8lQeNriaTZbpN5y/dgZPs
 /vY9VE7C7YApo6x6vvSMfVze3jIH6HXqm5YmqGGuIaGtFIPnYXeXQBstBXMHSOgANaQQyO92/XF
 Y2t+oAcXC9sH9GOVQnnp4qbHlStFs/ShnHpaEeY8=

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

