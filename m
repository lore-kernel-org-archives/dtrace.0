Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C03816BE02
	for <dtrace@lists.linux.dev>; Fri,  2 Aug 2024 16:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722616529; cv=fail; b=ZMKVkYVv/h3HvcPFWuGQ7B4fZrRkp+DLDMQmDGj3Q0cd6HBYkmYjaB7Hcqz2/4OYYzEl1s7QRPAWt10mZGvVKgqX4gCaB/coeQSdoe8NgpmOWey2FePPFW3DyyhSfsd1xl1gIt+jCWl0acDZkjs7eQlJwjmqq7d9e2GlZe3LMJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722616529; c=relaxed/simple;
	bh=nSdcgdUWUbCSEQFgiYMSO44Fpu4IhLqI1qoyIYWLub0=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=Bac5LdaPsTwdKsaUNjojIzWLwY7arNap4tjVtJUBZ7ZhL1gucffosYbB2gK6vK2DsBcpZVgceNjtSA+HsXtqiKt71TmQtfvXpQ7aFnroClvDHpxoR6AWy9r1eT5v97Y7UvEcpH5p4Ez6Ps0eq1HWXHztw+P7sUujMRh47HCfVF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ipb9p7dL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lh9FBdQo; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ipb9p7dL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lh9FBdQo"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 472DH09s027840
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 16:35:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=G03A1EEFluRpQViOF5xvPvTMg6teLZY6+DkKlIfJN74=; b=
	ipb9p7dL2OSfWrXCfatF/lr0+vyqIartFxw0qeuAZfLArjYuEIHFLzx3d7YSJMne
	UZMKJt7OsYkynSqhYxOBVGN6uo0RyFepM0e2zjRS9eQRNN4WcRCYlJ1Iphaq5j9i
	diQcH0N3vJq51BpbzRswOqMerFIVsvBQ39ALHPya6pX/4u/4PsmHbAJMerHPkOzX
	hA1DyuO50LlrQC3jcQP8F7DNXIdsPvA3yPjyonDVQb92EdyaFBh4a4V0+mc1pjuE
	1IIcMP6Dvg8wWQsDNEOV82P8aT0z+IXladMM5a7w4ELaxJP8G4qtBNhLBSGYazEI
	o0YnhmWsbMIzQXkjm3G+FA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40rje69jn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 16:35:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 472G2brd035417
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 16:35:25 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40pm87g933-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 16:35:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d553QztAYsdQhibnA+p5oh4gKiWAqwyErLXYkPSdY5G3X0zzZcXXWtaejXizo2q8z39Od7ehINpXrw4pKAivt/2udRspMSw0SRVZEYb4WKJF/Psnk14mABZhAUDbNkuhvdKjOV4kiHdLYOd1CN9xf4tMQy2XWQoBijPnxUyLc1L2YuXDp3osxYxbJgdYBBxA/VPdDCYbxyU0gNHZiHaj8vk5chcOIVQ6H2A8nTotAbABqsbP9iV9RiVOs49UiQyk11xAxC934g3OBXg2B1GFC1GpapcGpWuHALsJ30SIJLb2p9zF+PmqeLK1/2/XtnKeOrG0CpRHgD9TrZevKP17hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G03A1EEFluRpQViOF5xvPvTMg6teLZY6+DkKlIfJN74=;
 b=mgl/QnMrd0E0uGsn7ZtncsyPHniNQJxvuzTU5Tsxz3qJSasFmJ8lXIykn2PUjTI4mxFC+LXsHcujlVBhx5yH8cRhsb64ByF+jzPiWG76R4DayH7kK5MHDJ8VbZeUVuTMR7q0MK8846lXX8cW+Up5BilrH/VS43kimZXzYTDRpKaK2wri7p8L81gePFz8DfCfTJtMvBgc/8Sb2VmMDnwHtoiM2uMCSGV65q7AMp3Ve1GGs5Ys5qXl6rhdIaFxoV/LgKL0cFbKPpyZIbM4HPM1piX5qIJV6kikjzp+ZKFDb8aqJHGBWhVTrEL7MLUzfmMf0vdgzm4ZGKUr2MW+9f4sdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G03A1EEFluRpQViOF5xvPvTMg6teLZY6+DkKlIfJN74=;
 b=lh9FBdQodCKANqVgcNGVDn6S8L9HoEYB+vL5RSJhM4dZkluy3ccSMWhbKqytIndl6FT4+6CJNnFzE3c4T9E8l6ctuDs9KJ29FYToAfApVDW496EkxDisPK0zXbOloP2v3yhmPSUlsDseT30+Fcu34CkLBwoKVOBpX4X/habLq+Q=
Received: from PH8PR10MB6292.namprd10.prod.outlook.com (2603:10b6:510:1c3::5)
 by DS0PR10MB7398.namprd10.prod.outlook.com (2603:10b6:8:135::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 16:35:22 +0000
Received: from PH8PR10MB6292.namprd10.prod.outlook.com
 ([fe80::7f53:c7c9:4dc6:d4a6]) by PH8PR10MB6292.namprd10.prod.outlook.com
 ([fe80::7f53:c7c9:4dc6:d4a6%2]) with mapi id 15.20.7807.026; Fri, 2 Aug 2024
 16:35:22 +0000
Date: Fri, 02 Aug 2024 12:35:20 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3] bpf, fbt: do not try to get a return value for void
 function return pronbes
Content-Type: text/plain
X-ClientProxiedBy: BL1P223CA0005.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::10) To PH8PR10MB6292.namprd10.prod.outlook.com
 (2603:10b6:510:1c3::5)
Message-ID:
 <PH8PR10MB629267A7B790147418169E8DC2B32@PH8PR10MB6292.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6292:EE_|DS0PR10MB7398:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ec7a3c4-cfc8-4f95-3d45-08dcb3111ac3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LJJDiXFZCbs1P04XWWWhkzf567MgR7lKBOScIkikKbFB2g1+c6TiteK+HvK/?=
 =?us-ascii?Q?koUze+ZnhXaenUwa0QYJnQNLzJWzYTe+qNUH2MuuXubnahGtGrZR0kPY++EU?=
 =?us-ascii?Q?M46kxUwCG88b3TsdfBMW9auZKtlifUc9lIM+laoSVqJVPsdX5LasiVwUjACW?=
 =?us-ascii?Q?wPEzULVOS9OO/JNsrA7AAJKP/xJsDrj7syYyTrQdFQPHBHDvfSgRludYP5ig?=
 =?us-ascii?Q?ovsb4Kk5CRHCOTP1NSr0I5h1ixrVM5gq55Cz5gqOEkBLjXh0FL4g7U21EKTH?=
 =?us-ascii?Q?QyZU8KsG9zZvexUI/XRdW7JrZ7rhqLY9P4yn/0GA1DFYoCFkVD3MWkmufECj?=
 =?us-ascii?Q?+ZTWc+d7aMyETk/tnaqw/w/G5qWwzQYAs5sqqsHmx+cdgy/UImVHyKaKUeTd?=
 =?us-ascii?Q?wQq3e4vSDrO2V7k25bPbOsIeDi9fx25sShnfNLKVsv0DddgGBtGMhRygMNgA?=
 =?us-ascii?Q?iiiUT94fAgpUOaxSGX84jVnBUvVUkfrTZmot3l08YtIhRh5gxQyYagtODju7?=
 =?us-ascii?Q?0wkSPAgL4XrUrDAq5AR+3AJrVHMoK5lttyHm3uUw2mYw0RdS5AgKj2BTd2fH?=
 =?us-ascii?Q?KNg9sE2ElQFbEiXN1S//uU6+K6TWxZtfHrSLmJBEVcVNVLaN5siCtl23RvBx?=
 =?us-ascii?Q?18/KxTegLfewkpYYBIHTXXkPesK/CpDErGGEBNTDi7iQ3fDPZV3HuXP9ZQoP?=
 =?us-ascii?Q?sZunCzFz0ElG6x88Sfw5ihnavVDhzHutrE1T4qyr12yYAno7acxifyD5SjNi?=
 =?us-ascii?Q?3B2vOQ+mTRXDqHVIY2/I9Y/NR0QDtdjThAsIEq0ToehE5hxXIoVch/IvfKCU?=
 =?us-ascii?Q?+8QTrCGQkfGqXfavi/X05op0D0qfmjYPEgYJjmsW9iBYb+kb8v23+RlyJTm7?=
 =?us-ascii?Q?IKqwyxLi/IYGL0H00QBDVt2c7w5NylPvg04OD+FT2Jg7e+6/EAQdVLXydD+D?=
 =?us-ascii?Q?ypwc+XZwm2hC6NMBI1uWryvozL6ZUVe3AuFpXJlvnMCPK4MgqcGkTP+TCUUH?=
 =?us-ascii?Q?BbravraL2qWOZ4vB+R4p4gKC1IF74wSRHsBz2ykk8CvbwDI8VAStW/WhRoyc?=
 =?us-ascii?Q?EhG2y+vC1OrDAHCxa2BWzuVp3afZ9TweZd4par5QTBi8dRjW7oZIHeBMPnmj?=
 =?us-ascii?Q?GKbDIFVq/bsYzwHvGidJBs3MZttAEiMqgdLwYpd4kAqIR9gFLI1Z9JvD+Efu?=
 =?us-ascii?Q?iu8WqLaHGT/DiRThFWbEIR0Fh3QUA5HsK7TPBfEv0M3A/7LxZxi1mI1mzyTH?=
 =?us-ascii?Q?ZbreP9L/zhUSV/TEMmYSlE/Pcpab8QHMd1RQVrtFx/+GUg6IaO9uhZ/BQOgf?=
 =?us-ascii?Q?nl2oT5eDZkKcyCiV7e6ZXkHqxY6EMTkj1k+Js78Nyrq8pD+yVCev8cEvskuS?=
 =?us-ascii?Q?epp8FiA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6292.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i2FhIxa7lOLfw9E1aha/bK/eeyc2nsCbe9TdWSy+smoTMeX/0Wgi25cXXVtk?=
 =?us-ascii?Q?G2TzV3RWrSOjsWGFfdqJ8eS59FG7tNVrtEgKdHbylUdj8nRBRUE5dCM1FApS?=
 =?us-ascii?Q?CcoXUQnPny8o67cEdCkW4Xk0iz9ic0UwpWI29u3Ot9zZM1X0hEac2L8yNabP?=
 =?us-ascii?Q?Iqw4/FSrlVHFZDnKMWmmq1m5VpTNCKYHk6czSyoH5x9D25bxOEV02UL38ucG?=
 =?us-ascii?Q?lCtUQVmS+PZ0WzUEvZvFuAGKfQZQP21XJsqlYVLn8uxJTd6KjuqEs1ls+DuS?=
 =?us-ascii?Q?CcDIM6If+UqZ6fZEaYK8aDrYxIGTnphH16oqSsr5byB/eql/1rmNDLvFAyTr?=
 =?us-ascii?Q?WujvTj1RMIG1KoXRREU2x8MipjsZtXb/XuCdtSkEJK+s3IqXPW1UCaGeGXvW?=
 =?us-ascii?Q?syglPhcDk6Kih4KjZiD5toaUiAgxLZ1DH7GqQ5FIJyWwzQEdX5EyLjOTN6dI?=
 =?us-ascii?Q?wJAFZh0zXHZWTZBJf20HW7vtm0Vc2HhHBb9XU0zSObh8Ff6hQS/bg05PC879?=
 =?us-ascii?Q?5J6+Lbrrda05V6h6E6oTX7sN3nfpzgHd6DFmViI/YDGnVu/f7WFiMCpY4609?=
 =?us-ascii?Q?zN75NnaNQGnE3VAGrqnZcVUP6oWNKL/YULdjvXFiW71vhn+6unZ7dI7xnBv8?=
 =?us-ascii?Q?oWXpvP+cyTiRWlTq4JkJbzZVYXvxfex0fxnUm9giiOD3jBBGWMTMxUYD2+48?=
 =?us-ascii?Q?IuTXD/Lnx62saO1AGAupZGD2Wfj6zRvPe9F/NDlXL7UEMQJaDr/Xd+kBfI2i?=
 =?us-ascii?Q?6aVVOFJWEMS9aEeFZq7vADF34gCJXf/26MMNtBV4dEnlV+xzgoHx0/Q6P0lB?=
 =?us-ascii?Q?pa9qGeu1wBI3ZExoxL12KAfLqKSFvCTls7en3bHwJmMPceyRnlrQw3QJINOq?=
 =?us-ascii?Q?UWsp2yeI2yMfxcUiUZ+mRfJSPYjeHVz32k8jaK97tyeDsaV5VgsTMwAU6uoP?=
 =?us-ascii?Q?h5dhycMo6+Qv7DRN8CIlgR7a7QqH/521YETHLM+gERcOSUjquqpalQZ/KbbJ?=
 =?us-ascii?Q?vihyNu+eOrVnVWYFNkRL0MEQy8GNrISW8jVJTM0PzKCZszj2KbLqqqm2LO3S?=
 =?us-ascii?Q?36RWcYnrCp/ZY3ZEeCSZb9LvRzCd6WvSwVo8EOi2hBDV1ieFA8j4vmyxqeic?=
 =?us-ascii?Q?izt98Kl25AohQF84/efJoudGZojLkoRIXcBnPUZ+BV6Pw/BNrol8F1P6xKgr?=
 =?us-ascii?Q?aox8BRrI3Z6ChUB2VdK0Gs+y7eBGSjh9Rorm02rwugNDmBobBGtWxYkXIZBd?=
 =?us-ascii?Q?xmrvB8PGVFJikT9bjLYzRbVuxpo75L6RLODej1CBuibva0Rzp4Qp+ly6bLBe?=
 =?us-ascii?Q?VgmpzWTdbwbbq22mJphg8cpp0kch4nvS9irJk65x+Xeu11eKjrp2mInTdMD5?=
 =?us-ascii?Q?IQmJ9VbrtgNTxmogK9ohaU0/gmxtk/mwo8gPOfSq/XamwJtygLdO3nF6wNT5?=
 =?us-ascii?Q?WTXWfHn2tSKpa6Sn4z0MW5FfjuC6ZVZzIOwmvA9UTNGG6ndHPmLuUJvgAEjo?=
 =?us-ascii?Q?I9+x62hvOjpZW3rIkptdcGOmasRA1Gi3Besl1JAUW6hIUB4szGmjFkysjlYp?=
 =?us-ascii?Q?Nmra2CTlPYfeFYHvo/kgHw5omal3kCZ24F1opPIa+9GCkztIeGpp9b+tj0y9?=
 =?us-ascii?Q?M0Tnn34+6KYW8mP+NAP70GY=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MdEnY6QPIoAAUdX21oAqZky8nRp7aDKvBLi2G8+1U350fy6JdJPH5KgdIJu4dJevbkxN/eftQIC5j+c5/GVS/pAotGWRULb+YOcgeIzxQ8cPkxXua3ac9h4BSkJqToGgtT7ymtVoO0wq4ztPGm6O+dUiYvNJQ47Vsoj6zw2OlK1fxkc040Tk7GBhDMcuOGHxWutkbm3lPEI8NXf35sxvgkjnC/42ZCkca4pjKkS9a5wuapTW1kwhhjZVT1gkX5E5Zu5C9JHvK8UHjWWHxKB7A6YmPrvpxawSKOx+9mKB4uRgK8t5dwWQ8SyEBoVXPmXkNX3o0eNhDVqmPNmBW7PbY7n9ULBMt2V28J6wVOALpQFgi7xbFBP4lrvS8oN/60UxNGG+PVtkKE2aKshyD9ZjDDlkX7LEiNwpd8Z2kMlmlpf0N+abinyYGmU2yrjWKRxOI0IM43g7/rqlIPD8OYseSfgI41gbd6KX55FLhHHZhfNozm5pNopwzHUs16VygE/6wcKux+eysn+cNN7qJ7Pnz6pqExqXM4/31RnSfDcrJB7TBuX5UPMIO/GyUyn4HDXFBO93QtExv3APONV2aYGKetqBBkcxHQO4LqiiEiEBhbo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec7a3c4-cfc8-4f95-3d45-08dcb3111ac3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6292.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 16:35:22.5662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DkOY8ILMNle3AmL8XX4PjKUtlHZH2s8X8+aID3Af1kvMFY5hRVN3CaZquXaupQQ7P7Tjiw4DTGnHHJbzDb6wHHNuQNfcaNLZrd/dF9wbDN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7398
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_12,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 mlxscore=0
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408020115
X-Proofpoint-GUID: JuCZwA6kNYWU4YArxYhbt2terSuokPuY
X-Proofpoint-ORIG-GUID: JuCZwA6kNYWU4YArxYhbt2terSuokPuY

We were trying to access a return value for void functions, causing BPF
verifier failures.  We can determine the return type when getting the
probe info, and set the return probe argc value accordingly.  This then
drives the code generation in the trampoline.

Reported-by: Alan Maguire <alan.maguire@oracle.com>
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_btf.c                            | 16 +++++++++++++
 libdtrace/dt_btf.h                            |  2 ++
 libdtrace/dt_prov_fbt.c                       | 21 +++++++++-------
 .../fbtprovider/err.D_ARGS_IDX.void-void.d    | 24 +++++++++++++++++++
 .../fbtprovider/err.D_ARGS_IDX.void.d         | 24 +++++++++++++++++++
 5 files changed, 78 insertions(+), 9 deletions(-)
 create mode 100644 test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.d
 create mode 100644 test/unittest/fbtprovider/err.D_ARGS_IDX.void.d

diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
index 77366df6..e905580f 100644
--- a/libdtrace/dt_btf.c
+++ b/libdtrace/dt_btf.c
@@ -980,3 +980,19 @@ dt_btf_func_argc(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
 
 	return -1;
 }
+
+int
+dt_btf_func_is_void(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
+{
+	btf_type_t	*type = dt_btf_type_by_id(dtp, btf, id);
+
+	/* For functions, move on to the function prototype. */
+	if (BTF_INFO_KIND(type->info) == BTF_KIND_FUNC)
+		type = dt_btf_type_by_id(dtp, btf, type->type);
+
+	if (BTF_INFO_KIND(type->info) == BTF_KIND_FUNC_PROTO &&
+	    type->type == 0)
+		return 1;
+
+	return 0;
+}
diff --git a/libdtrace/dt_btf.h b/libdtrace/dt_btf.h
index a7cee464..e05b30d0 100644
--- a/libdtrace/dt_btf.h
+++ b/libdtrace/dt_btf.h
@@ -25,6 +25,8 @@ extern int32_t dt_btf_lookup_name_kind(dtrace_hdl_t *, dt_btf_t *,
 				       const char *, uint32_t);
 extern int dt_btf_func_argc(dtrace_hdl_t *dtp, const dt_btf_t *btf,
 			    uint32_t id);
+extern int dt_btf_func_is_void(dtrace_hdl_t *dtp, const dt_btf_t *btf,
+			       uint32_t id);
 extern int dt_btf_get_module_ids(dtrace_hdl_t *);
 extern int dt_btf_module_fd(const dt_module_t *);
 
diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 461d5e35..80c3db20 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -199,13 +199,15 @@ static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
 
 		/*
+		 * Only try to retrieve a return value if we know we can.
+		 *
 		 * The return value is provided by the fexit probe as an
 		 * argument slot past the last function argument.  We can get
 		 * the number of function arguments using the BTF id that has
 		 * been stored as the tracepoint event id.
 		 */
 		dmp = dt_module_lookup_by_name(dtp, prp->desc->mod);
-		if (dmp != NULL) {
+		if (dmp && prp->argc == 2) {
 			int32_t	btf_id = dt_tp_get_event_id(prp);
 			int	i = dt_btf_func_argc(dtp, dmp->dm_btf, btf_id);
 
@@ -240,7 +242,9 @@ static int fprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 	dt_tp_set_event_id(prp, btf_id);
 
 	if (strcmp(desc->prb, "return") == 0) {
-		argc = 2;
+		/* Void function return probes only provide 1 argument. */
+		argc = dt_btf_func_is_void(dtp, dmp->dm_btf, btf_id) ? 1 : 2;
+
 		argv = dt_calloc(dtp, argc, sizeof(dt_argdesc_t));
 		if (argv == NULL)
 			return dt_set_errno(dtp, EDT_NOMEM);
@@ -250,13 +254,12 @@ static int fprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 		argv[0].native = strdup("uint64_t");
 		argv[0].xlate = NULL;
 
-		/*
-		 * The return type is a generic uint64_t.  For void functions
-		 * the value of arg1 and argv[1] is undefined.
-		 */
-		argv[1].mapping = 1;
-		argv[1].native = strdup("uint64_t");
-		argv[1].xlate = NULL;
+		if (argc == 2) {
+			/* The return type is a generic uint64_t. */
+			argv[1].mapping = 1;
+			argv[1].native = strdup("uint64_t");
+			argv[1].xlate = NULL;
+		}
 
 		goto done;
 	}
diff --git a/test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.d b/test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.d
new file mode 100644
index 00000000..4bdf36cb
--- /dev/null
+++ b/test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.d
@@ -0,0 +1,24 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#pragma D option quiet
+
+/*
+ * This should fail compilation due to accessing args[1] (not args[0]) for a
+ * void function without any arguuments.
+ */
+fbt:vmlinux:oops_enter:return
+{
+	trace(args[0]);
+	trace(args[1]);
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/fbtprovider/err.D_ARGS_IDX.void.d b/test/unittest/fbtprovider/err.D_ARGS_IDX.void.d
new file mode 100644
index 00000000..516d733a
--- /dev/null
+++ b/test/unittest/fbtprovider/err.D_ARGS_IDX.void.d
@@ -0,0 +1,24 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#pragma D option quiet
+
+/*
+ * This should fail compilation due to accessing args[1] (not args[0]) for a
+ * void function with arguments.
+ */
+fbt:vmlinux:exit_creds:return
+{
+	trace(args[0]);
+	trace(args[1]);
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}
-- 
2.45.2

