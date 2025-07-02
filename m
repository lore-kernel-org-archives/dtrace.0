Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DB530AAA2
	for <dtrace@lists.linux.dev>; Wed,  2 Jul 2025 14:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751467972; cv=fail; b=EzFaBrg+DSXDdijfzfKC7clx5qgSEV5IxOLYuhyH7l0CjTqsZnWyo4+A7da3AhBsmW471tZa+YBnNGKCzZ7utjHyGs9UlTn2ISiJ4pZ83ClnOFBo/RjEh+TJxUqIGgLPiKnWj/6m5GpXIARtmbBlvt9bUvYSY5I3HjBvDboIrh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751467972; c=relaxed/simple;
	bh=6jUkw6P0iCW0B2zBG2+9vYkCccfIbi2M8k5Mo/6pmVc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eqLUvdd+VxBEs3eno1RBuvG/l7zEofM/+emh1ZugX8qnArACdjnLxq7td02KsLaqmC5lYrModBtGis/1olCW3sRuGRVHFNzIk6CLbKfzbWwXB+THy342dViAVfKg8qOykoOu+Zs32ohahPv7omnEWYSx1DgGTcTcVCziFizit3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fjcmRBGe; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=s+E1y4Os; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fjcmRBGe";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="s+E1y4Os"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562BisD7020843
	for <dtrace@lists.linux.dev>; Wed, 2 Jul 2025 14:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=eu6DL3zaDvnXgdcULCZLc0MSGYI7kfj20bc1IV20ISk=; b=
	fjcmRBGebrLeZyDl/1rqV0y/s8FIj1Dn4dXi4y3lXHB9Y3J7ZlqObta0EBpJ0xmr
	L6nNZI6FCSmW6SyehC33jE3TkviHARt7U0i9U3gArosd4M8Fy7SYLnLywo1TLVKC
	mKpWKuogjV5saXOz7paT360evkTHgFzVCkcTAbDpc5mnE/MrybvEzN5ZfPZSpMTo
	kedxOWeUG2eyvffh7ObGLrD6yGqX9vL5foi4Pk/b2b799n/GLOt3Bs9I1hqpqrw/
	KrQOick9bS44Gaxo4xF3t4DEtYvvzTfUhr5CnmXKRux3uRm5LR+04yswkESrp7BO
	nx62CXRLHKE0qLSObRcmyw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47jum7xcs2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 02 Jul 2025 14:52:50 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 562EM5dR030219
	for <dtrace@lists.linux.dev>; Wed, 2 Jul 2025 14:52:49 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2086.outbound.protection.outlook.com [40.107.100.86])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ubc1tu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 02 Jul 2025 14:52:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6SCHBgAZugttEHNNzIYrdfb/sNn9B5zwtm2WiL1BMnvS/Naya9hn5uIvujFwXz2MgKGJNpZngKV3h4IHH9KE/oK5cin/VBZ25tJgBjZBlj188SSLZYPNYJAsxYVxT9JQfqGLVYGx039MjsL3PX/qAvojeUCM5oPFVVEQvMC8w1YTFWMlWUO1j+Bh29th2AV2DIH1DIsji/GleWI0XwgBEkzcRwry71SPMFVzf6E3l9N3/nofef7uTIzHRUQdOI8XBR3NSguqoJyo6OyDsCBcVleKLFZ9Ar6qNOiCcXGqhJHjtCk2irBSyDp1QK7tfkqjOSIO1m2d7Pq+XAVmz/gFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eu6DL3zaDvnXgdcULCZLc0MSGYI7kfj20bc1IV20ISk=;
 b=w9PK+OPnm+BQjXybbcicQaKuOLCrJw0ciW2cPPB21A0FjtyWL87MROiHyGRd6o0VfWbpeKVVYNqXVtZ4xybIvTBmlLjCS+1A7C6O2QVUAEX0zl4+eNyoPEG6NvBqGKsfb9Bo6bzHzRDSvwhevtk1TK8ynE+Ptm0Ur9EUI9oX+sCwEnExetrcUiwwKP6Cq+bmcH0P1ZnZ72lhs4tO6bFYC2fjlRPmAXdOOGD8WqBMWpfBjC+S3FZkFCSm/j5/2mAzXADkQKWXIoWRPcdw2ZodAr779FuwLQydXSa7U9cE5ylu9hjNS65vdTeZ2a1+RS7fMSwoNTrzJpYsE5xiePOFAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eu6DL3zaDvnXgdcULCZLc0MSGYI7kfj20bc1IV20ISk=;
 b=s+E1y4Osvj2YixyK4fs7+8E87EhZF2lg6C83mJ5fon4BaBWh40ucutZLvcz2+e37jaaxlISRpyAecax5j/5xO9z2u6V7ikrGB9DH2Ae3PK3huS1h3bIjUvfRbt6FLj/eIukYsTWfYECA8jCtI+6jnllFdrRa4Gm/XSU6E5hYAu4=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 BN0PR10MB5031.namprd10.prod.outlook.com (2603:10b6:408:117::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.21; Wed, 2 Jul 2025 14:52:47 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%6]) with mapi id 15.20.8880.027; Wed, 2 Jul 2025
 14:52:46 +0000
Message-ID: <8e0fdb92-985b-4a1f-b41f-08c16c2bafc1@oracle.com>
Date: Wed, 2 Jul 2025 15:52:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] DTrace TCP provider
To: Kris Van Hees <kris.van.hees@oracle.com>,
        Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250610135813.15746-1-alan.maguire@oracle.com>
 <cd4946a0-f529-d927-24d5-0c468119f000@oracle.com>
 <aGQ2pe0taoYjUy84@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <aGQ2pe0taoYjUy84@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:274::17) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|BN0PR10MB5031:EE_
X-MS-Office365-Filtering-Correlation-Id: 7076508a-2ebd-410e-55c3-08ddb9781b2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VHJWSXBsTHQwL0VGYXNXSG1ON1VQbzUzWEs4T3k0dE9PcmViclJ4MVQxTERM?=
 =?utf-8?B?OGJSeFVOakJoR2dESi83eStLZUF2S3J4Y09BblFIOWpPaGtkNUlNN2U4VUFL?=
 =?utf-8?B?MEVTODF4QUNXRDJNcXRSKzgwZUE4VnEvbTFiMEVjMm13RFdLb1dBWmUrQ1lj?=
 =?utf-8?B?UlNtbWxLbWNYQ0RMWXpmaCtHYzk3NmNmcFhpOTMxbDhSL3BLN2UvcEIweUFs?=
 =?utf-8?B?ck15WFQ3TUxMa1liNDIzcC9VN2ZiUlFRd1lsY1g1b1hJTmhRdnZIYW5nd0Jw?=
 =?utf-8?B?Y1hxRzIwdmlYcWlYQWRZanpwRFByNXRTdU1rOXlmUnpSNWdvVHhuRlJvOWNC?=
 =?utf-8?B?OC92QmFWKytGc1pYcElLenpEWFRvWFRuekVHeGZQY1lETTBnWGtFNE8vQjJi?=
 =?utf-8?B?T1ZuU1dqTjZ0MjlrZEFpdFNwQ3ZHU3hwMDd2ZjhsUitIUWxpazdreW5wemVV?=
 =?utf-8?B?eHFtc1EweXVremJ0RVhWSFpMcU5RbjUraVdXR3RFTWUyQy9BcHFGaTV5VHJL?=
 =?utf-8?B?QmlGT0RibkRQWDI4RHpZV0txTnNLcHhGQUtVcFVjN2ZKMjVZQmpPTEpkbTRG?=
 =?utf-8?B?RkhnY2ViWjNmOGthWjFqeWh3b0VRNnlYeHRtaFhvTWR6ak5qNnZLaDdHeloy?=
 =?utf-8?B?T1Fmd1JUU1hoTEdtZVNmcnFWdUVBeURwbjdLc0M5THdDTTRxd1BPY3Bac2tS?=
 =?utf-8?B?dFFlV1NzVUpuUDg5VjdUK3pLM2xaU29oZTBpMlNvbXA4UGVCcWxHZzdUUlVs?=
 =?utf-8?B?NGVhRWJCQTZHQng4bG5WcFMyTnF0dXJqSnFjYXk0SHcySi92eno0RS9FRDNC?=
 =?utf-8?B?bGpCTTlkSWo3Z29ubjEybHhJakpmY2grRmZNaG1hL0tGdlNadzE1RW1vb0Yv?=
 =?utf-8?B?ZFJaWHFJVW9TQU40WWZJcXFSVVF3d2UxYmU1K1IyR2l6UlFFUit5bk1QcmtP?=
 =?utf-8?B?NWdueW9yYldvcjgrQ3p2eEtrL2NrYlBMRHZJN1lBR1FlelBmMjFpditTWFZG?=
 =?utf-8?B?aDROV0xJbGdMZFBiam1DVkJuNW4yejJHKzF6OXJscFlQVzFsL1VoT2c0TW5p?=
 =?utf-8?B?aXVsMEF6dnFoSWpCUEpxL0oyUmZERDRiNzlWUUJHckdSWjhIQ1FielZ6RDdR?=
 =?utf-8?B?bEgrdTJqLzFJQkRuaGNpdjJNeFgxRlZJdUtxYTVvdTdBdXVpQUV6WXFzOWtN?=
 =?utf-8?B?aERvRUpXOURxeWdpQjhFcHhYVVByU3V3OGlVc1d2Vm1HZlVJYmdvcHQzWEp4?=
 =?utf-8?B?M2MraXFCdjlzZ1ZwL2dTbXByZDIzeUorWEo0U1dwcFRZV3UwdlhnNUF0UnZz?=
 =?utf-8?B?ZkZyTHQ4b2syMTVzN3loU2NXd1FGK3ZCa3c5UmVwVTg1SHgzMUZrVXQ5bExW?=
 =?utf-8?B?UWcwbU93MERNcnFWKyt5YUpTTnJsUGoxY3cvclpNNHlVNDNMYjJnSkVJZ1pl?=
 =?utf-8?B?R1JJNXJEaDI1Q3habUx0dWFKcmJuRkFTM0Nld3FJZ1Bra1RhNThIdWFBS0Zz?=
 =?utf-8?B?eElUVFVBcWZmdGxydGIwNzNKM0NCeGNpV01Gc2RQU2cyQWZGMVl3Z3FuNThn?=
 =?utf-8?B?b0FBaHNoWTFtMG1zaTU5SStqVG9XblNsOGhldm1Dc3E3ZTIwZE9RRGRvdTBQ?=
 =?utf-8?B?K1ZKMTcrY0tpVFB6NFZDbFB0eWUvaXpXWkxzK3NTRlRIVUdGWVF2dDdSYXN6?=
 =?utf-8?B?SFM5VHFKdVY1L1lqT1BYazV0dmlPRlFqSzE2RXZsL1hiR0hMeVpMV1BrcnFE?=
 =?utf-8?B?TVdYcmRuL2NsaVlqWGllemhEK0x1bVU0Y1c1dTJ1S05XZVdSeER6ZFV3ckVF?=
 =?utf-8?B?andZa1VkRGN6dkNyVG1ZeVFyamkwL05MbXVkVGs5WTNpRHg2dmM4alNyZytw?=
 =?utf-8?B?d2lGZi9pYXRTVHZRVDRYekVDRGNlY0gxbUhmVm5NeHJQMFFLWm9RNmFETlhv?=
 =?utf-8?Q?ZCCU1hbvhfU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGM2S3pRcDl3OVJHa0Q0bjhGcGt2dXVJdG0yaVZiKzE1dExrQTQ5aXQ4VVJm?=
 =?utf-8?B?SjNLWVVzSDBEcGRxbERscVVPVmU0bng1VzlQbHFGUnNWYnF0ODZ5MUFHM0pO?=
 =?utf-8?B?cEswcUZHRzlLWFBlb2Q4VXVsMGUvV1pxVmJmVTJoSHMxWDBZTlJBaHpqd0tS?=
 =?utf-8?B?ZWVGYmx4Sko4akpNaWNsLzZUbWNodzNBSEUrUXNvMjNiTmlkb1Y1TVlRdjdj?=
 =?utf-8?B?U0cvbTRSRE56ZmtYdEN5TmxWb3prem9hS2hoSVhxcGxLRWlkVVBHVHhTejht?=
 =?utf-8?B?dVVHV3pldzh4R2FnZmVleHpuaG5hMXlkc1JaUGxNdFY5TC94c2t5WU9iYVk1?=
 =?utf-8?B?cVZkOTN6TWhEbWwrRDRxa29TTlgwb083ZWh4bGhaVkVLR05iSHVzRXEvVWZE?=
 =?utf-8?B?Nm1JMkNpM3dzNlEyUjdqbnd6MWxUUWtPVkMrSXE1ekxtMHdJNTBwNHI0YU4z?=
 =?utf-8?B?K2YxQUFWRzBiQSt6RndEeGZDUlBLSkVMM25iSExLRjhtWUc5RmlTditDNUxl?=
 =?utf-8?B?YmVjWHBwRnFCc2VhM3A3ckZJT0pWak90elEva2FtSE5ZMjVleVR3M1h2K3hI?=
 =?utf-8?B?OEVuS0k3Z0FZZVpTdzdsQ3BEMDd2bEtyWkJMUEZqdk4zSm0yWXplWTRNSXBH?=
 =?utf-8?B?RWE2eW5TeU9ZK3MzZ3hEQyswZTlqL1VHYW5zUUl5SGx5THhVL2c1Y1dpeTlD?=
 =?utf-8?B?TWU5QnZkbkxRUWpGRjZCYzNhRlM1RFV3dUJxcmM2V1hUTGVzeEcyRVA1Z0JZ?=
 =?utf-8?B?eWtaSWpLYWN4VEMwRjdGUkovRWFVZ3F2NngvWkJTUUx2NVdlR1AxM3BqcmQw?=
 =?utf-8?B?Kys3WjU2aHhmR2hCS2ViZDI4Q2x2RlpuQnEwMWc4RG1INXJTYXpLSU5uZG1o?=
 =?utf-8?B?T1N3MTJTdHdvL2gydDZjZU9aVlhJL0VLVWV0cy90aEIwdFU3RDIyN0FSMjN1?=
 =?utf-8?B?TVlqV1I4Z0ZMSEh0TjBmQjh4K1BNY0xCYjZXRGFEM211VDI5cldZTnJZakZ5?=
 =?utf-8?B?dnlkYloxVDFMUGdocUZjUTluQTExMC9yQWxpeWUxRHNtNCtTQUJMdHFPQnV3?=
 =?utf-8?B?cFpyeDFVeGxZT2kyTElvMVhjMzFsakRrNElsNlFoOS9OcTdTa0R0RW1UM0tW?=
 =?utf-8?B?RVhsVy9PaXVQRC9wNFdsV0p2Yytyb0l6OGcwTE9jSUlkTEhqSXZwaitma2VY?=
 =?utf-8?B?WlJSZEVaL2o0SVNhcGY0SWwxK2dMR1lkN2N1ZjlzT01FM1ZtOXRCRHNNWEVH?=
 =?utf-8?B?ZVNEVHI4VWtTS0g0cFhNRTdyODJoZzExY2dIMUhHQkJabUJJNjljRnd6VE9T?=
 =?utf-8?B?TVNJQUFMWFdVaEVkamNmVitwSlBFZUpZdFFOUUtqT2grNW5ySElhekZGbWs0?=
 =?utf-8?B?WXNMMFJ2RXhvUnpCUTBzQlMrM1JiVGlWK01pL3UxZkVZT0xkai9xdG9uTzJD?=
 =?utf-8?B?L2l1RGJJbzRVcGd4YlovTVFDeFAzR1RBYXpZL3hNaENLT04xVzhpUmVPWSt0?=
 =?utf-8?B?UG0vSVNGbjh3VVVCVGxLZFVwUGdhNlkvNGVKa2Y2Z3FYNGEvckhuV3ZEQytB?=
 =?utf-8?B?MGx3ZlU1VVpzQktvc2VLR09EelByYW1ZeXZBOEVCaE1QbzREZWZMUjVaWHJ5?=
 =?utf-8?B?OG1tUlUvOURDWVVQUTFUREw4cHZzL2d1U1RBb1JEeGVWMkFtNTh4V2dvTGZu?=
 =?utf-8?B?d0RFSm5VOUZ2c2hCMFR4S3hZbjR5OGZMQlFDYUxHM2M3RnVReWxXYWpORHY4?=
 =?utf-8?B?b082TVljSmdZaG4rb25Ia1RzcnFlSmlUVm9MV25LYnowY09BK3o0Qmk5RWJM?=
 =?utf-8?B?ZWh0aVc2UWZHQWNSLzgzaGN1dEF1c2tXc0RmVFN3dmxVTHlhY1NNLzNuZjhi?=
 =?utf-8?B?WWN5OU9ONVVacWJPVXhQQm4vY1FYSzd5ZjhUenZzOURqZEpmd1hRNDRDS2ZJ?=
 =?utf-8?B?K0p2RU9tOEF6d1REa0prM0VSWlFCYmJBczFhWStyMG9jL0YyMGsvbTZXV0sw?=
 =?utf-8?B?QUNHdWdlVTlySEozRUg0aHJ2eWZUYXE2d0wvYnJ1MzBScS9XZUphVktEeXM5?=
 =?utf-8?B?R280UTliUjJJaW56RDJHRHl1MUtTT1llM0NmaWRGQnlOZ1ZmcGJXQW8yYjZy?=
 =?utf-8?B?TXZaUHVpbGdRUG1aSGt0OUN1Qkkra0ozSGV6VTdMMnY4eSsrNzdTcXdET1JY?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iMxj0w1JvU8bd99w5dq1HtN7tEh5Y/Jm7tQl47fdOsj/i/sOpclL10X2nhasODqwmIRZvVK9iE/ZCbt/PJAw0wGzteDKJTg31atMDuobVHNoMtChSo5g91bYxpD5hY8Qnr/IKrVMycTIVy9H2BrQAxzv/gs59IU2EeDq6yXehWeRyuILlfmbGpJa/vbFj9EWpAgADBWApqHyJqQUNCiwnxs5/S6tcnsn5o6UeJEnxE+U5c4V7wc+JgbvnAZLtaVsttzA/wuYrQBU064wv3J5oYsw3Mz8r2v1yLW/2ib89HysXsxJr8RNOFoXhD8Pcph2OknIpUfdGZIx748w0LAeYWYiNBw+10CseVoLYq2BrGyqc0FBHw+/3czSF0J/F5mJnxiEb6ICja6Sj8ndCRtrpuoZlfKb9osee6ZUB8OtSgv7iTebWr6drLEMD9v7+0ZqNYQIvTkZpWRx/vbnZ669/4uromYkNKFSyxoCUXY0ncuUqZKCC+qO21VsGd1kgqzDD7Kv7wsWzu0b70WA2Zpwg5oTQUfqOSh/MXji7D9YO+C2zOrpHGq6wbPOQh2LLj4/GRcM4Ktt3dGPs3zoGUilWuyT/RYsWB8/CHqikvitML8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7076508a-2ebd-410e-55c3-08ddb9781b2b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 14:52:46.2813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kC2BZrJ8A60aejcIX8GTmXIxZ431ssd9DPnyWOMOdoRhqe0+GQ9x/NaRHqhVquNBFrSpGkCLCAeOn2I7yot+3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5031
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507020121
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEyMSBTYWx0ZWRfX5oNL4u/s6aAg suKfkimlB1dgpOTjudnXQU4rvS7au3Rgv9ik2y2HjDH1dOPx88nwna1g/eevq5R0gIUS7da43LE 1ENahVjixWJX0NIRhCizkMQ8AnClyPccQhuZvDpK+MUzzncmry1kxHQ/cmjjn8gFd+pRXGukbWz
 /PKU4i0/TK5EUVWY27CxgVosRIL0WkolOGggnqjFeMq8IbmRl2chVw1Y7VZRUea5mFfqJOK+U1h Q7X6X01ECrNQ5kHWafdBUzwXQL/ym9jGAIQ0ph8o4a1uS5cqAkrJ1rFMiCKX7CtEJkwp2V5AQE3 6tkHuH/JH4fF+kzO4QGsAeBwmt/5qAbFRKfKhpV8J0QPdF8NLVdRrJpbkYMVcHk0EVuZK4R9Em2
 S8FGT79HinXEOEtJJcHQ6xtjPrN9L2oEVjFAff30DHxBADfz7tjVJC8+A5ko+zlKpbXV5Wc6
X-Authority-Analysis: v=2.4 cv=MvBS63ae c=1 sm=1 tr=0 ts=686547c2 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=NxZPaNHenlTd58B6OwUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:14723
X-Proofpoint-ORIG-GUID: lBvcQL2zQr1jbHU_2MXc1OfaJJfGpQ_a
X-Proofpoint-GUID: lBvcQL2zQr1jbHU_2MXc1OfaJJfGpQ_a

On 01/07/2025 20:27, Kris Van Hees wrote:
> On Tue, Jul 01, 2025 at 03:08:59PM -0400, Eugene Loh wrote:
>> Incidentally, looking at the subject lines for the patch series, I see:
>>
>>         dtrace: move get_member() to dt_cg.c
>>         dt_impl: bump number of TSLOTS to 8
>>         dtrace: add tcp provider
>>         dtrace: sync dlibs with tcp.d, ip.d and net.d changes
> 
> I would suggest:
> 
> 	cg: move get_member() to dt_cg.c
> 	cg: bump number of TSLOTS to 8
> 	tcp: new provider -or- Implement the tcp provider
> 	dlibs: sync dlibs with tcp.d, ip.d and net.d changes
>

perfect, thanks!

>> That is, each line is prefixed with a component name.  We do that a lot for
>> "test:", but otherwise the practice seems to depend on... the patch author? 
>> Anyhow, I claim "dtrace:" is not very useful.  For patch 1, all the prefix
>> is saying is "there is movement in the dtrace code base."  I think the
>> subject would be more direct without the prefix.  Same for patch 2.  For
>> patch 3, if one wanted to use a component prefix, I'd think one would use
>> "tcp:".
>>
>> Historically, it looks like we've added new providers with subject lines
>> like this:
>>
>>     rawfbt: new provider
>>     Implement the io provider
>>     Implement the ip provider
>>     Implement the lockstat provider
>>     Implement the sched provider (first part)
>>     Implement the proc provider
>>     provider: Implement a rawtp provider
>>     Add a CPC provider
>>     PID provider implementation
>>     Add a profile provider
>>     Implement BEGIN and END probes for the dtrace provider
>>     Added IO provider support for 4.14 kernels
>>
>> Everyone has their own style.  Shrug.  No big deal.
>>
>> Anyhow, personally, I think the prefixes don't add much, especially for
>> "dtrace:".  My suggestion is to drop the prefixes, but... your call.
>>
>> On 6/10/25 09:58, Alan Maguire wrote:
>>
>>> This series is a first draft of TCP provider support, where the
>>> probes are implemented via underlying fbt and sdt probes.
>>>
>>> Due to the use of the sock/inet_sock_set_state tracepoint, intended
>>> for ~5.15 kernels and later.  Tried replacing this with
>>>
>>> fbt::tcp_set_state:entry
>>>
>>> but this misses a few state transitions, so stuck with using
>>> the tracepoint.
>>>
>>> All tests under test/unittest/tcp pass unmodified on an upstream
>>> (6.15) kernel and 5.15 UEK7U3 kernel.
>>>
>>> It implements all documented TCP provider probes:
>>>
>>> accept-established, accept-refused, connnect-request,
>>> connect-established, connect-refused, receive, send,
>>> state-change
>>>
>>> Changes since RFC:
>>>
>>> - fixed issues with test failures on UEK7 due to missing
>>>    SYN_RCV state change
>>> - moved get_member() to dt_cg.c (patch 1)
>>>
>>> Alan Maguire (4):
>>>    dtrace: move get_member() to dt_cg.c
>>>    dt_impl: bump number of TSLOTS to 8
>>>    dtrace: add tcp provider
>>>    dtrace: sync dlibs with tcp.d, ip.d and net.d changes
>>>
>>>   dlibs/aarch64/5.14/ip.d  |   1 -
>>>   dlibs/aarch64/5.14/net.d |   6 +-
>>>   dlibs/aarch64/5.14/tcp.d |  52 ++---
>>>   dlibs/aarch64/5.16/ip.d  |   1 -
>>>   dlibs/aarch64/5.16/net.d |   6 +-
>>>   dlibs/aarch64/5.16/tcp.d |  52 ++---
>>>   dlibs/aarch64/6.1/ip.d   |   1 -
>>>   dlibs/aarch64/6.1/net.d  |   6 +-
>>>   dlibs/aarch64/6.1/tcp.d  |  52 ++---
>>>   dlibs/aarch64/6.10/ip.d  |   1 -
>>>   dlibs/aarch64/6.10/net.d |   6 +-
>>>   dlibs/aarch64/6.10/tcp.d |  52 ++---
>>>   dlibs/x86_64/5.14/ip.d   |   1 -
>>>   dlibs/x86_64/5.14/net.d  |   6 +-
>>>   dlibs/x86_64/5.14/tcp.d  |  52 ++---
>>>   dlibs/x86_64/5.16/ip.d   |   1 -
>>>   dlibs/x86_64/5.16/net.d  |   6 +-
>>>   dlibs/x86_64/5.16/tcp.d  |  52 ++---
>>>   dlibs/x86_64/6.1/ip.d    |   1 -
>>>   dlibs/x86_64/6.1/net.d   |   6 +-
>>>   dlibs/x86_64/6.1/tcp.d   |  52 ++---
>>>   dlibs/x86_64/6.10/ip.d   |   1 -
>>>   dlibs/x86_64/6.10/net.d  |   6 +-
>>>   dlibs/x86_64/6.10/tcp.d  |  52 ++---
>>>   libdtrace/Build          |   2 +
>>>   libdtrace/dt_cg.c        |  39 ++++
>>>   libdtrace/dt_cg.h        |   2 +
>>>   libdtrace/dt_impl.h      |   2 +-
>>>   libdtrace/dt_prov_ip.c   |  45 +----
>>>   libdtrace/dt_prov_tcp.c  | 405 +++++++++++++++++++++++++++++++++++++++
>>>   libdtrace/dt_provider.c  |   1 +
>>>   libdtrace/dt_provider.h  |   1 +
>>>   libdtrace/ip.d           |   1 -
>>>   libdtrace/net.d          |   6 +-
>>>   libdtrace/tcp.d          |  52 ++---
>>>   35 files changed, 761 insertions(+), 267 deletions(-)
>>>   create mode 100644 libdtrace/dt_prov_tcp.c
>>>

