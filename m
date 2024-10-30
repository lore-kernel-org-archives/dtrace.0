Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686AA1E8859
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730290390; cv=fail; b=a/34hZosi78GqaR9rLUw9aELFrVAKQOGFx+RNUxk99Mr9L9rKY5U2sl4VmNJxg7O643XLXuUHKtNTFWkBsqKfhNNh6iyoseZEvjRR+MBhdqANy5MrNGXAnANionYiV9Vu2RWkA9MxyOARdlUEtBA+q0NhRRpvDt+3NdOJmF1kR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730290390; c=relaxed/simple;
	bh=8sCMHpe/pv1qNkQ1sd1uNavczThnwOQSiJXCh0erdfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p+yTzQufRBbxOExUkKH0PNZgs1sNgE4CpvRl8PE/EbrpTGk0B0jd9rAQO01h096TsvfDibOwKS1cmENv75jVFfJ5TJbMv0mN0ZLCNRMvMq74WOTNFk2VcJlvYe7rhysmSmVg4fUQDKnw0PC5XC7/LyJ56IJnstfL3ns4xAHx7hQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=U6O5/4IN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tWxsQJ94; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="U6O5/4IN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tWxsQJ94"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U1jGdG014162
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=j+D1nQOYax5YdUcRC47gY4roBDGWWYdk+kyO+c9dBxU=; b=
	U6O5/4INz2+CX95mvgpWLc0tcyFW/jqmahigIw0HtWnFSIyPeGeFX/4lUTXtSsEN
	gxLdZbZkcu6mnken9/8I4lvN3AlbrCZGUuGVrFiDxx3brSL9lQBuw2DEtOIi8BUk
	ndVmHGQpu8D+0JCv4xZ7cGyImr1eli9OjM3fUbyzQqmycUxXkEDBVVML5PqJLioC
	upgtzRpn9wqnMT0IzVZjBOBiP63L0YGuc5ugoLNiQzAIgo/5f/KdArZH984plQpK
	8Gdc1zQKxpg/7nCb52SxiNeHLr/IeKL31OMimSayzWBKu2jb7awRh8uRzr/PYpIp
	PmrKsuZ+8b4hZJd756Iffg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdxquat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49UAF8fw034748
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:06 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2049.outbound.protection.outlook.com [104.47.55.49])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnd915vb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zBAxcGrO7uiHNV5MPmAyg10KHb9TCvvMz7YCsKwZNTW9vJGwSxN2wAhbtII2cgIf3GX5TRofaEFw2+B89TjHr1QuojkNL41D/uIBh4WUPCgoxL7neqmNtQcem/U/HB2SU0zrobSs+QFfxIsusCWeMJdOQzmH0OXAIcrK58JOJ+6aDsbkksEsH8dBM8cgcfx/w6SQr/G99PEizG/0iYRyqE5SRl5CkKVPyZIJSECtyIcVSLWkha9wRZTiBcAi/WsCwRCFmBVT/HLDwk+iKvBwHgqYn41q7Fre3tX6gzvfeearyDEamw4h3qQH/fE0/74cvHGyChMtVE1GaU/DG+wOkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+D1nQOYax5YdUcRC47gY4roBDGWWYdk+kyO+c9dBxU=;
 b=whPJSKjD/R+TOIZlCeBHJWgGEbO/LsYRaBDgj4BPe9VxjuvXHqsV/ebRAY7IjMpel7KRSU6Y0Tv3DU7IcM4NIXceZjolzMcW3PwArtd8IyH0gsvco6F3o//oPKsHPlmlIHGX+ofvf2GWW3o9bLVz4+/sWZA4ot4NVG8z3dKnd/qgiQvIGugzfcxqoUaojmTxT+9HGNo7vpLh3eNelWzj6AmNoyL2+93NXyQ7icEoy4wQiEBx8SsMDZmpNgsQD+nVqe3HgYciVeHku7eH8dPpwL6PpfWOchhq+3WjZL3H4SPMhDo9hdc/AegkP4glidKK/a8dXN0emJd2SOakfHGQ8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+D1nQOYax5YdUcRC47gY4roBDGWWYdk+kyO+c9dBxU=;
 b=tWxsQJ94HAftAVVl665HrK7h2VuLpHKlSW1/dLcGhWQNm5Co+Z/rWnXwcEp9btzinDLuVblU3MJ4rJ0Kl0nMIM/6V2jveBK84r07T26is/a4ay4gToe7COQ+jnEeLXmw2s4KQ64B3X+b1oGPsSh+/Ax5RMgkNhbY1cK3YG2SQzo=
Received: from DM6PR10MB4091.namprd10.prod.outlook.com (2603:10b6:5:155::28)
 by SJ2PR10MB7111.namprd10.prod.outlook.com (2603:10b6:a03:4c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Wed, 30 Oct
 2024 12:13:03 +0000
Received: from DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02]) by DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02%7]) with mapi id 15.20.8069.027; Wed, 30 Oct 2024
 12:13:03 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH REVIEWED v3 10/14] man: fix blank line in environment variables list
Date: Wed, 30 Oct 2024 12:12:32 +0000
Message-ID: <20241030121236.257803-11-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241030121236.257803-1-nick.alcock@oracle.com>
References: <20241030121236.257803-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0114.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::30) To DM6PR10MB4091.namprd10.prod.outlook.com
 (2603:10b6:5:155::28)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4091:EE_|SJ2PR10MB7111:EE_
X-MS-Office365-Filtering-Correlation-Id: e15e5d14-dcae-4ac7-db23-08dcf8dc3408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PFxxfoVz2sVshhb4oS7DQ3ViU0WqyZVkZiNzocpHnoPrHodjwbLcs6IK8TsL?=
 =?us-ascii?Q?YhxX1bBjWDnLmEIIzlAlefSRHj/uuSP6lR0DXiDvEexxAYgLZBPsB/zuLlb3?=
 =?us-ascii?Q?l9CqBWBmaF2KZ/N1zDb6RkGjE3blGFtHGgphnge+1E7WDYaCY5TNZyG8FusM?=
 =?us-ascii?Q?l7QGBVMETL5o9o9AS/oqZZVPmdkNTVs178HFUMHEbvwioHAkxuXFSmyjB8uK?=
 =?us-ascii?Q?JCSM9FcZsSDLLEGvC/LacZryk0DinENZO7iI/2822HVUNtG4FNXUmQseBNwq?=
 =?us-ascii?Q?Bx9iz+Oq3z+ZfyS8Pfwfo4vCWd32K/WDkZPJ/gD+tDC9bs9OcRuyn0ruecOO?=
 =?us-ascii?Q?+zqrlZEwA/7Nk9tsPZZjvbNYCyCGmobL0BjreeAaKU7tVpVkabBQDKuBL8On?=
 =?us-ascii?Q?gnhJMhjXcKMB5j9RdtkKe324RtRrIHpW/mnztEWXjimq6NBDOTLGpw5Q9aM3?=
 =?us-ascii?Q?fbr6N4M/SUi+0nWpEInqq3c/BfqpkxXU/o18GJ2URZshoJdlLgIU+MqOvoMv?=
 =?us-ascii?Q?jr+lCBexU1/P5jLYNHjMwzjDa+vmJgdUX7/lv9crsiZJTCGKz5cYgktqZjEv?=
 =?us-ascii?Q?vM9k+MmgIfsLjB5PvMo/eNgk8jShB41rwBiQhQLHA4nzU9T+0Ik9abQLWmzI?=
 =?us-ascii?Q?aCdHRE4ielDcEKchcdsATAT8SmSVuOBzalMiPSNPeKc353UaGogA6L0hAWkn?=
 =?us-ascii?Q?xci0+0B2MKP1+gjdGHZF1knTwNfIA4SRRf5la8fjikOX1sGE3kGEQiVIXsyd?=
 =?us-ascii?Q?MRoR1+1IWEaDaMXGlrnOivM0QuU2oTMGEyUMlZkzYQey1/qzZgVxLl4u0M7G?=
 =?us-ascii?Q?KFleAz+1v8NV67gBWeKwIyuJrKru8N6+3TqmZnom4BrVT9uRU03GE1FI5CBe?=
 =?us-ascii?Q?TqytTr6ZaNh51/Q6WZnod2pFfOjJfZD4CkkEeCnVRLRr0CYh54O7Xdqffs84?=
 =?us-ascii?Q?tlrfHkbsRowPGaHbS4taGryAQurS8M/K4S9Ia2MkJIR3a19CZkG0oawAQpLp?=
 =?us-ascii?Q?rWkOut4WZLuh1fccva7iM90YhV3BvkFr8HwuwY4Wz3uvw/mp20yDMNUORniX?=
 =?us-ascii?Q?yRGQ0dMjVzRIf7pULHABsj8r5VCPcMIMjlH3iyfqB7b8hui/0iQVD3fvya3o?=
 =?us-ascii?Q?vMgMv/1b1sZl1yN3/9rWhTZM2B8akhvShf47t3r00xsEDhTEMtQQ+6/79HcL?=
 =?us-ascii?Q?eHmVMgHlF0GhBG6fr16ncQImb4wCZ5LSE44uiR69e2SxsQparbIN7FsMy3OP?=
 =?us-ascii?Q?YvbUc9vnN8RwiYE+nx2K/lC2ceRnL3U4LsQ5YybyJJIU8RVYmB20L63M34H2?=
 =?us-ascii?Q?b6PjGipmsUU4/6NS/3IlPPbr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4091.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JrN80bRYpCL5eJX8r3UclMdNb5zl0Q0bHSiNF+S4OQnDMbKEE889+d5rgXz5?=
 =?us-ascii?Q?tKc3xZzBT/0lBAz2dQL37qWTPdLBwucqE6wINT2y833gMPPx3qbkDYd9sMbw?=
 =?us-ascii?Q?nF7VKEq4Hee/mtIyvvgZIFPCSWjR8gpN28dwAAPgk9dctJp+XVxnraJQ+b7e?=
 =?us-ascii?Q?d+jKUCNFd9hDU80FsuVfbKmCCFfdCpcGYDEhyfyVfYWkXlDcxUYAOpQUHja5?=
 =?us-ascii?Q?qLrNsoYBYqj/Tw8F91HxGB99k52fzSr2sxqTcqL8lNFf73TDpaMrwaTxmne1?=
 =?us-ascii?Q?KD5lfk4hZvM4SiT7wyctnrXG7Cgy93x8vCq6hrwT2hxxPs4EWY/Umd5plFDb?=
 =?us-ascii?Q?B/laa6E7Wp2JgweQdRYe4IS+nWXeqYE4Qc9ApTsyen71AASeF3ZKhsvEXIJG?=
 =?us-ascii?Q?+86HU2jvGRgxzzBwOiqqNu0jeGnP41RaWVuRZONcbAxAaBYgxytdfpiVVZL3?=
 =?us-ascii?Q?GjnKb8mXM3OY+2CzDGaaTmGKJRTGiIzMK6mKgj2cikWIxr8rmQOOKXeJ4EcM?=
 =?us-ascii?Q?qp+kByxFx82M1xCn+RzXprBir51unmgbbk4ujIVnZbnnJ2Fz/H0QusSNupsD?=
 =?us-ascii?Q?w5UjwXjInNJcOEtfj9P8TQ1BOt6PGwptfgxEh7Mw599IE5I/GQM55Owl96RL?=
 =?us-ascii?Q?EG8rLI+Fxzut1DHn5JPQz1eehhYf0wycqjjH3DrRJAoQMQ5jL9/c6uka0Me/?=
 =?us-ascii?Q?t42wrsR08RuXbLFRecnoEYuYTF7ja4bmFEiBh4QQmz6JZ4F7kCx3qcsuZ7IC?=
 =?us-ascii?Q?VnRNM4gimmzM1bFExzcSZz+D42HwDcCvkKhgKp/YPLGvtyyKA3O0QRD8D39i?=
 =?us-ascii?Q?1pG6BPt/HkxQEbWFl+7/PqecbuNE0bjqZN8iMJr+AdK6HMEdI7RRJ5oET6rG?=
 =?us-ascii?Q?ch6uLjv3BdKZTm+HBaIwoLwpiJ1YvdNj9UEvrN5lRQoUFgAyP02lus271c8G?=
 =?us-ascii?Q?zmMOTvFxBg0wmdf9kGg3xbCV2ADGxOhz6n42YJTOUq6l2ISbXHCTNGfx/dnr?=
 =?us-ascii?Q?jJAVjta2rBAFHOawl5Z+LgngHb5oruGLBgVoMMsgEi+fT4i7Ikv0wfuB0BdC?=
 =?us-ascii?Q?d2ouSVxV6NkUsk8NtqCBGPuJD5nQOwX0KueEbJyNtpJgy1v7dhgfLYsTNGzN?=
 =?us-ascii?Q?SYywERZz7mDr1eLb+AWDwLvNlxFpTlxhbgewaAFexggHL9fFEqZ+OH5g7NJe?=
 =?us-ascii?Q?QhjpKbBqPVFHlTa+1ST2nqv5H4xKIQ2dKVOD4W0V7NOIMfDDJQEcoqRnicA3?=
 =?us-ascii?Q?rz/Ba+LIJfozAH6dYO3vzHlCKDnil1IDcbDCvrhbXlvjfPrUdDCJ2vd00idE?=
 =?us-ascii?Q?ET1CoJ1oguK5vo/eB+7zoHLr73B0C1IfPU8OPYynVWVvBKzyWHqFnn3RsVWG?=
 =?us-ascii?Q?bHRfDJwnSVBzpB6AnFcoKdmm8Z2BAJFxHMY8KsLgTGXVnc13r2gzwBvNVbVE?=
 =?us-ascii?Q?WZURMDJlb+QnGocdccJVdxfgYWstu+VIMZNIiLVkkIT8P1vmhAgLeMmd+Ksc?=
 =?us-ascii?Q?bMXIMs/A0gU4E87AHBAvpO2291WnOHkgtZ2IPaG2RBJ4c0WzITBij+zhE0vO?=
 =?us-ascii?Q?ZLHVeQeNz2zK4lOlPju8YK+DDtLQa6wWZRmf+DTK16OE81b3qT/DqOUQtjMF?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8xEdJRPfs5pwBH72RWvwsxWhsPewdmnds5cbQL0na0Mt1UxiT5ErozC1HIgc3uMISpgzIaXbFbKiu3xNLtK7xkKKbhfBES8CO0n31m4SVEjNIKY84RCnI4Z23SGC+WhUWNZJr83QOTpvVee7EmqDwMJDNp4VLXmliqxRBiFXcTpXAgW4Gais3CSD3s0vKOSBCznDeLh9ySuduIBfrezE0hT8vTsIDsBLxgfXEJ1SSFNOVTRDmLyQv78/8mpB+bdno17cNQePhZHHqWgOV93cDgFrpSN/yfzCBrAkp2bp5xR/kh+3VjKrabFzSyimJ97kSjbCGaCjuDPqKIoc5qgPeDHJgHAHY5b4Ux2GJ2lw9pf12IeHzTBTlgUwuSGXxlc0o64l39XV4gVXFDDjjCsl9e18FidfHGdr14D57ecQ4uRLTh5DqPlK1gh3UcuGYbTTODY3MSspZo0CRHF6t0mZTgo+YVj8fFiXIoOHmRJ6hQragYiBOqUjo7hPU9S1Y5YVwasbs6cXmGmLf9Mjhukf2vTnZQOh2dBpNF6rjm2g4P36j32WZfThVixlSMx9Sorww9os/Kx1VjyfB/+auX7iPaJ3SiBWwGPN0DvIvoGpOTE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e15e5d14-dcae-4ac7-db23-08dcf8dc3408
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4091.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 12:13:03.0174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ih97pMy48OabZEzNvmw3MSMrnyeoHKRPW7SY84qFQ/3DOK2zVhK4SK0Trkv4801FarVmoNRVOg2tPWcgqfBEvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7111
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_10,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410300095
X-Proofpoint-GUID: XDYR_4yc1j_Y0i-UuK8FPnU4-L_sJbmB
X-Proofpoint-ORIG-GUID: XDYR_4yc1j_Y0i-UuK8FPnU4-L_sJbmB

Use .IP instead, to get an indented linebreak.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 cmd/dtrace.8 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
index 0639db2136a7..fb9392d29cb2 100644
--- a/cmd/dtrace.8
+++ b/cmd/dtrace.8
@@ -179,7 +179,7 @@ Print libdtrace debugging output on standard error.
 Print CTF type library debugging output on standard error.
 .IP DTRACE_OPT_*
 Set a given DTrace option.
-.
+.IP
 Options set this way are overridden both by options specified via \fB\-x\fR on the command line, and by \fBsetopt\fR statements.
 .
 .SH SEE ALSO
-- 
2.46.0.278.g36e3a12567

