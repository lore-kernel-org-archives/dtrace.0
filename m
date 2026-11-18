Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795044317;
	b=4tXkvZZaBqOBH3Xm8Jd9y9YwrwsIIOgBqo8uxTOBQmaN4MFwwqXCqp16im6yZMO0+ElA
	 XbUsc2OUgA5wd4J2CWNoG/Nj3e4wigy50ZqlJARzUUGHYjQw/kyOWkXvqxz5OC9vfnAPj
	 vrWXS4G8QuJ5OD1/ycfaQMXLDzqXubEKBRGAbqIrgd4ffZ667/Y118Ivb7C9WHTgKc7bA
	 j9suu+/dyTYQrJrQnPjsJBKqd66O17BKZ/OCDM7M+qoxd0pHDn+73Bau/0Vwj/rO6J7bP
	 PEQkmPaOOTX8m2y4B/N8vlbiLsJfbLVP9PL51QrPHvQd6AqqEngJMTgFiKOO3ns7x8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044317;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QK0/ZPX4AC5NUIlMijhiSJEpV/woUFPeBrg0XtdAVy0=;
	b=JLEL1mnhznaxHdKdsmyXZkpTDh0tegynmm9WxO8wdaTb0z4e7gf+yhjUSa5VOV32oUUG
	 u/mlesBL/eXEb9rl2tsixDWWOV9TN7W7PgOxX4tHIljeQPl/n3YiuE7k4RBv32VCzMZO5
	 UmOrXfIkhERAsQ6bzELX5SZgKW/7bROTGhYnt0tDA+PamDXQZZ+XqoLaoVUlwoJTI0ea0
	 ntgCqovoZ5r8iI6VT/a9Cbw3q7pPVKRkUhURtM8BoIZuT/yu8gFraYe79T4TcbhkP2Kl2
	 WoIekCS4z8yMJ5HZ06rBjdelmaw+ni2qPtoBNNJpKX30Sp2qAGPMPaWS5ddCSutOSmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WyfC9fZ6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DB4606A325
	for <dtrace@lists.linux.dev>; Wed, 18 Nov 2026 23:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WyfC9fZ6
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795044317;
	b=NsKQjkRfE4+wZQqIQG+aI0nusdFtkgAXF8u6lGkiCdRkUOwEzP3nfT2Wp8PtGYmpy9gN
	 0BPo0LCvoPFkv488fyeAKob7eM7krZdLf12ERbW9rIYtrWulVAyiLvHk+GOlbc0nTvoMH
	 SRIi0CDSG8jCv7CHJCpcgPqJlEoRYWIiw02jCGjQB3Gu17xlkFuzIXeMGDbMyBoy383OB
	 +XHs585NEAI2Uy4KMjeWQwOnXigQ5BO+PdOpT9vSDCEOG8miop/bFWJBewGY958B75HVI
	 w/RHvTBd6EHXLi0+MHyB9x4IxuBgkdjnKAf+d4Z0VOoDfKWhoQP18F/+ksEZva4k9Rw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795044317;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QK0/ZPX4AC5NUIlMijhiSJEpV/woUFPeBrg0XtdAVy0=;
	b=VijIZ899KLrpTo6zmGGlA3R9i+kB9uVU8P/Tb2EC7zC+kL5I6NNhD68jqzu9dmi5ISQk
	 A4CsFUYdexZijS4tHm4rjBkxxVwsboFpcS+gc1JRWb+iflMPBY+Xk6jke1buxnThEiMbI
	 CbOGTl63YqlpyhEyun4mlTWTK6PQv6YITxoBJ40rXNT9fHG60pmwPvZ1NGECyQGklnsHz
	 8wt4I7OjjyTnRwC6ogt1a27H7wgKj14Z10/TCsXZNg31MMysE+XelFH02fZlX5PZkOEeR
	 98v8rtVt+ymKRC3da9gqABnUDVJtHZhH+USss1Z1JiTP/fmav+CPQBOI59KlWH0D+JA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6EA521F000C6;
	Wed, 18 Nov 2026 23:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795044317;
	bh=QK0/ZPX4AC5NUIlMijhiSJEpV/woUFPeBrg0XtdAVy0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=WyfC9fZ6TYjAVEISxEn9dfE9SduH9Zlgi4rNRqvRxXK+2AHfsTiqp2IPsNsX1T1th
	 yfZnmk6urgGkwfepprI+379WSZ0jd0Y3C5HMf6aEBDimkUETTNbt0i8Ixru0ANfBdh
	 zzCZ2cuKnx7iV5z9acBZLb6sv2jlNI17PRUoPrc19k0ETzBYC6QiK/+c49n63avHrC
	 vtHP5KFjvHCZBEj1GKi0Wqv4Ndq6Zgl8nE01fZu+y7Mdtoyfm012p9nStYoi7WI+sF
	 16Hb2N5FCZQh1jd5pJuiHuCnLjBK7ajqC4kUgUSZ9G4h8QAI/RDZvkhNMjG2+uAfge
	 GwIPUBElMlXpA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EFA284B032;
	Wed, 18 Nov 2026 23:25:15 +0000 (UTC)
From: Eslam Almorshdy via B4 Relay <devnull+ealmorshdy.d-matrix.ai@kernel.org>
Date: Wed, 18 Nov 2026 23:25:05 +0000
Subject: [PATCH 2/2] test: add test for system daemons with regular files
 as streams
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
Message-Id: <20261118-b4-bug008-daemon-readlink-v1-2-187c9eb22d11@d-matrix.ai>
References: <20261118-b4-bug008-daemon-readlink-v1-0-187c9eb22d11@d-matrix.ai>
In-Reply-To: <20261118-b4-bug008-daemon-readlink-v1-0-187c9eb22d11@d-matrix.ai>
To: dtrace@lists.linux.dev
Cc: Kris Van Hees <kris.van.hees@oracle.com>, 
 Nick Alcock <nix@esperi.org.uk>, Eslam Almorshdy <ealmorshdy@d-matrix.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795044315; l=4037;
 i=ealmorshdy@d-matrix.ai; s=20261015; h=from:subject:message-id;
 bh=yDF0D43XW758YL8hvfsIvhrmkyTvfY82BKQGj04GcnE=;
 b=7HjMy9rZZeOOm212xzsu9Kq1NbvObb7wdiQ2a/sDosP2xOXZQorC+RzJiEQ16vsY9Dc+08hWW
 8vl92DdiunSBazTNPhz/9E8Bp517OkpEt4LdnVmH7hxVtIIhUkOyzMb
X-Developer-Key: i=ealmorshdy@d-matrix.ai; a=ed25519;
 pk=E4tVAIvp2rvz2CB7Re6YVMP6FiUVSxuq0TUtjGQL5NM=
X-Endpoint-Received: by B4 Relay for ealmorshdy@d-matrix.ai/20261015 with
 auth_id=1187
X-Original-From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
Reply-To: ealmorshdy@d-matrix.ai
Content-Transfer-Encoding: 7bit

From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>

Start a root process without a terminal with its stdout to a regular
file outside /var, then to one under /var, and check how libproc
classifies it from DTRACE_DEBUG: not a system daemon, then a system
daemon.

libproc asks systemd whenever /run/systemd/system exists, and for a
process in a systemd slice the slice decides.  So on a systemd system
the test runs dtrace under unshare -m, in a mount namespace of its own
with a tmpfs over /run/systemd: libproc does not find systemd and uses
the rules under test.

The first case fails without the previous patch.

Signed-off-by: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
---
 test/unittest/proc/tst.system-daemon-files.r  |  2 +
 test/unittest/proc/tst.system-daemon-files.sh | 94 +++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/test/unittest/proc/tst.system-daemon-files.r b/test/unittest/proc/tst.system-daemon-files.r
new file mode 100644
index 00000000..0a2b3945
--- /dev/null
+++ b/test/unittest/proc/tst.system-daemon-files.r
@@ -0,0 +1,2 @@
+outside /var: not a system daemon
+under /var: system daemon
diff --git a/test/unittest/proc/tst.system-daemon-files.sh b/test/unittest/proc/tst.system-daemon-files.sh
new file mode 100755
index 00000000..a24b5eb1
--- /dev/null
+++ b/test/unittest/proc/tst.system-daemon-files.sh
@@ -0,0 +1,94 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, d-Matrix Corporation. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# Check how libproc classifies a root process without a terminal when it
+# does not ask systemd: a standard stream to a regular file outside /var
+# means it is not a system daemon, one under /var does not.
+#
+# libproc asks systemd whenever /run/systemd/system exists, and for a
+# process in a systemd slice, as this one is, the slice decides and these
+# rules are never reached.  So on a systemd system, dtrace runs under
+# unshare -m, in a mount namespace of its own, with a tmpfs mounted over
+# /run/systemd: libproc does not find systemd and uses these rules.  The
+# namespace is made private first, so the rest of the system still sees
+# /run/systemd.
+#
+
+dtrace=$1
+
+DIRNAME=$tmpdir/system-daemon-files.$$.$RANDOM
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+case $DIRNAME in
+/var/*)	echo "$DIRNAME is under /var"; exit 1;;
+esac
+VARFILE=$(mktemp /var/tmp/system-daemon-files.XXXXXX) || exit 1
+trap "rm -f $VARFILE" EXIT
+
+# main PIDFILE: leave the terminal's session, write the pid to PIDFILE and
+# sleep for a minute
+cat > main.c <<EOT
+#include <stdio.h>
+#include <unistd.h>
+
+int main(int argc, char **argv)
+{
+	FILE *f;
+	int i;
+
+	if (setsid() < 0 || (f = fopen(argv[1], "w")) == NULL)
+		return 1;
+	fprintf(f, "%d\n", getpid());
+	fclose(f);
+	for (i = 0; i < 600; i++)
+		usleep(100000);
+	return 0;
+}
+EOT
+$CC -o main main.c || exit 1
+
+# run_dtrace DTRACE ARGS: run dtrace, with /run/systemd hidden if it exists
+run_dtrace() {
+	if [ -d /run/systemd/system ]; then
+		unshare -m sh -c 'mount --make-rprivate / &&
+		    mount -t tmpfs none /run/systemd && exec "$@"' sh "$@"
+	else
+		"$@"
+	fi
+}
+
+# verdict LABEL FILE: run main with stdout to FILE and print LABEL and
+# libproc's verdict
+verdict() {
+	local pid out
+
+	rm -f pid
+	./main pid < /dev/null > $2 2> /dev/null &
+	for i in $(seq 50); do
+		[ -s pid ] && break
+		sleep 0.1
+	done
+	pid=$(cat pid)
+
+	out=$(DTRACE_DEBUG=t run_dtrace $dtrace $dt_flags \
+	    -ln "pid$pid:a.out:main:entry" 2>&1)
+	if grep -q " $pid is a system daemon process" <<< "$out"; then
+		echo "$1: system daemon"
+	elif grep -q "^ *[0-9]* *pid$pid " <<< "$out"; then
+		echo "$1: not a system daemon"
+	else
+		echo "$1: no verdict"
+		grep -v DEBUG <<< "$out" | tail -2
+	fi
+	kill $pid
+}
+
+verdict "outside /var" $DIRNAME/out.txt
+verdict "under /var" $VARFILE
+
+exit 0

-- 
2.55.0


