Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794955041;
	b=jGxjSWYH+vTcCTCTlGf9evlGXBdJTJD5miLvJqn1KgK5uYwqGdD3AnQf+lhNUAPBRumi
	 ccTB5bSGplwzYHHh6dL7EIRwTzuTLnhDKLXPL55uCIv+dtVh3BuXLjle1EmMH9xNtau52
	 xegseXteUzu9cH1e8+S6jLqD9Iuyf88sdeiqT1d3E96maYwQ53c7dm+tFG70KoajXxdL1
	 reZ+0t514DubnJlBwrUF+C86tSVB3pIyQ9ErIyDBqeFDeOAQihWrvyW3666Btok4rcbp2
	 q1j0h0u0ndqd+0kfHnxYh+huiuDoetAQ0o1Tj0CUmJMYaBtY1TZbtDKPcM+m7XRRy1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955041;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FXRrabE36BaKL5153Y4rjJq2ojsS4ULAnoMZGqgnImg=;
	b=gH9AAOIpizYcm2MNT+fIjVxrDrmYhRLhswX/pTwPOuL8YLDHGLgecwD1P0tbAoRDOqng
	 34mzMsDZqTZFTzhWvyEPoO4PZp/rPglfaECiLxWuGx3qi0EXpoUuHxxvSl4vpmuEk14Wm
	 nPgfZLQIu4cdIQA23VdEW0zBRI5LgUypWG+RLAetkSMRdbYZ7bwzb49fcRWzc5e3NUtHo
	 BnI0NgNs7fts9Nq6djCLHuh3ZEorgVRLy33fgFvOTH/2zBKxtyFz50H4s0imQzACAGRL0
	 8cpo/c19u8vPQEGB1gke9j+uAwzEghk0S34IYJIkItWNh3BwJE6LnSvS/hW6Tk++aMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="GOa2/5Uw";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB81606A32A
	for <dtrace@lists.linux.dev>; Tue, 17 Nov 2026 22:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GOa2/5Uw
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794955040;
	b=RGyaXbM7SpXPivcdH4ehCUE0NCtXNHpHWcRavLeqlCmKmApAkgsyzepf8WF/W1c3Bess
	 bmAY1qvAp1KZ9bTm39udT3KYjLSQO9r9DWlBWDzIJCU3SbqnFzmtNrkNtdlwibko4X1JB
	 iYF6KXQs46TZeaeIB7kasyhRMIUpGnhUw9Ld7/lplVX4UtrHZi/zF3aaTNGS8OHzg9mOv
	 qzio2zaBOgqLaIaBCbTbRwHhQhQPxSklEhLMd6tMQYYGQd1L12VJlk8/haB29YelqsYle
	 IHTAM7W9zGyEFwGY8GwccRHO35GLr6nbN2s6UQdOfqEsoCnj6Jzq69U6qYmlMsjFExQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794955040;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FXRrabE36BaKL5153Y4rjJq2ojsS4ULAnoMZGqgnImg=;
	b=s9C/J75CumN6Ps5iHNnwnl5D1Owbn70W+hQHROcFmzqhAdOd7j96tBSQg6N7Sbaf2HdW
	 1Qbpd1dvs3pI6m/LRUPqPQkibKu6vek3jm9DjircO2nsyrRAagwxIUeSI+5ZFFtNnLi40
	 KP80Vybb6qDktOzYw+I+O29c4kymVEMda2zEMTzzKJF9xJmbS5tjAw4lW0S0HDFOrHmdq
	 X7JwHsiOorVG17e3JFqtZTg6ftVE+rvdFqhMX2ELqqh5cXkeNLIFC5PYzWx3tFrIc4JZp
	 GPccdoSay8Lk0CSLs0Chm/+0jwc3YI8zqUtLGvEZcKXFRQvl1NIiDi5BKZjXBo4poHA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C82301F000C8;
	Tue, 17 Nov 2026 22:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794955040;
	bh=FXRrabE36BaKL5153Y4rjJq2ojsS4ULAnoMZGqgnImg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=GOa2/5Uw8lLOMR1fOeI64BEHpk7YpjW5HppXGxz56LR2DhlB3HJCUyHcdWt9RpXyY
	 qc/SCjdJ41h6ATIFaNCQYzfcwdFQBswhxWNFuabpNKNCpXFTssVx2WPw2a/zaqwRC3
	 Vs4WJpNUrlNJZwpPjejmBBKFe1wcvNtEbJktyfjpihG07AT4IKTjI5UJ9AADPXs++Q
	 15kdbh+AomNv1lGekTbewIu4jureOeyly9ypX0/hmcDa/RYlpLQfpyO48bv+ppuMy4
	 xk9FwHogxkspH08WvNNLZp5qs116Q9ZTT+aLPFxv+xAQMHclV2orW+l21nk5qin/Y+
	 dVpUclrUlc4Bg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 555254AB23;
	Tue, 17 Nov 2026 22:37:19 +0000 (UTC)
From: Eslam Almorshdy via B4 Relay <devnull+ealmorshdy.d-matrix.ai@kernel.org>
Date: Tue, 17 Nov 2026 22:36:42 +0000
Subject: [PATCH RFC 4/7] pid: use the load bias for "-" probe addresses
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
Message-Id: <20261117-b4-bug003-load-bias-v1-4-dcd0f6cde412@d-matrix.ai>
References: <20261117-b4-bug003-load-bias-v1-0-dcd0f6cde412@d-matrix.ai>
In-Reply-To: <20261117-b4-bug003-load-bias-v1-0-dcd0f6cde412@d-matrix.ai>
To: dtrace@lists.linux.dev
Cc: Nick Alcock <nix@esperi.org.uk>, 
 Kris Van Hees <kris.van.hees@oracle.com>, 
 Eslam Almorshdy <ealmorshdy@d-matrix.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794955038; l=1901;
 i=ealmorshdy@d-matrix.ai; s=20261015; h=from:subject:message-id;
 bh=Ba2dqKblhN6fUwK+BhnR3eR4ISE0CjmX2XByv8VZtUc=;
 b=S6zUGCUMncKOWm69Jeq5TaDm8sZ8RDYiJ10tt1Aq9GVCkBiDDL//sbx9uKqbaRKILKMmHOuuE
 uJArfoiWn4wBojjsDXxMdAIJmfBWhLiLNZ77QU5N+VliG5XsDNEaWz+
X-Developer-Key: i=ealmorshdy@d-matrix.ai; a=ed25519;
 pk=E4tVAIvp2rvz2CB7Re6YVMP6FiUVSxuq0TUtjGQL5NM=
X-Endpoint-Received: by B4 Relay for ealmorshdy@d-matrix.ai/20261015 with
 auth_id=1187
X-Original-From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
Reply-To: ealmorshdy@d-matrix.ai
Content-Transfer-Encoding: 7bit

From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>

The address in pid$pid:a.out:-:ADDR is a link-time address, as printed
by nm.  Since commit 814a29b3 ("pid: ensure pid offset probes perform
lookup with adjusted address"), dt_pid_per_mod() relocates it by the
load address of the first mapping if the mapping is flagged MA_PIC, and
by 0 otherwise.  Both are wrong in some cases:

  - the first mapping's address is the load bias only for objects
    linked at 0, so for a PIE linked elsewhere (lld --image-base) the
    address is too high by the link address;
  - MA_PIC is only set once libproc knows the object is ET_DYN, which
    it does not yet know when attaching to a running process (-p), so
    ADDR is not relocated at all, even for an ordinary PIE.

Either way the lookup fails and the probe is not created.  Use libproc's
load bias (0 for ET_EXEC) instead, keeping the old value as a fallback.

Signed-off-by: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
---
 libdtrace/dt_pid.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 7741e6d9..5d2d044f 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -502,7 +502,15 @@ dt_pid_per_mod(void *arg, const prmap_t *pmp, const char *obj)
 	pp->dpp_dev = pmp->pr_dev;
 	pp->dpp_inum = pmp->pr_inum;
 	pp->dpp_vaddr = pmp->pr_file->first_segment->pr_vaddr;
-	pp->dpp_base = (pmp->pr_mflags & MA_PIC) ? pp->dpp_vaddr : 0;
+
+	/*
+	 * The address in a "-" probe name is a link-time address: add the
+	 * object's load bias.  The first segment's load address is only the
+	 * bias if the object is linked at 0, and MA_PIC is not yet known when
+	 * attaching to a running process.
+	 */
+	if (Paddr_to_load_bias(dpr->dpr_proc, pmp->pr_vaddr, &pp->dpp_base) < 0)
+		pp->dpp_base = (pmp->pr_mflags & MA_PIC) ? pp->dpp_vaddr : 0;
 	pp->dpp_file = pmp->pr_file;
 
 	/*

-- 
2.55.0


