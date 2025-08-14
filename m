Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324ACB665
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 20:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755203623; cv=fail; b=p5f+vFC9IEJ5FsPpZDqUzTqzk4ca1l4Gp5PHZfu6AgMqDyNOfDGY1qCOft0SHjSNoHKw3W0UHNIY3L8FUgw2ow7W8Oa0aMeqps92aGHNVXPP7dNr6tnef7fdnEkK6SIj9OyYwEJTMESTQ6PH0qT3sz8srCx+3yXcIn3iSfJtekc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755203623; c=relaxed/simple;
	bh=Ns6eaU6K7c3NMcUPSxs6X/tDQJjYQa4D0+BEpFXCSBs=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=ZjGnw9bvciB+eEaNOJuxRqiekDmZaDciZfXixyGjtiD+ure19q8g6a8aikMHlFUvzs4vV6NlYEVKgf0wE84aEf4N/xCOxAsumJE7+pKEaLmiKCr8lm7onYlChCQk6iGLa7wnX+A6QYjK/XaSWHdnym/qIKhrQ/RZozzmx97JTSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Cyf0dmjj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sjTvx8DT; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Cyf0dmjj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sjTvx8DT"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EHg7S4021875
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 20:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=zD1WfMAFyURHt1qn9nQ80Cw3AZQrImf9Ieq7my4Lp68=; b=
	Cyf0dmjjke6dZ+Ez5Oi59nm1noZSXhAoSlyYnGZJWHLVgJuNgpu1KAwPGwC23w5Y
	wVJmIFJ7ONGJoKweRVVg670NSSVwHR8Wj8qmiJe6GCY5IYKFh+56OjzL48BA6iHq
	rbJGYQmYQ1HVtKq9eUyxzdZZTqa5aaLB6roHFniofLCVM9rRq/F0Z2yzxm0G6eBB
	+LKxF8+dLL7U/I4+5qTeLFg2dQXSypOvQWzfgxqkRraiWTB9lkHolYPGKxAvPome
	Pg2AtiZjKKphQTr3+yVDt/LYuS3KflvJ3n6va/TY/fsaDQeD4hNlOoKTQh0yp/H6
	uVdQVjG9PUvelHh/MBFI2A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dxcfb0ya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 20:33:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57EJ1UcC030019
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 20:33:39 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsd7ebt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 20:33:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D+Y5HhdjXachhKBxBbKURudq1BCl+JzJwuj6fsuzX4WxIoG5OUOqY8+Vgl+tBkf6I0ER7EQKf+dguhPC2NlIOhCDpLE8sZvs0t8TTRtyfPy//W/HlZSOCd+WOBYPbAWWgsnEermhYa1lCswJN1ax00Art7l6OFNX4JmTqsi1BHuMAKX3nxvm1Znuc7YjdCbrCPn98Yh1qLg5xZmJTrDZO5Zyr652ET2CUrdX9VFslQ+cWXka2/nT/XmL3EJcwLW+y08rQb7BgblO8sxCrcjBiLnBBtTrJ8WzVp74ngAotdvTBhh5eSP5G3JyLiP003ue2KHa8SuVT534dwFYzTOMoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zD1WfMAFyURHt1qn9nQ80Cw3AZQrImf9Ieq7my4Lp68=;
 b=i6BaG1BfOWFH1ZfUbQzX85WFRb2CIULqtq6NY6USJZyibmLCjBsBCjyvxQv+gZKwMZrHHItsEqkQ4RZiMCSx648iMEP3fGf+XZD3310l+MfQryxP1Kt3nfJdCT9ch6KUnpk0+cfR9hIODAER36eaJsxDjTwCgnch0AKh5FNt2IeaWj5hroZquFyFGLsYplVDaPNqKAVouEDQEnWyswjvdtnCC+9OPWTeMU1O0tslhjSS5An8hLwefC82MG5KvkfGGrqvj5UA4Q7gSt5eUYUVMtXtHj2ZRNvzqTHR+iwjqFwuXetBXfc8Mtpe3MlhRXE0PEDPjYHj2R8lvcKd2kXIDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zD1WfMAFyURHt1qn9nQ80Cw3AZQrImf9Ieq7my4Lp68=;
 b=sjTvx8DTSwXz52K0NqhERPf79NFLWu6Yf82PlLlWRfe8oIRNDD5vfCzz82m+UhB0Oz1QRNAssfi5dXGuLwIUpZyqGjUyTB1tHsRk98SLPeKtuwkjgC2uQuwVvNXJd/VfOMhEEhiRmj7S54UVamein/vyiAFdM4LYbcDtGn0xKPs=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DM3PPFA632C0238.namprd10.prod.outlook.com (2603:10b6:f:fc00::c3e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.14; Thu, 14 Aug
 2025 20:33:37 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Thu, 14 Aug 2025
 20:33:36 +0000
Date: Thu, 14 Aug 2025 16:33:35 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 4/7] trace: handle the empty string in a sensible way
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:208:36e::19) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672990FEC38660C30ED473EC235A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DM3PPFA632C0238:EE_
X-MS-Office365-Filtering-Correlation-Id: 092c0927-eb17-4f8a-34ba-08dddb71d88a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Gg5cOmdaZ1VSFAhUCSFXMs+maH2oAXxnPKS2zFiurYXx9m1Zb3hUS87mKJK5?=
 =?us-ascii?Q?ne6a99evcEap4exNvFNeBgD+2YHD+8dp3GGfekcZVkAFjPp0A+/ESFzIcwRY?=
 =?us-ascii?Q?XPpvIL1lwi6U+Ep6MKlzLO9IdID0xdYUQMKHsgSmInuh5g6AusTwahzcigva?=
 =?us-ascii?Q?yoXNk2c48uCcffdxZW0TC5XGgp8FubMpyvw9SVyhIXmawiRAohBQptLptlRv?=
 =?us-ascii?Q?iRZQs+ttGL98XHz3BHImMVDTvZ1KURmTcIFhvTfQFaXs1M2SVyNeDDB0exWD?=
 =?us-ascii?Q?lBOZN06wuFuhGezfWiikGwW+Uo9Yf+8gp2Us5+jSnBPT2hTWpunvfmUrZeNX?=
 =?us-ascii?Q?TqvwRHtw56LP+GvR+VOIVitsQmFsSXxrMdQUucsrwgPnfdVP0hQPZAOy7m0/?=
 =?us-ascii?Q?mB307ifPThp4/QmjALPGQRCzp1W6nprULcYwQ5nRLyUMYEUpKyIqiTqRDvZk?=
 =?us-ascii?Q?7MxpYB7hZ8GTyiqvhoVOPJpmSHnoc2jIseQtDeiP2hDt4J/Q0iQWoIbDPJZZ?=
 =?us-ascii?Q?4UVxc8T9fJP3Ajy3VKcWECEpJpYXVX0ga9cANMRXNWs3yx1FM8ctqoYyb4Jk?=
 =?us-ascii?Q?BCqIjKq8tmLpq6i39PlCW5iIiN/x/9KwnRJIOVgsHHfr4kf4mnhK9iupyxcS?=
 =?us-ascii?Q?sjOudwWhTD5nAJj7q/UnKwMq82CYDEybyY5gO4cDi+pV8f/y8nsl5e6G2gMn?=
 =?us-ascii?Q?sIB/N3mE3G1hJpuWC1ixa6oys/ovUByudRHX+uQBbMUxghT+qRPExXzl3mMB?=
 =?us-ascii?Q?OxB26GkKmzaIaGMU9NIwEKclTZHN5PnZXxQwl+lrWVcqqWjnp1u6unTllgcf?=
 =?us-ascii?Q?8U+Lfm8inHPJ1E+1HeEw2LZYPdy8TIhcpy3YmRJgl4qIwUFIiziPHYXTFS5N?=
 =?us-ascii?Q?HunBBSBJIRGatGMj3/6lXWl7HOnYqPPTItt3BLH8VYkpLFuAnJNCScsPBvwi?=
 =?us-ascii?Q?SGrj2JovHrCrEBP3L7S6S4kyyprkWdHoWopg2GHiauru26B+nWxk6q0WCrof?=
 =?us-ascii?Q?Ux20omZaxtiiw5fWUKhU6f4GQ1P4WIpsKQsxRQQFzGRRHydzjLK1M77Qzmjo?=
 =?us-ascii?Q?8egZnnuH3YN6EvaeZWL269tvImgJzHXLgSKgpKlubcl7HDu4yYq+uFcUqn5o?=
 =?us-ascii?Q?7PiXM1jhtevwNx8qllY6I+Ikrvy2oIO1981ePWkxesmHf+ZmvL6BLxJ/EJ6v?=
 =?us-ascii?Q?OWQxckgSCixMHskGYYa/GgfE2ZMAQOaYzGmkrXxNomBN18f0bHvAMl0xz4ZL?=
 =?us-ascii?Q?cXIK9XNmsfFLqJXUn/fwfCiv8bJfy67cv/DrVVAd71CvgorXFu6CwAAgEIpn?=
 =?us-ascii?Q?/hdHBfLJBwSTihwl7lpCHowLCfEp6IXZvKcQX+2DakokPxr1m2j0Ppn643pV?=
 =?us-ascii?Q?EzTGe4fBn+x20HKuuHvuUJgFYTke4THiRuvS1wLR//oNQ6Pp/Ip8dZkP4no0?=
 =?us-ascii?Q?NUEnpl61SgI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3TtMs6rQn036Ym1YvZJ4/67IWPl9dlEQKlj0xZlcjPbxB49EuYbOjzyBeris?=
 =?us-ascii?Q?oMbAOpODCM0wnPMb4JhZja9ZYrVaI8htkRBfgvtV2hArLWb91OrBOYXX/zvd?=
 =?us-ascii?Q?96+TSPKlE7sP46K6wctb+rf3JQIr+JpZE+ejbib9HIx5jVL7ryRWqA6KuIqx?=
 =?us-ascii?Q?kCEupHsQ91YH7r2s9x/ONTQNrBiEnx4DXm3XpWmEeEa7Y27+62kOQiA/BT6/?=
 =?us-ascii?Q?wQYqPoD+AIjgmWShpeoVmagiNfVHQAk9NssXppZiSpkslPVhWsI3HrRWkhdO?=
 =?us-ascii?Q?Aemr0akc1oOPczpnPJy/SYPXgHj7+dm6yg0luWfftWIYiidOV/V3dSfe95VN?=
 =?us-ascii?Q?PxG6AiZjo1vWlc73v7DykS8EVhlR3Rv8W3XpIgJklowt+bhz4pVQtdZekwgA?=
 =?us-ascii?Q?fgmt1XaLczZKa5SXTF9KYqyvSJXvEpNabQSeex6YY5eeFPJ9o9IVLNZU6TKf?=
 =?us-ascii?Q?LNT+xWQKq/uWa8bvR3sAJ47uKdfRTaktI5fpQlJCfrxj8sVZbatJMqbDIh3y?=
 =?us-ascii?Q?MWjK+VPLgwWlNtJJiJiZQhrbpLueyJwrQPbKxQ4pG6fCAjDy/wRE4+0UBd3N?=
 =?us-ascii?Q?X+ezERn+pbIsk2JDlKIxUQCMYtCODnW0P46fCGrI/3oSo4zwqb85RBqJZsSj?=
 =?us-ascii?Q?2T71xb87GxXrx2IAgYBUKbiQiAezRUndXrnrNJHbZKAITTjBDdBdno721dJ8?=
 =?us-ascii?Q?e2z1nO2LfdMubNOsiP3cz5/0ze/8vKjw0B8cXCxlpgF7ldn6heSiAfPAdLGd?=
 =?us-ascii?Q?3KYrHauM/r0EvEL9qt87OyE4F3+HPaeP01Zz5c6oBfZn2J3I7TVj4S94jmHF?=
 =?us-ascii?Q?sPg9OVEm30o1p9849b0TGm7OCeDet97M2musT/w9+TXERH/OOheBCpq8EToA?=
 =?us-ascii?Q?KSApZpdz7QbuVERYC4UY4aVJvbFOq9sXB9opQ7JPtV5ubBR2CG2veYl4RRiH?=
 =?us-ascii?Q?h7Kt4s76FRGJVrYWOJ47FKgIXx6HdaMQ1/iSaYjjtO4Oo2eqwGPL8mc83z6P?=
 =?us-ascii?Q?E7nV67CylfwpoFA4ATkHS/5dSWWx0PmD9Zc7EMloGBevspZd3HDlNhiSMmhj?=
 =?us-ascii?Q?Ip/JTC0az7Ehvq60rOUd9qGRT4EoRoKjbGS6zMJ2vPkWREZ3NSSYRMm+EfmV?=
 =?us-ascii?Q?Z++9zobOCLDjGrpB3dPrSKw+g6jva5kBTR4s58CsZISz95mV2wICDhOQHssV?=
 =?us-ascii?Q?hWzYW43k1uBwq6qHKTXEx+MEILj55lZxFIE3dfd/uS4uU4kbztAD0HFaQt++?=
 =?us-ascii?Q?TscNTNitEsd2YJvHWbt6POAOwZN/+DvVl2OPQKdE6edkzkQ6AbByDrJIDgvp?=
 =?us-ascii?Q?mN+0+5uRv4IsFljK2AvZI0D3r2/IBP4fyEy7uT18/THh+0Q2jEV8ZQI4BqSB?=
 =?us-ascii?Q?wMJU3dHBcc9oXDP2z2mGl9gsfomOofCGGh036xIBw8xhX8JwZwOdGYXhbWmX?=
 =?us-ascii?Q?TiKy5P7aYpbdO0xQ2TrnwuUKQf6WtkWTDo7UrL8f8FjZw0XXbUF7Issf1jP0?=
 =?us-ascii?Q?ckx2w/9OGJPZzamXlKJsdDXK8bQzVreuM8Pt5LVKPX+dhvLooVzhALTAnw2S?=
 =?us-ascii?Q?L9E5qYoDJzGXeRT+nakyj0vG3nzCeG/NrJ2FDjlSVr5971Zxb4dbpp/kBaLW?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Z9DouVHpimyiDeymMByhnciGJNn+vrMyRXeaSdGKZTIQxlNDPeBQeFW6r7dKlhJWC9jk5j+lqK8w3FUcGHDGH35IF49IFvSlilbnc5wAFYRe9aLfQOdOENA9irBdfJDO1Ai5eQeRnddNpMXai+e7N8OxbLfXf5a3+I9ZFWhACRx3S9mtqAT9gwECn3qvS4UL4inyZcrMV350ThnENmmVFwWI22k7p4NMKsM13xvY+a3yZa5lkc3kkxUu84TCiNlH8OIJGN7QN1F634EkJW/cjzmFrwL4ruFgy2ohf/VIjhQCJTFAsIDBbV1BtCMrcVtlCYt0u/Sq7Dkt/xh17tgIuGVUTtEg+XSjoSCpcTHFAmk2rm2hVyQZAk1F5sIEhINlOCahrabTJO3Fs0QeLYa7ifrRho2zxJwV9SzurQaroMotkdeQhmpFcnEVaVFKRYP8LW+LhwBpnkfRsyP0GzGArcknd8O/RPEieEir39IrpsemuVO6f0pj0FdT1wdVeiucDcqjE8yFmqXuyKhSDkIDAAx3/jX725vBfMPKLmzb2CtLuom8QkzxJVN7erHgFkh2tnE5VKETguqRAW2ukmG/9KMCT4Vu2nyorOPQeg/jooY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 092c0927-eb17-4f8a-34ba-08dddb71d88a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 20:33:36.8001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f9bBCrw2G7heI0MncVYxumAnQHoJJhJNS6xxjeYlF6n3Z4h+QEeOAYAfbdlv3KFuvVI9D0kPoPeT+EXZa9XvdzmTJhxznYkAsTDWvapoBGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFA632C0238
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508140176
X-Proofpoint-GUID: 4ZoTJs_T2kA1q0mL1zocAX5-rdf2I0tK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE0MDE3NSBTYWx0ZWRfX4ZH7QyM+yupL
 abutDo8Tp9cRAGbbMViAGJTHUT3FAig9CuR3oxqhKWBDxqSe7zgk+XxofKzF2EWJYrPVNOyD6So
 0GLRAteUSm+1ohlHsUWZiboDVWNhpPfNz6UUlU121L2CNRqV3Dfc90UdnvKmFxI2syp44TUk4AT
 K+CwAfS1Ife/+KlQN7Htwnxd4+lTk+KKv82lvSKtRoZaJTJzLjbw1mz7RWwmpCvc52tlOwHHy6n
 7HOPRSNEPau/LelgvIn7sTWVNk83kpwg8bhHbBZZgnd/zyzkOvvYsUIzqKSHxb0LaFS2FAPCVLY
 GI+InQwpnRc4gWpC72a1bdu7uJ2zyYiErLnZbt2eFBCl/qTqs3lYQvv7aWNVTwAZJl5l5cLzhjU
 EzoEPAcIPQioLKRbpP+VJYEHpy5TwpLnwDCixUOPVVy20kydS30ZQ9UFl3yt0ckhiX9N6w2+
X-Authority-Analysis: v=2.4 cv=W8M4VQWk c=1 sm=1 tr=0 ts=689e4824 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ZxrUDDfu6Q-KsIydxcsA:9
X-Proofpoint-ORIG-GUID: 4ZoTJs_T2kA1q0mL1zocAX5-rdf2I0tK

The trace("") action would dump a series of 0x00 bytes (strsize of
them) rather than printing an empty string.  While that is the legacy
behaviour, it does not really make any sense to do so.  The trace
action is described as printing data as a string if possible, and a
block of 0-bytes can certainly be printed as an empty string.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_consume.c                      |  2 +-
 test/unittest/actions/trace/tst.str-empty.d | 18 ++++++++++++++++++
 test/unittest/actions/trace/tst.str-empty.r |  5 +++++
 3 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 test/unittest/actions/trace/tst.str-empty.d
 create mode 100644 test/unittest/actions/trace/tst.str-empty.r

diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index edfe5bbae..2dce69d6d 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -991,7 +991,7 @@ dt_print_bytes(dtrace_hdl_t *dtp, FILE *fp, caddr_t addr,
 		    c[i] == '\b' || c[i] == '\a')
 			continue;
 
-		if (c[i] == '\0' && i > 0) {
+		if (c[i] == '\0') {
 			/*
 			 * This looks like it might be a string.  Before we
 			 * assume that it is indeed a string, check the
diff --git a/test/unittest/actions/trace/tst.str-empty.d b/test/unittest/actions/trace/tst.str-empty.d
new file mode 100644
index 000000000..38fcb8857
--- /dev/null
+++ b/test/unittest/actions/trace/tst.str-empty.d
@@ -0,0 +1,18 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The trace() action prints an empty string value correctly.
+ *
+ * SECTION: Actions and Subroutines/trace()
+ */
+
+BEGIN
+{
+	trace("");
+	exit(0);
+}
diff --git a/test/unittest/actions/trace/tst.str-empty.r b/test/unittest/actions/trace/tst.str-empty.r
new file mode 100644
index 000000000..8c15aa7f5
--- /dev/null
+++ b/test/unittest/actions/trace/tst.str-empty.r
@@ -0,0 +1,5 @@
+                   FUNCTION:NAME
+                          :BEGIN                                    
+
+-- @@stderr --
+dtrace: script 'test/unittest/actions/trace/tst.str-empty.d' matched 1 probe
-- 
2.45.2

