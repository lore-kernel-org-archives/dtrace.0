Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795072310;
	b=wnRQFyfGI3QX6Y4KinW5Q6zyXHF3rWVcL/makP3FbFHJdjZVzg7DtF2XN2GyaJS6ZIQj
	 JaZQtEuwzT6yGUTY4r9nSRuBHwIuIY5Hvh4npeTFMLKua7RBhlmUWu8U7BPyxle4vlfoc
	 thKbJhUv93NNLm6rCVpYY7RIjN3JdTcq5Juzq2SgFSJkl/rW2RHqNtx26nGOJflU3KYVs
	 f8hXUfoogvhe4F0Yqm/R7cAf149TDIJBQ+ABIifKRXIdb1flLOhcK/t4w6V5l/1AQ2NeJ
	 /NBgbl1SqyWjp2Y47sMr4r5h6NnVscra341JxymyoJi08W60fO8Rw8QuUl/H2zWIpTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072310;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=A2natG81WtfUCl7pY6YWaXC89dlUf1udN4hlI2QzqaA=;
	b=m4hhh/2R0k7yN2zQseQkAUog5QAzptgRcTTV+7Tj3W1UNBeu1XiFEcD+3UoyV5l14iSJ
	 LTkmbSKh8IbXVhoQGMdOhACTgbjTKpE1cNsalEjH5wZqd1mmQDsWx2bnyaqrEW2tYTdoh
	 YnMouvzVdC0sC7t9zKAkoBYKvs1Pg8xEjW6dmfgU4qMUPWR8ax2BHrJ2I4CW6dpNj8lIC
	 6gKHZZU4KGWKUEpWrtFDve8Ipj6pzAlKZNy2olChjQ0qj5L8Cv+Feu1XpbJxLME0z1KXn
	 qwIeojRDPgrWFTyjZ+ZQM2W+kHlPd5tTUZ5JmZ4iDo0GVus8q/NsyIA8Lf7g4rOkZoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H12Cbdpg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8474606A320
	for <dtrace@lists.linux.dev>; Thu, 19 Nov 2026 07:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H12Cbdpg
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795072310;
	b=T+6sbr8AHCqXefiCyMJvMXODbcKedXFzwkSthC87q8LPTOac67X6KDfWzh4IRgRMl1/4
	 nAXv63aGde3QDjrLWerDedLQ0nA8ApJbqhRx7WSActplrzFySCI3gEeuGkrN8RxPKWrA/
	 mgRXcR1fNpAlncDaQhlcaXuwvo3gb5nm+GtE/upVU8INKrt8g53rt7pB3og0OeY1uGg4e
	 BYlVI7B66t0xwTnKsgPcS0hGDVykK3KToUwfIeMX2NTbQ8wT0bgay5T9IVG/F916hMUdo
	 C0LIKunii3Fvzc8tiejukAeBHfyCzdzjNoPSBcO/E3wcn/0loowoaMYCv3aImP6d64w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795072310;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=A2natG81WtfUCl7pY6YWaXC89dlUf1udN4hlI2QzqaA=;
	b=BBrH13VTwlp5H5ln8optOi21ovswz1nfCW7w/zMJC5JY/EV35+zMozRNSPng/encTcQ4
	 O+1v05JMA/kM2wXnAJR35CLzvkCCv2urDndh4snOZEDmLaPpnC7br38hy0r1Z2jCQjFAB
	 t//68aDlDs24Y+39Z0zAL29wDa/ZmBybHoJhx9pIllv6+WZP9/EQ/qOJsLZvHCIoGf6uP
	 27uflw2RVHmIsUasemS8j5OEW3SxSpBA6YNU6vPu260/IghDq5cdpRjaIa710lT4cjT3V
	 i2ocLUnSJugv/Vt3jMF52V2OIZE8SRwipJywH5tQjFZut+Th52VuHhps9ZrQ8vUqFqQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0826C1F000C4;
	Thu, 19 Nov 2026 07:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795072310;
	bh=A2natG81WtfUCl7pY6YWaXC89dlUf1udN4hlI2QzqaA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=H12CbdpgLYGVz1XrcTXiuNQirYuT6MATpn5CtdSkrfibScVWJmjgCCL4QTZJWifhq
	 m96T7qkYdTjKhp8nR2sZZX7QJ8FVDAdoKFMiqiHeEQThzJDFmYNc+qg2zF0rLOWrEu
	 /OCAqT25dmRlmvGUPOzoBX8lX99gX9WI6IXCKGhExtf1Sq2HjmVbnDtg6lzHRYKNX6
	 TrGO6DN1XZ7knRmdK0Qp4U08/e34asOWJ6SLD6WQiPE7LYas2UCWyfxjUzalHLdvoz
	 mVQRF0zFneT7DGYsMsswgGhbi/6T3xyVgnD7LwbweFfqy1rzmCoCSEm6EO1EVu8YeJ
	 k7mQKlk/D6c0g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 857E84B13C;
	Thu, 19 Nov 2026 07:11:49 +0000 (UTC)
From: Eslam Almorshdy via B4 Relay <devnull+ealmorshdy.d-matrix.ai@kernel.org>
Date: Thu, 19 Nov 2026 07:11:41 +0000
Subject: [PATCH v2 1/2] libproc: fix readlink() typo in Psystem_daemon()
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
Message-Id: <20261119-b4-bug008-daemon-readlink-v2-1-c4bc5fbf156f@d-matrix.ai>
References: <20261119-b4-bug008-daemon-readlink-v2-0-c4bc5fbf156f@d-matrix.ai>
In-Reply-To: <20261119-b4-bug008-daemon-readlink-v2-0-c4bc5fbf156f@d-matrix.ai>
To: dtrace@lists.linux.dev
Cc: Nick Alcock <nix@esperi.org.uk>, 
 Kris Van Hees <kris.van.hees@oracle.com>, 
 Eslam Almorshdy <ealmorshdy@d-matrix.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795072309; l=825;
 i=ealmorshdy@d-matrix.ai; s=20261015; h=from:subject:message-id;
 bh=BOu643POXRZw4OhvnNkHCx15zSgC9xf/H628LDrSpLs=;
 b=kQjpKplv8EAy+m6n1ccbhDvOEd6J6C+0FshILEE6DUK/DvcwpW++lqVLtwn0dZXhrZXsMEqns
 60hRl5Bn+02D6ICmv3K0pClGjlDGiYA1/0+PmkNT/vIfjNm7atQw79Z
X-Developer-Key: i=ealmorshdy@d-matrix.ai; a=ed25519;
 pk=E4tVAIvp2rvz2CB7Re6YVMP6FiUVSxuq0TUtjGQL5NM=
X-Endpoint-Received: by B4 Relay for ealmorshdy@d-matrix.ai/20261015 with
 auth_id=1187
X-Original-From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
Reply-To: ealmorshdy@d-matrix.ai
Content-Transfer-Encoding: 7bit

From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>

readlink() returns the number of bytes it stored or -1, never 0, so
the check for a regular file outside /var never ran.

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
Signed-off-by: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
---
 libproc/Pcontrol.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libproc/Pcontrol.c b/libproc/Pcontrol.c
index f8440d5b..ece074e0 100644
--- a/libproc/Pcontrol.c
+++ b/libproc/Pcontrol.c
@@ -3045,7 +3045,7 @@ Psystem_daemon(pid_t pid, uid_t useruid, const char *sysslice)
 		 */
 		memset(buf, '\0', sizeof(buf));
 		if (S_ISREG(s.st_mode) &&
-		    (readlink(procname, buf, sizeof(buf)-1) == 0)) {
+		    (readlink(procname, buf, sizeof(buf)-1) > 0)) {
 			if((buf[0] == '/') && (strcmp(buf, "/var/") != 0))
 				return 0;
 		}

-- 
2.55.0


