Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CED1B86D2
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 20:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724963579; cv=none; b=YfY9051mHb3sBlYD39kNrDeOfZCZyERmcY66np7M9OUspJkLKMNH6vwOjyjckZnHzqsQtMz/6A5EvwBG1mlhd6xfrIsyZvex5Nn4+zhIcK1TziZ2jUcmfPPD6yoDqRc19rqnMosj3ZOCf2AAHNMOf3Q00KXwrUHusiga37VIUSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724963579; c=relaxed/simple;
	bh=KD9nUhJn4llyygpv88XKetRop1ATaMns58ex8VnZeqQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SyxIf9X8FBaJIlWQZqW+JTHrVXUCpt4NKcVS1EKdxf0zGlXLsDXTO6Oz6GV9QP081rNsOsz8jqxynesTI4CMZfIi0Y4rql5MkgfLPiViu0hoJasH0IBGKGlul/WyzdHyGKam4w9jspanNsVtEOzS8P6tV0zxCV3Q8GYTsqFk32U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: "eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev,  eugene.loh@oracle.com
Subject: Re: [DTrace-devel] [PATCH 17/19] test: Add a pid-USDT test
In-Reply-To: <20240829052558.3525-17-eugene.loh@oracle.com> (eugene loh's
	message of "Thu, 29 Aug 2024 01:25:56 -0400")
Organization: Gentoo
References: <20240829052558.3525-1-eugene.loh@oracle.com>
	<20240829052558.3525-17-eugene.loh@oracle.com>
Date: Thu, 29 Aug 2024 21:32:52 +0100
Message-ID: <87cylrf4sr.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com> writes:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> This checks that pid entry, pid return, pid offset, USDT, and USDT
> is-enabled probes can all coexist.  Specifically, pid offset probes
> can sit on the same PCs as pid entry, USDT, and USDT is-enabled
> probes.
>
> Note that PCs for pid return probes are apparently in the caller
> function.  I guess that's due to using uretprobe.  I'm not convinced
> yet that that isn't a bug.  It isn't what Solaris did.
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  test/unittest/usdt/tst.pidprobes.r  |   1 +
>  test/unittest/usdt/tst.pidprobes.sh | 243 ++++++++++++++++++++++++++++
>  2 files changed, 244 insertions(+)
>  create mode 100644 test/unittest/usdt/tst.pidprobes.r
>  create mode 100755 test/unittest/usdt/tst.pidprobes.sh
>
> diff --git a/test/unittest/usdt/tst.pidprobes.r b/test/unittest/usdt/tst.pidprobes.r
> new file mode 100644
> index 00000000..2e9ba477
> --- /dev/null
> +++ b/test/unittest/usdt/tst.pidprobes.r
> @@ -0,0 +1 @@
> +success
> diff --git a/test/unittest/usdt/tst.pidprobes.sh b/test/unittest/usdt/tst.pidprobes.sh
> new file mode 100755
> index 00000000..7eadb9b7
> --- /dev/null
> +++ b/test/unittest/usdt/tst.pidprobes.sh
> @@ -0,0 +1,243 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +# This test verifies that USDT and pid probes can share underlying probes.
> +
> +dtrace=$1
> +
> +# Set up test directory.
> +
> +DIRNAME=$tmpdir/pidprobes.$$.$RANDOM
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +

Let's do mktemp -d?

> [...]
