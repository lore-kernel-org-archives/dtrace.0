Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794000405;
	b=3nQs6P8WSeCXdXtRV2lcTCECbHYDjBQai3YupegNk4XZCBHwrYKdNA1hWW92rEaLeV9I
	 yGF6ioaDMsx2RFUD5q2HZHG8WqHKTAoc7/O16TtdBUOo9rWoT++DgPjNqcPEQQG/ifYy8
	 RT/Cda0cZ3OsieKy7Nz+0TBQ8Fbv+yId499bBHDRJTukGn5A/36EGQx3Y6WBW1Y0vNADI
	 htgkSC6mt4aUp+TemnOQUYCcecbvZcbxwuiaFJvlOlxD9v/lF1IxFnIUsbMwvS4vVznIt
	 f3F2eyX8s918EOIvBtcELy95PuL8pgPM6EBVbTi83JrqKUt7Rqg8hOnnZcXmKF7MdZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794000405;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID;
	bh=ZEf8qAPOEI2bnrYcwGwNPysKsZwvk1Sc3hnmeeouyYw=;
	b=uRnFpFg4SE01lp7QKj0E7fg+bxM1khTPJfoakR8KeygLMoQiB2kj51gPNP+11T6/PzDO
	 hoABqqLRwqllEnuiCkFLVHQaPucdbJ9DVpXv0A8XE5Dq295X5BBWBWW+q0YTXXN0unVFZ
	 jjkEoGHE8MPBdoYDhxfBlEPUzm/dkF96AR3h0gpkUkJWTNmGjvDityRjLyMlVHTxhwJN2
	 pCeNIFGbOmjHsMK7Vvx9TSwdgIW5a1ufg2F+ZBxAJta8S4L3IYakzUnn4cZ4SqBfRJlXm
	 iJTLDBkNadV3IXVe1nTAJJL0rfrX4gEfQpobsavYyO/tC8jkGrr0qm5Uq2oGJTh8EcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=XDxwaPHZ;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=OGP98spW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8A4606A326
	for <dtrace@lists.linux.dev>; Fri,  6 Nov 2026 21:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B8A4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=XDxwaPHZ;
	dkim=pass (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=OGP98spW
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6FSrFV2590975;
	Fri, 6 Nov 2026 21:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ZEf8qAPOEI2bnrYcwG
	wNPysKsZwvk1Sc3hnmeeouyYw=; b=XDxwaPHZrNZsp7qVIRYUJoj4mqG1S+lW/Z
	YVIyTF3zbcviPdfoEiYnFqEM8n5HfmnUyFr5QB46l8qSCDkZTG9qweFa9F3i6iCv
	Mftnmqc4Q7cs6RDabsrIwL6H3W1CWu5B9Z/hHaQWLZABcrJ378mJWAKifXN9he4p
	RYSkIs6Ajryz77OEtCxHsr0RDORMR6n5OjECiINtG613r1ewoBGqQEzht3WXjP9f
	JE7DZzg+6y8tcTYWJzm+RSXLJt98WO42nPmDfzhlnBxZpXAyZVChlCgzs0IyReSf
	F1VLSTy4EWjKU8ILigiXZ0nMyS7J2u6Ki29VA6yYsnzGGq+NFtFQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hs3qkhfs2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 06 Nov 2026 21:26:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6LFGYg1646805;
	Fri, 6 Nov 2026 21:26:39 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010042.outbound.protection.outlook.com [52.101.193.42])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4hspn40a36-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL);
	Fri, 06 Nov 2026 21:26:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dx4eVcPGB7O9fp5Fs4yuNsRFXUZx+YUdIgfi28dbEt8j8il9Enkp7VDzThfiXrB/o0GNXP7ksE48JbLmESMxzLivTbWU/ZNNvjOJWgi/k8PFVzwPdyJWq+mZKEkR68gLYHaO6iapm3epkjpsuhZo8K7yj2y6iDT7ZbPjnde1/Nt2NM8COC5tkm24j3239lsv3GaSZ5GNrMC/Qk1Ghoc70ZN8DUFsdtw3x+ce7muMFQhUlQSVLVkIPDTSapgit7gKn1wOxFP6fBxB2NcLvhqx38tycIIMvZH3K5Q+QZI1KvteTqORhBHc/1EKDwWE3jzhefhV6bb5lhL2QCP6lwB1fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZEf8qAPOEI2bnrYcwGwNPysKsZwvk1Sc3hnmeeouyYw=;
 b=sxCH5SotqYhBNJKZOkK2Z4iw1ZXX7YQG8b7KjI8TZRYYoc7ra6KHAwLWgpLq897SFrc366R94qaBPlhjvf1ZvLJM/xkbbNdS7HUD0G9DCavptS5nC67TnafuUO94kWpBxDUy1+UIVMxoAqGiB0cE7p9SPYZMEvQC7+t3NnRnKqexfEgXLzYIRB3vb7WHpILTGx6IuO2yh3g2MrfWbxM5wNanC1vaUc8Py8xyHHh1eBBQTAGKbnqOYzvoHLptXgo87BTslGSpxjz7V5aGk2lc5nNDVMFw5L819UW29n+RyNwo+cK8HjmBHQoA6RCbDek2ytAzxTbSTs6PbHpeuGfK2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEf8qAPOEI2bnrYcwGwNPysKsZwvk1Sc3hnmeeouyYw=;
 b=OGP98spWgf93CLrp1Y5CZ9UfZXRHIJOGB7qmxwjqOLLyAkUugyxsRgsuKo9qv/xmOcnv4VPXKqFX0VcRbMf9Ftbnld1NYq/3B6asBxL+LVwEXSfnN0h6LE6HsVKDGUiyONjSiVcauUVOyUkW0cH+jM2rcdKU5wah6lHT9GZbIL4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by CH3PR10MB7835.namprd10.prod.outlook.com (2603:10b6:610:1af::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Fri, 6 Nov
 2026 21:26:36 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 21:26:35 +0000
Date: Fri, 6 Nov 2026 16:26:32 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nix@esperi.org.uk>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 14/20] test: detect strlen corruption of strtab rodata
 and zeros
Message-ID: <au5GCEkGWGdhNZDb@oracle.com>
References: <9a6be1ae2acce8402d1cf79e4a2e7b42@oracle.com>
 <87se1ertqu.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87se1ertqu.fsf@esperi.org.uk>
X-ClientProxiedBy: BLAPR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:208:36e::12) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|CH3PR10MB7835:EE_
X-MS-Office365-Filtering-Correlation-Id: 91b09ba3-7744-4831-23b1-08df3c4ca2a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|261021135927099003|10067099003|4143699003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Vp9hnEdgwf8k7Sjl8czBBQ1OaI+K7qPLR6wgroUTKBmtOWtt9toZxM2yeZy4KkRi2MVJSG4pvTCalDL9eprZsCTWtbTfIYx1VY0VN90YMWb4kx1N54UUYxgMzXdVu6rFYFq8NIVnJbVLoxmMecijiDYu3mE5fPh0brFP/LClzvLH3sYnnOIvp0M1B86fxLGPpn2HEEvauzoVtz/5mT7NsaHI9IBPg1N2isuIq9WOrmzl+GxPwy4MADGuZFlxZsubojIXVHMti9DlYKlTWfS5jwm4aQLjtOoyt14UrQqMWUh2aD6EtTLZxEv6Wo3seEL79SRK9x7+9jDjrJMlQB3MamLraTjOHoEXqu6l81gyPjsVpxI6uQ/85KvTR9a/48SjHZMmkULvsZi9hy8OP1Az1V39eEyeDUg64N+kcg4eXeACKqgY9aO5s5k4xX8BAiIm73fj9K1Gpv+NzAzGfXSwQbEePP4RJYGs/+ci+564up0HtQmOGRhNmkTtH8t6p6r+GsPVIpdOdq4qFm/virlnC5n/xzL+Zuw4x2vLs/jsEhwpnni4TVE+teuhZ5Zza9PlnZn0RjpCob6wEJ6ydRy2Ine5LFKiWxMVeklUpMm7P22IOiys8KL6HTIm4ffhPtN6LIL3jn89m44vtMTNMnlHzrXiwz2riQ0KnBC62AIaM/k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(261021135927099003)(10067099003)(4143699003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9rBPHq2i9fAt9GDeuvVN0JKLHzlyuPdLnWOT1p7dQs2EbLOEH1CXMruIIXgx?=
 =?us-ascii?Q?USSsonDUCfUVK08wSVIhM8UZZ3PlCO/SCwxNWtfGdFaoa2TcuohO9U3EW5rm?=
 =?us-ascii?Q?FSDYMjokjadiWi06hftBcGYKZzim6MI/F/cwSeCABwvhqnmLNFtIh9Gv9+m8?=
 =?us-ascii?Q?cVHtFHJZ8NZagMTLoxUpgOBnVXUgXzDQaUFlcNLSCVC7pP1Lz3fyyU6Dhxrb?=
 =?us-ascii?Q?tFyPsyxGrGxnuhzzz3eXvTPE28yhmiVe5nuhIFlPXkbYRlEeFUzQlLYgNBiG?=
 =?us-ascii?Q?UvWEvj41n/ywjqWtQiAYn0Vu2rxcttj4u0DbD0WhLGQzvrG1jokCEKXJM9Az?=
 =?us-ascii?Q?2n4sDHQHjWF/tv7XJh5an56vyL0lUFEWYr3Y1ntI9KNlCYp8uc7oHdkciMkR?=
 =?us-ascii?Q?Hgq2WJAzDCtgGL3ZH9LxcNhwuWYBXC9U4cG/Ml5PPFs/xVFMV0AYFRCBSTpU?=
 =?us-ascii?Q?jaQL1vDxfVHIyu2ODYlZ6KwPiXKHdTCc1G2icAIARdlU1jpEsDoeP1iGVjJk?=
 =?us-ascii?Q?spQ9pdRtoghvMPzmO/avcrCz7MVnG1GVDgdmDB4pATRX9YwmAxBEGWKpJfaf?=
 =?us-ascii?Q?0KCz9si3+3d5crs+33h8aZwWh4BWcaoSBOboSdXbSsosRRkK2PaggmXJcsQl?=
 =?us-ascii?Q?+i2IRnUbTFljxrBKI2HUK+84P+UBhU48K9ERROueoxSmob9lDDZ7+ohh4g1o?=
 =?us-ascii?Q?NXnOQsCcD3IhdgEV4DupwqWofikLNPUnmV0bNPZ34OcGihvmB6pMJ4eK6i6S?=
 =?us-ascii?Q?8vELbJyTLDl+rtZt8WhG/Z0v1eZjfTd0+T7JHVZ6TOZojL9r8EKgSHjLM/j6?=
 =?us-ascii?Q?ITY9VNrK8rZW2gOQaABm2GICEqo7hzUDb8bXYxr0Te9qQVdE41kE+PXgCdEm?=
 =?us-ascii?Q?wKLpwlR9FPe1p9Wl+y0XV8h4dKbEuVhOadPUtVRYM/eoRydYtcFodDcmUtZ7?=
 =?us-ascii?Q?YlEEkez9Y7ovoquJjr5DWO1DWxBKBnn/UHrS38AojDg83V5ffrxQCUQA/BYZ?=
 =?us-ascii?Q?kjmg4g+ApPsPWsbblmfGeKVBxFPIM7+iWb4woQwWLnhauhvNjJeoylZavVCo?=
 =?us-ascii?Q?jcqvTRxU4yfNYkU3TyR+wLYmJpz7HB1IDkpAA1FbNIk6Zog0av/APTPptEQO?=
 =?us-ascii?Q?DnPS+IWeU/2w1A1ZarGGufDPp0XqZhQFLansQbaHVtIFugxzflHHapbLdATL?=
 =?us-ascii?Q?SzyZenCsmsRJ5VjaIQab2KD16k1UlotqpauyH6TDYG8ZZPvHE6TUCTXFTN8J?=
 =?us-ascii?Q?F4atZKZMduxt52fjx9QGAIWKEDS/t/CsvUc/hXGSpye+Z3VCXkJE7D3hQobx?=
 =?us-ascii?Q?8k6gVv3Xj88XyU7F6kYhHrU1EhOsDB5YGaoz8McL1Xx3T0cVapP3RULqq0P6?=
 =?us-ascii?Q?Ew9d0cz/OdOYYCvDO+QsSRGF7LvxsmvApW/YAS7wJc+dSRhDRtouPTKlw7FP?=
 =?us-ascii?Q?5W0OwxRPFPfuqi5AnirEj5JnzGNbraMIknfyNLSJcvdVWm8J6Nxq8MjoaJlA?=
 =?us-ascii?Q?PLk1F9HC8erhsRO6LoCcNTmSmmY5S/q6TBN9tV6S18znXx9Av3F3z3OvZSEI?=
 =?us-ascii?Q?q0SRqx2Gs/2EHlQZ1FvexEg5jKiaeaA5d+YKYoVLgg2nYFZ34BFGntMcqnoB?=
 =?us-ascii?Q?gEPs4c6EJRV+SooY+aZH8bgrGvO5Vk2wF+6ovn3pRVyND+18oSIfrbneuFeu?=
 =?us-ascii?Q?G6EYAoNsDpihFf9D2QoDJ5LeuYZ2JU2bVbIHQW7+mBKg2h//3MKbusH56dL2?=
 =?us-ascii?Q?yFCPEI/t8A=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	ZjrB7XUWYakrBRSz55jLrEPWlLgZSVOz8Blk7PoVTxxO8k6T1GjpO8lgwOAxOCmn5Vea1cjxE0n0Xqcu05wuSLK3uJCyNXb4+c2jU9pWP2MmDOONEHFBhQb023v108tJ210KkRg75frZCuTgnF27vluPyUCDce4qG070ayWKrfBF3cOnAMrdlvq43hApB3GYNGf/gmqIacmaD8eDBmxlDjlgYGqwyZ3MJYGb7+Q5CEEtdNGZracMMbsb95w3K9R8LIeTwPXDD32ztv7A1ojTnAyGxO1R/ERdUVs/nSstfg1mz/j2QfcXFssh3mgZC9+tM972Hb39yK/pXjBCiLW+4A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	A4SOEss+pEdD9YgT3Y/IEicKODlejArfSYOTHQvkxMf2mHb3pYBUy0BBzHUzhpL5wF9/JVdCzJhIIzd0Y/PFPl1iOQkg2i9BmUOqMWETFhRc1PU4gXHuUIgwj53XUdlL6t98ldV2HF0IBXfG2ZN/+8dZ0osQbahtU8BpwRg6U3aWbgmD2/ePTwaVCQnEt1BH6rHVSMZLrUYxgqZXGiHPhErFJ5qsOZMp5BTGEp0EO4lc8OfrWF8bKlUMvIyY/RzT5SBlgXFnSlrKbfwRXMi6yeNvm3P8MEBpP8PqTthb5GFKyZUKQ90DXpOY+68BBMdKsSlNL86hJu0/Ha61a31yBnf7gL+GC8wxNDMS7QatS7toZ92wpYm03abG+3x9N2MYyqJH1sAW21PQOkkn/Fy/uyUjHB7ggZcqwJYda1iD/uepko4JYnNxzrakgkeyUOCdUxoY5Sqc6wTcJeRJMDALM8qH4jJirRpoVcsunx8qcTUhVgX6ACRo8futsH4kFvEcZVoJ5he+QT/+nbBg6nmrfrIP5n5kI+xdN2c7Dit0cd9/1JkrybHs73m7TesA4bfBuY7vRt6jfRxllxNT3ecq/nFsqfCHW4euQhLabSJ3i4c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91b09ba3-7744-4831-23b1-08df3c4ca2a2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 21:26:35.4683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kicdqdl1RuBSeQmv8Ng5cWaBAQvMxsGk6yFoISZgoZtThZQlosFzQW63xB/fI34lvEoZjVn7Jx9519akcVSEIJFOjZ5KfvGkRq6zJFUEb58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7835
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 mlxlogscore=746 bulkscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060085
X-Proofpoint-GUID: bcZrqzNm4BormjXggapy6FIwInx7b16o
X-Authority-Analysis: v=2.4 cv=cddHPXDM c=1 sm=1 tr=0 ts=6aee460f b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x4eqshVgHu-cdnggieHk:22 a=RKT_FzslT5I5EhtP1kcA:9
 a=CjuIK1q_8ugA:10 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf
 awl=host:12100
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA4NSBTYWx0ZWRfX8c+IEIyACU76
 /EH91+0qCNhCBjpED2RbL18ajPFR5y/r7nRAGKT85RoVqwVv+HoVvi4/6fgx8ANfpT7g+QN9G6V
 ouHDVU4ZOsA5e+uZ/abAoBrdeVxvdp6DdjTaNl9dohUzE0zew40m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA4NSBTYWx0ZWRfXx2wpgv80MMaf
 r52eaqqKulemq20k44FBDcPl670p/WF16Zh4yx4KRJIanTxQp1Py6Mg1DfqvRl1GQCd4o1U32jA
 U5fP/AgURbEh5ZsqYNFfNo0aYOuDrTtmVMhOK6DQ/vT84CIif3h5/m6arJg6ktCRreNsOkoinTJ
 AkjIP8pEMLszSxPyf/oybzyUZmxlNrWOI/iJMqMRCDhZD9UCHNi6w8JhKsbJJx3ID+TIRpvPiML
 zYjiwGRXleT1jR7ktXko/7jsi2MpxUJ8YZFQqg2o+LvTjHOcZ37A7xxdeQTxThq3ddH8bOj1HiC
 a4n7Hc1tnva6PlKTMbvLm5EZnqSij/Er+mnRxEniM/aWVpoOk5qQuZdAJ+qAYI59cDoeqRKpiOp
 A/oZKxBz9nwji1J8O6U/YmqF4J3lAm+AUb1NIAMZX5lqOFFYWjT1b644CtZ84scuF+fspMguo+6
 o7Zd/A3kju+5/QMNaY0PryeZOa3L6/qabBOxieaE=
X-Proofpoint-ORIG-GUID: bcZrqzNm4BormjXggapy6FIwInx7b16o

On Fri, Nov 06, 2026 at 01:10:01PM +0000, Nick Alcock wrote:
> On 30 Oct 2026, Kris Van Hees verbalised:
> 
> > + * ASSERTION: strlen() must not overwrite the IPv6 lookup table in the
> > + *            rodata block of the strtab map.
> 
> ... I'm not surprised you didn't spot this. Who would expect a strlen to
> overwrite anything? But now it works via dt_bpf_probe_read_str, it's
> writing into (a temporary entry in) the strtab as a side-effect, with a
> STRSZ max...

So, R-b?
