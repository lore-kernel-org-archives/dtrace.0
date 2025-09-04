Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06C32C2343
	for <dtrace@lists.linux.dev>; Thu,  4 Sep 2025 09:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756976924; cv=none; b=P5t3MuRa6XDMPv31z4KQLkD6xuArUx9De2IKYRYnfV9ot4+MJddTU7e61c7q104Ic16SwEOWs/MzRVFwApAGC+y8WGN3j7FWW2m4Dsr7CY2w8Fv89PWnJxZ09YB601px3YOd6btmILoUs9ILRc/oorV9+NX+iuE2cogjwjBeNuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756976924; c=relaxed/simple;
	bh=x53QgB2n2mMlpeOiJp6VHfhCOUF+mQV1mazqVZYTLWI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ErXm/FlcAF9hOVzWbe2p7PgSRaUOc2Px3m4qm8qmKlmsIvkLj1RB5tzhlRNaHu16Exv2ltk36oRqpljHLAF2xA7kL0ciMUAHTP31zlhknQsJuLhKjRz+EnZKzmJ+J6pIcRq6BXR53zwYtRyb60/04fvW7Jh6HppBjBtwfHFz3fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JBI8jj7S; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JBI8jj7S"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5848dwUr008531
	for <dtrace@lists.linux.dev>; Thu, 4 Sep 2025 09:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=lZDeBzTOQImNEfPLS7RH9BOQsUPCQ
	VNFBm198tpnQ/c=; b=JBI8jj7SZBqu99BOOrbxlEQM+66CFQA4QWo+vSyVSPkGc
	3U+0omENDcqHPJqFcfpqH8KhR7KysPvrRmKflzv0F3l4iR3fhI6a9Ii0Fhin4SNn
	06J/Qts06JQ/oiqdd7Br5Yt78oa6lDgKfnf2LuMveh7RZ+UqJNGk0Rzn6V0FCBM2
	H2hsU2581yk5O6bhhdWyRuHOBN+q1U2wwmbQWdRGcovOWfo/iR90dpsT/nwUHVsN
	S7AfZkFAUzWKPqSksYUu766i7pQRphUp7rZEA8x4xvqT9XiKKiHCB60SD0N5M52D
	n8UqAOVBQVcp5TG4uxge5I5OazVUvuaMOEHadw3ZQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48y7ev01qr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 04 Sep 2025 09:08:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5848MmB9040070
	for <dtrace@lists.linux.dev>; Thu, 4 Sep 2025 09:08:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48uqrhdwr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 04 Sep 2025 09:08:40 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 58498ebi014565
	for <dtrace@lists.linux.dev>; Thu, 4 Sep 2025 09:08:40 GMT
Received: from bpf.nl.oracle.com (dhcp-10-154-224-28.vpn.oracle.com [10.154.224.28])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 48uqrhdwqp-1;
	Thu, 04 Sep 2025 09:08:40 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2] cg: fix offset for > 8 bit bitfields in dt_cg_ctf_offsetof()
Date: Thu,  4 Sep 2025 10:08:38 +0100
Message-ID: <20250904090838.1048503-1-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509040089
X-Authority-Analysis: v=2.4 cv=Vq8jA/2n c=1 sm=1 tr=0 ts=68b95719 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=yJojWOMRYYMA:10 a=yPCof4ZbAAAA:8 a=5eSldL30bV6r-kAew2IA:9 cc=ntf
 awl=host:12068
X-Proofpoint-GUID: KgueE3PUl80s6FxJg8Qod7JhXWy7Y7bj
X-Proofpoint-ORIG-GUID: KgueE3PUl80s6FxJg8Qod7JhXWy7Y7bj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDA4NSBTYWx0ZWRfX5WUplx/bf8g8
 ZQtjZLMrXrIizsAlOvDhA5LCdbSMBErC4OcT39pEbFvVxmLrDnXkUwhCiXQQORXklqGnstGIoog
 WeukyWHTMdDxnux6chuXJYdrKw+NBfr5Va7Gs6FAg52HKkmv9fBFKfX1wHpdPeFnjbFmaZQcyT1
 09oulkI7X+AZ0h4xpNmFsw9xXuY66dX7+IUj4Y1VjK0gdNAlSUG8ZB7o17IvWrKWnLlD/3xqalR
 rjjoPSpXXVgKLzqE+DxyzcuMIBJJCtySeUSe4DSUqAhOr6EjwjswH7ZV8VXE2gCs9farpxpJQao
 +QMSzfUW0/pGlRPXKpPWx08kmH+hn8IF7Rmo0xF1FZJDScko9eeCqTMrfyXjH6Z1QbixX03LIbl
 BM3tzteDjX380WQq5bwy+2spYGWlqg==

The tcp provider uses dt_cg_tramp_get_member() to retrieve the
offset of the sk_protocol field in struct sock.  However it
returns the wrong value on UEK6 since it is an 8-bit bitfield.
From pahole we see:

	unsigned int               __sk_flags_offset[0]; /*   560     0 */
	unsigned int               sk_padding:1;         /*   560: 0  4 */
	unsigned int               sk_kern_sock:1;       /*   560: 1  4 */
	unsigned int               sk_no_check_tx:1;     /*   560: 2  4 */
	unsigned int               sk_no_check_rx:1;     /*   560: 3  4 */
	unsigned int               sk_userlocks:4;       /*   560: 4  4 */
	unsigned int               sk_protocol:8;        /*   560: 8  4 */

In other words it is really at offset 561 but because we just
lookup the member offset and not the member type offset we get the
wrong value for the sk_protoocol.

This in turn causes tcp state-change probes (and in-progress UDP
probes) to not fire since we verify that sk_protocol == IPPROTO_TCP.

The fix is to look up the member _type_ offset and add it to the
bit offset we get for the member itself.  With this in place the
state-change probes fire, but the local tcp tests still fail due
to separate issues with the tcp:::accept-established probe.

This issue is not seen on more recent kernels because sk_protocol
becomes a __u16 as the number of protocols exceeds 256.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>

Changes since v1:

- added comment reflecting need to handle more complex bitfield values
  in future (Nick)
---
 libdtrace/dt_cg.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index cd9e7f4e..e378cf96 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -1959,6 +1959,8 @@ dt_cg_ctf_offsetof(const char *structname, const char *membername,
 	dtrace_typeinfo_t sym;
 	ctf_file_t *ctfp;
 	ctf_membinfo_t ctm;
+	ctf_encoding_t cte;
+	int offset;
 
 	if (dtrace_lookup_by_type(yypcb->pcb_hdl, DTRACE_OBJ_EVERY, structname,
 				  &sym))
@@ -1973,6 +1975,17 @@ dt_cg_ctf_offsetof(const char *structname, const char *membername,
 
 		longjmp(yypcb->pcb_jmpbuf, EDT_NOCTF);
 	}
+	offset = ctm.ctm_offset;
+
+	/* a bitfield may have an additional bit offset which means we need
+	 * to adjust the reported byte offset.  Currently there is no need
+	 * to bitshift values as they always both fall on 8-bit boundaries
+	 * and are sizes which are multiples of 8 bits, but in future if
+	 * more complex bitfield retrieval is required, changes such as those
+	 * in dt_cg_field_get() will be needed to support that.
+	 */
+	if (ctf_type_encoding(ctfp, ctm.ctm_type, &cte) != CTF_ERR)
+		offset += cte.cte_offset;
 
 	if (sizep || ldopp) {
 		uint_t	ldop;
@@ -1982,7 +1995,7 @@ dt_cg_ctf_offsetof(const char *structname, const char *membername,
 			*ldopp = ldop;
 	}
 
-	return (ctm.ctm_offset / NBBY);
+	return (offset / NBBY);
 }
 static void
 dt_cg_act_breakpoint(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
-- 
2.43.5

