Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA3C3B71DB
	for <dtrace@lists.linux.dev>; Fri,  5 Jun 2026 22:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697549; cv=none; b=kNGfT/4gE3HSHlEFK8LdJQS2behYIsT7X5hnaxXKpG8cxp9ibipoNqaON7ktdi/9CIlefpJwWWGBwkycWwcpE4g+QlfJpWDMmPgSw3IEVwVeVllVxG0aDQeyNG6/AKDlWq7nJB9KHdoMQ1bHcIJhPTO04jk7bH2UW20u91A1Zfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697549; c=relaxed/simple;
	bh=PyJvByE+IZaRxtplNTUK9jKIX0v6HqJZ+uQqpuOFRSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GonVqE+KBCBWOvZPATTMZNePvFWWxFbQSCMZMW5CMnxn7DukDlj0EjRmG/Tp70/7UKN69/XlwKXoHVudiEcdb5Xu+KU0fGzFQs18+35iu7OYch2de/z1XdBvJvU9+5S+ZqOTBOQuVVtdKMUvUJN6AHzq0iEuvchzlC2ylNm+/VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=X9A3bP4k; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="X9A3bP4k"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 655IY1IC461404;
	Fri, 5 Jun 2026 22:12:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=k1bO7
	tBNdPmnaoYfYO7Ck10NQKbCpmH7jFgXyCeE1dM=; b=X9A3bP4kREskDvMWTn/IR
	DgGkbN5a7iNoGwQH+wxYZoqB1lq47NQGVo01CV5A6ZWX6fz9EUIrqdV3ZO0jB3bI
	jogjYA4Gqnh/E9LoGUA2jRXsZ0zejtbD0vxreH3p7LXyH60VgID6jL0LnIWzvsnW
	C/TVJdVUWCGlkr6PSo+ewwQtwDABwNz2SJWLIZtnQ1Jat6NAyGNSWuNg58Mmq5yG
	omrpOwVkwTbPhj2YoH+/SM1KqyT6NVoGcUqgcCxoPG1HOjntaRpwcKMW6whwo2Qy
	3aV8799hDJMeVz9zFFfSWyij8cGBOIbL1jMLidcnkHRttEuJAImV4TKrFg/4enNg
	w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4efresawe8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Jun 2026 22:12:26 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 655MAPgB032941;
	Fri, 5 Jun 2026 22:12:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ek326nvy8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Jun 2026 22:12:25 +0000 (GMT)
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 655MCIv1039322;
	Fri, 5 Jun 2026 22:12:25 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-53-60.vpn.oracle.com [10.154.53.60])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4ek326nvu6-7;
	Fri, 05 Jun 2026 22:12:25 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>,
        OpenAI Codex <codex@openai.com>
Subject: [PATCH 6/6] docs: document uresolve() in the user guide
Date: Fri,  5 Jun 2026 23:12:17 +0100
Message-ID: <20260605221217.1211791-7-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260605221217.1211791-1-alan.maguire@oracle.com>
References: <20260605221217.1211791-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2605130000 definitions=main-2606050219
X-Authority-Analysis: v=2.4 cv=U4Wiy+ru c=1 sm=1 tr=0 ts=6a2349cb b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=7Gl3-_t3PgB9XO-mQDs3:22 a=yPCof4ZbAAAA:8 a=LG5T7v2SAAAA:8
 a=Ws15UCKapOs3Jd-tdHgA:9 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22
 cc=ntf awl=host:12313
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDIxOSBTYWx0ZWRfX/MBvnZmzQeOT
 HhTzwXKQ9BHHUIaOFdBUDF1NnS7XOttUgCo8YSiy8GJpd8AHgRZIA0WXjc6G+MumKhQlFC7MwB3
 ODcbY8bhRH2a2JCtynaJ9BzlGOW4o56mtPvX4zBAUY9tSxECDsJ5b8o6Q8p9h6ObIfIGvlLJZku
 8t5jJuFSckLzuNhxrx/GUbKG57zdUcTJpXMar6JCAWHzWImcRu+mVLSiOuJTidCWdi1f5YEVb58
 Dz7hjsSQ5HlOy1h0JvX/WMI1j6n4xzDb1k8QQ2S8TxL+XAGGUrF5JMSml0WL2Bt0oUhkvDpOJn3
 o6UvlYm3yO1ZfvBeUNT4XDCxCIuNVt5QXmDqm/nNru6Gh9Xg1U8IgHcfzvW7xIlgzkrsENbYRdq
 izNgKstvkH+lI9La3a4ehhSLrZqa/qhEQueIwP5ZDOHp5gkIX3ZIEZFPQKA1f/ohCK1Cy5N04+6
 k5XBB6svLmxig+Rxwl+BRifVU/nwV/7P4l4nwVCI=
X-Proofpoint-ORIG-GUID: ow5YN76x-nqxTVIIaLtfyikJrTi42mkx
X-Proofpoint-GUID: ow5YN76x-nqxTVIIaLtfyikJrTi42mkx

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
Assisted-by: OpenAI Codex (GPT-5) <codex@openai.com>
---
 doc/userguide/index.md                       |  1 +
 doc/userguide/reference/dtrace_functions.md  |  4 ++
 doc/userguide/reference/function_uresolve.md | 61 ++++++++++++++++++++
 3 files changed, 66 insertions(+)
 create mode 100644 doc/userguide/reference/function_uresolve.md

diff --git a/doc/userguide/index.md b/doc/userguide/index.md
index 3bf731c6..348ecc8c 100644
--- a/doc/userguide/index.md
+++ b/doc/userguide/index.md
@@ -181,6 +181,7 @@
     -   [tracemem](reference/function_tracemem.md)
     -   [trunc](reference/function_trunc.md)
     -   [uaddr](reference/function_uaddr.md)
+    -   [uresolve](reference/function_uresolve.md)
     -   [ufunc](reference/function_ufunc.md)
     -   [umod](reference/function_umod.md)
     -   [ustack](reference/function_ustack.md)
diff --git a/doc/userguide/reference/dtrace_functions.md b/doc/userguide/reference/dtrace_functions.md
index 7bf37794..021e599d 100644
--- a/doc/userguide/reference/dtrace_functions.md
+++ b/doc/userguide/reference/dtrace_functions.md
@@ -191,6 +191,8 @@ Functions can be grouped according to their general use case and might appear in
 
     -   [`uaddr`](function_uaddr.md): Prints the symbol for a specified address.
 
+    -   [`uresolve`](function_uresolve.md): Returns the process-specific address of a user-space symbol.
+
     -   [`ufunc`](function_ufunc.md): Prints the symbol for a specified user space address. An alias for `usym`.
 
     -   [`umod`](function_umod.md): Prints the module name that corresponds to a specified user space address.
@@ -398,6 +400,8 @@ Returns a string translation of a hardware address.
  Truncates keys from an aggregation.
 -   **[uaddr](../reference/function_uaddr.md)**  
  Prints the symbol for a specified address.
+-   **[uresolve](../reference/function_uresolve.md)**
+ Returns the process-specific address of a user-space symbol.
 -   **[ufunc](../reference/function_ufunc.md)**  
  Prints the symbol for a specified user space address. An alias for `usym`.
 -   **[umod](../reference/function_umod.md)**  
diff --git a/doc/userguide/reference/function_uresolve.md b/doc/userguide/reference/function_uresolve.md
new file mode 100644
index 00000000..3241ecfa
--- /dev/null
+++ b/doc/userguide/reference/function_uresolve.md
@@ -0,0 +1,61 @@
+
+# uresolve
+
+Returns the process-specific address of a user-space symbol.
+
+```
+uintptr_t uresolve(string symbol[, uintptr_t fallback])
+```
+
+The `uresolve` function resolves a symbol in the user-space object that's associated with the current user-space probe and returns the address of that symbol in the process that fired the probe. The result is a user-space address and is typically passed to functions such as [`copyin`](function_copyin.md) or [`copyinstr`](function_copyinstr.md).
+
+The *symbol* argument must be a string constant. It can use either of these forms:
+
+-   `symbol`: Resolve *symbol* in the object associated with the current probe.
+
+-   ``object`symbol``: Resolve *symbol* in the named object. The object name can be a full path or a module name such as `a.out` or `libc.so.6`.
+
+When a target process is specified with `-c` or `-p`, DTrace can use that process and its `/proc` mappings to find the symbol's object-relative offset. For system-wide user-space probes, DTrace can use the probed object file instead. In both cases, the address returned at probe firing is computed for the process that fired the current probe, so the result remains valid across ASLR and across different processes that map the same object at different addresses.
+
+If *fallback* is supplied and the symbol lookup fails, `uresolve` returns the fallback value. If *fallback* isn't supplied, failing to resolve the symbol is a compilation error.
+
+`uresolve` is intended for user-space probe contexts, such as `pid`, USDT, and `stapsdt` probes, where DTrace can identify the current probed user object. It doesn't read memory by itself and doesn't verify that the returned address is readable. Use `copyin` or `copyinstr` to read data from the returned address.
+
+## How to use uresolve to read a user-space variable
+
+This example resolves the global variable `my_counter` in the target program, reads its value, and prints it when `update_counter` is entered:
+
+```
+pid$target:a.out:update_counter:entry
+{
+        this->addr = uresolve("a.out`my_counter");
+        this->value = (int *)copyin(this->addr, sizeof(int));
+        printf("my_counter = %d\n", *this->value);
+}
+```
+
+## How to use uresolve with system-wide user-space probes
+
+This example resolves `_PyThreadState_Current` in each process that fires the Python function-entry probe. The address is computed for the process that fired the probe:
+
+```
+python*:libpython3.6m.so::function-entry
+{
+        this->addr = uresolve("_PyThreadState_Current", 0);
+        this->statep = (uintptr_t *)copyin(this->addr, sizeof(uintptr_t));
+        printf("%d %p\n", pid, *this->statep);
+}
+```
+
+The fallback value of `0` lets the script compile and run on systems or Python builds where the symbol isn't present. If the fallback is returned, the subsequent `copyin` would attempt to read from address 0, so real scripts should guard that case before reading:
+
+```
+python*:libpython3.6m.so::function-entry
+/(this->addr = uresolve("_PyThreadState_Current", 0)) != 0/
+{
+        this->statep = (uintptr_t *)copyin(this->addr, sizeof(uintptr_t));
+        printf("%d %p\n", pid, *this->statep);
+}
+```
+
+**Parent topic:** [DTrace Function Reference](../reference/dtrace_functions.md)
-- 
2.43.5

