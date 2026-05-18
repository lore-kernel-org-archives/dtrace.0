Received: from out-26.smtp.github.com (out-26.smtp.github.com [192.30.252.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E4329D291
	for <dtrace@lists.linux.dev>; Mon, 18 May 2026 18:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779130374; cv=none; b=kxtl8gfr04cG0a06C+978FrhDpwlyq7wKnIGuE45zDmAno6hhHZ9dOtX3upnBnrUvf+2Q5WZXWvxR8Ynddzg6clik7q7hTp6xnMpkbtCEXFeEOEAjbJCXT8H/zLlTQ9/EqT/9m+dDsMSPrAg7Zt+A8K5wUh44YpFMzE2ZJ1O88I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779130374; c=relaxed/simple;
	bh=4tyOoq4dsD6bNZY+0XQXrkvvzel/s2t0dLbwPrWbtq4=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=PQO75bHfJvtukozLR7rsw1DI+O+RKESCFAssqCqRd70Gxz8unkLJwcBf8P/nawvRIzyTPVLSnFU8lwYhrwQs8/T4yPlLXOZsvM0pOtrjyzC3sxTpu+Eg7A6dMSVDhRSk+J0V5ht6ki8Oy+qAZRWzGpMVpP68635/FEwzFLn0Dgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=ASR7hjtf; arc=none smtp.client-ip=192.30.252.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b="ASR7hjtf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1779130371;
	bh=v1DSN8HoXMUsIwUwqffoTUkFh5a7ElaRixL8P+03DgY=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=ASR7hjtfEtyoJYsRYxwDLcBzYeiv4D4WfwUXMGOx4aDkp4TV2U7AOmXzAlBM1LPS9
	 D1SCuW0I6hASAPCOxqj2PgES7Gj419E8qIeigCHMVwVjXtUYFk0/A/U6FhIvTN9a7y
	 rqZH/Yx8w+o0qFQKxxa1DIVd0Tm/x9g6nPy25wXI=
Received: from github.com (hubbernetes-node-c649d87.ash1-iad.github.net [10.56.155.44])
	by smtp.github.com (Postfix) with ESMTPA id A8D2A5210A5
	for <dtrace@lists.linux.dev>; Mon, 18 May 2026 11:52:51 -0700 (PDT)
Date: Mon, 18 May 2026 11:52:51 -0700
From: Kris Van Hees <noreply@github.com>
To: dtrace@lists.linux.dev
Message-ID: <oracle/dtrace/push/refs/heads/stable/338095-55ebd5@github.com>
Subject: [oracle/dtrace] 2335de: dtprobed: reject probe descriptions with / in
 any ...
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: dtrace@lists.linux.dev
X-Auto-Response-Suppress: All

  Branch: refs/heads/stable
  Home:   https://github.com/oracle/dtrace
  Commit: 2335de2660c453922ec100a08a56becce94a471b
      https://github.com/oracle/dtrace/commit/2335de2660c453922ec100a08a56becce94a471b
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-03-10 (Tue, 10 Mar 2026)

  Changed paths:
    M dtprobed/dof_stash.c
    A test/unittest/usdt/err.unsafe-prov.r
    A test/unittest/usdt/err.unsafe-prov.sh

  Log Message:
  -----------
  dtprobed: reject probe descriptions with / in any component

Commit b55e34351 ("USDT module names may contain dots; but forbid "."
and ".." names") was not sufficient to prevent malicious probe
description components causing pathnames to be created that could
make file access possible outside the dtrace directory hierarchy.  By
ensuring USDT probe description data cannot contain '/' either in any
of the probe description components, this is no longer possible.

Test included.

Orabug: 39054018
CVE: CVE-2026-21991
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: John Haxby <john.haxby@oracle.com>
Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>


  Commit: 1f71b2263ffb65829a10eb7a970739025b0d476a
      https://github.com/oracle/dtrace/commit/1f71b2263ffb65829a10eb7a970739025b0d476a
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-03-10 (Tue, 10 Mar 2026)

  Changed paths:
    M NEWS
    M dtrace.spec
    M libdtrace/versions.list

  Log Message:
  -----------
  Update NEWS, dtrace.spec, versions.list for release 2.0.6

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>


  Commit: deb67e96d342347cdf6ff15d08fcc238b5fb9e78
      https://github.com/oracle/dtrace/commit/deb67e96d342347cdf6ff15d08fcc238b5fb9e78
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-04-06 (Mon, 06 Apr 2026)

  Changed paths:
    M dtrace.spec
    M libproc/Psymtab.c
    A test/internals/libproc/err.bad_sh_link.r
    A test/internals/libproc/err.bad_sh_link.r.p
    A test/internals/libproc/err.bad_sh_link.sh

  Log Message:
  -----------
  libproc: fix out-of-bounds memory access when processing ELF data

The caching of section header data was not safeguarded against a possible
overflow in the allocation of cache elements, which could result in
accesses beyond the allocated space.

The lack of validation of sh_link against [1, number-of-section-headers]
could result in accesses beyond the allocated space.

New runtime dependency for dtrace-tests: xxd

Orabug: 39121881
CVE: CVE-2026-21992
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>


  Commit: 67f75b8b0e1274db0877fc1f128ae6a26e2d9b05
      https://github.com/oracle/dtrace/commit/67f75b8b0e1274db0877fc1f128ae6a26e2d9b05
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-04-29 (Wed, 29 Apr 2026)

  Changed paths:
    M libproc/Psymtab.c
    A test/internals/libproc/err.bad_sh_entsize.r
    A test/internals/libproc/err.bad_sh_entsize.r.p
    A test/internals/libproc/err.bad_sh_entsize.sh

  Log Message:
  -----------
  libproc: avoid FPE when sh_entsize is 0

Orabug: 39121874
CVE: CVE-2026-21996
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>


  Commit: e7c8bcc851b9f2376f043781bb5ccf911b418487
      https://github.com/oracle/dtrace/commit/e7c8bcc851b9f2376f043781bb5ccf911b418487
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-04-29 (Wed, 29 Apr 2026)

  Changed paths:
    M libproc/Psymtab.c

  Log Message:
  -----------
  libproc: add safety checks for program headers

While it does not seem possible to ever end up tracing a program wit
bad program headers, it is best to guard against it anyway.  Most
specifically, the loop over all program headers assumes that there will
be a PT_LOAD one.  If not, processing should be aborted.

Also, if a PT_LOAD program header would have 0 p_align, the calculation
of the file_dyn_base would be wrong, because it uses "& (p_align - 1)".

No tests can be created at this time because ET_EXEC and ET_DYN objects
do not encounter this code path.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>


  Commit: d3d41183f16fb82f8957b450f87abd241379bdaa
      https://github.com/oracle/dtrace/commit/d3d41183f16fb82f8957b450f87abd241379bdaa
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-04-29 (Wed, 29 Apr 2026)

  Changed paths:
    M libproc/Psymtab.c
    A test/internals/libproc/err.shstrtab_without_NUL.r
    A test/internals/libproc/err.shstrtab_without_NUL.r.p
    A test/internals/libproc/err.shstrtab_without_NUL.sh
    A test/internals/libproc/err.strtab_without_NUL.r
    A test/internals/libproc/err.strtab_without_NUL.r.p
    A test/internals/libproc/err.strtab_without_NUL.sh

  Log Message:
  -----------
  libproc: do not allow unterminated STRTAB sections

If the .shstrtab section or the strtab section associated with the
.symtab are not NUL-terminated, a core dump or corrupted data can
result.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>


  Commit: 18cd8f1228341909a75cf2b9540bcfcfde1b13eb
      https://github.com/oracle/dtrace/commit/18cd8f1228341909a75cf2b9540bcfcfde1b13eb
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-04-29 (Wed, 29 Apr 2026)

  Changed paths:
    M libproc/Psymtab.c
    A test/internals/libproc/err.bad_sh_link2.r
    A test/internals/libproc/err.bad_sh_link2.r.p
    A test/internals/libproc/err.bad_sh_link2.sh

  Log Message:
  -----------
  libproc: ensure that symtab sh_link references a strtab

If the sh_link of the symtab does not reference a strtab, unpredictable
behaviour could occur because the linked section will be interpreted as
if it is a strtab.  As far as code safety, this failure case is not
likely to cause issues because all symbol name handling code verifies
that the st_name value is within the [0, size] range for the sh_link
referenced section.

Tests are included for the case of sh_link referencing a non-STRTAB
section or the wrong STRTAB section.  These cases were (indirectly)
covered by existing code - the tests are added as a precaution against
future regressions.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>


  Commit: 55ebd5f81bf2e10142585a3a43536a99f5f9b0d4
      https://github.com/oracle/dtrace/commit/55ebd5f81bf2e10142585a3a43536a99f5f9b0d4
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-04-29 (Wed, 29 Apr 2026)

  Changed paths:
    M NEWS
    M dtrace.spec
    M libdtrace/versions.list

  Log Message:
  -----------
  Update NEWS, dtrace.spec, versions.list for release 2.0.7

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>


Compare: https://github.com/oracle/dtrace/compare/338095278232...55ebd5f81bf2

To unsubscribe from these emails, change your notification settings at https://github.com/oracle/dtrace/settings/notifications
