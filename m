Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A5E204C36
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 22:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761258887; cv=fail; b=fEE2D7rzEZli3loU3XY+rrXAEMKYEWV2gd0bDsE0cQA9gBpPtxtKLaIDMVEBsujtx+fkfr/e0Iufzys9K3kGy05qw9HaYsumUxjRbCaOHKjMvuoyqIPvvS298bmkV3lNoAsJOKWMqfjP4iS6HQ4Nw2TFke50EoQDNfwccOPdILw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761258887; c=relaxed/simple;
	bh=d40QNqUQft+j/zxlsxQ1uIqe18AHm2DEi+cJqcj+8bU=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lRu77N13OgyMwfeSRFTKC6IDqh0IhAljgbLrzVra7FN+Zh8Owg0P/RfyyfnB/thNhQAUWaAg51lD7sLGo6Yl3rm1EQH71/1uIIMqCdi7b2ny2Rfx1CkP/StCCHuyWDGVyC1IyZtoCas8U6yb4+4XFDVZ5irefnbzfi1ymUSclyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EYPxIi05; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ncyHp1lv; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EYPxIi05";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ncyHp1lv"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NLNNhJ016890
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 22:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=m3i9YM+Wj5SwRwRdVNlvzCk0ZaiYHArH/7MbBO3koLM=; b=
	EYPxIi05aS8S/07G4dJHwB/8kWlT7LGmZMk2a3ZqJLGHXmp6Go6BdmG9sKtW4KpU
	o9u4ZQWqf0m/ZguGPoC0x5v1R8L0C1fJFJOW28hdQSRcPkM3+zpBbxK/cpSr75gg
	obE6Owh2tljAAnRYvAlTlQ4IlC4GU0q5Sh2xBVKCA0BLi+ftT4stwMYS3ZGzD+ne
	hJR74kfzGbJkXJUSxuZJZE/g2gxnJpr8LsnlyrLbi0w5miFypHXlNnhhQngfRCNH
	uQy4C6J3pYFdS0xmSaEWx+2qxHOGZorZ+IpPFroeNicQfiXbt3mFeQqUrNpVGySP
	pPM2RI17mAxcMjQYHfzHNQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49xv3k3p5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 22:34:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59NMQxW7025338
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 22:34:36 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010002.outbound.protection.outlook.com [52.101.56.2])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49xwk9np2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 22:34:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p6yHjaWB4Oo85WOVWRmMVlUY02iFFlJcXjWU75LD3akSDb7faMKLcVdRV9GgT6ZCzLFopu4BnNOezFjm2kt0YWOYhCqYJet4lhr7JW0xLnqa1aZzIrJ59/R4lq0CKwNZ7PVjOhBRxWU53pjwYsMBtTk1xiVW3DX+BvE+ZTLfU3CmiLy0MZqDZ2Nohkc/xenkG0Pao+qf7oQvgpABJ+rALZ1stkpNmBTZvn2VHByqrn1PP34aqwt+bajmJElmyKvDI4jMhXiHraqXEGNVmNuaB//6EObrgZjmTmI84cr81jQYrA3aHEcsYHiOGekxC/WLiMc7BLh5EbzDHXInzlXt/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3i9YM+Wj5SwRwRdVNlvzCk0ZaiYHArH/7MbBO3koLM=;
 b=PwwhMZ4NLxjd6Gwz+XCx79PeXjQNRHndVN9BYeOIM6m/pE5iiqX8/F2Dxo3DhKTDMvuCMX6DFvaxOw/GDRVDz8ZcRdbDfOQ0aq9X75+P3SJufMO4rQMsyVKuWTGF7zlTySatbaLN/p84FBYdP6/kgH6fRiR+aJkGF3a06DaslzRp9UYdbTEIzxfJy91FT+KAfm6atAsfi9Em2Iegy3ywliv/7y1LFJn+H5X7yHKTDTaNvAHMfW9zAly8mjGE+e/K7WONSbpktCJLHMdAW67QTwwOimviyOPPFKt4GLy8enGA8lGrAXYe5LxqXoI9Y9d6cXeDytIcjlaAir9WydTvDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3i9YM+Wj5SwRwRdVNlvzCk0ZaiYHArH/7MbBO3koLM=;
 b=ncyHp1lvM6fmBaiHV0EqQJ7EvlZqnKuG4HFoOBbjcTmLdF1SDO1J2uCBIqOJdIa+KAQMzMt3rZdtUVUcxms3ad+PlLIepHfasdi3YzF/tg6CBSTETWPehDQbzvBNIy8npUl2Uz53kIS7iy4lFYCO8aa/8NZa9ZGYzbBcU1O8aCg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH0PR10MB5129.namprd10.prod.outlook.com (2603:10b6:610:d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 23 Oct
 2025 22:34:32 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 22:34:32 +0000
Message-ID: <bcc9ae77-67a1-2e50-8175-45dd8fde722d@oracle.com>
Date: Thu, 23 Oct 2025 18:34:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCHv3] Update llms-txt and add README
Content-Language: en-US
To: Bruce McCulloch <bruce.mcculloch@oracle.com>, dtrace@lists.linux.dev
References: <20251023221648.6200-2-bruce.mcculloch@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20251023221648.6200-2-bruce.mcculloch@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0076.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH0PR10MB5129:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c85bacb-332c-41f8-7e2d-08de12845613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UzlYZGF5NlU4c1k1L0IwSGQxUGpJck9SajZnbWR0QWpmZDFwek5qL0wyQU5F?=
 =?utf-8?B?Rkt3cE1MYUFDMzkyK2ZNc0FRbjVtNGE2azZJUlRkMHNPa09CRjRvakFTR0Zv?=
 =?utf-8?B?SnppNWVnWEpaMDhZM3pFZnZjMStsU3BxR2NYeE5RbUNVSEV1QXdlNm5EaW1q?=
 =?utf-8?B?M3JKeXI5Y0JTV1FYVnIzVXRkQUs0ZXJtNlRia3VkUjlHZ1A0Z1piODl3am5s?=
 =?utf-8?B?ZkNNalZ2Tmd5ckdjQi9xTnNXWUdIbWo3R1UxSTlvd0Raa1ZPUGpnUmdJUkVo?=
 =?utf-8?B?RzB5bTNKUTFvR2lFREt4OUhGNVovdmJPNHhFZ3EycHViUUl5bGVZYnFyQjRK?=
 =?utf-8?B?RU1MNXpqMUxiTG1hMTB2b2hDSW8zS1FaOHhOeC9CODhKb2VXemdrT25uak9l?=
 =?utf-8?B?MEdDSHE5bzh5bWtRazhCWjg5TDRiN3l1M2FwY2dQWnc0RzdBdWpQVUdrcU0y?=
 =?utf-8?B?ZXJkSFhFNFgzM2IyQVJqOW5YR1ZmZUl5V0dKZGFPSVpaaUQrY0lxejJYMjBG?=
 =?utf-8?B?L0Eyck45VjZmR3VtZDUwRUQzWTNpdnhCZitnalcraWxKcXp1dk4xZVhObFNR?=
 =?utf-8?B?UDVQTkduOVpCT1Y3QlovZDU5OGJKRVNsY0JINGI3NHRFQW1Teno0K2JiZ01y?=
 =?utf-8?B?SURQVU9LMzY2ZGx2SUo2MmkwUmQwN1NxeUZNNUltMDI5dXR2ZGZaSVpGZW5z?=
 =?utf-8?B?UU9HNlFrNkFyQUR4ZXkzV2hPL1lDREtFR21qV2dnZGl2bWdFcHlVZjJ2QlpV?=
 =?utf-8?B?aVdkZXpRZU1ZUzJmOEJ4WUFObEFlY05Sa1FJYVozTVQxMTR3c1dkWnlDamNv?=
 =?utf-8?B?d3NFVkRJWjgzSHNuQ093eWtuTFdJSUcyb1lyTDhSTHJuVzY0WEQrdnczWUJT?=
 =?utf-8?B?WXVlMytqSnloRVdmVmJkTXhJbVIzN3R1T3JjUURFZ0RkZGdrZEhRSzN1TWxj?=
 =?utf-8?B?dmgrb3FNcEtTT1daUThCYjlEYkUwL3lNVzhRRDdhYzhDRWowOG1reUFiNGl0?=
 =?utf-8?B?OEVKU2JEbkxrTEdUT2daZXdYRXNEQ29kMmxlaWxkRGFCNmR4TnY0L1hlN2Ji?=
 =?utf-8?B?Tk94TkdHYU84Y2pRWDBLUzA1SE9DRkxncWVNbXRndk1RSHpZSEVXMTFRY3pJ?=
 =?utf-8?B?QkVGTzMxWE81YzkzN0VOQ1JLdVk5ZVJJSVBNOThWZlhpb0FZR29YNnh0aFlw?=
 =?utf-8?B?UTgxWFo5dUpieG1kSFp6STJSdndXSEQrdGxZL0FmSEU0WEhYbkJFaldmeWZz?=
 =?utf-8?B?MWpOdS9IaWFYeU8vMFJHTEJ0UDk5elhxWkU4NllhMElBdTU5aDBxNGQvV2xi?=
 =?utf-8?B?VUwxVnRPdnpvL0VLWHh4bnpNWmN4Y01QSXNvUjdSL1RxTEtXRm9sVFFIcnNv?=
 =?utf-8?B?NnZWNWhFenh4blFvKzNod3hMK0pYZG9SV2J4OGt1YTNhZWtESXdkQnZ6TXZl?=
 =?utf-8?B?OFVWZHNsNVVxYkZEd1VrZUhjMHlVTEhXSEFUV1krOUxWT0hkWUFuT1IzdXI4?=
 =?utf-8?B?bzZIK2xERnQ1SlllWldsR1cyTERuZ1ExMUlMNXdVczlHOVFCemVsZDJEQ295?=
 =?utf-8?B?UllzbFp6bFNvK05JR0VoZVBrdWVJQlkzK0lSUy8wRUVsbUEvWGNQQ2tEb296?=
 =?utf-8?B?TVQ5TXl5ZUJVbmVsVXo4eFFXb1haaUx1bjdUQ3MxTGxIMUVFT1Y0MWlKUHg0?=
 =?utf-8?B?enFsRmErWG5RVUdJQzJUN2ZRRGhRWUVoYlhiQkx3WU1PWWtUbnFGYWd0WXJ5?=
 =?utf-8?B?R3d6NTJVL0RUMTNkVy93ZkdGMmt0a3pTdWhlMXBTNlpDVnZCSFpGTGpMQi9B?=
 =?utf-8?B?enMvL1Q4ck40b1FPRUdRVnUyWDhVUmpvdzVUdzFKd0Z4MXZIbWNpVGdKTmM1?=
 =?utf-8?B?Y1dUenlSVjBTSGFSV2d5MUtkUWR4NGVzZ0srYjQvSU83cnc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkpMT2VNVC9KWkFZVGw0S0lQSUhHL2tJWTd3Z1lJNG5mMnZneEtVSFF1S1JY?=
 =?utf-8?B?WkYwU3hkWXlvWUhHVmRWWG9YWWVGU0I5aUh1cUJ4OGNpTytQcElkQjJROTB3?=
 =?utf-8?B?SzR4OFV1cDlzQXN6Mlh4cWtDSEQvNGxPNGpsVmVRVTBVTjdQMW01R09nbHhV?=
 =?utf-8?B?ZjYxNkNWVElMTXBWV3pZU0RabkpVVk1CNThOdVJvcGVTWExlTnd0T0EwQ0dY?=
 =?utf-8?B?Y3hpMU5kdW53T3JqY1diRWlHR09nWDlVaU5pZElEdThUdVJNRWRSZ3Y5bVBo?=
 =?utf-8?B?bmtVcUVsYWx5NDArVWJ3WWplUVFuS1VLdy9pUUlUeW9pTnVsM2w0eTJLVktv?=
 =?utf-8?B?cEtyR2plVmc2ZUxFT1FNMEN6SXJJWXJxUUd0UDVGZzFyMFE2d00rWWMwcU50?=
 =?utf-8?B?YXR2MzVCZ3N1TFN6a0M3MVpmRUZmNU1RZ0hkMnRjWmdrVitQWEVyRWM0T1FN?=
 =?utf-8?B?L2FmT2lwcTBXMzk4a2JwT1ZJUE5qWHRna1h4RUtOTUEwdURoOHBNOUhpQVBE?=
 =?utf-8?B?cE0vS1pUd1lCRk52cElWbzZjY1FQVkZIR0grQ2JyWm5jS2UxMzJmQThoQldn?=
 =?utf-8?B?c0NvcUxRaWJ1dzA1SHU4L0JObnFmVEdBYjNiSkJZdURaTzFwWHlPVVhWbHFI?=
 =?utf-8?B?amp0QUpCci9GWXYrcnFpTDN0NXc0ZVhJSzBoN2cxSU9pZGR6bzd0aWFvQ05m?=
 =?utf-8?B?aWovVUsvWVJXZTJiZC81K3A4QXU3Y0NjWjNxRklqbG0wL3U2ZENwSzVIcGJR?=
 =?utf-8?B?S0lrclErdzd4VVVITlNtcy9FN29WRmZ2Mk9WMW4yOThtMUJva1FIYVpuNklP?=
 =?utf-8?B?RWFkSzRZeUpYZHIrT3AxSHZFZnZiOUdqL203eDdYcld2NXVxeEw5V1QvbG9h?=
 =?utf-8?B?cm5BekRGaTk1MUNxTGdRcm43bWUwRi9uUnUvRzgrMkk2bDdCdUgwT2NTQ1Bu?=
 =?utf-8?B?Vm1iYXhBbk9RY2l1ci9uR0U1cUhUODNoUVRSWHZicG1lbHQwbzFsT2xicWhj?=
 =?utf-8?B?V1dObnM3TzR1eWhETE14L2M4K01NQXBVTEg1REFmTzRPcHgxeFJpTWNqamZH?=
 =?utf-8?B?ZUQ5Y3drUEhyTXBjbUYyOGJqUlkzRDBCTFN1WDVUMlYvM0pHZElFaUFCTTV2?=
 =?utf-8?B?ejhCTFcvRWJ2NjhzN1YyM0xreGswdFB2RVFaNENPdWFLem1saCtFS3c1Y2VN?=
 =?utf-8?B?cVNSbmdPeTVRZmlsbGorZGsrUEtCZUFPTXFIVW5wSWtNRFF3aW50OFBGZ0pT?=
 =?utf-8?B?R1BCMisyUE83dnhYb25VYXh1c2d1VjJ1SGZXZWNtRHp4dkFwMDNTU1p5aWsy?=
 =?utf-8?B?Y2dYQ3ZSazZzODg2RXQxbEIrRmtzY1FOUWQvRUxmYVZjbkdDdEZTU1hxSVRK?=
 =?utf-8?B?cSt3cFdhdkpiRlVpczl2SDNEdW9qNG1kS2x2TlJKajRLUTI3T29FclVLcmN4?=
 =?utf-8?B?a0VCZDYwOVlnMDFGdC9xY08yQlpSNVIyTkpxcVdmUFJEK3MrZ2hUaXdxaG9O?=
 =?utf-8?B?b3UyTXJNcUhBbmVHV1NOK3JjUWpIVHErMnV4VmZzUWtmTlVUd0xYb3Q4RnRE?=
 =?utf-8?B?WFVxaEFMVVkycnpVQjVvbmU1c2dyK001Ykhla2dpSGI5ejJRakxsYkZIRkZH?=
 =?utf-8?B?ellrQTJWTUt1L1RYZGFHMjlFand0a3JocncwbktPVVVkU2tjUWhBVktKOUFV?=
 =?utf-8?B?V0d2aHEwejFaQTRxbWU1LzNOVmE5Y2Q1S2IwWEpDOG5wajdjUmVJWmhmOEht?=
 =?utf-8?B?blNpSGlXN1dHaEVmVFBlaXdnZXdaaG1aazRaZnJlak9Odm84Nks2TWhZaTI4?=
 =?utf-8?B?VVBQa3Z6RldTUlZLVUF3ajVLYlpMRHI1NDA4bUx5d1ppdHVXUnM0blNVNEFs?=
 =?utf-8?B?eHRkZ3FQdzU2UVd3SXhlTGxDQ0NNdnMyUnZtYyt3VWJ2VEgvSWpOQUtDRWVP?=
 =?utf-8?B?VkhndjhIVThJZjhpdFB4dEY2eTNlU2ZDZzQxbjRGOGFSVzU0RnRHMDV3TE1X?=
 =?utf-8?B?WEZjN1JvWXlHM1VuSG1mTnFDbjhXZVdoK0xSeUNvYkZZY1p2YldoQmU1MHk1?=
 =?utf-8?B?OXZyeHVqTmd6YXR6OHZsczBlNXprS0JCT1RBNUNGOGM4QkpmdWFYV3Vib0RX?=
 =?utf-8?Q?1UlDkJkZ9bYJ5eSVN3Dl2W3V7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8SpdQng403XsgihW9Cb+jva5R9REZSo9rDiY3MenbdYNPiIIfukGmuk8Bbk+jnihUk8/LpsqAr9uydGizstZCZz0BW/5FOH8YYlsnIvm6xiG3k0BTyqWZKvomOH5rqRbCHfXGSqXSPGaXlQv+Mgbf987VhzzKsgcgvx7IR0zAQhCe1oOWp0IomY+1lWz0jJCAzHi1kex9TAg0u5+Fy7XVHShqJ8XQKXK9wbpk2PAAKXktFi/tziz00IkeIhNQWokDgUNGEw8HXns1eBR5wFZ4RbPHmXP7oa06UxAt8RJspxSCcfsF0jUhT8Oz7g/23XFkaLeE35J5JB8rcZkC54TIHO8XIq6YLyJ/us0peDUHMBc4nYZrYlVZhyaW3gl3I4rG3xG9BSjX0yBZ8opncfzUavLKcsVUBBwUBw8I18ORVsHXfbxh5iZ6aM2oPtWYJnXoXMVdKSAIdczrGiNiSlKkwhRgFbNoTXqzuNh67MlL6CMZ3YOC8NUJWF7DQakaYHjfvD77ooImjIMNJBFbm833Z2u16tP3HrCMtX3LaZS2RIMF2BpmEReAU+ExEL5ysKft6d1JimzjMTQUgEgKJKiUXiHDhOj0z09iO2xodS6XiI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c85bacb-332c-41f8-7e2d-08de12845613
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 22:34:32.3858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hW6bo22u3BQ+nwC+GnY7PcBPtjEOmbdC/tp2eHdR3XePs5mHe1rjApU9d4NASek8bbdurqpqyonjeWU/SqcBgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5129
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 mlxscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510230206
X-Proofpoint-GUID: BmKuhNf0yoOPE0KAP_g71_EFMsU3dQdX
X-Authority-Analysis: v=2.4 cv=bLgb4f+Z c=1 sm=1 tr=0 ts=68faad7c b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=-bMhQ6iiAAAA:8 a=yPCof4ZbAAAA:8 a=-de44-kQP7nnvgcI4-kA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=aViEl8YYgB_fEZN5ws7z:22 cc=ntf
 awl=host:12092
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA3MSBTYWx0ZWRfX4azq4tCLmWE9
 qCi3FQs3EsDDBicrvVsmFHdwa+5/QtWVDcKHrTnW4By0lRMR1tjX4T2N5mnEsWFGocAxbugDE/R
 YXbQ6SJOaKO0BzDa6Nc9nF0JJwuDLKPKofjjYxO/065SH/rkvgP9pXIXqI2VnL+QDD6J+VNuETN
 39CsNnAFvs1gyOY1Af4vU4JddFy1BAXPMdgAiFyIR6aOrCxdLS8o6beXpyy1SXi2Z5NgjV8axAm
 ukOB/AF53ZEMDcDwAQCYcOJlCiNUWlOFQKmIEdapnitm9XGkRjeNmUmWKfbTmCrkJX2gfY7vG93
 g3foRZQKkBHHAhxY/g6w0a13e8Uf/HPz0mx8s2sXnYrvqg8db70GKSxfdawQgaRxq1YdXDyWaWI
 nS37qYx8LXTrhmr0PKP0Cv2AqabkZH3qQx8+Soyo322onDw7Ia4=
X-Proofpoint-ORIG-GUID: BmKuhNf0yoOPE0KAP_g71_EFMsU3dQdX

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
but when I apply this patch to dev-queue, I will...

On 10/23/25 18:16, Bruce McCulloch wrote:
> Signed-off-by: Bruce McCulloch <bruce.mcculloch@oracle.com>
> ---
>   llm/README.md                | 130 ++++++++
>   llm/llms-dtrace-complete.txt |   2 +
>   llm/llms-dtrace-short.txt    | 611 +++++++++++++++++++++++++++++++++++
>   3 files changed, 743 insertions(+)
>   create mode 100644 llm/README.md
>   create mode 100644 llm/llms-dtrace-short.txt
>
> diff --git a/llm/README.md b/llm/README.md
> new file mode 100644
> index 00000000..3de350de
> --- /dev/null
> +++ b/llm/README.md
> @@ -0,0 +1,130 @@
> +# DTrace LLM Context Files
> +
> +## Overview
> +These files provide structured **context packs** (`llms-txt` format) for use with large language models (LLMs) such as GPT-4 or Claude.
> +They teach the model how to write **correct, safe, and complete DTrace programs** for Oracle Linux.
> +
> +The goal is to let engineers and administrators generate working D scripts in natural language — without having to memorize the entire D language syntax.
> +
> +> The context files describe probe syntax, predicates, statements, variables, built-ins, functions, and safe tracing idioms for core providers (`syscall`, `proc`, `sched`, `profile`, `io`, `pid`, `usdt`, etc.).
> +
> +---
> +
> +## Files
> +| File | Description |
> +|------|--------------|
> +| `llms-dtrace-short.txt` | [Compact reference](llms-dtrace-short.txt) used to bootstrap LLMs for DTrace knowledge. |
> +| `llms-dtrace-complete.txt` | [Full expanded reference](llms-dtrace-complete.ext). |
> +
> +---
> +
> +## How to Use
> +
> +1. **Install DTrace**
> +
> +   ```bash
> +   sudo dnf install dtrace
> +
> +```

... indent the above ``` so that Markdown will know it's closing the 
earlier ```, which was indented, so that the whole thing is rendered 
right.  Also...

> +
> +Make sure you are using the DTrace binary from the `dtrace-utils` package, _not_ the SystemTap compatibility binary:
> +
> +```bash
> +which dtrace
> +sudo /usr/sbin/dtrace -V
> +
> +```

I'll indent the stuff above;  I assume it's part of the numbered bullet.

> +
> +2.  **Load the context file into your LLM session**
> +
> +    -   In ChatGPT, Claude, or another interface that supports file context, click the “+” icon and upload `llms-dtrace-short.txt`.
> +
> +    -   The model will automatically ingest the reference and understand how to write runnable DTrace programs for Oracle Linux.
> +
> +3.  **Start asking questions in natural language**
> +
> +    You can now prompt the model to produce valid D scripts:
> +
> +    ```
> +    write a dtrace script that shows all read() syscalls made while the script is running
> +
> +    ```
> +
> +    or
> +
> +    ```
> +    count how many processes start on the system within 5 seconds
> +
> +    ```
> +
> +4.  **Run the generated script**
> +
> +    Save the model’s output (e.g. `trace.d`), then execute:
> +
> +    ```bash
> +    sudo dtrace -s trace.d
> +
> +    ```
> +
> +
> +----------
> +
> +## Example Prompts
> +
> +Here are a few good starting points:
> +
> +>“Write a DTrace script that prints the PID of every process that accesses memory.”
> +
> +Teaches process-level tracing and probe filters.
> +
> +>“Provide a DTrace script to count how many processes are started over 5 seconds.”
> +
> +Demonstrates use of timed aggregations.
> +
> +>“Show all `read()` syscalls and count how many occur per process.”
> +
> +Basic syscall entry/return tracing.
> +
> +>“Track which executables call `open()` and print errors.”
> +
> +Uses speculation and error guards.
> +
> +----------
> +
> +## Safety and Trust
> +
> +DTrace runs in **nondestructive mode by default**.
> +Even if an LLM suggests unsafe actions, the runtime will prevent writes, signals, or other destructive operations unless explicitly enabled with `-w`.
> +
> +This makes LLM-generated scripts safe to test and explore on production or staging systems — they can observe but not modify the kernel state.
> +
> +----------
> +
> +## Notes and Troubleshooting
> +
> +-   If you see:
> +
> +    ```
> +    dtrace: could not enable tracing: Destructive actions not allowed
> +
> +    ```
> +
> +    either remove `system()` calls or rerun with `sudo dtrace -w -s script.d`.
> +
> +-   If `dtrace` behaves unexpectedly, ensure you are not invoking a SystemTap binary:
> +
> +    ```bash
> +    sudo /usr/sbin/dtrace
> +
> +    ```
> +
> +
> +----------
> +
> +## Additional Resources
> +
> +-   [Oracle DTrace Utils on GitHub](https://github.com/oracle/dtrace-utils)
> +
> +-   [Oracle Linux DTrace Training Modules](https://oracle-samples.github.io/oltrain/tracks/ol/dtrace/)
> +
> +-   [Oracle Linux Blog: Natural Language System Tracing with Dtrace and LLMs](https://blogs.oracle.com/linux/post/dtrace-and-llms)
> diff --git a/llm/llms-dtrace-complete.txt b/llm/llms-dtrace-complete.txt
> index 2264fc40..8a4a535c 100644
> --- a/llm/llms-dtrace-complete.txt
> +++ b/llm/llms-dtrace-complete.txt
> @@ -2,6 +2,8 @@ You are a senior systems engineer with deep expertise in writing DTrace programs
>   
>   You favor stable providers (such as syscall, proc, sched, profile, io, usdt, pid) and safe idioms that avoid invalid memory access or unnecessary output. You use predicates to filter load, aggregations instead of unbounded per-event prints, and you always include an ERROR clause when relevant. Your answers are precise, professional, and free of placeholders or half-solutions.
>   
> +DO NOT RECOMMEND DANGEROUS OPERATIONS UNLESS THERE IS AN ALTERNATIVE. Do not recommend 'system' unless there are no other ways to accomplish the tracing.
> +
>   Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Oracle Linux.
>   
>   After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Oracle Linux.
> diff --git a/llm/llms-dtrace-short.txt b/llm/llms-dtrace-short.txt
> new file mode 100644
> index 00000000..a514abbf
> --- /dev/null
> +++ b/llm/llms-dtrace-short.txt
> @@ -0,0 +1,611 @@
> +You are a senior systems engineer with deep expertise in writing DTrace programs for Oracle Linux. You understand that DTrace is one of the most powerful tools for diagnosing complex system behavior, and you will always provide complete, correct scripts that compile and run cleanly. Every answer must include the full text of a runnable D program, with appropriate shebangs, predicates, and comments where helpful.
> +
> +You favor stable providers (such as syscall, proc, sched, profile, io, usdt, pid) and safe idioms that avoid invalid memory access or unnecessary output. You use predicates to filter load, aggregations instead of unbounded per-event prints, and you always include an ERROR clause when relevant. Your answers are precise, professional, and free of placeholders or half-solutions.
> +
> +DO NOT RECOMMEND DANGEROUS OPERATIONS UNLESS THERE IS AN ALTERNATIVE. Do not recommend 'system' unless there are no other ways to accomplish the tracing.
> +
> +Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Oracle Linux.
> +
> +After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Oracle Linux.
> +
> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
> +PART 1: PROGRAM STRUCTURE, PROBE DESCRIPTIONS, PREDICATES, STATEMENTS
> +
> +## GOAL
> +Provide a compact, machine-optimized reference so an LLM can generate correct DTrace D programs for Oracle Linux.
> +
> +## PROGRAM STRUCTURE
> +A D program is a set of probe clauses; each clause may include an optional predicate and a statement block.
> +Syntax skeleton:
> +```
> +probe descriptions
> +/ optional predicate /
> +{
> +    statements
> +}
> +```
> +- Multiple clauses allowed; run in program order.
> +- Empty `{}` triggers the default action (trace EPID).
> +- Scripts may be invoked via `dtrace` (shebang/interpreter line).
> +- Scripts can include pragma options.
> +
> +## PROBE DESCRIPTIONS
> +Canonical form: `provider:module:function:name`
> +Fields:
> +- provider — DTrace provider name
> +- module — kernel object / library / program, if location-specific
> +- function — program function, if location-specific
> +- name — semantic probe name (e.g., BEGIN, END)
> +
> +Shorthand precedence when fields are omitted:
> +- name
> +- function:name
> +- module:function:name
> +
> +Avoid numeric probe IDs (unstable).
> +Wildcards & patterns supported (shell-style globbing). Empty fields match any value.
> +
> +### Pattern tokens
> +- `*` — any string (incl. empty)
> +- `?` — any single character
> +- `[set]` — any one in set; `[a-z]` range; `[!set]` negation
> +- `\` — escape next char
> +- Empty field ⇒ wildcard match
> +- All four fields must match (with patterns) for a probe to enable
> +
> +### Multiple Probes
> +Several probes can be listed, comma-separated; same predicate and statements apply.
> +
> +### Examples
> +- All syscall entries: `syscall:::entry`
> +- BEGIN without module/function: `dtrace:::BEGIN`
> +- List available probes: `dtrace -l`
> +
> +## PREDICATES
> +- Optional boolean expression between slashes: `/ expr /`
> +- Evaluated at probe fire to decide whether to execute statements
> +- Any D expression of integer/pointer type; nonzero ⇒ true
> +- Can reference variables, built-ins, and operators
> +
> +Examples:
> +- Match only "date" process: `/execname == "date"/`
> +- Targeted PID: `/pid == $target/`
> +
> +## STATEMENTS (CLAUSES)
> +- Semicolon-separated expressions/functions inside `{ ... }`
> +- Default action when `{}` empty: report probe activation (EPID)
> +- Clauses can use aggregations, variables, built-ins, and functions
> +
> +### Minimal idioms
> +Count events by function:
> +```
> +syscall:::entry
> +{
> +    @counts[probefunc] = count();
> +}
> +```
> +
> +Predicate filter by execname:
> +```
> +syscall:::entry
> +/execname == "date"/
> +{
> +    @reads[probefunc] = count();
> +}
> +```
> +
> +## NOTES & STABILITY
> +- Probe IDs are not stable; prefer full descriptions
> +- Providers, modules, functions, names may have differing stability attributes
> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
> +PART 2: TYPES, OPERATORS, EXPRESSIONS
> +
> +## IDENTIFIERS & KEYWORDS
> +- Identifiers: letters, digits, underscore; must start with letter/_
> +- Reserved keywords (subset relevant to D):
> +  auto, break, case, const, continue, counter, default, do, else, enum, extern, float, for, goto, if, import, inline, int, long, probe, provider, register, restrict, return, self, short, signed, sizeof, static, string, stringof, struct, switch, this, translator, typedef, union, unsigned, void, volatile, while, xlate
> +- Avoid names starting with `_` (reserved for system)
> +
> +## DATA TYPES
> +### Integer Types
> +- char (1 byte), short (2), int (4), long (8), long long (8)
> +- signed by default; add `unsigned` qualifier for unsigned
> +
> +### Integer Aliases
> +- int8_t, int16_t, int32_t, int64_t
> +- uint8_t, uint16_t, uint32_t, uint64_t
> +- intptr_t, uintptr_t
> +
> +### Floating Point
> +- float (4 bytes), double (8), long double (16)
> +- Floating-point arithmetic not permitted; can trace/printf values
> +
> +### Strings
> +- `string` type represents ASCII strings
> +- Special handling for tracing, comparison, functions
> +
> +### Pointers
> +- Declared as `type *`
> +- Example: `int *p;`
> +- Safe: invalid deref ⇒ BADADDR fault, ERROR probe fires
> +
> +### Structs & Unions
> +- ANSI C-like definition
> +- Access via `.` and `->`
> +
> +### Arrays
> +- Scalar arrays: fixed-length `[n]`
> +- Associative arrays: `name[key]`
> +- Multidimensional arrays supported
> +
> +### Enumerations
> +- `enum colors { RED, GREEN, BLUE }`
> +- Values assigned sequentially unless overridden
> +
> +### Typedef
> +- `typedef existing-type alias;`
> +
> +### Inlines
> +- Named constants: `inline type name = expression;`
> +
> +### Namespaces
> +- Backtick (`) to access kernel/module types: `struct vmlinux\`task_struct`
> +
> +## CONSTANTS
> +- Integer: decimal (123), octal (012), hex (0x123)
> +- Floating: decimal with dot or exponent
> +- Character: `'a'`, escape sequences (`\n`, `\t`, etc.)
> +- String: `"hello"`, stored as null-terminated
> +
> +## OPERATORS
> +
> +### Arithmetic
> +- `+` add, `-` sub, `*` mul, `/` div, `%` mod
> +- Integer and pointer arithmetic only
> +- Division by zero ⇒ ERROR probe
> +
> +### Relational
> +- `<`, `<=`, `>`, `>=`, `==`, `!=`
> +- Applied to int, ptr, string
> +- Strings compare lexically
> +
> +### Logical
> +- `&&` AND, `||` OR, `^^` XOR, `!` NOT
> +- Short-circuit for `&&` and `||`
> +
> +### Bitwise
> +- `~` NOT, `&` AND, `|` OR, `^` XOR, `<<` shift left, `>>` shift right
> +
> +### Assignment
> +- `=`, `+=`, `-=`, `*=`, `/=`, `%=`, `&=`, `|=`, `^=`, `<<=`, `>>=`
> +
> +### Increment / Decrement
> +- `++`, `--` (prefix/postfix)
> +- Works on int and ptr types
> +
> +### Conditional
> +- Ternary `?:` operator
> +- Example: `x = i == 0 ? "zero" : "nonzero";`
> +
> +### Type Conversion
> +- Implicit: usual arithmetic conversions (C-like)
> +- Explicit cast: `(int)x`
> +
> +## OPERATOR PRECEDENCE (highest → lowest)
> +- `() [] -> .`
> +- Unary: `! ~ ++ -- + - * & (type) sizeof stringof offsetof xlate`
> +- `* / %`
> +- `+ -`
> +- `<< >>`
> +- `< <= > >=`
> +- `== !=`
> +- `&`
> +- `^`
> +- `|`
> +- `&&`
> +- `^^`
> +- `||`
> +- `?:`
> +- Assignments: `= += -= *= /= %= &= ^= <<= >>=`
> +- `,` (evaluate left→right, return rightmost)
> +
> +### Misc Operators
> +- `sizeof(expr)` — size in bytes
> +- `offsetof(type, member)` — offset of struct member
> +- `stringof(expr)` — convert to string
> +- `xlate(expr)` — translate type
> +- Unary `&` — address of object
> +- Unary `*` — dereference pointer
> +
> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
> +PART 3: VARIABLES
> +
> +## VARIABLE CLASSES
> +- Scalar variables: single data objects (int, ptr, string, struct, etc.)
> +- Associative arrays: dynamic, keyed collections
> +- Scalar arrays: fixed-length, indexed by int
> +- Multidimensional arrays: ANSI C-compatible, rarely used
> +- Variables created implicitly on first assignment
> +
> +## VARIABLE SCOPE
> +- Global: `varname`
> +- Thread-local: `self->varname`
> +- Clause-local: `this->varname`
> +- External (kernel symbols): `` `symbol ``
> +
> +### Table: Scope summary
> +- Global: shared by all threads, not MP-safe
> +- Thread-local: per-thread storage, MP-safe
> +- Clause-local: per-probe-firing storage, MP-safe
> +- External: access kernel variables, read-only
> +
> +## GLOBAL VARIABLES
> +- Declared implicitly on assignment or explicitly outside clauses
> +- Examples:
> +```
> +x = 123;            /* int */
> +s = "hello";        /* string */
> +a[123, 'a'] = 456;  /* associative array */
> +```
> +- Explicit declaration (no init value allowed):
> +```
> +int x;
> +int arr[unsigned long long, char];
> +```
> +
> +Initialization can be done in `BEGIN` clause.
> +
> +## THREAD-LOCAL VARIABLES
> +- Scoped to each OS thread
> +- Syntax: `self->name`
> +- Examples:
> +```
> +syscall::read:entry
> +{
> +    self->read = 1;
> +}
> +```
> +- Created implicitly; type = RHS of first assignment
> +- Can also declare explicitly: `self int x;`
> +
> +## CLAUSE-LOCAL VARIABLES
> +- Scoped to single probe firing, persist across clauses for same probe
> +- Syntax: `this->name`
> +- Example:
> +```
> +BEGIN
> +{
> +    this->secs = timestamp / 1000000000;
> +}
> +```
> +- Explicit declaration: `this int x;`
> +- Faster than associative arrays, use for temporary calculations
> +
> +## EXTERNAL VARIABLES
> +- Access OS/kernel variables and symbols
> +- Syntax: `` module`symbol ``
> +- Examples:
> +``
> +trace(`max_pfn);
> +trace(&`max_pfn);
> +``
> +- Names kept in separate namespace from D identifiers
> +- Read-only for safety
> +
> +## ARRAYS
> +### Associative Arrays
> +- Dynamic, unlimited elements
> +- Syntax: `name[key] = value;`
> +- Key can be any type (int, string, tuple)
> +- Delete element: assign 0 → `arr[key] = 0;`
> +
> +### Scalar Arrays
> +- Fixed length, declared with `[n]`
> +- Example: `int arr[5];`
> +- Bounds checked at compile-time
> +
> +### Multidimensional Scalar Arrays
> +- ANSI C-compatible: `int m[12][34];`
> +- Access: `m[0][1]`
> +
> +Note: `arr[0][1]` (multidimensional) ≠ `arr[0,1]` (associative tuple key)
> +
> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
> +PART 4: BUILT-IN VARIABLES AND MACRO VARIABLES
> +
> +## BUILT-IN VARIABLES
> +Automatically available within all D programs.
> +
> +### Process & Thread
> +- `pid` — process ID
> +- `ppid` — parent process ID
> +- `tid` — thread ID
> +- `execname` — current process name
> +
> +### Probe Metadata
> +- `probeprov` — provider
> +- `probemod` — module
> +- `probefunc` — function
> +- `probename` — name
> +
> +### Time
> +- `timestamp` — nanosecond, monotonic
> +- `vtimestamp` — per-thread virtualized timestamp
> +
> +### Call Stack & Location
> +- `caller` — kernel PC of calling function
> +- `ucaller` — user-level PC of calling function
> +
> +### Syscall & Error
> +- `errno` — last thread error number
> +
> +### Arguments
> +- `arg0` … `arg9` — probe arguments (64-bit)
> +- `args[]` — typed argument array
> +
> +## MACRO VARIABLES
> +Expanded at compile time, not runtime.
> +
> +### Process & User Info
> +- `$pid`, `$ppid` — current / parent process ID
> +- `$uid`, `$gid` — user / group ID
> +- `$target` — target process specified via `-p` option
> +- `$1`, `$2`, … — script arguments
> +
> +### Notes
> +- Macro variables allow parameterization of scripts
> +- Expansion occurs at compile-time, before execution
> +
> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
> +PART 5: FUNCTIONS
> +
> +## DATA RECORDING FUNCTIONS
> +- `trace(expr)` — store expr in trace buffer
> +- `printf(fmt, ...)` — formatted print
> +- `printa(fmt, @aggr)` — print aggregation(s)
> +- `exit(code)` — terminate tracing, run END
> +
> +## AGGREGATION FUNCTIONS
> +- `count()` — number of probe firings
> +- `sum(x)` — sum of values
> +- `avg(x)` — average of values
> +- `min(x)` — minimum
> +- `max(x)` — maximum
> +- `stddev(x)` — standard deviation
> +- `quantize(x)` — power-of-two histogram
> +- `lquantize(x, from, to, step)` — linear histogram
> +- `llquantize(x, factor, low, high)` — log-linear histogram
> +
> +## SPECULATION FUNCTIONS
> +- `speculation()` — allocate speculative buffer, return ID
> +- `speculate(ID)` — record subsequent actions to speculation buffer
> +- `commit(ID)` — commit speculative buffer to main trace
> +- `discard(ID)` — discard speculative buffer
> +
> +## MEMORY COPYING FUNCTIONS
> +- `copyin(addr, size)` — copy from user space
> +- `copyinstr(addr[, size])` — copy NUL-terminated string from user
> +- `copyinto(addr, size, dest)` — copy into DTrace memory
> +- `copyout(src, addr, size)` — write to user space (destructive)
> +- `copyoutstr(str, addr, size)` — write string to user (destructive)
> +
> +## STRING FUNCTIONS
> +- `strlen(s)` — string length
> +- `strjoin(a, b)` — concatenate
> +- `substr(s, i[, len])` — substring
> +- `index(str, sub[, start])` — first occurrence of sub
> +- `rindex(str, sub[, start])` — last occurrence of sub
> +- `strchr(str, c)` — first char occurrence
> +- `strrchr(str, c)` — last char occurrence
> +- `strstr(str, sub)` — substring search
> +- `strtok(str, delim)` — tokenize
> +
> +## STACK & EXECUTION FUNCTIONS
> +- `stack([nframes])` — kernel stack trace
> +- `ustack([nframes, strsize])` — user stack trace
> +- `system(cmd)` — execute shell command (destructive)
> +- `raise(sig)` — send signal to process (destructive)
> +
> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
> +PART 6: PROVIDERS & COMMON PROBES
> +
> +## PROVIDERS OVERVIEW
> +Providers group related probes. Each probe is identified by `provider:module:function:name`.
> +
> +### Core Providers
> +- `dtrace`
> +  - BEGIN — fires at start of tracing
> +  - END — fires at end of tracing
> +  - ERROR — fires on D program error
> +
> +- `syscall`
> +  - Entry/return of all system calls
> +  - Examples: `syscall::open:entry`, `syscall::write:return`
> +
> +- `proc`
> +  - Process lifecycle events
> +  - create, exec, exit, signal
> +
> +- `sched`
> +  - Scheduler events
> +  - on-cpu, off-cpu, enqueue, dequeue, wakeup
> +
> +- `io`
> +  - Device I/O events
> +  - start, done
> +
> +- `profile`
> +  - Time-based sampling
> +  - `profile-N` — kernel stack sample every N Hz
> +  - `tick-N` — fires every N seconds
> +
> +- `lockstat`
> +  - Kernel lock contention statistics
> +  - spin, adaptive, rw lock events
> +
> +- `fbt` (function boundary tracing)
> +  - Kernel function entry/return probes
> +  - Powerful but potentially unsafe (debug/dev only)
> +
> +- `pid`
> +  - User-level function boundary tracing for a process
> +
> +- `usdt` (user-level statically defined tracing)
> +  - Static tracepoints in user programs
> +
> +- `cpc`
> +  - CPU performance counter probes
> +
> +## EXAMPLE USES
> +
> +### System Calls
> +```
> +syscall:::entry
> +{
> +    @calls[execname] = count();
> +}
> +```
> +
> +### Process Creation
> +```
> +proc:::exec-success
> +{
> +    printf("%s exec %s", execname, copyinstr(arg0));
> +}
> +```
> +
> +### Scheduler Events
> +```
> +sched:::on-cpu
> +{
> +    @oncpu[execname] = count();
> +}
> +```
> +
> +### Profile Sampling
> +```
> +profile-1000
> +{
> +    @[ustack()] = count();
> +}
> +```
> +
> +### I/O Operations
> +```
> +io:::start
> +{
> +    @io[execname] = count();
> +}
> +```
> +
> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
> +PART 7: COMMON PATTERNS
> +
> +## COUNT SYSCALLS BY PROCESS
> +```
> +syscall:::entry
> +/execname != ""/
> +{
> +    @syscalls[execname] = count();
> +}
> +END
> +{
> +    printa(@syscalls);
> +}
> +```
> +
> +## TIME A SPECIFIC SYSCALL
> +```
> +syscall::write:entry
> +{
> +    self->ts = timestamp;
> +}
> +syscall::write:return
> +/self->ts/
> +{
> +    @delta[execname] = quantize(timestamp - self->ts);
> +    self->ts = 0;
> +}
> +```
> +
> +## TRACE OPEN CALLS WITH ERRORS (SPECULATION)
> +```
> +syscall::open:entry
> +{
> +    self->spec = speculation();
> +    speculate(self->spec);
> +    printf("open: %s", copyinstr(arg0));
> +}
> +syscall::open:return/self->spec/
> +{
> +    speculate(self->spec);
> +    trace(errno);
> +}
> +syscall::open:return/self->spec && errno != 0/
> +{
> +    commit(self->spec);
> +    self->spec = 0;
> +}
> +syscall::open:return/self->spec && errno == 0/
> +{
> +    discard(self->spec);
> +    self->spec = 0;
> +}
> +```
> +
> +## PROFILE USER STACKS (SAMPLING)
> +```
> +profile-1000
> +{
> +    @[ustack()] = count();
> +}
> +```
> +
> +## TRACK PROCESS EXECUTIONS
> +```
> +proc:::exec-success
> +{
> +    printf("%s -> %s", execname, copyinstr(arg0));
> +}
> +```
> +
> +## COUNT SCHEDULER ON-CPU EVENTS
> +```
> +sched:::on-cpu
> +{
> +    @oncpu[execname] = count();
> +}
> +```
> +
> +## I/O ACTIVITY BY PROCESS
> +```
> +io:::start
> +{
> +    @io[execname] = count();
> +}
> +```
> +
> +## TRACK ERRORS
> +```
> +ERROR
> +{
> +    printf("DTrace error: %s", probename);
> +}
> +```
> +
> +## TRACE ARGUMENTS OF FUNCTION
> +```
> +syscall::open:entry
> +{
> +    printf("open(%s)", copyinstr(arg0));
> +}
> +```
> +
> +## LIMIT TRACE TO TARGET PID
> +```
> +syscall:::entry
> +/pid == $target/
> +{
> +    @syscalls[probefunc] = count();
> +}
> +```
