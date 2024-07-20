Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794D1163
	for <dtrace@lists.linux.dev>; Sat, 20 Jul 2024 00:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721434138; cv=fail; b=JFT/THvjJgrOQGlCTqnsl5Epx1ogWqh8IbTpXXq8AvB2SBkT4ouIs0X/9sw2UIfVXjynImLwOpm3PqRZvxCO1F10IuqHTjGn+FA5OzcgVCw4jWMi3GHoRmXOrSra1DIMVYvWoAN3Bq0AGOC/YUQvSCqMu31JTAwGt9iyub+GjHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721434138; c=relaxed/simple;
	bh=VuY8zt9az906Sf19e4cIedCPHNfrfPGFvpa3ZTRc4s4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hy7kejwKkj4OkFAC4FdiHCtxvfH4kmlV+/3sQjodQc6ILeI7zYGIEkM0ID+rIVbaH5tSfos72g4ZXGeTfjOUf4rwdL/ovbo73J7WLUJtg/Unw29J5vfU75cByN7mZEP8QGpAK/GdGe+7Y9VFvSiwi4o4Cmh/tWPohdKGlidYP60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NpQ/H8QO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=X8MZylGU; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NpQ/H8QO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="X8MZylGU"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46K01Ifw016705
	for <dtrace@lists.linux.dev>; Sat, 20 Jul 2024 00:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=keBQmaUgpa5+ZjGOyxboLJB6q20nbDYMwsxHaPB7H/A=; b=
	NpQ/H8QOLhItRkp3VPDsGclkTL37v8GJmbouTBLJf5jCZFul4WBsGHxyD/NV35Iv
	Fje5NtXiC/FLrCZmIDdUhXAWWPg+2Xghnt/b0GOsMEWCaTHRoPwgD7ZOJ/2csWb0
	nfqM1ql5M/4nhcvkZ1gKXQdstvPS/ESovpFhcNhsKU+cW7WmdHu1x2jc+Z8Zwpfn
	rZwNu41bB8ZjGzMrpzPb0UjE0ehloHQpCa87bl298wozEzShSGWKtXqF647dH4LF
	xlAL8LGYbhyKhMjzLwwxMkgBwi4sV0rFeTo4VQzuq/9yMBRnByPqixc8xoIrx5sI
	k3ibq3C+42WauX7TqBrmeg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40g2ag00a1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 20 Jul 2024 00:08:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46JLD1U1021610
	for <dtrace@lists.linux.dev>; Sat, 20 Jul 2024 00:08:52 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40dwewgnp9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 20 Jul 2024 00:08:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MV+mz1d6N3EJ8jASg+sjLZJf82RXKAA7GgVNCNBC4gtmsaA8VUaGcbK2/ZOndW9vQ8Q7AfrOwfH+CIycqxTnBcCKc+mLi+SMsI1O0ZutdzdAA2W2CPydjuZdeMdck674laDikk2bBACsxNCSw7j4Ig3NNq77SToXCQpX9M4UYv88geL/zg9Fxh6VNbmmoC2U7W8Ky5kjIg04MVJrmHIOj1py0cm/Zzl6r26+B0FyZoJ0SAPFBLCyMX8dX3YU6DUTu4naRKHwAzc5ZP05ajo/NDSrnVPOXc+FbWH7vR51OdvnkWaoIaaT4I9/wIx7YKNkkVdASC6n4JMqH1fprv7uXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=keBQmaUgpa5+ZjGOyxboLJB6q20nbDYMwsxHaPB7H/A=;
 b=U7Qshtc1tqOU6nsgXuoaK5KjkwVihBeEay0m48ywtpJKX/0tVivzVJ0l74PyXo1L8A6aGwBi6HHQL6dvsPoSnEmDrmzVdTkx0j5jUFWOJxBT2G0WnRVtJEF5wZcmLLKflPTcBrwuRZZUJaibdstpF49FVs5NepkQRh2GmHQjCEsMRwxAxPoYnLKAF6k9PN2s/kVWEX+XIuduN/AyL+EtpgPcg1dZDJWboQxbi5Izkrc+7kAyapmWPCqQls9GKAqytag3sSVsKyI6waVDxu2jl7ZMSQbnr+kduMx4rKdiK2TmRNAHuYVK9DhFFkphWlo8A9utAjufYsL2yPRTkblgSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=keBQmaUgpa5+ZjGOyxboLJB6q20nbDYMwsxHaPB7H/A=;
 b=X8MZylGUX2k3WYq6OqxDRhpsbRSwK7FMLJFl89RLms3rjwVVhwMt4t/M8PBgLHJd1h9GwjfZa2u5CHhJ8a3jeeGnZFkmVbwc8O64qFKovetEXlBemDFBWZCx+px4p8YvHtm1UJPbpp8AGaeW+IHZ9oSVT56DxwGXdMG8ywD/cEY=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BY5PR10MB4116.namprd10.prod.outlook.com (2603:10b6:a03:203::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Sat, 20 Jul
 2024 00:08:48 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.7784.016; Sat, 20 Jul 2024
 00:08:48 +0000
Message-ID: <ae29d7ba-7545-edbb-7e93-79dd1ea74d6a@oracle.com>
Date: Fri, 19 Jul 2024 20:08:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 20/38] Add a hook for a provider-specific "update"
 function
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240627053904.21996-1-eugene.loh@oracle.com>
 <ZprNJnLix+hRYoTA@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZprNJnLix+hRYoTA@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0011.namprd13.prod.outlook.com
 (2603:10b6:208:256::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BY5PR10MB4116:EE_
X-MS-Office365-Filtering-Correlation-Id: a069fa2b-1a8c-4283-392e-08dca850210e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?clM2azJmMzhlVWh2VThSWjNOYXBKNHEydXM0Njd5UXJNdU55akFNeXpkZU9r?=
 =?utf-8?B?d09QczhmUEJpZE1YakZrVUE1UWtyZXBQS056VlJuTW95Sy9QUEpvdGxaWmpK?=
 =?utf-8?B?aFpDL2tkNGM5S1dzYXVmSlNzS1dBU0EycjNYdld3WC9iRWhNTHNTOFh0bjF1?=
 =?utf-8?B?eFRNSFh3aG5iN0x0TnVpT0VPMHc1YkNSNHd1WnYyQmdPTWtEQm02RUlNVmNC?=
 =?utf-8?B?S0N2RkoxQ2tZZXlHRFlJdmpBTTIwRm8zcVNpbktObW84Q2dWYzZ6bE1JeTlW?=
 =?utf-8?B?Wk51ZGdsQWVsM1NKRklLQnYzbG9xa284cVY0QTA0OEIxZGsrQTdES0VBV01h?=
 =?utf-8?B?cWZnSmQzSVkyUEhTU1ZuUzUvSXEvWXhNWHNBb25mQ3I2dkF5RXZYMjlRa3Zv?=
 =?utf-8?B?c1VseFdYTktROGs3NFRYWUFJaTBGVTNndmJNMGdaTTRlN3QrWkppcjFtMW8y?=
 =?utf-8?B?djJlNU51RkFLZUxRK0dYU0FMRko1ODVEcWdaRUZxUWpSVG5IOGVjd3lSaU1B?=
 =?utf-8?B?VWxBL2JlankwOFovamZHSVFwUlR0RHBpK0h4VzM5RXhUYktvSm5BUVF6TDNl?=
 =?utf-8?B?ckgyREZWbGtrd1lHTURxMGhDMTEwa29sUHpnWERwWlFDSjREUDFvdS9aOTJT?=
 =?utf-8?B?NC8zR3hYUzJnMmQwcVdHQlhpb3lWZGw2SlBtMFpzcGcvSWxHVXVzbFdMRlpY?=
 =?utf-8?B?MGNKNTlpeVBocDFGcmplMmRIUVNxVVJ2V2tUVVZ6NEZDZlEzS0I3TjRscjIx?=
 =?utf-8?B?c1B3KzdVektvenBBTEd6UXdNcmdHWFNXQVB1QmZBaW93cTl5SG82Z2wwZjJF?=
 =?utf-8?B?OTlQUzIzb2ppUjZZMzM0QnVXUzd3RnFKMjFZZzkrZkR6TlJzSlhJZkkxejR5?=
 =?utf-8?B?K2hlRWJLMDYxWTcyYjZlMU1qMVVvQkx4QW1pcDhmRzF2aTJTYzFEUDhJU0I5?=
 =?utf-8?B?V1U1Y0xsRlRCT01CNzRjUktOUVBVVXQ0b0t4R2lReVRYMXUwaUd1ZTRxVDVh?=
 =?utf-8?B?YVhFWGNsVlIwZGE2MlJBWWRNTE9EVTR2ckc4VldrdTd4VEl2UFZpQ3VXVGpm?=
 =?utf-8?B?Zkd3YlFzR0FhaE1EMXlNL2RheFMyS2Q3ZHpvbFdBL3YrdTMvR3ZOYVIra1cy?=
 =?utf-8?B?V2lFeVAxS1RZMTE3T2s0TzlMZVlaNTNNSXFKZ3JBS1d4VklSLzk3WllaaEs3?=
 =?utf-8?B?ZWJKUnYzeU05OWJxWUhheEZmK1VYOHYxZ1FFODFiMkxIU29KTVdrNFBVTUoy?=
 =?utf-8?B?STc4Mk9NUmRrYWtTMXByVnVodWJTZVRrZjRqQnk0VWlBTmV2bkxEVm5pMUx4?=
 =?utf-8?B?TDdiUHJmL2ZYSjhscEM3QjdDamhPdUNDUTcyTEpaaURZN3VmOUVJTCtPVXpB?=
 =?utf-8?B?bnFEeDk3ZnNnZnRHOXAycjhPTWRucGNzOWVvSVZyK2lqRVBJbG5RditSWjZC?=
 =?utf-8?B?N3Z2SU9EVnF4WlBnWWY0azdFeVRZbTBrZGNnUzRtNW1pL1VYN2M4L25rdFVj?=
 =?utf-8?B?QlpRaCsyRlJjWkZrZ1F3a0YzSDJRdnRWMEdWck5kS1FyNmsyUU4vMWxGVkNK?=
 =?utf-8?B?UjRtNVVGMXhYcWxOVkVnTWpIbXEzalBDOGRrVVFVaDdaMGdYSlFkSFNQWTVm?=
 =?utf-8?B?QzBjQjdHTjdjN2diSHFFdXhLdUphSkNMcG52R2RtZm5ad3RaNFRzclYvNzVY?=
 =?utf-8?B?dnVTbEtpY1BFNkgzRVlGcUdVaUhXVmFIS2h5SFFqamFPSVpxbWpLK2JGQ1h1?=
 =?utf-8?B?blZHUWJhcW5XazFKMXB0WEErN2tlSGJwaFpxcGxyNEQzVWQzVnhOeDBhVzRX?=
 =?utf-8?B?L3VnejdaeW5hVXRmTG81UT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a3RwZTg0azhMSVdzN3VUWlBmT1ljekV0YUZVSUdwUHVVMG04WGY4UW4zeU0r?=
 =?utf-8?B?YzBjektmTmM2K3l2Qzc3bzZmT2thWEdGdzFXL2FONzNBUDFVcXZZN25tb0Vw?=
 =?utf-8?B?dGk1RXdDTmlvU3g2WDlLdU1RUHJES1ZjaS9MNUFPK0VGVklGcTdEM3hyZzJ2?=
 =?utf-8?B?OC9ISHZkUk1nM2M5QUZmYTJrVWd5eVNvNG5lMDZGYkRNWG4xZ0I3YUpMaEZS?=
 =?utf-8?B?V0hpci9oOFpRdDRXRkpncDRkSzZxUHhkUDcxWXpZRk9yTWQrbHRMUGdUdzZj?=
 =?utf-8?B?TDgwTzhxamh3N0E5YnJUSnVTNTk2NTJzVjM4UGtvMDdlNjMwK2hHN2MzTDBN?=
 =?utf-8?B?ZTlYR21NYkxDU0hsRWNDWVpRZG1kdUFYY2pTTjNPN0RGQTQvOXVTTmJpZGtx?=
 =?utf-8?B?UjJ6ZWZxZWpiZXFaODNFWTY4VlpDOWNDNWFDK1dlQk44MzdpV29CekFJUnRi?=
 =?utf-8?B?ZFQ2Ulh0aEJ1bXRDNlZhWldxSXlaVWRTZzdOcktvbHl2WDY4NVZXS0xVWjky?=
 =?utf-8?B?TjBEZ1ZHQUo1WjRYZUNHQWxsendSR3dDNEh3eTJrYXVDUmtlR0tzS1ErL1kw?=
 =?utf-8?B?WjF6Y1U0bGhvTFFOaUNuM3RaaDJ0UkJ2enVKaDArQ3BvdjJIRFB2eVJESVpI?=
 =?utf-8?B?MnJWMUFpOGwyam9TQmZRQnd3MC9SQnkwQXNJeGJlYlNTcUx0dDc3Y09Vb204?=
 =?utf-8?B?bkFnTkJrSUkrRTdvTGlaeW1VYWZ3cmZ6RERRNkJCMStQeWdMdmpVc29aeG5V?=
 =?utf-8?B?Mi91OWlKZVFXQVNRM1hyMjJWTnpreGFSby9pNGVoQUVLY3dJUmszb2lZOHFk?=
 =?utf-8?B?R21KUW0xTTNWYThkN3dkUFlFQVZTK3pzMFdOYUtTN1g3dDYzaVYxSDNESjNs?=
 =?utf-8?B?UjdTL0NjdHlwbXpRTytxSjAwYWxzK3N2Mk43b2pjUWpET1VYbUt4eE1uTzht?=
 =?utf-8?B?VmlMWTNjdm92T0xNWEdlRzFPLzJMQ1AxS252UzMxRVhrM3BMajFaMFFhbHdh?=
 =?utf-8?B?MWhIeXV3YmNGZ3dFK0xYWGlDcldlRW9YOTVqQ0JYbDlNMHgxL05wTzZvTVQ0?=
 =?utf-8?B?UHdWTXJnZThJN0VwVWlISnpQRUw3Y2RBQWNyVllCdkY0VDkrMDVldzlEMWlt?=
 =?utf-8?B?a2IxQlJCVlA0UDJtL09neFZHS2xhN20vUnVadE5hRWp5dnZrWldMZHhFUXRQ?=
 =?utf-8?B?WW9jeXpDL0FJSC9ybmMrS2JBMW1IMEd6ZXNmUWpKNHY4Y1kxb1h6TFcxVjZ1?=
 =?utf-8?B?VHQrMEEyaDRVb0dMNWZDUzdjRElKczRTdE5CVXI4RnZ0MjgyZVVDYVRCbzNH?=
 =?utf-8?B?c1NkbUwreTFwajFsUFBaWkxGVmN0Sy9YblRFWXZaQWdhVzF3UWFsQzAydmNs?=
 =?utf-8?B?U1QwNXArNWIxaXo3MU43bTlRNy9sa3NsNW5SaWgvckJIU0V2bnhVaDBlMEVP?=
 =?utf-8?B?UVJod3ZpTlZDU3ZUQ3FHUTZndUVzOGxvOW84Vm5vQUxZeG0yN0E0Y0R6SE1E?=
 =?utf-8?B?V2pSOU1RdlRxdWI0YTkxRnlsYUgvazFKQnJzQlAvOXAwc3NUWlhIMXpEM0Nq?=
 =?utf-8?B?WnlDRUxvdzMxUHdrekJVTURCazJ4VVo4NnY0OVpIZTQ1R2xnbEc1djBMcHpU?=
 =?utf-8?B?d1l2SWR3eXRETG5KUHdodnZUVjM4WkJJZDZYRi9HdDg2NVNxUHNyM3FZdi9w?=
 =?utf-8?B?T1QveC9nRU1RVmkwamY0TVJOVi95VWoydXgzczJiam1kRWlMQjVRL2J5NmVs?=
 =?utf-8?B?YjZZaU1XZFdCeTFmamgrS1ZJRFRkRUd6ekhBMWRhNVZsRUNpQm5jS1hzajFB?=
 =?utf-8?B?RnBsTll1ZDdZQkV1QXR4OVNPZkVQMmw5SjQ0MXJrUGFjYjBwZTdiYlg5c1p4?=
 =?utf-8?B?V2ZSQ0p0RG5yUy93eE5YMjlKNTEzZllmcGtad3hlTFB6SXRYeW1iQmlLL1Zy?=
 =?utf-8?B?RVBPQ0Jvb2ltMXFYM2pSVlA1OFRKRUZkRU1sRXB2cFVNN2M5Nkt3V0o3M1NG?=
 =?utf-8?B?K281Y2ZqQUxtZFFENUM3blpvejBlcTYzbjFHS3dKdWJCSkVYdEhDQWtCejBY?=
 =?utf-8?B?Z0xteGZHSXRHR05wYmNBSkwvUWkwc3hydE0xc1NJbllTTkQrR0t5MzlQNEVu?=
 =?utf-8?Q?OGE/QKpEmt9NAo7rPEa/oDZel?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	grNVTHbrzGn32RXCGtBFa+c+O8fZ+ZEQXtSUcKGqS5Cb8sfyzucvG8M0tiHVeweirzLrTvDFd0X7P0B4futLihTger901fETnXPCFBnc8qcY4QdQpzH5pmAoEilbQ9jKI1lrmbXubB0CRrAwDvQ0IxSQtO7yStq0dYJiiPwpY0HEsvw3lmqYGX8liYm5d1TLxXbTRS+LWUefzaSJD/+ZHlDVPFyMZh/84pvEhvs+KgYMWbXotnZHVV5r7jW1TCEFX1xxMrQSTRMdK4SLN1TSWl+Myx5KGEgNS2sbOc9QmE/brIHXuZZb12mWNfjqpC90VJHNoy/+qy0AhQ4rGTz0RA1ukoYAyuS1rmNUFPt9OELAD1ZHetHz5Q4TfHwSovCRzppxxS7DMGK6eni+3dXzU7Nl7EFHeHkktlxUDOEGM+u4MBKInntKAak6Yu2Hx2MWksyIC43/wYkJ6MARu2l2Q2KU0Ln3xzCpiKm5GwyprJwoYPDKfPdtx9ltPtNk0KfKNGc3Zbh1uqbcDKTU3O/mIjr48PT0O/OBP1uP2HlDtQgVdgPflaDnHPIMnQ0r1AKhs0wSLNotuN744UEgLby83QrMGG/uy4q8crDq7HJL53Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a069fa2b-1a8c-4283-392e-08dca850210e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2024 00:08:48.6527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zNTO/pYpr95ZnUSaX8cYAAAlYClQh7oLWKOI6k4P/bs2QUxrloLcFcYmM2yarCH+MXrvcpXePgZ01jqnYnyhYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4116
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_10,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 bulkscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407190177
X-Proofpoint-ORIG-GUID: OUshahfsHABh3Pm7fltMQi1lAkFEuHnf
X-Proofpoint-GUID: OUshahfsHABh3Pm7fltMQi1lAkFEuHnf

The plane has barely taken off the ground and already you expect me to 
have completed the aircraft design???  :^)  (I was hoping the magic 
letters WIP in the commit message would have absolved me of 
responsibility here.)

Would you be willing to proceed with reviews of the other patches and 
then we get back to this patch?  There is a clearly provider-specific 
motivation for this function, but the style is to make these functions 
as provider-agnostic as possible.  Maybe we can defer some of the 
questions this patch raises.  Like, how often will the function be 
called, what triggers that call, will the call be USDT-specific or will 
it check all providers, etc. For now, I only have USDT-specific answers, 
but we need to guess what other considerations we expect to have to 
accommodate.

On 7/19/24 16:31, Kris Van Hees wrote:
> This patch surely should be part of another one that actually provides some
> code to use the new callback.  The implementation of the callback in any
> particular provider could remain in its own patch after that if you like,
> but adding this without the code that actually calls it seems less useful.
> If anything, the commit message itself makes it so generic sounding that one
> is likely to have no idea what this is meant to be used for, where it would
> be called from, why, and what the expected result ought to be.
>
> So, combine with the code that uses it please.  Which I will review next :)
>
> On Thu, Jun 27, 2024 at 01:38:46AM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> For up-coming USDT-probe support, we need to update a BPF map
>> -- at least when the dtrace session starts but possibly also later
>> to support systemwide USDT tracing for processes that may start up
>> later.
>>
>> One way to do this is with a USDT-specific update function.
>>
>> For now, let's add a hook for providers to have provider-specific
>> update functions.  User space can either call
>>
>>      for (i = 0; i < ARRAY_SIZE(dt_providers); i++) {
>>          if (dt_providers[i]->update)
>>              dt_providers[i]->update(...);
>>      }
>>
>> any time it likes.  Or it can call dt_usdt.update(...).
>>
>> This is for WIP.  A different approach can be adopted later instead.
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   libdtrace/dt_provider.h | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
>> index b1b1b1b8..71b5a3c4 100644
>> --- a/libdtrace/dt_provider.h
>> +++ b/libdtrace/dt_provider.h
>> @@ -71,6 +71,8 @@ typedef struct dt_provimpl {
>>   			      void *datap);
>>   	void (*destroy)(dtrace_hdl_t *dtp,	/* free provider data */
>>   			      void *datap);
>> +	void (*update)(dtrace_hdl_t *dtp,	/* update provider-specific info */
>> +			      void *datap);
>>   } dt_provimpl_t;
>>   
>>   /* list dt_dtrace first */
>> -- 
>> 2.18.4
>>
