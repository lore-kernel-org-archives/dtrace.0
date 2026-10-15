Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C61D277C96
	for <dtrace@lists.linux.dev>; Thu, 15 Oct 2026 03:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792036452; cv=none; b=OID/lYMF8QzswhOCkm9lJkI4YB/lKlTBxeK17ixUKd/3yGSiY5EeIq1FEuplr9ciu8VRpYMoP3bL8BGgOMpBJuQgLQ89begEY3dsfL19IMEEr8Xii+CVLRjsm3S8UWfQYI6jh5yyPjQfjQ81IZUZZ0+V7nkNVBF/Mo4CS/ShjKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792036452; c=relaxed/simple;
	bh=DaCCHWMKXujmIukLWm5xh5NWr0DX++FLTxRiL0A2oq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mkoy4G41emGy/QNh4tFor2wf4gk7yBlepH+HDpgdc2IaIftsjLeiVOgZ9QkMTAN3FOAB1mVqYrKQrDTR3wTC9zr/seYFjYykeGEY+v8pPjDXn/uNJIrC2HKvxcUNs4ii7fTwLTJUL3uSASqEuppy90FXbbVRjCjCwcvZZwVNu6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jbYfvC8A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jbYfvC8A"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6BE9C2BCFD;
	Thu, 15 Oct 2026 03:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792036451;
	bh=DaCCHWMKXujmIukLWm5xh5NWr0DX++FLTxRiL0A2oq0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jbYfvC8AqoVDzcjWNywgbLU5FlU8upUz+M9qb6YOGgOLZRBf/CFJ8U685dPLPZ+g+
	 THgs4PXTUhYEnqdwqeH+mddJlNa3LC9xWzbzXxVE2z9QRCbLcyILxoPneSzVxCNGYJ
	 9Kd3CsbUe6WUapB5TWQ9TgFBiEn/zLoothkEuM4kNsda4GHGioJIu1ULMbbFAMtGVP
	 5wmPk0POKWrgmAxj30pKbI9kMxNeFgiWOtxRNIWPhuH8+X3PgT0dQRQDNaJPRgK3L0
	 am8oDTwSUIzDELG5vo+LjQVNx0RiYpDJMjIac7F3Ru+nbc7NemNupQm3B0Ss+YBKKy
	 RWYN9fxdRPdDQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3286CC6B34;
	Thu, 15 Oct 2026 03:54:11 +0000 (UTC)
From: Eslam Almorshdy via B4 Relay <devnull+ealmorshdy.d-matrix.ai@kernel.org>
Date: Thu, 15 Oct 2026 03:53:43 +0000
Subject: [PATCH 3/7] test: add pid probe placement test for lld-linked
 objects
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bug001-uprobe-file-offset-v1-3-bf4c53af8f39@d-matrix.ai>
References: <20261015-bug001-uprobe-file-offset-v1-0-bf4c53af8f39@d-matrix.ai>
In-Reply-To: <20261015-bug001-uprobe-file-offset-v1-0-bf4c53af8f39@d-matrix.ai>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Kris Van Hees <kris.van.hees@oracle.com>, 
 Alan Maguire <alan.maguire@oracle.com>, 
 Eslam Almorshdy <ealmorshdy@d-matrix.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792036450; l=5147;
 i=ealmorshdy@d-matrix.ai; s=20261015; h=from:subject:message-id;
 bh=draoC6UdSBARmzLrVx3HIevCgfcQsT85xl2/MO8S4XE=;
 b=pVITKloJtgEpP7ZjLiO6PvCnmPYgWAO/IPx1yfSpGMbgg+UlHIbKP/xaEbIQ95vFVRK2k2XCm
 qSA59DnJB2FC/sTP0imt9LqoKcoJY3C1Vae5/m6rR3rNyFtstlWLd51
X-Developer-Key: i=ealmorshdy@d-matrix.ai; a=ed25519;
 pk=E4tVAIvp2rvz2CB7Re6YVMP6FiUVSxuq0TUtjGQL5NM=
X-Endpoint-Received: by B4 Relay for ealmorshdy@d-matrix.ai/20261015 with
 auth_id=1187
X-Original-From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
Reply-To: ealmorshdy@d-matrix.ai

From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>

Link the same program with GNU ld and with lld, and check that
pid$target:a.out:target:entry and :return each fire 3 times in both
builds.  Without the previous patch, neither probe fires in the lld
build; the GNU ld build rejects fixes that subtract 0x1000
unconditionally.

Add test/utils/linkers.sh, which lists the linkers $CC can use.  The
test builds with each linker that is installed, and tst.lld-offset.x
skips the test when lld is not installed: no GNU ld option produces
lld's layout.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
---
 test/unittest/pid/tst.lld-offset.r  |  1 +
 test/unittest/pid/tst.lld-offset.sh | 59 +++++++++++++++++++++++++++++++++++++
 test/unittest/pid/tst.lld-offset.x  | 14 +++++++++
 test/utils/Build                    |  2 +-
 test/utils/linkers.sh               | 21 +++++++++++++
 5 files changed, 96 insertions(+), 1 deletion(-)

diff --git a/test/unittest/pid/tst.lld-offset.r b/test/unittest/pid/tst.lld-offset.r
new file mode 100644
index 00000000..2e9ba477
--- /dev/null
+++ b/test/unittest/pid/tst.lld-offset.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/pid/tst.lld-offset.sh b/test/unittest/pid/tst.lld-offset.sh
new file mode 100755
index 00000000..c2128e32
--- /dev/null
+++ b/test/unittest/pid/tst.lld-offset.sh
@@ -0,0 +1,59 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# Check that pid entry and return probes fire in executables linked by GNU
+# ld and by lld.
+#
+# Uprobes are placed by file offset.  lld's text segment has p_vaddr =
+# p_offset + 0x1000 (x86_64), so an offset computed as the function's
+# distance from the first segment misses the function by 0x1000.
+# The GNU ld build, where the two agree, rejects fixes that subtract 0x1000
+# unconditionally.  Linkers that are not installed are left out; the .x
+# file skips the test if lld is one of them.
+#
+
+dtrace=$1
+utils=$PWD/test/utils
+ncalls=3
+
+DIRNAME=$tmpdir/pid-lld-offset.$$.$RANDOM
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+cat > main.c <<EOF
+volatile int sink;
+
+__attribute__((noinline)) int target(int x) { return x * 2 + 1; }
+
+int main(void)
+{
+	int i;
+
+	for (i = 0; i < $ncalls; i++)
+		sink = target(i);
+	return 0;
+}
+EOF
+
+status=0
+for ld in $($utils/linkers.sh); do
+	$CC -O0 -fuse-ld=$ld -o main-$ld main.c || exit 1
+
+	got=$($dtrace $dt_flags -qn '
+	pid$target:a.out:target:entry, pid$target:a.out:target:return
+	{
+		@[probename] = count();
+	}' -c ./main-$ld 2>&1 | awk 'NF { print $1, $2 }' | sort | paste -sd " ")
+	want="entry $ncalls return $ncalls"
+	if [ "$got" != "$want" ]; then
+		echo "ERROR: main-$ld: got '$got', want '$want'"
+		status=1
+	fi
+done
+
+[ $status -eq 0 ] && echo success
+exit $status
diff --git a/test/unittest/pid/tst.lld-offset.x b/test/unittest/pid/tst.lld-offset.x
new file mode 100755
index 00000000..6a44074d
--- /dev/null
+++ b/test/unittest/pid/tst.lld-offset.x
@@ -0,0 +1,14 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# The layout this test is about is produced only by lld.
+
+if ! test/utils/linkers.sh lld > /dev/null; then
+	echo "ld.lld is not available"
+	exit 2
+fi
+exit 0
diff --git a/test/utils/Build b/test/utils/Build
index 2d97ee30..77d88a34 100644
--- a/test/utils/Build
+++ b/test/utils/Build
@@ -4,7 +4,7 @@
 # http://oss.oracle.com/licenses/upl.
 
 TEST_UTILS = workload_kernel workload_user showUSDT print-stack-layout
-TEST_SCRIPTS = check_result.sh clean_probes.sh cpc_get_events.sh cpc_temp_skip_bug.sh perf_count_event.sh workload_analyze_loop.sh workload_get_iterations.sh get_remote.sh stack_skip_test.sh
+TEST_SCRIPTS = check_result.sh clean_probes.sh cpc_get_events.sh cpc_temp_skip_bug.sh perf_count_event.sh workload_analyze_loop.sh workload_get_iterations.sh get_remote.sh stack_skip_test.sh linkers.sh
 
 define test-util-template
 CMDS += $(1)
diff --git a/test/utils/linkers.sh b/test/utils/linkers.sh
new file mode 100755
index 00000000..5e91ec52
--- /dev/null
+++ b/test/utils/linkers.sh
@@ -0,0 +1,21 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# linkers.sh [LINKER...]: print those of the given linkers (-fuse-ld names;
+# default "bfd lld") that $CC can link a program with.  Fails if none can.
+#
+
+[ $# -eq 0 ] && set -- bfd lld
+
+usable=
+for ld; do
+	echo 'int main(void) { return 0; }' |
+	    ${CC:-gcc} -fuse-ld=$ld -x c -o /dev/null - > /dev/null 2>&1 &&
+	    usable="$usable $ld"
+done
+
+[ -n "$usable" ] && echo $usable

-- 
2.55.0


