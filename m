Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F6C3BB22
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 04:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731646081; cv=fail; b=Qgb/K768n8UJF1vTuEZkVEN+MJRx3PCYxJfVNX6PCoARt6DHaewBdFq+ZIlQ9mRRFWLCAfu1qU8O+MVs4gRJlVaaAJ6VfFOKxPTdJjZh8X6qbSaXZQr1Bs2HGA9bsOVRUyshn8Kn5snl6GtMBFfRGFcm0m6ZYw+UMbIYXXlvNu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731646081; c=relaxed/simple;
	bh=SS80UGYBDNEAsxcXMbZi0q5Xl8oovoOvyt29kZvbJZ4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YfAQCKU+B/06ipex9VJdLxxECGvXwXuM3Eiz9eh12ZEOztTQKsf8qYGedD+27mxhcSLjCzdmby1B/kzNOqb//V7MdvgVeYI0i1a7zDrUZdp4Dd/K4dvlFPcx9aCOLLYGaqZEbmT5QtmHGhHh+rl4QxTGVlr0SL+L5sN1v9C/sus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aGn3xBMG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jz4Tcwu9; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aGn3xBMG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jz4Tcwu9"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AF4BhRY032271
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 04:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=5g9VyJq/VYybr6i/LS+Vk8swODu3R6D2kTGGx3WV4vQ=; b=
	aGn3xBMG7SjImgZZbYQEefHU/nSvV/RyN/z82I6JNLiNCQREYgiEDgCR0kBpshbO
	DWcETaezVm2dD/sblfYmk0olu5J7pBPL03lzfTZt1u5QBkFYPQMMgNRvrmTFWFoY
	PT+e0serKJjbOrp6puQdK4ygYFtZQ0Un5/EJ4jqkUOedmyXuAyH6PzeoxYG5hCli
	OGz9ZT+Rr8QGdBFruJAPIHhHKHn7swnBAjEMvZjUvqVPdxLOs9BWJApl1bk4IW0T
	zEt8GhLbsGVHtrbrzcWkdjn98P0dfoUlO6GZNWyTt5ERJAgxxtZz5BVO+qHGZJpS
	TKSDUFdVCivzW1qCkkbzNA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0n52ny4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 04:47:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AF4UuTR001146
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 04:47:57 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42sx6c3sre-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 04:47:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNM8F40ICYtDQCXvbNsfuR/UmyvT0FFROLrqwIqqfrTDDjL1/2Jh+nQlwkWsUUOFocPXnigefEbUURo0I4+AH1PBXZo0Teu5fJY+lnqb3jJqKqwHGYT+Woj4EfigqJSCQDGdLTtiEp7e8bIBO7sU4vxoJjfArua2Wxvo+NvZ0io82hAfOMrd+O75COC2MCtiwe9Tz9wf6Q3X1QJUP2Plrnwht3Zu61B2tT3qrQzqaZV1dZbkutg4/3zQMSTsJa1iTAKGVEHVerQjNNgO2R/CanSYizzuOREBCeo0Jf6RSbc0V+1bSz0lspK9Qhzi2Setvxbvz1HwDQhR5er8OZO7uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5g9VyJq/VYybr6i/LS+Vk8swODu3R6D2kTGGx3WV4vQ=;
 b=O0W9gWoHRGK0up9aLnAVYgJFHHEBJPVV4CxRBJwPxRg7MsNKW9WU3Qs0VigbDYphH2zkGuNiaCDXbtM8XVVVPEnp0xjaFeHrDrQtgG8lxcssBKhpaDvzCun7ChEuaJzOBG9yrlwACR59PWAiQUR9CvbZ1h6TLVBUZ4s3a1D7I/4i2iZzK4T6N3p7q7SIwaleQnPGZ+6da5pYJJa4W6zDDLQq6f/0rY4Dr4DLQrdmPNB35wzoICK1kIn0NBTx9vQsZYP2Gu3YI0s09CjAs03FxLDu2QdHr6quJUyWECziHb81UE420eyQFkmIvC5ScwquqMg5dZf/++JVoV9td0ngaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5g9VyJq/VYybr6i/LS+Vk8swODu3R6D2kTGGx3WV4vQ=;
 b=jz4Tcwu9bJ4wb5SBCUmaiEiiSGJ8Sqfqmqoc4bWseO2loC85BfTeg900nGifuOUUtZ3nlGCNG/+Qk/vPSnPcHJg2VqU8k1okvfiFf8bt2NzStQBYdeKwMJttkjYgEL5RUompQE4II+rON4QjmOcwI20LMueS8ikbbGF514J1MiQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO1PR10MB4674.namprd10.prod.outlook.com (2603:10b6:303:9c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.26; Fri, 15 Nov
 2024 04:47:52 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 04:47:52 +0000
Message-ID: <cac0ec2f-4586-191e-a295-ac660c54f62d@oracle.com>
Date: Thu, 14 Nov 2024 23:47:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/4] runtest: detect coredumps in more cases
Content-Language: en-US
To: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <20241114220108.95647-1-nick.alcock@oracle.com>
 <20241114220108.95647-2-nick.alcock@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20241114220108.95647-2-nick.alcock@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN8PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:408:70::31) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO1PR10MB4674:EE_
X-MS-Office365-Filtering-Correlation-Id: 64b3c049-1242-4eb3-e8d6-08dd0530a9b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TysvaExxWWZHSFcxcFNZa0IwaDZnVHYyTkhxV0lsbS9oT2RTZC80aEtxUk9K?=
 =?utf-8?B?c09BczJ2YXNpc2p3MklUYUFHSGYrVWpVVUpSa1JPQ1JZRVlieERMZ05Vb0Qw?=
 =?utf-8?B?b05RYVlPT1Z6dk0zWGdobXMvOVFiYzYxM3c5TGwvRjU0TW1ZMEd3MlpHZTYy?=
 =?utf-8?B?SU5rODEwVEFvLzViaFBqMEtpVlUxUW45dW8xQW5pK2NVYVZMVWlNT2Z0cnR4?=
 =?utf-8?B?Q3E5d1VGZDY0WmM5ZlBpNENNT2xvQW1BenhZUUpaRDJXcHVMTngxODFrbmps?=
 =?utf-8?B?dEJvMERkSjgxT3N4NVZPcG43aUtjaDZSSG5OcG1HUlB0OE5xN1NzaEMvOTJD?=
 =?utf-8?B?SXRSMW1nbFhYQUhTR1p0bjhKZk10Sk1OVlJtbU85T1RDWnExVER1TG53RUUr?=
 =?utf-8?B?M3A4WklsLzk3VisrU0tISkZFZmFsbHdrSURMemhtVFFvclp3OHFPTEF5dnFz?=
 =?utf-8?B?VGdOaXp2cG56TVBXcGxNakhqQkxxSW90VVU3Y1BzMVdqN3k4bFQ2YTA5WUFF?=
 =?utf-8?B?dmRkVkNERWkzR3AwS2h2RlZQWlg3QVVZWENWUWM1VytSdnErYjUvcWhJVmlV?=
 =?utf-8?B?a29FWFFOdDQ2Z252MEpieFl2cGxHaUxiNm13SklsNEhPcXFNTFZ6RGVsWkYv?=
 =?utf-8?B?eThCcXdKaGlZTXdKTzZsa3Z5ZUtJdEgxNk42dWJla1cyeTlQWndGdlIzOTVF?=
 =?utf-8?B?QWFDU29NWDdOL2NjNDhWQmROS1krN3ArWk1DSFd6WDQxOHpBMlZFbVV5dE5o?=
 =?utf-8?B?U2FDbXhqa1QydUQ1cHM2M1FKK2llQ2JGdWxxTll5Z2tDTGx5aUtoSnNDdU5v?=
 =?utf-8?B?S3BUREdhRkVZM3Y1NHgwVFdadXcvZE9tTzhVVEVJalIyYmp3UEZFTDdGQ2Jz?=
 =?utf-8?B?RVphMFF4VEdDZUdwZVc5L2hFU0Y1anNtZlI4Qm1sTWhjbGp4RDc2UTIxSG9n?=
 =?utf-8?B?RXd6UFk1cTR2SG1UaUFrenRLVHdPTklEUHdFVU9pUHMreU1ib2pkcnYvTUtn?=
 =?utf-8?B?UlJpTjRsblMrVkdpcHNHQnhFRjBaMUJsZFN6c2ZFS1VCc3d2SUE0VFpNS3Zx?=
 =?utf-8?B?Nm1yU0pnc2pPL25rajkxNjh4UUV2K0loNkN2SEMzTTNjcFBKMmxsaldTM3JI?=
 =?utf-8?B?bTBlTldXMUJFcFBQbDF3Y1hYVmtzYzQyRUlvekQ1T2VTdHM4bldwVkFmUkRo?=
 =?utf-8?B?TEFoc1U2T3UzdlJlUkRXZC9VbVhBOExtbnYrRHJ5aERlcjVNZldWdHREdXR4?=
 =?utf-8?B?VE1zeDd5d2drWkpSMUF5SitQc2ZablQ3L1NPdUI3VHVkdTErUVZmMjRlUm5L?=
 =?utf-8?B?d3N3cWg0d0lTRXZDM0tHZFZxZk9icWhSaFlaUGM4OVYrcU5icXhqY2Z1aFJp?=
 =?utf-8?B?TWNOM2dLZXYvQTltTUJJQ1NGaTMyaFBMOWZ1QzIraDdxaE15L3dzMnBPSlFr?=
 =?utf-8?B?czZOL0pnVk1sejg5VFc5QUJHelZGWWZ6dXBRQU0zNDIzeWNxTHhTQi9sdmxC?=
 =?utf-8?B?VjNVYTR6MWV5dlljcWtvN1ZEWWNJT3ErMXhQRi8zQWNCK1MrQVIwVGl2bVN0?=
 =?utf-8?B?VEZKTWJ0WHVDUmFQL1hQSk1vYWVvbStmdzZVeTUvVkV3MzFNemNueHlLcmtM?=
 =?utf-8?B?bkh5MGNKandndFJ5NituUDZmV09qZ1dPS25GL2lTWkJFQUgzdGJvRVcybTAz?=
 =?utf-8?B?L0VtQkIxNzVhdENwbUlYa3hBQXBOSVUrRDJRUUFSZXpYZWJwK1c4bmU5Z04x?=
 =?utf-8?Q?qHu6QyrS6V+0Cugqyh7mQxuRVw9OVMkWy4NW6q5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnBpSlJRNkNTUGdNbjdyL21OU25jMHhKOHdsNjlmV2doZkZhSEI1MzhxWVBn?=
 =?utf-8?B?R1BBYXJFcm5FWlp1WjJaczJJSllwUG0yc2JWejFYT0RnTVpWS0ZGNGNDcTRl?=
 =?utf-8?B?LzlJRVVLWDdCRTRJdi9LVzBzVmxxUWRZTGxndEFsR1RDSjlDNEc4bkhkaVlD?=
 =?utf-8?B?MkdhenBkQmc2T09GNCsvcncvZzFqTW5OZlhhMTBTTnh5T3lBdk0wU0NqSWp2?=
 =?utf-8?B?ZklMY1N2ajV0TjRISEJQenIxdzc3bW15STVSZHhhUHFTSllDWXJGV1krazNL?=
 =?utf-8?B?ZjNIeVBIT21yakZPc1BvQUtwb3dndFA1dnJmTUVnc3hYdUhRTHM1WExCY0JU?=
 =?utf-8?B?TlIxbCtKQXY2QS85MW9SWkExK2gyK3U3b05UZTc3ZFhDS0t0Slc3OXhDYzlM?=
 =?utf-8?B?cEVqRG0wT0xRRENmSHQ0QUhCaWkzUHZxQU9WUjU1MDRHZW9UN3RMMUt4RkxU?=
 =?utf-8?B?cWIwcFljRkY2VkFLVXRpMUpDbnRwVzlQWEZwWlRjYWg5UnpwblBwTHN0bDM2?=
 =?utf-8?B?WFk0WGZBb3FqNlpxTXQvY29nS1lRMS83N0V2cUZXWkhZQ050YXZncWZGYjVF?=
 =?utf-8?B?WnpYTXBsVkd4bXJQQXdCVDU4MGd5UnFvVFM5WkNRNGczWjdybEd2cWRNMS9G?=
 =?utf-8?B?ZjNxaXhRYkRwcDBVTGJFWU5NL014TGkvWmt5RlBRMWc3VUhlLzFRN09XYzY5?=
 =?utf-8?B?RmdzcGdvYU1CQUhEWGFRU2JTeFYvbEY2Y2lZK05pS0swenUvaFRFN0xoRjJy?=
 =?utf-8?B?ekdCNDRNNHNvRGpFa0dUQlNXSytteGRQbE9qcmJUdWhVQVRqTURzZjdKK1lr?=
 =?utf-8?B?a25WaVFPaVFKVXRqSlA3RXJBcXNoVVBZcmZyTW9ITzBRejF1Q2ZTbkVRNEpk?=
 =?utf-8?B?RFRQSXU2ODJxY3JRTGtndEhEdWMwZTVodDhHRktFWndwckM3NDJjKzZoNXNB?=
 =?utf-8?B?RENpdnlBNDE0d3kvYXFMVUFxQjh5NW1BcXJyaSsyTzJwK0NYL1VjME12b0Vh?=
 =?utf-8?B?Vi93MDdUQmMzQjE3R0ZrVXBKSnJ4dnJFNnF2ZVY5cTNwV0lkOVRGRkdJcEJv?=
 =?utf-8?B?VFRKcGF0TEFDYWFXaHlRcktEQWdJY3ZhbVJqS0MxNTdoOFFtWjRiWDBJc3Nz?=
 =?utf-8?B?UHpIQWtnSHJWSGdrTUZva3Q1NFdjY1YrSysrbW9lVWZmQnZZM2JKUFpYZldr?=
 =?utf-8?B?SE44VmpaYjJHSU1wa2tKRlorcFJkQlVPSndQTTRrdUUycG1vWHAxS2M4WjF4?=
 =?utf-8?B?VkMvTVhTOHE5Sko5QVpKR2VEb3JIUm9uTXpWRTB6ZWRWUk93Z1BHeGF2TVkv?=
 =?utf-8?B?WlNObkJscUxsVm94OFk5MzdXL3RENXBLOEgxZkYrU0JPWW0zRjIyczhuUFQ2?=
 =?utf-8?B?ZEpCYlFTVVBxcGFXalFJbjZ6amJBanVpSVVjWDc2QllJRVBwSVJHZnFsL1dU?=
 =?utf-8?B?dEw3MjdnbnRHcmc4MzJLK252MGpweUNCeXR5SWUzZlJXYmVaVlcvQXhSc09R?=
 =?utf-8?B?UFlXMkFINE1ycGNkbG0raVNyT1UwR0pLeVlLd2tjWnB1N3p2NU8xWGhWU2gr?=
 =?utf-8?B?SjlqdmZCYVVXWHJSSklvN0Q0Ti9HVnpYYjl1OUVWQldNK0RhV0UvTGJjZHh1?=
 =?utf-8?B?OC93TkMvWHEySGR2UG91MVp6K0M2aWhCK2VwN0lDRnF0VUhNbHFDTjhwemVW?=
 =?utf-8?B?VWRFemgxZzFzMzdvK1NFdkdmS0QxNmRwOUIzekpDTkpFQ3liWDJhYXJqV0JG?=
 =?utf-8?B?ZjlmNXk2NnlPZ3VKQXd1SVhMd2N2eFlOUXZHY3YzeUZYS1ZuL291a0JKc0ZO?=
 =?utf-8?B?SkJhZVNmZ0ZMWno1NDFzb05JMEhib3kyTG45bmpTV0wwWjFSS01nQmk4VGp1?=
 =?utf-8?B?VUROUnFIcDRTNlZnZWFDZTRUd3F2eVB5aWVvT3hSYVFuMnpjbVlWVmtRSndl?=
 =?utf-8?B?V3l0MkRkVjNvSGdmT1hsM3crbC94SjBXMVhJa1ZSZCtUUS9sRy83NjEvendz?=
 =?utf-8?B?bGJoNWVwQ21zejRyL2R3Z0dZZ1k4aG1ybXplRHJoWDRuNTIySHVIRWdmWHAz?=
 =?utf-8?B?bFhucis4c2w0TC9EVkI2emtGbU5ZRGdwOVhZVWplS25zQUZTM3NRUTFTL1R1?=
 =?utf-8?Q?6JhzaIgtrEA2ViC2dQbQb4ybL?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LqpBcnk7U0Ffq34OxOesECbSuSI3d6/4cmrj8ddm/F5cOg8PCC3dxX6N3xcXLDRA70W92CBPFycGGVGOgMl2IgDetWyc6AEZcSjcuyZ62wRTGAEmssfHrpWHLtJQ8HRKZSYzsBRii/RZ87RyE+3jdkk1L7YvAjnIQUPFmPBA27eXA/zLukBw6FVUWtxaWcAnxh/RjWW7BAzPmAFtFLUB2xzd2n4ZMyalVUJ+BcUH84zahC7t3LosWUiq6sGuL2Ga/C3RjdPumZoVvokKv7Qv3OqF11bPszyiu9tJuuu3UoWVqsJC9VdZmloEqBuUc9XhnaidmpEKCerjw2V4eg4ptsafeFu9NKBcwbqAl5iG1d49JQtl6T60E7VdTNwxstoJ++Mi4DNhYtYDvyIF3MBNxYhtKZijNNS1I6xf8W1IaeGBDKZsHFOlxz4GLr8jrKVjIwRMKc28Q6ESDaBA9JY8hTG5w8lJpXj55BMOBuv2AkTmFIlWJxewmkrsG0dBUkEAL5iTzvO5fi50ujZI/KohmtFbRFBDJbHc58Fv8qmIYK73WMhM86++cA2h6V9J+LheaWYWBdc5oxBCZgjVXlIyZtuTiwY9GDflHw0CniYmXSw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b3c049-1242-4eb3-e8d6-08dd0530a9b7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 04:47:52.2347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y6xqmIoBjrjLjrguOtCaDkMOm/G7y3o7tg+L9Pr9xnaQlkNMNLnArOnl/jDxfh+nkmBoUOUTiiGqs1QbKh0NWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4674
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_05,2024-11-14_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411150038
X-Proofpoint-ORIG-GUID: 7FD8vb4GyycX0clhsa_qqVECzsopQaJ-
X-Proofpoint-GUID: 7FD8vb4GyycX0clhsa_qqVECzsopQaJ-

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
though how about for the commit message (just guessing here) something like:

Exitcode 139 == 128 + SIGSEGV should be reported as a coredump,
even if we can't find a core file anywhere.

On 11/14/24 17:01, Nick Alcock wrote:
> Exitcode 139 == signal 11 == a coredump that should be reported as such,
> even if we can't find a core file anywhere.
>
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>   runtest.sh | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/runtest.sh b/runtest.sh
> index 46b532d7e161f..94634f80c2ebf 100755
> --- a/runtest.sh
> +++ b/runtest.sh
> @@ -1361,9 +1361,9 @@ for dt in $dtrace; do
>                   want_all_output=t
>               fi
>   
> -            if [[ -f core ]] || [[ "$(find $tmpdir -name core -print)" != "" ]]; then
> +            if [[ -f core ]] || [[ "$(find $tmpdir -name core -print)" != "" ]] || [[ $exitcode = 139 ]]; then
>                   # A coredump in the current directory or under the tmpdir.
> -                # Preserve it in the logdir.
> +                # Preserve it in the logdir, if possible.
>   
>                   mv core $logdir/$(echo $base | tr '/' '-').core 2>/dev/null || true
>                   find $tmpdir -name core -type f -print0 | xargs -0r -I'{}' mv --backup=numbered '{}' $logdir/$(echo $base | tr '/' '-').core
