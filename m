Received: from out-24.smtp.github.com (out-24.smtp.github.com [192.30.252.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0365843DA38
	for <dtrace@lists.linux.dev>; Mon, 11 May 2026 17:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778520567; cv=none; b=Bzlv3padkFM7UX79y4IRfq11PQjfh9uUjq65ZE8MLbScksUrC9Zk7dIZb+qJebiRsLvCL7DX+PHUqnuK79AMyYM4VrBH38SsRwIuqIGJoV+jOZ6y2/ggSFVaROJSg5dZwpKc3yYfhnarOFTbaHpz2kIjIlv4ix8L+it+GdT9Tog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778520567; c=relaxed/simple;
	bh=Vw1SfbNVhHk7OzMeH3f2MmJlOjUj+gEYhY5S0tU97Z4=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=ik0weLsutMvh6YawzT+1RlSTXd4wgAC12z+GUE1HmKjfbVfGTfNiQ3iZ77gocNo7QKfaiIack/e43AxJX0/cSBmZyVWWA2JhShrabol/BlhNiIq7tL6Us/a8mYbXPs5nmbZttRdWEAaKdhuYscj+j7YM1mEXp7B8xz/gWKeBFuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=O1EH9mKn; arc=none smtp.client-ip=192.30.252.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b="O1EH9mKn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1778520565;
	bh=DdSkmBzD+39S3XGWNSYM8+m6GOx4YsJjNDgx4YKrsbQ=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=O1EH9mKnSJM8JOIXuFxZmjsPyvBtFOGPOtUVh/07DYz4i6AG1sssvK4EBnEgbGYVQ
	 3LH3kaSbjLZcZLRms+C3DoqwDhSfqYIokgKAbfPqZ02ojdWWbIOUFxhuM+Kn+Y8ax6
	 Mc504pn3VZ/oalKp+mXRGFo/I1Wx/IQe0Vv8id+I=
Received: from github.com (hubbernetes-node-18a2be0.ac4-iad.github.net [10.52.163.10])
	by smtp.github.com (Postfix) with ESMTPA id 36689A116D
	for <dtrace@lists.linux.dev>; Mon, 11 May 2026 10:29:25 -0700 (PDT)
Date: Mon, 11 May 2026 10:29:25 -0700
From: Kris Van Hees <noreply@github.com>
To: dtrace@lists.linux.dev
Message-ID: <oracle/dtrace/push/refs/heads/dev-queue/d3fd10-cfac68@github.com>
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

  Branch: refs/heads/dev-queue
  Home:   https://github.com/oracle/dtrace

To unsubscribe from these emails, change your notification settings at https://github.com/oracle/dtrace/settings/notifications
