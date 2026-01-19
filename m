Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D2D37F74E
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768832617; cv=none; b=Lw7hS3qo8WHBMb7JuEro8tr1jLFyr6QzEsHy1mXypC5iq99jCaLwZGUQ81a3EFc6YEqMKg3GugyXd1uCLa1WLx4MGs5Nz3CyQCQVm/MvJWMhQmZ5x2I4SmVBmrik8pCApj9JZ4AVH7sDDiItMBCBzI8QUomWkk9/SPADZMCBcog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768832617; c=relaxed/simple;
	bh=nsfLcDNOBB1EsCNf0FfbMORSVipg1+/DOn7t+Npe4m4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S5lv+7y6UQJu1yrjDwhPqfi2Smb9eBpumKTMqTR4m2JI8W0odzRmuOONOjB3WiaYGqg5/SuIorWfIVTGjj6wIPsFyFob72ZJkE2SSvs+BTin6uIFf5gZHiRAMKB0zO68sX9+cdOcft/T9BTV7YgCWBsVkjcFCDX8C4Cu1I4tg5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YQ87xGYz; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YQ87xGYz"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JBDhf41342126
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=4wEH+
	kkXiByPa9dMM4wmM8N5Xc6ggJqOQ51Yr84YS9c=; b=YQ87xGYzfvTKvJqfXIBSQ
	oSWlx6QIlcgk7x9OidIl3BMBa4wTIQzmkWTDXn4DxayoS68OseE8QCBlVakALpjT
	oKx32prKD6Ova6HJ0aYt80Q0ZOouA+4cKe9NbNh08z4w04sgR7R2UAv5414rkB0G
	i37l6fYDguH7JM3jeCsQALQbPWS0kiHzVciFtFmbTy6I1D2X6c0xFk4xlPITJQNI
	D6QfRtVoctTTn6qOekEPNBl+CMCwoCaoXjQSaZUqDIUpc3nyMg8orYhxT1qxPA84
	FQJTTJiV7idvFZ27cngFlLt7fl2cLFlGTDWOA2n2LAwfV/Bzx2IUYeumWkHZlfU4
	g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4br170acvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60JCa5bm022548
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4br0vc6ywh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:34 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60JEIDjv015145
	for <dtrace@lists.linux.dev>; Mon, 19 Jan 2026 14:23:33 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-51-213.vpn.oracle.com [10.154.51.213])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4br0vc6ye3-10;
	Mon, 19 Jan 2026 14:23:33 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v4 9/9] documentation: update stapsdt docs to describe wildcard support
Date: Mon, 19 Jan 2026 14:23:00 +0000
Message-ID: <20260119142300.975014-10-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260119142300.975014-1-alan.maguire@oracle.com>
References: <20260119142300.975014-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601190120
X-Proofpoint-ORIG-GUID: GeGhqUgueGhkdeqKizmUjmbqnyvNKGzT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEyMCBTYWx0ZWRfXxs1pl+wsXJr0
 KEuxNYQTcfTW3/i2+dffgRldizAISFkHBzb69G9ijwzxdwqk8Ik/Tt1i7nitVQA0Vql8ym5/hnQ
 DQ6h29R8LOdeWTyaWSjWMxJwCM49pn8td9ApOAS0DkFPzmuWSN1KvNBuvZVLANZ/yInsuV+oFHD
 48Mx71scgQrP27zi3vL3EBTrUjK+xwSnUgss3+wqlAc70QIeDzgdCnXmHvZ2mkC8qt+/uZFnBiQ
 jUz0GQXTVB7IwlktFVaGNvOuS/ogOityGcxiWozmNV9zDYtjq2BoLj4dUBQwJqskI9KI9roaotk
 hK1Wu7j/QOjO1iDt1pvEFw5Z5j/wOufV99NPKrcARIZbeSj28bsSEXZO1liWbX3dFR8bQbj5P/D
 5fjLGqvysmo1Nz4zE5kRK6At1MNJXfG/RBWyCDXQeOs5V4zsGMpESK3S0l6Stkeq+y6mDz6tD6v
 5JuAdEcRPPs+AH8ckQblCLY9EaDVsV6/mrizzd3U=
X-Proofpoint-GUID: GeGhqUgueGhkdeqKizmUjmbqnyvNKGzT
X-Authority-Analysis: v=2.4 cv=FvoIPmrq c=1 sm=1 tr=0 ts=696e3e66 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=yPCof4ZbAAAA:8
 a=ZHZ1eBgCrRVMDcHVjPQA:9 cc=ntf awl=host:12109

We now have a limited form of wildcard support; document it.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 .../reference/dtrace_providers_stapsdt.md     | 91 ++++++++++++++++++-
 1 file changed, 86 insertions(+), 5 deletions(-)

diff --git a/doc/userguide/reference/dtrace_providers_stapsdt.md b/doc/userguide/reference/dtrace_providers_stapsdt.md
index cb6ce71f..9bbeb060 100644
--- a/doc/userguide/reference/dtrace_providers_stapsdt.md
+++ b/doc/userguide/reference/dtrace_providers_stapsdt.md
@@ -29,9 +29,29 @@ library source code as follows:
 #define _SDT_HAS_SEMAPHORES 1
 #include <sys/sdt.h>
 
+/* This complicated declaration of semaphores is needed to ensure that
+ * they work correctly; the kernel manages the semaphore count.
+ * The first three definitions simplify semaphore definiton and use;
+ * after these are defined, new semaphores are added by adding
+ *
+ * SEMA_DEFINE(provider_probename_semaphore);
+ *
+ * and used to guard probes with
+ *
+ * if (SEMA_ENABLED(provider_probename_semaphore)) ...
+ */
+#define SEC(name) __attribute__((section(name), used))
+#define SEMA_DEFINE(name)						\
+	__extension__ unsigned short name __attribute__((unused))	\
+	SEC(".probes")
+#define SEMA_ENABLED(name)                                      \
+        __builtin_expect (name, 0)
+
+SEMA_DEFINE(myprovider_myprobe_semaphore);
+
 unsigned short myprovider_myprobe_semaphore = 0;
 
-        if (myprovider_myprobe_semaphore) {
+        if (SEMA_ENABED(myprovider_myprobe)) {
             STAP_PROBEn(myprovider, myprobe, ...);
         }
 ```
@@ -52,12 +72,25 @@ DTrace will pass semaphore details to the kernel for reference counting.)
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
@@ -73,12 +106,19 @@ might place in application or library source code:
 #define _SDT_HAS_SEMAPHORES 1
 #include <sys/sdt.h>
 
-unsigned short myprovider_myprobe_semaphore = 0;
+#define SEC(name) __attribute__((section(name), used))
+#define SEMA_DEFINE(name)                                               \
+	__extension__ unsigned short name __attribute__((unused))       \
+	SEC(".probes")
+#define SEMA_ENABLED(name)                                      \
+	__builtin_expect (name, 0)
+
+SEMA_DEFINE(myprovider_myprobe_semaphore);
 
 int
 main(int argc, char **argv)
 {
-    if (myprovider_myprobe_semaphore) {
+    if (SEMA_ENABLED(myprovider_myprobe_semaphore)) {
         printf("the probe is enabled\n");
         [... do something expensive to prepare probe arguments? ...]
         STAP_PROBE3(myprovider, myprobe, argc, argv[0], 18);
@@ -147,6 +187,13 @@ Displaying notes found in: .note.stapsdt
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
@@ -154,6 +201,40 @@ installs `/usr/bin/dtrace`.  So be sure to have `/usr/sbin`
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
+DTrace will expand the paths of programs and libraries using
+PATH and LD_LIBRARY_PATH respectively; the absolute path can
+also be used if needed.
+
 ## stapsdt Stability <a id="dt_ref_stapsdtstab_prov">
 
 The `stapsdt` provider uses DTrace's stability mechanism to describe its stabilities.
-- 
2.43.5

