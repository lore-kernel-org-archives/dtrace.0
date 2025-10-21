Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14525222565
	for <dtrace@lists.linux.dev>; Tue, 21 Oct 2025 10:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761043529; cv=none; b=DocNG0TjbREuPYuP5NphFVZvWRW3qRyGHz6pCbAGHEHwnPYXKcXAPgxyXm+guUMB1Y63Amycf4uB0atGwI/+dJoPEhNR4BR44ytNIMdGGQv47ZGX/sVMsY0zHwLBbq/7M+jc9qwIAPVodVri4K/whj3pljJabx74kjVzJyjNCog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761043529; c=relaxed/simple;
	bh=XrySqXwNiX6EM6jayPddJEDrXtzUD+0FJMjf/qD5V2c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mcGJwHHXmIngIk2cnTJkfsLCajB7Rlb3+P4rkYbLiawX0ZOCbidD31cEGgO5DgVhFJVswf4oMetKcOLrhUoCO+y1RncZalIaFn4e40gtJJiedaq+BQdQAsiBmYPgINBUiWU+dAvn477Go+W99n2/sHWWQK+nBQtptJl2IT2n4bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (2.8.3.0.0.0.0.0.0.0.0.0.0.0.0.0.a.5.c.d.c.d.9.1.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:19dc:dc5a::382])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C6998335D7B;
	Tue, 21 Oct 2025 10:45:26 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: "eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev,  eugene.loh@oracle.com
Subject: Re: [DTrace-devel] [PATCH] test: Use /usr/bin/perf for perf
In-Reply-To: <20251021031907.30226-1-eugene.loh@oracle.com>
Organization: Gentoo
References: <20251021031907.30226-1-eugene.loh@oracle.com>
User-Agent: mu4e 1.12.13; emacs 31.0.50
Date: Tue, 21 Oct 2025 11:45:24 +0100
Message-ID: <87ldl4leij.fsf@gentoo.org>
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
> The testsuite package has a dependency on the perf package.  But that
> package installs perf in /usr/bin.  Meanwhile, there is a /sbin/perf,
> which is likely to appear earlier in the search path for dtrace users.
> That perf is a wrapper for an executable that might not exist, causing
> some silent, unexpected behaviors with the test suite.

Just for my own curiosity: what exactly is /sbin/perf? I've never heard
of this "collision" before, so want to know if I should be aware of it
in other contexts.

>
> Change references to "perf" to be explicitly "/usr/bin/perf".
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  test/unittest/cpc/tst.branches.x     | 4 ++--
>  test/unittest/cpc/tst.instructions.x | 4 ++--
>  test/utils/cpc_get_events.sh         | 4 ++--
>  test/utils/perf_count_event.sh       | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/test/unittest/cpc/tst.branches.x b/test/unittest/cpc/tst.branches.x
> index 4b235055d..a19d1bc6d 100755
> --- a/test/unittest/cpc/tst.branches.x
> +++ b/test/unittest/cpc/tst.branches.x
> @@ -1,11 +1,11 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  
> -if ! perf list hw | grep -qw branches; then
> +if ! /usr/bin/perf list hw | grep -qw branches; then
>  	echo 'no "branches" event on this system'
>  	exit 2
>  fi
> diff --git a/test/unittest/cpc/tst.instructions.x b/test/unittest/cpc/tst.instructions.x
> index c3a2ede34..3c1e47b75 100755
> --- a/test/unittest/cpc/tst.instructions.x
> +++ b/test/unittest/cpc/tst.instructions.x
> @@ -1,11 +1,11 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  
> -if ! perf list hw | grep -qw instructions; then
> +if ! /usr/bin/perf list hw | grep -qw instructions; then
>  	echo 'no "instructions" event on this system'
>  	exit 2
>  fi
> diff --git a/test/utils/cpc_get_events.sh b/test/utils/cpc_get_events.sh
> index 80d3584b2..cc833fbb9 100755
> --- a/test/utils/cpc_get_events.sh
> +++ b/test/utils/cpc_get_events.sh
> @@ -1,7 +1,7 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  
> @@ -13,7 +13,7 @@ eventnamelist="cpu-clock"
>  $(dirname $0)/cpc_temp_skip_bug.sh > /dev/null
>  if [ $? -eq 0 ]; then
>  	for eventname in branches instructions; do
> -		if perf list hw | grep -qw $eventname; then
> +		if /usr/bin/perf list hw | grep -qw $eventname; then
>  			eventnamelist="$eventnamelist $eventname"
>  		fi
>  	done
> diff --git a/test/utils/perf_count_event.sh b/test/utils/perf_count_event.sh
> index 957363e55..bc1441f32 100755
> --- a/test/utils/perf_count_event.sh
> +++ b/test/utils/perf_count_event.sh
> @@ -1,7 +1,7 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  
> @@ -20,7 +20,7 @@ shift
>  #   If the output is no good, report -1.
>  #   If the output is time in msec, convert to nsec.
>  #   Otherwise, just report the count.
> -perf stat -e $event --no-big-num -x\  $utils/$* |& gawk '
> +/usr/bin/perf stat -e $event --no-big-num -x\  $utils/$* |& gawk '
>  /^[^0-9]/ { print -1; exit 1 }
>  / msec / { print int(1000000. * $1); exit 0 }
>  { print $1; exit 0 }'
