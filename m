Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64561F37A0
	for <dtrace@lists.linux.dev>; Fri, 31 Jan 2025 20:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738355400; cv=fail; b=Z8rMbm5XGXIbEEHIcREoUjkHsnm9tO4VX1QWUO+VNd4q8gO0NJbVdnlBINWwmLnAtyBnS24LFkM0alCa/Fl1LxRl7nud02YOrXSQD6G1Q/CkB18T1ecWAA2/uxq+P7Lpv8GJlff5FxKBw82+imrj7g6F+TSyvbTuzMG5or5RXFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738355400; c=relaxed/simple;
	bh=WXQDSN5DaID0SuHngcoidoXZv3Lcm5OBVHxTImqHSfY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=m7r0E4MHskCsOfH5Fy3CIi05fodYwA50RB0KXHaOjgMKTpZK87KpbSOepHdYX8ZaN7ERCdmo794O8I0mAXWp1yEmw95RSC0Qse2BWcNkFhjHeVJe9TZsdrKY89gRDGzdoGhxV9vevLcrSRPgZP2OfO8ODU2efeTyIG+LO8XwOho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RwLeHjq2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yNg2PYkx; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RwLeHjq2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yNg2PYkx"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VJXpCo014000
	for <dtrace@lists.linux.dev>; Fri, 31 Jan 2025 20:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=lZMJ4PK6NJGtxavzohOuY4BUIuPlD4TYv6fKwUnSwvc=; b=
	RwLeHjq2L0/7x2X5CZGIXFUL0Cv3ONnNnMrz6if2iAmhmtUk9bYP0RN/HYVijG6S
	mQCjKo33nl+doc/lAMKP23Xj3dFuXYWIKhzQLRwyUJpq/rWU8n1UfjdfTWp4Bt2q
	2eUBysipMYZRgAoeSS4h3dxvUqLrHsaUZm9F/EGEKlEq+IserfRwcVQQ9FYir7D4
	Sp4kVOdqrdF7G5HKSdpdaiHpChmMwpWmgdKHeaJksmWkKQ+b67hWYJSwU5g2+osS
	P5OWAf4TD1ScIroMM1xetpfWuAo0gKQpOjoTx0FjaB91hFCmIspsaue3kp684dcB
	gGO1Ed5olQwgaEt6n9eO6Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44h4rp83cx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 31 Jan 2025 20:29:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50VK2JSb016755
	for <dtrace@lists.linux.dev>; Fri, 31 Jan 2025 20:29:56 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2047.outbound.protection.outlook.com [104.47.56.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44ggvkrwkv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 31 Jan 2025 20:29:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ezUtYclaOkgcFqGKkXxXFb5ZvfgD35rw2yVSAPUMi1D2K5p/5TQVFnkYWSVudJQnoV5te/7OfK7JyBaa+cef45CfBZdg8tudHv4xC7bRbNITsWs4u4CACwi0a4F6cgD7Jb2rYBw4c8n+rnb4kcPrJRG7EjaFR6a0bWgquZtorRdkHSO0rsJRrA2/sKIHdMXa8voqidlaSsu+MGt2g520WGJMDVc55XUlgaPUzjT3NKoAV89kO16DUnYzSMidyuUeoL7Lt57WHQoFRKoEZEMTsq0cDFyhUcrsy8y9iFU9d6f+SmrMW9e/bPTsMxuOcP/g0fGorfE/yyBhwb6guVLXiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZMJ4PK6NJGtxavzohOuY4BUIuPlD4TYv6fKwUnSwvc=;
 b=t3jDNKbdhW+2v1I53iHXIs0XsEoNLAYMKfORUKvArGZyJ7QFqztY9Rh8X8QphECQMiuIc2VCQctTSpf0d3KzP0rYyLCAtApyXmLRSskJ6eug+Fp4z9+Y4zgCnNhGhWkZP3TwJhVDUXsAWFwd1M28RRKtzy1/4udqGAzEpPBkwlzPHdhyas5J8fLZZuPDgtOgQha6xH60c+gzSGHbdhnsFFdv/1je5+rrQJpAidgl3SdUi7jTuT4mbgQNq+yZ3HmIP+cHyc4OMqaNePcaJgGi7Hu7TbXlcaW6hSLzBs6Oepn9C/NGWwfxTEZksafBeWid3+ubkxySMW8D6PTquO+uxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZMJ4PK6NJGtxavzohOuY4BUIuPlD4TYv6fKwUnSwvc=;
 b=yNg2PYkx6o9qD1roPNQi0ek6L5+A940YQpDxwqkGkaT5CTAw7FZaIwz5imvtpqWIrOfCOrVPy4I8/5zS/r1ri3rEuEpfHNX/YgyuZGONY3TU+QtH4Ej4eZ9kNch4/14OwoL6dNtOKR2ImZVMP6rJh4riUV4/a2fHT2X6ifo1gkg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA2PR10MB4458.namprd10.prod.outlook.com (2603:10b6:806:f8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Fri, 31 Jan
 2025 20:29:54 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8398.021; Fri, 31 Jan 2025
 20:29:54 +0000
Message-ID: <b42108ba-e583-9204-71b3-859b9a46873a@oracle.com>
Date: Fri, 31 Jan 2025 15:29:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v2 4/6] procfs: implement d_execargs() for
 pr_psargs translator support
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <PH8PR10MB6337029F91AD9127B9013409C2EE2@PH8PR10MB6337.namprd10.prod.outlook.com>
 <b5896523-3248-fea2-3a02-ba13353c52f0@oracle.com>
 <Z5z8TG9TsewzE5dI@kvh-deb-bpf.us.oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Z5z8TG9TsewzE5dI@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR05CA0065.namprd05.prod.outlook.com
 (2603:10b6:208:236::34) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA2PR10MB4458:EE_
X-MS-Office365-Filtering-Correlation-Id: 47c708a9-7938-49ae-aff3-08dd4236052c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K2FseENzbGltY1hwT2paenpPemloZjRTd3hQN0FvK1YzSzFTZ3FITlhsd3Fx?=
 =?utf-8?B?N0N5c3VRdzZHU0orQ2xXTG1XQ283RE5oM1R1NUJoWjBRV1pWbG45M3d6MDdG?=
 =?utf-8?B?VlpRQTBGaWd3SVE4OUJBeXNIRzkrQmxEblV6Sm5ITHljb1I2TWZ4YThjMzZG?=
 =?utf-8?B?a3ZLYWdBZElQZG0rZ3h5TldyL0puQ3RYWGF5VWNDWTNyUm1sT1hQTUwrMzlX?=
 =?utf-8?B?RnZLdU5qNHlJMkhKQkxqYi9jRmhEeGF5QTZwWXZnSWw2SklTWVlRQzlQOFVO?=
 =?utf-8?B?dlY3T2Y4MlB1L004dVVMYm1PZkN5dGM4b2dhQWZIZkVMTUNGTEdEbmFYYmQw?=
 =?utf-8?B?Ui9iejJGc2RhOThpZTJwb2wwMitRdWhqN21kMUhIcHZROG92YnJrUG5Hc25D?=
 =?utf-8?B?VVhKT3UzN0dwaFRFTGV5V2J3dDZubXRGWEt1YjIvWHVpZERvaTZLazJLa3h1?=
 =?utf-8?B?SkN0U0JNT3BJNEJlWUtZc1l4Y3k2cnRCUytSV3hiazNVZ2h4eVZGUlBRT2k5?=
 =?utf-8?B?L1hMVGpNeDlVTnhVK0lFK2J6d01obmxBRFlCVDNMVVowRVlwMHl6MmdKVURj?=
 =?utf-8?B?ekprckxvQ01jVmlCL2xkMmFXQktYZGVNUXluN3ZBN0hvNk1iRUxjejlHSDRy?=
 =?utf-8?B?dHNWd0NjYW4vV3paaXdVbjBzRDR6blptdjc0MHVEUmpsREZPSVJ5SG1yZkhR?=
 =?utf-8?B?VlI3Zks0YzQwdEluY2JPM1dnT3B4STYwMGdJSlVQZmtaa0VXWTJIZHR4N3Vo?=
 =?utf-8?B?aGJCZms3YlpHQnkyRDEweGFwZm8zdGFMOElKbWdweG5XT0wwUk5NcEJqQW5p?=
 =?utf-8?B?VjN0bG1XaXJYWHVjOHgyTGRYbWtpaUhwVE0ybUF6dzZpaHo1NWVIeHNHQzdx?=
 =?utf-8?B?QnpWSkdtUkh4TytCaS8wamVXYlhoTlBwOGZFckN3RXY2QVhSbzNXLzRaY3Bh?=
 =?utf-8?B?dzl3K3VBOW96OXNHWXNiL2s1N2VGekErZ3YrQm9YUnVhWW1CVFJjVkIxbFBr?=
 =?utf-8?B?QkN6NVhhdGdtQmtJUENpVjlCSmw4czh5cDgwQkpZTFJtR0F5dWJOUXp3T2ZN?=
 =?utf-8?B?aHZ4aGpzTUdNK25BTnZ1ZUdDMk1WVDQrQjdLUFV3c0syMFBaUnNVOUdmM1ln?=
 =?utf-8?B?RGIrcjBDVmc0aXhIVE1kZk1uS2lQbzBYT0dOS0MvQU1lYUtDaFZaM0Yzenhx?=
 =?utf-8?B?REFEN2ZnYU1reFpUbzVrdk0xZFZjN01xYkQzYVE5Q1o4dCs3dU0vcC9NUWlv?=
 =?utf-8?B?T0RmTktzbnMvOHoxSk9KR3pmYTM1TENjVDZqaU5EaS9iZ1hNcWlHcnhHUWJC?=
 =?utf-8?B?MXZhWGhYYnJaRkY3Y3IvcUdQeTRid1p1d3VwMHY0REsrOFRvcURJK3I0WUV1?=
 =?utf-8?B?YWptaXpJMjIxd2dnVGN4TTRxdUJTQzJCcDRJTVdmTHFrVWZ5Y3BIaGNGNGgx?=
 =?utf-8?B?U01rQ0pnY1pLeXZROGkzZ3dmT2JxelZSbWpOdHJpdU1wNEdxRFEwb3AzWGUz?=
 =?utf-8?B?ZkM4M0htbkh4VnFpNUhXcGQrczh0TGp2ekl6dVZPbzNxSVBhaUExK0FmcjJy?=
 =?utf-8?B?V3E3NlBIZXAwS2JONW1mdHlta3ZFWXl3eHFNTXBTSTRYTzAvaXMydTROaVh4?=
 =?utf-8?B?T29tTDJ4RmRsT3ZMMnlTTGZIREJpWUlwMzVva21MdVp6eVJkNDU0QVkyUitM?=
 =?utf-8?B?cUpyR2luSzlGT2htemZ6U3ZzYU1ZYkZpNHl5MDgwN0VCakZJdWZZY3VpRFVY?=
 =?utf-8?B?Y01aR2IxblFlQVQ3NVcxZ1FpOVEzb1F3NHVEdUxhMGY0OXJ3UFdHUGRPV1JS?=
 =?utf-8?B?UVdVWEEzVGUzdksyZWlPRU8zd05kaEZ5QStYbmwremljY2tTWHl0MUFVS2Z5?=
 =?utf-8?Q?pdzbr98IUdfFl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1JyR3lvM2ducDRJYmwxQjVmZmlwUTlienFmUDZDZUZZTng5OVdaeXFSVzNP?=
 =?utf-8?B?NTEzVHY5MVJ6K0xFcFFWN2NDa1JBdXRHclF1NlVVTW1DRmNsQW9RWVRSeTF0?=
 =?utf-8?B?OTFnM01HTkpKRW9nTHRRbXlHckhIL0wyREFPeWp2d0Y5dmpvSTVPZEZaOE4z?=
 =?utf-8?B?SlliRFd4OWFTaU42RGhKb0dQWUVjbkwrR3NSVXdtcUtBNkU0RklFOG5TajFt?=
 =?utf-8?B?VlJYdW9WODNiaG43YVNoT2xFcnBDVFozMlhCaXN5QTUyK1dNM0E0NmVDK2sy?=
 =?utf-8?B?c1Fibysza0tmQ0hySjREMDF0YzlEc3ZLUXZlYTJTcDNaOXUrNXYxcURxcFRI?=
 =?utf-8?B?b3ZyWDBuRklma2lMUlJsOGt2dWo1NGRnWEVoeElmYXFaVHdEZC9QT1dpbkNS?=
 =?utf-8?B?Y25RSEY5MzhmYTBGR3JqQzVJWW1MWWdxdmxiWE8zS1BQcnU3aUd5anVMUmhi?=
 =?utf-8?B?L3Mwckt6VFRjU3hHUGIxTTh4b2dpVHgyRWcvL3ZKRXhvMGxGTmZpZ0xaVElP?=
 =?utf-8?B?ZW5jZ2lnclVVdllSSUJiWlN4K0d1R2FTTmhiUzhjcTVlaEFBTElDSmV0QUxa?=
 =?utf-8?B?cC9NZUphYzAvai84VmFvVStvMElKVEowQ2Q4bzFRRmp1WktGaW1KZmI4dVhi?=
 =?utf-8?B?emxUZVRsbEIxSG45UEcxNlhGUnhYSjVKU2p6WVJaY2lqanFzZk0va3dzUHNM?=
 =?utf-8?B?VG5wK3FERHZjNnRWS2pGcFVHTEhwNm90UXdBbGtBMzJ3OWJLT2VERXYzRmdx?=
 =?utf-8?B?Q2UyT2RxbnIxT0J3S2ZxSmY2SUgyZUF0NjIyWjJteUM1bGJSaFdzWTRoRFo1?=
 =?utf-8?B?bEVMeERZclRCOTlQcUIwZGJCTHMyUkI1dEN4dkkwdm1GUlR2WVloWlNzNGcv?=
 =?utf-8?B?WFViWXJPT25HNXdCcEJrdldZZFdLZmo4WkdpbXV1czdNK21FZHBYbzZOY2xm?=
 =?utf-8?B?R0RWbjVrbmZidkxvMVRSMFhyMkhCVC8wVFdnN1U4WGxYSGJlb0d4WTRZUjRE?=
 =?utf-8?B?WjQ0UlJoa29sU1ZmQVR1OFpSU3kxY3UyUlFFMmtwQ0hCSnFFZFU2ZXVKNFpY?=
 =?utf-8?B?eC93cVZ1S1YvU290U3RkOWVabFdkL1IzaGtOcWg4ZkMwWDkwQ0FNVjgxRkto?=
 =?utf-8?B?VkVkdktydVI4VlMxZnhFVldUdlRBMklCUk9BN0NBaSsza1dhS0tJamtGMkJs?=
 =?utf-8?B?SFJLeC9sWCswWmJucm1ESkJSVC8yem5RNmtvbCttRWFWMkpqY29IMDRoUzRq?=
 =?utf-8?B?N2dGcnR4YzVqdkFoOU9SQzZSVHpqcXlnc1JCZ21tSVhNSnVpMVhFREJ2cEFT?=
 =?utf-8?B?djQycDdWcW5SYmRMcTI4bnhVQVRSUkt0dThwSzFEVlpza2p3VU9IdWFza0d6?=
 =?utf-8?B?M2hzZmRJeTg4VTRZU0llUXJGZ2V3anozdFdzb3ZjakJjMDd1ZnNQNE5OaEhl?=
 =?utf-8?B?Q3hCZVVzVkdmN3hFK0k4bUNKQjNTd3d3SEg2czc2YzlZOWJrSFZZbTZtSEgz?=
 =?utf-8?B?NERCRG9keWtPWHdVYk1BOGJ4TGVzUUxPbjFiYVZFbEExVmlXc1NPQnVWV0pS?=
 =?utf-8?B?UXRaTzZSUDFKY2x1YUlxVTM2dzdZSmhLb0tyQlRmMlUrbFU1SHNLMzZ1NUZq?=
 =?utf-8?B?Yzc4UTlYQlFxYlc4NVJkeFlsMzR2bmc2TlBaVnVPdDg5ek1XZkovV0RrL1pR?=
 =?utf-8?B?MitYeFArNkI1K1NINnNzbmdqSFV1R0NkaS82MUFqZ3ZwZkxiem93ZU8wQjFr?=
 =?utf-8?B?ZlFhdjI2ZVVlTy96TXBxWHU3c2l6STMxQjV5RzZ2eE1RekNlVUZWNmY4WHZq?=
 =?utf-8?B?dVl0byt1SUNNRDlmVWViTDJSMURVbWx5aW1DQnkzYXJaRmQ2Rk1SelpKSDlN?=
 =?utf-8?B?RmZqeVk3VURZYVVLQk5uQ2RPYlVVdU1hNEZLeXFlMmtMZ0tJTXZsdFdqYnpM?=
 =?utf-8?B?TmlITlB6bnZrZ2VScU1LaERkQXhlNnIwcnYvb0pWWmowTjdYYkpXTUZEblI5?=
 =?utf-8?B?NE1pRmszSm9Gd25HbnRDRHppRTN4eWRqUjFFa1EwaVdxWi9SZFV1SnFiV0lT?=
 =?utf-8?B?ZjU5aldPSVhERHBOT21NVnlLVGtaczJOR0dBUzBMZ2MxQWRTZFBibHE1dVp0?=
 =?utf-8?Q?6BULVkijkfw82ZqGorTlSzTTI?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ArXrmU3Oiakn8/TYJTJ9X13ngDes/9gjxRwuNuKLeeCSMcOGD5xVXA8rvOkxypjaNvhf4khRBKgzE/FHPbnxf1Sb0hZft3OU9ZgOwG+KB1BHdntjde9zw7EohkS7ZdidClsxk9crWTduiW5klPfRlsaRaGYuYHlbG3UstGeTgH9aSm3mD5miX8uYq+aZPCHzBpNJlTfi0QC3scYB8q9bv0+BiEQSmJOf7Muf+DCnga4Tv8XfoZzPf+fQt9ioJa1wTnKg5N02F00mWfQ7C7LmA7Nb7pxDjqyaf9sttysfpgVR6aA1OUrzLNFPkWvmRszAuKHHPxdALpB+TkgyfMLNynYbM5yXZAE5INUl/eMhsPeVOdE1eXdpHSeQaz3TcIhMI4+QCwQpgMwHyezRuhIHPLjJkqJgdDyJVHnYaygkYx0l++vK/H60UoEIg5EFMv2A+FadT0OM5eokqEHsD8MHAfo+fuYYxPWjihWLR1b0U9wA/IzvfSBPLx2tKFAPT7ARStaJXqusIezcbp6H5wCmjooLHuqUxOjaKncznxnR6excGC9CeN9R7U9SNEA/30AObP+DvEcIGlOvJgqYcRzemd7KJXomP55T6DGIhjMhfAM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c708a9-7938-49ae-aff3-08dd4236052c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 20:29:54.1315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QonEXgg5NfbBXDpa5ZTUAqSYn7G47CdrVIzts8am0EtkISw3acvwHv9f0/6lqvSsQ0P251jLawf+ecUeBi9GhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4458
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_07,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2501310155
X-Proofpoint-GUID: ASOjOEXrQScwxHZP3yEl1sw898BZ957O
X-Proofpoint-ORIG-GUID: ASOjOEXrQScwxHZP3yEl1sw898BZ957O

On 1/31/25 11:37, Kris Van Hees wrote:

> On Thu, Jan 30, 2025 at 02:22:44PM -0500, Eugene Loh wrote:
>> For
>> test/unittest/funcs/d_execargs/tst.d_execargs.d
>> test/unittest/proc/tst.pr_psargs.d
>> how about a few more arguments?  E.g.,
>> system("/bin/echo TEST abcde fghijkl");
>> (I don't have anything particular in mind that this might catch. Just trying
>> to poke a little harder.)
> Sure, although it does not really improve the testing because we are looping
> over all characters, changing '\0' into ' ', except for the last one.  If it
> works for one it works for all, but I also do not mind adding a few extra
> arguments.

Cool.  Again, I have nothing particular in mind that this would stress 
-- if it catches something, it would be something unforeseen.

Incidentally, I hadn't run proc/tst.pr_args.d.  I just tried:

*)  On ARM UEK6 (OL7 and OL8), I got
dtrace: error in dt_clause_1 for probe ID 98979 
(proc:vmlinux::exec-success): invalid address (0xfffff895fa9f) at BPF pc 934
dtrace: error in dt_clause_1 for probe ID 98979 
(proc:vmlinux::exec-success): invalid address (0xffffcb24faa0) at BPF pc 934
Maybe UEK6 is not of interest, but there you have it.  Some copyin 
thing?  I don't know.

*)  On most platforms, I got
              0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f 
0123456789abcdef
          0: 2f 62 69 6e 2f 65 63 68 6f 20 54 45 53 54 00 20 /bin/echo TEST.
         10: 54 45 53 54 00 00 00 00 00 00 00 00 00 00 00 00 
TEST............
         20: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
................
         30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
................
         40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
................
I do not know where those extra chars are coming from, but the test is 
exposing itself to printing out garbage in any case.  Maybe use printf() 
instead of trace so that we do not print out the buffer past the NUL 
char (and get more compact and readable output to boot)?
