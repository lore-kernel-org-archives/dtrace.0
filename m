Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F75A14A0B8
	for <dtrace@lists.linux.dev>; Tue,  4 Jun 2024 18:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717524725; cv=fail; b=R5qr5ujNDwBUED5YiLgD1fTr8myAY1xr9Gm9PhtgEAT2X06rnKvsB38kpZfeMNjYpQR/z4oPF+1WCe+n+fgngYXKqw5Y8yYKJdHYdPmGBcTCGhHzzUi6LKe/SkpVmmJhGWOuYLYkGA/zaQkXlO3Dt+xbNAgOPnYockuzkY28dYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717524725; c=relaxed/simple;
	bh=Vt83BE2ywLHDg5lp7p7yJrldKFZXBeDufww0RYAxvj8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A6hOaMlmlsJCJjfgEVvXlKo1gMG1T9tj+2TowVFmsaxddug1yVMGNZnWJtB5vYT3WA9RE9QmRddfmLnKNQbtpHNBsWO0qZ1SJw2LPT0KPj8FZkrRnWfM/cyvMH9YvZCZueoe5jxdNwo2wRvmU1h0w4Ftn3vUhG0fgBr5v1SMjIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454BnW7w032110
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:12:03 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-type:date:from:in-reply-to:message-id:mime-version:r?=
 =?UTF-8?Q?eferences:subject:to;_s=3Dcorp-2023-11-20;_bh=3DJIhak1k/G9M5L39?=
 =?UTF-8?Q?HV4Z0bPz9PJXJvldEu5W9KDFMalQ=3D;_b=3DdHm9+kScseAp4PZrljhhnj5kuh?=
 =?UTF-8?Q?TEZEJtXzDwXW7fhkm3+nKthrKnCGvj8cKshRvmDRoQ_pY8xwuTp1HfJ0F/uKl7D?=
 =?UTF-8?Q?4rDjKB4uFJ2wSpt4ERB/hQ32eAhYKeB+nZuTb/4OhXXbIiYl_XlNOXKbDc/i/j5?=
 =?UTF-8?Q?daFaBC83VGx596wYb2Ki/wEPypkpjBu2pxmPXnkCDgNkt+HBDaq0lI_ETgP8qUx?=
 =?UTF-8?Q?jlAzPf29R9Fm0TlJ1o5ViJE2ElbislFQJgacHo4CL/9BRHLRRT6g5YyRS8w2_HZ?=
 =?UTF-8?Q?Q03+J8jAYUR8/EiD8QXZpB1H4P9H87Yt6NchFFSB8soSVsvjjx93FuPAHAhVF72?=
 =?UTF-8?Q?7mB_jA=3D=3D_?=
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yfv6u5me3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:12:03 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 454HWnoc005458
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:12:03 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrmdxnyv-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:12:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m5b5g9LAtG/XQPCKkvTf0YIC+ckqCNyCIXwO25NGr3n7mN7vZpqHZdCBvg/ENTZpDaLmBsllS25gfz83u/S+Yjw4xpPzTb+S2JXs3j9SjAoFW/B0YcyIlVY60Nb2O1GCAaC8zQD6KEQy2XvRR/237oazrUKvC51Zuyf+9G2vZxdwHOptNJsV5A+QY07Y6vdkKZZz/7Hugjky4y55jWfWSCGxVVAS2lvt61btuRFiOau4dBMiH+YHBdLg6EtUfDkq5+bxP8nX2ShC6KYZNsH09jkBx33VhCXYgvb7KzzrXq7akJwWEGjg00CA4SAgmcYXd1dTVxC8VOketBGZKHsuIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIhak1k/G9M5L39HV4Z0bPz9PJXJvldEu5W9KDFMalQ=;
 b=TigE6aFRnUO33jcxR4Ga9t1kPzeExMwC3XWT2wrXjdIAX5FYMlOJ97x15wH8MMnUOFLqMdQaSes1pqE0NeDl+jgR4fPrQjRwtthjFTL8Kz5bxgJNll5Ksck0CPyr1s8e4Y/YykLUxehBtKwweUm7Q4vkziLF9Hd1EGn8JuFfFxoo+Fdyi8zFuhB3zdW6Qsysq2v1LCHj8Bc7IZ8S9hgMnx0mYHBjgyIpEBY7dABvKSr5GvMI2O6ar0wlo90tUiplv/zZTix1vXtiaLZkiGfJePIQ+1EFtfS0/BsS1f7J89H0zAdV0mQtg833+O8lNjLKm2xMc0dBrmAB+K9dshikFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIhak1k/G9M5L39HV4Z0bPz9PJXJvldEu5W9KDFMalQ=;
 b=uVuxqMX/N4T5EViYwha/WaxZxZVusa4j9yQDVkw30ll+OdAT0N/CNx36zkI3tLikak59DFFN+5CaFh79ONBlK9cNlqyKg/adO0heQ9M2eEdX7je4hW1BpzzcUHZkdkjWcgNvUpxqxDh9vhaHxrqwDSTB28y8BGAU47dot0QeCoA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB5197.namprd10.prod.outlook.com (2603:10b6:5:3ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Tue, 4 Jun
 2024 18:12:00 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 18:12:00 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 12/14] Fix comments that hardwire DBUF_ offsets
Date: Tue,  4 Jun 2024 14:11:11 -0400
Message-Id: <20240604181113.11505-13-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240604181113.11505-1-eugene.loh@oracle.com>
References: <20240604181113.11505-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0110.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::25) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB5197:EE_
X-MS-Office365-Filtering-Correlation-Id: 8886ff69-433f-4f0e-712b-08dc84c1d445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?j7tkkIO/06HzEv1p54mKkZhMnmG24aF+FM30AXaQrzwCvPge3aouDu7Wgcrn?=
 =?us-ascii?Q?CH7UgEj7YPJ1QanGPfUmMdVogs2XvzsG8I4v2KLeVDTJIeXDQV2C1W33L9ZZ?=
 =?us-ascii?Q?cubhYrnYoymo2NKBkkZ9Njb/EDErgTj7SoF6dzwRHxyk58ubSl0JJz6jcS+/?=
 =?us-ascii?Q?hx2ljFfW4cNlJ2j3R/uZq0Wo2EOg/2VfZ+CouaMZ5/b/afhNAdEhHohNculi?=
 =?us-ascii?Q?c2cFXihg7zqrQ7IqY5qDcbsVAOfTsaiTYltjVK/POhbm3/iYq2E2XB2IBwn9?=
 =?us-ascii?Q?b6SWbRH+kHQ1FOV1SrTkqRTFFMj4zeCcKjS+mvpvkm/tpsHmRpW6phlNbuYJ?=
 =?us-ascii?Q?DLtn3joT8en3mwbTOin7oRKIxDBc1c6FdFyDLjOInrpjxtdOUY8mWUB+T7gh?=
 =?us-ascii?Q?x/Jt9uncqd9LGHp1p9b2kZ8dTUTfNh75oOrpspFvRA7yFM9oeOc6vyGxfxOA?=
 =?us-ascii?Q?GV6H5V59NNwBV4sBbSvF8E3MX+seJyYQs7/Kb1VEqUNwPyhlnx1YUvQ/h5OR?=
 =?us-ascii?Q?WSN+Erdzvvj/zMtJvuI1m1xqwUacTuoajA7T6oBs9eone0YgUA5diwCiZri+?=
 =?us-ascii?Q?m0CXjC9fv9Dph91JpY/DkMnNyZGPnqavdHCa/LBow2oY7CfVx9vxqi102DeK?=
 =?us-ascii?Q?9VK8zJ+q6rKYoggIKSGmkpIjDAIzGos2phGoWUzWo4wov0sKUDEnPpmlFHXw?=
 =?us-ascii?Q?BcUGHqRtQXpB24FsiQ9M6Q+pAXaE7pQHKfjxucdSh8IEDbrXbewxArgog8SY?=
 =?us-ascii?Q?vKal0t6rQuZFCvo4hMyAAQn3muMoX2R/z/bcNLryyM+1CdZrOKlESSAfsqn5?=
 =?us-ascii?Q?PlS1jwnmv8LAVKsBXzcqvzih402Ckun9/GPoy+cte8MnK2JqaSKgpfdopB6k?=
 =?us-ascii?Q?mMpkSH8gRDfskAvob/05pBp1qekm1dJYr1qQJbzA5tJxcXb12eWdIxSxdIH7?=
 =?us-ascii?Q?+P8MSiH0PXiGNUVJdqdkOV9v/mUbXEJofmKsPIHU5RnFK/Pqpy/wVkwiGSYi?=
 =?us-ascii?Q?hIHdQcqQVxZtkQmEI7uRCxGvkh+96JEqMDhbWUBXXmoO4/5mECSt/KiyHyTa?=
 =?us-ascii?Q?d6wV1s7ohz5Fa8Ym3mpcVi5PVZgm0hLhHXrCmdQEsQ0A9loejJpPYPhPwxWK?=
 =?us-ascii?Q?t9ho0Dcy42sGmeomjysUvmfgKp0QtH1HNaxpW4Gre4QnLAQWAFHmJIU2qX6P?=
 =?us-ascii?Q?mon0+xqDfhz8t445XlsubD3jd3y6gG3dcrPODPj8zsaxWtkhoUgecrrHm95Q?=
 =?us-ascii?Q?QfQG3V1Lp5HAzbk1Kr6VnTobVH/GC/+wT9QftPi0Fw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bAyvSA3wUjc23g+aqh2zSQ7KjAeGmD8zAHG+Gk7HehE3FX2s+TU+FDza0RsU?=
 =?us-ascii?Q?oigfKdWDwIgYUDmBH8nF83keAjM/n4NVpF/oaUuiYY76ClyFd8VyB650eTkz?=
 =?us-ascii?Q?VesSj81TqQwH+hV9pAPVz7Rcj2wv6siE1UndUEcUTVd0A/NKYE3Dvh2B4hxE?=
 =?us-ascii?Q?jhHN4aNajk1FEp0IM+OmkVVPyqKwxAIGRCAxMxQoSrU1svearqVfZ6u3ehg4?=
 =?us-ascii?Q?c3dNUc37oaKWYZnVK/RYVjlrylDzj3+bSZCq3mNP2l08bbKokC4Tqz90/iFm?=
 =?us-ascii?Q?T/vSlvfmRxMeuAujpPAMjTAMytWZjex3DDunSpRVzPAZ3w55MIlsxzZ/+YBU?=
 =?us-ascii?Q?pMyzdAGCs4dRMSg+rsjoEGnJPlaLb6gk8LuRlGcwmNONlEdzbVm9m6zQXEby?=
 =?us-ascii?Q?dKv2KevG3UYLNrskaP16J4ZWFDQ8x1Q4IX6MkWGvqWxGMIdhfsudTwEaPIqt?=
 =?us-ascii?Q?bHAXirMfL1+E68Ft4F4ROK/LDykcZ7joVN5J+6eqZ5dHPHl5q98Lwh6Bk4xq?=
 =?us-ascii?Q?DmrANx8QQpMWmrJgg+fdS9DoaeT+0KXPw5/aEtnQSsJbNcExXNEadg6z5LhW?=
 =?us-ascii?Q?WJ32uB7+UnQhzg1Tz8IgQVtOuElCvVaCgV1bvnythlZnqWr1R0T/ZjEof6G1?=
 =?us-ascii?Q?0cBVrh9H998YezsiXJn3KOPgowL6ujATIzoBoJse6fe/VNSORVdw9z6573A2?=
 =?us-ascii?Q?SQ0ZV1XfYZri5oU3r8OiDd7sGGGAGMowwz6EnwjU3ZHhtaK8S3FuyFJ7KDDg?=
 =?us-ascii?Q?mzwKyks/fzQRS+tHpS4qBCwED/96ciYNdJl1iWdcp+Dony8bfOPcABb65o25?=
 =?us-ascii?Q?rG/FZIsC26OfArzveYb3k2CmCdImmz2lQmySZjyqp9vqP0Q6JKk9PUyPNBgz?=
 =?us-ascii?Q?Dt67mM2GAb8atPMTu0h5JXpYFQuq5pmzidW38IV3oIMRXSbpj813O652uIqi?=
 =?us-ascii?Q?HSd5Al5yGMYPLS2ULXogdP/iHx6aaOWC23q7dMq+b+ZawHGzIfhi+xN4PM/7?=
 =?us-ascii?Q?4H/Vfo3QiusZFzidpzZE0v0uQeCRIE+UFMTzWpKZdP6iZKGJA1NLMF1gmuPL?=
 =?us-ascii?Q?uhkEhceRSF+FaFBT+H/KzEwDPhxcL1ajRzjzFUzgpVTs0Lc6OUYLvzI0nYpT?=
 =?us-ascii?Q?e6KWqAat2QZexodV+QPFytWia9XJdyD+MMeYJrjgFEuk+K/P5xeMCDzin7J3?=
 =?us-ascii?Q?OTGZ0Vc+MWTAJ5py9B6BaPCAy58eh9hqLXQB1vsEtadIsEbXsx3oNYtf+ywb?=
 =?us-ascii?Q?sP1AD3smkS3vgdVMCfcO46T3uivU/AY5wfqgqRQuAmUgGUrgLClLg2qyaLSD?=
 =?us-ascii?Q?5N/6HvNfqaFhclMIJxpCmsDrZZW8AS2fMC87LvL7NtXY4k0zI+MWQM07dGdH?=
 =?us-ascii?Q?2d9z1VUhJiB8G1QVYhr6WZzChiSMFYy94lqUsl5F06AxOmhOYYjyDFMCVKyE?=
 =?us-ascii?Q?B6Ek7maJBgAQEBvvEBMxT1oqP9GwIvdQzQv7t2YNigTrIWKvYxJvj1WBlqcK?=
 =?us-ascii?Q?Ci+t4OSWTQxcL8uFHxXzM4v+e6KfR1acU6KhvfvtaW4e/YfbBo2gLXosJsGv?=
 =?us-ascii?Q?sYel7xX/QaaYQe6BhuF/bvnpOj4VGY/UFXjmaXk4?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Jr+XYKku4v+Wpaw7ZDk9Cur6EU/iSz8/aF5vosvfjo69wsQYt80C1NgCsj85HrBzaTHtjAGYXD+/ysUZX5z4rix4dAm+F6JASMV7Vd2H5vLKqyh1+hCrw8jGaWapcaabcjZVVmiJNY1y9pKtALn/968dmbfxO10ye5xue0WjFdaAn5/keFDBDdKWcKR0DH4hee73l4nSisL5Hm7fq93iK+m3ecrN5ETgSEm9b/cttHrKIqBqNV8AO585y7MByMKPqrFvXBTBLgJiLR9tvOE7VlVAS9Ezl7t5SMeqka4sWuRamT3GLHmRT8PVOgvg6Lpjb6Nswwj9ky+X0m46yqcix7ocBiUQh4YWjruO/5C/xbmqvk76WNmtrE36KgBjc9UCqepEO8+sQCZ3xNGKeu74rSVZeTtFWdJjdhHdALby+ceU6qTfyb+cZS6j90EQUvSoQuFSAOGfCutoRtL4Mflisd1/ijY/JJRtKEQOMMq8mvmj3mModPCN53RlRj98RuuJp1qEPyUZ2PoGcbC4TevNBRRJBsTRPJf0/0lveyM6YDRzrH0Y7zaZq14Vb/I8N+q3Y5+HMCEzPEVrQ9ptMCfVfGk4wcKQ7F7LiONIPnTAgmg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8886ff69-433f-4f0e-712b-08dc84c1d445
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 18:12:00.6281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oVQX3c56/sDJhEqQLhslghd2Kk5amS1DvPHdx3BG5swOoAQOaVQrv9ri0bREb/kmNZbZv01icngW2h//t5l0lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5197
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406040146
X-Proofpoint-ORIG-GUID: -QlNDbRME9SKnGwpa8-H2tU-JcveC-Jh
X-Proofpoint-GUID: -QlNDbRME9SKnGwpa8-H2tU-JcveC-Jh

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_cg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index e166d2d8..0977406a 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -1057,8 +1057,8 @@ dt_cg_tramp_error(dt_pcb_t *pcb)
  *
  *	1. Store the base pointer to the output data buffer in %r9.
  *	2. Initialize the machine state (dctx->mst).
- *	3. Store the epid at [%r9 + 0].
- *	4. Store 0 to indicate no active speculation at [%r9 + 4].
+ *	3. Store the epid at [%r9 + DBUF_EPID].
+ *	4. Store 0 to indicate no active speculation at [%r9 + DBUF_SPECID].
  *	5. Evaluate the predicate expression and return if false.
  *
  * The dt_program() function will always return 0.
-- 
2.18.4

