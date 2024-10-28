Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE801D2796
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150339; cv=fail; b=lfYcTnfyYYmyk81wpTW7pzhb2thQmOn3fKcveiv4h1JtLX1O7ZzVgvbXwVwXuwav2pWL7Lba3wryovTAITx3ZVQELWzWTyHN7tm6BkROEK+6+D+qanj8a3sijawkBMNPA5eDY94gNtclMP+PW9aAhVwGQj5nmzObaYeU1DLKe60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150339; c=relaxed/simple;
	bh=OQeS/b86k+oLpprI5+THuOAu9BfVRgYSF03L5PSyv2g=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OwtZ19/CqsEfoK3WVXug9Fhq+X5qD7/IpamU1yL0x7eIRsBXSdY8sjTaTlaMQv++bvdja1OLbcpJVbtf6njoiGCo5HDPIH/JcnFWMfFqI9cr/6PECahYWW/FQSzqI9o1wBeYZv6lp909g3eF9E3qUl2Uvp35YsoDuWuobCFRf7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Y+N5AVlK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=AwcVeuCT; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Y+N5AVlK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AwcVeuCT"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKtcK9001657
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=4V83XZR+BJTR/m2X
	zWdgm/rCd1b/w1+oLzJnTpjMo5o=; b=Y+N5AVlKDqkpC1cZs4hcB22WQ7BjDh9V
	A8uMGf+bQSPi8S5VM8QvR+PH3cWQYzWGYHMVCs0TXVTTdlkvEkjJbQBRjdoTKQKw
	viHUNznyjsy8EK1Q6yTSun9cRDzfFMkq+QxV9c5q6nMT4EDg9dGVPCZVAKx/ti3x
	7IV6KHwT+4aKb21rSRsKBFRg72ykL4u6KUeN+Hm6kROAunXHxPFsHA4ksKnn57Cj
	+ksb1dChDQEK9hiF3jQOC7LJfudpd7+jhgX9n/UYbuze52ZOZfM/W3E2Xu0dstK1
	cMESVjOksqankuT3IAtMuzIydw5CDXE5Xfh6oFm3/rcbFnpAr7aIVw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdxm1tf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:18:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SK8B0t004792
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:18:55 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42jb2t7gpf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:18:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ouh0GTamsLVO5uF2r+cUx1+ZHGUrby8z+Mq+CHQt9RFmLuUD2/2oWcWCdI3uM+HhyBXWZ420mDX/LrubdXjqHcjF84d/D/o8cbFXKV5DMQ3uhkS2QLi3M9WesXKjhbS7JtUD3UaQOuu16SkVgr0gWVoxluT0d81lzO7cLrnUavqXw+2Wt7O+NnV7ocVTgxoO4bHLAs+6fJKZKYEgEAqv1sb0Po1I4dGMDaPo6gz5Si8yyvJiVXxR5TwsrsFDPtG4QRFNmFZPiawO3KMtLj9KtnG6untnOTT3YR/zylp+grXG9vaAZePZlhgE5qdqA3Mvu8s7QUBtJVZfXXcqQ2VwBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4V83XZR+BJTR/m2XzWdgm/rCd1b/w1+oLzJnTpjMo5o=;
 b=vxwIf64PuPzXgBsU7IRq2J13zT670OPdeS1Vy3wDm/eK9B4eTrBAqU3O8FBUG8XVGW2xydxx1YFjiytJ4M14Ya5+PpBD/O2NvnM8pBWIFFauFjmnbzHaA39laVAWvRrPqoRzbvpC4Vsk5gGh/oD3E92hMOHYNrEYmZC6tCIEb1FthMkPrW7YGExMtfO6etLKAcAfQz4g7MperxmgctNA4D9BVnN1Xh2h8WYqmy9YzstN8r2oJavzT8G5sYDJycbp0yEmn/3X+LYgk571Fi5nR4Fk6iQ3sAPJfbgOqtuppMw30IqbCY+wZUhWPEAG51MoNI4rZheqrOVKe3pl33H0DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4V83XZR+BJTR/m2XzWdgm/rCd1b/w1+oLzJnTpjMo5o=;
 b=AwcVeuCTsNHY9wQRaLYv0jB46xAeDtSkbSwJKh5iIBk3hwgm00M6CNn0oUm8ElK4bbshfy/YQRXrS99zC/9dVY3odkE0ZP/ySZRi9EwPNFV2rs0vJPbTqLevEAss15jCVEM6467gFtNFMNbT9XN6i+oT4Q76el7atHIXPmpk9Nk=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH3PR10MB7354.namprd10.prod.outlook.com (2603:10b6:610:12f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 21:18:52 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Mon, 28 Oct 2024
 21:18:52 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 0/6] usdt typed args, translators and arg remapping
Date: Mon, 28 Oct 2024 21:18:43 +0000
Message-ID: <20241028211849.458862-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0053.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::17) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH3PR10MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: deb7db93-4e72-4d8e-6792-08dcf7961f67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J99XXv3/z+fXH2R6J6QCwURjv7sZI22TithYHJzj1Qp9rfha3C32slHaKqn6?=
 =?us-ascii?Q?omQH+klf4C3zM/C/90h1+i2ZQiE5D7w1NjYkmivVsnwhS3c8x572zSoaWyQI?=
 =?us-ascii?Q?WVwn+9toLP/Ux0hUNArhCWI++GjXS/M8ZQHmf6oiNpq4w5Jr6k7UeI0g5cNd?=
 =?us-ascii?Q?cXjvebgzWpjx9Sg7IgDVk9hlZRf3w2M9YVnHpRoH/2G8B84IWbXcxqPXwXcG?=
 =?us-ascii?Q?+uWGmarohdPWFOQf+IcOiRv89D4BAtd4cc2dThL+1gd7peTKraCwfmH+e0Rq?=
 =?us-ascii?Q?aFi+eRI2Pi1is0i4jS72Rejb+pdE8D2gc92cdYTlA0HbltKDth1GCPzlc88x?=
 =?us-ascii?Q?TTV59FygKPHa3jV7xHfs7DiNp5/swY9alYPPTUdiswy9B7ZqJBfZsFbNzXl3?=
 =?us-ascii?Q?WVv6H08BXj9fAbCdvyWlFGpXpsqeuLiZbov8y5ohrBVoYDkFTNeKPGhMpeAV?=
 =?us-ascii?Q?ZPSKtoW7vzUs6JbLN4DfQ60vgthg2Mowew9zHt/01uQaNF35j1frM/6/vuAO?=
 =?us-ascii?Q?tetgEZKDt/nfDajQls2qzXb1QNV9+QMPLfJbbo6WRapHMBXjtoahxw99c5//?=
 =?us-ascii?Q?ZltCybF+C+NKY9XsKJDDXrEQgTPQ/6MwhksKlQbiuerES5fBrni0CHnHG3qo?=
 =?us-ascii?Q?z57BC58MnfjdfKQ/+5TtB9fUrV8+Rc2zK+cYWsby2Vm9xRJ+icCweuphJ2NE?=
 =?us-ascii?Q?qPRLlBdRSBC7QnBWVm5gYkHXQ1xQuyKH7j6hJwDx0mZZJQMzGKZfu5G3cZEH?=
 =?us-ascii?Q?7KncG+2xR0uk7+VQx7VCtE1/h0A0NYVQb2D4JrTFwoP37YvrH5dkdsK5UFb3?=
 =?us-ascii?Q?2qRqBSPuNgmhzGtAoPX4vKScS3q4wzFkdHwG0Hy2HbO/WXZN88QEvSWcG8fD?=
 =?us-ascii?Q?EztL4efvv37Uyq6RoNhko2NTqn5bwRw7eQY6//wcZj934bMMdX2/RAdBqaSW?=
 =?us-ascii?Q?/CtX3SWpgmKwaYbXCHoKaRVRxciMghXnIDxkP+e5ShjER4iEBieCJ8N+Owqy?=
 =?us-ascii?Q?WKq7+xdwzZuh2X9ojMOWHPUk7fHihR36PyLwgbiGXIzmGkfJpsyH/oGGSbmm?=
 =?us-ascii?Q?Hr/AxY7p74kOzl6xtjph8yf7EJeDz8Jsh9SIzIj0CWwuGGPdHs41whRZlS6T?=
 =?us-ascii?Q?bHra6t/2czLkZV7mXWm28ACUn17B0z36Z/F6Vqo+q1WRZGtl7YrIvlfsHxzs?=
 =?us-ascii?Q?iPhKU1oa2jvD+zJf8qUePjVP+/4Zd/uv7m8UJP16di0PJGjyNTVP3YGY+L11?=
 =?us-ascii?Q?5XfrXH4QbngCHn4eg4P9CBMo74iQDzFjVceV7esXx89Bdh0MQAOLwcG0YM4r?=
 =?us-ascii?Q?AduGs6Zer2Hr8eOa63O8/u/K?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S/C/Ex4PlEwIRHYNSYYoHyZhwC0TksE0kdtE+VAUq4drf0EZuyzvZ7Fsy0Hk?=
 =?us-ascii?Q?PUCob5MXc5QuK4nPtINVptoHSQAzY1sFda4X0Z4c2DyiaIUuHiCB/bAUjg2j?=
 =?us-ascii?Q?1nKdHo9GbitB3VdaQhZofvADQwpBImPuU8Suad2hkdyed05xEYY2n9Ls3uvB?=
 =?us-ascii?Q?0gSiyyp/EhOU8yFqlaPQ69uWqTu3IGBEN7IKr5riIa7oAn0aJ87tx/yZe2lY?=
 =?us-ascii?Q?dlmLG5DAlQOOGW2hPYoJrCFP4zLzSoU1MDcDRdAfW5ZjznZrhYS8yRglkQrx?=
 =?us-ascii?Q?yl3dH6XYoE8tcompfzrwzuCb5w47cv70M1IQaZuNT0EiqVksHaVKMXHBYF5t?=
 =?us-ascii?Q?+Pcd44cg2yytIVZGg8OGTlXOPaNHW/b3s8bt4axRLCaqVfIMYsZR04v3qrrj?=
 =?us-ascii?Q?exJpue9cvcNTlmfA/jhgbMbMYlSCNldBKldIlxuRWiNMIORHIh0J7nzNZx3b?=
 =?us-ascii?Q?p4YnYhDbUhFbUzU454N2eer2D7FONjUNk5gDt1vz/sGAHqoU4peh+kEoR+Q/?=
 =?us-ascii?Q?an1c/S0eKc6Hr2l2befMd+ScTDDZxdjjxrKYtnicYobYPNMaPfWXKugbY6ox?=
 =?us-ascii?Q?BUuVZcI1xyXtzHwayCR4nAZp16UKpTgLSqpeiGz8UHy6DR1lBsdM4pebgRSl?=
 =?us-ascii?Q?T03a5WwUd5kaaO4odUklgyMWfa1EoG+QEVIbqYfyGsWPgVA0pzyrHNvdnosI?=
 =?us-ascii?Q?RcE/V49LYNfwoxnjI5AvYhROvaAPpWq9sroA2cawisxzQ2H1dDl8R8898aDc?=
 =?us-ascii?Q?iNn2W0UZGfs71voMVV1wd3ybnJbH4ffmQU/sR/LgMPzM3YaWrPQpECDpMFxm?=
 =?us-ascii?Q?uO2rqbh3ACvKBbRdaPDGr1hYcA5rZVqtTiv8DBXdijR5tpQlgPnSaQJNhXO0?=
 =?us-ascii?Q?Wm06OqlHyfo7L0kV3Bs19jkB1d8sf+OLKcgRMKZH+29iRy9wkG6/Cna4Z5Aa?=
 =?us-ascii?Q?tOseR+aIyrAweZ6ZY71ByjrS+11f6ev63Y1JfCVWCzGLRwWHo3MXSSLNX+v+?=
 =?us-ascii?Q?xdqJZtgQIn57j11jD6tKYLiNybqtTCFgOrDsQHnHUjJ1tBR5u9y/EVD5Hbsr?=
 =?us-ascii?Q?5HOkIUvS/W3V2Thbp6l1GEgRcPSC81Ll3YfY/Zbmgi8im/2hB3D5mtqLWxOv?=
 =?us-ascii?Q?inJuk4Dutjf9mw+hsc0T7pNYD2RoQKs2dGbNZumjZD766nwyZCkzXsx8FKbo?=
 =?us-ascii?Q?kOabdnY9gHEvkHd3kNGSpd7vLt5mf8XiuAHqTrGMfqcXqQZ6yThS3A54TQB4?=
 =?us-ascii?Q?eagg4pTbKsX0d0YKcYw5ioOtaMyTn8SZImCF+D4OCG3rYmJ0SbY8dHLciqr5?=
 =?us-ascii?Q?+4k29So+twCixVVc+ZNWiojaygFJkj+7hgs9MZ5wgGVHSPz4S09oFPh3OYhE?=
 =?us-ascii?Q?26waKAc1sDu7SD48g+6Vjd4XFSVSma7+OLL3WIkNtXrcgthy/GJSBtaTmmTA?=
 =?us-ascii?Q?UMWTiIZqNOrzP3OMcvmKjg+ZIbs9WLD2Lv0nZcBOD3E9a3xSYrVyQQJz81jI?=
 =?us-ascii?Q?A4NVUkVvIxxUGhggcAHURcqLl8BjCUafOfNzqy99d3erw388oX1sNK+XHZql?=
 =?us-ascii?Q?6m9LcaimvIFgw/pXeCtjsAcN0OCI5mu/wfqCIk57Zu/TwE1J5CzTzntZooYN?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kgfc1l0A6+aXAa7VcOaZpIiAnhACTm9Vzo+URyrzhwoBchua4064CIIOJmfN9pC3evch30FfWc7qWn6fAusaMrQEE59UGoylGz9YJ9VpOTdpSK1Y+cD+AqqqsvB+5uVGUj8flPhsLF/xYuv55Gu88Fhc+GkgrkAtdf1PzU+HOefhA6ooXk6VKcfwyvrrZ84bQQr/H4o/ot7555wxEFsO7Q54BmgX1+Oj7esa44O748sWxgMvSw/au5/g7krAE/v/Lqh97MpDrzV7q2ARKmOYigfS+NAjREEeYZkuFkv6Ndlu2bNCET32WqK1WTF80zUUd4nzWllv+V4nfLvHoo/Y/dRFJVa5S5a3wJQMHMT/Ui7Z9uWL77HYROpjftWBd1hoj7ngb+gRnFiUwDDXuLQ4n0o/L/XnKOu2e+7jdV3aG2m7vHbzkxsh/nqYgLD+HD8jbjFfCClXoMTFJzoZfIwRy7JE6YO3tfd5c3VPrzHcv52UKsMALQQY+QAjVStWRrnIs/rGmoBCVWwGPKX8PtSrRP8XYB4+i7oa6eXqrOxjg/oB2SOJ9XjjlSdUGxNU6AdzbC3navzREPKIe3YQBxbzvXbVEWgAFN/BA79P1vXsnWw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deb7db93-4e72-4d8e-6792-08dcf7961f67
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 21:18:52.5483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VXxJj3Iv7pEFWPx6AK7jd0HwHMI6IBXrfONMG69KPVRTybjexpmDjAgGIAs4dfTU9pb1zKIGVJDD58KTVt4Q2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7354
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_10,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=870 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280165
X-Proofpoint-GUID: I2Gl3oRPOTnVfTCBWkPlkItwIKqEGx5S
X-Proofpoint-ORIG-GUID: I2Gl3oRPOTnVfTCBWkPlkItwIKqEGx5S

This series adds back support for the probe foo (...) : (...) syntax
in USDT provider definitions.  The dtprobed side is routine, pulling
in the DOF and adding it to a new set of dof_parser.h records fed
through to the DOF stash and ultimately to dt_pid.c and eventually
dt_prov_uprobe.c: the end result is that the DOF for a given probe's
remappings ends up in the dt_uprobe_t in more or less the same form
as it was in the DOF.

After that things get tricky, because we want to remap not only arg[N]
but also argN references (the single existing test for USDT arg
remapping verifies that this works), but the SDT machinery depends on
argN being unremapped!  So we do the remapping in dt_prov_uprobe.c and
tell the higher layers that no arg remapping is ever being performed,
then do the remapping in the trampoline by physically reshuffling
the arguments.  This seems to work without breaking SDT on all supported
architectures, and is surprisingly simple (at least, it surprised me:
multiple places where I thought I'd need hundreds of lines of complex
code turned out to need only three or four lines).

New tests are added to verify that USDT translators work when types
change, and that dtrace -vln produces the right output (all previous
tests for USDT -vln, translated or not, are currently disabled
because they all use wildcards: this new one doesn't).

We also fix a couple of tiny error-related bugs encountered in the
course of development, one in usdt, one related to the print action.

Changes since v1:
  Adapted to review comments (all comments but the stuff around
  trampolines and arg mapping, which I don't understand well
  enough to implement)

Nick Alcock (6):
  error: add missing EDT_PRINT entry
  usdt: get arg types and xlations into DTrace from the DOF
  dtprobed: stop skipping zero-tracepoint probes in dof_stash.c
  cg: add argument mapping in the trampoline
  usdt: typed args and arg mapping
  usdt: fix create_underlying error path

 dtprobed/dof_stash.c                          |  21 +--
 dtprobed/dtprobed.c                           |  10 +-
 include/dtrace/pid.h                          |   7 +
 libcommon/dof_parser.c                        | 145 ++++++++++++----
 libcommon/dof_parser.h                        |  64 ++++++-
 libdtrace/dt_cg.c                             |  36 +++-
 libdtrace/dt_cg.h                             |   1 +
 libdtrace/dt_error.c                          |   3 +-
 libdtrace/dt_pid.c                            |  60 +++++++
 libdtrace/dt_prov_uprobe.c                    | 163 +++++++++++++++++-
 test/triggers/usdt-tst-argmap-prov.d          |   5 +-
 test/triggers/usdt-tst-argmap.c               |   5 +-
 .../dtrace-util/tst.ListProbesArgsUSDT.r      |  34 ++++
 .../dtrace-util/tst.ListProbesArgsUSDT.r.p    |   2 +
 .../dtrace-util/tst.ListProbesArgsUSDT.sh     |  83 +++++++++
 test/unittest/usdt/err.argmap-null.d          |  40 +++++
 test/unittest/usdt/err.argmap-null.r          |   2 +
 test/unittest/usdt/tst.argmap-null.d          |  32 ++++
 test/unittest/usdt/tst.argmap-typed-partial.d |  49 ++++++
 test/unittest/usdt/tst.argmap-typed.d         |  48 ++++++
 test/unittest/usdt/tst.argmap.d               |   3 +-
 21 files changed, 746 insertions(+), 67 deletions(-)
 create mode 100644 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
 create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
 create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
 create mode 100644 test/unittest/usdt/err.argmap-null.d
 create mode 100644 test/unittest/usdt/err.argmap-null.r
 create mode 100644 test/unittest/usdt/tst.argmap-null.d
 create mode 100644 test/unittest/usdt/tst.argmap-typed-partial.d
 create mode 100644 test/unittest/usdt/tst.argmap-typed.d


base-commit: 8a1264bf0e818c8624be250eb5174714b62ed93c
-- 
2.46.0.278.g36e3a12567

