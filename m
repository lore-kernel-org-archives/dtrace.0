Received: from out-42.smtp.github.com (out-42.smtp.github.com [192.30.252.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0156743D515
	for <dtrace@lists.linux.dev>; Mon, 11 May 2026 17:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778520567; cv=none; b=l0CtujrSLeXh+2ufi8VATrrE06azeei9L09HmEestmAYD8kF8dIp3ED+aX08wzY+jQUOCHyur/kcDB/MbGm1Aa6WnqGJQNNh0YJryuBUCAou5C+iMZbKXFd0mowCfBp1T3uxDxh08KaWU1gJItgZTLyHpo15nv38UEfrKE1g1is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778520567; c=relaxed/simple;
	bh=sZqlI5hQ8kKGYxBXfIgCa1WzygGmX6GdMFfqTQ9KupA=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=WBHIT02ejDhSVXIyY1gNJBe5XE36wjlFMKzCjEBUhJQEr791Z8MEbik8DYABL4B8S3I+BInJCYoOPXyGi/UUT+HNYmBcApeAeE/7ML19jNl1drf6rsPcEJq9GQ8XYPLGpMe0p+rENd18NG/uVV2IdGMGhWoaJFG9MNi2QInIy9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=VuBKoqOd; arc=none smtp.client-ip=192.30.252.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b="VuBKoqOd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1778520565;
	bh=CUebkrWhUxITSojDzSRAK/U/mYaPngfCB1WK8yN8qLY=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=VuBKoqOdLccVQgVXFYVX1ZaVRH563zqIbultWb+anN3MjXttP5rluFka2ZV+pEqRq
	 OYFhEdKBxKFfz8sBcgVQKtZQ2POQ4njfOs35YcOzpDLmnrgxU4nmIkF8Gkar1afS0q
	 2qhpD3T04ojLGyTYBJH9r5+7dN7N5gJSkTVW18JM=
Received: from github.com (hubbernetes-node-ca10a00.ash1-iad.github.net [10.56.200.79])
	by smtp.github.com (Postfix) with ESMTPA id 25986841055
	for <dtrace@lists.linux.dev>; Mon, 11 May 2026 10:29:25 -0700 (PDT)
Date: Mon, 11 May 2026 10:29:25 -0700
From: Kris Van Hees <noreply@github.com>
To: dtrace@lists.linux.dev
Message-ID: <oracle/dtrace/push/refs/tags/2.0.7/000000-e209cb@github.com>
Subject: [oracle/dtrace]
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

  Branch: refs/tags/2.0.7
  Home:   https://github.com/oracle/dtrace

To unsubscribe from these emails, change your notification settings at https://github.com/oracle/dtrace/settings/notifications
