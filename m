Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F434A35
	for <dtrace@lists.linux.dev>; Tue, 28 Apr 2026 20:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.187.191.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777409531; cv=none; b=q16fGtYIaaqj06rwu7aK3y/44QzLXrS+7uOjxA527ntvzansBCvnvhQ36a5muad882fbnqzVORvnmjTRNRRRZrWPPQny7UaOMzcTii/ercjIRtOolCBMLOIHoclhj2Dkq4RXLdIjWer8xOpzQOFJnHLH+ru7YLLATZBtxMDApmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777409531; c=relaxed/simple;
	bh=qouNh6UcUG4S/e0/ShThRuxY9m7r8+NyPiSnzhYERmI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=c00geRBj9ymepxdc7BucZkUvRjhFal5dMCfFa8PbR1OLOXhGRFnbO5lVlSaTO/NnNh+hUYh90MvsBjbBaOfBKRKOAXaSZWb87YhcUDvE6gA7n0VswXQQ3T3n+gXpWRxaN3AyeKS2bHCY7yNmI2GUlNCDUqOU7QRzfKdfnp8qUN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk; spf=pass smtp.mailfrom=esperi.org.uk; arc=none smtp.client-ip=81.187.191.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 63SKq4hx015856
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 28 Apr 2026 21:52:05 +0100
From: Nick Alcock <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 5/6] fbt: retrieve function return value using helper
In-Reply-To: <3dc679a2ee099ae4e555e093422b17b6@oracle.com> (Kris Van Hees's
	message of "Tue, 28 Apr 2026 19:05:27 +0000")
References: <3dc679a2ee099ae4e555e093422b17b6@oracle.com>
Emacs: a learning curve that you can use as a plumb line.
Date: Tue, 28 Apr 2026 21:52:04 +0100
Message-ID: <87jytqreob.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-DCC-wuwien-Metrics: loom 1290; Body=3 Fuz1=3 Fuz2=3 rep=17%

On 28 Apr 2026, Kris Van Hees outgrape:

> We were causing BPF verifier errors when trying to access the return value
> of some functions due to incorrect calculation of the offset to read from.
> Rather than implementing the more complex logic needed to calculate the
> proper offset of the return value, we can just use the bpf_get_func_ret()
> BPF helper.  This does not impose a performance decrease because that
> helper gets inlined by the BPF verifier.

Presumably we are a suitable probe type? ... yes, we are.

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

Looks much nicer.

-- 
NULL && (void)
