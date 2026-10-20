Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792490288;
	b=a+VbRrGQOd96gw595W1n1R9mSlLf17i/ybLJ5lwEOpCE7HJGogNP4X32SLFLwTH8Ao/g
	 rS4qIe78v6tjcucaZzrDthQXLpXl/jgGE5n98T5ceOddjNMqyghqws2O0NvQIp2b3HeWE
	 IzVD1Ibg6ZqKG/l1PI2nqYn4CM+AQASFJewN5YLSU49FR6N1wwwZs8ZCcccowdiig7OrR
	 wRbS/x8PXqZvSlgdKn+HcPASj2Ijz136CNEV9qwozlj4zLVDzjLGb3db7n+XFH9xQ90fL
	 kZDpOGBouq//2Jv3RWBLALN+aJ1d+h2KJPJr27/I1z4fQi3zD64m5Ec9ah4+UCTB76A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792490288;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Subject:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=eVJxg2LfWaR9HNO/xl1+EXhFQI9nns/GBvXSG2G5OnE=;
	b=Rav6ej10lixeZfM+Ch5AjbPeBMOWw9HgPJwaLBPGJayEwe4ZZGu7F+RSXBHeS9upDtrs
	 U1rmWE+B2jRIaM/px+zFzJm20ezdqDvKhG08HnBrsnQG47aLZvDPupZW5ajxexcSN9VUv
	 57vlPIKv+5FOOEfrDF7BqPju8T2CKNQkfHPPK7wfoVMyc3XZXsYm7D4djeN1561pEsJzN
	 d+ZF4xFAaiC3B6XFSjhAXscS1l/3eAHjYx/9+MnNcMVWURUwgjVyEW8YudCitl/TtTuzl
	 Of2yGIse1zWasYd/DV71KLanUa+peOPxharg9shY1b4lk/LFgna1c3wc2r851Z+gD0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i+YtmHFg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3F9606A319
	for <dtrace@lists.linux.dev>; Tue, 20 Oct 2026 09:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i+YtmHFg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 330A41F000C5;
	Tue, 20 Oct 2026 09:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792490288;
	bh=eVJxg2LfWaR9HNO/xl1+EXhFQI9nns/GBvXSG2G5OnE=;
	h=Date:To:Cc:References:Subject:From:In-Reply-To;
	b=i+YtmHFgbSfJuu3/L9Exszodv9PvcfVxVmFrxXFYKctHUORkVrfd5to/eopZawDAm
	 0ldpVpXWnfgKaAZwV2KERpiQunxONaBTL8KsnHi4CCgSADcuXXadspcRTiTBSrb6eS
	 nd+KjDK1tuAWD2Gua8Yzyl9GNXVWRRx3eRuteGyCJyqAeOt549dmvX5gx1hIqVDU/v
	 PYZLoiNYCaQsoWfyiLMgFYhOvLzwnMobE5T5XqaLSVJu2CiiRcuwjkQWcbLW8iOj+F
	 76TM49WcLpl8B5pXFbTh67sABwbP7G0L+8MfQjk7GWADkHMJICtdejHMSkWsMDjz5n
	 WEfnF8kN+j0aQ==
Message-ID: <abe99f45-13f5-43e0-b977-3a3aea9749ac@kernel.org>
Date: Tue, 20 Oct 2026 10:58:04 +0100
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: kris.van.hees@oracle.com
Cc: alan.maguire@oracle.com, dtrace-devel@oss.oracle.com,
 dtrace@lists.linux.dev
References: <asYdAbzPN9i-OSFN@kvh-deb-bpf>
Subject: Re: [PATCH v5 03/11] libdtrace: avoid BTF probes for ranged built-in
 modules
Content-Language: en-GB
From: Alan Maguire <almagui@kernel.org>
In-Reply-To: <asYdAbzPN9i-OSFN@kvh-deb-bpf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

>> +	/*
>> +	 * modules.builtin.ranges identifies this object as linked into vmlinux.
>> +	 * Such objects cannot have a per-module BTF object, so use the shared
>> +	 * vmlinux BTF directly.  Retain the usual lookup for an explicitly
>> +	 * configured BTF directory and every other module.
>> +	 */
>> +	if (dtp->dt_btf_path == NULL && (dmp->dm_flags & DT_DM_KERN_BUILTIN)) {
>> +		dmp->dm_btf = dtp->dt_shared_btf;
>> +		dt_dprintf("Using shared vmlinux BTF for built-in module %s.\n",
>> +		    dmp->dm_name);
>> +		return;
>> +	}
> 
> This does not look right to me, because if a dt_btf_path is specified, I
> would expect the handle to still provided a handle-wide shared CTF and
> BTF, even if it may be different from the system-wide shared CTF and
> BTF.  In other words, I think that sharing should be based on:
> 
> System standard CTF and BTF -> dt_shared_ctf and dt_share_btf globals
> Non-standard CTF or BTF -> dtp->dt_shared_ctf and dtp->dt_shared_btf
> 
> So dropping the dtp->dt_btf_path == NULL in the conditional clause above
> should be fine, right?

Yeah, certainly in the case of BTF we should always prioritize the
system-provided BTF since it travels directly with the kernel in
question.
