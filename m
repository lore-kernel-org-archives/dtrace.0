Received: from out-17.smtp.github.com (out-17.smtp.github.com [192.30.252.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22D035838A
	for <dtrace@lists.linux.dev>; Mon,  5 Oct 2026 10:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196482; cv=none; b=igKDC5l5tuFhIhNmpEqXmMvFgEtIUA7kNgMY5VA7cY2S3ApEDiQICFDCdtHT7tOfVrTUEBQXYKx1i3le0qCQbGfGcdixNno9QahBuywXk2CQEtQfnf0/g/nRJf40UpxkOhSuU1Sv2yUyo3Lf9tkX5jwZDrhhbVo3Grm5nO2+RKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196482; c=relaxed/simple;
	bh=wh3cNiadKlzbEQcloE7NlcCDte+5F3aByZYBA1THpl8=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=JFod95cF8iVZ6HEk14IBs7Mx9QzoPnPF6hC+s6aHEsJ1QN33iZ9AG/FyBamSyalezgxkn1+MqQcf58QrCm/tRVHmMWBCkZqyNerpJF/SKn4+5SaYLlAaJ+FZOL7OWeTHNAB1BdUCVdDxk3nKc8OvddHl7Gmw1SjXSQODrSN9B+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (2048-bit key) header.d=github.com header.i=@github.com header.b=Cvaau7pK; arc=none smtp.client-ip=192.30.252.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=github.com header.i=@github.com header.b="Cvaau7pK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2026; t=1791196479;
	bh=3z5JU1PEZ8o2e3gSZDsPQtq4+uE0OjPcYbbYRqWhX/o=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=Cvaau7pKz1U28F0Y9NqyP7G9uYk5VeTKElr6VzQUb/dsPe98Xnfw+S1vNNi3PJnJZ
	 vjd2l3yGBDTyHy7lVS7ZxxHBEIWQGjTqQDcEEkb9ACL91DUK8LnI6STwgHfG3b690k
	 5a0G8+Gpd9eF3zJIEzxGNGzxa9oC2yJRdYfSUSxoOrsGeIagUZxD+7WxmUct59gCF7
	 ec9fnHKscha4kSRTdY1NMwO8uf3qZOWyCLRjECPBtf9Wn/46nq1YXlXPhg0XpP4125
	 yB25Y2b4ue0TImxv4eJt7uXiYMePs1FB0KYikOBpBydEAer1pLBYn9fM2MG2ihCAif
	 JN1/lv3BZq9fg==
Received: from github.com (hubbernetes-node-2693f5d.va3-iad.github.net [10.48.181.37])
	by smtp.github.com (Postfix) with ESMTPA id 6F644501BCF
	for <dtrace@lists.linux.dev>; Mon,  5 Oct 2026 03:34:39 -0700 (PDT)
Date: Mon, 05 Oct 2026 03:34:39 -0700
From: Kris Van Hees <noreply@github.com>
To: dtrace@lists.linux.dev
Message-ID: <oracle/dtrace/push/refs/heads/dev-queue/db1c6d-0e9387@github.com>
Subject: [oracle/dtrace] 0cb64a: parser: validate scoped external names
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
  Commit: 0cb64a9a12e78514d7730da428d10b0c5bae05e3
      https://github.com/oracle/dtrace/commit/0cb64a9a12e78514d7730da428d10b0c5bae05e3
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-10-05 (Mon, 05 Oct 2026)

  Changed paths:
    M libdtrace/dt_decl.c
    M libdtrace/dt_lex.l
    M libdtrace/dt_module.c
    M libdtrace/dt_parser.c
    M libdtrace/dt_parser.h
    M test/triggers/Build
    M test/triggers/testprobe.c
    A test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d
    A test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r
    A test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d
    A test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r
    A test/unittest/lexer/err.D_IDENT_UNDEF.scope-kernel-as-user.d
    A test/unittest/lexer/err.D_IDENT_UNDEF.scope-kernel-as-user.r
    A test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-as-kernel.d
    A test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-as-kernel.r
    A test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-missing.d
    A test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-missing.r
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
    A test/unittest/lexer/tst.scope-user-explicit.r
    A test/unittest/lexer/tst.scope-user-path-empty.r
    A test/unittest/lexer/tst.scope-user-path-empty.sh
    M test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d
    M test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.r
    A test/unittest/types/err.D_DECL_SCOPE.scopeop-enum-tag.d
    A test/unittest/types/err.D_DECL_SCOPE.scopeop-enum-tag.r
    A test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d
    A test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r
    A test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.d
    A test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.r
    A test/unittest/types/err.D_DECL_SCOPE.scopeop-member.d
    A test/unittest/types/err.D_DECL_SCOPE.scopeop-member.r
    A test/unittest/types/err.D_DECL_SCOPE.scopeop-struct-tag.d
    A test/unittest/types/err.D_DECL_SCOPE.scopeop-struct-tag.r
    A test/unittest/types/err.D_DECL_SCOPE.scopeop-union-tag.d
    A test/unittest/types/err.D_DECL_SCOPE.scopeop-union-tag.r
    A test/unittest/types/tst.scope-user-dotted.r
    A test/unittest/types/tst.scope-user-dotted.sh
    A test/unittest/types/tst.scope-user-types.d
    A test/unittest/types/tst.scope-user-types.r

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

Reject scoped type declarations.

Resolve explicitly scoped user objects.

Add lexer and type regression tests for malformed scoped identifiers,
dotted scopes, empty scope operands, scope-kind mismatches, and scoping
operators in declarations.  Update the sizeof unknown-symbol test to use
a non-empty symbol name.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


  Commit: f12a2faafdb1356bd7339dd2096e543d9b853bf0
      https://github.com/oracle/dtrace/commit/f12a2faafdb1356bd7339dd2096e543d9b853bf0
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-10-05 (Mon, 05 Oct 2026)

  Changed paths:
    M runtest.sh

  Log Message:
  -----------
  runtest: ignore BPF verification time differences

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


  Commit: a56854b74f6fde002cf3aaf17f7774cb503ab8e6
      https://github.com/oracle/dtrace/commit/a56854b74f6fde002cf3aaf17f7774cb503ab8e6
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-10-05 (Mon, 05 Oct 2026)

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


  Commit: 0e93872ff976efb7e7da6d8062fb7eff150e9735
      https://github.com/oracle/dtrace/commit/0e93872ff976efb7e7da6d8062fb7eff150e9735
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-10-05 (Mon, 05 Oct 2026)

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


Compare: https://github.com/oracle/dtrace/compare/db1c6d2a46bc...0e93872ff976

To unsubscribe from these emails, change your notification settings at https://github.com/oracle/dtrace/settings/notifications
