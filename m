Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD05B310647
	for <dtrace@lists.linux.dev>; Thu,  2 Oct 2025 14:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759415669; cv=fail; b=fDsg3Fev4IvzNuWYprD3ABvbR07kksPAzscWoesqe2HscJNx5Sv5zj7tfV1oyWBUql0hbbAQaT57/mPeHQPowBBXYZqo7I5LsRCULRY4/u7WtZZVNzVW8ld4OtLQIVeFVob/J+6grKik682gUHBqQEWt6W+GH+497Iwx0LCxX1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759415669; c=relaxed/simple;
	bh=ol+me4xdH73ub00xNKHi18JQNNmF8Al5Q8+PihCztas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=An5DoIJLtb83RHIK5pJDXhPfMxyHlTx+Fq5r+smfQECp5ZzKqjipzAeoxaEtxNfnWfWV2A4h5aijxP6qi1vugmifyI1pPbUKu/bVfrO5OtdILGPax7qyQ939rwazrOPRGs77etFdPYhjZTU6hWUfMZ8JR9L1zfmYRK3QJ6OmKsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=e/9cme9S; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NT08eBMV; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="e/9cme9S";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NT08eBMV"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592DNK8p015096
	for <dtrace@lists.linux.dev>; Thu, 2 Oct 2025 14:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=BjTSYUd0mwyaXyorZO
	hv+XSOsnDS3H4Y4YnBsa88zbg=; b=e/9cme9S61lb6eibhEtCReaFq4OjNx6jh5
	+WnPLSUV9W0CljMDyKbWGfQl0ErXGehICEwG7lwRTmWuSpCz/OkHArrDZcTzRrrS
	zB7lBxcDksl2PyrO5GpHa3NYgk9hkSopVgIUOc+KoL61G3MBjQ7p9ipFY0C4pIRK
	ixVMlm8rt4aTzHaolVPmZ0HxgicGZL2KRCDgvT5BhYlmaWm12oKsH/cq9MehT5dQ
	HZsZv6ZxYOZkN+ACaFVAcbQg2Jn84vzcoPrj1zLtsT3ATenkRD0C8Tt87v3/Xmzn
	wVyPxBqdYB70X3/Ip6+eWMDIBFHYAq0g1I8Yj7By1EgEcXZx4VxQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49gmrfud86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 02 Oct 2025 14:34:26 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 592DkA3x000367
	for <dtrace@lists.linux.dev>; Thu, 2 Oct 2025 14:34:24 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010019.outbound.protection.outlook.com [40.93.198.19])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49e6ch0qmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 02 Oct 2025 14:34:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RQBA9ylrXNqa1YiyXuVsHst0RJSzUJQ2P2I1bazedEF0enthMi7cmHn1qLN1wF95c/Gx6WcnmeFUD7FhZuGrxgtZIa5vMhQSN58b4gIr3c9Db5lM7nSp5NrI0RpjaLg7v+UgzWzkJ3Z1YhVmoDgAnPaEIfp8jKXK133PGMiVabxeDXlhAAFbHYsk+CJAeTBorVJ0bF1h3v87SC9c7C9VGwtMmax21v28dgChfPHM8Tq9YptJRUVIyRccqxfRNymKvOJhA0MLF08HyrCARkjEEzGK+W+MNlZlWbfiBYlSmHNCWrvxdKmVJP77RLSxUVh+wiP2zc7GZ4dzjI8V9fUgNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BjTSYUd0mwyaXyorZOhv+XSOsnDS3H4Y4YnBsa88zbg=;
 b=shDUQdFXiB0RYLom14zQ2ipafewZQmTQ5zWU/3SdopIePR3FynMX9K7/TymGfxijtLJ5gZ8OX60hcjBRW4RW0bJXyUc/5iqjLcugge0xWXthPUAyM09CeOHvNk4ZB1ouxWWvZaXU1dVP7m25D+gS/M4CorgHz5HOy4TXxn7uNtbK3jvuUYrT895j8ipOB7wbRoCPLXghm9Lks6v0bdh+xfzvRvy6/7HXjYKGx9qryazhh/sdS5Yd7g8tt9+PE8CDyTNKd6wlq3c96GrAbDUrknZk/PCXaB6JJlHKDREBRghFWawOo/gMfuS39pGg2P4vgv6CIB7K4K8E3gV0f6N0pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BjTSYUd0mwyaXyorZOhv+XSOsnDS3H4Y4YnBsa88zbg=;
 b=NT08eBMVPnID3Si8z1/p4zjxX8VIEGn+KGQiwKpnwCkajQHoos+FEpDcOIStM55HBIdHFv7PJ8+GLXHl9OaV9Bn+iYFf59z8dQuclGt24dBOtx37U4nrtJ9OhciJTD4dRMdNHHagpt3tbyWoDJ+UT28U8VAhBeRpYTjqCZpd+94=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DM3PR10MB7927.namprd10.prod.outlook.com (2603:10b6:0:42::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.16; Thu, 2 Oct 2025 14:34:14 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 14:34:14 +0000
Date: Thu, 2 Oct 2025 10:34:11 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Fix proc:::exec args[0]
Message-ID: <aN6NY92lDrk+93PL@oracle.com>
References: <20251002050558.22052-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002050558.22052-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:208:36e::12) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DM3PR10MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e5ae2b6-4df2-442a-3c6f-08de01c0c268
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4PnncsBLFMOoHgFeIp35Q+p2eZhtrVSnuTrEbrog1Qn9JXcPCRT4i6XPxY2h?=
 =?us-ascii?Q?zKz9NUDe/741jLnA+LMaqDFCGn30s+AjmVKpwDKGwuut/qj05lHME0WHFTok?=
 =?us-ascii?Q?pxohql0MLyBi3X0kAvi1K+LIJhw5153LhCh5RpdIKzxzdfrwBrPQPSHhHIaK?=
 =?us-ascii?Q?yfu9S4C5mqjU3zVItqyFCoslFhXVOVjw5uABO9Xb+Fw/zHrWVP1DSeg1tAK/?=
 =?us-ascii?Q?Flm6Y6rCUxdFtZHAnB/cWh0NO2TUYvnyTHzrx+ZE+OxvNuDhLunmzTyl+DLz?=
 =?us-ascii?Q?Pxi1WjfVwFX5axsUQvNDPTrgXd0CJTwmtAN07jFe7br38w/jYFLvaacENOS1?=
 =?us-ascii?Q?jWcnLq3e7LNyGJzCNFi/zoRvumc87sn6l0oJi/FPJyiJgWKzxFS8DoMDYCCz?=
 =?us-ascii?Q?Njk4UKqIejnQwQ2jQVGT7p0/ZMhDTXVlON2pRHyI+fr85I0xST+tTirg2kau?=
 =?us-ascii?Q?izyhOdwCryZnN5docAxozTHQltut6gBjar0yejKmfUjL15boEiupJHY5Aa5H?=
 =?us-ascii?Q?iKamguH6xMh3FUAckILYHEws7tzW51sO975L0PQ3NYhJPm2VIXLE+kyveeSR?=
 =?us-ascii?Q?PHQvvU7xOKCGlTX5eHD/IEIBYnsz4YAj4jlfJ4WolhULhfGWPuv/a0V501g1?=
 =?us-ascii?Q?xvFPstmFvAN9BUlpwZs7cscVps+c/L7c+mkwtuQSmQImJ/rnfE/A6p2iEEee?=
 =?us-ascii?Q?ka+LsSY+I+yKOZcGV7Op2cGgIPSWD+IhRYhu5m30KZH0KBJzb3w3HHtqGBbN?=
 =?us-ascii?Q?tYsk600s9Eiz5tWk6BaGnfdcVOi6KEuEsQcVOelnmQP3ZqoHAkUCJi2RyI19?=
 =?us-ascii?Q?sLa2dv38SSDeJ/YwDXj7kTUlRpEYbArfX5lSzf3GI2nkNYjkSWKMGzDNShED?=
 =?us-ascii?Q?9gcEnhIn64V9nC+uKpq0lgm08DeJ7m1570pKVY6d9julQVPM19fkfYJbGYRQ?=
 =?us-ascii?Q?UGCRS59eWjq27EARLPGklQzthomlwEjbUjTtUlfbTmRmA2V5hz6pW7Inj0Yz?=
 =?us-ascii?Q?sCY+Qrzp5lhrcqQ7CQjRFrLeYzpIKGAnTbyMPsL0ljGirqJM95lIsQe5bXf4?=
 =?us-ascii?Q?Nb381GJMj55/Eem25guHyJI8Ztc0Osb0pjPGNoEbm8wbABHHScXB1ZB0Eh3m?=
 =?us-ascii?Q?dUhbWYu8t67Uea6dfOxzG2cGF/X50zofnGrj2p0nOGPxSILpAhYFrcpp80H+?=
 =?us-ascii?Q?qyb0Gx/FAtxo2MZW2WtmcObcx1JTq2uGLxq9zj2F2zja7Nsc+3NXHFgZwViP?=
 =?us-ascii?Q?aOsPwsuEbnzEg/msI8HevO6O/Yckb4wHro8DCayvb3eb1E+FQXtOiLciANSa?=
 =?us-ascii?Q?OJr5HXLnhBHo7AhfzSTbpwJ9dFkfXuf5WfBYyGlp3KstRO+ZwzsiSleDtW0d?=
 =?us-ascii?Q?GOaP3DT+qDERaZwMfgWS/BwcVp3+CBBPIzzDNSvqeL+0TfSum7oHasaqa+Am?=
 =?us-ascii?Q?lUVJR+ZC/Y/i/hGI6pr2HnJsE7oH+W0s?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OcH1fl3x4aUHxaoBlg+xn9R5bwxJ2jUF8u7EnwbBJuWVct6oCJQGdKml0ywG?=
 =?us-ascii?Q?X+Sv5Yk4U3BqVJyHuVeWqz4xMMKOsunA9WQltMrM31RQEMdGQKSx3ystVewl?=
 =?us-ascii?Q?RTrRJJEAwHH7+G3OSvRTMoVvFXRHkNF5XIXeengMarIR/lIhT0a4ocF0aUJu?=
 =?us-ascii?Q?kwm2C4IaDO0xPT2NL4y5LtApHGpbMSP02z+7w6iLu2+jjeAncfKG/hVI4pjK?=
 =?us-ascii?Q?D+e5SnQDEBZFyMeVfjs9Bo+L9aATvRq9hO3dXXRTzu6Y+840iqTygLi8I3xi?=
 =?us-ascii?Q?lWxQkHfvM1HXgSYQr1xUA6vQIXaZSPl+vutfGQ0NQRJPsgmfygj6z7MqkvFK?=
 =?us-ascii?Q?cbaCSf1dpLA3bHIlX8D2Yu+qOue7VcLdnRmxxTsnoK39eGm2sP0ebBY7Ddk1?=
 =?us-ascii?Q?miMcM8F7rbhWf/YglYOku10+6EpgYIEOuAAfbwjICBTtrfy9sS3hLLHFhzKd?=
 =?us-ascii?Q?GFFcyyI40GN01daGpZn2IALnwH15KXlsb9/kE8fNcsEp8QS1cK9eGV+Wm//J?=
 =?us-ascii?Q?nb/aUEFDAh+Rmh+D+U+rBnaUQ1otq5i9kUTS1vHqIAEIY1MmtOYujB5o/xJb?=
 =?us-ascii?Q?VFYZ4eIhF8GfmNyHmlPn9iMkTW1jJ7JVwoiOhQFEO8jJ7wVmDJG5HNMBJv0N?=
 =?us-ascii?Q?3FvZFv2X9ZzqqavtOe2aB4EOeh16obDkYzrpH6K89fhxfwQ0rWUaZPlngnBH?=
 =?us-ascii?Q?4YlIZ7J5mYNYp8m06tkDmpIzSNQXupF7S07r8LHV87csgrKas9jKJ0hw9mk3?=
 =?us-ascii?Q?+fJRMxyOsIpqeL10vE4X4hbCEcnSFM/jXuqjOHhoMMgU0AtMq/CuTMbDzGG+?=
 =?us-ascii?Q?dUxYaF5sxiPyHuOD9bJx5xgDlhwEr3deaqeiSsj9ORBi1kMy2EPr9xgfnkpW?=
 =?us-ascii?Q?KfGxX5w/87phVLl5ezhPGiJIac9UXjdRLduir9xV5tiFy9bzFMyEeusnwKlE?=
 =?us-ascii?Q?1+bUUGBa3AD8v4XLtwQlmCKymqsaK59RTBQcF8CZ74/SAtelQ53mv+Zy5+NR?=
 =?us-ascii?Q?ehVzJhE1JFOYTYiqYGBqWl8QTP6C1ch67cGhYEtWxooPeZtKkgM6LAfynUBg?=
 =?us-ascii?Q?K0JsHUGFnWmBQz8Zdn6R02jLQv1dQhdkezyF2vTf3Pm5fsAx6eBvwh8gNdHc?=
 =?us-ascii?Q?kArP/gRE65t5ztcKQOWfbQlrahNngaECzjmsj2tYm9c2caVIsDIV/Bp//3CI?=
 =?us-ascii?Q?1Mve7J9flUtez88KegRocelC7pt7vVgTWDpvYi7jCOE0kU90s+QvS3W3Ii+t?=
 =?us-ascii?Q?fmEt6ZwjodSPqpMvUSV8pYYSh6r4//waJ2gLYBvZf0QuDsU6cX0erMt/VKlR?=
 =?us-ascii?Q?AdxfD2B5p4LVgKpt9Sny4OhTZJQaFw44DbNr+rw9z/9sNjpSsC17GFuKeVMy?=
 =?us-ascii?Q?0ljM8SobZ0n9hEWjywBR/BhJDPkNANFBOt4bQQxc054svPkuz0A4IpMFY5wM?=
 =?us-ascii?Q?cO5d8Wp43CFHd3IlvY21jIEHi1FRRv4rApUknP84/UEveY+o5nP2BGLQ2qfO?=
 =?us-ascii?Q?wK8pDUNy9L+gZMWQuXOinj/f1ZC2eTQIT23/Efuvc5Ek4MYF+C8bedtQUdbO?=
 =?us-ascii?Q?4X8rNZ4Xi9HXC7gXTQZFHhUzJHVy5noHudnI7N9neCWTzkZb/lELkIVeKFHx?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PGQQbhKz21yu17odS5g2xR4Vh+syGziMNBfKL1cBc375oA+eQ5DD2wL7ISmrFNvBq4lIzBlOkBAZPSLT70b8N7o4a7fgiHxYmRUiZWHd6oi9AK/YxQrdylG5rDgyASITOZi3Z3RBlyCvEe2nCB8LYVb1hPVhvGOcLK5BB44HsPX1hU5tT7dLLAJWmNGJhO/ryRGORshfptdvXjqmEgbOofzibUEz6rJPmUM+cEYDt3xBdITitNj7ImkJipThfKOptWCvKGXBg8yXdYCAcqMudf03ZSZgXfVxclu1lFDI6Dhbvu9Au0ZjrytLNbc0mqwbvfFEQeBSU50vI1KRVFFEMMludwsrtUONXCsb2+coP0QX9ACdqb2TRPZsB/wUYAe++B45GAIFWZGd6fLn4135wPiw2aho7lUV26QtQ2xOYUifvii8mB1Fdq8sH4v4IfmK8kcMwKqqEkexyHgzpJqUcTu5RI1c74xGRFEs23YsbFNtUd/6Pug9jtz9+snOGm3nNqlm0c2j3jaeNAMFKwQHK0UPiPknlbp2/IQwB8KtfJaSdR+phWThZUt5aAkcLKy3wuaa0bNjwG0bVksqDzbYWtmzqRg29PHjs3EEu4tAnVE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e5ae2b6-4df2-442a-3c6f-08de01c0c268
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 14:34:14.1430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: njxtFdXi/KrS8c9XXvQkTKxEthpY6Mjjs7l6lMcNiOUhLQGhRWdD2FuchDBkgxHElAKBGGK8rogi6tBUaqTPwQX+Z2e9p9fbvaqQlsCVE+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7927
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510020124
X-Proofpoint-ORIG-GUID: Zo_gD-nsII4zwYpB8H2par-irlib8PGj
X-Proofpoint-GUID: Zo_gD-nsII4zwYpB8H2par-irlib8PGj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDE3MCBTYWx0ZWRfX+MmKEJFkf+Ep
 lW8Lxv/jFeqQKlFRoOfFt4M7H3Vxqci2tfdJa8UiP9FkWa9mFlDtrZAkTRXtEMQvXCSMZtKaYsx
 0HSl2Q+b0xekKoyQPYWvNTaEabFo68HfWSjEKXpaUmDc53rfQfCWD0eVy3IRp6UQnuIoJKlczCq
 ESg5H60ztYcyXvaYWdaxK2nEICLyQAVHKV0f5ZY+Ih2aY8SN/RcE82mR0HCUwoXsKNyBBcm0mCb
 HTVJmvLpzqsEyLRG4xAnwFEM3f6IPr+Ei2NPooJsrNGf6zUqT2IjddXtWbP2fy+GOZZ5JhzC7w8
 7k1NmG13UzyKCthvQKXaFmf7mVtHTV81TOLW6o+4m00HPgSko4+6DWfJgVtggM22n7/TpKsIBGD
 hyMpT/dylp4jk9tK3hNGEX0xik2GZvyVayD0MR4DWpJKnW2cvis=
X-Authority-Analysis: v=2.4 cv=VpMuwu2n c=1 sm=1 tr=0 ts=68de8d72 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=HI04yxht2oAq-uXfAzQA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12089

On Thu, Oct 02, 2025 at 01:05:58AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Reported-by: Kris Van Hees <kris.van.hees@oracle.com>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_prov_proc.c                | 12 ++++++
>  test/unittest/proc/tst.exec-execve.r    |  4 ++
>  test/unittest/proc/tst.exec-execve.sh   | 52 ++++++++++++++++++++++++
>  test/unittest/proc/tst.exec-execveat.r  |  4 ++
>  test/unittest/proc/tst.exec-execveat.sh | 54 +++++++++++++++++++++++++
>  5 files changed, 126 insertions(+)
>  create mode 100644 test/unittest/proc/tst.exec-execve.r
>  create mode 100755 test/unittest/proc/tst.exec-execve.sh
>  create mode 100644 test/unittest/proc/tst.exec-execveat.r
>  create mode 100755 test/unittest/proc/tst.exec-execveat.sh
> 
> diff --git a/libdtrace/dt_prov_proc.c b/libdtrace/dt_prov_proc.c
> index 05ad66346..f7e46a5af 100644
> --- a/libdtrace/dt_prov_proc.c
> +++ b/libdtrace/dt_prov_proc.c
> @@ -118,6 +118,18 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(1)));
>  		emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, exitlbl));
>  		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
> +	} else if (strcmp(prp->desc->prb, "exec") == 0) {
> +		dt_probe_t	*uprp = pcb->pcb_parent_probe;
> +
> +		/*
> +		 * If the underlying probe is syscall:vmlinux:execve:entry,
> +		 * then the arg0 is already right.  If it is execveat, we have
> +		 * to copy arg1 to arg0.
> +		 */
> +		if (strcmp(uprp->desc->fun, "execveat") == 0) {
> +			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(1)));
> +			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
> +		}
>  	} else if (strcmp(prp->desc->prb, "exit") == 0) {
>  		ctf_file_t	*cfp = dtp->dt_shared_ctf;
>  		ctf_id_t	type;
> diff --git a/test/unittest/proc/tst.exec-execve.r b/test/unittest/proc/tst.exec-execve.r
> new file mode 100644
> index 000000000..09791d5b0
> --- /dev/null
> +++ b/test/unittest/proc/tst.exec-execve.r
> @@ -0,0 +1,4 @@
> +execve      bogus_direc/bogus_exec
> +proc:::exec bogus_direc/bogus_exec
> +exec
> +
> diff --git a/test/unittest/proc/tst.exec-execve.sh b/test/unittest/proc/tst.exec-execve.sh
> new file mode 100755
> index 000000000..d3f84e0d2
> --- /dev/null
> +++ b/test/unittest/proc/tst.exec-execve.sh
> @@ -0,0 +1,52 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +# This script tests that the proc:::exec probe fires for execve() and
> +# produces the correct probe arg.
> +
> +dtrace=$1
> +
> +DIRNAME="$tmpdir/exec-execve.$$.$RANDOM"
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +cat << EOF > parent.c
> +#include <stdio.h>
> +#include <unistd.h>
> +
> +int main(int c, char **v) {
> +  char *argv[] = { "bogus_exec", NULL };
> +  char *envp[] = { NULL };
> +  int rc;
> +
> +  printf("exec\n");
> +  rc = execve("bogus_direc/bogus_exec", argv, envp);
> +
> +  return 0;
> +}
> +EOF
> +
> +${CC} -o parent.x parent.c
> +
> +$dtrace $dt_flags -qn '
> +BEGIN { dtpid = pid; }
> +proc:::exec
> +/ppid == dtpid && execname == "parent.x"/
> +{
> +    printf("proc:::exec %s\n", args[0]);
> +}
> +syscall::execve:entry
> +/ppid == dtpid && execname == "parent.x"/
> +{
> +    printf("execve      %s\n", stringof(arg0));
> +}' -c ./parent.x
> +if [ $? -ne 0 ]; then
> +    echo ERROR
> +    exit 1
> +fi
> +
> +exit 0
> diff --git a/test/unittest/proc/tst.exec-execveat.r b/test/unittest/proc/tst.exec-execveat.r
> new file mode 100644
> index 000000000..696300e0e
> --- /dev/null
> +++ b/test/unittest/proc/tst.exec-execveat.r
> @@ -0,0 +1,4 @@
> +execveat    bogus_direc/bogus_exec
> +proc:::exec bogus_direc/bogus_exec
> +exec
> +
> diff --git a/test/unittest/proc/tst.exec-execveat.sh b/test/unittest/proc/tst.exec-execveat.sh
> new file mode 100755
> index 000000000..db68a5043
> --- /dev/null
> +++ b/test/unittest/proc/tst.exec-execveat.sh
> @@ -0,0 +1,54 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +# This script tests that the proc:::exec probe fires for execveat() and
> +# produces the correct probe arg.
> +
> +dtrace=$1
> +
> +DIRNAME="$tmpdir/exec-execveat.$$.$RANDOM"
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +cat << EOF > parent.c
> +#include <stdio.h>
> +#include <linux/fcntl.h>      /* Definition of AT_* constants */
> +#define __USE_GNU             /* so unistd.h will find execveat */
> +#include <unistd.h>
> +
> +int main(int c, char **v) {
> +  char *argv[] = { "bogus_exec", NULL };
> +  char *envp[] = { NULL };
> +  int rc;
> +
> +  printf("exec\n");
> +  rc = execveat(AT_FDCWD, "bogus_direc/bogus_exec", argv, envp, 0);
> +
> +  return 0;
> +}
> +EOF
> +
> +${CC} -o parent.x parent.c
> +
> +$dtrace $dt_flags -qn '
> +BEGIN { dtpid = pid; }
> +proc:::exec
> +/ppid == dtpid && execname == "parent.x"/
> +{
> +    printf("proc:::exec %s\n", args[0]);
> +}
> +syscall::execveat:entry
> +/ppid == dtpid && execname == "parent.x"/
> +{
> +    printf("execveat    %s\n", stringof(arg1));
> +}' -c ./parent.x
> +if [ $? -ne 0 ]; then
> +    echo ERROR
> +    exit 1
> +fi
> +
> +exit 0
> -- 
> 2.47.3
> 
