Received: from out-26.smtp.github.com (out-26.smtp.github.com [192.30.252.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12EA43175
	for <dtrace@lists.linux.dev>; Sat,  3 Oct 2026 12:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791031205; cv=none; b=HR1uyqwUI8+cFdEzzI20g7HZoGaStrG/389oCruO5DQwl/wHc3j+bkXZNkSe+/Y6oRBgdIBa2aj6TX8IM+OpxdAimpOzb/pEM4LLOcO9jOXiFZm6+aUWVHfb9tkfmWDF6Xrf/JC+Qm13Kn7kBww/plON6MWbuMFkTj0ten5MsyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791031205; c=relaxed/simple;
	bh=y8zuQHFwUC43IMRkPSf1O1j9PJTgb7bLg7IYYX3K5k8=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=pfv5zx1+R+hTpxA6WxswhHQzVvpIHv7YULGDrsrhmehiFcD+aGXH31dPhhMqafZWdyxhvPtYX3ZFvnnp+f6NNIHAQFCcHsGkqRRgNb8F/+iQy8P0rxjF+CEwWzpRj5im1FA5jIcrAc+IBhH+K1D3reMzkMTa0JeZ6pyTfaAWHGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (2048-bit key) header.d=github.com header.i=@github.com header.b=fOMcMmmy; arc=none smtp.client-ip=192.30.252.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=github.com header.i=@github.com header.b="fOMcMmmy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2026; t=1791031202;
	bh=zGi8wK7KJ+TliPcMg622sXpL6XNqudRr8HOsP4RIVwo=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=fOMcMmmyyOuEahlvPZ6hfi8zwZjg7wWJborAAw3ilSHq8r5yDXTtUATD9RcK0jntp
	 4UvUsesYEPk6O+XlhXUBF16Ll6IwqIhWPrCzgM8lpRFXpUBB+gby07MV3a+8+yVjIW
	 pV3wik82UexPFw9hGCypEKEWPsfBe2uBn6D0flt4r0+4gzM1iKXV633259zqIP5iEF
	 OCQUwD8imgBPnj7sB3BocOSe5DDci8DnZtW1rb6kSWsch59DPWZOeTryeQPP9hr7Tw
	 tqpjfmLsiCD7QwfFS64Sj2XWKUhdxElVkehFqIiWRr2ML7zt32U4iyM/LnxGWjK+SU
	 GcC2xS65ea+jw==
Received: from github.com (hubbernetes-node-a7ec0b8.ash1-iad.github.net [10.56.144.36])
	by smtp.github.com (Postfix) with ESMTPA id E65905204C4
	for <dtrace@lists.linux.dev>; Sat,  3 Oct 2026 05:40:02 -0700 (PDT)
Date: Sat, 03 Oct 2026 05:40:02 -0700
From: Kris Van Hees <noreply@github.com>
To: dtrace@lists.linux.dev
Message-ID: <oracle/dtrace/push/refs/heads/dev-queue/abdaf7-db1c6d@github.com>
Subject: [oracle/dtrace] db1c6d: build: avoid empty default case in switch
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
  Commit: db1c6d2a46bcabe4b657046117d4f58db01fab52
      https://github.com/oracle/dtrace/commit/db1c6d2a46bcabe4b657046117d4f58db01fab52
  Author: Kris Van Hees <kris.van.hees@oracle.com>
  Date:   2026-10-03 (Sat, 03 Oct 2026)

  Changed paths:
    M libdtrace/dt_btf.c

  Log Message:
  -----------
  build: avoid empty default case in switch

Some compiler versions cannot handle an empty default case label.  They
are pointless as far as functionality is concerned and therefore can be
removed.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>



To unsubscribe from these emails, change your notification settings at https://github.com/oracle/dtrace/settings/notifications
