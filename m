Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F200A1BF53
	for <dtrace@lists.linux.dev>; Tue, 13 Aug 2024 18:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723575334; cv=fail; b=RQxLmpPSJcaJ/BzEiSN13uzF/3IcuICJ7GMD1gdZ4XZXwnoDwlU0j2RoxUNPgGNc4zhH9DCOZGLM3HU++Vo3sPx6O4AIFID+kD9x49YRP6KFMxMI2vRWx1VjpHkhFWt6HSNGbpYT7LyV0RyWgQdTsvSdQubjdOVIIvj4vT6wFvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723575334; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=e+oaw2UAlDee3gWXI8F/zlaIvZ9xJ+Dsyu8RrQ0bSNYXQXig/63qJO4/k22lA7yf0OM36k+hoxX6JZIuW1/ZzzSerDEhKFbX4PgKu322gkr3abejs1FM5+b/ucgFCjgPJYq3M7YJvM5mqLPCD02OMT81DGv/1a6JENLCC9YYKz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YoX8jpEx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dNcHeWIy; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YoX8jpEx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dNcHeWIy"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47DGBU1N021479
	for <dtrace@lists.linux.dev>; Tue, 13 Aug 2024 18:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=; b=
	YoX8jpExfSPN85GlOcn4V64s6Y2JLlvluUnF9DzRhdb7am9bMsUMI2FOKBQt503h
	BM+LESNaaP+RrYyOk+cb3bGG1kzoYuFXzGllk/MdRf7+GBPShk2WXn32ZKHttwFv
	JKfebe+I51w1CJNuLFGrO2BzLEo2/oAk00yZbEQM9TrMCgJGhc8vvEMgmc0QawBc
	d5how5mfNpijseSJn9ilc4oFrx9GyEsCPBmaTEUTWMy1bwxAAazqlLgIHON+o8k4
	0JkaePbzBosCL0jfKluFwMqAyteg+4l14y3Y1aiuaOeKGp+gtEKVI4f7xPtwNq3p
	y/bb0H0r7uxZiYKQwqYtEQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40wytterr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 13 Aug 2024 18:55:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47DIFLOv003600
	for <dtrace@lists.linux.dev>; Tue, 13 Aug 2024 18:55:30 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2049.outbound.protection.outlook.com [104.47.51.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40wxn8v9qa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 13 Aug 2024 18:55:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZJfHje17IegTUOH8ZMTzroqi97XEuH4uioiWiPMOIAzLDSR/hOWninuO8++UpSDuagjn7ZnyJl1N98+s/xD3hhwLJZlGqCM/dyy1vLeUbrgwH1Lhz57LVsSDowB88vPTqbeXfgdijG1pVWt24sM6JWjJrrq//HJqNRXXOFQNaxk5t1XOFa+4z5GbXeIAJmlxxODBUSCju9ktmaiPbNZTqoIH3vaweUjiwVDK/s3W0rPpr5Higc2cq1TQ54m9Rp18utlOBC8RksooJ63F1qeTLSeYJ7hxb3rU03Qs7b6v6kkNfpDghZSxToYX4FLBR5p+T9LJqvPL+55C9+brqfDhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=jmVQMTb3N//65lSdSQ/kkuuIOYHipBLvM4ctaV4O/lRxX8uQ7MV2fu4rkqPRvf5PyItnnFJRPK1FdAFBweT1w/BRPZYH8RSkjaJSoGH/QNN4d8d32+HU16pkBdSislV6DETWKtp+IuIJ3zyohDk7P6YDIObC+7ERVyrP7htpusbVK+yEx+g3SZD8K4ICG06FPPmSubDREj+sMgTONtlXD1FcCAKbW3i0sF8/s2lHOwigyewtzpLpjAkzlGec7aCMhkqWjuR94e7X5faNozAugD4O74MlebwMoDzX7oG9v2eaZNz+wrSLUEE9NL0qxEFhyeZNwaP3tv9H1Uakl4XE3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=dNcHeWIywvseYAn9p4YISP9GmZCPBtIchAbwqqqltNRbUiYKX9mATLUVl0OTQwhknyc7bQVH4lY89h8HSlj/c4cjXzvqCG2VGIeg6AXxxn0cz/GxqXWZKLdUBrhqWvpN1esQnm93MYlh2FM+BSUmIW1EeEZkAG5fsCgobPDSy04=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CH0PR10MB7412.namprd10.prod.outlook.com (2603:10b6:610:184::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.15; Tue, 13 Aug
 2024 18:55:28 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7875.008; Tue, 13 Aug 2024
 18:55:27 +0000
Date: Tue, 13 Aug 2024 14:55:25 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev
Subject: test - please ignore
Message-ID: <ZrusHRaHtGHs14vb@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: BYAPR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::33) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CH0PR10MB7412:EE_
X-MS-Office365-Filtering-Correlation-Id: 7db6904f-9cb3-40f4-1163-08dcbbc97f3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7es2IYmCmmnWX/zv3xlL4OJTtnnlnCSDnsn/tB9rzXCymPLIjxoOxEGyuqRP?=
 =?us-ascii?Q?G8BWCCsHk/tA9LN+A+rQSHTy5ew1meo7pJqcim9TuPgU9rpz26fdHhoIOb0q?=
 =?us-ascii?Q?yZjXKuf3NDVwjLkRoT58Du8Ec9jCFMESU+Vkf36B+Qq1jUzJzqjNah7mWlgz?=
 =?us-ascii?Q?z5hiDiSmmtprvRXWgx9TzIASNBtVgQtlRINsemoHDoY4tlTJfh+cctm0Ob0k?=
 =?us-ascii?Q?yxPQYLaMokbl/zND6UCJOlXEoX762RUfmsvrsI+tFLneilJY+Oe9B9vqPG+3?=
 =?us-ascii?Q?8tgbwetKdcdm7RBOZRkmDxmtWw3FRI4U82cWo/bMbcPZQUXqtvQmJkmiWCfj?=
 =?us-ascii?Q?RVnK7X8vLowRE4E/ncxmcZrPiGRF/MJbQTk0kzCHvfiS/Ky3ayfFWgPV9z/e?=
 =?us-ascii?Q?wOyuLYDCZqDP76Kdnmg5THttOfnRHEezdJNheohCZvuzP62VqvE6EDTtIh/T?=
 =?us-ascii?Q?oM/K+uDkAYLDErkg4pnKZXp+O+tDc1CHlekZfocvWh5y2jCRNXm7BN/hj33i?=
 =?us-ascii?Q?5U4QUARMl0maJA2GHpjNwdZtE8FzqoBbBWx90mQLJFj0boC6Op2XvVLhN6tg?=
 =?us-ascii?Q?f6SuQ3DpLSPs4UJ9lXQrbMas49jJICXm8qRkgSnuLB6MnF4CWXP+2Abo0hCQ?=
 =?us-ascii?Q?RrxR5/WSmJcYT9JR1DWmjXxHGAo+71USBQRCnfRupKdSPbA31/4hskVcigVF?=
 =?us-ascii?Q?XBnyCvLWhoIPzvMI0mq/s6xw0EYVeXnpJEy2OfrMj3d/Vw5lQJFNrExKMpW7?=
 =?us-ascii?Q?xPZCyhra5S/cvKARqI7qkK7Xr9lRcnbcJNwvJHkBIv6esd1KG4Spua1UsaXb?=
 =?us-ascii?Q?SOTSgzM4ntwuUSKYBMmMUn2kCaOOq8coqJQuroJo6RiFaHTbkoQYOzZksvlA?=
 =?us-ascii?Q?YngIxN6Cad0dcDL/sK9o+zUbhKZPQFyJehDoHaGLRp/1+PCJ3zEbPjlBA7oL?=
 =?us-ascii?Q?os8LwRH3oTQ19HqOR+7BfjRl6EoZhRsJw+qKKyUDPFGWmjZjU1TEjefmypRn?=
 =?us-ascii?Q?+gRKTKHKetT12v6RQT8W0ZNiRmX7wwWLbgyj+irxhxWoOC2vb7x83Yg1W9fi?=
 =?us-ascii?Q?6wHaMUeZPl21EYX2LiF6+FpixrEerg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NiD71rRdCR/yF04ZECGApkkFEhpodQE/RLOYL5Caa3aDswDfv20NLTHCvGXj?=
 =?us-ascii?Q?iX7YmpiBZV3U+e7COpwnTcKZsh/9kK7NIx5y+TAmMuszIPaKjOBOj0vhmjf7?=
 =?us-ascii?Q?zNQ8S4gv6DJABM6Im+DblqSHvtaM5/ss9GB9XdlZ8XhJUJETRaxcuwBT5g/a?=
 =?us-ascii?Q?rJD+nfNMkRt+HH1Ga2VppBH33IbsQxE6Ho9o4EqtiCt6fB6Ri0uYuKj6d1Tm?=
 =?us-ascii?Q?3PV2KyRahwHkUtRqGUmVdQ8CwEX9wGMZzG9mCSE6zE5xojo71PMqeHaxojbO?=
 =?us-ascii?Q?HBdIQIlZZAqLb0q2uzqaWpU+tbzefx0numgDOFZQRnMgtbH0hz8bhiaXh3YA?=
 =?us-ascii?Q?UQrjb1jD6M9RqDgjqpuj6KWBbji+CLcTpkUvMFZon7FUxK/C+Oo7YJC9wj8D?=
 =?us-ascii?Q?uhOzZ4pF3Urdmm+TjBsEO3z93BKEqHOMp1gHx2a4hRL82sTwaQCNVpKDGx2j?=
 =?us-ascii?Q?3H4gBleaIuh1ylwoHqcG1Uiv+cbEgXd/QnlgDOtN86iiw7kGYfQLKzbchzXF?=
 =?us-ascii?Q?HSb47n6+6sCu3cxJqmEXc4RAVD9h5EZyFXeKftQN3lO0Zc5khHOgarZlMSgO?=
 =?us-ascii?Q?5BuGmU6PDIhMdiMFNVx5a6TvyngHbmEbMMAqM34LWq2rmWb+NAdssshFC/7q?=
 =?us-ascii?Q?3+ANnIj3kwCS8rth4bBI34NBJhNzWlcBL0SmT5pYMPR7cgQYYore3SXtxkaK?=
 =?us-ascii?Q?ghdEpHjCPHqXFcUY9LrKzod36yMRIEAI8UWkBSDoK8e4je+68YtY/Y7/PPqv?=
 =?us-ascii?Q?g2vwvuO7Gwbx/7fq1R5zAhJJ8D9tiI2cagctXW+RUc53GhLKha8OYwztNcMq?=
 =?us-ascii?Q?n5EJePCMs+XeDiSSLqdtONG/mDESeeG5hFSIkaW9oOM+xClyAceoQ4FCb+bk?=
 =?us-ascii?Q?dYeTBu3LUYNlMW59sgf6tkQngZ+Hzfsp7zv8R17eireTX740IKIPHhgF3wFf?=
 =?us-ascii?Q?l+NYKVLXIaXkbSyEIPT7+dPvyEBzJc9eOCdABmAJqqz3dBSKYB1coBlH13AV?=
 =?us-ascii?Q?N/t3DG8+geSyTuu/pfdkY0HxyC/sofENJUqoKWJeQsnaIftCPoQLnUz32OKP?=
 =?us-ascii?Q?o/YfRdEkTRjNQ62zvIXTisAXzeEh1xVZRd5tmBK8BcbloQJIXwgfkO+xqt+J?=
 =?us-ascii?Q?Ch2/dkXH9IHG12WZYvyApPQvGKnTvKxmQgeAoS1Vf2ypgl0aZVGTSQJEESjx?=
 =?us-ascii?Q?lsvNBA0UxtVH5D8dj8/+rQHZ6Gn06SQgkJ+Hkz+l8x0xynf79+vLEWeHWwUt?=
 =?us-ascii?Q?dpYeX5Ws07+C394Zs8hYzzOCer6bbPpuyI1u2YoyxJN/KdAwfDaih9Roq/j+?=
 =?us-ascii?Q?oyNXajSV50nEF+8HT0Du0VxZP+GoQ48iB/76GAJ9Ggp0vfu/d6V4exR7MhQZ?=
 =?us-ascii?Q?3q65tlqDOrtufsaDzlY58ZFM+Jh/r7NHCQ08GL5V3VxjGIAfWJ56gW7h2/pZ?=
 =?us-ascii?Q?PLEPCz/1CyW3rRUk3ytgpLCvQ7YdNfC6b5aB8TJU9XTqKMaPxFt5tDcSsLjf?=
 =?us-ascii?Q?nMYuXAILEXtdWo5CNJNWwdzfKoyIyrU7L5qHQaOtzLCLPxxT1B7WkA7ISR14?=
 =?us-ascii?Q?L7dvE687jNHuFqhKr5AJpdQIzUrLdNPHLR0iE9sUzdFiNCT6rvnI4/025KMi?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bq+AcKnVqQEzm2o9Xh53Zvxhrl3LXjCFDYisz6t39MjEsaReieZXnyZGgk5t/DghRbVn/zHbKJBfFtdaDwR53RDA/Zs2W5z1qnpzhMvb6Sct6K8d5yfCDudqhi8NOA99nF46O9qKtC1IjE/3mBMqPyC5CQxzVyEuejQhi3KajO1KYNsn/mzq32jumq9T1/7tt15d4E7gGt2MS/49xx0FjiQ0Dv69kZ9GT0MuPEMB/Lvax1C2N1aCJ1ZaThTSKaXKWXbKqLdxtgHljThuYPQ/5HErQAxMlOXRM1AAprpsl+Rxi9n2r5b+7pefy2Q9+eXMVv6aw+WqFd+7XW5o3Ky2Vxp8c0C5F0bqtIiTD8FK0UdhHGuX1DjbsXzIUtw2iNStofYf2q84sSQcxZMLp+zu0LCdlySof35qN8dyy465AVhRnWYStEGLnvFyV/xPTHuHQXTG1JXubYCDhfMvf5/1brCzqp4LMpJz9V3/RX2Wcjpd5BweMeZzjTIcXroRgiYO3Fhuz7mAhyiSutpAGY1mPcFpXM9O6vaQXjYN5tqVlw3z+oKXuyQIqqrXKfu+MmCV6IlBFEIolEZ0iwOogquVtecNrAg7vRloa+Fn0sNlFFw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db6904f-9cb3-40f4-1163-08dcbbc97f3b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 18:55:27.8315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: welBnDerQVr4Ze97CyaqZQVfV9MWOh/27YTEwxYPfuoDCHrjurinTieMk1xBGwrvrUsHnP4YxJkvf21yZviOuCfzsV3HwnakwXxrJKvHKUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7412
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-13_09,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 mlxlogscore=589 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408130136
X-Proofpoint-ORIG-GUID: tMzaiDj6K65mWR5u2dzkjum2i0FrvG2w
X-Proofpoint-GUID: tMzaiDj6K65mWR5u2dzkjum2i0FrvG2w


