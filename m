Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4421D7E5C
	for <dtrace@lists.linux.dev>; Thu, 15 Oct 2026 03:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792036452; cv=none; b=KVMhD9Hbn38msuGyep1Op6EeHfnhinKAEi590fhxMCXTsR/0n7TYlu5Y9EWY9C2fn/bFUQfDoJ3Bv6FAddc6OjC9Z24GzAWBM+LaevOB+nuAPOvdnIZ55mE72xbh1E+XaWwdS8n9huLU7sgJxPdQZaY8KL0URobFSQVfJZDxED4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792036452; c=relaxed/simple;
	bh=PctxFGQ0kr6qfXUIYDTFyMSLxKHP42JhYninL5RjTSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YrCXhG2QokBSb2DLzrLtiaBkT0S0h0Z4BuBC8bicRthMjZ3tt0uD6sTF65LY3QyGhU9sxd9CyL9ZqoMZw0D2dtOq3v9iRuH7X+zaOmAKJKrFmHHnWOtpa4P1M9VzMPEWoOlTvPqcZAFPrPTvancl3sWuwPwWRaM0stt70xOk67Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SfLE6uLn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SfLE6uLn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA9CBC2BD00;
	Thu, 15 Oct 2026 03:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792036451;
	bh=PctxFGQ0kr6qfXUIYDTFyMSLxKHP42JhYninL5RjTSM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SfLE6uLnGOGc2G1kn3WfsBWVupMC785Iu/3bAKTUPUGFSiglnGzJ5cvY1eHl8LpnZ
	 CVd5+0jm67igQxUhZq6PQqgxRXy4mE35KRwCw5+No+Utg08g34y0ZN4ZxFBEyhOwc5
	 fDgV06+4ot5/Pu4mFFJ9uAOau3hPhbKgEzNhoLOTFhv5S4Hkt8p/Du523K3y25tk+O
	 16TgBRq93x/zhg3UMOX9elH4i9SJEBsyk5hXNgEXGZinvlwNp6qAPRnV0z/Khi3Ial
	 vgheQb6glL7UyEAUHeGHmLpvlT3HIJRwpZor6mMiZRQ8DW6jMgJN3ITOpnFRPQQFTA
	 Gv5UbiHYnTWYg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9424CC6B2F;
	Thu, 15 Oct 2026 03:54:11 +0000 (UTC)
From: Eslam Almorshdy via B4 Relay <devnull+ealmorshdy.d-matrix.ai@kernel.org>
Date: Thu, 15 Oct 2026 03:53:44 +0000
Subject: [PATCH 4/7] usdt: place uprobes by file offset
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bug001-uprobe-file-offset-v1-4-bf4c53af8f39@d-matrix.ai>
References: <20261015-bug001-uprobe-file-offset-v1-0-bf4c53af8f39@d-matrix.ai>
In-Reply-To: <20261015-bug001-uprobe-file-offset-v1-0-bf4c53af8f39@d-matrix.ai>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Kris Van Hees <kris.van.hees@oracle.com>, 
 Alan Maguire <alan.maguire@oracle.com>, 
 Eslam Almorshdy <ealmorshdy@d-matrix.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792036450; l=1722;
 i=ealmorshdy@d-matrix.ai; s=20261015; h=from:subject:message-id;
 bh=MVfhUrCORXTWzNlqLhdWM7r7PjrLGHSXdp2ioG6pJ78=;
 b=CWKaKa6FzTcrpHb4W24ZkgDBPxqmJ8iYZEer+HICuuuEWToUTO3+gGW4X7OiWcK2ZBglvB+x8
 zrDMeMlzS8QD10jRjCCVZEzgodwzkqR7R1cnnA71U+CmF1+Li67jjWt
X-Developer-Key: i=ealmorshdy@d-matrix.ai; a=ed25519;
 pk=E4tVAIvp2rvz2CB7Re6YVMP6FiUVSxuq0TUtjGQL5NM=
X-Endpoint-Received: by B4 Relay for ealmorshdy@d-matrix.ai/20261015 with
 auth_id=1187
X-Original-From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
Reply-To: ealmorshdy@d-matrix.ai

From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>

dt_pid_create_usdt_probes_proc() converts each tracepoint address from
dtprobed to a uprobe offset by subtracting the load address of the
object's first segment.  That gives the address's distance from the
first segment, not its file offset: the same mistake as in the pid
provider, with the same effect on lld-linked executables and libraries.
Every USDT and is-enabled probe is placed 0x1000 bytes past its site.
In a small object, that address lies outside any executable mapping, so
the probe never fires and is-enabled stays false; otherwise the probe
fires in other code or makes enabling fail for the whole process
(ENOTSUPP).

Convert through the mapping that contains the address instead.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
---
 libdtrace/dt_pid.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 582862e4..7741e6d9 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -1087,7 +1087,14 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
 			psp.pps_dev = pmp->pr_dev;
 			psp.pps_inum = pmp->pr_inum;
 			psp.pps_pid = dpr->dpr_pid;
-			psp.pps_off = tp->tracepoint.addr - pmp->pr_file->first_segment->pr_vaddr;
+			/*
+			 * uprobes are placed by file offset: convert through
+			 * the mapping that contains the tracepoint.  That need
+			 * not be the first segment, and its p_vaddr - p_offset
+			 * can differ from the first segment's (LLVM lld).
+			 */
+			psp.pps_off = tp->tracepoint.addr - pmp->pr_vaddr +
+				      pmp->pr_offset;
 			psp.pps_nameoff = 0;
 
 			if (nargv) {

-- 
2.55.0


