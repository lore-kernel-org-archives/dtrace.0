Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B24F1DAC92
	for <dtrace@lists.linux.dev>; Tue,  1 Jul 2025 18:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751394214; cv=fail; b=pa4Qbqy0t5PeeJt+rCe2yVy4ri9p9XNquQk/BNH9x7aDqJV7+zNM+YG6xwIqXISQkday7wH9qM/S5LMVhbhDbK3TQZQTY7zVlMaKplWoSceXktcCswcIm9jitnmAM18USlKtYKDtQ24SNp5051yCCfBYwiL8QjdxHNQKLuG93Gs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751394214; c=relaxed/simple;
	bh=sKjDQY+e4c/QqbYVFvDFk0CPiSs7TR5Ho2/fq8jsbuY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kThZovR1QZbbN9l9rGB/PD5P6BCM0/Emrz4miqhm7PI46leXN6iagX55D3n40AdGp8aEKPofmD93aj8soPnUgwBKGumfBlPAJGJSGaiT8rixm8QD9dOKMQDFkHXCUfJkfjJQcwJu9duCVv6+bNKKi6w+kzT8l3iqYK0PBTYnqJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZELK/UyP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=z6AOSKuQ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZELK/UyP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="z6AOSKuQ"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561Gfin9000740
	for <dtrace@lists.linux.dev>; Tue, 1 Jul 2025 18:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=J8lkvrYMx+D058wgaeoKDDgJU9RdBTemKll6eEnpjx4=; b=
	ZELK/UyPnL9Y2iF1hDCUL2bZsC8KJpgbszhrEj5ZJuFc0TWPjbgABlTwATJ5OGsQ
	yEJ+vcxk2FuX+0Yp1Dsj5G8MCGvcZed7tRN4LaAS1nF65HB3hXcbHpunz91+gK6f
	4ChzDBL6a9M/V4kBIeMByLQaCFJQtZ05dw7it27PneqX7NsAhVnoU2yVnJU7uvsI
	ZiITpKN6ErkhCrGCioHEb6SImE77AM8VCMgyK3YlrQr8deM5D96G7es+SYJYNlEi
	FvPaofxlNPQkAjRdUPss4ROncloEvx05lABM6k5MwA67Caj8+U3a8AOozEUzPETB
	pTFx0uRCxpNNAsf6shOT7g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j7af5cvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Jul 2025 18:23:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 561I5CNr027442
	for <dtrace@lists.linux.dev>; Tue, 1 Jul 2025 18:23:31 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ua5k6h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Jul 2025 18:23:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GhDio31spqdlxu8p8IDvGDXvL6Or0xNf4KTzNuLvlDxBXXv3ydRUKDa0YjKn3iE+ru34UrPZnlAMWt1wuP9Hkqs5rKBnUPw3Eltlfup06e3KXwIv+7jMKGRBjxpg0K/0olDxKIGMij25a3tq8cQsvl4nGWe6skHERMMbprIHGZZ583bQyxP7RrwwhLc0aLhoGJeYT2/yvDsq7ZG7be97WJKvYWr67og/fp0ozv1hTgtaaTUWJoNfC6qt+/u5XdcDU49rcZHASy3rGRGZ6EBoyfi/ds+ewJhsup2KTetQLvMlP62aMfb81yveJzWeLbw8IyGqNcewtXiim4YEyucqFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8lkvrYMx+D058wgaeoKDDgJU9RdBTemKll6eEnpjx4=;
 b=IekXVSgNFfvHmdnpiWvnF/ck852VHDJvm/WHwPkrhUZBbS3aPTRAGxvZQVsQJZKSjXFsRSke7a2DJF/0jDf2lscPk0KrRkR856lEYpZf8Q4K31a0Lewjq9qulb+bZe1dRbSv7wivWQnyhtBHXgRJdmqiCarr7CG6tYDGro9pzkWq6pCWufWRJxT/+bMjboQyAWmfY+96SNJMwRH4bulf69s19hNjJbPIayNxTYBTdqRqp7BZGx/oh/OhWpm+vdq+7b3+q2V7OUHHp5HZaNE04IKttRXodRfqDbpY1M5BWcFSHzAWJsQDzgPjmEam/oOovW9A4ymkGttOuv5Lk1Opxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8lkvrYMx+D058wgaeoKDDgJU9RdBTemKll6eEnpjx4=;
 b=z6AOSKuQuByCjWDnXpDYybQtKQPKE7tuirmqxVo084RB2hBtW6SA5/8pksQ9z9Ifd8dhOMs3bxmM4YBgrQN1mWI1ugO+fjmqcyNpCdOB4YTDAG81AF0fRDXdtK/GBozXbtqyM2YllwWotOyB2yNse63GrFwHfWSEomFkNVZjSzE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB4646.namprd10.prod.outlook.com (2603:10b6:510:38::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Tue, 1 Jul
 2025 18:23:14 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8901.018; Tue, 1 Jul 2025
 18:23:14 +0000
Message-ID: <fe0900c1-a19b-e8b3-6767-0818bb4ce4cb@oracle.com>
Date: Tue, 1 Jul 2025 14:23:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/4] dtrace: move get_member() to dt_cg.c
Content-Language: en-US
To: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250610135813.15746-1-alan.maguire@oracle.com>
 <20250610135813.15746-2-alan.maguire@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20250610135813.15746-2-alan.maguire@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P222CA0028.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::11) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB4646:EE_
X-MS-Office365-Filtering-Correlation-Id: e566a673-315f-43d9-fa92-08ddb8cc57d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y2lNTnV1cXFWcVp0eVI0WjNwdWhNZUZmVkxUbUkyTWlnRjNRcjVmdndZSjBZ?=
 =?utf-8?B?b2N2V2pUTmZ0R0pjU2RuUnpsdnhPQTJFczk4dU1SMjMrdmovTGVtYjJnbHJt?=
 =?utf-8?B?LzJTUmlsUDVuZ2FTK001SjM1M1BxbUs2Y2FIdjhUNlVIM3ZDaGRaV095WmZv?=
 =?utf-8?B?Q0JxRFpUZFc3TFJNa0pqTTQ0MVlrRy8rWG1mS1ZMMWliWVp6Qkc4RG1JbDQw?=
 =?utf-8?B?MmFwQU96ZnZ4RHJ6dmdabE1oSTFYaUdnb0E2OEtrSWpnZkc2TnVzVjVKcEFw?=
 =?utf-8?B?bEs3SStUNm1MNGtCS2w1WWJDRXc0Q2RLSXpuVkpNWkoxZ3lUMVIraCtXTjBK?=
 =?utf-8?B?bm9KSThvM0ZZTytZQU9WNzgzdUZmbGJiMGhBMDdlazVmYURnYVlZbWM2TUR2?=
 =?utf-8?B?RndvM0NWaTQ0c0gyUldSNFhIYlpJdWJZVC85UXVnQ29qbzd0b0JGZ09YTnFK?=
 =?utf-8?B?THdoTkQ3dDR0MGpoL3dKNUMvbXByT0dMWFlGbnlPNDhPNWQzY0JFa0hmc3BD?=
 =?utf-8?B?NUxTclpXNmx4SVF5c1pDbGpvTG1WbUtuQkNJZFlRV3FSVTBNY244dE9UczVu?=
 =?utf-8?B?MVJYWlJrN2o5Tm5WYzFVaXkzT0hxSi95bDVVZTNmMjV2ZXlIV05BYXB5dXV3?=
 =?utf-8?B?bnVTUVY4ZEJ4dXlJd0xxVUVBTkJuWnRDZ2lRMzlmN1VsdVFERlRXUFRFOUEz?=
 =?utf-8?B?dGxia2JjWDByOXE0Z1NLa3J1Rk53MEVucks2Vkw3TGgvcm9PUW1xZGFFaTRa?=
 =?utf-8?B?MWd1NjdIcjNTWWZWYjBkOXpsMDN0YzV6cFlLeWVhck1IeE9jVERMNjdaaHNw?=
 =?utf-8?B?TW93UXIrUWcrMDhoa0QyNHRaaXZFRmxQR2xWb3JPZm1lTXRKa3NmeHYyQUhU?=
 =?utf-8?B?Q0xXTjdWM2RCRmJJTUFFa25xbVFTWUwxYzRrcElVMDlyckNLc1lXTnNBQmx3?=
 =?utf-8?B?TzIzL0kvelJsOGg5K2FjZWdHcGJ4bm5LZmVhcWlUMlZ6dXhlV1FxQlRoRHZw?=
 =?utf-8?B?bk0xNGx1TCs4Q2p4a1BZd2NzREdtMUJoVUdMWlMwZWNHRExTOWJra1FWblNo?=
 =?utf-8?B?Z1QwVWZmRHI4YWpMTHpVSEgvOCs3WlhhUFVESW43eWFQalRXUmlJanVrU1dC?=
 =?utf-8?B?bEFubWRaV1JaWUxUMkJwOUhBcXpuMVRudmVlMlZHSEhGMCtlbkJYeTgwblZ4?=
 =?utf-8?B?VEsrNStaVDk2TlgyMGNiWW9waTNQemd5cnNZT0RGWnYxYXNqYVd6aEtrekMv?=
 =?utf-8?B?c05DUDJvR0pzeHRCNU1STW14aTU4dmhoZ3VjRXdlU0x0SkNDNTVSL09QWHk1?=
 =?utf-8?B?Vm1VL0pGMFpKQnNzZHViaGlvb1czdDB3OEozOGVFUDYyWGZuZjY5bEZJUlIw?=
 =?utf-8?B?Z3RhWGFVTmpYQm1TUTF5NWZRNWZtZWJRMVpIT3VXZXdUQ250bEl2Z2lHejc4?=
 =?utf-8?B?ZkRvWVhZSXZmZTlpT00ydFhVZjdDOXg1K3VjRm05empQVStpTXkwekFSeFA4?=
 =?utf-8?B?NnlsL1c3eHhIQmJKSDJTTUZ6NlJ4NEw3MUxjQlBZVWc4M1hFeTZxTS9odWE1?=
 =?utf-8?B?SWViMU5sdnc4cXpsZEQrWDBmQ2lPbU8wWSttNXl1d3BleFFvUGdpSXQzNmc1?=
 =?utf-8?B?UmhPUU9KcSsyZzd3SWFlaGIxZXlacEFDcFBqbE9NZm5EalNXZ3NJU2F1R1ZD?=
 =?utf-8?B?RVdYOFVvaXQ5TkdCWWI1N2tYbnA3NHJDM09QQ1JZK2dZcXVoLzVNdTdpRnpX?=
 =?utf-8?B?Z0RuNlVOc1JEalFLT1hiQTI3UEllazB4ZUlPZm9XalJLaCt5cXVjR1drbUE3?=
 =?utf-8?B?S3gyU29mSG5XNVNZMzRDbFVOdUhsRlBtak9adXJuYkdBaGk1d1hNT2hQNmtN?=
 =?utf-8?B?aktJekFjeGdFVFFSU1JPR09IWFNhV0Y1bm9BUWdjMFo3Y0FReEpvTER4SUFE?=
 =?utf-8?Q?xhMnSSdv8LI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEFIYzdVU1VWSmE4MEJzQnNZYW9TTXJlMXdVQVE2OXB4aHZXR2NNd1pMZksx?=
 =?utf-8?B?aEVSL2MzZnNLZnZodkFKV1dLclh4SkhiVXFkbjhrZDlHbU9OSjY1MXlnaU1X?=
 =?utf-8?B?ZVp3cUYzTnVoQklGOXJYZmRnQ0o3eXRrclQvQ3F1VEdHSHVsQjFvWVRLT3d4?=
 =?utf-8?B?TWtqNkZXamNVSVBLODZFKzNRTUQ0MlBiZUVvd3U0SEpFSlQzSVUrZXpPd1oy?=
 =?utf-8?B?Y2Zma29RNktqbmVIaXJNUXU1aUtndGlaL3dLKzE2YlJYR0FJa3RRQ1FZSjB6?=
 =?utf-8?B?eHJrYXZkZFFlRnBFUVNvM0U0L2tQRVN0NGhiYjhCTEhvOEJ6MWRHYmpSSytL?=
 =?utf-8?B?dFRPY0hXRldUNTk1dlhvbHR4eU5lYkM0KzBkWmNkTzFma2VVVEhrQ1FheEFH?=
 =?utf-8?B?MnIyc0g4UVRVa2thRldtWWlGazdCVmFpT2NnYTdibE13ZGVpaUw2M2VTcTAr?=
 =?utf-8?B?V1I1NkJKL1dXcTJmN3hTbVpTZzZFQzdxV1l6YmVoZjZBemJFaklKdGtCVkI5?=
 =?utf-8?B?ZVFTSnZHZUlrZHMxeDNUN1RpU1RYL3oxa2dTbFYwYUV4L3NmZGtRaDlKVmMy?=
 =?utf-8?B?cWE0Mmo3R1FUa3FKS2xXWmlXZVdhRkZ0OURxY1JQWjZGMWJJd1RsWTRwSDI1?=
 =?utf-8?B?TGhJSDVTdlRDS3U5dHpCOVdCcFdOR2FmVER5QzFkNVRydkljSlpNM05MaGpx?=
 =?utf-8?B?OXhEQjJ0cDl4bGpoQXRkM28zMTRRU2FMdkhHVi9rQ3B3cHI3S0xHb0RqV1JX?=
 =?utf-8?B?bVBnWVljTkU2WElOeDZmbVdTdyt3ZENoV0QyR2s3WDdodytqLy8vQnJWaFFz?=
 =?utf-8?B?MmxpaHpTanVPOHB2TG5UclVoQlE4cTRMQk1nVnRnNnJNaTJFSXdUdk9DZ0hL?=
 =?utf-8?B?dWkzZGJkOEhGb0tFanJXbm5jMDRxM25DWFJmb0J3amZPdGpoZzFuY3hlcnEv?=
 =?utf-8?B?aklKMXdYeU1kNU83SVFYYmRrNEpvd1c2MWZubTF6bmxUdXhidndZYUFVL1Va?=
 =?utf-8?B?YUdFZmJoQUpSQnpCY0krK0JkR3FsTmhhSkhwZG41UWR0cGdnNi92elFGUXpC?=
 =?utf-8?B?WXpBcGE2MTROekpRSEw3amtkUDh0TTR4c0xTTGNOUUh2eUVHMHZEVG90RHoz?=
 =?utf-8?B?SGphczR6M01IUElXVzl1OXErNWtVcEpNd2I3amIzNzlmc0VEbkowTnVtUHNa?=
 =?utf-8?B?bTVlZC9HTWlhbmdHREVTOGVKcm9HOXlkQ2hITDBXMkhna0VGTTluVHlYN1lm?=
 =?utf-8?B?SENJRnhnNWRXNnNpR1FKWXA1NXM5UjFxRVh5MEl3RkkvK1dyQmpmdDY0eHRr?=
 =?utf-8?B?WitXTkd4K2ttZ0NzVUhubURYcW1xeUdKZG93SS93L0UrQkxZV0thcUxPckdo?=
 =?utf-8?B?aTY2U1RzNmZ3dDVjYzhSS21ZZE9mZmpTb0dPcWFEaks1alpXUXlzZmExYUNk?=
 =?utf-8?B?UGhoMElXSkR6NlZJY3d3NE9iMWZsQytsTFFSNndOR1lLTFZkNEp0TWpGRGtC?=
 =?utf-8?B?bis4bHFuRENMczErcWJ0aVExVVh4U3dQZGFjMVIrZFdhUUdDbndUNFI0OEx1?=
 =?utf-8?B?WFVMMUxOdi94dmF0ajNzL2lrcVRzUDd0SkJ5d1pPZVQ2SFZxRnpxbnFLcWZI?=
 =?utf-8?B?dU9wdzFQaWJ2M0Ivd3daQXRuanZ4M0hTNjBBUk11WmhKWlhUTE5TU243czVm?=
 =?utf-8?B?TjMvejFaR3Bpem8vWU81WHFMV2tORWREdUVxc09LbXlYSXl6ekVKYkRacUQw?=
 =?utf-8?B?bEtPV2FpdS9tNVVrYThHQmtOdERUOExrbzZDM21xdlNCSVFkWkhuU1o5MFBl?=
 =?utf-8?B?clJCektaNjJYUTVEbFFYVUlMNEdQQTBNb3RodkpyanVEQWF6dDNmd1NJVXVx?=
 =?utf-8?B?NmpSZVZUeExYaEFXRStFM3R6eklLL3VjdkJKMEx6cnMyMWFHTEFoYVp0bGJO?=
 =?utf-8?B?M3VxYzI4S0tLVVVsNVlEdjROMWx0Vlh6RGJFSkhkcVhmd0k2aXpGNmFjTU9p?=
 =?utf-8?B?SWd2UzMwdVZIbG9BVVlyMzNCVWZZcnBDOE9yUGs3ZERoVlBJZzhmY05tMGdn?=
 =?utf-8?B?US9wcklia2F4ZGtNSkhCSWx5MlFUa3VITjdXQlNGMFlUWnJIbzhoNFU4NDFs?=
 =?utf-8?Q?DQDyHq4OSJcSsdg5ijdxjtcbV?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7km+f07FuFSWiTntjr0hegv2eHbLcux2XTItceNUpRmkKqNKGq/iEtlgiJR2Do3EGShcXK+OvpFIxWSPPTaoF2+IzxnhMpkiSPahEO2erPQ7zQm2bpmKLzceFscHTrvbmbGb8kXIbVpUAcW9cSta8kER+atUzpUqw8uOWqe5/Na62KXSh6WmRsh7qP1WAdho2y3IR6MMnyToH2qWVcuwQNyJxIF6tOuZXLuyE28eZQ1H1E6GrwiHMe4mqjEO/9cysHtYI/XYSk8KbS7VkeCSw0xjjin/8TT52lw9M3v/IB0ruu7mgKTmb/gRa9Tb+v3FfsLm20df5nf+JUTMxXmqmSYQb6rQRofXCUPb8BiOnLEL+/LCT5Cyk1zVUeE6b8Iv/Wez1o/x7oB1+U9+E95YfqByE/kr2yjKYP32D0RYMBds0Tk2BVmejPcvEvNA8kgEizHEChxz25iMk+XVqZdGSVa5Zg46HF+o6pLFLLTsH6qNoQUNtIsTvsH2kgT+PdcQjCjjqBd4YCewSAM4cgwgnLgVoLdKx3Cr6aKyJL3AVzJoBitAJGfCH9bA/Falre8ja3/Owh2yhxDrJX1GPPh5nvSviNAB0SXyyFLc/GRdovM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e566a673-315f-43d9-fa92-08ddb8cc57d2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 18:23:14.5251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hAv8F+vjAATFAR51csHgtX8KvY7t/8IYeiKCzUz6cofuA5AZ0L96UiV1+TS9HIZPzXrENLHsw/795ubEcfviOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4646
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507010127
X-Proofpoint-ORIG-GUID: L3JQzunZ5WDuULVIETl2tEOhsnCEld6h
X-Proofpoint-GUID: L3JQzunZ5WDuULVIETl2tEOhsnCEld6h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEyNyBTYWx0ZWRfX4AJNr+bpQrB0 rdVtslDu7E4zRKA+76sbktsxkbo5NQ2SBZ/VxpzjwhohlTbqU6XviYVuPT+DrA6DOUAbdJ2vRvY budpf9qfhLlY8Jo3MXTaAjsXFPMOnjb4BK1ypo7CD2CAlzKguzmLafqP2430RHPFlKsYdUNCIqw
 PMMQ2GG64Y87jVHOOMHuv8o6qCLHN0gK5LRgaqNDFXmhHJV8hjOJLd3K0hfPyE5Rc9H3eZ276kg qxra4jync6LFQNdg0+MsFFOUAQBc0yVneQ5PGNc/f4Jh6Pk4hMjnbHsnmiwfwATb7f6JGGK8SeX jMoB/51/lbYiKhHMFUt5HpUFeo5OOWfO3eZ38BL92fyZHUHkchPneIGJnqwrW7dF30RTg8kdHz/
 CjnojSZi33E03PA9mhku7lBD8Uaaer0+t1LQZZ8bCJwy53LxgdjPMGKA/Egx2QUaKP+AoGe1
X-Authority-Analysis: v=2.4 cv=b5Cy4sGx c=1 sm=1 tr=0 ts=686427a4 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=TS2QL3v0J9hBmW1uGuYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

btw...

On 6/10/25 09:58, Alan Maguire wrote:
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> @@ -1901,6 +1901,45 @@ dt_cg_ctf_offsetof(const char *structname, const char *membername,
> +/*
> + * Retrieve the value of a member in a given struct.
> + *
> + * Entry:
> + *      reg = TYPE *ptr
> + *
> + * Return:
> + *      %r0 = ptr->member
> + * Clobbers:
> + *      %r1 .. %r5
> + */

The dominant (but admittedly not consistent) style of this file is to 
indent with a tab.  E.g., "^ *\treg = ...".  Clearly, we have not 
established a consistent style.
