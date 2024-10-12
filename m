Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47903139D
	for <dtrace@lists.linux.dev>; Sat, 12 Oct 2024 03:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728703829; cv=fail; b=u4jdNgXPkdPa05qXniiOS2KqwpMF3ZJj+ynGgjZNznLZSt9tZmZYxxixAdVMGanB7L1aeV1u4gsWNw4Fewk64fuAZI3KY7VolROkdrX+6xN/5tsCoijexxz3l0GnJQ6TpAf/KjW5SuVST42KZe42dnolvVG88zeH1OquWSEGKDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728703829; c=relaxed/simple;
	bh=OE38KqUvk2jPCNX7qmLp7gdh8a7gmRawF2CkZUwRuX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tokQxGVZxUYV2ebywr/cNsJlcMrvAOCSvsK7YfD//q1YBl8VbSfqkfSkxH+NsGkxDzIff6+kSCew8ykg2UQaD2MW1RfvQ0yvfDhgNLdBSzmt1xgWnVhWxglrSr+DwVamUxhqhLOXnmoHzJX5ZrSRRWt1DpEsHCCrhkoMN27drXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aajg9Vlg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VTkI0uGh; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aajg9Vlg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VTkI0uGh"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49C25Xlm013861;
	Sat, 12 Oct 2024 03:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=WVyIfH7WgAf6X6r5Do
	5uvJEzgQkaDtj6vf6vwQvd2Gc=; b=aajg9VlgqnscFAMbEAYrHH4HjaGBf7NEka
	0+Wt/L1pIwtBtBitFlbeaFXXydalnvOTmNYTx2rwFc+ZsiAK4edwxIGT0tz/ya4K
	ewSGre3kKPHC1st6K3i7MBpL4UGzWsoRgJAuv8uxSLwBzNmApsXF1kf6Ut1OBDGo
	eBWwBTJxkpKaYQ2BQxhsdtibR4Sswm1L3R1BOLA8oARsAp/eFFO3ypGOCEnkc44N
	3d/2s7RY80HM4pFhA5o5t0VMsgfCoN7YhDIw0fhSyM9jlqXG5gOr7BG1Ms9uBh0s
	5E0HsfB4Fdg0A7TvPIaAxCf36D+jd0yYhc1cM7raMeuq2SoysvVQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427g1a81ar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Oct 2024 03:30:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49C1XBgG013958;
	Sat, 12 Oct 2024 03:30:25 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2049.outbound.protection.outlook.com [104.47.55.49])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 427fj49nqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Oct 2024 03:30:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vm3PWg6sdZyB1EH72VAVpLnBfi9Aqjx+xFKd+Tr1Rv4trhs+hIogHLKzu3Gg/EeAPlzs8APqqBIKCSLW2YaZ1eRt/0eIFffiTGdnBbeh5eBOnH0i9D3+qgh0Vr/2VYqydG6vXbryujmqGskThLawT1/w3KonfwF1N0Ahto90MrBfEpFcOiKPLm7SOUsBT5x+ZwLScfoKXVvSikJqY+7+YTimq8Vx//e2YUvl3ZiZtY3yLirk8fPjc0QMP6bzo0EGYD8ugLpLwZOydeOIB6X/Mw1f9Cg2ojDtzMXQUdNXUhraJn5nErt0oKrDzUePiQAFfKU+5UCqu7JrFLd9QSJsQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVyIfH7WgAf6X6r5Do5uvJEzgQkaDtj6vf6vwQvd2Gc=;
 b=V4pOrWV0bcX4jy/P3073ahIA6fZKhLcFopOgkPIy9tcxY1Xtl8hN46jo8hcif4hzh8xlzO4ZGL5xj9j3vI2d+TBAvCO6cxMuV4JtPenUXFZ/11GgUEu6xSUhn2WCgXjHXrp7usScLYfsKvk4Tzq+8qKTY+l8iJa/M350b1cqUPTX7NJCdk0HdYoabbzq0SKwBb9LeJhjyRS3znnHxIeHCaNwrumfUkhPqzi1wt2LvNFxXXASOnXU9nzZfhef8DWoyEOM3ab6FF/AQmfKDehiXSqLY9F0pLSzqVvyz2saqDWBU7DLI3TieJM5jYSYlM8GattTATTxi39o8SgUnTs1hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVyIfH7WgAf6X6r5Do5uvJEzgQkaDtj6vf6vwQvd2Gc=;
 b=VTkI0uGhtWxmZq0SC5NT00U0FlAOSMvWrOwMf1ojSALASuiOeRVtDQEDu3RW2N3pbzNYJ6Aq4kMmBhd6SCKJ/CYtTw+vGv1Xu4HWdyextF9jdwjt7eYkud0Fz27u+rfy/Cae8tVh5ivRMWcVZ/25lBCnIoX1QKbspjjKrLxs2lo=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS7PR10MB7132.namprd10.prod.outlook.com (2603:10b6:8:ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Sat, 12 Oct
 2024 03:30:23 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8048.018; Sat, 12 Oct 2024
 03:30:22 +0000
Date: Fri, 11 Oct 2024 23:30:20 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Sam James <sam@gentoo.org>
Cc: dtrace@lists.linux.dev
Subject: Re: [PATCH 3/6] test: awk -> gawk where we use strtonum
Message-ID: <ZwntTIoFuKtwlLOk@oracle.com>
References: <7a1c6618639a057dc267d2e0dc9c9d8afea6b0b1.1724962546.git.sam@gentoo.org>
 <469de3f6038706e4589a497400090368c301c740.1724962546.git.sam@gentoo.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <469de3f6038706e4589a497400090368c301c740.1724962546.git.sam@gentoo.org>
X-ClientProxiedBy: BYAPR11CA0102.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::43) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS7PR10MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: 892cff76-57c4-4dbe-a057-08dcea6e3482
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xzjR569nE6xU27NVRbQsDl47txNzVngGygnS3iqhwd2EVAIuYD7cVAzWKCt9?=
 =?us-ascii?Q?ymwQPTJ1GDvX/Z+ekRlWNPyvYie3tl80pb9xX4YJq2YHbDbFDBYqWIHFiD3F?=
 =?us-ascii?Q?Lv1TDOgXsF6Hgfkxp6HOupbnkG9fu+5vbtb1EZmvYFi6Mdu870kO/km3JIVL?=
 =?us-ascii?Q?j2Z9V3WfSD1Gi+eCBh+S/xixNKuFDdx6UbASVzCTtbrwvSzhKlxghZ5smpSd?=
 =?us-ascii?Q?/Zxo9KfEvX1Y2Xz2K/hGuMtuzLCrljguo6SoODYZMJ474fv0kNTFeCpiGDaV?=
 =?us-ascii?Q?QiRZqUXS6JLFRtaE1OdUceSua5hhVU6BY+DB5zxjanhheWYvf1p1LHphto14?=
 =?us-ascii?Q?YkkvUb7ilhpR/lvZv7Bd6NiElblZkJ6h9OzW908HLV3NQIWFO9i5eCIXfU2K?=
 =?us-ascii?Q?y25tSG3spN5XEFVHrrs/H47GK0v0Ved+IF+u1WBASEZHB2rWYiag8RUpJnFp?=
 =?us-ascii?Q?KQ0iw7V7B7IthippMaMGCLkq8mrnK7NA4LIIirN7XhRDoe8s8Nu7Xz219HJ0?=
 =?us-ascii?Q?UiHmZassSiIGMH4mufX+2a5slPMzHS1pYjq66z1MP+kJ1O3tii8N9rrd2vwy?=
 =?us-ascii?Q?ZtzpaAHv6sfCoHH/hYUarGDEL7EcBEiPXVBHfGZV8Y+QoKiARqv/Gw5ipkyx?=
 =?us-ascii?Q?D+ezZAoSK4iocV0DRztCUCsl3sC1kxaw4lSRUh5fo++DFA0ulQ0Es2n+rFqS?=
 =?us-ascii?Q?juMis7yUpddzs5NHF6x9z+doZdvT6zkr4nnyjC83rtpw4hJ2ESQBbuNQ8Xxy?=
 =?us-ascii?Q?mYH52phtJfOD6MosNPdAHH6e8AuMoHwbjdnnv9WQqIGCki+B9B5WJDdOPXiw?=
 =?us-ascii?Q?XwEb+RxLVf+i/dbt/7btp5SYKXuH/0agz/s+GBAFpZGR1BKqnpXoShYukx6L?=
 =?us-ascii?Q?H8dI98tf1LUkGFLj6HJanxlbT5nz6NZUOikt6fBlIKQWvzO7SEgMZ4OVxJgg?=
 =?us-ascii?Q?f4NSjhzLJBGEIrEdhbTJFI2ydEREaq2Bdh1hltuZSH2ydkb7/j+mhalrPK/g?=
 =?us-ascii?Q?5oI4QjTfebV8kfsPXgI7krGoWH9uo/Z/EIS0afMuG7qBp4Lb0MGp/FTEJfLS?=
 =?us-ascii?Q?k3BiXSDR1fnfMg4DOxUUdWLjyUs/1Mpe/WnEjTtp7/gVLf1aLrw1I7J/t0NY?=
 =?us-ascii?Q?ZTv/TELoL2xLMK3O9jvo5aFsX/jO2+QNWIxXMwkgmV/bV7ty9TRwQLaex9IO?=
 =?us-ascii?Q?ycu5xQcbMdmGwFpTCBPmqp2Os11XfkVyDZ8RQ9Rfwp8cWMxvM6964P/zQV1D?=
 =?us-ascii?Q?/mdo3Ymor38vlFS+OOvj2rlQL1W4jysROL/CMta2Pg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wSOtBVdLrhirhSakFK9Pe4l5JQaBCwFRgXA9O9Vf+MiSKy5X+CuC+XdNQAv6?=
 =?us-ascii?Q?OLbOU2FGiIsOSc0Fp5dj+cFx6PWx4MOp92rzKiwTJWAMLT+cUEl6LmOzCpzi?=
 =?us-ascii?Q?ZoIKaJxtiPxFn75kpjKkf7hq7x4Efah+iXhcL1p6rmBzrBKWJFn+eXiMI2s1?=
 =?us-ascii?Q?gkeTuKN1PwVvFIgdifAMBLHAezeU59eqkS8muBSM1b88seX+AxeiTy2yUXmW?=
 =?us-ascii?Q?9741DG0pYrjPmvBupmLMUCJXTQTWOPkfRHJvFAaxsDLI8EjcB/rOZ7PKPVaU?=
 =?us-ascii?Q?QriMTMst7kYLMa/8heFB3etoDqX1eanv9a9z/rao/vZiEXOk/dPG74jx/csN?=
 =?us-ascii?Q?KKURbKwHXwsyxqp1wSzDIRp8F741S5c7P5vnkVz/0J93m8HXUkbmebDL4uOR?=
 =?us-ascii?Q?aLupSgy4UwmuT/gbQ0UeAEj51GBHepaXnTwzBhhhiVpeya1ascUb0Gw2MtnM?=
 =?us-ascii?Q?CwmDUSfzvjCeZ2whFLn7gvOSw2yoq8o4290OsZ3pYN8YLtj1kY3jlc4afsUz?=
 =?us-ascii?Q?y3M4v3PLbBayr0vNdmM9iYCBaSLDQJMDaZK/UunYMg/bh9SE0zVcGe348ZiS?=
 =?us-ascii?Q?WKzSkEa5xj8XFNVu0DLS3kwqRJRz0meHsoMxsh9WTNqkkz99GT1NN3OMIrmz?=
 =?us-ascii?Q?tT5/BchT7KxFFbQPMDGlzFSJP/VImQhvyBwj/B0JAkPwd0E4azhGk6chRH/e?=
 =?us-ascii?Q?7aaCsBPH/94jHKEn60ZlTCpikWRoxXXAp+4967hiZxOGymwuhg+LzdF4zx6H?=
 =?us-ascii?Q?2ZY522m6AsnvgiTDRr7GtU+cZRRt4mP+2JPYf33NKQFdz7zJQ8wZPQC/fS76?=
 =?us-ascii?Q?oMCYSU0oZ4oMQqDm/SfiGjMFgtnO8DXXNQb4WCO+ePPVA6KhFC3zOsBcvhn1?=
 =?us-ascii?Q?CfGdDXd3nNM4vELv/1fJTVWOKx6P+c+7MIOvCgRgloYi73dD5MuuceiSu2X4?=
 =?us-ascii?Q?In5qbhVPoWdYtSjthJ4oFh16ln00M6bjDXuwlbTb4iTYgSUs3LGvYRctF3C0?=
 =?us-ascii?Q?2uckq9U1jKwFfXyw39pHOx0OSGBS7iFJwqQf7SorfZIl183EnvXWJ1x3lH6r?=
 =?us-ascii?Q?GgFkNTXT9gIT7vJt5KV4xG857PwxbLPjxzwgrxVWpk6IPajNmN8I6Um6lmbp?=
 =?us-ascii?Q?Lm+2M+5pQmrKT8Z2S88JQo/bjOJi1x2CjvCGUkN+FzEntGxOAh+RfHNBW4D0?=
 =?us-ascii?Q?YnynQjFNcObH8fp84QbiRx5F2BjxT59c6an62FqHKn89IggUqRXzeDfnQjye?=
 =?us-ascii?Q?yUXhuR0jo06I4MbNuPEFwAYGOkiPf05o+HPDSOVbnjT//KE2rmkuKsmyPljl?=
 =?us-ascii?Q?fgnYWYhUwMPPfaGJJIwZ4ml6lBMnbv7TGYWulmaR6KhqNx6s8EoQ0vNDxVC5?=
 =?us-ascii?Q?nPQ4WadWlYT686ThYYn+3oEuLqD3wTnnrR5eeAzvbH3/1APyHtb5Wcgz1C5Q?=
 =?us-ascii?Q?IEh0q+riExGKud3C6l1D3eQw0/lhxQ8R+a/bBhBANZtYp4cwCIctvwtuRbYi?=
 =?us-ascii?Q?zcOjI/bgqm+iJj8FOfOnieu+KrUdw89bgD98BMivYM704PuVbmEyRwDUvFc0?=
 =?us-ascii?Q?hk0Z8SIvki9d9DcAkksfLAINdHCrVzteaoEIWEEOFQxwMzL0n9ocTmk8s+uU?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RxySo0cGDJL4/6DK6ZCZGKH6E5iME3nh0K4cwgT6cgm3D+qsgqRK7moxd/YwbUcv/+8ZNuIMmfLe23jEMZYeNdgeJxjoLOnouqkO6CN6X19ONQSJsozBQaPpYAYD3+fViFEOMH75gqAu2ZDq7PRo5L/UXxk0BTe4+4mx1vG3p3h8uyvKHZtEKj968jK0lX89sq81Qv+9hv4h+0povpVesbOPU5o7SthTy2EbzuEpm5xt2wDaz2EIL0tldkYQPYNqI6aiAjiD8qoXlEljz8KvCXksOIgwWT+Q959zxhrckAv+836utjW14tDZs4xmIqMyZG44GnSafs1skQhX4eArOAHplrqNd5NcWRVYEvppP9x0xpkUapXpMAzGGo+lMMLbPwZovqgfV24Gp4MO6kvmiInP1Be1UCHkz0tp/qWA2mlja+B30GndC6jkmUmGN5EhaXGkSkrS2ynliwJMVKvsx1aBoeUkssrt365fTqXCvzaDlQjLMMztNphXl5QdoChA1NWI13SV/Qri4NyDzYfwR5rTDhkwrYlEB2d3jp/wzmzT7KJ99JhTq/J8dWB2xw3kIly46kurw+SCX2l2BRkfQijtAthp+QnePsAag75Vh5I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 892cff76-57c4-4dbe-a057-08dcea6e3482
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 03:30:22.9407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TOL2VgItOXPMBxPgXcjS9LU299BgUcuD1zchlzSN+OYDW1dZGC1COYh0Qh0uppEUd2ncffY/CIozUYEYCy3s8r8lcp9w7bMCBUikN1kL4p4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7132
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_23,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410120023
X-Proofpoint-GUID: hMKsJUJVkM3z_C2bdbh_7OsbTrEKSZ8W
X-Proofpoint-ORIG-GUID: hMKsJUJVkM3z_C2bdbh_7OsbTrEKSZ8W

On Thu, Aug 29, 2024 at 09:15:43PM +0100, Sam James wrote:

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

... and committed with Signed-off-by added.

> ---
>  test/unittest/aggs/tst.aggpercpu.sh                       | 2 +-
>  test/unittest/arrays/tst.uregsarray-check.sh              | 2 +-
>  test/unittest/codegen/tst.kernel_read_scalar_regspill.r.p | 2 +-
>  test/unittest/cpc/tst.args_kernel.sh                      | 2 +-
>  test/unittest/cpc/tst.args_user.sh                        | 2 +-
>  test/unittest/pid/tst.offsets.sh                          | 4 ++--
>  test/unittest/profile-n/tst.args_kernel.sh                | 2 +-
>  test/unittest/profile-n/tst.args_user.sh                  | 2 +-
>  8 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/test/unittest/aggs/tst.aggpercpu.sh b/test/unittest/aggs/tst.aggpercpu.sh
> index 6092bd17..2103546c 100755
> --- a/test/unittest/aggs/tst.aggpercpu.sh
> +++ b/test/unittest/aggs/tst.aggpercpu.sh
> @@ -43,7 +43,7 @@ fi
>  # Examine the results.
>  #
>  
> -awk '
> +gawk '
>      # The expected value for the aggregation is aggval.
>      # The expected value on a CPU is (m * cpu + b).
>      # The default value on a CPU that did not fire is defval.
> diff --git a/test/unittest/arrays/tst.uregsarray-check.sh b/test/unittest/arrays/tst.uregsarray-check.sh
> index b672666e..99dd6980 100755
> --- a/test/unittest/arrays/tst.uregsarray-check.sh
> +++ b/test/unittest/arrays/tst.uregsarray-check.sh
> @@ -79,7 +79,7 @@ fi
>  
>  # post processing
>  
> -awk '
> +gawk '
>  BEGIN { DTrace_PC = DTrace_SP = instructions = local_variable = -1 }
>  
>  # the first file has DTrace output
> diff --git a/test/unittest/codegen/tst.kernel_read_scalar_regspill.r.p b/test/unittest/codegen/tst.kernel_read_scalar_regspill.r.p
> index 48aa84f7..3c0e9dd2 100755
> --- a/test/unittest/codegen/tst.kernel_read_scalar_regspill.r.p
> +++ b/test/unittest/codegen/tst.kernel_read_scalar_regspill.r.p
> @@ -1,4 +1,4 @@
> -#!/usr/bin/awk -f
> +#!/usr/bin/gawk -f
>  
>  NR == 1 { val = base = strtonum("0x"$1); }
>  NR > 1 { val = strtonum("0x"$1); }
> diff --git a/test/unittest/cpc/tst.args_kernel.sh b/test/unittest/cpc/tst.args_kernel.sh
> index 23b45a7e..9d7bb652 100755
> --- a/test/unittest/cpc/tst.args_kernel.sh
> +++ b/test/unittest/cpc/tst.args_kernel.sh
> @@ -54,7 +54,7 @@ echo "summary of D output (occurrences, arg0, arg1)"
>  cat D.out
>  
>  # check the PCs
> -read ntotal nwarn nerror <<< `awk '
> +read ntotal nwarn nerror <<< `gawk '
>  BEGIN { ntotal = nwarn = nerror = 0; }
>  
>  # file reports 1:occurrences, 2:arg0, 3:arg1
> diff --git a/test/unittest/cpc/tst.args_user.sh b/test/unittest/cpc/tst.args_user.sh
> index f7b13dde..16feddf3 100755
> --- a/test/unittest/cpc/tst.args_user.sh
> +++ b/test/unittest/cpc/tst.args_user.sh
> @@ -58,7 +58,7 @@ echo "summary of D output (occurrences, arg0, arg1)"
>  cat D.out
>  
>  # check the PCs
> -read ntotal narg0 narg1 nwarn nerror <<< `awk '
> +read ntotal narg0 narg1 nwarn nerror <<< `gawk '
>  BEGIN { ntotal = narg0 = narg1 = nwarn = nerror = 0; }
>  
>  # one file has the PCs that are in the inner loop
> diff --git a/test/unittest/pid/tst.offsets.sh b/test/unittest/pid/tst.offsets.sh
> index c0b23fa9..63344698 100755
> --- a/test/unittest/pid/tst.offsets.sh
> +++ b/test/unittest/pid/tst.offsets.sh
> @@ -85,7 +85,7 @@ fi
>  # hot and cold instructions in the function.
>  #
>  
> -objdump -d a.out | awk '
> +objdump -d a.out | gawk '
>  BEGIN {
>  	pc0 = 0;	# First PC of loopfunc()
>  	pcjump = 0;	# PC of the jump
> @@ -142,7 +142,7 @@ fi
>  # Use files pcs.out and D.out to check results.
>  #
>  
> -awk '
> +gawk '
>  BEGIN {
>     # Determine the expected counts for cold and hot instructions
>     ncold = '$nouter';
> diff --git a/test/unittest/profile-n/tst.args_kernel.sh b/test/unittest/profile-n/tst.args_kernel.sh
> index f8582fc3..c47f699f 100755
> --- a/test/unittest/profile-n/tst.args_kernel.sh
> +++ b/test/unittest/profile-n/tst.args_kernel.sh
> @@ -49,7 +49,7 @@ echo "summary of D output (occurrences, arg0, arg1)"
>  cat D.out
>  
>  # check the PCs
> -read ntotal nwarn nerror <<< `awk '
> +read ntotal nwarn nerror <<< `gawk '
>  BEGIN { ntotal = nwarn = nerror = 0; }
>  
>  # file reports 1:occurrences, 2:arg0, 3:arg1
> diff --git a/test/unittest/profile-n/tst.args_user.sh b/test/unittest/profile-n/tst.args_user.sh
> index 2e7bee09..1eaadd9e 100755
> --- a/test/unittest/profile-n/tst.args_user.sh
> +++ b/test/unittest/profile-n/tst.args_user.sh
> @@ -53,7 +53,7 @@ echo "summary of D output (occurrences, arg0, arg1)"
>  cat D.out
>  
>  # check the PCs
> -read ntotal narg0 narg1 nwarn nerror <<< `awk '
> +read ntotal narg0 narg1 nwarn nerror <<< `gawk '
>  BEGIN { ntotal = narg0 = narg1 = nwarn = nerror = 0; }
>  
>  # one file has the PCs that are in the inner loop
> -- 
> 2.46.0
> 
