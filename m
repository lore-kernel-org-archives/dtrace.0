Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE94E20FA9C
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 18:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742321889; cv=fail; b=WF77YLcQKRn48FPBtMB4N77eqOPQ/SiDqhsGgTPKHSKet3sEgGy9DRdU4sQt6/UYDshpZv9GJOv99327dWt95QwPavezOyhxtL/3mlw1jBfG9aj1Dqh6GHsYi2aSyUAG+YdXs50nB2tZ6QjPHgp1GIdo79WJI7MBrs2fayW7wrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742321889; c=relaxed/simple;
	bh=hdr8zw8w5BMZVt1XqQyZ27rXd/bUlE4GIFDg5rqREbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=F9kw6Pi07MQbVPAJ1QsJNyik3+eq5F8aAlLnK3Rgd3u7p/HI4hqZ1BDQ6Z8Ouam91aKQSHNgstBzhQk12CbJP9id/AtjNWjaVHGvKFSYRvERE0d/aSANGmM3igrkY2e5V1UaH010a7WcpZQwxQ8t7kal1lQWEDPeeGOLU6m0f6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=R26SOg+O; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=b5DhajVG; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="R26SOg+O";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="b5DhajVG"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52II5vCY001841
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 18:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=lu+4wvr38eKdlCFwlT
	CtPnXijhbryP6dY6p+NJywdHc=; b=R26SOg+O8ex5aeSv+LlPFyv33AtvRQ9MWN
	SCcLiG73ZuzULWHEAsnRiUaB2r/2pspLAVd20TKEsxw0LCeXcxPEV3UR1HyyB/OV
	UdJyrb1rtyOnML5CXca9ReTNQ/aWa1JkzhNEtHo1Q4R0abi6/3upMGhh8axMPamy
	FA36NxkLsbH7qXTqe90aaObk1B9b1jwISBVVDadN9jODDPDviaE9MUnWNyVU/5jr
	dCuA+G63m7ya0lIg2Kx0qmzwKVxPLzwheWN2IvKHdlO5Ai4p2UFOrD7pEUEZXHoG
	4Uf8MlDHq/IWwGV6uN+6247Vcyk1RYrBvX5kBE7imJDnRJFei4qQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1s8nw2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 18:18:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52IHlH2M028654
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 18:18:05 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45dxddsnsm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 18:18:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJKUd339H/WEz6tcmSpsYjDbNDY9j9b8mNm/OAeqig10BbkOGVjMsvnlnU65pDy6IXUgqsTLxw0BgMreVHyoCcEC8RnsTIzdLBVCn3aGnw7jEDa6nNxH443/JGljjrJ2QqO0IszTE1Nk+cVNfE7i3iromg4AXfpU92ayN+BjuwZIBecv9UMpHBXGol1pZOOVp14a6AfHKoCWKio3HSz6VDJFgA4D8Fd46vkXt70n5Cqs2wZJNh1kFtn2FQWZA1E8Xbnq4PEM90hAK9ruCto222dzu9WtCETUdmO5jTH/i5a7Cd+3r5avXmnIHlAhdkago4bqu2F8dNduGmPU1eHjLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lu+4wvr38eKdlCFwlTCtPnXijhbryP6dY6p+NJywdHc=;
 b=W7wCOFQUmKgKTO/DtLwTLLD1v3GjxCG1JKwOXMUSfthyTIvzYEs5/WhWa5qe40JlVUVCBIQTAjBHQ9LrvWl8K9tZQfc06N8wUtdCFR90q7CHnsl3QO8PgN6+vKtqw9WJbvv+tIt/AefXWeOOWuvg68YkoKLl81O6b3vGVvBD9F/O1L3kk+FN1tLSdK1Oyv+1WZ/ezridGFHdME2eIwl5XuqvYMNArAVNGq0CH0YZTGjWf0uLz3V9mZMleSpY6acyJxibjnb86+2gFoj77C4oLOGv01mEumSxK9KH/y63TWRWAk5zrUXp1GQYrI59RUC+i+HmrtwFCIluFmlGKfMo2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lu+4wvr38eKdlCFwlTCtPnXijhbryP6dY6p+NJywdHc=;
 b=b5DhajVGOz1XTsnjXyWEIzAqlq5uueuvwG9Ry/gMPa0r1bS4ZGTewZXPShynGzHLfpQQMkTgFuouFy+997zHtQgZZWIIMFKcvWal1qMDCZJKVNceV2gD4InKR6r7gLqqb60G82mIs/nFYJ6AyRSd81ACqix6U7bMlyvPTkHv2xY=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by CY8PR10MB6826.namprd10.prod.outlook.com (2603:10b6:930:9d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Tue, 18 Mar
 2025 18:18:02 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%4]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 18:18:02 +0000
Date: Tue, 18 Mar 2025 14:17:58 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] tests: add test for buggy deduplicator
Message-ID: <Z9m41r6P8HPZY0wC@kvh-deb-bpf.us.oracle.com>
References: <20250109164711.232013-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109164711.232013-1-nick.alcock@oracle.com>
X-ClientProxiedBy: BN0PR03CA0033.namprd03.prod.outlook.com
 (2603:10b6:408:e7::8) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|CY8PR10MB6826:EE_
X-MS-Office365-Filtering-Correlation-Id: bd2683f7-acc8-4516-bd3b-08dd664938b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SZqaicnSjqp5wCFyu5Qd3rh5IZLsXxBo1EReTRO1kd1OZfHIJsJs6jamUaDa?=
 =?us-ascii?Q?M01tbVcle8h2JwwNCa2CD5tmFMOFOWg0Jfqfv0wAaY1Mx25od2tsRPT6X7Oi?=
 =?us-ascii?Q?lcK38O5U9ZWMOmDENUVo8+ujC6HfKDAgLrioDdMer61WKg1It4Z/lzlscUbM?=
 =?us-ascii?Q?eOPE5a543zqH6GYxrhSlVBJfBMSYOCuk9M70xqyykKpCQshyR1blorntc5af?=
 =?us-ascii?Q?6+IwYG+IqrzvNrcYuMoPaqYjMQivVe98MPTMm7NU5W4q7zXQE00fS0G7u+/X?=
 =?us-ascii?Q?NYK3P2I/Y65IDGkZua/MW8PFJ+iNuFJQBuANoAXj6r2+OpIqbO4pdk10dg3L?=
 =?us-ascii?Q?5cOk5T5StVa8UCxeSzYOXl66jC1p4Qpzg5PsAm7Mg3xEZBHQIsUwPu3sAVWG?=
 =?us-ascii?Q?J+l5NMNsf4qZgAWi7v5axL6PWeYlamdwD/G3A2nP2n294WaiBveGQnl32q2O?=
 =?us-ascii?Q?eecb3eDraweSf33J/kPKK6LSCmADLpZkMJYV1hTQhWQFSGZLUjtYJxO+pKtg?=
 =?us-ascii?Q?J5rOzU4uBSYKAWYPCcQ9wjkcDUdRlcO6hV2FtHoBKFljoBRLmqVdwFthgoVb?=
 =?us-ascii?Q?m0ryZJlci6azqdGyuZ25aqDc8NPAe7khxdY44xTuY/TY+Cl7+XwXliifJ6ft?=
 =?us-ascii?Q?FFlfNs2M/QCjnDnXfKTRmOmIWtvDvJkK2vjaTVDp5Ew97HxN1TFwqa50XOSl?=
 =?us-ascii?Q?wbTwPcraYwIKe0JGwayT7Egjmo6ourjYB01JjRyBLz+jt2bYUUNMAWVRaXMH?=
 =?us-ascii?Q?Weqoog9qyo0MF9BMWXI6xgVVZplsFnFHC6d1Ch2OdVFMAVNR9DYOD8yP8M/X?=
 =?us-ascii?Q?ne+fvA0gC7H9g4zJQh8aym1dq9gWcjDXlYxcrHCYikydUu+z5AqeYSwo4yFA?=
 =?us-ascii?Q?z4+2Jv7GRs6ssjoQxh7IFDqUyS/SKDgbAKmcNPbtezQbs6A7VDlerMComsUU?=
 =?us-ascii?Q?+UqLtCs0bv7TnwmioGEPQAWIHPGjYlnqwU0jU4desoBgn5B0t/NB1P0g8Cos?=
 =?us-ascii?Q?TBAqbXXzXamVnM0p4dT+6EHA78WH7DSwwjdcFtMEBkUL3iRlUw6UXJmXhBH4?=
 =?us-ascii?Q?qmpWJRZijWFh0srKwm5V4MhAfvjE9dhkne3Qcv9FQWWMndXq3swpdS9CN1w/?=
 =?us-ascii?Q?nVHlcfk7sV28mmHvMg2vvSQCTns9Tm+/5ymSskUWcpEbCSVhFXKR01nkhkhH?=
 =?us-ascii?Q?lBxec+/SYCbPcTfQ1gVw9g5TIK6/BmMGL7QhQBv8A047NFZajfWrndijtj0k?=
 =?us-ascii?Q?Lo2NTDRe+dIPG2KNXSdKRlz+Qzx0Eh9gl3ltWM/7sdZYDosnAGU/kaysV8Ds?=
 =?us-ascii?Q?NBXrC20l/XMMbHfuPSulYL2AM4rfLMKoUB4dU+u2wwsEtdC1rJWvyBq5s7aK?=
 =?us-ascii?Q?m+3MGmstiAUEHiog8ARxEiAvj62g?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eO5v+9/G7zTGAAljTPbmRS+EEUlJOqHTTC+nI/dlors+2X8PhaJs6lnw9y5k?=
 =?us-ascii?Q?o5KtFcDT8XLv7wolqPJjPpqSvJWKngw1Zgqq8xo99tPJYbAgvIdMt1CaA//+?=
 =?us-ascii?Q?1Gp9Z41fHSESQzn4hIvul7KMQRm8U2WWWNF1TLjPUZcUGNftX9/FH7q8a+Ug?=
 =?us-ascii?Q?vg/II74sUXyhvnKT9b8D1e8bM2qxxVYbauTO0lLjS4Zzybd3lU+yvd2fzyzT?=
 =?us-ascii?Q?gvUFI2b5lel6MeBl0U4rXZR4+CG0sqGN8qm7TlZddLAhfCszMDcrv+P3kPji?=
 =?us-ascii?Q?4sDrBrhKrsVhVja/M0NRiVPdk3/ZQ3nG8uilo7BaUoYggmQsgWEqSYyttF8Y?=
 =?us-ascii?Q?9VEcXhK5DbWzU8nWGVSGREoMU5WND7Ne4OpwyJ+Hk0m8SssdT+rhN7GLeKud?=
 =?us-ascii?Q?h3IuI28cFkMXmxUv2Q1JyU9YMMW0DawdXQxXlv/NYYtRKyRpFLJwQ0UBIXTJ?=
 =?us-ascii?Q?1yt73PkzmoTsqSuobbDv2n5PaLVnq0vKKi7w1V7aNWqsoDmw+/XXiARGS2eb?=
 =?us-ascii?Q?UZ17zlyNCirLx/OKCstCgjx1q4xNS3rbs6kc7Fi5XaZR53UqOl7y5WSy8DiV?=
 =?us-ascii?Q?a1pLZzrLZTFixG8/hQPrxtrgy97uxxEDjCI/IVHfZ4ZE+//mnf+obhmiKjTW?=
 =?us-ascii?Q?muJFTkLmISP4yRzpbhAdm4421C5pibz+lj1g4NabkeWuSZuDh7wXkKvDA6uT?=
 =?us-ascii?Q?fHSu+CX7GPh9G9ZggEBVqLufqjc8ysUsl66U0b2Q5mdpHBQHCYu+7YLDV5V8?=
 =?us-ascii?Q?hEGG5uIlMYw8PpKYaLIPCbmCvYLe1FwOuxkwtGnqUTHOhyueVLHerpU1+2VI?=
 =?us-ascii?Q?CMj5ZSSJS1l2EAWZIOMZFmGpjkD5MSLG38Wwhyx+YJnk6pV5hPpzVVPRJHch?=
 =?us-ascii?Q?kn7OamYd6DAEpq92LBpzPAGRd9S32RDxh1qmppGsp/1sBbCMF5oKsDf4ctJg?=
 =?us-ascii?Q?GEVIBj0oKm6EGrFKIWjuil00udpyvYxjlvlorIZqtz153M7zUM/vkI3PfP8P?=
 =?us-ascii?Q?YA07WzDIZKdW1p1rc1XPcXij2Mmd2sDPXeDWuUJOChUyIjLGa/L6mv+ajL+/?=
 =?us-ascii?Q?JFmbQ2S6DAy6HAxdiekG8z9DbtCmZimrDBXwLMTHxmbd2ZYP+IImKbB4Hq+L?=
 =?us-ascii?Q?wiNAeBF+QlbcNuD1GZ/frwmAyzo4Uu07VZsAnTWPdDPkuRf9Yf0qlO/PteeR?=
 =?us-ascii?Q?kg7uBFAUPgfsvOiO3ijM+qirIkd1QFYHGVBzQefROiO29TnrRR+7Qucd2VTg?=
 =?us-ascii?Q?v26oRQYtCorJilx9/cjdCTwbwoRSEbr6ZwVC0lAkv8+BLbeV2hlPMXCFEbxX?=
 =?us-ascii?Q?XzH4AC1OhafC1Xy1g9CMg0MbW7/0g0f1FxThrV+29YI/4wDVgWSacYwlB9ha?=
 =?us-ascii?Q?i549yBbiIRQCie6Yx8pCaAsmgO1EsVj7v5f6d16E9Ba739PkLSpRMjws0zT+?=
 =?us-ascii?Q?PR7LJg+A43VCryNNjzU3MkxOKvHe63yzACdrNGLPlw8NqpOin3CMoH0ZhF4S?=
 =?us-ascii?Q?nIJNUBwbAPV6Oj8tUSrjhYDTVHO5pRihkhYWC/Z8IX93wDQXALxI4lOkRDq5?=
 =?us-ascii?Q?JUgBTrVdc9HiHeZB5iTr+CTrkZt+WSx3UKSStHJKXfx3sevK1heXs9m1Y41/?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3AXm4z64VGmN/dEo//uzrC7EumaaftDk+5yX+BgCgZTL+TCIFIwpQNZjrh4emNwbCOk6EXFQubyTcPqzR0krtA96JiNRbf2APoSEqeujRDNTsM9Y4T40Ni5SI0UvPuQd2hepWS5+n3+moDbzPUqxUFnwJQNa1OanZDJEV9/Ry2onTBkLyyBmf/yGgaZocaiui0gVEGk3QaUPANOSvt/7bBnbJGsCeiPBPLx4TwwdtebJQUytird1f2hnE+pqSOwhk/9cVxYEaDep+wXP2uVheAviELoq9qfNvUyw7DZvLQ56Jg/1JFHKtpdQEq0AX7d6cKAOEMnzIJyO4rJ0VuM46UKHToF/XJlqWGypC35lpaZkF0AsJZVwdVhhXRhFJwzuCkvAluJq98EHD+A2HYNh8awOV7H6YHWTDK3kmQzrWLhoUF4I0Vrn4n1EwPK8xLZLascO+KZw/m4udK9K1tyyuYBLqLcL2jOaY0UMKrTSc13GN3zdRUmh8o/jQVXl/pyjrGxeZhqpE6gGd0ZI16N2GBcx2F5yVzIDCkrSX5iw+R7Rn9LKWmaijOzNY7/0VLbR8vZHpyTXVy4IKQYsNhWBB3GpisdTBdQoa8Id1xJBS40=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2683f7-acc8-4516-bd3b-08dd664938b3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 18:18:02.8121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r3dAuK0dOgUUqG4sGG/WBkbBwgoL8J5FYR5Dfo0rXP8OnizyHB+2F2udSixmHYFGq/rhgfcu/pRquymHQM23XbaEZ1LA5wfTvsMdxJ4gflE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6826
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_08,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503180132
X-Proofpoint-ORIG-GUID: uqRE05uA6mNBDlKGemcAClKnBNq4bXNQ
X-Proofpoint-GUID: uqRE05uA6mNBDlKGemcAClKnBNq4bXNQ

This seems like a test that would belong in the kernel tree rather than in
DTrace?  It seems like a weird tst to have included in DTrace because if it
fails, we cannot do anything about it in DTrace anyway.

I'd rather leave out tests that exercise things that are not DTrace itself.

On Thu, Jan 09, 2025 at 04:47:10PM +0000, Nick Alcock wrote:
> Some early prototype deduplicators dedupped types in one dict (more or less)
> rather than putting conflicting types and module types into
> sub-dictionaries.  Fail if the running kernel is such a kernel.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>  dtrace.spec                  |  2 +-
>  test/smoke/tst.ctf-intact.sh | 58 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 59 insertions(+), 1 deletion(-)
>  create mode 100755 test/smoke/tst.ctf-intact.sh
> 
> diff --git a/dtrace.spec b/dtrace.spec
> index 902ad7d8bb980..cf960f14b55c7 100644
> --- a/dtrace.spec
> +++ b/dtrace.spec
> @@ -151,7 +151,7 @@ Requires:     %{name}-devel = %{version}-%{release} perl gcc java
>  Requires:     java-1.8.0-openjdk-devel perl-IO-Socket-IP xfsprogs
>  Requires:     exportfs vim-minimal %{name}%{?_isa} = %{version}-%{release}
>  Requires:     coreutils wireshark %{glibc32}
> -Requires:     perf time bc nfs-utils
> +Requires:     perf time bc nfs-utils binutils
>  Autoreq:      0
>  Group:	      Development/System
>  
> diff --git a/test/smoke/tst.ctf-intact.sh b/test/smoke/tst.ctf-intact.sh
> new file mode 100755
> index 0000000000000..d737a2b162fcb
> --- /dev/null
> +++ b/test/smoke/tst.ctf-intact.sh
> @@ -0,0 +1,58 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.

2024 -> 2025

> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +#
> +# This script verifies that the CTF, if present, is non-corrupt: in
> +# particular, that it has at least one child with 

The rest of the comment is missing?

> +#
> +
> +ctf="/lib/modules/$(uname -r)/kernel/vmlinux.ctfa"
> +
> +if [[ ! -f "$ctf" ]]; then
> +    echo "CTF not found in expected location of $ctf" >&2
> +    exit 67
> +fi
> +
> +# If this is not an ELF file, turn it into one so objdump works.
> +if ! [[ "$(file "$ctf")" =~ ELF ]]; then
> +    objcopy --add-section=.ctf="$ctf" /bin/true $tmpdir/ctf
> +    ctf=$tmpdir/ctf
> +fi
> +
> +# Dump the CTF
> +objdump --ctf --ctf-parent=shared_ctf "$ctf" 2>/dev/null | \
> +    awk '
> +BEGIN {
> +    intypes=0;
> +}
> +
> +/^  Strings:|^CTF archive member:/ {
> +    intypes = 0;
> +}
> +# Scan for each member, capture its name.
> +/^CTF archive member: / {
> +    member=gensub (/CTF archive member: (.*):/,"\\1", "g");
> +    next;
> +}
> +# See if any non-shared dicts have any types in.
> +/^  Types:/ {
> +    if (member != "shared_ctf") {
> +        intypes=1;
> +    }
> +}
> +/^    0x/ {
> +    if (intypes) {
> +        exit (0);
> +    }
> +}
> +END {
> +    if (!intypes) {
> +        printf ("No non-shared-dict types found: probably buggy deduplicator.\n");
> +        exit (1);
> +    }
> +}'
> -- 
> 2.47.1.279.g84c5f4e78e
> 
