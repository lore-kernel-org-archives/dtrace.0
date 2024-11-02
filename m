Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F2141C79
	for <dtrace@lists.linux.dev>; Sat,  2 Nov 2024 03:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730517517; cv=none; b=dobqU8wwQNQF1vDZ/bTFkN96PsXTGiZ40OA18fZWdLsAuYVeHlQUVKr5ubRWW062RrjyKBAMzs4EI8mwRUfi0Z5u4dd+1KbNsyIIPXLk3zhJrv/EieyTNF3TIcBEzEXMC0c9gUE5mN8rzljZ3kMoMz4/17uk+o7giFHQinAsKXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730517517; c=relaxed/simple;
	bh=yA+RGaCQOLWTfXqsXfkLbN3Bu4yuQFo20BgZEt6u3NM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iMmVWVc9PRmDHKrz9c6yDpEEq3A8nbRKKqxaMlHP8UCAfXMtaT6aQuvMT6Wjj6R7/o9CSrmOmq6+HOEXlopm52+zfOhFYv9qpiHvlCJcJVkIOFvVQfjErP1aQCULq05Pekf/KPvvt1myCe3ZVgoVSpVzhjfLT5jG0tEvqgURgmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: Nick Alcock via DTrace-devel <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev,  Nick Alcock <nick.alcock@oracle.com>
Subject: Re: [DTrace-devel] [PATCH] test: testsuite $dt_flags and linker
 flags problems
In-Reply-To: <20241101190759.409416-1-nick.alcock@oracle.com> (Nick Alcock via
	DTrace-devel's message of "Fri, 1 Nov 2024 19:07:59 +0000")
Organization: Gentoo
References: <20241101190759.409416-1-nick.alcock@oracle.com>
Date: Sat, 02 Nov 2024 03:18:31 +0000
Message-ID: <87v7x6uxvc.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Nick Alcock via DTrace-devel <dtrace-devel@oss.oracle.com> writes:

> The testsuite passes in a $dtrace environment variable: this must
> be an ELF executable because some tests use it in hashbang lines,
> so necessary flags are passed in in a $dt_flags variable which
> must be passed to every dtrace invocation.  These flags are largely
> path adjustments (-I etc) pointing DTrace to the in-source-tree
> testsuite or the out-of-tree SDT headers and such things: as such,
> it's unfortunate that a great many invocations were missed and that
> those invocations were largely things like -G that actually *use* -I.

Thanks. I was suspicious of the $dtrace use and I was wanting to audit
these!
