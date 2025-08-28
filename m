Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2253375C6
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 17:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756403820; cv=fail; b=CnKQ07MB/sHMqkiYhxC4fZAOifUMs28lNd6d3zhMZCeIuC7mkaQNfTMy/TyroMY/SvQoUa/6IARLV69jrjn20L9+hmhl+WjIa/4PDXEDOtQCOW619S18GrDSeQuOQig7IDP9t0K5heL5/U51N63UedK5343jpAXrFXO0uH8Mtj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756403820; c=relaxed/simple;
	bh=fFYdoSg/45mKGmQ32NPBKxUjQWOlNIZsdLtIyFMPjLA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hM6jGkxb7jbRGE7f9DCeP+5/L61FxqhOhyy+Y6L3vH0wvNuNvAo98pG1b/eFEQ1fvwc9GVhQEEWZlbAoGF97uH55gCOVQ5awh5G5OWsGZBh0Mjw/gKyfiuUNUDAM4JkRPDDbJbWx+4PEqJYz8mk210jgU2ruAGEvVjCVeeOep+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OjKGgDMQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Qxt6VeEe; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OjKGgDMQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Qxt6VeEe"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SHNcBK019360
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 17:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=dagJ0XIDuujZLn3eTl1p6QZcyDITWFhxd0o9CVE8zIE=; b=
	OjKGgDMQuJcFplfvXURlmb2f20PjB9kAud479FEPoOjGr/Dwa/Vv3q5vzxE86L/a
	TnAIs2gvZJHdckj+sFn66lBsjArrKvjPzWVpfsnr/lX+Ah1wsewZskM2G1l+bEKc
	0Ede3OxcbrDA3TzASYm2EdiXwzMaE/SqBNL5ZNLtQfDZzS1R48Jvhj43Jyz57Z16
	S57SBQ5Sql/P67PxNZ8c967Ulpq+rb7Gayfk2kTNe+8VumWprKHxWPsH9JVu/Iy6
	y16GVHpcCG9Gu4aDg6wx948TF3Gh34gAoMd4lpxkav3qqCSkmJEbSsA4Eoh+VwQJ
	XnjJgtfpvlr1b8au+7xuoQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q4jas3rg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 17:56:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57SGfHeu014662
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 17:56:57 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11012046.outbound.protection.outlook.com [40.93.200.46])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48q43c707v-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 17:56:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JDIGvKWrIkvy2HiRj9QgE+gZe5ODATKD//PwCaGXDTC1AkCUsvgqlDBggg/1Kay7ExERHlgLT6xJckJ9ddbbxii+2RldxJTNzL7SybOF67SQ3t8EJneZ844mX5dKIP3Xtzc3szhWn59KZmRuCuYuZiYCEe27x4Y4d2EaaMmJth1seGE+efdY1AtbVvkqf+KNNFIHvZpSemEFJ7HJmMwe7opCRZ08paVgnmPNLeGoeuBwOVY0s9gACYmS788hqjOwZdukE/MlSSqf0J2j1muyt67eSeInYA7RTdChc/bLjz9eMYenxRrr8waKusAiEAAf5bItCJ9Hf4DKhv1PqIrIhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dagJ0XIDuujZLn3eTl1p6QZcyDITWFhxd0o9CVE8zIE=;
 b=p3u5p/RfBqCjPlsymf/0jXPBN7TzwMxoJJKcAWDF3tOlYEB98wosT5TTs5NPqVxN4DFZ7iaz5UDCkQpRLyF2zILE2KSS6dh+KuwYhIC3zqnI5Lld45jbVqKgH3IzDpUGJlt35NY6gKepSBX7lSM26jxBZpNpn5DOeCJO+o3e4n+6kW4wGTHWzyjqshKN5mlkyYIWD1N3fePjYEmNTbf3RzF26tmUZxxzlJWx/aBsjb6FJVpf9whxeLv+U204jmNzDHE2aFlNx1LfJmvnvey9FrFcDPx3e/TZVPVrtycDOibMJzceSA8PBqigSmmFZ6mwP4hMREmWKv0cRjwq/VAUVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dagJ0XIDuujZLn3eTl1p6QZcyDITWFhxd0o9CVE8zIE=;
 b=Qxt6VeEeNoR0XPQpw2bwESB6XDTemNE8BRJJCrMY4SlbLN+Pf5niSnK7pw0K0hBn2iWhHudz/S1u/3CjCltqEvgJqNL+r6BIMuvL8MspE/zf9m16xMSC37DWCdJwYMSC1yTAMUaZhWP/Z6gt/x/PCoMN7ju/hFHQsV7g1HBC32c=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB4496.namprd10.prod.outlook.com (2603:10b6:a03:2d5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Thu, 28 Aug
 2025 17:56:48 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 17:56:48 +0000
Message-ID: <1fd04dcc-4c22-cf62-c050-19b22b1dfa0e@oracle.com>
Date: Thu, 28 Aug 2025 13:56:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 1/5] udp: new provider
Content-Language: en-US
To: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250822181629.30972-1-alan.maguire@oracle.com>
 <20250822181629.30972-2-alan.maguire@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20250822181629.30972-2-alan.maguire@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0157.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB4496:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c6c3890-d70e-4728-4c3a-08dde65c42bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZFgzZ0VlMXBOYW9BQU9iVzFOR21MVnFSa2N1Zno1aVora25uS3dsY1VhV0NU?=
 =?utf-8?B?WU9SVWtXcmR6ZkxYSkN6bFpQV0hpaE5IaWUwc0FjaXRvWGZUQmZISUdkNTZG?=
 =?utf-8?B?Rlp3YXJNbm9nTkx5QjIydWxxVDQ4R054bXFxdHNPdjdKRVplSi92aS96Nlhi?=
 =?utf-8?B?TG1zYzZORFZuTzVwRldRb1F4dWxycEgrSGpDb3lZa0pEeTFUSXdOaENBaFhD?=
 =?utf-8?B?Rkx5bUh0YnQ3YU13VnIzSFpKalRTQzhzclg5dlVCZllZUkhnNU5RM21Ta003?=
 =?utf-8?B?eWJ1MVhMVXhOcWpVRjVqMTJadGxmSGh5U3krUTVwN0JlK01rNUhURGF1elE3?=
 =?utf-8?B?bThIUW43WHpyWTVGN0ZhN0ZmOG5KaUhlY0tBZUZBU2J3Wmg2YWdkQzdGS2pI?=
 =?utf-8?B?REZLK0J0U2lLSW5nR3JrWnpFWitmcm80aTVScDFseG93OXM0dVFkbWtKOEZl?=
 =?utf-8?B?Vm1odmJYNFhobVMyaTYxZFhtVjR5NDlDZ2hJdnN2YWQwMFplM25pa2ltL01t?=
 =?utf-8?B?YWFtSlNUNjRrY284RCtZZTd2b0tJVjk1VGhFdUlLRHVlLzJKbk5jTXQrS3VF?=
 =?utf-8?B?VERRcXNCUnNVc05OeVdJNENiTlgrM3VSU1hxdDgySEZuRFFHYzc4elByalU2?=
 =?utf-8?B?QWxHalpTTkJPNm9aRkFtdXIzK1Y3VG9QS0FFOUZNU3c0WDZ5YjJhWHNKcjE4?=
 =?utf-8?B?RytqZk1QelJNc3NEQ1FyWGoySTFCc3dvSXJpSmNIT1B5SnZOeVNyNi9HYzVk?=
 =?utf-8?B?cVYzK3pONjB4eTJCd2tOdEx6aDhoZ1V4MkhSOC9YM09Lejh1OEtPaWRWVUMx?=
 =?utf-8?B?V20xQTJIR293Mm5vazA1Qi9qYkRLU2pGbmZHSk9IeHREQVNtZUd4Q2wwRExo?=
 =?utf-8?B?cUVScXFBMm5nclZvcUJIL1R3YjJMVkhHUFJIQUwwWjJwdEU0V0t3UUhlUk5m?=
 =?utf-8?B?V2g5MGlWN0pNSldWVVBFUHVPZVRyejgwbjg5QVVqWlhlU1pydzBCMjN2OFV0?=
 =?utf-8?B?RmR5dVEycFFLWnA4VXlBd1BLWDdrTTRqNFZMQ3hPTis4cXppOGxZZjVyaDY2?=
 =?utf-8?B?aUp1c0J1emtzZlNGNC9kMXhidFdLbWZxb1h2U2VWN1IxT25raXcxWTlOZCt1?=
 =?utf-8?B?TkdVVEZoK2tsbEJ0bi9FTmw5RjFYMWVySFkrNUlwOUdCL3BJb2FzZXhaV3dS?=
 =?utf-8?B?bGdkbWxSREw1WU9xbDBOdFB0SDF1VlBkczBoWU1keHo5OTA3YmtuUmFKWjhl?=
 =?utf-8?B?bmpDVjJLN0MwVFZDVlducHpIaWh4QVNVOFpORmNIaDdtNW9ZdVBMV3JLMzlK?=
 =?utf-8?B?UE9aaSswNFgzR09zbHlqSGcyZ2Q4VnduWENnbkZLRVd0REhmL3FveURCZW1h?=
 =?utf-8?B?SHBIVzNvbHB6QVV1MzdpUnVTM1czSEJKdFpsQUFwNHJuK3RoYUpBclVzZG83?=
 =?utf-8?B?ZWREK0Y5VmFqSDQ2cUJBVVcrMi9LNnphM1ZPdWtJNnM1Tit6ckpWKzhRQ1pR?=
 =?utf-8?B?d1hWcDBXaGY2TUhDV0RuaHNRWVhFUHc1M2ZxbU5JM3hvdmlZK2FSckNVNjg1?=
 =?utf-8?B?ZThlUTVFQkNZTk9TbENRaTNzMEsxK2RCOWUwQkxHelRoaTJWaDhHaEhsek5S?=
 =?utf-8?B?Wkl6SlViRXhvRHdyLzlQL1ZvQUZhRXM1N1IvbFYyWTQzcDY2NjJEV1JJTzZn?=
 =?utf-8?B?b2NGRitnVnlqNEQ3aEVVczJkQ0x1aEYxaFBXQUI1UlNmSjRpRS9RckN2MUxq?=
 =?utf-8?B?RzVjYWFYS0dUeStHeEVlUEN6YVkzSWdNcENUNERMcWNUVVpMVTJaVjJIZFpm?=
 =?utf-8?B?cnNabysxVDlsMGFRS0wvaVJpak16RGZCZ3FUZng3VldWQ1BTbm9Zd05MSDVi?=
 =?utf-8?B?ZTladllGeEVyQjBqK3hVenUyMndaZG1YMTM2cCtWQW9RWWc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDZia1puZWhyTm5rTXFMdVVrQzNIWm1vWk54alRYcFJIdFV2cGJOMzJPaTc1?=
 =?utf-8?B?Q3dJRk9CbXJPVHhUQXRaeVVuL0pXUE02ZzBiYVNuOWJsUmV6VGNmMElMUmts?=
 =?utf-8?B?MkRhdXlBeXR2d2pmQ2x4QlVUWlVOVjBIazZHTFp0MWRmWFhleXJCOWk1R1du?=
 =?utf-8?B?Y3BTbnpOMjNnSm9lRktkWVRCell2cVI5TXNMLzk2QVNYWW1Dc2QwTHZ0YjlP?=
 =?utf-8?B?Nm94NnBZZFUvUm1GcW9naDMvdkh5S082ZDF2akZ4em5OdjhKK3drWEhxcGJq?=
 =?utf-8?B?dTlGdFFONWxUbVk4aVlPbXZ4RlBWWXRuNzFKYklIbDhZN3ZhYjMxQ3lQNGZD?=
 =?utf-8?B?dlVnTkhTNFozZjQ5ZlV3QmR5NjhFdFQ4ck5wMXdRVDNIR0lVQit0RGJEekRL?=
 =?utf-8?B?UUNoTitHWXZhQjF3SS9EYkh3RUtBbmxBeFRPemZlc01IaGtnTitZSDJxTVRm?=
 =?utf-8?B?dlVHY2hhekJtb3E2cWQvK3pSK2p1OWhaU0xRTHB3SnNBL0tEWG1xM0VNSzFT?=
 =?utf-8?B?L3M2bkhEbVpqUWUvVklSK0FkSGkvTXY1R1hhdkg2WjRjYndWdzV5d1d0ZWcw?=
 =?utf-8?B?RU9RcWJmMGtWSUh4SFNxMWcyRW84MkYwTzRqVkFkcmxtNDRySXFjdmk3NTBM?=
 =?utf-8?B?OFZMK0Z6UGVpNGhxZHoxYkx0dnlhbmpvVHFFbm5OenBVYWE2STQ2dUFabkJM?=
 =?utf-8?B?aDIwVGZTWXg4NWtuejVMem4yditSUlRNUldlTGRwVmozVjBOdWw2bmgxTjBV?=
 =?utf-8?B?eUE1Nlo3ZUNOOERsK3NNbVJSUTlXWTJMK0gxblVKYjV0dUY0dWNjbG1henE1?=
 =?utf-8?B?SHdCVGFaeW1LMUh0Mno2SnQvVEc3K2VVS3FjQVlEKzZ3M1VmbnlOOEFCa2w1?=
 =?utf-8?B?czZEWWhFV2RDZ1VnOC8rOFhhWjB5d1FaQ0tZcU5BNEp6aDZEajlib1FIQWlk?=
 =?utf-8?B?ZEVUR1FtQzA1MmMrOVRKL09GRXZ4KzFMOVpQdlhSUXdOTDhkVEtPRUxTaEZW?=
 =?utf-8?B?eVFBMW05SlpTYmx4S3FKeEhBejkyelMwb0s2bDNtM3ovZUdtU1hnSE1yVUhN?=
 =?utf-8?B?VmxXQ1NjYnlHemtaa1lvZGpmL0R2UGpjL0wwNjlMNEFwSmt0TEdUOUtaUFlp?=
 =?utf-8?B?Qm5OZVl2NzZjZkpBZUlGLyszVC9sczYvdHVwWUpUVkVJR2hDUmloYlU0MmVF?=
 =?utf-8?B?ZGd1ZURaY2c2anVPdFBhZnpOdE1pMVppVnl5VkhMbW5xRFdpdFEvVUsxd0NX?=
 =?utf-8?B?bmNUWExBT0FZY3h5TmkvaHJMMmFRUkZCUzFrbUpwRituc29XeUlIcC9lMGcz?=
 =?utf-8?B?QlBlNjd5cG50TGdTRUNkRlZQTzBoYmhDUklETlZGdjBna3RDQVBBOG0vVXM5?=
 =?utf-8?B?UjEzbVNEMS9pYkFUWlNEK1RWZ0NBaUtjbHp4YmNtWnl2SThULy9ESlJoTWNX?=
 =?utf-8?B?Q3hMZmtKZmtiR2ErYUlGOFBpSEpUcitYclFreXg3YjY2dHd6am1Kam1qcG00?=
 =?utf-8?B?cmY0cDRWbEZpVmIxY1dZdkpDekxpNzRvK1R5M0VuSDZjREFtL2txYk4xRDRW?=
 =?utf-8?B?S28vblNmSXA4TnA4TE9HdkpiUlpHYTNqdlNYRWNOdWlJZkhEQWRQZWh5SGxD?=
 =?utf-8?B?MVQvUW1MK1QyM2ZOcmZCUDViSDdtTG1heS9pM1NOUWRsSDg5emRHSXYxSEs0?=
 =?utf-8?B?Z3lJMmZEMGlrMFBPVEduWTYvV25zOGdISENkUU5hREN2bWRRUy9Zc3RDQ1J0?=
 =?utf-8?B?WDZzdTA4UElOcmdrZXFKRDkzYmtzNGZoRUhNODFxcE8wODlJT0tvYWUraTVS?=
 =?utf-8?B?RjlaVGJRN2NhdU5XS3N6ekZMTGIzSDF4RmE3WHlRWXp0VEs4ZGR1aDVFWnVW?=
 =?utf-8?B?dnRydStDVGpIOWJkUlhObEVBOXNHYXloR0ptaUV4dkhHWHVFUFNXVzBxMVNR?=
 =?utf-8?B?Qm9xRXpzY05QYXE1VDRZY21rM0pxamxTM1ZWbDIwQWNhcVNFOUdiS25QRXYw?=
 =?utf-8?B?M094QTJDVENTaVpCLzF5bXB4Z2E5Rk0zK1V3QTNYc2RZYWdORlgzdUZKMnN3?=
 =?utf-8?B?VXJMYlpmOUVvVWg3RnlIaGorUlRLdnMxeWFIL2xrVHpyLzV4Wk1kaVlBcWdr?=
 =?utf-8?Q?jWOPBiUy5cl/IyqgFOT/Tbazz?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	butKfiuVEF+jUK9zZ8mteu/KvMM5QrJSLlQD9aJwooPV+20+yWq7AOyMOPfOBoKpC1+SA4Xx/5MdoKUU4fElmSCfFosXcPiiA1CHpH7FXP5h0Z8gAgmzYWeGqDAdoUJ8IkXk8zgZUQO8Xlg3xuaoAmbMfRi57AI/C6lL7yBdGfUM0pQNVcjPiLKdloJlG7X0KEs50zG7t97AZftRXUl/ogIERXQu2i9SQl9X/I1O9bAejk0kbdo77+RFGKtpr0n+mWtIbHIZdJO+GTKrPfQabLImPNv39OcHi//GSLfG76hWseZTnqGsLN9qsaXPnKYBF9CAwhqAfRBoVum/iKbw3awpQfE13qv9WBD0U4OCr9BOsv9iKIOOR9NXsh9JNOtgoBEkUvwYtJ0erqpXoK6FfoER3OKEvFUo4tYPAEDiyPrPVnLg+diKq4K0t9cfA1MKn2JEmvVUpeP+yH7MuTxWkKOFFWdMVa7x75TQjI2BGc2pdyUDGR+U8AhVT4OjSvAn3CgnwT9xDQ7aqPuvBhRrJL3ngLwxH0G0ysqmXTFzYP81qNj0bQx8cignCew5V/diKrxJ0xrAVu9uk/oeCGVp34Y08mOXeqTSvjJzQOQB3qg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6c3890-d70e-4728-4c3a-08dde65c42bf
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 17:56:48.8891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sfp/oc3ockVZ5HLoxgnTJ7hk21c91Btvzr3CTzI6lLQP2yjaWj/UvBrRx+/CvyPgNOaLSuBCp7MujcuhoGBVsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4496
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508280150
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAxOCBTYWx0ZWRfX2w+DBYyRmbjM
 6wZeN4eMVCTD2e85XpcIdUSjB/91MaIMUMp58fXTsepe7BkRZUpYXrbC+l3zdJyJ+sF3ik/q66s
 N1WMoDl7kov3mfhNtj82k5DyZY8jIXGXfUcWL0qjSWdL4Lmk8Kc4P7ui+9oDC6Fsi7jW6DwZqLi
 N5uR1/2OUJgGN4hZ8vqWyXJFd5YDCUU92AWnWqHcfpmvB6ip89rpSWiMgGCjl3jNRUPKzoHw8f2
 NypyVmSJLKUsMJVmemD6TK9SAhOe9Uph9P7VjghKdOmP57U1Mj9KLPh8IBA5++po9Sx/hdAa/Ol
 cvK7ig/l3kDVUvF8RzChY5bs7VQVSGwKgktyscOEsyLm5QB5Tpm6H8GhtWpJR4VGEtIoAszFBU5
 z8Tbo6ANTCme2zNbF7gx8QusCv5AQg==
X-Proofpoint-GUID: 7JC6W0XzvLRKS_uDY-V9gADpUA4nG7K6
X-Authority-Analysis: v=2.4 cv=IZWHWXqa c=1 sm=1 tr=0 ts=68b0986a b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=4XkNvupsMfk5wt0-3BYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13602
X-Proofpoint-ORIG-GUID: 7JC6W0XzvLRKS_uDY-V9gADpUA4nG7K6

FWIW, we should have the "cg: fix offset for > 8 bit bitfields in 
dt_cg_ctf_offsetof()" patch land before this patch series does.

Anyhow, testing x86 and arm for OL8/UEK6 OL8/UEK7 OL9/UEK7 OL9/UEK8 
OL10/UEK8, I get
     test/unittest/udp/tst.ipv6localudp.sh: FAIL: expected results differ.
for
     x86/OL8/UEK7
     x86/OL9/UEK7
     x86/OL9/UEK8
     x86/OL10/UEK8
     arm/OL10/UEK8
If you like, I can investigate more or report more details.  I just 
didn't want to dive in too deep without checking in with you first.

I do not know how documentation will be handled, but it's possible we 
will start to see that become part of this repo, in which perhaps new 
providers need to be accompanied by doc updates.  But I guess that will 
be the burden of whichever patch comes second.

Why is the module for these probes "vmlinux" when not all the underlying 
probes are?
    ID   PROVIDER       MODULE                FUNCTION NAME
75616        fbt      vmlinux       udp_queue_rcv_skb entry
78708        fbt         ipv6     udpv6_queue_rcv_skb entry
74498        fbt      vmlinux             ip_send_skb entry
77968        fbt         ipv6            ip6_send_skb entry

I do not understand why the arg5 trick is needed, but I trust you!

On 8/22/25 14:16, Alan Maguire via DTrace-devel wrote:
> Based upon fbt probes support UDP send, receive.

To me, this would read more clearly if it were "Support UDP send and 
receive, using fbt probes."
