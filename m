Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092502;
	b=vUM6WtRb1OfZI8ZZ0bEP+P7CSvSWZD2JRoMHPhSArxvKouh0/6ZOrS6ooeYTHb936VkI
	 1qL2KSTBWf3QT9y3tid1nJu2pvEcmHMz6qpacZJutwPhvR5scp0KbjXjxwpJ+n5j0Y6zX
	 tCSCkghm4fEAspmoK72hNXeHuREz0lON+aKipu0ude/y2bOlSPZ4vMQtPtl2CEtbNKbds
	 wDgF8zFW/gNCp0WNCVT7gYbvfIIRI+BCbsR5LwVZI39Ex0105drDbJV6BHDHHIX39qBWc
	 mxUbCqw9O6z2RLClAyqINZnn0t5+Gb4aavNfMvw0edywTGk3hb4mh/cqufgZsfSoSdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092502;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-DCC--Metrics;
	bh=qG89bGCzVztT/Mv7E1bD+s/v4WTU2xuDvTbwzycrPBY=;
	b=35ACs4kez0W3qhl/gDT8RiGuREzHdWQ4ya+yzddyFt1FiYoNM7J2yU2Q1dqna11EMHg6
	 LAVA4kAc1EI5pE10yamno1b9g9QVkyBiFCMmRyjTElkP6C8uonEk/IOMRX+CbHzNPtfGJ
	 Y/HN2/ErwE0FMLLWCrEgx45xn5bAzT/XEHpKXWwQZMQ5EJCuPH7F6N+QyIEwE49PamT3m
	 f8YJKAcQZ+JnQ54rkVmICiPypHvrQP4y5k+4FVCzjWyuUGYIUeDgr3u3Y4cwS2L4+hb/F
	 67i/MxxSU9keGSPY4tyFSbMg1P8YjDsROGpy9eSU+6PWS74UQyer+AgY3FkHPpxXIuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D6F606A320
	for <dtrace@lists.linux.dev>; Thu, 19 Nov 2026 12:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3D6F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6AJCm9Cw017337
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 19 Nov 2026 12:48:09 GMT
From: Nick Alcock <nix@esperi.org.uk>
To: ealmorshdy@d-matrix.ai
Cc: dtrace@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>
Subject: Re: [PATCH v2 1/2] libproc: fix readlink() typo in Psystem_daemon()
In-Reply-To: <20261119-b4-bug008-daemon-readlink-v2-1-c4bc5fbf156f@d-matrix.ai>
References: <20261119-b4-bug008-daemon-readlink-v2-0-c4bc5fbf156f@d-matrix.ai>
	<20261119-b4-bug008-daemon-readlink-v2-1-c4bc5fbf156f@d-matrix.ai>
Emacs: because editing your files should be a traumatic experience.
Date: Thu, 19 Nov 2026 12:48:09 +0000
Message-ID: <87a4n5m1h2.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-DCC--Metrics: loom 1102; Body=3 Fuz1=3 Fuz2=3

On 19 Nov 2026, Eslam Almorshdy via uttered the following:

> From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
>
> readlink() returns the number of bytes it stored or -1, never 0, so
> the check for a regular file outside /var never ran.
>
> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
> Signed-off-by: Eslam Almorshdy <ealmorshdy@d-matrix.ai>

Reviewed-by: Nick Alcock <nix@esperi.org.uk>

(who is to blame. How did I miss this?!)

-- 
NULL && (void)
