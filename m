Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1172C1D2796
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150353; cv=fail; b=Rm/wsD4IxG5HsL2yU+MrZYa1sIls7igumd5onSgiLdrHahC9/jiVGOz+iH7XpIiucYMrq9qFFMoz8zWFyT3eAPqH7z2U4r9Yj4tJMXknpSr8QwRWZnrHKqIBbQ2XJifnXucFsRIO2wjQr0UATt/lc0hd1QOj/2N9yXn4Id3Vm1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150353; c=relaxed/simple;
	bh=KdDfIOSrfxTaSpjQHWx8wC784n65retev+NwAFKielU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GiGIDWNY8/N1yxQe1sxWEWalPwthO0OFfRvWP725Nfzn0TpHbiklmaUtZdS7Zxyff3EVRAivRDbgP6suTUNxJNJ2yWyZ6T9D0GWpBgWlV0G2obC3H/q0736RVWwP7SZ+C2I4q5GQN45DCOzqda6g1xQ293tPMyP2pG6GtlYNC9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DoGIbFtS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gsMgYlGT; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DoGIbFtS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gsMgYlGT"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKtbaU010419
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=harQnxi9GgiJVnbwr2+mefk7fw1253gccxsMUPf2Fcw=; b=
	DoGIbFtSm2dUpXxCyXC4w+Z4tDQkqLs1RT2LBY6qyid0eh8gsrySg0gqBezw2pB9
	mvbDMaAjz0AkVP0APigTWA9jatnYlqiAUBE8DT4i2c/eWBrxoDsHZOUKpS9TcNEQ
	Sk4z5aWHmy4HrC8/x1uwqxP0ihfSLPipFqblimnXVihhsH3bOuQtrcX7kEbgxN96
	+90uI4enqP4gSXJ0NJYJEBrrkmzcKNmu5uNSrjcPC8Ru6LEQrIGGMyJTAngaxQIn
	SVO0wFgOjBsq56zfW6GgrjPRmLFaIOeEn4NYjjo19uEiVgcyXPH1Cymb86sRuptC
	JrgC5FBW9gA7whPpN2aUVw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grys41b3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:19:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SJn1Qw011835
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:19:07 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnabe8bh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:19:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqqDAFFM3pJHZpsF7Xlur5v57AyaGnUmcjl8Qy0r3VxKQ7dunE56wFsqTeMIlcdBjL8pk9EgK60q75dm0rccmeBFNcEhbPfwpFlmpWYcxXqfwqw4v/d8XOdXmXhHX55ckm7On1x2P6o+9GIP453Wdw7XYgPBubccgeGDPt1BvvpLs6oTeSPjCNLlMWYU9H6WfoNXg8644UwLumqR43ECR9hwCQFan0FU+910ImgKjaStu7YXab39YmW3Et3flrwtqrxYytMaPeX/SwyU6Ofq6OjJ7/SmX+1GA7FGrzHDSvV/8sEYim9DH+okm8TZ6mIjPIwQ38Uan1oQIwFKD9HBsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=harQnxi9GgiJVnbwr2+mefk7fw1253gccxsMUPf2Fcw=;
 b=SGHu5ad1SEXmlsgGMjYRM1UmjpHvWCBJgOvIwI7+56SvMwM1J6S6sQSBjbU7bvphcouviz0o8APlknvWwRo6wlb3WUinXyFZR3NpmiYd90rkn8Ok5aLCLpxNzqiAcq8BWF+SU+cO97mDhy/OrchgxlrBEu2OGX5QBYEA3FNQfJO7itZyQLAKRLNtqFAZR07OVzMznm7w41FBsUJqHarSbMjyZhuZipj+5WU0ZVxCVtZae1RCqqBNpOOrhUe41uFNcZrwsMFk0G1TWB1QMnSYPqcQTFDFPRAky+Yx697splBYUstDyIBtxVy0i0gQVATvEi4Xyygc68cC1PiF1Stzdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=harQnxi9GgiJVnbwr2+mefk7fw1253gccxsMUPf2Fcw=;
 b=gsMgYlGTMXxFpXcOPaFUdQAr0Pl0atcpwwPCwrsxN3aV3Pf5zY9ffdsamlQzA5UH3tc9vxxXuodn1BgeU8UkaPE4cvfbXc/AUQ4KkZu9nduZr2vMCJVhXO/pxgEdFoLQiOA9Vd94ZoknLwa+j1sUB4m9mH7CvAzYQytL4lUMb5E=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH2PR10MB4166.namprd10.prod.outlook.com (2603:10b6:610:78::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 21:19:04 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Mon, 28 Oct 2024
 21:19:04 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 5/6] usdt: typed args and arg mapping
Date: Mon, 28 Oct 2024 21:18:48 +0000
Message-ID: <20241028211849.458862-6-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241028211849.458862-1-nick.alcock@oracle.com>
References: <20241028211849.458862-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0659.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::11) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH2PR10MB4166:EE_
X-MS-Office365-Filtering-Correlation-Id: 82f5c2da-2f77-4e6c-5091-08dcf7962675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uzsidiR+aPilqaz4iOpvB6eCZgn04WeCU8tFcnfRtYnTgGByLe1UPHhsJJnI?=
 =?us-ascii?Q?m5HphJsHQWli+tDSbHH8MYprNZPnWHAIf9rMMq3obMyv0nyFtYlmeneC3oua?=
 =?us-ascii?Q?w2sCCtyHWVGm10Jr0Wtrt7R3zzwpL1yS/PTXCJ90guzTVxwRJIlZmUPSbgSU?=
 =?us-ascii?Q?M+M0Kfoutl8pGOzP+vKFAm5JdbtzsjApB8aExG5AU2U31pRuxaqpJi1izN8Z?=
 =?us-ascii?Q?/o8m8RJARIPUZcwk7TbExpCODKjsvBs6lUJXSkk7VAOlg5EtcLkrFpYqaXVI?=
 =?us-ascii?Q?AGrgI8jHAB9oMSuJ/1QsGIU0JT+AhljcfHwK/JV4WGl3QByv7SOz91gJNNNs?=
 =?us-ascii?Q?2u02PhOsiyi0zG1DBBuGXJhdxvd0tejCiP2f7BuqLG5LM1DRbuFeJnON8QQw?=
 =?us-ascii?Q?/a28D936NpooHKQQ+1NYieF4Jl68vsCLT43JxUoUDMF33nN8pnu9KmIA82tC?=
 =?us-ascii?Q?Un8Yvn/PQbIdsUGqw7E+soH99VgyqhgNiU5k4oGKXcSe0NNBoRA8EVm1e5Bd?=
 =?us-ascii?Q?BJ6fcq11e2T7hAnu90v9g+Cl34BubWYCsos1W5d756IqLPrMEub3motg2AFh?=
 =?us-ascii?Q?AzGcnj+MzacRAR8TgK7D2ny6yrBmxF2b8m764XmloEaFK6pVN3qVIBHe/KqC?=
 =?us-ascii?Q?xJwUSYcDs4tiY9ttCx5tDYCr/s8Cd9q9HhkSb+0uwXeb6wiO8NrL2fkYzdp5?=
 =?us-ascii?Q?X+pKjgjSNf2j7KrFkn/Bqa/cOYWHDihyL1A+q0/4I6kC/BjlUhIrHjSF3Cm3?=
 =?us-ascii?Q?j2Lx2j+LV1lekGBxlKlPb07ZwpJ6hGDABMjWWB/P1nuOFYUr499eY2SBcPtf?=
 =?us-ascii?Q?l5+tnOHDzDGGHFC52huegLsarNh7AzMUX0Y6lh5sr8e/yTFHCK6Fq7Uh5OF7?=
 =?us-ascii?Q?ibj3B681x0234vl9EIcX8U7P9T4JR6jI1v037TUVb9IxI0Jcb4zK0E75ynkI?=
 =?us-ascii?Q?WBMTRL7bFMsYljb/Dkfii1dcdAeJ4bjlYtFvgCrAyD3onn5qkadS076slMGP?=
 =?us-ascii?Q?H2eBwkc1iqTJyHAokUYa9fXA8yRfu+EVqmYkvrGnAQTkgTXaAER5ISXLjzmG?=
 =?us-ascii?Q?w67ib3KdMkoyBOAnUY6s3pA98I+jKam+Zh6eby4nSYzSklc0aMiKwpuUhnyI?=
 =?us-ascii?Q?fyPyhLG2GLmJn6co6rliRepm2fcg7SlESVlMYSXXgpmvFif21DZFi1dQPPsW?=
 =?us-ascii?Q?HbXd9eTV1h4b/tOEFFu8E5GseXrta3/U52B7idHw3OD7SuFstkK1omiqwyQG?=
 =?us-ascii?Q?QwosiUiGy9vEHjcpapBqWQ6c5bXnGFDGxojGxSHLVwbwjEdN9yN+ZpQ2n+jB?=
 =?us-ascii?Q?PRs72XKTDL6+8zRj3RQRDY0F?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xCaJaoAPiMfx316XDY1wpZdsWvg6iLxIXHa6FY5Abfl+gzmUx/DbqzGrT8eG?=
 =?us-ascii?Q?CMKmf9AN7Yi6zMZNeyIclGiE9psGEzr7nWoYLbg52OwzzyI8KyNXH1dp8ofQ?=
 =?us-ascii?Q?GzZ7k2rgU0vDRVy5ULfKazG2rJcTSQ5TnHa2KO86mI5EiNZa6uSn4nzhvLHv?=
 =?us-ascii?Q?l1pQNOooUKdcmMS8ajAdBXOIhE052qwlj/J+DbTKPHFePqrdo95T9X0Ls2kF?=
 =?us-ascii?Q?ar7kM3IvWWUJQpaED+owkuouUgSO2tsmYEe6ICa9eTBwu8DPyUHYR2eQjhT5?=
 =?us-ascii?Q?4xR1LCDv6gVqqbbRbv+A3M6LSA9YEVu/DZgwrhLQnjm1UtGL2LKdLl6Y1if1?=
 =?us-ascii?Q?lSskIwYopDAhWDFTkb+9TJB0D5qZlcrQ6q8IzQIFAqigxt8qArwUHzUx8YZp?=
 =?us-ascii?Q?uFY1HMANHxJUUCCQToArnZ7rjLX1wkz9DwlTolcFVhPiN/IVm5CIT0FXFkfG?=
 =?us-ascii?Q?6fTbQNNFkDdmksdhOmIu1UOKfIsjBcGBJsurranOsYqIIff+B+xaCTCpebv+?=
 =?us-ascii?Q?EysoP+FnHWWL+BkpagbtCunEzrHUXTkYOajF8a11HYLNY6KHyOotcRyrqxpP?=
 =?us-ascii?Q?aoBZX+A4OuyT2MNAqd8z986dbtkgvZBow0ChdxYWQhUL989BilHOxOXsH6Hl?=
 =?us-ascii?Q?uyaoDe9/3y6mp9yMY/BFhJzio98TGfP2+ScBbiu9bI9Q31ACLheobDTEgyIs?=
 =?us-ascii?Q?NG46V7mpWgZzcJz0ek2O1AvgxHx0JOljuAateh/Obe872rgyi625/ThDjmhQ?=
 =?us-ascii?Q?TZOBv+Sv7fDPgEcJnI2G1yjH7MBQej2yUcnKK2CZnTCbUYn2K1JDWfH4YGHT?=
 =?us-ascii?Q?SDtiHVpcBu1qQQyxgIZJeYzISGgICjNrTwQ/DHpoTlTPmO2hjezXtgg5MMhS?=
 =?us-ascii?Q?dQz4BZU2V6PfQ33JfVvu/AqleynavmxG35qmotS4At1YOB3yj/LFPr2kw4vJ?=
 =?us-ascii?Q?pcuMD44sa5ZFJ8QB2tojjeUjUCoHwx9eA+i+PgnVWDcb3Tk/8xMK5Mkg/iSj?=
 =?us-ascii?Q?yfZhf1o77ZBlox315EVNUnFIUj4GiSKYWDuVTRh6q0g6cYjIaQmoKbPCQSDQ?=
 =?us-ascii?Q?+OItE7VnXP4nWj4mYZwOwA/Qgy6AsWWPIWyg9EivrjO9XcWHXA38uPbbyNci?=
 =?us-ascii?Q?+err+Evs6So49mZpKuxXk5+Ew55Eo1B6w6F1H2RnvG2Tzm9LdGVAYfMDPtLG?=
 =?us-ascii?Q?b6vH3sJ8BAjqiKdyZUxNuWf2/oehx9+SKAhrt2OF7bKj8tBE5Q8vYmIdW10T?=
 =?us-ascii?Q?yPQ4a4rSShOJ+CMHz0Su6ZLH2m20f5wodd9F3qL4wnjdlQdhLre9Y3b2bU+B?=
 =?us-ascii?Q?/oh+bioEpIfNaqIySeNQSoXnNkkGacPGdG8/xHfc+23YkSmAOPWPlKdmqwyr?=
 =?us-ascii?Q?li69bB61rZwhsUs16eSNWS776lENXI2RlsDSH9Vl9vLawViHD+GMrVuJlo68?=
 =?us-ascii?Q?KHxAFwJcmSv7wJgHdIPFwzj1uXFjwXCw4Tf5I34cKKUFTUhYzS3820YMmwlQ?=
 =?us-ascii?Q?gAwDQBk52fyUIkeHEHE/Tzzh4Wet0qAkvIG8MAWY5YNq9jhVROt3zFqvNVcw?=
 =?us-ascii?Q?a8UohZF1J2YZmCAq07wk+KeH/VLUxut5y25TR4aHQtAxpPgRE8dFGfXcd5FU?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LBZG3H82B7h0c/gO3Kv+hmvzYS4teHvefAxJSuHHzzXGZN/UQZfe6Mj85r47j5wwhZNLTKz+8sXEzAATCbGbwLYJBmCJwLpVfNJKrAi4HiRuYA8VbnWhnxVKkTKXHO+e/YDdZP7bQqYtCiMud+u/kQFHl75sIItew+jWf98rs3TCOJ6vDqIVgQLVlLAFU2nW+fyq9W6Eojw27d7G33UEkwx/19cZPLztIcBmuiDKV5ssHWauQMf1m/eHpC2is3fINOg/LYK7mZZeUXP9mUWIBcGDiREKFBm3HQh6uQEEer+XeJq2H1mRF7axgm+J0C8Cy8Eexl8F7m9ideK4ntaCO+S/LT0QQ+RGlhWjf6J4vRZ4CrT3K65kUWfsL2rjhxiDGZR3ExKFTafERrgMCK81Ds46FzFAIhSs0bWVeEi+FY9a/3kKukY64+i38r1Ra8Te1d6cdTqzQ9QdoNjN21XXZGPe7DWNpvz4Tq39FsgvNB4yhBr+iSVJ/ahJOb5Ru6wB858x5xHI28DIxSfwpJqVkeHGPUx/eQLPvRZ6eDohmhKie2n+CGDGFTYtr8qSaRtOFYy93XztYKrkL6sfE7rTXzftEOidtMKuU0IlOQnx1II=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f5c2da-2f77-4e6c-5091-08dcf7962675
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 21:19:04.4147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ir5gaphh6WHpnEM8SfUDa9Annl37HK2lj9qNhUPWrcMIfo1UK1JMAy7x3Np24v2knTE3fbHEVrzKO4ausBZ3wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4166
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_10,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280165
X-Proofpoint-ORIG-GUID: d07KwaYhyoxuif0TlyOUQsS8GEB5K168
X-Proofpoint-GUID: d07KwaYhyoxuif0TlyOUQsS8GEB5K168

This change propagates the arg type and mapping info we just got into the
pid_probespec_t onward into the underlying dt_uprobe_t, shuffles the native
types before handing off a 1:1 mapping to the dt_probe_t, and calls
dt_cg_tramp_map_args() to apply the requested mappings.  With this, USDT
probes should now have visible types which obey the :-notation translators
specified in their .d fils (this is now tested).

The probe info has been moved from the underlying probe to the overlying one
as part of this: underlying probes don't have any user-visible args to
get info for, and their probe_info functions are never called.

We make a couple of assumptions for simplicity, noted by TODOs in the source:

 - overlying probes all have the same native types and mappings, so we don't
   need to look at more than one underlying probe to figure out what they
   are.  DTrace always generates such a thing, but DOF specifying multiple
   overlapping probes seems perfectly possible for other programs to generate.

 - any given underlying probe locus is either a PID or a USDT probe, never
   both, so we can just map the args at the start of the trampoline and then
   never touch them again.  The both-at the-same-locus case, while in theory
   possible, is not yet implemented, and significant changes need to be made
   to create_underlying() to fix this.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/dt_pid.c                            |   1 +
 libdtrace/dt_prov_uprobe.c                    | 161 +++++++++++++++++-
 test/triggers/usdt-tst-argmap-prov.d          |   5 +-
 test/triggers/usdt-tst-argmap.c               |   5 +-
 .../dtrace-util/tst.ListProbesArgsUSDT.r      |  34 ++++
 .../dtrace-util/tst.ListProbesArgsUSDT.r.p    |   2 +
 .../dtrace-util/tst.ListProbesArgsUSDT.sh     |  83 +++++++++
 test/unittest/usdt/err.argmap-null.d          |  40 +++++
 test/unittest/usdt/err.argmap-null.r          |   2 +
 test/unittest/usdt/tst.argmap-null.d          |  32 ++++
 test/unittest/usdt/tst.argmap-typed-partial.d |  49 ++++++
 test/unittest/usdt/tst.argmap-typed.d         |  48 ++++++
 test/unittest/usdt/tst.argmap.d               |   3 +-
 13 files changed, 454 insertions(+), 11 deletions(-)
 create mode 100644 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
 create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
 create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
 create mode 100644 test/unittest/usdt/err.argmap-null.d
 create mode 100644 test/unittest/usdt/err.argmap-null.r
 create mode 100644 test/unittest/usdt/tst.argmap-null.d
 create mode 100644 test/unittest/usdt/tst.argmap-typed-partial.d
 create mode 100644 test/unittest/usdt/tst.argmap-typed.d

diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index e4dc5368897d..d7c93afab1ec 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -950,6 +950,7 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 
 			p += args->size;
 			seen_size += args->size;
+			args = (dof_parsed_t *) p;
 
 			if (!validate_dof_record(path, args, DIT_ARGS_MAP,
 						 dof_buf_size, seen_size))
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 481159b01c24..e45d9b1bab61 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -55,7 +55,12 @@ typedef struct dt_uprobe {
 	uint64_t	off;
 	int		flags;
 	tp_probe_t	*tp;
-	dt_list_t	probes;		/* pid/USDT probes triggered by it */
+	int		nargc;		   /* number of native args */
+	int		xargc;		   /* number of xlated args */
+	char		*nargv;		   /* array of native args */
+	char		*xargv;		   /* array of xlated args */
+	int8_t		*argmap;	   /* mapped arg indexes */
+	dt_list_t	probes;		   /* pid/USDT probes triggered by it */
 } dt_uprobe_t;
 
 typedef struct list_probe {
@@ -112,6 +117,9 @@ static void probe_destroy_underlying(dtrace_hdl_t *dtp, void *datap)
 	dt_tp_destroy(dtp, tpp);
 	free_probe_list(dtp, dt_list_next(&upp->probes));
 	dt_free(dtp, upp->fn);
+	dt_free(dtp, upp->nargv);
+	dt_free(dtp, upp->xargv);
+	dt_free(dtp, upp->argmap);
 	dt_free(dtp, upp);
 }
 
@@ -138,7 +146,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	char			prb[DTRACE_NAMELEN];
 	dtrace_probedesc_t	pd;
 	dt_probe_t		*uprp;
-	dt_uprobe_t		*upp;
+	dt_uprobe_t		*upp = NULL;
 	int			is_enabled = 0;
 
 	/*
@@ -201,8 +209,48 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 		if (upp->tp == NULL)
 			goto fail;
 
+		/*
+		 * Arg info.  This really relates to the overlying probe (all
+		 * underlying probes associated with a given underlying probe
+		 * must have the same args), but the overlying probe doesn't
+		 * exist at this point so we must put it here and pull it out
+		 * when the overlying probe info is called for.
+		 *
+		 * TODO: is this true? can distinct underlying probes have
+		 * different native args, as long as their xlated types are the
+		 * same?
+		 */
+
+		if (psp->pps_nargv) {
+			upp->nargc = psp->pps_nargc;
+			upp->nargv = dt_alloc(dtp, psp->pps_nargvlen);
+			if(upp->nargv == NULL)
+				goto fail;
+			memcpy(upp->nargv, psp->pps_nargv, psp->pps_nargvlen);
+		}
+
+		if (psp->pps_xargv) {
+			upp->xargc = psp->pps_xargc;
+			upp->xargv = dt_alloc(dtp, psp->pps_xargvlen);
+			if(upp->xargv == NULL)
+				goto fail;
+			memcpy(upp->xargv, psp->pps_xargv, psp->pps_xargvlen);
+
+			upp->argmap = dt_calloc(dtp, psp->pps_xargc,
+						sizeof(int8_t));
+			if(upp->argmap == NULL)
+				goto fail;
+			memcpy(upp->argmap, psp->pps_argmap,
+			       psp->pps_xargc * sizeof(int8_t));
+		}
+
+		/*
+		 * TODO: validate that all underlying probes for a given
+		 * overlying probe have the same args.
+		 */
+
 		uprp = dt_probe_insert(dtp, pvp, pd.prv, pd.mod, pd.fun, pd.prb,
-				      upp);
+				       upp);
 		if (uprp == NULL)
 			goto fail;
 	} else
@@ -413,6 +461,9 @@ static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
  *
  * The trampoline will first populate a dt_dctx_t struct.  It will then emulate
  * the firing of all dependent pid* probes and their clauses.
+ *
+ * uprobe trampolines will also arrange for argument shuffling if the argmap
+ * array calls for it.
  */
 static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 {
@@ -437,6 +488,34 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		dt_cg_tramp_copy_args_from_regs(pcb,
 						!(upp->flags & PP_IS_FUNCALL));
 
+	/*
+	 * Figure out if we need to remap args, and remap them if needed.
+	 */
+	if (upp->argmap) {
+		int	needs_mapping = 0;
+		size_t	i;
+
+		for (i = 0; i < upp->xargc; i++) {
+			if (upp->argmap[i] != i) {
+				needs_mapping = 1;
+				break;
+			}
+		}
+
+		/*
+		 * TODO: pid probes are never mapped, so a mapped set of args
+		 * for UDST probes need saving/restoring to reverse the mapping
+		 * for pid probes at the same locus -- but right now pid and
+		 * usdt probes hitting the same locus simply end up as whichever
+		 * registered first because create_underlying cannot handle this
+		 * case, so we can avoid it here too.  dt_cg_tramp_map_args
+		 * already saves regs: all we need to do is restore them before
+		 * any pid probe is hit.
+		 */
+		if (needs_mapping)
+			dt_cg_tramp_map_args(pcb, upp->argmap, upp->xargc);
+	}
+
 	/*
 	 * Retrieve the PID of the process that caused the probe to fire.
 	 */
@@ -710,8 +789,77 @@ attach_bpf:
 static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 		      int *argcp, dt_argdesc_t **argvp)
 {
-	*argcp = 0;			/* no known arguments */
-	*argvp = NULL;
+	size_t		i;
+	list_probe_t	*pup = prp->prv_data;
+	dt_uprobe_t	*upp;
+	char		*nptr;
+	char		*xptr;
+	int		argc = 0;
+	dt_argdesc_t	*argv = NULL;
+	char		**nargv = NULL;
+
+	/* No underlying probes?  No args.  */
+	if (!pup)
+		goto done;
+
+	upp = pup->probe->prv_data;
+	nptr = upp->nargv;
+	xptr = upp->xargv;
+
+	argc = upp->xargc;
+	if (argc == 0)
+		argc = upp->nargc;
+	if (argc == 0)
+		goto done;
+	if (!upp->nargv || upp->nargc == 0)
+		goto done;
+
+	/*
+	 * Construct an array to allow accessing native args by index, if we
+	 * need to (which we do whenever we have remapped args).  We don't need
+	 * to worry that any of the indexes might be too large, etc: this has
+	 * been checked already by validate_provider() before parsing and
+	 * writing to the DOF stash, and anyone who could inject invalid records
+	 * into the DOF stash is already root.
+	 *
+	 * Shuffle the native args according to the mapping, then set up a 1:1
+	 * mapping in its place: we do the remapping ourselves, driven directly
+	 * from upp->remapargs, in the trampoline, so array ops etc should not
+	 * do it.
+	 */
+	if (upp->xargc > 0) {
+		if ((nargv = dt_zalloc(dtp, upp->nargc * sizeof(char *))) == NULL)
+			return dt_set_errno(dtp, ENOMEM);
+
+		for (i = 0; i < upp->nargc; i++, nptr += strlen(nptr) + 1)
+			nargv[i] = nptr;
+	}
+
+	argv = dt_zalloc(dtp, argc * sizeof(dt_argdesc_t));
+	if (argv == NULL) {
+		dt_free(dtp, nargv);
+		return dt_set_errno(dtp, EDT_NOMEM);
+	}
+
+	for (i = 0; i < argc; i++) {
+		int map_arg = i;
+
+		if (upp->xargc > i)
+			map_arg = upp->argmap[i];
+
+		if (xptr) {
+			argv[i].native = strdup(nargv[map_arg]);
+			argv[i].xlate = strdup(xptr);
+		}
+		argv[i].mapping = i;
+
+		/* Guaranteed safe: see libcommon/dof_parser.c:strings_len() */
+		if (xptr)
+			xptr += strlen(xptr) + 1;
+	}
+done:
+	*argcp = argc;
+	*argvp = argv;
 
 	return 0;
 }
@@ -779,7 +927,6 @@ dt_provimpl_t	dt_uprobe = {
 	.load_prog	= &dt_bpf_prog_load,
 	.trampoline	= &trampoline,
 	.attach		= &attach,
-	.probe_info	= &probe_info,
 	.detach		= &detach,
 	.probe_destroy	= &probe_destroy_underlying,
 };
@@ -794,7 +941,6 @@ dt_provimpl_t	dt_uprobe_is_enabled = {
 	.load_prog	= &dt_bpf_prog_load,
 	.trampoline	= &trampoline_is_enabled,
 	.attach		= &attach,
-	.probe_info	= &probe_info,
 	.detach		= &detach,
 	.probe_destroy	= &probe_destroy_underlying,
 };
@@ -818,5 +964,6 @@ dt_provimpl_t	dt_usdt = {
 	.prog_type	= BPF_PROG_TYPE_UNSPEC,
 	.provide_probe	= &provide_usdt_probe,
 	.enable		= &enable_usdt,
+	.probe_info	= &probe_info,
 	.probe_destroy	= &probe_destroy,
 };
diff --git a/test/triggers/usdt-tst-argmap-prov.d b/test/triggers/usdt-tst-argmap-prov.d
index 28134baa6fa3..d8c3e88c4616 100644
--- a/test/triggers/usdt-tst-argmap-prov.d
+++ b/test/triggers/usdt-tst-argmap-prov.d
@@ -1,10 +1,13 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
 provider test_prov {
 	probe place(int i, int j) : (int j, int i, int i, int j);
+	probe place2(int i, char *j) : (char *j, int i, int i, char *j);
+	probe place3(int i, char *j) : (char *j);
+	probe place4(int i, char *j) : ();
 };
diff --git a/test/triggers/usdt-tst-argmap.c b/test/triggers/usdt-tst-argmap.c
index 89a0a53fc1d5..9244092514ff 100644
--- a/test/triggers/usdt-tst-argmap.c
+++ b/test/triggers/usdt-tst-argmap.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -12,6 +12,9 @@ main(int argc, char **argv)
 {
 	for (;;) {
 		DTRACE_PROBE2(test_prov, place, 10, 4);
+		DTRACE_PROBE(test_prov, place2, 255, "foo");
+		DTRACE_PROBE(test_prov, place3, 126, "bar");
+		DTRACE_PROBE(test_prov, place4, 204, "baz");
 	}
 
 	return 0;
diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
new file mode 100644
index 000000000000..8bcfa92ff6b0
--- /dev/null
+++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
@@ -0,0 +1,34 @@
+   ID   PROVIDER            MODULE                          FUNCTION NAME
+ XX test_provXXXX              test                              main go
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Types
+		args[0]: char *
+		args[1]: int
+
+   ID   PROVIDER            MODULE                          FUNCTION NAME
+ XX test_provXXXX              test                              main go
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Types
+		args[0]: char *
+		args[1]: int
+
diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
new file mode 100755
index 000000000000..c575983adf65
--- /dev/null
+++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
@@ -0,0 +1,2 @@
+#!/bin/sed -rf
+s,test_prov[0-9]*,test_provXXXX,g; s,^ *[0-9]+, XX,g;
diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
new file mode 100755
index 000000000000..ad8dc2e7c267
--- /dev/null
+++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
@@ -0,0 +1,83 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2013, 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+##
+#
+# ASSERTION:
+# Testing -lvn option with USDT probes with a valid probe name.
+#
+# SECTION: dtrace Utility/-ln Option
+#
+##
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+CC=/usr/bin/gcc
+CFLAGS=
+
+DIRNAME="$tmpdir/list-probes-args-usdt.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+cat > prov.d <<EOF
+provider test_prov {
+	probe go(int a, char *b) : (char *b, int a);
+};
+EOF
+
+$dtrace -h -s prov.d
+if [ $? -ne 0 ]; then
+	echo "failed to generate header file" >& 2
+	exit 1
+fi
+
+cat > test.c <<EOF
+#include <sys/types.h>
+#include "prov.h"
+
+int
+main(int argc, char **argv)
+{
+	TEST_PROV_GO(666, "foo");
+	sleep(10);
+}
+EOF
+
+${CC} ${CFLAGS} -c test.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test.c" >& 2
+	exit 1
+fi
+$dtrace -G -s prov.d test.o
+if [ $? -ne 0 ]; then
+	echo "failed to create DOF" >& 2
+	exit 1
+fi
+${CC} ${CFLAGS} -o test test.o prov.o
+if [ $? -ne 0 ]; then
+	echo "failed to link final executable" >& 2
+	exit 1
+fi
+
+script()
+{
+	$dtrace -c ./test -lvn 'test_prov$target:::go'
+	./test &
+	PID=$!
+	disown %+
+	$dtrace -p $PID -lvn 'test_prov$target:::go'
+	kill -9 $PID
+}
+
+script
+status=$?
+
+exit $status
diff --git a/test/unittest/usdt/err.argmap-null.d b/test/unittest/usdt/err.argmap-null.d
new file mode 100644
index 000000000000..8b805cfcfd5f
--- /dev/null
+++ b/test/unittest/usdt/err.argmap-null.d
@@ -0,0 +1,40 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: usdt-tst-argmap */
+/* @@trigger-timing: before */
+/* @@runtest-opts: $_pid */
+
+/*
+ * ASSERTION: Verify that a probe with no args at all has no args.
+ */
+
+BEGIN
+{
+	/* Timeout after 5 seconds */
+	timeout = timestamp + 5000000000;
+}
+
+test_prov$1:::place4
+/args[0] != 204 || args[0] == 204/
+{
+	printf("this should never happen");
+	exit(1);
+}
+
+test_prov$1:::place4
+{
+	printf("nor should this");
+	exit(1);
+}
+
+profile:::tick-1
+/timestamp > timeout/
+{
+	trace("test timed out");
+	exit(1);
+}
diff --git a/test/unittest/usdt/err.argmap-null.r b/test/unittest/usdt/err.argmap-null.r
new file mode 100644
index 000000000000..f60e9b25ab2f
--- /dev/null
+++ b/test/unittest/usdt/err.argmap-null.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/usdt/err.argmap-null.d: line 23: failed to resolve translated type for args[0]
diff --git a/test/unittest/usdt/tst.argmap-null.d b/test/unittest/usdt/tst.argmap-null.d
new file mode 100644
index 000000000000..b672df3470d6
--- /dev/null
+++ b/test/unittest/usdt/tst.argmap-null.d
@@ -0,0 +1,32 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: usdt-tst-argmap */
+/* @@trigger-timing: before */
+/* @@runtest-opts: $_pid */
+
+/*
+ * ASSERTION: Verify that you can remap to no args at all.
+ */
+
+BEGIN
+{
+	/* Timeout after 5 seconds */
+	timeout = timestamp + 5000000000;
+}
+
+test_prov$1:::place4
+{
+	exit(0);
+}
+
+profile:::tick-1
+/timestamp > timeout/
+{
+	trace("test timed out");
+	exit(1);
+}
diff --git a/test/unittest/usdt/tst.argmap-typed-partial.d b/test/unittest/usdt/tst.argmap-typed-partial.d
new file mode 100644
index 000000000000..14e7e0992045
--- /dev/null
+++ b/test/unittest/usdt/tst.argmap-typed-partial.d
@@ -0,0 +1,49 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: usdt-tst-argmap */
+/* @@trigger-timing: before */
+/* @@runtest-opts: $_pid */
+
+/*
+ * ASSERTION: Verify that args[N] variables are properly typed when remapped,
+ *            even if some args are unused.
+ */
+
+BEGIN
+{
+	/* Timeout after 5 seconds */
+	timeout = timestamp + 5000000000;
+}
+
+test_prov$1:::place3
+/stringof(args[0]) != "bar"/
+{
+	printf("arg is %s; should be \"bar\"",
+	    stringof(args[0]));
+	exit(1);
+}
+
+test_prov$1:::place3
+/stringof(copyinstr(arg0)) != "bar"/
+{
+	printf("arg is %s; should be \"bar\"",
+	    stringof(copyinstr(arg0)));
+	exit(1);
+}
+
+test_prov$1:::place3
+{
+	exit(0);
+}
+
+profile:::tick-1
+/timestamp > timeout/
+{
+	trace("test timed out");
+	exit(1);
+}
diff --git a/test/unittest/usdt/tst.argmap-typed.d b/test/unittest/usdt/tst.argmap-typed.d
new file mode 100644
index 000000000000..ef5b32d1d372
--- /dev/null
+++ b/test/unittest/usdt/tst.argmap-typed.d
@@ -0,0 +1,48 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: usdt-tst-argmap */
+/* @@trigger-timing: before */
+/* @@runtest-opts: $_pid */
+
+/*
+ * ASSERTION: Verify that args[N] variables are properly typed when remapped.
+ */
+
+BEGIN
+{
+	/* Timeout after 5 seconds */
+	timeout = timestamp + 5000000000;
+}
+
+test_prov$1:::place2
+/stringof(args[0]) != "foo" || args[1] != 255 || args[2] != 255 || stringof(args[3]) != "foo"/
+{
+	printf("args are %s, %d, %d, %s; should be \"foo\", 255, 255, \"foo\"",
+	    stringof(args[0]), args[1], args[2], stringof(args[3]));
+	exit(1);
+}
+
+test_prov$1:::place2
+/stringof(copyinstr(arg0)) != "foo" || arg1 != 255 || arg2 != 255 || stringof(copyinstr(arg3)) != "foo"/
+{
+	printf("args are %s, %d, %d, %s; should be \"foo\", 255, 255, \"foo\"",
+	    stringof(copyinstr(arg0)), arg1, arg2, stringof(copyinstr(arg3)));
+	exit(1);
+}
+
+test_prov$1:::place2
+{
+	exit(0);
+}
+
+profile:::tick-1
+/timestamp > timeout/
+{
+	trace("test timed out");
+	exit(1);
+}
diff --git a/test/unittest/usdt/tst.argmap.d b/test/unittest/usdt/tst.argmap.d
index 7896dc07e0e2..9cd3425bf8e0 100644
--- a/test/unittest/usdt/tst.argmap.d
+++ b/test/unittest/usdt/tst.argmap.d
@@ -1,11 +1,10 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
-/* @@xfail: dtv2 */
 /* @@trigger: usdt-tst-argmap */
 /* @@trigger-timing: before */
 /* @@runtest-opts: $_pid */
-- 
2.46.0.278.g36e3a12567

