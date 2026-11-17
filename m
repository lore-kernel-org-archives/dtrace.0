Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794955041;
	b=2vFJtuqtIpnzKWrW5Ic/IV1WpIscawFTHaSdztmycIZT36s4ybEJzUfXVfEtadFTxKeF
	 qgOAqoPAlK3NkmaylpkhIo28bK35PeBSfByOACuIuAAEcLBkk8E2stuKUopesNdToyqCw
	 a/ecp6i64aYXcFTeYYMviUsdBHaipO//6vBYLexmRLLMV+FgPoG6WOhtgh5z0ZFphVvr3
	 XuuudNvRXUIhn8jcnfNIZC00XvukdfAgCKanfbj9WBA5yl6gVWv/xVluMqWB7WPoB/AyV
	 B4c1MvBacOCia1U8YY8bGyFsPQPkCkP9M4T0l20eqtEVrs6AbJQ2ByoylsXzfZW9IYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955041;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7NPqLNk+l7ShfQtMiBPi1MFtZwfCs8GVWtIeYHRJM9k=;
	b=X8gnwwe+tBdnQSse+AGd3vKcxtozocxOFcsIGakCJX6pERTdwk/0WZexXQsSwaf+4Ded
	 HVZbK1DNG0jtrxebyrXY3xHgGxUdKp5DLgfc0zF5dzZxXq941ZaoH/edwrTR51Nyg+0+7
	 wkKqXdbjnxcutd+gCHfKd/r2fB35ykSI3XYc/CjVITa+4znCeqfrOsJEYAyHoVQvwqn1n
	 Zpmc4wLr7jBb2UDsvMnLsS2M652AoOS9bfTTL1z4V8N0anUVAGiCp3ALqPz7ovBPio99B
	 /1qwcLrdLydkIq/neWjDegRQLormq1cw0lFk2VTjfz+gB8uxOu8jMud8E/Fg9q6DY1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dlSXIT5E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA96A606A333
	for <dtrace@lists.linux.dev>; Tue, 17 Nov 2026 22:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dlSXIT5E
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794955041;
	b=jOE4JPg9lxBVs+tfcipUZ95ZbfnDdXK8l+xVzsXDR86CvbTjRTh7IkXnnHOQjgfBnY8S
	 DI/ftdjBXOPSX6vcjkEs0AzMF0HSwNRlx8LOpq21J+3HcEkAuZYui3zBT50DDYxi62NjE
	 J10fIEjnuXfjBE6lq6iJTkyO/XdX5ikAP3+viwvjyLOkJ6blvkio/XrCPWcGRZICOfNTZ
	 dKa1eYuiqIGCxbT2QFBpAYaBOqqhiDZhFjL9V6RsIAiQtqZ47dPD5orhU+TMwiTw6YHyX
	 8suGfX2k8OmCnB0bMC3Q5LQIzNS9Hb0bYCHyZkJAZsQp3zlHdh1uxNKeoy3uowzuLSQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794955041;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7NPqLNk+l7ShfQtMiBPi1MFtZwfCs8GVWtIeYHRJM9k=;
	b=R83a5UgefKbEimrRzTv17+AxJWd3n09zU8CsyVN/YG0TrMNHxnCIEDJbDyMhUOIW00M8
	 DixBu0Zk2QXEJ1pIH5tmVYCzLBPsfdJ/QKpC61B5QdkKkpGFRYrOtOKqDiOdP9QioFaUN
	 Y9YeerP86RkAMRp5sTmRBQVUWRDOAsHH+Tj3CYgvwCwCtexkzEtHWnfYXjbuyjxYfLdgI
	 L929rLmjlQBotjRVcHOHfBZUYpFxZEi3YbfFs12vQsHBrPChDgd8r1fsq5WTCcP9PxkcI
	 /eCt6U4xTjrcKfNK1gtNozZ5tvGH/4iWSd2XkinK6GzcHOORmkKHbX/gHc/YDiijVBA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF3401F000C4;
	Tue, 17 Nov 2026 22:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794955041;
	bh=7NPqLNk+l7ShfQtMiBPi1MFtZwfCs8GVWtIeYHRJM9k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=dlSXIT5Eva/fER5VLr8PdsP915ZTr1N0WVfR9D+e0pY1V0qs70324MlEFQ0CreeEO
	 crgQn/haz5eI9gy7Uy5ZgXcEYSgYg44UPdP0GPBs2mSSpMkI/cERvq1ljef1FTPEr/
	 P9YuLkIfePPqB2scYtxGD2+zEkzhQmANaD4ijNa37vODfDuTuN8He5w/Nf/MXR6EtJ
	 JBZuaz9doW4sEmMhdqz7Jas3zIqH4GRrtTRtTr3qf9KRhU4rW+Qq+upjTGuhsqkLVw
	 u5QYVdGjs0+gxme0cyvDhGQw7bvqcyh90NQtOkpwhc0AjOn60uwOuO9m9HelESdTYU
	 4gZKBpuuX2TwA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 972D24AB2F;
	Tue, 17 Nov 2026 22:37:19 +0000 (UTC)
From: Eslam Almorshdy via B4 Relay <devnull+ealmorshdy.d-matrix.ai@kernel.org>
Date: Tue, 17 Nov 2026 22:36:45 +0000
Subject: [PATCH RFC 7/7] test: add USDT test for libraries with a non-zero
 link address
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261117-b4-bug003-load-bias-v1-7-dcd0f6cde412@d-matrix.ai>
References: <20261117-b4-bug003-load-bias-v1-0-dcd0f6cde412@d-matrix.ai>
In-Reply-To: <20261117-b4-bug003-load-bias-v1-0-dcd0f6cde412@d-matrix.ai>
To: dtrace@lists.linux.dev
Cc: Nick Alcock <nix@esperi.org.uk>, 
 Kris Van Hees <kris.van.hees@oracle.com>, 
 Eslam Almorshdy <ealmorshdy@d-matrix.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794955038; l=4263;
 i=ealmorshdy@d-matrix.ai; s=20261015; h=from:subject:message-id;
 bh=LgoLY3MC3kK4GCv/r3CBeV+QjoVl+OXEZ5LxN18sER0=;
 b=MkVjQ+PU73LkgEr35InJKLoiBamXkc5rUfCBFFjElsb5M69mW2Jvb2gUs0If3YuvYqMgT63YV
 HRD/UwUJ6F4AvTdRenOziYh/X19QOBf7Ee7/QJq/+8SB2vAyGIBgGw5
X-Developer-Key: i=ealmorshdy@d-matrix.ai; a=ed25519;
 pk=E4tVAIvp2rvz2CB7Re6YVMP6FiUVSxuq0TUtjGQL5NM=
X-Endpoint-Received: by B4 Relay for ealmorshdy@d-matrix.ai/20261015 with
 auth_id=1187
X-Original-From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
Reply-To: ealmorshdy@d-matrix.ai
Content-Transfer-Encoding: 7bit

From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>

Build a USDT probe into shared libraries linked at 0 and at 0x200000,
with GNU ld and with lld, and check that it fires 3 times in each.
Without the previous patch no probe is created in the libraries linked
at 0x200000.

Linkers that are not installed are left out; the .x file skips the test
if neither is.

Signed-off-by: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
---
 test/unittest/usdt/tst.lib-loadbias.r  |  1 +
 test/unittest/usdt/tst.lib-loadbias.sh | 96 ++++++++++++++++++++++++++++++++++
 test/unittest/usdt/tst.lib-loadbias.x  | 14 +++++
 3 files changed, 111 insertions(+)

diff --git a/test/unittest/usdt/tst.lib-loadbias.r b/test/unittest/usdt/tst.lib-loadbias.r
new file mode 100644
index 00000000..2e9ba477
--- /dev/null
+++ b/test/unittest/usdt/tst.lib-loadbias.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/usdt/tst.lib-loadbias.sh b/test/unittest/usdt/tst.lib-loadbias.sh
new file mode 100755
index 00000000..132e7a95
--- /dev/null
+++ b/test/unittest/usdt/tst.lib-loadbias.sh
@@ -0,0 +1,96 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, d-Matrix Corporation. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# Check that USDT probes are created and fire in shared libraries linked at
+# 0 and at 0x200000, by GNU ld and by lld.
+#
+# dtprobed turns each probe's link-time address into a runtime address by
+# adding the library's load bias.  The load address of its first segment is
+# the bias only if the library is linked at 0; otherwise the probe address
+# is too high by the link address and no probe is created.  Linkers that are
+# not installed are left out; the .x file skips the test if neither is.
+#
+
+dtrace=$1
+utils=$PWD/test/utils
+ncalls=3
+CFLAGS="$test_cppflags"
+LDFLAGS="$test_ldflags"
+declare -A base=([bfd]=-Wl,-Ttext-segment=0x200000
+		 [lld]=-Wl,--image-base=0x200000)
+
+DIRNAME=$tmpdir/usdt-lib-loadbias.$$.$RANDOM
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+cat > prov.d <<EOF
+provider test_prov {
+	probe tick(int);
+};
+EOF
+
+cat > work.c <<EOF
+#include "prov.h"
+
+__attribute__((noinline)) void work(int i)
+{
+	TEST_PROV_TICK(i);
+}
+EOF
+
+cat > main.c <<EOF
+void work(int i);
+
+int main(void)
+{
+	int i;
+
+	for (i = 0; i < $ncalls; i++)
+		work(i);
+	return 0;
+}
+EOF
+
+$dtrace $dt_flags -h -s prov.d || exit 1
+
+# build NAME LD LDFLAGS...: libNAME.so linked by LD with LDFLAGS, and NAME
+# linked against it.  dtrace -G uses the same linker.
+build() {
+	local name=$1 ld=$2
+	shift 2
+
+	$CC $CFLAGS -fPIC -c -o $name.o work.c &&
+	$dtrace $dt_flags -x ldpath=ld.$ld -G -s prov.d -o prov-$name.o $name.o &&
+	$CC $LDFLAGS -fuse-ld=$ld -shared "$@" -o lib$name.so $name.o prov-$name.o &&
+	$CC $CFLAGS $LDFLAGS -fuse-ld=$ld -o $name main.c -L. -l$name \
+	    -Wl,-rpath,$DIRNAME
+}
+
+# fired BIN PROBE: how often PROBE fired in a run of ./BIN, or dtrace's error
+fired() {
+	$dtrace $dt_flags -qn "$2 { n++; } dtrace:::END { printf(\"%d\\n\", n); }" \
+	    -c ./$1 2>&1 | awk 'NF { last = $0 } END {
+		sub(/^dtrace: (invalid probe specifier .*: )?/, "", last)
+		print last
+	    }'
+}
+
+status=0
+for ld in $($utils/linkers.sh); do
+	build $ld $ld && build $ld-base $ld ${base[$ld]} || exit 1
+
+	for name in $ld $ld-base; do
+		n=$(fired $name 'test_prov$target:::tick')
+		if [ "$n" != $ncalls ]; then
+			echo "ERROR: lib$name.so: got '$n', want $ncalls firings"
+			status=1
+		fi
+	done
+done
+
+[ $status -eq 0 ] && echo success
+exit $status
diff --git a/test/unittest/usdt/tst.lib-loadbias.x b/test/unittest/usdt/tst.lib-loadbias.x
new file mode 100755
index 00000000..e5a3ad3e
--- /dev/null
+++ b/test/unittest/usdt/tst.lib-loadbias.x
@@ -0,0 +1,14 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, d-Matrix Corporation. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# This test needs GNU ld or lld.
+
+if ! test/utils/linkers.sh > /dev/null; then
+	echo "neither GNU ld nor ld.lld is available"
+	exit 2
+fi
+exit 0

-- 
2.55.0


