Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B00145330
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 18:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721327338; cv=fail; b=rH9eZ2jRQNJWRc9hYgs8ogZ24AeSyYiQXztuEdNcdfRft/+cY/RsDEF057RRSvf77eAJfKbHAZJG9gGRvFSnAx9BZ2V2r/zepOOE1qS3UdJYg2cg3XKX1rhtAA+kcyL/rOrBawUAn0BpmZiniPcx2jLY91NIv4uKAvcmPbfUYDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721327338; c=relaxed/simple;
	bh=6CH3C5nv3XLKiXvW030ON+3GZUn+WRglCAjQ9dagVr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IitMMjXrn77DQ+EvcaNwK967G/isnUs9WY8DE8CCreWt6tYUnSJcct+urZCF7gvqZf114vc4Kky3H/2509o/CWuyAcQEn6TQPxTRTqYHxacfdvQdI8nKFyS8PI5EHC0pmm7fYbAl6gw6c0567UjlX4sIVrg2DK5D1ooCAUiT9kw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MlYdWd21; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NdJCY4Gg; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MlYdWd21";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NdJCY4Gg"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IIFsUY004342
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 18:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=WjhCAhE0XnqhvWV
	IytqmhST27LDU2SH4FujoFP/OUaE=; b=MlYdWd21QXStLPEVbiDdnSFsQaDwcqK
	w+0SPuyGcwMUBg/owDzSMJoNjSCjtVSO3QF3qm5DQG1jFnZ5s5XfkNObwM2nB525
	Ig8isKT/mXc5H7gcBwsYJx7+6WM4m6MCFsmbVESWBtNM6i1UODrZOLsNr04oQqI1
	y157L/02FnJ+PSOGEa1lVyVwmS0vUD5k8sJcm2CFZnR4Qv31Jq0p7WTa4sp480I0
	OednpayfxuJE6to+FNJKpo2aCLxhtaOu0D0vjweD8T3RgNZ+8lFUsXcE5puBy+eP
	yyK3DrADZYxiUYTqw/+9rh+0WugPCA7Mh4D0StSLpmiYv//REsA8h2Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40f85u8134-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 18:28:55 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46IHg3TM039597
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 18:28:55 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2046.outbound.protection.outlook.com [104.47.70.46])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40dwewqvut-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 18:28:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J0ggtnZkN6ZhZUMKoVzQQWTzh3+A7S0H9vacbITEJKI74tte3mhnqvKRuMJAqfkL695uHWf/Q3JFtQkhgwfrmXzEZDZNX9a8dfg5tbiiJOfxIUf+ZgMJVtby3CaG2NSDiEOGFScFQr7kHwALHJ9NF/JEXwkWbCHsuM7PaPX+xolNx0ol8Kukta7kuhjw6nZpDIiP7/mB8lmJdKTl/zmj8edteQYoo+uLPHT6Lg2YKtR9qe1M2fDQo2DsvMq2GgUhWCyRXaMTGMx6QprkXNfn1LeDQMLir99MJnpKPyLAAbbPfbhXW2KACbNKjmWnT84bCf10975GyKsdcBvt2RgMbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjhCAhE0XnqhvWVIytqmhST27LDU2SH4FujoFP/OUaE=;
 b=RndVd9zvTgfOV7Tzp7QgW6kJiaR6H3qNBpnz2j5UpW0GzRz87/GZ3+fUiBZh1X4CNOdaeEqLWHix5mehx1I0QgmR6ctcD+bQ2T8YsZcPQnsMYBjjoCc5TrPZ3HSNu0m37gxQO2NT4SlJS7cotSOGQEpDCo0N5ynUVfRSK1TjkD7MYEbgBXC74fAWCglWtvZa1QOfnQTKcomECRanP8XfkPHIVqwf/zTxSRpu1Dqsp7Nbl8fNW7T7wOwuqjlWNH3ac2HGe1prmqIdJxAjJa7NMVulvI9yE3Kfbd074GeCK/6J17o6mT3eCX2WdFzowtd9NXabVOVXRcMM1upl13C5EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjhCAhE0XnqhvWVIytqmhST27LDU2SH4FujoFP/OUaE=;
 b=NdJCY4GgnQonHotPA26D6mNrwvmJFiV7opjefdb+6S3l4hWEIbOU8cFmXBKrM8gPeSUWaFaIvEL2xMW3ocInrPGwc/Mkz+35TPPwPJ7/VI0BPIeBfBUe3FyA41jESqV+fkJIQMoYed6eG05OSkx6yqiZ0wj2qf5/9ov/BeHFmKk=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by MW4PR10MB6486.namprd10.prod.outlook.com (2603:10b6:303:213::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Thu, 18 Jul
 2024 18:28:51 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 18:28:51 +0000
Date: Thu, 18 Jul 2024 14:28:48 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 04/38] Get rid of apparently orphaned bufdesc stuff
Message-ID: <Zple4K9951PTuc0R@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
 <20240627053455.21567-5-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627053455.21567-5-eugene.loh@oracle.com>
X-ClientProxiedBy: BN9PR03CA0530.namprd03.prod.outlook.com
 (2603:10b6:408:131::25) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|MW4PR10MB6486:EE_
X-MS-Office365-Filtering-Correlation-Id: f0c16d85-d769-4c28-9f93-08dca75778d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xpBkhIzNiXONZzBqK82ydikN+cU1/zw3kWdZr9KU/HMv4tz1dagCSawN98Dx?=
 =?us-ascii?Q?VqZEXfY1xkuCejGdXMPTkfXWYBO1rGaD/3kmV3jJ53bHQgO33agcttCFcPmf?=
 =?us-ascii?Q?wgwa4Qa4/Ey6SGtgoYyhwPgGx/bT+1t4nDk6aB3+TCaVpe5PX1yjDJSl9RbE?=
 =?us-ascii?Q?MJu2qwG3Ix7Y5iSxVaTM11zQueh5/JJORgf9ny0Zb4l9Sjs7o7wcVe2HrN1Z?=
 =?us-ascii?Q?9khAofO/fYhkPfLAdXS1+sxHz44p75BAr0ObyHE3GwP09+NyJHzCNbCvH6Po?=
 =?us-ascii?Q?E5+siKbh7OPbcQxam6MKOmQg+ti1yQjRsLRw7RfQ2Yh3s4C8NUBpTHP9d+qZ?=
 =?us-ascii?Q?JJ5s9twIovZsB/dvfal/ZqWcwYrc8LOtxkg7yrdoP8FEvbrDi66AUNzndh39?=
 =?us-ascii?Q?IJQ4qdMvxea57u5JePXHZCiGaxovA9fA8IBbhFqipM9g+/IE0SDVVwWdDqps?=
 =?us-ascii?Q?4M1hNKJoMNguflDVjRpHyE1aD8TeAh0FdkwkZ2mgUq6hvbMdo1otfHIIhHPc?=
 =?us-ascii?Q?Fx6ANFRqS4cdm1S2WcXw4Efhp4Ctr+hO0dxB37gUtf/K4gd7OKcCFHxxWAQo?=
 =?us-ascii?Q?SAskphs2i6R/Ox6n4c4AW+0+Osdp3vOBsN5snrR1NSQOIiV4faHco4NAdvLi?=
 =?us-ascii?Q?04jrbdtTgkI8DZWWrIiEivD+xjTH3EljRGgAq0ouKbtWH9RgOOk5e1Db2phk?=
 =?us-ascii?Q?A6PrkyLvZonyL6K8AC6U6ulfSMttnwxJtgvLzBz2igmBKXPHvmZoWrplKKFt?=
 =?us-ascii?Q?xfIbR0PgUdHD/+qJvtfIDHFkiZh3He8e5ktjbi1SJuWngSQKA2MdwwoQSnip?=
 =?us-ascii?Q?OXv0c4n6gBcCuxseGABxtdNPenzhO22DHGd7gx5WHeTC4LRI5kWnPdLnhSzX?=
 =?us-ascii?Q?Ae41E0AKbBYr/unCLe5u6oVuR4cYbnuYsJjaFnSyL1TXjeA9DBC7pNbnlGaa?=
 =?us-ascii?Q?9Z2qDUepxyVTTu+2GNhcwjSJMPqpj5/OjIMiUoX22qaq+7unDYrdVFVjB5ta?=
 =?us-ascii?Q?N1/EZ9u6qmywScZ33XHWsCpIz48+GIuzSLF7MdKIJtzTdKKFKbAi4EwMtcED?=
 =?us-ascii?Q?E6W1yS3n2h3AG7GZptWR6TADkiD/qDQbw+exQ2D7oo0OPcsr5t9erryqRKH1?=
 =?us-ascii?Q?vxlIyJfrmBfQnQ6CUKEd2nXZ1RA4rsKfggp7ZoMqyhBU6nUka/zQTryt9lI8?=
 =?us-ascii?Q?SBdCZgLbLXtGAbnERpUzbcPOZBegieaNW3i8H+WYyf+yyS6amQEBlkyosiYP?=
 =?us-ascii?Q?MCk8BCYXH1Jq1mMrTG16ZicnX8tLlv7KCxEUznmYGYAwCeLanCQMCpF1rBdS?=
 =?us-ascii?Q?QfYmJBjEJb72N7mUr/ui6NTwWrtFz6StSVaUueY3howqRw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uIePN16kxaWaNRlmSXtgL7o2ks4h7tOj8nsg4wb+CYYUccvmkwcJkmCtptQJ?=
 =?us-ascii?Q?S4ewrMkHNCLNgpfCjPCJmImph95HzgDEZoNCroDRp9urTOyvt/K1PsUj0/lw?=
 =?us-ascii?Q?cz9pFlk3w59urXX6SM5WUqioOrfP26NsqNGW5rhuBKCE2RfepaXrgBuPs5pB?=
 =?us-ascii?Q?wIB2YWIlKC/ZnsWByzRPLuDaw90MwuYwuEFTsjha6ionHAVi0qQYce//nqdK?=
 =?us-ascii?Q?1xFl7AAsQSlhtE2VYb8RnHEHkUeCovxtcMxmAPWP5BkKCvWBx0gxO4z/xTbF?=
 =?us-ascii?Q?eDzw71C911hsSjbFeepdK+CAsiQAeviWuwvqP6KTP65PXX1s4z3SLrGSrXCT?=
 =?us-ascii?Q?DuMpj2UPtWcIEmePme7x+dIYmNdINmy3zNXp3Tz424r8EM/7kd6ea2Q6j6O6?=
 =?us-ascii?Q?yX+oL/1KOVjwHNNIVSlsAWyPZHk9zx8gd9SmP1GuuCA/5SeE9mItZ24gXvZ3?=
 =?us-ascii?Q?v0ClHG95ESNHCdNPnP4FXrDEtpeopTQBv6w6Wz4bdVmmPUI5cfAZBfUjR3uc?=
 =?us-ascii?Q?2FmT/OhbxzO9qOaqh+xSDozhjMvGJfQsC7foLIubVpgtZf6EbSZSGmbF9+43?=
 =?us-ascii?Q?oXO5dpu/TijeirVZrh+qeXa7FOhKGauru/K5t/kOSpC9gv9DbM1yz3C29uq0?=
 =?us-ascii?Q?V9/MaNMTjKqrxEoHHaP9Uyowu0HcZ6F+e8GS0O6Euzxahxcdb0d/avhGGL5L?=
 =?us-ascii?Q?w4JaOsJY9p2sdyx1NiHjUfLxX1psS2vUkcHRuQTuuXMkeaovamhAbGFayVK5?=
 =?us-ascii?Q?JuJa8GFerT7Sz3cnER6u1nxGtfweGeTASVCuGmt1hzZHVXeFjRy4jSkyz60g?=
 =?us-ascii?Q?fjI0p0Bms80rk5F5v1dCXPa+RerPCBkWswcFpucBDO1S6XmBksmxo1xSiNKP?=
 =?us-ascii?Q?8vmwZKS43H5iVJWF/JrPQgBgesJ29zHO4Ntr8R/InwkuyvA/G4+2I5AS7UyG?=
 =?us-ascii?Q?bAztO5FljcrP0anTsUgZf+Nwvfq/tkBvSBQJthdYHt0CfdXpLO69G4H7kL0+?=
 =?us-ascii?Q?dyllGpi8FTiKtA0lw+QtL97ALYkSZcgk3NFXEhBh8Po4JR7uwwhdfSaluOQZ?=
 =?us-ascii?Q?p/0LNbqIBylVOBft/aEdO4RhVX4v5itzZcpTHrP4oBmfJDZtlAoosJcrOTpW?=
 =?us-ascii?Q?/Ev8P80aJPYDD1s1zQ5r55rj7bi7UkVsTbjckA5t2kArxh4ywIEPRkwNVzxy?=
 =?us-ascii?Q?xeRGNZAs4ZYLuPP/N8Tn3D1ZmTjvWi43W/p/PnIubi7lGaoMR2Zs33+p1Nst?=
 =?us-ascii?Q?ROGqkdTb5pD+YQ4IaVGgEA6k5kYuOUVclKE9OWXUMBXdngl/3SzMDep8Yebq?=
 =?us-ascii?Q?goeNDUVDzjvxYFE7h4D78+/pEyuB0eOYa8uwD/oHryCYshZyYM8U0hT1B0uj?=
 =?us-ascii?Q?TJsvaqzQuH1B1gOqTSUFM8LVcyRjV81DyUveyGEX4bJXi6Tpt4c0dN4F4hqN?=
 =?us-ascii?Q?e06hhQEoQ48x+PpmCZTaqPRfYXplgN/i2BlnkDBHPtXDIIwHmuhdbEa21qHK?=
 =?us-ascii?Q?I6Xl4yTNLKZBRegeLy3jIPX51uxZwWLT1MTgY+M6TLKdcpZU6MO5VWJdbEHI?=
 =?us-ascii?Q?mRJOKAyCnqTvEYPMXCg5nAzNCGMadAt/VbYUl3+p822CH1ikTtsgGUJVz6Vs?=
 =?us-ascii?Q?+w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	7ABsSxPKfQSuqHUooI3/swOuAq6TTnZt2EyRVT9ATTa3Cinp39SvquWTst6P89m68JWBuL7r4+EAXEssmmdrOukmVjEnnfue8QK3ZNflHywup4FdrRETIxMTS6rgrsUzZeeFcLv7/MfeACu4xXWT/h4rEW3WZZvE0LyeUJ56Lh/BY6n4qi7yukvVu55qU2bSvX49k5erxl0GcYm/UVjGENQgcrw+bbTMbuT8gzE47Bfw2ktCuiy/pE8NXijEeUobyTsj85NIuER5nW73KtYhK49xYlRfEOc0jbzL5XgxDLjdQqCoKuSvT1KweCjN72g3ISw/nmByC+P+0u9GlrILTa2B+p0kTrFNoXAkypXs6tWCnoh6QEPELviTqB17UCfywVjBg64/xXqfIz+4zvR5t72x1NuK6c6m4GpEtfXm0hsPGB1Wr21M5IAgSbF86fi8Sx3MKoS/4Ua5oGB2G1xbl4uSdIe918/8vAyTD2Frirk/08YdJK8ihmmuKu6bv5GcHbmhGe2sQVg/dsKP1UiZvcp8RoQ4jQowLqJrhJBHNWdc/SWIbdgTZsAKodBldFBk4orz6ccar9f7KB6VEZcdEcksLN2jOwVTlk3Mx/efA70=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c16d85-d769-4c28-9f93-08dca75778d8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 18:28:51.2333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Oo8VMm66ICMIS4g2JHxzBYB00nCqd8/3zYeLSp+LpYSSjOdXvQXj7zmh2yszHnCX0q8wEv0j3/GwWog0MVvJvnGsluR3sjLqw/oCMVwdGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6486
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_12,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 spamscore=0 bulkscore=0 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407180121
X-Proofpoint-GUID: i1qJdNYJnppp3tF3QUNdgiArwPxo-_QK
X-Proofpoint-ORIG-GUID: i1qJdNYJnppp3tF3QUNdgiArwPxo-_QK

On Thu, Jun 27, 2024 at 01:34:21AM -0400, eugene.loh@oracle.com wrote:

Another case of code that was even unused in Solaris (even though I believe
the libdtrace code used it - but we don't).  Good to get rid of it.

> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  cmd/dtrace.c                    |  3 ---
>  include/dtrace/buffer.h         | 42 ---------------------------------
>  include/dtrace/buffer_defines.h | 20 ----------------
>  include/dtrace/dtrace.h         |  3 +--
>  include/dtrace/ioctl.h          |  5 +---
>  5 files changed, 2 insertions(+), 71 deletions(-)
>  delete mode 100644 include/dtrace/buffer.h
>  delete mode 100644 include/dtrace/buffer_defines.h
> 
> diff --git a/cmd/dtrace.c b/cmd/dtrace.c
> index ba1c22c5..af354653 100644
> --- a/cmd/dtrace.c
> +++ b/cmd/dtrace.c
> @@ -914,7 +914,6 @@ intr(int signo)
>  int
>  main(int argc, char *argv[])
>  {
> -	dtrace_bufdesc_t buf;
>  	struct sigaction act, oact;
>  	dtrace_optval_t opt;
>  	dtrace_cmd_t *dcp;
> @@ -940,8 +939,6 @@ main(int argc, char *argv[])
>  	g_argv[g_argc++] = argv[0];	/* propagate argv[0] to D as $0/$$0 */
>  	argv[0] = g_pname;		/* rewrite argv[0] for getopt errors */
>  
> -	memset(&buf, 0, sizeof(buf));
> -
>  	/*
>  	 * Make an initial pass through argv[] processing any arguments that
>  	 * affect our behavior mode (g_mode) and flags used for dtrace_open().
> diff --git a/include/dtrace/buffer.h b/include/dtrace/buffer.h
> deleted file mode 100644
> index 6fa8c769..00000000
> --- a/include/dtrace/buffer.h
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -/*
> - * Licensed under the Universal Permissive License v 1.0 as shown at
> - * http://oss.oracle.com/licenses/upl.
> - *
> - * Copyright (c) 2009, 2013, Oracle and/or its affiliates. All rights reserved.
> - */
> -
> -/*
> - * Note: The contents of this file are private to the implementation of the
> - * DTrace subsystem and are subject to change at any time without notice.
> - */
> -
> -#ifndef _DTRACE_BUFFER_H
> -#define _DTRACE_BUFFER_H
> -
> -#include <dtrace/universal.h>
> -#include <dtrace/actions_defines.h>
> -#include <dtrace/buffer_defines.h>
> -
> -/*
> - * In order to get a snapshot of the principal or aggregation buffer,
> - * user-level passes a buffer description to the kernel with the dtrace_bufdesc
> - * structure.  This describes which CPU user-level is interested in, and
> - * where user-level wishes the kernel to snapshot the buffer to (the
> - * dtbd_data field).  The kernel uses the same structure to pass back some
> - * information regarding the buffer:  the size of data actually copied out, the
> - * number of drops, the number of errors, and the offset of the oldest record.
> - * If the buffer policy is a "switch" policy, taking a snapshot of the
> - * principal buffer has the additional effect of switching the active and
> - * inactive buffers.  Taking a snapshot of the aggregation buffer _always_ has
> - * the additional effect of switching the active and inactive buffers.
> - */
> -typedef struct dtrace_bufdesc {
> -	uint64_t dtbd_size;			/* size of buffer */
> -	uint32_t dtbd_cpu;			/* CPU or DTRACE_CPUALL */
> -	uint32_t dtbd_errors;			/* number of errors */
> -	uint64_t dtbd_drops;			/* number of drops */
> -	DTRACE_PTR(char, dtbd_data);		/* data */
> -	uint64_t dtbd_oldest;			/* offset of oldest record */
> -} dtrace_bufdesc_t;
> -
> -#endif /* _DTRACE_BUFFER_H */
> diff --git a/include/dtrace/buffer_defines.h b/include/dtrace/buffer_defines.h
> deleted file mode 100644
> index f81c22f1..00000000
> --- a/include/dtrace/buffer_defines.h
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -/*
> - * Licensed under the Universal Permissive License v 1.0 as shown at
> - * http://oss.oracle.com/licenses/upl.
> - *
> - * Copyright (c) 2009, 2013, Oracle and/or its affiliates. All rights reserved.
> - */
> -
> -/*
> - * Note: The contents of this file are private to the implementation of the
> - * DTrace subsystem and are subject to change at any time without notice.
> - */
> -
> -#ifndef _DTRACE_BUFFER_DEFINES_H
> -#define _DTRACE_BUFFER_DEFINES_H
> -
> -#include <dtrace/universal.h>
> -
> -struct dtrace_bufdesc;
> -
> -#endif /* _DTRACE_BUFFER_DEFINES_H */
> diff --git a/include/dtrace/dtrace.h b/include/dtrace/dtrace.h
> index 8f28c9ba..7fc5f5f7 100644
> --- a/include/dtrace/dtrace.h
> +++ b/include/dtrace/dtrace.h
> @@ -2,7 +2,7 @@
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   *
> - * Copyright (c) 2009, 2019, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2009, 2024, Oracle and/or its affiliates. All rights reserved.
>   */
>  
>  /*
> @@ -21,7 +21,6 @@
>  #include <dtrace/enabling.h>
>  #include <dtrace/metadesc.h>
>  #include <dtrace/options.h>
> -#include <dtrace/buffer.h>
>  #include <dtrace/status.h>
>  #include <dtrace/conf.h>
>  #include <dtrace/faults.h>
> diff --git a/include/dtrace/ioctl.h b/include/dtrace/ioctl.h
> index 75d02464..a2a3a93b 100644
> --- a/include/dtrace/ioctl.h
> +++ b/include/dtrace/ioctl.h
> @@ -2,7 +2,7 @@
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   *
> - * Copyright (c) 2009, 2019, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2009, 2024, Oracle and/or its affiliates. All rights reserved.
>   */
>  
>  #ifndef _DTRACE_IOCTL_H_
> @@ -10,7 +10,6 @@
>  
>  #include <linux/ioctl.h>
>  #include <dtrace/arg.h>
> -#include <dtrace/buffer.h>
>  #include <dtrace/conf.h>
>  #include <dtrace/dof.h>
>  #include <dtrace/enabling.h>
> @@ -22,10 +21,8 @@
>  #define DTRACEIOC		0xd4
>  #define DTRACEIOC_PROVIDER	_IOR(DTRACEIOC, 1, dtrace_providerdesc_t)
>  #define DTRACEIOC_PROBES	_IOR(DTRACEIOC, 2, dtrace_probedesc_t)
> -#define DTRACEIOC_BUFSNAP	_IOR(DTRACEIOC, 4, dtrace_bufdesc_t)
>  #define DTRACEIOC_PROBEMATCH	_IOR(DTRACEIOC, 5, dtrace_probedesc_t)
>  #define DTRACEIOC_ENABLE	_IOW(DTRACEIOC, 6, void *)
> -#define DTRACEIOC_AGGSNAP	_IOR(DTRACEIOC, 7, dtrace_bufdesc_t)
>  #define DTRACEIOC_EPROBE	_IOW(DTRACEIOC, 8, dtrace_eprobedesc_t)
>  #define DTRACEIOC_PROBEARG	_IOR(DTRACEIOC, 9, dtrace_argdesc_t)
>  #define DTRACEIOC_CONF		_IOR(DTRACEIOC, 10, dtrace_conf_t)
> -- 
> 2.18.4
> 
