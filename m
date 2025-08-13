Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DF82AE90
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 20:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755116194; cv=fail; b=YUXUGtLuhQ40rTbDDE0Hcs7IDzlLhn5MfmZCQV+0QnaYXlumxqMRddl4dBGhxoiYZH41cyUJGZBQ4aH3jfkX9ykDGsR5/viJ+j7pctLJg5UlmKB4nRYTKG6ICp3exffZSU1QUni93L+/vk9akExFJlyuyI9JGREEomMIArJQGO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755116194; c=relaxed/simple;
	bh=43skkwWNaYsVdobJyYIX93q0NybR7AhpgdkMVZ1Lcow=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OauvrS2HSWQChhnaFwOQBXWGhbZ4QzRydTz4J7durEnhyEUE5jJV8tv6zBhePoqkvNU2jlK8T8vdnasfFH4j7MREo4Lv96PciqfIrcc1CVT1I0uSHNyTYaKus4y83zfRVtJBr7AzeA/mZrM+s/aZMqe0ePDTa7F5vpmCqdu5FOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AHn4Ka2j; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=O9o4Zdm4; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AHn4Ka2j";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="O9o4Zdm4"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DIN1bv023250
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 20:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=td/IqkW3aNvoemf1Gj0gfo0OH+jOxMT+FTdTWT53FWw=; b=
	AHn4Ka2jthBRPsX85uka5IGDo6uoiotVd1bRF42g6pd2GlHiY/ThYvjlk26jCDIg
	ajLrqwzdR8CzX9resTE2bM/+JYsgmybTCWZHcoAGf2MJhPA01wAVTpOOUozI+WJ0
	smHbwYe9QaOq/0qEIn/IvS12+VKzDDPGdQxJS7zrAtjKTbYIqbEbpEcHPIFvCNmo
	ZjY+wOa6QQ2JZn/Q5zAZJ7Lk+WPv8gb3UopSjC1Y+mV6CNDjK4I50P8XfkY/al5v
	TtbAV3oGrCcODDl+9e4klKBBVMjVpy4BgMybwETaiOzkiSXi3L6V9m6ZjD9bipIW
	HmBFwtrmMKodI0lgjILYtQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dw450eam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 20:16:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57DJ9p1B030063
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 20:16:28 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsbvdak-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 20:16:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LgoSqBRRqtopixYji0BNstrl2n1hHhl844jpWebn9TAAf72HcPrbrBX/l2qEAzJw6Ac2h5NncRYuSXs9E9VAfpbSVlhDZ2gG5YgAOhi20Q5h5lXoLhKiTJZkjluTbDT2vLqY17HW8McGmmQ7Zo9oorEMQcOsCxPxhSZeFunf9t8itQnd/QzbCjNtDzUACO480T8cJRjkW9e1CIOi7oyEh2N+4JwbqzgZZ5vN9DpAzj1mYhMQ0e0g5JVNroJOCDNHhCrgQ1VZKMRjAMa2dlV51zWzX/rIjvRcMDX7oShZXrtUmH7dSaHEggWA/GfK0y/DwDvPikfTliQtNqbN+s7pSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=td/IqkW3aNvoemf1Gj0gfo0OH+jOxMT+FTdTWT53FWw=;
 b=O+QWVnjFNglFwK9rpRvMmhYkd4uN9y9et+n4pDZ0wLVciemuPCCf+BN42ryIV6D+RYi9+KDcTkpC+E+F+o4ZSJ1UhD5RAsBeWAQI4MgHPTIh3HawTsZkWQhD860QVY4NvdhyoKXQMRVwUHu/t4suxjVmMYSsz2Y2EN309Xc+Xb5hr2acVuKMiECfu65zSxFAVAo0e6AiIJwMor1E9oOHFqq/XVO6Yz/g12gT+Sd7GB9uHzG1KeEgwrwDz5VgDeFO/mkVPrVojzx20Ua40q7CNnnfKBZuhmnr52YHZxbIHXakbWBI3vZOZ1WmaAaKZMSZin1lPJPIqAw8n++OY2NMYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=td/IqkW3aNvoemf1Gj0gfo0OH+jOxMT+FTdTWT53FWw=;
 b=O9o4Zdm4Jy1ShxKtGxUl/feXQfUnizAy/SQoGiwheLSLemeurLnmbylxfw0foRC3X2lxhpT4LJo4dlrvaWPKKJottQKKkPlxcn8fEciek/g8I5NWEZeY2/M7ddo7PfNKLhLXYxXDhoT6WH+w7jCeANkf00aKSKzW9mnd7D9afcY=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by LV8PR10MB7967.namprd10.prod.outlook.com (2603:10b6:408:206::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Wed, 13 Aug
 2025 20:16:23 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 20:16:23 +0000
Message-ID: <c520166e-1d46-62dd-7dbf-4f67040c868b@oracle.com>
Date: Wed, 13 Aug 2025 16:16:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 3/5] test: fix expected output for
 tst.struct-1-byte.d
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB56725E4CF606CC1484550FC4C22AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB56725E4CF606CC1484550FC4C22AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:408:e6::35) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|LV8PR10MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cd013ee-4542-4499-bfee-08dddaa645f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGxvN0luOWUvRGluNzM5Z2FmY1o0elNvN2Y4RStKNTBLMjh6ZU1uc1lEMEov?=
 =?utf-8?B?R3BNdDNhTFBxM0YxeURtb2RIOGpYVlNxV1QxY0FrKzcwQmdjc0VjaHRvbjYx?=
 =?utf-8?B?T2NDZDhEbFg1WjhJY2llUGlLaHczWmhFZFNoOXl6R0w2ZkJOWHhnYnFyNXVI?=
 =?utf-8?B?Z0FPRUxEc0pyMlFRcnVWNUNFYm5DdmhXejZKdXd0WWZTUktOTDNkR1BBZWtz?=
 =?utf-8?B?QXMyMDkrWDI4VTYxUVY3Ti9XdkR2REhFeGExYS8wbnp4U0ltaUh4Rmg4TVZj?=
 =?utf-8?B?WnpZL3F3TjRPeVc3K29JTlV3MjNUem14SjBKMEFGYUN1c0ZmVWM3WHVuNWp3?=
 =?utf-8?B?bE9Lbyt4bE9FZjBOTzdEQ05mUy9EVEFwTGs3V0NtRGZ0M3ZkemQxQTZudjRW?=
 =?utf-8?B?aVR0d2dESTRNTmJORTAzSDQ0L2JXZElMMGNsQ0J5K28xekVzWDJpdVkxb2d4?=
 =?utf-8?B?ZGxpWnd2Z21QaEJYZ1VGVzQyMVRyZzFKTkNaSjFkbGhSTkI0ZTl5VzQ3a1Rp?=
 =?utf-8?B?ZkNUNU1Id0tOdy9KNXcyaWdUU0hDVXhwN1pSQTNScEFlTUlPazBGN2UvbXpn?=
 =?utf-8?B?RzRCdi9OcXluNkFJNmlwanVOUzZJNGR4MktpdUVuRmJpM1lVR2hFQ2d1dXI4?=
 =?utf-8?B?SkszbUhpNzVtVkphVk1uaUhtUk4zV3NCOUQwTTcrZytiS3FuTngxYWxBMWJQ?=
 =?utf-8?B?OE9SNVVvOVc1ZXRWclZFWmFuVm1adFVDRU5vRXNUeGJaczdYWDJhN0s0bWIz?=
 =?utf-8?B?SVljMDlxMWd2M29kdVkzSm5yVHZCVHQ0akoyeEVJYTJoSUphekIzVlBta082?=
 =?utf-8?B?Z1Q4TXhScnA4Y1hTc2VEMUg4ZEtnUWxrWExDVjBRK2xxQVorUkIzaGNxUFdh?=
 =?utf-8?B?cGZHK21SMFJCeHBZUXVWSmhBVW01NXRvL2NMOUh0bloyNHphYXhuNjdjYVB5?=
 =?utf-8?B?OUZDOXlwUTNwajFHbHVVRVlLMzY5Tml0cTR6M0Y2bG5XRllPMHd5RFFmT2J6?=
 =?utf-8?B?ZzJUNVpzNE4xdG9VS1ZMbm1jMmJreFl6OXFHZUZQaEtORjYwbHQ2c3VIamkw?=
 =?utf-8?B?TGI3cGwvZFl1eGlsV3BNQXI0WkVXR2x2ekM1dERUZWRIYmFJd2VBY1MyeEhj?=
 =?utf-8?B?SE1hSURaeEtFdjZXZHQveGFCYWRvbTQyMEplekhjSDFBWjU0dGNSenoyaGpL?=
 =?utf-8?B?NzVLN0czUXAzSUk4YWg3TUtlWG9iTjh4WHlzOERlTW1hR3YyaTc5U2hNMzJD?=
 =?utf-8?B?OXFmNkhybmtBRGpSYndKTTFFUmdCbWxjL3duNjJVQlBOc3grQzJHeG5GTExp?=
 =?utf-8?B?T0xoa2U5R3BpS0VkUzRVdVNUMEZVSmxvN0sva3RKVlJBM0FRSExRZU5KU1Ax?=
 =?utf-8?B?Z3o1enp0M0s4c0VJeVRvam0rbkRDMitLNy90R1B1WURsRXFFL2JyaGh1NkFL?=
 =?utf-8?B?UXVUOHYxOWtqdlVMQjZ2VFRoV21KWHAzSCt6UE40NmRUNmlycmkrYSt3U24w?=
 =?utf-8?B?OTg1Y1RPVmxic1dtdDZ1RHY1OVRBbVlNSVQzNmdSMDlPNUEvRzBQRzZ3M1dx?=
 =?utf-8?B?MFhqT3ROOEZwY0dYK0p1STRKZmMzeUtwQVdlN29KRmVwVUw2Y1JHMStLNEVF?=
 =?utf-8?B?Sy9ZNUJHaXZJR1dYOUQrRiswK1Y4WWNLeVFzbTVIaG4yaStoRmJYZGdFRFZm?=
 =?utf-8?B?R3p5ZEYvejI0MnVnYVFhbDZ4aFdZQ3dWUVVrQm9ndzdpZWs2dEFMVmt1OWlp?=
 =?utf-8?B?cGdOTGhIMVJPdi9CTjBUK2Z3Z0ZVTnFKN21hWGlHSlhKNGZhc2RwOHNteVpj?=
 =?utf-8?B?MDJWWVpLSDQzVnZ1dlAvbm9pYXBCczRWUjNDczlNK2tmaUdoRkZUMk5WalFF?=
 =?utf-8?B?SU8xUkNmR2tiUm5rWlV2KzVqbDlLY1pPZ0daK2tyNEw5dWFLRWFEL1J6VFRE?=
 =?utf-8?Q?W6GyEHbk14k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0g4NDZJWnBMNGkveDF2SmpsR2ZBbXB1cm1tdVFzVTN4RHRNbnB4SmRVeXZ4?=
 =?utf-8?B?cTVPcGtzc2dUVEFCZjM4dW1PR1VGM095RllENThDamNheHJabERqNUZuMjlU?=
 =?utf-8?B?ZnJmeFdHS0FaQXAzR0pJZUVDRGx4d1Ria3ZVbnNrbGFkZFhnMU9zM1VQdXln?=
 =?utf-8?B?dWk5WVdWM3NzRGdaODJKYlZ2eGM2WUswWnpodlBiMXRCUmJLSDlNekE1Q0dt?=
 =?utf-8?B?cXoxNTY5SUNXTG9XQTVsM2NFdUhVYkNYQ1BYbDhXNk1MWlZVL01nRG1hN3h0?=
 =?utf-8?B?YmRWUUdXYkxZZEQrVHo4bTFEV0FEUHpvUWdDVjlhZUlOWGlqcW4rcHMrMGFS?=
 =?utf-8?B?eWZOVmhHOHo0THBvZUJCT2psU2pDSHFmWnVoZmZVdUlLYVRSWmYveGNpWHpO?=
 =?utf-8?B?UFQxN1hleVpLNnhMVWNqYjROaFdvMEhuaStEQXI2Q3dkTzd1N1pwV1VucHBh?=
 =?utf-8?B?MEljTzBDZ2ZaU2dPdUc3amN5N09reVBUcVMwNkQydGxaNDkyMDhoeFBMaXF1?=
 =?utf-8?B?K29aNzVwcWVPeGd0cm5LQzZDUFlLaUFOakJZVCs2TTNiWk5HWnBadm5od1A2?=
 =?utf-8?B?R1ZEY3NBeWphK1NTS25RZWY0WkVBaTk0Y0RYTWNYRFpyVXg3WEJrdzlUSkZa?=
 =?utf-8?B?OThvdzVaaDVCMFU0YU43U2N5T05JNzZXaDhmblZTRG42RVdVL3JZZGFGc2VM?=
 =?utf-8?B?ZnM0aENRc2xqOExpK3dSQVhBdDlDbFNIZXV3c0VXanRaSGpOT1NEZkUyaS9s?=
 =?utf-8?B?RHhRekp0YmpTVS83S3VORjg1eUNMNmtrYTRETm9YZXAxbkR5a04wU2M1cUIv?=
 =?utf-8?B?TTNWSysxb0ZkcWdvZWlKc3F3UEEyc29WUU9jT2d6OUtKcGJIZVBsajRSMGsr?=
 =?utf-8?B?bmNVUEZaSmdoaEFUTS9UQlA4Si9yaXdkcG1Hb3pMLytYWEVCaEVzUy83THNL?=
 =?utf-8?B?aHZydnNOMzNIaXZ3VzMzdjdwZ3lRMTNNRWduZlRNOGRHSjdFcURqbmRLUk40?=
 =?utf-8?B?YTlodFZhNU0rNWhtVVIzSHJMQVU1a01OZkNyQXYzZUp0NkVVUnFxazN2SUl6?=
 =?utf-8?B?eVdOWnNWbXZMQ2FWT0VpOEZ3NEZOaXErS3RFaHhLZDJ2L0JqaUNnTEV1WFB2?=
 =?utf-8?B?V0xXYVRlaGs5TGwvUFJEZHBHc3d1b2FSQXNtUGVzb3NOWnR3ODhHTUI5V05u?=
 =?utf-8?B?RkZXcGJwNDZSRWQzTTdNd1owMDBUVjJWR01hN29GSUI3VWJoN0g3eG1LVXdV?=
 =?utf-8?B?S1J3K1UxaCtZRVQ3VVZSSE1iODExcS9KVTR6elpZaVlCMzgxZkljUmE4dGxC?=
 =?utf-8?B?UkpGaVFNTmpvaE1GZTZ4NXRTd2VwTTdUdm1xQVFvMjR4MGxRaTlTclAxbzVP?=
 =?utf-8?B?UXZoM2FqNjFNNjdBMzRQSWhMajN3WjQ4Q05sd2x2VE5ueWZ5TFBWZmhRaEs3?=
 =?utf-8?B?a3pmdllDRFo2c3c3Ky9JcVRhRGdvbHZFVWZZQlNjMnZYQUp4WnFkWTRURVNr?=
 =?utf-8?B?SHJmWDVSc0xwNE9QeU1mSDhHVmN6UjFiVGIvZEFwRS93RTY1V090SEQxdHMz?=
 =?utf-8?B?SkhyblU5MWhvN2laSHFoYytnNDNHUUUzSlpJVlhxenNvayszSUlxTGZ1bTVO?=
 =?utf-8?B?ZGdDMW5MYXpZNHZoclVGREFYRDJ6RGVjV0xxdnhweUVUbWg2aSsxNXpNcEc1?=
 =?utf-8?B?SFRIMithL2tHRjM3SVBaUCtCRlovZ0JSMW9sNE1iMlp2Tm1hOFZSaVR0Q2s1?=
 =?utf-8?B?U0tZWEY0MmFUOUhWZkw2OUxLVk1sMHlqVkhGVWhxdmNRdnZyOUpET0dHQU1J?=
 =?utf-8?B?bFd1VFZkYm4xbW5QLzkxd1grZTRDZm0xSEJpVklqVzdIVE0wTlA3Qkp2RDBs?=
 =?utf-8?B?Y0dqazNFdlU1UlUzNlh3UlFtNE5UQmkydXVuY2YxU1hpci9HUjJJWUZCMlhm?=
 =?utf-8?B?NEZVTngyWnBKejBVajc0REZHZG1MTmd3WHFRWDBCVVVtM01CTEtiZHBBVnc1?=
 =?utf-8?B?dmxaK091OWRwN0tCdHJOZGtHSHd2aEhDdU8xQmRiOUJVL0dpbnIxbXA4VDNO?=
 =?utf-8?B?RGNSRFVHek5lLzdESUQvc2QxZHhhVmNWd3FLVzF0d2ZvdGJzazRBbXdGbVRE?=
 =?utf-8?Q?egJppQmQ2W0iD2nrGGOC0HxC5?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gAIUZAhK1WKTcJovQH0LwbjYRBQmckHfS/n4ClM7HYep8fxjhu0PhzhHccoDDSb6NHWopcuI6t1H+XYQpLEI1Jw4Sw3decmupF4hk6wIff9wOl1Y0DaYXnCSDj6obb0WqlPA7MnxD1U0gvNXjGq3Pv9nqWPlPwauaSz2IXo1LCH9EGJ9SF/jIwI0OL9/UyQI7rjmDAy6Oe4UTggE2bcft0pv9FiHrs7tzKfLuFXzULNi8cHy35hwXiaxHfyiUbPj+JqUYznSqSWikPHR7+FEOlgeRxmfECWuv5S+xDKKNV9Zc9db8sIu3H7cgNZqWuzTWIA/UuJJaOEXzx5NFt0GsB+AMBUi6NjT12272vHl+YD+S1GKfGXRORJw2aM4r+TVcWGnq5oBrKpjUvqELASN9cVx7FRZWbwaHikViraRhWbRXRI28hn1imFVAEZkkfrEvsnqCwFRo+w5CeNx/amDTRJsznV019Q2SZH2Kk/F965gk/gZrKAFBo7WIHdhOgRXRXSoyzMLYvcohKA1Oxoc1Bm75VIVea1DscoeVNcSdOp7Q7OXkMWk1VS8oZ4VtWvdOpoWKMW0BaatNBrJzXMKNIRvoDMLvG9KmWNIj5l1Lrs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd013ee-4542-4499-bfee-08dddaa645f4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 20:16:23.2109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5uv7jQGBgELm9080dmQZ+pASwq0sGcldmSovghQYsqfOpAEpfPcX892Xh9Ojihln2OdBa/1X8DVce6MW80X5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7967
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508130188
X-Proofpoint-ORIG-GUID: xcWXREhE839i1sek5NHn0RUKSavELTVo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDE4NyBTYWx0ZWRfX95gxbKe6aaH5
 rFdoPjajH9fJfL6thpM3alp+jDZfbhh80QuYFbiIMhpbcAYCgoxJOm5gBbSfxro1M1VfLJr6wfv
 qL5mBwltp7BClP63XJEtsoppJz7MlMqM+mmZhEk8260xVy26GBvrk4S7k0uOGTip9zosgxL4ZZs
 vi7GKdF9Am4V2mK7CIi+wbpXrAiPh8JHwmOsGSRyZRIlqa1pJvPooGqZYK1ZQzUtZeA8X4/QDmh
 W2WtvWIl3/vteORHRfnSXgDCQi5076vc0iuMmj2q66iwfumKeV/R38KKEX1WX4NhmsGxCNxUmTv
 zedIv36RXugNBQwOt1XEK/AoNQzNKeX1bm8qO5cdXxDzySUthFscRhSKl5NS4nB8Abr1xXbPiJO
 ejIfdNFda6Q6h0r8ERBY0TFJWCLBZfXaKujra4DWPiMOqS45pHmw5wjWkk96QAg7kpA1BQnl
X-Authority-Analysis: v=2.4 cv=X9FSKHTe c=1 sm=1 tr=0 ts=689cf29d cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=6aWiBSzJx0F71_WAswsA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: xcWXREhE839i1sek5NHn0RUKSavELTVo

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 8/13/25 11:57, Kris Van Hees via DTrace-devel wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   test/unittest/actions/trace/tst.struct-1-byte.r | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/test/unittest/actions/trace/tst.struct-1-byte.r b/test/unittest/actions/trace/tst.struct-1-byte.r
> index d620aafb3..e6b00074e 100644
> --- a/test/unittest/actions/trace/tst.struct-1-byte.r
> +++ b/test/unittest/actions/trace/tst.struct-1-byte.r
> @@ -1,8 +1,5 @@
>                      FUNCTION:NAME
> -                          :BEGIN
> -             0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f  0123456789abcdef
> -         0: 34                                               4
> -
> +                          :BEGIN   4
>   
>   -- @@stderr --
>   dtrace: script 'test/unittest/actions/trace/tst.struct-1-byte.d' matched 1 probe
