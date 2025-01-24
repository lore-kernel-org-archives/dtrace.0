Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F340D40BF5
	for <dtrace@lists.linux.dev>; Fri, 24 Jan 2025 02:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737687063; cv=none; b=g7ANiHU3VmG+MAGHu03a6xpXuFkI7I94ayoiopi9/YJQRPx/1JiKxMHBDYKbeasiapviL4Jv4vcpZdbeP2KWW/NMQg4IoTN+VOkWQciS8HRlIsb3Wd6v+0M3+XAUVM7RPIruuH3GVfMMZE3kFDLdIDCbHfIm6S6k2PNe9pr66PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737687063; c=relaxed/simple;
	bh=tPZ2nEvH1bhcFez/UhNBkuQWdohA1WKAImSmOPDVFe4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hWUnXmQGKFn6LLwNx0o0lfirUkxYKvSkhaq8pfDtl7cBsH6W59ARTWmpfztIJaYYi5luuG9ZWnAZux+yuN/cuCyLiyH3ST0rex2lyQYP12Exw0ZMJZ17ZDTReXGyWCGkhZ0yBIgn7umSyj1hofLmybUmotBZ04uETbKzLl8EH10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.. (unknown [82.8.138.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam@gentoo.org)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 9F1873434E1;
	Fri, 24 Jan 2025 02:51:00 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: dtrace@lists.linux.dev
Cc: Sam James <sam@gentoo.org>
Subject: [PATCH 1/4] test: fix 'harness' typo
Date: Fri, 24 Jan 2025 02:49:47 +0000
Message-ID: <2fc6a32931506257f24b24e0c35259189fb37108.1737686990.git.sam@gentoo.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1737686990.git.sam@gentoo.org>
References: <cover.1737686990.git.sam@gentoo.org>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Noticed when grepping for something else.

Signed-off-by: Sam James <sam@gentoo.org>
---
 test/unittest/io/check_io_probe_args.sh | 2 +-
 test/unittest/io/dump_io_probe_args.d   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/test/unittest/io/check_io_probe_args.sh b/test/unittest/io/check_io_probe_args.sh
index 50dba6c6..8e1f5a4c 100755
--- a/test/unittest/io/check_io_probe_args.sh
+++ b/test/unittest/io/check_io_probe_args.sh
@@ -6,7 +6,7 @@
 # http://oss.oracle.com/licenses/upl.
 
 #
-# @@skip: not used directly by the test hardness; called by other scripts
+# @@skip: not used directly by the test harness; called by other scripts
 #
 
 infile=$1
diff --git a/test/unittest/io/dump_io_probe_args.d b/test/unittest/io/dump_io_probe_args.d
index a28b2d61..5b5ba90f 100644
--- a/test/unittest/io/dump_io_probe_args.d
+++ b/test/unittest/io/dump_io_probe_args.d
@@ -4,7 +4,7 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@skip: not used directly by the test hardness; called by other scripts */
+/* @@skip: not used directly by the test harness; called by other scripts */
 
 /*
  * For all io::: probes, dump "all" probe arguments (and their interesting members).
-- 
2.48.1

