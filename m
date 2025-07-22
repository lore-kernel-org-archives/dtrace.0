Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABC5433A8
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 13:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753191980; cv=fail; b=Dmpfhiqmv4SMv9KJqajQudqjOvN+hRePxU+uy3If2q9+zKD9cHcRjdxtENQgBGq7attxUb5uYjvQsEU4Sy18yqsBvrO6g4j/eMuRbjcnWIaRs13XVnvtC5f+IdYX4cJ04BHX6q1qdmt6u+W67ZI7qg5pT1P52MoYvJ6HSJWqu1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753191980; c=relaxed/simple;
	bh=4gQeGimxY0SS3dSu3oAb7bcpLkS1T2saKlMFowkW9jA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=QfISZ57lrUcczYycJS38ABVN1GFClqsFbmxP8Fd5c9pOucT/LMhQw9TRsEZxRahoMuJd9rWnmixmLAbnMNtzqeH2hq3VQx8LZ1HiNzsFoHnY5+8IsIvBpojnJGmyLAOR5dEk5JZVpWN7zbMD2Sy8rP+JBuT+CSEdi2R5VkgsWCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NDy0TuzJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IPjV7unG; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NDy0TuzJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IPjV7unG"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M5TCI5031654
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 13:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=JPf3dr5NUfF9YEIMF0
	5TuAaJhKV5t1Css5c2yphw1sQ=; b=NDy0TuzJVzGQtGJEWTE9esdK1bRL3yEPgm
	+BFivajPjW5RGfvDXKY4Gyv9gy+s6WbE3C1bEYD9U5JJ4a1pHaWRNMWwG2PqTXaY
	qRqtUaPSCaGaEr0CsJ6n+7/1TeGQMnfUoa7jn7LItG8zBGkA9iKPTKLJ9mt3xQjJ
	G7Lju65dU+HRDfJIeuOIz5koRoMP8CCHjpbZY5TVdBsBBdy3zmf/Uq5gwD1DlhAU
	qWY0Q56F9xQIgZu9+eCL58TtVDsgbFTe3OXwh99gcjfVaaE+z5LRpOtdfdaoJ6xx
	7e59PHqKOqT+k6BEJ9+rZNc1D2DdXTYc4RGlXYb1LW6FuIL0M5Yg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 480576n5d1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 13:46:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56MCDNgk011395
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 13:46:15 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801t9atc7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 13:46:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ohQ7bPmRs+JVdyXn/dRDTVe3NjdsSK0Cm+vzo/b77ZcyJy84UbzFsvgAoHj7Xh1DlvYnAKgMowDur630KRHHfCdj8S277K59FGsXDsykgjAhhT+s7f/dK6hg61omSuAytC1Mx353Ughl0gyiZVVPRuh7JLQkvqwsxDobVQ+bl0z7pZNk/IJ8WdPSaboWmd5X3U3J11bOWDtnEKZ2ioRR6Kyb8OtWcaWJr1Za8oWzgcaCm5iHqIV3n98GOJgQhSnly9Fa/X7WaTF1YMYfK9YnU0514if4t+YL1h/1Tn4qYgvMTFtHIK+N210DCngEj6lYZ+v5B5/SkX8mAgG3KVgB/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPf3dr5NUfF9YEIMF05TuAaJhKV5t1Css5c2yphw1sQ=;
 b=jXtNNHIY1zz6JXE3fNCu7xtDQPXhrOcFB0WIEMucVhuLqAS+u0XKAkkIZ+MMahu0Rbih0ht9c8Dn8BOCJXfmiaa2rVozGUCKycuxAdwIZH0lexH91ruj9j8wrK79SyDBCvF/kNSfC9kkyFLNRyjf20tsr4T6tvkSVYmZL+Lkg2qxOWsybHPirQTPXBRyvE80VfvvS/NZCAY0W2BJkYzC/F23j9jjaG3TE3Toi4Kk0yPElv7RvGzBYi3UADYJgIG3FiFY6KoZXMAE11v4O1yEFOeQOOeXoaFXiirBmvoPfanFJdFb0cwvjxW9NiGy8gb387fB9OeOudHBd1ZMDPR+Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPf3dr5NUfF9YEIMF05TuAaJhKV5t1Css5c2yphw1sQ=;
 b=IPjV7unGGbTrzvw+suygw972VcXcIY/WPSuf3EzthzDTpHxsH2xnnwM3EEC5I9Hs6R8oCZHjJDX8atlMm/5Qg8LTkl1zBBjghiJxSRc4/b2P0ajsYsH/EEDXJo55kQkwJ8sBgQuzS7hkQsBICxHYudBYgl0rU//hl1ueBlHXan4=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by PH0PR10MB7079.namprd10.prod.outlook.com (2603:10b6:510:28a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Tue, 22 Jul
 2025 13:46:12 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8901.021; Tue, 22 Jul 2025
 13:46:12 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/4] test: Skip trace() of a 1-byte struct
References: <20250325222521.15224-1-eugene.loh@oracle.com>
	<20250325222521.15224-2-eugene.loh@oracle.com>
Emacs: a Lisp interpreter masquerading as ... a Lisp interpreter!
Date: Tue, 22 Jul 2025 14:46:06 +0100
In-Reply-To: <20250325222521.15224-2-eugene.loh@oracle.com> (eugene loh's
	message of "Tue, 25 Mar 2025 18:25:19 -0400")
Message-ID: <871pq88hk1.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::12) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|PH0PR10MB7079:EE_
X-MS-Office365-Filtering-Correlation-Id: 1116c031-5349-450c-2ad8-08ddc9261edf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QQJfnqdSaYn5bewqGdO4vsVozVRFjFLMUTj2+uVFKGlReakn9AM4Qf5/MRE9?=
 =?us-ascii?Q?qn4G6ObzEoXD7Ocftiqn9NDK3z8b59LkPCC7m7+7q5upmv/9Ku5YQ8abwAqb?=
 =?us-ascii?Q?npDDGL3SZRRFWzgb8hJMy2DBStQb71TAmTSh/Q2gVCHyQRAwH2CG/gZZxw4A?=
 =?us-ascii?Q?uKzK0GzfKaxfYVQnojDpG5obbDRV8SQmvaDJJN4w/ZcNVigTHe7pLV3fRLVP?=
 =?us-ascii?Q?5XDVjvo+S/gfrel4xxDArLE1eUCkKTXAoaLvN11BC6PBX9O6/Bz+equzmTtH?=
 =?us-ascii?Q?PS74oHqer6KUmhF9PFS9C2LCAEg45ANXB4+yB3UvSilrhtqjCzUKCO15CWm9?=
 =?us-ascii?Q?rmzFr5YnJ/53HPTtUsigQ51Lnjth5n77CC6fFuetxLMwyZw1sHvO6joXAT3z?=
 =?us-ascii?Q?visI0faFq/4GuoKoiBY/8O9q2fPOYwtAEUEOST7S6OfNplVDg7kaaxILRxkg?=
 =?us-ascii?Q?Xk1Q04l4Eo72SE4tGMX3tWcw2Ojk3dsF9R9VG5GAS1F0/kxjvNo9OIkyAciM?=
 =?us-ascii?Q?IkwNlhDjEcpusJLbSxIsM4teDge6QO1n0iKyG9zH/9N+Q8rQWn9cKNWQ6YcH?=
 =?us-ascii?Q?CAPjs6T8zNQsP/75e6oKi96SWiAZJq9imn7IgPh2xPrQC4yH7J3FHwSp0jsV?=
 =?us-ascii?Q?n+UtPfg9LTLlSqw7mweLiYxNybZYnwABb0yrIk+DLALwlOZLcYyydGpSv6Gj?=
 =?us-ascii?Q?PCjHTTtaqsow27jxfThuYMGXSX1Oq8Sng/zB68Jg99Qz5SDa03qpq0BQmqZR?=
 =?us-ascii?Q?tciRd7XrU7fbGiO0fIzhjQ0l8GqpYwjG2gXrJzDv+DF/vfLeI8BXFv3kQOoA?=
 =?us-ascii?Q?UR8aRQR0xaOJ+5pjJ/X+pqkOAyu4BIR3wesjzvT5/dfTHVBz5fbDsYxLoXZk?=
 =?us-ascii?Q?CqW1ETIWDhL0EEjZgE7URcHPFHht7AK/ZZEEJ9AyFHdmNFlAPLCwcmCfaLiy?=
 =?us-ascii?Q?9T0hsW4iYdREpFzbqJD00tFEmi28st2VQiYY13j+gsH7IPtMkDM6T1zGQbdU?=
 =?us-ascii?Q?G9oOfs+qbzmnsEph5InPaI8njI106keV/OfK4bGIfGKWrgOr80JM9kjP0SRJ?=
 =?us-ascii?Q?ugL0xettDkr1f9ZrE8m8B4TuJwLHNIil/uCgX1NWE1Daq7XH1WpT39xUxfhe?=
 =?us-ascii?Q?9xSJGmsmI6/UnvXngJWU75bugqHw2omD4czgkU5ic5x2hsxJDxxejV/lSraB?=
 =?us-ascii?Q?bkaGulrChOQUW7uFNc6rRx6jTw7k2oecTdz9QqrjGnGeeHF2x1m//nl2swK/?=
 =?us-ascii?Q?D0Om4k1zY86yeSkDyQsV9H52CctUvVbJzvxEHI6MIsry8ST9+EG0xSsjktCw?=
 =?us-ascii?Q?GCcT5NqB3udocukxe0J7hK5279+a+HEufy7ZH/duANSlhTNarH4Oyqm1ELXQ?=
 =?us-ascii?Q?3tvFhhONHDXhD4soaXQFp0PmQroVS1UMBTRYL7413LyGbaA/ZOtmEYDocicz?=
 =?us-ascii?Q?KiQeM19Q+O4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JVJjqS4gGOER3nqJQBew7Gk8ol1lH4+1aZIxSDhuTLEt7HnZxTN/BgcRBw+L?=
 =?us-ascii?Q?Q+q8H1PpvBogiaHG0MYWr+nFvn5zngGCOAjbzpRb7HZ5AdVBwz1RWxLVRFmO?=
 =?us-ascii?Q?MtVGqjrNZrQusxB/oU0L70qEGBkaozRrM7j7fMrz5keH4A/CzOPje6qvPRBL?=
 =?us-ascii?Q?PAy5GYnzAfAKwGMCEfJiMrUsHWYWcA9jRDx7Hr4p+Q7tnLmEK1Eo15rLsSMi?=
 =?us-ascii?Q?5DsNJLrD8U6mTT+cpSgiRgeBynScdJdIVn6at/RORPR7+XOpsQBVRtbne4Jk?=
 =?us-ascii?Q?O/OtRCEvrGZBXwqE3OFuKmU2VQU5AbqEjm0fX6Q34fUvmM9SDF8kuiRluvEj?=
 =?us-ascii?Q?ywQ7jlSfPdNgFWu4t/k6dNyX0m3ydK1afjNGdLfR1g8403gZsoIcz3IBl2g7?=
 =?us-ascii?Q?EaDGPdnXdxA71n/vcCNiJ0hAyK61ee93h1Yn0j88GugqXFyC1X93Ail9WHAh?=
 =?us-ascii?Q?+LOGGkCCdhev6+m6fb9Be1d3pxcCHHoEKOoJwlMITdluQt7Ok+GyeoiIB8vH?=
 =?us-ascii?Q?CFNwiWiTJ+O2N/6imxAgBPlHkE3xwyb+65fDBvRTZ2l2souB+tXu5+8bOOBM?=
 =?us-ascii?Q?FVD8IZItGEMjUVw594DViwl5qWzob4lbX7IQ86gzhHr9WHmRdSUybsdt6IqA?=
 =?us-ascii?Q?pbU8Uja6jYvu2YNTzoww23Oo3BJfB76lSji64f75KSg8NF+Q8WV/jK9hL1iE?=
 =?us-ascii?Q?eFLY/HflxtnUlsdcB/E08b73wr3zuaAKuPIJECGtar2l7Gn0hgqN+VKwoy+o?=
 =?us-ascii?Q?4vXpYIXjT0BNopwp0n28C/Xfer8/xUpGwf7VaE6P6H333mzl81Hw2inNFuyw?=
 =?us-ascii?Q?zatRKkrdePsnsZiDiCJZyvHNKtsaZug239ILyENak23zGJkX8DXvFKBrw1it?=
 =?us-ascii?Q?AJqaOSuhtycfuc9sGCq2qoIsRA4jC15QNwuzN7d42czm+CKFMo622kBjAyQW?=
 =?us-ascii?Q?gO78txrWNZ1O7TOdws8rwzcx2VSSOFCQyEjGKvBhhFDZ4VXQkXZYajD0y+vC?=
 =?us-ascii?Q?ftmgIj9Fn7wlG2jhp/LxcB1FKPD/1kMq8Oz9h+N6SqQxRlPs1IsC/UCUErDF?=
 =?us-ascii?Q?m7xiR9feGHKq70k4Q+VRpuqiWah92axWx1iC/LdJWEm9sCAHP/v7TUESLFhP?=
 =?us-ascii?Q?HJHydw3K/5YwJKObiPsX6g2a40kA8/LGc7qRDUqceCoBD2LNfqOg1tjDigbs?=
 =?us-ascii?Q?Jnpz8kkQLRnvcDju5KM/dIbclLnKFhmNw0OoIMmHkqnrB2kOR5kzerp6zaeT?=
 =?us-ascii?Q?9yaigwOT5EePiFRIoHhWg0xaUYsqPuly1adLyvL2E8V/6X0DmUEMEJf3Sf7v?=
 =?us-ascii?Q?i1pyQnNaJvQc++xVizA98B2CEeIC/SCfoFcQmTOet8FN/KGJDDHVgQrpdWv8?=
 =?us-ascii?Q?SsZCohGrfaz/hlOD1G4LKGtE2vMT8qxhe6FI37BW3NtDh03bPME+S5N9Ho4B?=
 =?us-ascii?Q?6XsC+oUk5WMjS0XjRJwtx+XsW0rvBTzIA7sKeERhGI+0LH+B8VaiwtRKbX5+?=
 =?us-ascii?Q?O0+LEeeKA6c5gyBi/A8vz8GF50Z6BMtAP6xBc9nW3gKGm9Qr6m9YOxRbJoQD?=
 =?us-ascii?Q?zMomsLP8QJjYoLssfQnPipOEpQoHXYDRHPsb2NaVDI3ICOVtYxlqRBwXXhs8?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	McCDQ9H22n4kosxwD1D/IxUQtUsHvORJbbe2O2UMPYCdLm1Wb1UQJJWMscpecmRREI/uwHNYfjN+BY5b08oEyI3za/G2exLCWfbxyAQhUSBEw/uWPrKpVWwMFgEyl7vSqMyBrNqDyyzUkKlZs2Jx9l5iEQfhGZjg55dIc3WbhGoT2x7gXBDGaf30ztG4antgr3dc2IarLB9NL2UFw4zGZ+QiEIFa+vD/o++uroOffSjkx19zrhwLD+d/UXVdp0IjADPGnzu2cB5wMg4GolysO3Sq+e07sw57SduD1xD6nyDwcUDk/bIJmmefQIWBdGe6729E9Bs648txXWQTMdN1XPzUqXOECN3+yJbQv3g1fXWc4Kr5dSFZQD25dFnfTk7XKn2nnAZDJ6Ay06YN3aqn4RxcJIVMS3RWS8NS4bNq4BcgQmAe3/m2G2uQTnVz/bsJAUaxFm9qQ9cSzjFtHV9wc+Vzj8RPNLB1yiT0SyxKTfE1TauThNC2b5SDd+eNgjrZ8jsIo7pGYj1Dy0fdqBtI1/M7XOMElz2SaZXzJVL6Agu8tzDXN7wN0TJV/XXHogXvC3Tv+B5zihbv3I/rKUKw696O8fu8vxxLy+9XGG2iO9o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1116c031-5349-450c-2ad8-08ddc9261edf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 13:46:12.1485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hl9V9PjxDUMuF9HF1tvulp+g68RbAtWdypbGot5MmGRTiocm908vdnsRAwspKdWyppq1FKb//RLJkt9G+JWbVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7079
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507220112
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDExMiBTYWx0ZWRfX2U/3KxUmmXUd
 mlKZyajnlam4qEvHVilwPMYeOZtKSh1TADutT74Q5vNdE3l+87zypNRqlTg3E5DyoCU88SOIM7T
 ysyErJDHJjRDyMqpV85kcZganTa3CRJSFlK6T4UDo0/Ld/pRCOQIHpYpC+R8iQe/mHXo7mQlZSB
 oYmaA0l7aSDYn+EI2J+sX+V3xN4FtuJWSWXWut2xbwHJJrfNjsCcH8GOSTAUxNEXfobxsvygJJF
 gzfTgT3surySNmozxmYsyjBBZE7kDAO7sWoYzsg2mQryMJyqYXRFyVmKcC6wm1U0Eaq4sL7ROGQ
 u07bZYdtnkqXA/CTjGo7oLMKAYYFYiDd9GdpWpo+JrEGGDDbETdYpHuSYXtZJvaLssBUm0iVoPS
 QXWxo5S5qgs+CFCMx2NytivHBIkn9psVma3PHQkmLtHroDZAZPY4YAqq2EU0AmpPG2zSGF9C
X-Authority-Analysis: v=2.4 cv=doDbC0g4 c=1 sm=1 tr=0 ts=687f9628 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=1sx4QWxJGiQrJaF1s68A:9
X-Proofpoint-GUID: ygNqMj5ibSnUE21wnbdNKVNWOrIF9OJA
X-Proofpoint-ORIG-GUID: ygNqMj5ibSnUE21wnbdNKVNWOrIF9OJA

On 25 Mar 2025, eugene loh outgrape:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> With commit 3a551bfd ("trace: fix char-array handling"), this test
> started to FAIL.  Meanwhile, the behavior of trace() on a 1-byte
> struct is poorly defined.  Users wishing clear semantics should use
> print() or other actions.

This makes trace() much, much less useful. I'd say NAK, if this means
we're going to not come up with any useful behaviour. Why not define
something, then use it?

Nobody is going to say "look at the size of something and then do a
print() rather than a trace() if it's too small". Even looking at this
commit I'm not sure what "too small" is (one byte? four bytes?
sizeof(int)? sizeof(long)? A cacheline? what?) so I don't see how our
users can be expected to.
