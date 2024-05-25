Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89ED64688
	for <dtrace@lists.linux.dev>; Sat, 25 May 2024 00:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716598781; cv=fail; b=U9sM/Vr9dgmP8ph2KQyDL1xOhR8Ax9n/bgMqodQ4VE+d9AcObA5FdqGLiIwJeF9rL2ikfqS8T07PF6ykK2uWDYU6dg8VluL83x6vTPCXizGSgRMZ0U5Ja3aMRY4+vsTddTPbgXZEBwB2Xu3kCBf1PTfcjObI0eTct8ivgNY5tKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716598781; c=relaxed/simple;
	bh=NqeXInBTfMP0ILT/7ZwwKoIqouhEdxIA4oG4K4fQopc=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LwmGLvTFT8j3FCCkFjQ3II8Tj9zPeMbGXkwhQM/FPImmKTOVQomzyI70Nh5zJNXea/uEoDku2cMQ2ckf9ZKH65g3OPzxuvTKzmxdDNAleMl8UyrPlZKwiyC1olj68blH6faUObP5wHKtdEw5w8bYNnV3uw3SM3RMwcssASQ7zb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HbGLPUtj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=T9H1IFFw; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HbGLPUtj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="T9H1IFFw"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44OFx1ur020091
	for <dtrace@lists.linux.dev>; Sat, 25 May 2024 00:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=uuZ5GvQ64ei9+SLWgsE7mQ/DVUQ32REOw1pPAKO/7N8=;
 b=HbGLPUtjh3y+RU/uk0kty4t5InBzirWLaFgV5hMSZVJEHyHYcBt+JbOAN06cUqe00/Ho
 QKEadl7BJrmALrpFw54DYG+inxHI6IhKISD+zCI87Ui9WZgufbvKp7AN4Pakp6HbFSi2
 f4n2lFIOy19gUWe5hRBq6E/F5/CB0F6FPR6PcHrzvBblxHZ9CGQupX6HIDBN/zfj+vQi
 No7fv6OIAMU4GIA1eUPuMdN3Cf0FCjqGW5AFMHPXerzX/z+wk2qmbZo4Y4R2/E3/vh2E
 XI2QMzKeyE+kJ7R1C0aV+wrPf0S8Jpx1df3xv/RN4KEGLpPgxdwNgJlInaM8TfkwqQzF eQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y6mce5pg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 25 May 2024 00:59:37 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44P029w1005021
	for <dtrace@lists.linux.dev>; Sat, 25 May 2024 00:59:36 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3y6jscyen2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 25 May 2024 00:59:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dyXRgMixoSWkU8pmJMmXRv6rg7FBOmujm2M6qLRFHm3JYjTUDGeyMWO4f4zzGjs5ejOxcjCHzZxePGyDXpa3sUBs2yaUfLomVzJwvqMVTxaxO3OK3LXxt/yLo5BT24dhthaHebCrikC50LGf4LkIO9pP/Xs6/Yi0/PiuZDagJfEU319kWUwLV0ULcuxTca5nFc4ZpXEocaayx1qzT54a3uKt758Ogq8crBytXeMO20PWEh+suijEB7ehvhcpoBxmj7ZZZFog+aHpuZBJ/RM6QAQvkMmgqbi+PwUHrS8vKH+nsiMrMEIYVfvNLG/BRcA/EO1zxb32HMNG82QoSIws6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuZ5GvQ64ei9+SLWgsE7mQ/DVUQ32REOw1pPAKO/7N8=;
 b=JPZdk8vV4FyBSxOZI8UGMRK9zHjPku/5NN2V54xRnFiYzQEt/llYNB5KHG8XTVGzg9/gaZFwSmW8o839Ojbqysz8fupsM96u3SVX43/5h7i8Arou83WZLmUq7B1hPc6YnhaqdWtcQzQQMvCyk9BRMCbBBh3PlBZt0rboRocZnxfiwCYaPTIHK7LQIEC/BlhfIFJT0jbz2Vr5Ue0F2+Jb7ao03wzGdlviDjxN7Yj7ZQ53QjzZvjAQbjXgizQfGBQ4WltusFwKGpav0w2GINFhQ14QViqt/yfti7l8wH/IKBUrHcvnycwaBZ4NTa5v+hMWWQD7yhT61IV81qEEsZsw0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuZ5GvQ64ei9+SLWgsE7mQ/DVUQ32REOw1pPAKO/7N8=;
 b=T9H1IFFwuWM4CC2btE42WZFMyrzyD5+QK5tz01SiGgKJFCBH2U6AYg6I0cSBciVnhAAo2g39roSnjlM80d9cKSdBdg7ch0HoB5saxZHKaugMxWpmsvswDlMwd7AoVveRZaiFP3IG74vOM7kbPe5v84dFsadqf1zOygrqfzZTKU0=
Received: from PH0PR10MB7028.namprd10.prod.outlook.com (2603:10b6:510:281::9)
 by PH0PR10MB6436.namprd10.prod.outlook.com (2603:10b6:510:21c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.27; Sat, 25 May
 2024 00:59:33 +0000
Received: from PH0PR10MB7028.namprd10.prod.outlook.com
 ([fe80::657:da26:8778:ad24]) by PH0PR10MB7028.namprd10.prod.outlook.com
 ([fe80::657:da26:8778:ad24%4]) with mapi id 15.20.7611.016; Sat, 25 May 2024
 00:59:33 +0000
Message-ID: <4f249618-38ef-48a8-9a7c-79f4badc704d@oracle.com>
Date: Fri, 24 May 2024 18:59:30 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] bpf: add check for -masm=normal BPFC option
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SN7PR10MB628715DC697A128358B59508C2F52@SN7PR10MB6287.namprd10.prod.outlook.com>
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <SN7PR10MB628715DC697A128358B59508C2F52@SN7PR10MB6287.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYXPR02CA0067.namprd02.prod.outlook.com
 (2603:10b6:930:cd::18) To PH0PR10MB7028.namprd10.prod.outlook.com
 (2603:10b6:510:281::9)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB7028:EE_|PH0PR10MB6436:EE_
X-MS-Office365-Filtering-Correlation-Id: 10142945-444e-455e-1aef-08dc7c55f0bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cTR2OVYyU284QVdWYUpxZ2RMcThiVEdGaEg1NHJwVVg0aFpIME1vdWMyRXZ4?=
 =?utf-8?B?REFSdUYrSDd4Q0wwTmV5d3kwcmVZRnBFSW1odE05c0VjY0dGdHUzbStRd3M0?=
 =?utf-8?B?VFdlTU5ONVROM3ltT1YrVTJHYTJ5aWFxMlVnOWlHLzR1SnI2QUU2YkExOVVD?=
 =?utf-8?B?alVGb25pRmwveFJkVnd3RHBLT0hDR0cwa1FIbFJybTlYNzV4d2I2TVJpWThD?=
 =?utf-8?B?VUpLTHQyaUtJSWp0SGt1dnZMTkJoWHh1MEpCNFpFRnU0a0daVkxqdDdkaTJz?=
 =?utf-8?B?ZDBwc0EzTFJXVnAyV0M3SG9ZVzRXYmZHUmdiZXFTRnkyby9DdDVEcTNxN1dR?=
 =?utf-8?B?THBUWVBkNVRKUFdhY3FWNHRjTTEzajgycFV2K1RudmtDZnJnaDVaVUdCbmlQ?=
 =?utf-8?B?d3BYNkVSWksrWUNvZzJtaFBoR2R5TDRmeGJ5cmlXbjQwdytrUmhLNDB1NU81?=
 =?utf-8?B?YmNNdU1JOXBVMHNsaXBuWSsyQkRKczRxU0syT1lTU0RFOVBneTZ4VHRYYThF?=
 =?utf-8?B?MWQ0bWdxMUYzK1JEbGpoNmcyV2d2anJvRDVFMnBlbXB3L2RPYWtvamo0WFF6?=
 =?utf-8?B?eHI0bzFqbGM0SC8wSXpBcGJzeWFyZGlwVEJ4bnk4ZTJhL3NrZVQxd1o5Yjkr?=
 =?utf-8?B?TE9UQkJKd0MvUTBFdjdqbWV1YXlQMnRDTXRQc1ZxVTAwOExYeU1LZFUwK0Z5?=
 =?utf-8?B?ZGFWRUhLZ3J2MWYvK29iNTQzdXB4WXJ0SUIyaEt1RUZDV09jMCtmYU9BWVZI?=
 =?utf-8?B?eEFuZXp1UXZUNVlJU0RGTk8wK1JWejdrUlUzS1REVlUrdk9uZkc3U2F5Mjdv?=
 =?utf-8?B?V2R5WVIzNUxnTThqQVdkNyt4UVBwVUM0d0xybUMwUHJhQ0d2blRwZGExbWJ2?=
 =?utf-8?B?SHJMNXI0N3kvRk9Ba0cwNWRGbFcwR2l6VitscG9raDBjSHRaMzZBQXZjVEdB?=
 =?utf-8?B?c0pMR3hoZ05KUHcvWTg1cmZCMlBuT2xtcWxSbXNTaVNMTlpMWFRka2xsVDNB?=
 =?utf-8?B?aHY5eXFKZEVZRzExRmxSVHVGNU9YY0NRV2Y3M2RNL3JSODJQa2NVcnJDUmc0?=
 =?utf-8?B?OEVEVk5pekdXd2d1bHo3Z3lNMStjbS8xS0lkUFM0U3R0M1AyK20vOHdLdXRY?=
 =?utf-8?B?TzRUd3YyYk1XcEpNUGtFOE16SFQ5Y0pNNnlHOHNEb1ovalo2Y0MyYWZyS1FE?=
 =?utf-8?B?dlNPOXEzNExabzUxMVdwdXBhbkRBWmgvWXNRcTU3UEt2ZlpaT3ZJci9jUExX?=
 =?utf-8?B?Y2hEQVVmTE9OUXhFOTVScEwycDVURTkvbldnMUJDWlk4RXNyb0hIalZOaGpl?=
 =?utf-8?B?dmxlL1VpRmhQWE9sZkNHblZxd1N6U0tVYlovVWxYL1U1QWFlVzhVSSt2ZjV6?=
 =?utf-8?B?UkE1RnJJSG1MZmcrM3VhK2oxSlA1dm9xWVQvdWJpLy92UlBVai9SSHJFTWs2?=
 =?utf-8?B?Q3RNaVg2eVlKcnhMMWpvT1hUUGN5bnR5MGI4YVBZU2VpbXVKNmhvcis5K1lz?=
 =?utf-8?B?Sy9RVkFhaytSdURoL1ZLNlRFdmtKWU85QU9KRkJqaDdXeHYzUFZtUmxMejlY?=
 =?utf-8?B?TlMwODdWaVJLTldhYURLK0FrWHVyakU0dXRVY0xRMmc3SnBSS0paSkR0U1hX?=
 =?utf-8?B?emt0VnI4c0h4UkcxelpSdnBNa0EyQ1FWaTB6OU5YWGVHL3FwaC9nSGZBL0ho?=
 =?utf-8?B?U05QMEdZRWtVYSs1cGl2RlZvT0tRb0Vad0I5eG5xWmwzTHovTnVCaTRnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB7028.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TjNCRnJiZ2xHU1VhRGtJT0ZGWnJHMURualZZZ1dXRzM2VmhiQzVlYXI3VXg0?=
 =?utf-8?B?NC8wRjNQME14ajBGSVNJaEpqRGxMRGdlQWVuY1g5YWtiTG00S2tzWHpHcnEx?=
 =?utf-8?B?ME1oV1FXbTg3TVU5aDRVN3Q4aDNhejhuUG5LS0dOZ0R2eG9IVTV5TTRyU0tK?=
 =?utf-8?B?NFlaME5XT0x5TC9SMTZaaUdDWnlybm1McGpVcWJsRWlwYW94ZlBXOStqTXlP?=
 =?utf-8?B?MVR3YXpaNnNpS1hjWStrRnprSjBCN25kTlRkdlkxZThPdDV6V3d4VlhtRzY0?=
 =?utf-8?B?SzJ4ZGNlVU93WHNKT3dYMEVmY1ZPQ3BSVFRrSDdKUnJ4SVR6WjZmRDNjc3V4?=
 =?utf-8?B?S2hrTUlhUHhaa3hMZHBwK3U1ZlJYK3VzVmtYRDdqZ3BwWTZTUDlIRmQ5R0sy?=
 =?utf-8?B?U09hS1B4MmR0L0U5S1dRZ3Z5VEMvWHpWTlRJb0N3NFNHb3hEVWZLdFJTZWJp?=
 =?utf-8?B?RFJwWkloVFlLVkNjKzN0RC9QNlVqQ2liNll0TEJIYXlBajBjeitacXY2aUVx?=
 =?utf-8?B?NFhsRFlzS1FJUmNtZkZlMUluL0dQRmlJV2NTVWZGanl6R3RYMkNFbjF4TmVO?=
 =?utf-8?B?S0V2MVFvSDV6Y1FSNXlXMDAyam44MUNHYVRXVTBBVUtVc0lRWnRWYTVEYU9W?=
 =?utf-8?B?WWJhaGRCcGg5UzRoOU56dDRsU3JwcmNJbWJlWUpnd1ZGMzhGTzJCVGIvT0Jy?=
 =?utf-8?B?ZWZoZ3VPODJBbzlNYW1lSHBBNEdOQUdxY0EwQVUyWm1WZnB3RDZqQXR3WlpI?=
 =?utf-8?B?VjdoNlQrLy9yZUZxV2JnaWN6b01ybGE4cFdWZmdCSnE1a0xyMVB0V1BPc3la?=
 =?utf-8?B?YS82QjVTenowZk1CakNLVHV5d0g1a3AyTjZWOGIxWi9ZT1piR1poOThoK0h6?=
 =?utf-8?B?dGYwcVg4R1FJM3p1elA2UFEvSVlqVkRkSVdVa2xEaTJiVmhkTXYvU1NLSlI4?=
 =?utf-8?B?ZTVmYTdZcTZXUjlHR0tkb1NISmRzdlhUbVozZkNmNVBQSVhCV3J1YUpVNW5h?=
 =?utf-8?B?eVoxcXVZcG1UeVdNeVh6THd2dDIwMklMUXBVQ1hleHZxWW9iV1BFOTMyTGJr?=
 =?utf-8?B?andLb3UzenZFeDFyZ0twanAxTHBZT282eUwrR2I2T3FhZGdtbzFaQ3Z3MU1E?=
 =?utf-8?B?MFlBQnEwS3I0K21jeElKTkNsODIyVEZENU9iWjV1RHdMSHE1NTk1Z0NRVytw?=
 =?utf-8?B?SmUwd3o5VFhsTFRhc3NLOFUzZDduTGExVWN6N0V0K1VjZU1nMHVNdnkyZ2Jh?=
 =?utf-8?B?NE1iVHJlVExoT2hSeU5JaEl6clN3MjY1aGxmRjR0WTg0cFNPbGRGYnlQYzFV?=
 =?utf-8?B?akdpZ3VhUjhGOTh4NUNNTFIrZzdIN05Wb0tMQU43ZHZZZktXaXhOR3cvQjlT?=
 =?utf-8?B?ZWx2bXRZRHA5MEFZZ1NxOU56NEtpenIwNGNUVjN1elRFOHc5VlpqL1RnSmRB?=
 =?utf-8?B?enQwWVBEL1ZkVmlYSUNjWEZaanZ3M2NtUmxzTG1nSU0rVVlhM3lod3VTZjNW?=
 =?utf-8?B?dEovd3VmdnRRMjFkTlVtR0c1UW84alhUNWIyWjVrS2Q1aUZHQjJGM3RlZjhF?=
 =?utf-8?B?cUNDVjBPd0wrRm1LSnVTNE1zeFBUU09WZkRPSk1DbHV1SEdDSzI1R0VkRWYx?=
 =?utf-8?B?T2VxaEhZMmMzNkFkaDMxSERxVlpCaWNCL2dTU1RVK2trVVV6NG5lWGM0K3Bt?=
 =?utf-8?B?WnUzVDB0OTZGb0NESnhhR2RFOVQ2aXNjWXRhaDlKekJyNm1zS1NHUE5FR0tT?=
 =?utf-8?B?anlkMEhjRXZYU1VIVjZDeVYwNmM1eFdYcjQ3b3JWT04xMWpCRXpyQ0IrNEZV?=
 =?utf-8?B?V0RHbzlCSFZzWmRhOGJNb0JId2ErZURMNTdLZUpld3B6dGUxY0lMd0FBRE1H?=
 =?utf-8?B?aHdBUUVGM2l3QWR1b2Fud0IrMCthd0p1L2I1M0xFY1VTcThmUVhjUnJKa0F3?=
 =?utf-8?B?RWd4a0JLRnJXOG1WYXZpSldHb1dMdVJ3YWpWR0tiWjhjUXpxay8yQ0t1bzFJ?=
 =?utf-8?B?OVIvSS8wZ1gzWjU0NWJUQVloRmhBWlRJYS9qUnJFQVVTQTZOL2dyRlZHT2hV?=
 =?utf-8?B?dkFYWEV4K1JsbE5OcW9PN2JLd3gvNk4ybkJlZHVnZ3JHcjF3cGdxejB3THFG?=
 =?utf-8?B?Z0M2MlZERDg4ZzRrUWdrN0ZEZGFmVEM0MDRhNk1tVVdIeHR3d1BXalphYXNC?=
 =?utf-8?B?ZGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	GiZS+NnfYGkGTRAZ0hy0MQNTYE4Pf/1zkg9+Xb/1yqQDh9RjAV8ockGY/5IrB5qEbImlnQD9/EluCucjLj4pzJ7oFj/cS26/d4NVT0DxnqNpSU8kUTnUkDeBLKzZZhCMPBIo3AOzYCXkgnEMmvFK17bbbJKDWaGIxUPgMjbeVdLWJJE2vCPk6ZRNjFwUk7AT5ZUI4NBBFp/wuo5Tlg8fM/RD1ERqvVC7tqMbXvA4lwyLfCK1HgJQ6s7Qy9Klxg6k9flQ06D6Bu+tCyCSXy6unJ1nLp/U6Nxf3YSDZDs/kt/cCqaJ1Zl57mA2hUD7JDjvf5dB7YtZ9oXQp7TKGok1TyeYdA+16bqkm4bm5JYCJ1s3n1eniAvdoJQ7htxwnjYb0CSuXexkTq+MBLkVXNgMjiQHXojAb/a59bFNkmeYPD7eMbd8kgeAaSgdPEVOyNRqxMwWyM14uXyeVXVPb8/y24GH3dK8sr23IlD3LD0NVegp7szhuxbkhWYluJfAIxnib74A4+tsSf8UvufI+jEqwW+iRNuRl2v7dMyWBHdbp/j3pT9MBff1BS9BkxtzTdDjCtCWUScpAH5gUIlfJvOzkNMpetoKfNJyL+CIaAWDbw4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10142945-444e-455e-1aef-08dc7c55f0bc
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB7028.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2024 00:59:33.4122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3o3yLav3YEucy2lIV9eG8lL9gpYQCcAQX/UYt3NR2Z34X8UNOrHWZrsGKqy4SYzV4IhDsLAZc2USr5n6dIosl1NgGO456aYm+9YWBYNwgg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB6436
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_08,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405250006
X-Proofpoint-ORIG-GUID: rIApqNyzIiFtC2FqoALUo5nTnFMO9iPN
X-Proofpoint-GUID: rIApqNyzIiFtC2FqoALUo5nTnFMO9iPN

Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>

On 5/24/24 17:57, Kris Van Hees wrote:
> Newer BPF gcc cross compilers expect assembler instructions in pseudoc
> syntax rather than normal syntax by default.  Those versions support
> the -masm=normal option, so we test for that and use that option when
> mneeded.
> 
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  GNUmakefile | 2 +-
>  Makeconfig  | 1 +
>  configure   | 1 +
>  3 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/GNUmakefile b/GNUmakefile
> index 7d1af564..360058c6 100644
> --- a/GNUmakefile
> +++ b/GNUmakefile
> @@ -124,7 +124,7 @@ PREPROCESS = $(CC) -E
>  export BPFC ?= bpf-unknown-none-gcc
>  
>  BPFCPPFLAGS += -D$(subst sparc64,__sparc,$(subst aarch64,__aarch64__,$(subst x86_64,__amd64,$(ARCH))))
> -BPFCFLAGS ?= -O2 -Wall -Wno-unknown-pragmas $(if $(HAVE_BPFV3),-mcpu=v3)
> +BPFCFLAGS ?= -O2 -Wall -Wno-unknown-pragmas $(if $(HAVE_BPFV3),-mcpu=v3) $(if $(HAVE_BPFMASM),-masm=normal)
>  export BPFLD ?= bpf-unknown-none-ld
>  
>  all::
> diff --git a/Makeconfig b/Makeconfig
> index 87a601c8..f3d47c08 100644
> --- a/Makeconfig
> +++ b/Makeconfig
> @@ -231,6 +231,7 @@ $(eval $(call check-header-rule,DIS4,disassembler(0,0,0,NULL),disasm))
>  $(eval $(call check-header-rule,INITDISINFO3,init_disassemble_info(NULL,NULL,NULL),disasm))
>  $(eval $(call check-header-rule,INITDISINFO4,init_disassemble_info(NULL,NULL,NULL,NULL),disasm))
>  $(eval $(call check-bpfc-option-rule,BPFV3,-mcpu=v3))
> +$(eval $(call check-bpfc-option-rule,BPFMASM,-masm=normal))
>  
>  help-overrides::
>  	printf "\n" >&2
> diff --git a/configure b/configure
> index 40b870f8..c423bc82 100755
> --- a/configure
> +++ b/configure
> @@ -163,6 +163,7 @@ for option in "$@"; do
>          HAVE_CLOSE_RANGE=*) write_config_var CLOSE_RANGE "$option";;
>          HAVE_GETTID=*) write_config_var GETTID "$option";;
>          HAVE_BPFV3=*) write_config_var BPFV3 "$option";;
> +        HAVE_BPFMASM=*) write_config_var BPFMASM "$option";;
>  	*) echo "Unknown option $option" >&2
>             exit 1;;
>      esac

