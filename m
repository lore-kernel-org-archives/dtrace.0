Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6D13AC28
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724909001; cv=fail; b=Ma5flN1xyARU6x4kwsqry/p9QyGu+lVygpTZ6E/cf2nleratihXCvEMuhJf4jDAVWWMa0kr+KEmkJ8kE+ijh2Mu7V5RlKlWwysIKBOcx6R7WYR2pzyP4pdafodl6omx7VTzlp0wzG3t6+PL1zmi+l2FpSwrQmE8SBHJmshgwbz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724909001; c=relaxed/simple;
	bh=R4qBSxmLXQz7tdDLuhnA/2ABPaopfSA+9Nuf4Xlk2xM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NsJTFaWq98JxWHpWF3cdR88mr/OWn+tXF/xOim8fkMtm5ewGN9qQnMR2QPKQ+01BuDj9SAXzGjrdNIkupymG3cB9zAcxWsc6vFliFfWEMUg35bXus6RRRV3LMBNy2pBgIaF1SgBBZMNKPZSQDGz8xbB984bFpPvnrlxX7ptSwsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Vh3xDjp+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qvWUSNl3; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Vh3xDjp+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qvWUSNl3"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fXCH032613
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=RaZ9/3oZm1QlE8
	akynClk9kxq0ATALIvOUe0ld3s/Kk=; b=Vh3xDjp+WMQ6vaeJnE8MYy7xKoTFkH
	Q+ajU+fPbA2HW+UlKod+2e5Aelg2aQLsuO36xx0adRo9NoCB9MLpPf3z9I6ytt4m
	i+ncK1laoW+caCxYG97lSUhOOvR4E8Q5we+zN0dGA8CGimcRoT7VgGm6O6UJb/kw
	EJWKyvIkhwgC2HHsT8HOiEbUPa9uBxzzltsbu5E3Bt20Ke4de/hMTpeQzpJWWnBR
	RjVSaOIKIkv17/+d1VYWM7a0QsrLT30BvQme+m7H1sbp+qRNEVh11YV7uD7CTsqx
	2h4EindrKI+ffPVChG8wVxicGFWojZ+7qQItWvKTXkdb1qS2e5dv1GAA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pukub59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T5LA8r036511
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:18 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4189jmrpus-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RuKgyGx22Ms6UvBr67yuxyPo65fQrxgmo5H/ZxkyEJs5e1QuyTKRiQLZ5JktEdtOHs4aZt96opZiIVvxAk11LKi0lnBN+Z6o7lH80DjjM1Z8PAbMY2Ptta41WQg5tkVP0ocPNrMC9a2yaLIQcKTU2Q108jlb/F2vgre5N5mA51DX8xu4prXVQbfrbTu5xvYq7/l87lzxw1RNv79TAgY7u3D2W05uOnHdYLwdjgeZ/u7C4alAyxRveIUBz2RCUUQXGj6gbCMK+b0jplV/uSH26vKU9k6mEUQfc6JWFQUovbFMH13G/dCesTQLD4T+ytb1OMiEUySyDjDXQrGNzafTZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RaZ9/3oZm1QlE8akynClk9kxq0ATALIvOUe0ld3s/Kk=;
 b=xfJnvxavSF5XQCs/yys41VCM553HxUnXPFawEe+kEkl4r354G4Ruxeyahe9tI0fEQecFcUI/1uNL04AfNEtlmSSLiIFmWDk7GvZbpkUXtUrdGVMfvt8m8w83EheB4+9sarjhMvdPCnd+evKY8zw9AZO7LWRhQQAtiqqjxA+jhd9Y1IsbrFZeWZBzyY2y7eeuyjP+l1H31hy9OnmDNpEZa/gApxY5Ae+FDZvfxLiKKeHU/3Cnn/6JxOEUqPQ03nmcHp7LwVcGKV0wW1COrS+2pI8nbgpR5QyrIP43MeYo9B8zQf4zqya1IUV3V2Cg7lLTICcEEys8R83o+W45oNXioQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RaZ9/3oZm1QlE8akynClk9kxq0ATALIvOUe0ld3s/Kk=;
 b=qvWUSNl3oArc074GIsYLlF8gXvI1AE4gJCZsW7RsJEeC04qNbSDk7fBbvAchZ3pS4fEV1kYgmyhrfp/GsfolhNsT27WtIZwN+K9iJpnVUjNqcATcAqdvSTTDyYpD4LVa+/9coW4YC2wlEYsZGiQXetbNAg8QZNB+Jx65uhkaIp0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB7008.namprd10.prod.outlook.com (2603:10b6:510:287::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.18; Thu, 29 Aug
 2024 05:23:15 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:23:15 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 22/22] test: Update tst.newprobes.sh xfail message
Date: Thu, 29 Aug 2024 01:22:19 -0400
Message-Id: <20240829052219.3234-22-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052219.3234-1-eugene.loh@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MN0PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:52c::17) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: d379d7ae-109d-49c6-711f-08dcc7eaaf4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r9WnFhwNwT6Dh80Hz2gRvaLR69VUdPElSBdAc3ZWcT0NnHEVFB2JCZw+stRG?=
 =?us-ascii?Q?b+EdFIYcxAX2pAWS8CTwaVY4G42vGDHCz2N66xVJ1/T+LSeVnFjKIVk10bni?=
 =?us-ascii?Q?KyVUbEjvL6kGskCFOQtxAoBpG8mWbk/EFkKJSnfbjEtXwHA7Hn08BwgBIm4E?=
 =?us-ascii?Q?vEtnfH3paz7L+tI+EV3ZrkriRYPTupeuGnYv0EmahT1Jiv8BKiu696z56vHc?=
 =?us-ascii?Q?PjYCDC+plZKPI2Sh9wJmvPJhirTGMhNbEECGNgm939yOLz6+BYrQcguDHAmY?=
 =?us-ascii?Q?tpuF98zJKEQQRR4DyI6UXX2cR+y3D0hD1Mq/yJdchqs2bBJtn3sxj6dLlnEG?=
 =?us-ascii?Q?nrvw6hwQbl9Rl4W8UcLf2EtroFU9L10wJxo+cGbetslCLKBMkjy16wpuFQw7?=
 =?us-ascii?Q?urhBCdyan9kt9nWQcC93sid8vC5JLoK5GFY/n3NGOXaLdYER5Yd/rusqYS4h?=
 =?us-ascii?Q?6JdBefqaVDG2RUCsyW4KZEo6jvedKqJSZ88MpNWo0u6mxc9Vzb+wBgoIVxjE?=
 =?us-ascii?Q?z8nLkH5cCofwvDmYeROJoV3+9eVX/2IEVmmFqUEdc/rKygEw6yIBfR9V7np9?=
 =?us-ascii?Q?TncXP+l1k7tVOkDCL+bIJTG6alhxVFSZi13/XxMuyVg/EpG5jtZkd1kcfybD?=
 =?us-ascii?Q?QVMxhCSgveTqDHT7v7DXufmsPbKSYixmsZOTFszbcuQgJ7dOC+jJ2ktzZG7H?=
 =?us-ascii?Q?ZpUpUrumMLJ2ovbwGEvP3fsqOFBU0USFtAj4wsW+YcUidaGaowh+FVPMR/4A?=
 =?us-ascii?Q?ddjZJZkiY3Ze06RGqX8vz4H4FcLIbsBF9a2mKHO3VoxUr0q63SCBKNTV9mo4?=
 =?us-ascii?Q?8waN13pqcsE5EClyX6KVpWLQt888G3HOt9L3oz2S1fhvSsizRT2ARh+2rDNI?=
 =?us-ascii?Q?Svy7LvoJKfwMOcpmQ1XZrFDsWJCNxfB6WHcvO4nApC4oOBaQ4vJm1rsbmVC3?=
 =?us-ascii?Q?CbcyL6G1yrBOxbTeHPko5/r642R/WiwVmHN5W4bRQ7rcIgms9vMgHwGSkt69?=
 =?us-ascii?Q?HiIhD9KTZsrKwRKXxSZ0YmqWAMxlQ1CLOxL2L5JjxEzwKhm1osKI1x/EedaE?=
 =?us-ascii?Q?Gd9eUw0uvvkYRRJlUW4MaQAdAhfeuz6ZEMjnyQu34Y9tGHUFFVmJR4Fvtj1B?=
 =?us-ascii?Q?8MfZeHskmy9tomjjPzscxju9PM34qSxhy0aGx9us6WLM4A5103yhvsCgTawt?=
 =?us-ascii?Q?ZNy3wwG3rQeMCuFxpO01eEOwi/ZB4YgtPVxdx2UupDs8jkve0s/BGn5C6X4W?=
 =?us-ascii?Q?gdJdbdZjisW20HQPSmZ+WoWpCRVT3fKXA55s+NPIk9l+sKwrfdTsgy+5T3zM?=
 =?us-ascii?Q?nKE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FJ+bCPRuK0/KgKyvxnW0cFurnopOrJsd4LKy/yY+lS0C2sGRk7z4k7i3fwuV?=
 =?us-ascii?Q?k4K92bQyDDJHGdLuPDW8jx/xbAX6AOIG4qkwHeYaw9kzoJxdRVg/TH2I88l/?=
 =?us-ascii?Q?+8Jxq57C2pwur9bgV9/kOBqfYTI7he2Q9aPNQyP3Np5FajkZhd6VF8MnLW+1?=
 =?us-ascii?Q?p5eOvv96b4Rs+LvghytAtmakOl31QEOw8uGw+7/jwTdY2x5EJAqAXj4zRjrA?=
 =?us-ascii?Q?1Lfd1Kg2z7qa34S6ku6Yr5zxQn+Fk3Y0umNOZypy3lPmSjN7jZwF0LJoAjtf?=
 =?us-ascii?Q?bDjwfgAxc/I/HnUPGQ7RA77VuYdumJDNVO2B+UshKshMu0u6pxka0IwDOSs0?=
 =?us-ascii?Q?4bUBIFJ0lD/iaYWle4wC77tKSaHTcX+ZOGXe/87smwDTbfbamf1IMNF8Nn0q?=
 =?us-ascii?Q?7tOz1wKgptaq1GkTHXueEPgKuTm4g1T3IN+Heq0MrDfQhDBWp3Uehi5/XC3r?=
 =?us-ascii?Q?x5TeJtZXFKu5by4hymvffB3rTMmWiCqCJkPIaIVY0giL+e9fBpE/yCNfJIBH?=
 =?us-ascii?Q?EcHV6WnC/xNI5Qk/FpMzz2D4wBlPAwGFzfMtzrs+wjCd78yu3PNJ0OdzO88q?=
 =?us-ascii?Q?oF9PUVpipWo9Ur8ynTpVIMkOaroZnhpO5SOPZ37DLH3BiIcSy/mMcj+XxcwP?=
 =?us-ascii?Q?TF+L725e10SHAvnaaCfeIE6n7WDdZfAvYtBMRjQlsaQTtQBC17D1qhDJVjdi?=
 =?us-ascii?Q?6yzOueWyCFt2DAW4zUumRFEm90QNV4z7RA2+dR6mKyf2lAeRZa4dNIFiscEt?=
 =?us-ascii?Q?u0i0k2byVYzzsdoIEgW/R0/5fZVfzUjKYrg7cCCtgkndtVWXysTguB/z3SeD?=
 =?us-ascii?Q?XWSm59vqykkDRKa74YwS/X+937WdHd5tbjWi2Ge3lGMCV5MnfkSW8HsKMKfe?=
 =?us-ascii?Q?Zb7e5b+BMBIU+KUyZO44U3oCrW3plKBh6dtmODK6mOeH8I5QpnaZ0F0RnK4m?=
 =?us-ascii?Q?w/Sk+tJAfafdbME9ULPD2O/lcGF9SGLPAQOisB1obyvA7u2YlmcZ2QPEOLoJ?=
 =?us-ascii?Q?mQPR/5S8d9B/P4abdFSPeCeGPPUafgbquNd0tx2aorzp3vPX6bgNSs/Z7gvo?=
 =?us-ascii?Q?77AlVgVSDOFWrinXQYX0OjqpKLNXbatxud4WATWiAl6hEnWYpXSa7ISe2elA?=
 =?us-ascii?Q?m5RVsn6P92HrRl5taLUBXZyUPxEK50pUFiNjhWYznsEsPBxH4NsYbwAIjqW9?=
 =?us-ascii?Q?HOwG0XtA6Okq22CBpS2fcdnbxxuJTk1mNvLt7LboEgz+aIM/BCeokkZOMipq?=
 =?us-ascii?Q?aDrH9OpiijAjpy+ZYTF71/t/D0xnmYoc/N62HL0MI4aQTo428Z/GWVSSwZ0q?=
 =?us-ascii?Q?WxHBzxSaOMiDMJ8YFZAzU1QVT8gg6lNdUMAzUkL7GmdJrvpqpn1mtDRKbWgZ?=
 =?us-ascii?Q?MiDUQe1sFmjAik334kQpajMHdQE6TVZMVMWXOsZVZNG4haIKFPIBg+VE1low?=
 =?us-ascii?Q?GNI1HGZOoSpFzkVMMf7r6jW2G9Gxb7VuJ9oqS29PBN1ST5LUMrYXt12lk72g?=
 =?us-ascii?Q?+olMIZ+ZtXFvMIs/50X8CFGyjDpaT9RRvSMuuc6IMWkVuGwaS1STDjHOYvdB?=
 =?us-ascii?Q?gZrqmW7I/keSftN1ZojKfrfjIVi2OsRy+Dn51naY?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sC40xf5cxYNjssHVq2qd3GOKsRsJOOSphr71Ij+zMGHxQclNp/oker2YMGc68ZIJ/B70oTcs2h8O9rpnXVgtI/T3aSDFRs28jPPyImf0+OHXFSAHIBlDzBTE/guN6kXDLF1/hx7V6TWQ2IbE/xmQ8Yp9oURkWlBkSmiQZOtOVv7nWnS41NQsW/uvGmRFG7joAL6Y58k+8+RYJfZUE1ibkhO6F5EPH0sMm3FFIJtLmjZ5TA5MZAmVvGewFOl+2JMgiTTF/5LJa2/x6nliobpmEWeBvFfgsllD89ghJmp6G3eiNFmHGa0uCkkkWfhDOQg2ANSiqxgKznRs0jyG7GeEji06ga/b1fmIk5aQTAvJNVFDx96hG/MfSVGZZTR4e4gBDtjTJJFdq7gRfXdVbKpj9kpRKGILLsHpo5iiP6Xd8+yX331PCNll196VhOQAZZgS6fmo/ADJ673SqHsSdQs8cV8ASr8u+RHchSjup+Cvq70oUdVUeXiY+jrzkHOdbzCozIHt/E1YPu+AVJ5MVpfvi7HXFo3QfMrxPQ5ubDAXUPTu08p43Z8fTS2waEQ6wpEvfOAZE502GBvVx0DgDc+d7XI+Ngxj0k6llRRdCac7MpU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d379d7ae-109d-49c6-711f-08dcc7eaaf4c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:23:15.8973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JlHD004J4WbTzd0iDdwos+UCt+AiQ9mN7sZK3WDwnSMkSdEENCyuoviCkVfqFIj0jplhzuo8ufJzqWCz9YDkTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7008
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-ORIG-GUID: PWzCy3vqnYvWS2N8kROJYgc7QqaA0Zot
X-Proofpoint-GUID: PWzCy3vqnYvWS2N8kROJYgc7QqaA0Zot

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/pid/tst.newprobes.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/test/unittest/pid/tst.newprobes.sh b/test/unittest/pid/tst.newprobes.sh
index a4944688..1a88c3a8 100755
--- a/test/unittest/pid/tst.newprobes.sh
+++ b/test/unittest/pid/tst.newprobes.sh
@@ -6,7 +6,7 @@
 # http://oss.oracle.com/licenses/upl.
 #
 
-# @@xfail: not working yet
+# @@xfail: we do not support wildcard pids for pid probes
 
 if [ $# != 1 ]; then
 	echo expected one argument: '<'dtrace-path'>'
-- 
2.43.5

