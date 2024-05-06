Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F121598E3
	for <dtrace@lists.linux.dev>; Mon,  6 May 2024 19:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715024608; cv=fail; b=qtZrlgPa8IQ/hqw7cP8T0HHk8QTiZ+1G1yW6+3gjR/xex3wccBK0XnR4N9nZ5o+HQ7jcUd/EjWORL2XWjoGBSely3CIpicaPZtEEc9+1zTnC7R3TDBIBV+zvcdtr+l2I6UzAZWwVt37EZluKRvnIdNlHURbuMSm0dVVaNjRjIfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715024608; c=relaxed/simple;
	bh=5KZtY9cIOZclQ5rUl5YGeNySAVCu9/DbhT0wnVXyxZA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=O8bATwbRaovaCxzro/7WTHalmb1zAcvpcrhjNE5DrzP5jVWomNAnSHRh+Ys1rwV0ky4TKZpQ/gU6bO137PagZRtZ8dJollDlBiwMgY7+esemS8aI78V35Wkq7PhUMb6sCRWQPrt0yWahX/0p+7UxzYrhyWit7knnY3Ap0Hu6G/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=V+jJuS0H; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mQxCyx1f; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="V+jJuS0H";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mQxCyx1f"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 446IMvd9031886
	for <dtrace@lists.linux.dev>; Mon, 6 May 2024 19:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=zS1WXXmOImg2qr6gKrA1Ik+WVzlJ5lILx0Z3aV4dJjw=;
 b=V+jJuS0HpFJuP198EkF7296tbZb8dYUCNNxaGmRYgWtHX76xpVWZej/7oWo6p5Xt12aY
 fkowyu7GsioxD4//n4CG2jjTIJ70JARNT3WIcBQ5s0j6iygUJ46whJzF+DWYpt5uPXMh
 Frb6xCaXr0FeAP9RsVeUrAB0ABuQEfH5Mvpra7pnsInb4kjJmsZ9dGTEy8zqzN+qq6SS
 IcTgxCXPEd7m7Zr6woUn3Nfk5Oo4zqEix3ZBuje/wn91cxf0tOboJyhezbccdKmE2rkw
 b5n68rZfmKylrnBtoh/IifLqQYrA1wtAxrd0CK0NnlpSfii9mZc4piv3cHIyMXhKyw/C JA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xwbt53dja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 May 2024 19:43:25 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 446IO1r2014055
	for <dtrace@lists.linux.dev>; Mon, 6 May 2024 19:43:24 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3xwbf6eyut-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 May 2024 19:43:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8wbzcxYKGdEniC8vSHBjVBoYhsqOsjEZKN8ff2550ZzhGfShtaVFp3EMCKOK4R406kglChU0uAT9V0sb9FhuQFt4d8oBxs8qo3HSK1k1D12EDhibsbkAwXcxbxgl6w1y8FlQ7+R0ECMEnZENOvZckiG5O/w9KudjVrF1jBX8H/H5+/LpiHgMqNRuZu0phdA/ejt4uQ/qdoFIS/6M7yv+bxvgc4vFnQgkYrju+I2cY22PRUKYblDkaH2LlWdEjHtuYaVR80OiIHm8N50gja2ALn/y02GM9BGsHpRinH1YxDdzNCWzQ/b6Po/paezHTkmDUqv/s4O++gwDYdxoOSbIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zS1WXXmOImg2qr6gKrA1Ik+WVzlJ5lILx0Z3aV4dJjw=;
 b=Jz3Ty9xae1fb1WDI5pHlDVWTq+lvhYjKUCuNdcw/uhhjIw2F3ewtLxQ3PUjxhF7G8eq0SP4BPk8hZ+uGtf24VOyMD19x2OKJxOU+85LkSNUL3goFUZx3PHvPPnwVhnAQgYFlmqlTPscjeKH1hnKrWh1OyT44cJMs1wwvGQP5dAdizG3tmnCfKII8mqvVxGug5ifIekbhZHoO8YgTpBGl89XbSsDmDjgcN9lEYITM9m1EL6EgbeOAvpxr/CM2nsOarCKySGCiYdzGE1YcihPAxMN+7W9O1A9h0Uqf9MrsyLUN2eisqFzHIRfZumtxrtZLVirXSuOv3LPRz9mBDv+sMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zS1WXXmOImg2qr6gKrA1Ik+WVzlJ5lILx0Z3aV4dJjw=;
 b=mQxCyx1fYR6T3iW/nnr6UCpec5wPL1Pw4watlwZ7V3JprOEZ5jp6yBKEtsJfamfTKMtKmDB4g/FQz8H1FBe6NwserQMsGtzoWq5rx2nJfthStluhUqyFvvgsIY4hqCTun90MuWOiAj/YJmwnerjM5+D3lq8A06KykU9fKECTLLc=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BLAPR10MB4978.namprd10.prod.outlook.com (2603:10b6:208:30e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Mon, 6 May
 2024 19:43:21 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::880a:3c23:a6e1:3b65]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::880a:3c23:a6e1:3b65%4]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 19:43:21 +0000
Message-ID: <9a7c6e07-fbb3-158e-4fa4-e6ce695b316c@oracle.com>
Date: Mon, 6 May 2024 15:43:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] bpf: be less picky about the content of bpf_helper_defs.h
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <SN7PR10MB62872FF9878DAAEE6F33AFD3C21C2@SN7PR10MB6287.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SN7PR10MB62872FF9878DAAEE6F33AFD3C21C2@SN7PR10MB6287.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0053.namprd11.prod.outlook.com
 (2603:10b6:a03:80::30) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BLAPR10MB4978:EE_
X-MS-Office365-Filtering-Correlation-Id: f654263a-8b20-41a5-844d-08dc6e04c913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WXJXOU9EcTdqUnljbFNyNlM3SDhaUU5CQlhsREh0TzRGN3U3U2I0dkFGRmIr?=
 =?utf-8?B?TGQ3c2lXWUFzVUszTFZ4Mk9hSnNrV3ljR282SVBDOVhxQ3htWEVhK2Z0YzVx?=
 =?utf-8?B?LzFBa252dkNLRmJJNVlQOXZ5QVUvUmVoUEptNkU4MFF5YVlRMTdPOHo5UGxm?=
 =?utf-8?B?c2xhemZhZlBOTWlvN3QzMXVyN2w5WE81U3ZvS1dSQzI5T3VhaStOQmhON0Fa?=
 =?utf-8?B?c0NvOGZyS202MkpRY0VqUk9oem5QNG1TTEFUblJUOVZaL0JPczhIb05aOS96?=
 =?utf-8?B?amFBWjJDYzJpdCtXdVh4bDNJZFF0L21zdmJFT1E5V1VycFY0emZvUzJ1V0tN?=
 =?utf-8?B?b2xwZ3o4SG9NcXllQm9SQkk5Sis2eDhtNXd5dHdnZlM0aSs2VGZTQnNkRnU2?=
 =?utf-8?B?eTErWVFDTkxBbUpTcGxSTkZHRTRYSGxlZzl2MTdLL2V6RGd0R3ZpL25acXYv?=
 =?utf-8?B?c01rakJQWTZ3NDlEQUYrN3ZpU0Q1MjlwS0RHTHBTYU9VSldwTTlHS0U5WUxa?=
 =?utf-8?B?a2RDdTdKeDdVaFV2QkVJMUtaTEsxZDdaZUM0cHJiNVYveTdiRDJVYm9PTmpq?=
 =?utf-8?B?dm8zaWsvN0ZrTW1kMWgwU3RjWlI5NHM2bE9acXBCbnNEOWNmOWV0NFhHL2JP?=
 =?utf-8?B?bWFrWUpqb204R2YyM0VJeWdkcWhVRVFPMGFiTXRyTzhQSDZNWnVuZFZQc2Ex?=
 =?utf-8?B?MG96eUkzV0QyQ0pUR1NteENyZG1DeFRycWdwb0VCeTUydzZYWmplN2sySk5S?=
 =?utf-8?B?VXhVWUxoeE0xTEFCZ2FxSER4aWk2RWwvSC9jYlhVam5FRDJOdHp4VGxqYktT?=
 =?utf-8?B?L3BpalNTb1FzTFVqUG9WdEdIMUpiTlRCV2c3eXNsY3RzNzdxdEU2cUxsaDl5?=
 =?utf-8?B?NWVkRDNTSk5YZS9BVXpmcG5JeU9nYW03UEtLM2laOUJocGRCNytyVjFGUzdF?=
 =?utf-8?B?ZkxWWERrelp2VHUrVTloenltVWdrdFNyUjZyaXRBN2EyblZSVFRJb1RrYkFO?=
 =?utf-8?B?bTMyK05oVzMrbEF0SE1wVWdUQnRldVhnUHZ1cmFNYzc4eWUyNHgxeU9KUDlm?=
 =?utf-8?B?MTdIcWNoMi85SnNjTHZWZTh0b0JGOThCR3N6cFpSa3ZpNkVadEsrWGltelRR?=
 =?utf-8?B?ZGs0OHhsN3lUbUtla0N2ZFJSKzFCK1dYREdQS3QrZ1lHUFhGTWVyVE5VT0R5?=
 =?utf-8?B?c3RoWlB6UTJlSTZXdVJNbWpSWXppWWo2dGJJNHdHVkxKRUhKWGpZTE00NGdR?=
 =?utf-8?B?MDVoSlV1bU44WkVOMVdSRDJCMWM1ZTRIOVJ3cDVWb2ZYVGxvSjVJanRwWnlO?=
 =?utf-8?B?dENKb1FUUkFqTndGdzM4MlZZcnJtRGlhZFYrWVg1VWtyRjN1OGd0YklkTEZG?=
 =?utf-8?B?MlpUR2VLZzd5YWdFVDQ5TU8vU3B5N1VXdVVDb0tOdkVVNnE1alZ4V2tMeHJl?=
 =?utf-8?B?VU5uRnlpMGFlT0IyYzAxUmlFNmpWQThGdlIwQ2xrR05pRHVUdk5lK0pzTlo0?=
 =?utf-8?B?eTd1bVRkTzlpOFRnakNidXd5M25ub2VaOUxsMWZFN2wzSmpJUnVPUGc3NUl5?=
 =?utf-8?B?Y1diOWdTT3lML0hxd2RiQmErUnBMUCtReTd4amdoUGJsVTgwLzdIdGIxVkxV?=
 =?utf-8?B?Z2dORXplbzQzcU5yelVPMFV1WUFUY0pjMmNTdlNxVThkK1JEV3k5bXphTXRs?=
 =?utf-8?B?TjlzZDEwUnhPT0VPUHlaTnhJaEpwbzZTZWhaekhGcGZqY1JNVkRNallnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aHdzMlRXMnljZEV6VXIrUVdiQ2g3UjRtcGlneStTV2ZLamYxTEVNM1FpdU1j?=
 =?utf-8?B?dkMvaVFSZTAvMTE3b285MEZxUHA4dEFVK0I0ZHlmODlSa3pvZjJxSGpaSlN3?=
 =?utf-8?B?U1B6R240TStEU3daYUtvNDhXbkFuN2U1Z2wxTkJZYjJweWU5WE01OW0ydlNI?=
 =?utf-8?B?QTczYk5qYzNMVlJHdTIzTFZJdUFiL2FXdXB6TW9qTkdQbGtiTldTQ0lmc20z?=
 =?utf-8?B?Z21QenV1WWhMTHR6SW90MzdjMUxuSUVnL1VNNFNFd25TYkh2RXAzbVg4Y0VU?=
 =?utf-8?B?WkZLbE5wZlZVSG11ZERpaExPUnpGMUlReUtQV3hmUWozQVFsZjU3K3JxSW5p?=
 =?utf-8?B?UkFwcHlDci94Uk9mbXZ0T2VLL1I2M01QWGRxbUswSWJRNDl1eExHTndDKys0?=
 =?utf-8?B?clNyUHo4UjFJNmV4eGVkMFRvaFp4Zmg4b1JRLy90RS9QcmI0V3oyS2RoN1po?=
 =?utf-8?B?OUpheU9Sc2xYMFUyUEp3OVdSWFF3QllrU1lsdmF2NHo2cXQ1UGYwaG5zTUNu?=
 =?utf-8?B?Ump6bi9uRDZpeUQ1NW4zVHFBbDdtWHJCNHNxY0ZibTAvTlluTmFyY0RQMm1D?=
 =?utf-8?B?WmhHbWk3Y2dndVZ0K2J1Y21BZ2xPWWdjRFlCTTBKaGRHM1c5aHhncFlhaWxj?=
 =?utf-8?B?WTV4UjBLOEtHbGg2VFVlU1JhYmRZQXZjUTk2Mm45cWRobHZEc2xHckc3eDVz?=
 =?utf-8?B?WDk0cXUyeWZpMjJac21Ea24xN0hNWnJzZDB1S05lNTd0V29ZZjNEZE5qcmda?=
 =?utf-8?B?RGR1Zm5qOFlweXUvV0wvbXNHaUluOVk1SFJqT0R1R1V1Mi9oTWkvVG5hVGJC?=
 =?utf-8?B?dlcrdFE5eVB5dnl5bTVNbHpFWmREanhXYndzcnlSUkYwYTFOeHlaNytlMGlw?=
 =?utf-8?B?VDJuR0thYTdSWVVsVzZ6TXZXUjVaUmxDU2U2cFBiaEV4enAxeldCUm4vaDhV?=
 =?utf-8?B?SWIzSHRLL28yRlR5TU1rQ0lKZ3dDaHExR2ZDbWdiM2ZIYTRWbllrUDJES29I?=
 =?utf-8?B?cm9UNlJSREJGYmpqWXVFLzVYdTVpZ0EyUWFLbTNmZUx0M05yK01BTGRKSzJi?=
 =?utf-8?B?Slg2Y0ZHdWZISnJ0R0x5RnFkVlJiSDhKTFNHK3hucTMvQitJV1ZQZnVXMEdG?=
 =?utf-8?B?aTU4a290bmdnRkt5bGFtYXBBWWhnRUVEaFplQlZnZ0FvampZTXd4dXhNa1lJ?=
 =?utf-8?B?WkhQWm9tNUtIdkRYWXg0cHdDWXBkbDREWDNpVDU3N1p4UTZvcEs5aW9Ielps?=
 =?utf-8?B?aGRqZGdsL2ZtbG1CSkZheHY1ZXVubHJIOStIVlN0Q0YwQ0lQbkE5NmgrdVBm?=
 =?utf-8?B?YUJkanhtZG5NRVI0SGZ6WnpiUFBPalJiRjlXUDRKTk9Tdy9VUXhqTHBxTjlh?=
 =?utf-8?B?US9lK1JSLzZ3eVBiNHNGSDNyajhBdXBwSWRlZndmbzBQY041VmZLaXEwS3d3?=
 =?utf-8?B?czVqRzFUV3pKSlRiajliSUV0MnpGYlVhVStKbFlCOWMwb1I5T09lcTZleURN?=
 =?utf-8?B?bVVrNnRBRlN5WGU2OTNra1pvK01jSkhzenRySjVFM0ZCODFkSG9LSnp6Uzcz?=
 =?utf-8?B?RnVQWlJORDJGUHFienRXVVpQRDhGQi9lT0pucTk1YXN2c3RNM0Z3dTBRRE9W?=
 =?utf-8?B?MW85VlV1ZGRISXZpSmJnTVg0ZVZ1NXk1ZUFnVXRMZnBwakhkZWNsWEdGSDY2?=
 =?utf-8?B?amUvU05pK2FHT2hKL25jWi9kUjNJZ29udlBXSlQ3MVptWFhNOFd5cEpMT2Nw?=
 =?utf-8?B?ZFo5N2dMQStaUTA4RjdIMU5MVDdGVUJIL3ZKc1dJcXV2NDk2dEkydmF6eUZD?=
 =?utf-8?B?RUtlQkY5VFh3SDJ1Q1Z6UVAvV2xDYzkwRXBYMUhGNlhCREw1MC9KZmhyTkU4?=
 =?utf-8?B?ODhXMFFyd05TTWtXSll6WG1hWHJ0MWk2ZzVOc3NaRWpIL1F6SjVUK1J6dzNR?=
 =?utf-8?B?V1Y3aW1pWFhuNVV3MHdndjh0TUtrbGowa1lyQ0J4L1NJUVZERUUvd1owNmx1?=
 =?utf-8?B?VUdFaEFkT1ZFd3RWdlcyYXBUOXZkUmlmbm4vL0NoZHc1Qk8zY1dqZlVHQ2Jq?=
 =?utf-8?B?REwvNDFSTXllbjlDSVk0SVlZMVc4cytWZDBkS0hOV01WNjk0Q1pwTVBBVDVz?=
 =?utf-8?Q?Y6IQwnodm1YUnL5djdHdM/+DS?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	f/Dy4bbDbL8nST8VVrcGG5o9P6qVjLByJ05sKYe2t14P/vXmiGHTlZFdRHs2/NUZpkbgfKYSSgOrWUAHH4AeZl8k8DUgmMvrwLUAsZ1sSKBKy55HsJTJ+A5+n8+TzzfY4w71v+PqaWta6PAoAxGl9YPB456+zBJX/jrnyy1ZpdtLMpDb/aw7APMsfwu1uk0oKJBHGgp2iWj/AcCIm5eUt82vRTuKnlHHYzVveiNK0pCpD8Tb1boOuvPhdmWvL8yYdiPw7qizoDYR4zCVoV6CZHcWt/uRljQRYAxJIZ1Q2rzbepSM7h1Tft17QT3UahCXeaZ7f5RFDvur9KW9e3nnsyFWddETBwh58ngTb3vhCpwaP96KO5NWqTrHDTI7dnK8zahIUIeY/nfIh2RijPbHvWMge6xOnIDUCccJPk1CGWbrBaxwSs2uhLo8ul/qJUqQ+PDO0LYIuioe5GkrIsjUJIoq5Nu7i7oghNyPHRyZJtjkWeathEDuSckRpEMIdWqzzyFUYhWThfdioCzfX0UO9c8llg+4VfDj/1DSE3f/qZQeEh2vWT08cCTjTVnzdU5VPV3H1EYf5/VN5WRYfcKil0ciwsac9shWyZ2Z0R4bNrg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f654263a-8b20-41a5-844d-08dc6e04c913
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 19:43:21.3561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L0TM+z6fwiO+9EfbhG25FzwouU83oPMeQn3/BSbdy1+fL3COMKuPwJmObqXbPkFzzIGTOep8s9JehHXqTa5GnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4978
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_14,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405060143
X-Proofpoint-GUID: 6xvr0q2JM4VSPF7HOsz_4YlGxRougLAb
X-Proofpoint-ORIG-GUID: 6xvr0q2JM4VSPF7HOsz_4YlGxRougLAb

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

One possibility, however, is to regularize the input line with regards 
to spaces and tabs.  E.g., start with

{ gsub("[ \t]+", " ") }

Then, subsequent string processing can forget about that \t stuff and 
will presumably be that much more simple and readable.

On 5/6/24 15:05, Kris Van Hees wrote:
> There are small differences in the format of the BPF helper definitions
> in bpf_helper_defs.h in libbpf headers.  This patch allows mkHelpers to
> be more accepting of these differences.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   include/mkHelpers | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/include/mkHelpers b/include/mkHelpers
> index 1a7537ca..dc5e62c8 100755
> --- a/include/mkHelpers
> +++ b/include/mkHelpers
> @@ -8,14 +8,15 @@ BEGIN {
>   }
>   
>   $1 == "static" && /=/ && /[ \t]+[1-9][0-9]*[ \t]*;/ {
> -	match($0, /[ \t]+[1-9][0-9]*[ \t]*;/);
> -	id = substr($0, RSTART, RLENGTH - 1);
> -	gsub(/[ \t]+/,"", id);
> -	match($0, /\([ \t]*\*[ \t]*bpf_[_A-Za-z0-9]+/);
> -	fn = substr($0, RSTART + 1, RLENGTH - 1);
> -	sub(/[ \t]*\*[ \t]*bpf_/, "", fn);
> +	if (match($0, /[ \t\*]bpf_[_A-Za-z0-9]+/) > 0) {
> +		fn = substr($0, RSTART + 5, RLENGTH - 5);
>   
> -	print "#define BPF_FUNC_"fn " " id;
> +		match($0, /[ \t]+[1-9][0-9]*[ \t]*;/);
> +		id = substr($0, RSTART, RLENGTH - 1);
> +		gsub(/[ \t]+/,"", id);
> +
> +		print "#define BPF_FUNC_"fn " " id;
> +	}
>   }
>   
>   END {
