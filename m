Received: from out-25.smtp.github.com (out-25.smtp.github.com [192.30.252.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5551718DF80
	for <dtrace@lists.linux.dev>; Fri, 11 Sep 2026 01:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789089830; cv=none; b=uq1JJdZnnBOht7VXrpvhXgTwomVySjZF/bLNIpYY3hPPgXK20HrdjnTVnoY53avOn/bRG1yiR/QHiekqofKHQYw8YtQqEKkZhxGBoYKQNJgf/2BXrcvFC56YOwfNEn6fCYVxuCZNkWoCJo9xMkR4FL8YWZYqAFD8hGWV9olPTUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789089830; c=relaxed/simple;
	bh=3rYEfUc/b9c6Kb46p54wVTOvfGr0RpHHXEtRMWM7I1o=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=h7cF4UAGW6irstyQTKDY/EgxhktkfbmS5QTdZAfwYWO2uCof+X8tHgQI1s6Ut8dpuF3G7S8VJvVxxE3ngaWpsk6vA+h/KGAo8YcgVYkOZAC9J0+3YkoU8LS2kkgyo5Gn5AZHCXIx9j76Ydd8tCy9250/UFzO43PA0PQ7hK8C3jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=Orv66yiN; arc=none smtp.client-ip=192.30.252.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b="Orv66yiN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1789089827;
	bh=RhOHZ3Ivq7UG82awiISnIx81AL6VOtf5dcfiGoTwxD0=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=Orv66yiNvodJ7O2eo8pXo1DivdcrMJ8wtrwWm4dU4XkEM9fGf8F3F8QxDSPtIkP/l
	 0SJQ7wsa6SQ+nb6c7Z+Gbna+Egm8j6ntrXLqiRsdwLLZ8EfszisCCcV+D53do1+eXJ
	 188EBDlg/02X7gMTijfvbmFtEbh6M4g4CSt02bLg=
Received: from github.com (hubbernetes-node-4b04ac8.ash1-iad.github.net [10.56.170.10])
	by smtp.github.com (Postfix) with ESMTPA id E3563600327
	for <dtrace@lists.linux.dev>; Thu, 10 Sep 2026 18:23:47 -0700 (PDT)
Date: Thu, 10 Sep 2026 18:23:47 -0700
From: Kris Van Hees <noreply@github.com>
To: dtrace@lists.linux.dev
Message-ID: <oracle/dtrace/push/refs/heads/dev-queue/9ca231-02f587@github.com>
Subject: [oracle/dtrace] c49fb3: dtprobed: reject oversized DOF consistently
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
  Commit: c49fb3015d8128a51b76879e3424c05be1430ba9
      https://github.com/oracle/dtrace/commit/c49fb3015d8128a51b76879e3424c05be1430ba9
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-09-10 (Thu, 10 Sep 2026)

  Changed paths:
    M dtprobed/dtprobed.c
    M libcommon/usdt_parser.c
    M libcommon/usdt_parser.h

  Log Message:
  -----------
  dtprobed: reject oversized DOF consistently

The dtprobed ioctl handler warned when helper DOF exceeded the parser
limit, but still attempted to allocate and copy it.  Share DOF_MAXSZ with
the parser and fail the ioctl when dofh_loadsz is too large, so both paths
enforce the same 256MB limit.

Orabug: 39351859
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


  Commit: 3b277fa0f00e91bee974e5467e56c4f31b0045e4
      https://github.com/oracle/dtrace/commit/3b277fa0f00e91bee974e5467e56c4f31b0045e4
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-09-10 (Thu, 10 Sep 2026)

  Changed paths:
    M include/dtrace/pid.h
    M libcommon/usdt_parser.h
    M libcommon/usdt_parser_dof.c
    M libcommon/usdt_parser_notes.c
    M libdtrace/dt_pid.c

  Log Message:
  -----------
  usdt_parser: harden DOF and note bounds checks

Validate DOF section metadata before use, require ELF note strings to
terminate within their declared payloads, and check parsed DOF record
sizes before DTrace consumes them.  This keeps malformed parser input
or stash data from driving out-of-bounds reads in either the parser or
the host.

Orabug: 39352038
Orabug: 39352051
Orabug: 39351967
CVE: CVE-2026-46831
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Alan Maguire <alan.maguire@oracle.com>


  Commit: bad46118485ef4340f729dff49c3743910c5a488
      https://github.com/oracle/dtrace/commit/bad46118485ef4340f729dff49c3743910c5a488
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-09-10 (Thu, 10 Sep 2026)

  Changed paths:
    M dtprobed/dtprobed.c
    M libcommon/usdt_parser.c
    M libcommon/usdt_parser.h
    M libcommon/usdt_parser_host.c

  Log Message:
  -----------
  usdt_parser: fix parser pipe I/O error handling

Use ssize_t for read() and write() return values, return negative errno
from usdt_parser_write_one() to match its callers, and cap the reply
size advertised by the jailed parser before allocating host memory.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Alan Maguire <alan.maguire@oracle.com>


  Commit: 223c7707f651fe7efe00bd47631f412988b26fd0
      https://github.com/oracle/dtrace/commit/223c7707f651fe7efe00bd47631f412988b26fd0
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-09-10 (Thu, 10 Sep 2026)

  Changed paths:
    M dtprobed/dof_stash.c
    M dtprobed/dof_stash.h
    M dtprobed/dtprobed.c

  Log Message:
  -----------
  dtprobed: harden helper ioctl validation

Reject unterminated fixed-size module names and module names that would
be unsafe as pathname components before using helper data.  Reuse the same
component-safety predicate used when composing probe specs, and handle
userdata allocation failure before dereferencing it.

Orabug: 39374493
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Alan Maguire <alan.maguire@oracle.com>


  Commit: dd64a2a8cc1597d94ee5d4d1e0bdb5c8b2ca7477
      https://github.com/oracle/dtrace/commit/dd64a2a8cc1597d94ee5d4d1e0bdb5c8b2ca7477
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-09-10 (Thu, 10 Sep 2026)

  Changed paths:
    M dtprobed/dof_stash.c

  Log Message:
  -----------
  dtprobed: fix dof_stash resource cleanup

Close descriptors and release parsed buffers on every path when scanning
and reparsing the DOF stash.  Treat any non-negative openat() return as
success, clean up exec-mapping and raw-data reads through common error
paths, and avoid leaking mapping descriptors when reparsing can be
skipped.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Alan Maguire <alan.maguire@oracle.com>


  Commit: ae60f39af6e63198c21772281323004bbfa8e2cc
      https://github.com/oracle/dtrace/commit/ae60f39af6e63198c21772281323004bbfa8e2cc
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-09-10 (Thu, 10 Sep 2026)

  Changed paths:
    M dtprobed/dof_stash.c

  Log Message:
  -----------
  dtprobed: fix dof_stash write failure handling

Use ssize_t for write() results, retry interrupted writes without treating
the negative length as progress, and unwind through the provider-close
path if writing parsed DOF fails.  Replace the no-op assert(1) in the
corrupt-state path with abort().

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Alan Maguire <alan.maguire@oracle.com>


  Commit: 1e4146880d7c2a6bf272e247eb9275a9f1fe0a38
      https://github.com/oracle/dtrace/commit/1e4146880d7c2a6bf272e247eb9275a9f1fe0a38
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-09-10 (Thu, 10 Sep 2026)

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
    A dists/debian/patches/debian-fix-sed-path.patch
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


  Commit: 02f587384320e4d28c6c2fd460d77a1645a4974c
      https://github.com/oracle/dtrace/commit/02f587384320e4d28c6c2fd460d77a1645a4974c
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-09-10 (Thu, 10 Sep 2026)

  Changed paths:
    M dists/debian/changelog
    M dists/debian/control
    A dists/debian/patches/debian-static-linking.patch
    A dists/debian/patches/debian-surpress-utsname-in-note.patch
    M dists/debian/patches/series

  Log Message:
  -----------
  debian: add distribution specific patches

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


Compare: https://github.com/oracle/dtrace/compare/9ca231baa8b7...02f587384320

To unsubscribe from these emails, change your notification settings at https://github.com/oracle/dtrace/settings/notifications
