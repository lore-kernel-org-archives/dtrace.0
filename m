Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67861D0E01
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730290158; cv=fail; b=edOMD1qm8pxUZKiQ3+kWef7ZfBzOP36qk3Y72CMzgLVAzE4s8f27Lv9Svc+cp+XsJn4MNU1FK/u5ivkZDZWkCqVrWTVhVQc40Ml1PQqjExT5JdIz5a9r6UA/he+UClNFfpgF6qPdzV/OQTROiSUoI07UThOq9qEEbpP6CQI9QGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730290158; c=relaxed/simple;
	bh=/tGvGrwOqtSCcNUU6+rZA2lXfz/gkD4AcsGnJpZ8WE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vijp0z3xuwKePsI3ARFqyhACUrqql0TEk6WRdFpLiGQ3kBNaPsPZcY0/noqiOfHOD/SuiuK5lwoG3amoeUYV0SVLuW0Y/0Z63MApldY2ezRGCBAFrbJU3z6Lc/U2lOGAbfs8WUn5qHWNVi0PsKPLRY/orLfLnzNgVWbwgB1SXuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KJh28mMM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qDrTIQpT; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KJh28mMM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qDrTIQpT"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U1fmiS021389
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Ki3gGA9maGa65Zzw/DyfIKYHysauVdBGhU0quOsueP8=; b=
	KJh28mMMNm/TUGlYP+7HPcPkSUzZFPtJi7nUnureHm2nK5QPdGv6FLroIEHHr8zA
	WF1f1S7qc3RLfjnIgYOD1Rlg+8UZg/EMly0PD5saZQmPzV68lbF6C8dnROxYv5Wg
	tzIK8Z2iqQ8FLWrCGZpcB4S9GMgV2BlAMTxV63cqIqpxKfRAH0QA/UrJWB390MND
	xVFqQ9vnNvLtSl8EyM2vWLCaD3KpKh7iJT62aXINolAPqMJi95uuJU6dza38TC4o
	7XvGwIyc+Oz/iH9ftdNcAczXbdxpeUvy+0lLU9A+JZVKxF+mKZT4mUYNWPTp59qY
	WjhopxtKk5P7vdOMlWHk/Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdqfrve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:09:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49U9rU3d008495
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:09:13 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hneb0h8q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:09:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jVXWGpG8nsjevvtXjIb3H70+fR3AqRvppmO2Nmu/0CuikIARJY1aFkr5ftl1UI0gNppE1eMX4jbUp5fZWWH91BYvHSIg0zm2zKpjtjZ0/lwsSm0BdLEQIruzajUP+w4OctPm7l1JnzyRzovOtBBw+M4nmwf8jhrPCRamukVsViLPIMiswY6Rq0ZuKZHKgf9ZoA1Qn/7ojnReadtrkROLKyWwiR1288Q7dXPDmqozruPRfEvIAyOIEHnGwPpm0nycyXGYLqGEEf8imb+D+lRHloSdDGR2D2sPy/c1oSjybxPd7qhmK+E8k1I3A9alHb3fkL2s1Zdhp7CTKj8FCdD1tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ki3gGA9maGa65Zzw/DyfIKYHysauVdBGhU0quOsueP8=;
 b=w1zwRzwi1q/noIAw+F/RJzjlq/AVVkvpnUr8eZePDBpoDBU1OlbZ24Ef8eJ1MgTIad8VMLs34hbzVnygoDnJZhbpig09IOY9SOB+DiYf6phGN6monp4yYVMg99B4rJsTBDaoja6koN6cLgggRyMlQXwmZHz1LLlyb2dlL4b87PzSVgc8Irf1R4Gtr0FHg/fU2iTxuPpUQswnadYe17A7gwrRQF/RnVwYkCSrDcg+V7DBTa7V2Rd8UJhMIcVrSdhye65+8fzAK1iGErtmX3UNkqSW2QBRj+moNI40C89J7NTIXnZlxjAV8NH6BRnFdZJN0QVYFlEsAaUmaqZ0w9ftag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ki3gGA9maGa65Zzw/DyfIKYHysauVdBGhU0quOsueP8=;
 b=qDrTIQpTBZwfKOfdHdkxPcGEbePP6STU0+u/0SpE+2JhM9ITMZV6nhxyjvXQO6IvOBGQbd7rXb5taZby1Ydh4XSH5R9pw5FvoKHQreGIID3UIefAfoJDGOve7KTnHxtl77qusn2yMaGE41UsmN9e7LKv8nYyO9dr1hBZ9Bh88vU=
Received: from DM6PR10MB4091.namprd10.prod.outlook.com (2603:10b6:5:155::28)
 by SA1PR10MB6469.namprd10.prod.outlook.com (2603:10b6:806:29d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 12:09:10 +0000
Received: from DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02]) by DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02%7]) with mapi id 15.20.8069.027; Wed, 30 Oct 2024
 12:09:10 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH REVIEWED v3 6/6] usdt: fix create_underlying error path
Date: Wed, 30 Oct 2024 12:08:50 +0000
Message-ID: <20241030120850.256884-7-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241030120850.256884-1-nick.alcock@oracle.com>
References: <20241030120850.256884-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0312.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::11) To DM6PR10MB4091.namprd10.prod.outlook.com
 (2603:10b6:5:155::28)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4091:EE_|SA1PR10MB6469:EE_
X-MS-Office365-Filtering-Correlation-Id: 61a41333-6967-4d47-6378-08dcf8dba944
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IjT2q3KrQynJrduni6w8ByuPxbQSM0Ss35LCHBJt93t9HemVoQtE9/2EAy1d?=
 =?us-ascii?Q?XX4Sg39P0dJ8ImanH7hUw5Td/vREbdMp2DI7PPVElCjfpovtVnjmMQpI29et?=
 =?us-ascii?Q?07oTbVzWgan3xbPIHQFFW7q6h0BQFr6ZHq92HnknPbBxjUDQ4hpYj0/onip9?=
 =?us-ascii?Q?a0Cz9KE1VrF/cqCyiBDpR38R+f7vGiMhW1grQMTRaP5/BccBPqJwkYmD3f4C?=
 =?us-ascii?Q?w5e3AqgvrfwpmB4mHIB1RZE09IDwnxUlTw9+ZxfstwABAGxcuanYnrrLfYWu?=
 =?us-ascii?Q?8wl6jqXq0q9+ylSNVoBIyS43353cuiaH0ZyzANQVG68ahNZajQ3kOlgcTouM?=
 =?us-ascii?Q?oc9m8wuOcl4VsKDskzFmPuxyAmBrRpC0kNAd7GK4SBchd3uaqkeukPbq2zut?=
 =?us-ascii?Q?MdNrsmIAmTBVFRxLe0veCUtTw8FCmMBn9/2MA3Z06eU5XxgWPdlSsiyeRw9p?=
 =?us-ascii?Q?75Bq26FsgyiMUblr8FBMbZ+D9gIFkB4s2Mkk3BczkV9Ion18TNkoakiJKYOb?=
 =?us-ascii?Q?13/YLR7i/R73h3f57vQihLZTSvaE0OOtpIEW/We4QRsuvcsYmDQPgwVjOMVs?=
 =?us-ascii?Q?DJtec5jPyRwxII7OWL9EO3a/JQqIi70o+dC6wafSdtQg6qQbHemd0N7tfISB?=
 =?us-ascii?Q?d8Yq+++D/iBW7OI9D7JUGNI+wbAo29KtTTA7tKkwVTy0BDW3vYE1vxQ86Kh0?=
 =?us-ascii?Q?cTY3+EgxKqMSL5a0My/+nlyXJL/cc2Wfa+GBY3AxzREIFBq+wXuOq8r+PBss?=
 =?us-ascii?Q?c8VSCJ76iA8e8j1YmBkyn4sByGo/+2LRMOhhwKufNx4zjKL5MxuU/SNfKbHg?=
 =?us-ascii?Q?+WeRIuskUojcYR2QSP5l0KRKpi/CJgAf8Pm41jQK07HKz0zoEKqvlljC7sOs?=
 =?us-ascii?Q?QVJdqysavIjjnW25rugGrgfapaRy8C14qR6ElwqH57/npwC2e2bchZThUmzk?=
 =?us-ascii?Q?xNFsiu9GwZGOn/zfN6jAVz+QS5ufD+CNyfzOgpfIJOIKt/oGZpPF609FzdQn?=
 =?us-ascii?Q?17LjA94xsrpUjmG+HOJOz/pma0G0exUlXDpYgKP7kQs7yOzv3xBFO8Yeet2d?=
 =?us-ascii?Q?Eaa9jmhpRWOLZLplTG7ww6NEx+KQamTrcIHu9sYPG+c9QiKOfP5btxFuwfs9?=
 =?us-ascii?Q?sgF/bZhHt2ONVYD95JyS4mRwgN8u5d+taS4Mvr7OKUZSSHdti+KI1zyq+/yI?=
 =?us-ascii?Q?EBNNUUMwwrGf43LmhRnP+KOC5CIQkY/pD8fqINJMfuTvUli6lfreGVZpul6I?=
 =?us-ascii?Q?AVcPXFk+axcS1mJ1EGQjT2SBNFEVHSAcmY5M2k9RUheYnSU26RTHjLMYHTPq?=
 =?us-ascii?Q?IMLoFgzlqekgzqHQtdGo0HWX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4091.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sSPrx4p8EE8l/1uLwobqogcW1HYybSDJkw5BKFd2zdtvO8sXmeyJp8ZMNa9V?=
 =?us-ascii?Q?mDRN0+kbDfGXbgUIyAn+zzP+pY01upQu+mb+sIsK6HhXsWTeeuMrbPcjZ2ir?=
 =?us-ascii?Q?8B2rQ+zTcpRCs7bns7tel9TqFBIOYP4UPVSzliRHVKOTNqgbs3he7EDpgeeK?=
 =?us-ascii?Q?9RtbpXKIipVW/Gt/GVvb9VgEDi0RRT0TJJzeV6jabqp5lUUFEK4slRleXafA?=
 =?us-ascii?Q?e65U9qX1CRROFfHGWP+jsXKiibaO6lZcguX9bd5OH/iNLVNr1UXHHZspNHdZ?=
 =?us-ascii?Q?Ns3OpoSJCNRlGwJJYd6t6k4nwPbRjS5Ud7B66kW1WzhOElUgd3J8cWCPNv5E?=
 =?us-ascii?Q?8ZdbSqCqes5QbOBpqNSXNDJH5nPyqcA7Aaqn3IdDMcSnej6ui2mmMRNie0DI?=
 =?us-ascii?Q?9w4o8N1mA/9glU5VQTm/RB6K5ylHQtZ0MeEowY8W1YTjaSYqfQCJHYn5dXzw?=
 =?us-ascii?Q?+NupgU/Nz2WZdfUEZfPQgiMzmgK9l2Nls3LRPCK7XH/zTZ8VShiwhKLaRdxo?=
 =?us-ascii?Q?s1+CHiMAHbgMarGZSpwPpzQhbKp33PRfwdb3AETQd9XntVyMK00WZz1jJWa0?=
 =?us-ascii?Q?XRN8RB8bv4eHLLeTWHJc5NztiDWOhi9/JplflusSmVUAKXkDGnynJH2R1xHD?=
 =?us-ascii?Q?Oxxvzmh/2Z7BHwKdFjeSlRQFMaeAfwsUr9Rcj9aQnJvClxpxbGXkpBwzGPyG?=
 =?us-ascii?Q?Nh2VlKCeAgB/tQY6O2cH39WzZeTSqheAo/44saAEZebP/TjuumXEKJkyUOEA?=
 =?us-ascii?Q?bM3HTzTKbGHUkhpvXEsBnZaQrvqpJmV9TyjVIArBBSR5kGVrKCPDRYunPPIp?=
 =?us-ascii?Q?D3mqXeCz03SPy86FU7Z6esK95XOoKo0PHjM5gtdTSFpEQB84LEQl/2OcKKSc?=
 =?us-ascii?Q?KxYt5yw+2z5kDmd1d8YZtuq79yx+7tX0gfiHqZ2pe/kek8aQ6Fg1Z8F6vFXq?=
 =?us-ascii?Q?QnEIcrwRg+LDVEfolyyw+CWQb6kWi7sLa2rwf2zE+59T1bpAKjbTa5GhuxfX?=
 =?us-ascii?Q?r/SyAS42Rd5s7H+uq/UC+EG1A2uochMcFZ5J3ioG40Vx9XTrKhqdp7IjoT36?=
 =?us-ascii?Q?6ik7xJ3xuvcxp46DmOfQW9WYdBB68cYsxpz88jltcGp+nzsd+humaQpLmDVX?=
 =?us-ascii?Q?C0f/1f5r8IOE1UXp29r6bZXjXsKcsHRkrH2Ke/mArWwPtbL0UrMOu8MesYPH?=
 =?us-ascii?Q?ZCBDxy3qpBfK//d5zIJeHHfYit8LB7izc5BkfV5W6QLboRUja3gxUmA3MeQa?=
 =?us-ascii?Q?64Rb2p5qA9Aq3wUBWQLLO1WmwC0iJ/gZlhVxjM8C6qYgoQfp3Wcgl0t4ZYJW?=
 =?us-ascii?Q?Y2Phrcv4pRHLJDB79igo2+qpjBEWieeu1cMFfyay3pbSAkoWliH9ucURUblv?=
 =?us-ascii?Q?JSXZfRJ9RWC6drbeM2RvHXOj9i1vm0oc0JDlSIJIG35NCf7dDxXEwctKkTjK?=
 =?us-ascii?Q?15hFk3+oViJNt7lBlKMZDQRZc5vzZv0vN0nfocRsYLuRoaakrY6oKFH/ofSR?=
 =?us-ascii?Q?2w99TRdAzKXIiT6w59XaoQ02EL58cZTYYpzxK1PJcxKv7ACREj0ZNgHYL+GC?=
 =?us-ascii?Q?z0fjt/waBUopOSZ/KUaqZFQQPH4NpKOyw9c0ZtPYpS/GfuVLE0yZ4PHR4pns?=
 =?us-ascii?Q?wQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SnRWERl9sM/LoyZ2Rg7N8tTNs2cXZtRhfSQls4f8UBPmMPiIorPgpxeiTCvLi2ObtRYme8XFR94QeHJKdv/ft/oCThO0Dp2Eh29+g6xZGkek4JTyk03eqZ/0MTSItVaPZyBAwbz+fIo44K8uedLBqKz3Xab18LfWh8SNoqLWafnNNhXPt5oJNviUca9fmmQ7Vk8bs3v0588CCMs0meUg59J2RR6BPZGL1SjLdHLXBMnpZPpIWbhYculPBGB/VHw0yv/tygl1brDstsL7srylHX2TA1/QBgCT/RO3TNBECJQKfPwHArMLoIOc0rvBWQ5RcWlu4P5f21SCgtR0yoa8DwoEKRIRxBBDADVaykunxNIJ5aW9lUZv/PFJVwFpSU9o+SmDjxiFfJhc7M+cikJMdDgY3bI6sZYT17IDpxay/OISCC7VfB2goobLvHfFueog3aJrcTw5a3O3h/K4ngeU1yrwLYAlx2bSa4eCUmdueO5EsYzFBJFyjyQsUysqyDZTNomdKYJxeDrkJL1cdVpsEggOv+qktD4iqw/BkUAj22oFb6qedcNzW0/ody3EYHktzq3QhocxBgP1+Eu7w7+s5gjFAOzH08FfJpPE0RVhNm8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61a41333-6967-4d47-6378-08dcf8dba944
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4091.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 12:09:10.1991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2dNM0ekp15wPoU49GZqRynB8k1jZl/5KRBKQ/jwgWSiJXgLoh9yNirwfyGbVrWc0a/9dvL7MEobo9MxX9r6NnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6469
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_10,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410300095
X-Proofpoint-GUID: cVQQR1MXEdkhgJkTgKo0XOCyDgOHSyGu
X-Proofpoint-ORIG-GUID: cVQQR1MXEdkhgJkTgKo0XOCyDgOHSyGu

On error, we were destroying the underlying probe using the wrong call,
as if it were an overlying probe.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 8187d832ff1e..f9c2027935b7 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -316,7 +316,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 fail:
 	dt_dprintf("Failed to instantiate %s:%s:%s:%s\n", psp->pps_prv,
 		   psp->pps_mod, psp->pps_fn, psp->pps_prb);
-	probe_destroy(dtp, upp);
+	probe_destroy_underlying(dtp, upp);
 	return NULL;
 }
 
-- 
2.46.0.278.g36e3a12567

