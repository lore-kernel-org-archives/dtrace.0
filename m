Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0FD37104F
	for <dtrace@lists.linux.dev>; Tue, 28 Apr 2026 20:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.187.191.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777409702; cv=none; b=Kt1Tf3iFuDppT9WvN02qtiQzh9ASlqWgvysGn0/fTSjvTRWw5oBJApnefVGXrtjWHCzoAs+8f1p41hEKOnJzRn9O3xKrrKzsE7noR884gj3JuiOHWgCuT/0m53LJTvvKjCxyywQGd5hvlBmBHzAZizGjokkhXseGeEJ3Jhi8RT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777409702; c=relaxed/simple;
	bh=7iMMLvauderGIXzaaW5+ZBkd7NqUJuZHozOK1T+nSnM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jzOV4w820u5hzg4b2APilPBCaUOLESDypUKJv9u2wTqKqeDIPJyFRZV76tBn+4D78qcEcQkA1690rw4dGVFabEa9OfDT9On3TD2KstJnniif8fcloPwaMd8va6C0DMHlaL8cMe/Bv0OIqVMJiikVTDW/joI5hocJO/HhFYGdaLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk; spf=pass smtp.mailfrom=esperi.org.uk; arc=none smtp.client-ip=81.187.191.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 63SKsuXC015965
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 28 Apr 2026 21:54:57 +0100
From: Nick Alcock <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 6/6] uprobe: fix memory leak
In-Reply-To: <ba06591b830e45ae2b15da9533867812@oracle.com> (Kris Van Hees's
	message of "Tue, 28 Apr 2026 19:05:29 +0000")
References: <ba06591b830e45ae2b15da9533867812@oracle.com>
Emacs: a learning curve that you can use as a plumb line.
Date: Tue, 28 Apr 2026 21:54:56 +0100
Message-ID: <87fr4erejj.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-DCC-wuwien-Metrics: loom 1290; Body=3 Fuz1=3 Fuz2=3 rep=17%

On 28 Apr 2026, Kris Van Hees verbalised:

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

(all seems to line up.)

-- 
NULL && (void)
