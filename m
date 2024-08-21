Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CB3A920
	for <dtrace@lists.linux.dev>; Wed, 21 Aug 2024 00:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724199098; cv=none; b=gTzsq+w5d0Xww9iinA27CiS8UmCho/hQtzsvm/MmsS3u2CDzuX27NfX4ebRXN7uWCBq4mpDmcw4QFEZfuLs+EcojkRbssB8A6TnoqAjVo5QHWxH7Gssq9m04Nh40fH06ci8vL2nDR5TCjpx+dwbX5cWBTj8O078lYGgJoIX7wC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724199098; c=relaxed/simple;
	bh=MGWcRmaNgxNPHtSkR+vt874xA2jsworPxB33y+TvT7w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ogOnAcDpYPDjLy4z0Acej8nv8rgEGG5P1Od6GGHo0t7FrNyavZFOCCw6e8yp9xVvyloU3aRax/svyGDYzwRjsj2cQKbcNQsa0BYumQXlpDfsbTt0HvPcJ3QoNbE/mJnkghyFvcY8+X6neGBNFXxbIaYs5mvD4aRdhIfdXzPTKdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: dtrace@lists.linux.dev
Subject: Followup on doc issues with USDT
Organization: Gentoo
Date: Wed, 21 Aug 2024 01:11:29 +0100
Message-ID: <87msl6ohu6.fsf@gentoo.org>
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

Hi!

This is a followup to
https://lore.kernel.org/dtrace/87jzgfr2m8.fsf@gentoo.org/.

Carrying on with the USDT tutorial and reference, I noticed a few other
issues.

* In the guide/reference [0], under "Adding Probes to an Application" ->
"Using Statically Defined Probes", a script is provided as 'testscript'.

Unfortunately, the script is broken (it's missing a heredoc for the
Makefile at the very least; there's nothing in the script to stsrt
creating a Makefile, it just launches into some of its (truncated) contents):
```
$ bash /tmp/x
/tmp/x: line 36: test.o:: command not found
test.c:2:10: fatal error: prov.h: No such file or directory
    2 | #include "prov.h"
      |          ^~~~~~~~
compilation terminated.
/tmp/x: line 39: prov.o:: command not found
dtrace: failed to link script prov: failed to open test.o: No such file or directory
/tmp/x: line 42: test:: command not found
/usr/lib/gcc/x86_64-pc-linux-gnu/15/../../../../x86_64-pc-linux-gnu/bin/ld: cannot find prov.o: No such file or directory
/usr/lib/gcc/x86_64-pc-linux-gnu/15/../../../../x86_64-pc-linux-gnu/bin/ld: cannot find test.o: No such file or directory
collect2: error: ld returned 1 exit status
/tmp/x: line 44: EOF: command not found
cc     test.c   -o test
test.c:2:10: fatal error: prov.h: No such file or directory
    2 | #include "prov.h"
      |          ^~~~~~~~
compilation terminated.
make: *** [<builtin>: test] Error 1
dtrace: No such process
```

* In the tutorial [1], under "Using USDT Probes", the 'list the probes'
  instructions don't work.

I get the same "No probe matches description" even when `prime` is
certainly running in another terminal. I've also verified USDT
functionality works using the DTrace testsuite and via manually
constructing examples with an actual probe enabled (not just listing).

```
# dtrace -l -P 'prime*'
  ID   PROVIDER            MODULE                          FUNCTION NAME
dtrace: failed to match prime*:::: No probe matches description
```

When doing `dtrace -l`, it doesn't know to wildcard match USDT (or pid)
probes.

[0] https://docs.oracle.com/en/operating-systems/oracle-linux/dtrace-guide/dtrace-ref-StaticallyDefinedTracingofUserApplications.html#dt_uusdt_sdt
[1] https://docs.oracle.com/en/operating-systems/oracle-linux/dtrace-tutorial/dtrace-tutorial-TracingUserSpaceApplications.html#dtrace_use_usdtprobes

thanks,
sam

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iOUEARYKAI0WIQQlpruI3Zt2TGtVQcJzhAn1IN+RkAUCZsUwsl8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MjVB
NkJCODhERDlCNzY0QzZCNTU0MUMyNzM4NDA5RjUyMERGOTE5MA8cc2FtQGdlbnRv
by5vcmcACgkQc4QJ9SDfkZAEqAEAvo8gQNBtac5e6jiOc+oQFQ+g8FSJfDV81ZC8
17SvNUsBAJdLd0vhL5gHAN1ytaIN0O42lhwCQpOC0+SW8Uq0GlMD
=IV47
-----END PGP SIGNATURE-----
--=-=-=--
