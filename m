Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793897294;
	b=n3R1IsTILXXaf5AIPN4ktAvDxrRvuTXlkjj+/WiDUYzmiYPBkhEN7sH3KrzJV+wkL515
	 0phgYfl0upbdtOib1Me+n0yyb8cEeYr4JVcfUUfNYbCbyfbh0avAPzHFUejNzbcSTNsND
	 aQYCZa7OQKj443msX7CMUmqNAUXyxolp4LiBuBlKgJgr2b6oWPqGzCzpuSz1J+QAeczBx
	 SDKUj3RKwMNBkL7yALKU+SMOMMJgJs0gbe6BBQ3RQjkMiOEmYF3oZrN3sRqZN91fio068
	 wuhQyrsBuRKns7DcQ8UIJuKHqzlLhecCCXYC06jW00JJx80bzrWFdSLM2FRsqR+Na3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897294;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-DCC-wuwien-Metrics;
	bh=898vBR0p7JmAoDCsbDXLJ+ALKMdBVpZI0f7AOSIIwBA=;
	b=B6bAjSOXNOP+jdCjLhMepnZlKZ9CnKLr4APZUru3N3QWAQNH+bgdLfEZSb7fq9o59J+q
	 az+trj19bkFme0x2Lv6TJoeTzwN9hwLWj1CCX7U1EZyYAnrG+Xum/qmB+Buj1hcJSvacX
	 2AN1lEE69LT86q1G1Su8lLrPEUns2bOfuqtu6OfD8R9CqfMox32EC+/b8J2llTlndNZii
	 PiC3UH6STv0eje1V5ZivAFSuv607ZPNAfwGXF+SExLvhaQBBDIptoXjG/ZGTcmxUfe/74
	 MNpNN6GibfodzOm0+27izhAAf2YJz6tM1c2xIkPONlKTtNNOvxPl/QXDUG/94iyOfLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0E2606A31B
	for <dtrace@lists.linux.dev>; Thu,  5 Nov 2026 16:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC0E2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6A5Gm2oF020372
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 5 Nov 2026 16:48:02 GMT
From: Nick Alcock <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 01/20] btf: remove empty default: cases in switch
 statements
In-Reply-To: <17b15ff32c26e655d18533ca3e79bc72@oracle.com>
References: <17b15ff32c26e655d18533ca3e79bc72@oracle.com>
Emacs: more boundary conditions than the Middle East.
Date: Thu, 05 Nov 2026 16:48:02 +0000
Message-ID: <87cxsjusvx.fsf@esperi.org.uk>
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
X-DCC-wuwien-Metrics: loom 1290; Body=3 Fuz1=3 Fuz2=3

On 30 Oct 2026, Kris Van Hees told this:

> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

Seems wise.

Reviewed-by: Nick Alcock <nix@esperi.org.uk>
