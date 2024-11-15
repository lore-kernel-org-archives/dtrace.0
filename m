Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B63153800
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 20:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731704125; cv=fail; b=ENvoaXH1u1259gGmCHXdeNACELA/soZN0Vd1Or8bNIyCuZBFtR7DHOwngpQAjju0FsRl5Wz9vaBPhGTzbe3ZJ1bIUzlMcstH6iG4CEDuLUbOGkti6t9V9sCdu222UbiLpBgERBF6eHLSko3jI4jOGGNkexmh61T/vYTIj4HXM0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731704125; c=relaxed/simple;
	bh=SHn695x/I12oMGlDcX5hhmm+1z/5xtTO01Uiov9Kz/Y=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=it0Ki8+nhNq2z/bDHytOGToBg26KyZc71So+sJTgCVTaiUgtScDJ18kjkMIK3nv8kmnQGXCg/qDTzTSi0kdWcey/cIgD4V08iXrHZjdQ+YUsYa2jpoO3YyF6rIyiTIkJDixFRVW4TU43Gwbvc7+c/A7N5pktxo1y9mPr/N5lhX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=d4Oun6Ff; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sve7hD9X; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="d4Oun6Ff";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sve7hD9X"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFKMb5j026901
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 20:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=VN+al0N4h2tzMABaDYkF13YOR8cnpBco1FdHdIjQa1Q=; b=
	d4Oun6FfpEGRvT2jyHOkj0UNziOuaohd/Z+uWhJEfhWxRi35r4IdDv6OiIwjy+Pg
	cQUC7H6lH8SrQL59pMRIFDceOCtof8Ng3EsHp+ZLFC5a1lDwAvqRv3VpS30i7hMO
	QqbnzynwYnVyUjk04PIOuJ6G2ox3PaGvFyoMpqtLcJV1t9L9a3BEVvw8vZb4Glia
	eHz2dwi2LUruREf0ZIDIZ5YdM6o3ZbFGJUYSLmB27KCBAQu4TxoEUSyV1xheCgM+
	uVD7N+cz0qHFJd69c25Tf12akhnhoBPFL9oT7F4goWS3egqNSxAwWusU4JiDsXGT
	9f8EyUIPNOjl7n/V+oWSaw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0k5m303-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 20:55:21 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFKNNuu022800
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 20:55:20 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2046.outbound.protection.outlook.com [104.47.70.46])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42vuw35rw0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 20:55:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FsMnAlVt1OWtTQKKXRKKjXBSShPij9CXPr6ONx+QMZUQg0Gp6VP7DOv3CgZ1MBdKyW/FSE3//xvkb3two1GK27GSTWZ8O0AX84klPXUm3JR1+sq1ywWSNNvPkAFofC/bYSvg+GHghlmqDb6jdpgxB6wzFE80XaIT+3T0sCQ5TwKoTD6IrRta4gLHqE1UGSHeuEkLAy32EUzs0kSHS2BhsSJ+wuqmi14NXnogsAGDFe3QmYQUvh8MjvCdiaLpj0OluW6H+JAtLtV0SrLXerhAlKmjhvcBk0E48JigEjPsXzSgV1VKoBxJCSbJPrt9ghlwhSdeSghIOOcYHpcpgsduGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VN+al0N4h2tzMABaDYkF13YOR8cnpBco1FdHdIjQa1Q=;
 b=RRzzkhVfiV7Vf5qs+2k0DEWJsyZQW6EUN8uCKi5srhRMGu3OEU+EsR/D3qEF7X6KbnwTR6O2mR11aoIDJtHqrOoKxCN5IHUFj/eZnlhBJ+Hwdut1Dz1fPl11ynI1BDxiTRSzZ1/vlHF/HaQd0uDi3ovFjuQukoL8+4kDEj31/VIPtHT6eS11fjEVDOl/dtEh2Tc3e9ndD1B40W1gHmjOW/M5EqbpUIfSzz9MQb4g/rCyKcGPlCDto6mSMJ/B/Tap/LxSnNTKs3HkXlP8LlREMatELIPZl/R1kspIQ1QfvQ4EEcx9CDFliuE2ZTacM1KIrMVkPmiZXamu8wWgbP0OFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VN+al0N4h2tzMABaDYkF13YOR8cnpBco1FdHdIjQa1Q=;
 b=sve7hD9XRsZZoocK+O36T9/ZPWduvL86Oduv8R08EVMX5zKCnudyhE64FzFsjdy91JuvRTPR7CTHx3642KtNMxBWReRBwcVwJR3aDsvUP40HozKC8ejvKJSil06cwvKVTk9opJr0TAmzjpxR7e/3YBnnP5x6C3B46qmgQS2Sm80=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by SJ0PR10MB4575.namprd10.prod.outlook.com (2603:10b6:a03:2da::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 15 Nov
 2024 20:55:17 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 20:55:17 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] dtprobed: handle multiple providers in a single piece
 of DOF
References: <20241114160352.47939-1-nick.alcock@oracle.com>
	<07a4d685-cc8f-d6f6-0d1d-e5933bddeafe@oracle.com>
	<87frntwnxy.fsf@esperi.org.uk>
	<8ec502f1-47cf-812c-8b8a-3258b1a7caee@oracle.com>
Emacs: because one operating system isn't enough.
Date: Fri, 15 Nov 2024 20:55:12 +0000
In-Reply-To: <8ec502f1-47cf-812c-8b8a-3258b1a7caee@oracle.com> (Eugene Loh's
	message of "Thu, 14 Nov 2024 16:25:42 -0500")
Message-ID: <877c94tdxr.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P302CA0027.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::17) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|SJ0PR10MB4575:EE_
X-MS-Office365-Filtering-Correlation-Id: a930df52-1d6b-4cc4-33d9-08dd05b7cf4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dlVWc1pWdjRyZUUvNCszNWdkVHdIdkdMK2VmOGMrdjJnaCtMU3VsZ0htMmNq?=
 =?utf-8?B?U2xwUndmUHlmLy9wYVpjUW10WTdFMXMySk80TzV0cXBweTBWbnBrTm9STCs2?=
 =?utf-8?B?M0hiekpKWjlXc0NvU3l0bzAwbzNHSWw4Rk5Ic0hwaWFaa3VGaGVENmd5bm5p?=
 =?utf-8?B?TnhKdEtZazgydWZvcWhWdm1peVNoKzg5VmJSeGliV2s3THFGeFlndmk3Ynoz?=
 =?utf-8?B?emd1bzQxYWhwUEc5bVkzYlEwTXV4L2dGNEtKM3d2c29vMDc5aWhOdDZTVkJ0?=
 =?utf-8?B?QWFVdnVJcEd4Rk1tbUYyVmY2YlU5aGkvOVp2MFlXakZQaFp0ZVhvSks5b3Q0?=
 =?utf-8?B?dGJmSG5lNHJ6TWgxRlhUeTdVWjU4SDdDNnZrZjhnMVA4NEg0Y2I4TUZ3Q3dU?=
 =?utf-8?B?K1U0NDc3MzNIZm9zWENzNTgxMFpNWVVlWGpZMUJseGpCSTdiTGZ4MldhaHdn?=
 =?utf-8?B?enJRVEhYSXphMitYUlNJdEhMRnU1Sy9TMCtwMm9lcXZ3bmVYT1VMNGVFMXR0?=
 =?utf-8?B?TXJLMG03MkxOOTFIb1NEaFhBZE9rbWRpQXdXcm42OGpOUzgvQ3lBejVuTXBM?=
 =?utf-8?B?dXBlSDlEQlVMR3lhOTBSUUhTZWNnM3c3aGVNVlF6ajdTYU1rN2ZDRzhvenZQ?=
 =?utf-8?B?VGt2OFA2RzQ0eG9MT2ttbjhpQk5QbjdOd0NGTFBBa3huVVk0dnJIS0hmRDlZ?=
 =?utf-8?B?QjRraXhNT2xSSTRBeUNOMVdYYVIyNk9qNXVCb2UwdHhDcFFDRG9IalpXSThv?=
 =?utf-8?B?czF2N1NhUE5DSVgwU0ZaV1BrRGlwWStTUVZGN2FPajZ0bDFFMVJ5K1dmRmFX?=
 =?utf-8?B?bDR3VXdPWkkyazR1aC82c29tc2NhNGJUb29qVFNJRmdEeFZRbDg5c3ZEN3Bz?=
 =?utf-8?B?QXA1bXVPRDBXb0w5VGZ6d3lGSHdCNW5kNG5HdGc1bGhoZ2tqZkV1a0FXVEFL?=
 =?utf-8?B?Rzc4K0p1RWVDOS9neDZSWWVxRlhDZW90cXh4WXhtR01pN0JkMWxYMkN6M0Ru?=
 =?utf-8?B?aDk1bGc2NnFveWgxVVQyTkgrbmdXT0poR01FL0FtN1FSY3RWSkFtMFZudHEv?=
 =?utf-8?B?RXkvaldDNmhDZG1DYWlIYzZiYWt6czB3ZUp2aURaMkhodW9tdUg5K09nZUdn?=
 =?utf-8?B?UHpINm55Wm1URkx0R1JMMG4zdGlJbGZmbGo2Y3RrbW5kK3VlQlNjang2VXZp?=
 =?utf-8?B?elhsUGdjcmtYQzhhdnRzKzdzT0g3U3dUaTB5OFJadWszN1NTOFZMbkhMY1pu?=
 =?utf-8?B?eUtDTkJQUDNEbmpuZTdWWWRTbGM3aFJnd0FIamVnT21QUEdwTUpCMTl1Q3F0?=
 =?utf-8?B?aDE2UEh0bFJaTUNyZ1MrUng4R3VVSC8weVVBQ2ZtWWowc1M4UmRzaW1QaWtX?=
 =?utf-8?B?Sk9lZGdpUzNZb2tNSld5a1VMT09JN1hpY2Z0OGUvVFJEYlM1MUhkd2VqT1ow?=
 =?utf-8?B?c3dhMExIL3lueDdaTUZndWFCdFJQRHU2SzFKWWErS3djb3pZOVV2QkNUYkZK?=
 =?utf-8?B?TU1xVkhVTFNreVptTEdOVzNLZHc5K1JCNzF6UE02N0htUHpSVk15REo5QXBI?=
 =?utf-8?B?ZlJKNllGdjBRKzAzT21vMmZ3WERQVXFXRDY2SDd3dndGQ3FMdFRhdWRqaytE?=
 =?utf-8?B?N0lua3hwdTEyUTllY3JadWdmWFVGaEZJd2N3ZVJPaVVYbi9BQVJyQ1RkeWV0?=
 =?utf-8?B?dmZpUFVmZjU3Sy9oRFM4d2tyS1RBMzI5ajgzRktvMUtBdFZvcGRUUHpOSVlW?=
 =?utf-8?Q?f+JMonuJm0cbKHqFFJuywIY8FWP+eAWQG1jmLhm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OW9TODJoMml5TEEvRmVRT3oyR0Zaa2puV0l0dzRRVjJzaUEyd3dlYy93RWhv?=
 =?utf-8?B?RlltRGdaclI0bkZPWkNJZlMyeUZCMjl3aVNmbGt2RHhPTmtBODZqSjdYN3Nq?=
 =?utf-8?B?ZWU1TlhTaVlJbzhoZ1pjNTQvL3haOHI3Q1RPdStzSEV2L1prUTVpRVNpRk9N?=
 =?utf-8?B?TnR3eGtRMWJ6T0o2TW4rcTJ0ci8wT1ZKMk5HOEhnak80MlI5NTd0N0RXYkUv?=
 =?utf-8?B?ajdtL3d6bHZZSFZPc3doa2xsZXBCL0FVK0hCdC9CMnRqT2YxanFocU9DcUFQ?=
 =?utf-8?B?RTAxK09PYW82YmtmQmJvQVZGZm9Bdnl1Z3hHZWtiUkx3UWNoVEQxYWtnajd3?=
 =?utf-8?B?UWFzT05vN1U4LytKM0hIa04vWG44QlNrQXo0TW1GZ3BMaGtubXZsUjJSMklR?=
 =?utf-8?B?Mit0ci9vd0V3MFRKV1hzWERSbnNlNk41TlNOUmxaSEJPZXN2akRQbnE4T1pB?=
 =?utf-8?B?ZzFBQ2ZMdER2TEtVakE0bVhZcDBTcm1wcmU0MExmS29oR3BGRGoxOWRpOHdL?=
 =?utf-8?B?ZVV5a090dHQrYktsYjJDbThVb1hzcmdhaHRjQXlmK0VEVHZHbHAyL0MrYmtu?=
 =?utf-8?B?d2F1TVpiTzZ6dEhMbmx2Tk8wS2JDc2R0UjZKYzg5ZG9FVFNkRHJORFp6a2hJ?=
 =?utf-8?B?a25Kd3dEeEsrS2UrS0VhRDU4WlB1T3QwdEV6RjFwK1V6NUozaGhWMHBJb0FU?=
 =?utf-8?B?YUliR3N1anpsWWdaaC9laUdyakFuRkZTQkxqV0d4VlhqTURvS0h1WTlvRzR1?=
 =?utf-8?B?QVMxNXVuZU5USXczeldrYWdEaWFnN1M4NmhQNmxwblpOSllXRjl6QkVXMHNM?=
 =?utf-8?B?OHgzOG5HTEdOdFpzY3M1U3RCc3I1OGVFUVo4QlZSOFlEQXVBYXRQQmMrdkRR?=
 =?utf-8?B?TEFwZEEzc3Qrd09SUkorQTZFWWM1WFhWNmdKOGxCam45TG45K1lpVW1sTHJi?=
 =?utf-8?B?MWlVVUxCa1NXR3RSRDdodm5OU21kRzRIWnFRL0piWkRDbExyV0VaRENPMnpO?=
 =?utf-8?B?MUY3QkZ0clNUazd3aU5POVlURFJGUjBJNDFzeW5IemNoL1NxcW5jZS8wSnM5?=
 =?utf-8?B?SE1sUU1YUGJGd0tkYTNORHJldXRPMXM2VjVmQlQ1RzVZY1kxZnlNdFNXSjZi?=
 =?utf-8?B?Uk1SNEVjOUhnekJXWHVRSkVQakxyTGdjMS91WTFoZjVJRFNILzdsbnV2bEVQ?=
 =?utf-8?B?K0pYTjI2ZGVySGpkNi9GVEYyblV5dFdRU0hGdUQyR1AwRWdTMWlUU0ZCalIw?=
 =?utf-8?B?NkxlSkJZR00zNmpXQmlaaTIxQXM4RlhJTGpjZlcyQTQyMzlaQjVaVjlxbmZj?=
 =?utf-8?B?YXQ3Ry8vTCs0bGhuQUh0eW82dG5jMndqVGFXOU5lM3RLTm1hSDlPMm0ya1o0?=
 =?utf-8?B?VlNJSlVQY2RzYmp0ZlczcU1vWFd6V3FwMEh5djZFSmZVM3YwVmJvcjljaGQ5?=
 =?utf-8?B?UmlpK0FvNlJzak1xQ2tIQXlCelZncm8vOUlONGNiMnlzTXd3QUFtVk5ZZlNm?=
 =?utf-8?B?ajdud3d0bkZIVFUwbVBya1hLbnBLRlZVOFNCbUhBNXRVVXBIWFpwYUNPWnVP?=
 =?utf-8?B?dTZaNWNOalR1SjU5bm4zUC9iaHAzd2ZHdmdOekYyNFZ6RmFOdnBURXROZXMz?=
 =?utf-8?B?ZG1uekFJRlI3ajRHRnpySkthR2x5emVxKzhnWWxobVV6TWRhNmNGRVNiZFFk?=
 =?utf-8?B?eUI2aVRWck5KMGhRaWcvakgzRVFJek5hajFrYmE5V2VpdXJjOXJwNXBVOEpv?=
 =?utf-8?B?eHVxc2NHUnpsR3JVQktRNXREOW9aK3QxUFE4aVNnZVRQdk92UnVwZ2hJd2wr?=
 =?utf-8?B?NjlPTmRBRVVoU1BxUWtHTmZxRkFIaWh0YndFT3Z6WkdrL2RWU1U1QUZnaUVs?=
 =?utf-8?B?amtsVU1MLytFZkoybzFFSDBoNy8yVnNBcjJodEVPeUpoSGRJU0hydFJoOW16?=
 =?utf-8?B?SW9xTWdhcHk5UnlqdHJua3J4WjJnejVWZ3M3MjBTQ0tOeFYwd2FPVlFRcmNr?=
 =?utf-8?B?b1JLNEJpMVhncW9RcTZPc2hOd2lKYXZwNHcvM21aYW50clE3V1Z6aGp1MCtz?=
 =?utf-8?B?MGVNSXBxamtUQkNnRUluYmtWaGJoRzA2a2NWM1F1RWRTMlg1ZHRMbDQxQjM5?=
 =?utf-8?B?TDZlQnZHTXUwcFMyZGpGcXlKWE9ETGpMOUx2dndwaFdFWENzbis4SGdwTmxy?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oJdnkulTo+cA86oKMfhQVwSZYiR3qEqrpJ+nf37mKstoFlkusiQU3vm7Hsjod5/7LZqssSUyCZpp3tN4lQcT1CcN4DvWrP8TnxpRMTU3Z45Ixfs64f3384tH4NESkpUeIcAWkogqrvXVzXPb2UvIMMs/RZV1qYdSLhSK+cki1AZ6FMwKH40TuXEs7JHR+tAOHeu1GoUgEvbJYaJnF+bA4PbFY6qB5F96APl/5pfVXUbSfakEp1UnYlk/otSJNux1Sy1uHMrFX2qA8KlBDnspWQjHrMR9kI7UH3hvbImMEJ68zkTn9y6pNqOqKBlApL61GDzaiCIAVEL4qBYurhRGw6lvsxL1lX2ELq2cYj860DIauuIDE6SNU9Qi5Di32IkzA0/goih/Foi0M+gBebP7YUpBbox7dk9BljfbS1E4o+dkwSmchfn1Fg52kpezcQc+kHwUEqbPaeaeqsD6k9M7S6yIdS9OtiSPdSBZHlmppVSDMdg1aMA7nRxq8ZHU2uyt3H1zlHM8zGRyEb8YRghKar3/Re09qH0kMTpTPVSeQX/MZ2Lx2QNXvphcVNjaX6qdY6szdIQXWW68h724UK6Jzn0kElZR+rtUhGhmDW+tKpY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a930df52-1d6b-4cc4-33d9-08dd05b7cf4e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 20:55:17.3871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: thY0H1VgDaxpoBXc/VTXkNX8Ci5kmpnoWSNlVsOz+A3Ib7Pttp3qiwnfajNbVc2R9Y8EmiacQXzjbknLzjsMiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4575
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-15_08,2024-11-14_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411150175
X-Proofpoint-ORIG-GUID: 5NcJwu5GMTGchkdrjIJL-GGxJEZWqdty
X-Proofpoint-GUID: 5NcJwu5GMTGchkdrjIJL-GGxJEZWqdty

On 14 Nov 2024, Eugene Loh said:

> On 11/14/24 15:38, Nick Alcock wrote:
>
>> On 14 Nov 2024, Eugene Loh told this:
>>
>>> On 11/14/24 11:03, Nick Alcock wrote:
>>>> diff --git a/test/unittest/usdt/tst.multiprovider.r.p b/test/unittest/=
usdt/tst.multiprovider.r.p
>>>> new file mode 100755
>>>> index 0000000000000..ae8493e3d5be4
>>>> --- /dev/null
>>>> +++ b/test/unittest/usdt/tst.multiprovider.r.p
>>>> @@ -0,0 +1,2 @@
>>>> +#!/bin/sh
>>>> +grep -v '^ *ID' | sed 's,^[0-9]*,ID,; s,prov\(.\)[0-9]*,prov\1PID,; s=
,  *, ,g'
>>> Okay, though the "grep -v" would be clearer to me if it checked=C2=A0 '=
^ *ID *PROVIDER *MODULE *FUNCTION *NAME$'.
>> Why? We're not dependent on the format of the header, we just want to
>> get rid of it.
>
> It just seemed to me easier to figure out what was going on.=C2=A0 It loo=
ked like a recognizable header.

Oh I see!

> What do you think of ' *PROVIDER *'?=C2=A0 The 'ID' is short and strikes =
me as especially confusing if one looks at the post-processed
> output, which has 'ID' all over the place.

Yes, that's good :)

>> Having the test fail because the header we don't care
>> about changed layout seems wrong.
>>
>> I might just drop the first line with tail -n +1...
>>
>>> This whole thing would be clearer to me as a single awk, but maybe that=
's just me.
>> How? Piles of gmatches?
>
> gsub() or something.=C2=A0 Anyhow, your choice.

I always find gsub() sufficiently confusing that I have to check the
manual every time :(

>>> Comments might be nice.=C2=A0 I'm not sure how comfortably people read =
regex...=C2=A0 I need to concentrate hard to figure it out.
>> Honestly this is just doing some "replace changing numbers" stuff like a
>> hundred other .p's in the testsuite. Looking at the .r makes it obvious
>> what it's up to.
>
> No big deal either way (e.g., adding one-line comment).

Totally agree in re a comment :)

>>>> diff --git a/test/unittest/usdt/tst.multiprovider.sh b/test/unittest/u=
sdt/tst.multiprovider.sh
>>>> new file mode 100755
>>>> index 0000000000000..d5b72c2be77ec
>>>> --- /dev/null
>>>> +++ b/test/unittest/usdt/tst.multiprovider.sh
>>>> @@ -0,0 +1,15 @@
>>>> +#!/bin/bash
>>>> +#
>>>> +# Oracle Linux DTrace.
>>>> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserv=
ed.
>>>> +# Licensed under the Universal Permissive License v 1.0 as shown at
>>>> +# http://oss.oracle.com/licenses/upl.
>>>> +#
>>>> +if [ $# !=3D 1 ]; then
>>>> +	echo expected one argument: '<'dtrace-path'>'
>>>> +	exit 2
>>>> +fi
>>>> +
>>>> +dtrace=3D$1
>>>> +
>>>> +exec $dtrace $dt_flags -l -P 'prov*' -c `pwd`/test/triggers/usdt-tst-=
multiprovider
>>> Okay, but there should also be a test that actually fires probes.
>> ... why? What we care about is that DTrace can see the probes properly
>> (since we already know from other tests that once it can do that,
>> everything else works), and -l is an easy way to verify that (and in
>> general exercise the entire pathway up to USDT probe discovery in dtrace
>> itself) without having to get tangled up in even *more* possible bugs
>> around probe firing. I hit enough bugs in the parser writing this as it
>> was...
>>
>> I mean I can write one but I don't see what it's going to tell us.
>
> I'm less concerned about the bugs we can foresee.=C2=A0 I'm more concerne=
d
> about the bugs we don't foresee.
>
> I'm even interested in the case where probes in different providers have =
the same name.

Seems reasonable! I'll add some tests...

> Different subject:=C2=A0 do we have a test for "dtrace -lv" on USDT typed=
 args?

Yes: test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh

--=20
NULL && (void)
