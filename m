Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969326;
	b=hvqIF386+zGiMBqHjWT9+pDsuh2oyeBheL52AiRYievOaj7ST9/Xx9BEjdhOWycUp4uj
	 Kqn8/11YcUgDLJ4/y+BUAKEr2E41UOkSW2OtBx7QSYOwJ0KbVOEZy9kHfyEURGEBfwvF/
	 4Jg4y0mwbNLkX/+2jCcroPS6G4J3B86EOWitc+G06ziPbQO+rmCdxNz3laCHm9GiCE9HO
	 TwdJV3uhMcTP0oIHrYJQ8fPCxb9EUjEW4S1YPLt62/rfoE2H2JY8UR56fJkjbBRY0Mxg3
	 TGv8MA/uDklu0ysk3v5DfbpNt4oqESOUuh9yPfM7tXB3m+3zc4PDHYLI8jh3n2+5V7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969326;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-DCC--Metrics;
	bh=alLa+BBwmmWGvGeiFzmepA5mT0foYWjqOxYZF/vurFA=;
	b=Jw+9VzWoKMNz8g9YQ9tv/remmOF4XROoK5OQzZf0uFF/Qd4i9lu6ihHI9CgjYxrnrcGn
	 PN5OVx8byYFWhSXX8O7IzYwqltTxuwTln9TLS2ZRjAyEnK56T3plzn9ulpkQRxzFyhR1p
	 M78jiaygLhpO2Pq9P2ipHUXQ8WM5917nZwpvGglSyBZPZhoc8J6ZeLMuKJCDjtHuxe2Lu
	 maIVEdL98xQboZaJXkWY1G3SlSrSOC0pejteXHlHRCUOFAbY/smtJwnK0j3kOUtCLyFjQ
	 hiu4F5ItRd/MgZTlkvOxW4IKRXTQljFhnC47gZgZSlc57rV6+H/VRugf3wqfApWv/jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBEB606A329
	for <dtrace@lists.linux.dev>; Fri,  6 Nov 2026 12:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCBEB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6A6Cme6P014458
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 12:48:41 GMT
From: Nick Alcock <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 05/20] btf: stop resolving cyclic type references
In-Reply-To: <62cfb7eb8b923ab975f376f7850c0a83@oracle.com>
References: <62cfb7eb8b923ab975f376f7850c0a83@oracle.com>
Emacs: it's not slow --- it's stately.
Date: Fri, 06 Nov 2026 12:48:40 +0000
Message-ID: <87v76at9av.fsf@esperi.org.uk>
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

> --- a/libdtrace/dt_btf.c
> +++ b/libdtrace/dt_btf.c
> @@ -100,8 +100,14 @@ static btf_type_t *
>  dt_btf_real_type_by_id(const dt_btf_t *btf, int32_t id)
>  {
>  	btf_type_t	*type = dt_btf_type_by_id(btf, id);
> +	uint64_t	remaining = 1 + (uint64_t)btf->type_cnt;
>  
> -	while (type != NULL) {
> +	if (btf->parent != NULL)
> +		remaining += btf->parent->type_cnt;
> +
> +	/* A longer chain must revisit a type, so reject cyclic BTF references. */
> +	while (type != NULL && remaining > 0) {
> +		remaining--;
>  		switch (BTF_INFO_KIND(type->info)) {
>  		case BTF_KIND_CONST:
>  		case BTF_KIND_FUNC:

That's a fun approach. Simple and entirely different from what I'm doing
in a yet-to-be-pushed libctf commit :) (which involves a counter which
starts at 1 and is reduced on every lookup, and whenever it hits 0 an
identity-check is done and the counter is reset with an increased
initial value: a tortoise-and-hare-in-O(1) space-and-time algorithm of
Hellman's. Like yours, it has the advantage of being basically free
unless things go wrong.)

Reviewed-by: Nick Alcock <nix@esperi.org.uk>

-- 
NULL && (void)
