Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2978429B8D9
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 19:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752693011; cv=fail; b=fHEodWSR2Mqkbwn6DCYH63Km1E5NG8JGoh1TdUrHC0lUb9LglcpaRXvlYdrq2zii/KxRNf3ty9l8Sc0PaEAX6P5/ixnw9tT5ckqzs7eLhj11I96ygyBPysLxoZ1BR2FQrQZlCfpByHxvikB1Sm6eXJJ9yJBC2eha6gWKmRDbxd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752693011; c=relaxed/simple;
	bh=Q6b88pTjieabplFDEaQlXaW5qE2+XEm5Zj4vTdyrM+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ua+a9oy2Ems5Tyqo+obEsU3diX9W5Civ2xof/zRxJpbJ470m/izTYMIriA+QFJHRXCeljjPCYJ5cnHw8+MM7W4iYBnpn2es6Bn0pd0ZztW/1BWqMuuUB+5tZ/I3llSebx1OHAfLp781f0oV6o6z0ygL0+ROAPMmOVLRRKArMdAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=J+pT5gcy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ytkD/S9w; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="J+pT5gcy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ytkD/S9w"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GHfjt5012819
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 19:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=5comdWS8wRKm8u2fkR
	nLDuDMORpYUNHQxDVyHaxwzdM=; b=J+pT5gcyZa8gAutny3C7IKAWRjYxzc0lK0
	PdLoxZdonAlfyTjIRvPe/VKRNe1t3V5oYYfGQBnui9naU5EOGwniFSiOkWYS1V1f
	0iLlJYdsfFalrqXR3zl13Qo0aF9cdN7X0nvyRNhJgGf2jopsL0TIRrM1HHZsFwKe
	cldPDbjDncatWx0azW8ymP+GH5pYj6q9De+2b5eKSHnbCR5BTTCCOLldUuYiQtPp
	CpMe24bZxiieAfUbfopIFwWb3umNKAInwiJWvjlzoX2SIh6kPxc12Mk12zokMJi3
	drbk4BUb/CNu4b5EGlQQ/qfpnHBcQqT6L/D/fBwZ4hTyUuEJ6gwg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uk671aug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 19:10:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56GJ9BaS013044
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 19:10:07 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2077.outbound.protection.outlook.com [40.107.101.77])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5b8tt6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 19:10:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBHkkzRSsrq/WN6GbwQdj4WmBMas7WHkWsCRU6WwhrrSSpHK9KSIVMsHRcuMU0mivfGkCf7IYs9demd13SNlLtMhjU/+VMAGRGHFh6LNoMe/tINoZRqTDvpijxzy/DifwecAQB+EicoAZUjgIHxQfLyCd6yJBNeAzLttpkvJW4JEuuS8zNzGI2C6siYGQPgb2g7x+giluZ+r2crET/SCHkVv0mJ64u/V+IVc6d6D5f9zk7SYoSS41Ykhxn3Bm8uhruENO9k6kHs6iBSYWAjJL5S1IgVaLEGjapMmxl9qOlGFd87UWRAntQ/XjghXZaOZi96pxV0J3u8a+BfQwapbmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5comdWS8wRKm8u2fkRnLDuDMORpYUNHQxDVyHaxwzdM=;
 b=Uvpwyayr7VtWVxHWmKE1PmjojPSQ4P5u9IOsbwRL4mJthYZ1mMsu6r8SWfX+Um80PyFmG56v+WLN7aHt1V2ZC5V+yr6eBlyJDKuZpZtWXGDEIvTs+VIBcELJ5HY81x9AwjOCiZvzv9UcdSa8h6BT/lNGqNc7Pys0AF+cira0J6yAl68tEPC0Gc+DRNSFjXJptEWangKaWtzGPAUNITWwG8reo7RtSZMiljCL/9767QjKmJor6WgUIoGL/fOobP3DnXgWsfu0utZnLRHStuSF+mr5PEdIk1VtQPb4bO2pSbrwLnc/jbjzC6Hb0dYueqyRi3FwFZAjTHl+6b9/RnxCRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5comdWS8wRKm8u2fkRnLDuDMORpYUNHQxDVyHaxwzdM=;
 b=ytkD/S9w2QLGCD6Vt0glPbuuDqT6J9l0Wnjnf5A+k/4UvAqW++c4E+eEcrqWQqxjvS4Qr98dPYnp3aurUpu+qIH5gUL4D+1a/E/2SSYZaYB+4QP/L6Jt7KmTYAx2Unc4pwpuqYz2xlCJIwzJsdhfzyqqDfEfOFmg2A1Uyt8pYWQ=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DM4PR10MB7390.namprd10.prod.outlook.com (2603:10b6:8:10e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Wed, 16 Jul
 2025 19:10:03 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 19:10:03 +0000
Date: Wed, 16 Jul 2025 15:10:00 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 1/3] Cache per-CPU agg map IDs
Message-ID: <aHf5CFrpkCFYlz3F@oracle.com>
References: <20250501182252.27772-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501182252.27772-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:208:36e::9) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DM4PR10MB7390:EE_
X-MS-Office365-Filtering-Correlation-Id: 49bacbf2-7790-4019-f401-08ddc49c5e47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Uai9CxTppE2G/Pcg/3i3XytWhXuhOhNJf7BumyGe/Xa1d80KmurE4dvYydTa?=
 =?us-ascii?Q?KFVkDl4VIX2/dgKMP0t5PSF2Rbu1Ccvi9mDIAQ7aQiz3YzqHzyOU3pUjv8SG?=
 =?us-ascii?Q?GMKypYZ/11hiryjc2qmO0aqQH9zTiJAtjCZROg/qZD9vJv/PNPhLmOpe8FEb?=
 =?us-ascii?Q?MYZlIdgXsFcZJfxLJDdBHPHNeV2a6LpEtD3PtNBhIM7xuEgrk1E133Bl7glm?=
 =?us-ascii?Q?qH19uTt3j4Z+/CeFtKwhslxCWrZJGIc2lXIPMehKyx9bYIr9ZVOd5VWCuUtv?=
 =?us-ascii?Q?h4rT8BBvt94ptSfzEU7hLM4B8Kh7qENufr5pu5LKu/pwWq6deRiINxZAomZx?=
 =?us-ascii?Q?gv/v4Dl9m5Cb0CUKlsgAk8uDLzN4gz+U2ofXidNE96KgfCG5F8J398AHgovp?=
 =?us-ascii?Q?G5F3Xrbzl70MtlcFwXAc4AzjAgyheCHoPQs0DoelYnk4IKjgb75pqp9ecZyz?=
 =?us-ascii?Q?oUN/ZW38Qc+mMi+J0QJggMQ1wmfnHokWDhKlFmGhgEo25pbyva71OZ+W0Ake?=
 =?us-ascii?Q?9h9yq+WYIxhgZ17qXxdK6ZujaHHhMEq1rZAcc2uyw/+xdDANRG+BjhOjqeVE?=
 =?us-ascii?Q?3dR58FgOOwrqUlfiTO9DoDQORTGc6tnQ8H2p32FbuaMVsqHEFqSgsQHL3mh3?=
 =?us-ascii?Q?ftm7NGaAshmJgl9+KELW4cFDPmD2ZD3rDHR3xgPbyqVk1Jr1t5igLJMom+tV?=
 =?us-ascii?Q?hFmjoQZngbDK9zl4SQNmuoyWj1OcwDnpbAfbBew+91g2fK3qkmNKTbIgfI4T?=
 =?us-ascii?Q?HUCNxiJluOWmnRl23foGHnqbjh8sA0zgtkgW7Rv/lXyqzmUbI4rQQFUEfZyU?=
 =?us-ascii?Q?Y8PkGgaxw6sC4hGD6wj4keXRomc7UVmkAlUEFs0nSa9nW6QuivAcHfeYXW1c?=
 =?us-ascii?Q?xj0sC4VI47Ac00O56dy7GA9NacIiKTimwAe3BdeuzqqUGVaCmNsSopbmbhG3?=
 =?us-ascii?Q?NMPfyk9OBb+97F/J0aPSJRAkMAX6UpIVnGR6232B5OGz3An6AoYEdXlBvGRW?=
 =?us-ascii?Q?3zrfoCdS0nsLnVAQTdzbT2F1rla/hoGXVLbZuMFj/bDCWgf8QuUAhgxhvV36?=
 =?us-ascii?Q?xP6U96rG28I0S3j4eoI9zeJDfRCtvpi8wF2WBV8suIavbCq2Vklv5fuorGc5?=
 =?us-ascii?Q?8/ZxRfc54UQyaGAs3S1n9FzeHJDIBNffh1n8+/RronzKI7nNiIypvu3W9vEM?=
 =?us-ascii?Q?1+ZFPItiNHqENvM9Wxlsc/j6p1nykWRIYvInwLET//aSxzLxmWwapHQBL0Ix?=
 =?us-ascii?Q?wIBxKbjv5GTwKtqyWx6c1steSpov7iBdaMdC9UHWAHrWVXbGJ3hF3m3J1j+n?=
 =?us-ascii?Q?ny7iu4xGxdZ4jHR0aWUpGpBBIxZta7l3YO4e/0EUcKUaTrPVgN+IFP1MvA2z?=
 =?us-ascii?Q?coyAEK1aIdzoDY1uplwb4OENbs8XeOps2FNoh0c8JmETzzfUr9hT6m7lEUvm?=
 =?us-ascii?Q?VqahynX7UWw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LajevuOHRbRfOodgK3NDw2u5PzKmptb/I44+XZfKiDn4h2O0fEaN7Tn4y3mN?=
 =?us-ascii?Q?sGzTtKz5mlU+6XbS2Czrb4x0voCGG6FIcasaMv3wrvWTlKNvVPpZIc4HEzFK?=
 =?us-ascii?Q?1uN6iY3fnybj0nd7ZMXBH1KfvbHAnYx99FjFeRFsESUojdgOMYUQ+GQNjisY?=
 =?us-ascii?Q?jRCklSb8V8XG8aTEIPvrJ6jPAcUouh0XjFluBRMJBfyjNIMKLssxWN8EMgS/?=
 =?us-ascii?Q?Hckj6j33CyEbNknKD+eRYx/s/gVFzRhVHAIRJpawb6x3KpUzPUqddpmrMogB?=
 =?us-ascii?Q?IkoPVhl0t9L7b1vACitbdCAGpMuACJYTYzhYJaO70bwVgR5iatp+jcXiZO/U?=
 =?us-ascii?Q?yHvCDcxLGZfuK5JirIVPWiZookeSYJQ76dWFkksIMZec/kkGkw1EE9VoVhSy?=
 =?us-ascii?Q?5MXSFHNpADyM0cOBRutRLLKD+A1U1fJpLNn5gWmys3QiIJjPXuaHpIoHVfMb?=
 =?us-ascii?Q?rDTPPTJyCknOUVXlGJTnJIUtmBmwzkv09hg2M2nO6ujudhoim1SxRUFEL9iF?=
 =?us-ascii?Q?+hDlk6dUsgWL/7dMVOTCyl4eEMT6KelR+2lEuKDWO0wkC9Kthx6vfma/9izP?=
 =?us-ascii?Q?CJNzBfidQaf8G8xCFpsfEdp0X90CauPI3RBOQWMafx2OHopyBBBlHXMfy+Gi?=
 =?us-ascii?Q?fO8QZ9YotmzpIxz7zOXJ6C1k5ZlIgwpZD8zIo5y5AxMgan3y5/dTPrgC8P+/?=
 =?us-ascii?Q?hFdHplzNN0FGGda7jbh/QASHMLgSMWwMYCbtCw3BdxxKuZya31bO9xxhPr4v?=
 =?us-ascii?Q?enyHutJu1KJ8HMfsDpkGEU17zNwaJ/7OPZNUTzyIytIWDLmMh/LgsA1GMYb9?=
 =?us-ascii?Q?Ki4Ip9ypeVQ1vVfDCdEkR1Y0pBZhjpqvE7vev2gVdLwh8ghUz8x+cwAJNq5v?=
 =?us-ascii?Q?bTbws2odeA4f9j3KxBcuyFMUCUXqL0TQnK02OX9nQ/GeN3XePo6AP1A5L9EZ?=
 =?us-ascii?Q?rWMdVKGk2fi6qCSQvIJFulutvUKqWRYhoX/FX6eeTC0zRD+bZu8VzTkWs3iX?=
 =?us-ascii?Q?Jn505bYCBrvxCRvvsoFy5BHzT2p59nGAUZjZH/qeNaoO/587RhO50pChWVtT?=
 =?us-ascii?Q?IKHlu+ERccqvJLLw4b0dvTRJOTa1VimEAvEuTvXOX6ytTdTX7zeHgJAXaYoh?=
 =?us-ascii?Q?UpU7szbIO8DRlrDIEMWISD9MGcCxETPxzo/eOl6UPa67+ubA3thx/SB33w3g?=
 =?us-ascii?Q?FUTTwpvlwFTkg3rgpTiofUi2gpUBUo7TJdDiKK1CfmjhP7ShKH6/ICQbFS46?=
 =?us-ascii?Q?TvibA+HXV0nsT/FnjTojnrdST+7bQi/NTfmlnw3vRu8+w6r2nmK0LTFQKVWX?=
 =?us-ascii?Q?t9GsIqGvaskWlY0Mjb8ZeZDdvdynFuf6qUupGvu6glWr6l4yM7j8NBKj38Fe?=
 =?us-ascii?Q?Psh6yRT3As7bq8zLE9nwsS0X6WYrZbiNblCnkqLj+mJfWEvZR0xlrle7qeNW?=
 =?us-ascii?Q?OjoKn3DR9VO1hAKZcHal4c/Obhc3rNs/lUcuP+aUsxRYg5e45kNPPG697gI+?=
 =?us-ascii?Q?6/JdBhpez/a0hf5u53oLeVDbefnhdXrrdkpW1CURq3EoawBmTxr5GLMtn+Yo?=
 =?us-ascii?Q?wBZYYI/rqcQE7vCOhoIxroare3U2epBeYH+y2rtILDEOAqx/7m1ZWekTTTVS?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	02C6pfK5p9+jM34Q88syD9gHs/o+/qO2PyyaNH42OqmfCtUIV42kz/EwXwVBwKqNlWnT2lSb35lqO8WHTm1lo5VgoBFM/mYhvozXvxmF8mLdh1wJMI7Vrtw64rTImD/NlLJwmhJeSoeFI70Lb4bNzNccHWSiTpXPeC+pX9yWIW13IcWPY38eUMxZypuW6LboC+mOofnJx5BDMLF5Og8auLDjKxXQF8LSG9sJmmxZpXmybGtlnl6Y6brwh1Umqva7gChzUiZ7lkz0cdN4Rjg4jAY9zzCG12LZC6dn/2A8cGRA+e1reSk2UG9dPqALxukIDlGL0s5c1PPOrGlyF3E2qx6lp+Upm3TM1P4GhyoY9CbR82hEh0q/2kweTb+2OYGj0fySZLKDXjeQwVBn4T8BzY2Aa7Ql6UW4JNw0D+zks4GqjxMhOeKkkUprg2XVRjxu7A1/Dr0FmjEuydLPJhJmlDwsC7Zw+1b1f/pzZGnJXT4HnwKcEBnKm+nTDTPpLHtmcmlB+xh5FDKt5G/lo5W80YKj+kYgPs77iCIoCVYVwG6TurXYFsm0AOmqBaOHu70l2h+gfw/NILVli0UoghJih6s5kC6Zpzy5fk0CiY6qfhg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49bacbf2-7790-4019-f401-08ddc49c5e47
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 19:10:03.3308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 35Gh7HkmGTRgTMQZZK5ClRxbAOts6sUMqf+e1u3Pt7EZ/VXMwV0eo4PiZV58g399zvaArIxTTSTLJy18+n3Erh895ltPC+byVCVpfMJWgZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7390
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_03,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507160172
X-Proofpoint-ORIG-GUID: JioJsytDQDlvPsZws0mkiP9GBlaSqsOF
X-Authority-Analysis: v=2.4 cv=AZGxH2XG c=1 sm=1 tr=0 ts=6877f910 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=bM5EEiRleyLCrYxGCLkA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12061
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDE3MiBTYWx0ZWRfX8o9cHLkYZW/B iExjAiU9yaGPdUQ3LndgYrKAro0hy6VsZDhVD3Ctn7UeFCle4Vt8R4+6V03L+bKTBTKrqyeT4IQ 3J2Q83EB29yLl9DcLUSxJpscEIMhrRLviW8lolnMq2hbV4wE9bZoWtEnUxj6RU3XbFnidyffLMz
 J0ZZ6BvQqcjZn9MECEGSjSBn2ypEOEtNvweeuHVSqesZyuNesPJjnIUbp/sJj4cPttSdfWIq4nP 2jZ7BzBUljBoFK3qsLQkwhQ8l54sDJAC6te5UBJVNc4xQASZ8HFgijsJRm10ocDHETnZ24i53Gq 6sU2/GnBX2jyi+X7ShgHh+1F9tea88iCklbAiq77DAb7eF45t25sLQccAlBLYdEqviVbNcAq1R6
 BgAWIPhvBNslUTM8Yn0SrephHyKh28BJgbbWWFCxHL0nm2+IpiTGIKGDbilLr/9EyYfCS1AE
X-Proofpoint-GUID: JioJsytDQDlvPsZws0mkiP9GBlaSqsOF

On Thu, May 01, 2025 at 02:22:50PM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The dt_bpf_map_lookup_fd(dtp->dt_aggmap_fd, &cpu) call that is used to
> snap or truncate aggregations takes a few milliseconds, which seems all
> right.  For large systems (e.g., 100 CPUs) and many truncations (e.g.,
> tst.trunc.d, etc.), however, a trunc() might end up costing a minute on
> the consumer side, which is unreasonable and causes such tests to time
> out.  The run time is due almost exclusively to looking up the per-CPU
> agg map ID.

Of course, we only go from 2 bpf() syscalls per call to 1 bpf() syscall per
call.  Have you collected timings for the two kinds of bpf calls we use?
I would actually expect that the larger cost lies with the
bpf_map_get_fd_by_id() one rather than the bpf_map_lookup() since the
fd_by_id needs to allocate an fd and link it with a map.

In all, how bad would it be if we were to just keep the fds open for the
per-CPU aggregation data, and not having to do these bpf syscalls at all.

But we could end up with 100s of fds open of course...

> Cache the per-CPU agg map IDs.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_aggregate.c | 5 ++---
>  libdtrace/dt_bpf.c       | 6 ++++++
>  libdtrace/dt_impl.h      | 1 +
>  libdtrace/dt_open.c      | 1 +
>  4 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/libdtrace/dt_aggregate.c b/libdtrace/dt_aggregate.c
> index 9e47fcab7..86f9d4d5b 100644
> --- a/libdtrace/dt_aggregate.c
> +++ b/libdtrace/dt_aggregate.c
> @@ -800,7 +800,7 @@ dtrace_aggregate_snap(dtrace_hdl_t *dtp)
>  
>  	for (i = 0; i < dtp->dt_conf.num_online_cpus; i++) {
>  		int	cpu = dtp->dt_conf.cpus[i].cpu_id;
> -		int	fd = dt_bpf_map_lookup_fd(dtp->dt_aggmap_fd, &cpu);
> +		int	fd = dt_bpf_map_get_fd_by_id(dtp->dt_aggmap_ids[i]);
>  
>  		if (fd < 0)
>  			return DTRACE_WORKSTATUS_ERROR;
> @@ -1232,8 +1232,7 @@ dt_aggwalk_remove(dtrace_hdl_t *dtp, dt_ahashent_t *h)
>  	memcpy(key, agd->dtada_key, agd->dtada_desc->dtagd_ksize);
>  
>  	for (i = 0; i < ncpus; i++) {
> -		int	cpu = dtp->dt_conf.cpus[i].cpu_id;
> -		int	fd = dt_bpf_map_lookup_fd(dtp->dt_aggmap_fd, &cpu);
> +		int	fd = dt_bpf_map_get_fd_by_id(dtp->dt_aggmap_ids[i]);
>  
>  		if (fd < 0)
>  			return DTRACE_WORKSTATUS_ERROR;
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index d6722cbd1..635780738 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -689,6 +689,10 @@ gmap_create_aggs(dtrace_hdl_t *dtp)
>  	if (dtp->dt_aggmap_fd == -1)
>  		return -1;
>  
> +	dtp->dt_aggmap_ids = dt_calloc(dtp, dtp->dt_conf.num_online_cpus, sizeof(int));
> +	if (dtp->dt_aggmap_ids == NULL)
> +		return dt_set_errno(dtp, EDT_NOMEM);
> +
>  	for (i = 0; i < dtp->dt_conf.num_online_cpus; i++) {
>  		int	cpu = dtp->dt_conf.cpus[i].cpu_id;
>  		char	name[16];
> @@ -702,6 +706,8 @@ gmap_create_aggs(dtrace_hdl_t *dtp)
>  			return map_create_error(dtp, name, errno);
>  
>  		dt_bpf_map_update(dtp->dt_aggmap_fd, &cpu, &fd);
> +		if (dt_bpf_map_lookup(dtp->dt_aggmap_fd, &cpu, &dtp->dt_aggmap_ids[i]) < 0)
> +			return -1;
>  	}
>  
>  	/* Create the agg generation value array. */
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 68fb8ec53..1033154d9 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -388,6 +388,7 @@ struct dtrace_hdl {
>  	int dt_proc_fd;		/* file descriptor for proc eventfd */
>  	int dt_stmap_fd;	/* file descriptor for the 'state' BPF map */
>  	int dt_aggmap_fd;	/* file descriptor for the 'aggs' BPF map */
> +	int *dt_aggmap_ids;	/* ids for the 'aggN' BPF maps */
>  	int dt_genmap_fd;	/* file descriptor for the 'agggen' BPF map */
>  	int dt_cpumap_fd;	/* file descriptor for the 'cpuinfo' BPF map */
>  	int dt_usdt_pridsmap_fd; /* file descriptor for the 'usdt_prids' BPF map */
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index 71ee21467..7da4c82cc 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -1233,6 +1233,7 @@ dtrace_close(dtrace_hdl_t *dtp)
>  	dt_probe_detach_all(dtp);
>  
>  	dt_free(dtp, dtp->dt_conf.cpus);
> +	dt_free(dtp, dtp->dt_aggmap_ids);
>  
>  	if (dtp->dt_procs != NULL)
>  		dt_proc_hash_destroy(dtp);
> -- 
> 2.43.5
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
