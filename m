Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BF140F721
	for <dtrace@lists.linux.dev>; Sun, 18 Oct 2026 07:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309585; cv=none; b=hPM1CkYpJxFkFB97WUKkxg4+9nwaVKm2w/utgUw4P8gnp/kw1c2EWeqha+koKMRlelDt4fNZwf/bur5zHMMq25fdeB+KW11xuzEDD/DEncjmwAg8biCSLcn5xT9oEtaVNCXZkV+G7zaaZZS0nbYdUIUlt1QmtKnY75MVD5JEvps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309585; c=relaxed/simple;
	bh=FcZjG2HNtyipcTIPLZJGgL9G/BFD+VtBrIFLos6SK5s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jgY/ykjqiHm4gcCQGm67YU95pcNioPpBx8BxS8fTEatzXo19KbeDvn0feFNRPGLMBDxZCScfjdNkzH+YEGIDe34TTqasxudo4Cw/F1jVISI8hXVqhA06qUfvo+v1/hzSKKxYiQ/Kf70HOb9gosrE8mRuZRs0OLCVRAVRpBTuXZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V9cr7PCR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V9cr7PCR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 278BAC2BCC7;
	Sun, 18 Oct 2026 07:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792309585;
	bh=FcZjG2HNtyipcTIPLZJGgL9G/BFD+VtBrIFLos6SK5s=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=V9cr7PCRarZqkg69LXICQMB3z2TJ9euLueY0YHc25yb2NLhBEGUCtCEc9WPNLW5iI
	 makNGzGCyGE2+uY9hRchrCfaJVW1yf7oKUcpfhBGgdQTg7FRpu2meg42UuoUyPv0VN
	 0IZZidi01RirEBGywQ1LbLBQ0WqJ9GpDDHL3ldYl1EA9kdtRFRA9LjzK5JEt8pX9cX
	 sul+MeutCiQlrVUsY9s3TxZ9e/fSYqAcqL/e3Ic4Qld9t84e5p7zyPcHk8sHpfDJ8Z
	 Zcyof/WTp0mdJ43mWGX8/H13CqENaCoLmOAaYB438CGkIz146szqx2/jWQH21xhjoq
	 MbV6686QTp+hw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 048C4CCA490;
	Sun, 18 Oct 2026 07:46:25 +0000 (UTC)
From: Eslam Almorshdy via B4 Relay <devnull+ealmorshdy.d-matrix.ai@kernel.org>
Subject: [PATCH 0/2] Fix pid probes on noninvasively grabbed processes
Date: Sun, 18 Oct 2026 07:46:08 +0000
Message-Id: <20261018-bug005-pid-noninvasive-names-v1-0-417b0f34f0b8@d-matrix.ai>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQqDMAwA0F+RnBdoRa3uV4aHVqPLYFEaLQPx3
 9fN47u8A5Qik8K9OCBSYuVFMuytgOHpZSbkMRtKUzbW2BbDPhtT48ojyiIsySsnQvFvUvRdF5r
 atc7ZCnKxRpr48+8f/WXdw4uG7XfCeX4Bt41IkIAAAAA=
X-Change-ID: 20261018-bug005-pid-noninvasive-names-a99b65787714
To: dtrace@lists.linux.dev
Cc: Alan Maguire <alan.maguire@oracle.com>, 
 Kris Van Hees <kris.van.hees@oracle.com>, dtrace-devel@oss.oracle.com, 
 Eugene Loh <eugene.loh@oracle.com>, Nick Alcock <nick.alcock@oracle.com>, 
 Eslam Almorshdy <ealmorshdy@d-matrix.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792309584; l=3627;
 i=ealmorshdy@d-matrix.ai; s=20261015; h=from:subject:message-id;
 bh=FcZjG2HNtyipcTIPLZJGgL9G/BFD+VtBrIFLos6SK5s=;
 b=XwUTStXMm8WtuegwoKHYAKCgl5fEisVAVbCA+QUHNyWMfkLfOAXpj2neXhCB9NLeyhNv0M8hL
 QTs2v+VVwdDB6OLFL4UQhgBt60s8NC6O/LTy4e5/Sg+65XaY2fLzptg
X-Developer-Key: i=ealmorshdy@d-matrix.ai; a=ed25519;
 pk=E4tVAIvp2rvz2CB7Re6YVMP6FiUVSxuq0TUtjGQL5NM=
X-Endpoint-Received: by B4 Relay for ealmorshdy@d-matrix.ai/20261015 with
 auth_id=1187
X-Original-From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
Reply-To: ealmorshdy@d-matrix.ai

dtrace cannot create pid probes on a running process when it runs as
root in a container without systemd and the process has no terminal:

  # dtrace -ln 'pid4242:a.out:main:entry'
  dtrace: invalid probe specifier pid4242:a.out:main:entry: failed to lookup 'main' in module 'a.out'

Since commit 4aec5c99 ("dt_pid: pid grabs should be shortlived"),
dtrace grabs a running process only briefly to create its pid probes,
and grabs it noninvasively, without ptrace(), if:

 - it is a system daemon.  Without systemd, Psystem_daemon() counts
   every root process without a terminal as one, as in the case above;
 - it is already being traced; or
 - dtrace may not ptrace() it.

On all such processes, pid$pid probes fail as above.  For system
daemons this is a regression: before 4aec5c99 they were grabbed
invasively, and the probes worked.

Naming the process ID in the probe, as above, is how the tutorial
lists a process's probes
(doc/tutorial/3.TracingUserSpaceApplications.md).  dtrace -p 4242
avoids the bug, because it grabs the process invasively for the whole
session, but only if dtrace may ptrace() the process.  For example, in
a container without CAP_SYS_PTRACE (Docker's default) on a host with
Yama ptrace_scope 1 (Ubuntu's default), dtrace may ptrace() only the
processes it starts.  There, -p fails on any process dtrace did not
start, and pid$pid probes work only with patch 1.

The cause is in libproc.  A noninvasive grab gets no object names from
ld.so, and libproc looks objects up only by those names.  Patch 1 falls
back to the file each object is mapped from; patch 2 adds a test.

This is likely the cause of the dozen failing pid tests that led Eugene
to propose reverting 4aec5c99 [1].  Nick traced them to the systemd
detection [2], fixed by commit 936f7e5a ("libproc: make
Psystem_daemon() detect modern systemd properly"), but they still fail
in the case above, where the harness's processes count as system
daemons.

Tested on devel 61fea621, as root in a container without systemd:

 - Twelve pid/ tests go from FAIL to PASS (args1, coverage, emptystack,
   float, fork, manypids, probemod, ret1, ret2, vfork, weak1, weak2),
   and pid/tst.gcc.d XPASSes.  pid/, proc/, ustack/ and profile-n/ show
   no other change, apart from proc/tst.*self-grab.sh, which time out
   intermittently on both builds.
 - The new test fails before patch 1 and passes after, also on
   dev-queue 0e93872f.  It also fails with only the object_to_map()
   change, or with only the Pobject_iter() and Plmid() ones.
 - With patch 1, a noninvasive grab lists the same 2137 pid$pid:::entry
   probes of a test program as an invasive one.
 - Invasive grabs (-c, -p, and pid$pid on a process that is not a
   daemon) list the same probes with and without patch 1.

[1] https://lore.kernel.org/dtrace/20250522181016.27661-1-eugene.loh@oracle.com/
[2] https://lore.kernel.org/dtrace/87wm9fd8km.fsf@esperi.org.uk/

---
Eslam Almorshdy (2):
      libproc: name objects by their mapped file when there is no link map
      test: add pid probe test for noninvasively grabbed processes

 libproc/Psymtab.c                    |  43 +++++++++++--
 test/unittest/pid/tst.noninvasive.r  |   1 +
 test/unittest/pid/tst.noninvasive.sh | 119 +++++++++++++++++++++++++++++++++++
 test/unittest/pid/tst.noninvasive.x  |  15 +++++
 4 files changed, 174 insertions(+), 4 deletions(-)
---
base-commit: 61fea621160ea4b6302874c62a723da105b44883
change-id: 20261018-bug005-pid-noninvasive-names-a99b65787714

Best regards,
--  
Eslam Almorshdy <ealmorshdy@d-matrix.ai>


