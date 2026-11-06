Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793970462;
	b=QN0QwceMp2e2wpALuSKQACc6gR3SF3pT8j8+OonicjU1UESEq8Yup+V2MI0/lxnuCH//
	 0Npi82MoX8y9fzsqaQvjTpH5+qVnaPi2rUHd4fiERQ2fbT3apKzLWir3mItPV/j+apTFo
	 tcWjqI2zFB1mx1q2XtJL7Y6pa8CJzjbfa942ty2T5nbhgxzuZThOoRBVH/YySXR7yC7PL
	 ugdQhLwIjsoekKMJaFuvz0QjLk+QquLq0a636iC7f1ghLRR1gBHPKco75yyc2tsI43rB/
	 AkhQn4N9cSU+4C1rIJz0VyGIEdZ/ijAmLz+/sHkY2RcNPrJcM+iC6yXq2BNzXH+G3Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970462;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-DCC--Metrics;
	bh=hh50m6TZ0zxJDxyABqTrvPoZla5I+KC9DZ5DsLXuu/c=;
	b=kBdXEigd3NFGWkvlBR4/UZmzjC6CAIYO89kG/hP7OpWbYtpxIZMUgFL5yHJN1KQD/7vw
	 Yl983MWS2X078Nu5yj3tUVUyASDWRtD+UqGmuuLCvwo+L8BsQU+JrCB0Lyrw2Z+VQc77q
	 6v63e1fLM4giedhhy6PT5bj2Y4/G2ErWHO6SnLbaVTEwB6rymaeuKAWD9VrBmur/+F/2i
	 Vs0T3c8tOBlZP3t8UxujaKZXaFq7AIRaUV7RXLPJJbT2RV+KlgyZPUGzDLSJoU2F4dyVx
	 JS46vOScIAa2NxbgsIzg71tIN20qdD4WLca1lmMXD0tGW8oGuRS85x73CKfdIKtrH0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816EA606A326
	for <dtrace@lists.linux.dev>; Fri,  6 Nov 2026 13:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 816EA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6A6D7bdd015029
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 13:07:38 GMT
From: Nick Alcock <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 13/20] libdtrace: use module address index for aggregation
In-Reply-To: <10f66def218e32acd6292b104f7f4cb8@oracle.com>
References: <10f66def218e32acd6292b104f7f4cb8@oracle.com>
Emacs: the only text editor known to get indigestion.
Date: Fri, 06 Nov 2026 13:07:37 +0000
Message-ID: <87wlqqrtuu.fsf@esperi.org.uk>
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

On 30 Oct 2026, Kris Van Hees said:

> Share dt_module_by_addr() with dt_aggregate_mod() to avoid scanning every
> module when normalizing aggregation keys. Preserve the representative module
> address and reuse the indexed lookup, including overlap precedence and its
> allocation-failure fallback.

Nice code duplication reduction.

Reviewed-by: Nick Alcock <nix@esperi.org.uk>

-- 
NULL && (void)
