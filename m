Received: from out-24.smtp.github.com (out-24.smtp.github.com [192.30.252.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AE33AA195
	for <dtrace@lists.linux.dev>; Fri,  7 Aug 2026 01:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786066941; cv=none; b=dTmVqid3zactIZKJOC1ftvXW/NlNBbXHssLgoHdybnhWKxYHlWcMk4+rb9Wa3BCA2AuBQKsAMxBVGuZE6hEEE6NH8bTEWTwCxKvNJypWmo6u7Jyc4a5NPpe11UfYZvm6EUPN4/nKd6Bg4750dCF3BpXxNWqRL+wfWh8UeQ/Lw0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786066941; c=relaxed/simple;
	bh=DZtvAhmsp1nA3nFhLedUuso4mgv761VO2kSPIf7OhOs=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=nx8aSjG8W9OYUdxsZkeuhwV7dUKg09vMMSamTjkpA1+db+oSmHTWxwdb6SHJYePYKY2Htcz3dvHgbkD4Z9vBq/bfwOizkZzSxynbrMEz98pzZkKrTE3O+CZL4rxLKY/OVyU6hNCxhIxZuG7qA1QI5Ov/t6OFln+/EhFsvcR6lgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=T/eSbsKB; arc=none smtp.client-ip=192.30.252.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b="T/eSbsKB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1786066932;
	bh=Gqdayx8PAvaOFYWfVcMxLrNT/DkwacuRBwnQ+TOz8Kw=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=T/eSbsKBwMGPhEC0vvYbuYBo5gZ/9xBUYWJFfi0/ML53VUxqd0FeXLcLJ/7iiyjeE
	 hbKOavsemH1QzoL35b5SofUX0dYivoXwyfkmBIqhFgHsvL4Qjfb//cUXa1FvnaW67Y
	 ChALW9QrG72M4u6CbK8Y/XO5F2ypx0NLIaLgf7Zk=
Received: from github.com (hubbernetes-node-a4604df.ac4-iad.github.net [10.52.210.76])
	by smtp.github.com (Postfix) with ESMTPA id 20DEBA061D
	for <dtrace@lists.linux.dev>; Thu,  6 Aug 2026 18:42:12 -0700 (PDT)
Date: Thu, 06 Aug 2026 18:42:12 -0700
From: Kris Van Hees <noreply@github.com>
To: dtrace@lists.linux.dev
Message-ID: <oracle/dtrace/push/refs/heads/dev-queue/cfac68-30c9c2@github.com>
Subject: [oracle/dtrace] f208e7: llm: define dtrace skill for debugging
 workflows
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
  Commit: f208e7d23b6ce61c83e398c6e19a8b5909908068
      https://github.com/oracle/dtrace/commit/f208e7d23b6ce61c83e398c6e19a8b5909908068
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-08-07 (Fri, 07 Aug 2026)

  Changed paths:
    A llm/SKILL.md

  Log Message:
  -----------
  llm: define dtrace skill for debugging workflows

Add llm/SKILL.md as a reusable DTrace skill for agentic coding frameworks that support SKILLs.

Tune the skill for incident response, root-cause analysis, and latency triage.

Require complete runnable scripts and verification before final output to reduce user trial-and-error during investigations.

Signed-off-by: Greg Marsden <greg.marsden@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>


  Commit: 30c9c220f8e024707787d21a8db00c94cdd11796
      https://github.com/oracle/dtrace/commit/30c9c220f8e024707787d21a8db00c94cdd11796
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-08-07 (Fri, 07 Aug 2026)

  Changed paths:
    M llm/README.md

  Log Message:
  -----------
  llm: document skill usage for agentic coding frameworks

Update llm/README.md to describe how SKILL.md is used by an agentic coding framework capable of loading SKILLs.

Add a link explaining what SKILLs are and document the validation flow users can expect when scripts are generated.

Signed-off-by: Greg Marsden <greg.marsden@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>


Compare: https://github.com/oracle/dtrace/compare/cfac68647e44...30c9c220f8e0

To unsubscribe from these emails, change your notification settings at https://github.com/oracle/dtrace/settings/notifications
