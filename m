Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E7222B64B
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 02:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729824110; cv=fail; b=lWyWOwzxgEKkj6+vDyH9bKntz8xLWeet9zdf8lbeaKyBEx9ABz7fJGUGYDElzM1Fjk8YfDLbZK2yLU9WM4PK5N6cj/7fJ2HDiXBxzyybCRajwNpLiwCCp6rVFZUYH36A/TbSAY2J08voICqTc7w87+OWyeDQb7l9HXd2jrV4h/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729824110; c=relaxed/simple;
	bh=jRZrTk/qgqhGV1srnxTCUNqhpJG0KFuYRkae52mmTFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eloQk0FPd5wT9Uv0LaG7jQlcWA+6kZbxWyANfkVm/j1RLW3tBrT9jX89k5gvk7J3XGBAd+aqYLmaCiw4LxzJKdgjaMlX4n1ltffoMZ7/rB2j7VKVOB/cRZDxuJuxc3tRaF9W+30jeApzamgnGZPaGCaAB5HSvyy70LZ1noE4zJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=A9726wdv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EtyoxNAE; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="A9726wdv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EtyoxNAE"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P2flcb005434;
	Fri, 25 Oct 2024 02:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=2p0m+FjM8t0QyAIW8z
	X2tH+ahRMDiNnKSjAM7DOEdvw=; b=A9726wdvnZDqExB+AOWXjHyTgPKSJ/OB8w
	4+R4osMeeRhT+tByHcckpqw5nIrEotA9wHcilZFAAxcMkZ57eNtIg/57A4+w1Lwi
	hG6arf620hLe6ZWrz90cOLuAI8tDNRZrtPSxb0VmHJaVTDb14kIXVjZEZ6Pl7E5e
	KcWE9yrtXAbxWQH1KSkymufl3LqKZXmfEahH/FVZOI414nzdMKHkP93kr92R57zH
	qXj/tprwqhMDbSzaey4J3eYF8NJHUqZ3sIk1V8KwWhzuXHoOj7o59mmCReebZdWL
	MXtlxDtbF/M86XML4Rtjd0PcQTrf5vuo2SsIpRwEDVIQGtZRmROA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c55v419e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 02:41:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49P0VKSi025419;
	Fri, 25 Oct 2024 02:41:46 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emhbrn7b-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 02:41:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wRWAWVIQRjvpelEFwHt9PtDuUmHleCch+rBMoH8WeNjgTK9Z+r0uEioRwTj10oWiYsUTNqeB1NKVpf9vI3AEc6+t6YrNMRa4Rw8LN3Ajoo+ycO7BMyNBaTl52zVA54X1IgTHPGKIfCMlW3aHk/L6OzT9yQWdUOD9UXZakcIAZnoSfQLU96KSt5vRPt+e5ZTzDDK5ImT3dvSYO2nNZzr7jS7BmJG/TeBAiG515BJ1ehQ7//E/bGefUDy9L+2K7m7ixu9esWHpl8Q7RMlt0/w3O0y1nLZR/PZdeihxRvAuG7gKSClUTEYIjiz0nURZ4B3cYQfv5HMOIuK6n62fWWKO9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2p0m+FjM8t0QyAIW8zX2tH+ahRMDiNnKSjAM7DOEdvw=;
 b=wPZBcreNatkWyVCpEmTLqQ4UzBxg0MldajBL63uc7a1AF+k5r7AE+PNz2T4YV0g3wNvXDELxDN3FITmmHRROPN/iGpr0M9q9iAyxYFda7uAsQFelr9oRX7sq92lPP3dGgtHMS2bpKZGhRTpwhWranUDqXXO8F1BZ1Pt3iq8J1uuAkg5PkV6542FpJb/DydbJALu1OPw645tbi13OMIcq1hlBjZv4tDlAYdx37O1rK4GqOBuwDp4DkdZkIGK0d45Mq/Im+LufZaQ3/xryKt5U4Aagoze+IPotnIyuj6X9HMJxh6IKD3Whp35t6b6mLsHqzfkfQEmuDPgYu4bTwipX+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2p0m+FjM8t0QyAIW8zX2tH+ahRMDiNnKSjAM7DOEdvw=;
 b=EtyoxNAE4K2Apd2Q8SyA8VMPFkB8K/LfbOv9AUFs7HO8w7IW65cJBG1If1lsN05RJnXV9/i25HuewYuq9Xsph6fkmyX+34b46yDh2pCqBSsSeJcHUJ4j5k1/pYrxFt0fWipsX6/Fzq3DzRsw3Z01qVu41KKlTH9fc+XnLO+NSpc=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS0PR10MB8176.namprd10.prod.outlook.com (2603:10b6:8:201::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Fri, 25 Oct
 2024 02:41:42 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 02:41:41 +0000
Date: Thu, 24 Oct 2024 22:41:39 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com, sam@gentoo.org
Subject: Re: [PATCH 06/14] configure: fix dreadful behaviour of MANDIR /
 --mandir
Message-ID: <ZxsFY1r4tTuo9sey@kvh-deb-bpf.us.oracle.com>
References: <20241024113758.182050-1-nick.alcock@oracle.com>
 <20241024113758.182050-7-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024113758.182050-7-nick.alcock@oracle.com>
X-ClientProxiedBy: SJ0PR05CA0203.namprd05.prod.outlook.com
 (2603:10b6:a03:330::28) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS0PR10MB8176:EE_
X-MS-Office365-Filtering-Correlation-Id: 9566741a-cc81-4e9a-3091-08dcf49e8e9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oRsvkrFhw+R+KQJWDnmyd6jsxDx7Tbptc7TdlBsa9h+rjlFEyNzBQG1Jpeq1?=
 =?us-ascii?Q?UkQBDZE6BxCOSZOV9UCnvZzPZXzjfYZ8/E26XsoOG+5HoCKYgH6Sdk0lVRjr?=
 =?us-ascii?Q?bMvErF66a7uybwhOuexOKILDUnBUaIqV+JlatSWqcjYztTjSsywbTUa7i8Pa?=
 =?us-ascii?Q?iEQyAXVR1AegsVTRyGpwLhXvsg9hARLRhds4jrwWRJ5m8TsNOt1HNaKbm1b5?=
 =?us-ascii?Q?Ps0ZV3FthoIBHmjxDL0/wHibnNv3bNvwE/tCZhGEwUqt/H5leWnsbA8w/GJ8?=
 =?us-ascii?Q?ncfkD6NkVc/x7CHOhHeV8slULpZdwJUcqxIRCwJLJf+Z6HBK+UQST6TCSRM2?=
 =?us-ascii?Q?t6YVcmeEkynGVeYlS6W3KbA+lQxoNSMwVZbRDHPug4gNoUzVoXpb/HNOztHw?=
 =?us-ascii?Q?CTW5EpQSj2UQK1pYlLeH2KwpHbLgW90DVMYt31V3fDyvSZi+pi8P4Jnuw9oI?=
 =?us-ascii?Q?n1I3h1Yoc33H6GpUNRObvPgb0yTQxn22sapLrfroUYTT9OKQBTqG5f1Ye0ME?=
 =?us-ascii?Q?FmrNaQCOQJ8AiO0RGN512q+eny7Kbu2Jp44RFws0N4Ojd021vhjnrfii0VEl?=
 =?us-ascii?Q?SKlL/1Yp6qFKo0PbgekEV6+PdEHX/2/S7tjpRe1BUnhTZzIigYvKruMCki67?=
 =?us-ascii?Q?NKLdZ+OTgmWILerVhQn4W5IetrMFxQsLb0k88da7xbrm1rwckw2RZh2+5lX/?=
 =?us-ascii?Q?t4mRAV/hyBX80MNEsimUA7xli1TOkNhb/bIsD1KNUuo495Cby7yKAdEGMCaE?=
 =?us-ascii?Q?N1zsbL3znRvvHkPt1pTxF2Z5PAhYUyk6CFc3+EfVWzU0gW9pk+Sx2kpYI/1p?=
 =?us-ascii?Q?SUrHbnm/K5N4iCLYzNM6mGxDIEJyeg0Vpx1SS8EXgS2/ZKYb4flNwKvxzdgu?=
 =?us-ascii?Q?iCqH/o/weX97ZF9d0PKnGaUfFnQW5xsaNmqOXiXP2c9WSuYzyd3S1Tx5lIfq?=
 =?us-ascii?Q?LrsquijvciJpydZ37Z92HdvQUyHc+xMcRToO9M0wxaQAOQHOnIsmdG7S9wqZ?=
 =?us-ascii?Q?LPt+SI6jKHqaMGHO7BK4S/Xm5T8VzfsISzYhE13S8+x4hGL/beoTl3v1PL3Y?=
 =?us-ascii?Q?oDIEERtIgnBgdj1tEOIjoQYWydjh6p01yD8HyRn15Kx6+BcqT7PghAFJl7Tb?=
 =?us-ascii?Q?FB4kfiSYNdHV24/zyrcHaATnUkGSynM3JSp7B2zVaJ1ZBpPPd+v9QGygwk1w?=
 =?us-ascii?Q?PR7+7+A1fxlRe0gLN9Cxh/D36qRZa1bXfhvx5lMGK88gAMxsFcPysZDXVUnn?=
 =?us-ascii?Q?WqCtIUpNjkCTTQ12zz7+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7tQz3k0jvhglDGjEQOw6nQcr8la4hzRntGzzI733vKqVAmf9/H5CEUh/ThxZ?=
 =?us-ascii?Q?BAAuAlJDAIkwpPZN37q8lxb1PI7TCbM1iPjGm76kSduBR/iPcd/mWfE22izK?=
 =?us-ascii?Q?UxMedNDCmmqQ4tpoULULBubTDiV53CIci8jzAlYOzLUvuecXhQPgPvo4egQD?=
 =?us-ascii?Q?C5Mu+rg+pfgNXguAhcGVEa2/JwhZgjgOmyGsSS/y6S5Dp1GbfY3EAp8AC7yd?=
 =?us-ascii?Q?VcHnDkDWkwlxuQVzIpkwVhLF493ZW448l6jTzf3xL+36VC5DSbzrJZYjog6O?=
 =?us-ascii?Q?5i8L+iopGBdhWRmRswE7UaZJX4NavsIbWxUaLjOpnXrYDs9saWrQ6y8qi1vG?=
 =?us-ascii?Q?Ihkx6OP/swjyED4jia6ntOl+rBQiUBqWi1R6lSPcsSxE7vzGNGnFnxdTTjbx?=
 =?us-ascii?Q?wEA1Yktof35NW91+L05EvHFDjYX0TjIg3qZtWujLXeCzicSwf7ofRfumtgL6?=
 =?us-ascii?Q?JpEsNLi5FUAooIUeGh9PUpXOViG1o02g18w23YID833gUz7ZvuwzjOX+3CUk?=
 =?us-ascii?Q?GHf0mkYuluXnr4Zr/L7BYX81W5UceHtdCfjh/snjG4CWpA6klldA/lqz5VmK?=
 =?us-ascii?Q?xCuC+5lqevcsP8ORCoFOY9g2SnCv5dCoxQfwQFQjExk/BMXnFVRa7nMtiPwq?=
 =?us-ascii?Q?6A8Ak63jYdIBHUAlp7+EXM8dPt+tdzac9CVoqa52lXe1t8q0DcRfReESgwT1?=
 =?us-ascii?Q?chDfOucBbB1ZNmK2SVXCZVq/Ha7DQ++TtVDtMZSIYyl104UdtXOdfJ1Vu9PW?=
 =?us-ascii?Q?kdDKRv6x9QvS4oh0sbOuVhV5/n+FIfyKzbWbp/GRT1i2JdSuoP1awHG4LDef?=
 =?us-ascii?Q?EW1WpeZ/8nG03W4R9evNS3E4FKQ53GYPYU/LyNc2Kwa5HBIn7OVgpHZMFfc1?=
 =?us-ascii?Q?mZ2OB6KShWbvdrTL1NSHkAQiSMqP+yE5NGGJfLnwrhR+Y8+3h5wRmQSkhNLA?=
 =?us-ascii?Q?xSxbpUrq2VmWy32QlJ21bz53XPIdl5+7BuJ1fKkGELLKM457dYS3YmP2lypl?=
 =?us-ascii?Q?y68vRlykSh1657degs7385EOCq8SKqInrXUiM+2V+pcKcd/NI8K9gZbkv+Wf?=
 =?us-ascii?Q?90aUI3RU/5+aqMr3A78w04wDDIiozgY8P4VX84SeVGi+JgKYLAF5ypZDIUKg?=
 =?us-ascii?Q?NnnXtSUEsVSnm1XDbwWIjmWpSNzEiR7EZi3PQ9xyi7mtjU4C9TLsKd/BV0Wx?=
 =?us-ascii?Q?7cjDHr4SyGrLgXx3nrl65MVQdqv+CJfvHEy2AxqEfdd/tuAQ4mMrws921bHq?=
 =?us-ascii?Q?9Id3D9ssaQw6c0xjSRU32huMiPzX+0gC1BYyULYO5MYfeLO/V1KhInVLrm0S?=
 =?us-ascii?Q?Ec7FymCPrXEwjZVSDumixIhhiO88+rxslZ3un0eNDPgFURHPmhgFIrQjo5ls?=
 =?us-ascii?Q?1m3IJNOUBUKbYLR9v1t/8jF/dGovL7PxTAfPjpHZobea0IPKecO2LdPxPIlE?=
 =?us-ascii?Q?8/tock3rOCkZdcWWfJOuOfw9uWG5rXLes3Jj7JT5ikdpUvdxJHmM7yMIcplK?=
 =?us-ascii?Q?b09z1cHRmFdOe5EIK6TUdeZ92RsUIs5qCDUpJ9y2MInXYqh60sZbJsbalpmA?=
 =?us-ascii?Q?FiJCY7kZ/a0QlGMkue1jza7y1sQ0J2RbIu/zfDRV0wfZ6UopiAPAjVeeYHPY?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	02HTBq8GkCfypv8zHrS+mtONTvTE9buyV/Yiauzj6TC0p+W/rYh9vZkKoT8fdFzsTZValwGrGug6kDmTBSUp4p2eD5Fg7k8KII5V8Hp++hgoNGcE2MCaEVOxcE+uOUlaTltRlg6BYjdrRgxg3jCIiQqsbpIipq4ksz/p7UaaWxR0zMnoGBV01YpZWrPxGIFhu3Tqyxi/dvFsiZhWpyIsZPmldog/Dsc1Sr3cLafDNC9c6ZwWQZoaZmWj1mWbMSnt0ioXSZUyMjwD/CYxFW/nhsz+KeM7GMivZ48jZsxwOBtl6yCkF5+WOFHOqpGtGTSGyIt8xdQu9UVVrYzagxmclbKgFIy8Eo9Htlk+MzKbu6voYDiKuiQvrEzEJEnpFRl6+AIzk29/72FafDWQ6thzdqC116VLuGAhji/zDw1x+DawH8m5WqQPmDVZdYRhwJSVCTCNuSvd02Er2q9+DpliD+y7mi8DRcTkOH7w2s64PeP3ajCPHTg7p7L6ZQrg7a9x7nT9XhMbYvKvOjcOEpdzidL23WRgdurDLYIlkwF0eeAQSxJDWj+QkrYZvvJtzLuud1KyuGdO6URITBgRwvenrNCFjs3raKyeVMAqO9nC0KI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9566741a-cc81-4e9a-3091-08dcf49e8e9f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 02:41:41.5377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aEtSlKv21dQWV1h0T9pnEjk1LTHGTdO0UWSdJC4bRGKXEwi//XAo7MLJ5DMWhJ3qVHSy93NOvx0jn4YYBWLbjCylWWOr9XIuI9EPgaN4YEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8176
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_02,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410250018
X-Proofpoint-GUID: AqH_Oii1fxytAXbQUwwiPHwgGcy3HPFT
X-Proofpoint-ORIG-GUID: AqH_Oii1fxytAXbQUwwiPHwgGcy3HPFT

On Thu, Oct 24, 2024 at 12:37:50PM +0100, Nick Alcock wrote:
> This should obviously refer to the top-level mandir, i.e. PREFIX/share/man,
> not PREFIX/share/man/man8!  Literally no package ever does that, I don't
> know what I was thinking...
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> Bug: https://github.com/oracle/dtrace-utils/issues/106

Bug: before Signed-off-by:

With that...

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  GNUmakefile | 2 +-
>  cmd/Build   | 2 +-
>  configure   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/GNUmakefile b/GNUmakefile
> index 99960227bcba..e2c4108fec6f 100644
> --- a/GNUmakefile
> +++ b/GNUmakefile
> @@ -96,7 +96,7 @@ INSTSYSTEMDPRESETDIR = $(DESTDIR)$(SYSTEMDPRESETDIR)
>  INSTSYSTEMDUNITDIR = $(DESTDIR)$(SYSTEMDUNITDIR)
>  DOCDIR = $(prefix)/share/doc/dtrace-$(VERSION)
>  INSTDOCDIR = $(DESTDIR)$(DOCDIR)
> -MANDIR = $(prefix)/share/man/man8
> +MANDIR = $(prefix)/share/man
>  INSTMANDIR = $(DESTDIR)$(MANDIR)
>  PKGCONFIGDIR = $(prefix)/share/pkgconfig
>  INSTPKGCONFIGDIR = $(DESTDIR)$(PKGCONFIGDIR)
> diff --git a/cmd/Build b/cmd/Build
> index 68800fbeb5fc..38a538c1e3c9 100644
> --- a/cmd/Build
> +++ b/cmd/Build
> @@ -55,4 +55,4 @@ install::
>  	$(call describe-install-target,$(INSTSBINDIR),dtrace)
>  	install -m 755 $(objdir)/dtrace $(INSTSBINDIR)
>  	$(call describe-install-target,$(INSTMANDIR),dtrace.8)
> -	install -m 644 $(dtrace_DIR)/dtrace.8 $(INSTMANDIR)
> +	install -m 644 $(dtrace_DIR)/dtrace.8 $(INSTMANDIR)/man8
> diff --git a/configure b/configure
> index 0c9fb309c494..4ce64efe4ed3 100755
> --- a/configure
> +++ b/configure
> @@ -58,7 +58,7 @@ Installation paths:
>  --bindir=PREFIX/sbin				Binary directory
>  --sbindir=PREFIX/sbin				Alias for --bindir
>  --includedir=PREFIX/include			#include directory
> ---mandir=PREFIX/share/man/man8			Manpage directory
> +--mandir=PREFIX/share/man			Manpage directory
>  --pkg-config-dir=PREFIX/share/pkgconfig		Pkg-config directory
>  --udevdir=PREFIX/lib/udev/rules.d		udev rules directory
>  --systemd-unit-dir=PREFIX/lib/systemd/system	systemd unit directory
> -- 
> 2.46.0.278.g36e3a12567
> 
