Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BBE2D047
	for <dtrace@lists.linux.dev>; Fri,  2 Aug 2024 05:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722576017; cv=fail; b=do1jD1r9lAlzomT2LbdzYuEGHxWyZhKxv9viWmMiZrnGPXDsjZx6udAAD/dM2V4qFaMk7JufLOoksJbQ3sngtGfb9fYL1GQ2TQpILJZAKeZSjZkXYBwVE/nkzhh6oDts0YTfWXyMb+0fQvPWjvZPrhYwJWqE7FwsXNYh6rwujik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722576017; c=relaxed/simple;
	bh=+6Xytjv61/M339nxjnHPy9z4XwSBqhYAfq8QkLgSWLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ct195BZx7emffGZe8gWXzrct/llhJqZx07qeC7BzmtYvlRF79Jc9kz0zmtzkPa6xlbh3/42R9jP6hWfl3bw8SdrzVlShwl+v0V9du1TjuEir9KklQ29knOnK3YmFQBqa4W65ToPtHBJfpqYCblwR/1P50xDMdKTRwhg/kWMwiYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=B7+HvkJH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IqkzU5wQ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="B7+HvkJH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IqkzU5wQ"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4723fZCo021997
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 05:20:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=1C3AxpxfCL4jTRj
	Gpxv4sgRC5Ys595HaifH9R03oQFI=; b=B7+HvkJHu3Csytj834TKSMvCJ1u2emL
	0kdmMpIHj9TAe8eLAdP1+DcaGS608ndlIgcweV2gnmBLwWZjwe4XYvuDxaVRTfHq
	BCXOB0AZ4Xp4O6epFbhRPC+63fX9GMSBh3122+5DX/KWWcUDhoYdxhTO55h+TxKQ
	0xYX/amE3qdXrbLd2f0mggDwpEPxG6qZ9rYDRp9rhW1sMChEsso2qzp16ZKX4Y+5
	A18sd6O5Du9/nWHxSgjtYu3+fQbZ9+iz2gH6qyGC4wMqoq6RUWGJzw6BwxqtuUTB
	o6EL066NjNTJhUeqHLdaYZRtaRrutOJAKai0w6aJRDwwRrvGAEVwWgg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40rjg5gdq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 05:20:12 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 4723uhV7030831
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 05:20:11 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40nehwrvgc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 05:20:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=btix/urBH3POqN/DyXv2UkXoIBnKeynIyXMZWI0Tz3TZISpxgQP1yqk3Gmu3STEz2XrtVDPlP8ahvN6ecebV/NELqvHudqpzjQWH3FowD7ylUph1TPXud7viJUn6xRWst0o+Qx3YW9Fykc58vdemLl6VdAwrIMMeObVwnzPzRt6zmTUig/skZjhhCnYv3zjqJWdPrNgFCiG5wpEMSL5whGLSKFE/1dFXqHXvq89iVaI4kEgnOM3/7bZJseky0jGdoiS2cgDi4QcjFoTFba5+XGyihl7NH/Nrs7hvwX4oFluki5HY7tkkaJQcZAw8uS2FJYkiDq+Un1AQ4OgKntZ0IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1C3AxpxfCL4jTRjGpxv4sgRC5Ys595HaifH9R03oQFI=;
 b=ps65bdkrcmE2zjpAGUi7R3j2VUP60L0Nn4DN03bnzUtXepKNS0FE47YRvr64m11YSnIBJlJ3kvYebUar5D/g2YhEhz6wBtfs+SSJ7eaZO3jdsHE1bGttOH+L+quxjKcaIkq6l9y4OtunIw8bzRLnzl90/9s1WNniCfDD9S9j4qCNCocX2GGuml3GENx53IudhSS1L7kKnNRfuIOc1OUf+KG6F6YzpD2wWvKYX6MgyMgveBBL9F/u4vmYH3srbiE0zcBiZQeXDxGztRCSV9gc8HddipnlwjA9vd6LDDYLF4AzRRVV4z43YolT17oQBD1C+AmLekppzrUnJqcpWHNZ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1C3AxpxfCL4jTRjGpxv4sgRC5Ys595HaifH9R03oQFI=;
 b=IqkzU5wQTyPqkr0HYEuNMRBW9cG2OV0sdB07bmzkULqJHUWNuE/DvJYfPkF0QJ3PzBlpjRwmLjkhNHO5Kmd4/X3vUx7MaPRE9ejUecq/d7PQp3VJi050PUEIm4y5K+ABO4Fmc5nUhdmQalZRSQivBXU3HHlayaATYRxK8qX9S1o=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by IA0PR10MB7604.namprd10.prod.outlook.com (2603:10b6:208:48f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 05:20:08 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7828.016; Fri, 2 Aug 2024
 05:20:08 +0000
Date: Fri, 2 Aug 2024 01:20:05 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com,
        Kris Van Hees <kris.van.hees@oracle.com>
Subject: Re: [PATCH v5 1/2] print() action: identify ctf object used for print
Message-ID: <Zqxshb1wmftl62pB@oracle.com>
References: <20240801212912.2300220-1-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801212912.2300220-1-alan.maguire@oracle.com>
X-ClientProxiedBy: BL1P223CA0008.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::13) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|IA0PR10MB7604:EE_
X-MS-Office365-Filtering-Correlation-Id: 2acb8e4d-c4f0-4fef-f068-08dcb2b2c67d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B7sVFtoKCRFdMoh7l0UkYF7lrzmwB7zekJghWv24mZ2TR3678twYLSufMyZn?=
 =?us-ascii?Q?DcojlE5AYj8vmYR1UBciNrNx2duFr8TPLKnNsZT6JAK6TroEqtZ4MvSQuHOI?=
 =?us-ascii?Q?pKX+nFhpX1olDiKE5S4BUjBO/pd7bHCS4zYXx7ZIZWNWdyNnzTsLIlZ71muT?=
 =?us-ascii?Q?WbeBEw73KgDfRmEScueFMVY7MQnJw2hKcErjNqpkXmnTlQG2f6mGwGq11AiX?=
 =?us-ascii?Q?abdiDlGaTB2O/8WKUgHF2NVOIFBHuPPzH/JWlYyGRvUos/7scj4AxbSmBaXp?=
 =?us-ascii?Q?hHLTN0n1omYXEFvUQxzEKIMLdAZFL6862biyMJ00Zuy505iHj+L5PK8pzQnh?=
 =?us-ascii?Q?iw5nnPDVIPJRjZX4R3dTaNqg5j2nlj9IuKM+cKh+Q6vHhhZ35crBI8B8aNj1?=
 =?us-ascii?Q?6bKHm4MpsrAkhmZYyc133UMKfxjuj1xN+8UF15fZilOj03K6NAaZf/rl/7pZ?=
 =?us-ascii?Q?oRWGjfMi/1/Qeg2iCon25Wuh+JKHmlCANtb+mlNRlfANBhr133MTqq/4vD/O?=
 =?us-ascii?Q?G/31O8cYVGaBefnxIyi15sBqiPM04TV+F0WQGOrqVj36EKwytvwrMz8cKMbN?=
 =?us-ascii?Q?N35oxRVq3PtF3GgETGi4ouqIIxA72rUwxwQSIW9yFB6bciZnn0pIXfJPANMa?=
 =?us-ascii?Q?6gML0ghNVgu9r0IcNQgolZQL3QvmfE1BOGCqUVMeopIX4VP4FRjsWtyko4P7?=
 =?us-ascii?Q?GuFp+O37Fs+mQ2KGubua8XVMpSMUibX9yj4QnGlcdZ30y/XeptEcRXugu8rb?=
 =?us-ascii?Q?aLl4NIhgyrRcbVzoFYK2dwXy84V+M3NHoi3osxt0U5540/NzFN6R75NBtuB5?=
 =?us-ascii?Q?m4idAwMrgK2obozJOfYIHf9drlvq51ngW8CfzoelyrxLnBpaTVpUKM90f78f?=
 =?us-ascii?Q?DeQ7ClRRGjiz9FU8xJ55GFIXTPnpW653gWuNgQP42cv1QHNSXmSCsMQm2lSP?=
 =?us-ascii?Q?Jn8gsIUYyowUrDz+3fP3EeCJrnv9xyCVOiR8L7IlvWO3HT4OTtUmYiXV5Qe/?=
 =?us-ascii?Q?HN/GOM4jJLE49dfa08qY8V/gIVu3LgMp8jWvLm0KlYbYlUSwxhuCEH6cn3G7?=
 =?us-ascii?Q?cdb8buVjlemzKBkLzHveBYQg/81zJYy8bImPB0oAJNeSJiXe9uwqj9pLgGJc?=
 =?us-ascii?Q?+k1WCYP5CNnBMEeRICvf0YuuBGGvh6XJQEOdKFmMJqCBwKYZRNV073KIXL4p?=
 =?us-ascii?Q?3fpu/ObBbZWSYyTrD+vGA4dtIqiyFRrVG2GAFDlbbQBfUCBwxCoNY82pspcD?=
 =?us-ascii?Q?94Xsh14wGSaQjBmGo3x1SJKGmV5gyE3n/igndLTJf1lSY3AoMZTPnG34wgZ/?=
 =?us-ascii?Q?/uhy08BDu6Tm5tr30omN8vt7odbavyqYaIZR/Dcds+vNdA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+aMMb4utuZ3qoXgFxSGmVpBB7rPy83ZeBMcb+o6hPLWDLwvX8xZ4hlR3qna2?=
 =?us-ascii?Q?U3k5PccOFWrnKYDFP11odQ0/62h5V+vkFSuaX9s78J5X8ere/r7T8cK/xEJo?=
 =?us-ascii?Q?VK1/dJN6sjeP9TrU7fIfCAsxknmAXitbqj+ITaCnc/SWCCnj5niGmUodg0Ly?=
 =?us-ascii?Q?zFD4zKBCLBKTeas3HbdeWmfla+9NlIdWQnG1rTE2nUKkSLNRa93+SrYde9Wy?=
 =?us-ascii?Q?CM3tKe56kE7UzzWDH4jBTj5637jhl8njAMbracj7FbOeRm2mnOfeekRQGOW4?=
 =?us-ascii?Q?W3hrRUf7l/MV0bftRZq4HYGdJonus8qOxd9Jg0VTihUfW+Lw3IHzeIfXJsct?=
 =?us-ascii?Q?Cwye7SOoKRPS+YqujymLYlpgIi9jst3seQTSny/R/fkf/qRD3seZ0/Quv7Gz?=
 =?us-ascii?Q?+1EVq8C96N2cHeBbWHktifIHk8HVWP2I4lQ1n4xLa5/JW4Q3JaVw1K9Veuev?=
 =?us-ascii?Q?iAiYkFKJwAMwYteyfdb56YFn30G2qfSikl97hkCcHWZSSXrJ/qrkWVRdApYJ?=
 =?us-ascii?Q?6QjXMtvkto3gIp1PGQfPUfoUNh+TXmQtf6Nx5Rea+ABhiMoRx7gXADPq1d+j?=
 =?us-ascii?Q?3ajI+sdkcOF14SkFm6F6iRJcfmXV3s83geQZHKxDzlz2pAT9XNT2b9EgpTWm?=
 =?us-ascii?Q?bQ7NB3iGUko6+tOokN24klGK4nKzKBxE2owj+b+MhZ/Git4NpJBLnPNo++bd?=
 =?us-ascii?Q?1zCQs4/EqIIRWf8JVv5957i4vR6pf00hvhog1T1vvfJPngS0OW5Th8hPMTdf?=
 =?us-ascii?Q?qBVgeJxHsyVdNX6WepEhnFUqyeAjr8Ppwo8aJ3irllZOeoxc56ERmhzzrICe?=
 =?us-ascii?Q?fJT0Vh8jnBygvje+AR2gwGqPl7N6tgLbSqWkqz9XrWvHnwXuGKewiIAx6vHj?=
 =?us-ascii?Q?u+AtWfBzmy1LuuRGFghdNEnfOR6OB5/U22C2cIgcg08Sb8+WINETssWuNSyZ?=
 =?us-ascii?Q?cjW+IcnGATz+FHH+ePTJ+WZB+03/gXho6vg4nUS4INRFBBvZDh3xDNXC/dUt?=
 =?us-ascii?Q?YB/yxWzpUUwEVcLdpyqMofIG5g+BJcglaI7SCGHvrN/LkEQaECm0IILtttn6?=
 =?us-ascii?Q?u16lfUlX6q4Vw0y8U/d8Jy6UezjfOAolTztAACcATPQJ3UiV1qKKY7I1bYmH?=
 =?us-ascii?Q?YyLprMGDUHQYsJUpH6aogM8mMFTkVoAMyMX+O+nxWZ8A37kGxBj2XNrHhEC7?=
 =?us-ascii?Q?ku7MLlKT2PSj4Pdz4rZ+J8JNfetn87YYu+DNIwYyrsIS9D+KH0sgw5OpTDS4?=
 =?us-ascii?Q?FzZ7erUQzlvnq2V7S/RiyNly8othEYpmASN/FasJI72eXXJ8WyZeTb9Mkx75?=
 =?us-ascii?Q?y9zSQLUxTokdcT0zH74oFcHospu9GXkEEDaozReDMGme1qqChL8zsF0lw/6R?=
 =?us-ascii?Q?X05HkrZY3cW8zYAxsdKLSMmvqeEIwIK++8+/6RuMOyQDyspFrAI+TL51ig0Z?=
 =?us-ascii?Q?BIjNMXUcEyzPWCtEc7X8kPfrEm+JE8pgCwy6T42B2kMxoW2jeJnuODZG6sRV?=
 =?us-ascii?Q?wWNnjGE4Fr9+xtX6Bx/vUWVv14+dKGp+hfFNvrpA6yQs2BzJGNKIACblJ564?=
 =?us-ascii?Q?3IaDpR9PDEokMSM41t/8h49GPXWkIEHusx6e7UTOTp29mo7i2zTVwTuyuFqK?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KrAvUehuo1UvaXEqzh4exGa6wsV3PrIv9v51NCUoL9Cb6BZuQvPdBSbd5sx37cNNHSlhXhC28lwtuB+WuLFqyjQ4vhlulFwZgkzSKhETlOIeh+nMvBVTK3PZz9ko11vMjYXJBRrK2f2HGnf/d1OoHZrXeC27FerrT+AycikJF+7BJWfHfwLG/sHEyVOfUFqINeiewpjEQPCpo/QQD92/q7IFzoSMWDMzwsyiUzyBxbh6m7WVhbqrLJVtGCFVNWIQe7uXB31+hqS44cblf2HNxYU/8hrvLVpYva1mcbU0pXA2FugAkgDGqaLdPGcy3aqMyIHlNgSwEXC29KqbAx2TQIIunXecewickADa9J9xieZCvLpTq8+MtBhI5iM1JIWZxKoD8q8H8+GrWzFAi9qFAM+nmP6FApc32sydDwIk4fnA2cmw+8ZVTzD1Mfy+Wmuhf0eoXgeSECAz5jGjow710wdRR2GwmkaQtylcBkCYAqc2LFn0GKPfmXmodkGI8oUl/hOLw2sCLMG+2K4gV6awc2YiFYeeZP1bmZeRzG60o/MyS/kLszPAvgTXiqDcUDCbWHMWetfx67naLZMwUye3lGxH1cPwAtzLYt4BuulKP+k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2acb8e4d-c4f0-4fef-f068-08dcb2b2c67d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 05:20:08.4910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 90TR4m8ghYUpVfnWfvJ4Y5a1UlLzkcxsglo7Cl6/8kq5bUZUq/eYSa/9h4lm6heN1gLqBYV+k3hpoKHkmqMbsgkpU/C8wX5AhmgBxjXtDt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7604
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_02,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408020035
X-Proofpoint-ORIG-GUID: _Ga8YT7SqwH_mxWTTKweSPxTm35PXMfB
X-Proofpoint-GUID: _Ga8YT7SqwH_mxWTTKweSPxTm35PXMfB

On Thu, Aug 01, 2024 at 10:29:11PM +0100, Alan Maguire wrote:
> when generating code for print() action we need to identify source
> of CTF; is it shared CTF, cdefs or ddefs or another module?
> Rework the print() action to be a printf()like function under the
> hood using the format specifier as module name.  We can then
> do away with dt_print_print(), calling dt_print_type() directly
> from consume.
> 
> Suggested-by: Kris Van Hees <kris.van.hees@oracle.com>
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_cg.c      | 10 ++++++++--
>  libdtrace/dt_consume.c | 28 +++-------------------------
>  libdtrace/dt_impl.h    |  1 +
>  libdtrace/dt_printf.c  | 28 ++++++++++++++++++++++++----
>  libdtrace/dt_printf.h  |  6 ++++--
>  5 files changed, 40 insertions(+), 33 deletions(-)
> 
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index a1c24e37..164f9e5f 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -20,6 +20,7 @@
>  #include <dt_dctx.h>
>  #include <dt_cg.h>
>  #include <dt_grammar.h>
> +#include <dt_module.h>
>  #include <dt_parser.h>
>  #include <dt_printf.h>
>  #include <dt_provider.h>
> @@ -2838,8 +2839,11 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
>  	ctf_file_t	*fp = addr->dn_ctfp;
>  	ctf_id_t	type = addr->dn_type;
>  	char		n[DT_TYPE_NAMELEN];
> +	dt_module_t	*dmp;
> +	dt_pfargv_t	*pfp;
>  	size_t		size;
>  
> +	dmp = dt_module_lookup_by_ctf(dtp, fp);
>  	type = ctf_type_reference(fp, type);
>  	if (type == CTF_ERR)
>  		longjmp(yypcb->pcb_jmpbuf, EDT_CTF);
> @@ -2849,11 +2853,13 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
>  			"print( ) argument #1 reference has type '%s' with size 0; cannot print( ) it.\n",
>  			ctf_type_name(fp, type, n, sizeof(n)));
>  
> +	pfp = dt_printf_create(dtp, dmp->dm_name);
> +
>  	/* reserve space for addr/type, data/size */
>  	addr_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
> -			      sizeof(uint64_t), 8, NULL, type);
> +			      sizeof(uint64_t), 8, pfp, type);
>  	data_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
> -			      size, 8, NULL, size);
> +			      size, 8, NULL, 0);
>  
>  	dt_cg_node(addr, &pcb->pcb_ir, drp);
>  	dt_cg_check_ptr_arg(dlp, drp, addr, NULL);
> diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> index e9b33cfc..07856746 100644
> --- a/libdtrace/dt_consume.c
> +++ b/libdtrace/dt_consume.c
> @@ -507,7 +507,7 @@ dt_nullrec()
>  	return DTRACE_CONSUME_NEXT;
>  }
>  
> -static int
> +int
>  dt_read_scalar(caddr_t addr, const dtrace_recdesc_t *rec, uint64_t *valp)
>  {
>  	addr += rec->dtrd_offset;
> @@ -1983,25 +1983,6 @@ dt_print_trace(dtrace_hdl_t *dtp, FILE *fp, dtrace_recdesc_t *rec,
>  	return dt_print_rawbytes(dtp, fp, data, rec->dtrd_size);
>  }
>  
> -static int
> -dt_print_print(dtrace_hdl_t *dtp, FILE *fp, dtrace_recdesc_t *rec,
> -	       const caddr_t buf)
> -{
> -	dtrace_recdesc_t *data_rec = rec + 1;
> -	size_t max_size = dtp->dt_options[DTRACEOPT_PRINTSIZE];
> -	size_t size = (size_t)data_rec->dtrd_arg;
> -	uint64_t printaddr;
> -
> -	if (size > max_size)
> -		size = max_size;
> -
> -	if (dt_read_scalar(buf, rec, &printaddr) < 0)
> -		return dt_set_errno(dtp, EDT_PRINT);
> -
> -	return dt_print_type(dtp, fp, printaddr, (ctf_id_t)rec->dtrd_arg,
> -			     (caddr_t)buf + data_rec->dtrd_offset, size);
> -}
> -
>  /*
>   * The lifecycle of speculation buffers is as follows:
>   *
> @@ -2562,11 +2543,8 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
>  			func = dtrace_freopen;
>  			break;
>  		case DTRACEACT_PRINT:
> -			n = dt_print_print(dtp, fp, rec, data);
> -			if (n < 0)
> -				return -1;
> -			i += n - 1;
> -			continue;
> +			func = dt_print_type;
> +			break;
>  		default:
>  			break;
>  		}
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 01313ff3..88b31ce0 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -789,6 +789,7 @@ extern int dt_buffered_flush(dtrace_hdl_t *, dtrace_probedata_t *,
>      const dtrace_recdesc_t *, const dtrace_aggdata_t *, uint32_t flags);
>  extern void dt_buffered_disable(dtrace_hdl_t *);
>  extern void dt_buffered_destroy(dtrace_hdl_t *);
> +extern int dt_read_scalar(caddr_t, const dtrace_recdesc_t *, uint64_t *);
>  
>  extern uint64_t dt_stddev(uint64_t *, uint64_t);
>  
> diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
> index 50842216..e999498c 100644
> --- a/libdtrace/dt_printf.c
> +++ b/libdtrace/dt_printf.c
> @@ -14,6 +14,7 @@
>  #include <limits.h>
>  #include <port.h>
>  
> +#include <dt_module.h>
>  #include <dt_printf.h>
>  #include <dt_string.h>
>  #include <dt_impl.h>
> @@ -2235,15 +2236,34 @@ err:
>  }
>  
>  int
> -dt_print_type(dtrace_hdl_t *dtp, FILE *fp, uint64_t printaddr,
> -	      ctf_id_t type, caddr_t data, size_t size)
> +dt_print_type(dtrace_hdl_t *dtp, FILE *fp, void *fmtdata,
> +	      const dtrace_probedata_t *data, const dtrace_recdesc_t *recs,
> +	      uint_t nrecs, const void *buf, size_t len)
>  {
> +	const char *modname = ((dt_pfargv_t *)fmtdata)->pfv_format;
> +	size_t max_size = dtp->dt_options[DTRACEOPT_PRINTSIZE];
> +	ctf_id_t type = (ctf_id_t)recs->dtrd_arg;
> +	const dtrace_recdesc_t *data_rec = recs + 1;
> +	size_t size = data_rec->dtrd_size;
> +	caddr_t addr_data = (caddr_t)buf;
>  	struct dt_visit_arg dva;
> +	uint64_t printaddr;
> +	dt_module_t *dmp;
>  
> +	if (size > max_size)
> +		size = max_size;
> +
> +	if (dt_read_scalar(addr_data, recs, &printaddr) < 0)
> +		return dt_set_errno(dtp, EDT_PRINT);
> +
> +	dmp = dt_module_lookup_by_name(dtp, modname);
> +	if (!dmp) {
> +		return dt_set_errno(dtp, EDT_PRINT);
> +	}
>  	dva.dv_dtp = dtp;
>  	dva.dv_fp = fp;
> -	dva.dv_ctfp = dtp->dt_ddefs->dm_ctfp;
> -	dva.dv_data = data;
> +	dva.dv_ctfp = dmp->dm_ctfp;
> +	dva.dv_data = addr_data + data_rec->dtrd_offset;
>  	dva.dv_size = size;
>  	dva.dv_last_depth = 0;
>  	dva.dv_startindent = DT_PRINT_STARTINDENT;
> diff --git a/libdtrace/dt_printf.h b/libdtrace/dt_printf.h
> index 9771c4a8..4f4386a5 100644
> --- a/libdtrace/dt_printf.h
> +++ b/libdtrace/dt_printf.h
> @@ -108,8 +108,10 @@ extern int dt_print_ustack(dtrace_hdl_t *, FILE *,
>      const char *, caddr_t, uint64_t);
>  extern int dt_print_mod(dtrace_hdl_t *, FILE *, const char *, caddr_t);
>  extern int dt_print_umod(dtrace_hdl_t *, FILE *, const char *, caddr_t);
> -extern int dt_print_type(dtrace_hdl_t *, FILE *, uint64_t, ctf_id_t,
> -			 caddr_t, size_t);
> +extern int dt_print_type(dtrace_hdl_t *dtp, FILE *fp, void *fmtdata,
> +			 const dtrace_probedata_t *data,
> +			 const dtrace_recdesc_t *recs,
> +			 uint_t nrecs, const void *buf, size_t len);
>  
>  #ifdef	__cplusplus
>  }
> -- 
> 2.43.5
