Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359B61DA0E1
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761247954; cv=fail; b=lkzVPrBquYYd7w+Hw26+H4IQuy97QmoNJ0YyvYw7L//4y/be6dGnkmxeUXVSl8AnLdJlLIDcBCky1qSFng1TIQutfDihF9SmZJZ7mt5lvisvsxQ7LWG58EtXEkcCIlzLgZ50y8ahREfoNhydx2soIlrs+nL1/BKEh7XBq4S7QXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761247954; c=relaxed/simple;
	bh=lgleeMCuJQXueH4nGWwwi9YXn29RvGvk4pVzMruS3Lk=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mSOFn7Rlg803nc6IX+Xumbgmwh0xKAsxmVvQiJoBlgFDUDH2XYXiW6uq3lDYfRxhWtASC/upshXNCj5ZeNMld4jyrEzPVw+YUnQcODviIEDUnfMjoYWG+ZKuSry7Pj0KxiNgKSMhn0zH/p/6mBXtSKUnoDSCkR/pbyYYkQEY5/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IHICR9Fe; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LM7RcEem; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IHICR9Fe";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LM7RcEem"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NIBwOo007588
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:32:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=ozbzIWZz3wHPNabL+GECKe49lSpWMckRWeKGg5XQXLo=; b=
	IHICR9FejIH0ykSAlg0QR7uYhA3HRwZSmKOr44ZX6RUXcAOb0Eoj7tRA+c6YHcRf
	zWkbeoS9oImQ5kWvg0Is5ft5oOLxPfk9ijei/8Vmp3xy4hNe/9oW2lkUgqWWasP3
	AxiR18wNYRIevSnW4YnJ2tfEui3p5Tw2RSL0ozPIMmYfxNRfccv9M7leu3OX2ArS
	SZxkChEmSB3cVB5apneowjUeZikV4gNaJOlaXpFBSvn+MeBPWL3c52gQ2+ETIHJp
	ZpYU9tr77OTMPaAxfHDIUkruVZqY1Y/DTLgpr2ed+w8TdRYHThdh7Za9q8+CaiVc
	Qowl4nTmZIoO0m4ammeDFg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49xstykkkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:32:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59NHrrg7035776
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:32:30 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012043.outbound.protection.outlook.com [40.107.209.43])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bg1prf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:32:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eeXyX2Utq2ptkkhomxCdSY41zwtuM1YdnlQm0Lf5afDxzN9kw0juJuJbtJONPuA7HLHU5wIiQjaHHKpU/WoJxGJ6g6zNGI6CwQ6ZJwytPysc5MUKXJ63MJU/Zv67LNNsS9CVoJ03FNL1BjmAFJk78jkL6Wk1E+pD92i1GQfTfivNaxLIGRtEo/xm2Ds873STODL+0vCWXymSKLa97cC7yy0Wf03xamN9delSWkaSrrS+dHPNgmFu+2ia2GnZubwUA4WGSrEBIeohs5/kkoy6W5OZNsIysJtdzHnr3q3V7kkjLnM8CNhH9AgZSsPJx7kLIiHdmohzHp4TPedrQ7L5gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozbzIWZz3wHPNabL+GECKe49lSpWMckRWeKGg5XQXLo=;
 b=rbmTF6ee8yo52y4QwYevkIiVcRA5tRlTPmaOEOb054SkbVtBxa6rkgpFe1WAdT4CAZajrnUHdMlYzDuj8VnW74LBHQC4SnOJReirx3iat3qIlCQuJTSp1+atVThdz3RLZMmtfGssd41/evvIB2Ej7cMv23aZ6VdEnMOtPgwc8wPUniL26nmHcLT5xaNsc6fCJnpAMWUbqKuFA8weeZb1mT9puQ3E0+uGnvQaryr1d9EjI+EoJelkkOiicFM8IL7lxNcIq1juFYSP6LjYMoodyZh04K5hJJouOLblzf/Z7LOwjvEW8zaUMeHSPxp/mXJuBKG6bo5pmHUPCEvlgs5jXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozbzIWZz3wHPNabL+GECKe49lSpWMckRWeKGg5XQXLo=;
 b=LM7RcEemuY1gRubbO3+YiN2LCYTQ3sZjSbgwxD1nhUxkIH4IYN7lJT7JVzt9KDYp2BPZa5QPKgpSZv2gY+vYU2H893n9PVOTLRSpMhdFer5qy66mBxyhpSojEJYROp4LXqiTstXstQG7VktZKgrCTkqe3eyQB4GYtIaaZPHcgNU=
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by CO1PR10MB4467.namprd10.prod.outlook.com (2603:10b6:303:90::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 19:32:26 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%5]) with mapi id 15.20.9228.010; Thu, 23 Oct 2025
 19:32:26 +0000
Message-ID: <a4a843c8-7494-41f0-b561-27c577904f8b@oracle.com>
Date: Thu, 23 Oct 2025 13:32:23 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH v2 14/20] doc: Link to "Character Escape
 Sequences" table
To: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20251022032251.2010-1-eugene.loh@oracle.com>
 <20251022032251.2010-9-eugene.loh@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <20251022032251.2010-9-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYZPR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:930:89::29) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|CO1PR10MB4467:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ad305bb-3957-417b-20e9-08de126ae502
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QmRTb2YySXJiRkxnTHFGVlJadUorSlgzZVpLR3Q1Z05MMW9HaFloOWtZb3g2?=
 =?utf-8?B?WGUzaWV0VThXdHBBTmpPdWxhR2lma1pDSkE1Q0tkbGJvMVUwdmYvUDhCUFc3?=
 =?utf-8?B?TGVlYldZWlQ4bzNjM09QNUg1NGNEL1lXVE1mbnBJeGZkT0Y2SVdyQ2E4WVhT?=
 =?utf-8?B?WlJCWDdvNzNQSGl1bEduNHpJM0F2WVpoVnNOUXU5TCsvc0sxQm1LZ2dpZWdn?=
 =?utf-8?B?Mi9SZXk2eXFMQUR0TVllajFDSTZZVTRjTUROM3Qwc0RpalNmaUpsM3NGMlhW?=
 =?utf-8?B?OUFsc1lQeGdKRVFoQi9Nc1hYeUtwWXhqOEZvV0x0bWtneTQ0blU3UjdhRmty?=
 =?utf-8?B?VjVFMlE2bmk2azRtTmFLOHpKVVMvMWpMYldPeUk4MHB2Z2tKYkZLL0lFVU1J?=
 =?utf-8?B?bHUzVGlhVVJ5b3R1TkZqNUlZeTFHM3VkTG15S3MzT3ZTblc1SWt3enZKdjZX?=
 =?utf-8?B?UlE0WkdDZHdtK0JoS1lyTWRtY0FjQlhCSjNYSTdoQWFpRDJ6RGJLT0tocVUz?=
 =?utf-8?B?UHFmZGNFWFo2MmdmVzBlbWJwbFdBYnlyKy9jd1QyaVI1c25idUZwditnazJk?=
 =?utf-8?B?VmJGUndyZzN3dFhVbEFqV2NOcW1Oam9RQmd2TmMydVNXTEhsU1dZb0lrVlR3?=
 =?utf-8?B?YndORkNaQVQvZ2hyS0RleEFidC9QZk1IUXcvZ0tyZFgxRXFOOWI5aHJmZUNl?=
 =?utf-8?B?SVJ0WElnMHlacjBIZTVMelJ6RXZEaUZIMFMvL0ZZM0V3ZnBtTDdYOTBvQmNZ?=
 =?utf-8?B?Y2ZSbTJrclhoZlRTVmN3RXAzNDhUcUJRejQ3MU5STEVrVUIrQUtZb2dCc243?=
 =?utf-8?B?N1dqZDN2TG0xZmFZb3VpdCthUTNoZFZtRUcxKzJLY0c2ODFmWDUrK0hKMmh0?=
 =?utf-8?B?ekFnSFlDc3o4TnhaNVgxb2dsdE1oeXJPdnBPMzlxSUN3N0l0enJHRWIxbFJ5?=
 =?utf-8?B?cG5BWDI1MjFXN2FwcDRDbXRyNGRjUWlXMDBwUzhDcTF2T1BiMllXR2hvQWlX?=
 =?utf-8?B?TWZ5UXZSODZZdzVYQk8rTmxqS1cxaUt0M1JGS085RnNNeEh0eWpjT25DRWxE?=
 =?utf-8?B?ZTRjRDlCZktreEdob2p6Vlg0M0NONm9qcWY1dENETmxQVnB2NHVRN1EyY0No?=
 =?utf-8?B?Skc3eG5hRWUxbEdkZlY1VmRaNDE0Q2RtMStSWllrREppZ2hONTFUVXpQdi92?=
 =?utf-8?B?NWxJR1hvKy9Zd3JoQWsyNm01a0x5bUdNTEpNZkhVcWV0SDcwRCtVUldIQ3JK?=
 =?utf-8?B?WmtsbWlmUStRQytQQm9MemVUZEVpdHRpQmRMbEpiSXJqc1ZaWURtR3hqSHpF?=
 =?utf-8?B?SzNURmk3UVlKaGgzWVE1ZGE2TDFDYXZKbzhudFJGOC85a2V1LzNLWWhkREhr?=
 =?utf-8?B?RUlvTW1iNlU4VzlMbFh5YWdJQ1htYnVHVVB0VDB6NjUxQjBKK2ZiWEJ1a2Nx?=
 =?utf-8?B?SFFhMndwTDBvWWhiRFRrbVMzMzNLRkRLKzhsODV5eTdqYVVIWVBEU25LZ2JI?=
 =?utf-8?B?UnpFMkFiRW8zOGFZUDZqM2poaEdXcTZMRlY1Zjl0WHQ5ZDJuTVlVeHYrWXpK?=
 =?utf-8?B?ZzNmbWJkTERSSGxtbmZqaE8xb09TY0l3bTd5Q3JtQjNYeXBZd2dmNUpEajh4?=
 =?utf-8?B?Tk1JQ3RHNUxVK3NJZGorWkFPN2dISGJvYUxJQTdoNndUbFR1c2gvWHJrK3E2?=
 =?utf-8?B?Q0hweG5UMzdUYWdVcUg2UmE3Lzh6UTFveE9EQlk1cW9mazl3Y2R0dllxRy84?=
 =?utf-8?B?b2hDQTNyS2x5ZEhBMU9OUDZranRRMjZXZDV5WnRvTkhNdmtXRFhVUUtRbVdP?=
 =?utf-8?B?THZoeEJ0WlRDc0gwZlV0cFhDVmlGM21jTTJsTWxBZ3kzaENCV3lVSEM2dVBl?=
 =?utf-8?B?dk5MOCt2MXRpRmZSN3V6eXRrSEZwMjRqb29hb3p2TmhSaXhNaHVmUlQwbzU4?=
 =?utf-8?Q?5qMPq8B03eqJ8LB0gB/L1AeGv+3XI7k3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UU9FbVVsNkJVMnhid1QzMjMwOFk3dmhHWWJ5YVdpejlVc21rQXpsT24xZjBN?=
 =?utf-8?B?TzBYQ1FodkoxUUhhbjVud3h1blNDSnRiOHh1M3NWNjFvQlVOdGJ0bStuUSs4?=
 =?utf-8?B?cVNQWjlPUm9QTHRrMVhXR0hXV3ROOUpHZk56WVZXZlg3eUZwOEJxZEpMOFBa?=
 =?utf-8?B?bjloV2NTaGh4Ymx3MGZ3QTRkTlJRS0VzWXl3TXVPN0dUcklYcHlqMWVQZmwz?=
 =?utf-8?B?cWVya0JGbWRBYkdncFpNL0txRW5KWWovclE4dU5mU1Fad25MU2NOWHEwZ0RQ?=
 =?utf-8?B?cFpaMWJrWWwvSlNZOWdOVkxCRkUzWUJRQVFSZ0luNEVKSG13QjlhQ1ZMc1Av?=
 =?utf-8?B?RW9kbDRlblJnMzV4V1R4N3F3aHdIQXJTSVBSZUdmZXFHZldLMmdGNTBuU0do?=
 =?utf-8?B?REwwTnJQaFpZdlVYdWZSREo5ZHBDS0EzUVI2TE1RMG40OUtvU1B4MHJYUU9y?=
 =?utf-8?B?dGl4RTdlUC9kOXNud3dMazV4c2UvbFRNODU5cDE5bkZjWm5zOUtDY2VocCto?=
 =?utf-8?B?ck5CM0NubUQrRFFOLytqOXVTUmNtYlNhQ0UzUmVvZ0FIWnp2cVhmTGt5VkNV?=
 =?utf-8?B?aE9xcW96eVFLWmY4T1dNZFU1Q2V4QjBMbld5c3FSZ0J0aG0zNDI2dHBjbkNl?=
 =?utf-8?B?Z1lXTmtyM0l3L3A4aE1FcWk2M2JEOU05MTRIK3pqMzBCOHN2dlQvQ2RZZnhM?=
 =?utf-8?B?MkVuT2tpc1pZRlVKNkRtd0JpbUZZYWRaV0J0K2w3Q1pLN3laUTArTGx1Kzdn?=
 =?utf-8?B?MFhMMHU2MlcxYUNSQkwyUHY2Q1F3alpkbkhacHArN0l0ZVhBS0xQMzFqT0x0?=
 =?utf-8?B?NHVKeGgxWUpXb3ppcHFiSE94bjJURmhsY2RUZmtGR2FTN0lzMHozbFZ3MnZv?=
 =?utf-8?B?TzFHMENqNXo4Vmd5SjAzMVlrK0VDOTNXS2ZxdkFpNlBQWFNWN3dxMWVRZTBy?=
 =?utf-8?B?TlIvY1dtZE1GcXMzT2NkVGlFeExRVWJUcnN1NUM5WDZsS3JnaXBCem1QdGdB?=
 =?utf-8?B?SzBrVEVPdXNvWW9KVDFXejcvVmRNUWRTK3U5TlFJK0hVN21wbDhxWHRGa3VF?=
 =?utf-8?B?Q09SRzQ5dUJuT2xGRXc5MGF0azRUaDBCcUFvNkJKejRNejY1TkoyUXB1UE9I?=
 =?utf-8?B?Q3RzOGIyelRkUzlRVlRlak9jbGo2SDg0UVdoa1RudXBrdEZxM25IL0ZRd2pu?=
 =?utf-8?B?MmhXZEFhTCtjbFNOOGNESUxaUWxrNHZSYmpuSnhkTWZ0K1c4VWVMV3dWT1Rm?=
 =?utf-8?B?MktPcmdIRDUwTDdKQTV0NWsvWi9LVkZ5aTBPNTYwOVJpUi9DZnUwZUtzMDIx?=
 =?utf-8?B?S3ppTmRpN2h3TldpL285NCs5U2xud3d2aCttQjJPbnppNlVoUWJuTzMvTk9Q?=
 =?utf-8?B?WEZvcllaQ2J3K3Jtb0ZPL0NTeFlpejA5OGI4QkVXSmtSZ2hUblhOb1l3NHVn?=
 =?utf-8?B?dnVEZktRNjMrSE1rZjhGY1BUeEt2dmJTeEtKb1FZaDdWNGdCSXdLTUg0dXhh?=
 =?utf-8?B?amVBd2VqckFMQmFvSjhiQmlLWVNxRlFSbGxFV0U3ZDdQUkVURGRlcFlKRmpJ?=
 =?utf-8?B?eU1UU1ZUYXV5SkRSOFBoeXdYZkc0emRiU2dTcE5vc0tKZytZbE5scW1ieEwz?=
 =?utf-8?B?em4wcEtpVXNuLy9GVkFDNzg1TVBVREtPdlFWTk1oU0w0aWVQU0daOWdPWTBF?=
 =?utf-8?B?dW9Pdm0ySDduWHgrQ2RNTmNYUWdxQlBhTEhiUGJUZmlhMVpvd1NHSlRvdGVk?=
 =?utf-8?B?Mm5jclI4cG96c3dxWGJxK0dtMEw5MXpMOHZNckNqRnZEVGhhRHg2OUNCSkxS?=
 =?utf-8?B?dFcxTStoQ3FhMG12aXFJSWhsbmFFZ2s0czNKaytBb2xGNDFsNEFlakxJUkxX?=
 =?utf-8?B?QzQ4VkVSQVhlS2hvN3hMQ3NGTFNaTnBOSllabWJmc3Z4NnNITzJrMWs3cjQ4?=
 =?utf-8?B?N3YyODJwS2c3TkNXQnNOWUpSRDhTd1VGY2h1U05PWUVRU3Yyb1kzOTJ5bGNL?=
 =?utf-8?B?OVg4NzI1OTF0UG5JbVNlQ2VTMVYrVzAwRDVOcU1PMjVBSWlUSHBGMWp4UGdD?=
 =?utf-8?B?ckVJbUxibCtPTkYwTHlqWHhHem01WDJIUkM1Q1ptaVp0TDVOTTlCZzl0UXQz?=
 =?utf-8?B?c29iNDBGdG9kTDBHZVFjZDFzUVdUcHhzbVhqbEovU1IyVklibGpldmtOUHN5?=
 =?utf-8?Q?th8jjzWZnKTceUzgWnE9jC8=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GSO5672D7a2zQzmcF6DyPA3gz6p1/H4ix28DOBuZI1R5juBFvtTCRokgXI54yI/d9tSAXtkTSme1VHN9fJ9JI+V/0nW/rfl71q02vSAjUNn56uep6rpJx2f48omTdlPNuOFDfBphHH9Aq0rCNAm0Ok8GWGBclP4TUeM8VPl4JrBJUMrZ0XVGor2O9XEG0pVab6tYsaB8FrP4dTly1T825Z3gS6nE+1Cg2SLc5XHHqsJYLami52k0Qn7p+wnPgbp1DzJ7QbR/tpNhxjGjtxIRMAFYH/YGdkMcSAgcJKvMAuP2ERv3HU4ccfHAPDjIHE0mWWvl25pxduMo8fN10fN7qUPCNpHOp7h9oyxafqEomHUMFA4aajzpQcPeY/FCQdOOUW9ww1rAo+orDJHsOzEPnpGZJwnLZCUUOMKYHHYXlrFr4WmZZLTlZlPahZ7hRRgTiTf5uz8jaobH2wUNpJbBOT5uNYZwa/BMjdQ8PJTQfe/OLVl+F9GULdksYAbpJd3Ep9/TXgdf31jgKCcaf0bsLaUQtBI9YDSJ60BCZ88MosMv4CTOYBQ+p4enYkwvkOQyfuDxVHeJ9nhzfALKOpxmRIXtrOUxxNbbdSSPW4hurDk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad305bb-3957-417b-20e9-08de126ae502
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 19:32:26.0822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BeCs/TI/wHUvGkvlZSjZq+D82mf8muRegQLNX14Lb1LujIAfhi5+a4dUxLtg8T0YJ5JvBZUF9DuxKxxokvr2RSyLDj1NmZsEsNIQVQi64D4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4467
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510230178
X-Proofpoint-GUID: Zv3cz4_VIJ9LDwkExwVndZTSlmNMzF52
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA1MCBTYWx0ZWRfX+VeWVKweK4IA
 ad+mWVV0VR0Hpr6YyE09RxeGp6/zp905WtcYuLD3Kuo5d1cSZ15boNInqGR9FaT8RYligQdXzVH
 pyEkulHCGihce3NppsL+3nFQYEl9RhBnPskl6RJAGIfOg3ms2o6rotuaJMn/ZA7UaVN5fPphVoy
 Aa4IPWHDrmOfGf4IGEMPZnC9Hf+IESpAU/8/bKW1moiq1jl8EAU5IfoC1mmLO7fzxlWDqPDvA2x
 mDj2y6Gz7Kh2lFDlG4PNiboFgu8smye5urdJtIjJcmBb1ILJR5Fyv2jNLOlsWgQtaXvB0bKIaUj
 ibfc02SUg7ylSkCYp3GDCoPXI7rsO/w7r02vRCgMJmnXtUqh0HWJPwjmGC/L+Hn8/iovK8NDqJU
 Xi1CQGy8Mo+lq45iX7y30baY9CETzPM5NcWCropdSQlwuzIqi7I=
X-Authority-Analysis: v=2.4 cv=OdeVzxTY c=1 sm=1 tr=0 ts=68fa82cf b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=aP3iKj1vRsiEQGyfWqAA:9 a=pygEKjHW9yQeKNym:21
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12091
X-Proofpoint-ORIG-GUID: Zv3cz4_VIJ9LDwkExwVndZTSlmNMzF52


Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


On 10/21/25 9:22 PM, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> A link to this table did not work since it referenced an ID that did not
> exist.  Add an anchor ID by the table and use it.
> 
> While we're at it, convert the table from HTML to Markdown and break up
> some longer lines, improving readability and maintainability of the
> Markdown source file.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  ...dtrace-ref-TypesOperatorsandExpressions.md | 140 ++----------------
>  .../dtrace_builtin_variable_reference.md      |  11 +-
>  2 files changed, 20 insertions(+), 131 deletions(-)
> 
> diff --git a/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md b/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
> index c76d293c7..bb1c49949 100644
> --- a/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
> +++ b/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
> @@ -474,135 +474,18 @@ D type
>  </td></tr><tbody></table>
>  Character constants are written as a single character or escape sequence that's inside a pair of single quotes \(`'a'`\). Character constants are assigned the `int` type rather than `char` and are equivalent to an integer constant with a value that's determined by that character's value in the ASCII character set. See the `ascii(7)` manual page for a list of characters and their values. You can also use any of the special escape sequences that are listed in the following table. D uses the same escape sequences as those found in ANSI C.
>  
> -<table><thead><tr><th>
> -
> -Escape Sequence
> -
> -</th><th>
> -
> -Represents
> -
> -</th><th>
> -
> -Escape Sequence
> -
> -</th><th>
> -
> -Represents
> -
> -</th></tr></thead><tbody><tr><td>
> -
> -`\a`
> -
> -</td><td>
> -
> -alert
> -
> -</td><td>
> -
> -`\\`
> -
> -</td><td>
> -
> -backslash
> -
> -</td></tr><tr><td>
> -
> -`\b`
> -
> -</td><td>
> -
> -backspace
> -
> -</td><td>
> -
> -`\?`
> -
> -</td><td>
> -
> -question mark
> -
> -</td></tr><tr><td>
> -
> -`\f`
> -
> -</td><td>
> -
> -form feed
> -
> -</td><td>
> -
> -`\'`
> -
> -</td><td>
> -
> -single quote
> -
> -</td></tr><tr><td>
> +**Table:**  Character Escape Sequences<a id="char_esc_seqs">
> +
> +| Escape Sequence | Represents      |     | Escape Sequence | Represents               |
> +| :---            | :---            | --- | :---            | :---                     |
> +| `\a`            | alert           |     | `\\`            | backslash                |
> +| `\b`            | backspace       |     | `\?`            | question mark            |
> +| `\f`            | form feed       |     | `\'`            | single quote             |
> +| `\n`            | newline         |     | `\"`            | double quote             |
> +| `\r`            | carriage return |     | `\0`*oo*        | octal value 0*oo*        |
> +| `\t`            | horizontal tab  |     | `\x`*hh*        | hexadecimal value 0x*hh* |
> +| `\v`            | vertical tab    |     | `\0`            | null character           |
>  
> -`\n`
> -
> -</td><td>
> -
> -newline
> -
> -</td><td>
> -
> -`\"`
> -
> -</td><td>
> -
> -double quote
> -
> -</td></tr><tr><td>
> -
> -`\r`
> -
> -</td><td>
> -
> -carriage return
> -
> -</td><td>
> -
> -`\0*oo*`
> -
> -</td><td>
> -
> -octal value 0*oo*
> -
> -</td></tr><tr><td>
> -
> -`\t`
> -
> -</td><td>
> -
> -horizontal tab
> -
> -</td><td>
> -
> -`\x*hh*`
> -
> -</td><td>
> -
> -hexadecimal value 0x*hh*
> -
> -</td></tr><tr><td>
> -
> -`\v`
> -
> -</td><td>
> -
> -vertical tab
> -
> -</td><td>
> -
> -`\0`
> -
> -</td><td>
> -
> -null character
> -
> -</td></tr><tbody></table>
>  You can include more than one character specifier inside single quotes to create integers with individual bytes that are initialized according to the corresponding character specifiers. The bytes are read left-to-right from a character constant and assigned to the resulting integer in the order corresponding to the native endianness of the operating environment. Up to eight character specifiers can be included in a single character constant.
>  
>  Strings constants of any length can be composed by enclosing them in a pair of double quotes \(`"hello"`\). A string constant can't contain a literal newline character. To create strings containing newlines, use the `\n` escape sequence instead of a literal newline. String constants can contain any of the special character escape sequences that are shown for character constants before. Similar to ANSI C, strings are represented as arrays of characters that end with a null character \(`\0`\) that's implicitly added to each string constant you declare. String constants are assigned the special D type `string`. The D compiler provides a set of special features for comparing and tracing character arrays that are declared as strings.
> @@ -1407,4 +1290,3 @@ The D type namespace is initially populated with the D type intrinsics, such as
>  When the D compiler encounters a type declaration that doesn't specify an explicit namespace using the back quote operator, the compiler searches the set of active type namespaces to find a match by using the specified type name. The C namespace is always searched first, followed by the D namespace. If the type name isn't found in either the C or D namespace, the type namespaces of the active kernel modules are searched in load address order, which doesn't guarantee any ordering properties among the loadable modules. To avoid type name conflicts with other kernel modules, use the scoping operator when accessing types that are defined in loadable kernel modules.
>  
>  The D compiler uses the compressed ANSI C debugging information that's provided with the core Linux kernel modules to access the types that are associated with the OS source code, without the need to access the corresponding C include files. Note that this symbolic debugging information might not be available for all kernel modules on the system. The D compiler reports an error if you try to access a type within the namespace of a module that lacks the compressed C debugging information that's intended for use with DTrace.
> -
> diff --git a/doc/userguide/reference/dtrace_builtin_variable_reference.md b/doc/userguide/reference/dtrace_builtin_variable_reference.md
> index 787137929..aecd2308c 100644
> --- a/doc/userguide/reference/dtrace_builtin_variable_reference.md
> +++ b/doc/userguide/reference/dtrace_builtin_variable_reference.md
> @@ -221,7 +221,15 @@ The macro argument values must match the form of an integer, identifier, or stri
>  sudo ./foo '"a string argument"'
>  ```
>  
> -If you want D macro arguments to be interpreted as string tokens, even if they match the form of an integer or identifier, prefix the macro variable or argument name with two leading dollar signs, for example, `$$1`, which forces the D compiler to interpret the argument value as if it were a string surrounded by double quotes. All the usual D string escape sequences, per [Table 5](dtrace-ref-TypesOperatorsandExpressions.md#dt_t6_dlang), are expanded inside any string macro arguments, regardless of whether they're referenced by using the `$arg` or `$$arg` form of the macro. If the `defaultargs` option is set, unspecified arguments that are referenced with the `$$arg` form have the value of the empty string \(`""`\).
> +If you want D macro arguments to be interpreted as string tokens,
> +even if they match the form of an integer or identifier,
> +prefix the macro variable or argument name with two leading dollar signs,
> +for example, `$$1`, which forces the D compiler to interpret the argument value as if it were a string surrounded by double quotes.
> +All the usual D string escape sequences, in the table of [Character Escape Sequences](dtrace-ref-TypesOperatorsandExpressions.md#char_esc_seqs),
> +are expanded inside any string macro arguments,
> +regardless of whether they're referenced by using the `$arg` or `$$arg` form of the macro.
> +If the `defaultargs` option is set,
> +unspecified arguments that are referenced with the `$$arg` form have the value of the empty string \(`""`\).
>  
>  ### Target Process ID
>  
> @@ -474,4 +482,3 @@ int64_t walltimestamp
>  ```
>  
>  The built-in variable `walltimestamp` references the current number of nanoseconds since 00:00 Universal Coordinated Time, January 1, 1970.
> -

