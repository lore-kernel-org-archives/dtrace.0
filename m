Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB8038E12D
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 23:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787961354; cv=fail; b=dtaPIzp+jmyaXDyVMoAUdWUonO69KGHirTSzzL4/MC9prLmwDAaGUuKCvzPZnPOfaoIVmttRXwSbguJ3gLs6oFTsseZPYGOpQFSIoDoBPtR6C9ZiLnsc9tBK0ZGxCoeWhoBxsxTO3dB6XRQjyxQKC+bCSNfx71XLDFtoA12GKIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787961354; c=relaxed/simple;
	bh=WYku7GcL+DYEhEahxFrO8ds62/YAhpXhz3u7FHm4GM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=L4V6G0vHoF9EkHkHcvgCxrF7+MT2m55TTxzt/L7sHKirOQmwF0Bj2LX7SRBFZQiTwWFZJBXZ0zo4p4NpRPGmu6vJmyUv6ARLYXvVzpjHmEdUQP4zN4zDWzDfg+gN61Db7IQ6Ygwiet3cYlVpn9yhnmiZgAgJfPEKP8BegWVBjsM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=n+M+Hrk1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=F39queHT; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="n+M+Hrk1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="F39queHT"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SHK3Q63147485
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 23:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ygWIEGzvLXH+SVYJ0T
	JXI7EVfrgsWEGpFgGDBbhkP54=; b=n+M+Hrk1aHQ1Br2dcczvOHqFSuv92mdcr4
	o2gP35/ByWXTLklOFqEeWnIINX8sh/ynm9N3PUQjrB4x7ScfgjX3UNZ13Diia+ie
	Rp5qrY626qSK/gMrH+bXS0pmPSBvuG/WOITlzellRt+cvpBxP65V5LchbYtH2PrP
	vAYcrhS416AP4/Qk6Vv9To4zZFQWMZUIzyjdahjdNNpXzChaEu/OzbSnt85HJQbk
	Lh2AjL/wbou2JCbEDHZrXKWA5B6I216CajT/pza4JDY03yEMDu7IUK1L+QAHIbiO
	FjhsNH6G+GEmmKwCVmjX4lvLXhwOrwRCFnD5n/qdCCtevs/tC9mA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g72byaqsd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 23:55:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67SNstOd007646
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 23:55:51 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010003.outbound.protection.outlook.com [52.101.85.3])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4g85104wtr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 23:55:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFi5YLCB0/0S0A0MlWIwBFvxej+v8rOf/PO5KUJzpKcatc2JKVkk4fe5AljMAZ1mMPZcgWwNcYXAK3lSf3z+uX/JZDMBN+EmJNKvJBRmFoV/Bq221b5QydWdEc5s6VvTSgWnzRXzy68ztEHdJfvPacT2DaEc37dIaFm3ORK1bzNL97vI1YBCSLz0m0uM38c3c5C5VL3p+x3FEj5NcfLRwTFkCRkP8o8hxqYHX+/rxva54YmM2fb6uUZZs8JZI8QQTO8DD3CUQgnEBb44EfDCeFzbu6ZSgKcatvaUMHZG096b3LsNVBsGVw0U8Ta0oFWu9n6i25JOcR9vYrC8JelTVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygWIEGzvLXH+SVYJ0TJXI7EVfrgsWEGpFgGDBbhkP54=;
 b=RO+39Gyw5JUCi/UUHMX4FvF/DUd0LU5p9GK12BJ6qHKsdrKxkYtRM9JXm/GkqrnDOaAvM7OyB/k0AER6E3cibaTUyUKKKQl1fW7OGCxdFzVTPdI9k7IRVt3V+dk+HPVfDV5hi1ZPglZ9oL6LHj9avEjnMlUi2rSdBusVX+cVM92TF1IO1NsCpFHrYoKQ2cXxXAwFVSXmETFn448mynAxGO+Q5YI+oJkd+T0KnnNAQ0B4aJ+wyyfV5KvXs+zEUTWG8WDukr9ZGkg8/pOAP50M57srBq/gOiocMRkNCG6oeTxXnjHgGhtu3Sz6RA9BiOPngF+0lnbgOeYrk0uWkyhlNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ygWIEGzvLXH+SVYJ0TJXI7EVfrgsWEGpFgGDBbhkP54=;
 b=F39queHTnSXEuQWNs2AGX4zuzCs5pvoKrnmLq85DMgqly2ZzwWYRoY/LPGEQas2MvRzqsyYPtmTGCPIpaJRRv3RHE/4HzfQEKyqEk8eGUj8WU5YAhWonR6iZOYEySDceL7TnLRSP3Im/ubUsfYp1ZLsRc4VvsOhOuFI9EVLoPII=
Received: from DM6PR10MB2476.namprd10.prod.outlook.com (2603:10b6:5:ae::24) by
 IA3PR10MB8615.namprd10.prod.outlook.com (2603:10b6:208:574::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.9; Fri, 28 Aug
 2026 23:55:48 +0000
Received: from DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537]) by DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537%5]) with mapi id 15.21.0382.007; Fri, 28 Aug 2026
 23:55:48 +0000
Date: Fri, 28 Aug 2026 23:54:51 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Update github repo name from dtrace-utils to dtrace
Message-ID: <apIVAIf3IuTVUh8E@kvh-deb-bpf>
References: <20260303183936.18507-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303183936.18507-1-eugene.loh@oracle.com>
X-ClientProxiedBy: CH5PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:610:1f0::20) To DM6PR10MB2476.namprd10.prod.outlook.com
 (2603:10b6:5:ae::24)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB2476:EE_|IA3PR10MB8615:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b737bbe-a2d0-445b-3a0a-08df055fe1d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|13003099007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Jr1jlxK0Xz2JLHzxsEX4VYGy7bPHbXSCnMwYAzSZT5uopUdvQSZBwk8eMNebCBHOsauwMQt8byPfwOYP7W291jFrqXNwApEgDIL+RFb+aMweO275zh0oiove/HGxaNEkIy7157DnUsk9HCPgwI1pa9vaiz3nKHAd1Kv/YN/LfDKFBj2aTanZ8hQMCEnfUpHVZCMnSmLskYM6PlBMDUXnSNyhFlwHCY+X5avlKgVgNnuEeQymOImBMaxDPuBh97UQ+Rb6cN4e5bUO2A5AFcR5oPl2nNjarzdWJrCfKM5wxnem/4qYArGT9L6UOMkfVRs8YALBzEzG7SNjFwbFq7+cdjm3C85nWmx9yCprzxAZ2FnJbltUhNePAIR4++wB3ZNwiCCcvUZoC7h/GW0242Jc9SQOWp0gmyLVW3jwldKmDR+2oy6yccI/3Z/kPm1lbnJGr9XJKvzlTpZrmzJvNWi6pqopqH6G99H+mc6rqKBWBeBlN8uNvxjx+EED9vHPFg5H1WCvC5bsfEvZqm8eZLJLeiIEki2EqgWkOaGkADf7lAnivBL1wuFNBjbruvMi7KZEBsG8nrUeayIskKPYC+tt/UkUObPzpyBWD7KMqKjgsLrri7vloFCypue8+lpxVRDb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB2476.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(13003099007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?71mgwOyTBfi+y44UqYCZ1OAzWQo6HiGcefiWg4oQ8+KXc2YHW/PfDLJZD5FV?=
 =?us-ascii?Q?i//ulSBPPZ/hkXjqb+k5gKKOfhxkTeoDvzZI/6zL1cmXXj/O18iPD2aZyOXM?=
 =?us-ascii?Q?xe0SCfpdgbcZZ5Or3TbHjnEfFa0bC3p11hNYC+LIfbYZlFviC4oxCnwxWlYS?=
 =?us-ascii?Q?vN/SGWrVbbF4fltmcbb2FFODDJZm41Os+djzspX6dte+LALUfCySSGoOk2Gg?=
 =?us-ascii?Q?knUAR+P6ttJIaC3IsaEinPNZ8AptTGiiJwsAPyBrMZoeyg+MymeIPPna1utI?=
 =?us-ascii?Q?BUySrAlUYHjsLi57GTFg//MgmvRM7LtOy5XOR1mn7PoV48tln+Yah9glEk7A?=
 =?us-ascii?Q?mw8NQI/j1GifL2SpERLvLMT6QPOzSTdmekBIXMT5529FxNW14Ee89uflH2Yt?=
 =?us-ascii?Q?Ykl1IgpYp0s53NQhW7ujX3UszpN1aLL1eYyXedCqp+lsS9bEWZDbRS96M2qo?=
 =?us-ascii?Q?An704QSP6NJe8yEc8bXOVOdc7WKKtmkv1WJD5fLHSZa9HDUO4GtuXDf+iLHx?=
 =?us-ascii?Q?s2xVkQwi2SNYUHu7FazLvPEAN6LhPecZclGFDhHm1+a/AMPZ5DLbiD2c9HEJ?=
 =?us-ascii?Q?XdSVRDW5sMwCWYA+yGlmtftYW/nfcshj99ZbMG7Otqq55NmCGmYT0U4v1yGp?=
 =?us-ascii?Q?cP3tpH5mtlpP9D85HRy+Bj0gsHgCgMAz0PQqWzl7/7ogn3672gmGToEYfYPC?=
 =?us-ascii?Q?CubcDduvxvHKjDKwNO4e70QD9hwF6U7xVnJHqpJp+CrmkIaZ2uwjSFnOsV+x?=
 =?us-ascii?Q?PzTrMKzxfbWWH4DAqHr1aMqQFP16A6oNlkGQ/dEFsnfeRd5qs1pZ751czq6s?=
 =?us-ascii?Q?q5ekOkpd3/8nPVENF1NZc2ohTWULYHHrZdk2upcLdMlu0Ip2MBQgkw+4ZDv/?=
 =?us-ascii?Q?bBV1BS5C/9fC08B8F5AxJgT5Z2H3tkU+4+MBWW+JpFJgity8+ncYuSX4dfX1?=
 =?us-ascii?Q?K0r4LdrNL2XRXd6j96CWMrGrHekZ040FCVEBspVOgbWVxcnHNgnEz2BgrGjp?=
 =?us-ascii?Q?RyECx438PqeIhjuLpsWVvg0dnQ3cAkN9LYLHKTwcpsQp7YCb0JjAphrJKk7q?=
 =?us-ascii?Q?SlgXkztn2bebXGkyxBFAS+BQL9dKEMiuhx6ZzJ4Ygs8UffxNWlVsynY05zcF?=
 =?us-ascii?Q?dgRbbdY5tJO+djP0i5faaLKKliiVR4/BlXEsVeZi7WXjGOhIJ9DxyaqVXhC/?=
 =?us-ascii?Q?GhASX35k1wl74xjI0rOu8aAFE6VpKdiQ5g6kPcIOzpvoa3cc+q8hQNC6r9Kh?=
 =?us-ascii?Q?ODxpwbOScfl1tW9PUDWVB070+py7qxdfPVbzUApEhuv6sbOrTJg7P9wxdq3P?=
 =?us-ascii?Q?PUjA/dkupOunVTU136iySR3fpJp9xWLU9Wx/RqaGCJRrs8S3NhZwI+ttRV/G?=
 =?us-ascii?Q?dlNpGLwepJEWSnmzebjasAmD068OHltHNSI5KTWEfXCgmP907+6+dwhUU8qX?=
 =?us-ascii?Q?z9MWGBaygT3NZy6p5EMGaVkVP/7yGiVa2We69kPw4wVql960bd+UwfGmEg4X?=
 =?us-ascii?Q?5poIjfx9aGtYS5Fr6Xi3b4tt0geyf5I0wK5nSNSwknlWHaugNtJCuet/YQJe?=
 =?us-ascii?Q?UqlC0k3bAzKW7Zo4UqDpmV4gdTAIaORQiefb1t/znZ9rkVJuY4CPxoTMkpNp?=
 =?us-ascii?Q?IpVeMeHsnF+ZV2g32Qx2HwvRZDle+/A+IGalK+yU+fxbtTf4wqSoaeDGsX7P?=
 =?us-ascii?Q?wcgXpPxZOjRP+R+Ek92x/SVt3lx2hCmJCOHbTVTNDivJ02t6lWQfCMb5SMZ5?=
 =?us-ascii?Q?369zDOyqoGo4XGHVXQiZH5PZyir0tLM=3D?=
X-Exchange-RoutingPolicyChecked:
	sQ6AJsfNmB0utSqU1yjrAmx2QP2AXKd4bOoMJ3lk/E/M7UrYUtXwD7LJmXchunpt1HQSZcCYH+LTWdTPCxWlkRTzN1yuKPAD+JK2d8AMjsp9FT7jBlxXesjAXYVxApFyWP8Ha2BgxUeHj9bEdoVUk5uRJjeIyWsQ5YBoTVW11OGNLzynjSRWhxihLm3EQZvdHoApJcNqrXGSTMsBjGNShFZEceUFl8Ne3Icm1AWHydep/CUqyqlgaEJ+8xtmwvTyZ457RWLH95ob21zFbabWMQqRdNJV1genw3ikWfGHklQGePRywrd/Wee0LFg/2Jq9xGL7wurc/qi4KC8UY/kd1A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	t7L8DlLENDd+2Z4fv1MP3bLiKYio0XtciNcYva2dPHW2xm8oLizkjLuEeHk1nabRPkMCnBmbskCt2IfWJvAzXQerAUMxiAOKwF0FgU5KmbMrjZC4rRMYwfV9XgZlJIFYH+TrRO+KZO301pTsoQTZsOELj5Qjugd8JVspVf7Cri7kzM739rEz5ZkJDb2Fr7F+/GuP6pqAcXj+f1BtnQ87pYCp1a8xVsS2GNdD7mkWNIw9hYS9uaMPispOC9CC2Afotg2tEBVUD0OrJzn10oNdg263/Zo8NWt9gFLc9btBsxi0PtWOyUM41noxxUOHd08+F2eTzNSJN0tutvJ4auj2pKAsoXUCCEpH6MxNYg9MmEoFCX2hr3HzuoA79Re7HfRJnvKstv3W4zEJHrFINM2AaYm/Ztd4jXs/wmks9VB2yNs+antolSHvfY1CYz06cAoMYU4l2Asw0DQlJhGNqzmGdkTSaZiZ++IW9APg7Bive+Ic5Nv7o/tzmRD31zwOlqyWP7OMrFl9TZYT2rHfhHapD52YyQYQkqVwhnOzpxTmjD+t6k+8aKYEKJNkHRINwQLqhe/kMlCZTGNaw0ZcpOgTyxDQa7dPBJz8fV/LVeVYdkQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b737bbe-a2d0-445b-3a0a-08df055fe1d4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2476.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 23:55:48.0338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Poi3g39BWP9piMTCWyFAJuB7rNOo6POXC+7ut1s+6zgl+6AJ5rRwQBSf6yvG2fHOl8NfBVKgGWNig5jFNccYMInzsFqb7Rt1DyOKfZxfl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8615
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_07,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606160000 definitions=main-2608280209
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDIwOCBTYWx0ZWRfX5XkB2W3brvrR
 2r/L3moqiWPJKyZpzDYArICquL8I6msS1p5Wre4qv+IyWJR9v75gCHiXLfuhPlozK2nAreC36td
 sxxS/DVgv+nnWYfQ5NgQ0VLjU9+2TkIgVay1td9bgpqU20chpgJ95oAuWKPW28rrmGcLnpRRZWG
 XOH15pm5/cKXdOBuuIY89fVmKmMlg+4BagWBF4wo8o/CxhppcbCYEINmDEO+xS4MBz1o3NtZvd8
 fa4YD2/QLIMEUySAfuO1xpRjma0o6/pFIktic8cKnASX04XElXR9ENEsV+cl9fywMOIKB+BIo3S
 0t4601usHsnBfSjydAno3MlTO0NH4Y8kz3v9bx27T2BaU3lnSDCIpIoCo0+EWCwOTzfcyGfA7Do
 16/HAM5LQIKDPmUOdmsYAUSl2PFwfZz9cjj/DLHPtxJ4Cj49AsTx7tKl6rvsmWKksMDm3sVcaIB
 qGThwRUGGpv5bqivhWQ==
X-Proofpoint-GUID: 1bnWujYmOWhj6M94BVvxVB2sVsrfbESh
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDIwOCBTYWx0ZWRfXw2OK/qor2D8d
 3XRasUOaPorTrJABQqa5KQVKs10avxLUXsJgNxXIjkobzE1MeLXH6lV2PpafGmCPKmp7AQTBldM
 MAmJPqNXBoTlDmzxsWZbjsi4YXz4v/+9L46WRO3/WMvF8pUj5Ogw
X-Authority-Analysis: v=2.4 cv=fqTsol4f c=1 sm=1 tr=0 ts=6a922007 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=RD47p0oAkeU5bO7t-o6f:22 a=NEAV23lmAAAA:8
 a=cMSsWa0dAAAA:20 a=yPCof4ZbAAAA:8 a=-bMhQ6iiAAAA:8 a=ukgSBFXlznYPzRcKo0AA:9
 a=qcg49hLlgF0N60+LroqrWnV/Vu4=:19 a=CjuIK1q_8ugA:10 a=aViEl8YYgB_fEZN5ws7z:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: 1bnWujYmOWhj6M94BVvxVB2sVsrfbESh

On Tue, Mar 03, 2026 at 01:39:36PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by; Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  README.md                                 | 4 ++--
>  doc/tutorial/1.IntroducingDTrace.md       | 2 +-
>  doc/tutorial/4.GoingFurtherWithDTrace.md  | 2 +-
>  doc/userguide/explanation/dtrace-about.md | 3 ++-
>  llm/README.md                             | 4 ++--
>  5 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/README.md b/README.md
> index 95e434340..e7b4b7a1e 100644
> --- a/README.md
> +++ b/README.md
> @@ -7,7 +7,7 @@ visibility for our work and to make it even easier for people to access the
>  source.  We also use this repository to work with developers in the Linux
>  community.
>  
> -The main development branch is [devel](https://github.com/oracle/dtrace-utils/tree/devel).
> +The main development branch is [devel](https://github.com/oracle/dtrace/tree/devel).
>  
>  We provide prebuilt x86_64 and aarch64 DTrace userspace packages for
>  Oracle Linux 10 (UEK8 kernel),
> @@ -162,7 +162,7 @@ The most recent logs are also available by via the `test/log/current/` symbolic
>  
>  The testsuite itself has more dependencies that need to be installed.
>  The full list is available in the
> -[dtrace.spec](https://github.com/oracle/dtrace-utils/blob/devel/dtrace.spec)
> +[dtrace.spec](https://github.com/oracle/dtrace/blob/devel/dtrace.spec)
>  file.
>  
>  ## 4. How to run DTrace
> diff --git a/doc/tutorial/1.IntroducingDTrace.md b/doc/tutorial/1.IntroducingDTrace.md
> index c91cf88e4..3236edf82 100644
> --- a/doc/tutorial/1.IntroducingDTrace.md
> +++ b/doc/tutorial/1.IntroducingDTrace.md
> @@ -201,7 +201,7 @@ for more information about providers and their probes.
>  ### Preparing to Install and Configure DTrace
>  
>  DTrace is available for Linux from
> -[github](https://github.com/oracle/dtrace-utils/tree/stable).
> +[github](https://github.com/oracle/dtrace/tree/stable).
>  Or, there are
>  [DTrace packages built for Oracle Linux](https://www.oracle.com/linux/downloads/linux-dtrace.html).
>  
> diff --git a/doc/tutorial/4.GoingFurtherWithDTrace.md b/doc/tutorial/4.GoingFurtherWithDTrace.md
> index e267db907..a4e62bdbf 100644
> --- a/doc/tutorial/4.GoingFurtherWithDTrace.md
> +++ b/doc/tutorial/4.GoingFurtherWithDTrace.md
> @@ -7,7 +7,7 @@ For more information about using DTrace on Linux, see the
>  There are [DTrace trainings videos](https://oracle-samples.github.io/oltrain/tracks/ol/dtrace).
>  
>  The latest DTrace development work and source code for Linux is
> -available at <https://github.com/oracle/dtrace-utils/>.
> +available at <https://github.com/oracle/dtrace/>.
>  
>  Or, there are [DTrace packages built for Oracle Linux](https://www.oracle.com/linux/downloads/linux-dtrace.html).
>  There are
> diff --git a/doc/userguide/explanation/dtrace-about.md b/doc/userguide/explanation/dtrace-about.md
> index b832799e4..0d8caa313 100644
> --- a/doc/userguide/explanation/dtrace-about.md
> +++ b/doc/userguide/explanation/dtrace-about.md
> @@ -22,7 +22,8 @@ This implementation is a user space application and is available on:
>  
>  DTrace is also available on Unbreakable Enterprise Kernel Release 6 \(UEK R6\) and later kernels on Oracle Linux 7, and requires the `libdtrace-ctf` library to run. The functionality of the `libdtrace-ctf` library is integrated into the Oracle Linux GNU tool chain for later Oracle Linux releases. Oracle Linux 7 is in Extended Support. Migrate applications and data to Oracle Linux 8, Oracle Linux 9, or Oracle Linux 10, as soon as possible.
>  
> -DTrace is developed as an open source project available under the Universal Permissive License \(UPL\), Version 1.0. You can access source code and more information at [https://github.com/oracle/dtrace-utils](https://github.com/oracle/dtrace-utils).
> +DTrace is developed as an open source project available under the Universal Permissive License \(UPL\), Version 1.0.
> +You can access source code and more information at [https://github.com/oracle/dtrace](https://github.com/oracle/dtrace).
>  
>  **Parent topic:**[DTrace Concepts](../explanation/dtrace-concepts.md)
>  
> diff --git a/llm/README.md b/llm/README.md
> index 5e0feb122..2992bf7bc 100644
> --- a/llm/README.md
> +++ b/llm/README.md
> @@ -27,7 +27,7 @@ The goal is to let engineers and administrators generate working D scripts in na
>  
>     ```
>  
> -   Make sure you are using the DTrace binary from the `dtrace-utils` package, _not_ the SystemTap compatibility binary:
> +   Make sure you are using the DTrace binary from the `dtrace` package, _not_ the SystemTap compatibility binary:
>  
>     ```bash
>     which dtrace
> @@ -123,7 +123,7 @@ This makes LLM-generated scripts safe to test and explore on production or stagi
>  
>  ## Additional Resources
>  
> --   [Oracle DTrace Utils on GitHub](https://github.com/oracle/dtrace-utils)
> +-   [Oracle DTrace Utils on GitHub](https://github.com/oracle/dtrace)
>  
>  -   [Oracle Linux DTrace Training Modules](https://oracle-samples.github.io/oltrain/tracks/ol/dtrace/)
>  
> -- 
> 2.47.3
> 
