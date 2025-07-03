Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5542F0C5A
	for <dtrace@lists.linux.dev>; Thu,  3 Jul 2025 15:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555965; cv=fail; b=X0PFdtAy4BTOnkrusvSsZnEtT4WRqVzVMUcvSPhd/aruSrQ3ZiA6vWSIaHG+rkOGeLOnjhthbe14Uzs8KXemWbinHAqfhc/fsVOUZc3tFnM+hKI8ZtA+awMRc7fcLS266jVKM/UenxEw/Cn0jXaZfupryhDQmnR/doMjc7adprU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555965; c=relaxed/simple;
	bh=KZuD42KZTrQM6ZgACh+QjAXXw16k7KeMOi4WhaObnAY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VarclP0jFTwg3P+19gfdjjERJY9oec7cf/u4MwdNuHKRGqTxRN0dBi671D8Fqq7peDRyUq0EsEVAeaQPuiB/OsSYEzPtzUnFJ5Zx/be8w3FQBxtarrdtJKOOJRWX/Vb/MfOnZw+PlINpPqVdkBgMUJtPkQ+8x058jYmtwdMd0FA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EyoDR3e8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=V5PgEUI6; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EyoDR3e8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="V5PgEUI6"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563DZ56s006304
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 15:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=epL7r4I8Kmu6/vPvibIA00mVhZfZqX66vPTkbVFWhTA=; b=
	EyoDR3e8iCLNkSz3QizRtfR7Dm0UaIrXfmPC0bLBFdj+OH1XFTh7E8P+k9zX+sH6
	z+8RKaQB8igIrOFmc3inkbsAY24U7rE0+QSlRPwBksP23Sx4nP55Qv0Zhw7cBeKD
	A9tGMOZ03ZVF93cy6iIbgE3FXnT9XBGoZmyYkFDxDTeKBwIkz6OE4o57GeIKN7xj
	aCs1LANu9R9R1QR9/+BOAtekvpR1MHQB0WPoXmsmHjQzTjSxjarrhPT67JAmyR/s
	UTFtrVQE43chwQWkv1+msszbJOygKp8h2beG45kuUFvSpK9q2xqk7eyZD8K/Y2tT
	l2pItHImYRnnuaS5grzatg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j80w96gv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 15:19:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 563FHAR5032432
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 15:19:21 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6um1q35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 15:19:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MV0+6ggN0UkVRblIvZfyfUY19vacNBH6qooQDjIvVHq3caLGQjqrOEJ2gVNswMbLbwhwpgwAoRPIFoJHT/Pa78+XzmREOfY8u9qlThR427JEEg4+4Hloa+RXBxaVu3pD2x3fEoH6uZt/QZVH7B0JVut2I1Oo+Pqvg3zLfW5As+VvcGN1qNWU2JfGaiTAD9QmQ38Gj5cDAlG0fgMCGnj89xOcXazp6nOVMeWAibwdAKL5iYxPq7N+Ls5DE3aN+CrEjOkAhVaeqhlQ6BUL3NPNHV5I0w/CeJfJH8oiEjn8sxnM4cjsMxwq8kcdYUWUa/BFosnrpR61bkPsZ+oyBCLUNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epL7r4I8Kmu6/vPvibIA00mVhZfZqX66vPTkbVFWhTA=;
 b=sA9KdRwOjVnx2h9Go0v19Aibpk9339AXrFKB5sEWC3JcBmmwBHpbUyu+8qOQzVb5tq0oKPGmnoeDHusa0Oxhy3PlQNgDVaiFEMrUwldo0JYcJtU8IliY5ITpQgCfjS2CIZpH36tYxgTbAdoKQxm8mOtksqlW82igTqRI9eI0XaDL/3p8ThX17MM4kl0HSi1teoR7cDXujDE5juIwVZgQizjY7ao3L/daijvBs4PyLnaVzjW3fhtljcYEg16kIwtlRegGeGd1JJAFbpAJchpl0cGfEvsOyd7z8+3RPJYYCvulKk4lbLmpdkJDcynTR5ssn1v2NBMzNw1F2PPD3hRR/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epL7r4I8Kmu6/vPvibIA00mVhZfZqX66vPTkbVFWhTA=;
 b=V5PgEUI6b/y0ENXquqxq60aPz7qppnIlNrHWmC9xj6I7smp2jId/4wBDQK68N61JFUF//e4/+FFq1lUtA++bVZz35ONWHxPd4spDTcmDzxmfnCC3WC7HYtL4OrdURaXf3CHNFJC0IbrG4hHRqyXnyvklir9tub0cLkl27+T/zkU=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 SJ0PR10MB4768.namprd10.prod.outlook.com (2603:10b6:a03:2d3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.38; Thu, 3 Jul
 2025 15:18:13 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%6]) with mapi id 15.20.8880.027; Thu, 3 Jul 2025
 15:18:13 +0000
Message-ID: <7e2c55b0-9472-42cb-86d0-23b1e5e01ea4@oracle.com>
Date: Thu, 3 Jul 2025 16:18:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt_impl: bump number of TSLOTS to 8
To: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250610135813.15746-1-alan.maguire@oracle.com>
 <20250610135813.15746-3-alan.maguire@oracle.com>
 <4a079f61-5806-68b8-9051-af918a822adc@oracle.com>
 <d886c84d-f208-465f-a95a-0f6f8133ef1a@oracle.com>
 <2d8d7b61-29ef-04ae-bffd-0dcb0709a106@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <2d8d7b61-29ef-04ae-bffd-0dcb0709a106@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P192CA0030.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::18) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|SJ0PR10MB4768:EE_
X-MS-Office365-Filtering-Correlation-Id: c31327c5-7cb9-460f-54ed-08ddba44d3c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MDBRTkdiNUphTTZ4MWNwTnZwblJrV1NIVnQ0ejN4bDNHNkhWZW1TaGxOZWdB?=
 =?utf-8?B?ZUwveHB6TjVMOEhBcVZpbVIwcXZFZVVzSmEyakVtTXpiaDZOMXA3OGFNaWMy?=
 =?utf-8?B?d1VtUWZla0FnNENYcnVGSkcvMjk0WXVZeTNrWmZKZ0c3Rnlzc1h1L0VxY3hB?=
 =?utf-8?B?cnFDcTdJT2piOUxmMElvZWthUXk0QTZUdzZKZUFqeXBXdis3ZjNkdVJBekR5?=
 =?utf-8?B?bGdXYnB3ZjlFUnlCZ0RYeWVsUVkwNk12dUd1ZlkyYzg4bjl2M0tGallpWTBT?=
 =?utf-8?B?RlM1QUpyclI4ZmJpK3BVelhZREhoeHQyY3J5ZTZ5cFFNbXlwWkFEQ2d6Qmpi?=
 =?utf-8?B?Ry9IREk1Qy9NRlpSL1NmTmxQM2xkdjEyQTFZYTdvZU1ENGllM2FmZDNKSkUr?=
 =?utf-8?B?QzdoQ3F6MFFZZytKRWdZNlZpUTJGZ2dKbFNYeWdSeHJvSnBiZFo1bTY1VGE2?=
 =?utf-8?B?c3VGWFJ2b0xiVmxROUlibm82bisrYng0K2VuZkFsQm5Dam5JYjRCYldiM3A2?=
 =?utf-8?B?T09Ka0lmNEIrS0dXYkRkMWRWUkgrelB1WGhObVc1Wno5cC9jVjY3U3Q5QzYx?=
 =?utf-8?B?YTZZazc2eTNta0VHL2hnSDVnRFBMNEVseDJQOHhkWU9IbXp5VG9kSDhmcCtK?=
 =?utf-8?B?OEZmaDd3MmovcXNoeGo0SnR4WmU5WnRzZXBXY3ZWbzJWMVlNV3NaQ3Z0MW1N?=
 =?utf-8?B?S3NlanNJMk1NTVlNcFowVkd5NGk3RmFLekRKYXAzTEJLYmVuWXlhZExuUk9R?=
 =?utf-8?B?eXNqWWlML2dpMVptWXdVM3NxbUEzZnlodGJESTFnWnhJbnJDSWc1a0MxZ1JC?=
 =?utf-8?B?Z1JXTjhXVURtN2k5dm9EZURaOHpvcStERTVyNytEZHVqMEh3OHJjWjZYUWZv?=
 =?utf-8?B?aUdjNTU1V3RkbjF6dTN1dGpYNHdMeFgxd1dHVjFLU21Kc3B2SnN6VmdLTDJI?=
 =?utf-8?B?MmFlaGp2RnlKdTYzSWRwbGhoNW5Yd3FJUXVWdHVoaXVsZnlLVEZRMWdDeG5H?=
 =?utf-8?B?UGNvWkduVXE1TVMxYkVLN0h6Z2VnNXdDaDcvQ3ZSSHgvTkRmSDcwTklqYWox?=
 =?utf-8?B?YnJOYThXUmRFR3dqZXZ0bW1VUnhyS0o4a3B3aHhoMWlodkxOSFNHb3N6MlZa?=
 =?utf-8?B?Um1pVitOc2xPYnFFUTZaL0Z1ajAyNjFjbjZWdmo4MTVobkVGaFo5eGxhbFdq?=
 =?utf-8?B?d2F1Sk1Ma3o2RFhpKzV3U0RnOEthZDdHcVdrQkV4aVhpQUJnd2JYTXpLeGc3?=
 =?utf-8?B?NmtMZ0dRcnpwS3p5VnZjS3E1UkoxSU93eE80VjYzMkM5ZkExZWpRNTdrNTZK?=
 =?utf-8?B?K3NQSjIrRW93cEZBNUJuSk8rZ3l3b1EwbnY1R0szYzRIbGNUOG05dURDTUl5?=
 =?utf-8?B?bkFBZVNQQlVRVzV4elFSY1lhVGFoTDZMcWNLWmZob3pxdGt2bUZCbWZHVGtQ?=
 =?utf-8?B?RStHTE04bm9aVndUZ3h0Q3VSRFprNVZNR1hoS3FXenM4NXNCRHdscThkbjhs?=
 =?utf-8?B?RmVJVGxwSkhYRlBJY1BGNFFHMHczVUdETHIwSEZSZ3FIZlFFRkZ4bkluUkE2?=
 =?utf-8?B?bUJveUQxS05RNkd1b010LzN2Q1NIVzUwemRFSVhxL3lCNXNzWGozbGtDdVRk?=
 =?utf-8?B?aE4xdHZkYkVnRVJrc1NRMEhxdG1oT2FJSm9VVE1nZ0VGK3NzUkJJTlBsc3ZC?=
 =?utf-8?B?NUVzZENLT0lQQUo1N1FRbURsam85TG0reTJHVHN3WGMwaWw0dmtJUTgyLzVr?=
 =?utf-8?B?SnB1eTM0N3NPNWFKQW9SQk1hdGc2RUJpaW03U1NEZnRvNnNxcGZrTjFtOUht?=
 =?utf-8?B?N0hwQXZReUg2eFBHb0wvS1lrU2llL0llNUxya1JxN2x1eHY1ZGczcHlzSVky?=
 =?utf-8?B?Z3pjVEMxMnNBMURsRVhDTGtTMGlpL1lDV2hKVm81aDBxck9IUnQvOGx3T0c5?=
 =?utf-8?Q?mR7Q6NLVd/s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWVFWjZpcWhKb2xGZHhNUS9kYi9UOEducWo3U0ZyU002OWNDQlA1R01HaWZS?=
 =?utf-8?B?alR6UmtxemZHdWR5WVFHejQzbU1ZVXFXWHE2Y2I3ODkrbDJ4d1NIQ3Z2OWZG?=
 =?utf-8?B?Y2wwN0dvc0dpS1pub21jNTFwM29RVlpjRjZ4Q2xRZnU1MWpCbjVMOVpPU2tL?=
 =?utf-8?B?N0VaYXB3Mnhhb2tCamdVME1ja2RLcFRrVDYvU1lJRk5qREtaaU5Md1V6bEpV?=
 =?utf-8?B?REdrbFlZTlUvb1dOM0FsUGo4aG13bjdXbEVYK1Z2anpNYUdaaVZRUWhiR3hC?=
 =?utf-8?B?aVBaV0YyS2g1RDA4K1FiV3h0TmdBa0R0b3BqQXhHYzVhRkhqMFVQMkJadnFN?=
 =?utf-8?B?WHh2K2prUHFqRU9CRnRhOStJWU14T2l4U1lRQTNyaGpiMmdtSzBMempQcGFE?=
 =?utf-8?B?ckhkRFVpK2drUjMyRzlOaWVRMTlVMC9kU1J3cGhhaGc0UHN6MWs4TkxvQTZt?=
 =?utf-8?B?SHp2R092ZzhlQVJaRjlRZEcvUk5zQkwwRDZEb0dkTExKZ0ZqTHlUUWJXRXpl?=
 =?utf-8?B?TG9GR01Gd2lMQ1FnUkZLVk91ZkF5S01qVThySFBMbE5WbmhqU1dsZVZBaGVI?=
 =?utf-8?B?eWtaNzdNLytLQTNVOXFKRzU1U2h6RmVDTzJZVnFDRHhJVVIzS2RjWDZGd2U0?=
 =?utf-8?B?ZWJWYnlEdGR5bDFXU0lxb0dzeGxNL01Ga01xd0lrOFpoamNNc2tBY2hCT1gz?=
 =?utf-8?B?UUJCMkVRQ0U0UVQweFhZRFBiQTZ3eWpvcjJ6dTlVRGF6dnlmejQ0N2NGQ01l?=
 =?utf-8?B?TWxDZG9ieWlNWXljc05YWkpaT3YvZlBxZGFYK2J2TkxJMlJxWWErRjF6enNw?=
 =?utf-8?B?SklXRjFHSURWbHgzd1kra0dVV1lDZmtDZ3JadGNtNStGZ252QXlDNWRlU1Jp?=
 =?utf-8?B?Z0FtZmdNYXlCMjNhaFhMRVpaaE54NnFHUFUwaVk5WnVaZ0tmMzg5b3pDUjhN?=
 =?utf-8?B?a3BsOWtxd1ljcjBiZXc3YXZob3NGQnZiUWU5eGlvOTlNai9OTSs1dDc0Qm50?=
 =?utf-8?B?RzBZVjJrcno1UElZbko1eEZoQUtTdHM2NWVOR0k5c0tWcC84TmFYUWg4OGtP?=
 =?utf-8?B?Nkk5Ui81Kzk5bXNhdGxZUTBtR2E2VWFxSzQzdmd4SU83ZThUMG5RU2JpNUYr?=
 =?utf-8?B?bGdWZzIxbUdaRWJPWUl3TzRLZ25kVjIrQUVzeEJaVkI2QkZQRERhZWNLT2Ew?=
 =?utf-8?B?cmdSdmNpQTBtT0tBb1g1L1EwN1JtdnhsWk45TzNDRXg1c0wrNGZTRk5QZkl3?=
 =?utf-8?B?VHpHdkJmazJOWmhaQkZhN0dMZzFlM1ltOEJnZzJsK3Yyb29HeGQ0aDZOV3FU?=
 =?utf-8?B?LzFuamIyWnY1OG85Y2pWK1JEVWdoK0FxUld6a0trYUNmT2VUUGJxbFoyTWF4?=
 =?utf-8?B?eWw1T25vL3lkb1g4cU0zby9jUllKblFaSStNdkl0eUZaWjdLNGY5VGgwNWcy?=
 =?utf-8?B?dWFmV2JTcmZqNnN0eXV3WkdDTjdNcmF1a2dWaVEyZnByanVBOTdnSDQ0NFNh?=
 =?utf-8?B?NW9DMmxCRHpiYlRXQnNwWUFtVU5LRDJWZXA2UTdmV21sdTc2WmxwdmhBL1hU?=
 =?utf-8?B?dGF3N3Vmc2p1bDYrTkozNm1xVjFZbnZ5WWtLV2lFOC9HKytqNHJORDBFLy9p?=
 =?utf-8?B?ZFF3cElVTzgyRGRtM2lKZTFXWVgvam94MXhCWm1PcDd5ODBCU2NoeXdwYmhD?=
 =?utf-8?B?Q3huaTBrVHpoYWhyczQxSmtYR05zRFJHbEhpZ0UzUktsc0tiTjdkbHZlRWxQ?=
 =?utf-8?B?YUtkb09wbkhvUjRRakszWUk0QmUyTDlIYnd1UGFiUHpSMituZFNXbDZNTmxj?=
 =?utf-8?B?aklRY2JqVEtsWUpQWXgwTmJ3OHh0WmVmYk9HMHFaVU9OQUUvVGVUbDBrWGJh?=
 =?utf-8?B?SmNvemZ0aXovTW00bE9mR1N6L09QMXQ5WFRYWEJPVGYyUzBQRzVxUFI3QjNR?=
 =?utf-8?B?RDI4ZkdvRkU2ajZtQ2pPaG93dndLSlRsMVdOM094UUh1U1Q1SkE0c3hpTUk5?=
 =?utf-8?B?b2lsNFBjcFUrSW5CRDgrMVdHUldIaHBpRno1QWI2V0JHNUJpdjZHWHpVN1pI?=
 =?utf-8?B?dDdWOTZyVWwya25MRldOcG5PYlhWWWlYaEtqdm8yaWk4bWEzMzVqVy9BQlp5?=
 =?utf-8?B?cC9Dd0ZOcEhCVmNnYmxBaEpaRjlRNFEzVGQveHhaa0VsNHloelJlWTNQc2hN?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kpY8SGGpdQj8abKFL9dFrSxISmOv+a3Zv66A1qJNt9F7z5ByioCXXF/JqeJkrQOSlYbmCf68HR3y4EAW+agY1ues7ByUkoip9u3d28As5UMbI7+iXL2zWlD+9WXOj0wDtHAe363lV/UZSI9t2Fs75e65EiPo+o3NETIku4rUmtku5lK+jT6DsuugLj8srXMFl9Q9bYzc3lTRuWh67PeHjvAGNqIjuvwhYDAsFzphjfN9euMm1M/RL8N0Bu1mD1lww1L/EcwAsrJ619lzZBkMDBEsABPR7BcbDQskEB+eatyEJ9hznAJWb9a53IQI4n3sdUQGO4mKkBFWafOwbJU+qqYlptp4Y8JCBwOCgzEssK0MBhjXNLGpLP6j0dakx3ZThunX2Va6tV1LmZvphOdyQYO1jCGFm5UER6yPGWhXH0ViLXn9ER71z5WwXTdduozbuuCjsqUAJN5soi5eSOftaj5mDlor9Q8uzI6iLRCNm/y0QNQ2ipIynPNSFXLwShGHl+4EI9sB7kXC38oFVR/RRAEQYwlEQ/YQaCb5zdZunsmDO6oVZPJo3v+ascNtJJh8HKrsFuoB3+cT1N3ln2OWhtZUSF0I1viX+X5XRlqOJOU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c31327c5-7cb9-460f-54ed-08ddba44d3c0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 15:18:13.1718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KirSQQ6MGBiQKcl6fIXoYO4i2k6vpfP7RaxLy+UMx7bG0Db5ZBXd4Uu+lBfFVL8Tl6celVvGE6O/eGUtC1H70Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4768
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507030128
X-Proofpoint-GUID: Dm9fLuZNthkCZyXljYnuMbHqO5rjxV9U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEyNyBTYWx0ZWRfX2nziLWvpbbhD b7LEGdW5frYFtbLegulIUKnjNbNv0H/IA4MLmeh4amINVPyxQO7WXl2TpeLZOIaZoJF3t6BwG+9 XBUa9nUfjNSzPQG4VQBRaKy4wP8J9gpc3Fn4Q58VsJyTHiWQDp11s55RgEWYZlAcShjvVlj6TOP
 Ln0ubMOlrMYfLwCMCrY+BqfTjHfRR4pH5m2Ca+3fWCziX/Y94hGqqAPdAax3vqDsM3x7s3iU4Wu 1N3evfuH0nTyWwivDJ54tXi+lCgeh79En6JmNEFkYO9RaKdhGH3NPsglT2TinP/Rd3mikupJeko yXL7YtxJNVavWY+3d79XJSMd+3GTT4roOsMqREuRAU0nJ7lWcp3EHb34hhArSzmYjtRxl58Ux7y
 qUnm6kMnMAHwh5V2insPuj5Ay1ax0olfpKvydgZkxPcmj0dfY+2lbBKKe6zZZ+GkWXkcmOUS
X-Authority-Analysis: v=2.4 cv=D6hHKuRj c=1 sm=1 tr=0 ts=68669f79 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=qjFm4ReeQWIL6r9hJBIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12057
X-Proofpoint-ORIG-GUID: Dm9fLuZNthkCZyXljYnuMbHqO5rjxV9U

On 02/07/2025 21:22, Eugene Loh wrote:
> On 7/2/25 10:52, Alan Maguire wrote:
> 
>> On 01/07/2025 19:31, Eugene Loh wrote:
>>> Very simple patch, but one key problem.  The changed line is preceded by
>>> a huge comment block that goes to excruciating pains to explain why the
>>> value should be 4.  So, I'm fine with the change itself and I think the
>>> "Because of the complexity..." sentence in the commit message can be
>>> dropped, but the comment block in the file needs to be updated to
>>> explain (with corresponding pains?) why we need 8 (not 9, not 7).
>>>
>> Ah good catch, forgot to do this. I actually think 6 is enough.
>> The additional seems to be a result of the various complex inet_ntoa*()
>> calls in the tcp.d translators; some have ternary operators with
>> multiple inet_ntoa*()s. The origin appears to be dt_cg_ternary_op() and
>> that has the comment:
>>
>>          /*
>>           * Strings complicate things a bit because dn_left and dn_right
>> might
>>           * actually be temporary strings (tstring) *and* in different
>> slots.
>>           * We need to allocate a new tstring to hold the result, and
>> copy the
>>           * value into the new tstring (and free any tstrings in
>> dn_left and
>>           * dn_right).
>>           */
>>
>> So if we have a left and right ternary and both allocate 3 tstring slots
>> for inet_ntoa*()s that means 3*2 = 6 tstring slots should actually be
>> enough. Additional testing suggests that is so; does the above make
>> sense or are there additional things to consider here?
> 
> Ha!  I do not know;  I prefer NOT to have a headache.  But maybe there
> should also be some tstring stress test using inet_ntoa*() and ternary ops.
>

sure, I can add some tests to operators/tst.ternary.d

>> I'll update the
>> next version with a comment describing the above anyhow. Thanks for the
>> review!
>> Alan
>>
>>
>>> On 6/10/25 09:58, Alan Maguire wrote:
>>>> Because of the complexity of the TCP translators, more tslots are
>>>> needed.
>>>>
>>>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
>>>> ---
>>>>    libdtrace/dt_impl.h | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
>>>> index 68fb8ec5..10424f9c 100644
>>>> --- a/libdtrace/dt_impl.h
>>>> +++ b/libdtrace/dt_impl.h
>>>> @@ -218,7 +218,7 @@ typedef struct dt_kern_path {
>>>>     * - cleanpath() holds a prepended '/' char, a string, an appended
>>>> '/' char,
>>>>     *   and a terminating NUL char, or STRSZ + 3 chars altogether
>>>>     */
>>>> -#define DT_TSTRING_SLOTS    4
>>>> +#define DT_TSTRING_SLOTS    8
>>>>    #define DT_TSTRING_SIZE(dtp)    \
>>>>            MAX(P2ROUNDUP((dtp)->dt_options[DTRACEOPT_STRSIZE] + 3,
>>>> 8), \
>>>>                72)

