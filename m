Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642D113774D
	for <dtrace@lists.linux.dev>; Tue,  1 Jul 2025 19:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751398942; cv=fail; b=Sbpyybl48UH9R0sbidtEgyMQdhZqyF2m+hrAh6LYaP7cMnGmYum0w5BhaOo7vRqxU1XsVnTocvKDFKCxOXPjPFj2KuauuMTgJdhg14/39F9ZfjtRXXnTJT1j/SdjN7oStsG4o72ZMPws9ngnVbaD7BxP+QD1a9jNqbOn/iXKwZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751398942; c=relaxed/simple;
	bh=N3ThqCObj9o0dtVtoU0n7DO+fHuiWBbPbBtpsIbfpWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t+FHkiT871bJZHrnVqv7i1HrFL9yzfZq0UTADeF7ILnyGnmk7417Eog7Z/AnWPCJgD0/GYN+37U/wi8T/2SCQM+4nsoWs35c9hHsajt3V1WUaq1Zc5C9yadmK3291FBNPDe9qD1O6KDhNqgqBTzCQLRgJDdOvOJErmhSq2vb/J4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PK+Uyqm4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=S2ilsgK3; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PK+Uyqm4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="S2ilsgK3"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561JNJOu019598
	for <dtrace@lists.linux.dev>; Tue, 1 Jul 2025 19:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=rt0Y0ljWR62CIF7xDh
	Th5IJXXKTLD+s8bAKKonGKPV4=; b=PK+Uyqm4LP7BoOZNNDxrDIz3JJKbURbaeZ
	EkSBEowUa3D1e9YdXqtl7tmvl0bOhDMW0NmTshgGbTeDWAPBhspsu7AaDUdpeV3N
	QDl+Fws2Ya5U65zyLqDyfmFJwrKsrT1g4/7RegqLNn3C7dAhNmZqDpkIqhx5Qbjd
	kCZiGOQVC2FDSjWI5IEyHpYYgHujrSmPhenIdgejvry3/Px1l9FmcZkKZtHnOfwX
	/ufcBsotrWcc8l7YdCaPQEQHX19pEYN5b2X+RMPgSFMLquiFTF3KhEk3w/QwvKXA
	Hd40U7nb0k2KHBSC7B8igfryF4tUZEtpSh7s5H4nC2t8VNVxu+Ww==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j7af5hqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Jul 2025 19:42:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 561HvToX025047
	for <dtrace@lists.linux.dev>; Tue, 1 Jul 2025 19:42:17 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6uhgs61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Jul 2025 19:42:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IK+ow4nU316GlGqib4R+k51BrRespOjjsOnrVikTEtIMygPtlKsAMZNFDfOvIxhE2pi88sCTbASdR7fVUl09SaMvnRmMvJ0nj7hiq+e52rM43oVQG+1uFCuqu4mLMUcd2fJ3ykWYeaTb0wUOqkVt2LNGhFizzpuDY0VppopwZxpChrzKKoKrzqdlWXiyCqmRPnqMMNTNi07IZFgUsN0evGcuaFYdjWj/KeT+zUDFKen6e9qaaYaMcw9YcGyceCSgMnwqcmiOaU/rpOSGP77XrKH5inoVRlJ5Q8K4bQgX06A4uXXJnle3dNDNxU9N0tqyffWYb+9HlCIikbxJo6OwkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rt0Y0ljWR62CIF7xDhTh5IJXXKTLD+s8bAKKonGKPV4=;
 b=zQ/eekw6MJ0LhcMYY/GwG6e7x0hXgxfkqSgSsIqJjIdHZNIxFXVd+p9wGRU7DaVLcFikQCKZzem7t9io62QC7AFx6NORkHuhYzieiracvzeYDCA2jK/whidT8U0ble76kkViP+PaiYAKqo6SXoosQVB7VRCKD6+c8O4yb8IGI1Qisc+z9IZr7ZhNmucolqwNjrLBP60s3HQ9gBtJ9t50AioC4bx7+FYyFt3MZg6udnK2CwjyiVQALGfvTT6AVhKliFVTn++hnq+gzcuybiDbtLZwvZAbdASx6KfRGI+dHYx23l2byKHPsb+bGZQZ5tbQS48CTyf85VLm8NIBnDE0VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rt0Y0ljWR62CIF7xDhTh5IJXXKTLD+s8bAKKonGKPV4=;
 b=S2ilsgK3foPczFFaz/BLZkLE+hevh9q4t0FeMAanY3xRXeAdoZ15ar/ey4Vinwogfiq8F6S5U143WletwfbBWdSKWNJV//TZFnHUeR1YHKQhdec9DZHBOxeJMSKaNj4DoxNjEDmgEj19Ab+7XbV7b1E2Wfz1d4adJ4cSt1+pk+4=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by CH3PR10MB7985.namprd10.prod.outlook.com (2603:10b6:610:1bf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Tue, 1 Jul
 2025 19:42:12 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Tue, 1 Jul 2025
 19:42:12 +0000
Date: Tue, 1 Jul 2025 15:42:09 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v4 2/5] support stapsdt ELF-note-defined static probes
Message-ID: <aGQ6Eb9ThUgSpDr3@oracle.com>
References: <20250623101310.1649756-1-alan.maguire@oracle.com>
 <20250623101310.1649756-3-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623101310.1649756-3-alan.maguire@oracle.com>
X-ClientProxiedBy: BLAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:36e::14) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|CH3PR10MB7985:EE_
X-MS-Office365-Filtering-Correlation-Id: 728a052a-8da4-4beb-65d1-08ddb8d76000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?26+csDzqnXNr57P/CPHYucWkoOqAWsanfRuJvusTZqxg3kFrAKPKhR8eiXZL?=
 =?us-ascii?Q?S6gxrB96vCmHh9ox55niqBy6dBjv2N6bkEBGOhZ5jrQFUR/Rz4kZBPQcqztx?=
 =?us-ascii?Q?E44JfkoFrqY7CMKKZoh5foV6Fup8b8Cq1/VmHlHXXngxwFN+ouSuYilTtLR3?=
 =?us-ascii?Q?TY6Bnt6y8isXm/WpMAbFMo/TIMiILOsehKRb5CP6MLKhYj4m0DU89XehJcIE?=
 =?us-ascii?Q?ltwwik6Zl+Ux0bmBk+1FwIm9+MPZIDkk2rE2lkMQ9FyLLqDGYGyn2aJBHnbF?=
 =?us-ascii?Q?Ng6dhr3Io99oWoN7KmduGk0LKwr44mnG9eqYNQXJgsUPqGmCSeHUabTS48ab?=
 =?us-ascii?Q?tXX6f9yIV3U8sHMIv4daBmXpBGUsglJRzSkvCdS08vrA1zsB8unj7abys4rC?=
 =?us-ascii?Q?a+KyZgO1bAivXKz2MhImGATrTP0SumKsANGQch5XklSFo1IVsaNat2FLjJLF?=
 =?us-ascii?Q?B84SPth+AP1EqqY9LIJeZTslCdwsHYhMrRb7O9FZVT2QAOMPSDbnmFNUCptT?=
 =?us-ascii?Q?MiG0Txc2Eo3g31/iixXXJh8hbPYpp6zjizeNm+upgtoquegX1Mrv9k7zemZG?=
 =?us-ascii?Q?rHRsBKdpeQ+O70hVv0p02H/xzucL5WzuLP0Mu0cI4FIJ/AZc/z/iqwGpHxbp?=
 =?us-ascii?Q?VcmL22YAHLexAw/mf2EdtrwegbKB2/tt4kuLsJ1OdHT4Ob+CYD1LHrgSFsjn?=
 =?us-ascii?Q?xIGZQhYYAm0I2Lnk54Lo7nz8R7gdsq+njwlPoqWV8nQbQksAVDHeP02YftaP?=
 =?us-ascii?Q?JYcRVJ0gNHiUVOXx4X1nA1KWVfMfJnmE52w5nOiJcu0rNKM7AMEpPjxyiDkw?=
 =?us-ascii?Q?YEt57RT0eFIluGiGy93asLGvKeTBb2MnhmT4IHw/P38K+KY1GzxnoJs14Vkq?=
 =?us-ascii?Q?ddlgao9WBU5J5bUL754jZg2+yllWwloIkl9A/xuUbZlS9V3lMDDihcIdFT5b?=
 =?us-ascii?Q?lSpeQMrkthSyo1YsWtF6LjNm9Uuz6vOtFnLP33Tn+VHHy8lohpduvf3FmOtG?=
 =?us-ascii?Q?zbWbiR1khIzKl7J0JlJv7i2M561Biz1hrPJnKhhVtANE2pC9QVTBc9iH3aig?=
 =?us-ascii?Q?7pbtCAKe1/W39V5fvzS/5WPK94Qoz5w1eoK9ItTBiea5Ft8YEEZfMC3enueL?=
 =?us-ascii?Q?Z89McMV6ZSTg/1eGsO7l0JTWaWjUS71YeGdZoJmW0CnZxDrKvh7po2Sz76xr?=
 =?us-ascii?Q?vdgyLpveLk3uEj8rP8WWj2CvDCS5ixKiXz0K4H0Priz5N5mAjmZy7Ueu2Dhp?=
 =?us-ascii?Q?W8SbB7wkeiDsQtFWaOwRVdpVtiVChoamz6OFjdstUVGqee2PtQEp+cR+nR2U?=
 =?us-ascii?Q?7jEn+g+5zUJ7DgWd/Sh15hVEBevO/r0mIvI/tYXpZcYQgZT9QaXuYCb7RjIT?=
 =?us-ascii?Q?qRMkkc5xX3GVMjCW0R7/VaALE1I1QkmGaJvGTBdTaKyujXdgR59BgikVrxDI?=
 =?us-ascii?Q?ZlgxP2eNUSQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kjB9iKrHkf0h2X5ezJ7axP4+lKVL2HPJv5gaXdFazEeGqI2PjwO0idbFBCI4?=
 =?us-ascii?Q?JBECLlGkmk2Obfo7PiDcFnoj1i1R11rkqlQmBN20g5Goxouguyug359p9Jgo?=
 =?us-ascii?Q?B/fQjqYxqO0wQiC1qGp00v/rU7E06xjacV93JRaCczY7hSdx8EUBqMVvnDMr?=
 =?us-ascii?Q?8uKTrm/hoFykA5WET2AQDE1Y9TXrOnKKpcpzV4lZvx4jHH+mSaHCZ7WAQ5nL?=
 =?us-ascii?Q?rIvPrvRMS79sOxnQZUjViaZ1lf0mw2y6WhMk6ZPcMixImkzKXuJ7VnV7/UVu?=
 =?us-ascii?Q?h34gR1wbJMejrNfEaPloJdvAWUd1LuZOIj1Yx1e/ibpnetE/hh29RgA/GRQj?=
 =?us-ascii?Q?ntXqLKgP+nJxNQ84M0J1YJHODn8Mli8GX5xYwyEKYJcaK8rzW2+g51l69ijM?=
 =?us-ascii?Q?rQr6R5hp/eBC1UKHYbRAr57Q6lrjyHKNJOGc/4vUQFD5RaA9ks7eZhtuTrvK?=
 =?us-ascii?Q?2SRMGyAKZ3Jl16BOe49Jr29t3vph6Y/T4q3+aT2Pg43TR9c+N0UvwGqIT9MZ?=
 =?us-ascii?Q?RxdzD1DDosugGpGMrxbBg79xmkLlb1YOdlHzLKZ0+SmXQJOdL9Qudb2DW2Vv?=
 =?us-ascii?Q?Ejdwk12Qlusw7HRBNBHdy01Rw7nohkZWyVlce5Qg9lZvu1M5rK4/vY2qjEI9?=
 =?us-ascii?Q?LqjArrXgG8dAOISfrHCOoVsJbAqidyjr/zKIR/Wp6LY9fd/EY1PY0XR57Tpp?=
 =?us-ascii?Q?DWp5esH76jtEQkdsdLXXbt1tTHwkDuTf6pfg+DGAqXjlSfxiMnCds05Y/YHr?=
 =?us-ascii?Q?tRK+Kb6BYV9ETaysavJGCd5pT+UeMh3dnVw899kujgk4/aCMikwoKjQ3Jojc?=
 =?us-ascii?Q?z5FOM5CaWnNWS0vyISJThncC06HVNlgBF+yQVHGeEuO2e52bswNVlUdMz/cC?=
 =?us-ascii?Q?IY3F2wFX96hISuqrKFuPEEs7HQjlBzPfzyxRUqhhq/A6WRtBoEKjImdv61Wm?=
 =?us-ascii?Q?yioS39AIHIKkt5A7qMf+2fYTJbbBPHy2erBCqkUGXgxps+xcCeUUDT1j1X4E?=
 =?us-ascii?Q?Xy+EafhB5hhl/l8B3t/kd50dVMVqvx39+a/bQ6u1fZZTz5eYBWYWUbI6WW26?=
 =?us-ascii?Q?ie5k1d9D5FCUuILgPkPcx1Zej5r6RWdSwXT3l16LdRgAXA+xZxDqKsIF1NBS?=
 =?us-ascii?Q?kTOZ4kjX0Fqlliz7j/Wd2Sf3u2YBz/uQGn203vX9Ml2b4jDGY1DWBMndJq6H?=
 =?us-ascii?Q?q8KDRAXM8oKDw6i3DntZmcvW/lRdqRSSnnoDAVhh8r4rXt+ej6OtJ6u2OAJ3?=
 =?us-ascii?Q?m8wkeBXCSfPFrT6RqqLoqRiB2jOlOdGyFgsUYF53WseJTXqG/wxmaGI57cvs?=
 =?us-ascii?Q?H/TY2dMLtPnjMnjPoLTvDQRwWSx7AP0KEx5lJ1FQS04utLc5oCKFQCixVG6K?=
 =?us-ascii?Q?9xzPvTeRIUWiuif0yBZyyF3xJ6wOq47ua3Ba9623ldbbzMTNnQgyhMoUGIHJ?=
 =?us-ascii?Q?dyk//W7WAiHXUEFFBVOU7DbfoVpZBBPGAYgCNIog4QOt8Hx5buBjP3veyqQM?=
 =?us-ascii?Q?4Zwn+MRE4kBm/SajTJ3zPT7sK4h0bJUbIAWl5SgbjNa+QEPESapucoVqI6zJ?=
 =?us-ascii?Q?rWddJfL8nb0ZE7gb677+BduLMGmJ02orCc/wvi2csJdnxValhwtuHygqkq4N?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kyjHjb5BjbOByd8BBCH3tqX8xJQywozOxQkLmooBN/3NhTLWxDBJEd6/4EjJixpK25s8q4Oh4QD4fj1Uy8fSm7qcR0A9cP1g+k2mMN46drDoFf6SQ5y9DweqM18b/ySDCbB7aJAeWjAZ2cKN/SfOWyEx5SO78CEx+mWBVZmnj7uK+CwDOcE+WmqI71ZLBUFBeJmHjfeWbGwom+2Vx/b4iU81AsjcLe/+3PzNzPOJ0HhTs4g/a6Fh9id+OL7oYn04JhwBXXPtivHtaUr0pggv3tE62bhcmP1xR6avTdq6E1B168wzztxOYbkiZNmNn4qhnVXWGFWnA8HeKCkx1ymB6V0hDRJE3Zpeucqb5CTDS84W39zbuR4xKyrh6CJl9DVivetBraVqUktZsxbyn4S9teSzBaA5mSgcBV2N4xJZmbLjnrmsKWNcdVW/D1UDO6Rsp/svLfV+sRyXeKD7SupbJBUtnplBCt3LCiGlDlgIaeFm/K38Fol2q1J3rFy5hoeHkBk7CcM+CDiAEhs8Kufvd5cbTu8tTe848UWAIKF987vmm7c2m6y+Gvzx5v5qL+zs46Zse1xPy8fQyo5eylxTqJ/NaNknAP3nfeJfnqv+4pM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 728a052a-8da4-4beb-65d1-08ddb8d76000
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 19:42:12.5391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dOCQDUFWezbCihaba34TDmhN2v+fjX5l+rVKCEwcEDQDIE4m+0cM+5hISJePlrOi6OkpP5GJS9GsdkSSRheU9e3CXri2thmCaA+CEJfdx0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7985
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507010136
X-Proofpoint-ORIG-GUID: Hj8YDMBqcyKojuS8ImNewqVvaYz_g432
X-Proofpoint-GUID: Hj8YDMBqcyKojuS8ImNewqVvaYz_g432
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEzNyBTYWx0ZWRfXxBohmLR4bd8Y sMq77H3wb/8z5Zv7iLcO6UJM2paOkjOnqZLsoy+QfoFxOBmKljJO+Em4kCze32hTA/EiPix3p+F YW+RT/VcsH1n7KQ9pdSOxyuFHREG8mZrQjT/73z+GhbRfvM4ImXGNIQLQrYzj3wGRQXM8RM9HgQ
 1fBJZ//Ag7Ab715ysJoY8aCOcvxvaaNJn0p6LHyN1UdPjJzASpvKzVlzLyKEfQG3bNenak2QI7z /5fxY+TJ2xWvPJ4BPDJvw+dHG1P4h+3vIYJ6a6SPzHidAnXLIL5SmYf7M0WJeCiOBgA3T4Yo1WL lSAl6h+TMVKyMSK8HqANFbtCHXs7JEEn74OgvwPLBolSlde37gRJ+beXORItrM+25W9WIf1xkdh
 90RvnE8kwYwoeQVOGqDqV1VsFGoG6uSAggNA++DWEfqUEoARmmgDSzhu9rDk6LYYHKYP4hYa
X-Authority-Analysis: v=2.4 cv=b5Cy4sGx c=1 sm=1 tr=0 ts=68643a1b b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=yPCof4ZbAAAA:8 a=Br5df8M09UaYpMXVdRgA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13215

I am looking a bit deeper into this patch.  See my other email concerning the
args test that is not passing because it fails to get the function name.  I
believe the problem is that the code here does not handle PIE-compiled code
(which is default for e.g. Debian, but not OL).

Also, I am trying to see whether we can integrate the parsing of the note
format in usdt_parser_notes.c so that we can centralize all ELF notes parsing
related to USDT in a single location.

Maybe it would be better, maybe not - I'm evaluating.

Another thing...  you are performing addr-to-map lookups for every address
(i.e. for every note) even though you are processing notes for a single
mapping in the loop, so the map should be the same for all the addresses,
right?  I don't think that the ELF notes for mapping A can refer to probes
(by address) that belong in mapping B - so that cam be optimized I think.

Do you think the semaphore can be implemented as well, since that is somewhat
similar to is-enabled probes I think?

On Mon, Jun 23, 2025 at 11:13:07AM +0100, Alan Maguire wrote:
> As well as using dtrace -G to generate USDT probes, programs and
> libraries may have added static probes via stapsdt ELF notes.
> 
> Read ELF notes from binaries from /proc/ maps associated with processes
> and parse them to retrieve uprobe address and argument-related info
> to create the associated uprobe.
> 
> Probe arguments can be either constants, register values or dereferences
> or dereferences from register values (plus offset), identical to the
> updated USDT ELF note handling.
> 
> A new provider - stapsdt - implements this support, as stapsdt probes do
> not dynamically register themselves with DTrace.  This makes them less
> powerful than DTrace-based USDT probes, but they do exist in programs and
> libraries so should be supported.
> 
> As well as supporting ELF-note stapsdt defined probes in programs and
> libraries, this patch supports dynamically-created probes that
> are created via libstapsdt [1].  libstapsdt allows dynamic languages
> like python to declare and fire probes by dynamically creating
> a memfd-based shared library containing ELF notes for the probes.
> With these changes we can also trace these probes.  This is very
> useful since libstapsdt has python, NodeJS, go and luaJIT bindings.
> 
> [1] https://github.com/linux-usdt/libstapsdt
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>  include/dtrace/pid.h       |   1 +
>  libdtrace/dt_pid.c         | 288 +++++++++++++++++++++++++++++++++++++
>  libdtrace/dt_prov_uprobe.c |  43 +++++-
>  3 files changed, 328 insertions(+), 4 deletions(-)
> 
> diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
> index 8d4b6432..99093bc9 100644
> --- a/include/dtrace/pid.h
> +++ b/include/dtrace/pid.h
> @@ -24,6 +24,7 @@ typedef enum pid_probetype {
>  	DTPPT_OFFSETS,
>  	DTPPT_ABSOFFSETS,
>  	DTPPT_USDT,
> +	DTPPT_STAPSDT,
>  	DTPPT_IS_ENABLED
>  } pid_probetype_t;
>  
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index d12b7919..6581b087 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -38,6 +38,9 @@
>  #include <dt_pid.h>
>  #include <dt_string.h>
>  
> +#define SEC_STAPSDT_NOTE	".note.stapsdt"
> +#define NAME_STAPSDT_NOTE	"stapsdt"
> +
>  /*
>   * Information on a PID probe.
>   */
> @@ -1262,6 +1265,288 @@ dt_pid_create_pid_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *p
>  	return err;
>  }
>  
> +static int
> +dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
> +		 dt_pcb_t *pcb, const dt_provider_t *pvp, char *path,
> +		 unsigned long base_addr)
> +{
> +	Elf *elf = NULL;
> +	Elf_Scn *scn = NULL;
> +	GElf_Shdr shdr;
> +	GElf_Nhdr nhdr;
> +	size_t shstrndx, noff, doff, off, n;
> +	Elf_Data *data;
> +	GElf_Ehdr ehdr;
> +	int i, err = 0;
> +	int fd = -1;
> +	char *mod;
> +
> +	fd = open(path, O_RDONLY);
> +	if (fd < 0) {
> +		dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
> +			     "Cannot open %s: %s\n",
> +			     path, strerror(errno));
> +		return -1;
> +	}
> +	mod = strrchr(path, '/');
> +	if (mod)
> +		mod++;
> +	else
> +		mod = path;
> +
> +	elf = elf_begin(fd, ELF_C_READ_MMAP, NULL);   // ELF_C_READ ?
> +	assert(elf_kind(elf) == ELF_K_ELF);
> +	elf_getshdrstrndx(elf, &shstrndx);
> +
> +	if (gelf_getehdr(elf, &ehdr)) {
> +		switch (ehdr.e_type) {
> +		case ET_EXEC:
> +			/* binary does not require base addr adjustment */
> +			base_addr = 0;
> +			break;
> +		case ET_DYN:
> +			break;
> +		default:
> +			dt_dprintf("unexpected ELF hdr type 0x%x for '%s'\n",
> +				   ehdr.e_type, path);
> +			err = -1;
> +			goto out;
> +		}
> +	}
> +
> +	while ((scn = elf_nextscn(elf, scn)) != NULL) {
> +		char *secname;
> +
> +		assert(gelf_getshdr(scn, &shdr) != NULL);
> +
> +		secname = elf_strptr(elf, shstrndx, shdr.sh_name);
> +		if (strcmp(secname, SEC_STAPSDT_NOTE) == 0 &&
> +		    shdr.sh_type == SHT_NOTE)
> +			break;
> +	}
> +	/* No ELF notes, just bail. */
> +	if (scn == NULL)
> +		goto out;
> +	data = elf_getdata(scn, 0);
> +	for (off = 0;
> +	     (off = gelf_getnote(data, off, &nhdr, &noff, &doff)) > 0;) {
> +		pid_probespec_t psp = {0};
> +		char *prv, *prb;
> +		const char *fun;
> +		char *dbuf = (char *)data->d_buf;
> +		long *addrs = data->d_buf + doff; /* 3 addrs are loc/base/semaphore */
> +		GElf_Sym sym;
> +		const prmap_t *pmp;
> +
> +		if (strncmp(dbuf + noff, NAME_STAPSDT_NOTE, nhdr.n_namesz) != 0)
> +			continue;
> +		prv = dbuf + doff + (3*sizeof(long));
> +		/* ensure prv/prb is null-terminated */
> +		if (strlen(prv) >= nhdr.n_descsz)
> +			continue;
> +		prb = prv + strlen(prv) + 1;
> +		if (strlen(prb) >= nhdr.n_descsz)
> +			continue;
> +		if (strncmp(pdp->prv, prv, strlen(prv)) != 0)
> +			continue;
> +		/* skip unmatched, non-wildcarded probes */
> +		if (strcmp(pdp->prb, "*") != 0 &&
> +		    (strlen(pdp->prb) > 0 && strcmp(pdp->prb, prb) != 0))
> +			continue;
> +		if (prb + strlen(prb) + 1 < dbuf + doff + nhdr.n_descsz)
> +			psp.pps_sargv = prb + strlen(prb) + 1;
> +
> +		psp.pps_type = DTPPT_STAPSDT;
> +		psp.pps_prv = prv;
> +		psp.pps_mod = mod;
> +		psp.pps_prb = prb;
> +		if (elf_getphdrnum(elf, &n))
> +			continue;
> +		for (i = 0; i < n; i++) {
> +			GElf_Phdr phdr;
> +
> +			if (!gelf_getphdr(elf, i, &phdr))
> +				break;
> +
> +			if (addrs[0] < phdr.p_vaddr ||
> +			    addrs[0] > phdr.p_vaddr + phdr.p_memsz)
> +				continue;
> +			if (base_addr)
> +				psp.pps_off = addrs[0];
> +			else
> +				psp.pps_off = addrs[0] - phdr.p_vaddr + phdr.p_offset;
> +			break;
> +		}
> +		if (!psp.pps_off)
> +			continue;
> +		psp.pps_nameoff = 0;
> +
> +		pmp = Paddr_to_map(dpr->dpr_proc, base_addr + addrs[0]);
> +		if (!pmp) {
> +			dt_dprintf("%i: cannot determine 0x%lx's mapping\n",
> +				   Pgetpid(dpr->dpr_proc), psp.pps_off);
> +			continue;
> +		}
> +		psp.pps_fn = Pmap_mapfile_name(dpr->dpr_proc, pmp);
> +		if (psp.pps_fn == NULL) {
> +			dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
> +				     "Cannot get name of mapping containing probe %s for pid %d\n",
> +				     psp.pps_prb, dpr->dpr_pid);
> +			err = -1;
> +			break;
> +		}
> +		if (dt_Plookup_by_addr(dtp, dpr->dpr_pid, base_addr + addrs[0],
> +				       &fun, &sym) == 0)
> +			psp.pps_fun = (char *)fun;
> +		else
> +			psp.pps_fun = "";
> +		psp.pps_dev = pmp->pr_dev;
> +		psp.pps_inum = pmp->pr_inum;
> +		psp.pps_pid = dpr->dpr_pid;
> +		psp.pps_nameoff = 0;
> +
> +		if (pvp->impl->provide_probe(dtp, &psp) < 0) {
> +			dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
> +				     "failed to instantiate probe %s for pid %d: %s",
> +				     psp.pps_prb, psp.pps_pid,
> +			dtrace_errmsg(dtp, dtrace_errno(dtp)));
> +			err = -1;
> +		}
> +		free(psp.pps_fn);
> +		if (err == -1)
> +			break;
> +	}
> +
> +out:
> +	elf_end(elf);
> +	close(fd);
> +	return err;
> +}
> +
> +static void
> +dt_pid_create_stapsdt_probes_proc(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
> +				  dt_pcb_t *pcb, const dt_provider_t *pvp,
> +				  dt_proc_t *dpr, const char *proc_map)
> +{
> +	char line[1024];
> +	FILE *fp = NULL;
> +	pid_t pid;
> +
> +	assert(dpr != NULL);
> +
> +	pid = dpr->dpr_pid;
> +	fp = fopen(proc_map, "r");
> +	if (!fp)
> +		return;
> +
> +	while (fgets(line, sizeof(line) - 1, fp) != NULL) {
> +		long addr_start, addr_end, file_offset;
> +		long dev_major, dev_minor;
> +		unsigned long inode;
> +		char name[PATH_MAX + 1];
> +		char path[PATH_MAX + 1];
> +		char perm[5];
> +		int ret;
> +
> +		ret = sscanf(line,
> +			     "%lx-%lx %4s %lx %lx:%lx %lu %[^\n]",
> +			     &addr_start, &addr_end, perm, &file_offset,
> +			     &dev_major, &dev_minor, &inode, name);
> +		if (ret != 8 || !strchr(perm, 'x') || strchr(name, '[') != NULL)
> +			continue;
> +
> +		/* libstapsdt uses an memfd-based library to dynamically create
> +		 * stapsdt notes for dynamic languages like python; we need
> +		 * the associated /proc/<pid>/fds/ fd to read these notes.
> +		 */
> +		if (strncmp(name, "/memfd:", strlen("/memfd:")) == 0) {
> +			DIR *d;
> +			struct dirent *dirent;
> +			char *deleted;
> +
> +			deleted = strstr(name, " (deleted)");
> +			if (deleted)
> +				*deleted = '\0';
> +			snprintf(path, sizeof(path), "/proc/%d/fd", pid);
> +			d = opendir(path);
> +			if (d == NULL)
> +				continue;
> +			while ((dirent = readdir(d)) != NULL) {
> +				struct stat s;
> +
> +				snprintf(path, sizeof(path), "/proc/%d/fd/%s",
> +					 pid, dirent->d_name);
> +				if (stat(path, &s) != 0 || s.st_ino != inode)
> +					continue;
> +				if (dt_stapsdt_parse(dtp, dpr, pdp, pcb, pvp,
> +						     path, addr_start) != 0)
> +					break;
> +			}
> +		} else {
> +			if (dt_stapsdt_parse(dtp, dpr, pdp, pcb, pvp, name,
> +					     addr_start) != 0)
> +				break;
> +		}
> +	}
> +	fclose(fp);
> +}
> +
> +static int
> +dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
> +{
> +	int i, nmatches = 0, err = 0;
> +	const dt_provider_t *pvp;
> +	char *globpat = NULL;
> +	const char *pidstr;
> +	glob_t globbuf;
> +	bool wildcard;
> +	pid_t pid;
> +
> +	assert(pcb != NULL);
> +
> +	pidstr = &pdp->prv[strlen(pdp->prv)];
> +
> +	while (isdigit(*(pidstr - 1)) || *(pidstr - 1) == '*')
> +		pidstr--;
> +	if (strlen(pidstr) == 0)
> +		return 0;
> +	wildcard = strchr(pidstr, '*');
> +	asprintf(&globpat, "/proc/%s/maps", pidstr);
> +	nmatches = glob(globpat, 0, NULL, &globbuf) ? 0 : globbuf.gl_pathc;
> +	pvp = dt_provider_lookup(dtp, "stapsdt");
> +	assert(pvp != NULL);
> +
> +	for (i = 0; i < nmatches; i++) {
> +		dt_proc_t *dpr = NULL;
> +
> +		pidstr = globbuf.gl_pathv[i] + strlen("/proc/");
> +		pid = atoll(pidstr);
> +		if (pid <= 0)
> +			continue;
> +		if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING |
> +				      DTRACE_PROC_SHORTLIVED) < 0) {
> +			if (wildcard)
> +				continue;
> +			dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
> +				     "failed to grab process %d",
> +				     (int)pid);
> +			err = 1;
> +			break;
> +		}
> +		dpr = dt_proc_lookup(dtp, pid);
> +		if (dpr) {
> +			dt_pid_create_stapsdt_probes_proc(pdp, dtp, pcb,
> +							  pvp, dpr,
> +							  globbuf.gl_pathv[i]);
> +			dt_proc_release_unlock(dtp, pid);
> +		}
> +	}
> +	free(globpat);
> +	globfree(&globbuf);
> +
> +	return err;
> +}
> +
>  int
>  dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
>  {
> @@ -1319,6 +1604,9 @@ dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *
>  	free(globpat);
>  	globfree(&globbuf);
>  
> +	if (err == 0)
> +		err = dt_pid_create_stapsdt_probes(pdp, dtp, pcb);
> +
>  	/* If no errors, report success. */
>  	if (err == 0)
>  		return 0;
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index 2cbd8910..b91cf810 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -313,12 +313,15 @@ static const dtrace_pattr_t	pattr = {
>  
>  dt_provimpl_t	dt_pid;
>  dt_provimpl_t	dt_usdt;
> +dt_provimpl_t	dt_stapsdt;
>  
>  static int populate(dtrace_hdl_t *dtp)
>  {
>  	if (dt_provider_create(dtp, dt_uprobe.name, &dt_uprobe, &pattr,
>  			       NULL) == NULL ||
>  	    dt_provider_create(dtp, dt_pid.name, &dt_pid, &pattr,
> +			       NULL) == NULL ||
> +	    dt_provider_create(dtp, dt_stapsdt.name, &dt_stapsdt, &pattr,
>  			       NULL) == NULL)
>  		return -1;			/* errno already set */
>  
> @@ -477,8 +480,8 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
>  
>  		prp_next = dt_list_next(prp);
>  
> -		/* Make sure it is an overlying USDT probe. */
> -		if (prp->prov->impl != &dt_usdt)
> +		/* Make sure it is an overlying USDT, stapsdt probe. */
> +		if (prp->prov->impl != &dt_usdt && prp->prov->impl != &dt_stapsdt)
>  			continue;
>  
>  		/* FIXME passing in NULL pcb and dpr wreaks havoc on error reporting? */
> @@ -637,6 +640,7 @@ static int add_probe_uprobe(dtrace_hdl_t *dtp, dt_probe_t *prp)
>  	return 0;
>  }
>  
> +/* shared between usdt, stapsdt probes */
>  static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
>  {
>  	char				probnam[DTRACE_FULLNAMELEN], *p;
> @@ -890,6 +894,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	case DTPPT_OFFSETS:
>  	case DTPPT_ABSOFFSETS:
>  	case DTPPT_USDT:
> +	case DTPPT_STAPSDT:
>  		snprintf(prb, sizeof(prb), "%lx", psp->pps_off);
>  		break;
>  	default:
> @@ -904,7 +909,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	pd.prb = prb;
>  
>  	dt_dprintf("Providing underlying probe %s:%s:%s:%s @ %lx\n", psp->pps_prv,
> -		   psp->pps_mod, psp->pps_fn, psp->pps_prb, psp->pps_off);
> +		   psp->pps_mod, psp->pps_fun, psp->pps_prb, psp->pps_off);
>  	uprp = dt_probe_lookup(dtp, &pd);
>  	if (uprp == NULL) {
>  		dt_provider_t	*pvp;
> @@ -1108,11 +1113,24 @@ static int provide_usdt_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp)
>  	return provide_probe(dtp, psp, psp->pps_prb, &dt_usdt, PP_IS_FUNCALL);
>  }
>  
> +static int provide_stapsdt_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp)
> +{
> +	if (psp->pps_type != DTPPT_STAPSDT &&
> +	    psp->pps_type != DTPPT_IS_ENABLED) {
> +		dt_dprintf("pid: unknown stapsdt probe type %i\n", psp->pps_type);
> +		return -1;
> +	}
> +
> +	return provide_probe(dtp, psp, psp->pps_prb, &dt_stapsdt, PP_IS_FUNCALL);
> +}
> +
> +
>  static void enable(dtrace_hdl_t *dtp, dt_probe_t *prp, int is_usdt)
>  {
>  	const list_probe_t	*pup;
>  
> -	assert(prp->prov->impl == &dt_pid || prp->prov->impl == &dt_usdt);
> +	assert(prp->prov->impl == &dt_pid || prp->prov->impl == &dt_usdt ||
> +	       prp->prov->impl == &dt_stapsdt);
>  
>  	/*
>  	 * We need to enable the underlying probes (if not enabled yet).
> @@ -1144,6 +1162,11 @@ static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
>  	enable(dtp, prp, 1);
>  }
>  
> +static void enable_stapsdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
> +{
> +	enable(dtp, prp, 1);
> +}
> +
>  /*
>   * Generate code that populates, counts the probe arguments.
>   */
> @@ -1875,3 +1898,15 @@ dt_provimpl_t	dt_usdt = {
>  	.discover	= &discover,
>  	.add_probe	= &add_probe_usdt,
>  };
> +
> +/*
> + * Used for stapsdt probes.
> + */
> +dt_provimpl_t	dt_stapsdt = {
> +	.name		= "stapsdt",
> +	.prog_type	= BPF_PROG_TYPE_UNSPEC,
> +	.provide_probe	= &provide_stapsdt_probe,
> +	.enable		= &enable_stapsdt,
> +	.probe_destroy	= &probe_destroy,
> +	.add_probe	= &add_probe_usdt,
> +};
> -- 
> 2.43.5
> 
