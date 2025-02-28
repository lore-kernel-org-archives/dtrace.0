Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FDA19149F
	for <dtrace@lists.linux.dev>; Fri, 28 Feb 2025 03:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740712536; cv=fail; b=GGjmoM8Xd3Q7N+QiOj31QlKMi+7EHGPxncVhV7SDLm+P13WAZ+Uk74+QMRrkDZ9X/Wn7Fcv1tuF5dWyjB9KAGxrUIW2GRX5dEzXJK/GZqZhJgUI+Hq6Z8hlCpiZMu0emOQugCFmEaH4vMi/C+wMTCo4m630QnvLD/t3y0xQWY8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740712536; c=relaxed/simple;
	bh=MK2vMlSlnZ0Wt+tDJC2tMTuD9g2OZqxY0F+gqq0Gd0M=;
	h=Message-ID:From:Date:To:Subject:Content-Type:MIME-Version; b=ncMw/dHKC5B2Rftk9jMT69XC4pF+pQKEW4628DVEVV+UjlvF72TaCcE3mdXi0KlHRWLviaMRw/LVmK5wImt+ggMmu/VtYK3zjkq7GgIkHQcg8xjdGrhGCJILJeVgWIGKmwtHT8S4GBU3iGFLkYxTPlebInvC4KUhN6cIhBzfAmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SFjq8XdD; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ej8B37wx; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SFjq8XdD";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ej8B37wx"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51S1BubT023182
	for <dtrace@lists.linux.dev>; Fri, 28 Feb 2025 03:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=9d2+T4OLa5Hg/GW0HhEYci9USKg0kyjInTOUZMffeCY=; b=
	SFjq8XdDifqFZs13BT8M1OBEtyly0dUBCo03y2VdDB5sk5lAkqZ50eHKEd5yMiCb
	L+sGDBeSzy84DyuYnuEjmmmn1xPM0TP9raFdESvse8Hk+RucCNyh1c2fuz6b5AoC
	LAt60x+sA9VndyDt8L3wigMl7d8DSy7lyh+VNYP8/8mMCFYMHlg6aSmZnnDqjDC+
	Y1L+ZG05mbuu9CfiX9cwZw+6BSghMpnNBxmexk9v5pxFtskQVrMFNCWJNb8CYjZX
	F3fGho0zGcxz2u74DlzpflMXoHmomObfrC3/z4fLtFMDkfwtecSwjJzZ/OMEfATg
	gLMt9YhGR3rV99aOguF4Vg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 451psdmqf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Feb 2025 03:15:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51S2eWJw012589
	for <dtrace@lists.linux.dev>; Fri, 28 Feb 2025 03:15:25 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2042.outbound.protection.outlook.com [104.47.58.42])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44y51ea1y2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Feb 2025 03:15:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=joXEIxAdn8AAOWaIDrTEdz5Zy4NRKvGzeBsVTu58Y0O70k6pdiHv2ZG7hg98tVzLL0OwNetpoJhTC4BY3z8BR+fl7Mkz1/Z+cvg2RMBbKCf0RmsT1bP9ItaD5U3mIPl4N9H0TBNzoed6jBRnVbGYq8Pho1NNEMrzhWJhaYhJrjdNQQX/+gSRq2UH424KdXiHZVDcEKRtLt2e187wVrQ0R1s+sxLIjtI9+BSm5sPeXrCvUIm68FYjh9X8tbCYQwwartBdQRs8l4ZWzxo8yx+hE70Gv3KEzRk27TsKnB5cVClmwvvMOMJ7L//58/g1swnEwWdPI8FN3d5Hk/qKRPRLgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9d2+T4OLa5Hg/GW0HhEYci9USKg0kyjInTOUZMffeCY=;
 b=E2latXJqA9RcZ2oTKusNSeUw2+g1YcFHLHSFx+6U+ZI3KDemFUM3e0WScBKSzXCU7yrJYZL53wNBL5QIgt5dofh66353/brR+PUGBregIOyVH0hOJ7/NBfoqTVY0T87ZcjSRBHShel5hK/o8KYkClOOFZ31slaqhIq043DeYY+QQVntMPBWvJhzKEDnO4U3axdh8GtxcCbjr1jIC61u65cTjNljkQfEOh6sKj2W1F6/q8sa+lXPwhAjkCnv0JCqldoRdGl0CcLhNOzJjjt/Vz2ODmjHg54gqYfrzpknv0ks7LGviw8+Eh/sa/FWlJhhZXCuB5sVhPcoiAY1MRlKqRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9d2+T4OLa5Hg/GW0HhEYci9USKg0kyjInTOUZMffeCY=;
 b=ej8B37wxrXKW7Mq7tsVGzHT9TM9/LMt9r8LfRDQOADqgITxWYtwlGRaaoEE8rqfHa6Uqwc/bSdQp5E/Eb0hFv9XrnDafpj8AGMecTwS9phE1e690I6yE5dlfRs9Vd9sfnYJmCeoAGEFWVJVY/IeDYyz7kf5N0IK+TrmAoX+QTUg=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SN7PR10MB6617.namprd10.prod.outlook.com (2603:10b6:806:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Fri, 28 Feb
 2025 03:15:23 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8466.020; Fri, 28 Feb 2025
 03:15:22 +0000
Message-ID: <ee42d8054faf64340974d1bb9535c8c3.kris.van.hees@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
Date: Thu, 27 Feb 2025 22:09:59 -0500
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Refactor the versioning handling system
Content-Type: text/plain
X-ClientProxiedBy: BN1PR12CA0020.namprd12.prod.outlook.com
 (2603:10b6:408:e1::25) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SN7PR10MB6617:EE_
X-MS-Office365-Filtering-Correlation-Id: f68bcb26-8a50-4648-2a42-08dd57a622e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gPz0oj1PJ/FBsByz1tpngaVvxhdfuyvmjZjIpGtVIx3t2QKYXUSgMZPmThE1?=
 =?us-ascii?Q?B6GhLCLAFX80/9+NJD1YcfHTUDIxjIYnyfLbnmE56wxoM03eELtaueqvcjv2?=
 =?us-ascii?Q?gNwKvIGrqo6wtZYTnCnRmEu3/jvmCzm6Of5ZGewTJfpFsmyQJcS3yYxEXi6a?=
 =?us-ascii?Q?APuMAB8+TdJLpaXVVq/cRTcjpqm5PUHUPFwrYNXg85hIEWIh9duHkea+Yp6Y?=
 =?us-ascii?Q?0RdSPlQ57HrbriZHG5M1J5bAqH1Z2JA1EqJ0XhDCB6Rqa27d/j1Z3Oge8v/J?=
 =?us-ascii?Q?OQltxhyfIGyHoXAmmcO3vAvDqcHqOqz0ltoW1bKqbykXouhtM/0CLouPOe2E?=
 =?us-ascii?Q?EFUeiXRO+FAqOFK68Wuixg6u/6s4nFcyxg0vrnw/8QtNUhXrfttaHEC2YCiI?=
 =?us-ascii?Q?v5rQ6+zCICptwTDCVFjFtL4p4eQpu00mSAqq13WUQNex7zH9a9UI0PQYUkei?=
 =?us-ascii?Q?zPhoyWw8tZwYgBtO58XnU1rbSpAx38ybuEcaZJPV4B0uT12F+og5QZJnAgFB?=
 =?us-ascii?Q?W9rB1LeuXwqPdpEyY0uCf+ZReqReIk34xhbOzyJILSeo9etxznvksjcTR7Ly?=
 =?us-ascii?Q?EL6OjJ65hcVOBdawipjC1AvxWwy4mW5tqVH0zrRL1DcDBK9bVnAq9g2TQACH?=
 =?us-ascii?Q?ZzrnFQXfqrWP6D8MfcpyE6dYECct73qGQPFq81JHpNixFJycy2pKpmanapxT?=
 =?us-ascii?Q?GovqKz7rMq4r6/e4p4l67wfgQY4hlElLOqr7kJ36JBJnxYoMcIJQ1IFWFKsD?=
 =?us-ascii?Q?ifJ3xO1BSpxje1rrT91UPdERRIvaI4d8zOowVE8DzGMNb0mFtdfrV/EQo+e9?=
 =?us-ascii?Q?c2CnCUdavMrKVonxvZqGC0lJCAkupk7pWfrDdhPsRMx1h1Egnug3vazEiwm7?=
 =?us-ascii?Q?e5o9p59uUuk6s68X9b/ae49W4P94e3Pl30BwNq5j3TCpxZhxTVaugkK7it0i?=
 =?us-ascii?Q?Nwc2dR1XVuGkPNPHgstpr3hHIR3Ffa/nEMaaG+HtZCoD9uqHLQ9OhhpA/dxo?=
 =?us-ascii?Q?aDivS4u75p/VlIqxGwMn1WXNEvRJl8MKfSeBDLBtkCwchpo/aIy1CycB9d6B?=
 =?us-ascii?Q?byGCUP0PB8ZTKIXJCMmV+o1YIebZomBlNis+sFFHUXExg752ovTXEmS9/E7m?=
 =?us-ascii?Q?g2Pe99NBnYeyLbAEWduhJaOunwmbYGP9VUyBcWsUlAsRwGv8UIzLp7ETZFzy?=
 =?us-ascii?Q?j1H5lRbm0DVbOn7HqM5LyGFVeLk9YDxmuk6iHsEbueVQuEa9HB5LzfX4CF/G?=
 =?us-ascii?Q?0V/LUGKZvYRI+99cH8DNX5KKuCy8LdEuEJQXm/JCXyJ5tc3Uy1kTL5kjB/um?=
 =?us-ascii?Q?zHGp7Pfc2oZzFVtj3N1qNIG6VLbCrsLIMlzNytPyIbHVxA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YA5ifUKzNxwiJrzsVHEt6hfeKRVt3t8LQVrn/YVrMOuNM3IsADeIL6UFN9NE?=
 =?us-ascii?Q?Ya61d/T5SM3PjtkjA+UntH4oUFCpLp9MEuY8vAbeNbZpR8AftaU9yP6UHzaq?=
 =?us-ascii?Q?6MK9mw1rADYBjl8lifaQ5GiyzSrIp9PYN1rjNXhVLHn+SRNbQxZeqOPf3Aal?=
 =?us-ascii?Q?vg9CRBs/FH/mijo7cZgjXbs+b/J8MVSBPy3s5nkyywcwHrK32uiqEIiBZECB?=
 =?us-ascii?Q?RyAjAD7Nyr00/VRcXmH6Qx1TUWJzidGNF57TmfOFav/JvfoyG13HgMGZ7hek?=
 =?us-ascii?Q?TPeyYFEQ5d6PCHGx7n1bNUGF8/KLXZDK/eP+5b6UFt1WW7NO9kxa3vel1seN?=
 =?us-ascii?Q?ZAosK8168kIsDZXWs55TDpLeYNY3ZTBt9CI6qlIy2kSCD6Scv9ZZmxhUDs0T?=
 =?us-ascii?Q?TkDwlMkruDXBxsYgpaF7dppx1HRNvXTRmkPMi2jOrNHjP4maxKJ/1w6XDgus?=
 =?us-ascii?Q?SsSQViguV2beNas5bGRXWnlvl+scK6xmfizC0Dc8jBWgSlbYV/+glNvhV5Os?=
 =?us-ascii?Q?BdDLTIubJTLtkvaTYpsO11FdW1WlG1YbW57vJKNR0vmYnykIXON+tcJyOJ8l?=
 =?us-ascii?Q?jtf0OtFvezxvQxnqqobgBmeGIOeoeNXQfUHyli987MMC8Wm3uce8vioi6ZAW?=
 =?us-ascii?Q?l+SDg17IHDqr/vO0auhuyPZHefHHRx2PcqNQOIiawjAbJFS7UKGIM/O+PQ6b?=
 =?us-ascii?Q?wAGWcCjrSEYoMQUixzave6Mr1Q1R5JFdnxbLYS5D3Y9PtFyaJz5X3sgnn3cJ?=
 =?us-ascii?Q?W/asnqdIuxF/Dsyp1xaaP7emal2HbFJbZSE2HAhZtTy9g9Jel2cLjVHHB7Dm?=
 =?us-ascii?Q?2MCx17Os4jJj/2vGOzUfJtCOSqzbgj+/ljMntoh0qRq1yIDOHLf6BUZlZ32s?=
 =?us-ascii?Q?+uisr6ctWSd9McHhkwjTGjIhFO3LZYU8olqqRWa5p0MKhed0zSEYT/CkgmWb?=
 =?us-ascii?Q?zQ3MxP3w3q6/f8fpLgMI3j+Cg/Lpi03cHg/gfOaYLb5H1GxlAX3I5lWAZEyf?=
 =?us-ascii?Q?ce8qoKojZjoTBrIufywyysLx+z8DAVNORv3rqONTgzzM3aa7lswYzbWm0+fe?=
 =?us-ascii?Q?DmRR4j7fuxvu0nQVX17T7CFlivS1Q/EnWXc+2oPeBNZRnoWYg6gYfIw4mAa6?=
 =?us-ascii?Q?IuEWntwiZnk3bpvPPhgiDKGw3Wy4+29Sv4NJ+r8GTsyQ0RC+CzGv1w4mNTgH?=
 =?us-ascii?Q?3vxVzSR7oUXeUEKoA8BnrL9wu8cLn1hEOBM6FFcLmBn4EXur5QSvIr/D9k1J?=
 =?us-ascii?Q?46RJDhGzY9Q3isZztbBW6stKEYe1mPZ6g3AkPuCh6uztL8/DGRQ0yT5p6HoB?=
 =?us-ascii?Q?gd0p3J6Tzq7EPcSt26A8GHgDJvfaRvvqrFjQUZME9A7VkfOTeZDz9Y8hjz1e?=
 =?us-ascii?Q?BbdXZgyRLXW6DHsUK1NFngWOeRQvAD260ss7cYWVE7jjYXzuLiZtJIWOcfu+?=
 =?us-ascii?Q?OvKd8dFvR6PEWtgXniu7w21mmmh3QMDyjoGG+C9UTF7iTdutqroUZGvDiVg4?=
 =?us-ascii?Q?3idIeoGlLkMpVeM7Ir8T1+Fh2gy9gN/0GpET6efQ2zBsKqIgPan4CMScz0m6?=
 =?us-ascii?Q?UKvKUGdC2SikwbwjflNf/vWqLe61hqd9VRXVexPDXSA/+L+sd000k3zLlzl9?=
 =?us-ascii?Q?EBgw6ZWZnjLFyCM7l+9WiXA=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	t3WlrXCxKtHXamdF/zcHDVhWnVI7Rz0iQeBOB5YfbSF9Yqxt1LGALVRjHZsZNeYZhYSIv8qDGlUee3H/ZQXvuPPGHvB9sl4LXFaEabBYJbsfSVuKy3FdaC5Fv6LKnxSIYvatO2ojlsZRS2pKDjuoo/mw6dXVWKa3jmxcaBiHEn076IRYuBesysKO2V6+GXUw5rzTJhfcKFFpFw4v76UVn7uPe6DVMXH5WXVAFLRAP49ZK1y1OZ6tePloin48uKjKkVGqYsiZgprXFz0muut2c/Ndff0VE/UgY1VMXH+RJq/SnGk3AWC432ve1Z5VvRUAs7yEjeNq4F4BUdn0AhGA4fB9AO24+5Lyk37WIzgm2Nuw34EVRh4p7xuUMNGWpgkIwwBImUWJOH76WB6+VyMsd24q9NKFScbmXzR6KjyB0/4dmr0b93Py6NyMdyMkUy/kmL/AxuFHWlsyeM2z/cWpuA5EjS5rb7YxUM29bH6ZnI8b3gX1o22LHs4kpBpA5+5MmIZwRMsQm3GNsGuzs5nt53ZTBlD5gKZR91IN7GidEmwm5TKgYTsjXXSLmhw07wUGamPWipY9KUPOYdhglJUHnV7JYhJnpShePpi6QLm2098=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f68bcb26-8a50-4648-2a42-08dd57a622e6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 03:15:22.0900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HhI193x5+xdHcXp9SrKin77qZ8gnG1sUwSG0zYRwHtZ/Pjndd1CTUqEPS6HrrH7kVnjnxroIHsaDEibyg8t39x3o5oDQi4qj9kcUfl4yVZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6617
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_08,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 mlxscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2502280021
X-Proofpoint-GUID: -brL_m85viuGE_yaNmQ8uKJz3-yevVzi
X-Proofpoint-ORIG-GUID: -brL_m85viuGE_yaNmQ8uKJz3-yevVzi

DTrace was handlings versioning data in multiple locations, causing
common mistakes in not consistently updating versions in allplaces.
By consolidating all versioning data in dt_version.h a single file
need to be updated (as far as the source tree is concerned) when a
new version is introduced.

For building, the GNUmakefile and dtrace.spec files will also need
to be updated with the new version number.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/Build        |   1 +
 libdtrace/dt_impl.h    |  48 ++++++++-----------
 libdtrace/dt_open.c    |  19 --------
 libdtrace/dt_subr.c    |  80 --------------------------------
 libdtrace/dt_version.c |  93 +++++++++++++++++++++++++++++++++++++
 libdtrace/dt_version.h | 102 ++++++++++++++++++++++++++++-------------
 6 files changed, 181 insertions(+), 162 deletions(-)
 create mode 100644 libdtrace/dt_version.c

diff --git a/libdtrace/Build b/libdtrace/Build
index 51e0f078..57804f55 100644
--- a/libdtrace/Build
+++ b/libdtrace/Build
@@ -70,6 +70,7 @@ libdtrace-build_SOURCES = dt_aggregate.c \
 			  dt_strtab.c \
 			  dt_subr.c \
 			  dt_symtab.c \
+			  dt_version.c \
 			  dt_work.c \
 			  dt_xlator.c
 
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 68fb8ec5..60e9b0c9 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -256,8 +256,6 @@ typedef struct dt_percpu_drops {
  */
 #define DT_MAX_NSPECS 16		/* sanity upper bound on speculations */
 
-typedef uint32_t dt_version_t;		/* encoded version (see below) */
-
 struct dtrace_hdl {
 	const dtrace_vector_t *dt_vector; /* library vector, if vectored open */
 	void *dt_varg;	/* vector argument, if vectored open */
@@ -645,6 +643,24 @@ enum {
 	EDT_PRINT,		/* missing or corrupt print() record */
 };
 
+/*
+ * Stability definitions
+ *
+ * These #defines are used in the tables of identifiers below to fill in the
+ * attribute fields associated with each identifier.  The DT_ATTR_* macros are
+ * a convenience to permit more concise declarations of common attributes such
+ * as Stable/Stable/Common.
+ *
+ * Refer to the Solaris Dynamic Tracing Guide Stability chapter respectively
+ * for an explanation of these DTrace features and their values.
+ */
+#define DT_ATTR_STABCMN { DTRACE_STABILITY_STABLE, \
+	DTRACE_STABILITY_STABLE, DTRACE_CLASS_COMMON }
+
+#define DT_ATTR_EVOLCMN { DTRACE_STABILITY_EVOLVING, \
+	DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON \
+}
+
 /*
  * Interfaces for parsing and comparing DTrace attribute tuples, which describe
  * stability and architectural binding information.
@@ -654,31 +670,6 @@ extern dtrace_attribute_t dt_attr_max(dtrace_attribute_t, dtrace_attribute_t);
 extern char *dt_attr_str(dtrace_attribute_t, char *, size_t);
 extern int dt_attr_cmp(dtrace_attribute_t, dtrace_attribute_t);
 
-/*
- * Interfaces for parsing and handling DTrace version strings.  Version binding
- * is a feature of the D compiler that is handled completely independently of
- * the DTrace kernel infrastructure, so the definitions are here in libdtrace.
- * Version strings are compiled into an encoded uint32_t which can be compared
- * using C comparison operators.  Version definitions are found in dt_open.c.
- */
-#define	DT_VERSION_STRMAX	16	/* enough for "255.4095.4095\0" */
-#define	DT_VERSION_MAJMAX	0xFF	/* maximum major version number */
-#define	DT_VERSION_MINMAX	0xFFF	/* maximum minor version number */
-#define	DT_VERSION_MICMAX	0xFFF	/* maximum micro version number */
-
-#define	DT_VERSION_NUMBER(M, m, u) \
-	((((M) & 0xFF) << 24) | (((m) & 0xFFF) << 12) | ((u) & 0xFFF))
-
-#define	DT_VERSION_MAJOR(v)	(((v) & 0xFF000000) >> 24)
-#define	DT_VERSION_MINOR(v)	(((v) & 0x00FFF000) >> 12)
-#define	DT_VERSION_MICRO(v)	((v) & 0x00000FFF)
-
-extern char *dt_version_num2str(dt_version_t, char *, size_t);
-extern int dt_version_str2num(const char *, dt_version_t *);
-extern int dt_version_defined(dt_version_t);
-
-extern int dt_str2kver(const char *, dt_version_t *);
-
 extern uint32_t dt_gen_hval(const char *, uint32_t, size_t);
 
 /*
@@ -816,9 +807,6 @@ extern const dtrace_attribute_t _dtrace_typattr; /* type ref attributes */
 extern const dtrace_attribute_t _dtrace_prvattr; /* provider attributes */
 extern const dtrace_pattr_t _dtrace_prvdesc;	 /* provider attribute bundle */
 
-extern const dt_version_t _dtrace_versions[];	 /* array of valid versions */
-extern const char *const _dtrace_version;	 /* current version string */
-
 extern int _dtrace_strbuckets;		/* number of hash buckets for strings */
 extern uint_t _dtrace_stkindent;	/* default indent for stack/ustack */
 extern uint_t _dtrace_pidbuckets;	/* number of hash buckets for pids */
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 51c056b2..72c138ce 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -42,25 +42,6 @@
 #include <dt_peb.h>
 #include <dt_pid.h>
 
-const dt_version_t _dtrace_versions[] = {
-	DT_VERS_1_0,	/* D API 1.0.0 (PSARC 2001/466) Solaris 10 FCS */
-	DT_VERS_1_1,	/* D API 1.1.0 Solaris Express 6/05 */
-	DT_VERS_1_2,	/* D API 1.2.0 Solaris 10 Update 1 */
-	DT_VERS_1_2_1,	/* D API 1.2.1 Solaris Express 4/06 */
-	DT_VERS_1_2_2,	/* D API 1.2.2 Solaris Express 6/06 */
-	DT_VERS_1_3,	/* D API 1.3 Solaris Express 10/06 */
-	DT_VERS_1_4,	/* D API 1.4 Solaris Express 2/07 */
-	DT_VERS_1_4_1,	/* D API 1.4.1 Solaris Express 4/07 */
-	DT_VERS_1_5,	/* D API 1.5 Solaris Express 7/07 */
-	DT_VERS_1_6,	/* D API 1.6 */
-	DT_VERS_1_6_1,	/* D API 1.6.1 */
-	DT_VERS_1_6_2,	/* D API 1.6.2 */
-	DT_VERS_1_6_3,	/* D API 1.6.3 */
-	DT_VERS_1_6_4,	/* D API 1.6.4 */
-	DT_VERS_2_0,	/* D API 2.0 */
-	0
-};
-
 /*
  * Table of global identifiers.  This is used to populate the global identifier
  * hash when a new dtrace client open occurs.  For more info see dt_ident.h.
diff --git a/libdtrace/dt_subr.c b/libdtrace/dt_subr.c
index d5dca164..40b66c7d 100644
--- a/libdtrace/dt_subr.c
+++ b/libdtrace/dt_subr.c
@@ -369,58 +369,6 @@ dt_attr_str(dtrace_attribute_t a, char *buf, size_t len)
 	return buf;
 }
 
-char *
-dt_version_num2str(dt_version_t v, char *buf, size_t len)
-{
-	uint_t M = DT_VERSION_MAJOR(v);
-	uint_t m = DT_VERSION_MINOR(v);
-	uint_t u = DT_VERSION_MICRO(v);
-
-	if (u == 0)
-		snprintf(buf, len, "%u.%u", M, m);
-	else
-		snprintf(buf, len, "%u.%u.%u", M, m, u);
-
-	return buf;
-}
-
-int
-dt_version_str2num(const char *s, dt_version_t *vp)
-{
-	int i = 0, n[3] = { 0, 0, 0 };
-	char c;
-
-	while ((c = *s++) != '\0') {
-		if (isdigit(c))
-			n[i] = n[i] * 10 + c - '0';
-		else if (c != '.' || i++ >= sizeof(n) / sizeof(n[0]) - 1)
-			return -1;
-	}
-
-	if (n[0] > DT_VERSION_MAJMAX ||
-	    n[1] > DT_VERSION_MINMAX ||
-	    n[2] > DT_VERSION_MICMAX)
-		return -1;
-
-	if (vp != NULL)
-		*vp = DT_VERSION_NUMBER(n[0], n[1], n[2]);
-
-	return 0;
-}
-
-int
-dt_version_defined(dt_version_t v)
-{
-	int i;
-
-	for (i = 0; _dtrace_versions[i] != 0; i++) {
-		if (_dtrace_versions[i] == v)
-			return 1;
-	}
-
-	return 0;
-}
-
 char *
 dt_cpp_add_arg(dtrace_hdl_t *dtp, const char *str)
 {
@@ -949,34 +897,6 @@ dtrace_uaddr2str(dtrace_hdl_t *dtp, pid_t pid, uint64_t addr, char *str,
 	return dt_string2str(c, str, nbytes);
 }
 
-/*
- * The function converts string representation of kernel version
- * into the dt_version_t type.
- */
-int
-dt_str2kver(const char *kverstr, dt_version_t *vp)
-{
-	int		kv1, kv2, kv3;
-	int		rval;
-
-	rval = sscanf(kverstr, "%d.%d.%d", &kv1, &kv2, &kv3);
-
-	switch (rval) {
-	case 2:
-		kv3 = 0;
-		break;
-	case 3:
-		break;
-	default:
-		return -1;
-	}
-
-	if (vp)
-		*vp = DT_VERSION_NUMBER(kv1, kv2, kv3);
-
-	return 0;
-}
-
 /*
  * Compute a 32-bit hash value for a memory block of given size.
  */
diff --git a/libdtrace/dt_version.c b/libdtrace/dt_version.c
new file mode 100644
index 00000000..e9ac88be
--- /dev/null
+++ b/libdtrace/dt_version.c
@@ -0,0 +1,93 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#include <stdio.h>
+#include <ctype.h>
+
+#include <dt_impl.h>
+
+const dt_version_t _dtrace_versions[] = DTRACE_VERSIONS;
+
+char *
+dt_version_num2str(dt_version_t v, char *buf, size_t len)
+{
+	uint_t	M = DT_VERSION_MAJOR(v);
+	uint_t	m = DT_VERSION_MINOR(v);
+	uint_t	u = DT_VERSION_MICRO(v);
+
+	if (u == 0)
+		snprintf(buf, len, "%u.%u", M, m);
+	else
+		snprintf(buf, len, "%u.%u.%u", M, m, u);
+
+	return buf;
+}
+
+int
+dt_version_str2num(const char *s, dt_version_t *vp)
+{
+	int	i = 0, n[3] = { 0, 0, 0 };
+	char	c;
+
+	while ((c = *s++) != '\0') {
+		if (isdigit(c))
+			n[i] = n[i] * 10 + c - '0';
+		else if (c != '.' || i++ >= ARRAY_SIZE(n) - 1)
+			return -1;
+	}
+
+	if (n[0] > DT_VERSION_MAJMAX ||
+	    n[1] > DT_VERSION_MINMAX ||
+	    n[2] > DT_VERSION_MICMAX)
+		return -1;
+
+	if (vp != NULL)
+		*vp = DT_VERSION_NUMBER(n[0], n[1], n[2]);
+
+	return 0;
+}
+
+int
+dt_version_defined(dt_version_t v)
+{
+	int	i;
+
+	for (i = 0; i < ARRAY_SIZE(_dtrace_versions); i++) {
+		if (_dtrace_versions[i] == v)
+			return 1;
+	}
+
+	return 0;
+}
+
+/*
+ * Convert a string representation of a kernel version string into the
+ * a dt_version_t value.
+ */
+int
+dt_str2kver(const char *kverstr, dt_version_t *vp)
+{
+	int	kv1, kv2, kv3;
+	int	rval;
+
+	rval = sscanf(kverstr, "%d.%d.%d", &kv1, &kv2, &kv3);
+
+	switch (rval) {
+	case 2:
+		kv3 = 0;
+		break;
+	case 3:
+		break;
+	default:
+		return -1;
+	}
+
+	if (vp)
+		*vp = DT_VERSION_NUMBER(kv1, kv2, kv3);
+
+	return 0;
+}
diff --git a/libdtrace/dt_version.h b/libdtrace/dt_version.h
index 3fd1b3d1..967e22cc 100644
--- a/libdtrace/dt_version.h
+++ b/libdtrace/dt_version.h
@@ -15,24 +15,6 @@ extern "C" {
 #include <dt_ident.h>
 #include <dt_git_version.h>
 
-/*
- * Stability definitions
- *
- * These #defines are used in the tables of identifiers below to fill in the
- * attribute fields associated with each identifier.  The DT_ATTR_* macros are
- * a convenience to permit more concise declarations of common attributes such
- * as Stable/Stable/Common.
- *
- * Refer to the Solaris Dynamic Tracing Guide Stability chapter respectively
- * for an explanation of these DTrace features and their values.
- */
-#define DT_ATTR_STABCMN { DTRACE_STABILITY_STABLE, \
-	DTRACE_STABILITY_STABLE, DTRACE_CLASS_COMMON }
-
-#define DT_ATTR_EVOLCMN { DTRACE_STABILITY_EVOLVING, \
-	DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON \
-}
-
 /*
  * Versioning definitions
  *
@@ -46,9 +28,11 @@ extern "C" {
  * Refer to the Solaris Dynamic Tracing Guide Versioning chapter for an
  * explanation of these DTrace features and their values.
  *
- * You must update DT_VERS_LATEST and DT_VERS_STRING when adding a new version,
- * and then add the new version to the _dtrace_versions[] array declared in
- * dt_open.c..
+ * When adding a new version:
+ *  - Add a new DT_VERS_* macro
+ *  - Add the new DT_VERS_* macro at the end of the DTRACE_VERSIONS macro
+ *  - Set DT_VERS_LATEST to the new DT_VERS_*
+ *  - Update DT_VERS_STRING to reflect the new version
  *
  * NOTE: Although the DTrace versioning scheme supports the labeling and
  *       introduction of incompatible changes (e.g. dropping an interface in a
@@ -57,16 +41,18 @@ extern "C" {
  *       we ever need to provide divergent interfaces, this will need work.
  *
  * The version number should be increased for every customer visible release
- * of Solaris. The major number should be incremented when a fundamental
- * change has been made that would affect all consumers, and would reflect
- * sweeping changes to DTrace or the D language. The minor number should be
- * incremented when a change is introduced that could break scripts that had
- * previously worked; for example, adding a new built-in variable could break
- * a script which was already using that identifier. The micro number should
- * be changed when introducing functionality changes or major bug fixes that
- * do not affect backward compatibility -- this is merely to make capabilities
- * easily determined from the version number. Minor bugs do not require any
- * modification to the version number.
+ * of Linux.
+ *  - The major number should be incremented when a fundamental change has been
+ *    made that would affect all consumers, and would reflect sweeping changes
+ *    to DTrace or the D language.
+ *  - The minor number should be incremented when a change is introduced that
+ *    could break scripts that had previously worked; for example, adding a new
+ *    built-in variable could break a script which was already using that
+ *    identifier.
+ *  - The micro number should be changed when introducing functionality changes
+ *    or major bug fixes that do not affect backward compatibility -- this is
+ *    merely to make capabilities easily determined from the version number.
+ *    Minor bugs do not require any modification to the version number.
  */
 #define	DT_VERS_1_0	DT_VERSION_NUMBER(1, 0, 0)
 #define	DT_VERS_1_1	DT_VERSION_NUMBER(1, 1, 0)
@@ -84,9 +70,59 @@ extern "C" {
 #define	DT_VERS_1_6_4	DT_VERSION_NUMBER(1, 6, 4)
 #define	DT_VERS_2_0	DT_VERSION_NUMBER(2, 0, 0)
 #define	DT_VERS_2_0_1	DT_VERSION_NUMBER(2, 0, 1)
+#define	DT_VERS_2_0_2	DT_VERSION_NUMBER(2, 0, 2)
+
+#define DTRACE_VERSIONS	{ \
+	DT_VERS_1_1,	/* D API 1.1.0 Solaris Express 6/05 */ \
+	DT_VERS_1_2,	/* D API 1.2.0 Solaris 10 Update 1 */ \
+	DT_VERS_1_2_1,	/* D API 1.2.1 Solaris Express 4/06 */ \
+	DT_VERS_1_2_2,	/* D API 1.2.2 Solaris Express 6/06 */ \
+	DT_VERS_1_3,	/* D API 1.3 Solaris Express 10/06 */ \
+	DT_VERS_1_4,	/* D API 1.4 Solaris Express 2/07 */ \
+	DT_VERS_1_4_1,	/* D API 1.4.1 Solaris Express 4/07 */ \
+	DT_VERS_1_5,	/* D API 1.5 Solaris Express 7/07 */ \
+	DT_VERS_1_6,	/* D API 1.6 */ \
+	DT_VERS_1_6_1,	/* D API 1.6.1 */ \
+	DT_VERS_1_6_2,	/* D API 1.6.2 */ \
+	DT_VERS_1_6_3,	/* D API 1.6.3 */ \
+	DT_VERS_1_6_4,	/* D API 1.6.4 */ \
+	DT_VERS_2_0,	/* D API 2.0 */ \
+	DT_VERS_2_0_1,	/* D API 2.0.1 */ \
+	DT_VERS_2_0_2,	/* D API 2.0.2 */ \
+}
+
+#define	DT_VERS_LATEST	DT_VERS_2_0_2
+#define	DT_VERS_STRING	"Oracle D 2.0.2"
+
+/*
+ * Interfaces for parsing and handling DTrace version strings.  Version binding
+ * is a feature of the D compiler that is handled completely independently of
+ * the DTrace kernel infrastructure, so the definitions are here in libdtrace.
+ * Version strings are compiled into an encoded uint32_t which can be compared
+ * using C comparison operators.
+ */
+#define	DT_VERSION_STRMAX	16	/* enough for "255.4095.4095\0" */
+#define	DT_VERSION_MAJMAX	0xFF	/* maximum major version number */
+#define	DT_VERSION_MINMAX	0xFFF	/* maximum minor version number */
+#define	DT_VERSION_MICMAX	0xFFF	/* maximum micro version number */
+
+#define	DT_VERSION_NUMBER(M, m, u) \
+	((((M) & 0xFF) << 24) | (((m) & 0xFFF) << 12) | ((u) & 0xFFF))
+
+#define	DT_VERSION_MAJOR(v)	(((v) & 0xFF000000) >> 24)
+#define	DT_VERSION_MINOR(v)	(((v) & 0x00FFF000) >> 12)
+#define	DT_VERSION_MICRO(v)	((v) & 0x00000FFF)
+
+typedef uint32_t dt_version_t;
+
+extern const dt_version_t _dtrace_versions[];
+extern const char *const _dtrace_version;
+
+extern char *dt_version_num2str(dt_version_t, char *, size_t);
+extern int dt_version_str2num(const char *, dt_version_t *);
+extern int dt_version_defined(dt_version_t);
 
-#define	DT_VERS_LATEST	DT_VERS_2_0_1
-#define	DT_VERS_STRING	"Oracle D 2.0"
+extern int dt_str2kver(const char *, dt_version_t *);
 
 #ifdef  __cplusplus
 }
-- 
2.45.2

