Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B54284678
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 08:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756195951; cv=none; b=qyh90zuFgZqmam1m6lrhczOJYuHpk9BxSpFPWtLTO10nz/do/8KEV3Uy/BTZ3UhNQty8q/uoWgY4R9H1JpwMltCGZD0Sdzj4o3xMi0BzcYtz9eQ3VyyOOJfxwHdnQM/tE55+L9qad18sIVLJuxh0YdKZ63Jtbqwa1AvDNX5KFc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756195951; c=relaxed/simple;
	bh=QPoAFKzD4a2UZOI9qdgI5N5mkhyZGB+qd+5Bo/SvPGc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MEhZeO+N4rJiYxaR0F/aAFVa+6ebcWJhU2ckpjAoVOEDR9NW7g+byJvN+okcBzOZ0dCkwD4EpZtqxN2Xo/j2WHwWMcusNecKzR51KxgaWJsAxDzlZT6nAmvpCahcGWlrgCGzJl4looaamN6s4bDUosJ7f+rSz1FoVZ/5SYXF4/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HyCPMgeY; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HyCPMgeY"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q6CEPd004436
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 08:12:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=tW+mOd7MWO9V1wEBpzFVYRu2EmMoq
	j30lj7Tc9EXFsk=; b=HyCPMgeYR7Hay5oX9FYngQJuBf7MQZEHKbA+LIQeFfeZz
	+sRocCprsfat8j69sds0eKdcICA3U90pAeXrXpnaElcot2hSOxjr6Z3XMPUpYt4Y
	ygb6U4YG4B89Ts5zKNC0Jzo4RuEznc3QVmGJFdZIv8xgILl+XHtNv4U0YFDty8NV
	Q8jHsVh3FS0BgzFL47od8gnhXHmwAG1ZVViK8XDPdTjEGquaeNW2InRJSEbrmlYG
	KXlcGo+iL7l2beWFtCW94Lj7WUj29Q4D9tbwdBz62Nh8XEaWCLHrlN6cWrl5g3jQ
	6/NVHcs5xHcN80Wk7FsRoHWrr35H/w1sleUfPyKPw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48r8twanku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 08:12:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q86cKg014572
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 08:12:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48q4397t3d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 08:12:27 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57Q8CRfq007370
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 08:12:27 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-58-113.vpn.oracle.com [10.154.58.113])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 48q4397t2y-1;
	Tue, 26 Aug 2025 08:12:27 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>,
        Eugene Loh <eugene.loh@oracle.com>
Subject: [PATCH] cg: fix offset for > 8 bit bitfields in dt_cg_ctf_offsetof()
Date: Tue, 26 Aug 2025 09:12:26 +0100
Message-ID: <20250826081226.591245-1-alan.maguire@oracle.com>
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
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508260072
X-Proofpoint-ORIG-GUID: cI5NrdVYahgFk91BgccfP2P9ejBBu-z9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI0MDE4NCBTYWx0ZWRfX7VKH2P/aDax2
 zZClg5L2L80l//idu9SNbRcq8thr8HuwzQDnfqGOW9c1it87XrRmDLT4frKwBtxWyKn4wu/jA4E
 TTINCN0PEvhW/F0TSBfUzV2s1C95qxh9vSKCW5tDqbgs/CbTl7/24BEV/w0EwP/7f2RAm6YJtul
 yvnM+nLv9uXOM4cHwJjGQxfbXnjijb/KjtmD+owgsb5LxxIJBZwsJ4n9Ohq7WQtAchotg1kUPjp
 MJ+Hftc0t747LhVxjeOX3OrvXt6rp/5TCe13DhB0l+xvNdI434+DWJZbbOxcwYcEB+XCchTYrQG
 XosQuIkZQqRetyjQFxjL4KZnoCBKc937YRBuu9vYOwO6seaYqzdwal0Egv5C6SvNTxmEWMXR2Ko
 /lhvrywOJ8L+6Os2wqOfVYtQ/FTWWA==
X-Proofpoint-GUID: cI5NrdVYahgFk91BgccfP2P9ejBBu-z9
X-Authority-Analysis: v=2.4 cv=IciHWXqa c=1 sm=1 tr=0 ts=68ad6c6d b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=2OwXVqhp2XgA:10 a=yPCof4ZbAAAA:8 a=sJsK4YlTq-rCmedtjzoA:9 cc=ntf
 awl=host:13600

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

Reported-by: Eugene Loh <eugene.loh@oracle.com>
Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_cg.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index cd9e7f4e..7abb5bc6 100644
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
@@ -1973,6 +1975,13 @@ dt_cg_ctf_offsetof(const char *structname, const char *membername,
 
 		longjmp(yypcb->pcb_jmpbuf, EDT_NOCTF);
 	}
+	offset = ctm.ctm_offset;
+
+	/* a bitfield may have an additional > 8 bit offset which means we need
+	 * to adjust the reported byte offset.
+	 */
+	if (ctf_type_encoding(ctfp, ctm.ctm_type, &cte) != CTF_ERR)
+		offset += cte.cte_offset;
 
 	if (sizep || ldopp) {
 		uint_t	ldop;
@@ -1982,7 +1991,7 @@ dt_cg_ctf_offsetof(const char *structname, const char *membername,
 			*ldopp = ldop;
 	}
 
-	return (ctm.ctm_offset / NBBY);
+	return (offset / NBBY);
 }
 static void
 dt_cg_act_breakpoint(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
-- 
2.43.5

