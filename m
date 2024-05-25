Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A39A936
	for <dtrace@lists.linux.dev>; Sat, 25 May 2024 00:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716597863; cv=fail; b=ATZeQBmXIInuu0VpB03h3Ag/LVxZTDJRGJvXt3ij87E7HnmQzZXTLsfJoRsVwIb9Sh/Ut58OWYYDSGvDu7QijeqLIYyNu1zt3oaO5TxYC9kKhhhf+ossL22XPxNl7SfWLAYd/xso2MQZiw4D3/ivQatWC2cbTpZjjKYCfAIY/nY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716597863; c=relaxed/simple;
	bh=e8suy6cS1auS0y8KYMHuENAi90noLDF33nESvsq/d98=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=loxjIJe/Ol8KyNW9wbhPCNs+DvXvtblLvHGdzyD8Ye7/nTpNdXPgruQYZoXyyKZIgRQuhVPGY05bR0UsnBVxI+lNiAn/djBgX+qjtppHtp5P50tu0TJ2iVFi4RrVvnU122aoQyqo3xEY5OpI3Xxf4g09Oai4QsJjKOTeQ3CH1XQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IPcekbmT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=0Qh7mN0o; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IPcekbmT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="0Qh7mN0o"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44OFvhMl000312
	for <dtrace@lists.linux.dev>; Sat, 25 May 2024 00:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=Rzqr9i6OXcLxoLrqr/8Eya1KsZjWPiUaarL7UOvwZ/A=;
 b=IPcekbmTyO7LtW+Tv4S4pJ0RXl+Ga1ACTp47SdImsDfLstro0oeNIdx/FLTxAQOvOA4l
 zZ5rL9EzAnC1xhYvWwVl5/DyC9XuAJfITTsC12U9M5wjMRl83bVgDnxQ5IjGxXwJS6+j
 VQilHbp+Qzjd9g/qhbWNjNyXlFizhDbtjHgzvHErCKl3xhUePpKjuRQofLbJ6Te1mPdn
 +vNlHEI3k3WH9g4Xsb6h+Nf7EfqVQQTMQmA4gHisbUU4W3VR6rP/tAJQYErw6pDVVwE/
 85UFD/wEm12FZMjXOMmqdy6Ex2uwlJWeGINysrKV5VDvdj+6eMaCRV9fIS/qO2gG5TAJ NQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y6mvvdfxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 25 May 2024 00:44:19 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44OLQf3Y013935
	for <dtrace@lists.linux.dev>; Sat, 25 May 2024 00:44:19 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3y6jsbwvbt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 25 May 2024 00:44:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VxMt/wy6ZC+U6PzjHt6oUzl0cJMvjOIAgR+5VwC352da6mVk8iHMbXtH7XF3vl+ldwZg/3ptdycDRcajfAxThTO1O15K3Q+4H9iITw3o3gNZVMrZyvaU599ys9vXfRi2AzRd+2eAPtiH1Pkg5fb30tTnugm0gAk9hCblBamOE1mypYyJpbC3fHrGQhZfCAt6f9N3eOPHSeY3uJOvNMfD7Mw+PvM92/wefS1OKjatyKjC9b5MLCegPF6T8C8HR2WaJF4vcxxVNn/wpnQHZgF4bYUfrnni5h1a7tgufGN3uNVb6FRPSEsb5qaa/9Is2+mbXWP1zgiaMiuoeMhgpbyr0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rzqr9i6OXcLxoLrqr/8Eya1KsZjWPiUaarL7UOvwZ/A=;
 b=P8Z6j0CDZM2jPyihPc6Uk2tRSrawyM6B9OlQfYUmX7K13ozt326Fg/HpB9ws5JwPyCACHmhu3po7xF08Tkf0xnnQZj5TaVNo3U1qAkKVAd+lNTRo3E2ERdiPzkPenaO92/aUqqAHg4y4rNGtJiCnDR95hFJNZ3aS3AiCd11jGpf65ugwmcHJsr/6kbpGRcph62K7STAoPdHPRhQF/bctZl9x6we7tbHd0APtGkFTCP50RoTLqvvghSKbVxpcfWFNyTj44+d8VO6pdh72XI0Xj3WL4y+1GSHUIc5HSWx2sEsURUeEZyFJ+Qr1fn/ZbHV6q7hWhx/Nw1F/VSjwAxu8XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rzqr9i6OXcLxoLrqr/8Eya1KsZjWPiUaarL7UOvwZ/A=;
 b=0Qh7mN0oeWI9wuSrQNo93OE37ToD8+v7nV9vzz4d9OlSdHSjn6DVw9PgV42wVsbi93N69x+Nqq9z/HD6apAMQfrK3OASf4IMh/fPo+LUUPLhXxK9q2lOPUfKvKBqYu0s1Yhz4SuIo7R73ynN92YZdPWhiZAzS2XLqHjG9g/i5mc=
Received: from PH0PR10MB7028.namprd10.prod.outlook.com (2603:10b6:510:281::9)
 by PH7PR10MB6506.namprd10.prod.outlook.com (2603:10b6:510:201::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Sat, 25 May
 2024 00:44:16 +0000
Received: from PH0PR10MB7028.namprd10.prod.outlook.com
 ([fe80::657:da26:8778:ad24]) by PH0PR10MB7028.namprd10.prod.outlook.com
 ([fe80::657:da26:8778:ad24%4]) with mapi id 15.20.7611.016; Sat, 25 May 2024
 00:44:16 +0000
Message-ID: <54924ea4-c3d3-4b18-a029-9e2a5d7c272a@oracle.com>
Date: Fri, 24 May 2024 18:44:13 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] build: install sdt*.h in
 /usr/lib64/dtrace/include/sys
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SN7PR10MB6287D6325F0542771FD99313C2F52@SN7PR10MB6287.namprd10.prod.outlook.com>
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <SN7PR10MB6287D6325F0542771FD99313C2F52@SN7PR10MB6287.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY8PR02CA0009.namprd02.prod.outlook.com
 (2603:10b6:930:4d::29) To PH0PR10MB7028.namprd10.prod.outlook.com
 (2603:10b6:510:281::9)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB7028:EE_|PH7PR10MB6506:EE_
X-MS-Office365-Filtering-Correlation-Id: 80009703-6daa-4689-2341-08dc7c53cdf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S3JWdGdHMC9scENscVlXVWJ0enhadjg0MFMzU1d5ZmdwYnRmdzhrZldwTzgx?=
 =?utf-8?B?ckNsV3JHTWN3OVRlTGlRV2FGWEdKTzcvdDlNVG9jQkNtKzhKbXNMRjdyNE5Y?=
 =?utf-8?B?Z3ZxNkRWSGpyWVlibG42L0N1SkVRVzlXd0FaVDQrNHQ3LzBiYjM3NGw4LzdL?=
 =?utf-8?B?a3hoWVpieWs2RHcvZDYvRy8yRVJlc1NNdzl3bmFlY3NiV1RzUEk3K2IrNnd1?=
 =?utf-8?B?RDJodTEwWDFWSjVaejJZRUs5K0hKTTgva0RhMGJ6VDZlZmxDcVpmM1pRV2RV?=
 =?utf-8?B?ZEdhdU5kWi9Td25FemFna2JwWVcyR2hGRERXcldUR2dvcUpLTGtIYnk2TUIy?=
 =?utf-8?B?Ni9xNFJwV2lBTDlEc09QdjRIVU11TUJuc1pwZUh2S3ZPZkI5STNXc0kweEZo?=
 =?utf-8?B?dmFRVTVkTVZ5b0RJSjEya2RMc0NxSk1HL0tub2JmUzJuaHVMQTgvanJ5VjVm?=
 =?utf-8?B?dndqWm1lTktCcEx4Q2paOEJ6cCtnRy9VSFZlczBISDFRNU9JNURTVHMzcnVP?=
 =?utf-8?B?TmdKN25BVGNaMHpiZlRCa1VCazlqWWo4OVQ1Yk9WSEhiTHBSTXcrbEJtSk0r?=
 =?utf-8?B?bEhSQ0FQdUg2UmxsNUpGdFpxeFlhc3lkTEQ2TVhvWmw1VDY1M0ViRlFrbE5Z?=
 =?utf-8?B?c3psVEttRlZQQ1RBVkNZd1VxK3orb2ZHMHFreVk3dUVCUkR1RGY3WkNrb3NV?=
 =?utf-8?B?OS9YcVd5Q3FwNEoxNlVUemNZZ0NPbW9ORzg0QXVtNll5enpEQTRKcDBBc0hS?=
 =?utf-8?B?S0hhL3hFQVI1YjU1VWttdlFMZEJWMmJLOTJZZzdHNDhqZHFvcnhOWmRlY0Rz?=
 =?utf-8?B?TXdmak0wYmdKT1ovY3VHbk9IWDlXbldQTkR1eHBvLzFuYWxDZzdRMGpiWksy?=
 =?utf-8?B?NWQ2RTJKK056VkM0bGNDeFRBUUZEQWlDbkMrS1ZZQXZKNnJqT3BMNldHVCtC?=
 =?utf-8?B?UmNHaEtJSm1idkZUQk1CWE4yWEdjUjRMOWNOalpXcXVsY0VqTms5M05ST0Mw?=
 =?utf-8?B?cFVUMTI1bmNWbVpFNFZ1QkRPdFFxQzBNV1htem1CSnJzTlMzWjRldHhyVnIx?=
 =?utf-8?B?eHlFa0RNSzZCbThnRW9HSVI5cW50Q2NxQzdNOGFYMWRSNDR4TUVTcG1aQ1pz?=
 =?utf-8?B?cUlOM0xYSFBJRi9DN2xsb1NMRlMwL2w2YUF4bFZ4eEpWNmZOUXc1RmdWQ1M3?=
 =?utf-8?B?WGZla2FIaDdCM3ZsMUYvMHpyRmkzMFk4a0o2cmNjOW1iaEU2d0lMMHR1b3N0?=
 =?utf-8?B?a3JpVEpWaFVwWE8yYlRoSW1VN2NYN202YTdodmY3SzV5MkhPZko0Z3Z5MlJZ?=
 =?utf-8?B?TEhCSnIyK2p4MDFkK3V2Y1d3a3JEQ1hZSHhqQWlrNyt0ZFVhMnV0dTc3eEw3?=
 =?utf-8?B?WjU0cHVuam9IWFVrQ1gwZm5zbjdGcThDNzBnVW1XZ2hOcTJMWCsvMm93QitT?=
 =?utf-8?B?T1ZXMzF0UFVrWXZGaUhGUlZzdGFXMDVvL3FNNy9vTnpWWEM4Sk9sVFg2bjY5?=
 =?utf-8?B?ZWJUak5tcjVwSjF4alZCYXNYSFVhRU4rclpDbkNPcTdIM2dWUE1ibGQ4VGVm?=
 =?utf-8?B?NzlRbnV3d3hKZ2RXTmNtMWpseE1USTg5ZlRWcURseDkydUF5R0g2Unl6SHU1?=
 =?utf-8?Q?sQF2lsNXd6BcHHZSrjEnx87w03Mcfor59xHLy215GNzI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB7028.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WXZGVk9aR3U4eHFac0pDMHdTcUtpWURveS9ra2NidkZJeFc5Z0t6M2o4RFJQ?=
 =?utf-8?B?aVoybzB6QmFlaW1OUWhCRVJheFJGdzFjajdKTGMvblRlWm1sWjNlNlFGS2E3?=
 =?utf-8?B?VG94akdTUXlwRU42WFVicGpyQjVXbkEyczBvWGErN1djcGNXRXd3OEdFSDBq?=
 =?utf-8?B?b2t1NVJZN3p6MVc4TkJjSVhzcU9yNHhoQ2k2VFVLdW9VVUsrYnozVnVJSEt5?=
 =?utf-8?B?a3I4ejVZY3RUME5BVXZKRVArTVFuc0U5aklsL05jSEhzU1JIM1VmWGNDdUxh?=
 =?utf-8?B?b3BVV0liZGFRd0RTUGhxN2h2M2s2cm5mYStGY2JUdE5MS3pTUklWeitwem1W?=
 =?utf-8?B?bCtkR1Zacm9QeUVWUXdESWhvcmNOLzJRU0FFUWdhMXdxZlkxQzhzUWdSUDNZ?=
 =?utf-8?B?ZCt3eGRNOGRodkRMQUg2d0JBR1Ntbncxekw1aXkxUjdneWZFZjZZdHdyakh3?=
 =?utf-8?B?SzNobyt5RkZ4ZTF4REloOEl1djdHVHBIZmVrSmQ0N2JONDBvUkZqb1dBcy9M?=
 =?utf-8?B?OHVLZWhXMEdVYS81WmxEN3F2NjllRG9RRGdUVDFpSVBhWHVEN0wzU1BNSmhK?=
 =?utf-8?B?WWdFUFZSdlI2VXd3eTZVbjIraEcvM2daai8vSGpzZlVyTU9vcTluVXB0eWpF?=
 =?utf-8?B?bmQyWE1kaDh5NGNnN3crcGdLRVo0NFpPR3MxcUFhOW1RY1VzbGRmQUpPK0ZX?=
 =?utf-8?B?YkY5c2tjWTlNbzQxYnFaalFBZSs4bytwYVdZSTZOOUp2ckdhZXFiTUVLckEw?=
 =?utf-8?B?MERuUHVuaU9JdHpDaElEL3FwYkRTMU9sdCtlL2FwVzdrYnNEdUVNcUIxdjk1?=
 =?utf-8?B?RUhMNWFRNnQ3Zk92RW1NeCtFWDE5a2FrUFBhckVzdHR1b0IzTUh0WGxQbnNy?=
 =?utf-8?B?UWxRenZwMWJhaCtTblJYSXVnSHNZdDIxK3dtem9uY28ydE42NHJaZXBoUTVr?=
 =?utf-8?B?REtpZWt3VkxVSnA4ZnBlZVluNE1vaWJZQWtzVU0wcVhKY09qMWZqUGlEaE5S?=
 =?utf-8?B?RUladGo5TFRoVXR3TkU4bTl0S1ZzUnNuMm9UTVFqZkZQemlBamtHaHlsTjBa?=
 =?utf-8?B?aUVyQ0p4MHhFeTJ3REpWOG05dWpSNFVpRmo5L29ub1RDVFpUMVNkVFhEQnhU?=
 =?utf-8?B?eFR5Z1BuWEdDU09lU3QxT3dRbmlHUFpNQmYwWEttYUtqM2RtS0RYTlozZzNh?=
 =?utf-8?B?S1FyMkg4NlF5Q2U2QXVhZ3RPOUhnRm43UWFLSEFVa0ZRYWlGT253K040NTVH?=
 =?utf-8?B?NW9KQmd5Mk1kVWdnVjB0SlpPSGtCRGpnWUpBZ09JeTY3QlVjOG82aDhSK3Fw?=
 =?utf-8?B?WW9tRmhXbEx5S2U1bEJDYUQ3LyttOVU1R0pyR0M0ckhyeU5KS0V2MVFnZ2Jv?=
 =?utf-8?B?dVNVNkRSbjNEbHFxTEMrZFM4SHVYeTQ0UTl6TUlzNGlLWnBxMHk3Qitqb0o0?=
 =?utf-8?B?d0pFaGFEdDJMQmd4UUJvdVhKRmtxZm1NbkM4dXpuU0pGN29CU3pTck5CblFu?=
 =?utf-8?B?aThDc1M3V2dFeUY0YjhvcTk5MFdHZEhROE1NYlFaYVpmWnU0Ty9JUXQvUXVt?=
 =?utf-8?B?RzRnNWd5bGplS2xZMlVyWmNrR2dUeFo5U0s3dXBZUy85N1ZQUjJGSklKWDd3?=
 =?utf-8?B?MW9ia01nalFNZWIzUXpjMTNTT0FLUEpNclFMdUd5RGtacFhwUStka01qQTg3?=
 =?utf-8?B?WHVRWEc3bG1vK1psT2ltVTF2WGlBeWxFYzl4bEhXUjlwbTE4YkltYjU3R0NN?=
 =?utf-8?B?aFNFSnd2djQ0QzRnUnN4SlBTTEgyTGpTbXJtQnkrU09sUXhUblFMcHR3czN4?=
 =?utf-8?B?TVhSWmxwVWM5QlZtMUhnSFlVejNqTnY0eEFEWkFVeGljRE05MWdTdVo2Um5x?=
 =?utf-8?B?Z2V5dTZmQitBRmVkaVJUc0tISmx6WnRkbUk0b3FqdzBwUWZiRWRkcEVneU5Y?=
 =?utf-8?B?K3ErMzZPWi9PRHc3ZE1nTUgxVXU1bkxFS2x1YVVRNjJObXVvN2hyTTBtdnBU?=
 =?utf-8?B?R2Vuc2tMM2xQUExaKzRhSVE3bDdvYzYyMnR6UHFTQ3EwcW9rWU1aMXhpUFF6?=
 =?utf-8?B?aWVNdUhQZGI1Mm9MUDVROVU3VHBWTXFaMllieEZRNzBpU0x1SDdoakJPY0pj?=
 =?utf-8?B?cTZ0ZFlNZVk2WTZQTmVSbWdENU00Vmw5eGVJOUN3aXlXTXlHUTFWOFpGZW5B?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	T7AAFP9qOIphGsLuLoOL3YlUQMvkJm7C33EgM5iWl1iRgdnL3m9dTsnVnq3xMSV9Bla59uYDecYiUJiVxLGgLoYKMVLn7ornL7s6UPDllZWxHiqg9ueDRi62Ls6hoeDKIOSHyrFxURtvgry8jtA2+udvHAC4MZS9rD/Rh9IyfOseyhR/UtM9PYfyn7GwDUr7+HE1HQk0kPq6gaB7qWrTQYQRO9AuphMI0KTnT7unDiXUQIthmxF0zV3YxyEluJKfzM1dEpDKybrDEOe3EDmYYXe9kb65aVe/41UgPD007ChzIgf+othDxTXHbnt/xGDyIsLnfEMjJC7nyy341zfN1Z99I/W+CMBo4nNHWlJGHLT4ONPp/krfPZENJy5CbsHcecXaAHEFCyg/PSbnd70UHWcrdAyNIFb/emvjnZvxZUR5FPdaZAz/mXQF3bqxUiszqv+iNnWacRxhjXPuF/3TF6SvclCoPJR66zW2xoFWI3/hM43ECZjZ3//rRC5zyS+w0iO7E+Bu0/eMvRWlLD2q0BBttERBMhVy5L2o3JPyTJdKUCS+yVub/qBEYTFJ5mkj6Ygc0vmnfuqzqLExRPfAY1BlVgmUA7ZaVBrsnOWDjFw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80009703-6daa-4689-2341-08dc7c53cdf7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB7028.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2024 00:44:16.0543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2b9/CGAXzPBShxhBOQTkHOgor7d4j8oKLJLaHEdIKIE4OSHwtYb9SW/qL2oT0DKQjXwesxrdzaHOs+7mITuZHKF7VgGHmsELutlxeaJNq5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6506
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_08,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405250004
X-Proofpoint-ORIG-GUID: KwSuokNbkvHZCAXi2d2OOHlg07QSUrKl
X-Proofpoint-GUID: KwSuokNbkvHZCAXi2d2OOHlg07QSUrKl

Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


On 5/24/24 17:58, Kris Van Hees wrote:
> Author: Nick Alcock <nick.alcock@oracle.com>
> 
> With this change, we no longer confict with any systemtap packages!
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  GNUmakefile                           |  2 ++
>  runtest.sh                            | 10 +++++-----
>  test/unittest/pid/tst.provregex3.sh   |  6 +++---
>  test/unittest/pid/tst.provregex4.sh   | 10 +++++-----
>  test/unittest/usdt/tst.allargs.sh     |  4 ++--
>  test/unittest/usdt/tst.entryreturn.sh |  4 ++--
>  test/unittest/usdt/tst.linkpriv.sh    |  4 ++--
>  test/unittest/usdt/tst.linkunpriv.sh  |  4 ++--
>  test/unittest/usdt/tst.manyprobes.sh  |  4 ++--
>  test/unittest/usdt/tst.reeval.sh      |  4 ++--
>  test/unittest/usdt/tst.static.sh      |  4 ++--
>  test/unittest/usdt/tst.static2.sh     |  4 ++--
>  uts/Build                             | 16 ++++++++++++----
>  13 files changed, 43 insertions(+), 33 deletions(-)
> 
> diff --git a/GNUmakefile b/GNUmakefile
> index 360058c6..b1109727 100644
> --- a/GNUmakefile
> +++ b/GNUmakefile
> @@ -86,6 +86,8 @@ BINDIR = $(prefix)/bin
>  INSTBINDIR = $(DESTDIR)$(BINDIR)
>  INCLUDEDIR = $(prefix)/include
>  INSTINCLUDEDIR = $(DESTDIR)$(INCLUDEDIR)
> +SDTINCLUDEDIR = $(LIBDIR)/dtrace/include
> +INSTSDTINCLUDEDIR = $(DESTDIR)$(SDTINCLUDEDIR)
>  SBINDIR = $(prefix)/sbin
>  INSTSBINDIR = $(DESTDIR)$(SBINDIR)
>  UDEVDIR = $(prefix)/lib/udev/rules.d
> diff --git a/runtest.sh b/runtest.sh
> index 35d50069..3bcd676e 100755
> --- a/runtest.sh
> +++ b/runtest.sh
> @@ -559,7 +559,7 @@ if [[ -z $USE_INSTALLED ]]; then
>      dtrace="$(pwd)/build*/dtrace"
>      test_libdir="$(pwd)/build/dlibs"
>      test_ldflags="-L$(pwd)/build"
> -    test_incflags="-Iinclude -Iuts/common -Ibuild -Ilibdtrace -DARCH_$arch"
> +    test_cppflags="-Iinclude -Iuts/common -Ibuild -Ilibdtrace -DARCH_$arch"
>      helper_device="dtrace/test-$$"
>      # Pre-existing directories from earlier tests are just fine!
>      # dtprobed will clean things up.
> @@ -579,7 +579,7 @@ else
>      dtrace="/usr/sbin/dtrace"
>      test_libdir="installed"
>      test_ldflags=""
> -    test_incflags="-DARCH_$arch"
> +    test_cppflags="-DARCH_$arch -I/usr/lib64/dtrace/include"
>  
>      if [[ ! -x $dtrace ]]; then
>          echo "$dtrace not available." >&2
> @@ -587,6 +587,7 @@ else
>      fi
>  fi
>  export dtrace
> +export test_cppflags
>  
>  # Figure out if the preprocessor supports -fno-diagnostics-show-option: if it
>  # does, add a bunch of options designed to make GCC output look like it used
> @@ -594,7 +595,6 @@ export dtrace
>  # Regardless, turn off display of column numbers, if possible: they vary
>  # between GCC releases.
>  
> -test_cppflags=
>  if ! /usr/bin/cpp -x c -fno-diagnostics-show-caret - /dev/null < /dev/null 2>&1 | \
>  	grep -q 'unrecognized command line option'; then
>      export DTRACE_OPT_CPPARGS="-fno-diagnostics-show-caret -fdiagnostics-color=never -fno-diagnostics-show-option -fno-show-column"
> @@ -1129,7 +1129,7 @@ for dt in $dtrace; do
>          # Default and substitute in flags.  The raw_dt_flags apply even to a
>          # sh invocation.
>  
> -        raw_dt_flags="$test_incflags"
> +        raw_dt_flags="$test_cppflags"
>  
>          expected_tag=
>          if [[ $testonly =~ ^err\.D_ ]]; then
> @@ -1204,7 +1204,7 @@ for dt in $dtrace; do
>  
>              CC="${CC:-gcc}"
>              CCline="$CC -std=gnu99 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64"
> -            CCline="$CCline $test_incflags $CFLAGS $test_ldflags $LDFLAGS"
> +            CCline="$CCline $test_cppflags $CFLAGS $test_ldflags $LDFLAGS"
>              CCline="$CCline -o $tmpdir/$(basename $base) $_test $link"
>              log "Compiling $CCline\n"
>              if ! $CCline >/dev/null 2>$tmpdir/cc.err; then
> diff --git a/test/unittest/pid/tst.provregex3.sh b/test/unittest/pid/tst.provregex3.sh
> index 6e1afd3e..7ebfb28e 100755
> --- a/test/unittest/pid/tst.provregex3.sh
> +++ b/test/unittest/pid/tst.provregex3.sh
> @@ -1,7 +1,7 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2008, 2023, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2008, 2024, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> @@ -23,10 +23,10 @@ cat > $DIR/Makefile <<EOF
>  all: main
>  
>  main: main.o prov.o
> -	cc -o main main.o prov.o
> +	cc $test_cppflags -o main main.o prov.o
>  
>  main.o: main.c prov.h
> -	cc -c main.c
> +	cc $test_cppflags -c main.c
>  
>  prov.h: prov.d
>  	$dtrace -h -s prov.d
> diff --git a/test/unittest/pid/tst.provregex4.sh b/test/unittest/pid/tst.provregex4.sh
> index a9ff3238..e4248e15 100755
> --- a/test/unittest/pid/tst.provregex4.sh
> +++ b/test/unittest/pid/tst.provregex4.sh
> @@ -1,7 +1,7 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2008, 2020, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2008, 2024, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> @@ -25,10 +25,10 @@ cat > $DIR/Makefile <<EOF
>  all: main altlib.so
>  
>  main: main.o provmain.o
> -	cc -o main main.o provmain.o -ldl
> +	cc $test_cppflags -o main main.o provmain.o -ldl
>  
>  main.o: main.c prov.h
> -	cc -c main.c
> +	cc $test_cppflags -c main.c
>  
>  prov.h: prov.d
>  	$dtrace -h -s prov.d
> @@ -37,10 +37,10 @@ provmain.o: prov.d main.o
>  	$dtrace -G -o provmain.o -s prov.d main.o
>  
>  altlib.so: altlib.o provalt.o
> -	cc -z defs --shared -o altlib.so altlib.o provalt.o
> +	cc $test_cppflags -z defs --shared -o altlib.so altlib.o provalt.o
>  
>  altlib.o: altlib.c prov.h
> -	cc -c altlib.c
> +	cc $test_cppflags -c altlib.c
>  
>  provalt.o: prov.d altlib.o
>  	$dtrace -G -o provalt.o -s prov.d altlib.o
> diff --git a/test/unittest/usdt/tst.allargs.sh b/test/unittest/usdt/tst.allargs.sh
> index 20f9de90..d233615f 100755
> --- a/test/unittest/usdt/tst.allargs.sh
> +++ b/test/unittest/usdt/tst.allargs.sh
> @@ -1,7 +1,7 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2018, 2020, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2018, 2024, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  
> @@ -16,7 +16,7 @@ fi
>  
>  dtrace=$1
>  CC=/usr/bin/gcc
> -CFLAGS="-std=gnu89 -I${PWD}/uts/common"
> +CFLAGS="-std=gnu89 $test_cppflags"
>  
>  DIRNAME="$tmpdir/usdt-allargs.$$.$RANDOM"
>  mkdir -p $DIRNAME
> diff --git a/test/unittest/usdt/tst.entryreturn.sh b/test/unittest/usdt/tst.entryreturn.sh
> index 6c14ece2..d777c1ac 100755
> --- a/test/unittest/usdt/tst.entryreturn.sh
> +++ b/test/unittest/usdt/tst.entryreturn.sh
> @@ -1,7 +1,7 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2007, 2022, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> @@ -14,7 +14,7 @@ fi
>  
>  dtrace=$1
>  CC=/usr/bin/gcc
> -CFLAGS="-I${PWD}/uts/common"
> +CFLAGS="$test_cppflags"
>  
>  DIRNAME="$tmpdir/usdt-entryreturn.$$.$RANDOM"
>  mkdir -p $DIRNAME
> diff --git a/test/unittest/usdt/tst.linkpriv.sh b/test/unittest/usdt/tst.linkpriv.sh
> index 1a088f82..c008e66d 100755
> --- a/test/unittest/usdt/tst.linkpriv.sh
> +++ b/test/unittest/usdt/tst.linkpriv.sh
> @@ -1,7 +1,7 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2006, 2016, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> @@ -12,7 +12,7 @@ fi
>  
>  dtrace=$1
>  CC=/usr/bin/gcc
> -CFLAGS="-std=gnu99 -I${PWD}/uts/common"
> +CFLAGS="-std=gnu99 $test_cppflags"
>  
>  DIRNAME="$tmpdir/usdt-linkpriv.$$.$RANDOM"
>  mkdir -p $DIRNAME
> diff --git a/test/unittest/usdt/tst.linkunpriv.sh b/test/unittest/usdt/tst.linkunpriv.sh
> index 71d42ae4..bf52bc6a 100755
> --- a/test/unittest/usdt/tst.linkunpriv.sh
> +++ b/test/unittest/usdt/tst.linkunpriv.sh
> @@ -1,7 +1,7 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> @@ -14,7 +14,7 @@ fi
>  
>  dtrace=$1
>  CC=/usr/bin/gcc
> -CFLAGS="-I${PWD}/uts/common"
> +CFLAGS="$test_cppflags"
>  
>  DIRNAME="$tmpdir/usdt-linkunpriv.$$.$RANDOM"
>  mkdir -p $DIRNAME
> diff --git a/test/unittest/usdt/tst.manyprobes.sh b/test/unittest/usdt/tst.manyprobes.sh
> index dd97250e..a3b23874 100755
> --- a/test/unittest/usdt/tst.manyprobes.sh
> +++ b/test/unittest/usdt/tst.manyprobes.sh
> @@ -1,7 +1,7 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2023, 2024, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> @@ -12,7 +12,7 @@ fi
>  
>  dtrace=$1
>  CC=/usr/bin/gcc
> -CFLAGS="-I${PWD}/uts/common"
> +CFLAGS="$test_cppflags"
>  DIRNAME="$tmpdir/usdt-manyprobes.$$.$RANDOM"
>  mkdir -p $DIRNAME
>  cd $DIRNAME
> diff --git a/test/unittest/usdt/tst.reeval.sh b/test/unittest/usdt/tst.reeval.sh
> index 3b32a280..56011a4f 100755
> --- a/test/unittest/usdt/tst.reeval.sh
> +++ b/test/unittest/usdt/tst.reeval.sh
> @@ -1,7 +1,7 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2007, 2022, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> @@ -13,7 +13,7 @@ fi
>  
>  dtrace=$1
>  CC=/usr/bin/gcc
> -CFLAGS="-I${PWD}/uts/common"
> +CFLAGS="$test_cppflags"
>  
>  DIRNAME="$tmpdir/usdt-reeval.$$.$RANDOM"
>  mkdir -p $DIRNAME
> diff --git a/test/unittest/usdt/tst.static.sh b/test/unittest/usdt/tst.static.sh
> index a016f1c6..bd71c2e4 100755
> --- a/test/unittest/usdt/tst.static.sh
> +++ b/test/unittest/usdt/tst.static.sh
> @@ -1,7 +1,7 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2006, 2022, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> @@ -12,7 +12,7 @@ fi
>  
>  dtrace=$1
>  CC=/usr/bin/gcc
> -CFLAGS="-I${PWD}/uts/common"
> +CFLAGS="$test_cppflags"
>  
>  DIRNAME="$tmpdir/usdt-static.$$.$RANDOM"
>  mkdir -p $DIRNAME
> diff --git a/test/unittest/usdt/tst.static2.sh b/test/unittest/usdt/tst.static2.sh
> index ec611873..29fd3597 100755
> --- a/test/unittest/usdt/tst.static2.sh
> +++ b/test/unittest/usdt/tst.static2.sh
> @@ -1,7 +1,7 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2006, 2022, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> @@ -16,7 +16,7 @@ fi
>  
>  dtrace=$1
>  CC=/usr/bin/gcc
> -CFLAGS="-I${PWD}/uts/common"
> +CFLAGS="$test_cppflags"
>  
>  DIRNAME="$tmpdir/usdt-static2.$$.$RANDOM"
>  mkdir -p $DIRNAME
> diff --git a/uts/Build b/uts/Build
> index f445115d..864b2dfd 100644
> --- a/uts/Build
> +++ b/uts/Build
> @@ -1,6 +1,6 @@
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2011, 2017, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2011, 2024, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  
> @@ -10,11 +10,19 @@ uts_DIR := $(current-dir)
>  # provide the userspace versions of types defined distincty by the kernel.
>  
>  SYS_HEADERS_INSTALL := common/sys/dtrace.h \
> -                       common/sys/dtrace_types.h \
> -                       common/sys/sdt.h \
> -                       common/sys/sdt_internal.h
> +                       common/sys/dtrace_types.h
> +
> +# sdt*.h are used by programs that contain USDT probes that want to define
> +# probes by hand rather than using dtrace -h.  SystemTap has another header
> +# with the same name, so we install these out of the way.
> +
> +PROBE_HEADERS_INSTALL := common/sys/sdt.h \
> +                         common/sys/sdt_internal.h
>  
>  install::
>  	mkdir -p $(INSTINCLUDEDIR)/sys
>  	$(call describe-install-target,$(INSTINCLUDEDIR)/sys,$(notdir $(SYS_HEADERS_INSTALL)))
>  	cd $(uts_DIR) && install -m 644 $(SYS_HEADERS_INSTALL) $(INSTINCLUDEDIR)/sys
> +	mkdir -p $(INSTSDTINCLUDEDIR)/sys
> +	$(call describe-install-target,$(INSTSDTINCLUDEDIR)/sys,$(notdir $(PROBE_HEADERS_INSTALL)))
> +	cd $(uts_DIR) && install -m 644 $(PROBE_HEADERS_INSTALL) $(INSTSDTINCLUDEDIR)/sys

