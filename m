Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC486384258
	for <dtrace@lists.linux.dev>; Wed,  4 Mar 2026 08:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611299; cv=none; b=NLJAHdYoIpJiKl+X4MDm6yaRa5lEmLAQ9AsmkT49ajiu/Zw5m5nuLClX6iqvDV0wiClY+NH96xiV5O9F5LHpyKs7Xf0BiG8uCZUPho7Lricu1iBGuC8joitEMTq8jGISilZzZFP28EBfscuBocoDhGRAtbUXdLe6W2QRb8H3AJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611299; c=relaxed/simple;
	bh=nsfLcDNOBB1EsCNf0FfbMORSVipg1+/DOn7t+Npe4m4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dsrm4PIscA+wAuMCLBviVS3DANu9CzvvpNr6DdKlikyPNxf3HaQuogLxPBdHnamXkjhbPacu+rP7Eze33agDTiLCfmDZXIzayZZbS+4yKchLSkEruuAIs6UwxgQoueoc5yaxMqmWe9i+BgcnDMjMXBz48G4L+T+6VqtDIwCdV/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SFqzCYKp; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SFqzCYKp"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6247mXvB2028758
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=4wEH+
	kkXiByPa9dMM4wmM8N5Xc6ggJqOQ51Yr84YS9c=; b=SFqzCYKpioXfDOKVgfFnl
	JV4meFOA8mS14TRAvkil7Soe6xmKSQiUO8jx9JAvw7GFqz6frOBqU3yS8/2iQupz
	E+fZoYHbdaWvF9+WnfBIAwXr3mhAxepq2EbMi2vo0bIDZqgfGzR0vbGO75YidedA
	JaQw8D90Yjw0/1KowiKSwB9jRMC2G23gANeVFRcd1hs0b3ilL6VxDzzg+rIbyyR8
	c0rrWGukgh+uoJNAfK+a04bk635h0aWx9CHAw6ISkZSC+bdtRRUb3NXR7gclHT77
	1vPBXuvQpE24M9SiUF03G0vKMVJPvV42qAYO+KNbj+Cq6nILlk5SMFuXSOkHgqF9
	g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cpgnqg0mq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 08:01:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6246oT3J001413
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:01:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ckptfs339-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 08:01:36 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62481RZ0023337
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:01:35 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-62-133.vpn.oracle.com [10.154.62.133])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4ckptfs2t1-10;
	Wed, 04 Mar 2026 08:01:35 +0000
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v5 9/9] documentation: update stapsdt docs to describe wildcard support
Date: Wed,  4 Mar 2026 08:01:25 +0000
Message-ID: <20260304080125.649031-10-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260304080125.649031-1-alan.maguire@oracle.com>
References: <20260304080125.649031-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603040063
X-Proofpoint-GUID: CDpN4yMPhkgXjEH6M6-YHyNKBWMG8ioa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2MyBTYWx0ZWRfX76BViyDtUVSo
 gg8lUJ9TVZaSfrEmuXcwPH3gpGFDD4tI+5FXnQofRtzOGeguG9yVwZanIMgEOJDf7ofAyhWWqEE
 ErGzrnS8QHa7QNHYgMqM90PmVA6jsPMCxKrwtHglFT2AWxwuQxvj+2IfoigIUmbPN3HC5mKeT6p
 6LHjZRn81l3NXXBIi0Grt1SSWvM2kp4CblEP6HmPFYFvKLdnM/yg+FNb5wN4WXyN9vL52QiWl1G
 oMs+ozeB+HOoCQFEotmH4BYj9DODrH21pFbTvFokiiXsv49KJUhx9Jg1goxNcYphXWcR6tsXACs
 p80kaWcNkqVt68/0ChqtwdN7QMsF9fI/y/OvneRW+sPf/92MpiYLlYwSjFxa5T+BVPQpRpQ3hPA
 nFLBX72j5ZbDDcURKQuLVAoQYHOJhb/pRkUIm4bKxcj8HBapQUIg2eomYz16UD43w0tvCCyn1qs
 syPwipoPCefiGY7wLSA/jppFJOSuWLCJR1UjkOCQ=
X-Proofpoint-ORIG-GUID: CDpN4yMPhkgXjEH6M6-YHyNKBWMG8ioa
X-Authority-Analysis: v=2.4 cv=HfsZjyE8 c=1 sm=1 tr=0 ts=69a7e6e0 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=o5oIOnhZENCTenyL_yNV:22 a=NEAV23lmAAAA:8 a=yPCof4ZbAAAA:8
 a=ZHZ1eBgCrRVMDcHVjPQA:9 cc=ntf awl=host:13812

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

