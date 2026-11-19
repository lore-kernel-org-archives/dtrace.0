Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795072311;
	b=sjq6Fe8asrkn8c1WMFvLQ4amcetfQ42zEtWVKYGZf7prQZ8FbQOKFKBVN/A/Kj958MTV
	 QSz17/2dUTkMzpVUnirHe5YEVbdz4GcUBqFt9XQZ0PX3Iue7tcUlWgS7LP7Dcp4IWztrd
	 rAPmcG3tGWlcilmnHwp9QME9BRcYV2aqlzx+2QK/EgP7Chqr52AN5HKGu4DrByQk2qx9z
	 iV+Z4FpStf+hFrDLfdSWj5kOE4FRwIa3fxtDSC0Rr2g1jIRZMkh0XuLKqIK0uoUwhw57k
	 GWFq71iSFOySOtXkrJWv5mkNRMmMXZ9AmVag/LqeGExCDkUFKQQwpqwzS2piF/9gBjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072311;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=duy22/DCeaTNQJSpRVYtZ0FjMkrIeGvL4OGrzRU1rIY=;
	b=vxzfC1VZmeOHShhbO4narp/09SSH4RS2AVnUM5VdSZWhbWssNRumcr/3N5B+tO7JeLZA
	 lKOm1P9BZ/ElN+ifdaons1dRoXVkaUozmtystU7xuK3nH6Ya5JLgmYLryh3fuzPnK7luA
	 aoKbZj6rCCVFGt19VaMakUV3TfrC1vdLDH/j7JgfmoyMV59GKdHQbMWwVROyt075ZyDI5
	 aYYQDF8zoiKyVAo1ic22xFNew3XuDzLF+Gl7z8pSO8tn9QcL5a+9IcGoyvHXgSEwpNqKB
	 kKZi3bCoiy51fPTILfjanJmCwrDy84QOu7Qc0tvJg1hrp08zSLTO8vfzvnMiYXLiMag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bMo1FB9+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521F7606A32A
	for <dtrace@lists.linux.dev>; Thu, 19 Nov 2026 07:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bMo1FB9+
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795072311;
	b=YsVKsq6HTDW3u/k1FJFyC1u4sHlUMCGhSBKFU3AbF3A6Gc3pPPQKslH4kq3lIRUbPyRu
	 JWZNFhjNW/EoeD2WJgJJl/i9hVc2yAhm2VJXyomPKi1FtipnUM6fI4TsRaH6uuIi2Yowf
	 HTJPJ12tVM0yVORAT+KAz26A38Bs0xB5A9FjbvHqZGgWxyvaKNNvpWWtpou6OkeVAo/os
	 TqugsjckljnhfHT5x1cH8kS43nNzCtZ3arkjGjKdRtiOCg13vlrnfCDWJhEQlLD1YlAm/
	 dsn7k8+cTWxaPEieD/iVcZPEeRPyq4mHbdoEE7i0Np/62k/6eBaRBLQmvws8nLbvk+Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795072311;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=duy22/DCeaTNQJSpRVYtZ0FjMkrIeGvL4OGrzRU1rIY=;
	b=NlFEa4R1rtfJmHf6767bmAE/hH91YCOn2QqgFto+CUXtuKGKi8EtmSDg7UhzB8n5WX/O
	 y4am8OWQ0FFq1iTwbEJtmvJ9CCCVSn4a1sCa4+OZsrtO/Fe1xpe2SH5OZ1XCNNbiEduAh
	 5s5XsQdJTzPAQn3ZkmXGh2SsdsWxbwb4tSXN7UT4LttqDb7tBc+Wpvx6OUrCJyF3MA/87
	 dXjXd6/jzv2MC+gTzZOJIMSdNKysijr1LTzzMq5D2sG2BUERxtg4dC71UJYMeFSbFiMUl
	 9j+Catjw1Kjk6P3iJHD5LNw+So9tf4lJ36qz+JDsgYJZLqJMVR1m2JejEA/gaIQbB6Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1EE9A1F000C7;
	Thu, 19 Nov 2026 07:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795072310;
	bh=duy22/DCeaTNQJSpRVYtZ0FjMkrIeGvL4OGrzRU1rIY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bMo1FB9+eTGfW/SdSdQMCWc4C3gCx17t8yOZruMfbsONFWQ+DbaEAGDuD5yGQFMHQ
	 hXX0hMOvw1O5UsIoNZ0Zzyd6TRZRVcakU29QnhKTbHpBRl3NLS1bd3pltZ/+PIc80o
	 0P+jM/mJEiecLDti44sgsuQ9dM3Vt/3KPlr+UuYwITTUd8QdN/oQ/4hZFm+1PtiEHg
	 GbWEsyexsIzsRxAeTDgeQfLKpxImjm+mhxOIQjMcvSzij2zZAkVPPcdYMf+iqW5ylk
	 HEQpUEUuIKOhSoSUboRpzvmC+bmwj3rhufgglTQmUpMN+B3RaKKUs4HBBqaB8Rahap
	 8ewStumqZQRew==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9E7F24B158;
	Thu, 19 Nov 2026 07:11:49 +0000 (UTC)
From: Eslam Almorshdy via B4 Relay <devnull+ealmorshdy.d-matrix.ai@kernel.org>
Date: Thu, 19 Nov 2026 07:11:42 +0000
Subject: [PATCH v2 2/2] test: add test for system daemons with regular
 files as streams
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
Message-Id: <20261119-b4-bug008-daemon-readlink-v2-2-c4bc5fbf156f@d-matrix.ai>
References: <20261119-b4-bug008-daemon-readlink-v2-0-c4bc5fbf156f@d-matrix.ai>
In-Reply-To: <20261119-b4-bug008-daemon-readlink-v2-0-c4bc5fbf156f@d-matrix.ai>
To: dtrace@lists.linux.dev
Cc: Nick Alcock <nix@esperi.org.uk>, 
 Kris Van Hees <kris.van.hees@oracle.com>, 
 Eslam Almorshdy <ealmorshdy@d-matrix.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795072309; l=4045;
 i=ealmorshdy@d-matrix.ai; s=20261015; h=from:subject:message-id;
 bh=qgkJo7SQMzPWTVeduOKqefc2Jpa2hQWnn48drnnysTc=;
 b=SA2Gc1SmX+yVJPXeswZsbLx5xnWAp+jEixWmaDBxPQRcnWGebxjK7D53kUImt+3QUGpZ3er5Q
 4LkfxFIOMMoDiwYZDo+ozzAV2vCDfTQf/6JhZ5yfq9yoACaRYFq50m7
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
 test/unittest/proc/tst.system-daemon-files.sh | 95 +++++++++++++++++++++++++++
 2 files changed, 97 insertions(+)

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
index 00000000..b71ebeb4
--- /dev/null
+++ b/test/unittest/proc/tst.system-daemon-files.sh
@@ -0,0 +1,95 @@
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
+if [[ $DIRNAME == /var/* ]]; then
+	echo "$DIRNAME is under /var"
+	exit 1
+fi
+mkdir -p $DIRNAME
+cd $DIRNAME
+
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


