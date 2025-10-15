Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5E31FB1
	for <dtrace@lists.linux.dev>; Wed, 15 Oct 2025 05:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760504476; cv=fail; b=qn8rDVfO/c7DFOI8iSTednlAjq7n5aLqacqz81EkfytA2LvaaF0jfey0TMO0L/fIKQB5sUdMivB8EjmKRoMF3EQDH5y0KwM1IXes9Ed3DB4vN/o0Zq7XoMZYE49/Ukkfl5XhAfRX6cZli6KNSM0Fu60Xz4m99ErbckcvkD8sIeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760504476; c=relaxed/simple;
	bh=GpEiRH+lBdhEhv0++ea16zLcQ8A5+WMTBBrqv72Ehio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=daJ8d/PjxhrWqUylnRqO6tzJ5CXXFiC6XVfuRVK9b7beQOlNYp3pT5OLCINomC7DwTmOKAhHUSwqQbs4u2fvb61dOV74LSiv0eiL8Tv6O0wCbIkD1oVrYn5ZVvpXyxJddS1iRwjf0jcE/JyD2VAAPhwhRYOhRvWjvQkk+bYEIXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aQrE0jZ3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nwtULGat; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aQrE0jZ3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nwtULGat"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F4uPO3018961
	for <dtrace@lists.linux.dev>; Wed, 15 Oct 2025 05:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=dQOnGMWYwlfqJgrxWE
	ChruFg2ranDZ6DoYLkF4iYee4=; b=aQrE0jZ3wyjyWieu+6iFb2PyRBTCR9mtUP
	hZs7X4a56S5GYMaOKPxohUyZ09jn6vBpjDLUnZZgHSCQ25el922jyEFxtD5GyQke
	nmWIzRICqrsOzDgmDXM/UpIGSOVADro0gHyx+StEB6dwzchkxgtSIBJfQKY+5k8x
	RIyDLQikt4TEni3qwhcB44bJDYIXf3bL32sw7bQyk49LwRmvxs2g7KbJ9d8sp4NK
	L5A5Z9VUKO8fC3X7FkItA6tYnl1GWymQQcwsHLDKl6UaJvW8DmCVyV2Zh8C4NqlK
	XKdpwGQF97xY0646v8dhP/KLS1GxAeImxktB6cog2L3JIEuWfVeg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qfsrwp10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 15 Oct 2025 05:01:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59F42Png018003
	for <dtrace@lists.linux.dev>; Wed, 15 Oct 2025 05:01:11 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010014.outbound.protection.outlook.com [52.101.61.14])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49qdp9m610-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 15 Oct 2025 05:01:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wsWLkE5h47XNHPmCgUCfm9bX/p686gUvQpnpBIHq/5F7HM6zbVc+o5hWGwi2hEEq7M9ay5ek+kQZQl8WyHp62jkmcu3+e2zhLsDNjTtK7ae0ePUku75mHo53bh00EsEbpSZK7dSGf8VbZ/D3Cyok/mAi9Cn5JWdy4d/pkN7/1h3QlsI0wldu/l7qAGbfExubw4pl21vM6541dmozCnhjyg2Hr4RDV5oOtyRzB4PBQz/Wtv2KM+gJiMxbRFwwF16CFXi83LgZudZE8W7LUvNbHchDSpEWWdPr873ffVd+5rUkWblSfbmwsERMpMHRrlgtUm1j0+RAFeX9XGQfdWzhuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQOnGMWYwlfqJgrxWEChruFg2ranDZ6DoYLkF4iYee4=;
 b=dtmC9hUQGE2DK7fdEaBFxjiXl8GCZ3hp8/X4DUsFR8Tgkfa0OWlOuj4hT/CU6BHalJDQkr9D0/sYQOXwWvcRSmJgFYmGBhg21uGVHPWk3nLvJu3K+PIDYzlyM2+eWqKIOgxjTOjpMFYp4y2DUfAj6GGFk8XHVKs9xsz+gum/3x8siv10pToqigq76NAoPyUlAOgKUh/lUNGGky9z8v39ftmZcjXEJiiaDBotiuPPgKRiFIV0ayVhMvDmuADV2R5+dTbt6BZ9QD2euHfv5IKxzfb6tfzXLrEdIv/Cu4k106CsBKNYFjCZcVdQsKAe3iXH3WUazmAKiXKzlnJzXtuuuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQOnGMWYwlfqJgrxWEChruFg2ranDZ6DoYLkF4iYee4=;
 b=nwtULGat4ih/ravYUU9oAmYL+rihzJbluTTIvCKxNU6M061T4y+sVmU6zf6nHe3gkht9lnl4TMKU8xWt56xoWAe4G+LOvX5EID5M2s+q2C+Pbup0cq641Vgh/UXkuWa2UsKzqYHTQ/t1MxIwxWjzGSDp7Bpeb4MLh6MqLFVbygQ=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by MN0PR10MB5959.namprd10.prod.outlook.com (2603:10b6:208:3cd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 05:01:08 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9203.007; Wed, 15 Oct 2025
 05:01:08 +0000
Date: Wed, 15 Oct 2025 01:01:05 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Set lockmem limit before checking BPF helper functions
Message-ID: <aO8qkXagh4JYW6C9@oracle.com>
References: <20251015044752.3919-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015044752.3919-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:36e::23) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|MN0PR10MB5959:EE_
X-MS-Office365-Filtering-Correlation-Id: 002cc558-93bc-4ada-a1a2-08de0ba7da0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Uio6O4OKWqmO6j6YtskEqQaHxpgfWHORNWD+W2HyLLXmT+5szViEmi+d2uF4?=
 =?us-ascii?Q?JsdSiaInIFMBy7QrSeCUysIMAOoyaLTAHEkY8AHe/E0Oc9R+sXQHqMyUwEYT?=
 =?us-ascii?Q?6ip7XmogWIoUg6kGOVCN27ij875ooKrN2p7iD/pbDu1HAtEZvu74qKyyPlf1?=
 =?us-ascii?Q?yyVUWiWCtGYXxpPAuAIo1qi98TS/db9uVY+Q1gM3wTpQvPqVquLfxmD5g4wh?=
 =?us-ascii?Q?Dq7LZYFoELWB+S7q2mD7M2IGExK6FWXVYtvtJitl5dN7Dt1IGR5G624eisI0?=
 =?us-ascii?Q?8Z9uoOmhxOmJblDXSljBpFm6jy5+gCsYHcrYYB8xmTb8SSrm4A6refYWH99w?=
 =?us-ascii?Q?Ieu+rndoV8QKndjodxnAzgjKXL7wbc6j2+z2Isbo3F3pjjx3JP9WQb6whzBz?=
 =?us-ascii?Q?phYffzFIbJz9b2Kf7aJKoczSs14MHYUTrdwGTBfon0XZsTV3dBehhu7+3M78?=
 =?us-ascii?Q?umLVd4PzPvGOGo0g8jhpPyjdIaaHQfkAzOsL7gLRcODp3J7WHVp9IJJqHUax?=
 =?us-ascii?Q?8pvyPkQhq9DL+un3Dj+MAQ73hTJyaroakizy0m4qQeWGAN2NDX0/Ox6NAyVJ?=
 =?us-ascii?Q?EdMPet54/jHttdKGO+Rxv8mfvv1SnIDKf9AHCMGc80BvuVuM1RtSVqJP1gLi?=
 =?us-ascii?Q?AFsQ0xn3mlCkxJyqZufqpp4RqnI/kBjvg6vC650hGpAONkGMOFMdeRmKzpWd?=
 =?us-ascii?Q?t1ovOMjGb1IPkQAEhPs1SXasOWGCF9JYZkM8dGo3EzyyjYo77ZKRcPtU02nE?=
 =?us-ascii?Q?cGYyM05Sj7oE75CL856bYzNwHW24XAhhEvsQ9mpRlPGWDrcLQ2qIhVPezfix?=
 =?us-ascii?Q?o8YajWKiFyYTcbf/gQYAVLGS+ILCrq1cp1GzLKw6/Q0z7LbL8DrRLbPcyzqR?=
 =?us-ascii?Q?StdxD1n68+zgugruoV/+b0uhlD9djVxbHwu+bd2UncUlX8OcRw+aUqWM3Ek1?=
 =?us-ascii?Q?gakaqROZEwJLMIyKDjSsq4IwKM21ZyvS24OBX9yCWIpyErGCRRjH8nclvnIb?=
 =?us-ascii?Q?YFrnjJa7RucogmrlTJ/IattRZ7maqPo3N8FWaCVr6ElJnttLjFy1NI8sSBY2?=
 =?us-ascii?Q?Y6hrE4wzZWbqg6oqmnbKFQrSGDHd4hwy1xnBgUSiRccVfiMZT6xTVP8YFO0X?=
 =?us-ascii?Q?7f8IeAlQi+9ejQcnQFcpf70osc/BICxuwTEfO8fCoZ6JBEQel82FdS/0xC4+?=
 =?us-ascii?Q?JKR7UzH9uy8Jajdj9B1WChqEok3TB3cFMnXGFt3GEDTItoL/ofXyg+SxFcg/?=
 =?us-ascii?Q?ZCigXJehM5uLSJKqsMPukwGukmZc/tTa34pkjv6qH2b7K2cXduTqDjoqnDGP?=
 =?us-ascii?Q?fobsDJ4z7DqmDWzjVTUEBDB+TUwK/tmG388DSz99lKu3MuBTT6q1NS00ONhq?=
 =?us-ascii?Q?tR0QYtXqavgbG2xwLOCuM4xDVr6IZIOX++O1ZaNeXdmYOiAMb/IOdKNTt6E4?=
 =?us-ascii?Q?LRJeQqz28BitLaWm51uHN/EdmtL5Aq9iJtn1ESGafEty/0+svc+yzg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BdrwljKwiRlTIp4jb8jIXjOdnEiKBufGAjcTqqNG45Y835WHQJEhWT9wj0gT?=
 =?us-ascii?Q?DAiHLbyJTP4ZcTNH4sMOQ70rlcHwB6bi/qnOFdOewdYAC5PLaXfw8aAgXhvh?=
 =?us-ascii?Q?h7APEfo27NiM7iHViZojQHSlZyCMoErhOwZfIyIeg+yS5DcJ9CBbJpz3rYsC?=
 =?us-ascii?Q?Ls5pyqo0mRhtVhbhF9tFpBmy9oX9/2u8bnFjm1l1urlUErx7wh4x6Hj2o0QV?=
 =?us-ascii?Q?ftV3mW3ExEFC8jf22o7SqB9PrlOvCWxWcOdidyQA5k79pS/84tUXuWuylPU8?=
 =?us-ascii?Q?AhuQmHM9AQeq5HuacyW8elKeZ9qvoltkLU2fUSruC+iLA0QXQLIfaFfRkeJU?=
 =?us-ascii?Q?jDgz2ess1X3if0mRaD4LJFG3J15o6lvMUiT3PQHa4V9drf/NPBmbz1nOCLxC?=
 =?us-ascii?Q?dwXbClMTZM6iYqiHVdgildoSkq4hIGVHHfyx0tR42VyngoAtvWELGmc9XsEq?=
 =?us-ascii?Q?65rs1CvMV34VRL7yqh4sqZz6jXiF2XEVGFDljPCeDcCZQwyhKOmmlIzouj8i?=
 =?us-ascii?Q?is/+R2uM2yLTqr1CMfrGn3J6JjNZ8Lkqwh3ocjD8kywM5hYri6AcZ7QkmfPn?=
 =?us-ascii?Q?F1ldbPyp+PrgjQo2LnUAZ53dDKVGDm4MLdA/lMMgOSv+R0HdVLXZMdDlhY0J?=
 =?us-ascii?Q?NxYFDAcBVa1Q3UUKEiKD38UXHVBhTjvOT7a+TH1WqRqxmUwHzjdBOnQ5tMk6?=
 =?us-ascii?Q?kFAqPptOoD9Vui1203kc+eAgTLQdluLrpjMnH/ZdvDWIzbG5W5zA110E6GQD?=
 =?us-ascii?Q?8gT0A9ghYAsMbJCFHOIsbgRVC6v+WL7ZX6f4n1lb7DOx9rG2uLZlotAkt599?=
 =?us-ascii?Q?06bb+NEC1AGgOy60DuQPHo7VvsRuV0mMBYu258//BHiXWgrpwH4JR6PMbQUd?=
 =?us-ascii?Q?Le2plNmbErp0uApP32Qh6gKbntjzjVQpm8lZcPs19lvGrQyS4AiS+ZXK2slW?=
 =?us-ascii?Q?YrBQVzW7NYaAQ3PQhEnGGy9BXj/nfYn6SZLvrLUAKjhAQlDxVAXR0zZiBv0S?=
 =?us-ascii?Q?1bPAI6CyPngDrgDcGjHzvygS8+1SAI0p5eqmoYwiAm1prBHwCYOishNwxFC7?=
 =?us-ascii?Q?Q8mYPPG3tT4xowwdKLMd49EaeSdAXd+qHIQ94ArS1Z7lrg99q0Actfn5XmVx?=
 =?us-ascii?Q?yRJZy4IfUUTELXaVvnIdj2PMtzxVNd4W1emfTa9FGCyKEITABtZt85qRx6SR?=
 =?us-ascii?Q?G5zcciQ2lAwL0No6vhmUrF2Edmu18Rt1g842oDf+mb51lOF7PdaJiHvjVhtT?=
 =?us-ascii?Q?g+7+2N08TTdy6TPOCrrBAFt07fjB9L4GTTgdenHr0r8hQMgT7LUks3JWvkV9?=
 =?us-ascii?Q?qIeLNGFb75Q+5fzbqgbNtHXEzeLb8vHFT5ndTkfXdzMn0ArK0iZuA+tWSrBl?=
 =?us-ascii?Q?Dc1QkL5Oox57Ng4IXqzWiY0G9VG/jQCMprmAuMDgyjjhkt1vRkUa6kdG/7ka?=
 =?us-ascii?Q?6ftycSHJNr7sQKaqoV+FOXYvTk5nJhBcT3qKSIaOZiAo8W4ROMJfm+duxlIN?=
 =?us-ascii?Q?rir5YUijBIq/y/C+IfnO+ILCDy/SZ0P4JWohlpJBy8BgVhuOCkIQBQ9AxGGf?=
 =?us-ascii?Q?e4wtRCl81Z1X5BHH/LuqG5+EHuZWsLkx4V2E5no8+m5DTjzSDWNzvrVJZGro?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ydh4DEHx6omN4qBxMmQajP/4VxJGHrOYjmcGwUdmRgTpIPEC7/WUaf6Ka15Zad18z+HF/aimSFYItxpmTP0KPp/aalBfkPUCHtYw3lTV+e3DFLFqOG/DpbSJCj9aESrk9sxv17ECYc/1eFobvj1XrYSduVrCIHI8nZgQwwLQVOBjvsBCPGoq8f3bQGeaq342URrq7i0cM8glzX722dlry5LZfMsSIYx0te/p9XOb/FHoaiLy7zp0jlGm/xQgyErjdYPnOEKfWGmjdbbfzrpJ/sRIlVsrFBqCmjxOo+6i9L7KBdHth9pZZJQ9EO8zO38hXcmkuklNTSg12tNtpoXR/LPD6JZmyP9YS/EBGIrGggIVo4ugDnQrFxgkJcDx3NiV9qR/KCFAo8y2KIFoqutT+/RY182Gm35TqaNbc5lyzpOYwak8+KywLDAeeGDe09GskSiRR0bowAxDESuYFpKi/hkHW0svYMGcFu8HZAoCPXy6URz7XSO7MW8NzUctjtju8mZv9FWES3FkB4fHKEqxjhcYpAGSE6/H4H+abWVlpQSAFRrBgsylqDMKIIAigBKKwAqYZ1XBtngn+VLBn53FzjohkbWUx3jwcVwRb7RKzdw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 002cc558-93bc-4ada-a1a2-08de0ba7da0b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 05:01:08.0371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: No9FOCw1zfywqK6rkScf+DIegtTwN48KESfCVNbNoQXqP6wzE2HCDAg8UIJu22QdPPNbW3LIL75TQcUY+OHQg1ZrdwB0lii8y/vObqZA+js=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5959
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510150034
X-Proofpoint-GUID: asBhlqGN3NlameVFpHKiAkHvdio5NFR9
X-Authority-Analysis: v=2.4 cv=APfYzRIR c=1 sm=1 tr=0 ts=68ef2a98 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=F80JPr0A_P8csTKmF2kA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMSBTYWx0ZWRfX+M6dQjkrz35E
 2dRAmkY6qWW8POwFmLQH0lGco42SxF+ClhWmmU5nMwuBhOmWX38DVyQqJouYNoCEcT9nH7KV3CJ
 GxohPCNdsIvVuYaTB2MXidOEIQoeygZFdWQhOf4X9okGlfRcE9h9ipSArsUV44pXXEMhZPXScB/
 MJnwcM7YD1ThUXeraEG3gK6J7KeVibCAq8nsVE1NQxES6DJ2hECcY3leHI4XqgvJTqLq+bZoLPb
 nJfGZtnejB7jjMsrZEU6lu0K8PrBojvz/P2mxfIFoV4d5doyVFcr9DK8WWkUsNRAOS/0JXZ7kBV
 9qzDJ9ajnWIM8Ks72ZDNrgEqwuN+4Zh0xCtceXHPJM36X/mf5vr7nLBwUWX80kvYCi1VOgjfUXs
 HspLHqG5Txivh3US9eEHgDZ0zHOEHA==
X-Proofpoint-ORIG-GUID: asBhlqGN3NlameVFpHKiAkHvdio5NFR9

On Wed, Oct 15, 2025 at 12:47:52AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> In dtrace_init(), we set the locked-memory limit, either to the
> user-specified value (if any) or to unlimited (by default).  We also check
> to make sure that certain BPF helper functions are available, falling
> over to alternatives or indicating they are not available in case of
> problems.
> 
> It is possible, however, that the limit is too low when dtrace starts,
> causing problems with the helper-function tests before dtrace_init()
> even has a chance to reset the limit.
> 
> Switch the order to set the limit before checking the helper functions.
> 
> A test is added.  The underlying problem, however, depends on kernel
> version, how locked memory is handled, the behavior of fallback
> functions, and so on.  So the test could easily pass on some systems
> even if the fix is not employed.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_open.c                    | 14 +++++++-------
>  test/unittest/misc/tst.lockmem-init.r  |  3 +++
>  test/unittest/misc/tst.lockmem-init.sh | 20 ++++++++++++++++++++
>  3 files changed, 30 insertions(+), 7 deletions(-)
>  create mode 100644 test/unittest/misc/tst.lockmem-init.r
>  create mode 100755 test/unittest/misc/tst.lockmem-init.sh
> 
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index 17dfbf9a6..54adec02a 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -1213,13 +1213,6 @@ dtrace_init(dtrace_hdl_t *dtp)
>  		return dt_set_errno(dtp, EDT_CTF);
>  	}
>  
> -	/*
> -	 * Initialize the BPF library handling.
> -	 */
> -	dt_bpf_init(dtp);
> -	dt_btf_get_module_ids(dtp);
> -	dt_dlib_init(dtp);
> -
>  	/*
>  	 * Set the locked-memory limit.
>  	 */
> @@ -1228,6 +1221,13 @@ dtrace_init(dtrace_hdl_t *dtp)
>  	rl.rlim_cur = rl.rlim_max = lockmem;
>  	setrlimit(RLIMIT_MEMLOCK, &rl);
>  
> +	/*
> +	 * Initialize the BPF library handling.
> +	 */
> +	dt_bpf_init(dtp);
> +	dt_btf_get_module_ids(dtp);
> +	dt_dlib_init(dtp);
> +
>  	/*
>  	 * Initialize consume handling.
>  	 */
> diff --git a/test/unittest/misc/tst.lockmem-init.r b/test/unittest/misc/tst.lockmem-init.r
> new file mode 100644
> index 000000000..da8b2a5f9
> --- /dev/null
> +++ b/test/unittest/misc/tst.lockmem-init.r
> @@ -0,0 +1,3 @@
> +|Delay in ns needed in delay env|
> +-- @@stderr --
> +Delay in ns needed in delay env var.
> diff --git a/test/unittest/misc/tst.lockmem-init.sh b/test/unittest/misc/tst.lockmem-init.sh
> new file mode 100755
> index 000000000..1b4dcdeea
> --- /dev/null
> +++ b/test/unittest/misc/tst.lockmem-init.sh
> @@ -0,0 +1,20 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
> +dtrace=$1
> +
> +# Check that dtrace runs by default even if ulimit -l is very low.
> +ulimit -l 1
> +
> +$dtrace $dt_flags -c test/triggers/delaydie -qn '
> +syscall::write:entry
> +/pid == $target/
> +{
> +	printf("|%s|", copyinstr(arg1, 32));
> +}'
> +
> +exit $?
> -- 
> 2.47.3
> 
