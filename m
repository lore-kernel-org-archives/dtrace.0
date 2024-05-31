Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92877219FD
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 19:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717182011; cv=fail; b=U0hzpVOnzgYvCBBVrCjj7TarlGc6W19LLonpkD3/HaPhS/Cjm0VxaG+l9QB1qrC2nVtPs+0ZOaTqixg3VGi+KwrTy9L9DHWbi/uZnISb7pNptZiiFwH+aJ+EURmmSYfL5q496yn0D9238/ceuHDLGg9vmszqRVofAZo9W3TngvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717182011; c=relaxed/simple;
	bh=hN7TtmDxFbx7dRQWnf3htUC4I2yApfZkhJ3Y0ky9ho4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pAuPBz95Vg4LwOtDd7yt/7ePmqG5M+XfXE4FlzJ3ra7784K4zGFQH4cB8OqnGXcubCD3zuiSW4kOR4axeZdJU+eOamnazQMlIRf3XoNW/tAZYHybAVnvm6KOKZJLsG+msvofLayJtRWt19OSBqp0YCsZUl4PQE1Vz7Xxtu02krM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44VI9L3T025232
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 19:00:03 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-transfer-encoding:content-type:date:from:in-reply-to?=
 =?UTF-8?Q?:message-id:mime-version:references:subject:to;_s=3Dcorp-2023-1?=
 =?UTF-8?Q?1-20;_bh=3DnTZ0qiDeVsaSuXhV2J+bxNzPfbVaWlVxwsjnyTspMfM=3D;_b=3D?=
 =?UTF-8?Q?EocI8n8OaYfZNv1nCXBmm9TX6FUHXe48viXv3ovL82HVetc/+/RTLiDLFpBGrP8?=
 =?UTF-8?Q?11ULl_LqNuHFMolizD2PdOZ7NQbFz7+SKxCFfJFvx6naZfDtP/c1YIU+TapH+me?=
 =?UTF-8?Q?+yvW5ZxK1aE_gJLgPNGrCJqBZp9AhC3ElazvUaxvoV5w4n0jxKhTArC0wHLU9Pw?=
 =?UTF-8?Q?ikMsi7kwnpw6v+DDT_Rnqcl/VwFL/5vds4vSqmWxlcbZFP5U37QjDTEoPjzk+/g?=
 =?UTF-8?Q?7osqp0rI35LBeN64nwHaNpG_cHL6fbCNf6lHJZHggIIWeCjRycnshQccsPtGwNf?=
 =?UTF-8?Q?MMeLYRNHvsa49blDWRxjRgDGX8NtN_4A=3D=3D_?=
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yb8j8bq0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 19:00:03 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44VHMsOP010739
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 19:00:02 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3yc512arjk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 19:00:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3p5Lkap+lLGgwFNNGL0tSfhexuz1HjJPIR5xIGuQc9tDh2r9shgecabSuHqHD+p9UTOIr1x+vn4KD/iy2c3VGjmpQNBwvpP2AcmpbMZkglBs1W4HRGmxTfN1teg/OnirOBMRJoNGVkZTySAoa99H/evcdUn86ObYIUZ1kp9JeLu/Uh7x1J9WBwugnmFekY83IJwiik05M9d9Dgf+aF/lhFzqnPi2wBK4MWlM0p8eXZ7lb42rpKHs/smUWJGf4eWJGPghQyHf4cudwemycZ/JQm9HC67ATJTHw7GlgsHB9vQhCbDdK16lsOGIX+rvKmjRFpbiyhegayI72rnNJ/PcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTZ0qiDeVsaSuXhV2J+bxNzPfbVaWlVxwsjnyTspMfM=;
 b=kfF3PcNutAIN5dWt3h1TX0SF382NuA0XBlYcz7dYRtoW1kMZxMB4kBslD9JBH+hQCWuJqcJC6QJKEe9XdWy8gBP7gC6nx+WwPAimz4c6rd87qM9DcTrkzpSkIj43eiIYoMlBWTryNfoLQE+xPVob333gDeeqECBrmXQZ2pRoAfcE2fN+K0laqwLbMd6WYgCdSbvhMdztBWgSH0zocCnY23X4b3AmVQwpaQ+ZAyI37lunBIotVxx8BAzhqgW9nxHb+JVM4f2iXcWIHLX7muqxjdqDmGq61htuxgyEvAf+bh+PAxFT+hek10rzoY2vltjwiEOASmFOwND0UwSqv/YbnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTZ0qiDeVsaSuXhV2J+bxNzPfbVaWlVxwsjnyTspMfM=;
 b=awq0u7CIN2LwtX568RXkKpGfp5t+eVEVhVKqB4Lf+pyPR7IR87qSRw8pW52d23vC0KivUEUC9rY03VWLRqQ5DFYVCeA0TR8KujJy8/ymjmqG7wkowoJ4ye/gufUL4R7QEl1SHu3CEdX9+QDM+FqyNMwxX4BWPeIVSSu5j6QN2ZY=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by DS0PR10MB7955.namprd10.prod.outlook.com (2603:10b6:8:1b4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Fri, 31 May
 2024 18:59:59 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 18:59:59 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 7/9] tests: delete the kernel build dir stuff
Date: Fri, 31 May 2024 19:59:26 +0100
Message-ID: <20240531185928.363245-8-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.45.1.275.g567cb0950c
In-Reply-To: <20240531185928.363245-1-nick.alcock@oracle.com>
References: <20240531185928.363245-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0233.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::19) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|DS0PR10MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: 28a48163-9059-407c-0f9c-08dc81a3dea6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CCdBjIZT2VgfGnOpQ+J0bZig7Hk5dBgg/WGE3iD9UUhHFvDlyGlxD3UYSreD?=
 =?us-ascii?Q?TFrkDwh7RQW1reejkbYtn/EtB7TYOP+LqJNT1RaWNJwHOwS4Ndotxaior8Qi?=
 =?us-ascii?Q?19p7gq+L+Q5aFXRnj+tssIGDaO7ewzVf+eeyxosPMApevw3pRFlItCAPuhFK?=
 =?us-ascii?Q?3CDqJg4sBekDywweDBXh9Z1nY7DJVYKpDf+vzcMm4WZS0qkkJfSTYYS/RXCU?=
 =?us-ascii?Q?mjquN9ABQWpr1qTea+JWxbatQTELSV92qQVWVGnhoSLhtk5jyJ4NcesN/c+0?=
 =?us-ascii?Q?9jFL2ozfefpA+/3wH/abq5TrQNEH6kv4+REQz+M5Cys2peBsNTSIMohpD3ut?=
 =?us-ascii?Q?YD9MBOsmlg1W3Ne3pMnV2UZsnWt77dkJIOBZqSGNkW4YX13mZRiRcwHvvS/A?=
 =?us-ascii?Q?jpKA52nygnKYxhdfnYn640BLWjUFXVUsZmD5b4KDfppQldTVJCpoBd6CnJV0?=
 =?us-ascii?Q?WW0vgxneOlzm7DddKUeK/50QGjx0lpkHZ6zukiaGdL76RBm0JNr2qnJQazn0?=
 =?us-ascii?Q?eASJa9MS8Ph1yvLfTCvpcI2WgWrlRiw+w1xeqCYA7wZfEYgxw/BSnVIU1cwN?=
 =?us-ascii?Q?mzWxDjudXs1Ct3/wyhyTTzOVNGxyFVEvlokQQixDS0j/hw4CLuK3uYHSzdGc?=
 =?us-ascii?Q?DCvQlkKJboIk30r8Ke0UFHLSrOYidYpUeVbZh3te2+pNn07GQ4uPRF2mJxh4?=
 =?us-ascii?Q?s6dy/QYQ8XRFHe+vjLorU8YnzSsWUM02onSrX1v63sQEO8NFQd3wg8wk6e6A?=
 =?us-ascii?Q?iTumop8wABIem6ngLzFCOX+aZmOAlltpJVcySfd++7oPYDN7ECdsfa/Ikm4Z?=
 =?us-ascii?Q?dh/svVX3BE/qzBmCN6OUpyQDc7PFz2uXXsu6OfJ0j5VkJ6w1HqhHgyVIs82C?=
 =?us-ascii?Q?qGcY5f1pgyHH2eH+knW7QXc9i2b6d+Mf1ymvCUyd35lBsoRPikTwjeDAZxHt?=
 =?us-ascii?Q?3TxbTBuzqUabUSCSXyUTFcTjMCIRxWE1OOG7zNtFmbpH3zm+VveHuOFxvNYU?=
 =?us-ascii?Q?k7ZhoN10z3tkTzYFVDZWHf7bsfHYkhsbh+XywfHIhei74VWVbHqiIfvnqsrm?=
 =?us-ascii?Q?V8lUwsIu+OgAO6PolL3NUnDgt3NjzcCyENg5TLLxJW34u9W83KBiZY/hSe2n?=
 =?us-ascii?Q?utwem3XEkOmnuQOOMMlZvQRNObGp+dGo7j7g0GgQ+9s3lXzflIXItGySO249?=
 =?us-ascii?Q?adoU420HGqMDIkq/L878gTxkm0bGeiukzjebjjHDjjOyogpPhdMLMUc/VwXL?=
 =?us-ascii?Q?MuQUS1fjAeTStv8PzT2dlmxH1H7J2hkGKl4Hw0ucZw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MMo7sRMbS0HFLBftRl5B1oRx8MJMoLR/s42d4ny/I6k1NbCcvUeWY9q2D7H2?=
 =?us-ascii?Q?Tv2GkiPJUTbsEHm5vee9hkwgJlSxRzJPzCpoEUx7GF+tCm7Fz5ZXxUz4E0OJ?=
 =?us-ascii?Q?phmarkU2/nyhuq6+k2dW6jMN5I59GFbUUfvXo2h5CHcEL9npaw+b3aVHk/nN?=
 =?us-ascii?Q?IUVNSXjVdC4Ers9TqG5FMoYzgFKJaAVfTs3YNyUlaAIz3brz5bpgx1pRrsA1?=
 =?us-ascii?Q?m3e66OaEJ66aZORj3kdKOz18d3LVcKkw40/q93F99S13YnTzwR25781ToY41?=
 =?us-ascii?Q?PtHfLPTxKeiBGmughRg7EvDPp2arO7tSIPlcHzenUxFZoEbjFy5WtSecQB1O?=
 =?us-ascii?Q?wZFApAwqiX4WwmK3sbrNsZg5fUstGE+CV2/1LaTbsmYAr6xyU1CPrjwVUl7L?=
 =?us-ascii?Q?mcHxOav60h9tyrHj4kuco9dVkAW4dwaLOMkC2Dlei8d4mS+fFr1IhqshUFL+?=
 =?us-ascii?Q?kM0wOCrc1+XlTnv8knSHXx6+46e26vU1jh8aZex+FC0ntpvENKlm+mXndyNb?=
 =?us-ascii?Q?vszoftz2wvZ8yDWGRvvbsaKOKvHCYLVs8yMzdZ5deVlZ9Sj3Ww6LBmaoMlz2?=
 =?us-ascii?Q?cvP04CJCyr17PCzz7wG3Be4Utuiaft6gmMp0gWLz0DKDZs4fKvfaUTklkILy?=
 =?us-ascii?Q?0jvqpbHpdcCmsAsFDfD59gSEKsARHHvNl8Gwgtg1oyOAci3SaRIHK8NzSa3Z?=
 =?us-ascii?Q?/ESZNYIUSyc05S0I7U6F5OzX2KlNYLmoo84hOKsOzBi1XfPoD0WsNPsbB/iX?=
 =?us-ascii?Q?HWMFQeBzgNzPlPlpx4QctftabFzb5yMGDEVP6y9GJEL+levOMtUNe/LpQQNU?=
 =?us-ascii?Q?jubIcy1ZbqyQ/TBQbe4IZDafi5STAX27r/pIGLZ3bs3DS2bPvQiqgm1Bc+IG?=
 =?us-ascii?Q?MKLwzB5+UrzhV1whPTBJ0Fip+1KaSdq3tgZYRUy0IqIGHDklfgmOULWESx2l?=
 =?us-ascii?Q?15RY41lbtwRUmVlj1JscT173i4NQnol6OydAZpNEdkyChiM4yeDJQjxO061v?=
 =?us-ascii?Q?aYVuHe+4B9aAZxSMM9UHkSFavFC8ogvlP/V0WB0mk66aVvWE4dqYVcZR+E0z?=
 =?us-ascii?Q?w5mlJv+J1256b18DTrKhjBasU4W1ZDBdd4Kywpb68fdSfOPoimVnI+J9P32E?=
 =?us-ascii?Q?R5komtMFGSekdoaHPOFei68a0FJc7ZM7mgvxeWi4Ymj4hOuUGPAh2017+6Ao?=
 =?us-ascii?Q?3KtCDZieX2rXIbxaZpXRmWghE8jSbZQ55DJyg1XjlfgO0i/EaOm/AdFlz6g4?=
 =?us-ascii?Q?vLFqEbdWZHpeFIDSdgLyZXpyvnQjGK1OOQY/KQ/NM+xEQCXgD9KXBLCtHCRj?=
 =?us-ascii?Q?X2R8xRWMVY7pCg+ZkV83Bmdh2F+asm2TeQTHgKwQkp1DDxXvBajHTidM3xyg?=
 =?us-ascii?Q?T2bKUHLVfylT5zQb3ofWzDwA3E2Vsp2CawDi+VnyBRxTWsIIg+Rdd4jnZdqW?=
 =?us-ascii?Q?fUlo6J/1BnLibrkcAtk2gbf+AEXpXUOjGQMDruo9sdWKMj7bkiZweNDKt6Og?=
 =?us-ascii?Q?AakwLluVD45cVJ+uPhb7F7DeNxHYyWQQkVwoOCf04TqcstY2cmtj1zK898mD?=
 =?us-ascii?Q?ttoZWtDmZwJGDClIY2Ee7rpwTjCVBjM4QGRVhyvAkbrt5BPVA9y4nfLJmdCz?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	oztOzfI0HycT1lkNfi211cN07J5E59uaizFeVFAvsJ9HC1APN20UH9vd4ws9xs7Dy9lwb82m51yWRrjA0ft23lbLx0sqWOy0HdMG6/GisZAMMbddxMc5m8m/lDw5s0h4Ljlw4AqD4fx3teDFm2V8ckyGERW5Snx6G2ls4jZeXtbu+V+yL47yRParVLFsfZov9Gwcg7GrbT1bA28v8h6mGEmZo7QAYj4N/3/1s+eAvUI274EgT12fux+Ud7TRTc36aJ21I5/a2vVNA+OFnOt0OD9u9d1VDYqgeC8Hn+INrZmW0DHzfySRHYxETqbQpEEw8kNpofV9Z+GwtYW789im21m6PJXgkA/FIDEG3jKT9kYzORjIPoVZJkRLlhX0dy8HRyUNXUbswlf8ADP32nmZ83RGYA+F47GQ5hYlS9mRbgWKLfwk6lZIau+CwUMmQ0hzvWDhIZSn16bCn0BiK58Yi66oZZdwGSVq+hUTT246QEgpDxNCIiRtyJntDy/s9jl0fZc/BDYTEV1dmoykOvqiLzLlHX2qV5QG2qzZpiaPQRlEnhVI0/RW64beVbsTo4Zq86hssZbKcFTltyXeQDhXu93sJif6+HjT+M4B5r2rcBU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a48163-9059-407c-0f9c-08dc81a3dea6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 18:59:59.6948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7XdqetNmfQgmm86XA3eu0zZmyxhracSMclS23LL1AjsdCnaBErHI/oFb8ESWEmlNp8gPqg4U2+d+b46qtDTPKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7955
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 spamscore=0 adultscore=0 mlxscore=0 phishscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405310145
X-Proofpoint-ORIG-GUID: a_Ncfc9A6ahHCgkGAnJ05WBXe1CRvd0K
X-Proofpoint-GUID: a_Ncfc9A6ahHCgkGAnJ05WBXe1CRvd0K

The DTrace kernel module is long dead: we don't need kernel coverage any
more.  Delete the example runtest.conf as well (but do not delete the
loading runtest.conf: we are about to use it for another purpose).

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 runtest.conf.example | 10 ----------
 runtest.sh           | 26 --------------------------
 2 files changed, 36 deletions(-)
 delete mode 100644 runtest.conf.example

diff --git a/runtest.conf.example b/runtest.conf.example
deleted file mode 100644
index c92aa6b96cff6..0000000000000
--- a/runtest.conf.example
+++ /dev/null
@@ -1,10 +0,0 @@
-# Test configuration file.
-#
-# Copy this file to runtest.conf and edit it.
-
-# Kernel build directory.
-#
-# If this is not specified, kernel test coverage information will not
-# be available.
-
-# KERNEL_BUILD_DIR=
diff --git a/runtest.sh b/runtest.sh
index 817f4a90487d9..d9b7c02c06a3e 100755
--- a/runtest.sh
+++ b/runtest.sh
@@ -644,15 +644,6 @@ if [[ -n $NOBADDOF ]]; then
                  --quiet -o $logdir/coverage/initial.lcov 2>/dev/null
         fi
     done
-
-    if [[ -n $KERNEL_BUILD_DIR ]] && [[ -d $KERNEL_BUILD_DIR ]] &&
-       [[ -d /sys/kernel/debug/gcov/$KERNEL_BUILD_DIR/kernel/dtrace ]]; then
-            rm -rf $KERNEL_BUILD_DIR/coverage
-            mkdir -p $KERNEL_BUILD_DIR/coverage
-            lcov --zerocounters --quiet
-            lcov --capture --base-directory $KERNEL_BUILD_DIR --initial \
-                 --quiet -o $KERNEL_BUILD_DIR/coverage/initial.lcov 2>/dev/null
-    fi
 fi
 
 load_modules
@@ -1592,23 +1583,6 @@ for name in build*; do
     fi
 done
 
-if [[ -n $KERNEL_BUILD_DIR ]] && [[ -d $KERNEL_BUILD_DIR ]] &&
-       [[ -d /sys/kernel/debug/gcov/$KERNEL_BUILD_DIR/kernel/dtrace ]]; then
-    force_out "Coverage info for kernel:\n"
-
-    lcov --capture --base-directory $KERNEL_BUILD_DIR \
-         --quiet -o $KERNEL_BUILD_DIR/coverage/coverage.lcov
-    lcov --add-tracefile $KERNEL_BUILD_DIR/coverage/initial.lcov \
-         --add-tracefile $KERNEL_BUILD_DIR/coverage/coverage.lcov \
-         --quiet -o $KERNEL_BUILD_DIR/coverage/coverage.lcov
-
-    genhtml --frames --show-details -o $KERNEL_BUILD_DIR/coverage \
-            --title "DTrace kernel coverage" --highlight --legend \
-            $KERNEL_BUILD_DIR/coverage/coverage.lcov | \
-        awk 'BEGIN { quiet=1; } { if (!quiet) { print ($0); } } /^Overall coverage rate:$/ { quiet=0; }' | \
-        tee -a $LOGFILE $SUMFILE
-fi
-
 if [[ -n $ERRORS ]]; then
     exit 1
 fi
-- 
2.45.1.275.g567cb0950c

