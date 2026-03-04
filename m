Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E843CD8A3
	for <dtrace@lists.linux.dev>; Wed,  4 Mar 2026 18:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772650268; cv=fail; b=RzaS2kwwzEhxvzvfr7hgjMYmr1hbi9bCVPeAjjxn8oYquTGw2D8NuKpVC1Jf+DsGTXm3cb6+RNhSWMlJUoLeiXmkM5SM3BqzfJvQEj4NL98GAWqcHyrVizri6h9TnEYxpZavLeCgpCuE7lo0PKrtOnSijDW2dKTt9ltXGDK++VI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772650268; c=relaxed/simple;
	bh=AVMo3ATPcx6VHHBq/B9Milah5m/nnB31N4i1Rf+tPPo=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=C5Tq1PwkcZW0U72sHb8L9XE+mq5laupgp8Vz5KdmpjVV1+ZO4OExXv5XhsWDoYlF5LL39Oeg1fbfNPFJpwWlW7gmlrGCx8YgfV8UYWjvUKXdKu16L3Ya07w6tGbONNCZGYotFqs40QQ+9ocxQe8u2AGmRvp4gSuDaNS/ENyBDxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PcqGPO40; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eZW3rZ/1; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PcqGPO40";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eZW3rZ/1"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624IDnWl2318551
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 18:51:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=sqRM/7ICAJAI6pHwhlix5kMlOod5wOhXTRSDezR27+M=; b=
	PcqGPO406Pq6ThVmBW3mzCUfvtZydYDyvvN9eRcjhc6hGjXMtY2NfGLBqKkuO0bO
	o+b89EBjC80MIfq2hRQJBKr/oY2aoSWDLweMaliySVGMOZAJpAc0rKIo2mXC7zHs
	pkPgCCM0/e6Fljc+XJy4PiM8ajuALAn4UAPFrLiwGTrq3IHyTJnP+5o8pdFLc9/m
	dgnufJR1OWxXPL6LqhNrig9OhiNr3S24beEFLHg2OslocKey3sAs6eAIWLSC5s7f
	d1LVqZVTwEi3kB3QXzsdhPhcaoCZO6PGxox9674d1lzKzanNFG844aWlj5Cdfxi0
	RFZniWXiZfY98SeakMyCUg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cpsu2r1tw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 18:51:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 624H3MAo001643
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 18:51:04 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013037.outbound.protection.outlook.com [40.107.201.37])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ckptgfxra-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 18:51:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xazr48BI8tly2cn5suR3D5C6G+HHa/n3eXAbOF9qDg0pctdI+HZjUObvLO0lujTAGZSSSlEeRDMVu7Z1OYGDgZE1+DnMzM96nAQ7saZe+4vYZdPkWrF27CLRj44Gm3VFCcS55AOWNujbKNtEeVbjApx5UE521u0ppCqh24kU0hW8/l4bEOv4pnhVkgbMyDuFhN6quZaiBc9UvVGDj7CAOSGEX7J3UOPgDL/Ca1eolBYv1+dLe6AUtC/IAN/lOjjb1P30bJcgfkyhXu2T5pNIuDXTcrcuFcxTq5Snq7FWPwctfyfrS0F79G7KKkW+VkMuNR+pxLCtKTP5QmDbzWNtPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqRM/7ICAJAI6pHwhlix5kMlOod5wOhXTRSDezR27+M=;
 b=Ptt+7Dsh8iWgcR0yX3360QLPXKgMXunbLanjNv1Y3dDfUTvnF354+b1IHCdkVi36Hc1Uk+2OmiyjXy+cJtNtQVpJ6OhQjH4CAeRE+EF4As5e4L5mbcbhO3/cSe7PZVXAUCLykWhkn5yExNH0Jab3t7cLkNFevjzQ2shNn690HCPjsrFtJZPDgicsDnQ0bj4gCChbLdoXCDc0y7hlJ0YFEOKXeEJclpTiMlViif9WFL2Ujk0v1ujrb6GKx0kl8o/dHlWSnQn1iHkUfQ/A0Zr3ziby7vG13Z6Jk7mGg7Po1oQlwrucTGAIH59o6OGax1iwiHwUGYnRTQS9rcYLCIYoIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqRM/7ICAJAI6pHwhlix5kMlOod5wOhXTRSDezR27+M=;
 b=eZW3rZ/1sCnTASYtqhgUW8b+3snr7iCE2c1lL53wZs+J2X37bECK+1M87JGqIdqI5q0q0giHARkyeADN//TXfhVk0O3uQmjhpn+oad9POYOajTr/vYPWDtSvmNSxQ372h+asBRgIo26B1dwKuWndOdhSjn7EZjusF0dHAlgRn4Y=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by DS0PR10MB6728.namprd10.prod.outlook.com (2603:10b6:8:11c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 18:51:00 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 18:51:00 +0000
Date: Wed, 04 Mar 2026 13:50:59 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] sparc: remove architecture support
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:208:36e::25) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB752292F0685B382085838FB8C27CA@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|DS0PR10MB6728:EE_
X-MS-Office365-Filtering-Correlation-Id: 4646849a-1117-4e9a-8ce5-08de7a1efaa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	MOvlkaKdmwJeqjB2EmVg/Iim5N77lKYcJnsKEV8midJULyOldY7x5sF/5NoD+0ytJ0mavsKLWt7FmTefgApXqxXYevLNAG28whhz7MRMi8KL/eu5UtH+qkBqQKteadOvnVJHX8gsIdVmZnIoKkvMmsi7/dNVc/GCHhbXT1VHzsJvLIB/jz8rDvbENX+A5vzB2kTxyARzrS+kfUUk1gS8uFi+dXRwdI7DQ9aa8+wdmd1sXu2UUONGyzVrEoN3o/XrQZNNC7whvORLNNqodq5nQ2ziNkBh6zAa9YFmBgswou9WVTu2R3N4kPzAwYRXNr01YW/Sk9Yt7nccPR2gP6UGnsORzSL8hP0pfBeVMfAxaU+Ph11mXyJfrro2H7mNo6scz2rFcxip46oRG/6fEBACYYeprb+I3+IAJ6FHJJhjYJuoVJ5jnW76VZtLSAgai78QSoiqyvN4DYRbGssXbERQiZzceGaCJIFPiMSSpyTGyiExoCwaXnfWwg/J5pv/xsWmKkupc8WVfZb794uHM2C5Ibmh96CoCdHiBE4ujLNJ2ybjtv4wNvI9PpakMoxhMDRflv0gxtPqc/RHU9rPLD+wdZGRhK7TomoisWwgNoaasdj5D+zL2rw0deB3buY8ICixuVzohE8dt+amjGq1wKVkBsNWNRQxmzWUw5GTumtfyTwl21+6ZZ38HG2BWDXRFc8BFwf1iePdAK2YszD4+KFjemaUIeknnnoeyQmBpXpcNik=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P6tYsAczGG7ESD6Q4wLWzP/XaSw7TyOAFd+AVd/l8HHhLLNzsF2OO4if2l7v?=
 =?us-ascii?Q?eoOCm7gPr44YAagLeeR58ApA6zsbzCaQsCtZdZkJlqDbNX5nDGSMXiG1PZkM?=
 =?us-ascii?Q?BfRE9xZ3MM/4RvVcXJ8c7CRD5Z5as+dq8KrNMqjvukbtGu4SD7x8LHazqVR3?=
 =?us-ascii?Q?GbSiFluKDrju16RxMrkUew68P+P2CbDma715JlxdNL5KPhPcB/jj4KGaPvrG?=
 =?us-ascii?Q?cX7QAkXrgf5OWPSXGE7BcQI49K9GTivl0K3eRi+G3hvf39B9oR1F36uVI2ZU?=
 =?us-ascii?Q?iDnsmfoJLAqXYwr3D1mS2AvtkmkcMwfJlxMu8gdbvYu59vzA/Q56XECOrdLe?=
 =?us-ascii?Q?D6ALGxmY8MOysdVo9iCdS9ehIWn0vtN5E/nC7Z6ijUJqHM57f4bJ3GxxEHHo?=
 =?us-ascii?Q?j9FZC/npzDPKqwaEfKuxOF2+EUklonkaaCwBpyLSn0TMywRPVmIW5aiH69XJ?=
 =?us-ascii?Q?s+3CHydmSSLNcfmT+FE87MYx0TKB+GXpdZdGk/GydmF1m8u0rWjaFwiUh560?=
 =?us-ascii?Q?d5WarqnqO/vxjGT9ZzAzTccjt0M1cxlfp7sBK8FYtbMYSp8/eZK9Jzjiq4OO?=
 =?us-ascii?Q?2ZS3ahYT9ekdUFaPGABs4Earpoq3qxexxQ91XRkOemhPZOzZFOtrOwmCxyNb?=
 =?us-ascii?Q?s3W8Mibtu+FyW17RWIkJ+N2myzWQkigj+DS8rtUKgYimgU1a6tokeHnJlTnU?=
 =?us-ascii?Q?XOQRXactvbZ5QH9DQnaXY5v1C+pY/nrOR6kH65StVh2bhczo+7SFxEdE1zjH?=
 =?us-ascii?Q?FQM0Vn8MwmU2CDRtkMEsgXLcDIXXHyBnf/Ajzo3CdhpnnHufJfca+wzLy2hY?=
 =?us-ascii?Q?1JE1POuETnjUPES5uSxW3jDnbXf6XObbGw8YTizHgSfNRZ6FsBVpfJ+m124S?=
 =?us-ascii?Q?DJwRh4m6YB0yrF5r6rTcSq8ZXVEMkGrABt9MfFuRoSIU2ZsxKnDb0lu+XFkh?=
 =?us-ascii?Q?dZEWjvAgZRxX1lQ7VQMQNjukBoYY7qJRSBg9fLhqptvKhWy0FcqF2GfVO3c4?=
 =?us-ascii?Q?MyXpDA6xSrUOJwGYX+8dS2toYMBWL8/IbDup5CTS9oDyy5I8cDlJeOgruuUH?=
 =?us-ascii?Q?DwJ5FOPRtZDSWK8xRRZNC1DkHUtp+AzWyh5LWsSQ87RcVf/aC8GWdnOXDdef?=
 =?us-ascii?Q?Af+Jjl83j95xIoDm+BgdA/xT/yJt/X6kW3wtXnDGhFlLiEpgZ/FXzgy0DYCf?=
 =?us-ascii?Q?+DisN4To3FRL9ta48TgKISXabTcSihpTFkJiUjhsoXlWEvPmy2yeFPjlT/D3?=
 =?us-ascii?Q?Bs+6jMTvSa1Hicr6VMXqI8+0X9PZhByK1TgbnAUvqVKHMiNX3uQxHizT6Ot8?=
 =?us-ascii?Q?swvA1JxWLGH3XaHEbNnXFjG4rSKsLHimvo+XdM+liPUrPE9c82NUZ4PqUp9P?=
 =?us-ascii?Q?qJx520LpLDOdkKk739ltF2JHAYCZL1EdqENutlNxnVKyhp52PBd7voSwXWyB?=
 =?us-ascii?Q?qUVVigvwv5PNAlc1i8S7wvq7LQa4Y+bx2A0z2/DTy8MIbzqHwaki5VwLbVAS?=
 =?us-ascii?Q?aD/DNOKaiv2JtVHBw/iJXF1pDUefVadna0fEUc44h4pIdrrzUJ2cWAduYwdL?=
 =?us-ascii?Q?R38aMm4rgN3TlNjmrdNgM36vl8qNFbKt3vSbO0QIbfdaK6NdAlGxv99A+aNI?=
 =?us-ascii?Q?yuT+z1xL9NW+67EjAQAQxcJn9x5ju2iOL1CA4BskPAWlAouLsG4vuGjD8LBo?=
 =?us-ascii?Q?3rk3ClCRnphfZWwfhXPqFVV0KR20Zn4VsYbqof/67SET7EfvaH3wNATVylqh?=
 =?us-ascii?Q?bytfs/HO/w=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	YHtoW9AjKZbEmARiX2zxdANP5gzmNjsiR46FqGHGLEfyB1l2boJcz/M47N4xFNF3YBGhpO3oXzfxBDW4H3rFBimko4Wjkh95ahIuARdqLY5ZRG7f+0jSJBEJc5UEN0+xYGuw/eDdNZbgUlfrzpwqXr+5RfB3JurPpWHV8adhP2jL5+2JTu1C+sR7qwymEuFJc0SaccMlo2dGsKZGn5WWCEoBzKLVFYeNUftOuvRa1FOMqZQhYAGU/pU+Qwsz/euM1hZYcXID0clw1Tjg8H3Z0YucXwWBVnF8HDZx/clw9elZBsu6/04sEM7z2pf6Ac4fzywz+qIwjis9OZkyL93xSA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UCNbBrfmHERROvFPmXS8V6uWx88XjbvHPGLoCELLC8j1s31PnmlWh7vOVTNnNyeM9ZsqdJYqEaSugiugPWbqK0X54W2kyDarXdqkUYIZ/iD+9NrALvsPYTj+l+EdClIn47Fh9dwhYS8hyONnhDKqkneqlwcgJa+dix0LQ7RzAd5ufwnl5lkE1arJkI+KabK1KZIubU1DqMTJyemcjXrDJqOhDvRtmgi67UojkHs313WcV+FCm+Q6Zwnj10vo+Oy0rBvknHvtlTyUbX1Z0+Zy7y7rcNVlSLY/AeWm223AqfWaNZ/K9ze4SLYThYk59pMkqiQVGD2CY7zHVDRGCjSAn6yB6Y8C3xKLAhXv0fAMgVcBGekG7H2JJ9tQXqhz7kifms0TQQmutK3d3TT4Fm+TuNIJ3ykgL1mDl8784GVpv4+XJRcnKZNNxPgY0UQxtCA24T4F5tBd2mNlMfdWVSIvVybpjAlqBlCxfax2A2dW7skCFlM96ZfJ7vND1rbGEmVp/xBQOM3sOuz+BTTKnJLSgWfBilwmS85f4P0/JZuItcjeO3xpA9WkGKxH/lWQdUTrK+CYRr28SVXkarmR7dMZg9/cFiJ+qbMzUR82NdvYyVE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4646849a-1117-4e9a-8ce5-08de7a1efaa2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 18:51:00.6848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VEwHUPRWYEXOc+3v8bKRUDaCXUd2k7/dTzfoovUwxkVrrwxyuM0x6q2rfHi0/Hz6NeXXcYAI0ZTeoNfOVgItTviFKNMNZBJCUqo5q9DeN5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6728
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603040154
X-Proofpoint-GUID: 7fybGiYShKhVwMkzq6asMfD-08s8oXmN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE1NCBTYWx0ZWRfX7ZFvme02+WGn
 uHtjVL24Pqx6Oh1abauyfzCTN++ILEXdTGoBIKboGXaWgZje0OZwJhOy8LR3+kfdg0FKeE8d/Yw
 t3hfrS/M7y5b+/Y4YjYN2lSWOwcVnUPlB0L+0xasuGRJ2iHZxzlKcP2Svv4bDG57F+fUOmbiniz
 sBGSadbHg9zj6rdqaCckbYNj7A+5Z8igy8oi/RNe0m0Oe+3H0e874Y6tFA8EmQ6OKjWlFMPDOl8
 +pjq/PmDC1yN1X6UQv+MEefJbmbwJIY2NJgTKx+Qo/p34+QYcy7vdD9ACi/KBuFnGdlklx5YTnZ
 5B9u6bs0V9oZdECzTuJxaVyztQnspTPCbSyWPL1azRZ8Plm4xuyEnnl7fhqqAVn3U5ZSNzZnuaM
 gKB3Ww9TRJrfN+ddvCUbz8IUS0tvZ82mhfO+UNOpReOkZfGgjm1CbSb/83PGPiVt4NyzhQYdoVa
 BlhirPWT12BmXUr06wTyJJAOKLAu7ZHh9RmfWHG8=
X-Authority-Analysis: v=2.4 cv=b6W/I9Gx c=1 sm=1 tr=0 ts=69a87f19 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=RD47p0oAkeU5bO7t-o6f:22 a=yPCof4ZbAAAA:8 a=fIIfQ4eSsWJC7AIhdMgA:9
 a=3ZKOabzyN94A:10 cc=ntf awl=host:13812
X-Proofpoint-ORIG-GUID: 7fybGiYShKhVwMkzq6asMfD-08s8oXmN

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 COMMANDLINE-OPTIONS                           |   2 -
 GNUmakefile                                   |  10 +-
 libdtrace/dt_link.c                           |   4 +-
 libdtrace/dt_open.c                           |  13 --
 libdtrace/procfs.d.in                         |   3 +-
 libproc/sparc/isadep.c                        | 133 ------------------
 libproc/sparc/isadep.h                        |  81 -----------
 test/stress/fbtsafety/tst.vahole.d            |  50 -------
 test/unittest/arrays/tst.uregsarray.sparc64.d |  69 ---------
 test/unittest/arrays/tst.uregsarray.sparc64.x |   4 -
 test/unittest/pid/test.sparc64.options        |   1 -
 11 files changed, 7 insertions(+), 363 deletions(-)
 delete mode 100644 libproc/sparc/isadep.c
 delete mode 100644 libproc/sparc/isadep.h
 delete mode 100755 test/stress/fbtsafety/tst.vahole.d
 delete mode 100644 test/unittest/arrays/tst.uregsarray.sparc64.d
 delete mode 100755 test/unittest/arrays/tst.uregsarray.sparc64.x
 delete mode 100644 test/unittest/pid/test.sparc64.options

diff --git a/COMMANDLINE-OPTIONS b/COMMANDLINE-OPTIONS
index 73be89b1..5920129b 100644
--- a/COMMANDLINE-OPTIONS
+++ b/COMMANDLINE-OPTIONS
@@ -317,8 +317,6 @@ definitions are always specified and valid in all modes:
     * __linux
     * __unix
     * __SVR4
-    * __sparc (on SPARC® systems only)
-    * __sparcv9 (on SPARC® systems only when 64–bit programs are compiled)
     * __i386 (on x86 systems only when 32–bit programs are compiled)
     * __amd64 (on x86 systems only when 64–bit programs are compiled)
     * __`uname -s` (for example, __Linux)
diff --git a/GNUmakefile b/GNUmakefile
index 835bc9b5..93d2c960 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -20,8 +20,8 @@ VERSION := $(shell ./libdtrace/mkvers -vcurrent=t libdtrace/versions.list)
 
 ARCH := $(shell uname -m)
 
-$(if $(subst sparc64,,$(subst aarch64,,$(subst x86_64,,$(ARCH)))), \
-    $(error "Error: DTrace for Linux only supports x86_64, ARM64 and sparc64"),)
+$(if $(subst aarch64,,$(subst x86_64,,$(ARCH))), \
+    $(error "Error: DTrace for Linux currently only supports x86_64, ARM64"),)
 $(if $(subst Linux,,$(shell uname -s)), \
     $(error "Error: DTrace only supports Linux"),)
 
@@ -74,7 +74,7 @@ ifdef KERNELSRCDIR
 KERNELOBJDIR ?= $(KERNELSRCDIR)
 endif
 
-KERNELARCH := $(subst sparc64,sparc,$(subst aarch64,arm64,$(subst x86_64,x86,$(ARCH))))
+KERNELARCH := $(subst aarch64,arm64,$(subst x86_64,x86,$(ARCH)))
 
 # Paths.
 
@@ -120,7 +120,7 @@ export CC ?= gcc
 
 BITNESS := 64
 NATIVE_BITNESS_ONLY := $(shell echo 'int main (void) { }' | $(CC) -x c -o /dev/null -m32 - 2>/dev/null || echo t)
-ARCHINC := $(subst sparc64,sparc,$(subst aarch64,arm64,$(subst x86_64,i386,$(ARCH))))
+ARCHINC := $(subst aarch64,arm64,$(subst x86_64,i386,$(ARCH)))
 
 INVARIANT_CFLAGS := -std=gnu99 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 $(if $(NATIVE_BITNESS_ONLY),-DNATIVE_BITNESS_ONLY) -D_DT_VERSION=\"$(VERSION)\"
 CPPFLAGS += -Iinclude -Iuts/common -Iinclude/$(ARCHINC) -I$(objdir)
@@ -129,7 +129,7 @@ override CFLAGS += $(INVARIANT_CFLAGS)
 PREPROCESS = $(CC) -E
 export BPFC ?= bpf-unknown-none-gcc
 
-BPFCPPFLAGS += -D$(subst sparc64,__sparc,$(subst aarch64,__aarch64__,$(subst x86_64,__amd64,$(ARCH))))
+BPFCPPFLAGS += -D$(subst aarch64,__aarch64__,$(subst x86_64,__amd64,$(ARCH)))
 BPFCFLAGS ?= -O2 -Wall -Wno-unknown-pragmas $(if $(HAVE_BPFV3),-mcpu=v3) $(if $(HAVE_BPFMASM),-masm=normal) -ffreestanding
 export BPFLD ?= bpf-unknown-none-ld
 
diff --git a/libdtrace/dt_link.c b/libdtrace/dt_link.c
index 6d733881..340273fb 100644
--- a/libdtrace/dt_link.c
+++ b/libdtrace/dt_link.c
@@ -524,9 +524,7 @@ dtrace_program_link(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t dflags,
 
 		if (dtp->dt_oflags & DTRACE_O_ILP32) {
 			snprintf(drti, sizeof (drti), "%s/drti/drti32.o", libdir->dir_path);
-#if defined(__sparc)
-			emu = " -m elf32_sparc";
-#elif defined(__i386) || defined(__amd64)
+#if defined(__i386) || defined(__amd64)
 			emu = " -m elf_i386";
 #endif
 		} else {
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 54adec02..1322eb3d 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -827,19 +827,6 @@ dt_vopen(int version, int flags, int *errp,
 	else if (flags & DTRACE_O_ILP32)
 		dtp->dt_conf.dtc_ctfmodel = CTF_MODEL_ILP32;
 
-#ifdef __sparc
-	/*
-	 * On SPARC systems, __sparc is always defined for <sys/isa_defs.h>
-	 * and __sparcv9 is defined if we are doing a 64-bit compile.
-	 */
-	if (dt_cpp_add_arg(dtp, "-D__sparc") == NULL)
-		return set_open_errno(dtp, errp, EDT_NOMEM);
-
-	if (dtp->dt_conf.dtc_ctfmodel == CTF_MODEL_LP64 &&
-	    dt_cpp_add_arg(dtp, "-D__sparcv9") == NULL)
-		return set_open_errno(dtp, errp, EDT_NOMEM);
-#endif
-
 #ifdef __x86
 	/*
 	 * On x86 systems, __i386 is defined for <sys/isa_defs.h> for 32-bit
diff --git a/libdtrace/procfs.d.in b/libdtrace/procfs.d.in
index 23454d63..6a0e0122 100644
--- a/libdtrace/procfs.d.in
+++ b/libdtrace/procfs.d.in
@@ -286,8 +286,7 @@ define_for_kernel([[on_cpu]], [[(m4_kver(5,16,0), m4_dnl
   [[((struct thread_info *)T->stack)->cpu]]), m4_dnl
 (m4_kver(4,9,0), m4_dnl
   [[if_arch([[x86]],[[T->cpu]])]] m4_dnl
-  [[if_arch([[arm64]],[[T->cpu]])]] m4_dnl
-  [[if_arch([[sparc]],[[((struct thread_info *)T->stack)->cpu]])]])]], m4_dnl
+  [[if_arch([[arm64]],[[T->cpu]])]]l)]], m4_dnl
 [[((struct thread_info *)T->stack)->cpu]])m4_dnl
 	pr_onpro = on_cpu;
 };
diff --git a/libproc/sparc/isadep.c b/libproc/sparc/isadep.c
deleted file mode 100644
index aa4f53f5..00000000
--- a/libproc/sparc/isadep.c
+++ /dev/null
@@ -1,133 +0,0 @@
-/*
- * ISA-dependent functions for SPARC and SPARC64.
- */
-
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2013, 2020, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-#include <inttypes.h>
-#include <errno.h>
-#include <string.h>
-#include <sys/ptrace.h>
-#include <asm/ptrace.h>				/* for struct pt_regs */
-
-#include "Pcontrol.h"
-#include "libproc.h"
-#include "platform.h"
-
-#define PTRACE_GETREGSET        0x4204
-
-/*
- * Get a SPARC64 regset.
- */
-static struct pt_regs *
-getregs_sparc64(struct ps_prochandle *P, struct pt_regs *regs)
-{
-	if (Pstate(P) == PS_RUN ||
-	    Pstate(P) == PS_DEAD)
-		return NULL;
-
-	if (wrapped_ptrace(P, PTRACE_GETREGS64, P->pid, regs) < 0)
-		return NULL;
-
-	return regs;
-}
-
-static struct pt_regs32 *
-getregs_sparc32(struct ps_prochandle *P, struct pt_regs32 *regs)
-{
-	if (Pstate(P) == PS_RUN ||
-	    Pstate(P) == PS_DEAD)
-		return NULL;
-
-	if (wrapped_ptrace(P, PTRACE_GETREGS, P->pid, regs) < 0)
-		return NULL;
-
-	return regs;
-}
-
-/*
- * Read the first argument of the function at which the process P is halted,
- * which must be a pointer (though other integral arguments happen to work for
- * the SPARC and SPARC64 ABI).
- *
- * For SPARC, the first integral argument to a function will always be in %i0.
- * Horrifically, the value of all the UREG_* constants is off by 1, so we have
- * to correct for that.
- *
- * On error, -1 cast to a uintptr_t is returned, and errno is set.
- */
-uintptr_t
-Pread_first_arg_sparc64(struct ps_prochandle *P)
-{
-	struct pt_regs regs;
-
-	if (getregs_sparc64(P, &regs) == NULL)
-		return (uintptr_t)-1;
-
-	return regs.u_regs[UREG_I0 - 1];
-}
-
-uintptr_t
-Pread_first_arg_sparc32(struct ps_prochandle *P)
-{
-	struct pt_regs32 regs;
-
-	if (getregs_sparc32(P, &regs) == NULL)
-		return (uintptr_t)-1;
-
-	return regs.u_regs[UREG_I0 - 1];
-}
-
-/*
- * Get the address at which we stopped at a breakpoint.  Unlike on x86, no post
- * facto adjustment is required.
- */
-uintptr_t
-Pget_bkpt_ip_sparc64(struct ps_prochandle *P, int expect_esrch)
-{
-	struct pt_regs regs;
-
-	if (getregs_sparc64(P, &regs) == NULL) {
-		if ((errno == ESRCH) && (expect_esrch))
-			return 0;
-		else {
-			_dprintf("Unexpected ptrace (PTRACE_GETREGSET) "
-			    "error: %s\n", strerror(errno));
-			return -1;
-		}
-	}
-
-	return regs.tpc;
-}
-
-/*
- * Reset the instruction pointer address at which the process P is stopped.
- * (Not needed on SPARC.)
- */
-long
-Preset_bkpt_ip_sparc(struct ps_prochandle *P, uintptr_t addr)
-{
-    return 0; /* nothing doing */
-}
-
-/*
- * Get the address at which the temporary breakpoint should be dropped when a
- * breakpoint is hit.
- */
-extern long Pget_next_ip_sparc64(struct ps_prochandle *P, uintptr_t addr)
-{
-	struct pt_regs regs;
-
-	if (getregs_sparc64(P, &regs) == NULL) {
-		_dprintf("Unexpected ptrace (PTRACE_GETREGSET) "
-		    "error: %s\n", strerror(errno));
-		return -1;
-	}
-
-	return regs.tnpc;
-}
diff --git a/libproc/sparc/isadep.h b/libproc/sparc/isadep.h
deleted file mode 100644
index 005e6008..00000000
--- a/libproc/sparc/isadep.h
+++ /dev/null
@@ -1,81 +0,0 @@
-/*
- * Underlying ISA-dependent functions for SPARC and SPARC64.
- */
-
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2013, 2015, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * Not protected against multiple inclusion: this file is included by
- * isadep_dispatch.h repeatedly, at local scope, to get different prototypes and
- * dispatch variables.
- */
-
-#ifdef WANT_FIRST_ARG_DISPATCH
-
-extern	uintptr_t Pread_first_arg_sparc64(struct ps_prochandle *P);
-extern	uintptr_t Pread_first_arg_sparc32(struct ps_prochandle *P);
-
-isa_dispatch_t dispatch[] = {
-    {B_FALSE, EM_SPARCV9, (dispatch_fun_t *) Pread_first_arg_sparc32},
-    {B_TRUE, EM_SPARCV9, (dispatch_fun_t *) Pread_first_arg_sparc64},
-    {B_FALSE, EM_SPARC32PLUS, (dispatch_fun_t *) Pread_first_arg_sparc32},
-    {B_TRUE, EM_SPARC32PLUS, (dispatch_fun_t *) Pread_first_arg_sparc64},
-    {B_FALSE, EM_SPARC, (dispatch_fun_t *) Pread_first_arg_sparc32},
-    {B_TRUE, EM_SPARC, (dispatch_fun_t *) Pread_first_arg_sparc64}, /* ??? */
-    {0, 0, NULL}};
-
-#endif
-
-#ifdef WANT_GET_BKPT_IP
-
-extern uintptr_t Pget_bkpt_ip_sparc64(struct ps_prochandle *P, int expect_esrch);
-
-/*
- * I hope 32-on-64 traps are treated like 64-on-64 traps.
- */
-
-isa_dispatch_t dispatch[] = {
-    {B_FALSE, EM_SPARCV9, (dispatch_fun_t *) Pget_bkpt_ip_sparc64},
-    {B_TRUE, EM_SPARCV9, (dispatch_fun_t *) Pget_bkpt_ip_sparc64},
-    {B_FALSE, EM_SPARC32PLUS, (dispatch_fun_t *) Pget_bkpt_ip_sparc64},
-    {B_TRUE, EM_SPARC32PLUS, (dispatch_fun_t *) Pget_bkpt_ip_sparc64},
-    {B_FALSE, EM_SPARC, (dispatch_fun_t *) Pget_bkpt_ip_sparc64},
-    {B_TRUE, EM_SPARC, (dispatch_fun_t *) Pget_bkpt_ip_sparc64}, /* ??? */
-    {0, 0, NULL}};
-
-#endif
-
-#ifdef WANT_RESET_BKPT_IP
-
-extern	long Preset_bkpt_ip_sparc(struct ps_prochandle *P, uintptr_t addr);
-
-isa_dispatch_t dispatch[] = {
-    {B_FALSE, EM_SPARCV9, (dispatch_fun_t *) Preset_bkpt_ip_sparc},
-    {B_TRUE, EM_SPARCV9, (dispatch_fun_t *) Preset_bkpt_ip_sparc},
-    {B_FALSE, EM_SPARC32PLUS, (dispatch_fun_t *) Preset_bkpt_ip_sparc},
-    {B_TRUE, EM_SPARC32PLUS, (dispatch_fun_t *) Preset_bkpt_ip_sparc},
-    {B_FALSE, EM_SPARC, (dispatch_fun_t *) Preset_bkpt_ip_sparc},
-    {B_TRUE, EM_SPARC, (dispatch_fun_t *) Preset_bkpt_ip_sparc}, /* ??? */
-    {0, 0, NULL}};
-
-#endif
-
-#ifdef WANT_GET_NEXT_IP
-
-extern	long Pget_next_ip_sparc64(struct ps_prochandle *P, uintptr_t addr);
-
-isa_dispatch_t dispatch[] = {
-    {B_FALSE, EM_SPARCV9, (dispatch_fun_t *) Pget_next_ip_sparc64},
-    {B_TRUE, EM_SPARCV9, (dispatch_fun_t *) Pget_next_ip_sparc64},
-    {B_FALSE, EM_SPARC32PLUS, (dispatch_fun_t *) Pget_next_ip_sparc64},
-    {B_TRUE, EM_SPARC32PLUS, (dispatch_fun_t *) Pget_next_ip_sparc64},
-    {B_FALSE, EM_SPARC, (dispatch_fun_t *) Pget_next_ip_sparc64},
-    {B_TRUE, EM_SPARC, (dispatch_fun_t *) Pget_next_ip_sparc64}, /* ??? */
-    {0, 0, NULL}};
-
-#endif
diff --git a/test/stress/fbtsafety/tst.vahole.d b/test/stress/fbtsafety/tst.vahole.d
deleted file mode 100755
index 732ae3ca..00000000
--- a/test/stress/fbtsafety/tst.vahole.d
+++ /dev/null
@@ -1,50 +0,0 @@
-#!dtrace -Cs
-
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/* @@skip: nonportable */
-
-/*
- * We set our buffer size absurdly low to prevent a flood of errors that we
- * don't care about.
- */
-#pragma D option bufsize=16
-#pragma D option bufpolicy=ring
-
-fbt:::
-{
-	n++;
-#ifdef __sparc
-	trace(*(int *)0x8000000000000000 ^ rand());
-#else
-	trace(*(int *)(`kernelbase - 1));
-#endif
-}
-
-dtrace:::ERROR
-{
-	err++;
-}
-
-tick-1sec
-/sec++ == 10/
-{
-	exit(2);
-}
-
-END
-/n == 0 || err == 0/
-{
-	exit(1);
-}
-
-END
-/n != 0 && err != 0/
-{
-	exit(0);
-}
diff --git a/test/unittest/arrays/tst.uregsarray.sparc64.d b/test/unittest/arrays/tst.uregsarray.sparc64.d
deleted file mode 100644
index 2179a0db..00000000
--- a/test/unittest/arrays/tst.uregsarray.sparc64.d
+++ /dev/null
@@ -1,69 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-/* @@xfail: dtv2 */
-
-/*
- * ASSERTION:
- *	Positive test to make sure that we can invoke sparc
- *	ureg[] aliases.
- *
- * SECTION: User Process Tracing/uregs Array
- *
- * NOTES: This test does no verification - the value of the output
- *	is not deterministic.
- */
-
-#pragma D option quiet
-
-BEGIN
-{
-	printf("R_G0 = 0x%x\n", uregs[R_G0]);
-	printf("R_G1 = 0x%x\n", uregs[R_G1]);
-	printf("R_G2 = 0x%x\n", uregs[R_G2]);
-	printf("R_G3 = 0x%x\n", uregs[R_G3]);
-	printf("R_G4 = 0x%x\n", uregs[R_G4]);
-	printf("R_G5 = 0x%x\n", uregs[R_G5]);
-	printf("R_G6 = 0x%x\n", uregs[R_G6]);
-	printf("R_G7 = 0x%x\n", uregs[R_G7]);
-	printf("R_O0 = 0x%x\n", uregs[R_O0]);
-	printf("R_O1 = 0x%x\n", uregs[R_O1]);
-	printf("R_O2 = 0x%x\n", uregs[R_O2]);
-	printf("R_O3 = 0x%x\n", uregs[R_O3]);
-	printf("R_O4 = 0x%x\n", uregs[R_O4]);
-	printf("R_O5 = 0x%x\n", uregs[R_O5]);
-	printf("R_O6 = 0x%x\n", uregs[R_O6]);
-	printf("R_O7 = 0x%x\n", uregs[R_O7]);
-	printf("R_L0 = 0x%x\n", uregs[R_L0]);
-	printf("R_L1 = 0x%x\n", uregs[R_L1]);
-	printf("R_L2 = 0x%x\n", uregs[R_L2]);
-	printf("R_L3 = 0x%x\n", uregs[R_L3]);
-	printf("R_L4 = 0x%x\n", uregs[R_L4]);
-	printf("R_L5 = 0x%x\n", uregs[R_L5]);
-	printf("R_L6 = 0x%x\n", uregs[R_L6]);
-	printf("R_L7 = 0x%x\n", uregs[R_L7]);
-	printf("R_I0 = 0x%x\n", uregs[R_I0]);
-	printf("R_I1 = 0x%x\n", uregs[R_I1]);
-	printf("R_I2 = 0x%x\n", uregs[R_I2]);
-	printf("R_I3 = 0x%x\n", uregs[R_I3]);
-	printf("R_I4 = 0x%x\n", uregs[R_I4]);
-	printf("R_I5 = 0x%x\n", uregs[R_I5]);
-	printf("R_I6 = 0x%x\n", uregs[R_I6]);
-	printf("R_I7 = 0x%x\n", uregs[R_I7]);
-	printf("R_CCR = 0x%x\n", uregs[R_CCR]);
-	printf("R_PC = 0x%x\n", uregs[R_PC]);
-	printf("R_NPC = 0x%x\n", uregs[R_NPC]);
-	printf("R_Y = 0x%x\n", uregs[R_Y]);
-	printf("R_ASI = 0x%x\n", uregs[R_ASI]);
-	printf("R_FPRS = 0x%x\n", uregs[R_FPRS]);
-	exit(0);
-}
-
-ERROR
-{
-	printf("uregs access failed.\n");
-	exit(1);
-}
diff --git a/test/unittest/arrays/tst.uregsarray.sparc64.x b/test/unittest/arrays/tst.uregsarray.sparc64.x
deleted file mode 100755
index 2c34e04d..00000000
--- a/test/unittest/arrays/tst.uregsarray.sparc64.x
+++ /dev/null
@@ -1,4 +0,0 @@
-#!/bin/sh
-
-[ `uname -m` = "sparc64" ] && exit 0
-exit 2
diff --git a/test/unittest/pid/test.sparc64.options b/test/unittest/pid/test.sparc64.options
deleted file mode 100644
index 9e81427e..00000000
--- a/test/unittest/pid/test.sparc64.options
+++ /dev/null
@@ -1 +0,0 @@
-@@skip: pid provider not yet implemented (sparc64)
-- 
2.51.0

