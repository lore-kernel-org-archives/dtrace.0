Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AB513D891
	for <dtrace@lists.linux.dev>; Thu,  5 Mar 2026 19:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772739221; cv=fail; b=b7dCD0gjPRzychY652O4iXHTJFajA4E2U5WXfik12h2qvaS+0TZwhoK3Y2i/4IC1Fk+18HylS8qu7XUPh2XEbLgR7/z1hxZdLV2zv3sPpiMEWalEESlmn0fybhO+xCO4er5ok+INCK4Um/ODtIcK9/kJmnxr5VKsz2PL1JjSARs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772739221; c=relaxed/simple;
	bh=1tnc/mNOM9RnSWDlANwqX7gE4TEHbIEMA5SUG8zaI+M=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=H7OvWvJiMR+oQuOWnFxdiHSTCZsXA+zGz4uJLBIU7gVfOF+LO3Bn7kue0ZHE+H4QMmuSWcaL2RrrlN5OOmKMZ91PBNqxujPXUJFat/XeN+T+Xnm0sjPguXZcrPGbdxpno6ZRMnXsqZBf+LaPXL29051/nBdyYnjJz89KHsXI8Q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=X36oU28f; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FCGG+1ML; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="X36oU28f";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FCGG+1ML"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625JXVUI890553
	for <dtrace@lists.linux.dev>; Thu, 5 Mar 2026 19:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=pvEpHyVaaoYStH+ikoTG7M6VLkAImScVW8Bqn7euRgk=; b=
	X36oU28fTlj9JZxqy+vRNzAZDnG5frBSXl9C7oYZxUcnmX8BuYI0zyZy3DdGFDP4
	BN3DP4Op0NKD0JC75SqV/XAf6cKcIfQ7F8IB4Q71PLZo5XIsnmRKpw4p2HU/rKYo
	LiIWM/toD9vEU7gzYpaH3Sr7E4qfd4L76y8qYk9lMmN2E1QUx50R9EtmoLZkxi62
	Mt7XKJxmiLKJVig4Bo9o0xtFhDkpvpy3F0U+xMSjbJGwdio2OcGgGZjwSsJ3Opcs
	LeJQgsnI3Cgaf/6emOhY6rLSl9DphHq/e4MQd94+vziehY+oYbHObjo75nnKZWXL
	c2k4lOIucaGptmT0c8/bXQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cqg3dr00n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Mar 2026 19:33:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 625JT7e3023007
	for <dtrace@lists.linux.dev>; Thu, 5 Mar 2026 19:33:38 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011000.outbound.protection.outlook.com [52.101.52.0])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ckpthyaqe-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Mar 2026 19:33:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hRCvktVpzTmqYlotLCF0fuR+RQekjZC5PZ25DWy2XkmsYFHX0b6A6YXHCdYPuUtzWJgE9khMp8LAwIo3hQnlHmHqvHcGv9qj1rOQleh1N4DT8EeAnSI8rJhnZ6gjJt9p4AqcAdW3Q7mj2PpDYU6pG6vCPXCKfZhWh9MGilbG5QHdktrZKow23LezrtjUZDBx8l1mXSYLOCYyWZsZHqT18zc4XOOenWqGGSNsI9BS/f2sLirsTyDVMxfM7Q/0N2bjOYL+HF+VoiKiy+hklgZSqxsygtYLy03Sz09+soaOuGlJMuXfVqlYk97BEJIbw54cQgKtXIV7Q1zmMmQhn0nltA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvEpHyVaaoYStH+ikoTG7M6VLkAImScVW8Bqn7euRgk=;
 b=tycMrzoUzJQ7IQ+SjfLVgkkbLyGmLi+Ox1THIjEsQLbTWATGjMIpP1kcMmIoGLasej/AL5h1x7QmDRyFbXzm3MMmUweApO22DAUqpCtqclT987lcpPLvqtmmsVEYv++hvFt11g2u5Ci8svW1NuQsvNVM54Sk5qGJFBKmUIkhe2NMmJH9SIbulu61zTjEZd0zbOyrWtlBjcgJkFGo+V+dPb1D2rLL8XCVraG8s5i0Z8IcxT1jeczTFt9Nh6M0StVk23+Z2rjJzwFjlJ9H1KNXTEnyMr6zD4qbbZPrwfknIhE4ZM+gbbaLlSCbKc2s7QPP5afWDYVxAfR8N1IBA5CeYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvEpHyVaaoYStH+ikoTG7M6VLkAImScVW8Bqn7euRgk=;
 b=FCGG+1ML7vfcUIFbT0eViYpCbwOjH8kPN3UvZrWjB3gyAxkmBCyOkcyhN4vDS4TZ/z3wrIujmNzQxHVM8qNYxHC/eUny+ijWohbsqRVlv3YnJrEBEX8Ywct0f5wCAWKYi6SmTunxb1ewaTOnkOusDSzfc5ccgX8YSe9CKFtFve4=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by CY8PR10MB7380.namprd10.prod.outlook.com (2603:10b6:930:97::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 19:33:34 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 19:33:34 +0000
Date: Thu, 05 Mar 2026 14:33:33 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] license: add overlooked license statement in
 bpf/GNUmakefile
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:36e::28) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB7522ED177548E81381CDE410C27DA@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|CY8PR10MB7380:EE_
X-MS-Office365-Filtering-Correlation-Id: 61221a12-6205-4072-9f4a-08de7aee1707
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	LfTn6ztPhG+57BipdfKHWweGSUmQZuEW1oBrLAL5X242/tVEm9TVajLF14J2Y+oTNm52t0b2cVqYaCjKhKdzhpDU9JE8o65sjr4P2TKNk1cEDQH/yVuUjvhd2tVEj/6NnxAtoKGvVS0xtsZxnWmTI80rPRAcrMMyvJX36Ze4ACPq2aK6oIExouZ6z6y7zJWvSl095gjfY2BgpW/cI06Tm2F9wNtWVKMCs/uxB1Z3GS23C16TzY9iX9492fNK8CTxOY7APzK5NT4Hsm2PzjFI94NmLhNm5fT1TATws+VtlTObRhXUQdSzT+S3g98xr9EgiR1wneauKpICM9avUL2ldPJNhdPJ798DUpW0C7WBf4+7Zms4nk5HOxdwHOd3899w2PcxN5fce+QDS5Ic8PPNgCKMr8jpPB7mcSn1fJuYKgRv386GMKSQUGkXq4psQ2uzScpV14XPzC2lzfa7e261bWVAZKwXqY75mTItf66WG0heIbZZ/DVxBoAoh8BM2mHKqLg4FF0gSfVI9oj1bNz0/0Q3r/NFIABCTxNjPRBG/o4ImfzAsV706tfbeMnDoJiNiK9CT3QduWh7CM/J1I5z0QB2vNztpH5i5R4mY4riLMoKhfGnRzXU+oy2OJYJDu9cszgKRC2sP0Z6mKREYs4FGP8kyp/TiNz6i2DfyH/dXZOhIrUshnpQrtJS4NqAho77pjNpCmlkMUdKJ2kSRtQoG/v4URtZ/fQGdTZEjWWRoAE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0iigwGpYKXx2F+iwB1Z/IPhn87hq19mCtEToO7996jc0VuwUuhzirF11FA7u?=
 =?us-ascii?Q?bT8xIscShngmQEwLQfB4I4ma5tsXeqPBSD3L7nZHxBqpysDv9wTOJgR38jOc?=
 =?us-ascii?Q?0i9LJX43DyN5e7i1fkjMZ6BLwLftfawmd+X/RxjviYwiWwiGP/lScn4NcxhL?=
 =?us-ascii?Q?6sexiDUxgdmtZmk6siUqHf830wCNOrOAJ68uIlgdEWWtXVp2mOo94NsQgu+O?=
 =?us-ascii?Q?9sfrwbFg46nguGsbVfKUHclkqfT5uq0rfPdkN9R4DWUZyMQNBB4j82WG4Yc6?=
 =?us-ascii?Q?J4IyFguePclUSVTeyJvowZmCVbSsmUZ15VY4HozcmymHOIjUK2GMRH3K2oc3?=
 =?us-ascii?Q?MQLFH7FVBpgijBcNlTde9pl/WFd8wCVbtgVV4bQAwJovI5i6jQf66ji2G/Md?=
 =?us-ascii?Q?olXJefqUjS8+g8RfbYwHhME1I012GmEzyMcp78Sona7+8krEm6DlD3gJNP7f?=
 =?us-ascii?Q?kJtUx1LrxY6idswwp7vO9EGV4xb9x1Mgk43inqTSNaKXBWWZTdzRlveQfRAG?=
 =?us-ascii?Q?lqfTiGVZt0hRVGWMxfYGdZwsm3G1PPXojeBrIV0aPOo7PnLbFgpTpB9SEXcK?=
 =?us-ascii?Q?osvGprOs7mc1ZPf55iAee5saFAFu+CXdPJhmZh5A/ANqM2OrRnqbbDFa4jDa?=
 =?us-ascii?Q?rc+dmgms7kPoJi3RNTs+PwAk996cn3d4rVVyR5Kugh4TNQZynOlXZBTso0sh?=
 =?us-ascii?Q?cd7bKYeRFTm9hQWRohMaEpFs9MkP0MuzkVHZFfldvkNKrz3yh5J6mdo+rm1Z?=
 =?us-ascii?Q?JVmhUUz221023BScbIV/cY61a6WJWM5chlRajoKJjIt+7BdaOXjSF0YuQ8ZW?=
 =?us-ascii?Q?385ZvBF4oWJbY5DC9ezDM5ONbIJOwp+k/F8y6F8E4w6iKgZYIEEB3t6YKtfX?=
 =?us-ascii?Q?uWhPBcnvcgSskFpKO5Kmaj4nM3afwQfKSCw+CsZoJ3E4bJK3BPhAyGenFSyf?=
 =?us-ascii?Q?AZKa1w8IhY2DOhLzQwyVoCOvkR2+rlsAp74tk0u7DSHONJGG4nWe3Ws3KPDH?=
 =?us-ascii?Q?ww9e1HD1CL6RgdtLWmJaXlvQhRGXX4hux6LQ5PPntco+tdBGD8cUUtGGCe9R?=
 =?us-ascii?Q?6COVljNXz5mWY4h9izVSXaP3+IMboDqmsGsdJAOWmyokdzblMD+QvzPPE1Q0?=
 =?us-ascii?Q?KdVpAdNmgyHBM6yCioXyYy1ZmmarhOlS/OW3ryvV5L5DApB534aQLKgpBac/?=
 =?us-ascii?Q?g6KAB4LgfkXUVoOAS9YoO40tbZT3O8ws0K9MydtxOdX43V7/6Xg9FD7jcQB0?=
 =?us-ascii?Q?IxEEoK68nxheUZkLXyOlY11kOb969IXFLJZz1R1kxRoDNpeiKRdBp9wXEkU0?=
 =?us-ascii?Q?jCZ5Zb5oizNi8EAWeR7TG7hLb7IAOxw7yesvaX6iOPF8KE4rAYYTmk8rKnbx?=
 =?us-ascii?Q?OON8EbCGA7dJTtQYxYI5mtT+NU0/4fvToHdYcBPwu3nhX4CSfh1mAyBhDxiO?=
 =?us-ascii?Q?f3EAq5ZhPWH2ufUU5oe3Mu81QAwk+2wggcD3/D5eZSwDzlCks7FJ0zB+lPGh?=
 =?us-ascii?Q?b3cOQoknghKbIlWVmcNkvZqbbmPb83LiTT2Uyfl0nQyiIrRpuYKVCFkewnpy?=
 =?us-ascii?Q?nn0W2VKb2Gb7MWmYw387K90fPQ/MJEkRpv98/7zZTbU5nd0hdiYP3N7hz01b?=
 =?us-ascii?Q?FCgF8bYbf/k6QEq+MlsdfRaocer9Wisy9cvOhoelKU0Q9EZU9a9XnG8DlkOd?=
 =?us-ascii?Q?Zq+pZfWeLv2C1BsOrQTcemKp2g+UwyIE5hba9ncu3HjBamAgi8gszSEMgZdO?=
 =?us-ascii?Q?iqdhjAhzsQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nADEVF3cVZM4i+97IpmhJNbmMAdvHvsT6RX+MzwaQgxUszegpd2ycI/6C/62kCXFLOyemJzx6iZ7mowrpgeRaC5UIJj8GVpXUJaeaHL8Tiu7AHWMTw3IvbmgOxsMdGafAVzpDBUZ0t15FOYb3oC7ZfgYQ1Ah88XZrHFT8uon8Kln1kh/JJOwFzS+8TOC2UzA0PaTTKlhoLw6YEQJ0H4hue0psw8RWxRgiL/YLzqHuQG1tLixqFGWgKrwrCnOWwFleOWfndS+1sLl61awCNp9lTz40i+mgoCkxfTQnVoGBJ46sdQuv9jJycvPdUUiaCZmi4PUMcLr//EJsnzBwjSbcWSDdQbINJbsl3Ob0Hr8wBfycFxa+S6dtJmeQTcLpWzTfLIHl6LKUPM7fRZtpe3Rh9KfsrtzHo9M4FAbt3Us5JgoCAChSpHrvxiBJTAPpd1KAdmKxElOJz3RY5OILj98Cw8qbn4v+PUr29TgV2dY8w5UMRFyF9KZRHdiepKfW7ldWvCCrg62w+D981See8MT47ooQY9e0Z/hI43Q0j6jTvjDQH9n/vxpUyO9OY6gd3oBZiTJ3u2cmhAMZIXK1/+mwbIrLZWP1rWVJPqUmue96D8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61221a12-6205-4072-9f4a-08de7aee1707
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:33:34.1590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 98l8jvkyCAVe7ptv637qQfKP6hVbAf20r35rL8qePeAMGsp0kIe2ZXPPELbocfJsPAMTNOYxEpchf6/4CUIUv8/7cjQWa0BTk6r/SoYUJOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7380
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_05,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603050163
X-Authority-Analysis: v=2.4 cv=Vc/6/Vp9 c=1 sm=1 tr=0 ts=69a9da93 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=7Gl3-_t3PgB9XO-mQDs3:22 a=yPCof4ZbAAAA:8 a=En8llR7kGgukSPX3MBoA:9 cc=ntf
 awl=host:12267
X-Proofpoint-GUID: 5Utmno10HbzXgNHQUN9I0sFUtHQhK5sx
X-Proofpoint-ORIG-GUID: 5Utmno10HbzXgNHQUN9I0sFUtHQhK5sx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE2MiBTYWx0ZWRfX0gDoeJ4NS8OO
 Coj8/tTTSiRJRwHccdZYRdn7b0qqZTbenXtxTv0ASfGe0sU6nliQ/zqd2DzKd3m7V07Ui8zq9k9
 Ng2pB1ykSP1MfOWhRnTx+3j5NVG20CKQBIP4s0BMvhyMyZyPrd7hEDg7z1EvDMGy8kWog1cAGKo
 fqcD8wKHx+xhPh9N2AbxWAdmo+NMXQo+OHH1pro7RVAMla0f9v1r+a9F5wiBNLaCInRncHCW1IE
 Q3/Satbid5cqz5+CKC1qOzltWdOzru4NvVymb3oKGqHtUoHQ3yqbA5yb7NSEr2/v2L9RrMcgkIm
 Ie8dD/U/IGftYjHPpVp4KcvuQjHnoOwt8Ms4IwZ1XbbNwANmDFU5zjjibc6eOj0Q5MIPq7jyLCU
 v55Kkd56fVCXg5LrKZuNhaZh4Kb2mHjbitFmZ7WOrvzgmDgSy7odc8RhK2kU0KSM72LdAfc24JX
 5EJJ2MAqlKdQ3X4vnxKVGM6/+eXtKBC7i6mcbEq4=

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 bpf/GNUmakefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/bpf/GNUmakefile b/bpf/GNUmakefile
index 4a27e08b8..51ed7df6e 100644
--- a/bpf/GNUmakefile
+++ b/bpf/GNUmakefile
@@ -1,3 +1,8 @@
+# Oracle Linux DTrace.
+# Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
 %:
 	$(MAKE) -C .. $@
 
-- 
2.51.0

