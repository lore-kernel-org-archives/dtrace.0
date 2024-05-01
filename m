Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B4015382B
	for <dtrace@lists.linux.dev>; Wed,  1 May 2024 18:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714588266; cv=fail; b=TndFh8K6+swG7+Pf/uXlq48FNygz9M2h2ItGFREPIdYWqeeCMopDE5IdUicvltuE1rC+cZ3S8NLY5jSbqwWJqfeVTzb3jxxtaKN/8eDiWiChQvTU76bZrj9IFhmLqCcY+HDLjGDwpS91n2PdMYO0Z8mtwzkvPcmfSnyxTSAe+hc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714588266; c=relaxed/simple;
	bh=WepnWArmBf1FsCwSfGob62Csub25dEASzT0yHVdeWQ4=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=bUKNVkMBbDITBFAikBVJMO2ZfaLGhHUAqOzGa5k9GDE7iNDh74t4yBiDu3uhNfEpmNGCCzuqyaMUHB1ElTNOl5lfC15H3oUzHB4wwTFaDnZE01DlIn+e0JjQryBWgI0kOG8NEX7bxg7zCeb4GsKGuaq1mnePwRGc+nxhKAycjpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=C2fqYrvY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KzxnNXct; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="C2fqYrvY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KzxnNXct"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 441ARmLT028179
	for <dtrace@lists.linux.dev>; Wed, 1 May 2024 18:31:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : content-type : message-id : mime-version; s=corp-2023-11-20;
 bh=tTpJLC3AUUr+iV1yolr1uhLEdZ1s1HgBISwmeruSOjI=;
 b=C2fqYrvY2Vgnw/25QY+0UEyS01mQEmLXVCY2Rm190fBXTNL2jog92kr/9aDNrqGr7Mz+
 1rrwWR9LU1OqOnA57YCbmrX59deevIyrJxeYUDZQkX28aG0L0HOZJ1iCqYxnaVRG7aQV
 7fzjTy1DUkKxPv9OQ8aBfuNOLATyjrXXeHLT27SogF/iDSci+1KCNVSIAz/E3mr3BuvQ
 SAZbNv8FJ2QqzU/0dt23V78928TZMtw1yH53U+5c3rx72HhyTAjOVrLhVWUXLg966cXE
 LzpQa9BXI8XM9d0loYzcmCBXxB+TjHXsrmBGijirWxjKTMMK1LzuzIC0zDLiOZv7F757 UQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xrswvqt2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 May 2024 18:31:01 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 441Hf404008606
	for <dtrace@lists.linux.dev>; Wed, 1 May 2024 18:31:00 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3xrqt9qs7k-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 May 2024 18:31:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mI7lv+IoQploPsrEgSscRqmVO8UxCIOL2DFo/CtOCohLaauHPKqavIuRaIcbHQVGzQhDuxHkmAvASUVY68DfdU8EUivuY0/cY1/Zo8szpMG1DIeEyMAPkj4Su2XFYlNuJ06Kd1bIThiEQpu800CjO6cSerYhpf4RHxR1b9g9wo+CNyJgfcUJjCV6vVthGoGynym8TQcn9VoKPalIkAFVpyRYJr75PnrVsqF4qFLjORawddtkEL+Z0GxVmwwJMEC6jGjg1GKSFWntlEPWUWuqW8RBYTj7a6mlsIrjMqu4iZ3QWz3mXKZbFT3blLz/UzJrMwxsXYYizFHmSI6n0N07gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTpJLC3AUUr+iV1yolr1uhLEdZ1s1HgBISwmeruSOjI=;
 b=Mh/mQDu8KEY0h5Wttl0vnj/TRyMfmmqmbHGK86EgpDgDYMPDSqyrJO2auT+LV2BJjehu3hbo48nLl781BktzWxNSMRKzGX1yLDFRdd0AUte13O0MgE/7WYOHb858n2hGUXjRdY5s2DrcSdHiFB9DJKrRUuYtfTWoG+Lyg7YbtkaE+tB8o7P0NCYF+1F4HPOVX67RY6aCq3xGarLCFomKMrN94Ptvz+UksN0tUfKADeyYUGpLTT0muoifATeSrF1wpVKyq4AhqqJNkcVJOc71ZrNiDwgISg3mUtmZELiW0Uy/xDXjdW88Pzt9vau2aPHmysnTq2jTQ1/0rlDLNyw6AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTpJLC3AUUr+iV1yolr1uhLEdZ1s1HgBISwmeruSOjI=;
 b=KzxnNXctBxauhtNVEXN616MEF/FiDsY0+oZVDChdZ8+3DBwfO/dHwvzBzk/U667dCXbcVVF2cmJmAQwwWE05BtBqWiVdrK7775dtLoMgJi49RlljwzU0wfQBudlhrSzbWhhcmlpB/w4CVDuik7zrxaWEh51Wn73fqBneDIYJZ4U=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DS0PR10MB6774.namprd10.prod.outlook.com (2603:10b6:8:13c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29; Wed, 1 May
 2024 18:30:58 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7544.029; Wed, 1 May 2024
 18:30:57 +0000
Date: Wed, 01 May 2024 14:22:13 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] cg: allow providers to specify a skip count for stack
 retrieval
Content-Type: text/plain
X-ClientProxiedBy: MN2PR12CA0002.namprd12.prod.outlook.com
 (2603:10b6:208:a8::15) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID: 
 <SN7PR10MB6287B127ACB48BA73B9CB46CC2192@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DS0PR10MB6774:EE_
X-MS-Office365-Filtering-Correlation-Id: bcd53910-5b92-484b-f5f9-08dc6a0cd801
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uLJhpiuJ6T4KZl2MGE3nvSgzqDUk2NAD8Su5FSHE9XnxP10Y/1X1HC2cKso/?=
 =?us-ascii?Q?+6DX+asqTsSLZ0ixQXW4O8Irs/m/+/xmGNmt0Qy42YX3rvNj/eSlhgRDIy+i?=
 =?us-ascii?Q?iXzt+RmPBtMYs9Zz+4ncI/y+mq9beT+MxIdC8//+/Bfvd2o+AZgEIx+lhXqf?=
 =?us-ascii?Q?OL8ll3isbi0ufqGVRB/5CM4gUv3Q4lDbZMjZ7Yj7SltYAqI57n3+ARtqdmiA?=
 =?us-ascii?Q?sU6L5edfDfcBZboQIIzGO0itVNpYI/eGLvXDzRJKwCi7ps18xDbTLK/Fw2rd?=
 =?us-ascii?Q?2Zuudix3Er/oEm+ybBcGASGfyFMz7Hnl1+/iqIiMQiJwqHgXITeJC7l28EGE?=
 =?us-ascii?Q?DYoWy/6DYS+kBS7c2263ncIJpTyrFMlMJzcrwzW1lTWeX0mrQfnB543NGGrn?=
 =?us-ascii?Q?JfMxkvizOi+w+SyZ3Xpki4skMxblKy3kjJRGcd/xvqAZ4aDR55ztoC1JiGkr?=
 =?us-ascii?Q?kWsFPfoTHRhMxQljAnUEzyt/G+jeIjfeHPPQu75t31PSIANfQLBArOHXcMUB?=
 =?us-ascii?Q?N88l/P4SukieCBcgkKLPGD5EiTzkKxj3LfnDnpeo9GHGWjeW9pl7wRF3esek?=
 =?us-ascii?Q?TbKtT4fOddls7odeVSnwaWyWCt3WIIRxtI5+88oZkTNKUkV/v1T71smgeAWG?=
 =?us-ascii?Q?0Fqr0SY2oN/NbDaVlnsNUbQZre0gAQ2TpNbSia2oFgXbqKrESQzGpo5QeLbs?=
 =?us-ascii?Q?XL8my3Y3k02PnHUC+xNh0Ql9MT6HMescfZDraTT7BCBpr1D3BKPZljTfADtU?=
 =?us-ascii?Q?ScS952V6dmF/fQsZphiQgAqaPV6CYkucd3NeRTCte7jOG39gTshf1KAUDTBm?=
 =?us-ascii?Q?lZdnXukQspVb2J323VGUXXh3N9ysaKaVvMKXTPOeUA/TcE6TSqUmcbGHXiln?=
 =?us-ascii?Q?cvcpyQVVCjIQs+tmCWjhdYTwHdIxGmKqDz5tJ6TuHZGidyqTaNxa2qc7by/9?=
 =?us-ascii?Q?RBNRAqjFfORhpn3q6NLdZmGrv9U1Letwh62TYslNuGz/r61VRrsk97v8gbQj?=
 =?us-ascii?Q?xWvgXMi4bPp0ORXU++ANBlg6FwzikmXdZdko9KnU7oyxk3eJcNl/aKOOAr5f?=
 =?us-ascii?Q?uTKw4JBVq0h6VuXxwJ8jBpQL7nLSGrWixpYGJ1vWi0savzlOBb+hyuZShGMJ?=
 =?us-ascii?Q?cZNBTxbQh8k7yN1XC4Oh8NctalVTEZsUxBvwdHCbQiLpBHuKyuFuDirKiNKi?=
 =?us-ascii?Q?YkraRAtQqe3k/9cVqdGg4kajV6TiLeQ/9M3hk0jQj/i6tG0nLwOJbKjjfz/k?=
 =?us-ascii?Q?sDzYFlRcL2q8jiPvGOZhJYqNzX1uQLTwpbh0L/UvHg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?U0qpK2pB2rkIJqZI8rw9xyYyUBzufhaKl0TBMXD6K0lnPmEs8MhyK0YeRFP+?=
 =?us-ascii?Q?piSaeUdh0yWYwv4k7kfr1INuc57pVtQ25C+5kSyI8yBDZyp8CjJ+T6+gwOdJ?=
 =?us-ascii?Q?9E0RlJM2er0wVrlAbjAHCu6A9id9s18oJsIZKptiHsO5rNdIr02i5iQx7XVc?=
 =?us-ascii?Q?oWTtlStfYla8UNlLoRjY7Z98M1j1zOQjusjN+Z6AF0A6aSXpRxv0xI5sTGxf?=
 =?us-ascii?Q?xzo363emZ94pUwlcShn4t2fnf/1UmXiwVTmHiROPP9pIgTKqJUCPoMUb54Fd?=
 =?us-ascii?Q?KPHRPxD6ZV3gTeMndXO3OViDm5aaM/WnK0byB2HtMLP69T+dPBUXBM8SKI3a?=
 =?us-ascii?Q?I7NqDNR0k5v9B/N6jyW38pL1AcoyuJUacx4ys21+7SHKlfoCrJ3adHGvqalY?=
 =?us-ascii?Q?qaAsHkfCxM5H/Mf57aPhjki0rXdSzwTU8UkSWWgN2awpFPG/rsypSJ8yLPvM?=
 =?us-ascii?Q?SLwZ5GgoJt70BpNxFJWTE2lzU8lNjOtw2x94qiMUD6ikhKeHAm5B4tZzzhOW?=
 =?us-ascii?Q?Y1Fd59mbnMZeIueVcVNm9Cz1wEmgO7/9muRHRJKUU5RsnOcyhnEizTAqZdtK?=
 =?us-ascii?Q?Dg7DIzd67Hb/3S3oHX+gWCTpAJjrnMa05q3sKL/oKCfKN/1yZbYK4LDPw+CN?=
 =?us-ascii?Q?OdElkAeZDqqvzWONRSx81k+WWV5YC4E97YR1j8e/SmeXl+sVq7nIOxZVAFJi?=
 =?us-ascii?Q?pHxWU7wuoDCNFf2F+nCGN/id93UG1jVozrmn4IpI2CRAVUSV7xmqjgCKrYx+?=
 =?us-ascii?Q?ym/Vs//6QCTL65CgyeOSsvGlPmSjhAvFk4UqGe0UhT4cMRA/Om1Gc1FHDn05?=
 =?us-ascii?Q?adtInrhBWSzQ/58gC/7f4uOY8GqMojpgta9zvYfGHjs6fYSy2pnIQdR0Qej/?=
 =?us-ascii?Q?rtCgCIvzkPdAbIu6G33Q+yhUyB86/3VvFkTEABZ7X7wMShYdYQAzz21nBl0m?=
 =?us-ascii?Q?7QjH4yGj8XXWJ6418f7JTMSZZWwoRyeiTrupckzG2zqwvHtMHfYytnyxDwPM?=
 =?us-ascii?Q?3vNbyuA/uL/qjskvzeZo3WBuYaT75nuYkajvmD8B43qlUsGRTdZNFLD+hho/?=
 =?us-ascii?Q?QGfiCXN7qKaruN3fKk7tXJMTnPBCSqKZf1xitsyIp2Ie1PF+whQkGI6YxC2O?=
 =?us-ascii?Q?gsRBQU5xp+ctmcdGTa61gHuMqvWDD62B3RCJn99AG4++O0ZCVF4Zmbo84EES?=
 =?us-ascii?Q?rt5vRDrbVKjpnPiS2k2VCKPrZnj1YqTj40SQ8dYU2J6W2QphV9sW+FDSMu78?=
 =?us-ascii?Q?yY0cJXqTsOJ30CncJysW6ed397zJAlrOXvc92ZkULHGNxdgiGi72l74tLhHP?=
 =?us-ascii?Q?AFSgoxznfh2SOTKhcBZ0eULAWZNTTAcUgvTN3gAvJihpZ6QD97+yL5lcQljq?=
 =?us-ascii?Q?jvBDRJhLfj/3UAc0T7pRDQ8vbG+s0pha8yfr29LwRW2wtceO18QQrdOrGMOw?=
 =?us-ascii?Q?Ea9lHG/NyfAlMsvkMLdhtKItQClUxsADBXfIjTSdx8lvP+udwDPcev++q2jM?=
 =?us-ascii?Q?XMhRUwPlD1eHSPH3ZGUNPyC/xoQk/MUlF2/w23c6uUlJxA1fpskB14JoBMeW?=
 =?us-ascii?Q?UDt73QndeaDdLSmUBaxn6ddqe1vRTssge3qtgFT5axJSqh1xJAOYr8a4CpdG?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	7AV3Qmm9HpCqzZqIqFBysIIB1KRwZLk+eZQOW2Al5Hsdot+NAVwEzKMxX/I2mL07NB56DQOFx72Xz5tEr5bRNuNAQlBAsXtwG0dUZqZhssKMryfdmzaTAIMiNSQrFJfv2hRw1fJtYvkk6D/cHLA7JVk3oMRZ1++ENCNAhLyPk86VUC5+PPL9tWdG1DoJ2Ju1/ImcfovoEuO0bz5cdmGAcB5T1q/cygq8ieovYXu+Ql3cMxQ0BroLEvivxZWNkhpEC0jU6/IXzZZXxQgsYSBQfxAkRabL+y/WglqQvVMOZ6rDk0sxyJhojhqP+KKxbvCNcCRQvh89W2Ju0eXSfG/O6+Y29xObQ06Eag6vmBUmBeXtvBcBp2lBB88FicBj3vWl/qiW4ykYmrFaSn5Ilm30KDsaj6aV5iI8oLSNx7C6DXAu+F6W48FaVTlN0C47wAX9s4+TsSTHtsTe/9gMPo0UFu+uzS8xm3iyQCle6Gi15j/3IKiLa7+ha84gRhB4634h2PWSAD7sCLRZQw4+nZkqqfxDKr1l3CVFjHwQcg4dMwuD5Qt1gt/SkKTvmZi3MyIzQaI23OF9zSbxFRYhUfJPN5vs5ER0Lnedgx1QrRS5Uts=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcd53910-5b92-484b-f5f9-08dc6a0cd801
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 18:30:57.7058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v77uMBoGj0cjOq8mq9OT5Bnbw7iPupPgNwTLmn3pyquo9TV64tW1Co+APtnTs2NmVY9ymitH/7QrWYANxcrDDJQo+ayiQEo4HZnILmzCts8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6774
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-01_16,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405010130
X-Proofpoint-GUID: l-M52rtlvnzsT0ECT6SacwTys8FYZGri
X-Proofpoint-ORIG-GUID: l-M52rtlvnzsT0ECT6SacwTys8FYZGri

Some probes cause extra frames to be reported with bpf_get_stack() that
need to be skipped to ensure we report the correct stack trace to the
consumer.  FBT probes based on fentry/fexit probes need this.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_cg.c       | 6 ++++--
 libdtrace/dt_prov_fbt.c | 1 +
 libdtrace/dt_provider.h | 1 +
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 27246a40..36975406 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -2595,7 +2595,8 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
 	dt_irlist_t	*dlp = &pcb->pcb_ir;
 	dt_regset_t	*drp = pcb->pcb_regs;
 	uint64_t	arg;
-	int		nframes, stacksize, prefsz, align = sizeof(uint64_t);
+	int		nframes, stacksize, prefsz, skip;
+	int		align = sizeof(uint64_t);
 	uint_t		lbl_valid = dt_irlist_label(dlp);
 
 	/* Get sizing information from dnp->dn_arg. */
@@ -2603,6 +2604,7 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
 	prefsz = kind == DTRACEACT_USTACK ? sizeof(uint64_t) : 0;
 	nframes = DTRACE_USTACK_NFRAMES(arg);
 	stacksize = nframes * sizeof(uint64_t);
+	skip = yypcb->pcb_probe->prov->impl->skip_frames;
 
 	/* Handle alignment and reserve space in the output buffer. */
 	if (reg >= 0) {
@@ -2644,7 +2646,7 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
 		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, off + prefsz));
 	}
 	emit(dlp,  BPF_MOV_IMM(BPF_REG_3, stacksize));
-	emit(dlp,  BPF_MOV_IMM(BPF_REG_4, (0 & BPF_F_SKIP_FIELD_MASK)
+	emit(dlp,  BPF_MOV_IMM(BPF_REG_4, (skip & BPF_F_SKIP_FIELD_MASK)
 					  | (kind == DTRACEACT_USTACK ? BPF_F_USER_STACK : 0)));
 	dt_regset_xalloc(drp, BPF_REG_0);
 	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_stack));
diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 0ddffa20..dfeecfd1 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -431,6 +431,7 @@ static void kprobe_detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
 dt_provimpl_t	dt_fbt_fprobe = {
 	.name		= prvname,
 	.prog_type	= BPF_PROG_TYPE_TRACING,
+	.skip_frames	= 4,
 	.populate	= &populate,
 	.load_prog	= &fprobe_prog_load,
 	.trampoline	= &fprobe_trampoline,
diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
index a24b1d00..bf3af0be 100644
--- a/libdtrace/dt_provider.h
+++ b/libdtrace/dt_provider.h
@@ -44,6 +44,7 @@ typedef struct dt_argdesc {
 typedef struct dt_provimpl {
 	const char *name;			/* provider generic name */
 	int prog_type;				/* BPF program type */
+	uint32_t skip_frames;			/* # of stack frames to skip */
 	int (*populate)(dtrace_hdl_t *dtp);	/* register probes */
 	int (*provide)(dtrace_hdl_t *dtp,	/* provide probes */
 		       const dtrace_probedesc_t *pdp);
-- 
2.42.0

