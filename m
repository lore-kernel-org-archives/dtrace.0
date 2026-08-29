Received: from out-32.smtp.github.com (out-32.smtp.github.com [192.30.252.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E67481AA8
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 06:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787983594; cv=none; b=E+WM3XjVMk/CXQA2Z/FqmXHrev4eWHLBbR6bPgTP2uwnJ2e5FJCWhe+Lv7FF8Ei/9F3mWnutJfAZ6AK2ldLoqTScUtgm5pIiw13XvTqqv92NrwD0p7HBTK4qBPswPuvmJ0bPvbod7m/hHVzhfmwl5s0iMjFiwbpftY/11nUmac4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787983594; c=relaxed/simple;
	bh=/iALsPqDSGexcYq5c7GxIAJUhOF8/a7QvZngq28pb0M=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=NXtVDo/ju87W9TOZhKxyYLZNHdKhvTKwl6MQ32hNLm3weyAX2eIdMmBhRqIvWPqA9hHS7C3IvIG7cWmhR7BpRYWmkZ3OzTwqoS3QY0ffhJtFQb+hYwsdm4qDDQ58+a64Z/Ix6aS6yGsPDBQEyER60XmQxAv5b+S9C7jTzAlrsss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=htoKZ7OS; arc=none smtp.client-ip=192.30.252.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b="htoKZ7OS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1787983591;
	bh=HcdqPvike4FBtKiQESyZgBmtDnix4sNKHYqHAFEh8BI=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=htoKZ7OS+KIkmDW+b7N5NjEjvSJdAwErQDCXGwB3frKr6YICDKToCpsLPHkYfXpii
	 wjFFET1Jck+L2nQYUt1pZyleOLkQ+EIL41TowM1a3/b6YcZTO/bBnP3DTiMRsHoU3q
	 xWUtQZ+B10VE+AlJbxWJOJGME3NlTrfJK8LYqBOI=
Received: from github.com (hubbernetes-node-b3d75a7.ac4-iad.github.net [10.52.146.31])
	by smtp.github.com (Postfix) with ESMTPA id B2F5C321008
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 23:06:31 -0700 (PDT)
Date: Fri, 28 Aug 2026 23:06:31 -0700
From: Kris Van Hees <noreply@github.com>
To: dtrace@lists.linux.dev
Message-ID: <oracle/dtrace/push/refs/heads/dev-queue/5a8f9f-9ca231@github.com>
Subject: [oracle/dtrace] 7f1cb7: test: Adjust sync timing
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
  Commit: 7f1cb7139a6d1d35036e395acdcc67eb64308603
      https://github.com/oracle/dtrace/commit/7f1cb7139a6d1d35036e395acdcc67eb64308603
  Author: Eugene Loh <eugene.loh@oracle.com>
  Date:   2026-08-29 (Sat, 29 Aug 2026)

  Changed paths:
    M test/unittest/usdt/tst.defer-Z-basic.sh
    M test/unittest/usdt/tst.defer-Z.sh
    M test/unittest/usdt/tst.defer.sh
    M test/unittest/usdt/tst.nusdtprobes.sh

  Log Message:
  -----------
  test: Adjust sync timing

The nusdtprobes test was failing rather consistently on systems with
very large CPU counts.

The main problem was that dtrace programs with aggregations take a long
time to start up on such systems.  In particular, gmap_create_aggs()
tries to create an aggs_$cpu BPF map for each CPU, spending (in
measurements on one system) about 0.004 sec for each dt_bpf_map_create()
and 0.011 sec for each dt_bpf_map_update().  When there are hundreds of
CPUs, the time to start the job up increases by, for example, 5-6
seconds.  The test waits for dtrace to start up by checking "-e" on the
output file, but the aggs_$cpu delay occurs after the file is created.

Add a BEGIN clause to write to the output file.  Replace the "-e" test
with "-s".

The test has a sleep before starting a team of processes.  There is
perhaps no reason for this wait.  Nonetheless, we leave that sleep,
simply reducing the time to 1 second.

There is also a delay between launching processes and tracing them:

  x dtprobed sees newly launched processes rather quickly
  x dtrace tries discovery 1x/second
  x discovery is rather fast
  x starting a newly discovered probe is ~ 0.011sec (on one system)

For 40 probes, that last step is about 0.5 sec, but the total "sleep 3"
in the test before killing the new processes is apparently sufficient.

Make the corresponding "-e" to "-s" change in similar tests, even if
they have not shown the failure pattern.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>


  Commit: 8c5403644bd116b51db3539c587a948387282586
      https://github.com/oracle/dtrace/commit/8c5403644bd116b51db3539c587a948387282586
  Author: Eugene Loh <eugene.loh@oracle.com>
  Date:   2026-08-29 (Sat, 29 Aug 2026)

  Changed paths:
    M README.md
    M doc/tutorial/1.IntroducingDTrace.md
    M doc/tutorial/4.GoingFurtherWithDTrace.md
    M doc/userguide/explanation/dtrace-about.md
    M llm/README.md

  Log Message:
  -----------
  Update github repo name from dtrace-utils to dtrace

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>


  Commit: 1618fe8c0a0f98bf2c0e3bc339920478e231bfe8
      https://github.com/oracle/dtrace/commit/1618fe8c0a0f98bf2c0e3bc339920478e231bfe8
  Author: Eugene Loh <eugene.loh@oracle.com>
  Date:   2026-08-29 (Sat, 29 Aug 2026)

  Changed paths:
    M README
    M cmd/dtrace.8
    M doc/tutorial/1.IntroducingDTrace.md
    M doc/tutorial/2.TracingOperatingSystemBehavior.md
    M doc/tutorial/3.TracingUserSpaceApplications.md
    M dtprobed/dtprobed.8
    M libdtrace/dt_prov_io.c
    M libdtrace/dt_prov_profile.c
    M llm/llms-dtrace-complete.txt
    M llm/llms-dtrace-short.txt
    M test/unittest/options/tst.strip.sh

  Log Message:
  -----------
  Remove spurious references to Oracle

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>


  Commit: adeef481da07c12c009c568845bd25eb3cb30763
      https://github.com/oracle/dtrace/commit/adeef481da07c12c009c568845bd25eb3cb30763
  Author: Eugene Loh <eugene.loh@oracle.com>
  Date:   2026-08-29 (Sat, 29 Aug 2026)

  Changed paths:
    M doc/tutorial/1.IntroducingDTrace.md
    M doc/tutorial/2.TracingOperatingSystemBehavior.md
    M doc/tutorial/3.TracingUserSpaceApplications.md
    M doc/userguide/explanation/dtrace-components-and-terminology.md
    M doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md
    M doc/userguide/how-to/dtrace-howto-list-and-enable-probes.md
    M doc/userguide/how-to/dtrace-howto-use-predicates.md
    M doc/userguide/reference/aggregation.md
    M doc/userguide/reference/aggregation_stddev.md
    M doc/userguide/reference/aggregation_sum.md
    M doc/userguide/reference/d_program_syntax_reference_program_structure.md
    M doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
    M doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
    M doc/userguide/reference/dtrace-ref-StructsandUnions.md
    M doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
    M doc/userguide/reference/dtrace-ref-Variables.md
    M doc/userguide/reference/dtrace_providers_dtrace.md
    M doc/userguide/reference/dtrace_providers_fbt.md
    M doc/userguide/reference/dtrace_providers_io.md
    M doc/userguide/reference/dtrace_providers_proc.md
    M doc/userguide/reference/dtrace_providers_rawfbt.md
    M doc/userguide/reference/function_alloca.md
    M doc/userguide/reference/function_basename.md
    M doc/userguide/reference/function_bcopy.md
    M doc/userguide/reference/function_clear.md
    M doc/userguide/reference/function_denormalize.md
    M doc/userguide/reference/function_dirname.md
    M doc/userguide/reference/function_exit.md
    M doc/userguide/reference/function_ftruncate.md
    M doc/userguide/reference/function_index.md
    M doc/userguide/reference/function_inet_ntoa.md
    M doc/userguide/reference/function_lltostr.md
    M doc/userguide/reference/function_normalize.md
    M doc/userguide/reference/function_printa.md
    M doc/userguide/reference/function_printf.md
    M doc/userguide/reference/function_rand.md
    M doc/userguide/reference/function_rindex.md
    M doc/userguide/reference/function_strchr.md
    M doc/userguide/reference/function_strjoin.md
    M doc/userguide/reference/function_strlen.md
    M doc/userguide/reference/function_strrchr.md
    M doc/userguide/reference/function_strstr.md
    M doc/userguide/reference/function_strtok.md
    M doc/userguide/reference/function_substr.md
    M doc/userguide/reference/function_system.md
    M doc/userguide/reference/function_trace.md
    M doc/userguide/reference/function_tracemem.md
    M doc/userguide/reference/function_trunc.md

  Log Message:
  -----------
  docs: Include provider names in probe references

While probe descriptions can omit fields, implying wildcard matching,
best practice is probably to specify at least the provider.  This helps
reduce chances of unexpected ambiguity and can help DTrace find matching
probes more efficiently.

Change our documentation to employ and thereby illustrate this best
practice.

In descriptions of the FBT and raw FBT providers, make this point
explicitly, since typically an FBT probe would have a raw FBT
counterpart (and vice versa) and in all likelihood a user does not want
both.

Incidentally, in a runtime test of our test suite, there are only a few
cases where a probe description matches both FBT and raw FBT probes.
In test/unittest/, they are

test                                      probe description

dtrace-util/tst.ListProbesModuleClause.sh :vmlinux::
dtrace-util/tst.ListProbes.sh             :::
providers/rawfbt/tst.wildcard-provider.d  *fbt:vmlinux:do_sys_open*:entry
regression/tst.unload-reload-oops.sh      :::

These uses are perhaps reasonable for those tests.

A recent user bug report was due, at least in part, to the fbt/rawfbt
problem.

Orabug: 38931437
Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>


  Commit: 45ecaef5eb0e53cb6a5c70c4e0dd168880101da0
      https://github.com/oracle/dtrace/commit/45ecaef5eb0e53cb6a5c70c4e0dd168880101da0
  Author: Eugene Loh <eugene.loh@oracle.com>
  Date:   2026-08-29 (Sat, 29 Aug 2026)

  Changed paths:
    M test/unittest/aggs/tst.aggmod_full2.x

  Log Message:
  -----------
  test: Skip tst.aggmod_full2.sh

The test was only being run on older x86 systems, where it had been
failing consistently for a long time.  Since kernels are moving from
kallmodsyms to modules.builtin.ranges, we do not care much about such
problems.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>


  Commit: 821d91f960fa6890379e7573ec0408bd27dccd27
      https://github.com/oracle/dtrace/commit/821d91f960fa6890379e7573ec0408bd27dccd27
  Author: Eugene Loh <eugene.loh@oracle.com>
  Date:   2026-08-29 (Sat, 29 Aug 2026)

  Changed paths:
    M bpf/progenyof.S
    A test/unittest/funcs/tst.progenyof2.sh

  Log Message:
  -----------
  Fix progenyof to compare TGIDs

Switch the BPF progenyof helper to read TASK_TGID so it matches the
process IDs returned by ppid and expand the progenyof test to cover both
pid and ppid.  The original tst.progenyof.d only exercised probes in the
main DTrace thread where tid == tgid, so it never exposed the mismatch.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>


  Commit: ff071bf7255937f5a99a49bb67d92cfec581d1cd
      https://github.com/oracle/dtrace/commit/ff071bf7255937f5a99a49bb67d92cfec581d1cd
  Author: Eugene Loh <eugene.loh@oracle.com>
  Date:   2026-08-29 (Sat, 29 Aug 2026)

  Changed paths:
    M libdtrace/dt_consume.c
    R test/unittest/options/tst.F.aarch64.r
    R test/unittest/options/tst.F.d
    R test/unittest/options/tst.F.r.p
    R test/unittest/options/tst.F.x86_64.r
    R test/unittest/options/tst.flowindent.aarch64.r
    R test/unittest/options/tst.flowindent.d
    A test/unittest/options/tst.flowindent.r
    R test/unittest/options/tst.flowindent.r.p
    A test/unittest/options/tst.flowindent.sh
    R test/unittest/options/tst.flowindent.x86_64.r

  Log Message:
  -----------
  Fix flowindent for "return" probes with multiple statements

The flowindent algorithm should change indentation based only on the
number of levels of entry and return.  So, if an entry or return probe
has multiple statements, the indentation should change only for the
first statement.

Such logic is used for entry probes.  Similar logic should be used for
return probes.

Add a test to cover the case of multiple statements per entry and return
probes.  Also have it check a greater number of indentations.  Since
the new test supersedes the old ones, remove the old tests, which
were fickle anyhow.  The new test can still fail -- the flowindent
algorithm is not completely robust -- so allow reinvocation in case of
failure.  The intermittent failures of flowindent tests have long been a
testing irritant.  Now, with reinvocation, testing shows no failures in
100 iterations on over a dozen systems.

Orabug: 39140395
Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>


  Commit: 3dc196d92a7d8bbde27edb0b61ffc7dddfd395a2
      https://github.com/oracle/dtrace/commit/3dc196d92a7d8bbde27edb0b61ffc7dddfd395a2
  Author: Eugene Loh <eugene.loh@oracle.com>
  Date:   2026-08-29 (Sat, 29 Aug 2026)

  Changed paths:
    M libdtrace/dt_bpf.c

  Log Message:
  -----------
  Check if the BPF PROG_LOAD is either -1 or else non-negative

The return value is supposed to be -1 or non-negative.  The current
check lumps 0 with -1.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>


  Commit: 7a3e6f08b67856f7c5ebb71c37a59d7cdbffd0ec
      https://github.com/oracle/dtrace/commit/7a3e6f08b67856f7c5ebb71c37a59d7cdbffd0ec
  Author: Eugene Loh <eugene.loh@oracle.com>
  Date:   2026-08-29 (Sat, 29 Aug 2026)

  Changed paths:
    M libdtrace/dt_probe.h

  Log Message:
  -----------
  Simple typo in comment

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>


  Commit: 23b7104ba4988aeae921a7825212fc14e8074c28
      https://github.com/oracle/dtrace/commit/23b7104ba4988aeae921a7825212fc14e8074c28
  Author: Eugene Loh <eugene.loh@oracle.com>
  Date:   2026-08-29 (Sat, 29 Aug 2026)

  Changed paths:
    A test/unittest/scalars/err.D_SYNTAX.declare-init.d
    M test/unittest/scalars/err.D_SYNTAX.declare.d

  Log Message:
  -----------
  test: Check declaration (without init) inside a probe

We test that declaration (with init) of a variable inside a probe is not
allowed.

Check also that declaration without init inside a probe is also
forbidden.

The related test/unittest/probes/err.D_SYNTAX/err.D_SYNTAX.declare*.d
tests are left alone.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>


  Commit: d4ed9cb5fee9a0b3c70892a4bd22f7990cd31581
      https://github.com/oracle/dtrace/commit/d4ed9cb5fee9a0b3c70892a4bd22f7990cd31581
  Author: Eugene Loh <eugene.loh@oracle.com>
  Date:   2026-08-29 (Sat, 29 Aug 2026)

  Changed paths:
    M test/unittest/sched/tst.oncpu.d

  Log Message:
  -----------
  test: Remove unnecessary "destructive" pragma

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>


  Commit: 3d70db58cbaa4d2ef0529b00e39fe22419e56b01
      https://github.com/oracle/dtrace/commit/3d70db58cbaa4d2ef0529b00e39fe22419e56b01
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-08-29 (Sat, 29 Aug 2026)

  Changed paths:
    M bpf/GNUmakefile

  Log Message:
  -----------
  license: add overlooked license statement in bpf/GNUmakefile

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Eugene Loh <eugene.loh@oracle.com>


  Commit: d35acb7a65d3e2918e85df7acc84289136f9b440
      https://github.com/oracle/dtrace/commit/d35acb7a65d3e2918e85df7acc84289136f9b440
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-08-29 (Sat, 29 Aug 2026)

  Changed paths:
    M libdtrace/dt_module.c

  Log Message:
  -----------
  Fix typo in conditional

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


  Commit: ad6c070d405e7f50c2e74c5cb4d129797ae9a5d4
      https://github.com/oracle/dtrace/commit/ad6c070d405e7f50c2e74c5cb4d129797ae9a5d4
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-08-29 (Sat, 29 Aug 2026)

  Changed paths:
    M libdtrace/dt_provider.c

  Log Message:
  -----------
  provider: only call discover for the provider implementations

Since the discover() functionality is provided by the implementation
of a provider type rather than being specific to a provider, we only
need to loop over dt_providers[].  The discover hooks themselves should
take care of any newly discovered probes.

Suggested-by: Eugene Loh <eugene.loh@oracle.com>
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


  Commit: 9ca231baa8b761c3583aa70dd4a549148f2262ef
      https://github.com/oracle/dtrace/commit/9ca231baa8b761c3583aa70dd4a549148f2262ef
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-08-29 (Sat, 29 Aug 2026)

  Changed paths:
    M dtrace.spec

  Log Message:
  -----------
  spec: make dependency for fuse3 more strict

The runtime dependency should only be for the fuse3 libraries.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


Compare: https://github.com/oracle/dtrace/compare/5a8f9f419d9e...9ca231baa8b7

To unsubscribe from these emails, change your notification settings at https://github.com/oracle/dtrace/settings/notifications
