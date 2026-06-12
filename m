Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2FB3F39F2
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281343; cv=fail; b=Xkg9Q8ihQLi3kMZ69VDFYchDqFKQpZpXNi0+d/IYMNEhi0drVeKLgBkw1mvL6QbZjCPB1emJkqhBGP82FNzylE5JO6gN9vCAd2oJIoBSWHggCKkGZ/SUnIXUprDM1IkMtsiXrTdPiOm9u6Suf/26ducXoBjdGbGjR7XdiDoG9Fc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281343; c=relaxed/simple;
	bh=i4LZ85UoyPfkHftOQ02JqLobWsMr3bg6UIVwmvCwd84=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=cBViBkCavJpgd1OdfaJRR7zd0N29QcysQxGUwzJiJSkxkbAFXkTxzKHVHPO1quVaw4goaxQwtJs0yY5cUpFriC10Ibaf0iD+SlhlHOUM7DRnNP8F/feCMq0AglM7ffNYW4sH1PbTATJCAu14YINbeV9irxPL2Y53jT+yvyl0o8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TE10HGog; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ajLLBdCM; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TE10HGog";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ajLLBdCM"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C7Nktu1153367
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=4Or02hOdS1uvvvQHbgPMrhZH64zaB511K1xtmJv8l4U=; b=
	TE10HGogjhcnJJKFGzm0xXuuSkoQwuIRb22aTSPRqvv2g/omxN/q/O/7bmre3zGx
	1xs4F6QzB+ennr9USLAB2BBnoU/qkzrlhDPQd6RleHJ3Cnv4+SYxGWfYT2+mmKO1
	mFEelrRlnAhS5U3VIBEwtlZQDM4Od6MR2nC2nrF2dFQMHh9kLlZmyZDCvaYDxetW
	vzVN+AaI8DA5ActIjd9SKk8NPEv5A5i12l30Rx87Zn88NuSG94S8N+pPCs3ZaVPB
	yC8FQW9ZCoUKlxTxzneO/g7Yt6jiMAwUielvzm7L6L5P764RCuXQvQsWMmv/76cx
	9i49LIBnC5wIzEEI7zSZ7A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4eqe76u7xm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:22:18 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 65CGINqs011786
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:22:17 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013069.outbound.protection.outlook.com [40.93.196.69])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4erh9wt1yf-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:22:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GISFq8U1heD35OihjfdN5EiddEkxpI2YqAdQfqbU1GnktiLV+s76GwjQ+lD+jzYZgrbU5HuaLo2BsyYC+TGEhX0L1fhz7ZQHHJUSEX+8TCBv/0pG02JGhj+W8RpOUe6JdpTGKijMVI1Jm0Gf8gr5GsYGgyjP+GUtN983L+I5dsaiJVtGFL9R0kAuz2aZffCyKH7GKRa6+LeZmVvN8zHRHFnwI+T3Wk+AFMPsWET6NG5vs5nYyNlWvLkQYfUR8fgE3Gq/GxpbOxyY9/1gQMW64oq/FYqgd+bHKZgHZdU2hUYB0LSpq7kFvHwOOYAgoiAOM+NM6SMl4b7eIt5L+jSWWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Or02hOdS1uvvvQHbgPMrhZH64zaB511K1xtmJv8l4U=;
 b=MK2W98phTF8O3kCO07TyAjn/CAHKNSNE82J+uROQi7ZWZOAK1G0keY6Qa+V2pw+HVYt06keFMI9Du9HMFRvK0jnmJL14ZZ/kH6y9ncccg6eplMY/cGpAxPS2ACnjL8LHw5BX/8lMHnOX0q96ZEFtD3KEXfegg1y9Ee88QoxpDUeBl+wTlK4y6eRFkBMg/uztlIywFO/AwsgXWfk4z5lDnPFX/48PyrQMrkZQAG1i+uBAVmV4j6U0knXqQ5rkW/uTmP1E8NYDuFkD8vF4lYLKaXidXglal16h7nQ+MeHaG3SXp1QBlDJapFqYFAO8TJBreMrScoXg2zxIfIWBs8CH4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Or02hOdS1uvvvQHbgPMrhZH64zaB511K1xtmJv8l4U=;
 b=ajLLBdCMdt5g0OaJlANy2/cYSSmW4F4ZiKTumYtuZy/tZMShTioALfKwFpZt4+L8IG7o44zRl8aXIQs/DjprMu9+/STGORSdH/Lo59TxBmLmS14G6XeEXhj1SPHNPAmYxCSt+9mseXY/UiR8zqZBaPDaYrSQ2/dbopQTgWAx7IA=
Received: from PH0PR10MB5514.namprd10.prod.outlook.com (2603:10b6:510:106::17)
 by SN4PR10MB5637.namprd10.prod.outlook.com (2603:10b6:806:208::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 16:22:14 +0000
Received: from PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61]) by PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 16:22:14 +0000
Date: Fri, 12 Jun 2026 16:22:10 +0000
Message-ID: <90cf70060f02619a3f06ca5ac66df954@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/6] usdt_parser: fix parser pipe I/O error handling
Content-Type: text/plain
X-ClientProxiedBy: DS7P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::6)
 To PH0PR10MB5514.namprd10.prod.outlook.com (2603:10b6:510:106::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5514:EE_|SN4PR10MB5637:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f51fd68-2191-4451-d9a6-08dec89ec348
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|18002099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	atqTv+8nJ065k729R6jDlM3QoHDf4GpUwn1IpBsrWdI9rGnbyVm0B4k8qHajDoMfO+xgQNhlFgcaH6efKqixU+ppBwuEkTKzZVgGNxG3zWZrtgvCOCfrNvA0K5BUzKkOrD1oUAOagEHLqrP1GdXmakcfSxcwmAPl3vge7S2+sgTjxVrYFX6dRp9qchy6CGh4/uW25rt/L58vQv1X7FLYyUOM0XGbMNrXESgseNMFNh2qu4dEF4zZxSXZOfZ8NtHZ/6D99tVlSVYEfz2X1mKukueH2uKOyD6iBi/DV7hIeTFbIsgSe63BvwPyCv2wrM/pkxgwuy27bK0mQJV8lR3IQu6uLU6npcjrEtxyhuP1TNrvx1XKXmGWg4p1iwnqx+rkui6nywiM2xSr+Whm2Gw2uMTOOQXjUIrPHXRNnP9gyZI7MfpstgAGzb0iUlf5KTxzuUTMnKkYaR9gspwTEoDHs0rq/bFbrwAbEyPIpmN0nj98ZOpSslJ9Hl63Uay++9aoHilAJSkrsv9CQ3UlsILMpHfDa4nMrOIs/GfPaa2hhf2IKyqm305w9b8ohZAlhHTAgaBa+1epl9zl1sa1N2lW1pUCXtJKUa8d1lZoEqQlO7xl4L3vWsBN2JAw+aj+xkzhUTBOyHLvh9qB5E3xEH8f7Eh32mfrOLbdmGxoOh5dDPSxsfrkHHc6e1TB9KhQyHYK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5514.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jw+OfJ1l5Mkj5p+6kb2wonB9QyHcEF9zoM78uYkHdzcIpZ/bGC9K7JEISoLO?=
 =?us-ascii?Q?bTkmjjvajzyesoLc8sM9nbvH7FWMc8qvsBivv6C6I8RSj4RRT5EtSqyfZcbq?=
 =?us-ascii?Q?jbQyS4LgkN/S9/kLRZ/bjGBTkmltYh/8qjUKYcEIvG42yS628r+IGqm1Qfan?=
 =?us-ascii?Q?Pcd3C9jZnhReolyufbm/5UcWiOt8oErArVqFDTbP7Hd21ICm2d10zmdeCHuz?=
 =?us-ascii?Q?L0+YiolZI6W/LcjBjqAFePMvnSVBxA4vVYo1jtslVH+7kYkdOmFWbKMAMyQ/?=
 =?us-ascii?Q?U+Z3uFzfByqWXj5KGUSlyPh/hilsiX0YWzcRy0e8DrdlTV/uQeAQ7JebZivd?=
 =?us-ascii?Q?au5Rbu0LB9qgt/HuQujT2s23WUNfz8ps6GpCNjqCzBBI0Km05Z1bAwQ/c0NO?=
 =?us-ascii?Q?2iPYuqYT6LZtuTrSHPwzVLH7c0zgONUv+2Iqx5KFgkj7O3M1thLurbycfLgO?=
 =?us-ascii?Q?lJnRnAhlwv/Ynm7fKCYhRmZrjQDV+gHVf1uRl3QtR8TZLR8FJEp4bho3233/?=
 =?us-ascii?Q?X8QG/SHBoVs3e7JStemS7p4Jd628USaQ+23YPIb13xJas+2aGb89Itq3GUGe?=
 =?us-ascii?Q?7lDz3xQYV+jY/dcZdMwySSx6/HRo7TDsBikwy/fOyCXyr7YQzCOn/J2KYRXb?=
 =?us-ascii?Q?0xQ18JW8y8QJbgR6hC97mbgRo66dSBpeGc8QXsTv+SXSpUZ9vGw0B/seuThD?=
 =?us-ascii?Q?6mWEB75l7HW5oQ7msYVK4hxtsO6nGue96pV3o5PhUWYIBI7YAMze1tBRY6WC?=
 =?us-ascii?Q?g2Nl9ibBkVoVPiKFRmFqVbXVz732G7Cd1qzj56PdYr19FzOR+Q6f1RrLEpTu?=
 =?us-ascii?Q?4Yqs45GrFSJBkJiGhspY83CEAPwDkLyZcoL+PC7IvTtG8rP+jNAmGEG2tb1A?=
 =?us-ascii?Q?3t9TeHq6xZi/NicUZIEHrelwONs6PkbrhbAD62HsRHx1/m8it/h476GyVrwM?=
 =?us-ascii?Q?IbcW129AdRJGIMeo3XEvoi7pV+FNQThcvklzMYZjJUdyLegsARGLHbuiqO2W?=
 =?us-ascii?Q?8jI5bR8mMIYq82kQpAAFnY51Fi4iumD6tOFJTuV67sO4Z0o4AxxPl/oRqxnK?=
 =?us-ascii?Q?JUqKxSxNnYBfmL9I+RN4owayF3hOvd9hjG3EC9Z+OS1cZx18AzT2HMWo8xj5?=
 =?us-ascii?Q?JOpfLJ/EmA1RYhw9ZAWoiP1tFcvxrQj607Ng8F5TKnEO+91D474kvsgIIF8d?=
 =?us-ascii?Q?hfZUZX/iPOrbQIgySlKZm3UeU0NpKxJuy7PdNI22CpaWL/IPS4ueBk78AbyN?=
 =?us-ascii?Q?r5zjo4hwikcH+jt+vdoCe6BY9AxLTSIwaXOM/b6wrwjqsHw5x/6T03f04qzO?=
 =?us-ascii?Q?oQUsqWKN7SniKXDLmIe7kO0gxVqZ/aJcWfNV4xlbcXgWafRe6dsiHVJ0RHEq?=
 =?us-ascii?Q?/rm0u6RpG2p2w1Xm58/FG12A9QiVYtSxH3JbS+vhqzgoBrgLvq98JWZHgquj?=
 =?us-ascii?Q?EgbShpOqwDbhzNP09HmV6/LActszIF38yLD1GEO5uMV0YnjKKbc7eCIHvM29?=
 =?us-ascii?Q?fd4vQJq6CBwWH3JsvlgXVUZnOkKjvrl5VeiQSQtD6Z0CpNKuF4ZAOS4qRk8L?=
 =?us-ascii?Q?U7KMUG+f+7p7UbF1V49Xrq8MByE2UOi63KgazOrsOTBS1wyP5XYBcrmvlwWz?=
 =?us-ascii?Q?UiYk22k+s8y2mpyu7wYLBlMhxmYHRqcoqnhR0lG84+H/WhSQC1zMpYtlSf+9?=
 =?us-ascii?Q?cee+tcwnVbvDRAz+rbt+oRAUk6GxnOh26m9YCAWvelKtqnRDtHZDq0EM4aE8?=
 =?us-ascii?Q?MnVwrL0bLaoSPBNdaFmMNsfR2qvFuuc=3D?=
X-Exchange-RoutingPolicyChecked:
	E47t/VBcVwxpyFElJrIlhfAyGVlKpFW8SGranCE8OTuKYhSXEPkROYtRkCZ1+Jz72dqdRzw7AhaT+sWD+XuFsbi6T/tU6sBBtKhQmF52+1za4FUeQgeSNjFoFqwHDUnqoYFeXK7zXNCM7YbAfyP3FnrD6mgRZjlftyGNIGWqx1mRzGToHEVHqKJxFpBYO33ePYffLkHdnbkGr1HEJzQMlAZrwt5g9/3IWtGajvoLolOkc3NDe16IgnJhsz+FD+N2gUTMXi/tPGbHRGFd08mpMOQVefgSqVHL8wTW2sN4191PpqJIzu2MZ8mn9n1IRi8T/h+sCHmU7zxMK7tdZWw6kA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OTtFwQ3QVfKi4KwwIfE5/KsvIUxRFQpyoMUzi2cW6XFK7xUyGL1C8u5/ffBHppPi+G5EOS19/XNKSri7fwlzAiWY6JXoX/XvTiRAXc8uS1fDgltqedvrlCvWv5Wmck5eC4Gl4ZmO88tO0oO2CFPnvhVQdMAYDLXAodbsZXNmI0xonRLC6eQODIqbURjkwq1tqH1xYkX7qufYfvKDjKlPCa1W1WiSEYoB5MyB89Aroh7j4Cs1givqpAP6jDRSVW54GTjVyksZL5h78YEClpg0x22BGxldNSfltAvTREY4/TDccKMO1U8y9OIEDVHHG/2003PLQuVH2iY+6+jQGw97OL+5ovDLSVgCijNlE6oSrPNtJXkAZEHF1cw6PKrdYQFoDAy2ztn9NozNfxEqci4ZkifBcqi2V7mxTDji6EwN1sSqsck6cNky/mHXeIFhUd1WEUBXAzaJpn1Um3GbkEFDpDwbd+LJSJOYPCXe9xVl/TtwjLg10nA/isEkYkwSQI7lQss7VUpRfbcC3gViig/Eaan+HgFigVxg0/R8HYK5n1pQ4LrdrTpxlVWrfy646i9IXR8euP8z06B/8dh1xn+8tFAmJsG+Cgr614WARWSv6vg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f51fd68-2191-4451-d9a6-08dec89ec348
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5514.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 16:22:14.0915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RuTd6vm9opvSeC9XNz5zwunh9Q5+w6uEcu4Y64Qt/iiQkTLY6kNpi6Jt25ttMfKBFbot4J8bdfo6h14fPwL/vvQdRK0LPO7DphtxdTzRL5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5637
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0
 spamscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606040000 definitions=main-2606120151
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE1MSBTYWx0ZWRfX+zR/idit2K4X
 VMXXKB78d+b9+jpBjLPnFqt6mxh5mSzHR6oqqOCGffDLrnRa7gIYJAKONBDWto/20qyQg8QhKcc
 RWze6i90q3lyiCIYzFU/vnD7xhTd1L+lulfk+G3zyNxcvXm0/Nfy
X-Proofpoint-GUID: 9GAo7VB1mAAsHKSa0Mfo8hDScwr18gun
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE1MSBTYWx0ZWRfX5ngugc5DKHL6
 t2+QwKs2+SOKVvEabYFwkK1yPjAe4e4I7Zn60VNdf21/lZ0WMdNPsE4ptTQdZjMtNFv5Bu7jD7y
 a9zAPWLBv23kEUP3gwNxJ9cMoaxo6XeGVFHJgGD2+usU0DrGYk0PilFXr1j9juLM8/vSQQCAcS0
 +4LIeiLr4N6WCB/SK+0NTHbaGp2bV3i/V0dmPho5ZD9rXzYBk3T27Hzi4aBoXuJ+XDBP3K5H0MF
 2ej1BwKHT6NOlPU9Fq63LDvdV9Ja3Tbadavw1aOJCeiSXh6Ra0SbV19fPvxZ6mUv+QonWU2c2pt
 dfY84+iXoULutpdVSRminzKq4zSNoudmjmx8pd46C8/H60yuLnIq9JeS78PNwvJ63UCgyJ5E85l
 +Tacm59HTZrbqlZ38VsMLtRg/7ifLxi/GaJUr4BHCfZpz3qF0YRKmf6Ct4GPV76CSH0cHHLwGWN
 sMInTMirTMOsaSAkZgg==
X-Proofpoint-ORIG-GUID: 9GAo7VB1mAAsHKSa0Mfo8hDScwr18gun
X-Authority-Analysis: v=2.4 cv=dtTrzVg4 c=1 sm=1 tr=0 ts=6a2c323a b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=yPCof4ZbAAAA:8 a=AMuSwi9o_gtNlSW0J5IA:9

Use ssize_t for read() and write() return values, return negative errno
from usdt_parser_write_one() to match its callers, and cap the reply
size advertised by the jailed parser before allocating host memory.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtprobed/dtprobed.c          |  8 +++-
 libcommon/usdt_parser.c      |  2 +-
 libcommon/usdt_parser.h      | 13 +++++-
 libcommon/usdt_parser_host.c | 84 +++++++++++++++++++++++++++++++++---
 4 files changed, 95 insertions(+), 12 deletions(-)

diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index 81b28e6d..9ce941ee 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -935,10 +935,14 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
 	dt_list_t accum = {0};
 
 	do {
+		int parser_err;
+
 		errmsg = "DOF parser write failed";
-		while ((errno = usdt_parser_host_write(out, dh, data)) == EAGAIN);
-		if (errno != 0)
+		while ((parser_err = usdt_parser_host_write(out, dh, data)) == -EAGAIN);
+		if (parser_err != 0) {
+			errno = parser_err < 0 ? -parser_err : parser_err;
 			goto err;
+		}
 
 		/*
 		 * Wait for parsed reply.  If it fails, try once more; possibly
diff --git a/libcommon/usdt_parser.c b/libcommon/usdt_parser.c
index 1dc2fffb..18808b9a 100644
--- a/libcommon/usdt_parser.c
+++ b/libcommon/usdt_parser.c
@@ -71,7 +71,7 @@ usdt_copyin(int in, char *buf_, size_t sz)
 	memset(buf, 0, sz);
 
 	for (i = 0; i < sz; ) {
-		size_t ret;
+		ssize_t ret;
 
 		ret = read(in, buf + i, sz - i);
 
diff --git a/libcommon/usdt_parser.h b/libcommon/usdt_parser.h
index 99fc3033..a8298cbf 100644
--- a/libcommon/usdt_parser.h
+++ b/libcommon/usdt_parser.h
@@ -178,6 +178,15 @@ typedef struct dof_parsed {
 #define DIT_ARGS_NATIVE_HEADSZ	offsetof(dof_parsed_t, nargs.args)
 #define DIT_ARGS_XLAT_HEADSZ	offsetof(dof_parsed_t, xargs.args)
 #define DIT_ARGS_MAP_HEADSZ	offsetof(dof_parsed_t, argmap.argmap)
+#define DIT_BASE_HEADSZ		offsetof(dof_parsed_t, provider)
+#define DIT_EOF_HEADSZ		DIT_BASE_HEADSZ
+
+/*
+ * This is the maximum message size for dof_parsed_t (header + extra data).
+ * Parser replies are derived from one parser input block, which is already
+ * capped at DOF_MAXSZ.
+ */
+#define DIT_MAX_SIZE		DOF_MAXSZ
 
 /*
  * Host-side: in usdt_parser_host.c.
@@ -187,7 +196,7 @@ typedef struct dof_parsed {
 /*
  * Write the USDT definitions data to the parser pipe OUT.
  *
- * Returns 0 on success or a positive errno value on error.
+ * Returns 0 on success or a negative errno value on error.
  */
 int usdt_parser_host_write(int out, const dof_helper_t *dh,
 			   const usdt_data_t *data);
@@ -250,7 +259,7 @@ int usdt_parse_notes(int out, dof_helper_t *dhp, usdt_data_t *data);
 /*
  * Write something to the parser pipe OUT.
  *
- * Returns 0 on success or a positive errno value on error.
+ * Returns 0 on success or a negative errno value on error.
  */
 int usdt_parser_write_one(int out, const void *buf, size_t size);
 
diff --git a/libcommon/usdt_parser_host.c b/libcommon/usdt_parser_host.c
index 80dcf10f..939c66e7 100644
--- a/libcommon/usdt_parser_host.c
+++ b/libcommon/usdt_parser_host.c
@@ -18,7 +18,7 @@
 /*
  * Write BUF to the parser pipe OUT.
  *
- * Returns 0 on success or a positive errno value on error.
+ * Returns 0 on success or a negative errno value on error.
  */
 int
 usdt_parser_write_one(int out, const void *buf_, size_t size)
@@ -27,7 +27,7 @@ usdt_parser_write_one(int out, const void *buf_, size_t size)
 	char *buf = (char *) buf_;
 
 	for (i = 0; i < size; ) {
-		size_t ret;
+		ssize_t ret;
 
 		ret = write(out, buf + i, size - i);
 		if (ret < 0) {
@@ -35,7 +35,7 @@ usdt_parser_write_one(int out, const void *buf_, size_t size)
 			case EINTR:
 				continue;
 			default:
-				return errno;
+				return -errno;
 			}
 		}
 
@@ -45,10 +45,72 @@ usdt_parser_write_one(int out, const void *buf_, size_t size)
 	return 0;
 }
 
+static int
+usdt_parser_validate_reply(dof_parsed_t *reply)
+{
+	size_t	min_size;
+	size_t	payload_size;
+	const char *payload;
+
+	switch (reply->type) {
+	case DIT_PROVIDER:
+		min_size = DIT_PROVIDER_HEADSZ + 1;
+		payload = reply->provider.name;
+		break;
+	case DIT_PROBE:
+		min_size = DIT_PROBE_HEADSZ + 1;
+		payload = reply->probe.name;
+		break;
+	case DIT_TRACEPOINT:
+		min_size = DIT_TRACEPOINT_HEADSZ + 1;
+		payload = reply->tracepoint.args;
+		break;
+	case DIT_ERR:
+		min_size = DIT_ERR_HEADSZ + 1;
+		payload = reply->err.err;
+		break;
+	case DIT_ARGS_NATIVE:
+		min_size = DIT_ARGS_NATIVE_HEADSZ + 1;
+		payload = reply->nargs.args;
+		break;
+	case DIT_ARGS_XLAT:
+		min_size = DIT_ARGS_XLAT_HEADSZ + 1;
+		payload = reply->xargs.args;
+		break;
+	case DIT_ARGS_MAP:
+		min_size = DIT_ARGS_MAP_HEADSZ + 1;
+		payload = NULL;
+		break;
+	case DIT_EOF:
+		min_size = DIT_EOF_HEADSZ;
+		payload = NULL;
+		break;
+	default:
+		errno = EPROTO;
+		return -1;
+	}
+
+	if (reply->size < min_size) {
+		errno = EPROTO;
+		return -1;
+	}
+
+	if (payload == NULL)
+		return 0;
+
+	payload_size = reply->size - (payload - (const char *)reply);
+	if (memchr(payload, '\0', payload_size) == NULL) {
+		errno = EPROTO;
+		return -1;
+	}
+
+	return 0;
+}
+
 /*
  * Write the DOF to the parser pipe OUT.
  *
- * Returns 0 on success or a positive errno value on error.
+ * Returns 0 on success or a negative errno value on error.
  */
 int
 usdt_parser_host_write(int out, const dof_helper_t *dh, const usdt_data_t *data)
@@ -118,7 +180,7 @@ usdt_parser_host_read(int in, int timeout)
 	 * longer than expected is better than no read at all.
 	 */
 	for (i = 0, sz = offsetof(dof_parsed_t, type); i < sz;) {
-		size_t ret;
+		ssize_t ret;
 		struct timespec start, end;
 		int no_adjustment = 0;
 		long timeout_msec = timeout * MILLISEC;
@@ -151,10 +213,16 @@ usdt_parser_host_read(int in, int timeout)
 		/*
 		 * Fix up the size once it's received.  Might be large enough
 		 * that we've done the initial size read...
+		 * The size is bound to avoid memory starvation.
 		 */
 		if (i < offsetof(dof_parsed_t, type) &&
-		    i + ret >= offsetof(dof_parsed_t, type))
+		    i + ret >= offsetof(dof_parsed_t, type)) {
 			sz = reply->size;
+			if (sz < DIT_BASE_HEADSZ || sz > DIT_MAX_SIZE) {
+				errno = EPROTO;
+				goto err;
+			}
+		}
 
 		/* Allocate more room if needed for the reply.  */
 		if (sz > sizeof(dof_parsed_t)) {
@@ -171,10 +239,12 @@ usdt_parser_host_read(int in, int timeout)
 		i += ret;
 	}
 
+	if (usdt_parser_validate_reply(reply) < 0)
+		goto err;
+
 	return reply;
 
 err:
 	free(reply);
 	return NULL;
 }
-
-- 
2.47.3

