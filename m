Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E73C257ACF
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 18:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771525055; cv=fail; b=DDbke4BU7ASV/7IFjzHn2Th58CosTJhrDi5cG2ClvcUQY+fjFe27MMHkmF22g0zL8WOGnqSHW7XuXp9ySYyIV2IeMr6abUeJZF8MJQRljxPxPskLD+ViXWAvo1c/hYtzoxc4XRhnMVqRxM/E63fAzTE/nsXzGPSXJHecSbEu3EI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771525055; c=relaxed/simple;
	bh=KHvLnSD37f44VOx0qiXzREb/sWLHxaYzom43VOI24Vk=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HUF1fYLz4ODepCPibivKfr8sYsDLoN9wDDZ3gKJYIiyJJXf2vh94YgbXrvPHQgPA3HFVn9COdn4P+5J2fU8NKn2TiTrC3CA4ZOFTkApeZQPDqSv/RvuUCVogsX+KFfjeBzy/bfIbtI30ZtgEkAnXYBdMtOTUOe50iqujhzAFO00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IJrNu+60; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BhIsvTr/; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IJrNu+60";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BhIsvTr/"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JH097B3789122
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 18:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=LqApfiaIwusk3BSS8+xafCbZesynXgw4QlvjBj83s0Y=; b=
	IJrNu+60ztj9G/zwjAPIIRUf2ExFQZofzF77ivpw+lLlAJX+cO/q1+ROpV2koTVL
	HpQ/xtzI7au/rEKaGojx6UV/N0lrak9IOgijMxcAzT+StxzjEV49hqjaK8R05/T4
	z6PVrT6u5thelems7pB1sxS0E0s/0tmo/2StzzjfRSLA3Jb3NaiXXR5xISRQY9Sp
	L9mAZQw0Hf6PO1VXQZbXHCL4Div3hRR4LGkZWYDairGpOJBM6OHOoD85mlDMc0QQ
	j6kXFrLHmtZiXkEgrPeCh4tWBNta0fs+D1XRoACCbNQyRGE7bCxDn3OU0yIqy8jD
	IAr7LQFQx4WrQE+FtU6UNw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj5r7y65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 18:17:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61JH6JFo033315
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 18:17:27 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011029.outbound.protection.outlook.com [52.101.52.29])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ccb22rnr0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 18:17:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pd+wJj+z0Fwwl0J96m/K38pG5GyFtBHqfU8+hbijwxuMSUXeSgMaUaQ/aOS3R70UoPRv2yFtUoCii/V2hCEALSXaoAPv0KqG8gCeNlUqFtZOr+wvhJUYM+UgS3gOZM1c7kXMugbPuqmJXl6VrpZ42g5ahFensQBH9G8oJ4LA/EnaM2/xfLKhOAhDhJtUX5dbV3ToRuZSJJVGragsv4JmOqhaenyZ887PdqqBdLFL7KOxSC4jwPSK7/pBac5ZwkzMCMbsWnfV/mNtIP6oGVc8UsTMWHnjomdQmGIm/SrWoDrGPEyiiKjmyCjjLHxnLxdTw/wu8PkB2nxqyaLbEiqOhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqApfiaIwusk3BSS8+xafCbZesynXgw4QlvjBj83s0Y=;
 b=NG9kEQWzTXJEnJx2+x7KIGZalgdSMVZaHI94UvswnLNN/weGlP0RIvlNqXtZku25hsMP6GIpYNO82UYIWCjqF/Eqbp22sItIZ76hDioZEhHMkWzNYawNl0GYr79Z36H8Mnxswaz9fv+5MD+087WHVbPBoHxGiScf2LtjVADY52GIUnEIp5bxoh1EaSf45UMzz39nCQhnJ3gkgjH+rqxox1to0HMPE6Ugmi90XEA0BgaLILDNib3Hdi3tImhRi9Y04C9AxiP43yWmpvdZBkoSS63OvKqKkfhGgTEjZTMphU4irnSm/q7I7KsVnEBhLB8ldZCW9uU1m3YUBu1fyE2Qew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqApfiaIwusk3BSS8+xafCbZesynXgw4QlvjBj83s0Y=;
 b=BhIsvTr/TqrTjUdICtR0Dz4gwJtoLXW1fUvN0BH/1FOyc3HD03hJ62oypBAyncUdPXUz3yllLcp9Ykykq+l/J4056vfmB+MC8sEbM9yXS0zWFUrMJs/FD6k3bYCPu2MMTLmk/+xh77NMRbGB2cWUQZKCkNICGTHcYJbf5mIp4Ik=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH2PR10MB4391.namprd10.prod.outlook.com (2603:10b6:610:7d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Thu, 19 Feb
 2026 18:17:23 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 18:17:23 +0000
Message-ID: <39f1eb11-7a01-b68b-61d3-18aef49394d2@oracle.com>
Date: Thu, 19 Feb 2026 13:17:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] configure: add support for
 --(disable|enable)-dependency-tracking
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB752215A59CAA79B00AB329F6C26BA@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB752215A59CAA79B00AB329F6C26BA@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7PR17CA0028.namprd17.prod.outlook.com
 (2603:10b6:510:323::8) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH2PR10MB4391:EE_
X-MS-Office365-Filtering-Correlation-Id: ce01930a-2e0f-4bdc-05ec-08de6fe32111
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eSsrdjBnbUxRMmNXcUVBYU0yWmI2YTJWeXhPTUhIbXZkNXgrVzF6TUxPSitk?=
 =?utf-8?B?Zjc5aUx3KzQzS2JDdHhmRzUyanRIaVNlSjgvNFRMQ280NTJuZlVuWTRTZXVB?=
 =?utf-8?B?TmVLdkMrN1RBQThTd3JwN0VjWmljK3Nrei9ETEd0WjA4N2pRRnlKaFpKNW1R?=
 =?utf-8?B?N1EvUkxMSEJoeUZtS3QwY2VtQ0pPSjUwQVFpU3JhTmlpTDlIMlpxeVdRaC9m?=
 =?utf-8?B?T3VjLzF6dVd1NVdJQlhlMWdNNmRVL2JMYnc5UVBBa3NNbndzMTVNMFBQMGpW?=
 =?utf-8?B?dVdpRDVVMjRNRWVncnVZL0tXUCs3UFpIR2IzdzltQm1HeEg3emY5ZlBSVEZ0?=
 =?utf-8?B?YU9NY3JBdjdvVHRxV2M4cndiVmtKcUZMd0phVW05TG5rRGtOWmkrN2R3ZmZa?=
 =?utf-8?B?UExZQklaZUZUTDhYUWNPSFdJK01pd205TWplUGEvZkNiTitNZkhDdVpXaEk0?=
 =?utf-8?B?c2xhYzdBTi81RHlENXhzRDZHVjVseHMrbTd5c24wSUw3Z1ZRN2x5eEN2NG1P?=
 =?utf-8?B?WmR3MGRqRnMrOHY3ektNSktWcHIzZHA3MEJyZGZlTm5IVUdhcEUzVG9WWUR4?=
 =?utf-8?B?NDM4c215T3FsR0tFcEROMnRyeDJjdDl3YlM3SFJCb0oxL05sVGZxbjZTek1C?=
 =?utf-8?B?WjJId0RVcmJ2bm40WVRPMVVIdnBDRWN6WFFCenY4NlZTN0QxQkJkVzhMSUgz?=
 =?utf-8?B?MjdPUVlVM25VU0llNW1Xc3pzRkp6QVRTb1dDSE9JamQ2eXZodEhqSUxYM3hR?=
 =?utf-8?B?YUJia3E2SWJpalk5dVh2SnZ0aHpzSU8zSitSby9BbklXNzBzVlY0M3N2cll3?=
 =?utf-8?B?NHdpU3dRNUtsWTNzLzlLRUdxRW9jKzNydkJISDRkZnd0aFVUVGNwYTQzd3l3?=
 =?utf-8?B?WnJERXJMYUhJVFBtL2FoVitYL1BBcmU0akpqdnRXdXEwTkM0S2RqbnQ3blFE?=
 =?utf-8?B?TXQzZElUL1pqb2NrdDkwZmtHcDhSZ3VqdTNWdlg1ZnQzcmJDdEx4RU40M3lk?=
 =?utf-8?B?K3NBME5sTitxT1pXODdCQ21aQnZHTnFuZVg3Mm9aVWR5ditWVEFFWFoyVjZz?=
 =?utf-8?B?d1hKZlJGdExxdVdBNDdBWUl3aVNSRGgxMWdFeTVMMUE2WXdkZkpydGdrcy9G?=
 =?utf-8?B?RTVuYlJ6YnlMV2RvaEN3Q01PRlZvNUoyZ25NcUNWU2E2Q29uN2xsSU9HODdE?=
 =?utf-8?B?azFQU3VpSFV6aEIvVHBlMlJTOXYva1NrSVJzZzg2eHhHc21FeTZTU3ZSc1VO?=
 =?utf-8?B?MUc3S1VWTEdRQWtRWEsySUF2RXpia2VTUjNDa0xtWmprYXM3RGNWQ0F6SFQ2?=
 =?utf-8?B?S3R1emkrZmN3S1d1c3pDTlppdzgvR2lZNzBiZ0M0a2lXeXpNM1BmalNJdm5j?=
 =?utf-8?B?V2JWSHNiazk3TFN1WE9naHA4WGtCN2llZzRFOWc4bC83RFBHcitqQ0xNR1V6?=
 =?utf-8?B?azErN0E1KzlLeGtleE9SdnRselJNSWQ1NU5FS3VhUjdiWWRsVjFPcHg0OGhK?=
 =?utf-8?B?cjNmQU5mazZtUVZjOW8wVW83NDR1SiszdVBVWUpGWkNtODUyanZDdEJSOVBC?=
 =?utf-8?B?RlNXTnV1WjNveS8xRjE4LzBUb1JhUmRsSWxFUkc1ZDJKT0JoNi9LWWtsYTlC?=
 =?utf-8?B?eGp3OFg0L2grbzNmVm1yNlRiM2RGbFJRdDBOc3pnaGl1dDBOU3ZCczRxcXdW?=
 =?utf-8?B?VThOZ3ZiMFUwbXFDbktqNVBtY2R1bktvMm13ZHVZV3lhS2tHYWpZV3FlUkR0?=
 =?utf-8?B?RnFTTDJ0UVlzenh3cGxwNFo3eXprZk1KYUtSQVZnSHU3bWVqckV5T2R0aHJi?=
 =?utf-8?B?dmJUQWU2N2lQMVNKMzU3bUNvSzFtRFcrRFVOOTNHQjh3bFQzcG1RVU5XYnQr?=
 =?utf-8?B?MUFrN1F5U0Q3ZlhLZEJOeVJ2ZllhQUI1QytnTDk4bjBsY0tzMnVLeGI1Nncv?=
 =?utf-8?B?a2E3cHVQaGpacWFxbnU5Yk5kSnJpYS9haDdzSGZ0QllCanBINVNvK2YrT1hl?=
 =?utf-8?B?SDdjNzlkR200NU5zMkJoNGUrL01BbHhXelVRY1FGNUtGQkNKVEx2NzAwamZi?=
 =?utf-8?B?WUowcVV6SEJBdTJYK2p0QnI4SGZWMFBOcExNRVl6cGxkeFd4eVhueUJZNzFR?=
 =?utf-8?Q?FkJM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDI3TWhUQVdhckMzTlpGT1R2Wkx1cVhyWDUvYzVRcG5QWlg5U3VZY1N0Vmh6?=
 =?utf-8?B?MENxelFxRGFOSVFtTTdqMlpPTExFQVR4dXlhZGxHQk1yOVVIWkFac1BVbnQ1?=
 =?utf-8?B?VFhkczk1M0dNNUd6WDRMSlFBQ0tkY00xaHYwbGxHQlhyZXhKcU9jSFFDSllB?=
 =?utf-8?B?bFBWSURLbHo3NW9Qdk9LdHNFc1NIcEdDQkRwUzRsZzRlVFJ6R0s0UkozNWRI?=
 =?utf-8?B?NVZDbE9FU0lGRzRkSVhmL3RNSmI0TWI2YllWU3dIVHkyNFhKOWZaTmVKbXJJ?=
 =?utf-8?B?Q3F0R0xWdTdOWlBocmtMU0pnWGI3OE0xZHRBS2ZPVVpld3Nsa3QwYVUwcUF0?=
 =?utf-8?B?bGk3VTQvSURhQ284MHoweFBvTGUrN1lDQmdwTjBNN29yWjYxUzFGb21HdVlF?=
 =?utf-8?B?NERMaUtUajhMN1ZUTm9tWk5zUDVNUVEwQWNPMFJlaFF0MXh6ZFhaV0Z3WW5M?=
 =?utf-8?B?clg2bDQ5M09Cb2poc2RhZW15UWxIR1h5QlU1UmdpdDhkT1VVV1hDdnQ4bk1G?=
 =?utf-8?B?VnZSM0FzTFFwQnlNemYwUm80blFVR1FYK0FqdlFyYWhNdTFPd3MwL2EvbEcz?=
 =?utf-8?B?Y3hwd3Q0U0lXVTk4MkY3M0lHVklzb0E4dmpYUkRhQWdaVDBFQmxYb0ppQWtC?=
 =?utf-8?B?VFZKL0VqKzZmQnZSZ01mbkhCMmZaeWRpakp4b2k4bGNzU0hXcnNPaER2bHhp?=
 =?utf-8?B?eFZ1aVc5NS9xa0F0VUVyWkFBMnU1UGZHWlNUYkMyTnQwWlB6TnlXVjlDVEZi?=
 =?utf-8?B?a1NteEdnUTY3VlZIRGVGNWVtd094dVZQSFQreHl0QWZNaFovZXc2TlZVTDRN?=
 =?utf-8?B?Z2dwd2U2bUVCVlpYTWpnN09yQ01hbXl5OGxlTGNnbmNhRzFwSlNzdGZxR2VI?=
 =?utf-8?B?TmJES1BRb3dnVFRjeXRSMisxWmhFS0tWZENIaWVFakRMaXlkeGxjSmV5ejVj?=
 =?utf-8?B?bENUQmZZYWJJdHp0cHgzT1YwUnd1ZEtWYmNyQ3VlRlUyb3lFUm1hYXZwbWVx?=
 =?utf-8?B?YUdjblo5bGV4L2M4NXVyRG5xay9OL0I5QThoWDhXNjBTejRnaHZmeFM5dWt4?=
 =?utf-8?B?TFA5SjVhaHg0ZXphcDcvT2RNZWJlUThvV1pzdVladm1TZ1VlWUJZeFRJbmdS?=
 =?utf-8?B?eCtMWEZQYjl0aWZ3bWthamNpc2lQZTNsNFd2RGF0cEpLTlNIbXB5Z1phaGhL?=
 =?utf-8?B?eFhUZnlaYk9uK1FJY1I0ZlAvTEs0TnVKa0UyQllVZmFmazZLWGY4cXlrT1Rr?=
 =?utf-8?B?d0pYTkdQaTZQUityd1FJNktCd1M4cHlPWVN4cVBxZVRjdGlnNVJKNm9UcWdE?=
 =?utf-8?B?Z3JWUGRmVFFDMENtK1hDL1dhSGRSczNDSDY0SlYyb2R5eFhrNmRaamJlWk8y?=
 =?utf-8?B?V3dZWExkL2dpK1JEY0NxTGV5WWFBVzBhalVudFBCL1MyTi9DUGk5QUs0R2Fq?=
 =?utf-8?B?L096OS9HU3VRTVg2R2lJVWhMVEwzWFhnUUlVRXQyZ0FNRXg5WXVXMCtjam1y?=
 =?utf-8?B?WWxaMlM0U1NqV1BMcGxmU0NtbFdhR2tENFpqd2pTY2x1WWVFOGlGV0libEZp?=
 =?utf-8?B?MG4yNjhjU1NtcXJkTTdCZWZQRkduSUNaVms0cXlPZFozbVBWY2dHT3dhTkg5?=
 =?utf-8?B?U3RzUXhqbFVTTUtES2Z0OUV0QVFlOGhIYzlGSTZwd3VaMFBjYU13cVhJR0NN?=
 =?utf-8?B?MTcyQlhWbE9sNWI2SUE0UGxFUUFZeFlIdEIyNFZtSWRHeVZ0ZFZwa2NJWEF6?=
 =?utf-8?B?aWJQTzZKdGNmQnJlTjBkb29INklZcldJZEdzTkh4NHRlWVE3R1M5NzIrN0d3?=
 =?utf-8?B?WGFZOXU5akpEQk55blZqM0RDSUlOTkhjNlhRZmJFZjJRRE9jdlNlb1BFc1Bq?=
 =?utf-8?B?eTluZ3VVWG10a0I2b2JXZkpPZjJEeWxHbnNHZFpHRURmeGZDNVZmb042YjYz?=
 =?utf-8?B?NHM4NWc3QTZiNi9TellJaVh2L0dLbGV6cG9ldUQ1M2Fidnpkd3ZHWjZtZUpY?=
 =?utf-8?B?U2x5ZkJqc0lVRGtGcEszVFNvOERtNUNHQzdudC93ZUU0OFpaOW11TS9xOVlF?=
 =?utf-8?B?KzQrVHJTMTdoMkdKN1ZJT0dvMDRGc1FHNlpVOXJGZUZyQnltb256Zk0wWEw4?=
 =?utf-8?B?UWZwTVhYTUd0WkNjMzZQYUV1RzFUUHZ5cnNjNngvc0g3SDM5QU1MemxFU2JW?=
 =?utf-8?B?dFc4RGF2a3BHMTVObk5vMW0xbXh0ay9sRmFpU3dUWGxLRmVIdC9lQ0JSWTRa?=
 =?utf-8?B?TmNHck5YdXJSNEh4UEU0bEVkRlhKNFoyRFdjUVVJaTBZVVFIZUZUcmpWc0d2?=
 =?utf-8?B?S2JJNy9PR1p4eFZWL3VreDNqR3cwNGVaa2prOFFPSDN5ZUlzQWN1Zz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	utNwe7iejhuuC/SNvOY8rqLxU7uvgAOQvph2uYnmklhI+M+qxGxZKAoNCSUrHleNPrm/ibi5JfivabS+t1Ep2XadjfkrDMyE7ugBgZHc2+l6wKdKkuJLSBk0RnNvqSJpmTsdKAL+Ru1x02Sx6pLJSeUIyPRpayMZIKv98OZ7lK5o/QUXi0YgYMYiIfbAcoqay73COhIvf8ohGbZawAZT7ZPelKYPdqO4/qBDCS4JcDQ6gqYbAI7HEs4WM8jS8YecsOqYSHebyrrJKRNQnStF8kRavg7BsUHOil68kOhj+zMbGlE7W5OB4aIHokAP0dmsMKVTIIsW/4qEuWhFpzVhOaq7Lsh4VdrRAvKlNU+8uCfoXDkUM75Gvjtq284EwcQS8tgU7UvFmncD2SDmK6blEXVJdQrkvyQitPoBkuw1AAb3vwrkFf0IlahBk5y33YRzTOiLiNNgdeqVQxvyEKl5DFNxxO+C2T2vfAUBjObsbiHF2pHsIYLAzyQ8ut3OPGfX6Fd/BasYo4YNhWkVXNxjh/N7wlGACPwfpaU4F1X7dIfz4Em1vf2ShCoN2fC326R2Umj0fNxySv7NvDGot8HruTz5igEgcyn+wfPhWQ2C/YM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce01930a-2e0f-4bdc-05ec-08de6fe32111
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 18:17:23.8545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RFo9zNjPHtXY3rtuc9MDocVh+dc4TcNIAphqSK6NS/Mws0rfvUGSoZ97SDb4NUQUySmyPUAdArLzwyJhuoC6XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4391
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602190165
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE2NSBTYWx0ZWRfX3r4OimjebInZ
 lY8wJvyrKZSg1pkd4xP+EeHFqT2iifhgFGoA6fL/fq7tv+cTxPUR4Frd3IptCTsFEm78uoOuo4M
 R9vHuUF/p/U4/u4FGvl1xw2E7S1agpX2fZEnkPkFERuLIpyrIbtJJ139diZMKkqDI4EXIH5wYh7
 g/2wgN4zbS7wrIV0Wi0rp5WFbFfTUhIkgA6seUM2btaHgYTApJQdJOcDULxIopxN12KBOSGLIl8
 SOPYoZhOsksBYfMgiIzqaFr1xmtmr1zyS6QAzndtlcvtizqsZWP9Dlhi408kitnAg2G6PXRqyrZ
 RS8LJ9/PIxsXg/2PuxZWcp/6RgDftR+Eqf0yyBpDrfUhIJCkUlr8GXSFmZRB+5iYJdcunFCYky7
 zP0pTfzFOO+idYH0vZu/V92QYE/62CwsMx06haVmI0s9Tq2dNlZvkRV+7R5dG8Vw/uz5XUD7viz
 zX0M80FQT1iJuS6Lj/A==
X-Authority-Analysis: v=2.4 cv=Saz6t/Ru c=1 sm=1 tr=0 ts=699753b7 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=rGvY3FmXpN34TwyZDNcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 4XtihTKUEUGFZQEHD1yoTvJ9SywZNdry
X-Proofpoint-ORIG-GUID: 4XtihTKUEUGFZQEHD1yoTvJ9SywZNdry

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 2/19/26 10:56, Kris Van Hees wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   Makefunctions | 2 ++
>   configure     | 5 +++++
>   2 files changed, 7 insertions(+)
>
> diff --git a/Makefunctions b/Makefunctions
> index 15836dc3..1f308967 100644
> --- a/Makefunctions
> +++ b/Makefunctions
> @@ -52,7 +52,9 @@ endef
>   # Rule to build a C source file.
>   # Syntax: $(call cc-template,primary,filename-without-dir,optional flags)
>   
> +ifndef WITHOUT_DEPENDENCIES
>   cc-dependencies = -MP -MMD -MF $(obj-name).deps -MT $(obj-name)
> +endif
>   
>   define cc-template
>   $(obj-name): $(src-name) $(foreach dep,$($(1)_SRCDEPS),$(call src-name,$(1),$(dep))) $(foreach prov,$($(1)_PROV),$(call hdr-name,$(1),$(prov))) $(CONFIG_H)
> diff --git a/configure b/configure
> index 04c28369..a3107fd0 100755
> --- a/configure
> +++ b/configure
> @@ -99,6 +99,9 @@ EOF
>           echo >&2
>           make help-overrides
>           cat >&2 <<'EOF'
> +Optional features:
> +
> +--disable-dependency-tracking	Suppress automatic dependency tracking
>   
>   Options controlling the compiler (pass on the command line):
>   
> @@ -172,6 +175,8 @@ for option in "$@"; do
>           HAVE_VALGRIND=*) write_config_var VALGRIND "$option";;
>           HAVE_BPFV3=*) write_config_var BPFV3 "$option";;
>           HAVE_BPFMASM=*) write_config_var BPFMASM "$option";;
> +        --disable-dependency-tracking) write_make_var WITHOUT_DEPENDENCIES "y";;
> +        --enable-dependency-tracking) write_make_var WITHOUT_DEPENDENCIES "n";;
>           *) echo "Unknown option $option" >&2
>              exit 1;;
>       esac
