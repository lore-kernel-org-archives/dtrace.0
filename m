Received: from out-20.smtp.github.com (out-20.smtp.github.com [192.30.252.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902483D301F
	for <dtrace@lists.linux.dev>; Mon, 11 May 2026 17:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778520566; cv=none; b=mHzUwoKxAi4hhZNE3w/gBOREMFO18THWHu7MhocnsuwqZTcMGAeS9oxSXahbUl3iiJNOUKMPJrMBs3B7p4GGm99ic8Xpba6zmhx9YCsv3OCdrC4s/N3iKAhJ7cMa9KUeC5Hswq7dIHnCW2Nb+oZTQCnhrUevgSMyYjRNeeMZJm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778520566; c=relaxed/simple;
	bh=+HBswVdVvjd7GeImhkEE354UPvfRu42PyQ5QaTCWeoU=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=FXHollkmF5pCCk8Nxl2Isu7dyqTs4CZ/XnyDLXrJcQemUN6CXLGgm9f6Yx+6lDatG/vS5ic0pQe38qMt2DwCPkc+D7uxkDX6JmIg/fTugQoUneTunVmbFmidOko5yCePE2+g/yqhXESRbzSckKBrAt6S1TIHrT7vqr48LVHYQ6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=DRiBu052; arc=none smtp.client-ip=192.30.252.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b="DRiBu052"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1778520564;
	bh=zVA0mUiSkS0cwuQrrwBzuChQxwSNPLzEG1qajiCfWvo=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=DRiBu052HcAW1y62Vn76ZPkYEtZ2b0symJ1FZklZa8Mj5BDM5EMLRxw+A7jBH7kdg
	 g+1SSoaRDpijoKpfoB/a/6KLBf+QFz7I+RJ/uPmcC/8n6TWZ7sFToVUuZ1TaMQmHD+
	 xaMhwZzuZEAPbGWlzBp5t2oXCZLiBRR2Mcb0ECxM=
Received: from github.com (hubbernetes-node-c8253cd.va3-iad.github.net [10.48.175.43])
	by smtp.github.com (Postfix) with ESMTPA id B6679801196
	for <dtrace@lists.linux.dev>; Mon, 11 May 2026 10:29:24 -0700 (PDT)
Date: Mon, 11 May 2026 10:29:24 -0700
From: Kris Van Hees <noreply@github.com>
To: dtrace@lists.linux.dev
Message-ID: <oracle/dtrace/push/refs/heads/devel/a00035-cfac68@github.com>
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

  Branch: refs/heads/devel
  Home:   https://github.com/oracle/dtrace

To unsubscribe from these emails, change your notification settings at https://github.com/oracle/dtrace/settings/notifications
