Received: from outbound.ms.icloud.com (ms-2005e-snip4-2.eps.apple.com [57.103.72.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8012417BE0
	for <dtrace@lists.linux.dev>; Mon, 20 Jul 2026 13:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.72.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784554291; cv=none; b=YDMFrsTly97HxORD3HLj1sdnCD84362T3lMpcV4nJy00tJbx8n0kEkdMja06KAxMk+mlXkXXFWWTS+s7POEFQ/IPdNKvlRKgyzMrPaTbHfm/x2mAOKG1ZQ/nwuzVwOuadxtkWI2E9EjoImt9b3L8aQ/ns2vwLgvBkF2i7hXum+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784554291; c=relaxed/simple;
	bh=VRULsnuSpJJ0sR1AsIl3Ms3rFcYK3902u9gXMPYS5Bs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FbtWVXeNwjtsf14ZlUKCcvKqLhXXDJoN72O+F9Y+5QbIeCth7txYzp7FkNetsYlI3AFFEkRFFamxcAYmK7Wbd3xIfvETCtd5Oy0HIKR/5zY4cOlxZwMt7Th8F3ItFRM0Fgnk3OgUHlQOPb8Ipzuhdg5lULuKd1esOllIjGHAj4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com; spf=pass smtp.mailfrom=me.com; dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b=SqgTLlt7; arc=none smtp.client-ip=57.103.72.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="SqgTLlt7"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-6 (Postfix) with ESMTPS id 52BD318000F2;
	Mon, 20 Jul 2026 13:31:28 +0000 (UTC)
X-ICL-RepId: 019f7fb9-74cb-747e-a8ef-2d57d3d3cb9c
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQFKHVwPWBxEDlYKWRcOVk1dF1wPdwZXXloXXk1RDw8dXFZQAlpLQBMEShMFUgddTVYNRw9YHlwUFxVAQ14IXh9MHB0OWAYSAE0KDjYGWQVeCVYDQwU2EhRdRV4IGQhdHRkVWgkKVwBAC04DWgVbA0MKSQNdGVwFRQ5LHlwaD10fWzheCBkIXR0HWEcURw4PGVoUXBhT
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai; t=1784554289; x=1787146289; bh=rnm9gOGzVhzm2PnpSGKIzhKzQGnNh5SvUs18YEtHI2s=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=SqgTLlt7cwS/gGC3LDzQbTgKBgEj1v6+dUNK8kNz9BczZ6TGUUlCdYI/M9R4tJPz/ueegOro5TGBpaf7ad4eyUVJNbPWfaRVc3hKhDFHhgCMhO4f6Sr5q3G7RdC1In1wJ5Gm5EfpcyiyWg6E20XNACyb5qK191xDkpCHCq5ImC/1UtMRb2bFgsqDMSdHDON0q0ROOehGZgr+yiskBlPVuciB3LIXkj7UMoooKABpIY9OW5EoI+UjuFF9mTls20BsVBeDeWzxnNlcBoB/mJSa51Q+yzQwQSMVQTb8LpGbM7SKf/nTTmGX77NrHeR8vUXnM8HU0Y0oNx6UbWqYsaer4A==
Received: from localhost.localdomain (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-6 (Postfix) with ESMTPSA id 8868018000AE;
	Mon, 20 Jul 2026 13:31:27 +0000 (UTC)
From: Jacob Carlborg <doob@me.com>
To: dtrace@lists.linux.dev
Cc: Jacob Carlborg <doob@me.com>
Subject: [PATCH 0/3] Fix DTrace on modern kernels and in containers
Date: Mon, 20 Jul 2026 15:30:57 +0200
Message-ID: <20260720133100.77573-1-doob@me.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE1MCBTYWx0ZWRfX0FI4NTKu2yPG
 SuyXLfrqxDYMIW6ujZyBFtlgSUHwNLqn9YNKX27g+76CcJpiFS8m0lFxZCUoszA+sTD5pdxcXQm
 SFWWbDf/b7wk9iW2AsnK0Gl9gc+P8YT0b/e+SI6qW69MOaslmRf4elPFtc366GDdoDyMkghfhlC
 taFKCVnmpsrXtUCQ1OJW71g9iQ+dmFHgjqC77xtkbStav8mFJPIcP3IDaja+0J+eUklSjs8BGwu
 /8fYLVghbBm/K05i+FBSNatPy0kdhmJbUojKq5h8gk+5cKxFxH0fWA0IRf1t4PLBL1/7lF5hkNF
 v+tA2NDQ1FnbPCxkqd7
X-Proofpoint-GUID: Fq0lzoji64oSNtgD3PY4jw9x0Nwryfwo
X-Proofpoint-ORIG-GUID: Fq0lzoji64oSNtgD3PY4jw9x0Nwryfwo
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

Jacob Carlborg (3):
  libdtrace: resolve BTF type tags when importing BTF into CTF
  libdtrace: derive io provider dev_name from the device model
  libdtrace: match BEGIN/END PID in the tracer's own PID namespace

 libdtrace/dt_btf.c         | 20 ++++++++++++-
 libdtrace/dt_prov_dtrace.c | 58 ++++++++++++++++++++++++++++++++++----
 libdtrace/io.d.in          | 17 +++++++++--
 3 files changed, 86 insertions(+), 9 deletions(-)

--
2.50.1 (Apple Git-155)

