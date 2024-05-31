Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15BF219FD
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 19:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717182013; cv=fail; b=m24jy6SxS5yfhUqlAWv0ZFCEXF67wvZMmNYjWQq2op8p/YAGwyjHn16MDVg49YJzHkv8xDgUICwF1/Of5bJiuogZV1qz6a2Ky+jz/PYyleBI+5WKgAnCdxIyZ0UOIPkpbzVsSptppmYvFUEoF6WAiwyoFQXrsrKQs6VM+Olsymw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717182013; c=relaxed/simple;
	bh=0Ct7vlrWs1nckV7n5QSl8EKvu2lk0qVs4EtIwW6NchA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aUtuLMKnVX9W+JoZoCPKFspW2rA9VyhPqrRKWOCjjyJyzfdq4rYuPj+ktzp3oLmDAr/aShfcYac1B+X+ZEo/z3GJzRJI0LmcU+oUDICjOQw1YDZe09Pqsit4G2ATcncqBUH7h9x0Yb3C/OrNqL3ym9hSpXLVXWu4+bPuHyLXJYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44VIJ8V9019200
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 19:00:10 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-transfer-encoding:content-type:date:from:in-reply-to?=
 =?UTF-8?Q?:message-id:mime-version:references:subject:to;_s=3Dcorp-2023-1?=
 =?UTF-8?Q?1-20;_bh=3Dnd2QuwkTykvDvAvHIVDWM8xUq521oUWvcB+9I4lnBJI=3D;_b=3D?=
 =?UTF-8?Q?J5hBjbW8F9zrGVyvuNFY9D929OPtPFTYjARJEuvKi4bQ3UAXoDh9fdmrDW5S+6C?=
 =?UTF-8?Q?t1FES_2Mfo9/xHNrWWrB1PpOBiCZUMQoVR8jsdlzlj4LFrWRBHqg/r1CrQeEzC5?=
 =?UTF-8?Q?OitRslgFORL_Pyti5YVnDwu1qZmrsi5aAs9L52wHWmjrkKwtWOvGYQWYm4DYWrq?=
 =?UTF-8?Q?ZSzi95LGKRjtYMnFW_sz8zTR8h9/hMSz2bu7niNOV/llz3Dbuj17Rwh7GdjwT4H?=
 =?UTF-8?Q?O9U+xx2qzFVWIbfJjUzp+ui_urwDkbz8wgkznQxpEqXpZzg5qXQixSECMtsHRHi?=
 =?UTF-8?Q?sXPV0+2lMJZlgpBivH3JMrb+loE0U_pA=3D=3D_?=
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yb8fckuhp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 19:00:10 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44VIikp5020559
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 19:00:09 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3yf7r2u974-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 19:00:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFEHhD86iwQrNXVLbotaH7BEADT0+0O+gsAZcEmrj5Ivb2ad6OQBe0KBSQbdEjoEddGg1SbwvX6cZakseMoRe5Y7VRUTSoJ++i6EvyLeuJulKJxsKFnVdGZx1uiv46oiiRvdgOfqX8ICRwdDL2coL5EdCLwBIThpB4zeNKvJJoxT98i5Wtv6yozDhenrHTq54mmL9wHukOpEc7b2y8FfH08R59fmOaZK2LtWjifkL2cX+CmM0A5hSa2hg40fUENGdxJDOKNA0SUhAaB/34AhTYntUrvNheMK5ophQBimssPDrdA20DiTnqJQUlAWWlJLZCGUdnVzgpWRd7xMIGpLUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nd2QuwkTykvDvAvHIVDWM8xUq521oUWvcB+9I4lnBJI=;
 b=DcUfMLwudwN9qS36e1MQraQw7UMNTvEfKv6DRofOpiWHs5vAsM5PIv7Ij9cTC1yYebQcwAjIsUuNC7f/GnWgS+uwD6jQO0dO/Ld2SlV88Vwn7Z0axqyUONMGo9zCI7Y5mexcc0XLoAbrh6HcrdwWS3Q7I/tCyxi+TP5foXAVt7FhugGaEX8YfuqK2rxbB15IeKzcuK0+H38kgPBe0LZRw21oHRQerO8wyAstUTf/to0PwSm9PnObSKCpY8RK6foqydoLgTgaNwUSjcJKFYKtLu8YHke0999mhz1LxLMADgeattQHeaOMC+8togmFmRu5L5PrF0k3ir1Xv3wrTVDY/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nd2QuwkTykvDvAvHIVDWM8xUq521oUWvcB+9I4lnBJI=;
 b=hI991zKQOyNhqHdMQ1+MlmjMW7VLIkzDOEg576HizK0o3gdMWwSXDm0rJfr7WoPSQhtRvNxImxdV3yiJ5XxVtqybxCHQIPhHkXiaLAE2RlfPKGGcjcxF80lZJjwNlj+5yK3KWSY0IYMHYlh5//TvkYZhdyDqFdE3gDjCW/gMFt8=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by DS0PR10MB7955.namprd10.prod.outlook.com (2603:10b6:8:1b4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Fri, 31 May
 2024 19:00:06 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 19:00:06 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 9/9] test: work when relocated
Date: Fri, 31 May 2024 19:59:28 +0100
Message-ID: <20240531185928.363245-10-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.45.1.275.g567cb0950c
In-Reply-To: <20240531185928.363245-1-nick.alcock@oracle.com>
References: <20240531185928.363245-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0218.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::7) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|DS0PR10MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: b65c7558-e261-4211-466c-08dc81a3e2ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yGiJUGINW4hkIyYzt3CKcVQ/POfq45w5mmeC+8ONRZmAcqIgfU0qS1G0ZNrH?=
 =?us-ascii?Q?sZuzlsW8EEik5ISHP7uhtQ9qxCfeGm1DAkb8Md+Tlt17OFVmcjt6kd4iUMyq?=
 =?us-ascii?Q?SC7m5cLdjTMBkY2+b/dEWXqO1m5PQCHQ5ZlTaqcnAATxKB4qYBYYN+PvsTfK?=
 =?us-ascii?Q?edlTorG6F0NwpTz2opDnNVCq/B7VU2qfXV9WxSlKCNLTyNKwyIPMLE6vcAWm?=
 =?us-ascii?Q?gZ3Q/53hpQeZWZMC8xEWjCSWxbjh85FSMSwONkf1xunSbSWFHbL5a+RbDzxd?=
 =?us-ascii?Q?lTksRF9jjQ+5Zd8GWQKNOW5nFXGqQRW6xZx68yIzmkadXYeipZNE/mMG5bfz?=
 =?us-ascii?Q?XwPkiROIvzZj/KxhB/9LGeKVp7bZUiVYy7sXZci1aMVVF7183YtYYzVZX4Qt?=
 =?us-ascii?Q?BwbOlfX0+SPXrEt2fm6Hvskl6gPP2pa7E7nLO/UUGBYgZbOGZx1bVTcyh398?=
 =?us-ascii?Q?eVp0nSxkg25MBeeV8kKq6M2JyBUicSitauICy9fzztXXjTodRKIdl7lpYpup?=
 =?us-ascii?Q?FGgv0EfnPdHMeSQr03HwmuyU9iPM4NJati1kVhcoxdeuv9Wj5LjzKfVclvC+?=
 =?us-ascii?Q?PsKqeZF50GKrxYsnmmvjI11HO9PspXFi3Uet9rDNjX4MD0a3eJzoAC8CAJhw?=
 =?us-ascii?Q?arFHUSvAMCCAy/bgkLmVyVkJ6AmytZHNDARqc9P2fhMdniS8CrM9NMOB++U1?=
 =?us-ascii?Q?2u5leyNrX9U08S2GVfcqEgyVmkgP1a64cvcj5J3VrDAcZs6e7sJWLi6G6Pd0?=
 =?us-ascii?Q?Qaj7Bg5NwAR2vhL8ntLyZNNBxVF0FNhGy2SPKQOR4xzi3KmBfdhfYzlUnjVn?=
 =?us-ascii?Q?o2/jmyJbwByFmSnu/4ObXxO93HTfzYXM2em0auujUDrPgospdZXUh67xM46U?=
 =?us-ascii?Q?7eiHD54Hu499xI99d92gTj3ql6NtIUgBDHtTSHxyoJBDlkmxuAhcVLk0sGYb?=
 =?us-ascii?Q?VqeHexVBqAyRbLryuBvLJMX/7XbCGvZ7WMBWZXwUeKXf9+qhzMeeVDP3fRKo?=
 =?us-ascii?Q?6Ep/OCG+D2fbdkaOD3sikkagRZX/6iV6KxIxjih/f9Y6NASzPtQNneNr/XG2?=
 =?us-ascii?Q?dDjlKu++UOXGhumeoXigeuCNfKO8nX2YkuQ7Wh0rISoXyaxpZyGVXu9v1kbw?=
 =?us-ascii?Q?v0gMaSZzppSqFaNMEyBVcBiuCvi7bMMP/tr489AEyUQa9C9A10s7iqiFhrNh?=
 =?us-ascii?Q?8nt9u9CjJvw++vvQkp+vg6kWhq7U8epZh/b4VdtzlRv6TCZLQ9ZInjCbc8TU?=
 =?us-ascii?Q?XfervPxqTALBMDw0RLGGoEV1sicCIbS3MTrFwxYEwA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xc5vUDqZzrRC+T0ZBV1svFxkO6P5EYH11JS5H73b4NnqcFaZb5STgxB+2tRU?=
 =?us-ascii?Q?j+VmUbrCaSvFalsBAlS5SwWiV2FPzXLKdsbwLyTzjSIlhlLJpIPRq9VsgqQC?=
 =?us-ascii?Q?D1V2uV/bY8wYKBQvSbFIAE8BwRjhbFg6KXRkDo0DeQWNcTNxME37cfVsFek3?=
 =?us-ascii?Q?nIjwHaQK9rz46YUTEPBC0LlUrIU3X8Tx3IZ0GfSw7xyVlvoNo7SExvcMo6by?=
 =?us-ascii?Q?aj6VV6X/z50Jvr4rpjPjXW2Vg+SHSgHrwt1CMd8ORVAwgMr6OJH8o+pqDrfz?=
 =?us-ascii?Q?Ln6JIwhFgRHzOnmebgU1q7xLzwpC66Rewrlb5TDEaeoqSnr9JZMFwBsGMZGM?=
 =?us-ascii?Q?6H2GQjcL8xRqto0m/loSkdsFtnbqzRNLsEykdiw7aDkNfNmU52XOQ4EGLvdn?=
 =?us-ascii?Q?I/wREpDmjMy527F4JrIf3CihLT30LBy6SHg3uZr7rX8vfynGu3IxPIQeIe9g?=
 =?us-ascii?Q?6rg7eHYNdaslVyRpgEPbRRwVv5ywZgomjb1mgZHyyJAkBrZODMwZrZfB1YCd?=
 =?us-ascii?Q?YYdiWvOu77P/U8sYcUJNEbRkTNZrKD/68Jl3FRcJM3p7DiIo7kCLgGKQxMrY?=
 =?us-ascii?Q?hhTsT2cGOkncE0jQlHeAe+qgAqDn8vRWkX1l2Ks21y9RE+F8pv21NIqTc1Pq?=
 =?us-ascii?Q?8dpimsQ6gnrwzR0plhyYDeoRhqD/PbBJrDzkUj1hfGB+uI09y/wPbX7B80IE?=
 =?us-ascii?Q?xdeIXDp9QRTUdDtZASvvZPZI0TI/A+LXNJot0oGolu8wrLuazi/xvUFvauy2?=
 =?us-ascii?Q?r//UbrbPRk2g7Pxf3170QSyotviRIQhYj3vdg7PF7Le9DTMqJDaqCyax94+P?=
 =?us-ascii?Q?6KRlct/QyLqg3DbdHsvLMPDvDGrq/cECeKAaClZH2AlFhb9YVzquEMnG4z3G?=
 =?us-ascii?Q?GpSrOzyQ6urgyojUof9fuWG6qYtVl3kl5t6dwBDbT0q8Wznu8K6BjTgRONUP?=
 =?us-ascii?Q?TeWSXx8y4tpkFeJVc2DsFAPy1gSbZnWqpUfNP2W96tR30Y7Qd6zOunCD7PZV?=
 =?us-ascii?Q?FhcZhB0cd/WF2hxj35xvzUR8YFxHarAqaS6ZAPIabckRcLnnySZhQj65ukhJ?=
 =?us-ascii?Q?LxPrQN60hbaAhqQWiN8NujMLL/UzUOj99+3Rjss/mp4xPLXYBMG3l/apXvUO?=
 =?us-ascii?Q?4yp3Kepqvlq1vVI1uy7AxBAatJ3cujbKNz7MOR9Qw5sgGYw2SyJYSoYgd9ul?=
 =?us-ascii?Q?zB105hqYO2a06oW/ZE42xhi7Ai4SIJBDQMBIWGwiA8oKTR/uKRRFNxTLx+pJ?=
 =?us-ascii?Q?F0XJSdEsJviDF2G+hyBv2dbZDNHGKziMToakrgF+dgdJbFj67Lf3zxkb1CyD?=
 =?us-ascii?Q?zZmDB3Zj+RtLbV8iBAvvyjCZO9x7EGP1v3g5zdF2swOMgyv5ga/keAf7Kbvt?=
 =?us-ascii?Q?dY26KgyBVp0pqcqDQ8XqTEruPWwyiiMTFYGDeUAtrNXcB8CG6btTxalGzbFj?=
 =?us-ascii?Q?Mm3pHQE82uLCYNYjJnHTQ8FaKDZAXk59XrJOSMWrkRsKdI2LzuzlTvSTtYi4?=
 =?us-ascii?Q?1CBSJ5QYCKy0e2fcq9cIVFoMLANYcD6YCGfqNwRlfXFR6I1LC4QajAyieV5N?=
 =?us-ascii?Q?fl8l9HuE4nbYuL5oZh01wr4nd2X5muW3PfPkfiyVgp1Yjes+9auUnLCLPa0l?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Dx/sChnQIC4OReLHe+iFZsWk3/hQ/cd2KT/CQfBOaES9PHKz12nrH3nKS+t21iiDlnSLCVQ0fClB95mw0zXfSzIieZKfc99ij5dD2mkzBX7qUsObKNRr/sv9gPalSnG6hvEluhxd50n0S3LRMFyShHIpjAI+z7U+CVluP4d1LptGfnGgMVe0viX+1TGayCP8GgfaYZJ42M08DY2TPc5WoPhcQUUv16RNPM7A2nB4lMABs7MA83h5mS426qVhQ+1agUI4paXuNYlFN+cTVk6a4fwBkP14JsDyYhl5oPbm439XmW3K6MkjdeVKBKY2QdTOPoDLG/PCCTOjmOxbxkVWV+QdBvcSrSt29MRhIl69QF1oVUj3rjxVQORPvzRUA1Ic2qoUFS1TpfxP7HjpOO55NYj8m3FVdJ0nj8IKHDNAxr596Xxv83pPkfWOLYyLxKVOvioCAQ3C79tiGqh/0+SNRwxBYW/xXBQwRXIrwBE91dSv62M+wiI/XO//avwMoBWzA8fwoliasLMgeAKFFnostwt53j2a16g3Pk/bC2hjPhJTdCaEgQW1sbCRsXOUGQ9g2+UvsTtG2gMTr7A6gaWwjefeUDLecj1BANXqPsdMF9Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b65c7558-e261-4211-466c-08dc81a3e2ee
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 19:00:06.8650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +YpHEChomJeuCIBjaIqEASh7mLM3qRKr2D137dN6GwpiuDcfY/qRtztg7hJMGqOt4s2zojdIhjzPfRSud82SFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7955
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405310145
X-Proofpoint-GUID: nATEHuKKj0OyslvEfaxHBnBd8vuW9Jcq
X-Proofpoint-ORIG-GUID: nATEHuKKj0OyslvEfaxHBnBd8vuW9Jcq

We do this by writing out a runtest.conf into the testdir at
make install-test time that tells the testsuite where dtrace
is located.  Fix a couple of tests that are assuming the
location of the dtrace binary can be used to determine
whether the installed testsuite is in use.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 Build                                | 1 +
 runtest.sh                           | 5 +++--
 test/unittest/usdt/tst.manyprocs.sh  | 2 +-
 test/unittest/usdt/tst.multitrace.sh | 2 +-
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/Build b/Build
index 485e75d62b4cb..071bef631f7c4 100644
--- a/Build
+++ b/Build
@@ -10,6 +10,7 @@ install-test::
 	mkdir -p $(INSTTESTDIR)
 	$(call describe-install-target,$(INSTTESTDIR),GNUmakefile runtest.sh .git-version Makecheck Makeoptions)
 	install -m 755 runtest.sh $(INSTTESTDIR)
+	echo dtrace="$(SBINDIR)/dtrace" > $(INSTTESTDIR)/runtest.conf
 	install -m 644 Makecheck .git-version $(INSTTESTDIR)
 	install -m 644 Makeoptions.installed $(INSTTESTDIR)/Makeoptions
 	sed "s,@INSTALL_SUBST@,TESTDIR=$(TESTDIR)," < Makecheck.installed.in > $(INSTTESTDIR)/GNUmakefile
diff --git a/runtest.sh b/runtest.sh
index d9b7c02c06a3e..25b8cf5665032 100755
--- a/runtest.sh
+++ b/runtest.sh
@@ -18,6 +18,7 @@ shopt -s nullglob extglob
 unset CDPATH
 unset POSIXLY_CORRECT  # Interferes with 'wait'
 export LC_COLLATE="C"
+export dtrace="/usr/sbin/dtrace"
 
 arch="$(uname -m)"
 
@@ -576,7 +577,7 @@ if [[ -z $USE_INSTALLED ]]; then
     export dtprobed_pid=$!
     ZAPTHESE+=($dtprobed_pid)
 else
-    dtrace="/usr/sbin/dtrace"
+    # inherit the dtrace path from runtest.conf or defaults (above)
     test_libdir="installed"
     test_ldflags=""
     test_cppflags="-DARCH_$arch $(pkg-config --cflags dtrace_sdt) $(pkg-config --cflags dtrace)"
@@ -586,8 +587,8 @@ else
         exit 1
     fi
 fi
-export dtrace
 export test_cppflags
+export test_libdir
 
 # Figure out if the preprocessor supports -fno-diagnostics-show-option: if it
 # does, add a bunch of options designed to make GCC output look like it used
diff --git a/test/unittest/usdt/tst.manyprocs.sh b/test/unittest/usdt/tst.manyprocs.sh
index a899470dfa0e1..f820ed231c388 100755
--- a/test/unittest/usdt/tst.manyprocs.sh
+++ b/test/unittest/usdt/tst.manyprocs.sh
@@ -82,7 +82,7 @@ done
 # should contain at most five or so DOFs, even though 512
 # processes left stale DOF around.  (Allow up to ten in
 # case the most recent cleanup is still underway.)
-if [[ $dtrace != "/usr/sbin/dtrace" ]] && [[ -n $DTRACE_OPT_DOFSTASHPATH ]]; then
+if [[ $test_libdir != "installed" ]] && [[ -n $DTRACE_OPT_DOFSTASHPATH ]]; then
     NUMDOFS="$(find $DTRACE_OPT_DOFSTASHPATH/stash/dof -type f | wc -l)"
     if [[ $NUMDOFS -gt 10 ]]; then
 	echo "DOF stash contains too many old DOFs: $NUMDOFS" >&2
diff --git a/test/unittest/usdt/tst.multitrace.sh b/test/unittest/usdt/tst.multitrace.sh
index 84cf1e8caa543..dcabde620c030 100755
--- a/test/unittest/usdt/tst.multitrace.sh
+++ b/test/unittest/usdt/tst.multitrace.sh
@@ -123,7 +123,7 @@ ONE=$!
 # if re-executed with a newer version of dtprobed with incompatible
 # parse state.  Overwrite the parsed DOF with crap first, to force
 # a failure if it simply doesn't reparse at all.
-if [[ $dtrace != "/usr/sbin/dtrace" ]] && [[ -n $dtprobed_pid ]]; then
+if [[ $test_libdir != "installed" ]] && [[ -n $dtprobed_pid ]]; then
     sleep 1
     for parsed in $DTRACE_OPT_DOFSTASHPATH/stash/dof-pid/*/*/parsed/*; do
 	echo 'a' > $parsed
-- 
2.45.1.275.g567cb0950c

