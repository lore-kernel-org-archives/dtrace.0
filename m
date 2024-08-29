Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACDC1BA890
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 20:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724963151; cv=none; b=jyKdLlPxjaxW4k8tSlYvnAyhg8ZZOcODPkyGEK5NJqRJwMZMsfD5q01SCwkIrtL066WlCyNA5ORFEkta0SquJutwBUmgF3cx3hnvg7kwL/gb8v8iiw9pKyfdcsH4OkHL914DL4w1+n3vc4NEnxHFUQX2SqURZAXGxlBHTGhG4CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724963151; c=relaxed/simple;
	bh=2Ytq5Fncrb9SmG1vbn2//4Wpv+kUVkxyJ5G+BDGZQ+s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ELM+8CGMSsKKrSal1zY6kpXmhBC++TpT25GKgih1aDBnl3EH1v3IMoOIc2Vd3MmNgf2FhbzHVxbWAH909w+yfbAKmaUFX6Nq0+CxelweyQvrG21IGhIalgbLSrvXYPlAzlUuW0kjzork0+do44lSyoPic8qPeA3UVzJIIZlt7fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: "eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev,  eugene.loh@oracle.com
Subject: Re: [DTrace-devel] [PATCH 21/22] test: Fix DIRNAME
In-Reply-To: <20240829052219.3234-21-eugene.loh@oracle.com> (eugene loh's
	message of "Thu, 29 Aug 2024 01:22:18 -0400")
Organization: Gentoo
References: <20240829052219.3234-1-eugene.loh@oracle.com>
	<20240829052219.3234-21-eugene.loh@oracle.com>
Date: Thu, 29 Aug 2024 21:25:46 +0100
Message-ID: <87zfovf54l.fsf@gentoo.org>
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
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
> index c5dfc72b..f9b1d8bf 100755
> --- a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
> +++ b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
> @@ -26,7 +26,7 @@ dtrace=$1
>  CC=/usr/bin/gcc
>  CFLAGS=
>  
> -DIRNAME="$tmpdir/list-probes-func-usdt.$$.$RANDOM"
> +DIRNAME="$tmpdir/list-probes-name-usdt.$$.$RANDOM"
>  mkdir -p $DIRNAME
>  cd $DIRNAME

Feel like this is crying out for $(mktemp -d) instead in both this and
the test it was copied from...
