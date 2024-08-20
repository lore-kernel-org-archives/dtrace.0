Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F366A1849
	for <dtrace@lists.linux.dev>; Tue, 20 Aug 2024 00:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724112683; cv=none; b=dR7eliiLJewfOx0IqlVwlWYv4M+LLCvd+elF7s24pHcWv0m0gkzdOD+7wqxnPNaM5WnhMut2mLu+m9X2FuFMvKDvmR8Yjy0VYtzg8mf9HaymQIlDzbR/hhsorOrjB6GpeXiuZVhnS9Bb8IMbfKxJKEMDIG/adKYeie2tYKfLbwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724112683; c=relaxed/simple;
	bh=wvFjaQmIJZUrNMJ3EUyhtob/cgFNo7Tw0WWrH5oV+FY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eQl1KZl6DOXp1LY/Zc7GpLcEtV7BPsGCXhmeA5in40GPtt5L/gJYAMpsBi790av3aAbzqtt78mmjDIFU3Z5FCoVUmWZ4Vryqq5wuvKqTGIXIdqS5CBxFKu+J2cJfASF4wA9S64Ux8DSm9QWAfJGac9INFfTHKIj2GpypRmL6K+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: dtrace@lists.linux.dev
Cc: Sam James <sam@gentoo.org>
Subject: [PATCH 2/3] test: fix exit code typo in tst.core.sh
Date: Tue, 20 Aug 2024 01:10:21 +0100
Message-ID: <158b036865f5b67c25de44972fcf74b2ba8f2f6d.1724112622.git.sam@gentoo.org>
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

$rcc is not set, but $rc is. Use that.
---
 test/unittest/options/tst.core.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/test/unittest/options/tst.core.sh b/test/unittest/options/tst.core.sh
index 48a58508..18727c6a 100755
--- a/test/unittest/options/tst.core.sh
+++ b/test/unittest/options/tst.core.sh
@@ -16,4 +16,4 @@ file core | tee /dev/stderr | \
 rc=$?
 rm -f core
 
-exit $rcc
+exit $rc
-- 
2.46.0

