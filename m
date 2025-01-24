Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069AD1D5142
	for <dtrace@lists.linux.dev>; Fri, 24 Jan 2025 02:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737687064; cv=none; b=qeUmDFYwB+DH514oYe/KtMbrxGtkeK9iEfGIYkwMb7m+Hy1xQAg1zFqxvqRbWcV4qix+iJZ/iuOpIy2DEqmY3J4Hj899wHdWf1oLBdMVpu6B3JO/s5stubEQOllkWx+F1/GxE9Cqo2T1cjvtsjpMVy1XKkhfaBGprD3hahOSnEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737687064; c=relaxed/simple;
	bh=iQn4U0TMBduSf9bJcuWZn4kPI6vEenCr1KNluYY8LdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y4Uz8JHreKcQZDz3at1VLuR1726QzXkZCiuwycQieEKc0MjG54T8niBbKt9iADBvaoOogxscWWBDgNB+5v8iYPtvTeNNI40MBohGOXfjj6heKU8OuIPlMIfyJu62Y0bI6jvKfiSlo8WIL3o1glUtb28n4f0I8DUyCjMm1MuMGyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.. (unknown [82.8.138.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam@gentoo.org)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 943073430BD;
	Fri, 24 Jan 2025 02:51:01 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: dtrace@lists.linux.dev
Cc: Sam James <sam@gentoo.org>
Subject: [PATCH 2/4] test: fix bashism in tst.bitfield-offset.x
Date: Fri, 24 Jan 2025 02:49:48 +0000
Message-ID: <d9c8271d6b8c6a4ec5b821097d4afd1ff6bfbaa3.1737686990.git.sam@gentoo.org>
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

trap ERR is a bashism and won't work with e.g. dash, just change
the shebang to #!/bin/bash in this case as ERR is a bit messy to handle
(it'd be trivial here but there's no real reason to not use bash).

Signed-off-by: Sam James <sam@gentoo.org>
---
 test/unittest/bitfields/tst.bitfield-offset.x | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/test/unittest/bitfields/tst.bitfield-offset.x b/test/unittest/bitfields/tst.bitfield-offset.x
index 4397461a..ae57c2b5 100755
--- a/test/unittest/bitfields/tst.bitfield-offset.x
+++ b/test/unittest/bitfields/tst.bitfield-offset.x
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-- 
2.48.1

