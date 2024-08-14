Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57571B5835
	for <dtrace@lists.linux.dev>; Wed, 14 Aug 2024 15:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723651072; cv=fail; b=BdTKAcmRqg7AJfFcCbf5ozkfeaV5nlHmXlZB9cv94hZen1TGuKLsGlCbHgScXg+V1Zt12G7+JAV/8Ul9qeRijhdfSzpTYyS/MMOW45pdCGinSkSWmEj+JGyZX7QFegD0+bFU6vuVJriFScgMavG3uZr2m10FPzq537AfnQVmCHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723651072; c=relaxed/simple;
	bh=/K26ht3KgHeZ57LOVJZPo3RIjFy5g6x+22Kqrr8V3r4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=L1rHPz9X6OkfTvEtNEByXDW02AtEO3sTxlphmBx3nXZY70WpN1t6tadC0yT68uZLTUjDa1AGDnoywILyhQkamhioek+NxWTcvOQZoFZxnnceAzEXVWYqAHHlfxR2ghKZozTcthRJd4Rkk1R2MuEJwp37BoJ9zXFu4JOtN1OOj3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RaToJH7H; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sq+/yuW/; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RaToJH7H";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sq+/yuW/"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EBtbWC006105
	for <dtrace@lists.linux.dev>; Wed, 14 Aug 2024 15:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=c7yYEH72Di82V/q
	jSz4CIieAByFyr1ezz7LCGHszigs=; b=RaToJH7HzaDVaNMDYNwucvj8dzKlcvl
	sHm0oxTybGUDnFFPyg+ipcQXhdaCPpzP0CVeqiU1bFUVZ71C/8IZqxE2ixRGN1OM
	AxiwXFeC8akRvZB0SRwo6p/PS9CCap35E4M/SoYwHItCkasyAQp1PDNQKRMxAtoR
	jHp0xxLBMsP19yHH8PgI7omI5hrQpf43bt/f9YSu6lv9bhKZiYBqH7Vs1LfyVq9l
	+vy/4qC0d5y1rEBmKggMl5C8PH00YnojYJT4K32UwTM7rzPQ1fXbrwSyWeFXSDh0
	aNNh6fF2W1Atf46vDa+cMI37hZIW+Jyi3A9p3rjD52WtsNorOSblhbg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40wy4bgsby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 14 Aug 2024 15:57:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47EFsmRJ017118
	for <dtrace@lists.linux.dev>; Wed, 14 Aug 2024 15:57:49 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40wxnb3j30-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 14 Aug 2024 15:57:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bbWGtQ5nRGgM3YxhBvteT2Sr7J/cDA3Q4hZO5AgYhNXykTAkeO/GgxbClmgAAwpJXKnlnZrdMjtxcVVBbyG1nKM06grNaoNnkSnMqPNc3An4I3ITuOJkuGAMeUNyTqSUukAQ8j3jJ6cN2eF/gdvUf7HHt8Sa3WmhTmnEGVU3+z0SXUHGjzl4BqnImWcwZi+VOQQ+H1BCUNYXOSea1JIsEY+0nlOQSq/JBC/+LULk5bt0S53TU48gLUtxSEK3u3oXaZPw6yVD99Mlgkw4UP9ycOkxAEVO4Fg7wGXA4mAgojsc2dAtFen0EqqNYnTn9rikpI8YA9NirdK7Hyfr/ABeFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7yYEH72Di82V/qjSz4CIieAByFyr1ezz7LCGHszigs=;
 b=NSynQg3u/EGtE0/nQefdnqkmXwN3VJ6pDU0ALXUlPynKTUet5zYKyzwbEM0l1buA4GZJszPyRxAfltsaplAz24OZ28tTdh/aRzBgvsdrqkkWGnEdtuAD/I0c0aUQWeHoXiJRyO7B8x91ypll+mJ6nE/wMSWg7Vvo4aOZJWupALtplVkT0A0BkLCK284GLt6pccyler6vLiZjKZy9+hjLXp/YPIl3cgVvKlKOBTsDDwvtqfLSea/jVChRKhA0+V2ArQqVLJIqQp4KTc6oaHlvH5I0KJlBu1XctVDWfaIVRvmAFVfLEXckyp895i0MoeN9ei2ST08EFjeqx+s2vbNZuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7yYEH72Di82V/qjSz4CIieAByFyr1ezz7LCGHszigs=;
 b=sq+/yuW/AeEM2FLzFHGE9yBP+JxJvwfFLM5tXjVnK405hVfH/YYynEMU6aWTuNWZZf/plw3kuqz4i9hcZ2l8QhAxo07WYk8gxifnt+l0Lf2NyIUV+docX84Ko48wSs5w8i71uC/sp6XYQwZ4oSMJCSMbOwP6xSQX/ild8ms4+to=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SJ0PR10MB5787.namprd10.prod.outlook.com (2603:10b6:a03:3dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.15; Wed, 14 Aug
 2024 15:57:45 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7875.008; Wed, 14 Aug 2024
 15:57:44 +0000
Date: Wed, 14 Aug 2024 11:57:42 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Action clear() should clear only one aggregation
Message-ID: <ZrzT9mvBboADVnsE@oracle.com>
References: <20240814025925.25408-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814025925.25408-1-eugene.loh@oracle.com>
X-ClientProxiedBy: MN2PR19CA0049.namprd19.prod.outlook.com
 (2603:10b6:208:19b::26) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SJ0PR10MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: 26cbacb8-7d9d-4aa2-b149-08dcbc79d602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hclHZuCcbnhgUtRGU3cOtXRcnMiOXe1/H6v0lGbIgt4uWKUKQvmv6xnxbx3Y?=
 =?us-ascii?Q?zRhQXV4Ywi+fkqwi+e85Q4lec7fQyh8Ey+c6NIpBi2nzQXsKsU030rhhgNWD?=
 =?us-ascii?Q?LPSqvpzDcBZU5yOPAnTK9xT+l7V7WfSY20mXkdn+uBaf/fxm+6gL7RLt55V3?=
 =?us-ascii?Q?JeUjhacpCuP8LVbqc9hrpEgs+bX3m1OMmdmlXMpgkFMpG0gkaZRt+JjJngIW?=
 =?us-ascii?Q?6cMhfyBxNpbdHx59IaIayzBnmTSzTyh1MqzlV+66dfD2NQCUIRR6qEX5wYqJ?=
 =?us-ascii?Q?JAQRLtakuq6tyaWUr8xZq3qCnL3zcEkeg06Xq1fYRWs3kjqxrEezlCjX/hqZ?=
 =?us-ascii?Q?vlZ0UFo9WamcduQLA8r7/7v/HmQxCTWvr3eNpTvK3qadWeBhNi2Wf4HrI7XU?=
 =?us-ascii?Q?Ub5Q6TiqSvHKBRTfW9BSLa8YUOnAtltIVnSOLyNRkAnbc73im/1D3i+bugJl?=
 =?us-ascii?Q?NdGDDy6FlhBjgihXddyDhG1nTNUnlDdE4U6JANHVIE8FBpxnDxANKvyAw1JY?=
 =?us-ascii?Q?Rx4X/i0U+dvVaxtsshncW+0Eq/6tQEdqUT9cP+i32CAwj8tPd43mZoqpBu5H?=
 =?us-ascii?Q?kRnjayxYDI8nkpt8RY/gyrbBXdgQdJwbSVAKKRy7rBwBcb1wjpiivfR+ebOr?=
 =?us-ascii?Q?hHzU/6oAMkE+30uSbj/e2ty3tiXjH1kzylQ1uxSyKE0pFNBeo04F31TK4Ned?=
 =?us-ascii?Q?TfTcJ9wt4fzkmtD5NjTY6Z3+44mLTZpaSzaGLre/Psmkx2Va0J6unvJKRBCX?=
 =?us-ascii?Q?xsL3D+FgnGtcpjmToAk7cU+2488Boz+0lu4jZ0OnroE9MHKu3bN8ElebGw0g?=
 =?us-ascii?Q?3n6cci21rlOb7lsmrMfLNOtXw31IsS8Ip/hcrV6UVUxmswJNBIsQIxMArtRA?=
 =?us-ascii?Q?ibIx97P4hINnDxkSKBVRlk5fqfmciNqB5ah+eRNDVy0zwr33YK1FosaQ8OIp?=
 =?us-ascii?Q?wwvTv3cUCXuR0VfOkEaqMWq52ls7td263AXNBl5QNgF6RwRPQWbbrGCJlGNY?=
 =?us-ascii?Q?stw4YjZkZ5OidL0DoGgnsM90VYW9AoJXhFFx9dgQBr84Tm4E4bf5KDo17Iby?=
 =?us-ascii?Q?OcGVYm6CocOxrpRxbE8uJJtaS4YAOpVg8Yhjdak879jpOPIqILVLHCwqZr6X?=
 =?us-ascii?Q?3fUtkGlklytO9BwnBi3PDCwVXGCNQz66PdYitA1n7Agz4st4rBfRoLhzWGvm?=
 =?us-ascii?Q?jReaZJR+GnB4j3Wbxnz+RvKs1QCjbTtcroSjvpQEhwAggXI9lVC11oKWoY8b?=
 =?us-ascii?Q?SLSyZjhKeYnb1sk8pvKNjNKCuvLR8+tOUs22+DIYzGQa+DUZgojF610+b1lM?=
 =?us-ascii?Q?g0xa6johGp5JYcMHHIOGpHosMog6zPfkCNSkHn3y154PNiQCvB2LD3rw6Fhq?=
 =?us-ascii?Q?dx3y2FE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8cv6O9yplfsChcue9yVmdLBNznUC7IOf3SuMcJt7EO6iM5Gu0fTJfaUSWypd?=
 =?us-ascii?Q?1vY+My6wfd2G2RmcnRlgQxBmqQUp6Vt5wWUSPXzm8IP8xIXQ35zQHq3EKrY9?=
 =?us-ascii?Q?+zmDCpTnQHgwvcwRL3pWj4lxvphHKEgPYRWgHIYhOuHgk7aXjbX+LZLvXatd?=
 =?us-ascii?Q?wg7u4IdrEiHu/mcCz182f9H/K9FfTiyGCaRymJpXkjh2/S7akVfDg2r6li4t?=
 =?us-ascii?Q?3MyYejELKPc9l7HEEdUFiJkbPARitNbGL10KIDisqNRW//3Jr1/wfXTrZyOg?=
 =?us-ascii?Q?qUMQKvoKmL/yPlpbccMDDz55xNSY0LF/nwdjAnU0DLxkI3VLYXNSwPhifk/7?=
 =?us-ascii?Q?8P9rFxryzsPg4ChSOmzFv83OJfeKiteAIpdREMI0PFeOMWlUgcsa8Xyqaht5?=
 =?us-ascii?Q?4Uc4Y7HWOvG9/ogEJAbDiAVM//cnn9ogAE6dTL0ugGpVXcy5i84aM7+4z/7e?=
 =?us-ascii?Q?w6kJEivU1JLVObW0oLVGNclA5rQfm3MubspWmoMXUy1DjfxA71vRKg+7aYC9?=
 =?us-ascii?Q?kPPg40ZVh1juXj+W1N37GefwKjQMoJ2uufTLvjYANAeqZhY/SKQue8KUQ0Yz?=
 =?us-ascii?Q?wuRIxWk9e2Yvt1vJd3ryqzclYZImaaHr+ict9mjnbP6umBKa4ZDgWWmiBjrp?=
 =?us-ascii?Q?RijFRvuc0t4lTyFk8Qqzx46PbS85BkTWtLsv4K0+5PIsVeVmh2pGN8odtjHY?=
 =?us-ascii?Q?5kDNVAHBaKmf5D49M3Lw7aAsUtwRdBtcA2PepoxZKiij0nsz+xYrewlQmR5D?=
 =?us-ascii?Q?wQnw4a28jDtVpP5giN/YtVbDq+MTm0slMAAPN3N8iX3O8S7Q2qnt+we7rnti?=
 =?us-ascii?Q?qVRhr8pSTx33VJkXufZ31UNxkEXaYvSUtBXFT2fgXdF8fyqDm+fpNK9QJmg3?=
 =?us-ascii?Q?z0uXCSJDDD8W9DUt+iMVy2sEHBK9VUnnpBtVmLk1Awnp3YY8+ML4U1pNXGjF?=
 =?us-ascii?Q?XwRN2MBLJa2ix2b/7rP0+DVbSySDClVeQSpoSJ0EYJ4CwDzH+S/Td3M1f7mn?=
 =?us-ascii?Q?ChN8avci2XqJ/t6I7gF8IOcu2JKp/JObcJX33fYl1/Og+P82mLEsn6zn6RUh?=
 =?us-ascii?Q?/MWDlr+Yw9VJ+iL6h/yMxDdEmokXV+kVLjns6E0bbWNsSMCLt6uxhGqUMSik?=
 =?us-ascii?Q?svhZCgctZhIkMRWuKW31AUI8m2pjoPmk+I2dbzyU6M2ERzHiweTV3utsDLz0?=
 =?us-ascii?Q?Q9QN1VqG2A0NP3ZA1eJt8wEdKbXl7W8UTjwwBiA4D3dEfh9ZR2mIPQUc74Oy?=
 =?us-ascii?Q?TrN/lrzGy33GHI4QiQ9cFHVM5EqONQmKwvpjkqgR68V+VNgXJsGn+woWF33L?=
 =?us-ascii?Q?vlUSTUM/WzgcTtgq8PwNWbwYdTH4deE/8fPZWJvfrznYkd7es/66eA5uywpi?=
 =?us-ascii?Q?CAZV34F5kKUBzceg/hyiZOtj43Ia/4QVHOzzfoiHOld+WkumvNFvrQ7mj2a2?=
 =?us-ascii?Q?wbO4BKkL6mJd5HFH7Ay1ouCTZhI8AYUFagj3n5ZD3EarqBogST8L4rlFTKwq?=
 =?us-ascii?Q?0R/wwCq7OZ1Qyh5dazuy6OQFXc0KcdypNFdKhf+glVqVJsiFXb271OMamnbW?=
 =?us-ascii?Q?zmc6zBBm7PFt98o3KaX8za+RuWNPNJj9YlK7R7bvIR552sELYq8h9nIprtah?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zkPYdxOztJSenmvA8x/bS15xFfcygS9ALKBA1XVk++AqSugCnLiFAXVbuLHChjqFCQEV/h1C9rlXjhugSoSgh27+wClt0ZU/LA8gTNw+VHnpwtxqKP9SLTD9wPyyNRuWU+CG9M8QBK7iDXGa0+vFKFvUPGvYMHgwEJt6iEvS/WVpkJ59Eld1pHhGFWL9Y0dLEo8es0Fh4ZWirOEFZhbFe0Lpku2tdk0AbXQ6q5yL99BeT3grUAr77T3HL5K9I8P3EazQW6pOMVIEa4CiYPmkUVwBkH5yQPHDVQIyuKvKpkh360MUGi7Dbx7XgP5D5ZK/WClyWRbTshYSbi8A5SvnxGpWep4rLTVbcuCYnxlGJ/BuSzznUvM4zMn7xgkBEIt2XSHJLFMO36NMP2u1oailU3/KF7Qs3YfkOpWXSUpgy/OpEceXIYoojnmjMOusukFAousXML7VxFwHGSMZTV7xd/R5U9RC5zpw8+DF5NHpIbNItJ1yJc4fscjZlZ6hpuqhoUoh+ixwN7MmOiPC19CHD/YtUruOFobSlw4C5WrptC6tX/kCyLKPsLoAOc8b+EL2x0lwiKm7Ww0nxtdtGEaCg66dtTIurnohvMKjeVdX1hA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26cbacb8-7d9d-4aa2-b149-08dcbc79d602
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 15:57:44.8847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8yjhszscdeFBl3JPAYI0aZWHk9yH87bt1SAPm1iPzHxpqLscq5sDYKixqjUmV+vva0FphpmZEM986OC0B4/JpOMINRc1vYw55NlFs7sU8bU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5787
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_11,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 spamscore=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408140108
X-Proofpoint-GUID: 2UnmdS4YCTPNtiE4vczDkZ66r7PQyr7a
X-Proofpoint-ORIG-GUID: 2UnmdS4YCTPNtiE4vczDkZ66r7PQyr7a

On Tue, Aug 13, 2024 at 10:59:25PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> FIXME:  Is libdtrace/libdtrace.ver correctly updated?
> 
> In dt_clear(), we:
> 
> *)  extract an aggregation ID (dtrace_aggid_t)
> 
> *)  increment the gen counter for this aggregation ID
> 
> *)  clear the consumer copy of the aggregation, using:
> 
>       /* Also clear our own copy of the data, in case it gets printed. */
>       dtrace_aggregate_walk(dtp, dt_aggregate_clear_one, dtp);
> 
> However, this clears all the aggregations.  While the next snapshot of
> the aggregations will refresh our copies of the aggregations -- after all,
> dtrace_aggregate_snap() itself starts with a call to dtrace_aggregate_clear()
> -- if we print aggregations before the next snapshot, we would display an
> erroneously cleared aggregation.
> 
> Therefore, change dt_clear() to clear only those aggregations that
> correspond to the specified aggregation ID.
> 
> Note that while we have "aggregation-walk" functions like
> 
>     dtrace_aggregate_walk()
>     dtrace_aggregate_walk_joined()
>     dtrace_aggregate_walk_*sorted() (many of these)
> 
> the first one (dtrace_aggregate_walk) is used only twice:
> 
>     - in dtrace_aggregate_clear() to clear all aggregations
> 
>     - in dt_clear(), where we should clear only a specific aggregation ID
> 
> Therefore, rename dtrace_aggregate_walk() to be
> dtrace_aggregate_walk_oneid() that takes an aggid argument.  If
> aggid==DTRACE_AGGVARIDNONE, walk all aggregations.  Otherwise, walk
> only those aggregations that match the specified id.

I think that keeping dtrace_aggregate_walk() as-is would be better, along with
adding a function dtrace_aggregate_clear_one(dtp, aid) that performs the
lookup from aid to dtrae_aggdata_t *agd, and then calls 
dt__aggregate_clear_one(agd, dtp) to do the actual clearing.  There is no need
to go through a walker function when we already know we need to operate on
just one aggregation.

> Though trunc() appears not to be similarly afflicted, add a test for it
> too.
> 
> Orabug: 36900180
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_aggregate.c           |  8 ++++++--
>  libdtrace/dt_consume.c             |  2 +-
>  libdtrace/dtrace.h                 |  4 ++--
>  libdtrace/libdtrace.ver            |  4 ++--
>  test/unittest/aggs/tst.clear-one.d | 33 ++++++++++++++++++++++++++++++
>  test/unittest/aggs/tst.clear-one.r | 13 ++++++++++++
>  test/unittest/aggs/tst.trunc-one.d | 33 ++++++++++++++++++++++++++++++
>  test/unittest/aggs/tst.trunc-one.r | 10 +++++++++
>  8 files changed, 100 insertions(+), 7 deletions(-)
>  create mode 100644 test/unittest/aggs/tst.clear-one.d
>  create mode 100644 test/unittest/aggs/tst.clear-one.r
>  create mode 100644 test/unittest/aggs/tst.trunc-one.d
>  create mode 100644 test/unittest/aggs/tst.trunc-one.r
> 
> diff --git a/libdtrace/dt_aggregate.c b/libdtrace/dt_aggregate.c
> index 51f0d622..e06025de 100644
> --- a/libdtrace/dt_aggregate.c
> +++ b/libdtrace/dt_aggregate.c
> @@ -1278,7 +1278,8 @@ dt_aggregate_qsort(dtrace_hdl_t *dtp, void *base, size_t nel, size_t width,
>  }
>  
>  int
> -dtrace_aggregate_walk(dtrace_hdl_t *dtp, dtrace_aggregate_f *func, void *arg)
> +dtrace_aggregate_walk_oneid(dtrace_hdl_t *dtp, dtrace_aggregate_f *func,
> +			    void *arg, dtrace_aggid_t aid)
>  {
>  	dt_ahashent_t *h, *next;
>  	dt_ahash_t *hash = &dtp->dt_aggregate.dtat_hash;
> @@ -1291,6 +1292,8 @@ dtrace_aggregate_walk(dtrace_hdl_t *dtp, dtrace_aggregate_f *func, void *arg)
>  		 */
>  		next = h->dtahe_nextall;
>  
> +		if (aid != DTRACE_AGGVARIDNONE && aid != h->dtahe_data.dtada_desc->dtagd_varid)
> +			continue;
>  		if (dt_aggwalk_rval(dtp, h, func(&h->dtahe_data, arg)) == -1)
>  			return -1;
>  	}
> @@ -1820,10 +1823,11 @@ dtrace_aggregate_print(dtrace_hdl_t *dtp, FILE *fp,
>  	return 0;
>  }
>  
> +/* FIXME: dtrace_aggregate_clear() is called from only one site.  Should we inline it? */
>  void
>  dtrace_aggregate_clear(dtrace_hdl_t *dtp)
>  {
> -	dtrace_aggregate_walk(dtp, dt_aggregate_clear_one, dtp);
> +	dtrace_aggregate_walk_oneid(dtp, dt_aggregate_clear_one, dtp, DTRACE_AGGVARIDNONE);
>  }
>  
>  void
> diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> index 8d8c0f54..238b93ca 100644
> --- a/libdtrace/dt_consume.c
> +++ b/libdtrace/dt_consume.c
> @@ -1551,7 +1551,7 @@ dt_clear(dtrace_hdl_t *dtp, caddr_t base, dtrace_recdesc_t *rec)
>  		return -1;
>  
>  	/* Also clear our own copy of the data, in case it gets printed. */
> -	dtrace_aggregate_walk(dtp, dt_aggregate_clear_one, dtp);
> +	dtrace_aggregate_walk_oneid(dtp, dt_aggregate_clear_one, dtp, aid);
>  
>  	return 0;
>  }
> diff --git a/libdtrace/dtrace.h b/libdtrace/dtrace.h
> index 1f54c10c..4df3ebf4 100644
> --- a/libdtrace/dtrace.h
> +++ b/libdtrace/dtrace.h
> @@ -396,8 +396,8 @@ extern int dtrace_aggregate_snap(dtrace_hdl_t *dtp);
>  extern int dtrace_aggregate_print(dtrace_hdl_t *dtp, FILE *fp,
>      dtrace_aggregate_walk_f *func); /* func must take dtrace_print_aggdata_t */
>  
> -extern int dtrace_aggregate_walk(dtrace_hdl_t *dtp, dtrace_aggregate_f *func,
> -    void *arg);
> +extern int dtrace_aggregate_walk_oneid(dtrace_hdl_t *dtp, dtrace_aggregate_f *func,
> +    void *arg, dtrace_aggid_t);
>  
>  extern int dtrace_aggregate_walk_joined(dtrace_hdl_t *dtp,
>      dtrace_aggid_t *aggvars, int naggvars,
> diff --git a/libdtrace/libdtrace.ver b/libdtrace/libdtrace.ver
> index edbd5a1d..1510ad95 100644
> --- a/libdtrace/libdtrace.ver
> +++ b/libdtrace/libdtrace.ver
> @@ -1,6 +1,6 @@
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2009, 2023, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2009, 2024, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  
> @@ -10,7 +10,7 @@ LIBDTRACE_1.0 {
>  	dtrace_aggregate_clear;
>  	dtrace_aggregate_print;
>  	dtrace_aggregate_snap;
> -	dtrace_aggregate_walk;
> +	dtrace_aggregate_walk_oneid;
>  	dtrace_aggregate_walk_joined;
>  	dtrace_aggregate_walk_keyrevsorted;
>  	dtrace_aggregate_walk_keysorted;
> diff --git a/test/unittest/aggs/tst.clear-one.d b/test/unittest/aggs/tst.clear-one.d
> new file mode 100644
> index 00000000..f96c2db0
> --- /dev/null
> +++ b/test/unittest/aggs/tst.clear-one.d
> @@ -0,0 +1,33 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Clearing one aggregation clears only that one.
> + *
> + * SECTION: Aggregations/Clearing aggregations
> + */
> +/* @@nosort */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	@a[1] = sum(100);
> +	@a[2] = sum( 20);
> +	@a[3] = sum(  3);
> +	@b[4] = sum(400);
> +	@b[5] = sum( 50);
> +	@b[6] = sum(  6);
> +	@c[7] = sum(700);
> +	@c[8] = sum( 80);
> +	@c[9] = sum(  9);
> +	clear(@b);
> +	printa(@a);
> +	printa(@b);
> +	printa(@c);
> +	exit(0);
> +}
> diff --git a/test/unittest/aggs/tst.clear-one.r b/test/unittest/aggs/tst.clear-one.r
> new file mode 100644
> index 00000000..101d173f
> --- /dev/null
> +++ b/test/unittest/aggs/tst.clear-one.r
> @@ -0,0 +1,13 @@
> +
> +        3                3
> +        2               20
> +        1              100
> +
> +        4                0
> +        5                0
> +        6                0
> +
> +        9                9
> +        8               80
> +        7              700
> +
> diff --git a/test/unittest/aggs/tst.trunc-one.d b/test/unittest/aggs/tst.trunc-one.d
> new file mode 100644
> index 00000000..0556bb34
> --- /dev/null
> +++ b/test/unittest/aggs/tst.trunc-one.d
> @@ -0,0 +1,33 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Truncating one aggregation truncates only that one.
> + *
> + * SECTION: Aggregations/Clearing aggregations
> + */
> +/* @@nosort */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	@a[1] = sum(100);
> +	@a[2] = sum( 20);
> +	@a[3] = sum(  3);
> +	@b[4] = sum(400);
> +	@b[5] = sum( 50);
> +	@b[6] = sum(  6);
> +	@c[7] = sum(700);
> +	@c[8] = sum( 80);
> +	@c[9] = sum(  9);
> +	trunc(@b);
> +	printa(@a);
> +	printa(@b);
> +	printa(@c);
> +	exit(0);
> +}
> diff --git a/test/unittest/aggs/tst.trunc-one.r b/test/unittest/aggs/tst.trunc-one.r
> new file mode 100644
> index 00000000..a611026d
> --- /dev/null
> +++ b/test/unittest/aggs/tst.trunc-one.r
> @@ -0,0 +1,10 @@
> +
> +        3                3
> +        2               20
> +        1              100
> +
> +
> +        9                9
> +        8               80
> +        7              700
> +
> -- 
> 2.43.5
> 
