Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793389109;
	b=PimkHiF9n975GTtNhrTpB33TYX0g2Yt9dm+ljqdOgm447xVvtsCYl5QOVR+Z23itj9gF
	 vwqdMIyh5UG+Hq3endblQkTat94mRZIn6L1PFVxUHr+2DD9XmiprSLSvPsTHKfVd6gvv9
	 PxBtwXQLNvjCxv/H8BZ/I8VaJACFHpjPKWHBa0Gofu6lR9kNZHk9EUZflnC8XYY6JrhHi
	 QkmFyshQiU900UYOQue1DQpXZyhHbA3HCMZey/UZ/U5bZt/vmXTZOK+1HT/H/koQ6Yrjo
	 KPI60CCFTIvRAVmpc3eXkPFf744HE2vWNH0OlMuJ1TZIlUwKEizUiglugS3Z24Do6SQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389109;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Subject:
	 Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-TrafficTypeDiagnostic:X-MS-PublicTrafficType:client-request-id:
	 request-id:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID;
	bh=xsO1ePOkCrNkkOaqwRvEqxvgwV/zK+CqOjC902ZMeWU=;
	b=3Bho54lCu1ksiL+jnvbrkuGrNuW/o1Mb7U4u7ZcrsqJhdXRPytitPCNhcCORNqKYUyaq
	 GEdwASUHy4xlslitmKX53vs2/9/Fb1m2JqfTTGE/oI/QDpC9ZIE4fdPqsfpsTCGa8zec9
	 FvVfM0vewAForFqNbOFiJ9LpdbJxkOBrmHOg7vAABzX62nw6eUmSlbRsGQrkiHcf1XCqA
	 scagcoPLWEzE1pxLmIafhwCS+stHoWFdislBFPoLNv/fHMcAQhx6pOOjcuLHc2Q8ArRyE
	 zXYl+ddvLq7AGUbp3A+X+CoXsIypEhsSLEWQCXiXIcIWrTfLdZo5zHoBA2mBCSa8xZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=i5y0dOVE;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=VW0yjHTz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF86606A31A
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAF86606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=i5y0dOVE;
	dkim=pass (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=VW0yjHTz
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UEXT8S1845861
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=xsO1ePOkCrNkkOaqwRvEqxvgwV/zK+CqOjC902ZMeWU=; b=
	i5y0dOVE2QptoZXpB9U0z3SgKsx6A2jxK0o3pccpfnm0Teo+jVG5MEwytblQqRCT
	feT+kfiMq+HflMcToA2dtP1TcNkgltmW/73uzVsy49NRbKkc5ZXOEslAQ6yibDI9
	8FmNhBB+WJe90Rj/QCw4JjIknzyUPXwMGQJxq9Vkeq6ZUDsQ8AfrSArbDXQ0UKjE
	Pi3AZ2QXIRCDBR7Z2gnM46/2jYpzBgSAOzvd824dLCw1/Asdovy1WK1hiBrm+x+l
	tIPVMf7vpjjKsthcQKqXDErL34NcFG8NQvC0t/kMRzbZTIhMSSWYMre5F/RtdeoZ
	KCsmZo4H1kKSa5PrGa+ZCw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hme5pse8n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 69UJLnxq3892254
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:27 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012055.outbound.protection.outlook.com [52.101.53.55])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4hn1b28e2c-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJ0xEKv/ppFA0ZSFzsC7e7cm04iDQ8ET6CQyKHw2vG7L57ChYY2VkTwVI7A9pMyXT367WfMiVtC043i5KB/bjikdYThR9ybB6w1Wrb5oQMKjfwYXz/ivoosRhAZ6qWGeVQfpHsB9wUv7VZfNolzXRIm991OghGBxliFfTJgr4DPTgqxho8xJy/kvGixukTjOOFM/qvm39eHpAd5+cFbGXjoQ2/cTb9lzKCLkKf7O98wIyNpfEltuKJJb/hEUSQAQPxgERhORuWfiAI5LkUj9O8Iq/lkzAOX853h0ASC8TNxVbrQBNXNLZHevnKqKeqSpqJi1k6XMyj522hr5kr/Y+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xsO1ePOkCrNkkOaqwRvEqxvgwV/zK+CqOjC902ZMeWU=;
 b=HL6hclJUGwrj/MsD+8Ri3STm8+COXZYBD4xIf1G36bGikFl10nzEa2I/CW2bQoT1Oh4P2Uy9gQhEJCU5FoYEjTDBaMLuK/U8l3SFmdaJN2ZnTSumxxvnGLO/BGtVXHZ29WbU4eXY9yk6MCDe7FH6TBCLtk62XbMqR31mV4Td3HHFRnnvYigZfGo5X5tjoAIU+ytWQV0OzQtJAEjxxNksuLrz5bD1pFpaROd6F+gbhjfP8CEA191eEwI92kDwirL/RXHfD56qi79UQaJ0YfCfkgDCo5Bdtj2GSJW6kZfsOj+o1/sMao0KRVY8HP7cdIIMkSUrYwYncV2pl2VWDZU2sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xsO1ePOkCrNkkOaqwRvEqxvgwV/zK+CqOjC902ZMeWU=;
 b=VW0yjHTzpy8wv4ora4gScTGH1/P9dCncRhif6RPNhTWbAbQkfuhbzKusL5Jryw0Nm14NM7he0kVEGq9L1oZCtV2eAB8n9a9qwXSbaH2ZcpjW+MJ22wU5XqUniMV/KHINqeHUedar2S9vmp1a00QhRDyefsYeWUdyq6s7H6lyytE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by IA0PR10MB6866.namprd10.prod.outlook.com with HTTP via P2P; Fri, 30 Oct
 2026 19:38:24 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 19:38:24 +0000
Date: Fri, 30 Oct 2026 19:36:49 +0000
Message-ID: <c0532405682a4907cacc1737efd195a5@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 12/20] libdtrace: index module address ranges across the
 handle
Content-Type: text/plain
X-ClientProxiedBy: PH7PR13CA0010.namprd13.prod.outlook.com
 (2603:10b6:510:174::20) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|IA0PR10MB6866:EE_
X-MS-PublicTrafficType: Email
client-request-id: 2bdde761-2aac-4b5c-b5ce-a7908a3d27c6
request-id: 6853b7d3-1632-418f-35fa-08df36bd5cb1
X-MS-Office365-Filtering-Correlation-Id: 6853b7d3-1632-418f-35fa-08df36bd5cb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|261026140227099003|56012099006|261009223027099003|261028144727099003|10067099003|6133799003|261026121527099003|261021123027099003|261021121427099003|5023799004|18002099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	IUqarNHsv/WQOwOtT+8ht1NTzqmPu5IA9xOae+0NfbosoNz65um4o8h5DcP/O1Diyd+WeDPcTRaIIhYPfBsKLAH1At9UJLeH4xpAofn14Qo8IPbSel1aBJn6vfQLoNqvGgNIQ1krN87bd4ul/B1NbEKTADPOtrXSmLUvJunGbhoFcecGcyY1/eZ4L2KkhXNA8a3gb52MGQ821y986vzTLr2Ysm4lBSWfctxGIlkwNuOmYBwxqVYsdAiJ8jipc+8qegbis4Aiu5/5rpC+2d7uRthjWT/ugzcELLDTfO/37IWmIPP6vb4oay5TPkANZuCri5t1qfy+QPN4ghg+MwesftlZSP+FqsCs0WqUQAD1pzTzNplzWewCaUiKAtNF98HsLVI2dGBayuZdmUueD2ifSnny1kx280hKX56FrPW2mxPCERHo1RyrUtiHGC5BsUyNLwUDljQ+KNJvcY1gyR/Zjs8KBvWEqkyZgAkuPMsg8MtY/YXhXX4seEdeRLwsSc4waWXBguLw+w2fRHC4tGphVdxmdc10T60Zi6w2HDF3PI6UlXvr2SkK33Plizhe9lrn1eqlpVNb5NF7RnBH5qaOScfhItQQvyNLaZzdtFj9ZVldkAwR6dYlRv8QwoXuMeaH6LY89IYx8jGiLCYJHtB1qmqu17TMN+Pb/ItLOL6LIGk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(261026140227099003)(56012099006)(261009223027099003)(261028144727099003)(10067099003)(6133799003)(261026121527099003)(261021123027099003)(261021121427099003)(5023799004)(18002099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZUPEj2DYymQ0sng7cA+uDlFJZOjRmaPHvyCMDoEEW8WHU2sXhS6iA46IRG4D?=
 =?us-ascii?Q?nFlPpl9mkmtOUbEMcb+hzguGRfnaZW/SnqJDFxigecTLYo/k5q9fhU2f0+Vc?=
 =?us-ascii?Q?2Uaqw/+DYfkNl5bvFzh8N+bfezbQvSu6AHXCtnm5JiuYHoWwRcPPcTT7fJ8V?=
 =?us-ascii?Q?YX5hymOw+XgtZawhHAVdfpK9RB9IqfT1V6pRjC/335FHlOsVPAgBPR44CPCY?=
 =?us-ascii?Q?RdBorrjKgmCNAEkxlnSyPPrdwZsJCktvsewTv0v5YcXGst3PpwwfF4vXSyg6?=
 =?us-ascii?Q?stc7vUOZxUYfiXPIg6uIxpdAVq3+ddb/zP2J5YGqbrIJKPQJwyru9nr8PRjD?=
 =?us-ascii?Q?VAeBKD4o516/pkkulLyGX1V8VkCW2ZsFqy/W8rA/nFj9nM14GZ++Gkxt69Ti?=
 =?us-ascii?Q?FMVpeYOZdI5VWJh5Hb3jImngmBWVnCutEJSQbvBYgrG3F9YUBXIIXhipRRT/?=
 =?us-ascii?Q?/lYZJHzZsbF+3bef48PPo8jKvW/F3KyN3b0qQuPsEVCr6IC6GNTfAnTqoHU4?=
 =?us-ascii?Q?HbCV9KbO5tiZTmZSMHc/Q6zu1qFahOQ+td3BwuWzurkgexO4ANh5PbBECcMw?=
 =?us-ascii?Q?FubMPlnT53MmXhSWsLjf2IHEZv9OpIWjojuKxAshvkeX1c+LyOPKe4izYksE?=
 =?us-ascii?Q?Y/ouTzP0BZkVMbDOJUFoBhx7BXYcS+6/C26CbSkIPUNTZI21M+Q+IQI5r8zF?=
 =?us-ascii?Q?au27z/zRcAfxFC5Byo+xS24J3oQdwMYi4gAewi00dxgUeJ3T5fWb8T+2ypIr?=
 =?us-ascii?Q?EkgwGzVf2au9SOXAlw+yOPLcE2VSzuC/DAFjnqy8ex2VQe1qgVGf7KU3hamY?=
 =?us-ascii?Q?5UFggKF+7vheZIRDtW5GKu3oyAnSOqsrpEa4Jtnl/EcXcdWkIloe9NUuY6aK?=
 =?us-ascii?Q?TKdf9WHErznY1z+KWHPpYerRm4Z0Mex1blNVrWrWBKrdKjyPeTJQZfNStPLg?=
 =?us-ascii?Q?sw4jSNgWPL7vPn8yi9yhsH1QsR0et0NBz39xltYdMTN5+xPIFvc4Xz5X/slf?=
 =?us-ascii?Q?FzEeGU8EPfVFdMTHf685vWBm17UwrWso8Uwu5J2qd6pGaGEA6eAAEC4NbEV1?=
 =?us-ascii?Q?F7TPtzq/dqNBvctgH5aHy3ztVFBkzUZFsc51LXAVc+DZVnMdWO0iX9FpH+0y?=
 =?us-ascii?Q?GVInVUigE8AOQlCjCsQ/+SVqZh+l4wvJBU6ERYJuPvU/cC9Nbe3PGpK+IgO+?=
 =?us-ascii?Q?Ptawa+JRnOicg5n6SUyY6wteOZd0xfsSa+6BoVwmcvWLmm4nanjpWJDQXca1?=
 =?us-ascii?Q?Xu+9h0C2tLWyzdALglawruTgTCEmHpTOrYjbiwaL6w+bjxcpvD1H85qUTtZQ?=
 =?us-ascii?Q?XIiQQdnzW8BsX92IYW0k+iI/JH8vtrRS+0lyau9nyoUt9Dk701yWj+TaXWyW?=
 =?us-ascii?Q?cGqZAJAWfbmbzPs2mukyzA47xOUdeQ9u+fG6Q/RIFaE1uh0bu9sPnRuIU8Fb?=
 =?us-ascii?Q?Fil+AVg6VAKSu2RfGA/DjEq6b/yPTFgjup5psRxSPHh9Q6mBX8Q9dxVyX7aO?=
 =?us-ascii?Q?PZaZCcgPO5N6wLq6RC5moVkeGNhHBikxn+vubZnz08rgAucU7GXd/PkAXXqc?=
 =?us-ascii?Q?933mbv7tQ6WRE0EmJfSN3cpX4rGK5qbzRXfOm/velpRe/1/S3SWpQjtmXH3L?=
 =?us-ascii?Q?dYtSFnmOHx8uH5GS29b3v/v0aGErlSAvoajSoIWMzxattreCQNuoHM36RXEU?=
 =?us-ascii?Q?OphsoHhKOi+/do3RAQE2dnfE+kOTbBc1iY7VJhoT9HH2hAY8k5RHCdtUFuLl?=
 =?us-ascii?Q?8vcuiONbg2MptM+sximDsTe1otFzFvg=3D?=
X-Exchange-RoutingPolicyChecked:
	214rND32UyfjdxHctcZtIQT+ICE/k+Q0Bk1vvnivz9NQUIHbnJDvDdOXd2T1NMuOeR/c0a7LCpfvFqWlVrWPQfWMjTpuv0k29xQHDJrDSJrW06FS4lO9T7FUoRmJxlm7tvRvVKNVgpItC3MKu1TwNCCvxj4hJ5zHA3/cAy73PPlbE7JubmTHoM4v/b3u+4LpNeEIH/CFMQwyVbya9XPVEVySHd2pTJtUiF357NL2brci3ufTqr+SgyQILqHJ94JXpYH5W43nXzAQYE428TLswpH07uTO3ViOJJAVl1ZIXeRvKNq/9zMQpqxF07t81KTDfhy3stY+O+qGnIBIeq/wDw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1R+jdFZahcRdnZC1xhIyjXZUXl5GIONaUACuCOuL26wwrZudrH4jnK1F0ekbK8faatGIj9GAYOfjgG5KZJDHRqpUlaxJdp8PG1WSjWhuM9POL/919Nu4ZJYwsiiLb4RTVCMoqvfoLJmp3CNkEd0p4hrjQENaRUhF1pn+fWiauZImTIT1quUyP0/Kef+eDiXmNfHkEHpxTNLxOpeaue9/iRyB2lsm+BM/aulVXTRaQ4YR1Z94xF9nqOMnqgIjVh3+NwOtVhEgyr+rgG5Z2sRaaiPVyfk7tAJ/pHKZjxryZG+aoxiC+895jjj6K1U5IcfrAsUOiLcjF1MAgz4VpN0yfefPv2DTuObyBpshnENWUpxFFulxoOtvpvNyaOdFgaY1fkfwTDdV0Kx8/aYnAgKKlY3dV5geIAkrY2wdFUpx7KutH2YCOsTsy4a05r1AErHoDoaDmwg5YbHaNgOlKH9Q/mtSFshwzZ0VobEBUiqVkiGr90xdes1aOuE9y2KhaaIFLe55C+HL+TOAXbJ2B/L/ThlIOT+NzT9itS0TXCB11wTQpOlYgSa0X+B+SYFQtZXxFn6zg+bGGL8n0c91bJDNM7SWV8S+eTAhN+aYFvfopRk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6853b7d3-1632-418f-35fa-08df36bd5cb1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 19:38:24.2595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w5x9E+cIpcThN6d1jNzglHQ1dzIgVtHCO/DngQmiaKc1n50sl3s1U9YuiE3T0b9B57QN+a0wxK+30jtef4739tWx6BBZYB71hAoLZ43Ip9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6866
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300078
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX0SY6mYKh3P61
 iCT0i+5N9+BcGDNqiy0Svt+CzejpOQerpiLofNx3IF5NfEFyuaXkbbBAWL9nrFL8UMQysCM9lJK
 8m/shMCFUrSuF9rnCijsmvlW8VzY5C1UMc4ukfI0Rrvm3/JDyZOVzi/UXdW/MPMux4wFcmyDwP7
 CvXsdEM20m874tlCPpxR91kj+V3zPtBKjD3wtPE59c2xGn8/C4qY0i11HrhjYOObEA/A4F7mAMy
 4dF/zgdphk78jEtSShRVeiP+fdfykFAgDePKuAZfg7MyCLcS/E7wemfkYZBk/q18WekvFpqXl2a
 sBmbRg+vbgQspCR1MryiN1+HYBd1NjjJYlCw/zoAM76dTP7EibSCIXqO12VvFSgl2Z7QucuIEsi
 UKJn/OqyHDj8JlCVGLERDRMgl3oOtPzq6bnvBHtofnFe/+PhGzg8Z/v+9IvStfJ0FDY8F7+Ocq+
 TvzwSUJAN/eqUkFr6XQ==
X-Authority-Analysis: v=2.4 cv=SI/Xx+vH c=1 sm=1 tr=0 ts=6ae4f233 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=RD47p0oAkeU5bO7t-o6f:22 a=CoyY5z_ccLHa0Z-EbpoA:9
X-Proofpoint-GUID: MxVxMqFr2psiRfAYlWSeB2EOt5t-RBjN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfXxR0t4dS8T+0k
 SgO4kGUZvd4ukCimcnEf1gKdGkXau5N/T1o5emVXerR3dnSZ5X7TvrZD/0/i7Obvd4wWT03fIdU
 pXAJwM9t9e4CL10LwvsEFpkYVQsbA2T3iEoZOQhMsDFj49Lk7k0K
X-Proofpoint-ORIG-GUID: MxVxMqFr2psiRfAYlWSeB2EOt5t-RBjN

Build a sorted address-range index lazily and use prefix maxima to bound
searches across overlapping ranges. Retain module-list order when more
than one module covers an address. Fall back to the existing search if
index allocation fails.

Invalidate the index when symbols are added, a module is removed, or the
module list is reordered. Updates that discover nothing retain the index.

Expand discovery coverage for indexed text/data lookup, range boundaries,
gaps, overlaps, additive discovery, geometric range growth, and malformed
symbol input.
---
 libdtrace/dt_impl.h              |  10 +++
 libdtrace/dt_module.c            | 143 +++++++++++++++++++++++++++----
 libdtrace/dt_open.c              |   1 +
 test/triggers/module-discovery.c |  78 +++++++++++++++++
 4 files changed, 216 insertions(+), 16 deletions(-)

diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 5487bfcf..c83fedb2 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -188,6 +188,13 @@ typedef struct dt_module {
 	uint_t dm_aslen;	/* number of entries in dm_asmap */
 } dt_module_t;
 
+/* Handle-wide address index.  order preserves module-list precedence. */
+typedef struct dt_module_range {
+	GElf_Addr start, last, max_last;
+	dt_module_t *module;
+	size_t order;
+} dt_module_range_t;
+
 /*
  * The path to an actual kernel module residing on the disk.  Used only for
  * initialization of the corresponding dt_module, since modprobe -l is
@@ -308,6 +315,9 @@ struct dtrace_hdl {
 	uint64_t dt_maxframes;	/* system limit on stack traces */
 	dt_tstring_t *dt_tstrings; /* temporary string slots */
 	dt_list_t dt_modlist;	/* linked list of dt_module_t's */
+	dt_module_range_t *dt_modranges; /* sorted module address ranges */
+	size_t dt_modranges_count;
+	int dt_modranges_valid;
 	dt_htab_t *dt_mods;	/* hash table of dt_module_t's */
 	dt_htab_t *dt_kernsyms; /* htab of kernel symbol names */
 	int dt_ctfa_missing;	/* cached ENOENT/ENOTDIR for the archive */
diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
index f381bdcd..9d93b9d8 100644
--- a/libdtrace/dt_module.c
+++ b/libdtrace/dt_module.c
@@ -239,9 +239,19 @@ dt_module_cmp(const dt_module_t *p, const dt_module_t *q)
 
 DEFINE_HE_STD_LINK_FUNCS(dt_module, dt_module_t, dm_he)
 
+static void
+dt_module_ranges_invalidate(dtrace_hdl_t *dtp)
+{
+	free(dtp->dt_modranges);
+	dtp->dt_modranges = NULL;
+	dtp->dt_modranges_count = 0;
+	dtp->dt_modranges_valid = 0;
+}
+
 static void *
 dt_module_del_mod(dt_module_t *head, dt_module_t *dmp)
 {
+	dt_module_ranges_invalidate(dmp->dm_dtp);
 	head = dt_module_del(head, dmp);
 	dt_list_delete(&dmp->dm_dtp->dt_modlist, dmp);
 
@@ -1724,6 +1734,9 @@ dt_modsym_addsym(dtrace_hdl_t *dtp, dt_module_t *dmp, dt_kallsym_t *sym,
 	dtrace_addr_range_t	*range = NULL;
 	int			skip = 0;
 
+	if (dtp->dt_modranges_valid)
+		dt_module_ranges_invalidate(dtp);
+
 	/*
 	 * Add the symbol to the module's kernel symbol table.
 	 *
@@ -2171,6 +2184,7 @@ dt_module_shuffle_to_start(dtrace_hdl_t *dtp, const char *name)
 
 	dt_list_delete(&dtp->dt_modlist, dmp);
 	dt_list_prepend(&dtp->dt_modlist, dmp);
+	dt_module_ranges_invalidate(dtp);
 }
 
 static dt_module_t *
@@ -2338,6 +2352,118 @@ dtrace_lookup_by_name(dtrace_hdl_t *dtp, const char *object, const char *name,
 	return dt_set_errno(dtp, EDT_NOSYM);
 }
 
+static int
+dt_module_range_cmp(const void *a, const void *b)
+{
+	const dt_module_range_t *p = a, *q = b;
+
+	return p->start < q->start ? -1 : p->start > q->start;
+}
+
+/* Build lazily: handles that never symbolize addresses need no index. */
+static int
+dt_module_ranges_build(dtrace_hdl_t *dtp)
+{
+	dt_module_t *dmp;
+	dt_module_range_t *index;
+	size_t total = 0, n = 0, order = 0, i;
+	GElf_Addr max_last = 0;
+
+	for (dmp = dt_list_next(&dtp->dt_modlist); dmp;
+	     dmp = dt_list_next(dmp)) {
+		if (dmp->dm_text_addrs_size > SIZE_MAX - total)
+			return -1;
+		total += dmp->dm_text_addrs_size;
+		if (dmp->dm_data_addrs_size > SIZE_MAX - total)
+			return -1;
+		total += dmp->dm_data_addrs_size;
+	}
+	if (total > SIZE_MAX / sizeof(*index))
+		return -1;
+	index = total ? malloc(total * sizeof(*index)) : NULL;
+	if (total && index == NULL)
+		return -1;
+
+	for (dmp = dt_list_next(&dtp->dt_modlist); dmp;
+	     dmp = dt_list_next(dmp), order++) {
+		int text;
+
+		for (text = 0; text < 2; text++) {
+			dtrace_addr_range_t *ranges = text ? dmp->dm_text_addrs :
+							   dmp->dm_data_addrs;
+			size_t size = text ? dmp->dm_text_addrs_size :
+					    dmp->dm_data_addrs_size;
+
+			for (i = 0; i < size; i++) {
+				GElf_Addr start = ranges[i].dar_va;
+				GElf_Addr len = ranges[i].dar_size;
+
+				if (len == 0)
+					continue;
+				index[n].start = start;
+				index[n].last = len - 1 > UINT64_MAX - start ?
+						UINT64_MAX : start + len - 1;
+				index[n].module = dmp;
+				index[n++].order = order;
+			}
+		}
+	}
+	if (n)
+		qsort(index, n, sizeof(*index), dt_module_range_cmp);
+	for (i = 0; i < n; i++) {
+		if (index[i].last > max_last)
+			max_last = index[i].last;
+		index[i].max_last = max_last;
+	}
+	dtp->dt_modranges = index;
+	dtp->dt_modranges_count = n;
+	dtp->dt_modranges_valid = 1;
+	return 0;
+}
+
+static dt_module_t *
+dt_module_by_addr(dtrace_hdl_t *dtp, GElf_Addr addr)
+{
+	dt_module_range_t *index;
+	dt_module_t *dmp = NULL;
+	size_t lo = 0, hi, best = SIZE_MAX;
+
+	if (!dtp->dt_modranges_valid && dt_module_ranges_build(dtp) != 0) {
+		/* An optional index must not make a lookup fail under memory pressure. */
+		for (dmp = dt_list_next(&dtp->dt_modlist); dmp;
+		     dmp = dt_list_next(dmp)) {
+			if (bsearch(&addr, dmp->dm_text_addrs, dmp->dm_text_addrs_size,
+				    sizeof(dtrace_addr_range_t), dtrace_addr_range_cmp) ||
+			    bsearch(&addr, dmp->dm_data_addrs, dmp->dm_data_addrs_size,
+				    sizeof(dtrace_addr_range_t), dtrace_addr_range_cmp))
+				return dmp;
+		}
+		return NULL;
+	}
+	index = dtp->dt_modranges;
+	hi = dtp->dt_modranges_count;
+	while (lo < hi) {
+		size_t mid = lo + (hi - lo) / 2;
+
+		if (index[mid].start <= addr)
+			lo = mid + 1;
+		else
+			hi = mid;
+	}
+	/* Prefix maxima bound the backwards search, including overlapping ranges. */
+	while (lo && index[lo - 1].max_last >= addr) {
+		dt_module_range_t *r = &index[--lo];
+
+		if (r->last >= addr && r->order < best) {
+			dmp = r->module;
+			best = r->order;
+			if (best == 0)
+				break;
+		}
+	}
+	return dmp;
+}
+
 /*
  * Exported interface to look up a symbol by address.  We return the (possibly
  * partial) GElf_Sym and complete symbol information for the matching symbol.
@@ -2358,22 +2484,7 @@ dtrace_lookup_by_addr(dtrace_hdl_t *dtp, GElf_Addr addr,
 	if (v != NULL)
 		return v->dtv_lookup_by_addr(dtp->dt_varg, addr, symp, sip);
 
-	for (dmp = dt_list_next(&dtp->dt_modlist); dmp != NULL;
-	    dmp = dt_list_next(dmp)) {
-		void *i;
-
-		i = bsearch(&addr, dmp->dm_text_addrs, dmp->dm_text_addrs_size,
-		    sizeof(struct dtrace_addr_range), dtrace_addr_range_cmp);
-
-		if (i)
-			break;
-
-		i = bsearch(&addr, dmp->dm_data_addrs, dmp->dm_data_addrs_size,
-		    sizeof(struct dtrace_addr_range), dtrace_addr_range_cmp);
-
-		if (i)
-			break;
-	}
+	dmp = dt_module_by_addr(dtp, addr);
 
 	if (dmp == NULL) {
 		dt_dprintf("No module corresponds to %lx\n", addr);
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 8291b87d..fbc97ccc 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -1312,6 +1312,7 @@ dtrace_close(dtrace_hdl_t *dtp)
 	dt_htab_destroy(dtp->dt_kernsyms);
 	dtp->dt_kernsyms = NULL;
 	dt_htab_destroy(dtp->dt_mods);
+	free(dtp->dt_modranges);
 	dt_htab_destroy(dtp->dt_kernpaths);
 	dt_htab_destroy(dtp->dt_btf_ids);
 
diff --git a/test/triggers/module-discovery.c b/test/triggers/module-discovery.c
index d05d2bab..ee9604b7 100644
--- a/test/triggers/module-discovery.c
+++ b/test/triggers/module-discovery.c
@@ -97,6 +97,7 @@ check_discovery(int fallback)
 	dtrace_addr_range_t *ranges, *kernel_ranges;
 	ctf_file_t *types;
 	GElf_Sym elf;
+	dtrace_syminfo_t si;
 	int err, i;
 
 	CHECK((dtp = dtrace_open(DTRACE_VERSION, DTRACE_O_LP64, &err)) != NULL);
@@ -144,6 +145,12 @@ check_discovery(int fallback)
 	CHECK(ranges->dar_va == 0x1000);
 	CHECK(ranges->dar_size == (fallback ? 0x11 : 0x20));
 	CHECK(dt_symbol_by_addr(first_syms, 0x1000) == sym);
+	first->dm_flags |= DT_DM_LOADED;
+	CHECK(dtrace_lookup_by_addr(dtp, 0x1000, &elf, &si) == 0);
+	CHECK(strcmp(si.object, first->dm_name) == 0);
+	CHECK(dtrace_lookup_by_addr(dtp, 0x1010, &elf, &si) == 0);
+	CHECK(dtrace_lookup_by_addr(dtp, fallback ? 0x1011 : 0x1020,
+				    &elf, &si) == -1);
 
 	/* Keep the old module while discovering another, including a duplicate name. */
 	btf_generation = 200;
@@ -152,15 +159,36 @@ check_discovery(int fallback)
 	    "1000 T discovery_symbol [discovery_first]\n"
 	    "1010 T discovery_tail [discovery_first]\n"
 	    "2000 T discovery_symbol [discovery_second]\n"
+	    "1008 T overlapping_symbol [discovery_overlap]\n"
 	    "3000 T discovery_live [discovery_offline]\n" :
 	    "100 1 T _end\n"
 	    "1000 10 T discovery_symbol [discovery_first]\n"
 	    "1010 10 T discovery_tail [discovery_first]\n"
 	    "2000 10 T discovery_symbol [discovery_second]\n"
+	    "1008 1 T overlapping_symbol [discovery_overlap]\n"
 	    "3000 10 T discovery_live [discovery_offline]\n";
 	CHECK(dtrace_update(dtp) == 0);
 	CHECK((second = dt_module_lookup_by_name(dtp, "discovery_second")) != NULL);
 	CHECK(first->dm_btf_id == 101 && second->dm_btf_id == 202);
+	second->dm_flags |= DT_DM_LOADED;
+	CHECK(dtrace_lookup_by_addr(dtp, 0x2000, &elf, &si) == 0);
+	CHECK(strcmp(si.object, second->dm_name) == 0);
+	{
+		dt_module_t *a = dt_module_lookup_by_name(dtp, "discovery_multi_a");
+		dt_module_t *b = dt_module_lookup_by_name(dtp, "discovery_multi_b");
+
+		a->dm_flags |= DT_DM_LOADED;
+		b->dm_flags |= DT_DM_LOADED;
+		dt_module_t *overlap = dt_module_lookup_by_name(dtp, "discovery_overlap");
+
+		CHECK(overlap != NULL);
+		overlap->dm_flags |= DT_DM_LOADED;
+		CHECK(dtrace_lookup_by_addr(dtp, 0x1008, &elf, &si) == 0);
+		CHECK(strcmp(si.object, first->dm_name) == 0);
+		/* Equal ranges retain the first module's precedence. */
+		CHECK(dtrace_lookup_by_addr(dtp, 0x4000, &elf, &si) == 0);
+		CHECK(strcmp(si.object, a->dm_name) == 0);
+	}
 	CHECK(dt_module_symbol_by_name(dtp, second, "discovery_symbol") != NULL);
 	CHECK(dt_module_symbol_by_name(dtp, offline, "discovery_live") != NULL);
 	CHECK(!(offline->dm_flags & DT_DM_KERN_UNLOADED));
@@ -192,6 +220,8 @@ check_discovery(int fallback)
 		CHECK(kernel->dm_kernsyms == kernel_syms);
 		CHECK(kernel->dm_text_addrs == kernel_ranges);
 		CHECK(first->dm_kernsyms == first_syms);
+		CHECK(dtrace_lookup_by_addr(dtp, 0x1000, &elf, &si) == 0);
+		CHECK(strcmp(si.object, first->dm_name) == 0);
 		CHECK(first->dm_btf_id == 101 && second->dm_btf_id == 202);
 		CHECK(first->dm_text_addrs == ranges);
 		CHECK(first->dm_text_addrs_size == 1);
@@ -205,6 +235,54 @@ check_discovery(int fallback)
 		CHECK(offline->dm_ctfp == types);
 	}
 
+	/* Alternating built-in text/data fragments cross both initial capacities. */
+	{
+		char snapshot[2048];
+		size_t used = 0;
+		dt_module_t *fragmented;
+
+		for (i = 0; i < 12; i++)
+			used += snprintf(snapshot + used, sizeof(snapshot) - used,
+				fallback ? "%x %c fragment_%d [discovery_fragmented]\n" :
+					   "%x 1 %c fragment_%d [discovery_fragmented]\n",
+				0x8000 + i * 0x10, i % 2 ? 'D' : 'T', i);
+		symbols = snapshot;
+		CHECK(dtrace_update(dtp) == 0);
+		fragmented = dt_module_lookup_by_name(dtp, "discovery_fragmented");
+		CHECK(fragmented != NULL);
+		CHECK(fragmented->dm_text_addrs_size == 6);
+		CHECK(fragmented->dm_data_addrs_size == 6);
+		fragmented->dm_flags |= DT_DM_LOADED;
+		for (i = 0; i < 12; i++) {
+			CHECK(dtrace_lookup_by_addr(dtp, 0x8000 + i * 0x10, &elf, &si) == 0);
+			CHECK(strcmp(si.object, fragmented->dm_name) == 0);
+			CHECK(dtrace_lookup_by_addr(dtp, 0x8001 + i * 0x10, &elf, &si) == -1);
+		}
+	}
+	{
+		char malformed[8192], longname[PATH_MAX + 1];
+		const char *rows[] = {
+			"10000000000000000 T bad [discovery_rejected]\n",
+			"1000 T bad [discovery_rejected\n",
+			"1000 ",
+			"1000 T ",
+			NULL
+		};
+
+		for (i = 0; rows[i]; i++) {
+			symbols = rows[i];
+			CHECK(dtrace_update(dtp) == 0);
+			CHECK(dt_module_lookup_by_name(dtp, "discovery_rejected") == NULL);
+		}
+		memset(longname, 'x', sizeof(longname) - 1);
+		longname[sizeof(longname) - 1] = '\0';
+		snprintf(malformed, sizeof(malformed), fallback ?
+			 "1000 T %s [discovery_rejected]\n" :
+			 "1000 1 T %s [discovery_rejected]\n", longname);
+		symbols = malformed;
+		CHECK(dtrace_update(dtp) == 0);
+		CHECK(dt_module_lookup_by_name(dtp, "discovery_rejected") == NULL);
+	}
 	symbols = NULL;
 	dtrace_close(dtp);
 	return 0;
-- 
2.52.0

