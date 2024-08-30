Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C62135417
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 03:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724988905; cv=fail; b=lervplPPn9LfZAQhXzpVzmWcXsryjGxZQv0i1SdOTa2kO/ORzDj9dkbKtIJDoHjZxdjHRwV8Z51HmPy1TYWgbhnEJEMfodHt+trVEADAApHXZTC7OpV0O9p6zn/T/sQrkjpwy5YGWMcbnD4/AYQGD5A7nXeeFhhKhHZzzLYP70g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724988905; c=relaxed/simple;
	bh=3j3mpKETln4q9XuHvxM2S8JnNXxZzO2PQMlkOLTRXRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dinfbiwslla9wxUIqZK6wjosWDPTOej/koennKtJ7WQcdZb3YwA3aHe1VAxEtaDqmia3r54MNsBo2Oe4TlhjPFhsQu61ECrpvHxzCBR00IenKdHKZVwO5kH5R3ttsZn+pL4tq4jfnVIO16TFyJN3mhgJ+3WAVHQpe9lkDF/t4hQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cK2qiodv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bORuzUCO; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cK2qiodv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bORuzUCO"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47U2fhRi031108
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 03:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=jsLai1HfaHNFjsq
	BJ3WNfN28hxj24pnAI39GzJw+TbM=; b=cK2qiodvMUhgEDWUYfQjX2jNjhWb7q0
	NZvyQhFas6ZfGNZgIuN0vYgB+AUDaRr0q/fpb08PySDbR5efTA2aLg845e50PFD1
	cYwHl9bEehWaRT9pbOwrPk0r7ba5z7EZCmoIVeqkY5lnS7dDjy9r2SoqLd0YSXmm
	WmsIjem4OOUlLSUavb/WvIrhMrZxTUgTqeBYr5PM3mDc/Co+Y/FXVZIzAAp8vTkN
	9jZzLCN1E5sAG/A6XnaIhCwh8QV2cgn4G/r/Hsfm6i7OWs2qppr+PkNwb+2guC24
	73Jcjmw4X/aDJ5FXA0MFq/39tegobfpZuiu461/jFh3W7havZWxfcEw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pugwqw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 03:35:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47U0J5nr016688
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 03:35:00 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 418a5vxjpg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 03:34:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJhSNSfoXsk7et8NO4QeLN0la70mQMOOOq1/I+IXL5W+jS2GIOfUwEOqgctl263yjzvQu29VoW7MQuLrveD8yyA67N6TTMPxDAEx59VYcAzDVdG3SWYICrY+IBwgdOjW1briluIRMofwgyjUk5Mu7/bPToCxgz5TMwfW2eZ/x4YLpIs4YxFkzat+HnI/VSsX+dvCN+dvKLPuyBLT5ob1296+XLKvJkRNFSkxkK8QqQV9LJz50E+5qoLzGZmo6v0oYiJZBssng7X/pxudxeSbL+7JZwtIIAX93NjnaKcpvGBgD1hA9LJrJ0Yqe3/t+57JkRp3jpUMr3gKWDenODmXgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsLai1HfaHNFjsqBJ3WNfN28hxj24pnAI39GzJw+TbM=;
 b=WB50r8eHmdLMrPARhMzMMi8qB+I2FgRt2I45c/lHkCepA9+2Ov9d/ajj7ZWpREfT4QoQOPlHBH9aUkW47BxJO+82B1PsmPNPQbwqw5Cq2RTOvBVzNIEOxmqI3YeXPG8XWiaF1B8bEsbYyYAcWqX2OsHoUeak/6m6zGqqvz5Xd4MmAo3vs3nI45ztd/QlT/ak6nOJm7w/1UMSSA9+raoDaBiFIVupTSXvwkPL66rJ6WeyiQsSpEnutY0Dm0i9352vw54BaTvF0hfSml0koorpyl1gbrJyv9XSEALUna17v4WlDS1w3GAIunEfNHEeK5xmErBh2fpFJmH/pn8TN+UTLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsLai1HfaHNFjsqBJ3WNfN28hxj24pnAI39GzJw+TbM=;
 b=bORuzUCOmulLpXV/GAOotn+8Vq3HAY52LYgmg4yJ1D2uIUgcAS0I8rTU8Lmmupp4U4CcEa2wc50SIbevmmNA6TnYOvjv7Vbeh1coZh+6Aagpg67BgLZcXlV6XU9GgA292QrX7AcCQqQjLsc627R3kxuLlAdHPHE+KuoSsfDeyLg=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH8PR10MB6599.namprd10.prod.outlook.com (2603:10b6:510:224::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 03:34:56 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%5]) with mapi id 15.20.7918.012; Fri, 30 Aug 2024
 03:34:56 +0000
Date: Thu, 29 Aug 2024 23:34:53 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 01/22] test: Handle dtrace:::ERROR arg3 specially
Message-ID: <ZtE93QS+vPcbeq7W@oracle.com>
References: <20240829221819.10237-1-eugene.loh@oracle.com>
 <ZtE7hV2L86TaG6M1@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtE7hV2L86TaG6M1@oracle.com>
X-ClientProxiedBy: BN0PR04CA0031.namprd04.prod.outlook.com
 (2603:10b6:408:e8::6) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH8PR10MB6599:EE_
X-MS-Office365-Filtering-Correlation-Id: b0bb4994-ca0d-4a04-b7e0-08dcc8a4b794
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bWOqiiP5oUCjRFabi7J07mBnWY8/Qiz678xTgXi7n1X4BAeCmI57hbFcMC7H?=
 =?us-ascii?Q?BKkkEryhfgDlEtu4cqHFMoVpE056tbLkBgWPJTYfy1mvG+lB33pNEZ+rHezL?=
 =?us-ascii?Q?czYlQcOUH5VtnE7YZ00hD/zGRWKGPVW2Knc5cNkoB6b08Cle9sbGPXOIk6uc?=
 =?us-ascii?Q?4RIj4LSjcWLXJnEuQeAht7F6+dnnQXSNy7neIQvHWJaefRUC0RCFVKHNdYTP?=
 =?us-ascii?Q?AhjNZfT9muxK9l4YRrEUnc/Qu/aRQK21ceVhTU7AItcKczQ0gf4eV96vJ3XZ?=
 =?us-ascii?Q?NVFQM9tepAi00GB+1KDljXb+QpyaApka5KI30w7/NaklyhjtFJPdiY/7YA+8?=
 =?us-ascii?Q?hajEZVPCV54TqfAhaih/FOqaBg+hQi6WSSIAebTZnY15id0hqpwWtxMivJNP?=
 =?us-ascii?Q?56Xh7fu+2tBvR3ubl8RzRhXnrU5hOJV+Y+EYDjI5SfPFWsiMhzUTP3YzutST?=
 =?us-ascii?Q?aOIdyDl17BlsL6QXfimhh5unCJ1oxj8qgKNPvJA34SYQ/6FJknXeqCmubXvh?=
 =?us-ascii?Q?TTM4eWSWEh3S6B/MfaTN8/5uIhy9Rm+og13+gBz4Bb3TSHKLjB3N/xkXsePd?=
 =?us-ascii?Q?c8biVYnYJq0zmqOKBHlkBLIHGlZRNVbBSK9lqWB3tKRUuZOkDq42kSPcgHuk?=
 =?us-ascii?Q?vBq0PAASaE31Eyqu/ZdXNwA4f7I/SA9zKlmFLBEpJYCTSDALbeZ9Elq6/sOF?=
 =?us-ascii?Q?oVMzoJNvBJIyE/BmHTYV8E9gnI1DR8G8OE/3UxTvu+GEOd03IRGWLNeMxmb9?=
 =?us-ascii?Q?dan8RTs1Kcvy60D1CFWvMk1zVe7JFKyTOQxBVoNK1MdobNbgQZkaSO7+MRhj?=
 =?us-ascii?Q?oBr+LKq9lUt+2k50ZlhtjwfMknRLgMbgAUGcmck/W7MWKIu9jaleuGStb/qo?=
 =?us-ascii?Q?JnpQAGJ6ViglMGZXWgKPPo406BMXtISEixxyjW9TFxZN5XuoBYuNPDfCcPaC?=
 =?us-ascii?Q?ZlpMw4SgLZK1rtoA4XAVrf3KYMF9xy75me1ylcNsV9NFpzzELdyNk5rC6pRI?=
 =?us-ascii?Q?mguxmP8jRnSxzjDIfHC/4TdUMuOAmcKRaIdHaDPRlBoUTYwAGvp+zx7KX1Oc?=
 =?us-ascii?Q?/3ze2QRiRenB6oTtoxrb+TaMMgohuoXYy9eXOHKoakGlWk1z4HJ/COgES9ma?=
 =?us-ascii?Q?q5xda6oojgw5O4aNa2ueDiv7OhqSLagdZKmLjt/YENi1DnZ97OeG1O7wQNc5?=
 =?us-ascii?Q?nI3Y8u1zoh59KR+mgGzsl4xonj+a2WdOUAaQUkv9vnNaaKwQSZ8mBNhYjM9e?=
 =?us-ascii?Q?YzdpwHb1c0IboD8U40j2m4JkDPZY/VonLHUyI/kfBj/XtlMN+0Dli8egsupu?=
 =?us-ascii?Q?/z8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e3o7IBM6HH9pXPLRHivDnkIowqFcc7Wc/yu7+EOEvNA6lixhyH6P3ov4hOgu?=
 =?us-ascii?Q?EagnZBh5EzfBPAr+Ypn4yuIF2Bts2DAd8Nc9MnWLkRWNZfs+6EASxS0SXQYJ?=
 =?us-ascii?Q?zb68jridErA2YNUxY8HbOCl8ZzEKovQIA+gbFOE6XhPx6T9gii/tk5rB2yH+?=
 =?us-ascii?Q?U8/pGZYWaDSL0ZrLaFdgedF//Xc+k9b+kCs8hmawQ/KRYliBVOq1LtaHkji8?=
 =?us-ascii?Q?01PNnfjajDsjXmdsN0xV6siF4q6AOF7lUdRWz7Y2uGO+hfQN0BPN0rcPIpzR?=
 =?us-ascii?Q?XoT6uamsnsA4WqhBtMWdNj6iuJVzWATvy7FUlkw+H99tTfgnYZm0NpjtHgew?=
 =?us-ascii?Q?2BIV+oYVBHzo7vGXJsz7m9ExnKrz4poUbr9GdQdhuvEG8V9Iy5aLZ1V5CmKO?=
 =?us-ascii?Q?csMLjD9zxeQsO73XpujiZldmy71iS7vPGYb+69w41gofL9IYM0wFJnkR//a3?=
 =?us-ascii?Q?cgDZEuroDBY56fyqs2EVVPcH6lmwg6oPc3ZsEw/WRdaKSHCjIamcg1UzRsIr?=
 =?us-ascii?Q?aRVLNeOyrObdRUDfNghZL9dlTbVaj4YfskE/Br+MIoNaKrNNs7k6/8kzirA5?=
 =?us-ascii?Q?+JC20G21prIlT/o/kXKfbbpXR0vklaI8OJvfRK83FD1fqKbpY9G/mC8uxQsu?=
 =?us-ascii?Q?A5LDiNr8DnlnhU9tRHDGMvzQ3CTdy514xoVqC+bFpeEkL6Azskc2enuw6k1W?=
 =?us-ascii?Q?vlHUX5xn1ss2KpGzNXWBCGgH7481WtSSyQ7Q2R1p6Z5aMzdot/Mt8LCG3qPE?=
 =?us-ascii?Q?Oi5bb0ei7tvi99ESSNQpunkNl/nRhpyQDdc6pMmeWLqy+Y147ViEqQS9M9y6?=
 =?us-ascii?Q?hcF3LrlmUb7Xqnx9g4cu7pKoiA9XMX0PaLYgouseoSmB7cHOu7cShU0E3+AX?=
 =?us-ascii?Q?DMr5/ikkzJnodptiBN261igf54ZCzLtHP//cKSllqfvfqgAKbVywDEtUntZj?=
 =?us-ascii?Q?XT+e4DmbOJ6jzHyeGzoDCtiCFKNcC2VPH31p7Ok0MzkeQuI/c2uMwp5lts2r?=
 =?us-ascii?Q?9vhaww8hk8dXLoUhBYZJqj+lt+RoMYTnJwUiDAyBdxju6tSbypDNl5MeVlQr?=
 =?us-ascii?Q?bqmOWQYPZmlyLc2YxTD8McYLIbNsTfaUTWNnUSHwzmR6/FH0KnN0CbYM30Hi?=
 =?us-ascii?Q?9n7vUA2OFnvg9V5y5UEeknpTi2d6DImvEbiI79ZbKoh5eJZIk4tyS6djL8I7?=
 =?us-ascii?Q?T7A9yLj/dVJTufEUQnTbBOOZ5kz63z7qX3LIAbk4q2Lgj7d6dAUcJcw7hgPt?=
 =?us-ascii?Q?Kcc7PbHLc16IStzXJRShlpqA2guTPIazDIVzFMVthqRs+D9FhU+Yh6P6zlb0?=
 =?us-ascii?Q?m2O0hgC0QHVwutV3628ghmsR08vzuW+x6ywiIMB5TWS7HJ7PUo3dQWBPOG7c?=
 =?us-ascii?Q?lxm5htejBl2tFPs2StvTNNNs+cJIM78Z80ise5gW4R71BdJ/9wP1D09oFPAz?=
 =?us-ascii?Q?Sv4eqIz8Hn3PgmPNklSebh9AZjqkyWFRgrVovxvhdlsBZ+4weL/34lG4vWNp?=
 =?us-ascii?Q?RsJp965MGbpm4VcofgOaCD0QzNtJsQs1UyEdZNPGgBCPNm68G2JmKNa1SzRl?=
 =?us-ascii?Q?x5SjgwNi/vosXJ4Y6gMAAsFaxGoc9Jt8D24qBedTEbM1VEv3vKoy5ylCb2KY?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yuKstzGAeKdgiS5yxp8xmjBhzZxR3rjmwJPgjFWilR5Wf7CzZtmysJhzyOHOKE8tXA0o5aOqcCR8dqYQyk63gl7dqHhOsX8gO6KDAnxqS+7yyDhCPPZ8gc1qfS8kKYM5upgsmVaKEUUxzgeP538V7zKE/Uw1O7qQ8Vpphu0A9drcxcYm6Zf/aYH3zum0Wybfe8paoo+njox7Qa/BgqXkGqFccKdvZF/VSh42NgjlNALmqsKhFZOv6ZDeLD+bLJ3eunB9FewlgrGbF4iKOngauIc5ZzRME8sLbL2tDT8HVjxbMSUCCP+hWG2F3bozqMyI8LJJhM0ySjyboHHi8Sv12uCsEbFYWpFEdCD7zQj2xc24L1dL0995FebaL7280MiSTQfM/5kAcny2pOHuwcKJbR6ionPFJXyfqW30T0mbuf5KxLqHuW7Ivfp4FG+zJapuMKEmIkrGhdpgAyiZpLw7igY9o59oCQ5QrlsVwRH7Zg7dLqGv0wCcmUewR9Bx2vzV5YBR9Vse6nLdOWRGtSxrhT3CqfUaQDHn7QDiFGzSl7endk2wG0h0QCnf67zwhcCTRlZZP8bHYuI8HNm3h2yhMpLFh5NoEgqFEnleJ6anl/8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0bb4994-ca0d-4a04-b7e0-08dcc8a4b794
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 03:34:56.0691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EkYj19kAzX1WiVrMXoAjrz//qJPYHaaSLjnmrIxrVuc+DEz1NScHm43Au0+W+7MtThhOpmXjZepQYYsnBoFAD9+t6ik/u5AIaHdXIrkPGK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6599
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_01,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408300025
X-Proofpoint-GUID: IXm2cakO_Y1_OyTRNvFeICspQJ0PW_5E
X-Proofpoint-ORIG-GUID: IXm2cakO_Y1_OyTRNvFeICspQJ0PW_5E

Attachment did not work apparently...  Inlining...

#!/bin/bash
#
# Oracle Linux DTrace.
# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at
# http://oss.oracle.com/licenses/upl.

##
# ASSERTION: The ERROR arg3 value reports the correct PC value.
#
# SECTION: Variables/Built-in Variables/arg3
##

dtrace=$1

DIRNAME="$tmpdir/arg3-ERROR.$$.$RANDOM"
mkdir -p $DIRNAME
cd $DIRNAME

$dtrace $dt_flags -xdisasm=8 -Sqs /dev/stdin << EOT &> D.out
BEGIN
{
	x = (int *)64;
	y = *x;                       /* 1st ERROR */
}

BEGIN
{
	x = (int *)64;
	y = *x;                       /* 2nd ERROR */
}

BEGIN
{
	x = (int *)64;
	y = *x;                       /* 3rd ERROR */
}

BEGIN
{
	x = (int *)64;
	y = *x;                       /* 4th ERROR */
}

BEGIN
{
	exit(0);
}
EOT

awk '/call dt_probe_error/ {
	sites[int($1)] = 1;
	next;
     }

     /error on enabled probe/ {
	if (!($NF in sites)) {
	    print;
	    print "  No call to dt_probe_error found at PC " $NF;
	} else
	    ok++;
     }

     END {
	if (ok != 4) {
	    print "\nFound " ok " valid calls to dt_probe_error, expected 4";
	    exit 1;
	}

	print "OK";
	exit 0;
     }' D.out

rc=$?

[ $rc -ne 0 ] && cat D.out

rm -rf $DIRNAME

exit $rc

On Thu, Aug 29, 2024 at 11:24:53PM -0400, Kris Van Hees wrote:
> How about something a bit simpler like the attached?  We don't really need to
> get too specific because as long as the reported PC in the ERROR reporting
> matches a dt_probe_error call site, we know that the reported PC is valid.
> 
> I think that would be sufficient as a test for the arg3 value.
> 
> On Thu, Aug 29, 2024 at 06:18:19PM -0400, eugene.loh@oracle.com wrote:
> > From: Eugene Loh <eugene.loh@oracle.com>
> > 
> > The ERROR probe's arg3 reports the culprit PC, whose value can vary
> > with minor implementation changes.  On the one hand, we do not want
> > tests to be overly sensitive to this value.  On the other hand, we
> > do want to check the value is correct.
> > 
> > Therefore:
> > 
> > *)  Change tests that dump ERROR's args to omit arg3.
> > 
> > *)  Add a new test that checks that ERROR's arg3 is correct.
> > 
> > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > ---
> >  test/unittest/error/tst.DTRACEFLT_UNKNOWN.d   |   6 +-
> >  test/unittest/error/tst.DTRACEFLT_UNKNOWN.r   |   2 +-
> >  .../regression/tst.DTRACEFLT_BADADDR.d_path.d |   8 +-
> >  .../regression/tst.DTRACEFLT_BADADDR.d_path.r |   2 +-
> >  .../unittest/variables/bvar/tst.arg3-ERROR.sh | 172 ++++++++++++++++++
> >  5 files changed, 181 insertions(+), 9 deletions(-)
> >  create mode 100755 test/unittest/variables/bvar/tst.arg3-ERROR.sh
> > 
> > diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
> > index 001903ff..bfc77bf5 100644
> > --- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
> > +++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
> > @@ -1,6 +1,6 @@
> >  /*
> >   * Oracle Linux DTrace.
> > - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
> >   * Licensed under the Universal Permissive License v 1.0 as shown at
> >   * http://oss.oracle.com/licenses/upl.
> >   */
> > @@ -19,8 +19,8 @@
> >  
> >  ERROR
> >  {
> > -	printf("The arguments are %u %u %u %u %u\n",
> > -		arg1, arg2, arg3, arg4, arg5);
> > +	printf("The arguments are %u %u PC %u %u\n",
> > +		arg1, arg2, arg4, arg5);
> >  	printf("The value of arg4 = %u\n", DTRACEFLT_UNKNOWN);
> >  	exit(0);
> >  }
> > diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
> > index b11f6c99..3e7caac4 100644
> > --- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
> > +++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
> > @@ -1,4 +1,4 @@
> > -The arguments are 2 2 4 1 64
> > +The arguments are 2 2 PC 1 64
> >  The value of arg4 = 0
> >  
> >  -- @@stderr --
> > diff --git a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
> > index c23f9503..ec519f4f 100644
> > --- a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
> > +++ b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
> > @@ -1,10 +1,10 @@
> >  /*
> >   * Oracle Linux DTrace.
> > - * Copyright (c) 2015, 2020, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2015, 2024, Oracle and/or its affiliates. All rights reserved.
> >   * Licensed under the Universal Permissive License v 1.0 as shown at
> >   * http://oss.oracle.com/licenses/upl.
> >   */
> > -/* @@xfail: dtv2 */
> > +/* @@xfail: dtv2 d_path */
> >  
> >  /*
> >   * ASSERTION:
> > @@ -18,8 +18,7 @@
> >  
> >  ERROR
> >  {
> > -	printf("The arguments are %u %u %u %u %u\n",
> > -		arg1, arg2, arg3, arg4, arg5);
> > +	printf("The arguments are %u %u PC %u %u\n", arg1, arg2, arg4, arg5);
> >  	printf("The value of arg4 should be %u\n", DTRACEFLT_BADADDR);
> >  	printf("The value of arg5 should be %u\n", 0x18);
> >  	exit(0);
> > @@ -29,4 +28,5 @@ BEGIN
> >  {
> >  	d = d_path((struct path *)0x18);
> >  	trace(d);
> > +	exit(1);
> >  }
> > diff --git a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
> > index 8c601a43..be1f6d5b 100644
> > --- a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
> > +++ b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
> > @@ -1,4 +1,4 @@
> > -The arguments are 2 1 28 1 24
> > +The arguments are 2 1 PC 1 24
> >  The value of arg4 should be 1
> >  The value of arg5 should be 24
> >  
> > diff --git a/test/unittest/variables/bvar/tst.arg3-ERROR.sh b/test/unittest/variables/bvar/tst.arg3-ERROR.sh
> > new file mode 100755
> > index 00000000..4b139be2
> > --- /dev/null
> > +++ b/test/unittest/variables/bvar/tst.arg3-ERROR.sh
> > @@ -0,0 +1,172 @@
> > +#!/bin/bash
> > +#
> > +# Oracle Linux DTrace.
> > +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> > +# Licensed under the Universal Permissive License v 1.0 as shown at
> > +# http://oss.oracle.com/licenses/upl.
> > +#
> > +
> > +##
> > +# ASSERTION: The 'arg3' variable in the ERROR probe is correct.
> > +#
> > +# SECTION: Variables/Built-in Variables/arg3
> > +##
> > +
> > +dtrace=$1
> > +
> > +DIRNAME="$tmpdir/arg3-ERROR.$$.$RANDOM"
> > +mkdir -p $DIRNAME
> > +cd $DIRNAME
> > +
> > +function dump_files {
> > +	for x in $*; do
> > +		echo ==== $x
> > +		cat $x
> > +	done
> > +}
> > +
> > +# Run DTrace, also collecting disassembly.
> > +
> > +$dtrace $dt_flags -o D.out -xdisasm=8 -S -qn '
> > +BEGIN				/* dt_clause_0 */
> > +{
> > +	nerrs = 0;
> > +}
> > +
> > +BEGIN				/* dt_clause_1 */
> > +{
> > +	x = (int *)64;
> > +	y = *x;
> > +	trace(y);
> > +}
> > +
> > +BEGIN				/* dt_clause_2 */
> > +{
> > +	x = (int *)64;
> > +	y = *x;
> > +	trace(y);
> > +}
> > +
> > +BEGIN				/* dt_clause_3 */
> > +{
> > +	x = (int *)64;
> > +	y = *x;
> > +	trace(y);
> > +}
> > +
> > +BEGIN				/* dt_clause_4 */
> > +{
> > +	x = (int *)64;
> > +	y = *x;
> > +	trace(y);
> > +}
> > +
> > +BEGIN				/* dt_clause_5 */
> > +{
> > +	exit(0);
> > +}
> > +
> > +ERROR
> > +{
> > +	/* Report the problematic PC and continue execution. */
> > +	printf("Error %d at %x\n", ++nerrs, arg3);
> > +}
> > +' >& disasm.out
> > +if [ $? -ne 0 ]; then
> > +	echo DTrace failure
> > +	dump_files disasm.out
> > +	exit 1
> > +fi
> > +
> > +# Parse the disassembly for start PCs for the dt_clause_n.
> > +
> > +awk '
> > +BEGIN { phase = 0 }
> > +
> > +# Look for disassembly of dtrace:::BEGIN.
> > +phase == 0 && /^Disassembly of final program dtrace:::BEGIN:$/ { phase = 1; next }
> > +phase == 0 { next }
> > +
> > +# Look for a blank line, denoting the start of the variable table.
> > +phase == 1 && NF == 0 { phase = 2; next }
> > +phase == 1 { next }
> > +
> > +# Look for a blank line, denoting the start of the BPF relocations.
> > +phase == 2 && NF == 0 { phase = 3; next }
> > +phase == 2 { next }
> > +
> > +# Report PC for each "dt_clause_n" (or a blank line to finish).
> > +phase == 3 && /dt_clause_/ { print $3, $4; next }
> > +phase == 3 && NF == 0 { exit(0) }
> > +phase == 3 { next }
> > +' disasm.out > dt_clause_start_pcs.txt
> > +if [ $? -ne 0 ]; then
> > +	echo ERROR: awk
> > +	dump_files disasm.out dt_clause_start_pcs.txt
> > +	exit 1
> > +fi
> > +
> > +# Confirm that we found expected clauses 0-5.
> > +
> > +for n in 0 1 2 3 4 5; do
> > +	echo dt_clause_$n >> dt_clause_start_pcs.txt.check
> > +done
> > +if ! awk '{print $2}' dt_clause_start_pcs.txt | diff - dt_clause_start_pcs.txt.check; then
> > +	echo ERROR: did not find expected dt_clause_n
> > +	dump_files disasm.out dt_clause_start_pcs.txt
> > +fi
> > +
> > +# Dump the error PCs to a file.
> > +#
> > +# BEGIN has 6 clauses (0-5), but 1-4 have the problematic instructions
> > +# we are looking for: "y = *x".  Each time, we check if address x is 0,
> > +# calling dt_probe_error() if necessary.  Then we try to dereference x,
> > +# again calling dt_probe_error() if necessary.  Since x==64, the second
> > +# dt_probe_error() is the problematic one.  We look for those calls.
> > +for n in 1 2 3 4; do
> > +	# For dt_clause_$n, find the starting PC.
> > +	pc=`awk '$2 == "dt_clause_'$n'" { print $1 }' dt_clause_start_pcs.txt`
> > +
> > +	# Look for the starting PC and then the second dt_probe_error().
> > +	awk '
> > +	BEGIN { phase = 0 }
> > +
> > +	# Look for disassembly of dtrace:::BEGIN.
> > +	phase == 0 && /^Disassembly of final program dtrace:::BEGIN:$/ { phase = 1; next }
> > +	phase == 0 { next }
> > +
> > +	# Look for the start PC of dt_clause_n.
> > +	phase == 1 && ($1 + 0) == '$pc' { phase = 2; next }
> > +	phase == 1 { next }
> > +
> > +	# Look for the first dt_probe_error() call.
> > +	phase == 2 && /dt_probe_error/ { phase = 3; next }
> > +	phase == 2 { next }
> > +
> > +	# Look for the second dt_probe_error() call, reporting the PC and quitting.
> > +	phase == 3 && /dt_probe_error/ { print $1 + 0; exit(0) }
> > +	phase == 3 { next }
> > +	' disasm.out >> err_pcs.txt
> > +done
> > +
> > +# Do a sanity check on DTrace's error output.
> > +
> > +awk '/^dtrace: error on enabled probe ID [0-9]* \(ID 1: dtrace:::BEGIN): invalid address \(0x40) in action #[0-9] at BPF pc [0-9]*$/ { print $NF }' \
> > +  disasm.out > err_pcs.txt.chk1
> > +if ! diff -q err_pcs.txt err_pcs.txt.chk1; then
> > +	echo ERROR: problem with DTrace error output
> > +	dump_files disasm.out err_pcs.txt err_pcs.txt.chk1
> > +	exit 1
> > +fi
> > +
> > +# Check the D script output... the arg3 values reported by the dtrace:::ERROR probe.
> > +
> > +if ! awk 'NF != 0 { print strtonum("0x"$NF) }' D.out | diff -q - err_pcs.txt; then
> > +	echo ERROR: D script output looks wrong
> > +	dump_files D.out err_pcs.txt
> > +	exit 1
> > +fi
> > +
> > +echo success
> > +
> > +exit 0
> > -- 
> > 2.43.5
> > 
