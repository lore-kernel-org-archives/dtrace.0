Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546E519CD0A
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 13:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788011616; cv=fail; b=pMdwoqyXpKEcxfv5dF+1c0b+ouBST9WHR9tGslW8JfgKFFpmylJFIGs4KO/oMM03EBvvUaxpSHJeecckvbnmIuLJCO3DMSVvI7Gkyen0pL4phobSSKxULWw5FTrtSKFNIWAAtmkV9F9IJcp9uPCCQYw2/+Fny3wtAU92FkfKm0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788011616; c=relaxed/simple;
	bh=ztE5nSOTQcNMzr2zApCuaS/ifyhR57NEJmacDOpb0To=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=ATUueqZxqjMvFQeptvTi3U6AS+BSvnswynPRK3ZXztssSKJDbvWVM7u5QBHr5qPO+lcBNP3YvJq4juW4hy70YU/9P05U0w8scvmOgfHjCkVXAcYfiJ1RdRk20KmjhDDM6GdD6X4G9PRb/yYzcfR4i2Iltg999+zk9y/YZw7eN1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MVLZx4aA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KsE/AoxE; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MVLZx4aA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KsE/AoxE"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TDL47n2267581
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 13:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=tetvA7pS6NtqeDI8sQt1lJZDeLc4tyYT+EuL8h1k5Ls=; b=
	MVLZx4aAQmuu9klLiRjz53CTZ4W4SMb1CvgY1bzb0vUU6c+8FaMbEH9XTU7jKwnE
	Edhx/IVei3bEPorlOx83IG2l/MgjuUUw3e15F36LD0nhdfTx5VB3kfCgkSPrpkH9
	fn1cvgi01BEbOivM7NE/6kOgYkjZpkxtG62GMe9DsqK36uOBVvdp5gAx2AxAh8KL
	Iw2mzhTVRAuOWIqn0iMDDAd07AGAGbNyiUYBBfHAshII4kPaD834rARxCzPDcy+D
	RCZfdUaEhkNJoJukW8z+Cn1m+3msAsPsIsk6bSGQduWVcJ0OSEXENpLnqUnjvOAX
	yrPcXp4GPlPFeI8uK/CCsg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gbqfc0dce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 13:53:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67TDoW2k015596
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 13:53:32 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011022.outbound.protection.outlook.com [52.101.52.22])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4gbnvbad7f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 13:53:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSABtYK2Bav3ZygMq/b9Ec8A/mXCEyVlzDG5a0gqOmAWEGh91wadkueuaZ+th0VZrdAh9R9d6FDNRUpDlC+L7i7RuXiNOSADaV4nGPfhGSvhIqJ5Ny6aqfUFazL8y5Z2UDGObDnRFTz/UHr2N9WC1KtuV4FG5PHgYnmeao1mpYopEGq12XEIeWr2z0yNUm2OhQs7G2FnwaU2he5zPHTivSXWf3crV9ZWAX2PHKZX7cK8+QpLWvd7DZ1AEHk5tS+vWursnfKQsh/ac4GfApW0lGbeYT1DkAyjUuuqqEtZ81Qmn5VQrwY8CCat/o32OQgxL36Cyqkld3XBFaXwQeBWFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tetvA7pS6NtqeDI8sQt1lJZDeLc4tyYT+EuL8h1k5Ls=;
 b=JEallQyglQeAX16HSj8cRpgZcEKCh/udN2SvQpE7uVjQHY0V2YFVlOPLcxDGivnkYw2z95SzbvF5f4eospiAU5c2EVKQP+ccUksvq65DhOVeinpHRCt88btmaH7Sz4M0oX0a7darFgMXrwc/A1aWnYfjgVwodPz8M04jU+bh31wkd3Ol/QXgPeT1KhAfKya8rp65I15W7+iwLIZOj8os59TrW441OOMcSJ7XAdsVwgNEA1SPGz6OMrqsSpJjbkTto82ICWBmKlSa5X5hp7qCEWc9GVolfK7O1GX5uYN9VDcICZ9x179UyP3S0TlYI6Rwcgtvrv+i7W4JPR+bDOx0Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tetvA7pS6NtqeDI8sQt1lJZDeLc4tyYT+EuL8h1k5Ls=;
 b=KsE/AoxE7xIAGcdmu0wvgpoKCKXNNeP0ae7UGJ4nmHwaJTx+IhPBOzFIYf6k5Qsr6SWLGBIpEc6RqUsf6HXMlHgIYPswlyOttS2jehh2OVQMXgc/ph636Gy4Jpwvd6NT/SrVJkRUgN8CDM48AT/RtQ+83GqOmlVEKHtMeOBZN7s=
Received: from SN6PR10MB2478.namprd10.prod.outlook.com (2603:10b6:805:46::26)
 by CH0PR10MB7411.namprd10.prod.outlook.com (2603:10b6:610:187::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.9; Sat, 29 Aug
 2026 13:53:26 +0000
Received: from SN6PR10MB2478.namprd10.prod.outlook.com
 ([fe80::c48d:b954:4581:97d5]) by SN6PR10MB2478.namprd10.prod.outlook.com
 ([fe80::c48d:b954:4581:97d5%4]) with mapi id 15.21.0382.007; Sat, 29 Aug 2026
 13:53:26 +0000
Date: Sat, 29 Aug 2026 13:52:30 +0000
Message-ID: <0421dc5b41984a0b1747c0da2c215b83@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/2] debian: add distribution specific patches
Content-Type: text/plain
X-ClientProxiedBy: CH2PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:610:52::29) To SN6PR10MB2478.namprd10.prod.outlook.com
 (2603:10b6:805:46::26)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB2478:EE_|CH0PR10MB7411:EE_
X-MS-Office365-Filtering-Correlation-Id: 92c6ab45-88b7-4a76-9db2-08df05d4e5e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|5023799004|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	q2bdNIPSQ9JkorHZnhxDypNZfar75CCSkqNdnZp4fe5AE/P3l1CYjv/L52AD/uwv6etigKtQQMmn4gjfgyFDUzDQA3Vlxw1ztZooov2o1gnMOZFPK4J1kURUV97pbZPfSWleindiMZq/Gjafs9/A+aZJQJX7ZkeXkb3sDauqLRmKObvJZRalYjW9aLqTCQyjvBcKwG6TUHOSZWJ8wleI5fCpif3i/V/zrQO2GqedPV0dtu0sdwgWrNqpmkLg5PUA3GtNF+81SWwcFTvhfn2TdsqYD8/bvJzXGfq7aTM8Fy52n/ozZA2KK0dcLzKvZnWdCux6CjhjyytyLqoEIueWESuS9/DWy35DRBjz95J+csV52R3Z2Jb73jhxFyT3Pk52ncjYusGoSsU9ks6KgFdKVsUqvhqAThV7orm2LRaDk5xWWqeVX9ul9tCOlZ5E1R846WrCj9nReDqUqU6XGPXIWAqjoONKcCbksurp66Ms/aC4xzrK37HIL3Hp/dzn+iqN8mrmSJoRer573aGdewuFSHOPVGuz5g1pOQafhsly9SBsDehflBLG//qhtM6mKzP2thdcvIAt1d/kfRjx1eRHaXe/p5hrXuco/UrkeL3bz0+W4gkcFTPzfjNnEDYRQgXwwOzBQHCCXQCLUP0v2QhxNBiN/l1Ie1vDcxnJESpk3cE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB2478.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(5023799004)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9VuJLfJAE0tOuOMVquk3lImUU3JQRY6utRGC5dUfZB6q+kEIBGLyAzp352Vd?=
 =?us-ascii?Q?J+187n7KGv2Y4yfoYWpdz8Q3JtBIDqnz1uIg/RMCTJc8szbDXhgnNyhBmzYt?=
 =?us-ascii?Q?LhBqc34lqwjioZysdxFxpHYdBRvLP+FycdJhHiSg1IYugH1rnNi4p3o9cmlI?=
 =?us-ascii?Q?do1/Em+FBu0sskbORXuF/c7018I6BE3OHA5XwV9jzRVD5X0bPwSOltxgYDqX?=
 =?us-ascii?Q?NVTPVkzxLJ44DFB6gvm4K2X/xdNAmAhTGWDV3Pu143PlBUrYMdXq/xBddFIO?=
 =?us-ascii?Q?gH3DQRyYQEM3sQBIj3y5nTjin/CeKkZNrcmpcD49L2fgYK4kjlYvuOzlnf99?=
 =?us-ascii?Q?7lQu2STA/OfhDFaFXUhG0Ompl+lj3mObUROgat0NJnOUbaQOehgYAYk/23Qx?=
 =?us-ascii?Q?fuTAx6xefYdqDuCDRd1QsxgsM88tjtVbsaopFxnfePw8i/+lEGXmNVG8Ncsp?=
 =?us-ascii?Q?K74TpJly0ZrI6X2kv7AMyZ63TgFzYJMFeAWglVrlBmNvMeWlzPKpXcxUfPpO?=
 =?us-ascii?Q?96fL3ney81VpAcMKjdRaaBI0PoKHMFtUPozMDpO6xLMX0qIgwtYTBCqhNzh1?=
 =?us-ascii?Q?CYi4aj2b3D6+TSYYFKK3PIB7KlbffAY5vdZVIuCjWZfDOnwo775F2gbUANSW?=
 =?us-ascii?Q?XO5zxwOQ+G3I9P8wmGPyDx+0fY+l/oYQ+1Rj7WzaO4Vg6oZbS13nd3/69Si3?=
 =?us-ascii?Q?DY0vcc+i93dthTclQ/CWIQYcv0GyU4/WZ+ismbFaKmvxu0YOuONor634e5BI?=
 =?us-ascii?Q?NNtgR1FiFYOzj0Rmp0s1YPIYmA94jXWHnk7Sz3e2iJcvDxfbb4mWOpOis1G6?=
 =?us-ascii?Q?0PGX/zPIq5GvE/yJm3MubBcceFkapjvDJr7GIBQqUn/k6EvdcOcEJkNwmDPi?=
 =?us-ascii?Q?aGSq4eLzyve18Fib3jgFRwddZ1JFmcmMyjDukj0rPrMWn4Djcqc6iW73D85s?=
 =?us-ascii?Q?r/c7CicwPzT3qrABED/3/oMa0ZctnPzoFWRiw478DbMeKuPMILtpdrwHfNy8?=
 =?us-ascii?Q?/OFTD51h4o+4yfkHWgrN1u0F4G/xPBQHugW2ZRaQm9XWZUfuvRuFAnZ+1/2Z?=
 =?us-ascii?Q?x5Pn/b0i30qX15JnqRVFy0j1NXqhFI2A33DA9omHdpL/Tcmi6dIzmw2g0kS4?=
 =?us-ascii?Q?PX+Nqq3RsPv8IKeol+mFpw9JRvCIisHHZuIVfVhX84OPGiioHiumAUOAatxA?=
 =?us-ascii?Q?JK2mcXbZIANkmyXg6xZEMGhccBUXSuY82vd8Ac31hxEagSMO3nK3v5ck4NLQ?=
 =?us-ascii?Q?HBtoQZITTFVPxj7rdJQ6UHj5/1hM45z3YJvpcihbtSNVK7ge4jiSE+ldVs1u?=
 =?us-ascii?Q?2Dk1m1hDuASj+pNuoEvf0cpIM+80zqG8Bgr7NEdhBskM3T9bSA+D+XLzwsKk?=
 =?us-ascii?Q?hVwRGe+JH8wxwfwlR0A7NKGS3zfP7DXmcAYGKPjiBLqWmZxj3r4JapkBSxmA?=
 =?us-ascii?Q?AA5JCa2w+5z9ybkEd6VkTsZqPX+lJb9z8g8i1gIgd3UxFgcDpjd92t2yMlJD?=
 =?us-ascii?Q?8uUBPKCseHj9IUX6GhBtmdjx1C3dt+5L8tSYdzVPyfvU57+Tm63SlervDqGD?=
 =?us-ascii?Q?jplZFywYgOBCjPK6WXJ66ifltuAplIPGkz7nkjqr9TOAmtT8icPlf5ZAoLqH?=
 =?us-ascii?Q?ofpGHu/0gw7k6lCBrzbjojNOCEXq5yVFw9R3I81k3iF3VSnPAu5k/Tzulw+Q?=
 =?us-ascii?Q?RyOgKwFpSeJvplxCGJLEqGICaIpRaACRzpW2Ef5TCXVQuGGaYWaOkj1GaecQ?=
 =?us-ascii?Q?fmg8pA8jfPjd3H89+bsyjrmeHfXUF/4=3D?=
X-Exchange-RoutingPolicyChecked:
	4p2Gf2FcC3P09t1DYUNVR9KPfqh9xpF+2QCSedESbe7KoQf2AVTQqDukRgLPzf9BlP03inkAcY9PWAK7+qICRoUtaPfoEmHaZHk4ilvRLEOKe+tZGQjO5pKu4i5yH9OMkk0o9LI0xb6X6bN+FBwAOqWCM7+V5/ewPk0RCcCxIHVLE1vUi5R1BqEK/QXAlEu54SYhv8dMZIsGxkHFZs8U3+V+Fz86S7iyBe1Ibbg/G2b2SUdPzVG2xq3ecwBN8sbxV0oaySlau8aZTH57EsUTPPTDrv26EcVlnIr1h6yKZt4zDNiZr09hp+2QdNCbNwoMfHLIx1bjSuRnQMzuJ2KPgg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3TK9O70Iw0bxsynEPMB9pRrf0lzmIO+jNVlnb0vilhiu+lSaK3V3TR4yKX7gkFfxtkI1nhNg8jsg+tsdK4y7xzutFEIFJCUnPj0GaUUNT1swvR56qAdQqUoCECWa2C71eYk3Qg8LKEXcAQW/ztjsGCscLkUsq24j30uLeiPU0HiWphs/tJG9gO+dGsk00NVcLtTLeqJBe661GEMV+kkecxPZ+rayLv3P6DEJCt7fghCVp0zP4MglA8lzn5QFHAIFmdTINyD1S4Op192x1gToxd5qX34TBoecSBfH8a0/8YQYqbRUrFAo2aZEk62ijKxkcHBvu/5u3ozchjT3xchBIjMO46J9L08MXUsvaNRJ2T86bS60696kGhpQlJ7n9/wPAmwTPlKYUkhk9PFFrBnwkwW9sD0xqOc/erstV6yTGzpK9r34YyoNriM2WGiDZwsVQSp2rudgysMQb2rE5iCtTJGweld2C4sLitR9o94WZWqNaTxbON7i9WFTM6QgJjV1JtpfXMi56Dl6F3UyL7iXFcyjJWfhozKOCNdx2HhPv+5ev40F+m9LYr8U2tCJERvPK+13XfTOEVnJA2U3BlC/ztsuewyAwlbl698yI5VGguE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92c6ab45-88b7-4a76-9db2-08df05d4e5e7
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2478.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 13:53:26.0456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3UtvXVWNTjfBtGj1teaRFoxYeKwh2ZX60w+znjFlbJ3hiSMQpF2eYBOKj+A72B48ETty/3JmydtznL6w4mKfJIfwV0CuI4civsoR1xXOgc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7411
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608290120
X-Proofpoint-GUID: APs9rJLDZGnk0DlB6n5ATXTW5mPFvYl6
X-Proofpoint-ORIG-GUID: APs9rJLDZGnk0DlB6n5ATXTW5mPFvYl6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDEyMCBTYWx0ZWRfX9I/2J+5Akded
 fcd7NCTWROixpXMm+bGF3QrD2NVfrrrhYsTcs+jDeJIldebmJXTG+4iqhvduRwPTO6s8qy72b14
 lbA2FW1My2xt0rNI/Lg/cZDezHFDIleTUzLQ83gtV0K3YRGfC96E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDEyMCBTYWx0ZWRfXwqEeaiJTTfK2
 nF/+hwjQpEeSOJ0pvonETZFVGmUk+IUsEa4PxSSNYVvKOoW2yE665g11jsRgZU1tGA1FLN6H7v3
 zDp5crZQyRv5WjHrudiKeJWcHvRorbCzwINTS8UI77BwfopegoGlnCztyaUocJbM+IQO/NqGS1D
 S/WZuzeofLLBXWf8rZ2CzvWIG3IWu2NWHtcfcN6rq/IvQyfSFRsNdhkVLQj+fsacXCqM1XTF/cz
 wiQKAvtZjyu2MYBtMr8wNH5gRd1TRNc2nYmhHVNX5ZVxyDjULm+g/LwU6tfAqi2D9OC0b5jOJxU
 b14Df9lPzv2OrV92cAHyp04XfaC5MT48EGRJyOcNmikU59Et6+IcWZGTQQwVnuMLXDnSoPmw2aA
 6/GFIluWzla2aijWb2tgjDPPeX4p9L93O99NF36WEADaUrh28Fe4UvC7VYEHaCxRiFyiDO/YlHS
 B2MyEc+4kW64AX0hQrA==
X-Authority-Analysis: v=2.4 cv=a9gAM0SF c=1 sm=1 tr=0 ts=6a92e45d cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=BqU2WV_vvsyTyxaotp0D:22 a=NEAV23lmAAAA:8 a=yPCof4ZbAAAA:8 a=pGLkceISAAAA:8
 a=Iz-ozovmSgAjm9O_q8cA:9

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dists/debian/changelog                        |   8 +
 dists/debian/control                          |   8 +-
 .../patches/debian-static-linking.patch       | 248 ++++++++++++++++++
 .../debian-surpress-utsname-in-note.patch     |  15 ++
 dists/debian/patches/series                   |   1 +
 5 files changed, 276 insertions(+), 4 deletions(-)
 create mode 100644 dists/debian/patches/debian-static-linking.patch
 create mode 100644 dists/debian/patches/debian-surpress-utsname-in-note.patch

diff --git a/dists/debian/changelog b/dists/debian/changelog
index b176f3cd..dfb05e2b 100644
--- a/dists/debian/changelog
+++ b/dists/debian/changelog
@@ -1,3 +1,11 @@
+dtrace (2.0.7-2) unstable; urgency=medium
+
+  * Apply fixes in control file.  (Closes: #1140165)
+  * Use static linking for libbinutils.  (Closes: #1140166, #1140168)
+  * Surpress adding utsname info in USDT ELF notes.  (Closes: #1140167)
+
+ -- Kris Van Hees <kvanhees@gmail.com>  Tue, 16 Jun 2026 19:46:35 -0400
+
 dtrace (2.0.7-1) unstable; urgency=medium
 
   * Fix CVE-2026-21996: divide-by-zero if section header data corruped.
diff --git a/dists/debian/control b/dists/debian/control
index 7560dc9a..0861ed17 100644
--- a/dists/debian/control
+++ b/dists/debian/control
@@ -5,7 +5,8 @@ Maintainer: Kris Van Hees <kvanhees@gmail.com>
 Build-Depends: debhelper-compat (= 13),
  bison, flex, gawk, gcc-bpf (>= 14.2) , valgrind, binutils-dev (>= 2.44),
  login.defs, libbpf-dev (>= 1.5), libc-dev (>= 2.34), libelf-dev, libfuse3-dev,
- libpcap-dev, libpfm4-dev, libsystemd-dev, libz-dev
+ libpcap-dev, libpfm4-dev, libsystemd-dev, libz-dev, libsframe-dev,
+ libiberty-dev
 Standards-Version: 4.7.4
 Homepage: https://github.com/oracle/dtrace/
 Rules-Requires-Root: no
@@ -25,8 +26,7 @@ Description: Dynamic tracing for Linux (DTrace)
 
 Package: libdtrace2
 Architecture: amd64 arm64
-Depends: ${misc:Depends}, ${shlibs:Depends},
- fuse3, libctf0, libelf1t64, libfuse3-4, libpcap0.8t64, libpfm4, libz1
+Depends: ${misc:Depends}, ${shlibs:Depends}
 Description: Dynamic tracing for Linux (DTrace) (library)
  This is the official Linux port of the advanced tracing tool DTrace.
  .
@@ -60,7 +60,7 @@ Description: Dynamic tracing for Linux (DTrace) (development)
 Package: dtrace-tests
 Architecture: amd64 arm64
 Depends: ${misc:Depends}, ${shlibs:Depends}, ${perl:Depends},
- binutils, cpp, gawk, gcc, make, pkgconf, tshark, bpftool
+ binutils, cpp, gawk, gcc, make, pkgconf, tshark, bpftool, libdtrace2-dev
 Description: Dynamic tracing for Linux (DTrace) (testsuite)
  This is the official Linux port of the advanced tracing tool DTrace.
  .
diff --git a/dists/debian/patches/debian-static-linking.patch b/dists/debian/patches/debian-static-linking.patch
new file mode 100644
index 00000000..363cdb56
--- /dev/null
+++ b/dists/debian/patches/debian-static-linking.patch
@@ -0,0 +1,248 @@
+diff --git a/cmd/Build b/cmd/Build
+index 98d0ebd7..3492638d 100644
+--- a/cmd/Build
++++ b/cmd/Build
+@@ -13,7 +13,7 @@ dtrace_SOURCES = dtrace.c
+ dtrace_DEPS = libdtrace.so libport.a
+ dtrace_SRCDEPS := $(objdir)/dt_git_version.h
+ ifdef HAVE_LIBCTF
+-dtrace_LIBS = -ldtrace -lctf -lport -lelf
++dtrace_LIBS = -ldtrace -lctf-nobfd -lport -lelf
+ else
+ dtrace_LIBS = -ldtrace -ldtrace-ctf -lport -lelf
+ endif
+diff --git a/libdtrace/Build b/libdtrace/Build
+index 3a6c0466..3bf6c7c0 100644
+--- a/libdtrace/Build
++++ b/libdtrace/Build
+@@ -82,10 +82,16 @@ SHLIBS += libdtrace
+ libdtrace_DIR := $(current-dir)
+ libdtrace_TARGET = libdtrace
+ ifdef HAVE_LIBCTF
+-libdtrace_LIBS := -lctf
++libdtrace_LIBS := -lctf-nobfd
+ else
+ libdtrace_LIBS := -ldtrace-ctf
+ endif
++
++# Required for dt_pid.c for varying instruction lengths on x86
++ifeq ($(shell uname -m), x86_64)
++libdtrace_LIBS += -lopcodes_pic -lbfd_pic -lsframe  -liberty
++endif
++
+ libdtrace_LIBS += -lelf -lz -lrt -lpcap -lpthread -ldl -lm -lpfm
+ libdtrace_VERSION := 2.0.0
+ libdtrace_SONAME := libdtrace.so.2
+@@ -93,11 +99,6 @@ libdtrace_VERSCRIPT := libdtrace.ver
+ libdtrace_LIBSOURCES := libdtrace-build libproc libport libcommon
+ libdtrace_SECONDARY := libproc libport
+ 
+-# Required for dt_pid.c for varying instruction lengths on x86
+-ifeq ($(shell uname -m), x86_64)
+-libdtrace_LIBS += -lopcodes
+-endif
+-
+ # Disable certain warnings for these files
+ dt_bpf.c_CFLAGS := -Wno-pedantic
+ dt_btf.c_CFLAGS := -Wno-pedantic
+diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
+index 5282efbd..f757c866 100644
+--- a/libdtrace/dt_impl.h
++++ b/libdtrace/dt_impl.h
+@@ -304,6 +304,7 @@ struct dtrace_hdl {
+ 	dt_htab_t *dt_kernsyms; /* htab of kernel symbol names */
+ 	char *dt_ctfa_path;	/* path to vmlinux.ctfa */
+ 	ctf_archive_t *dt_ctfa; /* ctf archive for the entire kernel tree */
++	void *dt_ctfa_data;	/* backing data for dt_ctfa */
+ 	char *dt_btf_path;	/* path to vmlinux.btf */
+ 	struct dt_btf *dt_shared_btf; /* BTF data for the kernel (shared) */
+ 	ctf_file_t *dt_shared_ctf; /* Handle to the shared CTF */
+diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
+index 00978911..14ca18fb 100644
+--- a/libdtrace/dt_module.c
++++ b/libdtrace/dt_module.c
+@@ -194,8 +194,16 @@ dt_module_lookup_by_ctf(dtrace_hdl_t *dtp, ctf_file_t *ctfp)
+ 	return ctfp ? ctf_getspecific(ctfp) : NULL;
+ }
+ 
++static void
++dt_module_delete_registered(dtrace_hdl_t *dtp, dt_module_t *dmp)
++{
++	if (dt_module_lookup_by_name(dtp, dmp->dm_name) == dmp)
++		dt_htab_delete(dtp->dt_mods, dmp);
++}
++
+ static int
+-dt_module_init_elf(dtrace_hdl_t *dtp, dt_module_t *dmp)
++dt_module_init_elf_impl(dtrace_hdl_t *dtp, dt_module_t *dmp,
++    int unregister_on_error)
+ {
+ 	int fd, err, bits;
+ 	size_t shstrs;
+@@ -226,7 +234,8 @@ dt_module_init_elf(dtrace_hdl_t *dtp, dt_module_t *dmp)
+ 	    elf_getshdrstrndx(dmp->dm_elf, &shstrs) == -1) {
+ 		dt_dprintf("failed to load %s: %s\n", dmp->dm_file,
+ 		    elf_errmsg(elf_errno()));
+-		dt_htab_delete(dtp->dt_mods, dmp);
++		if (unregister_on_error)
++			dt_module_delete_registered(dtp, dmp);
+ 		return dt_set_errno(dtp, EDT_OBJIO);
+ 	}
+ 
+@@ -242,7 +251,8 @@ dt_module_init_elf(dtrace_hdl_t *dtp, dt_module_t *dmp)
+ 	default:
+ 		dt_dprintf("failed to load %s: unknown ELF class\n",
+ 		    dmp->dm_file);
+-		dt_htab_delete(dtp->dt_mods, dmp);
++		if (unregister_on_error)
++			dt_module_delete_registered(dtp, dmp);
+ 		return dt_set_errno(dtp, EDT_ELFCLASS);
+ 	}
+ 
+@@ -252,6 +262,12 @@ dt_module_init_elf(dtrace_hdl_t *dtp, dt_module_t *dmp)
+ 	return 0;
+ }
+ 
++static int
++dt_module_init_elf(dtrace_hdl_t *dtp, dt_module_t *dmp)
++{
++	return dt_module_init_elf_impl(dtp, dmp, 1);
++}
++
+ static int
+ dt_module_load_sect(dtrace_hdl_t *dtp, dt_module_t *dmp, ctf_sect_t *ctsp)
+ {
+@@ -297,6 +313,91 @@ dt_module_load_sect(dtrace_hdl_t *dtp, dt_module_t *dmp, ctf_sect_t *ctsp)
+ 	return 0;
+ }
+ 
++#ifdef HAVE_LIBCTF
++/*
++ * libctf-nobfd cannot use the BFD-backed ctf_arc_open() helper, so extract
++ * the .ctf section ourselves and open that with ctf_arc_bufopen().
++ */
++static ctf_archive_t *
++dt_ctfa_open(dtrace_hdl_t *dtp, const char *ctfa_name)
++{
++	ctf_archive_t	*ctfa = NULL;
++	ctf_sect_t	ctsp = { 0 };
++	dt_module_t	*dmp;
++	char		dm_file[PATH_MAX];
++	const dt_modops_t	*dm_ops;
++	Elf		*dm_elf;
++	void		*ctfa_data = NULL;
++
++	dmp = dtp->dt_exec;
++	if (dmp == NULL || strcmp(dmp->dm_name, "vmlinux") != 0)
++		dmp = dt_module_lookup_by_name(dtp, "vmlinux");
++	if (dmp == NULL) {
++		dtp->dt_ctferr = ECTF_INTERNAL;
++		return NULL;
++	}
++
++	/*
++	 * Borrow the registered vmlinux module as the ELF loader context, but
++	 * leave its persistent module state exactly as we found it.
++	 */
++	memcpy(dm_file, dmp->dm_file, sizeof(dm_file));
++	dm_ops = dmp->dm_ops;
++	dm_elf = dmp->dm_elf;
++
++	if (strlcpy(dmp->dm_file, ctfa_name, sizeof(dmp->dm_file)) >=
++	    sizeof(dmp->dm_file)) {
++		dtp->dt_ctferr = ENAMETOOLONG;
++		goto out;
++	}
++
++	errno = 0;
++	if (dt_module_init_elf_impl(dtp, dmp, 0) != 0) {
++		dtp->dt_ctferr = errno != 0 ? errno : ECTF_FMT;
++		goto out;
++	}
++
++	ctsp.cts_name = ".ctf";
++	ctsp.cts_entsize = 0;
++
++	if (dt_module_load_sect(dtp, dmp, &ctsp) == -1) {
++		dtp->dt_ctferr = ECTF_FMT;
++		goto out;
++	}
++
++	if (ctsp.cts_data == NULL || ctsp.cts_size == 0) {
++		dtp->dt_ctferr = ECTF_NOCTFDATA;
++		goto out;
++	}
++
++	ctfa_data = malloc(ctsp.cts_size);
++	if (ctfa_data == NULL) {
++		dtp->dt_ctferr = errno;
++		goto out;
++	}
++	memcpy(ctfa_data, ctsp.cts_data, ctsp.cts_size);
++	ctsp.cts_data = ctfa_data;
++
++	ctfa = ctf_arc_bufopen(&ctsp, NULL, NULL, &dtp->dt_ctferr);
++	if (ctfa != NULL) {
++		free(dtp->dt_ctfa_data);
++		dtp->dt_ctfa_data = ctfa_data;
++		ctfa_data = NULL;
++	}
++
++out:
++	free(ctfa_data);
++	if (dmp->dm_elf != dm_elf) {
++		if (dmp->dm_elf != NULL)
++			elf_end(dmp->dm_elf);
++		dmp->dm_elf = dm_elf;
++	}
++	dmp->dm_ops = dm_ops;
++	memcpy(dmp->dm_file, dm_file, sizeof(dmp->dm_file));
++	return ctfa;
++}
++#endif
++
+ /*
+  * Only used for linked-in modules.  Archived modules are uncompressed
+  * automatically.
+@@ -928,7 +1029,11 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
+ 		} else
+ 			ctfa_name = dtp->dt_ctfa_path;
+ 
++#ifdef HAVE_LIBCTF
++		dtp->dt_ctfa = dt_ctfa_open(dtp, ctfa_name);
++#else
+ 		dtp->dt_ctfa = ctf_arc_open(ctfa_name, &dtp->dt_ctferr);
++#endif
+ 		if (dtp->dt_ctfa != NULL) {
+ 			/*
+ 			 * Load in the shared CTF immediately.
+@@ -941,6 +1046,8 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
+ 				    ctfa_name, ctf_errmsg(dtp->dt_ctferr));
+ 				ctf_arc_close(dtp->dt_ctfa);
+ 				dtp->dt_ctfa = NULL;
++				free(dtp->dt_ctfa_data);
++				dtp->dt_ctfa_data = NULL;
+ 			} else {
+ 				dt_dprintf("Loaded shared CTF from archive %s.\n",
+ 				    ctfa_name);
+@@ -958,7 +1065,7 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
+ 			 * data for shared_ctf from.
+ 			 */
+ 			mod = dt_module_lookup_by_name(dtp, "vmlinux");
+-			if (mod->dm_btf != NULL) {
++			if (mod != NULL && mod->dm_btf != NULL) {
+ 				dt_kern_module_ctf_from_btf(dtp, mod);
+ 				dtp->dt_shared_ctf = mod->dm_ctfp;
+ 			} else
+diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
+index 54adec02..a3932790 100644
+--- a/libdtrace/dt_open.c
++++ b/libdtrace/dt_open.c
+@@ -1319,6 +1319,7 @@ dtrace_close(dtrace_hdl_t *dtp)
+ 		ctf_close(dtp->dt_shared_ctf);
+ 	if (dtp->dt_ctfa != NULL)
+ 		ctf_arc_close(dtp->dt_ctfa);
++	free(dtp->dt_ctfa_data);
+ 
+ 	dt_pcap_destroy(dtp);
+ 
diff --git a/dists/debian/patches/debian-surpress-utsname-in-note.patch b/dists/debian/patches/debian-surpress-utsname-in-note.patch
new file mode 100644
index 00000000..d058d8da
--- /dev/null
+++ b/dists/debian/patches/debian-surpress-utsname-in-note.patch
@@ -0,0 +1,15 @@
+diff --git a/libdtrace/dt_link.c b/libdtrace/dt_link.c
+index 6d733881..5a7d414c 100644
+--- a/libdtrace/dt_link.c
++++ b/libdtrace/dt_link.c
+@@ -398,8 +398,10 @@ create_elf64(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, int fd, uint_t flags)
+ 	if (!(flags & DTRACE_D_STRIP)) {
+ 		if (note_add_version(usdt) == -1)
+ 			goto fail;
++#f 0
+ 		if (note_add_utsname(usdt) == -1)
+ 			goto fail;
++#endif
+ 	}
+ 
+ 	dt_free(dtp, usdt);
diff --git a/dists/debian/patches/series b/dists/debian/patches/series
index 99f0cdc5..3c97f198 100644
--- a/dists/debian/patches/series
+++ b/dists/debian/patches/series
@@ -1,3 +1,4 @@
 # You must remove unused comment lines for the released package.
 debian-configure.patch
 debian-fix-sed-path.patch
+debian-static-linking.patch
-- 
2.53.0

