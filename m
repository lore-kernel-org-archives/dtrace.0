Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F32204937
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729281514; cv=fail; b=BK0Ke7mhC3O4M4tU+qUtZffLRYuuVesROP9RBRHNV2+3Cf95Z5Veg8lFmmu/XoRypGFrCZA3kam2Bz/uNSvtVwKy6TVWzLS4iBYDAIyReALCqrS4G9LFgfm7YRz1iVhX7onAjwRdJJOXrXLV9fjaUdDgUg6szuSCpsVGLN7ksqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729281514; c=relaxed/simple;
	bh=T1LW8cLcZoT1x9b6KZtj2fh1ZkBvqKpaTWGGyyjgiYU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N9kBum/4fpLR1aTNURvvbRi7blWNWGa4JMo43Ti1495wJgOuw6uJ+UQ/DmBPSIMY1+B/PHEhfnNLsuBfbl+1r8EQKhx6uJy67eF7xI4CR13flwryLpoUy8Br7EH4Udr3SaE02AnvKnE1J8pCHlArWXGjw2i8vCzDhY7M3yfvcmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BnBMH2wR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uZg1BLKK; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BnBMH2wR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uZg1BLKK"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IIfjPL013817
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=O5SZyLB4Vtca8LqhCFllHvMXLr6+Lp4qT39LRW+sfuE=; b=
	BnBMH2wRoy93XL/BbxZ+Ea6ELWtm+bR+XUbW8PpYCNvhCsAocHxpLuIgT/kHgRpE
	d4Hme2a3GPOr25Ddzii+wF9jremPOtM+qYbjf+dULJ8zFlygNLRUOlZXw/iadEwt
	U3YhYE1jLVc2pxw5H6WHC86s7yL4J1Hft6IdPfn2xkCyBSq0gl0QB4srBX/SvICs
	ypdjGqXaTl6nF4YaPHVO1JFqIsVAaG//VFQyN+T9JR4HilSx4+vPClwk4QZ7p3Y+
	XsdBBzs+rRsrumVsiWdoLfOV0fZMw4KuwGQSjfNvWQjSg7IKNBjGR29byp4Ll3zR
	0YmgyRddfu8Cpin2LqJxrA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427gqt9nkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49IJMeiG026416
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:30 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 427fjc130k-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W84h64pyBvaTKMYfzdp83QWPvuH1DSjcEP2eSQGPJwzgHqc7ITIoCqZs/XitXDrTgrDsLvSiaQwy9iCxhCFLBuACnbqtyqEpsUI8TY0kKL4c7off+A3Lm48iGgS7KInciWn30ftXZEZlpAAwhVSf12uOh8QHikwR+3uJdbJsCclyCEaR3TxlJOPdprrQBxbQQF0WOVNcWBC44JtStstvAAXhrP8dxI7IYbUWcWg9yW5RJ+Ev7iHddiuZnMiJxxUMANebAkPVaOWUf9QSFtXdTSN4gxfYh/IG2c4RKMbl/bicZ+g+zDrSV3/9aviPEfjqkbFXGPgmPe4nN83iVnCTiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5SZyLB4Vtca8LqhCFllHvMXLr6+Lp4qT39LRW+sfuE=;
 b=MxS/ARMLI75qknX1ACHZD5P3W5ijDaXhr1rzcdaVZ0Xe330DHc6z/11dmuGWPuK/4wU+TVXATk3MfZahkeE78UzIT1XzDosR7vnPraj98SP03iGZ/hqXjWNkaJkYHSPJSy0b1JAW3lUryrYiBr5xeBQIQhT92WDejYBlviiFRikKLW80kZy9X1JOWCRNaNFXc4F3P4RmKiPsC31royMzEkJP3dKGPe2uVb1/GwiMmqR+W2SO3xsXzBp9WZ4EcGXaEKhK3QPZWRXowmvA0+SYSFS1wqARUj+wY5BI6ArVyBHWJhqY3izbnCIA19J15267fh2lwFXj7KquTZU3blwJWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5SZyLB4Vtca8LqhCFllHvMXLr6+Lp4qT39LRW+sfuE=;
 b=uZg1BLKKlYEq3DdhfZ305K8y9j3lKtnnz3Gjab1Aa8cRX2NaMbhpaa0Gsoe1joyvRm1pPPIZDjRa+fBZk2LZsXQZCNrzyvEkT/B9DifJPOwkdrDGgVecbSwJZipCWrnCwWs3fSN/yc9KKOEFTZoYA/TJCbPflD1BbMhM7sSgEC8=
Received: from BN7PR10MB2723.namprd10.prod.outlook.com (2603:10b6:406:c7::26)
 by DS0PR10MB7202.namprd10.prod.outlook.com (2603:10b6:8:de::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.26; Fri, 18 Oct
 2024 19:58:28 +0000
Received: from BN7PR10MB2723.namprd10.prod.outlook.com
 ([fe80::59c7:d2d7:d428:51ac]) by BN7PR10MB2723.namprd10.prod.outlook.com
 ([fe80::59c7:d2d7:d428:51ac%4]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 19:58:28 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/6] dtprobed: stop skipping zero-tracepoint probes in dof_stash.c
Date: Fri, 18 Oct 2024 20:58:05 +0100
Message-ID: <20241018195808.270688-4-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241018195808.270688-1-nick.alcock@oracle.com>
References: <20241018195808.270688-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO0P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::10) To BN7PR10MB2723.namprd10.prod.outlook.com
 (2603:10b6:406:c7::26)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR10MB2723:EE_|DS0PR10MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: e6bfd45b-3f2d-4604-92ac-08dcefaf3bf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LgCyC6eiICqaZ0xgU2L2gC4LTn70ZKS2NWVIh3r6w2ZHep4/cPIjk2ycgrWR?=
 =?us-ascii?Q?ZaUOZLfpMSBtnziS4W39XFnjcQccdO02mxMq0dPmuFbZVtRr36xsZwHQyqGE?=
 =?us-ascii?Q?Pu8ZGXhIo3UlR/9yS2CYOgT5jVsfQfCgNLqPDnzDebccJjtj2Sg6jPhIOOUy?=
 =?us-ascii?Q?ws6SaPZw1xF5cwFmVfMV4kq6neJZ3buwBYoshhsYfyb5CstZ8yGrfNQuJhMw?=
 =?us-ascii?Q?phDGHSXW/gP0Zr54VEX6UpE/9vNOaYAwRQEhBZLHUYEsXCO+HF42g+ci/Eqv?=
 =?us-ascii?Q?uyqwFHzVcn690jzhxLy4JEhHKld0SdLkvcbX9CVmGUrBXCyryMZbEmm9dO9x?=
 =?us-ascii?Q?ejQvSdFUEpoKkCD7zGcLH85119IxUWANm2yN/hovXKcDHxpmzoJI4Pp99CJy?=
 =?us-ascii?Q?Yub5/rsci6FKEeukgoXY9ZfR6jF8y/stYFWXmrlvGqeAEjpCPipcMe27Ou/M?=
 =?us-ascii?Q?zvjS39U7AyojlZ0xpb9jxxysLSfSegyJ7/8F4E6rPjVmRe7S3PY1uNlu/LrK?=
 =?us-ascii?Q?VcbCo48aSPmPJWponU8mcu6PK0jkBpklr59iDm1gns8K+5KcBlcUPhvuo7g4?=
 =?us-ascii?Q?oyzuJRyZz+ulf52H/SyO6acAsHA6IVfsbod/Dj6wl9L/I8FFoqsPW/pgQ6Fm?=
 =?us-ascii?Q?0VyPve1xy7LVf+CYvVzg4HnzrU9vJK0wsxbodIggC9IT7qjWTDUT9VFFa5Wj?=
 =?us-ascii?Q?wXGlBZ1oIeN5oIanM3wcwV/RfssY4p6sEdltqT6LsgncXZRNgCd40LErj08v?=
 =?us-ascii?Q?rzaTc503Ob+Z9tU7EPTXqqKjrwTjaE1q2Xre2cp1+bSsIjEgPqeT7I+2VLmm?=
 =?us-ascii?Q?ZNkWcuTlxkvnKIAZkeMGcCJc6lZN6nGZMfz9AazBhx7SsAwEmCRWWftfGqcg?=
 =?us-ascii?Q?lpuarHnVyU6lfcLomvf65hN9OtecXKJmB6jPOi2k7FkkavoQW54FT7txLWzk?=
 =?us-ascii?Q?tW6BmNqMccbxQkz5wkZuVUA3MxQTPIkKZoLRHB/aC03PFuJxJA+mXU2//YHQ?=
 =?us-ascii?Q?Qi2lZbsqzB/cvx8r2sXef1Wq9XITd0MKT6zro1JChF2Zzn0nkFomKVdHfyLi?=
 =?us-ascii?Q?Q2/xAt9Ug5LY6YSbgWlBlkjZ8s6M2FSU7VDGr7CXTRcg8gwVlsBcXv2m7VrG?=
 =?us-ascii?Q?toWEBdd4hc824EZW9ZhxQ+EID8UZ6YWqEZa0PgZqsfJI/eDQoTArUIQSB/VC?=
 =?us-ascii?Q?K7eWDYnZNAZXf7OdGs/73PxYJSHUAt1XacbV+LcNGbpLFFyBHQEj4IoiTC+3?=
 =?us-ascii?Q?9VyfdypoUDSclmOjH7mkLnBoxhOGclyd+yfXPZdWiHOVCxoQAGMfmWaHYxjj?=
 =?us-ascii?Q?OfB1x4H6evIZFm0gpyN9JVnP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR10MB2723.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+xx3jrO6hVaPARjloczYLK/wgmQd7RvHpOOu4+BCI1AuG5O3c1NfWNx9aW5V?=
 =?us-ascii?Q?/sD4y5RBtsV51cX0nqTcfk0Qe7whmRc4WxpAsh7aLFBiPfytVONYKHx/8RGJ?=
 =?us-ascii?Q?Q+fBvHoHiAx+LPIL860u8+vqSn2gyrHzytPE8rQX/Gx8PkRVhvzMll1KhjmS?=
 =?us-ascii?Q?ZaZ473P2JGOx04sPLkrcnexrfkGcJ8fHA6nqftBsHQ6zq3z7rq9+JPV9jAhH?=
 =?us-ascii?Q?v7kASxGCziQ8/Ir4m042+TCTwAUVinLPp6yPKP0ZAaVTW5JwEPqvvbEsuR4R?=
 =?us-ascii?Q?xYYbZNcvOi86odXe2SRXsH4ZDuLmwZ6MMhZhKoghbHPRxgBQXA2/pRbV+vn9?=
 =?us-ascii?Q?PwAGvNKuJt/nRamTuQ6cjnEIt/e5p2n/gTKW8yOU0c0Yj477rSZhOpEYgLlw?=
 =?us-ascii?Q?4kzM1dtvAwRoeBMTAB+iT7YVD6sraSyLGaVTpeMMQsyfXF7uP7f6s9GYGmm3?=
 =?us-ascii?Q?krtKAa15tUgCwjKOOu5Zr23vQM7dCQPBQx1LOfn+MtvIJHx8uXdvFuk6ayIA?=
 =?us-ascii?Q?rAeYEmw8ujob3MPO94gKXOcEXxZTGjtIJDmRQWs92oSzEALomui95Q8tPeMb?=
 =?us-ascii?Q?RHlGLy9NvF7V+wgtDF94f7DUxBamF6QGQw6EKztvmZXew3pzHmbxcL0TQsp0?=
 =?us-ascii?Q?YEcsSfKju5SK8lot/jyazK1m2l5H1Jc6l+8Q2laHH6q9CUD+Ai4AuJm+zmvB?=
 =?us-ascii?Q?r1H8z26zkIb0ljBEUfTUyTl7G9o0DUX/ikk/96TaPzWpCwbmg736rt6CMuJv?=
 =?us-ascii?Q?Lh7fceO1eMgIt/QsV1BArTYo7XGDV8NO9RL7xmtGLnB2pjtkfIV6qtFbh0At?=
 =?us-ascii?Q?w5PLiyNwpTD4+IvSpSit2O0MrrEuVbNqWdxiHCbBW3jjme7hUGQseVqW0mHg?=
 =?us-ascii?Q?QnlnusDTaZw3KPsTzizK3r6YsgMXtR7WmedNGrCXNvxUVJq7nfF7zXHm0Lvb?=
 =?us-ascii?Q?4yRGlnQlgArITns6sah+zoFt/EU/VBTgyv3pHi/RD00K+K8NQAL+OiEGAWvw?=
 =?us-ascii?Q?Os/qH1U1qqsFg0MFspPSlcnHILNN/95+TfHyZcFbrgfQeNsOSpfqf4sMbDEL?=
 =?us-ascii?Q?MnKB3h8glV1ZFc5EXnegiDcOWGDrn9DVKbA0dwhz0gkLmoItEZHdrAGTDELa?=
 =?us-ascii?Q?1DtPFlq5ITQdL6BKrGE/wMu7EoXI9H2BODuyRQhMRn7u9BTCRpX9HeiYglLg?=
 =?us-ascii?Q?RozhSpr0Nm4oZYLWZMGIxzfuokTVi+6JGBjZN4TCoy7jDOAOPRHty5xVR76y?=
 =?us-ascii?Q?C82AP2GcoX21UIYsKH46CXL7DgHzvXvoO1MQy03Mmhd5lf24xaKNbvvcdQOY?=
 =?us-ascii?Q?NIYEiWRdGB+yY749wymLGkKtBwIxkaRUaomEnQFEOAVvXM6dW9509B2z/Res?=
 =?us-ascii?Q?r2RcTOWH5PWM8w55JOkq3Tbev0a2WJ7YxlSs8E2/ZwUysQDqs6dCkkICq58G?=
 =?us-ascii?Q?J+z7itnQDyJ0EuZQoYYhWe48ENMK32bJFL8fl5FL3aIPKGtYvoBSbugB9i4G?=
 =?us-ascii?Q?xInUiT43cwIHqkoq+fjOHdAj2VxwjimjA5QE3v/LyLrs4jInrqFooDCH6DKk?=
 =?us-ascii?Q?ZOcWDGrKwgVTOZjOHovrl1CfBOZf0A2CoFPmn9DSV4VgnbeGS98zesBfvpD1?=
 =?us-ascii?Q?Cg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QX+32Y3sknbBzNCsAXWd+jnwCe1jKVB9+rnMxbWcoh6u/e2Dgux7+oIQBVZbiC4DaEbZhdfpoo8RvajQ2tv+073DaCnMGlN/JmSPKCX5+wdXZAF1tu6xmIqhd/M4qfohns8F18YvjQVR22ML8CB/mBbCSGqOLbYS6kWpgjJO5bxNrnUUhz79Q5RSPpFfIj4ZS4Jq4ur39TwSbxiDl9g597bCh7dIJst4xF65Q3CiHMUE4duAb/M4Z8C/Y2/FtA96p+cJoWfyGpqDs3IgELZvHvxj4MQU12JOxDVAwvix7Cuj4/YfGOxPYGUoNVyERQ/CQDskECkq1voUrvcslQPruL0W1UwAmTrpeOlF97U4xnMGcHu9JjxC6P2gR33+a9qvgbsQrx2RtJtsPPoiXCvcckU4qmi/HdjM0Xh64IK0XBqfTzRfyHvzE0vd8Xr+xF+G7v+eFA2qOVIBS63l/Q52SDS0dSWbff6KJDDsBkhcsd5e68GIy4bwS74NL154EB4Csf50D40VqtsOM1DO2gM6igRKASqbNywjEQMetUqdBbTnb0Rj4hiHqqyUPUfj00nCzo9ZU0O8LQiHynu1nswepg0g1LYtxssKpYtGf8LlD98=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6bfd45b-3f2d-4604-92ac-08dcefaf3bf6
X-MS-Exchange-CrossTenant-AuthSource: BN7PR10MB2723.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 19:58:28.4766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XClwW4njmJHfOIhAlXQI98k9Tf3yo+yY731Aap5X0rf3MYlx5GMWE1ygGYSMOeWwl5CigaDzFgfkD+iee6dKAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7202
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-18_15,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 mlxlogscore=956 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410180127
X-Proofpoint-GUID: uVVVtbHHvwbZaSswd9G1ftmqyWIKCWJz
X-Proofpoint-ORIG-GUID: uVVVtbHHvwbZaSswd9G1ftmqyWIKCWJz

We already validate that they don't exist in dof_parser.c, so no such probes
can ever get here.  Handling this impossible, untestable case has just got
harder, because we'd have to skip DIT_{NATIVE,XLAT,REMAP}_ARGS records too.
Just stop considering it.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 dtprobed/dof_stash.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
index d9731844066c..cc2284aadbc0 100644
--- a/dtprobed/dof_stash.c
+++ b/dtprobed/dof_stash.c
@@ -585,12 +585,6 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
 			if (err != 0)
 				goto err_provider;
 
-			/*
-			 * Skip probes with zero tracepoints entirely.
-			 */
-			if (accump->parsed->probe.ntp == 0)
-				break;
-
 			mod = accump->parsed->probe.name;
 			assert(accump->parsed->size > (mod - (char *) accump->parsed));
 			fun = mod + strlen(mod) + 1;
-- 
2.46.0.278.g36e3a12567

