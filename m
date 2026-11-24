Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.187.191.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526724;
	b=Gk+9Po1tMVi7uymtC6b8vSKuX0otkoNFlXmYDxvvbx37EVzZx4wFgBnQ3uc1T1YNguDR
	 G9AIwHGqnRknxUdSa+D/kfEn72cH+qbdbwkgEf3VD8xjJhiyKIK+O7kuy5pKUwJ5izjXo
	 Au4M8T2Cy+oB5TCEKAqiFmuFnaHK1zssknjzNcVQ2pmalJbmJEv8odqX/zI0Zm5ekraCj
	 K5hz9Lf1sfB7uu4I9cskiPE5GrM8O+mXbcMBIJazmEMcOcVqM2Z81DYFotQOVYwC5rkCI
	 EuHYv4dvMZkZpB35zSJlZW5vvQo1ZKNJjhcIFC0MClgjY7yzLLPhMWrw8Fw9nME3ufw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526724;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Emacs:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-DCC--Metrics;
	bh=MBLlG2B9X/Z5GhtzC2VccPsN0YI7mLoQLHiosCK3h8s=;
	b=fz9z1m0Csdh4BSq4su2OwV+d2Extp/Q0OOSPso9tSOgmLBQt3IzNqSCCz6ZnFSw6WsgT
	 Ta/GW5t8AJZ1WnUeT1VMKWXrDb3BeOapgzLkbhkleS3a/WjnKIGBfeW0YVuk2b5qjg9DY
	 WmiTz+lXMNi7Kvn33nDPnMsv+PGGiJpRRdoqILWJxHv9pBS9eq9nqJnTV4sTPkCT8zy5c
	 nwG+ASNHrUn9GLIxsgdVdtb8rsZJcVHMmfExHm6tMIdBG1jDQ43TSSdxONn8d/a+RJC/W
	 7zMAOPamPC4AhqZ2sY2nOWBUapfJDLoSexEbgBvej2e3t1+Oszjca4lV3JMJVgev+uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=esperi.org.uk;
	spf=pass smtp.mailfrom=esperi.org.uk;
	arc=none smtp.remote-ip=81.187.191.129
Received: from mail.esperi.org.uk (icebox.esperi.org.uk [81.187.191.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB637606A31E
	for <dtrace@lists.linux.dev>; Tue, 24 Nov 2026 13:25:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB637606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=esperi.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=esperi.org.uk
Received: from loom (nix@sidle.srvr.nix [192.168.14.8])
	by mail.esperi.org.uk (8.17.2/8.17.2) with ESMTPS id 6AODPBBb019888
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 24 Nov 2026 13:25:12 GMT
From: Nick Alcock <nix@esperi.org.uk>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 14/20] test: detect strlen corruption of strtab rodata
 and zeros
In-Reply-To: <au5GCEkGWGdhNZDb@oracle.com>
References: <9a6be1ae2acce8402d1cf79e4a2e7b42@oracle.com>
	<87se1ertqu.fsf@esperi.org.uk> <au5GCEkGWGdhNZDb@oracle.com>
Emacs: because one operating system isn't enough.
Date: Tue, 24 Nov 2026 13:25:10 +0000
Message-ID: <87qzgaicp5.fsf@esperi.org.uk>
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

> On Fri, Nov 06, 2026 at 01:10:01PM +0000, Nick Alcock wrote:
>> On 30 Oct 2026, Kris Van Hees verbalised:
>> 
>> > + * ASSERTION: strlen() must not overwrite the IPv6 lookup table in the
>> > + *            rodata block of the strtab map.
>> 
>> ... I'm not surprised you didn't spot this. Who would expect a strlen to
>> overwrite anything? But now it works via dt_bpf_probe_read_str, it's
>> writing into (a temporary entry in) the strtab as a side-effect, with a
>> STRSZ max...
>
> So, R-b?

I forgot to say that :)

Reviewed-by: Nick Alcock <nix@esperi.org.uk>

-- 
NULL && (void)
