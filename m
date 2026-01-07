Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED0C31A062
	for <dtrace@lists.linux.dev>; Wed,  7 Jan 2026 12:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767790110; cv=fail; b=QO55YtYmzLY5MBRoqOn87/WDcl+kHtZrdubb3hD6atvRiyYDN2zy0P1J4RHNNH60eErvorFJVMHS+ZK4k6uVgiJB4DOcrdikQegjLmyCyH6bWnHM6Y7zGlRBaP4tmBhN6kiivgRID0dEs5O+8suPnj5HbRPW5kWWLHsGy/NqIEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767790110; c=relaxed/simple;
	bh=PxUix+gg344QXSpKQW/xK+FFMCzGATJst87kWliC1yU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NqqE0fYhJd1AA9DK3957EE0o1XibqvEhJLJU87S0K9rvvSZ1k96x4hOTmlZ7JLQelIXCYUDjUiL6FN51h20ERD5AgotiUZrHrVeX59RRXlddN4ujqpSXrYZEPtXm3OT14aJgUsaxCfvlOh1wLBVC2T3VzloVMoxjg2m+QKAMQg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dQuvwfiM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=U8MVrC5x; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dQuvwfiM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="U8MVrC5x"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607CeGVV1934698
	for <dtrace@lists.linux.dev>; Wed, 7 Jan 2026 12:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=atJGSA0lthNtNrRKwEuX3HWrZGqTekMoFH6qWGuYlXU=; b=
	dQuvwfiMM0nyky13IS5g6IUYPjVQjkEoG3DrCHa78TXFmJ9moUi/qGTTeFJJXB6/
	9wYTOakbxFIEvY78qNWJ/lRw97BCUAS3I6i2Fkpj27fAiOyXiizUMGmp/nw/j4N/
	8X3+O6N9a/lokrducqAcwKzy7KzhAF05BVEndEnAAMstu0yTgkdYRntyts59QqZe
	jyxqRW5ThR4mfbFyJ+SUrG9bTIAWLFORSPGajd5a3RF+fbKxiF8HkjUSDr6ncVbk
	LzQNymUz5VvXE6kGGJJ+YJ0eRojSlFBygHDMNqn6v3nrmwJQD5I2LULAp5Zixz/B
	QmBGhjV/Is56mvJr8GKa+Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bhqpsr07v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 07 Jan 2026 12:48:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 607CUAZQ026338
	for <dtrace@lists.linux.dev>; Wed, 7 Jan 2026 12:48:26 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010004.outbound.protection.outlook.com [52.101.56.4])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4besjm353n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 07 Jan 2026 12:48:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lkkicPAVubGSvQswDs0YyuyooZBDyp8nCSJpSHwxRIg8uBJXQA3qquG+UxRJuiIXwjsA+enfdhZG76M+BBErOiPOWEsyZK/sVPxj0udSpasV/liFkW621mld30rG07zPqkfPz6oQt6vtf+UbZTkpyFzIZur4WZ/tZBXFgb8ABV/mYC55Y8+aq1gVXkUxuZbWFJt6WooreoT6dUKgCIWvetqZYmTqO4e+63uRtvVC5PRZnSbJtFBott7/Hr0CBccyjEP+nbz3HVYMr3bnvMEkcv6/ss4ZaVo8os0SgbqjdJ+kQZGDXmtoDCcavQmPQlh5mUOVm7yinRwugadLHwBPBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=atJGSA0lthNtNrRKwEuX3HWrZGqTekMoFH6qWGuYlXU=;
 b=MmXOP1MJ3eAjDb/nAGz8n65kNqz1DKiTYiT5CqsHgxkxWTerz5AZB1XWUiNDDhN0KZ07T0RN4c1VnPOkj5VBqojDyubwPVLUx6/OBiFCIGd4lSaer7aYOIpKoQ1jhd18gqh3fO9WcjIpUfV3yGH5MEEI6mKTSitsbNB9kcGQcZd98++0mLx7twiXaq6pjKbt3oISqgDS7jsnyd6U0zmym4JojsXllJd0ErjdnIm2XvHfZ5Ux5zldAwOyrvw8KMlI8T84j339sIbHGPUvHdfQw4mYUE7ltZsN3x9q9wpwDcgDh1Sn3XacrlFqZTe1Y44wPGyD6hIFNP2Nk3YFFlunDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atJGSA0lthNtNrRKwEuX3HWrZGqTekMoFH6qWGuYlXU=;
 b=U8MVrC5xHjiMhLzSYMl1kOQha6bPM1rcmpDxPh0UgA2P1EqeQvkaYg5ocUyvNFnGbiTgj2l8ERc9r3BbrT0jShKkK6Q6EVrwqBQ2w/vNyDl9VNO31w/gBAZ7eUJpozbC+gka877xMEPGLILSU/AYdpXRPzB7Olqx4K32LMOgdNQ=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 DM4PR10MB6158.namprd10.prod.outlook.com (2603:10b6:8:b8::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.5; Wed, 7 Jan 2026 12:48:02 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%7]) with mapi id 15.20.9478.004; Wed, 7 Jan 2026
 12:48:02 +0000
Message-ID: <6099797c-a9ce-45b8-af29-f232adc2bd42@oracle.com>
Date: Wed, 7 Jan 2026 12:47:56 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] stapsdt provider: simple system-wide probing
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20260105122728.436769-1-alan.maguire@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <20260105122728.436769-1-alan.maguire@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0361.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::17) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|DM4PR10MB6158:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cbd22cf-4f1c-41c2-fa4b-08de4deafe78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1p0ZGg4bGJ4MzcvSEVzN3lrKzFiM1BEUlBNY3NnMDhuMFJuVFA1eVE3bjBv?=
 =?utf-8?B?bzFiWHlrWkF1MUhzYkx4WFZjREJKSUVseE9DYTUxWVdPdGp3UFNUeWY1U1V6?=
 =?utf-8?B?Mmx6VE4xaTRxZWNpbnY5aURGejBza1FQbTdrTnpyaEV6ODU0ck5ocXRrd0hQ?=
 =?utf-8?B?RUltbmtxaWlBNm1WSVppcjE0eG5BRUZmQXJDWjdvYU1KbG0xY3VNekhidW5l?=
 =?utf-8?B?RkdmUEtVU0J1WnJBVko5bDN6ODhxbWVkOXpvOFU0cWlZM09pZlJnS3lCcE9i?=
 =?utf-8?B?VitHVFF0eGhXTzBNY3N5YWhXd2FJL29uWjRpMmNmS1JuWHdpV2x3ZThNeXZi?=
 =?utf-8?B?THJoSlhNSVU2S3ZrOExhc1ZGeitOdGNNUC9YeGl0VG0yRm5ieXVMWGJlN0Y2?=
 =?utf-8?B?c244enh2aXNONUZmZEtQamdVdnVGS20zc1ZJYzU0SjRnODJhalBTSE05YUhk?=
 =?utf-8?B?d3J5SWNLTjRhazFya1ZMeFVwMlNSdjVmWGdiWU5lZXRkOUlaWVYxallNTHB6?=
 =?utf-8?B?dS9KTjF0NytBcEJRbDdSYSs3T0pyLzViRVJqNEVESkhyQW1FdEJtMXhMZ1Zi?=
 =?utf-8?B?NFBVelNjSEdOVkQ0VGE5dUMzd1lDbEoyR0NTang3L1lqdk5qZlRST0ZxaklV?=
 =?utf-8?B?R1krVFlmMEorYlNPeStGUkllMHMxYkh5RjRNbUtBVXU2clh0UWsxNzJ1YXdj?=
 =?utf-8?B?VEdFR25rY251YVNiT3lEbHVBM2EzQi9ESUg4TGw5VFc4RGNMZ0d4YmtYQmly?=
 =?utf-8?B?TFZoL2FwRGNCRE1CREt0OUVacThSS05iSGpJVVY0OHpLb0lYeDNBL1ZUVXRN?=
 =?utf-8?B?ekNkR2xxK0F1enBkOE11ekZrcHpTY1ZocFZRVUQ5ZTJQbzB4V1p1MENTWElQ?=
 =?utf-8?B?cUlQODFvTFM3NzdxT25wVnV1VkxNK1RiWVJPdUNrNnVKWDNOM3RpNFFVQlFw?=
 =?utf-8?B?TXk5T3l1YW4yek9qTVVsVmNUKytVTHlwd09JTzdlOEdtcCsyNHhXb3pkc0Jy?=
 =?utf-8?B?VFgvS2x1OUdJR29UQkRhMzBOQ3QvSVhNekM3ajdqSk56Sy83ZGJlOEgzWmFz?=
 =?utf-8?B?eUJjQUF5aDlIMFFoOG9tZ2RvZzBTRVhINXhjVzNEeThTUm5yUk45d2FSYk51?=
 =?utf-8?B?TFhDOUpQV1NnYVZyajFwWGlmMzJEczZYYncwTmpTQThTV1VsVU5UUW1id3ZW?=
 =?utf-8?B?TFJ6RmhvVjNtNSs4SytNSkdOTTZnU0h6MnBPeEZvUzFTN0RCNjB4Qnc1VVNU?=
 =?utf-8?B?ajhwNnJmSlVwWTVJYmJ0VVBKdTF4dUZDczZsYlJDS0tUT1I4K0NUdVkzRTBS?=
 =?utf-8?B?Qm5rTzg1dnR0UlY4Q3VrVitheGxONDk4bXBDSlo5aktEQ2duSWFsQ0NqeHdu?=
 =?utf-8?B?bnBsSEhEc29JYjVNWDc5TGxoamJWd2FoVy9WSG5rUHpXcmwrRHJnZXBxMklY?=
 =?utf-8?B?TXBocmVaS3E0SENubklNYmpJTnp6NEJTNFZia1hUZ1p5d0tQNGh6T2VvaWM4?=
 =?utf-8?B?NHI4emg5clI4QXBUSTF4TGp3ZkhUTFhDRTVHRk1XZm9VMmw0dWlvUlFZdS9m?=
 =?utf-8?B?M1hGNm9PZFQ3TFVLRU1ETWlWTzhWdEVoR2t5a1BpMkFoVmQvRWtJdVc1SG0x?=
 =?utf-8?B?Vk81TXVSZW9zbmtjVlZQRmtmdmV2WTh0WDg1WHBKb0YvS1NMSWlwWkRlZXhk?=
 =?utf-8?B?SnlNNndzNFZXMERXYjdDRUJ1QVN6OTFUd2NmNnJTdWtSaXZiK2hMN29WZHFK?=
 =?utf-8?B?bm5JaFh0Njc3NEJtT3ZDS3V6NG5XMEVwNmRNM2FtOGpLZ1ZKRm04K3ZVOFRu?=
 =?utf-8?B?aWRMYTZOSEFSSFFOVUJ5UTAyQm1QNTFyQmdMdFdVeHdrSExqNFBhUjZTamUw?=
 =?utf-8?B?RHl1SjJEQTNmV2hLM2o5c0xQUWZUWmpNb2tIbndUYzZ0NmlYaVlCQnJ6OFlY?=
 =?utf-8?Q?FEhavctryqUWWRXg9nQyjEt0nNx/e54R?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0YzRkVUZnFrSWlZbzhuS1RML29ydUN1MURZL3dINlM4NlpoQnhOa2JLNG0r?=
 =?utf-8?B?TVdQWWlnUGRLT1NpVTNDWXl2MzhjbjZhWTVaQ3c1NWVoSHJBQWlxc2p1b3Nw?=
 =?utf-8?B?SnBvTCt0c05id3lIQmFiU1RxV1Jhck8xdDBQblVzVmJUSFBlTnJkdE9ZSWNl?=
 =?utf-8?B?NFdYWEt3cU9HMmdzN1JHdldGQVA4MWI3eisveVpCMUFvNkRtc0F1eFEwWE5w?=
 =?utf-8?B?aWVIMEd2MXVBQWZQMWU0VHlmYkdHVjhSUkd1L1hTUjVlSmlJa3k1RzlzMEov?=
 =?utf-8?B?YzQwYUtJSXlqTlpSSjdjdmdNZk56UmJSSlFCaFRWUW9WZGpnYmJXYVVQT0J3?=
 =?utf-8?B?bTZ0MGNpUm54c0xmSTExei9mNk1MZEhRTGwxaHRoOWMwaFpPc1hWVTVNYlVG?=
 =?utf-8?B?M2Ewd3lYdnZaMW1qUHFjNG5BQnlPL0pZQ1AxNzMyMEl4aEZwbmh3V3h6Nm5S?=
 =?utf-8?B?V09LMFk0MUFpTitDVTJDVVk5U1RqaTlicGdzZ1NYUHJQQk1ENmJsSjJobWM5?=
 =?utf-8?B?NUQ0K1liQnBEbFRWMEtlRjBWZExiaHkzOHZoUHRtbEp1ZGw1OEJGSEFFTjNT?=
 =?utf-8?B?N21kMjlpUUY4cVFrUHBOUlczZjA3OE1oRHhZYnZRYUV5aWg1eGFEeE1FUHV0?=
 =?utf-8?B?OTd6djI5TXB4dnhJTXlRZFk2QnNLUUJTLzFxZlVXVnRMVXZOWDFCWXJFVmRR?=
 =?utf-8?B?Rkg4Yk5HU2JxdndFVGlrcWVoUmRFNXp5NStPRGtRbE9jT2dMeXI4dW5PR3Yr?=
 =?utf-8?B?MFZVL0h0OHlKOHlkVFJmMDJoUXRTaVFCREdROGlpQXB6TG14SVhnSUcwVjJF?=
 =?utf-8?B?ZTBZZ29pMEU1MVVrbjJiQU1mb0xWUEZORjdFTGlReDRvOFVmZTBPUWpQUjc4?=
 =?utf-8?B?UDd2d2l5ZkQ5Mk80SDlwRXhUWDNNVmxicnJuRThySjdUaDl1S0pxR2JGTlE5?=
 =?utf-8?B?V2lwRFZBT1RzcUp0NGtOamNYa3ljS3diSzcrcGdMdEhwMTZsRUtRdDhjU01G?=
 =?utf-8?B?aFhQN3VsalpZbXFSSW1TZjlkMEx0UStlVjdRVE5STCtzTzA2TzNoV0lBaVFQ?=
 =?utf-8?B?Q0tyRlIrWkwrc1VyZnFqNVFpbkxUNDZIdGR0emJsa3NpeHJ5eERqUEY2SDJq?=
 =?utf-8?B?ZEZiR2pSQUNRMDNxK25KRjRpQXN2STFqOU9VWVhkQUxxVmZPWEc2Z0EwczY1?=
 =?utf-8?B?ZU5XYlkzbHBEc21TTVNmZlJQaVprNmt5YWlNdHV4N2l1a3p5NHFFWXAzQjVh?=
 =?utf-8?B?Q2R0Qm1aTW9ySGJDditQcnZUZE5lemwvWkNPY1E0NStKKzE2UlhNQURIRnBI?=
 =?utf-8?B?eVZENUlHeWJJTUw4eWZ5MTZURG42NHJQZitEcEVFMzEvUFJSYTUrMVZ5eUI2?=
 =?utf-8?B?c2Nld3NZRVoyTGVhbnBGa3A0Y1FwQ21odkxFSHdQQUtVdS92NGxSVjFxb08v?=
 =?utf-8?B?RlZub05FRzY5UzBreVZHN2pUeXpFenJlZjlEOUZ2eEF0MlZEUEpMazczZUZN?=
 =?utf-8?B?SjdVTFpybkMxZW9MZXRIMVdQVm5PcWhFeVB2MklzUWpVQzNLTWRDajJZTFFC?=
 =?utf-8?B?VWJxYjJja1N3cldyNHlLZkd2TTdmMHR4SVJrS1RaL3d4SVBDUDBucXJrRTAr?=
 =?utf-8?B?WXdRRXNWZlhSRW9wd1JHN0hlcHFOTVFadGZoYWpPQTVycExlTjRwN0VqdDdy?=
 =?utf-8?B?OG1PVnBjTldWd3hMeVBZYkZFVEdtUUJ3OWxZZ2tKNWlpT0NqUTZOdHBrajlX?=
 =?utf-8?B?eGZVMW5QVks4SU5KVm5hVGpBcWNzOGVPVlZWREN2dkdDL2lmUmNLblBNMjZ0?=
 =?utf-8?B?dktUUWtoQldvbFRrZ21jRzhHRjNzL0xIeXV2TEE0Nklzb0xsdTlGU2wzUzRh?=
 =?utf-8?B?NGt6NXAxWVlzZEp2MzR5SEtLdFloRk1rOWtxb2pRMVdLS0ZjeEFCZUxZekNU?=
 =?utf-8?B?LzRkTVNqMTdzUWRVazFxWVZYMm1FWEFaTzNLTkhFVWlrOUNIdFBoOUplOGVL?=
 =?utf-8?B?R3dQYTNzSjJsWXRZaUFnZFJtckRPamVIZytHbEs4TnZ6L2d1WlRlVmQyZkhK?=
 =?utf-8?B?NzEwaHlwNWhWeW0rOEJFQk9tNHlxRDJQS2xEYUxiS3kyNzZZRGcyMDk4Q2Zn?=
 =?utf-8?B?TXU4ZCtWTklxZlQ3S1BnVHZvWEoyVkNhTy9zUkswdGFKNmFnZFI5V1h0RHdv?=
 =?utf-8?B?MWs1SUt0ck5ILzJ0UXVpdEszN3JqcDF4cmxlcVMvSWZjbTVKT0lJQmRaUDY3?=
 =?utf-8?B?V3ZhVnc3OGphSzZRYkc0ZWRFNVJKS3RBSXJiN3dibGxCTlM4b2dMSGRWWHpx?=
 =?utf-8?B?enJ1M05oakk2anM1VTNXNGoxN1lXWDVPS1BsQjZCQkdpWUUxWmFYdz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	l6DpljtyxtVY66NLiMpv3JMEa0tugC9bw2nMVPRQFtg3pUrarxjPqMrJ8rUN/4i3OnFQoNlw9Uwij7iehdoYnl602ubVl0c4o+6oQO1P8AXQSpsNLcA7rIQsBt6ZUKsfmlwQqE28rcSLkTdTK26yvfa5VH2Jgl0Lg028l8XwvqISvtAUW2MlZQDoQcitO+pTllJhoL+orrHfUuy1OMfwSxfxjmkq4D9l4U3WCl3t8E5Ch6SykYdK9Vz84AMURbXXnVlCt59+kh+MuOk2U2nGWWv7GO5wqKc4BRBBPuokwd7wC+QxUgK86rsRmhVNdoSOpOymEFS2l2v0pbfWDmAZDCbiNvqZOdO/1hxkqvo/IePXTOmsyuiVgdBTLQ7Zc1m2JvUJpUJlNJDAxkVM+schw2tFv00CYfUkppGE9g0FKJ7WBMQd4PiTPAwo7lvXv61iZ68Nkb762iU6RBVFsxo0IjS0cHIrYLUuVXsTDCdUGg4U7poIUZMqlQZ3R7CHxzonzegmY5KezPtkLPzWmXDqv95uyr4kMHnZwpJN08mvq2192UP+qvnXAqZXtb0Tzbmcy4TaIJ/fEgmeun9LQJllU4Y5n9jfMYfgi2GAJ4dnNvE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cbd22cf-4f1c-41c2-fa4b-08de4deafe78
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 12:48:02.2489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sWbWlNPvlTgBadOeOxDEFRpQXuaCTYObyJcA02ZQi0KtNrnGOF7w9iNDuXeM5kyweoKNZGqHGF7F6TzffuDFog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6158
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=1 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=1 suspectscore=0 mlxscore=1 mlxlogscore=224 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601070098
X-Proofpoint-ORIG-GUID: n0HKPK1cls4aC1X6WJND5DKgw2zE1Psj
X-Proofpoint-GUID: n0HKPK1cls4aC1X6WJND5DKgw2zE1Psj
X-Authority-Analysis: v=2.4 cv=bp1BxUai c=1 sm=1 tr=0 ts=695e561b b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=K-rft_nv_CB67_YghQoA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12110
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5NiBTYWx0ZWRfXx6u1V/yGRqww
 Pg2uFYTX+ChNc2ugK+FSHzsAQmemayrreyouDav9hQo+MR1sLz6g1A5dkwBB2slCetUeRBmu5Rn
 CNfq72TUd4rtYdsuS8jvvVooyoL+8BK24OOO70tUGEEDL8N7QNSakK9cJm8gdrf45BeLfy2mouh
 08Ftzpn4/fh0zWUUJs8qWeLEVJX9PdXR5AryHnuE0h2T2A8epfNYO3eJXrdkTWPYk3ea4/5bO2T
 lMEP6XZ/N1ZSurzNKxMSZs5cFR93WsxtDa79FSph+MVLjf/pEAaS2VzErUrQ6DLWkwLoZ9GqKCf
 /ZgR2BLPLRs0kkhn04PCeIVLeT+CFpwWoRAcqFmGbvXbU8Tmr0rJKpGRfzPu8H+vv8qpIMCrosQ
 YbpkTFa01JpV559zVICWew4kT4w3piXrv4WWa8Gn7zv8wObt+xRDhqT9GJZXY+TD4d9WB2AG80S
 nq3EZhFF9Nt+iM3MAhn+mSSkwwLJ95+BN1O0OhlE=

On 05/01/2026 12:27, Alan Maguire wrote:
> This series adds wildcard support to stapsdt probes to allow
> tracing system-wide; this has caveats due to the way the kernel
> implements probe addition.  In essence, probes are added on a
> per-inode basis (actually in the VMA associated with the inode)
> so it is necessary to identify the file where probes are found.
> Probes will fire for existing and new processes (the RFC incorrectly
> said they will not work for existing binaries; they in fact do).
> 
> Patch 1 describes the approach; to facilitate systemwide tracing
> we need to tell DTrace the name of the binary/library via the
> module field in the probe specifier; we then use [LD_LIBRARY_]PATH
> to resolve the full path.  ELF reading of the file and insertion
> of probes then proceeds in a similar manner to per-pid tracing.
> Full path specification in module name is not supported since
> DTrace does not allow a '/' in a module name.
>

I won't spam the list with another series yet, but it turns out
allowing '/' in probemod names - and thus supporting absolute paths - 
is straightforward enough. I think there is also value in having path 
expansion as it leads to more portable scripts that do not depend on 
the precise (often distro-specific) location of a library, but it is 
good to support both approaches I think.

One nice feature is we can get info about stapsdt probes in an object
using 'dtrace -lm':

$ dtrace -lm python*:/usr/lib64/libpython3.6m.so
   ID   PROVIDER            MODULE                          FUNCTION NAME
 6730    python* /usr/lib64/libpython3.6m.so                                   line
 6728    python* /usr/lib64/libpython3.6m.so                                   function-entry
 6726    python* /usr/lib64/libpython3.6m.so                                   function-return
 6724    python* /usr/lib64/libpython3.6m.so                                   gc-start
 6722    python* /usr/lib64/libpython3.6m.so                                   gc-done

