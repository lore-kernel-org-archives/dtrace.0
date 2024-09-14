Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882BE9463
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 02:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726282712; cv=fail; b=dJ65rFOl1wuQi/wljVuBm1PFZKDAfqWtKXuvyoQUNZrJJQwTyEWP9o4fKKJsby0XfGeK1EAhRUzOnsPIrECkB3gslMWTY5akz0kujIh1T6iiOS11a025nxp+d61Tab33QNl+7KEu9Z+HfgQNuESNYfdFnm65OjJH1HOElHizWe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726282712; c=relaxed/simple;
	bh=o1p5ehbZP3MbXuBJ7nfkQsXN1GmxvNKV4u4gSl4LQsQ=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=AXRoYxQD4oZNhNSMLkvBkBPUWH8/PtBpjaok5U4mrAHFKBIkx6DA2ZP+U3xWFTkfjbaQQLB5fvUVPeG8CVLkkEHl/LVKXJfre7sYluUOLkkDllSYeRwon2XDRCdQC8+F/k13tpkzp58x4yJoSRdJFY8ney6MQRXe1aLGsDV4pRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aSS5jXLx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=AmcShxF+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aSS5jXLx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AmcShxF+"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48E2rYWQ025241
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 02:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=/X7jiHUXtE145Nw2pLSWYEnO0i+e4t7iI8qHpjzWDiM=; b=
	aSS5jXLxq+snbD/g/9cmKNr3E71C6S6+uu+o5tPw6l1jodTgYdq2pLkgT10Uy+RJ
	YWYyEKECfDTWF9adIHECk3U2hAucUzwnBs4WlseQ7lHK/40SI1tPqIVyMorQHdPI
	XS0tmBrXzmsgCpxbMA0v5SP5riDzNZoMedjDA1qmkeIZC5eMWGJ1Gmk/JBLYAqAP
	MODPU2fpVflm+5AT/Jcg1Zpw3E9hvgWEDZN1Z0V2J9U+wSvEqzo3+pFhluQcqucA
	+Jm2EOhGQrkgh7XgbTYe6ZAJl9ddkN6Qp0UR6iH03TqtkXJKbX5gy5w9qgpvyf76
	ljEDx/Cpu8H8SW9abeJwcw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n23t002b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 02:58:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48E1XjtM019772
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 02:58:26 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41n0x695qd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 02:58:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJzRj4LmMFE4SuQ95YA/oSjj708etVH/e/itPAiJw2qd2eAQULyO1YFmaAcVJJBY2b68oUE7GGXx+E7/K9YS3ypX/jYYLYSFWSoObDNE0fJ4BQHYcIPXBKeTi6biEonG529sKNT+F/kZVzpkzPcIQGWhBMtvw8e4Ci9r37S26qEz9aGmFSMNKIKWtkVSX+I00KyAbZomBBqJKUJAzzqnZQfdB8damw8YO2ri+eKBR5Y9WZ/1fl+W0e3HCEoG245Z3zVN9o+7Em6gw4cphUfTINcnitwFVJ/iwDBzBMm/Vgl+Q9cM4SB3t4KMoAArYyugxcDL0Age/HDRgncR+qQCtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/X7jiHUXtE145Nw2pLSWYEnO0i+e4t7iI8qHpjzWDiM=;
 b=Gnlk0pW2jmd3XTt3vLf8I1cmLtE/tJBKrXlyAEpB0GKUzg2ofESdIcsk+IRam3Hz6Z73q/P10/jsN30GLHmRfvMfGPa/+l3plb/CvIf0dIUOGJHfyNhWNLSMXXTwcxyy+d2Pa/JTKk9TkukwyTVUN/Ado2VtAEj6EA4/79bRdg1rl3EtKcejBMUpWZkv+Eq/a38Ue4wdX+1Lt2B4LRz8JL7+HWDtC0tXXexe/HIMXPJMAv8hscdEmNWkQdH2OOVnsAuYWx8SPfArGyJN8fowwyjsDOzGRcYkXO9R2d9ovdsfzac8XUfnR9i2IsZ3F9S59nOub/Lo/icpmE0Q4IGkkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/X7jiHUXtE145Nw2pLSWYEnO0i+e4t7iI8qHpjzWDiM=;
 b=AmcShxF+SXEUnAAKEU/5b2iEkw7b60F1dT+7DNkb7Cl6vLKOYQoUOwFXB7hOPkr7Xu5Eq91DCKiIe82yVe/2P5izOHd4yzrn96Jt4KvE23h0lMEZnMp7DW5NjgGH9KxchotYC2kkDpVgf8lYe7fAxQBsQM5qAcRjO4NfcBY8cPI=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SA1PR10MB6341.namprd10.prod.outlook.com (2603:10b6:806:254::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.11; Sat, 14 Sep
 2024 02:58:23 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.003; Sat, 14 Sep 2024
 02:58:23 +0000
Date: Fri, 13 Sep 2024 22:58:20 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Relocation processing for the ERROR program is done too early
Message-ID: <ZuT7zAFGovJBCJzE@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: MN2PR20CA0016.namprd20.prod.outlook.com
 (2603:10b6:208:e8::29) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SA1PR10MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bcdc585-99f9-439f-f58f-08dcd46918cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eoZ5k6VfYs0p11R2XETFROzzYWv+HLvCGdJb370KvwuIBhRUVk71gFN6hfZi?=
 =?us-ascii?Q?IEy8uWfrixATbjx+IwbyoTp89j41se/2/tMfluQU39Kbk6AhFaE7iZ8LUQwE?=
 =?us-ascii?Q?U0eN6s1s22ojcrwvgWUS+ExqJK5PmvnUH2NHQGoJmgKXNFlGclx0TaQsN7oM?=
 =?us-ascii?Q?/KF4KzVDr2j8iMgfK9rxKVQPFFJirCt75IyEjA17BDrKLORSAn/v6scvInXQ?=
 =?us-ascii?Q?e1FKmGZK1LmbeieDcbP1/T3Q+XgjH3njkE1uyf8Q7Eqd1cF2vCQ9mG5ATVwd?=
 =?us-ascii?Q?TtaXE0leZMIH9asTqwzHTos+uPhRFppsYhoaAnxFDpSSAHcqH/hgiEbtgY8q?=
 =?us-ascii?Q?E76jjG5VOOwMrBTfeZfNgjM+auBIOiGDft1SxQQ1Nog4oM+x1IXRRA54nyIY?=
 =?us-ascii?Q?SiZXc+2Kc+/pWsYylnq7A5fM1MCF6VE3JyU3Y9/VzpoKti89yeIvoUAT75gx?=
 =?us-ascii?Q?BQmXTfKuJRYwIU+9ZamAIw0L4CIpZ4dshdbaTwIEtUpY3MIyf4MkQaM5kgIp?=
 =?us-ascii?Q?X4T65CiuyJJYhsxLYRKsS4EUlp6WaHDwpyrCN5o+DcSlw21IyuTrHN//1sr6?=
 =?us-ascii?Q?ArwKcDjuyif5kiyPDF5ED1bU3NSVb0y2jRmhZbzz/IS/uFHXMfAI68RHV3wb?=
 =?us-ascii?Q?++3hrFGgZKvsCYJzsuAEK0SkFD9Fkhz00mONN49GknphhmzemNbfIi7+3Vi9?=
 =?us-ascii?Q?X+bjXHQoHzrqHm5GDetu2vzmsNLEqRR7Usnj16NJriHppWl8owQVGiHcqPcf?=
 =?us-ascii?Q?sD5A9mWrgbE23ojjduACax+Oj3P1A/sfYpm10lkEU3nsktZaZECoon1jpItk?=
 =?us-ascii?Q?gzshKmiYVXqOluzprCViphnleHXNxK+S1IppnmJr18yWL9YLu/0H5SnIOKP7?=
 =?us-ascii?Q?rWOzZ3rgAfv55LSJSQbJ6Tt3qUbnzVLkjTAweDSef8Bz1THnGPltCSUjRakM?=
 =?us-ascii?Q?95n2KzxmbY1VEbVh7/ffQ9afwTg4IPeRjw1eCtMGQo0dMDwV6TZkFmYSscIA?=
 =?us-ascii?Q?A0eE9okNpmfJ3HKHFH8tSXTVS3Zvo0kUrXx3Gex6BbsGJP12NOkXcVHx1+4P?=
 =?us-ascii?Q?9OJSpCHcVzj70EsG0PVDGYtAEa1rFe0JVCmkwufKC11Uwuv/i6mkDBYjxKDL?=
 =?us-ascii?Q?UglG58SmOa39cL8cO9BP+kShfws9qIMa9BY1JF7PW2C6oqb/3jIqlWBAkVSZ?=
 =?us-ascii?Q?+V1g+a7ECgN3fdk0b/B7sTFBJKidtQEEzef3eeszPWqW/eFK7lcwccK7HeFu?=
 =?us-ascii?Q?rYxL+uZ3zSvKFRna+HKHfLUvkC1o1/lVT/MWzV0rLAxnTb5N1emc4TFuKuW1?=
 =?us-ascii?Q?AQ+DFZTMehj6BSb7P8/B6RpcxEHBy4S7xa1CUFPC0BxJqQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cwCToU5Qlb8IOB+oY/JMsJgCxcs86oi3+OU5Ct0QnQJg7EJrP8pUSAOcB0n3?=
 =?us-ascii?Q?A1QJsl6Bde3DE14bINPW+bpLCiefBr3rbxCJecloSu6R9m4p+OOlER032Eov?=
 =?us-ascii?Q?RN5Gf6GI2HiXDakjbdG7pcP7ywSHN69Qm+bO6mhCa9fk8G+jrdvBZmUuepGr?=
 =?us-ascii?Q?p6g37eMIPOLRtwQjC+sC9k0j1NVygOGSTUVeVpoksdtBq6bqhIJUyBFZFVGr?=
 =?us-ascii?Q?amdb3SrFVCMe0l9cCIK5kFtMGSug9Cg3lm49pXzRbvZnQiG3R0HZ2BFrpJ1Z?=
 =?us-ascii?Q?kasImQbdGEq+R/23F71p5HULYqEPLO7VeX9j6rwzEOelWPWKUoLhaMwXZcVe?=
 =?us-ascii?Q?OD2r35VePKNsGoyItdMrNvXcjNC6joxD4O8PuM82XW2isJvqtYuNAe3aZoKq?=
 =?us-ascii?Q?jVrDZ+k82X/BQxwvL3nEw1NqpENgiFT+FeRU1kjvIGlTWGASwKFG9tRLo4AI?=
 =?us-ascii?Q?eZz4FIHY2APf+KRhUV6pUev9n7M9rDgGnHJRHPuMTDjcqfM9TXdPGXF6Jz7Y?=
 =?us-ascii?Q?hxoSpjN3v55XsxajozckzJ0APil3kNHpmbifblImHY/qlIquAyhV1lC9csFA?=
 =?us-ascii?Q?OIYzIc5dxkIUWEq63+7c3G/LwzoX0mhF6rQT912wkrJS26ZFd2Pl0mcklSrD?=
 =?us-ascii?Q?JR9FLNuRZZu7ARdwpK5Jelg3noxO4BdvpYyZd0VqNJn6tb18WZj3J3pwcyAB?=
 =?us-ascii?Q?XJ2oDV01qwTV1nNE8tT5pdlplWeWCftkIJIT06pFjfjcS3cyhA3gUyrgtCRm?=
 =?us-ascii?Q?9kKcYfH2wN33CwFT7Q7qfH7CJ5MAIbpj+uWrY2SO4nyYKAuAmwxrM09Ys+Dw?=
 =?us-ascii?Q?9T8dUY7BIYWzDo5L7l/TTj0AQyYId1U5BuniX4OX8mbZdkbkkEYZJ5zTHGxd?=
 =?us-ascii?Q?7YXyUZc41oZ4o3/OrG7LeaRL+qQ3pkDAw7Zj4+Xq+yWaXAECuYZs0qunVh8m?=
 =?us-ascii?Q?Ch8WH13rYEVpHb084KUU1S84KdHXf16S2t41pevw5MOR9aVEXxotg0Lv70P6?=
 =?us-ascii?Q?j8vf5aRfvEdHeS0IAHiznlwyVyX3FTcFsnD4idprOwzkyRQnNus0ypn1xtXD?=
 =?us-ascii?Q?YT0P+So3JbEPelUWgpGXwp+9iualYxq3a4ijs03XXDqLIt/SRrwd9krnNCIv?=
 =?us-ascii?Q?1bqzvivCumhkxQXab1a8yTmAaYz2ZS19tR2gKxed+2oALQPB4IYGvuViv1vP?=
 =?us-ascii?Q?O8xAsOO5ht+kd1Pb9TsopKcJ9i4B1xyt4Po+nKYnr4QWWT+mn4wwlY/0S2YB?=
 =?us-ascii?Q?9uFNX6g2YyaW75cTyktD8sjG5tVU4P7KpWj476cQBJsEfjScahEGkdp0+5rJ?=
 =?us-ascii?Q?WNLR3pJQasJsSSssZlgNmfpRTFI+JMAqR1WRWFguZOD7Vj2bLnpUlmqiS+CE?=
 =?us-ascii?Q?Ak7fhiGYAQi58L8D8L2vQMdOSn3SbDvMXY2LxC3HzOao+Nst/VYNBFVElwCi?=
 =?us-ascii?Q?ZEUnr8ei/HDeKG6oxIIqpMnMqzdqjLtJAQdMZmMGjIQe+SrBfokobi7fdCHP?=
 =?us-ascii?Q?OtuNBQAwWxYib2n2Gcqa3yHn4MT5ESD+s+Qc7kywCOOFgyzBGnjtmcovgwyv?=
 =?us-ascii?Q?GTwh2wpj+071fcfGRVxSL7ZPFU5Dgrc2U0S+4/mtvlBVNnRXRJcymPyl7INo?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aToarxU9EfmYXwGrYe4ecUC42+GlNz6+QrtzvlXGiRUdFFeIoZ7DzoaW/D5apD0py4Afj5CtqVWEQT5zF+TUIDwDxoF7NSLeP9In/bJ2jiXT9KYUtnpdzDky8LYFcGGxxDD+ANAbV7OG1CCcAmhNNAA2i42D/VJeNzOnKUjFICVFGr5Clr8/cCBPFm7vyAJF7b9Lmz3QCpNYLXt8u4CrX1Gm9uNb1rP54VlvsxAg8FLdTnLHGu9GO+Ca3X02EPdhyewg6yGRI3bqpCLVcBaVmN6rtASG1Fc4BwC5xXfUR9AE0g4QcU2XGRavs0aO6cgLvwi/9k1UEGDK3ovIcQwBOP5bIdCZzUib6HnLlu5jjHMeMY0wwanmXooohjougooFXTMPLlj4jnzFyR+c1x2OUnNC93oV5Q48HA++si4JDSwjali6Y6XmtlNhJgjmorDEjFz3WqYjUkFGfy6CYC5YeKcjNhcUnpnnniNvS9Bp69Br/kJMZXiooYABEZQDtx5ZYOgS3ktPChx0TJaFL6VV4PBbPJ3N1yu1rDYIOcuhdwx1N6+alquXoGFE9JAYWYjCd0einpo6AI+BvkQo4tJlsmv1gIMN/usk3HxtO8WbGPE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bcdc585-99f9-439f-f58f-08dcd46918cb
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 02:58:23.3179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W0wC0T6VF53q7inpKsg5qD5+8xuMOhz+5a3S3MyLuqqpdSuNKS5zRbiU9v3orc2P+zwbsZA/L38gL+yZ/Fch5dUCHTI4ZQtbMAJv5XKxiV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6341
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-14_01,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409140020
X-Proofpoint-ORIG-GUID: bLgIlTeULcCr-DbqdtGHwOgPwXxPsjGu
X-Proofpoint-GUID: bLgIlTeULcCr-DbqdtGHwOgPwXxPsjGu

When we call dtrace_go(), we do something like this:

    dt_bpf_make_progs()
        dt_program_construct()        // just for ERROR
            dt_link()
                dt_link_construct()
    dt_bpf_gmap_create()
    dt_bpf_load_progs()               // other
            dt_link()
                dt_link_construct()

In dt_link_construct() we dive down and find dt_get_bvar().  One of the
relocations is to supply the value of STBSZ.  The first dt_link() is for
ERROR, while the subsequent calls in dt_bpf_load_progs() are for other
clauses -- that is, two separate versions of dt_get_bvar() are used.
Meanwhile, the value of STBSZ is not set until dt_bpf_gmap_create().
This means that the ERROR copy of dt_get_bvar() does not have STBSZ set
properly. This means that if ERROR accesses probeprov or probename,
dt_get_bvar() returns the beginning of the string table, which is a NUL
terminator.  Some other relocation values have similar issues.

Move the ERROR program construction to dt_bpf_load_progs().

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_bpf.c                          | 40 +++++++++++----------
 test/unittest/builtinvar/tst.probe_dtrace.d | 34 ++++++++++++++++++
 test/unittest/builtinvar/tst.probe_dtrace.r |  6 ++++
 3 files changed, 61 insertions(+), 19 deletions(-)
 create mode 100644 test/unittest/builtinvar/tst.probe_dtrace.d
 create mode 100644 test/unittest/builtinvar/tst.probe_dtrace.r

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 70597d65..df427c86 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -1212,30 +1212,14 @@ int
 dt_bpf_make_progs(dtrace_hdl_t *dtp, uint_t cflags)
 {
 	dt_probe_t	*prp;
-	dtrace_difo_t	*dp;
-	dt_ident_t	*idp = dt_dlib_get_func(dtp, "dt_error");
-
-	assert(idp != NULL);
-
-	/*
-	 * First construct the ERROR probe program (to be included in probe
-	 * programs that may trigger a fault).
-	 *
-	 * After constructing the program, we need to patch up any calls to
-	 * dt_error because DTrace cannot handle faults in ERROR itself.
-	 */
-	dp = dt_program_construct(dtp, dtp->dt_error, cflags, idp);
-	if (dp == NULL)
-		return -1;
-
-	idp->di_flags |= DT_IDFLG_CGREG;	/* mark it as inline-ready */
-	dt_bpf_reloc_error_prog(dtp, dp);
 
 	/*
 	 * Now construct all the other programs.
 	 */
 	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL;
 	     prp = dt_list_next(prp)) {
+		dtrace_difo_t	*dp;
+
 		/* Already done. */
 		if (prp == dtp->dt_error)
 			continue;
@@ -1263,7 +1247,25 @@ int
 dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
 {
 	dt_probe_t	*prp;
+	dtrace_difo_t	*dp;
 	dtrace_optval_t	dest_ok = DTRACEOPT_UNSET;
+	dt_ident_t	*idp = dt_dlib_get_func(dtp, "dt_error");
+
+	assert(idp != NULL);
+
+	/*
+	 * First construct the ERROR probe program (to be linked in probe
+	 * programs that may trigger a fault).
+	 *
+	 * After constructing the program, we need to patch up any calls to
+	 * dt_error because DTrace cannot handle faults in ERROR itself (yet).
+	 */
+	dp = dt_program_construct(dtp, dtp->dt_error, cflags, idp);
+	if (dp == NULL)
+		return -1;
+
+	idp->di_flags |= DT_IDFLG_CGREG;	/* mark it as inline-ready */
+	dt_bpf_reloc_error_prog(dtp, dp);
 
 	/*
 	 * Determine whether we can allow destructive actions.
@@ -1272,10 +1274,10 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
 
 	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL;
 	     prp = dt_list_next(prp)) {
-		dtrace_difo_t	*dp = prp->difo;
 		int		fd;
 		int		rc = -1;
 
+		dp = prp->difo;
 		if (dp == NULL)
 			continue;
 
diff --git a/test/unittest/builtinvar/tst.probe_dtrace.d b/test/unittest/builtinvar/tst.probe_dtrace.d
new file mode 100644
index 00000000..d08067ad
--- /dev/null
+++ b/test/unittest/builtinvar/tst.probe_dtrace.d
@@ -0,0 +1,34 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION:
+ * Built-in variables listing provider, module, function, and name
+ * are correct from dtrace-provider probes.
+ *
+ * SECTION: Variables/Built-in Variables
+ */
+
+#pragma D option quiet
+
+/* Check build-in variables from the dtrace-provider probes. */
+BEGIN,ERROR,END
+{
+	printf("%s:%s:%s:%s\n", probeprov, probemod, probefunc, probename);
+}
+
+/* Cause the ERROR probe to fire. */
+BEGIN
+{
+	*((int*)0);
+}
+
+/* Cause the END probe to fire. */
+BEGIN,ERROR
+{
+	exit(0);
+}
diff --git a/test/unittest/builtinvar/tst.probe_dtrace.r b/test/unittest/builtinvar/tst.probe_dtrace.r
new file mode 100644
index 00000000..e6cccc88
--- /dev/null
+++ b/test/unittest/builtinvar/tst.probe_dtrace.r
@@ -0,0 +1,6 @@
+dtrace:::BEGIN
+dtrace:::ERROR
+dtrace:::END
+
+-- @@stderr --
+dtrace: error in dt_clause_3 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
-- 
2.45.2

