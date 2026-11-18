Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795044317;
	b=JlJnDYKutl3GTfsQp5IFnsdcSt0fkuNRk7O7FLLYit0MgXfxJqofqo1g2ErvA9eNBsAd
	 XZoHicPowkCsV8m4Dw7DP8+Y5OKQXm3al26xjVLZ4jOMSI2B5L1nSxf1TroVWQnPZdj3C
	 AcuW2AxlQ6qr5HDAGYqt3AoiL434Wmo+a4Eui6kZtOuZm7h5pX0ZkFXpk2HJ+FI1QhvtV
	 rz0yZZwi457qyJRA4kkbx4jf9KqQy0EkcK+LL4Kx/I6HtRR92P9yHVLk/Ntfz/PqNb0ra
	 U9zWRZfnalq2qA+Uq792mYNgSSLhbyj5lamQketwLSwivQfsRRdOfnwOH3RQlM0IadA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044317;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=14FvhfCJ1Fa9RzFCYizF5zFdt5JEeJ1LU/ZWq5GaLHI=;
	b=sw358Wry3oBmNdfhBXwP69lF5mJ5rmqEZw1zEJWiXS6LDL9WpwvNPAhg0IVvGz5XR2jc
	 2mqCxvcfS62tx3+tHuok3/eRz9Tyt1dtlgLDbV3D0yC3EW8hTlAju+fMuWfHXbUeGuiXr
	 cY2zRGouRbTHimfQ8Ok5LG8voK38W3YcQDgFt6aeVFG++A45V+3WgMsQBBtcUX5bbR3gC
	 SYJgrmUvVcwubVXPXsnCPcoGICR5u6DUd9uxmuu5bZOHYP++wVetXS7zcBW08OLgfHkPt
	 47ZfOOqDo56recgMRkjY8Iml0UmlxW+QtUcnEVr9eZm0ZSaS10+S3a3icgvCyfEib1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fhx1jyt0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C41606A320
	for <dtrace@lists.linux.dev>; Wed, 18 Nov 2026 23:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fhx1jyt0
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795044317;
	b=0UGQoAsUpYfaSSJt39cTJjHx7zFuHguIaQbAKMhKSxQJoJKlSwtWrz/76Q1DmmDPRlEW
	 7x7jHQN1DvqPMxFPBHGIXKwR97aJCRWcSEx6jNc9s7IzLBons8JuE0omXspEtbiOf/zGR
	 9AcJOuQOxkgWqJJYtKqAEvhGe8u/6xfnZceGTtklGVadDqxKZkjZZWOadINRmXqC88Rhb
	 Dlv5OTmxln9tiFqz0QKFyM+iKMQzAQxmtjLIJjXWBtK2rylalHSgZsmhiG31HrdgvX62x
	 G4270ZXd3Vus7Ijtv6SzuCQNeJM7JnyfmqqXrtXyNDA2T1GGjViLsb+lwOL07KiOtcQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795044317;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=14FvhfCJ1Fa9RzFCYizF5zFdt5JEeJ1LU/ZWq5GaLHI=;
	b=C/H2rvbQ2LUzkaKzwAQVYxAMk5AVNB5YM+R9Jr20EnXc38t7cESklYuc/OufzvaGBABD
	 aoQLS4XuoNQZRy6//mACaaS8FRIsUqpY72vb+MRW8LOhddiNM2KF7jx6XTsYQ/rvLY4Ba
	 /ZPlPb1gaELR+w3aNOj+pagpglVqR//Nr9GtaWNFB+6Q8OR8jt+U2oMFTyykybDEkBBkm
	 5SBlSb2GjJqHbG9mOARpRvw1jipF7mLaYf3jK5Bb/ZXivtBzgTWCMpA7bEL7w2MeaxeXq
	 l4pcrt5TuK62+y3Zr+jPfrEyi05MMVMh110NZMmU/Cq7/iYZnTrN2SfSwykTvWg3MGQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 66E801F000C5;
	Wed, 18 Nov 2026 23:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795044316;
	bh=14FvhfCJ1Fa9RzFCYizF5zFdt5JEeJ1LU/ZWq5GaLHI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fhx1jyt0tPQckgt/AcU6LjSZiIUn1DMOHaSKTnxb/JQqw1KRPhZfZAq6ScXrFslds
	 UeOX0xzRN7+09sHK8pv/ULriL1SIC1ZbFUVnfi91mibf9Onhc6AQgUred+i4EQTsNJ
	 bjHi9zNWhDBra60jQvIWjOEbDS1vy9dWBBnO6NiA1c1mqezFlxNtQdsjRFYJT61+j+
	 cx9KvYqqNa6qi/dfI/rChpKzNfZnXa2eyxFwAUPTOTQHDQD67mORoSZdfqTIxuvusk
	 L3tiBtvoI39p4NLB8twqDAhV4XYJqW866CsitAUBa+BbUM90DoQnojZH9FnfU1Krqp
	 356lGC4c3BDUQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D74B74B031;
	Wed, 18 Nov 2026 23:25:15 +0000 (UTC)
From: Eslam Almorshdy via B4 Relay <devnull+ealmorshdy.d-matrix.ai@kernel.org>
Date: Wed, 18 Nov 2026 23:25:04 +0000
Subject: [PATCH 1/2] libproc: fix readlink() typo in Psystem_daemon()
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
Message-Id: <20261118-b4-bug008-daemon-readlink-v1-1-187c9eb22d11@d-matrix.ai>
References: <20261118-b4-bug008-daemon-readlink-v1-0-187c9eb22d11@d-matrix.ai>
In-Reply-To: <20261118-b4-bug008-daemon-readlink-v1-0-187c9eb22d11@d-matrix.ai>
To: dtrace@lists.linux.dev
Cc: Kris Van Hees <kris.van.hees@oracle.com>, 
 Nick Alcock <nix@esperi.org.uk>, Eslam Almorshdy <ealmorshdy@d-matrix.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795044315; l=770;
 i=ealmorshdy@d-matrix.ai; s=20261015; h=from:subject:message-id;
 bh=X9qAzd7ZDnORJhQr1VZplrx+O3JnAZBaIhpe294weXU=;
 b=dnwZzCUec30UavyqcuxZov6GguqDxojZ616foD1WYPf0eZAznmp+MHQBo1k30qpeD7W24mpV3
 mE945UKGEfpCItuHZOCOnbQ1qIyyr9fnwD0NFWT2LykJkjk6cGV0Nbg
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


