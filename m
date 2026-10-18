Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949B5230BD5
	for <dtrace@lists.linux.dev>; Sun, 18 Oct 2026 02:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792291830; cv=none; b=Rxmh8VKZRh1boUwEWsJ2skq2JVbnlDhCK1oNbX9ZhvQl2962zTQPtLhyR06q4WElonfF2awm+4A9iIyZfME29eHNHUeRTSpKw2nDTwCCSJNseahRcGVCV2TetCxnJL0AzGsn9RZ6Q6WNjJykx+hEiTVKXAwSQDVQ/B8z4/ld46o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792291830; c=relaxed/simple;
	bh=/L5EmC65X4uJjaRDwe23M+etj/wlrCZIncpuPv2Ns9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PPf4e0pxd2ZSTj5EQagSrQ0/e+Tz7JSFQ23iC6ko+uLJrXVYQo5F+evoln5nhVHaqg/7mwaeQsdOlb/m/10SD5RbVcixaaBdyW5KiqO3wuS6HF5AoSN64WWBJrNtyqtIBKjiq8zw+hy6pAGQx0oHqq4XSOjVWyaiDr2IGw9cG1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BWgwMYYe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BWgwMYYe"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32B5BC2BCFC;
	Sun, 18 Oct 2026 02:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792291830;
	bh=/L5EmC65X4uJjaRDwe23M+etj/wlrCZIncpuPv2Ns9E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BWgwMYYeIgLT6Xqi1/cDfcMX0TIK9q4TP5bc6u+pyK70PB+e+5tFceVOy8zzGY/Cg
	 aSpZ389MftFGyFS1zLgyPUzsF+c5c2gD+sdugaK6F8/GJqACX8wX7LB4g/ReWXYbSB
	 vco03uMhZum74HcP2p46SxuLXALVuzRLPAjTOGkdpccQUh5OWorYySKtMGnu9Tj4p8
	 nE1AXPEZORzY0s+atL/emovtvXQ65eV8Um9u/eiAyYrXRAPdNJnwThzg2+GfoxWYLj
	 Wdr+mgP6BUlGzKxVmHxaYTDq0QcxpQhIawjWFyIpBqquJfLGC6ZOCtrCprVOkftSHY
	 oICYVyPex5BKg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC95CCF2C7;
	Sun, 18 Oct 2026 02:50:30 +0000 (UTC)
From: Eslam Almorshdy via B4 Relay <devnull+ealmorshdy.d-matrix.ai@kernel.org>
Date: Sun, 18 Oct 2026 02:50:07 +0000
Subject: [PATCH 1/3] Use a temporary string as scratch space for strlen()
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-bug010-strlen-strtab-v1-1-ac5f5bc6f8a0@d-matrix.ai>
References: <20261018-bug010-strlen-strtab-v1-0-ac5f5bc6f8a0@d-matrix.ai>
In-Reply-To: <20261018-bug010-strlen-strtab-v1-0-ac5f5bc6f8a0@d-matrix.ai>
To: dtrace@lists.linux.dev
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace-devel@oss.oracle.com, 
 Eugene Loh <eugene.loh@oracle.com>, 
 Eslam Almorshdy <ealmorshdy@d-matrix.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792291829; l=3180;
 i=ealmorshdy@d-matrix.ai; s=20261015; h=from:subject:message-id;
 bh=Hf27nCqM6dOxLW9NMVLnIsf8KUcmm2ovTznlmGarlSM=;
 b=dagh6PcC2AGj5imNKoRK1ZW4TrHbPONorWSQDmjOvC/FAkOkFnXTQxI4wL586d72d02tVfJsV
 /P4OZks7ox/CPAYVBFKg1Oc6o0IMhoKXsBIpNJ1P3w5TqdnHRBTBj2T
X-Developer-Key: i=ealmorshdy@d-matrix.ai; a=ed25519;
 pk=E4tVAIvp2rvz2CB7Re6YVMP6FiUVSxuq0TUtjGQL5NM=
X-Endpoint-Received: by B4 Relay for ealmorshdy@d-matrix.ai/20261015 with
 auth_id=1187
X-Original-From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
Reply-To: ealmorshdy@d-matrix.ai

From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>

dt_strlen() measures its argument by copying it with
bpf_probe_read_str() to the end of the string table in the strtab map,
at offset STBSZ.  Commit e0424837 ("Implement strlen() based on
bpf_probe_read_str()") started using that space, which was unused and
sized to hold the largest string.  Commit d9d862b6 ("Add a block of
zeroes to use to initialize BPF maps") then put the block of zeros
there, rounded up to a multiple of 8, and commit e11098e2 ("Add rodata
support") put the read-only data in front of it.  So strlen() of
anything longer than a few characters overwrites the read-only data,
or the block of zeros if there is none, for the rest of the session.

New aggregation data is initialized from the block of zeros and tuple
keys are padded from it.  So after such a strlen(), aggregations such
as @[strlen(probefunc)] = count() give counts like 8753160913407277434,
and keys no longer match the same keys built before it.  inet_ntoa6()
reads a lookup table from the read-only data and formats ::1 as
0:0:0:0:0:0:0:1.

Copy the string to a temporary string instead, as the other string
subroutines do, so that BPF code no longer writes to the strtab map.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
---
 bpf/strlen.c      |  4 +---
 libdtrace/dt_cg.c | 13 ++++++++++---
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/bpf/strlen.c b/bpf/strlen.c
index 5408ed17..4714f44b 100644
--- a/bpf/strlen.c
+++ b/bpf/strlen.c
@@ -12,12 +12,10 @@
 # define noinline	__attribute__((noinline))
 #endif
 
-extern uint64_t STBSZ;
 extern uint64_t STRSZ;
 
-noinline uint64_t dt_strlen(const dt_dctx_t *dctx, const char *str)
+noinline uint64_t dt_strlen(const char *str, char *tmp)
 {
-	char	*tmp = dctx->strtab + (uint64_t)&STBSZ;
 	int64_t	len;
 
 	/*
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index a77c022c..a58837e0 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -6448,6 +6448,7 @@ dt_cg_subr_strlen(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 {
 	dt_ident_t	*idp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_strlen");
 	dt_node_t	*str = dnp->dn_args;
+	uint64_t	off;
 
 	assert(idp != NULL);
 
@@ -6459,14 +6460,20 @@ dt_cg_subr_strlen(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 	if (dt_regset_xalloc_args(drp) == -1)
 		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
 
-	dt_cg_access_dctx(BPF_REG_1, dlp, drp, -1);
-	emit(dlp, BPF_MOV_REG(BPF_REG_2, str->dn_reg));
+	emit(dlp, BPF_MOV_REG(BPF_REG_1, str->dn_reg));
 	dt_regset_free(drp, str->dn_reg);
-	dt_cg_tstring_free(yypcb, str);
+
+	/* The string is copied to a temporary string to measure it. */
+	off = dt_cg_tstring_xalloc(yypcb);
+	dt_cg_access_dctx(BPF_REG_2, dlp, drp, DCTX_MEM);
+	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, off));
+
 	dt_regset_xalloc(drp, BPF_REG_0);
 	emite(dlp,BPF_CALL_FUNC(idp->di_id), idp);
 
 	dt_regset_free_args(drp);
+	dt_cg_tstring_xfree(yypcb, off);
+	dt_cg_tstring_free(yypcb, str);
 	dnp->dn_reg = dt_regset_alloc(drp);
 	if (dnp->dn_reg == -1)
 		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);

-- 
2.55.0


