Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76F41A2C0B
	for <dtrace@lists.linux.dev>; Fri,  3 Oct 2025 03:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759463766; cv=fail; b=rvdpGDXMJyTUZXTYaMPlp0HFy50ck1VLfejqHv8YCMjbGcSVYBEpzXrTaQHp/IB/TjZgjFl3ZwNXNeITUb1B4UcNJaHI4ilsYYMbVUFkGPB4BRa9Q1jKh15rCfQzGia1QFysX1bBp5p/9dbKPjQfbHhBX4VWt6dugJk1Ftpj9Hg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759463766; c=relaxed/simple;
	bh=5uFIZguFG+DCJbBlB7ZMFqsQtV5xDTD0uobcq9nQKQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=luZsVn0zGUhYMflu3nvo1zfrYD6B2OW4zUnsTvS+qlOImHc/AcRfzIZk3T9Xy8Visb7gnGraF+11oz+r/U8+qjkXBouZX36W89VzBMtYpRH7H5nNg8qOP+b8TZjOeR977WvbVoy5cSkfFWsvIB0g/gmLhooG4uMwWQX8ez8XmSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=raWw9jyT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iRpx0Ian; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="raWw9jyT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iRpx0Ian"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592J1nJL015494
	for <dtrace@lists.linux.dev>; Fri, 3 Oct 2025 03:56:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=+4mfebkw6KZofo8Y1t
	c+HvW2qGNtmrNUCWuPw6xPGWk=; b=raWw9jyTWOIfPbP5ulLRvo4S7EmKlow8mL
	QK0aW7w+XI/azdRsPZuIhp2hF0zAHlB4VUWzhOBbrwGPQQBXzsmJAm1GOiVlYNhJ
	AbrgvdGVeg2hU2G7D7JSHuZhSv309Cd+ITup62jwDZrF8Ztz6N6XV1vwRdOJoAMs
	nfCUxXge01CCG4yb5qcfFXK+lnLvQX1JDNNDp/MEyy1XVSC0kwsFdRKOc7PRc5z3
	mp1DSYaxWgl5eI3de2VEGtKEVdA/+/hOHLS/huJTBVB7VlQPaTMcMafG6Bs0UK8c
	kPIDZ4eXH5gY/ej54DmyduzsevGdtvxLPZg6ZKScKVL2iuwjLRUw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49gmabmhn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 03 Oct 2025 03:56:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 592Nqlec003423
	for <dtrace@lists.linux.dev>; Fri, 3 Oct 2025 03:56:02 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012070.outbound.protection.outlook.com [52.101.53.70])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49hw18hrn0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 03 Oct 2025 03:56:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkgPm5f6kZEaL67ePPCHxYwXeaZ8/Nxqve2vjE3JcU2grIMzIgDDclO0fV195amVJ3Y5S1CDSRwIwwm7TKTFqLT1VPSfu2PvrQUdx99Msz99kNqxuOkRQjR9ibCiO5B9KZQE77PumtvdY9aBvoPu3Mnkc0FIsfj5GDkTNGB1BsHovvSOdG2h8TSwGCBnXf8NAJDCP+DiNV5w+r8Z56kGTvvYxBH/2zg3z/EcoYz5Kkaz3XQyDnAZnSqz08iiQocQuEnVquBiOvBmCta2xtmo8iwE5S04yrArpoJUcV1/buAjGCMI86pYsXm2xfXBOvZj07Np1S8PSb+tCQlj8rcRWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4mfebkw6KZofo8Y1tc+HvW2qGNtmrNUCWuPw6xPGWk=;
 b=DVVMu/RcOVnfBRPQYkLShX7s1ZbQpP9a7/z1CxAWasCuRsoNdUUeyP91z9KIBo1jlGKXEUr5QesPdJ3+B7+CXBr4BMlrcXkVAgBkchev02D/69FVrSJlRfWLp0YL03ZqnoJhh0stVmnd0Cv223CBXyq33L/KvEJpad1qmWBl8+Ae/H5DVxmSqgB2kXApPN+vDYAeAItjoAXgglp1TjRSsca3K7+H46+wVvI6jAlb/uXLcEATd2xo+u2gjF+V3WFIT1+eaUExVPE60JI/JAf2wQ97OxiKTXOnMU+vgs5mbZbHDowuLY/lOLDCYvnuR/yt9o/C9rEEjKzUgPjiFjz8CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4mfebkw6KZofo8Y1tc+HvW2qGNtmrNUCWuPw6xPGWk=;
 b=iRpx0IanczimwHNFdOGG+s8FZlaLCrIpQn900Jjznd+gD+m/t2n+Zub8iULsWrH8v+xUabpAwOKZnUj5RtWERxayBEJrW/7D2spua62Hz3fTYXTGD+pmooOoFw6K4uNgKgPPmfVlQAI0nMHGMM/aCfFk4SSpiGgG1vlUZU6IqZE=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS0PR10MB6848.namprd10.prod.outlook.com (2603:10b6:8:11f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 03:55:54 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 03:55:54 +0000
Date: Thu, 2 Oct 2025 23:55:51 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 5/5] test: Remove antiquated special case for aarch64
Message-ID: <aN9JRyb0vC7Cs8k8@oracle.com>
References: <20251001062418.6902-1-eugene.loh@oracle.com>
 <20251001062418.6902-5-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001062418.6902-5-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:208:36e::29) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS0PR10MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d90e68f-0faf-4d05-b9b6-08de0230c018
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yc5k0C7Fml6/gHu0se1vazWvT417gLBzx/pD3tTZJgRjsuYk5o2yw/kSIDfX?=
 =?us-ascii?Q?dphxt9cwPkemIbH4nKmqERsfCciVSyoIqoIMVMj3q/xNkFUrJCf3vgQE5XrX?=
 =?us-ascii?Q?mJ0cXz2c3pr+OR9Y18+NtCGWis/wQyzDo3SQhD/pySPFJDRwyqfjIlaWfDxi?=
 =?us-ascii?Q?8HEgEk2sYF4XIdJ1sDzKXTG/JGXiIzPabl8Y13CTnJTcFuIj9TpckE+wtkli?=
 =?us-ascii?Q?PJ8ia1suPxNG+rJahUh8NTLUWCP1h26G9FhF7EwTWeg+b18sKgRsYNGQeGzr?=
 =?us-ascii?Q?9FBu/+/IXmo9M6q94z8M21Qcq73Yq4kdk9n2GyCd2qmK8xSVcleDsN82RDVx?=
 =?us-ascii?Q?8SvXC/jzUp46FbmeO4WX/m2sCBqG+/Zw+0sV9Z/SWrsttFQfmYsN/VTA6MQS?=
 =?us-ascii?Q?vvCrEqX8abu8l85F8dWauxm4GhomdOanERjU2bba1ZNb6SsSwZ7ur+sWaq2k?=
 =?us-ascii?Q?bcf3YtVrlDOv1SxyTGd7K/RhIJlxMCGx8z9atMQUR4lBxMcT8oogneqAaWoD?=
 =?us-ascii?Q?RRqE6VH7ElYTN4/hzbYvM9ybUxkKrFrhnEnrezeHryrDKUiCfTViJegrFWX8?=
 =?us-ascii?Q?rf15A98sPY7ZbC82+qYXTTcxYwVRdKLKNjoYlTTziB4H+wCX+7OQWf9Bl4Bg?=
 =?us-ascii?Q?oDLefnHrlHVhNoOlg3izVWqV0Ff4NdErvi9PRUT6eimoHtU80c3axEpoXfVe?=
 =?us-ascii?Q?duJzHqI8OgnBVS4ZdRgkUsKjTbJTmenaYh+EDZo4aTkSS4zKfSUuXJggGZKN?=
 =?us-ascii?Q?V5KS2aqGu+YpXdy1ilR51pj8/sHRZKyEG6fHGwq3+p//bkdN/45cMvLpM02I?=
 =?us-ascii?Q?OOg31p4Xj6+H5BI6GpkrRc0k38uleASWTO6fY+FneQlENjffvAssSzRhomVC?=
 =?us-ascii?Q?KIVVOiYyg7ZPmEOnx6D4DVUGMxgTyPO7zuQyilfM+w4fkg8M37NMDmvlHA6H?=
 =?us-ascii?Q?/5HceWAVeTBXJUeWtKhZ9XkjinrpDoyiFu8/DDOG1vKqyDRnktYpKY2AZWvG?=
 =?us-ascii?Q?/RBKu5HYyu3+rNSKpAi3uFLj/YWaYMpgexT/DIpjJM7V3ijh9EzCGUpHfYrw?=
 =?us-ascii?Q?gEUwFMvcf8MzDoQfeoaWaxIqOX5+0PUF0lJbaXQf7LsmJ5AFXj9LXSqgIo4J?=
 =?us-ascii?Q?+IsJJgebZUWx/JXk8bnkAqCfgnGZ6CmU0pkG8ScYbP/gI9voGoKWaHzvclHI?=
 =?us-ascii?Q?z0jNAinqxmJETuNwW7WoB/11ye0F7YD9zPEaTGd1m3bOWCZaa0aOnXSMUfm4?=
 =?us-ascii?Q?x3daPUs+t5CCo+6M/IeMD3aDWUk+oGrWHIgwTlwkBq0qdN+2VbHMhjtRcJWC?=
 =?us-ascii?Q?bCcbHpvSqoNJLvMNxLC/Y3fw9PA28/joM1vLaE9oz7qfgP3oVOJIufJATmDU?=
 =?us-ascii?Q?Iudf1cWx+rcml8dVNdm7yQgcDBBTKUT0FNIcMfoRwkLK9n/8cJlSzpBSSOPN?=
 =?us-ascii?Q?HwtwvJu/VRsclEITwSfgjIrXq4XDRPZ5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8igGUzi5eGH0yJyz1HEd1/Grx7kcnp7eo5noAt9SUsCZ7fGmpT5PkEVkoIzV?=
 =?us-ascii?Q?ZqUlIflPb3pJzXmULNafeYhIkgtrrVueiaJQe4I5DAjwtU4lJ4YdY+ulDvc7?=
 =?us-ascii?Q?stVnOfnszQKCV4MeccxamNSuXDLGCqeVmdPs2DPrcFUn/ZHTLU2+zmY6W6aB?=
 =?us-ascii?Q?WTevNnxWZEQLOHvOtjIBNZjqAIGPdFbKUnDS7ArRKykgFF9Flq9fLBk2rZ1X?=
 =?us-ascii?Q?S5BIi5hyfuNY6P7UNCqyr0ENWzymIzsdbsyl2s7wa+QFfq0VJ5TpVvQv1IRW?=
 =?us-ascii?Q?WkljkR8Euz4/DkSR7FbjdyS6YhFKiz/yw6jbbTcxntT3KbW+TbxO8zNCj3di?=
 =?us-ascii?Q?tYkC6UZKvd5d8dXxHw0Svs2pgnWfhgSoZERd3UAB6dOxF6dqX35WhpH89sup?=
 =?us-ascii?Q?rI1w4RzoRUjKa/hN+9JoKGmc0AVCH6WFqJYmUFbtswJQqm0legShsNG0Pa5h?=
 =?us-ascii?Q?qVqBozGfCFa8bPFLhQDehx8I98ZPxdcGEh73FpLenT5P9al8WumAyfGuxG60?=
 =?us-ascii?Q?iHIml5KuXQe/1vsc/z+FtzjIFKycIgA84PkXlIcQJfyh2nnnyfzcLbzHT7bn?=
 =?us-ascii?Q?6nu3KAOx1foTnf8PHFdT4wrhqsm06uqX9j7HIGXzCjlCwihTO6J16yvKe9DG?=
 =?us-ascii?Q?dwubb4PTtSwM6AtBZFaJT53Cgdw3IihWLr1dhYzH+Q0E2IdbBU4w3qbXxhGV?=
 =?us-ascii?Q?sPofzWvsYfUSuPMOlk8T7VeGECXyPHbuGL5EE9OO5JIAzVuZKIpMc0EuCpPL?=
 =?us-ascii?Q?fc0G+pKJsW9z6a7IDKgqejgN2N03NjnZN1TDmtdm+yHhQd62ptLM/LXDbpUD?=
 =?us-ascii?Q?bQANssNlbgekzvQj31vr4ikPQJu9GXZyhouDUm4l8hKBlKkl5LFINyGN97PA?=
 =?us-ascii?Q?HFHhH78RLo0RqsE4ZjjdTIBxXQ5e9cleZUsP7ElJGvIB2QnrcbIpWQ+bFeVy?=
 =?us-ascii?Q?0xsT34vr9uIK8GvtOc4yHVWuo0uA5clDetbLwYbixWkbQoCGcoHZ6+j1QMu3?=
 =?us-ascii?Q?1F9Mumb+B1yt/JoDH3cMS0U8kEeH8TEUeIOBVqZYzYV6D+4wDbn1W/6xpdsv?=
 =?us-ascii?Q?E95qFbjGR2uKtvM8Mro5MYbJDwVbMMNWXOt9Vmj80AKkUptQloj4sr1+JdpB?=
 =?us-ascii?Q?ahBdTucIVShHOfveu3UTBWG4pp/laZVvuw1fgDctFd8xbnW1M7ZUTPRo+Ugt?=
 =?us-ascii?Q?PnBhGe5Yuh0FNAd8DanLE5NcVEO4wQjplGKuZHWemgwSC3HOUTjKjI2DvU1Y?=
 =?us-ascii?Q?19Sjs6tzk2oWZewx3f9fdqMV2KnYaRLSRGLFu1DWjFuembQqPddhr3ISQ90Y?=
 =?us-ascii?Q?82pbxGAQPQWoEN7lQj2OgVBQEegWt63XMklLdRdfJm483YuUnjA96ruBEk8k?=
 =?us-ascii?Q?nRlb4iDLJSfuoFZSfh0lueH1kPp3HoIQY6r/ztgTgozufijeGWtHMxYS2W/c?=
 =?us-ascii?Q?JINCedU9lqPzep7MSN9TbbT5hyRZcn2bXus8kuPiO3w+AVhx6T57GKPwOuN2?=
 =?us-ascii?Q?zrHWkw4Bo7poImGnwskmwKtTaDJhIe5EmLBztiNU6HPgidDn7UXBuphtz3Ed?=
 =?us-ascii?Q?A9+EJb2PXR4QcZysesoI364gR/cYQUbTL0lA6OsahsSiHBUAaki6AiKzWbTw?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SVb2jnDCIR+CWn4jYef2jdApJTZN68zgF7dNp1akMeGJeZJtknkAw3ynVoEjMWxWz9Nk+rpGxcXMuFcc3p7/2WWyfwuzQAmTr7C4vsA2J+xqaC+vGIhVVwCQCUtBI2kPKDKVPkYAvRYeGAYXr/ZDBbv6T22amt5y4FH1CY6vifrF82V45CSTtiTVKPC26+zPA4DHoW7SPkMu4dOWE3ZNULPNLUEkq7Uv2/difnkD+YPbz26U/uWediS+LO8Fa1QRYCQCS1F4PFHlg8Y3djhzIWjPdVd+FvFka/qiEgL2e68l8br605wWROIvjrO5oGCSBnVoLXQ9WuXD1zMZhRmblcSahywqz1ubHO/ti1gIxPSNDQ8DSTmgG+zy3lL+/RZ1bzXs9YaDnWnpv8y/PI8b40o137cE3d9BGI895kmTstWTWfoTDmrazNeEyQ7NiWgntN85tc0AOXxKus1DP4VGAILeuJAkP4qfg+CgUKQR7/Gmi1nrtzF5lh8741bvujQCWhK4dcDY4IxQLtwvDLF4K7UoP06pYRsZPjHkZtocqPKCnqG/TOD1GV65AyQV1XUwPxI6v0RI/xZXkOEqy5GgjutHgYFvwiI0BMsr5dDMXDQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d90e68f-0faf-4d05-b9b6-08de0230c018
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 03:55:53.9483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMsklIJ7xrjhOrsdKMwcAiISQarpsEbuxiCY+QnqxHnGRXBTO9hhExJMBFhY9KYZsZrBRqR7ZjiQdEYMtygMavE4ta5SCMcyOTHIaLuVsCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6848
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_01,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510030028
X-Authority-Analysis: v=2.4 cv=SI1PlevH c=1 sm=1 tr=0 ts=68df4953 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=I-DpUtO6-EaIasNU9CsA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: dTFtqjhrK1pjSQXnkhjcmztOsyaG_-T_
X-Proofpoint-GUID: dTFtqjhrK1pjSQXnkhjcmztOsyaG_-T_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDE2NSBTYWx0ZWRfXyQf7zl+GW3E7
 ZjVeg5vrifD/FWyRs3K2j93YUWICN8NNTc8M9pMojv4z1Guj59hDGUeiqoDnCyIIVonJ2gmodKL
 2zlNpnGfzw56aO0+rZiRnHzxgp5YO61WZzWpbt/UvKDf4Xf63SJAjDAYMAQYbOKL79fT5RWZV/5
 +5Uxo0QMiLChaymMU/b8b/QRWYGfnncJUJ1ESF3jRrDjkK75m5PBfPxkQim7dKZT7AU9tZxtBm9
 XV7sD9rmyCFmP6w1gl9ZvCyGyNGR1nM/DQsbnUyLsJ4fiEi6ifsFkpSKYNuI2gPa323FBtw1zcZ
 1zF8IwzWYxcBvM8nome1m4PxFkcdypsfvV3TxqdryAdKGk4BPoaJhFtLEYvwHXra4xIvR8tmf+f
 PJdAxBWuljKlEWv98/Xbd1btveosTA==

On Wed, Oct 01, 2025 at 02:24:18AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Also, add some compilation flags while we are at it.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/triggers/Build                         | 1 +
>  test/unittest/ustack/tst.bigstack.aarch64.x | 2 --
>  2 files changed, 1 insertion(+), 2 deletions(-)
>  delete mode 100644 test/unittest/ustack/tst.bigstack.aarch64.x
> 
> diff --git a/test/triggers/Build b/test/triggers/Build
> index d49b996a6..4ff5002a8 100644
> --- a/test/triggers/Build
> +++ b/test/triggers/Build
> @@ -236,6 +236,7 @@ usdt-tst-special_PROV := usdt-tst-special-prov.d
>  # ustack wants no optimization
>  
>  ustack-tst-basic_CFLAGS := -O0 -fno-inline -fno-omit-frame-pointer
> +ustack-tst-bigstack_CFLAGS := -O0 -fno-inline -fno-omit-frame-pointer
>  ustack-tst-bigstack-spin_CFLAGS := -O0 -fno-inline -fno-omit-frame-pointer
>  ustack-tst-spin_CFLAGS := -O0
>  ustack-tst-mtspin_CFLAGS := -O0
> diff --git a/test/unittest/ustack/tst.bigstack.aarch64.x b/test/unittest/ustack/tst.bigstack.aarch64.x
> deleted file mode 100644
> index 735f88c35..000000000
> --- a/test/unittest/ustack/tst.bigstack.aarch64.x
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# On aarch64, we are able to handle ustackdepth beyond 4096 so the expected
> -# BAD_STACK failure will not occur with this test.
> -- 
> 2.47.3
> 
