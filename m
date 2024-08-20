Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4A912E71
	for <dtrace@lists.linux.dev>; Tue, 20 Aug 2024 00:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724114963; cv=none; b=DgRYYqjCVC41BHJ7VACbegrW3i4tesO4TInEhWj3sixK1pMIsych9YtOpVfiWp/zkJCZ+V3+LCy4nEhlpuQY010nYZOLuUzBwN87qRw6efjdDZdX8/DuIstNoLm1h1Vlepdzz+c8PWzJ4tu8izQ7gO3VgNCRlDlkT/DSSBjMNzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724114963; c=relaxed/simple;
	bh=gR8lvgUaZ9ZTny5h1SkNJ3YJl5b6+tmf+WqaYL0ubSc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MaxvMxqy625+bFQrDtVpPqqxGV++dZptBFJI/8U/jvSM34TLYU/JfXKP7vGjSXfATOjLd+61ytjzqR4BF+SUuv31iAqQ6Qh3+0ibOmxjROo7aGtQFJNH8V8QT5YEkoY97aQNg0E0urP0tlrqx0xjewrLsHBgv8RJ62eoDxpUdi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: Kris Van Hees via DTrace-devel <dtrace-devel@oss.oracle.com>
Cc: eugene.loh@oracle.com,  Kris Van Hees <kris.van.hees@oracle.com>,
  dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH v2 6/8] test: Check dtrace return status
 in USDT tst.forker.sh
In-Reply-To: <ZsPR9mTFKe2jAfqW@oracle.com> (Kris Van Hees via DTrace-devel's
	message of "Mon, 19 Aug 2024 19:15:02 -0400")
Organization: Gentoo
References: <20240627052516.21220-1-eugene.loh@oracle.com>
	<ZsPR9mTFKe2jAfqW@oracle.com>
Date: Tue, 20 Aug 2024 01:49:16 +0100
Message-ID: <87plq4j9wz.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Kris Van Hees via DTrace-devel <dtrace-devel@oss.oracle.com> writes:

> On Thu, Jun 27, 2024 at 01:25:16AM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>=20
>> This test was spuriously passing.  DTrace failed to run -- many error
>> messages in the log file indicated as much -- and yet the test passed.
>>=20
>> Check the dtrace return status.
>>=20
>> The test will pass once USDT supports wildcard provider names.
>>=20
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>
> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

This made me go looking for other issues and I sent a small series for
the obvious ones.

There are other issues around:
* dtrace .. | awk, exit $? wrt no lastpipe, and
* multiple checks but we only exit $? only at the end (this is
debatable)
* exiting 0 at the end when checking for intended failure (perhaps
should do exit 1 if any of them *don't* fai;, see previous point) in a
handful of tests
* tests like test/unittest/udp/tst.ipv6localudp.sh where, while we
normally rely on the implicit exit code being the last command run,
because we do e.g. kill after, we end up not checking it.

Some of this doesn't matter *that* much because of the actual test
output being checked in .r files, but failing faster is nicer for
debugging as well, and in some cases, there is no .r (like this one).

> [...]

thanks,
sam

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iOUEARYKAI0WIQQlpruI3Zt2TGtVQcJzhAn1IN+RkAUCZsPoDV8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MjVB
NkJCODhERDlCNzY0QzZCNTU0MUMyNzM4NDA5RjUyMERGOTE5MA8cc2FtQGdlbnRv
by5vcmcACgkQc4QJ9SDfkZAY1QEAuMDlHn5ic0TD6eXUL+jyWPmgfx1f8j7RDrs+
zNBvaEwA/0lCvEj5jRUQyyY/N67uTSTp/xeJYuGtZMdZc4nxQf4J
=5Q/H
-----END PGP SIGNATURE-----
--=-=-=--
