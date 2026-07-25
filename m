Received: from outbound.mr.icloud.com (mr-2002g-snip4-4.eps.apple.com [57.103.68.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59BA2F5487
	for <dtrace@lists.linux.dev>; Sat, 25 Jul 2026 18:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.68.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785002694; cv=none; b=a5uQis5M5OiXvMa6LIxRgpa0D0yaQqpF2pejhKA+zUoy0kOWwiTBvDpn4WCrJni3xauOD9qscr0sNG8jgdzk9yaU5FOJpVJ26IEa0UYRqh6p9etR2Xqou1ANh8wmCQTazAukvBTxAXMfDC877m46zMltkUfo6Jh56K1FCrVVmAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785002694; c=relaxed/simple;
	bh=Qnde7JV1yivv0mYPJriTLui5cHiZus2ewbDC24FVJ18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CgksYBgD5HC4jXEMRaZMhnKXjiu5OQ7BjGBIKZMFWzaqrjx1CqrQEwEoxVWt9g7Qt4JMYb7fU8x3HlMR8Cvx997n8yOsgv40+EGxY38kFH4gmGv1tflacYVLCaahhcgnvO3KOjjUP+1hO5z3BEZFCICidB3oig+QOllyVmRRaZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com; spf=pass smtp.mailfrom=me.com; dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b=O2G5V0uc; arc=none smtp.client-ip=57.103.68.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="O2G5V0uc"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-3 (Postfix) with ESMTPS id 83FB61800508;
	Sat, 25 Jul 2026 18:04:49 +0000 (UTC)
X-ICL-RepId: 019f9a73-83ac-7ce9-a4cb-94995fd61b57
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQBMHV8EXxxHAVYATVIPDxRWF1EtWg4cE1YVEwtTVl8VFxtcABcZUU0LWFsIWwQPH0wMUQJCBVZeVAodBFQHXQVdVlACWktCBEtFaFwFXBxAF0gdX2pLVhQEFVZDVARfUFQRV1ALWQJCD0gEXwJaCkANSApDDl4CQQtVAUBTBF0SeRVWQ1QEX04ZDEodUlZbE1UXRgk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai; t=1785002691; x=1787594691; bh=39whBzjXG3MrmPMuoTNsVoVjSBlDJVw82IdOgM25DQw=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=O2G5V0ucoSIXvpZTO7AQF2KszuY5ckwpN8c+BE64tqnBTYuNu5H3vMDiiq8h6BfQHbY/e1WuKlUUbt28F9MxIwr+oyAttXn9cfojjeZJL5KLv/x/zONEcg18wHBZ21WJKwXjo3GPpzzdOM60aItr1eMFI+7o1cCCiE08qW6c7zv1D9U1cOQ24ggyoyWzZc+3RAoc4cmoE7rM5kdD176FgecSwC9mmzfKEedkIwTQh8upgQtlBzZmc6fqUr/8k+bMDFFTjIiJGN+ngbIyb5RyObSb0CpdV6DkhM5S3FK9WfpP8eEDNS2F57/mWb5HW6dwHZsgy8KPMIaBBsHzn/yinQ==
Received: from localhost.localdomain (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-3 (Postfix) with ESMTPSA id 1970718002CF;
	Sat, 25 Jul 2026 18:04:47 +0000 (UTC)
From: Jacob Carlborg <doob@me.com>
To: dtrace@lists.linux.dev
Cc: Jacob Carlborg <doob@me.com>
Subject: [PATCH v2 1/3] libdtrace: resolve BTF type tags transparently
Date: Sat, 25 Jul 2026 20:04:07 +0200
Message-ID: <20260725180409.95012-2-doob@me.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260725180409.95012-1-doob@me.com>
References: <20260720133100.77573-1-doob@me.com>
 <20260725180409.95012-1-doob@me.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI1MDE3MiBTYWx0ZWRfX+vmu8tasRMLo
 R/ikanCajLBDDabS1DU+vue6kULonW9H1nEpqO9+6Mh4ziLL6LIdsu071bTRmdm1SH7H5jDsT2m
 73TsDss+jeCmxg3hTt5ZBBHRAiNSIIYLCXaLfkL6W5bFidbTUswfCjfyVYuGQluSnbIHk0CAotG
 d/DPtwdLH1Wvk1VAr5SX8nqw7z8On97blztocqXfU0hci0Q2hgvysdm2JIA3+dgoWlb8B9IjwzU
 FDSkkp+5VhjZ8MAZL2YslVVZzorDl25vez7nKl64K72AvlOvPhZfkKUjbnBByNvKAY0w6C3DGkq
 ft0vkQFKzBJvRds8wEgR25K4ALR2i8ygYJhs/Ey3Xqn+ySMIu036lcDMopjotU=
X-Proofpoint-GUID: _tsEfujH8mzPWisNp4D0S9KFN6peASqk
X-Authority-Info-Out: v=2.4 cv=dfWNHHXe c=1 sm=1 tr=0 ts=6a64fac1
 cx=c_apl:c_pps:t_out a=9OgfyREA4BUYbbCgc0Y0oA==:117
 a=9OgfyREA4BUYbbCgc0Y0oA==:17 a=RAioF0-LDSMA:10 a=x7bEGLp0ZPQA:10
 a=bRQJlwi_ETYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=HHGDD-5mAAAA:8
 a=dzYLZrrwLiEf4K5bcd4A:9
X-Proofpoint-ORIG-GUID: _tsEfujH8mzPWisNp4D0S9KFN6peASqk
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
v2: also handle BTF_KIND_TYPE_TAG as a transparent modifier in
    dt_btf_real_type_by_id() (per review feedback).

 libdtrace/dt_btf.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
index 1f793397..3ec60dcb 100644
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
@@ -860,6 +878,7 @@ dt_btf_real_type_by_id(dtrace_hdl_t *dtp, const dt_btf_t *btf, int32_t id)
 		case BTF_KIND_RESTRICT:
 		case BTF_KIND_TYPEDEF:
 		case BTF_KIND_VOLATILE:
+		case BTF_KIND_TYPE_TAG:
 			type = dt_btf_type_by_id(dtp, btf, type->type);
 		default:
 			return type;
-- 
2.50.1 (Apple Git-155)

