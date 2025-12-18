Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE67337686
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 19:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766086313; cv=fail; b=MtZUio8oOpAZu8HzHrH6iTZN0vI0QDzaafsEV1mmTttJmokk+n1KjdEAWc0T47f4DNh2KEDua5Xz7Rmq919YdE4Zd+Xd+6xqojaY48WDz5EEX7lsmYhEcaEGZ9Ozlx+7Q4nTSRkRYinmcqFo9Qo3ERjJUqYhmUJ5/QYbHzBtV9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766086313; c=relaxed/simple;
	bh=5Fa08TDbmrEeH31KN/YA1xPOZ/NWj9RzMBfMS4Tbux8=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=ZxCQ8G/RCQ/zPIlPFHTdKUMy3oUPh3La/v9+W8CLcTW6edUyzqjlwhmqQLTF9KbAlxf53OMNneK/23K1i/lRnCA8QbpRcsLcCawptJKs/law3EC1BDRo1NUDPLWW4Wfm/1bl/A1HP7j1DXEajkwj11leiywtd5L78ycQl7LtkSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iHesnE9g; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NBiii8KO; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iHesnE9g";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NBiii8KO"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIJNE061566666
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 19:31:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=RERxmu0oCCT2JPkWCBKiWZ53geyJrjuMg+VMVu+aDWY=; b=
	iHesnE9gQp7149bjg34l/YlStUOgEekVRxIzrH6roKUat49+XofB8BJNNWf9b3+X
	7Q7h+fn0WkdJ1XLYVLk40qi2Ka3NzpQdvv6BUmCkjrZu3/Fx9835kjEnKZ1MwL84
	24e9D/7AGVUmyuarZX35lO74Zw8Gx1DAFB/3sohsG6Qs+nYeQJzVBEABikuiEqUv
	DlNJq2SObH9wCN1f8TSVku5/NYA0S6uPCu5bCBuz2oq9A3aAvDAzV3bz5NjlU6Iw
	e94FKLsAFayekneLXY0yZHyjWWEGkVwT/9OkqV+WM2kRa/Y2JDuCDTRj93/I2d7w
	sKMoUbDDfW2S0P2+StBzHw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b0xja8bf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 19:31:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIJT19S035059
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 19:31:49 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012015.outbound.protection.outlook.com [40.93.195.15])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4b4qtcg2r3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 19:31:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YUK5+fuq4hfrAk15PETBAXH0RYucyxeRS9RNhHF0Aa5ewleRkgiRyRzB6W0Eu3Lynsy7OtQnWXeA3V8qwATqO5FAkHfvHXI8fsJ1HU9S1GXca74Qq1emHGzCtfl5fwuLg0T6NUS/cQ7EP+J43aIrXoAfLrJgkmPN6ugZey+ra5l5afMp5rUW7mFl21jqWzL8EWOhi2ZN21V2j1HRRCfZRgnmWYkrpA2Vlklz0OKkwE9HBPAYUtIapELxhEFHB6bGfdnjxNtT57nOx4tvPLH7a5cg/3ETajOj76Vb11tPzfxnyMdjY3Q0w7XfhtOKyCU2Q0tw3vqZcnZb16S5nI8AXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RERxmu0oCCT2JPkWCBKiWZ53geyJrjuMg+VMVu+aDWY=;
 b=Bu2GK9LCVnRctrRVdBXozPbuMh45wn1Q+CKwc6Vvsrlvw19YRS2IyFL8pujJX0HLrDB+kAUWoUbW6bPcDWgIi2XXsomVRgYd9gvBuC2gh8YiQ1N1ICuHvZNrKXhtjD0HMJpVmelfZBC29eAKhF5FqbtuQ13h16smILlGe9fpAvDr6npbtJflz6UEGw1Ulb3o/JzjixfVQRTkFBWxfjsxDWuB/uMZK/fSWTGhm3x+8ecfiduwwKUZbCJomI9ReNcy62atsbz+g5fBR/bNm+RsvJXzDwdl3U+Wpv/wANmjKhADmk3bjBuouZVflMY+60UUrJUh3sP7dW7Bl1HGSI5qHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RERxmu0oCCT2JPkWCBKiWZ53geyJrjuMg+VMVu+aDWY=;
 b=NBiii8KOsOMuW1qcFf/Js7Z7XkT2WYH3Uov/PHW5bexJ7wOjHgvsrNnYtz0SU9JYliBdp9Ahz9/m4XzTZ41R6TXPFV4jc40xSp7+bXueJRG4N4+cJXWYEkusC25hPCTUWfOkETbya6lS0nRfOIdB/vv8MJGpwjbYMy+yyqm+6G4=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by IA4PR10MB8688.namprd10.prod.outlook.com (2603:10b6:208:55c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 19:31:45 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 19:31:45 +0000
Date: Thu, 18 Dec 2025 14:31:44 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 1/4] cg, providers: refactor clearing probe arguments
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:208:36e::18) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB7522DE134C06525A82CA4DAEC2A8A@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|IA4PR10MB8688:EE_
X-MS-Office365-Filtering-Correlation-Id: ceb521cf-9b20-493c-5631-08de3e6c143a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4M91ycJLbheSuQ07LsEqehnaYe91ACTCHY6yIFjUKjH68ntSps2b+SF5IMmi?=
 =?us-ascii?Q?afwP2DkAr4WPxICAyuw8NbFAW/p9hN1QW2PAtHTmhrkUFmgNR7o/12Hqe5PX?=
 =?us-ascii?Q?aDPLqioh6cTeuMm5mtKu3QVxT2cuvzOXOqARNt2xVT6oeh/cAHI14LmVKvrL?=
 =?us-ascii?Q?XtDvi/WWZXZvOWNuZ3V4XDistjoMVVwIjITlbrpS9gPeSox4+yxbGGczCN7D?=
 =?us-ascii?Q?SWFwhwP71tGZrbdoEOxwYtGDu41h+wG1DrNN55JlmMNUQ0vYPORacbfqyULo?=
 =?us-ascii?Q?qSRGZkJUyQctdR2FQfGUPu/P7XmN/fIPyyECyGJtItrdh8CEJDQlZ85F3+6a?=
 =?us-ascii?Q?5x+7MqTkOpUBKsmvkEdhBNnrheeiB9WjRftTxV5tw155opRZGYTa8fqfhkNn?=
 =?us-ascii?Q?4vRE5d+COOPvqYXqoWMDusgLcouLE7aIs7k64XZ4uAxW325p/KN+9Qsp38WK?=
 =?us-ascii?Q?1ltcrpmtNerVksUAhGy8k0k4UNfMfen9BYcXSVjZArVIyje+wlDJ69d7mpLt?=
 =?us-ascii?Q?71kKst7PrwS334D0cfumZVOoV0BoYUehV62b28Rq+1zYSSb2cXHu/dqoff5E?=
 =?us-ascii?Q?jjESiXCTJ+2Nn2higkB+4YZGNdhPtaqLLFPCiw/Z2NFEISqCyGlly+eGFIP9?=
 =?us-ascii?Q?TrqUVbeWOzJRGPtmC/DLYEOm+86YwnqTrc+SUZo0WfHEvMBXkjSq1MMuhqtH?=
 =?us-ascii?Q?KTXMwcDxv9/uRkW846kCDCt2jTJc25Apd3z+degjxDK/rq/vnoP/Pw0JWZoy?=
 =?us-ascii?Q?QjqwkTKdPRNfQDgPHk68+5pn2nJx2vP+iwewQk6/2riduZdZIImSGcuRVe1k?=
 =?us-ascii?Q?TErnN87sFCZQl1aP0H3rWmWnks3gZOGdtDXsmAW+Ot1vV2zkZO1BZcizWEcR?=
 =?us-ascii?Q?cTd/xf921ymUDiS/6X4aTnZmUgCLaUJEWaDCG16D/VyczDip0uc7w8RqxbxJ?=
 =?us-ascii?Q?XPqos+FFu7/hQFFXY4OxC22eU1FLE+XQeAB1sBNC7LBvCJuYqiEVM7P3Kov/?=
 =?us-ascii?Q?9GUSaTiLQ7LjktUlnXvL9+qJZvzvghUgkr8qof9rR+RqDVwPFHjxMLEXD5am?=
 =?us-ascii?Q?edLqIrHCvc/tA86UKbks7YCzxz/jM/Rywlmb/Aekv8gcIC0y07B8rP5dhqI4?=
 =?us-ascii?Q?KCxtqV07Q+BYEqsc2acElM1P4OlL/EGyoAIx1P+ACsJ21Sgj5XYxiaICqX9o?=
 =?us-ascii?Q?diuw7f1uj2rMpPZX8C9u6AGJmkak7vBN+nt5zSdteELKBkeGiiPyugVryHdg?=
 =?us-ascii?Q?3txsvWVLHuve5kQqmBI9KdyTxxXqEm1fJyDgXFQw4jgaCmQUnnnEjaplK7N1?=
 =?us-ascii?Q?r1ifhi4RmuxVcmUrN6ZJY6mPIJb+8pBxQTKzFFdDTwslLip14u5iOVtr32P+?=
 =?us-ascii?Q?os/2mizzUNeYvKeJkKJS6vbcJz9tF3Ml/ClbWLxuipAyD3LOslBqkt/Wuzf6?=
 =?us-ascii?Q?3aCkt+qnmomiPrhIXnyEAhIVV5rUE4yb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z+1V/MInpPs73N7EXRpioISajzgIOoLjvWCNjNJf7AKdCvWd0J4j0rcmJ6Ak?=
 =?us-ascii?Q?bFQSJ8nHtqYgtFgSF+DpubGbVHh2ykjXxbn1JtVF6xIf4UpKfM72v6O3iNu0?=
 =?us-ascii?Q?xBOMOqxvNL/YcwZGADGCN0KPwyH3Z5r3n8eLHXif2+NgisM8EqTnIOBZskwE?=
 =?us-ascii?Q?dRzKNLHRTmUtUY2fd4CngWICnj6i699IkF7f1flHxtbUCZwF+qnsvXJRZQOk?=
 =?us-ascii?Q?TAbiIA7a/mI1rZBQKIfzK4MofQPdg2XrC5MTava8rim1G1ugSc1MhDto8Z36?=
 =?us-ascii?Q?pduClXYLU2yMEu2CpU7lrD6BGjeylk7ZQThwVDEIIOw4P3y0c3sQGcYbKnm/?=
 =?us-ascii?Q?MLblWAc5fzFtQ6G8Q4ptINIq0eFH/Hpt1MTR5lDAIJqjuEl4B9dS6W95Tfqs?=
 =?us-ascii?Q?ByEWlsnN62ZYNe/oDoQb6FZuPA8dAMNxG1qqnGSEJpcv6t6TKYAcQRqvJVPd?=
 =?us-ascii?Q?tkFkpjZvlzzi30QoM+cmcXmad6esI5iNd3VRTLqfUOfbztFq1BFrBWqumtK7?=
 =?us-ascii?Q?No7CLiylUxmY+X314BZmCmu8VQpcgPQS1VevjPUsatf4FR8GNAn6QJ5P6Fhw?=
 =?us-ascii?Q?6C6kFQSJXck83iSjuyuFH66awyX9xqnbxoMxesSszAehl6INxqmcc0JCQf1e?=
 =?us-ascii?Q?CSPzPzT4qkjVnY6UcMp0vzwZaxiQRL/wEE+X6u0iCBRqq7EQt3E8BcM3oe3r?=
 =?us-ascii?Q?273q9VCOcmjzGSoZnUxY1Rk8zzNX/fjazDv98X2Hhpvr3W7czfMlfaukL3rW?=
 =?us-ascii?Q?XOV0hKA4qteVcSGthkbjLtA0tJW63f868VwuvugDjQf8aNHrnn82ZT7yx+KP?=
 =?us-ascii?Q?aija0T7nyXz2Up5x+7UBCDbm5M+TsLEZZ4ogDl4FvGnU+wteOMZjFrC77XWi?=
 =?us-ascii?Q?eR3B1R8dK5AdEduk9fMEfkfKl0oYFrg2eIZVf0id1SxpIQLHGPZvF1ew11Sj?=
 =?us-ascii?Q?kQZPx6hJy0cYo/91hNH1fckgN5ld6/2waAeHzJmzKjfkeEAZVqdV7bJdPHnS?=
 =?us-ascii?Q?2sC3v2tzZuSr7mnG5u8vMSkDMDK4ihpvHFWP1p5qhrBAIDfvMEZa4UyR1dS9?=
 =?us-ascii?Q?Y8xHeLXiLenKoOiLX9xPlSYIjgk/e/J7uIrj/OFYzMVs8DIA2+RqCZfJ6f3P?=
 =?us-ascii?Q?c8LR4GEUETQPwnV7SN1K21lfuljcr7r7A9GK/BPoHNi0petq52Bhkf13hGff?=
 =?us-ascii?Q?KUaj60VNbMnIxGOW55qSlt88lPKdkH8jTBmAcH4AqssbLD3KDlncEBW2rkJH?=
 =?us-ascii?Q?DCqcb5c7Q4zQzfGwg086SZkXkKNQmwGa+dVIAXeMOj4If7mBIb6oBie5W92M?=
 =?us-ascii?Q?gxHrmBFGSMM2506RpBZYIj/Ih3/hrNptjUTy2s0qAr/TIMEq6PKMh0g4Yexw?=
 =?us-ascii?Q?xRiWA9AJJNvG77A8wTSjHflY3clFs/iY+MdsYG9No3KrlKCe/iBQC9InNXT6?=
 =?us-ascii?Q?X35QHK38wk7sq1NUFu/i2bDP5+LWV0cdnM8H61CT6ZCz9wr+W8fIBoz06BVA?=
 =?us-ascii?Q?o0tUWDoeTftgr9h6UCne6K9UjGKiJBeOANAJ5imgDW+s54pwcP4JqhpAjifO?=
 =?us-ascii?Q?rHInTiivPDkTH9SqgOwN/hD0VRjXkt3FHleit41F4Rmnf2/HLYPaZeU6gadw?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IM1jipC9C97taU99ANqroHfQ8s5qGq2/y96oIMJNjMNwszJjtNRp8C6BuPm/ugZsmslaeL9fHTqPT8A4bYF7E+/l0MUHL5+IO994aSSa33vORti60uFCEOFN3fPZwVSPO/BdJUsKjqvLtVWJATzlmz6vKIwv15o+ORy/JV8v0yQSD40KKTj3Rw9nsbEIszdlMKSyoLxKgysseCX4rlzK2TZdEhu6HM98F6zY8y9nOtCduqr25M3OX269Q6vj2eOIwt9pkeSnpuj8sAiTXAPmUmbEtk+7JicN5ems42ioAhDUE2hXjISkEB18ufc2KdMjf2tyHhZupZnGr7DO4qyjMO8UuCyFR+2Fsf72YGuB8VwMibN10opWnYDFblaoWc7U4WLwB0e2wCX8x2IajaVg+uIXJc4N6dC9aS4GTCfi+FC2XUVmlbGp5VZFfxtXrOYsgjRLcMTrJdAbR30IK1NzuUrXi2LHTNC/fB0TFqz8oejUj3d9Oh8I1F3NGoZbaDIKshcuaE+3+7wF1xIVW4Hl3PuZrpqz/OLCan+lfFMKhdqBqQedbumJzfCG5Vrww49k0SxQ91dqt30dSsJcIUzaxmW5EN+Cosx649PnQRblXHw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceb521cf-9b20-493c-5631-08de3e6c143a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 19:31:45.1163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p9CC6aUojXAEXLjQJMPoelbTvIPTirehBHS8tArXnIeyPF5803mqyVEGA0SXmF8iiSANYSFCqhCwr2kwqW5hsgB3hMaviGqXdo06hEAauJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8688
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=956 bulkscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2512180161
X-Authority-Analysis: v=2.4 cv=TbWbdBQh c=1 sm=1 tr=0 ts=694456a6 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=sSV-fTKZYZwYaJdNStEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE2MiBTYWx0ZWRfXzd3JJ/u3gPgY
 2csfi4hUNKum0mU3wukp18Wy4SsSkuo1EB7a7bxrdITSY7Nv2XFlR2+uy61p4YidRPaGGyQUI+D
 9puZbychZoSRbHSkoCHFFgCJ0TX0RivDEX64EFs04nvz31vqr2CfeNDS3P9561rxKJTCZ4M5EA+
 BYxTEPkvKCLUQ4ZOcsfO+RS2SUN1sa6tlZxVU0HB6i7iudJ71rl7faMLYxiiiuk9Ar9NfZoYzlH
 OqBIj9dKvnanW23mLsnnTwQbpnyX166jVvHgN6LnjPHEkFibRL/tk9AM308JLh2fq/qCQCDqnic
 01Anb1pf8P19VpAiKo4ILZ4rHxz80bQMcbCN64onct/2RUQrL9zfN59lQ1/Mg1v+5InlAOWmpfy
 c7lHdCD9SUJQxAx9EZr6GtfewCnyxg==
X-Proofpoint-ORIG-GUID: 9RygEea-E_Y5j8hw8Y5RQuJI-apFaxNp
X-Proofpoint-GUID: 9RygEea-E_Y5j8hw8Y5RQuJI-apFaxNp

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_cg.c           | 34 +++++++++++++++++++++++++++++++---
 libdtrace/dt_cg.h           |  1 +
 libdtrace/dt_prov_cpc.c     | 17 -----------------
 libdtrace/dt_prov_dtrace.c  |  8 ++------
 libdtrace/dt_prov_profile.c | 23 +----------------------
 libdtrace/dt_prov_syscall.c | 10 ++--------
 6 files changed, 37 insertions(+), 56 deletions(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index ec4e3123..b3084ddb 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -454,6 +454,32 @@ dt_cg_tramp_copy_regs(dt_pcb_t *pcb)
 	}
 }
 
+/*
+ * Clear the content of the 'argv' member of the machine state, from the given
+ * index (idx).
+ *
+ * The caller must ensure that %r7 contains the value set by the
+ * dt_cg_tramp_prologue*() functions.
+ */
+void
+dt_cg_tramp_clear_argv(dt_pcb_t *pcb, int idx)
+{
+	dt_irlist_t	*dlp = &pcb->pcb_ir;
+	int		i, argc = ARRAY_SIZE(((dt_mstate_t *)0)->argv);
+
+	if (idx >= argc)
+		return;
+
+	/*
+	 *	memset(&dctx->mst->argv[idx], 0, sizeof(dt_pt_regs);
+	 *				// stdw [%7 + DMST_ARG(idx)], 0
+	 *				// stdw [%7 + DMST_ARG(idx + 1)], 0
+	 *				//     (...)
+	 */
+	for (i = idx; i < argc; i++)
+		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), 0));
+}
+
 /*
  * Copy arguments from a dt_pt_regs structure referenced by %r8.
  * If 'called' is nonzero, the registers are laid out as when inside the
@@ -626,6 +652,10 @@ dt_cg_tramp_copy_pc_from_regs(dt_pcb_t *pcb)
 	/* done */
 	emitl(dlp, Ldone,
 	      BPF_NOP());
+
+	/* clear the rest of the arguments */
+	dt_cg_tramp_clear_argv(pcb, 2);
+
 	dt_regset_free_args(drp);
 }
 
@@ -640,15 +670,13 @@ void
 dt_cg_tramp_copy_rval_from_regs(dt_pcb_t *pcb)
 {
 	dt_irlist_t	*dlp = &pcb->pcb_ir;
-	int		i;
 
 	emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(0), 0));
 
 	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_8, PT_REGS_RET));
 	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
 
-	for (i = 2; i < ARRAY_SIZE(((dt_mstate_t *)0)->argv); i++)
-		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), 0));
+	dt_cg_tramp_clear_argv(pcb, 2);
 }
 
 /*
diff --git a/libdtrace/dt_cg.h b/libdtrace/dt_cg.h
index 9493edbb..401ac0e0 100644
--- a/libdtrace/dt_cg.h
+++ b/libdtrace/dt_cg.h
@@ -26,6 +26,7 @@ extern void dt_cg_tramp_prologue_cpu(dt_pcb_t *pcb);
 extern void dt_cg_tramp_prologue(dt_pcb_t *pcb);
 extern void dt_cg_tramp_clear_regs(dt_pcb_t *pcb);
 extern void dt_cg_tramp_copy_regs(dt_pcb_t *pcb);
+extern void dt_cg_tramp_clear_argv(dt_pcb_t *pcb, int i);
 extern void dt_cg_tramp_copy_args_from_regs(dt_pcb_t *pcb, int called);
 extern void dt_cg_tramp_copy_pc_from_regs(dt_pcb_t *pcb);
 extern void dt_cg_tramp_copy_rval_from_regs(dt_pcb_t *pcb);
diff --git a/libdtrace/dt_prov_cpc.c b/libdtrace/dt_prov_cpc.c
index 57b11b13..fd33990f 100644
--- a/libdtrace/dt_prov_cpc.c
+++ b/libdtrace/dt_prov_cpc.c
@@ -393,26 +393,9 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
  */
 static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 {
-	int		i;
-	dt_irlist_t	*dlp = &pcb->pcb_ir;
-
 	dt_cg_tramp_prologue_cpu(pcb);
-
-	/*
-	 * After the dt_cg_tramp_prologue_cpu() call, we have:
-	 *				//     (%r7 = dctx->mst)
-	 *				//     (%r8 = dctx->ctx)
-	 */
-
 	dt_cg_tramp_copy_regs(pcb);
-
-	/*
-	 * Use the PC to set arg0 and arg1, then clear the other args.
-	 */
 	dt_cg_tramp_copy_pc_from_regs(pcb);
-	for (i = 2; i < ARRAY_SIZE(((dt_mstate_t *)0)->argv); i++)
-		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), 0));
-
 	dt_cg_tramp_epilogue(pcb);
 
 	return 0;
diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
index 34b5d8e2..453d3e58 100644
--- a/libdtrace/dt_prov_dtrace.c
+++ b/libdtrace/dt_prov_dtrace.c
@@ -83,7 +83,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 {
 	dt_irlist_t	*dlp = &pcb->pcb_ir;
 	dt_activity_t	act = DT_ACTIVITY_ACTIVE;
-	uint32_t	i, key = 0;
+	uint32_t	key = 0;
 
 	/*
 	 * The ERROR probe isn't really a trace event that a BPF program is
@@ -174,11 +174,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_map_update_elem));
 
 	dt_cg_tramp_copy_regs(pcb);
-
-	/* zero the probe args */
-	for (i = 0; i < ARRAY_SIZE(((dt_mstate_t *)0)->argv); i++)
-		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), 0));
-
+	dt_cg_tramp_clear_argv(pcb, 0);
 	dt_cg_tramp_epilogue_advance(pcb, act);
 
 	return 0;
diff --git a/libdtrace/dt_prov_profile.c b/libdtrace/dt_prov_profile.c
index e1369ca9..cb65ca43 100644
--- a/libdtrace/dt_prov_profile.c
+++ b/libdtrace/dt_prov_profile.c
@@ -216,24 +216,9 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
  */
 static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 {
-	int		i;
-	dt_irlist_t	*dlp = &pcb->pcb_ir;
-
 	dt_cg_tramp_prologue_cpu(pcb);
-
-	/*
-	 * After the dt_cg_tramp_prologue_cpu() call, we have:
-	 *				//     (%r7 = dctx->mst)
-	 *				//     (%r8 = dctx->ctx)
-	 */
-
 	dt_cg_tramp_copy_regs(pcb);
-
-	/*
-	 * dctx->mst->argv[0] = kernel PC
-	 * dctx->mst->argv[1] = userspace PC
-	 */
-        dt_cg_tramp_copy_pc_from_regs(pcb);
+	dt_cg_tramp_copy_pc_from_regs(pcb);
 
 	/*
 	 * TODO: For profile-n probes:
@@ -246,12 +231,6 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	 * and update expected+=interval.
 	 */
 
-	/*
-	 *     (we clear dctx->mst->argv[2] and on)
-	 */
-	for (i = 2; i < ARRAY_SIZE(((dt_mstate_t *)0)->argv); i++)
-		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), 0));
-
 	dt_cg_tramp_epilogue(pcb);
 
 	return 0;
diff --git a/libdtrace/dt_prov_syscall.c b/libdtrace/dt_prov_syscall.c
index 20843c6f..237f2728 100644
--- a/libdtrace/dt_prov_syscall.c
+++ b/libdtrace/dt_prov_syscall.c
@@ -159,14 +159,8 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
 	}
 
-	/*
-	 * Zero the remaining probe args.
-	 *	for ( ; i < ARRAY_SIZE(((dt_mstate_t *)0)->argv); i++)
-	 *		dctx->mst->argv[i] = 0;
-	 *				// stdw [%r7 + DMST_ARG(i)], 0
-	 */
-	for ( ; i < ARRAY_SIZE(((dt_mstate_t *)0)->argv); i++)
-		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), 0));
+	/* Zero the remaining probe args. */
+	dt_cg_tramp_clear_argv(pcb, i);
 
 	/*
 	 * For return probes, store the errno.  That is, examine arg0.
-- 
2.51.0

