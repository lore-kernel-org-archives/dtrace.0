Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972136;
	b=HJ+ifHTvMy8fwzlIN7LND6Yy70HpW0zyCwrhVwGRzzpRIKMt0uznZIjFubrUWKvcojIH
	 Dk8tEOSjUqtPDYp1Pf4IQuMHRCzFe8m68b6F34vvReWBf/WtMiRfYwO385vFSDDJGW9VB
	 q5RZn7a2Y9bRThkL7bkt3wslh9mYc4/yHrzdlK+cQ7EfWujBcPb+yEB1aR5W92pY8u02L
	 VNCUmt9bVxFIqTPs1YxC89L76/hAEh7FMSwl0YQWOjdDzJ9AT3eDdfHHn/95rKcTUGspX
	 hz2n6K47aE3MszVRRWG3JUGBelRKUfb/z3blbg6QD5AwFyJEupXRljLsDe2OcKuatHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972136;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-DCC-wuwien-Metrics;
	bh=G99ciPdwSn6HzCH6/Ka8Mo4ve2Wjly5RllVuEQG1no4=;
	b=4jZ/c/ksVaunpt4rsBHZmzxi6UoPEoR3YuXKGuQyskFriPPgDEilmY+TEdVFdIubphfT
	 kY8zbJF3VmzOi9DphvHM/3Qldu7Emt+TVg7OhvvlY6egZdKtKLNPIA5YPFiNkK+iwqkWj
	 pWoLYBhiduu0WWQnVf+sxKfOLMr4DQy40cVedHdsFwGSijslwi8lzsJIRmxhBB03VXcbw
	 FWGqZlHzFi3VS5PciNQ+FiqHuRkrpEbAXqZ5jrVqRVDL5SKp0N+QwloBbTg/FwRU3jdG0
	 8qtN8BHo7zJ3VQLQzTX3xTAAJf2lkITQWuCFAVimoRBrOJ7M1CC3SIzMtl05U3i7Jnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168FE606A326
	for <dtrace@lists.linux.dev>; Fri,  6 Nov 2026 13:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 168FE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6A6DZVpA015710
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 13:35:31 GMT
From: Nick Alcock <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 17/20] uprobe: add support for uprobe systemwide probes
In-Reply-To: <3a4910515ffe2cc8b3f3f7bdefda3444@oracle.com>
References: <3a4910515ffe2cc8b3f3f7bdefda3444@oracle.com>
Emacs: no job too big... no job.
Date: Fri, 06 Nov 2026 13:35:31 +0000
Message-ID: <87y0b6qdzw.fsf@esperi.org.uk>
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
X-DCC-wuwien-Metrics: loom 1290; Body=3 Fuz1=3 Fuz2=3

On 30 Oct 2026, Kris Van Hees verbalised:

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Oooh!! Wiring this into the module support is obviously the right way to
do it :)

I'm really very surprised it's so little code, even given the amount of
prep you needed. I guess the basic uprobes machinery already did what we
want these days, after all Eugene's systemwide uprobes work. But all the
tests are reassuring (very nice tests).

> +/* Match defined functions in both regular and dynamic ELF symbol tables. */

If only we had symtabs that really stuck around in executables without
doing -Wl,--export-symbol :( Solaris got this right...

Reviewed-by: Nick Alcock <nix@esperi.org.uk>

(want me to give this a test too?)

-- 
NULL && (void)
