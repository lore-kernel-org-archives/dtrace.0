Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3DB274FFD
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 19:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758223130; cv=fail; b=DDnhNiIZ+z7EGbYnNgvOvownHDx8kjsnDDMMMbQ0lFgkz0DOuk8EM3V3Ss37MtRuXFYNlJFkr72t7c+z9uVM7Q2Pgmh738+4EllAVXRcZ7kHvOIHLNkZy8XMYFraxs8PTJ03jkozfEdH3e1CIVB2nUuV/Br6B9RXy50fpsucA+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758223130; c=relaxed/simple;
	bh=p8AOjUrSHBcXsxNI4ggMT/dO0I4zGGIcmTsnKSVydX4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ntoltMGmNQEjwogxY4LSdLPjEgEQQDo9JVF88SV5SKQaRFFomctfUil06x2mbkem44IqFT1HK/RESi/sBfk/W1qX0zjJip5tHuYIkwGDbGVBUN+LEIL0RoJF9Kq9bAaF0nU8Td5Cew6i2MO2oOQX0+csb9UKts/U8cQLQ2g77Gc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mOeoinFD; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Ap2Fm2/x; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mOeoinFD";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Ap2Fm2/x"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IGKXde029851
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 19:18:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=RRdKuhKi005VmzNTphWFIf9a4VmLq1+kHjAv83Ee58I=; b=
	mOeoinFDMhVAc0XaeTUvjyXj7Nvkm9GE/lpnFp87jBYisYfW8clRnvZzrRiisX+o
	CV/SE8+cqjZRGbDDDAFR6VuogN0z2JOmeqY4p+pB83jFWL396OmEtrVRSA1YFTyA
	eOTi9Z484Gp0uOxgPwhJ1xg4MrrgEa9JX718YWVasT1vEFBpU/u9v12iMyaULYxp
	9jEub7Aef7ZtSogtyM2/efADBo0/OHnTbeywlF4b4qbfH28bUAVPAil++doWyOAa
	FZNTEnJmx66rH0gy6armZiXgZ5Kwd+ja9HKXZPFTXPLb3IK3+dAMNbZR9yZvCEF1
	B7hdB2rQgv5iqju7HT5new==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 497fx8m33r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 19:18:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58IJ6rPC028761
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 19:18:45 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011014.outbound.protection.outlook.com [52.101.57.14])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 494y2fkrpq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 19:18:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PxjW2qrrp/Gd/+ugkAF4A9Db3Dwycu8/YWZFPSJ4ICj0MT//UZsc9KuAqrLci6sd38aWVkPw38NxUTCd6SXzPKSb8Y3HvmQCLCLkumVzVoLSoU/I91JgtSfSmCZrahiqUQgM4kdVBLnjibObclfwrsgxyK98282Zoah08xsA6uUyA3PxYrvRAJvN0bp1+pxyRqZhiwid3xf0bx0og1a/JqUcHYE06FpzHvZSn6FRBrGRbuYfzY1vopQwCjJaGrW9bOtkMJwI6o7/K3qnyrqk4kcdUeAZJV/HJcgLqcWCfCjXTJJrksTsbN4PqRepGhGVxzJZa1yLegLV9sVp0II0xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRdKuhKi005VmzNTphWFIf9a4VmLq1+kHjAv83Ee58I=;
 b=BBafdsU02yypsf7gQtWc66NaM8//cXwBD9YjMZaDDPNf7zN8sZAGDLNw93H7BzhEHWqcBYoFKj/sII4YulUbWhAIJCg+f/s1JXwzRTzHSohcpgr5nWcsuYXcsNhmEizmT0ymRdnQ26ivyhSi+4j9FxdvBsPWVKdl2fJzF84a/yRtNm2O9/N8jhFjF2W9uoXGDhCHG0c0tGAeYg0rnsydm/2AWtGclCvS/AFRmlBhsUnD54e9WipMeO09udgaanFUu8m8l0rS5cosYaVruVt7J0ARMzO6lU0vcyrMZswIFhm/pae0Ue1v8H3/62WuVdCSOrI8DaBu8lJ/gN/5PxUdeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRdKuhKi005VmzNTphWFIf9a4VmLq1+kHjAv83Ee58I=;
 b=Ap2Fm2/x6T6ev0sZSFCJ35AmdUQl6KQtX+RR2PwmVMMfbB6v9yKc9601dec0nIZmkg7E/xT99P+fLF1faJWP4iUpnYzLZJK9NAh7gyeuHDcRJOr1Skb+t0GebbKXjzu3Op0cUxWSbMQORvGObvZDzHVAYQWiZO6m1YcHeYhX6oc=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA1PR10MB6806.namprd10.prod.outlook.com (2603:10b6:208:42a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 19:18:41 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 19:18:41 +0000
Message-ID: <47bb646d-eef0-bff0-cfdf-d0775154dfa7@oracle.com>
Date: Thu, 18 Sep 2025 15:18:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/4] test: fix test failure when no /usr/sbin/dtrace
 exists
Content-Language: en-US
To: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <20250918180338.197827-1-nick.alcock@oracle.com>
 <20250918180338.197827-4-nick.alcock@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20250918180338.197827-4-nick.alcock@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0049.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA1PR10MB6806:EE_
X-MS-Office365-Filtering-Correlation-Id: d84c9141-b345-4719-354c-08ddf6e82da9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXRPdXdYRStpbnRGcFM5N3RKRnpSQTNRQnltTDAxb2w4Ui9kbThZRVhzSFV1?=
 =?utf-8?B?LzJTNnhwZUVJR3pDQjlSQlVscFk0aEg0ekxZT2FpMU13amFlWFdTMzJwK0FF?=
 =?utf-8?B?VnNaMEordktON09RVE5UMUltb2RPOUQ3cFhRRFpvc0oreTZabnhoNEs2cmk3?=
 =?utf-8?B?L0tzQWt6Nm5RZnNQOUZmT05ja0daRzdHWEhoUStTL0lZbFR6dzVGYlZ5bE5C?=
 =?utf-8?B?YTYxM0VCRFVZdmlkWTdEM2ozL2Nma3V5M0NpcTdWdTBzYTdoZmhqZ2sxUjlw?=
 =?utf-8?B?TE9idlVyMWtLVWRHMTQvalczeEE2bTRqVHVheG9GTHpGbHJUcVI2Ly9zRG9x?=
 =?utf-8?B?d01vWjN4eG5WUzAvakZOdVFXaDBFbUt5dE1mUTJyZUxrWk9aQ1I3WUhoSk0x?=
 =?utf-8?B?Y1VqUnNFNmdvN3owQWhGWXNyenRGVWswZllYa1VTWGY0UEpUYlQ2WW1Lb0JJ?=
 =?utf-8?B?d1NWQ1JuMTZWYlpZdGREcGxEM01hZVlZSEpsRWdYNnM1SzIraEFrUEZhL1BT?=
 =?utf-8?B?REUvUWdQLzMvUkJNZHhZTEZBUk9nWHBVWUNGd1dRVDY3RCtlS1dxOUlrWHUx?=
 =?utf-8?B?dUU4ZWhaamlTcnpmRGVPNFRGS0JEd1lQaWp5THRmT0ZhU2hOY3hUU1JUcEh4?=
 =?utf-8?B?TVJ3VERFYjkzY2JyWHlzQlpENTBSbytGREQ4OThJQzRoenc3VE4vN2diM0FH?=
 =?utf-8?B?bGxtSmdBNFRkSXV3L3grT1NheTZHSUE0b2VVdnpDamFES0ROSWhUU2gxOWo1?=
 =?utf-8?B?TEVuL0trVUcyS2xKMDdTZWxsYkw3V1ZmUHhjSnY1K3MzZGhrbHpvcGhFTENt?=
 =?utf-8?B?STROUGwvaHJ3WjFQWm5wZG94Rk9RQUhWZ0l6Mmc2MGI2eVlzYmtzSm03ajV3?=
 =?utf-8?B?TWxJQjcwQkJGV2dTOWYrL0FuVXBETGVUUlJ4dTJKV2hDY3hsWnNHbnFwbE05?=
 =?utf-8?B?aEE1VTNDWld2SG0wSE14WGVwWjZ1aHBYbHJOV3R3dDRGcE5RVXZKeXJsMDJX?=
 =?utf-8?B?Vk9VYUpHYmlXbE5wVjdydnlKQ2hVbHAzeGpQMDJrWUlTNUs2UHFQbWk4VHFT?=
 =?utf-8?B?cVQ2OERQamQ3S0N3RGpTbGVrd2taQ0lZeDZpR3dPT05ESE4vTnc4ajZoaFBG?=
 =?utf-8?B?R3BQWDAyaitoVGd3TE01cHNZaWRpS3p0cHBBVFo0MHI4QnZjU3QxYnhGV1lJ?=
 =?utf-8?B?cUFScysxV3ljYTQycGpTZlVHUHlwb2lCYjNwNWZNK3dDeTdPb2ZtUnFSKzdv?=
 =?utf-8?B?Ly9HOHhTbXFuOXpjMndrRVFpT0ExblRJWmwyOUlQM0o3aDBMNFRoY3NDMXMw?=
 =?utf-8?B?b1d5b3Y3aElNUXZjTVJmcFd4SFgzS2RtU291Zkt2UCtKU0dTS2YvRjQ3cEpU?=
 =?utf-8?B?WGJDWHozN2pxc1NHMWx0WlRUaDVXeDJhSkI5OGpHZEdleXIwRTJtWTZxM0M5?=
 =?utf-8?B?N3JWMDJkMHJxN05NWlNIYzdCcUZoRHliV1l0ZDBOY0w0bndZWGNtUXQydjJN?=
 =?utf-8?B?d056Nk5OdUFJRDZEdEUrZ3BLSFhWUEZjKzdHZ0JBT0cwaXNrVTBuNmx0YjZ5?=
 =?utf-8?B?cW1xQUMzMERESlNYYmZEMWREcnUzTktLQmQxYW9LWmZLREhXcnRFSUtCUTkw?=
 =?utf-8?B?Z2RrZTlRT000TUVIWWdLVGxnTHhuT2xOeFZ3TURTWDdpalhOdEhwaDZZdGRI?=
 =?utf-8?B?OTZiY2k5OVNMb1dsRE8yN0gvTW9nNGVJUTlXYXJUQ1pSWHhINTNCM2dObEtC?=
 =?utf-8?B?bFdqM3huR0ZtY29sa0tsb0xGWmtXUVNmZkh2elk0bERjNy9WMS9pb0p2ZHdJ?=
 =?utf-8?B?ckRCSmsyek1Yd01PMEt3SGdySDVNSTJVL29haTN4bVN2K1pqa3poNFl6QXVz?=
 =?utf-8?B?eXN5YTBDNDFpL0R4WkZvQ21zTFErMmJPOXYyZmF5K3RaSWhoSnhQc1d4NmpH?=
 =?utf-8?Q?RIhX0HGTFvM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDNBNEdObjNjTDN0THNIYW5BYjJuOFh6bVVRMG5SSjFOdkQ4eE42TGRZa2tI?=
 =?utf-8?B?Z2VPb1lKVnhmcWoxUVlCdUhnK3VQVkt1bG1KcmkwdU85RlFiOEVJKy9ENzdy?=
 =?utf-8?B?SWtJWHZTYXduUDF6c0xnWDlRS3hlZDJYeXdMS2RUK2QrZmViMWtKRFdZQXhE?=
 =?utf-8?B?cFZLR0ZxbXdmRnlDb0RaQmR0cjNwR1EvWldQeHhsTTlFZCtlT3RRS3hKSHZ4?=
 =?utf-8?B?eTJScVI0Rm5Ed2xFdUpLUGd5ZitKbEVDaWl2VGN5d2VKZGw5d05oSFZhVTBX?=
 =?utf-8?B?Q0pHNlN1K2dOcksrMTZNVHNNZGhHNldPTXlSWEE4Vm5oMmRIUlVIMlRFQ1F1?=
 =?utf-8?B?YThNcWlzR1c4bFJqT3pycHVZT1c2MUhTcS9GaWlEQUxVSEFIdWJkdENDTEZn?=
 =?utf-8?B?UDZwV3ZkcitrRVFyenNIR0hlditqbStHbE91T0xLYzVTTXUxUFFJVFdXZmlh?=
 =?utf-8?B?S2NGdmluL0NCVWxZcGdqSXB1L2F1OFlkTzJ1bXJKVDR3UmJjOUdXZ2JDVjRB?=
 =?utf-8?B?WHhpV0VxaWEwbnh6UDlNczFESHdoOG9zQTJpRkg0cXhUSWFnWGs0TWdVRWFk?=
 =?utf-8?B?MkNVVmdPaGt5enFRZlljZlRBUVN2RndCZytNczdYbEl6ZkhSWGxZazJZQU5s?=
 =?utf-8?B?YzBtTmJkY2trME5QU3NqVU1hS21FM21BcXl2dEpVZXlXbVNxQXBzWWJnZ29V?=
 =?utf-8?B?VjJUSHlNK2ZKbkdNT3Bma1VrNjA5V2h6aHZ2UGpOR3lFdUNlelVrb3E2bGpE?=
 =?utf-8?B?S1lyekdzbTNHUTA4d1Q1T2hGUGd6d2QyREFtM1dPVkp1TFhlY29JZG13TU9F?=
 =?utf-8?B?KzBIQkJOclB4MEFpckxrS0lHa3Job2ppSitUT1BZaHUyVFdKaXFwai9OU3Rn?=
 =?utf-8?B?RVVsQjR4S2NScDA2ditSVlNYeUFvdmZuVTIyWE5saDNuWnorUGNPTFhrcVNJ?=
 =?utf-8?B?d1Z4RE5wbEdKQTZPa1AzcTlrUm5YbGxwNlRlaGlkc2Y3NGZyZG9mM0E2bGp5?=
 =?utf-8?B?YVdjY3ljblF4MU1Ock56RzVIR1U4bzNicmVTUFd6ODdlOXJiNCtncy9rZVJP?=
 =?utf-8?B?ZXdBRnh1MllRUmpjVUtHRk10SnlSUWkxODdFYnpOSSs1RDNOQ2lhZ3JIdy80?=
 =?utf-8?B?NFMzUnBNOHV6dnhIc3h1aEc3d3R6NmxQR2pEZVpPaDcvSW1pd29zZlNad29z?=
 =?utf-8?B?d2hTL3RZcDdCaDJzRGFXVTRnVnZhQ29wSUgrV1ZhNHJWODN1a0tqNjJqU2Ru?=
 =?utf-8?B?dWNsZGNaWFpjUURxOGJyMzZobnRnTjBpOWhHMmJvUUdhV0p1bnVOUlNuV1lH?=
 =?utf-8?B?amVCaytrNVM2Z1FaWkdPcGlvR0VXMjBqQWEzT2pwaDk0RGlQTTJaK3ovNjhs?=
 =?utf-8?B?Vk1yYkpxRlhqaDNQOTNEWm94WWNpeDNucXo3dWYreDVBam1QOWo2ZmRLK2p5?=
 =?utf-8?B?dXI1bk4xL1VqbHZzeVFRelVnMitCT09TLzJTRll1UTBZektvaDdDNCtKbUJj?=
 =?utf-8?B?ak9lT3dDdVNlRjY3azNub1Fzazdpc1VUaUVWa0dVR2lnR1RLZC9hTWFlNnZn?=
 =?utf-8?B?Z0hJNWovaXFZNzJOejVQdk5VRlA4bk8yMld0VEN0RlEwTGhGb0VWSmFqa1V2?=
 =?utf-8?B?UzRlOVRjZXRQSVZ2czVGTzA5MzlmQTkvWmNEQUVzT0oyOEhsVThCV3Urb3ho?=
 =?utf-8?B?YnlQTDQxQzZmVWkwSVNXWkcrVjIzQTFxNThvUVY1N3ZHMXdidGNyeEM4YWdU?=
 =?utf-8?B?aGtjVHFzL1MvNzMzTlZWTllWUDFKd2xKQlY3ODNLcC9EQ2lHU0J3VzNkMTNu?=
 =?utf-8?B?eHdpeEhObmhsRUdPWXpVeGRFZ2pKM0FEUnFtQnpDMVZJUmtpODdoYUphclVq?=
 =?utf-8?B?SWhMbHJNMjZhNEkrY2tRVEFGNmpoMldzZ1B2YVcvK2NxakhkSmhrSy9Ldk1n?=
 =?utf-8?B?V1UzQlNpeUx3UkNXREM5Z2dPWVhRU2tCMlV6eGZEZFdXaTVpT3MxUjFwUENq?=
 =?utf-8?B?OG41Zy9rMVhKOVNUcSt6c092eU1vbStKRitZb3hZWFBSMXN2OVFmZjI3cTFH?=
 =?utf-8?B?bFlhWVM3RGF5aXJrd0ljYkxDVlNJK3FQY1ZoOVdGSmpVblRvQlRicmJUNFNZ?=
 =?utf-8?Q?dLJdD5qehSqbCwsS8LNgS1UIa?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OL9cW0Vo5WSwpQlwsL8lpzJSu/axag0SfQtwiNQEfXvX7+xYtdDwEGNOyKDq/gYtKXeSSWZsYyLS6f0EYE0IEJbHWF73IGbXlzDah+zUlMnv2lxbMOHCiVWm4rzoloCyXcHXLCXu1azkqEf0kbfrEpH4Wc4MgHSi9JEtO4G+gsgQxh5JsbZyBa9LDL1ltg/n6aEkXQyp5T0P4MwJkupFnz1oX2x1d46etZUM0KLE92c408NKluRypvFm5mGH5hykOcCCs4OzuaQzkxZ/93wF721KwzhBy2DR9/y8DrO3wDJe+S6ZXVUHhyiDYWEGoy1waIHxaGCAXXFLV3rH2DgQqRyPL9FwsF+pwYK1p4hz65rR86ZSTJriwL7SnYf7g8GMP6tBgnWzhAC9hIcxg4L50t5kpIUHnWv88Rf5sBlO9jcLz5/5vUpakiox+VMglrgsK5ihDZqXxOPA052XVxNn7BdcLKGtS4Cdw3l4XLUbnvMwyZ7fPxzd5yoetxSd3Do2MMi9vFCdYp3f2YTFeOz49veexaggkzgtYEfY2sf6fJ4p49Wqcp4tUmeFll04Fs/NAV5eCK4wuytKCoX9d6Kf2+mEX8hLFa3U4pT3iOqzWLk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d84c9141-b345-4719-354c-08ddf6e82da9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 19:18:41.6837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AlArPWR2LJ+Qs/e9oAGRU3NvkSeEGbwfSwUm608ailwBEC2C1FcZw/FfQtS8FAPfJcevzf+PJASBc7cawOBhNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6806
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_02,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509180172
X-Authority-Analysis: v=2.4 cv=JNU7s9Kb c=1 sm=1 tr=0 ts=68cc5b17 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=6-6SEmoyvDgSN1fdhlwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: uyCN8ocdezUiVXu9p8WSfFRW6aaQE0PC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXzz+v8Zt5DWT2
 Mq3mp4dC0xM09llF1D3nBqQJKcMB1U+Wlu6gUzs7jGB7+vWaUQ03JJ5OP1cpa0vVUeA0eCyBKDU
 7U1WrSLd6l0TysjPwXdhYjJGKnSWlLDmIc53F4ZzHieq8vJzUcxf5Jeeyg6IycrxZupWQ70IAip
 /BFSHfmWH0Q3y+7Rwfm6GBzr4U77FxEkknjgadQyJdeXUEH+vgIxwNQBk5I1NgJf//HbInCFBBO
 O0gastNtLk7qscAj5o/YiLLFt30u35/pGDpzwCEmYdhmtZuohV42Th2Ka1FBzvmus0clK5l40YT
 f/yKziYXhzm0kII5KozfZbYfknVFHbaPcBmSwayTB0L68EV3es4o7wB0Zx+L1IY9ikZwHThwAtr
 iTJhlkPY
X-Proofpoint-GUID: uyCN8ocdezUiVXu9p8WSfFRW6aaQE0PC

Okay, but should it even be $dtrace $dt_flags?  If for no other reason 
than symmetry with prov1.d?

On 9/18/25 14:03, Nick Alcock wrote:
> A missing $ led to this test spuriously failing in this case.
>
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>   test/unittest/usdt/tst.exec-dof-replacement.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/test/unittest/usdt/tst.exec-dof-replacement.sh b/test/unittest/usdt/tst.exec-dof-replacement.sh
> index b7ec5f2dc5e92..81833cc8b77f8 100755
> --- a/test/unittest/usdt/tst.exec-dof-replacement.sh
> +++ b/test/unittest/usdt/tst.exec-dof-replacement.sh
> @@ -33,7 +33,7 @@ provider test_prov {
>   };
>   EOF
>   
> -if ! { $dtrace $dt_flags -h -s prov1.d && dtrace -h -s prov2.d; } then
> +if ! { $dtrace $dt_flags -h -s prov1.d && $dtrace -h -s prov2.d; } then
>   	echo "failed to generate header files" >&2
>   	exit 1
>   fi
