Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24B6367
	for <dtrace@lists.linux.dev>; Tue, 20 Aug 2024 00:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724112682; cv=none; b=nvfucjuDpG6xq+13xXZw3RCmHgHON8NoT4Yflp1D5nFL9YzxAYy3RbLeteNdnAIhee6IddOPZ5tu8Zc6xwwtaWfVN3WHQEXOBq+ry0Jb6s8AOdmq8pOjihALOFRojU1NdpIq29dljdkxt1EnzpagoZB6gQXL34SDTxcZd3Vvp3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724112682; c=relaxed/simple;
	bh=bzXolucePV8K3A3VwIrFAcI2pjoZOIBBpSaykPq3zhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cx5nYMtjQ0GWibLTgrvzQ8Jgu8ijU4vr2gs5oHj8v8Lq0VTY6FE6TvpWYC7sUyhzoWvBv3k59zRP7WJCAn8RPMm2ULBnwIeWjZXsBdlTFveYybmjbr0+LDrYyeubLehAIgds3EApQhodq+k55PkxNoVZDoTUrCF4fGbWWOMZcBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: dtrace@lists.linux.dev
Cc: Sam James <sam@gentoo.org>
Subject: [PATCH 1/3] test: fix exit code in tst.ipv4remotetcp.sh
Date: Tue, 20 Aug 2024 01:10:20 +0100
Message-ID: <4c6a974d2b5fa9a0ff8935428b5c3026109e5127.1724112622.git.sam@gentoo.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1724112622.git.sam@gentoo.org>
References: <cover.1724112622.git.sam@gentoo.org>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

$? was clobbered by the status=$? assignment above, see:
```
$ bash -c 'false ; x=$? ; echo $? ; echo ${x}'
0
1
```

We could just drop the status assignment but I just chose to do this
instead.
---
 test/unittest/ip/tst.ipv4remotetcp.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/test/unittest/ip/tst.ipv4remotetcp.sh b/test/unittest/ip/tst.ipv4remotetcp.sh
index 32c3435a..99ba1161 100755
--- a/test/unittest/ip/tst.ipv4remotetcp.sh
+++ b/test/unittest/ip/tst.ipv4remotetcp.sh
@@ -98,4 +98,4 @@ EODTRACE
 
 status=$?
 
-exit $?
+exit ${status}
-- 
2.46.0

