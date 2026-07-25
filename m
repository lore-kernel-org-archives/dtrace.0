Received: from outbound.mr.icloud.com (mr-2002l-snip4-11.eps.apple.com [57.103.68.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F023F926B
	for <dtrace@lists.linux.dev>; Sat, 25 Jul 2026 18:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.68.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785002691; cv=none; b=B61GtVEL6sbFP3YLwyHXgFowqKK//s1BZunAAe37G3IPm1He29/IaHhqN+2j7WhW/2tDsdaIdJYZDb/bvJf6vobOANdhLJZAdUD6iGqnXyIO83apeqPXtNVo0GTS70bYFQo61NrDLTRx0fpg7wY/gev2eQh9HqRTXTWZxmpxi+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785002691; c=relaxed/simple;
	bh=7M4XVDzSiNEjxnzDs/X+dix+nm+J1xnkIjsFs8Ab23g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jUUdRVKjf7pPbVnNH6k6X0fn4T94g2uZPPDG8lOr1b5p3FmNoAKwAyo5IZDYm3t2keqe3oCM+e47bfQgS1g9rMSU1U5tKM5otuh52ln7y7NtP7BZGYycaKYaLPYFpYzGu3abvfw1RYFhnHW2lvBoriFJZx0ohpB6p2S1Gk9xsMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com; spf=pass smtp.mailfrom=me.com; dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b=eOu2ioKd; arc=none smtp.client-ip=57.103.68.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="eOu2ioKd"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-3 (Postfix) with ESMTPS id 23A9A180009F;
	Sat, 25 Jul 2026 18:04:36 +0000 (UTC)
X-ICL-RepId: 019f9a73-51a9-7ddc-931a-2fd24cabf6d0
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQBMHV8EXxxHAVYATVIPDxRWF1EtWg4cE1YVEwtTVl8VFxtcABcZUU0LWFsIWwQPH0wMUQJCBVZeVAodBFQHXQVdVlACWktCBEtFaFwFXBxAF0gdX2pLVhQEFVZDVARfUFQRV1ALWQJCD0gEXwJaCkANSApDDl4CQQtVAkBTBF0SeRVWQ1QEX04ZDEodUlZbE1UXRgk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai; t=1785002687; x=1787594687; bh=c/q8TCNVPQewN16U+3mNjqGo+8iGEP1EXu8MbvY0sUA=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=eOu2ioKdWioVT3KiDDRSQXQPCQONB+89ZT60gBSJLbTCQLIlcQmA+MXOcSuuJBMWckr2JLAavkqne4AHfQ7RTwqSk2VWFeMPQNEWbiKmNTbCrz4b9DjlF+WvSjQw/bddZMKQ8J0VeuJjUbIGG3ZGrpJyFnjaJvswJev8ALO0QdbXdAw+nh2nsnsIARj+lECpomMCrWRKR0L4w8sJy3QD4i7TTrmGkSQNzpTTwl04tNTmbzmR0fXIdkJZ110ovePjnnYEQemMCyKPJ9ULP0DthJqq80AzLRVnEGYsZlb0qfoNOZX6daOzvqR1V7ziqMX3HSVESdwVuSBsFa+WNQg5vA==
Received: from localhost.localdomain (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-3 (Postfix) with ESMTPSA id 4CBDE18000B4;
	Sat, 25 Jul 2026 18:04:35 +0000 (UTC)
From: Jacob Carlborg <doob@me.com>
To: dtrace@lists.linux.dev
Cc: Jacob Carlborg <doob@me.com>
Subject: [PATCH v2 0/3] Fix DTrace on modern kernels and in containers
Date: Sat, 25 Jul 2026 20:04:06 +0200
Message-ID: <20260725180409.95012-1-doob@me.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI1MDE3MiBTYWx0ZWRfXyBSzBOFlvQkw
 dBOdUPjH3IYYa3MY2Wc2qY7iIOXFPJxNFwCk3a6uZjSpWG2B13Weau2a/2aYqbAgKT/2u0Lj/Tc
 TvZR+Z9Uiaaj6xyQvEoeHP72oE4549czRJI3nH55pK+Y0Cj7PsZbhzqtTL7VnlcnkSxDwdTL2PP
 9nn/YPPlqUPSzAMK70ho4qXjW2gOoF4jRaTnL4goxKHIipEyyLlYf9NA9mlrD9riEf/k6WtEZ48
 SENnrdBDKaNU/kwGzHsATnurlOzECPK4tmYV2DYTs75Fwc9NNiuIZnejjWD782H92GzF6OVnM8M
 +8eQD2NLAL5RpdoqZ1GC5j/3bJQVTF9IFPV1YoYlozeNxa2OZNe7zYMwGBY86I=
X-Proofpoint-GUID: 4YPGyrPIS_oVyOA4jZxxS8AAO7FYGvPC
X-Authority-Info-Out: v=2.4 cv=dfWNHHXe c=1 sm=1 tr=0 ts=6a64fabc
 cx=c_apl:c_pps:t_out a=9OgfyREA4BUYbbCgc0Y0oA==:117
 a=9OgfyREA4BUYbbCgc0Y0oA==:17 a=RAioF0-LDSMA:10 a=x7bEGLp0ZPQA:10
 a=bRQJlwi_ETYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=TGxmiLHLxaYYmR9BuJIA:9
X-Proofpoint-ORIG-GUID: 4YPGyrPIS_oVyOA4jZxxS8AAO7FYGvPC
X-Apple-Category-Label: MjcyNzI1Njc5OiRjYXRlZ29yeSRfUGVyc29uYWws

Hi, I've created three patches for the issues I've encountered when trying to
get DTrace to work in my environments. One environment is on my local computer
running macOS ARM64 using Docker through OrbStack. The other is our Kubernetes
cluster in the cloud. The first two issues are differences in the Linux kernel
compared to what DTrace expects. The third issue is container related.

The OrbStack environment is running version 7.0.11 of the Linux kernel. The
Kubernetes cluster is running 6.12.85.

I'll be honest, the analysis of the issues and the patches are all done by an
AI. I've verified everything manually myself.

Changes since v1:
- Patch 1: also treat BTF_KIND_TYPE_TAG as a transparent modifier in
  dt_btf_real_type_by_id() (per review feedback).

Jacob Carlborg (3):
  libdtrace: resolve BTF type tags transparently
  libdtrace: derive io provider dev_name from the device model
  libdtrace: match BEGIN/END PID in the tracer's own PID namespace

 libdtrace/dt_btf.c         | 21 +++++++++++++-
 libdtrace/dt_prov_dtrace.c | 58 ++++++++++++++++++++++++++++++++++----
 libdtrace/io.d.in          | 17 +++++++++--
 3 files changed, 87 insertions(+), 9 deletions(-)

-- 
2.50.1 (Apple Git-155)

