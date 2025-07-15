Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF1A270EB9
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752575573; cv=fail; b=mrc9OwwYHu7nA0G/7YclKvUbG9u1vzn8HBDMd1BNl0I6ajdIABoExeiEDV4WTnJKur9PC3/8GCZD92upB3WgJN3DhOR3Q4mzUHLbluX5aks6R6WAML3EasCPriuvbE09T0DhtRiOfnQLG64QnzHcjeIFNLIa/UNlLQa/84xF23w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752575573; c=relaxed/simple;
	bh=Ds5DHUtnz6D51X2LuENrzRsztgpVH0kHBVJWbQ2XmxA=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=RCsZ4E/zx/z+9FtWgq2RqleakIdmhqkMQR3uVwEXxyjdJ1rhflLx7QNdSRw/Kgyso2iv4ysG2hPhXVgum4QtrRuGWtruIQmCEjVylAsy/kLSTsiauJ6JKdwrfwW2NrZtkpg6IaQgWXmICTwB+bGAQO+TslvyTgMCBugivfjtDuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SjeTwzi9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MHiNgFIM; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SjeTwzi9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MHiNgFIM"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F9Z6aE008277
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=FvV8TAm4yESRsoZCvt
	NiQH/jOB/q+i1O/f4caSBbt00=; b=SjeTwzi9TdeMVMB/Hr/4hTsoVG/z+1ZA6k
	4tQwkAyzPLDsZ2O7nendhGiSGTd1V7uXVLE4fDEqQl+xUhpZb9c/OafF17f+xpNx
	LKiVMSPfRXlvSNv46IySPJW5IvgxBzNdQ1Bq0gD3YX+w4uJSUFBrugZtQAVtteJz
	/t4ZZGA30BuxKLQeaSM3MuY6Rwr27GTrfTUdnQYAXRdMmgCb6W5X5DM1tnxq+T4B
	JL5Z94SSHn3SvdVJolDxfwQQKhBzul/aDUt9vLejoZN1S8DDqLHdH79mKi9fkTLI
	wgZE+Mmkzv6rCnl41FpAH0lQ4jMq/uUG7g+8yI2fz5Xmlsmxy8xA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uhx7xjmq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:32:50 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56F8frEn012951
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:32:50 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue599ve9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:32:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ef+SzMSKKU9HUBbZjjDlfOB9+p/NtNd+AvgRvkD3PG3xio0KydtlUlV7DWsELAwpFSIWc+JfrXmj+MBxcF6+T6txI2/QQXgtJ9xmd6WqcWaa6GWiJmHN7hVj/isxZl7AZFbnIy9I17YyczVENFGOoTrlxLmrBdfk3QZ3TgIbdnp8iScE24PpaRerIc49l31DHgtLKEcEFuH0EaDdy0M+rbWLXvveEtdyKC4HoKo9dgbVA0PcJ/625vGaxsiKromI5eamW6EZRirD3v7KCBwwVcvaa4QRtsBiK9845SQ6v5G1Hi/R7iPNLIMCeF/qEsZwvMKHP/m79u/7XBigeGoaXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvV8TAm4yESRsoZCvtNiQH/jOB/q+i1O/f4caSBbt00=;
 b=Zqj2KuEDoVe7qGw82TDe3OF99aUVj4o2at5taQimn1/DzpngmPkOIK/XdZiVBMpcjER9GngOP3REnJJ0Ma+3R8VYpiUeyQu9TKq6NGwQNvc8l4zkzTdArZnllD77so7BBgH85ZXFT41JmcBCHys/KfZPjS2+D+Ui3aD+k9qVSWbQdgRj0ZpReu1upjJCzci2Xv14kdzGLLzFpn1usSAwoG5nDH67rQWV1Zx03ARQMuBvwHj3n8of85e2pGVeG1TjAPcIeE51w5fZW8yt8QROFQRLw8ei4seUzn61r4VHteAZN9gd2kT/iPgh+sf3WhPNQNQlLVHDER2oQ3kwMvYf8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvV8TAm4yESRsoZCvtNiQH/jOB/q+i1O/f4caSBbt00=;
 b=MHiNgFIMllAodvr+WsFQ64FX+sQQ+wXajgcBLEcAzGHPy4NUSwtpR8XbsYqLg9n+KJwYoanj1sj7HT6cvfjgCJh+ZE5TP0FdsHX6nA7mLj13VOyWbttczQXXlqm6cFaVJgXIoAAibwiPwRB4MjODmksFJSdhg6RvySq9g99/D5s=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by IA1PR10MB5921.namprd10.prod.outlook.com (2603:10b6:208:3d7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 10:32:45 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8901.021; Tue, 15 Jul 2025
 10:32:45 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>, <dtrace@lists.linux.dev>,
        <dtrace-devel@oss.oracle.com>
Subject: Re: [DTrace-devel] [PATCH 1/4] parser, cg: Implement the return()
 action
References: <SJ0PR10MB5672B1209A91191478708DBEC257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Emacs: ballast for RAM.
Date: Tue, 15 Jul 2025 11:32:42 +0100
In-Reply-To: <SJ0PR10MB5672B1209A91191478708DBEC257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
	(Kris Van Hees via DTrace-devel's message of "Tue, 15 Jul 2025
	01:47:36 -0400")
Message-ID: <87h5zdwxpx.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0397.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::6) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|IA1PR10MB5921:EE_
X-MS-Office365-Filtering-Correlation-Id: ed5e50f6-5571-4f80-59cf-08ddc38aef8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Znkx2idMFHYf9bab85Vs+gjJdzZRltywnbg/2JlQQde4+1HsqSF2WUvioiaU?=
 =?us-ascii?Q?TpTnHlnR3aomuvpoTp2n8oajq6QMriM/rLIqWHUHUk55AVYw+vGSEULzg2Tj?=
 =?us-ascii?Q?savlVSAPMPjh3ZOY59XeespFWPhgqt789oTzKXqng8LR1fgixMcr4F14yRip?=
 =?us-ascii?Q?Vi461IeIkQpk/H9J+S6mdmfine4OO8PeBau09d/dyusAkSsbkn15TMT7FGLT?=
 =?us-ascii?Q?kXE/6OrIPBZECew0EqnsL7n02v4w5ief6NFd1TyN/dClBwcuoIkAccnJO7o7?=
 =?us-ascii?Q?NtQ4xHkjGxollLTJ0Ht+jWFbOTTOM5awY4afem0NzwkI3NrdN3mYv+mCqyL8?=
 =?us-ascii?Q?5tfU7J+2gJ96kNANWE43E9KwpJ1xVoaV2MpiYKzUeMgQKd2hJsxjakiy3hBF?=
 =?us-ascii?Q?LRtZ/X877BdEGnOrQ/PvAcOwW6nNuL3qDxGqVrI8sSBPWvM5pDI5RroykA8J?=
 =?us-ascii?Q?OekLrFagX4W0AES/QimSlggdAYtDaEGKyKrTaZmm7BQUYf5BZwiZvXPyqImk?=
 =?us-ascii?Q?eUrtX2AHuRWLX/85M/WsuWBlvTYzL7WQkMx3fQeR5AfaWVBhiQIo0qvpJOXo?=
 =?us-ascii?Q?HfPT2COd5jBea1Qc7ObcjiAhmVLGfHf9n08PFA9qzLiYE/KU7cb8Uxnc5iee?=
 =?us-ascii?Q?te3va0zkHy+JfVy2UjzQYbcv6mb//szjdcKzWu7oxQNQNzlO4rVfwue/68wo?=
 =?us-ascii?Q?3DfsNZbJjBN9nj+b1wnJ25Ms0xMZ3K8HANazDwTUeiDv5EBWEHXJiB+mkQ+e?=
 =?us-ascii?Q?TyRACnEIL3O+Pz37teQwZhk9dpKqbeNNmvBFIZB2dO7q0saroZQocuEegSDt?=
 =?us-ascii?Q?MGksTNAU3+MGSxBrr+AewSRXUOYC5y5mLLY3DBHJAu0g3wOuacpMb2otPm7E?=
 =?us-ascii?Q?WEw1aVCUxncwXQ0F6fOs6CX8Bt3zy3Dez19PS2yPlba25Ymy2Mj4aEYWvI2p?=
 =?us-ascii?Q?jkwRfFQHVwZhkoaBfvy51Ckfhcn0YGeFgJQCKt0Age3sjF5E0zB1kEC3TCgp?=
 =?us-ascii?Q?OxSO6LI+w+Pyw2lQ1dWosStLW2+Y3T699wzvJfgFt1wel7UA+wOV0wLIusUX?=
 =?us-ascii?Q?lH2iI8gWmsX0YQw2XWHAPpOWZgpPUiy2GlZZx3r9VyZXM1tgIKcaXjjcOABA?=
 =?us-ascii?Q?l0iT8jlb9YvFQqo4jtxHIranObdMWYnW+jIAsRd5b4gDU41N5pdGWOC/iqSh?=
 =?us-ascii?Q?jSQGqo6cxxb2JXEFZgdGWm26SrmqfZ8n/wCDYB2LYoeql83Y1Vh5gTwlhfeN?=
 =?us-ascii?Q?7bi4haVqSuv+YZwPNzKxInExeZwiY1fSHnsRG+wMdG2qfNIhoxEebawFlQfo?=
 =?us-ascii?Q?GQ9AchkKKGwOOsIU75W7UdlbSzoyh9sw4+9W5wBKNxIPtOh9/dGfOu+OQt/8?=
 =?us-ascii?Q?JD17IqDHCdMP/zxIciu6IeHm/xB3m5g5fSdsVlRGYaGGmJmMBD1aMWk2sIBL?=
 =?us-ascii?Q?TPep8N7m5+A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l341/7ZT5ekfNrWtjH1y0QhFTfJJsKIkHuszNHxGZP/zO7F2TRnviM0h4qOo?=
 =?us-ascii?Q?GxzDCJqD+wNUEangyR2ZiDV6Vz5fPpyB3YUfCpjTRlq3kTRHHzbai4hpx1lZ?=
 =?us-ascii?Q?mJAfG2oGVK+XxF+5KdnfhFXb0PogsSEYMFqbvX7sBAaE/XSfBQZFK/PbWxzc?=
 =?us-ascii?Q?Sb7rgyxfAdD7EQriVKoiVax/Ltnby6h98QDi9z5wGIwkmps8wsFYOMnpeDXt?=
 =?us-ascii?Q?FJFsAU5dGbHoT4BBqQ+mHr8EAJi5ONXYS3zpyfB7bQ7654wGpCyh5zK+UQXB?=
 =?us-ascii?Q?p/sCi8PgiUEqgGrDiEH02rszWBQrDx+8kTtWeaRLwRYt+P1ht7ccrqP5dRpS?=
 =?us-ascii?Q?3BNkwtDk/UBDXFxAlt7e8mhvKMj5plXl632lKsk0Cta3RMj6SWTLVptRssXA?=
 =?us-ascii?Q?QX+VL3oC/88njh7+om+S2OqKQAA5olenuTcob4lQAxnQkhs2HkJk2qGGzkGL?=
 =?us-ascii?Q?3zhKg4e5lY1L/hEnjWVzUmlSy7ihe+doVS/h3V2DyqZxBeH23f35G+JVuXQL?=
 =?us-ascii?Q?m95iAY5Mw5VrDI176R3AMImV9nKydaCGB8ZNCoTqQFxkY7RR/cVQ9JLl+WFJ?=
 =?us-ascii?Q?SHFYpiK4Ei1EjDKd4iiW3V1vOe1psVYZ6+4TXjqOaxEfMRW6sOwrzdHVFSWu?=
 =?us-ascii?Q?jNPBdr2NtJOWRIn948Rix4Z0yhCEuPnk+wBqvpy+lkqBUAWiTBvPdMaw9Met?=
 =?us-ascii?Q?LZEJh941MapJ2a8w5/QUrsbwKMjXUu1Wr6MdlR23Sot2IpG2lkDkr45Z+Jzf?=
 =?us-ascii?Q?hK35rbIbuAQfy1DuzBqXgCfdS8KVfYpg+0DdlpD8F5r9s/tdukMVTKlYxYuN?=
 =?us-ascii?Q?HI7Hqd3APYSY9z+ikQXcC1X1vMDXdmRGk88pUATJoBizbPXRpOk1V1iYEM/N?=
 =?us-ascii?Q?fvmT+tDIMVx9e/InCrpPqdxhfskOsUpbn+qQkeluBoPLzEtKHo4GRtudE3Io?=
 =?us-ascii?Q?RxlmpuEkLAJKHq224V/0HDDVSijp+yzDc3Gn1XGBMAmMYEre148zPuxXolpd?=
 =?us-ascii?Q?kx8rsNnI3sWZKp6NjOunKHplOPAJDSG7kyT8fueUOBgcjHDIc6Jds0aUWHvq?=
 =?us-ascii?Q?/HCE6sZiYlrzt/3KpkcxrE8l5SONUG9wZzyHa2HCCU8Nqrx59dEvEc/XdbiL?=
 =?us-ascii?Q?y1bA3Zo4jz5WX9YzMoFfDmNBcCer+bHFaoHM0K4TbxyR3Mqiyi2SsG8Jtpb0?=
 =?us-ascii?Q?vQmApP9+kIXd5ta6BhJPbEwJm1UvCvLaza5EftAEOx8shbHoByr+PSHRW5PU?=
 =?us-ascii?Q?938KEkyIg84+juMydNoTqnjAfTEVT1Ke+i09zjF27n2WeZixpnk4LgoAErYm?=
 =?us-ascii?Q?dWMFPlHtVwgJosndwHfLJ0vxYtKbjVCPpzjhaL3otk+JNhKdMbAHsoN/+71U?=
 =?us-ascii?Q?GAfvuuhk4uQRHyWtWqV3XakzgB5svkXFdHO+2EEsVyM/5010n43lNbROGFF9?=
 =?us-ascii?Q?7P0eyim/ZWaTB3qiFI28XaSdoc6+BRuBmv0k5OVrYdVSD/5LnyPoxX2VQTK2?=
 =?us-ascii?Q?ZmPGH8MFW74zKHYK1IvgXFIhxOks4Wv3F440QtJIeKn05z9C76CGlZ+c8zFo?=
 =?us-ascii?Q?jVMwkjczR3e3MGCla9TQ5TnQiIgLXPDBMS80FYt89sh+1gGXL1vaex7a+SIl?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	i8ZtLleTUTCbxi8g7lG71HZ3JZt2CCmGoBROA8Pof7AaRiErMjQPJ5mwyeSiHwVW9iuLbc239GAjcoO8Q38sYjgpMaL3hYx7gUkcMkNeKsUe9qBPXAhim+hlC1H9cRBlu+xmsTkrEHoozr8n0QhsFbbOsh6neXh5j504QfnYflQwrCX0i9eX1i5e1j5Nm7wpIscBqmH4Iw+1WRx9QkpYerpO54GSSbpOZvaIeQ3ZXeu7YRvS+WCdxDkCJYgoEqjANsiwCXc1kC9IK+mhkGZDw+a9ZKaYEg9qN6Bi+RCZWMcpkNCvZlTvYHajAEYXgTDxPEHVNIVkeqMaaORfsmK8TQUbTW3hYf7B7yk64vMjJjzeXYnpQQv6meGedobcyi0Z/IFgV8kyKILADhRKhxZ8ylN15SMGFFsVdW/6nPeawNk6hQhvsEVNJCQwbphe3lSnaOSIaA5gEmaYCsToII3Jdy9R/+m0skpKTeA50kcAZx6HkYnWRAl1wUHdeSmfFAvl6uxjWVTfbjBGLjLs3ue8/DS+F9D5r+iOi7kTCreGIVQzivyMpetBed++8P54PpyAF4U0PPbFBC9owbLxyX1gRvVbeq9Ohm7xceNwKfy+r4Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5e50f6-5571-4f80-59cf-08ddc38aef8f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 10:32:45.0561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VtC7c6M/yiIOlirJHsnP7OsaTY+Wgm3CvzXg7EIGtqv1LxqJrsNm5kALQKwWDG690ZXKBdAwCbX0vprkw+2pWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5921
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507150095
X-Authority-Analysis: v=2.4 cv=auKyCTZV c=1 sm=1 tr=0 ts=68762e52 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=H6CPojBKvMggHyTq8bcA:9 cc=ntf awl=host:12061
X-Proofpoint-ORIG-GUID: keblEEIwUXGAPgaSc-lCuEBgvR5gMBPd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA5NSBTYWx0ZWRfX31gWF3Gd2A2/ 1wN8Y6MN0gt1jeUthhaavD9IybLwH5F6JXKHvFyi4oW6tPPTUyec5hXSQhtoJrNH6dQsOBLKdLi zpmRK5qRMW+pFX5OrSOATZy1yGFdgHkcURb6IZk2PoRyqxANIeQdDd+RUDs7Xm3wlpKXP5Zp6xt
 I9wQIcry+p2QDXW31b5VziH1ECzGWqgo0BM6jmz5IxSRPAvSmvS10Ys8rW1F0RJ2WEh2pSfj5SS mmWr2Imy/j/SaEqAAbXgLVoxCaIG99U9T6nSbh4kTebyoERs5Vss+gy0XzPr+hIfB3fbW76NCWg mM0FI2KANZBcAboXxIjy/FYjrU81VLUogT6jzgDbP6hJ2u9hslwOqqQz8jp8CCXcIVqzoJ3uBmk
 nPoWc25/ooVIBMlmS16Mu7ayB2l6ykCC2jOTbebEayLBURoJwwSny/aA1Aadsbb2j8VbDusZ
X-Proofpoint-GUID: keblEEIwUXGAPgaSc-lCuEBgvR5gMBPd

On 15 Jul 2025, Kris Van Hees via DTrace-devel outgrape:

> The return(n) action can be used for error injection by forcing a
> given return value for a kernel function.

I am amazed this is even possible! I can see all sorts of uses.

Presumably we need to tell people to turn on CONFIG_BPF_KPROBE_OVERRIDE
somewhere... UEK already has it on, good. Not many functions
covered... I suppose it'll let them trace a *few* functions, and if they
use this they're probably used to hacking in more error-injection points
anyway.

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

modulo the tiny nits below.

> diff --git a/libdtrace/dt_lex.l b/libdtrace/dt_lex.l
> index cc165c1e..bdcca415 100644
> --- a/libdtrace/dt_lex.l
> +++ b/libdtrace/dt_lex.l
> @@ -104,7 +104,6 @@ if (yypcb->pcb_token != 0) {
>  <S0>provider	return DT_KEY_PROVIDER;
>  <S0>register	return DT_KEY_REGISTER;
>  <S0>restrict	return DT_KEY_RESTRICT;
> -<S0>return	return DT_KEY_RETURN;
>  <S0>self	return DT_KEY_SELF;
>  <S0>short	return DT_KEY_SHORT;
>  <S0>signed	return DT_KEY_SIGNED;

I guess these are here for C/C++ header parsing :) a somewhat hopeful
approach. I wonder if this change will cause breakage for non-bracketed
returns in C code in static inlines... and returns of non-integral
types, and just plain return... ugh. I suppose inlines barely work
anyway and the right way to do that is to simply have the parser ignore
static inlines in C headers anyway, not have it try to parse them :)

> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index c67455e7..08394a11 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -269,6 +269,8 @@ static const dt_ident_t _dtrace_globals[] = {
>  	&dt_idops_func, "void(int)" },
>  { "rand", DT_IDENT_FUNC, 0, DIF_SUBR_RAND, DT_ATTR_STABCMN, DT_VERS_1_0,
>  	&dt_idops_func, "int()" },
> +{ "return", DT_IDENT_ACTFUNC, 0, DT_ACT_RETURN, DT_ATTR_STABCMN, DT_VERS_2_0,
> +	&dt_idops_func, "void(int)" },

The "problem" (if this actually is a problem) is that this is not the C
prototype, which is not expressible in C :(

> diff --git a/test/unittest/actions/return/err.D_PROTO_LEN.missing_arg.d b/test/unittest/actions/return/err.D_PROTO_LEN.missing_arg.d
> new file mode 100644
> index 00000000..97ed0762
> --- /dev/null
> +++ b/test/unittest/actions/return/err.D_PROTO_LEN.missing_arg.d
> @@ -0,0 +1,20 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: The return() action takes exactly one argument.
> + *
> + * SECTION: Actions and Subroutines/return()
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	return();
> +	exit(0);
> +}

You might want to try a straight 'return;' as well :)

> diff --git a/test/unittest/actions/return/err.D_PROTO_LEN.too_many_args.r b/test/unittest/actions/return/err.D_PROTO_LEN.too_many_args.r
> new file mode 100644
> index 00000000..37ff4d9d
> --- /dev/null
> +++ b/test/unittest/actions/return/err.D_PROTO_LEN.too_many_args.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/actions/return/err.D_PROTO_LEN.too_many_args.d: [D_PROTO_LEN] line 18: return( ) prototype mismatch: 2 args passed, 1 expected
> diff --git a/test/unittest/actions/return/err.destructive.d b/test/unittest/actions/return/err.destructive.d
> new file mode 100644
> index 00000000..4c4a246a
> --- /dev/null
> +++ b/test/unittest/actions/return/err.destructive.d
> @@ -0,0 +1,26 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: return() is allowed when destructive execution is allowed

return() is forbidden when destructive execution is not allowed.
