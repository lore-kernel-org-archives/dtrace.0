Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971031;
	b=Zz9LyfC87zjnYoa9jqfX028TRZ/YtmXLqbDPggczVxUOtsLWyUHINuuaVuPkvLuOP5Ly
	 L5RCwTiW6rUPiFG2bzsgQlqegZqzAAEW0pDMV0LJpCP80gWtEvidZTQ8MLACa58GEOnnl
	 sM354N5hL+r+duP24O6qjzkItkHVY2D7ySE3wQ4QWe/otmofAg51GVptNtr6rbTfJGEUB
	 pvqKsrESdgJm7VPSjCByefoJRQ2KJccKougGSgrokeRVEZwaQUvXEEW7q06amdUCMLahG
	 1g66MTGNyi+viUkS14o+pq5Ecq98mrAA9LhqJnKEUMt03SGaQrsqLU6tMZVizPSRnGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971031;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-DCC-wuwien-Metrics;
	bh=E62TV0h3gzxdXeUvIJYhrm3pHr8zo7JauiprQVqT3oY=;
	b=wNB9+zd+V6dHiy1JRWWYnMUDGyJ8/fto2zJqV6tVHZqLq789ARug0S6lDfdkQdm8IuIO
	 E+RAqQHiI1vx7UaDxO49qBrMDznEPBwOt2ZXZxEJ4mYDHF1nRmrxqXfY57W1WSL984LMJ
	 g6KDNeahR6WNxD+49z1r3s74kV8NjSijMjYSSO6beGw512D/gFJFZhtRpEpiV2er9eqnD
	 twob76f1n/N4TfqN7LVErNhGbDk+TfKWU638tOZkLfvClo0+rzikrHiXMJKZb1n8D/5PX
	 nup3fggUm0GB2dPMUNEA1SofEFCO1YZNYZhdBpkFFS5WYefPDYwns3u19RcZx1OpB4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FA5606A326
	for <dtrace@lists.linux.dev>; Fri,  6 Nov 2026 13:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88FA5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6A6DH6SA015262
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 13:17:07 GMT
From: Nick Alcock <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 16/20] module: add support for wildcard matching for
 user modules
In-Reply-To: <6a0d5564a3dcc127fa5efc01955bf623@oracle.com>
References: <6a0d5564a3dcc127fa5efc01955bf623@oracle.com>
Emacs: don't try this at home, kids!
Date: Fri, 06 Nov 2026 13:17:06 +0000
Message-ID: <8733tertf1.fsf@esperi.org.uk>
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

On 30 Oct 2026, Kris Van Hees spake thusly:

> Tests for this new support are provided by the uprobe provider.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nix@esperi.org.uk>

-- 
NULL && (void)
