Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B44149006
	for <dtrace@lists.linux.dev>; Tue,  4 Jun 2024 18:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717524719; cv=fail; b=ePh1lG+4jMFFupFJKKz1nLFBeXfAMOSeVlkvqHyJRumAHWLivoWZ0tXJtWMIA/e8pS8X5rQOmBclKR1FDVKSJbyQQULWSOKY0/hGI2Ek5xPIQwRX1sCJLNVuWICWkf4929hSUFbn5ch7pcgfKWiU1f7+YBXF6oIsya8km5rMaU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717524719; c=relaxed/simple;
	bh=xNa0TzcSHiG9Kx7JziCoXl+78Lh3Xkr0NacT91HbIDQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rjwk/gEp62rVcXUfMTqsYFwiNvil1G0cc/fr6IxV7hgxmq92IkDEnXcqTplFxySW1EW6CV/lD5zLVWNm8s3typJE2WtbjeCYeMOjO+lyo9Lax4udYCt4ZUXSHzf2VEX2Qwekjn2M2ByMiB9kDfIHGrO8MaBDWZsskGRGEE6hh8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454Bmsh1005884
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:11:57 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-type:date:from:in-reply-to:message-id:mime-version:r?=
 =?UTF-8?Q?eferences:subject:to;_s=3Dcorp-2023-11-20;_bh=3DFWr3QgeCkFN3/Ap?=
 =?UTF-8?Q?93guyUgaZ9HJxDxcMDO0FL5NwPS0=3D;_b=3DFCBI7vB7AMc1mcGexp4dtALPVn?=
 =?UTF-8?Q?1axgKw1rApfjw1O7RbIQZlLtLj3tRM/G+m+E4idcfK_Gx6yocz6pMJNPMVsOYgy?=
 =?UTF-8?Q?uibCuJe7N4vb3Ae3LwzQfgsw39ncKeg4SQKhhNap//22WOY3_EXshTcbfDFxg/v?=
 =?UTF-8?Q?GEIVCtzDnvXuwZQ+tsS6ljM8G4MFiKOfGjfcAAW7/k1XDFH7j/MzAx_5msyc9mD?=
 =?UTF-8?Q?C/PG7ksoNNhgN5NTMnsM7vTTShEfzH202zLKVUqMyrrJLgBm2qXiRLRZ9qtH_YS?=
 =?UTF-8?Q?y9PFYwujJrmLHalV7T4ES8ziHe3RLTOnaf6ji1FPkeMCVOdq/JyERhBl7HbqdJ3?=
 =?UTF-8?Q?YEG_GQ=3D=3D_?=
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yfuvvwk16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:11:56 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 454HgWrR015646
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:11:55 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrjcpnu3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:11:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KgJOoaJSCt+ax76WIozWjnfqOMhehJvLXRZntHMTkcPYBskpNOhjsyPm8/3pJlUe2kg1pe9cfedqK5U0HQFUdd3kAnUUXA9WVo31kYjYdTv3vl9OOKga7SHUt5D46hcaGA+5DO2KtrWUKulAxlQdskmHqsHDoEV61Xpq/oYRPWoKHiG5u5txl4wdpTZ1hHNpbGYyb6iDYw7kfwMeRPXcbogzCLbBSe/nq5T0jYw3TbY7PUWvBrtIb/Az648Xw9RdJuSTRbMFBnSIxxZekYxMOHwXio9d5o5DPQYvIJX7x7Z8NSlV5dd6/omuq6XwhyWhhbg2PhvZoJXMgQ5TE/O9og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWr3QgeCkFN3/Ap93guyUgaZ9HJxDxcMDO0FL5NwPS0=;
 b=nvSLoBYN2mqxMf9YPUxA6iIey4rcWT3ZuhiZqLrXdouNwAOig3EF7pEq+OWUZvHTNNnMTMmIj+GZf4Xc1yfcQoq5vXoITE1d2U3IkQQMMOzFLueP0f6B9IPV7Ajb+035tBJfsRzqwDzKVRINg7smz8Ewdu0y9vBEyJOUV/a5xrxzNmYyaGWLauETc6E1nyV3igx1TJziOYA2RB7YGsP1/HRRI+273TskyJaR7jnpEGceU+Fb8qvMzy4GOjSDgc7Kbc3OrfWGtWcgP+Xml331BSIndS4x2lAHWgiUwtKTjFBf+7Nq0ewRjsp1VsiA/GWuugziCvMOedeRD2N4No4fBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWr3QgeCkFN3/Ap93guyUgaZ9HJxDxcMDO0FL5NwPS0=;
 b=arH0RYhlP5V93CVEUsAbzipSVutHLWA6zexVgKR50Ty6kIIp1mbwpDu/ZYTQKRONc2UjyDJvYIzWTrMCTBhT0hNeLUACccco0GZnjhBoZpbQjWNUZvJEpX/q6uwT3zzSqvNFstaKn+g0TJ4cWZZ2imYyQtgJALmnTKx2VXflTjg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB5197.namprd10.prod.outlook.com (2603:10b6:5:3ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Tue, 4 Jun
 2024 18:11:50 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 18:11:50 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 07/14] Create the BPF uprobes map
Date: Tue,  4 Jun 2024 14:11:06 -0400
Message-Id: <20240604181113.11505-8-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240604181113.11505-1-eugene.loh@oracle.com>
References: <20240604181113.11505-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::25) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB5197:EE_
X-MS-Office365-Filtering-Correlation-Id: 2228b828-892c-4514-e641-08dc84c1cdf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ntl532zdH+cQc5HtGLeaGeop/DMd5VadtVZZ7orcJ2G2eaiK1FgZoBbgpooQ?=
 =?us-ascii?Q?z1dXfNjZACuYX7BLgONjSwZHs1Lsre2oWOeOlOT1drgTcxTxHWTVAMZZKnJ0?=
 =?us-ascii?Q?yip1bmZYIYTu9XiG8uwNwX0u96diG+9tknh8ja+qgxP+pSr9o6+KqGWhOpUZ?=
 =?us-ascii?Q?NP1A4zZ16fIUFu6VgUlfpbIqRl31gz0KadWAsb2QYFODa3sVXY/G2VmzLR0q?=
 =?us-ascii?Q?An4Y2+IZbWfU5a718N4/1ngskt/0ZIGeYbcCpryvRkKGFyvtRFVDAwYhK9A0?=
 =?us-ascii?Q?1MkIux2GWEKg2HTiraXL7r+e4Ftb3BkAy8rDe2dXf+f5JS6KaHgBH4NxXcv9?=
 =?us-ascii?Q?8IDWI3lwukV//rb8/Bc51wQMAqyqcyaXd2r/GE53+mM16Abhc1qS7MF5fwZY?=
 =?us-ascii?Q?N1wCnQgmCdJGTPXLGbZWW9x9TjTbrpF0DA3+fd2+xkUkMqtLXGpkPbyDfgBA?=
 =?us-ascii?Q?nf32eyGnAvhV49cT/jcwf5uclCxDf6kdxx++KX2aUMuqmV4l27OwQnUsOnDS?=
 =?us-ascii?Q?FqJsJMXpbUfrliKS/FwGKScekwxOLf+dwdPWh6PWQtwVvjFjiFCQD0b0blR7?=
 =?us-ascii?Q?96kHiUMvrqAsR5kgj13TaZyCp4BxHIlh5O9E+ig2pstoi7lCyjMsAiAIuTHd?=
 =?us-ascii?Q?YvecV0QEsVtffuNTsrsd+C3UWXGHjSqpKgp+SwncHCWYDlcrYO1zmlPU8AHP?=
 =?us-ascii?Q?2Xxp/2tMZONOB21NruinPVEjgyaysLMYz5HFCEgnjS0KvlDciNOf5KHJSGyK?=
 =?us-ascii?Q?HJK+0R0uTc4400fNOJws560KXH3WPb3BFr/ewL4JBAVGmz8aQ3OuEhDW7ad0?=
 =?us-ascii?Q?bbjpj/p9SSb7CDpvFRYwf5MxVHAZtyLdTLSCN9RaW4Su7GQ/6P3h5iSbfuzU?=
 =?us-ascii?Q?AF1Jon+kXTCVaxCVeymNhzuxc+IfXDodL0TvqeNGNSmADDW2xJHsVAqGD1wa?=
 =?us-ascii?Q?zNY0KgnHL1dEPPfCTMFyWoxBRcRxe5wS7P4V5VtlOxz6gs4LDObihNj30agl?=
 =?us-ascii?Q?KRZ7L53yM+hsZrygSjJiPQ84C/DH7sB+Wbea25IlK1jMPsp/WdhTMjG8d43P?=
 =?us-ascii?Q?IgnWjzlT7Dw+eFlJ4XZ9p7fOqEo4LAobfVh0t4yusaxwXj5bIz0SVh0jNuhc?=
 =?us-ascii?Q?/dGgSoER9vWCrzt1SB6oR30qyPIFztDHq2soDStmG7oBDTM6ECXsI0MGSniD?=
 =?us-ascii?Q?EZEaeCVlhlRFmwt2EQsQyBiIZ8ExLyq/8X9al7HQuUW8+8aDnf279mx1X5nj?=
 =?us-ascii?Q?9jwU+/6e1GE92so+/Es+8lu4P1os+HgfRoPl0JMYyw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+Q7AnBM4CE/PfnxcuT5jI/M9OuXyly+I0o28xPQLjdBlY8/BNO9UWukyJIjO?=
 =?us-ascii?Q?aLjVosvvL094ZHHmTJeVDPE6NGreMh/owe5ANMO8IACIWFJ+Jbz1/oF/XY5R?=
 =?us-ascii?Q?T+JaQAezLQEhnatXIRQNel750X3cTcvszauYJ9n+Za2umQ0eX7ouvOmZPP8K?=
 =?us-ascii?Q?vZIffFJBDPmAJhIKQfdWEQnijdwbf7yyzDEevR/IRDM6kXIfHy3t1N+ESgAQ?=
 =?us-ascii?Q?OgBPs9ymTe9/4xq78wB9SFBVO2pPBbGyZ1xxfAvVS3T/saflylT9VqMQ2vlo?=
 =?us-ascii?Q?hb3aNR+GoF2WnE2/mk2fDF5veIaR2vTaR/HllBDK3yU594Fxg0zkmu1ZFlHF?=
 =?us-ascii?Q?Dz89MYj78nK67t0vNwEJ/uLCr4QihmGRwlWlbnG9up5KFEEXukCiyX9r9E7k?=
 =?us-ascii?Q?lASRhW7chvmjYVzVK38QBi3GcNpNh19qnmByrMA/3TPJtzm1BcfIcPeLMzBx?=
 =?us-ascii?Q?wKkypbXKaH96WQoyW2RKkhfwZqaIHFpLF10XDv5z5v/WbRcRSNElnOk4LECB?=
 =?us-ascii?Q?mvjwTTo8BHhHemwX6fmRpBf9c8jzY+mlJzOZEnL9WEfa11a2lCWnRCU7ERqG?=
 =?us-ascii?Q?s64aHaxbNzFrVCSb6X6EwvF7ctRdjyAX45zzz5ivkKZAo3qFmFHfWRqW1EFP?=
 =?us-ascii?Q?BEivPVCix/W0w5nqlVLSBGvmtRl1jp84vgf3fLeuNTp6NRqrSmOCAArypieY?=
 =?us-ascii?Q?Rkw+wDx5/s8s1XcoAO4+K/peBHz6QluX4JS8zz5TCyM6+PgWBh/4J2nfT8Ug?=
 =?us-ascii?Q?55uza9PYbW+K+niLJYlBttasDtDQU3SORtv1bgXDHl2pGHbNafBMOfnRxG6n?=
 =?us-ascii?Q?ut1skdk6BxMVFGZvw7hRE578bJvJOI/Ge4XlrBZqmbmceyWLw+SNOG9owPkX?=
 =?us-ascii?Q?RMnHkx2iFdtKVhR1yUM5X8Wxk9prSXv6AeHtHqOP4OelZN8esaOCSz/zYBQZ?=
 =?us-ascii?Q?URxwn8q2Jyq87TV4Ux2V/mCtpBWxXjC112t229SSuMV4e+3yCBGIyHOVj0kx?=
 =?us-ascii?Q?wKfodEeA+lAopFMjzhAnqPzwCjHyRnMIwgTO+GlI9/0XvQOdzZh4rXg6LCtS?=
 =?us-ascii?Q?TVwgL268bn21SKGQrj2G9wv9TPgmmdFvsx+JjTB1DnfolqErtm8jFew8xpNh?=
 =?us-ascii?Q?fBB/oOZEIJnMvHsusGUWpHqFKPUUN7Cz7cnVxc8nQsSOBfSKm4j7R5Xu+W7H?=
 =?us-ascii?Q?jkTeDbUTGvsYmWNesHUbEUr4TrVaH/L4d0OeHHLCbT9j3w7iVZr34yTDPf2H?=
 =?us-ascii?Q?gkoAcfXKs4XqpC7AnS2xexljxA9STcCyNkbXa6Y0LC+wNC4puDvxw8wUJymU?=
 =?us-ascii?Q?LWQ7GG/PsmaYKpl4ehrjVKFqEl/xf1Op8eYSCVBmGdc2b4j0NI6u4Teh4HNm?=
 =?us-ascii?Q?mOvudFd3AtG/Aw6uqqUWvY4yTP7Pmx1uHtCGBf5NretTQv16O1+o7yow+9x2?=
 =?us-ascii?Q?bvFfGNEsgxZvTqgiZHgpoXhtoA+/KwKdTqMEt3/pm4joEra5mJKF1YXS+xHS?=
 =?us-ascii?Q?Ty8rNxuy4uTL5ectw1MxNPTw9n/6RRHSLljVrBqo332/VQNpedWK0MjaBUXj?=
 =?us-ascii?Q?7X7P5LZwP/jQD8t807UnGnE8kKwMiRyUcYjj8C5v?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	7tb6jDwFGjnLu+deU4+pKZaVBN6uuTHFs2eyGHMHjQuWJQqKB6v1roJ/iCNiqyh/f01RWQyWXuhkcatmuzmg+FCaWLnzYDTPGtg+545eWDjB/aBK9FK94JGhL2Zg+mR/6vswMDKYnSTVgUCr/hA7fXaq1nRLoRaxa816GPOtp5TXK9gBhIKgWca0WoRnxZEpV/rBnD4c4bzX3Fa9cv8IYvQ9KddVb68NFATmjSRuM7R979mYF3Ci8mVuPqqNCxPHj6ybgljCogRWU3/v8Bpcyu3x6UhCB9zwJfmxJ8UDzLWayX5psVskXUCAuWI5Tm+IVXuBb0oaQAaur4mlWYTz5+73Cv74SjAKP64kEghWMX6ZjKvSvznZuAg/WirhyFRUBOxC1EdSfB49gukGQkJPk2zZmKu0oMQb37TeUpybFb9PKJArvSDVb32vp3lnM4LiKUnxbH4GxFU9zRfHmkPMTu0xPa3Em5YhNwrZicQYJKTMZKY12jsZdMSqttz7oSVtEf7uvbvOB1YAD/1R3aP/1pE3sBPKkgQ5bWAHFb1rc8SrZ8nvuvgyT24ZtB9j3sRpSEH06biMIHdXZuhHEJRO4eC3ZwekCCsCpyHpPvJkjAg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2228b828-892c-4514-e641-08dc84c1cdf2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 18:11:49.9385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KwPKclRaPfCra02bgbLI/AJTGM2FeHCz19N4q1Y9Nfb/G00kdZpDXOn0qqqQqdbV6iRyPWqk4ZRpM9kodi9bow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5197
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406040146
X-Proofpoint-GUID: 4D75zjb5DHhhLS0_jbHoXFD3cd9UqshL
X-Proofpoint-ORIG-GUID: 4D75zjb5DHhhLS0_jbHoXFD3cd9UqshL

From: Eugene Loh <eugene.loh@oracle.com>

WIP, sizing is hardwired for now.
WIP, should add new pids and purge old ones (after the initial call).

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_bpf.c         | 48 +++++++++++++++++++++++++++++++
 libdtrace/dt_dlibs.c       |  1 +
 libdtrace/dt_impl.h        |  1 +
 libdtrace/dt_prov_uprobe.c | 59 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 109 insertions(+)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 71c6a446..3aeae274 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -946,6 +946,53 @@ gmap_create_probes(dtrace_hdl_t *dtp)
 	return 0;
 }
 
+/* also defined in dt_prov_uprobe.c */
+typedef struct uprobe_map_key {
+	pid_t		pid;
+	dtrace_id_t	uprid;
+} uprobe_map_key_t;
+typedef struct uprobe_map_val {
+	dtrace_id_t	prid;
+	long long	mask;
+} uprobe_map_val_t;
+
+/*
+ * Create the 'uprobes' BPF map.
+ *
+ * Uprobe information map.  This is a global hash map for use
+ * with USDT and pid probes).  It is indexed by (pid, probe ID),
+ * using the probe ID of the underlying probe.  The value is a
+ * probe ID for the overlying probe and a bit mask indicating
+ * which clauses to execute for this pid.
+ *
+ * WIP.  Just make up some sizes for now.
+ *
+ *     How big is a probe ID?  Sometimes, it's a dtrace_id_t.
+ *     And uts/common/sys/dtrace_types.h gives us "typedef uint32_t dtrace_id_t".
+ *     Meanwhile, libdtrace/dt_impl.h has "uint32_t dt_probe_id".
+ *     So either uint32_t or dtrace_id_t is fine.
+ *
+ *     How big should our bit mask be?  Start with 8*sizeof(long long) bits.
+ *
+ *     How many entries should we allow?  Start with 1000.
+ *
+ * FIXME:  is there any way two different overlying probes (differing by more
+ * than just pid) could map to the same underlying probe?
+ */
+static int
+gmap_create_uprobes(dtrace_hdl_t *dtp)
+{
+	dtp->dt_uprobesmap_fd = create_gmap(dtp, "uprobes", BPF_MAP_TYPE_HASH,
+			 sizeof(uprobe_map_key_t), sizeof(uprobe_map_val_t), 1000);
+	if (dtp->dt_uprobesmap_fd == -1)
+		return -1;
+
+	/* Populate the newly created map. */
+	dt_uprobe.update(dtp, NULL);
+
+	return 0;
+}
+
 /*
  * Create the 'gvars' BPF map.
  *
@@ -1051,6 +1098,7 @@ dt_bpf_gmap_create(dtrace_hdl_t *dtp)
 	CREATE_MAP(scratchmem)
 	CREATE_MAP(strtab)
 	CREATE_MAP(probes)
+	CREATE_MAP(uprobes)
 	CREATE_MAP(gvars)
 	CREATE_MAP(lvars)
 	CREATE_MAP(dvars)
diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
index bc883e11..7bbeb02c 100644
--- a/libdtrace/dt_dlibs.c
+++ b/libdtrace/dt_dlibs.c
@@ -66,6 +66,7 @@ static const dt_ident_t		dt_bpf_symbols[] = {
 	DT_BPF_SYMBOL(lvars, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(mem, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(probes, DT_IDENT_PTR),
+	DT_BPF_SYMBOL(uprobes, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(scratchmem, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(specs, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(state, DT_IDENT_PTR),
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 1bf79d80..935b96f4 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -438,6 +438,7 @@ struct dtrace_hdl {
 	int dt_aggmap_fd;	/* file descriptor for the 'aggs' BPF map */
 	int dt_genmap_fd;	/* file descriptor for the 'agggen' BPF map */
 	int dt_cpumap_fd;	/* file descriptor for the 'cpuinfo' BPF map */
+	int dt_uprobesmap_fd;	/* file descriptor for the 'uprobes' BPF map */
 	dtrace_handle_err_f *dt_errhdlr; /* error handler, if any */
 	void *dt_errarg;	/* error handler argument */
 	dtrace_handle_drop_f *dt_drophdlr; /* drop handler, if any */
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 34906aa0..591f2fab 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -45,6 +45,7 @@
 #include "dt_probe.h"
 #include "dt_pid.h"
 #include "dt_string.h"
+#include "port.h"
 
 /* Provider name for the underlying probes. */
 static const char	prvname[] = "uprobe";
@@ -70,6 +71,15 @@ typedef struct list_probe {
 	dt_probe_t	*probe;
 } list_probe_t;
 
+/* uprobe_map_[key|val]_t are also defined in dt_bpf.c */
+typedef struct uprobe_map_key {
+	pid_t		pid;
+	dtrace_id_t	uprid;
+} uprobe_map_key_t;
+typedef struct uprobe_map_val {
+	dtrace_id_t	prid;
+	long long	mask;
+} uprobe_map_val_t;
 typedef struct list_clause {
 	dt_list_t	list;
 	uint_t		clause;
@@ -135,6 +145,54 @@ static void probe_destroy(dtrace_hdl_t *dtp, void *datap)
 	free_probe_list(dtp, datap);
 }
 
+/*
+ * Update the uprobe provider.
+ */
+static void update_uprobe(dtrace_hdl_t *dtp, void *datap)
+{
+	dt_probe_t	*prp;
+
+	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL;
+	     prp = dt_list_next(prp)) {
+		pid_t			pid;
+		const list_probe_t	*pup;
+		dt_probe_t		*uprp;
+		long long		mask = 0, bit = 1;
+		list_clause_t		*cl;
+		uprobe_map_key_t	key;
+		uprobe_map_val_t	val;
+
+		/* Make sure it is an overlying pid or USDT probe. */
+		if (prp->prov->impl != &dt_pid && prp->prov->impl != &dt_usdt)
+			continue;
+
+		/* FIXME passing in NULL pcb and dpr wreaks havoc on error reporting? */
+		pid = dt_pid_get_pid(prp->desc, dtp, NULL, NULL);
+
+		for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
+			dt_uprobe_t	*upp;
+
+			uprp = pup->probe;
+			upp = uprp->prv_data;
+			for (cl = dt_list_next(&upp->clauses); cl != NULL; cl = dt_list_next(cl)) {
+				if (gmatch(prp->desc->prv, dtp->dt_uprovdescs[cl->clause]))
+					mask |= bit;
+
+				bit <<= 1;
+			}
+
+			key.pid = pid;
+			key.uprid = uprp->desc->id;
+
+			val.prid = prp->desc->id;
+			val.mask = mask;
+
+			// FIXME check return value
+			dt_bpf_map_update(dtp->dt_uprobesmap_fd, &key, &val);
+		}
+	}
+}
+
 
 /*
  * Look up or create an underlying (real) probe, corresponding directly to a
@@ -803,6 +861,7 @@ dt_provimpl_t	dt_uprobe = {
 	.probe_info	= &probe_info,
 	.detach		= &detach,
 	.probe_destroy	= &probe_destroy_underlying,
+	.update		= &update_uprobe,
 };
 
 /*
-- 
2.18.4

