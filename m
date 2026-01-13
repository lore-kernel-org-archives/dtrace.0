Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493A133CE86
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323111; cv=none; b=GHB+yxfDNJzsYvjv9t6iFJEayFFRRtX6NP2qoTghCu2pLhm3K79UE2e0v6R6c4VF+1ayCZEDXW+rtDBtAS/HoHv6UDoXqtVO9DslxrNtfR+InUCJWMXna2btRqENLyJ+YWqiE0cGFmd1QoP17X0zzgL9eG6GUCHZ+ABlspZwGxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323111; c=relaxed/simple;
	bh=2a9gK0uXp3tvBqCoBaqB7TAOHNjEFPzSKSqtWXnmVGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sQpthPFpDbL1CZjN6NTg7+C9TUW+5xQshoWq4TyU88vhTi8GNiEfuGN7ed2LS4e5YqvLEr4jo6fibaLzfEVjmb5g2rq2MDXQjaewlK49WXI9tYUMhp+endSk7MIXR3UF5MuJwJZQBHy/CHfPt5KHB9e7zKKUvB373dfUnH6gyT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=C6sS0R25; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="C6sS0R25"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DGKSv52682266
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=r8qxx
	J05qiw9+EdUjXewsatl57XOj41kUVIehaysL+Q=; b=C6sS0R25DhRF/fOXm3g6S
	CMe2RUhaulEnwCR6JmEdzj9YwpRz4XqcryGIb176d1yPaYPwKO1geMm/oAwdK9BS
	0q5c76sKdbIVagk8YfAtOf3HQAyckWmDEMSREKS1SdUbfotJYu7GQR9j2HrHHWg3
	Ev3vTa7xCO/dv1dsKF1d2x0SGAmxFANgCIBIHbfVS2jZJ39zYXZfUqfxedX2tEFs
	CvpBJ77zq4cMgrYnoYFy/AH9BwRocL/8g5dlXaFzRY2P3YSDIEkp8pGwE2AMA050
	/0AhO/DhzSE3RY+QDjhUB9WXKvWZH6g/cg/fF8A4t7HmndrJNQUJd+o7iBTwbgv+
	A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkntb3tq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60DGVx0p004548
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd78xk0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:46 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60DGpYBP031305
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 16:51:46 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-50-89.vpn.oracle.com [10.154.50.89])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4bkd78xjpd-10;
	Tue, 13 Jan 2026 16:51:46 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v3 9/9] documentation: update stapsdt docs to describe wildcard support
Date: Tue, 13 Jan 2026 16:51:32 +0000
Message-ID: <20260113165132.2454591-10-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260113165132.2454591-1-alan.maguire@oracle.com>
References: <20260113165132.2454591-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601130140
X-Proofpoint-GUID: 5FYRhFpy3kSbNlY26c3mfWDzpG6fLaFQ
X-Proofpoint-ORIG-GUID: 5FYRhFpy3kSbNlY26c3mfWDzpG6fLaFQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX2L0HEPprMxCY
 DRlReEA62dLd1r8/ICgXTYWjnrXwM8uQJbLlOdWgKccdd7vsjYcQSlz/HHbgz9Ox+X1UK3/mIrM
 Rh9lXiN5lclSg7Vslw72xu3l3QquIWNY4LKrsGugnJQfReOmUnOqQHP44EhCVHqwEG1voXmF63t
 HpBhPMo2PfkWk7veT8PcP0vtIl5yHh6yc/WC4i4c4YG1xAC0o/Wrp6zo48NpMub8tb6MBvWp3oJ
 QhdiCxYmBk/dXnFzZDqwuDSwjngExHSbCAxRE6xqccv5RDyaUO8dSINGeF8FvJgDs2Q0LMNGFbd
 q3T9yh7x/EzELIYwRsk4XHudVomP8IDZt5Q/t0MnJz/Tb8v/5Om217jmtoHQDWPm2zKxTCD8dst
 d/3dy6x6jeUEIH2v2NrEpf7/zVeGEyhu/o1QO7bvhe80HYZ/q+99Hl9EzX5VpaeV4alDeW/mA9Z
 H47xZgT5StAnZQ/DBfA==
X-Authority-Analysis: v=2.4 cv=fIc0HJae c=1 sm=1 tr=0 ts=69667823 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=yPCof4ZbAAAA:8
 a=cF8aGwtCRSdHDG5f6dIA:9

We now have a limited form of wildcard support; document it.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 .../reference/dtrace_providers_stapsdt.md     | 54 ++++++++++++++++++-
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/doc/userguide/reference/dtrace_providers_stapsdt.md b/doc/userguide/reference/dtrace_providers_stapsdt.md
index cb6ce71f..b91a9d23 100644
--- a/doc/userguide/reference/dtrace_providers_stapsdt.md
+++ b/doc/userguide/reference/dtrace_providers_stapsdt.md
@@ -52,12 +52,25 @@ DTrace will pass semaphore details to the kernel for reference counting.)
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
+in combination with the path or name of binary or library.  In the case
+where only a binary or library name is specified, DTrace will use
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
@@ -147,6 +160,13 @@ Displaying notes found in: .note.stapsdt
     Arguments: -4@-4(%rbp) 8@%rax -4@$18
 ```
 
+Alternatively we can list the probes in the object via DTrace
+provided we know the provider name:
+
+```
+$ dtrace -lm 'myprovider*:/path2/a.out'
+```
+
 Notice that the instrumented source code includes the header file
 `<sys/sdt.h>`.  On Oracle Linux, this file is installed
 by the RPM package `systemtap-sdt-devel`, but the package also
@@ -154,6 +174,36 @@ installs `/usr/bin/dtrace`.  So be sure to have `/usr/sbin`
 in front of `/usr/bin` in your path, or explicitly specify
 `/usr/sbin/dtrace` whenever you want to use `dtrace`.
 
+We can also specify systemwide probes for tracing; for example when
+Python 3 is built `--with-dtrace` we can do the following to show the top 5
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
+program (in this case libypthon3.6.m.so or python3.6) apply.  To determine
+probe location we can use `dtrace -lm` as described above.
+
 ## stapsdt Stability <a id="dt_ref_stapsdtstab_prov">
 
 The `stapsdt` provider uses DTrace's stability mechanism to describe its stabilities.
-- 
2.43.5

