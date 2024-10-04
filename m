Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F0F1D5ADA
	for <dtrace@lists.linux.dev>; Fri,  4 Oct 2024 05:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728021110; cv=none; b=rKKiVcpIL9OiefVVFSchS/xTmjPniE7rbRC6eM8l36L4/QwQ6TdZR5rAwiyq+9fFn0btQ1wj4m6JOkiRrafVEP8k1NWyBe8FCqWsDBLkJKXQ47V3LrHjMontFrT2HwYdvCxHSio4yUl4Wb2dumZ6BZdSPHmmzk/13o0sEmJkq0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728021110; c=relaxed/simple;
	bh=OJ3UJh5ztIg4fGtlFH4ESsc9oSfDpFBgfR0aNQKTXNM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FSpZBkR7cfNzwYiT4ZpsYcVWZbiM/b+P4TPwYSUOC7CI6CSO929/8FyBo2go/+kM49FsfJbE4B33DzeIAf8SJ1UaO3VxMboQJJaYus5p0hdjoiqg85qDb/624xOKZxZUWWhfb2rpZN4cqfEZXOtv9EyeB5a/VA3uX/TLtIbbSUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: "eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com>,
  dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH 17/19] test: Add a pid-USDT test
In-Reply-To: <ad5e0e40-1ba7-df9c-71a6-1008c9897694@oracle.com> (Eugene Loh's
	message of "Fri, 4 Oct 2024 00:49:25 -0400")
Organization: Gentoo
References: <20240829052558.3525-1-eugene.loh@oracle.com>
	<20240829052558.3525-17-eugene.loh@oracle.com>
	<87cylrf4sr.fsf@gentoo.org>
	<ad5e0e40-1ba7-df9c-71a6-1008c9897694@oracle.com>
Date: Fri, 04 Oct 2024 06:51:43 +0100
Message-ID: <87h69ss9e8.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Eugene Loh <eugene.loh@oracle.com> writes:

> On 8/29/24 16:32, Sam James wrote:
>> "eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com> writes:
>>
>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>
>>> This checks that pid entry, pid return, pid offset, USDT, and USDT
>>> is-enabled probes can all coexist.  Specifically, pid offset probes
>>> can sit on the same PCs as pid entry, USDT, and USDT is-enabled
>>> probes.
>>>
>>> Note that PCs for pid return probes are apparently in the caller
>>> function.  I guess that's due to using uretprobe.  I'm not convinced
>>> yet that that isn't a bug.  It isn't what Solaris did.
>>>
>>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>>> ---
>>>   test/unittest/usdt/tst.pidprobes.r  |   1 +
>>>   test/unittest/usdt/tst.pidprobes.sh | 243 ++++++++++++++++++++++++++++
>>>   2 files changed, 244 insertions(+)
>>>   create mode 100644 test/unittest/usdt/tst.pidprobes.r
>>>   create mode 100755 test/unittest/usdt/tst.pidprobes.sh
>>>
>>> diff --git a/test/unittest/usdt/tst.pidprobes.r b/test/unittest/usdt/ts=
t.pidprobes.r
>>> new file mode 100644
>>> index 00000000..2e9ba477
>>> --- /dev/null
>>> +++ b/test/unittest/usdt/tst.pidprobes.r
>>> @@ -0,0 +1 @@
>>> +success
>>> diff --git a/test/unittest/usdt/tst.pidprobes.sh b/test/unittest/usdt/t=
st.pidprobes.sh
>>> new file mode 100755
>>> index 00000000..7eadb9b7
>>> --- /dev/null
>>> +++ b/test/unittest/usdt/tst.pidprobes.sh
>>> @@ -0,0 +1,243 @@
>>> +#!/bin/bash
>>> +#
>>> +# Oracle Linux DTrace.
>>> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserve=
d.
>>> +# Licensed under the Universal Permissive License v 1.0 as shown at
>>> +# http://oss.oracle.com/licenses/upl.
>>> +#
>>> +# This test verifies that USDT and pid probes can share underlying pro=
bes.
>>> +
>>> +dtrace=3D$1
>>> +
>>> +# Set up test directory.
>>> +
>>> +DIRNAME=3D$tmpdir/pidprobes.$$.$RANDOM
>>> +mkdir -p $DIRNAME
>>> +cd $DIRNAME
>>> +
>> Let's do mktemp -d?
>
> Thanks.=C2=A0 On the other hand, that sequence is very common in the test
> suite.=C2=A0 Maybe there should be a massive conversion to mktemp if we
> want to go that route.
>
>>> [...]

Sure, can do. I've got some others I want to get in first.
