Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5372C1B0437
	for <dtrace@lists.linux.dev>; Fri,  5 Sep 2025 01:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757036405; cv=fail; b=dUe1DLi4FHGjpV2go/B3cYMZAOUZ599drvs0XXyPffhwDs7Sx3sigPyWTNd/NH5VKmVTD9JJuL9hfMQAyEAhe0bD7pPgdzfKHFPC4nfxA6Ir4I0mFx7S4LtX8taE18jbk+c5ZWzfT3GeWjUxdDSRXnPBjaNbxlnpdXOzo3g2u5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757036405; c=relaxed/simple;
	bh=fYeNfQFxQHxHrozLsXHJgk8djy+EtZW2rtknduFikEU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PwzVF1fS1jDBURnx2rcx043Z2mCz0NjFQeLdhxzBxPlrRy5TFf16efARNJ4B+H6F48A/ZSio9RUUk7+VtGszlA84Z9Ggd2wgiHtTM+hRDH0NBOGYyP5izSVai+cSSK61zSwP9hko4E9TH+B2DYnFS07hIQTDrot8AW4AcT/zY2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=e2Us0OB2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MMbWM4xn; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="e2Us0OB2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MMbWM4xn"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5850tOki009187
	for <dtrace@lists.linux.dev>; Fri, 5 Sep 2025 01:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=BNwy19JlHFpYMcDoWFAovaHMm8POx3saWGJqzKxS0Fw=; b=
	e2Us0OB2j4prO17s912+lEO34ydrFiHQVGywhIkyfAjn1GhKLocGX6EawS+G2SOf
	MlrJS2W0MbYaX9dqSM4VQsGKqI0QH4nDxk+2ShBLVEVugHc1PwJPwhvczUo6N4wx
	31u2ua7X3XqEKzVWVnbmDhpdvACSoMwGXIYLxTMOUrBgSFVQMmo3Gd/7Evn9VjVr
	M8hu5xlidJCB6xc8aznpQhz7K/q0SXctDUNLRNlo7HTt5kgePFY4Xs9I3MFJw2F4
	wl/hfbZmPueNhNBP9HcjuLIUzIh1FwY+69HJ/E2HLyM1gX7jPcMA8LBjhUOpI5r5
	+geZJMebP+duyH2g5h490A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48ynqwr12t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 05 Sep 2025 01:40:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5850Aa6U040046
	for <dtrace@lists.linux.dev>; Fri, 5 Sep 2025 01:40:01 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2064.outbound.protection.outlook.com [40.107.96.64])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48uqrjc0er-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 05 Sep 2025 01:40:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJ//A+BzjZiYJ+mp1DcJBMGLFibvuiaHGqpN5C2BdUzL0X9+9vjkDDRTuhOMnYaXJSC78NAXexkOPKjdosqbEUEGOLd50XEAQifT0cmpUq6E45dX0MR8UxHaw4Y40pWrwbVFXY0lj30QzeyNg8XzAFfgnxeMtYgqYMu0fYQ/u1VuHMV9VbgaLudEDSepbl1F2Tr2uBTzDnJW73Brtsd4a7j29+Djy3HbEbOJtm67I7D4Wx590plxN9gCsJs9wnPB2AoQERjIgrMx/ENCfUWYre8iBCFBjfzcGUsDWgmpiD5sUrvwJvqlXtkbC5k8lYPsBcAZiGdmBidipbyyI2wQEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNwy19JlHFpYMcDoWFAovaHMm8POx3saWGJqzKxS0Fw=;
 b=EEw4E+9d7h5UGGaJfN/F/W8Xnanhfs2mhUk1JKGfzdF//rpvQtKdPCZarz/RjjbDHeK+oOLbiIttQfhjjYrlHITSSJkOtEfXYVmdBDZxqDSrGQ2DsF4Ch/shuMEF8WouIHrv0/34cRi7GqQW/97yYY8CXzKvp3SESpWAtMQJpHwu/4Sm0hbICazFyNYA4aV26Fkd+8GGdGW0mXc2cjSloIn2sb2ZGleZXwoAmA0POO8DmTfC/zeRvX/U2+++lbZG76voo4geCe4x4dlRLmWVe1cbWEdYEpbmfvthJr1pk5G7d1SpAcsdkE1OHc/dBfxNBphupbsN0mGocoT8HmLzLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNwy19JlHFpYMcDoWFAovaHMm8POx3saWGJqzKxS0Fw=;
 b=MMbWM4xnV2y1XPYPF60wxNoQhgwINHp6uAZtCzZXFPwMw1BrczpjeQf9m9HdSO87R/H0p8drDTvq7WCtVeJx3cxU/Duei+dhMJDBGdzE+muH4Bveoehrimqozasl5ra8J0MXRWpPAIekQ3tvNTEgYw0N/aL9uGr9+w5K3j/f6a4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CY5PR10MB6096.namprd10.prod.outlook.com (2603:10b6:930:37::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Fri, 5 Sep
 2025 01:39:58 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9094.016; Fri, 5 Sep 2025
 01:39:58 +0000
Message-ID: <7736bd46-5a02-0241-6aae-e671d362ae27@oracle.com>
Date: Thu, 4 Sep 2025 21:39:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] cg: fix offset for > 8 bit bitfields in
 dt_cg_ctf_offsetof()
Content-Language: en-US
To: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250904090838.1048503-1-alan.maguire@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20250904090838.1048503-1-alan.maguire@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P220CA0048.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::19) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CY5PR10MB6096:EE_
X-MS-Office365-Filtering-Correlation-Id: cb04f5b8-50a8-4887-4ba3-08ddec1d1f4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWlzdW5ZZGM3c0ptSFd4QThUMWRxUUR3b1k2VnM0K05NZzQzMnNTeWFRMTIv?=
 =?utf-8?B?NGZUUG1GTVNYODJqOXFKRWk3ak9udFg0RmswWktJMVdjR0hXdnNxQXZOb2RH?=
 =?utf-8?B?QTdpdzFVZkFGRnI1SmFzcmo0RjNJN28wdzE3b1NEejcxVlRHTDlJWGUwdU9P?=
 =?utf-8?B?MVJlUDRXYTdDMUV2Y0IwZ3pLeHJ1OGE0UHppblR2bnI3c0JqQ3IyZnlLcVdG?=
 =?utf-8?B?cUtlVHVQd3pQUFNWMFg5UWlMbExPeHNSV1pCcENqQVAxWXFNNCtWWGo5anAy?=
 =?utf-8?B?T1IwWXZWdEM2S3c4djMySlZWV25jTmdnRkdRdStyWndyYVhGcjBORlRqTUVh?=
 =?utf-8?B?K0E1YVRDazBkbUxmSmV2cjhCTWExTS91OWUrTDZBU2g3Q2FSQkxxVVhjSSts?=
 =?utf-8?B?MitYalFEOXNvME1Zd1ZRenlFNVhYL1RMNHg4NUpvQVZNL2tBT0pVcUJJd01J?=
 =?utf-8?B?Nm9aUnk3U3RRV3U5U1FEbDVOSWNndERhVmtqaGFKMEQzMS94Uko1RWZDZ2Vl?=
 =?utf-8?B?MzIwRFVpWlJQNmg2d2xveW9uQkpCblB2RGNkd01Zb1ZrZE1zeDZ5emxFbzh5?=
 =?utf-8?B?YlZneTJKQmsrVkJyVWVYTldJVVgxa1duZVArbTdnelVDQ0gxQ3ptZy9uL1RO?=
 =?utf-8?B?ZkZGVENJYVF4T2p4MGw0cnZGR2d1QkFYNDNxZUIrTUZBSTU3ejBXTzU1endj?=
 =?utf-8?B?UkdYRkVOM0xyVkd1azQ0czZ6MDBBVjNpTDZIMVk2N2ZEMUZsVzltVHdOQWR2?=
 =?utf-8?B?MmdXRWdHK05hR3Z5dUx4bUV1aFBYM2VBZmc0Y0VOUitMcUxQQUlvd1V6OUY0?=
 =?utf-8?B?b1ZXWHlGeEZCakZpZ29hS01oRWFOQTFaZkhPNUJJOXRyOVF4d1loS25DSEMy?=
 =?utf-8?B?TWRLUnA0MDdJbksxVlpqS2ZGWklJa0c5cElaSWtBU0lVRlVEenpqSk5nQkxE?=
 =?utf-8?B?U0I0bGQ0NTdNREFDbU1lNDhMMHBpYU41RjJMUEVpT2lSSDdsLzg1UTFZd3Iy?=
 =?utf-8?B?WUNHQlRTU3gyT2gzclpQS2JDUUJmY0tmUjRaWXZiYVNpaVJKREFpV0dyNVVB?=
 =?utf-8?B?MCtBN0w1a3UyVHEzT1hSRjAvelF6TkpJeFExbVBBV0FhbTVKZGtrS3FnKzVT?=
 =?utf-8?B?Z1gycnFML09ibUpOVGZjMDh3K20yd0tlNkgydlBPU3pNVTNnYlRoNm9Lb0wy?=
 =?utf-8?B?V3RSY2U0SUdRd2RYcTgwbG1jNEZKamFDQ2VVSjhqU3hjYUFTcXQrMlpqQldM?=
 =?utf-8?B?dDhqRkdrd1ZJc1J1ZTJVYktPV1NlNENrdFIvL1J3OE95d2gzVGNFdzZNeml2?=
 =?utf-8?B?dGwyRVcrU2pXcStER1NXOStjQ2NOTkVqTTdia1N4WXZoeW9QNzNCb0tCVi9Z?=
 =?utf-8?B?NklNZ0RFS0dtbldxclVBc3plWmtZVVFUVnZybldxNUxvK1Y0ZnhCOHZHaTJI?=
 =?utf-8?B?ckRoOW9XWTVCaGRGcHlYRzJzSkxtZW5xT0tNcVV1WVl2NDlpRDYwQzhIRmoz?=
 =?utf-8?B?Z01KeHlsK3Z5NTVWUHN5QnlpSysxaEg2QXBkcFlIYjA4bllhSkV2ODN2Qmo5?=
 =?utf-8?B?dUU3L0ZnSWtTOThlQnFJSGxhV3dLZjVQZ2F0VHZ0QytScGtpUFhBZHNBbUdG?=
 =?utf-8?B?R0h6MXBXY05uMGVEODJwb1duS0haS1lQY244MDFmMWZGc09lTnh5aHR3R0M2?=
 =?utf-8?B?b1ArTjU5U0ZBRlJabXB5UDJncUJJWHZ2U3ZuUXdvWnlPcnZjWFQxTDdkVzQ5?=
 =?utf-8?B?SG5MY3kwM3AwU043aTMwNDNoQmJmWXM4NVN0VUNDalBRR3dEN0Z3QjMyUVI4?=
 =?utf-8?B?VGJWYU82RnVtM0xsaWJnTlBkWHVlSU12SGNnL2dObFRGbFY1QUM1Rmlwckd4?=
 =?utf-8?B?MEFxYlAybjZsejBZMEFJOXRsN2FkRm9hd0N0Vy95VVlOaHl4c0s4Z1JDaDl5?=
 =?utf-8?Q?Hj2ZZFen38M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXNOMitINmp2ZGlrcnY3UElHN21wcHdVNTc3cGl5Q295cnlHQlBFdHNDMXE5?=
 =?utf-8?B?OTVndEtVWU9qMFlGV0tHYWdkaFgxVGw0T2Nsd3NibkMvY0RPemdWMmlRWHBP?=
 =?utf-8?B?QXkzNVBBcUoxMnVOWi9SWDFKWGFCbkttZ1MzYXVodjNuclJTblB4amFzT0FJ?=
 =?utf-8?B?aithRW02Mk42bTlSOTc4RGVGb2hOc2l2eHhhaFNSaXk4ZW5sY2NZdERYdERU?=
 =?utf-8?B?ajNJQjE1MWNxSW5VU1Q4SHU2eFJjZ2FNWmVvZVdBd3FkQmZMeDJRN3ZzcS9r?=
 =?utf-8?B?QlY5d1RxbEdxNlhadmgwM1lzdndSVlBUZEc5aHpZeWVTbmxVRXZaS2tjYmtq?=
 =?utf-8?B?RE01OHFQdUlVeE4vL3IrU1dvQ1JxcnBmOTU3MXFVd29QK0U0V3d2b1R0bVFt?=
 =?utf-8?B?aUhRdGdWeG5HRS9WVm5MRUt4Rjh0a2M4WDVpMExHUllBTktiQWNreFRnSElK?=
 =?utf-8?B?ZXdmeUZjZytqYW0wTzVmVFBLZ3hmeVMvZldmYWRzRm8zWkU1UG5tNW4zOWlH?=
 =?utf-8?B?eUJQU2lBNXBObUZWbzAzY3pmSVJMY0pLL050OWtIVWdWYkRKb0ZTU0RwYlRy?=
 =?utf-8?B?VStYemdiMkg0UVVsWlg0K25SZnB2WnNaUHBnaFVuMFZIY0NUcmdrWGEyc05F?=
 =?utf-8?B?Y3RsVDkwaHVRRGZRazhoMS9vSWtDS3pZK3EwRHNoQUhwa3M2QmZoejFDc0I3?=
 =?utf-8?B?a3BmejFHVlFQY1Y0ZkYwU3Q5RktwTDhPYXFvMFB2czZmbUQ3NXNKa1h4d2VP?=
 =?utf-8?B?NWpSbmtNZnJOZWV4ZDdncGNMdXlqbTVUd0xoMFV0WDE3cjVQMnpoaFR5cGw2?=
 =?utf-8?B?N1dhSmlrNXZNbDlNVmUxSlJuNnJYaEV2S2NBWncvbzFBY21VV1d4bGwvdEFi?=
 =?utf-8?B?Tmw1TE9Ibi9ZdGJGL2R4NjlLUVVYSzNXZC9hdm1sWjVuNDZWREwvV3h2T1ZW?=
 =?utf-8?B?QjZQby85L3VGbHdnQ0VHdEVYeWxVU2FNcmpNbGttR2h2dnBGNnYvbFFxMzdR?=
 =?utf-8?B?NEs2bVl6UDhhbG52L0JucVA3YkNocUZ1NVdBZ3g3eXZ1dzYrS0dtZnV6aFIz?=
 =?utf-8?B?a0xCOVUrOFozRVRPUEJVQVE4dWw0c0wrbkRlVXFBUUhOUUJ0cytiVkE5NElO?=
 =?utf-8?B?UjJWaHY0RmR2MTFJa3dROXhUVlRRT3AxQUpoR3lQU1U4TlJLQnczckNkSlJL?=
 =?utf-8?B?bTdkRzdzQ29ORmJDQitZV2piZGJXVUUrcjlWQ1ZzNCtndE5yVWRXdm9VcTFr?=
 =?utf-8?B?YnFRR0V5aE8xaGVvZDJNeWVqTUNGV3F2SUVaT2lnWVh2bS8rcGRGakNtcHl1?=
 =?utf-8?B?STY3d2RQdVZzdTl5R082YWVMQ3Q3bVprdWs2cVdvVktZMWNwWXViRzZSZU9s?=
 =?utf-8?B?b0xXL1ViZGV2N20vTzIrd0tvMWlhWXBKYjV2MUkwazFtWDZweUhkK3VrVUtY?=
 =?utf-8?B?SkpHNlNpU0pYdFZ0N09jMk8zeXJlNWpsaVlSNEpoN1JuQzJ3S05jQ3lNc1lX?=
 =?utf-8?B?UjkrbkdtVWk1b3g2ZzhPOTZLckxScXVGYTM2WHF4amVVSml0a0E0WEw3bnd2?=
 =?utf-8?B?ZWdYLzdRK0dSTitWZkZBc1dsTmxBSExQNFRrOWhYZWcxazBuSXdWb1BSaUVy?=
 =?utf-8?B?WktHS2FjcmpETWRaUTl1T09iRHRmUDkyYXE0a2c5NEFsT0t6cTdQNDEvMkVB?=
 =?utf-8?B?ZmhIclVCMlpTR0RJUC9TdGYrSGRCb2xjWE1NUmg5VDIxbVpudzczWnhldDl5?=
 =?utf-8?B?UFdNdzdpYlY5eGhuOG5OeWpmbHhXck9Qb3FhVHoybTd4UkxWWTcxM1lTS1hz?=
 =?utf-8?B?UlF3S2hTdm1PbXdwWTYwWlkvWGp6aU1NS2NSbi80OThHWVdsSDhaZ01nd0R0?=
 =?utf-8?B?dTdpZXQ3cVROMFpmYlBQZklQbVE0NkFxc1RyRmF6OGpkWFVwc2d0ZFRwZEM2?=
 =?utf-8?B?dzg5QjhyME1VanpyQnJoVmpQRS8rc3pPVWRmMnRPbUcvSDJUdUk2Skc2dFJ1?=
 =?utf-8?B?RStlMndoeWlHSXV0V2NOcHVkeENPSkk5UUV6eVJMQi94ZWV4T3UzM0RVeHpX?=
 =?utf-8?B?bENKdlpxaXRjUGdiOEFmQ2RKeFVseGV1eEhKTU9UcXRNNW4yTHBoUWVORTNS?=
 =?utf-8?Q?TZC3ch1QF8DRxhg6Um5GHp+oW?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DV/pXpSVMvUtlan/Bl5MvOI5TMm0ZNEFWfWy2000+qNKV09bGuiVJWZ8hMxle/Y4rM3TJSpu+JYNDH6LJUXvj6HaJpJxNBvI7AJq3irF3909cqhOjODAHMXAeDJzMnm3HbTxMMXawtGq4fMLz97sJC1GubobPe4AUM6dHr1Pa8JPhq6RKsNoqTerB1fTzp0g+Bf7+ATZrGc0LqLeMle4nwDPcT3teicg6CB7GJmAziHrio+hd3uA9RSXzHWVwY78Mn7WwP7f/O8uRaYBXLgdXktakeB3bDUIV3trti1I41dpItI88TuajnduKmrDRiLg/Jsi8qwl3/GvDN72ZRw+OzzWzo6QuEk7ghX3SsXWXZ104GHfPEA/3WlWGj9xP7cFDmsannWWyTeR9zHIWTH9ik8v3JFs9COymp4sB8sDcDNdMcs0qW2APRzxNCRfFuNuzO339iJN5B9yHTVWwfm4PwQ8W6gUKnW8pytmnsSAUnPVZInpIygMRqIH4U4q9rwhXuYgoH6HX4rLScBH4jLlmqchyDR/I4TuKC9mgYYAtVLq9PCbQoUOKrSmGB/k69mrtuC3LBFF3gqNZUgDkBlqVkw/sqAf0O8paZOmG/4sxns=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb04f5b8-50a8-4887-4ba3-08ddec1d1f4a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 01:39:58.4968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F3YKa2Zm/qiWrogYg+iLMbt09yqhzf3LDkfPRrHVjF9P0R3va/Sjgvgad6D7eZRpa/Lybo1OP9V75n5EODmoow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6096
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509050012
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDAwNSBTYWx0ZWRfX4vs8QGSDlbHV
 85qa+h+jPTtllWXY4uS3tpjqhezicmRs0rRowFTqQbCn3Gks2lsJCYUuB792DKMrfMqLxzz9f+B
 n8iyDTaEPcp7i9YTbfKiP4fOjxDaRrwkmWR3KmLEzPO9dRGCQMrE3ZTSdkWfKXImxTqPozobwtD
 xMsCm106SxSONFfGHP0bYOt8NhlZmTwMd25H1+z/Nd4UsIPW01WEK2d0rRUTKmpxC1F4sTIhCAS
 DulEBSwgxFVTqL4HoQhoemEquXmeUPP/M1rYSjlrk0n5qyluJWaa1ITZKHSXVaUgSGOkPYfxs0W
 stp7HGbmqB176t8ytuP0f2ZTiE5MOYmZryU+7cB046JVtaoheAvZtP/1Uqcv6t5dRvbYhnqbJC2
 wrVnBEqpfFN3d+OZaEPq07N1sTJw6Q==
X-Proofpoint-GUID: Irt6DpSVuao8OEtTyL3eT1xo7q8Okv_z
X-Proofpoint-ORIG-GUID: Irt6DpSVuao8OEtTyL3eT1xo7q8Okv_z
X-Authority-Analysis: v=2.4 cv=NYvm13D4 c=1 sm=1 tr=0 ts=68ba3f72 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=k0EnmgpT0VQ6xchb9RAA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12068

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 9/4/25 05:08, Alan Maguire wrote:
> The tcp provider uses dt_cg_tramp_get_member() to retrieve the
> offset of the sk_protocol field in struct sock.  However it
> returns the wrong value on UEK6 since it is an 8-bit bitfield.
>  From pahole we see:
>
> 	unsigned int               __sk_flags_offset[0]; /*   560     0 */
> 	unsigned int               sk_padding:1;         /*   560: 0  4 */
> 	unsigned int               sk_kern_sock:1;       /*   560: 1  4 */
> 	unsigned int               sk_no_check_tx:1;     /*   560: 2  4 */
> 	unsigned int               sk_no_check_rx:1;     /*   560: 3  4 */
> 	unsigned int               sk_userlocks:4;       /*   560: 4  4 */
> 	unsigned int               sk_protocol:8;        /*   560: 8  4 */
>
> In other words it is really at offset 561 but because we just
> lookup the member offset and not the member type offset we get the
> wrong value for the sk_protoocol.
>
> This in turn causes tcp state-change probes (and in-progress UDP
> probes) to not fire since we verify that sk_protocol == IPPROTO_TCP.
>
> The fix is to look up the member _type_ offset and add it to the
> bit offset we get for the member itself.  With this in place the
> state-change probes fire, but the local tcp tests still fail due
> to separate issues with the tcp:::accept-established probe.
>
> This issue is not seen on more recent kernels because sk_protocol
> becomes a __u16 as the number of protocols exceeds 256.
>
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
>
> Changes since v1:
>
> - added comment reflecting need to handle more complex bitfield values
>    in future (Nick)
> ---
>   libdtrace/dt_cg.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index cd9e7f4e..e378cf96 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -1959,6 +1959,8 @@ dt_cg_ctf_offsetof(const char *structname, const char *membername,
>   	dtrace_typeinfo_t sym;
>   	ctf_file_t *ctfp;
>   	ctf_membinfo_t ctm;
> +	ctf_encoding_t cte;
> +	int offset;
>   
>   	if (dtrace_lookup_by_type(yypcb->pcb_hdl, DTRACE_OBJ_EVERY, structname,
>   				  &sym))
> @@ -1973,6 +1975,17 @@ dt_cg_ctf_offsetof(const char *structname, const char *membername,
>   
>   		longjmp(yypcb->pcb_jmpbuf, EDT_NOCTF);
>   	}
> +	offset = ctm.ctm_offset;
> +
> +	/* a bitfield may have an additional bit offset which means we need
> +	 * to adjust the reported byte offset.  Currently there is no need
> +	 * to bitshift values as they always both fall on 8-bit boundaries
> +	 * and are sizes which are multiples of 8 bits, but in future if
> +	 * more complex bitfield retrieval is required, changes such as those
> +	 * in dt_cg_field_get() will be needed to support that.
> +	 */
> +	if (ctf_type_encoding(ctfp, ctm.ctm_type, &cte) != CTF_ERR)
> +		offset += cte.cte_offset;
>   
>   	if (sizep || ldopp) {
>   		uint_t	ldop;
> @@ -1982,7 +1995,7 @@ dt_cg_ctf_offsetof(const char *structname, const char *membername,
>   			*ldopp = ldop;
>   	}
>   
> -	return (ctm.ctm_offset / NBBY);
> +	return (offset / NBBY);
>   }
>   static void
>   dt_cg_act_breakpoint(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
