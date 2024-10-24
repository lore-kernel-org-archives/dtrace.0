Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BD9167D80
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 23:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729812618; cv=fail; b=oZJVHe1oKCcQYFXzp41NMCTZFdEMgfb+gFu/49r0o74FduKIhveQ5/xsCSkRevJrcUrxBv/p8xoh5ZVVp6+t6C8RLmg9HVfgzlCLFcaq0perNRgVxw0iVReRADvWIL34PygYCNC8ItCyLz/k+NvYJ/bf+0df7BODY3Ij5BRqIQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729812618; c=relaxed/simple;
	bh=OQ8HVu0cGdQP4ZmN/dXl/pmsLOSjaD99ws/IhkGqCHY=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AmxW/hYYByVwOtB4IkLBgNQHjT4yrS3ov2yrvjI88gkorCETL42vOzqIfh2CEW7JPWTWsn177LJSb4fcuqRgpzIvH1de1jWvBVxquW39wavbzD/y5hbsIBswkLhQ+abZhCMKs1IjeBFctD/3Lf6VwGwoWUcrTMpkmzCoV8OdZkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=S23kGaEa; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UUz2yij4; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="S23kGaEa";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UUz2yij4"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OLNvCt023095
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 23:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Gmn5CaTMtKMN6N6txoNRUh/Ge1fQHpM5NvbtsAiH1Ro=; b=
	S23kGaEa9kkQl0Ta2EePcLSaRzKDk0BtxdTUmSMPCQKWLzpRTrU1AhiVZP8r5Nai
	DkUFRdJwIed/eiASpTpYgOkF7a7iIuXnXNiX9sIexPftH28v7v0iHrynIPv8JHSe
	VDThQSFuEjFfQUAM9nBxhB/8yeEy9fjc2jFDEQ8SvKQ2LCz0ajDaA8prMW132wu6
	vKZ4LMwuPj/fWmbzcq8jrRhhGK8N/rxzWa8BvJ1O+jKHlvdYIgrHwuwKswgu7P3n
	V/aeXalv5t+6KSVU5Ipvr/b1KSYNqvSBMKmuNUW5ePq80xO6gns0UIIW4ZcH5KX+
	9aBwp1A0VtX9l8vOPKb/Qw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c55ekrq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 23:30:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OLICAc025622
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 23:30:12 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2044.outbound.protection.outlook.com [104.47.70.44])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emhbmk37-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 23:30:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yS2MuI47oXe3IlCsdjHfSjPw+fkAg54swFXip0shVvsc4JceuAzdXvZeuK3U6PC7/nvnDsujrC6Rk44nktFClH6E01Jfu9xLmoN5N9sHxLIazIkv/yt4eWCTYZYSZ/bl4vFBSobA55xW9TVd+q9rXzGaAkkgEmei5E5HwxXAzZ6hKhapcYFjQog4wjiheHbYkUZIs+WOKPcf+q1o9rIFqfffam1WVqYg92j/fy0zAYyYc7EtiCNqplT9RuYZvcfL586NCJcX0H3z6KqUExSDK9JqTBd7i72MVKLf2xzt9TBgEhkWAtGv4Ucvo0JhP66DajdTc1FBhsTBnDtBlIBIow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gmn5CaTMtKMN6N6txoNRUh/Ge1fQHpM5NvbtsAiH1Ro=;
 b=uN4xZgdpJp1N8hgMUnHvmcWaqSmUheGiGZX/7Wbs/DqDmwFW8Z1FmQce21/srDsixjFtPmvaMTWhzvpHeob8otl/H/GXZl32Feoa5ad8vDoIEb04QnDJm8KQDcVcp1bPjvaAUXXnXk02mQ+yp3IuDlVtr3JueGO6DcniSMkb8EdrdxIlb/ZQeg9FQyj44xsKFvGlA7riDy6wMFhOBpArmj/1X2SEqmCWfTqbJ73tlyep6aeamngCmk3hXXKndvq2x5y+OboEI4BWLerNN2OPE1PBonihh+TvwlB6U1T6FDS7y8FF9ZIu7/F+942+r4MT2YfsvZCbMCYyTmojRiIc4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gmn5CaTMtKMN6N6txoNRUh/Ge1fQHpM5NvbtsAiH1Ro=;
 b=UUz2yij4GiswybdZ83l49nJD0uDSoqj6KYGvN+VlQLgs9jPs6IaBs58Ym/JyqrlYcc1kpY2SkGXqiKURf3ZjRjzOO98BbeRRinipvijZqWKnrfc7Tmc1I+czMP+eZV/cfYhuyKmplzuXZJiWG2skD9B7PRXdKCUrAn+871k4JOw=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BLAPR10MB5156.namprd10.prod.outlook.com (2603:10b6:208:321::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.19; Thu, 24 Oct
 2024 23:30:06 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 23:30:06 +0000
Message-ID: <c16405d5-d7c8-71cb-35d7-8f7ee232e88f@oracle.com>
Date: Thu, 24 Oct 2024 19:30:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 08/19] Support multiple overlying probes in
 the uprobe trampoline
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240829052558.3525-1-eugene.loh@oracle.com>
 <20240829052558.3525-8-eugene.loh@oracle.com>
 <Zxm0GsvMqDP0lO8c@kvh-deb-bpf.us.oracle.com> <ZxpRGdMvnZLAYt+7@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZxpRGdMvnZLAYt+7@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0197.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::22) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BLAPR10MB5156:EE_
X-MS-Office365-Filtering-Correlation-Id: 572b229f-4fcd-44b1-d80d-08dcf483cad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWpUZ0RsbnRZYXRwdWIwNEFDdXcyYzAvK3pzN1M0MTIrUG1pL1d1YS90Q240?=
 =?utf-8?B?dTd1ckZScUZWcWlXYlpiZ0k3NW01MjA0MVZYdzFpNWhROFhpSFV6ZzlBY3hs?=
 =?utf-8?B?Q2srK2Y5RVpMd3lweC9weEZxZk0rbVp4R096VEFyWHJwR2VvdHBsakcvM0FK?=
 =?utf-8?B?V241UVdFZGdmOVBBOVF2NnpXTTVKSGc4RkRnWWhNRk1raStnNExzTFd0aE1X?=
 =?utf-8?B?RDgzY0Ewb3lmVjlFYkNhdFprVjNiUzBsbE1KaEJVTXl1QVMxMmNpMzY5ZUFO?=
 =?utf-8?B?amljV3FNYkNkdDN1cEZHb0V0Rk9NVURNZUgvYnhrelNqTFd3Y3A3SWlaakhu?=
 =?utf-8?B?dVVXUGx0NTRhUzZwMGpwOHRUYlhpMEprN3M2aFhvd2VxTFBMY1c1WlFwbEtI?=
 =?utf-8?B?a2pGc01DQjY5LzBFZlA4dVNMYXNSL290am16Z2Ewbjlib2NsTUlrNkxlampD?=
 =?utf-8?B?bE5GZkJ3VmlLbk5BNkVrcGU2em01M2pZbGxvY3Y2SW5adnRXKzdQZzd0Tk55?=
 =?utf-8?B?eGhCT1JMeGFrblpiNHpudjVyMEkrWDdYeVp5ckpiY3BrRWNNS1RjTUJ0dUVH?=
 =?utf-8?B?bnR0SlFRTkNrU1FFamhPTHZLaUtvNy96TXZnWUxnK1pHUVRTUkFhWG1sZ1Ju?=
 =?utf-8?B?bG1JM0VLb0kzTTJ2VThBZWhNcGIzbUJkbG82RXBhNFdpN3BrNDhzU3c4RWZ0?=
 =?utf-8?B?RmQxaFpmb2Rzd2twelpvbGJmZEprV3NZZG9EQ3VxNkhMNXpxQmhLK0NZUlNt?=
 =?utf-8?B?dzFHSC84ekhGZ05KL0pYb0tzdGo3bUdhUmxERExvRFlWSmQ0NFlNWTRCZDBr?=
 =?utf-8?B?YnM2dEJHaVZZY2kwa05hRjIybWg1eWF1UlEyTERDdGxBV2I5aTN2WXZxbnJt?=
 =?utf-8?B?SEljQWZjS3BMaS80ZnhldmZOMFZoT0U5NHBPbkJBeHNRVGFuTFFTUnZ6Z1pl?=
 =?utf-8?B?WThkek9FQUR2aUQvSzFDWVdubWRFT0wvd1hRemhGOUZLL3FSNjJZem5qc2dF?=
 =?utf-8?B?cDBuTHBaQnBKTUY2UHhGc09DUVMrYXN1eUJ5Zmhtd0wvRWxTdnlKRm15MVdH?=
 =?utf-8?B?Y3ZXN1VtVHV2VU9GNURlN2JpYms2aEJCT2V4NkNBazJJd1JWdGRSb252U01j?=
 =?utf-8?B?QUpEQ1MvOEkvWUxJSTBKK2xZT0xITms0UXBNNzFhYnRPeEZMbDRQelA0b0ZY?=
 =?utf-8?B?U2YxK01FeXdTb28wVURlc3ovNlRzRW8ya2pqQzgxeHhwOEprdUxjYmxEL3BR?=
 =?utf-8?B?bDdrb0E4Ym00ZlVrMXVlM3NzUjQyQzROOWtMKyt2TzRjQlJlN3dHYmZLbEdJ?=
 =?utf-8?B?RDJvM1AxSmZ6QlR2RVFaTU9kKzNwMnk0dngrRG5FNnhlTEFvRzRVZU5zZGN2?=
 =?utf-8?B?ZG1aSDZXWjhIc2g0TVorb0xBc3pCMDhVYlpHNHg1REpxNjljaVkydmVPYUVs?=
 =?utf-8?B?L3FRRjUzek9neFRjSjhKOUpYa2V6blFCUlBYemF3TkpLdmlHZEU0NlVSRk83?=
 =?utf-8?B?NjdwTDR6Z2laVnVwWVpBRWF4cTNPV2JjMDZTYVdtM1NmK1FyendTZ3d3WGRw?=
 =?utf-8?B?WnhTN3IrZGQ3TC9QbFd0QUE3cW5jVUYzVXpNdnM3c056SytEMFBxc2ZQQThr?=
 =?utf-8?B?QTY0OEdYcWkvOXE2c1FjRi9xc0w0cExtNUlwVmllenIyakMzR2RXTHhkeDBR?=
 =?utf-8?B?WlNnYzMwTzJKZFJiM2Z6S2VJUmpNa1BBUWxISGh4Vnh0S2FXMmJsWDUrSm1i?=
 =?utf-8?Q?/6ch/OZZVl3cJdYODmnuN4dLiqy4jCfi4rCYqdg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2ZmZWQ3SnJibmNGM2VoME84SDVkd1lHaGovd0hnNjBaYjZPS3QwWjNJc2NS?=
 =?utf-8?B?U3hGc0MyZVZOd3RhcWVFek4wVTZVMmdCTDVQeDM1VDNKU3dJT29zaGswTFA4?=
 =?utf-8?B?L0FZLzN3dVU1U3FGa1dwYlNpMnp6YXExcmFDcmwrNzBGTWNjaWFPRTh2TWor?=
 =?utf-8?B?UUNrWW9xZklqM0RvOElnR1R0R1pQdmQrS001cXJYTXdjd1VmL2tRclNqbC9z?=
 =?utf-8?B?STJTalMxSUMyNXYrNDZsOWtqSVArdjhPYVBLT1g5QjlocjBFaWgrTU9oelJv?=
 =?utf-8?B?TGRrbE9VK2VzdHFBTlM1YUlvYVRONXhYUUpRMUh1Ymp4UjNQdk11dmE0R3pn?=
 =?utf-8?B?QXM2UXBGWHFtNXR4SkFQTnM2WUoya2c1OWpHUDFNMTBid0xQV3JJZXhEN1RD?=
 =?utf-8?B?ZjJNQXl3NFZ2bTM2RUxXaDFMK3d1Yy9LbDRnZDBSMmxvcSs3UjJRalcvK3dK?=
 =?utf-8?B?Rk5CTDNpYlExMlJLblMydEpDcmp2MjRERnhJRm1zcjR6OUNsUExxV0tXa0Vh?=
 =?utf-8?B?TWFWMWx0VWJCV1h6bjEwcWFrdm1KZDNYRUtpUGZlVHh1UUVodlJFeXIrMDJk?=
 =?utf-8?B?d2xaVjVZeTdxa1JvUXRNOUMzYWRaMkJuU1F4cXZ6UjBnS1Z6WWZGTFRIZFpH?=
 =?utf-8?B?eXY5VXZ6ODhCeEMrbzhkbVZFMExOZG1IdHZSZm01UWcvcFg5dkQzakpObDYr?=
 =?utf-8?B?ZGpYcThpYmFqbXJ4Q09OWWpsNHlCdEJkbkM5L21aOE1ieGFpYkswcCs5YzFj?=
 =?utf-8?B?TmdVWnJ4T0xnS3VpZ3ZhWXNiQTdDdUVZaWlSUysrd0kzZ3BtUjNkdEd5OVZo?=
 =?utf-8?B?cWlDcVljd3RScGpZOFVoSkg3ZnFPdVdZSENabnZDVC9DTXl6UGRKeE9DeUo4?=
 =?utf-8?B?R3ZpZDREc2ZtMzQ5ajRJSU9TK3pTbmxHZ0tSRzZOTzNyK20vTnhmVVRPbk9o?=
 =?utf-8?B?bk1aVWNZMkhXZFVhT2lKc08xaGJ2b0c4ZjN2SWtHMDc2RGZlamFhbnhzVGp1?=
 =?utf-8?B?TXdzdlgzellRd2RvTHBKcE9lRDNzQzZzNGZLcFVtdzVMcUQ5U2V2UXkzakFV?=
 =?utf-8?B?ODAxcFVCUFN6cUlURXNpVWhqTEh0OWZjUU5yaDZqbHZIRVZEc1ZLNDh3K0Rv?=
 =?utf-8?B?d1pueUpaYUlhaHFrcTE4c0ZocHdQalJZOTZ2RUxhTHZHbUlQR1VNTXlQNTZs?=
 =?utf-8?B?SWpIekgvT0IyWkt1eWhqSWtSWVhEemdIWGlteTdaY2ZKZ0hHVEw5TXdqRzNl?=
 =?utf-8?B?Y0QzNzJjNjFZc1JvZ1FKbHN5ZGtMbk9JZmZsMDJBYktzN1o2cGhuUWFKbGN6?=
 =?utf-8?B?YVdWQ2hqYUFtbGdON1laRDc3Uys1a2ozTnRjNVBaeFg4SkN2Y0VmSG16VERM?=
 =?utf-8?B?T29BaUlhSnRQS1MzU2tidzlmeE9zS0JmOHFaN0VKOWw1WjZUV0FCWGpxblNF?=
 =?utf-8?B?RXp5VjduY3U5NGZuSU82WXRCM29PTDRnMUZTYklPbjUwQWdMc0JZbU1mK0Zp?=
 =?utf-8?B?S28zT0R5WmJ4TU5OL3J4b0VsVEhWenhpcitpNFNWV3VHcDFqeGdPRElzekpP?=
 =?utf-8?B?TVhrZXVjLzVEbTJBb3ErL3pXTm1Eclc4dVJwLzBWZndBNWdKdXBVa0NsbFk3?=
 =?utf-8?B?VmFZSDNKSUdFVTgxTGhUUjhTRE0rK1gvQmtPUlhyalg1eXkzU2MxbWQ1cktX?=
 =?utf-8?B?RW1oRDQwMEdhVjJrbGZ2c0FCbzlvR1VPK0pQQW5pdjV3MlRyWkpmby9KakdY?=
 =?utf-8?B?Rk1aNDkzd0kvbnlQYWd2S3NiMW5PL0drVy9LRDF4QmVuYm9FTVgvNHAxWjcx?=
 =?utf-8?B?dTdFcDZPVXIySHMvUHRlWWFEeGlubS9PWThJTnpjdnJuLzM5T3JhM0FWOWkr?=
 =?utf-8?B?VnpZWmtmMDBqTkUzMkRZQi9wQUdpUzA3bEJ1RzhubWxZVEpqRG41N2NlNGVO?=
 =?utf-8?B?L3B4dE5tZ3M3ZmgrM2Q1ZmZKdUpmK2J6Y2JUb2c4cVliQUtmUXNRMFE0K29u?=
 =?utf-8?B?Ky96b20vWk40YXdsL2RMaVZjaEJkOHJRalpXQjZYbFNIdGZYN29vSVBNcWVq?=
 =?utf-8?B?TWFRTkhWTmNkNDRRS1hqN3BTaTcyakk3Z0lYOURmS0c4YjBab2haTEpZUjJW?=
 =?utf-8?Q?jAH8U1iyztuh5/zevE/L86Cj3?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kEa0YSA+Teh9yrTAE5MV6tF+XhXeOXfDsGKxmC0OP4zZwWJFuXJ8yoA6533EEAdGJHdIY/q8fO/nTHup2vzt25DR+OIaQs8HeZKF9dQJzShX1PYg0276DYBFwmf8tgqBtAI02u/nOU7IWdzVVNy2pwgn4VwakbNRxoomRzAVi2cWyAMFza7CPlr/VMrt+6LYiIQGggH0AeVEWQfeqXVNyMrFFQLkdjbjWH/8Y28gQIZ8qmzEklL59M8NO2YIV9x/tLoUiRNJzfMMPdfa7FH2XaaP6lPeq/FKs652Q8zI7xeQgg1MZ+PSuVMXlVFYQQEo3oFijq1oBAtnHysyRrtAGGQpxYO9BhQ00voxw3pleIo/NVTLu6Bvw9Sfw455Zdrq3QALh4IS/jB7d9kDiVyeYzSCgwVoNmrvnQr60sss3T3MTseFtT5EnaiPgZjoMFb2bVdPWGbxDG6Xyg9X0ErMmPxz9FGLWUusr6qzYYO9cVFulZrZWthTLbmXFLVJ96JSNl0+fuMcXnKQXVox9G3SU8e/5yHxAFbuMFXk1KFTnqLO/9lw10ocns8hYWS/d00VMldWNNBvxamIGdi9OXrwEG4ngUyDqfomEn8NgaZ2Mxw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 572b229f-4fcd-44b1-d80d-08dcf483cad1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 23:30:06.2021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/tSJEUOeRAbECaPF4q8yLhxiSoFtl4WPf2QD96Vvw2w7pGcg2/WIH+FaoBXfOyxxzPEjBUyb0+/6iTX9mlNxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5156
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_21,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410240192
X-Proofpoint-ORIG-GUID: wUMJoxsRn1svlI_Z-ij6jsYqIe4uOrUi
X-Proofpoint-GUID: wUMJoxsRn1svlI_Z-ij6jsYqIe4uOrUi

I'm going to do a bit more testing before posting the next version of 
this patch, but here are some comments while they're still fresh on my 
mind...

On 10/24/24 09:52, Kris Van Hees wrote:
> On Wed, Oct 23, 2024 at 10:42:34PM -0400, Kris Van Hees via DTrace-devel wrote:
>> On Thu, Aug 29, 2024 at 01:25:47AM -0400, eugene.loh@oracle.com wrote:
>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>
>>> An underlying probe could support all sorts of overlying probes:
>>>    - pid entry
>>>    - pid return
>>>    - pid offset
>>>    - USDT
>>>    - USDT is-enabled
>>>
>>> The overlying probes belonging to an underlying probe match the
>>> underlying probe -- except possibly in pid.  So, an underlying
>>> probe loops over its overlying probes, looking for a pid match.
>>>
>>> The trampoline would look for only one match.
>>>
>>> However, more than one overlying probe might match.  Therefore,
>>> change the loop to keep going even after a match has been found.
>>>
>>> Incidentally, it is actually only pid offset probes that could
>>> "collide" with any other overlying probes for a given pid:
>>>
>>> -)  pid return probes are implemented with uretprobes
>>>      and so cannot "collide" with any other probes
>>>
>>> -)  no two USDT probes -- is-enabled or not -- can map
>>>      to the same underlying probe for any pid
>>>
>>> -)  no USDT probe -- is-enabled or not -- can map to
>>>      to the same underlying probe as a pid entry
>>>
>>> So, possibly one could optimize the trampoline -- e.g., by adding
>>> BPF code to exit once two matches have been made.
>>>
>>> Incidentally, there is a small error in the patch.  The flag we
>>> pass in to dt_cg_tramp_copy_args_from_regs() should depend on
>>> whether the overlying probe is a pid or USDT probe.  We used to
>>> check PP_IS_FUNCALL, the upp could be for both.  Instead of
>>> fixing this problem, let us simply pretend it's a pid probe --
>>> a later patch will move USDT probes to a different mechanism anyhow.
>> I think it is more clear to just keep the logic that is there for passing the
>> flag, even if it is not exactly correct.  At least it is not a change from
>> something that might be wrong to something that is more likely to be wrong.
>> Either way, you are changing it in a subsequent patch so the change to a
>> hardcoded 1 is not really helping anything other than making someone perhaps
>> wonder why you changed it.
>>
>> Alternatively, you could perhaps change the check for the PP_IS_FUNCALL flag
>> to checking the prp->prov->impl, and selecting 1 for dt_pid and 0 for dt_usdt?
>> Yes, you will change that in the subsequent patch, but it would be actually
>> fixing this to be the correct condition anyway, right?

Okay, I'll go this route:  I'll check prp->prov->impl in this patch and 
simplify the check in the following patch.

>> Summary, wrong -> different-wrong seems silly, wrong -> wrong (keeping it
>> the same) is reasonable, wrong -> correct is of course preferred.
>>
>>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>>>
>>> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
>>> @@ -740,6 +718,20 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>>>   		idp = dt_dlib_add_probe_var(pcb->pcb_hdl, prp);
>>>   		assert(idp != NULL);
>>>   
>>> +		/*
>>> +		 * Register copies.  FIXME:  What can be optimized?
>>> +		 */
>> I would drop the FIXME.  There is not really much of anything that can be
>> optimized because we need the register content in case some clause makes use
>> of regs[].  And arguments need to be copied for argN and args[], unless we
>> want to implement arg-access using a provider callback during CG, and that
>> would be an optimization across all providers so definitely not something for
>> now.  So, no need to have a FIXME.  It's biger than USDT :)
>>
>>> +		if (upp->flags & PP_IS_RETURN)
>>> +			dt_cg_tramp_copy_rval_from_regs(pcb);
>>> +		else
>>> +			dt_cg_tramp_copy_args_from_regs(pcb, 1);
>> Per my comment above, I think this should still retain the code that was here
>> before (well, higher up) to select the correct flag to pass rather than just
>> hardcoding it as 1 and mentioning it is a bug.  It is easy enough to just keep
>> what was there as logic, and then change that in a subsequent patch.
>>
>> Using (prp->prov->impl == &dt_pid ? 1 : 0) would do the trick, right?
> Actually, since you already document that the pid return probe cannot collide
> with other probes (but there could be multiple return probes, one per PID of
> course), I think you can still keep the copy rval vs args outside the loop,
> right?  And that also still works after subsequent patches, because you have
> this before the loop for pid probes, and later there will be a test to be done
> if it is a return probe, and after that a args_froom_regs for USDT.
>
> I see no reason to move this inside to the loop.  What am I missing?

Ha...  that's why the "FIXME:  What can be optimized?"

On a more serious note, it's an interesting idea, but maybe not worth 
it.  Your suggestion is to do this once rather than for every loop 
iteration.  But the reality is (I think):

*)  If it's a return probe, the loop will be executed only once.  So 
there is no difference between doing the copy before the loop and doing 
the copy each iteration.

*)  If it's not a return probe, the number of loop iterations could be:

     *)  0 (no pid probes, just USDT), in which case the "optimization" 
is counterproductive

     *)  1 (a pid probe), in which case the "optimization" is neither 
good nor bad

     *)  2 (a pid entry and a pid offset=0 probe overlap), which case 
the "optimization" helps

So, which is more common?  The first case or the last?  I think the 
first, but in any case I don't think there is a strong case to argue for 
the last.  I guess we could check if there are any loop iterations, but 
this is starting to sound like a bit of complexity for a minimal gain.

By the way, this "optimization" would have to be in the following patch, 
not in this one.  In the present patch, the overlying probe could be pid 
or USDT.  So, passing the "correct" arg to 
dt_cg_tramp_copy_args_from_regs() would mean args are copied differently 
for different iterations of the loop.
