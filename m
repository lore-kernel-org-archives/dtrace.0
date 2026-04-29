Received: from out-8.smtp.github.com (out-8.smtp.github.com [192.30.252.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4041E32D6
	for <dtrace@lists.linux.dev>; Wed, 29 Apr 2026 20:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777492885; cv=none; b=hwLY0G1Wrd/9mbD8dBtTXzJuGM4og4EYLI1upbJ/FF4CZQd91qTm1Qap6gPHSRNSn9BXTl5Sknf0fixncH7xsTNnPBjjgGxALNf9NK5nAet3KGoj8VEv9wmIiXCzZaLSelqEP7rqWpifk3GC/ZjrscypalPgQpjtDiZifOwKNeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777492885; c=relaxed/simple;
	bh=Zyvce1RjPYWVpsf9pvF0/pCXORJ+/VvqjOQ3iTyFYuM=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=fEUwH1h0Bp8Uub2qpF1j1Wzh18KwEfjk5JIPQSmYS9tO45mSWPsjHyLyTSwy+84rY2bwVYSm0PqIk4Pu8hvTjjR7qAZ9qEasy6abbBoE0IWBG3H78XHAd0YCqzTHhPv9FtGwDqjnYsqnW233XWZoMDtALo5LrqymODq0TgL1hf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=KF6RPo1m; arc=none smtp.client-ip=192.30.252.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b="KF6RPo1m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1777492883;
	bh=h9dX7U3bJWcg5FHTd1MxIdNRhwW/+XaxGiDmklmdE5k=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=KF6RPo1mtlj5GuzqgBSmboKylqixxoEoPZHsMvntA6dtrjVngCRNYlYOsOhYLGf94
	 XmNxG2L3XoEBbJ5ZRp58Tbf6Bmsf4ifOJ7YFOev25+f6DLr2ML3aP3zEkW/zKPwucJ
	 Wi4VTnjP2rZH7vc8jUtHOykLLTpLG48rKnHnV/ks=
Received: from github.com (hubbernetes-node-41dd4cd.va3-iad.github.net [10.48.221.100])
	by smtp.github.com (Postfix) with ESMTPA id 20081781128
	for <dtrace@lists.linux.dev>; Wed, 29 Apr 2026 13:01:23 -0700 (PDT)
Date: Wed, 29 Apr 2026 13:01:23 -0700
From: Kris Van Hees <noreply@github.com>
To: dtrace@lists.linux.dev
Message-ID: <oracle/dtrace/push/refs/heads/dev-queue/505124-d3fd10@github.com>
Subject: [oracle/dtrace] 47928b: uprobe: fix memory leak
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
  Commit: 47928b7beb2f1804577d3429754dacb7939bb18c
      https://github.com/oracle/dtrace/commit/47928b7beb2f1804577d3429754dacb7939bb18c
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-04-29 (Wed, 29 Apr 2026)

  Changed paths:
    M libdtrace/dt_prov_uprobe.c

  Log Message:
  -----------
  uprobe: fix memory leak

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>


  Commit: c99827553e77a127b2d94b55e2e6f356948190af
      https://github.com/oracle/dtrace/commit/c99827553e77a127b2d94b55e2e6f356948190af
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-04-29 (Wed, 29 Apr 2026)

  Changed paths:
    M libdtrace/dt_btf.c
    M libdtrace/dt_btf.h

  Log Message:
  -----------
  btf: btf argument to dt_btf_get_string() should be const

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>


  Commit: 47e40f1a1754a4562911cd9bc7e3ec78529d3b49
      https://github.com/oracle/dtrace/commit/47e40f1a1754a4562911cd9bc7e3ec78529d3b49
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-04-29 (Wed, 29 Apr 2026)

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


  Commit: d846ba88e5142d212fb13244a02e5311e904d58b
      https://github.com/oracle/dtrace/commit/d846ba88e5142d212fb13244a02e5311e904d58b
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-04-29 (Wed, 29 Apr 2026)

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


  Commit: 208b194ea51ac4bad2afeb218638b0df05f4ac64
      https://github.com/oracle/dtrace/commit/208b194ea51ac4bad2afeb218638b0df05f4ac64
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-04-29 (Wed, 29 Apr 2026)

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


  Commit: d3fd1018dc550b01dff15d90adad64c97d3fc616
      https://github.com/oracle/dtrace/commit/d3fd1018dc550b01dff15d90adad64c97d3fc616
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-04-29 (Wed, 29 Apr 2026)

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


Compare: https://github.com/oracle/dtrace/compare/5051249e1bd0...d3fd1018dc55

To unsubscribe from these emails, change your notification settings at https://github.com/oracle/dtrace/settings/notifications
