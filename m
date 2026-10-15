Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E28A36F91D
	for <dtrace@lists.linux.dev>; Thu, 15 Oct 2026 03:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792036452; cv=none; b=rwdnQhnrWm58QziP68OMZjLdRihHwltZC+jbqjbvaJARIWbGVO0aCEUB8ZLrKQNz+N2UTPjMoHXwTFU2ANZhco2tU+kr8/qL11cE/SvBl5aN/dB8rxuuxo0NmLSvJMIHuhrrjzUYAqG6clwYb5XN1KmelGizGCfl3mtndqSUIC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792036452; c=relaxed/simple;
	bh=y0ZMuHhZikGZlaHjc7/Xr1i+caGbAQBKbNHe2yG0Q4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GGIvoTQHjPoHmnhEayQjRu/uoglyqVl/STW9y+YjOPMax3XXdSYjqauBt2BuxK3Q6LMIoJMhE85wg7NUL3DSDcclMKxBODsKrWYxxzJoLHeXnZ/yiWcTzZn4dnj/VIhc01DJWg8k6q0aZ47zJAicyGuKKT0lSL8X8cPrsBIynhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P3IT6RMm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P3IT6RMm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23687C2BD04;
	Thu, 15 Oct 2026 03:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792036452;
	bh=y0ZMuHhZikGZlaHjc7/Xr1i+caGbAQBKbNHe2yG0Q4E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=P3IT6RMmU8s/KBMXLyMs2TAVAmxRcXi7fVK4GN+GciwSSrJHkT/64YDyrQjg9ZfIm
	 Ben5aDS13mXiUwzHXOpg3jRpawg72OwBBrml71FmWKCTPcpMvIR2oV+9dtMc/Yo/df
	 Jws9rKd9pKuTbgOvtV5+A8W4jLRcpYwoZnM3Ol/AnGDxN2Np9YkITzQV3+u1450XN9
	 POvzKt7YzyMUuBHJo/EQko5/HUv9XRBwTFn0q/zSXWgSrcYWhJkTGVan/ElVu4WskP
	 8Hu5pR0ZMPF5GeizW2MYYRA8XZ6WqFRNX1ImilXFlgyz2UY6gei4nxazd7xgt/ETVy
	 HAS/WFIQMg7vA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12488CC6B1C;
	Thu, 15 Oct 2026 03:54:12 +0000 (UTC)
From: Eslam Almorshdy via B4 Relay <devnull+ealmorshdy.d-matrix.ai@kernel.org>
Date: Thu, 15 Oct 2026 03:53:47 +0000
Subject: [PATCH 7/7] test: add dtrace provider probe placement test for
 lld-linked objects
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bug001-uprobe-file-offset-v1-7-bf4c53af8f39@d-matrix.ai>
References: <20261015-bug001-uprobe-file-offset-v1-0-bf4c53af8f39@d-matrix.ai>
In-Reply-To: <20261015-bug001-uprobe-file-offset-v1-0-bf4c53af8f39@d-matrix.ai>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Kris Van Hees <kris.van.hees@oracle.com>, 
 Alan Maguire <alan.maguire@oracle.com>, 
 Eslam Almorshdy <ealmorshdy@d-matrix.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792036450; l=4154;
 i=ealmorshdy@d-matrix.ai; s=20261015; h=from:subject:message-id;
 bh=r7XansXKjX57wnmr45XkI6Ahdc55KVhSTTEthayG3e0=;
 b=HPhoazwQf33P0tNmtezd3BhJo1XrZlhx8lxUcbGcc37jLZWUm6OKIDZeMgY7QbXDkaWXc6/Sx
 8X0wriusAsIAi9he86MNb+byblOA1YGb1jHvnTwYZqvfFKHqNaPfFHG
X-Developer-Key: i=ealmorshdy@d-matrix.ai; a=ed25519;
 pk=E4tVAIvp2rvz2CB7Re6YVMP6FiUVSxuq0TUtjGQL5NM=
X-Endpoint-Received: by B4 Relay for ealmorshdy@d-matrix.ai/20261015 with
 auth_id=1187
X-Original-From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
Reply-To: ealmorshdy@d-matrix.ai

From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>

Check that the dtrace provider's BEGIN and END uprobes are registered
at the file offsets of BEGIN_probe() and END_probe(), computed through
the PT_LOAD segment that holds each, and that both probes fire.

With a GNU ld-linked libdtrace, the file offset and the distance from
the first segment coincide, so the test can tell them apart only when
libdtrace itself is linked with lld.  There it fails without the
previous patch, reporting the misplaced offsets after a 10-second
timeout instead of hanging.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
---
 test/unittest/begin/tst.begin-end-offset.r  |  1 +
 test/unittest/begin/tst.begin-end-offset.sh | 87 +++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/test/unittest/begin/tst.begin-end-offset.r b/test/unittest/begin/tst.begin-end-offset.r
new file mode 100644
index 00000000..2e9ba477
--- /dev/null
+++ b/test/unittest/begin/tst.begin-end-offset.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/begin/tst.begin-end-offset.sh b/test/unittest/begin/tst.begin-end-offset.sh
new file mode 100755
index 00000000..d1c316f4
--- /dev/null
+++ b/test/unittest/begin/tst.begin-end-offset.sh
@@ -0,0 +1,87 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# Check that dtrace places the uprobes for its BEGIN and END probes at the
+# file offsets of BEGIN_probe() and END_probe() in libdtrace, and that both
+# fire.
+#
+# The offset must be computed through the PT_LOAD segment that contains the
+# function.  The function's distance from the first segment is the
+# same only if that segment has p_vaddr == p_offset.  With an lld-linked
+# libdtrace (p_vaddr = p_offset + 0x1000 on x86_64) BEGIN is placed 0x1000
+# past BEGIN_probe(), never fires, and the session hangs.  With a GNU
+# ld-linked libdtrace both computations agree.
+#
+
+dtrace=$1
+events=/sys/kernel/debug/tracing/uprobe_events
+
+DIRNAME=$tmpdir/begin-end-offset.$$.$RANDOM
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+$dtrace $dt_flags -qn 'BEGIN { printf("begin\n"); } tick-1s { exit(0); }
+    END { printf("end\n"); }' > out 2>&1 &
+pid=$!
+
+# Record the session's uprobes while it runs; BEGIN, a tick and END take
+# about a second.
+for i in $(seq 50); do
+	grep "^p:dt_${pid}_dtrace/" $events >> uprobes
+	kill -0 $pid 2> /dev/null || break
+	sleep 0.2
+done
+if kill -0 $pid 2> /dev/null; then
+	echo "ERROR: dtrace did not exit within 10 seconds (BEGIN never fired?)"
+	{ kill -9 $pid; wait $pid; } 2> /dev/null
+	# A killed session leaves its uprobes behind.
+	sleep 1
+	for prb in $(sed -n "s|^p:dt_${pid}_dtrace/\([A-Z]*\) .*|\1|p" $events); do
+		echo "-:dt_${pid}_dtrace/$prb" >> $events
+	done
+fi
+wait $pid 2> /dev/null
+
+# fileoff FILE SYMBOL: the file offset of SYMBOL, through its PT_LOAD
+fileoff() {
+	local v type off va pa filesz rest
+
+	v=$({ nm $1; nm -D $1; } 2> /dev/null |
+	    awk -v s=$2 '$3 == s { print "0x" $1; exit }')
+	[ -n "$v" ] || return
+	while read type off va pa filesz rest; do
+		if [ "$type" = LOAD ] && [ $((v)) -ge $((va)) ] &&
+		   [ $((v)) -lt $((va + filesz)) ]; then
+			echo $((v - va + off))
+			return
+		fi
+	done < <(readelf -lW $1)
+}
+
+status=0
+for prb in BEGIN END; do
+	spec=$(awk -v e=p:dt_${pid}_dtrace/$prb '$1 == e { print $2; exit }' uprobes)
+	file=${spec%:*}
+	want=$(fileoff "$file" ${prb}_probe)
+	if [ -z "$spec" ] || [ -z "$want" ]; then
+		echo "ERROR: dtrace:::$prb: uprobe '$spec', ${prb}_probe offset '$want'"
+		status=1
+	elif [ $((${spec##*:})) -ne $want ]; then
+		printf "ERROR: dtrace:::%s placed at %s in %s, want 0x%x\n" \
+		    $prb ${spec##*:} $file $want
+		status=1
+	fi
+done
+
+if ! grep -qx begin out || ! grep -qx end out; then
+	echo "ERROR: BEGIN and END did not both fire:"
+	cat out
+	status=1
+fi
+
+[ $status -eq 0 ] && echo success
+exit $status

-- 
2.55.0


