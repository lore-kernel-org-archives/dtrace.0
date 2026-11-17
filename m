Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794955041;
	b=CJNIsJ9pgNcHfMGdZpTTUZ1NGlz7E9NKDxRjp+OZFuv2SrdKRxBl/mD1psCCVk+Pxh4l
	 oUYS3IebcWUDF5dtgS0QmteznlBbF/IRwdbRFO/gvScs2k2YVfaFFObKbMGxZ+IVyJjuT
	 VxHNKdgPC6bcWgdreTsVGU+r/XbCsPLguym/F87Ce2yL/bq8VGYIrKKrFO4PatuFXgoOu
	 PRki6RNt3Iqd//t8PDcnPbCpDjurgfN/uiWGxoPo5hbXvV5QajHnUWcLJw61DfVRESbOx
	 +7NXkCi5BxY635c8WN8T+XALQwLtZbE/Hu4dA9RtfWuJWZd/xnf9vjKnxgSf0rTrQJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955041;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6sJtaGjQ+5TaX58AO3SvAKllKobNnAcWiAGCSqcX+ok=;
	b=4xI0K17kgiqIbIFYcyadwZOI4qoJfC61W/RAZo0U3EkQ4idOnSVEdQTxF9qo5V6Cujlk
	 4KBM6gLluDEWksYy0wBBTkgFBjk5FNb83eWRWfsPxzsWyghvmFrpLm/WSfw8yRFWgeSAF
	 MHUT5T2LuarN/QPVKILOkL7/+EnXK05KecctVCT01R2TnFD9wLb7IEfmZObReznY2GhRR
	 jIqZqCckXdeF2bjyvtA6oxwENcdLPospS+UwgOgbpOyy9yQ03GyVin1V/Gzy82EdY7NZG
	 SGSuZBjnatZ5/luj9re6RmUQmduuVaJGL87vKqn63nhLB0cZkyXKiIh96eKgyqyUOfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ZoHpX5C/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700D7606A330
	for <dtrace@lists.linux.dev>; Tue, 17 Nov 2026 22:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZoHpX5C/
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794955041;
	b=iF2TInl26Aj5lsB3RfwUSZTcBm+XPi8pfw2OVudJ6AkGk9zGEN3XzV5PRD/cjih2zogH
	 HtAYtJr4zUzqavy5b5QtNNOJyhJmcJGFtr3fj5DgIdCAd8VaXrZp6rvOqo2U0FQowvUDy
	 xTMpvWGCMGhvfAwl1VvgMLlM3Rez9YL7ZT+NWIFjInV04kMAnuLF5zlLIf86wIpC8nPaa
	 GGXp3AfTLPkeTQi9o46BGo8ZQrBGzl0QciS8/3zMnkSIV94dZARCXEcQ36lJmXf7tJavb
	 aXiUQwx9ATg0ElHSRjszrvsB05b/3imzSsrX7R8tm2jdqaxEXLtOl+R02X3cGryrQJw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794955041;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6sJtaGjQ+5TaX58AO3SvAKllKobNnAcWiAGCSqcX+ok=;
	b=J/AfrVfEGzxvQDcY89T1gtRIWqMN3Dm2Zv/ecgG0tFmSa6xU0FrKwel3uHpSNXEmbR2P
	 Vxqi+Z1eZUUR4OQvW0xdd2oeqaa653+eiy5D+GwDFvdasVjxZ9fVSky19Yq8RPzMARo3O
	 F/ZnebTB36fa6nrfIfFS5UT6qWfUgd8lTZ9XRTGB4DRXxpRJz7IBZueyAABcAX2cRUKRL
	 lPjY+SU3h9rk3MB2J3Bu8fhBZnMdNGQ6Kj68NXT2Vl9wT/F7DIBpNZXY54djGZ4GYhVh8
	 f7bx2j/Pmn7xCioweFinsAlk35xs7EAiF7e/i2cuJaLJnhFjyxSrXPT86eZ7fhzy3Sw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B16051F000CA;
	Tue, 17 Nov 2026 22:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794955041;
	bh=6sJtaGjQ+5TaX58AO3SvAKllKobNnAcWiAGCSqcX+ok=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ZoHpX5C/oOm0XuN3j3I4ei7B+C3RRhABO1/Y1zylr9OYNIajXAwpjcJLQLWYgP5HI
	 w0w1mgb5ByOnu5exllR9U+Rioph0lcxzF46HymSz8OwqxHUEXCEHJTQ0T3tzEZi/yJ
	 1v52MI9iF1pAmzIfQFnHgEfJUf3yl0zfaIZgS177vf6dSe/cXyBtvaSjF20NGpBMbl
	 ZfR0jb49w6mL3BGFkKMeBxTjb9Ac62btZRKrfT+6Va67lQHSf++yR1/WBas34N+N4x
	 mGiNSl+vNXKvwO49amArN2zfEbvqNEXiXiS7HzGdBKMUWnwsBauvlbnPr5pREpGDzX
	 Dr55cDVC24zTg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 81AAB4AB2B;
	Tue, 17 Nov 2026 22:37:19 +0000 (UTC)
From: Eslam Almorshdy via B4 Relay <devnull+ealmorshdy.d-matrix.ai@kernel.org>
Date: Tue, 17 Nov 2026 22:36:44 +0000
Subject: [PATCH RFC 6/7] dtprobed: fix the USDT load bias for non-zero link
 addresses
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
Message-Id: <20261117-b4-bug003-load-bias-v1-6-dcd0f6cde412@d-matrix.ai>
References: <20261117-b4-bug003-load-bias-v1-0-dcd0f6cde412@d-matrix.ai>
In-Reply-To: <20261117-b4-bug003-load-bias-v1-0-dcd0f6cde412@d-matrix.ai>
To: dtrace@lists.linux.dev
Cc: Nick Alcock <nix@esperi.org.uk>, 
 Kris Van Hees <kris.van.hees@oracle.com>, 
 Eslam Almorshdy <ealmorshdy@d-matrix.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794955038; l=2391;
 i=ealmorshdy@d-matrix.ai; s=20261015; h=from:subject:message-id;
 bh=ViXW6Fjdic9ZZgQ9WlQHCjn5bwm83dfPgvTDBQ7Wzw0=;
 b=Mpahp5D02ndiel9lqQOPsLXHkadW5EYu1aPEDn+YpHXmJb/nXvMlNw4FQxcDNB3p5jo23Ieaj
 BtOujPybilGCEeS8nRHYwUUcUrx06mZyGzSNHCftHAFfONsSO+I7fIG
X-Developer-Key: i=ealmorshdy@d-matrix.ai; a=ed25519;
 pk=E4tVAIvp2rvz2CB7Re6YVMP6FiUVSxuq0TUtjGQL5NM=
X-Endpoint-Received: by B4 Relay for ealmorshdy@d-matrix.ai/20261015 with
 auth_id=1187
X-Original-From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
Reply-To: ealmorshdy@d-matrix.ai
Content-Transfer-Encoding: 7bit

From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>

For USDT probes in ELF notes, dtprobed passes the load address of the
object's first mapping as dofhp_addr, and the note parser adds it to
each probe's link-time address.  That is the load bias only for objects
linked at 0.  In a shared library linked elsewhere (GNU ld
-Ttext-segment, lld --image-base) every probe address is too high by the
link address, libdtrace finds no mapping for it, and no probe is
created.

Subtract the first PT_LOAD's page-aligned p_vaddr, as libproc now does
for its computed load bias.

Also log the DOF helper after the adjustment, so the debug output shows
the address actually used.

Signed-off-by: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
---
 dtprobed/dtprobed.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index 37d615bb..a84424b8 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -503,9 +503,6 @@ handle_usdt_notes(pid_t pid, uintptr_t addr)
 	dh.dofhp_addr = mapp->pr_vaddr;
 	dh.dofhp_dof = 0;
 
-	fuse_log(FUSE_LOG_DEBUG, "%i: DOF helper { '%s', %lx, %lx }\n",
-		 pid, dh.dofhp_mod, dh.dofhp_addr, dh.dofhp_dof);
-
 	exec_mapp = Plmid_to_map(P, LM_ID_BASE, PR_OBJ_EXEC);
 	if (exec_mapp == NULL || (prf = exec_mapp->pr_file) == NULL) {
 		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapping (process dead?)\n",
@@ -538,6 +535,30 @@ handle_usdt_notes(pid_t pid, uintptr_t addr)
 		goto elf_err;
 	if (ehdr.e_type == ET_EXEC)
 		dh.dofhp_addr = 0;
+	else {
+		size_t nphdrs, i;
+		GElf_Phdr phdr;
+
+		/*
+		 * dofhp_addr is the load address of the first segment.  The
+		 * load bias is that minus the page-aligned p_vaddr of the
+		 * first PT_LOAD segment, which is not 0 for objects linked at a
+		 * non-zero address (GNU ld -Ttext-segment, lld --image-base).
+		 */
+		if (elf_getphdrnum(elf, &nphdrs) == 0) {
+			for (i = 0; i < nphdrs; i++) {
+				if (gelf_getphdr(elf, i, &phdr) == NULL ||
+				    phdr.p_type != PT_LOAD)
+					continue;
+				dh.dofhp_addr -= phdr.p_vaddr &
+				    ~((GElf_Addr)sysconf(_SC_PAGESIZE) - 1);
+				break;
+			}
+		}
+	}
+
+	fuse_log(FUSE_LOG_DEBUG, "%i: DOF helper { '%s', %lx, %lx }\n",
+		 pid, dh.dofhp_mod, dh.dofhp_addr, dh.dofhp_dof);
 
 	while ((scn = elf_nextscn(elf, scn)) != NULL) {
 		const char *name;

-- 
2.55.0


