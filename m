Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918B4202C50
	for <dtrace@lists.linux.dev>; Thu,  1 May 2025 15:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746113975; cv=fail; b=BgqJQ3ucVubiK04Ks4HVjwDw603H+a4E4r+rlpNIKkmIP+NEXzrugxaVlIfYVK1FGa7WWi5I3DzeRxs09IdUHnX9hm6kvdYClQR9I8AQ8X6naRRMSWOfqVLf/JcD4fh1AZ16FO/2G2oydYZJ80X0Iar3O6wKq3dkHRA22lpBfd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746113975; c=relaxed/simple;
	bh=cVHRkVZAV3TF9ixO9f8sWslL+BZ8uLsG6y+2tLHn81Y=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=W6T6ICPEhw4rJETQkBl/iIVl8WFtwMWdS5+1ee8ozdQMIPq6yE+C9Oyq9wmVoDQfLWVk56QzGS5pY8zvsOTotqmsCxNC2mvqCtutrFrTvhA7BP3j4kncHLEaOraC5+y5CsNDQ0zjiJ7H2VRE254InGqyBhvRHFsBMyW+q9IXspI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kJC4BLyc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RY5QI+MW; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kJC4BLyc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RY5QI+MW"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541Eu82r013764
	for <dtrace@lists.linux.dev>; Thu, 1 May 2025 15:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=GE/bCWcY6I5QkVzC2EDvPKBKmWjJIqxab0rIu2Mi4wI=; b=
	kJC4BLycPkggdVRh1KxUXq1DATwFgh6pIwYSk0d5bFQ/Ii4rv/970/COszU4Le8w
	4m7Nb9mEOU7FU3H8MCoqFZkxwlqEYLMtF10kdpw34PhMcB9sYKNfLI5SGwKCpy1t
	tbi0GWxWnPaldW2y+6ZY0Zm+YF24aKMSiBx8tLZ9qkVBoLlEcbEtu0a6B0R5lPz3
	1SjkF42Amu1uFxN6SfQXj7FUPop7fqblz9nzyNziSfmvhFZJ3Xvv4LMPhVq3Hnfv
	f+y6QcihtyftSAOJz3dZAe1gfcAMT82pDhdJ9GS/zGjCIiAElaceUL+OiIasbyLD
	m2mIZbGhhd9JQ28Yvaq2Vw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6usk8vr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 May 2025 15:39:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 541EeAu6035375
	for <dtrace@lists.linux.dev>; Thu, 1 May 2025 15:39:31 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nxceh7h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 May 2025 15:39:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FVZlhwRuggLZjAiXsboTsdPWia3M6Zrw2fWGU5WIeztBBzydEPuJQdfY1mfqI8i/UjGXR/QCrHuO2sI2CgCL1i3VOufnZBfNMBAz1YQcXGVPg5JcuEWDFFGXh11uPGpt0Qju3DSxiCZsxKY/mA1oHP0d+RdH6WiCH6R6rNgaaiIx15YxUW7llKOYwWfk/LJ94xqOojb2eY7VYUzQNswQRPpsqOua5I6U0V/4ldL3tmWebcDAdKYD3qG3HtWa4Y/LghPtf9CgdLCvjdR2zj2PrF7j+PlmB8KVjvPPSXN03/z7PNPTippfOM5HnqvQFsVeQbXVI5CTnfr20FZcB7m8Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GE/bCWcY6I5QkVzC2EDvPKBKmWjJIqxab0rIu2Mi4wI=;
 b=Ufth9Fiu75SogddjP3EHdEtHUHvjmCrUt8bUZtCHAWlR2DMrcNE6RnvLGUhWsrW4On62iJDCa1OpBm7od/Upyc2OPgpPYetKb6fuTbXDNWoYvDiJ9+iTAh4lHqEgdq6CrMiFdS/T5cROoMfqDYnjq+1b1fS20Fq9+1xH/RnjGPuf8XpPxyYqAOIDvFK3upsYC55inFG/ZCwK5BqtLPkf1rgob9Hn5na74puNnFgWkH4xdepUBqzWdphjJ0TNQ1l3rD91bLFA/74lhLfq+K7unRAk/MAdVad425UM6DYEYCe9I950cBGl4S7FzslNJuN2DjMWCTeB5xPLEsPbYuw7kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GE/bCWcY6I5QkVzC2EDvPKBKmWjJIqxab0rIu2Mi4wI=;
 b=RY5QI+MWNcE8iPVdyks1qxa8ocoW2AZ3WKyB1sfH1RwFqc+Wox4LjA1DSxoVDe5aKvu6DhzRRF2B59d2jrlEQaqGu8jugTi1e9LNdRqmrdPOWU/Eod9U3pJCuTA3vNXJECsqAVu4JWfaI6HXnZLUkyjcm1YW/BAQWebu+h6Jv1U=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH3PPFE03343C9B.namprd10.prod.outlook.com (2603:10b6:518:1::7d0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 1 May
 2025 15:38:56 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8678.028; Thu, 1 May 2025
 15:38:56 +0000
Message-ID: <7432c20d-bde2-86fc-2b8a-0706154c9048@oracle.com>
Date: Thu, 1 May 2025 11:38:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/4] providers: loop through all providers for discovery
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ5PPF7F7BBD994C343BCACE248CFE59A36C2822@SJ5PPF7F7BBD994.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ5PPF7F7BBD994C343BCACE248CFE59A36C2822@SJ5PPF7F7BBD994.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:a03:254::35) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH3PPFE03343C9B:EE_
X-MS-Office365-Filtering-Correlation-Id: 4be4e8c1-3b2a-47bc-42d0-08dd88c648ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TkRDVVQ1VHk0QmVVRFp2ajlPTk44VjQzeUVlWGVtRzA4TllabVplWTB0QzVK?=
 =?utf-8?B?QVlXM29QVEhnQjY3OVhlMzhVeHhndXJwSFl6di9RMTVxOFcxaEdzU2U5VTRk?=
 =?utf-8?B?T1pnTzBzalczVVdIN1RxeFp2N3RNTzJmVUhPZ2paVmthemVIcXgrY0x3dTZk?=
 =?utf-8?B?RnZlVDJSTVNCRXNOUmVWd1lGbTF0S2ZQbmNWRDZyNnRtYXdHYmxlaEg3cjFB?=
 =?utf-8?B?ZE5sS3FWZTIrNTR1eXpUdTVkQzhSSmx6TVM3TFh3UnRIQXJybEEzRkszQVFT?=
 =?utf-8?B?UTBkNlFIWEFuL2xxR3l4UjBVbE81MTQ2eUxVemkzdktYV0VUMlVPQjNDbDNY?=
 =?utf-8?B?MWJNWGw5NUFsbmFTV0V3VDdZbjh4Z3R4cmNiUFRXVm92T1o1eG5VdkpJTzJK?=
 =?utf-8?B?dWJPeTdmbnZDU2g1YlptNXJrN0xrRFMxRE0yUXkwb1RGQ2dja2l5OXMzY0Vk?=
 =?utf-8?B?NWJSWmZYUjljR2p6U3NSTDJETzA1VlUxbTMycDZ1eWhPOGZrb2d4NkZxQmlJ?=
 =?utf-8?B?WUV5ZzZldkFrM2pVcWw5dG1tbEhSc2h0bmJwZG4vVVdYOTJhR1VFZ1FzRU1Y?=
 =?utf-8?B?NmtMa3loVzJ1K2JSc2JaZWoxSlVkbnlyRnJIOWN2ZUhqN0VkTG9UNnpKb0JN?=
 =?utf-8?B?Z3c0OWVYb01oL0xvQ01JUGRMOEJEamxHNDkwb1V2NFc4NmpoUWgyVkJkRTVV?=
 =?utf-8?B?dmI3SE8xTjZ6MlB1RVRyWlpSamR1Q2p1aktsc3FqYWdCUGp4V0VrMS9FaTla?=
 =?utf-8?B?ZFdMdzJZd1pRbENER3dRbnV1ZDBEaW9TSElvVHFpVm1paUw0Y1B6VHJuNU9E?=
 =?utf-8?B?ZDZycVlFdzhDaU1iSzdwRVNodk9zSU5xQlFOMWwzVWphNFBFYllRSUFJelRz?=
 =?utf-8?B?QUphbUszL0RnQzZMMTM3V3FoVWYrNnpmMjBsdWZQcms0UkhJcWxFYVZKWTlL?=
 =?utf-8?B?Sks3SWZyZ1RSNFdUVWdxZjNRb0Z6M1Z1TmtEMEdUWWRFMWpZL0hHNHRKYjZr?=
 =?utf-8?B?WGRydStvV3IrT0YwMy9kWjNDT0RnOXhRVmdKeDN0Wmdkcjl5Q2JhREhvQy9h?=
 =?utf-8?B?NjNDdVE4NVRGMXN3QnZFanV1d1pvL2hJN2lZaWRsRmN5WlRKNFhpK1Vpdis2?=
 =?utf-8?B?QlRuenVBaEFmT1lqbEh2bDhuU0NNSkVScXJnUXNZaDF6bTRSRWxFc05IbkNt?=
 =?utf-8?B?bWc3UDRvWllQdkFMQUpCemtDM2N4YksySXZkWkhXOHowRWZBTUtMUGV2OWgz?=
 =?utf-8?B?Q2c2aFJpMUJhN2lYTTBxR2ZmNWJ4VFBUUlJKVmNtOEkzb0l2VE0xY2tDRkVN?=
 =?utf-8?B?MVZFMFFNU2JBbXVKdWI0djlHUGI4TzJ1NFhYY0N2NXVxSjJLcDU3amR5Tkkv?=
 =?utf-8?B?Tk05anR6b0FvOFRCTjJGckh2UHBBMWpLNXFhY0c4T2JrUGl0d3JVc1Frd3p5?=
 =?utf-8?B?NWxMMnd2bWlXRlk4ZUxwQit0OFRUdy9BUkJmdjBLZGJhZXMvaUVhVnBTbVVv?=
 =?utf-8?B?VGxCQU0zYkJKWUpOMUt2OGh4YTZmSHdjYjRHZVAwWjlTcno0UnFDcE4yd280?=
 =?utf-8?B?cjdHOGFXRlFUWnMvbzFhaXppbnNLTmVNRU9qYUNBM2d0TE9MZGNiZGJCYW5u?=
 =?utf-8?B?ajN6Mi9rVk12cXpFL29FVE9TQjdQYU5RN2RYR2piOVR6aVFQc00xbTRVWVYy?=
 =?utf-8?B?UFdaeFZkeGZ3bnc4ZEkxMGN1OVNRQ2VPR2NTelhpYnE4VjljN1VubE0yTWNq?=
 =?utf-8?B?VTlQN1VCWis5UVdraGk1S3FWSFVKTGdBNEtaL1dnWk1MeEV6RkZmeVBCUHNV?=
 =?utf-8?B?UmxWN211ZEtLOTdZdWNRZWI3VHY4ZDhWc3pxQjYyYUNRMEVEUE9lb2ozMEpO?=
 =?utf-8?B?RDlDS3VmV1FiVGJvblAzemV3a2MwUmNWMVNILzkveVhkSlQrODEwM09DNFh0?=
 =?utf-8?Q?LxmOPrx9PRw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTJYTmo4QnFxelhhc21MQTVCdURyS1JWVVVjaFNOUHU5STAzT0prSEVlanVw?=
 =?utf-8?B?NWNITjlHZ2lZZHhFb1ZWeXhSbklVbTE3Zm1NdG1VS0Z6WG9RTzV3Q1VKNkkz?=
 =?utf-8?B?eW8velowN3BqaW9mZUpqazFvWFk5QUNyY0VjTHJDSFkvazd2VTNqSXVwSklP?=
 =?utf-8?B?OE44b2pSci9RSmljVWNZVHNzZXNSWjlKTVlWZzNhOWhOVU5OeXA5Qmd5cU96?=
 =?utf-8?B?RFJ1M2F1bHNlaGtNZ3JpS0xTNnRrWjdiY3BtWngyYlZVTXIyb3l3ZC9mMkp5?=
 =?utf-8?B?MmhSUEN5UmNnMlhXc1lMLzFwSGVuQ2l0Y0tUSDZlcTFiOUc1UWhONXNyTmxz?=
 =?utf-8?B?QkVkaUxKM004Q2ZWSDQvbktsaFVQZVM4L0x0UXQ5dmlReVhRVVp5ZHpJdlhF?=
 =?utf-8?B?bE9FbUV0ZGkvQ3Zzc2orbEgvU0g5MkFmWXR5dkdNak5PNUJZa0pwKzBvQTJ1?=
 =?utf-8?B?NTFiUUhOZy9KZnF4aFpVK0JtV01qNmVkczNVSkMrWGdyQ252bEl3enpxYlI0?=
 =?utf-8?B?UUdmcHJveWUwRXUwamNNQ0pCSnBmc1RweUs3Sk14SFVQNWFoU2xKQUc0RlJG?=
 =?utf-8?B?WGhLOUd4ZFhlenZWeW1EYVNDcTFOckJmOUg5TEl5RnpHaXIwcEU1a2hpMUZY?=
 =?utf-8?B?UkY5TFI4T0ZZVDlodm10RmsxN0JzdU9DcWozSXBSVDJJcDNSZG92WVlqZ0VV?=
 =?utf-8?B?bWh4aTg2QU80ekZNYmwyNlgrUHFZeWQwYlE0NkszTXVSVTdENFc1UkQyVmhz?=
 =?utf-8?B?WDRBUDJYalNrVEdPRWYwNytNZHhRTHZPZjd3a0NnTmp5Q0JtSEc0MS9FYUJt?=
 =?utf-8?B?THAxWTE5Mmk1Y3dJUzNET3d3c2Vadi9PQytjdi9UVmdWbXF5bWczZ3pOSnUv?=
 =?utf-8?B?a2VTdEdCV1doSmIyVlpzVmM4QTUzb3FxUmlUK2x4VWNhSGw3alNiY1QvbG1W?=
 =?utf-8?B?eXB0aG83SkJtZjJqVTdGdHNuNjRFNlkzZHp4bnBLM0JjeHNNOUJtV1FpcTU0?=
 =?utf-8?B?THViNTNwWlNqaytMYVpGVGpBNWtlTk5BNmNqdGxhaEQ2cTdjWmxFNUxTTHFw?=
 =?utf-8?B?Y1kvYmgwMTNzQm5mUUQ2MDRzVk5Yc05TK1FHUGRFeDNVOENad3haMnhPYzlW?=
 =?utf-8?B?YU41TzZLaU9qT0VSdWNyU1U5ZldRdzJ5dGhzOW9NYzRwbEk3SFF2ajF5UUhw?=
 =?utf-8?B?bDA4dUdaZFpJTjdVQVlNWUMyZ1ZMU0U2clhlT2VmbTlQT2RkUmUzSHJzRVB3?=
 =?utf-8?B?ZWVQNVk3M0NlS2FIZlRBUGRuVktRbStOd2pnM3p3UGRJWG5EZXZkSzc1VW1J?=
 =?utf-8?B?UVhVTzlua3hTMVBxN00zUFExNncrSWRpOEFGMy9oMkdEdlNYeXV0dnR4b0Nw?=
 =?utf-8?B?QkVUMzJvYmh6WmFmaGpQV0NXRTd3R094aEVtY1FnOHltRFlZUUJleWxEWFpS?=
 =?utf-8?B?dnhEY3dhQTlWSVUzK0lSVjBKVS9lMWMxYUlDZEJybW1SRE1VNCtlNXFiOFNZ?=
 =?utf-8?B?VHViTlU4d1NJbGtIQnZ2QWpiaUYwTlF1L1U5YVhtbGRmZk5nQjVPcFFUZjdZ?=
 =?utf-8?B?Z3JvME5QaXhSZ1hRaTZqTzVUVkh2V3ZMUkdKN0RCekFoUlpEMGtjajdUaGZF?=
 =?utf-8?B?d3V0V1RaeE9Ia3RoVktPcGJCOVZESzhDVXJhNHVwNzE5ZEZpSzRSbFY0bXZF?=
 =?utf-8?B?b1RNSDZIUmdvOVloaVZyTkZlQm1nemw3cFovZjRtWjNjNFAwUGNFcHJHa2dV?=
 =?utf-8?B?NUlNait4c0Rlc2RTOXJkK2E0NVh1Zldac1lWUm85dWQwRVBJVHc4ZWhZWWln?=
 =?utf-8?B?SHhaTzhSWGZYK3JPbndYTjd1djBhYU9qa2JiWm4xUkxzZmZqUHpKK2x4a2lv?=
 =?utf-8?B?ZEkwcWFOaFE5c3hJSnlaYVhxYkZ3UEI4WnlSekdQT2x3eWIwakRuSThMSXQr?=
 =?utf-8?B?RDJrRGZER3JDbXNiYlNLVUNVUWY0eWFMYXQ2MHZJc2VGWTczMWxYS2VCbVl5?=
 =?utf-8?B?YUJIT21BM2RUa2ZDcHNxalR1bFZLa0VRVUw5VWpDN3QwR3lEMWFDVFMyS1pM?=
 =?utf-8?B?UGZ5cHNYekR1M05JTVlNeXFCdk5CdXF0QmxPaEw1dzFDSVRja096TlVkczRW?=
 =?utf-8?Q?0y6+TuVbA0F6q7kEdnpdPHIWh?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Z6Tt0wRwBMPdoIALbg0kGgq2IaacVmqeZR8IBr2g+97yjBEUdAre6wqI1I/kEJq5SA0v3Yhrz2JsqnsknHtXyeeTKnoXCRUf3zZkPvFYBsamqymwnHVfpO9tAKb9qSejfKMw46QRrmZg7tjdu55AoGtldDEXsjQqwDe23wuEWldLCL8wdrhOzEh8DAApf9Ocn05zKloAZxN1pMbyQ1YvDfVAuizD3CHgLbiO9ju5uw50ajdgUgsZOla/Ppb3u3Sxo2RRz7Cz8D80JDrCnbKraL5S5tqmYHQNbflkAxHPWVDF/IENTuNbOQeRsfN+ZU2YwI+GWzRNyUfN9JBUaxlwnzJb3NTkzXi7Nv5RXH6b/WyIaEbh74/twvPd2Kwl9X71p6sjM1Zv4lW2SRKheY57yluyBS56x7rwy0riHrIrwMSoxqNilSokkuv8KTN/HYjESHEDPtaUVhQ4GOdhC7YKOagujKJ9viMoYDHLkk2XLxt7ZRFLiwVM/7VLK1KXV74CdjI0AqY8pF1ADooamEqR6PZCfr5S+QmZC+bI+SiO0Bu4ZP9+YIXiQvlReA6AXFl54UKTIsl2u2IbHo47Uql4SREIGBdrRKmIcWU9Y/gNqNo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be4e8c1-3b2a-47bc-42d0-08dd88c648ec
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 15:38:56.5823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8CDf/r8mpDgQmYW7nBft7/asOh+SbFPs80X+mdkbu7x/xJ/8y5vixmS91L46/r3xfm4GaeTPjBqRjRj68FotOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFE03343C9B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505010119
X-Proofpoint-ORIG-GUID: HhefreHw3Dyb7BcyFcm35ladvZPBQsHK
X-Proofpoint-GUID: HhefreHw3Dyb7BcyFcm35ladvZPBQsHK
X-Authority-Analysis: v=2.4 cv=Hd0UTjE8 c=1 sm=1 tr=0 ts=681395b4 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=zz_B9GGehC4PeMGNAG0A:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:14638
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDExOCBTYWx0ZWRfX5M3KJaacVbln 3AUvbKF0aNw2f3+KzQi6e0wFCrBYyghmI1Lx3I8hL8JWsXT2lPRGwITG7uYX6NebC4SkiNepGDW XaQOl5/riVGQRXs0RpgfvTlFVScgk0BoFJ61C3upkWB4ZpxkwE6RPZ4jMl33GrC65zuCzpCLQ7D
 2Rp66HhzRnkyqoVyN8haoKUBSSeSWiOYJ9auRMqn9aOki6FL6eDUe8j7BYc95ghdEs+L8e0eVck rZUiptGy2o/druWq/LkNIFG3scFWOU5ChRy0PQHroJpjaAzOiBDg9qJqJbdHjsCCl48NXvOBbHt WZcUmye/rPXrwQdfey7XiKyJIOu1MKWeGGcZr01dIuoTGb1mIZaNifpEwrwNSwvSgnPzyPTjw1b
 YDqLi+skNE/jNFVvGi4NsWd0Eg7nwNULcx2N4ZfZuiVtWFhkBovNYHYE+TXIvlo0btweckSS

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 5/1/25 11:08, Kris Van Hees wrote:
> The discovery of probes was tied to the static list of providers that
> are called on init.  It should iterate over all providers that are in
> fact registered, i.e. the dt_provs hash.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_provider.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
> index 1e2e844e..06f0b039 100644
> --- a/libdtrace/dt_provider.c
> +++ b/libdtrace/dt_provider.c
> @@ -176,11 +176,13 @@ dt_provider_xref(dtrace_hdl_t *dtp, dt_provider_t *pvp, id_t id)
>   int
>   dt_provider_discover(dtrace_hdl_t *dtp)
>   {
> -	int i, prid = dtp->dt_probe_id;
> +	int		prid = dtp->dt_probe_id;
> +	dt_htab_next_t	*it = NULL;
> +	dt_provider_t	*pvp;
>   
>   	/* Discover new probes. */
> -	for (i = 0; dt_providers[i]; i++) {
> -		if (dt_providers[i]->discover && dt_providers[i]->discover(dtp) < 0)
> +	while ((pvp = dt_htab_next(dtp->dt_provs, &it)) != NULL) {
> +		if (pvp->impl->discover && pvp->impl->discover(dtp) < 0)
>   			return -1;        /* errno is already set */
>   	}
>   
