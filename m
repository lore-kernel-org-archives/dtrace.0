Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25D63FC5A1
	for <dtrace@lists.linux.dev>; Mon, 15 Jun 2026 14:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781534832; cv=fail; b=dO8u65qkYmGRxFqQs5aqEFm8s1dCGnD5DslzIcYiU8krsi1OgoYxVAAlNQunkNYTR+gktQN5Lw2GMtDv3DwJXnaoB7WB2NNHf23B9n94HjqZXqe3IFzm3wBM21sjyg3n9mkAWfOsYmgCnTLHV6KeZf1+CuVhAZ3mqBGxYutQne8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781534832; c=relaxed/simple;
	bh=3PjoIaype9mSolHbOsK7LIhAKnR4eKN0TH//crIA6lo=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=slaLRFLrEPTNWyq4Ufhng7QUHUBQaRztNa9gPS5eVqm9skGXjMKZxX+pjV7TEfVHrXjXkVAMaXfNycKmqfGNloVs2niWHCEyI6K7ZA5EcotdEX5CaQdpL1Z1GOzlOHhcZIqKC//cJngRZHQE7TCGlftF+CqSko40RmoTBU9gVWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nsUp6ux3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wQM13nsX; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nsUp6ux3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wQM13nsX"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FCN5aW1382880
	for <dtrace@lists.linux.dev>; Mon, 15 Jun 2026 14:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=FC3yU7gQL+SFaynb8FIG5f/Ywt9hRlzT/YoMfIBF6ac=; b=
	nsUp6ux3T/pLyLdPk8SV5wbOl2o9HFT+811RSwJBfDNG9bBbOjnTmDxrgZVDeMmL
	QRrjvNywkGZf7vPH2Nq0FPW8hFRJVHKo2foFeesiS49cWndrIH3+Sy+sZhlObZkE
	XESCFROGmxjcJ2WiVN12BykBAXOu/7AC0rvxa9KoXnG/8lowWTANnfmrxx7oTOF3
	a1f27I6RSajd/bH6gZxhq8WIrhL1zXUCHWpFgK/JTzSLv6/ges46pdiJm9ouS4CK
	y2onSSAa8oy/sVGLSzq4ypj27iomGE3yk4Ok7mN5BAXCAG9Kvo5Kt5cSATDQtx06
	Xus208R67dc8827Tb5GPAA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4es1ay2qhm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 15 Jun 2026 14:47:09 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 65FEhxuL016171
	for <dtrace@lists.linux.dev>; Mon, 15 Jun 2026 14:47:08 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010005.outbound.protection.outlook.com [52.101.46.5])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4erwnp06ap-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 15 Jun 2026 14:47:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQ8ZuGHXLgYsJE/wDIOC8QoPECHEh5+gBJIus13ytQLSNpMTkRjnO2P9qhtSt0e99Cqboy6gssgVVJQ+K+2A/2B6nb0PY9Am6H5Otd/VxdrwmfngawEzUOUF98cBryD3XJvPOIKDVbJ9SBG16UG0hVgVV6NM4Uhtd5aNQCBOoKp16RcLxk6x7ee4u5bgU/f92foCAVumi+0rmt9myeqJbigitkNTYAaNTasjczDhU4j2bAVpnvq/gqRkN9kdgVTIulmv0PSjwje3xhtv0WFHQapR8Dat8fk6/yGqXHO1XwSI3bPpp3OaxHhMHc8EtnnEHQeFDZmoKtHTzGENcOX4xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FC3yU7gQL+SFaynb8FIG5f/Ywt9hRlzT/YoMfIBF6ac=;
 b=aiMmPrJg80hcRa1e57ZXbQe7ryaopeGrP2+OB9ECiKhJsrfAV895uZJIYA7f1K8us01bgB97Mycm6/jj/Ep50wyE7Tywbm5adnPU2loV/z8qdO/Q+2fY+viI08bRQP4Z3kJiIiXRAdgYkiETLadzFtd7KZOwYgwBRcE6DxOJBfOc0+p705GtP6xLJaatRMP0mxW2a+eGUFFd+fD7puHLGbQpO9CXxO2AeahMaYyvOt0qiSP+lJU5KF+nJ7w+QXpHzyO86pK8OFAoCT/+dc7WzpBSGuq81vVOm97OHk2RQQ5hRFNEkd4pWnGzLwe+bfuT1AkPWYC282J5PX8o6sF9UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FC3yU7gQL+SFaynb8FIG5f/Ywt9hRlzT/YoMfIBF6ac=;
 b=wQM13nsXOE4He9M0vm0YIx0UVquz+G1RCwY2Wt4oArEyFpuEeA3Nozr1OKYV9WmQTDhRBheZtI6TtUNjjRYRtYY4uz2yb9kRtTgqxS3jIIRzPm1CATWbBNUIy6LA7kYuTxYzYAY2ZG5upGHVsiV9F7NkaqucHGdkAc6aL/dUUGg=
Received: from PH0PR10MB5514.namprd10.prod.outlook.com (2603:10b6:510:106::17)
 by CH3PR10MB7119.namprd10.prod.outlook.com (2603:10b6:610:122::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 14:47:04 +0000
Received: from PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61]) by PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61%4]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 14:47:03 +0000
Date: Mon, 15 Jun 2026 14:46:55 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] dists: add prep-debuild target
Message-ID: <ajAPoxyjP1dgml6u@kvh-deb-bpf>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: PH8PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::27) To PH0PR10MB5514.namprd10.prod.outlook.com
 (2603:10b6:510:106::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5514:EE_|CH3PR10MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: 5673244d-ec7a-46df-be29-08decaecf6df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|13003099007|18002099003|3023799007|5023799004|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	uugGoHL4+W94C/5q0+CFDXMrh+g7isFMC4TZJ2P6RJyCimkmQYrMqI+n65D2eZnNpxqLRhAEhlB8mAkrPSKJBwasD1/qA6IEQpEQ2XjTKL/WQpqKXwVRvKHVYJoRcqiwmjCoUuLZLqxqjxFsnqXImBGcRD5ZM0g6ooM55TTj1voQsdtdGkfrxsQFec/B79BSEfRcjPSJ1awMgPSUSovhqW286wcLdC9cLMbrPxVwGQ3Eh5ldnRNV8aoarHB1ZXt9EatqigyuHM9+p2hctOQBjs/fjkIUtVuJd2ISyeDJE2Umvuil5VaF4aSGOyhDCM3HrQPjnOj/05xSo6LVT65ic4wwK3wAJqAQaEKhwSOE3fLRn0+kzhyTwMJ7d7yyQbYp7Y8Y7+Y0GAzvcjNkraHihHlz+jIkaPrCMNi90HxHlwfEOC8WeCEoQsNeX5tGNE3j0E5fBLCwBBf3sUXUoYyH4Izt98zGs/NG5Ref0GRNGFq4t5GgWdehCRucuhIxaJe4g76JVBFIoyj9aZXHPD0LhLlb6UNkVenNlC6hDPOhyI29FFv/RhKeAntsJxyz9v9jZ53tMOATQI/tV9BKNYUk4/7/P6tkb7YMTc1BWkQ4RdTDGYMhytT3AECOgeRJNOGOTz5nPTYE+UtRu8lEflea0w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5514.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(13003099007)(18002099003)(3023799007)(5023799004)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vGBGZGpglM67ZRjAGEGGhfHz7MBkbnmjW44wCn0ZaNAZHfets8HL9fV9ZSve?=
 =?us-ascii?Q?E+h8CTfSNP4/T3DCg0t2aXo87Z8AxfNozz1+ZwU42fgsq7uAGd8C1MaSZYhF?=
 =?us-ascii?Q?PpbtTmsCWWHqTDRfx+KJwAJZelHC76DLpo3nXCV+cmMhWj6L8KKdQCL4tqlt?=
 =?us-ascii?Q?jn7HlQYoo6qlasQCkYaG1+mojfA7Nl3GijErq/7g0GMWHM8ir2dybe8YpUkT?=
 =?us-ascii?Q?WZ10WEfucp7lKf+MZkIMmpe2kpULVPXEk1oyN/FCUnwid8h89dLW6ePanFne?=
 =?us-ascii?Q?BpVOseKorInZ8wbJgXTdVn7FeyBKmxNElJQU0gh5YtrxeHRSSgvLjXcrEF9L?=
 =?us-ascii?Q?cs9B544T+hJTals+NU9VIf49oEOOTSBwcbKMOGWJkYyYSuXwWvcpF22rlt73?=
 =?us-ascii?Q?LBemFGWov4sy2aE+3lrBwuVOayFXRsAtcNCZchU06ydWVFkB6qd5TGZZeDCF?=
 =?us-ascii?Q?NvI6wNCXxrpSujvMiB3fjMgkczOBWqrvhqNZ9bWAWtz5hmdq0HeoVDipf2H3?=
 =?us-ascii?Q?+8fMKaONA4IpYxcpLS1qmLJc9tlVnqr8MPjilNO2GwCF8oi2g2WYGXE2kOei?=
 =?us-ascii?Q?56kOQkX8iRZasBkk6qLJTP7kg1ykeybWolbGPLrAc1VbRwtdAwZEqiliJmZg?=
 =?us-ascii?Q?IAluoNhZq23FqAOdGNlHGJSapukDj1Hk9Zuvsj/ji75S1aUb7xl4oF0mtqKy?=
 =?us-ascii?Q?VBqWRFZqn6HVnZ9HWX6xAGYMZowtyFIwYbp6F7kMj7zTxYWCl3TbafWHYhn8?=
 =?us-ascii?Q?nIlrbGLH5upgMCn8Q+wm9GkwO6ExXf6ZWOGsLdS1RYHx+LonzIWhFrGzX8sz?=
 =?us-ascii?Q?4zjYi/GPoET3pzZmuYJuXLB2U+o+skdWkWv5i5ail/yzmqt/exS7r0Wg9FUh?=
 =?us-ascii?Q?LJc/rGiJsw2TBE78NKjygn7UxItDnK/r6J/s0oFYzG+2K581AxIMVpRWg1eE?=
 =?us-ascii?Q?H1p7bW2vNVGP83QrzT8NcktMjyYX2KHJbW+wX2d8cXcVJnLTkhRmxpFQ7fg1?=
 =?us-ascii?Q?KsD4MqKd8w27t5otGXhX4yC7GJR4aUOQCExlLiW1MtvGWkKfKfHyQO4MZJXx?=
 =?us-ascii?Q?t6G76PfM5nAc4tL/+X69gN65t4v/SzX9pMHjjzQRpTccAa7810boHlHZkevV?=
 =?us-ascii?Q?Nht8WihPR/C2K9wf7eBJclLJ+YGt/j77+zfKNz+8qqJxmTh8yKwpPFKMlaQf?=
 =?us-ascii?Q?psoYoqyiuBIuvxLUnofATMuEOBrqLdSeEZiZsq9bO8HMXda1HMRRKIiKCupT?=
 =?us-ascii?Q?aAdaoks5tzj4j/vPnwa2ruuezJZiSQ/ovlVWhTlU4WDXwihpmFvIR+kD5rF7?=
 =?us-ascii?Q?yfhrcNHZUwlEr30KbKrfxd3mxU24MH3EcTGBf1vBkUOy6bHCRJNVwmJNI8yz?=
 =?us-ascii?Q?Uvmn+IkubHqc3Li6Xx1hIcDhMrcilem8Kyi57e1sctLfeGQOPCWN1ypiQZpw?=
 =?us-ascii?Q?WgP/bglKUw8zk56M0GylRyxox4bl/t/2VVO3wiIRh7/Y1ETltM4xOaNEbCOd?=
 =?us-ascii?Q?+qLQd29b4JHSagYaNTppwNjA7mb97K2R+lPjIhT1xrAy8COPdVOjKyPEKHCf?=
 =?us-ascii?Q?SeWBkQMDi3zM1lQQ7E5y543JjQ/r5mXFQp9wjP92rofOENZVghI7plNj8OlU?=
 =?us-ascii?Q?9SEMw+euOWqNvUvoarlvfIZb33vmYrLVplISsJOEx68EQRyNz72otz6vHkhD?=
 =?us-ascii?Q?pejgn1GcUPP2j9R2hROBjrCp65nwGVjt6sLQNwwglpvHTVfgUCWbDoZ+ygrx?=
 =?us-ascii?Q?+t5/cm+bUQ3X+RAgn0euZfaNsmeKKcg=3D?=
X-Exchange-RoutingPolicyChecked:
	guUCo9pnw7OfAzJA02d/xRAzEJg6u4zDYcLi5O0XEo0Pm8DzkvwGR+3vhBGq0iujf3JSs3Nphco150tFNCEN8jo9yFwLZpeGFLN1IaY8RLxIsolQ485I9/BFyuh+gjt09SzpuuaEAlbKQWTFUXzuO2Qd7WcnuV0EIYN7PwXA8y7zoDpffVSteS7pycuND0etmso6zJRDpedIjVgxxU0+Fpm/v+J7pfFlrH440IH7l92ZL41rqk2eiyNmRchwKukp8eVPi/+p+BvJ9QvJi1IMstC30Mgtq58O0RdQObCNmu+lIbMf41dRR0QIkjthouibyJg8+Fs1XlwurSuFa2DGxw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kLSLZBsssvTwn/axHVuCkTAdkYLCEj+US8040ACFhT8AVU0R5l6NrYXJUQDFoOUFNtAFEkLn5CUzEcipOMoIt6qwRtFxRrzT90r2dXQGP6rUZrnD27Hy6X6OJyrhvLssW9mjGRxq8vSwIHKa1F8hVPct7IW493JBv15XaTLKnm94Y/TREf2EOEfvWC9BwADUDdnftMPA9+bt1ge+RpxI1LdCuQ+Pwitl5et6KQOHaIqz4U491oc7hu20wfADkqLu2lMK8wDlCq4fe/iarRU/rDFxW81YyjqY9/MUVgaquX38TtrhzXEPnSrKOV4xgN8Yre35JBhRO1Q2ZdZvHKRJYeliUXB5DwXXbCQeWjvaXKmMV+Pbz5nzQOVqhCa4i0Q21XiUR9ATMjO1/A2X91R78SyGWseSNgyr7X27PNdq1TcJj1KYK7gCWsb04UEYpDzxXAlk1TpZw0ZgxTDumXI4WkbqxpQpYs00PlQ989GGc3nu58lei3IauayNOe5ffy3TRbig7EIHyQCcg+xcot9Tws9Yr7NLbepUs+ER87nvufKAMwyJP5g4tVBm0ojkwDpaGZsqDgpufLVbBk114wg29h/wn5MiiwShlgJjcKiUoyY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5673244d-ec7a-46df-be29-08decaecf6df
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5514.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 14:47:03.7775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PHj+qx9POcqSk/zMidd2E9+5eSUhn0euCbxqOkHJB4A0f1v3PsodW7nT295YLwFhCBdjjkgl9u2kzjhvxCPhaEVmCv/El58kqArG0SJGzC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7119
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606040000 definitions=main-2606150155
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE1NCBTYWx0ZWRfX6zJ2sm0jkuLb
 s1yDUdLOvhkpDF3+bzbSGl9dS/DLe0zdw5DiAGNhANpB3xG0LmgOnq6NX8Lti+MnOP46wKqvl9m
 lFVd003iL6mVdMH1TzZcYioxXATSp3fN1EvoQeTqBf6Flem2uEjX
X-Proofpoint-GUID: 4Zys8sYLPRRPX4BGxvCQBN_jPfyZsvac
X-Proofpoint-ORIG-GUID: 4Zys8sYLPRRPX4BGxvCQBN_jPfyZsvac
X-Authority-Analysis: v=2.4 cv=PazPQChd c=1 sm=1 tr=0 ts=6a30106d b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x0eKOSpe3m1H3M0S9YoZ:22 a=NEAV23lmAAAA:8
 a=xNf9USuDAAAA:8 a=Ixkok3qfAAAA:8 a=yPCof4ZbAAAA:8 a=ETPD8Dfcw0V7obVJUb0A:9
 a=CjuIK1q_8ugA:10 a=_4Lj5ymMnAn2NA9aJKr1:22 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12312
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE1NCBTYWx0ZWRfX+51Mxhl7aoRw
 RZ/KP3lk8ZNEoFOCCvB94IbKmbJI6Zbw69olvZIrtoMVRGTfegLIE+2GYwByE3kn451xCb7OZCf
 KTFUtCsRHV9yMexBFNFUKnsd1h3S2tTVzFONNZqyloTJthBp4e/tAUXI1qtPLthbtnHI/2dswXr
 7hAL4BSWWW/bs9+0SL//lQbs4tJG17MEbuqQ+CC1GRQmWirNXsA9IRnYa4r3sAqtw85eD7vHFx8
 DSVKAQc8bPXi3VdsJZAhfxJF51r3Cy8sHrxmChdlPPzdtdXqM7eOlcWooIahgPfx19kLC9UJehT
 TLpslR35uXm4a0tM7n44r6X9djPTNM/vKjUEO0AdGqR26fi8YFO4Ku5o4zHBSQuJGQwX2NW5+Ys
 V3OYMuP4l2KKoPkbtiCVVBFpPoUSbiTjOg32iIZPNmkEUNkb4qNXuN4cmiP3HdTJtNfuNXYlIKI
 4W+PMGtuyjqIDvlkqYHiy321eKrmEcKy302dt5wI=

Not adopting this patch for the reasons listed below.

> Here's a tiny patch to let you avoid the make dist in favour of a simple
> 'make prep-debuild'. (I didn't fold it into make prep-debian because
> some package building tools, like apt-src, don't need the .orig.tar.bz2
> at all.)

The reason why I do not do this is because the steps I outline are to get to
the initial state of having the files necessary to build DTrace for Debian.
This is what needs to be done to go from the upstream dtrace git tree to what
is needed to e.g. be able to use apt-src.

We are a non-native Debian package, so there is some work needed to go from
the upstream tree to what Debian needs.  I don't want to automate too much of
it because it is certainly possible that the creation of the Debian package
files is going to be done in a place other than where the git clone is located.

E.g. I create the tarball (make dist) on a non-Debian system, and then do the
building on a very pristine Debian stable system to make sure that it ought to
work in a clean-room environment.

On Fri, Feb 13, 2026 at 02:29:05PM +0000, Nick Alcock wrote:
> This does the creation of the .orig.tar.bz2 in the parent of
> the source tree for you.
> ---
>  dists/Build | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/dists/Build b/dists/Build
> index c75f933270fa3..f1ed1a4627176 100644
> --- a/dists/Build
> +++ b/dists/Build
> @@ -9,8 +9,14 @@ dists_DIR := $(current-dir)
>  # Prepare package building on Debian (copy ./dists/debian in ./debian, and
>  # generate the debian/changelog file.
>  
> -prep-debian::
> +prep-debian:: dist
>  	$(call describe-target,DIST-PREP,Debian)
>  	rm -rf debian
>  	cp -rp $(dists_DIR)/debian .
>  	debian/mkChangelog debian/control dtrace.spec > debian/changelog
> +
> +# Prepare for debuild, which needs a tarball to already be present.
> +# Many wrappers around debuild already do this for you.
> +
> +prep-debuild::
> +	mv dtrace-$(VERSION).tar.bz2 ../dtrace_$(VERSION).orig.tar.bz2
> -- 
> 2.47.3
> 8<--------------------------------->8
> 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> 
> A couple of questions below.
> 
> > +prep-debian::
> > +	$(call describe-target,DIST-PREP,Debian)
> > +	rm -rf debian
> > +	cp -rp $(dists_DIR)/debian .
> > +	debian/mkChangelog debian/control dtrace.spec > debian/changelog
> 
> (I have a tiny patch for this.)
> 
> > diff --git a/dists/debian/control b/dists/debian/control
> > new file mode 100644
> > index 00000000..56687a82
> > --- /dev/null
> > +++ b/dists/debian/control
> > @@ -0,0 +1,74 @@
> > +Source: dtrace
> > +Section: utils
> > +Priority: optional
> > +Maintainer: Kris Van Hees <kris.van.hees@oracle.com>
> > +Build-Depends: debhelper-compat (= 13),
> > + bison, flex, gawk, gcc-bpf, binutils-bpf, valgrind, binutils-dev, login.defs,
> > + libbpf-dev, libc-dev (>= 2.34), libelf-dev, libfuse3-dev, libpcap-dev,
> > + libpfm4-dev, libsystemd-dev, libz-dev
> > +Standards-Version: 4.5.1
> 
> Why 4.5.1? I guess it's what debhelper writes right now. (The current
> version of Debian Policy is 4.7.3. It looks to me like we're compatible
> with it.)
> 
> > +Homepage: https://github.com/oracle/dtrace-utils/
> > +Rules-Requires-Root: no
> > +
> > +Package: dtrace
> > +Architecture: any
> > +Depends: ${misc:Depends}, ${shlibs:Depends}
> > +Description: Dynamic tracing for Linux (DTrace)
> > + This is the official Linux port of the advanced tracing tool DTrace.
> > + .
> > + DTrace is a high-level dynamic tracing tool for Linux, built on kernel
> > + tracing features (tracepoints, function probes (fentry/fexit), dynamic
> > + kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
> > + leveraging BPF as execution engine.  It features an integrated compiler
> > + for its high-level tracing language and native support for interacting
> > + with the BPF engine, significantly reducing runtime dependencies
> 
> Full stop at end of sentence (and for all the others below.)
> 
> > +Package: libdtrace2
> > +Architecture: any
> > +Depends: ${misc:Depends}, ${shlibs:Depends},
> > + fuse3, libctf0, libelf1t64, libfuse3-4, libpcap0.8t64, libpfm4, libz1
> > +Description: Dynamic tracing for Linux (DTrace) (library)
> > + This is the official Linux port of the advanced tracing tool DTrace.
> > + .
> > + DTrace is a high-level dynamic tracing tool for Linux, built on kernel
> > + tracing features (tracepoints, function probes (fentry/fexit), dynamic
> > + kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
> > + leveraging BPF as execution engine.  It features an integrated compiler
> > + for its high-level tracing language and native support for interacting
> > + with the BPF engine, significantly reducing runtime dependencies
> > + .
> > + This package contains the shared library.
> > +
> > +Package: libdtrace2-dev
> > +Architecture: any
> > +Depends: ${misc:Depends},
> > + libdtrace2 (= ${binary:Version})
> > +Description: Dynamic tracing for Linux (DTrace) (development)
> > + This is the official Linux port of the advanced tracing tool DTrace.
> > + .
> > + DTrace is a high-level dynamic tracing tool for Linux, built on kernel
> > + tracing features (tracepoints, function probes (fentry/fexit), dynamic
> > + kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
> > + leveraging BPF as execution engine.  It features an integrated compiler
> > + for its high-level tracing language and native support for interacting
> > + with the BPF engine, significantly reducing runtime dependencies
> > + .
> > + This package contains the development files necessary to develop
> > + alternative implementations of the user interface for libdtrace, i.e.
> > + replacements for dtrace(1) itself.
> > +
> > +Package: dtrace-tests
> > +Architecture: any
> > +Depends: ${misc:Depends}, ${shlibs:Depends}, ${perl:Depends},
> > + binutils, cpp, gawk, gcc, make, pkgconf, tshark, bpftool
> > +Description: Dynamic tracing for Linux (DTrace) (testsuite)
> > + This is the official Linux port of the advanced tracing tool DTrace.
> > + .
> > + DTrace is a high-level dynamic tracing tool for Linux, built on kernel
> > + tracing features (tracepoints, function probes (fentry/fexit), dynamic
> > + kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
> > + leveraging BPF as execution engine.  It features an integrated compiler
> > + for its high-level tracing language and native support for interacting
> > + with the BPF engine, significantly reducing runtime dependencies
> > + .
> > + This package contains the testsuite.
> 
> (... up to here.)
> 
> > diff --git a/dists/debian/copyright b/dists/debian/copyright
> > new file mode 100644
> > index 00000000..1a5c8f64
> > --- /dev/null
> > +++ b/dists/debian/copyright
> > @@ -0,0 +1,103 @@
> > +Format: https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/
> > +Upstream-Name: dtrace
> > +Upstream-Contact: Kris Van Hees <kris.van.hees@oracle.com>
> > +Source: https://github.com/oracle/dtrace-utils/
> > +
> > +Files: *
> > +Copyright: Copyright (c) 2003, 2026, Oracle and/or its affiliates. All rights reserved.
> > +License: UPL-1.0
> > +
> > +Files: include/linux/bpf.h
> > +Copyright: Copyright (c) 2011-2014 PLUMgrid, http://plumgrid.com
> > +License: GPL-2 with Linux-syscall-note exception
> > +
> > +Files: include/linux/btf.h
> > +Copyright: Copyright (c) 2018 Facebook
> > +License: GPL-2 with Linux-syscall-note exception
> > +
> > +Files: include/sys/auxv.h include/sys/bitmap.h
> > +Copyright: copyright (c) 1984, 1986, 1987, 1988, 1989 at&t
> 
> AT&T, surely?
> 
> > --- /dev/null
> > +++ b/dists/debian/libdtrace2-dev.install
> > @@ -0,0 +1,5 @@
> > +usr/lib/${DEB_HOST_MULTIARCH}/libdtrace.so
> > +usr/include/dtrace
> > +usr/include/dtrace.h
> > +usr/include/sys/dtrace.h
> > +usr/include/sys/dtrace_types.h
> > diff --git a/dists/debian/libdtrace2.install b/dists/debian/libdtrace2.install
> > new file mode 100644
> > index 00000000..36294de3
> > --- /dev/null
> > +++ b/dists/debian/libdtrace2.install
> > @@ -0,0 +1,12 @@
> > +usr/lib/${DEB_HOST_MULTIARCH}/dtrace/[0-9]*/
> > +usr/lib/${DEB_HOST_MULTIARCH}/dtrace/bpf_dlib.o
> > +usr/lib/${DEB_HOST_MULTIARCH}/dtrace/drti/
> > +usr/lib/${DEB_HOST_MULTIARCH}/dtrace/include/
> > +usr/lib/${DEB_HOST_MULTIARCH}/libdtrace.so.*
> > +usr/lib/${DEB_HOST_MULTIARCH}/pkgconfig/dtrace.pc
> > +usr/lib/${DEB_HOST_MULTIARCH}/pkgconfig/dtrace_sdt.pc
> > +usr/lib/systemd/system/dtprobed.service
> > +usr/lib/systemd/system/dtrace-usdt.target
> > +usr/lib/systemd/system-preset/50-dtprobed.preset
> > +usr/lib/udev/rules.d/60-dtprobed.rules
> > +usr/sbin/dtprobed
> 
> I've always been worried that these lists would be hard to maintain.
> It's a shame we can't autogenerate them, though it's hard to imagine
> from what. Maybe in the future we should do like we did for the version
> numbers, and have a centralized list of files from which we can generate
> things like this *and* the install commands in the Build files.
> 
> > +++ b/dists/debian/mkChangelog
> > @@ -0,0 +1,174 @@
> > +#!/usr/bin/awk -f
> > +
> > +#
> > +# This script can be used to convert the dtrace.spec into a Debian changelog
> > +# file.  It is intended to be invoked from the 'prep-debian' make target, but
> > +# it can be used manually as well:
> > +#	mkChangelog debian/control dtrace.spec > debian/changelog
> 
> This is really nifty!
> 
> > diff --git a/dists/debian/patches/debian-configure.patch b/dists/debian/patches/debian-configure.patch
> > new file mode 100644
> > index 00000000..d4a89bb9
> > --- /dev/null
> > +++ b/dists/debian/patches/debian-configure.patch
> > @@ -0,0 +1,17 @@
> > +Description: issue a warning for unknown configure options
> > + The Debian build system specifies configure options that are not known to
> > + the DTrace configure script.  They should not cause the configure script
> > + to abort.
> > +--- dtrace-2.0.4.orig/configure
> > ++++ dtrace-2.0.4/configure
> > +@@ -172,8 +172,7 @@ for option in "$@"; do
> > +         HAVE_VALGRIND=*) write_config_var VALGRIND "$option";;
> > +         HAVE_BPFV3=*) write_config_var BPFV3 "$option";;
> > +         HAVE_BPFMASM=*) write_config_var BPFMASM "$option";;
> > +-        *) echo "Unknown option $option" >&2
> > +-           exit 1;;
> > ++        *) echo "Unknown option $option" >&2;;
> > +     esac
> > + done
> 
> I assumed you could just stuff an || true in there, but this is being
> invoked by dh_auto_configure, so that option isn't available (plus, of
> course, if there's an actual error other than unknown args, we don't
> want to fail).
> 
> Maybe we should just not exit with exitcode 1 on unknown configure
> options, only IIRC Gentoo actually wants us to. This may be the best we
> can do.
> 
> > diff --git a/dists/debian/patches/debian-interpreter-paths.patch b/dists/debian/patches/debian-interpreter-paths.patch
> > new file mode 100644
> > index 00000000..58bea538
> > --- /dev/null
> > +++ b/dists/debian/patches/debian-interpreter-paths.patch
> > @@ -0,0 +1,107 @@
> > +Description: fix interpreter paths in tests
> > + Lintian prefers /bin/bash and /bin/sed over /usr/bin/bash and /usr/bin/sed.
> 
> Honestly this one I think we should do upstream. I always thought that
> /bin/bash is universal and /usr/bin/bash less so.
> 
> > --- /dev/null
> > +++ b/dists/debian/rules
> > @@ -0,0 +1,24 @@
> > +#!/usr/bin/make -f
> > +# You must remove unused comment lines for the released package.
> > +export DH_VERBOSE = 1
> > +export DEB_BUILD_MAINT_OPTIONS = hardening=+all
> > +export DEB_CFLAGS_MAINT_APPEND  = -Wall -pedantic
> 
> I suppose without -Werror this is safe :)
> 
> -- 
> NULL && (void)

