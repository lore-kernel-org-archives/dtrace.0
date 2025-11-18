Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8461A30FC27
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 21:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763501403; cv=fail; b=IDHPrDUbeRa5UFiTDLpHnsZJjVWfW5Cl1/SqTi5zxwUgeAifeQ1VWPwd5exo5GYgsm6L5nnCUbwBLJoxxU6rnE0BFeC+nid+K27xmoHqgRmA7EsQzadWErs+dvibY+DWPAdwB3d765tmubE5Inxpr1dQro9r5QJb5ZdRdJ9xtqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763501403; c=relaxed/simple;
	bh=MXbRy1fZggwv08qi5LufdTmD+jXIXTDx4noSOjQi+vo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tv5CujQNELzeQjrFjl3/UKfsEoywXS9DrLcBM/sDrgef9Lb7PhFxc8YAfYiL5spp4obV55fs2HCzkMQvukIankJFClYjq0UX/0bVJgUGY5PZSWq7k8fGUS5s+DSZMfggUamXBiRuXlPbKAi+BSXyg/C6wdlohWtVjjQ9sH1cWQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NCclk//4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Uh52Lg64; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NCclk//4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Uh52Lg64"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AILOHiq028670
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 21:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=+/E4HlUwBru2CquEpAWeDfWtbhI0gGfD00CbZuqX5qg=; b=
	NCclk//43eSszP91+6xNyKL1pdM+wUQzZpeIlwTsw3goIojb0VHh24AywycfbO0U
	MrmygSruk4+97BMlBjRmahW4BwNCmfpAPzx24FX50yp3ZkDJIEyFwlY1uCBnXvuL
	8e7kkMgSYclVjlMMfbAnaUWUZ/XR6U3AOzRlo5TpERlL1nnfpfkNmAl83RKbiX6b
	YLC4EaxXZSH3fYpcSUEHOsH1YmTLq33Qkqh3rohruc1ToESOKP2OKA/o58KKwteE
	OBegnBo4CyWgP+f08OSLF9sRV3iO5NQQ1MRx7SN9+22hU2Y76UowuspGSpqAVHoa
	kKqNA+Y745FhWaeS71NJ0g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aejbbdyr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 21:29:59 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIL2Uch007899
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 21:29:58 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012029.outbound.protection.outlook.com [52.101.53.29])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4aefy9qfvd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 21:29:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hKr5RMRkqf4bateSgIrLrWIclCSWakNJOROCgVC2eJpYFeZqSGa4x5G9ql0b90xv1HF1FiOmrAlsHUucx0hNI/O9hUEiP6voVjZBEKXQ/4tRrX8LmauKpkNinzF8nJGk/d2BQrGw9/H+j3cX23USr8cp0FrUBGHPPNMm2RERaxM5dZKBaev/uLVOkXAtxxRbps0WGJj5vTUYyX+03NzvLFgB2MGnN5HKEqCGFuZy3S9BFFgtAeLNXN8wwV6eh1AdlTxiT7lUxSPIfH+6XIPt8KK2Y7eq9Ah6RJY35fx6XBvEvUxhTjzFwE/OxdQUkjbxFl4htmQNEPfSyHY5OomLBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/E4HlUwBru2CquEpAWeDfWtbhI0gGfD00CbZuqX5qg=;
 b=Q0Qu5+rr1vEyLGT53PXS/5o4xY/1dxp53nOMlcjlee9UIzCJo1IiTKp9I+F3fDrV3R0cKqanGJknflOqoWPcGFM1SOHMZLVBOsXWpc9rxD9u8wUSh7ymhc5RXN2h+GUCi32eEwzQO8MF6XCJaE1n1NPYzcUYpaJr5w+f8vzNAEq1gCFuHWsaw4H95khlDUhbpoBgMzSBo1/lgU2QCICw3rlDjibnGN5fLPqqmQ3cgIVyjqRbPq61ZuBRQz04lpcpy+U5jPVxxvQkLBF+LzX4j4cG6yuW3zlM92jjsUMS+NEADUX0Yqp5U8UzIhbNVH9e3Ay9A5q9cPEt3AODsrZVag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/E4HlUwBru2CquEpAWeDfWtbhI0gGfD00CbZuqX5qg=;
 b=Uh52Lg64Li3S1m0qL0HiV80wV7qSFQM6xvCDEk2JZvsRHSASNFQqPKXCmeTODcbGG7mbLt3IpLW87opzgZCHN0VTsbYi6n/sJt0YIgaT3+AgnEkCUoAxud5KHG48cmFmrDncrhqWF1/NPaD6HyK7X0cJ0nZ2A/woPYGc1G3GOCQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM3PPF4A29B3BB2.namprd10.prod.outlook.com (2603:10b6:f:fc00::c25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 21:29:54 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 21:29:54 +0000
Message-ID: <04333f12-b1e3-46a5-0553-c9adc285d92c@oracle.com>
Date: Tue, 18 Nov 2025 16:29:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v2 6/7] tcp: support non-libctf
 environments
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <BY5PR10MB3987C9621F900D4263A4AF44C2D6A@BY5PR10MB3987.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <BY5PR10MB3987C9621F900D4263A4AF44C2D6A@BY5PR10MB3987.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH1PEPF00013312.namprd07.prod.outlook.com
 (2603:10b6:518:1::d) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM3PPF4A29B3BB2:EE_
X-MS-Office365-Filtering-Correlation-Id: cb19934a-4293-4dbd-c98a-08de26e99d6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3NXMVBGTEwrRDRNbHQzUWsyQkFYTnN5eThFUE1nWDBTdWJHSUtmaUZ4QS9Z?=
 =?utf-8?B?RHJFbjRhOXUxNDRJaDFGQ29FNGNBVG5QWTBHSmZpWENQc3dLako4djFqUFVi?=
 =?utf-8?B?RDB5Q2FwcTVoVnhldWxJa0ZHaDc0ZDVrQUlDTjFHYTFVTCtHYVBNc0ZGVXd6?=
 =?utf-8?B?VjB5ejAvWVRDSmpEZ1UrNXhkcjEwTFFWUENtby9KNnpKK2R1eUpiZlozUXNC?=
 =?utf-8?B?L3RZWlNqaU1kS3ZnT0dHV08yNFhzNktZUXpYYTNLeU8ybjVibmp0a09Yc1J3?=
 =?utf-8?B?TnUrNUFwTUxKeGFlN1AyRnUzS3haMXlKd1lrRDhXeTJoREVhVXRSVmI3c2JF?=
 =?utf-8?B?L21sSXMyNTdHemEyQ0VEK1M3YktBckkvU0ZSZ0xYZTFKL1FmNDR1U3h0MUs1?=
 =?utf-8?B?Mm1Zd1paTWxEd2hzV25oakN0eW0xaDEzN21XNGtuNVVxVURBS0NlWlB4Q1hL?=
 =?utf-8?B?Tk9vVStqRm5rSFlEdlBmVHV2emo4UEVWS3lRWEpmZDd0d3pPM3BETDVBeUhN?=
 =?utf-8?B?YkV6b25rZFBFbEtKOXg0Qkt1bCs4TllhWkc4b1RVVFNrOWIyYklYSmFaVVZ2?=
 =?utf-8?B?aC9FRXRNL0paWG1FZTY1SXg5UVNXWXFhY1VubUdQR0M3aVh4SmxZeU1XOXZo?=
 =?utf-8?B?VEc1QVg3U1JqQ3V0NW1oS3BDbmE3M01LNFVKVEl4RngyY09YSTUrSGsrVG9F?=
 =?utf-8?B?TUdzcFdEcVp4SFBtOU15MU5sbzNpWnhKQ3Y2bFlPWnpQWTZwbUpITGExUnNU?=
 =?utf-8?B?UTFvTW1NNGdGaW5pNDJRSVU3aFlGUGpncnpjS3ArU0JxbEtLNG5MZkZzYnFJ?=
 =?utf-8?B?bWptZTNsdi9MekxGZzJvQ3FzRlM3MXdqVTQ1M01JUXFMemxNak9pYzFTUDZv?=
 =?utf-8?B?QTg5c0E2Z3hOSHlmWGpqOTNDLzJiRTlFdHdQOTh3MGZxVWpDV0prM25rM2l4?=
 =?utf-8?B?TmgvZFcvdlZnNmlxbE5KYTNlRHc3VDR6OWozMkM4cVhsVlZUbE1TdEhIdURS?=
 =?utf-8?B?YXRrNUxBOUFJWHJvWUNFeVhuUXJHM1FsamJuU3dqRURVekowSHpSMWFqUyto?=
 =?utf-8?B?eFBkYXZqSmN5QU5xTTZQdUxjZGRTTmhvMXRhcFJIMzJ1Y1ZnOG9aY1BsZVA5?=
 =?utf-8?B?MTl4Y3pGRWd3K1ZRazAwRllXWVZRcXhZOUpmWHlaM2MrQXM1YWxmT25SbUg3?=
 =?utf-8?B?Wi9Na1M2dE5uSUduU3hmak0zTytQNmxHOUFsQURua0VHbXlld1BjOW1LY2p0?=
 =?utf-8?B?elZzNSsxZk5DbzNheEtBR3VFSEpCKzc0eW5Ja3hsR3VINk5hbjh1KzBMVy9w?=
 =?utf-8?B?Mm1aVFdxWm9qTm1RbnR1akNRZVRyYTNPeDdGL3lYQTFENnZiWUFQbXpLNmFn?=
 =?utf-8?B?STJZYnlxQ0VZakZRZjF0TlJTT3JWc1p1OC9NWXRsck4rZlh4S3lXbFhQMGtR?=
 =?utf-8?B?QWFySVZHeTNEd25xV2RRWHp4bXowQ2JZdnR6RkU3MzZTQ2hYWmNmaG1FMzZl?=
 =?utf-8?B?NnZpM01FSGJ0ZE53VjN0TFdPc3lsbE5ON3lIM2pQTXFnWDA3K0IzUkNtV0xV?=
 =?utf-8?B?U055Mi9SYTZhT3VPa1Z4THlkOFRFa01DNHZCTVZKYlFJQkVxalFoT1puU0V5?=
 =?utf-8?B?T2doY0xKanZqd243ekZVQ2FpQ0wvVEJPQ2M1eTU4L1hBTWxuV1NhRnlhUWhX?=
 =?utf-8?B?KzdMTmE0ZytlWXdrL0VVcGpySWR6cVYzUDJYNXp5eU9ZalFsSTdGYTRId1FY?=
 =?utf-8?B?bmJaYjFTREZRZGxzQVdBOWhWZEVOVjAzYWRLMlJQNmtTc3lwbi9aWDRRZndl?=
 =?utf-8?B?dG80NGRtOW5wVG54UzdsNm1LZ2pXSVRaejdHcDRqbFpnTjRuUjRHL01BN0tK?=
 =?utf-8?B?T2NkQnJOZkppd0k1bER5dGt2d1Y2TnZ4c3B1NUlYZHhQSEV1WGhSOHF1VTN6?=
 =?utf-8?Q?yyDZsBy+Z4gxVM1ukS0oMfZNo/CyQ9PQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXgzRWJ3TVluNnFzQU5JOXE4QW9uSkhqcVVNbnJpc2g3MmM1cGtPdUUwZy9p?=
 =?utf-8?B?Qmk2SEdnZlJHTFlkdjhBbllVL3lpR2k4czRZT0dyRkZqam5OZEk0RE16WFdi?=
 =?utf-8?B?UFJ3ZjRuREx6OWtMYW1QS0xzUGxlaWt5NGdtaUs5STRuMzlIbUViM1JrSnNE?=
 =?utf-8?B?VlZJZGVXV2ZXNmFFaUFkeEhtNENSS2VlSVc1d1l3dlBsWTk0c0ZYWXRnS3JQ?=
 =?utf-8?B?SFhnZXAzWGd2ZW5XMXorejhjZEQ0VUJMaWJCWXZLcFlCQ3RIRmxYamhGcGU1?=
 =?utf-8?B?OXVROFVkYUljbEFVdHdqLzRkQ1NNNEQzMldFT0pxdmM4YlhLMUl5NWJBRnNY?=
 =?utf-8?B?MFRYZVV5UHVpRkhxTzhFeXRkYnM5VWdXanpNWHJjRXBnZm1qTjFJaWVnbjlZ?=
 =?utf-8?B?RFBUVjh4elJRM1VZKzlnVlpEYlJ0am1LNGdTekR0Um5HN21lZFBvSmRuVGtQ?=
 =?utf-8?B?dWF4b1pvRjYvdG14SDUzWm1FbFNrTE5iYUU0TDJRSHBBRkRCUXFRaWNMeVli?=
 =?utf-8?B?ZDc2dERmOUdZMGp5SDEvdmhmc2R6OUtickVabmEwRXlyT2dUb3FiSE9ZM21M?=
 =?utf-8?B?ZnF4SDhzNmlFcjh5ZzFVTTVFUFlPZFpwbk5vbml3VWIwSDVOaFRjQXpISHVo?=
 =?utf-8?B?SnhVOXRZZFlxUmg5anJHM2l1TXN3VzIzOWMzbzA5ZzU5aHJ2d2hqSmUzL3RW?=
 =?utf-8?B?UG5SeTRoWlBXSjAxUGxYcVphYlpZUGtYd041cmR6Y0lQT2dVRWFCbWFXRVZ2?=
 =?utf-8?B?V213RTJmZDNqNTBseTZjZVgyYWwvMEo3RlE1OVYxbGNUQk5mYmk5OHNOcEQx?=
 =?utf-8?B?TUpKWTBWcDJmUnU0RGFaUWZaSlhxMkttaUtoSFlaSkFSOGpEY0g0b3VsNHo5?=
 =?utf-8?B?R2FwaDRndzRGNSsvZmNDMFBtYVF0b0RLN3ZKOWtxcnBmd21jM1ZzaWtxRnE2?=
 =?utf-8?B?eVVKZmIveVUxKzRNdFdjL1QwMHQvTTRYSHRhUWFMYVp6WkcyNmVqTUF0SWRD?=
 =?utf-8?B?Ly82NEF4a0dPMWN5OHE2dTNtalZTcjZNSlBsL0RFWnRFMzNGMSsxVE9kVE5O?=
 =?utf-8?B?dnQ5OU54Y1hTZlM4MFF6bmN4OHNpamg1OTVZT29sN3pZdEs5bFVCZ2JLczRt?=
 =?utf-8?B?ZStWVk02SVFNQUgyV3BISEpNcXdPNHg4T3pVc0w2b0JNUkxvNS85bmwxMkR3?=
 =?utf-8?B?QThuSGdyRjFzWjVjSDlsQXdvZDdyK25nUUVlSjdVMExYUEtJVFZPMVBDR1k3?=
 =?utf-8?B?Tzlxc2dwNTVJVGRkK05zMXFNMUZ5dXJYTXlWNnc2c1FweFVPYkFDSnErcitp?=
 =?utf-8?B?T01xRDIwZ1lZemNNM1NRSzl3VFZibkNsdlQzL3JRbGxJMUVSdjllaDJYeHBq?=
 =?utf-8?B?SElZOUdjbTNQR1VoWG5LQUVSL1RoQ3Vibm9IdE9VNzNnTVc5OWY2L3R3alRJ?=
 =?utf-8?B?QVlzZ1NIOW8yRWt1Q0tPSDgxSGZ4V0EwcjhOKzNpaCtxSHQ1VjI2NHAzbEEr?=
 =?utf-8?B?cVVyT1dSOE1nR0l4T05HcE01cU4xaURaOU9DNjdCMFY4SUgxMVIrZE1GZUpJ?=
 =?utf-8?B?Zm1OVU5qUER4VGZjalpZTnl6VnhBOXJyZlVLQTlpaHlqejJxRWhSbmZkeVNO?=
 =?utf-8?B?bWRhY0tzeE1nZElQVFlDeWNlTmxRSlNteml4U2xjN0ZGYTJEZXFJTDZDZG9P?=
 =?utf-8?B?T0dtMW9EVnJnT3plaHArcmJMM1pKdnBMYWFVYXN2VlpRbHBlNGp5emYzM1hE?=
 =?utf-8?B?dkovaG1YY21DcEpsWXNaQ0VnK2VSSk5CWDE4S2N0c2JTS1BsYjlsR2lRNCtS?=
 =?utf-8?B?RlBUckdYMHBOZW05dUFNWU1nZlJVNVB2bDlmUEhRK2VxZndLeE01QURFRTNI?=
 =?utf-8?B?ZzNDdHQwdUN1eDRuZjR6TFk1cmZyVkVtQzFMMUQzdGh1Q1JiZExZU0ttOEVC?=
 =?utf-8?B?L1hCV3RWQ2dRZjM5OHQ4cFArRWxqRE5NOVNEMEtlNnkvajA2bWkvVWQzY05v?=
 =?utf-8?B?bmNaK2FVZDJHUTZ3Q1lDVkY5enNlZVB5TEVtVFJabFhFSzZXRkpxU1cwZHFJ?=
 =?utf-8?B?MXc1WmtmemRpQTF0MmYwaC9oVFg2SnRrREdkZkJaYkVOeVZLZExNNmZ3TkVk?=
 =?utf-8?Q?mPn47w/FHZznharru7X5q4zYB?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QntJgDe8DmevKs0LC44J1CocpFng0CtoK6sLBhgoqxiYOVnR0iSrNWVA0iuCfBKtuF6yzkyz96P66Zf+Ttv41F69STKEfZGRbTs9Kc/bIpgfGWWGkqrGWdX+pZ+RNPPYY05PR6cFukNM9hZ4KUO5jVojI+wnA7wHjb36mBGgGG8cnnXNvAp3O3bC4aTge1TRUeQHbkI8xb6U2cs9gW81Aw9waeJ3Tw4wsvLGy1FJYIbJJmHY/2BT677V6nQdj8wsIjlYPm9waAkKFKAtGbwM8ZmWc0BIsPKvODm5yFlo4ZtNNpx6D+JjkH1spTzZuGdfMZLLFSVPZ5GU75qVF59w8Qgvs1xfAA3gmZ2GxFhANG92h3dtcBmXstDe4HV92VX5i+OPbndDJ1KlPoct+ADH3HcAb0/CE+XFyplPo1nnkQjZFLdtVUq+6jkygusBrncd/H224IAm2JLYA0HIa0rLvaX82zhhOjRj1ILKaEbeqp/Z+aHUvNfy3l/aKPLbllndPALXQai09uKLhBmprr1yovwxHBrpqMT1yWc4lodwaivSZxHJQtzkUWTzaZBwAHPuHg5sHI5bx+N6J1ew08cyRYBDqDeuLkeEniDRe35O0Io=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb19934a-4293-4dbd-c98a-08de26e99d6f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 21:29:54.7908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kuyLV25qGSifxABSmB1Q17ZEJReg45z/cQwAnTHn/owaNuhCpgEbrKGqXjuS3xdRQpIegvuMR75XEBXIXwZQnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF4A29B3BB2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511180174
X-Authority-Analysis: v=2.4 cv=BoqQAIX5 c=1 sm=1 tr=0 ts=691ce557 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=Sbe4WtQgYTjGLcFZdm8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Dw0EU-S_rw2y-i5NyHMA2u6YhD4B3bjS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX4vRBTBO56HfE
 qemdSbAlC8URmrQ2ecbkOFRjkNx0sewneKZa8VMaHwGEEHTaIUKeMAFEW5Ja6nDfD2WSAaCzVUB
 RHQ9+p4+Vfr6cR8riF/yClnnvvB57UnugSznae91w83ase8CioOVyQ5aXQOKmsVPQz3P5U07boC
 nXO65uLs7fgenhzpXXUCH4H+IeYmxO7uaA2HgqS5W613N12GPi3wIVLPCBEehAOZbcCGtxoUvmB
 z4f+WDK6gBYC7gi5+IVpaV2tFRETyvTgytBAnmwt6ve8nbgnJPJJpUwqH2o9qg6ydDWehvn8Rcj
 r/o/T5M/8S0JwfR/OJFbd5k9fcXUK7bshiYvzHgO/EyBTu5p1Wd1DXY7DCIugkHDdziJ9Nv+tV8
 LydcPZ0n3TQhDE/5l7sbEKp6DVofqQ==
X-Proofpoint-GUID: Dw0EU-S_rw2y-i5NyHMA2u6YhD4B3bjS

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 11/18/25 16:08, Kris Van Hees via DTrace-devel wrote:
> Commit 0fa93b3ac ("tcp: new provider") and commit c08a5fcf2
> ("tcp provider: support tcp:::accept-established in absence of skb") both
> introduced code that uses ctf_func_type_info() without a pre-processor
> conditional to also support the case when libctf is not present on the
> system.
>
> When libctf is not present, it is assumed that the system is quite old
> and therefore is running an older kernel.  Use of libdtrace-ctf (which
> has been deprecated in favour of libctf) on systems with recent kernels
> is not supported and may lead to unexpected results.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_prov_tcp.c | 27 ++++++++++++++++-----------
>   1 file changed, 16 insertions(+), 11 deletions(-)
>
> diff --git a/libdtrace/dt_prov_tcp.c b/libdtrace/dt_prov_tcp.c
> index 44ed2bc9..c3d5553e 100644
> --- a/libdtrace/dt_prov_tcp.c
> +++ b/libdtrace/dt_prov_tcp.c
> @@ -160,17 +160,19 @@ static int populate(dtrace_hdl_t *dtp)
>    */
>   static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   {
> -	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
>   	dt_irlist_t	*dlp = &pcb->pcb_ir;
>   	dt_probe_t	*prp = pcb->pcb_probe;
>   	dt_probe_t	*uprp = pcb->pcb_parent_probe;
>   	int		direction, have_iphdr;
>   	int		skarg = 0, skbarg = 1, tcparg = 0;
> -	int		skarg_maybe_null, have_skb = 1;
> +	int		skarg_maybe_null = 0, have_skb = 1;
>   	int		skstate = 0;
> +#ifdef HAVE_LIBCTF
> +	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
>   	dtrace_typeinfo_t sym;
>   	ctf_funcinfo_t	fi;
>   	int		rc;
> +#endif
>   
>   	/*
>   	 * We construct the tcp::: probe arguments as follows:
> @@ -262,6 +264,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   
>   	if (strcmp(prp->desc->prb, "accept-established") == 0) {
>   		direction = NET_PROBE_INBOUND;
> +#ifdef HAVE_LIBCTF
>   		have_iphdr = 1;
>   		/* on older (5.4) kernels, tcp_init_transfer() only has 2
>   		 * args, i.e. no struct skb * third argument.
> @@ -274,11 +277,14 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   		    fi.ctc_argc > 2) {
>   			/* skb in arg2 not arg1 */
>   			skbarg = 2;
> -			skarg_maybe_null = 0;
>   		} else {
>   			have_skb = 0;
>   			have_iphdr = 0;
>   		}
> +#else
> +		have_skb = 0;
> +		have_iphdr = 0;
> +#endif
>   		/* ensure arg1 is BPF_SOCK_OPS_PASSIVE_ESTABLISHED_CB */
>   		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(1)));
>   		emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_6,
> @@ -291,20 +297,17 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   		if (strcmp(uprp->desc->fun, "tcp_v4_send_reset") == 0 ||
>   		    strcmp(uprp->desc->fun, "tcp_v6_send_reset") == 0)
>   			skarg_maybe_null = 1;
> -		else
> -			skarg_maybe_null = 0;
>   	} else if (strcmp(prp->desc->prb, "connect-established") == 0) {
>   		direction = NET_PROBE_INBOUND;
>   		have_iphdr = 1;
> -		skarg_maybe_null = 0;
>   	} else if (strcmp(prp->desc->prb, "connect-refused") == 0) {
>   		direction = NET_PROBE_INBOUND;
>   		have_iphdr = 1;
> -		skarg_maybe_null = 0;
>   		skstate = BPF_TCP_SYN_SENT;
>   	} else {
>   		direction = NET_PROBE_OUTBOUND;
>   		if (strcmp(uprp->desc->fun, "ip_send_unicast_reply") == 0) {
> +#ifdef HAVE_LIBCTF
>   			/* Newer kernels pass the original socket as second
>   			 * arg to ip_send_unicast_reply(); if that function
>   			 * has an extra (> 9) argument we know we have to
> @@ -329,6 +332,11 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   				skbarg = 1;
>   				tcparg = 5;
>   			}
> +#else
> +			skarg = 0;
> +			skbarg = 1;
> +			tcparg = 5;
> +#endif
>   			have_iphdr = 1;
>   			tcparg = 6;
>   			skarg_maybe_null = 1;
> @@ -340,11 +348,8 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   		} else if (strcmp(prp->desc->prb, "connect-request") == 0) {
>   			skstate = BPF_TCP_SYN_SENT;
>   			have_iphdr = 0;
> -			skarg_maybe_null = 0;
> -		} else {
> +		} else
>   			have_iphdr = 0;
> -			skarg_maybe_null = 0;
> -		}
>   	}
>   
>   	/* first save sk to args[3]; this avoids overwriting it when we
