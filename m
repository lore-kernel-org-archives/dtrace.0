Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EC526FDB2
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761247685; cv=fail; b=JYAcI0kTz2BnnhfqkH6+IZ3WeuxgRuzzwcsI2Ul5VL75YloyW3ALN/HDUYNJ3sKuGW2uv47Vjna2SflyO7rHTrwwxNdgQhWMlyem7d46HBrlzOnbdksknpxBS2e9Gq6qrWwafh6J+KFSiub6PQp6/h7WpaDDpKiYT6sCKi2vXYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761247685; c=relaxed/simple;
	bh=+Vh4c/DSycvSXF5Bc+uRHgyLDYvUvPzD2iObuhdw2Oo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Be1UbgjUf6caV/k9G+VWvUb9YKVBOmYWjl7Uud9ushIEdEXnUT1LUE/EHzSV2lxcXTWSHtVWP/FHLh1zLbTwfe3UAjgn1VkurRYTtZP4B9rCGuVc5mzZ+3+cCYMWEyCkEJPtLvfZtm8haEUyb4ex6uxYTmzxw6+8NHhTaxcOKjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qKojuiOf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=i25OVZbD; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qKojuiOf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="i25OVZbD"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NIBv3n017889
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=IU2vrKNaj1pXh2d0UqPrryyAO9gOnBy+0kE7ZS5vjeE=; b=
	qKojuiOfaGMldt8HTGVNokJPqsNSG9/GSEyL5xmZEUuX+mB9CHsSeNupBT9fOgfk
	BalQOod7j89ZczOLTG7tnGLs2q9gw4So7qW/8QUyyEI+oLpj/tVpTJ9jdRt1kKi6
	kk/QQ6Ou4OYe2rbDSlUm7z66Ojk8EtNLSiES+8G4/ygbEE3rkk/KCy0nHhzYaP5M
	hTkEcjHHbjVoHcJBUUR1ZIAFdRQChkLx8mgALvI8Uzg3wwNpsuJFadW6ZAJwlgzG
	+gzTwt53nN7rlg44bh//YVmkdQTXzvrZKue7nr6uj5S/urYrsb9NxYKk8gU/UjCl
	TCW9Of0ES0c8VDk/t9AfFQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49xvcybarp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:28:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59NHsAWr011995
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:28:02 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010033.outbound.protection.outlook.com [52.101.85.33])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bf7yfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:28:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eywafb/8QgRumTo4enZAf+PX2WV5lK5pMB9rmA79n7JU6Kj0fBykbXA6yuWmIo/qquaiKWCQYPpKEjCBr0MrRJBo3jY82ATwiB/c2VdISPOxG0s8BAl5VmsQInZRgFHu0WmcHr+7AAjz0gVzIyLD1c5Nu+4O0j/uZ/6zhW9WDL57XFW19WQI9Cj7vfMwgpUfdRRol61hVUIzPoKvP2d1yVWviPVU8GsY3QCeD5N+hrVCiwpfi4mOK3nxc09f6zk7opR0lsCyNbXIhxlkIp4k9AszQtuYFZZjT2pNuKd9PxCWy6uS7R47wbZm2YjOWJQ0+pT0dUpRVSdaixd5WuyO9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IU2vrKNaj1pXh2d0UqPrryyAO9gOnBy+0kE7ZS5vjeE=;
 b=aNgwZHqviZsPKUVAZ2zWqowex7OTuku6HqOWibvQtyeu6giZBTumRN6XAfyXgN0L6VOYToECP042uYNV04sA9auB9qKNQpOVOMdrQv8kj23rwMLw8GaxmhOnPOTVut+GUfjbb6dhvCrx/PryRdzOPuiIvWUl1fCrNxTSCFZD17jogRWETG/LeL/2GEYnuAiYBQa3TFsy6iGISlz13AhkTadJYvutjjYJevIKFbuTRHvWavA8BTDdrTl5zeapHiJ7UHl61QAHP1mJ5Glbjy8Voky/oU26H5egMWPv9NaJmedo0MdqZOGlVFSjK8LbQ1ffrTXp1fz6zbqYwOtXp9tckA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IU2vrKNaj1pXh2d0UqPrryyAO9gOnBy+0kE7ZS5vjeE=;
 b=i25OVZbDddyN3qoJl2R45olgECcY4hSoI9SIw7/SRKQ8chVvRqmLzEntr4moohB48HHSwGUP5V8ULFLzqwysRuL6P11o2SpBeqPeDOFr8jb63FhvRh74iFAPbRxIcd8nk+cRE6Tu2B4eIkuD/1Cfzu9myIos53GKbLtxRhfyEDw=
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by PH7PR10MB5700.namprd10.prod.outlook.com (2603:10b6:510:125::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 19:27:56 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%5]) with mapi id 15.20.9228.010; Thu, 23 Oct 2025
 19:27:54 +0000
Message-ID: <3a962845-d1b6-46fa-9831-1a1a8967f0b4@oracle.com>
Date: Thu, 23 Oct 2025 13:27:52 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/20] doc: Fix anchor links for explanation/
To: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20251022032251.2010-1-eugene.loh@oracle.com>
 <20251022032251.2010-5-eugene.loh@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <20251022032251.2010-5-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY5PR19CA0074.namprd19.prod.outlook.com
 (2603:10b6:930:69::23) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|PH7PR10MB5700:EE_
X-MS-Office365-Filtering-Correlation-Id: a7c34efe-a709-4323-98ee-08de126a4354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UExwUC8vSWRIYXcrYzdWb2lYZWFmR1hpangvSTMvelVoU29wNHpUR2xVaXJS?=
 =?utf-8?B?L0hieG5KdUJPQzUxK3c1elh5M3E5dEdDVnFtU3c4WUFndmVNQU0xc0tBTEtt?=
 =?utf-8?B?ZkhTdXoxTWE2NS8raXQ0TkZ0cUR5Q0Fqd2VORHVaWXg3VzRwWnhaRHljaFdU?=
 =?utf-8?B?WjRuOHJhWWpuUjN0MXQvbnMvOEc0aERYeDVidGMvMjBnTjNCSDhyY2RKMGJH?=
 =?utf-8?B?ZXFGWkdOcWRLMTBaSHFheTJvQUE3cDJzdzhneEg4UHY2anc1bHZJQWh4WHpa?=
 =?utf-8?B?Wk9obG5aKzR4bzA5Uk5nWEtLUStmVUozNXg0Tlc4T0IwS0NiS1dDYnZybUVJ?=
 =?utf-8?B?ZjBqVnUrcjd6NU1XdXpoaHZJdWZ0ajluT0loZ1NOTjRIOGhiZndGNUFtZmRZ?=
 =?utf-8?B?SFdwamUydGRoc3pnaS9KWERmaGZuR2l0akpiWlAzSFJXOHAyNHIxMVR2akR1?=
 =?utf-8?B?dEg0WWlSV2VBMnJyOUJGbHBDS1B6ZHZQeDllOEtDZXpJc1RrbXY1dUZ2VDg2?=
 =?utf-8?B?R0JjdFZSbURibGY4UEhSOVBNQWlObExlUytuTmFsSXc3dHVVaEhYMjUrbGJY?=
 =?utf-8?B?M3luS2ZGblVtQi9wVlNWODBRZkFDV0dIWU1SNlJHcHFkRytMOVVOb1Z0ZjBV?=
 =?utf-8?B?V2FxTE9jM3l1Q0E0Rmd1REFVc3lPNStPVE1Bcko4YTVrU1pxeENHYVZNQVVD?=
 =?utf-8?B?M2pkOVdlMjdOdHU2Yy9jcjJvelJDN3pRUC8rVmdkVlpGb3JLUTBwWmFHUno1?=
 =?utf-8?B?RUNVcnVkanZYZDhDTmxLdllXTGpzcmZvZjBxaFpuelVGT0l3WDkrVitqeEd4?=
 =?utf-8?B?SGM5UmpubjRoVE16bitiZmlMSDVweVRZRktQK0pyMVVWTDBncjhlZVR5OUx4?=
 =?utf-8?B?MUtWTldjVk94MDJNVEZFcHN5b3o3VW90cWtIN3ByVUxiNGVkdHBjZ2k3R1Jx?=
 =?utf-8?B?N1hXTDdnQjFYaDZoN0QvMURIRnpJK1ZIOUxmUWE3ZjV1U3RDUHp5eGVlMFhF?=
 =?utf-8?B?SUhxY1Q0UlNUZ1oyRFpnNlRWMjJtVmd3N0VRQ2VTdjhvV214ZE42UHNJNE8z?=
 =?utf-8?B?L2MrK0c0RVpnR3dkclU4d3lySU5pRUhNMXh5VVRyNTFsdUFqWnR2L1RWVmF1?=
 =?utf-8?B?aU1VRTZHQjhHZW9TeGwzZC9NUmJEeGRZbnpnOXkxdmkwS0pRVE9ocnJVOS9U?=
 =?utf-8?B?UWhWSTFtNDFJZUl5d05xeDBtTWRaeitKYy9acnRhS0luMkk1cXVSRDJpT1pI?=
 =?utf-8?B?NkNybmJNNXUvMlVtYnFvYUZDU0phb1RWaXJoWmFON0w2MzVpbko5V2lFSU02?=
 =?utf-8?B?dlVnbkY4Tlg5ejlwWWk1TGxzSHduaUQvcEZycWk3MHhMMk10Qmd4dkNWZ1gx?=
 =?utf-8?B?NjU5MWNBUU5uNDNjN3FaaGhHQ2J2c054eXVQNTZVQzZ3UXlqQ3ljQXRMTnVi?=
 =?utf-8?B?aWJlcFB4b2tyK2J2enJVMWpDTlZ0b2FCQWlXZTJmU0tiZC9YODVMSUhCNHpy?=
 =?utf-8?B?QjdJSk5VRGxpR0FMakNCUDVrMWNjeUpQRmczTS9sNFVWT3ZPMkREc1lsQVlC?=
 =?utf-8?B?R1BlQVhJVk9qZ1BnZ2tJb0gzdC9aY1dJN2pzdGlmUkVRU2xXdGRhaFpOd2lE?=
 =?utf-8?B?bEEvM1hwdTZ3SmsxNkROT2FqTG94YWxsUDlkTmx3SXhRUFBrYzBLRXE4ckx3?=
 =?utf-8?B?TkRCemV2c0dtL2o3a2JrWXJZMEUzZHRwbDdQN2xQbCsrOGpmUFNtYkgvQ0NB?=
 =?utf-8?B?TzR2Z1I2SHFVOTNSdEY0anhwODJITXZGSWpHU3FJaUdhTW1rOGRpTGtXZXJs?=
 =?utf-8?B?UG0yNEVlbTNjOFFwTXFCdk05MWRLcWlrR25tNjJUc3ZtUmpqTlhVelV1L290?=
 =?utf-8?B?MGtQdWxGelNXWE9XZkZCckNSVVphM05rT3ZXV09sVlhCRGxLRUNzL3owRHNV?=
 =?utf-8?Q?7nB44uhDsR2QILDXiJ9hf3nCqufQAl0z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGlPV0lYMFFDZWJwN3FjL1RmUjhrcjIySzQ0SGc5TjFUdFhnM3Z2SEpabW95?=
 =?utf-8?B?TVE1QkdoZFVVNEpWb21xV2sxeXdXaDlyQ2wzQVdrYVpVVGhSd2hTdDlwSDg3?=
 =?utf-8?B?bFRLcmZYcmtBa0pDR2lwVTVmNEhNZ1hSZXRBMHI4YXNwWWh4SlNqZE1GN2xR?=
 =?utf-8?B?MEErSUFQSUkrV1pBbnFSWXVleTB5QTUyaFJSVnJtSzJPZlArRmdFbHpuTFBi?=
 =?utf-8?B?VHIzdUZqQkh3bEtIbDREL0ZydXRYeDdUTUlrVXpaVVFMV3NCSjMySkR2L1Nr?=
 =?utf-8?B?NnZndTRhY2d2TlVOd20vWVRtZVFIZE1KVERJUGVvNkQ4Q09INmJoWWNhQTBK?=
 =?utf-8?B?QlA5aTA1TTRqbTlFL3BoSUNNUmN3MUxOOVFhYlEzU0hXcUlmSVdUSElqTUZ6?=
 =?utf-8?B?VmNuNllhdUFlYnVqZGowekFkS05xazJhNnd0UEh4TzUyVFBhcG1oeU5OVGFL?=
 =?utf-8?B?M05oOTJGbWVEWVhSdUEzN2RLL0RMNW1PUUNZWGNxNEhBQUR5aFZqT1phYUti?=
 =?utf-8?B?eC9ERG5URVYyUnFYVzV6aklTNkhKNEdzdHJ5L3VMcFU1VkJRWW14Y3RKNlV6?=
 =?utf-8?B?VWF6TTlRNVNoMldxSUFCd085Z3lqR3ZOZlQyaThqdUI3cDJkTVFxOWJpNDVQ?=
 =?utf-8?B?MTFtcHg1OXhkU0JEamVoQ21qc0tJTkJWUVFCRnlEMVFIa2J1OFNRSUpDTGRB?=
 =?utf-8?B?a0Q5N3phK1hCU3JQbHV1c2J3NkkyMng3bzJHMGdwcGZGVktTT0pNbmd3ME5T?=
 =?utf-8?B?K2x1NnhwZC9MQXRNTGUrdU0rRndiTWQ4Tm9ndm90QmxMMmZVQ1JmaHNta3hG?=
 =?utf-8?B?QzFMWEN2N2pKYytOTGV3MTBEVXNTR1l3N0k2QXV5dTdIMVV4WkpkWVhZRXhw?=
 =?utf-8?B?eW9haFEzSE1iVVlwSEhXVjZtMjBrUVNZUjdneUthUEExUTdLQUZsU3ZRcGQ0?=
 =?utf-8?B?VGlTRndoRW5pS1Yrd0lmR1JRNkNyc1p1U2t4ZlpyR1dzSjM0MUltQkRkQ3Zl?=
 =?utf-8?B?amhTNTBKMU5pN3FqODhRODBHcEVuMzR0VlZXbHBpS1hWWnRyV2J2dTlMaGFz?=
 =?utf-8?B?blhSVGJFQnVibmpZNXhLVG5jQkUyUmZOUmNCTHducGZjUGt3VWpTRXRmcG5Z?=
 =?utf-8?B?K3B5UVl5bWNGMjV4TGtBOVBwbWZLcWZ5YXdVUGhKbnlxVXEvQ3ZrSU1Ja2Fu?=
 =?utf-8?B?b0t4bk0rbStUSHBWTWM0MHRNT2dlajh2TVZGWDNER0ZSbFdnRU11RnRzVEs0?=
 =?utf-8?B?MFdyZFU3SWpQd2NoTmdxZFVnREFMaHJoSi9yak5XOWEwZE1jTnB1REpNSXJE?=
 =?utf-8?B?NXB4cWV5M2RlZXUrOUxZdUIvNTE4U3FNZS8ycmFZTFVRekNhcHJuUW1jWmRY?=
 =?utf-8?B?ZHk3OVFveFN5anQzL0FNVTFSa1JQaUN6MWlmYzh4ejkwQjFweVREMG1ud00z?=
 =?utf-8?B?Yks0dGdDQlVodEprUGFuREhuM3RXSEpPOHFhTFhmaDRwMHVFV1kzcDBveFgy?=
 =?utf-8?B?Rmc2R0hOL2ovTTVDUGEwUFR6YXN6aW1zL0NyZ1Jyc2VkN3g3SWhEd0lzVytK?=
 =?utf-8?B?VEluc3BXRVFrUEM2bmhjbi9WdzFlZXdPQm5MZFJQYWVqRkxMU1BKNnVJcTRw?=
 =?utf-8?B?LytiQXhOa1h3RHkwUUViTU8rMW9wdWhEWEhHM1M0UnhVTldYeXZGemg5R2V3?=
 =?utf-8?B?d0puVm8vcUFxWDRhem81ZVUycFZNMTJJV1F1YkhKK3VVRVFkazFVN2N2RzZT?=
 =?utf-8?B?cHE4MXF6SVljc1I1U1h1VHJzZzg3K0tFM0c2dWxyVVpqZWxEVjViRWJQQXBu?=
 =?utf-8?B?NldtUFFYaEZVN2dJY1VjRjJlTUZiUjYvR2wwNjljMDR5SXpCM2tRb2tQV0Nl?=
 =?utf-8?B?dU02OStaT1FjTGdOdUg3ekx0d2cvV3R0a0FXRlV5NUtZaUV3ZG1ZYTJDZzFl?=
 =?utf-8?B?VWllZWNILzZhWHFtd3JLZUc3cFZmWER4VFNnaDhoRE5kcEU2N1YyemJKNGdF?=
 =?utf-8?B?TTVHUmlJYkR6RzVFZVhlL1J3aEIvZjFvUkVWcUlBZ1pHYXhCUlQ3QXd5QjV0?=
 =?utf-8?B?c2ExalV0SmJqemExcUZVNmpJTWtlNkNLR3Z1cEI0S1h2OS9DcEQyc1UxdGF1?=
 =?utf-8?B?Rkd6K0U3YU1xZmZZR1F2VzV6UE1QTTk2cCtXVHI2aTRQVXB1M1o2aWN5S1Qz?=
 =?utf-8?Q?ncn8n4bJhwFL9NFYfjmT2W8=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0w9ylq9jlQJdpv0E9k2hr8OJtd20NOMpluBfX+9Ke0CMTtITJ16LQlMGenZC8YJpCpGdkumUwcCRERKliCC160uAJYf7s5FP/TzNcmZEwSMm8TP8dDxvICRDfno49gP5iYclqJOelFLPDkK2Idq7Mphtmul7sbAuQG/LtqN2eJIKX3ufeKvVig9y27AMA1fpgxAAdqqSoHTvZB7sjFmNUJeZsgZzPMHqY4kkAeXGepN9goo1F8RwZ0RX+5HxnOPEePV5fuS5lsh/aaaGCX+NLQZzP9v1x7mxluqI1TF9+eE9oqNhmbO9o/pJT6hXyNhhQ4mAht0R/Oj6EHdABhyM2l3737ptTLF47LxT6ZrcP/ILipV54kElRfMxNvOQoF17KrfKg+OQMZdBqInOOAyCLe6vU3l6nsdtRScfBqdvhVuhRB+4St59K/qYA4Bkje9GCqga1akJ29Mpg7LSY70FYKxhM4+O7WiTYOqe0GgcfW+tfR+/M+0ZechEmEreK0TRFxnrZlaQMBTzj+Fd2OUzIOu0gDLXDj5qG13WmWQoFNZXlZxx4DgWr5zcVOr7/Xhz8szgMz95FQML8tNHewQGHmPJaRmI5dlPaik7a8RCsGM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c34efe-a709-4323-98ee-08de126a4354
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 19:27:54.2376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wHzGzcSDVN0fnfq/v8lan3vi3kWCa1I5pfv7lp1X6KwVekNtwVUaPgqA7VIZDDvvQ6di5c5UqK8IRDf3zETHNsYmAFxaBe3HU7P+AKeWKSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5700
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510230178
X-Authority-Analysis: v=2.4 cv=GqlPO01C c=1 sm=1 tr=0 ts=68fa81c2 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=OGYF1bGQZLbP0NId_DIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA3MyBTYWx0ZWRfXzr6IypBOtYkj
 W+wQqToHcoeoM+ci8MQ0U/bHLJXXanX+iHXkNfJ+94rlzQUS5FjXGOoGhY5+cko5tNPe6IbbWO7
 nL3tus46T86rtnY/yzRvQY1VejnxS4gmwFa50V0NT2sw1tHEmJCY+GqIRCHk7EbFd11dpjId3Jw
 +HvriUQgcGu+dXU2nW3koUVmjhamPUe0t/SQpdeDj/n81ZSFwk76Nn+jCDAUWZPjcxUxjcRTtBE
 oXnnXDjEDXgBOYrjsZsaxkSa7S2ioQqAHnCb3f43Wd7MfNKCb7mfJz5T3ImsSXyRufmp6jK+zVu
 JTxXS6FwFaMMbxoOyz9GH1u1E60u+xg8q+wqmGLw3okUcvcLZcMx/gFkCwWUHtwUa5A95JWE1lM
 GUQeN3Hn1vXz+Qo0edga6sNO74vOfg==
X-Proofpoint-GUID: 4nuST-P2_wffx3PsIJ9Vv8LFUnVaM0qD
X-Proofpoint-ORIG-GUID: 4nuST-P2_wffx3PsIJ9Vv8LFUnVaM0qD


Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


On 10/21/25 9:22 PM, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  doc/userguide/explanation/dtrace-about.md              |  2 +-
>  .../explanation/dtrace-components-and-terminology.md   | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/doc/userguide/explanation/dtrace-about.md b/doc/userguide/explanation/dtrace-about.md
> index 4ab252a79..b832799e4 100644
> --- a/doc/userguide/explanation/dtrace-about.md
> +++ b/doc/userguide/explanation/dtrace-about.md
> @@ -1,5 +1,5 @@
>  
> -# About DTrace {#concept_about}
> +# About DTrace <a id="concept_about">
>  
>  DTrace is a powerful tracing tool that's available on Linux. DTrace has low overhead and is safe to use on production systems to analyze what a system is doing in real time.
>  
> diff --git a/doc/userguide/explanation/dtrace-components-and-terminology.md b/doc/userguide/explanation/dtrace-components-and-terminology.md
> index b187055a4..9d08928ac 100644
> --- a/doc/userguide/explanation/dtrace-components-and-terminology.md
> +++ b/doc/userguide/explanation/dtrace-components-and-terminology.md
> @@ -1,5 +1,5 @@
>  
> -# DTrace Components and Terminology {#concept_terms}
> +# DTrace Components and Terminology <a id="concept_terms">
>  
>  Learn about the different components and the terms used to describe them within the DTrace framework.
>  
> @@ -7,7 +7,7 @@ DTrace is a framework that dynamically traces data into buffers that are read by
>  
>  **Parent topic:**[DTrace Concepts](../explanation/dtrace-concepts.md)
>  
> -## Probes {#concept_terms_probes}
> +## Probes <a id="concept_terms_probes">
>  
>  DTrace works by using *probes* that identify particular instrumentation in the kernel or within a user space application, or which can be used to identify interval counters or performance event counters. Events such as when particular code is run or when a specific counter is incremented cause a probe to fire and DTrace can perform functions that are bound to the event in a program or script. For example, a probe can fire when a particular file is opened and a DTrace program can print information related to the event that can be useful for debugging or resolving an issue. Equally, at the moment that DTrace starts or ends any tracing activity, the `BEGIN` and `END` probes dedicated to these actions always fire.
>  
> @@ -66,7 +66,7 @@ dtrace:::BEGIN
>  
>  Probes aren't required to have a module and function. The dtrace `BEGIN`, `END` and `ERROR` probes are good examples of this because these probes don't correspond to any specific instrumented program function or location. Instead, these probes are used for more abstract concepts, such as the idea of the end a tracing request. Other probes, such as those made available by the [Profile Provider](../reference/dtrace_providers_profile.md) or the [CPC Provider](../reference/dtrace_providers_cpc.md), also don't include module or function identifiers in their descriptions.
>  
> -## D Programs {#concept_terms_programs}
> +## D Programs <a id="concept_terms_programs">
>  
>  You can bind a set of processing instructions called statements to one or more DTrace probes, so that when a probe fires, the specified statements are run to perform some required functionality. The set of enabled probes, the statements, and any conditions that might be evaluated when the probe fires, can all be collated into a *D program*.
>  
> @@ -102,7 +102,7 @@ Wed 22 Feb 11:54:51 GMT 2023
>  
>  The program probe description matches all system call functions at the entry point. The program predicate evaluates a *built-in variable*, `execname`, against a string using an operator. The clause includes an *aggregation*, `@reads`, that's used to gather data about the firing probe. In this case, the aggregation stores a counter that increments every time the probe fires and the predicate resolves. The counter is implemented by the `count()` *function* and stores count values for each system call probe function. See [D Program Syntax Reference](../reference/d_program_syntax_reference.md) for more information on program structure and syntax.
>  
> -## Aggregations {#concept_terms_aggregations}
> +## Aggregations <a id="concept_terms_aggregations">
>  
>  *Aggregations* can be used to reduce large bodies of data to smaller, meaningful statistical metrics. Many common functions that are used to understand a set of data are aggregating functions. These functions include the following:
>  
> @@ -121,7 +121,7 @@ Although you could code an application to calculate an aggregation for a set of
>  
>  DTrace aggregation functions apply to the data as it's traced, so that the dataset doesn't need to be stored and the aggregation is always available as events occur. In this way, aggregation functions are more efficient and exact, and avoid overwrites. See [Aggregations](../reference/aggregation.md) for more information.
>  
> -## Speculation {#concept_terms_speculation}
> +## Speculation <a id="concept_terms_speculation">
>  
>  While predicates can be used to filter out uninteresting events, they're only useful if you already know which events you need to filter. Because DTrace is often used to help debug particular system behaviors, DTrace includes a set of *speculation* functions that can be used to trace data speculatively.
>  

