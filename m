Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4DC242D60
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 21:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762811457; cv=fail; b=jBV7VCm7iIErgC4KqtLSOU7Cxx328Qz958ll9HcQm1BdyLG7MJNLZfLRQtazTD9eNpdZNhqmcudb3Deqjsc5+GD40DQw+fx9weaidbv/Tm7W18/Vv6opwwsNcgS5UWkkpJ4agyc0i2Njuse+JhLZlD5HEJyYCbSz9kpaeO1rHl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762811457; c=relaxed/simple;
	bh=ycB65+i5cr215kjyBfPNGjAy37jndUrHRM6RyGg/NiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ucr38fEkJSRGN2UMoOXW1wrem9QN+6n5XmtGtU3zfer353aTUXazIlItPue92ww42jK4IWQDSenSSx+8VG2KUwPCG66lVAufmsJhQBgNv2U2DEHfwKoe/N9H935zZcoa2y61XHKv0yNqLKuzml1AwLkJftvwFp5/wdDYk0+n+eQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QiVnmkdr; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rBg9oBXE reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QiVnmkdr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rBg9oBXE"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AALebnr001917
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 21:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=28iUTDNaExdnVpW3MwG6rEaDEBcffDfXpiHjX5GN2xE=; b=
	QiVnmkdrOHYCfv/cxRX9V8NlQ6N3cMrEnc+CKtrTxbZbj7tNfHLaUFrS06YmFq6z
	PnRAX+Jntbn2xQ4dpIxex6yilOBRCTspBVp5FR+o59J8kYa5JnZzs1a1CkOegTOX
	+xiFI7QxftDEdklyrU9EUwTv7xp+oReSj9k/5+J4DlIpFCkPZtqWFxE2LRW20N9x
	X7Ci9FmmhlXH0eZu4SUhK3kmdgdsQlQ8Ef7OaeDHzfGwDBYU2STZsqPOfF7B+W+B
	RexLzTb5QMCRqTlUzFYbOY9YtYVLH/O9GUYwMdxVyJv9AOVVHOTalwiYDY9J8AA8
	r2LXGRKQxRioWt6+A9QIZw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4abr5vr0h8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 21:50:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AALHSOW010123
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 21:50:54 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012068.outbound.protection.outlook.com [40.107.209.68])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4a9vajg7bb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 21:50:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W6lvLS/og8zBmLePNeE9+d71LUQOzGfMGTjQ1v6mWut2KFFXCvOqWzh7+8GNyAPPGoLlokOb7eGG/nLZeRl8Mkpd6GaYM9bxIknr1UWUF6oGSA98GTjm92zYF2Vcn2hHifCnZoy38Ycx5ttjP8NE+uOPLscqwbv2CE4WnKYw7TEFphDodPD0M+qdaF2a0ovvlX/rUs5cVGeHNs+Kh/oHKCuAdgD+TuTcJ1P8y+Jr4ggn5PthDLXO299SfQunGloN9Y7l1KMJtTdaumZokAbjriui6YVRAeeLnk4kwMXLVqiad5WN3htyzSQsT/ZJJXE0mDdOvXSQkJGrVZYzR8Ru+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpvqXS3+VPHFHz4AVpZsu7rTA9TkoStBCkzBSg0uyCc=;
 b=hflrUlPjxkOtzmpbs4kWtu/784DFG1x/FVus1FDFeQT3S8zbvvTbNhKGQWa77tbu2W3G0RTcB80hlBzLdnHsFYDdkL0TDKLfkVzDIkDJ4lumlKO6Zraxm2a67IpK43pffH7h3ggczffz0Gd2/WrTjLv+d13wquKoFIQs3dEAzGDALyXW4aTVVzLMSr2P8eiYwTO02T3gSwgmkxUld+MI2bkvwZnDKiqqFTyok6OSC6npSPrnxty2vHdGOZB+y4CHzzohjBoIsLj2dikk5ti4NUm6jDwcDD95iyb/AHeACQKEO8XNLyi2vFw4KkzP2DyaW7dtjtEovsrEBFGPOQtqxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpvqXS3+VPHFHz4AVpZsu7rTA9TkoStBCkzBSg0uyCc=;
 b=rBg9oBXEEJkoY+kefiP9RMUPy2zTSmnAv7SWe9fEPftK2rjHhZpGC7H8pi7xBxDrThF8VC7rRu5XYC3vM2vL96btGM2+RHU40O1jP8UeCBkL2nt//wxNlMXWHP26FgHgwTNc35jwiUOrXGxIWOD5eWDjvoxF1v5RX9KXPsDfYyA=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by DS7PR10MB7228.namprd10.prod.outlook.com (2603:10b6:8:e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 21:50:49 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 21:50:49 +0000
Date: Mon, 10 Nov 2025 16:50:46 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 1/4] bpf: fix file descriptor leak
Message-ID: <aRJeNgWCKtzCfPue@oracle.com>
References: <BY5PR10MB398729B40B695D3F3B541D3DC2CEA@BY5PR10MB3987.namprd10.prod.outlook.com>
 <cee8efa1-0b4c-77bc-ebfa-dcb0684aa6e9@oracle.com>
 <aRJWg7pNBqBytP43@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aRJWg7pNBqBytP43@oracle.com>
X-ClientProxiedBy: BLAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:36e::7) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|DS7PR10MB7228:EE_
X-MS-Office365-Filtering-Correlation-Id: 75c65097-5ee3-4352-28af-08de20a335ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?/PxA8I8AS3cS/TRmUsgv5MqnbAScYe6Vxj/ztqK25ojQ8X7GgJNQ7YV58L?=
 =?iso-8859-1?Q?cJN7UfdWS4eMTf7xXUF2gKHNyRThKRrz1WRbG8+lu8hgdxI0kTAE7PWpkE?=
 =?iso-8859-1?Q?yONxl+/uob4zHiM0HbJaIRAYoaUI9508CNzYz9ZwDjhUIVpE1/AcaSkZFa?=
 =?iso-8859-1?Q?xPxRaBLkfEoBCCUsAk0ABlOjxfkWrdUFtS4EYm/trl81tgeUPDFZPaiXOs?=
 =?iso-8859-1?Q?6HiKu0q5/D6I+3cBEUMBD9yf84F/5XbvcQAsaIrBSridA0m0BWkm492P75?=
 =?iso-8859-1?Q?MCBuSBuJ8UM+W3HtcIbkxdqEMe7lgTL0ebUuphqYymTsnfvfYbgBUSeUEx?=
 =?iso-8859-1?Q?kYxNRhwmiOBWew9K1q3bhIL9ZfTo9NYNpOmUQClU9JmhQP2zAAp5ov+iU8?=
 =?iso-8859-1?Q?0lVo0auZORL90Y1G76wAetaYQwHAYgtvU4SN5grPqao7vNfbpPOFbv/gII?=
 =?iso-8859-1?Q?tUgri8pHqjGdOnblojTXiiiaMiIm5Rppg2sg3hoYJu5lDs25ktlNFb2vyX?=
 =?iso-8859-1?Q?WTfJW3cBXhQUp2/IKnSgxgbKk7OyAIm6JJuQHg4Sz9YjhfiQeKhH6HgXzU?=
 =?iso-8859-1?Q?oZ8XV5sZ1iKa7fiWHryAlUVI1fephqL28HqRYNbPClZUf+iXEgamxWzR3L?=
 =?iso-8859-1?Q?T9X0DHEG+OMkf9+VQ5tKPKgZFlgLGUq12+q+flBS8POnUTlzY4HE3ht8Xa?=
 =?iso-8859-1?Q?KMjxESR5tH0YIqAVQRJQ1l3Q/IGmT9N/ABHBCOeNpqgsya9OqiIPVC1SVB?=
 =?iso-8859-1?Q?yp3GGmxjR5u3eb1KYY/25w8iE3W5G3Z3kN1egmS5LkzDgXbcJlXn6Iq4l/?=
 =?iso-8859-1?Q?0kU6u4pOjBr0ONDmvEk1TWoWiaPJaobYtm7h8u/O2+JtB5o3wtNEIjkTHs?=
 =?iso-8859-1?Q?pv8x7xh5sbC7vkyalvp8YWxwzq4EfGYH0TE3JU/t7iHpJBgxdu7+N0AAzO?=
 =?iso-8859-1?Q?HS7YU7IFKzcfKCYbtsVe4B8jKQ2LGUdo1Q7at08hWcYPUv+CWW4vdDPF8j?=
 =?iso-8859-1?Q?ZmV7Rv5Vdu40RvnDsrta/eaL4pjB5u47jINPHh7kpGSKKaJk98GKiWXwwP?=
 =?iso-8859-1?Q?kOTpGEack07dunr7CizfX90dNJ+qVVietZMw017hhq+zXLUARVzgoJBR30?=
 =?iso-8859-1?Q?u1M5jxpZl1jiFF+DE1rQdxBsAcGlnEKhwkjMc13pbKrtsLySPlPSYTVCZM?=
 =?iso-8859-1?Q?1tI29Cd7fR0TwMz/lQatK3CocB1lD+mg3L4VMZT84NzAlr7xTQBqCSPSpZ?=
 =?iso-8859-1?Q?USqmMLGvqDdoWyDefLVBuu0Kqa49Rxeg9pwJSCxnhrI9IyIBEzUewn3ptO?=
 =?iso-8859-1?Q?sbt4D9pbiL2yhA682e7XlkWHshoHF8fpDSiWeS7XjAZYhBFYxgcv92gK8u?=
 =?iso-8859-1?Q?ndHqXrSZYdAnvYX75rZXqEjlpWs7xD2ut9xAttzYAztrx50AVtuLNrV9GB?=
 =?iso-8859-1?Q?DF/IouIE/tS+1A1QOVnUKft5AQfBsDbhZTHV5ArgijbO4QtMMXQNoeST+R?=
 =?iso-8859-1?Q?4Z0Nbl8LWOjRfmK58tXEzt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?QW0zCJSHmTuZbvsW5hWEH9P2oMs4CEm6bBcQPWtkGpazIm6MUkWlfLuBzm?=
 =?iso-8859-1?Q?QKM9tRhNDW1CXwqBoHMbZaDbE91EhtetM0F8qmnR4L0IbvdTec+Poy/xwI?=
 =?iso-8859-1?Q?0+VDCz/ovmOeSw5XVZ3U4XW2v0ok6zo73cdL3NSx6AaWgrnr7kJmXVi9Cp?=
 =?iso-8859-1?Q?qhl2yXDXp9/0qt9G9ZdlNyMyM+ub+EUXRTIzPAmKf42doCuTHXSO3XNyYT?=
 =?iso-8859-1?Q?Peolvj8nOqkjTL1Wg7RQOmZTuQGoOAGFDCrj8SJCgiLTgcyFqUouu2cVy2?=
 =?iso-8859-1?Q?K4VIQNtZhqrlYb9KwnkitV2ShKFKQxSxSkcyRLv/wGB8awKJK8YRuf+zwU?=
 =?iso-8859-1?Q?sJlpKZqp30AycfUbtJY5AgBqNPLgoTcJzYtdx1pdHCXrRsEn64XBRMx1/s?=
 =?iso-8859-1?Q?VkRZBpj5JSdj1Y20sf8Jbq1BkVIQ924wQPSZRU2a2Nhj9gylN0rn3P4cFP?=
 =?iso-8859-1?Q?p1h1kDx/3BCE4PyJkdQ3WGP3nXCJgxTfM1gI3D5YaXKd1hFdq5ttgWG/GC?=
 =?iso-8859-1?Q?qxmLic3KIEccFWxuwtDK5CgauCn3k94SCVe06Oy/c8mRbGudm3xRHZejLS?=
 =?iso-8859-1?Q?AkXMAXROMfE567Z7aUMN7ez0wdUhJcjbWFwJzp5pmWd6a9LsVi0s3uzbce?=
 =?iso-8859-1?Q?tszPBXr4ipNl8cNM2LxwNf1MnF9dDyTSgnCZPpoOOlUpXNaphN7NCl6BS3?=
 =?iso-8859-1?Q?Wk/dnn3K1bsCIhNohJtOpu8gwWnNROJjVyMVKJjXmHU/J5mbwkkBYJPddr?=
 =?iso-8859-1?Q?0PS8Bu1/4Qfk0qN/hanT74vyUwQneNsJ0K1D3z+GnJ9C/CGEyK2JeKMUom?=
 =?iso-8859-1?Q?61QUkcDuU02YPptXenkKKMgOvkJidM46q9Vr1rImqrkWCQsXm8c4ilRbhQ?=
 =?iso-8859-1?Q?EUyfTYAQA+33XeIAO5+X3/gh6EVlR9YainCHoPRifOPpGxKRI4N7f396AP?=
 =?iso-8859-1?Q?Wp73eDTXRu6S8gJ6CJHqHNRmykJ82DhhEWV0RfEHDBU4agCatWC2cVtS2G?=
 =?iso-8859-1?Q?JLPuNU9n8qPCIHuvezZPJbjARXaVBy6I0g8ddUgzn699aE0CwwevE3+FGD?=
 =?iso-8859-1?Q?V4qxdLWjtCapmtk6z4Dk9Jzi584YBiHB1Z50rkREq86JdkUpumNKDMY7t/?=
 =?iso-8859-1?Q?Sl7a2V35ZJhb1vqQMCbnxODMaIPXQtP0yAbUqTNYkYWc9uZIRxFU8ac9mS?=
 =?iso-8859-1?Q?go+5ZVmu5HcvUS0htuwq1vE2ThMO32Rpvkkg9Fz1ReqWd1yYsc2FBS9eu+?=
 =?iso-8859-1?Q?N+6mt/rngbuzaIQztv+9Nx6w838r9lCBNc2S+NQf8aSslXi72rMGIdQi0M?=
 =?iso-8859-1?Q?fNXFAifAHvlhzfFyRJ9CRAaQHria38tvjA+LORu9AfuFZkEx0FqMdNeUzO?=
 =?iso-8859-1?Q?EcIjUa3Tt9b1vlyM+kuMHf0XRJSF6mbBwHtuIEY5pl/6STAdWYg/x3dD0+?=
 =?iso-8859-1?Q?i/TDijZI87XSubXu7OZ+0DXSn2QRlleriPUcG1NqISjq6UdnqHXqSiDOKm?=
 =?iso-8859-1?Q?wQJttzwejh1E5q3hjmlRW6nJ5u6+OhJvvpJfSPrbsU5zYQkZ+FsBe3GDTL?=
 =?iso-8859-1?Q?dNOAjKEfmUDapEIk4ArzEsvfdIyJ/8Ks4hvGzer9EkAtgFXUgUAO8UzSUL?=
 =?iso-8859-1?Q?G8fAPQHmpQVCSpA28sDYL0DNSjIduAYnRAuRNpIoHjPkSVuvJ2ef4REQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZVNGv3K+hOaGsj/7XhZfIyT/V7coPli7mc58oyHujgTtoS/3X9x34AtY6xi3ANjPeyAlbU18T5Wv7TGKP4pJDI9BL51Pqq2xXUp5FQaxb7bU9xhKXayL5XD2dioOJHHcb2RL15NbGFJY0cuQ0CsH9rzZfSzcUEE28F9rTgB1BPdHhxPVymoGrv3XDdTC6Wv8+m7EF/d0Tc2Sx0Uabb+RZPxXMNhp++7XLPORnrzK0s6lwOsheXfSMhZ+2CRK5UTtrtzbjysHxacSUz1SOImIu2+DTO+wrUhbPmvs21lXIziyurRrB9FTW9M9Ny3TUGxkJW+8Niz6bXqU7H2vJVf6aKctvmPJybFsCbZOY7PZ8XeJS5wB5v4Tk47HyrfVfwtW3mfK+rTPqa2EwG/BsgPgH/7IxK+NQ72ztS4/htwrxLzj1C/K6m8D1559+8Z+dNhX56gmatwKLFBxPEOvFxmmS3TNGYK1sh5Zt9DOxLO+pTgxJsuO8QbgDMY7Q8DhPeowi1tApB00pxqkfj9VCFKL3Y+QdPKPqYtwYWlQ3fAgktDd07HpgvuNABoN/WBns0Lt95FlIGcGLy3if8Zkbkwab85Af4EkcJkOofpqYLGLe2I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75c65097-5ee3-4352-28af-08de20a335ee
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 21:50:49.1647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vdz22gtqhFWijuA8a6CN1hiFMKetQpJwsfg3JB1MGnUmydplCMfQRt7jXo4bb8EOlayUZVzlLVlyauY6i2lSv+rgNK/K0wcU+PvdrK2CTcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7228
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_07,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511100186
X-Proofpoint-GUID: hee7DUFEtSQ86T6N6g2louEIyJCX7Aqf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE4NCBTYWx0ZWRfX2Zeo/8Arqx/D
 /1r+mPYlgvvDB2wUWRd+rzioDf9OKY1M+imQlPeAwyujnzVMzKq2XKS4O4yp4FQlg0GJNaTWmKH
 glaiF9i1v9gMnbFDrxhgPjFX8+YxVvOTcnHRrmrXJQmJj6CM4ZOVUGIbKuoqMuaFYijhUt9FTmy
 0bHh04n3S7nZ1CLaSv/y7dIBY2H2SkVKBAakfKTp776pPqzjC++cSvgDuXw1Bt7CACvhUO7N8mX
 l30Uuj7ekmXoNwGiWj4VBgfKz48Zgjp0EiOW23KaRHvyOUnJICCNP7dJEz8OeA9lI+pFPQ5//qn
 1YXAR5cdxPzeU5iOHtuTE9YNCTQ6Jx5ak6TDT+9MEhST44k8w/07ZBeupeLiJSBXnR6w7qejBQ/
 k07FeMdyF058DKg4ELHPgsouEABJCT/NISrCjxF4MZFfDkcNln8=
X-Proofpoint-ORIG-GUID: hee7DUFEtSQ86T6N6g2louEIyJCX7Aqf
X-Authority-Analysis: v=2.4 cv=YN+SCBGx c=1 sm=1 tr=0 ts=69125e3f b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=7IRrf0MQEjPm8ZMoSrYA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 cc=ntf awl=host:12100

On Mon, Nov 10, 2025 at 04:17:55PM -0500, Kris Van Hees wrote:
> On Mon, Nov 10, 2025 at 02:55:52PM -0500, Eugene Loh wrote:
> > Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> > 
> > But I'm curious about the "if (attach)" check.  It looks a little funny that
> > we first set fd= and then we check "if (attach)" to see if we are going to
> > use the fd value we just set.  I suppose it does not matter since we expect
> > attach to be there, but normally one would first check if a value is needed
> > before going to the trouble of determining the value.  In a way, this small,
> > pre-existing issue is outside the scope of this patch, except that the patch
> > makes more obvious the one, isolated place where this temporary value is
> > used.
> > 
> > Up to you whether to clean that up.
> 
> There is a real reason for that.  As you can see, fentry-based FBT probes
> have their own BPF program load function (the reason a hook was added for
> that in providers).  That one performs the attach as part of the program
> load, so it does not have an attach hook.

Hm, I am mistaken.  Even fprobe-based FBT still provides an attach function.

However, the logic I describe is stil valid here...  the code supports the
possibility that the load already performs the attachment, and that therefore
no attach hook is provided.  Still, the expectation is that this code would
work under those conditions.

> > On 11/10/25 10:27, Kris Van Hees via DTrace-devel wrote:
> > > When a BPF program has been attached to a perf event, it is safe to
> > > close its file descriptor.
> > > 
> > > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > > ---
> > >   libdtrace/dt_bpf.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> > > index 0223764a..28eb890e 100644
> > > --- a/libdtrace/dt_bpf.c
> > > +++ b/libdtrace/dt_bpf.c
> > > @@ -1385,8 +1385,8 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
> > >   		if (prp->prov->impl->attach)
> > >   			rc = prp->prov->impl->attach(dtp, prp, fd);
> > > +		close(fd);
> > >   		if (rc < 0 && !(prp->flags & DT_PROBE_FLAG_OPTIONAL)) {
> > > -			close(fd);
> > >   			dt_attach_error(dtp, rc,
> > >   					prp->desc->prv, prp->desc->mod,
> > >   					prp->desc->fun, prp->desc->prb);
