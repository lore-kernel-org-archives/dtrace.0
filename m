Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6793A1DFDA1
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150298; cv=fail; b=FqfYnywCjmHB9lF+6fCSJtQdn0SCVMeRkBc2bdzkPT+N5OAqbHLVjZ3z/5LwHoJjeH8Z0FyiOsYHCBukjzA/TkngDXMBeuC/d8nNpNAzzd2EtxqLcT1l7HKi5iJa9f8k/ywSbcGiEXEvctlKYPPC0tAYRiY05BcdDT6YW+ZFjaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150298; c=relaxed/simple;
	bh=LXYMtbVymZPpEuNlxpoh2T+BpV4Qsus4LcW9uYwpC/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eqCtwvppRQ99prazHwssbtw++e1ZKvLzov31XAuTwez/uq5AkBYl9QaaeOtsvS5ecH0E3kp0zpwFoMv5DjjtimgKE8j6Jd63JDt5jAj1pHrhlGetZYplHPhmTrV0mFhlWnQ3s9xzU8sbAMXG/BS2viXgSzQ3eQFitzm/9EW1ynw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XqJjvDFu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QzAMpxHi; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XqJjvDFu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QzAMpxHi"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKtac1020944;
	Mon, 28 Oct 2024 21:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=apzKsyx/DUsKkiBbOeIzSg0QwDccDptYKrk1bUg2ri4=; b=
	XqJjvDFuHZIV6e+2wmIZsLx2oPzl6UAnjJZGpzi93FS3JQsRDr40uL6km8MoGKwY
	MxEkcCeHE8hdbRIzDBb1Esno+EDq+8zO4MPgeuctR3UjrTWejg9Tn2fD++/LUjJ/
	5602XzwxEkh/nfsGjUIGiMqlwq2kSpteR60tXKYNFQi5M7AWnph5bR2YseCBKZLU
	VcavuzpLlJqcFawLirWNIxa0IF3FC4dnYWxkxII96s82Hjg2vGIp3cGz7skZ3pHq
	l2MlSlunXssTL4/txTk6/3pxXFuFqKol2Hcb5aLV7Q+hM8d41ClnJvLryzz27PUZ
	ctneXKJjAynzQEI8ZV9iJQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdp3yx2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 21:18:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKABMe040236;
	Mon, 28 Oct 2024 21:18:11 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hnan35xq-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 21:18:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1BA2j9xT3ZB1fXeNnHbD0C4oiDd/STwxAyfdFopVVZqmjhHkYflqK1X4uL3EKPtEs/iGB2GydQZl2SCxHopkYzKe6CodWQQijev9zeMIJfSwvy6vCibCbYexQtU0ne8ZP05shUA8tsANCJyuqjrtchQmCGytiIQhXO8KI186Gm6fYwgXEGVj284a7WVmFQ6KdhR7d5/M7msdEb6TY4f7cAVFPUfSlV+FBnT5H0Bis7C39IxOkYw0+RrDOmSrHETdo2/ko/ZOQVx1njNXy4dMDjaD3Hj+BO0uXo2DnXtOnt1XElrm18SSFi7pYR7FA0F5ZAPBB+5oeLdcaJOUARIKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apzKsyx/DUsKkiBbOeIzSg0QwDccDptYKrk1bUg2ri4=;
 b=b+tGX1a2ZD3qI+sEMqsl0JDbS5jBybX4JOx08hCP21mZWBIQCSWTxIht10NvjeDE+zQ0BCib3vBL/+iy5XINYI5/AiziwqLKh2EoG9fcrNGEIpL6BH7lcOizGASICta3HTRGJQVYex85iW4C6t6UZJKX1pQwm43lJbV/xhUFcGQtK6HcQ79cd7ckc8OKJAz28J1QV7XH7F2w4P3G90ZIOSpTOyyLh+wxmvkesk6pJG45XBXhZseaIfmt88978c+sxAC37OWc7WOH+vJ6fQcI46ST0d2Namc0mJP++FzNuZY+r2ROvqajW1cG7yV53gpxcbeIQznfoJS8+mq/OzuLog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apzKsyx/DUsKkiBbOeIzSg0QwDccDptYKrk1bUg2ri4=;
 b=QzAMpxHiB2HEED6+hfpIA7r/37WECMVYzUX3YV4IYBhsJDGsYwjr+acUz3Lg7Bg/U7f8oDMpNgCmUJHEV7zj7la3TMLUjeSMW+rb4ZPmO8ms7IfCD2GBqeq6GDuoQJubMqZjkMy1/VBfRVeCrQm8uKSik+A5xl/Wng0hj7vXbNo=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH3PR10MB7354.namprd10.prod.outlook.com (2603:10b6:610:12f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 21:18:09 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Mon, 28 Oct 2024
 21:18:09 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org
Subject: [PATCH v2 01/14] No longer depend on libsystemd
Date: Mon, 28 Oct 2024 21:17:50 +0000
Message-ID: <20241028211803.458685-2-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241028211803.458685-1-nick.alcock@oracle.com>
References: <20241028211803.458685-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0119.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::6) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH3PR10MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: 90483d81-c48f-44e9-19d9-08dcf79605af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x1qbTrCGHrL+BDFRgZF2bUiQHtxGBdTuWnl8b4+62WvIThg8lb1CK/wqcGPG?=
 =?us-ascii?Q?ryDRHPAgwznYOWzT8B7WGBY3cVMivOVW37Uv5xBQbN+/eunsV8nXXuKQQVzL?=
 =?us-ascii?Q?GpH/Onb9f9m3ZutjQKc2MgifY5q/vLf73VYxdDJL1fr0VnaYSHyW5/AlmClU?=
 =?us-ascii?Q?BVEABhluS3fZuNt7OXg1CT/Epb/yTP/B89G9GdAw+UBsB8T8lXzRa8eMEjPA?=
 =?us-ascii?Q?d8zseTcG+xd02cSr73n8c/r9WmmVDgwlrL66AbsqeI0nnlcJIDLxwn15puSA?=
 =?us-ascii?Q?uQtGrdDsnNsLmHRRVFwLJOQa4hqnQVU/eDXYsmBeWUBK/TuEwdCA5yDVG850?=
 =?us-ascii?Q?0OA7Iesi+ueMEiPRbScHRtjK6Zxfqdnpup2qUHTp7gnkFpeZQHeynSkomvK9?=
 =?us-ascii?Q?S1Yrv4c6hgxdCNpUoFufDTM0IAISX08+4Z3ieUhmYZ+cNuce3/+LFHUJHy2Y?=
 =?us-ascii?Q?pI4UYIYzUXequ6QCjsKhMbHa1dsyzrsxEAFxwcrpWlsKjUPQGEDNu36x26w6?=
 =?us-ascii?Q?7Ip8eBco570DhR2NjuMs1GGdrv+0vh57dY5L0FSnwPkWOsqZY/AlXqQcRjqB?=
 =?us-ascii?Q?8h3pwXyipnWqrBzFwrKvxKDO0kc0ScQtwp9ldE1rA+qqOMWSB6vmQixKIK34?=
 =?us-ascii?Q?ku1AGovpcJHZJbF2veEZvx8Vpb7B3wmbpsD83nx82vV9mPrjOSrecF8vhHdp?=
 =?us-ascii?Q?gmAuVHqsYP8uDaFMPZl2XWUJTQMFbBJdnvleJ00qiSIT/QFwku6xCLD3vE2e?=
 =?us-ascii?Q?bsdby8gLuuPuN7lrtmhdT3zV2TAB/pOD0Bz4fSPFyTNPaz+IL4jTK4d/V2Hu?=
 =?us-ascii?Q?aucON/z4ylKw5kI6b2M41Z9EwqbvysbECSh4Y9atpk9Rds6G/oA95rGI5NXr?=
 =?us-ascii?Q?+6PAUXey3sfa22ZqQbolmILyg+7RC0jQm956oOxoNkcgQtedLkQhUFZRcjVu?=
 =?us-ascii?Q?ANIqPHbw8kpku7i90TMbgd2t5VSEiEhtRgteXw3zCevxhb9Exvgmyd1GFHBZ?=
 =?us-ascii?Q?R4UHvP5ekvWUzCRLF+GtNVquDPe+NZMNwndafo3X1EWeoRUMX7+gAawCY/rD?=
 =?us-ascii?Q?RwO4bS4evYlQhICeMqSvfrkMPgmoVf+V3RcMT76ML0GtHJjK677JHLEvg7HE?=
 =?us-ascii?Q?tdn7u+dkT7THg2sicAYk2NcsMF/3l3mxMRdnsz+jLDEMUpmGlGK4J13wE2fB?=
 =?us-ascii?Q?1MkMJinFXVSs9IlbRGGaSeex9PB5n0amOsqaxSQECNp53dkJ9e6WOuBQMMF/?=
 =?us-ascii?Q?6v6WE7CZEJnVZdZmZzw9MxFcsj/roBsytl7r+k38CA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ixZRKLpBHYV02aJAfCgHv1b7jOxe7GA9BYcZ4kLZMoRZgsWmHrO0eyRG2byu?=
 =?us-ascii?Q?bhXwl8/DtJNKEJnYDSFmWgA+iCNyrqA+GrHyw/Fo1g3W/oxOO/7HR5g88e9w?=
 =?us-ascii?Q?C2u0TUIEzmjQRsz7aSsaUx8BkPJ/RcvC70OlhVo3hwWVHuedscMihYx8YcsW?=
 =?us-ascii?Q?4azdzgxVRRqHJ0n+6CQ01AzSw1LsC9qlxVFJCyF5g1jRCS5H4/7N41UmRrl5?=
 =?us-ascii?Q?kDyAfygBXFID+/l3dwNqQaONECFrNM9GZYsfwG6ccLMfVQcqu2tc/NFsuYAo?=
 =?us-ascii?Q?K/D2NnGYITJK8LlXExE+B+1b2F7aF8zFTJiit5b58SSp+CNyGJMDUaqjbaLi?=
 =?us-ascii?Q?eYOvfOwu5nd9ntDNyasVpi3UR4/8GWKX0oJAuoUQff8QbnLELB1ZEBnTsRjQ?=
 =?us-ascii?Q?KpiVQ8gytZP0AJZr96Qn7Or+/6+AJ+z8J/HKctrzk90vfrYS1WPhZeSewcwc?=
 =?us-ascii?Q?BL/eqrdUMIEn4lsMtO0fXg7S5yenMGzOM3gj2YD5zyFhTw4bRvjCECnyV2PG?=
 =?us-ascii?Q?CJ2u8LG3Oarh3aqGAc+/WoRpTwC0aCEwuM6tt9PVo0yTsR2bhLTXJDUvpKCt?=
 =?us-ascii?Q?UwBE9wtQWi/gkgekj3Eex4YsVKn8dbOANwgkJvtg3JIASX7Cc0jtenlVeIwN?=
 =?us-ascii?Q?pC1HeVF2wedVX0QMgGazLkDf38cQQeZqZ3JJfocekuyT03jMsMeaQ40r0+Tw?=
 =?us-ascii?Q?AlrdB//DukhYGuSKVMmAs9T7LMeiygwODRU1YNJp5z/VavCCYVoriM/Tvt+C?=
 =?us-ascii?Q?HEf98hc5iZv/1qSB5/F0jj+V5DTvkdDCId8qlpxLoEnca5Tli/k9l8U78llj?=
 =?us-ascii?Q?KuApGVwi2vkbvGqGVD9tgzJuzyw4AcoZbCkx2ew1pzR/4KyBUE94uza9V6s9?=
 =?us-ascii?Q?TT8SmcCnIYFwAt7WY+psdp64LaO/M9Ub2QrTjMvlQVZJSS/y4nFKpF537IV1?=
 =?us-ascii?Q?9BcF0a5nFPznnYl9cCq2aPfv2TeaXDQ2QVZxHXEU4UbPNxtgARIAWzX43pL0?=
 =?us-ascii?Q?DEC147kOmShirxT1gA4d29FRsHgCzIRZsHWJGhaqmdZjamlsipav61+cirjJ?=
 =?us-ascii?Q?0R5Lq0HfMIKYU7c++qKN19VtP2pepjkQKjKnp9sCS5rBEp3hX+3/LARq3uyk?=
 =?us-ascii?Q?5qcHcREdgTFJTqZudh8ImY4Dm7bcauTmbnYhg0U2iGgfG1SrF8r7a4KWxJ5h?=
 =?us-ascii?Q?Dhj4penxydkU4zP8R/OhoYPmDLsqWQYp3SxEH5CKXKd5eAZQHt3r8PJQmavI?=
 =?us-ascii?Q?lkyzRfkEz+NTKi0n/1NTg6UD4SVGwLTZdzsnodZrL+biPVhUpaYHNLx/ImkD?=
 =?us-ascii?Q?43OrbdkNh1u9hDW16J6yLo35ljiA46eHd/W1kbaBaf9dqNOA6FIyREVyl3Cp?=
 =?us-ascii?Q?qnjSYN6oDKPxjUTlzwbKL6gBF0r8PKsnYQ22b2Bq+MrSwSo1aN87eE8ZpqHp?=
 =?us-ascii?Q?8LEQlgPbSZvaSOYqapGd6CFulWfafx/VsAE/xwviTz/3gKcC1aHo4PnAMVVB?=
 =?us-ascii?Q?o3IeP5sN3r7BMMMjiBMzzDoI6QvUGc0MidewIaC81spFGNOWmnfT0XvIYnzG?=
 =?us-ascii?Q?Uhe/v7tBIBYF4YWEc7/VefHtKc3/I0+VAYZEeckIXfeCjhaRd+JK4cF8fzgC?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iEqX/QyQNHDqtfUkqg40AwxAhbZOTPYo10rc8mUIl/8OcLvHJkW1vaKIdJLBuNAajdLgIJrgi4wQtw+n9GKjssKzc/oeENuHiYCf4CqoxdPGFgtUz/ka6py2aw+FGnlgYKMlRZDoX59XbtcYkTSGiHWit4/XhvmmNz233L4Bk4HkfGhCI4HfaRKvgcfGDxAndv2edIfuy6Y+GTXKmRrn/Phe4bRybCth+0H/oGnMif/OkY+lUmpSbe0EAu5+vJpJLYauG3skFjNmgTL60bckmDsbcVMou/xixhkeg3TxM4jzYVAULkpbCszGvQBwlDWaZMyE6jTgb6XchCMQwD4u7Jtq8uRPA/jgppwdEWJ6FM7eLG9VRtpmX6r6QcXBIWKb1YnhbHkLsk0GaNXBYFAtZ215209ywsNQKQZUAIa2Ams5813W8PDa/VXjX6ZjNp1Dyz9FmMjCA3LEK4a9ajJ1awA+R9V4A6HJYlOxPX7VJaCK7gHy7Fznm7p9RBxWTXQYAQUAQTdEhcDxleYFSYpVLMIOQo8zBS3XNlArq2Ules6rWy+5Q0kdZGXXMZM53HlP+i1LVELETv3lvXqbLbp55g+tnc1/kRen2fVr1rz4or0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90483d81-c48f-44e9-19d9-08dcf79605af
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 21:18:09.3836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rMBHlkSmyTS8NWBZn3TxbAg90wpRNUpUniFso7CkFl253P5XUqe1GDPeFm6zTNATBApz5uEHnLtpwxymC+XKDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7354
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_10,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280165
X-Proofpoint-ORIG-GUID: oecxmnUoIs0izRIUktohhPiqPRheAbWc
X-Proofpoint-GUID: oecxmnUoIs0izRIUktohhPiqPRheAbWc

We only need this for the systemd notification protocol, and that's so
simple there is MIT-0-licensed reusable code in the sd_notify manpage
showing you how to use it.  That code looks pretty much OK, so I modified it
lightly and pulled it into libport, with one tweak to remove the use of
__attribute__((cleanup)) (it could be replaced by one line of perfectly
trivial standard C code, saving five or six lines in all).

With libsystemd linkage gone, we need another way for the user to indicate
that systemd is not in use and the systemd unit files are not wanted: so
introduce a new --without-systemd (and corresponding --with-systemd=no,
etc) in configure.  (Someone directly running make can just pass
WITH_SYSTEMD= to make.)

We lose one feature of libsystemd's sd_notify: we no longer remove the
NOTIFY_SOCKET env var from the environment, so our children could in theory
pretend to be us and notify systemd on our behalf.  Since our only child
is in a seccomped jail and is part of dtprobed anyway, this loss of
functionality is purely theoretical.

Bug: https://github.com/oracle/dtrace-utils/issues/92
Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 GNUmakefile              |  1 +
 Makeconfig               |  1 -
 configure                |  8 +++--
 dtprobed/Build           |  7 +---
 dtprobed/dtprobed.c      |  8 +----
 include/port.h           |  1 +
 libport/Build            |  4 +--
 libport/systemd_notify.c | 70 ++++++++++++++++++++++++++++++++++++++++
 8 files changed, 82 insertions(+), 18 deletions(-)
 create mode 100644 libport/systemd_notify.c

diff --git a/GNUmakefile b/GNUmakefile
index e7657d466df5..cbf27b6be111 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -102,6 +102,7 @@ PKGCONFIGDIR = $(prefix)/share/pkgconfig
 INSTPKGCONFIGDIR = $(DESTDIR)$(PKGCONFIGDIR)
 TESTDIR = $(LIBDIR)/dtrace/testsuite
 INSTTESTDIR = $(DESTDIR)$(TESTDIR)
+WITH_SYSTEMD = y
 TARGETS =
 
 DTRACE ?= $(objdir)/dtrace
diff --git a/Makeconfig b/Makeconfig
index f3d47c086f4a..346078598624 100644
--- a/Makeconfig
+++ b/Makeconfig
@@ -218,7 +218,6 @@ $(eval $(call check-symbol-rule,ELF_GETSHDRSTRNDX,elf_getshdrstrndx,elf))
 $(eval $(call check-symbol-rule,LIBCTF,ctf_open,ctf,t))
 $(eval $(call check-symbol-rule,STRRSTR,strrstr,c))
 $(eval $(call check-symbol-rule,PTHREAD_ATFORK,pthread_atfork,c))
-$(eval $(call check-symbol-rule,LIBSYSTEMD,sd_notify,systemd,t))
 ifndef WANTS_LIBFUSE2
 $(eval $(call check-symbol-rule,FUSE_LOG,fuse_set_log_func,fuse3))
 $(eval $(call check-symbol-rule,LIBFUSE3,fuse_session_receive_buf,fuse3,t))
diff --git a/configure b/configure
index 4026a3eafcd3..72eb734a8380 100755
--- a/configure
+++ b/configure
@@ -93,9 +93,13 @@ built locally, none of these should be needed):
 
 EOF
 	make help-overrides-header help-overrides-option
+	cat >&2 <<'EOF'
+--with-systemd=[yes/no]		Install the systemd unit files (default: yes)
+EOF
         echo >&2
         make help-overrides
 	cat >&2 <<'EOF'
+
 Options controlling the compiler (pass on the command line):
 
 CC				C compiler (may be a cross-compiler)
@@ -153,12 +157,12 @@ for option in "$@"; do
         --kernel-obj-dir=*) write_make_var KERNELOBJDIR "$option";;
         --kernel-src-suffix=*) write_make_var KERNELSRCNAME "$option";;
         --kernel-obj-suffix=*) write_make_var KERNELBLDNAME "$option";;
+        --with-systemd|--with-systemd=y*) write_make_var WITH_SYSTEMD "y";;
+        --with-systemd=n*|--without-systemd) write_make_var WITH_SYSTEMD "";;
         HAVE_ELF_GETSHDRSTRNDX=*) write_config_var ELF_GETSHDRSTRNDX "$option";;
         --with-libctf=*) write_config_var LIBCTF "$option";;
         HAVE_LIBCTF=*) write_config_var LIBCTF "$option";;
         HAVE_STRRSTR=*) write_config_var STRRSTR "$option";;
-        --with-libsystemd=*) write_config_var LIBSYSTEMD "$option";;
-        HAVE_LIBSYSTEMD=*) write_config_var LIBSYSTEMD "$option";;
         HAVE_FUSE_LOG=*) write_config_var FUSE_LOG "$option";;
         --with-libfuse3=*) write_config_var LIBFUSE3 "$option";;
         HAVE_LIBFUSE3=*) write_config_var LIBFUSE3 "$option";;
diff --git a/dtprobed/Build b/dtprobed/Build
index 9132c3e31c8a..346cd6aee190 100644
--- a/dtprobed/Build
+++ b/dtprobed/Build
@@ -29,11 +29,6 @@ dtprobed_DEPS := libproc.a libcommon.a libport.a
 dtprobed_SOURCES := dtprobed.c dof_stash.c seccomp-assistance.c
 dtprobed_LIBSOURCES := libproc libcommon
 
-ifdef HAVE_LIBSYSTEMD
-dtprobed_CFLAGS += $(shell pkg-config --cflags libsystemd)
-dtprobed_LIBS += $(shell pkg-config --libs libsystemd)
-endif
-
 ifndef HAVE_FUSE_LOG
 dtprobed_SOURCES += rpl_fuse_log.c
 endif
@@ -43,7 +38,7 @@ seccomp-assistance.c_CFLAGS := -fno-lto
 endif
 
 install-dtprobed-autostart::
-ifdef HAVE_LIBSYSTEMD
+ifneq ($(WITH_SYSTEMD),)
 	mkdir -p $(INSTSYSTEMDUNITDIR) $(INSTSYSTEMDPRESETDIR)
 	$(call describe-install-target,$(INSTSYSTEMDUNITDIR),dtprobed.service)
 	sed 's,@SBINDIR@,$(SBINDIR),' < $(dtprobed_DIR)dtprobed.service.in > $(INSTSYSTEMDUNITDIR)/dtprobed.service
diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index fdcdee14f851..c83f0adb56c4 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -61,10 +61,6 @@
 
 #include <dtrace/ioctl.h>
 
-#ifdef HAVE_LIBSYSTEMD
-#include <systemd/sd-daemon.h>
-#endif
-
 #include <dt_list.h>
 #include "dof_parser.h"
 #include "dof_stash.h"
@@ -1073,9 +1069,7 @@ main(int argc, char *argv[])
 		sync_fd = -1;
 	}
 
-#ifdef HAVE_LIBSYSTEMD
-	sd_notify(1, "READY=1");
-#endif
+	systemd_notify("READY=1");
 
 	ret = loop();
 
diff --git a/include/port.h b/include/port.h
index 427129000b4f..6ce8611e9025 100644
--- a/include/port.h
+++ b/include/port.h
@@ -29,6 +29,7 @@ int p_online(int cpun);
 #define MUTEX_HELD(x)	((x)->__data.__count == 0)
 
 int daemonize(int close_fds);
+int systemd_notify(const char *message);
 
 _dt_noreturn_ void daemon_perr(int fd, const char *err, int err_no);
 _dt_printflike_(2, 3) void daemon_log(int fd, const char *fmt, ...);
diff --git a/libport/Build b/libport/Build
index 48ed99e2b017..822049f5e547 100644
--- a/libport/Build
+++ b/libport/Build
@@ -1,5 +1,5 @@
 # Oracle Linux DTrace.
-# Copyright (c) 2011, 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2011, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -8,7 +8,7 @@ LIBS += libport
 
 libport_TARGET = libport
 libport_DIR := $(current-dir)
-libport_SOURCES = gmatch.c linux_version_code.c strlcat.c strlcpy.c p_online.c time.c daemonize.c
+libport_SOURCES = gmatch.c linux_version_code.c strlcat.c strlcpy.c p_online.c time.c daemonize.c systemd_notify.c
 ifndef HAVE_CLOSE_RANGE
 libport_SOURCES += close_range.c
 endif
diff --git a/libport/systemd_notify.c b/libport/systemd_notify.c
new file mode 100644
index 000000000000..f78bca6e14c5
--- /dev/null
+++ b/libport/systemd_notify.c
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: MIT-0 */
+/* Lightly modified from the sd_notify manpage.  */
+
+#include <sys/socket.h>
+#include <sys/un.h>
+#include <errno.h>
+#include <stdlib.h>
+#include <stddef.h>
+#include <string.h>
+#include <unistd.h>
+
+int
+systemd_notify(const char *message)
+{
+	union sockaddr_union {
+		struct sockaddr sa;
+		struct sockaddr_un sun;
+	} socket_addr = {
+		.sun.sun_family = AF_UNIX,
+	};
+
+	size_t path_length, message_length;
+	int fd = -1;
+	const char *socket_path;
+
+	/* Verify the argument first */
+	if (!message)
+		return -EINVAL;
+
+	message_length = strlen(message);
+	if (message_length == 0)
+		return -EINVAL;
+
+	/* If the variable is not set, the protocol is a noop */
+	socket_path = getenv("NOTIFY_SOCKET");
+	if (!socket_path)
+		return 0; /* Not set? Nothing to do */
+
+	/* Only AF_UNIX is supported, with path or abstract sockets */
+	if (socket_path[0] != '/' && socket_path[0] != '@')
+		return -EAFNOSUPPORT;
+
+	path_length = strlen(socket_path);
+	/* Ensure there is room for NUL byte */
+	if (path_length >= sizeof(socket_addr.sun.sun_path))
+		return -E2BIG;
+
+	memcpy(socket_addr.sun.sun_path, socket_path, path_length);
+
+	/* Support for abstract socket */
+	if (socket_addr.sun.sun_path[0] == '@')
+		socket_addr.sun.sun_path[0] = 0;
+
+	fd = socket(AF_UNIX, SOCK_DGRAM|SOCK_CLOEXEC, 0);
+	if (fd < 0)
+		return -errno;
+
+	if (connect(fd, &socket_addr.sa, offsetof(struct sockaddr_un, sun_path) + path_length) != 0) {
+		close(fd);
+		return -errno;
+	}
+
+	ssize_t written = write(fd, message, message_length);
+	if (written != (ssize_t) message_length) {
+		close(fd);
+		return written < 0 ? -errno : -EPROTO;
+	}
+
+	return 1; /* Notified! */
+}
-- 
2.46.0.278.g36e3a12567

