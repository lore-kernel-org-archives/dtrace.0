Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5570360
	for <dtrace@lists.linux.dev>; Tue, 20 Aug 2024 00:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724112681; cv=none; b=cpEiPPcdbROQFBbmGmjTSTY+iExG16YFYQtT5BsGAQlrwf39baj/PWpUWCL2gRAfPrVhxd8UOOrqUSeJbUndI5L84NCPEajGZqrgkxiWwAAOobcm2YQMipZ/88G2wIRx49qsbP967Jn++wxKzRSZMekSpOLjAIom+hy8uhenRpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724112681; c=relaxed/simple;
	bh=4LihvcnV0oQlVVU5Js0SlL7jqB9sPt44gW4CmIRMpPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KzmAIS97VkQQg0p+oTfUhBribdMNAXI8tAbdhlPG2GiI9kLgWUGRexfvPz4fleymLbXNEtTkGJerDsn4o1rBl6QPnkmeJRe6jwezE9drVk5Ea1DuE+6P7rxIVAIuQDjIhG4sK9LI0sZ6s05npxPm2GtzRnXKiZPBpFMrMDFTnp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: dtrace@lists.linux.dev
Cc: Sam James <sam@gentoo.org>
Subject: [PATCH 0/3] Test exit code fixlets
Date: Tue, 20 Aug 2024 01:10:19 +0100
Message-ID: <cover.1724112622.git.sam@gentoo.org>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A small set of exit code fixes to tests.

There are some other issues that are worth discussing, like pipelines
and ignoring the exit code there, but a lot of that stuff doesn't
matter *too* much given the test output is checked anyway.

Sam James (3):
  test: fix exit code in tst.ipv4remotetcp.sh
  test: fix exit code typo in tst.core.sh
  test: fix exit code in tst.newprobes.sh

 test/unittest/ip/tst.ipv4remotetcp.sh | 2 +-
 test/unittest/options/tst.core.sh     | 2 +-
 test/unittest/pid/tst.newprobes.sh    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)


base-commit: c84954cdc6fb017034e2c3fe4445a7c8981d35e9
-- 
2.46.0

