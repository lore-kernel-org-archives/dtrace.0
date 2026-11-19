Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092716;
	b=DGS5qc3E0/z+yGTHbsTYpLPpM4FcvuSn7T5CQKe/SU07S77cu1nhDedOk8Mq8opUM5+/
	 WFuOSm7dtPbNKHXYrC7/0R2QDBdRzrS9nEZbbhgWFmI0hhGWK3Pumcf9/1NnupFNPsBA8
	 PfGBtUKl+gmYxzMtU9UtJBSItsbLsOxry9FUnIhlAW1O0SmCiW/PXphxBRaYGuxkw1YiY
	 0QFf5QFD4Q9rq6kURvBV3B84UO7H0rhaaPFeQNQc4s1jFkZPBrkpbYtzZpByYqmjktdYl
	 cPvMU3f4praTPsWzUtPFbS2VGAsSz8uOhadD//o/twZyza1J7kShrJnoNpW7H8XjP4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092716;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-DCC--Metrics;
	bh=Y5iqUZnzeLdZ7IKHUUhwnlHn128PiO0SiUx78gQv3TM=;
	b=yhYRvYSVVJeukgo/AOn//YfWb9M1dPf5dcqjNlscu37QuXxdFp5KM6QDvrFiEcjwNN1X
	 bgmvKuJaEWFwAtqHjIzt1zpkkJs3ZhyBgnXh3qR05evTuT5OX5sn1S9E68pJXAIhLPH6U
	 v9K1oNASOddPOWIMmwR5MOmAGSfrsE1ypzOymnDhPdsrC1nlwCEEs8ozMG22CcMjfTmzr
	 M8crNSQvcTSefIVULfx6Z3ylSH6rFBgilz5SxO/HacsZSaJ6tAB32m1OJi+9kDGpJ5a8Y
	 VtiubtDmFJOTVw9g3V7JVl4UGGLa0ven5i5TBiUO0fBs8mpt9DWJwm00MRCT9lYslJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29BB606A33D
	for <dtrace@lists.linux.dev>; Thu, 19 Nov 2026 12:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D29BB606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6AJCppf8017414
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 19 Nov 2026 12:51:52 GMT
From: Nick Alcock <nix@esperi.org.uk>
To: ealmorshdy@d-matrix.ai
Cc: dtrace@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>
Subject: Re: [PATCH v2 2/2] test: add test for system daemons with regular
 files as streams
In-Reply-To: <20261119-b4-bug008-daemon-readlink-v2-2-c4bc5fbf156f@d-matrix.ai>
References: <20261119-b4-bug008-daemon-readlink-v2-0-c4bc5fbf156f@d-matrix.ai>
	<20261119-b4-bug008-daemon-readlink-v2-2-c4bc5fbf156f@d-matrix.ai>
Emacs: a real time environment for simulating molasses-based life forms.
Date: Thu, 19 Nov 2026 12:51:51 +0000
Message-ID: <875wxtm1aw.fsf@esperi.org.uk>
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
X-DCC--Metrics: loom 1102; Body=3 Fuz1=3 Fuz2=3

On 19 Nov 2026, Eslam Almorshdy via stated:

> Start a root process without a terminal with its stdout to a regular
> file outside /var, then to one under /var, and check how libproc
> classifies it from DTRACE_DEBUG: not a system daemon, then a system
> daemon.
>
> libproc asks systemd whenever /run/systemd/system exists, and for a
> process in a systemd slice the slice decides.  So on a systemd system
> the test runs dtrace under unshare -m, in a mount namespace of its own
> with a tmpfs over /run/systemd: libproc does not find systemd and uses
> the rules under test.

Oh that's cunning. Finally we can routinely test non-systemd codepaths
everywhere!

It might be easier just to always run it in such a mount namespace, but
other than that...

> Signed-off-by: Eslam Almorshdy <ealmorshdy@d-matrix.ai>

Test LGTM.

Reviewed-by: Nick Alcock <nix@esperi.org.uk>
