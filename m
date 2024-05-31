Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C3E7D40E
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717181985; cv=fail; b=W/GVxWXgyahtlqaapVZ7Us/iCjyRlinL/8k3dsY7nGJXMvrIgJVU2BD2okp3SoPvgR3O3XE0qImVGUae6Os4Zc9cHnryEHgAmGILASwiJ6ZRJ/ORt7NllDWUmj4mVAngnAkRjiqqXRh3SnhWdaoLWRV5gRDkLF9xZ0yNi9RyjLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717181985; c=relaxed/simple;
	bh=gpcMTc1EfK9cJnCruePLEtuCRqm4cQ0e7XW/cOLZ6KQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jYc+K9HhMJXtpJkRlu6CaIAv3RgcKvcqVeEOsmuD97vIa1gOc5MBQmbo+Q+K6h5wjh2/GMXHfWM9mUi9zXKg4AyW4SxZoVbkVWaKAebdnn0Bbsy4oOcfYahGtBvvuEG1hHaPw2h3Ii1bokF7st+dmbiQ5Az46V6ArfZk5D+R47Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44VIKlbW030194
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:42 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-transfer-encoding:content-type:date:from:in-reply-to?=
 =?UTF-8?Q?:message-id:mime-version:references:subject:to;_s=3Dcorp-2023-1?=
 =?UTF-8?Q?1-20;_bh=3D1HNkfBc/xLO6QqzkOu1w7GfNLjKRXhMgyrQxONDydM4=3D;_b=3D?=
 =?UTF-8?Q?GrV79ljldKiHhbhV15ceBo9CS+w5wAffT11zycNqMYxP4nskQeZIZbmFN0GltPX?=
 =?UTF-8?Q?p/FPR_8zxeSzqmu8V+gwpfr/SeVlRfceKOijOHfGhlVgSh+ZuonUsQVV+e3Dhvx?=
 =?UTF-8?Q?uOe4rxI3G/2_I9ZMZSHKK0hjSY7OIqs8eVp9ho+MKHgtRwjS6MF68NcZw2eOW01?=
 =?UTF-8?Q?80fz8EJQrhg1ECXjk_HM2PPusoW/XAkU8aLbugcv5DGNNwYXXtFQJL/qcrXXoEx?=
 =?UTF-8?Q?Ql2VhoCPm+kcNqF9RUbRdYz_uii7CafJ+EayEoY+TjdzAhUA1gs/BZSBJLylGsl?=
 =?UTF-8?Q?fTqB49KVot7JyGN6WAbngRM/Bemve_MQ=3D=3D_?=
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yb8hgbu99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:42 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44VHKu0g026566
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:41 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3yc50a8722-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWdtGKqWybmK4GD1J8nJA6io+dhEwrgXLdJv13J+bMZx3Y1KI/7/t8cVsNvjO0eryEjx6CiSn0LcZyhI3qgwg/4F/YFcNoseavxmbq8n7tgajLidJnQupbAT5jXTAMeOza2Tr5HiJTm0Rhq6L2pKG0w64n5R5rZLw2gIViOMpkre6cZ5ipa874ikuhON0UuF9JAZgIoy9ukeb1scoUIfHQvMFkaJn+Bw98BKjZ3bGgPEgdTDgN432rTY3Fnu0wI3Paned6l8q7+Dq8vlxh7fCCKqQkPfv6UGq3ZWu8ZPwvBvnqyIEiqF0FzG0JVeBSToz03gqRmDzC3nVOCi7UYKkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HNkfBc/xLO6QqzkOu1w7GfNLjKRXhMgyrQxONDydM4=;
 b=aaL8qC9YiL9lHf6nlR+9PdWFbhXwmDrUAPrBOqsLa1uAMhLR4c1uzTvXUU9/I5P463PsPKyoB/poCffIpnQlv474hI+xr7Cx7JA615xMKwX9OW0i/MkcNoDI8YWiK7Ji+C7hALrgjMfgRxhrU5aov4lAk3U58tQ2GzayXPZ2KKBc35eMNbg/xDO4KIBcsBas/Ypn/4VEkXQJ2xPtdwjhBqHH0p+BzG2Zpr5q3zjp40PQ2VfvVWvxY+rYhMbVDTV6NI2py7BYkh8dfXgJEnVio/XG7fnMz8hZWVuW1zgERkA/vzKTmyFeXqhGU2nFrWSk1YeO94wr/US/WRONYRt/Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HNkfBc/xLO6QqzkOu1w7GfNLjKRXhMgyrQxONDydM4=;
 b=zcryzDXcHurwasK4QBsn0J9RKWanMteo+MUxUjbBq/vwrk3HmappNl8m6x3GJsa62vOy94YiHBYACiyB+FmM3i58KB8e5PvYQUXughGYa4ayD3NvO4bgytctBR+gIeeaKxs+E6qOx9xPdTktrm4vau58HStoFqeMabQQ5Kroyfg=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by DS0PR10MB7955.namprd10.prod.outlook.com (2603:10b6:8:1b4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Fri, 31 May
 2024 18:59:39 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 18:59:39 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/9] spec: install sdt*.h in /usr/lib64/dtrace/include/sys
Date: Fri, 31 May 2024 19:59:20 +0100
Message-ID: <20240531185928.363245-2-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.45.1.275.g567cb0950c
In-Reply-To: <20240531185928.363245-1-nick.alcock@oracle.com>
References: <20240531185928.363245-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0190.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::15) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|DS0PR10MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: 18beb406-6386-41d9-892b-08dc81a3d281
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?C9c0yP+2j5zgbisuZzQskGBSxyP9KFu1lCRWbMpectfbRMXdW4RDFX/jZYpI?=
 =?us-ascii?Q?VHShopbT2BrwGSr4s0wp//N6I22scm1eXEYMLJjC1tqbdSMa597SLf4oWZ9d?=
 =?us-ascii?Q?Dy74gvx2n8HXDKQlcjdG6jjB+WlmlSnVWbCh/Z9GJvebpHyuQOGCnpZYQtIW?=
 =?us-ascii?Q?91Ef0zT3BZYBYphnnflwOUPRl9vcslRXjpuGXMWRnmM83YGDVocZfWVxpO8P?=
 =?us-ascii?Q?sX53hs8BCB5Tpfo9kY39ttx+5JM9ydAruUgGdGJXU4qEc26r43QjI2PVN006?=
 =?us-ascii?Q?voP/+TqMZugO1QY8W28WAlGHTpIQHdjiBAs7Ro7a+wwyUs9wOZqAxH6S1145?=
 =?us-ascii?Q?CkgVglqs6lfe1X02dFhed+JZooUPx0rzEfIYz2ot6HCFokpQl3bOdcJpBjDt?=
 =?us-ascii?Q?BDoiLcESLVhnXcYEIijCS7zaIfCUwo8dkSgviIo/uYU76Wjq0twryNsfC38F?=
 =?us-ascii?Q?mYkNyCc2hEqnysRH5249Q64znq/xGFQsQG4EgR/Dg5m+putWCoQHJ+RbOa3A?=
 =?us-ascii?Q?kB4PvqTxWLFOl3y6OCW4UeHsg+xgeeuVomMtGINufZjn1EnTxvMPR7ifzY0I?=
 =?us-ascii?Q?TaJ5CuQtAj2sKNPmWz8X99LAG8GxNvcwGnsda34O9fimsEScBs9HvGsg0uvg?=
 =?us-ascii?Q?E4hdtApH0IrgeKF4w/XD/r1hHWtKBBInMiUrC0+intGX5wGCfA/c02BOpK6E?=
 =?us-ascii?Q?PoCdYy1bLJXlC81uJkDWxYcx/flp8oiNbmPDUca9lXMP9VOjSe9lViiVISAu?=
 =?us-ascii?Q?dtso2KyZbC1yABRZF6X5AGkbmu6z0loHxEw48Q6XGSHJvc3O6pQ3wSVx2Y8u?=
 =?us-ascii?Q?yDy45GcMIwWZT/OmXpSAjyhyd60Y9B2Fi3wRB+eeGDmEESh/RTsgg56rs+8R?=
 =?us-ascii?Q?Ne3T68dF7b7B9j/go3tW+QfZ0OPQdzO2GCu/NlsTXwnR7S36o9XkUDwoH3hS?=
 =?us-ascii?Q?peiTZkm3mZbt2Z/C0/KKeetLSS0ddli5+Gu2SbKDJ7jL/fjYEFKBrPo1IuwA?=
 =?us-ascii?Q?jvgHUPXsUhMy0i5o2mOEL749YGj8kYkp0s308EIwGENkxJM4K/xkiqZ+Zj+v?=
 =?us-ascii?Q?vGw9p1e+oCxqcy25tYDNBzEkpDLcyzIGXfupLGQLMqgju1k+T3qgROGffM9Q?=
 =?us-ascii?Q?ajuEFiybssTKs9E+SYnJeaCh+Kx2G6bZEf2ugoxckD4/4s56KAqClM7knzk3?=
 =?us-ascii?Q?ovccWIpJ69dX6P0CAs3OxdF2vYdYMGImY6U4h8Ux5Da7z2Bu3047lRIwqOs7?=
 =?us-ascii?Q?V3J0oosOwTvF3RjUlvhngqlXzIt6MY0v08w3KnnefQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M86LQL0ldbaDiKUbk7gJBuPTSyCLDjm5bZerEM1iusMtnBtfVGmuWpnjLCtD?=
 =?us-ascii?Q?vLNOaK9hPDzuoNePchlL25pFlur/EnnpoRm4fV30C2Bd6qSux7YKxtVAu/e3?=
 =?us-ascii?Q?fbM2nyU4E5coVirqSrzw7upiZ3DxhkVXdfAcVF0rZ2sIxtaFH/jPlSh1VWfp?=
 =?us-ascii?Q?F8n41YUPo9mEDsyDd5CJGr5kOYN44W0S0GAB5MYDZKXkECERNA+6oWtT1eqg?=
 =?us-ascii?Q?UtXK08wugeIrrvb5qCGH2nK1vUuIrCyPo4xSfein8SH06KotQcSdncPZlscg?=
 =?us-ascii?Q?PjR0IMmf5BDbbCycU/il5JCq3h4sIeNiLvbKyYX+WUcHwO8dnWIqaSHIQQ30?=
 =?us-ascii?Q?A+pFhhiN8OEf1YmjFJFv7tw0RAq35/ROOnsZZPDVjZ5zsEikZEywbUQ9HX9a?=
 =?us-ascii?Q?5XUGU6SQ1spKApUqm3hKFk7dziW9ZbndwA1FwFdVgnxmCj5miR8ZEZeMmRhU?=
 =?us-ascii?Q?v7XNcxw5mWP/fM97j+9UWGch2c9CEsexIUf7Yl8w50y8fL2peVSFsVjQdoWz?=
 =?us-ascii?Q?9XUuGIUq4+RCSR0Yq7R1yJR0KiNBj2IptA8WlmUYNokXbSBpw/b1QJvufFaE?=
 =?us-ascii?Q?wcZ4VO0xBLhTWbjpKfEdXwWES28tt4ZKt1jpxYD88W6Fc4LEMLSlUrjqBmLR?=
 =?us-ascii?Q?A2zBXACZj9z6VegizC3eV7FdQeAs4xTH4ezrnCR9dUwrtzjqag58H+Qgh6xz?=
 =?us-ascii?Q?e7cmqASLxJ5Fprntk24kGDu78gXrljxAyRpPjyuQZj4R6ip9+yC+1B9el9aa?=
 =?us-ascii?Q?oCzcWKBBv1wGrEX62HL+7d82wOzyadqQqhu3Ck8YHYJ1AZsIACdo2sbDAmZm?=
 =?us-ascii?Q?/oJDBUjmkn79/wnzUfNiVQjSormMX4GD96Wfc36Sxod9bUFCM5f4jC2ldAfm?=
 =?us-ascii?Q?0t2yUtUQP9uN6ktipnA6wtev5/V6xTRRnYVR717Y48rsuKPi0wI63TKps2x5?=
 =?us-ascii?Q?olrWyRdK7KNu+mW02KjeH/5l9EWPoPYvH4M+jRLUinHDN1UtnByqBL8wz00a?=
 =?us-ascii?Q?bFsEZnYbeu/MDF/cPRHAVeCIgOJ4JXRJR0p/iKIel548O+NjNGT4rwyYW0Hf?=
 =?us-ascii?Q?JvAr+gpt8jfQSJXCjnHSmxIy79+qeZ6PY/gPGwW62r30FDQt3CP8qis7lVmt?=
 =?us-ascii?Q?VJ3NmAxNEZ8YWaLGQS1B54ClOsZLVbeErSnWylP4NNX+fkxx6age5QdXsnBi?=
 =?us-ascii?Q?VaV7ZflYFeaigijF0arEWeOdOgYIfKPUGBAeJXVbQ6Ia9qMYJWWEF1npqUWf?=
 =?us-ascii?Q?qgozJ2yoRX5mV0n1a6jWU71qKHYuzeAt6B+dYQhdoviVPOmHnlFl8ewyY3Ah?=
 =?us-ascii?Q?WmXla41V7LftoefH2nvPxqsM+VF1tz+L/Zk6w3TrtRaWBq7zB/RUrg0KbVPp?=
 =?us-ascii?Q?98wusAjCOaWhK9UWR8jzn/EZAfq6Ihz1gIJ/44VLNBOdzA7+Bl092wiO6Kiv?=
 =?us-ascii?Q?tv6aI3R9gnR/nzgSa+UMupv2rDK5adIplDFarfdPnAFrnn90eIId/DBD24p5?=
 =?us-ascii?Q?/FeFFbdCJfxoa7cExhpLW4EO7UdFeZtbU0KQM7vf/uNhZLSfhyNziK/nUXZP?=
 =?us-ascii?Q?8sfie3EoUva/0hq044WycZj8vLEcu1pKoIkQFCpjwrt/TSayodhNC4Pe1bKG?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	onnL+6AQojUA8T9lb0fsckl7eozOMZrgmkBwngkaCVRDqzBbsEdvuGMjNjP7ryYgHbRxT+Cj1jRmP/dg3LBZglwDlZANwWowg49cHCrcZkt2jspgOaBlwyPI57A6s0W30MniaLlIq7CBA1uHIfk6DcK/XzKm+P5JZtDemEXXNb8b+rd/50vzG7jfn5buUl4XzTOCA8rAdgIIsRTsuq6dIFroVC7+/zx8+R2WY/IPLkMASR/fvU0Eox2mK/9Umzq3NI9IOqQJdHdhCx7xEWwVCmPyg8ImECDAHdo6QK9r0HJcDkljTuTvdc3LrLl7HhgDUU48DM55Xg4kU5nAbdshHxME7kiiQxh4Z4o03Fl/G3Ou32Oh8htRISdE4fGqUYuO+5xwyKplSveSJCaF7IrELu+U4y6MpC2HnreQd5k3jGgHCBYAQNARmg9RjTiTwJunSjxQvMTYoYmRKLEHzxsV1Ac45PsmEPkF7osMAwso1iUk8SVXvDnwcmfMscRhW3Gm6xr8mvlm3SyDcsEuJlOe90mX7eJ5aoIRGfpkW47naTdAfcPBHhsHdnEnEnt+4gwcdk0PYI8PbNOScCHGFPf5oyivdZ7uIM8cDt3PO0KGM78=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18beb406-6386-41d9-892b-08dc81a3d281
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 18:59:39.3149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xl2sLG6BgiY6hpFruDQqorSLXIOA26VlmSav1VDykcjzH2X1hBGZtD3lWoUrEin9WeW7k+GNhkDjtMsNf0gOuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7955
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405310145
X-Proofpoint-GUID: vrptsi085OjF6inw9HUOEQNvOr4tTw57
X-Proofpoint-ORIG-GUID: vrptsi085OjF6inw9HUOEQNvOr4tTw57

This is the specfile part of the sdt.h move, rendered more
complex by the need to clean up the mess left behind by the
old sdt.h renaming.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 dtrace.spec | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/dtrace.spec b/dtrace.spec
index 42ea9bc339586..28eeaa4783769 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -86,8 +86,6 @@ BuildRequires: binutils-devel >= 2.30-58.0.8
 Requires:     libdtrace-ctf >= 1.1.0
 BuildRequires: libdtrace-ctf-devel >= 1.1.0
 %endif
-Conflicts:    systemtap-sdt-devel
-Provides:     systemtap-sdt-devel
 Summary:      DTrace user interface.
 Version:      2.0.1
 Release:      0%{?dist}
@@ -194,11 +192,6 @@ make DESTDIR=$RPM_BUILD_ROOT VERSION=%{version} \
 sed -i '/^ProtectSystem=/d; /^ProtectControlGroups=/d; /^RuntimeDirectory/d;' $RPM_BUILD_ROOT/usr/lib/systemd/system/dtprobed.service
 %endif
 
-# Because systemtap creates a sdt.h header file we have to rename
-# ours and then shift theirs out of the way.
-mv $RPM_BUILD_ROOT/usr/include/sys/sdt.h \
-   $RPM_BUILD_ROOT/usr/include/sys/sdt-dtrace.h
-
 %clean
 [ "$RPM_BUILD_ROOT" != "/" ] && rm -rf "$RPM_BUILD_ROOT"
 rm -rf $RPM_BUILD_DIR/%{name}-%{version}
@@ -222,13 +215,14 @@ if [ $1 -ge 2 ] ; then
     %systemd_postun_with_restart dtprobed.service
 fi
 
-# if sdt-systemtap.h doesn't exist then we can move the existing dtrace sdt.h
+# Clean up the mess left behind by previous installations' overwriting
+# of systemtap's sdt.h: if an sdt-systemtap.h exists and is a regular
+# file, move it back to sdt.h.  (RPM itself will identify and delete
+# all the other debris.)
+
 SYSINCDIR=/usr/include/sys
-if [ -e $SYSINCDIR/sdt.h -a ! -e $SYSINCDIR/sdt-systemtap.h ]; then
-    mv $SYSINCDIR/sdt.h $SYSINCDIR/sdt-systemtap.h
-    ln -s $SYSINCDIR/sdt-dtrace.h $SYSINCDIR/sdt.h
-elif [ ! -e $SYSINCDIR/sdt.h ]; then
-    ln -s $SYSINCDIR/sdt-dtrace.h $SYSINCDIR/sdt.h
+if [ -f $SYSINCDIR/sdt-systemtap.h ]; then
+    mv -f $SYSINCDIR/sdt-systemtap.h $SYSINCDIR/sdt.h
 fi
 
 %preun
@@ -253,8 +247,6 @@ systemctl start dtprobed || :
 %{_sbindir}/dtrace
 %{_sbindir}/dtprobed
 %{_mandir}/man8/dtrace.8.gz
-%{_includedir}/sys/sdt-dtrace.h
-%{_includedir}/sys/sdt_internal.h
 %doc %{_docdir}/dtrace-%{version}/*
 %{_unitdir}/dtprobed.service
 %{_unitdir}/dtrace-usdt.target
-- 
2.45.1.275.g567cb0950c

