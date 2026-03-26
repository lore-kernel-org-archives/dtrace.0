Received: from out-24.smtp.github.com (out-24.smtp.github.com [192.30.252.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFB03FE34F
	for <dtrace@lists.linux.dev>; Thu, 26 Mar 2026 15:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774537537; cv=none; b=kOA+WuM0yODZzpjvYwBtSyK1eue4+2+0AwUhiKXrswdDVCL4i/zKCqVYTfvlb1rirxaJoK59Eq3waEsp7hXWHv8xvsYdP6qDABMUP/Md9UJuqpv7HzlHD6UtE2xX9PSKPFs+eemcfdBn6rIf+JD1QWESNoVW7htZfAXWiLdBDH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774537537; c=relaxed/simple;
	bh=CbGKd1TaRRD9po4IWOw0mYGtDVvoypWw1I5Sr87gGys=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=JSCRkcMEvZG/DKJbYEGdB2Qnp3+9JllZ+iUc+K8rArVs5e7fpbUD9DtAebDb24duvLqJrxzljQODD+MDySB4R5/qPt2BfEGCq2Q1/19gyEIe4EQ8nFlEmTS035K59p7CdneZVw72ErLp5P3hBW1Fb+k4M8ZGROCmAeCaBE4I0J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=B8ckVxdl; arc=none smtp.client-ip=192.30.252.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b="B8ckVxdl"
Received: from github.com (hubbernetes-node-a8f6b50.ac4-iad.github.net [10.52.171.15])
	by smtp.github.com (Postfix) with ESMTPA id 6713364034E
	for <dtrace@lists.linux.dev>; Thu, 26 Mar 2026 08:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1774537535;
	bh=1j3JbEH17Luwz6hQVZSWAIRUNtGN1vN9x4s9S7mxuAI=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=B8ckVxdlfszeGTi/PMBOrwG7OoFEb3Kqo6wX5mVou4CAilUfGqNffhJJdA78ooyRG
	 iN6YBHuEaGc4xldYR8efskf02xDC3swWYV0iCTVYl7UuE8cC8Xr+9GHYAP7Jd6yPFF
	 htWYQf8IuXzOCFLy8ixRj7w9k+Awvgufq+9v5eC0=
Date: Thu, 26 Mar 2026 08:05:35 -0700
From: Kris Van Hees <noreply@github.com>
To: dtrace@lists.linux.dev
Message-ID: <oracle/dtrace/push/refs/heads/kvh/dev/000000-43fd8d@github.com>
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

  Branch: refs/heads/kvh/dev
  Home:   https://github.com/oracle/dtrace

To unsubscribe from these emails, change your notification settings at https://github.com/oracle/dtrace/settings/notifications
