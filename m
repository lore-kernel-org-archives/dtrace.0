Received: from outbound.ci.icloud.com (ci-2001e-snip4-10.eps.apple.com [57.103.91.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B808131326B
	for <dtrace@lists.linux.dev>; Sat, 11 Apr 2026 11:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.91.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775907263; cv=none; b=sNyiWtkWNFdugTwfoRZAsLnr5Zbvsoq8LRZBM3+jC3FyUI+RgZIaEY2cHVVdK791qpYfwTsOBrJfyTLmvV++Cp6e/L5XrsYLt7N5R1BDizP4L7tVo7WjeJ44uzxaYpeefzyamsI8AyuMCi50NioXP/fOI/6D6WAiVOFrvHGOWpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775907263; c=relaxed/simple;
	bh=NAkFU/5o9QndFk+rP22fUzUJCmjC4B6BPWHZewlP0dU=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=qJjx4GmDRfwVhOfFpe58AW8620dPUH8unTARuGHnbjjzcaA8Jc8e1Oibfe8tFW8MTxDMkOUdAGC2Lp2eKxIcSo5xTvuktLyu7zH0VnWbyUpvxEPkoWsoc6VTT2o8SJfD1Nuwm3cjJuNAVIoFKLMqFlmDXcLPsxoHm/eGtBJSvzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com; spf=pass smtp.mailfrom=me.com; dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b=UQ7XOwG6; arc=none smtp.client-ip=57.103.91.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="UQ7XOwG6"
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-60-percent-3 (Postfix) with ESMTPS id EFDF218000D7;
	Sat, 11 Apr 2026 11:34:20 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai; t=1775907262; x=1778499262; bh=laxvEDxlxxY6fDwnbaA6vGlINm/Bd4799Mba5w1bnNw=; h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To:x-icloud-hme; b=UQ7XOwG6ZzsRxHYD+r1O5mGwR3vC20uDS8W2heo++YlCQL7xO5cVI7XgjAFyKNDzNiqTnueNFABxUXAOqQDTbFgiJ4EcmVje5vBGIvrmKv5JO6G9k7IcT/HX0UdjqpYjLyi1Or2DGUmVXtE/Cjn+O0Wxb3uS1G/zoIOzUhX01CZa1giC2TRp+dkHeNBRFr+adxWgMmc4IosE1ZDOGUhQl7LYeW3NM76XJrqVZ92IiX1lVahc6Y43LEYfmzB3ohJxrZcVM8BA68CgDk91OTfGk0l2aNsxew4OsAWy5WR6BLLMOcqSqPykRooBoKbTLUmGU8bBO6J9sDgNTafy1Z6W6A==
Received: from smtpclient.apple (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-60-percent-3 (Postfix) with ESMTPSA id 4C33D18000BB;
	Sat, 11 Apr 2026 11:34:20 +0000 (UTC)
From: Jacob Carlborg <doob@me.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.500.181\))
Subject: Re: Running DTrace in container
Message-Id: <C2504E71-129D-4E2D-92E9-9AFC9DE155E6@me.com>
Date: Sat, 11 Apr 2026 13:34:13 +0200
Cc: dtrace@lists.linux.dev
To: kris.van.hees@oracle.com
X-Mailer: Apple Mail (2.3864.500.181)
X-Proofpoint-ORIG-GUID: vo4DosLa67LM79nDooTlTnCkCvBPT-UD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDA5NiBTYWx0ZWRfX98peK/XJx8Ws
 SRcNq1uBG6mKVFECPWqWf2nJ6Cai8uwXMyvDHrOGIdKICiwDP7NemmqLRJjamGRbAfHJgbgwz6Z
 wCF3a6JyghgAC5J9xuK9lEp3qZCk9478GP9gn8yevPWhse844TwAQHJ4QSNfOm8CIgajK+bJhz7
 RUqh6K3eouBonwQ9lk2ht/puuHvVoYN98HmKPZ5RyaEaeeLX0Ngti3aqlVGWI3rl5lB5Fe9rb5k
 dsJ+zo13JZWSrlmvQcoKpACoKl9nmcuBNp+LMcaNls4C2TID5/rbFspUnDKyfFV9NRd8VgQDT8K
 ABBPb5DTrAbRPyv/ByuRyBGm+EPnf6TYQUNoUUQ1WSpVKYwcJHX47fMYh0FtAM=
X-Authority-Info-Out: v=2.4 cv=ar+/yCZV c=1 sm=1 tr=0 ts=69da31bd
 cx=c_apl:c_pps:t_out a=2G65uMN5HjSv0sBfM2Yj2w==:117
 a=2G65uMN5HjSv0sBfM2Yj2w==:17 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=x7bEGLp0ZPQA:10 a=bRQJlwi_ETYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=LmXh4-OarUAQhfsf7PgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: vo4DosLa67LM79nDooTlTnCkCvBPT-UD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 lowpriorityscore=0 clxscore=1011 mlxlogscore=999 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2604110096

I apologize if this message is not threaded correctly. Apparently it=E2=80=
=99s not possible reply to multiple e-mail addresses with Apple=E2=80=99s =
Hide My Email feature.

> On 30 Mar 2026, at 20:30, Kris Van Hees <kris.van.hees@oracle.com> =
wrote:
>=20
> The first thing that comes to mind is that you are configuring dtrace =
with the
> --kernels=3D... options etc.  That should not be needed for regular =
building of
> DTrace on supported kernels.  Those options only come into play when =
translator
> files are to be generated.  The provided files should be sufficient =
for all
> regular upstream kernels from 5.2 up to the current latest upstream =
kernel.
>=20
> We support those options in order to generate new translators when a =
kernel
> change occurs that causes the latest provided set of files to not work =
with a
> new kernel.  That is thankfully pretty rare.
>=20
> So, I would re-try with building dtrace  using the following configure =
step:
>=20
> ./configure \
> --libdir=3D /lib/aarch64-linux-gnu \
> BPFC=3Dbpf-gcc BPFLD=3Dbpf-ld

I gave that a try but I still get the same issue.

> You also should not have to download the kernel source tree or =
anything like
> that.  DTrace should operate fine without it.

Aha I see, the readme mentions that for building, the kernel headers are =
required. But since I=E2=80=99m building this in a container, the =
version of the kernel will not necessarily match the kernel that a given =
distribution is running and therefore I could not install the kernel =
headers from the package manager.

A related followup question: when building DTrace, is that tied to the =
currently running kernel? So if I want to use DTrace on different =
versions of the kernel, do I need to build DTrace once for each kernel?

--
/Jacob Carlborg=
