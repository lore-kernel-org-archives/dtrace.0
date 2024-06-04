Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5DA149DE2
	for <dtrace@lists.linux.dev>; Tue,  4 Jun 2024 18:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717525305; cv=fail; b=Uvzuj++0JItBK40f8Esg/fSrWWnFtf1ViNtwrX+FaXxpWqCsLIiI1IFKPUFPjh0oTxnXAJ0V2/XGC3rkx6VWC+yRqI+UHPAOnSegvV08meYN+CjQGVDG828l0nJp8zZArG3z3179MmJZI2/tscZ+0v4cBRCuIyvBULVbWIT6n/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717525305; c=relaxed/simple;
	bh=mukISFHHIaYiPoM/unK++tujA5pJc5+yaBH7B2JUVXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PpeRCOoscaaknTa376kn4kwP7nky8DZgWhVWqx2TZb5Lk8S1me7hdZLLdaDDl3/TdiWXRfY9KXl20iySPu1FH5c/YgqIiP7wi6t/eVRpDbxLU/dx2mhIgbr84ZQBXo8eevxTkuTsfsbqGnp+obyrYk5/Qt+vRkwfXl+/B4Kze6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454BnaZe024276
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:21:41 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcc:content-type:date:from:in-reply-to:message-id:mime-versio?=
 =?UTF-8?Q?n:references:subject:to;_s=3Dcorp-2023-11-20;_bh=3DzhgcssSp9WJ+?=
 =?UTF-8?Q?+D0RhEPFXjSV2366tAHDE0r6BD6vwvI=3D;_b=3DfN1ejd6q5wznlbcmZZVQqu9?=
 =?UTF-8?Q?uQpdpLD8b/gHMIJGRew77msdfgL84mUZwkhg8Oyc3CLRL_E1ZCsG7G+jtx+Gukr?=
 =?UTF-8?Q?s44W5iso1EhHJcgL+21K75LOM1jT182U4dAAD5NYgTaXLSJdDFY_An5Kqwpv6yj?=
 =?UTF-8?Q?MErqkyV3rAbX31DnbdKxTDXnBAaMrGLH0rYQC6Y+c5Ux7vlN9CF0Iwi19_Itr+k?=
 =?UTF-8?Q?BevcftCsfF4GvKp41HKnDLZGKCBCDCem/OubuZ2uH7mcnTp0rn3nj2E5cN7EIQG?=
 =?UTF-8?Q?_GYE9G+QRTh8v9O9kqypBdYEtCsvy3SNqv4RGuS3ueBenJ94IhZNLpRm9Vfp3Yd?=
 =?UTF-8?Q?rch8Jh_gA=3D=3D_?=
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yfv3nwmbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:21:41 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 454HeSk7023923
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:21:39 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrqx7nep-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:21:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QaAbGbiwVNgQ/tJYamr+f768ZxAns8x77IOMyjQ3uaKmwaVeNGxDn8lyYkOmzdsFin7eXPbaLbqKHGRQXdRhRrPIGcEgIHPmj5sBw1QFsHyWffTQJRd2FXwFHmGI7uscUMFLnkCRkJr24xSqFZCcm8selwmWNj10r0EL/7g7qqeAN9RwMiAr078tmiHoyckAvTfU6LBC5G6S9SUmsZevnrzRdjdu8ezNm/HzS/e/pPrKHnWJ8QWO/Qpaoxu7UGw3j0GPU0C0pX3DZf7sptw2FupfaCpXMKdeF/DiSwsUxsncIa96XkXrtjoCEF9pDY6Sp2FQ4WxdgfiCd0CPfgRAtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhgcssSp9WJ++D0RhEPFXjSV2366tAHDE0r6BD6vwvI=;
 b=blEOXpDs9Va8RIoxd4ax0gY4j4DfTLXdhwJzOP2MQqKiu0gSodWO457ttNhlohk8+GlCmQAGVZo2PTd38x8t93ZWAsXYxuJeLPH7if7Tw/DU2dw7qSh18/gqZyXG5eavhLFk1AJCX7E1kySN0dHF6N2NI1JrVJUq0YS9WlQluhdSqhEQ/+EWcLHRS/Fy/vgq0YQZEcl3fMxwzMGWpdlwPOlgL8rhOtmy/j9AS/Afzm7wHOTORb6yGrSEmRL3eDmaUBJqGy+Ytxnxr6u2VIQVXHATkHHq2vfDOaU0i98Dl3WNOPfBJ9zlhFhMYXhpFK6nZAoXs+FuqVRWwQUq87f0LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhgcssSp9WJ++D0RhEPFXjSV2366tAHDE0r6BD6vwvI=;
 b=JUCJzL6E4d1GR99HOGf1ynct6k1i+x0/Xs+v4HKBtY+E36JBDgdE3X3UPXyFxEc5BOooViQgXRHRJUQQnMKHBzhb4WcXmQTA46+PaJqGlwTS4C57a66eUn1K55ifpKb32cO17HUSmGk1DbDGbKEu75tQQfyA9WWmKA2I0RV7KWw=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SA3PR10MB7024.namprd10.prod.outlook.com (2603:10b6:806:318::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Tue, 4 Jun
 2024 18:21:33 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 18:21:33 +0000
Date: Tue, 4 Jun 2024 14:21:31 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 01/14] Move comment closer to the code it
 describes
Message-ID: <Zl9bKw/+JyiFwulT@oracle.com>
References: <20240604181113.11505-1-eugene.loh@oracle.com>
 <20240604181113.11505-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604181113.11505-2-eugene.loh@oracle.com>
X-ClientProxiedBy: BL1PR13CA0424.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::9) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SA3PR10MB7024:EE_
X-MS-Office365-Filtering-Correlation-Id: d94a4636-bfcb-4c7a-6549-08dc84c32997
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UtiWK+8E9dDT3ufn2V2bnOgIH2Zb4cJEwbpPKRR4VTcqpfnBOysizkw4tSp6?=
 =?us-ascii?Q?vLOnSBvNUfsGoRdR+j4tEwOFUH/qUPB3ort3Iu8KZA44NV40hxOCWVKw9whw?=
 =?us-ascii?Q?ZrosH+jnVYTpVZKw133Iwc+1EhdR2vyMyEcWaznaWDuSsCCgXcxRBerrDrZG?=
 =?us-ascii?Q?Sbi8+V+QOOqiMA0w6fvg0HRbdIZyL65K58XURJMkIm0zkqclJgrWg//HOarr?=
 =?us-ascii?Q?2CXK10tUKPFbypAdUHvY6OUifX4hYmZcuhE0gEV6Xyd9H3FiquLY22un5U5/?=
 =?us-ascii?Q?1qgRX/mjhZbOgwuA82D/jxoYJX0z7uUYbHzWvAxRHmudQhgWBcwPpCmzqh8z?=
 =?us-ascii?Q?O0Vf+pEEEzymvhISX1IWj4g6jWAj6v+28N8hYX0cSvRpGZ2AgpUDFdHuwre0?=
 =?us-ascii?Q?qa7m+QZBM9Ph+GU90vkc7ioSHGIE4YqeIUeVg1uKdm8HbTki47oaTi5aobBl?=
 =?us-ascii?Q?gZRe07LPLZ8SJCtTe+sAiq1LN4oD4anVgOygpvbn9QeaWNTyTwrbs1aDsZ3z?=
 =?us-ascii?Q?ujKiEPlBUTJVIU3PEX0eRQoA8tBgjmcxGykH2JyTiIG1QoaOAmiyOx8uzql3?=
 =?us-ascii?Q?GLjasHB1zny+f8aw38CASgngyuCRBhw5rz3VGsLZoJtHOM5lt9D589rGLbsN?=
 =?us-ascii?Q?nsxYNS6iidmyzpEpMYs8PSSYAnBvUxy4j2yGl6hIPXfamlJ+Afsj7T1D2qS1?=
 =?us-ascii?Q?dCimLWvak/Bo5eZmxvL+7CNhVTAjuQMMBwmDOTYrrCvjk14Q5uIXWstrClPd?=
 =?us-ascii?Q?XEZt+E2CGGj7/xmzFW0Lsm3n8N5bCj/a6H3QvuzTz9WZBoAxWOPDvg+dbWdm?=
 =?us-ascii?Q?BFVtYx8DU1fMuUw1oaig0AuPCVPBVL6h9+Lye+NKsNT9xIQm9jFrAHyzyjlk?=
 =?us-ascii?Q?XXsf/LsRek0UjNZIvIJyeAuscEjWy0mXfcBUBb4hPTSVvBniZ2go3MYKwvDu?=
 =?us-ascii?Q?lU/sQ2cMxyalbIozAgEb1+WUt/I57qHSTZZ7fYCCiNIjzO9lbWYNguAJa2O6?=
 =?us-ascii?Q?9p8AyFYqmSDHDGQKk17BeI+DSyKo5LVAIeGEKb2mSN7HthqOk/ogtVwKxJWn?=
 =?us-ascii?Q?dcgbmLg1EW5hL8vqGoybZgkpSPZBOuhGX/6t+RSceaSP00MYuGBjja5HUpBK?=
 =?us-ascii?Q?lr9U/0oATsMF8DKDNd0dJPgJM/96h/lz0dhfdXZwMHoqF2buKXMaKswXq3R2?=
 =?us-ascii?Q?8V3+lLzaWIdWA4bilkE6pe5EldGaa9139i1kTvBsGKbUPnBxBQvZ0+V8j5oU?=
 =?us-ascii?Q?YTjCvmmg0/lmMyMuqqFrEMjR59cWy19TH6bOBbsKpuKbFPooB+lNiylDc3UT?=
 =?us-ascii?Q?XRZGdy/IDqTPah6cVrYqQZ3N?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FB1I783ouQKJqxhPlIjf9aBHpQdagsGCAqa479QnvYt+Tf+MAiRLbQtpc5vP?=
 =?us-ascii?Q?t8fdOscnGV8vNK3LGLKD9RxRWImpk5ndN0uyAzuDYjfIGH7tvcPWXwkC4XCM?=
 =?us-ascii?Q?bLWWW5O88qR3U4/j/Xg3W/7csLr+0eMvjbqCZVFlQenIVjvboCCYpfwRo3Gq?=
 =?us-ascii?Q?lIssllFha4Is2YqNKZ7t56IKb0438RRM/X8u7b9iikHiW+hel+4q/H8/+z0R?=
 =?us-ascii?Q?rXsCLDHWQNAjPiZz9vehkiOGjItRiZ6LIfitKipxYE7ol8Jn8S0h9qu6o2Co?=
 =?us-ascii?Q?U4uC8Ws//OoSE5Iqfb0b09IoFv51PZh0vWHVjF2nhh2VvLYZSGBSd6ULPL6g?=
 =?us-ascii?Q?yFFs6sLdK9eFOHYi9Jb71Vx0G5zEYAjoH+DfuXo2WqsHdlsuVy46w4FHuznq?=
 =?us-ascii?Q?dxwyBRH93tUIKenAXcWj7kUAdF76FgYAcjO73Y+IdAYV6DI/J91iiPqLCBYv?=
 =?us-ascii?Q?RR4n2+QSfBd96ux00036H9MGuLDaJKesRet9FRsEkTWbLeCBGLqtErEuxKFp?=
 =?us-ascii?Q?nHJd/wii2aGt5aM38XZ18HkqeSZoyarwYyb9HAPunJmwYdhhLN8OhHdlkiLF?=
 =?us-ascii?Q?Un3tMV4vZWz0xycFnwXFbfSnXwjHl39PDSLC77ARchKHs8+fLdvhN3E3MIzX?=
 =?us-ascii?Q?DSaO8BYG8FEIhZkYsNsl7WdAGQubbYpG34NLtLJ4h247WnYBskUvGxgtVMVw?=
 =?us-ascii?Q?9GwesVis6zXMu7G9INKDmST2DPWhThbmwRVWT5e7xwlTwtsDvbevlpNa6i7L?=
 =?us-ascii?Q?tttJFxHKftuE8MKEQ0+Dc/9tboeoSkm6a+XIQzZPXtuxRGN0MY71bPJixUb7?=
 =?us-ascii?Q?WX/WfTsI+6/3R2p6JAYndFnSgzjEbr6EUbff8WhVa3lTeB1hwSaPOSwiVFX8?=
 =?us-ascii?Q?WMxnU0J7vta378RsGDNZWfat8Y2cuvC3Cl1qbOVutSbwn9WFJlI6IS2Ini6x?=
 =?us-ascii?Q?sxUBrmfmP4/K6/qmiTdz+S2RBkb3L15gMBghTk3/p1tbH/cpyZwTNM4xm3mg?=
 =?us-ascii?Q?xnsIn4ctb3MCsbTBl+1Mi2jOKJ9OaRj2ISPvzFAS67kkP8pfFGq+rq+KB8VM?=
 =?us-ascii?Q?Kdcjvi2APra6r8WK5OYHC8FsUNdUfVYMTJsssV85wCyzS43Dlr0o3leYo4TQ?=
 =?us-ascii?Q?7LH4szbmPPa0k/vrv8PziRN0ZxSiHLfWDVvJ1QEARBbkfe/aISt/fVVf1R3h?=
 =?us-ascii?Q?LHjYjiNJ5lbWbI/Xm1WFwIPpihyxiaAvOEL2AQRkx5FSz9A2vk0AltfHX3Ri?=
 =?us-ascii?Q?NGPGOzHYZxSwu2y8q32Nv3U/zZbvenz2JIhnattcXPZa1YcmeoYaCl9j3++T?=
 =?us-ascii?Q?WEailnE/mS5n+edRoJszRiQmEA49KePERT/z3dEfO9fKnDuE7fk7HsPCtloS?=
 =?us-ascii?Q?mESW8PNfZ3NhN07EUKULS6FA6Al849v5vGSZXixqpdU/DAsGiBCY/gTkgRZj?=
 =?us-ascii?Q?1m6qPZI3De8ntPl36xRNhNIms+77ZafcvthIeyfz+Ae5gy2z8nan+T61MUVk?=
 =?us-ascii?Q?zp5woj0dkVHpQHNHeFKpF9EXZFQW6/PtLtSLtiwva2Hu4iLvjXItSVqFkTHP?=
 =?us-ascii?Q?za7aSQwSZygPRLlAOFWMxuW40hMpGmzzq9ZMnyFufXz+ZMD+8jO5YmE2MGYT?=
 =?us-ascii?Q?bw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Sf2oB9raxPSqKA395TyI4OpsTftrmkfPWCrkm1s1n+/JUaibltgQN+kpbPO2r5f5WTFVSY9U727YZYBDWCZ7cG0mB5i9JONZewQjeM8ZRsIyYFBNL8mfG/Ph1z5NravHxelm5+Y2G9dzl4gjngIyAOAT8L5PBL0EG/wuqdmD9V+iWZCTSi6NWS4SvoPDkRbQFD+H4wSMOUcO1WScZYRbJvJE7boAtpJuuH5pkcg96FYw5bUa8urraq66FXTVMj5FimRgef1VscG+2ntLKgUPHTZtodbK/x+EbYONTX+v0IL5q6qOBRRK+CwmALvR7MQghZS0T+K+EEhf/eY6W3mSUvsuwZWYZ8kEn7ukWVsoVBMvk+vqi5zh4KziKIAHoP7sK09awAugndZk413PrJrPITa2Ajhuk1UUwi5udQZpgZBwmU6destBx0wmdJ2HIJrx9Sy/EWOb4LBcyom9+GGlg8pTmW3nyNho8T/96qhDpRNAVTXgSy2U28uqTc9vS9EdLNHQFVDusjxxYeVwTryIPqB+layZ3dbs+HbtUpBZ9GsscCpM/SbhEpZA0nESY9CU0vX8d8nmHTbYzH13Oma/pout0HTJGxTY24GAZF8cULs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d94a4636-bfcb-4c7a-6549-08dc84c32997
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 18:21:33.2191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: He/4jey46GGBkE3NS7BOVJdl6CO9EpKUSCcqFqNoiPjnOfClnLJaNwIUmlVGxrEJ8oxVlkH/pzFMok146EC8Z2T0dLR5PJhAykwjU7EitD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7024
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406040147
X-Proofpoint-ORIG-GUID: 8XKbOJ-5VL0nHw9Xn_xN8bONspBegues
X-Proofpoint-GUID: 8XKbOJ-5VL0nHw9Xn_xN8bONspBegues

On Tue, Jun 04, 2024 at 02:11:00PM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_prov_uprobe.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index b712c589..afc1f628 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -337,15 +337,16 @@ static void enable(dtrace_hdl_t *dtp, dt_probe_t *prp, int is_usdt)
>  
>  	/*
>  	 * We need to enable the underlying probes (if not enabled yet).
> -	 *
> -	 * If necessary, we need to enable is-enabled probes too (if they
> -	 * exist).
>  	 */
>  	for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
>  		dt_probe_t *uprp = pup->probe;
>  		dt_probe_enable(dtp, uprp);
>  	}
>  
> +	/*
> +	 * If necessary, we need to enable is-enabled probes too (if they
> +	 * exist).
> +	 */
>  	if (is_usdt) {
>  		dtrace_probedesc_t pd;
>  		dt_probe_t *iep;
> -- 
> 2.18.4
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
