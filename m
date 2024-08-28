Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B152C1ABEC0
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724875268; cv=fail; b=P1O0kjOpjFnUa5XHP4reWCZY/XDnsfzh3+HGowlAki4zuLe+iadPHHyA1ybP4BphLm01TJV/yegIVpP2EizDyVvsITMgalzIyKw+Wguy6tZwLcZwD9HiA7S0gF3BzUi4EZ6z3Q9a8ZwDVH7zedFXCOxYT/TLps/wWHL5vOSNNww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724875268; c=relaxed/simple;
	bh=Ss/wgKQvVDgajaOBNHbfz7H/4EfjdthfEkdn0POgbEc=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=QpDql8nPz5XgyHP47S4lJwB+hGdg98fy2f/uqJCEetzE2FEPAGW8HU+8BOZQAWaul99P37P+CLnn8j2xZNG70nFKwXvzt4Daxe4zX7bzNMtIFKt0wuKePS894Ri+D98AGliB5sNCgscC/nu2gtMGn22pTPYv3IGYTr3Q1xlw06A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=a+mwXR3G; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CvmHr6u2; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="a+mwXR3G";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CvmHr6u2"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJY7XB009398
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=zLN9yLOQsvgXGGmdApvRppdVdMR6CHb8vN4Fl/Jksok=; b=
	a+mwXR3GAhPxF12PY7IYL41AxCKLcimV5rUsoPUuZ/IIaLTX9PtKum/HNL9aFNNr
	ob9y1iQmCtSOHWJmpHWFUYM+7D9h7rMGWpbiDp5Tl4gmJa6Dvvta8fq3SV4agQCB
	Tk7PlU9db2gGi8QUORFL/shNbfqa/8icF0dDUkSGCI71ibEO/7PbwehiHbLuByDx
	aR6u79HEVxb2tcPV0EaBlFkraVCScBNWvIoobB3uaa9FR0Q/BCmOPQzFGtX0A8Kg
	PXGmt/dKybhaz8eWHt9FEtUFNDfmrHALSychQDo2rZcIrVPgUHgJSPMRbFLFlUDA
	NjToD0uzqS/XHW6OpXYocA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pwv272q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:01:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJnsq2036544
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:01:04 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2042.outbound.protection.outlook.com [104.47.74.42])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4189jm9yxs-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:01:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xU9n8+d7UeeIk7TfbRVq6JzeDiQDkv8vgUUN6IEPb2g6QxgtjcCoz7hBT1sGNo5jYYj79lUMvCG4kiUTS/DreOPoPv/s08WdFWgo0S1LeHE0opuRC2po7K5g3yq9Ma6VDV9UbWCRvDBeroIripXo0KC0ngH6eSPzvs6EsFO76vLihd4ZnE8x3VtC8ucj0rzqPFeEF4otR2qiCoU6etYNYCoExaogBpJ7tJRA01PR7NH3KZRlUPU1xt5b+cZvtjeqtEzASR7kzbjpJEPfZmdzRm9mvlPc6fwqg065j98ozYZxeiu5xm6NRv2GotdzBZctBUIZBYXbnBLwkXdHFETDdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLN9yLOQsvgXGGmdApvRppdVdMR6CHb8vN4Fl/Jksok=;
 b=ZjKgWsOVi+SKgug1F3zNHjzg3I+ZttqtjPqDAFtLhmdCzkNbis3GNkqwZnDQaFsWA3h/ATdtGyNY212qI0CY8TreUuwbcjM0S66+rJYcphytqAYh8st3NWgA5yBKLNDShZ17dSsev37lHwC4hfmG2HxMgY13RJROfKX/UJ99p508JOqRd/r2sMUIN3l/SM0rqZwInhe25r/Wu33pQZhrXdLHSsenQCyTO2XpdySxQ5gymXO2G5stdEXwp/fBaruti4chd3EvjMxjZOyHTR4swwAVYOd2DpI2Nkt2k6Wa+wZLQwu6eN3H3JTdWgIUaOdOnz24SgwJktLS/j+lkipb6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLN9yLOQsvgXGGmdApvRppdVdMR6CHb8vN4Fl/Jksok=;
 b=CvmHr6u23qDwsg2k3GAvgDomcgtIZk7ZsWJwsnjggnQZjdog87Bv2BAagWQCKUqFOxbZduHHxZcYXm/tnsDGEYcVoLuMVAQQMLnsBxdnLfRgFIgk6VkMGRdMjHYsrwtOaUoGXIHwaIgERfOe2MY70UQUKR/9X+pJQjymifPpVYY=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH7PR10MB7086.namprd10.prod.outlook.com (2603:10b6:510:269::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Wed, 28 Aug
 2024 20:01:01 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%5]) with mapi id 15.20.7918.012; Wed, 28 Aug 2024
 20:00:56 +0000
Date: Wed, 28 Aug 2024 16:00:54 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] ident: fix unsigned vs signed comparison
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::28) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID:
 <SN7PR10MB62878756B7ECA31ECDD54F00C2952@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH7PR10MB7086:EE_
X-MS-Office365-Filtering-Correlation-Id: bf7332a4-28d1-4995-fa95-08dcc79c20ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I1SVxkX2ltGpvYqr0uZbg+hsAbFu+vgihJPkCn9kP2EWiFcxqEPeanLs7VOJ?=
 =?us-ascii?Q?Po9/Xjah75eOyZzJGWFBarrdzHb3X/DZIc8KdZxhqBoub5EYEXMZGjIv6L/A?=
 =?us-ascii?Q?abrfP+WjLkr6VonwsS/iNDyDk2aHOvjGoc2yIpt3N970xSjc8iqparTuaTo+?=
 =?us-ascii?Q?ilco/CirgxXT/285sla1QyeORHp7SXCBZz87pdAMuxpEJiebZWsxxjNShtvU?=
 =?us-ascii?Q?vUc4/NoYJiS8VRHtB/VZNROS8UqIftDFke6nnb8Ai57RCaalOMIJnTJrESru?=
 =?us-ascii?Q?YjJvxURlDB2uRh5z6KVXvOwLH+nfvR22EUDwmgXbQAQyqfDfR3Egbkf0ZVsw?=
 =?us-ascii?Q?a13bdF3jGbJIi0zNciF//Hbe2cfZWFxSK5TbsNxABsrSCG558xURkMSje6y1?=
 =?us-ascii?Q?p/o53jwDD+48MsUzT5f9Yu1Icb0L0xfTT14k9KADLz/aCOBDBALeVreMtgHy?=
 =?us-ascii?Q?yuGx8HpetR2mr2SWyXEEjh7ZZNIvkui8MP0nbqTWg2OnBf7SUcQbatoRIbx/?=
 =?us-ascii?Q?ACmGITgyRezPr9Lngk06Rhr69b8stC8ge1BJfKx9Sc4gpRv1NiWN44FHsAWu?=
 =?us-ascii?Q?s9NhLZWnGJ1p0KwlB08JW3XCXr0J0tuy5cwynmAyfluqIhBwVVbpo7tFYn3F?=
 =?us-ascii?Q?Gy/AH/TLB2VK5bjZNNevBUkif+lfCBs9WCq2qh6qphn8VJaV10/GsebZDEc2?=
 =?us-ascii?Q?aidXPMHh6rHiruXZAhC8wFO0EFhLaztWzTgtMnqtIjZpeho76qirdV8ckP/e?=
 =?us-ascii?Q?VRzFMf+9QGRXGX+/+BvxqSaWu9Yf4uiAzQL8j2O8iwr178MYGaZ/hRlCx2Ij?=
 =?us-ascii?Q?Kwcp7lc7gmbyYRxnhXfouQd7GBywU5B9kvvPOOtz4udqfGOvy8Z+9wYMiloH?=
 =?us-ascii?Q?VLtpSZX66D0wwQxkdiz/Du4ryJj21KU36QBAVv+rwwHeMW/1mLsVNKTpviPh?=
 =?us-ascii?Q?Nbqwd8dc6Q1pEMsor9o1E0MhqMnEc0zWLasAEloOXQorJtR/wfXfnS92icZY?=
 =?us-ascii?Q?hLaTMZgX37KFKllJRq0HWfyvCA23S9zdJ7gWRSGoxZDhPjNiZVaD1BeAysNR?=
 =?us-ascii?Q?Q1uC1GvXsPKC1+7/tevQzMJXOsyC2blX6BhR5QY8i9TTD5pUSzNOF9PQkpMX?=
 =?us-ascii?Q?qd8a91S4dDkfY14cska9aAIw1aeiJoaXwX0IV57kHo972bjmAjbK3VNLQ8xV?=
 =?us-ascii?Q?pCS0mk+UJz6V1X7zOxqAJgLvzU/xNy+8xQN7Ii0Kl90Lri73/wdhXIDhfLPL?=
 =?us-ascii?Q?gD2dcR3yUCFpIoTxS+VESaTom92kQP+4XLDRk9v8dvigACIUvczfEvaRLKSB?=
 =?us-ascii?Q?UD81H/B8rF6nMrNZCGNuCuhTASGTmxeIDrhEjU59Wzw9/A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6K18O2DkPAYL93Vt6qBnwgATWik68r3ZF5Z1/wcz2jDVUdu8tSBE/NNhDu5S?=
 =?us-ascii?Q?06/AchIXQ3KLsg0WxZ5yP1ALpqk3lvFt5/QdfYL9A7KxX5jolmBal1pF1v4J?=
 =?us-ascii?Q?McodmJXI6iSxKJEzub+hvoUUaAs8HE46x3kCWuGpW0Mju1KUfndXupFjMvtJ?=
 =?us-ascii?Q?v5fmteWbl8GRq+LJfpHVARxTf7x6I2uZvzDTyFvFeTxqcyXvnQvcrfyDRI+x?=
 =?us-ascii?Q?MhknL5NRQHAjiPRIvawoWyJhtu1BLXOlDSgMvgwn1GIMgPWmgReLyZoP2Kvn?=
 =?us-ascii?Q?zLLdRkq+EZkhI9qIOHxTcZ+7w4rMu1dz30WBMR3gCcJVCj0aoBlE6OmirAO6?=
 =?us-ascii?Q?3uDSLG7it8fodIDU3swk6twSj4ZFhVwc4BXuOVCKA7Xv0xVyr4giWAWHAIJ5?=
 =?us-ascii?Q?ZZKXkHhTuqbMTwGeNNq6JQipQzqOoXGXRLeyauvBs16wFD3ICaOh0G73K83f?=
 =?us-ascii?Q?T1tra2eXiotIlZCfvqTRArTqil53x0lhJu8q+EJHGB0flc+LH4m76BVc1QIU?=
 =?us-ascii?Q?fJq2igwj6B+YDeDiVPpsasw6W2jXGi2DyrxZ9+G2lI2567XxFu8Qbawquku6?=
 =?us-ascii?Q?thRgpgdIofmt+lf6HSYt/a7QdmitsOM8eWCE9pUnj0loUVBGym+RvLBFzl0M?=
 =?us-ascii?Q?wjuGfzY0uXBcNhowiA1QUy9wXyzAJAAoXwmCQXlJDzSo3k4G5sqwVLddZFnP?=
 =?us-ascii?Q?BJk2qCGJUIj2cS/tdBTKzQdCY5aeMMpTWS5zfksKjv06rW2/twkxjadXPRwb?=
 =?us-ascii?Q?eDrF+BugmOZ8BSMkMM7E/lKFzg+6XuMJwLdcteIzoSMQQ338Ftybj3lYICvF?=
 =?us-ascii?Q?Kmnx2P9NCn1KM50x9eSE2uagxwbSlclSOl3wZNMm7Zl4JhTZGE1ZQZXaFoNg?=
 =?us-ascii?Q?CY3Yg68MsQ5ssbOnhvw4wWYJ8jaoLLX+Jd+gBhH085yYVifQOAH8JCpCp8Fx?=
 =?us-ascii?Q?Cf3jxNQCdTV3eRVZ2om/XAb6j0ZiDb18WbYJ8D0ZyQ0VF8bFVj961hiGN5nn?=
 =?us-ascii?Q?O9yZ401H7YFuV8WWGqvV2aA/op3pIfamJ3HQHo5Sz3yfFWDUe3++/c0O32NL?=
 =?us-ascii?Q?BY1+14lh9Fl1JNvossL5AaO35Xwo91Zvi1GWFt2nK8CdzEOqb3tr033cW8nv?=
 =?us-ascii?Q?ZEObhKj4KUVHELcYeibJK1zaPq5wuTrworIF9rORRBvkfjfB9jSAFVFDt6dv?=
 =?us-ascii?Q?P3JjaDpjUg8q+B5TIH82jMmWJ5s5ANEOH0QzOUF0aLcxj0LaiiUbpQsfZNkO?=
 =?us-ascii?Q?8peOVbUCfzUUTF9Hh2S9GLMqEEmC/SRsOa3zJ9J4+55O7xDLeslkljUQemr3?=
 =?us-ascii?Q?rm/WCVbGrMc77na62fhwD/6W/MqcqqjE41M1nBUW/dcA4fAhAJZv/XBTvW25?=
 =?us-ascii?Q?xGLrgVrjL8XM17MjvpBIbRTPaKgMOG+YgyMg04S1aTpFO7qZWTsjJXG8+whT?=
 =?us-ascii?Q?ReJGx/28AJHjPMogfMVlQH9MnMtmen3Ig4iY6L9QeShyY4BbaJrl5mdBf2CJ?=
 =?us-ascii?Q?RB/XBPjQjc9ptQb33DDCQKCrJV7QQEacQzJbJNPW/F97hZk3QNADH0yt7JlI?=
 =?us-ascii?Q?NEs2udY2QSOFgG0VUODsTO9NEuwP2hGVKQdpYlbW5UqR5qfFxgchRfM33Eag?=
 =?us-ascii?Q?9QSDGLXYUOCqtkNMuQu9IRA=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0ksdggdFLSnZTViOS6InrGlyOczO2oWtL5uzrji1+bjPdwroTQS2RuqFOiRqgpDRERx5H7m4wM/ZwJGatCUPB6lVpFtUBZogjXWbEn6tvV5QRayCeDV4dTDd41EFCL02J50bYx7AhXytwl3Y78bBUECCjyCqiSL2mcHI/ZZKvHTqr4DnIf0G2FL6xdBJlbCkvMIc+VnGwhhtSJu9HT9bOsbK1svf14l6jmLZPT3Q9rbNZj5SPJGEbNG+OWoKIqpTHCAdyc6TyPj7iTP12BPjHTlpgu36AxgAva8rSe+Cqb7fgP1DNXv/5YpkjkkduWdlEHR5eRiBfCEA8p1Om0m+wQvMDdyEsuv2gbWZiqsTbecc/ntPJcQ6VGreyhEtmjxEg7ReOxR9BERzba77DBmKzivazCBKhwtN0RaAd7q8ZI+8IssAy/RlQRGlmew2NnaurVilZonxwpkvOwvrZwwa5ByXAtVt9lgtQq41R/PrY2o6zwPxo++wWirMGmheDzTLQsVMIVbQxWxemLOdEx+ZAkiuYcoZupLqSZ+DJv2J3RYUwM031/pd+oiRl+K56vRPXsgjEX1mVxKWzl9PQtp6v4/ZG/Zq4Iuicckw/EVw6Mc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7332a4-28d1-4995-fa95-08dcc79c20ea
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 20:00:56.1998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p/Bu5xjQgt9K9czCauAYinVkX/8eu0htQtTUuvI0WkT9z6LLcbTYtZSERjHEgtWjUfaOSjtYyVEIhZxbsbTMKzk5wBhulDbZd1faSb4/3h8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7086
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_08,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408280145
X-Proofpoint-GUID: RCX9x4XvSfCpaJyYrap11poH0MHmIw86
X-Proofpoint-ORIG-GUID: RCX9x4XvSfCpaJyYrap11poH0MHmIw86

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_ident.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_ident.c b/libdtrace/dt_ident.c
index a4bcacd9..7c563c7c 100644
--- a/libdtrace/dt_ident.c
+++ b/libdtrace/dt_ident.c
@@ -343,7 +343,7 @@ dt_idcook_args(dt_node_t *dnp, dt_ident_t *idp, int argc, dt_node_t *ap)
 		    "matches an unstable set of probes\n", idp->di_name,
 		    dtrace_desc2str(yypcb->pcb_pdesc, n1, sizeof(n1)));
 
-	if (ap->dn_value >= prp->argc)
+	if ((int)ap->dn_value >= prp->argc)
 		xyerror(D_ARGS_IDX, "index %lld is out of range for %s %s[ ]\n",
 		    (long long)ap->dn_value, dtrace_desc2str(yypcb->pcb_pdesc,
 		    n1, sizeof(n1)), idp->di_name);
-- 
2.45.2

