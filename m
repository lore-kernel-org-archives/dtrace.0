Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8645223
	for <dtrace@lists.linux.dev>; Sat,  2 Nov 2024 00:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730507857; cv=fail; b=bw3Bd/Di5mawyFZMGwC84wll4ULZkoghbZ4UI/CoIXyLJUdMDPI42JWkojEZ3vTxFr9w3x56CD8eH+nA9pDaXwfNpvv/Ti4l5oFZJ7T3e1KLHCP+jwaFsmGnKimuJbIxxiTSgHgliIEYUQAXz+OYlB+ihyx2zbUwwyj237NOjKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730507857; c=relaxed/simple;
	bh=2ZwEZXGqixF+FWZxmAECLltw5e9Axn6K3wYVr4yHWMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JObgr0aTRL7yw/7e82aNLJ7X5VaUjA+Ar5Y+8oZLqKZW61LdvfiLlxjsYgbFBI/q6f9IsLWr6N79qb5fE0Xum88pP4ByqRwrQZ8mIeENPMZ51OLLpjACUOrS/MDQ0qBtKLzrF7gAcKX44zMbgwZG/iWxQDnqc6I434dBjn//7fo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LWRgdvM2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xq9Xzpu6; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LWRgdvM2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xq9Xzpu6"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1GBxKi018616
	for <dtrace@lists.linux.dev>; Sat, 2 Nov 2024 00:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=OGJhyMvHJmnLPf1cEH
	aU+SW+rDF6pCEFpuhp+wXQBC8=; b=LWRgdvM230pKYRSJLiBGrfvq0HL60MPL9a
	ywo3EvssJGroHTQjRsWqKU6QrF3ZBL+/Ogv9w246Qh2pv5aQXP60cZLQgH0+ppZm
	uCz/sFxlqMJbAPpKz+hEl67BKV/gmyqNm/44QC/4adi7VM1y3U+C9yqHpQOAr5G2
	dyncS2e3oKg/2EP6iAntesB3M+pLLxOJExTYc4z/dOYQCT6EI9Ff9er49Wr8fCfu
	4TszZWg4BnHWlizm3VcdTWNHm8/+K6c2vSyDgDHYdPqaNbG+mlsEIuliVGVGxTuq
	jcocZtagaxZFET4yepKDk/9ovXRxOqDkYWCvqu4cfUjdDog0FYiA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grgmnd9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 02 Nov 2024 00:37:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1NDuWT035074
	for <dtrace@lists.linux.dev>; Sat, 2 Nov 2024 00:27:25 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2174.outbound.protection.outlook.com [104.47.73.174])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hndc3xm0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 02 Nov 2024 00:27:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UkrCSaxPiIt7a2GCK8xJgMOupjiz07qbcY54DrWiNc+S0VRweqNClNpvoUAiK47gM+o1sWPDvSkTID6gmAXeZMZV0xwWl25ypn//w/FiE/rt3CrWNLGywFEN0rB5L8c12fS3w+rbwFbX8ZR0lvQ4s1ibY33IGG9ukSujVnG95Zct7uXF2BvJo1TypYb/z9mC2nPMD62D0YpVTyWmWW/U24SqNsgU28Ndx2VJDhX1Dc1XT5VPEyIBqDosQViJDYOOL9cZoHfljjH8mbAdQDZYT04UNcecnBR/lKkAHtrKYT/P4kQoS3H5v5khDYDEVFr065zXNULNzhdANTYZ6bB16w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGJhyMvHJmnLPf1cEHaU+SW+rDF6pCEFpuhp+wXQBC8=;
 b=cirXDMVLUehe0+0wS1geToD5DWWBy18tcdRcendcAY4nYW8mDlznSz0GUDbPFAqv+aVFWW4JjSrmgbzlEmGwS20+CrtCOSbAE8KVIu84FAYdDOH+ir9ArtwQ/gifbyYnsazJGFEGi15G8Izyaqi5GPIRyNnX0Yu3NWC24DlbpcovE0KinGsjiq3DEVAfNtiBx+DlVIjKVa0W5JrCNyJ5SsIEhe55bmX3S7VbzjdZ6ouOut+PCTZATc3hBFVWZJ6FYYWl4gDJfPSo9/C9OXp+k/KYP3/wfUfls5Fbc026V34R+FnCRKw98qSd4ppU12plcpA4MrF4+h4nTkSSUPs96w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGJhyMvHJmnLPf1cEHaU+SW+rDF6pCEFpuhp+wXQBC8=;
 b=xq9Xzpu6VEh3ph2SQ/sxe4jSA+xlwnXLDn/46OLwF5mSHfrvLaoyR8b6D2RIzcKWIRpqyAqqFixeRbfr4aQz55HEV1hU4sX5VtO6Qf2vbma4d8cf+6zp38cs32Y2uf4lrNtXzZRnwrhwALm7ipIB7knT6QdO9i0aT9p4iIV1XLk=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by CY8PR10MB7243.namprd10.prod.outlook.com (2603:10b6:930:7c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.34; Sat, 2 Nov
 2024 00:27:21 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8114.023; Sat, 2 Nov 2024
 00:27:21 +0000
Date: Fri, 1 Nov 2024 20:27:18 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v4 3/5] cg: add argument mapping in the
 trampoline
Message-ID: <ZyVx5oA+nJSqzctw@oracle.com>
References: <20241101155712.397674-1-nick.alcock@oracle.com>
 <20241101155712.397674-4-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101155712.397674-4-nick.alcock@oracle.com>
X-ClientProxiedBy: BL1PR13CA0450.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::35) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|CY8PR10MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e8baf7c-5a5a-47e8-3e71-08dcfad51d7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M1v9y6+bDpUtsTpXAtoX2zrK49rI5f1nCXIWrv7YIcCB2OgjLwcDVlf4uYly?=
 =?us-ascii?Q?IK+0hfcve37eeZmjPpJplpDGOWpJ1P4yO5H5TKp3aeeORoyMDA9EBBipMULj?=
 =?us-ascii?Q?dLTrjuMr1VbFVrhoZOzLfsxn7wJbK29iaV9l6DMXPhM4JJFYwCNZVnvVrdFr?=
 =?us-ascii?Q?xE0CLxr/+CqmBAk4g2au30KhXorKyohs8j2QonZP3FRgVK5PL9AQYgkStYAc?=
 =?us-ascii?Q?soZw1Bjst2OYZfqxBQAZizheNCQutBLWcs6Abj8hzB+JxrIS/qlX52S4cmNo?=
 =?us-ascii?Q?FLfWEUWPH9MNtxCn6PCZqLXnLzVOV7UkIeNmtmUvrL+IXHAamOA8udFlrHab?=
 =?us-ascii?Q?e06DmmHlN84n1he/Y/Lox3U+qHr+DzRecAoyLeD630431806LQnTyAVPQtSr?=
 =?us-ascii?Q?xN6kRPRTfooqbMuKvVZmNcnraCBLkM015A0p+xJdf0j2FFkTvfYTlqR7QOtn?=
 =?us-ascii?Q?E6M7I4GFaPFAecPRTD9oWr0iiNBWeR2FrqsX2wjqi4H4XAtwzwCiT4XHqMFM?=
 =?us-ascii?Q?hFWmnxgysxK1mEKkoQDUbQXtMUvQRq13VGZ5R9CBrdjyl52DNl8asSzAa8uc?=
 =?us-ascii?Q?9D+dfGX9I/0pCe7aKvGZa868SurSepjvVWgeiPiYoNdezqHfRVhM1Tw2kxK5?=
 =?us-ascii?Q?YfTSgZOQmqkJkLEal5Vc6hJ4V741GxdT5NGszNg/abU1dSqleMtJk3nJmvWJ?=
 =?us-ascii?Q?vZdz0edokDDiw/34GlZgrVu1CczqE3w6YcPXkbK4M44RWz0mXdrhBzQrkzFm?=
 =?us-ascii?Q?WgmclaW2NJ5pLwCPbWuh01rFqJTnQxELr4h2VDHaJRVdKygCNuThCvNjdfcN?=
 =?us-ascii?Q?K0p+a/h3SKNLmMla+r5WH5B8JLVTnAp3yghl5rJt1cREYkMp7A08MSvshUtR?=
 =?us-ascii?Q?vOuPtU8EYwH/zTlKY7epxUR8lRWCEcez7rBU2o6C5CRIUf39E3XF9wdBxy25?=
 =?us-ascii?Q?+XysNcGd7rNnUOG2dK/PX0eB1E/C1T2ZeBEC8GcdCsW+XXocMu1W1v6WK2jS?=
 =?us-ascii?Q?fqAEhpnxqiVJEFwAeaLGok97+EdhjQkLOiCdo5V5qWGKbfC+UrhAyzZVdRow?=
 =?us-ascii?Q?8KVKeFRvrfkpysQbBoKjsdLnnk7cBGJP0Oas8/EwciU5V9t3FUp9SSt2XgfQ?=
 =?us-ascii?Q?JHIIeMvNXAYo8R55VTNCXklL86JXOdyJCVrMYV4rMeaHgXHoFQliDz4ppHUz?=
 =?us-ascii?Q?qTic/VFDBQu6xb+D2lJtJA+iVUQljX8DSavS/r87O3W8+LeftlpXkQFjOU6t?=
 =?us-ascii?Q?m/MAn1QzE2S6R7kpmy5ZuKh5QTQQBgTjEn41HIEbrZkqm7Km5i0VGcpVGWKi?=
 =?us-ascii?Q?JRfwGM/wcGLz4Ua5OiZ4oHqx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c8A4KErH5nxcWSUugcC6689l8vvcKAJEVaupln2CtMlV3eyA2pEn96612pdy?=
 =?us-ascii?Q?MHDTmkabre810W9P6E3xlK/43WH5tOReT3RvOyRuin+f97jVL/ZuQoTgVz56?=
 =?us-ascii?Q?hv3SHufpwoNb51W/xkpjwqVghZZACeWz+05PPAHxWKR9HNjgKOX6NJR+R61L?=
 =?us-ascii?Q?SpwL+0dWmCLUPYnM2E7noa8hlHZ1yI0fAukNZWSBH7mTLhrNwCBkskLvHwwP?=
 =?us-ascii?Q?KAczxXkRNgmfeXe0io/4E0/wPX9TOM8zeR7ANN+CCHY82FEN1w52tE+7C7Hv?=
 =?us-ascii?Q?ZBnI3Y0Ig18eu8Gj0YOARVQQcp6Pt3F7TQq7ZMh4Fhv/ubObiynwLsGdLs3S?=
 =?us-ascii?Q?k5mlaY1DecFJHqTJ0eE6/tnVx6rAXI1XEZw/s2lbB5pQvVwBH3aCoTpxfN6S?=
 =?us-ascii?Q?J++tGwHy+hlYJsbTXquWX/W3TI1JBrQhbBDkmmnmXiQFMlSfL6rVACeT0YeS?=
 =?us-ascii?Q?8Ns2zJ2ZQFjCzzhMmIsWsxyHUYkfYninOpmGbWIwOfbkUHATYikMjOloc25L?=
 =?us-ascii?Q?TU366LpdHYCCbCONcteLVZM87X5s2KuiCPHTvU/yav5Sw5QplnLa4szzH8Ax?=
 =?us-ascii?Q?0Yyx68RvgDwbZWrC8wb4V1XS4MnycNSB6I1B/ZZ5kUS3HcRWXNqAU3343Rbf?=
 =?us-ascii?Q?nVGndBEiUmX1Hi0+UU0Oz+x+ce4UsvU048rp5S66Ub9w2ZVAeIc1hLcA0YTf?=
 =?us-ascii?Q?13bpe+ewbtjn4kwAfx3bHoGqAeHyRCb0Ez0HMjOD8huMvrxX7QvYTuvUp2yz?=
 =?us-ascii?Q?yVBKXdKDlWSFdb/r74bCeVVyyTkmnZVJjoYVEhWcOLLW80nhFjIefwChppM5?=
 =?us-ascii?Q?s8Seh+Wi4/3Xiu/DhNE+PBz8O45AU9jz5O7hctKy8M3bEqf95t2n2BbKImZ5?=
 =?us-ascii?Q?V6XsxKxlecP/V4mcCVfeSl91E9hRcvZN3PIJd2o/FdwKv1axP4C+JmUNv0Nk?=
 =?us-ascii?Q?jrOA1jdGUPMD+xi1cJ5pkcd4k3fymdYUOadQXqBUI7z3vsEyCTi4qIYy/mzO?=
 =?us-ascii?Q?9Vv/PAWqOJeRGGk1GortbYEkPveA15Nll8XLLFuRsDG3ssC+nOy8e8YLMzyI?=
 =?us-ascii?Q?mhhFLKet3Yg5xg4Vu7SDCwVKJUJxUiLjlgNzOP9BcNcCSdY+2wT+/NxjBX78?=
 =?us-ascii?Q?U3lm7WTNH5p+ilTL/1125SqjaDAe1q8E1LkCmzz23tFr6zamRuueZVBZUWdi?=
 =?us-ascii?Q?UTQiETm8404B4s1pjZ9blBipHUk8JJaKSku0gapJaLD7oDE+g6x3psdG2UuX?=
 =?us-ascii?Q?H1QLMNdM03h7K2CVPZFKi8tHfKlds47l811Qw/zmBiIxMNa/81CVxhXWT5q4?=
 =?us-ascii?Q?0DJF96Z1llJt9scfLWMnckiJTofDhxa8cXKbMDOvLPG4KJXMmXmC6VRC6KdM?=
 =?us-ascii?Q?VFlmMHS2G5SDXY5/eeyvQBjq8tOOs0a5Ef3hvmL422YpiPopBUaz33jKKxr9?=
 =?us-ascii?Q?WtbR/u3+EMpzoIfJ5VAX8cjo7lOpeMhKKa5m2Gn+/yECZkcMZYON+uzvbTMs?=
 =?us-ascii?Q?Q3EakQut2fKJQ6tUiUJrVMuWjsLaKSMjg7Gp5uG9wSVduTZoxyvEKXZMVt0Z?=
 =?us-ascii?Q?HYJ2p/GTejBMkmZuKR4JVwqhYBxMo+iWt6fmrN5ULpTcesSYNVgL6Ib/tOoL?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1hLLo8xVeV9gK9ZuRCgEbfvs455v9HVnwjcKQB9Ctq5JV/NyjgepO1jJ4UeRsvy2wnSw0UemslGvzsIyG9cL3BAzGsQoub6gJPVJvkyEjvA9XxJL2V2OG83FPbcTm0O02nbjD76R09Ase8pjAWe0CmxdMc8tTMLzxIHd0sp6z6UAQo9Ws/U8LizvI0O58XBOD8N0InSc9My1ATXcrbcXT0CpsZekuET2zRcVB8whWCnFVtHPHryEeQCPlTQeXljwDbEJVgOM8a0/2hluaZzeYH+ZJUHBp6Vc0V1Po2Mz3tEaIyyF7nce7vVT9+Gg7QxYZTDqAWG4K1xHDeaCtdQ3pWfeAvzXZoU2utKjzhlWtCSZ2aLE09Zy3B5RZsN7Zp8c6Eruwstd1ep/xwa+YqTbToOMLibMherGkpS97lbp9tQtNu4YOrBVrxbTn8Mq5W2XTQKrPNHz+yHceyTaAt3RBbh9Iv7W5ezeNefreJMg0FVtXNNmyQaw4N77FF18EtLwu6VcRWhq8g7FRZMf6CyyswYtwB47egkXxoreKimlwbxIbMtWy/kDJfqsv8gjoePUrZKK41tDkRzZu1UYR3L0MQZwXOvkxwddejpJ5b91FuM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e8baf7c-5a5a-47e8-3e71-08dcfad51d7e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2024 00:27:21.1073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uw0zJG8ns0GGuxL5NgGLsxwOFOZoyV+EQ3aPjOKVpYOVjO4Q8QLktWwIvc/42If6B3YbcUZWcznL7HqOyR+wNkqWigLAhSZv27l3bDUdx38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7243
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-01_18,2024-11-01_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411020001
X-Proofpoint-GUID: l-VCj_qbOIzWQE2PZKcuQhzH4CupJaeM
X-Proofpoint-ORIG-GUID: l-VCj_qbOIzWQE2PZKcuQhzH4CupJaeM

On Fri, Nov 01, 2024 at 03:57:10PM +0000, Nick Alcock via DTrace-devel wrote:
> Before now, argument mapping was restricted to the args[] array, and was
> implemented in dt_cg_array_op in the same place where we decide whether
> to automatically copyin() userspace strings.
> 
> But existing DTrace testcases suggest that arg mapping is also applied to
> argN for USDT, even though this is inconsistent with SDT and arguably less
> flexible than having argN be the unmapped arguments in all cases.  Add a new
> function dt_cg_tramp_map_args(), which can be called from trampolines to
> apply mappings (destructively, but it keeps a copy of the old args in the
> save area so you can unapply them if you need to).  No existing providers do
> any mapping, so this is not yet called, but it's about to be.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>  libdtrace/dt_cg.c | 36 +++++++++++++++++++++++++++++++++++-
>  libdtrace/dt_cg.h |  1 +
>  2 files changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 39c27ab0ec0b..b90757bcb5cb 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -831,6 +831,35 @@ dt_cg_tramp_restore_args(dt_pcb_t *pcb)
>  	}
>  }
>  
> +/*
> + * Move arguments according to the mappings in the array of arguments given.
> + * The original arguments are overwritten if necessary (but saved).  In effect,
> + * this changes the native arguments: the caller should adjust the mappings
> + * array accordingly, and shuffle the native arg types to match.
> + *
> + * The caller must ensure that %r7 contains the value set by the
> + * dt_cg_tramp_prologue*() functions.
> + */
> +void
> +dt_cg_tramp_map_args(dt_pcb_t *pcb, dt_argdesc_t *args, size_t nargs)
> +{
> +	dt_irlist_t	*dlp = &pcb->pcb_ir;
> +	int		i;
> +
> +	/*
> +	 * Work from saved args so we don't need to worry about overwriting regs
> +	 * we're about to map into different positions.
> +	 */
> +	dt_cg_tramp_save_args(pcb);

I still maintain that this should be done in the caller.  (See patch 4/5 for
more info on that.)  As mentioned before, you can mention in the comment before
this function that the caller must save the arguments, just like you already
mention that %r7 must contain a value set by dt_cg_tramp_prologue*().

> +
> +	for (i = 0; i < nargs; i++) {
> +		if (args[i].mapping != i) {
> +			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ORIG_ARG(args[i].mapping)));
> +			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
> +		}
> +	}
> +}
> +
>  typedef struct {
>  	dt_irlist_t	*dlp;
>  	dt_activity_t	act;
> @@ -5060,7 +5089,12 @@ dt_cg_array_op(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>  	 * array index according to the static argument mapping (if any),
>  	 * unless the argument reference is provided by a dynamic translator.
>  	 * If we're using a dynamic translator for args[], then just set dn_reg
> -	 * to an invalid reg and return: DIF_OP_XLARG will fetch the arg later.

You dropped the end of a sentence without replacing it with anything?

> +	 *
> +	 * If dt_cg_tramp_map_args is in use, you should apply the mapping at
> +	 * the probe_info stage, since the effective "native" arg positions will
> +	 * be changed.

This does not belong here.  If anything, clauses get compiled separete from
trampolines and a given clause (compiled once) may get used in more than one
BPF program, i.e. it may get associated with more than one trampoline.  So
you can't really depend on what a specific trampoline does when generating code
for a clause.

> +	 *
> +	 * If this is a userland variable, note that we need to copy it in.
>  	 */
>  	if (idp->di_id == DIF_VAR_ARGS) {
>  		if ((idp->di_kind == DT_IDENT_XLPTR ||
> diff --git a/libdtrace/dt_cg.h b/libdtrace/dt_cg.h
> index 0a7c7ba6a8c5..fb26c125adbc 100644
> --- a/libdtrace/dt_cg.h
> +++ b/libdtrace/dt_cg.h
> @@ -34,6 +34,7 @@ extern void dt_cg_tramp_get_var(dt_pcb_t *pcb, const char *name, int isstore,
>  extern void dt_cg_tramp_del_var(dt_pcb_t *pcb, const char *name);
>  extern void dt_cg_tramp_save_args(dt_pcb_t *pcb);
>  extern void dt_cg_tramp_restore_args(dt_pcb_t *pcb);
> +extern void dt_cg_tramp_map_args(dt_pcb_t *pcb, dt_argdesc_t *args, size_t nargs);
>  extern void dt_cg_tramp_call_clauses(dt_pcb_t *pcb, const dt_probe_t *prp,
>  				     dt_activity_t act);
>  extern void dt_cg_tramp_return(dt_pcb_t *pcb);
> -- 
> 2.46.0.278.g36e3a12567
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
