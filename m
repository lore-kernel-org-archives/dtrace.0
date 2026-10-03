Received: from out-42.smtp.github.com (out-42.smtp.github.com [192.30.252.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A832264AB
	for <dtrace@lists.linux.dev>; Sat,  3 Oct 2026 12:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791029942; cv=none; b=BarTa15snjbG1pIW7awuJjsP6tyPX7t2hQ4ugymE42uRidkb7HW1m7xGb38K0HIQB9ifqd9K32LRFUoXIPk2jEdEHqXrqC9Dq7PcA53TTGvYF6IhC+jMH/n6mhL8li99jqzXsWlC516+F33MQqfr3KmP9ExXm8w2Hzs97T/dKQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791029942; c=relaxed/simple;
	bh=ov3MaKFno30OolkMvImmuhFHI6KV2MyaFibZevFVLkE=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=Qb3dV5ob7Fi0CKkas39HFweKjVP3cYy+gKGkznqOmMB79WAE/ShP2PofimmKykVXFAmWLGsFGSfh6R3SCQQe+ld2dJ/+hM/lwWA/RqiJhz0w+0obvsA58ljpF9REyb48qv4L8y52gCe0L8z4UkQ46UNWU+WB6+Jea6vVq3GAgF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (2048-bit key) header.d=github.com header.i=@github.com header.b=MxwRCdDQ; arc=none smtp.client-ip=192.30.252.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=github.com header.i=@github.com header.b="MxwRCdDQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2026; t=1791029933;
	bh=ILklon13wXhd9gKwh45Kg2c2lZvsgVPVQM55+0KBG1Y=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=MxwRCdDQCES6JdTcMhvAhqGho1bkCCJmeQLV5UfP3vq1XhB1lGjUC7cytEIsd/3+w
	 GSgM1FgQRVLC72blJLMirnfTrG2ooUS9C7W8m6BpAnOmri5rv+lEsB/REquUwolque
	 MtjaFkCdb/O3H+H2EyIOFfLe4wQGHEbk7OTuq1AXAlmQHe1fjjNBF66f6MtyCkHj6y
	 loZq8SrgnKST8haztMbsR+NYnIzZVt+vkz2ra+8663DA5SDNK7oKcfC8mXPSKpxbhl
	 XYY8cuOLEK+2SzUghKxVoaYPfxBFFnTf4QvAA8q9pc8G3ajjYCMNcBM9EUFBlEsXxz
	 lVPHLRySjFiPw==
Received: from github.com (hubbernetes-node-5963a29.ash1-iad.github.net [10.56.203.17])
	by smtp.github.com (Postfix) with ESMTPA id 2B912840539
	for <dtrace@lists.linux.dev>; Sat,  3 Oct 2026 05:18:53 -0700 (PDT)
Date: Sat, 03 Oct 2026 05:18:53 -0700
From: Kris Van Hees <noreply@github.com>
To: dtrace@lists.linux.dev
Message-ID: <oracle/dtrace/push/refs/heads/dev-queue/a0a173-abdaf7@github.com>
Subject: [oracle/dtrace] 755595: list: add dt_list_empty()
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
  Commit: 75559544e123ec99c24ba07b1fa153e57d0663f4
      https://github.com/oracle/dtrace/commit/75559544e123ec99c24ba07b1fa153e57d0663f4
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-10-03 (Sat, 03 Oct 2026)

  Changed paths:
    M libcommon/dt_list.h

  Log Message:
  -----------
  list: add dt_list_empty()

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


  Commit: d2bd4d1e68539f245317d47b24dd05d21b679b88
      https://github.com/oracle/dtrace/commit/d2bd4d1e68539f245317d47b24dd05d21b679b88
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-10-03 (Sat, 03 Oct 2026)

  Changed paths:
    M libdtrace/dt_cc.c
    M libdtrace/dt_dlibs.c
    M libdtrace/dt_impl.h
    M libdtrace/dt_link.c
    M libdtrace/dt_module.c
    M libdtrace/dt_module.h
    M libdtrace/dt_open.c
    M libdtrace/dt_options.c

  Log Message:
  -----------
  module: add support for user module search paths

User modules can be uerspace libraries or executables.

Introducing this support requires a renaming of the previous dt_lib_path
to dt_dlib_path.

We also introduce a dt_module_sym_iter() function to iterate over all
symbols in a particular module.  This can be used in the future to add
function name globbing support to the probe specification for uprobe probes.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


  Commit: db30f2d05142d46c035860d81e64e3baf15849f5
      https://github.com/oracle/dtrace/commit/db30f2d05142d46c035860d81e64e3baf15849f5
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-10-03 (Sat, 03 Oct 2026)

  Changed paths:
    M libdtrace/dt_decl.c
    M libdtrace/dt_lex.l
    M libdtrace/dt_parser.c
    M libdtrace/dt_parser.h
    A test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d
    A test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r
    A test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d
    A test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r
    A test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d
    A test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.r
    A test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d
    A test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.r
    A test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.d
    A test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.r
    A test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.d
    A test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.r
    A test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.d
    A test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.r
    A test/unittest/lexer/err.D_SYNTAX.scope-empty-user.d
    A test/unittest/lexer/err.D_SYNTAX.scope-empty-user.r
    A test/unittest/lexer/err.D_SYNTAX.scope-empty.d
    A test/unittest/lexer/err.D_SYNTAX.scope-empty.r
    A test/unittest/lexer/err.D_SYNTAX.scope-multiple.d
    A test/unittest/lexer/err.D_SYNTAX.scope-multiple.r
    A test/unittest/lexer/err.D_SYNTAX.scope-triple.d
    A test/unittest/lexer/err.D_SYNTAX.scope-triple.r
    A test/unittest/lexer/tst.scope-user-explicit.d
    M test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d
    M test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.r
    A test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d
    A test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r
    A test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.d
    A test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.r
    A test/unittest/types/err.D_DECL_SCOPE.scopeop-member.d
    A test/unittest/types/err.D_DECL_SCOPE.scopeop-member.r

  Log Message:
  -----------
  parser: validate scoped external names

Centralize parsing of D scoping markers used by external type and symbol
references.  The helper now returns the resolved scope and identifier
pieces, supports kernel and userspace markers for both type and symbol
lookup, and rejects empty operands, runs longer than two backticks, and
repeated scoping markers as D_SYNTAX instead of falling through to lookup
failures.

Recognize dotted scoped identifiers as a single lexer token so module
names like foo.bar resolve as one external symbol reference.

Add lexer and type regression tests for malformed scoped identifiers,
dotted scopes, empty scope operands, scope-kind mismatches, and scoping
operators in declarations.  Update the sizeof unknown-symbol test to use
a non-empty symbol name.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


  Commit: bbaf5fb9183787f5f754a7ed737569841465d501
      https://github.com/oracle/dtrace/commit/bbaf5fb9183787f5f754a7ed737569841465d501
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-10-03 (Sat, 03 Oct 2026)

  Changed paths:
    M libdtrace/dt_decl.c
    A test/unittest/types/err.D_DECL_SCOPE.scopeop-enum-tag.d
    A test/unittest/types/err.D_DECL_SCOPE.scopeop-enum-tag.r
    A test/unittest/types/err.D_DECL_SCOPE.scopeop-struct-tag.d
    A test/unittest/types/err.D_DECL_SCOPE.scopeop-struct-tag.r
    A test/unittest/types/err.D_DECL_SCOPE.scopeop-union-tag.d
    A test/unittest/types/err.D_DECL_SCOPE.scopeop-union-tag.r

  Log Message:
  -----------
  parser: reject scoped type declarations

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


  Commit: d5ac1788fdd6f74ec85e090783506908cf546c95
      https://github.com/oracle/dtrace/commit/d5ac1788fdd6f74ec85e090783506908cf546c95
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-10-03 (Sat, 03 Oct 2026)

  Changed paths:
    M libdtrace/dt_module.c
    M libdtrace/dt_parser.c
    M test/triggers/Build
    M test/triggers/testprobe.c
    M test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r
    M test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r
    A test/unittest/lexer/err.D_IDENT_UNDEF.scope-kernel-as-user.d
    A test/unittest/lexer/err.D_IDENT_UNDEF.scope-kernel-as-user.r
    A test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-as-kernel.d
    A test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-as-kernel.r
    A test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-missing.d
    A test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-missing.r
    R test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d
    R test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.r
    R test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d
    R test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.r
    M test/unittest/lexer/tst.scope-user-explicit.d
    A test/unittest/lexer/tst.scope-user-explicit.r
    A test/unittest/lexer/tst.scope-user-path-empty.sh
    M test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r
    A test/unittest/types/tst.scope-user-dotted.r
    A test/unittest/types/tst.scope-user-dotted.sh
    A test/unittest/types/tst.scope-user-types.d
    A test/unittest/types/tst.scope-user-types.r

  Log Message:
  -----------
  parser: resolve explicitly scoped user objects

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


  Commit: b8710f1814fe84a723714bc71d0e6960c510db11
      https://github.com/oracle/dtrace/commit/b8710f1814fe84a723714bc71d0e6960c510db11
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-10-03 (Sat, 03 Oct 2026)

  Changed paths:
    M runtest.sh

  Log Message:
  -----------
  runtest: ignore BPF verification time differences

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


  Commit: cdb126c65b083013c40c03a34dbf4cf35600e2b2
      https://github.com/oracle/dtrace/commit/cdb126c65b083013c40c03a34dbf4cf35600e2b2
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-10-03 (Sat, 03 Oct 2026)

  Changed paths:
    M test/unittest/codegen/tst.kernel_read_deref_struct.d
    A test/unittest/codegen/tst.kernel_read_deref_struct.r.p
    M test/unittest/funcs/tst.subr.d
    A test/unittest/funcs/tst.subr.r

  Log Message:
  -----------
  test: improve kernel read and subroutine coverage

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


  Commit: abdaf712426741a6a38a809b8603ad4fd393b272
      https://github.com/oracle/dtrace/commit/abdaf712426741a6a38a809b8603ad4fd393b272
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-10-03 (Sat, 03 Oct 2026)

  Changed paths:
    M test/unittest/lexer/tst.keyword-member.d
    A test/unittest/lexer/tst.keyword-member.r
    A test/unittest/lexer/tst.keyword-member.r.p
    A test/unittest/types/err.D_CAST_INVAL.badcast.r
    A test/unittest/types/err.D_DECL_SCOPE.badenum.d
    A test/unittest/types/err.D_DECL_SCOPE.badstruct.d
    M test/unittest/types/err.D_SYNTAX.badenum.d
    M test/unittest/types/err.D_SYNTAX.badenum.r
    M test/unittest/types/err.D_SYNTAX.badid.d
    M test/unittest/types/err.D_SYNTAX.badstruct.d
    M test/unittest/types/err.D_SYNTAX.badstruct.r
    M test/unittest/types/err.unloaded_var.r

  Log Message:
  -----------
  test: add missing expectations and update diagnostics

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


Compare: https://github.com/oracle/dtrace/compare/a0a173ff1ec4...abdaf7124267

To unsubscribe from these emails, change your notification settings at https://github.com/oracle/dtrace/settings/notifications
