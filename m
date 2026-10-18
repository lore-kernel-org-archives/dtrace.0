Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B4135838F
	for <dtrace@lists.linux.dev>; Sun, 18 Oct 2026 02:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792291830; cv=none; b=H1Gi1v/TiwRQr74XWSYNZY+y8ywXdCJDtDqH6fG2A7Rznbtg6kpcjpjg1LdrKIk5F1xdNL4n3nIgKaQx6HZN4K9mf8WIb99PqwoQN4BzjBxgLYrJ03Q5CAAJdfZHUfvDojU+6mcMpT/y1GtI5afxAcDYXR9bhi7zclbj6b4KWhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792291830; c=relaxed/simple;
	bh=oTrTL2FN2m9ohkWxaSb73LBv15wZHiEPfNxgGRBPF80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZRnWS/l97qOZNOjJjRfx7K4u9ibDSfh1YPidslYYwXqW25YRaM4NQLkWdoQXje3SdMW6olpGAK3RXtR2pAWMY/cDQbQ4sWZBYWkMtUXjp4EorhThph9yPbPkq7hHf8ap1uHYDhvBoGjtTO5QP8HSbaBrCj7N9wGl+RPUf8btpIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sS8GrbrP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sS8GrbrP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41F3CC2BCFF;
	Sun, 18 Oct 2026 02:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792291830;
	bh=oTrTL2FN2m9ohkWxaSb73LBv15wZHiEPfNxgGRBPF80=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sS8GrbrPbXihBI6gR+HOSGvWjNgh8ZAdyjCYwjlprzyUqyun9URUSr7w51w1hzxOm
	 MN5uQkWaxI25iS2dq0Koyyu8yxrr3cSom8R/AdKX4QZEP9PLz8VahrFvUGLbi8QjUt
	 jMQ0tTFlU+nGV3+F6NX5DqCYrMyeK1oi7CIW8oW32YObqs1RegW2gvqEZf1FTLPsY8
	 6xF7J9NnDlq4AYaJrdnLYvFEi8gPZBcnSWYdIpdx32qfDjaIUAeeGHEJpP2X2Dr8ql
	 pzrlPunkV2ZvNABjjhrgPnWCCr3YdhfisSd2L0s7r8bK1FrTmlTZerPXgac14ryvrN
	 HmrV3XMCepZXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F96CCF2CA;
	Sun, 18 Oct 2026 02:50:30 +0000 (UTC)
From: Eslam Almorshdy via B4 Relay <devnull+ealmorshdy.d-matrix.ai@kernel.org>
Date: Sun, 18 Oct 2026 02:50:08 +0000
Subject: [PATCH 2/3] test: strlen() must not overwrite the rodata or the
 zeros
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-bug010-strlen-strtab-v1-2-ac5f5bc6f8a0@d-matrix.ai>
References: <20261018-bug010-strlen-strtab-v1-0-ac5f5bc6f8a0@d-matrix.ai>
In-Reply-To: <20261018-bug010-strlen-strtab-v1-0-ac5f5bc6f8a0@d-matrix.ai>
To: dtrace@lists.linux.dev
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace-devel@oss.oracle.com, 
 Eugene Loh <eugene.loh@oracle.com>, 
 Eslam Almorshdy <ealmorshdy@d-matrix.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792291829; l=3956;
 i=ealmorshdy@d-matrix.ai; s=20261015; h=from:subject:message-id;
 bh=DnFczhPO3XXp5J+qPrv+iP8AwVlqrYsedqgR/gCSeQk=;
 b=lxR4klR3MmVb3nvYHtAcRj3csL8/nPwIrnZrTSXt724496nssfZJ0yeQr0NqBEV7dKszOzmTn
 KtwHymOwQXUAuIWZWDtshXx2UELmFHesDvarusDLa2yfiTCNc9rvYNo
X-Developer-Key: i=ealmorshdy@d-matrix.ai; a=ed25519;
 pk=E4tVAIvp2rvz2CB7Re6YVMP6FiUVSxuq0TUtjGQL5NM=
X-Endpoint-Received: by B4 Relay for ealmorshdy@d-matrix.ai/20261015 with
 auth_id=1187
X-Original-From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
Reply-To: ealmorshdy@d-matrix.ai

From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>

Both tests call strlen() on a string longer than strsize, then use
what it used to overwrite.  tst.no-clobber-zeros.d checks that keys
built before the call still find their elements and that a new
aggregation starts from zero.  tst.no-clobber-rodata.d checks that
inet_ntoa6(), which reads a table from the read-only data, still
formats ::1.  They are separate because when a program has read-only
data, it lies in front of the zeros and takes the whole overwrite.

Both fail without the previous patch.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
---
 test/unittest/funcs/strlen/tst.no-clobber-rodata.d | 37 ++++++++++++++++++
 test/unittest/funcs/strlen/tst.no-clobber-rodata.r |  3 ++
 test/unittest/funcs/strlen/tst.no-clobber-zeros.d  | 45 ++++++++++++++++++++++
 test/unittest/funcs/strlen/tst.no-clobber-zeros.r  |  5 +++
 4 files changed, 90 insertions(+)

diff --git a/test/unittest/funcs/strlen/tst.no-clobber-rodata.d b/test/unittest/funcs/strlen/tst.no-clobber-rodata.d
new file mode 100644
index 00000000..1b452fd5
--- /dev/null
+++ b/test/unittest/funcs/strlen/tst.no-clobber-rodata.d
@@ -0,0 +1,37 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: strlen() does not overwrite the read-only data.
+ *
+ * SECTION: Actions and Subroutines/strlen()
+ */
+
+#pragma D option quiet
+#pragma D option strsize=32
+
+BEGIN
+{
+	this->ip6 = (struct in6_addr *)alloca(sizeof(struct in6_addr));
+	this->ip6->in6_u.u6_addr32[0] = 0;
+	this->ip6->in6_u.u6_addr32[1] = 0;
+	this->ip6->in6_u.u6_addr32[2] = 0;
+	this->ip6->in6_u.u6_addr32[3] = 0;
+	this->ip6->in6_u.u6_addr8[15] = 1;
+
+	/* Longer than strsize: strlen() copies as much as it can. */
+	printf("%d\n", strlen("0123456789012345678901234567890123456789"));
+
+	/* inet_ntoa6() uses a table in the read-only data. */
+	printf("%s\n", inet_ntoa6(this->ip6));
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/funcs/strlen/tst.no-clobber-rodata.r b/test/unittest/funcs/strlen/tst.no-clobber-rodata.r
new file mode 100644
index 00000000..eb33a6be
--- /dev/null
+++ b/test/unittest/funcs/strlen/tst.no-clobber-rodata.r
@@ -0,0 +1,3 @@
+31
+::1
+
diff --git a/test/unittest/funcs/strlen/tst.no-clobber-zeros.d b/test/unittest/funcs/strlen/tst.no-clobber-zeros.d
new file mode 100644
index 00000000..5cd866e5
--- /dev/null
+++ b/test/unittest/funcs/strlen/tst.no-clobber-zeros.d
@@ -0,0 +1,45 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: strlen() does not overwrite the block of zeros that tuple
+ *	      keys and new aggregations are initialized from.
+ *
+ * SECTION: Actions and Subroutines/strlen()
+ */
+
+#pragma D option quiet
+#pragma D option strsize=32
+
+BEGIN
+{
+	a["k"] = 1;
+	@s["k"] = sum(1);
+
+	/* Longer than strsize: strlen() copies as much as it can. */
+	printf("%d\n", strlen("0123456789012345678901234567890123456789"));
+
+	/* The same keys must find the same elements as before. */
+	printf("%d\n", a["k"]);
+	@s["k"] = sum(1);
+
+	/* A new aggregation must start from zero. */
+	@c = count();
+
+	exit(0);
+}
+
+END
+{
+	printa("%s %@d\n", @s);
+	printa("%@d\n", @c);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/funcs/strlen/tst.no-clobber-zeros.r b/test/unittest/funcs/strlen/tst.no-clobber-zeros.r
new file mode 100644
index 00000000..68fe1b8a
--- /dev/null
+++ b/test/unittest/funcs/strlen/tst.no-clobber-zeros.r
@@ -0,0 +1,5 @@
+31
+1
+k 2
+1
+

-- 
2.55.0


