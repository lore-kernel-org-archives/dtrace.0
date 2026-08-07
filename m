Received: from out-17.smtp.github.com (out-17.smtp.github.com [192.30.252.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944763346A5
	for <dtrace@lists.linux.dev>; Fri,  7 Aug 2026 01:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786066938; cv=none; b=hxbB2/hypXXm6YZFNs/spmHgMxOoiacx2NSP8q+QopSsGbGFriBbqusL5znUugbtqjlfwJ/C6QBqDPvNGGE3IA6mLY90REm4MwMr5J7/pEdzb3fpUgRc9AHy9qtBWXQ2UlqKSOavUMgECsUY9d3afiWj49aB40F5UJNagYpZuHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786066938; c=relaxed/simple;
	bh=UEF/u0iijXi5bY3Z711zEO9BUBh7LaR4j0ZZNojBtgE=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=OHsI3tGOwDS9YggEr4LyLbuv7XR0MaYhdOYxdcOBBoJmVqP5Ga9OMmnXjp+NuBs/eXrPhyQGV3l/SfArENaYnt1BMNs+obxvXkL29AeKGhD6Gd1ukCj9eck9pU+5spuWsVDuJvIl+ZhGxeIGM8/TWECHKFMosE21meSv9hR/SfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=Zcfu+MwY; arc=none smtp.client-ip=192.30.252.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b="Zcfu+MwY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1786066931;
	bh=Wo143TO3XLdRMM0X6UnuOmqoiL3p6pePvZ0fsBOWmT8=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=Zcfu+MwYe6QLFOuKAZNL794Mp+8eTLv5eBDgmD0TcF+i8EFlclHeiETp47gJjCBjE
	 O9VEyHqZSfOKBLkI/ZMLJCXX9Oz9lfjqW0w9CRaeYfu5puXp2tdm74/ET4jfYAf49d
	 I0hj0YivaaIrkws9VlbESmWtBFIWQAur1Ee6lgas=
Received: from github.com (hubbernetes-node-e3e0d87.va3-iad.github.net [10.48.65.96])
	by smtp.github.com (Postfix) with ESMTPA id C51485010B1
	for <dtrace@lists.linux.dev>; Thu,  6 Aug 2026 18:42:11 -0700 (PDT)
Date: Thu, 06 Aug 2026 18:42:11 -0700
From: Kris Van Hees <noreply@github.com>
To: dtrace@lists.linux.dev
Message-ID: <oracle/dtrace/push/refs/heads/devel/cfac68-30c9c2@github.com>
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

  Branch: refs/heads/devel
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
