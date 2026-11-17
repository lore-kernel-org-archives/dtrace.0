Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794955040;
	b=XYSJlCOBBMfswO6ZEOzsZvvnAe6OeOus8QWEzyRNmAN11U4E3ssa7obXBj0fVnPTCM10
	 w0qjT8ao5IObR1d7WutFQwzEwpzqPNDcRMqWtemiMautDSeEeadKVE4d775vhNKgqU4da
	 LqY+dpuj5fvfZmfprqE/2T9SKXGKQynmCIoVJc5XR6dBnX40BqQmeQVg2+AaJkzOu6qfN
	 EHg6nEes2FWlZD8lRj0YHOdWHzmpRMiEi3aYtvX2F1MB2zL1/nPB48V6Fdk3VwTnrGHA2
	 fXs37P/bhHWJiybhK7VUxybroO4/yRWK1M+NZr8Ip+/LjabM5in8OfhTpjdvVUMgVOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955040;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=5Iky65VaWfZi+Z5hcQcbpQ5mkalDKPbV0cigOrfiBao=;
	b=j1mwWudJ12ERqtxX+R75Sfcr0ONz5NIWmc+lcaXb2cunp7UAGBUfSfLGfdXV0/1bRSdh
	 p82X8NyDvPCymtA6Hn5Bt/Ln1FeDvNweJREg7nA1s+O1z1JRX5x1WtpCfQ6DsuU2C7LQ0
	 C2WjYJVm5VySTpcRIhdBvHRDFR086tHsq2Jf0ifM/6vcF0aoJ+dK5rlzX3bAtxnX57XXe
	 ogeg7XnXrIxE2MGbyDhS1Vzer0F0E8Y5Em66HjtYhqz17/dyIuWglGG6bY2YTLElQ/TOn
	 UiyGTTN9uztonHRTdpuey7OZWOVjJG3ReAH/fDQOORXozFuzOYpPEHkOwrpGxjCQ4bQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kh1J4avY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938E8606A31C
	for <dtrace@lists.linux.dev>; Tue, 17 Nov 2026 22:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kh1J4avY
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794955040;
	b=WaNJnwNp2C8lL39+ayJA1+B3MkOLrSmFtjR34JvCxl3L7IfZvY2pBrX4JsSHfcH4685K
	 cG7Y4yPhGsGcfhXyCBzCOYrWBd0m4UbCZCXHw5of8PkRV5KZWyCxxt0YBIfdLzjrd0lZe
	 9/VoPeMvuSp6U/GCYVcfRs4KSd+rUh6nqBtIkXA/ViF8zBGgwUiGZ8Uab0TkN0TUgvrDQ
	 o9Sz6Qz/5vK8tC2BkGs46q1svNxukA2vnBh/vqrPcgxQj5t4Tn1axX3L7Ghl71krkAlkE
	 /mVuzdccGt71Z2kV4kpqLXeyiB2zvqafE3PJHoC5c9oxSc7ylQpDXKCHJhVmWGJi7mQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794955040;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=5Iky65VaWfZi+Z5hcQcbpQ5mkalDKPbV0cigOrfiBao=;
	b=Nv0TpMFmt96ViuVWnwbcJvVBO7qTv3isB5Ik6HIt1IcJ7kzGnFltPTwkt6JF/cBEfC/D
	 pF7MvPKkPRAxNHPvTd1kxvZeVfilbQI9ejhCArxb+9/xXf6vwSgo84sMCKG+JoxuqfwEV
	 9Nz2q/CcE/bdMqmP8Kov/VuV/3dIRpq3xo61g6U7SEMu6y+83jRdKgqv5KTFXwMq0cAWZ
	 Zdf1fIsvTsaVYANU4zQpsHQiof+ZwgdsBE/j9upJsQHiOWJ14msAcYl1hS7fsCyNZ13m0
	 6lcJYe8DhpyGbNNeQRUzNRrayJ2gjwRex7OP2PdiVDZey8Z5UmE3fPyWuZCLVeDZi8w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 926E11F000C4;
	Tue, 17 Nov 2026 22:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794955040;
	bh=5Iky65VaWfZi+Z5hcQcbpQ5mkalDKPbV0cigOrfiBao=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Kh1J4avYMbFxaOza8FLyrnY0gurCy5cyGRnHGK8dz7FY/q4Dt/MZUFeQIcogwn8mB
	 SiMGtvcS1gYy6rcT2k682hqUaA0k3PqDBTxNOo2jIWXkKm3UFtn9qozTHK34lwcaDi
	 3e0RIk4BBT2uVaKhxDVs71h0qjmZPR0p+U00UUqNmJ+U4CBSmozKLuFoPBE1bNpYKE
	 SItSUWfCXZLPijg+cSHb4JR1dro0eb5wLqrXo7/eRQuKghCl6DFhAfFqtH1n9q4x/6
	 rOVOs6dFvddi2xuQVOuQ04LLGpREd79pYorDip7FtAC5+F9nZckBvP8s93mFjCmT43
	 PuCkn8uVeDvyg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0E8D34AAFF;
	Tue, 17 Nov 2026 22:37:19 +0000 (UTC)
From: Eslam Almorshdy via B4 Relay <devnull+ealmorshdy.d-matrix.ai@kernel.org>
Date: Tue, 17 Nov 2026 22:36:39 +0000
Subject: [PATCH RFC 1/7] libproc: fix the fallback load bias for non-zero
 link addresses
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
Message-Id: <20261117-b4-bug003-load-bias-v1-1-dcd0f6cde412@d-matrix.ai>
References: <20261117-b4-bug003-load-bias-v1-0-dcd0f6cde412@d-matrix.ai>
In-Reply-To: <20261117-b4-bug003-load-bias-v1-0-dcd0f6cde412@d-matrix.ai>
To: dtrace@lists.linux.dev
Cc: Nick Alcock <nix@esperi.org.uk>, 
 Kris Van Hees <kris.van.hees@oracle.com>, 
 Eslam Almorshdy <ealmorshdy@d-matrix.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794955038; l=1852;
 i=ealmorshdy@d-matrix.ai; s=20261015; h=from:subject:message-id;
 bh=YuYQVScNcUEIHJgrghfDwbLlI0S38/abW8No5qYGv+4=;
 b=VkDVysqBQjPQLk66cRBqdfFvkRJELYIK7EcGoP4tgZ6zpLAha32RwOgOcsR/1ToNaVWN9fhAc
 6Z5bb9REVIrA+pmDAoEYRsN081+DVp3pKD3GRYIlAei0/z14L5ugo9U
X-Developer-Key: i=ealmorshdy@d-matrix.ai; a=ed25519;
 pk=E4tVAIvp2rvz2CB7Re6YVMP6FiUVSxuq0TUtjGQL5NM=
X-Endpoint-Received: by B4 Relay for ealmorshdy@d-matrix.ai/20261015 with
 auth_id=1187
X-Original-From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
Reply-To: ealmorshdy@d-matrix.ai
Content-Transfer-Encoding: 7bit

From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>

When ld.so's link map is not available, Pbuild_file_symtab() computes an
ET_DYN object's load bias as

    first_segment->pr_vaddr - (p_vaddr & (p_align - 1))

subtracting only the part of the first PT_LOAD's p_vaddr below its
alignment.  The bias is the first mapping's start minus the page-aligned
p_vaddr (the gABI base address).  The two agree only for objects linked
at 0; for an object linked elsewhere (GNU ld -Ttext-segment, lld
--image-base) the bias is too high by the link address and every symbol
lookup in the object fails.

Subtract the page-aligned p_vaddr.

Signed-off-by: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
---
 libproc/Psymtab.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/libproc/Psymtab.c b/libproc/Psymtab.c
index 7876e9a8..b713e439 100644
--- a/libproc/Psymtab.c
+++ b/libproc/Psymtab.c
@@ -1593,14 +1593,20 @@ Pbuild_file_symtab(struct ps_prochandle *P, file_info_t *fptr)
 		goto elf_bad_noaddr;
 	}
 
+	/*
+	 * The first mapping starts at the load bias plus the first
+	 * PT_LOAD's page-aligned p_vaddr.  Subtract all of that, not just
+	 * the part of p_vaddr below p_align, or objects linked at a
+	 * non-zero address (GNU ld -Ttext-segment, lld --image-base) get a
+	 * bias that is too high by that address.
+	 */
 	fptr->file_dyn_base = prf->first_segment->pr_vaddr -
-	    (phdr->p_vaddr & (phdr->p_align - 1));
+	    (phdr->p_vaddr & ~((GElf_Addr)sysconf(_SC_PAGESIZE) - 1));
 
 	_dprintf("setting file_dyn_base for %s to %lx, "
 	    "from load address of %lx and phdr vaddr of %lx\n",
 	    fptr->file_pname, (long)fptr->file_dyn_base,
-	    prf->first_segment->pr_vaddr,
-	    (phdr->p_vaddr & (phdr->p_align - 1)));
+	    prf->first_segment->pr_vaddr, (long)phdr->p_vaddr);
 
 ret:
 	*jmp_pad = old_exec_jmp;

-- 
2.55.0


