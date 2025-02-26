Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAE921E082
	for <dtrace@lists.linux.dev>; Wed, 26 Feb 2025 16:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740588927; cv=fail; b=SDFUvgAF9m9orz9L97HV9aH8QXnFw20bbebL6ZwFSPWiapvfD/3F7/9ivER0cQ545g3rXdi7xCN5evBW+G2PaU6aNPC+mIiCu47q8q6gkwsii+Q9WfHX9/ktcKchLsDzp9gjpiF4h9oM1J9OGKa363CxdJ13W4DfXODwC4utPmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740588927; c=relaxed/simple;
	bh=787FUOipbrZcwO0iAvqYgocO2+uRSACM5wXJRaqCWjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EN7s9y/QG6PRXOErn/TMPMGIPoczsW9Oe7Av5DfUMXm6m2XEyUzcTuUg72pijQE9StjjyK+U6XHkYLygKYPwJrYbOA2RX4GlW9qPKNr7nAeZOXHeFTxBAit18fRaDgI6WqEYYhZmL0iKgbtiMf9qY/IybIKm+ivBNkj5jXcK3/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=asSoDf3V; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VtO1RuAJ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="asSoDf3V";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VtO1RuAJ"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QEten6009882
	for <dtrace@lists.linux.dev>; Wed, 26 Feb 2025 16:55:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=drUoYFyZmisoZVcAPX
	wi36GkYwPQ+JqxAZWdHzTkHuQ=; b=asSoDf3VPCMd4Orw1SafyB77oN24Hl18JT
	bfEZLgyA782mB+fD5OYPp0x9+VRTUWsplhYkN8G9vJbwqdHO3xOH0zgIflRndu+/
	gOhzss5+XjUvUZFirny6o6bOd6x0aMZfr+g1YSvFMAF9Ja/sfTkpZ0PdQI7OS6HJ
	q4njDqmcdbztENtA0gwi9iPfAC2gDUagBtVvBYeQZH6Pbo1FrCY2OmKyRsYyPlHJ
	rmuzJYnAHH4KjJ4Yi5Cfyo8S9GiCPa6y1PR1oLvZ/vt46kWTu0Y1VkdFe389b40G
	NlG5T6uOhH3eNVtve2baoGLUoCnisD3dz0fUt6SzeChfDGDrUTcg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 451psdhnkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 26 Feb 2025 16:55:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51QFPJbO002881
	for <dtrace@lists.linux.dev>; Wed, 26 Feb 2025 16:55:23 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44y51b5u7s-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 26 Feb 2025 16:55:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTFjdeFpKIG7/E332lQcwZyJXZnJqie/kpAhZE4ip1JO3BimpETzt68qdQdeAzSuQ4vBjfbPadobtvw3XbaGzAk8QOK4MYsjscKAHZVlkalmqZVTTQMvYfC5/rjmKsSjZREPdDSiCBVy8bfDllEqMZ/PogIWD5MDu3n9VZp2JgZHxD+6exr6TMHoDnE3/+6VaRrXveeTB624+4hWlykTNZR6xc3pCf6cMvwiN/Z5tiBhQE/KHObTY6/4PtaFrAM6HA9PXgORoHTXSF/NomZxsYifDmUn72nNcyyBbz/myWX1Lmsqpc4rUEbn6e766W8dkyZk3iAmEh+ndKEtEoReMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=drUoYFyZmisoZVcAPXwi36GkYwPQ+JqxAZWdHzTkHuQ=;
 b=HD3u593FySBKnObsIWqHcctYeMrlnezLw1VuzFSZmY2s3blce7w1bRtFSGFn3siumV8XJ8pHkrZ/6pEYHIPMaxWKHp8UstcxOEy59+AxGbVLp9gVnVCoD79N9GANoowjBQ+Bkb0JAFEWkBZN+cXTWTMwQpoqPL9ACsl5PPdMKnOeNJ2ji/xIt+NrjCI5NS9q96zzlpz2Mv1TOjl8rk7Mnej5oVSt9Ew8Oo/mL18ZY9u/5nKXXBn40fAhmeipOMgXydY4JYnizv4oEJEFZvSY+X+FdE62YDCU1EF3ZBPj28wFwNHoarr9YWjs0DbLvv9M+Wk/LjJaWJmIEp+exb+vYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drUoYFyZmisoZVcAPXwi36GkYwPQ+JqxAZWdHzTkHuQ=;
 b=VtO1RuAJEEAZI9j4purTDuLlASA71G/D8sAagw8KGO9Xf18JuaYArPm3RyRu7CCbc0Pr04SBnqXlzVYSGkSMyhVV5JhbgocmkDXJoq62wQxPF11D9vQgpEgmJb7m6ZyZAhvGUMe5wNLTIzMIUD7t43mREEoT4PVnzqkFi3nyxWU=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SA2PR10MB4585.namprd10.prod.outlook.com (2603:10b6:806:11c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 16:55:20 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 16:55:20 +0000
Date: Wed, 26 Feb 2025 11:55:18 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Convert some indenting spaces into tabs
Message-ID: <Z79Hdo7S5zYQvbpc@oracle.com>
References: <20250114233820.5501-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114233820.5501-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:208:36e::21) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SA2PR10MB4585:EE_
X-MS-Office365-Filtering-Correlation-Id: b0ea05d2-b8b8-4226-e829-08dd56865adc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1AMsWTD8L52EXrAm/72B4nNDEiBZBSOgTs/4JrO8fJfNThqYXVeY5EzfubWE?=
 =?us-ascii?Q?qg6vo8btCbFXyKna+0041vB5L7Qv4hvSLyWmipD9xlSTeI9TLoDqjbxdoUf8?=
 =?us-ascii?Q?/30BLJPvGc7WhdjMMSk+k117fXyc5NLdOTJ0gBpw50nchaD03CvTVUPVNBNA?=
 =?us-ascii?Q?bUJDBxLiqggZmeuS8SU2pBlAuVUv+evPjYywtfiBGLXnIgyiBFJUYN5WvSO5?=
 =?us-ascii?Q?dyOvBjAEtRfGT4jwX+/ukvorKlfGke+6LzR029Uy3CYhAHwFJKnIAKUOwrBQ?=
 =?us-ascii?Q?nTbTX86UZHyzIg3Gdicb/9OtFoiDnJlTANEm1dKUAyRAhDiKWrwYef0Y4D95?=
 =?us-ascii?Q?pD+v5Io0pXZUKPWYn4WvTU9LzRvJk56TCUe42qduazkwRA3kC/RA/bUUAs/O?=
 =?us-ascii?Q?BDFwRld11eWEc2Uf2/eRJ19Y71GzYwuQrwP8c5ZKyfwxubJ25iBqqELr84rY?=
 =?us-ascii?Q?3+QZrYBMAMoww53umkn4dXUlKnCcuYohcLfEXtV4V/sDWRaey74VIC38vVLP?=
 =?us-ascii?Q?5ScbhKHaf2QdHwmzxYYaB7YhSakMUw9JIyIrYE6dDKrk+t3l/y+46+nT9Xj5?=
 =?us-ascii?Q?16novuRVxICRbYWUn9nMDoYzlhWhL36fUbJrvXpYTVMtXQw3ThV6Ryv8x2+7?=
 =?us-ascii?Q?dLKO8TX3kRFFO/Sqmzq1brJl3F3rTv4s6sJMwB44BlBXl+l2RN6hQW8EjQBZ?=
 =?us-ascii?Q?5OsaTfmjXhYd6yIFIwoa9I070gxvIfRQGppMTb6/C98eQcBfaCnRGPoBiSMj?=
 =?us-ascii?Q?1CvdcAQNqJEae8n9ethKo87DD2TPJkSAsiDIe5AkHpTAWdMgdpHyHvPvW6j2?=
 =?us-ascii?Q?+P0QYbIBxligwzw6KJHjPoXoFg2bgzBofbbIPVedZxd4r4eVbd6tijV8gjJ/?=
 =?us-ascii?Q?Yn+vCsb9y5DIPiEGbP6T6/HfWUcZvwd9Oif9hHaW7e1t9jHBC/iTV8X7V7rs?=
 =?us-ascii?Q?JVKDM7PL9r9N3kxulWDyb6IknDd6J/Qa88gPQQL3U/z6ssrh7q5l6shnXAls?=
 =?us-ascii?Q?YwSvzQTFkxlJNYkGlVQWazoNpGr/M/fcrgOcw+YE22zECMnJ3YjZLwutIM/M?=
 =?us-ascii?Q?1qiBBz+MjaJQArkBjBspDG1quZ959EsIQsfe1MXpomm6u8aWZfzz6TOIQVM8?=
 =?us-ascii?Q?iVIBxLSnDYLoN4eNacJxhGoWlr35t9nrZd2Xybh3lG4RUIgaDJpVjKzMgOg6?=
 =?us-ascii?Q?3aWzG4gO+KlAgeg8Hoik5hZOFGRmTKGohUOhCP3r+VvqJ6Wi1XKszMQ7xWds?=
 =?us-ascii?Q?Kg/2IxNs2/aXofhNPkJB7fVN1Ko1ngtfwJKGGJ7im+Zdhhkh8fCt7+u8XseJ?=
 =?us-ascii?Q?APpHBgj6BmCKvFNv2vvmKaDS7fUkGsEDXLk6l7LpHGgQjOqGH1DatdbkRReJ?=
 =?us-ascii?Q?0ZHODyri3V1amUPIQO61ji13bbWV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T02COReq/3c8XTDZjpoTD3IK+KQBj1cd1oqW0HFCJVQvGD0ZAUHNjUxEreB7?=
 =?us-ascii?Q?62bCruplcLAcVzK5XsJioy0zpQy04jSC7x3aZzokne5qHQGUCFTLwuAQL1kX?=
 =?us-ascii?Q?5rcXBO7baBh49ayStfKdk5+M4YhxE2z78j5teSy+Gz1rf8ZKb7e8Hq7XqefV?=
 =?us-ascii?Q?AJhfK2t0slttOGC+Gzte/2LuPBaUHTGXK4gydk/qIouVs7JAEypiTI6jTcQ7?=
 =?us-ascii?Q?RSMYsAnl5Ip3Z+xB0A5gQAdWEdcn0SzPrjWdW480lneS3KN5T4diXOMSAcQv?=
 =?us-ascii?Q?FHC1QwZQLlJ3e/0of68ZOq9QCNx6h40neu9oi3VeCxlyiG8+kaWDVKyMR6aj?=
 =?us-ascii?Q?TO/EVcGXvGqP+nEMpYeykFsM9huAlKWx5rSvOQcfTai2VQZnmtk3sktb7AWm?=
 =?us-ascii?Q?BHyxPTiALD2LMo+Og3XqAZauqLPEZqugoOoYXe5kyNdAS6yfAEXa9YH9maKb?=
 =?us-ascii?Q?G5jcrC5m7AQ0D41bc2OwjkOHohzIUupDhEAa+vqcFatViolERPvgbeO9d6Ou?=
 =?us-ascii?Q?G7uv9BG7CpU8pIGex6xLm7H/CO17xnS1yKcYFV3k2yFxGb/oy3hGissNhQmZ?=
 =?us-ascii?Q?FHQSPocIcg1DFJvmNjvPveOelngZtGyw3Q4f5yeFnX219e36gS79WJEs4K4A?=
 =?us-ascii?Q?/6XaMyZB76Uq2wcA4yOkWpIx2TZjMjfKz46KpwcNV2DVxj0FwTYEgcP9BWJ5?=
 =?us-ascii?Q?Zy9DbLX8WAjLG3IUoMb06oM0y3bcX9Ll3JlH9q4HjWDsHcTHAAdMBUtFiDZo?=
 =?us-ascii?Q?btI0rwZRq1Mg7K06pwsPqk9CdFcqjMQxXsdt3yL0bhplWpvWGj4UqwnaN6gk?=
 =?us-ascii?Q?GH+1VtnwXFnM9Ma2j0GlCr4546Vx03mm6YGy4iDVkpbfQbcKRuT1p3meNo13?=
 =?us-ascii?Q?QM7Hxg0DsWyuVk8P2lN05/X3MunNUmASS/8DPTJz3y+AE+/0owGTguLvBEk4?=
 =?us-ascii?Q?cESOoM7uzg7ngieS222T3tBfm8jJ0frJABLV4LbBxaK9BUxPBKmt9VFCBRsL?=
 =?us-ascii?Q?mQNovLJreuQMFKthLqmXg/zTaGL8Wral1nhFeGG15C8gvkwPhPpwgDJrnA40?=
 =?us-ascii?Q?FLN2lysa9J+gLaHT2/ZDP5DqhHZ7BQZ0eqWuP89VLI35gP+buL+tRYl3dFS4?=
 =?us-ascii?Q?16DfjJX6sfKpV7bTtmzMpYXIHuKmtSKC6WldlNWLwCuwOp7xENPiRqgnBqgM?=
 =?us-ascii?Q?M1zxYVA7VLxelWCbgWr6QBw793+LR/BZa3nUZ6ss1BaC5k4ir1xa7O+Sow8Q?=
 =?us-ascii?Q?fCuRawrxn7j6A/Of85SDg07M6f1ctkxkSk6WfZQ3d5oLIT7uoxeb2oQUKdcQ?=
 =?us-ascii?Q?CQwv0OlsWohoM9yWQ2ZgrkdTd4h7Ux8qJDC15nH1n2KT0ljyVx1Aj7b1KGRP?=
 =?us-ascii?Q?xaVL1pXBkh1ARVtnDZMhrkHoy6tD/IUSO8QjOpAgicLigYJbJcNzV16sJ0eM?=
 =?us-ascii?Q?/3I+bijTO/87EPJAlDRYiVlM0TnzjuUCzePxAwE/2r82qZYCkMlNt6IzXgwv?=
 =?us-ascii?Q?g8UtDgeI4A2fc2ZLiG+LpRLaQjYfhTAxjfgBkswsHKxAuWpgMld3H/PV3Wj7?=
 =?us-ascii?Q?2pcLlaHHFNDXA6jbFXQNg0OV4rphgMhgHCyCrqhczLtXkF1/BnboeJjra/tX?=
 =?us-ascii?Q?4w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/i0mXK3Sy3dS7/SQOhcQXEuEdHQCWbgwvh23Cdq3pNumsE1du6kMcoxLRZ0VWAAADNv20FOl1fyTisGoANr879o6ADHK5n/7INiuOmEHDTGLbhJE9q5pU3iKfYBqZIaLZvuhXIXoJNIECYE//qM/OGVAIULAe73/FcYDLm6zfU7Ul3fVqQBqrot69NVcGJZXdvJHJ8iGaaVwtwFMBM6vS1skinL+U0CcOlYrQPFsf4EWlv+TXxnuH2qZcYmkq6VkFG4HaO32pzODCq1j+zmfezpGDCyxHF3MsTnoGoE94ItWuglmtpyJ5hxyPwAd09cXq998NjUA625GfLK/8fk4QVr9NtYp1+7ac9MFg4Qz8f2waQK0dWA0FFMQaHJuNhwbML7iYC24xW7reQ4JNspq8rqhEyA3WLcqKb2HGm/XlB0mwWp7TrxicBrRDnxGoc5GncETiRU+UfvmXcZKNVkVCOacglpIk3Vy9d3Qfxa7v+oHEZPyPOHDFGHKUnx4gWJGI7WHbL0xEiynwSrPeoMVGLe2lvXvMBACae9u2ce/LqUXJefp74Xi67AG46Pf+kBP8nmsEryg8SOddxohI+zJ81nH3enHuGPb7eQozc5p5+g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ea05d2-b8b8-4226-e829-08dd56865adc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 16:55:20.7785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bWrGbiH+hMLYSc6wY/Zn53/VItpCL4zz1Os7jR2PcbD+XBjzKGSrTrA5fUs0U2pByxl8501IWeMhtQ20zQEYjXbdHsD6b/bWrvvVT+W1eLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4585
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_04,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502100000 definitions=main-2502260134
X-Proofpoint-GUID: wXZbcZO5o4t3odAkQRH7uYjel-Ma_-PJ
X-Proofpoint-ORIG-GUID: wXZbcZO5o4t3odAkQRH7uYjel-Ma_-PJ

On Tue, Jan 14, 2025 at 06:38:20PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_prov_uprobe.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index e96479963..5d9f74244 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -593,7 +593,7 @@ static int populate_args(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
>  		upp->args[i].mapping = map_arg;
>  		upp->args[i].flags = 0;
>  
> -                if (i != map_arg)
> +		if (i != map_arg)
>  			upp->flags |= PP_IS_MAPPED;
>  	}
>  
> @@ -716,21 +716,21 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  
>  	switch (psp->pps_type) {
>  	case DTPPT_RETURN:
> -	    upp->flags |= PP_IS_RETURN;
> -	    break;
> +		upp->flags |= PP_IS_RETURN;
> +		break;
>  	case DTPPT_IS_ENABLED:
> -	    upp->flags |= PP_IS_ENABLED;
> -	    break;
> +		upp->flags |= PP_IS_ENABLED;
> +		break;
>  	case DTPPT_USDT:
> -	    upp->flags |= PP_IS_USDT;
> -	    break;
> +		upp->flags |= PP_IS_USDT;
> +		break;
>  	default: ;
> -	    /*
> -	     * No flags needed for other types.
> -	     */
> +		/*
> +		 * No flags needed for other types.
> +		 */
>  	}
>  
> -        return uprp;
> +	return uprp;
>  
>  fail:
>  	dt_dprintf("Failed to instantiate %s:%s:%s:%s\n", psp->pps_prv,
> -- 
> 2.43.5
> 
