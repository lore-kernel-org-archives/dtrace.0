Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7AF175D54
	for <dtrace@lists.linux.dev>; Wed, 18 Sep 2024 08:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726649984; cv=fail; b=oajmlPT7U/87WUwOtGkPnJrcbyvGHgicCOIhCfQV8Zp2Dyp/DL5NsNzyQSxgayP+SLDADeD3MnDcC6i3iiZyfpKNRsDvuhI2KWKqWmJQxSitTctZi3G/qDYDKG6Gq4FdbDHvwDXNPqdRMrcpc2/1z509/4mQOq0r0yhxJ6n0JQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726649984; c=relaxed/simple;
	bh=7XPeTCiKJvofQCE/ky4dmj4gX/jYyY7O1nEWmn1aLOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lpHl6r6UV77AgCY7leuusBApTCb9/IQ/l+3uCNXqEZjQ1yIboCEINEkLzeULpxhNDjL2OUPLuQDdSCe3V7F3QxfvYUetzFmzJaH1LQjeLWtFHGnC7jd+96bImEA5LbqzIOQxlLp7tgVFENf+4w7bG4m7Uv3cm0t0CFp7PHU7qo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OnuoiC5e; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=x6niB6xe reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OnuoiC5e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="x6niB6xe"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48I7tw8I011348
	for <dtrace@lists.linux.dev>; Wed, 18 Sep 2024 08:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=8rUkCceKRPp9l9MAPG+nQoyiqktrgyM8czI/L1OuzsE=; b=
	OnuoiC5eKBrAk99C0bYnwr8BRmWmQ3+1tvrquSormNmOpMhie3fQlsLYIILQ9m8E
	ayR3C4ZC3UcweAYnp4jUcrZQuuhbk1PSY8zuWQU6S0NLbDvLtpIFb1Ds6kGvUzNx
	vwGhMAleHN6RgYtiX4tQp2Jg6AxZCfWHQucAAJtnb7O+qHQlrX6XYrjpjVBmU8x7
	lwu76sM4bxr7ar58yuNRklBRDc2EIqtyLjXJxMi+/i6IH7vNGP4EaJtogc035BNs
	rdWtHrK4FiC1DqWo6jz4pXyoO3whyg13keI+BPObKBRVAZJkeXBdactjs4jrkonW
	V6aUHfrmM0RmNEZdvbayDA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3nsgrrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 18 Sep 2024 08:59:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48I853SW035271
	for <dtrace@lists.linux.dev>; Wed, 18 Sep 2024 08:59:39 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41nychyhge-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 18 Sep 2024 08:59:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iUeFzhKvZHdBBReDQffADai+r8PzkdbQlxlF1Cw0aa+ygy5/EhomfNhRYH0m0JsDxaz0RLV7uY3q1y2xZ95Imhpy5YXjK9CiUOk0ZEEqibO3Ydpg6kdCa+dSRYOl4FxcscK0bbGqDKr6q7z2HAHXjw94zrrIaf04go7yQ5lzqSdk2QkWMAFdJEZ9cPKXdirjPRgIE/YNJ3jkwH3Oe+2GrMPDfBbccm1RogjnATBmgOhMN6JFKkIf9zaohAnrx8IqAahP0FE9fyxXHuvEOqItX5a0zXAcLZIsBPVn4PSlZck9qjfRb2fJbz8Pf+kmULbgN/k2j7f9yp5e+B6VaHldNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vWgcV9PPK0hNbSZTYsSHl1lGz2BYq3bPafVqJwbiSc=;
 b=XpC5Yg7i51+5ZV9bgauhWYCbBEGNtX3r30+ZYNMXllnNduMogqMD3RGiCs0MFVqoQHDUjeX6QOOPgBZdzq9gGZSqb5CRZWi5IbDjGy+vA7B/SrdLHP3z9wYaDBMqLM4N/yeyrNJqJVtMxFpMbagbcKD0gj8jWLAHAZT+MXGqJyWcDme+QhGJdkNHcCc/aZkDn8JAd7PzYXNh0eo5CL7v7gZmHPWgseTN1mDDNtj9sahWqoBLjcn7o8qb0faQPwQivQH8xG0m4r4/MHkqmqX412hWKPXIsEVtU1CtasgBQe4dX00hoLZY6mi02IUrmPzAVUXopE+vg7DQb+8Ci2DslA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vWgcV9PPK0hNbSZTYsSHl1lGz2BYq3bPafVqJwbiSc=;
 b=x6niB6xeUrPn/R0P/7qfxiTutvg6+vP03QDcSlmx5Nst9FIiBfYmV1Hzf7pBrQl4PpuTZ+l+kgUzXsAEiCuA2R770Wtutw3uyprbz3ZMztOpFsZf0H+A2L/lWsX2Cv/BdsPQ+BWys858OEPaQCU8Eka+GJO0iTE5oo3Fz81w5JM=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by IA1PR10MB5921.namprd10.prod.outlook.com (2603:10b6:208:3d7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.15; Wed, 18 Sep
 2024 08:59:37 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.012; Wed, 18 Sep 2024
 08:59:37 +0000
Date: Wed, 18 Sep 2024 04:59:30 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/3] test: adjust filter
Message-ID: <ZuqWcnuWFXM8wun7@kvh-deb-bpf.us.oracle.com>
References: <SN7PR10MB62873DD7613F62C636FA90F6C2662@SN7PR10MB6287.namprd10.prod.outlook.com>
 <8126bf9e-e55e-a10b-15c6-ced94a581930@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8126bf9e-e55e-a10b-15c6-ced94a581930@oracle.com>
X-ClientProxiedBy: LO6P123CA0030.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::10) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|IA1PR10MB5921:EE_
X-MS-Office365-Filtering-Correlation-Id: 17e6013f-692a-49f4-0b4b-08dcd7c03919
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?dMospWgFb++Wqsg7MxttMPoa6qxRuGt/6ST3PwuhU/b6hJ23ST7Q1acZbM?=
 =?iso-8859-1?Q?f1HjzFVdjbnlxuBahQ5aaLe80/Q5+aN/L6b+pcZEzds12qgQ0mgBhyBI5t?=
 =?iso-8859-1?Q?TzcvHY32l0zG7r8T2gftqF6Po7hEwoR4TaKdejdipdupZjmcetSWpTshSE?=
 =?iso-8859-1?Q?0DxARLSkUC5fO4568RFOgXMfBq3/nM2CGFAke9YuNC0oKCMsrjxQNCRbD3?=
 =?iso-8859-1?Q?viL5UJ/pu6U1wbqw6ASzMDBW4LLePhEr/Jii8yUzH9OLudL5RdU/NomMr1?=
 =?iso-8859-1?Q?EPzMLokxFPAA3iYEMbc9gZmMPUyZTn5CoUaC+7IVvcai/4ap/Lqb1cv3/6?=
 =?iso-8859-1?Q?GF9s81lL5qlCVa4BLijZBddBQffyZsVwTT1CsW7Y76ErxHU71aM+xa6Ch0?=
 =?iso-8859-1?Q?4nDvznUpoB+vXeuRScqo6uRlFTqjGSrgM7mq63K15i1LeMtAUX8kzRRJ5i?=
 =?iso-8859-1?Q?WRELll7gIBm2SzH3flVWsxU0FjPKeC+y2QruEsnz6AEl6dUsDLxN4SzP7M?=
 =?iso-8859-1?Q?xeDJgC9kSpLPiCNhy80fP2AVab8wk5TXn4WU+zJKs7qM5n4I/ZXt5ttzbb?=
 =?iso-8859-1?Q?dB25QmDVovY4cYsYTbufA8TqlLzQ+GZ7DVm2dF3t+hvg2Eq4fuL42cCvGD?=
 =?iso-8859-1?Q?mA21dBs317SnPasoI06kS7M9Dp1KMByGfUojr969elUsPo4nTSFfjCTAcb?=
 =?iso-8859-1?Q?9oBifXIrbtSCce5eNOjAP5KZBhjvYc+uHlLA/YghO46EFit+1ixKNbBw5S?=
 =?iso-8859-1?Q?eXjwPZAmPejJvdknEfLg2+VgSNm6H8p++j5fXXY9xhkQg+MgyOyY2K4y1N?=
 =?iso-8859-1?Q?+VHUS5qIA4uyh8wtKPlDf2P4MQUvd+tPsA2RB4mipb/mqorUVHh9B0QYyC?=
 =?iso-8859-1?Q?Hf6rsorPe/j92XseNyzaXZ8ZjVCnmPwEcduoyA+2AVgFC3enwcsbX+uc20?=
 =?iso-8859-1?Q?hyqS9rGyDh90DY4800G12Fy2NmNho7ZlwGImc74kXDCWWV8Y032nZt+cZY?=
 =?iso-8859-1?Q?46wtZIxYcKUmAVLVTuX4lyarWGv+F0fwYOsFWQ1g/tdNQoM83bgN0KLOBL?=
 =?iso-8859-1?Q?Gt9RqR61kYMJpJSDnJ+5LrLthWlACZ0D6++cNAyjrIZju/jxGExIv7oI9f?=
 =?iso-8859-1?Q?R6GX5L+GLbD/ZkMcCTBoXzz6RRd/jGGHLtrGoJKVEVcsanU2gQVzaSX7kw?=
 =?iso-8859-1?Q?+DNGEMFdkQXj6cyOxcTjyoNqPJ3i4g9u9jluWSNsbUjhBVPnM2HLkb6lNZ?=
 =?iso-8859-1?Q?1Y/rpAqPLhPeyI0jNzhiyZOP2o5NBJgrQJsuurtVQKkyQaOUXjELuElooj?=
 =?iso-8859-1?Q?UBYW9pBwFclvRCtba/eVNCKbUbpq7Tmfa7bgB5mdZcffHWEwCQpC4lz2Vd?=
 =?iso-8859-1?Q?9ir4ysGssHpQ5pBXjd4e1MZdrOIkGkPQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Q+sC84o2149TL2JGlNE4EAPzunz95y/fb7epeNbRN4n8YGvidEm07FX8bm?=
 =?iso-8859-1?Q?Ac2M4UNQMSZeW1qkRybKDROlaB5VDMU+lGHTGy62uIAAvn6t2pVSXNKHwi?=
 =?iso-8859-1?Q?BtYfl+h6nAieYWExPwP28Qfv9xui10jqQzn0Y7mnbCbbnaataaPYvVgygY?=
 =?iso-8859-1?Q?0+Z+Ki7ambZ2LC9LwGqn1ie4Z3P52L0qct0LzKybRXT1PqcA1+itD7Z8dq?=
 =?iso-8859-1?Q?JLlmjCTMtFp98ytVtZy2npb6RvfLy5Gd0O2YKlNopebpWFIvKvfdSSRfhu?=
 =?iso-8859-1?Q?wjxlKf4+c9Nip7s2mTO8ncNQp6FElS9GUm0fxe+dLJB/h6WtGZ1F6YdD4N?=
 =?iso-8859-1?Q?dULXDWV+HVfSVmj8ByMkmiry+dZ+wZgtbjMj/3SvNGI6jqgADnEYd/YbEx?=
 =?iso-8859-1?Q?sEFMLGvg7N77Gg1YnsI2up5YMTVCQw8dtlLrpDODGm79M2+mRm3cxpH5in?=
 =?iso-8859-1?Q?PYKqts96Yvcz8t690d70yrAHalg21XEXOGDcZs8NeYvgg7Bz09tCZlY7px?=
 =?iso-8859-1?Q?7abuM6Hdt3wsfl428UC0kpekRDBvb56uvmwE9ND1mVeMPPrRyGl5S5TVIE?=
 =?iso-8859-1?Q?Sb4dPaLgs1iA7DBqzvMY2NdZwl9vEyg5NKXuwDT8Z6VejJhSEAqFYTUWvS?=
 =?iso-8859-1?Q?0yW6BnI2QnLC8pVhcAHx95QDXW2gzYgQ8shlp5fbVEfZuw1P4Rqlv5b+YI?=
 =?iso-8859-1?Q?1X+4w8ajCTvcTXdRux22GATCNkK/f+EvvTKOLAxBzmQICaQHA1XF+gxzKB?=
 =?iso-8859-1?Q?7QYPUJDK1+OGFZFs+eaoPe242NA3EgmOqPyv3mcDC0Y4OCivFiODV7LplB?=
 =?iso-8859-1?Q?tBPu/B3YhlLmbqLN+eAptqUq95VWFLPskoMXksHVkDsKDhjtM94miJO5pn?=
 =?iso-8859-1?Q?vJiUH7R5w4BxJuq2o3r7rIFUEbCH+aa9Ck1yp61BZ49LfA5+KGvhxeky7W?=
 =?iso-8859-1?Q?T2+M0DBrAAWnL3EXwqWfGm1CQ4hAR4xWl4V/aNEBHYPXi3X172tLSsHEW4?=
 =?iso-8859-1?Q?U2wHKHKzzG9le0stPL69mKv24J5jEZwl4Lb/J9CANEIrrTuxy83t2vQmZz?=
 =?iso-8859-1?Q?XZ/wjqEeb4cR2R0obu0aDwmzvVDHb+eegKo4ZEUZdj5o7/eum8qjZY60S8?=
 =?iso-8859-1?Q?CpyT8gRPdSrpK6G0NJSEsOGpt4DSBdQukLjb0MX1z3hubidbOI8cQbgEiI?=
 =?iso-8859-1?Q?YLmqKQcbRQtyXF4McmAPzVoxorwaDpuiQ1EfIrhDX3Ob1/MCn0+pdi4n9l?=
 =?iso-8859-1?Q?fRT8L240gxE3YUYsmwqYGM0MhrPPt2wcP1ZYETvTplNrY321qefFzP/d45?=
 =?iso-8859-1?Q?uXOCG3okzItT3klreqSi7rxv2z3abdPEEh9YeLXwIWosC2oNU8D6UX43KK?=
 =?iso-8859-1?Q?e4vyyUQEtAl1aTCB42Wk8WnJnvFB+MioPL0YLi7/EDQHSvEGQtUXV7xgyb?=
 =?iso-8859-1?Q?dipDFSafFrMDvFqo7v9/9YW9ZjXkvcmHep7tyajV8ijcF7OXMltpUlNbl8?=
 =?iso-8859-1?Q?rue6UhTwetS6pp7IiCbZAJQ/jrExsNDyUmE5VCmjMHsUn66EsamHlnrFrh?=
 =?iso-8859-1?Q?04CzyCYKhuww/v1l58JaaD+AHjjHy3as/Zp4QZBH84mQ/C3FtZmqmMbcul?=
 =?iso-8859-1?Q?EXQrqcRuENhrgD2QEtfQ5FwRRpQibNWKar6SrsQ7gNamnb9HGvRIGZyw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8edRn5jdfzWZzs4+arCJh3UiiBGZHlwetBukFJxpIZc3nX5kEpui/yv1RwvUvVl+CzHNPXMnd2Lc41LqGfyeSejxBNLnuc+vLGKBP5Hc1g6/QNjurEU7BW1LLoykTycfyf6MQMHhuuNl9yXBusG0fsttKYkS9dl+yx0CVcbhnj/M22jigGOnKWQXfbqcirZrhd5xuXalZj+G5TGj1yezmi5sVM2vm8ExsV/Bm25Kahkte6fP1g9MqrGvex7CnIG2hdHhBooO2WzrTDZmGS4J+jSz4i9mUGBUUPCi0I1ZoXum3WnbzXOnYiyg6Kcs8yXwaQMyIv+oygs0EbWketdi+4/V1fNMH9K++iauRAbE6GRgPi8Ao8OSBtW6HyS5PtlVC4H9o8/+3qm0ouBQ3thVEsDYgyqL/uhOETS/iv1Q6k5k/LMOEwt2JFEq8IPzdYsBOSdMAfljQ4kfnas+yJJTldjxePK82Y6WXu37rsoniou1FSU0b4ceJ75pjNQHSmjWvxjLBb3ifcdsbLFxtGm01RJEEs6XABpHx2WFKZCiR0z9EAfW8S3YC2JDuWfCgT65k65gJRtInHLVznwMmH9al/PRJW5kExcEIqBEpcVj6ok=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17e6013f-692a-49f4-0b4b-08dcd7c03919
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 08:59:37.2421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ve/BoyK+cUNowA3P0MzpGB0Qd/Oi95mamLHwS5xCq4cyjYXHHn0X2SC1bG6LFYzNKEiUNozGooXwswH5z1mnC+BWC0j7nS5PwghEPZqR3hY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5921
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-18_07,2024-09-16_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409180055
X-Proofpoint-GUID: h5pMGtrgfCQmdnc-EM1OBQUmEmgVJleY
X-Proofpoint-ORIG-GUID: h5pMGtrgfCQmdnc-EM1OBQUmEmgVJleY

On Mon, Sep 16, 2024 at 01:47:41PM -0400, Eugene Loh wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> 
> That's dense regex and makes my head hurt, but I guess it's right.
> 
> Incidentally, false positive/negative nomenclature is confusing to me:  when
> a test is positive, does it mean the test passed or failed?  How about false
> PASS/FAIL terminology instead?

That is a good point.  I've always interpreted it as being negative/positive in
terms of FAIL/PASS.  But yes, I'll try to remember to use false-FAIL/PASS in
the future for clarity.

> On 9/14/24 11:35, Kris Van Hees wrote:
> > The unittest/profile-n/tst.ufunc.sh test could report a false negative
> > due to the filter not excluding ld-linux-*.  It also did not filter out
> > unresolved addresses from the bash process.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   test/unittest/profile-n/tst.ufunc.sh | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/test/unittest/profile-n/tst.ufunc.sh b/test/unittest/profile-n/tst.ufunc.sh
> > index 28b7c05b..13231539 100755
> > --- a/test/unittest/profile-n/tst.ufunc.sh
> > +++ b/test/unittest/profile-n/tst.ufunc.sh
> > @@ -53,7 +53,8 @@ if ! grep -q 'bash`[a-zA-Z_]' $tmpfile; then
> >   fi
> >   # Check that functions are unique.  (Exclude shared libraries and unresolved addresses.)
> > -if awk '!/^ *lib/ && !/^ *0x/ {print $1}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
> > +if awk '!/^ *(ld-linux-|lib|([^`]*`)?0x)/ {print $1}' $tmpfile | \
> > +     sort | uniq -c | grep -qv " 1 "; then
> >   	echo ERROR: duplicate ufunc
> >   	status=1
> >   fi
