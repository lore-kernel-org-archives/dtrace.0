Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BC81FDA8E
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758913569; cv=fail; b=aAiiqpZMwyVVr2HUNaTO5WZS6mj0BK6FsE4Iq6rYkU8YFsZ4YPU3Ifz3k1KCrn4/KtYr4v0H0PcYqtHIJvVJLbPSf8ArC+Z537xeJkmi5gUC6hLHnqpEBfwz19IR1dAcQJ8rAq5N88uLfxnWmlFQ+7CMBC+HpZJkVy1Me7NYy48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758913569; c=relaxed/simple;
	bh=I4PEiovxThd6PdOfLB0YaaTpYs8dsQfGTRJ3qkvIAYI=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=gG5XgfM5J5d34cGWgSE9HkGBnQQ5QTVpwMBjSSd5rU80BFylIP4D8R7OKPErLUrW2qgkxrxtUL8Wv1uxY1kA4wh1dMjqEhxjkXwYUVX1lP1zOhGTj3e2KRUp+RZHYjcMSO7UAVMVP3b2n/Z8Yy0MQR2woSNolF2PXa14bEmzU3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gAgiUTZ0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CIDm4e0q; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gAgiUTZ0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CIDm4e0q"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QIieTs013579
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=prLpIkAqMhxa5dyCyI4UPKQVYR7ls92dKMwVZlQQFVk=; b=
	gAgiUTZ0f1FI4KoBgkyIYx/IXTXo/D4F2mCNvlEq3e4uxniIJ7z5tZb7u26mptKq
	QWUXXAb8GgXQiSBZ/XmNo8TitlHFx/CYriWe7KiAdowHsJsM6iBYr0Wf71dZ8/E5
	1V692bs4NpS4C9EQwBUM1vQQPVpOPkui75UotKmaj3E1u/3+y+JCvF5cy3E0WPrT
	u3gBQqe2H/CGAic9WJHW3+g7B7PCVVGSf0HZ8TQImlWRB8Q1Uemh5q4tTjQf185t
	NLxW70U5Yrr3PgdBkXMbYG6zqIWq7QocvWUUw+uyx/tr2psITSrYJjbKr/8Ggl6F
	uioSdKYaDOcwQw8lpnjNRg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49e0cfg0xm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:05 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58QIJb1W020812
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:04 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013064.outbound.protection.outlook.com [40.107.201.64])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49dd82xntm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KU7WwS4Wxqghua4abjpfaGvcQVX9pkBgxr0R8ufXOa48RtU4n7lRfL/7b3jRBRaTO0jK3rosKVRjyXvxpK6zwxXrvSBy2qE6/VSDjtfGkL9VlKC20qCTxiTnMIHVMcw1Dl6IimA6ujrTtuHvPnR+T+6Xz20+VRJdyGsNfsmNtqqQboQxHDoBOCVBFvlzWcCwDbPERmNKdheedzDClxqNS7BcrpkU2vI5EPgdEMcarJcCB0BlfwM9ylNX/MHMZNt3StB5naJwiKPzth44TmDWNcfGqXo0eCJgJMC17A+/HFu2Cn4F57jiuFCCzsdOG2PPowHlPayvQiuKGms/kDBVtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prLpIkAqMhxa5dyCyI4UPKQVYR7ls92dKMwVZlQQFVk=;
 b=SBYtMXLFfzWCMCWSFZDT3135HcbXb5mHqUrcovDvI2aKV6VI1+rH9/qsAs2uAZIfYXG/gIsnv/MmF8pEhJiQ3U4X6iXgiKWtr43Appr+5tAkwo1OBHefOKhWZ6cEuvG/3xBj2VxQGMvlbOwH+V2T7N/9tr5oxlgYW7TRmefcT6zykAz1MipIXe0SJEdwS35DEjGeY8rJm7oQbrbUMr06x0Mxutl/PCNnQ/SQ13lQprCUXpvuoN2BLaUlyXCPOkUBez1SKhtysD9GY46WMvYAI2V+5PR6pBgn83RB3bCcV/L9zUV78z2Hn4ERCBuP1bVbvk7gjk3EeaFNh2gtfq0VKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prLpIkAqMhxa5dyCyI4UPKQVYR7ls92dKMwVZlQQFVk=;
 b=CIDm4e0qus5R2hJQDm7aUaIh4FjZ0hFWblg+weCtjA3T20ZKq2f++4qq8nVo8l7ROVTDSNGuSCcqaz6DMeLD8l+pOhoubQ/1saXrNuM/VkCFpBrL/96UH26QIltqs8od6/WS8oSGEcl1zMjh+NUCzKFAsgBG3RkkTCehSuFGiQQ=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by SJ5PPF0687F9010.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::786) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 26 Sep
 2025 19:06:00 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%7]) with mapi id 15.20.9160.011; Fri, 26 Sep 2025
 19:06:00 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 01/20] Fix comment since pkt_addr is not NULL
Date: Fri, 26 Sep 2025 15:05:38 -0400
Message-Id: <20250926190557.8485-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BN0PR02CA0056.namprd02.prod.outlook.com
 (2603:10b6:408:e5::31) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|SJ5PPF0687F9010:EE_
X-MS-Office365-Filtering-Correlation-Id: 8070f22c-c1cf-4775-90ee-08ddfd2fbb17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CcGskMuEoTrFqwboODoEeVT6LtgfCJ/X/O589A0gftmHAo2frYPAXG7ObUJk?=
 =?us-ascii?Q?FxiviQLkIAhKOUSZvun/ktcyoRb+ECY6GpNzNYQJCDiV/AAf52CgAl/T+K6c?=
 =?us-ascii?Q?rDLFK/6n2U3fqXeX+SH7LVHOYtjepvX2OukqNVYmUDLNTmEg08e+PcyaC8e5?=
 =?us-ascii?Q?AAv7lTDTsZ62GGF/hPzb4yBG3z7m7pRTmQQ/17AJ27ZKMO1IRFIZo0jJeHYt?=
 =?us-ascii?Q?ktaKUZiLk3kusMfsbVCHe9QJV3pPtwUc1naS9aMqwgtOH/9f0I8rZv0DvrK/?=
 =?us-ascii?Q?YLbI0XN18As3keRsBzwDBBGv2RAJW6FK10ElOTYlXnxGGkyWtggyp2lII1Z4?=
 =?us-ascii?Q?IcolebLoeAgcLBSTAQ2im0CEat4JO20ApltomIVCL+zs+GumA5wY+NLBC9c7?=
 =?us-ascii?Q?6Z7qZSkE69lMbtO7Z5V98Ya+SB7i9ItHxCyGBSgXrPn+03HBv8SB2C9ShS/H?=
 =?us-ascii?Q?e1z5G7YU13m0V7AHr5HCkBhzXlZOkBIM5xEayKra4AJ6iWm0rAWb6JjNXhXa?=
 =?us-ascii?Q?pvvX9NnXHsNmxaioL3vQszDU8sa4Lgw3P/BN0bOpfYlQDrFc4jY05JDPlDve?=
 =?us-ascii?Q?7RM6yDfr1vVLnI9elLh+rfkLQz0sjDpGsX2HglyWEB0mmUQpChzaaiuzlEEb?=
 =?us-ascii?Q?rLa/DaYjlxWRQ4O6jzgqtiR04Bm2kyTU4Q0lb/liCp5JPEtU17r66xtevlIA?=
 =?us-ascii?Q?6yc9FGM4uoaUHk0Nwlh5ukstcEZ5aokmX9jt6OYkM/AS4Ia7jTGcV6H6jP6T?=
 =?us-ascii?Q?X3SLxXCPjZlRlJtK+juQZtaBRJlcMHh6dlnM7Fa6ojc6AeJhnKBmnp8I2hH6?=
 =?us-ascii?Q?qNvXtYLJH6fDBjFZmFwrHhmWvlfv5SSs6MYLjklJAZbiddrRKrL+b3jw2ea5?=
 =?us-ascii?Q?2YBzqjzO5jYk4ZH+PMkENH7t10zkUtt8GoYSqEy8jO9ScOzzrQLnY7/In/Nl?=
 =?us-ascii?Q?ARp1BKeQTtqjyDQ1C0D3in5bz4GENfNkarmE5k3KVkLaaQZbb+dfqJmAbrHO?=
 =?us-ascii?Q?4K7BdbLueXOQ3DleV8xkth7bGPVO+u3TQfP4o6teiHWn70thLd5hxOVuD+Dr?=
 =?us-ascii?Q?ZVbusCBO8QlT/YZ3hiXcsVWpU1B66JEh+jdQfBOrebh8C6BcYKMNeLkwVmkD?=
 =?us-ascii?Q?4D2CShIWgwqjxAStRz4ADDs1twwM5EL/2UQoGnk2uQK0c48Fhzv3ZB1fhyTf?=
 =?us-ascii?Q?+2NpfFY8N+ZFOBDuBnmAyWKyaTxvY5DTQ9uDSrIAe+1CpDg01X4BCS/A8zYo?=
 =?us-ascii?Q?jhG39/UFaPZQaujPK5636WjaTb1LScWxd7MvCeHNj10Hf6wDllSmBaV5bAjl?=
 =?us-ascii?Q?Q1zDOSDOdIq5jgNSc7QfIQv6D30hEz4eqyLDpb0/ztB8OHdv1fdx4cQqZhS7?=
 =?us-ascii?Q?ZwaQGgyxc6Ijj/MyK438kfFuskcni62EzMnjO9SckJPfxZKNdaTqRTeRM1+G?=
 =?us-ascii?Q?V5rObzOMcRE+O3SqCdI8IJczXtyGvDQf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lyW3np26XzJp79Wk9Ndkkk2ZccVSoL9TMNhdcwMOd+hq681LlhQfn5HkLH3f?=
 =?us-ascii?Q?JLaBDeHB/hRzBFVM8Ma3PgAe1Mm7+jUwgxKJCilsRQNhEoMUvAylHkbWjnJI?=
 =?us-ascii?Q?HdRQztVIU//Ykc7CscXQI6GIDNWTBqaAI6zZXrtJ0H/WgLebmCrhzmCdLBwW?=
 =?us-ascii?Q?t8apu6hhI5FGbcN9YTRTTZCu4V+axcPj+NoRKofOaRcPO0d0ALnye0wIRQpv?=
 =?us-ascii?Q?ZbrUlpVC7xFCxF4khqt/xVLLJ9RFLdu04VAd1SPWLlDNVWmlSxLawsEDI81l?=
 =?us-ascii?Q?ip8dLYnJxjWVOW9jW6Z2igk9Ij0izZyrUHQ5NzG6kah7Jnl/exAiyV4lR33h?=
 =?us-ascii?Q?PifIZIwaqls3iRcVfva3JzJVBj3iLwyY7wxJFm90m06zvW0t7pl1mKcHZLg4?=
 =?us-ascii?Q?rVZ236ROeWfMwmJgZgngKaCvn0msoI6MvdWu0CKtYHu/m0qO/HOTsuK4yXiR?=
 =?us-ascii?Q?W7lM7+SuldqObokYvh7N0u06hH8u0vMZtdpHaOlVoGmKd3/+cK5RubgyP//L?=
 =?us-ascii?Q?lGCOHHLU4IP+7pkIfiBtTgLlKMBJi60POW5B2nCBAimZ8GRShbsE8IrB8D2D?=
 =?us-ascii?Q?rcdoLgjunW1JkjHaqpi9ba0T+Fu5+Knvb6nTFI6i7hOxiDKJwIxsotZOU5zU?=
 =?us-ascii?Q?y4Guqa8ho8pxfNWEn5Xm5TO+D97I/TfezVAx5hMTvXQhjtYlQKE4JJC3/kt3?=
 =?us-ascii?Q?W7KpIy85iDsy4cyk46K6JWFIZrBAMMpWlNPhA1JuDOARkg8Dn+Vd4n7Plszu?=
 =?us-ascii?Q?MCCaHq+sg471//kRvCdArQHRXGMI6cfMfDftr7lippo0WUpfWp7+bq04KkrO?=
 =?us-ascii?Q?uPWOXnNDJjc8yXxjwJDM8nTXZRQ2rUHzfFL0gCluAKmJESKtap8jVFm1uqi9?=
 =?us-ascii?Q?qghBqZN6ZUBPUWvQuxaOV70WpL3s1Dp0ahakYkq7wPN2PwEVKQ3YPjYkhbvz?=
 =?us-ascii?Q?rgsunMRolIpMH6u+dnMtLQkT8Ujft6ov5gIYjJEDPImwoAfrJBMOHvJHRCzR?=
 =?us-ascii?Q?wZsckcJuCkroq8g/dG3EM9IBsVPZ9V15d96NeDATWSjyKbEk51yVUc0pEEm3?=
 =?us-ascii?Q?FJR0Q50dVQwsr8Wqc4X8bGle+Tn8obQH8FCQlPZtoZcE96qSgnUzbcfZO2Lq?=
 =?us-ascii?Q?UCCcflcUVug+0NSM1vvaV2MNj87U7RSxRORiicyWpA5NxRvWuz3axdH5sC5g?=
 =?us-ascii?Q?xKh2yVftw6mMHrqaQeLgo1sU4qh1VLsByE9IxOLl1XVyldqK5/otoBFmP46a?=
 =?us-ascii?Q?wU3ZZ65PyPg1kJZJsbN0rlVmsZQOLcAs2p7/iu87qjzJil3ymGU73V/AWmFw?=
 =?us-ascii?Q?clDMKazdR7EgUgnKXvDdud4tzsuneUmrqnkW6a1p84uatxgsODQvK29ng3JN?=
 =?us-ascii?Q?KqcoV56QgGTwPB9xNOH5BXopss2pzUMYJO6Yh1RlGv6xLly18YVwV3OZ5TD+?=
 =?us-ascii?Q?/SHzPhBUTC/Na0pKXP0A9zCOW/dK9lPEoRjAB2LterI444AxJ27bI1fqM0GE?=
 =?us-ascii?Q?+KL4wEm8nCLm0Qr5VemsbkjoLYKgrs0MYZGH9MpJaim6FGAMHI/16tTdTBcV?=
 =?us-ascii?Q?qN/y/R7lkJI6NvgFNP/FuH93dihoLq8FxLCQ8zU/?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VfBBkWpy23d6rum4b3HqMKAjP5iFpJ9OxMTeE2KcB2C6NZlTL6wYviswhZ1uqAmaAtHf3uwjzmy/+p+yaKgpkPoo3apQq29gheHZbKEl51sv1+WZSr7tIFEmCkyy7B7WU9r4zr/YVo2oZS+a8A1Nf0NVr+aoAM8XLGsPZr+ZxKC6xXBGglLwKE5WEORqF6Crduo9UKYZBW5vwo8Jlf21wRcd30E32gYW/nKVtYzC3TysBoCa6jx5o5x8qe2TDfYdRAuyj3C+YQZbFZW1NrrVPCNdqKdEgfU2+ONeExyiBeHGA0TlmiNLWTGgvTgVf4LwCNn9cUegikIEI1B5J4juOX75LorYMcAmYNl/84dmpu1RHFx2qxbRoUzC4DpWwSR7Elis3zaja78AaRxYNzoX+FofP0jnqxM/i1mawtPr6U11lilh7jcAWtUBerC3rwCYSityrmxBe65GXWQPL5+Nhr2DLmzd/u0VPwvQbpj299t/hKUExyPqenR52dErWioq7Uj4pZcQtSwY3SCEmwJmtYGwdEuzVJ4BuQbUAZSwlyee+kn+4QqH/4XO2TUq84Y0kzt3jnJK4W/T7wDAU6bEQDWPynZdqAiaJ2d9bPqW738=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8070f22c-c1cf-4775-90ee-08ddfd2fbb17
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 19:06:00.2895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bi5PdWhxjcLnora5DEzx7JDogpT3p/WAVbeHHoWLhJhEid6xyBD2T6L0EKB5bVOCuDoIIR9dBgnV5/68x70gPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0687F9010
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_06,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2509260172
X-Proofpoint-GUID: WmkMvhUCpyCZxZjGrmMgIahHaUaNFbXc
X-Proofpoint-ORIG-GUID: WmkMvhUCpyCZxZjGrmMgIahHaUaNFbXc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDE3MCBTYWx0ZWRfXzIqFdfoexijQ
 NuXaG+0KEuP/C9JNmM7oxhOkn65uVtyRbvsN27OEfjBLm/ysmif0E9kXxTTM3LlyBgEnw26sQFR
 0LM1pEhUWsUwf4+Ko82HxgA9VEyj/EhXtCpjUnzbiWsfeT/6ZvPfsF+k28kTCstyIAU5ryu/3UK
 OP9Z6TtjaE8c/UWIyqv3rdATE9ake/X5l2GViyUgddRUpNdtqLOrsnjMgPiV/jUlv0/QOQu2hNm
 9Qp9MqGy24mh3F97kilZHvprwkdkZRQ8s3Xgxa+mhZUC+R3aEuUaSXbAhQlRPFgn9UkSZzdYdmv
 P9S/yeLES9//8TgSYAKqBFK6KPg4qxSywhvSq/npPw/aRj+0iIWajoQF00VH2dPQ10vVBGKNqoN
 VLjdrDKNHyh6WdzY2SDv2AmJiCL6hA==
X-Authority-Analysis: v=2.4 cv=S/XUAYsP c=1 sm=1 tr=0 ts=68d6e41d cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=kR9g6DF9BpIpT0XDKKAA:9

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 dlibs/aarch64/5.11/net.d | 1 -
 dlibs/aarch64/5.12/net.d | 1 -
 dlibs/aarch64/5.14/net.d | 1 -
 dlibs/aarch64/5.16/net.d | 1 -
 dlibs/aarch64/5.2/net.d  | 1 -
 dlibs/aarch64/5.6/net.d  | 1 -
 dlibs/aarch64/6.1/net.d  | 1 -
 dlibs/aarch64/6.10/net.d | 1 -
 dlibs/x86_64/5.11/net.d  | 1 -
 dlibs/x86_64/5.12/net.d  | 1 -
 dlibs/x86_64/5.14/net.d  | 1 -
 dlibs/x86_64/5.16/net.d  | 1 -
 dlibs/x86_64/5.2/net.d   | 1 -
 dlibs/x86_64/5.6/net.d   | 1 -
 dlibs/x86_64/6.1/net.d   | 1 -
 dlibs/x86_64/6.10/net.d  | 1 -
 libdtrace/net.d          | 1 -
 17 files changed, 17 deletions(-)

diff --git a/dlibs/aarch64/5.11/net.d b/dlibs/aarch64/5.11/net.d
index a81fdf087..f14013b9f 100644
--- a/dlibs/aarch64/5.11/net.d
+++ b/dlibs/aarch64/5.11/net.d
@@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
 /*
  * pktinfo is where packet ID info can be made available for deeper analysis if
  * packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
  */
 typedef struct pktinfo {
 	uintptr_t	pkt_addr;
diff --git a/dlibs/aarch64/5.12/net.d b/dlibs/aarch64/5.12/net.d
index a81fdf087..f14013b9f 100644
--- a/dlibs/aarch64/5.12/net.d
+++ b/dlibs/aarch64/5.12/net.d
@@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
 /*
  * pktinfo is where packet ID info can be made available for deeper analysis if
  * packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
  */
 typedef struct pktinfo {
 	uintptr_t	pkt_addr;
diff --git a/dlibs/aarch64/5.14/net.d b/dlibs/aarch64/5.14/net.d
index a81fdf087..f14013b9f 100644
--- a/dlibs/aarch64/5.14/net.d
+++ b/dlibs/aarch64/5.14/net.d
@@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
 /*
  * pktinfo is where packet ID info can be made available for deeper analysis if
  * packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
  */
 typedef struct pktinfo {
 	uintptr_t	pkt_addr;
diff --git a/dlibs/aarch64/5.16/net.d b/dlibs/aarch64/5.16/net.d
index a81fdf087..f14013b9f 100644
--- a/dlibs/aarch64/5.16/net.d
+++ b/dlibs/aarch64/5.16/net.d
@@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
 /*
  * pktinfo is where packet ID info can be made available for deeper analysis if
  * packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
  */
 typedef struct pktinfo {
 	uintptr_t	pkt_addr;
diff --git a/dlibs/aarch64/5.2/net.d b/dlibs/aarch64/5.2/net.d
index a81fdf087..f14013b9f 100644
--- a/dlibs/aarch64/5.2/net.d
+++ b/dlibs/aarch64/5.2/net.d
@@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
 /*
  * pktinfo is where packet ID info can be made available for deeper analysis if
  * packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
  */
 typedef struct pktinfo {
 	uintptr_t	pkt_addr;
diff --git a/dlibs/aarch64/5.6/net.d b/dlibs/aarch64/5.6/net.d
index a81fdf087..f14013b9f 100644
--- a/dlibs/aarch64/5.6/net.d
+++ b/dlibs/aarch64/5.6/net.d
@@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
 /*
  * pktinfo is where packet ID info can be made available for deeper analysis if
  * packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
  */
 typedef struct pktinfo {
 	uintptr_t	pkt_addr;
diff --git a/dlibs/aarch64/6.1/net.d b/dlibs/aarch64/6.1/net.d
index a81fdf087..f14013b9f 100644
--- a/dlibs/aarch64/6.1/net.d
+++ b/dlibs/aarch64/6.1/net.d
@@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
 /*
  * pktinfo is where packet ID info can be made available for deeper analysis if
  * packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
  */
 typedef struct pktinfo {
 	uintptr_t	pkt_addr;
diff --git a/dlibs/aarch64/6.10/net.d b/dlibs/aarch64/6.10/net.d
index a81fdf087..f14013b9f 100644
--- a/dlibs/aarch64/6.10/net.d
+++ b/dlibs/aarch64/6.10/net.d
@@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
 /*
  * pktinfo is where packet ID info can be made available for deeper analysis if
  * packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
  */
 typedef struct pktinfo {
 	uintptr_t	pkt_addr;
diff --git a/dlibs/x86_64/5.11/net.d b/dlibs/x86_64/5.11/net.d
index a81fdf087..f14013b9f 100644
--- a/dlibs/x86_64/5.11/net.d
+++ b/dlibs/x86_64/5.11/net.d
@@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
 /*
  * pktinfo is where packet ID info can be made available for deeper analysis if
  * packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
  */
 typedef struct pktinfo {
 	uintptr_t	pkt_addr;
diff --git a/dlibs/x86_64/5.12/net.d b/dlibs/x86_64/5.12/net.d
index a81fdf087..f14013b9f 100644
--- a/dlibs/x86_64/5.12/net.d
+++ b/dlibs/x86_64/5.12/net.d
@@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
 /*
  * pktinfo is where packet ID info can be made available for deeper analysis if
  * packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
  */
 typedef struct pktinfo {
 	uintptr_t	pkt_addr;
diff --git a/dlibs/x86_64/5.14/net.d b/dlibs/x86_64/5.14/net.d
index a81fdf087..f14013b9f 100644
--- a/dlibs/x86_64/5.14/net.d
+++ b/dlibs/x86_64/5.14/net.d
@@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
 /*
  * pktinfo is where packet ID info can be made available for deeper analysis if
  * packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
  */
 typedef struct pktinfo {
 	uintptr_t	pkt_addr;
diff --git a/dlibs/x86_64/5.16/net.d b/dlibs/x86_64/5.16/net.d
index a81fdf087..f14013b9f 100644
--- a/dlibs/x86_64/5.16/net.d
+++ b/dlibs/x86_64/5.16/net.d
@@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
 /*
  * pktinfo is where packet ID info can be made available for deeper analysis if
  * packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
  */
 typedef struct pktinfo {
 	uintptr_t	pkt_addr;
diff --git a/dlibs/x86_64/5.2/net.d b/dlibs/x86_64/5.2/net.d
index a81fdf087..f14013b9f 100644
--- a/dlibs/x86_64/5.2/net.d
+++ b/dlibs/x86_64/5.2/net.d
@@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
 /*
  * pktinfo is where packet ID info can be made available for deeper analysis if
  * packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
  */
 typedef struct pktinfo {
 	uintptr_t	pkt_addr;
diff --git a/dlibs/x86_64/5.6/net.d b/dlibs/x86_64/5.6/net.d
index a81fdf087..f14013b9f 100644
--- a/dlibs/x86_64/5.6/net.d
+++ b/dlibs/x86_64/5.6/net.d
@@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
 /*
  * pktinfo is where packet ID info can be made available for deeper analysis if
  * packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
  */
 typedef struct pktinfo {
 	uintptr_t	pkt_addr;
diff --git a/dlibs/x86_64/6.1/net.d b/dlibs/x86_64/6.1/net.d
index a81fdf087..f14013b9f 100644
--- a/dlibs/x86_64/6.1/net.d
+++ b/dlibs/x86_64/6.1/net.d
@@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
 /*
  * pktinfo is where packet ID info can be made available for deeper analysis if
  * packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
  */
 typedef struct pktinfo {
 	uintptr_t	pkt_addr;
diff --git a/dlibs/x86_64/6.10/net.d b/dlibs/x86_64/6.10/net.d
index a81fdf087..f14013b9f 100644
--- a/dlibs/x86_64/6.10/net.d
+++ b/dlibs/x86_64/6.10/net.d
@@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
 /*
  * pktinfo is where packet ID info can be made available for deeper analysis if
  * packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
  */
 typedef struct pktinfo {
 	uintptr_t	pkt_addr;
diff --git a/libdtrace/net.d b/libdtrace/net.d
index a81fdf087..f14013b9f 100644
--- a/libdtrace/net.d
+++ b/libdtrace/net.d
@@ -36,7 +36,6 @@ typedef struct in6_addr	in6_addr_t;
 /*
  * pktinfo is where packet ID info can be made available for deeper analysis if
  * packet IDs become supported by the kernel in the future.
- * The pkt_addr member is currently always NULL.
  */
 typedef struct pktinfo {
 	uintptr_t	pkt_addr;
-- 
2.47.3

