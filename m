Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2181712F5A5
	for <dtrace@lists.linux.dev>; Wed, 12 Nov 2025 00:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762907048; cv=fail; b=u9JYuB737pFXZ8Sr2lf3yiKvWaar+M6VJufGThv+nHF9zfq5GaQ/fpfabhUGvyPJB1h6+PDLTGkfw26dRRdViZFLhD5jdGe5a/jF/oJ66PF0wPceQLXqLDJCx/rjR0xgaP5Qx5J7Y6F0zriAIMzliCOfOxhzBNkaab+LNMoo7GA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762907048; c=relaxed/simple;
	bh=eZWhhAa3oBjAIWum7OLMlTjuHA+hvnK6Y7ff3altVtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UhZ90MbzKhI/IpFJ/TALWMAhmGhs2cM6aA3Wesjwr33BV28cy4kZ6en8yVCy5OS7UtSfNCL4aPkYAewDpMqQdw88wKNYDEu3xN1eT8PeF0aBw0cIvKPXceO5+ptftJSV/nJUmECAPqtJMt89EGLOwpVQ7Bn+iU36Fe3LFprW8fo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qewbp3LQ; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LyZZhbcT reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qewbp3LQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LyZZhbcT"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AC07Xv3022521
	for <dtrace@lists.linux.dev>; Wed, 12 Nov 2025 00:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=1zTgMZUKG48eBHPfcNVAIBlImy2CIYO1IBjnPVmjQCg=; b=
	qewbp3LQ6XtOYYY2LhV34I7njMbikyw+UJoYVVhBhL/652Bk+JwxxGzuiip9/dtx
	vuooiZzga2dCBcwoxzupQk/4ssEFmXLaJ9aZkdt1smfphSVt+HARr+i+UpuRLRVv
	OYs8jx2XKyMqwH7x+8NyTGK466csYeS/SMj9ouZVyEEYCCDfYpdrDWoqCGbMluoB
	MUgS40nGZfkqGk99ETFxpabdPMdBOFmXppOBpf/igKXXvOH0VZbYclmssR7NpW0p
	cHd/xEttkDV7dqOEJQJwC2Ix9/1KrFVasFcaZt02CNURH+4G4g8YKQtTEdVW3ma0
	BtvZDkW4Inqpg2PcaMhzgg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4acbgjrd6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 12 Nov 2025 00:24:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5ABLadYC012653
	for <dtrace@lists.linux.dev>; Wed, 12 Nov 2025 00:24:03 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010021.outbound.protection.outlook.com [52.101.56.21])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4a9vadjqa4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 12 Nov 2025 00:24:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8tE7CzccX2DkPxY3fujoHAOdTbo5WQKi6l83QIRgU3z2tdVKcUB/O83H0sFjctfXWXaI+A9L3hwJlysgtFa+4NYk8I7si+ny1ZauJMjsm/qUvCFafz7BaiUsCe7+PyrGMhUUdbmbMb1FQXwl4fAxKWrvZ2Ug4nmXw1TYG92gp0ZytIKOvIarMFyXFoo5rTjV54ZpEudQ6g8oQuuCM6zT+G3wQNWvB1SFECwa30OK9lc22BjfpC/uUdGzyx8ACRoWcakKbfEjaSQB4g4rr9xbPxw80+LoEV3FfhdDd6PGRGeqY7axpbAWuIv5tEalxP1ABI6BQ5J8HsihQx+Y5cX6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMje9l5f4jjblm3IpWP4LGVw9kM2jOr4kdP+2JiEbyU=;
 b=PhmAd0z1CyfObtsjgosySVQe5I5FyqWZxfZztR2Xh7ZHMGbCB009lb5UDsA7Ut6PVPFTqo3QdX2TT72j1xZ3YTyud2qX0ietjxG2eiPhZIsmfEMQm3PmPs/BRxzYtb23JQ/R5D0Qi19wybYuqlWoIicHrDUBjXYQKHR8RGgAB7VA69xRGqV6ubvzzUuVpoXXXIHUfkH+1eG6/JkggsQYnztcWEdoOIrobpt5kD45EW6xZ1mQj/RpiwTW4qW9AB/aXecymXlfahxCsfQLYwA65w94yov7zJzhWJv3vK5IGIFi+R6bRQWhA2efg9ZKpaqaGCFcoh8HLy2SlVyGhWAseQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMje9l5f4jjblm3IpWP4LGVw9kM2jOr4kdP+2JiEbyU=;
 b=LyZZhbcT7pDkcBHHJoVx0gOupx3cenNrRvmRsyGg9jz8AAE8Bl0qaC8ncWI+eIB0wk1PtnXLtBy4pl+hxSMmfUazw9cLBYU/yD9A4Sgw3WEbUzHFqv333hHi0wQIEm0UXd3zCEAkUb0XfzOMb7EU7HJucqd8wm2Vo3wYSyly31U=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by PH7PR10MB5831.namprd10.prod.outlook.com (2603:10b6:510:132::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 00:24:00 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9298.015; Wed, 12 Nov 2025
 00:24:00 +0000
Date: Tue, 11 Nov 2025 19:23:57 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 4/4] uprobe: Implement PID-specific uprobes
Message-ID: <aRPTnXwwxG/64t9n@oracle.com>
References: <BY5PR10MB39877C63B4E017C4A521C4CBC2CEA@BY5PR10MB3987.namprd10.prod.outlook.com>
 <b8b5e530-c82b-174b-0553-034845c2e25e@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8b5e530-c82b-174b-0553-034845c2e25e@oracle.com>
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|PH7PR10MB5831:EE_
X-MS-Office365-Filtering-Correlation-Id: fd4df7a9-f41b-4bd8-b440-08de2181c6a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?hyz0qiiJVBYY1gnew9bDNKSqy3Nk+uDOzfZDxM0AmdWtwmhE14mGJ4ziET?=
 =?iso-8859-1?Q?FYj1kKvI1+o6X9Z6E/GqwrUVeqgX8QQCtz4kHdbRUh/z92T4WVDFaQ3M2L?=
 =?iso-8859-1?Q?aKnjV4BQl9YWlu1L2OfHHrkGRjl+GZhdYeSxR15pawWpJTNHMQjGQdoaui?=
 =?iso-8859-1?Q?kb7sjQwkdZniWJf1ovG4eFCrPim680Ro480oKhVtyM+HlAWlg7ih9f4BHj?=
 =?iso-8859-1?Q?gr3TDBwQ3nfWn4mmTJSmPB/+Z5dWQPc/80m8ClbTM+AO7JsAZOpvLYY8lb?=
 =?iso-8859-1?Q?cTNm3ai6aYkG3IoalDBtj7ncjN4MkUnYHrtV/l+RU57wYyiDL3vAblghjs?=
 =?iso-8859-1?Q?PiyRNQO1HgCT0GhSDbDfy4ZAJGtGTQiplfB3Na3SX47K5gs0SDCxk1eEvU?=
 =?iso-8859-1?Q?+aY42YarkkUIk83Vy4/zXdG36EyRRfYcyNQMN0LiVTSuhYUEJ4LdLUaNky?=
 =?iso-8859-1?Q?PUFzSGs0fX8G2afRR4iZvERd5z9s3GMJ0qtcaVbq0nF/Dy3WFulgsZp/Nw?=
 =?iso-8859-1?Q?HN6Na5HeTcr8OlXKihk/dTfH89hlPzjClcvJ5SapVnJxAuJ5dFI+3Z3nPC?=
 =?iso-8859-1?Q?A1CocSMKSmdg5FoicQ3OP2NCiDxFDL4PMk1Wew6zYNnDB0zyv10NzlS7Jo?=
 =?iso-8859-1?Q?vqPdoin3z2fAuYBtGkelLXgnVPY4HBHLuHyHgYbOMfRx1VU3+1JwoelUgx?=
 =?iso-8859-1?Q?d+LTv94Mptz3pJOb2ogqTz1Xai5mRgtNG1mIM8NwNLkN2wJx9pCk5J6Zgd?=
 =?iso-8859-1?Q?smOkMGykPMBJ9zu36p3rU8JML9+DD7eu/B2ISoxHbJKcmLv6zCSNd2YSrs?=
 =?iso-8859-1?Q?3lH1SMCOV4D8TbymRiI4NaXnNIR+aPccwM6x/Sd8wcgcYk/PSdHJVq5ZJi?=
 =?iso-8859-1?Q?3WH8XttvNR8ipHaV9OK1T1i5f6zeTefu1JM3ZOmVMQ2jeO2N1zyF2V0dyM?=
 =?iso-8859-1?Q?d2+5sHZyoLweg9JIuX/awThatJEEmeiZoONBAkc/44i/7mBEMbkt4LuJwH?=
 =?iso-8859-1?Q?fGFiJ5oa4YOd9Lzrr4h+8u1umBGzdyp9Cd9G1PSXbPB01hvUAbnwC1YeBe?=
 =?iso-8859-1?Q?pbfrM/fYTAzEXB9QX5RJ2x1evDZ2H5n5XzyPQBoJGtH08wJpjo3RW01PAY?=
 =?iso-8859-1?Q?ZpiIW09cPm8wn9ka4seFjjh9HmXyLYufiDDovHTsxuodCsHgOkoEMKFbFn?=
 =?iso-8859-1?Q?jWOjUl3uGemRpOYwpdg23/Pe+70sd02pC9XC8bUvGHAKevRs+dIlOqVl0W?=
 =?iso-8859-1?Q?BUIZ8yJX2mnoqSvgnWJ/i8v+3sT/pnwWJXB5X4H+wcNK/QkBqnNaFShU1t?=
 =?iso-8859-1?Q?cnJcHDo+bKnb8VgbMFzBhGUFzJ4tAtqrldK1m37r2BCUl5zU5CTUw8UAVy?=
 =?iso-8859-1?Q?fcY2Za/SwAhKQphQPQmtKL3f1iCAfwiYrGQWRhpqE1EsADX8CVP5dZG5jo?=
 =?iso-8859-1?Q?lcCo1lNUIuZE+Nqh3/qodSdIye1cWFlxoXzBRP9e3xvprxiaHD43ehiw47?=
 =?iso-8859-1?Q?cEKTKqHimOgaU9cIOgkrIO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?WUjZkZenQNW9bxvjuYfqtSsSdpShtLFBXmYjL/lEL8maFOJvNk46tNVqE3?=
 =?iso-8859-1?Q?AV94/DF9EAvdf1T7CVqQwFp/uPJspHfZh/T42vB5AEA9GNIkUf0AzglaG4?=
 =?iso-8859-1?Q?0xQruD5Xny9HH9h6i6+b0o+2pNngqkOqeD7vqVt4VdoLNDb3VGX4SjIGNj?=
 =?iso-8859-1?Q?UebSRCLFhDGUBlrtrbZI2eJTDZasywDHf/fNkQY7jO/xU1N8NYMfMbUTOJ?=
 =?iso-8859-1?Q?4efp7YI2L0PVp3438lmz62s0bJHUUbuRKfp00KyKMkLae7HvZ0v6WUMLjc?=
 =?iso-8859-1?Q?I33SYZksSGxUnBb7qaih66jXr6kmpWaa/fM6hKN7C1eCSWzK0v3UEH5tRz?=
 =?iso-8859-1?Q?X03f+8WpZ0E+hu2kVBc4gsXFyiUnInlbs6Xjrmzmik5bC4uj/qo1z2QfbH?=
 =?iso-8859-1?Q?sYZQrEvPfL6LjQnbVJUix6bTeKW8l18Xr6EdtdzF2rDr0P7xu1g/a+PgSF?=
 =?iso-8859-1?Q?Zv06OvUgopLLDUV7dUmzldsLqTVBXs/JtKGWVGZAQn3NZy2n6PolGXJ6Ph?=
 =?iso-8859-1?Q?zeOHI+Pof6pwMrY80IrpZKZzrQtH/TgyHWzbPWQEz7NIiQvvajcLm0FfSG?=
 =?iso-8859-1?Q?JyDLFAgPrQQi9lgrdZoH21HkIt6PnB7LEJY2A2vgCHaQcuU6/jbfGE0U/N?=
 =?iso-8859-1?Q?IvQLeYQqwRmbBvcTKvoBgTcCw/IGv1qkBa58J0mqGd+mhT38vLvkh6YiDv?=
 =?iso-8859-1?Q?9YzCYf1/Me+x3LlQy2pINxRSd0apacmh6PpiINvEWg1utCeoXKYdUhtnIc?=
 =?iso-8859-1?Q?SbaHodTPmEANMyvLGnIlbeZqgnyzHsd4fqDAi6QlnJOde0sJDjvSnsHfuO?=
 =?iso-8859-1?Q?i/ae1BjUa0UfU1dP977AmeRbNkTpDQ7ivTMbSPczs1ZodX6gBQdLsuxxxU?=
 =?iso-8859-1?Q?zzqS5h7FEGwgfA5mVkNlTPwh9ZrfrXllKTXhYDzlRKYB/j+TG3DtkesUvv?=
 =?iso-8859-1?Q?rWOlxpRwqPygtHA6zbAkOF7M9ZwJT2+eF3vN3OOVVyaEWUvfUbZ9tPKYe9?=
 =?iso-8859-1?Q?bOCgNx412JrMur2p2aZgz/DX8AAcEoeeVRJkgNU0XQ4wSBphvqdXZ9GzbZ?=
 =?iso-8859-1?Q?SJYdgXMCyPmN3m/i4NhAsH5eAmqigsIz29r9JzkGhuY59i+4E3yMw7yCjw?=
 =?iso-8859-1?Q?wjiINgytsroE1PH0tcfIwZJ/1AbP50CE5xcOZC7eNv4YMStC/mE+YLzPnX?=
 =?iso-8859-1?Q?OHII6+sLF3JxbMbEoEb1qRe2Rb9i/BDU0zX0V6YolDYrnfAr9IKtvhiTZi?=
 =?iso-8859-1?Q?so1bW2SANPaTnUVWt2MBTKLBxhP4GyW8VTjqJuvE10jah3jvUjQoDC/7ai?=
 =?iso-8859-1?Q?3DVsedOv0i22TTVsq2MAZ58O4i0JeO27Mdi+S0mfvBPGbDtYS41CUAlAAr?=
 =?iso-8859-1?Q?0gb5DQhLE9oCjbGtbS3JpyhiGN8g1nqYBf6Zq6mRCDzfLE6Oyyg2ej8D7Z?=
 =?iso-8859-1?Q?BnD31VPuXBGf/W2D2QJyAhMtvSR3NPykPs3EXFZLXcvTmtIKKuYNQKcUut?=
 =?iso-8859-1?Q?Y7joZZVwYYYBfEY8V+TetCD3+W1CoisThqDiQ7nNAXvyEFaDc/lsOqgZgt?=
 =?iso-8859-1?Q?dNJ1FlNX/NipohA3btU9z3hyU+hKbet9MZhEMTuCv4vHpygtXgPP4bqvWA?=
 =?iso-8859-1?Q?omUDdaSLq1CoKjv6YEkuUR+rexNweXIP7FGzf02RjroRO+3PXM7f15IQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lanlzCP0dUmMvsz5Iyeg5BCHmbY11+85WEGIaFPsPizphh+JMR1hVUrcOBCKmYsd8x5ERS389zTrg47/wc3SNgBnhT4crJ7usf69pDrWcEu21Ryb4QFdFT11Ig0qs0HsEokkxbaoI5CxwEZ/nT3IutA9+m6hBubITY4dfTdohd6fnK9He3w0kym9xrXD9GY5YeTaSdOV4TQp3+TLOYaSFQ9AgdqyfGZcRLpqBecEeMBlEiwETu5dnNkG7KvdPsr11z11oIqs8qQndSVa58PGPGPL+WZLKFX9g6BFU7Hzr2bCP93onOGo4DtwTjnaCZcSdPjykywPwRZ8kTwniDt2JHFCkStTFl5/huDYWH5qbLwOgIFFWqG2c6kd1Dc+tZblATyQyhPmJRVyTLz3EAtcAyNwsWQ3N8WLzKy2mmaKbgC48659fgOXlpsa7XTRjOD2N7AvgM1INq9TNT/he5u+jnxc/3ZubnKU4XkIpy/gaRI6WjyCmjXajer8FCixiYlR4IQdMRs5YcJX1KEVIP66YiFqhGHoqDT+9sPZmNiSQVw2u8AOXonI8vW80FM5ChD3RsUhhYhu739x6MD+3lwTbkZsK+VJhsInHMF6uaYOS4U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd4df7a9-f41b-4bd8-b440-08de2181c6a5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 00:24:00.1986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rPTPaJvyvuMB6IzhQUkZVSIvqLZpX0vYifgsnMEngebzoiI39kn6svHKmZBYudQDTOvREt97keNGQNyq/20EPvH1BYnfJkPr5kC4sCF4ebU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5831
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_05,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 spamscore=0
 phishscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511120001
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDE1OSBTYWx0ZWRfX/S7G/ILMf20+
 7yXn73p+qCwupmvL+K+BMKANCpEz8aCjVA/9U7tC48FPi+mCwZ1tSlkM1f4AKc5KdHrOjPi1FeQ
 eh9n1e1/oACLhkgjrUa/BQ+EUnHNxyt/mkYNEqVVlAsePB7kz5kp0a4qJVOC2C5eW13IWkvcpMt
 MwYK7dO7VT254tKGSug0/V1pGqHl6msJSSJGl/ecPjTZL9/xbvQJgg8hZtvENCTW2okGJgk8vJh
 u1uAcauovoWOJPYOK/OgRRzU6H+PiycsIesPv1PhBEWcjOiBW9qHNF5dsj5o8sFje3P56+TigM3
 Yo06fP6KT9PAo23tgfqOfmSgjldA8WunzF6TEpW7cg99uqeGKJWKB3bwn9ieADltQ90Pb3jXvqJ
 S3bEJACRPR6AVx011lU1vgoCS/YgUUG3+adsCngPdeT8ou2L424=
X-Authority-Analysis: v=2.4 cv=P4s3RyAu c=1 sm=1 tr=0 ts=6913d3a3 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=-L-Z6A5Fh6LUijjRoygA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf
 awl=host:12099
X-Proofpoint-ORIG-GUID: gMUHo4ny1V8ssZjEeakhQ8Qmx5ivGGyC
X-Proofpoint-GUID: gMUHo4ny1V8ssZjEeakhQ8Qmx5ivGGyC

On Tue, Nov 11, 2025 at 06:19:26PM -0500, Eugene Loh wrote:
> First, I had been under the impression there might be some test suite
> changes.  New tests?  Something like that?

I am working on that but wanted to get the code out for review in the meantime.
I am adding a few unit tests for USDT post-start discovery because the only
etsts that currently exist are rather complex and can fail for various reasons,
which means that we do not have any that test the very basics of the machinery
(the pre-existing mechinery as well).

Although, even without adding tests, this patch could be reviewed and be given
R-b simply because we do have proper tests for discovered USDT probes already,
and the fact that they pass is a valid test for this functionality.

But I hope to be able to add a few tests in the v2 so that the unit tests make
it into the testsuite, anyway.  That may come in handy for future detection of
regressions in the fundamental logic of the discovery mechanism.

> On 11/10/25 10:27, Kris Van Hees via DTrace-devel wrote:
> > The mechanism to create uprobes by writing to $TRACEFS/uprobe_events
> > caused probes to be placed in the dev/inode based mapping.  This means
> > that all tasks that use that mapping are be subject to the probes
> 
> s/be//?

Thanks.

> > firing.
> > 
> > The kernel supports placing uprobes for a specific task (by PID), which
> > avoids impacting all other tasks that share the same code but are not
> > the target of the tracing.
> > 
> > This new mechanism places uprobes using the perf_event_open interface.
> > Perf event attribute configuration data is read from
> > /sys/bus/event_source/devices/uprobe/ as needed (and cached to ease
> > repeated use).  Underlying probes are now organized by PID-specific
> > providers (uprobe$PID), and attach/detach no longer depends on the
> > generic tracepoint support.
> > 
> > The usdt_prids BPF map is no longer needed because USDT BPF programs
> > are now task-specific.  The trampoline generation for USDT Probes
> > discovered after tracing started can now perform a simple loop over
> > all compiled clauses, adding those that match the probe description
> > to the program.
> 
> Should we remove:
>         libdtrace/dt_dlibs.c:   DT_BPF_SYMBOL(usdt_prids, DT_IDENT_PTR),

Yes, thanks.

> > diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> > @@ -974,19 +974,12 @@ gmap_create_probes(dtrace_hdl_t *dtp)
> >   }
> >   /*
> > - * Create the 'usdt_names' and 'usdt_prids' BPF maps.
> > + * Create the 'usdt_names' BPF maps.
> 
> s/maps/map/

Thanks.

> >    *
> >    * 'usdt_names':  a global hash map indexed by PRID and whose value has probe
> >    *                name elements at fixed offsets within the value.  This map
> >    *                is used for get_bvar() to look up probe name elements for
> >    *                any prid that was created after dtrace_go().
> > - *
> > - * 'usdt_prids':  a global hash map indexed by (pid, underlying probe ID).
> > - *                The value is a probe ID for the overlying USDT probe and
> > - *                a bit mask indicating which clauses to execute for this pid.
> > - *
> > - *                For a given (pid, PRID) key, there can be at most one
> > - *                overlying USDT probe.
> >    */
> >   static int
> >   gmap_create_usdt(dtrace_hdl_t *dtp)
> > diff --git a/libdtrace/dt_program.c b/libdtrace/dt_program.c
> > @@ -20,21 +20,6 @@
> >   #include <dt_probe.h>
> >   #include <dt_bpf.h>
> > -int
> > -dt_stmt_clsflag_set(dtrace_stmtdesc_t *stp, int flags) {
> > -	stp->dtsd_clauseflags |= flags;
> > -
> > -	return 0;
> > -}
> > -
> > -int
> > -dt_stmt_clsflag_test(dtrace_stmtdesc_t *stp, int flags) {
> > -	if (stp->dtsd_clauseflags & flags)
> > -		return 1;
> > -
> > -	return 0;
> > -}
> > -
> 
> Okay, but then in dt_program.h get rid of
> dt_program.h:extern int dt_stmt_clsflag_set(dtrace_stmtdesc_t *stp, int
> flags);
> dt_program.h:extern int dt_stmt_clsflag_test(dtrace_stmtdesc_t *stp, int
> flags);

Correct - thanks.

> >   dtrace_prog_t *
> >   dt_program_create(dtrace_hdl_t *dtp)
> >   {
> > diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> > @@ -316,11 +319,71 @@ dt_provimpl_t	dt_pid;
> >   static int populate(dtrace_hdl_t *dtp)
> >   {
> > +	uprobe_data_t	*udp = dt_alloc(dtp, sizeof(uprobe_data_t));
> > +
> > +	udp->perf_type = -1;			/* not initialized */
> > +	udp->ret_flag = -1;			/* not initialized */
> > +	udp->ref_shift = -1;			/* not initialized */
> > +
> >   	if (dt_provider_create(dtp, dt_uprobe.name, &dt_uprobe, &pattr,
> > -			       NULL) == NULL ||
> > -	    dt_provider_create(dtp, dt_pid.name, &dt_pid, &pattr,
> > +			       udp) == NULL)
> > +		return -1;
> > +
> > +	if (dt_provider_create(dtp, dt_pid.name, &dt_pid, &pattr,
> >   			       NULL) == NULL ||
> >   	    dt_provider_create(dtp, dt_stapsdt.name, &dt_stapsdt, &pattr,
> >   			       NULL) == NULL)
> 
> Why is create(dt_uprobe) being split off the other two create()s? This makes
> both the delta and the resulting code (a tiny bit) more complex.

I want to highlight the difference that the first one creates a provider with
provider-specific private date.

> > @@ -401,182 +474,57 @@ static void probe_disable(dtrace_hdl_t *dtp, dt_probe_t *prp)
> > -/*
> > - * Judge whether clause "n" could ever be called as a USDT probe
> > - * for this underlying probe.  We can pass uprp==NULL to see if
> > - * the clause can be excluded for every probe.
> > - */
> >   static int
> > -ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
> > +clean_usdt_probes(dtrace_hdl_t *dtp)
> >   {
> > -	dtrace_stmtdesc_t	*stp = dtp->dt_stmts[n];
> > -	dtrace_probedesc_t	*pdp = &stp->dtsd_ecbdesc->dted_probe;
> > +	int		fdnames = dtp->dt_usdt_namesmap_fd;
> > +	uint32_t	key, nxt;
> > +	del_list_t	dlist = { 0, };
> > +	del_list_t	*del, *ndel;
> > +	dt_probe_t	*prp;
> > -	if (stp == NULL)
> > -		return 1;
> > +	/* Initialize key to a probe id that cannot be found. */
> > +	key = DTRACE_IDNONE;
> > -	/*
> > -	 * Some clauses could never be called for a USDT probe,
> > -	 * regardless of the underlying probe uprp.  Cache this
> > -	 * status in the clause flags for dt_stmts[n].
> > -	 */
> > -	if (dt_stmt_clsflag_test(stp, DT_CLSFLAG_USDT_INCLUDE | DT_CLSFLAG_USDT_EXCLUDE) == 0) {
> > -		size_t	len = strlen(pdp->prv);
> > +	/* Loop over usdt_names entries. */
> > +	while (dt_bpf_map_next_key(fdnames, &key, &nxt) == 0) {
> > +		dtrace_probedesc_t	pd = { 0, };
> > -		/*
> > -		 * If the last char in the provider description is
> > -		 * neither '*' nor a digit, it cannot be a USDT probe.
> > -		 */
> > -		if (len > 1) {
> > -			char	lastchar = (pdp->prv[0] != '\0' ? pdp->prv[len - 1] : '*');
> > -
> > -			if (lastchar != '*' && !isdigit(lastchar)) {
> > -				dt_stmt_clsflag_set(stp, DT_CLSFLAG_USDT_EXCLUDE);
> > -				return 1;
> > -			}
> > -		}
> > +		key = nxt;
> > +		pd.id = key;
> >   		/*
> > -		 * If the provider description is "pid[0-9]*", it
> > -		 * is a pid probe, not USDT.
> > +		 * If the probe exists (as it should), and the process exists,
> > +		 * we should keep it.
> >   		 */
> > -		if (strncmp(pdp->prv, "pid", 3) == 0) {
> > -			int i, l = strlen(pdp->prv);
> > -
> > -			for (i = 3; i < l; i++)
> > -				if (!isdigit((pdp->prv[i])))
> > -					break;
> > +		prp = dt_probe_lookup(dtp, &pd);
> > +		if (prp != NULL) {
> > +			list_probe_t		*pup = prp->prv_data;
> > +			dt_uprobe_t		*upp = pup->probe->prv_data;
> > -			if (i == l) {
> > -				dt_stmt_clsflag_set(stp, DT_CLSFLAG_USDT_EXCLUDE);
> > -				return 1;
> > -			}
> > +			if (Pexists(upp->pid))
> > +				continue;
> >   		}
> > -		/* Otherwise, it is possibly a USDT probe. */
> > -		dt_stmt_clsflag_set(stp, DT_CLSFLAG_USDT_INCLUDE);
> > +		/* Add the key and probe to the delete list. */
> > +		del = dt_zalloc(dtp, sizeof(del_list_t));
> > +		del->probe = prp;
> > +		dt_list_append((dt_list_t *)&dlist, del);
> >   	}
> > -	if (dt_stmt_clsflag_test(stp, DT_CLSFLAG_USDT_EXCLUDE) == 1)
> > -		return 1;
> > -	if (uprp == NULL)
> > -		return 0;
> > -	/*
> > -	 * If we cannot ignore this statement, try to use uprp.
> > -	 */
> > -
> > -	/* We know what function we're in.  It must match the probe description (unless "-"). */
> > -	if (strcmp(pdp->fun, "-") != 0) {
> > -		dt_uprobe_t	*upp = uprp->prv_data;
> > +	/* Really delete entries from usdt_names. */
> > +	for (del = dt_list_next(&dlist); del != NULL; del = ndel) {
> > +		ndel = dt_list_next(del);
> > +		prp = del->probe;
> > -		assert(upp->func);  // never a return probe
> > -		if (!dt_gmatch(upp->func, pdp->fun))
> > -			return 1;
> > +		dt_bpf_map_delete(fdnames, &prp->desc->id);
> > +		probe_disable(dtp, prp);
> > +		free(del);
> 
> Okay.  Just out of curiosity, under what conditions does one use dt_free()?

Thanks - this is indeed a case where it should be used.

In all, we should probably discontinue the use of dt_* alloc/free functions
soon, because the rationale behind them was carried over from Solaris days,
and we are way past that (and I do not believe there is any use for it).

But for consistency, I will change this to dt_free(dtp, del); because that is
actually what should be used when the allocation was with a dt_*() function.

> >   	}
> >   	return 0;
> > @@ -1508,95 +1400,73 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> >   	/*
> >   	 * USDT.
> >   	 */
> > -	/* In some cases, we know there are no USDT probes. */  // FIXME: add more checks
> > -	if (upp->flags & PP_IS_RETURN)
> > -		goto out;
> > -
> > +	/*
> > +	 * First check whether the USDT probe is active, i.e. its probe ID is
> > +	 * in the usdt_names BPF map.  If not, ignore it for now.
> > +	 */
> > +	emit(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), usdtp->desc->id));
> > +	dt_cg_xsetx(dlp, usdt_names, DT_LBL_NONE, BPF_REG_1, usdt_names->di_id);
> > +	emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
> > +	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
> > +	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
> > +	emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, pcb->pcb_exitlbl));
> > +
> > +	/* Set up probe arguments. */
> >   	if (upp->sargc)
> >   		copy_args(pcb, upp);
> >   	else
> >   		dt_cg_tramp_copy_args_from_regs(pcb, 0);
> > -	/*
> > -	 * Retrieve the PID of the process that caused the probe to fire.
> > -	 */
> > -	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
> > -	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
> > -
> > -	/*
> > -	 * Look up in the BPF 'usdt_prids' map.  The key should fit into
> > -	 * trampoline stack slot 0.
> > -	 */
> > -	assert(sizeof(usdt_prids_map_key_t) <= DT_STK_SLOT_SZ);
> > -	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), BPF_REG_0));
> > -	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0) + (int)sizeof(pid_t), uprp->desc->id));
> > -	dt_cg_xsetx(dlp, usdt_prids, DT_LBL_NONE, BPF_REG_1, usdt_prids->di_id);
> > -	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
> > -	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
> > -	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
> > -	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, lbl_exit));
> > -
> >   	if (upp->flags & PP_IS_ENABLED) {
> >   		/*
> > -		 * Generate a BPF trampoline for an is-enabled probe.  The is-enabled probe
> > -		 * prototype looks like:
> > +		 * Generate a BPF trampoline for an is-enabled probe.  The
> > +		 * is-enabled probe * prototype looks like:
> 
> s/* prototype/prototype/

Thanks.

> >   		 *
> >   		 *	int is_enabled(int *arg)
> >   		 *
> > -		 * The trampoline writes 1 into the location pointed to by the passed-in arg.
> > +		 * The trampoline writes 1 into the location pointed to by the
> > +		 * passed-in arg.
> >   		 */
> >   		emit(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), 1));
> >   		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_7, DMST_ARG(0)));
