Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3128917C2
	for <dtrace@lists.linux.dev>; Mon,  2 Dec 2024 04:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733113670; cv=fail; b=AggiIRD1S5uTfFab4Bxm6vbk6pUcgThELrE1WnUs8onAmPp7hy0oNY619nQs2rka68Q16w7BY464lRvu5rY1jgEu91dzoSFNqxFpvvi8YmViuphJFzzEXI16reXv4I1fk6a9u7QdiUKGTryvtuQx5QVCg2GgHMkGx929w1oAvCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733113670; c=relaxed/simple;
	bh=xgZvWTvI+fAwy3xb9aGh5fgZjZ5o4Jj5n5L7G6f6XwE=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jDsKaEBmZPi0oaUlxU+ZaK+3A1QxBhbHJAEODxvfzxhJ5WPqk60BA/CThoBcvWz8u+g86FG8mo25xL2gb2Iogo0cqtxM4fyULuEoi0WUZHdu2nGSsFmohzwNRLhDs337EDkjNLGbgOWtwcoylTHw7tgXWsQIBVBiWqm+lt0Ssng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=op7kN14E; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yX3HW4gR; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="op7kN14E";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yX3HW4gR"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B21BpdK029461
	for <dtrace@lists.linux.dev>; Mon, 2 Dec 2024 04:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=jQPrc7VEiGurQdP6gC2c0bmIbX/xG4mbIhIWsFobtlI=; b=
	op7kN14EIRrtj0cCVYeT8y0mzwH9FA4FeuCy4ctqNN8Ko4J1C8RZNu+7KJrZC5Z4
	1IVp8Q9CF1FRkmf1b6aJoyLEhbAvZAXIUMg/jPP5PBJcihwhlodusfnjoNWzXOKK
	hjm4M1J3RgQBZoGCQBVjsZYoR1+lmsPwtoYrdZ8to3sqrMdpnScWhvf9hiYg22GP
	+cTtMVxw7+2yJyZ7pBqx3EvzcNmw2qw39VvamKPjOug5g3xdnAClMz01koffiypj
	jq3rmG4YLGftLmyJUKRuxQ0GDFw7UPvk0630Y8bi3J0eIY+h3IdI81D7fcFxAYzL
	0i++1btjVsB9efZVRoUzTA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437trbj3kv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 02 Dec 2024 04:27:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B242YFg030948
	for <dtrace@lists.linux.dev>; Mon, 2 Dec 2024 04:27:46 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 437wjagf84-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 02 Dec 2024 04:27:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lk/0q7QFKtN14l53NGeFsZmUGAMAKVUF1rI2Wo6kLvOZ+ZQMlDieM7zVt0nlBrbB4A5bWqpRXbvBpbF+fbYivL4e8M405mWsyVQ4pW2q3tPmglcbD6MBQ1W5nghdH7S74bRknrKRaFdkVWB+A6u401NTMao30Sp5W39R/3SWsjPKg9jgR+oG0COzt5pJjn1ISXLBE7P6KYDnUASP7a++m3TZmH5N4qi1WmjCp77GAge5KKtUPfSiwH2DOoIW/pazG0aRFsuCjiuXS4+wbvRqVQj+GwaQnO4XUYqio0HqVbYjAnaTLMlbJep8+63EUDcqQieaZs/RRHMADN8kwYmFHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQPrc7VEiGurQdP6gC2c0bmIbX/xG4mbIhIWsFobtlI=;
 b=eWrD5godF3NyN66iRoM9dko+yPDp5i4dzmAmOVme4fW6xMx8kEuhlo63sExHynvP+lioPpwo9QhS/FrSL/m8my7dVIw2/nKXOMvvt8Brx+G5DMVOzmS/mShRV95pgskLbQQZnSc70I75CDbZJF3gXli6zRLc2JLJX1GEDbxOak1QxLngxUlgnWwGR5wNxVUGNK44Ky+7kMIW1rjQ0AL5jVTF0a8k62iJt1BKq7ct0vCZAu38nf64WoMcUnVMzTXBmjAmqV4D3jO+RomJO+9tJDLozqpkPJ1D/qK512SHOdNRpNJdhvhW5OhW9FeUOC5K+JTG/P6n0qLS/T8kXipLsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQPrc7VEiGurQdP6gC2c0bmIbX/xG4mbIhIWsFobtlI=;
 b=yX3HW4gRi5PPTi9mcM7O4k5QpyOeCkIiQqi3YbMC51h4oj1Iz1iV+Vgn4BwLkx3zBP5+tDPTk+/Jkc2jEdPI4OJPKEJjjyH7FH1bU1uE8XijVlOHe+78qTyxDhVRwXbNNqOTG/wgpyfHV/mXlbnGDzu1v4z+ApycvuF01LHLORo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA1PR10MB6493.namprd10.prod.outlook.com (2603:10b6:806:29c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Mon, 2 Dec
 2024 04:27:43 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 04:27:43 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Improve dt_pid_create_usdt_probes() error handling
Date: Sun,  1 Dec 2024 23:27:41 -0500
Message-Id: <20241202042741.12328-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0060.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::35) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA1PR10MB6493:EE_
X-MS-Office365-Filtering-Correlation-Id: 28d15709-9d4b-4bf5-d281-08dd1289aa4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FzOtyh5/26oB9BLPl1yy/qf6qJX5FFj3J/eZo3PNBeBkcCJ1loMYYRNW2aYi?=
 =?us-ascii?Q?WHgE2JSDRjJ3zzPdvLSOOvVDvSMwspEeZoav3r8Olu8bqmRZgsaSThAmAZrw?=
 =?us-ascii?Q?m7DnbeyCwBgxWvAd4d5hh5jzTjpUaz/TBEMQcwRbjSE3Ko93vAZRNC7g0J0A?=
 =?us-ascii?Q?4Cizev5/xnH5J26lfIt9FGcl/GJAklU2iId6iMnois1WHZYxfylf//TwEaCh?=
 =?us-ascii?Q?yV7LVqlJTVArF359c8KEhZjuEEeF5ZoZvjQcF2SHZWIf9a/fcm+uBl2otHKQ?=
 =?us-ascii?Q?hOGtuJXHDZivIYYWPX7mtlvrvdfpULjYUMCGtTBrZEKeS+h6AwKpFIbdwQdH?=
 =?us-ascii?Q?te0Y0r9zlod1MVtQA2Bme5yJCmBkJmdzQa9Lol1s2JEgAwk4g0kGN56tNLH0?=
 =?us-ascii?Q?bnRwBH38IYeMRfa3zO/F0ZbHRFpbNb1o986f4t8nPU0rmggiG6nywFxtzW5+?=
 =?us-ascii?Q?r87rRutIFweYYdNQq7nOivmk59z0pp3Ro6ZwglJWq34Ln1bB37vHfSjSQixG?=
 =?us-ascii?Q?puj7Z4srtpjxlR2Y7cbquf17H8z6jmqNDwMcEA3BZoyY6xDYfnMKNCeuMQiK?=
 =?us-ascii?Q?bH5Snw8dJZMSPXpDapgvLMnEguRmw9qDpnNFw/8SrlBHnMvO23+EvB+aOjWL?=
 =?us-ascii?Q?MM+t3apYyaJmTqNA07X1a69DXINete8eFMHFke5aTFHQDyJ8QD+qwdN/8r1z?=
 =?us-ascii?Q?8mI9H5qGBk4jrPmQr9oDJPBLfDmnYCy4BDCh8lEr0I6s6pCzi8B1Z18iw7/6?=
 =?us-ascii?Q?bvQPXMCeZm8RmbWkr8UCrISFYlMkSFcHdqdyaDlqNu99Ko+urpkO81vIMXv8?=
 =?us-ascii?Q?aGA1V1Sc2WFpw+OLsfITTY2HJure0HJByCTc99T3O9DMr2BQSw+D6CyUY6w2?=
 =?us-ascii?Q?M9HpTwmcun920A4W4NZ0X5O8p0d8HzlD+cIYNM15Rx+UgQUwBKi6GK034Kuz?=
 =?us-ascii?Q?H2TTfPEISxHuot9Zu4TnQVxm5pXHX1xl7816m9wAl9VOooEva63S9Cf+oCJI?=
 =?us-ascii?Q?Rg5Lx30Ng4AEy/3DerNgOEJAlhpS/VdxsWRQxRHDC4lJ23F/FGrxjqXM54kh?=
 =?us-ascii?Q?GorEKJ2HKcHesdUBekS0X22cCZR2AtItc2RjC71si12Gc77yGKbMeZNK2YV5?=
 =?us-ascii?Q?k1E7DjGmypt0b5zOWwI6Yue54ejgRKuov/txdU1scdrwlf7lFoF3BVTjiXpZ?=
 =?us-ascii?Q?YJmomTxQF+2IU+RsIh63afgOMlEiYZ+FjEH4fBdOteGIZLBuZ9iD9d7cbDIv?=
 =?us-ascii?Q?p2wrrKx+hwCRGdXmaoxCSF0CYzfR9e+Nqwp7zYI0mO0zN6A9ZqxXqie9ipXe?=
 =?us-ascii?Q?1jX4j8wR5UJ/g/Lx5eCQ9ANYOA8SRLbhKorzoijB5jDM/Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u/pcYPGzWA/dfTczhs+a1JAhhdFTMkbkaLCqp/W3A81/L+JvsTai+HbWtrYj?=
 =?us-ascii?Q?ws8D0OJHp7Lq1xK3KGbAfxqkj24nBGpiImasTftCC7ROjxl6GYtwAu4LwQaQ?=
 =?us-ascii?Q?0xKvoZ9+vyURHe6J2AcyNb45eiW/HALUC5KUVlqrO0CejD9NjXvQUHgndU/8?=
 =?us-ascii?Q?iZHIZnX+etTnMRHYJWRGo7Wmc31zrlhShBsK8e63W1WNCI+dQ1Fk5zJiRYoY?=
 =?us-ascii?Q?w3KiZjRomT82e2pAmRndRhX6H/St6tuy/hyk+xmoVP66gGwSGJCu+VzdD4J6?=
 =?us-ascii?Q?GpruJOcR3WJlUTWvt7R2v8z7O2DEHsyNbPuWsbvlrQtkbdZSYb3Ur4uRO6Jx?=
 =?us-ascii?Q?vR8uhvl1sqLviT1YoJWXLVxtNF3M0VExOI7FOp5nI9Nb6TdzsLR5Cy0MDS+P?=
 =?us-ascii?Q?xDx07jc54CI9TzKLzOQEhrXtbS0neirelAUk5Fay9HpaRxF924/+zfWsidtK?=
 =?us-ascii?Q?kXudVVZTfFbsdBelHa2uOfBkCgDtfA94Ju5RHWHNK+G+GUpKhsBdaZzrZMUx?=
 =?us-ascii?Q?ewdiYpRGOfgKpo3esuwzJdRVIG3JaTZ9EV2gkUeLCqQu3GB16kTXcAyNDXhJ?=
 =?us-ascii?Q?hXu1ZlUBtQGO014BDXjQmS0PS0dTknCCh3qG0EXpDUGNkEmTfHMu3IQke6KO?=
 =?us-ascii?Q?L0IxaKWjGibRCatmY07cIjLTmKJExLD3R4ZWB1yqiV/5BwW5Gqs/Y/2vCDxi?=
 =?us-ascii?Q?xRjy/YwhBBIYE0aiONxpU1ym/nzNpPbBh95nTCAFjmTjqXbfQU8uULhLbs0f?=
 =?us-ascii?Q?41G4L0C0UaBHSwHXI7tUnL1CzsJEApDNFT+BgSZ5Mj5h4XAZaiLq6q4CAwms?=
 =?us-ascii?Q?G3xBV63qJwO5+tUb5gKMI4vnjDItK8/pDzJOVX/599ACAcYpnmKAAnVTALCT?=
 =?us-ascii?Q?eR5W/BOAd6lgZmOKy+Eetlcf+0s9VJ/NsO6a4Iy1LeudxQdU9tYlVcpRfYjD?=
 =?us-ascii?Q?ihmvArQfsr9EKqb76xeQiFCxS9rq/qSUgWYz9ttNz2U9h0xqcD/wLKH/t+be?=
 =?us-ascii?Q?wBvgegtRETuB6TPQ4HkKXPlHU6J8cS4GmWYHU1QkfaTjUAsGRaGVax9gFpUi?=
 =?us-ascii?Q?cm9q0TsEvmTsVwCIPqaWWHxqOln37KlRXV6dHiXEJeNcXZcg/Dg0n+002qGD?=
 =?us-ascii?Q?lcluF0oUbVDiVcyJVQBX/uqmBcwN7Y3IbxYtrSX3/HB2TfbWqej/BTbiQMze?=
 =?us-ascii?Q?ZGnpZWYww07/7eJtzyH1Hfu7RwXLEY4PvzVgsA9bb+U9OtEiiSxUU42nonHQ?=
 =?us-ascii?Q?fvQMi1zADYuKISxzdWuQhPc7CE2FNmLfKCd4jmrnBZRLE9EyHwP5xh7xpbYk?=
 =?us-ascii?Q?Y4M1TK9BaiFh/87x/C1JBeSbxuvAMSuMFg1J588bVAx7fF/oWj4J8MChTv6l?=
 =?us-ascii?Q?oEXzi82pkEgPFbWCsmcijMScZROsdBTongINjpPkGrZsaPiXBKx89uMPM8EA?=
 =?us-ascii?Q?R+Z01NzFyCgtIe5rdxGJQ2Te+HRPvnrCxCklitpSopuMflkiByaY/LNZp5JI?=
 =?us-ascii?Q?WPMg5N6M2iVSXzzhXHqFwDXei1Gey4S8Aj77yFSRvK+JP7umQGOQP60kELgv?=
 =?us-ascii?Q?VXStA0ck6NYxeD7WoNEzyvUOjIV0BEIvPcfHubXS?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	j5s2FfAxnGpTvoslqncq0EzY5bPenWg6KdX3eG4Z5mb+puag5qMh+3DDP+Zk+TQiU0NwfmL9QVu24dNBKbcLwx6Zyr4tibFIMY5SMr4sTD2NtjX9IeZgEfPuMi8z7RHcWXmKcpslBK8PAEVXy6RQJlBwhgvROERVAUeZmvSh0AEfF8jFZPhxTeVHF6Wea4eTvXnD+DApSPVozYrm4D8Z4M/kswAPhe5mmFfdrW5bxM+nYaViIock/mYKSAKm1BA6jxuL2sBVosG8BrtbROiCw02XEnomVI3DSe9Lb+6cKHlgYNf53LuebnWwLAK7i1toZ0BBsqmQGPTCh9sijRkGSYUtv9p8PdTuuhAS0XKKb8OkGLFSRLtXKnrYIk7YbRNGTmKC8xv2cAT5nWB4qYBhXfCsmPiIGOqzBdNTawTJGQ+ZmHK/5LE0jT947HKVOp04bbQ2POwgYyjdR6m+KGSHFPM7ydSwOMGoDR2juBzx+BRSD8CQRunT4i4Bxq1ZtpLBCgBcWSff2owbM4gYt8JZrzwUQjyOXJpqYMCewGvV/izarcDSwPNg70LBH/ESYEfXT3cs6FqPq4XZYjnIJadU5uSyky3v9q1I9byLEhHQtPI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28d15709-9d4b-4bf5-d281-08dd1289aa4b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 04:27:43.4751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gChEItELUCf6QhcfjC7LYn8t8kY2syWHpO3iLOPK1S8sEpBd4gHw10nWK87JMrPhsnGAyM5A6EMxSEUtwhtEdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6493
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-02_01,2024-11-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412020037
X-Proofpoint-GUID: GAXXFbWW343v2nGHPGjXbMhr3LTWxVmo
X-Proofpoint-ORIG-GUID: GAXXFbWW343v2nGHPGjXbMhr3LTWxVmo

From: Eugene Loh <eugene.loh@oracle.com>

In one run of the test suite, roughly 90 consecutive tests failed.
The exact circumstances are difficult to reconstruct, but basically
they complained with messages like:

    dtrace: failed to compile script ...: failed to grab process 23132

The same pid was always indicated.  Then, the errors stopped.

Apparently, the problem was trying "dtrace -s foo.d" where the script
has a BEGIN (or END) probe.  Then we get to

    cmd/dtrace.c compile_file
    ->  libdtrace/dt_cc.c dt_program_compile
    ->  libdtrace/dt_cc.c dt_compile
    ->  libdtrace/dt_cc.c dt_compile_one_clause
    ->  libdtrace/dt_cc.c dt_setcontext
    ->  libdtrace/dt_pid.c dt_pid_create_usdt_probes

We look for processes that might have USDT probes.  Since the provider
description is blank, we check every process in .../run/dtrace.  It
turned out, that pid 23132 could not be locked.  This sent an error
back up the call stack.

We do not know why process 23132 could not be locked, but having dtrace
fail under these circumstances (using BEGIN or END probe) seems severe.

Change dt_pid_create_usdt_probes() error handling.  Even if there is a
problem with some USDT processes, report success anyhow if there was a
glob pid specification.  If, on the other hand, a pid was specifically
requested, then a problem with that pid results in an error.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_pid.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index e0a26d5aa..fd94a0706 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -1252,7 +1252,8 @@ dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *
 				      DTRACE_PROC_SHORTLIVED) < 0) {
 			dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
 			    "failed to grab process %d", (int)pid);
-			return -1;
+			err = 1;  // FIXME but do we want to set the error if we end up return 0?
+			continue;
 		}
 		dpr = dt_proc_lookup(dtp, pid);
 		assert(dpr != NULL);
@@ -1272,7 +1273,37 @@ dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *
 	free(globpat);
 	globfree(&globbuf);
 
-	return err ? -1 : 0;
+	/* If no errors, report success. */
+	if (err == 0)
+		return 0;
+
+	/* If provider description was blank, report success. */
+	if (pdp->prv[0] == '\0')
+		return 0;
+
+	/* Look to see if the provider description had a pid glob. */
+	for (i = strlen(pdp->prv) - 1; i >= 0; i--) {
+		/*
+		 * If we hit a '*' before a nondigit, we have a pid glob.
+		 * So, even though err==0, we declare success.
+		 */
+		if (pdp->prv[i] == '*')
+			return 0;
+
+		/*
+		 * If we hit a nondigit before a '*', we do not have a pid glob.
+		 * Since a pid was specified explicitly, err==1 means an error.
+		 */
+		if (!isdigit(pdp->prv[i]))
+			return -1;
+	}
+
+	/*
+	 * If the provider description was exclusively digits,
+	 * it was not a legitimate USDT provider description.
+	 * So it makes perfect sense not to return any probes.
+	 */
+	return 0;
 }
 
 int
-- 
2.43.5

