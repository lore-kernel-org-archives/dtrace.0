Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE5235975
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787944228; cv=fail; b=THhooChxGVlOOdmLuSfokgWVX8F4eqFxHIhr4L+ThAZJviHga1ww1VfolouaBGUCBb9Mo8eaBNVNE7S3G5wt87g/HQskQEJhxhIiDbbBFtjabMdTC2VPKaTU7Dv2zqzYXT024w1wPAud3Vq91OOsp649x01lxu87YknuB/AZiK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787944228; c=relaxed/simple;
	bh=NiOfzVTiM7j7lGWjd8EY4to0DuhjIYvKWGiw9CZ7Lno=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=N25J7YjvjCvDZguFFkCWUnc0idH5soG87WukWXmpswKESUX/+fNapgTfht4Iyk0sqFIn/JBWegjoGsJY5Mp5Ts/OP8Yg3DyScUyltIV8CQXQy0mH4+xK9Oax3nXIeilXMZCmDV+jZdBB+wdg1mDTzIJBteLX2WGn4AAIhVeEdbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bh0Nxp0i; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dkukYoJ5; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bh0Nxp0i";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dkukYoJ5"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SHJuoj3166592
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=iDpK+kVhPy+VVijZ57gTpkjcHWKCLW6piu9LYgjEJOQ=; b=
	bh0Nxp0iH0cUs4pzqTX/2ZK1/dmE5V5P3OIqdGbGbN5mdMQyEgSJwX79TRjTdCk9
	lQsYMiGAMVBbSFU3lHkfAMtVFb2LhFwzEyxl/coYvE/AA+B4o29C6n1X8E0b4U8Z
	Dpl0gSoKBMdk2zRabvFH5vf8v6MZjLuYtXIh4i9hhyT9qtYMfr7rRVBSlwEuSbJ8
	J/DuliViJLb7wPLXNDyjy8OZYVqjn+MklJJnIgtbw4UG2z9DLReWQa0m4Atj7vLn
	jGw4QXQWeU9rTU7yeLbs73vo0gK8ul5K3WXoVXz6gra0kPp9FlyiUtChojMgT23I
	knEwq18V6rF/PNxs5nbVww==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g73ct2fvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:10:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67SJAFqh013457
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:10:24 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011006.outbound.protection.outlook.com [40.93.194.6])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4g846hf6sf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:10:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4uCQ8N8KmT8JQxN+mZp8Npj/ouQDfrVzuOjXSj/78O3Pu0f/U4Qv/iO+GXfA7wi/I7xWo23Ua+0TD+KJXb3R7nE8GIERuubuPU4gvzp5RR9ttsVjXyoRi6ILV/5O+5OJc8mGaoV16u480BkcediIRDSwv6eBOd+sh0rQvMeFFsiZ/kj/xLYvHBaqc2AwbBpJfTn+p4Xul4YHlPEY1Zg3oESc9US0mbe1oLQgNsDITu1BArGcIJE5cLmfhvd0qeJAt2aifPHDREzlFv7YKkDfGU0o9YI3TpZP9IHVl9K21cBi9v2GwKN0C3ywbVi+ooPaqniopGP8/dMoop5acdjaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDpK+kVhPy+VVijZ57gTpkjcHWKCLW6piu9LYgjEJOQ=;
 b=pmYCLCRkvgAHrXuBxFDhteROrMuNbmPji+1M2LEvO4ThQ5mjVU419X8AdiNEqLQx5QeasKXrJejjodqwe01+kYe/qyal+FGMGNK4/xHoblMk0CF62h2lgeD8Q00criClU7fuQZYxiIatOD4Eg5hxgBdtUBRl+M2N8jJAJk4wEfYop7ITXn0BEv2MpthFivGwixuZTLqnK8wj3/muQdVaGYQZv8am2vqmGPXFc6HRiKF8T+bhzUa7VLC5V3od4+Y8ldPOlPEvt0oQ0r1skkNto3t55eSGZkmTrbM+fK+AONoYYIkKnmXUvLXi+otH80NqxqKvaEB3CwJIonzGA7LW+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDpK+kVhPy+VVijZ57gTpkjcHWKCLW6piu9LYgjEJOQ=;
 b=dkukYoJ5/qhczPaScHv6Oj/SVchlwU1WMvzK7ziFuZ953QG08qcOE+HbEyS5Ed6SYS8Fy4bS1//nYxKwcBCjNs6Hmb10nI1g2SQH2kgpJJdUZ4XcZDE3J1owYvy+zBXhxvOSQV4FURDtv83BDIlGS4FrtO66NJlzE5w/nfmb3M0=
Received: from DM6PR10MB2476.namprd10.prod.outlook.com (2603:10b6:5:ae::24) by
 IA4PR10MB8397.namprd10.prod.outlook.com (2603:10b6:208:566::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8; Fri, 28 Aug 2026 19:10:14 +0000
Received: from DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537]) by DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537%5]) with mapi id 15.21.0382.007; Fri, 28 Aug 2026
 19:10:14 +0000
Date: Fri, 28 Aug 2026 19:09:18 +0000
Message-ID: <a163ae2bfa0847a0ca0ceb8dcc89de4f@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 4/6] dtprobed: harden helper ioctl validation
Content-Type: text/plain
X-ClientProxiedBy: PH7PR17CA0019.namprd17.prod.outlook.com
 (2603:10b6:510:324::16) To DM6PR10MB2476.namprd10.prod.outlook.com
 (2603:10b6:5:ae::24)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB2476:EE_|IA4PR10MB8397:EE_
X-MS-Office365-Filtering-Correlation-Id: 84ba622e-9ba4-4dc6-008b-08df0537fd34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|6133799003|3023799007|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	KFXbX5dW9s9OJJARebQIDK+sUubYMiPg7QRYDWFuTmUI8k/50CW7X0n4pgeKVMcNf5oGi3BAEc1sQaElXbi6Cun1dE74ludTFMy0E9TgpBLqU9XQ7YdWUOHOi0BBKA0Vks7vaTAVMet2uv6RoomUPcDvR1/5rME65g+aIEZ8B3bfVsla1RHqmGbnYYM0p7QvRWcFqaPjlEfLFKRuGPA9l9LS/ZQlhxVAeIqbj+oSNcphjqSyPQiCH+LCnK2DNKFmeDPXGFQ+6GPqEAyBF815vtSPFureCKVaFatMaVqnCO4Wc7uEbCy/bLJYR5hOSxXtQSj/4aiI1+gTy73m1IGCbzpf+odEVSWT9Y0GQrj5UL5FnXQOHvFqyPMKauHjL+N2/fXWURTkqLpWWcxGEUZ0oXAuLy7VNA8GUwsrwXoF8Np96EYooCS9Hg3OBr0EitT0xNEYkIpdL/2BoKikHm2nXvuvwmyYsCKLjkoGt4fLKvsvMvo7TW0706qL8euP+nldeM4ccrQnwJreUKTAU9PfNWI4ckEDoGftdSl/XPSP/WpO0TiYG04wYOOr6fxzHlHdwH1gKjALPlUeWdiJfs9icHJoW8VXiXKuw9unbR1OAuKygwoS3I2wzfoCzwN25GFuUsblpvQlGx0Id9kWFXnEE1m15CL9Fo1/ROB7+zhJe5E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB2476.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(6133799003)(3023799007)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0PZL9KsaLP2vonKuMYY6sVRZQubZOHYoFbkI/tVT6xqKoqkuvz6K3FSitnGp?=
 =?us-ascii?Q?4ok8vmK+jMlEo6F/9RAsUwUqF88pOyBf67Xps2ayYjRkzWmpn11GQqE7LPiX?=
 =?us-ascii?Q?J128HbwcisqZ4odfgdFgf6zOmLwaqiRN4IGyj4sGMdeZbkVSFNo7Offgar17?=
 =?us-ascii?Q?rmha85/lzTRoVyc6tVwtT/2TiODzxRXm8SCqygsH6RUDAuedz1DbXrqjFRvA?=
 =?us-ascii?Q?xkk0wbR74PvZ2GZkbhoFgi9kcNU1zUZWJv3XxZACsVEqu7wHlTTFQ2QZ23Ce?=
 =?us-ascii?Q?imgkJSQQq55V0B+FqEi6OWeXGMsNcz0pnINWXZnmfir4iUDEx9ipgT0pw7Tb?=
 =?us-ascii?Q?dlj8kFAyckl/TLrodMaDT0O2+DWRJNCHv4+t7uIMnn3tI7mNXv8DSHVF3VZp?=
 =?us-ascii?Q?2XHZY+/jZV4u5vvu9s9+M+7nH1JaEmhoEL5PAMMDbGYR1o1vUTqAw7P8Be8b?=
 =?us-ascii?Q?OwwAxyAWa0qpghZ1//neN5B/pfxXWLoZk+qRmzMP9ZiK/5sHL5OoXeGNgY2k?=
 =?us-ascii?Q?Rpqg+kc1VRLYDK8Ms52GYpKeQ3j5svh7Be2vlS/ZFWqzbXXGS6pGQaooSVx5?=
 =?us-ascii?Q?+Y2WHMvKspothXCBsgHJDdZmuY/o8l7KKFVdf7WV9UK8IpjnkwG5KFc6qT+R?=
 =?us-ascii?Q?GRl5m2Icd6evdZTdmdXWfTQyKHV7N6KCJDg4vwdKLuM82CWkxjXFtnqagDaB?=
 =?us-ascii?Q?46mE3xWqcNAbfekveFKjosjuOB9yBLmjo6E/ZcXRXylxVbt5p1XQBs+8Wudn?=
 =?us-ascii?Q?BHhE5lnb57VXg7frdPLpogd7+lVREGJbXMXATiYt8uEIMvii5RpaoiC+CowH?=
 =?us-ascii?Q?07T49wYaLiWhfM0q51x+TA3q8QREUzu9jgNyTfWr6IXW09m6dHf1OeAm2ypp?=
 =?us-ascii?Q?sO28CaQMxGlddn6CAmmY8qE0wHbyaaOe05daQoW68gfAJ7RaunzxPcDd2Bu+?=
 =?us-ascii?Q?D+XayqirgeThjv3jT2MjQC444hoeA+CAcbBmGa+XayxKVgvfA5G3HOWyzSfB?=
 =?us-ascii?Q?Q9rn+425pzlSmBiQHhydEtAlfh7Bx2GQjsjbIT4H8gNleYzEdST5tvihChoY?=
 =?us-ascii?Q?T27E/zenUY/A0oETie20lzte52Xklk5XFVChXjlPt+G6P4WD9W7mV0znHgYw?=
 =?us-ascii?Q?pYQV57EDr+oaorOaVqn5ZPrUcwpap8Y8pWgWhwt4EErllfg7v+8mLq/3tkcW?=
 =?us-ascii?Q?teATPffnPsiwPjBpOcr4CzFexIPS999+o39fISB9xqJi3q4DitEB90nxs+0/?=
 =?us-ascii?Q?E/kcT2CTXr5DJQZWFVo5gJ0ugzTYLoxrHaq3enhz1mEILtm2Wrn82KODYgsd?=
 =?us-ascii?Q?8HrCF735U0FJ5ZlHuBPnWctV1NGPh2JCdFRiE9hiHlQHW8IuUJe4cL80t5sJ?=
 =?us-ascii?Q?nI9cZzuIBgIMUXlq/AAxftIMvw+LsnOeqGzgd+dIkw/T6gWU6NtSQoF/atLZ?=
 =?us-ascii?Q?wMpM5rPZYKWxDRtyNA227VFDHNMGY/EhglSkSqKZiXqcLPLnWlEJmB4I+vcL?=
 =?us-ascii?Q?YNDWqlF+vb92KXr4c9UDL5Wn8deYTnxGYE0UcUJwRRa+nPvweaDPAXjmnVQq?=
 =?us-ascii?Q?fAs9ZIpO7TNsurGroacXQLujoNCZDWQNfsgzPd/MuQtWfwxC/Kio5e3QQwMC?=
 =?us-ascii?Q?s3uWsbKy8/elbgNiUYnf+lpH8VEjjwrZtZlTFkk4aV0ZhEElzqLsy+lgP3Qc?=
 =?us-ascii?Q?huqCVEJC+BLcrEJSYOf96l2luzhQfQ2ALIbvRRMMWaWpMJjk6zyo5rHFNQzc?=
 =?us-ascii?Q?3u5ITV5jDin57XS/Z0x/EC7t9tO3zcY=3D?=
X-Exchange-RoutingPolicyChecked:
	g++Y3R7Lf2SVMW76IsP0gUGQsrYq4TCEGS8Rt/DXCDWfa0a4SEs/8zL8soFBBGCyEDFPMcqnLvZRrSXEiHul/CRF8f47RpBaCDRe6rCgJ+ahIcr6CDdy/1A6JuNpC/jEk+pI795c/l0HHrYbobMCeDQHzlj+OxCWnuRUEaiONAcacDQ930VX0bZVSdvyRKUMPT52mrKmom/CSnk8LKwOLJCx5Thva4YzKwOfZBkAAKK04ZOGi0YiZRw51NpwOAQ3YYM+d5KA4urY5dozJbmMOuKCXUufgcQP7m7Rr2rgPdEqFBWYF/dEQGA1jyOw/uFOFfoLiiryGDVaw56h+DOoQg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xza0alneQCzUB00H4+ikWrCWYFZ3UFsbZW74Fd8kH3kzpyE16uSJVlD6Z+E7fHfZxs0dmLWouVUGLcXmCYeOFJR6h6ZjrxG3+p6CpMc2JXV6OoXUnnx0mAzDCawvwv+i5eKzFs8+Zd9Hlf7RCObunIxjsHFGD/BNd699+GE/YESxBK0T/gjdCrE4/72W0ULyFeoAK9a+1sj4JgOdkfdX20ycXoBQVSiY5kgCoGOZHx4VfPHZQJ0ft3H1Ox6LvC70xePvNkFalswYvkw5Dthh4xFDjcC18OowTOVtUVxmvXMeNP8Rzkr9o23xEnHASbkdf5QtSZx248AOfNDQB2DqCLC6ZvjJSVolTTpSV/ATKKqbsqEtBYgHqymiVSZ4H1UIvniq+j75+RQ6uLzhEeIwZuA0dxTYoUBSEuyqDnQNngTDZj6WDbJMr9kaLCs0Cn4bYKLHBq7xsld9zTECWgJBpniXjtRuxeKdY+f8tiIrFpCwFoUCBdtijLVEs05ie1SMnKpNM3mlK38JglY1T0LH8hoAnRGYRX6XvksrlWQAkCVn6xW9P0CuhMDKvCj5KU6bkdYJtgXRa3ShER9ynT0kduRP+WRxa3RItRAoYMOATrM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ba622e-9ba4-4dc6-008b-08df0537fd34
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2476.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 19:10:14.0182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OFhZM32QXIBFvsQgD9KsWCI9RKVG9X574Sh9nw2XPjcLdJ4gb1WHtJPSu2i4GNJ+U1FQFKYKwnNOmSqr4SRMCt/ZmTRYkoFebEiCpHs4VGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8397
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608280167
X-Authority-Analysis: v=2.4 cv=D+h37PRj c=1 sm=1 tr=0 ts=6a91dd21 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=3I1J8UUJPc9JN9BFgKH3:22 a=yPCof4ZbAAAA:8 a=rZkm9kGGNdRJZiFjjp0A:9
 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE2NyBTYWx0ZWRfX5vJ2yxA7T0HF
 9VgN8kqcl8tT4o9NM21Iq1z6CvUx5gQXgJoVk7zoHQGpeh2xtp3j7X385Zc27SJw5rLbaRV/Mpo
 SydNVuSEKXBznqFIXVcEU3I1r9j0ecpxpUNRQRphVuXcdQl6r3ba
X-Proofpoint-ORIG-GUID: DEv9YDOpoWbv8gHWjsBwCW2Vp2pRF1ma
X-Proofpoint-GUID: DEv9YDOpoWbv8gHWjsBwCW2Vp2pRF1ma
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE2NyBTYWx0ZWRfXywVchZzmIO+x
 28o4YBJF01zUUoGBB2Bqz/YheK7xaetAo+q1vm0hIqvD6HqBQ+6ZhqflorNl6hmpAZPlTTuLwQa
 Mw/tVgxZkl9sEwmK+iseBAsIysPZ7OF3q0FQkaAUIggOZAPQ/IsDRLCPGvIKGeBIb6SzF2tyQ4L
 w7kSh8fVkK/Wl/ymKzpXq0kkJg5ZQdYYhS5k2so4gQlgq4oQMyJYkGHcJCNg7xlz44zGnkOaTV/
 8bkypEuPu0LqYZ9LxDetKWdafZPxjnvWaLJjf4EBMrc5lAZ+H7FGbuyBIhRMW1y3aa2/6Ug/y24
 m5RPBlO97EWGxJo2tMuQbDNfV/PZkB1jIXitrzwy+ODuOXqPraG152T3RVEZfbPPp0hP9A7sPka
 /ZneaYdFwsSIx7AuTGUy5z/aQlyyl7PdIxEyJ/j7PoAJvaJOYqQCchGknZeHIDtVZV2pOKltEd+
 vEjUJklny+52wuC4aCQ==

Reject unterminated fixed-size module names and module names that would
be unsafe as pathname components before using helper data.  Reuse the same
component-safety predicate used when composing probe specs, and handle
userdata allocation failure before dereferencing it.

Orabug: 39374493
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtprobed/dof_stash.c | 27 +++++++++++++++------------
 dtprobed/dof_stash.h |  2 ++
 dtprobed/dtprobed.c  | 22 ++++++++++++++++++++++
 3 files changed, 39 insertions(+), 12 deletions(-)

diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
index 4c7a95cd..891d7a69 100644
--- a/dtprobed/dof_stash.c
+++ b/dtprobed/dof_stash.c
@@ -230,6 +230,17 @@ make_provpid_name(const char *prov, pid_t pid)
 	return ret;
 }
 
+/*
+ * Ban "." and ".." as probe description components. Components are also not
+ * allowed to contain any '/' character.
+ */
+int
+is_component_unsafe(const char *s)
+{
+	return strcmp(s, ".") == 0 || strcmp(s, "..") == 0 ||
+	       strchr(s, '/') != NULL;
+}
+
 /*
  * Compose a full probespec's name from pieces.
  */
@@ -240,19 +251,11 @@ make_probespec_name(const char *prov, const char *mod, const char *fn,
 	char *ret;
 
 	/*
-	 * Ban "." and ".." as probe description components, as well as any
-	 * components with a '/' character.  Since the components are used in
-	 * the creation of paths that will be written to, any of these cases
-	 * can be unsafe.
+	 * Since probe description components are used in the creation of paths
+	 * that will be written to, make sure their content is safe.
 	 */
-	if (strcmp(prov, ".") == 0 || strcmp(prov, "..") == 0 ||
-	    strchr(prov, '/') != NULL ||
-	    strcmp(mod, ".") == 0 || strcmp(mod, "..") == 0 ||
-	    strchr(mod, '/') != NULL ||
-	    strcmp(fn, ".") == 0 || strcmp(fn, "..") == 0 ||
-	    strchr(fn, '/') != NULL ||
-	    strcmp(prb, ".") == 0 || strcmp(prb, "..") == 0 ||
-	    strchr(prb, '/') != NULL)
+	if (is_component_unsafe(prov) || is_component_unsafe(mod) ||
+	    is_component_unsafe(fn) || is_component_unsafe(prb))
 		return NULL;
 
 	if (asprintf(&ret, "%s:%s:%s:%s", prov, mod, fn, prb) < 0) {
diff --git a/dtprobed/dof_stash.h b/dtprobed/dof_stash.h
index 32b5eb52..e72671af 100644
--- a/dtprobed/dof_stash.h
+++ b/dtprobed/dof_stash.h
@@ -21,6 +21,8 @@ typedef struct dof_parsed_list {
 
 int dof_stash_init(const char *statedir);
 
+int is_component_unsafe(const char *s);
+
 int dof_stash_push_parsed(dt_list_t *accum, dof_parsed_t *parsed);
 int dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum);
 void dof_stash_free(dt_list_t *accum);
diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index 9ce941ee..c85a6617 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -668,6 +668,16 @@ helper_ioctl(fuse_req_t req, int cmd, void *arg,
 	int gen;
 	usdt_data_t data;
 
+	/* If userdata == NULL, we were not able to allocate memory for it. */
+	if (userdata == NULL) {
+		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: %s\n", pid,
+				 "out of memory allocating userdata\n");
+		if (fuse_reply_err(req, ENOMEM) < 0)
+			fuse_log(FUSE_LOG_ERR, "%i: dtprobed: %s\n", pid,
+				 "cannot send error to ioctl caller\n");
+		return;
+	}
+
 	/*
 	 * We can just ignore FUSE_IOCTL_COMPAT: the 32-bit and 64-bit versions
 	 * of the DOF structures are intentionally identical.
@@ -729,7 +739,19 @@ helper_ioctl(fuse_req_t req, int cmd, void *arg,
 				 errmsg, sizeof(dof_helper_t), in_bufsz);
 			goto fuse_err;
 		}
+
 		memcpy(&userdata->dh, in_buf, sizeof(dof_helper_t));
+		if (memchr(userdata->dh.dofhp_mod, 0, DTRACE_MODNAMELEN) == NULL) {
+			fuse_log(FUSE_LOG_ERR, "%i: dtprobed: "
+				 "unterminated module name\n", pid);
+			goto fuse_err;
+		}
+		if (is_component_unsafe(userdata->dh.dofhp_mod)) {
+			fuse_log(FUSE_LOG_ERR, "%i: dtprobed: "
+				 "unsafe characters in module name %s\n",
+				 pid, userdata->dh.dofhp_mod);
+			goto fuse_err;
+		}
 
 		in.iov_base = (void *) userdata->dh.dofhp_dof;
 		in.iov_len = sizeof(dof_hdr_t);
-- 
2.52.0

