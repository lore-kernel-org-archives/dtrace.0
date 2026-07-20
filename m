Received: from outbound.ms.icloud.com (ms-2005g-snip4-1.eps.apple.com [57.103.72.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E605F1FA859
	for <dtrace@lists.linux.dev>; Mon, 20 Jul 2026 13:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.72.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784554302; cv=none; b=pkjg6yQheFWoj8pZ05dVvebRTyLr5rfIpRP0AEeC1yQ2W4xNL9SX7lcvyHOKJxuM47YP+WxctB6h3eq0+vzYpg98OTW2IIVi+JqOCnNUf+53UFT0eZTlom8Yz/Tsn0v24SWggQNBMJbvmPo51UhV5GVzLGVFRpo1lV4ppysn/6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784554302; c=relaxed/simple;
	bh=50RVpkNAdCwxnqzzUFu0MuG8rWeZOuloxdvtLq/067s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UCkHpL1Tc0KMVpMJfqPz19XT2K10CmYRO6fGjEbxLZWlM/YBN0gph3pdw0b6GgniPhXwBL9y9O4Y77fcOZa8dSKmoh8I49WumUp+8x41Q0s0ia27e3rz4a/JfazgH35qzfhIGtIEu8axEkl9MThTPqCqbp5aOwctIYHykVbx5yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com; spf=pass smtp.mailfrom=me.com; dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b=fbVixh9y; arc=none smtp.client-ip=57.103.72.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="fbVixh9y"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-6 (Postfix) with ESMTPS id 5DF5118000F2;
	Mon, 20 Jul 2026 13:31:38 +0000 (UTC)
X-ICL-RepId: 019f7fb9-9b8b-7f7c-86dc-e6b19975ad4c
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQFKHVwPWBxEDlYKWRcOVk1dF1wPdwZXXloXXk1RDw8dXFZQAlpLQBMEShMFUgddTVYNRw9YHlwUFxVAQ14IXh9MHB0OWAYSAE0KDjYGWQVeCVYDQwU2EhRdRV4IGQhdHRkVWgkKVwBAC04DWgVbA0MKSQNdGVwFRQ5LHl8aD10fWzheCBkIXR0HWEcURw4PGVoUXBhT
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai; t=1784554300; x=1787146300; bh=4AnJ4Zz5cOMnBRgdp/PRNWDTz0g7R/Mtp1F3EFpRMj4=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=fbVixh9ymv/ehMc4ueM8LMrYwrta92SbVTJes2KpmTLDrNXwhyBMjr5kpM6lxsjVcHLNeqv+SzyGi9majy11u6NU/oYfWCLYVys2Esfmt4g6ljhDbh0XEA+DTlWv0WMhByBUtqLP3cTMyJxGdARi2TfZcm2/88tvm0ef99qFtwd3vrf4+Yvmd60tR92BwVzD/9JJ1UtWZ3mtrefSbuXctboAh73FGfNXqVhfOQDJVGT3a+FoOQLCPN+MlCLieT9mSJTustUO5kNjcwWfJiA8ArxKG0bi564ql9EdazHK0B7Ztkr5mi7KGvHZkGinjkoe414VziJQ0bPoE4GjwBvomA==
Received: from localhost.localdomain (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-6 (Postfix) with ESMTPSA id 56B7518000CB;
	Mon, 20 Jul 2026 13:31:37 +0000 (UTC)
From: Jacob Carlborg <doob@me.com>
To: dtrace@lists.linux.dev
Cc: Jacob Carlborg <doob@me.com>
Subject: [PATCH 1/3] libdtrace: resolve BTF type tags when importing BTF into CTF
Date: Mon, 20 Jul 2026 15:30:58 +0200
Message-ID: <20260720133100.77573-2-doob@me.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260720133100.77573-1-doob@me.com>
References: <20260720133100.77573-1-doob@me.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE1MCBTYWx0ZWRfXxDg5TJUBuiob
 xrC/NW6hDpSlFGWr0cK76qtCzDeav/f3WHV7eEUDIowyJTDcn6/1qfIbmebsTe4F5H9Ufh4OcKw
 Sz8QFm2bA3ovfL25R23d0mtasope1R+5AakQkcJbFGmUHG83eYjsx2WlY93eC9148balu9mvE+F
 +A0atCo9Ylmoot+JWG0DUHJsyPmqvJWQUg9SPYMZwroTD0QvX4RhlIDd5KQT2NGlz+3LBVA3qBG
 Q0NAwwMbalT1VHDhLMdzZrLIgL7z8XapHBbBwAADKRVfyzz0kI0hNaOb8OLkuwwgIgEZfYVVVp6
 p5+qcRBuXSKYmSWS8li
X-Proofpoint-GUID: u0L51TXEHdQGYeUu_zCSYBnHYDVOxOY4
X-Proofpoint-ORIG-GUID: u0L51TXEHdQGYeUu_zCSYBnHYDVOxOY4
X-Apple-Category-Label: MjcyNzI1Njc5OiRjYXRlZ29yeSRfUGVyc29uYWws

Without this fix, running any DTrace commands results in:

```
dtrace: invalid probe specifier ::::
"/usr/lib64/dtrace/6.12.0/procfs.d", line 131: operator -> cannot be
applied to pointer to type "void"; must be applied to a struct or
union pointer
```

The issue occurs on kernels which have BTF with type tags. The fix is
to treat `BTF_KIND_TYPE_TAG` as a transparent modifier, resolving
straight to `type->type`.

Signed-off-by: Jacob Carlborg <doob@me.com>
---
 libdtrace/dt_btf.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
index 1f793397..1414dd1e 100644
--- a/libdtrace/dt_btf.c
+++ b/libdtrace/dt_btf.c
@@ -672,10 +672,28 @@ dt_btf_add_to_ctf(dtrace_hdl_t *dtp, dt_btf_t *btf, ctf_dict_t *ctf,
 
 		return ctfid == CTF_ERR ? dt_ctf_error(dtp, ctf) : ctfid;
 	}
+	case BTF_KIND_TYPE_TAG: {
+		/*
+		 * A type tag (e.g. __rcu, __user, __percpu) is a transparent
+		 * annotation on the type it wraps.  CTF has no equivalent, so
+		 * we resolve straight through to the underlying type, just as
+		 * we do for const/volatile/restrict.  Treating it as ignored
+		 * (mapping it to void) would leave every tagged member -- such
+		 * as task_struct.real_parent (__rcu) -- resolving to "void",
+		 * which breaks translator compilation on kernels whose BTF
+		 * carries type tags.
+		 */
+		ctfid = dt_btf_add_to_ctf(dtp, btf, ctf, type->type);
+		if (ctfid == CTF_ERR)
+			return CTF_ERR;		/* errno already set */
+
+		btf->ctfids[type_id] = ctfid;
+
+		return ctfid;
+	}
 	case BTF_KIND_VAR:
 	case BTF_KIND_DATASEC:
 	case BTF_KIND_DECL_TAG:
-	case BTF_KIND_TYPE_TAG:
 	case BTF_KIND_ENUM64:
 	case BTF_KIND_FUNC:
 		return btf->ctfids[0];		/* Ignored for CTF */
-- 
2.50.1 (Apple Git-155)

