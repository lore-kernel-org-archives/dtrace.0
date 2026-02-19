Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C052571D7
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 18:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771524956; cv=fail; b=e0Fil8jcCgV540TbOOTB8ptP6nSZEqKQHmiSaXDwgk2daeXlc2+eUkqv/qTXSlgThF+ZhzObVrAZBqFEWljP3K9Z4U+EnnLtgWyjAZ6cj4gfaN315uHhDa3pnrgPsH8SgYHUTRkqafF8aqiaC4wFUWWR0mhqqHBnXdf4ZTfiUIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771524956; c=relaxed/simple;
	bh=o4s9ipxUnCZih2aWaLrR9AzuW6HT1FY0u3R/EQbft6Y=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FlhMgkeUnSf9fw5nLygL6204zRjjUG9yHeKillEYNqwUj9zOI242r1Erhu1pHAhnDxYWnGW+Ev3cz54im8hET1pTuGqRRoup0Kg9yn23lCNx2KSQHU+ogm7OVAgoZth6i9EyZFImlvKwBf0rh8FH8TeI3B7GwzOIZ3yK+OWaAi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=sITiikGw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=y0qHwvnO; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sITiikGw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="y0qHwvnO"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JGwOCp250938
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 18:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=jRefgLIAoub5rt35848MIuk4bPfZwNtvCuEQS+H4ifg=; b=
	sITiikGwDR4n5irlAMx02N2CS14GpN3g5ooZSO9d51rYt/AjrD+1OpEtoAIAGTN5
	oeozfRBJEZYQ9t4TU5DK2gOCmYQ0PAmsokx3U6zFEqgsCoPq/vcvgX+lEH4XXbw3
	4lujdcD80HB3g6Fgeb57+L7qULxt/hg1HfiZdSXApoQWzeFQ9dk2s2UHc/i1D/+w
	9Lo+9nX4mklceVzoWIullOKXmd5JT4rsYNikqE1tdND2VKrF3tTharZMtUduu8Bt
	lY1g4KOZvrgpDLGy6ApZbVsgznd/C67zqLolV2zKHFF3KRr++yTORS5YNhpt4Aiv
	SuGyxWHQ+NJvXWbWm7L6hA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj0wqxmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 18:15:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61JGoUWR033223
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 18:15:52 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013054.outbound.protection.outlook.com [40.107.201.54])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ccb22rkwv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 18:15:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=faK+di89rJeRWNkAbuSZMcb0bIcxzp7l5spM5lQsMoF0C4m++RSV8MLLC7I6WWjFjLr5KCEC0db0aTVikd0W/ikYg6wVmmJh/IK1D6cDfulYiteHRtVmInTVMf8uEQSFh1tRVyyLMUsfDeKIvV+PpfrJV5IdrTulP5WVea5NhMSQCDIdz2z2ynqKUTZqNopErgHCmXZOkPCio3Ifig8G4JHwZM642Da+6RMh/+XIfnGnMJxnUpO7I7QYjwkCoDCzzZMEfp7x8COBrD1dCtt7txelFpMbUx2RAgUPK9XUz6VkL6ySA1HwBqhgQf4YCNnnsQiECjt4vWkM3D86VkpHew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRefgLIAoub5rt35848MIuk4bPfZwNtvCuEQS+H4ifg=;
 b=pnDUz/z87LuZyPgggKcIWkC645ZldvMv1BRJpZSeglXnMl2hzNhPZ5tQL1GlYY0P2XPDUfhTRa8XpJsBpBiQD0pAtCCbvDYXUDI/pndR2ROfIgU/Ewl6fSTZ6D45eofuMWH2NGU3s1sqIlgh0VC6JSzVqvQY351aulLnQnshq8VtwNSPRUnn+n/FPX4lsux3pEzQPMu//hsfq+meK3H2lls58m8f/62Y9jsg6QBVjSC+rvpAatqfEDqDU3vhrRYJrEsZ8EjRFOJ5Rwy/+j0XB0q6XNkmYQhri3lmnpII2R+vezXWYyRk+CXzw0X48dU/V3PDNkUV99YMroji4zNgTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRefgLIAoub5rt35848MIuk4bPfZwNtvCuEQS+H4ifg=;
 b=y0qHwvnOhelveVBpHKYQxIHtHCzP+TI1uThdgbWTh+Nv5b6sW6ciHMGzw75FYevltIZ1ZLCs4Bl7tz9zOTvpYSYNwDP8vnfU51by2qXLQt5e9edhrhDI1d6cI8HwBuQTmQqfP7JBYajaACbZjmg0lqeP9a+patH+cY35PpeHy4s=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7408.namprd10.prod.outlook.com (2603:10b6:8:15d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Thu, 19 Feb
 2026 18:15:47 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 18:15:47 +0000
Message-ID: <b5e39f42-8157-04dc-70f8-90633c9cefe0@oracle.com>
Date: Thu, 19 Feb 2026 13:15:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] configure: add support for --disable-option-checking
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB7522D2C2960EE7C218C971F5C26BA@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB7522D2C2960EE7C218C971F5C26BA@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7PR17CA0030.namprd17.prod.outlook.com
 (2603:10b6:510:323::25) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7408:EE_
X-MS-Office365-Filtering-Correlation-Id: eb98ae90-e714-477d-e2b0-08de6fe2e7a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UkVYUnZTVUlrSzlPUWRBKzhyOUtzTkd6V3dRaUhPckZFUXZCQUl3ZSs3cmtv?=
 =?utf-8?B?K2dycExESVR0VTVRN2R0cGtjMC9qazB4dzhycEYrbEVzRTlab2tZcXdVbGJH?=
 =?utf-8?B?NXYvVVgyQkdEa2RsbWVvOXA3aUpkQVlBR0lZS0hkR0F1MFM5V3VNLys5ZjlQ?=
 =?utf-8?B?NjI1bFJKU3VRS3BtQ1FUYWYwU0ZPN2hSRzJRRjZVMXpHVUpvVVY4NTlMbXMv?=
 =?utf-8?B?SFI3bkFVbDJpYUdiWlg2a3hWSUNjNENpTDBHbmc5N0FZbWlvdTBDVkVsMC94?=
 =?utf-8?B?UVN5K3J5c1k1aE5WOWc5VTJJcXl5OG44QWRNU3ZSb2hJSWhad1BOQVFtK21T?=
 =?utf-8?B?STYwVmd0UG5NMWNTTSs3bGlXSDZzVnp5cUNldmIvbGZ2OEtQUm1iNE5vTUwv?=
 =?utf-8?B?M1pDRm0waTNLRkxMU2lPMnp0K29PQ2dnbDRYMGZIN3NZbFlxVGg0N0tybmRF?=
 =?utf-8?B?SUQ2R0toU2NiVXRiazFwdmk4QU5YY1Jkc0hzS3V1NFdMU2NXZTJ5ZDZwRzZ1?=
 =?utf-8?B?QnNRUEJRTm96SHJoSjh0LzQwZTVsSVNrd2k4cU1zK1dtd0VFbjFYSFo2Qi9K?=
 =?utf-8?B?bm5NWmJMV3NSMDIzYzJzQmszK2hvM0hsczVUamFDZ0xsNGMwR2ZqcDJDU0hJ?=
 =?utf-8?B?dTZZc0p5dlNBZitFeGo1cFlicUNsc2k5Q1cxVGdCRDBBUFY5OUVadG5yUElm?=
 =?utf-8?B?NGpCT2w3RjRZMkVmWCtwREIrand2NVg4WnAyQzFHSU92NlpYVW4wdGFaVk9r?=
 =?utf-8?B?a2lvUVFVbXJqQXJMdnJFVkpnMlBmb3ZnOXBEekhXY1RzbGk4S1RkU1V5TTFM?=
 =?utf-8?B?MTZIL0tNYXdyWURVV3hLb0xIUUVVUnlueTFpZzRWQ0lERnhXRStkR2htMHNp?=
 =?utf-8?B?TWRQYjVlVi9kRWV3NXdIV09qdUdtdklab3RqTE03QzErZ0UvcDNCeWVJRVNa?=
 =?utf-8?B?SGpWWkFhcXdPN1FiQ2pha0c5WmRsR25xbmFOR0lqV1hLV1VxUnIzaEdyMjNk?=
 =?utf-8?B?S20rOUhDRlc1Wmo1RTQ5NlE3UW5oVEtsYkVCVmFZRHgvOERVamIwL0RObTVB?=
 =?utf-8?B?cFRaQ2xETDNYTGdnYVhNZFBZM0U1WEVQQjEySWgrSUZWbmVsM1ozOXNjSFcx?=
 =?utf-8?B?L25QMlBtdUszQ0xJcTFqcW01UGphblRHV0VrdW9CYVZMMkUwR1pDcFZFM2t4?=
 =?utf-8?B?bnRNemdLcy9pMUxRcGVwY094Myt3bjFLZXBISFljQ3d0cVF1ZStPY1NJUmZP?=
 =?utf-8?B?QXN5RS9mL1FTSGdrSWNQK01RdzJrSlNaeGY1MVMzd1pQZytoYU1XTHUxUFhZ?=
 =?utf-8?B?UXBiUm1aU3c3ZTk5RDl5NXMyNzNFZWw5ZVlLM0U5clZkaFZzQUFrWnRxMzhK?=
 =?utf-8?B?cUgzVDRFdEp1KzFoNUowenVwZDZLTkRxUEp3Vmg5KzhFUkRicVZkSFZudWtS?=
 =?utf-8?B?MTN2VjdJSWlncjBLL3Urc3dweGNKRmRLYUNXc3k5NFhFUmJxZXEzWWFkaTZP?=
 =?utf-8?B?dlF6N3RLNzk4cXQxZHRnd3JuZ3NKMThhblJHdXdwWDUzMGI3L0d4TVZ2RG9X?=
 =?utf-8?B?cHdDNy9KWGphc3VLeXVIT29keU9PU0dVWVB2M0d1MkxRK1JGcTJ5VndaNUxZ?=
 =?utf-8?B?d3hOa05uVWVaaDBiQXVmcmF5d3d0dG1lT1pnY0E5YmlhWkRXY0x2YUlNR3E5?=
 =?utf-8?B?M2Iwbng0R00rMmtlN0ZzNzI4WUJ0S1pnZ0pJVEdoMGRiNWplTEs0NnprSE1u?=
 =?utf-8?B?Wmo3VmYyS1JueVI5TTZnUGtTMVB2YUlsaXRtOURxM3hNVVA4clgyNFhEaHVR?=
 =?utf-8?B?SkdHbVpEVzl6NEFMVXdQd21lN3NKa1NGekxDN1owUkYyNCt3amNYOExGZVI5?=
 =?utf-8?B?aFFBSTEwbzRmdkNQVVpIakRkM2Z2Uk5JV3N6VHBhdUQrOGFzaWtjTGFiakl2?=
 =?utf-8?B?cWxEKzVsVjZLUEo0OTJJTGwwUUtDR0pQdEZmQUJiSU4ralVzcGNIdFFBYk1R?=
 =?utf-8?B?aGF4VHh2dWxzUXpNaXVlSnpjOFhQaVpWZEU4cU5uRmUySlVDQUQ5SEx1YXln?=
 =?utf-8?B?aVdLdSt2SWdSWU03R2ZPTFI5dC8wdUhSVERHTVV4T3laZ3Jua2Y3V3FOSUoz?=
 =?utf-8?Q?ImJU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVZDbUphUWNLTkhEa0FkMU5YaW92SEhpTEhRMjN0MFFxTHhMczRwRGRXdXIy?=
 =?utf-8?B?YWlSWUpmQUtxaUNEY0xlNjF5Z3EySHhOVWIwSEU2UEJQRjBlT0kzbktLM211?=
 =?utf-8?B?TlR3aFpQZndraHFudkNNRCswYkRmWW1wQXF0SkM5OExTa0tKUVRaMTdrd3Vz?=
 =?utf-8?B?anhiZDVMb2VtSFJjWVFIcWdVS3hiTlo1bm5xVHZIdzl1SlNBZHdhd2ZqWXVx?=
 =?utf-8?B?ckc0ejk2TlJPdVpGQ1ZkbW9XVnI5SlYyVlFxSmpUNFY2UVdsSjdEeDcyRS8v?=
 =?utf-8?B?UE9YaXAvTjNhVHNxMnM4bmdOVzZZOTN4UG5aOU8vKzYwQ0krNEhBUXpHT3NP?=
 =?utf-8?B?VG9oNmRrYXJEWWFUUTJ5VkhWZUFDbFBJR1JJY3NNVEVoU0YzZHV3dXgrZklt?=
 =?utf-8?B?RU5McGY2WjBKNUhqYTdseHVxb1VFL3lIbUh0UlBxK3pWck1IdGJvUWp2eGl1?=
 =?utf-8?B?V1RXZ1RwU1ZWazl5N2tKaHh0ZDJjY1QwcUJVSHBudURvdURjdUVUcC9zYUpF?=
 =?utf-8?B?bHErVmt6RHFRN3dLK1dFVGpvZXJHQTFMNXQzbzRMYkgrTWFQN1lwZmlvaTJm?=
 =?utf-8?B?YWFqSlUyRldnaGxNeWErNENkN1orYVY1WjFtY08veUFxZlQ3VVFDM2JKTFcy?=
 =?utf-8?B?SWRKUUJmUlJsbkhvdFc1dlRBaEFCTU5WTVNJakU5NjBna0tLWjgwY0dlZHVq?=
 =?utf-8?B?VmhQbWYrME00SDdqVm9xQ0xRR0pYMkhKT2p6cDhpOGFnVnliSDBWb0VET0VQ?=
 =?utf-8?B?Ri8rMDIyVDRnWHVvdHp0bVJhcTNlak1ReEs1K1J3T00zQ3JJdUd0TFR0bVow?=
 =?utf-8?B?eVA5MitLbFNFZUp3ME5VRkFMazMxeDBQY1NNclVla0RhUmZraHdoOHdueFRt?=
 =?utf-8?B?QzRiSnBoZ3EzNkZHaFZHVm5lTkhnVkJMVVJWaVJpWi9UKzVCUzZOU3EwLzBC?=
 =?utf-8?B?cmhHbnh2aE4vcERScmlMUWhHdmt4Y2RCaVB2TktZdGt3RDZSUCtmOWdRNDFa?=
 =?utf-8?B?OVlTejUxU3ZHTU5HZWVGOUZoQW1peGFPN2FTVngxeDBnRUZXSkR5bVZ3cHZY?=
 =?utf-8?B?cGJnZWlYY0xXbW51eXZlSlF5NE9CeW5VKzBqZ2czdnJTWUVzN0RRWERodlRI?=
 =?utf-8?B?ZkZ6OXJ1S1ZlbVJLc29HbFVOa282d2poNk9aVElEem42UTB5KzFlRm90VTk4?=
 =?utf-8?B?QVBaUVBKVm5lZGRlUStWdm1jVGRqWnlHU0NSQ3E5Z09vNWY0WjRqcjd0eDYv?=
 =?utf-8?B?YkFJa05XR0lOTVNzbm1yREZ4cGt5SU5ZTW5mb3lBMGFRa1d5clVsN0ZNMUdO?=
 =?utf-8?B?aE83bXN0NzVzTUZvcTN0Y0gxcHlGR3ZtWUVLeWU3ZTZnQURzL1JKaWk0NVdO?=
 =?utf-8?B?N3loUDA5dHFOMXVQbnA3N1BQdVdaZGRkV1BVZElpeDdVZW04Wk00aVN0dWR5?=
 =?utf-8?B?NkFPNWttaGZjVnpCRE1YSzFiTG1PY2cxVTBCRWcrbkRvMXJnSERGL0lEOEd2?=
 =?utf-8?B?bXg3R0orRmpTMzlPeFZYU1J4dFZ0NWg4ejFHd2dmeUxRWm1FRHN3T2lYY2Fl?=
 =?utf-8?B?ZWY5UUtMSUNYenByTkJFaXVNNi9mSW51K2VKcHd6eWNTMVl2T2lYY09BY29B?=
 =?utf-8?B?ek9XYklnSytteHFhcGJPeWNiZzlPNW1FTWYrOTBCaW8rYzhOQk1XVEJwbzUx?=
 =?utf-8?B?VzhVOE5Xc2xKWlcrazdETVNqOXlNbHQ5WTZPWC9XWWtieFNhVjM0eCtYVDZ0?=
 =?utf-8?B?Q0JGbHV3dUNYSVVGRS9VbXdJdmVOSkdodUhxV21LSitOcGM1R1ZRVm1xam1z?=
 =?utf-8?B?Y0kvRm1tS2V5RWtrZHNxTDdoeXpra1JZdmdMSzJsZzJZa3dGQzkvSDBzdTgv?=
 =?utf-8?B?dnJBSnM5aUdZYk5PKzhuZW9HdW1HWFRBL2VMcGNRcC9tS3MrUDBmSDJzOU9S?=
 =?utf-8?B?ejU5aXVtNHUzRVhwcWF4R09VTGlHTEpWZEFidDB2ZEdzSWxCVXlpckJKWnRM?=
 =?utf-8?B?MEVpZnM0NjAvMXpSa2lUYW1FbzlQVjZkUkdGa1BCRmtSK1FRdWhrdllOeVIz?=
 =?utf-8?B?ZmY4Tmx5VjBmZGhkWlpTZm1ORnEvbElqK2cybjNYS0pTRDBWUHZmZzV1T09R?=
 =?utf-8?B?T3kwNTc1SXkvckVDWXc1cEttK1ladXJjSHpwVENITWViTElXL1pYR3hLSnZx?=
 =?utf-8?B?alpSekh5bGNKU2RraHY0ZHdXUXh2dVVtaHY4M0pQaDJRVGJ0YkdDZ1ZqZnNR?=
 =?utf-8?B?eDR1TklZOUNkUk1QSzY0ZWtVT3VQdTRZeU9hVHhIN1hTblppSzdJVTRkQzJh?=
 =?utf-8?B?NU15Ukl2c3VueWJ2Nzh1VSt5RDN0YzVaOUNBbHlKdXBlb0NXdmxjZz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	55CQSmdS5z6trNPB46VbbuCZ9htkxJ3iobU7X6YsuKynLM1k5Ervid1lbEcHBtrc98+tfhJkXzp6UWFilmLGqiYDCS60VEU/S/oSMq0is1ETvFxH/s3vOX1SMdac8/kAxK00B9W3+t4sESTUc2v9rir71pqjKIuS/10DX3QP4kMjARVZgZ7uaLAu3JuhaxpMIfjZItHD7+nIYZKM18aaOVG8pCCi4a8hQX0AKWfuYKswWwiEBrAJh0pc6srh2Wxe4sujnTW+IpXVOgaUXFm2A06cuS/rp8rFjqp7dRXTZ4flkYvj5Q2lIFSq86pNSiY3Q0+yKNyF8IS2PucH0CzerYuL7XqA5twVJ3ROfRQd2AX9zfgHjzc7Rwf6jrqQCMo+lCOEHgDBcE2JGZZUwkakpX3MTUlPBP9SowENTUQzki8c+nON46BIbeh+1ZEFw1kQOrEgOZGRG6M/JOrWdtdG5jnnI010SmpFOx/wR1wPYRRLAzaDV7dmrsRBsgzII683tUQBiAFo8IIT7t/vjbLQ2yyHBimfptAzBBiDdzW/chyrEMpNNPE6YuFzU2a3XWTOWZrf92zY8ahUO1sfR49iZvZ1AE2Heysa4ktLe40qHsg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb98ae90-e714-477d-e2b0-08de6fe2e7a0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 18:15:47.3992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+TE0ekkPDOwEZ3y3LmubL+cXD/Oau9DPdWL+E9ooWTIaDF6Qo59l3RuOqu7hvynTlcYyvNZ2lalCbnV7x2Lkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7408
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602190165
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE2NSBTYWx0ZWRfX6HbLlqZRcgV+
 Cv2dtU43UfV0k7HdJarg8jii3oV57aQBBg9tGHm8i4eZ2SlQsgatIu8QCoXYAxBkunmXRkFmeK5
 ZUpGsInwfNmG46mOi9w99A4Zv/RTaU5fd9hyhyUC/ES429ERrczdL9WCQp0I3CM6zzUfrfFTSzy
 GHPSBxf/1O0nZY+6FCeRmmywDKOLXsUqaS55bEpMl92/HB++R5cOvRP4cxSdlNqM9bXSmbCYNX9
 f7R6xl+SVMdRB+N7I72Ron1EWro8O3ykoD3nWjCEKFnHnJh4eKlyK/Et7LfYAnxme41Qb8Ae6j8
 bNpJ6+H7+rj6rbp53Kozild8zog0VFABq/TeIZ/Odlw8qH1qL3gSSgvXbfYB1olNw0Fgg2U8Myy
 jBol0qL+rMsuwShvQE+MRtJP0aMEIyQ0zIS5RZHTA9fqOf4bx3JNEyMhooEpeq+Ac/zPaLF86xi
 y32N6y7nMoUCEjYmzvg==
X-Authority-Analysis: v=2.4 cv=ZMfaWH7b c=1 sm=1 tr=0 ts=69975359 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=shsdTtzfyazyZ1x-ce0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: QhmCs7JnZB_F8e6Vg3OVcGgQTMbVkJ1e
X-Proofpoint-GUID: QhmCs7JnZB_F8e6Vg3OVcGgQTMbVkJ1e

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 2/19/26 10:56, Kris Van Hees wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   configure | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/configure b/configure
> index a3107fd0..cb2f585a 100755
> --- a/configure
> +++ b/configure
> @@ -101,6 +101,7 @@ EOF
>           cat >&2 <<'EOF'
>   Optional features:
>   
> +--disable-option-checking	Ignore unrecognized --enable/--with options
>   --disable-dependency-tracking	Suppress automatic dependency tracking
>   
>   Options controlling the compiler (pass on the command line):
> @@ -126,6 +127,11 @@ rm -rf build/.config.new build/.config-vars.mk.new
>   echo 'override CONFIGURED_VARS=' > build/.config-vars.mk.new
>   trap 'rm -rf build/.config.new build/.config-vars.mk.new' ERR
>   
> +# Should we report unknown --disable/enable/with/without-* options?
> +if echo " $@ " | grep ' --disable-option-checking ' &>/dev/null; then
> +   no_check_opts=t
> +fi
> +
>   for option in "$@"; do
>       case "$option" in
>           --help) help; exit 1;;
> @@ -177,6 +183,11 @@ for option in "$@"; do
>           HAVE_BPFMASM=*) write_config_var BPFMASM "$option";;
>           --disable-dependency-tracking) write_make_var WITHOUT_DEPENDENCIES "y";;
>           --enable-dependency-tracking) write_make_var WITHOUT_DEPENDENCIES "n";;
> +        --disable-*|--enable-*|--with-*|--without-*)
> +           if [[ -z $no_check_opts ]]; then
> +              echo "Unknown option $option" >&2
> +              exit 1
> +           fi;;
>           *) echo "Unknown option $option" >&2
>              exit 1;;
>       esac
