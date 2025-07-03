Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5752F2373
	for <dtrace@lists.linux.dev>; Thu,  3 Jul 2025 18:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751565805; cv=fail; b=rsMeRqKptjKPxsXUbEjgNBDdGOq6z8ayyX1/ZvUodXKWZuMvyvxyoDSA1ISoWkMj1kWS7u11eWnCbMsvjGqFcEn5nS+ogPuNK6eCbBNkHRmaI6dS3mEdx/9t9nLzRBuuXdFn6vXq13Ay1oGpP+Rq2r1MNGgoGJPo5E7C1C85kfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751565805; c=relaxed/simple;
	bh=p1OjYNGpDAe59NWi2gTh4X/ul9kI2gyEVv2YsNerM+4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=izlNxFlMXfHYgrI27oepkg4n3Hycj8CMCQTcX7U3hJ4Zr0Sbc5ijpZwfrjCaQle9BlrQ/DESa9Cy3mlS2evlXdB+RggBlctLLjmL+PPvSyoREQMLGhXVU2j+CpR1kZhMvscCeZLEIsHNPxKX70v6Id3iN7KOkV6OH7oWjsYKReo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PQw9EdjX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=m5PsPEvj; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PQw9EdjX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="m5PsPEvj"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563HZ3in009535
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 18:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=BCHbv06RGKVlRxocenHnN/VN01JnZDl3ngO8BubIveg=; b=
	PQw9EdjXT39j3D5GZiQ4ZogubrW0OvAx8hD0ZsIdxXqyHQYWbaIOtF6ZYydxHZku
	leBRFVMXh2SM78UxHwUuMWHqx/Z6oQiH43a/VmUEvYQ4IL7AYY2wIF4btWDrQQ5r
	OXtCgsZ9L6od4IuNwcSC1gOf/jT4oHBjuqFGobSJXCU0nnDcbwQZjxCkt/rKQkh5
	9nGxSxxjvgUUlYX5vcatxgWUGwfCkUCT+PAhZe5g0tCURANgEEufC8hdEiBfo/3S
	Yhow9TphLCz1uWzYC1pq+GwSc4LoNtGDLZY6SM1HrbCSpsDVouW2b4nMQkirAIjt
	l6qT2vLd7KWd/Ptaady0mA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j80w9fuv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 18:03:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 563H49Xx024579
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 18:03:21 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47jy1hr2c8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 18:03:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j3bno8EPrv/J6/1cHHeGd/5fTMyueui2Ocr3C7T1bWbepBi7MdqlZFO9SfWL+4kSEJirSpbnKPsfyux/9s68L9Fy+g63J0lCTRzCiiHeMAzn6ZDphDwVRb5lhjYoUxHoZoRyvDFicfClHks0DA/M4eycPWp+YYnqfMwFNd7qzlbwEZxe8j2YQqDlzeRx45bsc9Hlkf6rw3cCqfBHWgd+HphIRgI46kka4HNzlsaVUK+1rofjyVNMvA/hjb7c0Z5tMvrWA28p88Ib1n/0B2jLyXg0vcpiX5qdwEuVCFCK9h3FgebhHuxA/vPHx3H06eoslX8rArptfuE/oPVaqPauhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BCHbv06RGKVlRxocenHnN/VN01JnZDl3ngO8BubIveg=;
 b=gF9krP1K8KjMp0WRGz1jJv3XH8IMzagDEdDg2TS0/vuXmM7oU5z2TnU2MPb0BPk1EF/1+EEQ5mioJUQp+wlOF35Qht8IOyVDSKRaxARK16otn7o/LM3OIypmjgJM9hqOduLZc9zXpc+iGNlucC2yasKRJN+DD5fY25gZcHWgnkHZGghB0E/WyvKe8AHPFVAzGhkOWeuAfizgmIPoIWK5gLK9+YU7vEFUlhACUNofKMPbPDGFATasxdXULmhLzymX8EEvdlgNdgTnq+AFidUrLt404Zp7J6Wq7QDjT1i/rlukjXdbCgmuGYZO4L00iIjvTQUy1gWPfC0ncQMK9CTE7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCHbv06RGKVlRxocenHnN/VN01JnZDl3ngO8BubIveg=;
 b=m5PsPEvjrp2YsH+q8VXXtcx4jve7Bmcjs6E/JuSKED6KWAGrdhwLDwWycIk8zR5fYXWJUgiFBlm18sobzI7ozJ+Wo1nyHoV3McJUROG1gwMiecbiww8Bs0fKyp7hlWG94O2EN6/et8BAw1EVtjgha20mQyccLLynsPuZa4h/ctA=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 IA1PR10MB7516.namprd10.prod.outlook.com (2603:10b6:208:44f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 18:03:08 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%6]) with mapi id 15.20.8880.027; Thu, 3 Jul 2025
 18:03:07 +0000
Message-ID: <58cb8219-337e-42ed-ae17-1c4e77894a9c@oracle.com>
Date: Thu, 3 Jul 2025 19:02:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH] test/utils: add more reliable "get remote
 address" approach
To: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250703113345.1273604-1-alan.maguire@oracle.com>
 <e660b225-4a3c-209f-fae4-8831f6c3229c@oracle.com>
 <08bae006-f438-4134-a811-609b3fda69d1@oracle.com>
 <afbb9858-e5a7-6d76-a6c2-23b46d8660df@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <afbb9858-e5a7-6d76-a6c2-23b46d8660df@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0191.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::18) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|IA1PR10MB7516:EE_
X-MS-Office365-Filtering-Correlation-Id: b09042ca-70c2-41c0-f5e3-08ddba5bdd7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cEV0b2diSWRPa2hwYlFtZkRsc09JY1lLSWNvZXZ5WjNLbk41MU5xSWJ1aUVF?=
 =?utf-8?B?TDEvUFlLdk5pNVNrSGlGYm5BT0d4U3hXQjF0N1R1K0xiQk1UdlA0MitvM0I4?=
 =?utf-8?B?YkRkeHlnWEcwanN3b1dIU1NwN2ozRHl6RitCeUt0Zy9IMmhHYmpmdlQyc2dx?=
 =?utf-8?B?eGRVZDVEaWJETEc3aUU5L1JjT3JzbFlYdXJXUWpOOUpkQ05uaFhTVlFYTGxl?=
 =?utf-8?B?VXFhQzk1bldubjg4dy84WS9wa3BaZnZ1K2xjT2VFakRNbzZBOTJuN282Mitx?=
 =?utf-8?B?cUw5enU1Zzlkclp4cC9hdGpHN25La3hMS1UyU21yRGZLcGJtYk1HLytEYjdL?=
 =?utf-8?B?eVJyU0J3TGtzUE80VUpmOUMrcHo1ZG1ZWlFEWmZnZ29WRGw1VnNoTWxibUxw?=
 =?utf-8?B?blJjSy9DR0JKd1ptanJsY2VNZWVRUmV6dkdYOXJBRkJuV3RwcjA3RmNXeERo?=
 =?utf-8?B?TTFpMUV5Y2VTNERrWVgyeW4vSGNsNVlSWFY1QnBwZHdBNnlKZG52VVVpK2Rn?=
 =?utf-8?B?S1JUMHphZldKY0k4b3NJS0tRbXVueUU4K21VZWYyYnlsa2ZUQ2VQa2F3Rkl3?=
 =?utf-8?B?TmU0TFNDTFdWSkhKRjU0NmpiNDF3c3NlbTVPWjl3Z3RjOHlFOEpxcnZrQWh3?=
 =?utf-8?B?K2FXM0V2TGtGTGg1dnpQb04wL1ppM0lYajcwVW5CY0dtVStwMC9lbjMzMVha?=
 =?utf-8?B?cElnUWI2SDNIbDFTaXIxckNJemJKNHFTRDV3dHNmbDNBSWdJdEZvTnFIQStm?=
 =?utf-8?B?bkxrVmFTTjJOK29xTFd6d20vY3RtV29SWjgvVzJ5Vkw5T2ZQVlFUbGJDU01o?=
 =?utf-8?B?dXlwNzdrellaZ3lnaTNNRkN3Q2xOTVpJSFg5UUNOSHVoQzE4b0tvaG1xdlZO?=
 =?utf-8?B?OHhXS2x4cStiVXd0MGFGOWV2Uk5BWjIrR0JTRElla0xCTExRNmhoK29wTEVS?=
 =?utf-8?B?U0xKNm1GREpnRFF4MFdFbEp4aE9TN1lRTVVYT0F3Mk9jSjZBcldyVjNkSm9q?=
 =?utf-8?B?SHNRL2c4U3o0c3BCdFF1UzBBdjZGM0VMNkloNnUrUXF2UFpWQ0lydHpSVmF3?=
 =?utf-8?B?djlhT2NOdFU3R0g4a0xybHhoVzNPNVRjWWlyQTljSWxqK3ZvZ2hFMHA2YXhC?=
 =?utf-8?B?NWFWU2tMb0pnWGgrWldEZHBVMHNhclk5b2I1NVVlVm5PaCszVmQyQm5FU2I0?=
 =?utf-8?B?WitWcC9pbnpMN2svcFRuU090K0ovMkJnUHRLT01SMkJ4NHdEaUM0SjIydytE?=
 =?utf-8?B?V3BzOVRscjk4enhRZExPekx1OW9CRVd6WVJGZU0yR1k1MEd0RVdjN1dFVEx0?=
 =?utf-8?B?ZnF3dmNGZEhNTXhCRGtSSUtRZkRrL0lCY3JrQkxBWjFVYlhyYldNQ2M3dDFx?=
 =?utf-8?B?WHF0WXNJYXlVMmF4c0xhQ2hteUEzYjR1OXp5YUhLRW40VjY0Zno0bk1BeE92?=
 =?utf-8?B?SkxBSnVtT2hwNEszeE52MDRxS2N2RThYQy9OVytuYUdicDJuUzdlK1pweU9E?=
 =?utf-8?B?Q0l0Vi83VW5oajVUaHRtbmNSaFJSeTNuWEw4UVorZUdOc3R5R3RsVndzampH?=
 =?utf-8?B?N2lZdmdUSEJwMnIrWEZyd2ttYW90SGV6QitnaU5WdWR1RmIwek54aURWd01G?=
 =?utf-8?B?bkhmSk9ndUhYdFlTQ2puSDNUNjBpWTB0eVlOdmhmY1JWSXNSOG16Y2xqL3JO?=
 =?utf-8?B?cXVoU29scWtvd05EVkpJY0IxaTVJbFlJS0N1SXVOUSt6L1dvZndtZWQ2T21D?=
 =?utf-8?B?MThYRCt5WGJpZ0RNcUV1bkFHTStib2EwUjZCcDEzeDQ1OG45UU1BVlMxZXRs?=
 =?utf-8?B?RTQ4QlhWaU4vb2FodE9pc1QySU1zUGtNMlBxYXoxRlJycnprK2hCdXM5U3Np?=
 =?utf-8?B?bnFoUyttSUMySjZYaUVtRXJOeEQyU1FrdnFIcWhmRDltT1hWT2dUeitORDFl?=
 =?utf-8?Q?WnVP3xAurpk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1d0YmVzUjZJTGs3cWlXbDNBcUNTUFBnYmNHWElISmxtdDJnVlppbHQybXVP?=
 =?utf-8?B?MGJ1Tk1KN21iOTVlZ29BMENNWktGSTZibHo5ZXZLRXhWaWZUU1lVVlI0OVFO?=
 =?utf-8?B?dzJ0VW1tQmo5NHB6QnRUaklGUVErR2NsT05BVUIybDU5dXJ0NlVxSE9ad3h0?=
 =?utf-8?B?N21zTHRGSUNHeURMQ0ZWRzZyZnpkSTZTb1F2QlNqejZWOXJHZnJPS2dodnA5?=
 =?utf-8?B?K3A1ck4vUCs3b3NWMW4raUNDUFQ4bGRwekxjVkVRb1FkYTB3b2hCQnNWL1Fn?=
 =?utf-8?B?SGhOYVcwMTRaWUF6amdaQ1M2RUR4eXBXckVyb3NtMlczMmlFdUkza2w1ZXVs?=
 =?utf-8?B?alJzU09KK0k5N0JDZ1YxNFU4QUhGUVBjeDlFWU5rTlJGNUlEWWdxV2lNeXFQ?=
 =?utf-8?B?UFdBUlUwejBFRjZwRE9KN1V3S3lHUklyRHM0bWIxelhHakduRFJGY25MVndE?=
 =?utf-8?B?V3IvRnJvL05wT3JJRHZPZnVnZHpCdld3MEpQaWpTdTVMbDRTaHlXT0h5YTk1?=
 =?utf-8?B?YndGY0c3L3N2QkFMOXZSdGI3RWxaU2lRejZZVmlOOUEyRmlSc1p6WFZ0NnB4?=
 =?utf-8?B?ZTZDbjExLzRUcjIySkxIQ0tZMk5LQnUybU0zRlRFR2JLWVVpSFY5RjU3cmxx?=
 =?utf-8?B?bHlEckFMRTRNNmQwWTJHenY0N3J4QnllMFVKZ3dFVTRLNTVwSFZPV2loWktn?=
 =?utf-8?B?ZU8yWVMrMDY1M3FrdDJDRlMzbWxZTlJJL1l6MWRuUEJFTFR0c0FwNW1uOXhv?=
 =?utf-8?B?Nm5qTU1JbHJ5STNpR3BySDJjRGhySW5ObzNVQU1RZzV5TUw4SGZ5cHd5bUVh?=
 =?utf-8?B?ejZOUEIyL2t3czY1R0djZHBZUVJDeXE0ZjR5SWVrZTk1NmFwZk53Y3d0U1FJ?=
 =?utf-8?B?dmJZSkRzQjUrWHlXMC9JN1BiOGtyL1lkM1lSNkdydGliR2p6WmxFOVNCMk9M?=
 =?utf-8?B?YUllUldaQzdmL090cTE1b3BBYVNndU03cjJWdEtSSm5PaElNVzJIbGRuNmFL?=
 =?utf-8?B?clYvRGsyUmdwQml1MjVDTlpONDJUY3BhZkwyeVpZZEJGZHI0WmJTQlB1Sjhh?=
 =?utf-8?B?OHdZb0d6SnV3L0lwY3hINGZZYXdKZzNZdHY3WTJRMStHdkhpa2N4ejhJMGov?=
 =?utf-8?B?QVdZUnVTRzgrQUNDOEkxSFAvMzJ5V2JIZXl6UTRyZDJMczF0TkRnZEkvZXlp?=
 =?utf-8?B?UmhhNS9CWWFQMWkvdUhFUWFxNURBc1AvZUpPQXlIQkNDem0rS1k1OGZKTnhL?=
 =?utf-8?B?QXdLOG5DSW5VSWc5U3FHZC9xVGJZSmJGakNPYkM1bmVOVTZhUkdPbm4vZ1VT?=
 =?utf-8?B?TVBSUFA2TmFLK09iMEVyODZMSzMzNmI2emFIaFNXdnZ6Rk9mY2dUSXVkU0F0?=
 =?utf-8?B?S0FrNWJMUlhEbkhrcDhObTVxakVRdmljYjhmLzZhYlpmYm9NU1NKL3FrNFg1?=
 =?utf-8?B?cDNSc1NXMGNLS0Vuc21MUFFDVXY5VjJjZk1sSmdKMUJBT01FL1RLUWJwWTZ2?=
 =?utf-8?B?aXIzdkxkd2JURFZBK2ZjcEJ2NGVhQkdsUTBNQzJvbE1OZWVSYlMxRWdsY0ln?=
 =?utf-8?B?MGJyT0lVWFN5MDZlQXJnc2lRWmhoUTR3R0lvRjMvU1c0c05hVG5DVTJOQzBM?=
 =?utf-8?B?akxLSThhZ2F2WE9UQU91enp0N2hVU01lUittbnFNMzZJUDU2VnpvcTJVMWNu?=
 =?utf-8?B?eDR5RnZzSUcwZmthODJmcWRSZUkwUFpyY1VkMXI0VE1UelZsbndUcXJOS04x?=
 =?utf-8?B?aXBPYWhETkVtV041TUpZYnI2R1FSeVNWTXlVWmQ0cWZsQ09HMWFzTGNRdGlR?=
 =?utf-8?B?eHZFdi9OMm1GU0ErTFdvWGtqNFlHWEFzclBFTWdPSXN0N2UreTF0VURUSnJr?=
 =?utf-8?B?dHEzOHhIYTNjVzBHdXdGRkJETU9jTFBzV0lsTXpHZ2lNVDJ0WVZHQ2UwMlBr?=
 =?utf-8?B?K1pvUUtITEprZ3ZrZTU0T3QwZmtHM0lVQlF0bysvNHpkSEowcEE5WEdja2Vx?=
 =?utf-8?B?UmNJeTJtUXhUSlp3ZW10MlJNR3FiN2MwVFdBU2E2b0M2NldnNnhUQmpYZWF1?=
 =?utf-8?B?bWwwSGM0RnhEQzE3dWZFVGpWUkNnQVdvNWxDTTd1Z1craERvUUsyUkV6bFpK?=
 =?utf-8?B?aEUzUitWZHlJaVhsU1VpQ0tYM21NODQ5MjMyQTdWU3lWWG55cEtaS0lhWnBl?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HILdEBrU52Mitkat3+RuXIdUCup37wjYjBhgFF4C33AzVQD6zL7nEvGefOn9/ujMA1cuDBePldUMkk1N2ujZZRfbijzFETRzMDfeHgvqTpPrYWevic7nxG6BbGB/hFBo8nBIDOQeCWBgJ6aKlTvTljHqOzz0C3LteAvwD5JtfKAXjLBHiU1RmA+e5jFzXiVzBDnnLBZAWDSpvt1Kzck4aTaC1K/j0VSoobV6OWiNj3/6Wxmv9CMwF1Da0hHWka2S7Uf59Typku2/Y6DLnHiidkFNtQBe7fO8kWCMt3rbmR4ZlwaiIAdx+xrPwB1Ps7etFALWqllwHWZEkKbQDwP6pSM++FY2T/1HLERb/WYP5ieXWedZa+WxlQOflplwOAxnew+MoDG/V/LDz7gG+uuAJAPnTb2OVJYnTq50nchn35iwyU9svXI0DEu7ngtkZYEjpHRmCH2nZZJJLdRYF08vP5bmPg+5dV6NbCKKu5eimlBn2g1yg2EeCen2+c00O+FmwVfZNs3mqkcm3IoaMz+q5+lknOJwh7nC+Qkc1rjRMjDhSqn6c7dPqDdBEnhJQq4MbVo/mk+I+6GxKqmYks/o9NIFv7q4W2EQS579vLhDK0Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b09042ca-70c2-41c0-f5e3-08ddba5bdd7b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 18:03:07.8110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pk7QVZIlZcy1R2r1MdCbFn/JYQQsTU2JHFC/Wikdevw99GHaklX4pNTy0+GkCV2ErOq4wDf5xoVXCjLoeTIBeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7516
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507030150
X-Proofpoint-GUID: SiUQUDRZJ-a7mPCIe9GVmv5kPLjr7uEK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE1MCBTYWx0ZWRfX5vMOv4Zd1htb zaehx2rkWKA12YbuyhDyEWX1/GmvWhxEEQw/t4YMrFpF9iLtNlJFOycnh77BF8kJQMx9v50s0dE bRV7xtqIW/atyhRsZM/vaj4KYaKxQYrrGelB9SDhPhPyU70mwVA3TsFdOHrl7CSjtPwapcpWV8M
 /Y3UP/EJpHrqjjqNE/6/Fro6eueXN5fDX5Jrabc6oxIgj1D4BkTyfN0DxGX6aALm8SFgoKlyLZs UM86fm0v2Nh47OaTIG2/aYRP6uQxcI2WhVnMK7wipivgw8Xc/4+R0NHAYnTSfIozw6OKHZmVVw9 ocfYyPOSXN0VHagIneeKpdPaHOY0oNv64NVHIID9ZDMxFUC0N130iCKW9pe6a+GgVFtP2Tow/ZY
 ijgunk4akR2lXYg360uYBzpStvG3+dZs79NVY/Tc4xshQpj1uW6hAD8YRG/PhMb8/ZcfcPpy
X-Authority-Analysis: v=2.4 cv=D6hHKuRj c=1 sm=1 tr=0 ts=6866c5e9 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=GUHONXFd1dfOWa916QUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12058
X-Proofpoint-ORIG-GUID: SiUQUDRZJ-a7mPCIe9GVmv5kPLjr7uEK

On 03/07/2025 18:06, Eugene Loh wrote:
> On 7/3/25 12:59, Alan Maguire wrote:
> 
>> On 03/07/2025 17:43, Eugene Loh wrote:
>>
>>> I tested and it looks good (modulo the OL8 UEK6 issue mentioned in the
>>> patch 3/4 feedback).
>>>
>> Sorry I couldn't find that issue; is this the 5.15 problem with the ip
>> send probes?
> 
>     dtrace: failed to compile script /dev/stdin:
>     ".../build/dlibs/5.2/tcp.d", line 177: failed to resolve type of
> inet_ntoa arg#1 (ipaddr_t *):
>     Unknown type name
>

Ah, sorry yep I have a fix for that one in the next round. Basically we
need to add it to the core set of typedefs and add a type for a pointer
to ipaddr_t; we can't rely on the #pragma to include net.d unfortunately.

>>> On 7/3/25 07:33, Alan Maguire via DTrace-devel wrote:
>>>
>>>> The current approach of looking for remote addresses
>>>> is brittle and fails in many environments; it checks the
>>>> default route gateway and looks for open ports in the TCP
>>>> case.
>>>>
>>>> We can however achieve the same goal reliably by creating
>>>> a network namespace on the system and configuring either
>>>> IPv4 or IPv6 addresses on the namespaced and local veth
>>>> interfaces that support communication between namespaces.
>>>> If a tcp port is required start sshd to listen on that port.
>>> Maybe a comma after "required"?
>>>
>> yep, will fix.
>>
>>>> Teardown is managed in runtest.sh as signal handling for
>>>> timeouts within the test scripts is not working; a trap
>>>> function does not trigger for TERM.
>>> I'm having trouble parsing the text before the semicolon.  I think I
>>> understand it, but cannot seem to figure out the grammar.
>> I'll try and rephrase; basically I tried adding a
>>
>> trap cleanup TERM
>>
>> to the test script to catch a SIGTERM when the test timed out;
>> unfortunately this didn't trigger when tests timed out so we were left
>> with network namespaces hanging around.
>>
>> How about
>>
>> Teardown of network namespaces is managed in the toplevel runtest.sh to
>> ensure that network namespaces are removed after test completion for all
>> cases; success, failure and timeout.
> 
> Great.  Or how about a colon instead of semicolon?

Sure!
