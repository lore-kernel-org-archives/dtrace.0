Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EA21372
	for <dtrace@lists.linux.dev>; Mon,  6 Jan 2025 20:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736196648; cv=fail; b=W8H68KNXFuijBPOn1tsJqUY0LEFavEsKACg2EJyQa+AInoB/+RghhYA9IVQbnPE9CniLNUVsikgRwTQDoU574pDYdRxhTMjmC+nSrsb7ePHdDA7OXUbPM6kd3oRxkHs6cCTjR+aLv6TOWclDI0jzNXcJnXlZ5855ubYhoA6KqrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736196648; c=relaxed/simple;
	bh=mQUTZillDREdDjqCFjM6H76m+JV9A+W/0MFl5ydP/YM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XHcJyBdWgkcTan9QmDSD8Ds0VfkuXFELsMhdwDFAartEpMGQxRoXaQFOzCP/YAmMJrpzp44neiAo/3ox1MmBBOPHd5hhce9iKXqRsJ50KALNY0yR1iX5Ihf2HJuxwGgt5z++pXJGsG2tba1ve1nFVbl/InLrvGTGhlth8bvrTaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ERMDGjDr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=x5UG6eCK; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ERMDGjDr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="x5UG6eCK"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506Hthul025598
	for <dtrace@lists.linux.dev>; Mon, 6 Jan 2025 20:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=tTERHIHdp4CGIDQwRA
	lGe11xmIZhVkfT2zRaavbMT5Q=; b=ERMDGjDrCt7oxR72aUZgKVdRr+kL0F9tit
	iyefBmNrPN5oubjSudVviSy8gqrkRgYgdLr9zkaN+HNZUewim1NPwrkXGnza2jRl
	dxL2EefJZkc0TvPYewEhgtoCO5Knl1zMGTDsMUJUU0V0M5XYoIXJrMkA/pB2ZW+O
	TjTsQOVjx6tPcXudeSmoCtXgdm1lMYdImuramLRoTsnJd9kaaIdBk/wm/12s2pfQ
	wNz7uU8SA73eYUudCOH+goSI8IRo/d3PLxghR6SAnp+7jpp5NjsYWgDMWU2WbBzs
	oMLnia1rYV8gcvfopm1oaoMuF2n6AyjA/IJqvAwo3P8JgNXtpULw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xus2be51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Jan 2025 20:50:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 506KaH3J022724
	for <dtrace@lists.linux.dev>; Mon, 6 Jan 2025 20:50:42 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43xue7qhma-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Jan 2025 20:50:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QDqLvtR85Y7qvzBjnvw0lXCIt8fpcNy8OtNW1ralyMJmpkeLEwqFLmibwIhNn/ftmJn44BS5LH8yIVBex148IzB0X9WM9kAKUbEH9PTPjlqrQfCwBckp1w4/QMsGdkkf9mll7NX9tocgJ0Hil/7g8W7qqMGeqH+cYpDcomVePfGUBQr3PwhOQOvYayZd4dsimWHJntANSz+bsuAHhclIbLW6hhRME1uoxi811t8X1jji0ssOxQwEN+CUMmWcm52uwU3O7insHVWSoTo5JMH7OUv+N8SlwSQ9DKoVBxygaQUREMLnhvIm9CgjYLeYPPM/xR1Qb78A01nn7OiIsflz6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTERHIHdp4CGIDQwRAlGe11xmIZhVkfT2zRaavbMT5Q=;
 b=dS/oPrD0EXK08zVGCXONC5iWhgp+OaZbGXimZBe6G126AVD7RTvJHkxXfzJNhGN6rfD/HTyxwlUH97//VvD8OSb6QGOO5EAQCNJv1JaSj2RF6ZSQy5zKhqIArqzH9grdbUDnlnPpnT3V6knAc43h0kr/Yebm9FI7//LxhyFFsS8b/gsI/rXHUL079fGyO58docOSISGjdKIh7Iy7Uzx5z2Xn7+KNr3GMNtilFjLHcBpSdGjQkXL9Rd1np4xnZYPSfYdQEf+nsS6zB/2tKgSGs1rCdWS+3ieCRdBF34YU3mwLswoYGbp4sojYaG9loKo6qNT+cluAztnUGGed1EjAgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTERHIHdp4CGIDQwRAlGe11xmIZhVkfT2zRaavbMT5Q=;
 b=x5UG6eCKet+m3X75dgHqLLJmsaGSA8U/Xjyp9HWr73BOYskS3L2DlwDkuhK+LSWps/wQLBF4UTQiXuwZPDGH0ViTwW6QmGkIXbBMg0Har1DYM+QI/N/LTABOHCTjRDIRvzdCE8Vemh0saUgbrWfwufZFmldDbW5Oj12dg1vu5ck=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by DM3PR10MB7948.namprd10.prod.outlook.com (2603:10b6:8:1af::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 20:50:35 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 20:50:35 +0000
Date: Mon, 6 Jan 2025 15:50:33 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Retry umount if necessary
Message-ID: <Z3xCGfMxKl9sJH/2@oracle.com>
References: <20241203201601.28787-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203201601.28787-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:208:36e::21) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|DM3PR10MB7948:EE_
X-MS-Office365-Filtering-Correlation-Id: 01191c5a-2522-439e-af47-08dd2e93c4eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s4d+CxIDYxO6umME0DWwqWJlftCcLX1UK2YX+TzHU3/y+zBliMG85wtf0FnS?=
 =?us-ascii?Q?Rtta1FsVtoE61jsLMk6Uq2YrvfwrJYGbju9hz7+YYz1FR7PEPGkB1yZwp/vg?=
 =?us-ascii?Q?NaWogQng1SGud9rsICO+n90pTQRecB+z4mweppRmavtuvC7Khm66S9Ln/yna?=
 =?us-ascii?Q?kD6PFA3AXx9vVIWq8m4SjP9VoJslhpDvuISafWK76FIdyO0Kw6FYQbiFXR+2?=
 =?us-ascii?Q?TxEOZUAs9rEYnm8GvEYNm5bhd54Awh7wP4LKQiXmyci4LbCogtNJf0UpvrhX?=
 =?us-ascii?Q?aBEqxzMRlTrmZZguEHhgpnSZYlz1ydEI5596HlXDPma3/M1Cdl8hfeLMz0op?=
 =?us-ascii?Q?0hW/aYaGaLuEWuIWfsEs6zZ+zNKS7P1E4pHFD07cC+b02JHAdXOK0lh3AaYS?=
 =?us-ascii?Q?BB6IIjAFAl7hNwf5tAuCH+iSdNq9MLVmdry0PE+Mkw7Wac4HCPw+tgLYNH6e?=
 =?us-ascii?Q?GIoVPCfUMkObRJcmGasptDsxTZ/DIuf8/kVGImTdfAFp9fDaBeKFHOMuO5nF?=
 =?us-ascii?Q?1WYsYfNh4aQcV0uG8ggywevKgBat0sJwxT8rzSMddn4Q3ArgSBNYgBS47L25?=
 =?us-ascii?Q?kQ3jci4MNrb3LHuKur4BzrSLfb0LR1+UgfXQfmwAqroAOOMUOUAa1CByRq+J?=
 =?us-ascii?Q?9heD5wdzn9e8e7IA5X9HPEJbY34xXo8LcD4WiWEjQ9Fo93lafzGDic+L3/KL?=
 =?us-ascii?Q?7w74J5XQ9tSZO4eLLaM1NNPksCH1b0Pt42GC2KsycIzTVejeBW6yyk5BZ80Y?=
 =?us-ascii?Q?anuF+vCge0Wr6ADPAZzBapoQcpwnNZFM7EphNjtOnsZQqQuePYcnfSRmDBcu?=
 =?us-ascii?Q?pycoQHmYHlyTwqQVzo8ZIkK/Uqs8kBWWD84RCFlTf3afJhHzwqP1SbMN7qWW?=
 =?us-ascii?Q?4926uSlFZmTGqGBoNEvaCb+uCHqMhoq9UzrGndoSSnA8B7GKAdhPVHvasJPF?=
 =?us-ascii?Q?5u1hljamwlJuSXi7hqp3WNiNOFfSBCuOOZL7YQTpZigX4oFuz0cpEyOIb/Gd?=
 =?us-ascii?Q?QOQe3IZOrHnoLp4MpwssRcQsIsVUJVaNw2KJAVOZ4ytD7P2NhML89Kbw1rWn?=
 =?us-ascii?Q?LY9Dpo9vEnzJ8icgJHZ94manovDNPoOCEpCTfZoMHeMkUyela/ITY3GNpbm0?=
 =?us-ascii?Q?VKG25QIKppJshbXnDFmg7O2PNhILM3UbJL3dyHdRyRnOTzRbbkjcGpfaH9iE?=
 =?us-ascii?Q?nSqiIHk7x7bzjF/oVhsL9IOqfKhA4BRRT+grur5e2LOlom660RRucubFfxDA?=
 =?us-ascii?Q?pj1vTP10/hj2vLV0qQuZWlBsrvAbK0SMcYeix+vGr6WLAm06WmNLe5gp97gQ?=
 =?us-ascii?Q?jxGYVKQQvfAq9e29ZpeQLW4zH6eF5nKIxWuhcZexHX/VKKXE5TR7jkd7Nws6?=
 =?us-ascii?Q?3M+Xa6diA91XJSueV4E2JXkSAS9/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PtmANDyX1XBuvwJVTXzUe4Re6w6Vj2xug5HacehK22/a9ubHdkPa35fRLSi3?=
 =?us-ascii?Q?z6QN9+Pzm9g9tJiciwMxWEHCoQXvweb7H3nzfCDJ8cBCYKsMZNpe5Adhajzs?=
 =?us-ascii?Q?RsvgshZUkvwZM5nc65uQFpV902Hz6uI+/L/GH/JI06v3UrUcJmzOzypAseqO?=
 =?us-ascii?Q?W4jwHp1BS0W2+2WnLztZju9CSbfYCF7T7nNuS3yAaPvBR3bQa625iFXCit3Z?=
 =?us-ascii?Q?NEt0xtqfV2UW/hiQuI/KmDBY0JZYfWvrQi+sELJZG5SjanyiDyGIqSrdFz+z?=
 =?us-ascii?Q?4rPwMlfX8GFA0i0bYgWNLjldckjjCVT03UquNqhUFRve7Z+PhbFIk6p4FJSG?=
 =?us-ascii?Q?MWM+fnl0ia8ZKcFStEepchH6R2wyUBqPG5MFNlcXB51BdP/RQexa1na/6CZr?=
 =?us-ascii?Q?GhjYfX7e+SEToUfwVXbVW9Dt9OHIJmbZE3YyATEk939V1Rrtq8RGHR2vQm9i?=
 =?us-ascii?Q?qxaWoO59hQHtExLG3nTAacuqt93oQGppe4Mz/bcg//BC5ct8Pb5wz3hOXir6?=
 =?us-ascii?Q?RNJc4JNFROVRvSNAm15Ry0bgNbTvnnso+fNNJgu6tkRa30iaSA5pe2GxPZ8l?=
 =?us-ascii?Q?O1tZj34cR5cHU+BHLK0YYtp6cXMYqaBMayTM2XtziQGwXwqWeLX9E4mlf1eC?=
 =?us-ascii?Q?FCa2zBSFBkq8gRAz14jZVTuW6U5My/z9Z1PP4cgIdH1fuS1AvDXWTLCzenEP?=
 =?us-ascii?Q?X7xyAWStuQm2DT6byamLrScB33ZKlqud7dAb6yEbVFcmDQkpa2buAUmnv3z7?=
 =?us-ascii?Q?DFgkTHefcdSE9zQSDSgyqvMFvfVlzCoEpp3C8wQh+aqj/hd39HKotVDlT3iV?=
 =?us-ascii?Q?vS2/FdcpwbmPa+W4OQL3Oivutg92mT0Zj7cyTw5BCThaPJK+aj7lQzq11XaX?=
 =?us-ascii?Q?1YGSH3FN83G1AaMDN+QgLFSPuVl0MWocSnGO3VcZIPf+lAhr0pLaWoEA/iIc?=
 =?us-ascii?Q?gI92shbr4Iibw6n/MqQEdQbhZLpVkAI3fgyJNCwphkCllKBuZ+Zzdh3u/Ybm?=
 =?us-ascii?Q?vhWhS3NlfFZQbAGKa/6o4B+prLlXFGMQBpMtsiXuoESUoZ6AZ968z0XLy8Zc?=
 =?us-ascii?Q?ELXaNufA02mN8cs6Pb4OA4U7VOKbt7zFsfOOsPN0fmRv9nDa9XD4hPC/VzwX?=
 =?us-ascii?Q?vV1p/r2LDfHsrV82pB4LZAbPNJKva5jLAnMIKfG/U3HqyObTaW4DRnMSQq4f?=
 =?us-ascii?Q?Wt3YhL1r2tXB5RIsQriVSjME/2LN3o/P93PSCkeEiuNqp7QW7BH6+KsHGRoq?=
 =?us-ascii?Q?oYPQXqbaH75lXPkis1lmi0drjhfAtZXs9w3XsUJAPEMuL7Q4JCA3o5YHub3J?=
 =?us-ascii?Q?RV1e1JXmpbisLK9l19ZXiDeCdLT/6ciT7dh2osb1XI2AytZZLc4OZO/NzR+i?=
 =?us-ascii?Q?QnKyXbo8xmcSivRcmmPbKps2kl5cunYWEaHcEfkZWko/vvrWtLzzEcBBEevs?=
 =?us-ascii?Q?G23FQzjf1fLs8YWaaxy2mVSZuifiBjZTxAVQ9GY3v0p1BSqrQxHY+XqJIiBP?=
 =?us-ascii?Q?/s1JPkSzkxf054i5xlT/AAftAR9VTvnelb2Xh+Wv4Oe4i/qBHSOMcdpPgevV?=
 =?us-ascii?Q?fnlG1RrGFQZdatMQPSDYpa0sCKMYLHNrmmKRuxJqZbnzmKVkc5iSKfEQw1Mp?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	COugNY29d8IXOxp5u8OASA1AeZfizWV4TwcZkFCVy2Vw/aqaiHV7o7CBor53F/8AAXj3wwTAGiBM2ZNmvBhJ6CYki9iMdHHwPJ5aUHlLNoG+VVM2RqS4do32QXBcYNc9LsmrBSvm02Z+KPXR6y129kuaFtCJS1HTx2QZFZrCM/etmRc1Pa77TP+YG+aE9NfWCPXgq9whDa5TKS26lTApBUX8TVx7hD1w5n54+zpKeGsq9aXd8ibo8PsZHFHUpZzBKOv9Y1XV/2DN+Ms1dh+RcgSxy69xOYTMgwM5nuPWNFndE0odGHJpRp52g2gJnEcHpUBUj0dbsVWLTNgKAtt8E1THrarKmuCQrmU0eLSKRlaGeqb+QWQ2e1j47LW2JX3xcyiVK05rnMKT2/HpG4t+CF2q9ZlNSJ7vUOzpHzfwah62Kueo4xcErRMfM3+r08nfkJpn+WuN7UaAPciy+EZmMyPCLkhX34u4od7khuHot6Ei7x0LE2daGiJ5jb5aUy7RvhguJXyjKFhabdbEoj3zjIEn2oI1ucThrku2WjtfIcSXSOdHcE6CzuUBQkFTfSflroV+72UJ1bIzulPENH9+m/FkJ7VqxaSLLet8vi7VS+A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01191c5a-2522-439e-af47-08dd2e93c4eb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 20:50:35.7308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cO3u6ay7d/0EYVuGP1QIXqBcUoikjcKYW/6bsfgOIjTOcNclDZroeYZcSbbILuyK4AaMPmMvZEuSpN7yhWeSrOWtcgSq8Q68sgEGIYBP3Jk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7948
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-06_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501060181
X-Proofpoint-ORIG-GUID: C4UTBMpBSqSgSy4e669c5wDeSlUGsdBv
X-Proofpoint-GUID: C4UTBMpBSqSgSy4e669c5wDeSlUGsdBv

On Tue, Dec 03, 2024 at 03:16:01PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The io tests tst.local.sh and tst.wait.sh fail with some frequency,
> with error messages like "umount: $iodir: target is busy."
> 
> Modify the tests' dtrace trigger, doio.sh, so that it will retry
> umount a few times, if necessary.  Specifically, remove the "set -e"
> and individually check for and report errors, in the case of umount
> retrying a few times before giving up.
> 
> While we're at it, notice that the two tests use the same $iodir.
> There is no need for the tests to be coupled in this way.  Change
> those two tests so that each test has a fresh value of iodir.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

... I did read the discussion about lazy umount, but I think that in terms
of what is best for the testsuite, being able to ascertain that the umount
is actually getting done (or reporting an error on it) is important in case
later tests might get affected by it.  Lazy umount seems like it would lead
to possible silent umount conditions which is not ideal for a test.

> ---
>  test/triggers/doio.sh         | 29 ++++++++++++++++++++++++++---
>  test/unittest/io/tst.local.sh |  2 +-
>  test/unittest/io/tst.wait.sh  |  2 +-
>  3 files changed, 28 insertions(+), 5 deletions(-)
> 
> diff --git a/test/triggers/doio.sh b/test/triggers/doio.sh
> index a2a39c245..0171a4b4c 100755
> --- a/test/triggers/doio.sh
> +++ b/test/triggers/doio.sh
> @@ -22,15 +22,38 @@ mountdir=$4
>  mountarg1=${5-""}
>  mountarg2=${6-""}
>  
> -set -e
> -
>  # do writes
>  dd if=/dev/urandom of=$tempfile count=$filesize bs=1 status=none
> +if [ $? -ne 0 ]; then
> +	echo ERROR dd
> +	exit 1
> +fi
>  
>  # flush cache and remount the file system to force the IO
> -umount $mountdir
> +ntries=3
> +while [ $ntries -gt 0 ]; do
> +	umount $mountdir >& /dev/null
> +	if [ $? -eq 0 ]; then
> +		break
> +	fi
> +	sleep 1
> +	ntries=$(($ntries - 1))
> +done
> +if [ $ntries -eq 0 ]; then
> +	echo ERROR umount
> +	exit 1
> +fi
> +
>  echo 3 > /proc/sys/vm/drop_caches
>  $mountcmd $mountdir $mountarg1 $mountarg2
> +if [ $? -ne 0 ]; then
> +	echo ERROR $mountcmd
> +	exit 1
> +fi
>  
>  # do reads
>  sum $tempfile > /dev/null
> +if [ $? -ne 0 ]; then
> +	echo ERROR sum
> +	exit 1
> +fi
> diff --git a/test/unittest/io/tst.local.sh b/test/unittest/io/tst.local.sh
> index d3dbf1713..702c6f453 100755
> --- a/test/unittest/io/tst.local.sh
> +++ b/test/unittest/io/tst.local.sh
> @@ -18,7 +18,7 @@ minsize=$((filesize / 10 * 9))
>  fstype=xfs
>  # file system-specific options
>  fsoptions="defaults,atime,diratime,nosuid,nodev"
> -iodir=$tmpdir/test-$fstype-io
> +iodir=$tmpdir/test-$fstype-io-local.$$
>  tempfile=`mktemp -u -p $iodir`
>  
>  trap "umount $iodir; rmdir $iodir; rm -f $iodir.img" QUIT EXIT
> diff --git a/test/unittest/io/tst.wait.sh b/test/unittest/io/tst.wait.sh
> index 016b922eb..24ac2e436 100755
> --- a/test/unittest/io/tst.wait.sh
> +++ b/test/unittest/io/tst.wait.sh
> @@ -15,7 +15,7 @@ filesize=$((1024*$nblocks))
>  fstype=xfs
>  # file system-specific options
>  fsoptions="defaults,atime,diratime,nosuid,nodev"
> -iodir=$tmpdir/test-$fstype-io
> +iodir=$tmpdir/test-$fstype-io-wait.$$
>  tempfile=`mktemp -u -p $iodir`
>  
>  trap "umount $iodir; rmdir $iodir; rm -f $iodir.img" QUIT EXIT
> -- 
> 2.43.5
> 
