Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B060F2D8DD0
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 18:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787943068; cv=fail; b=V7fVkFJphtCQ7g6mh7hwZaaA72lgBfSpLNpeIcNCZqLViTjJg8ZKqwjeNosdc2M6DoGNEL0rp9u0KtPF+r1Wjkxo5jLeFS6cvqKECP4Y66/FnGR8mXAdF8H4zSNEGJ31d2O6S1Zo2Cn1hYfLwHs+XnWFfM6eQCaNu1MSKCNHJ4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787943068; c=relaxed/simple;
	bh=z/YCZJkSaNDsF6TTbJKMfPJMhphRh8smpo0Xx3IFm2U=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=gDWd8TPPSWCdkqLVFv/accu6qow3Vw+yAh5JbskIfJwlntVy8MLXNMe20WPRPb1vS0yDKAr8Fs3DmR7GHTB7ALbb/x0gHoht+hpI0RBbDG5izJqa5RhcqB8/cGAPfiyZMe1PM2KBLD2PnF5sJmHbxmhXqfi3WH0J5zq0GASsA+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=anV4yo+t; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=p7M5Io/1; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="anV4yo+t";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="p7M5Io/1"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SHKNZ93087267
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 18:51:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=UpzRhwXN6QfdMWH0KHO/s9XdkmGfZOz41ynXQGY7ggU=; b=
	anV4yo+tw/nCOfBkXipBK5VaDknLcf9bx/Aq4maQLzeq4PZl4WNUxp95Gdm/IzQD
	3b0Zav0Y6kFEFGFqo0L6+qevL4E4abCW+/NCO7mOZ7uKKHTa4SMaHa0i4z45Xcqt
	PoVXsYL1KkYa4TaNM1z3FR72huuQSpwMuQsp8ZUNv7Q1G5QD3L8eePnF5ZD+4M6J
	DpkstDUQvfz55W2UiSN0bL3PMfi98RbsoWEQZamySB38YVRdEKrA6D3hl32O1k/T
	8GAhpIC0k3gZs0g3KCxIzFmEGAtxkfzPCV1Zehxm8MwnHRBEf74p7TUkfgIPcfLi
	DCZ/CN1BuqUG94DMPMGnYA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g726btdre-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 18:51:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67SIodod015746
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 18:51:04 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011068.outbound.protection.outlook.com [52.101.52.68])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4g84kq529v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 18:51:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=auC04sEM4g3YvyP7wOuaXofA5iN+oE13Sse3BgvTYU8WY5YWBSMJkfxkMEukoc9Zikd/7PMiF2XZIbgWFcO8hw0Rtw/W5qa8I9I+B1qRYt+TKdEMgfScqyHcNQfMnvKD8UyfqIifd/gUy6GHhvLpRFxNEx/3Hi52Uk/CKVdFssnHYwgszTlxA821ivXm3YamBB5eTB3P/BU2T+CUPRYUy03s22PKG0ssPFc55rY/9jvl+8mrmvt+dxwzFnMQkWfgUg/y9K0XKBl2Rqpz4zsktVeyJY0oqEPz05qD3181wn1u/+HRTO2GAL1rEaOOWapuZoIZ5Jw6PmMyIHJfLWIA7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpzRhwXN6QfdMWH0KHO/s9XdkmGfZOz41ynXQGY7ggU=;
 b=AgIf7NlZbBcbMp8w5SF4Blr/OMBrcXwkaG0/6Djbqk+cuC28JuK5hcP3ZeK883KWTsW9XJA+ZssBn+z26TfCCuhF+8rL1kA+9XtiYBvkWwswcXJtVbpsmCcc9Os7yo0fNdKMORqYxBcK+ihLkgAW2t4X1IwE5UUjyejQpbz3+rdVPL9/Ase7s/vtJ7qn2juR/fObURoV/mQCfFipnY69FaJSacphO+kBhjIliHeRFEASzvbd4vckiQybVCdG4SsbFXf7FfK/L31Qly4PVqi01pZ/BTH2lPbaWEvNmFeNhd15AfnTipay8ei/d4698k+WThEPUtnQfnhCQ7paAlR4Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UpzRhwXN6QfdMWH0KHO/s9XdkmGfZOz41ynXQGY7ggU=;
 b=p7M5Io/1YXS7uR6MWI/EqMHJUMdDjCMNyVAiHtABYVnsFS4HTb3TBIdEKUdaKuhVrYIivtk7VltaDC+ox7VNe0H+r+DmpZn4kWqCfov83m5Bx0x3pI5WfeMPuE6Nath62g4iR99i35qSYW70QtofBE/NDPFatRzpzr+i+CpYnRY=
Received: from DM6PR10MB2476.namprd10.prod.outlook.com (2603:10b6:5:ae::24) by
 SN7PR10MB6665.namprd10.prod.outlook.com (2603:10b6:806:2af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.7; Fri, 28 Aug
 2026 18:49:31 +0000
Received: from DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537]) by DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537%5]) with mapi id 15.21.0382.007; Fri, 28 Aug 2026
 18:49:31 +0000
Date: Fri, 28 Aug 2026 18:48:36 +0000
Message-ID: <15cd034ae8698f3fefbc8259c3ce031e@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] provider: only call discover for the provider
 implementations
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0397.namprd03.prod.outlook.com
 (2603:10b6:610:11b::30) To DM6PR10MB2476.namprd10.prod.outlook.com
 (2603:10b6:5:ae::24)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB2476:EE_|SN7PR10MB6665:EE_
X-MS-Office365-Filtering-Correlation-Id: 98ff591f-9973-4e09-457f-08df053518a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	f55XQh3N1BPlYGzRS5AlJE+wodPHLMxH139cV/88ZsqlzzLwX8QcbWkeDQ9+VRu43Wh0BrHoj9a4VlfZiknwYSz958KeRlrEK7kdoxYUCkwXDl1x69dYM25j7IhwI6bGFTdtE535Mj4vOlSnLV8xbw9QvAfjwsBHH+1ll8UwsphFYS/kM3BapGxEBoG7kf0f8q0kvWk1qZx8TTXBMlLjHO6hZK5FehhputrAfHms7zdNG0fv+Ytq9yeU0k4iAHYwY6mquVGiRd3UfF2BQDkL4pzCqhsFMH+u5UOT9QGx5s/TC6SYDMJzCYwRh8xgfjXx5tPnlW+R/ibvgrX+WLjHDpxzyaB43QLeTFsxzuIvTJlLOsEXanrUdcX1b1SIF3Nrq1jUL2dxf8slLBgkgZec2eMOqWVU2+kbHQTnmC9F6WCvUvx3tJI8uHPqnfgkSSFM5xI4GJbfpCxQEB4GWMY4FZcDSLXpdD6/9T/Y0LAUTZDtzGt3UsNqaLN5D4BSj5VjQ/efVSEO1gFVoS7cUwo6s7IKmSKEDPKztj+26nKnUegbC+QImRVj4hSj6Vb7KraqfeTBgKCvMwQH707LdRYsQFtRV+l55avzW+F2XlbyRKO8JujsSdIfyXWzXQ85nIjxIHcOnUoIWQ/rkBzxjdpkE+GT4XPMJS3peG9SQQSyPAU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB2476.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zSv6ef8208BhTqnZYnqoa6Kea2bDr61QCpMxJCmL/F1DdDrJiPJrDtGN0t0q?=
 =?us-ascii?Q?I656WzFkfG0RZq5HHtU06ClXzR6fnKd5G8yMIzW2gNtMQ42IgPsG4vevLYH0?=
 =?us-ascii?Q?I1Uj9/PHJ6Fhxd8V/dgdQAW6fUWTbMFvUYS3a8UsEXhFLiTpGlq/NHntxCbl?=
 =?us-ascii?Q?Qu9gX7IBHO1TNi4xbt5c5XAqTgYhd5OqOnH/tJViNwZmtj0kSFd/dVzaNcdr?=
 =?us-ascii?Q?7YA3/Gd6CuPoNaZLSUn62VCFEYXuxkdSiIui2szWibiZfEQiP7ByF9+c9ViC?=
 =?us-ascii?Q?+XIsuXaA+rPRqqSDtvcuWMsYZg++w9lb0lpMjaZ0eC9SqZgq4ATuEvtr5D+q?=
 =?us-ascii?Q?krBA80r4Rwua9D1R5tsiWPBOHp6uEZQ4xHzsrNrRW9npViiT4RiIKNh+dSxy?=
 =?us-ascii?Q?3p8qXnAo2xsdezLTsg9fZ/+S12U1Id9R6pBxXREPxRo3DNGpDoZMtsKy01Z4?=
 =?us-ascii?Q?uY7bQwMA4yzS+o9+AY7M9SrIrv3ayzudDCTTdlHcY4m9vs9On/SF8CkUfRsc?=
 =?us-ascii?Q?4sp90/ghHlkVE48XUlDw6knTA2hcwniaGDbhjOdgm+ji7mUC/kdLLaxcC/KE?=
 =?us-ascii?Q?/CUvazW5RadovbdFmQ+tzrPUJQQYwR7Kk98zwQsg95OGS2d2cZhj1mhi2Ulw?=
 =?us-ascii?Q?tmVANtvrbR+j0/j0+jlPThcePd2Cwhm0q40YYfuikP87mN79StKjDugVMTHk?=
 =?us-ascii?Q?nMVDb9DFMNX5N7sSaxGr98qkKm0i9y5/69RNbvMD+jKDWS1i2WRsWa4wnGFm?=
 =?us-ascii?Q?pWDNLxvxwH+8QXtWl1TCCg13wl+bX9okbfWc/Nv6POMDu2fXrSLVKuw5TI9r?=
 =?us-ascii?Q?xrF1NULhjtPFq5aWBCFGUt6xgl6A8NIqsKDceRwwu3dB/gfQpt37QcFW8U68?=
 =?us-ascii?Q?X/RF/BsJZBn9/1aS80btr4iaJHgJGT63YfD+/0vmDzWqFBQGNVOAdhI3SCDK?=
 =?us-ascii?Q?yBCg7IraPZxGEHty/vVTKE2S3brzJs6szg6U1kX6+P8HL5MrFVYwwAgdAKYN?=
 =?us-ascii?Q?C7iA6N15TNkSCjWb5C5737Jzo6HbXLTR+Tr4ADb/T8EaXBXmJ5EbCOSNH7X5?=
 =?us-ascii?Q?Xt6SKpvBMh+LWIis4OXhX4rT1jQ6MbdaEHHgjWb4khwt02bLlEXoQybqFtxw?=
 =?us-ascii?Q?cy4GGOzezYpXKWC08Q6KEMCTo43TQSKX8mwDXV5fCFkmyMje3e6pLzjdVwdq?=
 =?us-ascii?Q?YzfIZkBY/Ciyo2d3yIBobPoI42k4xG/jOSfdU85l3RAQbdOImKWYamlABnXN?=
 =?us-ascii?Q?kedvYK83Kp6TYL/+vdLJZMaLvgkR3tmcfSK52UxJbXNJwp80Fqjv+RbbvOlW?=
 =?us-ascii?Q?RhA53DOKBsF+Q4zcpwA9vHDC3Ss/meI1IYHctPXkfY5EBL0RRXcKKHbdgW4A?=
 =?us-ascii?Q?5tfEXsK04KvmM1K8CvfQRUv8B0qdmqBKvRdtcxChwRkqNa4xamadYqFK1hg7?=
 =?us-ascii?Q?tgnH9MIxa3oZht2MUPItVSUO2vVhuSiOeG68nvI/iJs8K/Rt7/u4vnwV0cZn?=
 =?us-ascii?Q?lJn/t63JDQ9OkbhqoH0yjLnU8iHmeaOVWCuJiBM05T8ZikP5WkNbKkEpbXyf?=
 =?us-ascii?Q?vKomwsMqIvBzsnCnPWKHBniPmy+TmqREiAP+5UvHpwGxK1AyOE5HxbCenIhs?=
 =?us-ascii?Q?tS9CxA4YepwZNK2fd2rCL7gVKC7nwxkRtB1K6vM/QEKN6sWox86nRa1eJ342?=
 =?us-ascii?Q?WO3ohshBS6K5gka+JpUOTqDRRmcL1xQK5ozJiHxDevUpT9XCrxF0gcWHarp2?=
 =?us-ascii?Q?SCNVZMcn8uTr0hTZz1pwSL7y7Od+nLQ=3D?=
X-Exchange-RoutingPolicyChecked:
	k7Oc6awJp7pEknT1afvLYXVDLvzo4PLLQM9J+oQ/E6Ng+7ikqZI3E/MmOKNw2NZskqpselrZVYxxwBCzlsNIi5eWuNnmtPwXHGn1BK3IXsDZYjEPqmf+xB8Ak0BCv1xlDyOOy3nWKBAfkNElq2GXBJE/2aJRdeCqyipPoOrwtc2ORLK5LII0ChkTuo6cVkbtbtEd03msssyxxv4kcQGTJiNttd35REPV8Gj2KfNV4Y6pu5G+M324K1CKSELdR/bYkh5oiObMnhz+dwwlY5jD2Kd7x/iu6s8/mBOkeYiPmuU4Z46Kb5Ch+OKxp2Q5+HbMTvm0ll+jq8oMBvkoqX7IMw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Yt8GT7WMXFeTPnqNToEnDMP1Noj2aiy1+v8d1ATftBkBgMT3Mn9Yz5CpMOpMukF3qyHV73CxoY3m7IkJuoyGm3ulW3IiKgcJtXO279KdxiqTFH+Vjg7j9gJ5zp9rNDzWaVYq5bcmWF/NPMr1p3JbDyXp97jREULS6i17ia0URgOdHPZWvJ3H6cND0FFJcPRclfVFh5r0X9Y+ENbo+LwuXVfGoWSIsJysS8vrALR9bintlJYPXn/l4gxgCaq+VcopXlrR8kmuoapfh8m6XbWXU4R6pLzd0nMqX9be2yLHVKVz/Nqnqnn4+DSm2C7YAVPkJ1AT1Zmv4FqfQ0D6i2s9Vr3wwLH2Mww99qsZqcCP93l2y5dSUeCvmXxRo7wf8SqQtOXRJPDdyy2DJaQSdoTSwocjO71QbEiU3Vej63QPIrUwUYaG3k6pPSww1JbLzkVHPas1moH1pQi8/Sk94mcIk7L4dgPBnGBfpBLsCewfJEQ6tke83aaMf6xqt/j9/UnqJuBMna0PGqtIen+gRMfOUiRtdgbQVYzxuEOvdSFGwg1YnA8Umww9TREP8AbEeg93ybVjCnDE2tTGDEtMF5TDwPlUqzSsNycq5FoyI5cNTVc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ff591f-9973-4e09-457f-08df053518a9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2476.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 18:49:31.5952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I6jZr13MViMcYJW845SN+SFEN8P3fwGUrevNJpxBhBbmp825F49XrI8lq4aZzBNztucXh+ZULxaEdLKb6PM5KCfOI1ljxWQxW7+W/3zlCeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6665
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606160000 definitions=main-2608280164
X-Authority-Analysis: v=2.4 cv=Q6niJY2a c=1 sm=1 tr=0 ts=6a91d899 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x4eqshVgHu-cdnggieHk:22 a=yPCof4ZbAAAA:8 a=EaPYb6uyuH__oeVMIFcA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13521
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE2NCBTYWx0ZWRfX2Cv+o9Xu4gaC
 gU4TDTKtYiE+0LpR9xHQMtU/+bmpUV/iXF7KuSHhIzRvUbv09kEuqxiCMHvDHLPJAMXlVKVbvd/
 ctIQKC+mm4koaWhniAzc86ZyQLhsjrdIT3r1qB5ao67NlK120gMFiYM9gwAmFOKR4lMgnQOx6M6
 OGWUDnoIpS9RrEo05Mok+FLECygYrmuUEFcsflBDWYwRR1tpmRG9Rwnine80jPjlu9GUplUjRGx
 y0wvYV/7ZeZKe/GzrFP2uZKqqgh0uuQvr2gNwf5gO0d+RieR52dBx92l5cenAEcZwnfGrWusWn/
 iTDU3I0QbSSHFCdJ7KNJapkhRe9z8ES8+BYuCnZWlZE8Q3KxQY9rJMf/2nVWaXKbX7LcvWoRfFq
 loi8YRLr2zQ9MH/IdJ3D5tFXqAigU+9ABLKz9pKBZQB69oJvCY7H0IXDX1UGaTC75nBlOCaB5HA
 b38fuZsndxF2H384RR51Dm/qUYnLcHR4yj0nPeV8=
X-Proofpoint-GUID: n2iNKdbNB2F-ctxtn9jS9LpU3WBnpGap
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE2NCBTYWx0ZWRfXx7zr0hiCCAhr
 IBFdLicf+7NIXjBpVEaWuzDwGzpFJfHFOX+7j7u7Y7gH4yET9N4pLRUyPnvXoyqZIzGq8aHkKH7
 XxHKBJ2OvyU9DZX/sa2chCcp9ND+L988m3ffb5NZPkAxP4QOTIXN
X-Proofpoint-ORIG-GUID: n2iNKdbNB2F-ctxtn9jS9LpU3WBnpGap

Since the discover() functionality is provided by the implementation
of a provider type rather than being specific to a provider, we only
need to loop over dt_providers[].  The discover hooks themselves should
take care of any newly discovered probes.

Suggested-by: Eugene Loh <eugene.loh@oracle.com>
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_provider.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
index e073e1f2..818390d2 100644
--- a/libdtrace/dt_provider.c
+++ b/libdtrace/dt_provider.c
@@ -186,12 +186,13 @@ int
 dt_provider_discover(dtrace_hdl_t *dtp)
 {
 	int		prid = dtp->dt_probe_id;
-	dt_htab_next_t	*it = NULL;
-	dt_provider_t	*pvp;
+	int		i;
 
 	/* Discover new probes. */
-	while ((pvp = dt_htab_next(dtp->dt_provs, &it)) != NULL) {
-		if (pvp->impl->discover && pvp->impl->discover(dtp) < 0)
+	for (i = 0; dt_providers[i]; i++) {
+		const dt_provimpl_t	*pvops = dt_providers[i];
+
+		if (pvops->discover && pvops->discover(dtp) < 0)
 			return -1;        /* errno is already set */
 	}
 
-- 
2.52.0

