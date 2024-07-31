Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EDF3308A
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722453781; cv=fail; b=cfejXW6VguMXHmHj+dBDRl22dIeY7o7s9DpnyPXcsUwYoeYPDUURtDg/TmGZkXjsay5Qv63Dc+ULQpR0gwlG5x/7b4jW9IulsU7YHKc+Chz+F6Orani8y8gq9DuOztWvuDD6ZvUB0a+9Xr7HQgHGY0nD8QLXrxfM/vguEAIKzCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722453781; c=relaxed/simple;
	bh=LNJBE76iEZfbCN7QU1wG3c7+i9aN3qo0UBuIAykmPi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Qt5f4TdLjlEMSPJWuoUFOjBUdTuo1HEV1kRMhxOpxSzC0CXJLK7thkJoR4GGAbmEugXm7H7gwtlQ12Kxa/WHzNReNREbwF3dw2cWKNA88U30zJk/VKNEHW3B/9Wi5FIwq+JZHoYq7AchDo1IJ1gmgxonNHHX542q9Y3X4swrm90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MxcdmmeX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SIEYX9gD; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MxcdmmeX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SIEYX9gD"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VHtn5s027071
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=+nXC5Rxe/u2AK9I
	+efAvIYMrf2bsBW0RIPKcYl+GQBY=; b=MxcdmmeXsIBL3lG4yqMkmvdUJAWMNEM
	23hI3I/iRZbR61OVVDszugrz27NWNYsDLINR+rY44ZfJNYO1JIX7kTVsCvYiZXx2
	jbQ/eD0U9PvcjqrejYrIpv4iP64x0WfFokJbMTOhndKc8UHWlGtop+hN37fOq5pa
	F1ijjLssGs7xDU1VKDbpbrOc3uvG2hPqptYgOCsXngNsR7wTWP+DZF+SHC1qyD4Y
	kIA4s4Mx83Kh4TIDUCUEOwlWJbjbxHNYkQtVoSmhkh17PSCIR8Y/B4XghvMdC8fl
	Loa/HEdcSqouyOL37rFul/mrd7AOiijzEvTPP9prlqc1jhhYd34kJ9g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mrgs86ar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:22:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46VI2Rmc030841
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:22:57 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40nehuvf7u-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:22:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iiX6KNpYchc3/OL3T2sh4kC5ZjIKeMbi7dsevykhkzoteervFPsJ/MF3vAtlVmiLRj0xQMPk58ft2mRhVPhm3jcALZ4nGzUAvIU7iwPrCdUd19b2kswTTZ/pUYzvx0s/Jd2MuU/b6wsiRAveGbV1YEEL9zfarhfg59KdXp/YAaULd5ORnFma+YVpGXsqK+cw+qRNxcJBE+zJDhl/YgSgpklTp/C3Dm4MMLoU2DzQ0PKPdbjo3qxfuCcB+7E9saIfCHMdem+LxirC/lCZTL4BzI49bNU3auq7zfw/31VNMzDimTgJHoG7SH7n8t5yaspBgQSMmLI7IF2h5LngZEVkqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+nXC5Rxe/u2AK9I+efAvIYMrf2bsBW0RIPKcYl+GQBY=;
 b=GX2s/1VooWSsgIUDVRh7C6K/L4e4Hj0LAfcyvVdct9Kye7jqaw78tMCUROdgAdnV900duKkhZTj9RQV+HHkJdZMGtzceWYDq0DqhmEtv2pmdOE/uA88s480wbVSsHyyAuZrtGjRkCMYSYEZ00bKOkVCuDLlauZpI3R+23XppCiHrSdbY0TlAxjvNyL/qGSGbDHklwtlwz7CawCla+XDTt6f7zotEsf9bSV0WzD6rnFbKVW4dhWxZ+u2s1Eeiiahu6+bRuBOG2q+Aiy6wml8klW6JxhPIwWcscyaTgZNmYQswL0D96bP0TCDxXPvttvS9bmHzYlSn8CxAhy7HMkOmhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+nXC5Rxe/u2AK9I+efAvIYMrf2bsBW0RIPKcYl+GQBY=;
 b=SIEYX9gDxG8xAHkuMpf1exwaJlHOl9C9Z9bS3qeohHT8X+ETgaveVqTRWbHBgvG5s70AdFJShijYtgMkWBX29yijulZv5/JxU/z50qgXeROSk/6BqpoSsD2EsjqGWWFqezWf+kgc2sp13a9wcSEHMVmFQxfl8GYNDKuOw2ZXwwg=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CY8PR10MB7244.namprd10.prod.outlook.com (2603:10b6:930:6c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Wed, 31 Jul
 2024 19:22:54 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7828.016; Wed, 31 Jul 2024
 19:22:53 +0000
Date: Wed, 31 Jul 2024 15:22:51 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 7/9] tests: delete the kernel build dir
 stuff
Message-ID: <ZqqPC/p6DiTdcmse@oracle.com>
References: <20240531185928.363245-1-nick.alcock@oracle.com>
 <20240531185928.363245-8-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531185928.363245-8-nick.alcock@oracle.com>
X-ClientProxiedBy: MN2PR12CA0028.namprd12.prod.outlook.com
 (2603:10b6:208:a8::41) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CY8PR10MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: c427460d-7607-4e54-941d-08dcb1962d0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/xJ6y4S0sfIl/f8s7992XB2SxSvHUW0SAAkXVlWA7oA4KB2kaPTBK09rvzKu?=
 =?us-ascii?Q?yWmqngDM4Im1FCKC/WetGl1Lb9ynX/qiygb7XD2b/t6VAtpucG/H6//8qvOW?=
 =?us-ascii?Q?nJJEqQexhtNmqiwoxHKNxxLOvqiZgSL7nXRIje8SbMkHlRrcRjQN0ESGA866?=
 =?us-ascii?Q?WEbkQ4/ulEp7+lgVww30L3RG5Zg/waJc0Ks/y5iezOjZbghC8YD+pA2PGECb?=
 =?us-ascii?Q?uPE3F0e23qbVJTpNAbRS15TBY9//D3YI6334GbTrcxQfMZo+BYAgaRBu6VPS?=
 =?us-ascii?Q?j74E3moGx+RyDuvjpW6gpVqHjifcv4lQ9tY523Q07Kyj1xRmUmTrRltx5f4C?=
 =?us-ascii?Q?nUfeQdDoshbJaazBWBJaTCbAlV45r8l2TODkesaDCYt2DdMnyC6YfUXcT+RY?=
 =?us-ascii?Q?S+UOsxJwlLrEtCHJ4gxOnLDT/BpsgZg3QD1ahKf6MVjjHig6YABUZjZTDQ4l?=
 =?us-ascii?Q?B/XYUcogW99t22eiZLihjghLn18O+2Lxf028rgsaTt5bNNka16JYj7XizmAP?=
 =?us-ascii?Q?ZPNkh1BIfWi7rAVq4nJudcKx91dEqVHUJfqS70sCOjMUw5fq4w8RcqVDWSSn?=
 =?us-ascii?Q?x9oPR8+LEUxJ5TFT/q5JF0i0C51pdPkmEQUiICPUJ9l7f5cJk0/WMesZXmt4?=
 =?us-ascii?Q?AiDxkn9jfn7kAQ4Ifu8ksRiHLRnMr197Jp7s7UEhd75KzPJRoMtOLcrrLmmU?=
 =?us-ascii?Q?0/6IjqkcYaY1B8dlTvVWfuV0cFeM9MKzK87FfK0NB+3xTQTv3GMg/QoRsgaQ?=
 =?us-ascii?Q?VAYasqkGSDCK/cwhp69Un5GJOa7pMtrUB+RXeK/EB5nwsQtQYZ1FLdQr0E1b?=
 =?us-ascii?Q?9m8VyeW5iJb3Buekf7GWtb6KarJvYcADkOa6O56n7UfGZk2wpLcgJjHypXP9?=
 =?us-ascii?Q?KAabWKf5LvHLvHZwAgKUefW0JssTJl+FYNzs21rBq7bgN/oTHWh0XcUomPIk?=
 =?us-ascii?Q?qGEW9QjqFDjFZoPa1xCeJXMWTWAVymF32Se2napLYTNPdRLkwMitu4Aq1XUH?=
 =?us-ascii?Q?tMvgSP2QqvI/Vye4GIqptq0wpYUcYimqdUwGMinWGE/UDZS5bcYXHTxp11FT?=
 =?us-ascii?Q?fydrzshto4m5I5a9rgFZZaH+NlJqp6xnhdfIZ7q4OfaNWG+155TaVkT57COG?=
 =?us-ascii?Q?DPv4s8q7qiJBF9rss4+11dFdvCPIbkUSfJnZIrTw9nvGDJKqeBNk4LAPYF0J?=
 =?us-ascii?Q?BDUxgNSXECDAEB3wm0JtB27c0QVzl2knnkDJ7i85NCrelEXAp/I317sHxpmb?=
 =?us-ascii?Q?rqrG1ykaybzvRlvPF6BgdJ08oGO/1CqoXT5tdJN0u0dN1+6uMJPzqYAbCfwD?=
 =?us-ascii?Q?kLj8qa29RMLvEtS6UFgL/1/Z99ev7gWX3YOoxp2kFzx0KhQcAWV5x03xnbUj?=
 =?us-ascii?Q?SPog9QI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fWCh7ASCimfyp/mtNM7O6rRH9PaixCulZpKhIUhfbIQc8LxlsCCy9cy2ClmJ?=
 =?us-ascii?Q?5UK+wx0iFZovHCIgisrIWDXNmKcnVHuxNWE/pBGnsyLhP3DQZMk1vQ/v81f9?=
 =?us-ascii?Q?3PJiwwMBmbjwQVbW0bp8+YkMOsk+GhQMHQvZCvKXdrdma8Sq2KUJHyctFDAY?=
 =?us-ascii?Q?Ov86OX1nwim7sZSmMLkIsaISvmAHUNh3a2BaVtMCtPiwBx7AJoktV7nZQbxp?=
 =?us-ascii?Q?xLgL+crdUBg6Rb/TelTLBSzV13NmZFeAaUwJo4Lg1ApW0kglXwJFLy5rxKvy?=
 =?us-ascii?Q?IeMLVamrP61a2hWhTpyDeiR2JVLX5ZthpHU2iJrpeWkT4r6MzSoUO64+XsEw?=
 =?us-ascii?Q?wf3pVe5AkPGTDvP1Z+I/3AZxRQ0mmVbbkFhPhZG4L+MiJkx8302Th63dqYLK?=
 =?us-ascii?Q?C0sCYACwSbGGzf/OTP08TN3a0IbtLnkaCHN8eCJ8Pqqg2IzJ8SyOEVsoWAkE?=
 =?us-ascii?Q?g4ZGlTDOQtHJBoCdOujJSzYw2Y5NP6QRJYHEyU0ZM/oi/juNiG1a45wWM0MQ?=
 =?us-ascii?Q?MPw70QK+Dh8nQW6MTpW8bPNc/mr70jIPoUBidKUZm915Zuv0AHszbHO18BkG?=
 =?us-ascii?Q?SQd6KuabSEPSn8Vf0C5QuIjkqdtE0pLJ0DfVbHqCvBHDNZg2fMluYsoiZiW9?=
 =?us-ascii?Q?zUKkFyhCE7yLhNqHKkbn4ypn18OkTn3Dzap2l4RRANSGUSwR9dEWZjZEjs4X?=
 =?us-ascii?Q?ZXXVGYUWwG2sDMQa0um/5BksHjfdM0JKl7gXwJDKX72E2JSDsx5/Ikc0LzDn?=
 =?us-ascii?Q?LmO7246fFCU2UQavoHQh673I60/0sVXkUTiVfd3Y555FZQXFU88e0V1nKtaJ?=
 =?us-ascii?Q?gu2MgO6ok5oWwCKWwpzc8WE4beRbbozp7zt3bk1TnHJIZGTdko8FeeeZddKN?=
 =?us-ascii?Q?vfRS7meI8C+HBY5+IdchmBvd5X1Ft6BST+bjaDlpWUX6ETZfDsuWURIRNOwB?=
 =?us-ascii?Q?+lCssUlPZBd8Xs3VPg6byyu3FofxWTogFaY7JP0xkg1p1AQ3fyei9bmL31jK?=
 =?us-ascii?Q?KeKdzOn4nlwu8/c6guOxj1Xt6/1bs8itC7e8+e+J+kRpcJJc8teowsnABV0Y?=
 =?us-ascii?Q?pM/PHlAowGxQFkXCdZb1c+hTNWztGbORjI9mLp4emvCWUld+IO36cDZusuwH?=
 =?us-ascii?Q?vCRmvbPd+TnEC3aPJ7PEUX3m3MFFhTd1VY4ZoHjGPrzWkYUS6axMydWGfF0x?=
 =?us-ascii?Q?QHrtUbpIvNyrjhVf/Mkjqx7G2ou7x7TgqUn9dVpmQkTaiKnXQFusWegMbwyk?=
 =?us-ascii?Q?Mns4K1QK68xr+hg8BxxetLSX8sFPkU60seakZlBjPqyDJV/WAMmDyp+gyoVM?=
 =?us-ascii?Q?ZRov3e3koR3oAu8YbWW/k1//aq7dW9Fh/JMlwQHRbcZ5qeu7t64QIazS/5DV?=
 =?us-ascii?Q?QE/4WX1kczfRbQ1sFZgTw9do9PQ69XMwG2Rt3gQyAcKzcbHwwWsydOrlC9Qf?=
 =?us-ascii?Q?bDg6oXT1nesSFdkbYX/f3Pc30l4W8sQFYnjMHiNdW/sxFkbgKlZD+zvKtuPY?=
 =?us-ascii?Q?z5zpm8WsrNOy/khEbDNRj2cNBcplcGncm60+TNfaX+P3t18NsUxckDPW82+h?=
 =?us-ascii?Q?VjQ9yeKsp9DcFYRTl1l+JL/WzD/CVreee4kTNjhoX3yyBzXD4+PkVhkmS74E?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gtW3N/9P1sbuA8vKP+GoQf/urXw4QqhLq8y1xBlkMclnD267eC2QfW8pIRNRX8u4ClsQet2KrJ3LGE3wFas2CeHX2jt+GnmtyUml6g+g8bcbLoDhmHKfaoZXT/sRH/ArVHa7SrJvzlD7L1NBAJDlzB7QxeDO3KSCa18o4qX5gT6a7p3r1H83aRz+cu9yYmb4B1eqX5F2MOzd25qC3V6Lc4xtfrR17o8Jv0APGnOuhMLPVqmxQWVtfqwb5NtSjiHc+Efi3qqJDcDT+5GSVkVJsU6gL2YSuaW+3oh2N31bAiAUjVenA1sDqEC9XL8TnGtgaLKSdTTGoUFYQJVd91b8WFm1wQKYOBIy+EqoPeZ2UDlcCcA0vO2HcU93x7Ml7jg79DENlTm0xAZMf9XobgMxiWLS2xWTHbDt6Z7ufeAsR/ZW5LbJCiznaxx5IloqDqD5zSvWEard67W3D9sDDEshCcuuV/0qqEopCocnutvwoecAc4++P4KyimD6bU+0QQ3X3RmH6YnCa3/sBq3DAg07FP4av0GI0E4GneB8F+Gflx38S+IAc2ZjmDMzisdTNdqC29tfft3pELugdFMBqYxw9obiaRbwU8v9kmMv3qIFH7Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c427460d-7607-4e54-941d-08dcb1962d0e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 19:22:53.9600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dIiSqC+0sSFJJCuA0CXTyz/60FjN3hMQRAR171yEqoR9wMXChRZfXoYwBVVJ14H9bBmgaw3qv8eGrjICs03a1VgLIwXYyVHzee3Dw+G0GbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7244
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_10,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407310135
X-Proofpoint-GUID: -FlUWo_us921A-v8E6E1vfkSKyY_VJYz
X-Proofpoint-ORIG-GUID: -FlUWo_us921A-v8E6E1vfkSKyY_VJYz

The subject line does not (to me) convey what this patch actually does.  It
would be more clear to perhaps say something like "test: remove obsolete
kernel coverage data collection'

On Fri, May 31, 2024 at 07:59:26PM +0100, Nick Alcock via DTrace-devel wrote:
> The DTrace kernel module is long dead: we don't need kernel coverage any
> more.  Delete the example runtest.conf as well (but do not delete the
> loading runtest.conf: we are about to use it for another purpose).
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>  runtest.conf.example | 10 ----------
>  runtest.sh           | 26 --------------------------
>  2 files changed, 36 deletions(-)
>  delete mode 100644 runtest.conf.example
> 
> diff --git a/runtest.conf.example b/runtest.conf.example
> deleted file mode 100644
> index c92aa6b96cff6..0000000000000
> --- a/runtest.conf.example
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -# Test configuration file.
> -#
> -# Copy this file to runtest.conf and edit it.
> -
> -# Kernel build directory.
> -#
> -# If this is not specified, kernel test coverage information will not
> -# be available.
> -
> -# KERNEL_BUILD_DIR=
> diff --git a/runtest.sh b/runtest.sh
> index 817f4a90487d9..d9b7c02c06a3e 100755
> --- a/runtest.sh
> +++ b/runtest.sh
> @@ -644,15 +644,6 @@ if [[ -n $NOBADDOF ]]; then
>                   --quiet -o $logdir/coverage/initial.lcov 2>/dev/null
>          fi
>      done
> -
> -    if [[ -n $KERNEL_BUILD_DIR ]] && [[ -d $KERNEL_BUILD_DIR ]] &&
> -       [[ -d /sys/kernel/debug/gcov/$KERNEL_BUILD_DIR/kernel/dtrace ]]; then
> -            rm -rf $KERNEL_BUILD_DIR/coverage
> -            mkdir -p $KERNEL_BUILD_DIR/coverage
> -            lcov --zerocounters --quiet
> -            lcov --capture --base-directory $KERNEL_BUILD_DIR --initial \
> -                 --quiet -o $KERNEL_BUILD_DIR/coverage/initial.lcov 2>/dev/null
> -    fi
>  fi
>  
>  load_modules
> @@ -1592,23 +1583,6 @@ for name in build*; do
>      fi
>  done
>  
> -if [[ -n $KERNEL_BUILD_DIR ]] && [[ -d $KERNEL_BUILD_DIR ]] &&
> -       [[ -d /sys/kernel/debug/gcov/$KERNEL_BUILD_DIR/kernel/dtrace ]]; then
> -    force_out "Coverage info for kernel:\n"
> -
> -    lcov --capture --base-directory $KERNEL_BUILD_DIR \
> -         --quiet -o $KERNEL_BUILD_DIR/coverage/coverage.lcov
> -    lcov --add-tracefile $KERNEL_BUILD_DIR/coverage/initial.lcov \
> -         --add-tracefile $KERNEL_BUILD_DIR/coverage/coverage.lcov \
> -         --quiet -o $KERNEL_BUILD_DIR/coverage/coverage.lcov
> -
> -    genhtml --frames --show-details -o $KERNEL_BUILD_DIR/coverage \
> -            --title "DTrace kernel coverage" --highlight --legend \
> -            $KERNEL_BUILD_DIR/coverage/coverage.lcov | \
> -        awk 'BEGIN { quiet=1; } { if (!quiet) { print ($0); } } /^Overall coverage rate:$/ { quiet=0; }' | \
> -        tee -a $LOGFILE $SUMFILE
> -fi
> -
>  if [[ -n $ERRORS ]]; then
>      exit 1
>  fi
> -- 
> 2.45.1.275.g567cb0950c
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
