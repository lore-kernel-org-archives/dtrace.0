Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A8354279
	for <dtrace@lists.linux.dev>; Wed,  6 Aug 2025 23:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754522550; cv=fail; b=Ut24njeLiJhGkTMd8axE0X1Jy/mOc/gCwijq75pXInTyDVQED/fBXMtoXFEgLG5g3sBaoyvbe9eGeT2wPaSu6yBUKjONQPl3PvNu/VtrvGVC1VM658YeXIVGz9FGIVe+bS3wmqDO6TcbC566Glx9fWM5kOTWeSNgkLFeyrMsZpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754522550; c=relaxed/simple;
	bh=UBX3a6OdoImMpzE4M037Ond43SJ/DITLbe4TmYooGlM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dzZdSfgGXTI/urzRpJwdQYx/GJW3XrgK3hFpA756ozcnjIJYJtriOy/RxgWVAqG30jZ60j3PAXLyNA+qMfvXmizkmi7zV7gMdtFRZD2QmIUIcMkhHRLKBWlQDmx2/W20QYq5LBmV34jqeAzJBc+SfxBoAwCV6xGNQTbLULqzFqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DpEbqYnW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ffLOBrij; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DpEbqYnW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ffLOBrij"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576KRNFS003982
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 23:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=P9l8hWs6PfOv3JzoAyMmbidcDFbLIgjx6mIY7Z9avuw=; b=
	DpEbqYnWXOfWbVEzJbMlMKOHywgbCRMWjOkovx9XAZOnEesExugRGTDskVTuDUGX
	TfwelKsjVCiPCV2eO956u1V2X35hs+PFyjFpX0qvMksgMVWuaz8dslssE9/t7adw
	NsZJK/v+AtBNICSMlJNHv0KlGiIiCb1OuXBiuQHaF8nZwZdJ+CKEn2QkU66yEiZf
	BsRR7YIv9o2c5unLgz6du1b8jyxwAubXD+b5dRDfSeqGTQNLPBfLovJAYPCExdvK
	XjPNIAbEXYBE7CGqI1aA6XFeuEZWxy8Cg2Db1aGg+jpHpTgjbLdNKJvf/u6qLBNa
	UxN+TZkCNuEL0RN7B5L6zw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvjtrws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 23:22:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 576M1BYh028223
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 23:22:25 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2047.outbound.protection.outlook.com [40.107.101.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwmwcb4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 23:22:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TNcOi3Z4zvcuY7o8cFamN+i6NnMixX8RXNkG28vab2xyRFTIIu2radlSFb9xlSj8rADIPWlEtl7lwNwwtRoVqy7fnrSOWF8sdrQBFDDTyNgXDRLrG49CUZlLYisbASn5RigJOzjZtmmnn8Kl4OGAUvKgQDJo4sAdRF57LGabHn3jW7HvlCF2b/k3qZ+SNOQfunr6q50y1lEOobXPu3peBXM4GraSJiKBNHobXFnT6uAwU4ap/9TQYQT/OWu71ZGx4Ah/UiBE1cEQNX3ZspmSEiNOZKYtw8LRPuG+MomJ5HxxwNaIobw0vwKH6HbvuEKCVjPiQzRardyrQVXeHOxoRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9l8hWs6PfOv3JzoAyMmbidcDFbLIgjx6mIY7Z9avuw=;
 b=TpXOVNJcBEiq5TSHx5QQSbEHjNTuDeMBrvMRCuby0yQ7Vgu95fIKOfgyi6gJjopHStlVxrFFJsgaFDBCGikQIeRj0KRkLcX7/P0PFKIXKVIJyNjxU/Nbl5VnAbCgvfJmiZKaS7U/RXT4Xoog63gv7r1482cLwIz1E5sHMt+hGXVt3BHftTBzkT0gC3CosgdkXgKJ7CEHf3XMiQobX5vyJK9QlYg/ebNA1aeoeDZEb+mOcNk00xo8WXNB2epl2phafC1q26xLf41zm94Okun62e2K32whbn6L746WpetZd7Z6hg+kwXwBvXPjNIQI1tQRzxfOvZXpIHdLXQsXnGbtFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9l8hWs6PfOv3JzoAyMmbidcDFbLIgjx6mIY7Z9avuw=;
 b=ffLOBrij/rNBGXscWjvT+jIEj89pZNnbvxzFCaoPEdoAIG8vaWxvOKSSukTejRtLeyMXFlcecIe22DMxVbkQezspjiySlrxjVtNavl+Baxt3M2Hwm1yey5qYAXc9VzfoRLUkEvvtKM7C/rmxMbUXxDS6esAVTQitxD9Q2p6Ym8I=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW4PR10MB6396.namprd10.prod.outlook.com (2603:10b6:303:1e9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 23:22:23 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8989.015; Wed, 6 Aug 2025
 23:22:22 +0000
Message-ID: <4768c6ab-2b0a-f21d-85c1-c434d25adbab@oracle.com>
Date: Wed, 6 Aug 2025 19:22:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] vars; ensure 'cwd' and 'root' work and test other inline
 vars
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672DE6507A2E9026B67D8F3C22DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB5672DE6507A2E9026B67D8F3C22DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0066.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::11) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW4PR10MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: ad539b60-3733-4938-6cbc-08ddd54018a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGFWMjhBSFEydEhveUdzTjluV1R5WnVvWXE3dXpoK2MrNnllMkFmS0hUc25l?=
 =?utf-8?B?YXkwbzVxZUxIT1ZmRmViVUVTYU1FOXljeHBQSjhXWnJ6citxemVENjF6VEdH?=
 =?utf-8?B?eGF1VFFMN0syTm41RjFSNmlyazJOSjYvcndKR2ZnK0pXUnNOUzl2MTBNR0t5?=
 =?utf-8?B?NGdnM1c5bU56enlwdENleHV4ZCtiSnVJTEcrZVYwU1JST054ME5iM2ZibndR?=
 =?utf-8?B?UWtQY29JaDVUUzh3WjlacmRzdUkrSSttdUVxNzh3K2FpUXhaMGxpVnFmYjEy?=
 =?utf-8?B?UXQzVXQ5V3hteUtzKzg5a2UxNjRyYzBhM0pJcFduaGJaOXV3Qkw2S2ZnOFJH?=
 =?utf-8?B?cTIvQmw1TTJmN1JDcHBvTmx4RmkvN3NiUStSKy9SZkxTa3BGNUR3WGw2K3Rw?=
 =?utf-8?B?MWxZYXZ0ZjIvdDlpVmwrZDBWN0RvZHMzWmlDQ01ZOGhraE1rZU1BT0lROTFs?=
 =?utf-8?B?d3o5b1NYZXZRZ0pheGZtajZrSWpyeUw0TFQ3YklVTDRxK2Vrd3VTdEJzYnJW?=
 =?utf-8?B?ZGg3NVliY3JsOFdpaTlvS0FnTHphdXB3MjltcG41SXFwekM0eVVKSVFqckV5?=
 =?utf-8?B?cVpRYXR4Qm10SWtKRXJaY0pqUlMwQ2FrOFIreFV3TWxDZEhNUCtRZ1ZEU2FC?=
 =?utf-8?B?elJkamppZCs5SVBvSU9DeHF5NnFxWE9EeUdxVGN5OUorVjFrcXFRbGtSK2oy?=
 =?utf-8?B?QmJqWkVKd1VyakUzZHVqUFo5MzJ5c25ka2V2V0VWZmdMWDU2SEN2VS9DOG5j?=
 =?utf-8?B?RFhoa2tsMUtrK0dCdTZNWDRpUEpPd2UzY0wzSEQxelFMei9kaXErTXh5d3Bl?=
 =?utf-8?B?UkZnektnd0poQ2hvMGU3Z1lXM3d1QURiYTJjVmpwY0l3aVF0Mml4bVNRWHY3?=
 =?utf-8?B?T1lURVZRdXNlSEdBN2tHUHZLN1ZwZGZVb1lpZnYwZ2RVRWU5R2xFK1BjZzFL?=
 =?utf-8?B?Sm16Y2VYWk14VHJRR0tZN3I2SUxGeXNtc2I4OTFLL01RL2dueHkzbVlRTmxR?=
 =?utf-8?B?bndGL2loemxuNmNkOWQ0SStWOFhyRFVyYndjUTNyaGlncEczRGk4Mk5sM2pH?=
 =?utf-8?B?b2UvVldQTk50QUEvUzltTDRNTVNCZGFqMnoxMUxXWDBnenU5MThtTG0zcTJ0?=
 =?utf-8?B?RkJ6bWxIZ0U5Vk5xeEYzLzltNWpyU1pTTFVqenE2VlJRNjJRMGdCY3l5TnV0?=
 =?utf-8?B?emw3OGxYS2RpdzkrUTlxWm1hTCtzM1hMaSsvbkt2d2pBalNyUElETEtuSk81?=
 =?utf-8?B?cTFwWUxjdWc5QnJUZVVTL2pZNHU0SmVkK1p6VVZZU1RoVEpIZjRDNWtaMms1?=
 =?utf-8?B?QWJhSnd6QzhaV2ZqL2VRQzFCbGFxcHJ3SHoweFZVUUtvdDJNRmZjaXZTcGlz?=
 =?utf-8?B?L0VlaUc1N2hKVzIzQmdIbm1UTkk3RkZJMUN1cUFaTGRWbUZDZjJlUjAxeHJz?=
 =?utf-8?B?U05kN3FzQWpQOFJ4U2V3UWpLVGxvTDFmVyszTTB3Q1V3YTJhQjlhVDQ0ajVR?=
 =?utf-8?B?WDh0RE5VVjVFeGYxTENKZW1JdkpiNkhyMlo4QkVTbWQyNVFpdmNKZXJKc1hp?=
 =?utf-8?B?d2FoUUFqQmI3Znh2UEl4L24wb3JoK3ZIdGlwYjRVVmNydkY4OGVBeEVFbDRC?=
 =?utf-8?B?RGlBdzVHdWdzRU9zaHRZdGZvZ2h5dWZ2NWFPV3F3YndrQ2xwUmtZajh3a1Jo?=
 =?utf-8?B?SDlKdzV4UlI1d0U0aStUQlowVDJkMnhmamJ0WFRXV0U0Qll4UllXajBtVVhs?=
 =?utf-8?B?NzJrUldBNk1NaU5PdjNXTkhRYTJmZVV2eERyb3oyTnhqY1IrZ25zVzc0V1RM?=
 =?utf-8?B?SUNiZVM0SVN6Y2wzSmJMajM2STJZc05xZ2E4WnNnLzNTbGY0bzBScGhyc3ZG?=
 =?utf-8?B?d2tXQXFXeWxvVVdzVnhJY3BzZ21pNVZXTDRBc2orczdYMnI0QTU1aytUYlBx?=
 =?utf-8?Q?eFUHdGxWH+o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXNRcExhQ1B6M0JEK3cyRVByM09jYit2dTR6YlNiNE8wL3pNMG0zMUNuOGd1?=
 =?utf-8?B?QWpHY1diUFZKQXNsWlNnMmRwTUs5OU56ZkZDcVFxR3hEQUJ1TzZxKzRtVldj?=
 =?utf-8?B?RkE4b24veFNWNEMzQzhLYStKbnhjenhtT2plVUoxa3U1TlVYLzVCK3Y3elda?=
 =?utf-8?B?K3V4MzZYSnc1UnY3L2ptN255bDh3SVhuZTlMV3ZmZlV2N2FPYUM1Y0lUUjdr?=
 =?utf-8?B?RFQrT09BcTRsTTVWbGtDU21PVTI0QTZmTkxya3J0ZkQ0aUQ1VUV5eDUzRnVH?=
 =?utf-8?B?UWUzWFZ5SXdTckgxWFcrOVVLY1lVdldtUmNsUUZsZUhtTzZkeHF3ZG1taTFz?=
 =?utf-8?B?QzFVOFo0RUc2M3ZpQTVaZ1cxMjJuTnhXejF1UUZ4c1V3UW51UWJvWWNwWjkz?=
 =?utf-8?B?b0VYc0tXT0lmKzlZd1Ewa2kxT3lqMWVVMitEcWZCVnFiUUdqeE9QTm03L0lw?=
 =?utf-8?B?eEpQQkdFKzUzSGNTL2lGTUZuY2FveERGL0UwckZubXdiT3g0L0djZjV0Rlpi?=
 =?utf-8?B?L3FwTGpmdStnbkhLRE5BUURGZnhKdXFWTVJTc3JFOS9pVEZqRCtFZGFudWFp?=
 =?utf-8?B?UitaNlkvN25pS3RDTmdsa1VEaFc5MXNFZS8wSExXeFE5TkFUU1Vva0M5RU5G?=
 =?utf-8?B?cW84OSt5ZHNndkNCeVZtN1ZWTnh4dnZkeUhkMXpQMnEvSjNyWGhJQXg3ZDB0?=
 =?utf-8?B?ZEtTZHRRK3JnRmdzUGJqMXh4dFJpd1RuVFZNQmF2RjNZdmlHWmJ0TnpWU01Z?=
 =?utf-8?B?VXRhL3BXSXl5V1V1dDRNSWs0NDZnVG9FcW5YZDdITWJrM0x2ZHJETlNvdDdh?=
 =?utf-8?B?TjVQcW1JS0UyZXE4YnlWRHM1RkJ1M29FcElEYWhiUytmM1hXdUhFZUU2MWpp?=
 =?utf-8?B?T3dmeHFGYi9LbUtqaHZHN0VWRHYzQW94VUpQVk9Ic1dIZnNRTlBzRFY0TkZY?=
 =?utf-8?B?QUE5NTNSTGRJN08zUkhIaWl1akpIallLZWJ2YjIxbUtVTUJQZ0tlMEhRK1B4?=
 =?utf-8?B?R3dXNWVKaldoampqQkFvQ2pBTGlLeGt4am4rbitwM3RxOC8xS0E5dHh3Z2ln?=
 =?utf-8?B?bUk4dXF4NlRESEE1Z2hOM3VMOEsvL2cva05qNmlwbHJnd0hwb05heEdkWlZL?=
 =?utf-8?B?Nk5BUlNxOHorYndDa3pDdWlHNzlHbGM0aXlrTjF3cEw5eEdKQUVmNExrSEIy?=
 =?utf-8?B?ZTc4OGZhWllaUVFIOUtLVklWVGNZaEs3Zm9mWDIrZDFIMldwbVVuY3dTd21V?=
 =?utf-8?B?ejBEODJHbnk3NngvMVpvZUhjalRKU1NHV1RSSDJ2Z1VjL1VLRmxBNTlkcnpj?=
 =?utf-8?B?OTY0d2NXVkFkeDBBRXVRclFlUFU2cFpLQXBDaDRoM2Q0azJnT2M2ZEc1VUNL?=
 =?utf-8?B?VGRmejBXaXRVNXZnYlFFMFEvZnhFR3lEYWdQMjgyYkxaTTdXeWJIOVFYVnZG?=
 =?utf-8?B?M2tMNGFXSHdkV0hWWm8yeEVEdk1JZTd2N0lOSW5UZWMrM2YzdDJpa3J3Wm42?=
 =?utf-8?B?Wlpyb21oY1ErbWROa0lnQlE0ekk1TVo3eWkrcmxDSVU5Sk14K0ltQUZ3VzlD?=
 =?utf-8?B?SDA0eWMvLzE3Qnc3Z3RNbkVmQ2tUYWlFbXVmdzJscERVWi9HNGhJSlgrbVVB?=
 =?utf-8?B?bEJMQy9RSzhSakVKd2lyTDVWMkpRcHhnS0RyWTJDbFg2K2YzWit0KytTOVBG?=
 =?utf-8?B?cEh0TEZuNS9HVE5qOW9adUtjNXpiRFBLL1ZOdEtNaDltVkswd0ZpZlR5QSt2?=
 =?utf-8?B?c3oxZm15c0sxSWZ4RGFrczNoZy9hemVOMjRBRlQ3d0pSUWRBVjE4S3g3cGYz?=
 =?utf-8?B?dFFVN2tXaDRjS3NnQ2g3M3ByZ3NSRzBNRlVMdWdKU1hVMHRoU3VhcTdDcjAy?=
 =?utf-8?B?NXd1TnpRUXJ2WXJ1dkRMWkExbkp5OXJZV0h5Nnd4dGRXQitJaktOT0plcXJP?=
 =?utf-8?B?Ry9sVGhmU29pKzIxdllKdkxnR3NMcEh4QzhiM0dPbE9Hd0xDZTViUjB3b1hI?=
 =?utf-8?B?azl4dU9CKzRNR2Ryb1RvdXVZM2E1aUI3dGdyT1JqV1A1TEVrL0Q0ejQvaEtN?=
 =?utf-8?B?U1JhMS82N3lUeXdHYkNHRDR1RStEMEd3R3VBdnMyU0R3L01LM04vaE1wdlBM?=
 =?utf-8?Q?Tyfj9j9jo73cSMQ8Y9oaL5QnZ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Q36WazaGrhhfrk6CyoJjORo7/aYoVtgVATfFaEIroY7WXKI+ZTAwdi/SnW4OCPkvnzeumhhKR0YoJwtUGtUALJCb6aXZtDO025RGK3bjQfD2v7k7S0FOWOaDwmLTwRic92/MF2MISDI4Kb+OGRsB2m3qdsk21SeUavwr9WsfTdeiaNR2TvTdylp43j3g72QtDMD7Wqz+SJEHaQlVqzCfepebkTfpLpuaRR18tG0t221Wz9OGIJ8qJKC2no0557xNzTBW0bjEH/yecYSbaqO+B2wZurEmEVMTe3hwt1l9tgYeCw0BRQ/6en3NQiATZHEp09A3CuglYoVXUO1T4LGbgyy8uyEkDlmrVxuMtw0I0upAVh2wADR3PeEXLTUuIK+jJFcyaNQln2dsIhM6B8F/0D/07K8tpSBwjYp8FnWPMSozIxKpmYuXYjDiKMD+dOevH4CGl3Ji0uwSdvcSqhdLq31Sjwg6ArPGbn+9GK/6b7YtWwwyF5r9JNJtERmzizgdwfWK84tWQgO0xVj06LscKc/beiSRXcp0rru5FtgNowhSJiISS4uPmwt+obJv1JPoX0eDZFXwLj8auOmkw4ivsuT7lxEunK2Lxn0nqtplz7g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad539b60-3733-4938-6cbc-08ddd54018a6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 23:22:22.7067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EfWS0SElT93rQNBhv6jHHTgAaah83AK+Olp8sZTbGyAe9rMVBDsnoUUDCykwPMGkLR5ZY2oGieRD6/P52XwqXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6396
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508060157
X-Proofpoint-ORIG-GUID: 8tC4Bnky0aprHC3S3Anu_rzvoW85aYgH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDE1NyBTYWx0ZWRfXzybcSfSaJHyD
 JnnGFSHiiyFlcViKnyn+D+OwWJ1QgaQBqIb2eI9n5Q+NLRVBxaI7eRnKUbJrNMKKaPPyEVsO4A5
 TrJIgTjUt2buCbPXNGLtxRoCa8TdZEVrvhck7l0b7NW1RMcZhIoZ4oNHb5sEzwYrxvPq/FT5X1v
 libmlY/GKk9xtBn0Wwd1isdMg6I/PGruUmXCRPnXSkRcoFQiDsibPdJeS31dWnqld+orymnvaug
 3wETy1xk9EeG0S4CLXY9piWnKXooUoWSwBznH11AUsGNVuf9+3/tVR2WPVedMyTK0PxSWgpSbqg
 TgRMzHeoBB6n02GCAFImEvT5sbbBjuLD6+uRbT/LFsob/NtzWrik6mAzoKIrzonurwblK2SFIXq
 SSDSgt8tamfkL/wJG52SFBqlnu84tY4iQF0aspcYS2ZDOk+d8SLuPr/x1KkeqRgKFHCp4CV0
X-Authority-Analysis: v=2.4 cv=dobbC0g4 c=1 sm=1 tr=0 ts=6893e3b2 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=CUbdXwvnIp6Ve3s03NIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 8tC4Bnky0aprHC3S3Anu_rzvoW85aYgH

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
Should an Orabug: be included?  (maybe not... figured I'd ask)
Also...

On 8/6/25 18:25, Kris Van Hees wrote:
> +	/*
> +	 * Copy the result into dnp (register value and tstring).  We need to
> +	 * clear the tstring from tnp once we move it to dnp.
> +	 */
>   	dnp->dn_reg = inp->din_root->dn_reg;
> +	dnp->dn_tstring = inp->din_root->dn_tstring;
> +	inp->din_root->dn_tstring;

That last line should be removed?
