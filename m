Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8509517BB25
	for <dtrace@lists.linux.dev>; Tue,  5 Nov 2024 17:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730827780; cv=fail; b=eKSJrPtTTM0x9zBlZJwNEVHp6P3s4ZzySu6CqIXjFY2Wozxc6dRH4NZL/LlGAtUgfYgq/5IMRU1FAxAbeZcAMTHivLdoir44iaZHac9vEXuPrdjd86VaNhT6sa+il9efupJuXz6BujZ8J56eU6Wf0+JOcJuRmeh2gQ7KVwnVK8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730827780; c=relaxed/simple;
	bh=V835TRBeVADRm9jU+CKUvlIBcYD2JtjcJhCDZ3okwGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LfM33QzeNgjm31YXpTQ1naYF51NPox7q4PHpOuRcqfk1O/UUYFkziL8j94WRCxRsEweJr2lJ7+/1+jtHNNzOYu8wpGI9XBPTX6Ojn4/ZlHbTyR0pp/nMY1Q0vEH3FovJHt36bRNFB7+kf2LWdXiqYYPc1PzbVY0z4rvbdpIF6gw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=f3GwUcQp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jU3w/9Cg; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="f3GwUcQp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jU3w/9Cg"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5DiYY0026713
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 17:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=+238bsf8KODMCNTyY8
	RAl/vsOclOcL1BPFj8pKEpf58=; b=f3GwUcQp5abFuGeXNqNP8tFVTj2zVuf6cf
	dB1+Ghsq8RF4aywk2VabfDgxTFTPrrfHj8ynhNzfylW3IDHBsAgdvGCn4X8GFncC
	ckfKx2+giQF7q2PQLNG2+mVN5evbSVKtgMmvLvvElFk8lGSpGUlZIa0YcDOppnw8
	brY81Q8AnLIZ4uwWTlLfp5QBPKmRL9Du441bVcrx36Yr6gmreEhvX+6+yb+EQI+s
	eVgNF4osWMr2msKDoxFhLG8D76XGnNNZpvaD7+spaI54UU0lqN95WvLrn8WKA08K
	aHTLjRddAxDMe+LtHwz6IkXar7o9vUxq2vCv1xGY97DbqtY0bZ5w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nagc5ymp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 17:29:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5GgPvQ009824
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 17:29:36 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2177.outbound.protection.outlook.com [104.47.73.177])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42nahdqryd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 17:29:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXLhFra5sWzTxFMun9iKn6aq448zo69V2TaUji2s5ZGMJsy2xJzBo0jOxhajwJIwKb46mfgdkMLiJKdF55qjf0DXoz63YZRf/qlFAkiaIVMujDPV52q690eCer+RPnSi5jsNKAwuvqJMwE8gkGNyliopPoemH3Fcp22QjPLXLNbYnBu1QGF06rxJFqkdW46GIF0oS6BRVszpfokshcfN5x9V3Yw0BytU5DkNnVe0WPvG65CGUZzmviJQWqkRhHS7oZCIEKZoTq+xcppRwluHcyQJb6L+FnsWPZZ8lrOfRFkRGdQ9aOFdIqYR/AEmeAety0sWY3W3gK53QW4zjRQJ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+238bsf8KODMCNTyY8RAl/vsOclOcL1BPFj8pKEpf58=;
 b=wdthkqWp+XBq8NkJKpteMAs41Pypd82eLt+D8PnSKOC+1Af0j/yQCc50vSKA7HJISEpsWIBvzOCjEdN+5xNCcPtS5GYtSeCym79Skxg2Veg9QK4svJGSM83hFhzcQeM7j3wBcpDiOGXwID7zK8RSncIo6fZiGooNuHV1lbozVoNpjx9OTxrDHEHYJNZfiWVXeuxv0PLZvVxu0V/9/y23DQCvXLTSHsWnutL3dVSkpAxCn5wikHHp4nnWG9wdP8TZ7CvW57cQEvsPDdrbuyclFnk0dqF2M+2uzAHIWN8nXAxQwKLdCqr6IvlUJFGFaETFwDrR7P8JKExHwbUE5LNTkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+238bsf8KODMCNTyY8RAl/vsOclOcL1BPFj8pKEpf58=;
 b=jU3w/9CgrDQwhRfRjjPdam1AxJZFMUDyRuYxnzsxgJvz8qNGggs+gLwd1mUhpUf0QqBlZRdO9rnRcWMDLsGaGDYyvptlJSSbG9xJ8LQSrsmMBDhhI5t2b9A4GrKeo5LB81+TXSKcUYuscf8+Szfdswip1rnQnjQE44SASvcmsF8=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by PH8PR10MB6290.namprd10.prod.outlook.com (2603:10b6:510:1c1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 17:29:32 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8114.031; Tue, 5 Nov 2024
 17:29:32 +0000
Date: Tue, 5 Nov 2024 12:29:29 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v5 3/6] cg: add argument mapping in the trampoline
Message-ID: <ZypV+dU4YHlxmICk@oracle.com>
References: <20241105000608.333229-1-nick.alcock@oracle.com>
 <20241105000608.333229-4-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105000608.333229-4-nick.alcock@oracle.com>
X-ClientProxiedBy: SJ0PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::28) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|PH8PR10MB6290:EE_
X-MS-Office365-Filtering-Correlation-Id: c68dce43-d39d-4070-65b7-08dcfdbf68bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fXnj1vDvdMl5MtFl1wKW2pr0VAdXNlYizA3588GmCZN3VdGlxZnTjiLokosV?=
 =?us-ascii?Q?8rr5IncXaapJzBigRi/pEUKj8gBq2EzVM74Xz9BIpcdlqfzReS4YArWM3Rsj?=
 =?us-ascii?Q?ZQaCNEQ3U5yW+jfm7c4v+Gh8jAqH6cIDhMbj12xb1IJfnw52KW/NoY4E790G?=
 =?us-ascii?Q?fkhEODH5lUwTUNI8+xgdi/ba7EyJctrVDWRDPnJSxOyxoqziPtmQk5D29ryK?=
 =?us-ascii?Q?24xX8UWnknb0loT6S0l5ML61WICh7h1UFmR/AxXGjP5x57c/IXx7KKtNxEys?=
 =?us-ascii?Q?FLz3Wpe/CyW/BrJUQnbxXgHIWT7aWeNyzfIjqcCn90EJS1U32osMT92qU0y2?=
 =?us-ascii?Q?XtKjtXhZXj9wvPaiW8YXbQqSwcC8lPcVN7uYLVuaEmY916ngU33L8dntqE6S?=
 =?us-ascii?Q?3g+JrnitEV+CEtEdbIwxwjrSJHAIbHN28FaCIcz+dbewxJ44cOMOh7wfOoVc?=
 =?us-ascii?Q?wfVYL30my62Xx0wAU/wmadQhOfV6oXePkU9NIMhpWL99IdH+gS3O99KwdRTU?=
 =?us-ascii?Q?cSwPcaAihI6WjddCyKpqT4NwN3vcSJN8/jBMmfI3un86kBdm+3BQAyT4jXOa?=
 =?us-ascii?Q?aiXAGH2WmCwD0FWDkfXOIKf5MC/3kwc1c8OwQ4+a+freptDveChc5jiB2+BH?=
 =?us-ascii?Q?CVd3wq+qyFFsVmKK0Z8F2hI+TMJNI9fBmCPWhGSO7MV0fL7n6uxBOaygkeTn?=
 =?us-ascii?Q?ZsjKgVzoMcbU+98obtHq7BLfMGgUfDBQxwT6gdJXWscOck2uRGxv3YaIcQIx?=
 =?us-ascii?Q?4aJUt8t2AN2txE25HYOoDrAeCXsavfKK6cDbFsfWEh7Ma1MFvQ+7cWjIY6lT?=
 =?us-ascii?Q?U7+ArjHvgSlDXjZQ6dAlqPNXhSsDxiEIcLPtG8M4k2avuMBEbD565jefnw4z?=
 =?us-ascii?Q?FUXZtbWWngjqFdKM9wuwF+E5aAkXWy34J6E06lbA3vhv5hfTlmVYM0jzRDG+?=
 =?us-ascii?Q?9ROUYH0xTl7rggxqkKq/UJvSk0JcL5fDYwLj8N4tHp/CCvdGmpUkvRp1PxGP?=
 =?us-ascii?Q?EbyE2QHBjrwp+AEBpeZn653XvDJO3+3Ykh4qcOycYR6hT7d5uj8v9LiCTcDj?=
 =?us-ascii?Q?MUARQ538cPEsuZ4nrctvU7y23Z1zyv2ocpCAXWKbHQRWEU4o8SfgAXLHauMW?=
 =?us-ascii?Q?JBJc5CfrksscNS2ijbUaJFxpfCEokRPG4knaKrvSa1Tk1WPjp6NtzmfWTeMS?=
 =?us-ascii?Q?KLpA2iYn41/QcV1EbpE+LeQrlgFyLujPi0pYCJA7DVD5NDivq34Anw9mMo1L?=
 =?us-ascii?Q?LQcvzADXwXWbloV8MS6liUBfSa+/Qu+BN99ljzkdjqQw0mAWvKukA5zqZRlH?=
 =?us-ascii?Q?Ua7eqbrgYtzOM8UBChk0ZSH1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gm/p2CHXTXOj5SuSag3q8BrI8GxungEslbKKmo0XDXDL7MqS91ccPiSfp6rs?=
 =?us-ascii?Q?+WXYAgPrTQIU0UewDTt2VV8Yuj54+40T9lPJaQtzkLWF3pVfvrSludvVDQMh?=
 =?us-ascii?Q?vPD9oiE3lvgGXGdeVru+4mzeDJb3rI3DebbXFsQR0RQ7s8/LslTtK8nrVDFv?=
 =?us-ascii?Q?CHwk/45oQRb4ua7yfyz/gCgS2LY3QjulDh+UmCWVlxLVpi7J7TGEu1FUMZRH?=
 =?us-ascii?Q?v/ah79A0P/svJ5lmUxMXy9DugxypWuTKebJbqhw9Sm4qZifaL4Ghir7W9a+G?=
 =?us-ascii?Q?JSUwyk9V8Wv/B3ASqwXUmzs5SuuxrpfJVxfLzI/QRfEgK2LQugtj9MbNRmf9?=
 =?us-ascii?Q?dbCWYcb++oG+vC2UOfP6mHfAIIKnb4p4SOsVIEAYd3+4Dx5NFZ+NH39ya9Zi?=
 =?us-ascii?Q?T+1Wqc4oqFqBUUCAyndxCZ/jTXluKKbehOPbEFF00uahyyVt8eYgurFWIuwP?=
 =?us-ascii?Q?uiHHfiDiZjnaXAgPDJIvzf2S7zOG0ZGW+gR3TAXDMEzZo2VM3K7CCC/wQWBq?=
 =?us-ascii?Q?ZsFffIcxL7kLGIm7stX1swQpRXGfoWYm3vKb/a7fVKQdVhORddR07rZa9Cwp?=
 =?us-ascii?Q?NdFt6vBWWmPfAH1a4yCkga2NOqhWMTYLsXlSUVEsQXYScvHLnzeHPCPJVSTi?=
 =?us-ascii?Q?K4HI0JQvE11Zra8//hJTRk2/63ONqm4mjvsC7zz5Gm4xyiQtZH7HtJqxOMaf?=
 =?us-ascii?Q?k09q98smDkxPnIcMD4TbRN3co8ROWYrOG2vofwsH6AAkEdjoouJPTwgE0tI9?=
 =?us-ascii?Q?IMokKMvrVLcHXtg+15WbCfU49YhOIXIqzFoatUXlMqtly9gA7bJEcwHmEQ1h?=
 =?us-ascii?Q?XzYdRK2xKT96o0tMRUafga8T+1HrcX2bOzFx/nGSy0WHyJKxgcFRf4Qo0Yr6?=
 =?us-ascii?Q?yQ/xWOnp+C2qLkfPPyC/YVG5Pgy/+5qk9+t8ldWdmC8L40kG6FxMn0cZACMG?=
 =?us-ascii?Q?2e53BhVk+AQqyOtc1Mnozl+9e152+Qq3t+qGptXKATyGTDOHVF1SrCJW5Yxv?=
 =?us-ascii?Q?TQR/g8oAQawUAOApiQ7otxIK1ZhriCndoeo0j+D9H5/T/S4whj6ad9agontU?=
 =?us-ascii?Q?Juin41kcYkiDbRf+HNPuyaiPEINYee6zN4Qou60fnv6tJ0vGT2MRxfUjOAWG?=
 =?us-ascii?Q?jaDPQzT7i0eXYNJIRwt+eLbvhtFd/Mqqx9NkiDuKbx1OhdR84HF8ZEBvbDjy?=
 =?us-ascii?Q?fIlwLMKMB3mqaUSq0f3DPINKEfRd38+btOQ4ymHbdE94H7i2BL1f36GfbyLX?=
 =?us-ascii?Q?wMHuzHF12h6y+aPNwUEmttMK1zXTCNlmoFH3AEQZiWmrC/DAsjnZ93vQNI+y?=
 =?us-ascii?Q?BH2uXY91gfpufaySxB6tzCMpdAhtW/qGnNUEHbpmEjtNSdRTorI9UtYbFfuW?=
 =?us-ascii?Q?6q8LU9mSdbfkcL/LXgKixKtbNG77DtQUFPJROznRnSyZTLygNa5XyvJl9Qvs?=
 =?us-ascii?Q?6hEtygxMIskmL6ajtWWhLGIG2/a3F5kh56iXHDa+xHP7X62/y7vMHcde3LfL?=
 =?us-ascii?Q?yeMphVO/s+ANM5H+XstOu+aM+QQLHpTY+PTfsZNBsf8LWJYN/OuPixoqblaE?=
 =?us-ascii?Q?vkkum+EA9UTrObqeTWudaT5HGqCKJ+IDnEnoyBETRIGpp+0oKz5S/5CMghCk?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	M7I7smtfApDlw2wqeVtPWvLyvOnWOmL5KJfm8cEXd0juCtMUIiJw0GhqTBm1EQwMsEhXmok6U3ULaQH5bJ/33t1/+FK0+xFVZyREwDadQ5UVGadp/8ot60/0dgBF6OoWi2UzM4JQwu+RGS2EzOROtKhNRCZxVTynKdlGrtwNKqb/1kILT81IOI1J5xD5sCFDMbGnX+e7TulkEj1SRnrdUPUZKd18AG4WwAqkgCaExLtrsZoj1fK6XqDkNvN37uOtSEnS+HTcyTkfdKyxQCI0rmcXX6X5YEAMt0fCDMP56Y7xCBkbalDcsAQtmMf7b2CfHxV0/B+QEWVcu5KOY/xuJa3S+e3LoMtx2GK3Ql4Qvo1zD9BVw897S1IoHziVW0lPTj0ZnRtVgvVEuWNVKg4qsQBCl66EVLuN+ji6K8cXORtE4dlYJn5gUJqM9wWCyh+BBhHZW/F4qnPEUJKOHiyeAt557MWh8QyVASruZPpxas4IdRiCs1IbQQi83nPCXSFFI7CLYKDgWnsovIywY2H4asQcc/BLqpfXgh2d3y3xjhDDC8+6E48Y0AmaTOVc8QJiI5vEnHuhG9gPsOkHYu6SyPb1zSxkHPtV/zeYHvtMM+8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c68dce43-d39d-4070-65b7-08dcfdbf68bf
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 17:29:31.9459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sd9nziP560FoeK9bPbFqogi7uwwYu8XhRjkHpoNjnjcL65/fOLOu4eLCT9N2qePBngB9leID7SBLxbUKFNFt6MZ97sK+l+nyPbmrXKc3XDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6290
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-05_06,2024-11-05_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411050135
X-Proofpoint-ORIG-GUID: nhGWIpg_QHoW8DaQPFZoZX3nHFvfHzt7
X-Proofpoint-GUID: nhGWIpg_QHoW8DaQPFZoZX3nHFvfHzt7

On Tue, Nov 05, 2024 at 12:06:05AM +0000, Nick Alcock wrote:
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
>  libdtrace/dt_cg.c | 26 ++++++++++++++++++++++++++
>  libdtrace/dt_cg.h |  1 +
>  2 files changed, 27 insertions(+)
> 
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 39c27ab0ec0b..464ff781d008 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -831,6 +831,30 @@ dt_cg_tramp_restore_args(dt_pcb_t *pcb)
>  	}
>  }
>  
> +/*
> + * Move arguments according to the mappings in the array of arguments given.
> + * The original arguments are obtained from the saved regs, and overwritten, so
> + * the regs must be saved in advance of this call.  In effect, this changes the
> + * native arguments: the caller should adjust the mappings array accordingly,
> + * and shuffle the native arg types to match.

This is confusing...  How about;

"Populate the probe arguments based on the provided dt_argdesc_t array.
 The caller must save the arguments because argument mapping copies values from
 the saved arguments to the  current arguments.  After this function returns,
 the caller should adjust the mapping to reflect that shuffling has been done."

There is no need to talk about shuffling types because the dt_argdesc_t array
already lists the correct types anyway.

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
> @@ -5061,6 +5085,8 @@ dt_cg_array_op(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>  	 * unless the argument reference is provided by a dynamic translator.
>  	 * If we're using a dynamic translator for args[], then just set dn_reg
>  	 * to an invalid reg and return: DIF_OP_XLARG will fetch the arg later.
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
