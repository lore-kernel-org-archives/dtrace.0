Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686CD1B6541
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 21:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731361852; cv=fail; b=ZNCj0peoDu7yievVbv3Ln0x0HtU3wnnUyEZdj7PojlijJHpku5aXkChzSmfbw3BnPxj+3+Yp4gpKGkW6v+dFmcTq87F/d3tVtLNzIkBaAptKJj9zM0ke7Mm1gI2Cl7joFamjP13G1gX8+kMw1SMj8B7YoCt+0UhwSfYBiTjP5ls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731361852; c=relaxed/simple;
	bh=OHLxn+seGQXBpXLJucJdnr5Ed6v835T+fJCkjMkYuvA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AqxpQdfmtkYIJIgfW7xorU3xeebhfZg+vt9XoCesrkDdloAZ+VcamDHtkmucjOgFQxUkBF89dNNXIZVSVzsZVlLEh7Gp3HAgLZatgqiiyaq5H1MWuYNyGC6f9RSfChMPJL08LOCWEcnvkLkUrLgX+P0lUSyRBzvMOJq44aVZyAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KLtTs7X3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QKWUWg1J; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KLtTs7X3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QKWUWg1J"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABHWPpk002339
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 21:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=grCJz1FKdmoOHQpZOgw69kyftcLfQdRv+DM9q2zDk9o=; b=
	KLtTs7X3JSRpSRRu1SWiriQqXVobQBkPjtwszLTG/Wv6ZcrO4tgxWX0LsXHkQFf5
	cywJUlh0ttxWJuk2kdFqwLLlWh1ytDJK8Dyhe5QskJdC2hflj4slLufKs62WoLio
	LeEhR6w4Ivbs8t4V0APjDO6/HrDMQZuNCLg8BSXtxY5U38LVXRMlg1Z8Vjt2jFVT
	d6kBSyuU0FdX2V4eFGUJZNlMtWYVEd6dZaAXKa5SaE1MqWzLyQ/3hxmyTKo3xW4k
	nFWLESdf2NyJqommmmKRFzQsD2AHellJZcABSW8ZBoOrdsVlWMtFem8IXvCXjxUp
	BHh9d/j9v+5QlW8EfxsEPA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0hek7ks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 21:50:48 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABJn7iw034404
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 21:50:48 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2044.outbound.protection.outlook.com [104.47.58.44])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42sx67fh9d-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 21:50:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AaTQlRD7mkh+Z5kma93DG0sHvgsEbbB0WVUfM+Xo4HHHRhh9Ndqaa4PkAB4eJ949E2TJ+yVRZcpKhWYQ/TAa5H8hCoOCoQFsOUfBRTEIIODgmH6xVSyGwRlvlNQvw3V9v7ahffrAcPDTRSHTkRK/0pzCcxfJxOvs2Jre3b8lhpEk8DziC7omVv3Wu+ZZK7uNeFocUa/1N1/2lxHr/3gVFSJXg0/mhdVxgGN3yxhmM3yuS+u1WTOFAsXhH+Y74u66VzsymbShYhZXqadja8PNL+oSiMyKUcybVATa/UBA3Oxbz4QAf7+hxKEgwASHbHuQ7PyxbyqaW1rNv3bgfJqEHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grCJz1FKdmoOHQpZOgw69kyftcLfQdRv+DM9q2zDk9o=;
 b=sxN7UhDJI7n5oY8nye95BTne2J1MaV/CBG1E5H7uoVCNY6lhXVgubRwoqmnv7F/7NZFHxPo3PTt4g1sgFSYtB4sHfcfPZmKAvHTcbZ8/1S316et0wWSwLu+xVIpOArI7odXu8H8VbLI+9+awkom9WoMkI30vOzWlTMNJwZyTkBqrKVTO0qmzWHT+XBox/AU/Y3TLApvwJt5e7fbD1xlisJy01JJObdg/lzmcesr6J3u0gTXpPbJBW8NK3pkCUgURkdxwhdVlJIWq0QYuDDh6er/85N58HUeSZ1SD15mEQ/ncf+sEkRPZmGxHrOIIBFiC6m4vSsuRw7m1KZyozmge4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grCJz1FKdmoOHQpZOgw69kyftcLfQdRv+DM9q2zDk9o=;
 b=QKWUWg1Je6GBcnYn33w05Deg91j+M8cN7PjdijhLX1QZJiYzQX6RBkiA6jE/wK5N+NOwCEUgoJmjyKiw/J01G195uj5HYJHOIv0M7HW55tdJiSgeJTK5f0S2FJBrxKavcZ4z1NVqkboZRk1H6UkChidL+ESuQidfHwd6WDe1t6w=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH2PR10MB4326.namprd10.prod.outlook.com (2603:10b6:610:78::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 21:50:45 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 21:50:45 +0000
Message-ID: <1f013f23-43de-8881-d292-c1d34e80f295@oracle.com>
Date: Mon, 11 Nov 2024 16:50:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] tests: repair accidentally deleted tst.pidprobes.sh
Content-Language: en-US
To: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <20241108211200.457663-1-nick.alcock@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20241108211200.457663-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0048.namprd03.prod.outlook.com
 (2603:10b6:408:fb::23) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH2PR10MB4326:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a7f1784-e9ca-4114-7bc7-08dd029ae565
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MUczRDlEWWQ1ZTRYSXBSNXZkaXVxb1M1MEhaNXhhSms1cVB6eFNTSWJFdklC?=
 =?utf-8?B?bUlCb2FnQmFLRHlQTmV6OGpBcDQ0UzQrcldIZ0ZlN05mdTlabmg5VXdHZHRS?=
 =?utf-8?B?cGV5dEFvUmtWZGJHSFBJdjQwN2tJcDRDQ0xYYTdTaUZGbi9KL24rK2FxSjYy?=
 =?utf-8?B?TWxPdXJ6amcva01yYnRmQU9uM1YvUytqU1RPMUI2TmZvUldGY0xSOHlyb1RW?=
 =?utf-8?B?aSt3bCtQd3Z6ZjlnNjk3UXNBZ0t5dmhianhtTy9KeC85S0ppeHM3NmIyVjlU?=
 =?utf-8?B?dXg5TDRVdVNrcXpkQ2xvVUFyZjFGYjVCUE1DVUtWVHBNMENQTTc5K1J5ZXkz?=
 =?utf-8?B?eU04TU9VOTk0cXYyMlhhTEtrN095M3J6VjJidXJ1OFFrdGpCOVlxR2VodHlE?=
 =?utf-8?B?M1RxZm5QZmVtNFdjVWRyc2RNS3JOMTh0Sll2VDJVb0hIaDAwakFVditDcG91?=
 =?utf-8?B?d0R1UVV3Q2ZHeWNxbk91akI0alpad3J1Tng5dENpNWdjcGhQTy9NcUdhVWhM?=
 =?utf-8?B?Sy9mSS8zKys3VTdUTmltNnhIYlBpT0J2aWZzMms0RGdVZlhTeUtHMWVGdEpx?=
 =?utf-8?B?SUY0WUcwdnNRdXpvUVpWYW1sTERRZHRQS2kzMXdNR1BYU3pXUFhrYTVFOGd0?=
 =?utf-8?B?VHRpL1AxRTR2R3dISkNCZno0ZG14eGxYb3hxTXk2Ti9nbVFFRlJSNmVRUE1G?=
 =?utf-8?B?aURYclVnckdBbVg3Y2VXTTBqZWJxSzJTTnFVZHpScEdEZmNrbHltUkhPbTBk?=
 =?utf-8?B?c3dZdmx3TVlEL25DZTR2enMvcHg4M3QycThsT2xLUzVvQ3U1UXZCUVBYZFEx?=
 =?utf-8?B?Z3ByZlI2d21HalhJSytka0lqUnFWd1YwSVZBZ25PdGp5bHBUZThNa1AvNE5R?=
 =?utf-8?B?dEVlamNSVTBCZW10WVluZUtGWWRCQ24vbW9yc2xDWTBMdVBlUUhocjVGK25K?=
 =?utf-8?B?eDZCelI4a1c5SkZ4a1JnQmlmTVJHQXB1NDlrckJWV3BUTmhJOEpVZUR4aG9O?=
 =?utf-8?B?S3ZFSFVpUUxYMmZGRlV1ZktCUEp3alNMN29WTjl5MEVYNFk0U3E1WU0waFJS?=
 =?utf-8?B?TkFkcFI3UU1RV3hhTHlGQzFEZW9VQWFId1F2dGN3Ymh4VnNlM3R0YUdsa0xX?=
 =?utf-8?B?a2JWODZuZ0dqVjlvZ0x1K1JtbDA2bFhTUCttTUdMb3JyMUt5NVZKTnRvL082?=
 =?utf-8?B?ZG1ydGlxZUJQN2JMR05ORThqYW9IbE1NandhNnVxUVlkcGlSK1h5Qkx1ZFIr?=
 =?utf-8?B?M0V0dWxpQkc5ZDhOcnJBVDgxV1FuUEg2aC90VjFGYWZJLzg2MXVVN2ZQUWJT?=
 =?utf-8?B?UFRSYkwvMklMazY2cjBrc2l0dW1hbzhsWndTWndOZFRyaW5jd25RRGtDaUto?=
 =?utf-8?B?ZVBBdmEzRDEyNVpMWnlyc01HVW9TeFdhYnMxWWhEUEZ3TnJKVkxKSXZSaXBG?=
 =?utf-8?B?cEJsWVNhZGNEOEtaQWZ2Ni93RHZDQ0xCUmhlbFlOYjFvTWRUQ0trcFFOOTFv?=
 =?utf-8?B?N3F4T3FXa1V4ckRmWHhvMUdwSzBCVFhESmZpT0pmS3hCS21ZUHhXNXhORTM3?=
 =?utf-8?B?bVpyQ0RlU1lGQzJFVnRXN0pmRnF6NUxLY0NXMGozekJSNXB3SXF1OW8zdSt3?=
 =?utf-8?B?aVVnMENUYmlYMjBFU2toRzlwSmV2K1JTdnJwbCt1UENzL3RUOENFSlFlOS9E?=
 =?utf-8?B?U3k4Q242U2RIZXpHWGpGSzdxcW5IYnBHa3V2dk9aOHk1U0JaNlpLb0FjZnlD?=
 =?utf-8?Q?4US0JAKM5kIBOrDc1kTLM31qYiaNUfosIMTSuVT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmZMWlg5QjdwdVphUSs1Z1ByWWRuaEtNK0o0amxncHhPbG16R2U0djNWbUs0?=
 =?utf-8?B?TXp5ZTloWCt4cEgxUWRiYzFDcml1bTNmV1lvUzRnMmRZQlFTVnMzYzducGFK?=
 =?utf-8?B?VGt4cE1uUmlwQm1RaHdVaDNCdEJkeGIyVDRadERDN2hWMzFJcjlTMDBPcngx?=
 =?utf-8?B?dGY3T2NFZXJROFpCMm5SN3lRbTVZaUMzaC8rYVZDSSt6Y25SV1pUOXZpL3M2?=
 =?utf-8?B?SW8rSUFBbUN1OXh0Ykw1ZzNiUG9ycGVKUWYvN3MveWEwWktkRjhQYVRNUnlN?=
 =?utf-8?B?YWZtR21sM2gwZ3h2R0g3NFJDaVdpNUpncldXN0x6dWdZLysvMi9oempoeExx?=
 =?utf-8?B?cEhWUEliS2lBWFhSTkRNYi90alFoTVdVek1ZaVg1aXAwcW1zMS8wdDcxM28y?=
 =?utf-8?B?N3VQSjk0RFdYcVUyVWlvS0o5UzBDUTlhOXpUbkRNRVNTVTcycVRkVHQ4NjBN?=
 =?utf-8?B?NmlNL0NFQXk2UzlxbEk5SzBoRkdTWXpFaGdmTWE4M3lOQVVmTW1YMkFlZG8y?=
 =?utf-8?B?eDh6czJFQjl6bWo0TFlIY2dPNGZSdWR2WndubmNWY0hzemNlMndIYWdhY1Ro?=
 =?utf-8?B?b25veElEQ3hJRmZlNFZDQ1RrVXIwdFNsdkhhNnEvSG5kaWxWaVJaOGdycHRC?=
 =?utf-8?B?QkRTbFByL2xIS2IxS3Q4MWxnUytGYnVsWGU1THphdXBhSWtrUE05K1pPOVBQ?=
 =?utf-8?B?N1pDYktoYzROZDhyUVh1VlA4Wkw3RkE4OFVDOXkzenQ2UXpVbkVuQXZDaG9Y?=
 =?utf-8?B?Zkk5UjhXeHRRRE4wRHZKczgvWStRWjJGaWFlck1QOTA5Mnl3aGRjVnRmM2dk?=
 =?utf-8?B?a3Q5eTBXL1N2TDFsWWdFSDI3V0YvM1hFZkhkY0ZhMmlvSjZ4ZVNualRaTUUy?=
 =?utf-8?B?emNTbkNLVVFZOGRkS1g4NzZHNlN0SE16clJMQjR6Q2RoWTA5Y01BVXBCL2pr?=
 =?utf-8?B?NFNRcnF5RnBOdThrN0R1S25FTE5FQnN1NTluUXRiVzYwOWovMXZMaGxHQmM4?=
 =?utf-8?B?UlMvZGRvU0VXQXlVWVdtM0lZY0hqb0NlUklzTlJYaExjclJ1RlpkUjh2SjFi?=
 =?utf-8?B?Q1kwL2tqUHVHUnVMQjV5ZEc3Z2ZwZ2kxdzlOYmhCMCtGN0xQUXM3eHVkU0k2?=
 =?utf-8?B?NVBieHFwTHREMSs3TUpBVmc0TEVjekdNb0svam5EMEJLVUVqanh2Z3FwSW1F?=
 =?utf-8?B?UEJZeFZVeEJ4TVQ3VVhMbVpRTjN5VkNvTGxwRlJBeFloKzVxZ2hCdWNwbnRP?=
 =?utf-8?B?bUtwaUFramF3T29tMm1CMElTNjlCRUxLMStUVUJHdHZjRFgzMytRclNIQURi?=
 =?utf-8?B?UklGUWIyNnJ4T1psS0I3ZmcyUDh1RERpZDc0KzlIT3N4MjlZZjNScWZzR3d0?=
 =?utf-8?B?TlBTZEh1UDVQcVlaZzRJbXMya1pIMENYSnVraFdnQ2xoaE4wVlBWaUNPWnoz?=
 =?utf-8?B?Ukx2TDFxYS9EZFcyREtMODZrSUliV3VPQVhzSEM5Yld0UStRUWtYSFdkVnJv?=
 =?utf-8?B?OHdPYmkwY0E2RTh2NHpSTGVla05UaDYwNnhuTDBhekh1M2ZhcFhvc0tpb0RJ?=
 =?utf-8?B?SW53NFlrQmVibFhobjR6cTNlU0wzc1JYTVo1SWNtL3J3QkUxWEplYjNUb0hr?=
 =?utf-8?B?NEZtRko4bHdseDBVZHg3bUQ2WWh1VDNqOXE4N0Y5UXBoRXFaZUN2UmNqMWo3?=
 =?utf-8?B?bUpoOUdKd3FXc1UwSEdGV0VBQXM2cEt0MENYWklCcmxMbkprVHFzb1lYeTJ2?=
 =?utf-8?B?N0pEMTJ6b3ptOEM5blE3VklYb09vZHhoRmxNeTI0V3VzMnhlYml6TnhENGh1?=
 =?utf-8?B?Y1BWVkVnb0VUMWhtUTBDNFl5WmZWc1R2YS9tRGV6eldmNEhra2JZZVc5TGdw?=
 =?utf-8?B?c1VwQUtuM1dJbFpUbE5jYTZxVUJrcXBzNUl2UzlhUENCK1NMSzNQTG1KRFl3?=
 =?utf-8?B?QzRFR1NhazFGRDJsTFd4SEdpNlN4SWo0eDJkUTdmSjFtTzFseHZ3NmNzNmxW?=
 =?utf-8?B?Q0hzR2dnLy9qOTQ2QmZIQ2kxQjlGdWlKSTA4azhoajlnaTB3TTZJdm1OWjY5?=
 =?utf-8?B?ZmYzenRiOHFLdXZMTmFuSEo1cnNwUmZYcW5TUjV3b1ZDWktHTzJSV1FLbzRL?=
 =?utf-8?Q?STL10EqhbBynV0PmbZfC4Bs9O?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dmHGiOl+3mow9CxmGpDaei5Fd21aZ+RpLhGb4o5Az1+wi4hMyu0L6TitQACh3cvzwQBxU8V9p7bKgV+HQweVhzF6MF1ijV+lDNzbmDPM04VCK6XLLDsOCalINuniZkh3m03CtcQxtORUB69kwTjJqolnCiaCrrGKHSzhBM7NUV1YAfCUE79Eg/1NjDMr9tf61r13M+MIonXqIjNiit53a4OPCxvtJRKKJxq5Rko6SS2kWrfqXG57ru9VhdRv4f3qCFLAKrPyGiDsf4JGT9lj34aBnJ4Rp2IPK4CbSgIavQBNb2x4aCP/93hGzx8hdif0XPEdWiLjDOoGjZharrNW7iszGIkadfYvGSGEOqffjG0/ria2SdQPZqac15e1xtoMkHDVUmN6WfZFp0Na6aKwrqh4hqMkFEqZjfX4S9QF6AXqXZTIVDyu7K1dgki2UOwVjKk1rlAdCgOFV8to+X4RxGMB8to/dL2jxWusbsknJLGB+NWIHVeDb3K66Cj9/T0iv3Nu+jFJNiRJr7WHjk/MobzTVrg/T8NC5Y5bcipab5DDBKzw7KUX0N+zg9XI1bOi4ExixF8nYRRZ+TuqK6eC+45hUHduZ+5ROz4OQJaez5c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7f1784-e9ca-4114-7bc7-08dd029ae565
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 21:50:45.5415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8GvdlQ7GKL7eN6nDq1iOW87f/Sk3PJeFDpGGlM3YRokLj2eZXllDu0LIVKusSd2C3LbI0W9k8hoZ280LYgn89Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4326
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_08,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411110175
X-Proofpoint-ORIG-GUID: dr7a9EDKNkNzWEbwPacANmokab4j5qxI
X-Proofpoint-GUID: dr7a9EDKNkNzWEbwPacANmokab4j5qxI

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

FWIW, I think the new tests should also have .r files.  This would 
improve the chances of preventing false PASSes.

Also, I think the way of keeping "library" scripts from being run is by 
sticking them in utils.  I mean, I guess you could also omit the .sh suffix.

On 11/8/24 16:12, Nick Alcock wrote:
> My intent when writing the earlier tests was to have
> test/unittest/usdt/pidprobes.sh as a sort of shell script library
> called by tst.pidprobes.sh, tst.pidargs.sh and tst.pidargmap.sh.
> Alas, *.sh is executed as a test by runtest.sh, so
> pidprobes.sh was treated as a test, not a library.  So rename it
> back to what it was called before and make sure it works when
> invoked directly by runtest.sh, but also let it be called by
> the other two tests to test other corners of this.
>
> (Also: apply some small review comments that never made it
> before the previous patch hit dev.)
>
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>   test/unittest/usdt/tst.pidargmap.sh             |  2 +-
>   test/unittest/usdt/tst.pidargs.sh               |  2 +-
>   .../usdt/{pidprobes.sh => tst.pidprobes.sh}     | 17 +++++++++++------
>   3 files changed, 13 insertions(+), 8 deletions(-)
>   rename test/unittest/usdt/{pidprobes.sh => tst.pidprobes.sh} (95%)
>
> diff --git a/test/unittest/usdt/tst.pidargmap.sh b/test/unittest/usdt/tst.pidargmap.sh
> index 0c83f8703539..3594e782b0c1 100755
> --- a/test/unittest/usdt/tst.pidargmap.sh
> +++ b/test/unittest/usdt/tst.pidargmap.sh
> @@ -8,4 +8,4 @@
>   # This test verifies that USDT and pid probes that share underlying probes
>   # do not apply arg mappings (incorrectly) to the pid probes.
>   
> -exec $(dirname $_test)/pidprobes.sh $1 t t
> +exec $(dirname $_test)/tst.pidprobes.sh $1 t t
> diff --git a/test/unittest/usdt/tst.pidargs.sh b/test/unittest/usdt/tst.pidargs.sh
> index 53cba7c39624..0156d23f2f28 100755
> --- a/test/unittest/usdt/tst.pidargs.sh
> +++ b/test/unittest/usdt/tst.pidargs.sh
> @@ -8,4 +8,4 @@
>   # This test verifies that USDT and pid probes that share underlying probes
>   # get the arguments correct for the USDT probes.
>   
> -exec $(dirname $_test)/pidprobes.sh $1 t ""
> +exec $(dirname $_test)/tst.pidprobes.sh $1 t ""
> diff --git a/test/unittest/usdt/pidprobes.sh b/test/unittest/usdt/tst.pidprobes.sh
> similarity index 95%
> rename from test/unittest/usdt/pidprobes.sh
> rename to test/unittest/usdt/tst.pidprobes.sh
> index aedc6256f195..6fe6d752a6d1 100755
> --- a/test/unittest/usdt/pidprobes.sh
> +++ b/test/unittest/usdt/tst.pidprobes.sh
> @@ -6,11 +6,16 @@
>   # http://oss.oracle.com/licenses/upl.
>   #
>   # This test verifies various properties of USDT and pid probes sharing
> -# underlying probes.
> +# underlying probes.  With only one argument (as called by runtest.sh),
> +# it verifies that USDT and pid probes can share underlying probes.
> +#
> +# Other tests call back to this one to test arg-mapping behaviour,
> +# verify that usdt probes actually fire when overlapped by pid probes,
> +# etc.
>   
>   dtrace=$1
> -usdt=$2
> -mapping=$3
> +usdt=${2:-}
> +mapping=${3:-}
>   
>   # Set up test directory.
>   
> @@ -86,7 +91,7 @@ fi
>   # Check that the program output is 0 when the USDT probe is not enabled.
>   # That is, the PYRAMID_ENTRY_ENABLED() is-enabled checks should not pass.
>   
> -./main standalone > main.out
> +./main > main.out
>   echo "my result: 0" > main.out.expected
>   if ! diff -q main.out main.out.expected > /dev/null; then
>   	echo '"my result"' looks wrong when not using DTrace
> @@ -131,7 +136,7 @@ fi
>   echo "my result: 10" > main.out2.expected
>   
>   if ! diff -q main.out2 main.out2.expected > /dev/null; then
> -	echo '"my result"' looks wrong
> +	echo '"my result"' looks wrong when using DTrace
>   	echo === got ===
>   	cat main.out2
>   	echo === expected ===
> @@ -297,7 +302,7 @@ if [[ -n $usdt ]]; then
>   	fi
>   fi
>   
> -# Sort and check (dropping any wake-up firings from deferred probing).
> +# Sort and check.
>   
>   sort dtrace.out          > dtrace.out.sorted
>   sort dtrace.out.expected > dtrace.out.expected.sorted
>
> base-commit: 1a87c88ebb6e8b13dc5ce348d825a8dc3512ace0
