Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15511185B68
	for <dtrace@lists.linux.dev>; Mon, 30 Sep 2024 22:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727733652; cv=fail; b=LmkAZgNkHGr1AeR/dNxEd8jzsMpXyrtmAIxl3inKmidvRIz1ZGrhYkxqdal0R9ED2ZcngFJ28aZ57mzExEXYdH0UOv1SBIoDlz6K+yyr2nGFNeo3GP/ntSnCpGsC7tfZ9m67qplV1wTDQYQAuSctE59U92hwyQPLEOUqLDuyI4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727733652; c=relaxed/simple;
	bh=v8AQeDmLUEWOzvsg4tR9rlMCcpIbrgLj9/Ge0ftoc8A=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qJaQlIGdvkqvyr6YoaOoewAUWJdWgMxgqNKJwweh3ZR7yxLPFYMc5i50ihXU8/NvuiMYpc5/YUEzUmean39Tyqu9XRDCRtIdHPm1bRVARlaNPuoLrq27WbDHg2EwXlpm0+raDcxGmX9qRRX/9WonCBxgbLBIAAqhF6aVzLlh3qI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RLssX4ib; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=o2Y1ymjf; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RLssX4ib";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="o2Y1ymjf"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48UJte7g002761
	for <dtrace@lists.linux.dev>; Mon, 30 Sep 2024 22:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=46X6unlN441hemQFC5WgmS6f9a0GzY3+c/I7xKzKodA=; b=
	RLssX4ibwrmyrIltKU7IAcqn4ZCwKhSJr4l4F64GqVV707AXmjPvpIEqt8kIOo6L
	lhvhyiZ64ZjGWGz+N6Hw1gkUwMKsdpNe71Nlfa3ZEyFT/NmOIjz775tOo/DDEM0t
	tL1P0Uu8gMAwgi3Ri5oXu3lj91+7nI/DHg/x4N7EBntzvP0HH1uJomOlaWq16wT5
	tDUe65TeZGHwxC58YAlAi3vKeDt0ceYPrE/jc2X4HDdqJ0vABkkxknw8Oa5qc1kk
	1CaApHng/LQM59i4SqKGhFLe5uLlOq2VesPkqKKUbmInSxWhHc4DujakavTa2Iud
	yKaKMt7Yi2HDr//0h3D+Ag==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41x8qb4v7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 30 Sep 2024 22:00:48 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48UKGrHO026373
	for <dtrace@lists.linux.dev>; Mon, 30 Sep 2024 22:00:47 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41x886p90n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 30 Sep 2024 22:00:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SAvNBuL35O/BNtd0lBCEGIvYJl7ryp65oL2oQd7zc3krEMPHDTZDKytGPnfJDQtOKq0g1H6hzg2gzhjLuWoZE9Z+fBCjKF97w93R/GfHf5Cod8wHOlhmF7CHW1xxcCR00ncRfTqKdOAf7GRZAsbqBJp9/RuXNBd98nQXiGbJurPAjyKAjg5UT2QN2eyvlrUzVQd1hYgQTO7Z8A0yQO/OBFtf5LkXCBICwxznCzjVQsPkXPy4/WHvuaAjAPCW7HHREvE8IMrPhvc/KDHwnRm5KZndjecz4y616IGZTMtcvKhXPs2ZGPAv7wxsDHh3vVsLDgQXwafek9A0pbz9+/leJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46X6unlN441hemQFC5WgmS6f9a0GzY3+c/I7xKzKodA=;
 b=FGl5MSfBZlC9rY5jv6oHpEWvdXG13VIUXYqJ0LwF2BUHQXhOVFNd1nFIhxLAjtuxkqel3vhGbCrZ7BLFy9ErHuqhQTlqBSAPmbpSfre7mY1M4y1SuQo4am4tsctZTalnLEGP9GCWQMdt5QuA/a2rcIu1AsXk2hFzF4FlJMBJKiQCVDTow99d77ykq5PBLdOA6Mht0PdKwg8lCXqO7iixglmXKfW6v6lhGIKQmRV9W07rTq5aQ9qNR93W3MRSqDjnUoXc9TRnBuCYMEoRnkTLBW+ajynOqur06q+FlNyoBYDfumFZJgE+d35CC3eFeQ0FVlfW/3/HzcyCZgDUnhsUTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46X6unlN441hemQFC5WgmS6f9a0GzY3+c/I7xKzKodA=;
 b=o2Y1ymjfiZf+yyQLGK8HSNcfvXHGMmnMQJPPJ69fszbjB4mwvQQJIZj3OaB20rkUBpc5efLhYB6FC2z1zZFPzyw+bc71zVk4GEB6tyCrJmvjZDODsD2fwMqqkxL8P1dwIKRWbzqZM/lXSQlc8U1zww8ZEniESBcfcQXCyLT5XM4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA1PR10MB6711.namprd10.prod.outlook.com (2603:10b6:208:418::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15; Mon, 30 Sep
 2024 22:00:44 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8026.013; Mon, 30 Sep 2024
 22:00:44 +0000
Message-ID: <5dec4af0-1f53-883b-18b3-c9518498ff61@oracle.com>
Date: Mon, 30 Sep 2024 18:00:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 30/38] Allow relocation on BPF_OR instructions
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240627053904.21996-1-eugene.loh@oracle.com>
 <20240627053904.21996-11-eugene.loh@oracle.com> <Zprb2ZiDYTWEx+Iq@oracle.com>
 <ZvsV3uVcPUBTr19i@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZvsV3uVcPUBTr19i@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1P223CA0007.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA1PR10MB6711:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a015073-8db3-463a-5aff-08dce19b54f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3NwOG4xTFpXK0pLQlF2bDVmaHRvNEJsVmRCcGJCWXdlSjNRY0FrK0JzWXo0?=
 =?utf-8?B?SGtaTXlmOWRVYkR6YkxOUDhmdkRNRk1IVENEamJPemZjTHY1Lzk1TjQ0YTFQ?=
 =?utf-8?B?T2tiV2lxZ3lYbzEvU0FkUEMrZjY3WWVlNjVKeTcrbWNuMlR6K0lqTHJRcmtq?=
 =?utf-8?B?cmNSWHpXazBQWnNyL1IvUGJ5RTFQczVPaDVoZW05QUJiMG4vV2JPY29DdDdD?=
 =?utf-8?B?UnVPTzg2cXd0MUxrUWtCMWdYei9sUmpueElhb2xZaFdKVVFNVnYvNytTZHVo?=
 =?utf-8?B?d1NwcW1vemxrVnZjaEw3U01jLzd3SzdESGQwN1pMTEFCM243djJIL2RWdHBO?=
 =?utf-8?B?SmVUNE4xV2VZMHFpeXFpeEw4TU9YZElHM3VZM21sTkFpOEF6U3pDejNzQXBz?=
 =?utf-8?B?cWUyOGlQZnp1NUptSDFJMmlEY2xpVy82VjE4Q1lxdlc3WVRaMXRIM24xdTVw?=
 =?utf-8?B?c0VPZ3FrYzFkeHF1UmF0VnFBa2M2TzZpbnl1THlKOFZueCt4bWYreDVhaGZH?=
 =?utf-8?B?cVg0c3ZPVFA4RytEMFczUTVhUXZDMlVtd2FpUFMwQTlGMGswWi9jVWZwZ2h1?=
 =?utf-8?B?TlQ0NFhPanR6Z3hGU0grdTJKd0N5WkJYekRLb01aejI1RGNIM2tIaDlwckNN?=
 =?utf-8?B?alF0S09Ma1IwTGh5UTdwSTd3MmJqS2k5TnZsNm5WMTlTTEtTdExOb3BQVUpP?=
 =?utf-8?B?cWdqYlNVMUJPRGZON0NWNWcrUzRRSnVQTFBXaGJxSTBnblUvUGxUMUEyekNI?=
 =?utf-8?B?ZFRkTkx3MjI4RkVMZHY1L2FCUi9UaGhFNG93UmcwZ3k1dmwrT2s0clhHOWdm?=
 =?utf-8?B?ckhNc25aK3VOQkJJWERubzFmU0FPS20vOGkzTUlYK1h1aHdnSHFjWWorZVBZ?=
 =?utf-8?B?bUhpenlFMktWMENPelNGQ3ZlMGxNWkJPWGZ1OENtU1VUVDF4aStlZDBLb0pJ?=
 =?utf-8?B?cS9obGMyU3JWOEFkQi95MkJ6UlY5cDArQ2ZRakxLU09GWnpDamZzMUFKNnh0?=
 =?utf-8?B?VmpMWnNOYjk0Skd2UThRdG56Ni9HS09FVVhob2ZSMXZoTThpbVBpM0h0R1c5?=
 =?utf-8?B?b3ljcVZPc21rS2xXaHNJZ2dxZ1NTcjBTeXU2cDUybHJ2bVVFQjFkMDlpbTgy?=
 =?utf-8?B?RDYyTnp6ZG9CTHRLaVBuTHlxcWN2cmcvbVBIUDEzK1dWeC9jUUplQkhGdjFu?=
 =?utf-8?B?UHRMYWtEQTh0di94eTlOQUdCalQzVHY5eVpPSHZLYmhyV2c4eEhGSFEvWDJr?=
 =?utf-8?B?dzNncnNRVG9keVBIZTR6VldrWmNKTFV1MGxTSU1xY1R4dUk0dmR6WG03eG5a?=
 =?utf-8?B?OGFMaEVIRWpOUHVxNStVa0NCb3FSNlFzSkdGRkNxRURaM2hrK0VDR0t3QnNF?=
 =?utf-8?B?ZWFZOERCTEVZR0I4bk9KTWdUVzY5U00zdEZDdkdwNzZFUUlENjBsd0owZ3Zs?=
 =?utf-8?B?Z0taWTcrYmJoc1pNSjVSTG5ZRkNXdzFrbGlXOGNXeGZoUnJNcEk2MGVXblBS?=
 =?utf-8?B?RzZvSjM1TmNPT085T1JvUFNlSUFsMVY0TXhUMUpHL2JneW1HL1F5aGZ0OXVG?=
 =?utf-8?B?T2J1UWg2MmlFY1E1SFM2enVzemVGSUd4ZWhvemdldDNLaFlaSkVRZWZnS2pW?=
 =?utf-8?B?TEQ4U2lROTNCMlpCcHI2NC8wSjFKNGh0R01aMmRSbUh1b3JKc1hXVEJGeUo4?=
 =?utf-8?B?NmN2TE5saUhUT3hDaW1qY1FWOTQzaEY4OGlDUUk0T1NHSzE0TlJRTDZRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3lDRm9SM1RSRlJDV1pNZ0VFeGdXb2docDlaWHY0WkhuWlhvVEdDZmY4TDN5?=
 =?utf-8?B?ZmEvaUhhY2FXRHd4MlpSQUZGWkFyWU1ubFl3R3FMcktrZUt1b3BrVVUrSExp?=
 =?utf-8?B?TWNYaVNnVGE3VzdTZ0pHM0VLek1UTGFYN3hXbmVKQXd6clhuRWt3V0hGQ2lO?=
 =?utf-8?B?U3pvRnF2OU90bjdCQ25VbGtSa3lNNG1kZzRyVDJoTHZkUmlsL3JXVHFDNDFH?=
 =?utf-8?B?NWhVOEt2TVEyck1DWHdVQWR4NTVDekM1RUswN2VCMmZWQ2ZiZWhPM1NmUmJO?=
 =?utf-8?B?NVBsbnFLVVZabHBzcFFQVmN5RzhYMzlET0VocWY3MGx2bkpSQ0czMTRmMDdw?=
 =?utf-8?B?L3lMYkphaUpFdUYxcEg3M3ZCbmxKUU9vdGRWV01tRlQ5dm02U2RlMzFUT3Fl?=
 =?utf-8?B?UUU5dmc5VkRpTk5Xc3lCa1lrSXJXNEdLZTBIYkdNbTVkbzc1N3FYWUo4bkdk?=
 =?utf-8?B?aWlxejVlUDdtMWlWM3JMZWZxSzhiTVYxZnhJTUF6bmdDVjNCaThjMU5xUkVL?=
 =?utf-8?B?c2prcG9LaHRDZUZPNURMb2xjc0dnMnU5cHlSVXdON3dMQ1IycDNJRmM4Vjlk?=
 =?utf-8?B?VlN5ZGIxVXJOZVExakYvREtob0tuaUtDV2NWZCt2L2dKQUU4aFgreFdEYmNm?=
 =?utf-8?B?bkozaDlYYXJzSlFscEIySWhGRDlzTzVTVUoxSDdVdTRBcm4rTzZzeDF3blNr?=
 =?utf-8?B?OEp3NDUwcy9SSFdjNWFLVTdoTTd2YnB0U2Z3NXhFMEhadmp3bnBJS0l0S0xL?=
 =?utf-8?B?MVcyekllOUZKRHl6RlZiOVdZWjQ0KzJqTGdiUFkrTWJkSFh0djRlOU04anJ2?=
 =?utf-8?B?R2tFTTEwVExqNmZ0UlA1ZkZYWWRzNHFzNTcrMFBROXRvbFNITTBSZkw1b2U2?=
 =?utf-8?B?d1FCenpCZ3BTM2Z3YkU3bllLUWZpMEMwaHB0STVHL25xNTd6a05FOFdkQVlu?=
 =?utf-8?B?M1o4cTlGYzVPNmpLbzdYdytRRVVFQmFRRGdrcHIrbGtPdCt6OGh3S1FxMzRR?=
 =?utf-8?B?dlVlTHpGaTZRcVRPZ3JmRW9yRlJmMVhtOVdPUFVlOEFSbU5leWRwck5OVlQr?=
 =?utf-8?B?akdPNVd6bndjUFVmWmJISXRuRCtyS04vZGFHZlJvdWNyMUIvQmdrR1JYTzZp?=
 =?utf-8?B?QVVZYVdRR01KaEF0ZHl5ck9PZDM1bXpIM2dBa294b3BvS3JUS2lack5jNDFl?=
 =?utf-8?B?S0o3QWxscVlUZmI1aHdOYXpBZjlvUTEzMDQ0SlZZTkVYak9MLzBXN3NnbUFw?=
 =?utf-8?B?RlZNQXZJWDh4WnhqbVJaVGw2QkRldzQ2bU9la0NTMUplOU1mN1Z6UjV6eGpJ?=
 =?utf-8?B?SGwzcEc3aENvd1BVUklBZUx0RlpWS0YyaXUvaWI4a1RkcmVPN2dhSFNRM3VT?=
 =?utf-8?B?aG1vSEsza3Y4ZmMyWFNJTWhUQkZ2cmN3My9aZUhUYkVyVElBNzBpMUZBR05s?=
 =?utf-8?B?L1pSRXluWktvelE3MnZZQjJ5d0hOd1VESXNwdFQ0MkNRVndvZ1pRd1BjQ1Zr?=
 =?utf-8?B?ZUw5d0gxVnRGelVzdG5USWlxK1ZiQmlsWW1zOVVkNGVkNWNTNnA5RlZoSzB5?=
 =?utf-8?B?Zk1CUUYxUktSemdoRWw0V2dYOUxUVys3NW1XU0dxemxZNjQ5cTFpb0poT3NX?=
 =?utf-8?B?eWRjU2FzVU53MVJRK1QyVVBjYWlCeS8yVzF5VTFEeUZia2tDb1dSaVJST1Uz?=
 =?utf-8?B?OFBtY1VCZjEydk4vNTh2T0Rva0d2ZUsvWTJ1T0Nnb05pWmNGYkRJcVArQmc0?=
 =?utf-8?B?YmppWWFjLzQrcFJMMUIxMm5iTnR2OUN4M09GWjJ2T3gxdWQ3b0NaWWJEamw0?=
 =?utf-8?B?SmFEN3FWeGhZS0R6cm0rQ0RYZEkwd1VIa3kzQ0V1Q2d1cDIvK3lTU2xSaHFj?=
 =?utf-8?B?b01xWUdqUTM0SXpnUnRzRENoN3JlZElQRjhlVFRrN2VMYlM3UUxOVmZHL2lp?=
 =?utf-8?B?Ykt4QVIxbTc3SnpqNHNXUTAxTitvY1d1dHRETzhMZFBtakNKK1NTcmtwY3Nk?=
 =?utf-8?B?RDlzVWE3MW5MTDVrL2RqLzErWmlNaWI3ZHVsSEtqZnBSVTBIdDBLUFdqb2VX?=
 =?utf-8?B?UjRBdVZBUUFVNEFxZjBubHcxMmNBZG01NGJGTDBROEc2Z0VzSFROd3ZhR3Jt?=
 =?utf-8?Q?URArkW5sUPbFtlQsoCvkq5r6i?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gWur2R9eVbU4iXbK833XCKId2f4W1RlHBAOxia8RGu8N8N+JkVIwxGfTzvqoVIHh2DIxwQGWODXtziiusTr33TUmfpLFk7Kb9Q1JxzU+uyX/vI+dAgIN9JRhl5pLkEbVcAjWjrzG0tZWqPoLmX0EZ6ITM7BgNsNpia97pefYeVamw5VB44Sc20TRL++GD/7oxlfzEzcvVHuv+VUf6asiP7T5luHL+jtbyOFhXR1PK+TKJsx7hT3cES850ORP2f92zd7ysJsq9DOOvTbVN+ySb3o84NbFrdRNnLKRTuvB2EH6h0lOXvEZU+9v+Ltq+LPxhDTIO82jBLk6obFFHh8JhqBHcZY2h/OX/KGBB2M1uA8Ea7JcIEiCtfm4+h9NuMnlkVGU9jQ1lcDIDhKxv8mOkfTWuK0Yt1nR9zjY/dbWOQpvSbznp8G+e27TbdE+BGFgSdkgURWtfzlu/aSSI3gJU8ZX2+rvvl3gZvNq2QAyLpEJA6UKM1QlXpoIppS3VuDHsLhXed6BJsEO30pPyMk5IpZxhs1z4cLHt0T7NOmmHostiuH7/kbxrUgz/8pHMK5qNx++EzY7JgRA7fONCaRMjc++sPr5nD+z2x2LImMkQbY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a015073-8db3-463a-5aff-08dce19b54f2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 22:00:44.2842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UscJCff5/oUCxELnBFsaMLXLAZoXRm2vWCkLJ6embXIbnrfHxFCmjYujNfGM5lGGaJYD7TmrRNjhq1ZpjZHJew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6711
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-09-30_20,2024-09-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=822 phishscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409300157
X-Proofpoint-GUID: S0qyy6m2W2FoxQv78qM9LUp6vMlstBxD
X-Proofpoint-ORIG-GUID: S0qyy6m2W2FoxQv78qM9LUp6vMlstBxD

On 9/30/24 17:19, Kris Van Hees wrote:

> On Fri, Jul 19, 2024 at 05:34:17PM -0400, Kris Van Hees wrote:
>> On Thu, Jun 27, 2024 at 01:38:56AM -0400, eugene.loh@oracle.com wrote:
>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>
>>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
> As far as I can see, there is nothing that uses this anymore.

Yes.  As best as I can remember, that's right.

> I suggest we
> ut it in cold storage until there is a need for it?

Sounds great.

> Alternatively, we could
> turn this into a patch that adds support for all possible operations that
> could require relocations like this, and introduce that to the tree instead
> to support future uses.

Meh.

>>> ---
>>>   libdtrace/dt_as.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/libdtrace/dt_as.c b/libdtrace/dt_as.c
>>> index a634b855..4b397f51 100644
>>> --- a/libdtrace/dt_as.c
>>> +++ b/libdtrace/dt_as.c
>>> @@ -280,6 +280,7 @@ dt_as(dt_pcb_t *pcb)
>>>   		case BPF_ST | BPF_MEM | BPF_DW:		/* stdw */
>>>   		case BPF_ALU64 | BPF_MOV | BPF_K:	/* mov */
>>>   		case BPF_ALU64 | BPF_ADD | BPF_K:	/* add */
>>> +		case BPF_ALU64 | BPF_OR  | BPF_K:	/* or */
>>>   			if (idp->di_flags & DT_IDFLG_BPF)
>>>   				brel++;
>>>   			else
>>> @@ -492,6 +493,7 @@ fail:
>>>   			case BPF_ST | BPF_MEM | BPF_DW:		/* stdw */
>>>   			case BPF_ALU64 | BPF_MOV | BPF_K:	/* mov */
>>>   			case BPF_ALU64 | BPF_ADD | BPF_K:	/* add */
>>> +			case BPF_ALU64 | BPF_OR  | BPF_K:	/* or */
>>>   				rp->dofr_type = R_BPF_64_32;
>>>   				break;
>>>   			case BPF_LD | BPF_IMM | BPF_DW:		/* lddw */
>>> -- 
>>> 2.18.4
>>>
