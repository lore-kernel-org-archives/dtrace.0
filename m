Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78FA2E11CB
	for <dtrace@lists.linux.dev>; Sat, 14 Jun 2025 22:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749938679; cv=none; b=gN/TCx42GHgxLAe1/+KHCj8RMR5IpkvkOqYEtbnaVl+jAUrrp+ImIb8EGqArdDBp+ss7iGqvwCRvoJfhKEG3IEnK5QMaGQSaFWJsoWrYY8eJT/UL5qLAvgFL6FLJ8TaOtrLPmIBJCDsORTS0PeQPS5TvB/j1RVaXbNw1i5BYPPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749938679; c=relaxed/simple;
	bh=9omHYFCfSxBT3xBYm27wCbfzxNNamwNajBNh0UPCtsI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YmLzdQ92t+lOWKZbzumOve8mcTx4lS+fLeprFMWQk8CkepuycHACveS3tEYGU96IvyIA8DJst1wMXU/Q+QB6FPkoiUOhXFFmDTbAlSwBP2EpVy4sVaek1ycmNMdsRpnNxFgahHYoKo45pfbbo03bDwnipM8c/IKKgr6Qh6lvf70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (unknown [82.8.138.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 895CF3424EB;
	Sat, 14 Jun 2025 22:04:36 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: Sam James via DTrace-devel <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH] Revert "dt_pid: pid grabs should be
 shortlived"
In-Reply-To: <87cyb7jt9a.fsf@gentoo.org>
Organization: Gentoo
References: <20250522181016.27661-1-eugene.loh@oracle.com>
	<87wm9fd8km.fsf@esperi.org.uk> <87cyb7jt9a.fsf@gentoo.org>
User-Agent: mu4e 1.12.11; emacs 31.0.50
Date: Sat, 14 Jun 2025 23:04:33 +0100
Message-ID: <8734c2hte6.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Sam James via DTrace-devel <dtrace-devel@oss.oracle.com> writes:

> Nick Alcock via DTrace-devel <dtrace-devel@oss.oracle.com> writes:
>
>> On 22 May 2025, eugene loh verbalised:
>>
>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>
>>> Commit 4aec5c9931eb ("dt_pid: pid grabs should be shortlived") made
>>> grabs short-lived.  No test cases show the utility of this patch.
>>> Meanwhile, the patch causes roughly a dozen tests to fail on OL9
>>> when the test suite is started remotely using ssh, closing ttys.  The
>>
>> I think this is a consequence of another bug (Psystem_daemon() was
>> failing to detect that systemd was running correctly on systemd v2
>
> (Do you mean cgroup v2?)

Nevermind, I see that in the patch you posted.

>
>> systems, and we were falling back to the old approach, which is indeed
>> going to conclude that processes in system groups without controlling
>> terminals or associated TTYs are system daemons).
>>
>> I have a fix for this detection failure under test now and will post it
>> shortly.
>
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
