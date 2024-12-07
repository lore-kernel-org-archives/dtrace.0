Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BDB2E822
	for <dtrace@lists.linux.dev>; Sat,  7 Dec 2024 04:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733546311; cv=fail; b=nYAzzUbbg030XzXtm80ZX5sdJhsJ9tGOMpTJThbyG6PIf1zzd7e4A6SrebwXQEorgF6P/Dhu37dCP7EjL00TkTMrluslfAKqTcvF9LV7+XVKMp9e16CZ+WF8hMpUiYB6kp9BIajLbx5Zz/W3Gu2+rbjKC/rIoihRyRCDlyrb5AE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733546311; c=relaxed/simple;
	bh=zpyHYY80iNU0SC6GyBClrXnxjlVh+hxQKzbr2uHKEY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jcXNo3y82WiQOsG9BQxDneiKgwTx0dTibldu51H3CPYeR6fiPwJoUTBfjnR5Q0tI3uLDF50wVZs/R4kXUXs0Hqp5thZQh3oML1Sv6RfKo8cOQoLOwU+B3zfXCrmQc2APfl0Q9I4zBuyezapvgYan1BSDX21T+c+6jZ52+KdLUFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FOXNzmez; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hZKB0oPX; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FOXNzmez";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hZKB0oPX"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B74Gf2M028882
	for <dtrace@lists.linux.dev>; Sat, 7 Dec 2024 04:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=Tz+VKzh4OFbeqApufU
	UUeD/hdr3ayRbfiDJSWRC7WmM=; b=FOXNzmez8oHAWFQsm4ymmKNZWyc7cySIsU
	+wG3wo/kHjrcdzqPqOSwg0dPTBdK1raj9OEJpx4N5Bxv1eE8BphlBzqnvgSg0aro
	w7vzlU6l2h3TdRtoceQaILH7hFjvZBUkt9crkjee09gjMP8LTUhMzl4WsDgFr/eO
	ftM973f4sSWhF6Y4+tczBvU0XjvnhIhfmOBP9G4fiycweiWV08z07VZS//1Zo+Pk
	NLU3QMl2Dkzs6dqzKaYhwKztSCpwSfwdpIg05Hq9FPoPl1FCE1BAfBYtx//+VSY/
	xJhE8TXmiWTdiAFAQyuIwvo3khdvDyx0O0xFH7EmeelvNyLr2AdQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43cd52849n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Dec 2024 04:38:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B71YCt6009463
	for <dtrace@lists.linux.dev>; Sat, 7 Dec 2024 04:38:25 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2043.outbound.protection.outlook.com [104.47.58.43])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43cct5ahd7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Dec 2024 04:38:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jkqC0i/4VNOnadaakNeiy+cEBORyTxi1kjFm7usUcLTeSsxGpuEwZlXen5Kf/DyuoXVg17CyyT6cGJ9wBFa2nPgTfbZJyRNHlO30nsryvG0LEaGO6gJh4rMJ+bNHXiXAwKbZHm5w8DnkmOtGnkwT6iqpdsBAQDe7CBTd2p4/gX2zv7xT2XzFtaDDriIsC4m0ax2/bIebkF/214SiXqf6DlWsCYDOft1n3AHCPNC+H250UYrw5e2xCfdMEcf/7oK8NYqIJGNTF7eP4rxgBFCdPQld1IzhzbYRrjXnPZ/eAK8P1+u//tvjUTzM3njnwXBmtYDYmz+sfmIso6uHSigR6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tz+VKzh4OFbeqApufUUUeD/hdr3ayRbfiDJSWRC7WmM=;
 b=rLAdqYcbfAG/qvCvNa3edt+K+BhB6Q/YYAKkZ+HdBm76lzoMDs8lu+kj1PShvW853MB0xGnlZedZJCprpB1PAtyd7BxuZyocpB2KQ2YyvkO96elLkWrLbqP8H2AZW55wquxoWoKbgPWWVAv0St1XXxumZlpHccAKqGB8q8Us5fi4YjAWRtfNVuGwvhdMibaMgmXnU5d6bQF3wC2kikPLWZ80fRr7Zj0dGfvVc2rKSPgNp5Fg297SHnxffbZEm0HwewJoUIzbhoCEjTGz/TtXRTiMTd4a7T7UZ2AaScAUB2HcS3Mz4DHpv1rBAvTI6OiszvGrTjeDZgbJOuEd4Xu1oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tz+VKzh4OFbeqApufUUUeD/hdr3ayRbfiDJSWRC7WmM=;
 b=hZKB0oPXBKVwTo2nEBb1K2TF5xTwaOtduNzKTBSTX3iFCbWE0ZT8yuWicE7nN/a1X+gPsbw2GusybCoMy36J4PpxNV2zvD/rutPjhY8EPsKn24B338JZCgTgysFMHDdQpueJ7AfUA1iUokT5/hFjCKA4kkgPKlzsDmo6VSSJ6Ec=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by DM3PR10MB7971.namprd10.prod.outlook.com (2603:10b6:0:b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.12; Sat, 7 Dec 2024 04:38:23 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%5]) with mapi id 15.20.8230.010; Sat, 7 Dec 2024
 04:38:23 +0000
Date: Fri, 6 Dec 2024 23:38:20 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com, eugene.loh@oracle.com
Subject: Re: [PATCH 2/5] proc: more self-grab improvements
Message-ID: <Z1PRPADq2NRX5rJ8@oracle.com>
References: <20241203113610.75104-1-nick.alcock@oracle.com>
 <20241203113610.75104-3-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203113610.75104-3-nick.alcock@oracle.com>
X-ClientProxiedBy: BL1PR13CA0426.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::11) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|DM3PR10MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: 808b9be3-a397-430a-29d8-08dd1678fb81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1bxUetfz+SsP7jk1MqEhammZrWXrg9Q5+erAx14rPRcinrujLaP0wjxow4JG?=
 =?us-ascii?Q?Yw85NyB25s/KrBss+1ZVxJLNJeLAxtS3t2Qmnkb4gquXDkcMt1Kl6Hy/U6VL?=
 =?us-ascii?Q?nlOAkzytwnmk9iooK0V1dTIF43DI0Zd/sqjygbA5n0aq+ez9iQ6RcqOx4Dto?=
 =?us-ascii?Q?BRy1BI7H9PmV0ct5zylcNmcEHCaWGQOlvjDYALV+pHOwdpwuMDAWDoPhpJWu?=
 =?us-ascii?Q?Rs0mACwWjLxlg6+HHoGT+j8CI7VoV5QSKFQA4TC5kAZDzhVfjqbMVp1NNBeI?=
 =?us-ascii?Q?r5diU4Mr2kIrw0lt6bAliyl5iw9EH0Kyz0/G5Wy9tUAkv9C45he0d34uV2Fk?=
 =?us-ascii?Q?8tHoZsSAzdTWPkwxjhpSqAo/lMNJXTAXEXvfKMfEcB6z3adh9PEgcEzXL0bK?=
 =?us-ascii?Q?YyWZkXrkJXn+sQSjPS4uau3l2EiF5ZQxWcQFu3CQKxFnllsolAlWvS6bNx3o?=
 =?us-ascii?Q?a1cjrYkkfyLA75+p9Pta3UDR5wZPuSinncjpFFgmEiL5sXO9JvstlGGCfM7S?=
 =?us-ascii?Q?Izm0Z74xvn+JtmCtaqWr6yhfrkqs2PZ3aCrC1FvYuQXATrvhq6ptQlzPnng1?=
 =?us-ascii?Q?dIcCWrEmXoZD6eJqPLDugY0xjs8P6y/2D7JtB3fxZQ2BOwIzKRsGz+gbFx1A?=
 =?us-ascii?Q?eYxEmpJ7GP2FJS1/jLlzg/6FsXKIfD0t0mbHU+exRs44xHsPiFGBKkG0Zskm?=
 =?us-ascii?Q?rLcJbWrGYn6NPeCCxc6L9Jh0jtE2IY5geC8VOyn6XHgSFD8LG9Vg3C9BcRSx?=
 =?us-ascii?Q?nsCpjV939gvxwI7BP2whKOXAoJ78UAekpto/5vRocSejH+m2V5mO1Q6a0cio?=
 =?us-ascii?Q?6vcqoJmWjr1+co4ObluLuIbAtvc0wc6jbrcP8ppwMAo53eneae7NOyt7rGBc?=
 =?us-ascii?Q?vVFV/pj0SGtKGUlUkFQ0MSgYRIIh3lMmDQm7q+G9BX7SW1nQyeACLNlsb74k?=
 =?us-ascii?Q?/3FmpenP2CVaSE97A5c8+PWKyQ5mfHJAgGuuEDwGCOWEWTa49vGTtZsogqcg?=
 =?us-ascii?Q?41N1f53TTYAcDJis2cmL8dhqqaDiI340BpQ+g3uT1hlnuyaCyPbilrOfSGxA?=
 =?us-ascii?Q?6so9XqnA1Vwt9z1wdz/TNSBPDjqMOE6Jp4wMMrl/zJwFDshUh2M70u3PvQsN?=
 =?us-ascii?Q?0UQZ6uTzrk9Xrhy0+gkwizmMN9YCxu7Fzjea9GK8PkOI5vhykIPlra6PXXII?=
 =?us-ascii?Q?e5SRV/ULFgnTCO5bkY35fxGNd1OCjq6Rw1rJro2h9krgDrt7B/pODULbPtMb?=
 =?us-ascii?Q?U4hwazpXRTFAUULoQGMcKNnUqXDIw3Jm1FBJ9xOTv6zxEZPN83hMQYYg1cnd?=
 =?us-ascii?Q?xVJAYcV5uubKzltvyZMyMzVtBK5nJvYwToq4KkBYJuRTpg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gtU4+LPuo4eoKzzqBQ7u+r3xCA/FCH/K8TxMeFRz959kSKYOtjP06YgYOt3G?=
 =?us-ascii?Q?u+Y3RrEn9M9FcfuOHqPOD5ARBpYJaS2/JsYXq4H+GBWF0YOiP8kZCO1SKdLC?=
 =?us-ascii?Q?J1RYrSqAMg68m5aZIn1LL0xSTzNv9TP2hnuDiEflT1yQW1uIMV9SorNc/I78?=
 =?us-ascii?Q?/Pj+SRzXEmIj2k4l31K1s8XOPOZ09hHcGoL71gOhjGzBJ0IuXRqW/gb8a6S5?=
 =?us-ascii?Q?z2I+8AfIMoyM0Q/lzkVLykdCLODTPWJ45GNwKEG9ZQkd36v32KlNoEKjZRNz?=
 =?us-ascii?Q?wGMheKl5QRwK1IeNakw6E39nEWbD0HtbwcuYBeojoK13asAGDgLuytoznyZu?=
 =?us-ascii?Q?A8DB3U47Nn9J/9yjXfIcRk1zZ8Pu8vp4n/takTGjiL3jGWXsw3u9GvVzbvTY?=
 =?us-ascii?Q?a71zeIEOzpd/pdAL5TY6VvMAIPQUR4ZfCxxvKSKO331nnlwsYdP6+7jTS2JO?=
 =?us-ascii?Q?KVkm08Hw/zUS0yo5uOl3xIOzNJK8Po+01VoMgIDurWLo/drKpsAi5sC9gdpB?=
 =?us-ascii?Q?i3dRZeNRFicTMKbMyZZtlo5uy2oy6R2ZP52xsKbnNv2n/Llfz+yE0g8cPyLV?=
 =?us-ascii?Q?ICkqjDfRdtX2aOEiAs56yUWwIClkOMYbICQnJBtKliIDV0zeMR1VZiidrHde?=
 =?us-ascii?Q?jo6pbC88bzBBwvqIZDdE7vA7mdjyHEDGxVAMEfnnUGUcYoc5RpTIy3SEY2bP?=
 =?us-ascii?Q?WW2yL/Rgwf70shGsJ4ivD1A3lUEmecZA+0VxVxYtfjuMEWQ7XsFz8lAxFy3x?=
 =?us-ascii?Q?ZhKULuI05J6KLVpESU9qMM0eEu3ZeIuC8m6k4E6JM7f221n/cNY+nnIdpm4+?=
 =?us-ascii?Q?SNGRxSNZ9Z4SCrq7yyAvGWmTch5hUu7r8hIXfslViyJv7rdrEnZAO+DT/RbK?=
 =?us-ascii?Q?Ioc/VzntXviqqS6Uxjo4Y2FQq0ch5TINMi5xHQ0znVdS60T+s461+d9e7eKl?=
 =?us-ascii?Q?rlNlrWi4FpkWWtmzWwZnYn6QR4xgRot55nnPNkWCxuUuxybUNsJ9gN6w9wDa?=
 =?us-ascii?Q?l3/v3kRL5PPsenk8s0x464Biw8fhtlzDPPu4Fg0qfMOkxM+SVhuf10EY9zlM?=
 =?us-ascii?Q?xC15uK5J+ZzHKX4ragRJibvZ4oz2K+anfzxwAYC6tgZHsv8d7cARjdusCrEV?=
 =?us-ascii?Q?/2Ky7/5ZFwPve9eo+E3CGCpRm9A/iHJflGQnzI8Nx2BwTsGhw1YfdGLCu+Hh?=
 =?us-ascii?Q?vIo9mzaXqFOHlCA9eG4ONRkrOmji4Qz63bO+OmEgsf+QYfPANcOWk0pvuhtp?=
 =?us-ascii?Q?pjrwiedsnS+Rm94CwT0IRdOXyQ0n43veZBg9I0jg2awGkD4wW4p8ooWH3e1t?=
 =?us-ascii?Q?dAM+6C6wvofKHkUZ7iF1Us6X2HS7OtydqHPZ68DZiRk/a96q5/diij52M+9B?=
 =?us-ascii?Q?vX2TlT1sd1HSh0W16pBshIpmzVjldQwxwx5oqPDnNjEnTx6shmXQGpiif2V0?=
 =?us-ascii?Q?tE5R6kQPa6heYugKOCG7i82gQcnPonGF+urvXSTrFAzIZ2tGT5zd0Rc/rjtt?=
 =?us-ascii?Q?MH0D11t891c+XRujsuns1MkZpz+VWbf6ctM/OW/HArDfRbyXBDwd7VkxOS5K?=
 =?us-ascii?Q?fcklqIiXFyWg0YjbyfWf8zAzGkfb1/XHJfMli3Y/mAMLhLu9K6Rg6X9BZdpL?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1q+v7RLPvrEZq9YXgBBxgcVT0jM+7KckJI/bJBc5y1E1JssKOtFvEOCotZUJ9z/P8xOUHiR51hvw61d+WIPct9MEchyzgja3Hw761ufuZEqUsOe9+/+T6pLEpizjNQU2R3YksLXivAF+2TvIHglZ2bOLaHIui88ds7PbB5sN+sDcKNZbQFMLxXAvk7NK7ONSgAKcoV8a4hFfqrNaK1Pd0GGblVmX/LjCQAbiiVnjMPmClnHLAh4BDvCNXNUaJ0K4LJkLQ+1FuFBghF7MmuT3R282UR5QNRBrbaLyPa1VhLAXeGY+5L+eEosM2HdyG4ohK4/YgroyUPqvJB1SFEke4vTNDn6fzoRZzvxqRYqqavhpgOX2c7+NSHr8OpbeQ50hjxxvIaPCgSGdzECTmAgssRAWwNDTHdjI5OkeN2hPpypmHTs9NuzSg2jN7zWzU0i+Lpie6YFRBX8eLOhcaQt4Z2mkcrlLseGW1TwGabhUcJwmeuXTETOfaGdaHhjS8LAHZaown+dQAh+RtWfofsarzKryHACVwG4M7v5WR+tbUsH+6HN2AYmsddMwZsCYKlQEMRG4liZT59ZLoW9JPt8ae/5HYf/m0K68kbkwjl0Qwjw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 808b9be3-a397-430a-29d8-08dd1678fb81
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2024 04:38:22.9472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SpitvN3MQOTzLBaGX0kw5qBZZVbHQ+dMqisJWFA8k1O1c1KGtpCqQs5jXKvd7E9/cozd5fHDIc0I3zynYuKi6srInr0/bNpQ1Kovr17cDPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7971
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-06_18,2024-12-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412070035
X-Proofpoint-GUID: 45_0dxJ28BCSPbwxgl_D034oa3KFFYdL
X-Proofpoint-ORIG-GUID: 45_0dxJ28BCSPbwxgl_D034oa3KFFYdL

On Tue, Dec 03, 2024 at 11:36:07AM +0000, Nick Alcock wrote:
> The self-grab armouring code is clearly too hard to read: the change just
> reverted broke it entirely and caused DTrace to never take out self-grabs on
> anything (because it misinterpreted processes that were not being debugged
> as processes that *were* being debugged: Ptracer_pid() returns zero if
> no tracer is active).
> 
> Refactor it into something more readable via giving some of the conditions
> names.  Doing this forces us to think things through properly.  Some things
> can never work reliably and should always be blocked:
> 
>  - grabbing the thread doing the tracing
>  - grabbing any other of this DTrace instance's threads, given the
>    complexity of the proxy-call back-and-forth
>  - grabbing a thread being debugged by someone else (a process cannot have
>    two tracers at once)
>  - grabbing PID 1 (init)
> 
> Some things are just a bit risky and are reasonable to do if the user
> explicitly asks for it via dtrace -p, but not if it's implicitly requested
> by some thread doing a ustack() or something:
> 
>  - grabbing a system daemon
> 
> Grabbing a thread we have already grabbed is probably impossible from this
> location (process-control thread initialization), but if it does happen it's
> fine: you can PTRACE_SEIZE the same thread from the same debugger more than
> once, that's routine and normal operation for a debugger.
> 
> So split things up accordingly, and implement the "any other of DTrace's
> threads" case, which was not implemented before: "we grabbed ourself"
> i.e. the PID is ourself or the tgid of ourself and the tgid of the PID we're
> grabbing are the same; and "someone else is debugging us", i.e.  there is a
> tracer in force already and it's not the current thread.
> 
> This makes the code *ever* so much easier to read, and makes it possible to
> give decent error messages when things go wrong as well.
> 
> (The lack of handling of the "any other of our threads" case explains the
> tst.multitrace.sh failure: when a shortlived grab from a ustack() etc hits,
> the initial grab and release request is issued by the main DTrace thread.
> If a shortlived grab hits for the main thread itself, only this case will
> prevent the tracer thread from stopping it and then trying to return to the
> stopped thread, deadlocking forever.)
> 
> This has survived a thousand iterations of test/unittest/proc/tst.self-grab.sh
> and test/unittest/usdt/tst.multitrace.sh with no failures (after the other
> patches in this series are applied).
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_proc.c | 45 ++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 38 insertions(+), 7 deletions(-)
> 
> diff --git a/libdtrace/dt_proc.c b/libdtrace/dt_proc.c
> index a052abbacf204..41b148e807f84 100644
> --- a/libdtrace/dt_proc.c
> +++ b/libdtrace/dt_proc.c
> @@ -929,6 +929,9 @@ dt_proc_control(void *arg)
>  		dpr->dpr_pid = Pgetpid(dpr->dpr_proc);
>  	} else {
>  		int noninvasive = 0;
> +		int self_grab = 0;
> +		int other_tracer = 0;
> +		pid_t tracer_pid;
>  
>  		/*
>  		 * "Shortlived" means that the monitoring of this process is not
> @@ -942,21 +945,49 @@ dt_proc_control(void *arg)
>  		 * else (like another DTrace instance).  No death notification
>  		 * is ever sent.
>  		 *
> -		 * Also, obviously enough, never drop breakpoints in ourself!
> +		 * Also, obviously enough, never drop breakpoints in ourself:
> +		 * we define that widely enough that no grabs of any thread of
> +		 * this DTrace process will be invasive.
> +		 *
> +		 * If this is *not* a shortlived grab, simply refuse the grab
> +		 * if this is being debugged by someone else or is ourself, or
> +		 * is PID 1: on explicit request, we'll still grab system
> +		 * daemons (if you use dtrace -p, we assume you actually want to
> +		 * do what you asked for), but grabs that cannot succeed should
> +		 * still be refused.
> +		 *
> +		 * (If the process is being *debugged* by ourself -- as in
> +		 * literally this thread -- we can do invasive grabs just fine.)
>  		 */
> -		if (datap->dpcd_flags & DTRACE_PROC_SHORTLIVED) {
> -			pid_t tracer_pid, tgid;
>  
> +		tracer_pid = Ptracer_pid(dpr->dpr_pid);
> +		self_grab = (dpr->dpr_pid == getpid() ||
> +			     Ptgid(dpr->dpr_pid) == (Ptgid(getpid())));
> +		other_tracer = (tracer_pid != 0 && tracer_pid != getpid());
> +
> +		if (datap->dpcd_flags & DTRACE_PROC_SHORTLIVED) {
>  			noninvasive = 1;
>  			dpr->dpr_notifiable = 0;
> -			tracer_pid = Ptracer_pid(dpr->dpr_pid);
> -			tgid = Ptgid(dpr->dpr_pid);
>  
>  			if ((Psystem_daemon(dpr->dpr_pid, dtp->dt_useruid,
>  				    dtp->dt_sysslice) > 0) ||
> -			    (tracer_pid == getpid()) ||
> -			    (tgid == getpid()))
> +			     other_tracer || self_grab)
>  				noninvasive = 2;
> +		} else {
> +			const char *reason;
> +
> +			if (dpr->dpr_pid == 1 || other_tracer || self_grab) {
> +				if (dpr->dpr_pid == 1)
> +					reason = "is init";
> +				else if (other_tracer)
> +					reason = "being traced by someone else";
> +				else
> +					reason = "PID is ourself";
> +
> +				dt_proc_error(dtp, dpr, "not safe to stop pid %li for grabbing: %s\n",
> +					      (long)dpr->dpr_pid, reason);
> +				pthread_exit(NULL);
> +			}
>  		}
>  
>  		if ((dpr->dpr_proc = Pgrab(dpr->dpr_pid, noninvasive, 0,
> -- 
> 2.47.1.279.g84c5f4e78e
> 
