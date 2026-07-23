Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F093F1ABD
	for <dtrace@lists.linux.dev>; Thu, 23 Jul 2026 13:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784812942; cv=fail; b=p8xCn3I83592veCQSXeVBKnnWaBoTa7INAIk55DcnW+zMrQlaGElTt5wH5r7VAGZZ9dYzGCaTWbnDgFdjf4sLYviYstAXNDksWrNGKiyKh9eoSsahFh2O+rMhJOMdqK6i4k/x5Fn7Cqrz88JfgD2qY6rpCHdK6iZw75YsxNtLSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784812942; c=relaxed/simple;
	bh=RyilrJzoIT3GnIi4GJCtv6l5R1tmHMuHGwN86x7E17s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BMtWlsLihnNmCmmmpipgKjzjh2LBdXlDe5ImJrfg2kH7BArPcuy6w30sCUh0dZuefx9PNWriLhKkqia28QXXyTRXU7tyrAaij2BQ61HtKYmt9PGCEEFVlhfYqByWIr3ZSBaz70nQTRbv00YBnmmdljdONOboTxYof+1IPBAdVTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DxbCtLXh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=l03XMz34; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DxbCtLXh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="l03XMz34"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCtbWh933843
	for <dtrace@lists.linux.dev>; Thu, 23 Jul 2026 13:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=5hUZkhcUfuVHhvNarGHwhjhGrYuXM564HdhewAlkYSs=; b=
	DxbCtLXhvetF+x4qcHzaXWCDm8o42ccSS8hjMZRWaHobZnsxklSmamwM3Zn9dUhw
	bM3aQxb1EvLKMsVQo+9KPkJWoQlrhxRJ9wJy9jogp81lIWz8ZQEgHtaMzUq8Bjan
	jB9S0fJGVODLXUiduJ+J5RZ7DygleMc3rBS/5v5PmqVltRhyeozeT5iSzkOyIYps
	6qn7t2xVJ9jGN3q1qLlaRfuUACMmeedc1/xV1r8GcY2Vi1+VCMUOU2otjEb+W07N
	meDMEBTQiBirOS+nkrs8/N6/iW/w8OIZOityV3kcbQaHP/Tn4nfhWnHn9y6R0EGX
	bKK3JtCyPGuaQQe5LBZRiA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4fg1n3pwgj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Jul 2026 13:22:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 66NDIffD000547
	for <dtrace@lists.linux.dev>; Thu, 23 Jul 2026 13:22:18 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011059.outbound.protection.outlook.com [40.93.194.59])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ffyxsbvkt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Thu, 23 Jul 2026 13:22:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tDKTYvMpbJ+ZH3x/bFFHK37R883tCcXScCeXb9DVQmCT0M5YbcMnKRw3V/PDtiFy1vDpWoayTvwu8HXZjG2AfVuBfNeJANLNwNE3t6jAWJMsN6CCOpy2g9ceLPJGix+BgpHFTMUWR5bjZGAGa2sh7bWa7wWz5RbT19i+KBZrZgjZX6IfRMu1Uj+RBSYq2hUdTyElMxGx95kbW3Zb/j0qAdzep1xNfenrVR65cOwauY7oYRtJQPgC8/BH13HKSmXmhhkASfocZ47sgg7iyi488i/WwqxiwrjcglYW2k3QIcVv0LkaGfYsJvMD+n0FXQyHxrs30IRehtad2tD6LJl64Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hUZkhcUfuVHhvNarGHwhjhGrYuXM564HdhewAlkYSs=;
 b=etDYXF5F0xehQjTQNq7XZ1+0/E0guJ3pzvE/ajA6acgRwXYoTEwzBAen12s+oBU8dOKS7eudSIxqNTZsNnNeJIcyyOhqnSqK/aeXLHDkqXd6uIzzottJj36pgTlyrKEvj146y4UPXFn6Kqjfs0dMTGCTehfMpOFTEaHyUegt9Wnao3d/CTBi2UoNmVV55YhjeuInfBYwiRsiKTxEAdd3sz2BuqMUZT3EdKY5GUOGUXUFCAQ7te25WMi+xGclMU5USyQmnNgYgPvGOWQKqgzN1xFuvzCgmFo1V+RGU9DzVfrczjDfJKFZCuiHhAlGk8v/xcv+ZTwp4rMVBkm/N1yFlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hUZkhcUfuVHhvNarGHwhjhGrYuXM564HdhewAlkYSs=;
 b=l03XMz34PjayKJ863PIdRH/SnB0fipglMOpPmWd3yE5QnARN+IbGE3Gn//vYs03CgAwBGQiRle8Zc1ml5itPXAl7w8XoJeujFZDz8uR5f2QVVNZPkvv3rMl5VJDt8Bm2nFJLvNUDCneBekp9DoOdLnBHxDHXblZvRWRvSJ2Qs7U=
Received: from BN0PR10MB4901.namprd10.prod.outlook.com (2603:10b6:408:126::19)
 by IA1PR10MB7514.namprd10.prod.outlook.com (2603:10b6:208:44e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 13:22:15 +0000
Received: from BN0PR10MB4901.namprd10.prod.outlook.com
 ([fe80::19a8:41b4:f519:1b79]) by BN0PR10MB4901.namprd10.prod.outlook.com
 ([fe80::19a8:41b4:f519:1b79%5]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 13:22:15 +0000
Message-ID: <bfb1980c-c27e-40c2-b60c-025d2159df61@oracle.com>
Date: Thu, 23 Jul 2026 14:22:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] libdtrace: share vmlinux BTF/CTF globally to
 support faster startup
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20260721152452.184842-1-alan.maguire@oracle.com>
 <20260721152452.184842-3-alan.maguire@oracle.com>
 <amE0WSxviiSt9OKR@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <amE0WSxviiSt9OKR@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0234.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::18) To BN0PR10MB4901.namprd10.prod.outlook.com
 (2603:10b6:408:126::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB4901:EE_|IA1PR10MB7514:EE_
X-MS-Office365-Filtering-Correlation-Id: 72478ca6-afce-4e5b-2b9f-08dee8bd698b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|10067099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	pDPeEJyQORMLkP1dwVzHlQ4TYY1OcBJ5kQ5k9LYZx6jqH43hxDSMu+q7dAzhbp+bw4ej2ol9G+sIGRWi8/vYVgF8L0BU2DE/EhtaQ+XetDZbWuWTvFfjLoigeREJe704WBJIJ4dh3JFBbZIKr1o+Q2kb8fhgdfdBGbdwW4IFQ9Ky1x3P1XqGA5hl5wTPWQrdyWnVm7deDbnZgHKvHaqpF4yD/j9awIWym8RJm7kqzgUdIku03YZcEBVf9dqf9hM+LtvPUJdVqfr4K1/oxBE61+vd2iJk3GFdl569WPt7F9ulkvd4a6gw0IwgkMTWt1FSXJJvH38bMhEblPYk9RXWsStKiLrVczj+wyC8SE7tJJhSJHnQFo5aygoomk32Aepb1bbYicwoATXhA1rny7OCcwqckg8yjvdAPWvuc95uLaShUYYP6sHp0pN1xTFB4UJ5jJopEI9+1CUkDbhlprx9bzMfMxiqMsgA33Ii9OAcmDRqt8Q1rTlMsUhrcsYuGlQ3oF2iAlorGtow9zigXo65qVcMKjvDE0iIcPXRbLqkfIUqqGqgBdj72kCa+mjjZvrajccEIH8XUvoD60Uj3LCRUk73Cp6xMsreyVhUNOeXsiFlTjzf1i8o7h/23MCaAzgn6mI+YPS4Y4Wkc7AtrSTbGFOH3ZXIsDALcHM44/r9jMU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB4901.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFl6RGJLVEdwK3lkVXpaM3JIOE1RcTQ5R21TNzZkY2QxS2M1a1NDYklYNkoy?=
 =?utf-8?B?bmo3UGFwRUJ6WWRIRmY5K2hsKy9LRngwM3JSeVc2bnVxQWtXYVJodkV4V2Fy?=
 =?utf-8?B?Z0JhVWFYR0hvWGVPeHE0bzZNa3htVlVJQ2ZJSUF5eTl3dlZwL0s3RFIva1ZY?=
 =?utf-8?B?K1NqTS84SnhnK25nT1I4WldsRXp5LzJrL01vMjB4T3R0MThBMjdaWVhNcng2?=
 =?utf-8?B?K3BGVThZKzVaMW1ndE5RZFgwS3JkaWI3djE5SVl3OUMxM0R6c1pxUVlVeEds?=
 =?utf-8?B?OEM5cmxTQnpVa0M4aTdXcnhmWEw2Sjd4U0RhVnVvZVM4RWJ0Qk1QS3BOZity?=
 =?utf-8?B?SkVQOUl4eWtjSXBzMllMVzJCZjBvU3dpVE14RmVZNEw5Q3hnSDVlS2ZucTRS?=
 =?utf-8?B?dVJMTGtscnErYjZpTVJ0cXFPUGp1Y1RkeE80eGtkQzd6d3pyOVQvQ0xuTUlB?=
 =?utf-8?B?UURFVUxBZm83M2dHVEJXQzVXb2ZMcWgzMWxUZFkrMDJnaDMzZmM0QWdPUUtL?=
 =?utf-8?B?NHQvZ2JoNGYycVpCNkkxMmZqOUhhK1dxcllqQXZkTTRDdm9pZ0tTZEtJOVhr?=
 =?utf-8?B?UUY2QXQ1aTB5b3BJeWl6Zkt2OThyWHR0NlNRZEVjZ0xzL3FSSE9ubnE1a09L?=
 =?utf-8?B?NUNuTnNzYWpwY2FrZFEwbDFaTm83cUJoV3l5UDlwS3FZMHBhOENLcEdOOHBr?=
 =?utf-8?B?c2o5bjVBYWdQcGhYOU94T0ZRc1o2TWdyVFk4dEM1WlRtRkwycHRnKzZUdFdq?=
 =?utf-8?B?U1JRbUFxVkhDVThXTGtHVGxoL2ljM0ZDY0xhTnNMckw0K2o5dzMralFadSt2?=
 =?utf-8?B?SDlmejVJeTJveGhKK2ZiMGl5ZUkzMjUrYmU2S3BJVUpTalg2b2FzNmFJQ29Q?=
 =?utf-8?B?UVl3QVhxMDBCdDFHRFljSG1jWHNobFBmb1MrU0lyRGd4cEpsVkRUTzFMSE0r?=
 =?utf-8?B?bmZmTG9WeUFwRy9UTHJjVk9FTzhLdnYrbnRuZWxuaFF3Q0pPMkU2c3p5VkVV?=
 =?utf-8?B?WGRQdVZzWHhYOGxoZmd4RHBaNFRFQ1g1MGZzYkN4alJrZjVHWmJ6aDVMYjha?=
 =?utf-8?B?SlhvdDJ6YjFmS0hHODNoYVdueWMwWUd5S1NiT1d6dHJLMU92RzcwcEdtK2JN?=
 =?utf-8?B?Z3FUYW1Qb0RFL1NjNTRDTmsveGJTbTZRaFBRTnVUWDkvcENpSERmbndONmtx?=
 =?utf-8?B?M0x3aW9hdDNXNFlaaERpcHdsemErM29KYm9vTEJrZVFreU5MNTRtMHBYTkVY?=
 =?utf-8?B?V1lHUXdIdzFQTExkWnpCSkkyNmVoV054UFJqV2VvcmFIQkhabXkzV0NLaG1W?=
 =?utf-8?B?UE15a2NpbEYxMVdSZlpvaGhkcHh5bHJFdmUwbGlSTG93L3VzSmRoQ04vWmd3?=
 =?utf-8?B?SkxXMDAralYzNXcrRXo3TmF2TlBDVWxNa080bVByc3RKTGIvTlZxUlQrZ0hl?=
 =?utf-8?B?d3ZySXZseWczZElDbWVGRUl3d2ZXZHlGTHVnUzNDSEltWE4xbmtHU0V2TlVP?=
 =?utf-8?B?cVNxR2VLR20xYjFrN01RUWJEdi9ieTRXNDRpRkZqNy9VeDhPN1EvQjhWZHdo?=
 =?utf-8?B?YTNxbmNob0JmOW00MHZXREsvSjk0bEczbGU0eTlzVWhiL1IwWm1NQlNzZGQv?=
 =?utf-8?B?MmtrTy9VZzBtcndIUzF0ZmZCTXV1UnZNU1FMcityd0hMd2x0MWdhVE55bllJ?=
 =?utf-8?B?bllnQUhFeHBBZFRLWnFsMU9TWm14MHhHUEdnREFNc3hMcElLWk0yWnl1andh?=
 =?utf-8?B?bmtpWTljazVUL1EzY0dGcnEzSGN5SmtsYWEyeXgxTlNDK0lOM01zMElqOG00?=
 =?utf-8?B?ejcxNzUrMHNqcmRBVXFNa2t6WTZyUUVEQ0VXZFd2T3BHSHlRczNjaC9RaEhF?=
 =?utf-8?B?UE9NZ20rTURQZ0R0Y2t3S2ZHVVhhc1A5QmcwT21neTh3MU9DZnl2Yk1lQ0xy?=
 =?utf-8?B?MVNNRG9UUnBaWWtQdERrRGNvNFU3cThHUnNTdUowZ0ZvRE1WejdLM0VjdVlk?=
 =?utf-8?B?QzkxbktmeUhMdUp4ZVpaQVJySGdtL3A1cGxDajNMQm94N1RYL3RYb1AyRHJL?=
 =?utf-8?B?Y3ByS1FLaTg4cFc3NHJGaEFzUEFhc0RLQmRVMjdtL3AvWFJ4K2JuL0tueUJJ?=
 =?utf-8?B?ZkZPZzA0ZXdTcUxFaFU0R1dEUFpVR0d5c3pyWVgxSFFjNkFKZXFSSVY4Z3Iz?=
 =?utf-8?B?WkFTR3Y3MjFJWThjZzN1ZGtyRHRwTDRVWDhmWlVNYUtCdVV0N1hzYmdiOHZp?=
 =?utf-8?B?QlNiVXNZN0lPa0pla2dTVmg2TytnaXA4YUFHekxRVDBOY0JPeGNFZVFxd00w?=
 =?utf-8?B?amZWTk85YW5oRHNsT0VoNUZmdVlOejByeUNhRk1pU2tYbnhvUHN1QT09?=
X-Exchange-RoutingPolicyChecked:
	G2FX+zIZ8UyKMG1AgcYhGErFBtSEn3LfQxjAhAFsPNKJzliVFxPdeLtrevEBEbJ0iEfEehSBy5X3rgRmgCQ9Uk5/ujS/Ow4kgK0D+cYdoJMX5A3c2CC2mmD3OMrspdo2M15pQ7Kt/uSHKJjF0KTis3WpG/vDhFYzRlIhNZLt0tC8EKfDLGTPQTHoZ3mSyx3UDbofBVIlpuSiMC+EYYW0k4PASEMei+4O7/2dPN05vfFXag8EShN/ICKvJTHIN26UqcjivgIReUrfDR9FKHSTLSHAUDG6r7X5Ys9roLWsBx3lwL5T/qAeoezPQ+FBbfNMZL4LPzvzQwvdVTEJrloQ/Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mlZKKLmb71LeS6ipjk7m0h56R0ik8mZLnqpQ/RUXskrUSal6cFrZyhcYJsx6mHnlT5XwV/OTRO/j+CLmf9ZrDw3PpLmsJZS+GNexewbDB7dWwEWuXbtOyrWFhchuHqu3KBVNdLfUPZhue1nqoDbXYpjRAhUgGB9O2fTGEAT+GS+spxKzlg8+vIuSvLLXo8TbPCSPIKsllbxbqRoAAxkLmgQSiMtjuDRACZDnRTnMC/I+S81+oZY1rVXRpUjGHYOC1qO3i0eHQQw/8LGiihFnTxmWNIuQUF8v4nqi7kXd1Su+aT+fc40OS/RqBzT/XEFyBW8rLMi8FrSh4A52TBVtp6SZtVHeop6ffSCibwU/7mIi2IbO3q1CH7dG3gO1O6QBRh9xdjT+0Lcn8Rq3QW2Lf/IFfBnRBk0+QKs5jdTI84zD8f3VT6HZtsPVHroOBtDXd+3fW8CGsAKDoy3dRFL1j8a0entqaTYIysyimppfnsMchvxGQ1cYGp3AdXOHrHn2sRit0pq90Y4ipQ/bUMaWZo+hwQG6ieuEfnIK0Quo0uXiyaa24e19yQ2/gSaaT/l3FWPahqNbNiXGtz5XBUn2l5906jKgw//Oa0bh5/Tu1Ek=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72478ca6-afce-4e5b-2b9f-08dee8bd698b
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB4901.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 13:22:15.3343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ofj5rSXXeo7umwuVfebBEd3qSdYzk4sqvOY+cXEmZ7OSAni1hPBe5EJ6ERjAnF4HZ4BMUYd9HwT87xZO9UDFsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7514
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 mlxscore=0 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2607230131
X-Proofpoint-GUID: Hd4glqnZEEQsT7v2UI7djj9p5EwMsQyb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEzMiBTYWx0ZWRfX0WDw7zD/7SyR
 RQzgo/vrtGK4YHfrZ7GZ2gxTqMV/Q5TQwLGIvrbS6ybpA2NgT3RPf0bre1kWlyZYCxkjboh4o9H
 0zN2qMpEnaVYVFKUycUDwzSsqa9jYSUQEYi1F5oyq/9zY7yyYqx+
X-Proofpoint-ORIG-GUID: Hd4glqnZEEQsT7v2UI7djj9p5EwMsQyb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEzMiBTYWx0ZWRfX5vN7PYRp+Mfr
 FxOsT+Ljkuceem+XCqTe5EVpBUKWbXOeVEnL4MmYqWNHIV8zLbmsEpdPUSyGd9Kl5MTciJcN17I
 3l9MpEILIuqgJYPrRLTA6mI5qtJ4HIslMzrM+fAFmQLUXByeu1TZWrjArnJtrVP8qxWhAHfsXvC
 UqR/tZuWMmQnVoYyaegZNHB0bXcQ6Kxe1Zl2JUYVvWfUs6nth5PQirb0mV3NUBsydSW7dvSj4nW
 jurjy8htnvyo1buQCU6OsGKrOnoGQh8vh3LjjtakhS7pN/m6i0jlLsXODU9zuJ352zwGcNuX0fh
 phdlfrH/SDWfY6TuwoshFkV011ZuxFjC98xQvmUJnjyfzwIPoa/2iNLCjBOE5OkqF1YSGpE+FmL
 TrpkzuetnjHgXRq/9Q1c0Ym6ODAKqB9epW8XJ4blfcy6b18HXRVa+1R9sNq+DOTiycuqCcANQIj
 nK87ZiNrU2ouOPyOsDpzA9PxpWX6BK63L6QXGFRI=
X-Authority-Analysis: v=2.4 cv=PryjqQM3 c=1 sm=1 tr=0 ts=6a62158b b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=o5oIOnhZENCTenyL_yNV:22 a=yPCof4ZbAAAA:8
 a=9kGXV1dQDOnImDhTKy8A:9 a=QEXdDO2ut3YA:10 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13523

On 22/07/2026 22:21, Kris Van Hees wrote:
> On Tue, Jul 21, 2026 at 04:24:46PM +0100, Alan Maguire wrote:
>> In a multiple DTrace session per process environment, it makes sense
>> to avoid doing expensive operations like reading in vmlinux BTF and
>> converting it to CTF more than once. Shared (vmlinux) BTF and CTF
>> generated from it are shared and reference-counted globally here
>> to cut down on cost.  With this change, we can launch ~1 DTrace
>> session per second.
> 
> There are a few logic issues here that need to be address I think.  Since we
> do support -xbtfpath and DTRACE_OPT_BTFPATH, hardcoding the path to vmlinux
> is an issue.
> 
> Ideally, this code should allow for both shared and private type data.  I.e.
> if a -xbtfpath opion is given or DTRACE_OPT_BTFPATH is set, then the instance
> will use a private copy.  Otherwise, it will use a shared one that is sourced
> from the system default.
> 
> More fancy would be to allow multiple shared ones, keyed by full path (and
> considering that it will be very very rare to ever have more than one).
> 
> So, I would suggest going with the first option (shared and private), and the
> close code can check whether dtp->dt_shared_btf == dt_shared_btf.  If so, it
> is a hared one so handle it that way.  If not, clean up as a private copy.
>

good catch, thanks! I'll do this in the next version.
 
>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
>> ---
>>  libdtrace/dt_btf.c  | 61 ++++++++++++++++++++++++++++++++++++++++++---
>>  libdtrace/dt_btf.h  |  1 +
>>  libdtrace/dt_open.c |  5 +---
>>  3 files changed, 60 insertions(+), 7 deletions(-)
>>
>> diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
>> index 1f793397..e46336f9 100644
>> --- a/libdtrace/dt_btf.c
>> +++ b/libdtrace/dt_btf.c
>> @@ -693,6 +693,9 @@ dt_btf_to_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp, dt_btf_t *btf)
>>         ctf_dict_t      *ctf;
>>         ctf_encoding_t  enc = { CTF_INT_SIGNED, 0, 0 };
>>
>> +       if (dmp == NULL && dtp->dt_shared_ctf)
>> +               return dtp->dt_shared_ctf;
>> +
>>         ctf = ctf_create(&dtp->dt_ctferr);
>>         if (ctf == NULL)
>>                 return NULL;
>> @@ -764,6 +767,56 @@ out:
>>  }
>>  #endif
>>
>> +static dt_btf_t *dt_shared_btf = NULL;
>> +static ctf_dict_t *dt_shared_ctf = NULL;
>> +static pthread_mutex_t dt_shared_mutex = PTHREAD_MUTEX_INITIALIZER;
>> +static int dt_shared_refcnt = 0;
>> +
>> +static int
>> +dt_shared_get(dtrace_hdl_t *dtp, dt_module_t *dmp)
>> +{
>> +       pthread_mutex_lock(&dt_shared_mutex);
>> +       if (!dt_shared_btf)
>> +               dt_shared_btf = dt_btf_load_file(dtp, "/sys/kernel/btf/vmlinux");
>> +       if (dt_shared_btf) {
>> +               dt_shared_refcnt++;
>> +               dtp->dt_shared_btf = dmp->dm_btf = dt_shared_btf;
>> +#ifdef HAVE_LIBCTF
>> +               if (!dt_shared_ctf) {
>> +                       ctf_dict_t *ctf = dt_btf_to_ctf(dtp, NULL, dt_shared_btf);
>> +
>> +                       if (ctf)
>> +                               dtp->dt_shared_ctf = dt_shared_ctf = dmp->dm_ctfp = ctf;
>> +               } else {
>> +                       dtp->dt_shared_ctf = dmp->dm_ctfp = dt_shared_ctf;
>> +               }
>> +#endif
>> +       }
>> +       pthread_mutex_unlock(&dt_shared_mutex);
>> +       if (!dt_shared_btf)
>> +               return -1;
>> +       return 0;
>> +}
>> +
>> +void
>> +dt_shared_put(dtrace_hdl_t *dtp)
>> +{
>> +       pthread_mutex_lock(&dt_shared_mutex);
>> +       if (dtp->dt_shared_btf && dtp->dt_shared_btf == dt_shared_btf) {
>> +               if (--dt_shared_refcnt == 0) {
>> +                       dt_btf_destroy(dtp, dtp->dt_shared_btf);
>> +                       dtp->dt_shared_btf = dt_shared_btf = NULL;
>> +               }
>> +       }
>> +#ifdef HAVE_LIBCTF
>> +       if (dt_shared_refcnt == 0) {
>> +               ctf_close(dtp->dt_shared_ctf);
>> +               dtp->dt_shared_ctf = dt_shared_ctf = NULL;
>> +       }
>> +#endif
>> +       pthread_mutex_unlock(&dt_shared_mutex);
>> +}
>> +
>>  dt_btf_t *
>>  dt_btf_load_module(dtrace_hdl_t *dtp, dt_module_t *dmp)
>>  {
>> @@ -774,6 +827,11 @@ dt_btf_load_module(dtrace_hdl_t *dtp, dt_module_t *dmp)
>>         if (dmp->dm_btf)
>>                 return dmp->dm_btf;
>>
>> +       if (strcmp(dmp->dm_name, "vmlinux") == 0) {
>> +               if (dt_shared_get(dtp, dmp) == 0)
>> +                       return dmp->dm_btf;
>> +       }
>> +
>>         /*
>>          * Default: /sys/kernel/btf/<module>
>>          * If "none", disable BTF.
>> @@ -792,9 +850,6 @@ dt_btf_load_module(dtrace_hdl_t *dtp, dt_module_t *dmp)
>>         btf = dt_btf_load_file(dtp, fn);
>>         free(fn);
>>
>> -       if (btf && !dtp->dt_shared_btf && strcmp(dmp->dm_name, "vmlinux") == 0)
>> -               dtp->dt_shared_btf = btf;
>> -
>>         return dmp->dm_btf = btf;
>>  }
>>
>> diff --git a/libdtrace/dt_btf.h b/libdtrace/dt_btf.h
>> index 2c921a03..b1ed2b65 100644
>> --- a/libdtrace/dt_btf.h
>> +++ b/libdtrace/dt_btf.h
>> @@ -18,6 +18,7 @@ typedef struct dt_btf         dt_btf_t;
>>  typedef struct bpf_btf_info    btf_info_t;
>>
>>  extern void dt_btf_destroy(dtrace_hdl_t *, dt_btf_t *);
>> +extern void dt_shared_put(dtrace_hdl_t *);
>>  extern dt_btf_t *dt_btf_load_module(dtrace_hdl_t *, dt_module_t *);
>>  extern ctf_dict_t *dt_btf_module_ctf(dtrace_hdl_t *, dt_module_t *);
>>  extern const char *dt_btf_get_string(dtrace_hdl_t *, const dt_btf_t *,
>> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
>> index 30b8758d..352cec49 100644
>> --- a/libdtrace/dt_open.c
>> +++ b/libdtrace/dt_open.c
>> @@ -1299,10 +1299,7 @@ dtrace_close(dtrace_hdl_t *dtp)
>>         dt_htab_destroy(dtp->dt_mods);
>>         dt_htab_destroy(dtp->dt_kernpaths);
>>
>> -       if (dtp->dt_shared_btf != NULL)
>> -               dt_btf_destroy(dtp, dtp->dt_shared_btf);
>> -       if (dtp->dt_shared_ctf != NULL)
>> -               ctf_close(dtp->dt_shared_ctf);
>> +       dt_shared_put(dtp);
>>         if (dtp->dt_ctfa != NULL)
>>                 ctf_arc_close(dtp->dt_ctfa);
>>
>> --
>> 2.43.5
>>
>>
>>

