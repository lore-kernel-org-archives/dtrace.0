Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D487A208DA
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 17:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726333618; cv=fail; b=i/2+435Aq8Y9gEOi/MQ/aOcwHd630JXTjhFlGvtzPt1omp4ABULkDc5zOFO0oCnsG2bwI1Q5Ag/J9FToBl23CSmGSXRQxJ6pS9ZEqy2dKg2pns3gQHyDn97MiEYy+xzarUjXJdj6pMCezn765x1WZi2/zSuNjBeib9Ec7O94Pc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726333618; c=relaxed/simple;
	bh=tuZ3cp9qegr6TqAMcU3DFLSP2YEh7GBwFt9oCIv8rlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OCOSFRLvCqH3PEJ053QXc/Se0MPMjHv40wAFpbYeP7jsrm61KWJgx4izBdY8zkHuiSMMKSPAxSYPU7cbejDd0k3kRBVNzIPEgE9akADkuxHli/OZZnmCxaBp+5bHx9dc7WYVsc0Bjgjr2VAp20OqB00JsE0xN1ygRDYi545nvLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WHhPh/uI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=R2oT5Joy; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WHhPh/uI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="R2oT5Joy"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48EFxErD031361
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 17:06:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=bfjhps+x6awrwQz
	szyRC5i7rR4/6GUZMx+auABcL2jw=; b=WHhPh/uIrSxXc6UyRuD/QanP+bCo01E
	KhkoOZLntbh3nEgCp3P2BJmCtSqHM6Hv4J0+CU6cEYubtXwwffMHj1gs6pK8JQKS
	tpCCTdxTjPgFoRs5BpRuLRmmqQ4eGJPPv+hSNvScULgCO6pwpZfuTI2zC4PdpDB9
	GPQmwaLopt4oHq4UH9bKT3H83nE24fodX4zyRUfIXIX5C4DH3jrXyfRxYEccJN1M
	XPLoSi9d/M6s5wvFOpFKQNOt/DhdIHFLrvhZMHGRh5iFjeyf1rzVlGzFvTl3rgDu
	lxU45e88XyyRnWkyE98kejgOKks/GsNdO801Bxf8poa4n2qo60otXtQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3rjrjmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 17:06:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48EEbaCE002157
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 17:06:54 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41n0x6d3ax-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 17:06:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vvl8E1amk+EbMEbEQ8ie+zizFB/i4Gkqp1eTSHr12yVilBN0XshfyctMGGYPjvUWzElQlGj8qa3iDFl8ZfghB8xTR4JjYWVGGa4eZgnhzqNqjPpNUa1/oEU1wDQK48Laudgyf8rC/DIxqMYpykUswpAbjI58YWDUpHZrp0Wtz0lHVNIFGgOBoeqK9L/gI/t1kt0nSpxPPw02jVmqBq1CDJafU+Kmq7OV1UUCejER9HgZ9Ycj3bYmnqiXULa9jOODHV8PKQWF/NPDbc7w2abN0wyy2l1FsMRX7BNaexraA2sPcvEprHgsX1Gw5cvltp+4RIgzXdqqMpo6zhIavECOWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfjhps+x6awrwQzszyRC5i7rR4/6GUZMx+auABcL2jw=;
 b=W9AkCzCEoNgCRMkp50PizaqQqy+asfRmQDFzsx79/CUxiADYJPKD0QVGTRmlLR88xebSPyd9iRcDnao/ezPzA5BNWDJ98ox+V9P5LKt1AUvJwiyTyINuCTAwHrnZgxtbmzCblEPrA91jyGPpwVmZHZ0nGNzpa/iPQyE4MYrwagqZCxeZTMi/EsSuFOteofTpRWws2OLhimJyoZ7+J4urZJx19pAAGpFcSkwl2KuDaDVC5Idx4eKiP6mfWmDdhk0RrUAr0pl6wGdABL7nIVRP6swNVdpYc7dEAC1s484PlwvtdbYCV8hz8iH2QBo29ePguNnF8L1uMsZJNucOuh3h9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfjhps+x6awrwQzszyRC5i7rR4/6GUZMx+auABcL2jw=;
 b=R2oT5Joyj9RrSHy1/NUU/bk4iifZEHVZYpveTJDURsXoJ4gJEz3H4T+OlgmcYk0UCDDuNvuHKsTWQ35wJztBoj8OEzFbduwzErk9wItHmTsP2Lt1mmunF9UM55k7kJTTzbvZXRQd1rSSy5EFVzfcuzNL74hnMRuQBeHtQDnDPDU=
Received: from PH8PR10MB6292.namprd10.prod.outlook.com (2603:10b6:510:1c3::5)
 by BN0PR10MB5158.namprd10.prod.outlook.com (2603:10b6:408:120::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.11; Sat, 14 Sep
 2024 17:06:51 +0000
Received: from PH8PR10MB6292.namprd10.prod.outlook.com
 ([fe80::7f53:c7c9:4dc6:d4a6]) by PH8PR10MB6292.namprd10.prod.outlook.com
 ([fe80::7f53:c7c9:4dc6:d4a6%3]) with mapi id 15.20.7982.008; Sat, 14 Sep 2024
 17:06:51 +0000
Date: Sat, 14 Sep 2024 13:06:48 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 13/22] Eliminate unused args to dt_spec_buf_add_data()
Message-ID: <ZuXCqN9KFmrPhf6A@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
 <20240829052219.3234-13-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829052219.3234-13-eugene.loh@oracle.com>
X-ClientProxiedBy: BN9PR03CA0307.namprd03.prod.outlook.com
 (2603:10b6:408:112::12) To PH8PR10MB6292.namprd10.prod.outlook.com
 (2603:10b6:510:1c3::5)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6292:EE_|BN0PR10MB5158:EE_
X-MS-Office365-Filtering-Correlation-Id: 85b8f13b-2900-473b-fdd4-08dcd4dfa03c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?17F9dyFyhJBSPLDW7f785HZq5qNMCpzdbXVKcVXzYhEOdgrw/ngXGaBUtp/A?=
 =?us-ascii?Q?TMTeCQfNs4E6HM99BsYeEAyTuVWlIj/IkrgAoQRcu9V65eg2FMkmocxO3Gjj?=
 =?us-ascii?Q?ggoWbmYZgbGfDt+qaOom5sLLJMXdOxHJcm7/wH09a5Ig5/Ho24bojjgPIS4s?=
 =?us-ascii?Q?O8eOVOUlBD3zSpoj7KXHjUKOdqlHpH7tB5UnM2w5Ffda4NIKqZaE5siSqmn8?=
 =?us-ascii?Q?EcNKTFopzgBvTCC8AC22nb1oddzaqPIF7sQWQsvTZRxdVOMYOpCbStrUOUU8?=
 =?us-ascii?Q?MYzL7nJZAF4VeocbOZRi/5tlybNyI5EKV4MU8DxrqqLPNkODSgtpD66hT8LJ?=
 =?us-ascii?Q?05dhoGewMhRqGEQP0/UVrCsP+M1VyBk/nzIEopkPg3m/AhFd1Kj21iKDZywj?=
 =?us-ascii?Q?VYPGpY6DrnzFuycczsydHkuKnD0c8exbzVcJIkgJs3IpyiIH6ZwJ/pHlmgdo?=
 =?us-ascii?Q?K9FDWwE0+l9V0PnSmF3b4IwigdxzP3Sfed6wIWdS9I2+w3diXNosQ3Tt14gl?=
 =?us-ascii?Q?jqGRGnOIp3gZuWdOGXhqbt5UdC6b5BsgfK/ECesaKn04o7o72lc0HSzmGfuU?=
 =?us-ascii?Q?8l+8JsWtrXxVriQ3VCFjMm7RVLBM5IBv8Cz2DTqsdiNXF55oXnbeR7eRrjnl?=
 =?us-ascii?Q?kcoe+THHReUfdiJILBP7phlNDlXABSck5C4ScVGlwFsVkIMik8H2Wd5UCTPD?=
 =?us-ascii?Q?g/AnwpV2ZABf5xPK6IRvl/E33ZinbmWJziDF51jWsr9z2cB20GpoKTl00Wd9?=
 =?us-ascii?Q?qry48w/XsFauOpLcdqAZWEiMS3dRqkglL0Bix0JnFOii5Zm93lHf6qk48OA5?=
 =?us-ascii?Q?TUFTq0lvQBiO1RGYzjHc6XoLDgSDTO5iZtv4ZPZBI/CEbnH8BggpoO0s4awn?=
 =?us-ascii?Q?EDQz88BnubKHPC3MhUcvqbDo2at8NcVq0d4VTn/lr6qnnXV47Y7Y+LACX/Xa?=
 =?us-ascii?Q?0rb/VrxoqO14jXhk6U0pDXjKZbkQp9/BAENWzRIAxWBsevuNpVFLLP1dkfxL?=
 =?us-ascii?Q?eXtyJf5Uy/0nEBqe/XHAZsoDThqHvbIU8J3BPwUOtLcb6lmh0Ytr4nz40+Wo?=
 =?us-ascii?Q?y7gW59a5JyMb/q+T2TGzFNf1VoeVp9GOzjy7AKLeqLZiPOghphdqNdRwdEhU?=
 =?us-ascii?Q?cnVPwlAowqgSJOpAq4WZpwH/hSkewBTd9zcyHIykvwakJysDRbPgq2g8oedn?=
 =?us-ascii?Q?sIV2W+QR5lCqqiDsjXPKtdtYJhaVdl+yJikET+l4Y4vdfvhPp1ypuQVHjoeo?=
 =?us-ascii?Q?yIL59Wmp/CkcZ0oAnawEUfcfIEkKuLJroJ6bDL8o3DG76kw1CoLM8X15FZUq?=
 =?us-ascii?Q?ATIL7gOnDSvyF3hNeTUlpR8ePVsvKxNla3Z7HgHP5Cw8bQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6292.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2H+nt4L3HBiJpYJF988zx0UDyoDuzNL6xxpGPGc8xGQJNdLmQiIO49LJY4YP?=
 =?us-ascii?Q?qDBenzRju7uJl4+tr2eGuTCrV0wvbfIWZEGa6q9NKZMJuI2xXq5Vp/CI8cWN?=
 =?us-ascii?Q?UixkUA6/9CjwgLglKSTKz9Lpi4IkiczdYS+c0bu9MZwX4bz4mhMW4S/5mT0k?=
 =?us-ascii?Q?1kdrCKl/IzrNfgDRFDn++t8JJUXvL4/Djb9Ac3A+u4C7wu0d9mcBlkBxEEnX?=
 =?us-ascii?Q?V3NZVOTycy2srYSVS4xUXNfe3IHtNmXfDMl73RhOGPVTA96V9ZuEVwBP4M4b?=
 =?us-ascii?Q?bNOkM4JfHTC+2gp8xNagfFH1txnuv+elgi7AC/pTfYgZjO+Xn/0njYvI9aJ9?=
 =?us-ascii?Q?MZo8W1X7Ocw0kDOCE3CeRQWQ8/RsoV1rDToZ9Fj1KieXDFRpnvy7hm3IdeSg?=
 =?us-ascii?Q?iPLIy6Et1urectuSnBPcfoUMY03DdSWrKX0PyHEJBD6kBDVfJV1aDb+Ci4k6?=
 =?us-ascii?Q?INQOGhiozrOHL12xfOD+MveaqaoZemMA77bLcMoK5gqMbRbPN9tSpvhdR1ke?=
 =?us-ascii?Q?EKias5dG+NrQZNqd6Cw9gzVy7KzHHC+Irx4DsOahektARiccM7RL1dgVkRDG?=
 =?us-ascii?Q?MKzjxcPygF1mTp7fU6HcXVYclQzFXnLgrfvYrU6cDBUreDRpYx+3HjWiLFvW?=
 =?us-ascii?Q?d9Nvl/URE4R8ByFn679EopS0hxkcCqcxBr4UIfLuwE6EgymXYcJWlTWuVpgy?=
 =?us-ascii?Q?kTRElekAMDA2gYM707L4insFlZwa4YXjUSyxGh/dFvbgBwCnX3OxauvHREWC?=
 =?us-ascii?Q?b1ItV625RlmfrMR+q1ycvvHbyciSNna5xdmGTzk+7Dk7TDLyc1gvLXURG1Pt?=
 =?us-ascii?Q?PHaB/pn/2td2dhnWrvmDVNNMu4vs8QcZffiX6O+KGGnQad0+Al68iedhUnHt?=
 =?us-ascii?Q?p/QU4IFdsyoEs3EO6Niix2mdqRRxwNpYdD7jsP8LyFwkk9jzZW2g4EWEe3Kg?=
 =?us-ascii?Q?bY4TQs3Kjuxhn1QNnRN8hD9PtdTQ5rQ+BFHjFtRf9nwT8ImEVymnGEtwmPD6?=
 =?us-ascii?Q?bMQYDktofx6JJHH6HG0J/FKOYkBzlQJOyFcFepjIvfOkTa298Kf96iEBw3Ni?=
 =?us-ascii?Q?uaoVeEYLTIaIywzPbrSaO15BDJvjxnuK085LezvhFzKHlqxLywMVZJxX62KC?=
 =?us-ascii?Q?pMFyeJu7KsDSP/dvnzKxQ9p6xkCURtIWSOVxOMNIRHOC7SNI5HGhsYamNYE5?=
 =?us-ascii?Q?/h3EQV4cXdGVsTttFqtCT4mHwuTE05By/9VhkjT+Tn4mWA8eWMm4V80OPwuz?=
 =?us-ascii?Q?FgFxkodK17ZnU+Qeo5VQrwScsAqvnGdEZdnwB/eBd+EEMvOY0O5712lbsgJV?=
 =?us-ascii?Q?n3+AsE9l5esurxv6DaK6j+2FxKWhdfA+3KXvfUvdyUbb+CGUj7ouQzeFY+UR?=
 =?us-ascii?Q?elGOCC3EBEJQaV+z0brKdjyS8IFPbJc1qRZk3pzKcs/JJzb/7sy7p20f3dwr?=
 =?us-ascii?Q?o5TvQQ3AFWjzMeIQSgha/8ReGYf8ea/3f+GInub5WbPoONsxJBYc+wFNa61W?=
 =?us-ascii?Q?e/JfwQ2C586gtvWUPMg1H3oXpdnQ4fpkwlbxzAgdurB1PsDgC/D8FQN6G33K?=
 =?us-ascii?Q?nF7IavB7Mj27dvR7h425vcQlA6RgWvinqQAZi8H2bGmq/MESAvNdELmexXyc?=
 =?us-ascii?Q?Cg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zJ3kyFh9F02gK77z2tHyWj4MynL1Cb+qRn7LHWpyGL9YZWOJH+nYW6F2+650zPIpxxqKbGY1/kwWixx6vqQeKXH2CL0auzwEq6q436RDctKhOfEfdGIVSuHsXC7ocx6M5aWH1JDZtkHF8GMIbpBQeFQ9P9+EW7iP1w5DL0gZu2dZ2IYt581ls8XOW8jkqbXx2nztSdm0tCtdweUmdGS4wuE4n23Xnp1g4KKZP7JcvUaGcKRcmye5TS1SCpmIKbRg2cfEQ+I7A2/jwmDD6MZVd7ppsU/sEt9pGXdVFRXwFXzqR/Lh7wePmSzhuP6FAwz7QhmmcwKeBzLwx06+f/89DC7Wom7O38ScaqvPAC77b3gQibyzBA8LxhBQdfe7lOk7dV8fyHNlwARrNKBHqCCaUb2ydIzQRBTqSG5m32GRpInXuc1ccyKJEVICtlBpk8gt2Rr6Wor6JiKXn5qmBYovE9N1VC2J+qxqA93xlvMFFGqHpKXnxUAxkoS5XvWMcm5ZZKnaB+KO0BClLkoa6QsEO8jcI2EQTMCweIXZTj2g7TvQcgScpS+W6rb5vf35ed3J2dwZHvzltMMbRFuOMmc77gCyogxGSm0itvWJ5D9BYgk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b8f13b-2900-473b-fdd4-08dcd4dfa03c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6292.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 17:06:51.2450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ok+/k1SvJJ+UxNVkHdC9na4l6OSbSV1s2U3lXq5Q9uZG0eWIesuaQcHQcaBOmHARrEeBzRXAiHt178f9zMT1IoaaqJ9mZyjAxrCPpfU17lo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5158
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-14_09,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409140120
X-Proofpoint-ORIG-GUID: zUlfB_y19yf0I0XsU9PYxxm_uYubLoOz
X-Proofpoint-GUID: zUlfB_y19yf0I0XsU9PYxxm_uYubLoOz

On Thu, Aug 29, 2024 at 01:22:10AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_consume.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> index 6aa9812e..51eb6c80 100644
> --- a/libdtrace/dt_consume.c
> +++ b/libdtrace/dt_consume.c
> @@ -2060,9 +2060,7 @@ oom:
>  
>  static dt_spec_buf_data_t *
>  dt_spec_buf_add_data(dtrace_hdl_t *dtp, dt_spec_buf_t *dtsb,
> -		     dtrace_epid_t epid, unsigned int cpu,
> -		     dtrace_datadesc_t *datadesc, char *data,
> -		     uint32_t size)
> +		     unsigned int cpu, char *data, uint32_t size)
>  {
>  	dt_spec_buf_data_t *dsbd;
>  
> @@ -2265,8 +2263,7 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
>  			}
>  		}
>  
> -		if (dt_spec_buf_add_data(dtp, dtsb, epid, pdat->dtpda_cpu, epd,
> -					 data, size) == NULL)
> +		if (dt_spec_buf_add_data(dtp, dtsb, pdat->dtpda_cpu, data, size) == NULL)
>  			dtp->dt_specdrops++;
>  
>  		return DTRACE_WORKSTATUS_OKAY;
> -- 
> 2.43.5
> 
