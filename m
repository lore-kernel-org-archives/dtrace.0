Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF531862
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 21:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737063231; cv=fail; b=c//XNEqvruwSUZE28DBHKJDG2l+fIRPo9PvKmyCCDNioNtYUvLVEo31OW+pfGfDPdXC4GdP3zIVobQVo+KwPxDG8x2i7F+BWqVVUvuT29Mj7sOBKaQOehi93WZQql0cBxldYYbXRd9Qfc2ptCnUvSbj+DKb36iWk+ARRiclmPJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737063231; c=relaxed/simple;
	bh=zlXwQdvrlquQUcI6vlObAGm9mkHgQGWW69/nnNNMKSQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n3xF7eQ+eNVJzeoW+/79fyx77Xb9CNgbKNAvAjR5Inn7yZtiSU8GTxS/pMg19aw9bJZ820xyUF2LOMnVVKAazhLtFe0Z0tJfPrby6FrVj9OeF/ugjz49AVBJXD+sAKzlwnd4v5fIO/Ck0YukVSJ3B2V3Tc2MgfJ7hljqX6z0WmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CGLNoJ6w; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MNxdd4/z; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CGLNoJ6w";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MNxdd4/z"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GJBoC0022235
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 21:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=y24CgvJANbPsGTmOStmtf+GRAK3Ez6TvfRcs5EueThM=; b=
	CGLNoJ6wehyRBts0hIIEDjr0EGDGAVEI2U0i9cigeZ+P4eJBsYZ4MhjKGfi2lDdw
	+52QmZMnicTQBgmIE/SlH6wVYOemNeZ8DZGHcvx0ymnDYwJ+OxdFzUIZ+aiXGmIZ
	LPWXJYRpLEaAbCxuT+M+ELWy4JH2XXPry5Lg2PFEgbnqZ1WQIpLXq3BpbQenToiw
	idTL852MJGrFMK/aKeNrzkKlUsQ9yAIM6TmkWHk6Le867BtzZ7FPtV3JudrmOXl+
	PUGtfvV4osu81k6/6r3AesiuxqfdN5gfmyeyeOTazM30DZ3Lguj/eQH0VhbryIAH
	22tzAjghgCHgUejnb+RmAw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443f7yb8qs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 21:33:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50GL4Kw9020272
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 21:33:45 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 443f3hqrd9-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 21:33:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OmShURquFR7HPNhY6HQ3GlM2nd5Vqb8Obq0Z8z0vUQ0y4G7edHhfG+ZMMgewMM4u3RmW24rR9Xi9RocpC25R/TY0SoQHCGMWuXpMGvYkHqGbZXf7zYLro8GvD8M08+HA5rUoiEMrP0W0tN1jLNxTgNbpmMFx4kpA3/cvMQ7CLRrc4q8TOfmNcnMl5oTzEByMwo4qp8SSkyinRgy3iQosV99b9dy8OR/2upjSrQOtgq9tKeID1gghQ45ybjPTG6DYU/IfRGlCvaqMgduQLiDsZ7F1eVe3Sq3xKsPPlxpGA1hi1LWFJFLpihVLaKGOZhY28jBx7eH3iDwOwz0JxkQ4Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y24CgvJANbPsGTmOStmtf+GRAK3Ez6TvfRcs5EueThM=;
 b=GIlPLtU+LEA9ZagEWVGeyiIqXwM1uRRjF7S7cE+NBPmr/bD9Xguz3NRz3YKBu9jaCavuLbzs9NPlKBQo0DzlXuvPfN59F1Row8LaT1KNaVlDke+PkMSRpXX/rTiiRavzX+d6NZ+LRPuVisFSVg3TJTI7bnStYkH1AJTDqmFpDxosgyasO3ZCMKS+MNJ7ROaBcQG2OqX0GbYkHv/yIHqP3OnP5TL7sYI9g8xMlFHtex45qJoHZQX9rt2cCpzQ+C4rkQ+Sivu6Xb1TwTZ3iDwKhR1RGiAbbZoa3WpNy/zV6xIah/smhw6fxypXR+9SkRdE/XtO9jcjXDiksoirYvyhRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y24CgvJANbPsGTmOStmtf+GRAK3Ez6TvfRcs5EueThM=;
 b=MNxdd4/ztr9KiOqgF0xKUq/8C8VodQBa0DdL26l05gxLUGOD9lJQ4tfm/tNtnwTuT0oTueTUFiHOK6gPAcDwK1/5pVXNpsz48ReQqW3lxgcJpsKUBwJsmTAXEX4fAnIrc2UMJt6DD+uBfKuNReLtNxS844KimRQ13zouiPue3bQ=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by IA0PR10MB7642.namprd10.prod.outlook.com (2603:10b6:208:481::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Thu, 16 Jan
 2025 21:33:43 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8356.014; Thu, 16 Jan 2025
 21:33:43 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/2] libcommon: turn off FORTIFY_SOURCE more aggressively
Date: Thu, 16 Jan 2025 21:33:32 +0000
Message-ID: <20250116213332.415905-2-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.47.1.279.g84c5f4e78e
In-Reply-To: <20250116213332.415905-1-nick.alcock@oracle.com>
References: <20250116213332.415905-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0016.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::28) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|IA0PR10MB7642:EE_
X-MS-Office365-Filtering-Correlation-Id: 91da1278-30a0-4d92-f80e-08dd36757375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fgY/U+zyD73HC7Qto7z+YYar/ez3bHPRIgr4vS201PIc9sPZG45XkbySHBk1?=
 =?us-ascii?Q?JqCmOqG0R5TvsJk017zCXQtB/JiamG8yPgTektHwheJFXEz7RKhirjoCwBPk?=
 =?us-ascii?Q?4Nu08iK77lvzet0IV7H6154DrWHjgF2pN80RfIIQ5exYL5XaJRj5peyWIJEs?=
 =?us-ascii?Q?c0czDjBzVYi3OLAN4mwmAMY+HtTP6IgA7WdAXHRFIqt6B7HJ7JPKNWWGi4BV?=
 =?us-ascii?Q?7nSl6MUNJDyIeJXFoxt/s/zeAz0PXXuN4cNHi+27OSwfDHrsWcP1Fe22/Wze?=
 =?us-ascii?Q?iXuQukpj6qKT6shLw0GRYGOZSEXTROBkO56vkAXipZPOsFKIIX+SQUCvKF8i?=
 =?us-ascii?Q?cVFx1AsbyWXE36FvGAoyAx4ASG0OqdTDEFHAGTIRO3ofgPJvHovBsKDehgu2?=
 =?us-ascii?Q?0EuDZLXY3d0YhFUdp7z0/V42/hoDAEl7R31l45XQ/GqpjQMFWDTsT2B7zyvv?=
 =?us-ascii?Q?mFu5ckV4YJLRF/s3izU7FxXjHgZNy03NgKo4ltOhndA+UjNPjwb+/p84cruq?=
 =?us-ascii?Q?8daBYHZBIs22ORkeV6qJgHgr1h+kkREr1ivRvUtCc+Ml9cCwZgB7jgk3EpMj?=
 =?us-ascii?Q?pUCNUJ0nrxBuBmZCb4KDvHQpb1QETmAvpbGYAoFPLYeJ2qTaCLa/cuRA1Izp?=
 =?us-ascii?Q?r6bG4WgbvEBwBuhLgT1THUdVMOTc9XHdpe4fP5ZayLiGSWrjtQswwLP41f8D?=
 =?us-ascii?Q?qFAm082vuB+LuPgFwIvPeQcacWAr/T9HzHbIWBf6AesxJydu95bGUQjTNUVB?=
 =?us-ascii?Q?3PyCp/KWRIKu41NMhlHHrfouqym2zqvMkW66BKWmhdYA2Zoqhh7oOg5em1un?=
 =?us-ascii?Q?GGrP7JAqTM20fNwDqTZi5mAZDnSyBkTobhMakCIkS7XdZZlXbcSYFDq1XfXn?=
 =?us-ascii?Q?qjpg0thWvs5jIYuHBqDhdv7/wXUgxNxA/X3w8WyH92dbLx7oNj453VEZLYW6?=
 =?us-ascii?Q?Qoxo7hSIH1wDM2pv8nKOuLbNaSlDuYOc2FPs6CJzdaKn3TRm6ceAbx6jz77+?=
 =?us-ascii?Q?SuCXQmui3TdP8GBFbSJpDbV/ELLyuwBfr4a/GJPkI05mThX7RTVMo015Q/LV?=
 =?us-ascii?Q?UrgRMHWiRW42II7c62nPE5zh16+Hw2HXvd/LAfp9rhKhqAPA17K6S8JyFLOg?=
 =?us-ascii?Q?ZTzaRxvTXybrcXPlMxtA+W0haTVXUxJ5ENuDtG3UqoC5J8KEZk0EETX/G9aO?=
 =?us-ascii?Q?+1TuvgkYGHul5wKhYWdj54MKzIZmpbS+nv5qTG1h5MsdI6723TjTekcrBYzp?=
 =?us-ascii?Q?C/Eq9TcLro7ms3UufyemdaH9sFGmkwi+J8UbA3dGFLjeHwK6kcjJBmJd40aI?=
 =?us-ascii?Q?zJWuxzhIZjHKtnpw7xXyq4rKXwMi9a6KW1Vt4VuIiNqBstCb51/c+yUbJMMl?=
 =?us-ascii?Q?C4aTVceeEksGEP9isQt5qDXfSpRl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YKkvgiZvHYLiq5GPhgIKxIEtkjAZkJTyUx5LgrdY9ga2cztnOE2KKj5shIe1?=
 =?us-ascii?Q?0P3PlOYL8vnuEsMk72qAOzWrY8Sqkbryh7D1w9UFbrXASMB12Vpa/sy6skgf?=
 =?us-ascii?Q?h/8ePmQI7bPAi49rqHc5vntjCXJ1IlzxQ9PLVgCLxHAPhnOpRAoclqBR/Wv2?=
 =?us-ascii?Q?y4F2HJnhUmNMDqhCV/L1ytIknhARYiEnWG6ghx7f9NK/OpK6xpOXSoT3TYmP?=
 =?us-ascii?Q?RuS73DdBnSkXp0SNaXj2406Xse+63wIlB8DwG2lzIqYbv6gAwSdMqRt6tO0/?=
 =?us-ascii?Q?dgSTgXRTac0fZyu5ogpmMW1esN+XrF9WZT3U4qvQ3aRR05+HOydkj4i1Y4on?=
 =?us-ascii?Q?FD8GtX/DKXl2SNt/d12m0zfbhq7lnhrCk/pqw80zFlgXYsSOHix1JbxuI8WP?=
 =?us-ascii?Q?+KPvi16VUVdkk0fF/+isKasf5csZtnmAGdwOVz4G1YWnXFz3ZjBgqrLtqlL5?=
 =?us-ascii?Q?RWodO3jpr+oBMPBRrQrbeJ9G7KISSA2eMMWPU8zc8PDQUEDIqbBwxBhY5yz0?=
 =?us-ascii?Q?nZlTpUgLTCS3yyMO4FyzSxc6iZvBFOOviCY1Dcl18jfB22S76xbgYXeM0C9e?=
 =?us-ascii?Q?LNucbsJof36R+PDCVWLbVl/Nkq8q4d0NQI/7DGfqkmCQK75rOa6Q6N6PTF6W?=
 =?us-ascii?Q?5LNE1zugIyGYQ/IXxNWUzfuuiIEdcDYpOwKILyjWgeYPBDhIJ69AvXpfYmE3?=
 =?us-ascii?Q?3l6sD/qzmYsilP/XwIwfR7bhYoighObGsWNcipa9LPBIIt9fygvvXAFvG8B7?=
 =?us-ascii?Q?ofWImUZlyvMvt+6Fl2TTM1nrN56bcHopBPTfa9yWM8wbg+ivEeKm3ZWoZyS9?=
 =?us-ascii?Q?kZNpkaxJG7Wsoh5t5LBLRVAwzxsFbKqpUVmX78SlWkVcrtSfaahE4yQfOgUl?=
 =?us-ascii?Q?l2qlaLVL6BSo99Psg7OLe7JIR4hsuup6uLwBRXajf5SWGM3bKggXMUbmnhH5?=
 =?us-ascii?Q?+j14wtaPzCGKzZlOk74S+97JnLTzsRE5b/bTDeoouxNoIiJaVNvhh5QDjkKl?=
 =?us-ascii?Q?u/ma16wurqCp9nyuMhqEuqYYtuuAk5dKUXsJwT0ewMnOxH9gY1HJxrW9UAwK?=
 =?us-ascii?Q?aeJ4glxWRE9zMfkLVieY8da774G8JQWdaqipzuliw8xJk4+mJl4fvdqZFbiU?=
 =?us-ascii?Q?48CmTuWAtsVL8691CthYSh4SOG/6z/5HBGdxl7N21InWnsQocMps2Qk++fdl?=
 =?us-ascii?Q?ULonoae3cMwvOUVjxp7sVnvN38tWO1oAGlg5WpjlqwNAa7YoJ5YtjI5TXKtm?=
 =?us-ascii?Q?zel6eApU4Vkk73nH5m+1phtLAdqzTovhhREd8sVyAQxDqILcW7LKUXnqYAPJ?=
 =?us-ascii?Q?c+u0tlp78rOEa6HQiXaeDtfoCm384kC3I2P9XXb/E+yWp8dm8LAuDV3EW/Vy?=
 =?us-ascii?Q?dbJbAigAATc6kpri5ANbJlJoV7IHUYkWy/StxGJQjEIlBriDxV07f8wap1K3?=
 =?us-ascii?Q?GkXGrK5mWxEbH4eCrlLZ8sXpLmm7Rg9T7ZKjCdk/d02uQ1/N1BMPzGiDa6JS?=
 =?us-ascii?Q?vrp0UJ2Ea8WIHc2L5sS0DdyP/iOyD0j7cTB3VEAL5Gqx94YaW7JRJAJKI/sM?=
 =?us-ascii?Q?lcJ8UOpID3DVQAd1UBgPJWaUQ31PYZxmn1m3SoufhXGV4DQlbtCUQ8P/KUKb?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IaNitZ8wF3H+ey7XWMt6rGrVoNFDrqb7jt1hMfB8dtklL8QN0CI9gGvUQJKJp9B4Mc9t3AKbD7hYnjb1fCLphuzLa9cZtHzL7D61osAlXEwTJzbYfE1BUVHzZrJqBe8W25i8zbfPoSAsVQ71XhAl3zQXRLy8J68ZNQab+4xyUC9g2FBgfpH4/IYNYRMGiPbiaZYrQ8Mkd3Oxaze+qFScS1BwWk0e7q7EeZDDXL4IhADGUx0UfWsdbsbIHlJZBzNal8T6/orGd3klS2W9O6BFz8zMbScIFV/cHQhja0WuwghIx/VMa82ZVFGj5kfhJdhg/fIrr7otUyrj4kQnI8wzGXirJsXwCcmzhBhMEKo3iAKiz/VlpXautIbNNobbkFDhqGiTfWHpMALOrTxO/hdRCQxteHTxZ+Ud0bEb1dDrn4/m1OGaOCHcrwlmlN8uUgK8rtRJLLEOoYxPzSeZxd0ZJDQBdkuBZGVMwtK/20n6uOS5VuPZFomMuaRIgrusj6L4z1l8i/SIHdKB9W71sOoEijXbsGLqXHiUQPIh3iz5CT5V9/MP/ELAM2VpEkwp7/0th3LOYG2QqSsP0eFAgPw4KRjoofgrwi8cgWbPc6HpjKI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91da1278-30a0-4d92-f80e-08dd36757375
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 21:33:43.3682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mIPGxdtp5u+nbUZ869LE7cpm+MBN4BM9NH7tdM7FVJaACHC80CKwqCxbgnwzHemR09m1Ip3UCAEHRffALtf6/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7642
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_09,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501160159
X-Proofpoint-ORIG-GUID: s4Q7S0vEju4hhHzYFiQNHk6f0GDsnJhA
X-Proofpoint-GUID: s4Q7S0vEju4hhHzYFiQNHk6f0GDsnJhA

This is incompatible with dof_parser_t's use of trailing strings of
variable length, and buys us nothing anyway since we're running in a
seccomped parser child and any buffer overruns are harmless and cannot
result in anything other than a dying child.  We were already -U'ing
FORTIFY_SOURCE in libcommon_CPPFLAGS, but that precedes CFLAGS on the
command line, so if the build system passes -D_FORTIFY_SOURCE there, it
still takes effect.

Use _NOCFLAGS and _NOCPPFLAGS to explicitly disable every level of
fortification that currently exists.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libcommon/Build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/libcommon/Build b/libcommon/Build
index fd54dc044f9af..00c0d46d125e4 100644
--- a/libcommon/Build
+++ b/libcommon/Build
@@ -10,4 +10,6 @@ libcommon_TARGET = libcommon
 libcommon_DIR := $(current-dir)
 libcommon_CPPFLAGS := -Ilibcommon -Ilibproc -U_FORTIFY_SOURCE
 libcommon_SOURCES = dof_parser.c dof_parser_host.c dt_list.c
+libcommon_NOCFLAGS := -D_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1 -D_FORTIFY_SOURCE=2 -D_FORTIFY_SOURCE=3
+libcommon_NOCPPFLAGS := -D_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1 -D_FORTIFY_SOURCE=2 -D_FORTIFY_SOURCE=3
 libcommon_LIBSOURCES = libcommon
-- 
2.47.1.279.g84c5f4e78e

