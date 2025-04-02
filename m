Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F7F6EB7C
	for <dtrace@lists.linux.dev>; Wed,  2 Apr 2025 23:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743637869; cv=fail; b=isvUFCPA42Rfpz9kWZQ7cwyINhquNutJrN4Lf5sln1EzevXmS1aVPlHUhcRa/GFGGhoLximDDabcPoCvT0GGj6BQkOam5wghHkYheKO/USg9xWhNBrEOdlXB9DF3FmEDUGvN/ajvCeZ2rplhic0Vx3wJwFs9zS9cBrtV0KuPyvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743637869; c=relaxed/simple;
	bh=XZHfhXbDz07Z9qADz01pz6fRUaHIEIz6G2zBY6Lj05k=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eMCXRX1ATNMGiT8DroNFASk9X79fXuBUmJnkLCwcXBTi7GLOHUc8NzJK0lGy2vJ01HfG4pT0W/fGOrtX2+VxM/U/uHjcZwRHXGHO85OM3n7G6bsPnXvub4QeFEaFmWAki2AriYLCn43+I2MWvWGSmH21kQzq+MIc5ipDvBqIDBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=X84254oq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=T+1e70xa; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="X84254oq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="T+1e70xa"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532NMrJW007998
	for <dtrace@lists.linux.dev>; Wed, 2 Apr 2025 23:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=ZusrTRxosjPs1PWFtsSRM4V7n7O+7Iyvjca0emLNXjY=; b=
	X84254oqcuptrh/5cxYymRaFLcLWvr0KBSUHrNBLBqBOwii7EEm4+aNo1nfxrBoD
	OppyoJ9FQzhKVGK2qRvLSuvRdM9JrLez3QVte1l1TzdQ7TWIGvb/NuI17ky8D4ux
	FhlRKXPq9xBbx14DMHW0LyfYnQVAPU5hYo6fBOofdCCIPThKbqXTf3WUnVAaNImV
	YRw0ScewQ9rEzBylQKb9EXnvAydlSaxeld6EuPxBYaGKSKH3K8HxIoyOqqIgQJvC
	9kPWs2Pwbls3DqrZ4CUy+E1S7TkJkDbP7iFl6WHV/YscSVSeXuHUlF+/jLIZbMI8
	k2ezZXdsXFjOM0CDTz5POg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p7n2c2vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 02 Apr 2025 23:50:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 532N2gLu016911
	for <dtrace@lists.linux.dev>; Wed, 2 Apr 2025 23:50:56 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45p7abcq59-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 02 Apr 2025 23:50:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+6GwP/DhEQRDghd5mvtpwPqK9xXbRfT+vOeR4bZeodcn19xqR7W0UJmUaXde4riLw5KuTXfwClQYoSDbooIb/ve3snDA36U0Ui9Owx5wk5TJs28ve0m0+eEOOXXPgKQJ9erKkIEmiUY8djqZ1d0UxT2Fvd0qaqS0GfppV6tgTqeEILBeXuDqrVHimTe4Gn2hE8xBUnhCuUvgpZ58TLd29expwYLqAqgitwbSGwFLq8g0GLQvw8unkZmxsrElcxLu/KR6KtC+3mZntYc7NkITf1gtcbOjECoqfHiwSpGAUiWFPmlE6DVF0ztQygnylfGEsZLLp/LxL//lfpRV3crtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZusrTRxosjPs1PWFtsSRM4V7n7O+7Iyvjca0emLNXjY=;
 b=CWRmsqiF5M5B5K5HMz4XRFRX548Y6XtgNcfeZ8rtYVipGZXqC/Q7tlk4kxLrqZ/tplk+1K+iXCaeiFotz0Y4TJf0tp0xHQLTXFGGe0HpEA69xznLG7XjffCQdtbGW2fJL3u3+buytQIe4+qX+1joKJhJ/ATfYALC9mag1ggijsLDYjof9PeUbVe2FB75K2EMExXWOXFau9leDbvJvjzAVnrISwVlLpH7P7iO1JSkKOucmnFUGcHD7jPhnhPVZlMHig3z4myhGkfvK1bRP9xHHy/1bxC7U9xzZ6jFRsYld84c7ANYTJNHm6fpHK1hvJDw93xbMTx680eU3KHtLjeNQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZusrTRxosjPs1PWFtsSRM4V7n7O+7Iyvjca0emLNXjY=;
 b=T+1e70xa/HjJgRU9yuRb27T4VJRQzCfDh0XKOvMsP4eibTniH0l10fPFz8njpybDoXdinkh2ChgIntKU6E7dQobvRmzu9LS0KmLeGddAVQcaZZvAh9aAuV4v2hEoq11ls6Lrw5t9faRwLiGiPp+VJH8/sfSAE5X5vL+AiqVBTi0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SN7PR10MB6500.namprd10.prod.outlook.com (2603:10b6:806:2a7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.36; Wed, 2 Apr
 2025 23:50:53 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8534.043; Wed, 2 Apr 2025
 23:50:53 +0000
Message-ID: <f3c173b7-e3ca-11df-9cdf-3401f6ae26e8@oracle.com>
Date: Wed, 2 Apr 2025 19:50:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 1/2] Add a cpuinfos BPF map
Content-Language: en-US
To: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
References: <20250331214501.24126-1-eugene.loh@oracle.com>
 <Z+t7UAN7i+Dkpc5e@oracle.com>
 <fd3e36b0-33f6-9d4f-7997-30dae143c6e1@oracle.com>
 <Z+xw22FDG66lrCkN@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Z+xw22FDG66lrCkN@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1P221CA0040.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:5b5::15) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SN7PR10MB6500:EE_
X-MS-Office365-Filtering-Correlation-Id: bee5c06f-47d6-47dc-fb5b-08dd7241345d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rm9od0VIOVY4NmFOeDYwWkRQUGNsTEVqMlRCWVdaMzBIZ1RycE1SMjZOTW1C?=
 =?utf-8?B?TzNJdEZMeTR2VVRraTVoUStsS09lbms2NnEwTDg4TUM4OXg4amhKZDF2SGNS?=
 =?utf-8?B?Q3FzNUVsRTB1Zy9mSWNYS3ZDRGZNUXQxZjZvTjFic3JMOVNqaHVGcmlBTVE4?=
 =?utf-8?B?dkF3SWF2eVNmdTFvcGJIRU14M3N4UnI0eU11OGI1WGFLTHo4UGk2UW9iRWtv?=
 =?utf-8?B?dGhzeFN5Ny9nU3d6N1BpR2dsNWJKSEdoempqQi9xWnFWQUV2dGFpWVNPd2hU?=
 =?utf-8?B?aXRMOXJ6dTJYT2huUzRSbnJqWlFNeXVJUG1WOVhlcHJtamVIQTVOUFF4ZjRj?=
 =?utf-8?B?Q3FuaFFSM2VmcEoxV04vU25mQXhKc0daUG1ERWpET1J5SHdnU1JBZElLNWJP?=
 =?utf-8?B?Y0ZWbkdMbWhmMVdodlhGbEZ6UGhVNmZ2bDdOLzZ5VTZPSXZabDd6Q3FQNHhh?=
 =?utf-8?B?UTgyeVplUUNjMFJ0NzlmYWZBNWtDSTR3OXQ5OU1wYVNwZmozOEoxdzBaWmRL?=
 =?utf-8?B?YUlwTHRJVVEycUlVQ2JDekhHRC9ud1h1VVZZTkIzZE9JYmF6bXNjUGNMWFBr?=
 =?utf-8?B?d2hPNWlacHRsNTY3S05vM0pXanRoMy9KTHFPODFldTlnRHJpWUNWS1RmNFAz?=
 =?utf-8?B?QlcydFVaT1NUZkpNcjl0NXFLbWxyNTM1cUlvYnJPaVZVcG50Y0RYN3FlQzVm?=
 =?utf-8?B?djV1RzNjbHFoTUpEWC9NcFRqeWJmY014bE1VbHl3NFNZTndjc2JOV0h1RWVG?=
 =?utf-8?B?UnkzZFhDRmExdHBWZ25NTG84NVM5SFVlbnUzTnBYanhJS2ptK3pianU1cGk4?=
 =?utf-8?B?R2FrVmJIMUJMa2RwTnp6NGhvKzVBZ010SnFGZ0N4dTI1SlMxc2lUTkwwWFhR?=
 =?utf-8?B?ZmVXUy8vdXdrRFVhVEEzVE5RWHNlMVlVWUFvQlY2NzVtNlN6WXVmMzBWN3FW?=
 =?utf-8?B?Sml3V3R1M2FQWmsxQ2xLNzVKL0g5NnN2SDJpdGRSeUVQZENFTWJZNURlbzJq?=
 =?utf-8?B?MWZYV2NCVmFEb0hlOHNvUU9aS1dPbklJUXZYY0RNUHliTFdjSUx6Z2F4TFJK?=
 =?utf-8?B?YXhMcU1KWmhtVWNJZEtlbUV2T2E4aHhZbHlnandKWW0rUjhSZFIwS1BJMHFl?=
 =?utf-8?B?U0pNQ0ZHb1NZYnFWMUxya3JsUUFoMzBkb0hsWDAzbVFwTlZDdGljU1AzYnZq?=
 =?utf-8?B?UWRpVi90c1lSai9hMU5uY0MraWplV0FGaTg4b0FXcHo2M1ZZRTlDcEpzdEFF?=
 =?utf-8?B?SUFJb2gwSTdwWkNjSC8yc011VWlSVXhUOVlaZno0c2FQTkh6aW5rRU1MVXVE?=
 =?utf-8?B?a20vVUd5TC9xcTJhcFRGNHA0ZnI1ZzRQdGtyRm1rVEFmTmFZL0I0Wnk2SDNP?=
 =?utf-8?B?cjVvMVpmUUhGS1dYdW5QQzB1QTd2cStDM2dwZ3R4TlFLUWV5R3VGdXNZc0JO?=
 =?utf-8?B?QUhTZVFMMXNaMkFEZEVJTjN5alRwTjFsQ0VLR0VEaUxKaHlsdEZYczJoRGc5?=
 =?utf-8?B?NVZab0txV1JtMmpLbUJnU2c5elE4dUl6cFBpa3loZWZjRUtrclNBQk5aNkwv?=
 =?utf-8?B?VENaaU9DTmVlS0tPNENITkRoQVdsS01TMG9qUTZuR29jQWtjcVc0ZU5qbkFJ?=
 =?utf-8?B?MmZ3NDNLOUlsWnNZN25VQmpvU2dNdUFqai9zeTZzOXg2L0kzMFEwakFsanVi?=
 =?utf-8?B?WlRQK0x4QlFBOGt0YnAyS1htTkV0cDBDZm9tVi9rL2ZmL1M2bzEyVVEzd1JQ?=
 =?utf-8?B?a0ZQQjluMHVmVU9Ecm0xM3pITVE2UjAyOWt3c2prOFd5ZnZLR2RlVUdYU25G?=
 =?utf-8?B?Z2hkaDZTOS9NOTAza3ZRMkhJYURYY1NXcFkrQmg1c0hpY1gwd01NRXVQeitC?=
 =?utf-8?Q?cLWy3XIPmW0Y0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlVHT3ZtWTNqQ0xSVE5TU0FTZVRtWVJoTnhBQThWY2N2TzI1SWVlMkpLRC9G?=
 =?utf-8?B?SEk0cmI0ZGk0M2VDZGdGQ1hYd2xwWnR5N2IvWVUzZnprZnQ5b29NMmJaVDVp?=
 =?utf-8?B?Mmc4S1Q5NGhRV3p2VmpXV1RkOHE4aXhoZVVsbkl5RmNIMHhuUTluVUk3cFN6?=
 =?utf-8?B?M1k2UDlxRWlOeGtpWTFRcHFyOFZvaEFMOTVVMkIxaWxEdS9JTGtWMXJuVUov?=
 =?utf-8?B?MFI4M0JCWVYxMVdacWthN0hVQmJ4Y1ErM3dkaCtYNzJmc29JcnRoNHZ4LzhW?=
 =?utf-8?B?bnJWRFRubzQvMFU4T29oM09kQmVJS21ZdEhYcTZvczJzbCsxYW9CcWltOTBT?=
 =?utf-8?B?OURvSXh1aDQ0c1k4akd0SjYxYVVHL0FhdW1sQlhwQmhqZktyZ0ZjUjFYMzl0?=
 =?utf-8?B?UGwycXBNa295WVRQWEJ5WFhzVmpHbzdwQ0ZSMjdXbTVDMWVJZU01TjZKZHNX?=
 =?utf-8?B?L3BhOWQ5RHUxR3N4V09wcnI5N2VPdmI4cWRZOVVZQmR1OE9TVGRKbi9TMFJM?=
 =?utf-8?B?M2lnK29jMU9XYlRUZ0dObFdsNmM0bFpyTjVsQTNJOWprMWJIUmxHSnNWSUpE?=
 =?utf-8?B?R3M0ekg0UTcwVzdYYUtPMk1GVVBsdm9wNVFWMUdhd1NaK3d3Y2NnRGdFNVox?=
 =?utf-8?B?SWRFWWRQcDdaUGtFaFVxWXIvanEwSDI5bkVkc0o4aWt4QXh5Z09uS09wWGtt?=
 =?utf-8?B?S2g5YVR6bEJuNEJJRnNBcGR0bUt2a3FUVUpLRUlHLzQyMUszdmR1WVhzeHo5?=
 =?utf-8?B?VXphUmthUm1ZdXZBOEZEMHc5V3Z6VE1vN0tqK3VVb0U1dkRYYWx4dGExTyt1?=
 =?utf-8?B?cDJyRWQwcjczTEE3SXhuazh4bEV2U3dqN3dqOFlJT2ErRDl5SkRoSjdYTnVl?=
 =?utf-8?B?MjRqeUVlZ1hhUmducXRycUtnZGJLRDZkS2ZyeFNQa1h5a29vZEpJVVdmMjdj?=
 =?utf-8?B?OGRoeXBkYXYvRFUrTTI3aEw5TlE4K0tSTXBIQWJvVzNiN0VvbndlUXgvOXZB?=
 =?utf-8?B?ZjRFa0p4NU9KNE82MGFHS0NjODE5VXVPL3FDTnAyN0VpTVRKYys5QWI0U3F1?=
 =?utf-8?B?MGZHU0xFd1VWeUY2cEFKYzgySmh3alVZUnNYZ3BxUlVzUG1ZcEFxYUpvTVRr?=
 =?utf-8?B?L0RnSDBnWUpVb2hGRjNzZnBUNDVXdDUxWDRXNElsQzI1YzhHSkd1enFoMklR?=
 =?utf-8?B?bzJENWNEdEZ0eXlFdTd6WGVlRStFSExPTHp0akJQaXdmR3EyOUQ0aTU0YTVn?=
 =?utf-8?B?NjNxcEdmSUUwUlJqVXFjRXNEK2dQZ3JMZDNJeVFnMUpiYkRXbVNUZ3hJQ3dP?=
 =?utf-8?B?YUR0U29EdGtId2UxNXM2b1NxZzhwSW9WSU1CUElMZzh4dTMyOHRJVCtDczBH?=
 =?utf-8?B?QitQNEEvbkI1TzNGenRrcGtyQ2hINnRKOEJtWitSUlBBbzR2UUMwNDhDeFhB?=
 =?utf-8?B?RjkrcDEyUHBicVA4ZS9NUklwbk14d2hMZmlUWnFXLy9KbmUwVnM3S1JWcmht?=
 =?utf-8?B?YVJ1NWF4dEllR3JMUXFuMU9UV3BpTU05cGczcnRTWlcrVGJRQ2FSSU01eXRu?=
 =?utf-8?B?M3VQUUsxQzlIbjNNbE9UZnRzeWwxOE1wSVNJa0RHak1neGV4ZkZLSEkra3NO?=
 =?utf-8?B?V2c3MWw2ZEpwWVg5QUppVDFsL2ZUWkxQZnlxaG40Q2x0Z3c4YitKeDV6YlVY?=
 =?utf-8?B?TDMvS1VWdExKMzZNaXBwUmswSURkRzI2OCtSbWRLd2piTDdzK2xkdGxYeVJo?=
 =?utf-8?B?UkczcDcyL1ltMHVpNlJyRlRBVHhSdjRyYm0vbERWbHNGMHZFRG8yYjJTVWxv?=
 =?utf-8?B?anlYY0pvVFpQL1NNcVlrKy9BbzV4TisveWc0am10aWZ5WnlNQklzeDZkTFpt?=
 =?utf-8?B?NGVoNDEvaGlxRUNNWnVpWDc0SUVYTHkrRjAxSkN4UDVWMXh1MjdMSi8za3o3?=
 =?utf-8?B?cVBZeS9LRGsxRTVIOHcxOTl6U3pqV0pEdTNLWk1JaXhZSXBINTNWSXpJYXhv?=
 =?utf-8?B?b3ZzTTdGRzkxdGs0RzNwekY1TE1GNlRUdDZFaDZmUUdvcThRdzBFYmpwZFlI?=
 =?utf-8?B?aWJZM3J4MmN1Nk41SnREUEpkakJGSldsU2RpS2gvM0lkUFlBYjZmWWR6N2Mw?=
 =?utf-8?Q?lZRs7nD24f5vaCMHjaB/zYhaY?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mWXCvcc04PFOQMMQvgjO60ogaoOM806OQBJ63PityBeagFkC1a9SHdLjilqtJ+xJC5H5KnWGgJ560c2WCHN/OXPTj5r+PjDmhYZ0/83Dz7/9gqrfWjEouzXZpSKzRao9z+RYsonyms7FGwPh91mN3nHgtk66m53vE/67WN/eqP2abULvkIO00UN4bqbR1Hz5BZZ/AhcOB3CXzAKR4xCUexdiTkgn4Evs0ln2WF955HvJdUHp1lM/kBCYTC6OScttNIMfIHNWWUI4hs9xvpKOfUFAKqZKHxqgWc95Fa+hGT21gzF+O9HGyz9SLiZtKlPGFX7eX18Zs0uDEQCRwgk5D0ZhZ5JA+3w341pi2vhAf71/oNexj3CCki8gEldhwXYuYYu4RghFWNWA2Nfehe+46LBOw7UR+ci5r16YdsCkF5s45pyftrNvtZmeQaZL4GsJoc17E0xk1MLIy5XpgMzGNy5jzKMy+LBILYjlfUkDsnXw7hnacDuKTVEypG9cCBklV/+zj2VjqebQga+/AJ6P7xED/d7PjCZv6utCWpja6MVSvqTiaTNUEL0RN8od8ORFl0ELZslj7He7MxZIINa10lluqm3VpFvSzceHKIJY+0A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bee5c06f-47d6-47dc-fb5b-08dd7241345d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 23:50:53.6274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WCIOvneTYGr11FXTEOWD05viCKmGao1SbvaQRIq9+rOSioQUVopNBkkgW+O/DZRaU+qXw6Dra5sXFfYo6/UftQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6500
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_11,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504020152
X-Proofpoint-ORIG-GUID: oNcSvfHuSvxVAkhtAKxKcWMWrOT3eDY9
X-Proofpoint-GUID: oNcSvfHuSvxVAkhtAKxKcWMWrOT3eDY9

On 4/1/25 19:03, Kris Van Hees wrote:

> On Tue, Apr 01, 2025 at 06:54:29PM -0400, Eugene Loh wrote:
>> Here is a proposal.  First, two observations:
>>
>> 1.  (As Alan pointed out to me in a facepalm moment), one can write a simple
>> D script to check enqueue_task_*()'s rq->cpu against the current CPU.  He
>> and I both find that the two CPUs are generally -- but not always -- the
>> same.  So, the strictly correct thing to do is use the rq->cpu value, even
>> though you can just use the current CPU and be correct "99%" of the time.
> Sort of what I expected.  But nice to see it confirmed.
>
>> 2.  A BPF program can access per-cpu-array values on other CPUs. Well, I
>> guess you need commit 0734311 ("bpf: add bpf_map_lookup_percpu_elem for
>> percpu map").  That's in 5.18. That is, UEK9.
> We oculd get that backported I bet but that doesn't help upstream.  So, not
> really worth asking for a backport I think.
>
>> So my proposal is to leave the per-cpu cpuinfo BPF map alone. Perform a
>> runtime test whether bpf_map_lookup_percpu_elem() is available.  If so, do
>> that cross-CPU lookup -- the 2/2 patch I posted -- but using the new helper
>> function.  If not, use a simpler on-CPU lookup, which should be right "99%"
>> of the time. (I have a simple patch that uses the current CPU.  Pretty
>> simple.)
> But...  95% correct of the time doesn't quite cut it.  I could see some quite
> useful case for using these probes to specifically capture the times when it
> does *not* originate from the same CPU.  Settling for 95% correctness seems
> like an odd tradeoff to me.  Especally since we can get it right 100% of the
> time without too much trouble.  Just convert the cpuinfo map to a regular
> array map, and instead of indexing it with a 0 key all the time, index it with
> the value returned by bpf_get_smp_processor_id(().  Then we have code that will
> work on all kernels - no special casing.  And I do not see there being much
> performance difference by going this route.

This patch is withdrawn.
