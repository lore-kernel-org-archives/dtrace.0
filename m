Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D409383C6F
	for <dtrace@lists.linux.dev>; Tue, 28 Apr 2026 20:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.187.191.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777409388; cv=none; b=ln0tmkHR3XTzhZzkoXhGfKfwhSS8v9U+rMtw2naMlCV1cZkHYScH9yZDANckvYtw71ROZHuIVgxxh+X+yY6220VRjI+VcChDa5dUPPEuLm1jrBsJjLn2EeWxg2h1Af5s/nSm4Cjxh4ShvG1a+j3yv9kAaVxeaH4kiFjmeHsares=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777409388; c=relaxed/simple;
	bh=CdWzSTLjx1WsCNJiqF2wOu1jhyra3qQry2e+Mweac3E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=N1ttExF6mbycN3I4QevC7HHP1g4bN6hRlD9lu5RdEjr/OV81n1wmgAUSsUrjcHq5Xghikbdwbcht1hLopHN94wUuD0LtcykMJvtkZYB9I2gaQRi050AxC0yRHVx36wj2QccfWi+6OpoDcOJrULBYOl8IqKTllrAoaSWd2VnW1oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk; spf=pass smtp.mailfrom=esperi.org.uk; arc=none smtp.client-ip=81.187.191.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 63SKngIG015757
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 28 Apr 2026 21:49:42 +0100
From: Nick Alcock <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 4/6] fbt: do not provide untraceable functions (for
 fprobes)
In-Reply-To: <9ac31f4ab2458999e6af2c41621ecf67@oracle.com> (Kris Van Hees's
	message of "Tue, 28 Apr 2026 19:05:25 +0000")
References: <9ac31f4ab2458999e6af2c41621ecf67@oracle.com>
Emacs: Lovecraft was an optimist.
Date: Tue, 28 Apr 2026 21:49:42 +0100
Message-ID: <87o6j2res9.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-DCC-wuwien-Metrics: loom 1290; Body=3 Fuz1=3 Fuz2=3 rep=17%

On 28 Apr 2026, Kris Van Hees outgrape:

> Ensure that we do not provide FBT probes for functions that cannot be
> probed using BPF fentry/fexit probes if fprobes are the default.
>
> The provide_probe() function now takes a dt_module_t argument so that
> dt_btf_func_is_traceable() can be called.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

-- 
NULL && (void)
