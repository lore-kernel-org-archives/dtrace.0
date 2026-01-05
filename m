Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B356833B6FD
	for <dtrace@lists.linux.dev>; Mon,  5 Jan 2026 12:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616061; cv=none; b=Kup+tMWnTxNtQyGVywORtjGDiRK+pMyekE8Ur/pPKiAEPORxpFMoU093xdZhou7WdpAU6EBw2G+dku2yP7R9azoP+bawp7taYZxIc4DnaApa+nRVPmHrDRwOTpf/hspQDeLewnpc+7z7nhtIDrwkNptLq5ax1WzTb/WSfOyhr24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616061; c=relaxed/simple;
	bh=JLU6Yag4du4GSpW3M0fdihgnPVsJo2TH+1o9CrpXI0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q3sSqbYnhv6PtjxS7XezYr9tpT/6HROz/0RegwWeCmf/dChlYzb42qCdqT9R9bD19hTuoF+flaDszU2T9sIEpmRHQmuPbRExWSQLeq+tzBpnbu/8EXyPpEUAmD6Eozi1iUckNSYRjG9A8JZPZW9psckkUqKBG/A++vDmMolMjhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LnXnef4/; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LnXnef4/"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6052nW4K243451
	for <dtrace@lists.linux.dev>; Mon, 5 Jan 2026 12:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=CgqtX
	U86iOtShlXxtlfuFDZLA/r3N7vFgLvOe7zBMQA=; b=LnXnef4/+30UfC926nlr7
	DIBG7lBDJJPhFkKwYV57Vv5hRcV7kKqMf7aMC61VdKiR8pf+GBBRfhrUtMzS7d34
	BdPKsc0YOEFoMooEk73O9k3I0oK4gqf4L8IUhuNZ9D6Tw87JzOKRh1Ks026uHt9z
	e3i7Ao+QjYC7xWDUWLU7e0cUCoDLIm8BikgZ7Pv81yDJ1cRpzqv5x+TXtJnzzYlE
	jGaP0dxeQiSLhDcu+a+lrLSgTjTR4jVoZyv2+Z3yovu5BQYm5+mulFPXe2aw6gux
	1ARcii7rz8xJin731K2mTknUg/w6nSyNq5mRCtpmnfxCGFu/TnxzU0g+Syw3KbrF
	w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bev641kmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 05 Jan 2026 12:27:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 605AWcx6016243
	for <dtrace@lists.linux.dev>; Mon, 5 Jan 2026 12:27:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4besj72qdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 05 Jan 2026 12:27:38 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 605CRTWp034842
	for <dtrace@lists.linux.dev>; Mon, 5 Jan 2026 12:27:37 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-54-206.vpn.oracle.com [10.154.54.206])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4besj72qa8-7;
	Mon, 05 Jan 2026 12:27:37 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2 6/6] documentation: update stapsdt docs to describe wildcard support
Date: Mon,  5 Jan 2026 12:27:28 +0000
Message-ID: <20260105122728.436769-7-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260105122728.436769-1-alan.maguire@oracle.com>
References: <20260105122728.436769-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601050109
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEwOSBTYWx0ZWRfX33TAzAGIK+Ta
 TL0UVQB4PSqHf5AVPO4tookEhd82lYge5aHiK4BfGyJkUR7wfbBHHHdu7nKCGXZq4K+MEavq6G6
 b6NXuByuehPaXDMp3SR6/9aPlHHFdDhkdsP4RKaz9L5Hb2gl8eQ5vaWqnyR0zpbHcyMa6iMDv8R
 M7ICm3HwpS1hotKcN8gQROZXvlHmTBHF6fCFaVPKqAM4fhXc4tdkmQlT3qNKmTsMyTWY8J0XoUx
 qBRZfpl+zbomXVEZ+hEGAwGVhxAO3b2NK4MUc5qSXt5qbT34wI2J5a5ZEcfWXjnSF+WkZ22KhMt
 /qNCBX35F/UK138fEptmFAKiPPWjbBtZKvtyuwrZzzx1MS7/XojXyiIkPFf5BQGbvLcOmcPmx3W
 wKVChFcSTr1tmsys7Mbs2aYFsu45p9OfnxFlHC4IrOIPLlJLNBGkyCmyNEt7nbWC2gAxg1A3PD4
 bJQAnkBm21h+ijWrWmw==
X-Authority-Analysis: v=2.4 cv=W6w1lBWk c=1 sm=1 tr=0 ts=695bae3a cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=yPCof4ZbAAAA:8
 a=EI4N_VSKuyjV7xJ7DrkA:9
X-Proofpoint-GUID: 1VVZVTBCUvSTBNL156A-do4Y1_uSFydZ
X-Proofpoint-ORIG-GUID: 1VVZVTBCUvSTBNL156A-do4Y1_uSFydZ

We now have a limited form of wildcard support; document it.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 .../reference/dtrace_providers_stapsdt.md     | 45 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/doc/userguide/reference/dtrace_providers_stapsdt.md b/doc/userguide/reference/dtrace_providers_stapsdt.md
index cb6ce71f..a7351609 100644
--- a/doc/userguide/reference/dtrace_providers_stapsdt.md
+++ b/doc/userguide/reference/dtrace_providers_stapsdt.md
@@ -52,12 +52,24 @@ DTrace will pass semaphore details to the kernel for reference counting.)
 The `stapsdt` provider also supports probes created dynamically via `libstapsdt`.
 See [https://github.com/linux-usdt/libstapsdt](https://github.com/linux-usdt/libstapsdt).
 
-In your D scripts, the provider name must have the pid for your process
+In your D scripts, two forms of provider specification are supported.
+
+In the first, the provider name must have the pid for your process
 appended.  For the provider shown above, you might have `myprovider12345` for
-pid 12345.  No wildcard may be used, but a symbolic value like `$target` may.
+pid 12345.  A symbolic value like `$target` may be used also.
+
+In the second approach, a wildcard may be used, but it must be used
+in combination with the name of binary or library.  DTrace will use
+PATH or LD_LIBRARY_PATH to find the absolute path and add instrumentation.
+Probes are added on a file basis, so it is vital to specify the correct
+file that contains the probe;  unlike in the per-process case we need to
+know if a probe is delivered in a library or in a program for example.
 
 In your D scripts, the `stapsdt` module name may be `a.out`, just as with
 the [`pid` provider](dtrace_providers_pid.md#dt_ref_pidprobes_prov).
+However as noted above, for a wildcarded pid a filename discoverable
+via PATH or LD_LIBRARY_PATH must be specified so that DTrace can find
+the file to instrument.
 
 In probe names, two consecutive underscores \(`__`\) become a dash \(`-`\)
 just as with USDT probe names.  For example, if a probe is defined in source
@@ -154,6 +166,35 @@ installs `/usr/bin/dtrace`.  So be sure to have `/usr/sbin`
 in front of `/usr/bin` in your path, or explicitly specify
 `/usr/sbin/dtrace` whenever you want to use `dtrace`.
 
+We can also specify systemwide probes; for example when Python 3.6 is
+built `--with-dtrace` we can do the following to show the top 5
+function-entry calls system-wide:
+
+```
+$ sudo dtrace -qn 'python*:libpython3.6m.so::function-entry {
+	@c[execname,stringof(arg0),stringof(arg1)] = count();
+}
+END {
+	trunc(@c, 5);
+	printf("%10s %35s %20s %10s\n", "PROG", "FILE", "FUNC", "COUNT");
+	printa("%10s %35s %20s %@10d\n", @c);
+}'
+^C
+      PROG                                FILE                 FUNC      COUNT
+     tuned   /usr/lib64/python3.6/threading.py             __exit__          5
+     tuned   /usr/lib64/python3.6/threading.py     _acquire_restore          5
+     tuned   /usr/lib64/python3.6/threading.py            _is_owned          5
+     tuned   /usr/lib64/python3.6/threading.py        _release_save          5
+     tuned   /usr/lib64/python3.6/threading.py                 wait         10
+```
+
+So we see the top 5 functions called were all called by `tuned`.
+
+We specified `libpython.3.6m.so` because that is where the probes are
+defined; in some cases they are in the python3 program itself, and cavets
+mentioned above about identifying whether probes are in a library or a
+program (in this case libypthon3.6.m.so or python3.6) apply.
+
 ## stapsdt Stability <a id="dt_ref_stapsdtstab_prov">
 
 The `stapsdt` provider uses DTrace's stability mechanism to describe its stabilities.
-- 
2.43.5

