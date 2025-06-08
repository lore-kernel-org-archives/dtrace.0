Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBCB6F099
	for <dtrace@lists.linux.dev>; Sun,  8 Jun 2025 01:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749346930; cv=none; b=aczMdSfdD7oM4VEt9bMW/6LAXvUPZfa0936uiFhxSOVLgHWFYEE+xqlDhhJtXB4DQjh3EjNtEmZd05aM5B9sdR36s5lhTDi47BU4JqfwkBce3i0Scq7qsN5E0bngabhItJv/NA7wIMXlJKUpa7r5JTVta2quI3rOfy8riXuiX6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749346930; c=relaxed/simple;
	bh=f2yzsBSADF5+NfTvru6kUbQRbsAKWMgg6k/fjrs3C0s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MkfhenhOdu9z+45oeXl3Da4fZHIQPoYd0pSRLo7sVB45lDnwnW7QyuQipJZuOhou5RA0ylNG3RlkKP6gmR3yN5RajCUVP2Yi41uXYokTT1LQOsllfOrwXS/o7JWmOv2FGOg3I8GT/M31x/8OJhsACTFxOERVr2X1hJWyuAL5pOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (unknown [82.8.138.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 96A00343091;
	Sun, 08 Jun 2025 01:42:07 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: Alan Maguire via DTrace-devel <dtrace-devel@oss.oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>,  Alan Maguire
 <alan.maguire@oracle.com>,  dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH v2 0/4] ELF note-based USDT support
In-Reply-To: <407bef64-903d-43a0-a5e9-071eef13c27d@oracle.com>
Organization: Gentoo
References: <20250129145522.512341-1-alan.maguire@oracle.com>
	<Z5pKUy5EOa7U/Ita@oracle.com>
	<407bef64-903d-43a0-a5e9-071eef13c27d@oracle.com>
User-Agent: mu4e 1.12.9; emacs 31.0.50
Date: Sun, 08 Jun 2025 02:42:04 +0100
Message-ID: <87ikl7uhzn.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Alan Maguire via DTrace-devel <dtrace-devel@oss.oracle.com> writes:

> On 29/01/2025 15:33, Kris Van Hees wrote:
>> Thank you for rebasing your work on the newest tree.  That will certainly
>> help review them and move things forward.
>> 
>> I would definitely rework the commit message though, because
>> 
>> 1. DTrace has a specific understanding of what USDT probes are and how they
>>    work and stap-based probes do not provide the same functionality.  One
>>    example of that you already point ay: they are not discoverable - i.e.
>>    they are not registered upon startup which is why you need to refer to
>>    them directly by provider name (with embedded pid).  I think you need to
>>    be very clear about the distinction.  Using STAPSDT or stapsdt might be
>>    a better choice than referring to USDT.
>>
>
> sure; I'll use stapsdt.
>
>> 2. I think that the commit message fails to highlight that this support is
>>    to make it possible to trace programs (and shared librearies)that have been 
>>    built with stap style probes.  I don't think it is in the best interest of
>>    DTrace users to build their executables and shared libraries with stap
>>    style probes over DTrace USDT probes, especially given the significant
>>    advantage that DTrace USDT probes have (see 1. above).
>> > 3. While I can see the point of mentioning how to add stapsdt probes to
>>    code, it also is a source for confusion and thus is probably better left
>>    out.  Since this is a compability feature, surely those wanting to use it
>>    already have executables with such probes or know how to create them.
>>    By including it here, you also introduce the very unfortunate fact that
>>    stapsdt uses DTRACE_PROBE*() macros even though the probes have never really
>>    been DTrace compatible, and it is only with your proposed patch now that
>>    they could be used in DTrace.  The systemtap project shouldn't have
>>    piggy-backed on DTRACE_PROBE*() in the first place because it causes this
>>    type of confusion and complications, so I would very much prefer not to
>>    highlight that mess with this patch series.
>> 
>> The stap probe support is very significant because we unfortunately do have to
>> live with a world where there are multiple ways that such userspace probes
>> have been implemented.  And given that packages are released with probes and
>> people may want to trace them makes this addition certainly very worthwhile.
>> But I think it should be clear that this is for compatibilty/interoperability
>> purposes only.
>> 
>
> Sounds good, I'll rework the patches accordingly.

Any update on this? I'd really love to start wiring up support for these
in packages. I guess it interacts heavily with the work Kris has been
doing on making LTO work with USDT though?

cheeers,
sam

>
> Alan
>
> [...]
