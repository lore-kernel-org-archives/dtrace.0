Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794955041;
	b=AXE1K31UlqXO9Z3/iWbDfuRKUhk2ZeYj/ivnYeXn6X/vr56OZvNODen4Nypg9fk4zEj/
	 9JMK4mT9rD3OO3GE4nXLZNE8CTWhxBa6l/7RPPSsjmJ4gtLvSAXlKYv75soS3MRyecadr
	 3G4qvkJJ/Wh9uoFj2HVWtVIeFpN/43KxFFaTrcHIZ3S5A2JAfa76hhg8iaNeYR71p9iUl
	 YmEEn+Tc82IhtnHv0QY0DzuyputMKHj/KNJrN4EikAaKdU1u9QZYuhzTrN2gsOLHDNqJW
	 Xyqwz0M6LXmfGvW9DI7ajdqyNmCfBXXNAi7/Vtv87okQQZyxmsyZu5b5kePrDHH/9mA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955041;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4rn6cOz+4NQdtWheemPdZT/eUWVFguZtdVLaXGjo3O0=;
	b=4cdrV6MtVxTfB2BnKKyh/GXvzje6Ggx28q51fvOpyPWvkd3Xftn4Peco2meioiSSCK3D
	 PU2RTvH649LiH9roq6pd/aRGiXrfbLmOGta7q8Ut9tD7CiG2DEby1289d5cYHyeTI/vEG
	 Fidiv09Pifu7NgvwVzf1sRn77ScI1Ksp3JwbbMLQljf1e9COMsLMdmm/qhSg7Uv3NXEE8
	 W5SFeZNcVyGV0tvLnjDoLpz+BWFjXfl48ly+3Qbf2lF3gPnwpTkNf47HN3BNz93+HM0ka
	 2U4I/s/9ITmgUOjVNG/zNet0O4gFTyLCYFw5i2pmN38NRhu2ijY+Gw3a0/SFK4EogAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xrd+XqLc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F802606A333
	for <dtrace@lists.linux.dev>; Tue, 17 Nov 2026 22:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xrd+XqLc
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794955041;
	b=NCFPxeXimcyJy0bDwJxlZ+ioomZHXJuKAUHqN2msQOxHulG2Dh2BESZzctymmtVJoX68
	 mxMiiYfih2yoJDmx1jK3PNxMvSAJVUYMOv1sdKi4EiDZHNNGxNGYGiXKWhvSGlt+w9DZL
	 D+dlKQDRz5LbrhBoovWJnX087eI2Uc7RmKRt+pJMfKYniT+AnmZRYBk19sxxtUb8cgXRn
	 OXfDfw08w8onMyx8wOmwQkD+DEq7pP8BfYOyUzMbj7hIprTGUUvp5SjWiZ52Da/rgn2/Q
	 Qt0t6ky/tZ12UC+SjHPS86nj2iVALJ4MtJEXNpQt3/iFOp3gjaWHjpTS50UgZgqnYAw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794955041;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4rn6cOz+4NQdtWheemPdZT/eUWVFguZtdVLaXGjo3O0=;
	b=exdocn/akz72mHY9Yswg8HtJJMqqZQwEtywO0DmxC7jyCUhdfCNY3AbjPfwUz/mEjUx6
	 37gXUVJ3/O27j+INnynqU22MSrw80VmyRbsDlAlq9Au0AvI6O+VRuRNNv4jAtkXTPDORb
	 fpzdWOXn1lsmA2N3Es00nF9yu41EpqV1ajMiAtos9B2JYEUsiMuMSnYkJZoEHvmmFD3uW
	 belZ7flnRUxI1+VNJ5oZ7iJA8e8pG2UnNBCQMbvJXlsJfTPlzffrHgop3+S5h4e6sEbfj
	 TuleEu+KSeOEu+W0eH+WCxSAT1mqYr3dURd2bVw6clE4YCrfhJSB69jPVyH4vrhRlpg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 99D801F000C6;
	Tue, 17 Nov 2026 22:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794955040;
	bh=4rn6cOz+4NQdtWheemPdZT/eUWVFguZtdVLaXGjo3O0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Xrd+XqLcMYVIi64kc3k8x28Go4Oh04BRXCrZE0azKxykw2pV3I2Iyl2SyrJdiqF1W
	 FbQ7HdcZMU7ZsesAM+NT9gm+9zhwwVqGy0uP9gy1W8qTFt9KVvgCCCUsNhn2gKg7SW
	 PUZRDmVz+0gT2dQzh3wJGGzSQj5NMtWau7moD33q0DS6NCV/VD4ggyPpB+4FVClB3n
	 bcYGntPzUrktxCyJC3HtwPfTxr1mwBZCvXOXNdXn9griVy38tNfVCBm1D9WAkq8kx3
	 DxR4VzQAZgia1KblbF284f4Twv+2q20ykKTIX/LTpRkmIYIs4GEw0x9tYWrWpjN9Ws
	 I5dj49IMXPrfA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 25FE64AB1B;
	Tue, 17 Nov 2026 22:37:19 +0000 (UTC)
From: Eslam Almorshdy via B4 Relay <devnull+ealmorshdy.d-matrix.ai@kernel.org>
Date: Tue, 17 Nov 2026 22:36:40 +0000
Subject: [PATCH RFC 2/7] test: add ufunc() test for libraries with a
 non-zero link address
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
Message-Id: <20261117-b4-bug003-load-bias-v1-2-dcd0f6cde412@d-matrix.ai>
References: <20261117-b4-bug003-load-bias-v1-0-dcd0f6cde412@d-matrix.ai>
In-Reply-To: <20261117-b4-bug003-load-bias-v1-0-dcd0f6cde412@d-matrix.ai>
To: dtrace@lists.linux.dev
Cc: Nick Alcock <nix@esperi.org.uk>, 
 Kris Van Hees <kris.van.hees@oracle.com>, 
 Eslam Almorshdy <ealmorshdy@d-matrix.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794955038; l=4205;
 i=ealmorshdy@d-matrix.ai; s=20261015; h=from:subject:message-id;
 bh=Njf1unyjBHRByVolS5NPRPLzAKagoAYgS8m2ruhOZVc=;
 b=xLjQr0O+gYHKA6K9JBIb/pcyBScOJp5qBIyNycPYJ32SKYY3xs/6ECsf2aRiwja8fiAa2H9eR
 1ymd0d8ElstDDzZ55UNKryf5LxrBXL/ML3/PLToMDwgC4eY6f7GG+dE
X-Developer-Key: i=ealmorshdy@d-matrix.ai; a=ed25519;
 pk=E4tVAIvp2rvz2CB7Re6YVMP6FiUVSxuq0TUtjGQL5NM=
X-Endpoint-Received: by B4 Relay for ealmorshdy@d-matrix.ai/20261015 with
 auth_id=1187
X-Original-From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
Reply-To: ealmorshdy@d-matrix.ai
Content-Transfer-Encoding: 7bit

From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>

Sample a process that dtrace neither started nor attached to, and check
that ufunc() names the function running in its shared library, for
libraries linked at 0 and at 0x200000 by GNU ld (-Ttext-segment) and by
lld (--image-base).  Symbolizing such a process uses libproc's computed
load bias; without the previous patch the samples in the libraries
linked at 0x200000 are shown as bare addresses.

Linkers that are not installed are left out; the .x file skips the test
if neither is.

Signed-off-by: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
---
 test/unittest/profile-n/tst.ufunc-loadbias.r  |  1 +
 test/unittest/profile-n/tst.ufunc-loadbias.sh | 85 +++++++++++++++++++++++++++
 test/unittest/profile-n/tst.ufunc-loadbias.x  | 14 +++++
 3 files changed, 100 insertions(+)

diff --git a/test/unittest/profile-n/tst.ufunc-loadbias.r b/test/unittest/profile-n/tst.ufunc-loadbias.r
new file mode 100644
index 00000000..2e9ba477
--- /dev/null
+++ b/test/unittest/profile-n/tst.ufunc-loadbias.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/profile-n/tst.ufunc-loadbias.sh b/test/unittest/profile-n/tst.ufunc-loadbias.sh
new file mode 100755
index 00000000..a409477c
--- /dev/null
+++ b/test/unittest/profile-n/tst.ufunc-loadbias.sh
@@ -0,0 +1,85 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, d-Matrix Corporation. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# Check that ufunc() names the function running in a shared library of a
+# process that dtrace neither started nor attached to, for libraries linked
+# at 0 and at 0x200000 by GNU ld and by lld.
+#
+# Without the dynamic linker's link map, libproc computes a library's load
+# bias from its first mapping.  The bias is the mapping's start minus the
+# first PT_LOAD's page-aligned p_vaddr; subtracting only the part of p_vaddr
+# below p_align leaves it too high by the link address, and the samples are
+# shown as bare addresses.  Linkers that are not installed are left out; the
+# .x file skips the test if neither is.
+#
+
+dtrace=$1
+utils=$PWD/test/utils
+declare -A base=([bfd]=-Wl,-Ttext-segment=0x200000
+		 [lld]=-Wl,--image-base=0x200000)
+
+DIRNAME=$tmpdir/ufunc-loadbias.$$.$RANDOM
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+cat > work.c <<EOF
+volatile unsigned long spin;
+
+__attribute__((noinline)) void work(void)
+{
+	unsigned long i;
+
+	for (i = 0; i < 20000000UL; i++)
+		spin += i;
+}
+EOF
+
+cat > main.c <<EOF
+#include <unistd.h>
+
+extern void work(void);
+
+int main(void)
+{
+	int i;
+
+	for (i = 0; i < 1000; i++) {
+		work();
+		usleep(1000);
+	}
+	return 0;
+}
+EOF
+
+status=0
+for ld in $($utils/linkers.sh); do
+	$CC -O0 -fuse-ld=$ld -fPIC -shared -o libwork-$ld.so work.c &&
+	$CC -O0 -fuse-ld=$ld -fPIC -shared ${base[$ld]} \
+	    -o libwork-$ld-base.so work.c || exit 1
+
+	for l in $ld $ld-base; do
+		$CC -fuse-ld=$ld -o main-$l main.c -L. -lwork-$l \
+		    -Wl,-rpath,$DIRNAME || exit 1
+		./main-$l &
+		pid=$!
+		$dtrace $dt_flags -qn '
+		profile-997 /pid == '$pid' && arg1 != 0/ { @[ufunc(arg1)] = count(); }
+		tick-1s { exit(0); }' > out-$l 2>&1
+		kill $pid
+		wait $pid 2> /dev/null
+
+		if ! awk -v f="libwork-$l.so\`work" '$1 == f { found = 1 }
+		    END { exit !found }' out-$l; then
+			echo "ERROR: libwork-$l.so: no sample in work():"
+			cat out-$l
+			status=1
+		fi
+	done
+done
+
+[ $status -eq 0 ] && echo success
+exit $status
diff --git a/test/unittest/profile-n/tst.ufunc-loadbias.x b/test/unittest/profile-n/tst.ufunc-loadbias.x
new file mode 100755
index 00000000..e5a3ad3e
--- /dev/null
+++ b/test/unittest/profile-n/tst.ufunc-loadbias.x
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


