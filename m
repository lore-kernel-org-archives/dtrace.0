Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C6D256D
	for <dtrace@lists.linux.dev>; Wed, 26 Feb 2025 00:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740528593; cv=none; b=Zn5mBo7FCHpSEH5/Hp8w2gqXfXpPFC9CETLtEswYxG2YbBOLhrJ2J6j67vLk5rqqaPQCjQ57skbqqKFY/QzmDw7kYeBeY/xWPcuiPfgvXXN8knukb1lQly0hdURGDqbIHj2sQFLL4jZWVxEmKnQ5CPSrdgrcHLWjuDV9jg9bN/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740528593; c=relaxed/simple;
	bh=yehZ8IBAzf1DUbyiwU2ZaovOAofJMnWfgcVFvPcEWQI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LrYzuI+Zex2JALFR7IYA597MGmyN//FLxs8FdNYbJvkUcGVXQnHo2QgLw1YBsmnhgBHdTQVRCXyDAIFACXrZa8McGJpehQYkotGNrHUPYSlK+4S+u3uTYqkDiNOTDsN8iWCwuUzDVqlFhr1W20wu3QFpo3X0dTfRBVkqEbj3JLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (unknown [82.8.138.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id DE2B0343065;
	Wed, 26 Feb 2025 00:09:50 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev
Subject: Re: [PATCH 4/4] test: allow overriding CC, OBJCOPY, OBJDUMP, NM, ...
In-Reply-To: <2c89d9e9-5844-d480-b268-6ba70bbfddd9@oracle.com>
Organization: Gentoo
References: <cover.1737686990.git.sam@gentoo.org>
	<6df5a570b768a59808b2b197b9b5cdeaed426958.1737686990.git.sam@gentoo.org>
	<2c89d9e9-5844-d480-b268-6ba70bbfddd9@oracle.com>
User-Agent: mu4e 1.12.7; emacs 31.0.50
Date: Wed, 26 Feb 2025 00:09:48 +0000
Message-ID: <87cyf57eib.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Eugene Loh <eugene.loh@oracle.com> writes:

> I'm open to signing off on this patch, but I have some questions:

Thanks for the reviews. I'm just replying to let you know it may be a
little while before I can handle answering & respinning.

> [...]

sam
