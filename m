Received: from out-37.smtp.github.com (out-37.smtp.github.com [192.30.252.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31768381EB9
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 17:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787939553; cv=none; b=DxConryTsf6nj5KHHny9d+egewbRusM8akF2rDVD5X4f8RG3nn4r0ayIlWwCRPFzuceDUjlTe8V9MYTJ5GHbzNJblRU0jqThucNfhxS6GRR7I9Es6mU+u6UehnLuVa3MmKH4lD8sOoq6qjv7GdBo6EIpLqUtyAI/S9leytfU7dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787939553; c=relaxed/simple;
	bh=vsYJmmXrWKByaKH7tIQfVHgBNzo3QRxKz9MkDXHf7P0=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=KOlFFYXVwZUiJ+SEQOlgIT7t7uJN3ZxHHSWXNZnVbcBucsOxKgmM/fqIn4OOu1pPleobsp5ZIWmA5qljtwHEZeIBgeu4duxyWjWRjlf+8yYmZoGDqJSg5F8GCdSh91GM4jLvvTjTqN0XF/yp7yZRddoLVyPkYT7Tfp9Rd8fldmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=FpBdcEa1; arc=none smtp.client-ip=192.30.252.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b="FpBdcEa1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1787939551;
	bh=bdMEa0ESCqQz0tKRRb+sHRN9LRm0n670f+22qnzPev0=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=FpBdcEa1cysTKhoXqmhUJaF5orVBsdUAp5E3TJMI+gZFXS0Sq1fETsE5JN+yray5L
	 AZqTrgUpEX3yMjnFZYQfZdHROc4UJlJRgcr3bDFj++iHNSendS7+t3XmQwaNy745xC
	 v33TFgEVks+L6doxGcfxhePD6aHYyfKMITWeqV7Y=
Received: from github.com (hubbernetes-node-a014928.ash1-iad.github.net [10.59.96.28])
	by smtp.github.com (Postfix) with ESMTPA id 39D7D9203ED
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 10:52:31 -0700 (PDT)
Date: Fri, 28 Aug 2026 10:52:31 -0700
From: zhanxusheng1024-os <noreply@github.com>
To: dtrace@lists.linux.dev
Message-ID: <oracle/dtrace/push/refs/heads/dev-queue/30c9c2-61fea6@github.com>
Subject: [oracle/dtrace] 61fea6: llm: fix newline escape in the SKILL.md
 script ske...
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
  Commit: 61fea621160ea4b6302874c62a723da105b44883
      https://github.com/oracle/dtrace/commit/61fea621160ea4b6302874c62a723da105b44883
  Author: Zhan Xusheng <zhanxusheng1024@gmail.com>
  Date:   2026-08-28 (Fri, 28 Aug 2026)

  Changed paths:
    M llm/SKILL.md

  Log Message:
  -----------
  llm: fix newline escape in the SKILL.md script skeleton

The skeleton's BEGIN and ERROR clauses use "\\n" where "\n" is meant.
In a D string literal that is an escaped backslash followed by 'n', so
printf() emits a stray backslash instead of a newline.

Agents copy the skeleton verbatim, and "\\n" is a valid literal, so the
'dtrace -e' check prescribed in the same file does not catch it.

Every other D snippet in the tree uses a single backslash.

Assisted-by: Kiro:claude-opus-4.8
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>



To unsubscribe from these emails, change your notification settings at https://github.com/oracle/dtrace/settings/notifications
