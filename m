Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969638;
	b=KxuXswn8om8NFQbZTxc5uR3+uh+fWD/vtZcJhhM5AawsQOjZN43E+59ZRXsbzhOJKZD7
	 8OfH73Ym467TkYkqf+ySmgVm8AhrO08azo8pytA2lJ3FvJus1PL5wDeWAEAXgMyaDhiEZ
	 ZkslX2KfRg9ZkR9Lfizr5zc8yS3fEn2JSHtCv6MPnPRdq9n3jzfQSBAEhCZ1uVuYX9Ryq
	 1I5lW/aAtt/nEui71Ft4Prp+UCXNqDG0wpUzkW71Hq2S4Gb9dzJmKnsKvugItUw4J+iBi
	 q1wIIqlDA4aTsA42YW2GcRXObOvzgmSDfuaJa8bR6h7hjN4HtLNRk1LbaOPaSe5uDpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969638;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-DCC--Metrics;
	bh=tdsCLnVB/smQXPGb6yOL9XGbBDYCYugOSmp6E89BZio=;
	b=VtlzhynY1IRJ5GF1XvnoBemp/okOcyyC1K1NG2fG4O130vOLvDaospNXAnLeyXv7U7jq
	 8IhH1z2P+JR3dY8YZcROmkXhB3gt/7jXfvlQQR9HKTLFHz+7WqE4ZZRk83q5bPRy6UcwR
	 4x30P45lZeHamVNqJ9VVN2QXGGK3b1DxfXs3LpmnWMCxJ3Xu6fkNMMCoIgmq9di9YuPy3
	 jLCCvo9kuuzDP5FiopyovaYTZnGx07Zsi8qugGUlXnjYAZjZubTq45DGp1B681S1D8sUC
	 EUMrR8rHCAGfHBwm0miNFbsOISpbXEc+RfYFXVS8yDVocxs+2Jyw7WX4NjWuceo8ipQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D93606A326
	for <dtrace@lists.linux.dev>; Fri,  6 Nov 2026 12:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57D93606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6A6CrrwO014635
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 12:53:53 GMT
From: Nick Alcock <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 07/20] libdtrace: reuse the built-in module range line
 buffer
In-Reply-To: <39f8bf63bedf882b1101174da917d6b8@oracle.com>
References: <39f8bf63bedf882b1101174da917d6b8@oracle.com>
Emacs: a Lisp interpreter masquerading as ... a Lisp interpreter!
Date: Fri, 06 Nov 2026 12:53:53 +0000
Message-ID: <87mrrmt926.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-DCC--Metrics: loom 1102; Body=3 Fuz1=3

On 30 Oct 2026, Kris Van Hees verbalised:

> ---
>  libdtrace/dt_module.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Nick Alcock <nix@esperi.org.uk>

-- 
NULL && (void)
