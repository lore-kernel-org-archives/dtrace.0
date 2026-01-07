Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9954800
	for <dtrace@lists.linux.dev>; Wed,  7 Jan 2026 02:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767753949; cv=fail; b=KpW6sYvOHe7/kEDKBTb4Jq0DTrPU/UdaaPI86ALw29TwDW7p3EnMcJRyt9hd3AAGjZKTluf8qvkWcTqO3fgiB41SKdp09tHDxVyTHIeH+kq2bCKewZzhCykFsWm6xV36jkng/T89HMyphKTcrknH8eJVOFqhj/w0ztT/KVj6Sl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767753949; c=relaxed/simple;
	bh=oc9ZdI/QXHjuCIhrC7b6HaFmS7MATYHAAG837ebw3gA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bNY85Q3mUctLfGZoDSw8p5Tkk8RMwTH4ONjvI0B+kxJjg1u++LD7L/rtxGisRoGth3HWPwf28ZFQ9OT86qzHfCg2dFch62Gt+v3OKxQpphYjLaqO5VZ8YCgEsEuRxjqiFRln1LWk6st4Jvdo8pYdeThf8j5JmyWrrbbQ4QW6WN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FSNDA8vr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ofN36Ymt; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FSNDA8vr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ofN36Ymt"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6071Bv89608624
	for <dtrace@lists.linux.dev>; Wed, 7 Jan 2026 02:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=ze4hJB7eTmg23DxNGsSd2gd122T5MzJCkEXv3ThaQGE=; b=
	FSNDA8vr6J5BTX895I0M3l6yJU++zdC3BpTjYSo5owdBt8R9LEDewUsOxBvEoNqp
	VnPxFbyBhRLopfONcd6Lj5BvcZBFUQg0SUgz3giSINLn53E07P17Xw4QnEsSwdn5
	EZRVOErSJ2htaX0Z5VNdMNYftwogKQ8Q2S+7CUatEGrKK8Mw28K/hwVECjCftd7N
	i64uS9M0qDP3vf+mp6OeutwoeNpbTuwLkXThLqF4jCBhhvglGaJMwAZMHSAQ6j24
	TtRG1i2xeQAqrESsL/byR8RQQ5m+SVZf/V1kgL0dTtcQ4iquge/V6jQJ66cWqYCP
	2s9gEuOwGEuATHRaFZ2FaA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bhdk181nk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 07 Jan 2026 02:45:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6071uxD4030886
	for <dtrace@lists.linux.dev>; Wed, 7 Jan 2026 02:45:44 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010041.outbound.protection.outlook.com [52.101.85.41])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4besjdbmpm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 07 Jan 2026 02:45:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBi6XgHkxe44+Sg+W6w/fuZFT066S55keTruaizWh2s+diY/2YcfhSGs37yma3yjTap1jpsEwNYQVcMfIxgIkR+L3I/K0902+Pmw26U2NfjUbpGpeTKPr0ftrNM8uHoWW8R1xHDpH2vUqs38gAbBAbOt3dsA2cqD8Qdi5Fpen05Us2NQr1B13539nEgyOiKAU6n6nbKFf0+XI8H36o2oh02/EesRDd4HkSF3EtADaQY1sJxq7c6TcmmhQET3ZCrkp+M9md3kmL+eIlbm/wvjD1b29Qa6JkPVH2pgUkUfGiROyYR9HjfoSDP4blCZ6pn9fIQhjbAFAC/c5amZaQfXoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ze4hJB7eTmg23DxNGsSd2gd122T5MzJCkEXv3ThaQGE=;
 b=GZUF7k+R2pS5Q3Nqa6XUjn+axiTg47HeAIAqZEZN3vTd56w1JdZcL8fQbjUHSS4wJYb1tfTG+u6TKVM39/yjRYz+nqb4p7pOxZfEw9nwBRa0WyMmhawHFEJf/wSxJUkBtd5wrZr4rRBp7sJjMnoaUsPMSNDQyCQWUzirdHSuB6CrHshR70+6X0iW0zjsHzYR6SbLILUTYyjqlgE3r55vqXNg5ac9uSBlLakKTX9QCj62O6Pxr7gnJsh32/fVmLeosSfceREPe4PAfBVFUS7/k2/JPzpqsKyS2YdQ+wz84F3tk3esG+ekq2uUerBUwYWFsi5oGvgqao9tseX8gj7oVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ze4hJB7eTmg23DxNGsSd2gd122T5MzJCkEXv3ThaQGE=;
 b=ofN36YmtwAUwLV/v4+rV0QAtLcQOnaVpOvhs6c7EFwPCkQfoYlhcKOItX5j7D7KG32/Xrin2YOrLWrVmeLi2iCaEly7StWeIfkZufnK5BmBGwT61o2lUfJu936EeLUt/TaM8vGZtFMjkhCXRtkTN3OyIhH7+x0vy5lnuKD1JpHk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB4526.namprd10.prod.outlook.com (2603:10b6:a03:2d6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 02:45:41 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 02:45:41 +0000
Message-ID: <718c7c8e-cdee-ca08-ba39-8772d1aeb164@oracle.com>
Date: Tue, 6 Jan 2026 21:45:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v2 2/4] test: correct file permissions
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <DS0PR10MB7522B2CF26246FD7189562CFC2A9A@DS0PR10MB7522.namprd10.prod.outlook.com>
 <e872e514-608f-9e06-d05d-146284b27fca@oracle.com>
 <aVyjs1kIbPaulblX@oracle.com>
 <c2a055f2-ab8d-7d8a-5038-354708cdb19a@oracle.com>
 <aV3DcDB9SGJ0acqD@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aV3DcDB9SGJ0acqD@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: IA4P221CA0003.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:559::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB4526:EE_
X-MS-Office365-Filtering-Correlation-Id: e801ad51-5241-40c6-1423-08de4d96d8c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b1FWQXF3aU5uR29yRWx6L0dhc1M0ekZYTy9jaDJwZXJMd1ZYb0gyTXZPa1lw?=
 =?utf-8?B?eXpZZGxWcjFNbU9oMCttck5pUXU5N3NTYy9EaVNEWmQ0M1RJUjB1RlVpM3J4?=
 =?utf-8?B?c2RjYXZJNFN4a0ZDM1RsNWZnVGpTazBteWdWTjhqUDZhNDU3eGdYK1IvaTVG?=
 =?utf-8?B?Slh6Y3NmNkxPNUhtVXV0TC9EKzZtRFkweStHcElqY2kwR2RqK2RBM09FejQv?=
 =?utf-8?B?R0MzR0p2SHlqQzV6VGV3a3ZoaG5jS3JOTGxSNno4WHpjRFFqZjF4dldsNGk2?=
 =?utf-8?B?YzBObWh4bUJvSzZ0WmRnWUYwSzQyL01XL3ZPakRpbHJoSXFha3R4K0FYRU5F?=
 =?utf-8?B?N1kzOTlIajdzRitBYnBzMWJReEF1N2kzM3Y0WnRCWC9FN2VJMDBOTWU3MlR2?=
 =?utf-8?B?c3I2b3lEcU5DUjBkTzJBaStHTG5oWDRNMGExT01TQVZIam1sTEZEKzZVTVNv?=
 =?utf-8?B?Z1FMUzFZZVg2SlVseXhkUFlWaGZFK1pCRnpGTWZBVGZaQm5QWVpuQ2lUS1lk?=
 =?utf-8?B?clByYm1ZZUVXRm9xY3dQdkJxSnNrekJ6cUpydElyZjhRODM1WjZjTGM0cTJ6?=
 =?utf-8?B?V256a0NZT0VybXRydEIwaDB2SDVGYUtZZjhSQndMdnl5U0U2QmJvM3V4NEkv?=
 =?utf-8?B?cGJ4Qk4rZjByYkZwdXlNdTkrdXJtY1VMVUkrV3YyT0krSXl4Qkc5UldHQk5k?=
 =?utf-8?B?dU1MWEcvcmo3aEpCay9YQ0NpbUlwUW5ESmw3dFUvTm4xRjAzc3lOd1F5TlFQ?=
 =?utf-8?B?Z0hLTTNWQ1ZBd3hYWk5aV0tGVXJOTUxrY3dVK2dmUGdqYzN3cTQ5RVg1ZElF?=
 =?utf-8?B?eFZ2VG1VeUxDbExpMVhqRlpXRCs0aFB4UGtGaTFtNTRzOXJXaGZpYUU1TThw?=
 =?utf-8?B?dHE3QnNUZitXSWtVdUhodHF5U2N3QWVESDkwdFFZNms3c0hGSVRVQ0p6WWlm?=
 =?utf-8?B?RTZIUC93V1ZtOEQzdDBQRC9jQlpGQlU2MlNMcnFhZG1mUWdXWXY3VEZKUHlH?=
 =?utf-8?B?SjJTQndwWFZWaDcvOW5CaXlnNTFKbklHbWsyL1NtcU1JVmpNbGJpVzdZdG1C?=
 =?utf-8?B?YUovWjFBYUtMdjREeFVib3hkTXUrdnpscXJYRWx2dmp6WFBjV01jdVFTeDM1?=
 =?utf-8?B?cmllZURZY1BCczVpVThSdUVIdnp0bFZUNUR1NzZiYlF0TzVEOVY5U0JQRjFn?=
 =?utf-8?B?SC9UR1VsbEUrU2R5TkJiRU5yS1BmSlJ5VkJGa1ZUVldBU1VNNkhIK09OVExk?=
 =?utf-8?B?OVhsYWtxeVNMbmtNNmM3R01JbHQwYUVFNGczR3d1WHFyZm8rRTRNalVnREVa?=
 =?utf-8?B?d2dBQVZaS05yTG9vUGxQOXhhMGhRVVZLNDdFanBzTlNEUXZFQnhhSmVVRTFP?=
 =?utf-8?B?ZzRwa0o2WSs3eHNnM2Z6bStRLzZWZHhXUHQzMVBDRXVJU0pMMW5uQklBbEgz?=
 =?utf-8?B?ZFh3TWxVZXcvTG5JbnFqalFtaWxHNm1hV2xmRnRrZTVkSU1kRC8zUlQwcWdP?=
 =?utf-8?B?ODlJaHBabzhHa2h2VmlHVHd2Y25aRDdtVlpVdUREM2pmaU4zdDRFenRVc3N0?=
 =?utf-8?B?R0M2STZJdW5pSUFnMEN0QVFvNTZTMjFmVmJQMFRLMUMzUS84aS9OWnZYMFM4?=
 =?utf-8?B?RW5xd0dZSHBPR1FHSXczM2NLZ2EwYVdWRFFsakJvMUNuVE1rZDM1MlNGWlEv?=
 =?utf-8?B?d2FjL0Q5aDdMQzRTSGYrMlBMZi9PNk41eWUyQ1BxZkFPUnNjYnFSWlNWRnhr?=
 =?utf-8?B?WW9BODVFelhlUG9ueW5rZHRSd0JDYm0waXRuZjlKZndvalJXVXpJbGE1TCt1?=
 =?utf-8?B?cnVmUWl5ZHdVVWdNblRYRnJDa1lla0Q5ZmhvZ2FpSDcyaE5jQXhoOGM5NDZW?=
 =?utf-8?B?aENIRW9CYVVkQ3hIY090TFVtVVdQdmdGR2llenJWTWpFcDBSSnNyQ3Q3WTVH?=
 =?utf-8?Q?61vGQSEMZ5SLD9Oz1AwaIEfKgkKAHQce?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alVEcEJaS3lFdzlPbzk1a2t2VGNGclU0YWNINFB0U2pGNkRjTVFSeHlRVE9W?=
 =?utf-8?B?UzV0STNCU2t1MTdNNEgwcDVCN2VvaGYrY0c0aXlaVjhYQkpzSTN3ZktXeE50?=
 =?utf-8?B?cEJ0SnpmTUNZbjdJTTNvc0FlaDFHQ290VTQ1K21aMWZVeFhjNW1ZN1BsZ29t?=
 =?utf-8?B?TWxmZ1R2MVNMRWJHSmFKcWJtbGUyYXZMZkNQbkp5ZFArWjVlbWJyV1FnaXZo?=
 =?utf-8?B?azlFSDJmaWFpamhBVWJiV1BVUzVTd3krYW5XejJ0bmVseXlPYlVVYlJHK2Ez?=
 =?utf-8?B?VXl6MVhLRWorbmFVVmw0RzFGbDRQWFFtYlJaTllWNzdUM1Y0eXpkbWVLT29Z?=
 =?utf-8?B?Vmt6MEFWSWJPUTE0aUpSdThVY1UxWklseUZqbzh1TC96VnJ3ZzBGdDRUM1p1?=
 =?utf-8?B?SlRDOE8zRGtJN0dUVzg4Q0UzNWVvZXdsbEpFU3dRd0IwOW5FZlU0VGdsOGVl?=
 =?utf-8?B?U0VXK0JrSUxsT1NnRTdRZW1VWXcxWjRTKzVpY0drdUZhZTBNanIxT2tYenYz?=
 =?utf-8?B?YXV6dlhyazMxWVpHS20wZGxxdm1ybzZXT3ZRUWZ0dWM5NjJUYnlWUEh4ZnRJ?=
 =?utf-8?B?TTIzVVhXVjlOWlFxZWZURXRScWdrcFhTZFBXaGZ6MDI3SldUZm9DYlpTSDBy?=
 =?utf-8?B?SGRmQ05vSGl2Z090MUppT1doenk5enk4aGtSSWpkc1VuQjJ0cU9OaXpMaXJI?=
 =?utf-8?B?aWVlelFtMGlycGpmZ3dvMFlmaVRLVzJLRzlpbzdQUlRZZTM3OTBPaE9PWlZP?=
 =?utf-8?B?NG5mWU1oRzVKbWN0YzZrcmdnVjFwbG52R1FFT09zaHRDaHVqcnlrNXpBMHZ6?=
 =?utf-8?B?NmlOdENEKzJNcGpuUW5zWEE5a1A2ZjN2UENYcXk3cWpla244V3lGUE1IZWp0?=
 =?utf-8?B?RnVyN21ESFMwUnB0bVE4dGNIRHhMU3h6dzNaM0J5WEkrV3k4bjJHNVBwbTRo?=
 =?utf-8?B?VmF1bTh4Q3BGbEF6U0tWTjM3K28wUDBMckFLbVhYaWdrT05QOUUyMlRXWEZY?=
 =?utf-8?B?YldVZlRLMXBMcjlBRTFBN1RFM2ZFdHdoVDFoQVBVUkVoN3lkYnk5aG15QkNp?=
 =?utf-8?B?ZkJzYTB3MFZYbjhiVzBGV3QwanE5M3JHK29xa2V5K3hWUktocnoyQ0ZMaXlx?=
 =?utf-8?B?RWFDQ0x2YXJja3pMUmtPYWRzM1BGWXNCVXZCT2YrUWE5cXZDaUI0NEFDNkJt?=
 =?utf-8?B?UkFRY0VKeTQ5ckU3VlB1dEhUbGk4OFR0N1A4dnU0M0t2YlFtWEhPM01qSnJ2?=
 =?utf-8?B?bXg1NC9QSENvcE9LR3l5aitlakxqSHBmSnZMN0VkWkZxSWVtTlRhUDAzTGVy?=
 =?utf-8?B?a3Npa2t3UUFEY252eVl2eGpqVjIzMVZoMEJteVAxamhwTFVuUzlwTEJvb2tL?=
 =?utf-8?B?T1dpekh4Z2FONGprTzRmYmc2OXJINjZzQmkxYUtzc3NzTmY5eEt6SGxTZHMw?=
 =?utf-8?B?NmlSNVczODZvaCtlUUpCYW5OV1NjeUI1M2wrRHNnNU5IYW9Cc2xmaHliTGJj?=
 =?utf-8?B?RDlzU29nMStxeklpNnNVNHl4SHlrV0RuWUhucVBpM1dLS0xXdEUzQjNoSnpK?=
 =?utf-8?B?MG12Mi9Fb3d4bXVrSTZPakRmeEZlYjFQZWt4QTRKU3p1cEJFVUFYOHN0R3NQ?=
 =?utf-8?B?cjVQWmNRS01UOWRXMTZTRytkQ2NZZTRLbnFMRmYySWZnMXBjNnhkNWRFazJY?=
 =?utf-8?B?K0hyVzJ1a3RnTmFRek05Q1BRbEtjRmZvNkFma0tnTnFOOTFxemlOalpqY2Y1?=
 =?utf-8?B?M0ZXR1NnVjJRSXhiaWVyT2VvMUN4cGZBSngvRkw3ZEpub2k3OW9EeHFCVmQ1?=
 =?utf-8?B?TVo5NnVIRktveDJVQzlOWXR3dk50U0FNRDFBd2JCUUUvbXdkN0FLbXg4OHh4?=
 =?utf-8?B?MHczTExJMFFYY1BuQWluR1U5azhKenc4MUEwYXMzWnEwWGxJV0R0YW91U091?=
 =?utf-8?B?NHArNUVKM1hIaDlnZk9MQ0MrbTVlc0N3ZXhhblZET1dHK3EzbzFhWDkvbzhK?=
 =?utf-8?B?aFpoTEZOSVhHZTNvb1ZsT25sbXdHK1VzbWU4NzBDNzQvUDJVdXVwOTBQdGhl?=
 =?utf-8?B?ZW5iVU4wR3JLdzlTSWxrV0tsb2xrK0VEU2ZnOC9rQ1h4dEZOLy95SStTN0Nn?=
 =?utf-8?B?YkhCKzVTRnhIbSs5S0tYN0lxVVJpZGxVV0hoVnpPOUJHTjMrMy9ldXNTb2E0?=
 =?utf-8?B?cW5qQnNYYi9OK0hrZmVqWU9pL3hQeVBqVFc0dTNyelhaOTZNWk53Nk5kTmRP?=
 =?utf-8?B?TURqdG15eS9iOGh6ZU9KMFkvSVNQQnY1dnB2ZDRpaGoyL0pncjNEa3pKVTU4?=
 =?utf-8?B?d0lCSjlNTU5nNUZwKzBaK1NCWmdFeEtuajZSdDNYaHlCMko5TGNxQT09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yTUWe4o9y6NEEOYz0y+aEztBmXjgZkBXCwxzxWN2LL5A36rZBVJEtBKwoMzUWXzwtM8DsKy0MlxVXJ7DfxgSP6ioqgkDj7zeVGaS+ilEQB2eC9SxLxM7CScw0YeaBVaadgFsFAgNVZ0y4iqJKynMZS2n3JKUztvXMRHW10ICfe+eSszcXnq+ERIXYnGKM3sPVSkeGmD0s6YBnJHmYUz3RxKoyt/YUE/zFpBNNQWA3YSpx+gVc0C7yESwdXZWNt68hVUokaDWU+OjnW751UxUP4xZ9ejkUhyJpUw94zu5iSx8zSdCylDapqenyL8hqAGtvBPJKBeEAzP/v57cfgMsT0W4HOe5vyE50j/q8Pr8ICUByC2L8evDQdWkNLQyMRfTUaM9d9du8Yd5+Pg6bEEhYgWvNs6Q2xlhHT1LgqT9fgXf6SMsJ78M2q6VWX1waIkdpK6ag+mAkKLHOHr+BK0OZXHlaAPFImvtPug2xp3HPj7zMQwRuKI1a8uS+U/ZfrNgEWCrqk0AZ9+Cfq+0JTibIDvU2K1sFSbs240pgfAGYMAKGtVyDx5mzcZ+ipj157d5RiskV7CDzOO4UHqlfma5v9AHEM6kTkRtlsT7Oytw06g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e801ad51-5241-40c6-1423-08de4d96d8c0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 02:45:41.1950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /uZnKr86WvyuKutcwU99sDQsVJ5LsXGb1nLWFZ+PJP/EhnpOpMB3tzI8K20P8Hb3EYjY2HCbyLzbnc/uHB46YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4526
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601070021
X-Authority-Analysis: v=2.4 cv=VtAuwu2n c=1 sm=1 tr=0 ts=695dc8da b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QKsyj64DOmR7Hp_uzbQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:13654
X-Proofpoint-GUID: qg20_3EHWyPU07JcuMji4qiTRBrWYX4E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDAyMSBTYWx0ZWRfX7ENvabIxF502
 BHtElxOnwqGrFqdK33KUwk8Ac9Qsyjp7Q289Vp44Yfkjo9/eMPmwaArdtErXw6oTNpAHfvgmGRL
 ou+Jqypv0DCZlAxqqJzVk+IbqwYe+XyfazAp3mCxp8gJHy8HzrTKrM7EAl6LWHlwPfW3fVhpAMy
 e4Uid5QHqyHg8Z3lptrQKk2hZ07QI27hSbBdTxRFC5HKF3W6VJsuY/ygWZWTRCwQuX8K7W1/ohS
 7tFDxLo5JqlTlP5Kj+E+c988dIq0wPBygo8Nng0RxD2SV2tppUiJXtUJBvRr+jZK5/p0Dp3WQon
 EjFIYY+mqDQr14/mC3CojrW+LL3mknMTzaZ2ngZHOj183w3pqDaBRZ46GNIrw8N4CCWiwbOXBs2
 jP8Zly0hTjfPEyPd2dX9KeCBcg1i9/WfQ7SbY3tbNVPYPDYkwOF8sc11sIX5I3ZQ4B5xQ6fOFnx
 jNQmiWy9fkHyoPop6eTvSLGg3P3JPwKPhiwesLHo=
X-Proofpoint-ORIG-GUID: qg20_3EHWyPU07JcuMji4qiTRBrWYX4E


On 1/6/26 21:22, Kris Van Hees wrote:
> On Tue, Jan 06, 2026 at 08:20:10PM -0500, Eugene Loh wrote:
>> On 1/6/26 00:54, Kris Van Hees wrote:
>>
>>> On Mon, Jan 05, 2026 at 11:50:53PM -0500, Eugene Loh wrote:
>>>> The patch otherwise reads right to me.  The tests, however, are not happy.
>>>> The following tests fail intermittently:
>>>>
>>>>       test/demo/script/interp.d
>>>>       test/demo/script/tracewrite.d
>>>>       test/unittest/lockstat/tst.lockstat-summary.d
>>>>       test/unittest/scripting/tst.arg0.d
>>>>       test/unittest/scripting/tst.basic.d
>>>>       test/unittest/scripting/tst.trace.d
>>>>
>>>> These tests fail consistently:
>>>>       test/unittest/scripting/tst.assign.d
>>>>       test/unittest/scripting/tst.pgid.d
>>>>       test/unittest/scripting/tst.pid.d
>>>> The problem for these tests is
>>>>       -#!/usr/sbin/dtrace -qs
>>>>       +#!dtrace -qs
>>>> Since these files used to be invoked as scripts, the -q was ignored.  The .r
>>>> files relied on that.  So the interpreter files should drop the -q.  That
>>>> does not fix them entirely;  it simply makes their failures intermittent.
>>> Yes, I caught (I think) all of the opposite cases where I added a pragma to
>>> ensure that the -q behaviour was retained, but I don't think I considered the
>>> case where the script was not invoked using the #! and that therefore the -q
>>> was not actually effective.
>>>
>>>> I'll look more at the intermittent failures, but there may be more than one
>>>> thing going on there.  (lockstat-summary looks different)
>>> Thanks.
>> The intermittent failures were weird, but that lockstat-summary.d should
>> also fail is just plain insane.  The problem actually appears to be with a
>> different patch.  So, I'm withdrawing the "intermittent failure" complaint
>> about this patch, which should be ready for a final version.  Elsewhere,
>> I'll report on what's really going on.
> Yes, I believe it is due to:
> 	[3/4] bpf: allocate the buffers BPF map to fit highest CPU id
>
> I must have introduced a bug in that patch.

Right.  And I reviewed it.  We replace num_online_cpus with max_cpuid.  
That should be max_cpuid+1.  Is it too late to rework that patch?  If 
so, I can supply a patch to amend it.  (Anyhow, events on the highest 
cpuid are missed.)
