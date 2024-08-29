Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47591BAEC5
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 20:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724962569; cv=none; b=bQVHFGhmRRv1G2ln3qC8/irXb8eqqrYJbe+7563x2n4VEmx0v+4jzrCf9z2LrXZVI4RNRvzEsOIHHdw02y4mcirF2FHxrJCiFThs0WmH1X1yYLQ1v1mY+SK4DWE+L1Teae+o9brlYk6jIb+6EjLv/ycVBLdChF9Oq9FKEk1B7j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724962569; c=relaxed/simple;
	bh=HK4JnYr76xSZFAzqjtkBUyXAVk+Wq7wl76T4mi15xGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tkf2bfMKKKooE0jzA4oPB9qj4kMyQrlg51rOM20OJVnwbd40dx8LdYy8xecH6cOboecBEAir8gogLJ/edUxd5kLxzJohPFwGbD8P8l9f0NdukRN2LPZEOza7oLkhPgXs5MyeEz7dGTMGh0rSoswGcXEWjWcKWtjxvYvbSzfmF9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: dtrace@lists.linux.dev
Cc: Sam James <sam@gentoo.org>
Subject: [PATCH 5/6] test: libproc: cater to merged-usr systems
Date: Thu, 29 Aug 2024 21:15:45 +0100
Message-ID: <db453ea9d3bad48b505c31c733c5460b6bfecdb7.1724962546.git.sam@gentoo.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <7a1c6618639a057dc267d2e0dc9c9d8afea6b0b1.1724962546.git.sam@gentoo.org>
References: <7a1c6618639a057dc267d2e0dc9c9d8afea6b0b1.1724962546.git.sam@gentoo.org>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On merged-usr systems (where /lib -> /usr/lib and so on), we get spurious
failures like in tst.plddCreate.r:
```
-: dyn {ptr}, bias {ptr}, LMID 0: symbol search path:  (, /lib64/libc.so.6, /lib64/ld-linux-x86-64.so.2)
-/lib64/libc.so.6: dyn {ptr}, bias {ptr}, LMID 0: inherited symbol search path:  (, /lib64/libc.so.6, /lib64/ld-linux-x86-64.so.2)
-/lib64/ld-linux-x86-64.so.2: dyn {ptr}, bias {ptr}, LMID 0: inherited symbol search path:  (, /lib64/libc.so.6, /lib64/ld-linux-x86-64.so.2)
+: dyn {ptr}, bias {ptr}, LMID 0: symbol search path:  (, /usr/lib64/libc.so.6, /lib64/ld-linux-x86-64.so.2)
+/usr/lib64/libc.so.6: dyn {ptr}, bias {ptr}, LMID 0: inherited symbol search path:  (, /usr/lib64/libc.so.6, /lib64/ld-linux-x86-64.so.2)
+/lib64/ld-linux-x86-64.so.2: dyn {ptr}, bias {ptr}, LMID 0: inherited symbol search path:  (, /usr/lib64/libc.so.6, /lib64/ld-linux-x86-64.so.2)
3 libs seen.
```

sed out the difference.
---
 test/internals/libproc/tst.plddCreate.r.p      | 3 +++
 test/internals/libproc/tst.plddCreate32.r.p    | 3 +++
 test/internals/libproc/tst.plddCreatePIE.r.p   | 3 +++
 test/internals/libproc/tst.plddCreatePIE32.r.p | 3 +++
 test/internals/libproc/tst.plddGrab.r.p        | 3 +++
 test/internals/libproc/tst.plddGrab32.r.p      | 3 +++
 test/internals/libproc/tst.plddGrabPIE.r.p     | 3 +++
 test/internals/libproc/tst.plddGrabPIE32.r.p   | 3 +++
 8 files changed, 24 insertions(+)
 create mode 100755 test/internals/libproc/tst.plddCreate.r.p
 create mode 100755 test/internals/libproc/tst.plddCreate32.r.p
 create mode 100755 test/internals/libproc/tst.plddCreatePIE.r.p
 create mode 100755 test/internals/libproc/tst.plddCreatePIE32.r.p
 create mode 100755 test/internals/libproc/tst.plddGrab.r.p
 create mode 100755 test/internals/libproc/tst.plddGrab32.r.p
 create mode 100755 test/internals/libproc/tst.plddGrabPIE.r.p
 create mode 100755 test/internals/libproc/tst.plddGrabPIE32.r.p

diff --git a/test/internals/libproc/tst.plddCreate.r.p b/test/internals/libproc/tst.plddCreate.r.p
new file mode 100755
index 00000000..51f27ca6
--- /dev/null
+++ b/test/internals/libproc/tst.plddCreate.r.p
@@ -0,0 +1,3 @@
+#!/bin/sed -f
+# Handle merged-usr systems where /lib == /usr/lib.
+s:/usr/lib:/lib:g
diff --git a/test/internals/libproc/tst.plddCreate32.r.p b/test/internals/libproc/tst.plddCreate32.r.p
new file mode 100755
index 00000000..51f27ca6
--- /dev/null
+++ b/test/internals/libproc/tst.plddCreate32.r.p
@@ -0,0 +1,3 @@
+#!/bin/sed -f
+# Handle merged-usr systems where /lib == /usr/lib.
+s:/usr/lib:/lib:g
diff --git a/test/internals/libproc/tst.plddCreatePIE.r.p b/test/internals/libproc/tst.plddCreatePIE.r.p
new file mode 100755
index 00000000..51f27ca6
--- /dev/null
+++ b/test/internals/libproc/tst.plddCreatePIE.r.p
@@ -0,0 +1,3 @@
+#!/bin/sed -f
+# Handle merged-usr systems where /lib == /usr/lib.
+s:/usr/lib:/lib:g
diff --git a/test/internals/libproc/tst.plddCreatePIE32.r.p b/test/internals/libproc/tst.plddCreatePIE32.r.p
new file mode 100755
index 00000000..51f27ca6
--- /dev/null
+++ b/test/internals/libproc/tst.plddCreatePIE32.r.p
@@ -0,0 +1,3 @@
+#!/bin/sed -f
+# Handle merged-usr systems where /lib == /usr/lib.
+s:/usr/lib:/lib:g
diff --git a/test/internals/libproc/tst.plddGrab.r.p b/test/internals/libproc/tst.plddGrab.r.p
new file mode 100755
index 00000000..51f27ca6
--- /dev/null
+++ b/test/internals/libproc/tst.plddGrab.r.p
@@ -0,0 +1,3 @@
+#!/bin/sed -f
+# Handle merged-usr systems where /lib == /usr/lib.
+s:/usr/lib:/lib:g
diff --git a/test/internals/libproc/tst.plddGrab32.r.p b/test/internals/libproc/tst.plddGrab32.r.p
new file mode 100755
index 00000000..51f27ca6
--- /dev/null
+++ b/test/internals/libproc/tst.plddGrab32.r.p
@@ -0,0 +1,3 @@
+#!/bin/sed -f
+# Handle merged-usr systems where /lib == /usr/lib.
+s:/usr/lib:/lib:g
diff --git a/test/internals/libproc/tst.plddGrabPIE.r.p b/test/internals/libproc/tst.plddGrabPIE.r.p
new file mode 100755
index 00000000..51f27ca6
--- /dev/null
+++ b/test/internals/libproc/tst.plddGrabPIE.r.p
@@ -0,0 +1,3 @@
+#!/bin/sed -f
+# Handle merged-usr systems where /lib == /usr/lib.
+s:/usr/lib:/lib:g
diff --git a/test/internals/libproc/tst.plddGrabPIE32.r.p b/test/internals/libproc/tst.plddGrabPIE32.r.p
new file mode 100755
index 00000000..51f27ca6
--- /dev/null
+++ b/test/internals/libproc/tst.plddGrabPIE32.r.p
@@ -0,0 +1,3 @@
+#!/bin/sed -f
+# Handle merged-usr systems where /lib == /usr/lib.
+s:/usr/lib:/lib:g
-- 
2.46.0

