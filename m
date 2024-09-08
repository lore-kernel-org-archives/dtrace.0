Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6026171652
	for <dtrace@lists.linux.dev>; Sun,  8 Sep 2024 16:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725813629; cv=fail; b=bl8yWCkT9ANnSUuRXCrcwBXbeyhnjBYNXl7VdO91+CP2w+Io0kUHvtQAYO91yXcXmAfOi4d9p7zpSClpd8OuNXihlOIQl395sCOcqTMMMTnW9BGPbwuA7dymGkjOLUaM+L4qS6ndSXztE+fN966lNnPyItbFvaVypvm2kBM/JME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725813629; c=relaxed/simple;
	bh=nvHxPFpksK2iZ7cYuKqiN7IzSkHtZhdRxQWw77oUzuc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y4OILxE6lyqbV5kGj4aV0DomU1zC1NXCkcEKQWxUdlmuQzrKLqWShuzvja6vYZmyNTfkizQqFX92Utd8kIrQelhceuGs94mkzgGwEoah77G1nHgSay/ySV2k0mFbUPFFHnOzcDE277cQDocs6Sp6uOu0LDC8eJgi6j1MNk75OnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=o1vR+8QG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=daIw/I3s; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="o1vR+8QG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="daIw/I3s"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 488Fr76c014172
	for <dtrace@lists.linux.dev>; Sun, 8 Sep 2024 16:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=gtZ97DSkYmENjz
	FPMzF4Q/ICXwCtxU+W84lBStFse88=; b=o1vR+8QGKquFD0U4XIZlVwcFMeYFni
	KGjnjda9GKIFcSy2Od87iIug3f/JPa44VG7WWmu2hllY/m3z38C/WCki3GuKd8OO
	oS43SoLXseqtN4VCprClQXFBAe9hPUigjT07AYVvGxkr9WXEMh/Wz7voZcJ/zBgy
	sDrmv8QYlVwBA1TZCbYzZtKPP5grSrtxRVgqBAYR+8Ug2508NKuSadLwzCIql5uY
	vX4NEjYsMTuq2VNN7zxFP7VRVpnVXHj2kDDWQ73L98r1WtyDIMKg386XOG8zDqS0
	0dONfhRIgEBJhAq6JV7kxrwtPMn8G3sVNjVCTUaBc5mnDEgLTXWOFQZg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gdm2hfem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 08 Sep 2024 16:40:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 488G0fdD040755
	for <dtrace@lists.linux.dev>; Sun, 8 Sep 2024 16:40:24 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41gd97q3gm-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 08 Sep 2024 16:40:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M9LBDZqMJIM97MnwTuRdV1EX9Np0Iniayly8ADaJt4R5EwdKvyGOCL54j5h3cbCehlk5gKqnjB0vTv5p4W2Qo3MhUuS2QXa2f1tEYfviad9YLnTrqnDPHGQpUd2uzO81hBwC3MXlOHQERFS2vWG2oO+JZ6H8Z1WT1SX8coiZBzY4vehXiYjd3+KUjdf6QBUurqp1DIGsl+47yqlUJ2woMOenJmKlyt/3wDl23jOdFb+edvknoXfEWe5bxsb0IUkGTiWLoFc3pp7biExs1T/0Obi3KT0NnhEbfQ2UMzdDcVf6h5EEi1GhkysxO8wTNnlzyQ7uQTsN4Nomn30rKZ2EuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gtZ97DSkYmENjzFPMzF4Q/ICXwCtxU+W84lBStFse88=;
 b=ZhF/HuIgCIw7v87XavB8JT6nV74LxJowyeIt5yrVdEFNJU3X+ntsQ0tYmHvO4uRYLC5uO34cPiVZa5cFfDbUeOa52YB0REJ6L+BwBma5scMHIZe06GS3+KyaJlspt62SGpR/j7AiyR897sQWh7+cS7eDDrS2T82X3eVWxQrc0K+jI9uKZF1chq5HtryV2h/9tt9g5T5mMmLvBNZoPSYI2b47UZXlTfd200LY50IuTej0Bc6UKNkdJReTfXLKq1TDjmeVdus/3hps/7p2t7KEzoj9UVPgppwTvLTYw0DCWE/NiJVjeUrXvbhaL8F/ulGQPE9bzaOJ5V56QO7066SNZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gtZ97DSkYmENjzFPMzF4Q/ICXwCtxU+W84lBStFse88=;
 b=daIw/I3s9lAssKS/ovAFecCTQXio4JyPm7CTHzNyi/usOic5WRR/gVJWoKsMPir7YxOjYlDsXJ9E+yPvIP4b5/VfdPQe3K1xpxo07KVBd3O1lLHZBzqZ9d6hoH74SQR7I8oVUF/p6rSmkXgE22u/cfZwIidpBVvmSW+zfK9IHws=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB7779.namprd10.prod.outlook.com (2603:10b6:610:1af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Sun, 8 Sep
 2024 16:40:21 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7939.010; Sun, 8 Sep 2024
 16:40:21 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 09/19] Use usdt_prids map to call clauses conditionally for USDT probes
Date: Sun,  8 Sep 2024 12:40:16 -0400
Message-Id: <20240908164016.3820-3-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240908164016.3820-1-eugene.loh@oracle.com>
References: <20240908164016.3820-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0118.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::33) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB7779:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b8d9c26-e208-40b9-e4a6-08dcd024ee1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S9/z62agXt258fJRZa1LpY6nXehsZMeF0a4Dz9/CUgsyX1BjUJ02OzAeeDw5?=
 =?us-ascii?Q?NXJe804nYilPwUMIcloaSUZUmAMYQFtw4QCsw7MlZ/qiB9FrmTls3b4j9Rq5?=
 =?us-ascii?Q?AajfmoNQQdSDXTtKPRhxwurhKfVplM3TH/nyJrpGDCTeqiPVQl2SOuBbqXYW?=
 =?us-ascii?Q?v+HCow2/8zr3sIELU5Tn3NtR+6kL3kTybj8Wtz2cVx35kpLaloaCN0tIE8QY?=
 =?us-ascii?Q?XigCf01lCmMadZfcVohv2l1t9vSVapLz6p1qROxmBqHOQ1yCzgOoXHu9a7Zi?=
 =?us-ascii?Q?0D6tsuW5yK2p0J7BFgIAbMIjZMmPZkC+lIVrn24FljaMAkNg+hhzaMaGi8Wy?=
 =?us-ascii?Q?ER7HaiETIwSZXT6J0AJzcuMUKdIlh0oaiqkMKDPZfGs6uASs3ojEyrlkdajM?=
 =?us-ascii?Q?U45u4KxSx42YkO3XwjeK3IrWQ4GyP1dJQuhyf3CAo+T7G8pxSSWFzqYjcyrE?=
 =?us-ascii?Q?MoRpwoMrfU/iBNyi4Z07w3sEKPv3N7SiPU7hc805WYY1rf6nK+X7yaMEpnPJ?=
 =?us-ascii?Q?MLeu0+kaP7/otMvI4+zO2fMrvt5UqNbrGWL4cqCRMtxwf4ibLr7GIR6+O/98?=
 =?us-ascii?Q?dOba6AkNyfesPUl0F3OFAikyGLDsu9Vj3+yVEdUrKV3oiwfrXKRSI6tRaiHY?=
 =?us-ascii?Q?pOf628eCuybNzYwEWO09gqzaU5Z9teIQZAwBfGNmiK9gAEufb1Wv6UeQXT01?=
 =?us-ascii?Q?Ss2oOpsHaqvRbvm4EOZyAO0gGiu+wb//TSyPMHxXC9wExpOO+CdbHA9wN6vr?=
 =?us-ascii?Q?kPnsS7FA1vlWbdBFoUM5BBgt/t5ErAjMGdZd7DToTXy5dF5sDOk9+Uxlt5c1?=
 =?us-ascii?Q?1yxMkB/AsbmvprF6iz9W7ruUI2ZxV4YSzdEIh4g9+l8XxNt/GzcWcFJIjvqg?=
 =?us-ascii?Q?L6kG3FAlFx9zg4FBj0Rd5T2aoUb/nG3h+VB7H4PSUCn1DoUzX6rzBWL3wJWn?=
 =?us-ascii?Q?xeDCTD88PkTPOZ6WOmo+DByxvP8TBvRA50SvxML0s9LpnO4ZUgqG+qI3O4Ow?=
 =?us-ascii?Q?/uX1BsNOKzFbE3yqO3El27D1hKo2WfxMziyhYyKujWDjYna0dqA2L5hCP/E0?=
 =?us-ascii?Q?yUVAmAdMT82z7hdl4ERFipJsILR51SovZzOQkqgwTZYCeOqUgcyQnRhb9GZB?=
 =?us-ascii?Q?sYqlUg3hsEUM/44PWaCuXrAgOGtyllC1kvLWRsv90k26+ry8OQkArl63dTYf?=
 =?us-ascii?Q?N5wmQp9vrKo/N7VP2K82iJfs+oXdFEOWFqFomYYotoyT4rHmrdEhYlYAbeDP?=
 =?us-ascii?Q?jKM21QdTuzk8PKMnvD4tnESFx2fkjhMCvOQH8GFDMAyEHPk0S9ptTszJjK2a?=
 =?us-ascii?Q?ZFYDYj47ChezCnMgOMr9XgO2sb+ZDjRJpSO/OhV+QygSgA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?72ogmEqmoVtsxDqZQLDq2pko2wdfVLUomlfY/PSZugnd0QxkRbcTHgeQumr5?=
 =?us-ascii?Q?+ZmPQnJgsuMh2/fJelE68OEEwJr4WswNxmXylJKzlgIUoRvRSOjuhCXo262U?=
 =?us-ascii?Q?WMz08QwkwxYlujmHibS6DSMbq6xgZ2wixqfXSb3xcvfSY3I2QLdkL2LLPSvx?=
 =?us-ascii?Q?k7/dn0qLvqZUmg7quR8R6qkQCjQdc1pcZcDyTRm7BqZxU+lHcyAma6BjwrVF?=
 =?us-ascii?Q?BQhY3HVuVBc5xch+/2JvgLXQcKJurSviG+nQtXsp8oiQ8JrWPuTPxPYDVkxx?=
 =?us-ascii?Q?0zOEz9m5reNN4p2LoVqag9qQGgI3zN7N8tCb70ZmXVN16WzzhFcn7kIRab4S?=
 =?us-ascii?Q?ONZ33jD14EzznIARg8pBdRZucdD1B/iAnH4rmL+p4f3gwTIqZSKY2QV8iBi6?=
 =?us-ascii?Q?Xwh3lNobZaRjLKWgG/3KCU07vAv5Lm67xUUtqiHAdUKFvsYL1uZ/Id7xGApF?=
 =?us-ascii?Q?YYpcvTSSVrzLQYw0tmB3QDexlD35nXsVM/JYxXW4fO1ozJec8nMEyMF/vcCf?=
 =?us-ascii?Q?54HWW/lMUhCsJ0BugSH+BsHLRLzy0OaUtwja62K2YGd0BmqhJ1xZVbLutFTk?=
 =?us-ascii?Q?1FARivgh2SK1bmncuSyQftjFWZwdQGSAMNZIYH6VBIHSqDZ26P8rgGq+EaFY?=
 =?us-ascii?Q?wm6L/i/8smWIlk+wFBnR+/SRDF0k6y4fkn9BcjCwIDS4poJ62R50042SwRPi?=
 =?us-ascii?Q?g2aEPGXudAmwFyc0GsMxjd3pTPg6+WZfuxq3OYmQuO60pPYMkZaul3bTu45X?=
 =?us-ascii?Q?6vcrPj8bQIsrMhxAzFlnkw/nEdPhlqemTxMTjOw9Oyse3Qsvw5oV3orwCGof?=
 =?us-ascii?Q?kOMD4VcMm4uDEskkV7zzjKfeGCZTjC6VX9D2nK6xkeErqMIbqi/RoyO4Voyp?=
 =?us-ascii?Q?M8tpdpfNbHY1lFDF9TlNcaF0dK8wsuU6qoP+B9Z1P48tVieKSNLBH1WKA51I?=
 =?us-ascii?Q?mt0aj0KoM8TXINMf2YdYyviRFlXVpuv2In/+/41pthAaim1R+iMMLSs3Y/04?=
 =?us-ascii?Q?kTapHNaiDhD3Gusg2k3ioPtZqBBLgaPv9Pogm2DXwGgIJohqACOzfmFfaGku?=
 =?us-ascii?Q?FIrpoi6biaLXGR1NIwggjX/f/aA2O1GiuIs6tRQ4/AkSk0AdMjN/+ssuz8yL?=
 =?us-ascii?Q?y9YhDblGTbayL8bEjxGm2mtJIfgic4qFBS5z2oAlMNPI3YxDxyOozQxmiwLV?=
 =?us-ascii?Q?bjuxfDBNGuXsvM+1NswD1sxvfGAVGd79eKJ/b+OmhzX/7NnX8kfpSU6wnpvq?=
 =?us-ascii?Q?1z8NAJxYxI/bU0P7fRx3mMI0hN+YCWTHaBtFE3ryBZbg7PHzbi22m2XUr3e+?=
 =?us-ascii?Q?7NDKbB16InUzGViXIM3mK+07Mj3lORFVVbugM/2Tq8ADEkEXkfc4kDZgQfAx?=
 =?us-ascii?Q?yiI+dwapC5yXGVKv+ndV0Un2TyJZobZDQ7wpIhY9lLqeC+INnX8AcdxPwvWk?=
 =?us-ascii?Q?0iypPhEVcYQ+Bfb9f0dVqV9nqJMBMk2VIm3oGZMgl0Ckof1/B6ippyvmfsMd?=
 =?us-ascii?Q?hW4CZfH0Gwsa+UFqWiWFjPZ+BEG5AdnZG2jI2GpVXZhVzsOBQ8EjbGR32+r7?=
 =?us-ascii?Q?3/A+RspsJJlRseQINsFg8JkUmu808TPUr4uUXIuN?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LpW0MbuIlpfOfNeIsGNnImtonADRDsp8hBXws8k4UxMGKHTWeaq3pG3UXHTuMfZWepq5N1LZFwrg7pr7gF4sW/LwJNar4dAhk7lELCNgGA90yxaLRWxqv97sNfJ60ucdLOxOp1qZxBuW6cSS8POFVtME8qeTcM0mpBWyUVL/ekjf9ViWhFT383W+/2f4COxJJVK1MyV4WuQRTgFUi+TZm0yI1qjidcNMAUwmX7X5Qhnqp4cucLB7bTu/mHoVGq1yP0Y2pQ/GJujkQUXhFnnnNAzJfsyfYgU0falSTAVwaPMAGIkCeMlWVvtmpTuLboXs1+210W6sY0aq0fGLkjKOFdZdQubZe8Fni9oKJl807SzlI8C6cx2P50zWubegl0EeweulJG9QV1JgUX522dUWhA232SoLl/nQvRzumOA3uk+n3bTcUABE/DysOkiS2Q23U2wR9D1CgbkBGGtBDTk8qRnuCSatcYCtyGlPrc9xn8OVAMLXjsboINMP07o2Md89aUL4fPPpbSIdRRF1YfQDgP7CPX5XDa5myw1xo1hfggr4bxLqQDKb8lpFcV/dDTu/8a6XNsG6fbW9PTczrzQD0ruFSXJuRf9TOf65D9qlNkA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b8d9c26-e208-40b9-e4a6-08dcd024ee1b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 16:40:21.3550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iB6H0VPVuq33FPfcygTxrgUs80heYmPUszm5mxIPgLLmzzUMHh25lpQecEhPnSKJYaJd8xPDo0AMzveEp5CP/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7779
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-08_06,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409080141
X-Proofpoint-GUID: S07vOqGt_3MMfRVIN4Vz-XcL0IfCCsL2
X-Proofpoint-ORIG-GUID: S07vOqGt_3MMfRVIN4Vz-XcL0IfCCsL2

From: Eugene Loh <eugene.loh@oracle.com>

This version supports only up to 64 clauses for an underlying
probe, but it can be extended to more clauses.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 159 +++++++++++++++++++++++++++----------
 1 file changed, 116 insertions(+), 43 deletions(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index bc929878..af188061 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -681,11 +681,16 @@ static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
  */
 static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 {
+	dtrace_hdl_t		*dtp = pcb->pcb_hdl;
 	dt_irlist_t		*dlp = &pcb->pcb_ir;
 	const dt_probe_t	*uprp = pcb->pcb_probe;
 	const dt_uprobe_t	*upp = uprp->prv_data;
 	const list_probe_t	*pop;
 	uint_t			lbl_exit = pcb->pcb_exitlbl;
+	dt_ident_t		*usdt_prids = dt_dlib_get_map(dtp, "usdt_prids");
+	int			n;
+
+	assert(usdt_prids != NULL);
 
 	dt_cg_tramp_prologue(pcb);                             // call this only once... is PRID set/relocated correctly?
 
@@ -697,14 +702,17 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	dt_cg_tramp_copy_regs(pcb);                            // call this only once for all clauses?
 
 	/*
-	 * Loop over overlying probes, calling clauses for those that match:
+	 * pid probes.
+	 *
+	 * Loop over overlying pid probes, calling clauses for those that match:
 	 *
-	 *	for overlying probes (that match except possibly for pid)
+	 *	for overlying pid probes (that match except possibly for pid)
 	 *		if (pid matches) {
 	 *			dctx->mst->prid = PRID1;
 	 *			< any number of clause calls >
 	 *		}
 	 */
+
 	for (pop = dt_list_next(&upp->probes); pop != NULL;
 	     pop = dt_list_next(pop)) {
 		const dt_probe_t	*prp = pop->probe;
@@ -712,6 +720,9 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		pid_t			pid;
 		dt_ident_t		*idp;
 
+		if (prp->prov->impl != &dt_pid)
+			continue;
+
 		pid = dt_pid_get_pid(prp->desc, pcb->pcb_hdl, pcb, NULL);
 		assert(pid != -1);
 
@@ -743,6 +754,86 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 			   BPF_NOP());
 	}
 
+	/*
+	 * USDT
+	 */
+
+	/* In some cases, we know there are no USDT probes. */  // FIXME: add more checks
+	if (upp->flags & PP_IS_RETURN)
+		goto out;
+
+	dt_cg_tramp_copy_args_from_regs(pcb, 0);
+
+	/*
+	 * Retrieve the PID of the process that caused the probe to fire.
+	 */
+	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
+	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
+
+	/*
+	 * Look up in the BPF 'usdt_prids' map.  Space for the look-up key
+	 * will be used on the BPF stack:
+	 *
+	 *     offset                                       value
+	 *
+	 *     -sizeof(usdt_prids_map_key_t)                pid (in %r0)
+	 *
+	 *     -sizeof(usdt_prids_map_key_t) + sizeof(pid_t)
+	 *     ==
+	 *     -sizeof(dtrace_id_t)                         underlying-probe prid
+	 */
+	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_9, (int)(-sizeof(usdt_prids_map_key_t)), BPF_REG_0));
+	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, (int)(-sizeof(dtrace_id_t)), uprp->desc->id));
+	dt_cg_xsetx(dlp, usdt_prids, DT_LBL_NONE, BPF_REG_1, usdt_prids->di_id);
+	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_9));
+	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, (int)(-sizeof(usdt_prids_map_key_t))));
+	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
+	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, lbl_exit));
+
+	/* Read the PRID from the table lookup and store to mst->prid. */
+	emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_0, 0));
+	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_7, DMST_PRID, BPF_REG_1));
+
+	/* Read the bit mask from the table lookup in %r6. */    // FIXME someday, extend this past 64 bits
+	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_0, offsetof(usdt_prids_map_val_t, mask)));
+
+	/*
+	 * Hold the bit mask in %r6 between clause calls.
+	 */
+	for (n = 0; n < dtp->dt_stmt_nextid; n++) {
+		dt_ident_t	*idp = dtp->dt_stmts[n]->dtsd_clause;
+		uint_t		lbl_next = dt_irlist_label(dlp);
+
+		/* If the lowest %r6 bit is 0, skip over this clause. */
+		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_6));
+		emit(dlp,  BPF_ALU64_IMM(BPF_AND, BPF_REG_1, 1));
+		emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_1, 0, lbl_next));
+
+		/*
+		 *      if (*dctx.act != act)   // ldw %r0, [%r9 + DCTX_ACT]
+		 *	      goto exit;      // ldw %r0, [%r0 + 0]
+		 *			      // jne %r0, act, lbl_exit
+		 */
+		emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_9, DCTX_ACT));
+		emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_0, BPF_REG_0, 0));
+		emit(dlp,  BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, DT_ACTIVITY_ACTIVE, lbl_exit));
+
+		/* dctx.mst->scratch_top = 8 */
+		emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_7, DMST_SCRATCH_TOP, 8));
+
+		/* Call clause. */
+		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_9));
+		emite(dlp, BPF_CALL_FUNC(idp->di_id), idp);
+
+		/* Finished this clause. */
+		emitl(dlp, lbl_next,
+			   BPF_NOP());
+
+		/* Right-shift %r6. */
+		emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_6, 1));
+	}
+
+out:
 	dt_cg_tramp_return(pcb);
 
 	return 0;
@@ -788,10 +879,9 @@ static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
 {
 	dt_irlist_t		*dlp = &pcb->pcb_ir;
 	const dt_probe_t	*uprp = pcb->pcb_probe;
-	const dt_uprobe_t	*upp = uprp->prv_data;
-	const list_probe_t	*pop;
-	uint_t			lbl_assign = dt_irlist_label(dlp);
-	uint_t			lbl_exit = pcb->pcb_exitlbl;
+	dt_ident_t		*usdt_prids = dt_dlib_get_map(pcb->pcb_hdl, "usdt_prids");
+
+	assert(usdt_prids != NULL);
 
 	dt_cg_tramp_prologue(pcb);
 
@@ -800,7 +890,6 @@ static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
 	 *				//     (%r7 = dctx->mst)
 	 *				//     (%r8 = dctx->ctx)
 	 */
-
 	dt_cg_tramp_copy_regs(pcb);
 
 	/*
@@ -818,46 +907,30 @@ static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
 	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
 
 	/*
-	 * Generate a composite conditional clause, as above, except that rather
-	 * than emitting call_clauses, we emit copyouts instead, using
-	 * copyout_val() above:
+	 * Look up in the BPF 'usdt_prids' map.  Space for the look-up key
+	 * will be used on the BPF stack:
 	 *
-	 *	if (pid == PID1) {
-	 *		goto assign;
-	 *	} else if (pid == PID2) {
-	 *		goto assign;
-	 *	} else if (pid == ...) {
-	 *		goto assign;
-	 *	}
-	 *	goto exit;
-	 *	assign:
-	 *	    *arg0 = 1;
-	 *	goto exit;
+	 *     offset                                       value
+	 *
+	 *     -sizeof(usdt_prids_map_key_t)                pid (in %r0)
 	 *
-	 * It is valid and safe to use %r0 to hold the pid value because there
-	 * are no assignments to %r0 possible in between the conditional
-	 * statements.
+	 *     -sizeof(usdt_prids_map_key_t) + sizeof(pid_t)
+	 *     ==
+	 *     -sizeof(dtrace_id_t)                         underlying-probe prid
 	 */
-	for (pop = dt_list_next(&upp->probes); pop != NULL;
-	     pop = dt_list_next(pop)) {
-		const dt_probe_t	*prp = pop->probe;
-		pid_t			pid;
-		dt_ident_t		*idp;
-
-		pid = dt_pid_get_pid(prp->desc, pcb->pcb_hdl, pcb, NULL);
-		assert(pid != -1);
-
-		idp = dt_dlib_add_probe_var(pcb->pcb_hdl, prp);
-		assert(idp != NULL);
+	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_9, (int)(-sizeof(usdt_prids_map_key_t)), BPF_REG_0));
+	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, (int)(-sizeof(dtrace_id_t)), uprp->desc->id));
+	dt_cg_xsetx(dlp, usdt_prids, DT_LBL_NONE, BPF_REG_1, usdt_prids->di_id);
+	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_9));
+	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, (int)(-sizeof(usdt_prids_map_key_t))));
+	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
+	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, pcb->pcb_exitlbl));
 
-		/*
-		 * Check whether this pid-provider probe serves the current
-		 * process, and copy out a 1 into arg 0 if so.
-		 */
-		emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, pid, lbl_assign));
-	}
-	emit(dlp,  BPF_JUMP(lbl_exit));
-	copyout_val(pcb, lbl_assign, 1, 0);
+	/*
+	 * If we succeeded, then we use copyout_val() above to assign:
+	 *	    *arg0 = 1;
+	 */
+	copyout_val(pcb, DT_LBL_NONE, 1, 0);
 
 	dt_cg_tramp_return(pcb);
 
-- 
2.43.5

