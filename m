Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794955041;
	b=c4fO4ZhkuSFMHLNmdl5S/qLmIytLISFve/lk7k14n0WmSzg/yjWvvmrIUjbpZJHuW38/
	 5ivfQDy/I4dK6KQDNRF9tIPE54FU1xubzZ/6MljiGwRRhcL2NqvphriX+dhA1Eh6O0tPw
	 2zJvDrBPlPUUNp6FS4DNcuoZooSvQ1yPL8pc3fP2uAnGFi13IWebvumYl8rSsln132vrV
	 K+vOUlU85Pu/DoNucMMpHK8UKEhaSl7OZNoToplCAsXI/yzV70d6WLemFxaHioyZxYBYX
	 joV07jPotaWzXp/zznGPMUNxRb0lK8p7d4nolbjwYPBrS3KdFdrTqpRxGpvDnsO+Jyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955041;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=mHPNaFKPqVr4zNHAkuYJg3Q2VfwPQTU8fVJM5XOaYes=;
	b=1IpEUlNqERXCI2O+V/WI6lrgTw+owuSBqoPV4KaGRV6I49YEtslNF1YITzeCCs//1xNy
	 k4/Ida91vizBFRkF/pfzrjQaT5nOfZAJE5WEitJZIjBeloqMs1ZtFVZk5FNbhSqKjwHVa
	 9WozfMy/kkLa5S55XpK3N/8OlaJryTS3H207uQ9J2EPj8LbYNA2h/Rdn3ZMHvkR8vkhun
	 eZlSDQQRpRPc4SHHGlWM6/3YdB6KZup/CUxjPIdwZlwVKiutQHhv14q+MCbgKFfr3P+g1
	 Zyi4QaKi9upcaJWXvqqdiKUeYSgfJ7aSVRwUL6TI8I406VC2mfQYUyT9aywHisgIBjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F8r5YQZg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C850606A332
	for <dtrace@lists.linux.dev>; Tue, 17 Nov 2026 22:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F8r5YQZg
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794955041;
	b=un6KbGYohPLOidXyIO4kRaO4sVi1P0S4axt3QpvAlyVf7C7NdvOUoMp3hL/bnKuVhgUU
	 3xdLziEl2TMjpnQwN85RdpWa6LVBO9rFH3zbifer7h3TT6A+xjNKhV72c2ZVAONHNorzN
	 rYDS9pzbp9ZUhIsKdLFHubVZLSQsonfC29/LWjVJXB9b5JnZQORK9EYsq/k2DVywolXAR
	 EB1BPXD71KfaotnEqMCcTMMmf1Klw3N97Drn7qwEIvcjMYiPv6KKrcAb9982iDeQr5Gmm
	 FyRWwD86E/mz2i5NCd1TaM7AHjQyRwySkRBYIIUkyPkAA32gsqcSp4ldL6BNl2x0bdA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794955041;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=mHPNaFKPqVr4zNHAkuYJg3Q2VfwPQTU8fVJM5XOaYes=;
	b=1R8G1PmYSt12d0dwCMBAZ77RippCWGTnr6nPBrZdWbbeh7Kib3o6iUPZj7H5tk2i4YH9
	 YqpXAymVCd8leUuyM8cf9lyWClF0fiiv+pAIcYSBALJoPKke2jXipm4tn8Ykmlju5piY0
	 i+U7SQczPz/C2Wjmk649tEXVN1SReY8cSII71YxvjHyheO7l9gwtTKLcYR91NxIz5m4Fl
	 S1xmOBGBS6HfkurfxiU8kMvLuUxMWvYJswgKOlbGmW4Cd/Q3JzTxUa2ZqFrG5vCZiLYnH
	 P8VXG6c3a4imex+Gmag9+o/6/JDvbh/fP0gey5OMUgsYRKqjOWUEp9FxOEpx5z76iAQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AF5511F000C9;
	Tue, 17 Nov 2026 22:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794955041;
	bh=mHPNaFKPqVr4zNHAkuYJg3Q2VfwPQTU8fVJM5XOaYes=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=F8r5YQZg7Pjjg8DpMNIYqkMDyN4OFH9Kie6/4CbY32k5zVsc2AA+2wAUGl+hnv+v/
	 EcoyX8rDV2NBFHVGkrHavg/9OELXna6geGQUEku7HmRICCPvBQ9v/ycrgV5EwAgkfG
	 UYlM10pjUQPX+hs8eKJp5OXw7BKEk2m2Qh03QoJwnAdo9VhgbmxAfLHsfZwnaKEhTf
	 hFnRgpf1ufInVgvYA5Vg6ta6vnlhGPtyjteLK2FbTR3lnjj4h+UYDYqYaaoNwmOpK8
	 9CogMKLwGLAqPGF5oUux30EzFAbr8pFAqzPOcPImKlvCpAMBFUCYy5DPiFmirq9Yrd
	 GnTNhLa2rjbUQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6B1B24AB27;
	Tue, 17 Nov 2026 22:37:19 +0000 (UTC)
From: Eslam Almorshdy via B4 Relay <devnull+ealmorshdy.d-matrix.ai@kernel.org>
Date: Tue, 17 Nov 2026 22:36:43 +0000
Subject: [PATCH RFC 5/7] test: add pid "-" probe test for -p and non-zero
 link addresses
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
Message-Id: <20261117-b4-bug003-load-bias-v1-5-dcd0f6cde412@d-matrix.ai>
References: <20261117-b4-bug003-load-bias-v1-0-dcd0f6cde412@d-matrix.ai>
In-Reply-To: <20261117-b4-bug003-load-bias-v1-0-dcd0f6cde412@d-matrix.ai>
To: dtrace@lists.linux.dev
Cc: Nick Alcock <nix@esperi.org.uk>, 
 Kris Van Hees <kris.van.hees@oracle.com>, 
 Eslam Almorshdy <ealmorshdy@d-matrix.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794955038; l=4497;
 i=ealmorshdy@d-matrix.ai; s=20261015; h=from:subject:message-id;
 bh=dQiH+AESeLnwXf9cwv1ByyOkvEcK/01fVnjiSBh0LAU=;
 b=k7SUprV3R7vBaXB/Ujkz1p1UonwrytAxBTExKQRFdRFdmN4Zq7oosM2pZC2VhLjXWmqulsU2X
 3qGzbzewz03CkADOjLmTyWgY1moC7Rs74QB7OGtTlIWzam9Xxcb4VOv
X-Developer-Key: i=ealmorshdy@d-matrix.ai; a=ed25519;
 pk=E4tVAIvp2rvz2CB7Re6YVMP6FiUVSxuq0TUtjGQL5NM=
X-Endpoint-Received: by B4 Relay for ealmorshdy@d-matrix.ai/20261015 with
 auth_id=1187
X-Original-From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
Reply-To: ealmorshdy@d-matrix.ai
Content-Transfer-Encoding: 7bit

From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>

Probe a function's link-time address as pid$target:a.out:-:ADDR in
non-PIE executables and PIEs linked by GNU ld and by lld, and in a PIE
linked by lld at 0x200000, both under -c and attached with -p.  Without
the previous patch the PIE linked at 0x200000 fails in both modes, and
every PIE fails with -p.

Linkers that are not installed are left out; the .x file skips the test
if neither is.

Signed-off-by: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
---
 test/unittest/pid/tst.dash-loadbias.r  |  1 +
 test/unittest/pid/tst.dash-loadbias.sh | 95 ++++++++++++++++++++++++++++++++++
 test/unittest/pid/tst.dash-loadbias.x  | 14 +++++
 3 files changed, 110 insertions(+)

diff --git a/test/unittest/pid/tst.dash-loadbias.r b/test/unittest/pid/tst.dash-loadbias.r
new file mode 100644
index 00000000..2e9ba477
--- /dev/null
+++ b/test/unittest/pid/tst.dash-loadbias.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/pid/tst.dash-loadbias.sh b/test/unittest/pid/tst.dash-loadbias.sh
new file mode 100755
index 00000000..28e5f395
--- /dev/null
+++ b/test/unittest/pid/tst.dash-loadbias.sh
@@ -0,0 +1,95 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, d-Matrix Corporation. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# Check that pid$target:a.out:-:ADDR fires when ADDR is a function's
+# link-time address, in non-PIE executables and PIEs linked by GNU ld and by
+# lld, and in a PIE linked at 0x200000 by lld, both for a process dtrace
+# starts (-c) and for one it attaches to (-p).
+#
+# ADDR must be relocated by the executable's load bias.  The load address of
+# its first segment is the bias only if it is linked at 0; with -p, libproc
+# does not yet know the executable is ET_DYN when the probe is created.
+# Linkers that are not installed are left out (GNU ld cannot link a PIE at a
+# non-zero address); the .x file skips the test if neither is.
+#
+
+dtrace=$1
+utils=$PWD/test/utils
+ncalls=3
+
+DIRNAME=$tmpdir/pid-dash-loadbias.$$.$RANDOM
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+cat > main.c <<EOF
+#include <unistd.h>
+
+volatile int sink;
+
+__attribute__((noinline)) int target(int x) { return x * 2 + 1; }
+
+/* With an argument, run long enough for dtrace -p to attach. */
+int main(int argc, char **argv)
+{
+	int i;
+
+	for (i = 0; i < (argc > 1 ? 100 : $ncalls); i++) {
+		sink = target(i);
+		if (argc > 1)
+			usleep(100000);
+	}
+	return 0;
+}
+EOF
+
+bins=
+for ld in $($utils/linkers.sh); do
+	$CC -O0 -fuse-ld=$ld -o pie-$ld main.c &&
+	$CC -O0 -fuse-ld=$ld -no-pie -o nopie-$ld main.c || exit 1
+	bins="$bins pie-$ld nopie-$ld"
+	if [ $ld = lld ]; then
+		$CC -O0 -fuse-ld=lld -Wl,--image-base=0x200000 \
+		    -o pie-lld-base main.c || exit 1
+		bins="$bins pie-lld-base"
+	fi
+done
+
+# last OPTION...: run dtrace and print the last line of its output (a count,
+# or an error)
+last() {
+	$dtrace $dt_flags "$@" 2>&1 | awk 'NF { last = $0 } END {
+		sub(/^dtrace: (invalid probe specifier .*: )?/, "", last)
+		print last
+	    }'
+}
+
+status=0
+for bin in $bins; do
+	addr=$(nm $bin | awk '$3 == "target" { sub(/^0*/, "", $1); print $1 }')
+	probe=pid\$target:a.out:-:$addr
+
+	n=$(last -qn "$probe { n++; } dtrace:::END { printf(\"%d\\n\", n); }" -c ./$bin)
+	if [ "$n" != $ncalls ]; then
+		echo "ERROR: $bin -c: $probe: got '$n', want $ncalls firings"
+		status=1
+	fi
+
+	./$bin wait &
+	pid=$!
+	sleep 0.5
+	n=$(last -p $pid -qn "$probe { n++; }
+	    tick-1s { printf(\"%d\\n\", n); exit(0); }")
+	kill $pid
+	wait $pid 2> /dev/null
+	if ! [ "$n" -gt 0 ] 2> /dev/null; then
+		echo "ERROR: $bin -p: $probe: got '$n', want at least 1 firing"
+		status=1
+	fi
+done
+
+[ $status -eq 0 ] && echo success
+exit $status
diff --git a/test/unittest/pid/tst.dash-loadbias.x b/test/unittest/pid/tst.dash-loadbias.x
new file mode 100755
index 00000000..e5a3ad3e
--- /dev/null
+++ b/test/unittest/pid/tst.dash-loadbias.x
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


