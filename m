Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3FD140E30
	for <dtrace@lists.linux.dev>; Sat, 17 Aug 2024 08:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723882245; cv=none; b=ag+Lk+laSY5wCi2gVnCQMQ6wuA0+g1w5hOYzC7lA0UerbJmLsGW9xFKuuRd7Hl1X6hS03XR+9AhNI4xuwZLHrkXAdaMO9J6TsoBfRbGUtS7Oma2C4cwptn3rG+QaSxYF7HW1HISEIeA+L6pMfHBp0e3euzvwNvDR+SruUnhxYVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723882245; c=relaxed/simple;
	bh=fqMQT3O2W4wyG6u8LV9LvyzDjIGtnGIU3rmWeZcjtTU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f2RztdtPx2FrMfNwP772J2epus5kTRv4yuR/P7i8nIJmGDASbw32iqrPpXEY3w3K9Eti5bbXOlFMQIBPOwivGq2B6csUNYEOR04YmqhHfrcbb+48JHuV+iM7aa6sN4YYRDxmoho9eshetRZ71wgh0jCxWisIBak1C6Vau1+pGkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: dtrace@lists.linux.dev
Subject: Issues with documentation
Organization: Gentoo
Date: Sat, 17 Aug 2024 09:10:39 +0100
Message-ID: <87jzgfr2m8.fsf@gentoo.org>
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

Hi!

I've started going through the DTrace tutorial on docs.oracle.com [0]
and found a few errors which derailed me.

Hopefully this is the right place to report that so the docs can
be updated.

Testing was done with dtrace at commit c84954cdc6fb017034e2c3fe4445a7c8981d=
35e9
and linux-6.6.46.

# 2 Tracing Operating System Behavior=20

* Tracing Process Creation
** Example: Monitoring the System as Programs Are Executed (execcalls.d)
	```
	$ dtrace -n 'proc::do_execveat_common:exec { trace(stringof(args[0])); }'
	dtrace: invalid probe specifier proc::do_execveat_common:exec { trace(stri=
ngof(args[0])); }: probe description proc::do_execveat_common:exec does not=
 match any probes
	```

	Workaround I used: proc:::exec works.

* Tracing System Calls
** Example: Recording open() System Calls on a System (syscalls.d)
	```
	$ dtrace -n 'syscall::open:entry { printf("%-16s %-16s\n",execname,copyins=
tr(arg0)); }'
	dtrace: description 'syscall::open:entry ' matched 1 probe
	[no output]
	```

	I think the reason here is that it's pretty rare for anything to actually
	use `open` directly.

	Workaround I used: wildcard with: 'syscall::openat*:entry { printf("%s %s\=
n", execname, copyinstr(arg1)); }'

** Exercise: Using the printf() Function to Format Output
	Nit: there's inconsistent spaces between the function arguments.

** Exercise: Using tick Probes
	In 'Example: Modified Version of tick.d', the listed function names
	don't have 'ms' appended, but the example solution to the exercise does.

	The docs should explain the inconsistency and why it's OK (or fix it).

* Tracing Parent and Child Processes
** Example: Using proc Probes to Report Activity on a System (activity.d)=20
	```
	$ dtrace -s activity.d
	dtrace: failed to compile script activity.d: line 5: probe description pro=
c::_do_fork:create does not match any probes
	```

	See cad6967ac10843a70842cd39c7b53412901dd21f in linux.git, _do_fork
	was renamed.

** Example: Recording fork() and exec() Activity for a Specified Program (a=
ctivity1.d)
	This example is broken in a few ways:
	1) because of the fork issue mentioned above;
	2) the command snippet afterwards says 'activity.d', not 'activity1.d'
	(tries to pass arg to activity.d which doesn't accept any, unlike
	the just-created activity1.d);
	3) same proc::do_execveat_common:exec issue as earlier too.

** Exercise: Tracing Processes That Are Run by a User
	```
	$ ./countprogs.d $(id -u sam)
	dtrace: failed to compile script ./countprogs.d: line 5: probe description=
 proc::do_execveat_common:exec does not match any probes
	```

** Example: Counting the Number of Times a Program Reads From Different Fil=
es in 10 Seconds (fdscount.d)=20
	I think the program (fdscount.d) is missing?

** Example: Displaying System Call Errors (errno.d)=20
	This didn't seem to work for me (no output) after doing e.g. ls /idonotexi=
st,
	cat blahblah.

# 3 Tracing User-Space Applications=20

* Using USDT Probes
	This didn't seem to work for me (no probes found).

	I stopped testing here for now.

[0] https://docs.oracle.com/en/operating-systems/oracle-linux/dtrace-tutori=
al/dtrace-tutorial-Preface.html#pref

I've not repeated the same issues if e.g. a probe is gone/renamed/missing
so other instances will need to be checked if I already named it.

I'd like to add that the doc website is pretty nice to navigate and the con=
tent
is well-written. While I normally prefer PDFs, I didn't even end up using t=
he
download option.

thanks,
sam

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iOUEARYKAI0WIQQlpruI3Zt2TGtVQcJzhAn1IN+RkAUCZsBbAF8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MjVB
NkJCODhERDlCNzY0QzZCNTU0MUMyNzM4NDA5RjUyMERGOTE5MA8cc2FtQGdlbnRv
by5vcmcACgkQc4QJ9SDfkZAuLAD9Eod6oIgQDQuO9CnVU4yOwOyj9gWQNtntU69H
MBr7+BkA/0EbRODutGt4JPxQCZVm3pV720P4vO3RrgEjCKbH2j8J
=1+OT
-----END PGP SIGNATURE-----
--=-=-=--
