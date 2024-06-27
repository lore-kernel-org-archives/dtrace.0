Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22371A702
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466763; cv=fail; b=df+RCNS1N03G9uDEO/khts+UWGjjhnM1v5ktDwWgmWeMrp+atwNFu1tpM9thmF9MQYsOQR9larjEKJhZJ65SOp0CpUlQNc6HNRRbe2pcKWA38TIOsk3Z1clP5WoPbzo8QBjM4ZD+MtQiorC7SIrbzDJN2EwivgxyGISzpRVENkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466763; c=relaxed/simple;
	bh=T/tl9wb3l0MS5lmVsHhiWUXBbczfKIyuV/D69CgDg9Q=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ce0gV6sdop3E8j9LW8LVfjis8hBRdrYZMUk4lP2g2zJxmOc7rsWv2XPlkH5g+glCiZ0hZI84BOF4jX8UoNmLL+SNn+/9Yh5QbMn/a9PD/Gl8cHSGU6GftYfN7TKJlVPKkfiH2WADDlfydLiZSMFPuafSPs40IBRF97tUhbuEwvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hZ5gxcqR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LGQZCXUK; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hZ5gxcqR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LGQZCXUK"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMTYE007261
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=6YqwSDYMSan0Nq
	KxAl5oNY6H6NuTJgV9ll3fds3XOxw=; b=hZ5gxcqRoEugOg3O89LJhGJxwzHPq5
	DkQ/BKr2VgN4Dc2bqtVe6v+SF4BuVlP5ksfIb3ojmIkFP3F9ZQCUWqT1IpMfibqM
	zkCrg1qakOuNXMcv0/1mbHc3JIWHznxPTttgHh2qbfAWLGl+aiwT1vFbsh2xpPMY
	njg0N7mnns1K+HeF/EOGpWrjwqkAFtna/I0X+05x/jG1oIMbxWf7GOhsD7LS0VyO
	JDwqJnLCBIxxu3ES8BcW2Rwb/0sP50qnCR/yrnqarqdaPiFyAIkk1qvMW2BYgGOX
	reeYe6Rx6wirE/MUy7I4y2G+vveAoknpWgn22b0BCL7DnwW2wCNZhkOw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywp7smxb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R3qB5L001320
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:19 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2an1wm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHAjhpZCsR0PYQ4eBHe+9JdtsyVb9k/G3d8KhcFbIQ+sIuspF1TGT+vPDC/XJPuQfgClw224pE0tgnmSS3zorIDd0FMLh6c8lXVZsaVCQNwroSur6HWjAp6en0AwaE8uqNWrmg2aVP+71is4kWz9MQtJ0IYmHfxaq/fJhMhvWq/0KaubXbix1FDLJ3L5RGl0cfBbBb4+Gi/eZQT0mJxbqO5OmUhbNEEcR+W7epE5gmkckcJZiACrQS1ENeMEtGCBqtMqW4EEP5jlSXciN2IaOsepW70/hXQ2G5ZYZVEow3wRrp7GyHKhLEbW52bCDhHrOz8gBShHZkN0JpTqvtR4mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YqwSDYMSan0NqKxAl5oNY6H6NuTJgV9ll3fds3XOxw=;
 b=YRylhbJ+TafEP4bfQvOjwL3dXq0lDSyTwASWqKYqDPpObtaTEznJo4GsOaojaGzoH+O42VKTGJoCi56Jx3qXjOPnQA3CaLbxFMKC3U4rcx3vQqTqMiXlOiXM9Nj+f9WDADeGsL/pd4svg4dpYLnHL6lzAEKmtPkQVCfr9eAsp0LDitWXmpInKoCYNenWtQEsq0UVO9HxR1l3k6oD7XWky5+N0WTAUCojbA9bZ1ZOQ1j5ke14V4RGbTfMqXWIoBDicx9AuvHEzCPbVFROtzhgOKMHbJ7Gz1X1/lTYH7/xqpgEb9KaqAa75/dVGWqwsB3YSQ5lsTgOHNW50WGoKCCYAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YqwSDYMSan0NqKxAl5oNY6H6NuTJgV9ll3fds3XOxw=;
 b=LGQZCXUKW7wBpOpw8GBGXK24G9x7EsWNjj0yScfNsaeubK2GbOD09AxCIn3aFFcMnAR01HSDbu+C1jeEJ5DawWp6sbT/BxW/yZifYTwopEHu9gaC+ahFI2NZyenHO79876gpwsrutxhB0hJiQU2wgRMUXREgDO6/VyKKm8pHDC8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA3PR10MB7994.namprd10.prod.outlook.com (2603:10b6:208:50b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 05:39:16 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:39:16 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 24/38] test: Make test independent of specific PC
Date: Thu, 27 Jun 2024 01:38:50 -0400
Message-Id: <20240627053904.21996-5-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053904.21996-1-eugene.loh@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0097.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::38) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA3PR10MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: 4852e1b8-661a-48ca-9d35-08dc966b7b9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?I4yqA/SO4S66JomWIrShya2JfSfNJ3ENoa7p+YZ22L99pq3oYxicUf2WK1B1?=
 =?us-ascii?Q?wuKu0lG91kKFJuxOfSO6PVD6mW2TqmGtyR9bqZTGmAcv53pcTWZAdJ54U8Tx?=
 =?us-ascii?Q?XW/Ce6XziuSzIS6X74XmH1pQMAbxofmhhz+q/dJmecl08AzJ1WP2x1ncjE2u?=
 =?us-ascii?Q?+b3d0dK4Gm5cyS0fjb96xs2oZB/2a0onDjaK77yw36+UCxKcRAbJbNdIipR3?=
 =?us-ascii?Q?Zwxwhr5C/t7Jl6fyz/VYpNlxtpug9ij7AIdZID2qurB9M/mQqOlUXo6Stxcy?=
 =?us-ascii?Q?Irq7vPiUo2Plc8pOUctfjD+KbP6q3xAgBxC/Y8kNplH1h3G3CdzUrcTaD6cb?=
 =?us-ascii?Q?K9dblCOTCQ4wHyoB6tqg83HtFNILs03UPcM5KMbnTnLuY5y9gyyVqnC7RcmX?=
 =?us-ascii?Q?aYg1tgJlT1z8SNVikekjOO3JjfbreADDmb/BgID/25u0yV2KzfI2tKVX4IEA?=
 =?us-ascii?Q?6Ur8MRNyA7PNQlkRpUkGMbLtz75ui+eCQY+HDR3MTjVoNfM16L3rFdLpaoJG?=
 =?us-ascii?Q?P62RLbUm9NwD75lFL1M8I1FtiGrwWjP8uFI2eBNgiiSJe+duUBa2rALfy0VK?=
 =?us-ascii?Q?F9Na/iaDIrU/gLmUfmbJmeEd8Hv1oU4eot+WrUKd0jG1KIBk+V+9VnV9MARo?=
 =?us-ascii?Q?YVZcF35pok7CcyMn5jtNnAa55kkXhyjoW69dqxwRiVGmEZX4JCfU0xUJUfjn?=
 =?us-ascii?Q?mvmprwBIpu4gCMa+amrPIaBixJpnCtk3iEJU0SUTMfYzPs3Ukx3F4Jwgmwxh?=
 =?us-ascii?Q?U+iMuqm6HygWpmJ6P5Tkn51UdKZjjoRB/CczPnOsIAZ/O91CU17BjLqpZUBx?=
 =?us-ascii?Q?CrCuEqT+t3Ijdz/LAAM/ytXEdafofCHXXhl8bPki/q0B3Ixb/U0k/Uvlu5Aq?=
 =?us-ascii?Q?VmWRx+vC4rGvk+3esfS0I45RqlLkvU+E25uVsesdGcBd9H3oupjOfPcehyxm?=
 =?us-ascii?Q?HL0DxKNRX59/+iVxlT9lTvCC9enXYaD40XKNYfW27Y9iQFIwUjFFHct5nRxx?=
 =?us-ascii?Q?L2d4tRQqD+0gMryPYWRAhq1cpePGEloqEw5WEUyKvJNYmrqKo6Rvo88JvKv3?=
 =?us-ascii?Q?rEDAB0dybZLixcgg/ycuAkDH2r7MM1Rl2vxYVq9YWglfzMO3Utm/auYLjCdB?=
 =?us-ascii?Q?29rwHf2/ZyW9viTC1lcqjhV1hAnwtNzuf4OaTIPajKbEaOOIZRVRHg+nnbwu?=
 =?us-ascii?Q?42TDtLULXFWW5hCIi6xkXJOgjtTgqoSHSemf11hi/pnj3Bp41enbsbJ+xMdn?=
 =?us-ascii?Q?PwvPp+HnFk/eb6B4F35XvBvLPJlt1qmjkaBBQuCYvox7Uhu3EZEEWOP/7O7l?=
 =?us-ascii?Q?a9dDYHilSRh6f7NRzfkIeZ5zgGBS1ad7FDgwDtQd9EN90adoDFiI6KBspOGD?=
 =?us-ascii?Q?oaf52sg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3QhSrnbjvs1xN6xl/iYqHDdsoZmgq7tpL/SfzNUmCW1SpXI1CnO2dXmSJOBI?=
 =?us-ascii?Q?YtPNfcJKRBnYBW1d5kGO+hnf4Qs/4lKvFemye2kdBFQsFCi12N8NV3qqGplc?=
 =?us-ascii?Q?Up2S67oYILSLp/tnkViR/GgJACIUDkecsvz10Mjbkq7bc7/W2DL2Rh8RVbTP?=
 =?us-ascii?Q?PvInE9Jt4512T/7w2vI30W2W4J8Zqv24dFkSXttArSG/bPsoBn20Nl0SqT/2?=
 =?us-ascii?Q?Rs9qSxYsY2H3fZ3XqP7OI/dfkF4gHVIzbdjmLNoB5WSEeSllaQ6zJByItE9K?=
 =?us-ascii?Q?qzl3+MMBKw9meIGX6vOdUDa9RwV/h1ywumtOAMmCgZUgFKrwvox8wgq1I5r8?=
 =?us-ascii?Q?JcgB2tSAbAZ6QYyxI06y17otlhy2EG4y89ltSvdo2zFeiQM5vWBrr4Ex/xdB?=
 =?us-ascii?Q?SNxS4UVxlFxwJQnE1rY/kQAkTh1np8dzmwSs6EyYmTINt6kXkRl/M4sZqBwK?=
 =?us-ascii?Q?yo42nlT/QmMtQq4qrHdU4CCrETIZBBWy2Mf00uou9eV1OVToMjBd1ssku4fQ?=
 =?us-ascii?Q?ZQWe5hqIhpJmV/qQ8eTgDnt4Ie4wukHP3QTLZJM4s3JPiEmhakQksORUmu9U?=
 =?us-ascii?Q?TCa2hfquWixKtnhRtjdMwvf9UNH4Msy1Q/aFlKfewPKUjof1OHVp9vgrcV9h?=
 =?us-ascii?Q?rp+JIaH8UtbS88mMk7bpIq8nVOj0xX4N+hv1rJ0YjRw3qlsAkpIR3+4xepZO?=
 =?us-ascii?Q?uHQ+AELaudx3u4q6L7FwyZPljsxeJnLzay8QykkAUYDpYsvUaG8OdBaT3up2?=
 =?us-ascii?Q?7iBxaVVd2MUf2jtGExcqqS3xoUCS/XcUGJXsdODZfMpN32dnt9aEioRvXrZT?=
 =?us-ascii?Q?P+6AnM0e/H/eHpsPDy/nKlQPHm2TFt+Nr4p+vbekTgpIsyrSzwBgQX9TgHUu?=
 =?us-ascii?Q?3bJPSh/xnEIFFYmK3lshDuf5UIs+3DZVp+V9Zsuz0LNLsP/4U0xMzcG86a30?=
 =?us-ascii?Q?KLWFCkywpRlIzlT2XF8W8Ynnuf/D8r5VbUpSYj9/4DB5nF515i+CfKQFjasF?=
 =?us-ascii?Q?Y2YPXRSLwPeLU9q+vln+DQqIUoXjWsD6bNxc7uYxK2UN9j8hlr5VX47B/8cq?=
 =?us-ascii?Q?Mi33ASUbEPdLfxp9HQUrPoq5gayihAiiFW8Co/LXEpX9LjLA3nMFZmpIaPVP?=
 =?us-ascii?Q?GUXMgLkkEhhCRLfLize1CjXdxk8LQmHbEEymgar04V64r662N0pSzYc4dhf0?=
 =?us-ascii?Q?NDK16jVkAGLXv2gZL3RfceiCdCHeXLQUuoabz78JVZs6RWMMfEuif6kgiNlM?=
 =?us-ascii?Q?ridkUz1ABrvtGmvxY2Kl30OQ1SN1miEGl1JiVDNLjIAdE1xqjvfIkJWc3Uip?=
 =?us-ascii?Q?9M9+ks0sGdIAbOOy3g3NR4678+xXDWOH1CksWER2RosXRKRMb3CmDdd+Meqc?=
 =?us-ascii?Q?IRgeq42kx1Q2uXAOixOfMvxufnLKvpFkwqDqN95pA2Ph4OXzYek68vO2Bk+f?=
 =?us-ascii?Q?Hkau0WbTCmwatYy+jhwNbOWp2u41asZFHa6WBJVdFqmun1QcZxezKRsLNExt?=
 =?us-ascii?Q?xDrdyZ9k8HPE9BOQZQ6/67uBjwfsKluHrAa2hf0wD56y/BIN9+ShCjN6bZLq?=
 =?us-ascii?Q?B1A7GLuEabWTgD2HlGCEDuD64IfEJjWaLF3xT/PM?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	KKZqM0/FZ8fvdvpKDLtS+cf0b3t7wC0xeiz9EavMpaFyj+KNZ+8KFp9woACAVHPZNeD38ezTYayeD0603qWnOFEKrNjsN+IzADs5NrTwN+/RssU8YK/SGBRxWdleLO5GYgypgfm2TKPhjjr5+cslCzmTl5ub3G+hPROKrjjS3eA6xaLMv3uPDUpEhSx/Ts3J1iS7CEpGkovweaLeDbKAGG100Z2QGBg3CsjI8zNUUV2pQYvkesKi7NGCWcVw4oix4qICcnNW5+Xc+qhvUKZ5M3meGkEBjBsJ0ituZcSGDaLEEn3e0c1xWMFH7/Z25pL+alee68odDH6HeZGBBJCd3ZxzAspIm1tYXRopS5lqHmG23wU/v/aH+CIkJ7D3xNBFvdFNRopaHSUCG/k+S1Pzt4p36NUYp46Boqt0pH4/twuMUIG53Vaj7NORF+z8pfWamVSHnuEkuN/GU03YK59GwbWUPczu+2vCUE15nM93JZghflGzr8TLuylCvUxYADc29ZLqiUQujmTt971Ncbc678PcpM+61TC/sj3QtL5si6GmWv8VAft1TKCUQ33W0tE6OnT9w3IkVQo5ipcLG/GPIlHzHP4IWdaz6Xpjmft3AFw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4852e1b8-661a-48ca-9d35-08dc966b7b9a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:39:16.1070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4y8BBxLJpR6kPQmrv0azBsgHKbo85WERxqoldsCEotuMH6nmyD2qFRyYooYcCHxXMSxAbSXMMIdXsC+IErH3Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB7994
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2406270041
X-Proofpoint-GUID: DqcHnyBvDQ11OqqEzxCIaSphqzz57ho8
X-Proofpoint-ORIG-GUID: DqcHnyBvDQ11OqqEzxCIaSphqzz57ho8

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/error/tst.DTRACEFLT_UNKNOWN.d | 6 +++---
 test/unittest/error/tst.DTRACEFLT_UNKNOWN.r | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
index 001903ff..bfc77bf5 100644
--- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
+++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -19,8 +19,8 @@
 
 ERROR
 {
-	printf("The arguments are %u %u %u %u %u\n",
-		arg1, arg2, arg3, arg4, arg5);
+	printf("The arguments are %u %u PC %u %u\n",
+		arg1, arg2, arg4, arg5);
 	printf("The value of arg4 = %u\n", DTRACEFLT_UNKNOWN);
 	exit(0);
 }
diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
index b11f6c99..3e7caac4 100644
--- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
+++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
@@ -1,4 +1,4 @@
-The arguments are 2 2 4 1 64
+The arguments are 2 2 PC 1 64
 The value of arg4 = 0
 
 -- @@stderr --
-- 
2.18.4

