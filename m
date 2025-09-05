Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DC5313274
	for <dtrace@lists.linux.dev>; Fri,  5 Sep 2025 17:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757092142; cv=fail; b=rBsaChJP2bl60ujeBcrlDS+BQaXuvQYwJ9Zb1LN3K7sBhli21IwU64H1hvPNGjP6P4j4U9OmaJzf0pddbEtLo4lfLj0gALpOnMJSsNHUGUJBxDlmKZhLeJhDqV6TdiL98GVWUFESLjYvAzE4dYv7SrriJHxHFvJ36f2MVPaoJoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757092142; c=relaxed/simple;
	bh=hp8Amz0LIjvLnMk1cYmmAxpeO0Or9GcoD4B5vOxEa8g=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b7c1TiwH073Kde4t+1k3UbkgIJV2L43ku/TvAOawesBbsAQ+te8pOcR6L7Uem6SYu7xpuBXKAypjazUDsXyYiOtYPTp2JlBlbdC5AdTRi2phBo560mefiI/PGo7xVzNB54n69Xztu8Qr7nyA/Z9RFflg7GOpxm6WoDnSdfGlyX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=a7KACVOZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KPOJ+iL4; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="a7KACVOZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KPOJ+iL4"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585FEYr4031950
	for <dtrace@lists.linux.dev>; Fri, 5 Sep 2025 17:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=PixbuwjaSCX7wY80KbfPw4863S7ACRVM2a5jQIpq2Sw=; b=
	a7KACVOZQwaomqWYg5khS9YKRAX5OHNkT7zFzm2hkWQ/+d+iEjMratV+XnJ9vUAR
	0crn0fFvwtoX8E9qLYUS0/WnelVtZP1PNlW+fCjWTnnbO2j/hhzI3P43eyn0B9Tr
	BaM/ObKA6Sjxsqj6lawYkLop3WuN3fUx2EIg4OtmZNaQBonj4OmuHEIF9VfR8YML
	oOBstkY9FwMmNBqE3+kXOpUfh7qMaIB+NsuW6sxbFFkaOuv84yMeBTkB+ugpWSPR
	477Tp2nJDX5YXoDP+FCCBIljXAyY9qrBb3vIwtnDUllQKfqYswb0Wna5wtT192/7
	KV2UnnFWDlbLAWiFD8JrqA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4902b2g7fj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 05 Sep 2025 17:08:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 585FQYLh026160
	for <dtrace@lists.linux.dev>; Fri, 5 Sep 2025 17:08:54 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48uqrd8x49-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 05 Sep 2025 17:08:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W6l27dk+U9U6an9FsweegzuElhgytVcvWQ1vUs9bwQskaukYjpq50d6iMpNgWqlWMZloXNyaQFuBvxfW8FkjWAANuHzwwUOx2Y7eHFMd5vC833bn6dEd+znlTV7cgK7COEfQ450L7eAj7EL94BgNtcCabO9Abk/j9eRj7Zxwf2SzQhVSFVNJcq6P8MeW9MpY+hr5HcECe1/Jft0O7gI48o4i4wmdBZC2CHGJHssofXSC8WnRTluK56irKAQ6Ge+XpWtKSRWR/0JB1tKu0xtCBjPoyIPEJL7pfSKfwZYTb27TwoBedVpzBRzpMLeVGukkGc9Dirws+xkASrTGiIdKcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PixbuwjaSCX7wY80KbfPw4863S7ACRVM2a5jQIpq2Sw=;
 b=Gdny9ReG70Yq+zr5TWoMVAmZkb1XZ2JPH+jvM+YNLaZZA+DEhP5hLe9b/6sjw//36HfYtaBHz8BQfNNyOmocrbKlH98j0vBr1rDcfmIwnNyKL0wmXEPgbl2L9swWdvt5VSndlDwI4np85wwMUC1V2vbQN827yMSes2v1PdqX+jnm7uwA+aJ2ooxu7Z6LyczQGbR9h6r9QoPWGzQgO/1VovrhNjsOUuFA4j+jifHK2RVFq1JlaiVrUMNX4LZSd26Svr2aSiVDqYlmyQBrIX2y/3W7bWic7KiSP23A4uHIp7nbUGqVlAUn2vLzM7TvkhZ+MUvj573EfHZGduf4b1gbPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PixbuwjaSCX7wY80KbfPw4863S7ACRVM2a5jQIpq2Sw=;
 b=KPOJ+iL4DH75LYNoXMn0SvS5JoyTlth31OuQjPYySiSTGPOGwS0tnQWh4GTH09qpYACId/BD2xvyDIQmOf6YHnCqs39oQWn6z2iNtccmuzSPnCO1HwAYb2/gwykQcR3p2HyoMDRgmcuiP3Ez/Ehp3yGsLG7WEu4wGLN/NeTN/uc=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM4PR10MB5990.namprd10.prod.outlook.com (2603:10b6:8:b2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Fri, 5 Sep
 2025 17:08:51 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9094.016; Fri, 5 Sep 2025
 17:08:51 +0000
Message-ID: <b0af3799-281e-44ce-7eff-c367296303b9@oracle.com>
Date: Fri, 5 Sep 2025 13:08:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/6] Convert ip6_finish_output to rawfbt
Content-Language: en-US
From: Eugene Loh <eugene.loh@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250905170715.11981-1-eugene.loh@oracle.com>
In-Reply-To: <20250905170715.11981-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0501.namprd03.prod.outlook.com
 (2603:10b6:408:130::26) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM4PR10MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b2065b8-a025-42a2-1242-08ddec9ee313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mzc2MjM0c3F5VWxJUEMxVmlCSnVldjgvamZtNnd2MHlKQWdrTHR2YnpURnlk?=
 =?utf-8?B?TnM1STQ4UTBnazdYYzltdFRaRk0vRmVUU0kyRUNpTGtGUDJoekp1Y0F1UnFH?=
 =?utf-8?B?VHZyRlZtYnR4L2J2b0ZmYXJTZWVrWjlLMXlKT3RLWVRWcFNWRDVUNmg3Rzhl?=
 =?utf-8?B?RkEyRWtiRk5GYUt6ZVRxWjl5TFRHSjB1MTJ3K1pGL2pGOHlhMVliOHJEbjRv?=
 =?utf-8?B?eEtzQVd5aXpZenNtQ0tOSm5qU1BEMkhzUTdxK2d6dnM3eklpbkIxZ0N2SzBj?=
 =?utf-8?B?VmhkNm5PbXRscGlibXU5YllmOUJsQjNhM2U3V0R0Y3IrbWRQTmdxMmJCbVVM?=
 =?utf-8?B?aUtySFY2anNMajEzOTNxbi9XMWgrKzdpeXo5WFlETUxzTUxKUnREa05jWmZQ?=
 =?utf-8?B?QU42S1pRVlk0QjB0K2VsWmkzd0d2SzV5SXd4dHNNQTdqRWZ4TEI5dUtWMmIz?=
 =?utf-8?B?V01VU0xYMkhseUozWkU0ZzRGMEdVSXNyNGpwOUZIc3pKMFk2RmNEVmwzdzg5?=
 =?utf-8?B?a2lMK2d6N2dyT05jRWZ6Ulpxdkd5VUhOaDY2a3IvMGhVU1ZuVGcyeGV6aTFv?=
 =?utf-8?B?cnI4NjBtNC9PL3cxNTJEYWt0Uk0vaklLbWFwV3R0b045MkpranVCMHF5TkZy?=
 =?utf-8?B?eGlsbWI2blljbjFDaVFVZnYxeWRUeHN6NlZlNG1tUW9MeWV6Nmk5SjRoNjl2?=
 =?utf-8?B?cVVhR0ZTdlhNN0Z2ajVwUE1kc2M1WXNRR0xWemNJYm1mNmZnSzJmaFFNTmVB?=
 =?utf-8?B?SU9ES2N5NW95MC9MODc4SE1Tem1JZ2dYNS92aStNSmhCdmN0VWNvb0RINXhI?=
 =?utf-8?B?cjlndE5nNUdXK1lxVk5FMDVmZUM2aytocGFlcEtoMVdyd0xFR2k4VHRTLzhz?=
 =?utf-8?B?NlRhYmRaWGh4SW1EREpwaUFQN2xOYVNkUzVIK3BHNW1LNzIyKzBhUWYvY3hG?=
 =?utf-8?B?U3VtU2JwY0lYMGp5TUhxODRCMElXSDE1TWpmMXBPZGpzRHNmY2VEcDVqNnN1?=
 =?utf-8?B?UWh4ZU5SNVd6TkZDQ3BkNFhHa0lvU2wxRnFsbFpZYlNsVWdmdCtBdmhlcDEx?=
 =?utf-8?B?dVdlWWVvdzBSa2ZNM1FzeTM2TS9uYzdUR3l1WTFWRFE1RXhuQ2N1Qyt1UWs1?=
 =?utf-8?B?S3NIOHFPbUwyNzZzUUhuKzlBUEY2a2p2NHdaUWo3U1B2dnh6ZFl0c3lIYUVy?=
 =?utf-8?B?dVJ2K2VabkFmVkdJNGU4UnJlS0ZydHgveXUxdSt0RmFXbCs0OWUva1psVTgw?=
 =?utf-8?B?R1N0OUJDNFRJRE5NZFU0ekJzNEVNaXFZQkYwczJRL3lFSHV1bE44bUpid2hR?=
 =?utf-8?B?c3ljTTZoRTBvc0dBY0hwS092NkFYMXg0NStHbjdvc0NkU1Z4SmJWRnRWU1Ns?=
 =?utf-8?B?TVdtNW9pQ29sa0dDeVBOdnRGY0o2OVpSTVNHTVQzSXQ4d3dHTENsckFWd25m?=
 =?utf-8?B?R080OFNXTm9HeHJZOGYrS1A4aDhtNjVLdzhid1RmVEVodzhhUTZkSFMvVnFI?=
 =?utf-8?B?dE03OUZmUUUva3F6LzhuWUhwazhudWpyTWJMbzdjWFoyVUdMTzczM0ZITGhp?=
 =?utf-8?B?WUhNZGVGQjg5Wk4wQS91VWZFd1Y5SDBXVGszOUl1dWh4SmJnblZQUFVsbG5K?=
 =?utf-8?B?M0tsS1lTdjhwclFHdXZGVTk3WVFGSjVOM3JtZ1RxaUJIanViSjAyR3Y1L1g0?=
 =?utf-8?B?RXduN1lTSkdyajl5RTZ6SEhJeXBUamRVdmhRQnVDZXhPMEYyWG82TXFYZDFq?=
 =?utf-8?B?NzlKa0YrdjdhMy9BNmV0S1VGQ3pCTisvVlpMNjhNNlUwWTRkT05kRDJreXVL?=
 =?utf-8?B?WXpGM29pTENLL3FVUE9PYlpCWWpiZ3hTMHlyQjdQVGpHVkNqdm5zeU9KZ2JR?=
 =?utf-8?B?VnRiVmUvcDBYYXhlWlVQTVVCUjJQOUN1SjJ4bmVPKy9YakE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGx0c0ZrT3FVS0t1czdLeHBzbnJpSTBMWExPYUtxTG9JTzlXMDM2M0U5T05w?=
 =?utf-8?B?VjV0S1hCaFZRNVM4WlZscy9maVV4a3dRNWdDTGlMeXBVeFFlTUpqcThFUUI4?=
 =?utf-8?B?NkpVcDZ4QnBVZUFCakFOc0tRdEo5MFBsaytUSnJyZEIyR3orQ3ZxM2ZNOFBO?=
 =?utf-8?B?OTVrdmtrTi95OVJXVUc0cXp6aVg4YzNmV0dsV3JFOFBBUGtWd25CZGxuejI0?=
 =?utf-8?B?RkVaNEVkZUdobjl3UDNNN0wyNFRKWGs4RDd4VmFxNG9tVDFRNUhGTkFCcmcw?=
 =?utf-8?B?R2ttYUdNaU5MTEkrSlBuZDV0Wkxzck1Gc0FPcTFrRFgxRGdpRkpqdzRNNWZh?=
 =?utf-8?B?UEtLZXY4eEZkN2NwdHprbHJteERhR3F5TFpEZGdZcFo1QzdDTlRVYXVkTmti?=
 =?utf-8?B?bGZzSmUrS3hRYzRIWURadGNFdFErSVoxdnE1MlB3M0czbHd5VCsvQTlGd3NV?=
 =?utf-8?B?aFNLd3lpTENMUHFpSHZ3SHZFakdzbFcrMWFEQnFFQUw0UzltVjNnZ09nWklG?=
 =?utf-8?B?c3NDcnhwb3EycDQwQjRtazArbnBiWEJQN05zZjkreVdtTXZKUXcxbW9rU2w3?=
 =?utf-8?B?SkE2NEw3bXBnL2pMTWhFTThRSFBFU3lzTUdqc3BBNEZnNU56Z25IOW9hYTdE?=
 =?utf-8?B?c3ZuREwweGI2bGs0YXdhR1M4emVDNkVnSlU5a3ZxQ1hMY05WaHdsaUFJRWxG?=
 =?utf-8?B?YUFTZkdNSlNweThLck1rQXJ0VDVXTVVUdGtKVlFENVdUV3J3Q3NuS2FQQ0lF?=
 =?utf-8?B?dnhtUTIrNlVKd2V0dU9iUS9jeCt5N2MvNHlGaFVLbm41NHV3SGdla3ZKQ3E2?=
 =?utf-8?B?c2dUcklvVEZqU29nS3R1NGlwZUx3QnBhV1hUZEdQRFhYQXAvOTlQanBWYldz?=
 =?utf-8?B?OE9JNXZhNXZBQ3VnTzJIdmJhM1dwODRFUHlsYk85eSs1amdJU2xWa3NPckZo?=
 =?utf-8?B?VC85TDZQQUVwQnlFVG5RQVkyZlYwNnlPM0t2TGFsbTBXWEo4eGRqOWREeU83?=
 =?utf-8?B?M1dxeG4wVm1TRXpaUXppV2JWdituMEdJRENRUm1FdGVMWHl6a3hCMVNGaDlC?=
 =?utf-8?B?VXRIbVplMEJWdlZzQVlZWTNaaFNDTVZJL2lzeUdFc051Rm5hQ29SQzZGdUNT?=
 =?utf-8?B?ZUZEUzFoMmxPbGZqbXlqSnBqOE9HYUFjY3hBU2QxMWFOMGkvWW1XNkdQSDRt?=
 =?utf-8?B?Vk8rRUlqVnhNM3lWempsRS9TcXFWb3Jma3pZckJSd0I2Q25CREh3TmZmTWdx?=
 =?utf-8?B?OUx2R3pwZWlUQUd1Ykx0MzA4am55OFluek9oaTB4WDdIcjFEUXRyL2ZwM3dO?=
 =?utf-8?B?QWhyK1loMHkzMjFLeDdqL1NsQzZIemE2NEkxVjVFc01ENnZha011Zk9nSkpU?=
 =?utf-8?B?MXJjai9zSE5NRTNRMzB1Y1JNOE9VWFlETkRteEk5c1NuOG9EVDkvazdqM085?=
 =?utf-8?B?RkR6Zm9CNThPWURoMjA2ZHVPUHJUdDlCcnJxQXZXSU1aN0hnaXJoUjlRYk82?=
 =?utf-8?B?SU1LTzgyZUJhRkJOZXFZOWpVTnkwM2FUY0V3VnlrNC9Ma0w1SDkxbk5pVFVN?=
 =?utf-8?B?LytZRUJpQlZkUUNnMzZoZ0QxVFRWM1RRemo5SkdUSXNyN2M1d21naGFyVlF5?=
 =?utf-8?B?NHY3L29aRmJUWnRteXNkdFB6OCsydDVSVmkwK0FXLzVNUEFWdDVCSW54U295?=
 =?utf-8?B?bWVXNE9XWk85dUwxNlJ4U2RaM0EvKzlaQzdZQmNOVktnRnBtSG56bVVvWGlG?=
 =?utf-8?B?SXpZcjB6ajA3NFh3WEE0d212NFAvKzBaYkNzKzVOWnJMTHErQ2Vja2ZPZzVy?=
 =?utf-8?B?ZThXSVB3YkZGY25Ga2czdVZCRzhFU1M5Ujl6aDh0M096QTcyem8xZUxMRGxI?=
 =?utf-8?B?REFzU3I4bTVhQXFzOTdSZTJsTE1WZXdOMUtsMXNRZjQ0S0pTMktXRjJGUTVp?=
 =?utf-8?B?WUlHY25lN3pqVHNBdkpxQkRsb1lTcHd3alJBMUZ3eThpMkhsMTB5SEp3UUdM?=
 =?utf-8?B?OWZHcUpaaFhJZW1IYkcwd0dDWUVQalJrVG1JbW84cGNnc3licXpUeDZpcXJF?=
 =?utf-8?B?UGVlY00rdHp5TzNPOVhna0x4aG56TWlZTmtTeHpsZDZpRVVuaTI5WkdFWm1B?=
 =?utf-8?Q?NM4nGnETxZqJiX4QG2xXc3NgW?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pQFG62UyJB+KobgLESwmgFnYmK83kqhHTjPjjIOLPdLOvceDMVZLB1jHmaClTjLPy1hVxD003loRQzEGxgXaEhgGtf9Q/JcVAAvV6ycG56hUlS7saKPACozosXovOwIQq70M2v9DSPQbSSMrG0nUf5Iy/+/5/kZR59c3Vtb+fngFPZ0y5U+QCr5Fzwr83cT0F1TTtJIQF/T63Woy5hwj7WpvFaIKiPQ5vpu0lNpwfri2snh0V2EDj6VFSHs8pWKOTZ+ev1HCGWdQgL0wJKhJzCEe7GWfvYDwk1U8dHCYmOxOiif5e8yG12j9uymlH6aTNxBQM3AIXr+hxBiMfJSIyz67TNrH+pW0vQfuQNvHx05tDHYvVoWw+29TMCNPAmsadR90BOsdHuri9hgfSMN49aViOMGyIwnDOcVswg2hQbS9qpmdfRB/1oRkrPk15b+TKx0B7mnvIwjoxQxJ5X7EspNjHL00B+b4Qh3DI1mtehzJ4NMI1WU5nXtSmF39U49f8PgM4TGP0w5Wpq3hNlKkdDrs0O/X8u44Xm7bu0Mn38g/EX3lSN7f97Fd5GC+zlaZdBW5Lpts6ELi4KO7TyEdJDEgMwfJyjBOYjNvN5NgkUA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b2065b8-a025-42a2-1242-08ddec9ee313
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 17:08:51.6891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o/X46yaH1+JqEPoykrRNKg9VHgkEpLoJ/lEobOwgvJEtqJHCdMGTeeSkHY3/oO/kbCjvtd2r5bOiPfvzRxz9ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB5990
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509050168
X-Proofpoint-GUID: NHf7WwPw4a5fXqBOKh8BlqDFh8hbsUJZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDE1MCBTYWx0ZWRfX1me6K7DoDhox
 g9h++Hvk3oz0fuI2bA9VZncb80w6DIToJxOGEcbEeb+hiPs6fjS9B+Rk3pCtONKoA6zbKdvftaL
 ZPZ4XhCNybFIOvxk+D7IKcB8i1/FKwsvQnWQDlfqz+02+caaMP555rEPbxkHbMJlbpcAZF7f4Ye
 Yt4DtlsS4d7dq+/PAPqXMJcPSS7ULdkENpnCoMaSys/BItTrtqZpU9F8RVttfhmj2KFGP3Tzc4I
 MBhie83X6f4Qy22csu/4w4+pDvCltnCPaCagsEwwBKEevNX1T4AwdzH9iUksdZE0TA4Sbm5S+db
 4OcIIEsFSqtiEtR4tkuwAE3DN355PJjl1LjwVDJnxam1qVIz1aDDDz8Rvg2sKF01tbfVQB+6NZG
 FjE4yNXPr+XGmy3iu8uygiPWJS4TsA==
X-Authority-Analysis: v=2.4 cv=X8lSKHTe c=1 sm=1 tr=0 ts=68bb192b b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=rUVqPPuG5dwAqvn9v90A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13602
X-Proofpoint-ORIG-GUID: NHf7WwPw4a5fXqBOKh8BlqDFh8hbsUJZ

Oops.  Ignore this.  It's already been reviewed and was accidentally 
sent out again.

On 9/5/25 13:07, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
>
> With commit fe2101e55 ("fbt: implement based on fentry/fexit probes")
> test/unittest/ip/tst.ipv6localicmp.sh started to fail.  The problem
> appears to be that fbt::ip6_finish_output:entry, which is needed for
> ip:::send, does not fire.
>
> Use rawfbt for this probe to revert back to kprobes in this case.
>
> Other fbt probes may also be impacted, but this case showed up in testing.
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>   libdtrace/dt_prov_ip.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/libdtrace/dt_prov_ip.c b/libdtrace/dt_prov_ip.c
> index e0919806..5384346b 100644
> --- a/libdtrace/dt_prov_ip.c
> +++ b/libdtrace/dt_prov_ip.c
> @@ -25,7 +25,7 @@ static probe_dep_t	probes[] = {
>   	{ "send",
>   	  DTRACE_PROBESPEC_NAME,	"fbt::ip_finish_output:entry" },
>   	{ "send",
> -	  DTRACE_PROBESPEC_NAME,	"fbt::ip6_finish_output:entry" },
> +	  DTRACE_PROBESPEC_NAME,	"rawfbt::ip6_finish_output:entry" },
>   	{ NULL, }
>   };
>   
