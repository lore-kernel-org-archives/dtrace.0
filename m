Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8D5136327
	for <dtrace@lists.linux.dev>; Fri,  2 Aug 2024 17:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722619699; cv=fail; b=oyCtMGTIexIe/PM6tWqtY3t0DvJHZ8ZcPlGah2LODtI0W6dXhOBDl09BL4xLoHyAGVTP49uuN4R4wHaUUSxkxKa3gOMX4NITpajxP4srldsjmIxH3YCZpUrNswObFmrHxiti1gU7rT2VgbQ3o+aD00CFk/gWpw76PSB2enElxHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722619699; c=relaxed/simple;
	bh=XCr0f6TgbxMQzAuPLC+p48kjVcGTaqLnbP/scLSH/+8=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cOWRgPRiO524I1NQfY0kAn8b/QCQzfety74tOfSk/xQNhPjcOo/oUnp5Iy6KuTGNuQZ+TnOecfHWz0rRMgizXqOKNZklpWzoK+XOdnhfrsVWHoZ788KG3BksA//t7tB6iTGwIm/LoRmGwZMOv6VUw0wD6a0GZM6yGVDNROJ4hIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RBe1rg2F; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KWPZAwJL; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RBe1rg2F";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KWPZAwJL"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 472GtWTP028620
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 17:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=58KONTewu6c1hHi9CuolcK/byGK5luMmzp+fTxWLwts=; b=
	RBe1rg2FznnLJXE2eEVE1ALVf9RtD67xcauHF1TrdBzIIGWuuxrQ8jkDXAbFS6C3
	rGIgq+50FqsU95FTJmI22w7HJjYI1pQoFvEyQBvCs8i0kRq9r3U5sp3L5wYtNlJ4
	ZIxBII5/tqSTPqNd4Rxk6Ons+nYtLr9xBzWAhz8l8hDdERdj7Yy52FjmoGgzYNDA
	P/eNG5WZq2C2EOdFly+1LCzRfWt1d0ZrynIQFpNB7XkqWKJ+uskmVoPi1KW2Tb0f
	6kAMCwUNbczMuekg3/PY8F4d3QcbmHj67vgjjj9IbCyIiDcJCubVeO1B0FYUZ49k
	WC19nQQHD2I1icHePu+MeA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40rje1hp96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 17:28:16 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 472HEIhE037867
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 17:28:14 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40qmpunkqq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 17:28:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eYcsxwrguwG7yeTU2dbYPUvshYJbfcN5VubqoL6sSloLzIwmuoo4w/x0A3DfD9WX19Q5Ejm8hTCf6n2NXXgUsZqrCYFXpLQvd7hNIfOtBSAjVG3bjNquiF53XnMyqBHzSfbEMJZe1ju2IZ5EfUhe1vNuz4XLInP0wjGQpImQ3lnQ5uiPHyDHJ9pCze88olpIL3zT28UgrT8J7VM/JkRTXwm5ZXMJM2zi2WLazaGRHs6OeFVLz9L+YoqQoL29WiFOMaNfQ+FKQZyoiT1MUjXsELKEWVpLVEYGsLE5vaw+5HYVz0HsMdJ5xpqehUrwsGVMwEaZEjNXJ6cAaXE+nVm14A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58KONTewu6c1hHi9CuolcK/byGK5luMmzp+fTxWLwts=;
 b=xSG5RG6GujLJABAL1pkoJPaSr5socTy+UYSFhOBwxIAqVEy099KHp4t3th6Xzbg+jV40sCucQKcUSy6/CKuypdkFJ5/Vjcx8+3QBHnZTkuHeNcp6ExFoVCR5g3HRid7+wXZJSo2P1YTFLoXfpBGFIRgDRKv/+pZvdgvv2YOSJLwvqn62zKz22uXhhV5Cme9PO9mn5b/4ds51u9TvxOkjRfTz/lQAuWC3J9j01HLo8BoHRu++QJNWcb6CM/PV9KJVLZNT+j+coqUeQ31Pf5GOzQcAAbL7ntpo4WQMUwguHm1KhOMmy10fiGkbfwupl433aTw4laaw9Nf419i8bo2G+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58KONTewu6c1hHi9CuolcK/byGK5luMmzp+fTxWLwts=;
 b=KWPZAwJL1koqdBr4giEykOlYhaDQtc+/NLQ+gvm77zPtTMoq6gXOOo6wgmzXwiirHPbQi1NYiDUDf/KtUA5q9n6t7RE03HqqXHPbZSO++WRJTX5Rq5/rk46NJBGmuJZvpQF9okL71afb07DqGuqEv43GC8ukKU3OWzD+DIRTgfU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6200.namprd10.prod.outlook.com (2603:10b6:8:c0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.33; Fri, 2 Aug
 2024 17:28:11 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.7828.023; Fri, 2 Aug 2024
 17:28:11 +0000
Message-ID: <bb6b2e21-83a6-461d-2c5b-0bf66f17774c@oracle.com>
Date: Fri, 2 Aug 2024 13:28:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] test: fix another use of a kernel variable
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <PH8PR10MB62929228334CB595A1B855B6C2B32@PH8PR10MB6292.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <PH8PR10MB62929228334CB595A1B855B6C2B32@PH8PR10MB6292.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:a03:255::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6200:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ec71dab-ce04-4475-3064-08dcb3187b76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?anpQYVNDRjlzYUJOQjVzVndZb3U2eklUcW5HMkJTUWZINUpVTWtBbXRKckdC?=
 =?utf-8?B?Z0U0SGROZE5Tb1loOU1LM0RIa0pBWkFOWGdTK3kxNElMSEtsQ2w1WXJEQk9t?=
 =?utf-8?B?UTZuZVlDQjlCOWVmTjUyQTJDMmtibXVJTTlGc0h3ZUEreE5DTWw3elNqYTZj?=
 =?utf-8?B?TWx6Ui84M0hHOSswSFhnd2pPdmdBUDZCTEJpbkppZnhYb3dkejRhc0RwUTVk?=
 =?utf-8?B?YU1DaDVtOThGdjZ0VzFzZkpmK01iaHQ1ZkxJbk9BejBzUzdWUmtWQWg4WXBp?=
 =?utf-8?B?YjNreXFqdHNPcVREczhxV3R0U0FJMmNBRmxoWGt6YlBJc0xBdjk4QTZGdXJp?=
 =?utf-8?B?ZEJBTGk5dWVFOEsvWVNHQUdnSDYwRW0rUzQ1RWVqanVnYmcyV2RxWDRQQjlz?=
 =?utf-8?B?ZmtiaFk5QVhQblcyWmJEay90cWVHa0RpZmgzQ2tCRVNlVXpGdXdiWnIwNmdY?=
 =?utf-8?B?dllzajNEWnFWMzBHQ21CeWVEbGU5YTV0a2Ruek16eGVKV05jcWNLcHRJcVJK?=
 =?utf-8?B?ekc4ajNTRi8zNk5kK1FtL2lHRlRCeDhBWHEybmo5Nk0rSmtweVpHMFBxOWdD?=
 =?utf-8?B?Tnd3dE5pT3RFTG9PMmRGNTZud05UMThlZFZpTGpmMWFKUzAxV2FKNzgvazBP?=
 =?utf-8?B?VVVBdlhHZG5hRW1QbndBeVZUSGxpQXFiNVpEa1R5Ym11TkdoWFFIRjUvTHZX?=
 =?utf-8?B?bDJxTzEzWDhvaFBPdE5wQndpZ0JDRmI4RDBWcDBSeUlMWkFDMnJMQVdzSGNo?=
 =?utf-8?B?bkdYUFcvU0pjU2k4cEp0L2ZhQ2d3VjZjSEo1TnE2aUd6cTlCL0VPbGowb3Mw?=
 =?utf-8?B?SndUd1hnZlF0QUxFeWczbVFHVHVBYkMwZGcwVlp3RXM0NGVNb29Xb1NQQjBT?=
 =?utf-8?B?dG5PNXcxNkN3WXhSQzFrYTBKZUsxRi84bmQ0NjFDSzNmRmhIRm9Ka01MZ2du?=
 =?utf-8?B?VjNlMm9SMlFEK0pxNlROQlVRT2Z3WHJ0bkpEUDZHemNSaURtZFdjRkJNN2Ja?=
 =?utf-8?B?bGkrek5IZ0xpbFA5L2ZObUJaZEtiQUVsOUdJSGc4YVJuSXFaSTF1cUVGRmV5?=
 =?utf-8?B?MlJ1TDVHWkhkSFVQeUw0Wlp4SUtnY1prR0RNdHJzZzd3RzdTd0pucXlpdzVn?=
 =?utf-8?B?YnN0YVhIQTBHdHpiYXRzV2dGa1huTmVobndUOCtCM2dYOFB5TFMyZHN4b2ZK?=
 =?utf-8?B?OFNCcE5yeHFFZ0g4eks5Rlphdzg0SVhTY1BNSTFiTXgxSEJqTUlMcmpuYWlI?=
 =?utf-8?B?NHlwM2xvb2Eza1JxeGhJSnIwV1d5L3Z3S3Z4UlJ3S1VaK1RsT1VER0U5Vytv?=
 =?utf-8?B?cW9PNGNvRnROWmF5ZlBBTjVmQlIrcVVpb2ZNSnc1WCtUZzFPNWJjWHVaWTlO?=
 =?utf-8?B?R21zYjlURXVpZVd3QlNkalZSaFVmK3Z4bzJ6ckg4ZDZVWFVEOC9zcVVtNmRz?=
 =?utf-8?B?V1RyelVPTkJhWkR2WFVDTUVUNTJudXRNVUdiWFJTT3VUSmVXdC9TeThyVUtu?=
 =?utf-8?B?WWhLZTgrSURpZVVBVjB2c3VrWXc2OWdzRUh3UjBtMGFLV2x2dEQzZXBLQWVx?=
 =?utf-8?B?dm54UVlEOFdMaFlLQ0I1cEpIdmhGRGtzbHZXbXZCTHBiWXhtTXZsYUlWNmJI?=
 =?utf-8?B?UUFRSmNTM0xPMzAvNGNiYjB4NUMzZHc3UUJPL2lPZ005azhTUnlzUHdHTXdS?=
 =?utf-8?B?YXJTZjBBclN0SStpdFZmVFZxd2lxdytHUUtocVpLemxZWkJLU29Dd0l0bUpG?=
 =?utf-8?B?dDVtQ3B6U2lvR1c4OHZuV1JFYWJYVlNvYVg3bTNmT0FNUjl6SkxtNVZWY0k4?=
 =?utf-8?Q?mKMldWDlyOpjM01qfX9k7w4hKZhDDtdVFgpAg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHVsY09tL0dTK0NQMkx4QTBSWUthR1BtdFhVc1I5MElNTzNQNkxiSnU0bVJP?=
 =?utf-8?B?RkpqSjlIY0VjTUNwdTJyOUdiOVBPSzdTNnJzN3kyK2Ira0d4dE4rdmtGTWlv?=
 =?utf-8?B?WE5OWlBDYnptKy9LOENmTFRsMUw0dWpQNWUveHlpY2tUNnE0THFNL1ZEbjJZ?=
 =?utf-8?B?b0hScFpaSld1V3h1eklNdEF5NzB6b3cvNEJwUmVrZEFKd01uV3JpQXNxN3dz?=
 =?utf-8?B?WTZBYUVSS1VCRFpPK2QzM3JsNGdKMStjUW9id0V1L1hCYXZuSVJpRnZaeThV?=
 =?utf-8?B?QlU2cjhxdmg5THNTNU5IcitrL0Y3S2E2QWYwMXdmc0ZIUFFvdWo0bTFXL3Iw?=
 =?utf-8?B?SzNJOEJwMlI2UUgycmhjdXU3SzZPMnJBcUtGM01iUm9pOFFCM0xDWElzL25x?=
 =?utf-8?B?cTd6bGVRckFGODU3dHczL1Njc0YrK0FxakJRT1c0MEdxWDAwVmFuRXEwQW01?=
 =?utf-8?B?UFJTaGcxVUUyL1BaRlZZcUx2MjkxaGo3TytyajBic3I5a2tGR3pWRjZhS0Nx?=
 =?utf-8?B?L3hjTlhhN0ppakdmc2hmNVJoN05Nam5NZWNENkFzNG0xQWZpaDg1RTVEV293?=
 =?utf-8?B?VmI0VXZRY3RXYkNONTBSZG1mOG9iZFM0ZEdiYk10YkgwWTdkQVNmc0t0TnU3?=
 =?utf-8?B?aXhIaDBjMmxZNE9qdGZjRG50WEdaSUprdlVaakxWYVRsWllFSVhwY0NsbHly?=
 =?utf-8?B?bktBN1RTWlNTY3pBcncxSnVlMFVSRFk2dXN6SlBIL0JlYmprZ0VaTlJ6djRk?=
 =?utf-8?B?LzZ5RXI2VFRBdTVMcGZaeEVGSmgvOVRGNnJHeE1vS0pXUEJTOWtHQm52WEx6?=
 =?utf-8?B?ZnlPZE12R0h0cEppcjFmYkxwR0RRM2Npa0gxUGFKTFdqM3gxenJJQVNYbTUy?=
 =?utf-8?B?WlhHS2pmMzBYVGhSVFJiWVU2K1pyYVVJNkZVNTVEZUVWTmxudEZ5elBkQ3VI?=
 =?utf-8?B?bEpzcFJEaENCZVFFcUVZWWhiNi9xcUpnQXdxS3VSTlZab0p3dnBFZERCM2xS?=
 =?utf-8?B?VDV0QlRHV2NaeC9xUCtWVllUblorNnQ2Qnl3YzM0RDkxemZBM1R6czB2UnVU?=
 =?utf-8?B?eFdYNHZTZmxTTzdCc2p5WTVhQXduVGJHNVY3WTdDVlJ2bTF5eG5PSW1VL1Fl?=
 =?utf-8?B?clpzWmdsdFpsMDd5cjR0K1ZyR0RISzV6NStnTFF6bHhqMk9xb09xZ0pPd3Bn?=
 =?utf-8?B?TXNlUG1vNGZrbWlMY2pxZUVVS3VNU0RvcC9pNHUzdWgvMjhvZWRVd21qOXJr?=
 =?utf-8?B?TXdrb0NtK0ZpVldxeDV6blhLWWVKYUdEVVBGcXhSdUlHdys2ajlReDBEYTly?=
 =?utf-8?B?Z1JHN0lQNU9mT3BIY2hSOE5zRzU0MDFTNG04ZnZHSGVGdkRMZHNGOTlUM2Vn?=
 =?utf-8?B?NURuKzdQVDZuSkxTTGZOZ0lCTjU5Y2h3WTdsVmFxOTFvZWxsQnFRNHhwYlRU?=
 =?utf-8?B?WUIzb2NqeHRZSTh2RmJKZlh6Y1dMM0tUU29qUGZsT1V0VGRkczkyL05lRUcz?=
 =?utf-8?B?Y0tRMVpqcUhLY3ptTU5mZUhnNWNmMTlhelZiTU9lUlhneC9iR1JkdFo4N0c5?=
 =?utf-8?B?aGliNjIxSyt0VVA0N1NSMkYwei9MLzBtcWtRcjh0cllYR3dMOHlqNm1uODNi?=
 =?utf-8?B?U2lqNTYzVi9ibnhrR1J4RG1mS3J2cEloOXlxVkwyeUJabVZyV0pwQTlqck1D?=
 =?utf-8?B?SEhuWkRFNmRsc1dVaWxQSk0rbklnZTNDSk9zUXJFdjVNVXprSm9XMlZhdUFF?=
 =?utf-8?B?WFVsQjR0N0s4cjIzVFJlSnlraVh5R0RmSTZlYWd5OXBJdHdqUDRLMHVWOVls?=
 =?utf-8?B?eld0aERJVEp4MDAwS0hrN3Fjb3h0ZkhmZkJGUXF1STEvU0NUTExLbmZ6NHpO?=
 =?utf-8?B?cGdXVEdjNFliNzgxbGsydkdSOUNjVTBZOVoyZWUyZDhSWkVWRWU4Q3kxWHhK?=
 =?utf-8?B?Ukh4NUZPMzZwQUoxWGtJMzEwVG15TU1FU202SnBud0pWMTM0dXQxUTBTbEVI?=
 =?utf-8?B?MStyK0R6bFAxWlY4QUpmK1ArZHhUNDJuOHFWdFJQa0R5TGZ4SFl3VUxhdDE0?=
 =?utf-8?B?VGpIaXpiQjJqV1J1ZGFKQUJIUkxiREd5ZjZRK01uaWI0M3pIL1JTNHJycXJv?=
 =?utf-8?Q?MOY6JjISv/r8OdkJnkq0UhXJd?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Vu3LBOd8CkCszvTx788dQDuL/TauCVFTJ4LP+RTFEVV+KrHJ3aFVDHz/nuO07V33UFr0btkv0aGsQFkU+kDUDyypu6xbazOHoPVmWILQ9d0ItYAkn+gdeiqwuGc/OeOOL+5LeHkvRyeABfhotZXnoaQYDxeGgWFE6eSSErN0qZKxUr6s+YmFUeErfy4++XimMYVZnh3bz8Tdyklv72SAy97WsOjEb6kZt32dNHl/Zc4707R748658y8rwbegrnx0J2pau7XjGGOfOEikmvRgO8rCX3i6SdXXOAK2HM2k5vCzPFeFRpJf6A6eFW2rCcnlur7Gc9VSDZ899rngvWfu117Vgkixnz/YLKDDywyYkTKIeW5tiW9GNWlPMG0lW1t1ZVmWweaw+6plomQnOmJVUoaYCZ6LrEogXjoFkHBnS+M8qTtfocUAvYKjBGXVoFQDqHCijCyGY4jJTY5KyUqN0WdwrLFdMp9ZH+mfos6g1hXjtUFYk1Bqchp5TQV6XVs2a+0+NTocLnUYxjKkZP82injEbhOsrneA/UD7LdvHbnVzuFgmx3/f6q+qpV9VRqPGceXnrWTm6k9RyyWZRzrmd54QJEes12uKeZneLBMcvuE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec71dab-ce04-4475-3064-08dcb3187b76
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 17:28:11.2877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yfHegechAmmzG3tnn8hdBF4NeTrgDGodDNDB+mxeqYU1uTPA31w783gWQgxiwMpHlkFODHKodSwwcnsGGhc5cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6200
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_13,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408020121
X-Proofpoint-GUID: peGg7PihO1ypU0fJ-glRYxL3mnSwSB4O
X-Proofpoint-ORIG-GUID: peGg7PihO1ypU0fJ-glRYxL3mnSwSB4O

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

But has an effort been made to clean out the last of these?  E.g., with 
"git grep linux_banner", I also see:

test/unittest/options/err.D_ASRELO.kdefs.d: trace((string)`linux_banner);
test/unittest/options/tst.knodefs.sh:   -Sn 'BEGIN { 
trace((string)`linux_banner); exit(0); }' 2>&1 | \
test/unittest/tracemem/tst.tracemem.d:  p = (char *)`linux_banner;      
/* first 14 chars are "Linux version " */

The nodef cases... maybe not an issue but perhaps at least for stylistic 
consistency?

On 8/2/24 11:56, Kris Van Hees wrote:
> Yet another case where lack datatype information for kernel variable

s/lack/lack of/
s/kernel/a kernel/

> (i.e. lack of CTF, and BTF does not provide it) requires an explicit
> use of the &-operator.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   test/unittest/options/tst.linkmode.r  | 2 +-
>   test/unittest/options/tst.linkmode.sh | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/test/unittest/options/tst.linkmode.r b/test/unittest/options/tst.linkmode.r
> index 4b453f56..acbf8025 100644
> --- a/test/unittest/options/tst.linkmode.r
> +++ b/test/unittest/options/tst.linkmode.r
> @@ -14,4 +14,4 @@ Linux version
>   
>   -- @@stderr --
>   dtrace: failed to set -x linkmode: Invalid value for specified option
> -dtrace: invalid probe specifier BEGIN { trace((string)`linux_banner); exit(0); }: relocation remains against kernel symbol vmlinux`linux_banner (offset {ptr})
> +dtrace: invalid probe specifier BEGIN { trace((string)&`linux_banner); exit(0); }: relocation remains against kernel symbol vmlinux`linux_banner (offset {ptr})
> diff --git a/test/unittest/options/tst.linkmode.sh b/test/unittest/options/tst.linkmode.sh
> index 4e28f8bd..07045fd5 100755
> --- a/test/unittest/options/tst.linkmode.sh
> +++ b/test/unittest/options/tst.linkmode.sh
> @@ -1,7 +1,7 @@
>   #!/bin/bash
>   #
>   # Oracle Linux DTrace.
> -# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2023, 2024, Oracle and/or its affiliates. All rights reserved.
>   # Licensed under the Universal Permissive License v 1.0 as shown at
>   # http://oss.oracle.com/licenses/upl.
>   #
> @@ -12,7 +12,7 @@ dtrace=$1
>   
>   function mytest() {
>   	echo try $1
> -	$dtrace $1 -qn 'BEGIN { trace((string)`linux_banner); exit(0); }' | cut -c-14
> +	$dtrace $1 -qn 'BEGIN { trace((string)&`linux_banner); exit(0); }' | cut -c-14
>   }
>   
>   # Test different link modes.
