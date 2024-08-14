Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183541465B8
	for <dtrace@lists.linux.dev>; Wed, 14 Aug 2024 23:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723676755; cv=fail; b=SBHqfSfmig5+xPs8sqFp4O+qBSE418OgDEhFRU7zHCcAB30dMdf5prtUuft+KtC3n/eMA79I4rArITiLMigTGlLqr6fMVh3UqYnURCRydajOYr6WNS7+uYSY2tiP8vwhdvsV3yafrH92FqzlUln6yd7KdV/3l15Z7AHFY8DuPVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723676755; c=relaxed/simple;
	bh=E5uF5U0iNrbWBJjhFnqA7FZI5nSNrrHMxt9YcXfE3g0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=U/9zweowvA7p50o71nbYMIuhadmVCmohtDcUFAHPRg/LgOxBxyySOvd2jI/gt9wqt+XQScnze9y/2rJe2CZ2qpf7osv/g+KNpxJhyxNkHUpfCYnju0BKDdeLgoDKsMKWQuZMTk0oUEa8MEcXCFVhZh8FV7UFGPNASo/csMDXmAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=e7sJ9rnS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qQM3985c; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="e7sJ9rnS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qQM3985c"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EIBPn6013659
	for <dtrace@lists.linux.dev>; Wed, 14 Aug 2024 23:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=c8LPw1kXrt9p6FgjReDkFKwjYtscj8omhIW6ENH9xEQ=; b=
	e7sJ9rnSXG8+C6hc8zwDzZ0fwwYPUE0y3o9ClM+n9ZG+rkHl9kRow2mXJmh8X0FI
	sBItJOEFf3vjArHBw69frmBzO1fU9R8mKXrup0wgvUWyuFyvG1IPrmw7/DTMGtCe
	Ddrfm1eHZUiBPY7F4RWYVTvahAJf0SF+WqEUd6jIx2EtIPfdkZPXjbFbefxFijqQ
	rP0hU4Ejho0h9Jnj06Ir41ln7BZm8Mh7C6v+gTrgPQpujYMDvkguWitut2r459bR
	MSZTQYP97XNvsGnHxAI76PyR61znZhF/qTYntmmO1hTHYlGxy/ZXGC2vxIVJRXdU
	evmMS8QkWqos6B88su8DjA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40x0rtshga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 14 Aug 2024 23:05:52 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47EMFvRw021157
	for <dtrace@lists.linux.dev>; Wed, 14 Aug 2024 23:05:50 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2043.outbound.protection.outlook.com [104.47.70.43])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40wxnh2cas-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 14 Aug 2024 23:05:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NPNRwUWJRMcDN9GDGgUaW3KPB3NdIqkLpmtVi1OGik0+5+vk/7YkE6IPWIakWZhgWB1+XBadPoVNJcFzwxZMmLrDESQe85TgG7dW7kWfWICRILk7cs+ZAxtaAQHYRmvJJo5lOmq4v38PCH8Hdyf4w7ar0Sf/wpnYTfHMJNKYs08tGv1zI7/a1VbYdKafBojSNbNoB1HYNAGhHE3O/TXANfKVrFqWIGd4bTkL8GdscqmPAusxrfT4cMIYHpJEUXt1LIDDHRBiU3c6hcx3jXOrupUZFCGlzLnwluDSlZwuE5YWqq0h6xDE+1ThOdGYhmfw9MpjLaNmVU6wGpPkKeFp5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8LPw1kXrt9p6FgjReDkFKwjYtscj8omhIW6ENH9xEQ=;
 b=vM9FxA1kJiWSWQOm5s+H3bFmj2auokpGJTzFv/YfjL9E0TUtOrALYwf6EZljX5bOSF2Yu4+M9q/O6DdNB9u51s1dXH0h4S2PzbcfDL9QN6STcj1h4Q2b05Gy2/9YjEiz1O/xAJcOBD4QLT1jYKS+sRB20C9NLZIjU13xfzChzcU/AoWl6cJoJL0PbZl0tDnBQFA+XsB4/7BIeke8pA1MFAqJZIWOZ4M2InDTXIhzATsn9LgkdvgUKnaHIp3NeT0v+zSnX8EWIb7mQdoomAxeuWOTizwJ+jmouo3WFZ1y0IpgMXhtp4yKZqxXlLMnACggNeHVrgpAv98E3q0kaxbzvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8LPw1kXrt9p6FgjReDkFKwjYtscj8omhIW6ENH9xEQ=;
 b=qQM3985cPNgnbA1Tx2lmOGvZ5nEc2b3keFkdg+V7d22w8dic92nm1klJbredK0lPm6eAwKuTFz8rOwHT6olWlhy2M9vVf2o7n44ca7UJxKk7T+N/7tssPkloQW7TjUzytVUwh8m9mdQDJiRJaUuvmBVt5u6glEw7GRYWxxElf1Y=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BL3PR10MB6139.namprd10.prod.outlook.com (2603:10b6:208:3ba::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.15; Wed, 14 Aug
 2024 23:05:48 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7875.016; Wed, 14 Aug 2024
 23:05:48 +0000
Message-ID: <86e50ca0-e881-9fdf-e098-027d5da2d1a5@oracle.com>
Date: Wed, 14 Aug 2024 19:05:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] Action clear() should clear only one aggregation
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240814025925.25408-1-eugene.loh@oracle.com>
 <ZrzT9mvBboADVnsE@oracle.com>
 <f4c37d36-5a0f-17a7-19d3-37afb41a331e@oracle.com>
 <Zr0vcu6DN8ucMO95@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Zr0vcu6DN8ucMO95@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR15CA0045.namprd15.prod.outlook.com
 (2603:10b6:208:237::14) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BL3PR10MB6139:EE_
X-MS-Office365-Filtering-Correlation-Id: e81796a1-89be-4487-8a2c-08dcbcb5a262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	bWLbZ0SghWmwbr61Y//Hm0hmRAGnXuCtDdRSqy+783PD1TQHrbdG9EShQ+AQj5tsBmvZC2TzSlPFwELrZi+OV00Vdg1udi5s4Qu1/37k4EnUCFiN4vd1hz9/5mJrJseM98/A9rY6k6AN/GsWSs4K6JisuT7sHcc+XUJDZ7OUYbwBJz1UsU2EODkpmlnih56c/CZXZ9W61L5VUupYzW776+sF2Fr+8+lV72b5wGsOPUP0vd92+a+W6Pd0kvpY0DR+b3VRJPuunKewOHYNmNWT9LQCF9C24Jpf7ihFW0YYncuI0cAQe2TU03AN6fK1bs98hAiATdVmTiUmuHH7IMFsalkCtMDoG/QPE8S4gmYqEVOAnSz6L69ZMSGFrnNzQ4ys9ybhocLFohULoa3aMO7ZcS7Gk1qe4vF8Knqo7v/raWQBgdA/8zwo60s4kPPShapCVtcHeiNnbR1hYKKyGLVJC7lEmQY5n/Y042mB6T7+RDUs/OCBD0MP7yDOmE2396J1qUUnHZm2OuVDi2oXW+Ft0b6SEXmccYNilxuk63RFGRKYBPgnzNowwSDa2MqNHkuEg29IxjX42kcFTf42QkYRlvR9y/M9nOSNjpKnCJSJJH5xyIMtUzV0YeQJuko+1VN5oIhl4uy9Uj88s6Cw52dcTQh6+V6WILnT5FHbLv6qpo8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGFrcEIvK0dBSHp6ZTJnQUZidXZjbnRFb252TStGSnNlL3BjYWhBNm5VdnRG?=
 =?utf-8?B?NDdTV3djQmFsdHplY0xFalp5WmZhUkxmcUFQeE45My9rZTFMekdJSEpGZWln?=
 =?utf-8?B?b0x2cHRjRXZEcDJ6clpLaUVjekgzUksyVWJzWUxhckhhMWJxMUpXVjBHVVV5?=
 =?utf-8?B?RVo4cFR0eWplTE5naTZWRGVoQ2V5T0k0T2l5ZW5qY2JYc2Jrd3dDMDFNVU5y?=
 =?utf-8?B?bTkxRDlXdW1seVpuNVpYbm0yLzVTamMrRmNWRnhkZTVDM2MranVuLzhXbTNN?=
 =?utf-8?B?bzUrSDF6QzIxUFFFanVVWWdydUEyb3BndXNVeHZ0RkdVd3duUGt4KzMrWHRI?=
 =?utf-8?B?UkQzN2ZyVFZpVTJ4WC9pUnJvdC9oeDc0d2xLTUhZSUgzdUlHVDBhLzkvUmV3?=
 =?utf-8?B?RXZBcU5uS0EzblF3NDIwWGZIT2lWalYwWWh5V3JQRWk2d0Y4MlNLb29CRlFQ?=
 =?utf-8?B?eXYvMTNvc1JyaHJidjN5azk4anRWeFRrVzI3QjNOZ3g1bFd0eHA2cnplQmkr?=
 =?utf-8?B?ZGFDbFQ1eW0rWnM0RkpqM2R3OHBwWVZ1NW1IeVJjSXE0M0JXNHNHc1RiR0JJ?=
 =?utf-8?B?RmtOajIrVjhJY05RKzU2SU9USFJaTU5UaWd3L21rRWp4STJBRjlLdHErV2do?=
 =?utf-8?B?OGFUR1ErM2M1amRJWnZjUlFDYkhOanV4TkZzdlVKZFJnMjNuemFSU3Fya01Y?=
 =?utf-8?B?Wk5kcC9MOVp4dTVkdkFyWlA1Z1d6aDZRS0VKZWZDMVEzZ0VYWG9Yd2h4d0du?=
 =?utf-8?B?cG1zWm9qQnBzQW92UForc1ZxeTlzUWdOUmUxa3RZT1FXV2xFYWV2Tkw4d05S?=
 =?utf-8?B?ZEFTVXVxQWk0enp3QXBrUUFLdER2Zy9mSjNsMmpPRWQ3Q1hIS1VNZnY3Rk1l?=
 =?utf-8?B?Uld2L0VmSkFqbXA1NkxGTVIwTzBaVXRLV0NwTHFHSlUwUEVWRk8veDg5M01W?=
 =?utf-8?B?ME5LTm5XZU4xY1N1ZjFxa3B5WVBrTnVtYllqMnlqY3J4THRHYmNTMXZwWkFH?=
 =?utf-8?B?ZjBOa0ROOFBCYU5WZnp5Sm1QVTF4Mlc1RVN3WHM0MFdrZExIR1UwNG5STjB4?=
 =?utf-8?B?VTRCRTBTNCtVR1E1R2xXOHhqWDFPOEZJcGZQcmhCV2hpem8zZWNWY3crOHA1?=
 =?utf-8?B?cWFOaSs3SnBBMHFnN044Rzh5QzNwMTMzK3FsTUZrOHRvNkc2WG5RUnVWUmZN?=
 =?utf-8?B?UXEwK0lHYVlLWG5tZHVhZUx3WnFKcGVETEpCM3d1Y1pabG15a3BYb0I0OUdH?=
 =?utf-8?B?QUVBdzgxYjBkeTNDRGtPRWV1dVZ6TEJxMzdjSXc4OC91UGp5S1NadjBYeDhZ?=
 =?utf-8?B?Z1FXQko1TURuUW1rMEM3eS80cWZJSVdUTldocTFHSUVHNmNnUzZnL1NDWFUz?=
 =?utf-8?B?WTVLZFFxNGljUG9yTkhuak05bzlKZzBLdTBRU2ZaWUpmcjR4d3J1U0xKSXNF?=
 =?utf-8?B?WjV5THZJMjVvWEpRZWt5WUJ0TEloWEplbXpGQXd3UWtaeVl3VlZqNHdncjli?=
 =?utf-8?B?a2ZOSVlRckNQTXJWUGF3TnBHbmFHK2wrUjBlcFNKS0VobmN0ei80OUk2OUpT?=
 =?utf-8?B?UE9qczFCcmZ6ZFlONm5KMFZxWW9iWVlPVUpsdVBjc3R6OFJQUkRYS2ZiaW1B?=
 =?utf-8?B?cTg0NlhZUUplYnNGTFBSSjNoaFFiMzNVaFV3clJubTRqeWtBUFMyWFp2a1Jy?=
 =?utf-8?B?QmdpcmZaRm9TckY5blpjcFZYSDBSV2xpRTVGZzIwRW51NGc0eTBEbHRHdkFm?=
 =?utf-8?B?MHV1cDI2QS9lY1lzR0dJZXdaaU9wdlpUeE9SYVVtNG5sbXFEemVZRC9UQnU2?=
 =?utf-8?B?YUhaOGVvVDZVVDVaN0NYbS9DR1NGbGh3SUh6NHFjRlVBYlY2QmhkRjNESHAw?=
 =?utf-8?B?OXpnZ1JYRzZzZUlEWUdMNWR3TEt4NWlOaDJrWFpYZHpYcmtsM2hOa3d2T3Nj?=
 =?utf-8?B?Z3A1NFdXV1d6eWl4VEdzd2Jpc0w0aGlMT3MzTGRJVXEydzRuRHppVXV5aHNY?=
 =?utf-8?B?NWNDbVRPa09heXk3NXNLeGRsNDFoRExOa2liM2lKMHpBdlZ0N3FraXp5OVhN?=
 =?utf-8?B?QmtrL2hUUkFScFlXYnVaRlpTNFo5OHBuVUt6bGpjTXkvL1JCZy9GMGkyeXF5?=
 =?utf-8?Q?WKi5hEkTNCABG6d8jHFDpodJF?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Lf+crrp2n3FqVfEGEZ4ro30Vk6r7FSUdzTWxPhRHMOG3WIiX10y96ledW3AOIGbj4VvcTvKRQfz3PeRvCqYFPRvQiSDiiDs18BxUT+UMyv+ayHViuu1B1OOxoQ4WuycmAC6vx7BZl3f5YD5QA2tRqtfdzMZPBdfi7r3t7HVW5W0c8vPZcbx4bO2XttOFvibHcw1mFwo3hOKXe3MGlo4DkXEt6sYrN9e/dofJNFSFfO9YatkKzETkPv2+YkWQx+zHrOLqlsRM8ViSpmtMMGlkiqhp9ySsDqEA0onwM3G1e+b6a2RQqrMnm1WKncsEhodnOh90EdWgLECZKo5CDQQ/ZqdGBsfomWJpC09HQcD9MnoqyAG8MxoQuoiRY148Y0hivdbAzFAAdo/A5inFABvL3gvI6IgLq+6lZXLhxGz4D68kudsHhVF5/dB4SwE3taLB3dHsX7wmAr5AJZNDqr/b/yGftegS7FnxpBLYO6rXZHa6Qeu191QNFyR2xWQXBPQYBPPOaVJnk4RAT0i77nb6dhG3QKlh6VqSG+FMBscuhd4ttMYhJRKrp3U/UzlZiBvkqSsaMgP4yMNKGi/VR1XgPzX3aTuvlib7jJnfVmPu43E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e81796a1-89be-4487-8a2c-08dcbcb5a262
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 23:05:48.0498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kpmytg8/IyZTK5YfmUJOxY4r0jFZ9KG3pkDgue0A5+ZPVi/wZNQRJQ94utLMIq+7ZpFgLPpmN4cqOqBwK96Hxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6139
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_19,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408140160
X-Proofpoint-ORIG-GUID: 3oKHfOdgKmj43PCiv5Vw7o96UsRVz3p_
X-Proofpoint-GUID: 3oKHfOdgKmj43PCiv5Vw7o96UsRVz3p_

On 8/14/24 18:28, Kris Van Hees wrote:

> On Wed, Aug 14, 2024 at 05:50:27PM -0400, Eugene Loh wrote:
>> On 8/14/24 11:57, Kris Van Hees wrote:
>>
>>> On Tue, Aug 13, 2024 at 10:59:25PM -0400, eugene.loh@oracle.com wrote:
>>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>>
>>>> FIXME:  Is libdtrace/libdtrace.ver correctly updated?
>> Incidentally, what has to be done in this file?
>>
>>> I think that keeping dtrace_aggregate_walk() as-is would be better, along with
>>> adding a function dtrace_aggregate_clear_one(dtp, aid) that performs the
>>> lookup from aid to dtrae_aggdata_t *agd, and then calls
>>> dt__aggregate_clear_one(agd, dtp) to do the actual clearing.  There is no need
>>> to go through a walker function when we already know we need to operate on
>>> just one aggregation.
>> I'm not convinced.
>>
>> "Just one aggregation"?  Yes, just one aggid, but possibly many keys.  To
>> narrow down to which agd we want, we need to know the key -- and clear()
>> doesn't give us the key, plus there will generally be more than one key
>> anyhow.
> Ah true.  I blanked on the fact that clear(@a) clears that aggregation, and
> any indexed aggregations with the same name (and thus same aid).
>
> Anyway, given that dtrace_aggregate_walk() is an API function that is exported
> by libdtrace, we should not change it.
>
> So, I'd propose that instead of introducing a new function, we can make use
> of the existing dtrace_aggregate_walk() by passing both dtp and the aid as an
> arg struct.  E.g.
>
> typedef struct dt_clear_arg {
> 	dtrace_hdl_t	*dtp;
> 	dtrace_aggid_t	aid;
> } dt_clear_arg_t;

Hmm.  Then both dt_consume.c and dt_aggregate.c need to know about this 
new struct.  So, copy it to both files?  Introduce a new 
dt_aggregate.h?  Ick.

Maybe the thing to do is use dtrace_aggregate_walk() with a callback in 
dt_consume.c.  The callback can filter on the agg id and call 
dt_aggregate_clear_one() accordingly... I *think* that works.  Let me 
know if you're on board with this approach.

> void
> dtrace_aggregate_clear(dtrace_hdl_t *dtp)
> {
> 	dt_clear_arg_t	arg = { dtp, aid };
>
>          dtrace_aggregate_walk(dtp, dt_aggregate_clear_one, &arg);
> }
>
> nd then dt_aggregate_clear_one() can check the aid and return if the aid
> is not IDNOE and does not match the one for the aggregation it is called for.
> That means you also need to change dt_aggregate_snap_one() but there you can
> also define that arg and set aid as IDNONE in that because we know that if we
> call dt_aggregate_clear_one() from here weknow it is for an aggregation that
> needs to be cleared.
>
>> Now, one can argue that in the current implementation and its current hash
>> function, the aggid tells us at least which hash bucket to search.  So we
>> could write a special, reduced loop.  Maybe so, but that would be wed to
>> this particular choice of hash function, and I'd argue the current choice is
>> a bad one.  E.g., consider:
>>
>>          tick-10 { @pc[uregs[R_PC]] = count() }
>>          syscall::write:entry { @writeentry = count() }
>>
>> Lots of agd's will be sharing one bucket and another agd is sitting all by
>> itself.  We ought to change the hash function, and then we'd have to undo
>> the "search just one bucket" optimization.
>>
>> PS  Here is an oddity:
>>
>>      # /usr/sbin/dtrace -n 'BEGIN { @a[1] = count(); @a[2] = count();
>> clear(@a[1]); exit(0); }'
>>      dtrace: description 'BEGIN ' matched 1 probe
>>       CPU     ID                    FUNCTION:NAME
>>        34      1                           :BEGIN
>>
>>              1                0
>>              2                0
>>
>> You *can* specify the key in the clear()!  But dtrace ignores the key.
>> Silently.  Same behavior in Solaris.
