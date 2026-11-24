Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534781;
	b=XtthcfOh/+KFBKJUEL7INMJMeeP1NItmeRXy6g+5PekoOWWrqyWhz/XayPISDvS2/5Kn
	 lLt8VsU9kDUU7w6HQwC3eXyjMvoehs102eVTeatT3jN4Mr49aalwp7xLqxNwAo40ia6Zw
	 shn3fuerU58bTPFnqstY9r68QWKn/w4WZdbHBOGAt2RvcVL6I0ICyvRYqCfijg+VXhhyR
	 2H8f0xWMvh4SaMEVs+4d7JAsbrottOapHL+bFJbc4n6B+n9XENRYbKbm7B9ePbT6J0AHj
	 YSj34g88DDfn8qM8Ty5Mdb3VlyPCdVsxRmE6jVXafmlvuZre5LAh8tRv9zawB1t6/tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534781;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-DCC--Metrics;
	bh=BHS2HuYB73Lb/1d+8GYFtEgcL4A70Pxfs+pa9oH5kKI=;
	b=OOWv01kUC7eC2jrHxAR+3JzAyxyJffJ545lN1xTgF/ZVlTUBvTmMRLAiPmtBN9xl+xsu
	 fZP3PYHolCMHNyl29wvJHolcIbc6VprlZlN4l8yE1kIU9jIiureFp2WQAF8LWZ07eHnEo
	 UqsdRCID82KT3ivIWy2Gb5wuB7L6jNXOkZcvXGuLsOSnhtmgEtibKsKspQPuF9fqOhgPM
	 OfZHhW9boHP/OcjvL1b57OrsYz2iioitK7g5rB4rH6w7vP6GQjVoOzZ/+G3ZbPm1kd2kq
	 ulBL7y66ZYifTkQRXxG835o6tkkT+gXchI2XCWHOxPc9V7IvDHy901gByZ0SBiiYhCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022BE606A31E
	for <dtrace@lists.linux.dev>; Tue, 24 Nov 2026 15:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 022BE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6AOFdac9023108
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 24 Nov 2026 15:39:37 GMT
From: Nick Alcock <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 09/20] libdtrace: streamline kernel symbol parsing and
 module lookup
In-Reply-To: <au9Jamtz3PtdAnnr@kvh-deb-bpf>
References: <bf45a777b3fc14c2223d21c81a84fd13@oracle.com>
	<87eccyt8xc.fsf@esperi.org.uk> <au9Jamtz3PtdAnnr@kvh-deb-bpf>
Emacs: freely redistributable; void where prohibited by law.
Date: Tue, 24 Nov 2026 15:39:36 +0000
Message-ID: <87ik1mgrwn.fsf@esperi.org.uk>
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

On 7 Nov 2026, Kris Van Hees uttered the following:

> On Fri, Nov 06, 2026 at 12:56:47PM +0000, Nick Alcock wrote:
>> On 30 Oct 2026, Kris Van Hees told this:
>> 
>> Is it really worth replacing sscanf(), which though it's a bit clunky is
>> at least used by other people, with even more hand-rolled parsing code?
>> The hex parser isn't too bad, but this:
>> 
>> > +static int
>> > +dt_modsym_parse(const char *line, int kind, dt_kallsym_t *sym)
>> > +{
>> > +	const char *end;
>> > +	uint64_t value;
>> > +	size_t len;
>> > +
>> > +	if (dt_modsym_hex(&line, &value) != 0)
>> > +		return -1;
>> > +	sym->addr = value;
>> > +	sym->size = 1;
>> > +	if (kind == DT_MODSYM_KALLMODSYMS) {
>> > +		if (dt_modsym_hex(&line, &value) != 0 || value > SIZE_MAX)
>> > +			return -1;
>> > +		sym->size = value;
>> > +	}
>> > +	while (isspace((unsigned char)*line))
>> > +		line++;
>> > +	if (*line == '\0')
>> > +		return -1;
>> > +	sym->type = *line++;
>> > +	if (!isspace((unsigned char)*line))
>> > +		return -1;
>> > +	while (isspace((unsigned char)*line))
>> > +		line++;
>> > +	len = strcspn(line, " \t\r\n");
>> > +	if (len == 0 || len >= sizeof(sym->name))
>> > +		return -1;
>> > +	memcpy(sym->name, line, len);
>> > +	sym->name[len] = '\0';
>> > +	line += len;
>> > +	while (isspace((unsigned char)*line))
>> > +		line++;
>> > +	if (*line == '\0') {
>> > +		strcpy(sym->mod, "vmlinux");
>> > +		return 0;
>> > +	}
>> > +	if (*line++ != '[' || (end = strchr(line, ']')) == NULL)
>> > +		return -1;
>> > +	len = end - line;
>> > +	if (len == 0 || len >= sizeof(sym->mod))
>> > +		return -1;
>> > +	memcpy(sym->mod, line, len);
>> > +	sym->mod[len] = '\0';
>> > +	return 1;		/* Explicit module name(s). */
>> > +}
>> 
>> ... strikes me as exactly the sort of thing you should never ever do as
>> root.
>>
>> Is sscanf() really noticable in profiles? (I guess it might be: we are
>> calling it hundreds of thousands of times, after all...)
>
> Yes - benchmarking the change showed on average a 5x speedup compared to
> the sscanf() version, which is quite significant during dtrace startup.

Good grief!

Reviewed-by: Nick Alcock <nix@esperi.org.uk>

-- 
NULL && (void)
