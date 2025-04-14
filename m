Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F2385260
	for <dtrace@lists.linux.dev>; Mon, 14 Apr 2025 23:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744673640; cv=none; b=PnI1PEZsY40d5QocOPpYsGUjAKCNpF5sNNdcbn9KuuNogY81DshCXcxrYqr4FFe2TVuLibpkjO2gjPr1js0pHG2wIODCXU3eZAmV1c2JyJBHHikXpY//bT0TnzM8RpToVnKvAZ3LpncXV7KyAE2L8Y0Pjw5zJ9Kbk2OIhZDzgkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744673640; c=relaxed/simple;
	bh=qPmuTN2nSj2peNhTfkSymTqb5Eb9ZS6HPw1MLiEz4jM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ViqBdqLhg/lg0PtfG+UuDfkbgtzMVQIJ4X/FylIYgcuDjBLvKr+qUUbFRwUftcH5sn/W16wPwOkH8YAeRIqR71wZeGyu0vN/0HJvRqq16K3ot7hN+YIGiqCUT6lSN5cCSPBVvTXzmj5G/xNL4t9LfcSPTE2U0yxMRdCCOf9cFTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (unknown [82.8.138.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 496353430BD;
	Mon, 14 Apr 2025 23:33:56 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: "eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev,  eugene.loh@oracle.com
Subject: Re: [DTrace-devel] [PATCH] test: Account for pid:::entry ucaller
 being correct
In-Reply-To: <20250319063230.28171-1-eugene.loh@oracle.com>
Organization: Gentoo
References: <20250319063230.28171-1-eugene.loh@oracle.com>
User-Agent: mu4e 1.12.9; emacs 31.0.50
Date: Tue, 15 Apr 2025 00:33:53 +0100
Message-ID: <87v7r6jp26.fsf@gentoo.org>
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
> In commit f38bdf9ea ("test: Account for pid:::entry ustack() being correct")
> we accounted for x86-specific heuristics introduced in Linux 6.11 that
> dealt with pid:::entry uprobes firing so early in the function preamble
> that the frame pointer is not yet set and the caller is not (yet)
> correctly identified.
>
> Update a related test to account for the same effect with ucaller.
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  test/unittest/vars/tst.ucaller.r.p | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100755 test/unittest/vars/tst.ucaller.r.p
>
> diff --git a/test/unittest/vars/tst.ucaller.r.p b/test/unittest/vars/tst.ucaller.r.p
> new file mode 100755
> index 000000000..8e03f110d
> --- /dev/null
> +++ b/test/unittest/vars/tst.ucaller.r.p
> @@ -0,0 +1,28 @@
> +#!/bin/sh
> +
> +# A pid entry probe places a uprobe on the first instruction of a function.
> +# Unfortunately, this is so early in the function preamble that the function
> +# frame pointer has not yet been established and the actual caller of the
> +# traced function is missed.
> +#
> +# In Linux 6.11, x86-specific heuristics are introduced to fix this problem.
> +# See commit cfa7f3d
> +# ("perf,x86: avoid missing caller address in stack traces captured in uprobe")
> +# for both a description of the problem and an explanation of the heuristics.
> +#
> +# Add post processing to these test results to allow for both cases:
> +# caller frame is missing or not missing.
> +
> +if [ $(uname -m) == "x86_64" ]; then
> +        read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
> +

<<< is a bashism, but the shebang here is POSIX shell. Please just
change it to bash IMO.

> +        if [ $MAJOR -ge 6 ]; then
> +                if [ $MAJOR -gt 6 -o $MINOR -ge 11 ]; then
> +                        awk '{ sub("myfunc_w", "myfunc_v"); print; }'

Please use gawk instead (see previous commits involving that).

> +                        exit 0
> +                fi
> +        fi
> +fi
> +
> +# Otherwise, just pass the output through.
> +cat
