Received: from out-2.smtp.github.com (out-2.smtp.github.com [192.30.252.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A944D3783AC
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787946686; cv=none; b=WPOu3L7BVrM/J+dh5LHtAPRbXuL4wdyXOxOdqG7Yc+8NJwv7xuY0ympkbE32t75Eus8EamGynkOtuLeV2MQ/f2YJEOU0elbpcVKqSGgpdJbQgLqr7NQkzocFMqpqdWAxYmHzKLARNsD4qo25mFk8eXT2r+muoTWOE0SpJOCw8Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787946686; c=relaxed/simple;
	bh=JZubXo3VA0IVZGZGdCwsjy1bJDijWVd5sCobgGiY1QE=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=sGZQhDiYG9ltUabIWd/+FcbKCgcYi4uCeKAquwunxCfYAn55rvoY3CsfmsdpvxUOEPaP3A/cd8ik5nB8rSBnuqGU42SF1pw5L6ddzRnj/TsC+wBmszmwhzS/Tz56KPK4cOHeQsYWh9zq0yg3gRBkP4CJZy9oaHcGy3F0drDj+QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=Un6/epCJ; arc=none smtp.client-ip=192.30.252.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b="Un6/epCJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1787946683;
	bh=/dZjGzPO1L84C3gaNLt/dtEJfWBuVU1PkhSr9Qeu6bU=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=Un6/epCJk+RzkcB53l70bYtkJZybFqVmg+hIyzC/F7uceUONPSSfEdSsnGOZbegy3
	 pLoMcDguB8uY8qMiNTlrZhlOvyzK5JJx+u6/fUOsV+StX5AO4XYt/AZ1FeVUpDExZn
	 zVWoF4WX8gI1RiFvqVLu2KykordT1CKQI6oUkpq0=
Received: from github.com (hubbernetes-node-f05184b.va3-iad.github.net [10.48.66.56])
	by smtp.github.com (Postfix) with ESMTPA id 68EB9341215
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 12:51:23 -0700 (PDT)
Date: Fri, 28 Aug 2026 12:51:23 -0700
From: Kris Van Hees <noreply@github.com>
To: dtrace@lists.linux.dev
Message-ID: <oracle/dtrace/push/refs/heads/dev-queue/61fea6-5a8f9f@github.com>
Subject: [oracle/dtrace] 2a10b8: libdtrace: resolve BTF type tags when
 importing BT...
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
  Commit: 2a10b8325f5d0c088ed895855fcef54148d0fe38
      https://github.com/oracle/dtrace/commit/2a10b8325f5d0c088ed895855fcef54148d0fe38
  Author: Jacob Carlborg <doob@me.com>
  Date:   2026-08-28 (Fri, 28 Aug 2026)

  Changed paths:
    M libdtrace/dt_btf.c

  Log Message:
  -----------
  libdtrace: resolve BTF type tags when importing BTF into CTF

Without this fix, running any DTrace commands results in:

```
dtrace: invalid probe specifier ::::
"/usr/lib64/dtrace/6.12.0/procfs.d", line 131: operator -> cannot be
applied to pointer to type "void"; must be applied to a struct or
union pointer
```

The issue occurs on kernels which have BTF with type tags. The fix is
to treat `BTF_KIND_TYPE_TAG` as a transparent modifier, resolving
straight to `type->type`.

Signed-off-by: Jacob Carlborg <doob@me.com>
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>


  Commit: a4130f975ba04156acbf94a41e7891665191011e
      https://github.com/oracle/dtrace/commit/a4130f975ba04156acbf94a41e7891665191011e
  Author: Jacob Carlborg <doob@me.com>
  Date:   2026-08-28 (Fri, 28 Aug 2026)

  Changed paths:
    M libdtrace/io.d.in

  Log Message:
  -----------
  libdtrace: derive io provider dev_name from the device model

Without this fix, running any DTrace commands, like `dtrace -l`,
results in:

```
dtrace: invalid probe specifier :::: "/usr/lib64/dtrace/6.12.0/io.d",
line 134: failed to resolve vmlinux`major_names: Unknown symbol name
```

The issue is that on newer kernels the `major_names` symbols is not
available in `kallsyms` anymore. For example, running `grep -w
major_names /proc/kallsyms` on a newer kernel shows no results.
Running the same command on an older kernel gives the following
result:

```
$ grep -w major_names /proc/kallsyms
0000000000000000 b major_names
```

The fix is to stop depending on the `major_names` symbol and instead
derive `dev_name` from the device model (the driver name), mirroring
the `struct buffer_head` translator.

Signed-off-by: Jacob Carlborg <doob@me.com>
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>


  Commit: 4c4f4eec9b3a0e5147a3beab07556870e1036714
      https://github.com/oracle/dtrace/commit/4c4f4eec9b3a0e5147a3beab07556870e1036714
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-08-28 (Fri, 28 Aug 2026)

  Changed paths:
    M libdtrace/dt_impl.h
    M libdtrace/dt_open.c

  Log Message:
  -----------
  libdtrace: determine (and store) non-initial PID namespace dev/ino

If dtrace is executing in a non-initial PID namespace, record the dev/ino
pair to identify it.  This can be used when performing pid/tgid lookups.

Suggested-by: Jacob Carlborg <doob@me.com>
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>


  Commit: 3ccaaa2b58ddc9c278e1e7869cc4b9f0b511410b
      https://github.com/oracle/dtrace/commit/3ccaaa2b58ddc9c278e1e7869cc4b9f0b511410b
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-08-28 (Fri, 28 Aug 2026)

  Changed paths:
    M libdtrace/dt_cg.c
    M libdtrace/dt_cg.h

  Log Message:
  -----------
  cg: provide function to retrieve pid and tgid in a PID ns agnostic way

The dt_cg_ns_pid_tgid() function automatically selects the correct BPF
helper to get the proper pid and tgid values relative to the current
PID namespace, and stores them in %r0 using the standard BPF convention:
(tgid << 32) | pid

Suggested-by: Jacob Carlborg <doob@me.com>
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>


  Commit: 9361e7f00bb6f2a253800379c519ce16f5545eb4
      https://github.com/oracle/dtrace/commit/9361e7f00bb6f2a253800379c519ce16f5545eb4
  Author: Jacob Carlborg <doob@me.com>
  Date:   2026-08-28 (Fri, 28 Aug 2026)

  Changed paths:
    M libdtrace/dt_prov_dtrace.c

  Log Message:
  -----------
  libdtrace: match BEGIN/END PID in the tracer's own PID namespace

Without this fix, running any probe hangs with no output,
like `dtrace -n 'BEGIN { trace("hi"); exit(0); }'`.

The issues is that the `BEGIN/END` probes are implemented as uprobes
on DTrace's own `BEGIN_probe()/END_probe()` functions in `dt_work.c`.
`bpf_get_current_pid_tgid()` reports the TGID in the initial PID
namespace, which does not match `getpid()` when DTrace runs inside a
PID namespace. Using the `--pid=host` flag when running OrbStack does
not help, because it shares the daemon's namespace, not the kernel
init namespace. OrbStack's own supervisor runs in a nested PID
namespace. On bare metal `--pid=host` does reach the init namespaces
and the bug wouldn't appear.

This fix is when DTrace is in a non-initial PID namespace and the
kernel is at least 5.7, use `bpf_get_ns_current_pid_tgid` instead of
`bpf_get_current_pid_tgid`. `bpf_get_ns_current_pid_tgid` is
namespace aware.

Signed-off-by: Jacob Carlborg <doob@me.com>
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>


  Commit: 1f5618797948616c6f45a9c003b5d70d702d1c73
      https://github.com/oracle/dtrace/commit/1f5618797948616c6f45a9c003b5d70d702d1c73
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-08-28 (Fri, 28 Aug 2026)

  Changed paths:
    A test/unittest/pidns/common.bash
    A test/unittest/pidns/test.x
    A test/unittest/pidns/tst.begin.sh
    A test/unittest/pidns/tst.concurrent.sh
    A test/unittest/pidns/tst.disasm-helper.sh
    A test/unittest/pidns/tst.end.sh
    A test/unittest/pidns/tst.io-dev-name.sh
    A test/unittest/pidns/tst.io-dev-name.x
    A test/unittest/pidns/tst.proc-create.sh

  Log Message:
  -----------
  test: add PID namespace support tests

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>


  Commit: 5a8f9f419d9e8cb89bc778b0ef68e4f5f8e54f4c
      https://github.com/oracle/dtrace/commit/5a8f9f419d9e8cb89bc778b0ef68e4f5f8e54f4c
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-08-28 (Fri, 28 Aug 2026)

  Changed paths:
    M bpf/Build
    A bpf/bvar_ns.c
    M libdtrace/dt_bpf.c
    M libdtrace/dt_cg.c
    M libdtrace/dt_state.h
    A test/unittest/pidns/tst.builtinvar-tid-pid.sh

  Log Message:
  -----------
  bpf: make the PID ns dev/ino pair available to runtime BPF code

BPF code in generated probe programs needs to retrieve PID and TGID
values in a PID ns aware manner if drace is running in a non-initial
PID namespace.

Provide support for PID ns aware pid and tid built-in variable.

Suggested-by: Jacob Carlborg <doob@me.com>
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>


Compare: https://github.com/oracle/dtrace/compare/61fea621160e...5a8f9f419d9e

To unsubscribe from these emails, change your notification settings at https://github.com/oracle/dtrace/settings/notifications
