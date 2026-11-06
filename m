Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972535;
	b=CGTiLiXR8Jx4M3quRSfDgknomEP0KCrJDzXnpcEBNhMIJYG8koPMDNmY7FP9vvZWNldJ
	 wfht5iFgPQ3LUg5EFqCYBxHkOCE94sSNxA9leeLCe3Qi4Yf6P1hm1Z5lkgp6C9nDPYcIh
	 NOS/UZo1rTnMZTHR+VF1fnnjxuVpexkO7t8XK2PxRQPbS/2W5ekwPYj10vnZmsdiYSSFf
	 HHCoThXp8wUk5D5noa7NGjAax+qwgPhxMmLabY3HvRda6xGMEFHLlgg2nigpDnxgJuTTs
	 S2g0uXhvW8AJVsgXbHb5A+qGI7Q4ZpygjfFpuRLnaYu3EGKSX/DtAiiqQmOc5ibR5qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972535;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-DCC-wuwien-Metrics;
	bh=04FcpDayLw9yUhGDlt9CqjnCpl8CnQ3OPLUNzxoGV0o=;
	b=JTCsyw+KAJo+vHqy254XZnqeQ8l012WJwnrLL2xDZoLQ7WDo7HY8jOS9y24Rbvd99OF/
	 Na0ppOzkIClbzhGaLnqN10sQlwxc/9ehwsozzyrwlVI7TiMR+kMQTxvSmEmq4fW+tuI9b
	 yQjU+7OK33H/RJGueWChm4GWVTJBcRB0vaMvLI0FdOeRsdc6eu799drUklA8Btdgb04J9
	 AIsERL9MgnwprqM/1KMAJDC49acoz7Wq4pSa1F/qDkBVEuALRVql1Q4Xs1FQyPESinMvH
	 VRZiWeXx++Hi4J0t4bilaF/qhS549nO2LtQ94EXL9HLBXKt2J/Xb6v6WX4klD8UlRPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D06606A329
	for <dtrace@lists.linux.dev>; Fri,  6 Nov 2026 13:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03D06606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6A6DgBDs015903
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 13:42:11 GMT
From: Nick Alcock <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 20/20] test: ensure expected output works for older and
 newer kernels
In-Reply-To: <463fcd5adbd3fd710d2579b5873bb6b5@oracle.com>
References: <463fcd5adbd3fd710d2579b5873bb6b5@oracle.com>
Emacs: resistance is futile; you will be assimilated and byte-compiled.
Date: Fri, 06 Nov 2026 13:42:11 +0000
Message-ID: <87ld76qdos.fsf@esperi.org.uk>
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

> Older kernel BPF verifiers report -EFAULT whereras newer ones report
> -E2BIG.  Support both, and also make the tests more robust if code
> generation might result in a less predictable jump count.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Hm, this only seems to be loking for *some* error now, without concern
for what it was. In particulary it's not looking for -E2BIG at all, But
I suppose as long as we're looking for the bpflogsize error message it's
OK.

Reviewed-by: Nick Alcock <nix@esperi.org.uk>

-- 
NULL && (void)
