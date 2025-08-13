Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83DE3A1D2
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 05:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755061975; cv=fail; b=mjhhAszrJbtUvqdXP5D7XA65HQbtDswhEf3WICwrjiX33c2q4/g8B3BqffaBD5Sx+rOPFrrkrmJ+hyBPtOO7TaQlYZC42NKvieFSoY3Qb5NX253okOFDKHTxbA/tRwjwwAiRPrw6L+31m77+4euPSnjuWgD9Q3SPd4f8JjTT+oA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755061975; c=relaxed/simple;
	bh=AaBKViCB92h2ZUBdeg/4N4TuN2uFvFy9LDMKppARo4U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Sr3uht7+sFlhgmFx+ItX0x2wJJV4eORRDZpY3sISzWIHV9bp8KXl1oKcJnVMctN5GcyB8gz71HG1iZuSj4l2aAOoPRt0fESeS85IIVSqzocplcD4n8/tUGK3zwpBtqrHQ7vRcVTSKbk6jmDbdSkSdM79jdJeczZpssatQHpVtNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=W47vZOsk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=u8OqBfeC; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="W47vZOsk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="u8OqBfeC"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CLR99G027969
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 05:12:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=BwdPKTfwYFRJ91Kax+fSNfLrLQ+kEob4MAZcdQy69w8=; b=
	W47vZOskI/AMV1QqtzvQdvasFiRO51P0P6uIDsihncTyM0296Hxr6cvFYyYUJXcz
	TH6wF6cr43UTkL5Nf4n5liT/6U9OmsjrT/jtQPJslIyaYUOYkcdsryukNNzx7GWR
	PGS1aEOoLMicX3s0xrRcqmq2Ig9Us4cuIJU6DmrWc6CRAArQP5lcARQLmXxLx7Za
	HHhYRRofnMTvFkI+dWe30dxXDkLm94t8g5qFkJfwrD2ZPqaC/9ftC1YRldLXLsDd
	pa0Lw7zCimz1Ze0Ef4hBZQEb250FbqkVWgwxJw5k8+tPHslD8vVZYQk/Bwvyrdrh
	OZKCUmiVe5C1d+bfH7LolQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dxcf6ghq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 05:12:52 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57D3pI6o038561
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 05:12:51 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazon11011017.outbound.protection.outlook.com [40.93.199.17])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48dvshe8h0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 05:12:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vRGS6Xi70FwmIpgpoEW2MW7qlu2hXVwT6OT/9e8LwANX9Pi2556Pebdic8T0W7Cji3ojwDeb1nrEtResWR/ZF4I4gfBTVTtbVKyNXZla5BW6BIHfUsI+8f0KqA1UJWNM+JmekNFj/C8UsnDgnpbRWmSGh5ytUBmPrR657kKRgkVzazpU8Fh/evbjrxwRB8fvwaXG1F8eQvRcNdnlgkurhqisDwKBcEe03QbtL3f+vrEbMjbmmAudARdkiKooZKsIFrlKuSlNAGTZOopKwjlsJyTHRAG5sr3Yq6qX2wgptEt/np/xh0H9sxLBcCQbvsPI8l2+C2Dy/UkvaGvPjd8NdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwdPKTfwYFRJ91Kax+fSNfLrLQ+kEob4MAZcdQy69w8=;
 b=cyRQMv2xmWPTLhOan5NsSp1ze6gGOAdqL5nFsQ0bpByIGYY0511XdBTazPSwU8CVSirFfpMp2Nnk60u77ZH0Oe7UrrfDVojpjPFUURMsh5xLEbmZXmTgdn+P3+rrUnjkgXdZFFLDtgbkNxl+L9HxXs8chX8iBqckRgR+7su+PdgPI3Z6hYgydTB6QRNL8TdsRXDMEfxs7wh6aJ6HIbx2xn77+RkMGN4hX21eS60D3VugB7f2yLqTEm+IVFm6d7lcQ/CfFEdSVOiN4u1NZRuuwaDkbglpD7x6CazI9p41uqGnfmgj+UBXkOHBXgymSqVeueeMplAt3zuJpN5k7l95Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwdPKTfwYFRJ91Kax+fSNfLrLQ+kEob4MAZcdQy69w8=;
 b=u8OqBfeCIxtfz4qbxj6V0peHxrI7NdSdpKfEoCz0zpQgGrHj8Z8oPI2oivm5N7n/NERls40CmLCSs0Ume+uuQlEckLC0XUwfPwsfVTDm74tE7ypgZJ12Jn2KFKIeL17qgVgy6mN4qrQXEM8mNZA8ZrdWs3IPvzUvtVGgoDjdtw4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by LV8PR10MB7869.namprd10.prod.outlook.com (2603:10b6:408:1e6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Wed, 13 Aug
 2025 05:12:48 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 05:12:48 +0000
Message-ID: <2e043e36-9e04-44f8-b852-27fe1dc6797d@oracle.com>
Date: Wed, 13 Aug 2025 01:12:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 2/8] Reduce stack depth if kernel returns
 NULL frames
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240604180008.11331-1-eugene.loh@oracle.com>
 <20240604180008.11331-2-eugene.loh@oracle.com> <ZsPVqitlZpZp2lcA@oracle.com>
 <4098cfc6-ce97-e8e4-28c6-b5306c23e51f@oracle.com>
 <Zs+FzkKIbqs6HSA6@oracle.com>
 <7223b095-bc2d-108c-7738-584673676e6e@oracle.com>
 <Zs+Kk3/VUrNnxSNs@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Zs+Kk3/VUrNnxSNs@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR07CA0013.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::26) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|LV8PR10MB7869:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ea46c61-9523-47e0-a730-08ddda280b80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TStnSzlXV0ovUFNXSlBhQ3V5aHJscXpMWVJacXBYUUlHKzMzdm1aNVdOQVFG?=
 =?utf-8?B?ODhuMlMvdDA2bXFUTW9ZckhKOU9OKzV2UDB6aFBwTVI5L3p5cVkrTTRKYlFF?=
 =?utf-8?B?anFoZHVWWEFBRW1UNExwYStCOUx5ZWd2Uysvc09aUm5VYm1iUlFNNStyaVdY?=
 =?utf-8?B?THc5dGJjT2hrMDRvelFGY0hrRjVwbWFKcjlqaHZnUVc4b0hOWkZrd291YTRW?=
 =?utf-8?B?akRaOEE2eVYyUndGYmZSQ0tEcTZONmxVN2V5dTI1eUV6Y2hWbXZDN1JYUWJR?=
 =?utf-8?B?T096RHBNd2FWOVBhZUR3OC9wMnNYV0lGejlTZG1JMnRkNUlveVhESEN6MWMw?=
 =?utf-8?B?UVQ4ZzdpQ2ZMMExpRjc0a3NOeTNvSFQxT3I1Y2hnQmsvbVF0TENqM2NvL2lj?=
 =?utf-8?B?UzkxditHN2ZiYVFVeGxYY1laaTRnUDNIZ3RHRFpvSituVWd2Vk4zWFRUNVNE?=
 =?utf-8?B?cnJnTEJrMmR0QnVoU2R5VlZqSEt4elgzeGY5N3o5R2hZTnBINS9aRmlUaEZ2?=
 =?utf-8?B?TksyZEhUM29HZzRmMzZ4UjU1Rk9FTWRXWFp1eUpkbFBZRy9nQ2laTlZvMG44?=
 =?utf-8?B?cllhUFJaeUN6NXBiTEhsd2swOG9mZFJrNGFEL0w5bUx1SGwrSUpoWkoxQzdh?=
 =?utf-8?B?c1VuNE9wNllkSWk5U0FVSDU3ZkFLTUdhK09ETlVwdTJaeEVic05wUjVaQ1ly?=
 =?utf-8?B?VEQ0dGRxa25wMUw3QVQ3MWdQYmpnNDB1RmpySC9NbFJIL0JEQkVlZVczeGdY?=
 =?utf-8?B?aWVOeEtPOWR1OFV6WHQwcWNselN6eStaRldWV3BrRmNFdmdIK0NpM1UySzY5?=
 =?utf-8?B?ZnVMai9nb0lNTno2VDNsWVFZR0hCWkkxeTA3MzNQQWlGRzRnTDN5R0RUN2Fy?=
 =?utf-8?B?RWhUcTkvUUNOVEl0WjIvQnFqYXlLSzNKTDdSUVNBZVdoZWJQZCtJaG94Rklx?=
 =?utf-8?B?ZUtWYTF1ZUtLYmJhbUZudHBoYU54eGdJbWhuNEtmVllBbzRpVDVGTW13VjFT?=
 =?utf-8?B?cVJ3NFY3YTZhUE8vOTFhWFlzR3drOUJZSE4xeXE0ZmNNN0Jnb3JYUjFxYkl1?=
 =?utf-8?B?b20yMk51WGdid1pNMXJhZHYzOCtnZlhyZWhYWC9yT3BBQ25ORDZZTUVRK3gw?=
 =?utf-8?B?SDlaN3JzZjJZSVo0Qk0yVmVOZXlpK3BpK2U0ZGR0eC9aazJFWE1JZmx3Q2gy?=
 =?utf-8?B?bUFFQU9obE5GSUJnVStOR05UaERsb1lWSWloT01FUnlueFZ1aWt4U1ovdW94?=
 =?utf-8?B?NDBnUXk0T3ZheDBndjdIb1k4dlNSUENHSEtIRDdjY2V4Y3dNZ29xazl0UitL?=
 =?utf-8?B?NnlBUGh5dWVpZGhzUVprZis3UFpYRUt1a3R5ODZQQzZxZG8xcU5mckhlVE00?=
 =?utf-8?B?Yi9QSzJOS2g3bnUxRlgvSitqT0J3dG0xWDRaUWtpZ0xyamozNUNsSHltZHlX?=
 =?utf-8?B?b1FxUFZHUFRvYTFHZ3lMdEtpeEVpMW55NWt2Z2V3cmhnOGFMZmVFL2ZvZXdm?=
 =?utf-8?B?YXZQRGFydU8xZHpoenNnM2hBYS9jM3ZJNTR0dkVYL0FET1pST05KWndRZ28z?=
 =?utf-8?B?a05GSWRaNjNSbGNnSmdRdXd2cjJaQ1phY0RVZTJYRytvQVNCdkxDQlZLYW5B?=
 =?utf-8?B?SFBNYk9uamgxZjZST3FXNUgxZnVMenBYQmQ2dXprRnlXWnpxWTRxUTVVYmIw?=
 =?utf-8?B?QThlOFZTL2U5bjd3cXRPZzh6K1ZvVlVuWUwzaEtQeStsTkt4dkFoZHBiSFNj?=
 =?utf-8?B?bnpXOW1USzIwbDFuWTBKczdMelVYT2NqendWeWFBZys1VXhpVXlNamRta0NW?=
 =?utf-8?B?OXJ4cTZieU5ITVJsZlhtQUd2Ukc1VHZCdWx3UjFFOHlqZEVIeERmSmFaeENC?=
 =?utf-8?B?NTlLMW5lT2RUd0Y2VHJaRDFUUHBlbGNpVUdwZkhXSU9pQk9kRkJnZEtDd01Z?=
 =?utf-8?Q?xZ6yoazEjd8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUFFbk93aGxhdDBEelNLUnhjcmJOM2V2TDQzcUtJQWZxcktKMTUvZzZyNk9Y?=
 =?utf-8?B?c2g3WlRRNW9rN3g4V0FCWFlGdHlLQklLQkladXRvVHg2UDAwdlVnZlRSVXY4?=
 =?utf-8?B?MkgxR3JidmNiWWREY2IyTWxaQmV5N1NPbW1FK1RXanZOeVp2UTIyMHpudkIw?=
 =?utf-8?B?WHhKMjRKKzlWb1hOMUl5U0IwOEYwTlBQdW1CTzNwdmxIaUZZOVE3d2NUSHlm?=
 =?utf-8?B?SHhrUGlHRWRvcWo0dnd0ZVFIOGJGYVpVaTVuZERLWUppT1M1TE9xaFAxckpa?=
 =?utf-8?B?SElpWEtUbU5yZW80dlVRb0JwSU5ZMG9IOUVvcW82OEVGR2VQSko4QUJhS3hM?=
 =?utf-8?B?RElRUFZxU2g3a0xCOGtvdUpLSERVWXMwaHptUU12ZXBKTUZSMkRqMU1MdVJ2?=
 =?utf-8?B?UWNaUTlWU3lEL1hzZ3VoeG5rNmY5blVKUmdFZDZnT2NnYXovSTBZMnBIczRM?=
 =?utf-8?B?NGJWRkhGSVBvcklVbkZEVklrRFp5VEViWWx4QzlEbnRkbXBEbllkNGhCWkEz?=
 =?utf-8?B?YTUzZDBmRHNSVktNbFQ0S2Y3cTFSOVM1S1VISnpzVUdYVGxQZVhWK1JpOHBi?=
 =?utf-8?B?Mit6ZmJ3Zk1IOHFCc2dSbjFvTmlxYnVNY0N5WGFrUVhZR2FCRHBHRTk5U0ds?=
 =?utf-8?B?SHYrZGtHS2RhR2Q5aFlXWkIrL1NLZjN5ZkpQRmFUUjloVWVxdit6SXdkTlRM?=
 =?utf-8?B?bmgwS01wN2RnWGFOZFR1bDVoRG8xV2QwcXFPdlZZRHJ2eTZWUFpkZXAwZ3Y4?=
 =?utf-8?B?OEFlTFJiNisybzgxT0YzeFAvUTgzL014QXI5cjZpeFlZZ1RubUU3d3FHY2Z6?=
 =?utf-8?B?cFMzZGNRRVNrWXJmZENhS1djWElBOGpBQktlYzRreVRNU1NyUWVXeUU1aFlM?=
 =?utf-8?B?Mmx3UXpvSFhhaEFndUFUT2pwbXV1cVZ3UExDTFRncFV3eGJQNjNMTC9penlj?=
 =?utf-8?B?UjhVdEdwanAxNEVxcFQ2bE11byt6aWdiT3FOMm9IQ3ZmdGxJK3BjU3BlMkdo?=
 =?utf-8?B?RGhSWWZLN2RyNUVIcXBxVEU4THNBSmNSZi92SERRb3JOWjFObzlxdm8xZ1Rw?=
 =?utf-8?B?dDBVVlp1dDlaYUFDQWowYkZVenhPblhMZnVERzNTclJKNFVKaWtMY203L0lw?=
 =?utf-8?B?SVJUSVlNanVWNFBZOEZZQ1hJRUZibXN0MFRCTVdGV2xqVW0zN1dwR0pmb2la?=
 =?utf-8?B?U1hTT01sbk1kbm5SR2V2RkdMaEZKTytOaXRNcHZBTHlwdGFLR0d0UFA5TEVQ?=
 =?utf-8?B?WUl4OVpLVVc5cmEvYWlnM21xVzIwemhPVldEd2dxTC9RNXVWcHpLdFk5TURj?=
 =?utf-8?B?QW52UUk2TWYyOGd4QTJNOE1xOXlpbExkL2JIaXk3RHdRZGE4Nlo2S1lSL1lW?=
 =?utf-8?B?MFY1OVFVSUo0SG1leTlodXZoM3JQczNuY0RRbE1mNmhEd0dBckJqRWpBN0JY?=
 =?utf-8?B?NGJ3L0daS1pNRHRqOGRxQ3JYT3VlR2RPbVZyNHN3KzBtTU40VFFiN2dRdlRz?=
 =?utf-8?B?elNiZ3c2OFlXVTZnbGJKdGc4ZUhHZUFsKzdvSW9NaE0rdldYREQxaEFBbndv?=
 =?utf-8?B?bWF5bkJWNVVyQ20rUEhJcHJZRTFCdXlVTlpUdGhxR2tOTjdNNmhaR25SSDJs?=
 =?utf-8?B?Z1ZQWFREOGkxaUlHeFBFQkttK0wxeFlnaU04T0x1OHRWL1FpSnNDUzEzMStx?=
 =?utf-8?B?aGl1dndvbkNjVjV4MStUR0NpdFJXUWx1c01KUzJZT2kvYmI2eFQvaEI0OGRz?=
 =?utf-8?B?dmRhekFDT0VXWU5WdXRHMDhRK04waDRZKzVJK1ZtUjIyVUZSbXNQc1RLbnFH?=
 =?utf-8?B?QXU4djNqS2xhTWtKcjZlVVRZcC84aGZoUnhoWmVNVFh2c3VIK09YQUtMTUdB?=
 =?utf-8?B?am9XNUtwWkdZbFFDNCt2bnpRWmkxTGo4Y0U3d2RCcjByYW5KQ3FHa2Q5ZHdU?=
 =?utf-8?B?NXZtSThLdG9jZjRwY2tybGxPdysyQnRSbXhSL3UvWFgvcTlsNGI5ejJlV3Nx?=
 =?utf-8?B?a1NpSWZEbC96eEMzbW9xRDhrMkNKRm1pT25mWm0xVWQ5TURlMGIyMXY3WUw4?=
 =?utf-8?B?OWZiTVZNSkhXN0hRMXFJR1pPa20vUEt5RHpWZ2wyVGhiRHQ2cFMvV1JFblQx?=
 =?utf-8?Q?ChF0PeCY/V6ARgO/7M0ECwfQB?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	r2qluVBg/hb+r85LnhW7yXHkGcdR4Y/I8/Wwm3hh14o7Gh3YTsVkX8TSXWUUGRzAoWB7TU/EskbD43CsvEJgXo0qfsOBuT9eS6l93WzbYhEVGZ/nraA/objiH0OQjaH5nBHzdgwqsra4NHWG4/gvvhCUSnkm10G2zSqtfk0bQApYuKHwQv5rk6CUTUjlBRLFCwSOisapbJU9rnzAybvq2dnA59Q/xU9en3+aWpilo8r5NL708aznBPbW5VW0k+5hWMT2UMloU4HQN8r4wk8EXhK9jedRP58Qt3+qAt7iTwbiB+1iLHX/EJhXy3d2HygXlHZE3pIexNG3xNKBUtSV/s0WZmZqoqExxbrBbCwf/I822kYFMbds7qSzNnDDnLdAiUHCVAFDXgzGNdz6o98wOPUOYOOzN3MZt+zkv4nKI899sj3/7d/Vvadm6RTq03ycaLOcww+OtXlFMh5l5YPRgN4Ft/0a3Fk3UFn6Gw1lixK1ngceRaa9VBgaBiUHaNeYKlv8wVyzT8Jw5uCSGpn5I+VfzDIo8nuJGRhT76RKyr4Z/XuGXigXXoF9doMv4aX93FgRUb3lJVaz/MSBD+IuLh0lBBC6VHMQ5uktJnBdLPw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ea46c61-9523-47e0-a730-08ddda280b80
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 05:12:48.6403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4612nYctsQl8qhC1MinM5VQ1xugZebiAPqOxWOqd82uTifvZA/NSONeGu4ZvgKd9Kmy/tk1aMLGhBGtgURkddg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7869
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 phishscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508130047
X-Proofpoint-GUID: eleBD_gHPWYrWM8LreYBbu6RUoVlUA7Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDA0OCBTYWx0ZWRfXyGlNQgPG7urN
 +hIE3e91JCcB/x8IrcgRc3KSne3Dkjlp1LYmWQuZ8i9hS2/KBSI7oGIMIwFkQKehrmeDX6VP9Yw
 sNnVkOj9f/o0kP4X++m4RkpH4Dl4idV8aMGKLQkLPLAcEs4wX1Lc1/1qOGgkLK85bW1qmU2+F3h
 vFgenIECwagIEt1gdHFrc0m6xeZf8S6fHDAuNuCH+M2jGUZUrAsvJJQdEKBpOMnrmrqwTMJg2IH
 8Y946SxvMEtQ4Z19M6TJ3wtZSdRZpklhVkE9B4EvK/g3Ml5gPtgRyFzSZLB9m2SFVab0nlucNcT
 /vr/i8lHStgygwZFCBe5cD+OlheIiA4PJj8uqa5uBOWAtMqeoWXIq/FevXNmQzXgk+7drTPs+Re
 J350K/mRtSHQ935QHIctTsfI5HG0yoPwtuAq0lwykwibQpILi3LXwxxsHQQAhBZiTh1PHLO3
X-Authority-Analysis: v=2.4 cv=W8M4VQWk c=1 sm=1 tr=0 ts=689c1ed4 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=RIJ_iUnId1nNlQncolIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12070
X-Proofpoint-ORIG-GUID: eleBD_gHPWYrWM8LreYBbu6RUoVlUA7Z

I cannot remember which test this patch was trying to fix and recent 
test results do not suggest any obvious candidates.  Under the 
circumstances, I'm fine rescinding this patch.  Arguably it was just a 
workaround for a kernel bug anyhow, and perhaps the underlying kernel 
bug has been fixed.

On 8/28/24 16:37, Kris Van Hees wrote:
> On Wed, Aug 28, 2024 at 04:23:09PM -0400, Eugene Loh via DTrace-devel wrote:
>> On 8/28/24 16:17, Kris Van Hees wrote:
>>
>>> On Wed, Aug 28, 2024 at 04:11:29PM -0400, Eugene Loh wrote:
>>>> It's been a while, but if I remember correctly it's actually just the other
>>>> way around.  That is, to make stack and depth consistent, we're forced into
>>>> this "depth reduction" patch.  Put another way, the stack simply does not
>>>> include NULL pointers -- there is no way to remove them.
>>>>
>>>> E.g., let's say we have a buffer of 8 pointers and we ask for the stack and
>>>> get back:
>>>>
>>>>       0xdead 0xbeef 0xfeed 0xface NULL NULL NULL NULL
>>>>
>>>> Looks like 4 pointers.  But we don't count them.  We just use the return
>>>> value from the helper function.  If it tells us "4", then everything is
>>>> consistent.  But for some reason (I haven't looked at the code to figure out
>>>> why), it can be 5 or even 6.  So this patch bumps that value down -- to
>>>> attain the consistency I think you're asking about.
>>> So you are saying that the number of values that is actually filled in is not
>>> consistent with the return value of the bpf_get_stack() helper?  That would
>>> sound like a kernel bug.
>> I think there might be a kernel bug.  For a variety of practical reasons, I went with a DTrace workaround (and haven't looked at the kernel code).
> I'll look around to see if I can figure out what is going on and whether it is
> a kernel bug (which of course may already have been fixed in some kernel
> version).  In general, we should mention in patches like this that it seems to
> be a kernel bug (or first determine if it is) because otherwise we're going
> to implement workarounds without ever making sure the kernel bug gets fixed.
> Or if it is not a kernel bug, we need to look elsewhere why this goes wrong.
