Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46955231830
	for <dtrace@lists.linux.dev>; Mon,  6 Oct 2025 15:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759764536; cv=fail; b=KsisFV/v3PLjr08nDXUbIiC6eKnj79jDmX9GSDUw+p4pzOyuey+K0+is1K9pot3eH6DUWQEpKUnJgdOvQB2wrj4o8PLfHBaiMNuiMzpUxVp451IZEMjMvN56jxq/T1A+xtI0qqvNJCixE8lQHg8WNMNIw4udI2LeLWbc3tmuFR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759764536; c=relaxed/simple;
	bh=VEu9XJK/6Q5v/Acgj/LGpVmfysUhQo1phyCanM6PiDU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LtrJo2J97a1uuBJ1q4pvLdAz7NlfdbcPFBRdb387WyC3n1BQ6ILeiMPjjsMsC8xqHyQRbeECd8VdgVnXPbWDYXXQmdlO6Z2vVZn5EpgcqVHiJ75NGbhd6HUoX6IZMyKihnh59MCUuDi/P3saBftFzDqnl1JPjGqD/ACcaxi9f/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OrdwayQq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=j7UyWkuK; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OrdwayQq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="j7UyWkuK"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596Ef1U8029537
	for <dtrace@lists.linux.dev>; Mon, 6 Oct 2025 15:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=GUbTFZlu7qHsRCUtQp7SMSVsfw1ihZFq+L2L5wcHM50=; b=
	OrdwayQqeYUTMwrnEGrfTkwxfl9UZHt5Zkcv6Dp16PMrcMG8ty+aV579dWr7WW8K
	Ovhk04unf62/BTWa/0MXC/9iDB07IQUEefPtq/NxZHT5qCA22BwN9vxk4jPjoN2V
	9m8l6I7o1miqhPbAv1HSZ4ZN4BOmyv/tkACgWPnpNV4Og+iUWZO1o2ISX5H6FWh2
	N4U5iJ+QGJgZGQ6/9dQRJt8tm3VEDZAKB1/FyBOFHsD90H4rUa6Q0Q7G1v+rbDjS
	unSrATHq6BW+i8wsGQsGjlp1in3RPMiEqu9OCp8tbp/waB+kyDl/Rw7MDSNHINZB
	oBt6kTmHmtBJFHmHNrazMg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49mf76r5te-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Oct 2025 15:28:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 596EVdwA028623
	for <dtrace@lists.linux.dev>; Mon, 6 Oct 2025 15:28:53 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010069.outbound.protection.outlook.com [52.101.85.69])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49jt170bm1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Oct 2025 15:28:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tfFSfgmfChNhC8OPw4fWm/Eu7gis1b37pdczGbE5qmdHzxznU+4rp5wKHggpo5TLUB9w54MAbSuBeA+SFs64sZhqO8nGa66uiaVJf1yR6tZzGEv1BU6GEvdebI8brAduHgoCaex3RsoJj4llEOG2yMW9iYsVH3Qg1wGf/+a+gMa5RAHoKYhwjUxa6ggGyq2lvS5yqCiiXc44ZRl5m0h2M5D1g2IV6SPxYRnZjCgfiXzs6KkJs/Moh2LS4kvmaSMdc9j9ypiVK/4FfMa2OBUBYgGd+TEqMzTZZ8YZ1TmH3yWq+WANa4lZynP+bsiBF16ZVPNu++a1pX9acYzy95YwTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GUbTFZlu7qHsRCUtQp7SMSVsfw1ihZFq+L2L5wcHM50=;
 b=XAMDU3gCqnBxeVXJrzygbalJ/8kS+r/5tm82Gy633tiVnBlQsHiIUi6MIx2BjHZ6zEb5fnbwnBmbB4q2iXE45yPrpztjunNUmMchd+SCPdDUiRAw2szvUYl34L6buv7Gkm0zZHzz9RliOQ6nUTxkeUlx9h2uqyZsvu4DrRLEAFq1p2gyvcxqCXJhhef1+otRf1iWyV03J24FheBB0q7yyBZLu4bfxyn4dd6LO/B/LD3gDSIyjEUKyJOZuAfNVzMhNFUBTogmrPW/PazvVrIhO05WZSOmUZPhUK1FwcqA1JzppQNc19fHJ1QqdqLoyp8ho8VYigYxWlrJ7l39W6ajrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUbTFZlu7qHsRCUtQp7SMSVsfw1ihZFq+L2L5wcHM50=;
 b=j7UyWkuKPqSVf3xH3LHh/CTT+F9J76aTUKR7uflOF4dffHnEqywAUrliM7cD7KuqSBAGLCs8+QiVzTSfqzHZnQNfThatpXEzFLuJH/k/kb6ZmyL6WHQ0yM8+B+jM76g1ZZpp5ifOC/VlWZcZHJiO/xuF3xkVxfXK5ID+9yzo7dI=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by IA4PR10MB8253.namprd10.prod.outlook.com
 (2603:10b6:208:561::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 6 Oct
 2025 15:28:46 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3%8]) with mapi id 15.20.9137.018; Mon, 6 Oct 2025
 15:28:46 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 4/5] test: tid_pid: don't assume the type of pthread_t
Date: Mon,  6 Oct 2025 16:28:27 +0100
Message-ID: <20251006152829.239100-4-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.51.0.284.g117bcb8de7
In-Reply-To: <20251006152829.239100-1-nick.alcock@oracle.com>
References: <20251006152829.239100-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0455.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::35) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|IA4PR10MB8253:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fd43dd2-722f-4391-daaa-08de04ed0a2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z45biOcVJi6/AXWYR18zK0aUybV/VIqdL9+J21BQ4Tz+Z6I0HMBPrep/BxNp?=
 =?us-ascii?Q?3n1GqIsvsGBj7hSGh9Hdv+Qdpj19ZBMnDw2cRSNjjEapGtp1qhmWfblveDY0?=
 =?us-ascii?Q?8velaVOQCq9Wz+fzmKCJd+gfhLsZzhMO4chLw68z4KKzD5a1OHpnmnqmD3ii?=
 =?us-ascii?Q?mKh/KDgcttSWhy1VRNZcuK74mblOJrLkA6EqJsYM6y+RJsXQbrPveruGYbmG?=
 =?us-ascii?Q?Afz1xIROLIGGc/pY6Hp5sr55AFlsEPdzPlS9ktVrFGRwToyiXXi+STMI1dEo?=
 =?us-ascii?Q?+SfZhBX/c6ebZDhwp5HB/hfvUdxL9JC0Nrfkthafxv04gUj9GOmRQGzjwZA8?=
 =?us-ascii?Q?P+KjlC4ysUiW0Mj5UhaVMwRiK7Cujo4PzXgLXfQn6tbaYkmJIdtbtLbJafhN?=
 =?us-ascii?Q?d3FKiJPaVGMvlNxN0NE+a9ZFIeKUE31khzbjaj/lgaMJGNF8H/RoFP7Gnp9C?=
 =?us-ascii?Q?iGUJc80RDZBN/FEUMgw9pZx/YsAyFUo6knL5Kl1jbXweVwcOLNfZSLfNGJAg?=
 =?us-ascii?Q?qtg1UFeHsYAqsJw1o0AFTRFkz2AGjBqIMkHOrwNvfZk612rMnv0rmKsEFs60?=
 =?us-ascii?Q?2De7vNRkeXCXMYSyyis7U+XbkShsiL9sXeA2rG2NTzyz+Wtlq4lium2ZHlCS?=
 =?us-ascii?Q?LSqQ0KjMJQsMj/k+0F8BZA+3g+M8Pz/qUvwCh0uwwjEQSaLaLpEV8Q/KD2H+?=
 =?us-ascii?Q?l6zixNJIfB03VYaPKCFV3ImXPESknYrq+IIKh/OyEvzJtTjHhvBjTJa2gzbb?=
 =?us-ascii?Q?inMsoo3fcgNQQexY19rmn35ilcgyEg1RuLnMS6IBoAxPVXP7K5R61wr09ebF?=
 =?us-ascii?Q?0go5K1gUap6zstvreJ5PdaXh1v5Re5eSKFphDgYIM2E1u9kVjufEM8u/SBHA?=
 =?us-ascii?Q?25Ux0ktAzKh1iV+DbKwkffLcRjmqhduI7+PrsNTsXZMctJXnhUPpKSA6atfs?=
 =?us-ascii?Q?gPQ+txdynPY7WG5UoZkbgqajidCTM1y2Ap7JvNBwGemV+AhcO4bK4Pv3vCrF?=
 =?us-ascii?Q?x4uQAwhQjaeEMpsFPBPhLWTP99X+6AG0mW+iJLdMCjf1rFb4FfQ6WY4U4tsa?=
 =?us-ascii?Q?eYXD4yErhwzb7jBP+QZkSYhUnFGVxqiaYDsvmCzQwO5h72mvK+kgfWuKfgE/?=
 =?us-ascii?Q?wp/HNRumUiNYU9Asbmm24ATqFPwDwB6zpnPZ/9g6lCsHJkmPxxih45T3yd6F?=
 =?us-ascii?Q?VHT6Ju2sVUSfidBpwBU2dBDSVI+gukCTvvJjwx9rtDFubf28RkVxrImUjkvf?=
 =?us-ascii?Q?FbQB8JwYiBnrpX3As+feGqJGr4l2tViWYtIcUPm+Wn6oqpa8FGXagINmNFRG?=
 =?us-ascii?Q?5koOoktgH0n+jnQR3XESFHP/V3LmxGeSoqp9h/r8z9764z0HXBxKafg1kGYo?=
 =?us-ascii?Q?FVdFr/pdjlTSuKg+0CwLAm0BGzqvw15VcPm9m5sQlovJiIY6/tw1yPqHLvia?=
 =?us-ascii?Q?QJy8Q1hxoa5OQ9KAnQffhlaxH5vaB6RE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1H6dQSGw3tEpCWjD74uP9QKeOIhuJfAIQJeZ72xkK7uayjFxntAsBxdBZYhl?=
 =?us-ascii?Q?L+u/i67Tw668AmzwhvE49sQ3kz+vgKZ1lamCswwkq82w910tZkSrBogo0VRU?=
 =?us-ascii?Q?vLcV9r50wzKws+wfua4lyuNy4BiofKBoPrf85m2bSNQWVowPeQ7ZNk6EOeBP?=
 =?us-ascii?Q?MN1PXX5zFHPWwWbMTg3YKvPueip85m5zNckhlKWB4pahUiqfvSrqofgzmEW1?=
 =?us-ascii?Q?/r3LyQ2GFus+tCWiDGG7hF0e/r5x/RPSxb+Kl9spIOxw9OHPIah/TwASuwTg?=
 =?us-ascii?Q?SjNCL+ImE8YzxBakrbUCelphtBodNkAMr9IhyZJNjFY9NkyJS9WnE91Mws7f?=
 =?us-ascii?Q?woCJEKuowuLzwncghWjjPkhMQf5ofTNE54LTCn7rmBI7rb71zwF0pOjVN22o?=
 =?us-ascii?Q?iqJEJ4wadIVFnKkugzn7gawZxeHfxB4cKTFttIYjiijH7wAVlLdaLUo2ZH7k?=
 =?us-ascii?Q?Vx6OieXyb6JBYfp8K9OAXlwL2bVRaIYcnEQ2uy/KH38m54Y4BiaZvycGynY9?=
 =?us-ascii?Q?ZmTVlodR1WSChvwjIYl7r42/FnQKYOzvAaMB3DvhIJDv8JTX5/N85JVF9eHg?=
 =?us-ascii?Q?gDWLl00MdrekKCZrh4grnBfWhwVo32oChkVHQmHqo3yrLkbG7e2iXBQFtifE?=
 =?us-ascii?Q?xBUcUA07V5GG9VuzMd1jAiIut6EG13PJTk7+cwVf9bgESpwIthUvy8rC14n3?=
 =?us-ascii?Q?tctzk1npLUdDnvlYzc49VsCg3eAjrBZNv/jia4mhCXTSr+zThWmFPuPaWxcq?=
 =?us-ascii?Q?fzhREO/zQI8UqFhC3wKgxDFvjCBrwQ5OccZ/XHERjEQX9ZRZB3ZJ9CKJlSmX?=
 =?us-ascii?Q?ktezSqGn6lapX74F5gWZcd64VsPzw8Mu9X7SJ1Kk6l15Mge2ovbCR3D/z/7y?=
 =?us-ascii?Q?na44j071V2EBE4eCnqwe4DI5s+FaON5piQVQATe0SsHi59b4ZX16K8PsBArQ?=
 =?us-ascii?Q?O++xAD/2dCyqP32oqjzPAVlwBGqcgemDVXwYZhCW8I9UVuP+i4LCHmVA/4N/?=
 =?us-ascii?Q?OpoCZ5f4o4wI5EHSzRcuCzxpnMVSo0MCRQDQ639nFdk/Wacc8E4+vF8djmt3?=
 =?us-ascii?Q?JphWWLNXKh3A5x3nuqXNfG6oKgpWwstd7ej9JrKayqhk2G7yOWN7Cm9A6K60?=
 =?us-ascii?Q?GB/nTLejRyNMwhxe0v3yPsjxgVMjUQlRLmVK/iLI95XhfCCUH/w51wx5P6mz?=
 =?us-ascii?Q?bMkoL5OX8aU1VGnqJ9yxVMVCJ0pPB/Ivy33oW/+soxAp08UqBidr42T1SC1n?=
 =?us-ascii?Q?/ph/LFYudeDtBnyARFJwmvm9xLNCNK62Exu3IR4UR/030MFrA+74sgWIgC0N?=
 =?us-ascii?Q?q0bARRl2HMdDIOQoW5KtYf+8Gq2mzffFS1g+S9SNWvyDa+xv/lZPcwAnAk83?=
 =?us-ascii?Q?M5VS7G3AdCLp2dr0cOPemRkbAscgElOBr1od2VKrdCfZYZA6wqRAAgwliGPI?=
 =?us-ascii?Q?DT0jT6r64NxNZ9u1VPh5QlCTYCoKcMTTZ9pynDynqYlPKQ5esOoXR7creq8k?=
 =?us-ascii?Q?KK5v23+wIveiSwR4l4BvbX5XBTvw1H7DUkRE/S/353Vfd/WW/Rf3kdqeVCKv?=
 =?us-ascii?Q?mI+zHQkFOqjcQ0P2LcTJeGpqG4JmUCJMYXeT1NHKUM99vePvqduUQsI+dQVf?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NFnj+t6hU+Xvl3chHgnriw5drdzmvXqCogDo7rispRQXb+1JXMLs8ZnZpTd0SDfWwbJN20W7v64f9uY9NLyPOeEt4UutLsYSKHUOa7DxQWMi0n0tCWj5XX0MJQo3fZlu5LmW05POzuROyu1W0DwZTpUVOqDWmSyUAfm7MS23606kfDgmafWYCU9WcJLkbo4e3EM6tBEqrAuuJ3BV88zh7j7VxKGlwK2tV/eomT2AzYkaoMbzG5WfmtCuJRwasiWejVQdwNHsyxLB+L4nf5vUctU6TxgUow6PjcMXWianU1+6ZZWlW5Gppb2CVfguOTm5wAPbEJJs3QbSpDm5qC+FPlIGhI3EQni0i5qurYupfTksphgb/gQGO2DFsQ98COrwqKp58TnZg5Qoh61qSkPO9xuSBYAheVs2id/01/CTbXyWswtBzwURYY9jLdbFiNv96FTgFZEwj0eYmRd5idAR9BT7XnfHKQEGkW5Euy2h6difFhnQlpT57Vs1e7g2OMbXRKxSD4dnJaBAW9yZTmG6oW8j+RH+E8SE86rGmstHU+xIckU+o/q65ehr17bC/MNcSAGCS6cEhxWrF3UoCgXvN+X6d9WsHGeIQvXg/NAVD2g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fd43dd2-722f-4391-daaa-08de04ed0a2e
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 15:28:45.9537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3e0A2iK+bn6z2ggLaxsf8zuHuYNzGZ34a4kN+QrbJfiLgyOpz4ZsJaAWlFCU40W9Kl5CuqApUSOdWIcmLYDcwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8253
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510060124
X-Proofpoint-GUID: VKLb2dJCDukijkXnKECOb1TisDx3Xdda
X-Proofpoint-ORIG-GUID: VKLb2dJCDukijkXnKECOb1TisDx3Xdda
X-Authority-Analysis: v=2.4 cv=PY3yRyhd c=1 sm=1 tr=0 ts=68e3e036 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=WVnVt8L28L8bnkHvteMA:9 cc=ntf
 awl=host:13625
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDExMyBTYWx0ZWRfXwXwi35zwYNoU
 cyXvH84sPh+3I4pLTuavjR3fEd04bDZHa6gFH9VbGvrf+9WGe62NOXjImkDY1hx9zphuaFC3mZU
 LHNWuVKmgcckDkw+/tV01xj0cJNm5mWKkhdBIfiZ/PIZBkMoFW6wE48qs8dWxRv9Sy7aGqrt1Sj
 mbGj054DHm3ORljVb55is9W/Uurcn5cQIAoD0afmeZepuxhUvC5YBmsSZlksL9r9nEtjvdEE9ZE
 m01yvfHcWBzE5l8oisoMm3XQebbl7dr5+v+dV/xqHMvdwqtYDU+7VUWoQtI2oYh+4QCNesfN5p2
 +qqHOaD1Jri6MQcXG0PX/1dWHxuRe11Ra9CjSBFhl7TEfuBhk593Zua7Ot7CzEqxg9j45v9DhKD
 HtKtWFx/kuOR8arlWOsxaM/MEUDAyRtx1tVsfilT98M227a5tYs=

GCC 16 warns about this mismatch.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 test/unittest/builtinvar/tst.tid_pid.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/test/unittest/builtinvar/tst.tid_pid.sh b/test/unittest/builtinvar/tst.tid_pid.sh
index e367411dcfb7d..7551f7c4b8f5c 100755
--- a/test/unittest/builtinvar/tst.tid_pid.sh
+++ b/test/unittest/builtinvar/tst.tid_pid.sh
@@ -51,7 +51,7 @@ int main(int c, char **v) {
 	pthread_create(&mythr, NULL, &foo, NULL);
 
 	/* Also report the pthread_t. */
-	printf("created pthread_t %lld\n\n", mythr);
+	printf("created pthread_t %llu\n\n", (long long unsigned) mythr);
 	fflush(stdout);
 
 	/* Wait endlessly.  DTrace will kill me when it is done. */
-- 
2.51.0.284.g117bcb8de7

