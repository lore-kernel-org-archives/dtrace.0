Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BB818C00E
	for <dtrace@lists.linux.dev>; Wed,  6 Nov 2024 11:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730891811; cv=fail; b=UgEpk25J83pveXvhHTOaxEZEuQZ0eVxgVl6G1Fkcgigu+Ib6HDsmyMRUlLBaQDb87pNdJbaSf0XS+/m5QAoBkK+O1uNRi/cHcRLIFbN+bGYMjWBr653CgABuHVIlVHU6JP5N+kNegU9YspFhUyjsQ7B8s8NJudrT0Kfk+of9AYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730891811; c=relaxed/simple;
	bh=gFUJjCWaOS//zpqo8Hwrcw+y9cF5iwi0lqp0uiXuIds=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=luQA3OUIORL5T6yiQsbNt3uI5ptfVydr4pSOKeXXJSNHWfesRnZY0meztTJj1mw/l69voDPrZwTjH5ifpPIRxVyB2B6mnMY0KXaxEPYnlU8jJd7efo67FlWWHJ/gmdxWPVL3V0CJnfEKByK+RDdLf3xhWZ+OLqxQIjrMLHTu948=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DQWC0iMO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=canFtHHS; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DQWC0iMO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="canFtHHS"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A69Bfmp023229
	for <dtrace@lists.linux.dev>; Wed, 6 Nov 2024 11:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=KB57PfbRtvAiZHPhex
	9hRBUk5oMdGAhbQcHvR/QGkZs=; b=DQWC0iMO2/uMOGpsm1N0cQdAxiga/lw9ma
	LG2Y0NtPTn58QSGbAYgO0cN56xxh5XbMZwQx6YdoQJh/GU8ham6D9wfeldm3g0fz
	w/FjYxtenTApqTUok0Nc3jmGuMmy5tOGfweImA4cq9EdC2k+hSj/V1dNv1bskthm
	gzXKgAWDv7ucs+0Qi2/Q78leFgG3Chc9k8KzmqlnSvosiTaSUaedZ12X7BF+Fgsp
	FG44xyuRar8ptB3Zm0m/3lmXPiZY1lModF5K92AzNs2UVQjib9ckYNcdZGgyulJ5
	VXv+rteJ/fXiV4JdNCBTzbAZx3fUPzreaHH6nawRqQpzFhZxJ1VQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42qh03an6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Nov 2024 11:16:48 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6B7kPK008466
	for <dtrace@lists.linux.dev>; Wed, 6 Nov 2024 11:16:47 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42nah8dfsf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Nov 2024 11:16:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWZlN4Wiv9AeUkoZ/jGTPu1SbKg+B6e+kZpcQWkDikNQHlG/UYrbr+BFYzVpsBxBdQ8Q+nOzVR1hadL/wGbs1YKmxo22viCqJvDVJrjN65hvMBF9+w5ztgSHQonB+saq+fb9dWSvAdQlvoxol1V1zoMw3Dmsw3rTgGDgR0XjtzYgFwWQqlhGGqdkbaqjihbWuM5MJW3JWR4AOnMh+6u3ki1dzyxlBCRg6oZDsf1DUHf+n+L6PXRSzsa9OsYhoa9DSgfUt9YXQltL8OLAn5XiX+69NoXIQ1Ox1rawdVyYxrksE/84EK8TSMJXHQplbx2tJnkaszFK5LWgvdYIAWyJtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KB57PfbRtvAiZHPhex9hRBUk5oMdGAhbQcHvR/QGkZs=;
 b=hXaS47icqqx1wfYJrop+DqtUQ2PASOhquoCE7BpYKvtzHvT78H3GAEMdwzCAyMLWYnfASnh5wm/lZIhEgO+CR3qu7XlO+acppSyijYfGfbaRVKirHjxupSp1PZ+DvEs+BiUdwpFmJOt932VjnDNbdeR/6Hn/ydNWwZNwW7qmB69cEGs+ZKnOb5yGeOk1ROx9gdMqabWE57IrXggpdVxlD21hNCm3HvNPmYUD5LihygTxgA8jBhZl8Qmni/yb0DQB+eazkdIcRNKTf7jBDd+LQJeHMuh802iNBB5pzTkdwZZSkmu+bQoScOo8eOZF2MhhSgfeH91qe2fXUJxENoANCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KB57PfbRtvAiZHPhex9hRBUk5oMdGAhbQcHvR/QGkZs=;
 b=canFtHHShgWQqLZ1qi1CuzJ0sQ6gArXEDbv1cafm8EgZ/k8BuaVB5VVElN7vDDhLjecjrmE5PdxJK1Q54WWkQEo5cjZi++u6+rev5qmnOvPnDQgtQ7G6kIawK0CJLGYMRf7hdu12CC5ufFvz9bTODGjtdNQZm7U1DeK03nXwfNw=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CO1PR10MB4722.namprd10.prod.outlook.com (2603:10b6:303:9e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Wed, 6 Nov
 2024 11:16:44 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Wed, 6 Nov 2024
 11:16:43 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v5 4/6] usdt: typed args and arg mapping
References: <20241105000608.333229-1-nick.alcock@oracle.com>
	<20241105000608.333229-5-nick.alcock@oracle.com>
	<ZyppufnpOOJuaDxU@oracle.com>
Emacs: don't try this at home, kids!
Date: Wed, 06 Nov 2024 11:16:41 +0000
In-Reply-To: <ZyppufnpOOJuaDxU@oracle.com> (Kris Van Hees's message of "Tue, 5
	Nov 2024 13:53:45 -0500")
Message-ID: <87ses4ehnq.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::23) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CO1PR10MB4722:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ebe2292-5a38-4ea0-5f6c-08dcfe547ea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CRhLUDiZjlISj0FZjNE4Ln1vwamFGkPDszVBQo7vRdLv3LfCGO6Uj8Zy803P?=
 =?us-ascii?Q?fmhsLRJet4LPNQCOBhkSx8QtQJdScKhwfAWIkp0naILOP+TjbrE7SXTP3nj5?=
 =?us-ascii?Q?wpAt1eYmevULucD9Fz6kkpu4KydfeILNzjBfWnOipM2EieVlAdpEp/NvZyv5?=
 =?us-ascii?Q?CQgzok0Mn0xJd4LHTkEKXFzMg56yyqk8uBx/wVG1A10omHzHrbyY/iQYOWnL?=
 =?us-ascii?Q?IZODvHFX4SPv+WRl8/SoPQyr0PUm/ztJgs5/EZa17JXQGkBjEQm7cETSBmA+?=
 =?us-ascii?Q?chv1ODEnY8GaiyoH0o79t7Be4sf0/Z2+IuvvmUqlh6ghRS5dWJPHDWmbb24/?=
 =?us-ascii?Q?R5z6N4jnSiOuimhQimAR/jGd/JwyuUzOMfusVaxgX8XPuH9OI9gkZTXj3329?=
 =?us-ascii?Q?O769dP70lNm1QZ3nSdZ5urYJqOke6eaeRXQohH/dZsIJ1wVH31VAYHy8jNag?=
 =?us-ascii?Q?ftoYNNt07EwgIkG7FtwAoihBLpzukFC46hW7SD2sKVz6XuFt4T889H5FxvvD?=
 =?us-ascii?Q?4OqzWpe1k7g339tX7VJqzkE1H1WAULTuyIdLrQKevcs1rxLgcRVtVmRcTAwi?=
 =?us-ascii?Q?SoHl/ul2xoSX9+yVT291Qtwi94kmLLY2SZ4lannouxhKJyC0VOf75t1CbBOF?=
 =?us-ascii?Q?T3kl+zu3PFg5Ni6cI1a1IG8z39AxarOfqJCjTKujx/TsYUa8LNVV5dGMxaTu?=
 =?us-ascii?Q?rDagNg6SivhXJgYj0zpd63IVCqKvtoDP03B8MAMMngqgkEZYUIOKMgCp20N2?=
 =?us-ascii?Q?oYPDWTNtwwwgk8ZWL81SZrd0ipaO1UxYlDuVFKDOKBw52ym/mH6ZV7YnoEVV?=
 =?us-ascii?Q?5A4UzDhtMsh0v1Xxdn81XS/t05JGduaBAO+pEctp6o4d1u1OCC34Hi624aK3?=
 =?us-ascii?Q?WhSLZj+Ip4HHwOhjBke9yWTyVB6CqomCxptVHmrtCPBi6vgt0+PjO9/0D/1c?=
 =?us-ascii?Q?GHnlqpe7KRQ2Q9OW5lsodI9DWH6F9oWCXfeHzZFsEtn2h393RmvBgit8dkhV?=
 =?us-ascii?Q?ndfXcfZvU0ooTHnf0AYtKFFH+GwuN2QUpWUIys49SS6KaiDzTCAWEZcTaYU+?=
 =?us-ascii?Q?Yc5tGaDwjuWystBs8I8quSijHcMLzX8UMo7d+dMiF+TS1UkYIXqyx1OOvkGu?=
 =?us-ascii?Q?zxVeqnH9WSnQm3a4QrwBvhqC6lWfSPOIPjG8T9lUOEUiQAKWE8fY5KntssgW?=
 =?us-ascii?Q?Xhky46c1LuQsZsLFuzmPAHR2YzYVszRwspezwBr2sR5QzVvVwZdAiEL5nutv?=
 =?us-ascii?Q?4+AyzkM7m3b7SDsR+QNKFqKzfDq/NQOyjHHVWgyhQXjHRgecID0mrTo11Kme?=
 =?us-ascii?Q?g/pSOfQgrbZ2h1B/xVFTvJa7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tzBevAhE5wvMa+50FwjPSadrJaVu7NleF3kxz/gaspONSpr5WHLBfIxYurhC?=
 =?us-ascii?Q?lHPZwB+mEqJOI910ARoV8qsCc9LCvxEpLaAp2WJK7Kpk0xM3PmggYU0+zsRW?=
 =?us-ascii?Q?j/WUbJcDKolcD+NmKGbsOI9g8WMs0dX/v8TJEnab4KzHdaQ8X5taRXLIGTN5?=
 =?us-ascii?Q?vWSmXs0VjhLRvtyn5ZGRCF/FOXGlJTazjxvt430boDeDxLSpBk1ns+Cni5Qp?=
 =?us-ascii?Q?Bl2doBK/ra0nBR49sF6P34ffuhkB+zllhangdTSPjAMwr3zZacQqmyUALkKV?=
 =?us-ascii?Q?5nQC8CaaZQFop+TFNZakRHmQWwqcE9KCBRKuFX8UKnw1rlT9f5Rz97eZ1Sh0?=
 =?us-ascii?Q?wn0t5NjRt2mzIZSxz26DVcF3pUE4L5TljuKmj+sebOfA/nVf9U33H14BSwWG?=
 =?us-ascii?Q?7h83n23IA9k29hIdcdaJUw9jFtRabKh9/8l+w2a+F7kmxVzw32lACV2V82e0?=
 =?us-ascii?Q?gTeNZynOoavFE+jFqfPoYLFgofjKl2HEneGWk/JIJmkKdLdg9sVzxUPobUEn?=
 =?us-ascii?Q?DetC3Vu90o8wafk6vTzpNsdNV9aJi1XKZb/zbGJEfqRKbf6ckTS7bEFYwf2i?=
 =?us-ascii?Q?dGUQ7/JNhldHdSOZXcuMqRKDMrnjvhUNbqGAul+7/YUZcA99wMje/SWgsyCx?=
 =?us-ascii?Q?Qd3Nmb79fYlF7Deeo+REicqxNPLWGGFFlnSP71OUG6FjVFnNLYcwt9x1MSns?=
 =?us-ascii?Q?GEYVfNdvRQYWNPZOq90eLAVz6Q1liHFsHyvDOWcMhAo2T1Mo9DuMpI2knd8R?=
 =?us-ascii?Q?Daml6VkwyRATMIWGER6MQpgAzU9/2ugwznXUg1eN62yQAzGPgDw5fL4iJs+p?=
 =?us-ascii?Q?Cqpi13MiLOFoz7cVDy3hGEok6YTRCmqx/qJlGynwGRwouLqiYQc5iwGdZxLM?=
 =?us-ascii?Q?Nebqc0geGIIcErWuFgG/Q+g9lENc8dh1gdLzWDP4TeAFO13uVfiOYCbGKTDF?=
 =?us-ascii?Q?fJMfu4LjjqqDWB4AVyfuk+5ohzxwqcefPYAgB7YVQCPqvbwjwbMjLMwlLyLE?=
 =?us-ascii?Q?BO0tKFYM/eWo+s3aJzINxZhJumDwEys2zsqXH3gzthiadRPjIqE3sQmbWcFy?=
 =?us-ascii?Q?77GgqdEWoxeqZ1f2FB3/AdoDmTcJqKXePbFa6PAThmwm+hMQ+ta55SgkYmEF?=
 =?us-ascii?Q?tuadSPXz1b3womhd/OxP0+fW6FKFlQuUPfYrO9uFFDK+55KNsHdVa8ecc9zS?=
 =?us-ascii?Q?kjwU2ZTERc49XL7D3BoefmzfpuHA9G9P2ieJlfb9Vpe8d4VeUmhk8QaSaafO?=
 =?us-ascii?Q?yjYs6YvWryYOy+BtrKv/I2qUzZO+sDOlUjqUxSBKYRBzqE3zT8S3znDvk8Ld?=
 =?us-ascii?Q?IieYKW7OWNmfBRRY2CtGuP/Ldpis3iBmKmf3WLfay6ibZzMSk/yC4jSk/sga?=
 =?us-ascii?Q?y9aXbABeCBH1KA3c5IGcNW2n68g87A3fddtB69t7epQq0WUdOHLiF8x8lrwh?=
 =?us-ascii?Q?nfMZl6SMydf7Kf4ZG5sORkJnpy0+nyuYfgJLWBMzOBBfNxLpNYbWkqxICMWJ?=
 =?us-ascii?Q?vbmM5eBECjcwuFuyqOCz1WuSnz1bE5HjSLzu7yeDJLLXyrJeeGy2NKNm93kz?=
 =?us-ascii?Q?7qvpTQHLX9sVA11W2bdLCsfauZUEsaqCYyn4MaPMaH1KOOrUr1XRoim1xELt?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	J5g7BHhB2A7f94Fq0QFaR+k6UxAfzUt9KdcCYE140wfSI30cl7rCxG3piKlXMcAY1K2EsEtwCKcHGrp6UL+qv+2AoUFO9IwgkZ09jcFrixKNQstYE1B5hvWLMA/Dzx6hF4z1Gow5Y3cdKsSdoSMhOSn/sUY1ohNaBSD5SUGSVxCWucUODab6Iy2Bi+ljZ8aH1ThaIMUlsLUpSs3oMoQ9ZGxmToUGlLLmq/Q11K6LpbOwJdEEZuGNghN2Ib6BP+KOmj2U4IluEweyy8yhXjYfuBRGqwWktf+C5Q/cpx3mkrz3183zTRXP5spp9u9FGuZRM+LMyWVc64WKuV8ICTofu6Qefxope0zHnKQdP9EmnGn4O1v+wsKAL+VIEUiYPMlACnoRa8SYMVn+PPBFyfLO/R1eRtsQwCo9H0QTKWItRY6cvsbAmW6eHsOdQGrHccZElMKsjx3iVDOe89aSNn5/yLIsrBBCkiLvtlJhUOO+iAEachPRxi+2fTz/DPR4tRU88tH4xC3kIawp/PsI0MIWZN2yPdDujDkYQrGiOOoNDlSkkGBTwx0qXCDgb8DJWupcYQ9x88G0T43+prCKV+z6CVp0JD8Rzv1wYTEm49AnHJk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ebe2292-5a38-4ea0-5f6c-08dcfe547ea7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 11:16:43.7922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qClGJNxaPw0Kk0t1aoBcZOMgAf96R24oYaqLBTBwiR+hI105q+dxjOyiU16fHqguRCr0gXMdp599EIP/gP4NdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4722
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-06_05,2024-11-06_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411060092
X-Proofpoint-GUID: ghyhm93TNz01T0aS1oRyaMtW2O1Odg6-
X-Proofpoint-ORIG-GUID: ghyhm93TNz01T0aS1oRyaMtW2O1Odg6-

[Forgot to send this last night, sorry. Probably not much use now.]

On 5 Nov 2024, Kris Van Hees verbalised:

> On Tue, Nov 05, 2024 at 12:06:06AM +0000, Nick Alcock wrote:
>> This change propagates the arg type and mapping info we just got into the
>> pid_probespec_t onward into the underlying dt_uprobe_t, shuffles the native
>> types before handing off a 1:1 mapping to the dt_probe_t, and calls
>> dt_cg_tramp_map_args() to apply the requested mappings.  With this, USDT
>> probes should now have visible types which obey the :-notation translators
>> specified in their .d fils (this is now tested).
>
> Not sure why I didn't catch this earlier but this is confusing (or possibly
> wrong?)...  Perhaps the problem is that you are trying to put too much into a
> single summary sentence.

There's no chance that I'd do something like that! (ha ha yes there is).

> There is no shuffling of native types.

Indeed not. It shuffles the *arguments*, but the types are not shuffled.
Nice catch.

> What happens (based on my reading of the code) is that:
>
> - arg data in pid_probespec_t is propagated into the underlying dt_uprobe_t
>   where it is stored as a dt_argdesc_t array
> - the trampoline shuffles the argument values according to the mapping data
>   in the underlying probe
> - calls to probe_info() retrieve arg data as a dt_argdesc_t array with 1:1
>   mapping (because the trace program can only access arguments after they
>   were already mapped)
>
> Also.... "fils" -> "file"

Rephrased thusly:

> This change propagates the arg type and mapping info we just got into the
> pid_probespec_t onward into the underlying dt_uprobe_t and shuffles the
> argument values by calling dt_cg_tramp_map_args().  With this, USDT probes
> should now have visible types which obey the :-notation translators
> specified in their .d file (this is now tested).

which is much simpler.

>> The probe info has been moved from the underlying probe to the overlying one
>
> "probe info" -> "probe info hook"

probe_info hook, and yes.

>> as part of this: underlying probes don't have any user-visible args to
>> get info for, and their probe_info functions are never called.  We do all
>> the arg reshuffling in a function ultimately called from USDT probe
>
> There is no arg reshuffling or shuffling... all that happens is that the
> dt_argdesc_t array is populated.

It used to be shuffled and I forgot it wasn't when I rephrased bits.

>> discovery via provide_underlying, so it predates trampoline setup let alone
>> probe_info on the overlying probe and all the args info is present before
>> it is needed.  (We intentionally do not shuffle the args in
>> dt_cg_tramp_map_args specifically so that we are not sensitive to the
>
> Actually, dt_cg_tramp_map_args() specifically *does* the arg shuffling (the
> mapping of args).  That is its sole purpose.

Yep. I was thinking in terms of mapping modifications, but of course
that is done by probe_info... sigh.

>> relative call order of trampoline() versus probe_info(), but there's no
>> escaping the requirement for USDT probe discovery to predate all of this:
>> but this was already a requirement in any case.)
>
> There is no call order relation in any way between trampoline and probe_info.
> In fact, except for some special providers that do not have a low-level probe
> implementation component, trampolines are not generated until all olauses have
> been copiled.

Yeah, I've just dropped this whole parenthetical, it's a load of
rubbish. (And we no longer care what relative order they're called in
anyway: indeed we can even cope with create_underlying being called
later nowadays, as long as create_underlying for a given USDT probe is
called before probe_info for that probe, but we necessarily always
depended on that *anyway* so there's no point mentioning that either.)

>> We make one assumption for simplicity, noted by a TODO in the source.
>> We assume that overlying probes all have the same native types and mappings,
>> so we don't need to look at more than one underlying probe to figure out what
>> they are.  DTrace always generates such a thing, but DOF specifying multiple
>> overlapping probes seems perfectly possible for other programs to generate.
>> This should probably be validated in dof_parser.c in future.
>
> Since you added validation that rejects multiple USDT probes using the same

I meant to take this out :( :( it's gone now. I did the squashing-back
late last night, clearly too late...

> If you feel the need to mention that other DOF generators could potentially
> create DOF that associates multiple overying probes with the same underlying
> probe. that's fine, but since your code will not accept that, I don't think
> there is a need to mention it.

It's gone gone gone. Anyone who does that gets a failure from DTrace and
will immediately realise they've done something wrong.

>> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
>> index 71ac1754d343..a0b3d892fd23 100644
>> --- a/libdtrace/dt_pid.c
>> +++ b/libdtrace/dt_pid.c
>> @@ -950,6 +950,7 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
>>  
>>  			p += args->size;
>>  			seen_size += args->size;
>> +			args = (dof_parsed_t *) p;
>
> This change belongs in patch 1/6...  without it that 1/6 patch is validating
> the wrong data.

Moved.

>> +/*
>> + * Populate args for an underlying probe.  This really relates to an overlying
>> + * USDT probe (all overlying probes associated with a given underlying probe
>> + * must have the same args), but the overlying probe doesn't exist at the point
>> + * this is populated, so we must put it in the underlying probe instead and pull
>> + * it out when the overlying probe info is called for.
>
> "all overlying probes associated with a given underlying probe" makes little
> sense when it is already established (ad code guarantees) that there will
> only be a single overlying USDT probe for any underlying probe - and any other
> overlying probe is therefore a pid probe and does not have defined arguments.

True!

> Pehaps better would be:
>
> /*
>  * Populate args for an underlying probe for use by the overlying USDT probe.
>  * The overlying probe does not exist yet at this point, so the arg data is
>  * stored in the underlying probe instead and will be accessed when probe_info
>  * is called in the overlying probe.

Much better.

>> + *
>> + * Move it into dt_argdesc_t's for use later on. The char *'s in that structure
>> + * are pointers into the argvbuf array, which is a straight concatenated copy of
>> + * the nargc/xargc in the pid_probespec_t.
>
> nargc/xargc -> nargv/xargv

gah! I don't *believe* how many times I made that mistake. Almost every
reference was backwards.

>> +	/*
>> +	 * Construct an array to allow accessing native args by index.
>> +	 */
>> +
>
> Remove blank line.

Ew, seriously?

... it looks like that is in fact the formatting. Adjusted.

>> +	/*
>> +	 * Only one USDT probe can correspond to each underlying probe.
>> +	 */
>> +	if (psp->pps_type == DTPPT_USDT && upp->flags == PP_IS_USDT) {
>> +		dt_dprintf("Found overlapping USDT probe at %lx/%lx/%lx/%s\n",
>> +			   upp->dev, upp->inum, upp->off, upp->fn);
>> +		goto fail;
>> +	}
>> +
>> +	if (populate_args(dtp, psp, upp) < 0)
>> +		goto fail;
>
> Why bother calling this for a non-USDT probe?

populate_args() doesn't care if a probe is a USDT probe. It populates
args if the probe has them. It so happens that only USDT probes do, but
populate_args() is not sensitive to that and will work regardless.

Almost the first line of populate_args() is

	/*
	 * If we have a nonzero number of args, we always have at least one narg
	 * and at least one xarg.  Double-check to be sure.  (These are not
	 * populated, and thus left 0/NULL, for non-USDT probes.)
	 */
	if (upp->argc == 0 || psp->pps_xargv == NULL || psp->pps_nargv == NULL
		|| psp->pps_xargvlen == 0 || psp->pps_nargvlen == 0)
		return 0;

which will always return unless the probe has args, no matter what type
it is. populate_args() doesn't care.

> I would use:
> 	if ( psp->pps_type == DTPPT_USD && populate_args(dtp, psp, upp) < 0)

I don't see any way in which that is clearer, but I could do that if you
actually wanted. Should future probe types turn up that have args that
need population, that would rust and need replacing, so that's a (tiny)
disadvantage and as far as I can tell no advantages.

>> +
>>  	switch (psp->pps_type) {
>>  	case DTPPT_RETURN:
>>  	    upp->flags |= PP_IS_RETURN;
>> @@ -604,15 +703,19 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>>  	case DTPPT_IS_ENABLED:
>>  	    upp->flags |= PP_IS_ENABLED;
>>  	    break;
>> +	case DTPPT_USDT:
>> +	    upp->flags |= PP_IS_USDT;
>> +	    break;
>>  	default: ;
>>  	    /*
>>  	     * No flags needed for other types.
>>  	     */
>>  	}
>> -
>
> I would leave the blank line.

Accidental deletion :(

>> - * the firing of all dependent pid* probes and their clauses.
>> + * the firing of all dependent pid* and USDT probes and their clauses, or (in
>> + * the case of is-enabled probes), do the necessary copying (is-enabled probes
>> + * have no associated clauses and their behaviour is hardwired).
>> + *
>> + * Trampolines associated with USDT probes will also arrange for argument
>> + * shuffling if the argmap array calls for it.
>
> I would drop this since you mention the napping in a comment below already.

I was trying to describe what the function does, rather than only one
thing it does which happens to be the first thing that was implemented
(firing the dependent probes and their clauses). This is one of the
things it does.

> Here is is potentially confusing because trampolines are associated with the
> underlying probe, and that probe might have both pid probes and a USDT probe
> associated with it.

So if I add "... for argument shuffling before the USDT clauses are
invoked" in the appropriate place, is that OK?  (I assumed that was obvious.)

>> +	for (i = 0; i < argc; i++) {
>> +		argv[i].native = strdup(upp->args[i].native);
>> +		if (upp->args[i].xlate)
>> +			argv[i].xlate = strdup(upp->args[i].xlate);
>> +		argv[i].mapping = i;
>> +
>
> Perhaps add a comment here that this is code to handle an allocation failure?

... er, the == NULL right after an allocation makes that sort of obvious?

> Or move this to the end of the function with a fail: label, and goto to that
> if allocation fails (since that makes it more obvious that this is code to
> handle an allocation failure).

That's much clearer, though you need to initialize i to zero to avoid
compiler warnings in that case. Adjusted.

>>  provider test_prov {
>>  	probe place(int i, int j) : (int j, int i, int i, int j);
>> +	probe place2(int i, char *j) : (char *j, int i, int i, char *j);
>> +	probe place3(int i, char *j) : (char *j);
>> +	probe place4(int i, char *j) : ();
>
> It might be worth adding tests for -lvn for all these cases, as an extra
> check that probe info is being provided correctly, even in the case where we
> do not actually trace.

Good point! Added some.

-- 
NULL && (void)
