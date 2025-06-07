Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFE31CFBA
	for <dtrace@lists.linux.dev>; Sat,  7 Jun 2025 06:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749276909; cv=fail; b=f5W1Y1ayv9+F89jFWme/FHt4QiY4VF+IvRxzIXP9rP4KgXexzZuHNMOZcvLkeDsvrlJ5IXy7Vp63eFRFiyghd4zdH4mNV1bySNQNCgMTTNxkP2Cc9p5AVoWWtLzJIqVMGrKrbC9KI8cMAPAcPcnt0EVmLjlrfKeltL5AT1l2m/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749276909; c=relaxed/simple;
	bh=j0S2ay+v6rJgcqUJ/+lfTuad3ln0r9XxGskP5u0EVa0=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=pM6bvaya5zZ+e4A0ILiTVcDahZ5ZHoFgj2Nk0OOLPvMzVYBRATV8cJ8PKH0Nh53x9+xmmjzb+ciPHiNWTnvtxBvgZ3Ft1esyXOvOAAHTE5ubSdxX46vWsUzzd3spwT1kkIaInbauVyWTidrO5j4e+oGM/w+3jHtUgnysv8DnbE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cO9Cm1pw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Mm113ig9; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cO9Cm1pw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Mm113ig9"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5576Dsh5019241
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=bDzUaI5FGKBnE0KvjQ9WyNAS5Q5cCvNPhNgrIz5SiwY=; b=
	cO9Cm1pwfbhdr5ZrlbsPmU+mZInI4dYbivSJFVvixPpEa2ePKFopc4M4uZXZVct0
	6E7Cso35H8sIPwjTU5O6IVRHJR6tM3X3LO3mG2qtD6JZkFFaG6X16cL83wS/6g+T
	L8ldWU+rCbN6aw5+mr3ToMdaGRaeBSG5CU2F1DZrQxg5+hYg4AEHQ23XU88+dN+A
	KPVIBPBh+i/BuftgTWBXj6LJZNEziugpLd7zaRIH2qpEMDRVq704t4wn9uvZyyPc
	6YNZcZ2RXWYtWJQpFBziAPXfddl/y+smU0LjVGdnaOxhUsI27ATQv9AzJjQk5i5h
	6gwhN7KFAAQ/SFb0lWmACA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c14838q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55765vNK003191
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:04 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010015.outbound.protection.outlook.com [52.101.56.15])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv5uyqr-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jbXVWcYvH1h+ruqSVev7JtdSrTjq5ClREy6PHnEaVv+xjUN3FyCgLkEtopsBS0GwAQqBGCY6uqfV1S9Pyn8FxUzGA7W+GaZkHvTJTPSM5mphPHIG8gs5NX3OcjPXDOzSYHKHxN1v7qkwDXze8jyMq3Fkox0UzG40vhmOKFLmENcxeeakCXocBb3yFI1eFGuq5l8K+gxTwQpv3trgO7Yul7J4w7h05NH+U9v+D/vMblA1N0JHz8GNZSChkJNzl/W4P9i/EqzUS/86sYbZSMGl14upGcgou7MbzTPG8M9nTUf7cMJWjUvNKAZdCoRP9c0Nyg9tHXInJhWEgK+KDaI03Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDzUaI5FGKBnE0KvjQ9WyNAS5Q5cCvNPhNgrIz5SiwY=;
 b=XoKUmq42FXhNyANnLvw8Y67/X4gp1hhVzO3N4OgF3Yl/N9X5H7SzF82Y8i5XBT5bBTuMVCXkPUZ0tTPBJCr7MYOh0dujvVeJiBNTEHZ9y4Z5gxioQYmLb5XwDN8ij1/sTYRTIua3NkZDccobMEau4efBd5ddddV58GuIALF9YpToZcrD/SWBdAeEb87veNzcLPXIAn4Q6E4i8P7bw7mVUXnGPAhRzwsavHaXTwVjtF8Sf5jyQkyasVtB4vhM7pwz2wmlj+uoNZJAX4GpArHsqXQBxu38qp3Wx8qL51oryBaJKLY7q2jFejXnVUIKz8eCnIfMWU6OJjBA/hpJKRsjog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDzUaI5FGKBnE0KvjQ9WyNAS5Q5cCvNPhNgrIz5SiwY=;
 b=Mm113ig9b3nyn+Gf1Igz6hyC79PFF16TiQXXvRP8cQanDXNf+bP9Et5ukxEbsxIbaUeUgOk10kEcdvLGSjDyms2EiQb5bjqH0jfsgQ/Rox9aHUfuZD+2+1DrA13lfrFiJw+Nt7uuZ6uzpamgF876YlvS/w0TcrmdYMKBRPM1Hk0=
Received: from IA4PR10MB8374.namprd10.prod.outlook.com (2603:10b6:208:55c::22)
 by IA4PR10MB8636.namprd10.prod.outlook.com (2603:10b6:208:568::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Sat, 7 Jun
 2025 06:15:02 +0000
Received: from IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab]) by IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab%5]) with mapi id 15.20.8813.020; Sat, 7 Jun 2025
 06:15:02 +0000
Date: Sat, 07 Jun 2025 02:15:01 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 09/17] htab: move htab handling to libcommon
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:208:36e::18) To IA4PR10MB8374.namprd10.prod.outlook.com
 (2603:10b6:208:55c::22)
Message-ID:
 <IA4PR10MB83748CA7584BF9B8C716D2FBC269A@IA4PR10MB8374.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR10MB8374:EE_|IA4PR10MB8636:EE_
X-MS-Office365-Filtering-Correlation-Id: aec4fdac-b09b-4753-4096-08dda58aa37e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lK7r0SS8wJ2Qi9F77Do0TZegN1dTbGMCZfN/daghjtbLACnIVSu2uiOU+rj6?=
 =?us-ascii?Q?YiOdjE1EzJznJarHi1ipZNNy15Vck/vJZIJpu3YA3+7L77zPyef+Zp7BB5gM?=
 =?us-ascii?Q?H7ZUUxeE5efP9tRk0PVCzqr5TCDSdx2hPxAnFRFzzYJX50gYJg3M8QrfFt+/?=
 =?us-ascii?Q?3PAfZfMrT+JDTYGBtDw+xw3XkKXysuQ63o63C+wIQXJpFof++Lt2YlMtAdZE?=
 =?us-ascii?Q?PBocXxHnenlXAa81zlvk0c1d+5FnXW6t6jKhANoy8tnI6KPKW6cNTlDRzCJk?=
 =?us-ascii?Q?hvEXWBRwBJf3eTwb8lG+XNaeiVBqQ5BV+929vP81mMAvc67zPKFM7VpsIsLv?=
 =?us-ascii?Q?qyGWF7CvbSu7NAqXtdPOhwUpPFMlvqJxMtpRKVLYt38fOajoHG/Mw9ASh3QM?=
 =?us-ascii?Q?GbhoyTo1lrnu+97nIqQ6O0g0X7HhBJsjyaDXlVtWgNd5GNWj00t9pg1Hctqf?=
 =?us-ascii?Q?vT3D9wwF7atF4i9k4ffij3wxr9wi+QOhqGEZtY38boFwgN9LrEKq01aMMdrz?=
 =?us-ascii?Q?dKnSGY7V2owJXMsInFseaOW+5m5PZSpx7jPz2KACKd40pvaPbq24vkEXWJkl?=
 =?us-ascii?Q?+qnBLQnWdh2E0tLCR3AsFsuZtpxyaMfByFgl9GbHe0Cx4x5oLcNM3KO/pLoL?=
 =?us-ascii?Q?iS0+AvvRsliLMJPWnxw6rSfiFUJaq1fZyVtbXbC1d7CGqFyQVQtiti9YZpFq?=
 =?us-ascii?Q?5Y5ZA2jvSyx7gI7eJgsTAI9JfHC8htewrpeH9M2wJW7FEFhUXM5dP9Isb9Xe?=
 =?us-ascii?Q?HTczefX5fJrLfsolQp0CAL/6wY8nXnZFHNXnUnhQOZBOVEJTHC9VnNtk30Ks?=
 =?us-ascii?Q?mZ3PxVCVY621iN86D3sP8jGiJ82hh6qaCtIjxjJlIB38xSCo63I10shnulgl?=
 =?us-ascii?Q?9V8zkThSAEOxAoqPRXDK9wS+j2ZgkZpSnoQJgavuYnIfCLays5bkSqealchJ?=
 =?us-ascii?Q?eYyQT3KB5JV3lCP+mM538HhSm4Fvpat6LwXitWrjt6fl/wv6yOaeGF+8yyxs?=
 =?us-ascii?Q?lNyyKXqYH7bd4BV4NM1oynIUh+XY3hnqB69qVYW07p6O7dXgOuLBa35htmE+?=
 =?us-ascii?Q?oYPHI1C324vawrwmjHK/HKlnGNc3WDwIQ41DWYkxI7YzakOmVbAkIZACuymR?=
 =?us-ascii?Q?MIpFoUcb/JecFo1n4varPPATvj743iNCMAJtI0b2ZhEjETatwIOk3ZPl1td2?=
 =?us-ascii?Q?3RttshgEeYI1DfedqiBb7ptU75SEXsSrtyama1664ucvK+sKKdsGs4EZbIJ2?=
 =?us-ascii?Q?DLWN9f1rrNwMWRnmUVcaDa/VfR3Z9Zg4Y+UPL241mnezmOR1vF9n3ZcaRyWz?=
 =?us-ascii?Q?hXrF1uqbh2pR8fbAEr53eMSajGSKy+Q4/KtIYLE8YEJIv8HD5fi3fnvMrkeG?=
 =?us-ascii?Q?0um+95qQKKminrbEZU6xrsMWNlj7kVz6ggerfqmm0e3TgbwzfZavsGUDP6F9?=
 =?us-ascii?Q?lfT+8W3wzIc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR10MB8374.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gc+y7S8I9bU39LyAMIHaOI0VJPYPdLlM9EJuyVhXvFu5mlaqUB6Qn6iEjmLx?=
 =?us-ascii?Q?EEZhi8XkCWRFRB7ThMW/i+WSL/oOB/RVeCV/+jDQxvtJfph7pUTRoHMTlS2l?=
 =?us-ascii?Q?dJe+eYTLQfToxwT48vNJpO4RGq56UkKSaXm6rRADaSXDGGYcf8Ye0M9Pb8ac?=
 =?us-ascii?Q?fJZIrKfqt+ArHOiCgd5eOo71BbzMvrqxIydRz/ImcqUXtzlNSQyXjmnxDZxr?=
 =?us-ascii?Q?5IBcof6N2CKoHnRlLyTA6EwhEDPmsxAXLqxy6uXANtnfRgUbMlZu4iP2mZzg?=
 =?us-ascii?Q?MqAP0a1ia/iyLbA5SBCUXO2Ksi7dnzdF+W7jEAKYiVEsjaYbI0kdQzqMwdhK?=
 =?us-ascii?Q?qQhhi5XSWRWiryTJg9iaUzKgYS9ccqn1S0cpbqiaeJdYjvSZYylb+iXq7OBH?=
 =?us-ascii?Q?u2hy4uvTWl5fLLGnwDqHSAHW7Ys4Y6x4nBrIlLtwUdH+R1JtCpammum4PScC?=
 =?us-ascii?Q?yBpIu2Of2Pr8eTDCfJUA4pXxu7OVR+L8w3hbJeNZag8+HteuXAy7/KkQRPvz?=
 =?us-ascii?Q?qeuiAu3S9fgINwcw04JP1TmAdreZzzhc7LZGpAU7Y3wCrkQEXdXza0xWapQ+?=
 =?us-ascii?Q?AjWAsRgvJDQslk/8vfve089i358dAPiqljdEGu+4xXv7Qx+HoiId8IT/432s?=
 =?us-ascii?Q?EWE/9HlvXPWdYogmErSMMLf2i1LTqNYiz6RpI9VCODCrVdVvSrYnwOPi8aV0?=
 =?us-ascii?Q?VW84F09wN7DIKZxMvLX7OwrI8uHnw88dS0T+ATJ28syCDCgxil2846bb5dMl?=
 =?us-ascii?Q?uqpAbCCeHo0aQhCvLSkFn1aZPtmkjQzhWOssZ/O+yKBMK728EX5ySV803uhN?=
 =?us-ascii?Q?CFyFBM5IzJ+VOyyl+FSXfhf/z7537UE5mTyj1ME//UwrXJKOzHAoHq2JX820?=
 =?us-ascii?Q?odpPEKR7NNxlSkinHXTscbkJr0atIDHZW7/yQsh8HtybN3Qu2FCUO0S3dnSv?=
 =?us-ascii?Q?YUPZnNUcQQdBWtTGlDk/mOWFEiQ3CAFwtW79sOVOvoJVK3dhmed1hm8kEW8Q?=
 =?us-ascii?Q?/3rC/XKE0eHcwOBbjl4OX43FqkX42f4VM4ss8f6F+mZNBgmMZO8fyx5oIMMo?=
 =?us-ascii?Q?kaNptr/LVwGyWTK9Aom0zTp03znglR+TnTEFGyUS8M3sGmIdfN92//qpnhNU?=
 =?us-ascii?Q?FNtn7BUlYCQxDCVr4u5tDRRXK/bWZvNsuCQHGyIRMx1HMx/STC1/r94UXvhB?=
 =?us-ascii?Q?DQwa4kLWM/g1fCiLQUtsIVjRqSfSru4Et7iRJE+f9waEgEDHVDjbFmb+Q05V?=
 =?us-ascii?Q?5uoZu/7MBKy1LU8+XzGRmyXDapUy/ao5KdYHiIQLRJpsHC1B4mB8kFloXB+J?=
 =?us-ascii?Q?goHe5c2Mn7BroBUXcNDuPzJrV5ogxiovgM25rtOaldOZpfsAdfwb7OOLei6k?=
 =?us-ascii?Q?UMWCMmi6MTsEgrUR87EXHG2VWf1LpjJOka9EjWp/meUrnTnx8OxxWHTy+c9I?=
 =?us-ascii?Q?FqVDl93RT/IlaRl+R96P4OsdwiyRgkHnkieXZGV78SGZPRn3H8ImlI6UTvmz?=
 =?us-ascii?Q?n4RC0gFej8vkDeZ9nWDsHYS8NcbGTC6evJOQqaRG8Axft5MidzAzKxk1Cwca?=
 =?us-ascii?Q?0vk9CRENtADdIhjIEuCq1BMbZxphapOVO9EK8kbXRcMHdLRAvN/aNSoZEq6C?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QPSxS4bRgzGNzFIjKDFoVR3tPp4vmijUEARdrSYwQlHI8Hw5WFA7N8eJCGFnHFMoJunUhk0CsA62zxZRX74wzdtouNRo4+pFT3F05Djnhezi4op1mPucccTYTE8nitTsP9unNRBuPutC/pJJm5OayZz7CHlWoPEbuQmi4Ikb8p5T4ZmPuRuUHKY2P4IB84njST6g7w6ky4DPsNJQMORQ+iBqtsJhlkTWn3IfDHInE94BVCk+Nd7EG1/QDWGWLHZepO0n4WyCPhyEqCbpuFB8JH7YZNcY3wtPoKh0YRR+kiGjH4GoUhEpmcX4fSkrzJKlBU7h92IC+0GFKBzwppM9PmgXWIPo0/H7M8iFOMIMHoNUaLIzI8BEQim3OkzWv2Vvn9fP2/iLn1SDCJWl0xg/Ay3dhFPcemtjaVSDdKAyE1vFyvuaQ5PcioyXaRCV0b5uy/Gz96PyIfNBvIfu3W6Ak4i08VYX+4DdK6Y1D1xDKaF5UDQNnGUF6Q0bos/PS0Ezbkz9ILSU7ltpANNknShujyFX7txLJSVSs3cm/lsqMtimLEhHgK5EJ1NfU3y+rJArLWY+Ps9tWxKaiHTRO/TQnD2zJBNjyXkBaBz1TqGHdHQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aec4fdac-b09b-4753-4096-08dda58aa37e
X-MS-Exchange-CrossTenant-AuthSource: IA4PR10MB8374.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 06:15:02.4424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3dpLGxywGFq/dzEHNemNrWAw0WgydhTHT0qf/w8g3O/66CY77T9DF+o3X3Nn6p99PSReQCaLNDyNk77x82jTod53ivpW282xS6WhW1fW6qA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8636
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070044
X-Proofpoint-GUID: 8Z4evuRqTPRZ7A5ISQ7n9sE1qQQQGiSD
X-Authority-Analysis: v=2.4 cv=GcEXnRXL c=1 sm=1 tr=0 ts=6843d8ea b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=mS-42p4pUMml6ifY2LgA:9 cc=ntf awl=host:14714
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA0NCBTYWx0ZWRfX5k9CPISHAl69 m7skjxWJGe0kl0hCBoGfkiULwZt1rhBMtzaTDfacehXJK0h8hhtYfuZBeQGfNr2naxzlQ/INqYA K6neDgTQWHWKits/jIqFtdNR3dldXs+IhRV+GXyZ/gvHmD9Tv4PiKUE75foIfuGxsbBSB5rijxX
 qMKoSumyD4i/gxHZtUD+iTA0NVRkfK+/w/FXwpamQBBYs4AtL+yg78sugW4g1lQAu6YZSeTmDVQ 7wW51vum7Kut3abcDUyjzbGZ5IX9/0cbIN8ECoRB0kE+czMJQQ7IWjD46t21F+ZDbEQCp4yxo5J tsakzRm2hl261qRFL+QunNA+AnJi2jXTFR4AaRjJUKoXQIq8DkTeu3klXOC/VQ8MWJ2GteToNGh
 DvUwtpkwmSMBcGAH2zLx+TWneJXrf/vjjeW6Y9ypqNAfKR+O7XKkBTi9bXwY2ltnFul2advu
X-Proofpoint-ORIG-GUID: 8Z4evuRqTPRZ7A5ISQ7n9sE1qQQQGiSD

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
 libcommon/Build                    |  3 ++-
 {libdtrace => libcommon}/dt_htab.c | 19 +++++++++----------
 {libdtrace => libcommon}/dt_htab.h |  8 +++-----
 libdtrace/Build                    |  1 -
 libdtrace/dt_consume.c             |  4 ++--
 libdtrace/dt_kernel_module.c       |  4 ++--
 libdtrace/dt_module.c              |  2 +-
 libdtrace/dt_open.c                | 10 +++++-----
 libdtrace/dt_probe.c               | 22 +++++++++++-----------
 libdtrace/dt_provider.c            |  4 ++--
 libdtrace/dt_symtab.c              |  2 +-
 11 files changed, 38 insertions(+), 41 deletions(-)
 rename {libdtrace => libcommon}/dt_htab.c (95%)
 rename {libdtrace => libcommon}/dt_htab.h (91%)

diff --git a/libcommon/Build b/libcommon/Build
index f64545ed..6237351f 100644
--- a/libcommon/Build
+++ b/libcommon/Build
@@ -9,7 +9,8 @@ LIBS += libcommon
 libcommon_TARGET = libcommon
 libcommon_DIR := $(current-dir)
 libcommon_CPPFLAGS := -Ilibcommon -Ilibproc -U_FORTIFY_SOURCE
-libcommon_SOURCES = usdt_parser.c usdt_parser_dof.c usdt_parser_host.c dt_list.c
+libcommon_SOURCES = dt_htab.c dt_list.c \
+		    usdt_parser.c usdt_parser_dof.c usdt_parser_host.c
 libcommon_NOCFLAGS := -D_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1 -D_FORTIFY_SOURCE=2 -D_FORTIFY_SOURCE=3 -Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=1 -Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=2 -Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=3
 libcommon_NOCPPFLAGS := -D_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1 -D_FORTIFY_SOURCE=2 -D_FORTIFY_SOURCE=3 -Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=1 -Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=2 -Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=3
 libcommon_LIBSOURCES = libcommon
diff --git a/libdtrace/dt_htab.c b/libcommon/dt_htab.c
similarity index 95%
rename from libdtrace/dt_htab.c
rename to libcommon/dt_htab.c
index 478c728a..43782202 100644
--- a/libdtrace/dt_htab.c
+++ b/libcommon/dt_htab.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2019, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2019, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -28,8 +28,7 @@
 #include <stdio.h>
 #include <stdint.h>
 #include <stdlib.h>
-
-#include "dt_impl.h"
+#include <dt_htab.h>
 
 typedef struct dt_hbucket	dt_hbucket_t;
 struct dt_hbucket {
@@ -66,9 +65,9 @@ struct dt_htab_next {
 /*
  * Create a new (empty) hashtable.
  */
-dt_htab_t *dt_htab_create(dtrace_hdl_t *dtp, dt_htab_ops_t *ops)
+dt_htab_t *dt_htab_create(dt_htab_ops_t *ops)
 {
-	dt_htab_t	*htab = dt_alloc(dtp, sizeof(dt_htab_t));
+	dt_htab_t	*htab = malloc(sizeof(dt_htab_t));
 
 	if (!htab)
 		return NULL;
@@ -79,9 +78,9 @@ dt_htab_t *dt_htab_create(dtrace_hdl_t *dtp, dt_htab_ops_t *ops)
 	htab->nentries = 0;
 	htab->ops = ops;
 
-	htab->tab = dt_calloc(dtp, htab->size, sizeof(dt_hbucket_t *));
+	htab->tab = calloc(htab->size, sizeof(dt_hbucket_t *));
 	if (!htab->tab) {
-		dt_free(dtp, htab);
+		free(htab);
 		return NULL;
 	}
 
@@ -91,7 +90,7 @@ dt_htab_t *dt_htab_create(dtrace_hdl_t *dtp, dt_htab_ops_t *ops)
 /*
  * Destroy a hashtable, deleting all its entries first.
  */
-void dt_htab_destroy(dtrace_hdl_t *dtp, dt_htab_t *htab)
+void dt_htab_destroy(dt_htab_t *htab)
 {
 	size_t		i;
 
@@ -112,8 +111,8 @@ void dt_htab_destroy(dtrace_hdl_t *dtp, dt_htab_t *htab)
 		};
 	}
 
-	dt_free(dtp, htab->tab);
-	dt_free(dtp, htab);
+	free(htab->tab);
+	free(htab);
 }
 
 /*
diff --git a/libdtrace/dt_htab.h b/libcommon/dt_htab.h
similarity index 91%
rename from libdtrace/dt_htab.h
rename to libcommon/dt_htab.h
index d39ae65e..906c91fd 100644
--- a/libdtrace/dt_htab.h
+++ b/libcommon/dt_htab.h
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2019, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2019, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -12,8 +12,6 @@
 extern "C" {
 #endif
 
-struct dtrace_hdl;
-
 typedef uint32_t (*htab_hval_fn)(const void *);
 typedef int (*htab_cmp_fn)(const void *, const void *);
 typedef void *(*htab_add_fn)(void *, void *);
@@ -93,8 +91,8 @@ typedef struct dt_hentry {
 typedef struct dt_htab		dt_htab_t;
 typedef struct dt_htab_next	dt_htab_next_t;
 
-extern dt_htab_t *dt_htab_create(struct dtrace_hdl *dtp, dt_htab_ops_t *ops);
-extern void dt_htab_destroy(struct dtrace_hdl *dtp, dt_htab_t *htab);
+extern dt_htab_t *dt_htab_create(dt_htab_ops_t *ops);
+extern void dt_htab_destroy(dt_htab_t *htab);
 extern int dt_htab_insert(dt_htab_t *htab, void *entry);
 extern void *dt_htab_lookup(const dt_htab_t *htab, const void *entry);
 typedef int dt_htab_ecmp_fn(const void *entry, void *arg);
diff --git a/libdtrace/Build b/libdtrace/Build
index 7e6e8a38..219ff9b3 100644
--- a/libdtrace/Build
+++ b/libdtrace/Build
@@ -28,7 +28,6 @@ libdtrace-build_SOURCES = dt_aggregate.c \
 			  dt_errtags.c \
 			  dt_grammar.c \
 			  dt_handle.c \
-			  dt_htab.c \
 			  dt_ident.c \
 			  dt_lex.c \
 			  dt_link.c \
diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index 9088a90d..b0bf73d1 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -3011,7 +3011,7 @@ dt_consume_proc_exits(dtrace_hdl_t *dtp)
 int
 dt_consume_init(dtrace_hdl_t *dtp)
 {
-	dtp->dt_spec_bufs = dt_htab_create(dtp, &dt_spec_buf_htab_ops);
+	dtp->dt_spec_bufs = dt_htab_create(&dt_spec_buf_htab_ops);
 
 	if (!dtp->dt_spec_bufs)
 		return dt_set_errno(dtp, EDT_NOMEM);
@@ -3028,7 +3028,7 @@ dt_consume_fini(dtrace_hdl_t *dtp)
 		dt_free(dtp, dtsd);
 	}
 
-	dt_htab_destroy(dtp, dtp->dt_spec_bufs);
+	dt_htab_destroy(dtp->dt_spec_bufs);
 }
 
 dtrace_workstatus_t
diff --git a/libdtrace/dt_kernel_module.c b/libdtrace/dt_kernel_module.c
index e21ecc51..baeabeab 100644
--- a/libdtrace/dt_kernel_module.c
+++ b/libdtrace/dt_kernel_module.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2009, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2009, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -75,7 +75,7 @@ dt_kern_path_create(dtrace_hdl_t *dtp, char *name, char *path)
 	dt_kern_path_t tmpl;
 
 	if (!dtp->dt_kernpaths) {
-		dtp->dt_kernpaths = dt_htab_create(dtp, &kernpath_htab_ops);
+		dtp->dt_kernpaths = dt_htab_create(&kernpath_htab_ops);
 
 		if (!dtp->dt_kernpaths)
 			return NULL; /* caller must handle allocation failure */
diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
index d45947d7..b3c8e247 100644
--- a/libdtrace/dt_module.c
+++ b/libdtrace/dt_module.c
@@ -138,7 +138,7 @@ dt_module_create(dtrace_hdl_t *dtp, const char *name)
 	dt_module_t *dmp;
 
 	if (!dtp->dt_mods) {
-		dtp->dt_mods = dt_htab_create(dtp, &dt_module_htab_ops);
+		dtp->dt_mods = dt_htab_create(&dt_module_htab_ops);
 		if (!dtp->dt_mods)
 			return NULL;
 	}
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 0bda3504..01c36a76 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2003, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2003, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -1270,10 +1270,10 @@ dtrace_close(dtrace_hdl_t *dtp)
 		dt_idhash_destroy(dtp->dt_bpfsyms);
 
 
-	dt_htab_destroy(dtp, dtp->dt_kernsyms);
+	dt_htab_destroy(dtp->dt_kernsyms);
 	dtp->dt_kernsyms = NULL;
-	dt_htab_destroy(dtp, dtp->dt_mods);
-	dt_htab_destroy(dtp, dtp->dt_kernpaths);
+	dt_htab_destroy(dtp->dt_mods);
+	dt_htab_destroy(dtp->dt_kernpaths);
 
 	if (dtp->dt_shared_btf != NULL)
 		dt_btf_destroy(dtp, dtp->dt_shared_btf);
@@ -1303,7 +1303,7 @@ dtrace_close(dtrace_hdl_t *dtp)
 	dt_dof_fini(dtp);
 	dt_probe_fini(dtp);
 
-	dt_htab_destroy(dtp, dtp->dt_provs);
+	dt_htab_destroy(dtp->dt_provs);
 
 	for (i = 1; i < dtp->dt_cpp_argc; i++)
 		free(dtp->dt_cpp_argv[i]);
diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
index ccaa3081..28a1133f 100644
--- a/libdtrace/dt_probe.c
+++ b/libdtrace/dt_probe.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -1278,11 +1278,11 @@ dt_probe_dependent_iter(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 void
 dt_probe_init(dtrace_hdl_t *dtp)
 {
-	dtp->dt_byprv = dt_htab_create(dtp, &prv_htab_ops);
-	dtp->dt_bymod = dt_htab_create(dtp, &mod_htab_ops);
-	dtp->dt_byfun = dt_htab_create(dtp, &fun_htab_ops);
-	dtp->dt_byprb = dt_htab_create(dtp, &prb_htab_ops);
-	dtp->dt_byfqn = dt_htab_create(dtp, &fqn_htab_ops);
+	dtp->dt_byprv = dt_htab_create(&prv_htab_ops);
+	dtp->dt_bymod = dt_htab_create(&mod_htab_ops);
+	dtp->dt_byfun = dt_htab_create(&fun_htab_ops);
+	dtp->dt_byprb = dt_htab_create(&prb_htab_ops);
+	dtp->dt_byfqn = dt_htab_create(&fqn_htab_ops);
 
 	dtp->dt_probes = NULL;
 	dtp->dt_probes_sz = 0;
@@ -1315,11 +1315,11 @@ dt_probe_fini(dtrace_hdl_t *dtp)
 		dt_probe_destroy(prp);
 	}
 
-	dt_htab_destroy(dtp, dtp->dt_byprv);
-	dt_htab_destroy(dtp, dtp->dt_bymod);
-	dt_htab_destroy(dtp, dtp->dt_byfun);
-	dt_htab_destroy(dtp, dtp->dt_byprb);
-	dt_htab_destroy(dtp, dtp->dt_byfqn);
+	dt_htab_destroy(dtp->dt_byprv);
+	dt_htab_destroy(dtp->dt_bymod);
+	dt_htab_destroy(dtp->dt_byfun);
+	dt_htab_destroy(dtp->dt_byprb);
+	dt_htab_destroy(dtp->dt_byfqn);
 	dtp->dt_byprv = NULL;
 	dtp->dt_bymod = NULL;
 	dtp->dt_byfun = NULL;
diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
index 06f0b039..0c459aba 100644
--- a/libdtrace/dt_provider.c
+++ b/libdtrace/dt_provider.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -90,7 +90,7 @@ static dt_provider_t *
 dt_provider_insert(dtrace_hdl_t *dtp, dt_provider_t *pvp)
 {
 	if (!dtp->dt_provs) {
-		dtp->dt_provs = dt_htab_create(dtp, &dt_provider_htab_ops);
+		dtp->dt_provs = dt_htab_create(&dt_provider_htab_ops);
 		if (dtp->dt_provs == NULL)
 			return NULL;
 	}
diff --git a/libdtrace/dt_symtab.c b/libdtrace/dt_symtab.c
index 3819c21d..62c458f3 100644
--- a/libdtrace/dt_symtab.c
+++ b/libdtrace/dt_symtab.c
@@ -167,7 +167,7 @@ dt_symtab_create(dtrace_hdl_t *dtp)
 	dt_symtab_t *symtab;
 
 	if (!dtp->dt_kernsyms) {
-		dtp->dt_kernsyms = dt_htab_create(dtp, &dt_symtab_htab_ops);
+		dtp->dt_kernsyms = dt_htab_create(&dt_symtab_htab_ops);
 
 		if (!dtp->dt_kernsyms)
 			return NULL;
-- 
2.45.2

