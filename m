Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECEE4E4C34
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 20:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790628883; cv=fail; b=CuKT6LCkiCCoHDaKasN9WB5R3HxnmmvolZ/4trVICsK+41bIjBeuq7G2OuHdwYQhHIMc/cjTtO+0rgIYXKVnO3XBQ/1UfLPOaPNeN/W9sWZMrL3zOigx4DJNSL0zedC+JkOJX5CtUDQn9epzeexmr7cO0pCq69D1DHEtv+N3pFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790628883; c=relaxed/simple;
	bh=PmEwmd4MUdqZH6PCoFLqCHD0zJ0fPjVusM8qi9yisWw=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=csNoKXv7plfA225FKe4sGccL/Y44FkWI/pgjT/nRZk30nZ0jesXIT67yWFC7Nji2YrxLyI1IN6yg9G37ZH50J0n0+wQzB6CSRLDATIVxOaFrE6gYSAUyNl4A51OfpJ+DNMEb8//+PUkMtiNB4ofPVpGRdmpUdgdAR2Bmx/PWpq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bg7vPjj8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MiOZ/MlW; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bg7vPjj8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MiOZ/MlW"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SDj2eR1697533
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 20:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=YDLa+5QRbFDXfBATlMApkhDp7/WNhrmhMW7PkXDfROI=; b=
	bg7vPjj8mKs7TW845YNbSGF2TyDnPzzE6fGNhDrxO01LF8NBcA0MTGRsyVLkNcrB
	/f6KSLdTyzXFybDcbLv/bvGKWo6oeUeL7otBMjI61ykAcPh2xRreRSoqTr8TmAj7
	Fy1mm6pa0QwPWQlhoeKkA7bqkwnJ0B0ENoobe1AQyOFusIFHR6yG7rdcrQ23r+P8
	ZdpuhBOcTabb8ep+Q/v6w/Le62OzlzU5XgZFJrqOdOI0NeYUoL0wNTxruhOakTru
	2taBuXiD57FAXCHTi7ELmsvwXM2HY9PG0B4C9TrCdst0bhJlvLLtHkpKRCA7rrtQ
	zD7r6JeIhfK6lZ3esjtVag==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gx4fbbjxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 20:54:40 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68SKoOoQ008479
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 20:54:39 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012053.outbound.protection.outlook.com [40.93.195.53])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4gx4gpc0ju-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 20:54:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDDuwr1ULX92jCwf4E/KmkJeXPeZLu8WYT18+GclGqsds8/w8S5bfLjMVIOtu1DKjJk7K7nB0v7JDvw3bCEmHc2NBRzk0GoELBZyuTOF9ruUOP87RXIJ7Kc9femFVH1oe5ZyFyFHLCvc0Aioi0iWHU2mGEuycOkGIxdd6oNullWIQUhk8VNbAlk8eOQlKe6Sa4Pki6GDyI+8M4P48L7OupG0lIpx8KnEtxPBEG4jn5CByKenpBt+1bvzhy840RnDElD4tNkS6Zrev+pTvWkYkBJrnfdQdkkkAgLduQ0DW5Cd+NOH3OwaaAfa/GZAhOfjSzH3d6HP4642D6Gejgduxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YDLa+5QRbFDXfBATlMApkhDp7/WNhrmhMW7PkXDfROI=;
 b=wsgHF7C2tYWNTfzApagwTHCLJ5GFAyRInnjDEJDakGOEao05gSDPRBSvfxBE4h8lqZYj5KrRENj9niAv87nR/06N15DpbW5Ol6XX1p1fEm3/WouhDWdT6Mbim9BJoNDpYuejpyNvv8nmJujSe6dmJMT0tEcdPP1VyHAbgQ/Q+QbK5ikGNauZnyQhULwoLcEKA5K0u8g5TSBM/cXYfOVscstbCyY0YuRAPpFBf+VQ7gSXp/xTXN1LaqSVzv8FUgOxFg+80sRYX2sO8MbIPI3aCyH20TJJrPnq2fjVYkiNWBQ7Vyh4W7OntQyR2KwYp4tIdh6K2vfQ5j8BHjYhGwoa0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YDLa+5QRbFDXfBATlMApkhDp7/WNhrmhMW7PkXDfROI=;
 b=MiOZ/MlWKGzrvYHlWlw+cN+c6TJC6NNKWgmYxvIYxXyNmRlXF7reiOHI6Qx5e5/JH5gA6bLQ1kc4CDCXEfvXCkpHZrQQxRLIo1rzWCBr1bbn6PJU9bQYt2HAhZuBOvFlQecfAkz9U2VlbPaW1quBtRlSwOUjY6LZWER+Qje1uDM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by LVTPR10MB997842.namprd10.prod.outlook.com (2603:10b6:408:3c3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Mon, 28 Sep
 2026 20:54:37 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0472.005; Mon, 28 Sep 2026
 20:54:37 +0000
Date: Mon, 28 Sep 2026 20:53:22 +0000
Message-ID: <4c9c500d983e53f187539a7c8314e36d@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/2] test: Fix path to sed
Content-Type: text/plain
X-ClientProxiedBy: CH2PR12CA0020.namprd12.prod.outlook.com
 (2603:10b6:610:57::30) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|LVTPR10MB997842:EE_
X-MS-Office365-Filtering-Correlation-Id: e4b8ece5-2c49-4a4f-0bb5-08df1da2b51d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	68zeZUgeUTm9IPnzRQ4vL72LvGeJtLmydodZGV9dHG1gT7nCWST9FtUGdTu4sEUN8BHVz+FSEpE65yv+q6dg81YsJaOkmjizxufnmiJl3VOvBnpqJteJOfJME9iWkbS50gcfm/dFzlQcMwar98Zjagbp5WLRU6RE+B38+7gdusXMPQh7zrZfkahaxx4mPtFbDkNIv9g2mf4Fn6ss3w+4GWP6mLqnnCHk5n6Fe6XS5u54ltTyXNN29q1dZ1MglYKQb9LKgbiADRRvwncusJL7iqTsHH6m/iBE5kVVduoo7yYmwtvvCg7s56ovvQlUh+87ylcCUECQnCz1RmTWT571fmrP7FnxEdZ9+RDpyRdCaIvzk7OiL+FBl4aEbMd2FcEcN/baY5+QcGD9aWKeDfPusD8n6wxAItviqS27vuTDwbvpTpdlYQPlWfp7il9ukDXDFiLBnWfd3tMVJmR4zzdsX5InvOZHSG3aNYrBbXZhVrZvzUm2aXESz5i52M/xwLHX++KuxSyREe5evEHoMSKs83ZupEbhVqjOLAJxLhX7axPAjFawrxlFW+5e1bsKJxFVK90WW/9NRk9P5l2DZSbsXm17IgqcdhrUT4cNQQXlRplcMwzvINPBk64RMkZtWl9lQD4DwjX8LjEw1b7feK1UR45ic/V645hJy1xoTU/KpIE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qZL8fGEXdP3sH71dMGgFHLKps5k8f0inQkHl6pdsZF5WFcIp4mJKmudcxp2m?=
 =?us-ascii?Q?a2Md7yP/4mqydBsuBm4C36tH7amwx0csaF6WTiq9stcTTI0FniRnA+qTFX8V?=
 =?us-ascii?Q?Pt60ri3qX88ojnTQ+ji1XTtMJqYB9zo1n/JJ86KItbaeM5tyREHH615eDulB?=
 =?us-ascii?Q?4MZFtVL+qjl+P8JoVgMqWAHx+VZG3sOyBFcQYPC2b6JXchc+odujw+WX7TeU?=
 =?us-ascii?Q?xwOuwrRuBXEJurutK+UB57akxsB3KY1DSXaHZzJWx8LY9H7oSpGJAvVeuO6o?=
 =?us-ascii?Q?oFTKMmkiqN+wLMsukFgibvgmMXG+5cSkNwwJKfpDnP77n6H4hgmwVXVY6p3w?=
 =?us-ascii?Q?iDXKw7nsXiZEQeWm+4TRBLQy2cx5PpTlcCYrGz+pWnwmbCT/5E2zZnUo/jxx?=
 =?us-ascii?Q?WGvvLeQQZVYNGPU9K2S+7aWvPTK+hLbOkZxMeZd8lbZn6k2Symox/PdQguJV?=
 =?us-ascii?Q?uiQJh4V3jgV9KvrDmSKrp6wYPF9cm/aB1jRl/nxxrDVlyB6O5OsESuQ5omR+?=
 =?us-ascii?Q?LayaFclTnaXzJ8pRv2DYy4kmKYey0xnIL66OGZIInLbWoV45gIe8o2xrKF5D?=
 =?us-ascii?Q?fvN5JG5LxBDCBnD6bgSJdhPowpQFJr2QH+CRlyoU0IQOcD1WTcxqc7AUV4ti?=
 =?us-ascii?Q?AL9EY7v4WQLauapYi+P8b3DJ8sFPaHuVdNj0IPlTl+HX2Vhyw8uHzaXEFAW8?=
 =?us-ascii?Q?mVnj8yhFqBdtED4jbYvXf7cf17zAN8qzy5Ur1mbHzjhLcDJnXAglRmhfYX5r?=
 =?us-ascii?Q?55xaXe8sD0tKwzioT2HkshxW6Y1QvauRgkUAhJIItM0m5Q5+xu+PEHmFZMXV?=
 =?us-ascii?Q?uX7ZFPmGshXvq/z8ejbXy1pgtLTFTk9ljwUJCfz/Ohh8TFH67SG/zm7xxRt7?=
 =?us-ascii?Q?B4oLogyB6ewO35adPK1OZdGQzSKh/7sLJAwj0svS+xaEstS6jiBNjgkr77jT?=
 =?us-ascii?Q?ZAjLKIP8SLiZsGCc4bugrtXquE+AjVFvFsKkVgGpaVJqtkdL0QGRpi9IQzRe?=
 =?us-ascii?Q?Bw7XaDEJQjq2tZWVG+kyiaPNDog5JFhFbOZGrGi46GLzg5KMLqkWN1ITmy4i?=
 =?us-ascii?Q?lL6fFyoGxXQ44ZgHdsinYjuEbm3LXtLi4uGXpAEugKyUI2kg+TNgpGzUYyyG?=
 =?us-ascii?Q?KZ2Y8h0sN+ypowZFYbpnD5/Tsq/QlPRyOgcrPqihmvbG5wM+B0soOv5KYGW2?=
 =?us-ascii?Q?ugoul+vKCDLs5mU2qvmdSlLNUrNpNkLHZYGLCzs9sosy8+5qTH4JeBycsm37?=
 =?us-ascii?Q?cRE6tnAZ8L4Jj7y9DjEKwTEVeUrGoyPqqS3QTZtsKfr1OTKotH7wL3lgcQkO?=
 =?us-ascii?Q?s9f0SvI4K6fVuZDB0j4uH5Xe4uXzuhmENbWb740+a6mNWYi/11VIWEjFMOKW?=
 =?us-ascii?Q?WiAZDgkqEuZRJZ5gTYrmkMSmQ6GsGb2JV6MAoyVvSA7hhquLIgCiUfhkX0o2?=
 =?us-ascii?Q?al5Td04qrrOMfWWpXI3KPCNqgKYPVCmb1N+dpzLhnvKGngQ4slrm1AnNL5Bq?=
 =?us-ascii?Q?hDaIWCnkHQjoNXlQ8KIDI2u0HBKqerTGiMUQZZlp8sR8gyxwrBx2iEga/7U1?=
 =?us-ascii?Q?8DgNk90pEPhQh4q69Q7hxS8CFSbfiPchXNXl8YNq8fJxgGNHpavI8fhdQ5vT?=
 =?us-ascii?Q?smK2oSBdb+QdFSbDonOBnh4r0HFnKtbT9mOSr0P3JWkZo/Ji2wir9WeiIp7Z?=
 =?us-ascii?Q?DYGrgrbPNuvB5oYnDZEL7lvyNbIIzBCX+dprTGgLD7/Pp4/DT9uZhXa2XSC+?=
 =?us-ascii?Q?4wWncsb6R9hWo+fD33A02AKQiqBABlg=3D?=
X-Exchange-RoutingPolicyChecked:
	vrEsVreq5WodgF7HGdGJUQpK+fDewr5OpO7oHSWlX02C1jd9BWai0Ha7BV8gxoEM/1bHMFDzvv0TZ4du3WnkCj8YVhrWSsaSMmoj8TNXzjPuDV2rTCVZI12ZkHWyEj+YTasozDFf4Ggf6TaOM5o1rDdPOO6qzXOzqhfsFvs+hcdtjm3oloi3k1o7NeLBwvESPDFclrr42oKnkjKmtoWgQsCDrZNViBaxPbHVdylebMXT781T0gspED8fqZO8LN4YjEbxBIQSotjTx6ArgQvtkH78aNr9y9fAsX9/tSZgQW6w1UgCuqF/pohqRmjjiGUfkuc3HD0h9kQFj8srgCob/w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mjgbVcV7kJVjfXR57mPgBB496nZq2Pw5CwtRGQg7Fqwo1liLGimeCxL8Uh1a5IJwpA6I3oKq7YTR2+1J/BgFnOWxtVzGfdsOVC3WovUU/88FcV0CWv78SUH0Mc3EOwn17qP+R2Nr4ZCjEcZllN27xvz8Hkv4dxdcv9PCgQSlg+KHH9+WjB36xWtLIlqVQzUSzB1ypNBiu0NX8pu4mqmg3LLW//HtRsnz8SpokMFzgPNt8cou6KW+/b8sUMd83Y2JeXHejhydOofL/Hye4o9fal3e7t+HAF4n6IzsByj/7HXXW62RQqNOY1KpGygTBKKU94JVYP4g6kzL74GC0FmxVPQtQVm8Q+Shh1x4utu1qvx+glHwBgXPxi5UTthZFe/jKk91Dhy3UDHIcpo4MDj3JK+TPiiEn+jTD0Zh7LZOpaLMhWyg4cxiTFin/Da45cOPWL8/+OkdGHl9KTZLJ/ShX2O9o/SkWQ9pPPPGmESfTHeloZqPuOH5rBdnWe8iOMewY4PbesPMH16qJu0sRhSKIz1bJpuFZOBX/xMFK3gHBeWK796Kltm0F4yIJEMWHEr3rArgclrOGvWt1OOhxeS83wAMJ/8MH1uarSrtD9PnraA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b8ece5-2c49-4a4f-0bb5-08df1da2b51d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 20:54:37.1351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E1+2R0jTGWbXcw40D3O/AY/BDAAJbDe/g037bsuaN71v+jkiIyw3V/N/hhrsX7KletXFJF67Lfk99e5IrohLG3znpsP3q14ws3nhctcwf3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVTPR10MB997842
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0 suspectscore=0
 mlxscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2609280083
X-Proofpoint-ORIG-GUID: A6VoBCPivww6a-4ei4NxdW4tKnBsrlMR
X-Proofpoint-GUID: A6VoBCPivww6a-4ei4NxdW4tKnBsrlMR
X-Authority-Analysis: v=2.4 cv=eJCGH3p1 c=1 sm=1 tr=0 ts=6abad410 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x4eqshVgHu-cdnggieHk:22 a=yPCof4ZbAAAA:8 a=XKiyWx6RS5_WQeUgwu8A:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12106
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA4MyBTYWx0ZWRfX9MHx2I97pkqk
 QrcIvXMtj+5tlFdfY2FFcC1BzCyGspF2TAgvq5bAF5uwWWQGms4AZE2VY9JBY5xXpnClFh5yxHy
 T6V1rp8TtbccXSXjwNdT467DrOaT9sYlFMDuNFTQOTBiAHgFYEff
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA4MyBTYWx0ZWRfX79CPpc/nS5bR
 YhNcWOY60uquNOGQFU3Tx6X+kJ0oagEl50T+0OoqsDxlJ8wdsuIMEYeYD1PJtu/+0+HtoaJiLY5
 EcgTGrEQklgwUTi/vW8Xt5wlEg7GwD/VH/iEsLm84GNZ6WTNBsuJhv5ZIhcctF5pdNfAtXGJi1j
 5GYcURe0PB1Ap484dNewxwPLa8Fjg9JLDjW/cp4P2+iBXLLbbJ4W/kyc1XGqP/L+Px6SxqUpmHr
 YBrTzTdVZVrrzxAJRmwMXkMTus0CRklNJwOsSi7vXZ+iuqlvutC5H2+Pi+fUNxd7ZZDHs1E7U8P
 oZrAffK0+Qm+AqZoHtect4X3t/8bSIDdNFeXgD90lOslf5QY9OvPY0d2WU1WIXdK4755JfyYg+0
 E5+KvI9TqUrrg0dS90YrPe9QRpJIk48/1Xwd70tkVH0jU65/L/plmzeigoK92I6a7yV+b/dzqnO
 W1xf/Eo9055fNatlhxEOJOl/zjpgI1ixvoeqBF0w=

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/internals/libproc/err.bad_sh_link.r.p | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/test/internals/libproc/err.bad_sh_link.r.p b/test/internals/libproc/err.bad_sh_link.r.p
index 6eaa5447..25c87dfe 100755
--- a/test/internals/libproc/err.bad_sh_link.r.p
+++ b/test/internals/libproc/err.bad_sh_link.r.p
@@ -1,4 +1,4 @@
-#!/usr/bin/sed -Ef
+#!/bin/sed -Ef
 # Fix up DEBUG lines
 s/DEBUG [0-9]+:/DEBUG:/
 s/, [0-9]+\]/, NNN]/
-- 
2.52.0

