Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5978D16DC28
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 18:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761589758; cv=fail; b=pAX2O70GEq1r4EKGEKspn5+5718ARAzj/qkctWpkTDfUPIeA5jqmNq0qSBq4/c29ufgVoe820ku8wYRfiB8/HJmVky0lk5I9EKnOnys8HZeHknNtfvDwbScF8QsPtPJKuaxxU4BuusAl71888y9wtlo7c2UTAz+soICb8/6DZ04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761589758; c=relaxed/simple;
	bh=73n4wjx1g62ouRmBVOiakFqFMWOt23PnbsvJQXZzFE4=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=q2iSC5A5vbJgttSs+UGFmInH+UQWaTTmB4PvrUTcf0DCa6INfCX+f+sie4pPOxtR+iLCV1CCEUrBt5YXhD0OJoUNIt7x45fsgZ6evvZCx9y0P3iYSPsi/Fmql/AJN4n2qUQmqGKC3FoF3lrkjdK/6XNnSlXBRFsPcMR8Tsnl+3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NqmFmcyZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=U0VL2yv8; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NqmFmcyZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="U0VL2yv8"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59RDY9Lm022077
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 18:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=y44B31+veYWuIsgHeRnzyVZOg3l4spJgrWxbVeIRdLc=; b=
	NqmFmcyZ0D5ffRPcDjnQwWdiZv1Tthr0EngQLaS58uyPS53WxEUq2vrIptmn9KFb
	FiDDncVUMxBVCOJuMS3oWZExO41+VYOL7TpAx/cptHpPw8yeitcYxT60ywtyOm9Y
	LzbqbNNz6yr51nIkdUBQPsYAwPkLv6hDtSCF6CxTgN+ovZ5FslNs3dR4d9xQH1jU
	/KCgOoNTA5XRv71UsXcyv9hkvoLPfUL3qgTnkKdd1IfA8W9vc/Dhc62tjmINUl5I
	VFKVFkg/1t00KpJWXaaI6Lw2GI3uZV49YT80TIiAdUYqFk4hwK2fBmz76tfhSO88
	GWzYGEN2RTixfsZlE1dkRA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4a22x6smfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 18:29:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59RHmeNT016215
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 18:29:14 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011064.outbound.protection.outlook.com [40.107.208.64])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4a0n075uv0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 18:29:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZrUrZZbp9lGq2xgmUiFAUhFxCwPHspb6qSB4is7QN4YVMhmhIfq09DnRdqBYeIjjJqEHcpIWue224Z7WFmaOy472U9RbK3iuhC9b/Bj3TddvCICJva0aMjhdluSsN+cNXds+1OOpvUkPIAAtvsh6E1keLlMIiKehKvxK+WuJLcElcGiWOyaUGN+/GxkE11Wy2wp/3lKEELDvfqHfoR1C7M/rMiIBlGcPKfuz3eaXoH0hoDk1xwrfODQXxg5RRQ6jKfM/XtzWiia/xt5oAa6iNZ3bOk3MAcnt6AtzazsDlroyuIR1XHy8ZAVyzV2jsunsbE1jlkRnvX9MlHfg6Ricg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y44B31+veYWuIsgHeRnzyVZOg3l4spJgrWxbVeIRdLc=;
 b=K1Y9xWF+6W/QfO9G7ZuWiSDFb1RwduaqylqoFruUI+Z9U1XN0mK8dpUmtUVlGAU7mfMG13N/Ejgrw7/Bul+XOaPCJzRXiXVVU8KlBs0SytQJDFqsyLtvD71b49sqh6k3AG6WK6L02qYvFhVtc7nYPxtijAoPDH38V5NQIySAl1yvvA9QEz/ttmtrsDZ54p+6NUsn7sdTrJOP60SoNcAxGC8KKZS0dUfoxV30IUnGusN0jtm4OD6RrMmskxwPyFNYItrpPw2reaITCxvv7esccpDCgNN5H3c5172M1YqnzsakR36ctk0XV7kRatl19z04talPDxDr+1bWK7c9wIlkPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y44B31+veYWuIsgHeRnzyVZOg3l4spJgrWxbVeIRdLc=;
 b=U0VL2yv8OSuyw8Xyp/3jVAkOxU3adtDoAz/c4sdCPeFv8uJWHGkp94e0MZWiL6VutiQxIGpldqMNAYYoqiJXCjqScRkI0EYveTBVlo8SnjEzW2vvZZek/NNgLduWOW/FNQQVsZv8JmaiAcxTgSJSARFql1vJZ85p5XOQBXrIrtU=
Received: from SN4PR10MB5638.namprd10.prod.outlook.com (2603:10b6:806:209::7)
 by BL3PR10MB6092.namprd10.prod.outlook.com (2603:10b6:208:3b8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 18:29:08 +0000
Received: from SN4PR10MB5638.namprd10.prod.outlook.com
 ([fe80::d7cc:538f:ec91:3d1c]) by SN4PR10MB5638.namprd10.prod.outlook.com
 ([fe80::d7cc:538f:ec91:3d1c%2]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 18:29:08 +0000
Message-ID: <ec3fad5c-e1f5-a054-3d99-49ce0c302622@oracle.com>
Date: Mon, 27 Oct 2025 14:29:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] Bump up the version to 2.0.4
Content-Language: en-US
From: Eugene Loh <eugene.loh@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20251027182538.20466-1-eugene.loh@oracle.com>
 <20251027182538.20466-2-eugene.loh@oracle.com>
In-Reply-To: <20251027182538.20466-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR02CA0011.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::10) To SN4PR10MB5638.namprd10.prod.outlook.com
 (2603:10b6:806:209::7)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR10MB5638:EE_|BL3PR10MB6092:EE_
X-MS-Office365-Filtering-Correlation-Id: f69ed285-8396-4fa7-4e5e-08de1586b7bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZnVPWDdLcDRjU3Vsd0NhcHpKVUNFL2FpWFM2Z1dyeFhRa2lxL0FGMEt2VWZy?=
 =?utf-8?B?WDQ0emRqUm9Bakw0OHdOSUJJWTQ4U0RKSjJVZ01vS1dPTDhqdytZWGZNVG13?=
 =?utf-8?B?Rk1xdDBKRXB0RUFaKzVEMFZMZmcyV1dUWk9ha1hnMlpVOWdOVHBCUy9GbGNq?=
 =?utf-8?B?VzRoTGE2K1doaXVLaDkrblZtZitTREhYUlJhejJOR1VNQTlhNzBOWU1pZTdk?=
 =?utf-8?B?OUhsZExCVU9OaFBoWWw5UlMzWk1vWVdKNm9hTm5LMzBmeGF2TUFMY1hUMXlK?=
 =?utf-8?B?NkhiUERBSnJueWI2TURSNWQ5QlhXelJ1aG1NYXZ6dUlGbDNuTDRyOHNCVlBh?=
 =?utf-8?B?cWFHbkNHWDVLMEpmNkEyeloxMlFmblNHZDRTRXp5OXZrZjZ2YmdDb0J4RitE?=
 =?utf-8?B?bkZpc0lja1lwOGJoU2VtUlVieU03amd6SE5vWk52d0YrblpBaTlTUXE1WEhs?=
 =?utf-8?B?dmlHcWVLY2FDQ05qYlZnV1FJSzdIMzRKSWpsbG9tSllkRjJtZkRtSXNsRUFD?=
 =?utf-8?B?YlZvTFc4QW5DVDFsRGZaOEdTd1VJU0hSVnRCdUxybnZ4Vm8remhTS2NpUFFy?=
 =?utf-8?B?M3ZiczVsb0JqTGxPbm1LRlVkaUpXV2F5RlJTZHJXRWV1eXE3YWQrSFNiZkxZ?=
 =?utf-8?B?MG85UjIwQzV5TG5XQ3UrdDdOWjVKQ2VhZGdyRFMwNm9FeEtFbU5HUFNTOUxP?=
 =?utf-8?B?YkJ3SFNhLzlXWUpBUC9SZm54bHJyVDhIUXAzb0FmOUZNRlZITC8rL3piTjJR?=
 =?utf-8?B?YmhmMHk4azUvM2FFaURkTnNyWm83Sktoa28vYm5jdG4xVzFJRzlCRGZkSGxk?=
 =?utf-8?B?WWpSZHh4ZlNYMnZsc1VJUEhSRWRrbytKcWtCZmFrMDkwQk1qNEFtVklSdmEz?=
 =?utf-8?B?SDNscDF2TE1IREYzaFFic1VuSmRNb2ZSTEhQTVlUWTBXUElwQW4zeUMvcGgr?=
 =?utf-8?B?YmpLV1ArK2Fic29QNityYkkwd3lWS0poTVBSTDVNZWhUZytjbWRTblBLdDBv?=
 =?utf-8?B?S3lrZlNISmFIb0lvZnR1OElDeHA3QjdIbDRZdE5pVm5xS1NxaXhkN0s3aUM3?=
 =?utf-8?B?ZEI5bnF2bFZZUHVSU0VibnhrMlp3ejhaZEVoTjdYTWZ0dTNnQTVHa1o5VUwv?=
 =?utf-8?B?NFRHb2tRbTl2Rkkrd2wzV01xOEl2dXkwVURhUFVGUUhPT05wZ2VrOGc0YmhY?=
 =?utf-8?B?ZDhUWkV5UkRSdFA0THdmc1pHZ3hCaSsxTUVxc21IZzk5L2NRV29YYVZlcWNF?=
 =?utf-8?B?T3dqc0c1am8wUUIvOVVnVE5peDRQZU5LS3FkR2xpRlZtaFRnaGJmUDVaSXdF?=
 =?utf-8?B?aThCemtpTjdwOG9QeUUwMitVeU5MWTdXUGdlZ3lMSWpTelZtWjRjZlIrZlVF?=
 =?utf-8?B?c0hDVVJvVkpSNTQ4Y28xeGFIZnZTeUxqL2xDNDVRN0x1dnVzc1c5M1M0ekx1?=
 =?utf-8?B?Zlo2NzNMWGtyUFArMkxnbVdRMXVNK3NLT3pOc0VNT240THIwM2pNUUJXTjA2?=
 =?utf-8?B?ZklMSS9jRFhEQi95SG5vWk1Fc2w3QW5ybEFlZTVVT3FWazdrL2YwaEhmTGU5?=
 =?utf-8?B?NkNGMW5aV2swbmRSd2lPUnRZbE82bzl0VVk5QWRlSVg5SEUxbmFJMkY5ZkVq?=
 =?utf-8?B?K0Q0Nk5iRTFaTXcrOXEvWnkxUDVpT0xoY2VIckZnYjhrZVd4TmVwVEVFUVlQ?=
 =?utf-8?B?amJaS0RIbldrcC94anp2TUJKaThDWDhmRExVb2tOaTJxK0VUai85VmtoSkZs?=
 =?utf-8?B?TTJXQlN0NDcxUmNoT1Fha3dwM1NvMHRFcTMxa2UwQWFwSGtnMk9kUnVpTUhq?=
 =?utf-8?B?bWFLRTZkaGw1anhnMVRHUkJYQWl0Y2Y1RlJLQjRLOGlWV3U3eWQzbXprb2Fy?=
 =?utf-8?B?dWdqWkp2aVN1YmY3YmIzZEYwV2JwN3dIOG9JRytWZldBdDd2ZFZHRS94Zi9D?=
 =?utf-8?Q?Tf1UeAQdiJBj7nA1jFFAbgOMp38qeKd0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR10MB5638.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0VXaEhJQm9HN3AxWStIOEJWRUNCZ0lhNVhnUzB5UEVlT3dKZld2L3hNS3Y4?=
 =?utf-8?B?N3pWeTExV0tlVWxBNjI3cGY3bW5YTVdPbVd6QU4xUWxNenlJdGlzMnZBK1lV?=
 =?utf-8?B?MXJGTy85amdDM1QwOGhLbmx3QmRZNE5KSVM5MkFqTS9pUmJDU2RtN0pRQ2U4?=
 =?utf-8?B?YWU3djN5bXgzY0FyMlFSYmlvQmc2WTdNTHdMNjN1emswQzVheWJBemlPQ1cw?=
 =?utf-8?B?Ym16NWIwNVgycWVieTNYRE9IZnE5ZkRQWXJqVEhOZmhMek1mblpoT3dBQ0Rs?=
 =?utf-8?B?R2VESGRTKy8xMFowREg2Y2U4Q0ZOWkh4K0NINzNzalgwbWZHUVg4UUNiU056?=
 =?utf-8?B?dFBieXFTWkFDeG9tMlBvNlVDbSs2TWZNdE82VE5jVW5Xdjc3L0F0NG1KOVZ2?=
 =?utf-8?B?emFpMkhwc0tPLzd0ejFHMnljMkxVYzdGWHhRRzNTMTJ1anRTZ25SeWd2RGVC?=
 =?utf-8?B?TVZmSGs1SStNdGxlM1pwL1NiVktQN3doamVLcGtuWFBrR1dOaDdpTHZtVzBw?=
 =?utf-8?B?ZGNkWHVVOXorTWxwdGRUTDc4dThEWXZYazkzU2VxRU1PM0Z4ZDN2WGVENTJ3?=
 =?utf-8?B?RUlLaG92NjIrdE95VllYOGluSU1ET0tMbW0xYitkMmVQb0grdW5DSGhaSE9D?=
 =?utf-8?B?VWxQUHR2ajhJZTl4U0NWVUZmYTZuSTlVUHJkUUt3OXVGRkpjWjJkSG83SE5W?=
 =?utf-8?B?SS9qTXVTWVFEN2FST0oyc0lZNXg1MFRxcTlodXJBdnRDejRUVWs2K0wzT01S?=
 =?utf-8?B?bExNaHRoTTl5bFMyckw2U3hCbmhNUFRVR3UzQTE5QVZYQXRLdFBuNmJOMmFn?=
 =?utf-8?B?MUFaam1xQ0RDS2NaNzlTdTE5R2x3UUJva2MzcnJuK1I1cUc4aE9PUXM4QWR2?=
 =?utf-8?B?ZGJXaVRILzV4RFhhTUxsQlhlZldXd3hCQUNRblYxeU5JcmFjSklzVWRCKzQ0?=
 =?utf-8?B?Vll5enRzT1ovSHFVb0ZQaDJYM3RQNjNWM2FTZmJTaFhENEZLYnBvaFpaOTI5?=
 =?utf-8?B?TVdwenJ5emU0b3VXaUcxblYrOWptbit0YlU5TVViQWFRVjZPcjJXVmd1eGpv?=
 =?utf-8?B?R2FsdE1ma0ROT1hibUZSbGRwRHdTN2g0UFhWbHNuZDZwWWNLS1BUWGJUWkwz?=
 =?utf-8?B?N3Aram1DbW1MK25EaDdRZ25HYTlaeS9WaU1LSGtuSituL2c2TmJpVnM4Y2ZC?=
 =?utf-8?B?M3BXZGY0ekRwZjRMMzY0OGlyVENqSUF3bnN0Z0VNRFFidHBSOUJWUnI1OTlj?=
 =?utf-8?B?ZmNwWmVJaTk0RDIvMWdFMCtCTXUrWU9CN2FOaFp4YjhsSnhFeUdkaFVYaFFD?=
 =?utf-8?B?Q0F4M3Vib0ZKVDZEcnFqVVBKdi9NRXdKamxYdnNUWlNCTGF5L1RUSWZkUDU4?=
 =?utf-8?B?U2tvWkhDeituUVNkZkNFZ0g3L01mK2F3Q09sVnZqTmN5UWU4RE9heE85WENx?=
 =?utf-8?B?ZG55QVFLK2h4Zlc4cjI3dnBKMDRtMkROd3FXWGM5NE9XdE9UaDYwUTN6bk9Q?=
 =?utf-8?B?Q1Q2eTl6L2NLVnlhTkcrKytuY2t4dDM0RFpTM3E3K2QwZGU1M1k2WWduWUd2?=
 =?utf-8?B?MHMwTTMzcmh3OGlsMlB1SWM0bGZ3NnlrQW9lbkp0SHVJQitlUmlxSTZWQk90?=
 =?utf-8?B?Z2duTDUwT0NjSEdlQmdwWWtHYUNTWHY4Tlo2L2V1V1I2MmhYS2VjNW5DOThT?=
 =?utf-8?B?c0ozZHl2WDdLNXNVVlAyZ3BGWnNrcjF0WnZKeWUwL3N1eXFUMTJqNUE0QnFH?=
 =?utf-8?B?THkvaE16V1ZkSnU3SlRPc0F1TGZQa2tlRGJDWFdtQjhoNlpVTS82TW51U3BQ?=
 =?utf-8?B?TDlISng4NTQ4QzQ0M2JqU2phQ3RxTnpvQzlhNEJTc0VuL2dKcENrbWNzRnBm?=
 =?utf-8?B?a1BzZWdPR1FWV2lubExxdWVMV0M5MWRhRGNZSHpwVG5HTFV6N0tmN2FvY0tm?=
 =?utf-8?B?S2NwRUhrUWdmMXdJakVpVndDcHQra29EbHMyYnRzeXB4c0ZzQWN2M0dFVlJo?=
 =?utf-8?B?MzhIOXQ0QmdmbXZ3VFY4ZENibjVBWmtLRDBJWXhPSHVsR1dBdUhqN1FjM2xu?=
 =?utf-8?B?Y1dkYXBTMFpLdHRudkZnRmQ0dm4vRWpHOUFGVlpaT0E0ZWRMNnRpbGpYOTh3?=
 =?utf-8?Q?CnS5vyS2A6OxDZ4UGd13EqIBj?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AANCXbWlvqotd0aSAUPbZEKqKSHn5SiESWRDUMyn6doRVfpgZjOB9UWjXxU2Fn9t0EiySwaNOeYNqQoTV0Mr2Um3jfEuRCPViloHtqWBlVVBrIkAt7O61wqcNT8FK43O9rDleBEsiNDvPW8peOVl6AyP9KXHnmNILWon6vpdyQ8093KuGRlhb61+Vv7jvnERcFG3RYDsHHRzTtXA9lqfNLbSr0QtcfaeDsUmpN5LXnB9uWqubmq4tDuuK3RtmBAvReZSlzPpGscMNzuch8PXu76AV6QaPrfZiu8AvwY/ObTqjDutkBVjc6Ee3ZLAI61qFRGd8rQ+VE+RSaYQ2aPBk/6Fo9SNPQgYF9EubDdlUWr9TrPst5NEsJkwkdCqMl5box2rqD3EdBlWYv5+VLKx+N54GvjSDuczOMBwaX6BdBatpzAS9q7+D0/ZtuduWXccLvV5GIpEOzIQS/+LpGAAxB3eARstrHPOddLGfgYfk4UrdiOtFypgPqz5z4WOXWG02TgvhTxIASf+Bzt1csVF1YG+lisxVIbfx35q1AwZAhMlck/9KpwWXEVds/7w7E57hjHQpHGKrFHOsgCin7cCPZFDQU1fGdbCmaqb5xMTwNo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f69ed285-8396-4fa7-4e5e-08de1586b7bf
X-MS-Exchange-CrossTenant-AuthSource: SN4PR10MB5638.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 18:29:08.7367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pbQM+3+rwy1xpklRdEIx1dFaW0lP5+tWPjOiQdgfHuotGIu5/DxSZcYjJUMEiI+ptJ5NPugsI8vN1pjO/t0lnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6092
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510270171
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA1MiBTYWx0ZWRfX5qGy2T5D0W2J
 2XBnZrxSy6eke3UXsyVpaLfsWgn9+8xpF8vqyEH2xx6XU5l2+gJdUJtP+Zzn7ogUDrAutDzb5ya
 SL29z6ojbhBZeICnjdUv0bNly0Y2SakQEEz2wIKkgtVYjfOY3esNoNkC5cieueFpmYXh/MjOpoI
 +LsHMrTyoleRS7JFMxrjFTkNGNyPeGg9RRRozZX/sfXK6/irwjysuZTxvWwgnfoG8QFJsHOalLY
 Dozu2PFymFED7+A9BEh5hUM7n3ZNCexWCe+QMttG73VcdOGpri+y8tfbdb3HBp1QkYTs4FV/xSH
 TGQ/TYOKCECO2hD9+3lbHmpqcLA6cqCqZt7T3Dg9nhxC5cQg1FNeQF+I9yGDjKfi4idenQOArjm
 MqTvYpMZd9XLPro82YdZBrsLAFK8Fyz2w658UEdiQW+Lkyg5Tbo=
X-Proofpoint-GUID: fkDuaN-V6BX5TJbSmRvD5qWWEc2H1yxI
X-Proofpoint-ORIG-GUID: fkDuaN-V6BX5TJbSmRvD5qWWEc2H1yxI
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=68ffb9fa b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=qA9M1cZ2n3etD8doBXwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:13624

Sorry for the duplicate...  this already got sent out.

On 10/27/25 14:25, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
>
> Note that test/unittest/preprocessor/tst.predefined.sh checks that the
> __SUNW_D_VERSION preprocessor symbol is consistent with the "dtrace -vV"
> message, and both of them simply use the last entry of versions.list and
> therefore will be consistent for in-tree builds.
>
> When RPM packages are built from the .spec file, however, _DT_VERSION,
> used for the "dtrace -vV" "This is" message, comes from the .spec file.
>
> Append a 2.0.4 entry to versions.list.
>
> Remove the VERSION=%{version} from dtrace.spec build's make line, so
> that the version of the implementation is defined by the source code
> itself.  The version in the spec file should be only the version of the
> packaging.
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>   dtrace.spec             | 3 +--
>   libdtrace/versions.list | 1 +
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/dtrace.spec b/dtrace.spec
> index a4f3ed774..e94025472 100644
> --- a/dtrace.spec
> +++ b/dtrace.spec
> @@ -131,8 +131,7 @@ it always tests the installed DTrace.
>   %setup -q
>   
>   %build
> -make -j $(getconf _NPROCESSORS_ONLN) VERSION=%{version} \
> -	%{bpfc} %{maybe_use_fuse2}
> +make -j $(getconf _NPROCESSORS_ONLN) %{bpfc} %{maybe_use_fuse2}
>   
>   # Force off debuginfo splitting.  We have no debuginfo in dtrace proper,
>   # and the testsuite requires debuginfo for proper operation.
> diff --git a/libdtrace/versions.list b/libdtrace/versions.list
> index 8986d2007..8d858f0bd 100644
> --- a/libdtrace/versions.list
> +++ b/libdtrace/versions.list
> @@ -65,3 +65,4 @@
>   2.0.1	D API 2.0.1 Linux (BPF)
>   2.0.2	D API 2.0.2 Linux (BPF)
>   2.0.3	D API 2.0.3 Linux (BPF)
> +2.0.4	D API 2.0.4 Linux (BPF)
