Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C51217F31
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 19:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763495409; cv=fail; b=gcMgBthuEbVqgu1fb3Gw8aVXMNzM21hNyBjOGc1a/NzkJyGOwM2CKB6Id3c0vmNph1raU7dflMK/rYdihNL5tu78LG6rMSxTfeLatgsxUdk8Bc1lSmWRcpqIUetj/g378VbhWUlkT0YNBgeHyqQQO+u7PuKaXJXIGLFJR6p/Zx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763495409; c=relaxed/simple;
	bh=6FndimWw6tM+YoVT8zauCKmRqHjMDPcbtwrGSFfL3YE=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WmRvi1KqgEt173SM0rpFcj5a3DOPQ5EMX+LY8wV6VFlxeKjab2MMiv66p1knfJEDNnl1gW4OsmH5KKFhKqeTGb27VCtpQ78Kojeg6ioCluP4mus+0Es6QTSHP9g/hRr353yK0rVFa4cRryNmV4lYuma+2tOjNKjwIBAnIHMG2kk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=pQaA6tz9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=F+YWIQiv; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="pQaA6tz9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="F+YWIQiv"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIHNK9W020944
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 19:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=3j8rruFNeq+zyG1vNisUNU7jTTtC4ixfLMcQ/IDoe58=; b=
	pQaA6tz9zGzVZHKrtGBD0b0icxw5TTurOjijGx8UBTYk9l8PHcRZ+wfPq3I63nC8
	NsZmT6bnHjmjV6zRg2zg0aN/aV1YkHYAd0ApMmfCUL4m4/7QGS/GgykCZsHPUTWN
	9B5osU3QeadX0PCYKxxmf4cfnnWEBENN1nloUDeTwp5xubHnduriK500CKqjQxu/
	ZvmIXDZ5XGJuq4mOto8K5GSGs3WCjr+CaWx3YxTC7i6J9LtasAhV38FnVNj3cTUf
	LNGUv85IH9jyVAmFpInai0ENCc8rclQCDhwh2cNlc8t2rQIRUGIP30PXU5kLHu53
	6JLAwaqZC9zimrgkQgiR0g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aejbbwk8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 19:50:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIJVWYE002514
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 19:50:02 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013065.outbound.protection.outlook.com [40.107.201.65])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4aefy9m5g0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 19:50:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgZYDUv5nS7u6kzp5HUGJ0fTMCwvQ99vTLTfg5Ppdge7cetBpcMl2lqObxf//CyAfIFjY+XlZVsPcF4FCirGV1CyO9AX8ygmqrqUESKJYgb4gnflYEoyk3zG3bLYxVkzP9Q2uBhdRl29T/IYwb0w4mYGrGfOoLGB0xUVvJMVxh53GUpGBRxHMeEuQ3m7rcgOUrvpkT02hxFapdIR4+ZOAsn06FgUpLTtMYd70xNrYIVC01RPVZdkMWSBme9Jb88lYTSTxZu6GaEirAzB8NwpsYelznoh2geuq7T2ETqQ0KzaqGChYNUou1d7Yspw01HiyLJyxsZNpE6vXa5We6cS4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3j8rruFNeq+zyG1vNisUNU7jTTtC4ixfLMcQ/IDoe58=;
 b=njngApoQ4KoKq8d+xUXK3RfoPKjucTBK057PflK8WuK69j1lmAIW4ch3Yq9hu0huWd/787F2JZezUcRMtBPNp7ElXVgnrGKdpuRgPmfs3354YkTQUix/keSMkJACV9ZcKUTcqr/f29G4jbE5QmYP6gvDxifJmXOeJu7WJunMKbwlEHnvNtU5Oa6p6dPYPrZLjk/JtEFCQxYxFXEvAEzho+MESVLrirBFaxHvC0e1BIqFCrAnKdd15wNxgj8FIBPWjkzmb74OpC2WWKap0fvHAJ0Uw8OYJaXMLFR7xnxaaLdn18Ixex0y8k+yykWPvVp09n76u5+izaldEFJFypgjUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3j8rruFNeq+zyG1vNisUNU7jTTtC4ixfLMcQ/IDoe58=;
 b=F+YWIQivbfTZNYVm/WN+v3gAGaSf11VAUFf7EssKU2sIvcsNMTVe+LylZY++kvSIup2YrgQaRfJPHyDUfM/rb2Rlifx/H6HL6lkqshnZ4RdNvOOwl23PSZJS47YDLjY+OPOEfzgLuSPFJVChBxEKyANIiRzq9gMeYN7wRVSSBY8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA1PR10MB997760.namprd10.prod.outlook.com (2603:10b6:806:4bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 19:49:59 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 19:49:59 +0000
Message-ID: <1ec9412d-d0c9-4df7-e69f-f561289c5867@oracle.com>
Date: Tue, 18 Nov 2025 14:49:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 6/7] tcp: support non-libctf environments
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <BY5PR10MB39878BA514CC155F59584E20C2D6A@BY5PR10MB3987.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <BY5PR10MB39878BA514CC155F59584E20C2D6A@BY5PR10MB3987.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::10) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA1PR10MB997760:EE_
X-MS-Office365-Filtering-Correlation-Id: 30cb2ec9-4c98-4534-4a66-08de26dba7e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d2xmTzN5Y3R3K0RDVTVUMVZmeVNoQXlsc0twbHZYTC9HN1cvb3RrUTQ3dm1q?=
 =?utf-8?B?TFNWSFRLYlVoWVJMVm8zaWVrR25TQ0VrbVdVY1RqYjJJTVM4NGxkcXhhZDV5?=
 =?utf-8?B?ZDVTT1I5M3RDR1JqRndFZG1aellmMmF2S1JZaTNuSUhuclR4OElxbSt6YUZ1?=
 =?utf-8?B?Z2dTV3lRak13WlhyaWhNSFFiaEtZRkp1RUpFQkFkeEFXSTJsMEVIZkh6ZDIz?=
 =?utf-8?B?bFBLZVEzNHE4RjJQWDFCclgwbTFVWURKcWg0NlNuN3BwZ2pmMHgxaEhpRkxU?=
 =?utf-8?B?SDVGNUFPM1hOdCtXamRvbzY4Y0dkZDR0VTZPcDZQU1ZIOGk5VU1LT1pqVlpR?=
 =?utf-8?B?MzZ0dnpORmVRRXBCb0dJZ1BZL1hwK0xWbXY0b1djRmhNTmxDTXprSzErMDll?=
 =?utf-8?B?UzZZUmljZkhCV25ENUtraTdUU2w5dkpFaXBhRFNlTFZsYlhBRjRORjUvdk5H?=
 =?utf-8?B?QkRkQTlkMEVGdm44QXJYTDhubmI5MWZoaS9QcDN3Vk1nek1WUXN1T01zTWF2?=
 =?utf-8?B?YTkxcmRiRWQwYWUzUzYyNVRGSVRrTHU5SWN0OXl4ZXkzYzFmNkRta0JvdW5i?=
 =?utf-8?B?cS8zeloxZmRoeTlRQkN0L0ZqR2Z3cklmYWdHNGVlQlNzeEtROGtsQlNHZ0xv?=
 =?utf-8?B?S0hBNHA3RU5VK1lFNWJXQi9kNGkxalBjcmFDSmZJM2JkY0xXSUk5Nms5enN4?=
 =?utf-8?B?OGNNblNhSDZKbUp5NlpwMUVuNXYrWDFscWVuTkpPTC9PUE12UktscFRxSnBH?=
 =?utf-8?B?RjVJQ0ErNWEybUR6RzhUOEkxT0VWN2gyL1Y1S0xENU5UTXhLdlovQ2laRjI1?=
 =?utf-8?B?cnViOHFTNmo1Y2ZKV2NrT2dtZndpZXF0QW54T3owZmt3TFg5Z3JXYnNMOVpO?=
 =?utf-8?B?M0srU2JmNFlxcU1mOS9sOUNrTDBIM0RodDd4WCtQSm9zTEpCSzgrZHN2WmRC?=
 =?utf-8?B?TzFiM3IzUHQwMEx2di9Ndlh5ZWZKNnVUeDhPOHllb0VXUjJCUTBqYURydmZu?=
 =?utf-8?B?WThVcHdySWZOUE5FYnIxSWJSdGgxQnc2RSt3UXc4K041enVEeWNUWGFjUjhl?=
 =?utf-8?B?RDBaS0hiZ3hZTWtnS1RHeTJuSzVGSVhWZHBVcXE5QmVER2RJZHJ1MFlieThw?=
 =?utf-8?B?b3hyNy9pRHpzaDBsOGNsSmxmYWtvb0UrVHZFUytxUVNhVU1sazBGYWNRbE1a?=
 =?utf-8?B?S2YrUWZBckM3cWUwTWE5SkRibnBZKzlDZXQ0MEN4RURwWmE0OE05MDF0M3d3?=
 =?utf-8?B?NUliWmx5b1BwMllkckF1ZmhrSjNCNUNtVDhnREs2OEFac2tEY0dJQ2c1RWhi?=
 =?utf-8?B?VnZDTzBJZGRKZUZvVXEwam5CeDVaMzliNWxJSGt5ZnJpb2h3RXJ2ZkJRL01J?=
 =?utf-8?B?UHBGZWwxc2FqcXNrc1hPbFFTNTdBd1Z3ZjAwbXhkZ1NUYTZXQyt0Zy82NWxa?=
 =?utf-8?B?dFlZbUJNV0MwMFoyWHVCcjM4emN3YWcxdXFkNlIrTThUY1lrTmdTbGNuOGZJ?=
 =?utf-8?B?NGRRRU9kTCs1a2hiN2grWGNHQUw3SFdmbWhqdmh6REhLRzNNdVFVSnZvWG40?=
 =?utf-8?B?MUl4UUJlVno4MER0cGF1T0pONDRTV0lHWWVGekxaYkxLRFhGUTA0SUhuS0Nm?=
 =?utf-8?B?cFFwdUVlN0JVSmlHanZRQlVtbDBjakVOaTlEOHpCdktVaVR0WEZmTlo2cW0z?=
 =?utf-8?B?RXpXNDFsUjdmWkNXZWdTSEVlek1rRll1UVhBdUo0b2NoNHlYbDhobEpibEcw?=
 =?utf-8?B?S1M3ZkwrMkt0N1hkcTFUbWQ3MW1IQVhiNVRNOVJ3d0Z4QVdhU2VJNzRhaEtE?=
 =?utf-8?B?dnVqQ2lGcWkwb2JrYVNyYnVHTXlZd2w1L1JmS1JSbExuTDBQd2JIRDM2VmtT?=
 =?utf-8?B?clRKaFBXakYxZ1hoNDFqc09zMWwzQW1RQ0tOaWFJWkhKMGI5cnZERWIzbXRy?=
 =?utf-8?Q?Uf/xSiBhPM7NB2uB1RqxhybU4i+DtOVl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vmtjb2RmbHZLY3M3Z1liMEliU0wrZXgvUGNwQ0FTN0dWSGwvc1M2U0VIUjhX?=
 =?utf-8?B?a3BsaHQ1NHk0cEFQMG9vWllXai9XZU9NYzRkREtoRjZ6am5YU01IYzdXQkRD?=
 =?utf-8?B?Y2REenN5RzRRRXlaeXlBOTBqeFF4b1hwNXd4RXJMTFYrTkk2VkQ1cUhRZk1q?=
 =?utf-8?B?K3pOcHE0d0RIcm03cWI1NWpwYnFBZXlyMitQVHFVNGR2ci9VUytSaUFuTFNl?=
 =?utf-8?B?MUZVYlBPeUZUMUxZOStrUUcxQTVxNFI1VlgxeXpRRjdSajY4ODVPTG5CemdG?=
 =?utf-8?B?cE1MaGI3QTNGTkc0dlhHQXdLMlU3TU9WYzdVcFlhQmVWNFJlTElHdjVpSHoz?=
 =?utf-8?B?MlFJdkZVTENrL3I1di9lTlZua1ZZRC8rY0RtRWdSSE9CZ0xPaS9KTVdtRExO?=
 =?utf-8?B?Wmk0OEpqQzdQcUJlNHZzMENjUERjNS9DdWJVM3ROM2ZoalJ4NU8wVWRFVlNB?=
 =?utf-8?B?S3RLdUROYjdoT0pmbFVMUjl6YUY3ZnhZQUE0Y2RkNHhmWVFiQnlBTmxoY3Na?=
 =?utf-8?B?TnM5L3R1VExsVWgrYVhEem0xMWR1TnhSNFhFRmhJVmFWR3VGTUQyZWtwYjU3?=
 =?utf-8?B?Q3kxY2JEYlJ3VlRFZ1ZTa0lqVnFPUElDZWNZK0pOV3Y5b2MxeDcrck9qVlVv?=
 =?utf-8?B?QzVBd0Q5SG42MnM3OHNUMnB0dDJSZm1nOUF3bm43bWtlSnZvUFpjaTIybTYv?=
 =?utf-8?B?YVMyNmFqeWhtS3NtL1BmTmtMWEFESE5ILy9HaEhlckQ4RHVvbFNGRWZNajFU?=
 =?utf-8?B?bFlvRGlXb1d2OUF3MTl5R0V4K3VTWDNKMEJIVm9ZRTFHL3VVV1VyS2NudHYy?=
 =?utf-8?B?U1hGdk9jZ2lWYzVOMkpGK0JSajZuUG5pZlkxQVJxTnRLd3NWTnhYMUovK0tn?=
 =?utf-8?B?VlRVT1g3Y2hLL291dDhPcGRPb1lCRXoxSmNPRCtpSVNKeE1XVWtYZ0VtVE42?=
 =?utf-8?B?dnRHYmxaWEVjNVZTWXJnOXlXcHlEenAwWDU5UFB3V3BJNXgrWUtmODlqWjk3?=
 =?utf-8?B?eU1SaFZLZDhYZE8yY25XYi9WL0k4TFFJRTFZajlzU2ZhL3dndTRoWWhkTXlB?=
 =?utf-8?B?dU5HazZGcitONTdsS3drWWpiVnZDRlhLZXFtTVVwRm1VU0hkUTN5OHU1cW5m?=
 =?utf-8?B?Vnp1bFJzaENqcEJ3WmFGbWFYZm1CUFRXRWtuNnA4aktWSlJEbmpyYU9rYmZK?=
 =?utf-8?B?WmZhREpKcTFLbHpVVWxjM3duUGdMcXVKc3YrYi90N2ZTNUoxTFhvWTRZdnlJ?=
 =?utf-8?B?ZEEwaHFjR2JZakVxc2ZXV0ZIWTB4R0pMclErci9jWEUrU08yenRwelNQNEU0?=
 =?utf-8?B?YzFoT0lGTnFBaXNybDl4TzBRbmZ2TXY0OFZOMUFabmRyYW5UeUIwajQrSWZ1?=
 =?utf-8?B?dHZCN1FCNGN3YzlHckU1TklWZ2JXcjBCYS85VzY1dFFRK0dSLzJsUnF0c3c0?=
 =?utf-8?B?Wm4yZktlYjBMRUNselFRd2RWMUVBSUxGejNWTUxsbEZNYVlCSTRZMldkVElX?=
 =?utf-8?B?eGk5RzJRYzRRNWNkbGlGTDA2SHYvR1pKMFQwVWIwNGZkT2tyenZIc0VTMDc3?=
 =?utf-8?B?QW1pc2E1aE9KMElKb2hJTG83VDlSOU1DdjV5R2RZellmaGV0aXZGejY5WnBR?=
 =?utf-8?B?ZFhJQ0ptemdkTkk2SEVyWXFNOCtSM3o2Q0tiTHRjeDdZbncwVWJGa2JqREIy?=
 =?utf-8?B?akJTc091VDl6SXdpNUxRaHVqSEFhaTZlcjZjRTNHcEhXM2xZa1BwZFVTTWpv?=
 =?utf-8?B?VHZpS2ZlSWUrVGxZMlFNK2ZJT2pzSE1wcndNVDlKd3FldHYrMUdDL3hxRHlS?=
 =?utf-8?B?ZUdWZ2V5cXdic2JuQmJ3QU5qTDVGSmNMV1JXWDlFcmRvTFRrUThiK0pEN1RV?=
 =?utf-8?B?d2VxczNYeVR6MGIrSmVLK0RZNjN5SVEyaU1xY3B3WXBRT1FpMUVpQmdOMkF6?=
 =?utf-8?B?V04xWEdWeS90NEpzcG5aMUZHdGhaME9LbUZxV3N5NmlzbGVrbzJlUDJ6WXlQ?=
 =?utf-8?B?QjZNSW10N20rcEZJRHpVRFJVTlVMcGc3ZWtaZElPR0NqS0NFMWdGRnJ5SFNx?=
 =?utf-8?B?ZzhxVG1RYUxLd0xrSTdKdmt1K00vczRNTkY5WExNck8yUTYvSDc1N0xKc3Nh?=
 =?utf-8?Q?1PPNtdyzADIkzu5CAjALc1geV?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FUxdMDoIpHsI8xLzWaKdNhcPUnhhTPVC3xB1ANjQSRiebHIKS64cP2kIF7PLPQbFbFR9nSj5A/hoPaFoqWUeEzja5eeg5P8iKEcdrCj955kNXoQ1OEpDk6aIl2r+z2wTKq4bH3CfHiTf4HWd3moloNEJiqKDZdDZiUM9NUFIL3A9iKGOG+sxr8RJg53NtZw4JuExoAVYivnqbEEPyhUdFHXIwYNy68iAv9PuISfrFlnPlCTPG3/d0LMqQxEFOKB8msS7pECEx/8k3xETxzX3pOsXZYYdty7J/SaC5Gd5b9vr86XjF5gttCdq/NJwKKWVB1tSWAwDVNzex0I7ajAyOsFXLerHo7h4Nxh2+1SgKFCIA8iyzw2eE/eBG/Yn2E1ASOAFRmk6HOFl8QWTypduhkJMdWfiMxMDXsUE/idZ8XwF/+Y07EQ+cbOfTJaCcg+jkByo8vyW+lPXbyZ2KnH307euEbLhldvbLwJz62ILFiw8ArbgaB8kI13by3LrtaN+193rl/TZK8Le0wozvw/cD/9sBTGGg58I1pnNUUDsZugZ1hx3jAt5An9saL7vbt66nN57Ppy8t3Q/LLJMAMeEBnlXixDLAlnmmyvwkqJ398M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30cb2ec9-4c98-4534-4a66-08de26dba7e1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 19:49:59.1035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FP6J3/+r8W5gRrQg9NPTyoNUn/+aHadzlRGnk/LBMINDYNh8IdCQVyaHvMQnLNqYgQzWaNbR/7isRkKNHs6BDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997760
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510240000 definitions=main-2511180159
X-Proofpoint-GUID: Wkll8NAziMoVGLi1jEUWx7Eh0VW5Ne9Y
X-Authority-Analysis: v=2.4 cv=JZyxbEKV c=1 sm=1 tr=0 ts=691ccdeb b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=gzD-XeFxUMnl62PFP0MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Wkll8NAziMoVGLi1jEUWx7Eh0VW5Ne9Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX2qkxYzryHUrR
 DM+xjGVvr3aKn+BP99LEH2c5HCSkeV4HrsSA8TrjLHA3lO3cHyvy0ZAKecaTCMmL976Ae0kdiPl
 mRsUBpMBL9ynsO18lQYXJ05jFFAjBVmadzG2NSYMZGtHJq95fbmcHKoEjmXPjqLTTaZAta2WnEC
 SFMvDpj4yY8DNG0syrKIYen7WshkmX7rkZ+qRX0H2a5Ec7+j6HoHY9w8HhPBSdwbWgfHdUkYaCP
 iV8opn4DCuwKJVQhz5sOTwZupl4+9oYBGioj0tycZ0SidWa89sICz2/zpNZ8l9DxWWRzXkJlaVu
 OMyTaQ3EtUygkodoWS145rvOLU0QDm+3Ji0Fk/rxGAa4uHa7v5A5o1MGYOwGc0w8hBZ9pV/x1TL
 ++cbRfjVNwBDlXS0Qh2e27V2WIQ2/A==

Okay but we should also handle these compiler warnings in the not-HAVE case:

* unused variable:  rc fi sym dtp
* (potentially) uninitialized variable:  skarg_maybe_null

On 11/18/25 11:38, Kris Van Hees wrote:
> Commit 0fa93b3ac ("tcp: new provider") and commit c08a5fcf2
> ("tcp provider: support tcp:::accept-established in absence of skb") both
> introduced code that uses ctf_func_type_info() without a pre-processor
> conditional to also support the case when libctf is not present on the
> system.
>
> When libctf is not present, it is assumed that the system is quite old
> and therefore is running an older kernel.  Use of libdtrace-ctf (which
> has been deprecated in favour of libctf) on systems with recent kernels
> is not supported and may lead to unexpected results.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_prov_tcp.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/libdtrace/dt_prov_tcp.c b/libdtrace/dt_prov_tcp.c
> index 44ed2bc9..319a84f9 100644
> --- a/libdtrace/dt_prov_tcp.c
> +++ b/libdtrace/dt_prov_tcp.c
> @@ -262,6 +262,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   
>   	if (strcmp(prp->desc->prb, "accept-established") == 0) {
>   		direction = NET_PROBE_INBOUND;
> +#ifdef HAVE_LIBCTF
>   		have_iphdr = 1;
>   		/* on older (5.4) kernels, tcp_init_transfer() only has 2
>   		 * args, i.e. no struct skb * third argument.
> @@ -279,6 +280,10 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   			have_skb = 0;
>   			have_iphdr = 0;
>   		}
> +#else
> +		have_skb = 0;
> +		have_iphdr = 0;
> +#endif
>   		/* ensure arg1 is BPF_SOCK_OPS_PASSIVE_ESTABLISHED_CB */
>   		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(1)));
>   		emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_6,
> @@ -305,6 +310,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   	} else {
>   		direction = NET_PROBE_OUTBOUND;
>   		if (strcmp(uprp->desc->fun, "ip_send_unicast_reply") == 0) {
> +#ifdef HAVE_LIBCTF
>   			/* Newer kernels pass the original socket as second
>   			 * arg to ip_send_unicast_reply(); if that function
>   			 * has an extra (> 9) argument we know we have to
> @@ -329,6 +335,11 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   				skbarg = 1;
>   				tcparg = 5;
>   			}
> +#else
> +			skarg = 0;
> +			skbarg = 1;
> +			tcparg = 5;
> +#endif
>   			have_iphdr = 1;
>   			tcparg = 6;
>   			skarg_maybe_null = 1;
