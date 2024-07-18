Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012B93F9FB
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721334507; cv=fail; b=KSCoi1nJZPVWRVWe04b+Y73HWMvcUY4UG9ohZpq3lt4LiorX3EC9C3WEJyo8dVLWpA5juV8RX5O8W6jsMQWHpEOVwLQ2zny2FwF4TQ3jPpr26Fs0j1uVvvDFzouZG9P862dle8mCia6+O1pqErWZs7vczuoiJILtjUc6YA9jJLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721334507; c=relaxed/simple;
	bh=YR1iYNQZLLRfG95RMj9vTiD4MeX7G8/dWvDp1TU0BSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CRQvF0doM7Fcd+FpwXUxBrOKsCmyaEhONnAYid3434QJW9JtjbruggWjsfXkFa2hpbErD7hFXBWk1RP3nBz9AWDASgbmQWm5Q/wDUxUYSzR+7DZY7CcazP+xnfQe13ERJHPqqevNbs2gF5UBevwwOOCA+40v5XscHLz2RBI5ZfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HfEYg7Lu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RlKQTwPT; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HfEYg7Lu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RlKQTwPT"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IKFXl4016834
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=75dATgK97N5ywM8
	ZYKZsYO2lGewxZqScfUAlMjnnIE4=; b=HfEYg7LuAziK0LX6kIMECDi2N2kwr6/
	xze7aSr4YyJ9sePTcE4Lp+BAG/Ul+O+pYIcNhbrKxeMJLcCgzYyENYcedaiJVYwF
	2HAxTNfO1Wgi8e4xu9uFCiCMlh02Dz3d3ci1RtMtJCodA+R/7snwQSZEywE06wwQ
	blsZio9PFfy3MVOj3JkPyGuj00Qh1WBncTWscjotTlqPb4/S60BVz8xmtzBDoRct
	Gtq8QT88usrFOpKJNuE5Os2AmDSW2z98ySL4BCDjLi5zLdiycgxw33r/twPIDzwi
	51EtBvGOOMpG+ADbJq+wTV2lqzErrKUJ5KwIu8Nit2DAewTnZ4CiW/Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40f9x3813v-10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:28:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46IJqhJm021743
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:20:03 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40dwev3p5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:20:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKeQugWiFS9QZG551knPeBGQXH0Eeo0YqoRrhLaWDtpJvE6/tqjYgMr0m9naSbYOYKQ/vXndR1Pg0q7ofx3955iT9FTvg6+u9HYqMPhjDpg9VXIsfFx+qIMgsJJ1U676S3VqLdf7f1/1TBkepuwY44k7t9JLE6uJAPTclXfSQ5KLpixMWxQoZDNqZ73kuIYAjMtEemMNmGqNM17mu5d2Deyk2Nnrl8tv6fusvFGr6u9KKnaquUNNuSAUpfg+tAhm3OHtf4FF0301g5x9HVOfwoPGpOkUjqVDPoA09dMbJEfMa7J7UCiBV1luZtoiL4fQlZtzEPaPuM2ve7zXeYJk5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75dATgK97N5ywM8ZYKZsYO2lGewxZqScfUAlMjnnIE4=;
 b=n4osXf2lRhp66IzX0eVFdv5PeoJ+s1I5rpVd/qkIloTi7KF3vIgtUnUUPBP+yZjNXcdbb6ho4ledBt1TZzSZR1smT4NgyxkJUcFw0/ebEjeCh4BQ5C2g5RN2ibw0oGah5Dm33CWsr1PXvrEfmMHzZxD1IEy2ZbHwSJ0t+R2QGAckwqsiLwv2UgdRjHFK1djsV4R+B1zY/8vglsZYYouJPPhlRA3JuQU5x83r32T42veOqS3uSfh61VmvbfvYRn5AuelpnGo4Jucua+DNSpvbZqliS4z7OH5EyO7wPR/IZ2RNIp72dOjvlXx6ve7SSFcGLPgZEk4y5tPP1tKkFqopoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75dATgK97N5ywM8ZYKZsYO2lGewxZqScfUAlMjnnIE4=;
 b=RlKQTwPToLRfooyh2z1XL8LXRK51pfItL5jMTtkM+b7UjQopkXE49Aj8nXIz56Aa2od+8dXMsUkQROC6NLqMGQzMqWLwp6wbpKyOLOH/DNiwhILsLGT/QD67P87dIT9LNYgt3jr6krJtiX3l03germCKyNUkve/LrLtbZO7gkGE=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by BY5PR10MB4372.namprd10.prod.outlook.com (2603:10b6:a03:207::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Thu, 18 Jul
 2024 20:19:59 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 20:19:58 +0000
Date: Thu, 18 Jul 2024 16:19:55 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 16/38] Move dt_probe_clause_t to be available outside of
 dt_probe.c
Message-ID: <Zpl46ya7p+E3Istn@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
 <20240627053455.21567-17-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627053455.21567-17-eugene.loh@oracle.com>
X-ClientProxiedBy: BN9P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:13e::23) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|BY5PR10MB4372:EE_
X-MS-Office365-Filtering-Correlation-Id: fb0629a2-de00-4835-8a64-08dca766fee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ynt5+10zqBBbLPfEC9RxXr2MbJPffiIJroex10gx0aSb2yudYN9CFpCcL05q?=
 =?us-ascii?Q?xvyRgG5jwRQiIC/Kl5rDtDQdgjAJ9gjiZ+hw+ENpLMaNW6APJDSz2yLe+WMX?=
 =?us-ascii?Q?B0uyXy8K2UQi0T3UBoArQJMc8qFq1J8wY+cM8+zOk20EEYa7cUqNWgE15RL7?=
 =?us-ascii?Q?bgYoe9dCMCulr5PMXsRB2mEAKvHZzqw93fv40fQWyrL5Iqc+u4e/tPGiw6Es?=
 =?us-ascii?Q?R5UN/7iZIvCEH1jaBMJff50gX3IpHNC3y+vsxgLrABYLD1+gixEtFiNRU8tu?=
 =?us-ascii?Q?CfA4VM5CGgcOBnSucfQ6EMQhi+CqhDV0hKAUr0z/VqMGMke8PB1gmOCvlG/1?=
 =?us-ascii?Q?4ecpLl9BPXZpXcyW5+4myPjcH1YcncGzR5J9AG1J825SZn1A+LdBmxNK5Z8y?=
 =?us-ascii?Q?NFd99+J82NoexF1IN1nK5ivU+wPdXOEK35q5NEcjyj8vD2B3I5/AgkObdQV6?=
 =?us-ascii?Q?sW9NOfwyUYGikjWLfhbdCnszoeqhVilEh//6rTwRf3dynF3G07uPNaHBZdAt?=
 =?us-ascii?Q?EeP4+YgjFoc0ae9dM42YmLei/uwaAf7OIAK6gMWCdlhMqY6GZphp7d5uVvb+?=
 =?us-ascii?Q?ri0K7RO/rHGIVhtnX870W+obJ0ETMF0UYT314OFRYqm0Go8vxQvrMIE6G1+E?=
 =?us-ascii?Q?uQ5fb3scA+JBISE94CbqJqq33RcUl+76u7QH3QW4JdFT+ovqiSHYOteDY1qh?=
 =?us-ascii?Q?HWWT8E6MIWXl1IRTfi7gY2050glrdIsrwkSAXRPX8mkh8sCk0Q2isWjK7WHv?=
 =?us-ascii?Q?a8EGTHb3DRkEbs+LQmjs9lI0Jz4i0aDYMlnu5+804I/D34QaUvGrEYWFskxB?=
 =?us-ascii?Q?TeIFVplbpUwNDnTjVvkQQ8HeVFsgYx9fDSeHn6ra3/OwBBP1WbIyLtaBzHLn?=
 =?us-ascii?Q?GU7plvR8vAx44QB1zM+6NaJJLOdF8IGoTvlxeRqvn5SZCyWsJKA03tNSRZzF?=
 =?us-ascii?Q?2cARJgP0gw4HmtIB3faKLw+v7uZThgTzNEFNZaxCpfi0BxPIS71SeNpJt3bp?=
 =?us-ascii?Q?AVzSWdhcA22CsCHhm3XUsYLgmcdk/gDFvAH/tFAVJuSvWIF17iG6ibQbn39E?=
 =?us-ascii?Q?0kSA9W4fbB/uDxKUGOIVRJixYKlsyeBJxY3Yo0EezcY1BrwCn0AxRQKju1lV?=
 =?us-ascii?Q?g/rQUmCv1/8eTQ+cdlBGNjIsEK1/Kkj3VW0L+n6Degca4vQTO+iOocOYXyKF?=
 =?us-ascii?Q?3/uXInlC0fENgn4N+qLe1n3kjJFw05EPdj5xdxlqwleR9WQdfHlyWUYOLCWx?=
 =?us-ascii?Q?YQ1OcTmw1rGPRREW0JpuqNoZSJnNd9HuskD2UR2NGJUKrSiteGjfK3J9sykT?=
 =?us-ascii?Q?MdUTB4MBDSOQVee5w6hWEtIik9ZY8KshZfIBEvt/xCeqow=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xYtFfneFpID+ejMk1TQGau5oy7/AryFzm8rTvlPxl2AZAn8d2pdpHB0+4utq?=
 =?us-ascii?Q?4xaIcT2oUSgdAqSKuHc6yskgIehuwMwqolurm0CiB0zblBF8GxRZB8OVe7+H?=
 =?us-ascii?Q?g31RXnj4ZMXl5CSlRFxzqdkdBrGDRw+8ShV3ZjET7qEqUQA+wppjWeqq6Y8T?=
 =?us-ascii?Q?EBaZ0N6T0mBCW7wkedC6P5f3vX5PRZme4XZBkZAQZNkj7xh2DE1CkyH5vE3z?=
 =?us-ascii?Q?/H8Kbar7lvuTVGoWjO9D6cIub8Dv+bWifq5yonCmebeHsg9WdziumfITT745?=
 =?us-ascii?Q?y/NQYNNIOuGLDhNCX+GSUPTry/WNwTg3xhfCbC9Rih2B6P1yaejpsL+ie4/6?=
 =?us-ascii?Q?pTTUAVg3zIMvocOJjv54SeHQMw0r37gIIS3kBhMH1Fd0eg3Doc9a24rAEW1e?=
 =?us-ascii?Q?pPwFkhw8dqEto1Y1QV5PYb3b2alvYeNLQ812dhIK5Qyh09+ndMt/B/OvkKyF?=
 =?us-ascii?Q?cE+aOKCQqGgUEHJzFiA5PMo9vc91pkef0IhbOTlnwVMgNWcalAYNmYKvJ+t5?=
 =?us-ascii?Q?DrynCQlYQlXq8J4cVs4bMxWN4GqlQHkyx9VUb4McJvGu2Q1p3KtbmUK8E14x?=
 =?us-ascii?Q?sDD53bQvpcdFKx3RDisyaiMSxCh7uCbtPdmgGumRcM4O8lQ+RQAcDhgtNBTJ?=
 =?us-ascii?Q?lHDFw18mIS64eWB1Gab6HCD+/uVSFbgBZnZvtmkOcFp5ZM3lsKecyCRXAjPB?=
 =?us-ascii?Q?T2t6gDWma2eLeMSvsJ2Pragqh+aj2WlEL0aEOifGH2lu1AmiI+b8HAburQgm?=
 =?us-ascii?Q?S8sRvVo1/8nfnMW4zBLaeFWjWoAJPpzI3HQWRDbliaLrvg0J8TDuw7SqI5iP?=
 =?us-ascii?Q?RLR9a+nrocz9NSE+z33uwJIpwWgKa4Kx48BBKvX4aMPFVh9wBu2AZAEDwkAt?=
 =?us-ascii?Q?keb4Jo7stvlRodq+oojR/0LGlup/xeKmtttWZN/oUvyGwjnW7DxOAi8YeM4F?=
 =?us-ascii?Q?Asp0TIobhDjkr5IeeiHf4wD1TFciVG9CDNHemL1Nz85QS1h8E72oknY4Kswe?=
 =?us-ascii?Q?deyOfKXktMoAbZFGPIN00V3WHSm1oXaYYEmjGhjErdMSxny0g5r5XPDbkGs+?=
 =?us-ascii?Q?GxjJ+6npnKCHIe3SpUxpdsEAJMzsqnzKwBR7v0k4KHf6Uf0/Q5XTofkTDieY?=
 =?us-ascii?Q?iZ7nqfPXvgZ4JtJZDIQafudQHPO7hqg1kdb0vl1E60K5tYiU+b/ELHXOtrhw?=
 =?us-ascii?Q?27Gw4jfRMtJmumEnsZs8BmiG0yeZZrhRcXoMGFg/YO/O0DNdCC7otKWf2nl5?=
 =?us-ascii?Q?GumqWdBJVL7BXR0M2oeNKdx+Gx2W8irakYYB7rk2ktb9tSXUJbP+WwzriAyP?=
 =?us-ascii?Q?qpKAQWYbsEpWVPDu0hVx8enD6EOQX5JN3qN69ZAlyTjrJT5bqZ2MWGv7Y5Ur?=
 =?us-ascii?Q?1N6jPiFcrC0MnFVou6aVGV6rPaMELxtfOY8rQ4VD2qwS9a7e1u5P6XCDE9Th?=
 =?us-ascii?Q?GPOMiMBNjW4VulmJ6ykDd0lHjWQPllDwkjCee3eWh2N4BnzMXIP9TJkqOW1r?=
 =?us-ascii?Q?NxySzbNRiaG7KrJ6zBCSuO5XE4UU6172KP1jGCOPoB0xgOjMkA+Sj/x0TYgJ?=
 =?us-ascii?Q?fNVIHC8ma4gGgfJODWI7U9eaP9I1NrtpGf84CZwsWDFyb3+viFa6zdepcGS0?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	3VuHzNxVi+5by1qFMk5vHZSHa+qiJmHDsWy34DEuqyAt5QBSD5WArXk2u4nP5rYRJLNwKKEdF0mgQ9AbcUfYtUtu6tFyGGxpor48/8JVUfdNWesHz3lLeZcoCYQmes2ZaKQp94BS7UdKPxgvXnbP1I9eSqqJ3kaVpPg648yS/VuCLzUOZg4XsEhQDr3fiFruTMDaaLpvqq5vxUQQ14FD/AkCMZ8BeJyJgcwqi2Ec8fbkIgv4RAphD9J5hf9femi4WlUcPaUO+WcHlbEbPpXz1QPifogx5cYleS4epo42dOQgY2em6lozXrmQFNq/gXl+F85Wl4LskNfEe0KklS0lH/bOdAWwnrZXxK16AlCf5Fu0yTGEXd0p908ZdQHwxF0YsJyvp7gKhFA6u62aDy0Mh6ffIRADpsOBuBBFeo+fRAGXQOBwuThHdo8ZIYC81DkBgrl5d21vWSm9RduOCCl9zhuVHQthcgAlBYHYJDkhCo+nygUc3MgznSLzsznBc9XLhVY/IzkFRcy8FLuUBQQuPxcTJ4cFqXGB/6383K6qd8VHwEocHqXh0noNYnVv+vzk/KQi+7kXEAoGMOhGo05sOno9Y5+1RjYxz4a5U/HUbxU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb0629a2-de00-4835-8a64-08dca766fee5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 20:19:58.5657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OVsGFX4mPuWbZns8b0r4H9AK4pv686E3nGuiUaLtYXNVkpp2JtP6sv9cXq7Mu1lU0QcGySOi91ubHcCsvndKP10W9N2GHr70cWkd5AukEdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4372
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_14,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 bulkscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407180136
X-Proofpoint-GUID: HqRy8821GvDu8vpvKBVXeiOdoImPzt2T
X-Proofpoint-ORIG-GUID: HqRy8821GvDu8vpvKBVXeiOdoImPzt2T

On Thu, Jun 27, 2024 at 01:34:33AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>

This certainly needs some motivation in the commit message, because it is not
at all clear why this is needed.  Sure, the next patch in the series uses it
outside of dtrace_probe, but that patch also does not provide any motivation
on why that is needed (and same with the patch after that).  So, these three
patches (16-18) should be combined, and bear a commit message that explains
why this is needed.  That will help in reviewing this code.

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_impl.h  | 5 +++++
>  libdtrace/dt_probe.c | 5 -----
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index d15c238c..2132eda2 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -283,6 +283,11 @@ typedef struct dt_percpu_drops {
>  
>  typedef uint32_t dt_version_t;		/* encoded version (see below) */
>  
> +typedef struct dt_probe_clause {
> +	dt_list_t	list;
> +	dt_ident_t	*clause;
> +} dt_probe_clause_t;
> +
>  struct dtrace_hdl {
>  	const dtrace_vector_t *dt_vector; /* library vector, if vectored open */
>  	void *dt_varg;	/* vector argument, if vectored open */
> diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
> index 0b53121a..d0ae63d1 100644
> --- a/libdtrace/dt_probe.c
> +++ b/libdtrace/dt_probe.c
> @@ -24,11 +24,6 @@
>  #include <dt_list.h>
>  #include <dt_bpf.h>
>  
> -typedef struct dt_probe_clause {
> -	dt_list_t	list;
> -	dt_ident_t	*clause;
> -} dt_probe_clause_t;
> -
>  typedef struct dt_probe_dependent {
>  	dt_list_t	list;
>  	dt_probe_t	*probe;
> -- 
> 2.18.4
> 
