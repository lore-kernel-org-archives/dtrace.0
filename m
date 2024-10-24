Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00F31B85DB
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 11:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729769922; cv=fail; b=t0AY8CrCiXOwVmssl+sIHmx0QWnKo37M2y/31KgTzdQDJBZLo2EfqRZkYzNQp5R1ipvEv8X3fDqvhTDTDOn+5jIORhyLVQnj99n6Eor5eTCM/mqnLR/MwNK4HnlnBNpXC2abNwBxI+kUFUE21l3y00ryvFbxgc0979+ARNq1Z7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729769922; c=relaxed/simple;
	bh=pnotVQFpsAyWxxpEu5IxwIP9eLOD1WEhDIPhUbPbeCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f8lyQkZxwsx8Fb9uTJBV20hFnU5EcFkxgbXm6JPgXR53L1Xpu0keO3ewj7ua+0KlopwzL0JzyH1F8Oi16pnQ5lQhM3OZsDr0wk5AFkIkVKwZRUH6RJDldJh0LWec8yo6nMTSJIfMpO8s21ezKlc/J58M3h8QbxGkIXr//IIHLX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Qb3JG1X5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=z4XCMkmZ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Qb3JG1X5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="z4XCMkmZ"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49O2g1DK012654;
	Thu, 24 Oct 2024 11:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=FVqurjy/JzxWdQmsdGLIt1UAmf3cuia+pl0QqA2aF7A=; b=
	Qb3JG1X5C0N03LgBnVGEeknjNBe6mZLEyaWnOQ7gCm5KL/wYn7yUTYe+IopAoi7u
	ndY+aJ0m1ymAkePpVx/SvXlCYkoZKzm9vWF2KdoXVxBFoZk7clBShF9XC7nDXjlj
	JM3X6o0/sMiTfI0we8gKh2VFfUhw3ePxNalw2qy72xE+VPsoeLMViVDJO3Tf9DLx
	bJNU+Nk2/S0J9yp0ChYeeVKiLoJN8RxVpeL6hKBQ9fRVYBi2P2zWyDvdlJuG+qCR
	ZmQExz1MMct2+hP6qMOoFGgBigXTM9cPRK+C2jUjo7lAiKG/x64hAaxYFiWDT/je
	SB8vXv90dH+V8BOClPA5fg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c53utban-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 11:38:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OAL8bj036212;
	Thu, 24 Oct 2024 11:38:38 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emh3tgru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 11:38:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZJ0vriRhnHYBWkbQrDiwyrWLg9Rz1mONqugI3DgOg+FYZ7goKIfS1KE1vTfCpGMgpTCslB4/XFmP2NeJiQxFA34g1wV8zGTOrnKSvkMnIth6ao+iCFdtGYov2VAVpl+klAaatTkIB/iWFMY9fuDEf1ZvCKmk15plvnzxk+IFKG6IJrzfXjL9XOZpsy68GJLAyDvjIEGVxtc+hioUZB6IyJ/A0ARjfhEE/tszvhH6YgyUcMiHkm4YjoHtCmJ/rM+UDg7+YQLxPu95hP+F+18TPZk41FNWLfSXAhkEZkvd0Vgm262VTI4hXfg6h9Bkxc8xZFObhKKgzOUfL0aXFrLAiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVqurjy/JzxWdQmsdGLIt1UAmf3cuia+pl0QqA2aF7A=;
 b=jDWUCwYd3Y/O/KK8BEIbq4Ky/lp+A5W9vYLtCFtxd5NkX689uf+9GveUVhBBnuevuyi2e8UfXdgDc1t1chvvrwkU0OVQMcFnW2YxME4W7LJUgReBSuSlEgXc90FzfoK+qtEQdBwIyJSxWxDSfVBm3XkU/ZxD/Owi3b4f9oSpJq4Lr146pJBuDDzco288ndFU3sLEswSzT90GzPWyYyLj2wpn3zgk3RFqHWIEcA0G0BdgB/pn80f00/YO4pZEOG3ug58FF3hgXzhjHeb7tee9zsuy0B3+VntIIPBbnJ+jZPXzS0yoR2LOwlmsBSdkfXaxo68uI/bcSHvT+c7fqsOY0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVqurjy/JzxWdQmsdGLIt1UAmf3cuia+pl0QqA2aF7A=;
 b=z4XCMkmZBGEkDorgVPCWqydQFMjdwMX5Hf2ZfWcO3a9pNVRlIp7FU1Ib5d8fnDnyQfMK9ywGVwZWvMP8hwCFUiv8pTQR9qHEI0N/9NUnnqA3T1DltDbsq+3JKDTeF9Rm8pX/EZx36fglGn0jUt0GyAL+6Etomh126fRDbWzUcCI=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by MN2PR10MB4269.namprd10.prod.outlook.com (2603:10b6:208:1d1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 11:38:04 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 11:38:04 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org
Subject: [PATCH 01/14] No longer depend on libsystemd
Date: Thu, 24 Oct 2024 12:37:45 +0100
Message-ID: <20241024113758.182050-2-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241024113758.182050-1-nick.alcock@oracle.com>
References: <20241024113758.182050-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0595.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::12) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|MN2PR10MB4269:EE_
X-MS-Office365-Filtering-Correlation-Id: 864d9458-5332-4c09-ea6c-08dcf4205258
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JRltfQWzGqucoftPzyNujJH6xFTpKlzEWj4QWv4IUaq3yUZN7CMb/MRiTlNI?=
 =?us-ascii?Q?KhoXKxU1apDDyOkOejRDFNhdcn2Wu9DU4Cnebk05IELsNHqNYDOxHUAs30S8?=
 =?us-ascii?Q?oq5NleN/BL8Tly1zsetiLsPLzDj/z2rtyVnvnzMAB4UPiFiSx5btUTvYROih?=
 =?us-ascii?Q?K1HjmvzzachbACy8KvELUWyTWgUCHfH6SfCxDQK5IJXpx2pGaiq0iLcpSpm/?=
 =?us-ascii?Q?ImAznqo6vNQXEsGL+d7QVHlq0znhnNL8nYYMov34qbdADejhMaoWoH1/H8TM?=
 =?us-ascii?Q?Omcrsddb9ShTXHp6kgJLZ9mJZ2XgL3HIa8YIBiGC+BaSXD5BWQE5HU72rYxu?=
 =?us-ascii?Q?rwozm/UDsTZK24dbFtsmqKp8ehvZ9q1FGj80ZKpbbfH7w+kMRp1jvmOhzufP?=
 =?us-ascii?Q?MTKoHFc4bqkMD6LHDAQgqZD+qVDKKuc6fW5lN70cDXSSLAOiVkxDkXKPSqCF?=
 =?us-ascii?Q?ZBVZm7y3SmjcbcW3As0z5e3Dib+PWNQrPraT3BDwlGiUDZLyh7BPpDjiLE/a?=
 =?us-ascii?Q?nSPdT84zWhqR3U292JDliddEBNmPlh3Tb62fc/Vkw56JAn5mQNOFmSUguxxA?=
 =?us-ascii?Q?cQxkfDzoRVxdPw9NZKSmHf0YotxZ6P/gJ4/BlSx/eB8mGDvakMMwP96r9pUZ?=
 =?us-ascii?Q?x5D7WE3PEqWR5refUX+KJRRhlUSTuBHBjDJ/y/eHvPldu/kVnZatcTCSbq09?=
 =?us-ascii?Q?fLj/mr/CJnE6UgfjCwqtK6eFtso7/Nt3SimYWznaI9tlLdi8DqDus1kg2i27?=
 =?us-ascii?Q?MxpHw+XyR40kwvofUPUngJWpr1/PLtmsa3PT0fCHEI0KO110/5dkdjfQ9cyY?=
 =?us-ascii?Q?HRcPfSGppvPr+jEIvKKT7Vhkp33X9dXl5+/a0DjDBUeoif2CDWUErAvKcull?=
 =?us-ascii?Q?dxvcFb+gY8G0S1oKYbbl+3OcGhgpETaT7wbZqAEN+c1LVh2MvqPlpXug6e04?=
 =?us-ascii?Q?xlcdQeL5um1PkqGW3PTDqmZNpSk3LQOLSzfh12ZoXNjDZYFPkDlOcBOwUYY4?=
 =?us-ascii?Q?Vme9AN6cdq/YBgb/jjhEAnGD1E2IXyqraNIDOLYoHGQxeAA7i5GJCUe+YI7U?=
 =?us-ascii?Q?7LA6XbwvwfZaVErp+dXYAukI5eyWEYsa1XE1UWWLYlU+8cvsSwFkGyGUqcMN?=
 =?us-ascii?Q?cxswELZOqGEGBZukVd6VIGZs8GoEHlF0RHTdJCD8EAZvGnm7vLLfWJBVsXcJ?=
 =?us-ascii?Q?zaKQ97LbtJgGJMfNgUpNe9fr9sQQ++NSVIZea2VNEiAXBiJxOR8Sq34yQc7D?=
 =?us-ascii?Q?SrL7kd5MWgoN7jbgx/BzdjwNVCtNkmwa1StwfMD2Ug=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rqUxKtBGaGSbyqrCefsNWvBjk2VDwNg725sJfGgIXgbxgFhtci0Y5tCyvtZA?=
 =?us-ascii?Q?6pXp/JzRRv9FdveFTzy2t7pvk0jNR16u8iyxII5XujQPBaZV/dNfzgAUTOd6?=
 =?us-ascii?Q?n+TgC8XkGfOD7bXrdwX8XbLHmcewwnkpT9ZdUT6Mb2TaZHxidcX1VlynRkvU?=
 =?us-ascii?Q?EEYF2QqGjLTwOe0RsyccQyhabkRoBjysCMTSPGFIqd5aYPyDsZqErtADrLPG?=
 =?us-ascii?Q?tjyeZcDJPsaJK5YBYut0c2BJXS5PEDTTKQBwdF7oKJnOLRc24YW2r1sRDRWS?=
 =?us-ascii?Q?n0B6gFMfuLAEXuonROV5SmpQwzMM2qeC30pcnXDZmh25zKFWe+AKsZGUOT+H?=
 =?us-ascii?Q?4Z1K3uZN/JaTOsDNnMbOUAxH1jzKD/FufXJupP1Jt56pX8YCoJZq9vF6xui4?=
 =?us-ascii?Q?gejN3W/qKqEdf2ccd6pVHHYO9iw7t14BJhx6MLsg1SlK41Q/4eH5nrMu5WzJ?=
 =?us-ascii?Q?gIx3FK6A5/ruD0xYlyGCBhfAi+o/XliO6NIWuhBtUGU8CDZMvvWy/fajLqgJ?=
 =?us-ascii?Q?gfszaMRMznGW3ATI41yg8SfvTFM/NKI7lx3GrOh5iuP5mXpjYw0gxOs6/7OA?=
 =?us-ascii?Q?r1PnGUYSsFExNNd9ywZt1asC2MO65ik+isUBBzJJjds3MdZ77qsp5YJGFVwP?=
 =?us-ascii?Q?wQUsZ9RGitR+UfXafXYjmAiTtp3TixcxszQP+zgxNlF8sskP60C1siMkoNDx?=
 =?us-ascii?Q?kgtA80/GmUVxUlYNOIn84hcZszAR0ELrsxj0d6pzjAa5H+GJbm3ecgvFTa4e?=
 =?us-ascii?Q?LdkhqFbquGlLG4BFR4qj87kodbyRp5kT6Q3FL+U22OPAo29lmG/kbn1jEDXh?=
 =?us-ascii?Q?6zoPgcvnUsiTf2rU2O2+9grerwRdYuoT9crYDWVdSijAsFp+I+YInYi9UpyE?=
 =?us-ascii?Q?fqSYwicfLtpIf8DpV1r3Yl3h7XyavqUvpxnJlbg81TzQxuUdzdGG9JGe5brj?=
 =?us-ascii?Q?osIyVYQ6jhH2MA433sEKJQ34AASF6FMfZ4cAlHPmDAcGqN+v8hqhOj0a+EX6?=
 =?us-ascii?Q?sL0JXj5hwuyb/Xz0dETYVXNmk/MxQSRZDh/H9p2a8NUarECqa0Pz9iIYt4E9?=
 =?us-ascii?Q?yseO8tsItBraRqzfGiTKEAqX2wIgtJ/nnELir0DJbjz6XPCOTqXNOjngSkqK?=
 =?us-ascii?Q?10jwgKpA9HFJQq6vU13FJ6Al84q+dtgvVe32L2Snm1DwTYSYSlvJkPSjvgay?=
 =?us-ascii?Q?jI5pDjGAfepimfMebIdNI5KNOf8OZky0HVVDOjdiatRd6zszdsNpGsxQuQQu?=
 =?us-ascii?Q?ljys3aUqL523TUXn9tpCZ7r/1srqL5q68zvA8+X9/KdClzPIKheRO8q1h1Tu?=
 =?us-ascii?Q?eid85q/6Bkk/q/a3MnHD9tqQz6yTXM3yBKJl8PAltFtCbIBpwWvcC34n8/pv?=
 =?us-ascii?Q?SV3xPyBbQGyHN/5s9GzohKcFZY/AvvfTwSJKXn58QUI4u6JD9mhPtX4d9jYz?=
 =?us-ascii?Q?cTfb511kyLo3KobeswzdobqDl+G5XUdpZi3C6L78psWWyC6WR2fop0SZym+R?=
 =?us-ascii?Q?gJiKAOPAAuiRJ+KDwyu6P+CHhEAP7Sw0Mknv+Oen9AhIclWTe1D+N8v2ICQw?=
 =?us-ascii?Q?ktEBRZhjrKhZG2H/etrVW45wALk5V++JK2rlva+TgRiQxQqG2wuh9PPfXagS?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	l8MQ6NI+2BKMTsGtj/WMyF1yeIXRY0D4vxb21+OCYxByzjWCAPYQnTX2qlSuyxYb9NgiHq4AvOLKjtuiJ9IQbqfBTtIosOqiZH/WQQtniMkfok1R3zMFxRE5t44plBsm/S1SqO9rjYSYTA0s1cAGIYZTI2dGEvjiinlR/CaoEKs3a4jm+zbXOT5LNLZlQ0PHrTIaquDzJEwudWEu9ga0ZdE2/1noSGCoqRub2ifkbgTI9iam5tVT+VcDrgO+mn5AUcwT4C2h1DN67ECEFnCJbmxgCbWvTlEhXowDgoY8mHfAfFsynh9Po9H3aDcpcbu4lTjKzwuP2ZfgT2jcxwwnA8uDlGcIy+0sqdnBdvwZ/fu3EMdxkYvfoiE9p8FYu6fX9rG1ddeRXm7DX3Aw+WeeLSrnqH84QSviW8QG2u6sIxGAw3VYD3VTdzFh7YzqaW9XZGd0q7d/OoaRSR5IaIODrJKA9q/mFpMoOqFmtxR7dgH75kEsMPDUgROGvGc5MKbfig7cBWkynkVaUyXLt8gZ0gtIbj8djDT/pGf8COrLUMYVH2CRoGlfSd2SfBydoaPd/2P40w7lKXDXAmzD/0b0ujZlRHJlnSl5gL/3jQBkjlU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 864d9458-5332-4c09-ea6c-08dcf4205258
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 11:38:03.9662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/pniXFCgVFMP3TaPkT46M9PQtsj5wmuy8bk2bxbWU4WUvWpaLlfA5LvC55ZRCCLLkEG9dae9zmWsF7xRXsN1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4269
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_11,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410240095
X-Proofpoint-GUID: CUwX0LIXQxY_lY7XAJGg5trkrq3qdgwZ
X-Proofpoint-ORIG-GUID: CUwX0LIXQxY_lY7XAJGg5trkrq3qdgwZ

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
index e7657d466df5..99960227bcba 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -102,6 +102,7 @@ PKGCONFIGDIR = $(prefix)/share/pkgconfig
 INSTPKGCONFIGDIR = $(DESTDIR)$(PKGCONFIGDIR)
 TESTDIR = $(LIBDIR)/dtrace/testsuite
 INSTTESTDIR = $(DESTDIR)$(TESTDIR)
+WITH_SYSTEMD = true
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
index 4026a3eafcd3..42e496b97a7d 100755
--- a/configure
+++ b/configure
@@ -93,9 +93,13 @@ built locally, none of these should be needed):
 
 EOF
 	make help-overrides-header help-overrides-option
+	cat >&2 <<'EOF'
+--with-systemd=[yes/no]		Disable installation of the systemd unit files
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
+        --with-systemd|--with-systemd=yes) write_make_var WITH_SYSTEMD "true";;
+        --with-systemd=no|--without-systemd) write_make_var WITH_SYSTEMD "";;
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

