Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793897639;
	b=MKhyzJ9isvdll2RSoOMQ4bCqagxnHicEHW0H3J/6jbsg6pvlr1ejSwLsbiNeQ+XepW02
	 IIpnUEra1gqNHEb9/f/nAIjuUySBkFIdT+srD9/TW1jeB8U+oBCS1oQB26uoV90ZEAkc/
	 gx5oXwAz4ggUyJ+hocn2YvxXMagIjh8CiHfhTqaVZBhGCOLCbrgMH0uGME+CkQr2+ER34
	 6sWF6cHW1w+6XKzkBfAkLBJPER9D2Cwq4CbouQW7HfhdK8QjaTGq3UdxMEt7/u6HHxt9A
	 uY3z1+KuqpjBcyHgGc+t5Ls0tbd3g9JKOLMic0AvzKe52rO94gc0CPwtPZT/F9hXDhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897639;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-DCC-wuwien-Metrics;
	bh=sU9TZsNv8uMX1GQioyL9A2iEi9SPa+9C3jD0qM/8VLc=;
	b=H0N/60UFwZtqb8+sRuVOA2v/6PE+dwXSwcSUgi+lqNaNm3zgYzmFS5ElHR2NX1Z4VR5A
	 Jr13y2sE0xVFa1YN5RpNMM5ajNxZXtu0lDgX98rNkDpLv/KPk4Kgd7REjyldQGY/awDQQ
	 CwIN8qhK5PxP4EeEOlpYKP6xqLSyeFYmFQ92bpFNWWLpUHqHf9/E8o2wwGnhbNSb0bUDd
	 dsjmrgtfO6yQVitCxHup+FFXcxrGy3gu59ZCI6IhoWEOOjQetWBdzfhKrUcy8oLbSAW6X
	 ypmi+0xTNS33K/xvySqdwH89D7NHO6QKsmhEquiiHmK7ou9/Mgn908wtKKPMOnFDT8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D7A606A31B
	for <dtrace@lists.linux.dev>; Thu,  5 Nov 2026 16:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74D7A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6A5GrrtF020605
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 5 Nov 2026 16:53:53 GMT
From: Nick Alcock <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 02/20] libdtrace: retain module metadata across
 incremental discovery
In-Reply-To: <10c34e1100164e736b99534a57e74cfa@oracle.com>
References: <10c34e1100164e736b99534a57e74cfa@oracle.com>
Emacs: it's like swatting a fly with a supernova.
Date: Thu, 05 Nov 2026 16:53:53 +0000
Message-ID: <878q37usm6.fsf@esperi.org.uk>
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

On 30 Oct 2026, Kris Van Hees spake thusly:

> Stop unloading cached modules in dtrace_update(), including vmlinux. Keep
> discovered symbol tables, ranges, types, and BTF IDs for the handle lifetime
> while collecting newly loaded modules. Module disappearance or reloading no
> longer replaces cached metadata.

Hm. Interesting. I considered doing this back in the day but more or
less immediately hit problems with wanting to remove dtrace.ko and
loading a modified one.

I guess we don't care about replacement of modules with bugfixed ones
any more? (What happens if someone does it?)

> Separate failed ELF-load cleanup from module destruction, retaining the
> existing handle ownership of shared CTF and BTF. Document the new lifetime
> contract and cover incremental discovery with both kernel symbol formats.

(I don't really know what this series is for, or why you're doing this.
Is the point of this incremental discovery? Or is it just that the
compiler resolves these things to addresses, so having them change just
causes trouble because the resolution is already done? If so, this seems
reasonable -- one hopes that the verifier would trap cases where the
addresses used now resolve to something else.)

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nix@esperi.org.uk> # given the above

(I suspect there are more simplifications one could make, given this,
but the below seems like it should work.)

-- 
NULL && (void)
