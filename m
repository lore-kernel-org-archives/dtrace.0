Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D2F276049
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 12:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763469804; cv=fail; b=UxXH5gKIvcg72V+PYhfl2TCMtNmR+LqS+TAO5a3dTtiYFp0R5Q1PdZOaC2YLEJ1ofbuBV07ASDVznPysbMXT/mdJ9iTlSW7RVqDBf2uH8e3WFYHmSQDgN3MwNWNT1lUVay8FziK+oGVbA1k6CwCIlXmSVN1jvw3toy7tlcEOh4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763469804; c=relaxed/simple;
	bh=g5vDyURVhDMfTjMtHe3J6+ttZHefAWRLLqRU2K93OPs=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uoZxRSpxNUykxScPA+1oEvIOE60I8Jm1XYERrZBZH2mM+26qImKQQv/kst7Zh0lMxZ2z90y+JdusLKJwC/CWIdxPAI4aMn7NwaulwrXEm7qUN5geA9UvGms5hgJJzL4YMVsJUvOw+xZqNHI9cPv+KT0nHAucCpxFTwP/c3L0SFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dtwIikfm; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=n3H4il2C; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dtwIikfm";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="n3H4il2C"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIBRaVM007467
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 12:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=b0xSJ8AOeUk97LSDj6dA1RoZptGl5hue8UQqkv4P6ts=; b=
	dtwIikfmsLEXEYfM3llAs84OXiWDRYavmfVB6U80QYW66h+lw20rkIkMK0cQoyKb
	8llxsSITSqupTaFRKKIx0sf6ye0Vu1e02GQyVIJHmLN6nV77TiqEh4knJxy6LlWY
	CFpSOtZ20RnTnDAN83T1BRyTrU0HbwB0US2ac5TGPH0JebucNSD2R3kRbAzLUTiw
	RNopByy7WhPGhCY7XX9Kj87Vvv7aoEwM0pU6MSt/j6ky6kZntjgikkZm4ntcdWzD
	dH69pi837cFERXsruMIFfNLaOz3U1trV6kksXertT77qmyIrJj1HMU8XvEuz1K9A
	/UCMpazJyRbaw0SmGerScg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aejd1cpe2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 12:43:22 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIAtAlM007164
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 12:43:21 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013021.outbound.protection.outlook.com [40.93.201.21])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4aefy93n40-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 12:43:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ojaa5PocsTLj2m5WnjOjsPiezAaIiWYgwp8jvqDuFl0IV8Wql0PaliD9pMcEWMwlm1lbPOSIeSgPwtIyht6Tv6u/dG14F66r/unRwV69/Js8/sPLlPVJkNLiV4bLO/H9oAeqSe9QvN84Mwf/JFNAm/hUdU3MWG4znMESI4BFJFNwQ+LAZAW5A59LhM6EjwueEe8rKKh76RD9mDJwulQYhkLnO9fr51GrpU1s6rb9r+LGQ44npLtHhoQH2A2ca3E8Cz1WEnZBGu6gDkR7kDdTMUZlZPQSRXsGurpK6QAX/7w6Ch9UdMloSR5lbov/nLmbr459FEvaeiSbzG6o/2HOEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0xSJ8AOeUk97LSDj6dA1RoZptGl5hue8UQqkv4P6ts=;
 b=lWQl5JxiU9M1aCFo8j4xK0Czr+GqO3dZcIps8lMxVEi9HbBESCxqCwCa63nM+evhpVPVKmlvvW6XmKjvir5wfzQLCtYn526iw9QV0Dn3XVyybcCXYM1GIfNBJNkyJDaKbNHddOAoY2fP6Wv43rfsTfQV5AkHjpRKVCoH/j36/TzoHt24yNCDoXVBZokXyAR20jFmVSar85t/A9XInxoaV6b5Pmchm5Oe+wxBKr0trQWbDLKxHCjoNyHm5k5M6p2s9cKVfPXIFe1lXVJgMvKvPJt+8MOShuxx3T/N1xaKoySExIi6YjEqzHztCD6ztkjJZdi6gTaxngBKIYtd96USAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0xSJ8AOeUk97LSDj6dA1RoZptGl5hue8UQqkv4P6ts=;
 b=n3H4il2CvklNVi0GxJ4Ddf1FkPPm6cmLKPtjz1oUNCc8Brysewp048V3ql22pxfyr1h0LMbF+L1Hx60XWe4DI7bwHJgjYDgkOYgV20XDyWuWafrD5DhpsNwd9YJeVpkCNZOvXp5KYL3O37GjNc7I4JS5AhJ9LelGnxPEDn/GjwA=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 CH3PR10MB7863.namprd10.prod.outlook.com (2603:10b6:610:1bd::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.22; Tue, 18 Nov 2025 12:43:12 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%7]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 12:43:12 +0000
Message-ID: <ecf085d1-1ef7-4edc-8bcc-a98d3c583233@oracle.com>
Date: Tue, 18 Nov 2025 12:43:07 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] doc: Add stapsdt provider documentation
To: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20251118043036.16867-1-eugene.loh@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <20251118043036.16867-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::14) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|CH3PR10MB7863:EE_
X-MS-Office365-Filtering-Correlation-Id: b78c9281-af38-4ef4-6528-08de26a008e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K0NkNWZ1OHNsZkpNenRzYXJkQk5GM2F4UlJIbVZ0VTdiU0Z6OVpSbFFrQ1dX?=
 =?utf-8?B?MDNMeTEvYXF4ckc2RDFlWGxEaDE3VnBxRllpTDlTR21HdzBSajZZZ2R2L3Yy?=
 =?utf-8?B?U1RpWi9zM2V3Z1RING85Ym1RelZ3QnV2bll2aFQ3SWFudnQ4WWJ2K0lLUUhQ?=
 =?utf-8?B?R29JVmdhSXlCbUtYaHkyVlMvQzUwVy9xTEpTSXFGaHBEblcvMDdRNEdXTXVq?=
 =?utf-8?B?clBldUlTK3FwZ0Q3OWdEandZN0JvV1pFWGQ3MWZockNUelAzNHVlMHFLeFhx?=
 =?utf-8?B?SXNvUlJ2YTlOZU5SWm9hVUZxVGRLeXlZUDBJcXU4NWtrUEJNTzZYOUdSTHJE?=
 =?utf-8?B?QTdNNWRrMVZEKzBKZ0FLQkpSOGM3aTdjaG84Zk81TXVITUtkd3NPeGNoSlAr?=
 =?utf-8?B?NmZ6Z2h1a1BEcnJ0eTRMeVRrMFhhMXJ5ZDZMc2hUSGZtS1Rpc1dJNmh4SjFs?=
 =?utf-8?B?RlU3M3cyTlFMTkNOV2hBTUhKUFAybmlUc3plRW9GTlB6UlJuZW92TjVLbVV6?=
 =?utf-8?B?OWNPZFI1K2lCNDJORnVDTUpDV3hrV2FJTzhGcFBudWt1RnVaNVAxdEtkcGJw?=
 =?utf-8?B?TkVscmVIaVJKVUIrYVRKbHp3NzZuM08rWDdabG9uMVlSSjVUOHFwQnVjeXRI?=
 =?utf-8?B?N0Q3emJ3MGRqNVUrblF2UUx2MHpDZEFDekI1UUZ2cWJ4TTUrZlRCb3pXVkN3?=
 =?utf-8?B?U3JVWmdROE1OZlU2WW54Nk91VGFSUVZERVV4eURBa3V4WnQvbExpWTkreDZF?=
 =?utf-8?B?WVE0cGNqaGFWNGMzY003Y0hJcFJYZzN1ZXRhOE1SeFhVQzNMRjJkSkJmQUNH?=
 =?utf-8?B?T1ZLRlRQT3l0KzdBVmFYWllvQldZRHhNMHU3MDYvSjlTem9kSDcyUTc3UTdD?=
 =?utf-8?B?QnhHc0pWYjNwc0ZyeHpTZVNoeWtZclRnT3hCWkZlTHBuS1NDaTczT040Vkcv?=
 =?utf-8?B?L2VPcTNlK1psNEE5MVJBWFR5OXFCcEJaWmdOdFlQM0RmMmRObE54cmNHZmtm?=
 =?utf-8?B?ZTF0cjFJMnd1ZFdHNk0wVks1YXpWWGxQeXMwaVBieDVLZXZyZHVvUVg0QkZD?=
 =?utf-8?B?aUxxMER6dzZTZzhaeXh3QWwybm9WM2Zpcm9QaWxkNU9JQTNoaTZvR08zd0o1?=
 =?utf-8?B?RTA2aERnN2w5aXdhQ3FKTERKZnlUWDJISmlqUzJZTXdtSTVKaEdiTUk0clAr?=
 =?utf-8?B?OGo0VW5SWmFKZkg2dktNT0s2SHd0Mm82Q1ZlZG5KK0JLQjVZdU5WQ2VQM0JC?=
 =?utf-8?B?WDJNNnBORUpKOTVGdit6NElaZUptdGdrR01VVmpEL1hwZjRGNjlEdUFVNE03?=
 =?utf-8?B?YlZwOFpnSlRjbW9ScHVyTHlDK2doblh1NDM1MFd4SFh2ZE1rc2JxbzVqMlQr?=
 =?utf-8?B?WDU2OU9hVjN6RU9sWEtUbDlQa1ZmVHZlUFRXUXI1dFVQbnFqNnZwRTBhKzRG?=
 =?utf-8?B?L1Noa3ZyQk00SDdUVzNKczZOQUhyU2k1VmR1S0w3R0RtM1FSSDhDMjJaVG9r?=
 =?utf-8?B?QXJnbkpiZFpBM2V5MjRyZXFpZjE2NG41QjVBeWcvRGd5S0RZRkxkd0Q0MlJw?=
 =?utf-8?B?VmhVb3BWV0RnNmtGR0RRcHI4bkJUcDh1LzFhSDBncTkwNTZLMzZudFBEOXRp?=
 =?utf-8?B?Y1FFNGhYT0plb2VsT3BuQlVnYkE2YU1FUCs4N3hLanh5RDc2RlR4L0hORlJM?=
 =?utf-8?B?dC9CckpKVy8zR0c3b1VqK082TGhxT1JJT1FMZjVqOFdNUGpTN3NrM0tSNVJw?=
 =?utf-8?B?dmxxVUZHNzBOZmhleU9weERQM1djRjBMZHJjZ21FTU9hUm9HUGx6U1dQN3RT?=
 =?utf-8?B?WlE2NlFCWEV5c0dCRDQ5d281QTdsNzZ2dm1yTjU0TU5CSVpLWW5OZlhwc1Qv?=
 =?utf-8?B?K2ZDM3pqdzk3SFlyd2lPdkNDTVExYkFQWm53NEptRzN3ZExHMVoybWdORjZB?=
 =?utf-8?B?elFoUkg4dG5pcGw4Y3JTRU9OZUpKd2pTNUd4VjVsSHY0blpJWjhvcmMxbUxX?=
 =?utf-8?B?a0pzSDVzMnRRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVhJNFVUbFlzZml5dkNGRGNQZDZseUJXL1RzVXJkajZvbjF1ZFdLS1BRNDE4?=
 =?utf-8?B?QlRHbmYydVcxTVdKRGFzdnNIUE83UmJ1YnVaWUhKVE1zSTI5aHFYN2N3VVRV?=
 =?utf-8?B?ZnZWUjhQak1McUk2SG5GRVQ5aTlCN2xuaENJejBWUitFOGtCVlRxMm5tUFhz?=
 =?utf-8?B?UzVaVGIxRUZFMDJFaGg2OEFPVFVZQ2ZGK0VRK21kMHZiSnJXem8zTE5TeGlR?=
 =?utf-8?B?c09HVmE2SzJIVGNWM3U4SVlQQTNQYVJzUDNrc2dtSksvZmZadUlzellaU21I?=
 =?utf-8?B?Qi9qZEtEQmxRQlZ0SVl1S2h1OHdpZkZmQzFqNUJKREQ3OW5oT1B4NjluWTAy?=
 =?utf-8?B?LzJramU2WDhUN1J0L0hia25uWVlEMk9HeEs1clp1aUUxNE93NGRmeVA1QVha?=
 =?utf-8?B?WHVJZWsxMng2QzRFa210ZU5DdzYwbHlCdzhFZzBidkkrMFpUNFZSYzM3bmN3?=
 =?utf-8?B?UG00NEtHR21FTFc0bnJYRlNyYW1WdmY2WFNKb3hndWJpNjIra3lSNGM2eW4r?=
 =?utf-8?B?dGtYSXV1eWtXUmtjNTZPS2ZwOWpGekM2Y1lNbWRFU2J0T2NjTHhDd21VQkcz?=
 =?utf-8?B?WGY3dzkzL1JqU3daMWJveDFOZ3J0NTh2UlRkb1dMNVJQK0llZjQxT1V1MURV?=
 =?utf-8?B?TjFTZGNWM2JKdEhFblVqaXZRbGNBK0lCSjR6NlRmRmM5a2lXWS96cEdDOTlK?=
 =?utf-8?B?SUVJd1BJYURPdll6SnBpSW9adjRteHM5THpCM1Q1Q3J0UWN5YkFUdmxVY3Ew?=
 =?utf-8?B?bEZrOXFWa0pSVTVpQXdwV3pKOS9xNXRjUWJpMitpRUg5MmNneG1TV2M3V0Vp?=
 =?utf-8?B?Q1E5YXgvL0RoWnJKczVQNXZlMEtWVzZxT2NZV2FjNXlVRXYwdzRlY3o4Unhs?=
 =?utf-8?B?TVRURk9ob2NqYnI2d1Y2V1lmNm1ua012WmZNWVdpMlh4bjIwbUFqeVRid1Vp?=
 =?utf-8?B?dGpXeHk3YmdWdTFrUW9qOW1GNDlrcEZJMnNPeGp2S0oxU1hNZE05RkxzY004?=
 =?utf-8?B?SFZnVDc3K0NuMGZmemVTTnNZazNUN0FaMjVERHMzM2tMbXBhQWxGQ29vcitK?=
 =?utf-8?B?ZUdiaU1iVlFNd1FBNkRjZUE2T000TmpXOHN1OGRRcmFxL2tKdDRJTUlNZWhi?=
 =?utf-8?B?V1NkbitHWWE5SE83ek5mYnZoWEwwUHkrOURMazZlR3d0Qzl1UTZ3WTNwTkJh?=
 =?utf-8?B?eHdvcGNJZXU3RlpITjRCKzBtdXkwRWJyUng4cHZMVW43K1BMc1FjQWFpaThE?=
 =?utf-8?B?azhjbkdUU1RUUmpkT21TTm15TndybnpxZk1zaFh1WVUyTVpjRDlGN1NhMDFy?=
 =?utf-8?B?UHVTYUtQNURWRUk2cnVDaFlRbnhhNURqZUxmejQyL005OXJpU083VjJFWW83?=
 =?utf-8?B?d3ViSkJBQ3JXZ3grbXpwNGtyblZzNlVRRFNNRk5qeEExd3B3bFRod2hFUytz?=
 =?utf-8?B?cnBQa3hkUnpXZ21mQzNmbFhxa0hIK3cyMjJxdWpxbDVUM2RSSTJDeTRucmJE?=
 =?utf-8?B?WXBDNGlCaWFzZ05HOWlBOVBZZkhkOWYzY05vSTFyM3FRQTE0ZmRENmxpTGkx?=
 =?utf-8?B?djJreUI1WTNSQjBQRG1iUjJTNE1lOTdvUzNERFdadFdOQUVYTGVHUUNuQnFv?=
 =?utf-8?B?b2NsbTl2R2tiaGptQ3NJWjBMUnlpdUdGajh5d0hYYlpaSEdTdTFieEJxMkx6?=
 =?utf-8?B?QnVkZUFsSTA2eE9yQTZ4UjZnQTEzVnNPOWJWdEpodXVXeml6bEhzZmhpVzR6?=
 =?utf-8?B?d2NoY2xTQmNPVUFtLzVGNTVDcitBL1dZVlF3NlVYNnRvbk5kRFBLWDdqeXd5?=
 =?utf-8?B?SzBVazhjYW5yZGNpdWxBVUozQWpjZm4ySXhobVlsS0c1NW9wcVk5ZG44eWZL?=
 =?utf-8?B?YlV1c1VmaEFnazl1QU9ZQ3JnbTkwa1pUNHRndDc0amZWamlwZm1KWXNqNlpF?=
 =?utf-8?B?MWRZMFVPOWw2K1lESkQrZlJ4OHJJbGVoVThvTzNmOTdZYnBia2FqL1RReURm?=
 =?utf-8?B?R0pxT0hjNlhYOVN3Qm9TOUJibU95U09DSjJrRDFMejc0dTFrdG0xZ2todnI1?=
 =?utf-8?B?bHNlbU1mbVZoc2owYkdEZHBhK3A4eGdSTnBBNmxZNWJXWFFUZVpzSE15cFJE?=
 =?utf-8?B?SCs2T3RuakdVUGlNdVk2OUlad0xUZkgxSlpjdzVrNGhuSUs3UDgrUjFnamp1?=
 =?utf-8?B?UHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/FUWyCI5dnvNTTxSa3srtmPwVHz/nXTddKMPN333GdVH6HFBbWv4vMwfb8O4UcshhfQFBqY6dUysNP+iC8W0CbShibCYcVn0GJM4nArh77osFogubA3CHq0smaumm4Abm0DOnQJa4JmHbsP+Jy547tpK7B63X3jnv36IFFhyiO0YyGTaelMyyEC+FdW+0LcOGjkjRgVBRkzbBt8WBLOqVMq+fHOiP2akAKCOAPq+K3Z9kS+BBhvr1upnl7eXYyl8nqWdrID6PK0ubtg3reg9mdGqfSfPDn/Gacq29/Ta/Ax28TuwS/3laRGqpafB7CzVSH8uR6D66FlOVOhxGWdeSA0wWVcgTRrlAQPEMV2+7J76lw0TfspGr923ppIIOWonqSOn/laojjorGbaOa59RVk7tyXuBl2Ze7fC5Ios2nrZ3YgrZPg4TM9GCgiBYwgUwDK0dpXaAyiRtK6uNd8knYyaO2D84md4QwNy8dnA6XN+VJAyz0P7ACxB9FjER6c4Yrns3vP2bijxmUU52Q9Sp9rJCfEuFrgT10Dos7+02/qUDqNEQhpcycX6Wni3HNiGhpQKug8X2k7g61ncMJCRkb0I2KCz091MWKjQHYe07CH8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b78c9281-af38-4ef4-6528-08de26a008e4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 12:43:12.0197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3lor3DGsZkmJojYu7+IR9sQTK3+GYLnPhcRfJB53x4+BQVWbBFVwcLKdlRdrfJs4rcRejICAz8V2okgSL2eeaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7863
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511180102
X-Proofpoint-GUID: 857mh114qMMxT2j_M_bpuRDE-Ivw3qyg
X-Authority-Analysis: v=2.4 cv=Z/jh3XRA c=1 sm=1 tr=0 ts=691c69ea cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8AHkEIZyAAAA:8 a=NEAV23lmAAAA:8 a=yPCof4ZbAAAA:8 a=I5B2u4TqNEP_3vhP9b0A:9
 a=QEXdDO2ut3YA:10 a=6BMzFxCdaGUA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMSBTYWx0ZWRfX+UtlC0OQwTyl
 s0k/+/oO9DcipiVnJx4lLxFnbd3WfxjK0ypNMwPrblkCRP2m+XRW6GMQKObE482qJqr4Ang37cx
 XvZYYRM1vxeJpCRK+Ug4ybJHGUfDF1FT08uik5vY+5i/ZLmzC3BDZlSSg7Ep/URuScNtDB/n65T
 2RDfXjKM52V5/9k+K6yiUGQFL5DQtGDeMHKv/AxJwGL1fcnDr7Puj4IrlBMWhP9i7y2kDkqEAiI
 d5+WCL20plHLYhG2CSCQ1nuGLgmoI0GalKKZXRB8aREnZdZZtZM0qtISphuX3h7pXYIPhc/7eeB
 VmbXx/LipCoA4YayXtX7N06ZOgidfDcs3CKzroWEjyGWXwRh0BPiftDwgctQXqZknsIdT7h6FcK
 H5A436T6qOeQYiUR3yX2pS6SXcOg3Q==
X-Proofpoint-ORIG-GUID: 857mh114qMMxT2j_M_bpuRDE-Ivw3qyg

On 18/11/2025 04:30, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

looks great, a few small suggestions below, but

Reviewed-by: Alan Maguire <alan.maguire@oracle.com>

> ---
>  doc/userguide/index.md                        |   4 +
>  doc/userguide/reference/dtrace_providers.md   |   4 +-
>  .../reference/dtrace_providers_stapsdt.md     | 154 ++++++++++++++++++
>  3 files changed, 161 insertions(+), 1 deletion(-)
>  create mode 100644 doc/userguide/reference/dtrace_providers_stapsdt.md
> 
> diff --git a/doc/userguide/index.md b/doc/userguide/index.md
> index da9a08687..3e057d4de 100644
> --- a/doc/userguide/index.md
> +++ b/doc/userguide/index.md
> @@ -259,6 +259,10 @@
>              -   [Declaring Probes](reference/dtrace_providers_sdt.md#dt_ref_sdtdeclp_prov)
>              -   [sdt Probe Arguments](reference/dtrace_providers_sdt.md#dt_ref_sdtparg_prov)
>          -   [sdt Stability](reference/dtrace_providers_sdt.md#dt_ref_sdtstab_prov)
> +    -   [Stapsdt Provider](reference/dtrace_providers_stapsdt.md)
> +        -   [stapsdt Probes](reference/dtrace_providers_stapsdt.md#dt_ref_stapsdtprobes_prov)
> +        -   [stapsdt Examples](reference/dtrace_providers_stapsdt.md#dt_ref_stapsdtexamples_prov)
> +        -   [stapsdt Stability](reference/dtrace_providers_stapsdt.md#dt_ref_stapsdtstab_prov)
>      -   [Syscall Provider](reference/dtrace_providers_syscall.md#dt_ref_syscall_prov)
>          -   [syscall Probes](reference/dtrace_providers_syscall.md#dt_ref_syscallprobes_prov)
>          -   [syscall Probe Arguments](reference/dtrace_providers_syscall.md#dt_ref_syscallargs_prov)
> diff --git a/doc/userguide/reference/dtrace_providers.md b/doc/userguide/reference/dtrace_providers.md
> index 45623d92f..2f6aa877a 100644
> --- a/doc/userguide/reference/dtrace_providers.md
> +++ b/doc/userguide/reference/dtrace_providers.md
> @@ -29,10 +29,12 @@ The `rawtp` provider gives DTrace users access to the raw tracepoints exposed by
>  The `sched` provider makes available probes related to CPU scheduling.
>  -   **[SDT Provider](../reference/dtrace_providers_sdt.md)**  
>  The Statically Defined Tracing \(SDT\) provider \(`sdt`\) creates probes at sites that a software programmer has formally designated. Thus, the SDT provider is chiefly of interest only to developers of new providers. Most users access SDT only indirectly by using other providers.
> +-   **[Stapsdt Provider](../reference/dtrace_providers_stapsdt.md)**  
> +The `stapsdt` provider makes available probes for static instrumentation points in ELF notes of binaries.
>  -   **[Syscall Provider](../reference/dtrace_providers_syscall.md)**  
>  The `syscall` provider makes available a probe at the entry to and return from every system call in the system.
>  -   **[TCP Provider](../reference/dtrace_providers_tcp.md)**  
> -The `tcp` provider makes available probe at different phases of TCP processing.
> +The `tcp` provider makes available probes at different phases of TCP processing.
>  -   **[UDP Provider](../reference/dtrace_providers_udp.md)**  
>  The `udp` provider makes available a probe at UDP send and receive operations in the system.
>  -   **[USDT Provider](../reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md)**
> diff --git a/doc/userguide/reference/dtrace_providers_stapsdt.md b/doc/userguide/reference/dtrace_providers_stapsdt.md
> new file mode 100644
> index 000000000..43e442358
> --- /dev/null
> +++ b/doc/userguide/reference/dtrace_providers_stapsdt.md
> @@ -0,0 +1,154 @@
> +
> +# Stapsdt Provider
> +
> +The `stapsdt` provider allows DTrace to read ELF notes for binaries, using
> +`/proc/` maps associated with processes, and parse them to retrieve `uprobe`
> +addresses and argument-related information to create the associated `uprobe`.
> +That is, the provider allows DTrace to probe programs and libraries that
> +contain static probes that were added via `stapsdt` ELF notes.
> +    
> +Note that `stapsdt` probes do not dynamically register themselves with DTrace,
> +making them less powerful than DTrace-based USDT probes.
> +
> +**Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
> +
> +## stapsdt Probes <a id="dt_ref_stapsdtprobes_prov">
> +
> +You may not be interested in inserting probes into source code yourself,
> +but simply taking advantage of static probes inserted into the ELF notes
> +of binaries and libraries by other developers.  For example, probes for DTrace
> +and SystemTap were added to Python as far back as Python 3.6 provided
> +Python is built with [`--with-dtrace`](https://docs.python.org/3/howto/instrumentation.html).
> +
> +Alternatively, you can insert your own probe into application or library
> +source code as follows:
> +
> +```
> +#define _SDT_HAS_SEMAPHORES 1
> +#include <sys/sdt.h>
> +
> +unsigned short myprovider_myprobe_semaphore = 0;
> +
> +        if (myprovider_myprobe_semaphore) {
> +            STAP_PROBEn(myprovider, myprobe, ...);
> +        }
> +```
> +
> +The *semaphore* portions are only needed if you want to test at run time
> +whether the probe is enabled;  this can reduce run-time overheads for cases
> +where a probe is not enabled.

Here I would mention the value proposition is that we can then do any
extra work needed to assemble information for probe arguments, and
criticially then this work will not be done if no probes are enabled.
Otherwise there's no real value in the semaphore support. More on that
below in your example..

Maybe it is too much detail, but it might be worth mentioning that the
sempahore _counting_ is handled by the kernel on probe enable/disable,
we just need to ensure it is defined as above and DTrace will pass
semaphore details to the kernel for reference counting.

>  The `...` indicate the probe arguments;  note that
> +`STAP_PROBEn` should be replaced by `STAP_PROBE`, `STAP_PROBE1`, `STAP_PROBE2`,
> +`STAP_PROBE3`, etc., depending on how many probe arguments there are.
> +
> +The `stapsdt` provider also supports probes created dynamically via `libstapsdt`.
> +See [https://github.com/linux-usdt/libstapsdt](https://github.com/linux-usdt/libstapsdt).
> +
> +In your D scripts, the provider name must have the pid for your process
> +appended.  For the provider shown above, you might have `myprovider12345`
> +for pid 12345.  No wildcard may be used, but a symbolic value like `$target` may.
> +
> +In your D scripts, the `stapsdt` module name may be `a.out` just as one can
> +with the [`pid` provider](dtrace_providers_pid.md#dt_ref_pidprobes_prov).
> +
> +## stapsdt Examples <a id="dt_ref_stapsdtexamples_prov">
> +
> +For example, consider this sample source code, which could represent the instrumentation one
> +might place in application or library source code:
> +
> +```
> +#include <stdio.h>
> +#define _SDT_HAS_SEMAPHORES 1
> +#include <sys/sdt.h>
> +
> +unsigned short myprovider_myprobe_semaphore = 0;
> +
> +int
> +main(int argc, char **argv)
> +{
> +    STAP_PROBE3(myprovider, myprobe, argc, argv[0], 18);
> +    if (myprovider_myprobe_semaphore)
> +        printf("the probe is enabled\n");
> +    else
> +        printf("the probe is not enabled\n");
> +
> +    return 0;
> +}
> +```
> +

I found the example a bit confusing. I would have thought:

> +int
> +main(int argc, char **argv)
> +{
> +    if (myprovider_myprobe_semaphore) {
> +        printf("the probe is enabled\n");
> +	   STAP_PROBE3(myprovider, myprobe, argc, argv[0], 18);
> +    } else
> +        printf("the probe is not enabled\n");
> +

? The semaphore should always guard the probe it is related to.

Maybe to make the notion of doing extra work in the semaphore case we
could do something extra in the is-enabled clause, like concat all the
arguments into a string which we pass to the probe instead of argv[0]?

> +Assuming it is called `test.c`, compile with `gcc test.c`.
> +
> +We can then run `dtrace -l` to list the available probes,
> +assuming we specify the pid-specific provider (in this case using
> +the `$target` symbolic name):
> +
> +```
> +$ sudo /usr/sbin/dtrace -c ./a.out -lvP 'myprovider$target'
> +   ID   PROVIDER            MODULE          FUNCTION NAME
> + 5067 myprovider2623420     a.out               main myprobe
> +    [...]
> +        Argument Types
> +                args[0]: int32_t
> +                args[1]: uint64_t
> +                args[2]: int32_t
> +```
> +

Nice, I didn't realize that worked to be honest!

> +Since we list the arguments with `-v`, we get information on the argument
> +types:  the first and last arguments are 4-byte integers, while the middle argument
> +is 8 bytes (a `char *`).
> +
> +We can run the program without `dtrace` to confirm that the probe is
> +not enabled by default:
> +
> +```
> +$ ./a.out
> +the probe is not enabled
> +```
> +
> +Next, we run with `dtrace` and see that the probe *is* enabled and
> +that the probe arguments are `argc, argv[0], 18`, as indicated in
> +the `test.c` source code:
> +
> +```
> +$ sudo /usr/sbin/dtrace -c ./a.out -qn '
> +myprovider$target:::myprobe
> +{
> +    printf("%li, %s, %li\n", arg0, copyinstr(arg1), arg2);
> +}'
> +the probe is enabled
> +1, ./a.out, 18
> +```
> +
> +Adventurous readers can use `readelf` to explore the ELF notes
> +more directly:
> +
> +```
> +$ readelf --notes a.out
> +[...]
> +Displaying notes found in: .note.stapsdt
> +  Owner         Data size       Description
> +  stapsdt       0x00000045      NT_STAPSDT (SystemTap probe descriptors)
> +    Provider: myprovider
> +    Name: myprobe
> +    Location: 0x000000000040113c, Base: 0x000000000040203e, Semaphore: 0x0000000000404026
> +    Arguments: -4@-4(%rbp) 8@%rax -4@$18
> +```
> +
> +Notice that the instrumented source code includes the header file
> +`<sys/sdt.h>`.  On Oracle Linux, this file is installed
> +by the RPM package `systemtap-sdt-devel`, but the package also
> +installs `/usr/bin/dtrace`.  So be sure to have `/usr/sbin`
> +in front of `/usr/bin` in your path, or explicitly specify
> +`/usr/sbin/dtrace` whenever you want to use `dtrace`.
> +

Would be good to mention that a double underscore "__" gets converted to
a dash (-) in provider/probe names too.

This is excellent stuff, thanks for doing it!

> +## stapsdt Stability <a id="dt_ref_stapsdtstab_prov">
> +
> +The `stapsdt` provider uses DTrace's stability mechanism to describe its stabilities.
> +These values are listed in the following table.
> +
> +| Element   | Name Stability | Data Stability | Dependency Class |
> +| :---      | :---           | :---           | :---             |
> +| Provider  | Evolving       | Evolving       | ISA              |
> +| Module    | Private        | Private        | Unknown          |
> +| Function  | Private        | Private        | Unknown          |
> +| Name      | Evolving       | Evolving       | ISA              |
> +| Arguments | Private        | Private        | Unknown          |

