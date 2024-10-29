Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56D2209F2A
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 21:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730236790; cv=fail; b=Og0/DqoptSeNnAz3gfl6wOB6M7WfbNZ7shHxXobTo+AemWekOnyZ67a8Jm7f9qST0/8U5I9ZJzzQae9N2CSMyCsRyeVUvD312OYWYF8xp07g7cAgPXQe4pNJCZ1PZwtSvVNpjetCC9L4tkYgHkAukoYTCDuW6U7fL+oP1YYUNik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730236790; c=relaxed/simple;
	bh=olol/poUD+HDk1VxVhp8mt+hMHfZv4wLn49qOlt7/Fs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NUBaGnmfTC2scYORXeASKckOzdXh2B1+/AncKu373YTtzcY3QlUStHQVy6u6zntXKzEuwymYMFTw8IUhmn8uGaKlbODjgu8NcOS/EdJ4shOENwY1dOuu2i00jyr1IEmHGwPj7n5Xg4+/G9J4WjU1C5U5lHMLZ0t8drPeaXgofbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ASgQKXXk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xkIrYYer; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ASgQKXXk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xkIrYYer"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TGfWqG004318;
	Tue, 29 Oct 2024 21:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=oETVobE11oLMkWSAjc
	CjIHAOkVohCEXw1dJLP7RF0u8=; b=ASgQKXXkm6jOe24vIQytpCOQhcmCu4hCor
	czzrss95jT+nFeJLsLDOAC44glvJraasrSWtxZENFdubf6rzGtAJNkQpZAbbJaB6
	aLqi/bHKAIJ5nDw64dCTaTh5Ge8M+u9dTpMBxGpphHrkYcBZwtuzp8xdcZ8KaKbz
	+A1Sqfx6DleWN4/OZc22XOhcag40x/eIEytHJ0rbZqLiUS1ljbG1DrJ8mQGzmB3K
	ZoFL9rRi62G4yXKiGIm5lD+P31MDO6497070B97D8NMUQjOCM7GRFdSOZjJiG/Ji
	YK/N6rKAXQJAD7oJ1OM/Hr/GBsquFWnngzPQijTASE2969OuDwwg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grc1xjng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Oct 2024 21:19:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49TKUlI3011765;
	Tue, 29 Oct 2024 21:19:44 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnad5c9e-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Oct 2024 21:19:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XvG3SfeFoeU2+Yp29zkf5F4Jzm8Gj9sxfL8I5dtghlMm4txIEctTGD9FSp1Hhp5WEYJwoQlwc7A32vdViiJgbVqTshL1iY9SkaPMXmEz3LFdiqRV5nKjEtpuPOOAq2/qrhy6p2bYBOQhil6ctOovn2Kpnql/MqoHMYrAKMNn2rnj8oa3A/B8dtFkcmr5JdLF7YW4PrxoHwzlzJ3VYsYx5I/qxiemNxdMd2r6hELLuq+FQ7a0+AqqcPAYjo9qJj+oiS4KMvbBO0dDk7JKhRd0UO4r8U5CpJuKmSJffyqzKN/4gEqLE+P29+W9p6qLcmN81e5TB3h1A9QhR2sO1plw2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oETVobE11oLMkWSAjcCjIHAOkVohCEXw1dJLP7RF0u8=;
 b=GOnq72W7lGMLw/te5Ipa9mQmBqJU+Co8eHXZfSCb7vNAg7sZmIvwBrs0tO/qFdQ1P/H0TSpN2dHlRcWJ+WlF8IfhD1F521wcO1vLdpqbBNEMnulCjVQcx5ts2K0GeC0/DVvq5Os+0hyYoFknVCVgym4qGZz/mwTcjH9GdklRRPp3dB9q6vfSRfQSwmsH7yjekf1VM7ppNEHNtbB4HJQ37m1Omubnue9Rr5QitdUyNyqSWDLqTp1plV/wqPxI2WPybkRMPTcuc90WXZCuASismsDpWQweDCkbezqviB+N33NCBUjGBAZPCvoHKe+l9a2IQAjZCHu/wW/x5eHCr3cjOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oETVobE11oLMkWSAjcCjIHAOkVohCEXw1dJLP7RF0u8=;
 b=xkIrYYerQag31oR/thZHSqYwgRcs0otFADFMqDT62FdQq8t9FWtc3KnnvxEmyfBQl6I1+rp0MJ6RUsm24kTlmkJHwI8+n+rnEX35iKc8Vld1Pv6SBwwxYtdPVxb+x3k43aG27LBkyMICKhTLoMQus9WngzBS741/7AJ/d/AqAMY=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by CH3PR10MB7137.namprd10.prod.outlook.com (2603:10b6:610:12b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 21:19:41 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8114.015; Tue, 29 Oct 2024
 21:19:41 +0000
Date: Tue, 29 Oct 2024 17:19:38 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com, sam@gentoo.org
Subject: Re: [PATCH v2 12/14] man: add manpage for dtprobed(8)
Message-ID: <ZyFRair0UzjyytWg@oracle.com>
References: <20241028211803.458685-1-nick.alcock@oracle.com>
 <20241028211803.458685-13-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028211803.458685-13-nick.alcock@oracle.com>
X-ClientProxiedBy: MN2PR14CA0026.namprd14.prod.outlook.com
 (2603:10b6:208:23e::31) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|CH3PR10MB7137:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c24d7d3-6031-4285-0494-08dcf85f66d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tvzlZhk67bmGGJ1cWoIdhkGCIl10No6M3KW7fQ+ncwOJS/ZJ3dPgYVO6AVX2?=
 =?us-ascii?Q?LEqqkaX9SwWjxB9dLkM8a7Wf/OIAq8uH+N/r6Wd2CLdgJVcSq1npMtaJ4ksh?=
 =?us-ascii?Q?5JhJtuDLwO5ZOvm6J0ivVtn7s34BLyf/9YO4jlVQbqKktUQbWpixcYw2ANgy?=
 =?us-ascii?Q?1A9tBUhP6SrQeSz4bxQoCLyean6n9mN6olN8h2wmK3hA7pd07aqjVPcjcI++?=
 =?us-ascii?Q?fRINugSpLRzBEz7SCEWfn+q9jzmdW0jgFkM4Sry6dh6NSBDH0zFEXMgzesjG?=
 =?us-ascii?Q?DT8XZs+uklJxNcwhGe1wwb5GxSB1Tllt6upoOA0IN8jmxJPKYgcjAloH3p8M?=
 =?us-ascii?Q?ryWXGK50izo738vFtrYAyGSU0YKjCECTkm98v55T8ljGFddVdgla07LxkQpr?=
 =?us-ascii?Q?pmeYXm/r3x0o/Z+jSnE2o0L3YShdfMktsbvjCHW1gtoDuYse7c8Wg1ovpgZr?=
 =?us-ascii?Q?sETnzK2RihJqUqcxwBQNVBxJhU2HluUNOEszQIapE3HYnieXj6lQdGJJ2w9m?=
 =?us-ascii?Q?HaXBW53oLveq9kIi0/QZ+CJe1GBCxxRWo1Y+Won9SrvORS1JXJHnLBbQQ/2B?=
 =?us-ascii?Q?VkV16B7zuFhyLOvxl4TxwpjVa5/6S4Js+CTrXHDPCLlMj1FNo+AUGwlOhgxh?=
 =?us-ascii?Q?RNjLqMEF+053CrWhWkDkIeOco3A6+YkzY6J+TI4s5KNQTyZdM95KoBk0cIga?=
 =?us-ascii?Q?BlqnPQZSRMkk2ZkjzmpIhepUYBJd4SaX4bGcpS7ThGZ76R1FrQtgamgmWi2M?=
 =?us-ascii?Q?tsFeKEyX4tzuCJ6A1qx+VYaL4axdIIy9o63PnjxWUmvuuE15RdFQTfQ1D+aA?=
 =?us-ascii?Q?Z8R7ewnfacwpElxzUv/VR5ShabzFu3PVBIszcZ+iI8JABAgYCpdoQIv+qeqs?=
 =?us-ascii?Q?u8smF/rhSvEr4+nVcl8vw2CZWYazAj8t2ST4Ong1Q2e+mvo8XdohoPmm9/H4?=
 =?us-ascii?Q?sxkMUKWtn9sELx/xGgX3xklVj4gQ6I+I+utPSvwPvDj551mjNSFxQH32vOG8?=
 =?us-ascii?Q?QtWQmxy3h4TdackpekW9JwZFEwSUnRWVzvB5ZSoWcnoWm3uBa4RK7NzyBL27?=
 =?us-ascii?Q?u8nbO/Lny1AmswSL/3VGMwLPaIfK9oMCsp3hNDODMEiPeOMd7TcrElT7JuMq?=
 =?us-ascii?Q?R/la1foFaQ2nfCQeCIeRreSfC88z3xjzQad7IRl5dePJmsv3yA5ItnDVVkKb?=
 =?us-ascii?Q?gQRWkzckGi4xof5I8EIGMoH8eHoqi0ChhZz9P/zJ9RGsSzbDb8HAJjLi0EQ3?=
 =?us-ascii?Q?1ImX+j0SBssKT94mmIezP0i/iqDLc2ANlVj1PBxnvQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Tu/im8PLYr0jt8EfAdV8rjxlHgSlv1GH2AUIyK0VEkbuQ+58tfwPCOc/OfEf?=
 =?us-ascii?Q?U/rTDmEKsXlhF3rw18Y+GcafYfkd1HIBtim09X3V3s5WNZeWgpUOQdChXVXV?=
 =?us-ascii?Q?lH5xqYjt/QdUPsNKM4lKd6NQAZNKJFwf/ZUy3PtEFBxA65uwnU9D7aDcieOz?=
 =?us-ascii?Q?uSDKfGoUTOFAXfzwornusur+FsFUF0c802Q+JMUXKq2y/uGsmAwGfreGjl8C?=
 =?us-ascii?Q?cHnuBkFzsEdjkqZL3kJjpPDBpHDuPUX1bZLP8As/Ub/T1m8RCyktNc03o0la?=
 =?us-ascii?Q?LEt+gZ9Ikqdg4wIPh10VP281SOkds5ZCdDwxUy6ci09KdJG5CZh5Ahzjvqyb?=
 =?us-ascii?Q?ZaSHHrTeb/ISenUF3reoJxUp6vgbuuk4nbR9KuXc0L+OTkKyP00EW83Jz/V0?=
 =?us-ascii?Q?56jyb1lV+EBShFFiVJWQdRiIL8IPCz+l/M/x5pLiTOmKVlr5U35qGRNYuy1M?=
 =?us-ascii?Q?n77ZPm9iLKrbCGrafHau5eYaocO7ExlIHWbjXzBfucgThYwUoSOFhaioTuWX?=
 =?us-ascii?Q?lTEU0wU494Z5IBKLtnx9W1LM1xx3QSpgfLhu/QAExpN2KOisUf+/JfutuiaA?=
 =?us-ascii?Q?lNUFe2qgrql392BKgWdT2OzeHUewDlmh75lvdhjCNSsI/30B2bM5cLNTjuM3?=
 =?us-ascii?Q?Hpo9xGLApf79EZEIfNEIhZ6PenZ6vufq2aRoDZjyvuE/nqfVZn7QVofgifI6?=
 =?us-ascii?Q?IJ9itgjYl+UEUGTkU7u4gGev6Sd7baNCunUMqry5Oi1uPijDdlSxt3XID/On?=
 =?us-ascii?Q?PdBJX3CtDqLUL1gYGdTrMcKCO2OzVxc+/ps2XD3MtKk/N2jPOz+VTnusKyVv?=
 =?us-ascii?Q?2CgMEDg1gRL7vy/2kdcmySW7xNWEJNaHKDE4rweMhfBNw6Tb6a8bGRbW625j?=
 =?us-ascii?Q?1witCj1r4CnrGCevNm+3RjAf4CyCyV7i3Y1GN6LMb/98RiEIUptcD5dVKoXB?=
 =?us-ascii?Q?4nqKMUeUsrPOdN9k7QfhxsIgPvhvZ/HOKyom0Jqr5H661Lw7Nhbeq/2XC+oo?=
 =?us-ascii?Q?ceYJ9R35pEiwVztR67tT7ErGWpeHItcMumYGpbeoC0+xzlFdzK+2Gkj+MLfY?=
 =?us-ascii?Q?gPBIG9xh/mP7rj3fYEAVxlCImiURKaJH5IeXt3sVpd5odc4lQzZlcn3qMRUd?=
 =?us-ascii?Q?RqdKGDccU2gLBmgsGTAHq5ZGaJBzuAoddu4RnMti7h08LM79Eu8LtFI48m85?=
 =?us-ascii?Q?QP8Rz3DZmX7NLTCYrAUxsRykCnT1UzTs52RQaHkX3LzGkVhaUzjtH7B+3xKJ?=
 =?us-ascii?Q?vnG7DW4nQ30MiFwjT2Xll2yFVsXo+iD2SteYHUtidILyZv8YTJp5+hCwYyRq?=
 =?us-ascii?Q?2eG/c6xUM0acWeiGTan95ZkgzjOh/uTyiIiv2CdgeMu4BaattW+PYBq8T5vV?=
 =?us-ascii?Q?J49Y/KYXdzdKGEdqbmBqif7RiF9c1uFuqVgsyuED3jWoZnNpi8NgCjearYLv?=
 =?us-ascii?Q?YgIhOlGfQFdX0h+UhJMl6dWPKolFkpVj59CdMscJ3RHatci39MxQI9GqNNXS?=
 =?us-ascii?Q?iDl/J2S4tpAJE/QoC54TummRoVDoZyJ3ooUC56O+SXWbak/nq513od/LbbXU?=
 =?us-ascii?Q?oGa8la/W8KCFntqx3vRefMlE0DQUfQxwy4ocuOfvGSKWObDJ8Ra+vTtd2usE?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uynbTkjzyX59qzRfKoE9wrttFzUtKVP23dd10pY3l+dot68nLnPi0eCxfmzY3cmxcVgSf0YUtttcowKrCq1xs2rCgZpipFAU59Juo4i8+fpX6ofew88B0miLlxONKLEelm0yl4V6WDyMGWQ4FnUuaaiUEA1bMNFKglsa63w84YMA+3Rkj5Q17/uTyYJDBDWHYc+tsl4HK8yTyltDlj4vnglIBBbMD6D846smCH30OelrWLcb8yOxFnhVEWXuFnl2iQhOW1MJBXiJpzGcoG25akBQjBe5xwcNwjdj0zOQLCjWOqNN1mohjS1633PHcTuEm7tYQZj5hWrPGX1R4VLt5AFRQ/b/NC5P+bM1Ivs9njASla1JSRFiCiBe9oWuQBMAayMrnqwpnaOGDWo1IY+h8pePkTl8H5zoErf+XGOO9B1IeIeTyv9JRwuhlnAeuFrAo973NChvV38gGGdOal7GOoaurH7lhLPgRHKytKnWq15fWHFtt7/kqW1OPYgbBbYalVrb7y0XQoWKl8aCa+ZFG80eV6oEFPpteDGXM/dtwLQECb7RvFxtsDHyBV5jkDBotQh6Hf7gVeN9QJm5YaJH65pFu6l0R743qKvW9Iq/lG0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c24d7d3-6031-4285-0494-08dcf85f66d1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 21:19:41.2064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 67Hc35qR7zmX+TS8kKJepmh7gK75bE/pB4zH0EB53Y7vpuXkL2qw3H8r8OM6aW58mOgGHyV+0LlJB7Nk1jArSZXA9cD1g8/neL2jTd5C3fE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7137
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-29_16,2024-10-29_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410290160
X-Proofpoint-GUID: Cx7fwiH1VZGc_O60VIQ04vWKJF_I1a1r
X-Proofpoint-ORIG-GUID: Cx7fwiH1VZGc_O60VIQ04vWKJF_I1a1r

On Mon, Oct 28, 2024 at 09:18:01PM +0000, Nick Alcock wrote:
> Cross-reference it from dtrace(8) and vice versa.
> 
> Bug: https://github.com/oracle/dtrace-utils/issues/94
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  cmd/dtrace.8        |  3 ++-
>  dtprobed/Build      |  2 ++
>  dtprobed/dtprobed.8 | 64 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 68 insertions(+), 1 deletion(-)
>  create mode 100644 dtprobed/dtprobed.8
> 
> diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
> index fb9392d29cb2..c299073239eb 100644
> --- a/cmd/dtrace.8
> +++ b/cmd/dtrace.8
> @@ -184,7 +184,8 @@ Options set this way are overridden both by options specified via \fB\-x\fR on t
>  .
>  .SH SEE ALSO
>  .BR cpp (1),
> -.BR ssh (1)
> +.BR ssh (1),
> +.BR dtprobed (1)
>  .LP
>  .I Oracle Linux DTrace Guide
>  .
> diff --git a/dtprobed/Build b/dtprobed/Build
> index 346cd6aee190..7d98ddf836c3 100644
> --- a/dtprobed/Build
> +++ b/dtprobed/Build
> @@ -57,6 +57,8 @@ install::
>  	mkdir -p $(INSTSBINDIR)
>  	$(call describe-install-target,$(INSTSBINDIR),dtprobed)
>  	install -m 755 $(objdir)/dtprobed $(INSTSBINDIR)
> +	$(call describe-install-target,$(INSTMANDIR),dtprobed.8)
> +	install -m 644 $(dtprobed_DIR)/dtprobed.8 $(INSTMANDIR)/man8
>  	mkdir -p $(INSTUDEVDIR)
>  	$(call describe-install-target,$(INSTUDEVDIR),60-dtprobed.rules)
>  	install -m 644 $(dtprobed_DIR)60-dtprobed.rules $(INSTUDEVDIR)
> diff --git a/dtprobed/dtprobed.8 b/dtprobed/dtprobed.8
> new file mode 100644
> index 000000000000..2ebe89ccc426
> --- /dev/null
> +++ b/dtprobed/dtprobed.8
> @@ -0,0 +1,64 @@
> +'\" te
> +.\" Oracle Linux DTrace.
> +.\" Copyright (c) 2009, 2024, Oracle and/or its affiliates. All Rights Reserved.
> +.\" Licensed under the Universal Permissive License v 1.0 as shown at
> +.\" http://oss.oracle.com/licenses/upl.
> +.TH dtrace 8 "22 Oct 2023" "Oracle Linux" "Linux Programmer's Manual"
> +.SH NAME
> +dtprobed \- USDT-tracking daemon
> +.SH SYNOPSIS
> +.SY dtprobed
> +.OP -Fd
> +.OP \-d devname
> +.OP \-t timeout
> +.YS
> +.
> +.SH DESCRIPTION
> +.LP
> +\fBdtprobed\fP is a component of the DTrace system that keeps track of USDT probes within running processes, parsing and storing the DOF they provide for later consumption by \fBdtrace\fP proper.
> +.LP
> +\fBdtprobed\fP should be started as soon as possible after startup and should always be kept running: processes that start before it may not have usable USDT probes.  On systemd systems this is usually done automatically.  (Restarting on upgrade should also be done for you by the packaging system.)
> +.LP
> +The following options are supported:
> +.TP
> +\fB\-F\fP
> +Put \fBdtprobed\fP into the foreground: log output to \fIstderr\fP instead of the syslog. (Routinely used by systemd.)
> +.TP
> +\fB\-d\fP
> +Enable debugging: log extra output, and disable sandboxing of the DOF parser.
> +.TP
> +\fB-n\fP \fIdevname\fP
> +Name the CUSE device something other than the default \fIdtrace/helper\fP. DOF-containing processes will not connect to this instance unless pointed at it via the \fIDTRACE_DOF_INIT_DEVNAME\fP environment variable.  Using this option is necessary if for some reason (perhaps debugging) you want to have two dtprobeds running at once.  (They will still share a state directory, so DTrace will know about all probes discovered by all running \fBdtprobed\fPs.)
> +.TP
> +\fB\-t\fP \fItimeout\fP
> +Timeout, in seconds, for DOF reads from the parser child.  DOF that takes longer than this to parse will be discarded.  The default (5 seconds) is probably always reasonable. Setting this too low might cause legitimate DOF to be discarded: setting it too high might cause faulty DOF to block \fBdtprobed\fP, preventing registration of new probes.
> +.
> +.SH "ENVIRONMENT VARIABLES"
> +.LP
> +Ignoring internal testing-only variables, \fBdtprobed\fP itself does not accept any environment variables: but programs that talk to it (any program that contains USDT probes) do accept some.
> +.TP
> +\fIDTRACE_DOF_INIT_DEBUG\fP
> +Output debugging messages to standard error if set (to anything).
> +.TP
> +\fIDTRACE_DOF_INIT_DEVNAME\fP
> +The full name of the helper device to send registration requests on: by default, \fI/dev/dtrace/helper\fP. \fBdtprobed\fP is listening on the other end of this device.
> +.TP
> +\fIDTRACE_DOF_INIT_DISABLE\fP
> +Disable DOF registration entirely.
> +.
> +.SH FILES
> +.
> +.TP
> +\fI/run/dtrace/stash\fP
> +Private stash of DOF.
> +.TP
> +\fI/run/dtrace/probes\fP
> +Parsed representations of every probe.  The parsed representation is shared between
> +.MR dtrace 8
> +and \fBdtprobed\fP, and can change between releases: on upgrade, \fBdtprobed\fP should be restarted, and will regenerate any parsed DOF that is needed, so \fBdtrace\fPs started after the upgrade will still work.  (Still-running \fBdtrace\fPs from before the upgrade may become unable to see newly-added probes.)
> +.
> +.SH SEE ALSO
> +.
> +.BR dtrace (8)
> +.LP
> +.I Oracle Linux DTrace Guide
> -- 
> 2.46.0.278.g36e3a12567
> 
