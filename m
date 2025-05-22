Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE5533F3
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747937418; cv=fail; b=WE2uuHgFU32fUODqoDWJnSToQ4i3RLr4iB56v7zoHwCK9NdDgGHiXe5acUmO16IHDqRUewHPaqbwxi9TIHl45zFuulnFDNoEbSXbCWEEgm45ZuH3Qj4g4wqwgAsvuxSYTXtSVrQFPzJmQqzdgt7WDP3foaRZCfmi5hrRdJsYR3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747937418; c=relaxed/simple;
	bh=rqgQTMWdG3CEo4QoWR6YsMQCl/XedHy1/p8370na8lw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AOP4gvXsFU/PpowIkSNaTqxDBYGNfBew8oNaHNtPK4x6fwVGBFF1KXcxiMhvg8z5IjmlXHSO+69f12KyBYDaibt9dxLms7pmJ8U8/eJBthip3kN7IHx0+MqCt8sgwtllf4PfaU7pNQz0xKe40NVEYhjl7pJDjzlE/MmUH1XEETo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bqWC4T5J; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fq1whRIh; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bqWC4T5J";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fq1whRIh"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MI77sR019760
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=SF4ST01mrh/nbjbmra
	i2PGYspx1RWC/kTMMkUw9s8a4=; b=bqWC4T5J2w20Bo1jBlbxZSpO+cxfj2TZ3d
	wKgVa66TGmWbh/w5hUx79GehnYLQTe7u68jINriXNufFZJNaKhPHw5stZWB1yO8s
	HU0Bd3xvmDF8a6prary/v8WQv7MbW1dTbWo1pdWjt1mN6x5OaRTWIpQd6owg9zFZ
	uw7ARGFSWu+JXtOJCkYaEt/38MCtTxcZHYZTmI5EaMB2wQFVdUwLxq4CnYMgHzGX
	NP+ekWfMLj62uc+PlmRLy8Y2/ckPAvEQYEm5GhL9wLCkTrAjZV/dUVHk7huUo7TX
	lIzSb4+my1q9yE+DmndSyyg86qWj2yM4wnXaJ37+gKK92EGRimfw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46t8x0006r-16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:10:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54MHYwgj033586
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:02:00 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46rweq0eyp-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:02:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PD5boITzEYDSB+4I6a6rJa3tstxDb+F6gIS4Wi/hzbkFOxtXUBZxRurSIihK7BRL0N2RJa+Rpc7bHb4UHMNXAjvJWjzwvdeyefqSOZm3qLxKpH9Yce1c6fB+yWpEnWte39qKSTnHZhkuVPgGcyw4L0wYwg8/HjQ/7NlfRDEIh/mjLgN4Fqd2edY0F8cDV6Kr53BNbMelZApfVmOx5ydEChQZgZCfrUiudHeHmB2MIiDyBT2+qnnS/V9DZjlPmhGCWlzVLer0Sr32t1bHzWU1zQ/zDt8jyleEWMNzb+VvElsnNUl4AuLMSlK5VCS5WH8Jpwruv0qPV9b17iTESotOpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SF4ST01mrh/nbjbmrai2PGYspx1RWC/kTMMkUw9s8a4=;
 b=OGn+AhnKI+YM4Uk7IsgrBosMq95EzaQBrNol49xFhCe3l1gapfKyvBSOMxkwa8sko7dmcsMeSre4zCOAyqS7GOR+GbhwgUpmKeOtBjX0L8PX4SvwbaNebwJByJo9EDibzcrqKgkfquS/MJByPVbd0Z37L8/edEvx7twuKatxVwezAuERrcJDS2QOFRSAVcUFj1noWlrSnvkgV5kKQxykeXeUtH1cr8yxsMHUjRCRBfrR3igW+v9+1VgZnHMr38AmCB+omStPCr0GclHP1EdxOPSTuo9sytM912NYc4jpzrjcGYrNZN58hfEYk3HCei86QABldMDH1q7FMgXCFsHI8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SF4ST01mrh/nbjbmrai2PGYspx1RWC/kTMMkUw9s8a4=;
 b=fq1whRIhoyGj3itSt3j7i28At1FPegSOw+yRg2kOPLzoVJ4FcuhoRy63dc1G/yTwp7s6tZwxc/Daj17RpuEVcXpb2EI0dnRnmbof2ytk97Yht3Za94heWYKPwaGUVZqLYIz17OlLxxpEAfHowe+v1DDrKmv4HSt0Hj36SSUpXE0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB5120.namprd10.prod.outlook.com (2603:10b6:5:3a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 18:01:56 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8722.027; Thu, 22 May 2025
 18:01:55 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 11/14] Test: caller and stackdepth tests for proc provider
Date: Thu, 22 May 2025 14:01:15 -0400
Message-Id: <20250522180118.27343-11-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250522180118.27343-1-eugene.loh@oracle.com>
References: <20250522180118.27343-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BN0PR04CA0141.namprd04.prod.outlook.com
 (2603:10b6:408:ed::26) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB5120:EE_
X-MS-Office365-Filtering-Correlation-Id: 927c989f-9853-4d97-bff6-08dd995abd0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Go9mP4KDZ0l7ZxM8pDP+XHDljAX1dcfoUV+lxWL1FKQPN95FzNoVCz3ImSsn?=
 =?us-ascii?Q?i+wOp/rDl52g1gMFJNavSY31m54Jf7cBzcqUJ5GpHEkj2fwwPdYlfRVCGX75?=
 =?us-ascii?Q?WFnfoXueKFqukB7/ZDUJibvT1uLrTO2camDyrougLW5qL5V2HTFB/xgenMgb?=
 =?us-ascii?Q?vi6huFZdITDcfhOwjUSUCZweBYHak1XAM9tKXoMesjZM8lcL1MObSkCYloXx?=
 =?us-ascii?Q?yIfpeJtOkjeyFwmJGEE3bDVhIRF+j/OMY32lqQBkJ8QyPxck3P7fpV4HSghL?=
 =?us-ascii?Q?pHwYK8nZKKzZSjJvuBfQhrBlDlw5W6blnBRrhDSmHve2dTRskKy8QhXAQo59?=
 =?us-ascii?Q?wwSPxybTQmB8T0rmtL94qTdeot3kheZohSkYeeMYj0TOh6SbPZbyex7Vee80?=
 =?us-ascii?Q?Lo+IYu4izlaK7Yg96ltELwNl9VzVXS6kGRonkuEuO/X+u7QhMDcwV5Ux+PPf?=
 =?us-ascii?Q?dxYSQ6U52mH98eTjZGu0lcX2Nj4rZulDb3RfuOkPb4d7atBustF1AtXmLwVv?=
 =?us-ascii?Q?2jGexmgULLKDQMU6SvMiCh0iJ9g5ssgRr+o3AcKZNC//FHBswc8zoawT4m7H?=
 =?us-ascii?Q?aJWGrkIGtkjPEo360HPSnWzreGEpmulsxIbg4WM/PsyJ/CmJkRmh8Wt/frjh?=
 =?us-ascii?Q?87kmZys6CogN8pP74bZG+38r49/ZqFltGgV2/RrebRJngm6vq8/Jb+OE8v7S?=
 =?us-ascii?Q?/6y5ENCCzUNwCsBGbZMApAvns1TbDUGd7ZPv+BEPg8pmpbkj6GOW/ICRjKnd?=
 =?us-ascii?Q?v49gYojfde9ZdbaIqcCaeEE+r4AIiHb4QPmEnpKgAxlWjb33jSRIq0/iq6RF?=
 =?us-ascii?Q?YgLQwkkZsPohkOEU95jw8ZjW2SQVPDbnYsPmsYgGVc49yZoOfxdVE9gTJTbU?=
 =?us-ascii?Q?pSalhxfOywG5IGykCMgoqP7ta01q0EjvycbXbJPfXAcULRJoAXftxep56IVo?=
 =?us-ascii?Q?N7nM3eiLksq54An7vluI1Hf1N1ZUI/zuow/n0UVxhdPoJqxPYkTORqNJEPdM?=
 =?us-ascii?Q?0HNoXqEc7vPU1i1dgeVVmK6cWIl3+AEZDrin0Ego4eANcWgmaROiwQmesR+X?=
 =?us-ascii?Q?u6hnL96drczAG8Lbz+ii8kK5PVloeDwkFBFBqzFfxhmKvdB2x4aSiWBnj9Pm?=
 =?us-ascii?Q?ZyP9T8Kg8ViO26xxBSqFpwyMzpiDSanETBkB8JZyeBv73Yihv2E7mRyiUqre?=
 =?us-ascii?Q?KzB99hP4wGklNGxYSVVNZ2CnIUj9kTsQldCubEAAJvQDaWmu9KM7nKjx5gJs?=
 =?us-ascii?Q?cE1qZkiutT33puU4/CoUNSNnoN3jhT6SWAeomWQY/KN6tLhvpEdvvNxoPhL1?=
 =?us-ascii?Q?HqL3Xr9hp5GExcdhukaglZsEk6BeWX5BPPlMEyKZJFb4NS130p+GhVMfYx7V?=
 =?us-ascii?Q?FDYrfi7HbV0CccZZxQllUEPUXvvP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qs9wYmeZle/D3Wf77EIemWX492ZqPS/ItroXWRZze+WMMDF0ehFdNxun26df?=
 =?us-ascii?Q?el9tW9wJsjbNZdgzS8HnIdi17Zowmevs4EazABjjFWgWfNKhsEdWyH+vEQid?=
 =?us-ascii?Q?ioAfu+OpQ8bRz7I94NG8RuGeBW6sPlCr1jmebmugHhu2rhhsEHpbNARlLo+2?=
 =?us-ascii?Q?8VGaBFbQ8CZlANmx4Ov9GEnnydbp/9VsxwoFPrXlEseCNDCuStq6wESYot98?=
 =?us-ascii?Q?v/iI7nI8q1qFMQVIP/DXpg8PXA6KKHtb3/Ex89mvO4Tit+etBSM6EqfhOS87?=
 =?us-ascii?Q?u8XVmxRFrxfKv/bH6QKPdn1L7yXIlwsT2PenyN29Upok2OUATcYA/WgrBbdq?=
 =?us-ascii?Q?f18kXP1qqrWrlgJi9MQRszYUrwwNCxW4ryb+TEcmZojLg2yuS7oiFtcQrwai?=
 =?us-ascii?Q?bfYTBgE9g5JC1jsJghpguvTFg+OI0la/4352vg2qePMH8k0GYJ12rB4UT+nv?=
 =?us-ascii?Q?OictDu4qns7E5g107cWtPl7Hdn/Cdxrk9/coYFLCAhTC96KegByRzQb3fRs7?=
 =?us-ascii?Q?2SaIveZQiUePt5dAvCiMQeBX6LWZ3S1VqTucnnxEcwSBcQoJCURB/3wj2p4e?=
 =?us-ascii?Q?2WG+bgqABJlyAkHnRZHILQGZaHWWkGT3KktIa2OaC2pCvUy4cshu8Qi22b6l?=
 =?us-ascii?Q?70PRNd7yGwWeQMCoG+XdmIPU6m9Ez5bcKA/7RLWEpsVchU4RxO5wJIwaNq5e?=
 =?us-ascii?Q?hQyxwzAA4WZP+DM1GAOP17tcDP7AB5LNJngBz8WZy542+gGu8Cmv/wE60IvN?=
 =?us-ascii?Q?3lxDQE4yQI+Q4EPwrtW0bjCYSHpIFbuHvSE7AdnOIhz2nH7YjbzUfNwlXINi?=
 =?us-ascii?Q?RVxEwtpIiokvHV0tF+HDqMedq/+tedQgEZ/oZKNmH24nqzSILqL7giinSFLA?=
 =?us-ascii?Q?eOBik9SukelMwBUVAeA8/X/fa3YwR+/BnYqi+udjf/uxAmAb2TU/vHLiDyCH?=
 =?us-ascii?Q?xecvHlxW1oC3vuM/nKt2Jgd7/gjeTSDj8WvPr1ey3rVuydDI65QMUYHGshYL?=
 =?us-ascii?Q?fivy2QWsh2FHLrLHg9pVU+pGtnzo7lmwjiNMa41gfPkCWuO+4+47j5nFBXJ2?=
 =?us-ascii?Q?ogsNjU/UOaNrahVBwhLf/o3prdZqrSDSYCFEe0wf6wlQLodNUFEpGxR4sA+C?=
 =?us-ascii?Q?whSoaGVCYJviyuVfdSnbWc1q9TQUsGwLbS6mQIizzUDh8Ng2bF7UopwpSDxM?=
 =?us-ascii?Q?MOfCkJX37PuBKu6g6aTD4B8RMkVgH0OcFL4CE0dD93daWrEEIDmfTBHvburu?=
 =?us-ascii?Q?Gb+Uma26H0leHMYuEuY7H1oYB45JStRHgwcUzL4T82eYAUoRcdjM69BEWuUF?=
 =?us-ascii?Q?EIHTSX5nn9LrBUGPW1ZJjZ1dPrnY6z0KlWl8RPFRRHuREIWfGZECE1g4GQ5L?=
 =?us-ascii?Q?wTMGCjYGGjI3IUkVoVFr1RYHb7TElqxHJ9o9kJt7nOiLoyqUnwbnOegzRLLt?=
 =?us-ascii?Q?k77dqt3jPPNzKF8T/1mZIEV6G5LBbd1jV4eXdRaBkKj57zbv1LD+GXO5O75t?=
 =?us-ascii?Q?b6desfFe74kTzySt/TZyPrzntOA2b5VF2d/ph9HrMgGm+jviwvMDGAdSq1XR?=
 =?us-ascii?Q?b3zlhlJJERQm/GydOsH2r46Eej4J9W+bvd16trEy?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cpzpXL50G33MY4akRmzggpUf58SAZJcWR0ND9xJCH5CC3NTIDREFCI61Zfwbg4kw4Lmg3lct1x8Ex+fVgJq0pnw0iH2Jde5JQxOfWOcnJh88b57D301/AWwIMttx3Mm/ibbOrwj7mNN1A7QhjBvmRVmXuK4wpCO3NKdbElbr2Rk2JO03BaqRNEp1LUZruW1RI7B9iwq0p038M1c5VJ/4D8Hi731jjWpiEuEr8lggr8VY1XrfI/U2YVradtOUnK/L3G1mAV44k9Qt5hTNPTTz/fwVlCOQkMjsRBaXIoeJn6Yb8MsTyPBvlrvk1pMXuI7DBczOkZitJB1N9/AkfFzpnq2iH+FfBUJCwinFPFrkWSdeRZWQN8EPH0ZzFLb/3o8uuv6U3IaZh4wjH6E70URcvf+FxsZ/VJH8TAhN5azkyaZ6xFlHr9Fx5k6KKcIaY3/SmmoZpk1mgLZI3VcOpqxCu82xDp8/TfgzzdINUExqpzzFPst9KOFLdVLKd7jqSeYqDOLDHcQemGfqj1CTfNAzUA6kPXAMrgmMXYa8oUoHGc99jK9CTiVfdYNlLsYwNzFh91VkE9+pdh/ZiMHGGpkbS6fCrWGL72d7bkZE6xrRgBQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 927c989f-9853-4d97-bff6-08dd995abd0f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 18:01:55.5857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k8mIMyErlV57g7nG0IN0221CbYhJPMBPirNFL7T72EsPCoSgv1JQs5vOLAQCyeqiW57lX9gaZZXnI0Y5mAz9hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5120
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505220181
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE4MyBTYWx0ZWRfX8ZuBDob6Ea5g ZpKBuoQS5hRvfbnyVggcRod8qcRXNeUdVeUNnSwxPj+ACTrco1RMPdLEPcM2qOoQRc8g4VZm3/L zSyE3Kwbme9w3kmYaZ5YD5u7R0CyuXJQNmkVCbqbJU6DBUDqtbKwstLyWeNMaSo07z6/k/Mh849
 gNdHkwPejI5bLudYgqjkf79o1dPh82VRuHU75OdxkI5x0h23xgFegwhDNKzzTdgwcddKQPhRtpH U/w0sRgoGdIGuNK9caRA6Fb4hXz2meMNvOrh+lAQ/HWoCyOpyv81IKyXpRDUURMNA+OK+SD/yB+ FpTiA96Ii2BuH+nqZsErWWM77cd9bfDgqwMVfxBbryqQ0kyGVZlhJYxyNQcNyIz/KcTNOwFh4tD
 TN24o8aSQwpseOf/GPuUrItUxpM8Dy7hS6uJxnUeRU3niibLXFrw5EY/4r86ZS+/U3iWA1Cu
X-Proofpoint-ORIG-GUID: k66yl9WNE3NaglbodIAhncTJ_6ZGHg-q
X-Proofpoint-GUID: k66yl9WNE3NaglbodIAhncTJ_6ZGHg-q
X-Authority-Analysis: v=2.4 cv=TZKWtQQh c=1 sm=1 tr=0 ts=682f6888 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=tyH8V26bHf4hJXxgQTgA:9

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 .../unittest/variables/bvar/tst.caller-proc.d | 34 ++++++++++++++++++
 .../unittest/variables/bvar/tst.caller-proc.r |  1 +
 .../variables/bvar/tst.caller-proc.r.p        |  1 +
 .../variables/bvar/tst.stackdepth-proc.d      | 36 +++++++++++++++++++
 .../variables/bvar/tst.stackdepth-proc.r      |  1 +
 .../variables/bvar/tst.stackdepth-proc.r.p    |  1 +
 6 files changed, 74 insertions(+)
 create mode 100644 test/unittest/variables/bvar/tst.caller-proc.d
 create mode 100644 test/unittest/variables/bvar/tst.caller-proc.r
 create mode 120000 test/unittest/variables/bvar/tst.caller-proc.r.p
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-proc.d
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-proc.r
 create mode 120000 test/unittest/variables/bvar/tst.stackdepth-proc.r.p

diff --git a/test/unittest/variables/bvar/tst.caller-proc.d b/test/unittest/variables/bvar/tst.caller-proc.d
new file mode 100644
index 000000000..7c3557e2c
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-proc.d
@@ -0,0 +1,34 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/*
+ * @@trigger: periodic_output
+ */
+
+#pragma D option quiet
+
+/*
+ * Some probes are implemented in terms of rawtp probes.  Avoid them
+ * due to stack-skip issues on older kernels.
+ */
+proc:::exec,
+proc:::exec-failure,
+proc:::exec-success,
+proc:::lwp-start,
+proc:::signal-clear,
+proc:::signal-send,
+proc:::start
+{
+	stack(2);
+	sym(caller);
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.caller-proc.r b/test/unittest/variables/bvar/tst.caller-proc.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-proc.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/variables/bvar/tst.caller-proc.r.p b/test/unittest/variables/bvar/tst.caller-proc.r.p
new file mode 120000
index 000000000..954ca96aa
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-proc.r.p
@@ -0,0 +1 @@
+check_caller_to_stack2.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.stackdepth-proc.d b/test/unittest/variables/bvar/tst.stackdepth-proc.d
new file mode 100644
index 000000000..75f720370
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-proc.d
@@ -0,0 +1,36 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/*
+ * @@trigger: periodic_output
+ */
+
+#pragma D option quiet
+
+/*
+ * Some probes are implemented in terms of rawtp probes.  Avoid them
+ * due to stack-skip issues on older kernels.
+ */
+proc:::exec,
+proc:::exec-failure,
+proc:::exec-success,
+proc:::lwp-start,
+proc:::signal-clear,
+proc:::signal-send,
+proc:::start
+{
+	printf("DEPTH %d\n", stackdepth);
+	printf("TRACE BEGIN\n");
+	stack(100);
+	printf("TRACE END\n");
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.stackdepth-proc.r b/test/unittest/variables/bvar/tst.stackdepth-proc.r
new file mode 100644
index 000000000..3bd29b8ed
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-proc.r
@@ -0,0 +1 @@
+Stack depth OK
diff --git a/test/unittest/variables/bvar/tst.stackdepth-proc.r.p b/test/unittest/variables/bvar/tst.stackdepth-proc.r.p
new file mode 120000
index 000000000..e50f12822
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-proc.r.p
@@ -0,0 +1 @@
+check_stackdepth_to_stack.awk
\ No newline at end of file
-- 
2.43.5

