Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5974A2C08DC
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 19:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776454110; cv=fail; b=sHvFoBHxaSEHuzeR/4IWiTCzX4gimT2vOnNH01hdMnr7RN/2eHIsIlZoLMrIOa4Bo2/YquozaxlMihpB/BcPlnlH+2VIElsPsaJhG5AvGzxo8G4K2L6gY0Xvhl2GE1uoMnII2nGNLKu/LmIvwmA/PwlML7fULTx0Myq/+ve2v+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776454110; c=relaxed/simple;
	bh=UItr1L8kASKc86ucXjUCp41CooQZcSHpop12iKOAwq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IqPJ4Cdw5OCmqsEA5x9yTUBqedaEv9YqhyP9tbnaZu5Qy7BThxtcf6pY9DTUj2wVw4JHFRiD/JK3CEqrQNiR9ofpyMaNkQzvhjN+1PpJekD7k9f5jyrxb2QfDTPhK6KL3HnI7+8mMZeCOZJMJe/uNuid/37eQ7rHPCic4cgXP+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jemephzP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kJ979rpw; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jemephzP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kJ979rpw"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HCWWuO3333877
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 19:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=q9cev5yEikAFYw9r4K
	cZbpLXSUKsB6y75kfYh4LTtdc=; b=jemephzPfMshNDHsb99mAlUWOHZ+0uj98n
	Ra/0dMd8N5aWdFw1dDglmwI1i9+g6WILRo6eQPdNaFCvMbS5C4ek8KrOORZnugn2
	eN1MDfQAU7koSI0Lf5iUZ7Lik0CfnUnnW1RDpLMLVOWEBOdVGksTqrgBZC1kqgjl
	O4bQsuZAplwSYSSQrytsuKTF9AVl8HHDnBGy0ANga4dFc3CfeCcIgPG5EBDY+WgR
	jjzZHq9MTollhcn16d+XazatbUkdC6D7jXc/55z4VGirYXO96sebZm43FUJVHoJt
	KN8VkfjdcRErw0u9iHsrEtIee1t09KwS9LbpAkPlif/+2a7EUKSA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dh85qje1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 19:28:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 63HJOMw9019977
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 19:28:25 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010040.outbound.protection.outlook.com [40.93.198.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4dh9jtnvc1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 19:28:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sO704GiL1t+yIeRifPRyvngg5TDWAIr09OWH8Og0I8Q2ApzBHSq6GPHIEZ059rTLARZMmDqA1q6I1cs7e1cC/c1/XqSnVNd0dv6NlW60qV8N8D/R2DjrVi/QEWV4ImIlYWzzABSC+FkEjx8gtSN4B3xANJLubr0BdwbWzOPl4s0ItaHxSm/MGH2FpsDfhPyHew7OaTdURI8iMXnPXlUqkgFpnl5Pf7BGvNbL0ECp7pTpMdVq6xw/T3FKHn89ZNZUyekPf1VITojB8yQ/cFXMGnEOUUMKb1TUWUve6AW7V6pZy0b6giWgBqOckfgRnMoEBnPY5M/sCeHM4WoiyEDbPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9cev5yEikAFYw9r4KcZbpLXSUKsB6y75kfYh4LTtdc=;
 b=hpvRp78UIBkZqlEAYtTGD3k7QBCIWi4nzS6vslTiQrLaWIPtZo4PNT1lLaOKhknLh8IAiv6bZsjh9D/OJ69VIBzEB+elwNxRJJU6IZZJQf73Vsocr5EiXIdQQyUbTLNrVTJvPY756tkG0J3rwTBUBlGQoECxBnZZmnTh9WldVy15FeBI58piP14MOCz6PEQxvZwfDtVfb2TOGFPumJVbw251MSRZ0qHoqiIvQT7OpTw4zxTeYsOc99op07ICfc/snTKl+BWLojHWuvm632UoY4tW4W/rhoVh6uGR1yyeQ2g1tSYpjZ6DCs8kCwejLhOsh4MqSjHoSiEafPZHg+VY4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9cev5yEikAFYw9r4KcZbpLXSUKsB6y75kfYh4LTtdc=;
 b=kJ979rpwmDl6p3z7j9KaoBd7dUDOfixjUhCZhlycRGbe8M3bK0UXCU8YFJd6WV4Vda7NfNQ+B5deKIUlPPdSEb3FJ0dzFIaXUYoLQMZDrQ+48iPAiP6PZDEDtEcmamJ3RVSCYsxc1vB6jeuKB2NfWrl+2ibdu3ZYVLrSO4RnfZM=
Received: from IA0PR10MB7325.namprd10.prod.outlook.com (2603:10b6:208:407::20)
 by BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 19:28:23 +0000
Received: from IA0PR10MB7325.namprd10.prod.outlook.com
 ([fe80::edc9:d2ca:45c2:b41a]) by IA0PR10MB7325.namprd10.prod.outlook.com
 ([fe80::edc9:d2ca:45c2:b41a%6]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 19:28:22 +0000
Date: Fri, 17 Apr 2026 15:28:20 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 4/4] fbt: do not provide untraceable functins (for
 fprobes)
Message-ID: <aeKJ1GaxQ+5EVRdw@oracle.com>
References: <IA0PR10MB7325BFFD3DC90AC2FEFCADD9C2252@IA0PR10MB7325.namprd10.prod.outlook.com>
 <87a4v1zf3f.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a4v1zf3f.fsf@esperi.org.uk>
X-ClientProxiedBy: BLAPR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:208:36e::9) To IA0PR10MB7325.namprd10.prod.outlook.com
 (2603:10b6:208:407::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR10MB7325:EE_|BN0PR10MB5128:EE_
X-MS-Office365-Filtering-Correlation-Id: 52503a37-6c09-4dfe-edba-08de9cb77d12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	TcfTHUiEXoOz+6YLpj/ZtojLnXmiH21hWvmLWbbOJyV3oIlo4EbYwc4rUL7Bov4SQ7GowHZJO3q9alZBxqfMmJfFDENkvTUwYJnZVqHJep8IHLCZa920dNO55CNJg0lAjfd3YAsRiDBTMhZIs/OOvhnJkJp5U8OHw69p8j/pMa6heGsoD08Sk9ss8WBF+VUMQlZ3EOOaZWdYfNc3dZeT+mG2b2dEzaOrbM3Kk+a+S7S2NjdUBu/1WbV+Z9qZia49ZcGa7VCTnsvgLaURuaGAxU9ue5UzmpeOZ5xzyN5HKGsS/sHRASRAHE+H/PN0KiN7KMSYepaWldW5W/ED/eGlQN7PraSoOHSImJAbyjqOgMmVHo9qJKWRlIwzaiTQZ5aRgiQ8DmQSSV3Kv/pJ4Yl5LA9cqkEN6fVlugvLYneohQdp1yXNy0AdHgly0uCgvNNuVXY0aaenMXAvPSVCjqOqSDvD9Ow7R24/8/Bcget58XNkJy2jybU242ni5YPS0eRfb37Vi/0bv5wx1G5qYDaHpJi5AYgyGBKpMsJSEQm41b3EUTuCRUJR3D3+xyfW9//2M3ATE6bI7yMNMRYIJXHT3oSHQ/Lh7KajTS2O5V9fvsTnkO3OwZ3AjkfDsaReKIAwtMZw2ZcgQnYjuI8Yb3v7ftOu+epkn/tq9y3zAwkcKPerftsUywX6xLw1SWlgVQf8z/9dpuWeBFRGeV/+Ni8oKR8W7YwQu2Rb78Y8bq+iKxQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR10MB7325.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IiuIQ2nwaGXjx0jRFZ2zCrBEWkIoDiMxQjOdIEKKjN4mZD+nRNXRh+dOGeC2?=
 =?us-ascii?Q?Qwa6pSLkefGpSEkRl8ggVdXtAtek0Wl9TZaBabYeb4bjaZrUswp0fF2zBZES?=
 =?us-ascii?Q?9FiZpOHtsRLIA9pNiFo9+HFkbYzRN5GzH2oO/6yf1Y3GbXU1O6rOdN9/zGXD?=
 =?us-ascii?Q?EsycJEERVwAsJGHYBcm7TgqPASPrweQObuCFDrzNTy/W045Szx9ZpnycCmbt?=
 =?us-ascii?Q?QWWnGZX+VKudev45gF0XVb7SQWIIDFs2uSdKBH7H3XCajhSNqBp5wmYwMW/a?=
 =?us-ascii?Q?aC5DZwDPVv2mSP9bBy4VmKID1AuhYTwanZZDF6c/QHVLVkKHoDRnHSJO57pq?=
 =?us-ascii?Q?3am+3c5wwHCQ/p/d58yRi9ShxbJujQuynU2oS978XLOav9uY0nCLQSgvbMMk?=
 =?us-ascii?Q?PDnsvC95bK59CvUThYbahy1j7XgIceYjaxJGBnbL8+aAx+ZjXhw4Td0lE50Z?=
 =?us-ascii?Q?7Wdy0NnWEnweGL3jve5EmnSsi1ff/PbeXohU9Owl8yC/R9rcNDT33vyKAHha?=
 =?us-ascii?Q?J+N6FIdd8//m+gh4KAwCNAlNVYjoqCo9HP1zcSBXfHpW0fHsdheqNfbzGAhl?=
 =?us-ascii?Q?JIiYSo12Go6ni5HcUWDo9XbTLtf4vKnZoyzdJPD0TDeNWcMWGMPTNvDRK5EL?=
 =?us-ascii?Q?cPCvk9X8s1aPhvIsoPZvoW696xWGIkbkSYhSt3zXdo05vRgwikVTzsYuM+4a?=
 =?us-ascii?Q?mUbg7Z/mGk8imQhTMqbVE19qJGy3U4WDmV2cmbLv43XrAQbKZS4OuM6OE+lp?=
 =?us-ascii?Q?ZJmyQr2/0RAoxzizZtkbE1WZ+S2Z8G7g2/3gKIoxF9NV1AUZjIjBYzc2/Rem?=
 =?us-ascii?Q?UXv7tax8w7Z9YQWIXwpMqyVTv7vhHNPJmOgUOapTnIb534daPJRcBmhlS3oQ?=
 =?us-ascii?Q?fDWGRapUaWYOR7jraaTrjP3xyoOrVE8Oy2frDvKDCOjPoYFL5y4vNMMBtA2H?=
 =?us-ascii?Q?Lbvyf4CikzOm4bWoBLMK+RbVHCvY/u/OrN2AN3fd3+elPhvVJGJCkDd2RdpZ?=
 =?us-ascii?Q?8gR0wnrJ86of18EiV/q1JYT2I7/Soo6HGtwMQMxapRAaK7yBiKeTgjTi/vbB?=
 =?us-ascii?Q?gjub7+66f+cNZZ3rEWeZSJzExxStqfD0kdUSpBd/pUAUa3Wb9awc3UTueaMd?=
 =?us-ascii?Q?TjxaI80B2awVCJRfB9eJ9nNWbMIFyr0EpW6QOcbHtpfIZgmUU1mQl7xPd3+5?=
 =?us-ascii?Q?GNp8e4H8GYF52Y4Bdwc0kouso9JeWz/wJ59zY7YMI2yK0cfb7xWhaRE6P1bn?=
 =?us-ascii?Q?n0qnNMrDPUNsqXtfBkInhVC8kPhBP2Ykm2G6JtfySuaLkpQ5WA1tCCrrcr3s?=
 =?us-ascii?Q?oeN97y+PkkOG5b7CKmJmhVQsEJMeWdZGGhrwqCIJY8KA96WnQZCA7Bu8dk+/?=
 =?us-ascii?Q?oBHiivpV0YncCgKeHd6m9fjz+H1A3an8CJ8BTXX7qSXLQoLolVCxTHRkj5Jn?=
 =?us-ascii?Q?6SiC5tkdCGs+V4JyDtdSh65oA/6JSVFRzMt9B4OjK6y5wE0T43GE5dwwklI6?=
 =?us-ascii?Q?WuJv0spVoXFYONQjHV5kCpLy4NQDb0FkCJir57m8IbveiqHkXHWV/+KGV/nL?=
 =?us-ascii?Q?VGukupAYb4Z7GmTaBlEAKi7En0UzfTMykXpAHo9AikTmffzIvk4HOKien8DA?=
 =?us-ascii?Q?cOlmdyYRSy4ZsNgrqWdQGYoB2mBI4KZ6/Ps/ZiAoj8s5DbjF+oMYe3MppeYd?=
 =?us-ascii?Q?U7Chwvw1omDjCFwX9C1yxKhs5I1h7IBqLkg7aHeujnl6P/habg9dsGDfq4iW?=
 =?us-ascii?Q?yDwi7myvOw=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	S6oG6Vr0TP63j2IrVwOdiUtShzlMqRfXWHKBJdgCbepeo17ymXne8sory3Tzd8RpUUd4kRnG0rD7mOyPcaBxPbtpyTrdmmHobRz84iRqXCp8YzyQI+/a8n4ArxdMFx6mntcE1ATtklJ98i4t9jrKykwtobnVpK+nA9RDiBPdmRV3Rdzsdv8SIYmUQs4Y22x/2nwhFeBgUuWYe6JBmjrT47ABt54+MGu9XqcRENpZQ1IPPhHGBOb9P6YvDRcWZhlvys38gaLXZjwWS94nkBllq7dDcsZOAdA7yDIB7EuiXPSrHlQqmkWAcEfsM89cMDyFyFK83Dr2tO5wP6s8yTQu3w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DLblwQnwGHmXkBPXMSo4uWCBLxvEQdmAlwmBwusvhz3yxamiVquhh1dUldUgAYxufbBjoFWHlWALpVre3Rgbup4l6k0VCmHU0iAM0Su1YiY5kuBLSONf29Hid3QjkXAWCoKcMi0AivoqCFJVLnAUdjAnOQmYwS4emY6BJfqfDoqsIl4hiIDsZvV1ouR4ECMck9BvhxrDTbwyO4YnIuTqaSnVjWsJ+n3f0bsLTJxGPEd1ItsFsZMgMrP1O2noHi5SDTxySW+GdCca4aL0sr3g7BLk9mFEJWXcIf9uGVOhSWI5AoMEYKyzQt6mLcrDZpiEWQtcU/QD+dSU2XQreIAnBVWakzDWVxdgHueAyPLd3xpxkvi8qJGToG0GGF6NVJyWKV0rhF6/+gb/bxfGsaEca1Vrfw99JUf8gU0HBGC14TB81TvVsREm0e9lto7Vei/8vTf+bgH6ghQ1hIOO/lLD5sMdq1NKIzmdxRW13TuOkdueBuqy0a9Sr6WfEgomwWyRb+fLBwc3pvXchPh0IqrxKY22wLr0ycDjzTMeVmM08lJKiQ7Zcu2vZnX8J8zVgb70ePlEtD4ZIOR4UUIDRM39g5H8Nb6H9DB2o6j+DdeR6LY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52503a37-6c09-4dfe-edba-08de9cb77d12
X-MS-Exchange-CrossTenant-AuthSource: IA0PR10MB7325.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 19:28:22.5759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XwZDpMZLm1+8GTyrEgVJS7N/G3MjsyPtWb8Y+vPI0Z73s6h9GO36+DJLfDWGbZ+wGy+H0SbwWzNmKAMxU6P/5vg5VivJFKF+7RvvnI+ke2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5128
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2604070000 definitions=main-2604170195
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE5NSBTYWx0ZWRfXzDA4N5Gwzsnk
 tykNC55jbDHDmVVmKly1kt2rF5dLp8uoqPrrWNTUEnj5YjLtfF8Z1WWdmRyz+GCalJZTjDhSdvW
 S122v3S5NRubCu+0UzL5R/Wl62CdYrlJy983bYF1XJsCQPbMnCLlYY9FrFOBg5Ch+sykEOMsA4v
 wSV+J+UXpUANgGh9eenAynajIrt7dNpTpOR3yJp+lRevxhdtkrASjSqvSa7shMekikGLPsfISHS
 7Ns2lglXrbEAqUcLiDMT7/p7qLvWvimwEtFhKgtqFzZZbE5ZjyBZJzaL/YVxEKe0yAPEfzrDob2
 MeD69YiEP2npucnIpyp8u7xIVEK+Wh5pL0K10Eq7/37Y7nCSJYcmwpYnEnAjdUwVRaGzVrD+Asd
 5m80uLMrx2v7VdMYk6cx/OQDE8v+mureTvutmiEgofVcIt/GWgcpqcGhRjFGgzVGgT28AGkx25D
 zW/8xBTGrhlZp+Wy4LQ==
X-Proofpoint-GUID: vG0f9anqWS1_ZdNKogiL0fBYGbi2FlS_
X-Authority-Analysis: v=2.4 cv=V49NF+ni c=1 sm=1 tr=0 ts=69e289da b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=RD47p0oAkeU5bO7t-o6f:22 a=yPCof4ZbAAAA:8
 a=gh62pwkU3Cza8M1F2j4A:9 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10
X-Proofpoint-ORIG-GUID: vG0f9anqWS1_ZdNKogiL0fBYGbi2FlS_

On Fri, Apr 17, 2026 at 06:11:48PM +0100, Nick Alcock wrote:
> On 14 Apr 2026, Kris Van Hees uttered the following:
> 
> > Subject: Re: [PATCH 4/4] fbt: do not provide untraceable functins (for fprobes)
> 
> Typo.

Thanks.

> > Ensure that we do not provide FBT probes for functions that cannot be
> > probed using BPF fentry/fexit probes if fprobes are the default.
> 
> I guess falling back to kprobes for those single functions alone is
> either too complicated or has unpleasantly visible side-effects?

Someday, perhaps.  But right now the infrastructure cannot handle that.  The
implementation of probes for a provider is at the level of the provider and not
at the level of the probe.

> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >  libdtrace/dt_prov_fbt.c | 47 ++++++++++++++++++++++++++---------------
> >  1 file changed, 30 insertions(+), 17 deletions(-)
> >
> > diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> > index 59e4583b2..a2f20c9bc 100644
> > --- a/libdtrace/dt_prov_fbt.c
> > +++ b/libdtrace/dt_prov_fbt.c
> > @@ -86,14 +86,30 @@ static int populate(dtrace_hdl_t *dtp)
> >  }
> >  
> >  /* Create a probe (if it does not exist yet). */
> > -static int provide_probe(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
> > +static int provide_probe(dtrace_hdl_t *dtp, dt_module_t *dmp,
> > +			 dtrace_probedesc_t *pdp)
> >  {
> >  	dt_provider_t	*prv = dt_provider_lookup(dtp, pdp->prv);
> >  
> >  	if (prv == NULL)
> >  		return 0;
> > +	pdp->mod = dmp->dm_name;
> >  	if (dt_probe_lookup(dtp, pdp) != NULL)
> >  		return 0;
> > +
> > +	/*
> > +	 * The BPF verifier does not allow fentry/fexit probing of variadic
> > +	 * functions.
> 
> This comment is wrong now that this is being implemented via another
> function: the fact that dt_btf_func_is_traceable() checks variadicity
> belongs above that function (and is indeed there).  Something like

Oops, forgot to update that.

> /*
>  * Do not provide probes for functions with BTF that indicates that they
>  * are not traceable.
>  */
> 
> maybe?
> 
> > +	 */
> > +	if (prv->impl->prog_type == BPF_PROG_TYPE_TRACING) {
> > +		int32_t	btf_id;
> > +
> > +		btf_id = dt_btf_lookup_name_kind(dtp, dmp, pdp->fun, BTF_KIND_FUNC);
> > +		if (btf_id <= 0 ||
> > +		    !dt_btf_func_is_traceable(dtp, dmp->dm_btf, btf_id))
> > +			return -1;
> > +	}
> > +
> >  	if (dt_tp_probe_insert(dtp, prv, pdp->prv, pdp->mod, pdp->fun, pdp->prb))
> >  		return 1;
> >  
> 
> The hunks below appear to be doing something not called out in the
> commit log. I think this is getting the symbol module right?

This is necessary because the code above needs access to dmp.

> > @@ -173,16 +189,15 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
> >  
> >  			pd.id = DTRACE_IDNONE;
> >  			pd.prv = pdp->prv;
> > -			pd.mod = dmp->dm_name;
> >  			pd.fun = pdp->fun;
> >  
> >  			if (prb & FBT_ENTRY) {
> >  				pd.prb = "entry";
> > -				n += provide_probe(dtp, &pd);
> > +				n += provide_probe(dtp, dmp, &pd);
> >  			}
> >  			if (prb & FBT_RETURN) {
> >  				pd.prb = "return";
> > -				n += provide_probe(dtp, &pd);
> > +				n += provide_probe(dtp, dmp, &pd);
> >  			}
> >  
> >  			return n;
> > @@ -190,22 +205,20 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
> >  
> >  		sym = dt_symbol_by_name(dtp, pdp->fun);
> >  		while (sym != NULL) {
> > -			const char	*mod = dt_symbol_module(sym)->dm_name;
> > -
> > +			dmp = dt_symbol_module(sym);
> >  			if (dt_symbol_traceable(sym) &&
> > -			    dt_gmatch(mod, pdp->mod)) {
> > +			    dt_gmatch(dmp->dm_name, pdp->mod)) {
> >  				pd.id = DTRACE_IDNONE;
> >  				pd.prv = pdp->prv;
> > -				pd.mod = mod;
> >  				pd.fun = pdp->fun;
> >  
> >  				if (prb & FBT_ENTRY) {
> >  					pd.prb = "entry";
> > -					n += provide_probe(dtp, &pd);
> > +					n += provide_probe(dtp, dmp, &pd);
> >  				}
> >  				if (prb & FBT_RETURN) {
> >  					pd.prb = "return";
> > -					n += provide_probe(dtp, &pd);
> > +					n += provide_probe(dtp, dmp, &pd);
> >  				}
> >  
> >  			}
> > @@ -242,16 +255,15 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
> >  
> >  		pd.id = DTRACE_IDNONE;
> >  		pd.prv = pdp->prv;
> > -		pd.mod = smp->dm_name;
> >  		pd.fun = fun;
> >  
> >  		if (prb & FBT_ENTRY) {
> >  			pd.prb = "entry";
> > -			n += provide_probe(dtp, &pd);
> > +			n += provide_probe(dtp, smp, &pd);
> >  		}
> >  		if (prb & FBT_RETURN) {
> >  			pd.prb = "return";
> > -			n += provide_probe(dtp, &pd);
> > +			n += provide_probe(dtp, smp, &pd);
> >  		}
> >  	}
> >  
> 
> The need for this trampoline change is also rather opaque.

Oops, that was meant to be in a different patch.  Will separate it out.

> > @@ -323,10 +335,11 @@ static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> >  		 */
> >  		dmp = dt_module_lookup_by_name(dtp, prp->desc->mod);
> >  		if (dmp && prp->argc == 2) {
> > -			int32_t	btf_id = dt_tp_probe_get_id(prp);
> > -			int	i = dt_btf_func_argc(dtp, dmp->dm_btf, btf_id);
> > -
> > -			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_8, i * 8));
> > +			emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_8));
> > +			emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
> > +			emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
> > +			emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_get_func_ret]));
> > +			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_FP, DT_TRAMP_SP_SLOT(0)));
> >  			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
> >  		}
> >  	}
> 
> -- 
> NULL && (void)
