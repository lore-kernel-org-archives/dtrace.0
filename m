Received: from out-18.smtp.github.com (out-18.smtp.github.com [192.30.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A823B47E2
	for <dtrace@lists.linux.dev>; Tue, 28 Apr 2026 21:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777412173; cv=none; b=RhGZzUgQTn/lRjo37/SkqExjgz0NvlT1rUau4L23BP21uzDQGrvsenDllaEWURquIOQITPbDzW5FkFEGc57GAZVrYqZ8qSpbCw4oVy3vvt8xesrla1iH3upHbNQNjjHZdBXqG7vnXpHq4EblZD+2yNttjY039O02ymkryYbUYWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777412173; c=relaxed/simple;
	bh=7tfywdYr9XUeussGAmSgiZyRyib8tY0z/enRJj35fl4=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=K0vul6X5QgN1JSnbwDBRGHQ3Uj6tkR8XRmKbOKGYlbrK13yLT7xgb127ksggOZGoYzKbLoovZB7krb8kz0jZZrFxXpN2y5DGn/JewNVEOMwH059XPYW7HTglWrdb73fSYk+V95UgwxGpqTpD6Gmu2+YtaB5Tb5pK3j3IDMI4yP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=T1wD4SEm; arc=none smtp.client-ip=192.30.252.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b="T1wD4SEm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1777412171;
	bh=eNLiR1V8Le4Ddn+f/LyW9J++L5gY7ol/ump8n5IQg2g=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=T1wD4SEmRmDFPh0Gk9C2YDn6TpnUKxxofEDuMfnzotGfSRmRHLd/bHolIv1Lfccws
	 5KleTEtGIFhZNXqOahKEgx0yuGCpISPhAS/nNy4A2TKsQ04T4Jok5LhdVZD8QPgOWE
	 1C9SlZ9wQmOX0ZCv+DH3QLdrza+dKL2M85dbsYes=
Received: from github.com (hubbernetes-node-333094a.va3-iad.github.net [10.48.209.71])
	by smtp.github.com (Postfix) with ESMTPA id B49D5181117
	for <dtrace@lists.linux.dev>; Tue, 28 Apr 2026 14:36:11 -0700 (PDT)
Date: Tue, 28 Apr 2026 14:36:11 -0700
From: Kris Van Hees <noreply@github.com>
To: dtrace@lists.linux.dev
Message-ID: <oracle/dtrace/push/refs/heads/dev-queue/a00035-505124@github.com>
Subject: [oracle/dtrace] 1b367f: uprobe: fix memory leak
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
  Commit: 1b367f0f0b601d5996a83d6be6c1f544f8b90f01
      https://github.com/oracle/dtrace/commit/1b367f0f0b601d5996a83d6be6c1f544f8b90f01
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-04-28 (Tue, 28 Apr 2026)

  Changed paths:
    M libdtrace/dt_prov_uprobe.c

  Log Message:
  -----------
  uprobe: fix memory leak

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>


  Commit: e6025d2758eaeeba5e5f2ece3b702bd3e077a0a7
      https://github.com/oracle/dtrace/commit/e6025d2758eaeeba5e5f2ece3b702bd3e077a0a7
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-04-28 (Tue, 28 Apr 2026)

  Changed paths:
    M libdtrace/dt_btf.c
    M libdtrace/dt_btf.h

  Log Message:
  -----------
  btf: btf argument to dt_btf_get_string() should be const

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>


  Commit: 3988539235df2ed9364115704dfb6e40d021b310
      https://github.com/oracle/dtrace/commit/3988539235df2ed9364115704dfb6e40d021b310
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-04-28 (Tue, 28 Apr 2026)

  Changed paths:
    M libdtrace/dt_btf.c

  Log Message:
  -----------
  btf: use dt_btf_real_type_by_id() to resolve types

Functions that need to check type data operate on the real type rather
than a typedef or a type with modifiers.  Similarly, when a type of a
function is needed, the prototype (BTF type BTF_KIND_PROTO) is what is
really needed.

Introducing dt_btf_real_type_by_id() removed duplication of code in other
functions.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>


  Commit: 76fef5fa3ad26cd49bfdf44ceb3340d7786b3de1
      https://github.com/oracle/dtrace/commit/76fef5fa3ad26cd49bfdf44ceb3340d7786b3de1
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-04-28 (Tue, 28 Apr 2026)

  Changed paths:
    M libdtrace/dt_btf.c
    M libdtrace/dt_btf.h

  Log Message:
  -----------
  btf: add dt_btf_func_is_traceable()

Add a function to determine whether a function (given by BTF id) can be
traced using BPF fentry/fexit probes.  It implements checks inspired by
btf_distill_func_proto() in kernel/bpf/btf.c.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>


  Commit: 3cb31b76656452927ada5b1e1d135887e78857ac
      https://github.com/oracle/dtrace/commit/3cb31b76656452927ada5b1e1d135887e78857ac
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-04-28 (Tue, 28 Apr 2026)

  Changed paths:
    M libdtrace/dt_prov_fbt.c

  Log Message:
  -----------
  fbt: do not provide untraceable functions (for fprobes)

Ensure that we do not provide FBT probes for functions that cannot be
probed using BPF fentry/fexit probes if fprobes are the default.

The provide_probe() function now takes a dt_module_t argument so that
dt_btf_func_is_traceable() can be called.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>


  Commit: 5051249e1bd0553d17eacd1ae486775a62c51ebd
      https://github.com/oracle/dtrace/commit/5051249e1bd0553d17eacd1ae486775a62c51ebd
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-04-28 (Tue, 28 Apr 2026)

  Changed paths:
    M libdtrace/dt_prov_fbt.c
    A test/unittest/codegen/tst.fbt-return.d
    A test/unittest/codegen/tst.fbt-return.r

  Log Message:
  -----------
  fbt: retrieve function return value using helper

We were causing BPF verifier errors when trying to access the return value
of some functions due to incorrect calculation of the offset to read from.
Rather than implementing the more complex logic needed to calculate the
proper offset of the return value, we can just use the bpf_get_func_ret()
BPF helper.  This does not impose a performance decrease because that
helper gets inlined by the BPF verifier.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>


Compare: https://github.com/oracle/dtrace/compare/a000357c8746...5051249e1bd0

To unsubscribe from these emails, change your notification settings at https://github.com/oracle/dtrace/settings/notifications
