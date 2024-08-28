Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A900A1ABED1
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724876438; cv=fail; b=GI+dqp3l8+hODNW/Owaly4bg9Hehb5lrOtQsb06o3K7pviJJo5uN6n08kKBFybXD2Yh2nn0559fvtcdnE23idXNlEDb0s3DaQxV3E4UC2+jBFn5bbqgd9d4g6FDh4qG4F+GXXQ2b9nK7UKdu+sInJksOhGneMtI064UHh4mJDOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724876438; c=relaxed/simple;
	bh=tr/CitABEbMJDua5V7NmA5esGqoZJu2pDQFBXd83A3o=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=t1WTNVcdyS+9MfDRsblJ9wgu/YV3Z6UhugmKrH1/rFGttXgqSQToj3UAGQ2wKwrTB2Ne8zANQCMUvdly4t5nOuiRCCgT2HVfNaXccgA/CnxePI/vkGCpW6UMIUsvA8j24stIDUUAyHVToyT8dbjIBUq+1oIM/BYiG/gX5ojpCwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BcJu1grw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XkFMpOSZ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BcJu1grw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XkFMpOSZ"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJXZQM026686
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:20:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=LnY1JWI8FZA8x8UsrALJEOHrUfDcnoj8/OvHIQd7hkM=; b=
	BcJu1grwmpj4aAoqyyTGwR/9MNSErfiryjs4mCRse3BI1GvBGmysSjCgLLqLiJ+u
	7/h0ob+COhB0vuAAGMuC7XDh3FqgvxQz+u5NOn+8Vc1hz1GWLEeo80ao3qCEffhK
	nS8gwBzwW6TD8Dmd+D1X5NKq+eOiOBZdk30hvSa2euOwkvHh8QtlN2X1UgdkE5Ap
	lkCF3LJcXVS+R85CKoVyfR8Ybf7O6iL+VtVOXBVvjcEYv/ciCzvXfnT65rCqd9Ba
	7Ya4dptHriRczJw1ko1vNVmV8u9KaRdNLS4/zVzSPemHXH9e2oKbsbhHIR/ld3UM
	CJQN4gX1tw3QI67JZDoJtg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pura85x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:20:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47SK3q54009923
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:20:35 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41894ptxnh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:20:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ddnppSqHC6mtRTlBqAR+bIYzdDYYM7EY47KCbJrlBdyYi+H7J61V7e/rjB8Zr4jzxhvJy9voHKI7WLfZIZ+Og973SmUYUJbFXu+mRajE8qp+AAH96/WcKOXwDpZKL5JRsY8R9qydNFgnDB5o+JyVTZY2o08Md9YeG0aRR/s7Fr8CGNITBv3qANio0yssyE+dh8xsl61OQdqi2MOXe2yimbxTVfRia+S5ZtUAv8vFXM2/N3XLTz51THIWaZ2Bl5s+py6tMKqwFEslhoqtpeK8ii1ZcHBpsxG0ugnYmUZeAF6CzfZykeyC3QPak//AKlP8JHpwDz6ri1AzcEk19rYauA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LnY1JWI8FZA8x8UsrALJEOHrUfDcnoj8/OvHIQd7hkM=;
 b=M5Ee13AkmzMOd8ovB7lM4jf3ynDPacubt1PO8n08KcXT2o95+EN90M5lCvuF5ieAHO98APNM2/7k6dK3i5aXgh9P6coyMq8drz64n1kwLTJXWfcGtoB8T/Yuau0OAEW8li8awiHOmI78t0sjom4GaXZFkoQ5nx85UpDZSjtCFyddfUQgpd2OxBJKYisovBdYPd/v9CyQPG/nHLbD7W/VXCts6eVfmW+tQZgc+ZTBeK4POHndi4JGQ/767EpU372E1ylUBBsYGJt80TvmW4mCGNrG+ICtWlQ869u74bG9D/cs5kjuu+VBzOKjkr5oTvDJwqame3wTyte3b40zeFtBYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnY1JWI8FZA8x8UsrALJEOHrUfDcnoj8/OvHIQd7hkM=;
 b=XkFMpOSZyFy5/l4lLHT/D+Q36FVSPKYJm0TSDM1FjJndWbjCZEMgUXRsYxboi1tonnM11/8SJfLAVodg33gyeTd+i1H4N1d58yyLnFIZIxOY2R8graXAH/tFlrKm5xVlordyYJcGAyDCiQvg/TURLV6whQ1CweLn64Cdcz7B/44=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6824.namprd10.prod.outlook.com (2603:10b6:8:11f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.19; Wed, 28 Aug
 2024 20:20:31 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Wed, 28 Aug 2024
 20:20:31 +0000
Message-ID: <ea76fba0-c7eb-de97-685d-ca969d87f784@oracle.com>
Date: Wed, 28 Aug 2024 16:20:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] ident: fix unsigned vs signed comparison
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <SN7PR10MB62878756B7ECA31ECDD54F00C2952@SN7PR10MB6287.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SN7PR10MB62878756B7ECA31ECDD54F00C2952@SN7PR10MB6287.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:208:91::35) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: 64fa22e8-c55e-452b-f3d9-08dcc79edd45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkhlWkZyL05ybllxSyt1RklJTWQ2eUUyNFczS1hBdTM3ZnlHK2dFN1dpUTgr?=
 =?utf-8?B?TERIblArdktrWFEvUUhzbTVUUTRhbjFGU3FrUGRiTnZQRGFIRkZNcHRRZzc2?=
 =?utf-8?B?WFlSMWUzOVYzVWxXWjFQVmdGSTRNbFZySDZzbHFoNis2UW9qTytQMmR4bXE1?=
 =?utf-8?B?clBWa2R0b0I2amR5ZUJxcjVZZ0VQTkw5ZkxScmVCckdHNzVlclJpb1hjSStx?=
 =?utf-8?B?WkZNVS9JYXZ1allWRmhOQllVNGpNNE0vRmRkMkNmYTNJUHUwQk5rek1VRHBr?=
 =?utf-8?B?TEMwRStwZklacVYrZkx5U1dkRlRBbEkwRmNTQXY4Vjl4eTFCczBOWWk0ZU1k?=
 =?utf-8?B?b280R1laVE5GUTBVR2lVMEdZNFRYT1lFNUl0Ym5zUGpneFE3K0ZIMlQ5SVN3?=
 =?utf-8?B?N1ZSeGdkeTNQZzZmV3o0UDZLdUpLQmlkQWE0YlZGNWJLMlBqL0wvTlM4U0ZX?=
 =?utf-8?B?TFNFN2hyVklIWmRDWEhHZU5YWHVpRTBkT05HSWptTlQ0NGQvNVVQaGt3eUxM?=
 =?utf-8?B?Y2pYaWV4V21yOC91Uy9lbER6ck41bXJNdkYxWks1S3NsN0QvMWordnlGTGxL?=
 =?utf-8?B?anR0OEZxR2FLOGcrblgxTTVrV3k4bWNub1RIUEdFRWVvb1luckdWT21wUnlX?=
 =?utf-8?B?R2RLWHNyeWhmU2o2cVM0bEtNNTVaaFdkd3kva0cwcDk2V3paMTgwOUh2RVVR?=
 =?utf-8?B?VjlOT0hobFVZQisrNlNpMjBFbXgwczVkNHZUYWU3SGdFendsRTJ3NllCY2hE?=
 =?utf-8?B?U1MrQ1BIamRqVGdFUGI3TVk5Qm1haytSS2w3VXVmT1N0R3V6QURQL2wzQzhI?=
 =?utf-8?B?bGkybnJDRVhQU3lTU29xbGlCOHc3LzZHL3krNCtORkhzRWltd0hDMklMMlNK?=
 =?utf-8?B?MXY1SEZnVVMzcThlaDlWaTFlK1ovcVNLTXNjMkJ1dW9CR1RnVVVLdTZoZVJ2?=
 =?utf-8?B?OERqYXNKVGI0a2lYNHhqOVZwZGt2S1p5c3pseFBuOWkzakVlclRxZSt4N05O?=
 =?utf-8?B?d0ZCWXNmZnhuSytLdXFZR3FRdVVPWVZGT1VJVnV1MGwwb1luTVk2Z3p5Z2ds?=
 =?utf-8?B?Nk90R1dJc3RDV1FmRHEzdWFQTm1FeGtnUVAyTCs1U2tMdnhOVW5yR0JwaUhN?=
 =?utf-8?B?cUVMUU14YzE3MlY0YnRlZ0xvdDRFOUtOQnZVbDJmQ2MyY09nb0JxR2p6M0xE?=
 =?utf-8?B?Y1RnS2FWZ0Q3V3MrMVg2dFRWbys3U0dkRE4yWFpBNnp2REdkSlVGNEsvc3FY?=
 =?utf-8?B?a0F1dnNBZGlJZ2VIRzhKekhCcjk3blkzRTR2ZnZUR2R4enRjdkwyRjZvbHNU?=
 =?utf-8?B?dTdIMThiWi8zcE5ucklnN3pZTmtldFIwVzJRL3EyMWw5YVJDVnkxTG1mRFF0?=
 =?utf-8?B?LzFnc0VOYjNqZzdoZzV3RHBoSHp3ZVIvNDFoZThuTFBNSVJEUUZUUkI5R1Ru?=
 =?utf-8?B?OURyRXJ1UVlveG1FdldtOUloR3FPQkRxMjhlQmNycnEyMEIxRng0TndDNVVZ?=
 =?utf-8?B?b2hNdEQybEhFdWxnL1R2cWhiTTRoTzFiQVA2cmdUWTE2ZkpYVzlKeWtiVFNw?=
 =?utf-8?B?ang3MW1EUEFzbDdnUk1TUEIrUlNHSEdSQkpHdXlaK3Y4VWhCaXVSczI5QmR6?=
 =?utf-8?B?dnM5WWhOckxIWFk5MUxqbzRleHNTbVh5eDMwM0MyeG4vY0JYWEZseW9PZkI3?=
 =?utf-8?B?azFKNHNBL0VQMk0yc2RZYUJwOS9IbnVKaTNOTy8xaTdsWkN1TTRJLzhLN1Qz?=
 =?utf-8?B?OHBZekJlbGplQWJZQXVKb0t2Zk96aDB5bzR5ZTE2bVUxbjBZZzRzS2YzVTVZ?=
 =?utf-8?B?OXdLOUpKOWRQMFFuR2UzQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VG1ZVWM4REJ5TEdhazV0ZUxEbHR4YXh0Rk5BRFVrUTkyUWxWUDc5Y3lNa3d4?=
 =?utf-8?B?RzJtNkQ3K2Z6V0pnQkRMbEpQRUlIQmp4M3U2UG5vNW8zSHo0MUE4OGJTSEU4?=
 =?utf-8?B?ZXBJdy82VXo4NEFGNXd2K3ZXaUdpa1NxR2pMTEIrOFZCRmI2NEU0a1E5RmZW?=
 =?utf-8?B?MTFKM2twcXJqMlZpcDROVU53UjYwZGluL0pRWWNVWnJuNVdlRHJrTnBpczYr?=
 =?utf-8?B?ZHJXSUtCU0kybDdjbDhjTkZ2Skg0UTc0N3gwL3BzTkpqbzBwQ2hnSUY0d1J5?=
 =?utf-8?B?UkRpMWs0UmthVHlDM21UVzVVbEJoQVN0TlZMUDlEU2w1ZHNKR1djZ2djYWZY?=
 =?utf-8?B?cFVLWkc2U2w2OG9jMUU1RmVaZkJXQzI4czg1c1BYQlhSL1ZuaFlsejlVKzZw?=
 =?utf-8?B?dllXWmIwNXk4ZU9EMGRNKzl5bXU5YXRPQ2NHODBvVEVwdE93NUN2SHQrSmZt?=
 =?utf-8?B?YitnZVQ0b09HTTVNMUtjZHdBb0ZPYk9vd0JpWGNWL3BJcUIvc2dDaENqQVA2?=
 =?utf-8?B?VHJ3alJoNTN4dU9reVlGQ2lqTnNTdlk0eXlUbUxIeTVyK2Y4cnJRM21hbjZp?=
 =?utf-8?B?TGNEV2dEdVo0Z01meXVuK29TWlhYRGVuQWQxdXRjajNvSjg0dlQwVkhKTDJQ?=
 =?utf-8?B?SzZsbTFqLzd0MDNYVDNXUW9QaWN0S1Jsem51KzNWRG9QRWQ1Y3gwbU1MMlJN?=
 =?utf-8?B?emdvaVBOOG8zcGgwY2xEYWVoRzhoVHQ1ZnRnbmFrZk1qcUlDZFliSy9oQktB?=
 =?utf-8?B?L0p6MTVzN2hUa1Z4aXBmZDlJaUtnSnZqTUQ5djBaR1VZQ2JXRWhmdngyK3Zh?=
 =?utf-8?B?UFArS2R1VFFCbDZMYzU0SjJFNzhzM1lPUUQra0NXUlRmQTFDa1M2MHFmWVV4?=
 =?utf-8?B?VUp6bm5sQ3pya0tlT1BZR1R4dDd4OWpHVzlQWWk3VlREUGdWL0NVcm9mVXhX?=
 =?utf-8?B?Z0JkTlZtcFJRaVlnMUtPb1dVTHRrL1BkL1NzUDRvKzBYdVh6aHRoTjZFUHpQ?=
 =?utf-8?B?NU42bUhTanVaTHRaZjdyTndwMTM2Zy80MGc1SlAvWjIrYi92VzkxMFQ3TFZG?=
 =?utf-8?B?ajBkM2RaOTg1YWYraWoxUWFrcUVUbURjNERNdDQ1NXpUS3VJODBKWld3aXZZ?=
 =?utf-8?B?VmJEaGZodDBoZ2xGVlJrK25EOUw3UzJvZC9RbW9Md0RlWVRiUnVieUlvRW51?=
 =?utf-8?B?Q0FvME15T3N1cU92OTUvWElXYU5wMWNvSkczbUx5WEVCUTc4anNsb2tSMkJs?=
 =?utf-8?B?WVNsaUxidnBqNjZJS1Z0bS8xQnY0eXFtTlMxV2g4aVFCLzZiT2hIOWVYL3pJ?=
 =?utf-8?B?R3g3WjFvZDVXc1pIVFNIQTF5dzJadmw2ZE13VTlLVTNNSVNrLytLa1hSRnRs?=
 =?utf-8?B?bE5ZUkljc3gzc0xqdXpmcElKU05sN0tkNjdveWY2RzhyQVRPTE9MZm5GOUUw?=
 =?utf-8?B?NXRvWlFLZDRmazM0SENFY3BCclpOTXUvSjdrZ3A3UVBmWmpTVEFhc2NVVDNQ?=
 =?utf-8?B?MnpnK20vSXdMS1lCblBYZjZ1ampKTE5VaE5zaDdnWG5MaC9QMVRzNTU4Q1Zp?=
 =?utf-8?B?RHJ1OWg2RnpTaU4rUHVUa21ET054UStEd2x4NVZrUGVaMzRhaVRDak13NEQw?=
 =?utf-8?B?bW9XRlQ1eEh4UmNBNkpIbGpXM0NUNWlSd290L3UvUWJlQlpqZlhQWkRjWWlN?=
 =?utf-8?B?aEh4R08zRWt2dW8xMEllbzFzVE1TMzBpaWJvTTRhK3p5NWk4RkUzRGZ5ODNy?=
 =?utf-8?B?ZTVCbnprL2dGamc3SGdFb0p4QUpTQm9obVFsdGJMeUV5VzJFUWF0UUVXTW93?=
 =?utf-8?B?RVcreEFvRktwR0RHek43YWNqTzRwYW96N2NxQUhDK3pQVFlRSFJMVk1vU3B6?=
 =?utf-8?B?WDRHY25UajV1NW9YUlU3WjdYRW15QW5JZWkwMHVoYU56Nm84ODJaZnV3ZUl6?=
 =?utf-8?B?Q3VNMmlCNzZuMGlJUmZSNWRrNm1PZUR3d090dTYrTFRrRGk1dWxxYlBRME9E?=
 =?utf-8?B?OHEvMDlQOFhkbHVURGVFc3R5bm9rSUhxbDVPNG5mcnpQUUtmeThGOVpvQ3Z1?=
 =?utf-8?B?RUlKMUNTTUVlcGZnTmx5UGpxaEVObDVSbjd6V2dHbjlkQis2WUtneGJMUzRs?=
 =?utf-8?Q?lGs3f+0BM/XVpL/tn6877K0XC?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AMdJb6lgz2NMJYsNohFcwHPE9I85HsLrDjg2A1rIUhUEshC77/TEHrWAoc23RWw5rxBLPG5wi/aMUJeQC/DEg7FK5f1dccjlj44RgqBEe2VT1xOF09oKKV5NhK4fyH9vPPkQe954kV30WC/Q/lEhzwKuwLdgrMdeW08Lp+I53VzYJLZgVVtde8J1ehnKuxfhlWN3TkOnNlhpcl727b0pwIfho8t1qB1sdev4WNZdong+148ykEaDzhoB4+OkOPFc2i2Top9UDXKLsAa/9xHF6JFZFZrc2++0mtw9BYpsNsoV9uNSWe0INLe7Comq9nVA/eSc/s13NGuLnQkUY6H1eP18MhamFE1TDSptOsCdGiKcXyHWMyprcJqSbG0biWXLwndvkGtdHFEjX355pYKnlXT4FPbLuWr7RUhvcrtOwdn4gymRWYwRQ2HSImGXgpXuZCnBgg+V5LfXlR88SIIjCiT+YR3/KTnLiOnmhMPJTnh4z36X549qfmCN+AxX4kJQp8aVfwDWCVEvVBsgM/OJAYAueOzYcPN2WILWdSgYy12smrusgK97bm4grqEX1d//C2oLeEz9xr0ypPtX+8HAJpwHOhPYMLAauFjK3GF+3FU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64fa22e8-c55e-452b-f3d9-08dcc79edd45
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 20:20:31.2405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k9wXMPfwIlD/GkodAfuuS+6rm3ApdnimJZuI64ZrYBhclkhAwFooACfUCwUpm2rmE6aseqRnZ0iY6kQirkMBQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6824
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_08,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408280147
X-Proofpoint-ORIG-GUID: mug09lZDuPkSLGUKZnnQhKwVF7b4p4Fu
X-Proofpoint-GUID: mug09lZDuPkSLGUKZnnQhKwVF7b4p4Fu

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

Incidentally, is this related to my "Supply a default probe_info()"?  
I'm still in favor of that patch, though if this ident patch goes in 
first then the commit message for the probe_info() patch needs to be 
tweaked.  Maybe the two patches should be combined???  (Maybe not.)

On 8/28/24 16:00, Kris Van Hees wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_ident.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/libdtrace/dt_ident.c b/libdtrace/dt_ident.c
> index a4bcacd9..7c563c7c 100644
> --- a/libdtrace/dt_ident.c
> +++ b/libdtrace/dt_ident.c
> @@ -343,7 +343,7 @@ dt_idcook_args(dt_node_t *dnp, dt_ident_t *idp, int argc, dt_node_t *ap)
>   		    "matches an unstable set of probes\n", idp->di_name,
>   		    dtrace_desc2str(yypcb->pcb_pdesc, n1, sizeof(n1)));
>   
> -	if (ap->dn_value >= prp->argc)
> +	if ((int)ap->dn_value >= prp->argc)
>   		xyerror(D_ARGS_IDX, "index %lld is out of range for %s %s[ ]\n",
>   		    (long long)ap->dn_value, dtrace_desc2str(yypcb->pcb_pdesc,
>   		    n1, sizeof(n1)), idp->di_name);
