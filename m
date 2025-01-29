Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFA71802B
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 00:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738112040; cv=fail; b=RwO9eBCadAjPWGA5/OjCCfaVJkjxr+jIEUVWbf8KoZJHmKxWaRf31tsjIGKlC0BG95TiTc1IX7HwDoVH74Quc36lIm1uia5YaYzaReDESv0ywv4a1LAZv3XCFM6mKhZQwjMyFj5vzpQD1Z+AQK5d554llixWyVoroGIT6V4EH6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738112040; c=relaxed/simple;
	bh=E2EGeUd87dDYmt8zp6CAsSTD7IegCOken6SeGwA++hw=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Sa52uEilkIF1WrOpW+l16NNnFjO1iDlVHpDZJBHHS6uYu327KA8GbQAYhJS5PMAPwEc2ieEvFu/jDCJiCfJuqmz8c4xsg0jK4Tmbx4r7Xb0/PUCkXCTdHmUcJWEjZ2e3wNRyilPa30asxs+2vSu+aOmSVHKD9YcMYl0zXBQJuXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WfMxv06M; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XZlH5Prn; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WfMxv06M";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XZlH5Prn"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T01wFO020143
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 00:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=IRkFefF6n24yCdKvxHlHbRhKQzNH5opfC5vZ47O3v6Q=; b=
	WfMxv06Mf70Sk1QEIjZKD2yCVmVJjuevHeoVutkuae6LSjGFWROLVKgam9l2X5YY
	veYjs40GUHkvnzWdNIGPEJ717t/nXaFR9PhYNpg4XPP+IDlj1e9wbECjst7gXnbd
	xuBWR0krSxEekDh/r7XN3kk/ShGudCD3gzIUw+ht10lrvffbLQ1iDc8z98jr4sFd
	K7H242GDCB9OH5HHz8VNFoS7Et3Zf0JFHq8R2OfIq6JiZVsNY3U7d9PC1uXbThoQ
	rfQ1/oGGPL3Lf/h54Eb9oJB9aRL7iAhmDzqRcf/VoUSL8inIp8aEu/25+nLhzhRn
	hwmzNwkne9I5ZsqHrjEU6A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44f9e8021k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 00:53:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50SMjDVC022044
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 00:53:55 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2048.outbound.protection.outlook.com [104.47.58.48])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpd9437d-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 00:53:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cyfHCobQSxOiYrsTxtg43fsJa24U+tQHvS5OrrTdWuRCzDClDCMEcLTBEF7LLqEDNV3z/URTPP9onndeKacerprL0LK545lqe+UYGez/TZG1yMise8bGA1IMnnub308A6ztVNHOUpxaimXk7eilTdKQHaM8POyLlJt5JXC5tACZwsofMz5hZAOKRoz/pQQJr0KFOXSD91oX/ao77aX9ECHbNrDhmuqFj1BGAErrKxqFV4+NDrMtUtwyzMZL1JlABHpFoG6wbDRX2wjzsGJCpnuPj+InGU2lHqL21/jcNREaXI6gbH+VLnZqCjbTk/qTph7fhCfArdsV8sxx5XiidBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRkFefF6n24yCdKvxHlHbRhKQzNH5opfC5vZ47O3v6Q=;
 b=J1acCRirDt1LHcpKG38938ST2Jl0K7xBjXkmsY0shVn5WlVuraKQWudGLiWtnK394rn37g2iOuE8P1B3RLk2arcL+leDqx/aaY80MVRzcIfoYNbVpkb49fzeW76ZY9aA4jQrGvI+9BlG4AhdUdjV7cUCgYcQyQ8jmKoFwJE62qMjvxZoLoVnnG67a0ihNWA4E0yK8HPRgBpmWQUXaHDfLTST+kJczKrnDCsCiMhSws5xNroSoqAX+4Ufo9U/xtY2lv98PwWqARHZQXUb2/UNiOjwke835sznV5LtE6EAdsixGdbLP1RO5fuUYDaIjTl0QzAqsDWYXhD2bRtSZ2wJlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRkFefF6n24yCdKvxHlHbRhKQzNH5opfC5vZ47O3v6Q=;
 b=XZlH5PrnOZyOHPRH7eaBt63Ej83KuPyp6+oleiLP2guRcHbS+0ondgvAuuz1/PPT6U7lkF53sbl1xB44KcM7VNHQVfJBamysjwoKTWmiuJuDhYyw8x1UTnEi8INGr+B20mXz3H0BTtPVpPM+Si+1Y7bBMomlxe/9LZqMWnLLzRA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO6PR10MB5651.namprd10.prod.outlook.com (2603:10b6:303:14e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Wed, 29 Jan
 2025 00:53:52 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 00:53:52 +0000
Message-ID: <9164adb5-a6b1-a7ff-530c-6aa30fa57be3@oracle.com>
Date: Tue, 28 Jan 2025 19:53:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 5/6] procfs: add 'execargs' global variable as inline
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <PH8PR10MB63378175F68DB1DD5D55463FC2EF2@PH8PR10MB6337.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <PH8PR10MB63378175F68DB1DD5D55463FC2EF2@PH8PR10MB6337.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0368.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::13) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO6PR10MB5651:EE_
X-MS-Office365-Filtering-Correlation-Id: 533b5d2b-be65-49d3-d839-08dd3fff667d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TkFwS2p3anJXN0U2Yk9WVVdVdzAzdjJCaVR6NTVucHFuNzUwOUZrL2xyYmti?=
 =?utf-8?B?dEMwQlE4cXJhT1JkNVZYaWRPdzQxcVhUc1BocDhQbmlVejJhLzRUOTNBVEcy?=
 =?utf-8?B?VkRZWkU0ZjJ1K3Z2TGJLT29wM2l0OHZkSHZ2K3pzd2RrVFlVY0cyUE5lUSs1?=
 =?utf-8?B?dnB3NkpJMWkwWno1ZkI4aUM2aklzbmtraExIaHM3MmFodGNJMWxXa2hLWEhw?=
 =?utf-8?B?eGtENnQ5VGFNVVVTUzZMVWdlajJPL2hQVjJ4RFE0N1Z5b0RLbnJjYUxocWtq?=
 =?utf-8?B?Q3c3VjdhUmVJa2oxTFVUcFFQa2RSeWlKNVFlMTkzZEhqZlN1ZmlHSnBUajRO?=
 =?utf-8?B?UlEwMFVobDh0dGM3TVR1ejF3Ylh5UkRZNUZLM2JmUjVsUHpacm1wQ1R6TU92?=
 =?utf-8?B?T3loYlUzbFQ2S1B4VXFPaGhsc01memJBQittQ21rMHUrWU9RZk5CTnBLVXBa?=
 =?utf-8?B?U0JIeG9lRlQybFB6aDQ2U1lmS0g3UTcveUJrWlhPRDBzMWptWUdzV2pmWDNy?=
 =?utf-8?B?VWRhdDJhQjA5N3lnOTdmMS9XY1ZCVlBQWVNlNG84a3lRcUdNN0dGODg5UVdJ?=
 =?utf-8?B?ODdQZ0VQeWlpZ3hQZHJERnlGd0ZxUGZaMjVIN1lQRE82a2NkcEk4d2I1bElw?=
 =?utf-8?B?WTVabjg5c2pYL0ZMY0IrRy9ZQ0Q1eUYzaDRoejBiZGM4MGZIVUYxOVFLK3Fu?=
 =?utf-8?B?SGExaXBIV0dWajQ1NzkwNThKV3RMbGxUV21TRnF3QVZqK25PS0NSUGtXaTRS?=
 =?utf-8?B?clN2U053M2Ura2FUUGJYVmY0V0ZnczhRREJSMVZOSUduS2xQVTdVQWhqQTNY?=
 =?utf-8?B?Z1VrUW5oVjVwR3VEQ2Vod2tMYStqVnEzNHNDMDVjTTFzRTNaTm5hcGVjb3dN?=
 =?utf-8?B?dHZCLzh2Y0pTR1o5dm9Cc1VwUjBFRWZqTi92Mm8yUng0aDZCelRRS29sQ2Zv?=
 =?utf-8?B?Q3k5Y3VNK3U2aHRoNUhnQ1NRV3I2Kzd5VDZSS3k2MlJsc0hiNkpOM0pmUU5J?=
 =?utf-8?B?WllaTHh3NzZ4bFpiNGtVSXh5dGJUWFcxMG9qZFZVR3lSR2VLQWtqWFBWcURH?=
 =?utf-8?B?YzdiakVoV1NrdkVDWndrS2hCendqdWRwY0hvb0FTbDhOTitSL05ZeUtyOE45?=
 =?utf-8?B?YmZuUkpCKzRZZmxnbjhHZndMcTdzT0VMdXo3MVNwVEpCOGlEWDBpUzhWLzNu?=
 =?utf-8?B?TXNPck5rd0s3KzBKakZuUElxN3BMS1ZVcUFGRHVZbXR4d3RkeTdKTmZsWmxZ?=
 =?utf-8?B?MjQ4YXRjbDNWQUJINWowcGd6Q1dhRHZUR2tzeWp6YTRsclp5NUFaL2hRWGhZ?=
 =?utf-8?B?MEdFMTFldDNzQWpxR2RnbGNoNGptUWRLTnZHYk1kM3pzNzBWZTZrNUhuWXlB?=
 =?utf-8?B?WGIvazd6UUFVeHpuenVLcDE0MjdIVEppSFJ3bkIxcUtLUmNaUjdSL2lGY0xI?=
 =?utf-8?B?THgzVHdYaTgwL0pEOHJnZnlFK0VSL2FqU1RJYlpuRTlORDFIZWRrQmhXQkhF?=
 =?utf-8?B?b1BCb1RiTUx0WjVCUUEvMlpuQmpNRW5wNVN0bFdGQ1hIUWs3TkNDaHNvUm9N?=
 =?utf-8?B?amtneU9oNUJOZFRSWThQZ1M0enAwZjR1QjN1VXE5dWdoeWlwaWJGKzJXU3R3?=
 =?utf-8?B?aURhK2phQ0hobjFqNEFSWVZaUm4reGFIMk1DL0k0MkZxTmFQQ2FJRzRoY3Y2?=
 =?utf-8?B?WWxMWFVXc252dEFHblh4RGs1SFlnTkU4WXRnRzBhSlVYc0FiN2t0UjJxU2th?=
 =?utf-8?B?Q2RkR0lScytJMGlLTFdBRVdCRmd2K05Hc2JBWldKc2svMVY0dXloRWpDZC84?=
 =?utf-8?B?cE5nUURhcCs2N3ArSnMrOFhoL1EyTU5yc0I0WExZTExCdHJBcTBtby94VzNa?=
 =?utf-8?Q?aJ4+pGOyJw4G+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGQ4YWZwNGEvL2RnbmtWc005cmNmSmxoUEViQlhVTGxQbE9tV3UxdHNVTmZJ?=
 =?utf-8?B?QjF5NHhKckpENndPb0RJMWpPTzUxeTZmTkNBNTJNT3FuTHJPSThQSnpwSUhn?=
 =?utf-8?B?aGRYbDIzTXFOdytPWUUvUHlpZ0ZlZXJPZk8xa05EZitYYUFjSHl2OGRJYUo3?=
 =?utf-8?B?VHFYQVVPNnZNS3Q4YW1UL0VlNVB1Z256NXVicWlzRXdZYWduNUFYbk1MSlJh?=
 =?utf-8?B?aHhTQ05QRndJMmp4Mi9VVTRxUzlSQmF6SitlbHR4cWdFUlpMamJCWFIyYXJZ?=
 =?utf-8?B?TEpYMzRnM01xY2k0UXMzNE12M1JhRXorbnYxQTFzVG9aVllpSCtIdVo3Q2VZ?=
 =?utf-8?B?UnZtNEE5bkJvT3E1c1B2YURPTk1DUi8wZk1qeUpBUXVMOFZFdjNxN0g3QU5I?=
 =?utf-8?B?MGppODBnVXV2VVg0RmFWRTlyS2Z4bUQ5d1FFNkM4SXRRRzZ2M2RiK0NoTEVQ?=
 =?utf-8?B?QTVQMUlMdVJQaHNaVlRZc1lwNFlpSXl2c3NOYmRBQnMxcTU3cDJzeFRMK0cr?=
 =?utf-8?B?dnJnUVRaUDB5clE2YlRyS2dhU3hsYmgwYmtvTllES0RMVnBwWllGN0Z0dEtS?=
 =?utf-8?B?bjlwdjBva3VYWTh3R1FKQVd0TWJjV1dlTFY4V2VpYWZGbXhvZ3pLcG1FRWRE?=
 =?utf-8?B?S1ZuSjJkNkJBajhSVVc3djlxUXg0Rmg1TGczemdDS2UwU2NJWll3d05LK3B5?=
 =?utf-8?B?dTlBeUhoWER4YW0yOTE3ZFp6WWU4OEhJU1NBL2xhVllZVmZJZVhZV1BjWllL?=
 =?utf-8?B?a09zUm9lOUVCWHlNOFQxY2dVeDBIMGIveFNhZVp1bEtZa1Z5QkhVZlhpY2I2?=
 =?utf-8?B?Z2Z0U0RGUEJmeVc2ZVNUczhKbnBRRTgxYXI1aitUc3Nya1JnQkErTndnS3E5?=
 =?utf-8?B?cG8xREduTTUrMWJhamIyZ04vU1hpb3RUTDUzVnNrQk15MExXaGI5eUJzaWtk?=
 =?utf-8?B?K1QxM2NLODdVNkthVUowMXVzQ1RkMGlZS0ZUVDFsQnA0cXd1WW4rS2NUV1Q3?=
 =?utf-8?B?SmNsV0hTU2RvMTkvUWozWXJiMGtYVE5taXowWGQzOU9wb0gwYm1yUjRDVVc4?=
 =?utf-8?B?cG9ZNThYNkRycU9Vd1hTcjRMSnhnYkFjY0VuZDNWZFdCZlNqdVBlY0tDSWlM?=
 =?utf-8?B?MDdVRHZ2eDNnNHFqZHZONWc0RUlTTW1JaGExV0FFNGh6SDlncWZtQXJoQTJ4?=
 =?utf-8?B?eEtnaUNTRUlHbUMySlJEaGp0QlVWSUNZNjBYSUJZbHlRTWVBcG1CNStaNWMv?=
 =?utf-8?B?N1d4Q2FqODVwYmdCb2xVVE1LV0I5OURMUFJRbE1iNmdBSmJ1NGhBd21tNXVU?=
 =?utf-8?B?VC9lbDJkRWNzWUMzSElTaVVVRXZsNW5HQVVjd3l1bk1Hd0lpeU13K1JtMW4w?=
 =?utf-8?B?b0x3YWd2TWxiMk9Bd3dqTDYwTEh0YkpJVDgybG5VRG9Ec0dWUHRWRDM1OEVJ?=
 =?utf-8?B?ejJpVnN6MVgreWhPR0tQNkJCdWxKalQ3WWVHalI5Sm0wYmJCVEZpKytlZmpE?=
 =?utf-8?B?MmFtaEcva09WYUhuVnA2QmRwNGJBRCtBL0FtYkVYZmJtUGJjUzVhZEduMkZK?=
 =?utf-8?B?UjVsbDUwcjAwWThQYXdGSHRVSSs3QlZCWVNoY01FYU1ha0duZmNpNExFdlZW?=
 =?utf-8?B?OGh0cjFOczdLMG5PVWluc2ROakVIM1RDbEc0a1ZCUk5haUlvZFJqdm1lcjk3?=
 =?utf-8?B?RU00NUJQN1R5eEl6VWdOVkZLSWJHUDd0UUVpN25kVEVncWdibHkreWlJbnJq?=
 =?utf-8?B?STNZdG5lL2ZTS0ZtWkxQckJyYXhJWURyOGxjd3RWZko0UktWN216UmhKV1Bt?=
 =?utf-8?B?bkVSTk9DSkJqUUgxUDAzajg5Q21uN3hwVGMrOUozc3h1SkJnUFVyVW1wMXdQ?=
 =?utf-8?B?VHpOUWpxcTJMZGxSNmhhQWFpVEl4NVVXM0JYb0Rhdnp6Y0tTRkhpZFVnWFE0?=
 =?utf-8?B?b2JGbUNDYk5pY3lLeWRDQS9FT1JhcXducUt5dzZoUFdqU3ZsUE5yMnFWTnho?=
 =?utf-8?B?eGJkSHdadnM5WVhBTzNEU3VVdFF1M2RYcFcwSnd4VXdLOUgxWWZWTW1zakY3?=
 =?utf-8?B?RU85VlBkTGhpbUE3VFhCRjBTSnE3TnBRK3p6bmpiUVBlQTNPZTRCV1FLREho?=
 =?utf-8?Q?Jw3xWWSUbpsZPQJjnekl5UDId?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BSVYivo+XlvJEZe7pRqv3MNrozaP3uqnhOaiGj0C/ifDk33ZbH1HpMGJhkjTZw8ii6Tog1Ax9VLoiaoKg9BPKJdNgYVnl4apWJ/AkHWxvU8C6iMyiF44QKpJnkreSARhALjuWRsSDfiXO2A5pAyaJYjSjPEhPGgyABPfcb6edHO4qvV2OA6LPRAiT13SDituesTywuj5TrcIkFfbQ/q8Vs6uEhf/Fj34R4E2XFj/oxe9Lt3eUcxNdS/aQ2g3bVYfE1eGcr3xK16C98+eTi+JzSCwO1A3CBEgDd19ygjiRyce2Ln5+84td0ZzdVW9Ny1kS9Db/8rFrSKhjulBt9sjNouaHP0z1v7lzG93DWTVOEfvCuU1UWS4MXQfipN3igP/8/lSowCCkRItF+h7kYNkDqoazlRAiJQpPxO9Ah5cZM4NkJiQNzwgoDGs2BbFgLN5uaLnrKhILi7l7WeSIlFWdIkMkJKq8zA1LWQ9vS9/1mMHdlDPQK3k0ZkZvJeAqJTgPr8I7FNBVopCldwq6cITvHlaB6VZYGO+WY+etXXT7+IUxOd/NQ+K2bHwXHWbj/kUbUzDI+JFqQpQf20Bmrdaz0Yn7mWYQaaAKXd/pi8xuEQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 533b5d2b-be65-49d3-d839-08dd3fff667d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 00:53:52.6891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JhBKtfrYnKt7cjJL2WNA4QX8Q3vwmOhExc2xp5fpZbN4ysHo/Hw1Sm/Pl+AvazjjfWPDbjyplNODzNBXEXy6tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5651
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501290005
X-Proofpoint-ORIG-GUID: _JvQ14r77cDzFqM6Jk4vBgDf1zhTruZg
X-Proofpoint-GUID: _JvQ14r77cDzFqM6Jk4vBgDf1zhTruZg

I'd like a little more context here.

Features:  There is a new execargs global variable.  I take it this is 
new to D or an extension to the D language?  Would it make sense to call 
this a built-in variable?  Are we also exposing a new function 
d_execargs()?  Shouldn't there be tests for using execargs or 
d_execargs() in scripts?  I cannot tell if we are adding new user 
features (which should be tested) or not.

Testing:  I see that the following patch (6/6) lifts some XFAILs on some 
pr_psargs tests.  Should tst.psinfo.d be added to them? And should the 
removal of XFAIL for test/unittest/builtinvar/tst.psinfo-bug21974606.d 
be moved from that patch to this one?  And should there be correctness 
checks for this output:  not simply "does this script not blow up?" but 
actually "does this script produce correct or even just sensible output?"?

I'll look more but am certainly unclear if we're talking new D features 
here (and if so, why they're not tested).

On 1/28/25 01:31, Kris Van Hees wrote:

> The 'execargs' global variable provides the psargs for curthread.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   dlibs/aarch64/5.11/procfs.d | 4 ++++
>   dlibs/aarch64/5.12/procfs.d | 4 ++++
>   dlibs/aarch64/5.14/procfs.d | 4 ++++
>   dlibs/aarch64/5.16/procfs.d | 4 ++++
>   dlibs/aarch64/5.2/procfs.d  | 4 ++++
>   dlibs/aarch64/5.6/procfs.d  | 4 ++++
>   dlibs/aarch64/6.1/procfs.d  | 4 ++++
>   dlibs/aarch64/6.10/procfs.d | 4 ++++
>   dlibs/x86_64/5.11/procfs.d  | 4 ++++
>   dlibs/x86_64/5.12/procfs.d  | 4 ++++
>   dlibs/x86_64/5.14/procfs.d  | 4 ++++
>   dlibs/x86_64/5.16/procfs.d  | 4 ++++
>   dlibs/x86_64/5.2/procfs.d   | 4 ++++
>   dlibs/x86_64/5.6/procfs.d   | 4 ++++
>   dlibs/x86_64/6.1/procfs.d   | 4 ++++
>   dlibs/x86_64/6.10/procfs.d  | 4 ++++
>   libdtrace/procfs.d.in       | 4 ++++
>   17 files changed, 68 insertions(+)
>
> diff --git a/dlibs/aarch64/5.11/procfs.d b/dlibs/aarch64/5.11/procfs.d
> index 70a43ddf..9c06fe1f 100644
> --- a/dlibs/aarch64/5.11/procfs.d
> +++ b/dlibs/aarch64/5.11/procfs.d
> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>   #pragma D attributes Stable/Stable/Common root
>   #pragma D binding "1.0" root
>   
> +inline string execargs = d_execargs(curthread);
> +#pragma D attributes Stable/Stable/Common root
> +#pragma D binding "2.0" execargs
> +
>   inline int CLD_EXITED = 1;
>   #pragma D binding "1.0" CLD_EXITED
>   inline int CLD_KILLED = 2;
> diff --git a/dlibs/aarch64/5.12/procfs.d b/dlibs/aarch64/5.12/procfs.d
> index 70a43ddf..9c06fe1f 100644
> --- a/dlibs/aarch64/5.12/procfs.d
> +++ b/dlibs/aarch64/5.12/procfs.d
> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>   #pragma D attributes Stable/Stable/Common root
>   #pragma D binding "1.0" root
>   
> +inline string execargs = d_execargs(curthread);
> +#pragma D attributes Stable/Stable/Common root
> +#pragma D binding "2.0" execargs
> +
>   inline int CLD_EXITED = 1;
>   #pragma D binding "1.0" CLD_EXITED
>   inline int CLD_KILLED = 2;
> diff --git a/dlibs/aarch64/5.14/procfs.d b/dlibs/aarch64/5.14/procfs.d
> index ef27bb70..2824d137 100644
> --- a/dlibs/aarch64/5.14/procfs.d
> +++ b/dlibs/aarch64/5.14/procfs.d
> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>   #pragma D attributes Stable/Stable/Common root
>   #pragma D binding "1.0" root
>   
> +inline string execargs = d_execargs(curthread);
> +#pragma D attributes Stable/Stable/Common root
> +#pragma D binding "2.0" execargs
> +
>   inline int CLD_EXITED = 1;
>   #pragma D binding "1.0" CLD_EXITED
>   inline int CLD_KILLED = 2;
> diff --git a/dlibs/aarch64/5.16/procfs.d b/dlibs/aarch64/5.16/procfs.d
> index cad2d2c5..daf30745 100644
> --- a/dlibs/aarch64/5.16/procfs.d
> +++ b/dlibs/aarch64/5.16/procfs.d
> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>   #pragma D attributes Stable/Stable/Common root
>   #pragma D binding "1.0" root
>   
> +inline string execargs = d_execargs(curthread);
> +#pragma D attributes Stable/Stable/Common root
> +#pragma D binding "2.0" execargs
> +
>   inline int CLD_EXITED = 1;
>   #pragma D binding "1.0" CLD_EXITED
>   inline int CLD_KILLED = 2;
> diff --git a/dlibs/aarch64/5.2/procfs.d b/dlibs/aarch64/5.2/procfs.d
> index 6b1b1b9c..3594e5e9 100644
> --- a/dlibs/aarch64/5.2/procfs.d
> +++ b/dlibs/aarch64/5.2/procfs.d
> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>   #pragma D attributes Stable/Stable/Common root
>   #pragma D binding "1.0" root
>   
> +inline string execargs = d_execargs(curthread);
> +#pragma D attributes Stable/Stable/Common root
> +#pragma D binding "2.0" execargs
> +
>   inline int CLD_EXITED = 1;
>   #pragma D binding "1.0" CLD_EXITED
>   inline int CLD_KILLED = 2;
> diff --git a/dlibs/aarch64/5.6/procfs.d b/dlibs/aarch64/5.6/procfs.d
> index 70a43ddf..9c06fe1f 100644
> --- a/dlibs/aarch64/5.6/procfs.d
> +++ b/dlibs/aarch64/5.6/procfs.d
> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>   #pragma D attributes Stable/Stable/Common root
>   #pragma D binding "1.0" root
>   
> +inline string execargs = d_execargs(curthread);
> +#pragma D attributes Stable/Stable/Common root
> +#pragma D binding "2.0" execargs
> +
>   inline int CLD_EXITED = 1;
>   #pragma D binding "1.0" CLD_EXITED
>   inline int CLD_KILLED = 2;
> diff --git a/dlibs/aarch64/6.1/procfs.d b/dlibs/aarch64/6.1/procfs.d
> index 4cb7b77c..2d52f079 100644
> --- a/dlibs/aarch64/6.1/procfs.d
> +++ b/dlibs/aarch64/6.1/procfs.d
> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>   #pragma D attributes Stable/Stable/Common root
>   #pragma D binding "1.0" root
>   
> +inline string execargs = d_execargs(curthread);
> +#pragma D attributes Stable/Stable/Common root
> +#pragma D binding "2.0" execargs
> +
>   inline int CLD_EXITED = 1;
>   #pragma D binding "1.0" CLD_EXITED
>   inline int CLD_KILLED = 2;
> diff --git a/dlibs/aarch64/6.10/procfs.d b/dlibs/aarch64/6.10/procfs.d
> index 4cb7b77c..2d52f079 100644
> --- a/dlibs/aarch64/6.10/procfs.d
> +++ b/dlibs/aarch64/6.10/procfs.d
> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>   #pragma D attributes Stable/Stable/Common root
>   #pragma D binding "1.0" root
>   
> +inline string execargs = d_execargs(curthread);
> +#pragma D attributes Stable/Stable/Common root
> +#pragma D binding "2.0" execargs
> +
>   inline int CLD_EXITED = 1;
>   #pragma D binding "1.0" CLD_EXITED
>   inline int CLD_KILLED = 2;
> diff --git a/dlibs/x86_64/5.11/procfs.d b/dlibs/x86_64/5.11/procfs.d
> index c2be76d8..7679db2e 100644
> --- a/dlibs/x86_64/5.11/procfs.d
> +++ b/dlibs/x86_64/5.11/procfs.d
> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>   #pragma D attributes Stable/Stable/Common root
>   #pragma D binding "1.0" root
>   
> +inline string execargs = d_execargs(curthread);
> +#pragma D attributes Stable/Stable/Common root
> +#pragma D binding "2.0" execargs
> +
>   inline int CLD_EXITED = 1;
>   #pragma D binding "1.0" CLD_EXITED
>   inline int CLD_KILLED = 2;
> diff --git a/dlibs/x86_64/5.12/procfs.d b/dlibs/x86_64/5.12/procfs.d
> index c2be76d8..7679db2e 100644
> --- a/dlibs/x86_64/5.12/procfs.d
> +++ b/dlibs/x86_64/5.12/procfs.d
> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>   #pragma D attributes Stable/Stable/Common root
>   #pragma D binding "1.0" root
>   
> +inline string execargs = d_execargs(curthread);
> +#pragma D attributes Stable/Stable/Common root
> +#pragma D binding "2.0" execargs
> +
>   inline int CLD_EXITED = 1;
>   #pragma D binding "1.0" CLD_EXITED
>   inline int CLD_KILLED = 2;
> diff --git a/dlibs/x86_64/5.14/procfs.d b/dlibs/x86_64/5.14/procfs.d
> index 28fada6d..3a348ebc 100644
> --- a/dlibs/x86_64/5.14/procfs.d
> +++ b/dlibs/x86_64/5.14/procfs.d
> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>   #pragma D attributes Stable/Stable/Common root
>   #pragma D binding "1.0" root
>   
> +inline string execargs = d_execargs(curthread);
> +#pragma D attributes Stable/Stable/Common root
> +#pragma D binding "2.0" execargs
> +
>   inline int CLD_EXITED = 1;
>   #pragma D binding "1.0" CLD_EXITED
>   inline int CLD_KILLED = 2;
> diff --git a/dlibs/x86_64/5.16/procfs.d b/dlibs/x86_64/5.16/procfs.d
> index cad2d2c5..daf30745 100644
> --- a/dlibs/x86_64/5.16/procfs.d
> +++ b/dlibs/x86_64/5.16/procfs.d
> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>   #pragma D attributes Stable/Stable/Common root
>   #pragma D binding "1.0" root
>   
> +inline string execargs = d_execargs(curthread);
> +#pragma D attributes Stable/Stable/Common root
> +#pragma D binding "2.0" execargs
> +
>   inline int CLD_EXITED = 1;
>   #pragma D binding "1.0" CLD_EXITED
>   inline int CLD_KILLED = 2;
> diff --git a/dlibs/x86_64/5.2/procfs.d b/dlibs/x86_64/5.2/procfs.d
> index 08696cf7..6ad926ee 100644
> --- a/dlibs/x86_64/5.2/procfs.d
> +++ b/dlibs/x86_64/5.2/procfs.d
> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>   #pragma D attributes Stable/Stable/Common root
>   #pragma D binding "1.0" root
>   
> +inline string execargs = d_execargs(curthread);
> +#pragma D attributes Stable/Stable/Common root
> +#pragma D binding "2.0" execargs
> +
>   inline int CLD_EXITED = 1;
>   #pragma D binding "1.0" CLD_EXITED
>   inline int CLD_KILLED = 2;
> diff --git a/dlibs/x86_64/5.6/procfs.d b/dlibs/x86_64/5.6/procfs.d
> index c2be76d8..7679db2e 100644
> --- a/dlibs/x86_64/5.6/procfs.d
> +++ b/dlibs/x86_64/5.6/procfs.d
> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>   #pragma D attributes Stable/Stable/Common root
>   #pragma D binding "1.0" root
>   
> +inline string execargs = d_execargs(curthread);
> +#pragma D attributes Stable/Stable/Common root
> +#pragma D binding "2.0" execargs
> +
>   inline int CLD_EXITED = 1;
>   #pragma D binding "1.0" CLD_EXITED
>   inline int CLD_KILLED = 2;
> diff --git a/dlibs/x86_64/6.1/procfs.d b/dlibs/x86_64/6.1/procfs.d
> index 4cb7b77c..2d52f079 100644
> --- a/dlibs/x86_64/6.1/procfs.d
> +++ b/dlibs/x86_64/6.1/procfs.d
> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>   #pragma D attributes Stable/Stable/Common root
>   #pragma D binding "1.0" root
>   
> +inline string execargs = d_execargs(curthread);
> +#pragma D attributes Stable/Stable/Common root
> +#pragma D binding "2.0" execargs
> +
>   inline int CLD_EXITED = 1;
>   #pragma D binding "1.0" CLD_EXITED
>   inline int CLD_KILLED = 2;
> diff --git a/dlibs/x86_64/6.10/procfs.d b/dlibs/x86_64/6.10/procfs.d
> index 4cb7b77c..2d52f079 100644
> --- a/dlibs/x86_64/6.10/procfs.d
> +++ b/dlibs/x86_64/6.10/procfs.d
> @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
>   #pragma D attributes Stable/Stable/Common root
>   #pragma D binding "1.0" root
>   
> +inline string execargs = d_execargs(curthread);
> +#pragma D attributes Stable/Stable/Common root
> +#pragma D binding "2.0" execargs
> +
>   inline int CLD_EXITED = 1;
>   #pragma D binding "1.0" CLD_EXITED
>   inline int CLD_KILLED = 2;
> diff --git a/libdtrace/procfs.d.in b/libdtrace/procfs.d.in
> index e9d50349..827d6b81 100644
> --- a/libdtrace/procfs.d.in
> +++ b/libdtrace/procfs.d.in
> @@ -307,6 +307,10 @@ inline string root = d_path(&(curthread->fs->root));
>   #pragma D attributes Stable/Stable/Common root
>   #pragma D binding "1.0" root
>   
> +inline string execargs = d_execargs(curthread);
> +#pragma D attributes Stable/Stable/Common root
> +#pragma D binding "2.0" execargs
> +
>   inline int CLD_EXITED = 1;
>   #pragma D binding "1.0" CLD_EXITED
>   inline int CLD_KILLED = 2;
