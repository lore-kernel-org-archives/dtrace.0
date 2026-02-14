Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28191FFC48
	for <dtrace@lists.linux.dev>; Sat, 14 Feb 2026 13:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771076079; cv=none; b=Qu+5qIatcUSumNMXJlUqbzYpeW/LVDWTSbyDql01Y6BpOOkRu0vkYrx/h9unHQ2/kVei3tmMlBvkzL3O0RcdSBS7+jMcchgRLktTAiIdDtrM3s1xseFl+BD75IpedO6EpEAojEAvLhk1uXaWABVbofr1ykHtxXModYfFZ9otQFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771076079; c=relaxed/simple;
	bh=gDXz/5fB7lT5UhQ+flMBmbW2wI/GxcWQuTbemsklpEA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eXjrWlh3Ej2YvfUd91qxM8pZrNXdCfUb/HCj1Ujs0f+F+v5rbNfvogpbSZiFuivVDcbZo4WCbJgeTw1u4Jl77k07mbf9mUy2+Ls/Uae+11Vsh1kC9TE+6iGyZyxpZfmLDEcNZkzHCWE8Gn32YNOUDOXGBds1oPkYRmmWbXvDotg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (2.8.3.0.0.0.0.0.0.0.0.0.0.0.0.0.a.5.c.d.c.d.9.1.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:19dc:dc5a::382])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6708E340D7B;
	Sat, 14 Feb 2026 13:34:35 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>,  dtrace-devel@oss.oracle.com,
  dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH v4] Add packaging configuration for Debian
In-Reply-To: <87tsvkn0ai.fsf@esperi.org.uk>
Organization: Gentoo
References: <DS0PR10MB752255507DE8C6B11F027AF4C262A@DS0PR10MB7522.namprd10.prod.outlook.com>
	<87tsvkn0ai.fsf@esperi.org.uk>
User-Agent: mu4e 1.12.15; emacs 31.0.50
Date: Sat, 14 Feb 2026 13:34:31 +0000
Message-ID: <874injxxco.fsf@gentoo.org>
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

Nick Alcock via DTrace-devel <dtrace-devel@oss.oracle.com> writes:

> On 10 Feb 2026, Kris Van Hees via DTrace-devel outgrape:
>
>> Packaging configuration files for Debian are provided in dists/debian.
>
> Nice! Seems to work, even on Debian stable (I was sure I'd need at least
> testing, but no!).
>
> [...]
>> diff --git a/dists/debian/patches/debian-configure.patch b/dists/debian/patches/debian-configure.patch
>> new file mode 100644
>> index 00000000..d4a89bb9
>> --- /dev/null
>> +++ b/dists/debian/patches/debian-configure.patch
>> @@ -0,0 +1,17 @@
>> +Description: issue a warning for unknown configure options
>> + The Debian build system specifies configure options that are not known to
>> + the DTrace configure script.  They should not cause the configure script
>> + to abort.
>> +--- dtrace-2.0.4.orig/configure
>> ++++ dtrace-2.0.4/configure
>> +@@ -172,8 +172,7 @@ for option in "$@"; do
>> +         HAVE_VALGRIND=*) write_config_var VALGRIND "$option";;
>> +         HAVE_BPFV3=*) write_config_var BPFV3 "$option";;
>> +         HAVE_BPFMASM=*) write_config_var BPFMASM "$option";;
>> +-        *) echo "Unknown option $option" >&2
>> +-           exit 1;;
>> ++        *) echo "Unknown option $option" >&2;;
>> +     esac
>> + done
>
> I assumed you could just stuff an || true in there, but this is being
> invoked by dh_auto_configure, so that option isn't available (plus, of
> course, if there's an actual error other than unknown args, we don't
> want to fail).
>
> Maybe we should just not exit with exitcode 1 on unknown configure
> options, only IIRC Gentoo actually wants us to. This may be the best we
> can do.

I really doubt this is the first / only package for Debian where there's
a non-autoconf configure script.

The real issue here is letting whatever Debian machinery that calls
configure think it is autoconf. ebuilds do the same, by default econf
will pass things assuming it's autoconf.

I'm sure there's a way to override that?

>
>> diff --git a/dists/debian/patches/debian-interpreter-paths.patch b/dists/debian/patches/debian-interpreter-paths.patch
>> new file mode 100644
>> index 00000000..58bea538
>> --- /dev/null
>> +++ b/dists/debian/patches/debian-interpreter-paths.patch
>> @@ -0,0 +1,107 @@
>> +Description: fix interpreter paths in tests
>> + Lintian prefers /bin/bash and /bin/sed over /usr/bin/bash and /usr/bin/sed.
>
> Honestly this one I think we should do upstream. I always thought that
> /bin/bash is universal and /usr/bin/bash less so.
>

Yes.

> [...]

sam

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEBBAEWCgCpFiEEJaa7iN2bdkxrVUHCc4QJ9SDfkZAFAmmQeegbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25z
Lm9wZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXQyNUE2QkI4OEREOUI3NjRDNkI1NTQx
QzI3Mzg0MDlGNTIwREY5MTkwDxxzYW1AZ2VudG9vLm9yZwAKCRBzhAn1IN+RkCw9
AQCDp+7mUeeHa0+CjyizYff+8nhN28sxNo7ZoZGLgZUoAQEAk/oQR6KTD8WjwJBA
3FNKjB3ufSs9TuUPg0QA4w05fgM=
=wzut
-----END PGP SIGNATURE-----
--=-=-=--
