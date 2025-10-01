Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21322D8799
	for <dtrace@lists.linux.dev>; Wed,  1 Oct 2025 06:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759299870; cv=fail; b=ffDqK/2jYgHm9HvL34qVmHrqIZwGnW4AbVRLgor/SPpJC/W8zBzySAxfTAHmTzasvuXdmpcLnxDlFLB9Cahd4qNkbI2rer5xHNvB/LMm1fN7oGBKO1DWbjyvm0K5MhXyzAF3AVtrySseZgnnVWxzLgBLNqQeP5yd4C9ltfwAIzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759299870; c=relaxed/simple;
	bh=HKQmiyrZAdUcXmNRzMET35kpvL/UbaDwxqB4BlahQF0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dOYpO6EqrSuEJkIvYEMwoXU/jYnsmjrO6GeMGk3S34OBu9kfCJ5sykCjBPv4V0uABsaMANuBCsnVS2LQbHMfU2kxeEkvfX2b/mlmzSpsQgSxxF7yJp5DtUEyzLrRENeDkrRKOFN/wcktqlERwbi26YFDB5bx9IaozPjzqg0FCDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=pYDLX9RS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=V9sihAtY; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="pYDLX9RS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="V9sihAtY"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UKMjOe028091
	for <dtrace@lists.linux.dev>; Wed, 1 Oct 2025 06:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=K6CXxXX6Y8oPRO4LLG
	FpkD1hU/S/m5ok6cZtdkaI9/4=; b=pYDLX9RSpIiqTwYL9bRA9PS6p1sws+YGon
	MYrbwkDiyk7U3fUeBzAdvD6+IxIXvASzcy2jQYfV93802c76kwsNkR4XhCfAV+sw
	3bHP4gxDkrD1MG0N9/2LzD87uMstrXx/keazDZooWzU3J4CDx4pbLx94JSCGWhS2
	aur4RA4OGyczf/c6gF+VYw2r1CAIte6FHbdccqfSOfOiQ9wzEYBOuE1uLasXQb1L
	wNTb83m29FLWIxl98Tvj8UUcZ5791yBpgqzhSYNNAUtjuw8DIyruo5paRoF3Vetr
	n4EuS7xCpOJZjEDTXAXWSlgnJ2TENZrQ1TDcEKFrL+96TWyisvbA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49gmf1rt27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 Oct 2025 06:24:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5913G5Xv000671
	for <dtrace@lists.linux.dev>; Wed, 1 Oct 2025 06:24:26 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012004.outbound.protection.outlook.com [40.107.209.4])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49e6c8ugec-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 Oct 2025 06:24:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkXrhCgzbTtCAfZQM73LyR0Novg+Gk2U9iMJPwnE5T9w15ACl8Nnb5GtQ4lGR6hTw5afOXoXVSQxOuYbBUrc8q+EN4dvfj6WgTRl0NkOzbRm8d0h4p/PTHVKkv4PY+8ApjyxdgW106i96mznAam7DyUk9ocBdsI+Dsy/8j7r59pIQLJvn+34funVWPFFQvcQlCHw6SXLl4y6MK8FYmSod/w8TTrDthkEGFc4msG0Cfv5JKTDq6f++7Da7X/Mf6hKfA0LPTb7sXtPDXJjbylwYctjQM3b70FyiarDVbPHOrkdIDFqznCOH6XaNCKtvTJCVq+LfeYOJQvivaO1msT9Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6CXxXX6Y8oPRO4LLGFpkD1hU/S/m5ok6cZtdkaI9/4=;
 b=lP86WfC6Hnhm25EgMAYNz9u70OGSnr2LjSySHSuCGwGyuDH2KsOHhzLhKaXez9oiiFyWBK04YijMLDzUgMsaj5XjzZEB/GaZaRTjGszYmWulKnxowg5evMaRR+KHpAxUfiClPNW1UN4xLHTTM5qrojiQzknxvt0L6r+dlOEvlkEAIgWVDHVOenyPx7SCli3CA2dQfbPtgTmuy8udLsQiq3WY38L+bj7peVMowXRXEB/zn9VMA08umsVw26hTaEzA4O81pozeC+Jr0ES6slFR3LzCXfE8/ew1uaC4el+5XvSQdWCA2iLk7OzGJRIedaVrhGWes3ILFka1Arc5hqHbdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6CXxXX6Y8oPRO4LLGFpkD1hU/S/m5ok6cZtdkaI9/4=;
 b=V9sihAtYKMsrmCRmsiU/FW7+gkWdSQIw5Gi9LJgWMnakoEAcmRAXKedALMaR4sGb5KZdnngwPDhXAbqqmrUyQlGGu4zwaxgbVYs8UZLrPiRGZAMAMe4UllMxwS0jxir+Li1rhrm22/kUSXZNFD8qbrLZFt05uOQw25ja7mq4Ooo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB7078.namprd10.prod.outlook.com (2603:10b6:510:288::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.21; Wed, 1 Oct
 2025 06:24:23 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 06:24:22 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/5] test: Adjust skip file for lockmem problem
Date: Wed,  1 Oct 2025 02:24:15 -0400
Message-Id: <20251001062418.6902-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20251001062418.6902-1-eugene.loh@oracle.com>
References: <20251001062418.6902-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0052.namprd07.prod.outlook.com
 (2603:10b6:510:e::27) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB7078:EE_
X-MS-Office365-Filtering-Correlation-Id: 8be54369-f857-4f1c-31b0-08de00b32967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UyE4ndyvICQnp1tg1oMyIN2Gr33aqic1lAC8QLEO6aTgWQZMXgl0W//unZEA?=
 =?us-ascii?Q?Dm9YBVbiTx6x45jWlvlq44K4g5LbQw7REGXklzpWX/a5cnZpfUR2gSRXJzsN?=
 =?us-ascii?Q?z19QPWB1rIGZD1gygwWfp3Qk4j+YA5bToD/SN33a6vY03rhp9ixdwu4YgWSQ?=
 =?us-ascii?Q?Pw8+CWhIrOesl4v+Ji/Ixzoa49Ff/ti+Wid4YPKjp/XQCJM21jPTtiL6sZzs?=
 =?us-ascii?Q?QtWYRPUlX/2OmRwgaKVi6pLzX0InRNLN1SGKPbOyhPVOPtZ4IGOlu29wq+JW?=
 =?us-ascii?Q?RhhNjpAprsLSjUE9PWG4scGMGony5HV5sXIM7zCxa3OO1Jle7KPZDGjAklD6?=
 =?us-ascii?Q?ZreVQu5YgP96958jJNVYkVoHvFKyQ1EGCVvSibPPWwjZkiY4TnW+Uav7oBXm?=
 =?us-ascii?Q?qYdcexs4xN+1z7secdhdBzKnb5lIXjuC8ObP57fTcY8lZ9C++OrnCPs56k9I?=
 =?us-ascii?Q?yP+Ryc8X1GDFtJwoJDU3Jq8YvrP6HloG2kVE5ZlvAg5fB2HW6XiblTbpFBLF?=
 =?us-ascii?Q?6wwd75CiiTVWUMPOhhslNG4gzbnR8DGRx8Y3W8H8K9EX/3Lollz4UnnzkNB3?=
 =?us-ascii?Q?dpA1SqcKHobSHfkoibuVtK13qFDvNtUTaeXbC4d11vohoxrOTfAZr9LvsF0t?=
 =?us-ascii?Q?lqgE7krDbvWBNqPBjGkYx48LStLGo/yijBao7QhS8WGJptxFkTSOBPHGmJWt?=
 =?us-ascii?Q?KDIx/cpPjAPcH7I1S+KklQalFj990ikTBo75lVvv0oimIlVgteCHhc6MMuTk?=
 =?us-ascii?Q?NxiNsE7Ly0tEvCa7gYx8477EnMet0IkB/pD++4Fusj2hKMkP45GoTWvTkQMr?=
 =?us-ascii?Q?gQbmL84x1fxgp/jbwQ62FJjH9Sw2okEXuVyySy3qI15wqw85nhP613FXhlN9?=
 =?us-ascii?Q?8MNOx1kYy7NKAfDXz2D3dRDaKhdsHvX61TkpjrMqMzZoKRiC94GqSdcrvj4W?=
 =?us-ascii?Q?OxYxgNCWA6IA2lzIKeDQf/uhl8HYcm025KJwnrW8LcVZbm2rg/Kj50hz1a8x?=
 =?us-ascii?Q?Htf+6OFuy8qpDSKiukcFfsOcISBeJeBGFYcgsn6OdLnYpkkdsuwCNL3oTCek?=
 =?us-ascii?Q?gc1gOZfshQt0geMCUhXCqnkPw2lBCGN8f/bbNMFsVv4GfMt8hnIaVjbdo7kX?=
 =?us-ascii?Q?eeIll/Opc01G8xF6D3HAjXoVuJlTXyLIRcZY5DtLy1cXJxjvNqZjQSSV/qpL?=
 =?us-ascii?Q?x1F5BJJa0L0YyUmp5nLaYZevMdxgKQP0iLLq1hdw5qLbOqUk+CO6QMI9m8rO?=
 =?us-ascii?Q?0K2ApGvGkLqAE3B989V2Y4bG86/ot/E3Cu2DhZAnApGvTT+ec1/BEnm5Jt0M?=
 =?us-ascii?Q?GjNWc2T3mBQijknUAmwauLCr48FOcaDPYp6wyGpysgHzPjvxnr2Oy10iG1fX?=
 =?us-ascii?Q?t9gBpy7sg+XE61lNYF9XTkGA18+axbCuCu8MV4T3KQm64aOH3tKNnu8Hc9Tn?=
 =?us-ascii?Q?WikeMP0P+Qxi5lvHpJ+oaChLOl7YZ5N8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?APo/ZHWb84UTcEA+K3D4DJqDtOtMDMfJJs1o4Bf2RBtoYIBK4m0rBlETagAs?=
 =?us-ascii?Q?8ykGH8Gur0rPae23TgHJq88jP7YTJEOtMEV5ivsXjuHE53JI6rO1AHdgWSD3?=
 =?us-ascii?Q?fiNv4BSZQ0MfYCmPqaOz4p2x+3+2mD0Iu+ps+Kg/rxDGt8FPGPhoVaTYUrU2?=
 =?us-ascii?Q?qsOW4m0PD5HWsgRN444KIlpkC2HodPIJcKYvn8UVcBSZ8acWJbzTFyMQjPJz?=
 =?us-ascii?Q?zRoflg8g9pXxSGsTTfp/3yXbd/xAjrSLOoLrvpHqnukRTf0JiUWzrbXuFg73?=
 =?us-ascii?Q?mbqPwBQ9Vy3cOQDP3dPb6GoqF2yaMTczwTeduNzzp10+c9FysKcH+X4BOx4Y?=
 =?us-ascii?Q?F+SU8F9VN/qKuyue8VrMgh6OizQobnmWGCx0STkUU+gIw4JrZSJXolqKt1Vx?=
 =?us-ascii?Q?qG3D8iBYPQy9Ds6LBoI/PEscfyjnMu0MKMUhz20lVnTuu2GrDKVaiBazgpkO?=
 =?us-ascii?Q?7pa+cgtIumahDQRLTGx2NYGOK9T88y11uHGdHUTGrbLwR1fOfEQrRdpBRMDy?=
 =?us-ascii?Q?8hr3mnYoR2xnj66FsvRIRt62DykhDp/+txtnL4ywNZ0ruQXzIPh8hV4YzAE5?=
 =?us-ascii?Q?VuD2cYw525CI7GhGMiXTRicbrwQLjeiGHvBPrTc4bvUKaw5ct9ZwC5WG5sbC?=
 =?us-ascii?Q?wwTgDfj8aRuKPSHgkjOCiQ0wQqrIJF9ulbdcZheFkd+Or8SFVsDYU4xLfZ+G?=
 =?us-ascii?Q?ANQe9SrfxhBlvAO+Vwy8x9Sg/Vl98ZgHpS4CY21+w9tbc7F9XU9icYQPVqzG?=
 =?us-ascii?Q?xdtId0nJZ4a3ZYNHp2cmg1Eja7RhR7y+yd0bvOFzQN0aiux5wOTVsKS/8wHb?=
 =?us-ascii?Q?oZHXZO1eSgYS2tQUb/it+gRLvHXptLllFtOHT/OYsJMKQpga76/qE43+KoLm?=
 =?us-ascii?Q?wwmxvgGdyGzuavJIsc0DyMFxTP8kEZErToJP24rI4/24Zj2bAVzPIda15ilJ?=
 =?us-ascii?Q?/j9eP1eZWUiTsVxiH1I4Ta1IscttI3fP5VxglC0AfsvvMGEd7+gZit8b+EFG?=
 =?us-ascii?Q?DH3FrpcNtsQ3JCUDaoA7A1toEUnUE6cdaApznW/NZKha+ui96UPwQ/RLHcl8?=
 =?us-ascii?Q?QaU6YZgn/hVM5kWvWuM646LScbxSlhJ3CQJa6eSfsQGdvMgrgg4lzhhD2O2J?=
 =?us-ascii?Q?xIJgpsevl951iS6fnd00sSMM++ALNSu60KiseCc9bvDOv9qfVtYRUZJlx74X?=
 =?us-ascii?Q?pKIK7YNheFX9Rt7kWSpTduHPCcAPziztjheBgA91/EkUFI1kvHsRN0koOXPo?=
 =?us-ascii?Q?QaiLLBVk6CywfQiyBj17K1CIPrP2xwQlQhFu/oBk/w9FJ0pzcf9Du/0GV2sf?=
 =?us-ascii?Q?+78zwnm8gx+MXQf1bkDyaeTq0pwIX3Ghh0u2NOvVeVJzqIcga10MPI3M0YZw?=
 =?us-ascii?Q?BlFNLqXxpr27r7mB/jjS9rDVN8vn9AqI9Gt0/6JKDmggOnxuczmW1jw0ZVda?=
 =?us-ascii?Q?8XrJgMtfk0t1H4kC6SM0Fjdo/Y1O+FQHO+wFcxW5cPxwILFw4WYOiPN2M031?=
 =?us-ascii?Q?oAG5MT7BdWmoPbYs/GTXFJTfq75xgzur8Nyrs/I8OlsUFk8/BbvQ0rjvX4Sg?=
 =?us-ascii?Q?8MZRjwU4grApSamYHghq/8Y9xBAQWaA6IjUvSMD1?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	f4fLlTbjNDhV/S2sBU+U/zkfJb7+buRHLKV0Uu6Xn7VbpoBesfJUXiWJMD0oZKzgmWUV7KunpIg+rfTNdE8V/Z3Ta5AqnlrHcHbh2Z3Wc50JptYpZVQoCq9J5yWtVkQBE0dCsSXEkuXUGN0YPl9ZJvY2w5FhW5XcuzdHYQw22aQb4NSMoEtoKr/kmdLGa34OVHXyC40sFTtwCOvaprYFPRIxmSYBQzgo/mUrUxPtvUEtm0XFhjLb5O2gpKU7aBXDL6GAdzlj3WDtxEWN6Wb56/MON9mhPRT1VVWhQ21BX6wYP7L9QdN3wC+IfuQ1tIRCPKBQub4V7PY8xpvoBOCyoe1rA4fhmk7O4822VTSknc6POQE8hSlM/iLyCnW8Fu5T560pT5dgftIoeFpiy/bFxWEsDZUBMk6RuceaDcmelit8sdALfQEdTNxO9PE6wKyfEDcNILEv2+XTBH8Q2uh4feGkTEz9eNzsz8XKx3r7ulNjMr/QsFfuirvt31Shs3Y9e9sp4N8CEc55G8BjWt+u8s5pHVzEmcMlsgAqwOofT1bc7EzyAz19pfhqyE/pvhecfd9c7IMAXemOTO3uLGARjgEFMpmrZo27qM6yjF6rz8c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be54369-f857-4f1c-31b0-08de00b32967
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 06:24:22.8610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Gi1HG3CfWzyGSUykBtW/R7CFHngHv2Hy1int9Is11qLTkYeAMYlfulz1HCmAinWauShCdIvLJ0fVjXBpfMazQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7078
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510010048
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDE2NyBTYWx0ZWRfX61xAZE0BLR7i
 V+BBpaAQdtU8NoU/fC4/LI0612OBUtX6BDuQd9IM88hZzdDrzjuFRQhEDL0n4kM6b5gz9MUqTKo
 4cqF68EC/Dv1sDzAj8yMA2HbFdPKE3JU6Hp+pSavRuY37vzbuaAUh/jFUg60AXEyzdsTAoDOlCm
 XNfaTIzuV3gzQRi9rdQb6iB2JTI6Lipjps0+CwIX+Ryh4T7v9ZE9MGVjV4T5r6XYPsnpP7gh5pO
 ba99rQQM7ijfdpMrrJf+MzfabmgaiTC0dzfBGddJm6iX+G2XYwAKRTjdQD3Oeg/ICQepCNvy4l3
 b86jLzvOLRWV7c4FIbjD8bx5MFz53BrW+aObyNcXnW8THPjb6GwwG7HaQqou0DNHFFozMv/Mlkl
 rtcMvMXy41q3SoZC7m+iWcI6qpb48k6dtwotooCzNmC36RLaMO8=
X-Authority-Analysis: v=2.4 cv=K/cv3iWI c=1 sm=1 tr=0 ts=68dcc91b b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=CPJbIocr1Zt5UmA5-woA:9 cc=ntf
 awl=host:12090
X-Proofpoint-GUID: h3PeOEI4WbBpPGHHNPbuVKGHKPXHbnlx
X-Proofpoint-ORIG-GUID: h3PeOEI4WbBpPGHHNPbuVKGHKPXHbnlx

From: Eugene Loh <eugene.loh@oracle.com>

dtrace seems to work for recent kernel versions even when lockmem
is set too low.  The .x skip files for the lockmem tests say:
  - UEKR6 (5.4.17) we should test
  - UEKR7 (5.15.0) we should skip
and so it starts skipping with 5.15.

Apparently, however, lockmem does not impede dtrace on RHCK 5.14
either.

So, tweak the skip file to skip on 5.14 as well.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/misc/tst.lockmem-envvar.x | 4 ++--
 test/unittest/misc/tst.lockmem-x.x      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/test/unittest/misc/tst.lockmem-envvar.x b/test/unittest/misc/tst.lockmem-envvar.x
index a779416b9..494ac67fa 100755
--- a/test/unittest/misc/tst.lockmem-envvar.x
+++ b/test/unittest/misc/tst.lockmem-envvar.x
@@ -5,12 +5,12 @@ read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
 if [ $MAJOR -lt 5 ]; then
         exit 0
 fi
-if [ $MAJOR -eq 5 -a $MINOR -lt 15 ]; then
+if [ $MAJOR -eq 5 -a $MINOR -lt 14 ]; then
         exit 0
 fi
 
 # Somehow, UEKR6 (5.4.17) has problems with the the locked-memory limit,
-# but UEKR7 (5.15.0) does not
+# but UEKR7 (5.15.0) and RHCK 5.14 do not
 
 echo "no locked-memory limit on newer kernels?"
 exit 1
diff --git a/test/unittest/misc/tst.lockmem-x.x b/test/unittest/misc/tst.lockmem-x.x
index a779416b9..494ac67fa 100755
--- a/test/unittest/misc/tst.lockmem-x.x
+++ b/test/unittest/misc/tst.lockmem-x.x
@@ -5,12 +5,12 @@ read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
 if [ $MAJOR -lt 5 ]; then
         exit 0
 fi
-if [ $MAJOR -eq 5 -a $MINOR -lt 15 ]; then
+if [ $MAJOR -eq 5 -a $MINOR -lt 14 ]; then
         exit 0
 fi
 
 # Somehow, UEKR6 (5.4.17) has problems with the the locked-memory limit,
-# but UEKR7 (5.15.0) does not
+# but UEKR7 (5.15.0) and RHCK 5.14 do not
 
 echo "no locked-memory limit on newer kernels?"
 exit 1
-- 
2.47.3

