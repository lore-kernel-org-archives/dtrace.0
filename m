Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794955040;
	b=kzNIWcQ9h+q0tJHSdYx/6DhOGNA97SfTB6nZKkaZkelddIPEofsOKHiODT50o5fy37Pf
	 FC2BvhyoFc6CaWekFJefYQyMbtX0rbb8/Vgl0W84KBPUUbNGAEVO0bY1tyDLiRsqYecms
	 uFe55z9ycxnLTgYMAVrfzt54wKcMzjG/rYdnIAEdsFs2LjWCR7Wco+IIwYRXsAJ+DazLl
	 Q7eNgALDd6dwHxM3gM4CUROLAbdtw4VJTGNCY+gRTrSj24FdmmxC7WPNJuVFQM5r7gq17
	 OPY5D0WMfCGO6HhDaXst2IimeiEaZC3Gm9/fwl4xU8/OdxhQNrCKRP/INQhSvgm/olA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955040;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=pthw4NRqrAiTA1dM7rdyueRWdMKQhWYN+wtpvLZG78c=;
	b=NZTGCFc1uBfntkKxN9DMjZLFf0K2wdKNjfUdimN22YdbjcPgxc9ILB2B0dH6Lv6SBb/g
	 1IkvspMDkop7EYDPeVcViBhW+UZipSiBjqaLmjYeEfEWpmHZMDZXt9e4qqqLiZpKyLI8m
	 I1vq7o1K/e5WVy3pj4nTpxARW0Ygj0uVupEGe2Qifxwxjpdtb74QAqIT+R+qCE/8jqNWl
	 FHad+sMPwuJfxRQijj638Y4e6cSo69ug8E3LbgyqyTgcRj9obd2273c68n091Gvt+TLAD
	 0r6jJE8N5TfTOzLUKgI8zkTAljf7fN3AHtG8Sb3B5ThDARhTDXwpTHUiNVzby9IkRjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="lT7J/N3N";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D612E606A330
	for <dtrace@lists.linux.dev>; Tue, 17 Nov 2026 22:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lT7J/N3N
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794955040;
	b=Mn68ecrh/Wi4lqYL87at+2xACkwFImlG+GRUojMkJehAegyc767/34IyvkixwG5STaBH
	 okkqKRWBlM/Yn1vLsQS6ak4vebEHIrw/IpXRIVk546kwMnIhyuSmpxItIL2gsuL1D+w60
	 emcfW4I2VXhJo/frwbxS/nxk19wtmsepwVdG4OWOeV2hulMJQGHM+QvaSJrDikdxvpohT
	 RyWLZKLTIosNsm3b5VdlKTcALQJyWmLbeaWMfBKV7lFIScJrGMRw2gVppcrtf1mpuJt3t
	 JKtXXx2Wyc7Bjn8AtgkfoZ2gRZMLXJpPH9RNi0QAZdK/I4n2EgNYW2MUtF1Os1Kz6NQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794955040;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=pthw4NRqrAiTA1dM7rdyueRWdMKQhWYN+wtpvLZG78c=;
	b=DGaac7ysTmJe3ScniUV4+G3ZxJT/apkhHA9JbeiJKylAuLmdszeDb2u/1m4wisXThPNK
	 eJ+xR/dUb3jzgKLmL4e7jduT6rN3g+eo0z7b6s8ZOZRKzeM+b4N5qMH5qSqztbV52T8/h
	 TOt7YvRVivw1n/McKTphjNpxEBir1wJnrWGuyXrHaIHwfWRI7Tdus9AysqtiDJlNmAZ6r
	 zqWUldQHzNxMcbYCYx4KOwaO7lxPAxGVg/x6VOV6JpTSwSBNqiVQD6er0Ndf5BveUJf6j
	 WCcBiM+puZVlpDjnI81PF0FXoAHDiJTzusuwI+gyapIxLUNlBGXbjf+awcXR01oPgfA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B021B1F000C7;
	Tue, 17 Nov 2026 22:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794955040;
	bh=pthw4NRqrAiTA1dM7rdyueRWdMKQhWYN+wtpvLZG78c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=lT7J/N3NbTBRjHzzA9jpUoaY9BL5b71pkGsA9/icsqhNIN1+PAcdUzjdA3hu99NZ0
	 7fzrgdDu1vO+rmZxdd+5Hxk+SEfTdMAvtPF11FG/WKMzsv0fRv7msUQvXlvLthmTQe
	 P5IW34lsDolYOCPCzFGWPe/OH33ffD5uaxIG6PYi0MfnfTaPIF+fEhg+5SlJefudEB
	 997uid/C0hsR496nihxTiu/sKlui4p5XMYPdIRU1E9BZuGKOl1sP3JzoqOQYXJqVw3
	 kjs2BcH0Pr5Ztb1Z/xQPCXnfARv0LC6OE/Pesz6iSbgy3gDgyJ/9BVnwPPxadgm4Xi
	 qjPs5bpkjGoGg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3D12A4AB1F;
	Tue, 17 Nov 2026 22:37:19 +0000 (UTC)
From: Eslam Almorshdy via B4 Relay <devnull+ealmorshdy.d-matrix.ai@kernel.org>
Date: Tue, 17 Nov 2026 22:36:41 +0000
Subject: [PATCH RFC 3/7] libproc: add Paddr_to_load_bias()
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
Message-Id: <20261117-b4-bug003-load-bias-v1-3-dcd0f6cde412@d-matrix.ai>
References: <20261117-b4-bug003-load-bias-v1-0-dcd0f6cde412@d-matrix.ai>
In-Reply-To: <20261117-b4-bug003-load-bias-v1-0-dcd0f6cde412@d-matrix.ai>
To: dtrace@lists.linux.dev
Cc: Nick Alcock <nix@esperi.org.uk>, 
 Kris Van Hees <kris.van.hees@oracle.com>, 
 Eslam Almorshdy <ealmorshdy@d-matrix.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794955038; l=2156;
 i=ealmorshdy@d-matrix.ai; s=20261015; h=from:subject:message-id;
 bh=LDD7eY6fQEebFO9lkJUW3O43ywlFHyv32e3keoRksIE=;
 b=AKGSJJXeziONY4nUdLvauabg4/czIbgkYDMO6ODNkfIB0E5YgB7Po9Hphn4BbCMrP/a3Uk4KN
 GCSFu40vyoJD1VGY2US3BhxzEvQytj6fg/ZkOGaoSn1glu3XXA3fgSH
X-Developer-Key: i=ealmorshdy@d-matrix.ai; a=ed25519;
 pk=E4tVAIvp2rvz2CB7Re6YVMP6FiUVSxuq0TUtjGQL5NM=
X-Endpoint-Received: by B4 Relay for ealmorshdy@d-matrix.ai/20261015 with
 auth_id=1187
X-Original-From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
Reply-To: ealmorshdy@d-matrix.ai
Content-Transfer-Encoding: 7bit

From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>

Return the load bias of the object mapped at a given address, as libproc
already computes it for symbol lookups (from ld.so's link map, or from
the object's first mapping).  The next patch uses it to relocate
link-time addresses given by the user.

Signed-off-by: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
---
 libproc/Psymtab.c | 30 ++++++++++++++++++++++++++++++
 libproc/libproc.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/libproc/Psymtab.c b/libproc/Psymtab.c
index b713e439..afabf794 100644
--- a/libproc/Psymtab.c
+++ b/libproc/Psymtab.c
@@ -2279,6 +2279,36 @@ Pobject_iter(struct ps_prochandle *P, proc_map_f *func, void *cd)
 	return 0;
 }
 
+/*
+ * Given an address in the process, return in *biasp the load bias of the
+ * object mapped there: the difference between its runtime and its
+ * link-time addresses (0 for ET_EXEC objects).  Returns 0 on success, -1
+ * on failure.
+ */
+int
+Paddr_to_load_bias(struct ps_prochandle *P, uintptr_t addr, uintptr_t *biasp)
+{
+	map_info_t *mptr;
+	file_info_t *fptr;
+
+	if (P->state == PS_DEAD)
+		return -1;
+
+	Pupdate_maps(P);
+	Pupdate_lmids(P);
+
+	if ((mptr = Paddr2mptr(P, addr)) == NULL ||
+	    (fptr = mptr->map_file) == NULL)
+		return -1;
+
+	Pbuild_file_symtab(P, fptr);
+	if (fptr->file_elf == NULL)
+		return -1;
+
+	*biasp = fptr->file_dyn_base;
+	return 0;
+}
+
 /*
  * Given a virtual address, return the name of the underlying
  * mapped object (file) as provided by the dynamic linker.
diff --git a/libproc/libproc.h b/libproc/libproc.h
index 59c73051..5cbc7423 100644
--- a/libproc/libproc.h
+++ b/libproc/libproc.h
@@ -256,6 +256,7 @@ typedef int proc_map_f(void *, const prmap_t *, const char *);
 extern int Pobject_iter(struct ps_prochandle *, proc_map_f *, void *);
 
 extern const prmap_t *Paddr_to_map(struct ps_prochandle *, uintptr_t);
+extern int Paddr_to_load_bias(struct ps_prochandle *, uintptr_t, uintptr_t *);
 extern const prmap_t *Pname_to_map(struct ps_prochandle *, const char *);
 extern const prmap_t *Plmid_to_map(struct ps_prochandle *,
     Lmid_t, const char *);

-- 
2.55.0


