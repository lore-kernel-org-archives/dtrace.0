Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310B62FFDFA
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 15:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769528337; cv=fail; b=ONlHKYVDbjvgEpDZXBxT5BscsFBzd578rg2LcOmqOXp570GNNMXCR2l9+x8PKOw0fYfVEEDCCnoHIftsqGP6N7gPzo4bG9P582n9JDwsdgUcVT3mlonvyfXXMwB1w4TKtJYRL3u/FlCApFfqeqZ9jw98RwRfFYsu3DjnaZhBKkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769528337; c=relaxed/simple;
	bh=7QmgfAFQN0DD9m73nsDApUJNcHzvD6FzBHq+9a9FWt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VLKtApCrbp1anGXhYXMSsKUrYbKa9pb+j9PFlwWPufB1eVNKsMVY4xwDOKXNJdF74QLi+OkdVAvWc6jmzglwr36S0JhiwjvM8/4xe+IB+nPhFX/2cRKipWfXjYkOJqm2WWmzAJN7WiDe/CHOW5gEmDiw+RTRmCrSXlx+5Q3Zipk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=H8EAIgNz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ULZZxtlc; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="H8EAIgNz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ULZZxtlc"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RBELof4055927
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 15:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=SGI71nblvbSLBHZvvt
	A6YdCglR2xrm5TrET95QW74Lc=; b=H8EAIgNzCZuOKvZg56Th7UuMKvlF0kfe1f
	V1qpUvmbP95aMDdPnu/wf2pUznIUeMEmzNUp0R9TRJEUbHiKdBb9FvcBUcwkLXav
	KZMYPkZioL+kR1BfYJVJeQGE1fUq618OilqEXITghu8Beod0ts6ogGn9pSIRl8PN
	ePAK9Sh4x/W5ZKNRpEGXanQGhhSfBTHGFy3sEveRy5swtFomKt4DDtCigmsbmqGj
	3JP+zCmLcvqbv42MKMLIfXvzpSn1cYkGBMVRKumDefIN4zGQ0QpoHHQGV5bE4xzc
	uXJoV74vwwP9YlkUuVcdFrSQ2B9K9jdg6w1Ai8ZVuqWDQI/GWjyA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bvnpsc7a4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 15:38:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60REWnwp019819
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 15:38:54 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011063.outbound.protection.outlook.com [52.101.52.63])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmhevatr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 15:38:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oY+knR5CXBA7CGP0gdy1YSfSP7nSH7r0EL5mnfQR5gBVyL+yXQO7a2frBz8JiKMv9BdztrB88UINpUX6clhlpas/tRr5RFHDM5pzXNDePUH8KIFLNgjwFTK7uNW/oxccTBpSFkSPRPUHSMIQGoVB+h0G6TG7T6DiGQ5hU6XvFAxwoKo9U/d/D9/6WW4D5MBqdJghNEZvuS1edSiUM0xTUpIQAqw3fsthPEzDe7VUsdpYi/p1xCq0oaAR91xmkTIwSuQOiE2UOQyYb01pgN+VYAn0NS5J2D9j1e1iys0Kx3LhVrV8tPVB/Gk55XmzxtiddRh0hwCBmBRGF67ZGV1iCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGI71nblvbSLBHZvvtA6YdCglR2xrm5TrET95QW74Lc=;
 b=kmTHdjS8wTmawoB0Z0q3BN9epGGtGImEk5sHwO/in2fWcOS2czZ8eiHBacv+t8PdXqSIQYGnoHps7krs5H8JwaNW/3G7VemtFYkg6PgkdOehTspSiWVgG8R7yUCKtlUsZpFX0LDRRTC+Y22mxLHxKx63723ckSSHzjZ4rIv2x5g23aDVnCLs+foapSww37DVPVTArY9V2Pu7P9NYY8yveVVGfvtw1m2nGJqQHbSfYX62D7581+uWl2xxwt1PbJsi2MoQdltlCiv0bWTFHEJdQyYFZxXN31+l0YMah++hcezNyYNiQJO8M14N2ne1Q7e6RsbdZWjwyVicHW4QbA2Jdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGI71nblvbSLBHZvvtA6YdCglR2xrm5TrET95QW74Lc=;
 b=ULZZxtlcxoSA5pxxmSvgGzmCipQyH59trjT/OVLBgvAACEW3Jx2M+kmdUgIJu2BRK4F3CYy0pTGAsBdcM8JNHAKOQe4ba1W+ZFcQEz2kZALzz3Jl/Hl0YMf1tgWBnxcVVuG38zZVmixFRBaIG8vWWN+5x5MB5dlVfRghTYyFi6E=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by BY5PR10MB4194.namprd10.prod.outlook.com (2603:10b6:a03:20f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 27 Jan
 2026 15:38:51 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9564.006; Tue, 27 Jan 2026
 15:38:51 +0000
Date: Tue, 27 Jan 2026 10:38:48 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: Re: [PATCH] spec: testsuite: weakly pull in kernel-uek-tools to get
 perf
Message-ID: <aXjcCMpI5jqB7Kov@kvh-deb-bpf.us.oracle.com>
References: <20260120164926.198356-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120164926.198356-1-nick.alcock@oracle.com>
X-ClientProxiedBy: SJ0PR13CA0207.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::32) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|BY5PR10MB4194:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ba86327-1890-4fcf-d111-08de5dba2ba4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oQiKQItq6ehQ1GtIlOk/+T+8O0VofZdEXTQlLQuLjiOpdOzA1GUHs+/sav93?=
 =?us-ascii?Q?xegcKllUNWFUPr6EPPxUhqLhGzquzE1Kj7SacJWDmLlwp+V4DGhtiynjgjXT?=
 =?us-ascii?Q?KLH+Hu0zWzpWrxfivndpfjNODklQYRpkTO6aKptievyuauW4FZwuyFBZaiMX?=
 =?us-ascii?Q?NhELi3M6wNvdVOUwbk1vuvbhAs+Mi4KqK2940YA2MN9skiq4XUPoQufX9NHw?=
 =?us-ascii?Q?8J800A12yvj2vBiFVikpco21VCAIA5PWhUmWH4kfsjPQlpiFE4LyVZmN9QZM?=
 =?us-ascii?Q?yJBQncDLIDJz7/qIKx1zrpiuN538WbCQvpAeFOq0Q51rDH5t5tQq0NJbGGTN?=
 =?us-ascii?Q?/ff8RAh59RlAv1SQAcMGJ3XfNwIWE263MqhGPX4bTE8Ruyzdiwd8ZjWc4GYz?=
 =?us-ascii?Q?a+a41CxoLcuS6LUmei0ckgA/LeAauMWjw/PzqGSC4kplGrRSQTI5X7oPvUPA?=
 =?us-ascii?Q?lPh5oGejnaRSAot+RN1qkpvx5Z2eOoQjYOp1u827nEq/cx3Utg2b0IMTLGng?=
 =?us-ascii?Q?JQ/ZNpUsCfNHwTc1cMvZ/JGw+jLH7zoIsy93ZBhedxx21myQfWbWRc9FBMAX?=
 =?us-ascii?Q?pvA4dH5YX6j/nf+FgDelo/+2jvsY2+ZmyeaNTA9jK8VKxwW7Z9y4pEQMP94T?=
 =?us-ascii?Q?Wjyqftqp17GIjdfA7xLHqJheDhBVvVR6WEmzRKx/835XhwLQ0zRAKKrUA2fP?=
 =?us-ascii?Q?Tu2Q2xTm767P/lcynYtLz1UgOejLeDIcoAn6z73IEomB54rSG5zOsDKSxcRu?=
 =?us-ascii?Q?Whrkw90dQROl0VaJFuQhrruzlfhSj6mVp2Z6E6XX57TXxbFETRmBZcDhQJY5?=
 =?us-ascii?Q?KjY1xTK4d/OotqKv6HsrKHRHwvw4CJx2+rv/+aAbqIweTSRY9u4imROa1+6y?=
 =?us-ascii?Q?BXHGzxCKPidrqD0nPO8eXlqkHrYEZIdjplyi/jK5eOLGuGLxuWSOQ5LQnbG4?=
 =?us-ascii?Q?B1xZJt/Ph9WPuSkVND3vZ7jw7WW9OjC7Y5EiS5uvPSV0ZVcEwc/5OENh5kGK?=
 =?us-ascii?Q?BPVePF14fk8cwOl5baVDZpSWU9EmZy14aSPvRe4Wghhy16KgxwETNuq03lhF?=
 =?us-ascii?Q?VBeIIHwApoY6FP33U9aFy6GMBW26Y77vrVjEo5+iJwxKYn98VDHMNiOtaBDn?=
 =?us-ascii?Q?4CZOCgyrwly403qmiVMHKYtoXp2MBRJXl30NaEAw+1jNOmGRfzFpEK8DpqCz?=
 =?us-ascii?Q?S7jR9+cJfO/yAY5/OzB67sWTmgGF4/OHPNSriuzic458TcjYG98c1LmLznDe?=
 =?us-ascii?Q?I6MrpHgWAliHzT9MR2fSxLfTFvuGxQYzLoNAlzU7UwfDsAZ/YHzOdmqWF0tQ?=
 =?us-ascii?Q?PhxGJGFxMZDzHWb++9EYddwjw8OyvUxOVvroarymUh4J5iNn39/PyZyb+IpH?=
 =?us-ascii?Q?hME0E7VnkEFaFn3A/7bYVJ+e3L1xB+WJsHW0T2riv5M1LGGbMMR71Nk9gFR/?=
 =?us-ascii?Q?Da1pz5oGPQmFsvoqEt/G8Wq6WQCswOEfelYhBE1SMdWNyjwZ6+v4bIqX9jWM?=
 =?us-ascii?Q?aek3Txov8UnGjW6GHgpp9ON7buDlk1++buOjo4eclI/DWTv/rALW5rmVIYbD?=
 =?us-ascii?Q?nALpIZjyTiMkrG7iviA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N+VhwZOUAfNvU23o8AKbh9J5YBrRBeLFP0s9UhBrJMb98Wn3KGI8u4yvoACI?=
 =?us-ascii?Q?6j5E2YdOZk5Egt4BHFj5wgKUahFtU7zoKww69uwMDXyfe3PAqbuY5BoyltlD?=
 =?us-ascii?Q?hv+bI1fw0v13CSLw20AAQcwuPFXzGdPzuOUZVTc5srCWw8/zg9VRt7WeSrkt?=
 =?us-ascii?Q?CHOMa0w1YwO11M62tm+14O/M50wPBHZDpgbJqwSejV8dzUxI8l+tlcz8Kitj?=
 =?us-ascii?Q?2AbiQ2dR8xz145X8llBiQWhDNHtm3Mo1883788UVmwgrDZdYEnHtvWz5fiR3?=
 =?us-ascii?Q?yKNwk5JEjf6YoGxT8uV9tS5n142f8fgNVGKT/6dHM+h7QOwl+dfaFZ2vNU/e?=
 =?us-ascii?Q?+TaOpq2WWqXlZrp29UruP4YaRMT2dnkr8+sHU75eqFetcll0LwS68sCKR7Ls?=
 =?us-ascii?Q?PCAxABLTMqBqZQT+ZLjX9JHrvqlRm18DpfJjSF7e0t7dafuVMcaIJ5A36Xl8?=
 =?us-ascii?Q?847l0bU9w5IKqzEr/zP2Ullkpvlh5spxq9ckLCo3DLNlo9ukjadE7iNshoXS?=
 =?us-ascii?Q?Wibvw9UX59sMTD6qxx3vhUq7iEq/SeHroEKvJzpzGb/QnruOXfHaaRJlKMqV?=
 =?us-ascii?Q?OSm1uzgB2GSWthGwji7nFa5PD5K4h4ug7GIHLCGXbDBWy6//17ozxMImNiEa?=
 =?us-ascii?Q?mc+z+eh6tlQItneUYv7IgSimPBcJzy4Bi4F77ULp1fiQg1I5rkKXcvC2Y0J4?=
 =?us-ascii?Q?eBF/dUwhesTt/MyyAzZpVlwx4gZL97c7j6a3glfjOj1RiUFzVrd1XB7MRe0N?=
 =?us-ascii?Q?tDz3XpH09qnSRtLMaBVYrt9UEEbVRgIZw8ER4OWQRgZdTkd9KiFH8NlTtGNZ?=
 =?us-ascii?Q?bFJdqP7cN5DqBqqBPg6puDQ+u9nFt5PhaZPYUDk+0UXnf420gcowKaLHxZl9?=
 =?us-ascii?Q?NDToy3H5QN1K4VxYACDoIm5xSVFo2uVi3eTLoPOWKECSCzJtpfPN1qOPHTXw?=
 =?us-ascii?Q?x7kdFySkP66b8/9rXqS+BYVwHJmel16W1U0+OXfoV5E1dU42oFgcHFciRgZa?=
 =?us-ascii?Q?Qtljtmu9kNJZJJf2PoVCTLi6moYQuwwhEf1hRsNS9/FZJ3ZBO5qTOrxF7IBf?=
 =?us-ascii?Q?vXOxGhuam6xZz2qVlShuYtxeog/FK4sQZs/JtSVzUTbsvPv02AphtJ5gANZ6?=
 =?us-ascii?Q?GhCmonBfrHRAmABxcCIGnkpan4QCezdIHXZYfWDXuVgmxlq78Ebf/3uL1E8+?=
 =?us-ascii?Q?0UJxAMM2Ch3eTTh6e82lGiZ6CnJ25cTovjov3lQRSNz1NlIAQwoU1HwVg+rN?=
 =?us-ascii?Q?d2kixurU2QnOajrYeffOk/ovV3lA2sQdjBJV10D6lXbejNrZfoKTIytAZQ/r?=
 =?us-ascii?Q?i73ukUiox/Lgr1jl4UJBoKIwwQp69YgjaUJy1ZyBbMflOENHBucRWhBMlajl?=
 =?us-ascii?Q?p1Tq1+eLw+CERoS+gIDCwClbHIFVXXIZXH57HBZkKslHa/HtkG4/RxNgAa+l?=
 =?us-ascii?Q?XljWwNNIfboydLmnfpK8tcPb5FogyxDIgmpohQEkwQ7DunJS3z3+D0pssL33?=
 =?us-ascii?Q?dM8GffCimumNqWyF0GkoNhPLxlO6j4TnMB2ccY/7ADDxMvmybRIOaEdJg6Tq?=
 =?us-ascii?Q?u6aOnneUKXfER7glX2xnvXh1bvtqTj6FwmGjMnae3H6pj3ON6ljbUCxMjJrU?=
 =?us-ascii?Q?vxnUhe17xD2rxgez3UKS/9cG0xrw3hQYC8D/Iel/FA+dED72Tn0V67LO5Rsf?=
 =?us-ascii?Q?yng55Xjwq1+MqEUeZCAwy+JTtsIpb5b176ISeAKOYrOxWViFO2fUHJR06uuP?=
 =?us-ascii?Q?Jt6Nza6jFrS1qaxkEiNMXBUQABCcQds=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/Q9DjuMR6YKvVT6A6otM6pkUkKo4VCON15k0hBo1VMW6jqDwsU8wZTtYXgklCL+76yujjhymzAZgPHau3Ji6vfTCXRqZLkm0bud/pS3cxzqE9FA+MtpEgjZak7JGdzqXUrZxWLkVF8DmJXTsdq35I9ogTsEF5Jir4GwHHIJu5RGLTV+mM28697Q5YNSdS0ejvYXHMdBttiKNFgSPD1CW74IUxQfAZF1bB5aDiLTwUXpyiqVt8Q3+Ej5+IsA0D9+OUPOEVEsxrZgt77xU9sK7HBnF0v0HyWvLbwoGpB23IzkoRWW70SfArYukYTcFFl5XQxX+ecXGqw6yXvkzggtCcENYdTWYQqrT+IyWGpFIT09k/+qwOAp6LzHMlE0YwJlGJS2TO6qbd/tjEOOVwFT19gyB6fU9eNG7NLXoZkLfKGM4ujxM87piAojPfjKNmavbQcv7AOi+KXsKIt6X58iInoKwM6p0tIPy1YEVtN6aWTrIV//sLTICpq8UkRaFXiS7zuAqdT8inWmt5TmXhOJ1TTt9ed3bbkZrn4YRogXFaBpG4pR5q4g1L2WjfgqkxQtP151fPhETtnOVGEth3g99nqzy7VsQSEZ8mjlUg5OmKqM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba86327-1890-4fcf-d111-08de5dba2ba4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 15:38:51.2342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4MD/Gmm+bGZXmkGubuh0No7CHDOmK6DvarCacFkkCr9M1ksV0/fku9i9ctSL1BfjW7GkhLCpoq0kkogKkQbzbkG9vuz1zvWWhg4P4L7ZOrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4194
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601270127
X-Authority-Analysis: v=2.4 cv=dY2NHHXe c=1 sm=1 tr=0 ts=6978dc0e b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=CxbW1aaLLuauRLwGJR8A:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:12103
X-Proofpoint-GUID: ErhI68aUeCTY8JwUd6YJwq48EMYY6iAs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyOCBTYWx0ZWRfX2qh7p50y158u
 EzCu1W6pl4y/ufZpupIUcIa8Z4RMcPlf+HruGVoHl2o/tLHOTGr/gk87y+3XSybFHxsnXdYaMKY
 wZ6ptX1nCbBOKW5ZnD9u7XWANaGCUBMt5sMq49mg/HnkhtVJILqT/HNzvCg2a23YcJHIz7zM4Pn
 vs7od5pGb/d1CcSupgxhZ7XJnDT3M78Cf9mm6dySrkpjAHl5qe4q+j7yojGPCyrRxh0Hp1XFMP3
 zvLWd3Fyyf1kMkLrfYy2z/2VXwvEhG/QKrsjBOIwBhQFbPhT0y1pCJ/h1yfodsxPFINI0LAHM3K
 v4UgujjWX7kX082v4tnfcazEIf762XtrRflg1KW1FOXaZZxKpiqMnp52tYLMn/+MedasdjeesxU
 mg0hcDiBoIsZwHU0Db406sUu8MMErC42Tlj3vuznifpZqnLJrIMrJnh9KwJlso94u1aZ8tZVIyK
 CoL9KGNHlPnn5HACnqlEULbN7LMoZgpWejv4c0AE=
X-Proofpoint-ORIG-GUID: ErhI68aUeCTY8JwUd6YJwq48EMYY6iAs

Horrible that we need to do it this way, but anyway...

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>


On Tue, Jan 20, 2026 at 04:49:26PM +0000, Nick Alcock wrote:
> This prevents yum/dnf from pulling in the first kernel it finds, which
> is often entirely wrong.
> 
> (This is obviously only applicable to OL and no other distro.)
> 
> Orabug: 38064413
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>  dtrace.spec | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/dtrace.spec b/dtrace.spec
> index 4b20dc4088595..9fb9f1f8f30dd 100644
> --- a/dtrace.spec
> +++ b/dtrace.spec
> @@ -115,7 +115,8 @@ Requires:     %{name}-devel = %{version}-%{release} perl gcc java
>  Requires:     java-devel perl-IO-Socket-IP perl-Net-Ping xfsprogs
>  Requires:     exportfs vim-minimal %{name}%{?_isa} = %{version}-%{release}
>  Requires:     coreutils wireshark %{glibc32}
> -Requires:     perf time bc nfs-utils
> +Requires:     time bc nfs-utils
> +Suggests:     kernel-uek-tools
>  Autoreq:      0
>  Group:	      Development/System
>  
> 
> base-commit: 6e94c7d0a253806f85c39ff5f4e32a800d4cb6b6
> prerequisite-patch-id: 531b3b91cb7c41bb13c03b50038a80e76bd7b093
> -- 
> 2.52.0.285.g44a719c714.dirty
> 
