Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD762E2DD8
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 18:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754938066; cv=fail; b=W2qCAlzGvIbNW6gPzUUiIbhPKH5xtyFEbGSZy0BaaRYvmzZx0eNeDxIHGb8sACWZXT5uOFcpME5jM8HWdhLlBgnswa3lNjU78h7N5ADJlPbiTvklP05EosWe35H8d2VQmcQ7l9GdR2n9CmGvHaqAMXLE0cDkBrK5AcJGQbgpcJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754938066; c=relaxed/simple;
	bh=3XtvMWoLaT4Szqj0GTdwM0nbrkGDKvCt27ok418cfD0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Gx9QsD5AqW4WgkvnFe7GZQbIIKO+IL0tABaOoNqsINt389kQh5okV4Dp2R4HpnUmzZf8TSbYfhOwyzJdF39V5fy4dmEVDs4MSIoD6r9eR8GcRIn57WX1PZhRpE3WrrnKoYYh2+7/6jRanDqL5AMz9LKIXmWSVdVzF/Bf4wZJGyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jUjuWD7X; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=f1cN/rcV; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jUjuWD7X";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="f1cN/rcV"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BFN60c006357
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 18:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=j7HybSKZhzuXNjKBNJxmEZQwWQPtVwt5g5TCx6mU6Mw=; b=
	jUjuWD7X+OMQWRRMcvn6Z9m0CVTuCHIbpJYXwv4RVYSJTyY+dBXpwlzWJRwJk4YX
	LXx63dA88Sjx+GqXE1MI4du7Vqe+pth6ycJ9KL0hBDpOVWBsXUibNgA8XM4ndkV2
	02rFYYH+ncEn6HwlxEJ2G2etQuJZLgfVRnNUBr5WL+EMLHZ4BhduOGpZcykZFNnT
	Ii1cauCF8SJXmjG42rwOgHIOX7eR3U/CTVelLoLpv1t3wlf0Y7AxJtZEhsxbwNGp
	z7olKcofLG9+qK8UgRoOgpM1WKAafQEiCg5t0QUO8DyErGRT9wkzUm8nxZsxN5z8
	W9/6osWdFhs6Hd2wZG1WeA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dw8eb8jb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 18:47:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57BHe737030164
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 18:47:43 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvs90rx2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 18:47:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ny81SWhki7sd7Hs1kTiXsTcGX52WTIjezHvgEY5ckyKeDh4K4D2L3Tvt7pni2PR0nIYXLXPGLV68ZPz0XX1Vj7/1UG74g8JFKArng7JkoaDEbSayc6g2hwTXWl5jcJOqDGCK7G/oBdPT65pxpRmibjBynRi8TO/9QhlTuy9LPzMpntS2stAtSoEKyL1oW40y+EZwVgnQ2977YE9aZDjiEBrZFyGkbeHxlaL+I1a3t2SBdN3lyhyyp8+xR++zbvS1GAWELuqqQORG6rgO1lrCRopY8D1FY2FEGP2fRxqSkODAXixQeIy36tJHauaZvAdUVuVqz3bwLvr4XYI7Ym5EGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7HybSKZhzuXNjKBNJxmEZQwWQPtVwt5g5TCx6mU6Mw=;
 b=VruZv/4Ti3+RDug2hLf4LNkVuyeJd3gRczQc1fcMMLtUcgpi6tAAeiE06aST0R81HWMS3HqTPuLeD6OjbRCHSVs6hO5LyY2+R5kA3VEfUHICqCJ9SUof67ax+bjD/SNBNxna6oiPluSiFTbdFUVkm7pFPyEhR/KlU1z5TEGG2qcGwOw9ow/BQavYC5wkLdHtO8FMUSc9rK2eDTcPuWsyczOc71Gw/ufOiKw/8q98KMw5JVWcHQ+951zOA6IKUS/y1cOHWeHTq9OkzCBzS1Fxw664g/ANIsPiUWBXcRtAZu8B4OnyiCErix5bqYM26L0Y4Tl3HxuPSP63cqQI89/Hcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7HybSKZhzuXNjKBNJxmEZQwWQPtVwt5g5TCx6mU6Mw=;
 b=f1cN/rcVwYyLVc6l/DbQ96/vvH98N8TzTyvsAGgBSPjEJvr4Rno1zcjDdhD39QCEuWwlXML8DnR7O6CY5jItWHea2BCuQQQZU5yrBHd210bhi7iDBEd8w72cKYja+jfL1+XrZtdUf4o+VvH1Ml600zEsmL9Y+BqsnH//KDgp3Pc=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA1PR10MB7738.namprd10.prod.outlook.com (2603:10b6:806:3ac::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 18:47:39 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9009.021; Mon, 11 Aug 2025
 18:47:39 +0000
Message-ID: <b74bfdd8-e6ca-c67e-2e5c-3ce77e7f5af8@oracle.com>
Date: Mon, 11 Aug 2025 14:47:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v2] dvar: ensure dynamic variables cannot
 overwrite eachother
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB56723A6CF8353F944176679DC228A@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB56723A6CF8353F944176679DC228A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0964.namprd03.prod.outlook.com
 (2603:10b6:408:109::9) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA1PR10MB7738:EE_
X-MS-Office365-Filtering-Correlation-Id: 80e7d27b-006e-497c-ab76-08ddd9078be5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dVNtYi9jekhMT2NpQkgwTkw3bDhCelZsYWxOYU1CdU5VRjhVeWlXckgwdVBq?=
 =?utf-8?B?RkxOMGlzY1FOS3FyaUZJRWhoRWI0MnpYc2hRQlZjRGZma09IaVhCUWRJc3ZN?=
 =?utf-8?B?ejQ2Z1lxQWcwVnRTZWhTRGxxVUdnNU9xbS9sMlRYZlVFT0RSY2hkMUhlQ0Jh?=
 =?utf-8?B?eWpLWGswSUlBL09qdnNnZFhWTFhvcXlIU0VqZkVGN28rdFB3VmRtV3QzeEZQ?=
 =?utf-8?B?WlJDb0hUSlVHYjhTZDdXcmVLWW9jSUI2SWM1R0l0L1hKQXl6UFdBN1dxazFY?=
 =?utf-8?B?RHduVDJuN2VEQ1cwVUJIMlhySXRyWXBiTUxuK3lsNXlIclQzNHlhZElobzdu?=
 =?utf-8?B?dEI1VDRNZEtTeklMOHVONkNzclozNG1sMm5uZ2xJNmg4d05za1lmNjNxbENN?=
 =?utf-8?B?RW9NQ0tlemFLRW9wWmcwZlVQcVZwbHU4dFZBdWhuYmVubFRRaWlVbzQ0bUlz?=
 =?utf-8?B?Y1RNN2FsUGhpUFBpTUQ2WGJIQ3UxK0NsTFhFbjJueWJxejlaRGI4WktSK2kr?=
 =?utf-8?B?V3Qyd3FZS0tDRGp0ekJad3k1QzgrQ1RLdmNiNjd0aHBuRU1HcjZBUjJ0em1l?=
 =?utf-8?B?L0MvVitEYy9iNVB5bFJnczBZM1NIWjk3OTVpaUs1ejlhVkNCdlp1dlN5NGJ0?=
 =?utf-8?B?RHh6OHN5RGF1bW1wbUZSSC9hYnVMTGgwVnZXRHBYZzlsd1NNVmRLeG10M3lI?=
 =?utf-8?B?UEEwYUtiaVJwMUg3UWJRdjl6ckxWcmpCRlZkbDlsYllCS2FIUEhnTVV5ckkw?=
 =?utf-8?B?NW1JMlBabmVWVHhFWlVtR2dvZUNRZnJKRmtyckpVZ1IreldrSmZHcU1nTUNX?=
 =?utf-8?B?bmZ5Y0RoU1RDc3M5TVZFMGJ4dGtJWjNEc1BsT08rUExBdFNyK1ZjWlN1QWxh?=
 =?utf-8?B?d1hpaVJ4T3U1UmoveFFIRFRBK3gxa3dVM3RDcUdhNzIvcTRDbHl6dUNpcWhL?=
 =?utf-8?B?dVpKVGxZRmo5czgvVjJsRHVnRDUya2VpMWNTYlc5OEp2MDNnMzZBZy8yZEx4?=
 =?utf-8?B?aTdqeW02N0VQWW95aEV3eEorREZNUzFTb0hCNm1qSUwxelF5OExRRTZ5YlVi?=
 =?utf-8?B?V2hrdEZUNmpGa1ZtR1N0b1dBMzBnM1NhY3BVZURwMTVOVm1yc0IrZ0h4WDFI?=
 =?utf-8?B?cjZpbGg0cEZoZWh0QnYvQk1ZSHdwRXdTZm9rUkwycXBnYnhPZDRGSThvMG9x?=
 =?utf-8?B?aXVOTTNoWWR0bVpiK0JrMnIxelFZQmZ6R0dtWFl3SEZRY09WSWtQZ3JzZkNV?=
 =?utf-8?B?TVN1SjFBdGtWamQwTkw1K1VVVXVwWlZIaGdGWGVKRytOeXVEYVArTWlHaW5y?=
 =?utf-8?B?Nno2NkhaNW5rVEttRFhha0oxSi9xc0tuN3NvUjVjMDNhMGQxeWhqZzhicUcw?=
 =?utf-8?B?dUl2dEVIc1NXeU1VaEl2YmFZV0lzN1BDVGRDYisyN3gxczZDZWg5MXdPYS9n?=
 =?utf-8?B?Y1ROMVhqT3ZrMTRCVUxTc1MyODRkaXhsOGhEcVhqQ2F6RGxRQi9Ra0MzakJ2?=
 =?utf-8?B?WkZKaUUyaUZRWjdNSkZqemkzWlBUazYyVDZaa1UwR0NTNkZpbzA4MEp5dVhK?=
 =?utf-8?B?RUt4OXl3cTJjbHlCdEdybTc1ZkVWc3QySkx5dDlPUUYxSnp5b3Q3N0JZV3dn?=
 =?utf-8?B?bXVSTWpGTmF3MUFHYUUxTTF0RmNEamxkTDErc1RJQnowK3JkWlkxSXdMRjNH?=
 =?utf-8?B?OVM2ejhQem1GeFV3N0ZBMGJBRmtydnZKMXBrTDJPN1NwOElrYmpwTkJqbWgr?=
 =?utf-8?B?Y0tpTlpqeUo4S00wL01jOVorYXdacHUxTUVLanc1NllSRW1WZUxvMFJXa0dT?=
 =?utf-8?B?R2ZFWFphd2l0S2FGeVYzU0R6V3pjK0RaVHRJck5QZ1U5RUZ6NU5CN3hnOVBB?=
 =?utf-8?B?d21pTnkrOTY2ZGZIMGY0THdDY0dZWlVJYjZSTFNtRjVzTk5DZ2FYaDJJeGtu?=
 =?utf-8?Q?L/y6MgCbf7s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkJTZFBUV015aVRPZXYzS3owWU1IQXJNUmxEZm1XaXNNVXJucEFMS0NwM2xP?=
 =?utf-8?B?R3pxaWhVWFNzaW5za0x0ZW5sQ1lMTFlDcWVURmdoR1pTY3phblRTY3d5NVVn?=
 =?utf-8?B?RDhDcm9lZndDT3BzeFR3bys5UVg3alVFckxXaVhJbm9iRlZhcVZZTUJ4MEJN?=
 =?utf-8?B?UFR0TFp1R3lsVTVSSEljb20yVVNLV3pUcTFHdVhWSTBIbGlyVVhqU3MwMlYv?=
 =?utf-8?B?bGhTZGZIelh1QS9LYlBTN0lYWTl4TTM1WXNpSWtRTVdGQmwrSk5NYjl6K0c5?=
 =?utf-8?B?Q0NWbTVaVmtGK2lMSUJxakJzVW01M2V3TUcvNHBJY0FCdU5IekpzZG84UUhP?=
 =?utf-8?B?bFNrYjNkOUJRZG9qMnhzR0RTenNQTzVjeG9MNUMvbFM4d0dDOVZ5cjg3SEJW?=
 =?utf-8?B?NktVMGZWTEYxOFRqRXFDUG5VaUw0YkRWK0xXUGNDakkwNGNWUGt0Qnp5QlFS?=
 =?utf-8?B?TkhqMldnMTdYRXM1eVY1UXNlcmVFWk5hUFdaNHdwSGUwYUluU3gvTklSMVBU?=
 =?utf-8?B?NXAxR3JCM1czVDZ4YnhxcFRJeThXT2ZrRkJjSmRrQ2RieUU0Z0hwMWgvMXJL?=
 =?utf-8?B?RlRMUVNsQU10NVRhcklBdGdSVW11OE1qcy9ldkpBVEduQ3RCT0tHUUtsMUE1?=
 =?utf-8?B?Yno1ZmVUeU1jQk9iUE9TTGRrNkpMRkliRjdTanhqZlY1R01acnN4TmY0UWVL?=
 =?utf-8?B?TTJEdmo3MTJMN2R0bWhTZnU5bHoxUlNKUWFyRUxTc01RNStaV3c3MjdjTjh0?=
 =?utf-8?B?VFpwWEFXd0dOQ2N1azd4RTdnVUpsRzJrZ2ZpdTU2NElFU3czdTJwaDJ1MVE1?=
 =?utf-8?B?dnpOS0hsaC9sMnJMRFFOVVdyZUxqRHk4L25zdUM3Nm5kN2xMNVhQRDlnZ3gr?=
 =?utf-8?B?MFZ5SHJnYWtub1gxZ2tLcDNZMzdqb1NMcjM2MjFMcXBWQUlPVE5EYjgvUDF2?=
 =?utf-8?B?WUVFRnJ3MW5tL25tL29XdXFsUkU4RFFqT2dWVDRaaUhabG9jY2lXc3JWR1Z0?=
 =?utf-8?B?dnVRY25DdVphTmpRb3Nqb01KZkcyK2QzZkVtdW53dm9renhmL3JIVm9WaS9s?=
 =?utf-8?B?U25GbysvQ2tVYUFWT1gyYTM1ekJ5VDl1U0dSMWF6aUZmSlZqcjZabHd5YWE3?=
 =?utf-8?B?RzJmWmQrTy9scnVDd3VEM2liUWNSN3kva1NYN0tnL1Jhd1VnalRKb2hFbkY5?=
 =?utf-8?B?enVPWUV2bElTT1A2WCtROUhZOVN5cmxWZ3BnajRrRkozdG4xMFpEd2VHVzkv?=
 =?utf-8?B?dHh4RDZkVUxMR0Q5VUJocWlqVitJd3hXSEd2ZEJPNXFJM2hLeXFOWDhKa0Ns?=
 =?utf-8?B?N25kLzkxbTE4b0VJQ3A1MkFDUVpESUtUUEpFTnlwV2I2SXFqWHllUFZ5VEdN?=
 =?utf-8?B?Rkowd3gzMGc4akI3WEt6bXU0dXhSTE9MTE1hdEVJQm1JTHVtZVAvc2JkRWFC?=
 =?utf-8?B?TUJtMXMxYytUVVRYeHpIVDdBOGo3bmZ1S3FCcnNiZnIyenFOYWpTTFE1cm5T?=
 =?utf-8?B?RDZ5U2VjckQ0YUc3cGkyN2czbllvTTIzbXE0ampOR05TYlRWeEQvYnBQR2Jv?=
 =?utf-8?B?blBEMWs1MmpmcWJlMXB0YU9pS043U0NKMWJqNDJTWHMvVUJzYTlvc3k1bHl5?=
 =?utf-8?B?OTZZZzdJbkRUc1pIdzFoRmhNRElrSEM3Q2RibTVhUzZHb284UWQvNFU0RHFU?=
 =?utf-8?B?T21ERnFpZFRKaUlCaGV5RlhjeS9WS3JsZHRmS0Q5M1BvS0MyQUs5VDcxKzRs?=
 =?utf-8?B?bDBiaDZsdDhzaXI1a3NzQzZOaUlKeEVjdk5uWER6Sm05L1N6UEk2TGM1cmlz?=
 =?utf-8?B?eEpVUXVzTUhaYTdtek5yK2FQc1lNendWRVF2T3hOSlNkVlh5a0xMT0o3ZHRG?=
 =?utf-8?B?ZmVUTEdRN25TSzZhK09kWnk4WE9BZW5FQXBHSG93T2Nwc3Q1SSsxWG83Z2R2?=
 =?utf-8?B?UGRhN1V4bVpwenZUOXkyZDQ5aVRIem93enlvUEN2MGkvV3lCU2w3Z1NKM3BE?=
 =?utf-8?B?dlN4NHNiN29kMWtlL1JtMUdFMEZ2ZEU4NFluRlBzTVdUZXRFSm1aNlYxWXJH?=
 =?utf-8?B?b1hsNm5kOWJRbmU0VkVra2tlOVNhS0tlYWFKK0FIdFJuUjQzc2dJaTNRUjds?=
 =?utf-8?Q?fvzBvdq0piFFA0G2RhfjfuAaN?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Buy6Z2JFxeT9AKR58PeUiVRrnGL5m2VJrLs+S3Bf/gkPwWHllWwgKCihJJgoMsSCnu8FP2o5lbj9IDRSxSY5tO1LQonS7g38ZieAAFk170pfgUt5k69nMObMrwnH9Oo1LxpseyUgjrU8gp9eLoj+b3yN8oytXF6fGqRWTU1OyMF+AO/Oe0gbA5f1mq9Srr4GI8efuGmJMJJaT5pENjvxpTqX1Sy5OQjlq+fULTBgZVZHgtNhe+u3s0VOcmC92UmeZeb6pRrQe9Vsyk+2iiLwO6Ph5HIB+qT5h2wPoOK1PMxu1jzqckO9GAV33gpI2y8Vl5CiQdxiEnoZCFmp4LVSbR8SLz1C4TDKdVqXYFQPeb3SrYBQib2PSEpjjUX1wyDAN47yZUNKzAqGZ0WgRlXz+8Cn1FsrVQ8CRQXxLQXq6ZxF0dCeKcQQKPYkPYKyMBIDEbvop2TuaVzEcgfQFxqF0l4F35DX2TnwJXJvvu/PdDmsIt/7nvQWCUK852Xher1LHBtaZaB2BvaS5DZwXjUDV3X6m6oYzg4XaX9jhA3Pxk8DW453+JuwieB408cjWNeZHZzWZ3J2G+Olu7WNHsnoK4C1egrj1JZSXuIbImoaSq8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e7d27b-006e-497c-ab76-08ddd9078be5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 18:47:39.3697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b813VCGFaJm5hn2qHF6k3/r6+EexkLrOxEoJZZAebspLJwZETOdS4h0FObu2Gk+xrYiMdJlsO39xYlZsM6tTdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7738
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_03,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 adultscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508110123
X-Proofpoint-GUID: Sm0GjXlKh5YBHgdEFhNwdd1U-5gZLmA4
X-Proofpoint-ORIG-GUID: Sm0GjXlKh5YBHgdEFhNwdd1U-5gZLmA4
X-Authority-Analysis: v=2.4 cv=ePQTjGp1 c=1 sm=1 tr=0 ts=689a3ad0 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=c6qvqedUSojFFcdeKQkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEyNCBTYWx0ZWRfX0OkLd5DV+c41
 dGZol+WsPhVUfKXndAmIlnrO1uowRhQ2kK07ytjl/4tRN+Uyot8SuZ8ybNiJysX0J3rflNIDaNg
 uYx/dNlOXStj9oJQotEpItGVYKSOlcsTZG6E6JDXbr8KpGNL7wnAjmKOUyoMYHUUhVB+SKjAtDW
 xNUkEJk9B4kvuoB6JrDQNm1gn9SoFQj4XfViFKdGZvzsFwEq3/GcVxAaM6nRyjEsVG45bp4e/iU
 s44d7Y8F0QhAtC92LsbMV9rQB5zEGLObM8NMzZHO/GoK8KSPeeJiBJ3B1Xt4hCpw3z9ioOShUBT
 uw0kkUx/Tz4fwijf+sD61zapMAvuDUeRJ0kUcWfbe2ZfUdEe4uNa1quZ0QYcTDVW29kL8kZcc4/
 fmoytsUmc27OPnr+Cplc9VaeG1BmDKlKSlpAM2fbLycCk4N2ZGWMG7si9H9XQawH1Nu9/BWh

Wow:  nasty bug, nice trouble-shooting, simple fix.

A few comments below on the test.

On 8/11/25 12:24, Kris Van Hees via DTrace-devel wrote:
> As Eugene discovered, it was possible for dynamic variables (elements
> of associative arrays and TLS variables) to overwrite eachother.  The
> problem turns out to be due ot the implementation of the BPF helper

s/ot/to/

> bpf_map_update_elem().  In order for the update to be seen as an atomic
> operation, it does not update the balue of the map element in-place but

s/balue/value/

> instead allocates a new element and places it in front of the old one
> before it removes the old one.  The result is that the address of the
> map element changes as a result of the bpf_map_update_elem() call.
>
> Fortunately, we can just assign the address of the map element in the
> value that we obtained using bpf_map_lookup_elem() because that gives
> us a pointer to the map value, and we can assign directly into it.
>
> In other words, we do not need the 2nd bpg_map_update_elem() anyway,

s/bpg/bpf/

> and since that was the culprit, removing it resolves the issue.
>
> Test included.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>   bpf/get_dvar.c                       |  5 +----
>   test/triggers/Build                  |  5 +++--
>   test/triggers/pid-tst-timer.c        | 26 ++++++++++++++++++++++
>   test/unittest/assocs/tst.collision.d | 33 ++++++++++++++++++++++++++++
>   4 files changed, 63 insertions(+), 6 deletions(-)
>   create mode 100644 test/triggers/pid-tst-timer.c
>   create mode 100644 test/unittest/assocs/tst.collision.d
>
> diff --git a/bpf/get_dvar.c b/bpf/get_dvar.c
> index 1bb5eb002..073cca57c 100644
> --- a/bpf/get_dvar.c
> +++ b/bpf/get_dvar.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
> - * Copyright (c) 2019, 2024, Oracle and/or its affiliates.
> + * Copyright (c) 2019, 2025, Oracle and/or its affiliates.
>    */
>   #include <linux/bpf.h>
>   #include <stdint.h>
> @@ -150,9 +150,6 @@ noinline void *dt_get_assoc(uint32_t id, const char *tuple, uint64_t store,
>   		if (valp == 0)
>   			return dt_no_dvar();
>   		*valp = (uint64_t)valp;
> -		if (bpf_map_update_elem(&tuples, tuple, valp, BPF_ANY) < 0)
> -			return dt_no_dvar();
> -
>   		val = *valp;
>   	} else {
>   		/*
> diff --git a/test/triggers/Build b/test/triggers/Build
> index d49b996a6..30991db16 100644
> --- a/test/triggers/Build
> +++ b/test/triggers/Build
> @@ -5,8 +5,8 @@
>   
>   EXTERNAL_64BIT_TRIGGERS = testprobe readwholedir mmap bogus-ioctl open delaydie futex \
>       periodic_output \
> -    pid-tst-args1 pid-tst-float pid-tst-fork pid-tst-gcc \
> -    pid-tst-ret1 pid-tst-ret2 pid-tst-vfork pid-tst-weak1 pid-tst-weak2 \
> +    pid-tst-args1 pid-tst-float pid-tst-fork pid-tst-gcc pid-tst-ret1 \
> +    pid-tst-ret2 pid-tst-timer pid-tst-vfork pid-tst-weak1 pid-tst-weak2 \
>       proc-tst-sigwait proc-tst-omp proc-tst-pthread-exec profile-tst-ufuncsort \
>       raise-tst-raise1 raise-tst-raise2 raise-tst-raise3 syscall-tst-args \
>       ustack-tst-basic ustack-tst-bigstack ustack-tst-bigstack-spin \
> @@ -191,6 +191,7 @@ pid-tst-args1_CFLAGS := -O0
>   pid-tst-fork_CFLAGS := -O0
>   pid-tst-ret1_CFLAGS := -O0
>   pid-tst-ret2_CFLAGS := -O0
> +pid-tst-timer_CFLAGS := -O0
>   pid-tst-weak1_CFLAGS := -O0
>   pid-tst-weak2_CFLAGS := -O0
>   profile-tst-ufuncsort_CFLAGS := -O0
> diff --git a/test/triggers/pid-tst-timer.c b/test/triggers/pid-tst-timer.c
> new file mode 100644
> index 000000000..ae98ffbfb
> --- /dev/null
> +++ b/test/triggers/pid-tst-timer.c
> @@ -0,0 +1,26 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +#include <unistd.h>
> +
> +void
> +foo(void)
> +{
> +#if 0
> +	usleep(1 * 1000 * 1000);
> +#else
> +	usleep(1 * 1000);
> +#endif

Do not need the "#if 0" branch.  In fact, do not need the usleep() at 
all.  Actually, do not need the trigger at all.

(The test I used had that stuff because I wanted to watch the progress 
of the hash map contents using bpftool.  But for the test, none of that 
complexity is needed.)

> +}
> +
> +int
> +main(void)
> +{
> +	while (1)
> +		foo();
> +	return 0;
> +}
> diff --git a/test/unittest/assocs/tst.collision.d b/test/unittest/assocs/tst.collision.d
> new file mode 100644
> index 000000000..1dc0ec7e3
> --- /dev/null
> +++ b/test/unittest/assocs/tst.collision.d
> @@ -0,0 +1,33 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/* @@runtest-opts: $_pid */
> +/* @@trigger: pid-tst-timer */
> +/* @@trigger-timing: before */

Trigger is not needed.

> +
> +
> +/*
> + * ASSERTION: Dynamic variables do not overwrite eachother.
> + */
> +
> +pid$1:a.out:foo:entry { n++ }
> +pid$1:a.out:foo:entry / n == 1 / { fdepth[0x1234] = 1; }
> +pid$1:a.out:foo:entry / n == 2 / { self->start[1] = 0x1111; }
> +pid$1:a.out:foo:entry / n == 3 / { self->start[1] = 0; }
> +pid$1:a.out:foo:entry / n == 4 / { self->start[2] = 0x2222; }
> +
> +pid$1:a.out:foo:entry
> +/ n == 5 /
> +{ printf("%x / %x\n", fdepth[0x1234], self->start[2]); }
> +
> +pid$1:a.out:foo:entry
> +/ n == 5 && fdepth[0x1234] == 1 &&  self->start[2] == 0x2222/
> +{ exit(0); }
> +
> +pid$1:a.out:foo:entry
> +/ n == 5 /
> +{ exit(1); }

The fdepth and start names are historical and not particularly 
descriptive.  Over all, I would just go with:

#pragma D option quiet
BEGIN {
         a[0x1234] = 1;
         self->b[1] = 0x1111;
         self->b[1] = 0;
         self->b[2] = 0x2222;
         printf("%x / %x\n", a[0x1234], self->b[2]);
         exit(0);
}

with no trigger and do the results checking with a .r results file.
