Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC39267729
	for <dtrace@lists.linux.dev>; Thu, 11 Dec 2025 23:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765497166; cv=fail; b=dFxpYliDvyaSzHhCyyBvk5DRaK5aApBZRswr6knGeyelg6wtzQDhHuOJe9bGgt83SrBx1OczmbKzVokg7e34x9cxbU3UI3JMJXH09MKQ4CxfJlKYfu6DVgvvjWyZXKha0yLeuAzoInit0ksRfh3M6/fRxazU7PFSV0z6ADOb9IE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765497166; c=relaxed/simple;
	bh=kMxTduIkGoWqgLc6IqGCLyHX94mdL1svWIMUO9QncEM=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=B8BRBxIuVn3l0q/qyEeWlhyEdac6zyNxp+ZxawaihaLWSf8PmbXa9wSr8sAw2NEPE14NrGB8em/f6hE86V2VXvh3gcUxffH89em63D5dU/NATCk9Lh6nahvvakcGY+FaP9zvDxKhRRhrcDfuN3yu16kj3KfRQHbXrke6QreYIbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VBqupEt3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RMe8T0dm; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VBqupEt3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RMe8T0dm"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBKYrkS2157969
	for <dtrace@lists.linux.dev>; Thu, 11 Dec 2025 22:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=l/MVYOynWQ3klLiK/msQjGtU/lBrkiC5Os0vZ4EVOR4=; b=
	VBqupEt3DZ1JiiSKoNobnH5kWE9IeGetP6OXlxmfK3oe0jC8ZPVzedphK1jpFe9h
	BbywIqN3JVI+uztIy9bo9Yx+uRh5MpdCUQemZBrpr0RDzY/8FcwlO5DM38JhXncl
	fIJjKJkI3qIM9v4E4WDOHOGLyxv+cMmh4L+2twND+xnQH7zpas+ClWtpuy9zrjw+
	2zbJLGeUbxijcjbu/1zel37Qw+IJQ9P+vqpZJpfuhpYqVDTm4ShMkebdyquI1yFt
	sP2l5Ln+c5EnAFhrIrbeaXVeTsQ3brwRf/7qWL715cihPwsDd9MYM9eUQvyUdTE3
	6LC6NqqBp4Ma4Dc/10+JNw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aycne2gxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 11 Dec 2025 22:22:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BBKlwAH017572
	for <dtrace@lists.linux.dev>; Thu, 11 Dec 2025 22:22:07 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012025.outbound.protection.outlook.com [40.107.200.25])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4avaxc4y00-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 11 Dec 2025 22:22:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pIweCsDk5qlS1miJEAHejDR10BIX8uHEvNxI0+onlE34MH7YMcnbodfEsDHP2l9glmel0/7JfiHlFff86+xKWZHNunMGa7O0mvs9AAgBaQbdquxBLfu8s/7e/eGskgMay9fu1V9chGimIH/Sr4IdqkrnrgJGYvHCD7gdlQ5qUdbQQQDxKILNCRAvK36hJ8CoKIEvtLjeIRPZxZt4hRCHM0AeMwcd4VTmb0d6nBLqeo7k5yXYYQnE7ElTSHQ7cc7vIoRMnjlr7fHJkhdXI/fyPb6oxQ4keHMOwA4vl4xaFfjgMch2OaAnX6MjVZ0AXUz7P9n7Xmqs1hrhZkLYeaW+Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/MVYOynWQ3klLiK/msQjGtU/lBrkiC5Os0vZ4EVOR4=;
 b=pw590VyVPnwWKO3p7l3rNvbGzz5wixiQSOUN/dCZQRopBr1pkUsDZeCovbU642buoROai3lX+g83qhvhbJNMXxpQ6g53VME9MioJV8Xls3c2OYNO+5WC82ms+m/5xibksUtuPZ4HuocEgtzomXdNXtGMj2Hk0wmSVw7uRX28VGlQXuHZ8lX52n5XPiV3mSlSHsNb0uYR3fzEoZ9zu/qfdlwbg2RLonOYvzwrO11R7PNiWQp1ngWKVSWl2ZZnneKSdOOAexFqUHgXiRgP/bZ2MrIp5I40bga5fwVhsu4JgwtzmsTnSRpOJbAQRRS5T2WSmnhKziXr5khSawvnQfbKkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/MVYOynWQ3klLiK/msQjGtU/lBrkiC5Os0vZ4EVOR4=;
 b=RMe8T0dmFVDwaJGPSRxMB+RCotUqUh8yg9vVs6+yxsHtDw5kvH2AM09RYAU6otWIkIWAWbV4u9EHAJ/1K0ikiz5OETm+QHFwmy5Su4Emzgyi5uQOQO4pr/WYCSM4XUPc0yRfCzsgNZY+fRwr/rS4JFSiZe3wtkIV8NLDgvw4/uQ=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by MN2PR10MB4382.namprd10.prod.outlook.com (2603:10b6:208:1d7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Thu, 11 Dec
 2025 22:22:05 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 22:22:05 +0000
Date: Thu, 11 Dec 2025 17:22:03 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] bpf: allocate the buffers BPF map to fit highest CPU id
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:36e::14) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB7522B465E54B5F7C69B0609EC2A1A@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|MN2PR10MB4382:EE_
X-MS-Office365-Filtering-Correlation-Id: f9c122ac-93b6-4ceb-24ed-08de3903b6c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PhO+zfj7wbin1zxYlvzX7rMQ4af/Gq+2qbit50YjfLEjnW0RTBmtpI3vE6Eb?=
 =?us-ascii?Q?sS5n3ooYkU1Wj5pvDu+oXUYkoKRLH6hw2uiXYXwFDOiGvuTwXUZQ9Ao93mi8?=
 =?us-ascii?Q?vmpbwaM6UHjQBD4LB6dg8EVopxTV4aJBBnO83tHp8zbsbKD20ubWJtyhTIad?=
 =?us-ascii?Q?kwWDkwbyBWUv8r6Q1HSOqSvxPU+ObanoYZu3fsWNuCXWP/J6jpJ/sWOPfuBj?=
 =?us-ascii?Q?v/vE5CBZc/uWWEafOiovTGyXCiZmIV9zVulDK8obQvmsi4sDAAeRopCdtxrD?=
 =?us-ascii?Q?snN+goVkSACaUefbUcCT2kBhWpwbxVyjRq7jKG8kUJrmUEO0RA8Pi6dY+/eJ?=
 =?us-ascii?Q?EIbOAPYh+9kf0JSwB5DwDhGZZKGB5iCX3yPPO0+vVPXhKXN79bLEyEqXhxhV?=
 =?us-ascii?Q?6pHkPDxLb8eQXDk7UywZNCieYiOmVCzG3ObsvpS4VOqjhkPrxKyT1MwSL6MK?=
 =?us-ascii?Q?XTnXKsZPKn2iXLKL8vjIBOz9mqORPp56+YnTt3FZpR3+1NjsowYF1cFFCXwF?=
 =?us-ascii?Q?br5a1AmcGBdj56EkorLDM0mJi9ePcmw+XTZei4zS6VqybXT+v+IttmcFxG0V?=
 =?us-ascii?Q?fWTidaXqtnkgwnIeTIEne2JrxaWNCXQyDrb7cBUhqp/rkh3+ekR4Uj4BgBGk?=
 =?us-ascii?Q?ZA+KMTniYOev6PcOl2SlYVPuNudZmXFddftYxCWF9aSA83T9VEHYYyzmezqJ?=
 =?us-ascii?Q?zK8lwo9xgQ8FRjghf5LmpdQbaNELhGJbBV8WdQR/cAaUPJ7NQnKCl4z37T63?=
 =?us-ascii?Q?7zDYEJGb+seZxqYjRSpmhh2Lm/3qEptClsB/57sCSuqfMfssw4nMs//xywq/?=
 =?us-ascii?Q?0OeXnIPXmce7/aRLfYdN0NsPaMXVJq65sj0/RKAPQpII3wYCbiTOH46JV18Z?=
 =?us-ascii?Q?5JYIdjbcqq/aV0+cG9kccKz7PJ3NbZowicIGLa2MyJnxPTWM/JC/scXLa4XX?=
 =?us-ascii?Q?tlIKi5KkiKTGYa4nPE94g5YzxzsV8wOqdWczPwxm2j9tWLMrxCnO20sXOazr?=
 =?us-ascii?Q?f8bXsTMTqZK2H0OT6aYA8EHI1mVi/rTLfufYM6SmGMgyT1YsEoxVHGlIDJv9?=
 =?us-ascii?Q?s/DjyBKMVHvNUoKo4Blf+XhczK30an98hHtXMuNzNjL20UtJi2DmW6cYMfR8?=
 =?us-ascii?Q?CwP3YRYdgUlF2a5YJzEqQcGBWQTw8fx/tGvcScDINZrvSzd8YEhrT/4pqyUS?=
 =?us-ascii?Q?EwQXhNBY/UoXOCQHb5jxEHNm/ahwKdncoQScYgMONFtiAqRgHug+0+vEPoHf?=
 =?us-ascii?Q?VJAwwBMH2z6HwfgpSrB+YOztWXhm0xbhpQqgam7ky7yYtxmPL0bFO5xEtCbX?=
 =?us-ascii?Q?CvObtpmPlXTAHBPeazR32HK8wS8XIMbTPWRhPTTnUc3S8sPYbFNVgv0zDraG?=
 =?us-ascii?Q?kOM3WDs+TJ61ko098fPaPUTQmCDF0WK9uLiVgNGoeCCQwE3fiprjc0+VAzVt?=
 =?us-ascii?Q?qrrPUQgP+mYftnZ3uW6yxliVRDGXna8o?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L9LLAeOiLWn/DI95jZAOJ3owEc8vRyvhBHEPFFw28aw2/iLgaf1yR+Mv72md?=
 =?us-ascii?Q?XvFYYCoXIDrz7HJHFQ6qPMsaQVgnYBxqjPBcsvi4qdRV8Pti7DEbkAMzf9nD?=
 =?us-ascii?Q?8cVOiqd0eFCsyuJsXuCpX3rhfMbgd9UasXHF4G2ERudtoXdvf4FIaHPC9rrH?=
 =?us-ascii?Q?h/hUO0MnPHfHAD9Bjk0BWZ218TuM1b0gu5yTElHUaznPAi9cBgyFbhK2jKcI?=
 =?us-ascii?Q?ALEvKacze8P4WzIzmSAF1gIgKGKR5Wgfa+4wuptXs8lIuFWPndJU5wmPX1BC?=
 =?us-ascii?Q?3CNLhDsmE+IC5REliHgE1FSLktXqfWtHSvSfaaV3vC6YBX4PRfL8qQEwq7Po?=
 =?us-ascii?Q?IaV9vxLl4LOdjciyj18/79Gzdm2zW1hI4Iru8xDtUOdkdH89rW15kIBScjom?=
 =?us-ascii?Q?NLFLth4JtNrub3sIEm+L0sCzwY2EsXO4QKLXKMcEQhuAuvcxoTcOoMq7+SOR?=
 =?us-ascii?Q?blxAOJj0J4SXLBmWaHRWnU6kP6/zXzrznALkDAEqGbdgflXFIh8WXCM06Nhl?=
 =?us-ascii?Q?8MH9xhyvLEAVSpaMbzJRWcfoZmGtlCMY6kcplg6xrkpwWqAGsI+gLBmya65c?=
 =?us-ascii?Q?3sjYl8wUk8mBntT/8tiPNsoJModjOK+NACLqJ19Mg/Z1kJgdcwL5HapVUbca?=
 =?us-ascii?Q?N9I0whGxw4CJ548HH2PPt0Bd8VoXowotpnYvpN9b0t8eFNJDrTtqioM05h48?=
 =?us-ascii?Q?fndW6WCaQTbecvPSS3FThl8kFwnMjRzZh9HeKlhqAm5QhQjEHaIOR/PphIhp?=
 =?us-ascii?Q?sUHwhU+sUoZJrn+xfBV2L7rfK9o9OUgrbGQ77zaF1HAdaYlty3c4WPWbOMFv?=
 =?us-ascii?Q?J82kjVYchiLPWs0kMUHne14Y0dUdPFDd1vqS31SbCwbrZFjG4akoE82V2Ay4?=
 =?us-ascii?Q?0KrgZH/FeJanwM4Fw0Owu2njayeD3uQCgTuO4aDv4xwaHjYjQ/rrz5vDjzL4?=
 =?us-ascii?Q?TgxJ5t6De8n3b2vDB6jCqsnmBf/nsyaDQPbaPAsjwH2O8nekKNQoJ7i2Ji/G?=
 =?us-ascii?Q?CpX0qF8izrz84ONuCcYPNHzOv4NE4D2ut4fT8W6NEg2B+UtfuzNONspvBkWm?=
 =?us-ascii?Q?KUSTyg4iHBt5BRk5lp2yQ0kKiUp91Ivih1ZeY/FAEe8wdnyxT9FweMmH8bqs?=
 =?us-ascii?Q?HocrrAEaB8YIaO1cPZV6IVsJi/45cP5gslnAWHzu83D8npqUDIFo//bmpBUA?=
 =?us-ascii?Q?NKwWULG17+ETE1v6M1QOs7HZoacBzhChLPLrjxsF+cYWn6D3lFEuKxj9feww?=
 =?us-ascii?Q?Fq/B2/tN9beSIWqQTvvElYGc9olUitezXbwIWs3y6woXnIBAO7D5yXKw5wYR?=
 =?us-ascii?Q?npP04rmgwdmirb6zySpIght9FoaNXYeVMxlQAv2qY3T/Gwer4xRDqSSCiE0g?=
 =?us-ascii?Q?LclaXElYBvSeJswc/3kTCuumZtKFnWcLB8EWeRzJv6cgGT0bd8EIQT64OYGr?=
 =?us-ascii?Q?NNVnMYA8lu7Uf+RYPwA997nPCKRVPplwSFYwTpYwyNm6/p+vcTZZ76DbDH+r?=
 =?us-ascii?Q?aoWuFon6E00dqm1QDVxZ6+k5nxAQBngtlRaemjkmzbe+lyorXZmfAK7c0SOR?=
 =?us-ascii?Q?8LP/r3LuMJAVRRWNC7TaKrj58UAwLJl/WiykW/jViw62ABfBErVkZTLoGBqw?=
 =?us-ascii?Q?5g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JNlJz1qKC5kbs6Rs7lAEftfMByLASoTRzkY8JJ0ALERqe9+D6kU+IY8W0W4hUi7+bTiep3ZJvd8QkNgY7Dd4e4JT4sV/JQRwtJOEEMbZfAr1QOx8SsF/Dr2ejMVIGv9zpqgzQQeX8LcV4EJ+mjG0Ejal7zvsPSZtpm/i6X4nBmkKgmsCzLvyHMM077cSb0/zJ4pII+WIHg2luo6QcCaxsgs4xT3ei7ueUC58I/CEUOzV+Z/c5jWHvUGfIg7lvN8eb/2q/mVvYJJaY9zj36DZLLRzVKndN49LBAeoi8jMACECy52oMJqZWIwB2vfpHQ395lQ26sljV2hN1NSyMaHtxe64Ka42XWP8IlAoCwNiNsLym8U4oMYkbsUdKiZs4eSHS6hWIVjqrnAJd5QP9g2xlhe8cbxejSE1qUGW0i4s1sbXKFUesvFe2oVFBNEhO5R5ksMkcROv/Q2l2n0gKoTKD7AbMRBKpAzXcm72rCwDCFi22633Y2J9cpGV/1geTByS4yiZpqSTWIpflV4LKQNIfrsWa1P24JC8GgIIApIyriVZ3/IgW8+xDJHSmEfMC6pRHKIqf2ikzeTTuZL2QtmbilV9OvIj7d4gEa/cOUMQPyo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c122ac-93b6-4ceb-24ed-08de3903b6c7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 22:22:04.8949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YFey69l17B4RM5Yq1TCblvMikHbeZ7jOyBdte1jajQF+wbsWO79bJFSU/4p3pZPFV2jJUUMb2Z/th4hut+QgCyIpvmHvElYt0n49Yysec9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4382
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_03,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512110180
X-Authority-Analysis: v=2.4 cv=F65at6hN c=1 sm=1 tr=0 ts=693b4410 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=Dv7hwv4hi08CPql2O_oA:9
X-Proofpoint-GUID: weB5XbGo3S86ToXSahMdB8QH_iRd4xE7
X-Proofpoint-ORIG-GUID: weB5XbGo3S86ToXSahMdB8QH_iRd4xE7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDE4MCBTYWx0ZWRfXxQrBlMkyQe61
 mR7ooWMag1i/Bd0gxgUOTK5YvvL//ojbvBPpkuzAjvZRoPjNNMLRpIZ9/mZAwDjLbtrWKMaS8Js
 25dXvDkYvQawJlSIEOi5FxxIjl+s8bX+TO9slQF/DPhE1la4MqPgL9KHVzrBZrYw4WXUymNTwD+
 77eOpw+/4qr0bF4IHTlvBoJGhr2Bb9bELDFc0vmTLYpfmE77+mSQFfoS2bMD1mU1ViLtPjO1dCH
 tvodIOW1AY7j7yCTBth6ar1h0cDJdfnkRFics8mOPpsZ0lhVEoKU1hgYfnXOksORsSPQH3tloxe
 P3VqmcrOXnyWU3CZKPjUUmiR8hrxRk0xm79yM/QBzVG0CdSV+uZYEglmJaU8QVBwkkOuTfeGtQ3
 /dG5ZgxAbRe6en4Tar45ebyMq3iCDw==

Even when less than the possible number of CPUs are online, the 'buffers'
BPF map should be allocated based on the highest possible CPU id because
probe data is written to the bufer that corresponds to a given CPU id,
which could be part of non-sequential CPU id configurations.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_bpf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 0a57b7d2..6568a572 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -755,7 +755,7 @@ gmap_create_buffers(dtrace_hdl_t *dtp)
 {
 	return create_gmap(dtp, "buffers", BPF_MAP_TYPE_PERF_EVENT_ARRAY,
 			   sizeof(uint32_t), sizeof(uint32_t),
-			   dtp->dt_conf.num_online_cpus);
+			   dtp->dt_conf.max_cpuid);
 }
 
 /*
-- 
2.43.5

