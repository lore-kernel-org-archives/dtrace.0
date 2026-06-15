Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6743E3ADB97
	for <dtrace@lists.linux.dev>; Mon, 15 Jun 2026 18:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781549831; cv=fail; b=iBFut0H/epWrtxh5zCptLiCyfBRziTTee5gtXHKd/wcFxxz+n8d4Z5MFsdoi0WZXYSL+Qw94yqdKjbPs3e715FFRznTUtPqvOHaBGYSShiiAWHPAp/TZRyQZfgnRlCwLa8xqMfEKV/DtM1VnmwWuXAQnu1nOy3bSBXQz9E010WY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781549831; c=relaxed/simple;
	bh=ntKNql4S8aE5ycTwX8jaFABwkpKnyE9LlRtlRinWHR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XpujVOJnIQNcmlse+QM1Jd4WepXUMaOFzUsUgryear2T1ByhwR+Nti+u/CO9nKxsmmQ1NgRnaXBtt2JbCdHTHdsA+GypDbI4WDtE6DkXADx8qdq24ADnydmy4ji4/v2jYkYmGqVmmeCw0TYxi+Gt0TLo0qP13OWrGk8TD/UjS6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Nis7njzg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=B/xSJPjp; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Nis7njzg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="B/xSJPjp"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FCKTkO1343659
	for <dtrace@lists.linux.dev>; Mon, 15 Jun 2026 18:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=9xrsdcHCTIYhlEDZbw
	obz/KAt5BzMe578mM3o3lKzuM=; b=Nis7njzgEUHnCEl4u5USRFgYC0ZNOLImZx
	OH2V/E/AE4E00P/proc+OnRds060vD71XoDcF69FTRczOyQtW9WzMc5Vp9QERF9d
	UazWXPhO53sfizTyy7Ar007X+NiksiHBFasn7Tct2TJUe6NpG/v/gDusaDFJ3cjp
	1JGlSOPtQ74TYuLS8EbhOWzvGuKWhCIhv5x6rDxRDEB7QbJJS3x+zghAwjM7oS4/
	6VAVN3C9UQNJkKVQNd9op90gWXwHNcQgoeZIGwqVO/WMvwd0TTqC8GBDXa8cePbw
	uuC7t/KI7BhLtny4p5WLPrhqAv/42LVh+EOWgOLJ129v7vWt4TkQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4es18m33mc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 15 Jun 2026 18:57:05 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 65FIr8c3030563
	for <dtrace@lists.linux.dev>; Mon, 15 Jun 2026 18:57:05 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012035.outbound.protection.outlook.com [52.101.53.35])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4erwnbqwb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 15 Jun 2026 18:57:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jcfUYd5VAc/bN14r2YO15Tp/2drAnl61uHorBOFF7lQRsNxiMDpCbpNOudD9OC0MzIZNQolpBkVlXUFj70C0JHFzsRQxSXszzSCRUeyHdBY4lS2PQeMp6jQNrDDocsokloznK5ExPK557HdXnak0bh/L9uq/5qwIdTne2sjhraL/ymuywERt7xO201Oq6IPtOTAugvxjMLUoIvu5Ycmc5vZNvR5dcImHt8pj4NHs4paqJvhj68jWRAymB7D39yUq9Q5ElwsbY9+4lgPORFLWypMK8njOORZreo3apL0d6D1b+dXHI36FqwxurdSMwEIfp/DPBfNzQS1WH8jc9fXJlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xrsdcHCTIYhlEDZbwobz/KAt5BzMe578mM3o3lKzuM=;
 b=xp/G3DDKpq5hm4pNmas4ej9VoEfGo/7J2ZPsmyZbdPHtD80911m/acERuRsSnSMNlFn0ptkyXo9Y5+JvSt5MU4Vk3+CoXgoNr3vP+BjZkNOVaTIWYSNKyjoIyrs896YPD7+HRVFYpt0BeA3l5qCL5h1P6mfXEkhJgV2TgMjCj9lMmgCQgrGHK7em2lTEEKZUcu4AVcCUEaNeW1SDvYpEBNv/B5WQkA71IvPqDoErMnCf+lvUPKWg6JF1ZMlhTkaEKVXqfONfa/G0iRb06gZhwQb2DmiFIBXmetCbDcMZIR+cCSYNAI0ZhOYreZrv/pH5dNv1dSZzS+0BF14LHN/5xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xrsdcHCTIYhlEDZbwobz/KAt5BzMe578mM3o3lKzuM=;
 b=B/xSJPjpeIkJn9fyiBAb3G5c+dr1e6sGJUs9bs5LP9rNMNg2X3Q0GDkL9LMPpmOGzfXSGw5TUY/1RjS05tYPwb0z9E958YsnpqikzIkhLY33kA0Va7LfNE5cE3O9VSzSCE6REcb86VoA8G/GS7vXg0nLw+tp051CKAwSG2k1y8A=
Received: from PH0PR10MB5514.namprd10.prod.outlook.com (2603:10b6:510:106::17)
 by DS0PR10MB6948.namprd10.prod.outlook.com (2603:10b6:8:144::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 18:56:59 +0000
Received: from PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61]) by PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61%4]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 18:56:59 +0000
Date: Mon, 15 Jun 2026 14:56:56 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/2] Fix probe discovery loop
Message-ID: <ajBK-JIX_BwXw4zm@oracle.com>
References: <20260301223943.20324-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301223943.20324-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To PH0PR10MB5514.namprd10.prod.outlook.com
 (2603:10b6:510:106::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5514:EE_|DS0PR10MB6948:EE_
X-MS-Office365-Filtering-Correlation-Id: 164fb1eb-1ed1-434d-8f7e-08decb0fe0fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	i9PPfTVnfjZLj22Lb2z3jqztQv5W37Mdt85bo6Vmrp5NAdMmFHDAEbbhdA+pretX46YgjZkNRLhs+xEHhW60roWX8d+YWhxRWTxiKoccs2SgBpVoMVlgSncZ7i0iuHP5f8Nzukdd6JvzdgaarcKZGwM3f8eEvImLyVd144Znbuub0BOWIFnb5eDShusx4MRi2PeudTt85AEWaexQI1KJA+KLwLvXkMHbXH0rltcqJWENwyS2eYLeZo0aMxCchZStILLKGtK5KSFeYMdq0SA3v/N3/v5TFj2h+H7Ylum76Rt0bIySFpwNjxO6G00xG2TOjSQL5EtkscQHbzL48LxvBZB3OSRCief7HfefXwGLfyul3ykOmvNeIwOAZhK2TrpLOU+pwqQuz6vbALR1extxbNAavDNN3eA4Cm6N6VTlBgI6GOIVOQ2iQdIMtJivW6RZcm5V7/aL7gBJMGH5A7X5uTyDlE4/8bAmgOlejFF6hyVOe1DtksKL6f6GIeOKE9YP1+CNmudMfDbDgb/6+NaOVvbpvpM5nKSSrUAsq6P1K9F92c8br9aR9KAyl/ZKz8tLpKi0TJwleT9spQPWR+u62Aeqv/dN5jcWk1ng8S1Jp8DrhMp/CbEGUD/Yj+c0ZZ/hO2M+TyhcY2dbLDkKdIptoc1I5gRQfEpRTrsAjF0H1yN/1U8zkvXr+wbw6OCN4uof
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5514.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xsV0PQhInwmb7YBTok7jPE7fUZi5w9LbZdOIp5xJVqbiBI9N04Ud7TadXHR7?=
 =?us-ascii?Q?8o7dnqb1jb3VTTTT5WrAEUr7sGJlbQ8WXsRvDsp73yzNZMw53UTCfcCIpJic?=
 =?us-ascii?Q?IW9nxC8ul+/iPhEkfA1NsL9DwLJkuimhqMqmW7YVwwXTk0f+hr9kB5KWCix7?=
 =?us-ascii?Q?3ruJ6TXjtOX/Ut7W62oHxsFqMrq+i0T+JVRKMfETZhvFapSdnI8gQGBwf0Kt?=
 =?us-ascii?Q?1ktvBgQUV6ciQ8qAE1rttU+ZZ3cbHmm0agsL7gd4CSFvw0J/qMdfuCA93Lew?=
 =?us-ascii?Q?k5SPEVBk1YWgSHDFVYd5YooLUmijyWaq3Tna5P0HOl8guEF4asAopG41beL7?=
 =?us-ascii?Q?NRH9M44Nyz+Akhg1SDVh8MQEKqM2lJgZseFb3y/7xoYT+siSx1CqJ4XFXK0J?=
 =?us-ascii?Q?bh/IU8jj7TThzHjmL+RffwwY7oTHca8d8/BfQeLo+lPVOY8OhpXzZ7fpnGKF?=
 =?us-ascii?Q?+gcDLgdXdE6sWSa9GVh9/apxk0aoYtA+NMrk1rPP1on2ylqBRQwHzxELArYa?=
 =?us-ascii?Q?yr5WK0quaciazHlgjTLGibPyq9Xg0VdEiU2CIh3L2qO4J5YU4+lF0N8ll8r9?=
 =?us-ascii?Q?owsbcecRwtRqhUbilJIfteuYiSI+zTLgvxo2VvD9KXkZb9cDtEqtSujeUBuT?=
 =?us-ascii?Q?xpot8N9Nqpt6ougucHvVMTrskNE92vmalmLIQWtiutsny107+OJzz1QLWHsl?=
 =?us-ascii?Q?1bHf1GR0JMm+TjrUQ9QEo8spoXyaVBDsqP7AFJ0tfaJalO/wi+uaprJlpER9?=
 =?us-ascii?Q?t1cwEie3n3sFJQGciJmzLqPpmurIUmS7dNGkmz0wMaKdJEFSVLlFyjiViPTv?=
 =?us-ascii?Q?Ig0qDjXRgRLTNPHH6EbdSl1SerjBsNaF2uUwbl9A44zsH6PigYx0Tm7gfrUs?=
 =?us-ascii?Q?l5dep8kqU2uXhLQhVTqgKrMf+YRvGdJVEuoVmf/3EUEo9gGWDDkUu0qxH9xg?=
 =?us-ascii?Q?9q+HE0PvbTH+eE+/INZbEqfrXR6CK2gM3tzjKLcmon8m9e0+knQTygqSt77A?=
 =?us-ascii?Q?O/pF/FS5QkVoqhykViGjWbqOk6lihkNWMB+PYk/0vB76cGtYlW/kGnnJppzy?=
 =?us-ascii?Q?Rx7kwoJ2pm7K1wYODWUyLrGP2k3u3o3ZttdKPNmakfbc5rblhky7B5zcQrNC?=
 =?us-ascii?Q?tcpmPW6JmCW9aNTQkXuoiLe1dotoPHEWpoYPGLmvqbUZT+v/br0MrL/HXnw4?=
 =?us-ascii?Q?A4wnjlRWKBwYz8uIEcRrMs5EfqyuVUvmBjK40k4De9nMz/95jbwSYEmtUWqf?=
 =?us-ascii?Q?UvHT9REYG7ziY/6Vg7js2FkZFJbY6mdOKuEOm4GT+jT1a54BOAIKEDqfDO6B?=
 =?us-ascii?Q?TsaPA/G3V4wGt+eOdytCeH64x5oCoNMgw2jjXBjXapplTjurj38uXq8lptp2?=
 =?us-ascii?Q?YhX95k3Qhcm16jDVtsM8GA0UJocRCNscpA0sRG1zxSFFZwoSfOF7BsLbE7Eh?=
 =?us-ascii?Q?i5ZvCA6+SpBgON47VE9DT8sdgrjac24E9s/jvA13ZXOfKhnxxr/S+GBAQC1r?=
 =?us-ascii?Q?pNX9MgtLDY+XUq4lseUd8MjzhmfbpNeZRrcjwGFJ41R36vN2Qhl2a5VruC9Z?=
 =?us-ascii?Q?Suc44ejvtL8TThnG5QQlhNFhpPVnCXaXticQWrpJ/V3B0iU1hdApo8lkr7J8?=
 =?us-ascii?Q?LlP2H4hTm3Vk8SmjVpYxP8LbMoWSDr6/UDJseATjT1LCTdBgjWy1Mf+mGMXl?=
 =?us-ascii?Q?NTEV99I2P8D2DRzzu+zvskQf2Mu7vSm5dWxC9XfAS0fuqW8IegvwxfTTswON?=
 =?us-ascii?Q?CjQ1gApI+Q=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	g0Wmhboj+a1eTe2q3o24yHliRWtK4gyJa7oAKe+moAjrqA2+95gnxlg1q9K4tZNDkpVEjE1QlLIg3uskf438Ao4Qqb62Ymh/yQ4SwNHRO4+lcbzGJUb4L3vkNlSaq8L4ioMl39NyCIQugrHVgTKVOQJHpo/WOznJ0TGvsxzKEtT7l6KWhnknhRtTi+ivvJwBYHo2ZQ6UZrcvsp0dppv4qNujge2VP5XA/L+DHU6uDETEHeCdSIepouAlkx8jdYJ0LrIXGejtmz5v+AqGfVqGnUbl0IpEfQSyHCSIuh718GD9ALu1KZeCCQ5WHHNe0v+MHm8Rx4F20rlqeHFiDG2FJA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VCP/yU5wn8pa6977yPRbiCHaSE4F9EJ6bNqPqxSUv4gnwr+HdP71md6V/fTIBkyQn8DsvPYFMgpQm/1ESWEOAwn9NiAI/QVtCjuAgjbgENOYng7Gxohx+PwbMymCJk0gki8xKZnFptn4Yd/nvzeFE9XXdpAuWdn9XAKevy5sdNYIt8sAr9/5TaoZfswCWqWzeFT/D/0RaiOt4ydr71ExhfSzvMF44BPKPoWvhvIdxZpiEwV8F/lD6lho18PZFblzB1mf74Z/2E4eJ7bzxaXRuRchU8h0v04nXML/REXJfvUvMyhHQvoVleaq0olQAriFCuR9K3Fe5rST6ctMoKFd3f9FFDOANxxVWpiv2l/AkgOSYRt21g0h/OQcQB8CV1kfM7k72k0JgAyppUisf7zxEYCrxoh7iZoHbPZJZKCkHSuj5JUTYbrWXo/0TLfauAt8MsCfWnggNxaVumD6mNM0cXsaHHouOBvf43qTJ/QCS3/J+w5frLrRax3Wuilj023MREwJ/w+Sw903qeRL9U6Z6TubP8QKsGe4ucmJL9BPAJ9ZrvwEFwMrddUkPcT2WEuV0vuByI/dw5BkX8ZK0SJm1XFG3nhbWj2tfz/17L60ZDA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 164fb1eb-1ed1-434d-8f7e-08decb0fe0fd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5514.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 18:56:59.3924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kkDWupbzy+Ib/0YE3nWOKVeDw1P130IVlyFuoQoE42H+jro+dGBLx6jfuW8zj0f5+N9E+Id13nRJsX2gzLOtn+nNSVf3kvwptralO4KpNHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6948
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606040000 definitions=main-2606150200
X-Proofpoint-ORIG-GUID: 1JgtjTXz8BnEk5moN-BF1KfJg461nEL6
X-Authority-Analysis: v=2.4 cv=ROaD2Yi+ c=1 sm=1 tr=0 ts=6a304b02 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=3I1J8UUJPc9JN9BFgKH3:22 a=yPCof4ZbAAAA:8
 a=4wUGwJED-4yZ1rdTRTwA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDIwMSBTYWx0ZWRfX/vz2eRX1sa5E
 O1F8Rd7l7z6wFQlnrw/J5xGHG7MelGVKiipnTPxXSWU3oeCYGA+JXl7EOst5wNdSzbMOYr52qKR
 H+HPzL3E8pcwRBJjyHO/Xnhd3sFAtCpuzULV6c7YF7k4Xl/7kC2H
X-Proofpoint-GUID: 1JgtjTXz8BnEk5moN-BF1KfJg461nEL6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDIwMSBTYWx0ZWRfX4EG4rzJbQVDq
 d8cmFhe29lRSqTDpYV3vE1J02/SdTmefzfU0OmBU2eUPfP9eje/JNO6C4dTh38c85TAf63BNKhH
 Sx/okE8ELEV960moPP7J0ASgKzsRMceWb0hiINX2pKo3AcIc66XuPt0bXq9bQPrNo/HFUxlIoPi
 dkPDCifb0Sp9AOo0e5Wxni+0uHztQcc1MvUGb5amNlGZsnxQOcp74wCwk1T9aEwRpPOyycfGH3/
 eKeWc9quAj8f8kBv9asfPD2B8g+TNWaPr/pHSb0n6EMdlT5FqDBVHgbEd9KxQjLbivs5x5+LpUf
 a64B/qXdV1U/YvzvGMWyeecBchbru1sJud6A96dH5r3+YDBOnXluHSoH4fjxzDgRSAObhwKN5HB
 CqwslHAQVg5KSWMzGICSpUYD368rsoWQl+BwcOkmnueBBFOFckiASH453xWWmyP5YIUaQmsauZF
 M6q3dtGdCCPSrIahMVQ==

While this is essentially a good fix, I am going to drop it in favour of
just looping over dt_providers[] for this.  Since the discover implementation
already expects that upon being called, if new providers need to be created,
it also creates the probes associated with them, there is no need to call
it in every provider anyway.

In the future, we might re-engineer this to work differently, but since that
is not the case yet, the easier solution seems more prudent.

On Sun, Mar 01, 2026 at 05:39:42PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> In dt_provider_discover(), we loop over providers to discover new
> probes.  For each existing provider whose implementation has a discovery
> function, we call the function, thereby possibly adding new providers.
> 
> This has at least two problems:
> 
>   x The iterator is not designed to handle new table elements
>     being added during the loop.
> 
>   x New providers that are added will presumably use the same
>     implementation that discovered them.  So, new providers are
>     simply adding redundant discovery functions.
> 
> While neither of these problems apparently causes any errors, the result
> is a messy loop that leads potentially to unnecessary probe discovery.
> 
> Add dtp->dt_discs, a linked list of provider discovery functions.
> 
> Add functions to init and free this linked list.
> 
> Replace the iteration over a growing list of providers with an iteration
> over the small, fixed list of provider discovery functions.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_impl.h     |  1 +
>  libdtrace/dt_open.c     |  6 ++++++
>  libdtrace/dt_provider.c | 45 +++++++++++++++++++++++++++++++++++------
>  libdtrace/dt_provider.h |  2 ++
>  4 files changed, 48 insertions(+), 6 deletions(-)
> 
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 5282efbdb..ff730319b 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -333,6 +333,7 @@ struct dtrace_hdl {
>  	struct dt_probe *dt_error; /* ERROR probe */
>  
>  	dt_htab_t *dt_provs;	/* hash table of dt_provider_t's */
> +	dt_list_t dt_discs;	/* linked list of provider discovery functions */
>  	const struct dt_provider *dt_prov_pid; /* PID provider */
>  	int dt_proc_signal;	/* signal used to interrupt monitoring threads */
>  	struct sigaction dt_proc_oact;
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index a45908047..224f60cf7 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -1250,6 +1250,11 @@ dtrace_init(dtrace_hdl_t *dtp)
>  			   dt_providers[i]->name);
>  	}
>  
> +	/*
> +	 * Initialize the list of provider discovery functions.
> +	 */
> +	dt_provider_discs_init(dtp);
> +
>  	return 0;
>  }
>  
> @@ -1342,6 +1347,7 @@ dtrace_close(dtrace_hdl_t *dtp)
>  	dt_probe_fini(dtp);
>  
>  	dt_htab_destroy(dtp->dt_provs);
> +	dt_provider_discs_free(dtp);
>  
>  	for (i = 1; i < dtp->dt_cpp_argc; i++)
>  		free(dtp->dt_cpp_argv[i]);
> diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
> index 079265b72..f7f76f9c2 100644
> --- a/libdtrace/dt_provider.c
> +++ b/libdtrace/dt_provider.c
> @@ -231,18 +231,51 @@ dt_provider_xref(dtrace_hdl_t *dtp, dt_provider_t *pvp, id_t id)
>  	return 0;
>  }
>  
> -int
> -dt_provider_discover(dtrace_hdl_t *dtp)
> +typedef struct list_disc {
> +	dt_list_t	list;
> +	int		(*disc)(dtrace_hdl_t *dtp);
> +} list_disc_t;
> +
> +void
> +dt_provider_discs_init(dtrace_hdl_t *dtp)
>  {
> -	int		prid = dtp->dt_probe_id;
>  	dt_htab_next_t	*it = NULL;
>  	dt_provider_t	*pvp;
>  
> -	/* Discover new probes. */
>  	while ((pvp = dt_htab_next(dtp->dt_provs, &it)) != NULL) {
> -		if (pvp->impl->discover && pvp->impl->discover(dtp) < 0)
> -			return -1;        /* errno is already set */
> +		list_disc_t *disc;
> +
> +		if (pvp->impl->discover == NULL)
> +			continue;
> +		disc = dt_alloc(dtp, sizeof(list_disc_t));
> +		if (disc == NULL)
> +			return;
> +		disc->disc = pvp->impl->discover;
> +		dt_list_append(&dtp->dt_discs, disc);
>  	}
> +}
> +
> +void
> +dt_provider_discs_free(dtrace_hdl_t *dtp)
> +{
> +	list_disc_t *disc;
> +
> +	while ((disc = dt_list_next(&dtp->dt_discs)) != NULL) {
> +		dt_list_delete(&dtp->dt_discs, disc);
> +		dt_free(dtp, disc);
> +	}
> +}
> +
> +int
> +dt_provider_discover(dtrace_hdl_t *dtp)
> +{
> +	int		prid = dtp->dt_probe_id;
> +	list_disc_t	*disc;
> +
> +	/* Discover new probes. */
> +	for (disc = dt_list_next(&dtp->dt_discs); disc; disc = dt_list_next(disc))
> +		if (disc->disc(dtp) < 0)
> +			return -1;
>  
>  	/* Add them. */
>  	for ( ; prid < dtp->dt_probe_id; prid++) {
> diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
> index dc1266711..0f8c13a00 100644
> --- a/libdtrace/dt_provider.h
> +++ b/libdtrace/dt_provider.h
> @@ -120,6 +120,8 @@ extern dt_provider_t *dt_provider_create(dtrace_hdl_t *, const char *,
>  					 const dtrace_pattr_t *, void *);
>  extern int dt_provider_xref(dtrace_hdl_t *, dt_provider_t *, id_t);
>  extern int dt_provider_discover(dtrace_hdl_t *dtp);
> +extern void dt_provider_discs_init(dtrace_hdl_t *dtp);
> +extern void dt_provider_discs_free(dtrace_hdl_t *dtp);
>  
>  #ifdef	__cplusplus
>  }
> -- 
> 2.47.3
> 
