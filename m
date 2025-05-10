Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232061754B
	for <dtrace@lists.linux.dev>; Sat, 10 May 2025 01:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746841843; cv=none; b=OBUfYJT+cIhDgrxCjZY7BjGMwaAInqfGhvwNgK3d/yBZNjsUTXC+muBlfemW1gTrZa+1H4TfRZEtLz745FS6rBF+4KxJoh8JvGcydIU8wpryvITDc4Yuw3m0Q6/5XGKKb+Uybhefyk+J9wMl/+KfRuCalIjqhezLLj35pb5x+9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746841843; c=relaxed/simple;
	bh=o4NXKbl6wM/osxygVnl5uQS7vtcKK4oQAjblQQVjyM4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iTz/gE4akLdUXvsEmzWCU08oCtgRDH4WNl4jeuqmu3nXx6xnYz93qwAJ7CRdNaaTO/LhxAzzE90BLccdZQVFkdlDZ0erBv9Z/TzRNDP3aqz3UoPPViUSjDSBwfe6i9CG892bEpKBWL3QdxUphmJhDbOrgXUJLmBBe5biIRgjhPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (unknown [82.8.138.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 3A304343146;
	Sat, 10 May 2025 01:50:40 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev
Subject: Re: [PATCH 4/4] test: allow overriding CC, OBJCOPY, OBJDUMP, NM, ...
In-Reply-To: <f5e23dde-b868-5142-5487-7a34aef7e796@oracle.com>
Organization: Gentoo
References: <cover.1737686990.git.sam@gentoo.org>
	<6df5a570b768a59808b2b197b9b5cdeaed426958.1737686990.git.sam@gentoo.org>
	<2c89d9e9-5844-d480-b268-6ba70bbfddd9@oracle.com>
	<87cyf57eib.fsf@gentoo.org>
	<f5e23dde-b868-5142-5487-7a34aef7e796@oracle.com>
User-Agent: mu4e 1.12.9; emacs 31.0.50
Date: Sat, 10 May 2025 02:50:37 +0100
Message-ID: <87o6w1w7wy.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Eugene Loh <eugene.loh@oracle.com> writes:

> I went ahead and rebased the patch on origin/dev, incorporated my
> suggestions, and ran the test suite to check things out.=C2=A0 I'll post a
> v2 of the patch momentarily.=C2=A0 I hope that's okay.=C2=A0 I don't mean=
 to
> step on your toes, but the patch has so many little changes that it'd
> be nice to get these changes made and then adhere to the new practice.

Please do -- and thank you!

>
> On 2/25/25 19:09, Sam James wrote:
>> Eugene Loh <eugene.loh@oracle.com> writes:
>>
>>> I'm open to signing off on this patch, but I have some questions:
>> Thanks for the reviews. I'm just replying to let you know it may be a
>> little while before I can handle answering & respinning.
>>
>>> [...]
>> sam
>>
