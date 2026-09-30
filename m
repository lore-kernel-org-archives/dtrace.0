Received: from out-18.smtp.github.com (out-18.smtp.github.com [192.30.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26135521207
	for <dtrace@lists.linux.dev>; Wed, 30 Sep 2026 18:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793660; cv=none; b=cqI127eQOILwzfs593onqQb4EuglEx8fpn0NFU5Q2XLG4UC/WElrSGd714nRwLrHiZFHY1MD8xhnyXrqgk/t7s380q63o3WM9rr2C9PqIvqlDZ04jacX3AxpzlvwnnqcZlaAMFgMTudduXey1VlsjKhzB4EbHAEVYN7jU/rFfkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793660; c=relaxed/simple;
	bh=Tmj67bsY+knQ88w4yPN5XfNA/zqNUuokCCFzrm+0vkI=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=cZioaWfEEPvFsvheUU4FrbBvM8iNO1EcWdsjz62vDreDCOkhZFlMzhdYtchEmXhVLkGgq3L843xdHYXQDDkLbKv/GOA7UlPy2Zkxvqnt9jmeizcrm3oMcd3LTjapd03wHdMDX6yR/JXWWn69QtIufpluTQQQhFd8eznpZFITx5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (2048-bit key) header.d=github.com header.i=@github.com header.b=OBzhnBUW; arc=none smtp.client-ip=192.30.252.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=github.com header.i=@github.com header.b="OBzhnBUW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2026; t=1790793658;
	bh=4hBeYWKgsTBT6jurUjzywDEVex9saaKgDLJA4TcXI7k=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=OBzhnBUWJlTP0c42adYqp0dOVe3fydauskWnQHs0RX9qajL+45PQttFeDfz4fdd4G
	 wAi5frjKnDOc6captppBAF+dZG/9YwgCwlhMxZjEHX9/h01Sg2GoanyhCgtfJYJEnF
	 3JxnnQ1nSR2Gnej0pONrFjiRbbAHzNH8zd1r1J0KcusywslPqkkODMzkEPkJxrSWmX
	 OJvfmX5YowZQ+BZSxMazKs4S+A5oXrFrgoVbuASMGnC7FntTz/j5BMdncDLjeJ8LIy
	 ttNBERunS/IEEzDluAXOoWvVq4NfVv/NTtjGpUEMUgEF/rp5KWYYlSh2kAhKsl05uI
	 nOeQ/3H5daU9A==
Received: from github.com (hubbernetes-node-e09c95c.va3-iad.github.net [10.48.67.73])
	by smtp.github.com (Postfix) with ESMTPA id EC553180139
	for <dtrace@lists.linux.dev>; Wed, 30 Sep 2026 11:40:57 -0700 (PDT)
Date: Wed, 30 Sep 2026 11:40:57 -0700
From: Kris Van Hees <noreply@github.com>
To: dtrace@lists.linux.dev
Message-ID: <oracle/dtrace/push/refs/heads/dev-queue/02f587-a0a173@github.com>
Subject: [oracle/dtrace] 729657: test: Fix path to sed
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

  Branch: refs/heads/dev-queue
  Home:   https://github.com/oracle/dtrace
  Commit: 729657e904d4e949b1ad9d52211f5d0702edfded
      https://github.com/oracle/dtrace/commit/729657e904d4e949b1ad9d52211f5d0702edfded
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-09-29 (Tue, 29 Sep 2026)

  Changed paths:
    M test/internals/libproc/err.bad_sh_link.r.p

  Log Message:
  -----------
  test: Fix path to sed

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


  Commit: e31cc91ab28d5f9e16465872f160ad60d68c92fe
      https://github.com/oracle/dtrace/commit/e31cc91ab28d5f9e16465872f160ad60d68c92fe
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-09-29 (Tue, 29 Sep 2026)

  Changed paths:
    M libdtrace/dt_link.c

  Log Message:
  -----------
  link: no longer add utsname in USDT ELF notes

USDT ELF notes used to contain utsname information for debugging, but
this has proven to be troublesome for distributions that expect to be
able to regenerate build objects with identical data.  Since the
utsname data contains the system name, the USDT ELF notes were causing
comparisons between generates and regenerated objects to fail.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


  Commit: f49e2063d6c13d6c97dd61807589a9e5fb193b65
      https://github.com/oracle/dtrace/commit/f49e2063d6c13d6c97dd61807589a9e5fb193b65
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-09-29 (Tue, 29 Sep 2026)

  Changed paths:
    M libdtrace/dt_impl.h
    M libdtrace/dt_module.c
    M libdtrace/dt_open.c

  Log Message:
  -----------
  ctf: introduce dt_ctfa_open to support ctf-nobfd

If DTrace is statically linked with the libctf-nobfd library, there is
no ctf_arc_open() function (for unknown reasons).  We therefore add a
dt_ctfa_open() function that works both for libctf and libctf-nobfd.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


  Commit: a0a173ff1ec490c5b9823654665cff62ccf27ff3
      https://github.com/oracle/dtrace/commit/a0a173ff1ec490c5b9823654665cff62ccf27ff3
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-09-29 (Tue, 29 Sep 2026)

  Changed paths:
    A dists/Build
    A dists/debian/changelog
    A dists/debian/control
    A dists/debian/copyright
    A dists/debian/dtrace-tests.install
    A dists/debian/dtrace-tests.lintian-overrides
    A dists/debian/dtrace.docs
    A dists/debian/dtrace.install
    A dists/debian/dtrace.lintian-overrides
    A dists/debian/dtrace.manpages
    A dists/debian/libdtrace2-dev.install
    A dists/debian/libdtrace2.install
    A dists/debian/libdtrace2.lintian-overrides
    A dists/debian/libdtrace2.manpages
    A dists/debian/mkChangelog
    A dists/debian/patches/debian-configure.patch
    A dists/debian/patches/debian-static-linking.patch
    A dists/debian/patches/series
    A dists/debian/rules
    A dists/debian/source/format

  Log Message:
  -----------
  Add packaging configuration for Debian

Packaging configuration files for Debian are provided in dists/debian.

Sample steps to build DEB packages:

 - make dist
 - cp dtrace-x.y.z.tar.bz2 $D/dtrace_x.y.z.orig.tar.bz2
 - cd $D
 - tar -jxpSf dtrace_x.y.z.orig.tar.bz2
 - cd dtrace-x.y.z
 - make prep-debian
 - debuild

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


Compare: https://github.com/oracle/dtrace/compare/02f587384320...a0a173ff1ec4

To unsubscribe from these emails, change your notification settings at https://github.com/oracle/dtrace/settings/notifications
