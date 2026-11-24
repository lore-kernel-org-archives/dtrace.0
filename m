Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534869;
	b=C8x2Ma+JqRSfLc+j+5cCAkeEbt1mk7ucbWybhVAfIp0taWqilXWE7MstoqnpA8N85A0s
	 hDBMiflSRA/d2KWKBfJ2zvMQeP+7qC6vMDy4impcXfVvL42C2oa5+O0wWoRERqyoxpN4M
	 2vsUi3SCYV7zGR8y2mzK3e88P/MpJwZ10YyIkIn1DzS4GdzevLBzRtjpxAbOXkA0Xzf7w
	 gZBIR2GIvkQfQjo0r+ih185vElk7tmb3yq7vBxe7gSDRsgfndq1VHHBlOIJnFiTsgPwNb
	 VXYrzrqScRcyEMkJX1aTmKeEytslB3pRXaLeRcgnLk5aZMBa5bQhwXbqB5nxgGFJ8mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534869;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-DCC--Metrics;
	bh=WjQRtyA5hJpEzqegdULsNeZKlqPSOlsM8dILFPpcW2Q=;
	b=XZh+3ocqjaJ6+601c+kDHb042nZlE6jYcvBIZFSXq3SkTEO63zwPoGBIef7nk/i1aTQD
	 UcHPdcUER3lXk0+DJIQ+GEHXMysPA+zJeYTS/8D8+JCYnI6Mpgkl0DjEr6/4iKZyZgSU6
	 VFQm8cqdyRITJtD47GdZyaYIi2m3wtmnLKWjOTFt5+TyLq2qkf2xVTZdFyEA4nYs3S6ax
	 taTzi5p+Sh72p5Fdq95KzwA+Wk6ZmvW92QTjNRZu1xZiLY8k9EOQvKeQrcqIwEMSAFlOb
	 tiXrFaxjCbrw/JgJnTBJPoStmQCkCnzjHBSgNb+INdGkA692E5bb3FB5BbluU0lo6hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BB6606A31E
	for <dtrace@lists.linux.dev>; Tue, 24 Nov 2026 15:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54BB6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6AOFf4gf023154
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 24 Nov 2026 15:41:04 GMT
From: Nick Alcock <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 11/20] libdtrace: cache missing kernel CTF archives
 until paths change
In-Reply-To: <au5FobRpMWygAUHU@oracle.com>
References: <24b4b0f9f1f1b21146f37d5f08386734@oracle.com>
	<875wyat8qq.fsf@esperi.org.uk> <au5FobRpMWygAUHU@oracle.com>
Emacs: a real time environment for simulating molasses-based life forms.
Date: Tue, 24 Nov 2026 15:41:04 +0000
Message-ID: <87a4mygru7.fsf@esperi.org.uk>
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

On 6 Nov 2026, Kris Van Hees said:

> On Fri, Nov 06, 2026 at 01:00:45PM +0000, Nick Alcock wrote:
>> On 30 Oct 2026, Kris Van Hees said:
>> 
>> > ---
>> >  libdtrace/dt_impl.h        |  1 +
>> >  libdtrace/dt_module.c      | 16 +++++++++++--
>> >  libdtrace/dt_options.c     |  3 +++
>> >  test/triggers/Build        |  1 +
>> >  test/triggers/shared-ctf.c | 49 ++++++++++++++++++++++++++++++++++++++
>> >  5 files changed, 68 insertions(+), 2 deletions(-)
>> 
>> ... why on earth would they ever be missing? Surely fixing that instead
>> is a good idea? (Or is this something to do with chroots and containers
>> and the CTFA being in a filesystem path whose meaning will change in the
>> middle of execution or something?)
>
> This was prompted by tests for the ctfpath option.

Oh right. Makes sense then.

Reviewed-by: Nick Alcock <nix@esperi.org.uk>

-- 
NULL && (void)
