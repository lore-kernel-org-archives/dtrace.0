Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A131E32D6
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 17:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766078644; cv=none; b=BI6IuCWrBbf6tRRzX5e1YuyALeS+Q7Ku7ve9tL2Bo0WTe34NMUTIxJ2YPMuPJqDXsAMCtlQbnQ0FsfnggdcnCvddCGl8qCAqI7Ha7TYaYcqGDYQ3uvn17TOZkoQ8Dz2E9jQsOv2jhqDctNVaScq1dCi0e7ITNf5rl/ClI7px1t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766078644; c=relaxed/simple;
	bh=JuYpF0G9e50BfuYVixYcL2FG3+H/U/kKOutFFq4qEhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NxtKmiivygzVL22i8XL7bnjYIVDbEovGWz04QkydkE0zQXfkqnIIpF0Fu0PlUBAvZ6g5QBOLIS1Vaz5O/PSIbovddhNE+pZrcumkhnqdM+ofQIF/muOE2GA10NP6DFSsIhp8ELngJau3M+S1klYnvg7Z8MSdRBYihY4kARFDCds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lQEb6hxE; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lQEb6hxE"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIDCeGm973531
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 17:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=9cIvo
	zYkuJjnvO0VbsnVE2OZxS0neCodgs95/EX8sCg=; b=lQEb6hxED/e0Rtk28ssY5
	fDMElmmFEM2jTunXD/Q78N6t15xJYzRoG5TD5hqyktNOsao8DA8NgZ95CMnHzfe2
	jpx68IV/iqBVAU2KpX4T4i4vpMg29RhE7lMlVr6A6yQ5mkwlJyRMFn0X2igJBzp/
	eu22oIPnyjHDBiUOxQnzn3YPI/vcaFjeKD51uXdlBTu/JGaOO8wumtRSAJ6j5N1k
	ueBFuMmmAJMcdSB7eumtXnUUdPXWQghdayN2M9AQA3RZJVk4sjG2bB8ZPbtED2iQ
	0d2q+iJzF5OeEDDSSTH2Uh4rX0ZCZGrFe4v3yyJhTSBSpLI9+r9KMFZb73e0RFjB
	w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b47ay949x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 17:23:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIGKGCf016716
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 17:23:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4b0xkpq711-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 17:23:59 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BIHNtSE002775
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 17:23:59 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-104-22.vpn.oracle.com [10.154.104.22])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4b0xkpq6v9-5;
	Thu, 18 Dec 2025 17:23:58 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [RFC patch 4/4] documentation: update stapsdt docs to describe wildcard support
Date: Thu, 18 Dec 2025 17:23:54 +0000
Message-ID: <20251218172354.3206787-5-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251218172354.3206787-1-alan.maguire@oracle.com>
References: <20251218172354.3206787-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 mlxscore=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512180143
X-Authority-Analysis: v=2.4 cv=foDRpV4f c=1 sm=1 tr=0 ts=694438b0 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=yPCof4ZbAAAA:8
 a=EI4N_VSKuyjV7xJ7DrkA:9 cc=ntf awl=host:12110
X-Proofpoint-GUID: h1oYbJD6kyWDBcyEG-5DeiWwY51D8M6l
X-Proofpoint-ORIG-GUID: h1oYbJD6kyWDBcyEG-5DeiWwY51D8M6l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE0MyBTYWx0ZWRfX4/2uEb4uHNhh
 DgR7i/Ak95qJn466jiRcjhUUoFaEIC9TItVKI1RFqotcq3b1wmZEHCpu6Tmulr6QhPSTxPF9j14
 fhscNPrK2VZZWDe3nBMidyX+fE1l2sLC8xrju+aNQVg7uwhD1eUa6vxSTSH3r4kGtwebUD3R8gE
 fIWiqGzcb7OvMnYS4ImrzzQWoAwvXQzQnbQUjkxzf3ZEik2mu5cCcfa9zZAUuzWwql0zyM6SK/g
 Fgtz4v1whui5buEb//ylawOLPPlPY9HdXvo0JyMGBBMB0K/1VoTAIoXTWVqmJI9nv2xeJi0saiE
 1O4TdBZKektuz8urnFDmzCHVWOH4ASI2H4fv9YxgXZEohl27TddFHEsu3Jc6Nt3itM8M3EBtT8t
 aNTWalY3HXaJx2N/FuOnDGbEXycL0TL/CfqwD4yasS2MH9qLHuU=

We now have a limited form of wildcard support; document it.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 .../reference/dtrace_providers_stapsdt.md     | 41 ++++++++++++++++++-
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/doc/userguide/reference/dtrace_providers_stapsdt.md b/doc/userguide/reference/dtrace_providers_stapsdt.md
index cb6ce71f..72bdd7ae 100644
--- a/doc/userguide/reference/dtrace_providers_stapsdt.md
+++ b/doc/userguide/reference/dtrace_providers_stapsdt.md
@@ -52,9 +52,18 @@ DTrace will pass semaphore details to the kernel for reference counting.)
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
+However it should be noted that probes in programs already running at
+the time DTrace is invoked will not fire; only new programs will trigger
+firing.
 
 In your D scripts, the `stapsdt` module name may be `a.out`, just as with
 the [`pid` provider](dtrace_providers_pid.md#dt_ref_pidprobes_prov).
@@ -154,6 +163,34 @@ installs `/usr/bin/dtrace`.  So be sure to have `/usr/sbin`
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
+mentioned above about existing running programs not triggering firing apply.
+
 ## stapsdt Stability <a id="dt_ref_stapsdtstab_prov">
 
 The `stapsdt` provider uses DTrace's stability mechanism to describe its stabilities.
-- 
2.43.5

