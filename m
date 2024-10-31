Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9B128E8
	for <dtrace@lists.linux.dev>; Thu, 31 Oct 2024 05:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730352887; cv=fail; b=WMD9MtNSi0NXQbrGqnHYPRT5eSz2rJA0lGhU5eIIuEIrInARnr0Isuh6yEShrfP6MUsNCt7f8c0OFOdFpe6FdFRJW4kSsnlXbmF2esaIOYZ7lJvVNHf77TxAoIFofVUZliTHMe8hPoRPP3L5PwBqf7SKmcHggUg7YYgUPtH36Ws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730352887; c=relaxed/simple;
	bh=z7Di7v/DZrMbUwdLgGkPO2FyLx6cNEy244/GPehR+yE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qFdhmLvXRHdo9alB/DAfqc6qtr2irVu8J8sBpoOwB5ISdw+j10zrVcHuMXHmvV9KXug7SXOl0Se4tC32b+TJUQrNAJ6twBICSzH7Mhz+imthQt8u54g0sI1kao47wywqEx+YAfRfJFLOms6inelRqqlI8NhK2FdILeOxoJj0VnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KK83JlPG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qCDPwySg; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KK83JlPG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qCDPwySg"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49UJBZbc012967
	for <dtrace@lists.linux.dev>; Thu, 31 Oct 2024 05:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=3cSGWPGHd5NIfrN7i8
	4/xPXp34JkoDZwaARqGwQqXeY=; b=KK83JlPGEgZlwv9T4S45qBmyA0Snvv1pg+
	bHOIjms4Dx22EGyq6fV8m+EYTU83VIrBuj+RmAuBBXuwg0vep7saSd0S7yHOjrC4
	tEfdNOshYP4lF7bKve+ou6Ij1nqQ7Fb4J3kboX8xULQfEtJxzai44i9mSBLdSlLL
	3qcas55fstQI3/oy8qM7sVEyuNLdQJMgUdD8maAOPhRgpHW6S6FvHqR56FJjR6zS
	pmbqtl0i8PbGGqTY6NeeTD0qk28tafEhY6on5eAom7ow9/Rs4z+MfjbG7c4WuPpB
	D91SbAtAzcc9S+NlrBgueWwgaeeLqD98LL8fuToLYXvESg1a0Mtg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdp9jrp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 31 Oct 2024 05:34:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49V1Ug54010152
	for <dtrace@lists.linux.dev>; Thu, 31 Oct 2024 05:34:42 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hn906u7x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 31 Oct 2024 05:34:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SnJMuNh4NVmJ0IycMWu+69ZKh0LQYbd0JtZFETMKcj2YLAXIKsIryz+T/UQsofBVrq1F2IGx1wqsJ+HBnepOA80Oy01mDakfUlcVo0qbBHOQ4/+iYvatBhkhsdynk1y8a5FdVT3incxTeyWIj8Zh1v00LUKwCa7/bwgX0kr1g7GUlBsn5I3eZCoSHu08xi4F9HjYMJtKvUVZ7l5ODgxEs5O7MP4iJiPzuj/oVqytVFSQBJLXMhcVrg4KQQ8FlN3Yg7oj+nd6CizU3QeuDpW99HONYGjEgfoaoZjhjfy2qsfQs7v6R2iNWGN6craeTFZQHQYAIb41saZs85VyDIR4ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3cSGWPGHd5NIfrN7i84/xPXp34JkoDZwaARqGwQqXeY=;
 b=K4yZUAB6ikFcxNGvCMJixNdydjeyzSJ7Q8irDc9NA94CgjBMMtreZN82oABwGlb+u7pNbwENwfS4Knw11dJ8eOI+NuDwrtMQt+A2chGESo6pYY7Cu/NjNYjs3sQORJLIAcCTxUTzKjVOTYNIqyVU9hlJthMYdcZFaAlNzphSZf/PbOHFqv0JH+zM18HFiufuE34WqPSItvPr4jiLwukob8hpnsUhwk2t267bYGNLAroSEEd7K7tbr4ICo1zAUJiD+oTD433tqkquqSxa71vfYeDFIO88/xgCp+FZKUAEa4h3TpiVI0DAgR/QajQivWlq92czawLKwBwIoksO9/j+Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3cSGWPGHd5NIfrN7i84/xPXp34JkoDZwaARqGwQqXeY=;
 b=qCDPwySgYdMpY2O+C44TE7D/6PuUmKlFougJz33l+oituXspjgeG9zCgeHxiJ1Qh5PUCwIfsUO2hNv9yAvTVqDWZkFD0OKReLVUZ638HlM/v7Np7ldNZK2JkGyKSTJFOqFYwIEHL0YfmAqGLGefIsUIPvVFw5d5jvJMO3N3lunk=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SJ0PR10MB5765.namprd10.prod.outlook.com (2603:10b6:a03:3ed::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 05:34:39 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8114.015; Thu, 31 Oct 2024
 05:34:39 +0000
Date: Thu, 31 Oct 2024 01:34:35 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2 26/38] test: Clean up zero-size
 speculation + chill()
Message-ID: <ZyMW665jTGN0b0IY@oracle.com>
References: <20241029211643.1608-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029211643.1608-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BYAPR05CA0070.namprd05.prod.outlook.com
 (2603:10b6:a03:74::47) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SJ0PR10MB5765:EE_
X-MS-Office365-Filtering-Correlation-Id: be2d126f-2de7-49cf-ee90-08dcf96db676
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UVxAM9D7mVOiDwdHMTp7ck4HHQYIDoYkIuZF1Ew1jE0E2Le/DCd7Dbao1ZyS?=
 =?us-ascii?Q?UL9JWXQu3XTHIsL2YcWkxSpLZAdsh6Z6HGd/mmBnXYwwMxKP0d1ffgLAxlxX?=
 =?us-ascii?Q?8qrnNNX3WcaNwdYU4s8+DuUu3Yp1jmlHGwzF7FChxvaOWxBpc43jeNv7AI8P?=
 =?us-ascii?Q?MAGpVhi/+kkhwfd2j0j2SKr8LYUuIq3HuYoMgjTDLag4vTIj9+zlxx5b74rx?=
 =?us-ascii?Q?fH6ouyIfqd8V+qwVscPBxt94JQDxaupzs1Rjiz6zSDHJ3Jt+p6e1eCn423QB?=
 =?us-ascii?Q?8UvxQVjNJ8tU2SYYJy1TiyzhIV2wJaRCBp/9S50YzcT5cl+h6K2ZbrfPvSvH?=
 =?us-ascii?Q?CAi/LcOSy6tCwY8J+6R3y6sOnPtbNsH9NjyV2KONrgwwCmBUCQa8kJdASPYd?=
 =?us-ascii?Q?gpgTkdAA5gvB8ZNJBP8kCWqyP4uW/MYIJ20R6KoLh9ViCXjUajuZ8S4dIuHZ?=
 =?us-ascii?Q?SavFlaUig9hRwCHZSeaFasPcrdDqrvCasCHu68umY23zH1b38IsIezkKcEdb?=
 =?us-ascii?Q?HLXwKNgMZfSH9laj39WNVw8uLVhbe4Jmos84zAZ18cddOlVs8bbVHqxZUDWN?=
 =?us-ascii?Q?NrgLzXmmDj73g1vY3uSPQBlh98tdb7fQAV1vJnVYI2bKuSpwjH5cH9l2y0zH?=
 =?us-ascii?Q?TyL0anS8xfva/bdO1SqGWNeqUD7nF7wecvai7xBs397n0rh6/pTLBTkyNw/+?=
 =?us-ascii?Q?xAxZHCMvdoCYN6lkJACCpOxJTAzW9184yx9awW6ulVlJt6LvFiTvWWNJozbo?=
 =?us-ascii?Q?w/G6DMp9la1/GFBY8VbVEuc9nnBDgXOwZunocwV37g9Rd0fUPIuvnhKJqhnp?=
 =?us-ascii?Q?r8hasZ0q4dKv7PY8GQTcxIp5K6jdgOwYLk+OQmVGsbj+nKgbC4ajj9ZMMwN3?=
 =?us-ascii?Q?V263i//N7aGYbCsbIBK/P52iaa+CahPOVsZ1dPEnoKnaT2jN9LCqceJ4tIcp?=
 =?us-ascii?Q?QZ0/t9/AOZZuRi8kY3ZVPrv5RLvu1SV/jRgCJDYfCvjSXY0qe9KKBebKXa76?=
 =?us-ascii?Q?5uT9pvKGiXYNUgLbW69tLXNXgrRa0F+k0macxHDgnSBPTUMjXdjrk+v/Msuq?=
 =?us-ascii?Q?3/CshG9F+1DXvaR1hToHm0hE8NavCrkv5HDNcMfEuBvEj3WkvGSu6kaVNFBA?=
 =?us-ascii?Q?zNdOG+I+ybYewwFW9wKaLUYTtvj2xgNJCjI8aIezbpoKClxf7/I21+CiMprR?=
 =?us-ascii?Q?qhzssIkYQvMCiB7+eQ9xoeDqZ5ntopO9CzDk71EF7b3vpqis1f1xGoJOoF/3?=
 =?us-ascii?Q?TET/6rjKZMStXnEaYQGXdSLy+FmPcbGvE/n85oFUNgRi5eMP6V3/9zV2HnTZ?=
 =?us-ascii?Q?VTIHMA/tmt4ZvehllA1jd3um?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7iRf1R0x8Wbx28btg+USoRky4YP41tk/lx+DnCLXwFWHTVQlAzHWECjxiIdE?=
 =?us-ascii?Q?8E7Cq+a/wy73lYx1h334W1J5ucMh8DmAN/IlJoLCfQ7yiH4EgXRDmOyDRRfj?=
 =?us-ascii?Q?yamWaBKLGjvK+3NKllwS/aR2utav+gJjm7hcoslDSauzvsIE32iiXUW6hmCL?=
 =?us-ascii?Q?lti+MSKBcrRdM8f48hlKYD5iwcPcA87zkvfgkZIMA9urCu5AhciW/1bJVEj7?=
 =?us-ascii?Q?Em0VZLIe4ndSjuo6HYIfuFusMMGGdXfc7YANtusJ+uKb0ndpZcgOdgNmMMuw?=
 =?us-ascii?Q?t6gSltVhvPkNj59zLZ01JW5ZTpoYNBdI3WIyUpzi3ePVg38haZuXldWRbSDs?=
 =?us-ascii?Q?CRavvqjIAS5yVJQ/4l2K2LsmJ77JhhPQph5HLfoznNa33FwAD+Ql7CU72efL?=
 =?us-ascii?Q?pPDgX8sCoZ7WHch+M2RChafb4NphiUAUnAwe6AVIhAws5N2G2iu43EKID7RC?=
 =?us-ascii?Q?g+PBY1qT8AMLWpOyxLip3l4R3UtBejYUil+1c4QzivwZsHYRAfmGbX31pgiG?=
 =?us-ascii?Q?WvJq12tETGqk2HJPtoC2Dm02Cyo5DoGF8izEY18ISDwXzIyqU/eHepE9cd1h?=
 =?us-ascii?Q?XuHsA9znwbpxpVrOIT5k/mxlbKFFKjI/k7ZZC3wsmeEg9al8SjA/jFaWpxZe?=
 =?us-ascii?Q?kpfbEmVHiFVy/6Jru9uli6MZrffvfRxFIO0k/duh3nR5n3z7ewkZEtlyhW4x?=
 =?us-ascii?Q?omYY4QlasFFEu6qcfiay7+hfH6YZr0+qGOfHuAz9+qDIAg1CqnqO8/jfOv/r?=
 =?us-ascii?Q?o1xnoyG0DtxLqyd77YyM8D5BTuv2QRvBBH2ERojkjNqvdDkrxRpDvK7WeXvv?=
 =?us-ascii?Q?UFpnmapbxD0jvZbf2dIWJzzo+A32txx3p0uSCF0UZeMctQoeXzD2MwOhPL0b?=
 =?us-ascii?Q?cH/U3WeCLENHXQYl37HLeDNSaOvRcrxX3Stj04Unc5rRhDMzZQgEy93mOPoN?=
 =?us-ascii?Q?2MS0fXIE4u8T9/SPdSnInSyqzLH4FCFPdh82QwtyRQd7dyxgoojk+yaYDXIY?=
 =?us-ascii?Q?V8HjLBrnsXMwrWFiu1w67Bvyr3kbkjLXMCpFn3FbIOLyurIUIJlDUL2R9sTk?=
 =?us-ascii?Q?6JTDQONFWuYsmIlcknTwtPGMU13q8tBoZIWIIXfmG6PYILpd+jJKZRPeUckB?=
 =?us-ascii?Q?NldNTL4aIPBAhtWjmqNpagZr/MkdfDW8g1IWVz6ym6M7LcR76JjFbMLrYy0b?=
 =?us-ascii?Q?/Gfw+dOLuIU0MIR2X2QAwA8Ofq37nNH0gl8D9+bhWzZ+SkY6vT6DOObkEcHU?=
 =?us-ascii?Q?fkkli76ugrp3cSRIJTMLBXp6ECBXxBBNzw4Mf/+c4W36HS6Es4m0Wvxl2ztL?=
 =?us-ascii?Q?77GmankIJ/Laxrv3DfklYcfRvU5YVdAnNsZU/MHQtKTWonvKRDhMBiNXGukN?=
 =?us-ascii?Q?4pXKM4ppQKU+jTvKWDOKQGVpabVtfa3HurOYIQpQIDTpEbTF0IF5dmT1eX+i?=
 =?us-ascii?Q?3Th/ObUsj2nWt5wFmWyR3PSM+6qXuTQrWqjmDW0yilNEFQ7tqgY9GniZuGnS?=
 =?us-ascii?Q?2iVMrUawHKxRTluR1FX3rlpoUFI+HJVXeCf1OYaRgDRbJQ+O2L7qN2jW1rRO?=
 =?us-ascii?Q?krPY9uuq3A2wzyvUa1JBGx8iVOqFc32fwXR4hi/ZSODjiCULTdQ7HnaMQ343?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	stEGjIlYb8QvKEoa/uYWn8LNPmFfwykAQXANwdACqUlGUuoPDGsgPhljLUwIpCeQHTOFeldtNvPS/p7BZnBQhSsJQff2gb267rvH6gF0qSqnU3C6LvNpvq815ddP0csoCFqXjijqkW6TxJYtvLHQuhHhA9UoBzd6D61ZXI8t4D0N0fdBa7VRMkYLBcRJISSUdLq2nHBQvjSL7XC06Cxi78UlanZWU28du563yJFRMjwhe8E++IA7tkyloWTBr6ScsphMs/hssd2cVJ0yCKAE5JP1S/Chk3ZRgFOhIyMqd5uH6JaDpgvBnJ+scorHTFFDNcWhuUX4wl/diBiEk1CSKPGnw/G+i5jyxxoupQvG9rxUqiA3bNEotKYNIYvIgdoQgLDGkUBlLlv9r0rDSMD7aTBIctCC3NfTCjeNgSddop3XtW0x2S9Qke9VpCMtWbEkwMaZf4HE3VtN1HGquzpXuUtsXWBsnWT4nl8cwYAIFCaQGKDKw0z7O2eUylTyGWtX4/XCfjTiAa2iNrhxbCsF4HW/986Qo8IfTnxrgo48AYjZ4AE0li2sPRpkjRC9IpT06GCL2Juu01OC2kkFHTi6Iccz8lKIF+WFJyuAhLx0624=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be2d126f-2de7-49cf-ee90-08dcf96db676
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 05:34:38.9378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q1KQc/1/3dQujMMcnRFfUvSjHp6JBjhO88H9oA8dH0aUUzzxnaMnPACdGJaDQpvaLljZosioIW0Rzwa0TS68KlUf9xyTs6/S06oxj5DrNQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5765
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_14,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410310040
X-Proofpoint-ORIG-GUID: QTLL1TfUcIC0C-2-kb7syuZVUdPqqIDM
X-Proofpoint-GUID: QTLL1TfUcIC0C-2-kb7syuZVUdPqqIDM

On Tue, Oct 29, 2024 at 05:16:43PM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The chill() action is not yet supported, but it also is not needed
> for the test.  Therefore, remove the chill() from the legacy test.
> 
> But we do not want to diminish test coverage.  Therefore, make a
> copy of the test that keeps the chill (and annotates its XFAIL
> more clearly).
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  .../unittest/speculation/tst.zerosize-chill.d | 34 +++++++++++++++++++
>  .../unittest/speculation/tst.zerosize-chill.r |  6 ++++
>  test/unittest/speculation/tst.zerosize.d      |  7 +---
>  test/unittest/speculation/tst.zerosize.r      |  1 -
>  4 files changed, 41 insertions(+), 7 deletions(-)
>  create mode 100644 test/unittest/speculation/tst.zerosize-chill.d
>  create mode 100644 test/unittest/speculation/tst.zerosize-chill.r
> 
> diff --git a/test/unittest/speculation/tst.zerosize-chill.d b/test/unittest/speculation/tst.zerosize-chill.d
> new file mode 100644
> index 000000000..ac63bbfa6
> --- /dev/null
> +++ b/test/unittest/speculation/tst.zerosize-chill.d
> @@ -0,0 +1,34 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/* @@xfail: dtv2, chill not implemented yet */
> +
> +#pragma D option destructive
> +
> +BEGIN
> +{
> +	self->spec = speculation();
> +	speculate(self->spec);
> +}
> +
> +BEGIN
> +{
> +	this->one = 1;
> +	this->two = 2;
> +	chill(1);
> +	speculate(self->spec);
> +}
> +
> +BEGIN
> +{
> +	speculate(self->spec);
> +}
> +
> +BEGIN
> +{
> +	exit(0);
> +}
> diff --git a/test/unittest/speculation/tst.zerosize-chill.r b/test/unittest/speculation/tst.zerosize-chill.r
> new file mode 100644
> index 000000000..4fe802e01
> --- /dev/null
> +++ b/test/unittest/speculation/tst.zerosize-chill.r
> @@ -0,0 +1,6 @@
> +                   FUNCTION:NAME
> +                          :BEGIN 
> +
> +-- @@stderr --
> +dtrace: script 'test/unittest/speculation/tst.zerosize-chill.d' matched 4 probes
> +dtrace: allowing destructive actions
> diff --git a/test/unittest/speculation/tst.zerosize.d b/test/unittest/speculation/tst.zerosize.d
> index 56c1fcea3..ec75381e4 100644
> --- a/test/unittest/speculation/tst.zerosize.d
> +++ b/test/unittest/speculation/tst.zerosize.d
> @@ -1,14 +1,10 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
> -/* @@xfail: dtv2 */
> -
> -#pragma D option destructive
> -
>  BEGIN
>  {
>  	self->spec = speculation();
> @@ -19,7 +15,6 @@ BEGIN
>  {
>  	this->one = 1;
>  	this->two = 2;
> -	chill(1);
>  	speculate(self->spec);
>  }
>  
> diff --git a/test/unittest/speculation/tst.zerosize.r b/test/unittest/speculation/tst.zerosize.r
> index 7dfba9727..5ed9cb183 100644
> --- a/test/unittest/speculation/tst.zerosize.r
> +++ b/test/unittest/speculation/tst.zerosize.r
> @@ -3,4 +3,3 @@
>  
>  -- @@stderr --
>  dtrace: script 'test/unittest/speculation/tst.zerosize.d' matched 4 probes
> -dtrace: allowing destructive actions
> -- 
> 2.43.5
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
