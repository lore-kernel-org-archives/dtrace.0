Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DF22E822
	for <dtrace@lists.linux.dev>; Sat,  7 Dec 2024 04:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733546242; cv=fail; b=k93KMc+vDGprlwsElnZ8+1zoAYChxb9WkUqSu3K63aRvqZg2tMxDP/uL/nNoD3DLEW3cMqUUPDc7gedatdLA6PalV91gaTuRUxhShMXj0zPhjiMA0SIeq2ZGCEOPw6NX3wJZjv0DSQRKAPL04m1gjv72llEo9HYsF3GLkbuqIyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733546242; c=relaxed/simple;
	bh=4lhqhC4mDkl1MP/uNini5Um5e4kFfwgyJ7eSLSbx/xE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GHgIsvnFjGiCgDFFZfMob3th9j+HzdhUHNDEmuDSL9zKFmjJGLiQgp0OtqvOQWMY/yybzSfbFzKu1hU278SJY03lgGaIOnyTK3obIpBSn1I/0esnrQ+rmiISNr0+wOzZQbHT7zreBC6fMhSEHGtQrb74o9ExrYQ9VQnP4lVpzP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SyFmxkzr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ip2erXVj; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SyFmxkzr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ip2erXVj"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B74I0iK021872
	for <dtrace@lists.linux.dev>; Sat, 7 Dec 2024 04:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=vfKvwaziceSWLZC/O8
	rY+FR+wRS8VbQmABQ1hjMrcp8=; b=SyFmxkzrXK6Ijy2I5KxnKwruBpU0YTdqyh
	H1w6ST5Ub1qid+vLCw55jHLtd9l9p9yew+RMPVWgHgvQnmR89GtpnNY/ZtJfZdi1
	C327HIB6qcgPw3yfaC9WOVYQdmowRQqWiAqwmDeF0CraQWAIlIPyTh/wXASRUMC4
	u0AYXnYAlJbhp2sx/XmLt0+FadB4dorz0MaK9QCTHopv8kG5yTIpOq27d4bGZ8nv
	zjqf3eAgT4FGnb6TwcdeXxl4ePHPdPoSRRMTLb5AofOhBgSa/pE0cKP2w6cKX+QW
	R/4Kj0KltDCg569I8ZaSL010bHHEHiP+kERd8SG4T4R4nPJtKKGQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43ce8902f7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Dec 2024 04:37:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B71Y94I035005
	for <dtrace@lists.linux.dev>; Sat, 7 Dec 2024 04:37:18 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43cctcjmnd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Dec 2024 04:37:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qdqv2Iif4sXadV5bNwGemNmzop6XX+yvioJUMUeRo+dn6RYdD0IH/d9kn1ujNqT5DPJo2090QydfgGLdV7hSmhbte0Gd3nR0noCU/KhEICvuY4SO5sWkMot4tPDIl/wr2VIB8UTlNepFEnLWgrEJIgvN0PP+l2M179l433/YT2dbaXxFzGyzD8E+YCM6lt2LQizHhhB6QvL4HDX5aEPghm0mJL0YmfzY4hoJUBkPbXWUeIauWRmvKeLWxCRA4Rs4nrewV3XMb60A0WayypIq4CkgP5yR2tcGFDVU9kzGbolW38QR0myNKcrI/KqIjKtXdYssQWWUbfmuIbnN0+g1Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfKvwaziceSWLZC/O8rY+FR+wRS8VbQmABQ1hjMrcp8=;
 b=pHyzTlNPT+cg/syjMmsfcxLUQ+hs/G6G48vJZ2ho2PtqiL29PsqMhTafmDrfz8L10tcVGv5poSKq3PhJ1ullq9nlWnfHRmTXlziNmXNPaBzPLDT/FTtu+sxsF5EWvN5iuuxJPvYzugwDgYw2z970VUYPr6h6vr0jCRiyeRs5pscqsTCE4jhSUsP2jsVKNy1Jp81HA0dbzvJhkIc/4GZ9fNBQNGRnCo0fB8WTbidt/aeoyi6m2VrWGLx1034ehPwqBKbeYkssfm1qzllDQtVuAo6/Cs5R7pL/9je9XhCCUvQYA1aK3APFOspaF9UIapxloG/scQPiP23QIeTpIHE/Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfKvwaziceSWLZC/O8rY+FR+wRS8VbQmABQ1hjMrcp8=;
 b=ip2erXVjWHX5uQhHG1K5NhdOjOvQjMVFhPQN00b8RjTiFUsnC0Hfd5tFIJzhJW0JwkCGUHiLVHBa1w6VHtva65AH0B1Sick5FUiv/Rzhq6O87fSljtFTrr149/MnVVxALjpMO21rHamgYGU9eC+GbuuJBbxUql8Qkvc0NlkrAgY=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by DM3PR10MB7971.namprd10.prod.outlook.com (2603:10b6:0:b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.12; Sat, 7 Dec 2024 04:37:14 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%5]) with mapi id 15.20.8230.010; Sat, 7 Dec 2024
 04:37:14 +0000
Date: Fri, 6 Dec 2024 23:37:11 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 1/5] Revert "Tweak self-armouring"
Message-ID: <Z1PQ90/dgAPDjB8m@oracle.com>
References: <20241203113610.75104-1-nick.alcock@oracle.com>
 <20241203113610.75104-2-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203113610.75104-2-nick.alcock@oracle.com>
X-ClientProxiedBy: BL1PR13CA0434.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::19) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|DM3PR10MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: c000323b-fe53-4d76-2375-08dd1678d2b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rjE2Do9sTKJAOsKQDazxRV4AqpPVs7xyOqFGEZABoFkDfih12WYQSM99D/4J?=
 =?us-ascii?Q?ZSZ8hlpDSUS6KR1nGdD+EsNh9DLETKzZK3Hc6e88iMW2wFfOlBNo3REDmJZF?=
 =?us-ascii?Q?9FlXWrJbd05+1yGJzY2rppwywccRv29tKsaBCN0LaL6mE+qJPhSlMyUn4Jq0?=
 =?us-ascii?Q?WDx0mAkZQL7xZPIGa+07JuC8yOAn6XYw6j+7RHkXsZnDY+YISjnzbrByqiiV?=
 =?us-ascii?Q?LYLIeZnwyygkpqzFAyU7yBN98NxEnz1B3ZM742lJrEfewu5KT3pAOwE38qF8?=
 =?us-ascii?Q?oOKvtwAlOesYhE1d9y+D2aq71cKGaQOtakBLwEAMLc4lDRrIqMft+QII4bCM?=
 =?us-ascii?Q?HMHR/R589BOUiYFK37Cv8WV+pxOBS+j7clbjrx7NGiDI3Qf7jdZ7x42K9Loe?=
 =?us-ascii?Q?DefSAlObBfnT8Z8VHqhkcWSf4D1ROlUZdDTx8MMbVqpnEm0YDyQnti/+4lMD?=
 =?us-ascii?Q?Y013/QJSud/epy5wSj7SauaPURbJQ2t1I8KFYuhqblkFAqr+DUFc+HGLOX7s?=
 =?us-ascii?Q?LTw+Lh9AjzRD5ZbXwb78WJ0RqM2bETmx2N++XIsqh0PBCG6Rs6WIY3e7PZPZ?=
 =?us-ascii?Q?nGL2vNh6FtBDlTGs+fJ5AEulh1AnnzK6BUnetEc2+s9wWRKgRcZMp9ZEQFWi?=
 =?us-ascii?Q?B15KXY6lVoYlXUIvmUpuPqQe5uXICEPBtKSCbGOplM6WncpJ8QbxokZosueN?=
 =?us-ascii?Q?XdnYsad9k7VgMxidHMvd0p8KBSHwdcgIl0x+fs+pHdgMzken4c7s4c/Daw8z?=
 =?us-ascii?Q?ztQ2S27EqYvcdCOeIL8+AuyUMUKel3R340RoZpGgPrvDC0DxHy+1tn8tibwc?=
 =?us-ascii?Q?ksXIirIi5TukwyzjFHzSINUX+QFyLJPNdSxFT/1fu5agVXo3IwwM5tKAASVQ?=
 =?us-ascii?Q?8J2fLv6I2T5BuTSzouK0IFjgC6Sue6+z1syGDY0C18ol8avYQAZ19alb1Nar?=
 =?us-ascii?Q?ddSzVNdpyHBNpMBvMJYH/TxKHj/x6dVt+lD/AAX5gdZ6xMNGRWhwQFL+WOGK?=
 =?us-ascii?Q?yZU32XmUZvv5eLfoy6dN0rp67KoOb+qyadpbaayI5m6RcF/Dhh13CtSw3e8P?=
 =?us-ascii?Q?/gOHaLBKESixPyK3h58LFwHsOlnmgFpk4/jkqQZ0xfPhfunO+1syPDErA+zz?=
 =?us-ascii?Q?V7pVogFO0ASsmhk19A7d6fGO6uYT5rXhcZzIU4rUnBwKY9vVhABsVmwFS+X0?=
 =?us-ascii?Q?r3B9gOMn3WyPrZem02csEHQlfDHgS9jR72NnWncAWKDMiuCeHgIyKV3OfEPs?=
 =?us-ascii?Q?wR4f9pZtFEeli+LbPjW0E4G2/gfrX2bMmf9padLpXrO/3WVPHLhVJclB72v/?=
 =?us-ascii?Q?vZNkkIjYNNvdNEt7D0IsqSrf+cc6pqtwAK9mmASVzStKhCjr/0dDLsQmllX4?=
 =?us-ascii?Q?BZCXhJE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1/9v2DVmlihW/IixKqoppctKAqcaSX833N/xtx8ydoZ7Dn1xf7NGotPk2/KL?=
 =?us-ascii?Q?+9VbbUezLhQU2gN2HOFUc6sRng42WlA2+whsnpOYHb4Z5UirxbZ3wOItoIFw?=
 =?us-ascii?Q?NWw4AjG7EdLMZ5LeD77ITWSmYkYIrVqZOYCFmc2bJYM+LA/BBQXM2F2zkAwB?=
 =?us-ascii?Q?TDWBQJxpoJjOOMWS11VawOljn3/fAvDbpTYSUDUA7sxsCZIBExrwh/1nR38U?=
 =?us-ascii?Q?u5mbEWsMglN9UjO+FjL2y18O10WD0nCV49I94ds1FeC6pesihgp8F+ooW24J?=
 =?us-ascii?Q?LWu9SFSfjaTsMabdiT0mQ8miMRC6nsYJKwTTovmg+c6imuO5a9yXEoSWtO0V?=
 =?us-ascii?Q?YPHJtkWP3/cWRKAO+5nY0lL4HOkiFQKGvrt3ZKg6+HcaLgPunxHL5N7ZV5On?=
 =?us-ascii?Q?kGi8mztNymrwZfonGPM0A7B+ZIrolD/V3z9av26vPvMFRsCP14gh6AU6y4y8?=
 =?us-ascii?Q?doqU4FToE50E1o/1M5dH933AcECRmvJ8pNX5Zae4z0aMtmK4nkv+lG4Aog7X?=
 =?us-ascii?Q?xb0MzpQWMe8vvIjscHKdmNJPYWoVX8TnNPhxGrrFGDn379g/NE7mzauqmf3m?=
 =?us-ascii?Q?d6bt6VfDWSt76P5TVBKGekayA0XYMFpQSNwu54A6v3ofNpqvDImGmUzL5MAh?=
 =?us-ascii?Q?HcxwBQyAvEphbYDIe+d4jk849pjTkC0e++lCcsQQ9hXVLy23eBjl89BsiwJy?=
 =?us-ascii?Q?L0qOoBZS0RKn4wMLPD9jpyDYQeL34bdltid2qI8rzwrQgHUSN5XzdBlwgq4T?=
 =?us-ascii?Q?P1bkZ3RGLeeoFMmYCEfo4pp2+A1doPnejwjmNIwtdki7kduzRHmXYsGpbCYs?=
 =?us-ascii?Q?PCecp4xv5SIieNlngSeJd8o0kG/eliZbyK33dWH1dD9zM+QiYX1ZF8/Tf35Y?=
 =?us-ascii?Q?dEtGckCMtdojEsFufao8uyEWM3ASX8ZZIefA/YQSSQqovTleKgkP7+w/htR9?=
 =?us-ascii?Q?eLXLe4NkBFVuJP3Q8DQIgV/oRqz+eftU+CdM7t3Z82BJwePoXFK+Qsj6DGXD?=
 =?us-ascii?Q?Cw2vrEO4Sw0dgaD59QdQDtHl5/A8REv6CZnohpIbCSEDZ+dECIYOVYDbgmCn?=
 =?us-ascii?Q?wMDX4uRDuOGG1Vhjfs9lu7IogcNnWi3cIWy/JhM8vjBBzPShWADfE5aBmZCI?=
 =?us-ascii?Q?W/6NMO2rjjE+WQWHR+pi1gCcTYftBOK5/pUe4bsjCCc0GxaLclWJDV0Brqp+?=
 =?us-ascii?Q?iqkBZhBlsn61tZJqNJFqZgWSQkqy2BpxK98HNayifzukifohUe/Atj3dbpRW?=
 =?us-ascii?Q?jNINBbDsPmYMzqwY/Mrr4+YQ6hBiwREWvJT9Aw0FKJyPw9yGFgd1R6vn29eZ?=
 =?us-ascii?Q?pR8ysqSyZJNvy7DvE2Y2HYPRBjYmS1IpSxkqzqg6YVGsMXhelthVeCOi6ghs?=
 =?us-ascii?Q?m5Xvon4JMjgMNJ9pczStPUvvYU0TKbk7Gi54o2XHy6njg5oNm5EricosUkhQ?=
 =?us-ascii?Q?H11iZrvZQEnLhrzsr4eCDMYGXVc6KRc2gctNrA8aSB4mjY/W6iiVBivmBgTZ?=
 =?us-ascii?Q?9d3Nlk25SkqzZzOI5cVnlDWNcz7NEEncTLGAwVlC6pzClRtq2L+umTfu+I8V?=
 =?us-ascii?Q?I9I9L1Eu+YPCDDhB7WtLaq04Dls2T3m7IFspph3sOWBozU6SKtJ80W8CY4qH?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AyVjMwRyOwi/dOSCq8IN+naTR1kOSUFsBV58b7lX3WQPbZ2eFctIcI0/2gUTYUmsMnbExEn5Zq7qmZ/BHxbObIK3pQ665rBuBW4EawK2CUTeSdtSOLIqGvCXVI1L1zgA24Gs71JsYoieDjQ6Yz2AyPQg+8/npj/bS4lW/2C9ULS6lSFSJHhkvGkyHSC8PIcBe/RpOxA9NAVyhBSP+XpYrCz6+EW9GoGBiKcJq+PeRVGWg1zSZuKOz95a2t0tnQMRMTvkfAwjNCQa3zTUqEcVB8SAe3GdnuwuqFMbQRRhSKs92hciwhHHPBWrslQaxvGNmZ8ksuJcVmh9MYc+HnQQjpuRR5JeuNLsesyXNb/4BGjw/tWFtqJebrYhAVLGAz05YhcHCcWQmkPOTr5Tc8oltqukWM5sP6uGw8M22fXEIkK57pq/E8w1+Qzjo2gtmMkTPktFi4i8SLIlbQemsVXpQowUS/Z2drmp6y0rLR0yCWcnk37z83wrt6ETrSQWouGMPyqkoj6OxbiK0Y+kVQubX9LYIUaIuXwDODDsDFVMGn+HSXu66wVfG7B07RSieSFZ+RGfgb5P8fb543mfYe3B5wKz8vpN/ILVdgfIT2iENPw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c000323b-fe53-4d76-2375-08dd1678d2b2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2024 04:37:14.4549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BIjRwGDjWSIEWxmLJvPJjRM1BVJpKftsSoZ9RzsMltE1fMZrcJfga8JqMLmO4OijQXllu+BSbC9fJ/aphL/64wlVdKzFYAZ/3lshDns3yiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7971
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-06_18,2024-12-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412070035
X-Proofpoint-GUID: GsOtxMyCIGiOdY3RIh1qo4b5A6wmGAR9
X-Proofpoint-ORIG-GUID: GsOtxMyCIGiOdY3RIh1qo4b5A6wmGAR9

On Tue, Dec 03, 2024 at 11:36:06AM +0000, Nick Alcock via DTrace-devel wrote:
> This reverts commit 39cf54d2e98ac877d4b5e5ba6313f717173ca380.

Signed-off-by added

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_proc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/libdtrace/dt_proc.c b/libdtrace/dt_proc.c
> index 7c3eb2a24a512..a052abbacf204 100644
> --- a/libdtrace/dt_proc.c
> +++ b/libdtrace/dt_proc.c
> @@ -954,7 +954,7 @@ dt_proc_control(void *arg)
>  
>  			if ((Psystem_daemon(dpr->dpr_pid, dtp->dt_useruid,
>  				    dtp->dt_sysslice) > 0) ||
> -			    (tracer_pid != getpid()) ||
> +			    (tracer_pid == getpid()) ||
>  			    (tgid == getpid()))
>  				noninvasive = 2;
>  		}
> -- 
> 2.47.1.279.g84c5f4e78e
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
