Received: from out-20.smtp.github.com (out-20.smtp.github.com [192.30.252.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D103822AA
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 17:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787939554; cv=none; b=eVuAyHGLOXLpKDo9fhw1Ibiafwp9EfhZLegdX29BY3kElmVCnCvic4aLu8nmPDI3NcWLwACE/w34pe/bp+RlvPaN0EuDjeLIudxb/giEx7HKr5AMh+meXB2hk57o+90kApkodBP0GP2Spd78BNSpwPjZy+LyeOnIlFmb+wFxksY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787939554; c=relaxed/simple;
	bh=RbtdVQn1dEr6s3CUt8JgRuqplwqk8L3NDTKZWTN/mpc=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=No2IIKwFEGXfUjMUOMTFKvDk/AsAFYa3iAiTCu5vgT3gjhYOnxdWWvkOAaZfY0DDvIGansgGZSkZRp4CfH235WaYp1AY+xImsmus5Rpl0o/WkpzRQXqfhaatQ2Z1Lba7aG6XxtvjREl8uFss4JR2LLsd8YrOuqgX6X0QMLkIr3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=JKbEoDfI; arc=none smtp.client-ip=192.30.252.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b="JKbEoDfI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1787939551;
	bh=lCK2zTZ94KfxyQyJ78RJkuO06dyc/wx+eeFBwOSvyes=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=JKbEoDfIsoo0LKQfasWbHv5F/VJg5Z4oLbBrMrfgZf2tuol0YIcYsY0mRjchcMIN5
	 WDCMIJcV/xmo57qt3SoWWLQ+AmzcXJfUwhE9/SssRZYxy9AuZVLt6RORp5unX/8yp8
	 dIdvBthwuCPlIHZaAuIjzElCUNBksk4ULueBN+qU=
Received: from github.com (hubbernetes-node-3c20572.va3-iad.github.net [10.48.70.78])
	by smtp.github.com (Postfix) with ESMTPA id B8044800A4B
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 10:52:31 -0700 (PDT)
Date: Fri, 28 Aug 2026 10:52:31 -0700
From: zhanxusheng1024-os <noreply@github.com>
To: dtrace@lists.linux.dev
Message-ID: <oracle/dtrace/push/refs/heads/devel/30c9c2-61fea6@github.com>
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

  Branch: refs/heads/devel
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
