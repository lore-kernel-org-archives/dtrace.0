Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4993612F8
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 18:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942962; cv=fail; b=d3+bmcvF/ylPBia+6ZhEXATLgksJry3Ogqdp627nWFKHau6jLRloGL32RR8p3YsYV14Zbe5KfeL+EYLe5MPrV/1rPsV59owwgyv6vwvQNjywyM/M3C2eDtAeA4zPoBb6lOJmVavwuBhASe+1xMIbdFFTpIY9hDS7ZcFkpOExPvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942962; c=relaxed/simple;
	bh=cHqfH9QZ4HAWEWYDHfFp2TO78BdN1DlsWzfmR7xjgl4=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=r4zqLL8r/JO4OYOX2pbQn7tfet4vEPkqGLs4JJeNQwcL5jaBd8bKXvghn2kuQLiO8dktrb4swpV8l6jZbmGM0D4B3vRhu5/Vm5oA++AZO54wp/LTlI8Uqc4WVrpamtrUZdD1uVIPjwv8H8TM1ZTWvyaxSUK9Ug+BfIRlegaCNoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LS9FNYBA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TCXeiEoG; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LS9FNYBA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TCXeiEoG"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SHJwne3147090
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 18:49:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=1hX/qO7fFuGs1MnNTZx7Vt+cTpLegrx6kSHjn3w5q/Y=; b=
	LS9FNYBA6MsMcgHCeiH+aqc59lDfGKtO30oga+TlqfxXIaG27dpb4QIs1HE7ViRr
	oeuyM5BJS5r5ZWr1vMY9j6ioaNnvzY/4YmENWHGjdyEDqUuEASuZXDC6JHyjaGvM
	9s7adhfvLs1TaSJ5SFJA0UgbEkooH9K75dciTdNdSHUrXxa5K3+3x51qdrJ4uWy5
	4AcYPVeqa38Pw5jqh1r+P/DmqimKrzKCUJ5L3UKk1Pmx8d/N8f3H4oz0lg52kPGq
	OC2kGSUW37zfxma9LXqDtX+sxKGoZ2kIk6S2PMp+MlkhSTnEQf+j13T+v/MHg53a
	xlPAFLJTj/ql0YEwNF4alg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g72j22edw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 18:49:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67SIecel038530
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 18:49:17 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011022.outbound.protection.outlook.com [40.107.208.22])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4g849pmmvt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 18:49:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oIpBl74UKWdpSll7hj/b3HN5YhWEDpYpazyV/3vFDOEa96D1NWuUbFmjh9TLuoc6o3EkbmTzFdGbtCcOJf7PBmt7/N9Wz+T653I+xSE8gSRSmnxhpTcpSxmb6VyA25KT6aa9uu97Gsbhh0rshD21jZlmbmik66e9vHD6jKtIklIdCaPkRWH4y/rvbJURSsxBnFAmuycO/4WMnLysssJFGqmsHCUcszBUrhaDLC9ctiXv3gBv54IlNMWO8KJ87oYA1MU8CwuUkwTXKGQtxUr/afEKC7IJlFemdiTiFvmDa90e3xkfcIDN9p01zvOHW2M1/80BcwqAacAQS4P0pK9daQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hX/qO7fFuGs1MnNTZx7Vt+cTpLegrx6kSHjn3w5q/Y=;
 b=jaoVVx5DCJzokldxWe6eE/MnucGryymryGz6Wt1L7OevsKCgr5zS+CgsUyaZThB8aE2OASunWkivMWBZx+W/31orttKTDpgl1BvbHYz39sW8Px2iJfF09HGL/sIFYUxGXUMpzkuCjOrx7vrh90yzCgtExO6K7WYL4reoUdWbvThjfgGJDTK2NOLP/ETncjZki9MXel3QD+bPVM4IpRRUasylvLDJJj7hVwtohxeyX+HxTWh2YYTRW4GzLMzBcMcVIXHcvuw/ypTRczoa5v0unSGS+sfeIJD1X0zTq/TodWAW17ujelztLXa+Vfiru//lPyF5fGma1FmrYV7oK4WwvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hX/qO7fFuGs1MnNTZx7Vt+cTpLegrx6kSHjn3w5q/Y=;
 b=TCXeiEoG9WC8clVpkF7e6OXpZbPTIYtg5Ejd1/8JrmyrrD+CZfkryCM0uoeskNrWyg1PoJc8kfQcmnrCu0fBJb9run6Dfs0cDWSdtfpcdKEJzP6DKQzKB0xnVu3NnWH6snu2yyT+xHFUKeaYsrpeGo2dNoBKJsZhF6if6TR7vS4=
Received: from DM6PR10MB2476.namprd10.prod.outlook.com (2603:10b6:5:ae::24) by
 SN7PR10MB6665.namprd10.prod.outlook.com (2603:10b6:806:2af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.7; Fri, 28 Aug
 2026 18:49:12 +0000
Received: from DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537]) by DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537%5]) with mapi id 15.21.0382.007; Fri, 28 Aug 2026
 18:49:12 +0000
Date: Fri, 28 Aug 2026 18:48:17 +0000
Message-ID: <5de2ae24696627e3c3b28afc4a49e51f@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] parser: validate scoped external names
Content-Type: text/plain
X-ClientProxiedBy: CH2PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:610:52::17) To DM6PR10MB2476.namprd10.prod.outlook.com
 (2603:10b6:5:ae::24)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB2476:EE_|SN7PR10MB6665:EE_
X-MS-Office365-Filtering-Correlation-Id: 432b839d-fc4a-4035-1b2a-08df05350d47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|6133799003|3023799007|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	Aro2fBPhdFG9+uSVLg7wHwknbURyihQD6h7oEu7K4lYVQF0jcA9FWEtk3286HE+fQLt/+VxuHLsHMuAUPpnQ3qCKFf3AxnzVtKngO2MZZGzbuNpDWIPX/xoWX7+ZG4rjHImJ8N7TB1tm4VR75Fm45DK507z2fBGokwkU+qpJ00KQxSBJ+PxRcM42ksmfRmlZjUbX2NEXRLvNyX5dj/SkFgh/zxbRGbGJlqfWn6xGD50UjnFlLd5xdyNC5xn2+VgcalIrytOWsLD2+pJx0dz27aQ4EjkrpyfhtndxKM5AF83gSc6ONXGHRTpOEsnLSCYXOfDUqzBDfjjjmfK/Ep/yL0OW+eyl7ZssOI8JQxquzzRe7Q82H0q+0NiwMV1wzOCLyRHuMHhEne8I6MWh1BCgxkq+LshpZZM1/69CzwEeH+cm6KAN6XTP58FKxDDz9ovKdz/kvltJMZ4hGXSDTCAA3PtyN1LfluDBOsC+t6TPCnw48SMbY99OCHS/mHKWnVrYL9wkmC6Smm52Pb1nECu0G3Hq+bg+wGgJjJ0xvQeaGIrEqE2x5I919TwycKGMdlTVLklBh4/J6BXNwGhmRX0VESCxQ5W7JCo6I90tT6swlUWTCynUDAJiUJisR4bDWdOnV749EvxXaL+0v9MFcGoYYEqHdDT3eP+Hi5JgN+ZkpmA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB2476.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(6133799003)(3023799007)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RNPTkCMldxKPZFEjFiiDDiMPJG0x/p+j4w3hiupnImler9GzepwqpdQLWDnS?=
 =?us-ascii?Q?OQ+SIufScTYLuvdKziBM9OVjafWx3jboKRk+pJ2tX9kOUn/9ozvjqDN8cqUm?=
 =?us-ascii?Q?w5PBa8LOqYjysoXl92AQxxz6LESVyNbtsj6MIWcBgQ+y7XXkCLVxmTHCasOL?=
 =?us-ascii?Q?cof5xh+xYSIcZDlHrV4s2wjpgdqhHzJ6UR3bxS2Mp7AZQ6GOn3Z3O95ovlJF?=
 =?us-ascii?Q?MUM8X3cy9/FsNY8osCRJKF9Z2NuiafkqahQlGlyXVO7E6q5TJTH3oVj9h+i/?=
 =?us-ascii?Q?HsF2AfPbYGZRHfsOgoXvJ6jQhwCVyAwMXA5QXkZoy1NCNfroPL2d8Zny6rKj?=
 =?us-ascii?Q?TbRY/1lq3w0Dnd906TxF0A5fvjq8uvfVgWzGeVagkRx8HPrWkP8bJnXbQg0C?=
 =?us-ascii?Q?f0RUET+nu33DTrvgdmr4K4Dg2faNNxU2Jj9xVOdqVQZdVObj5/hlncgcJ9Hn?=
 =?us-ascii?Q?a21RSqJLzzGtKdrkoRshc6nFKdD17Txh03n50crVEixlCvkP4C8xDom413Az?=
 =?us-ascii?Q?nXQIaLr3NMLl19Fs2bdIyUnf3QoK//bCyNaKGpmnW/kS5gkLsOn23gLWho04?=
 =?us-ascii?Q?HkIXusidI8duxX8bpb+ag4Gmc/EB8aww68VmNhWz1eIkXLW72SIshRaqlTMm?=
 =?us-ascii?Q?HwUymKo47LRy3FLnWRiyNEIZPNsoDaHgheKbu1h7sTTHaJj6R9x4djISBm09?=
 =?us-ascii?Q?utErW1T7u+6xqRi1JouJGPy/TaoL+e2xpVUkcmQ0XIn4meVcTTCKBPQv0PPC?=
 =?us-ascii?Q?XyaWloBcahycwxsAh4Giv0xYpFSMmsCQKS96r4vt2OWH3Lqk8SHZTsxaTAOZ?=
 =?us-ascii?Q?dqk+w8wrIrnn1BeCwQVEcwPE6EQZVf2vMB5gmyF/ES3WtLaws8tGAkorRoGq?=
 =?us-ascii?Q?digIFIOTVMm65huiTMUadc/tLjEj4kZMI6oYQVXfvrtx14H/Q379f1PVak/r?=
 =?us-ascii?Q?ZrMu3d0r+moV9e99WOjLretcxApTvVuE2TvwTJ1VAGC5eFxZPNAwzWt3ACvq?=
 =?us-ascii?Q?EJSNMZ2YRNlVhw+631lpfEyP9demZP6muJK4l5Oqlnd94RiK2mpAHVkuz60w?=
 =?us-ascii?Q?BvkKgzpEKGazSieN3t1PYzIrix8h2AepxwOoEg9LJHp2aFgAomupeeeOwtow?=
 =?us-ascii?Q?FNi3zkgOScsuqLrpEsO37wXLQRrJWeF5tgrTGzsfrIWiwx8OcdoAXHN7/MZO?=
 =?us-ascii?Q?mV6KcpJJ3bzgntW77uxtF1Sg1ZZ2DgGRd+cAL+XJxGchkbcTLK68u/veaOBR?=
 =?us-ascii?Q?lKng/oRrOIQ8xGtLTmO7MRoJlXrRrlZ4HfrasCQH4/xTKiToOPZeWd40aJlc?=
 =?us-ascii?Q?7+b15M8PZSupJzTau85KZPeMzugDZlpKWZ6KPQ0M7M4VtveKMwfu075KkgYw?=
 =?us-ascii?Q?rGM6JILu4Tg7zcATXxxhe+hU6GJE4ZAKEIYbeEE4dLtKmM1hvmkOowcS7kKK?=
 =?us-ascii?Q?llZ3SEYKvW9RR5shKdcFGJj6Ac1TQxJfmKLc0CUk6avM3NCJKd7WM8qHHRKT?=
 =?us-ascii?Q?5voyN67Sg7rimlPy52NOlcbHj3S6kj88g/+HvprbYTO4OjULojUf/ObcUHjM?=
 =?us-ascii?Q?bGpAoFbb2GBC7GlZoLOFEH/XbGUYEdft1NnkaMpcv0DXQTUkA1KzldDgW4bu?=
 =?us-ascii?Q?KRhH+Ivq2/k0Mg2o9Qg+sVqv1ak3aByyzQG6NWL2ZoMgjCuiHaidzq49QRw7?=
 =?us-ascii?Q?Bxcel/WOF9cZpZHGQ5MylK1ReU25vJ/HUhvyPdBJbt9tZlt0OTzKKon/fKgr?=
 =?us-ascii?Q?+j+bhIgDZ3nuXvHjU7LivrKdIoWGRjo=3D?=
X-Exchange-RoutingPolicyChecked:
	e48T31TPSFXrXV5w2cWWzJWWDQSho5TtJ1fW/6MeLlxU3g1lp1FsMrp+4PwmOKRh/daI4yUZAsGiEDEUK8IUL9LrF1XvWECwBXoap2ORqyka0Z5eSDEy8LnpK9GJDJQh5ERf/+L3xOGqKQz8Qb/g+por5XH3oaKmcS3fNKGKAWP96bLUCeg5UFGpyF/9QLH6xWTDWlMeKBL7A3yl0WMb8FIrknklZVU72V6RYk625DITlFHBZIUlWyBkJavKIMj3qQeYZvInqpbQToX8IMzND3KuPjL5Il6SfiYjvWunTZfcW5534r51V2JtSLjNCiOBUw+hiHo/4VVhjWC6jL4BdQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Pu9ob8gm9pie59jT1B0TNlM552baV1FIVBxVmBNZgRI3pwo3+Wi4StyA3Mf7p55tdZqdwy4v0MLbjWUpGQD4WYPhDLYAlLwl/veodzhXsfO6RXiiAUoItLPPkSM5Ut4SvtyGdqzhs9ho80qcR8PYnCY2TSi3lr4zwm0wsCG3HaZOTxPONyi4kP7BMct1RCHdXir1OrV05Of6pfjSF7ugpBQvHweepUhAfTb5W0vfXdtJTg0xszu3kZI9Or2X6N9OZs+zXeGprvkM5Qth7KouDhhf+tY6gW+Q4LLhE51cREV7IOa5+1ECtWrbQU0q62tFJgxhAqa83FiieCrQNxX67iVVuwHUODisuX5nM//rd3VjqtS21hLmL2mj39x0FmQepMKmOYsc2VXeYjDk6uzce534MbxqirdpIm/sMKPRsTVXnkxlf4xczP2yURLqism4JlEtyhSkFr1t/P10K1m1fflnLoWZCcHOLl3wED31Cner+NeP0bSFeLvDc1LmljiI4gmHCiVCz2EDhY3GuC45QjjzOioBniX2CcUrBsHCbRaAvdstFhmenA9DpG6ysNv+zHZ/TPWlU5GVJC2qmVg2azcoq4KbobeIRXGaTs26ogw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 432b839d-fc4a-4035-1b2a-08df05350d47
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2476.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 18:49:12.5575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZICk42k2tXIQH6k51kRyAPTULXtYrmHyI9tmHno6Qt2tPiW3rrNBeSG8tYaVuvFMn9S/A2KhB0z4+GmMt3ShAKF1+jJ40z7fIwsxi9414/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6665
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606160000 definitions=main-2608280163
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE2NCBTYWx0ZWRfX4IDRGIqtu7e7
 kUx6LU1Wga4v+EgYqm2v9gDxG/CX33sTT7SJMdzIZkRzSLwsdrNxbLP2UmfvOsQ7a30HFkbJ0Mw
 XNV/maDgHo7D1WS+5qisVeLgcpsZs0sJhcbMQ8HT3fuqnGTbZuZO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE2NCBTYWx0ZWRfX7sYU+7NvxiUt
 lIA0IY5VSiJY5VtXc/yDQ9wEk3aw5DxRCNCId4mvCb6biKBYQrGooKUe/eMSOQf427jU3x7Bo+q
 0he1mEAV/Jd/j4a1ptngNUrugNmDMLdJEmFn6/9+Vp5YY2DqrfXHJUe7irw+x//aIFYqTtLsNBo
 AbfhkZ3UI1+zOd0eNjrhsUlMBXDFspjaox4WIASmZ7mW2kE8/qz/4826q3e9raWDvNOVZhAmXs8
 NUbWMKpL4ClmP1yNu1u7P35LfGfgffp8GkbGFZ/a/CP4HzQk+5Ca73C+lmYtypSyKkgwAIyZrBl
 qNH69lC3nyn29Qdh5nyNSSXU4i2ph3AY9LmS6HxDth6/SmhLdn7D8mMenzsV1C2qdc4TK+/B93t
 kcGNJwipZz9HVt6czLbiyKzCzUb9BBOx6yV406RUgdk4YrQYFh3SufiPMCHolX2hjzbBaLXMJse
 HFTKASaVPXOrfmLwOVJqimnl4xeIKxuv3Zjkpbjs=
X-Proofpoint-GUID: fQraGwarwipFbYLIFhzF_KY_-XJPzUT2
X-Authority-Analysis: v=2.4 cv=Wek8rUhX c=1 sm=1 tr=0 ts=6a91d82e b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=o5oIOnhZENCTenyL_yNV:22 a=yPCof4ZbAAAA:8 a=4JIFZwGedSQb7AANOCAA:9
 a=rEqNaWj0-quomjz8:21 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22
 cc=ntf awl=host:12102
X-Proofpoint-ORIG-GUID: fQraGwarwipFbYLIFhzF_KY_-XJPzUT2

Centralize parsing of D scoping markers used by external type and symbol
references.  The helper now returns the resolved scope and identifier
pieces, supports kernel and userspace markers for both type and symbol
lookup, and rejects empty operands, runs longer than two backticks, and
repeated scoping markers as D_SYNTAX instead of falling through to lookup
failures.

Recognize dotted scoped identifiers as a single lexer token so module
names like foo.bar resolve as one external symbol reference.

Add lexer and type regression tests for malformed scoped identifiers,
dotted scopes, empty scope operands, scope-kind mismatches, and scoping
operators in declarations.  Update the sizeof unknown-symbol test to use
a non-empty symbol name.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_decl.c                           |   6 +-
 libdtrace/dt_lex.l                            |   5 +
 libdtrace/dt_parser.c                         | 140 ++++++++++++------
 libdtrace/dt_parser.h                         |   1 +
 .../err.D_IDENT_UNDEF.scope-dot-kernel.d      |  19 +++
 .../err.D_IDENT_UNDEF.scope-dot-kernel.r      |   2 +
 .../lexer/err.D_IDENT_UNDEF.scope-dot.d       |  19 +++
 .../lexer/err.D_IDENT_UNDEF.scope-dot.r       |   2 +
 .../err.D_SYM_BADREF.scope-kernel-as-user.d   |  18 +++
 .../err.D_SYM_BADREF.scope-kernel-as-user.r   |   2 +
 .../err.D_SYM_BADREF.scope-user-as-kernel.d   |  20 +++
 .../err.D_SYM_BADREF.scope-user-as-kernel.r   |   2 +
 .../err.D_SYNTAX.scope-empty-bare-user.d      |  19 +++
 .../err.D_SYNTAX.scope-empty-bare-user.r      |   2 +
 .../lexer/err.D_SYNTAX.scope-empty-bare.d     |  19 +++
 .../lexer/err.D_SYNTAX.scope-empty-bare.r     |   2 +
 .../lexer/err.D_SYNTAX.scope-empty-dot-user.d |  19 +++
 .../lexer/err.D_SYNTAX.scope-empty-dot-user.r |   2 +
 .../lexer/err.D_SYNTAX.scope-empty-user.d     |  19 +++
 .../lexer/err.D_SYNTAX.scope-empty-user.r     |   2 +
 .../unittest/lexer/err.D_SYNTAX.scope-empty.d |  18 +++
 .../unittest/lexer/err.D_SYNTAX.scope-empty.r |   2 +
 .../lexer/err.D_SYNTAX.scope-multiple.d       |  19 +++
 .../lexer/err.D_SYNTAX.scope-multiple.r       |   2 +
 .../lexer/err.D_SYNTAX.scope-triple.d         |  19 +++
 .../lexer/err.D_SYNTAX.scope-triple.r         |   2 +
 test/unittest/lexer/tst.scope-user-explicit.d |  22 +++
 .../sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d  |   2 +-
 .../sizeof/err.D_IDENT_UNDEF.UnknownSymbol.r  |   2 +-
 .../err.D_DECL_SCOPE.scopeop-enumerator.d     |  16 ++
 .../err.D_DECL_SCOPE.scopeop-enumerator.r     |   2 +
 .../types/err.D_DECL_SCOPE.scopeop-ident.d    |  19 +++
 .../types/err.D_DECL_SCOPE.scopeop-ident.r    |   2 +
 .../types/err.D_DECL_SCOPE.scopeop-member.d   |  16 ++
 .../types/err.D_DECL_SCOPE.scopeop-member.r   |   2 +
 35 files changed, 414 insertions(+), 51 deletions(-)
 create mode 100644 test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d
 create mode 100644 test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r
 create mode 100644 test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d
 create mode 100644 test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r
 create mode 100644 test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d
 create mode 100644 test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.r
 create mode 100644 test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d
 create mode 100644 test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.r
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.d
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.r
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.d
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.r
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.d
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.r
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-user.d
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-user.r
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty.d
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty.r
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-multiple.d
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-multiple.r
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-triple.d
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-triple.r
 create mode 100644 test/unittest/lexer/tst.scope-user-explicit.d
 create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d
 create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r
 create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.d
 create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.r
 create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-member.d
 create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-member.r

diff --git a/libdtrace/dt_decl.c b/libdtrace/dt_decl.c
index 1f4936dd..68999422 100644
--- a/libdtrace/dt_decl.c
+++ b/libdtrace/dt_decl.c
@@ -233,10 +233,8 @@ dt_decl_spec(ushort_t kind, char *name)
 	ddp->dd_kind = kind;
 	ddp->dd_name = name;
 
-	if (name != NULL && strchr(name, '`') != NULL) {
-		xyerror(D_DECL_SCOPE, "D scoping operator may not be used "
-		    "in a type name\n");
-	}
+	if (name != NULL && dt_scope_parse(name, NULL, NULL) < 0)
+		xyerror(D_SYNTAX, "syntax error near \"%s\"\n", name);
 
 	return dt_decl_check(ddp);
 }
diff --git a/libdtrace/dt_lex.l b/libdtrace/dt_lex.l
index fd70aa0a..bf133676 100644
--- a/libdtrace/dt_lex.l
+++ b/libdtrace/dt_lex.l
@@ -50,6 +50,7 @@ static size_t dt_input(char *buf, size_t max_size);
 RGX_AGG		"@"[a-zA-Z_][0-9a-zA-Z_]*
 RGX_PSPEC	[-$:a-zA-Z_.?*\\\[\]!][-$:0-9a-zA-Z_.`?*\\\[\]!]*
 RGX_IDENT	([a-zA-Z_`][0-9a-zA-Z_`]*)|([0-9][0-9a-zA-Z_]*`[0-9a-zA-Z_`]*)
+RGX_SCOPE_IDENT	[0-9a-zA-Z_][0-9a-zA-Z_]*(\.[0-9a-zA-Z_]+)+``?[0-9a-zA-Z_]+
 RGX_INT		([0-9]+|0[xX][0-9A-Fa-f]+)[uU]?[lL]?[lL]?
 RGX_FP		([0-9]+("."?)[0-9]*|"."[0-9]+)((e|E)("+"|-)?[0-9]+)?[fFlL]?
 RGX_WS		[\f\n\r\t\v ]
@@ -299,6 +300,7 @@ if (yypcb->pcb_token != 0) {
 			return DT_TOK_INT;
 		}
 
+<S0>{RGX_SCOPE_IDENT} |
 <S0,SIDENT>{RGX_IDENT}	{
 			return id_or_type(yytext);
 		}
@@ -728,6 +730,9 @@ id_or_type(const char *s)
 	int c0, c1;
 	dt_ident_t *idp;
 
+	if (dt_scope_parse(s, NULL, NULL) < 0)
+		xyerror(D_SYNTAX, "syntax error near \"%s\"\n", s);
+
 	if ((s = yylval.l_str = strdup(s)) == NULL)
 		longjmp(yypcb->pcb_jmpbuf, EDT_NOMEM);
 
diff --git a/libdtrace/dt_parser.c b/libdtrace/dt_parser.c
index e71c0985..1fd0f5b4 100644
--- a/libdtrace/dt_parser.c
+++ b/libdtrace/dt_parser.c
@@ -168,45 +168,96 @@ opstr(int op)
 	}
 }
 
+/*
+ * Parse the D scoping mark used in external type and symbol names.  A scoped
+ * name can contain one mark only: ` for kernel scope, or `` for user scope.
+ * Longer runs and repeated marks are malformed.  Return the scope kind as 0
+ * for no scope, 1 for kernel scope, or 2 for user scope.
+ */
 int
-dt_type_lookup(const char *s, dtrace_typeinfo_t *tip)
+dt_scope_parse(const char *s, const char **scopep, const char **identp)
 {
-	static const char delimiters[] = " \t\n\r\v\f*`";
-	dtrace_hdl_t *dtp = yypcb->pcb_hdl;
-	const char *p, *q, *end, *obj;
+	static const char delimiters[] = " \t\n\r\v\f*";
+	const char *mark = strchr(s, '`');
+	const char *scope;
+	size_t marklen = 1;
+
+	if (mark == NULL) {
+		if (scopep != NULL)
+			*scopep = DTRACE_OBJ_EXEC;
+		if (identp != NULL)
+			*identp = s;
+		return 0;
+	}
 
-	for (p = s, end = s + strlen(s); *p != '\0'; p = q) {
-		while (isspace(*p))
-			p++;	/* skip leading whitespace prior to token */
+	if (mark[1] == '`') {
+		marklen = 2;
+		if (mark[2] == '`')
+			return -1;
+	}
 
-		if (p == end || (q = strpbrk(p + 1, delimiters)) == NULL)
-			break;	/* empty string or single token remaining */
+	if (mark[marklen] == '\0')
+		return -1;
 
-		if (*q == '`') {
-			char *object = alloca((size_t)(q - p) + 1);
-			char *type = alloca((size_t)(end - s) + 1);
+	if (strchr(mark + marklen, '`') != NULL)
+		return -1;
 
-			/*
-			 * Copy from the start of the token (p) to the location
-			 * backquote (q) to extract the nul-terminated object.
-			 */
-			memcpy(object, p, (size_t)(q - p));
-			object[(size_t)(q - p)] = '\0';
+	for (scope = mark;
+	    scope > s && strchr(delimiters, scope[-1]) == NULL; )
+		scope--;
 
-			/*
-			 * Copy the original string up to the start of this
-			 * token (p) into type, and then concatenate everything
-			 * after q.  This is the type name without the object.
-			 */
-			memcpy(type, s, (size_t)(p - s));
-			memcpy(type + (size_t)(p - s), q + 1,
-			    strlen(q + 1) + 1);
+	if (scope == mark)
+		scope = marklen == 2 ? DTRACE_OBJ_UMODS : DTRACE_OBJ_KMODS;
+
+	if (scopep != NULL)
+		*scopep = scope;
+	if (identp != NULL)
+		*identp = mark + marklen;
+
+	return marklen;
+}
+
+int
+dt_type_lookup(const char *s, dtrace_typeinfo_t *tip)
+{
+	dtrace_hdl_t *dtp = yypcb->pcb_hdl;
+	const char *scope, *ident, *start, *obj;
+	int scopekind;
+
+	scopekind = dt_scope_parse(s, &scope, &ident);
+	if (scopekind < 0)
+		return dt_set_errno(dtp, EDT_BADSCOPE);
 
-			if (strchr(q + 1, '`') != NULL)
-				return dt_set_errno(dtp, EDT_BADSCOPE);
+	if (scopekind > 0) {
+		char *type;
+
+		/*
+		 * If there is no explicit object before the mark, search all
+		 * kernel or user objects depending on the mark width.
+		 */
+		if (scope == DTRACE_OBJ_KMODS || scope == DTRACE_OBJ_UMODS) {
+			start = ident - scopekind;
+			obj = scope;
+		} else {
+			size_t objlen = (size_t)(ident - scope) - scopekind;
+			char *object = alloca(objlen + 1);
 
-			return dtrace_lookup_by_type(dtp, object, type, tip);
+			memcpy(object, scope, objlen);
+			object[objlen] = '\0';
+			start = scope;
+			obj = object;
 		}
+
+		/*
+		 * Copy the original string up to the start of this token
+		 * into type, and then concatenate everything after the scoping
+		 * mark.  This is the type name without the object and mark.
+		 */
+		type = alloca((size_t)(start - s) + strlen(ident) + 1);
+		memcpy(type, s, (size_t)(start - s));
+		memcpy(type + (size_t)(start - s), ident, strlen(ident) + 1);
+
+		return dtrace_lookup_by_type(dtp, obj, type, tip);
 	}
 
 	if (yypcb->pcb_idepth != 0)
@@ -2767,9 +2818,10 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
 	dtrace_syminfo_t dts;
 	GElf_Sym sym;
 
-	const char *scope, *mark;
+	const char *scope, *ident, *markstr;
 	uchar_t dnkind;
 	char *name;
+	int scopekind;
 
 	/*
 	 * Look for scoping marks in the identifier.  If one is found, set our
@@ -2779,18 +2831,16 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
 	 * Otherwise we set scope to DTRACE_OBJ_EXEC, indicating that normal
 	 * scope is desired and we should search the specified idhash.
 	 */
-	if ((name = strrchr(dnp->dn_string, '`')) != NULL) {
-		if (name > dnp->dn_string && name[-1] == '`') {
-			uref++;
-			name[-1] = '\0';
-		}
-
-		if (name == dnp->dn_string + uref)
-			scope = uref ? DTRACE_OBJ_UMODS : DTRACE_OBJ_KMODS;
-		else
-			scope = dnp->dn_string;
+	scopekind = dt_scope_parse(dnp->dn_string, &scope, &ident);
+	if (scopekind < 0) {
+		xyerror(D_SYNTAX, "syntax error near \"%s\"\n",
+		    dnp->dn_string);
+	}
 
-		*name++ = '\0'; /* leave name pointing after scoping mark */
+	if (scopekind > 0) {
+		uref = scopekind == 2;
+		name = (char *)ident;
+		*(char *)(ident - scopekind) = '\0';
 		dnkind = DT_NODE_VAR;
 
 	} else if (idkind == DT_IDENT_AGG) {
@@ -2810,7 +2860,7 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
 	 * errno appropriately and that error will be reported instead.
 	 */
 	dt_set_errno(dtp, EDT_NOVAR);
-	mark = uref ? "``" : "`";
+	markstr = uref ? "``" : "`";
 
 	if (scope == DTRACE_OBJ_EXEC && (
 	    (dhp != dtp->dt_globals &&
@@ -2902,13 +2952,13 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
 				xyerror(D_SYM_MODEL, "cannot use %s symbol "
 					"%s%s%s in a %s D program\n",
 					dt_module_modelname(mp), dts.object,
-					mark, dts.name,
+					markstr, dts.name,
 					dt_module_modelname(dtp->dt_ddefs));
 			}
 
 			xyerror(D_SYM_NOTYPES, "no symbolic type information "
 				"is available for %s%s%s: %s\n",
-				dts.object, mark, dts.name,
+				dts.object, markstr, dts.name,
 				dtrace_errmsg(dtp, dtrace_errno(dtp)));
 		}
 
@@ -3014,7 +3064,7 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
 
 	} else if (scope != DTRACE_OBJ_EXEC) {
 		xyerror(D_IDENT_UNDEF, "failed to resolve %s%s%s: %s\n",
-		    dnp->dn_string, mark, name,
+		    dnp->dn_string, markstr, name,
 		    dtrace_errmsg(dtp, dtrace_errno(dtp)));
 	} else {
 		xyerror(D_IDENT_UNDEF, "failed to resolve %s: %s\n",
diff --git a/libdtrace/dt_parser.h b/libdtrace/dt_parser.h
index d74d658a..b9149220 100644
--- a/libdtrace/dt_parser.h
+++ b/libdtrace/dt_parser.h
@@ -211,6 +211,7 @@ extern dt_node_t *dt_node_tstring(dt_node_t *, uintmax_t);
 extern dt_node_t *dt_node_link(dt_node_t *, dt_node_t *);
 extern dt_node_t *dt_node_cook(dt_node_t *, uint_t);
 extern void dt_cook_taint_alloca(dt_node_t *, dt_ident_t *, dt_node_t *);
+extern int dt_scope_parse(const char *, const char **, const char **);
 
 extern dt_node_t *dt_node_xalloc(dtrace_hdl_t *, int);
 extern void dt_node_free(dt_node_t *);
diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d
new file mode 100644
index 00000000..2a267567
--- /dev/null
+++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Dotted kernel module scopes lex as a single external symbol
+ * reference.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(foo.bar`baz);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r
new file mode 100644
index 00000000..89a9f9c5
--- /dev/null
+++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d: [D_IDENT_UNDEF] line 17: failed to resolve foo.bar`baz: Module is no longer loaded
diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d
new file mode 100644
index 00000000..6b3dcfda
--- /dev/null
+++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Dotted userspace module scopes lex as a single external symbol
+ * reference.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(foo.bar``baz);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r
new file mode 100644
index 00000000..7734e29f
--- /dev/null
+++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d: [D_IDENT_UNDEF] line 17: failed to resolve foo.bar``baz: Module is no longer loaded
diff --git a/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d b/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d
new file mode 100644
index 00000000..d332191b
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d
@@ -0,0 +1,18 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Kernel symbols cannot be referenced using userspace scoping.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(vmlinux``major_names);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.r b/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.r
new file mode 100644
index 00000000..718b2b31
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d: [D_SYM_BADREF] line 16: kernel module 'vmlinux' symbol 'major_names' may not be referenced as a user symbol
diff --git a/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d b/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d
new file mode 100644
index 00000000..bc7e8b9f
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d
@@ -0,0 +1,20 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: testprobe */
+
+/*
+ * ASSERTION: Userspace symbols cannot be referenced using kernel scoping.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(&testprobe`main);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.r b/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.r
new file mode 100644
index 00000000..87169597
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d: [D_SYM_BADREF] line 18: user module 'testprobe' symbol 'main' may not be referenced as a kernel symbol
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.d b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.d
new file mode 100644
index 00000000..d7cff89f
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: A bare userspace D scoping operator with an empty identifier is a
+ * syntax error.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(``);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.r b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.r
new file mode 100644
index 00000000..8e9cd1ff
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.d: [D_SYNTAX] line 17: syntax error near "``"
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.d b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.d
new file mode 100644
index 00000000..44b4f60e
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: A bare D scoping operator with an empty identifier is a syntax
+ * error.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(`);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.r b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.r
new file mode 100644
index 00000000..bbba5fe8
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.d: [D_SYNTAX] line 17: syntax error near "`"
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.d b/test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.d
new file mode 100644
index 00000000..5ead7b3e
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: A dotted userspace D scoping operator with an empty identifier is
+ * a syntax error.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(foo.bar``);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.r b/test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.r
new file mode 100644
index 00000000..b07c07b1
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.d: [D_SYNTAX] line 17: syntax error near "bar``"
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-user.d b/test/unittest/lexer/err.D_SYNTAX.scope-empty-user.d
new file mode 100644
index 00000000..d3a927d7
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-user.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: A userspace D scoping operator with an empty identifier is a
+ * syntax error.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(bar``);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-user.r b/test/unittest/lexer/err.D_SYNTAX.scope-empty-user.r
new file mode 100644
index 00000000..dbf319ea
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-user.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-empty-user.d: [D_SYNTAX] line 17: syntax error near "bar``"
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty.d b/test/unittest/lexer/err.D_SYNTAX.scope-empty.d
new file mode 100644
index 00000000..e32b3812
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty.d
@@ -0,0 +1,18 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: A D scoping operator with an empty identifier is a syntax error.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(foo`);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty.r b/test/unittest/lexer/err.D_SYNTAX.scope-empty.r
new file mode 100644
index 00000000..d78728b2
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-empty.d: [D_SYNTAX] line 16: syntax error near "foo`"
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-multiple.d b/test/unittest/lexer/err.D_SYNTAX.scope-multiple.d
new file mode 100644
index 00000000..5e236c45
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-multiple.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Multiple D scoping operators in one identifier are a syntax
+ * error.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(foo``bar``baz);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-multiple.r b/test/unittest/lexer/err.D_SYNTAX.scope-multiple.r
new file mode 100644
index 00000000..cefc56ad
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-multiple.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-multiple.d: [D_SYNTAX] line 17: syntax error near "foo``bar``baz"
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-triple.d b/test/unittest/lexer/err.D_SYNTAX.scope-triple.d
new file mode 100644
index 00000000..41f7391c
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-triple.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: More than two consecutive D scoping operator characters are a
+ * syntax error.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(foo```bar);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-triple.r b/test/unittest/lexer/err.D_SYNTAX.scope-triple.r
new file mode 100644
index 00000000..4474c502
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-triple.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-triple.d: [D_SYNTAX] line 17: syntax error near "foo```bar"
diff --git a/test/unittest/lexer/tst.scope-user-explicit.d b/test/unittest/lexer/tst.scope-user-explicit.d
new file mode 100644
index 00000000..2d649f6f
--- /dev/null
+++ b/test/unittest/lexer/tst.scope-user-explicit.d
@@ -0,0 +1,22 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: testprobe */
+/* @@runtest-opts: -e */
+
+/*
+ * ASSERTION: Explicit userspace module scoping resolves as a userspace
+ * external symbol reference.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(&testprobe``main);
+	exit(0);
+}
diff --git a/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d b/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d
index 56c93d43..4de9322d 100644
--- a/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d
+++ b/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d
@@ -16,6 +16,6 @@
 
 BEGIN
 {
-	printf("sizeof(`): %d\n", sizeof(`));
+	printf("sizeof(`unknown_symbol): %d\n", sizeof(`unknown_symbol));
 	exit(0);
 }
diff --git a/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.r b/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.r
index 462469b7..0f46ad1e 100644
--- a/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.r
+++ b/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d: [D_IDENT_UNDEF] line 19: failed to resolve `: Unknown symbol name
+dtrace: failed to compile script test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d: [D_IDENT_UNDEF] line 19: failed to resolve `unknown_symbol: Unknown symbol name
diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d
new file mode 100644
index 00000000..51068c20
--- /dev/null
+++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d
@@ -0,0 +1,16 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: D scoping operators are not permitted in enumerator names.
+ */
+
+#pragma D option quiet
+
+enum scopeop_enum {
+	foo`bar
+};
diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r
new file mode 100644
index 00000000..06ef912b
--- /dev/null
+++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d: [D_DECL_SCOPE] line 15: D scoping operator may not be used in an enumerator name (foo`bar)
diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.d b/test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.d
new file mode 100644
index 00000000..6042e208
--- /dev/null
+++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: D scoping operators are not permitted in declaration names.
+ */
+
+#pragma D option quiet
+
+int foo`bar;
+
+BEGIN
+{
+	exit(1);
+}
diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.r b/test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.r
new file mode 100644
index 00000000..7b2e6797
--- /dev/null
+++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.d: [D_DECL_SCOPE] line 14: D scoping operator may not be used in a declaration name (foo`bar)
diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-member.d b/test/unittest/types/err.D_DECL_SCOPE.scopeop-member.d
new file mode 100644
index 00000000..5fe36a00
--- /dev/null
+++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-member.d
@@ -0,0 +1,16 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: D scoping operators are not permitted in struct member names.
+ */
+
+#pragma D option quiet
+
+struct scopeop_struct {
+	int foo`bar;
+};
diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-member.r b/test/unittest/types/err.D_DECL_SCOPE.scopeop-member.r
new file mode 100644
index 00000000..978ef79d
--- /dev/null
+++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-member.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/types/err.D_DECL_SCOPE.scopeop-member.d: [D_DECL_SCOPE] line 15: D scoping operator may not be used in a member name (foo`bar)
-- 
2.52.0

