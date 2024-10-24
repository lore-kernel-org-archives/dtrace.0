Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4391B3930
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 21:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729806804; cv=fail; b=SbA/qM2AvB4+XhrW5ijjLga/AuteRfdqdJgUR4GwRfF9j/dyJN6LyQnQSvJGzHC7oRcySTx0XnHMkhgD4CxAn1Gti9gg1pRV6QrMeNnMInrkgtiA8cBvVU8TgKwq7XpjXOT4/YtL+Vu4WB0hhsWOn+vkL5bTX0l6di/9CKx7Qg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729806804; c=relaxed/simple;
	bh=qWitX4Z5o2E8WNKPiFqXlSgBXcJz2VJMHftbO9bO2t4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Lf1wHgNkeuLsMNzC67h8c1JDDWr4slf5g1FDqOmfvi47AEWQsLGj9N6xbp3JW5/Db72+3Swd/gL6Hd6w8RfB+g8WOFTLTs70b0URauzPGo3o08nSAdqx0DnEGYGMLEGlmWxQGna8oDZkE5WaaPXhzUCOezfHugJxGpkSURcc/hc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Zr6P/peG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ySv32LHZ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Zr6P/peG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ySv32LHZ"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OLMZAS018204
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 21:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=aQiQri0ZJuCLA8/lx8VlwNPeLdgYxQEBvcUUIjihVvE=; b=
	Zr6P/peG6oHtklF8Od0NWoR064Nbn9i6b5kELwy+MEhF89Jkp1Q007h+cQlhhlRQ
	yV2QczutpZXaYQeucTLG6V41ARa8DGvJJ0rycfH2ebNYTaGTt5+d5NDf8qBdWFl9
	zvWYY6dZnwBGMxT957NCZnz1lYmDs7V/DeudVbx6ZRn2EEw1+yXIR06iFDOM8Y1D
	ID6KfgYHUvxiHfMi/0jCwHvWmGa4PidhQmkw7drgoUtZ8AdsyzZqQ9w+UjZ88q4l
	u8sjGKnN1oN0nVFPV0JyB8+RSsmnTdaZK0k9vNsLVaNhpMuo6ShesyEF1wp6PHXM
	RQXLS9apweeUncFgoOnZrA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c5asksh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 21:53:21 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OKPLRc031028
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 21:53:20 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emh3jbvv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 21:53:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lkJg7vBtTdZHiN0Pl+QO8Yiq8fKxrYW5FLerSlyiZzVNwozU4HPYRu3l+AN/iwYuu+7FhfkJPfwAhC6WSyLegTlcv7JB7nywJlYPNTFBx0P6DmLDxQTmDnDQBiTb8gKJ4Q6kfKgVYAy8eQruDOe1Ac4clQ1v76MfH6YQwRkaKv5JdOKqA5FIhiAdfWINarVGsGH2Mk3E0WFvXsQ6375/48IBnoFeqtfRtjDvtEY0S2+zdlYzzwBfXlLQJ1zn6CtqHGEB2b+R6KAsWwj1mp690mRSYV7nlURp/G/gognmYXy827Vg7dyOMOJVy+gUzoe/RAnmrP4JYj4O0+DoqsMdhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQiQri0ZJuCLA8/lx8VlwNPeLdgYxQEBvcUUIjihVvE=;
 b=UHtXWzlQwWUveMvczO/ze3Ea6E4d5f5NkQOLsh81WOeDrqJuLruR8ftCTZBPbizAOcLBrxWjhh/OdDgPi+3VV4flYjrvxMJf/m7mHmkgHHVGv1KbRp2R4ZHPYDaxay6bk2jH6cLHQNaSv2zp3yOGxY86+hw25UGl3cj1jLeGVJdZFvAtg0EG7ZKMf6CKrdVHxE8+CYHBTbwL8EM6qlkP3hfiu/EvZmsiNgH7VQ3bX1r67j4HqpGVZgjibPn88UnEPLwZDyAF9FGkzpKlJ9UXFUmeL/A41nmJiMcLuwZGGkiqWKLbybyBAGcD8yO+FIbkiTXRQQMdfeAne8UTgDBA1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQiQri0ZJuCLA8/lx8VlwNPeLdgYxQEBvcUUIjihVvE=;
 b=ySv32LHZxQjJBxaCl4PbWUIuehqKmemW4w2yM0z89jZdShu0UD+k08Z/3quz/YpoOlLsbW615bQitdDW9UvWwugH/X0C3dBOSpuYyygj+ig3S2vReBZj9dfqW+yawSdtclK2Bqg8px0UnigCISQ/w/i87iFWFUmS7Lx63Ixnyzc=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6173.namprd10.prod.outlook.com (2603:10b6:8:c3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Thu, 24 Oct
 2024 21:53:18 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 21:53:17 +0000
Message-ID: <266559f8-2110-9721-8404-a349d38dedd1@oracle.com>
Date: Thu, 24 Oct 2024 17:53:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v2 15/19] Ignore clauses: some clauses are
 impossible regardless of uprp
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240924202554.7011-1-eugene.loh@oracle.com>
 <20240924202554.7011-7-eugene.loh@oracle.com> <Zxlcbjd4QSoU8H+T@oracle.com>
 <0ac389c5-769f-b86d-ae9f-c9102e774c2f@oracle.com>
 <Zxq4Pk7yKVnbWxpR@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Zxq4Pk7yKVnbWxpR@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR1501CA0030.namprd15.prod.outlook.com
 (2603:10b6:207:17::43) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6173:EE_
X-MS-Office365-Filtering-Correlation-Id: 8444be8d-4424-483f-6d04-08dcf47644b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHJBTjAyT2g5OXdKRnh4cnhTM0xMem9hTTVXcDF5eldrekFRL3ArNDVnYTg0?=
 =?utf-8?B?cmtMdFBtQkJLZGdJVlJjM0Ftekl6cDJFTElWVDRLcHNzMnVoQTlNUWNyNkp6?=
 =?utf-8?B?SFN3K0FxelR3K0JSOHF1ZnhkSitRNWQ2U2EzTHliOFgydCszalVSYjNaM2Qv?=
 =?utf-8?B?Q01CSkhDMXc4SnVoaGtQZUhFbVdFZi90bUNqZzNLSUoyWXhiVitjOHJHTENE?=
 =?utf-8?B?UGNSUEFib285cUN3TjhkTTdZalBFdEtuNHNuR1pRd0ZDSzN6U0l6RGFzbnls?=
 =?utf-8?B?clpwVVZldTk5YTkveHRDeW9zUDdMMFZPZHJkRVVkUHYxOTNML1VDTkZZMEEx?=
 =?utf-8?B?S2ptNU02VnBVbDVRb01pRXZUR0tNaHZpdjl5RW5mSVJ1MVJYZ3ZmNllCLzJW?=
 =?utf-8?B?alkvbEJrZngwT1BYN0NsbW1qdEFMWEtNRm5iU1hGUnlGOE1XVk1qbWs0REpH?=
 =?utf-8?B?U1FPQUt2Q3d0VXZLdFBmaEt3cE1KTnIwWElxYU84eG85SGNEbTFTdU5FUjJ4?=
 =?utf-8?B?Y1pqa3kxd3RsZGNBNXErbHdoYTJaa2VlUURMdzI2STQrM1A2NmJKbkNITkxH?=
 =?utf-8?B?OU9UUDYvVmVIRExFTjZISUdhb3NUZlp5N09kZ2J6bExQaUNxb2h1R3NramxJ?=
 =?utf-8?B?NDBZZmdZRUdqZHJVVDd5SGJCZ3Rqc09mam5JZEFpbWZFa0dGcTZ4YWVOYk1v?=
 =?utf-8?B?WXdGWkxxK2srL3FnK1NGRCtFZ0kwK3JvTHJ1TWpUZjJNNkxVbldwdkVTUkth?=
 =?utf-8?B?bnF0UW95Tzc2bTJNak0reUF6RnhKTlI3c2U5NWRxU0dtcEh1K2NXdG5ySXVC?=
 =?utf-8?B?M296aTJMK3BpSFJmUStHQzJzTU4wS0dmamVaMnkzUkQ1Qk1LT0RRU0tSMFhk?=
 =?utf-8?B?cm1aMFV1aG9QeTVKU2VHVEVFcXcyQU9sY0JTWnVhanZ2YzBCU0ZPUXlDbWp6?=
 =?utf-8?B?Q0lzcmJaOENUdXNRdXc0bDVjbDZONWE5dDEyRENGdWJxMGR2Y2lJaFZPTVRj?=
 =?utf-8?B?Y2dhZElnUytMclpyemNRT1pzcXhsNlBtak0yWWwwMUFZMFpvekVqT0hHYndy?=
 =?utf-8?B?Ukg3OFgwK0xGaHhVMlluYVd4S3d6ZjdzQkdSdmhLSjZhTWFad3hULzVwdDRm?=
 =?utf-8?B?Z05nWmI1RkxORkdOdkhaUnhkWElrTFNBZjg1Uy9VUkFWYXRpYk1oUXBRRTBt?=
 =?utf-8?B?QmVjMEV6cmZtakZkTmVwN0c2eGUwZWtvK2tGR1ZzOTY0MDZWUTFVZVlweEdI?=
 =?utf-8?B?S0VsbVFCYWc2Q2dWU3NzRDh4ZnE0OTg0TzNaUXh6cWFTTStObUk1SlJBa2Rm?=
 =?utf-8?B?c1BwMzhWU2pYMTRrQTNhZitDSFZPcUFEazVpU3BzQU9nWE1hWVFGUDNZZ0JT?=
 =?utf-8?B?em1ieGtPbkhnak44OUJJdE1TYm82U09JN2VydUgvYXVBNDJEY3pLNnF3ZlNl?=
 =?utf-8?B?STFEdkFJV0NnTTRRWHd5NTlscnIvRnNkYkwvUlkwQjRGT1ZYZjhJNldNaTJk?=
 =?utf-8?B?N3haVDZuekxKM0tuVmQwUmJsY201MWdYMmFwSkc0QUZPY3FZMUx4NzRBUEVy?=
 =?utf-8?B?dDBIUDNFcHZhMkRzVFpzajVxOW1NMUxuWUdJN1U2OEs1U3QvT3REUWwzR29w?=
 =?utf-8?B?VjBmcUt0ekhVdFROdVBZaU1DdWxOTWxWV1VSQTlGWnZZam9jeXVBbW9pRFEr?=
 =?utf-8?B?RnFOS2Z5amp5WXVhQWU0cVUwV21DSURpUGhZbFlOcHd1VkNPc3YyZUg1dTlP?=
 =?utf-8?Q?hYd/jaT8kXLO4ReXoU9YrhznyUKDwEGrwB2AdL1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGtiZm9MRHZQbnNCZnNQYS9qdW01alJSNzFZTGxCajBaMkx3RlpDYVBqcjh6?=
 =?utf-8?B?b3hEdWZzdlNLMytybk5HV2w2OS9ZV1JaVDdMOFN0T24ycURLNGFTQnlqOEk0?=
 =?utf-8?B?MXNEd0VTeDFPakxsa2FSNnZNZjR0UFNUbm9VM0NTOUk1dm85NWRybktyTGZK?=
 =?utf-8?B?SFgzd01Ga1IzWGdiSmMwQjQxcUJhNU1hUWdzSWZ6OVNRa1l1VUF3L1cvVEdB?=
 =?utf-8?B?RG11L0hwVUEzRmI0TEd2b1dFVG1CNGljb2V2eGs1NGhnbHNlVVNPQmZIRm10?=
 =?utf-8?B?akFXYjh3MmNCT0R6a3pDbUpEeDFCK2ZuQlN0Vm9CTmxIWDRKK24yN2szZUlL?=
 =?utf-8?B?YzcyTUI2bEZNWDFyVEJrbVJqZHorQ0FoQmVSNXhkR1FObWxQc01MYlVuY0xS?=
 =?utf-8?B?T2dZbklPVmM2Q2d2Vk1KSCtLRDczLy9mTmN5eE5PbWF3UllYalVjOGVuRFAw?=
 =?utf-8?B?YzdDOHBmMkRhc0phaUtndDQ1VUZuTzM3Ti9zS2wvcEtCVnVqeDl0ckZDWEVK?=
 =?utf-8?B?QUlZU1pNVi9LYy9NTHNMUXZ4ZmFHTXNTdXdZN1RsN25qLy9VQXlHZDZERm5m?=
 =?utf-8?B?R0ZZUXNncEhuNVMvSzllSFVabU10M2RzWDhMU1BTVTJMdHlwSWpDZUJVZzJ5?=
 =?utf-8?B?Q3ZONlFQZ1pKdjR1b0s2TTlVbC9lRktlVG85SmdXWHcxY0ZxdmxHUHlEWkV1?=
 =?utf-8?B?NEhpeGtqUEx5UnJyb0VLM0thRlNLTU92MjEwM0VuRXlTRnMyM3FvVXFxUmdV?=
 =?utf-8?B?MVJYM0tnYlBkN3ZGOGZPVzdvTjAvaTR3enR3Rzd2UnowWU5BOEoyYVJrV05F?=
 =?utf-8?B?bmJWT0g2OHEvK1h1c20vblpmdHdZaU03clBCcjdXUUhxRDFKVXQ4bGt3TG5Y?=
 =?utf-8?B?dDRpYU13TUcybmJFSHoyRkh3TzNqMUZHRjdTOTlSVkpMNHVYd3VaczNTTzI1?=
 =?utf-8?B?UDJGTU5TTUJtaWY4dXVNQWRCeGZveWkvMnhkN05BQVNRMDU3dDJVdTFyNUJw?=
 =?utf-8?B?d0xJYlQ0SWo1bUJ0WElxZGdBQlAvdFlZakFWYVVHS2FNOUxHVDhtaWR3RTd0?=
 =?utf-8?B?SXlnTDNzUVpxVityazJ0MHVlWlhHVkg3aG9hV1RtV2hLNjBab1VNWlBqa045?=
 =?utf-8?B?eVlkS1RHU1Z6TFE4M2lqUU93TW1BWjgrMitHNGMrOW9SRHdGRzUrZkF4eE9N?=
 =?utf-8?B?MnNCUnBNM2VWRDVEei9iNnBOVFVqaHA5OFBKZHQ0d1FySnBmMjdXVWtvWk1x?=
 =?utf-8?B?bXlkUDNTcU5wV2hTOXNSTDEzbVpWK1BxcUdlN3k2cndHN3g5RVBGQng2N3d5?=
 =?utf-8?B?dkdzL084Zk8rc0htM2tJQ1RHTGdPdjVPQzlFeDhKaTZiMmRwaE1PaHZOQVZL?=
 =?utf-8?B?NWNuRnJuUDRaMjRjVGloYkVoUFNFNWdoR2k5UVUrMlN1bXRsZWFQdE1TNTNV?=
 =?utf-8?B?bThaRWs2N3gvWVR3dFl5eHk5MDA3TFI4QUxTcjlTdlZPNDhpSFpIeWllTjJn?=
 =?utf-8?B?bGh6Zlg4b2YreHVxdWNDZTdER1Z5TFY1VTFvODRJSXlBRXJTbzdYVmkyZ2ow?=
 =?utf-8?B?SUtBVG1VQ1FDazJUSlp4VFRkNHBZWFJsUXJtRWhtYzVBSzB0aGZFczJaY3Jv?=
 =?utf-8?B?dDlmM3VhNmMxY2s0cW5pL3hJcmQyM05rM216SzNlQlhuZERMRFowc2VIS1Nw?=
 =?utf-8?B?SmdUSDFkaUJFeGhYZmNObVhXOXM1a29qOFZaRnVNZ2dNYnNQR1RuNE8yNVJ0?=
 =?utf-8?B?VERHWVduM2lVamNxYXFTWnlaaDdkNXdYa0FOQnZsdTVxazIxN0ZvcjJhcFBB?=
 =?utf-8?B?cnREU2hIVDRIRy9XNUpHcWhHMjltaU4rMTlNWHRsNktHdG1hNGs4WHYzbHhP?=
 =?utf-8?B?MGNUdzdtanV4c0R3S0RpcE9RUFR4MkRYanRCeHBGSDI3Uk5nbUk5Q3pDaW5D?=
 =?utf-8?B?bEJXWXFReWFscWdweG5Fczl4aVJHS3R0VWtjR1c5b3drN0pSRXhKdXQxV3ov?=
 =?utf-8?B?d0F0dkJuL2ZsMlU0OHJ2NE9zT243NkdVYXh1THViUG1zSHpZaFhSVUsrdit6?=
 =?utf-8?B?b09FZmFYQXVvaG9kUG9KclhlSFNTR1c3eEVtalNXVFNOZmdnZTVCM1JFaFBv?=
 =?utf-8?Q?0/RNZkwjsHrTsttxUjk7XYJ2L?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aXcC2LkvUioMMLupymJfjYM2+o8HubYIb6GOvmo+hH7f8obz/y7TpbwGYaEbjFwg95Du8iueBGWqk2NbmIxSyfFeUzcs8HIfcHccnU5M5fWJRxDWzSZoPgx4luz1F0ps/KqjTzXJbBA3Dyn53WXq4Uo46L9cplcs+NSJUQJlBZib2TUSCshV1adrbRwFCc4uVjm6ItV6IV3xpbwP8lC8o49fcK8iDuU8Al4XUmQ9Uz/JD/4cGAlpDHIP1VrZpRb1evqs8TYXdqTgyOCchpYx2PwbUCvV7H9RORh/dRjxsAn+p0pZ83KudpnCdfjOiGA8lyitVmcSqA288/DeQ69N6Dxe8uR7CJrYxBSkRaTjMIp5jx76SO1jeLkoAYMiXlxrBRHG2uVhbgui2LsQhIseJJVb7qrMbitN1jXJmzRE5QNfcMdXO9DVuGGhozXls0l5jbkct8Cb8iOzVJrUQWQ7ybGJ/gwYfRah4KgWExmXQDX18uiB64YI49CpGzgDlQN+0GD34z/0n6LYN2WqdrUcJ3TsrTVwaWKzP0/WDxyVohfQKC/SeVTfyv+tPcfvrrpIVpq/pj9dIVhUsjS1cITBwVuerLlkd6+BiBpxgjcu7DY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8444be8d-4424-483f-6d04-08dcf47644b8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 21:53:17.8270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RsfD5n6wa8avOHKmyLcKV6uIps5oYMYHtlRiYn8DBudr1/GcYmyIwFb4oQ9gKzQu2ijTys9dojUpzs60m/WWLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6173
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_20,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410240178
X-Proofpoint-GUID: EgUuRYUK0dtjdag_UUKsfVJFQPvhuyR8
X-Proofpoint-ORIG-GUID: EgUuRYUK0dtjdag_UUKsfVJFQPvhuyR8

On 10/24/24 17:12, Kris Van Hees wrote:

> Alternatively, I'd propose simply not doing this caching of state concerning
> which clauses to ignore, and having clause_ignore() determine it for a given
> statement without using cached information (since these flags really amount to
> caching of information for optinization purposes).  Perhaps that is the better
> option right now?

I guess that's okay, but at this point I'm inclined to do the 
caching/optimization thing.  I'll do it as you suggest.
