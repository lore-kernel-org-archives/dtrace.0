Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DAA2343B6
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 20:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749845543; cv=none; b=TA2PyKUKNezYby+O6uJz2/ZN7UeZ+dD6Le6iufWi3SS27z+kVvYbofq+k8jx5z2vUVmcXAQuYjvSXfqVKjUEXILWdetN5QikmsSSlaYN/JinSBl6PVscxIRzvP4LFAgl73YvCy8GfDfv3gxRjc0Gt+SmIjfbz9c4CQQYOxBXCDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749845543; c=relaxed/simple;
	bh=QdXElDpaeCJaj5yw0EckvZCFFtNgz2n4+7Jav9PC7R8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jZ5808ktE0h86RX9SZZvy9diupcsGV/F1nYw3AmHehChDy6DYjzFM7Dllaszk6T04NrupcI+MsX4GMqsOGWdmXa23hkrjmsdFOECCB4M09+TqG0eKrR7o2honCwN4Aqxdme0w+r8Grx/C4N1M91dDsRbIiX9m9c00/niu4WRmmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (unknown [82.8.138.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id D819A341F03;
	Fri, 13 Jun 2025 20:12:19 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: Nick Alcock via DTrace-devel <dtrace-devel@oss.oracle.com>
Cc: eugene.loh@oracle.com,  Nick Alcock <nick.alcock@oracle.com>,
  dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH] Revert "dt_pid: pid grabs should be
 shortlived"
In-Reply-To: <87wm9fd8km.fsf@esperi.org.uk>
Organization: Gentoo
References: <20250522181016.27661-1-eugene.loh@oracle.com>
	<87wm9fd8km.fsf@esperi.org.uk>
User-Agent: mu4e 1.12.11; emacs 31.0.50
Date: Fri, 13 Jun 2025 21:12:17 +0100
Message-ID: <87cyb7jt9a.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Nick Alcock via DTrace-devel <dtrace-devel@oss.oracle.com> writes:

> On 22 May 2025, eugene loh verbalised:
>
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> Commit 4aec5c9931eb ("dt_pid: pid grabs should be shortlived") made
>> grabs short-lived.  No test cases show the utility of this patch.
>> Meanwhile, the patch causes roughly a dozen tests to fail on OL9
>> when the test suite is started remotely using ssh, closing ttys.  The
>
> I think this is a consequence of another bug (Psystem_daemon() was
> failing to detect that systemd was running correctly on systemd v2

(Do you mean cgroup v2?)

> systems, and we were falling back to the old approach, which is indeed
> going to conclude that processes in system groups without controlling
> terminals or associated TTYs are system daemons).
>
> I have a fix for this detection failure under test now and will post it
> shortly.
