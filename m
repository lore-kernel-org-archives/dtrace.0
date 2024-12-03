Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2471F4282
	for <dtrace@lists.linux.dev>; Tue,  3 Dec 2024 13:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733233452; cv=fail; b=lptVwBN7sRH613hWXZVs2AUPRmO03tu6yDWtbSDqJrc6OU1o/wVLSBptP844HUmeh4z6U6yFe2IqABVz96LfuoGtms3eC3WG25LXOYRGGkHUPxcHFFoXrRVtcP4i9Cbqj2mWsnpEObgTmBdNUF8lyTHPfjObLCbjbSJFK+RZBmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733233452; c=relaxed/simple;
	bh=6kj72Xsw32625By5m0YN7uG5p0j2W8MWDVVGKxl0ap4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=NClCX6DBijvWLM2WNI3zU6pdIzUnwrmlsYwyp1VCnGGya4xtfksnHodkSpAXL63/OCSYd+64s7NOODn3w9OZo9np0Az8pahD6wQZM+zq67hI7j30skNBPhLq6eSNbwETQnvLkzibmMkCqw4SGnLsO7JXNgRoLEXVjrU6EjmMiZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VOuYoDWe; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FM4aGo/n; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VOuYoDWe";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FM4aGo/n"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B37XZi2005025
	for <dtrace@lists.linux.dev>; Tue, 3 Dec 2024 13:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=6kj72Xsw32625By5m0
	YN7uG5p0j2W8MWDVVGKxl0ap4=; b=VOuYoDWe2UihueMAUlce37HZ+IdVr6bT4g
	E5TAA1edvQ2FlBXMC9u1JYwYaYHqK03+CEifKmdAvbZxqwl6WA3vs/8LR+y7YOLl
	zDns7irHv8l43bekQey9e+a5IP7Ye179XoVKmyUIdz8Gc8Z61IWuRkaATRnx2Z54
	ZRgIUReSVcUv7f8VXPK8mAYKM2sRzJnnqU7sOruvwoA1guKkBcQsrO85+9rixJt0
	9G65RmPZJJ1Jf9ZmWpFV9+5mb10TdPVZZajUqLLHakkD0OnnCOtSOycNKPVn4+Xg
	b3fpDxgabEn93v/xxyeizPo/fwIndHLZ1i9+G695TZ+mCUxa0f9g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437sg263kw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Dec 2024 13:44:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3DcvNY039064
	for <dtrace@lists.linux.dev>; Tue, 3 Dec 2024 13:44:09 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 437s580fb9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Dec 2024 13:44:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=byzrsRe/n8syGXG2yi126GG4uB1IRRuXSw0M4SrkvVfBpudY247PxocE5ydxdxdTsyGDY+hCy0HQyY+/y16Cj5ZcB5jhTY+6DA1yyqdJXWUFFswDw9kmHsju4fv4PuvwDDoeD1+pjeIExgz4w82/VqZsCp8p8ZljsOhifgSWsSFcTh98uRgLp+t8fOoblN3leTunb2T3wCQqQddHTlgt+HtcJsuM/9DC4mKLgvnxMhHFHoQ4HsSfTC8NGLNwgYBCEc7fY8B+gyuPxH6bdnY72B852rCpt3GGdQybt9NJExvdoJClRVql8m74R9LUs5qr1mW3AXFyvApqBTkL3L6Psg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kj72Xsw32625By5m0YN7uG5p0j2W8MWDVVGKxl0ap4=;
 b=XGk01UGjZMFvmyaUo84i1yM8lgUMVmbdAWMXRDyMo4je3FSmoWRoy0uH2yd1sNvIaAUks7yQJU3xKrr/uRvmFcoaFBF4H1ZN+/3pJ3k293h3nO9Lj68+59qOb1JkKYhZCy3H8ELpAhzc7MapCYq5LhQJc3an+DsmLEZMYi78RU7n35uNfDjl53VoxA0/EhfBdZ4iLZnb6nVaIt12mP7jBIkbANQhdvfSG0eXnms2B+5qUEiBGRMqiTrfH0S0pN6o4WWvuWOauDXTYw6xLw8nL6SLwBkw/VZT9B9GUGXkeem88emO5JzLOKmepAqXjpD82iiifVTsNx8I6hj1cgKnxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kj72Xsw32625By5m0YN7uG5p0j2W8MWDVVGKxl0ap4=;
 b=FM4aGo/n+FM7vGM3DU4VC4eVSHVFW4WPP5r1gCI6pc7e79M2uS2U47GXqzIah3PhlG6t0yYIdDBSvEm17Y5gx+2ypXA2eLMEFZHOrKQxgnU0BKmC2JzbD5FQFL2l4MmSMj/Mxk5Zsj28barq0vlCqQoJEBLsoKT5fHHDBzaQBQI=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by CH0PR10MB7535.namprd10.prod.outlook.com (2603:10b6:610:187::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 13:44:05 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%3]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 13:44:05 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: eugene.loh@oracle.com
Subject: Re: [PATCH 2/5] proc: more self-grab improvements
References: <20241203113610.75104-1-nick.alcock@oracle.com>
	<20241203113610.75104-3-nick.alcock@oracle.com>
Emacs: Lovecraft was an optimist.
Date: Tue, 03 Dec 2024 13:43:57 +0000
In-Reply-To: <20241203113610.75104-3-nick.alcock@oracle.com> (Nick Alcock's
	message of "Tue, 3 Dec 2024 11:36:07 +0000")
Message-ID: <87frn43mqq.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0689.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::14) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|CH0PR10MB7535:EE_
X-MS-Office365-Filtering-Correlation-Id: dd34e75a-4d0b-40d1-6820-08dd13a08caf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IAtMlpLNQvh18CBTQeDynaVyhSNIeIXLiMU51eQzRt4N7s6c3Dm3NNeZ5Gfk?=
 =?us-ascii?Q?IaBSzVwpoWyjSP/xnnp41i2tmzY09exWgSmi5I6na0OqtOxF6TD8Aqmy64AJ?=
 =?us-ascii?Q?T1Y9SL8PtSV+4XxNe1X763wQDkUUR4BOvLbzbexjkuRq72uZPKrK+rAfaeuf?=
 =?us-ascii?Q?81eK1MpUGjcLnTzgDNEUkvBBTdfQx9qMzBAURe00PweWs9RZdKkesXRBnYOU?=
 =?us-ascii?Q?m/RDIRGSqJNtbvnV2JWo1FtqETEp0Av2DcCJpNc/jYSBGJcAmgEZ81kWFnil?=
 =?us-ascii?Q?5CaOfdUjGUluZJ+LtIK/yHOcQJFpPJVnO3dxrBQrf9schZQT9oTVSqANYkpa?=
 =?us-ascii?Q?3y9lz+JLPMIFAxUy/BAwjLEwM/0xM4zgEb2zXuc0ZxkLPsUX2LCzbbNkgx3C?=
 =?us-ascii?Q?m8jbeUUvM8XUZTWHCj/Gen8tPs1jl2XPKUfTPZmqW9VHnNOgTXMM9bMK8qnN?=
 =?us-ascii?Q?YmKIkFqFqsc+5jcjNou94rO6Bv3IqCnZiqGYlkOYIyqCVVW/MX+oPh54i4Yl?=
 =?us-ascii?Q?z/ELoDGGeCWd7J2X+xJkyhMEyxHe2cg4infBKn+8/92waPNfOasoLoaaHZj1?=
 =?us-ascii?Q?4oLH65eR/TGE2m6Sentzw2WGOlSn7CfuX682v3jgIIG6A21LlOR3oupiGsNe?=
 =?us-ascii?Q?gZPwUHpRRn15B0ZFFNOA87c1+giRT78KbTsEkmoOFywWcHtwATp5bclcY0X2?=
 =?us-ascii?Q?46x0UTruGS5lU5bHZot02V66VcYI2MYC9PY5+iK+ocIsC43YGlOHw8fR6glk?=
 =?us-ascii?Q?Khucm2OxYkDbj9ZmA1nGIjfc5fGhqZSlz0Or5a3cryk5wt4izLNt6kB/p/ri?=
 =?us-ascii?Q?6q86liSPz9JaZNjqdGnQRaMB5Jriud8hW+Oc8iY98Rb53wzWP3+VmXQGYMrq?=
 =?us-ascii?Q?bQ1yZyFcrN91k9acQhRHfrpbZ506wainkP3AcjZzJ2lvaaVCIz5bwT4nc+sI?=
 =?us-ascii?Q?S9HV5sBbcYV39/EMI7UZi9CbcLlq+VaoDAwhu1MULdXG2KqEuHecZyXBfNvZ?=
 =?us-ascii?Q?Ymvfx4pS+NqknHQyxUmL2MzqIN0UwzLazGcXDR3gdwi2DTbXpyWEN3L0zIfT?=
 =?us-ascii?Q?QFxnfvig3+g+kv+AkVVJ0isShQLquC46EzToaYCoKEqVO2l61/eQUPzZqppy?=
 =?us-ascii?Q?zavetBcCHazP0Xp0xnH3tW+RuGzsj58ZzU5CLDioQWxhpOWUI8TfWlBR1e3V?=
 =?us-ascii?Q?5LxRfBzLNQe69tVOEJvb8gF9n0YkE0stxKNMlwE4bQgYhJ60pWOABb7BNEwq?=
 =?us-ascii?Q?UxvKVY4d155hxKvzoMnRUa24s9ChktzDJAjaljxb8iTSvOsAmNCERzvVCMPY?=
 =?us-ascii?Q?uy5ms77BhbEB3ASogjrZpS8QMcaXPgYQXarevsuZHfAeVQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?46QDhuBXH4krZd9Fgi2wiJKXgmrTrziXAPH55PFm7XG/8G4lLeKcoJ0SwPZ4?=
 =?us-ascii?Q?Qbi21PIoOdPUy7Y2UxOgI5GkbWGG9u2QldjabjKQBKrDX9Rj/uAUnK5/jJQJ?=
 =?us-ascii?Q?fg3Q8/FnNwHausqwP6ywbVZBFS/iPCan3ZZOyCqO9JAC7xjArZdkOoMxn2sn?=
 =?us-ascii?Q?f9PsRbROwQcqnBtiG0ahkMPKqtq0bt8DcJexmriHddQrLW4DXEm6KUqERbbk?=
 =?us-ascii?Q?g8NxTAW8eveKCLikJ6WCQyqnroUOCe4QKhodSk1ZoXcn1bzQowbZHhi3tB0X?=
 =?us-ascii?Q?2JoZi35Q7xvVa3FOTYNQB0b7lSo1yHsd6g9dvuJVjnX5SLZiRUY8JIazMON9?=
 =?us-ascii?Q?drYToxiIK2vCTyyvUU8UcY1KmB4MvTcR9NSeDv4bJ/czH9bqbYagdSzkqSkS?=
 =?us-ascii?Q?qoG8u9rOXg4GglmvEQpZZZw0FkGo69BcoaXFfrNF82B9pK1ULW0hg/BysG/9?=
 =?us-ascii?Q?6UHsmB4zp6GTo5vBCZui8gIf+s5JMRZHX5bVLONJvTUEW8ZS6ZR1382aurkm?=
 =?us-ascii?Q?ftEugiZlcigC/Smeur3rMq3AtwmgdQJFdvn2KjW1tXmzY2RmPlkvABP62yg0?=
 =?us-ascii?Q?nBLfaIUE9BT8GJkIiz0nsUp39HjU4YMhUVzG4cSa659MZPBaNj82tvPGCp05?=
 =?us-ascii?Q?BktiQC9beQ6guxDAMvLclWCasxJ1QD0PRJWuhKDOI2IWuy8Coi4LMXatvYh2?=
 =?us-ascii?Q?w1AT6elNyyxQfpj/+tWs6g27KUeK/sigus2dM28uLLxYXWzt/oQ5L+qYrlje?=
 =?us-ascii?Q?DgZZyROL2cPJ3u75JtQHiwf3sLXUe7z3ozewA4U4tSkkuVlJ08VKKtuSJSF6?=
 =?us-ascii?Q?OHXyyGiXXSaiekdId1lQ2VOSQJNKThYFrc6KztQAPSLwF1Ip+MHfC/7UdxaV?=
 =?us-ascii?Q?GS2XPLtMhgM0bqbKUBSnrmktRYpmWQXqQfCxOuYCDGVMJKma1Mb9VPe/YDMT?=
 =?us-ascii?Q?FIg127IJzCzv9HrAsflIugwq38MwzGuCjoPLcPxPgulEfPLO05srGAeHBEC1?=
 =?us-ascii?Q?uzw+vyIuYXeM3Gjx6aN/XwQYMqaqbBQa18WJFD6oGIJU/Ncf1HZzuE1uYf1h?=
 =?us-ascii?Q?FIR4G5GTQ60Kqkew3CO2YCcHghamW36nOsHEFnNvR1F2hWl+tsO5sTSancKW?=
 =?us-ascii?Q?WUwdPmXITVuzsLQwXxulbbsuo7DtPeOIKGemv2NuIY56zWL3hg2NwWVzUm3k?=
 =?us-ascii?Q?ntU/gxf3vlAlgH15h3FIN/Ii0Q6i061Keebs6YU8So+ux8NRZrVIkd1fP1x8?=
 =?us-ascii?Q?ze1Lg4fu7ZDkdyvtrNh4arZ9M8TOVUOujlYKIKXyap1JIVxzWy4QjeVaKc2e?=
 =?us-ascii?Q?mO1JErxYHRGaO7Fz8LH1og3P1PACxDRjG0l726BQ/3C7NckBcUgDT8fi7nVA?=
 =?us-ascii?Q?uzuCQohZsPO40U5orCihMNvjO+Gu6ahepyLMfI9GyzNT6fvTlqU8qQbS+Jmj?=
 =?us-ascii?Q?VHqVjB+dNv1kkwaY76JKaTd8AnjhdGk2AW7neg0hS7pE+1znGYXocll4LRbR?=
 =?us-ascii?Q?zSFWDyYLDmFZY/yW2Rp/kau3sFUIvY0Y9yGyETZkxR9KFw7qv7/T9QoS0UXO?=
 =?us-ascii?Q?2w/82Vf0zruM1NPGyU52EBO/fIjCONkHx3AVreyF4SH0+0Y/QGmqXqOtF55A?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4Oz9H/DpRozcNIWZG5mwfOcuupxlNAnb0fYuXt6PF2Jct4QrjatLRwN+AZ4eIw29AzsKexhaqyUaHS2Iej0gAtdzg9UQ5rljEs8UmHIDEaS5Ru3cbqo5T9zZWe3/sCdiKzffZQU3jy1JSAK9CyoL7d4pQNFXrswFz3J1Zg0r1900CGkV3RUmi1J0OTQUdIc+9CnH4DcULZwbC8kZRoD45KAl3zwQgiyazzkWUNMOlANQt8CwOC4pOyITuhfqINM4i9nStuWrmiEOtdIVzR/JIPbsLfVCMak1c3JxyJphwQ2LBfPLe2ARiU1ScCrgW1XGq9PliYlccs9zRIjrqhOVJimksGG/FWBfZUHVOreXQSeUbIiQBOhCksZjRNBJAL+fSen3i0C8NHKFLibMY7uRbwC0An1CE8A6k2TzoKZtr90cTKyuzDjdvs1qK7/a/skJjMQsCANrG0zPjsWEjFMPowPPHdhuDeOQgReChZ9CE5dDQc+ldZlNPf2tsodYKprgkxtOESIe0Fe67Qi+C6TS4yY907kJvRbewWyAWyZfDulTNUm2HK5lSOnMQ5mWQyIoFRLmVpxFtcTMFXb9IiUiNkORpoNsaO3V922d/zJLBqc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd34e75a-4d0b-40d1-6820-08dd13a08caf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 13:44:05.2654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lagk6xZ4+/FgIy4IUa1/oqtH5mtWl+rXqze9jTZj9MSzjifaVI4YysmOAS1yTo5b8KX7HDaj8ZTID8e3my6XpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7535
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-03_02,2024-12-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=605
 bulkscore=0 phishscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412030117
X-Proofpoint-ORIG-GUID: t2hZ2JApY6se5TURMvcikeDMHXHyrkKc
X-Proofpoint-GUID: t2hZ2JApY6se5TURMvcikeDMHXHyrkKc

On 3 Dec 2024, Nick Alcock outgrape:
> This has survived a thousand iterations of test/unittest/proc/tst.self-grab.sh
> and test/unittest/usdt/tst.multitrace.sh with no failures (after the other
> patches in this series are applied).

Also survived internals/libproc tests (just making sure I didn't break
grabbing in a more fundamental way):

1300 cases (1100 PASS, 0 FAIL, 0 XPASS, 200 XFAIL, 0 SKIP)

(and survived a more conventional full test run as well).

Alas tst.lmid-consistency.sh is still failing: I must figure out why and
fix it one of these days, now lmids are becoming slightly less
absolutely useless on very modern glibc.
