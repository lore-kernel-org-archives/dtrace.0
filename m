Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969812;
	b=IhXtlHz2abASQrXD/yQccJl9YD7fzN7i6R6oAD8DXRawl22PIH+kvDeRjMeGtd234IO3
	 XmN3a7OACPQeOtDZZNLGuUMhXZgP8mq84+d/qVmFdyG23zms3wW7fUzRXTzyVXsGAIxTB
	 RaojfNb0bwD1dBb75Wa7K4KPp5pqmse/DWoZMSLpI7nNyhB87m0JowgDXgm6eO4ICj86L
	 RIKl+jevoHfKaJeQvKWYYqmRBe067nP6y+kK8VyO4rZYspRBijJIFzT8KkK5zHSXvtoSN
	 BTLh2hwsMdI5DFQNKdXcE/N8OX9iWVRT6e5DiFj/mplFpq3OiFp99vsGjJORJIE55OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969812;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-DCC--Metrics;
	bh=TNCJ89CSxs0ZRzgOyjWmZekEYg3mK1tA15fhw8IFjuc=;
	b=JWjVZAWexsT6FeIgdSRh39fxzJY/IATEsBekX2QeqHHSa3KDBdDCFUsCrEBH6AG+18Sp
	 cLkuPGpBCx4aQqHoe96l/rybFdYdMNq2rt054BHvoeOAp7tMKDO7ijSHxoWVpHvO2EQJx
	 eQKRBpgemnY0noS/3jRCYDFN7jWcpOkgGTkfzX2aQfMLQXbD1a8LGM1rwu5hIq6mUqgIv
	 6d8CrlFauyC/AYK2z/O4TTC3FHUuMxWpLSUe5VUKkkvPcpcTEK7zVA6kJY5NyvazFslrV
	 ZvfmznB6CtAPfbWamAK9PS18+odSpiujYdGAO7HaDhEi6Ds6xPaa7G8hYTRvJ6nEhLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D2C606A326
	for <dtrace@lists.linux.dev>; Fri,  6 Nov 2026 12:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7D2C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6A6CulEw014709
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 12:56:48 GMT
From: Nick Alcock <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 09/20] libdtrace: streamline kernel symbol parsing and
 module lookup
In-Reply-To: <bf45a777b3fc14c2223d21c81a84fd13@oracle.com>
References: <bf45a777b3fc14c2223d21c81a84fd13@oracle.com>
Emacs: impress your (remaining) friends and neighbors.
Date: Fri, 06 Nov 2026 12:56:47 +0000
Message-ID: <87eccyt8xc.fsf@esperi.org.uk>
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

On 30 Oct 2026, Kris Van Hees told this:

Is it really worth replacing sscanf(), which though it's a bit clunky is
at least used by other people, with even more hand-rolled parsing code?
The hex parser isn't too bad, but this:

> +static int
> +dt_modsym_parse(const char *line, int kind, dt_kallsym_t *sym)
> +{
> +	const char *end;
> +	uint64_t value;
> +	size_t len;
> +
> +	if (dt_modsym_hex(&line, &value) != 0)
> +		return -1;
> +	sym->addr = value;
> +	sym->size = 1;
> +	if (kind == DT_MODSYM_KALLMODSYMS) {
> +		if (dt_modsym_hex(&line, &value) != 0 || value > SIZE_MAX)
> +			return -1;
> +		sym->size = value;
> +	}
> +	while (isspace((unsigned char)*line))
> +		line++;
> +	if (*line == '\0')
> +		return -1;
> +	sym->type = *line++;
> +	if (!isspace((unsigned char)*line))
> +		return -1;
> +	while (isspace((unsigned char)*line))
> +		line++;
> +	len = strcspn(line, " \t\r\n");
> +	if (len == 0 || len >= sizeof(sym->name))
> +		return -1;
> +	memcpy(sym->name, line, len);
> +	sym->name[len] = '\0';
> +	line += len;
> +	while (isspace((unsigned char)*line))
> +		line++;
> +	if (*line == '\0') {
> +		strcpy(sym->mod, "vmlinux");
> +		return 0;
> +	}
> +	if (*line++ != '[' || (end = strchr(line, ']')) == NULL)
> +		return -1;
> +	len = end - line;
> +	if (len == 0 || len >= sizeof(sym->mod))
> +		return -1;
> +	memcpy(sym->mod, line, len);
> +	sym->mod[len] = '\0';
> +	return 1;		/* Explicit module name(s). */
> +}

... strikes me as exactly the sort of thing you should never ever do as
root.

Is sscanf() really noticable in profiles? (I guess it might be: we are
calling it hundreds of thousands of times, after all...)

-- 
NULL && (void)
