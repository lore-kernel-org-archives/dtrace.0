Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B13C14F90
	for <dtrace@lists.linux.dev>; Sat, 12 Oct 2024 03:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728703813; cv=fail; b=ZglklMlJk35wPKPy7RLGlBe4+hkX0ImD6AEnPzXQT/cUFcSrDreey3tpEW7DxbNLdAarfbPqc6Kz9z2R2+kUzhaoUgOjrk65kQJUZKriVe+GeGNwroTLpoVwbv9TLVEF5eD/+FnOy+uPz8rVZdCU38s/hcMzEeZeUmcdkg1f3qU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728703813; c=relaxed/simple;
	bh=gCGiDtt6OxQf8F+Nw1JI0iLMXio6kgckRk8Rh5KEahQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VBHSUv2UK+VYgCsLUQS6b0Y2cEy12he/VRQo2PaFWkblGxPpn9LB6tDvhnhtWhQbGpSvPAPnIocKMmSRIee7nc3w2VDa0pzgKAqeoQf2Ofi6SVHklivTx1dr4tSL6EAbsgnsscc9z1QabJhCjEEfgx4h1ZrgmGgpyb0txog62pE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=T5t6tEcQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iOkS7/T8; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="T5t6tEcQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iOkS7/T8"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49C2qm3E030311;
	Sat, 12 Oct 2024 03:30:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=YJf25OQCOzJy56hLdo
	HLNpV0Y1Ath7kdBo+oGJtgr8s=; b=T5t6tEcQils6NoMOAD9EJNuzW1mWvervHj
	0RJ/HLOSC8GyMoCFa/eR5VQTz8T6DyjP3Ma2SPGPquKhYEsMCTpImijtta9Sy92m
	S5Ms84RO16qRUSWUcPF+C4uAPcA+n9XpIczvrXlHnGG2TMOaAyOvh6pSHqP0E6qt
	VsfRjokJuoR5sGiNtOhs14m6YXdaKz0QwQcHJDVia5wHVeAr/Ajj2WQq/5u2jCUG
	nLDX01sQ3eBNKEqikGLHVQG9GfI3ZsRotvuRAlg7iDkdkUXPSg3XPX/bbc+XRgYE
	s1nw4tYRizWOcNzCwc2txQEvyFCaUoMUdHZMsvvYI3ApClrdDHxg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427gq780jp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Oct 2024 03:30:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49C1XCOg019986;
	Sat, 12 Oct 2024 03:30:10 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 427fj49m8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Oct 2024 03:30:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yTssFQjIaXZD1u6pLO7/LsxZXeK64cx7Q3V6slaKdEkCxD4e08AwEPaNfB9yBki3FdBffQs3cifIOnPu+duvgJHOXXnVJYwfHcXLaJ5To5pEjqNbTWEvQHbUraX+gKxdJ3GD9IYf/1gEMLgGBC7W3g9dL4HRC+k8lJWcgJOReIT8se/NGlRC9g5+q/O1g/5E0YPRhyjdL7/c3RQxgbPuozOQxL/P+C9q6PvLR3vtoQX1utFQyE8NVDxZLcsp7II9U9pKIlX/76R2xtGugvMnqJQUxauJl0wC2znJYbaGuPNh9V9TQqDnyDw2m0qx6umc/caHCs0QBu5bruwSrTRRHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJf25OQCOzJy56hLdoHLNpV0Y1Ath7kdBo+oGJtgr8s=;
 b=Qd0aZV0frOvOtQGL3Cp1AyHiKPA4/OmpIVXqNkTCfDJYbYSSjMmaPtJCmEpsj0C7t//FDXPfdJdtb0RkDt+7wlzrm5V2QhYblWQ5ByXdxJC6xJUDM2xJg16kDBtRSu+9TjbXsOO3XyzxGK1dHYdFbt/lOYdEcTNuD1F7cO3Y1QD18KtX62ZE5Mcj5y2D2QaBmrv6YV+fzrsPxZAzso0kpIaO5cHPxtpfPA/74d96oXgDf1gy30Sx9ertrGSrMKjzo7JcfYycFhyEa+p+f2J6AIgoUKpyFPbJtIaqSy6WpvVrXY+98XySZc6Me1NiU+WFL0jzIt56FeEC4xCVBXq0xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJf25OQCOzJy56hLdoHLNpV0Y1Ath7kdBo+oGJtgr8s=;
 b=iOkS7/T85lk/VklT0PWLxKy20yFlR1TbsysByct9IXYv4dInmVRSyG15nbsheWDwzT+IWnn0DRjfcuafNxxA6AnhGTtwgN68WyM0/RkwBxsBI0OHTxrQqsEd7tIvhGXeIoywpDKGwH9WL5xST/cjWTAuRKvjQPvIyBKk899tPwo=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS7PR10MB7132.namprd10.prod.outlook.com (2603:10b6:8:ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Sat, 12 Oct
 2024 03:30:07 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8048.018; Sat, 12 Oct 2024
 03:30:07 +0000
Date: Fri, 11 Oct 2024 23:30:04 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Sam James <sam@gentoo.org>
Cc: dtrace@lists.linux.dev
Subject: Re: [PATCH 2/6] test: fix broken shebang in tst.plddGrab32.sh
Message-ID: <ZwntPCJF9sU7EgYA@oracle.com>
References: <7a1c6618639a057dc267d2e0dc9c9d8afea6b0b1.1724962546.git.sam@gentoo.org>
 <fdd1e771719e70c32b6870d15fe77e2a8afb6777.1724962546.git.sam@gentoo.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fdd1e771719e70c32b6870d15fe77e2a8afb6777.1724962546.git.sam@gentoo.org>
X-ClientProxiedBy: BYAPR11CA0070.namprd11.prod.outlook.com
 (2603:10b6:a03:80::47) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS7PR10MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: f4420dd4-a903-4634-52a3-08dcea6e2b84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lNrtJT0bMRBXBoXmeyF0r6jkqE7A9MWmVAH3e+L95gso/ZJlEdlvj9H8hvBY?=
 =?us-ascii?Q?XDCTQbl7i5n19C5w/RQFN9WUoijqJAQ2xFU85YvvMYUCL5qjwbmt4fjgrMhL?=
 =?us-ascii?Q?gIAfg7BrUWjEGGnuSVcLGYBey6131ikzfnGWDbRzAKxyozxlWre3rqDctR/5?=
 =?us-ascii?Q?LkB4oxrhNm0kRHNDqAoDQz4FoXjyUiPOKjJQFufUc/RkGaZoWCc4nwi7gYmM?=
 =?us-ascii?Q?4C7eHQ+tsVPyVpu39xyJfwRNEjXczPUFVx/Q9JfJglsr1ZIB17jamp6ivhlf?=
 =?us-ascii?Q?v3SWwovA3xgC6dDXKfHi/JEUop6HZJ/lAmtlqdDQn9467Ph3kQNlmaLDZ+Yv?=
 =?us-ascii?Q?m1Nb7Jax9BIQnK+iKQ890E5BqVVkkkj8hSlQX2pTvhH6/0fC63Rvq5KVcFuK?=
 =?us-ascii?Q?lUUDyt1ixHxAM+SkiS9FwzxPE1UiElmgoRNyV+tCHHs9dmyiU1l2wEBdpdzL?=
 =?us-ascii?Q?XN4S4+mrRp5Do27c/xdDuSHfeZ32v+uJLdmD2rBsBTxOvq7NxyoIyT9l+LBO?=
 =?us-ascii?Q?mWhkciZ3URgyPQ1aU3wQpuzDqrHevxtO91lHVUR96ilUvwpSrFkHdT5gW5eq?=
 =?us-ascii?Q?n9yu8eKJ/icYDWnO1/t9JHfiL0mNkU66sGjsIPpwVL/R/AnOBFG2Zm6ZgPW4?=
 =?us-ascii?Q?EWNBNx7TpC0iOeUxIIUZbkU50mCyRF7Ybhvd52gBPE0DBbmWbbCcyMEeWoJc?=
 =?us-ascii?Q?JB/mM+4sFMx/eL5KrdLK77pM2NYnBgs8G6uQ/Zj+EFFlSSnIn+C969ZsHiEv?=
 =?us-ascii?Q?gVGxhIGvUXbhx8g94XtEZPggLg8YJwhvCPdpZ96FFbFTxgYfY9keLQ+fIT7s?=
 =?us-ascii?Q?/m/Oe6uCoj3I40oIuhQKCYtdipeYs517spsdcp1yXKt+uj1yf4LtftOMIRL8?=
 =?us-ascii?Q?1ETCcjlE93op0hIb49lsoazOwoEY0u8agSVJ5hEPhTlgE6uCzRVP12oknaG1?=
 =?us-ascii?Q?ToW/ryOxMogko6AkI610x6JoRwlTsTAFcm+IBpi/zA5gDdVDb9i/5iYtoXjX?=
 =?us-ascii?Q?JiaNVCWYMhnKKRxPiLivYdKpAgzv4S4uv6bL/eDjil2RmB7uQlCr1Fishov1?=
 =?us-ascii?Q?bPV4Wh62MTpyWge4ki3fbmkqifu6Wn3nZtfmmJvyF1shM5aIcgh4Y3tFfYdS?=
 =?us-ascii?Q?0pIvlXsxe6BywokIHDa9XZdQDFR1WoE4D/lMkaqwlR32pH72ImT0VF6C3f6L?=
 =?us-ascii?Q?O67ndSYZKtO+vTHeuqAJnDtuUw+Hwl/c26N8lRBn3AkaanF9LeWIAQM9TqDq?=
 =?us-ascii?Q?qk5TebXr5MG4YWzxc7StieW9FUADRDgNL8WDy3WsKQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gq7n8kbaBQJBJ2nDmOHQeyVaGtG8IyS6dSTv5fmsMi9LM+TUuasdRRuOmS7j?=
 =?us-ascii?Q?3FdPjR1M1egKHDRqmulksWnh+IE7NRq+K0I77lFTgXkBhvXLy92TvSQavXXV?=
 =?us-ascii?Q?uKuTYB1rwpxJYBoBFwSA/1TtH6Z6prSW4Du77mkX/ATLJH3aqinaWCvDD2ds?=
 =?us-ascii?Q?knLpQ6TwSnsL1LpuU2Az07NgSy/Z5wSPYuNBLWW2Q+KW3VFGR4q6u7+SXjPN?=
 =?us-ascii?Q?Re4hvNf2tepbk4tDcBJjmBby02x8SIFHTneDy6UPVrz1FzWlLRvVpzwTrsWY?=
 =?us-ascii?Q?jlz0r5Abh+AM28rJgywZgHrtc+iqUqiccK1midi2yhME3vWApvaEEvBrxiGt?=
 =?us-ascii?Q?byExzjgV4lRkZ2adD6zsYFh+NSIpQ1vRn2hCatrO14gJvqed64aF5M0yIjdH?=
 =?us-ascii?Q?mM+2HY0xw10rn/RQeleweCY7f9yeoLXy+o4t10A9viZUH0Lr3y2t9Y6rub0U?=
 =?us-ascii?Q?hW0tKvQAUT4+IweVZvGJj9gEmRPJAoX1KjHSRRWvcTUgCodHEVmmcsrkpQ1C?=
 =?us-ascii?Q?JN2XKx4IEPFARPh8rkLUpJNqyKcbdIJCoOpCflZgRC1PKYEsPJf5BdU9chI5?=
 =?us-ascii?Q?7YWQIJ6Acg22xXFAWFCN2sVLTuZDFNiR/Zj7RecR1URcIEra4pmGvT9eUrSY?=
 =?us-ascii?Q?U4JE9vByk0Niier5gWOSOPLdAkctbqucPTkYXE6rTURBkO5PDX3NgS4WlPoY?=
 =?us-ascii?Q?EW87xJmCnfWUyrJzoG1AI2Ve2e4qibbFMP59ezjSuEESwTJ5b0LbR3QMYadT?=
 =?us-ascii?Q?5zPtITP3B0oihpIWw0+OQ1muQoUA9PSwVoPqMezpag0Y8rv8t1FlGYVauKiA?=
 =?us-ascii?Q?9ZChY59Nq4qfVKyZfyzMUP924BNjQ1Q3IZIGwWI0eBaMm7y+oMKAUQdKiL+L?=
 =?us-ascii?Q?ndDpoGWNPFKvre9oZrv5YpX3ddr4NJ1dYuuwBz9F+bjJQ2lzUwyn1PgLWfDo?=
 =?us-ascii?Q?Zk+wiUT/O4bVpXB26jF5MIHwx168SKZ3pzsSQms6xi88voj9O3XnFBmbP/8C?=
 =?us-ascii?Q?b51emDQBzWxAz/a1wUX2hHnWBseBY3rmS9WI8Nke1l3Mhb1H/QYdUotV3krB?=
 =?us-ascii?Q?ap0XgF+NUA0t9btRKntL0fe9uUGcykmPNjYVVz4Wu7C/rh7XNMlt6Zn2Lfdv?=
 =?us-ascii?Q?xRx3he9zSKnM58SXJzeOkR7RqwSa0sBRd84bM6U+hlczy0XXKAeb/OgLtFVf?=
 =?us-ascii?Q?gDak8oW8rvjIE+jqUEknbF3eO/XOTyf7KNSc+fJPUpIjnhw3dBMIkc8+6jjr?=
 =?us-ascii?Q?5yA8ZNQkBUIZSw/IqfaZnBd2/vts8YrLntisaxMjhQWIZ5uE82CY3YcQuXLQ?=
 =?us-ascii?Q?tgkcv1C5wNXhe9o9y23NioA+RzNiB0tV/lBd1G/oVCeoMfNo4yxoZ8pIRZEK?=
 =?us-ascii?Q?Tg4xEQCwvCImJ78gX/NfaqipnPLhD5nFfqkrdXTsDkcQndZl8UXn48irxIpy?=
 =?us-ascii?Q?bhEXiv/sdfh8DjClVlUtgoZOuKjzRbiVT18YSxIAx8R0OsE0I3/zq7DyBZ3M?=
 =?us-ascii?Q?YBJkDuIV1mteuvdeCqeFCoRHQhuVxPan/twp3zo/dcZ7RrvjrOwqX4nOGPTr?=
 =?us-ascii?Q?KLkz7kWiMpA22C0Uuu5A/NATtmb/KnP0zNxPc0fLmtNGiWE6eZdkI3i/MNZG?=
 =?us-ascii?Q?UA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KQQkDmINm5Gg2H+7aMe7GBu0U+72cMIpCBxyEsWAi+Xvm7sNBEgazAcir6tfarno3DaiOXQ4eWZ0LgJguu6wgvQAHFtnIVXf4CpyQ4R4yxnswDdH/nus2isH+yPB5bhqyt9KZSJpB4ypMlsPhLlWBrxecKXj9trPs2fTB9OLPid8SJLZIDGTiHVkWuDFmCR0hOdqvLctf9WaMsJ9Na/MGP6vfmSQ9C1wfgMw5NfoWtl8dv2QhA27Mtu6d/pBF8ZQCILm0eSTc18O57v6LF59ZuoUkyw0kaRu+6JgEKEtvTLY39vJZENMskhZflHKvpilGrcLr5BKXXfhG6Yn+KrQDIc3H29H+dGfRE1m7XPx/UhAgj9QnJhE6lZ41Uod85lT814/cQyrCAaPWvH8hIQqB8TQmnf5orIywZ19JdBVhFc9ENmaxKpwjXzbKvFDFe9zElKcYHmyx1XpMEeX/odP+6CBTd7E35FHi9UEpPjkLGzuCVIamRJwa9WK34C8LNoQs/pEhGm3lZTCyjspfu7qUbHNJLMQeS+J36cIPtPCzfKC80AF8MJe+IU2xUJyXkBLeGuL+RhRrGgkG2l9mqc25IPUvnRmclBOdwjya3aj3qk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4420dd4-a903-4634-52a3-08dcea6e2b84
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 03:30:07.8424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1cMPoFAa3GWzsOu9InT3W275Hbjeql9X2rp/XPXYqtRmZ8X2Xe+e2XHpsB+3YvCNyp3zttQQGN3+k/BBZlPmQygpxhHZ5YxREG5lqywNO9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7132
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_23,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 phishscore=0
 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410120023
X-Proofpoint-ORIG-GUID: D_7Z9ubIYnEviRW2Sn0UAhkpS8jiWchF
X-Proofpoint-GUID: D_7Z9ubIYnEviRW2Sn0UAhkpS8jiWchF

On Thu, Aug 29, 2024 at 09:15:42PM +0100, Sam James wrote:
> shellcheck reports:
> ```
>  In test/internals/libproc/tst.plddGrab32.sh line 2:
>  #!/bin/bash
>  ^-- SC1128 (error): The shebang must be on the first line. Delete blanks and move comments.
> ```

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

... and committed with Signed-off-by added.

> ---
>  test/internals/libproc/tst.plddGrab32.sh | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/test/internals/libproc/tst.plddGrab32.sh b/test/internals/libproc/tst.plddGrab32.sh
> index a22e2367..c69213ac 100755
> --- a/test/internals/libproc/tst.plddGrab32.sh
> +++ b/test/internals/libproc/tst.plddGrab32.sh
> @@ -1,4 +1,3 @@
> -
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -- 
> 2.46.0
> 
