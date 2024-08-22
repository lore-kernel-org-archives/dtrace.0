Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C393A38
	for <dtrace@lists.linux.dev>; Thu, 22 Aug 2024 00:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724285511; cv=fail; b=QqJFkvbJleAhEiHirxDcbluwpQxuWamTp367IDfGI17ccDsJstLReZz0/6jTizUTh9kFlG9kJs1259UP1ukdDpX2zFjvMjAPpIZuEUcKfds34/fRIzdyS03EIsWI3kRy24lZKmimYUJ4FWSJd4v9UVIWH2BIU3ZJ+M90X/9ULDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724285511; c=relaxed/simple;
	bh=mbFDBgGV2JI/6sk7iF6WasKgfdMBRXVUt/C/YjfOT3o=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BrLdkTNSvm6+TAM/NTge55rCQHbhszGLKt9qvU2wfSlJw431oOOxxIzwUoGbQR8mU76d5Fa2pYiWgbskkYE0q7uCo2iZGgLc/vm9dRN/KHBVsRs/5fUGbIsQRJ69mY5F4/4dmf5pzljjHqFGrcZc9NaK6wlmSIYVKn5rGotP4Jo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZxQcwEA6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LE40cYwb; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZxQcwEA6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LE40cYwb"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47LKtTpm009801
	for <dtrace@lists.linux.dev>; Thu, 22 Aug 2024 00:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=1TQt09f819m7HMOruOCbKMDAIc0Xz++ueGvcUjq/TqI=; b=
	ZxQcwEA6UX2+NQwvkblYxxkixFAeN32e82xNC8KfP7SlN1e6ur6S4grRLBNk9ali
	QLdmKej81QNJmqZC00dJOA4zRjUwboD2H8qNzxvwY22DVepPXymSgXlGMH7HAd46
	BXTSoDJBr15F5ogYGS+Jy5W44XAxfzzX1TqwgK1iCqDxtf7VZzIQ9TZyEfgzJunA
	fhcWbRInCzK2tjFcD/mTwZ9m4P83biVo/Yk55xufpJMXtOlEofqT91fgxQuP4XsK
	fqOfAQhzzS2k0Yu1qDjNhBkX0HY11uc/7cTJjEJ2VBkA8/nDmTmaZrg7EDqlZ4RQ
	ydA7ovy4lPfctIbh5/nl2g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m6ggvuy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 Aug 2024 00:11:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47M09edt022288
	for <dtrace@lists.linux.dev>; Thu, 22 Aug 2024 00:11:47 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 415thp81dr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 Aug 2024 00:11:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eXBjXd7IsE+ybYYrXRTZPOKUaC3iaSi5RtbttaWsgKDiFHspmm4kTEIgjDgMKc7BCdxmCx3+cHUMGoMoAEiOltUZ1+x5bFj3HH6YdrzKfEKLci0QRavdbVCnk7NuYe7yB9Cbvxgu7YfyktbDUqwJLkaWhR8SUZteFC9+M2LCUuzKd7OA4O/BLzKJOYyX5HxjgQ11ADCGL4qUIVnFv0Fftee5HHEcy+ESwZR6TOqYPYIe1WAR9TzkH6222Um1hr3Oj6vOFzEVTA4dmtEQAW3DSdUGUhxrDmf3t8aYgXuEFQ7lkKod7wTelLAsKRKKmPSGz+JArGR2NjJ+Gyc8s7u5tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TQt09f819m7HMOruOCbKMDAIc0Xz++ueGvcUjq/TqI=;
 b=xVxRudvdFiOw5PbJQoUSbla36dSSGYD/OUc+4ayMWywRIdRoY1opU/Sn/sVgfcljhZLeduVEK6GZUzWRrhFpDFS4JXExt25g2kTCTkr72vMhnJFp8MKOMYexyZKpfaitMEL3y/wUkRuuNg8NkywxF4Q4FiR8Un66PCg2+I6Q3iV17oXEpgUWw8Br68ZTOlGTNYLRAuL3O+59yBk+0/d/Zehwy5MX1smP8FhG5PsLBvoAWkeKxidVRzJcd1vxPuaLUaVNDNQ4zQuS9sCeDVkt/wqLAD9hdpJKnXmEa/RDNRoiEpDxEBWQCazVxC5BDfy6vkfKbJxcc9kRhfNyOrpy+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TQt09f819m7HMOruOCbKMDAIc0Xz++ueGvcUjq/TqI=;
 b=LE40cYwbK0nLCEB5G7PxoziY3FDFwfyVSekxE76kCBipGUftCi6xmyzFs25I/UXaEQmQ1j6Mz+kBA1VZwjMLVrtgDHUeapw3D9Xoe0C0IYmEBEhbB3DnLO9srNdI29fffISUo4Ihv0pNWex6yBXMZOhDn42zc5rp8UrE3yTVhxg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SN7PR10MB6545.namprd10.prod.outlook.com (2603:10b6:806:2a8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.10; Thu, 22 Aug
 2024 00:11:43 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 00:11:43 +0000
Message-ID: <f7743a0a-1af8-fe4a-bd06-a45ff9c9e0d6@oracle.com>
Date: Wed, 21 Aug 2024 20:11:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] ioctl: remove obsolete ioctl definitions and dead code
 that used them
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <SN7PR10MB628717A48FCC1BBB3B96F465C28E2@SN7PR10MB6287.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SN7PR10MB628717A48FCC1BBB3B96F465C28E2@SN7PR10MB6287.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR04CA0092.namprd04.prod.outlook.com
 (2603:10b6:408:ec::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SN7PR10MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: c0bf9094-07d6-447a-0192-08dcc23f010f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UjZ6Z3hVMXR0TXV4RVBYSEFsWXNtUkxjQU00TjZod2kya3N5b2RuMXVMMkN1?=
 =?utf-8?B?Tzc1UUhtNGo4a2Yvbjg4bnBWNzMyeFkwOHozaHpKZjh6N2FxME5FOXlTdTZB?=
 =?utf-8?B?YVJoTFFoaTJnVWFQU3RaMDhCMkxtQnY3MlkvYVUrcGdUTnY2MEJoVlJTZWZY?=
 =?utf-8?B?UXZXK1M1dFY5WjRtVzRyN3RHZ0pxV0ZobCtCYTI5TjMxWHpMbExuNE1Ub2pF?=
 =?utf-8?B?UC9HQi93ZnFLenpjbTJYc0VHRlFBZE9QMXZWZzh0ajJDSldabXh4Y2xxYTRN?=
 =?utf-8?B?WkFWTDkwc0d5YXlxUmViUFpIRnBxajZkZWhLbkI2WFJpQ0p5NmxZSk4vUms3?=
 =?utf-8?B?bGhqY1ZaU3pGbERiWldtS3JNZTdxU2xuYnErZU5tdVlaL1l5ekl1cHQvby9P?=
 =?utf-8?B?WVVsa25oTnhrM0lxVTFodEVuOHlzejVJQ3FJbEpOcU1zK2dxdyt3bmE0YkZl?=
 =?utf-8?B?R3lxcTdwOEJWZ0ZmRTJDeURRa1BUQTRIOE9ncmVxbGZmV0hscnBLUVI1YzVi?=
 =?utf-8?B?R1JuMXRlOXh0Szcyb21TM3o4b1A4ckdBdEFHUmNLODczUDJBdzJqRkJpU1pB?=
 =?utf-8?B?bEFsWEF3THBJNExaTjBQY1Uya0FNNzZsRVhRSXdoSEhNNGFWc1JuUXV4UG9W?=
 =?utf-8?B?R0k1OTd5emRLVFU3V2xkeVYwSytqbW9aNXFZbWxiZEF5eWIzNHA4U3htdHRp?=
 =?utf-8?B?d1ZVNk5sUUIydENMU2JWVWhJVk56bEloOFRTY3pKNjNTU0FHSUVoUHdpWllY?=
 =?utf-8?B?ajI5TnNuWEZ6OG44bDdFd3R2eG1mSUR2RDFTT1BjSm5MZFYvdVMwL2JGa21k?=
 =?utf-8?B?ZUlUZnEyMFdVVWNGUFpheWkrNEplM0VqdUZOTFV3YkoyZEtxVDN3d2NVdXR3?=
 =?utf-8?B?NTd0SE8raG1TcUdTemtQbDNreWU3c0QzWjkrQnJ6Nkt5TkxVQVBSdTVjRUlO?=
 =?utf-8?B?UUlPUFRHb0FTNWVBKzVPNHJjdzViZnZlUmIvdDRwcjdlMmNTVW1mNW9Xb2h3?=
 =?utf-8?B?bnpZZklKamYzOGRJWS81UVpVaFVGbVVBeEF3WUIyNUh2eU1QUjR2c3J6OW42?=
 =?utf-8?B?cEZQNzNoc3AvckpzMkhYNjR4VUFrV3J3R0hmRVNDNkV6c3B6M3cyUjl4RCtT?=
 =?utf-8?B?VWNMWEdlVUF2R0ZSRldycTFPaXVDMkIyNS81dlpoMFVlVTJTdnZkZW5CYWxk?=
 =?utf-8?B?YzJYaE5YNUxDbFkwZ2pBdmU1M09zV0ZNR0hzTHR5dHlyelIzSDFVSUVEOE1C?=
 =?utf-8?B?U01CS3U0YmVweVlNR3ZXbmpGSXdSbC9CQkZ0RzRsZkYzWjVLZTVlZGgvYnNQ?=
 =?utf-8?B?N083bTdNbVk1ajJUN2s3WHhZOWdJaDI4bXJBKyswQ2ZabWxOOFhhRGZ5eGtH?=
 =?utf-8?B?N0RpSzY5ZXc1Q2Qva2RQbGJJWVUwNFB1UnBOSTVkQWV4UHYrdkVoYk05M1JY?=
 =?utf-8?B?R1NlUXpENjVLZnpLVEloYUZsckJGMk5CSkRkK3B6Mm9wT3lzeTR1SWlsQ1E1?=
 =?utf-8?B?elNCWHFUOFB0a2t3S1BhR2VzTktQWjlPcjJTaHY3czIxYlZXc3FXV1phODVy?=
 =?utf-8?B?QTBjVEJSRjNodngwcFlsWjNGQmJPc2NwbFl5QkJNbUZPWlFtS0FwVlZKUCs2?=
 =?utf-8?B?YWg1VzFmSDFKM0RtcWhwa0lLWmlJcXFJQnl5SGxHaUJXNEIrRklRdnIzNmpI?=
 =?utf-8?B?R1o0K0VjOU5UTXpPZmFwaHNuOEhVdi9KT3ZxYVpMWUl2TkFrUDBKQ2NFZ2gx?=
 =?utf-8?Q?pYt/aajgoH60fKRv+0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3ExajN6Nncwb0N5eEUwblR0R2ozQmtKd2M0Y01aMHpycGdVVUdQRG5ENVI3?=
 =?utf-8?B?SWR0aTkwT25MZUVBVDNUd01YS0VSeW5neUpIclc2eDFSMGIxNXpHSzd3UUpZ?=
 =?utf-8?B?K3Y0MXFMMkNFdWJuOXBiT3hYN1JmTUFic3BmNEtzUm1sc0FXT0ZtMndJVE8x?=
 =?utf-8?B?Mlpla2VsemNkcHRhWlBHbHNRVHMrMDluQ3UveE5wKy9aa2c0bDVQNkZNbThj?=
 =?utf-8?B?SUt0SVAzcXJtQVptNkdaMW52bmI4VkdxRFViaFh3M1lUM1R1TzhUYXBTcmFO?=
 =?utf-8?B?V0xYSk1OZWtyUE1GdnJHTlRMTWJMZjk5bTBKKzAzVTdrZmFBbkdGNzRJNnZN?=
 =?utf-8?B?aVpheHYyelN1OThEYlZzWWdOUldjZk1oTWxLRzNRUmZyc2JibnZUcGtWTDhE?=
 =?utf-8?B?cndINVV1bmdaUUtlZWo3aUd3MzRrTGREOW9sNG10TkpTdlFNTE40d3BCWFhW?=
 =?utf-8?B?TCsxNFlFajhEbXJtdGM2MzU4d0s0cmdacytndk5iSGIrWnh1ZEhQOE1Vb1hT?=
 =?utf-8?B?Y05yMzJhcko5QUZEbHJaVitURTNqVHl4cGJLSjd6SzhSTm5wZzJQZlhWVmFV?=
 =?utf-8?B?QTdOWEhNZjgrdGNTNlVQUzhWSG5nYVZNbnFtbjFOS1c3bk5yYU1YWDU1Rm5O?=
 =?utf-8?B?S1RpOHVPYVJ2UlZDRW5aOGF3RjNEbG43d0FER3ViWGN5ZHdGQkZUQUpEUnBx?=
 =?utf-8?B?WE9wbXRRdWRQTjRsVWZ1WnptS2NwdGhEd2ZDSHNtcUFvNWNXa2FHZlEzaG0v?=
 =?utf-8?B?bFJ3YlQ5UWROaXd2MEVXYjhNbEY5OS9DTDY2b3lMN285ZFRqQjNTSnFtU1FB?=
 =?utf-8?B?SVM4eC84djlhNWlaa0xMcXFlTU9ZN1lQeDQ5MUovam1OZDQrTFV3SGdtU2Fu?=
 =?utf-8?B?SHVJS05lc0FKTms5Z24vU0FKYnNzcy9PcjNwMjJSR1o2Q1FaaDduci9WR1dt?=
 =?utf-8?B?d3VWVzh3RHRoeXpUYlJjV241T0Q4dWJJSGYyM0Y5VGVZbFNjR0ZpY0dzYUow?=
 =?utf-8?B?dDA4YkErSFc0Z2hTVTdjRU9BVE54bU1LVWI2UFpXbGtlVG8xdHFLMFdjOCtt?=
 =?utf-8?B?emVqN1ExSmdHdFJSWEdnOEgyQzBsaGVMTHVEWHFjQmJnOGhxazBCT0xJVzcr?=
 =?utf-8?B?d3F2ejdvQTBmN1lob2UxT3luUVlEYkxvSFhhNEZkVlNURXk1ekVRc1RYVFly?=
 =?utf-8?B?ei95RnF6eGtXZjVnSDBIalNialhJSmM4a1R4bFdFTXUzdUQ0UlVYWjdqNnh4?=
 =?utf-8?B?M21YSXBwaW5paWlHWU5ibko2TjRNZnFBSG9RNWhvdE9ScllPMXhnUUNQbzVO?=
 =?utf-8?B?MkV3RzQyaDI2dGd4NWFRcHpJZlkxbldXWTRycHNIK1RzeUI0RkhGV2NSUjlk?=
 =?utf-8?B?QklwcjloeFZhZkgxOUgxc1luSU0xZXpta0VlZHNVNEtwQUk3TlJFUEtudFBq?=
 =?utf-8?B?eXNSRjUrbkNMdkk5eU92ZWJxSlNvbWtyRHBNMjMzNEl0TUtCcVJ5Q21wSW5F?=
 =?utf-8?B?OUxvYnlsS0hjTVdYS3BYeHJBaVlzVk5nNmsrWEJnN1huMStlbEZyT1RMeHV4?=
 =?utf-8?B?aVBMd29yZWtEYWQ1SVdPYS83WVhaaC8vWnQ4U2dHTGp3NFI0UHh2NjVUTTQ3?=
 =?utf-8?B?amlGdVZIWVNPTTFIOEpLNzdnTEVQRXRVUHB3L0hTMkp2Q2lCYXVpZkxxTW92?=
 =?utf-8?B?L2Y2TG5pdHhJcEJERmV2d2RFbFRuZmpIT2YwT1kzcjVwcXlwSCtQTXN4Qmh6?=
 =?utf-8?B?SGR0R2RsRGZpRnVtbHVaWlV1NmpCbDgvY1pBV05BV0tUMkt5MTNWUU0yTU82?=
 =?utf-8?B?R0pCaVRyUnNNL2lrWjJMQXNlUlYzT2dVRUJyOXRvVVpSR2pTSmJLQUJzSHoz?=
 =?utf-8?B?NUFYMXpIVDM2ZVg2TEJ6MGRCV3JYSXFsbXVsbDFjWHcxQ29mU2V2elZCU2s3?=
 =?utf-8?B?TEpaVXd2Mmc0bTNaSmlkZGhHVWZaSU9KaUJtbGhkZDVkb0c1M3RzTERLV25M?=
 =?utf-8?B?eTZneGEzV2NwSGZQV2VLTFM5NW5oaXNadC9pTlVhUU8yMktFWG4rWXV6Q1BX?=
 =?utf-8?B?UnJrbExZckZYMXYxRWYwQ0h2YXp5dmgvWFV6ZThQejlCK3dMOHgvSE1td0RI?=
 =?utf-8?Q?WxN6Diey7OQWs5juJKe7oGNmG?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QnwsbwLnHnRW6QE8vWnOXFY9hlQ3SxLXHYvKPHnvSebpkmpmblto59WPwH0YPFyjOV9pjgfJlcuD4GEOG85SOsXGBIbQ3/+RiZKz3QqQjjUtR7BrxuIdDY9xXEkU1vHawJAc9MIszPf8BNkDYsq1LaMr6M5sZ0CyONqNkVAJMhVbKvXyVeI5nXKQ759E6BiVFTVjaKLqHq/HBoKjofmpxJAM3KQxlf1kXrvUOBIBq7Kmt0LvuwmVrGZSnUGmHU0T5SrDBLq00eB+NnL003/EOvc0fYn6GAOPuJCPAba3OWlUiqzSyp8kjJiMpruZyJeWGsUY/BGFBjWiFU4KEgoLAMWqw1JbQJZbCY2w84flnx1cYcQ0NUWEr6kCPx9jLZhY8MXU9gXTqfWJTk54uMeByeajHuz0VHoMC5UEaqoSIY53UrUuGLRxGE/+g4BEhcs+EvA3JL+KBd/UjNtPA04z3EvCKdF3EMGjmTQiJopLzLmDYwb8bkavKeXHEDhzNvKKefmcZKv5r2znxSFYtovsOKRqrKXqrLYbPE+mauzTHqnpAbEQQR6ydCk7LVJL3Muz3IO9uQT3tdeHu9FwBwrOwzF8pvhiF2YyCy/HgsGeuP0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0bf9094-07d6-447a-0192-08dcc23f010f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 00:11:43.8378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d4nbiPb8/fKjAJLA8XSTxcpZ4tEtdH72jfH9b2inFdHOPZ0iPhBetn1JhNL4YalbY3qOZ61Xj6aVD2FhzegCzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6545
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 phishscore=0 suspectscore=0 mlxscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408210174
X-Proofpoint-ORIG-GUID: G-0NqWlGnhRSv3e5lf6g3MLhXriPXSyZ
X-Proofpoint-GUID: G-0NqWlGnhRSv3e5lf6g3MLhXriPXSyZ

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
though maybe dt_options_load() should still be removed from dt_impl.h.

On 8/21/24 18:47, Kris Van Hees wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   include/dtrace/dif.h         |   5 +-
>   include/dtrace/dif_defines.h |   5 +-
>   include/dtrace/ioctl.h       |  23 -----
>   libdtrace/dt_options.c       |  61 -----------
>   libdtrace/dt_probe.c         | 132 ------------------------
>   libdtrace/dt_work.c          |   5 -
>   runtest.sh                   |  61 ++---------
>   test/utils/.gitignore        |   2 -
>   test/utils/Build             |   2 +-
>   test/utils/baddof.c          | 191 -----------------------------------
>   test/utils/badioctl.c        | 129 -----------------------
>   11 files changed, 13 insertions(+), 603 deletions(-)
>   delete mode 100644 test/utils/baddof.c
>   delete mode 100644 test/utils/badioctl.c
>
> diff --git a/include/dtrace/dif.h b/include/dtrace/dif.h
> index 191aa73c..576bda2c 100644
> --- a/include/dtrace/dif.h
> +++ b/include/dtrace/dif.h
> @@ -19,10 +19,7 @@
>   /*
>    * The following definitions describe the DTrace Intermediate Format (DIF), a a
>    * RISC-like instruction set and program encoding used to represent predicates
> - * and actions that can be bound to DTrace probes.  The constants below defining
> - * the number of available registers are suggested minimums; the compiler should
> - * use DTRACEIOC_CONF to dynamically obtain the number of registers provided by
> - * the current DTrace implementation.
> + * and actions that can be bound to DTrace probes.
>    */
>   
>   /*
> diff --git a/include/dtrace/dif_defines.h b/include/dtrace/dif_defines.h
> index d88b3b2e..c8c1d961 100644
> --- a/include/dtrace/dif_defines.h
> +++ b/include/dtrace/dif_defines.h
> @@ -19,9 +19,8 @@
>    * The following definitions describe the DTrace Intermediate Format (DIF), a a
>    * RISC-like instruction set and program encoding used to represent predicates
>    * and actions that can be bound to DTrace probes.  The constants below defining
> - * the number of available registers are suggested minimums; the compiler should
> - * use DTRACEIOC_CONF to dynamically obtain the number of registers provided by
> - * the current DTrace implementation.
> + * the number of available registers are dependent on the underlying BPF
> + * implementation.
>    */
>   
>   #define DIF_VERSION_1	1
> diff --git a/include/dtrace/ioctl.h b/include/dtrace/ioctl.h
> index a2a3a93b..2273453a 100644
> --- a/include/dtrace/ioctl.h
> +++ b/include/dtrace/ioctl.h
> @@ -9,30 +9,7 @@
>   #define _DTRACE_IOCTL_H_
>   
>   #include <linux/ioctl.h>
> -#include <dtrace/arg.h>
> -#include <dtrace/conf.h>
> -#include <dtrace/dof.h>
> -#include <dtrace/enabling.h>
>   #include <dtrace/helpers.h>
> -#include <dtrace/metadesc.h>
> -#include <dtrace/stability.h>
> -#include <dtrace/status.h>
> -
> -#define DTRACEIOC		0xd4
> -#define DTRACEIOC_PROVIDER	_IOR(DTRACEIOC, 1, dtrace_providerdesc_t)
> -#define DTRACEIOC_PROBES	_IOR(DTRACEIOC, 2, dtrace_probedesc_t)
> -#define DTRACEIOC_PROBEMATCH	_IOR(DTRACEIOC, 5, dtrace_probedesc_t)
> -#define DTRACEIOC_ENABLE	_IOW(DTRACEIOC, 6, void *)
> -#define DTRACEIOC_EPROBE	_IOW(DTRACEIOC, 8, dtrace_eprobedesc_t)
> -#define DTRACEIOC_PROBEARG	_IOR(DTRACEIOC, 9, dtrace_argdesc_t)
> -#define DTRACEIOC_CONF		_IOR(DTRACEIOC, 10, dtrace_conf_t)
> -#define DTRACEIOC_STATUS	_IOR(DTRACEIOC, 11, dtrace_status_t)
> -#define DTRACEIOC_GO		_IOW(DTRACEIOC, 12, processorid_t)
> -#define DTRACEIOC_STOP		_IOW(DTRACEIOC, 13, processorid_t)
> -#define DTRACEIOC_AGGDESC	_IOR(DTRACEIOC, 15, dtrace_aggdesc_t)
> -#define DTRACEIOC_FORMAT	_IOR(DTRACEIOC, 16, dtrace_fmtdesc_t)
> -#define DTRACEIOC_DOFGET	_IOR(DTRACEIOC, 17, dof_hdr_t)
> -#define DTRACEIOC_REPLICATE	_IOR(DTRACEIOC, 18, void *)
>   
>   #define DTRACEHIOC		0xd8
>   #define DTRACEHIOC_ADD		_IOW(DTRACEHIOC, 1, dof_hdr_t)
> diff --git a/libdtrace/dt_options.c b/libdtrace/dt_options.c
> index 2f7917a0..ec53358b 100644
> --- a/libdtrace/dt_options.c
> +++ b/libdtrace/dt_options.c
> @@ -1030,67 +1030,6 @@ dt_opt_bufresize(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
>   	return 0;
>   }
>   
> -int
> -dt_options_load(dtrace_hdl_t *dtp)
> -{
> -#ifdef FIXME
> -	dof_hdr_t hdr, *dof;
> -	dof_sec_t *sec = NULL;  /* gcc -Wmaybe-uninitialized */
> -	size_t offs;
> -	int i;
> -
> -	/*
> -	 * To load the option values, we need to ask the kernel to provide its
> -	 * DOF, which we'll sift through to look for OPTDESC sections.
> -	 */
> -	memset(&hdr, 0, sizeof(dof_hdr_t));
> -	hdr.dofh_loadsz = sizeof(dof_hdr_t);
> -
> -	if (dt_ioctl(dtp, DTRACEIOC_DOFGET, &hdr) == -1)
> -		return dt_set_errno(dtp, errno);
> -
> -	if (hdr.dofh_loadsz < sizeof(dof_hdr_t))
> -		return dt_set_errno(dtp, EINVAL);
> -
> -	dof = alloca(hdr.dofh_loadsz);
> -	memset(dof, 0, sizeof(dof_hdr_t));
> -	dof->dofh_loadsz = hdr.dofh_loadsz;
> -
> -	for (i = 0; i < DTRACEOPT_MAX; i++)
> -		dtp->dt_options[i] = DTRACEOPT_UNSET;
> -
> -	if (dt_ioctl(dtp, DTRACEIOC_DOFGET, dof) == -1)
> -		return dt_set_errno(dtp, errno);
> -
> -	/* FIXME: can we get a zero-section DOF back? */
> -
> -	for (i = 0; i < dof->dofh_secnum; i++) {
> -		sec = (dof_sec_t *)(uintptr_t)((uintptr_t)dof +
> -		    dof->dofh_secoff + i * dof->dofh_secsize);
> -
> -		if (sec->dofs_type != DOF_SECT_OPTDESC)
> -			continue;
> -
> -		break;
> -	}
> -
> -	for (offs = 0; offs < sec->dofs_size; offs += sec->dofs_entsize) {
> -		dof_optdesc_t *opt = (dof_optdesc_t *)(uintptr_t)
> -		    ((uintptr_t)dof + sec->dofs_offset + offs);
> -
> -		if (opt->dofo_strtab != DOF_SECIDX_NONE)
> -			continue;
> -
> -		if (opt->dofo_option >= DTRACEOPT_MAX)
> -			continue;
> -
> -		dtp->dt_options[opt->dofo_option] = opt->dofo_value;
> -	}
> -#endif
> -
> -	return 0;
> -}
> -
>   /*ARGSUSED*/
>   static int
>   dt_opt_preallocate(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
> diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
> index 0b53121a..14ea134f 100644
> --- a/libdtrace/dt_probe.c
> +++ b/libdtrace/dt_probe.c
> @@ -186,131 +186,6 @@ dt_probe_key(const dtrace_probedesc_t *pdp, char *s)
>   	return s;
>   }
>   
> -/*
> - * If a probe was discovered from the kernel, ask dtrace(7D) for a description
> - * of each of its arguments, including native and translated types.
> - */
> -static dt_probe_t *
> -dt_probe_discover(dt_provider_t *pvp, const dtrace_probedesc_t *pdp)
> -{
> -#ifdef FIXME
> -	dtrace_hdl_t *dtp = pvp->pv_hdl;
> -	char *name = dt_probe_key(pdp, alloca(dt_probe_keylen(pdp)));
> -
> -	dt_node_t *xargs, *nargs;
> -	dt_ident_t *idp;
> -	dt_probe_t *prp;
> -
> -	dtrace_typeinfo_t dtt;
> -	int i, nc, xc;
> -
> -	int adc = _dtrace_argmax;
> -	dt_argdesc_t *adv = alloca(sizeof(dt_argdesc_t) * adc);
> -	dt_argdesc_t *adp = adv;
> -
> -	assert(strcmp(pvp->desc.dtvd_name, pdp->prv) == 0);
> -	assert(pdp->id != DTRACE_IDNONE);
> -
> -	dt_dprintf("discovering probe %s:%s id=%d\n",
> -		   pvp->desc.dtvd_name, name, pdp->id);
> -
> -	for (nc = -1, i = 0; i < adc; i++, adp++) {
> -		memset(adp, 0, sizeof(dt_argdesc_t));
> -		adp->ndx = i;
> -		adp->id = pdp->id;
> -
> -		if (dt_ioctl(dtp, DTRACEIOC_PROBEARG, adp) != 0) {
> -			dt_set_errno(dtp, errno);
> -			return NULL;
> -		}
> -
> -		if (adp->ndx == DTRACE_ARGNONE)
> -			break; /* all argument descs have been retrieved */
> -
> -		nc = MAX(nc, adp->mapping);
> -	}
> -
> -	xc = i;
> -	nc++;
> -
> -	/*
> -	 * Now that we have discovered the number of native and translated
> -	 * arguments from the argument descriptions, allocate a new probe ident
> -	 * and corresponding dt_probe_t and hash it into the provider.
> -	 */
> -	xargs = dt_probe_alloc_args(pvp, xc);
> -	nargs = dt_probe_alloc_args(pvp, nc);
> -
> -	if ((xc != 0 && xargs == NULL) || (nc != 0 && nargs == NULL))
> -		return NULL; /* dt_errno is set for us */
> -
> -	idp = dt_ident_create(name, DT_IDENT_PROBE, DT_IDFLG_ORPHAN, pdp->id,
> -			      _dtrace_defattr, 0, &dt_idops_probe, NULL,
> -			      dtp->dt_gen);
> -
> -	if (idp == NULL) {
> -		dt_set_errno(dtp, EDT_NOMEM);
> -		return NULL;
> -	}
> -
> -	prp = dt_probe_create(dtp, idp, 2, nargs, nc, xargs, xc);
> -	if (prp == NULL) {
> -		dt_ident_destroy(idp);
> -		return NULL;
> -	}
> -
> -	dt_probe_declare(pvp, prp);
> -
> -	/*
> -	 * Once our new dt_probe_t is fully constructed, iterate over the
> -	 * cached argument descriptions and assign types to prp->nargv[]
> -	 * and prp->xargv[] and assign mappings to prp->mapping[].
> -	 */
> -	for (adp = adv, i = 0; i < xc; i++, adp++) {
> -		if (dtrace_type_strcompile(dtp,
> -		    adp->native, &dtt) != 0) {
> -			dt_dprintf("failed to resolve input type %s "
> -			    "for %s:%s arg #%d: %s\n", adp->native,
> -			    pvp->desc.dtvd_name, name, i + 1,
> -			    dtrace_errmsg(dtp, dtrace_errno(dtp)));
> -
> -			dtt.dtt_object = NULL;
> -			dtt.dtt_ctfp = NULL;
> -			dtt.dtt_type = CTF_ERR;
> -		} else {
> -			dt_node_type_assign(prp->nargv[adp->mapping],
> -			    dtt.dtt_ctfp, dtt.dtt_type);
> -		}
> -
> -		if (dtt.dtt_type != CTF_ERR && (adp->xlate[0] == '\0' ||
> -		    strcmp(adp->native, adp->xlate) == 0)) {
> -			dt_node_type_propagate(prp->nargv[
> -			    adp->mapping], prp->xargv[i]);
> -		} else if (dtrace_type_strcompile(dtp,
> -		    adp->xlate, &dtt) != 0) {
> -			dt_dprintf("failed to resolve output type %s "
> -			    "for %s:%s arg #%d: %s\n", adp->xlate,
> -			    pvp->desc.dtvd_name, name, i + 1,
> -			    dtrace_errmsg(dtp, dtrace_errno(dtp)));
> -
> -			dtt.dtt_object = NULL;
> -			dtt.dtt_ctfp = NULL;
> -			dtt.dtt_type = CTF_ERR;
> -		} else {
> -			dt_node_type_assign(prp->xargv[i],
> -			    dtt.dtt_ctfp, dtt.dtt_type);
> -		}
> -
> -		prp->mapping[i] = adp->mapping;
> -		prp->argv[i] = dtt;
> -	}
> -
> -	return prp;
> -#else
> -	return NULL;
> -#endif
> -}
> -
>   /*
>    * Lookup a probe declaration based on a known provider and full or partially
>    * specified module, function, and name.  If the probe is not known to us yet,
> @@ -339,13 +214,6 @@ dt_probe_lookup2(dt_provider_t *pvp, const char *s)
>   	if ((idp = dt_idhash_lookup(pvp->pv_probes, key)) != NULL)
>   		return idp->di_data;
>   
> -	/*
> -	 * If the probe isn't known, use the probe description computed above
> -	 * to ask dtrace(7D) to find the first matching probe.
> -	 */
> -	if (dt_ioctl(dtp, DTRACEIOC_PROBEMATCH, &pd) == 0)
> -		return dt_probe_discover(pvp, &pd);
> -
>   	if (errno == ESRCH || errno == EBADF)
>   		dt_set_errno(dtp, EDT_NOPROBE);
>   	else
> diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
> index 13483301..c98bbfb9 100644
> --- a/libdtrace/dt_work.c
> +++ b/libdtrace/dt_work.c
> @@ -319,11 +319,6 @@ dtrace_go(dtrace_hdl_t *dtp, uint_t cflags)
>   	if (dt_state_get_activity(dtp) == DT_ACTIVITY_STOPPED)
>   		dt_state_set_activity(dtp, DT_ACTIVITY_DRAINING);
>   
> -#if 0
> -	if (dt_options_load(dtp) == -1)
> -		return dt_set_errno(dtp, errno);
> -#endif
> -
>   	return 0;
>   }
>   
> diff --git a/runtest.sh b/runtest.sh
> index 0fe98a99..c720a8c9 100755
> --- a/runtest.sh
> +++ b/runtest.sh
> @@ -247,7 +247,6 @@ Options:
>                             or with a timeout, but have no expected results,
>                             as the expected results.  (Only useful if
>                             --no-comparison is not specified.)
> - --[no-]baddof: Run corrupt-DOF tests.
>    --[no-]use-installed: Use an installed dtrace rather than a copy in the
>                          source tree.
>    --quiet: Only show unexpected output (FAILs and XPASSes).
> @@ -267,7 +266,6 @@ exit 0
>   CAPTURE_EXPECTED=${DTRACE_TEST_CAPTURE_EXPECTED:+t}
>   OVERWRITE_RESULTS=
>   NOEXEC=${DTRACE_TEST_NO_EXECUTE:+t}
> -NOBADDOF=${DTRACE_TEST_BADDOF:-t}
>   USE_INSTALLED=${DTRACE_TEST_USE_INSTALLED:+t}
>   VALGRIND=${DTRACE_TEST_VALGRIND:+t}
>   COMPARISON=t
> @@ -303,8 +301,6 @@ while [[ $# -gt 0 ]]; do
>           --no-comparison) COMPARISON=;;
>           --valgrind) VALGRIND=t;;
>           --no-valgrind) VALGRIND=;;
> -        --baddof) NOBADDOF=;;
> -        --no-baddof) NOBADDOF=t;;
>           --use-installed) USE_INSTALLED=t;;
>           --no-use-installed) USE_INSTALLED=;;
>           --timeout=*) TIMEOUT="$(printf -- $1 | cut -d= -f2-)";;
> @@ -641,56 +637,17 @@ done
>   
>   # Initialize test coverage.
>   
> -if [[ -n $NOBADDOF ]]; then
> -    for name in build*; do
> -        if [[ -n "$(echo $name/*.gcno)" ]]; then
> -            rm -rf $logdir/coverage
> -            mkdir -p $logdir/coverage
> -            lcov --zerocounters --directory $name --quiet
> -            lcov --capture --base-directory . --directory $name --initial \
> -                 --quiet -o $logdir/coverage/initial.lcov 2>/dev/null
> -        fi
> -    done
> -fi
> -
> -load_modules
> -
> -if [[ -z $NOBADDOF ]]; then
> -    # Run DOF-corruption tests instead.
> -
> -    test/utils/badioctl > /dev/null 2> $tmpdir/badioctl.err &
> -    declare ioctlpid=$!
> -
> -    ZAPTHESE+=($ioctlpid)
> -    for _test in $(if [[ $ONLY_TESTS ]]; then
> -                      echo $TESTS | sed 's,\.r$,\.d,g; s,\.r ,.d ,g'
> -                   else
> -                      for name in $TESTSUITES; do
> -                          find test/$name -name "*.d" | sort -u
> -                      done
> -                   fi); do
> -
> -        if ! run_with_timeout $TIMEOUT test/utils/baddof $_test > /dev/null 2> $tmpdir/baddof.err; then
> -            out "$_test: FAIL (bad DOF)"
> -        fi
> -        if [[ -s $tmpdir/baddof.err ]]; then
> -            sum "baddof stderr:"
> -            tee -a < $tmpdir/baddof.err $LOGFILE >> $SUMFILE
> -        fi
> -    done
> -
> -    if [[ "$(ps -p $ioctlpid -o ppid=)" -eq $BASHPID ]]; then
> -        kill -$TIMEOUTSIG -- $ioctlpid >/dev/null 2>&1
> -    fi
> -    if [[ -s $tmpdir/badioctl.err ]]; then
> -        sum "badioctl stderr:"
> -        tee -a < $tmpdir/badioctl.err $LOGFILE >> $SUMFILE
> +for name in build*; do
> +    if [[ -n "$(echo $name/*.gcno)" ]]; then
> +        rm -rf $logdir/coverage
> +        mkdir -p $logdir/coverage
> +        lcov --zerocounters --directory $name --quiet
> +        lcov --capture --base-directory . --directory $name --initial \
> +             --quiet -o $logdir/coverage/initial.lcov 2>/dev/null
>       fi
> -    # equivalent of unset "ZAPTHESE[-1]" on bash < 4.3
> -    unset "ZAPTHESE[$((${#ZAPTHESE[@]}-1))]"
> -    exit 0
> -fi
> +done
>   
> +load_modules
>   
>   # Export some variables so triggers and .sh scripts can get at them.
>   export _test _pid dt_flags
> diff --git a/test/utils/.gitignore b/test/utils/.gitignore
> index 7c25cb18..4d52db48 100644
> --- a/test/utils/.gitignore
> +++ b/test/utils/.gitignore
> @@ -1,6 +1,4 @@
>   # In-place built executables
> -baddof
> -badioctl
>   workload_kernel
>   workload_user
>   print-stack-layout
> diff --git a/test/utils/Build b/test/utils/Build
> index 1398822b..10f4e726 100644
> --- a/test/utils/Build
> +++ b/test/utils/Build
> @@ -3,7 +3,7 @@
>   # Licensed under the Universal Permissive License v 1.0 as shown at
>   # http://oss.oracle.com/licenses/upl.
>   
> -TEST_UTILS = baddof badioctl workload_kernel workload_user showUSDT print-stack-layout
> +TEST_UTILS = workload_kernel workload_user showUSDT print-stack-layout
>   TEST_SCRIPTS = check_result.sh clean_probes.sh cpc_get_events.sh cpc_temp_skip_bug.sh perf_count_event.sh workload_analyze_loop.sh workload_get_iterations.sh
>   
>   define test-util-template
> diff --git a/test/utils/baddof.c b/test/utils/baddof.c
> deleted file mode 100644
> index 5f844625..00000000
> --- a/test/utils/baddof.c
> +++ /dev/null
> @@ -1,191 +0,0 @@
> -/*
> - * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2020, Oracle and/or its affiliates. All rights reserved.
> - * Licensed under the Universal Permissive License v 1.0 as shown at
> - * http://oss.oracle.com/licenses/upl.
> - */
> -
> -#include <sys/types.h>
> -#include <sys/stat.h>
> -#include <sys/ioctl.h>
> -#include <stdio.h>
> -#include <stdlib.h>
> -#include <stdarg.h>
> -#include <fcntl.h>
> -#include <errno.h>
> -#include <math.h>
> -#include <string.h>
> -#include <dtrace.h>
> -
> -void
> -fatal(char *fmt, ...)
> -{
> -	va_list ap;
> -
> -	va_start(ap, fmt);
> -
> -	fprintf(stderr, "%s: ", "baddof");
> -	vfprintf(stderr, fmt, ap);
> -
> -	if (fmt[strlen(fmt) - 1] != '\n')
> -		fprintf(stderr, ": %s\n", strerror(errno));
> -
> -	exit(1);
> -}
> -
> -#define	LEAP_DISTANCE		20
> -
> -void
> -corrupt(int fd, unsigned char *buf, int len)
> -{
> -	static int ttl, valid;
> -	int bit, i;
> -	unsigned char saved;
> -	int val[LEAP_DISTANCE], pos[LEAP_DISTANCE];
> -	int new, rv;
> -
> -again:
> -	printf("valid DOF #%d\n", valid++);
> -
> -	/*
> -	 * We are going iterate through, flipping one bit and attempting
> -	 * to enable.
> -	 */
> -	for (bit = 0; bit < len * 8; bit++) {
> -		saved = buf[bit / 8];
> -		buf[bit / 8] ^= (1 << (bit % 8));
> -
> -		if ((bit % 100) == 0)
> -			printf("%d\n", bit);
> -
> -		if ((rv = ioctl(fd, DTRACEIOC_ENABLE, buf)) == -1) {
> -			/*
> -			 * That failed -- restore the bit and drive on.
> -			 */
> -			buf[bit / 8] = saved;
> -			continue;
> -		}
> -
> -		/*
> -		 * That worked -- and it may have enabled probes.  To keep
> -		 * enabled probes down to a reasonable level, we'll close
> -		 * and reopen pseudodevice if we have more than 10,000
> -		 * probes enabled.
> -		 */
> -		ttl += rv;
> -
> -		if (ttl < 10000) {
> -			buf[bit / 8] = saved;
> -			continue;
> -		}
> -
> -		printf("enabled %d probes; resetting device.\n", ttl);
> -		close(fd);
> -
> -		new = open("/dev/dtrace/dtrace", O_RDWR);
> -
> -		if (new == -1)
> -			fatal("couldn't open DTrace pseudo device");
> -
> -		if (new != fd) {
> -			dup2(new, fd);
> -			close(new);
> -		}
> -
> -		ttl = 0;
> -		buf[bit / 8] = saved;
> -	}
> -
> -	for (;;) {
> -		/*
> -		 * Now we want to get as many bits away as possible.  We flip
> -		 * bits randomly -- getting as far away as we can until we don't
> -		 * seem to be making any progress.
> -		 */
> -		for (i = 0; i < LEAP_DISTANCE; i++) {
> -			/*
> -			 * Pick a random bit and corrupt it.
> -			 */
> -			bit = lrand48() % (len * 8);
> -
> -			val[i] = buf[bit / 8];
> -			pos[i] = bit / 8;
> -			buf[bit / 8] ^= (1 << (bit % 8));
> -		}
> -
> -		/*
> -		 * Let's see if that managed to get us valid DOF...
> -		 */
> -		if ((rv = ioctl(fd, DTRACEIOC_ENABLE, buf)) > 0) {
> -			/*
> -			 * Success!  This will be our new base for valid DOF.
> -			 */
> -			ttl += rv;
> -			goto again;
> -		}
> -
> -		/*
> -		 * No luck -- we'll restore those bits and try flipping a
> -		 * different set.  Note that this must be done in reverse
> -		 * order...
> -		 */
> -		for (i = LEAP_DISTANCE - 1; i >= 0; i--)
> -			buf[pos[i]] = val[i];
> -	}
> -}
> -
> -int
> -main(int argc, char **argv)
> -{
> -	char *filename = argv[1];
> -	dtrace_hdl_t *dtp;
> -	dtrace_prog_t *pgp;
> -	int err, fd, len;
> -	FILE *fp;
> -	unsigned char *dof, *copy;
> -
> -	if (argc < 1)
> -		fatal("expected D script as argument\n");
> -
> -	if ((fp = fopen(filename, "r")) == NULL)
> -		fatal("couldn't open %s", filename);
> -
> -	/*
> -	 * First, we need to compile our provided D into DOF.
> -	 */
> -	if ((dtp = dtrace_open(DTRACE_VERSION, 0, &err)) == NULL) {
> -		fatal("cannot open dtrace library: %s\n",
> -		    dtrace_errmsg(NULL, err));
> -	}
> -
> -	pgp = dtrace_program_fcompile(dtp, fp, 0, 0, NULL);
> -	fclose(fp);
> -
> -	if (pgp == NULL) {
> -		fatal("failed to compile script %s: %s\n", filename,
> -		    dtrace_errmsg(dtp, dtrace_errno(dtp)));
> -	}
> -
> -	dof = dtrace_dof_create(dtp, pgp, 0);
> -	len = ((dof_hdr_t *)dof)->dofh_loadsz;
> -
> -	if ((copy = malloc(len)) == NULL)
> -		fatal("could not allocate copy of %d bytes", len);
> -
> -	for (;;) {
> -		memcpy(copy, dof, len);
> -		/*
> -		 * Open another instance of the dtrace device.
> -		 */
> -		fd = open("/dev/dtrace/dtrace", O_RDWR);
> -
> -		if (fd == -1)
> -			fatal("couldn't open DTrace pseudo device");
> -
> -		corrupt(fd, copy, len);
> -		close(fd);
> -	}
> -
> -	/* NOTREACHED */
> -	return 0;
> -}
> diff --git a/test/utils/badioctl.c b/test/utils/badioctl.c
> deleted file mode 100644
> index 8a5c286c..00000000
> --- a/test/utils/badioctl.c
> +++ /dev/null
> @@ -1,129 +0,0 @@
> -/*
> - * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2020, Oracle and/or its affiliates. All rights reserved.
> - * Licensed under the Universal Permissive License v 1.0 as shown at
> - * http://oss.oracle.com/licenses/upl.
> - */
> -
> -#include <sys/types.h>
> -#include <sys/stat.h>
> -#include <sys/ioctl.h>
> -#include <sys/mman.h>
> -#include <sys/wait.h>
> -#include <sys/time.h>
> -#include <stdio.h>
> -#include <stdlib.h>
> -#include <fcntl.h>
> -#include <stdarg.h>
> -#include <string.h>
> -#include <errno.h>
> -#include <unistd.h>
> -
> -#define	DTRACEIOC	(('d' << 24) | ('t' << 16) | ('r' << 8))
> -#define	DTRACEIOC_MAX	17
> -
> -void
> -fatal(char *fmt, ...)
> -{
> -	va_list ap;
> -
> -	va_start(ap, fmt);
> -
> -	fprintf(stderr, "%s: ", "badioctl");
> -	vfprintf(stderr, fmt, ap);
> -
> -	if (fmt[strlen(fmt) - 1] != '\n')
> -		fprintf(stderr, ": %s\n", strerror(errno));
> -
> -	exit(1);
> -}
> -
> -void
> -badioctl(pid_t parent)
> -{
> -	int fd = -1, random, ps = sysconf(_SC_PAGESIZE);
> -	int i = 0;
> -	caddr_t addr;
> -	struct timeval now, last = {0};
> -
> -	if ((random = open("/dev/urandom", O_RDONLY)) == -1)
> -		fatal("couldn't open /dev/urandom");
> -
> -	if ((addr = mmap(0, ps, PROT_READ | PROT_WRITE,
> -	    MAP_ANON | MAP_PRIVATE, -1, 0)) == (caddr_t)-1)
> -		fatal("mmap");
> -
> -	for (;;) {
> -		unsigned int ioc;
> -
> -		gettimeofday(&now, NULL);
> -		if (now.tv_sec > last.tv_sec) {
> -			if (kill(parent, 0) == -1 && errno == ESRCH) {
> -				/*
> -				 * Our parent died.  We will kill ourselves in
> -				 * sympathy.
> -				 */
> -				exit(0);
> -			}
> -
> -			/*
> -			 * Once a second, we'll reopen the device.
> -			 */
> -			if (fd != -1)
> -				close(fd);
> -
> -			fd = open("/dev/dtrace/dtrace", O_RDONLY);
> -
> -			if (fd == -1)
> -				fatal("couldn't open DTrace pseudo device");
> -
> -			last = now;
> -		}
> -
> -
> -		if ((i++ % 1000) == 0) {
> -			/*
> -			 * Every thousand iterations, change our random gunk.
> -			 */
> -			read(random, addr, ps);
> -		}
> -
> -		read(random, &ioc, sizeof(ioc));
> -		ioc %= DTRACEIOC_MAX;
> -		ioc++;
> -		ioctl(fd, DTRACEIOC | ioc, addr);
> -	}
> -}
> -
> -int
> -main()
> -{
> -	pid_t child, parent = getpid();
> -	int status;
> -
> -	for (;;) {
> -		if ((child = fork()) == 0)
> -			badioctl(parent);
> -
> -		while (waitpid(child, &status, WEXITED) != child)
> -			continue;
> -
> -		if (WIFEXITED(status)) {
> -			/*
> -			 * Our child exited by design -- we'll exit with
> -			 * the same status code.
> -			 */
> -			exit(WEXITSTATUS(status));
> -		}
> -
> -		/*
> -		 * Our child died on a signal.  Respawn it.
> -		 */
> -		printf("badioctl: child died on signal %d; respawning.\n",
> -		    WTERMSIG(status));
> -		fflush(stdout);
> -	}
> -
> -	/* NOTREACHED */
> -	return 0;
> -}
