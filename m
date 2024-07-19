Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AF13C39
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 21:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721422969; cv=fail; b=sZiNnDdGI6l6nyeGAG3LiZNW3D5kOjHFXUC7CKuQaE749j3lSDbGeP0Q5mAwspv/BJPnRSKq9yBlRw7npd0ukvb0EoTI19WewulMWCsann4Cw4q4ZW5xLL5rrCqOKdpr70ox1zc8IkDEWzQqmu1FB0yO/MTFyXgmDqxDKFNnPLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721422969; c=relaxed/simple;
	bh=QjWeOWm+6MTcImdlQIvBWRyLeC3o+/pJfgok5MkfW2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EKOS+MC9Lp/lC6NUS2wfR4sWFsxMrX/j1lQooaly7PpIO9NDtC5k7ztMY4JJWMFMj/CjKJXawGzf2NO4/zasErGy9xnY/FFwrK5djQQEqoznbVQa01PhGVk8SCq0tSyNdEqMcdfQZAKhgrUDM1jBhP7euPSyZCr4KGcsc7BQgMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Hx71lNa2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=W367m2u+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Hx71lNa2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="W367m2u+"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46JL0hxq005813
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 21:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=7N92eEt/972E2yC
	rW9OjrgkttayGBzXd5a02QX50yqg=; b=Hx71lNa283TxUuuF9VdzF0IWMh6Dx73
	wu9+xmPOccEhtRYoLKAnOjbPRUeIy+7rWJ6SOItUzPa42Ua+ftilJCGWJZqigFcc
	22JPXtLWrGjKK8OilvcZwcSGUbjH9pFYlvmhn7DNrcrFyFSQnbcdPICBdzkBEafI
	FYNa/w8sRDl8G2GWAkpnv9Jj18v0gipj3u+wAjlmrZ29RLpSX180UmCtg7Ju4N2+
	Ez4qXZOcyKmWQpqxvyq7s28/kFRMUlKsukRQ6lwOMa5xtlQGcbhVcOHrV5MITqVX
	kalA1TZOpsIxuoFNb2xev+0katuSQmLUSPnidYzSk2fAmIxQhjAJejw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40fyp6003d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 21:02:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46JJJH56021737
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 21:02:45 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40dwewcqh5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 21:02:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MdVr8Kbl0kc6LA6lpp3/kxja2R9q6TQ9zRX7nihDhCjmKSAdJ2YgcCOnowxieuXnqd66HbPy+vGSmKbtc52Z4nQRA8+jbMrxbTVkKz7we/Krxz6NFliCKE4M2WnsLVPP5tKNs+Up+jrUHG+zSPwwMb4GI+WuQmuXI1VH4tyFAVlcDSvkemPiTXDh89SHoHCE7X2qW4qg+5Q5LLeWwYldmkuLI0nWKugNDjc4Iw9eu24Jkw2XyyJ04+OiF5nY9269WfdQxCM9Xt11j/8JYYb8VKEew0+JuQK7XeJsRXaq+Mz6DEU+pe4dNrAG+5aJZVWLXw1wAbA8TGkhBvxv1h1D7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7N92eEt/972E2yCrW9OjrgkttayGBzXd5a02QX50yqg=;
 b=FTXtQe9ZNDJhIDCK/O6/+qoDaMLz5MTUILuWB0X9Vz+4lPQz/ykH6xHcsNV6TTtWC1+M9I8YQvLURla+tDSKxVJPuGULH9ANn4YWRNgGnK0NZekPkV9RA90bs9l1IVDy7HioB7eQYhQoYf7O93V4fq9dQNLAwH9L2cqB1kQQ2xnqAx+U/8RFx3KHkirBb7usjWfHS0pOB2ozoUs133lBWpbjTrecEy04c0j0oSGJg/AKcsotXmpGqhBLtXqjnzuukdwzoFuccA1Btra8tn33nY5gsXd1i/CdxjoI0MyXIm47u06PVelMlWHqMyVQuM3YfRIVDCdPYAFhHhTknbfHaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7N92eEt/972E2yCrW9OjrgkttayGBzXd5a02QX50yqg=;
 b=W367m2u+0D79a91ofAGB+QdjWst20bCD3h+D1VO819m4TiI1BSDj7AKOUHgLbUPJ4eMyQTmGB9gnUxa3FPV/UpKtrI2HDeuj65IWCAo4pjk5pdqCccSnASeMOblpW0q8O3zlDJ2wbO06uPq3TH+IpT5S9/xdYnM0jehcQNm0yrs=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SJ0PR10MB4656.namprd10.prod.outlook.com (2603:10b6:a03:2d1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Fri, 19 Jul
 2024 21:02:42 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Fri, 19 Jul 2024
 21:02:41 +0000
Date: Fri, 19 Jul 2024 17:02:35 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 24/38] test: Make test independent of specific PC
Message-ID: <ZprUa707RqQzlT1T@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
 <20240627053904.21996-5-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627053904.21996-5-eugene.loh@oracle.com>
X-ClientProxiedBy: LO4P123CA0196.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::21) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SJ0PR10MB4656:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e94263c-88f1-423a-a1ea-08dca83620dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?n7E/DvutgOzDm2fnSQbqhF1M9fXOpRBp43B6NkNgbxlgZHAqhQeNPVXYcBzu?=
 =?us-ascii?Q?uH1kV6TkabsyWvdTIbbQjX+31ThpKYdR8P3CozHFMjM7tHysYV1i3a5hPFVT?=
 =?us-ascii?Q?Jhyhr9lOBuB7PjDPd7IfWhVNY/MH9GCpRILPwTMgLA3ybWHNezzMN1HttGId?=
 =?us-ascii?Q?34KI6Ccp8Nz7hfPd3tW1//JtasHuVZGl90V7jzfQo/56v9Cx0XJKQeeogkDo?=
 =?us-ascii?Q?JELf4F9azKmzrSzXgQrPcIg5M3mRk2bI+Kybqba1ycYfTzSqfUWmv8AsWQ01?=
 =?us-ascii?Q?F0F/FBH/XQCkM0lyDsIPnmgTRgVB4Ei0XdnVX2loIcjEJ54jBmSkcHjgco5B?=
 =?us-ascii?Q?E9nDKs7v1d7cBNccZ0vt1nF0up6HX3T0VmmnEZSaWdxc5hJ3yQaOCM1hWXnA?=
 =?us-ascii?Q?2/k+WngkOnnU8RvC3ncS+zmUdEtK/KVpcDLyEH54RDKmtumNW+pj9bbG+D1/?=
 =?us-ascii?Q?cUHkiB+PHRs6LeBRFIsg0CsPV7yv9RMWXnOz9o06dPm+R7B5RlQLLXCKap+/?=
 =?us-ascii?Q?e9+wwK2A0qE2NBDfvUWkGv+c/dG5ZoqGqc0ufMdetnSbK70zOc0r13ig6lM3?=
 =?us-ascii?Q?sW+Eg5sbsvFYzFaHkcYB3w4Tuk7oMYmMovI0sU7urT74BHrkETV38kSEro6t?=
 =?us-ascii?Q?XqXlEcmIgwNQl1zSZZF4w0VzL7fCg08GYIBO/8TuDBzfz/bf1AkNzQtoOwwQ?=
 =?us-ascii?Q?1DsobfHRJTSYTkadUOZBRUuUeSGs3u+H+Hcfzh0IeIG5NAIEXf/VDQ6YMIq6?=
 =?us-ascii?Q?v9ilB3FTKA9jOdlHxsDG2U6HrjqxGimISsQjAr0Skl8xqB0VQexwbrX6GvA2?=
 =?us-ascii?Q?iAC8wQTe/1MBwaSKncWyiyq5m9kxtJf7tmnhNik5EpXaK076tEsH8p6aVUbF?=
 =?us-ascii?Q?DPNALvvVBXWqlF82swPznsHmAWu6o0coMd1pmVQexQn7sAIY2WWoPK0chsRQ?=
 =?us-ascii?Q?cUEWtmKWMP+Pbr6I5uXiXR1BDQ6RuJOUPGC6NYqWc0Xjs26G9HALGd8r9bfK?=
 =?us-ascii?Q?/ed9DMT9zY4LELCu2R5oiPHFrtdxneO746XkBba6r0Upp6soEbRzeSC5/tUI?=
 =?us-ascii?Q?Y33ltUYAt8uUxEC18TlYedEqX4wPsbFedfqV3mYlTC9ko1+Q/WfhGNygnYr3?=
 =?us-ascii?Q?WTYcVjRaa3TalIkPmYrVC37W2CvFuVTPZVHGspQAZgJxQj9Ay/4uxD0JdKOZ?=
 =?us-ascii?Q?6xH6Jr99luRwDb1L9cDEuThSZLDuyRtcQYmlNbrxV4HjaSGLgbUPaRHoCVZ1?=
 =?us-ascii?Q?GVXq/vvS4QUOnsdbKvNYkYEeHNRV/Vplp8Vt5NbP6qdNm3uWab5WBWBCgnP8?=
 =?us-ascii?Q?zSx2i2vZ/YnK5H9FAunsldN9mUp4BAfV46384JaFpjHekg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WHcdzhph5L8hlBQnpbiHwFcUUq200T35CEWNb+1JmhtiXZF5GHrYcQd8icS9?=
 =?us-ascii?Q?h5o5zUkHiZmiFRZk+PEjGDdD+l6m0Nf+tbhwFxYSdnpUxV7cryxu5BTRp18K?=
 =?us-ascii?Q?5Y2jQg6E9fTqaUAiKj72/0llYG4oawU0AJ0kM84RD1y5o2JTyZUs6D4mxJ4Q?=
 =?us-ascii?Q?G7pxax3/HEokewN14U1YXFseuc6LhfhlC9cKWuGjl1zTFqp/E4/wx9/9aGfu?=
 =?us-ascii?Q?ji0HxJQ1MH4jT3aV0FRlfpHz54VYQE/OVGpPHS1OBAvs/OHzuoVp08YZgc+l?=
 =?us-ascii?Q?vCXANVTHmkxa9vmW1TJ8Ks/68qXfd/4mY7FpCJ71LtI6lZcHcRRhB8MzKQXs?=
 =?us-ascii?Q?1z1B6yyBqcxoCMtsd5vqLyclnQCORv+IdVepWRCn7Dr4yRrkiyXt8j8qqvJn?=
 =?us-ascii?Q?0UaX/tlw+yNofT1PdEuX21r/N2CWh9eVLQaWIYS7fajMzBHoN2biq1uUe4kc?=
 =?us-ascii?Q?MntNng/4zva+XCSYzzh5fjE8bzEyhcMEhczEJcBeP4tcn/lbEeIKuJM6hh/z?=
 =?us-ascii?Q?8ULEF1vQrJD5Ka3CcdVWKBQEDxuCF98QKpOUA9Blur0u6gSYlhknWnUOxMmo?=
 =?us-ascii?Q?hBCegui8klf1aPQ8vY1FLDzICsWbAQHTyV13RA3Fn3xlBqFYocrsorlS9A0F?=
 =?us-ascii?Q?jPWDG58gmTwuOTCWmzwe1pDy/XaHr6EKRhh+GG++OOwwshVnut8LGkdm3i6Z?=
 =?us-ascii?Q?Y4AiYyhLwkryjadcc6LEvomq9A6jTWLXwun2ZCN9WlvNdu93IN7nKaF/meIt?=
 =?us-ascii?Q?U/nrHxcZqqFvxcg3ZssN4m7cCmOxVs1qFAp/LUbGXJdEDNGG7u68lBNGQVBh?=
 =?us-ascii?Q?um4uI9R9Vv3nbI9TO9yJRR0BPvKr88YHmVg09U+UL3ynswblgtk7gft8+7s4?=
 =?us-ascii?Q?xzm/+2HtsaSCg+FxF7o2/IOuscUpgmWw1MkyQip2bAgc305QCgpROQIu5V/b?=
 =?us-ascii?Q?LfN58EkU14X+94ck+8IMnMIFbypCVZWXDssxVwA8uKBav6zT8q0n5UZr64NE?=
 =?us-ascii?Q?l3SgT8Tyz0cZyoCtIOvfW6BxmRMpXoqSqxRszXwB+ZX7OkkLxUa4QRrcwSyy?=
 =?us-ascii?Q?7Dowao3zyqZ/DSYniGpUGee4K34AaPdqKZgcXHq/XekwWWx2oaWISk8sZdm2?=
 =?us-ascii?Q?pTYQyaulf6qE7YkhhRHDx1ZEsbLPMZE6/Z4+8IMXt0sVV5pXKLYpP3Gdpiwh?=
 =?us-ascii?Q?58zn3IUeBe9MVkT5pfjaPbXmXRU4uAYO3/icy5X2hLM3Q2/wDFagg1011oic?=
 =?us-ascii?Q?nhHmOJoDv1s61qymbgSCphbRbMEd+d9bLXk6ZyQXb6/rg4PZWptcb1slFFcy?=
 =?us-ascii?Q?E1rBo3hNKeGNKRI6I35gKwkQIqlUx97nx7hhMrzccGbMkyxg4BdnkRuovhxd?=
 =?us-ascii?Q?tJz/5dBwe8q2XB7WQuk99ImH7EvxLY47drt9W7psT/NoDPbdkIuUOEKmpqtt?=
 =?us-ascii?Q?PFryS+zbUZkLKDyqn2ZP/ruEnl9+v3sxyQqw8kd3n1CvV6bxbERnKepxEhSA?=
 =?us-ascii?Q?A64AwD6tR13tiOvjpxh7u6FdYH+M8ZvZQnd/s6TOYHGzMjaZ+S/wo9P9kh8N?=
 =?us-ascii?Q?6RV+ArlYffRmxkKilOIGZBUtP7E8wiCHVHX23afHGOz7zkv8GggAkF0E++oA?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	LBhzT3+xQGchjpYnCt4G08fQJ3M5j4tabeZcGiymgVYurb7oCBaSdlBhTFWVqgGUUf/by95f2McWWnGpPkoeTtfTX5fYZicOKEwLNwvQBEelYibRsYsqWlH5qKSG2DUl8NWs1bhKH85UGniuus8NHKIjXUtpbl8no14bVtW1QrPWEKtnSNxkzftslR0zo6TTk2pThhG3ICVT/BZKLVH8YFg65B1w7Ie0i9TUHL+7OjDqlGzqDJYnEznvILRk9Zmfo/k06/Aw+328pka/HMhhGUGK7ykEDwuDfv35sF2Q72SgmcoasDdNQ6CmlHdOz2YsbubjLKMOEzUEg17gYDxS4tHZiHDFggBefA6vuhIttb48XccIhGQUayBwFGbU7B/s8VvEyEpJhNsmrO78+ZJJq5dpdZYR+rHeXlO+5CIAb2kA8aiK9tVrVh3ouYJ40HhcM6nuHh14r6MNjji3yUjMksJErNcZ/6J8+2I49V4tXBFA8Mzqs2DKS0CxZMyXcUOWotff1Vw8aErAkG2q1QqjhiIiTEhv1hs0Q8NjncFl/q71whWoQBRKczByR0UFwUq5rJ1wa5Fnq8xE/vFNNpO2VeYyTC40H/MsvdhpcJeWUsA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e94263c-88f1-423a-a1ea-08dca83620dd
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 21:02:41.3873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vAVSKPIwlol2yi8+vorR3Vtnl24HHjc8BsDhgr5TLyWDXDshphWsClh+eB5/g9FuT0WoB199IPtDiIsvzRuu+h4ubNf+CQ0Ez4b9uyto4Bo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4656
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_08,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 bulkscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407190155
X-Proofpoint-ORIG-GUID: ImCSyd2CiC-mAX7UyRCu1-yU0OBMJyMf
X-Proofpoint-GUID: ImCSyd2CiC-mAX7UyRCu1-yU0OBMJyMf

On Thu, Jun 27, 2024 at 01:38:50AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>

I agree in principle that this test should not depend on a specific PC value,
but that leaves the issue that with this patch, I do not think there is any
real test to verify that the PC value is sane.  So, that probably should be
added.

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  test/unittest/error/tst.DTRACEFLT_UNKNOWN.d | 6 +++---
>  test/unittest/error/tst.DTRACEFLT_UNKNOWN.r | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
> index 001903ff..bfc77bf5 100644
> --- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
> +++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -19,8 +19,8 @@
>  
>  ERROR
>  {
> -	printf("The arguments are %u %u %u %u %u\n",
> -		arg1, arg2, arg3, arg4, arg5);
> +	printf("The arguments are %u %u PC %u %u\n",
> +		arg1, arg2, arg4, arg5);
>  	printf("The value of arg4 = %u\n", DTRACEFLT_UNKNOWN);
>  	exit(0);
>  }
> diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
> index b11f6c99..3e7caac4 100644
> --- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
> +++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
> @@ -1,4 +1,4 @@
> -The arguments are 2 2 4 1 64
> +The arguments are 2 2 PC 1 64
>  The value of arg4 = 0
>  
>  -- @@stderr --
> -- 
> 2.18.4
> 
