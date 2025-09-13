Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2657D1D2F42
	for <dtrace@lists.linux.dev>; Sat, 13 Sep 2025 15:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757778992; cv=fail; b=Mk23Frx9vBgBNWxei6kwuG/YbtFMiRnQrLzZeHPhom9Q5d0u2tvwYbMCVuWrKAGX0xLlVtRoh/6UTYzbaf3WlM1+MR2xJ/4AhVOvwAhfJgGkgv9dtZApo1UVlCk2tUzpvV2k2gLY2Iwr/iomEj32dVO6abi8oi7XrCwZ4Pdka10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757778992; c=relaxed/simple;
	bh=/qApyagrHDGEmPtjjAY6xv1fQezSoOknXnsRxREmT2o=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SrU0bti1nvVr59A9FPdRFCzA6QMqCEG23Hpor5w2N7hj16+SvWBaibXki580mUgV6Soz4xEziv/iTLMfDly8BXjVIxDL/O/EOsLv+7hNULic3VnpjtuOsgYyaSC+gyoCpbYE4pPBsssMkT2eJ0jSZxim7oENoCofXnN0YaPo6j0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gpSaVc/d; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=q/DAmUQY; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gpSaVc/d";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="q/DAmUQY"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58DCTvvS026531
	for <dtrace@lists.linux.dev>; Sat, 13 Sep 2025 15:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Q8inAb5t4De+XDaIu4
	UZfK9ee5km2eY/9bcNvWWofmE=; b=gpSaVc/d8DHj2IkrVNNx9RbIE6ELtgX+/r
	9153LykDNAjr+/uE+pXUZtc1mRly33iVIWtO/aW0jzFmi8WjKnc0GhQeXLu+wz25
	74USGAltLf0Ca+aZXJQ5u7OdwuNT6Umy2hYlpLfN882KcnLPK7kFGy7qaj6lBG+B
	Hb/5obedA/zbCcW1ul2wcK0LuH0d/TYZ86nAXjwvs1sas/cfYgBZy6Wai00JrAoF
	eob7IVHUJxvmtpiJeVOBgLhB5M/ihav65sQt1pQ5NxWsK8WHuBTrYQpRfXg7HuR0
	Kfixs040wF0Zsq90v+/cT/Z2/mFFLPkQi2MYCMDbH6ec6CGnEICA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 494yd8gd0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 13 Sep 2025 15:56:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58DDSOgD021494
	for <dtrace@lists.linux.dev>; Sat, 13 Sep 2025 15:56:28 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013043.outbound.protection.outlook.com [40.107.201.43])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 494y29matf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 13 Sep 2025 15:56:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B+iLC1n+0Hw3B639hbj/qZhRgX2M+AvbYkza9Jh1+tChe67Xh5JecTDr8WkJ6n0/M9MbThL9vZmc8WL89Tzq7xVvL02u0gBR+D56SGJYnYiXnHsZ9nitLJb0zKEmTsYXs9A8OXQIVzA1cIhaJWK/OSuX7QxltDnEQTzjjdj2kHcaW4kAA6E9L6qGZzwDJkYsZ5GjXBo394r44UNDrVfUXHSfqufYQ+lrOQ9OeTlFkiXU3wjeYjKyLYllInbjCvWriDzekkUr95ZwKUpn93u/HFULm5QK2QfZNZeEPwfnGnbesgkVlwT68yFVpK033ITz6F3fdInvxrrQIBU4QWkuOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q8inAb5t4De+XDaIu4UZfK9ee5km2eY/9bcNvWWofmE=;
 b=aWzM82imNEJPdPc+BmtSTrWCLKKYg+1IGAyh+AYFHSptmyikOYmfHx0+pDn+CYrdZbdkrdnjlSs7Br/sOcElzRRT53U8CGuRjr0wuw2lihRncYzDIoK3aUojLDBONDYG9cMa4Uy6ru0rjcby18t5+1HXDkFeuQQZdTW4UEQSS3yft17tuLdG7tJNYJZfUgpEGBFsgHvWPDx3vc7NQv1GVErhvSXuAe+gInzv0dsNLs6/HPKoHMgYHjXKk/PohsBlfq0PmB91hjkL5IVRTis/X5DzJGCmuxQxJQl83JX7OTiNGyg1g2mHDi5h+xU0OQZg0HqxHg3bE+ecOHWeFWD9aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8inAb5t4De+XDaIu4UZfK9ee5km2eY/9bcNvWWofmE=;
 b=q/DAmUQYEpfmFHVt06Ia1teT3kcPLtdOO8wCuUpDCX6Tp14g3UNnHGHqoBVc9/yj14xVcSfBvkpNoShF9RRjh2rNzsUEqhmlnSp2UYSKbI23rK4lo7kwknm+e2Xm2+drQ3t7PtU+k1Nb/atV+zVxFkk2+CTo4fHGx1ZFvzgdF2E=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ5PPFA7D84DD83.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7c0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Sat, 13 Sep
 2025 15:56:26 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9094.021; Sat, 13 Sep 2025
 15:56:26 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 3/3] Add more robust mechanism to skip tracepoint common fields
Date: Sat, 13 Sep 2025 11:56:19 -0400
Message-Id: <20250913155619.22299-3-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250913155619.22299-1-eugene.loh@oracle.com>
References: <20250913155619.22299-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0038.namprd07.prod.outlook.com
 (2603:10b6:510:e::13) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ5PPFA7D84DD83:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a929585-1e28-4ec9-4942-08ddf2de1845
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Oz0r7NshO1fVsri9IRuASIDBezUIL31YefpFQDCA5AqQ36e2wFLVE7w/5IN9?=
 =?us-ascii?Q?EX8y6ibzPynVaz2lo69De5+MVFjjKT5Ihcc9kgyti/M5MP5oQUiEtfugs2Rn?=
 =?us-ascii?Q?Rrvd8L7iB80XhrChyG0adfMDcBpHMiyeHIRiUVaG8ZpVfsl374s5dUhIWpzb?=
 =?us-ascii?Q?Ulv4amk/RFI7Cw6cVqxSTtHkZBTGyKo1hRZh4kDvh/koyb2o3VCWMd6XvlXa?=
 =?us-ascii?Q?5+4iLKQM3nyOFqRi+ePOgbWcAephM1uGlu/t7KimEpKEAsN60yvaKhJxvTfL?=
 =?us-ascii?Q?5AnBqrUmFHsk89OXKyB6eQe0aUShe2hFJwFkuNX1lRs3sP8xsBYNvluYNhi4?=
 =?us-ascii?Q?H5EWNAGzamf/zSmysW5LF+Vwe9f/tFxzLch10WNmd/yctZcpIdYHKSf7tdKQ?=
 =?us-ascii?Q?VC5t3zsmGMEGqVnEe0IuRjmCflqRCzgpjOjiYvNFAkL/jga/+jPJVtoQrWR2?=
 =?us-ascii?Q?NQgeu22ePta5F9vvD4Jul87X8yp8E3AkxKCuUovceQtSF8XTVpWmyPQqRkyY?=
 =?us-ascii?Q?OhNJCUQUucWPGKupdcLv1SzWiiTdX4QWKJ2IhxX20PjGSKIK7k1+oOk6eMQo?=
 =?us-ascii?Q?ZFt4SHeUk1ZYPeDesmJ4sTXJrEHlcNIsb5WKz0GBQrWJ0/cQ/fJmKADo9vgu?=
 =?us-ascii?Q?ug+MVNuxNwoa1SwHxR0sZdqKH8NYschQ+/foshVx35BgB9c7jgDEMvG14DNO?=
 =?us-ascii?Q?R/QYxR67EnYaRkqW57q4t5Uo3qWc0yiVQ1pt4HqYofHFUcGZ2mH/82WWxjJ3?=
 =?us-ascii?Q?AVwFmqgIXX2TcDJo0gMr0w3q16pHC3IRUgC36SrS24Pg3ZOb5b8aUv/rIQQi?=
 =?us-ascii?Q?d7tMex1u42s8zWuf9SrTD9TePVSEv4nLY0RCLgDcWoy1vlOnvpTopghDAeM6?=
 =?us-ascii?Q?El3fMHaJlZd1d3MHwgyWKdtm4PD9Pzy9JlPYXzS3pgOGCaCqh/jIqhlEBm8d?=
 =?us-ascii?Q?Xs8vnYAp+SCPWvrdUxFX/+OhPx6RLljfh6NUiRVkZ2DgNdIABRvR74uCLrgt?=
 =?us-ascii?Q?DUNp4dAXHrqK1oJxuzVlxvDusaXZloAyf/G8hhuXs64ESH1O6O0a8M26tSYK?=
 =?us-ascii?Q?joq4GWeHdWn12E7RPOhBpWDLkIlfYHWMksGkcNhgYk9oeNLRqR1bi9XFM6Ay?=
 =?us-ascii?Q?sn9SjBol2/fJj2Pzu4hNIjitydcRRia01Pm6Aeqx2ryO2V4WzQa7sss6NWzY?=
 =?us-ascii?Q?CoB6tSUag7D23aak/ffcirtPO+X/CMD+ZX4KwGt/JzapaZgfmD3/Dxr0kDEb?=
 =?us-ascii?Q?kqJ2saO1z+tXdYoFWvcrewZMQSmnx8AfOH6qezZUoDSgBQeEZpAd9k3fgVRY?=
 =?us-ascii?Q?v3XuReRSkmZWjxKlRMLojcOC7mSbe1UjVeCWgxxRiG5Viw31zDKN24N4BgQx?=
 =?us-ascii?Q?9LYAFNU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3nOt16wxxnWE09oc8snJ6jG+JEQL3sLlmnTkOJtgHNxZIigyflQdCbe2FWvc?=
 =?us-ascii?Q?MZwf7mHGsfGqk5/orpVpnqEYJzOHf+2P/4YdBzsLWQ5BQCcpy1X13SN2XFB+?=
 =?us-ascii?Q?5gVuAlrRmzWl3o+IuooQj5a/PuajFoy6WtZrzwQ9L5xxbGdOANw6pVMmRsXj?=
 =?us-ascii?Q?fwXwcOaw3QLuyGilUlrlObQZnAkmm4qwziuQghXTZNAOcl6dnPFtiondJbKe?=
 =?us-ascii?Q?NQvBUfbpq2Afn9uqZit+6zkgKrQjE4Fn8u7L3PbeoAo7ymMKqct31MxbpCvj?=
 =?us-ascii?Q?bLksa9LrU8B4eFAD+HFeERp3J4FWTz/kowJmhbWXgSOvdHMxsB/jr1P67eFE?=
 =?us-ascii?Q?xvN2blpivKvKILooSW6Fq7qm0ylM+ycSPQadld5fQYGztKbvntjEIPj3TwLc?=
 =?us-ascii?Q?bPKwsXffve2Vx0/y8F0MN9pDD0AS960dj90Un2Zv3kBqiOv4mdfxhnbU/hkJ?=
 =?us-ascii?Q?jNJo+nvvH+PtUaDPX0u3ynAn/5ZztXpTLgb9XHeBpj2Vy63yrPAO0nMEDHcY?=
 =?us-ascii?Q?26aCUwzk/y9OIKTYb7OmTkZnpohIAovRFXOm0fRhQbUoSc2Lfm5gG9h2Cyzo?=
 =?us-ascii?Q?YYNr8npYGXZrV0e71Djo2Kl6cXOiN0vIwnTbfkIIqdkzbVefseU888Oht1BG?=
 =?us-ascii?Q?XL042dHIDhnPP+MOnzL8i50uuSfJxl0LhGriMnkFUDitBIozkhmFozVsW9ME?=
 =?us-ascii?Q?WYx1oV/OE28r+FgYBdobNs4AgLxOU8ep5WxAqkb+J4Z9Jadn89gISq+X8v2Q?=
 =?us-ascii?Q?9p8sOogL6yftj2zRUzfbey54HoxSh4UVAG5KE83DFKIa3xjn+G0LECJDMcSe?=
 =?us-ascii?Q?MFo1N0TShkkfKrAxDSi2VrKHCM9iUw4LhBeeiebEQvAcvo70rEH8V8wEtXPA?=
 =?us-ascii?Q?kCvak195q0T36W1sk+JlYAbs/BjiH6rC+QXKJhTZTScoJcbSxWMKinfVI8gz?=
 =?us-ascii?Q?Dn8vgdeka74+jEqxF1i/LnypxU5p+qUDi6YKav/cV0mdNVEYLFZ0KHGALI6C?=
 =?us-ascii?Q?lFE3WWGj7U/O6Knt9Ie3o4t0mJe9WyNv/v6RPnkY0WAfm9KDQ0cGMjF1+O64?=
 =?us-ascii?Q?1lqS1N+pZXrmAFS+P9eNgsF8xCiwVxcOa4mBsxpNYlXovel6bXJzb5VgSmbW?=
 =?us-ascii?Q?DAulX3uhThADDfx5itnlZGaK2AQvwQ+aFE4RzUygoZpUGyea0qK0EAdu8O2a?=
 =?us-ascii?Q?CG8zAlKx2q3D2zhppKiTM5A2fGDrjSDSBE5X7L7kYXELv/PXfzzs+sBhkT01?=
 =?us-ascii?Q?DoiaA1JWC5mYLoeWjMhEIxVCfmK7J3R36yj/SpEyBIjxRiCUXMLweAUc1Kfa?=
 =?us-ascii?Q?gk8Bs8ktgOA8nasuVtHIHZe2J0t+GPhGInxXa7zKcZrpqeTE97iIVXOblxxX?=
 =?us-ascii?Q?E0vLS+UIYTyLOJbPHAQGCzR8Igd41YDBSnVwzL5LeRq5K82An0eydwsQZfYR?=
 =?us-ascii?Q?NgZvZiY3KzpfJw6Yt0Y7Rc+2n4ANrY/MOS3qx4JpN3gAz9OP12PaPGj3Tqdc?=
 =?us-ascii?Q?HIfUJ2izksmAEHigr9wYPKubaz5cIbsq0Xna1xbxJdTvFP6jjp7G7jftDeqU?=
 =?us-ascii?Q?K+on5G7iRvJXkdkkaHWXDVyxyscojqOAzzhmXLzz?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bbKieXdJSbPtyDz4T2ms546/7tEZDkv8kDU4tcZo23Fe6PyqwO57bU1KCKiKToHniEAY461h8u05IZ2m82GtFZNNgWOjjyLqh3drLHEltDHGDPFOf5AOyLbJILloSE7INxRKYL7QIQk67S1qt/rHSjYnux1L+3Y+qK0N2SafgmmJTrOrVM+zHbZDDDopfGPh4XElHTbU0fPZQSGPXmkpOOfd5rtWY+zeSwIChv4jF6VYP+JudzCNtaA5bnyB+g2OEBoe91jpql5UNZ5Ih1G2I2eHN/JSodO9quXoPve9wIZDFXipPSHwCH25eIaq9dbQjreYTrt8cUuBiR/2P8f4R+IZE+9oxoCAdHwdkMN/Oae/ARLJ8isau/PB7oT97ssD8ReIhuEm9mZCd5UAJHkRBPvuBBRbdx76pk2Lv2ggluZrvgGZV8X/Ws9uFmSm5Xo9UI/hnfBdThmomLvSPHRXEhBkzdAGuymOJ7d3zzf272pAIg+HKrt+Ww+Vt9fg1Zx0otHbca246mLJIugG3agF/wDeZNs016++Y7baBoUSRyOzPeG6Vzkwi28PiYj++c0BzOR1kXxGAc2saCBi3glAPk2WYvwTzjD0w5QShncPjFw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a929585-1e28-4ec9-4942-08ddf2de1845
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2025 15:56:26.2257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kaFjQb++A+Vm6vznVh9Q+gOXPJUC/0GylKEHjTAFC7zxOvFEtgSOpiuDxx6ih9cEgKgfJJsjW8pbRv9KiEa1ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFA7D84DD83
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-13_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509130152
X-Proofpoint-GUID: vV2WxPYsmbmCoSh7ejwS8lg2iSS124Gf
X-Authority-Analysis: v=2.4 cv=M5RNKzws c=1 sm=1 tr=0 ts=68c5942d cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=Oh2cFVv5AAAA:8 a=yPCof4ZbAAAA:8 a=sfaLGdoFMdPq4XYGa70A:9
 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-ORIG-GUID: vV2WxPYsmbmCoSh7ejwS8lg2iSS124Gf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxNiBTYWx0ZWRfX67I6IFGf9r3L
 CnMLzhwPrgw0D2EpLwX7Kn/BbnBYuxV776WNMudxor/9hHjS1cpa6jqo3QJUw0nlLzdAOFj2ej8
 CgWMRguoOAzNxRwrtoOvF6WAV4qH+zZgNTeKv4BWeFt6pN14NjHdJ2Dhdv6e+Ss2lgfKKEM+TGy
 UgjaldDAa4ezkO5z1G+ZQZ7emwq8UI8iATFgG48M0zKbWHFmF/CxxLTzdZJaudrdDP1/iYIFuLr
 tHs5Hgxk0GqD0oFYmF8XyV4sZwVNLeywnvmX65DvApx4+2FJKUr2l9RTSElKOT6UIrFVUPzXsgC
 BtxNbMqPSBP+1sUd2i+LMjfhLRAXhikhNCaKQl6A20UcCOF1NXJ4TXMiavejWWpOsyA7AT6KTjj
 BWxA1CIl

From: Eugene Loh <eugene.loh@oracle.com>

In dt_tp_event_info(), we parse tracepoint format files -- e.g.,
/sys/kernel/debug/tracing/events/*/*/format.  Specifically, we
are interested in the argument descriptions found in the file,
but we are interested in skipping over "common fields."

The mechanism we used for this purpose was, in dt_provider_tp.c,
to hardwire the number of fields to skip to SKIP_FIELDS_COUNT=4,
assuming the common fields would always be type, flags, pid, and
preempt_count.

This is hardly a robust mechanism.  For example, consider
    https://kernel.googlesource.com/pub/scm/linux/kernel/git/rt/
        linux-rt-devel/+/refs/tags/v5.9.1-rt20-patches/patches/
        preempt-lazy-support.patch
which introduces a preempt_lazy_count common field (on top of
others).  Recent dtrace testing on RHCK 5.14 indicates widespread
test failures due to this problem.

Implement a more robust mechanism.

Specifically, instead of skipping a hardwired (SKIP_FIELDS_COUNT=4)
number of common fields, look for "common_" names.  E.g., in
kernel/trace/trace_events.c in trace_define_common_fields(), we
see the macro __common_field() is used to define common fields,
and the names are prepended with "common_".

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_provider_tp.c | 83 ++++++++++++++++++++++++++++----------
 1 file changed, 61 insertions(+), 22 deletions(-)

diff --git a/libdtrace/dt_provider_tp.c b/libdtrace/dt_provider_tp.c
index a6f978e3f..13f4528fc 100644
--- a/libdtrace/dt_provider_tp.c
+++ b/libdtrace/dt_provider_tp.c
@@ -17,13 +17,6 @@
 #include "dt_probe.h"
 #include "dt_impl.h"
 
-/*
- * All tracing events (tracepoints) include a number of fields that we need to
- * skip in the tracepoint format description.  These fields are: common_type,
- * common_flags, common_preempt_coint, and common_pid.
- */
-#define SKIP_FIELDS_COUNT	4
-
 /*
  * Tracepoint-specific probe data.  This is allocated for every tracepoint
  * based probe.  Since 0 is not a valid tracepoint event id, and given that BTF
@@ -129,10 +122,10 @@ dt_tp_attach_raw(dtrace_hdl_t *dtp, tp_probe_t *tpp, const char *name,
  * the identifier isn't as easy because it may be suffixed by one or more
  * array dimension specifiers (and those are part of the type).
  *
- * All events include a number of fields that we are not interested in and that
- * need to be skipped (SKIP_FIELDS_COUNT).  Callers of this function can
- * specify an additional number of fields to skip (using the 'skip' parameter)
- * before we get to the actual arguments.
+ * All events include a number of common fields that we are not interested
+ * in and that need to be skipped.  Callers of this function can specify an
+ * additional number of fields to skip (using the 'skip' parameter) before
+ * we get to the actual arguments.
  */
 int
 dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
@@ -140,19 +133,16 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
 {
 	char		*buf = NULL;
 	size_t		bufsz;
-	int		argc;
+	int		argc, common = 1;
 	dt_argdesc_t	*argv = NULL;
 
 	tpp->id = 0;
 
-	/*
-	 * Let skip be the total number of fields to skip.
-	 */
-	skip += SKIP_FIELDS_COUNT;
-
 	/*
 	 * Pass 1:
 	 * Determine the event id and the number of arguments.
+	 * Skip over how ever many arguments the caller asks us to skip.
+	 * We will skip initial "common fields" as well.
 	 */
 	argc = -skip;
 	while (getline(&buf, &bufsz, f) >= 0) {
@@ -160,14 +150,63 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
 
 		if (sscanf(buf, "ID: %u\n", &tpp->id) == 1)
 			continue;
-
 		if (sscanf(buf, " field:%[^;]", p) <= 0)
 			continue;
-		sscanf(p, "__data_loc %[^;]", p);
 
-		/* We found a field: description - see if we should skip it. */
-		if (argc++ < 0)
-			continue;
+		/*
+		 * If we have only seen common fields to date, keep
+		 * looking for a non-common field.
+		 */
+		if (common == 1) {
+			char	*s = p + strlen(p) - 1;
+
+			/*
+			 * Strip off any [] array size specifications at the end.
+			 */
+			while (*s == ']') {
+				/* From ']' hunt back to '['.  They are not nested. */
+				while (s > p && *(--s) != '[') ;
+
+				/* Then remove any spaces. */
+				while (s > p && *(--s) == ' ') ;
+			}
+			*(++s) = '\0';
+
+			/*
+			 * Go to the beginning of the identifier.
+			 */
+			p = strrchr(p, ' ');
+			if (p == NULL)
+				return -EINVAL;
+			p++;
+
+			/*
+			 * Check if it is a common field.
+			 *
+			 * In kernel source file kernel/trace/trace_events.c
+			 * in trace_define_common_fields(), the macro
+			 * __common_field() is used to define common fields,
+			 * prepending names with "common_".
+			 */
+			if (strncmp(p, "common_", 7) == 0) {
+				/*
+				 * For Pass 2, we will not bother checking
+				 * for "common" fields;  we will just pretend
+				 * the caller asked us to skip more arguments.
+				 */
+				skip++;
+
+				continue;
+			}
+
+			/*
+			 * No more need to check for common fields.
+			 */
+			common = 0;
+		}
+
+		/* We found a non-common "field:" description. */
+		argc++;
 	}
 	free(buf);
 	buf = NULL;
-- 
2.47.3

