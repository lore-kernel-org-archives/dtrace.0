Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FDF30AD1A
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 20:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763499244; cv=fail; b=KfMT1dSEeMUVJLZcMesr78REZdhtoqPmzHsEmUjkOQNag7kA/7kbhWS1Rkyo4ZFhzJUEmBYZI+voeAxr/XH2Pz3Z9KmoZ2HPOf1jy9LJ7IYWwYIyBaetQKGbuUdElKIwMXoVXjioouRaWm0Cox+dZQ4CJqCq3A2Ujk/4d+3dJK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763499244; c=relaxed/simple;
	bh=lAgux1/emwqYYVSTFXBuuMkzdfgCBscokcZGVOBiI7U=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YSvJgS2uzYmKV7iKzfkSmfMa7G2hD4kVH3//lzgq+Y+WyItKCZv+TEIq7Zz+oiyRp8EbUe/LNRNVHVKSFiYt+ON6v92yv9RoBQZ0HAnLxe1gjKlxMZ98K53pa0ntd1oINPGR07SNmr3dvKllCiSi5C570MISn4BqgFReTbzz6ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LBxzxBdh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ybEDhuYr; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LBxzxBdh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ybEDhuYr"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIHNLaF016792
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 20:54:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=qEsqogPM96pyfMa8m4f8SFAMJit4CNNb0OzOGN637Ec=; b=
	LBxzxBdhNHn5XcYm2zx6Prp5BpwGWu5I5pElK2V2ASVeWOP1utNYt4fYV/YaJgEm
	qbe9P5+3mxRusbbwTtEy5Uxwuibei6509UZvm5qCAks2Gb9zvZQBMbtbcJ+rlwYy
	U6Q6i0cODzLEUQgJKVrUwPP19QrgPMYWgou3g9QC1lZu4HLj4LS0uhmWTizuxAx4
	yAxV0R4DwVtFfdpsPSQS/hYl67aGCHtNqSEvMJj93hn9+Zw1dKA5POf/0lBUvzr9
	CUQvoGKJANj87ej5RvFAtCRSr0w3XnnCqV5HnR0T6RO6LK5/84fELN5XTXRKmE+z
	W7H6Z1NDBlejlcBRjdKOVw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aej965q23-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 20:54:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIJqYF8035914
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 20:54:00 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012026.outbound.protection.outlook.com [52.101.48.26])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4aefykxgdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 20:54:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P7P+fqb5LQ81VxXcnHw5jGACyFIsKgNkGTQ25Wyk0ipxjWdPnykKvYO5R0tqE8F591zUU0+0YilGsOyMBDQPVIPNpYIxbSnR23YWXw3hFc2Sb4k8Rd85zopqUmYrRycuiPHY8oSSworG/rxX90gydP4OETreT8cWzv7ZsJDUYOiHlpxEPder+6FDErATZkmAEzOxsRuIBU/jYoJFJYeh95K3DiSbTKT3gUOm2u6CljReYHWPaTcRciqRixpy14ua7/uEAFycQFUHowrJQniGtXuxUWndlaizQRR8I/B3BzG0IqnA42ZFwlZ9aWH4KEKpWyzmIajYTHYaNkF8q9+NEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEsqogPM96pyfMa8m4f8SFAMJit4CNNb0OzOGN637Ec=;
 b=YcvDNhtzrakOxDdufOryd6sOZi/C5vXXmGZjtv7lPQVWnl5HgRzSoso3DAn7uQfgML0bFkF2+pmddDgi4hGkvVWMCxerywu6NgCeV2NAzrNz49v9JPRiekHlHIe/G0fFl8WhKGSgfVEyt/az+GsRUfcVyqX6qX1OQA/wWz1/UHgsadSf2vMwZwItsUMXMIRcx3qVrJPgOCLyG2Ob8oVIb4OG8OM1XLTs/H+C4YBc9sNy+YtJQpO2xH29loM1/eSKocEmHLwhGA3ZyA1jAnZHJ3rh4EiCnkVTCYnajq9pJ4Uf4Rq5lnoxwbHDhkss6h+HslvXcpiN3eYCJyp3169UtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEsqogPM96pyfMa8m4f8SFAMJit4CNNb0OzOGN637Ec=;
 b=ybEDhuYr1hC+9EzZ8bn92fW0D96PLxz81mwIZErZkqyLyrRyQYaVgZRDN92GF5YWRZwfw/h1HXzmNYcc2tRa8SUaJfapGbmt0+Uk0mqNiYLBFS3IqR1xHCGC4k2lCP2Uq2bkqA4tM0aOkntZgW0Efm3O6G+fPATGOFXPmsNmeZ8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA3PR10MB7070.namprd10.prod.outlook.com (2603:10b6:806:311::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 20:53:18 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 20:53:17 +0000
Message-ID: <4e9e70de-a03a-4c1a-47a4-4a3d4d8adab8@oracle.com>
Date: Tue, 18 Nov 2025 15:53:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 7/7] module ranges: fix file pointer leak
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <BY5PR10MB39872E36B0D41AD794563D95C2D6A@BY5PR10MB3987.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <BY5PR10MB39872E36B0D41AD794563D95C2D6A@BY5PR10MB3987.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:74::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA3PR10MB7070:EE_
X-MS-Office365-Filtering-Correlation-Id: edc28246-fc9d-4c7d-4ea2-08de26e47fd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WDloTFpreTVhSnk2UjE1UmlkdTcraEh0ZW9MbkZBWjNEdTFaOFFzalZCZUZM?=
 =?utf-8?B?STBSTGZRZGo4WEJ3bnFkU2RCVXY5VEtHMUplaUlMWUo1WTdlaHF4RlBRdWJm?=
 =?utf-8?B?b2xLcHlLV01NVHZuWDdBWW5TMlRJYmMrNEEvSnd1Q1U3S3lmYnlmNndscVZ1?=
 =?utf-8?B?RUZYdTBsK1NmRlp6SFhXb2E5Tk1EeEpTenVDTmNmWkJxZkUrTmVwcUZ1Mmg0?=
 =?utf-8?B?azQ3dW0xMFlIRlV4dW9IL3p2Tm1ZVG9IamJETkdMRUpVbWNGbk80Y1p2NFE3?=
 =?utf-8?B?STRHRG9iUFF4QVFRTTRTMGJQaGEvRjFTOVVGYjVGOGxodWt2L3IreDhPMUhH?=
 =?utf-8?B?M1lFMUYrL3d0UmJTQUk4TjQ0MWVvYVQrMWUxdFpqRnlkU0lhcnFUSFZSWHl1?=
 =?utf-8?B?azZUN05BS0ZMWFltbTNuc2JUcTVydTZ4b0pzNVhEdGVQaTlaM2lpMWZQYlhQ?=
 =?utf-8?B?TFVYN0RSOXJFaXVNRW5MZGFpN0Vvc2QyVG43dWZHNGVnOUFONFh4enBXUXpl?=
 =?utf-8?B?OVkzdkE5OHEySWhQRlNwMmVvTEpQRmdGbmdGTEcweUduM1NHckF5RjU1MVRD?=
 =?utf-8?B?bjZmamF0d0lxU1NqenZKMXJydERGY3VFdE9vQ1Njek1ISktFSEYxKzJGa3Ny?=
 =?utf-8?B?cnBrL3NwMVpscVNUaTk3UlZwaEJ1RmZvekV2T1Z2cGxDZ3R2OXphTlhybVdL?=
 =?utf-8?B?cTRsa2ozY2lOdm1JWjZCdkZuWVEydkplczNqR3Z5Y3lOV01GS2pQYTQ2dHZv?=
 =?utf-8?B?Y1Zxb0hWWTdPMTJmZFJmUXltazR3b2xnNitiRDE4TzMzRzMzL2RlSEMveDBK?=
 =?utf-8?B?dFdtZ1hZSlJ2eGpsc0ptMjdlcmJ4NWYwZTBDZk1FdHBMc2QyQklYQ3FzN0tE?=
 =?utf-8?B?Sk51UEhRU1dIbVBVbGxNTVdKNFNrcTBMc1diQ05uQzEza0N2eHV3Wlg5cVFL?=
 =?utf-8?B?UFkvanF0UnV4Z2hQVlFmQjBjUjQwUFZ2YUMxdkV5VVdURWNaM3locHphdjZJ?=
 =?utf-8?B?TmZUbTFWZE11a0lEZi9NZlcvdkw3WCtWQ2VOR1RXQ0E5cjB6d2twTVZJdHVh?=
 =?utf-8?B?TEdXZUFxNEV2NkRaZ2c0Z3lZbDgzTlNLdXBSYkM2c1BlV3ZCeW5jNkJEQTJU?=
 =?utf-8?B?NHAxY2FNZG1aejEwZyszanh6SGtMaWkwOUc1VU5INzFMKzlMM3RIOGI5eWpv?=
 =?utf-8?B?Z05PZ1J1VUNKdlB2RWtKM0gzZ1B3WFdWUEw1cFdTMUZqZEY3SU9IYUNKbVNF?=
 =?utf-8?B?NE9UM09FMHBZUTMzQlhBbUZUcTM0QnRsaDVOOVg0UGRRaTlGSmtDczhyWExN?=
 =?utf-8?B?ekFxRGlrcEZLWm9hZGh0NElZc2ljVklLdGkyR0lUbjF1WVZzSkZJTVFRRWE1?=
 =?utf-8?B?YWhYTCtpYmFSVDFHTVpYUGw3SnFxci9rK2Q5d2p5ZnNVWE0wNGgvQVlWc3N4?=
 =?utf-8?B?cTBMWE1PcGNNUTRDV1BMN0k2WTYyeG9FVFJRQ3B5YWdUY2UxS1JMWU94cXpS?=
 =?utf-8?B?UGtBRkthT29vZVRyRUdmUE45QWFLbE96RlN5MEVaZnR5cFVsVGxTNDhVQnpB?=
 =?utf-8?B?eTkwU2RoSzd5N2dnMEZKc01SYzFuSEVSQUluZUFkZWNhQnNwL2Q1UHJyVzRH?=
 =?utf-8?B?cEdJSm5yUXltR3MrUEhlVUxkWXlPNmJBdEg2R01XcXVOaXVybkU2enVyVjhu?=
 =?utf-8?B?UnZublNIdWpFaTN2VTNLWDBEMjh4bnpHUGM4QWY2R2RZbWZWZmFqTm9pTFhD?=
 =?utf-8?B?T0dLWElDVnFiTHpjdm96OE5SOWJ2YWNDSjY2VG83NklnMEd1NjVWZkJtVWpn?=
 =?utf-8?B?OTMrRk9xWlNPQnlXYkx2ek9BNlUzYWdzc09OcTUwanlyQjRQclBKUmJWMXpj?=
 =?utf-8?B?M2g0Qk9SNlEzdWw0d3NsL0doRVhzVmw2ZnJ3THFFWXFlVm5ldXhmZnduY2lB?=
 =?utf-8?Q?SuzuYTlAsXciQX2QJjB5hhVnrMechnv8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFpTS3dkdEl6N0pObks3RU5uckExK1lneUFGMmlFbnBNb2lacEg2WkwyLzZZ?=
 =?utf-8?B?TVpkZ2haUHJiNjNsOVg0V0I2cUxkUkZ6QjRwSEJ3NVVUbVIwdnVkYU84alVY?=
 =?utf-8?B?a1RaN1NGOVRuZFBBZFVJL014azMrWTNqcFRiQkxkWW1yQkJCdTBLZmtSNFFK?=
 =?utf-8?B?eXV1Mm1ON0szbDZHSmkvTUlFalRPL09LL2UycHREWEVDaW16dmhwUGVjcjND?=
 =?utf-8?B?UnJrWFFDSThsUGtMUHBncXhrMmlEVkFNNjVzcnMzbWpXQkFQdGVudDdmeUEw?=
 =?utf-8?B?c05DYjYzTzZGOEE3cWRNaDBBZnpPLzU0ZnJUNkttbVFtblFwcjVhWWF1YnMr?=
 =?utf-8?B?cGlQZVB6QkFZNFl5azBtcDQvM2I2TVUwRTZFa2tnSU1HNUwrN2hicmtwZDJW?=
 =?utf-8?B?SVRJVHAxWEpldnFCbXQwc3hPT05qazN5MUtJRDNTSG1RdG5DUG1odktVU3Zi?=
 =?utf-8?B?aUFxV0tVMk5Ga1MzSkVGUGFXWUZneWhadjVYL0ZXVnJvOGNQWXJpRzhzcDds?=
 =?utf-8?B?NlhuZ1lkeGVGcUtOb1hsNVJreEU2emxUcFdoZEF5ZjdvaHUvQnM4Rnk1Mk14?=
 =?utf-8?B?NFdoekI5RllVNUR0bDZLQXFGdm1oc1lvNC9URXFZTXdvQjRZRUFUQTNEL2hE?=
 =?utf-8?B?ak11U3pISGtSZEFOYTdjdU5mRjkzeGNDR2FOL3J5WFJ2YTMzeTdnL1hLYVFM?=
 =?utf-8?B?cUgzOWFTNFFxdEpmSlVKdkZmYmp5NXlwdENGbm1tVEo3Q21nUkVXRTdCYUY1?=
 =?utf-8?B?bDR5SEoyNWZMdlBUcDQ1b012WTFYd0hHcVZkdkhaekF4SXZiYWVyTnZkREk3?=
 =?utf-8?B?bWttZ3I4cG1UMVJudlFSdUNSVHBrMk5DS0tvbGUyVS9vT1JDMnhiYXozZUFN?=
 =?utf-8?B?dVhrS01PNGFrMXVmT3M3TEpkeWY3TVFjWmQyQmduR2VZUERjT2pITkYyYU5C?=
 =?utf-8?B?UGoxUWFYdFQ1dEhEelpNZDZrekRraThsMy90VHlDdjBTSnFwTWVBWktUeVNE?=
 =?utf-8?B?dXdrOGt1WmpreU5neXJ2U05CelVPK2xEOTJyNXlKOXk5cDdlMy9hZGUvRGtn?=
 =?utf-8?B?TWRXK0gzMjU0RUNOVVJtQlFnVTZVVkQrSUhmZDJrRGlHcE9Hb3RZNUt5MmJC?=
 =?utf-8?B?d0p0Sk5aTTE5SE9idHdvczVvV3pSanZlNjNjK2lYM1g3Z1BvTHRISi9NMHZR?=
 =?utf-8?B?eS9IRHlHTS9EM1JxR29KSS9PdUlNclhvbzBrdWRNemp0VENJQ2JxQ3NDUGpw?=
 =?utf-8?B?cEl0TnpMUkZmN3RlaVYzZ25MMXJKQnMwRXIvcG0vSzNkdDBocmU0ZUE5dVBP?=
 =?utf-8?B?U2E3R0tNby8wMS9EY0d6WFIrYUtMNVFLWTRrQXRaZ0Q3UFROdzJsWUIrK0M4?=
 =?utf-8?B?dHV6eEx4Y3dSSDVoaGVsRGZXR0dScTRxT1ZteTUvL1JOaVBvWmpxNDhIbk1N?=
 =?utf-8?B?cDBaMGdFaVdNR2wvSlZjSUhpaER3bVpnQUJLeUNWUlc4WmNTbGl6OHhVNUE0?=
 =?utf-8?B?MHljTkY2Q1RhREp4QVZSNUVRSUQ5UXBvejM5c2VLZmttRjJFZGZvTnZ1eCtZ?=
 =?utf-8?B?SUQ3dkNaY3hoTW5weG4vdnM5MSsvRkRvYVo1YVNjMCt5OFV3bkNBQWI0QUxF?=
 =?utf-8?B?TitQelR4UXFIYzREYmo0V3BGS1doYXJMV0oyZWxDYjBadnNQbDFsWmtxbWtQ?=
 =?utf-8?B?eUZPMTFodHF6a3Rud2orN0IzWmNaOFdBM25NakpGT25xaXI4ZVBVRk96c0Rr?=
 =?utf-8?B?Y1RXOE1ta2dwajdWbjJLMkNva01pTUo3NDZxQTVNV1hxVVUwcndva1ZoSWJH?=
 =?utf-8?B?aG1VcEZyTSt3UUlhNVlnSEZiaGxUWFBzZUViVEVHajNra282ODZTcWYreGtO?=
 =?utf-8?B?Y3FTVUFnWVpXeHloQ2hJNTZ4NHc3OUNXdkFuQWp6Tnk2TVBqRmpUK3kwNWo2?=
 =?utf-8?B?VGFBTHFsTXBpMXVhYzNYc2tzUElSVHFlNXczazdzeDB5UEZWSzRSb1RpQzQ5?=
 =?utf-8?B?UHc2dkpsY0xwRVo1RmVxTVlvenBtSmxiR0RUZitXWGFDQXhFd24xNG1pUXF4?=
 =?utf-8?B?VTJqclJZTWFpUm5BeHN4WXEwKytJU1Y3OHBiWVllakN4RlF2YkJTYW1xZ2NX?=
 =?utf-8?Q?ODyHQDtCDxJgNdxqXJUWmTSvD?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eiEgvUqLY+2yAo5LoVxdY/EdtorX/Iw+jLtTCrJB3VO9UwP3/zbNTyT9TI4dCS22A7oL06NZmM6qa3FW2TKbqseOFK9pA+PFgFgozb2eAvpOgFdH8TxtPoM0Yjc6lyt9us1cocfZ3e7UG42/piVcX/ktSo998zNRGIptRwNZnkOIjlIzQkIM1342sm/G+w8+y+5IVfLaAhnw9xkzDEesCOcWPpVkvMLozKaBgzleT5TiLWyZo9unyzoAGi/9Sw6BQlaFIzvuaNx4F829pehHkPpGFFMAtwHawlJDt75Wlg9rQELpOIVE11GUF58Xcu3HEphp5v6xO9WrzxJJ/dP09btWuLQddD9ZpcMSMoVtsV61nLeBo2i+36ElRXiu9waI1lbS64/3KSLgbzROgP4EjGPnP/0Ti/DeoXrGZa7Evdr136A0AUh4wPLzwGe2bzyUNWRDUw1V/1Tu15uvDUjfv8lM8pbbeqcD1pHmfA32Xa3VTLk1watQnf0BFf8n+GML/tAqxo3LP8S5xRIqQdB5/xHjvHkQb1SEejhGDghU3Ac662eBpdutXMDpnK26UyFUAPunsajjMuoN+zF521j7nkla50jLEqadGvNHGQn+Mu4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edc28246-fc9d-4c7d-4ea2-08de26e47fd5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 20:53:17.3773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dADy24ox0wC7ifsL7PQX8SmkExe4WFxPkMHrMc7fr25yZtsoa5u4MFhMguVUrJNKJa8PP+jTi8KbGrfNdxMcig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7070
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511180169
X-Authority-Analysis: v=2.4 cv=DYoaa/tW c=1 sm=1 tr=0 ts=691cdcea b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=wEa2qMosE0cv8PZpc-QA:9 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12098
X-Proofpoint-GUID: YSNzb-iON8U5Oton4RCHQByjUscIXdLG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMSBTYWx0ZWRfX0G0dsj/mxW1j
 v2smzkilwkWUCBQMJyRvJ6Q1tFDSME1JO3zYUs8G+VABBvCDvos0F7ukhS1LKJUcZero1rJAcX6
 4L9Qs81yH+IMmHHsKn94iVxTj4sDOqgvQLe6u/lfT20/9A/UHOVOOlqBdG+K/k2SOnwvhWPbu6r
 r4IIGE6dVvmJvE/zeYj44WmztnbLqzxpBAEcBv/WS0ymhLV38/wlJHHCdCkVY9pRsq+71+Ne1oU
 3CI7BLE74ROpnUAF8MwxLz5bZUGA83KTwqfpkegeh3wi9ZTgvIsMy/+dXBCruOqfy+faIO18/mq
 paSnxfMaT9Vcfe+1Js+cvT0apFKUiscOvs8pg+yYYQsjf22r5y/zVFXK5S0kohbeIlqjWjPXgxr
 pKcqAAhERCj4ykH5zkZS/ZC9o/NyMiwsEyiCioso5RX5neDqjyw=
X-Proofpoint-ORIG-GUID: YSNzb-iON8U5Oton4RCHQByjUscIXdLG

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 11/18/25 11:38, Kris Van Hees via DTrace-devel wrote:
> The file pointer to modules.builtin.ranges was never closed.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_module.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
> index 7ec1b550..00978911 100644
> --- a/libdtrace/dt_module.c
> +++ b/libdtrace/dt_module.c
> @@ -1618,8 +1618,12 @@ dtrace_update(dtrace_hdl_t *dtp)
>   		dt_module_shuffle_to_start(dtp, "vmlinux");
>   	}
>   
> -	if (state)
> +	if (state) {
> +		if (state->rfp)
> +			fclose(state->rfp);
> +
>   		dt_free(dtp, state);
> +	}
>   
>   	return 0;
>   }
