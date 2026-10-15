Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4A41FCFFC
	for <dtrace@lists.linux.dev>; Thu, 15 Oct 2026 03:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792036452; cv=none; b=R+4tK1aKzcueGFdx7KZES16UYX8FXJQdyr5HatjA4ZNG/6YSx6qZXnnX4LYgPVWxMiwQLi9lgdEtrfO5vHiwTV5EL2sPf0tqriBzF0iNkUuelOak8mMGeCwiWDB2ikmx4k5aG16PJUVmj/n1tudOAmRAjQs4enYNiTbD5ShvaBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792036452; c=relaxed/simple;
	bh=eIAW4R3g+Ur6PB6RDewKwZU6s5wEL3uNjY0Temyb+1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pqu0YK1SCn0yRctOHPX6H/D3dqMkKSAz+VFvhYWdS39Ug+/qv1b9/9cVoAT4LMFdh/iSoGZ7U06y8K6nJvkC3Z5YB0Z2yPknVNw0eFpscUP2K9HqC8MR2bRh8pa1+ayr/v16l4xhaOjy0aZwxnbzdUgvtPcbO7DKpOEp3HrbCUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tviZcPb9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tviZcPb9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A919CC2BCFB;
	Thu, 15 Oct 2026 03:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792036451;
	bh=eIAW4R3g+Ur6PB6RDewKwZU6s5wEL3uNjY0Temyb+1k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tviZcPb9ACOpoIDGPKWyXB+gIg7z2voEyTniIbkoRlVd/xvF78GGZg9+6OgWhXS2h
	 Iv5Lj33cyrvVZq9OrbTEns4XwwwjjCo6drJj8SBExE5pU80tY/1vUgcZYjBLimzSjj
	 4+fTP/bhtksVeK3WekV9eqGovEqa/iF+rXU9nBc1LTgrUjoLBDsZZXLtu8f4+n7yaP
	 AfMKSoSbCmsD4BRgrEbh/1Q9JDOYSzVn0Xp8IPNfgTHjWYOJT5glpM0zpBG1EqL1kT
	 LPoalGtNcd2Kh/oI19ApcmDL6feDFtJSvBwXdh1t1QO2LkgAsFS2S8SJVRoXSY0ha/
	 mJECMzW2PfGaA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8670ACC6B1C;
	Thu, 15 Oct 2026 03:54:11 +0000 (UTC)
From: Eslam Almorshdy via B4 Relay <devnull+ealmorshdy.d-matrix.ai@kernel.org>
Date: Thu, 15 Oct 2026 03:53:41 +0000
Subject: [PATCH 1/7] libproc: keep the file offset of each mapping
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bug001-uprobe-file-offset-v1-1-bf4c53af8f39@d-matrix.ai>
References: <20261015-bug001-uprobe-file-offset-v1-0-bf4c53af8f39@d-matrix.ai>
In-Reply-To: <20261015-bug001-uprobe-file-offset-v1-0-bf4c53af8f39@d-matrix.ai>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Kris Van Hees <kris.van.hees@oracle.com>, 
 Alan Maguire <alan.maguire@oracle.com>, 
 Eslam Almorshdy <ealmorshdy@d-matrix.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792036450; l=1468;
 i=ealmorshdy@d-matrix.ai; s=20261015; h=from:subject:message-id;
 bh=h+L/p2iB1MUcfPH4EbEw1TGI8PX4JVbH/4ZEVmIsTts=;
 b=v0e8GHqyiUCBorL32AJE9zyCm+f7MQdJASjf6xHsAJWItnpyjMamhqyy9P+US5+GikoxLHkGp
 B409ckmpFABCYYHU7zPxfiHPPoxzDNKYiocuu9szqwztTbT0uci80sz
X-Developer-Key: i=ealmorshdy@d-matrix.ai; a=ed25519;
 pk=E4tVAIvp2rvz2CB7Re6YVMP6FiUVSxuq0TUtjGQL5NM=
X-Endpoint-Received: by B4 Relay for ealmorshdy@d-matrix.ai/20261015 with
 auth_id=1187
X-Original-From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
Reply-To: ealmorshdy@d-matrix.ai

From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>

Pupdate_maps() parses the offset field of /proc/<pid>/maps but discards
it.  Store it in a new member, prmap_t.pr_offset: uprobes are placed by
(inode, file offset), so converting a runtime address to a uprobe offset
needs the file offset of the mapping that contains the address.

No functional change.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
---
 include/sys/sol_procfs.h | 1 +
 libproc/Psymtab.c        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/sys/sol_procfs.h b/include/sys/sol_procfs.h
index 49eb29fb..52360f2d 100644
--- a/include/sys/sol_procfs.h
+++ b/include/sys/sol_procfs.h
@@ -42,6 +42,7 @@ typedef struct prmap {
 	uintptr_t pr_vaddr;	/* virtual address of mapping */
 	char	*pr_mapaddrname; /* address text from /proc/<pid>/maps */
 	size_t	pr_size;	/* size of mapping in bytes */
+	uint64_t pr_offset;	/* offset of the mapping in the backing file */
 	int	pr_mflags;	/* protection and attribute flags (see below) */
 	dev_t	pr_dev;		/* device number */
 	ino_t	pr_inum;	/* inode number */
diff --git a/libproc/Psymtab.c b/libproc/Psymtab.c
index e648c5aa..7876e9a8 100644
--- a/libproc/Psymtab.c
+++ b/libproc/Psymtab.c
@@ -639,6 +639,7 @@ Pupdate_maps(struct ps_prochandle *P)
 
 		pmptr->pr_vaddr = laddr;
 		pmptr->pr_size = haddr - laddr;
+		pmptr->pr_offset = offset;
 		pmptr->pr_mapaddrname = mapaddrname;
 
 		/*

-- 
2.55.0


