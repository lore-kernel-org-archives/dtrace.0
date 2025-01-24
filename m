Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE4828EA
	for <dtrace@lists.linux.dev>; Fri, 24 Jan 2025 02:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737687063; cv=none; b=qtpzr2CQO2aic69t55yM2HBl0amsyqjOPNrKI2JjyJwzCpOy7z2l05Sy2D/1Q798+vrhiiLEi948o5ctz8PgcIK5PF7uT3gD18V9g2x+1L/ZRpSwHSOQSAoURueviIFQBKO1wmxjyj7vM1+AEGGt44FD+BD0u0ARLAy4il8nqGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737687063; c=relaxed/simple;
	bh=WlbtawajmI7Q0rXgBzaJPmFmKiRpCFVKFLuoJI0akhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uVGW41efNwWo2gpfULyfjn/HrPKaT2Qdc/KDs0f/sl9BLuRXh4t6Rf/NuxV01Q7gIGHY0SgOAnJh7zBgbPiagIOOicI28Kwb51AgPEVgGpmS0S7eU7ilwr7gq//S3Y4U0VNMyDPEpCcf8GGMsF6qJOvSUm0M+jA9sTIxNnHuzWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.. (unknown [82.8.138.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam@gentoo.org)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A9A243434DF;
	Fri, 24 Jan 2025 02:50:59 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: dtrace@lists.linux.dev
Cc: Sam James <sam@gentoo.org>
Subject: [PATCH 0/4] Further test cleanups
Date: Fri, 24 Jan 2025 02:49:46 +0000
Message-ID: <cover.1737686990.git.sam@gentoo.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are the followup test fixes I promised before for https://github.com/oracle/dtrace-utils/issues/75.

The catch is I haven't had a chance to do a full test-run (have done most
though) with them again yet, but I figure I'd better send rather than
keep people waiting.

Sam James (4):
  test: fix 'harness' typo
  test: fix bashism in tst.bitfield-offset.x
  test: finalize porting small awk stragglers to gawk
  test: allow overriding CC, OBJCOPY, OBJDUMP, NM, ...

 .../locking/tst.DestructionDoubleUnlock.sh         |  2 +-
 test/internals/headers/tst.header-endianness.sh    |  2 +-
 test/unittest/aggs/tst.aggmod_full2.sh             |  2 +-
 test/unittest/arrays/tst.uregsarray-check.sh       |  2 +-
 test/unittest/bitfields/tst.bitfield-offset.x      | 10 +++++-----
 test/unittest/builtinvar/tst.errno3.sh             |  2 +-
 test/unittest/builtinvar/tst.id_ERROR.sh           |  2 +-
 .../unittest/dtrace-util/tst.ListProbesFuncUSDT.sh |  2 +-
 .../dtrace-util/tst.ListProbesModuleUSDT.sh        |  2 +-
 .../unittest/dtrace-util/tst.ListProbesNameUSDT.sh |  2 +-
 .../dtrace-util/tst.ListProbesProviderUSDT.sh      |  2 +-
 test/unittest/error/tst.clause_scope-regular.r.p   |  2 +-
 test/unittest/io/check_io_probe_args.sh            |  2 +-
 test/unittest/io/dump_io_probe_args.d              |  2 +-
 test/unittest/misc/tst.include.sh                  |  2 +-
 test/unittest/options/tst.ctypes.sh                |  6 +++---
 test/unittest/options/tst.dtypes.sh                |  6 +++---
 test/unittest/options/tst.linktype.sh              |  4 ++--
 test/unittest/options/tst.strip.sh                 |  4 ++--
 test/unittest/pid/tst.offsets.sh                   |  2 +-
 test/unittest/usdt/tst.allargs.sh                  |  2 +-
 test/unittest/usdt/tst.badguess.sh                 |  2 +-
 test/unittest/usdt/tst.dlclose1.sh                 |  2 +-
 test/unittest/usdt/tst.dlclose2.sh                 |  2 +-
 test/unittest/usdt/tst.dlclose3.sh                 |  2 +-
 test/unittest/usdt/tst.eliminate.sh                |  6 +++---
 test/unittest/usdt/tst.enabled.sh                  |  2 +-
 test/unittest/usdt/tst.enabled2.sh                 |  2 +-
 test/unittest/usdt/tst.entryreturn.sh              |  2 +-
 test/unittest/usdt/tst.exec-dof-replacement.sh     |  2 +-
 test/unittest/usdt/tst.execstack.sh                |  6 +++---
 test/unittest/usdt/tst.fork.sh                     |  2 +-
 test/unittest/usdt/tst.guess32.sh                  |  2 +-
 test/unittest/usdt/tst.guess64.sh                  |  2 +-
 test/unittest/usdt/tst.header.sh                   |  2 +-
 test/unittest/usdt/tst.lingering.sh                |  2 +-
 test/unittest/usdt/tst.link-idempotence.sh         |  2 +-
 test/unittest/usdt/tst.linkpriv.sh                 |  2 +-
 test/unittest/usdt/tst.linkunpriv.sh               |  2 +-
 test/unittest/usdt/tst.manyprobes.sh               |  2 +-
 test/unittest/usdt/tst.manyprocs.sh                |  2 +-
 test/unittest/usdt/tst.multiple.sh                 |  2 +-
 test/unittest/usdt/tst.multitrace.sh               |  2 +-
 test/unittest/usdt/tst.onlyenabled.sh              |  2 +-
 test/unittest/usdt/tst.pie.sh                      |  2 +-
 test/unittest/usdt/tst.reeval.sh                   |  2 +-
 test/unittest/usdt/tst.static.sh                   |  2 +-
 test/unittest/usdt/tst.static2.sh                  |  2 +-
 test/unittest/usdt/tst.user.sh                     |  2 +-
 test/unittest/variables/bvar/tst.arg3-ERROR-b.sh   |  2 +-
 test/unittest/variables/bvar/tst.arg3-ERROR.sh     | 14 +++++++-------
 test/utils/workload_analyze_loop.sh                |  2 +-
 52 files changed, 72 insertions(+), 72 deletions(-)

-- 
2.48.1

