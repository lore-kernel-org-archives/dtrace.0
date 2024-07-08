Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E342C13FD69
	for <dtrace@lists.linux.dev>; Mon,  8 Jul 2024 14:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720450452; cv=none; b=toeRs/e++kyXEctQaV1n8glHVmBD4iqJU6LX6Npr9SqRcUSCDa7REhnP8jyIuQztjBkgw5sao4pnRN6/hZt3sTJEIyMxf1XsIHu7aiCXQC7WiZeKD/Gp/zYHnnR7/Hv80ouh9vRNsjc6QE+yQyEgP1fRW5/d27CmfBghbQAqm3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720450452; c=relaxed/simple;
	bh=mIt2a29QMmAkswI5PDDxxiFYfHH1ZlvUPqkV4RktlvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gI3+10cG9h7ED9YojVPnm1je/r9BSTo+uIh/Pt7nVmzGe0+dDv1SzeLwziv6JIpTLe5Dm60fggI6aac+H6/jiT1WZrMFnYAQif8QxPe3CvhAYiIntGYes3Oi33pN0IcADkmadpNBU5KND48E5ffYQ9DT0d5IlddoRT0zJpqlUUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hYXrWMlC; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hYXrWMlC"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4687fXvv016738
	for <dtrace@lists.linux.dev>; Mon, 8 Jul 2024 14:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=corp-2023-11-20; bh=1
	wCECgzhTTO04cOBZpLKEHcY8wWQFh/tH5m0P1kk2Sw=; b=hYXrWMlC/CrmXT4+P
	jaeCJMLBllFy9JCZf9DOYB0XCsEm7lifcUk7qZ7nj9iNG6l2fUzvo+EGgu2MW+x8
	mtxNUXpKKrwmfVo+1IwY2L2toEJD/wY8rZs3aY5U31cdDFtjznm52/La6CRCSycx
	l0eA0aHk671S4j+oWpK9rvD594WzgLcQYfBGURbK/HLHIfmFCGCH+b9aB4kg3bR8
	yeIlPZ97Bxn4c/mx3cWcIHNn9Lig/G49/rGjDikvUCnK8MpiB6UVRf0RVoHMqqav
	eXwOoMgXNTSBnBB4ky/v3mRTohwLJC+BHRs4ni4eNaLYKqV81F5THPieNdNtIf7O
	CpNjg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 406wky2vcx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 08 Jul 2024 14:54:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 468DPwcY005016
	for <dtrace@lists.linux.dev>; Mon, 8 Jul 2024 14:54:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 407tvc8j5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 08 Jul 2024 14:54:09 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 468Es7xr014056
	for <dtrace@lists.linux.dev>; Mon, 8 Jul 2024 14:54:08 GMT
Received: from bpf.uk.oracle.com (dhcp-10-175-205-48.vpn.oracle.com [10.175.205.48])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 407tvc8j2a-2;
	Mon, 08 Jul 2024 14:54:08 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v4 2/3] libdtrace: BTF->CTF conversion for kernel modules
Date: Mon,  8 Jul 2024 15:54:03 +0100
Message-ID: <20240708145404.1673045-2-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20240708145404.1673045-1-alan.maguire@oracle.com>
References: <20240708145404.1673045-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_09,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407080111
X-Proofpoint-ORIG-GUID: I3DlCIr4jCiucWM0lWRfKLChAvZPXs-Z
X-Proofpoint-GUID: I3DlCIr4jCiucWM0lWRfKLChAvZPXs-Z

We had logic in place to collect BTF in modules and convert vmlinux
BTF to CTF, but were not doing the same for module BTF.  Add support
to do this, and explicitly set parent dict to "shared_ctf".  With
this in place (along with the support to find the appropriate module
CTF) we can successfully print module-specific types such as:

$ dtrace -n 'fbt::ieee80211_rx_napi:entry { print((struct ieee80211_hw *)arg0); }'
dtrace: description 'fbt::ieee80211_rx_napi:entry ' matched 1 probe
CPU     ID                    FUNCTION:NAME
  6 117489          ieee80211_rx_napi:entry 0xffff9fabc2e688e0 = *
                                            (struct ieee80211_hw) {
                                             .conf = (struct ieee80211_conf) {
                                              .listen_interval = (u16)10,
                                              .long_frame_max_tx_count = (u8)4,
                                              .short_frame_max_tx_count = (u8)7,
                                             },
                                             .wiphy = (struct wiphy *)0xffff9fabc2e683c0,
                                             .rate_control_algorithm = (const char *)0xffffffffc1346ae5,
...

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_btf.c    | 3 ++-
 libdtrace/dt_cg.c     | 1 -
 libdtrace/dt_module.c | 7 ++++++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
index 9e67fd9d..4e1ed9f6 100644
--- a/libdtrace/dt_btf.c
+++ b/libdtrace/dt_btf.c
@@ -715,6 +715,7 @@ dt_btf_to_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp, dt_btf_t *btf)
 
 		if (strcmp(dmp->dm_name, "vmlinux") == 0)
 			goto out;
+		ctf_parent_name_set(ctf, "shared_ctf");
 	}
 
 	if (!btf)
@@ -867,7 +868,7 @@ dt_btf_lookup_name_kind(dtrace_hdl_t *dtp, dt_btf_t *btf, const char *name,
 	 * shared one.
 	 */
 	 if (!dtp->dt_shared_btf) {
-		  dt_btf_load_module(dtp, dtp->dt_exec);
+		  btf = dt_btf_load_module(dtp, dtp->dt_exec);
 
 		  if (!btf)
 			   btf = dtp->dt_shared_btf;
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 2eb2df9c..4206235b 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -2852,7 +2852,6 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
 		dnerror(addr, D_PRINT_SIZE,
 			"print( ) argument #1 reference has type '%s' with size 0; cannot print( ) it.\n",
 			ctf_type_name(fp, type, n, sizeof(n)));
-
 	pfp = dt_printf_create(dtp, dmp->dm_name);
 
 	/* reserve space for addr/type, data/size */
diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
index 5e608446..d8a539af 100644
--- a/libdtrace/dt_module.c
+++ b/libdtrace/dt_module.c
@@ -962,8 +962,8 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 			dt_dprintf("Cannot open CTF archive %s: %s; "
 				   "looking for in-module CTF instead.\n",
 				   ctfa_name, ctf_errmsg(dtp->dt_ctferr));
-#endif
 			return;
+#endif
 		}
 
 		if (dtp->dt_ctfa_path == NULL)
@@ -982,6 +982,11 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 			    "archive: %s; looking for out-of-tree module.\n",
 			    dmp->dm_name, ctf_errmsg(dtp->dt_ctferr));
 		}
+	} else if (dtp->dt_shared_ctf) {
+#ifdef HAVE_LIBCTF
+		/* Have shared CTF via vmlinux BTF; now do BTF->CTF for mod. */
+		dt_kern_module_ctf_from_btf(dtp, dmp);
+#endif
 	}
 
 	if (dmp->dm_ctfp != NULL) {
-- 
2.43.5

