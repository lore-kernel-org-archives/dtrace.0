Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C121E0B66
	for <dtrace@lists.linux.dev>; Fri,  8 Nov 2024 13:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731071596; cv=fail; b=WVUQaysYnZE5bAZFSeuAUvYOHoGwq9mW+yqA7e1nFJy+5K7OGZSNehCnKPdxai9ULy6/ZdNPnXtfbS23ZCu/HTmHRA/iSGWjTC+c1LWbo67lZT2+OjcksJfJriHLCTeC5caY0WQLzqqelBELF4T2odHz0cMT3c6hD2HX7Gnkzbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731071596; c=relaxed/simple;
	bh=DVggYUDjHhBitiXVLoefYhZGXY4Gq2eaiWlP3dMoE/M=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=IPZcs75JQr+0tvCF5QlaoT4mtLoR/cB8OHCOQy5sZiGSoJorUxo1/ikGdFBgsE/jJ0/eEW7DCyF9DGPmDtZiHcryiXjfd/3G1zkEN1hfniaBljED2v0U++1NpyUanuPuP+MeUYkrTVfjQD2uOzURJb5gdfr6c+lVf6oquf+bOcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=f0/FlAIZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PeEJMXfF; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="f0/FlAIZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PeEJMXfF"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A8BgdbI015884
	for <dtrace@lists.linux.dev>; Fri, 8 Nov 2024 13:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=WqYVnZwvbWjg3msrimKE9uHHk8KXhl4MoB0QGwNaZwg=; b=
	f0/FlAIZpaqzZTT3VJU8+6tZpsSo46HuGExMisV6/KuL9l/9DYe8QcqGz71xiCCM
	of9NNzkX338ReNzd0DSuAnGN4/zLRdhjsX+mRtqPo52WfbRO5Ukpm0qIcU6ibIVS
	lqnKlyKxVELes7bN5IvLir9LoHGLddM+UgyRDUUJZt41ylRu08O//YxVfCeQbfB+
	cL4ZixIQj9iBx7kDQwnZHBdf/Lmta6rZdthyF/QdjpgJYpPzNutFmIzyqpAdZ7zI
	zWgJKstBCZkqIUnsyDzFxp4ssuvqfAvJlZrIvWXFl5V+GRDN/l5tQ8/IIkV4u2fB
	v+wefGibiG4oM0mWEUWPEA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42s6gj1crd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 08 Nov 2024 13:13:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A8BaEwD035232
	for <dtrace@lists.linux.dev>; Fri, 8 Nov 2024 13:13:12 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42nahhrfcq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 08 Nov 2024 13:13:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6HRIuWaeneNrhF0INhc4wnHpFwfOKXY4dwbN33zud4dTXJKttmy0A3cDfeW32nbNROlfwXTVBiVTySeXA0NrXmp1X82bqVCGd5yWbeW2SAlcrs7q5rpFwYuRYUoXfWtQNAxeX7lQ430bzl2Vgyo+3fKjt3sFpSoI1qQSZPcTQm09U3bqmfZ2FHPPekLSqgqssSbSDdnV1GGUme/vvttmiHIcknuMSiCIgYIBWNmmeZ5unNs+rM904C9fAjqisJv3mxCMgTNIbsF4jVVvA19vmumNoqkwZF5QJkMXDuzdAFmRhq8F6zEMvH+SLQ1dXfPKUsIcUJk4a9mDbl3dUNriQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqYVnZwvbWjg3msrimKE9uHHk8KXhl4MoB0QGwNaZwg=;
 b=O7tkHIRiZhaxw326MSpjXm+5zhZyl3QDRzPNE8lw89rTH2dKgvWEH0M2VDmv9kW9xJtMCivAInLf/hlaTzoAolz/aS8/YDECNqhISZtRkK73L+1A61DTxI/dn0EnquxZMVZL7nwc+xCj0riqPvdwu53JMBRNRjJ7fL9Odn4yb5NTdNgtLYQTbRkaXuY/9IXF1DzsNFXvMOwXKdwEhNDtTctO9cXXamDf9R8HEeIFQcz3loL6n9ofdQK41Y1attKE0V/aiz8FELmzDFw5wWC3af1UsNYCp7RXSx/5bAcEOi/nHae0My/N3V51q8/g3JoGkcF7Fxkuoski7/5p0QTJQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqYVnZwvbWjg3msrimKE9uHHk8KXhl4MoB0QGwNaZwg=;
 b=PeEJMXfF4WsslFLvLgNH5ErT891uoaRr9tyV+p0HUfg8CDow2hmdVHgXoaPmHxn/MlZ4oD/CM97mUCJnAC79xk6ExThEmg0nzyG0MozB/tv9sPR8Lheb3YLvTTL4f7j1qEkx6gYKLyywsQR5QC4FYiEXKO4A4+sJuz3z9WTCknQ=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by PH0PR10MB4471.namprd10.prod.outlook.com (2603:10b6:510:38::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 13:13:08 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Fri, 8 Nov 2024
 13:13:08 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v7 5/6] usdt: new tests for USDT arg sanity with
 overlapping pid probes
References: <20241106112942.264351-1-nick.alcock@oracle.com>
	<20241106112942.264351-6-nick.alcock@oracle.com>
	<c7e23550-b87c-9750-e17f-20b7b060854c@oracle.com>
Emacs: is that a Lisp interpreter in your editor, or are you just happy to
 see me?
Date: Fri, 08 Nov 2024 13:13:02 +0000
In-Reply-To: <c7e23550-b87c-9750-e17f-20b7b060854c@oracle.com> (Eugene Loh's
	message of "Thu, 7 Nov 2024 15:54:04 -0500")
Message-ID: <87r07l7tsx.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0680.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::9) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|PH0PR10MB4471:EE_
X-MS-Office365-Filtering-Correlation-Id: a62b0e6f-ac58-42d9-348b-08dcfff71661
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0Z3ZXJab2d1OFdYS1k5aFliaUsvMmNJdHhvWGpvOXVJRnJPSUszZnQxZWpl?=
 =?utf-8?B?K2VESWVhNlBtZzhIMWtIdEYzUFFJT2dJSjNJSTgyQS8xYTA3aFVJbFhPQWIv?=
 =?utf-8?B?SkVZaWRKdkI5SWJRRjB5amxmamUvOWdyYkxPKzVadnlXMVk4a2t3SzhkdGp2?=
 =?utf-8?B?eHpTT1Fla0dyMDd5OFRRVWpyM3NmdXNsMCtaQnF2WXJjUDZ5UncxTjhoMlhZ?=
 =?utf-8?B?RkprWCtJUkhPbGdPdDhOWDBybFFYZjVZdUEvRURZWHFXeHVCdmNFQ3ZXYnUz?=
 =?utf-8?B?UXJYQU0vOWJ3RzN1VzJmRXluZy95YS9DNUpmOURMWkpyT21SeGxQVEJTWStK?=
 =?utf-8?B?ZVZjRVp5WGVuNlpMajU1YktoVjVJa25pekwzVldwT08wSHVUekdoZ0tmTG5k?=
 =?utf-8?B?MktnNVR1NUJtVnNJYVNNS01aVW05MFovVFFmd3l2eHpwcWVTSW9jQ3NvT1dC?=
 =?utf-8?B?WGhZb3RQUHNYaW85OGtLQUxiaDZneFZwaVFqbEdWRlBTaUl6R0UzNmp6TkRQ?=
 =?utf-8?B?dnFhbmZSSE1ZbUpkTkQvOHQzNFNlVHJSWHVldmY0OHI5MVFLbkxjUU1xMHNQ?=
 =?utf-8?B?bnk3eW9LKzJRS2ErOUxRKzh0NisyWGh2RTQ1RE42ZGFQL0xxWi90RStGNFF0?=
 =?utf-8?B?cWVsTmNIT2NSZEkxdmRNY1d1WXBYNmg0Y3lUOUgwa25PeWNzNytERHh4aHIv?=
 =?utf-8?B?ZzdXcVAvRDdzemNsdjA5bGpYd0gxaXp3NUphMldLcEVvMVVSN0E2R2ZZd2k0?=
 =?utf-8?B?U2pyNnlKRkNsUkRwWk9qTkRZMGJrc01ralcvc1g0YzBoZzdJWGUveE5wem9t?=
 =?utf-8?B?VHhCemtWck9oaVdTSjRlbjZTM21nWWlSWFBwY2xGbHFkcU1kVHRPaFIxM0lS?=
 =?utf-8?B?andGUllKVGR1M1BEeitUUE1oRHNQRWhnSXhlYjF6NDEybzdYaCtKUkFnQzRB?=
 =?utf-8?B?T3loMGphM3F3OTlUNUNVcVlPNzZheFZOTVBicEZ4Q1Rtak1RL2tQWnZUbkh1?=
 =?utf-8?B?cVFYQVlFQktrcnRza1pMMGRYa2J6ZUdHd0d2bDhWc042b21yZVBnY0FVbXhL?=
 =?utf-8?B?T3dlcVNTVE0xUnhKMWphYTRUY25qZkFTVjdMekkrQ1NUSkxnbEZoT1lJTUc3?=
 =?utf-8?B?c0tpS2Vzb3FYdlkwWTRVVnNra2gwc203Rk0rb3lxNnNBTG1xQnFkWm1GYTUx?=
 =?utf-8?B?dHpkM3ZMTDBJZjRIUzhhbzJsWTV6a2ZHS3BFd3dNMjNuM3FTU1R2ZnpqSms4?=
 =?utf-8?B?K29Ya1MrTDJLQW1PdU5BcXptTVgwK0xSZ2NjNU1yYTBsWU43WTZ2eDRidGhw?=
 =?utf-8?B?YkdYUlFObGlIMWhTZERBNjExcEpFZVBEQ1dYTkVicXN5Wk04Vk84Wlo4Kzht?=
 =?utf-8?B?TG96dHYvQXNSa2g4Rm5GMVpiV01VSnNYSUV5UjVLWDBRVXU4MEY4a2dsSk5S?=
 =?utf-8?B?bjFxZ2xJZDJOQ0Ewb1pXZ3dERjQyK0gyVmhLcjdTQnc2Yi9OUk1odXMza21F?=
 =?utf-8?B?Wi92dXFSblNEOXNWcHhYbGE3WXplWUU2WHFjclpJWmJ4ZHJTdXVUNFRsY2Jz?=
 =?utf-8?B?ekpnMkdSTzd4b1BQNS9nalFTTDBFRld5UGV1K3M1dm1paGdjcWU3MDNJVU9U?=
 =?utf-8?B?dVRMS0w3ME5VRkJBTHJvNENtZlpzMHJzaUZxem53TE9mc0c2Sk51dDFtYzBs?=
 =?utf-8?B?aU9MRm53S1hpaTkvb0pWcS8xWlJRZWp1dGN4MDkrRnhCMWVNd213Qkt5bHVJ?=
 =?utf-8?Q?1ioLTcRv0a/wF5b3i8baEP9uAX1vQaz+EGuM9Im?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WE95b2lCQnhQUGxjQ2FFR0xwNmlXcWI0MFVnd3Q4UjIyYTVpeUFFa3hHRXha?=
 =?utf-8?B?c3JWelFybFpMbzgzaXk2cGhoSHNWVmhvdlk0bXFWeWRjZ2h5Z01sQTFTRmsw?=
 =?utf-8?B?VWhDZzN5RXErVXd2c3RDN1BMSkZRcjJtS29oSGZGMzRyUlpCWm1JWEovYnlw?=
 =?utf-8?B?dENCOHlPZnd0aCszbkhxaFJzL3p1Q0k3TTI4K0gyeWthV1hRRGh5Z1NaaUU3?=
 =?utf-8?B?ck82UGF3L3ZFSjBKK3lkVE9LeXNrR2JXSTBFbk1KaUNSZkJkRzZYdk9RN09X?=
 =?utf-8?B?UzBRMGFuTDhzeXU3RjlIVnNWSDdhTTFtbTc0QzRFK3BWRGFYYXZKcm9jOGtD?=
 =?utf-8?B?YlR5TDhGbWpkYThuQjRHNWM0Q05UMlJldS9kclpqZ0dtd3ljL3crem01MW9p?=
 =?utf-8?B?RlhCb3hVdjdLUnBZV014NWptbDRSaXJWQjdqaUpBU0NaNTlLdjg3Sm9NNTVY?=
 =?utf-8?B?SGFjWWYxcDliVG9ieGtJdUtJcGdWVXNaMUp3M1BrU3RSUTJnM21HMUFRbFEz?=
 =?utf-8?B?aUtlWFBJcEdUbjBIb1p0K0x4KzczUDlHMFZsdisySjBWZmJRUHRyT3JDYnpM?=
 =?utf-8?B?cjdYcUZ5QmZEUUhUSlh5cmRPMFZ6di9ja3lJd3gzZHdiUC9zeTZxcWFUVW9M?=
 =?utf-8?B?UnhCbTJFd3VSckdwbmo0T3BPdVJSbXROT25DRDJHVHdpbHBoRmQyQmgxRFRo?=
 =?utf-8?B?eG5WSFVkNHhqRUprMXRHQzY2Mk1sZkVydVhJTytjUk5NemM1Z3RDdGpXVytw?=
 =?utf-8?B?LzJ2T3FCVXhxV3RlN0F3N1Brd0pSTEMwZnQwSElDY2x6WUFtZmo2TTBQNjAr?=
 =?utf-8?B?MWtDTCtmYlVKTEpteFdLZFBFS2xKNTAxRHZjMkcwZFNtYkhVMnVpUTFTUHhC?=
 =?utf-8?B?eis4WTBxazhHaVNhSU1aTGFQZnNXK2pKa3ZOMEhJSDhmZUZTWGdLVW85V3Ur?=
 =?utf-8?B?S2dqUWIzdkdkV0dRWUV5aEVxa3NkNVZaMjZiL0xwMXpyZkMwenkxdHdNbEk5?=
 =?utf-8?B?OEpXN2FjMmFkNitZTE9VSzdZVEpoT296NUdXVjkwaU9jaGFLMHMwajdlUWZ1?=
 =?utf-8?B?eWxTNm5YN29CVkUrUFdrRzJVVDJMdmdMbmFxRXgyK0ppd1pLNzNFaFJHT0I0?=
 =?utf-8?B?ZW5SUCtUenFKMGlGdG0zSzhNR2lUbm4vOVhIVUVOcXEzb1U2NUd2VWZ4VC91?=
 =?utf-8?B?SG5ML2FZMzh4VmpDNVAxa0tuUkdITnU4L09CdldZc0JpNXZpZWVQOStYOURX?=
 =?utf-8?B?NFdGSXFFQWxUeTJ1NzZUZytueHN2SFdiZDR0ZjNnZHY3OVBhS3gyL3FiSmkw?=
 =?utf-8?B?T3NwKzJYOUpTSlFwR2IxQ1hodURMUFY5NURCa054cVFxc0pDV3NwdWMzSUc0?=
 =?utf-8?B?NzNMNmQ2YVd5bXVkUisvbmtIWkxNR08xVUZjYVVwYlNUWlZsSWZyc1JYK29H?=
 =?utf-8?B?TlNCbGNnWkZaTWVkbzhjZ1JQZ01wY2J2ZE5Wd2VTaFRSaXFhaDU1VHBBNEpr?=
 =?utf-8?B?aU1IYjNmN3E2aXZVUVhJT2tnQ1hvMVZialErbkZUb3ZEbnpzYkV0amUvLzVY?=
 =?utf-8?B?VTB5M1duc3JJbytwK3NzYTNKNjAvV0NFU1VndlVudFdUaXJNelZHWEQweG5x?=
 =?utf-8?B?MWJab1Jja0NqOGhiem54RCt2TWZtakM0c1g1VUVYSWNEOHcxU05sK0JUNUZy?=
 =?utf-8?B?Q3VqL1hMSXpaQXd0ejhvaXoxODlJUGxyWmQvOEd5bUZpdEZjckR3cEEwaGdq?=
 =?utf-8?B?R0ErMjhRbmhoeGp0c3ZyZmgzOG4yaWpzS3FoMGtBOXhXTEZWUU5vR3dzSk5O?=
 =?utf-8?B?QTdRQVU0U1E0L3hBcW9EUmE0cmRuQWxobW12czhoZVlkcWdQeXJINkxQN1dM?=
 =?utf-8?B?c2JyYmU2R3k5KzZUM1ZyRWEvK2g1S0k1U2lacnJINHNsOWgyeDBpZkZzZFFL?=
 =?utf-8?B?K1JNRE56OXh1NitjT0QyZHpxK1FXb0g2TXlwZVdOMDNYUU5rcmpmSzJFYmtm?=
 =?utf-8?B?S0lpMC82dFVNcGF0WnNJaVNRRm1tQmxJZEd2S3A0dTlIUUtNV3dXYVpzaHJH?=
 =?utf-8?B?ZCtPL2RuTzFYLzNTWGZKVjl3VzZzTjJaYzlwSnBFVnNjdnhhQUZaTksxZlRG?=
 =?utf-8?B?S0JZUWJ0TnE2Uit5VlEwQThZS2FWWGlZVFF6VU9MVGFuQmcrVWdRL0R1bkEv?=
 =?utf-8?B?UWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	z6k8It/SPFpI0FX+a+Rqb1xEcczYNHFXQjcggZGm7wFtpRgyJltxSVWu+sy2N2u0e7MSw9S4+0CP01L7KaiX8A5s+ucSvE5bL8bRWyo7IXaFq1NkRTAuLPq848EvYGAxOn5Z8marp+9KnYrIOlHVZSkdi4wVVMX1fL4k/QPDl9/iQhHzYjn1eo7NDNCq4zXp9NBMORQpnnLmDxOZhSIV7gOeXZJt5m8w5WE3Dm6OWcrLIUyeEaJvWoAPqR8FNk93WxW0xuWecZWxAf6EZqNtZOyAkZj0HzcdADBE7FzcYVgKlNCUveRnW04JfALRJymdwYP0niPio+IPvd95ZQ1OwuwuM/ATVl6O529iXXapnfj+gB59nR8fujm9a1J+dtiV19/fTzcYT5ZLdGkQ2Vb6tA/J5slvYThy1BHGXCr3XRoiXowgAjKP0xa0+UI/cBnZyeXqQAP1cy59qIaDlk9U4YsTm5BCb1WJ/ybxhcVkB4Ti2zsX1uUxFurB+LGWmqe2BKdqnxRb9OkkAjvHgtGNxW2Yl1c1UxPrwR+czLDY12Bsa0LBKsN6EgugHDT6A9KzDCYjMI4PjCZ3rMKCn54919aRGXm5cE8JsefjmaH6sdw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a62b0e6f-ac58-42d9-348b-08dcfff71661
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 13:13:07.9833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VABFN9vIN/qwfo3m6w3PSBd1jbES+Di2IY5ZfUpaXS4pXetafpqCN6q/Hsv/ivdGCqiag3NKXj+KixmTXx7zLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4471
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-08_09,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411080110
X-Proofpoint-GUID: W9CcifEzR7OrryBgmHiJZO9wFmISQD1H
X-Proofpoint-ORIG-GUID: W9CcifEzR7OrryBgmHiJZO9wFmISQD1H

On 7 Nov 2024, Eugene Loh uttered the following:

> On 11/6/24 06:29, Nick Alcock wrote:
>
>> This generalizes the existing tst.pidprobes.sh to check the args
>> reported by the probe both with and without arg mapping in place.
>>
>> Everything seems to work.
>
> That comment seems to be unnecessary.

I think it's worth noting that all this arg-mapping infrastructure
(mostly entirely untested for fifteen years) still works :)

> Also, is there a "dtrace -lv" test for USDT args?=C2=A0 (I'm not even sur=
e if that question makes sense.)

Yep. See the previous patch. (Multiple, actually, Kris had me add a few
more.)

>> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
>> ---
>>   .../usdt/{tst.pidprobes.sh =3D> pidprobes.sh}   | 56 +++++++++++++++--=
--
>
> Why the renaming?=C2=A0 And, will "./runtest.sh" run pidprobes.sh without=
 any command-line args?

Nope! It's a library now, called by tst.pid*sh, including, uh, the new
tst.pidprobes.sh I meant to keep around and call it. Oops!

>> --- a/test/unittest/usdt/tst.pidprobes.sh
>> +++ b/test/unittest/usdt/pidprobes.sh
>> @@ -5,9 +5,12 @@
>>   # Licensed under the Universal Permissive License v 1.0 as shown at
>>   # http://oss.oracle.com/licenses/upl.
>>   #
>> -# This test verifies that USDT and pid probes can share underlying prob=
es.
>> +# This test verifies various properties of USDT and pid probes sharing
>> +# underlying probes.
>>     dtrace=3D$1
>> +usdt=3D$2
>
> Why is there a usdt=3D$2?=C2=A0 It seems that usdt is always "t" and you'=
d expect that in test/unittest/usdt.

Oh crap. Sorry sorry this is a bug -- I lost the tst.pidprobes.sh I
meant to add back. Will fix and repush this patch.

-- which reads, in entirety

exec $(dirname $_test)/pidprobes.sh $1 "" ""

>> @@ -75,7 +86,7 @@ fi
>>   # Check that the program output is 0 when the USDT probe is not enable=
d.
>>   # That is, the PYRAMID_ENTRY_ENABLED() is-enabled checks should not pa=
ss.
>>   -./main > main.out
>> +./main standalone > main.out
>
> I'd vote against this change.=C2=A0 Introducing a command-line arg that i=
s not used?=C2=A0 Or, add it as a comment?=C2=A0 But there is already a
> comment.

I... think that was fallout from my attempt to add deferred support that
I forgot to clean out again. Dropped.

>>   echo "my result: 10" > main.out2.expected
>>     if ! diff -q main.out2 main.out2.expected > /dev/null; then
>> -	echo '"my result"' looks wrong when using DTrace
>> +	echo '"my result"' looks wrong
>
> Why?=C2=A0 In particular, "when using DTrace" stands in contrast to the e=
arlier message 'echo '"my result"' looks wrong when not using
> DTrace'.

Sorry! I didn't notice that the previous stanza existed and thought
"well of course we're using DTrace, that's redundant". Dropped.

>>   -# Sort and check.
>> +# Sort and check (dropping any wake-up firings from deferred probing).
>
> I guess I do not get this.=C2=A0 Where does any "dropping" take place?

In the deferred patch that caused massive ructions here and then I tried
to drop by hand very late at night and clearly didn't do as good a job
at as I thought I did. Dropped this reference to, uh, dropping.

>>     sort dtrace.out          > dtrace.out.sorted
>>   sort dtrace.out.expected > dtrace.out.expected.sorted
>> diff --git a/test/unittest/usdt/tst.pidargmap.sh b/test/unittest/usdt/ts=
t.pidargmap.sh
>> new file mode 100755
>> index 000000000000..0c83f8703539
>> --- /dev/null
>> +++ b/test/unittest/usdt/tst.pidargmap.sh
>> @@ -0,0 +1,11 @@
>> +#!/bin/bash
>> +#
>> +# Oracle Linux DTrace.
>> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved=
.
>> +# Licensed under the Universal Permissive License v 1.0 as shown at
>> +# http://oss.oracle.com/licenses/upl.
>> +#
>> +# This test verifies that USDT and pid probes that share underlying pro=
bes
>> +# do not apply arg mappings (incorrectly) to the pid probes.
>
> How do we verify that mappings do not apply (incorrectly) to pid probes?=
=C2=A0 Is there supposed to be a check on pid probe args?

Yeah, that's back now, apologies :) verified that it still works, too.
Will send as a followup to this reply in a mo.

--=20
NULL && (void)
