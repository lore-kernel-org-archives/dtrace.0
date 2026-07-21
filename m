Received: from outbound.st.icloud.com (st-2001j-snip4-11.eps.apple.com [57.103.76.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B018449B03
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 06:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.76.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615291; cv=none; b=hsMz6ZB9TlMj69SHlzSICtaffeb2kIN0rkwJm6ueh6XurO8R/QNr+rrCpNeq89hAqy6F1jafVzZ8MBVR40chkR1Emqq6I96aFOTmPgnHO2gdUWKhb/JyoIFGa0GJTs4wkSz+H8RWw+kluEAd+SXdvT9mVUBg98DKlEjuG/lp700=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615291; c=relaxed/simple;
	bh=CdGEQ2w8cAQyrlciLwNFy2aoI+UiDHIc7ZZiZ3Tm+KQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=CiZzy0tepNWwsKbcHtds/ZiG25TOt8qdD1A88ies3DgTxn5P1Zw8pSjRRlQ0KVgSSMagaNUuDIbRxa2jPO02Q6TSDmjXP5dsg/agrsZVucENzG6/N2TxOmLhvzfnAHr9R3H9jjy/VJwb55N0YlxXMhg3nuLaXQ7WC2EhVw5wTSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com; spf=pass smtp.mailfrom=me.com; dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b=T2urw46Z; arc=none smtp.client-ip=57.103.76.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="T2urw46Z"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-20-percent-2 (Postfix) with ESMTPS id 80E1818000AD;
	Tue, 21 Jul 2026 06:28:06 +0000 (UTC)
X-ICL-RepId: 019f835c-36a7-740c-a059-fa949c4f5d4f
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQFKHVwPWBxEDlYKWRcOVk1dF1wPdwZXXloXXk1RDw8dXFZQAlpLQBMEShMFUgddTVYNRw9YHlwUFwtHQ14IXh9MHB0OWAYSAE0KDjYGWQVeCVYDQwU2EhRdRV4IGQhdHRkVWgkKV3Q2DkpyWHNdHzYOSXZAA1kLNRRBAl8ERgU2ejtxXnZSBjIPTXMAUkVRH1RGExlOG1dNUBtfAkIP
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai; t=1784615289; x=1787207289; bh=oglpmgUotUZoJ4d/zESsSbji1RbChh/tme270vOn8aI=; h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme; b=T2urw46ZU1SSf26oAcsoyGrgorvn5vl6/xoOD+HTAbdVEuhkHaWGSkmM6TciXessUC3xOouICVTiHYEOUuQfftbTklxEOkoSVf5MYsNylvuCeU9nKUbzYc2zni0cIod7h0Nui2U4r/HUqvfPEruElOyXJBZhrsyRM5nZRuS4WYyGMOr4tYppG8LjE9LAKBPduLaiLI5L5WEolI9CA5JbL7afq+mxEeruW+E/0fesYj6HHw7WYBA8kcsVBmJAmBrjY7wmG6ZNvlZmHJN+KhNOS2SkydSkxBLpTSsQDU3Lz1om/E4MqbcjQ/tE1nMDf2V55rbwWnpvIRxTjPafpVxEew==
Received: from smtpclient.apple (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-20-percent-2 (Postfix) with ESMTPSA id 771441800108;
	Tue, 21 Jul 2026 06:28:05 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3895.100.17\))
Subject: Re: [PATCH 0/3] Fix DTrace on modern kernels and in containers
From: Jacob Carlborg <doob@me.com>
In-Reply-To: <al5N7owh36AfStjS@oracle.com>
Date: Tue, 21 Jul 2026 08:27:53 +0200
Cc: dtrace@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <FF72A5D6-F71E-429E-9123-7FCCB3A94B65@me.com>
References: <20260720133100.77573-1-doob@me.com> <al5N7owh36AfStjS@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
X-Mailer: Apple Mail (2.3895.100.17)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA2NSBTYWx0ZWRfX/6Z/MsIfO7Bh
 4RYrrMWZdQPUfzmRTyZjMZYBkRHFuXHk1W+74nI4SRcF+cMFfYmavNLIV7VhxzQTd5OWIux7A8u
 CN2Ujs4S6V7Qpdv3MoAVKKMNYVBohK98lumXwW12AoD3y1kClYgnl4HiKrtV2qnvd+JICz+/rkr
 zIBQvAhCKJxOqVq7dy1LuSXb5tk0vADexYVZSVsal86sk1VouqgBugfDOX+zOWFzxwa8/muKhpF
 c3I3PiuQGNupaSlzDLo5f3CJoRJcwdhsn3+6wedwoD2Eio/iPUcsJOKl5wMhAYmFpAO9WHyBKKH
 9CCnnYztjM+THiitnwh
X-Proofpoint-GUID: zERQUStYiG_zSNCmPsnMWG1w18I_14Va
X-Proofpoint-ORIG-GUID: zERQUStYiG_zSNCmPsnMWG1w18I_14Va

Another thing that is not working due to containers/namespaces is this =
common filter pattern: =E2=80=9C/pid =3D=3D $target/=E2=80=9C. It has =
the same problem that `pid` and `$target` are evaluated in different PID =
namespaces. But I thought that was better to leave for a separate =
thread.

--
/Jacob Carlborg

> On 20 Jul 2026, at 18:33, Kris Van Hees <kris.van.hees@oracle.com> =
wrote:
>=20
> Thanks for reporting these issues and sending patches.  It ceetainly =
highlights
> an area where our testing is lacking, i.e. containers and related =
namespace
> issues.  That will need some attention as well.
>=20
>=20
> On Mon, Jul 20, 2026 at 03:30:57PM +0200, Jacob Carlborg wrote:
>> Hi, I've created three patches for the issues I've encountered when =
trying to
>> get DTrace to work in my environments. One environment is on my local =
computer
>> running macOS ARM64 using Docker through OrbStack. The other is our =
Kubernetes
>> cluster
>>=20
>> Hi, I've created three patches for the issues I've encountered when =
trying to
>> get DTrace to work in my environments. One environment is on my local =
computer
>> running macOS ARM64 using Docker through OrbStack. The other is our =
Kubernetes
>> cluster in the cloud. The first two issues are differences in the =
Linux kernel
>> compared to what DTrace expects. The third issue is container =
related.
>>=20
>> The OrbStack environment is running version 7.0.11 of the Linux =
kernel. The
>> Kubernetes cluster is running 6.12.85.
>>=20
>> I'll be honest, the analysis of the issues and the patches are all =
done by an
>> AI. I've verified everything manually myself.
>>=20
>> Jacob Carlborg (3):
>>  libdtrace: resolve BTF type tags when importing BTF into CTF
>>  libdtrace: derive io provider dev_name from the device model
>>  libdtrace: match BEGIN/END PID in the tracer's own PID namespace
>>=20
>> libdtrace/dt_btf.c         | 20 ++++++++++++-
>> libdtrace/dt_prov_dtrace.c | 58 =
++++++++++++++++++++++++++++++++++----
>> libdtrace/io.d.in          | 17 +++++++++--
>> 3 files changed, 86 insertions(+), 9 deletions(-)
>>=20
>> --
>> 2.50.1 (Apple Git-155)
>>=20
>>=20
>>=20

