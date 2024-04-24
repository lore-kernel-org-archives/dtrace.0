Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4172416DEC0
	for <dtrace@lists.linux.dev>; Wed, 24 Apr 2024 17:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713980167; cv=fail; b=ke8QUaAPaIzfKb6Y/KjT4Un/RGZs1HmtTttyp9pGX8if+quUFsEOOOHVWpjtVWOgJIcSBip5X0NiuD6r967nkJjNHf31yKAMOX94H8O2Mv/V9R78rC7fNBQ+wOIN8trWAj2b2kOZ6avmhVlZ8juwKcTaCyR6Y7IH2FYo2IfKvLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713980167; c=relaxed/simple;
	bh=rmhcPE5s2ju9Bu5dT0GuVt3/F/wHvOpuIZT+fpdzvUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lzWP4fEkNVsw7eGKItCGQPNItern1jbYtiIvIzz/oaeza5IKH8LnVfte8Toossquz0Wly5AdyhNDYkEkxlY2yB3KWNMbvdYL8CkYRxOay8tVhCjG/tIemXpP75zu9MxGakGCQsg2i1pf7mSVh+ut3vyyyJU5jU1zPvSxnQiaWyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fEzloDaS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=r2MX7YJw; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fEzloDaS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="r2MX7YJw"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43OG0Cke020179
	for <dtrace@lists.linux.dev>; Wed, 24 Apr 2024 17:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2023-11-20;
 bh=10tjlVGell+nBQS1hgSpmZEwO06YhIBpUTxv7j6i0Ig=;
 b=fEzloDaSrtiFv5SfriGdW6OXUqv1DOHaeOuhgtX+oDm5kRHUZc15cqaRAOBpchlbWHp/
 OvdrfrXSfx0UdGYMli6gQvCtj75bazDWWWiVY0DzQBAtntpobfCGVc/IgcAoefvHNx0j
 UIt/4G2i+suX//h7I48brsl+nDBb9DZuLMO54FxaRsCNQUpWAvNBJ4sHHf+JqpV72ESw
 eQZgi8xLPQ/OaM2mOPQMoC22FzFYkq78HWM7uMyhjaCV9mS+feP9x73/F6qesjWVbacv
 dbV431TUnuiixLx+6d2zflD3e5VoFcagBNabuqgYkobu8SvjJBvFur+xgRMBFX1Dungq gw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xm4a2hhpu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 24 Apr 2024 17:36:03 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 43OGOewp019232
	for <dtrace@lists.linux.dev>; Wed, 24 Apr 2024 17:36:02 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3xpbf562ag-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 24 Apr 2024 17:36:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VSxB8AVSPAAI9L34uZ7F1zOsJmX65EVZImXAec8wO8xgfSb+QZs1AmkCO9csviBLmXz83vpZFn05xvgc5i0zxaIMD9rkNll1kWRqF48rzkASLv2vnnBb974CNrnk64lM9LIUa/29HIcmNPd7kG0hTn01W/gxKaGclUbyqxTP8Vk3XnFET5QsfGXiHrn0DPs++oWK4stVSFd6FAN0kWrh2qWQRWgePkRtEz7oIS+fxZKrUF3oUV2Z1Dsm5lpVMNJ4mMXKrAoEpukVckAc1Fxbt4agOFSqH6o6v/hogNxxPNMjSdfAbAsdlvJE1I66dapjKeZ4DKF5XMyoRX0nZZQE+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10tjlVGell+nBQS1hgSpmZEwO06YhIBpUTxv7j6i0Ig=;
 b=PLgHUeT2w63thqOJs+2Ggvuh4v2aB2mGYD1Xryp3l5Q2zuLgj+FoQi45AgfPJITqoaO3UzkyjjUQbqNfXfzyRwu+D3ljqfGA7H2z+OUgDkIPurPULzxtvDWr0C740mrWIeZgW2806bUS73MOSMoXsVAZa1BBJJclghK+H/oJ1JMsRan+PPz04SG8Hs4aF9UVwZ9F4aEE5f0uQPyJ69MQRZhrIhu89lJXyDtZSsgyWkVLXS9Zg4HnBGuy+aNENiU/2lEj8Bq3Kt0WDg4B7dIpJXF3JVduiETCSxpmHCyBLsRS5umWDxYu9JMckE4keo/RXkQayIIPWCXl+nGV/liNRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10tjlVGell+nBQS1hgSpmZEwO06YhIBpUTxv7j6i0Ig=;
 b=r2MX7YJwej3Y7k9cqFvYfb5A3fCClHE26lLLi+TyXYHTCp+TaLY2mSMpyhqk2kweUba7s9ylw9G7kpmlssyEQpjH+zLl5XX1KAMd0pE2hvqlfflZJcCLe3PDnQc/S/kDg02yk1jXt5GPm4BL3l1jKTyZWc+FKzAjKiROzUAYsjk=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH0PR10MB4502.namprd10.prod.outlook.com (2603:10b6:510:31::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 17:36:00 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7472.045; Wed, 24 Apr 2024
 17:36:00 +0000
Date: Wed, 24 Apr 2024 13:35:55 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev
Cc: Alan Maguire <alan.maguire@oracle.com>, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2] print() action: identify ctf object
 used for print
Message-ID: <ZilC+5Y+7doMMVdq@oracle.com>
References: <20240417164900.3584526-1-alan.maguire@oracle.com>
 <1e8e2345-307a-4ae0-994e-885dd47303e0@oracle.com>
 <Zik/P8WUMubC5Mh7@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zik/P8WUMubC5Mh7@oracle.com>
X-ClientProxiedBy: LO6P123CA0022.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::15) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH0PR10MB4502:EE_
X-MS-Office365-Filtering-Correlation-Id: df05137b-8ee9-4342-46cc-08dc6485018b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?O8jLEY+popF/Yx8MaI77jkBrFvjWQGLLmFvNsDwpyz0WRDzc9wlQCmvHkAyY?=
 =?us-ascii?Q?plMeOEvaBlspUlqTxMXUJwYGTLC3OKrEHvB7noVE9UTLpyt3jsIN5LCvgdGB?=
 =?us-ascii?Q?myg0g77iwpDbv5scpZhBHCse25wb3OlLm4l1nBiY/bmTX6avmgIqLFIvr+17?=
 =?us-ascii?Q?nbUujegYoHjF+jOCvlP5rYFZDhyokaFm8Csyk0zSsS7MpfS7V1ji8eInTPLZ?=
 =?us-ascii?Q?3VmYZO3NPG7fMcrrxu7T/HALcvWaRZ//j0D/AbV0aN+QdzOqkoy1uhS3vcya?=
 =?us-ascii?Q?lkAQiaNv1GUB1dn5mDpQjYskxJlKSLR6kajoVrpw5kbd9E+qEE3qLRf4cftS?=
 =?us-ascii?Q?6Kc9OXoTaKh49LFHy23jj1wspfPN+/5g506aOSzjcBXg9XKkkrJKe3EP1KLS?=
 =?us-ascii?Q?thhpSGRcyocAZ3Gtl7JxTNRpBVXpfp85xzgNxlmIFcR6Ku/Nc9G86aJrGhZ2?=
 =?us-ascii?Q?u+bBjnh6SD5MzZFx8Nqmih7Gv5qyQZier5Djp88C+VvkXy4YZz4gB3pWGApZ?=
 =?us-ascii?Q?XWrUxywFmMTSC1BlG7ZgL16opoRU69tR3PtyP8kX8rKkqJUQZfIiw4DhFtnM?=
 =?us-ascii?Q?l9DyGTxpw+DA+ifD1f8Yq5Zi8/1uehotn+NfI8F6SpSKdQ/BYAShcdd5pA2x?=
 =?us-ascii?Q?+Ya4+NxLato+IDZV66IIJ/cqdZw+tdB/nOw6j9IxkxPwvZlnmr4CDnNb5A27?=
 =?us-ascii?Q?T87rK8gVGJiJjDddRrebhZEdVC0Z1iST8HCCThoIjfUPJ3jvdChdFaWnCXEA?=
 =?us-ascii?Q?axSXnaKPDBxZtG/54XQtAbzgib2FairSWRYMh7LHhZXsaTn4AZoQFIuN1oNg?=
 =?us-ascii?Q?JUNtA4RFz5/f0KSLq0sH9NkCorRRw4CsW3shfa4OAKpuRrd/2DGLLcDKRTJp?=
 =?us-ascii?Q?6Am9ADGqcEAnVtXQ3q7QqiaicCzW61FqYJzVNVT6gifzzM2o7eIUlXi2fdyM?=
 =?us-ascii?Q?yAMi7+Mj1ZDxSv3VbWhSHySP3b51UOCS/wHZWstB3EMLa0a6AOmLLiV9h3a1?=
 =?us-ascii?Q?/ZtNDad5Lc2D4Iu6vcd6fKiuxsFTG48pIEcYBQFfnTg0zMget3CGFVwqMWDm?=
 =?us-ascii?Q?ORY3EjiwYps/ZC81D19/Gg1WrnrEy5M3exRZLVg1NCwjTrZLq8yuf/mdTG5Z?=
 =?us-ascii?Q?HuEnT8YYB2yOAMc9FYP+rR8PjN1r7ttVk3UAiFQQN7L6TzJo9Zl6KKDWgP4E?=
 =?us-ascii?Q?cD8UZNLJAAlr44R6Euk7ry/tdob5I0PQ9M1dot1RsqhbKQTbb1WfOSdXogQ?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Xy9yRMX+zj2d3sHdnYxkU5mTPjnI1Xx6Xv+iqtSLFPbE7PtKkkiQE6jsUE4l?=
 =?us-ascii?Q?tfv3g4jcl8/vflQjZOgibS5OnwDiSaQuNsaGVUigGVihE76ONFWf+4K4dbH4?=
 =?us-ascii?Q?xXmUXKD6Psd4nSrxtRL7CHSCzjxFiRXFUndn1hzfQBGA5+jcSb5CsTNTi7Nc?=
 =?us-ascii?Q?kmzOvDC5QfWJYurpOviEnClGkLdUpqTlY7hCt19QkgqhvTvaIubWKnbKzaM/?=
 =?us-ascii?Q?AHXTVE5xLJGz51qJ+0QmaiydD8aN2vQV0xjBHOIdP2HgAXkmkbCwqdO4QA6O?=
 =?us-ascii?Q?JwCPAlgQ6yGmRfSdH9OjZ7DTblDZR5G1OKrSs8KiIrnS3HRQV5rqVFmxbXsA?=
 =?us-ascii?Q?NxKbWFHSmSr72UghxIaDy4EPaca+C14VfLzFwcD7AyhR7qBx1rkcXOdkJQ4c?=
 =?us-ascii?Q?b66gJaHHVkupd3caRyPpUrYUz2aZPe6KlWuJNxVbYkCD5VQHh6ZT9bR3Siql?=
 =?us-ascii?Q?ThtRcaUgkisbopSSsK5P5o9WcfQnuA4qAocVxaUESvEuPjosaARYDjo8Knxk?=
 =?us-ascii?Q?MyXyAPwoUhI/wW+jW6CGupUlJtEn/It+5s6wcmIMSy6N6WhvbhvkGb197WgB?=
 =?us-ascii?Q?/YT3ekMRc0PNfhky1e4cJmyid9xSjdU4eK9fTVmj/CWa8LRxyrtSHSM3LWbP?=
 =?us-ascii?Q?4Ty0J38wwObRN7KnJKc391BExAH/ZMhy7myd7uX6Rs6O8CgOth89dOixLSIk?=
 =?us-ascii?Q?PeRwU4wjSNHsoFEliGwtCP/ckVkqBi663pBEDJqy0geggTY0VSrWavHot77b?=
 =?us-ascii?Q?wtppjnuxIVuwlqEVLp5vGAa5kD0b8326/h3RS04ECLvrwNXhzqbYYOC6PP9W?=
 =?us-ascii?Q?+fEcWhAOgiYUSs7soMhUuhKHJJt8wiWDt8Sx7gRRH4BHGM+nEqYVDrfu6xOU?=
 =?us-ascii?Q?NUUiGKVL3y4Wp0Y8JImx2IrJLHQFnfeGHCJGS9HyPtlLHBpwQWvzUPu4ub+V?=
 =?us-ascii?Q?7dJYlq9zqBApYGgvyPk5I267N/+3AX+79RXkCDbv5gOMJo/374iXQPdsnJbP?=
 =?us-ascii?Q?oJZkt60NVuzSCCFk4E7QfTAWec2fVyISiuwS9ZF8/FTnUc8dhzQgEAUqxIzb?=
 =?us-ascii?Q?BvGFCFANIbySes8G0typhvZ37X4Uj811sRjc7QZvlPCU084GkynEo1nqvexS?=
 =?us-ascii?Q?kISa5GvKmQEmHeXILQhLzOhbt1DIlUEGybVj67sNXa/r9CzGKWVuW98vxe7L?=
 =?us-ascii?Q?W4KqccwhR8gdSprXMKOx03x2LUoaPKMNoSSB6kLxvwSSDqQJbk9YF86Qs7Qb?=
 =?us-ascii?Q?QQer82WnOwmibQ+dmvOZtZRaDmqyvn+E3zCw1jwQh2BAeEi+zs4F4KzxDU+S?=
 =?us-ascii?Q?TqWzvS9f3PPuKxznfUARyLavWdVWB1lXrxmbu+VX7scDjk6EYUtGxXIUst/l?=
 =?us-ascii?Q?FcM5ZTxhnV0vGl4mPjqAjxaF12xuzCgvYR77AjPuNm+ai9aESk2Ntjm9x+Q3?=
 =?us-ascii?Q?kzwnQuAqElSX3RUdYq/JTnw9daPLMrQAAQ5U15iASkFjWOjQGE3beP44GNUY?=
 =?us-ascii?Q?JjQBXCTu2a782V8I3md+/ghBr7nV30mpdyOHpGW1jCaozQ/nTtYt6CE5HQjP?=
 =?us-ascii?Q?CSHGiXU3NrMyJirvi2jvs9cSwsxA/cs/6OtHpuQ5wcYVicVtqP4ltDyAMRYT?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	goSdX+W/MVmV7WcKdGRkYVJtDEvqJxqrt3XL/8379Z3IuA7ujGSLW5lqX9DSeR65Eyus57QU14ZYdhcHF65urBpVEFR0BZbO8PczUe1qLJiZ6OvD2i/SL2swbc8BjW5AaMCvQaCkxEFfOVMGojxSEuss0KL1K+ZX2uC484WGfqIjDC7xSxnYcq/iEBx6IHSugR7WVuYFJdaXlmpiMswDi+LkX3pqTjUAhqqmd7wn8SgYT39mTEiDZa/hkgOwUsDUYhwYcTYYYe3VHHHo62DjvMzEW/3keLKNwJHKwPkwxZ0djQLgm+eqaiHjmL791x2MlwS1JG4K5XV1Y0Uj0aNk/Q7KtYko3stXSe7YEUEDSZtU7pKQqrK0OBjMGpZd+Z09qnCPzl9UeAjArIOnpelNdN8rf1+FgZ3Y4Iag1EB8TjXv8pJ+HEcAN3ph7vDNofaLTv6BUjdr8FJ4ZgC70LC2Pp4K7ZSrzFsK2yIdwisUQx2m9THmPL7hUqVq1n1muK4kIocPO9GrGrX+gHhZvug60Ba8BKj8uku6TSCy+sNec19i8xmppUwYQKqxs8wVWtxwX7gkJEajTxOsUDWypdgRRjOveAstUbt1HGWEoP0SGH4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df05137b-8ee9-4342-46cc-08dc6485018b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 17:36:00.1084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IgxiQlfcLkllaMKyOKoqzsSTp0SZtm6gXdfziJqqwJlaxddgwpg3IwjirAxbJvMqB6WA6RBiWGwf3mykEpifq4nTxFkOr16jJkH9aR508AY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4502
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-24_15,2024-04-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 phishscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404240077
X-Proofpoint-GUID: Qbi88EZFqVLy5X1aQLDy9SerXsTAarUM
X-Proofpoint-ORIG-GUID: Qbi88EZFqVLy5X1aQLDy9SerXsTAarUM

On Wed, Apr 24, 2024 at 01:19:59PM -0400, Kris Van Hees via DTrace-devel wrote:
> On Fri, Apr 19, 2024 at 10:27:11AM +0100, Alan Maguire via DTrace-devel wrote:
> > [resending since appears to have bounced last time]
> > 
> > when generating code for print() action we need to identify source
> > of CTF; is it shared CTF, cdefs or ddefs or another module?
> > Use DTRACE_OBJ* values for the first three cases, falling back
> > to using module name pointer as a record argument if these fail.
> 
> I am thinking about this...  It seems unnecessary to add the conditionals
> in the code since every module *has* a name.  So just passing in the module
> name pointer as value would work for all cases anyway.  No need to use any
> special cases.
> 
> But that brings up a different issue...  should we be passing in pointer
> values and expect that they can be retrieved and used as pointers again on
> the consumer end.  While that currently would work, it feels a bit fragile.
> Especially if we might have to deal with modules getting unloaded (and that
> might result in the module getting removed from dtrace also - I don't think it
> does right now, but if we start looking towards long running dtrace sessions,
> that might become something to do).
> 
> Perhaps we should store the module *name* itself?  Slightly less efficient
> but also less fragile?
> 
> > Then when consuming records we can use either shared CTF,
> > cdef, ddef or module CTF as appropriate.  Nick pointed out that
> > the initial solution will not work for module-defined types.
> > 
> > This fixes an issue encountered when using a shared kernel type
> > with alloca()ed memory; DTrace assumed the type was in ddefs
> > and it wasn't so it wasn't displayed.  This change fixes that and
> > all tests continue to pass.  Also tested that it works with
> > kernel module-defined types now:
> > 
> > dtrace: description 'fbt::ieee80211_rx_napi:entry ' matched 1 probe
> > CPU     ID                    FUNCTION:NAME
> >   7 123161          ieee80211_rx_napi:entry 0xffff9f8980fa08e0 = *
> >                                             (struct ieee80211_hw) {
> >                                              .conf = (struct
> > ieee80211_conf) {
> >                                               .listen_interval = (u16)10,
> >                                               .long_frame_max_tx_count =
> > (u8)4,
> >                                               .short_frame_max_tx_count
> > = (u8)7,
> >                                              },
> > 
> > Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> > ---
> >  libdtrace/dt_cg.c      | 18 +++++++++++++++++-
> >  libdtrace/dt_consume.c |  7 +++++--
> >  libdtrace/dt_printf.c  | 24 +++++++++++++++++++++---
> >  libdtrace/dt_printf.h  |  2 +-
> >  4 files changed, 44 insertions(+), 7 deletions(-)
> > 
> > diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> > index 27246a40..542fb887 100644
> > --- a/libdtrace/dt_cg.c
> > +++ b/libdtrace/dt_cg.c
> > @@ -20,6 +20,7 @@
> >  #include <dt_dctx.h>
> >  #include <dt_cg.h>
> >  #include <dt_grammar.h>
> > +#include <dt_module.h>
> >  #include <dt_parser.h>
> >  #include <dt_printf.h>
> >  #include <dt_provider.h>
> > @@ -2831,6 +2832,7 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp,
> > dtrace_actkind_t kind)
> >  	ctf_file_t	*fp = addr->dn_ctfp;
> >  	ctf_id_t	type = addr->dn_type;
> >  	char		n[DT_TYPE_NAMELEN];
> > +	const char	*ctf_obj;
> >  	size_t		size;
> >   	type = ctf_type_reference(fp, type);
> > @@ -2842,9 +2844,23 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp,
> > dtrace_actkind_t kind)
> >  			"print( ) argument #1 reference has type '%s' with size 0; cannot
> > print( ) it.\n",
> >  			ctf_type_name(fp, type, n, sizeof(n)));
> >  -	/* reserve space for addr/type, data/size */
> > +	/* reserve space for addr/type, ctf file identification, data/size */
> >  	addr_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
> >  			      sizeof(uint64_t), 8, NULL, type);
> > +	/* Use DTRACE_OBJ_* where possible, falling back to module name if
> > +	 * none of these match.
> > +	 */
> > +	if (fp == dtp->dt_shared_ctf) {
> > +		ctf_obj = DTRACE_OBJ_KMODS;
> > +	} else if (fp == dtp->dt_cdefs->dm_ctfp) {
> > +		ctf_obj = DTRACE_OBJ_CDEFS;
> > +	} else if (fp == dtp->dt_ddefs->dm_ctfp) {
> > +		ctf_obj = DTRACE_OBJ_DDEFS;
> > +	} else {
> > +		ctf_obj = dt_module_lookup_by_ctf(dtp, fp)->dm_name;
> > +	}
> > +	dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
> > +		   sizeof(uint64_t), 8, NULL, (uint64_t)ctf_obj);
> >  	data_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
> >  			      size, 8, NULL, size);
> >  diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> > index dec2314b..0d6f2642 100644
> > --- a/libdtrace/dt_consume.c
> > +++ b/libdtrace/dt_consume.c
> > @@ -1987,9 +1987,11 @@ static int
> >  dt_print_print(dtrace_hdl_t *dtp, FILE *fp, dtrace_recdesc_t *rec,
> >  	       const caddr_t buf)
> >  {
> > -	dtrace_recdesc_t *data_rec = rec + 1;
> > +	dtrace_recdesc_t *ctf_rec = rec + 1;
> > +	dtrace_recdesc_t *data_rec = rec + 2;
> >  	size_t max_size = dtp->dt_options[DTRACEOPT_PRINTSIZE];
> >  	size_t size = (size_t)data_rec->dtrd_arg;
> > +	const char *ctf_obj = (const char *)ctf_rec->dtrd_arg;
> >  	uint64_t printaddr;
> >   	if (size > max_size)
> > @@ -1998,7 +2000,8 @@ dt_print_print(dtrace_hdl_t *dtp, FILE *fp,
> > dtrace_recdesc_t *rec,
> >  	if (dt_read_scalar(buf, rec, &printaddr) < 0)
> >  		return dt_set_errno(dtp, EDT_PRINT);
> >  -	return dt_print_type(dtp, fp, printaddr, (ctf_id_t)rec->dtrd_arg,
> > +	return dt_print_type(dtp, fp, printaddr, ctf_obj,
> > +			     (ctf_id_t)rec->dtrd_arg,
> >  			     (caddr_t)buf + data_rec->dtrd_offset, size);
> >  }
> >  diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
> > index 50842216..2b5e4e0a 100644
> > --- a/libdtrace/dt_printf.c
> > +++ b/libdtrace/dt_printf.c
> > @@ -14,6 +14,7 @@
> >  #include <limits.h>
> >  #include <port.h>
> >  +#include <dt_module.h>
> >  #include <dt_printf.h>
> >  #include <dt_string.h>
> >  #include <dt_impl.h>
> > @@ -2236,13 +2237,30 @@ err:
> >   int
> >  dt_print_type(dtrace_hdl_t *dtp, FILE *fp, uint64_t printaddr,
> > -	      ctf_id_t type, caddr_t data, size_t size)
> > +	      const char *ctf_obj, ctf_id_t type, caddr_t data, size_t size)
> >  {
> >  	struct dt_visit_arg dva;
> >   	dva.dv_dtp = dtp;
> >  	dva.dv_fp = fp;
> > -	dva.dv_ctfp = dtp->dt_ddefs->dm_ctfp;
> > +
> > +	if (ctf_obj == DTRACE_OBJ_KMODS) {
> > +		dva.dv_ctfp = dtp->dt_shared_ctf;
> > +	} else if (ctf_obj == DTRACE_OBJ_CDEFS) {
> > +		dva.dv_ctfp = dtp->dt_cdefs->dm_ctfp;
> > +	} else if (ctf_obj == DTRACE_OBJ_DDEFS) {
> > +		dva.dv_ctfp = dtp->dt_ddefs->dm_ctfp;
> > +	} else {
> > +		struct dt_module *dm = dt_module_lookup_by_name(dtp, ctf_obj);
> > +
> > +		if (dm)
> > +			dva.dv_ctfp = dt_module_getctf(dtp, dm);
> > +		if (!dm || !dva.dv_ctfp) {
> > +			dt_dprintf("error retrieving CTF for print() action\n");
> > +			return dt_set_errno(dtp, EDT_CTF);
> > +		}
> > +	}
> > +
> >  	dva.dv_data = data;
> >  	dva.dv_size = size;
> >  	dva.dv_last_depth = 0;
> > @@ -2260,5 +2278,5 @@ dt_print_type(dtrace_hdl_t *dtp, FILE *fp,
> > uint64_t printaddr,
> >  	if (dt_print_close_parens(&dva, 0) < 0)
> >  		return -1;
> >  -	return 2;
> > +	return 3;
> >  }
> > diff --git a/libdtrace/dt_printf.h b/libdtrace/dt_printf.h
> > index 9771c4a8..b72ff55b 100644
> > --- a/libdtrace/dt_printf.h
> > +++ b/libdtrace/dt_printf.h
> > @@ -108,7 +108,7 @@ extern int dt_print_ustack(dtrace_hdl_t *, FILE *,
> >      const char *, caddr_t, uint64_t);
> >  extern int dt_print_mod(dtrace_hdl_t *, FILE *, const char *, caddr_t);
> >  extern int dt_print_umod(dtrace_hdl_t *, FILE *, const char *, caddr_t);
> > -extern int dt_print_type(dtrace_hdl_t *, FILE *, uint64_t, ctf_id_t,
> > +extern int dt_print_type(dtrace_hdl_t *, FILE *, uint64_t, const char
> > *, ctf_id_t,
> >  			 caddr_t, size_t);
> >   #ifdef	__cplusplus
> > -- 
> > 2.39.3
> > 
> > 
> > _______________________________________________
> > DTrace-devel mailing list
> > DTrace-devel@oss.oracle.com
> > https://oss.oracle.com/mailman/listinfo/dtrace-devel
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
