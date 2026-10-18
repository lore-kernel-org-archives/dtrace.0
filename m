Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B514078C0
	for <dtrace@lists.linux.dev>; Sun, 18 Oct 2026 07:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309585; cv=none; b=EnW9LMnS/Qz3UQKSZebYX2QY8sXyMEGw6q5Cup24cEG/APxj2UKHboaTJT3JDZVn1U44tpnJQYcdTl5+hbIH7HppxPTsUr/5D1mvrfSXOGk//LdQxH3Y4F37T7rYzsyvBaU6kvLQgrHAEFPJEQjcpy6gMySUU0lsFCa09nFVnyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309585; c=relaxed/simple;
	bh=oemA1CrCTCitHnO29cpW/RkLpvxWwNdp6vJ0VeVIiB4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I8YlLAIHoWzSWAK3Kru+fkwGxOVoGUiAxTECOeTbNhILKo8g8APN9WPebsxQ3BYqUHDMMDB0aV0QcYb0LkNMmiBeOPlLw7hHq1XJ4BKNFeoHhgH8OhH8SMMGaJSyfUeAmOL9aXJbe4VQ6+vVZL7IqpAzoCeDLdWZytu32or32cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kU0amtfM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kU0amtfM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 340F8C2BCFD;
	Sun, 18 Oct 2026 07:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792309585;
	bh=oemA1CrCTCitHnO29cpW/RkLpvxWwNdp6vJ0VeVIiB4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kU0amtfMhPSWLgESZ2MrBa+TNfH5AjJg9qa+q1/5nJS/RVMWiYQu4pSDCAXkEw94J
	 PgiAuTO8mg43S+zgc87nxStfBEA4mDnho86QNTQmtbOcYLsAr6oTtp+Orc9Fv/LoNl
	 CayhnE/V1qM+pB+RzKxW6R5b3JRptRPvOJTomiRVkX21uWbEFe797Dr4LhFIhEgBlh
	 kqnyxmSIE75Qk1g8/jkbi7eth3kTAbiB7YEJCgUjSMZE0agZFgKRk+WcNVO+G4bMwH
	 WeOv9pUoClZIbgLe3beGzhbYFNAenjXPEbaq+qYw6csfLyIlDRh0SlSu17n2maCBWr
	 n/+EwxhhY43UQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C2ACCF2C9;
	Sun, 18 Oct 2026 07:46:25 +0000 (UTC)
From: Eslam Almorshdy via B4 Relay <devnull+ealmorshdy.d-matrix.ai@kernel.org>
Date: Sun, 18 Oct 2026 07:46:09 +0000
Subject: [PATCH 1/2] libproc: name objects by their mapped file when there
 is no link map
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-bug005-pid-noninvasive-names-v1-1-417b0f34f0b8@d-matrix.ai>
References: <20261018-bug005-pid-noninvasive-names-v1-0-417b0f34f0b8@d-matrix.ai>
In-Reply-To: <20261018-bug005-pid-noninvasive-names-v1-0-417b0f34f0b8@d-matrix.ai>
To: dtrace@lists.linux.dev
Cc: Alan Maguire <alan.maguire@oracle.com>, 
 Kris Van Hees <kris.van.hees@oracle.com>, dtrace-devel@oss.oracle.com, 
 Eugene Loh <eugene.loh@oracle.com>, Nick Alcock <nick.alcock@oracle.com>, 
 Eslam Almorshdy <ealmorshdy@d-matrix.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792309584; l=4573;
 i=ealmorshdy@d-matrix.ai; s=20261015; h=from:subject:message-id;
 bh=jLsuKRfbKhhAPOyJ+pdcKtwqpJa+0ZQwndUx8MoPuyI=;
 b=myyenk1krHapSrZTciGklBmTHcwVWStUYqq/oYQt/CKeKP7hvARMb6xIZkhRxygzxLbhmu3mm
 RgE48H0DZ8YByWN8DBvMZAC+yMR8V59+1V1WptkP4JU1CkpDKx92ysd
X-Developer-Key: i=ealmorshdy@d-matrix.ai; a=ed25519;
 pk=E4tVAIvp2rvz2CB7Re6YVMP6FiUVSxuq0TUtjGQL5NM=
X-Endpoint-Received: by B4 Relay for ealmorshdy@d-matrix.ai/20261015 with
 auth_id=1187
X-Original-From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
Reply-To: ealmorshdy@d-matrix.ai

From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>

Since commit 4aec5c99 ("dt_pid: pid grabs should be shortlived"),
dtrace creates pid probes on a running process through a short-lived
grab, which is noninvasive if the process is a system daemon, is
already being traced or may not be ptrace()d.  pid$pid probes then
fail.  For example, pid4242:a.out:main:entry fails with "failed to
lookup 'main' in module 'a.out'" when dtrace runs as root in a
container without systemd and process 4242 has no terminal.

A noninvasive grab has no rtld_db, so libproc never learns ld.so's
names for the objects in the process, and it looks objects up only by
those names:

 - Pobject_iter() passes "" as every object's name, so an empty or
   globbed module matches nothing;
 - object_to_map() matches base names only against ld.so's names, so
   neither a.out (which dt_pid_fix_mod() turns into the executable's
   base name) nor a library's base name is found;
 - Plmid() fails, so the module is named LMffffffffffffffff`main
   rather than main.

Name each object by the file it is mapped from, as map_iter() already
does for the executable and Pobjname() for any object without a
link-map name, and put every object on the base link map when there is
no rtld_db.  Invasive grabs are unaffected: the new branches are taken
only when the link-map name or rtld_db is missing.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
---
 libproc/Psymtab.c | 43 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/libproc/Psymtab.c b/libproc/Psymtab.c
index e648c5aa..06bbcaef 100644
--- a/libproc/Psymtab.c
+++ b/libproc/Psymtab.c
@@ -1673,6 +1673,25 @@ Paddr2mptr(struct ps_prochandle *P, uintptr_t addr)
 	return &P->mappings[mpidx];
 }
 
+/*
+ * The base name of an object: ld.so's name for it if we have the link map,
+ * else the base name of the file it is mapped from (e.g. after a noninvasive
+ * grab, which has no rtld_db).
+ */
+static const char *
+file_basename(const file_info_t *fp)
+{
+	const char *p;
+
+	if (fp->file_lbase != NULL)
+		return fp->file_lbase;
+	if (fp->file_pname == NULL)
+		return NULL;
+	if ((p = strrchr(fp->file_pname, '/')) != NULL)
+		return p + 1;
+	return fp->file_pname;
+}
+
 /*
  * Given a shared object name, return the map_info_t for it.  If no matching
  * object is found, return NULL.  Normally, the link maps contain the full
@@ -1696,6 +1715,7 @@ object_to_map(struct ps_prochandle *P, Lmid_t lmid, const char *objname)
 {
 	map_info_t *mp;
 	file_info_t *fp;
+	const char *base;
 	size_t objlen;
 	uint_t i;
 
@@ -1725,7 +1745,7 @@ object_to_map(struct ps_prochandle *P, Lmid_t lmid, const char *objname)
 		 * one; if none (unlikely), just return the mapping we matched.
 		 */
 		if ((fp->file_pname && strcmp(fp->file_pname, objname) == 0) ||
-		    (fp->file_lbase && strcmp(fp->file_lbase, objname) == 0) ||
+		    ((base = file_basename(fp)) && strcmp(base, objname) == 0) ||
 		    (fp->file_lname && strcmp(fp->file_lname, objname) == 0))
 			return fp->file_map != -1 ? &P->mappings[fp->file_map] : mp;
 	}
@@ -1749,9 +1769,9 @@ object_to_map(struct ps_prochandle *P, Lmid_t lmid, const char *objname)
 		 * If we match, return the primary text mapping, if there is
 		 * one; if none (unlikely), just return the mapping we matched.
 		 */
-		if (fp->file_lbase &&
-		    (strncmp(fp->file_lbase, objname, objlen) == 0) &&
-		    (fp->file_lbase[objlen] == '.'))
+		if ((base = file_basename(fp)) != NULL &&
+		    (strncmp(base, objname, objlen) == 0) &&
+		    (base[objlen] == '.'))
 			return fp->file_map != -1 ? &P->mappings[fp->file_map] : mp;
 	}
 
@@ -2252,8 +2272,14 @@ Pobject_iter(struct ps_prochandle *P, proc_map_f *func, void *cd)
 	    cnt; cnt--, fptr = dt_list_next(fptr)) {
 		const char *lname;
 
+		/*
+		 * Without the link map (noninvasive grab), name the object by
+		 * the file it is mapped from.
+		 */
 		if (fptr->file_lname != NULL)
 			lname = fptr->file_lname;
+		else if (fptr->file_pname != NULL)
+			lname = fptr->file_pname;
 		else
 			lname = "";
 
@@ -2331,6 +2357,15 @@ Plmid(struct ps_prochandle *P, uintptr_t addr, Lmid_t *lmidp)
 		return 0;
 	}
 
+	/*
+	 * Without rtld_db (a noninvasive grab, or no dynamic linker) there is
+	 * no link map: every mapped object is on the base link map.
+	 */
+	if (mptr != NULL && P->rap == NULL) {
+		*lmidp = LM_ID_BASE;
+		return 0;
+	}
+
 	return -1;
 }
 

-- 
2.55.0


