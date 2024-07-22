Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A3A16DC15
	for <dtrace@lists.linux.dev>; Mon, 22 Jul 2024 18:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721673485; cv=fail; b=Gxa0/Ke8M+CvPYjWIdLcUfsNYQ8j87UL019Ayl4U7tOKy7aEtS7sDXC3TxY8YAoB9rz0O/JGj7Ism5CtzefHyuTCQBs6bPlYt8DyGq4gOsBiwac2chqvx9tesO6761EV6ENNKCU29XrFdnjrMXtNQbFH6WiN7MTXMhT0mHbnQpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721673485; c=relaxed/simple;
	bh=1XgKIQ6AQlvZuDIdin6phL5rgO8mpLQx9IVWq7aDQs8=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aT501xAuDUmOM+qxe717sq54bzPYVvOvryMUKz8ARFLoGg9QXf2T7xNN9I4d3ftWqT+A2HemKvrzwaQItoF2YzFtkIdmmEOWUHevJhaR3bGVteKOT9ZctO5p0BmWJAyjx0mgzIiei1pr9VSi4itrn2ZYvzI4P2aJZau7oolnIjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HG38vIZy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OX1Z1ZZE; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HG38vIZy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OX1Z1ZZE"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46MHMa7F004633
	for <dtrace@lists.linux.dev>; Mon, 22 Jul 2024 18:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=hfDNx/r7VuBR0owk2vWyFc8wOVD3blDn5al55x68k2s=; b=
	HG38vIZyyljc17PvC2dMyYBHadRxoYUzWOOPm0IRUOYWyk3N3yyc2LhFNkvuSjLN
	6EyTdq54RcX9HgCLhaa+lT/6PQs4ie2eUOQgyiWWvU7sX7b3BTT6R3XBa1qvN1Mk
	g6HWK7jteBUDuNWDTaSWFUiHw5jtZxbRkveyoUyjtfN67Hnzg4gD9D0yCUjfHLdV
	qdVHo2xuJ1+gycYJ8fYKRI8hoOTSQSm2OvEKHcIMYHJa1XXVH1LAgioe0i1X3aBs
	cUKwjFr/vNmUCrRoSRKZrDXBv17TbdmjQYyRxMUic+19RDFQVKeDTvPT8fyvKdSE
	p/SZzmEdx+EzO+UlaOunRg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40hfxpb0nr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 22 Jul 2024 18:38:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46MIOomi034412
	for <dtrace@lists.linux.dev>; Mon, 22 Jul 2024 18:38:01 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40h27kejce-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 22 Jul 2024 18:38:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FnZLWrePcTY8aNX0ENJsKd6Kz9IQipHhqLCArhhMRSBT8uh0sK3x4Vwi+arU8OA14Th22ORuc20eQMsCLhdCjA4ftstjUwwtawGgchtU2IN4qfeA2nQtoKybap8u/o4+XaFhXq7enUDi2QerX2yyenTiEez6tihGcudbC4baLqoPihXD8jcv0sAS9Vgnq2NhVOWSSXqhpVBg+xvoBeXsw3v0tNLL6FuNvqGiDRWsglLTeWmorbpC0ahIAZJiJl77aDyApzrcWBcbX/xJWQv4ZU/T3/MpdJlJ1v3L3WscIBalVVUwdss4ET5ByUEFmRyCLq5zkDmhjcQ3cLHAT34cwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfDNx/r7VuBR0owk2vWyFc8wOVD3blDn5al55x68k2s=;
 b=DOF+VcT85BvIg5xMTsTAlxh0FscbFIHEmyy8IW95rHsSr8ute6ACr1AJd6k7Jb2jUhxr2JuhWwt82wnW/3T9PkLlYI9WyLCIhvFsw/C53euCdghew55kP4PGXG1fb6ystmEOds9bOlgd8CYjLfAanxT8RuD12qlDsGY0HFyfrjGASSeGh7rciyg3hpPC2ScAnnzeP3tn1deXq3DXIT7NcYdu7v0J1XbLWVZd0ATNru71CycZuQow2Sc6qq/9j6EzWj73WutItHoHXiShhyzJxqzlQ2Ud3Ijvg/97WCisRpJLAF2WJ1i5XGpjm0HxRatklpaZ+PUSTH5bMyW0gZr6Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfDNx/r7VuBR0owk2vWyFc8wOVD3blDn5al55x68k2s=;
 b=OX1Z1ZZEfIXXTUqQMq8lw5jl/OLTpys0M5t8TRDitvV9BOEsM7idFqihFTcwbgHcwDDRd1sbOFkYYFH6khoxyZxoHaKct5Gc3+x9qVC3EybTCRTaVmSIsxdkPuXStUtP8Q8FqmesSZa9hROoUnTpvyZ8a5GxRaUFiQNNN3FavE8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CY8PR10MB6876.namprd10.prod.outlook.com (2603:10b6:930:87::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Mon, 22 Jul
 2024 18:37:58 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.7784.016; Mon, 22 Jul 2024
 18:37:58 +0000
Message-ID: <23931b5e-109a-82ff-e103-db73d6b1f97a@oracle.com>
Date: Mon, 22 Jul 2024 14:37:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 19/38] Retain probe descriptions
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240627053810.21928-1-eugene.loh@oracle.com>
 <ZpmINm9hojBpvWhP@oracle.com>
 <18d5f183-bab9-680a-a29d-6a7f76b60197@oracle.com>
 <ZprEB/BAGndM2Rxr@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZprEB/BAGndM2Rxr@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::24) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CY8PR10MB6876:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b36978f-9e53-4324-52ed-08dcaa7d68e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3QxcVF6UmlLZkpuUFZ1UG5PbVJ6V0xHSnV2ZnVlM21lR0RoTkk5T2NFTWNV?=
 =?utf-8?B?ajl5ZnBScmpOSVJOUHl6aDR5OWZhSWVEODdJQ29XNjRJcWZWVU5NZ1g5R1FE?=
 =?utf-8?B?M3pydzdaUkZNMW8yRFg3amZXdkw5b3NnQXIvZU9hcnAxbXpxa3RpY0RIaENi?=
 =?utf-8?B?K2R4Q0d3UEQvQ3FRdm1OWTd4OG1UTFJGZndOMEVtQVBqL25xZWEvRUxzYy9X?=
 =?utf-8?B?UGZvRm9VZ1l2eXVHZE9VdWFBSW0wdjE2SEpVNlRTN1FFbndtQ0NTUGFlY1U2?=
 =?utf-8?B?Z3BxWkJRVkxhN0JCSWU4WS91NzV5MU55ZytuUk1VMXRseWVCVmpTcnBmWXZQ?=
 =?utf-8?B?VTNXMFBFQVpJSTlOUFU0S2M3ejJrdE5XUGJhTS9XRktYODArb1JPbHd6azlL?=
 =?utf-8?B?NWxiOVJBaWwwVkJtaXdBNGlaZVV1R0ZHaG4rSTJQUHR0QkpqL09XVEpZRE1r?=
 =?utf-8?B?Nkc3Uzc3cEVYZE5naE1lWUpiajYyeDFFbytlSkQ4MVVUTG1wdVNOUmVkWDI2?=
 =?utf-8?B?NSthbjJzckFTUW9kQ1ZWTTgxVi9mbnk3NVF1VTYxSDlCVXJaTlBpNURTSGtI?=
 =?utf-8?B?cXJrNHdpbmpPU0U3WkgyVGdJQ0xsOHNYQ1JWbHFPRlVjN1RqL1FTRjhPbVBz?=
 =?utf-8?B?V0djRTZIbUxEdjFzdUI3MnRqSmJXZ3FmN2E0dVoyL3RiRk5SenNoclhFNG9r?=
 =?utf-8?B?MXU3dy9VdHVLY1E0aklYeG9LS2U3K29HR1FmYUNUSWUydExiOE1tL1NxaFla?=
 =?utf-8?B?eTAyQWQ3YW1iei9GZ0VsaUhDQjZPNWFlcnRSek9PS0RHUlBNdytNNXdsaTdu?=
 =?utf-8?B?RG9ESlZ6ZFRWOVk3Sll1dVRJOUlEOTlsaE9RdytTNWhtWXVEZm9pREF5WU9M?=
 =?utf-8?B?M1kvMlg2OHZoZXgzUEhoeDJDOUhTTW04MXNqUFB5RjZQTjJkcWM4dklyRHF3?=
 =?utf-8?B?TGxUdXJidWdXcGFHbHQxWTdkL3VMMDYrc0E2UWtzM2ZTNXFJcXRmNy9hL1FX?=
 =?utf-8?B?bjFwbDd6SjFXVC9UMENMdFlockRIbmdvNnZ1VDVIV1JCeDNmQSszRDBBL1FX?=
 =?utf-8?B?aWVkUGZpZEZ2NXBqQ2d3TUdwYVdRSTdVUWMxRFprU1hPSTVVTE1RY0wxcE1U?=
 =?utf-8?B?RjZZY0dpaUJ3d0J5V2ZrWUhkZExhdmVHN1hCTXhTc3FmQ3BOR0FNcmNBcWQ0?=
 =?utf-8?B?cVVwRmZDV3lrbjVXRUt4REtRMFYvZmRvUXFXT2JFcnhNZWlkQTJ1VC9KcXNt?=
 =?utf-8?B?MWdJZ25PYlUxUGZGNXNLR0YwbHJQQ3dxSzR1MHM2eXVON24zbEcvRUlsM3pF?=
 =?utf-8?B?Sk91NTFRWWtTV1NXbnhFS216cXN3WUxFcnN3S2ZRSjdWMW1HeUZ1eUxZZDlC?=
 =?utf-8?B?dGJXRERiVFFkN0E5bTVwRnFGM1FYblg3eWR0VlkyY3NnL2VMTkpkemdQRjNo?=
 =?utf-8?B?Z002VElZcTNKUk9mVXhlOWgrMmd1Q0p2VzZwU2lLVkhOUUpGNFRrWmgxV1ZP?=
 =?utf-8?B?ZGx4R0dvQWlCVmV1TU1xaWRnVC9vSWtMM05ESVozWjhiU0xnRHZGOWxNcVRF?=
 =?utf-8?B?dWUwbGNGbVljSXkrcW14K3NJaG5ZQXZiUklWbkI1NHZwRlFnMk1nclJVeC81?=
 =?utf-8?B?QnZ0dzFLYWtTTzNkdmw3ZzFWaUQrSGtkbUNJVG41Zy9TY014azdTL2lQWi8r?=
 =?utf-8?B?SE43eVdiSDZDdWhtUHgvSTJkVzVHRURxakhyM3JsVU8vU1ZwNW5FbmxUUUpE?=
 =?utf-8?B?b1g3eDFNSWxkeFBMbEVmNUlPb3hKTEJBc040Tk5yTXd0eFlOWkVkUzlNa3dq?=
 =?utf-8?B?ci9CZ2lYT2plN0ZxRUdhdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1Ayc0JyRzRnVnRuMmx2NlJxaENCVW9EdlR0SVlQc3IyZm9JZmREV0ZSMFk4?=
 =?utf-8?B?eVYvWU16dXpnR3dZaERuQVhrWmtzZlVWM0VyQ2NQblV6UFd3anQ4UWhHUkd4?=
 =?utf-8?B?aHhiUytuajJnY1R2enVlZ3VHaThrZUV5K212THBRQkFpOSt5SCs5V2RwTVVY?=
 =?utf-8?B?OW53bVJZOHhhMkxEVUphNXpuSGZhUS9DNFBiMU5LZ2FXSGs3K0hPYTJXTjFB?=
 =?utf-8?B?OXFlbWdCN2s3VC9nVzE1Wko1NVlFZExRS0FpVk1MSGc1R1A4b0ZvZzNsU01T?=
 =?utf-8?B?TkpFU3RMQ2VtWnlISkU1YkRaMlpOUFN5bXRKWDFnL1JoZktoNFFrSjk1cTY0?=
 =?utf-8?B?cFRjd3U2QURWSElNRWdOV1I2NGpQZVNOem1uVmxpWW16OVMycTIzNGFldndh?=
 =?utf-8?B?ZmNzNDlQZm1MeGFiem5WWStodnJjbHpGTlV5OTcrcUlvZUtLNURkTTRjclZu?=
 =?utf-8?B?Y2F0ZVVxelpGUEN6Z3djOWo0MXhrRUFIZ2duazUwVlhkMTFPMHBtTGxUYy9x?=
 =?utf-8?B?VUcxUWdnRGUxdG16UUN3alNEczM1NVNmaXRkNTZOdU5mRnVFN3o3N01Gb0ho?=
 =?utf-8?B?TXJtNDF0OW1ETXcwQXdPa2VQNWhpK1pFWi9tblZBR2dPTWpveFlrdmV0RDcy?=
 =?utf-8?B?U25ocjNJcmNqM1lWMUVhVlZxV1h6aW51UU9nVXpTYTYrMGVHM3I0LzZQaXlx?=
 =?utf-8?B?cWd3UHNwbm9BVXNYc1htTFQ4L3pXbnd1ejk0YjFoTC9KcU1GRG91Vk1iMzFM?=
 =?utf-8?B?eGhNQW1MU1BlR0laQmY4aWdCbUZKdHlrNkJwZDY0d2VSRVZkVVZpNy81NHAy?=
 =?utf-8?B?NFlTbHp0SXdKQnlvR3VaU3BHY25pOTV1N0QyNTRjWFFNRWlMalhrbUNXSVlr?=
 =?utf-8?B?Y1lpMFBzZWppUVpnaVVSVjF5T0ZIVVdXdkJqZXZteUN6RE9XT0hSdTJUaWt5?=
 =?utf-8?B?bVd6SFJYQkVSMlg1Z2hhU0pJdE81YWNCdVJ3V3M5ZWdVSFZyQnVlTGJNbnIx?=
 =?utf-8?B?M1ZJQlNDbjNJd1NaMzBaTXZtYkcxZjJlMmRnRnZKbUwrZkZyTWRheWlFU2wv?=
 =?utf-8?B?RFMrOWRRZnFwNFQvWC9uam5wMnV5WEN0T0w0cFUzS0h3czB0L2tjQloyWldV?=
 =?utf-8?B?b09KYVFJU1BFOG0yL2F3L1U4T0FiSkZpSlNPK0E0UGtNUzFrV2tHVXZkdTJs?=
 =?utf-8?B?MENneEpoUTRSVmk3WmVxMGV2cG9iUjhHWi95SndoU1hIcVpMeWJQUVppSHkz?=
 =?utf-8?B?NXFzT1ZOZDVlRUVuTlBaZzhsQ2ZSTGx6emdpQXNqT01qMjNKN1VYTjN0SUNQ?=
 =?utf-8?B?elp0QnpUNW9BN2ZQTmJaL2lkQXEzWk5GTmZRQ2lpYm5vNE8wVUsxMnBiTjFK?=
 =?utf-8?B?T2YzeFUwRlErcUpEL1VNanFTbnprN0lOc25wSU1reFRjRlh3MVJndmNIRkZP?=
 =?utf-8?B?SktzVDJIemV3WGdaTmJjOUpMK3NjbkwvWTlZcjJOZkFUdUJTK2hDempsNStm?=
 =?utf-8?B?SllBOUh1U2N6cTFOb2dWZ0FPK2thTUxTL01oOXJWbVhpNzYrYkR1dWhHS1JR?=
 =?utf-8?B?U0dEbm1hbGdvWjJxZmwwdGxIWFdOUVVlTElKbTFyYjFJTjU0WjJmQ1ZKTTF2?=
 =?utf-8?B?WG8xdWJldGduSlovc3R2T3JSb2tHNjBkcnRMUlVLcUxWc3gvcStVYmpjNmVT?=
 =?utf-8?B?L3QvaWo0WWdOakM4UUF0M1NTUGdGYzUrVkIxazFOZk5FTVJsVjBDbjhKbzRh?=
 =?utf-8?B?TGRLN1RIbUJDUVlnMXB2a3JlcmMvMVlBR3N3WS9qS3MrM2J2eFpFT3BKWFJV?=
 =?utf-8?B?bDhyRmJnRGZzeDNOcHhWbGRhWmJJbTJFYmZDVUNBcFFBbDZ6N0xjc2JlUXhq?=
 =?utf-8?B?RjVQcDBCZ3BoV3BPQ01BLzBLZ01hck9YN1kraElIWnB5NEV5U1dxY2JjazJC?=
 =?utf-8?B?dkpzSk4rcm9wNmJaUUkxQjR0WkRQQVFsUFJQVVlXWklQQVFNZWdQMURpejJX?=
 =?utf-8?B?cUxaa0RSRU1ENzVYWWd1VGhSeFd2b04zakd6V21EU2hrN29MYWU4ZEpRZVpn?=
 =?utf-8?B?Wm5UaExlNDNMVkwzQ0xYd0tmZzdFdUwzcjVGZHpUZDFOR0tBYTRUMG5jMHcy?=
 =?utf-8?Q?1xeWZqFzW+9BW+HlGwJyk8Pw5?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YPEEnaTSSPBtHQzZfZ9UyaKOYNFu8BOYoxgYy86Xv+ivM5koyY/mEB04v/kMpV0Mc3Zu/vhORqPGJUb3Wh3xetZkZ3sT0aFVqtT8N9Z3yadF4ey5/fgrc/K0RT9cIsE4dbxJ9ooZwL6mxOx6MUeFDCOYI010pbzhpF5e4aCICzDJXMLDRN+LEDjv2C/qWrXu+HtpKX9EGEWamvrj2XwGboS0/dFbO3Pna+Rd0CiJjD9roLRihqcBrkpi3ZC9fu8DD/rtR2ahIiP5KcooqJ42bQGg4BnAK+Ci8UWZt1n9bRxoniEvbP5BqxKMkMCK9dRA4cDkFvQ3wGAhqC0KDd1Sh7EjYgqsZ5i+ktVoUqDtTDfgkazaEs6FI/LIzc5P+VWZrT+c8hD8Ex+hoOD47m8KwoVCgGvwzzHHUdBOFRBEjJ4freTTkqF0x5J2ESdjEV0XSjHcqDGnzmcUGsqh9UGFk8qzpnVL927ys+NFPB676tM1glLuExQMQ4qa5+uOshxSynMXHCPlnVFVw0wchFlxSvLhf+zNXwpuMuRD3m6+U9w3LKBcqikLdc8+nVNMQELAiEQz1xmfJgV2obPlvykZvda2eAnRCwqXVCGBNOdXS5A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b36978f-9e53-4324-52ed-08dcaa7d68e2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 18:37:58.8238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L9beQSvx+OtbGx0AX+ZqY+LW/yjLGwyW5gvHn2CgYEirOxZG8oJnpFx6rq2J18Z+GkcTkXPv4kjZHiPp++zdUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6876
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_12,2024-07-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407220139
X-Proofpoint-GUID: C2BaYoFbnv_ywj2KHDTEL2cCK6E9Y2gR
X-Proofpoint-ORIG-GUID: C2BaYoFbnv_ywj2KHDTEL2cCK6E9Y2gR

On 7/19/24 15:52, Kris Van Hees wrote:

> On Thu, Jul 18, 2024 at 11:34:05PM -0400, Eugene Loh wrote:
>> What do you think about replacing the array dt_retained[n] (as in,
>> "dt_clause_$n") with a hash table that uses a string (like
>> "dt_clause_$n") to look up a probe description?
>>
>> On 7/18/24 17:25, Kris Van Hees wrote:
>>
>>> I think this needs an actual description of what you are trying to do,
>> An underlying probe gets a list of clauses to call in its trampoline.
>> Actually, the underlying probe looks up a mask in some BPF map and then
>> walks the clauses, calling them conditionally based on the mask bits.
>>
>> To construct the mask for a particular overlying probe, we walk the
>> clauses.  Each clause is associated with a particular probe description.  We
>> compare the overlying probe to the respective probe description to decide
>> whether to set that particular bit.
>>
>> So, a uprp has a list of clauses.  We want some way of getting from clauses
>> to probe descriptions.  The linear array using that $n was one way.  I can
>> move over to the hash table based on clause string name if you prefer.
>>
>> (Incidentally, a uprp's clause list is set during dt_probe_add_clause(), at
>> which point we do not know the motivating probe description.

Just to be clear, all I mean here is that dt_probe_add_clause() is being 
fed a specific prp;  dt_probe_add_clause() is not being given the probe 
description that led to this prp.

> Well, yes and no.  At the point of compilation, when there is not a single
> task yet with the USDT probes we're wanting to probe, there won't be any
> underlying probe(s) yet.

I don't want to get side-tracked here, but when we compile and call 
dt_setcontext(), we actually call dt_pid_create_probes() and do create 
underlying probes (well, for processes that already exist). FWIW.  But 
that might not matter for our discussion.

> So all there will be are compiled clauses, and the
> statements they belong to know the probedesc through the ecbdesc.  So, we
> cannot even count on the BPF program already existing with all clauses linked
> into it so all that needs to be done is setting the mask.
>
> I am not clear how this fits in the design you came up with.

The mask is constructed after everything has been compiled.  I'm a 
little unclear what you're getting at.  For an underlying probe, there 
should be a list of provider descriptions.  Once you have that, you can 
both generate the BPF trampoline and (for a particular pid) construct a 
mask.  Which of those two tasks you do first or second doesn't matter.

Again, I'm unclear what you're saying, but (in case it's helpful) 
constructing the mask doesn't need the BPF trampoline;  it simply needs 
the list of provider descriptions that BPF trampoline cg will use.

> Even for the case where we already have the underlying probe (and thus the BPF
> prgroam), I think it might perhaps be a cleaner design to not just store
> clauses in the clause list, but perhaps store statements (which gives access
> to the pdescs).  Then, when we encounter a wildcard match that relates us to
> an underlying probe that exists, you can just go through the statement list
> for that underlying probe and use a running index in that list to know which
> bits to set in the bitmap.

We only need the provider descriptions.  I understood you earlier to 
suggest keeping entire probe descriptions.  Are you (now) actually 
suggesting keeping statements?  If so, how about a hash table that takes 
a clause string name (like "dt_clause_37") and looks up a statement, 
from which we get a probe description, from which we get a provider 
description?  Would that be in line with what you're suggesting?  I 
don't see the value in storing statements inside of probe descriptions, 
but I confess I'm having trouble thinking straight about any of this.

>>> because
>>> retaining pdescs in and of itself does not seem meaningful.  They do not
>>> contain a reference to the clause they were associated with when the code was
>>> parsed and compiled) and it seems to me that you are doing a sort-of reverse
>>> association, and are actually (indirectly) retaining clauses by keeping a
>>> link of pdescs, one per clause.  And you identify the clause by its numeric
>>> id as obtained from its identifier name (which is dynamically assigned during
>>> compilation).  That seems fragile and rather non-intuitive.
>>>
>>> If memory serves me right, the intent was to retain enablings.  Of course, in
>>> the current implementation of DTrace, enablings are nothing more than probes
>>> because the probes have BPF programs associated with them (unless they are
>>> overlying probes, in which case the actual code that gets loaded is part of the
>>> BPF program of the underlying probe (which will be in the enablings list).
>>>
>>> When we are retaining enablings, it seems to me that it would make more sense
>>> to keep a list of objects { pdesc, clause } where clause would be the
>>> identifier name of the compiled clause (similar to a function name).  Using a
>>> pointer to the actual clause instead is (I think) not going to work becauase
>>> AFAIK the clause does not store a pointer to its own identiifier.
>>>
>>> In the end, this will largely do the same thing as your code (here and when it
>>> gets used later), but it removes the implied dependency on how identifier names
>>> for clauses are generated.  That could change in the future, and doing so would
>>> completely break this imlementation.
>>>
>>> On Thu, Jun 27, 2024 at 01:38:10AM -0400, eugene.loh@oracle.com wrote:
>>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>>
>>>> To support matching probes after dtrace has started, we retain
>>>> probe descriptions.
>>>>
>>>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>>>> ---
>>>>    libdtrace/dt_impl.h    |  2 ++
>>>>    libdtrace/dt_program.c | 37 ++++++++++++++++++++++++++++++++++++-
>>>>    2 files changed, 38 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
>>>> index 2132eda2..445cd602 100644
>>>> --- a/libdtrace/dt_impl.h
>>>> +++ b/libdtrace/dt_impl.h
>>>> @@ -300,6 +300,8 @@ struct dtrace_hdl {
>>>>    	dt_list_t dt_programs;	/* linked list of dtrace_prog_t's */
>>>>    	dt_list_t dt_xlators;	/* linked list of dt_xlator_t's */
>>>>    	dt_list_t dt_enablings;	/* list of (to be) enabled probes */
>>>> +	dtrace_probedesc_t **dt_retained; /* array of retained pdescs */
>>>> +	int dt_maxretained;	/* number of retained pdescs allocated */
>>>>    	struct dt_xlator **dt_xlatormap; /* dt_xlator_t's indexed by dx_id */
>>>>    	id_t dt_xlatorid;	/* next dt_xlator_t id to assign */
>>>>    	dt_ident_t *dt_externs;	/* linked list of external symbol identifiers */
>>>> diff --git a/libdtrace/dt_program.c b/libdtrace/dt_program.c
>>>> index a4b052fc..7106c249 100644
>>>> --- a/libdtrace/dt_program.c
>>>> +++ b/libdtrace/dt_program.c
>>>> @@ -163,7 +163,42 @@ dt_prog_stmt(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, dtrace_stmtdesc_t *sdp,
>>>>    {
>>>>    	pi_state_t		st;
>>>>    	dtrace_probedesc_t	*pdp = &sdp->dtsd_ecbdesc->dted_probe;
>>>> -	int			rc;
>>>> +	char			*sclause = sdp->dtsd_clause->di_name;
>>>> +	int			rc, nclause;
>>>> +
>>>> +	/* Get the clause number from the clause name "dt_clause_"$n. */
>>>> +	assert(strncmp(sclause, "dt_clause_", strlen("dt_clause_")) == 0);    // FIXME can probably drop this check (make sure the name starts "dt_clause_")
>>>> +	nclause = atoi(sclause + strlen("dt_clause_"));
>>>> +	assert(nclause < 65536);	// FIXME are we okay here with some arbitrary limit?
>>>> +
>>>> +	/* Grow the list of retained pdescs, if necessary. */
>>>> +	if (nclause >= dtp->dt_maxretained) {
>>>> +		int			newm;
>>>> +		dtrace_probedesc_t	**newr;
>>>> +
>>>> +		/* Figure how big to make the array. */
>>>> +		if (dtp->dt_maxretained > 0)
>>>> +			newm = 2 * dtp->dt_maxretained;
>>>> +		else
>>>> +			newm = 8;
>>>> +		while (newm <= nclause)
>>>> +			newm *= 2;
>>>> +
>>>> +		/* Allocate the bigger array. */
>>>> +		newr = dt_zalloc(dtp, newm * sizeof(dtrace_probedesc_t *));
>>>> +		if (newr == NULL)
>>>> +			return 0;
>>>> +
>>>> +		/* Copy data and reset the parameters. */
>>>> +		memcpy(newr, dtp->dt_retained, dtp->dt_maxretained * sizeof(dtrace_probedesc_t *));
>>>> +		dt_free(dtp, dtp->dt_retained);
>>>> +		dtp->dt_retained = newr;
>>>> +		dtp->dt_maxretained = newm;
>>>> +	}
>>>> +
>>>> +	/* Add probe description to retained pdescs. */
>>>> +	assert(dtp->dt_retained[nclause] == NULL);  // FIXME can probably drop this
>>>> +	dtp->dt_retained[nclause] = pdp;        // FIXME I think just pointing to pdp is okay.  No need to cache my own copy.
>>>>    	st.cnt = cnt;
>>>>    	st.idp = sdp->dtsd_clause;
>>>> -- 
>>>> 2.18.4
>>>>
