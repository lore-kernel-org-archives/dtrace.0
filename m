Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3BC3911C3
	for <dtrace@lists.linux.dev>; Thu, 15 Oct 2026 03:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792036452; cv=none; b=MLcGwCNiDGzIBuziwM5bJkDNCtY5tAomXkPcVEq5LGuXV0+4i92IKo4FZU1L8XJMjqkTC36QSEBPZegCfUfjObeNyAufC0GmrwgG/4BmgYP8vCEDq+i54sHtdtn6q4SwBnJ3+GKkHV3Cv5GFgHKshKpUtJAnJFZPzm1ZAYcQKmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792036452; c=relaxed/simple;
	bh=lU717Bqh3uLROlryHYtGkIBB7mh7VY1+V23bTQCx/e4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RR9hb9ficpZvXBYp4EuRIMTHoIRPJXP9F1HdoxkbT5IaZRSactKMPDNQVwwW5uHAj8wyhxQMoC3iqM8trBBE2330av7Lgx9QlgEiPnbhHSWfw7NB5QEmk24A364gpxQ04xgGZ4fgntnQn+dGXWqpuKc4O6y2bi3s//UvO23fB8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IP1FkXKM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IP1FkXKM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F4CFC2BCFF;
	Thu, 15 Oct 2026 03:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792036452;
	bh=lU717Bqh3uLROlryHYtGkIBB7mh7VY1+V23bTQCx/e4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IP1FkXKM1BviXxzajAxcp/47QsxXLxQ5XsznP+tkYtTTrUo1qJRyQy+EEXVsIek18
	 BB4ayvcxYp0lj7jeiPha0ll0FDYwweK/aaHue9TG5zqy/HVaT4xVBClImbOUlAmai6
	 ehaiFwu9vBP8CCH2+3iNDzGEcAUIFhpIQOU/+7QD9wZW9LN4/8+VpeXVM0kJl/XoTq
	 QJ2luQwDPFfKZ0EjYvuDd6kz21e7J4DIZ/A+CrUQIqMSJn/htClAo7bR1js8vXfZU1
	 M2xA202w8YnYQFru9e0JPniyj70uc3fwCT3bBoIHo0OXNwqXnkGwnIogmSjBGwVBvd
	 18nYv2a+wCJRw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F23ABCA9EDE;
	Thu, 15 Oct 2026 03:54:11 +0000 (UTC)
From: Eslam Almorshdy via B4 Relay <devnull+ealmorshdy.d-matrix.ai@kernel.org>
Date: Thu, 15 Oct 2026 03:53:46 +0000
Subject: [PATCH 6/7] dtrace provider: place uprobes by file offset
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bug001-uprobe-file-offset-v1-6-bf4c53af8f39@d-matrix.ai>
References: <20261015-bug001-uprobe-file-offset-v1-0-bf4c53af8f39@d-matrix.ai>
In-Reply-To: <20261015-bug001-uprobe-file-offset-v1-0-bf4c53af8f39@d-matrix.ai>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Kris Van Hees <kris.van.hees@oracle.com>, 
 Alan Maguire <alan.maguire@oracle.com>, 
 Eslam Almorshdy <ealmorshdy@d-matrix.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792036450; l=1417;
 i=ealmorshdy@d-matrix.ai; s=20261015; h=from:subject:message-id;
 bh=7MSt4qugApkP4bcMEtjfu2NgLPYp5aKmXcbB1Djqm04=;
 b=UAHh6NvVqLEhBop3eejdjgOXGhA4eFJ5aKHdRpjTW7JGCxEvxe9c3eDTk+Oyt0HpcD7SV+cVb
 UEBrUcNPtdKBhC7N+YkX0yj06Yi4kY7UgjitKKBV2wNcesjV00IVLfd
X-Developer-Key: i=ealmorshdy@d-matrix.ai; a=ed25519;
 pk=E4tVAIvp2rvz2CB7Re6YVMP6FiUVSxuq0TUtjGQL5NM=
X-Endpoint-Received: by B4 Relay for ealmorshdy@d-matrix.ai/20261015 with
 auth_id=1187
X-Original-From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
Reply-To: ealmorshdy@d-matrix.ai

From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>

uprobe_spec() places the dtrace provider's BEGIN, END and ERROR uprobes
on the *_probe() functions in libdtrace.so at the symbol's distance from
the object's first segment, not at its file offset: the same mistake as
in the pid and USDT providers.  With a libdtrace linked by lld,
dtrace:::BEGIN is placed 0x1000 bytes past BEGIN_probe(), never fires,
and every session hangs.

Convert through the mapping that contains the symbol instead.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
---
 libdtrace/dt_prov_dtrace.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
index 4b788507..b8437c17 100644
--- a/libdtrace/dt_prov_dtrace.c
+++ b/libdtrace/dt_prov_dtrace.c
@@ -207,11 +207,13 @@ static char *uprobe_spec(pid_t pid, const char *prb)
 		if (mapp == NULL)
 			goto out;
 
-		if (mapp->pr_file->first_segment != mapp)
-			mapp = mapp->pr_file->first_segment;
-
+		/*
+		 * The uprobe spec takes a file offset: convert through the
+		 * mapping that contains the symbol, not the first segment
+		 * (their p_vaddr - p_offset differ, e.g. with LLVM lld).
+		 */
 		asprintf(&spec, "%s:0x%lx", mapp->pr_file->prf_mapname,
-			 sym.st_value - mapp->pr_vaddr);
+			 sym.st_value - mapp->pr_vaddr + mapp->pr_offset);
 	}
 
 out:

-- 
2.55.0


