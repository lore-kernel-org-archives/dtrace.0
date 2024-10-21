Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3475E1E0DDA
	for <dtrace@lists.linux.dev>; Mon, 21 Oct 2024 09:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729501818; cv=fail; b=dHAd8FJqsjSb6/LhDE2ASeiCF+fhrf/rOE8IkUFU6puA4PPQHfPJ13NZ+lT7Pnoq+C9Rw9JDy9rYrqSzJo5069lqR5rjv4ae4O3Rgn9i49jvFiVsM5q+K4QqT0fh8n1h/EYYWyUzRCKcw3oLVE9SUKNrJMqQnjM7i9ZpXFcZoAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729501818; c=relaxed/simple;
	bh=xu4aLYoLc/6i6zP5S2fEp9V+dtd4IPsaW4ol6xW5lw8=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NNgOsMc3fsImPO1YAK+SQdD2c4neU1Fxz+5ixagIx3yWs0hYD8kudomfsLppCgJNo8kZpfdcb7Fvs7CyrcqiEVIei9QfoJbI4DUMVqZCMP4O49LnBpBXoTx/3i+tTMUMKLz7mWjTYJgV/j4WQ1+DQZqpiU8pJzXg2Yjfd0xrdr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MWYNVSVh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qnVi976n; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MWYNVSVh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qnVi976n"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49L96bOc005282
	for <dtrace@lists.linux.dev>; Mon, 21 Oct 2024 09:10:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=rcKpZLN2v8z2NorJQaF6B6yJC6KjCuPV63GXl6udDf4=; b=
	MWYNVSVhqC4lv5arBDOM9+o2l5Q7owsr8wfoqGBkehhZXV89Vfain+1xLyDL7g0l
	N4Frq7BkSLuc9sfZCzyF9Y21bk23mh0W/fkigTm7DNZQ/kzlUaodz5OZT/wmF05w
	ZOqv5s+TijULFYN3Bvlg/XE0L248jTiud4gh4L24nPZqmZxg6sIlM+ynON1OVZeg
	tR1KLGzkgsaTNNvXAEZAS1KKpc/HQFAEuuArv0e1lXhC55YrNX+c32Rv4sDN9Y6u
	YapRoMRarlfaJyn0+GFPqES9sZTPkRpj9uCCcWlahVmIh7YxAdrEfZw3AIKeIlPs
	dd+cHZgteiJg8XEnllGXvg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42ckkqsxnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Oct 2024 09:10:14 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49L724f4035193
	for <dtrace@lists.linux.dev>; Mon, 21 Oct 2024 09:10:13 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42c376tm4n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Oct 2024 09:10:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQ4y87ieIYjy1/jalw4/wMee2O6p68Pr5X9jEPo5c2UfVFa8DlUIiH8gwyZJlX5sEJn6rPG0cTosbRAQwEWUTxD3bzpYn2eAfN405drZBLNCpqMWHuU2x/nVas8meOFCg3cNmA4iEGSxsygcZfs8+vI/WkAcDlZqhLRm/9KndNFbO4AWRy79qPfZJ1Sa1ZjWtxgQkIgv4Ew9iECYBMImkxrm/PNVl91+rP2XHuKZUVOh78ZJBjA9hEEr3HDdqtGfH+rMH1ivJM8BuFn9AgajyGCMHDkYVjPheCaCucdONDfwjJ+TV1r6fJaUnxH/YTMyZKXXDznIxLJSWIhIYABbOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcKpZLN2v8z2NorJQaF6B6yJC6KjCuPV63GXl6udDf4=;
 b=cd4o5ChML4OKBoPe7ybJRISZU7+5P2p6nYpUqLpCCyEan4nT/OGrD78N4ts3xrdY/iLMRhpOnHVZq2DRslhXpRr3oPflKbQHfkM7QfIucQ4KyI3cLLfFIc7LJwgqDn8h/S4FmxVd9oL/zh+ol+hBrQ9Rw15yT5Y1FqbaM8AGm+ZevXZmiDxvhsdcFCX/5fXRh8x2Fq1gKaSFm2CI6a09BSxJH+SP3NYEGET8m+vEP1I3D12rDuRXjzcxDM60EctGlyTrb6mtB2CxuKyr6xGcb/Fso6d6lEEyaE6bccyVa3JH0Kj9uw9STZWba1CibZPR3399SV6DzVyj+fire0DSPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcKpZLN2v8z2NorJQaF6B6yJC6KjCuPV63GXl6udDf4=;
 b=qnVi976n+BBFchl98pAsBF+/MzUYLebqhGD81jvQIwYnDtWSF7pcB7KtJY0vbgqJICDwRZGCOgJXqv/XSVCuizPtUoHQBeMnDzOJkv5PVHcYWzld0ud/CU0G+Kk4qUZinLuyyFLUKItZJ7xdCEGcR209gWa3YQxl3wQPRbaXpdI=
Received: from BLAPR10MB5267.namprd10.prod.outlook.com (2603:10b6:208:30e::22)
 by MW4PR10MB6630.namprd10.prod.outlook.com (2603:10b6:303:22f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Mon, 21 Oct
 2024 09:10:10 +0000
Received: from BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f]) by BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f%7]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 09:10:08 +0000
Message-ID: <f667800b-54d2-4661-963c-4eb9b4bc0cd4@oracle.com>
Date: Mon, 21 Oct 2024 10:10:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] error: add missing EDT_PRINT entry
To: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <20241018195808.270688-1-nick.alcock@oracle.com>
 <20241018195808.270688-2-nick.alcock@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <20241018195808.270688-2-nick.alcock@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0033.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::6) To BLAPR10MB5267.namprd10.prod.outlook.com
 (2603:10b6:208:30e::22)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5267:EE_|MW4PR10MB6630:EE_
X-MS-Office365-Filtering-Correlation-Id: ec874d27-325d-4f31-afb0-08dcf1b02901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWF3c2E0dGkvSm14N2s1b0lQaFdadTBnUjB4Z0RnbE5nOUJsWkhmM2FYVmpz?=
 =?utf-8?B?MUJ4Z2h2QiszMTNGeVUvKzI0b0pIbFZWcjVwQVhpRENPVk84V0h3RGJ3ZzFs?=
 =?utf-8?B?UmZDTGtuV0NFVUt6eEp6K1g1MXQzb3dodzc2d1dxRGdqMnE1M3MwRnlHcmtL?=
 =?utf-8?B?VGhoT2dDZEdhQ0VyM3BsL1pjSlVpN2RKdlVoL2NZOXF5b2ZuOUx3VitVQUtn?=
 =?utf-8?B?WEhjQWFKSnpuV3JmcjI5RDk2bUhEQnJNMjRhd0lvajQ0SG5iTzI3Q3N2bnZW?=
 =?utf-8?B?V3pLWU0xQlkxZTUzRS9XLytlYlBnTDdpMTZjd1crMGdjeWRRdi9jTGQ0SEZB?=
 =?utf-8?B?Q05HZ1FKeG90d3MxSHlmbjl1Yk84d0VkSVhrSTR0Mks1Nmg3WjFvQnhiZXJ0?=
 =?utf-8?B?S3VOdzVpdzlYSDJOam8wRkNpZTYzNlU5Z3lSbWpnVGk5ME84SjhtUUxYeHd2?=
 =?utf-8?B?TUE4QTRmYVY2SlhTTE4rYmZrMUdJZG80bDE2VUtGU0FLL21oSXRRNzQ1dDdp?=
 =?utf-8?B?VmI5Z0xzcWFIcjNsL01WMWhJem5mZ3ZXL2RvMkpzUU14ck5YTGwxcngrYWpQ?=
 =?utf-8?B?a2wyTHpiMi9Oa0xzc2t4anU0bTFnQlVUcWxqbGsxTHp5U1M2bmt5bEV5d0Yz?=
 =?utf-8?B?a2pGaVI3T3RnY2x3MXpxLzJzU1BselJnb0d1YXREQzRHMjl4MENJNGV1L1o3?=
 =?utf-8?B?cnhxRTJRUWhCK1RoT1F2SzV2NWpGT0JrVSs5dUU3TUgvWjhKSEdScTRldnIv?=
 =?utf-8?B?UzVtWXJoNDQ2ZTUxRGRyd1ZiYzg0ZmdrdDBSdUsxMUUwbWljTGdMaU00YkhR?=
 =?utf-8?B?WGRSMXN2cm9kdVRRQi9nWHhPVm5xNlRUVmZoN3VKdzhRSFhsQXJ2RmZMOTJu?=
 =?utf-8?B?dHdQd2NiQnhOYXRCaW40UEhXTGlvaEY2Sy9iUVhQRnIyUjBlMlJMQlR5akNo?=
 =?utf-8?B?TW1TUXQ2SXNMMkdvL3R3VWJMMDNURnJTZVAxb2FQQkZWQ3RuOWJRbFdPbVJC?=
 =?utf-8?B?azZuTmR6enFHRDV1Q2p6UXhXRUlZSWJpOEJ0WitnUUc2bkFVejRTN0h3Q2RQ?=
 =?utf-8?B?WkpEb1RnZGxSbnhFZGtvMWpzTDlUMXhCNm9BbmRjVW10Y1VlbU9HM1l3Q0Uy?=
 =?utf-8?B?SThpT3Bhd20vVStTREp1NUJ1U3dGYjNsUDhzK3FpNlNGZjhTU3Baa0JPL1Er?=
 =?utf-8?B?MldJd2dKeGVYV0JHNm5yOVdqa0Y1eTF5enM0dEhGN09YYzZ6M0ptTkxvNHA5?=
 =?utf-8?B?RDh6T29nbXRHREZCS1FjdmRZd1Q2Y0JndTZzTTdieXIwWWhqb2UxT0NtbW9s?=
 =?utf-8?B?WGxTT2w5NE9DblFVdUU0QS9ORGh2cGlIOXByV1Y4UGxtMzU3d3lwQmZyd245?=
 =?utf-8?B?U1c0YldjVEptSWVhOU8xVTFVeUx0SUp3eFE0ek1lc1FFTXVTTkljL0lUei8y?=
 =?utf-8?B?dCs0VG81SUNCeFF1ZHZkVHZ0eGp1QWZRc0FMTko1cnRac2RIVXFWazdLYW1t?=
 =?utf-8?B?blRZdm9kZHh5RGh3aHFLYkpNbXBnMjVld3h1cVpWeVRNbk1UTkhTeWYxSCtC?=
 =?utf-8?B?ZzBtV2phQ3poVkhOaVc4a29EclpzdjZZcWFOU0xuRmpWMXdPQlhYZkFZZkUw?=
 =?utf-8?B?bXR1dWRWY1B5R2p3WXlEQkRoSEdrbHJTblhMcVd5ajVMTnA1VmRnaHhHR0hn?=
 =?utf-8?B?Z29QcEVKSklDZ3ExVkprZUZPV3R0cTA0cmwwaU1EZTRsNDZ6b1BqTjZtR2NW?=
 =?utf-8?Q?kFchEDPmBrh6oSGRd5MEmOn8d30YI3HbcYKyEKo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5267.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmJwZGd3c1orNjZTeG54Mkh2QytrcUJrUTV6OXdWUVRUVEFIOE5ZMk8yRFNQ?=
 =?utf-8?B?MkN6Wlo5L3NKT2dMU2E5WEE5Tk1NdE43Ykp6VjRjRWMwSjQyQnNNcW9nTWcw?=
 =?utf-8?B?T2E3L0hjNXc5SGNUbHNSZTV4b3duRXRSNHdUaGJZODExZFpjQXVPYjVZbFhv?=
 =?utf-8?B?NVIrbHJqaGN5T01YNkQraTFhUlhoaUR5RTdmdzc1eVQ3ZHRVU05aWllHTVdz?=
 =?utf-8?B?Qzk0WDg2MXZCd3pkSkg0MG42amZVSEZhK3AwVnlvQndlMHEzVDVraTVZSXNw?=
 =?utf-8?B?MmY0YWtONDB4MXh0d0VxMEc5M25JaldyWnNRMTBTOEc5ck5EVE5oRjFLRkJK?=
 =?utf-8?B?bDRVMkNBT3A0aGhOS2huSExSZjN0eFBxd0VGQk9nRDYxODY5QmU0c0ltbktq?=
 =?utf-8?B?b3pMTWJzUkRsdFpvM1BXQlRTY05EdmtIS0hrSGM1WlJaTGlXck9URThsYWlv?=
 =?utf-8?B?SXREYUxCaEtGai9LNERvY2U2ZUxNdUNGUkpuMGdHcTlkSi9zajVPV0RHR25M?=
 =?utf-8?B?M0R3N0ZWNUlITmpQeFU3THBjZER2QlRhazRQMjVCcHBpQk1nTWhSWlhrdlBZ?=
 =?utf-8?B?SG02Y3k4TVFCZ2I0U3hXYmM2RU5LcTAxUm1wUXdXc2RNNGt0c3JtbkVnQytH?=
 =?utf-8?B?NVM1emsxd2tjRUVYV0JKL2lhbkFvNkdsaGg2WW1OWGhXcVYxa0JuNmFNQmtO?=
 =?utf-8?B?V0gzNGc4enZFSWMrQzVYTjUzcW1rYm04U2VqSThUNFpMaFdHNTExT2VtcERI?=
 =?utf-8?B?ZVZpOWhxRk1SSE1tVTZJRzF1YWlqdVphSTNrYm5RQklJMXhEOUJxN0Urc0tV?=
 =?utf-8?B?OFdrYWY1R0hkanpRTEhiS3Q5Tkg0Mndua012SEtReWw3QnZVLzdsZFY3Ym8z?=
 =?utf-8?B?UWlsd3djSzhzUXViMXhRWTduNXIzWW84QkhPeEMrZzlyQ3hLNDlHbEdsZU0y?=
 =?utf-8?B?SnlWbE9jUExyVzFEbU1XV3ZqdXhBTW9KckNCbUE0NkYzS2pOczhwendueUtv?=
 =?utf-8?B?TTZFSUZsTHNvaG1sdWd5MVRxOHRCYkdWN3RCTHB4OUVqTnI3eVVremNCUEJy?=
 =?utf-8?B?ajNPa0JQMmlaUngyWmUwQmM1Wm9DOTVBVE5DbHJ5c3FxUUhzVy9RamU5SGZr?=
 =?utf-8?B?QXJqTnJvUWJjb001cmJMK2R5V1dUQlBlS252VVpqb0dCOGhTMXhONkg1ZkdC?=
 =?utf-8?B?UTMrMkVKYjNQdENPQ0NBaUozWHN0Q3NGbUMzM05NRlNUanN5cVBwcXJNWlVT?=
 =?utf-8?B?UnluUUtTM3RhaGlpZ1lnSGhoNE5YWDEyK2paV2dKaW5pdzdNYVluOFRCTXZa?=
 =?utf-8?B?THNFQ0IvOGhvRldJWkJvNDR2NCs0UFBYR1l5RllRVDRhQWFFL1J5ZVBWTVdv?=
 =?utf-8?B?TnJrYkoya0ZmQm9pZ09iVFM3cnBtME93cUlZdmZSejdJN0VWd09qelhkYzJl?=
 =?utf-8?B?K2FpcnRvQUlIOGhEcS81S1R6REVuZnU4WU9NQ3FzNzRYbEF1cXIvckxhclkz?=
 =?utf-8?B?UmlqT2phb3IvYzUwdXZQQVIvdU1NYjJmQ2VaY2ZVZjgxdlBnSWEyb0p2RW1U?=
 =?utf-8?B?eW5SRE9oWUliUllWa21JSnBTK3NDNnRJYXpWdXlWTTFRL1JNcTVaeUdUZnZ6?=
 =?utf-8?B?RXJKYm5lRjhhK3pURWVabnlaOTRiSDJleVM1VEdoOTJmRUxLUzRvczBPRzI2?=
 =?utf-8?B?YXo0SHBoQTYyM09RbjU1R3FWalcvSHJ4VUJkK2U0dVdmMjBkaGMwTDN5eUFT?=
 =?utf-8?B?RVhXOFZVS0srMW9RcWpGZ3E5cWZkck9HajhMaVh1SzlaSTFTcFQvVGh4Zk1C?=
 =?utf-8?B?TC91SlNycENOVUtDZXRMUlU5VXdkRmdYQzJXdHFRcEhIcVRPV25tdVdWY3pI?=
 =?utf-8?B?T0pITlIzSzVubkVld1crK3NEQTN1MUhURE1ITDlwbnBURkZ0REJQc3oxY0tq?=
 =?utf-8?B?dFRPU05qUjVITEdGODVjZjYxb3dEbW1XQzFySFFQeGNNczZBSjBOQkZUVjEz?=
 =?utf-8?B?T0pScXA1Y3Y5Wjg3cVZ1WklaZ25VNHRyTE51S1R5OUFDenJZMk9sSktZakl6?=
 =?utf-8?B?WHdtYWlLTmRlTVBTRG5MUXYzT0ZJSlRpRjFQSSt4M21xZkRlNlRyUlkreFg4?=
 =?utf-8?B?b1VhYllwU2dIczBKaUJqMjc5WkNhZkttWEtFYUZGVUhmMVdDdG5Pb3hQNVow?=
 =?utf-8?Q?6d+n0SShF/ocOObT4dF1rnA=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	x+TiTvXFzfzxli8qIj6BV4RW6CwmvLAp7hhnyEgyDwgVno6bqMIusC73hq/pdjB/rWhFLF1NIHf3RTwSpb/rMGfH1CnbO7ihwcXtcKWuQLKxfOrKdYIaLMx1uV0MggFYEcXn+0Io4UqtxUj1x7cjKjxJuVKmWm1n7RZ/MssBWvLkOijALbhdqxLP0zrYxMks5t89zGqpA18pr2B02jt5mTb1xNyJDUenTXFdfKsxvINXm/InqONU0N3KtT2+X3xyIlksOiNyvLBDwU0FKlBCiiezpU1mFHhu7P9SpKttva2ik32UUSb2hc+uIk0F4l4ageSrvOMZlLR4uaMzwvY/+dQhFj/lRwl58xc8wRGRhl+uki4ysfpt85SeO4e88iPPez/jkbCfCRTxq5ldHQH2+aqATR16he6otudHigTqIvVf3Mp0qkSYL+i1usy8p3UjxPBXHWv2iC8GFp5ItpPKUc0CpBbqwaA42qGToUMX1r+MZYtsSDbvEUdiXrozrUThh5VjfVQmiyIBaiWi1MyZnMDqVvef4UpWcjdTiEvtgDukyqNwWFH2nB/upv2RsUsPnLqCdQguGbJDLeNb0a5J1zHkC9Sr192dedaj5QIjxD4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec874d27-325d-4f31-afb0-08dcf1b02901
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5267.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 09:10:08.7295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /I80EsJejRr7vC5cc2w0Gxu6hFC1nMSmstd4s5ZjqxhhlZjjfUcSdCxu+mNS2dMDFm4JTuo97RcKx0+66YhiYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6630
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-21_05,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 adultscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410210065
X-Proofpoint-GUID: R7PUEUHLC9kbTTNZeS61ZJZwsWQhr6GF
X-Proofpoint-ORIG-GUID: R7PUEUHLC9kbTTNZeS61ZJZwsWQhr6GF

On 18/10/2024 20:58, Nick Alcock wrote:
> The lack of this made it impossible to print out the last error
> in the list (which is EDT_PRINT itself).
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Alan Maguire <alan.maguire@oracle.com>

Thanks for the fix!


> ---
>  libdtrace/dt_error.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/libdtrace/dt_error.c b/libdtrace/dt_error.c
> index 82e114a5b292..213f0d9e1385 100644
> --- a/libdtrace/dt_error.c
> +++ b/libdtrace/dt_error.c
> @@ -97,7 +97,8 @@ static const struct {
>  	{ EDT_OBJIO, "Cannot read object file or modules.dep" },
>  	{ EDT_READMAXSTACK, "Cannot read kernel param perf_event_max_stack" },
>  	{ EDT_TRACEMEM, "Missing or corrupt tracemem() record" },
> -	{ EDT_PCAP, "Missing or corrupt pcap() record" }
> +	{ EDT_PCAP, "Missing or corrupt pcap() record" },
> +	{ EDT_PRINT, "Missing or corrupt print() record" }
>  };
>  
>  static const int _dt_nerr = sizeof(_dt_errlist) / sizeof(_dt_errlist[0]);

