Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9296B28852B
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766088457; cv=fail; b=mZyC2+NdpvvtHCXhvblHgUl1O2+0la7x1bcmmNOZ62nD7aEun6QVa9sAofWn7oEXXs2nEzvRAWPidVd8XePKv0C4sXxq/jo4AkZ/lG8/H0vwuoDjvfmaxE3kOSwf/3MFxKHoyLTzQzcfgfZjEkjUcb+BE2GNy6BiBhxFWgd8AQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766088457; c=relaxed/simple;
	bh=El6QhHRhUv3sVBKumccwqKL+e827XUPaHT0P1SrDNM4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fpOawtImgMHb9riU4pkH0WGG+PytAK2IhBWPRRyeW7sAkwGmBCeWrfFi9UhlYDyBBORavaRKHsCV2OTURng0UmhHOZiq6pNddWU2tPK2nwMnki1EbqrcCVjvabGJRv0S4RKDbknGySrfNfhy0s+2Om505FdD+qKQbnUou3Zlai4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VIBThyAJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gbdi+4RH; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VIBThyAJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gbdi+4RH"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIJkUrn1605317
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=WtQiQ0Ot8M+lym6SlKucXjopnzdghOdb9c96TlpXBVQ=; b=
	VIBThyAJvdczmdITPJTJc45FTzkXuL58g43e6OOp2atOpn0T8Ybq9EJ6jg6/cAEK
	oO546srr+rVxNvcnacBiPK/1bCWU7EMjvJ2mNMtmV7ue1xmceXMhN0k25eRmHBIG
	dSplopn31GI4bc4A0dtMdpLazNk9/bKDjccxqM+O90SJuEzvRjqYUcI2sI9HrTBK
	b2KBpRJGuX/EepzXd1sM2gVUTCjSQeS88geAc0bCAjrJRrSS9hs6eA53qCPvAob5
	XGtQuMoon9IB8BWs/O1+v9p0u47qwGB0Imaw5duIFK7GTra3/c8iM4RhZM87MzSu
	HU4l7tKxpH6fDVm2qCr5xQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b4r2cg174-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:07:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIJTImD014108
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:07:33 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012068.outbound.protection.outlook.com [52.101.53.68])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4b4qth1gbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:07:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FUPJmSrTUd1/m6YFWnZbiyxQnNr8vm5qri2aBMNA3OS/UVLMFAylR7Uussynl1G1OnLLUakfl1H1B7aVgnZ4/TT3goUwaOPVlup8Lvf6FX5AzRuad0IkPYlWFBg8lbqEBfN9ykuL38jgbrjv9xAMVh8xbnq3S24S+j7CJgJeNdQwj3rjZAe/ntPXpLuIjwZXCioR0yOmN0RHX7iQMO89HLlNreGLFYAjEI915bCJWw8r/4Lt9p1479tGSUND7rvWkChuLvf9hByqrEO5KrhUpAFyY4SU+qZ8sdTkvLmRjulBndyVMjM9681YhONcHH94nkjONvA1izFSrgY/iJjx0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtQiQ0Ot8M+lym6SlKucXjopnzdghOdb9c96TlpXBVQ=;
 b=lCxYVNSlRaawW0omdP/1C7ZX5aDtVQem/i9ySiTFIetuKv/cn9hT1AknGWqeHj9LBuTGHDmqpmo8YMYJ94kkWQQ6ZVaAtD3P6FmRlE+78IIkSUM7MW0uDtQ6H8OnbyuiPHfMapKoFKpqeu81Yqyc1hY/6bZt1L99DlhMEPEUNwHz0kXOMXlNpYO09pke4YgnUzIAKLzBFliItlD4omiz2FonB+B9pKXZzz0U1slIfsQwA4TH3VQ9xuEMLEBssbommyr/zEs5w5SMRwRUbENWyrZ6COGdZN37bU9+nCwp9Oz3xJzrUtN+gFRvRevQrcQ3loVmyv/yhayMTz7gWLreXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtQiQ0Ot8M+lym6SlKucXjopnzdghOdb9c96TlpXBVQ=;
 b=gbdi+4RHBfjVd/RuptAb+mJvdWqSZMzmmUi3InjItaqOqmaZzSe06IUhpX1KEsJfcOZR7kXj4d2hlPIP7z+aDaBBIR4az7XMqf8Na2pVINOkoHyllTn+lRDEQG5Xwwj7LrrAxv3OoQAmm0m1xqQn7stk8GhNOUnNt6hcbnedSBA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB4496.namprd10.prod.outlook.com (2603:10b6:a03:2d5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 20:07:31 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 20:07:30 +0000
Message-ID: <afcf46e3-ed97-8bd3-7bb1-8268df5660cf@oracle.com>
Date: Thu, 18 Dec 2025 15:07:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/4] test: correct file permissions
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB752274F3007546F6860EC932C2ABA@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB752274F3007546F6860EC932C2ABA@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR10CA0011.namprd10.prod.outlook.com
 (2603:10b6:510:23d::12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB4496:EE_
X-MS-Office365-Filtering-Correlation-Id: 74ad464a-6671-4bd5-372e-08de3e711333
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUlYb21mSVJON0VkRUZ4OC9KTW5HNXBXVEpRdGtPQ1puQTZTVjN6YUJnSXky?=
 =?utf-8?B?ZjJNQ2RxQTRlZVR5bUsxdmtYZVZ3d0Y3L3JDSGFTNjZyNFdoeXRna0M0N3FB?=
 =?utf-8?B?L1cycHlJU0Y4OUpiYitpMXJ5S0RZOHR0Vi9Id2wwZEl5SmR0a1QvZ05sWElr?=
 =?utf-8?B?a2ZxYW5sR0IwWVlkNk1VT2xXTkpDdjV5L0tQN3VZVHBUV2xXZzRId0J4MUNI?=
 =?utf-8?B?TU5LUG5tWm9Vc1RXZElCc1RMTkJiZFBTanFKcVJPaHhYRXhZUXB5YWFCZm44?=
 =?utf-8?B?dmp6cDY0YkZGLzdGSGMvZGduMXBLNUpFblVIQ1ZTYXRrSk0wemwwUTdsY2Uz?=
 =?utf-8?B?aHNrQVZCN21MTEFMWW9waUZFUVpHYi9EamlPY3I2b0tIYkNtZDBxa2graHVy?=
 =?utf-8?B?R1FOcFhWRjFmVU1wL01jQS9jai82MXRqdmJjQXBGaTcxbmVYcWlUbkR2OVh5?=
 =?utf-8?B?eEtiOUFDRm5Ra2FxREVVdjRVVkUxRE94RTZDK1FTSFpnR0VQYjRoRS9yWEor?=
 =?utf-8?B?aGU1bnBxRWJZV3E1TEJ5b2NLTXVNOXFRQktTT3VPcm1vWHExUzhKaVNTYWdm?=
 =?utf-8?B?WW01VEw5WVZXdG0rTzBIQzhraGgwL2lsSExkQVpoaEZTLzZqSENBSXdxcUVN?=
 =?utf-8?B?U2JPV0J5UEJTdFFHd3BTWENrWEpPZm0zU3F1TjMwOHN4K0ZTcEltYnVCbVJm?=
 =?utf-8?B?RW1NK3lMbEhkclBmdWI1emY1aUU5aVVtbGM4a0tvSkU3MUpRQ1QyMXZ4WnZX?=
 =?utf-8?B?VmFNUWVKcVRkclFnZG9OcWNtRFYzbDlnMmJIbjVDYi9tWjg5WGg0bU5xRkZK?=
 =?utf-8?B?eENkbUo5OVFTNk9DSkNqNzV5QkFMd1p2RXUrZSthVUE4MmY2L3pUTXVnbUZY?=
 =?utf-8?B?Q2lvU1RxSGhJSldQUmNJUjJHNXB4cVErcVZzV0hYSHlMUmpuUjJYb1RsYndn?=
 =?utf-8?B?dCt1ZTBjUkcrcEdzakpvV0hDYUNVS2VQTFdaNWZWeUNUMFI1bDZNV0lBQlY5?=
 =?utf-8?B?OHkrcW54TjdqaGRwamZKamVBV0dMWFBMek9NWHgzNXo3YTlQT2ZIN3AycHAv?=
 =?utf-8?B?K1E4RFQwWjBYdGZSS0pkNmlaOHNJeU9DT3BqZi8xMGV2S1Jza1MwS0tGVVRm?=
 =?utf-8?B?clZlakw5Tkpsam9Sa04yUUwwcms2azRrZUFMNmp3T0dkNzJNN0VGQmw4TlNS?=
 =?utf-8?B?T005QWs2NkM0cUUvWXNJVDY3MUEzVmlNYVpSbGQ4UkUvdXZtR2pHSlhLNXhB?=
 =?utf-8?B?WTgvL2hnOU5yK0FYejd6ZjFJS1RXQURaVDk0UWZESHdLOTUwbS8rRHVKUExR?=
 =?utf-8?B?YXBsd3JTZDFxMXpXM0R5UmlkN0pRZVN4NGdjUWhRUVpVbnRwYkZXUmlCQ29Y?=
 =?utf-8?B?NHk4WUw2cGIwY2RBUEs1OFdJNUd5c1hON3U2M0pudlVGTURnNnIrK2JiOWNy?=
 =?utf-8?B?UGZ5V2VGc2piRFp3dC93aVNEZEcxQURpbEtCSDJjQU9JNi9qTm4rZGZCWkkr?=
 =?utf-8?B?V05neUtoa01YZWxGRWRlSFdUdDUxdFVLajZGVGRqVDRPWGJSUlo1WDNxRG5r?=
 =?utf-8?B?bGo5VGxxU2pzQ2I1TVBDRytZNlJzYUV3RmJpbGJxazNNdTN0UXBXbm94aHhN?=
 =?utf-8?B?MG8wNDlabVhsdC9GV2N2OFhuWWpmeEpYeGhIbVFCTXJXdWRhN1laRURmWml5?=
 =?utf-8?B?ei9aakg5dGtyejgxQnRwMWlWQm1oT3NDTUh5N3ZhdmxyL2xhV2V0VFh0RlFO?=
 =?utf-8?B?dmREalN4dzNRUnhNN1IxbHF0dFE3d0thY0dpeFNKcDBYMHJVRlFhMmFiakNi?=
 =?utf-8?B?NDFnSmVDaXFEcElJYVBRNUlmY3ppYWFyQStlWGJIWTBHMFpIbEEwcGdMc2pB?=
 =?utf-8?B?SW9ZRVE1UmhoSFQzaGgxL0hSMmVpUGZ0YzhHK3hlbGdDM0VDcDBLSFZ2c1ZJ?=
 =?utf-8?Q?eI5EDnVn0s8g9zsJxdNJcNUnb9EYYUWd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0E1OXV6Nm5xeUlxSWFkVW5aRjM1KzNGc3VoNzJJQXRZM0ZTZ3lCbFNHdDhy?=
 =?utf-8?B?NWk2bWVubnJ2dk45YjRkUVhOQ0pBUWhSKzVja1BLaG45T3hKcVUxTGwzcXN2?=
 =?utf-8?B?TUg3RTRFUnBoUUc1K29jYmw5UklxTmNKUG5QY1dKR2xxRG9DRGhpRWZINGox?=
 =?utf-8?B?VUJjZVh3YVZkU3I1S01tK2hJb01BdnpaamwrVSsyaGhkMVBZMXZuYURPTkox?=
 =?utf-8?B?VW1qa2dLUlU1SXh0MHYwQ1U4SnZNOUQwWWhVbnpwa0NxUjNTd0hSTlhrM1oz?=
 =?utf-8?B?Z0habnNhQ2ZDUWhoUXFKU1RHMjYrcmxpT2g0ejF5TkRyQjg0Q1FsZmVqYlFP?=
 =?utf-8?B?VVZlY0RONjMwczVnbnVJSmFaY0gvWVVIQVJSSzFIa1J4Wk5Ddm9qRWsvNGt5?=
 =?utf-8?B?UHlkQk1FTUlTU0pidHkyZTZvRDFJMnFwbnVGa09JUnlBSmJETmdZYmZuVlJB?=
 =?utf-8?B?RFZrWFF6VUdlNTdveVRxdFN2WWk3VlhOR0pLdUtIM2ErV2tCNlV2M1NISDhI?=
 =?utf-8?B?MktZbVRvSnhrVjFaSXYzWmM1VEt1cmg2L2g1bjBrcXlTSlRhQjJnZjBOMmF0?=
 =?utf-8?B?R044QnpHdmJnNGpTWkQwQ09LeWpsVWpsRjRORkpHQTdQMVRSNUQ2dEVLWkMz?=
 =?utf-8?B?ZTdQeDNZdmNUVHd2ZUZlRGVJb1IyV1VkZVdxV25PY01CblV6S1lyS21KcTRh?=
 =?utf-8?B?Z2Zud3hjSXhheEdLMVY3ekJveHFNNWQvVll2bTFOcmtEVnFtOFR4NUlvTDc2?=
 =?utf-8?B?ZUVtSVVKQWlxUlRzVFlaQW16RWZmL0VORlFCMzg2NTRBdFN4V0lEMDVEMUlS?=
 =?utf-8?B?OFFrdnRkYW9JdnhZc2ZtblQ4MHk5MzNKRjJEWjhDdWgwcnZObmtyUWgrSkRM?=
 =?utf-8?B?UkdCdlh5Z0ZaTUFib2x0eVNUTXJSMTlGZDRTanl5VWFoUUdWK01DR3pRK3Yv?=
 =?utf-8?B?aktqQzBoWGtGY3RVNVd5ZVhSa2cwanBNV0kycXFVdDA3a0c5QWVEY0hJb2Y1?=
 =?utf-8?B?bHdWM2k3V24xcWJJdG52TVJheVdMTkl2djAwVi9aeEVidUp4RW13N0pRNHRV?=
 =?utf-8?B?cDQwYXJkbTZINWgzdXdWSndNN2pmREl2YXFldFhkMjRhUHJNVmRiYUx4UnJW?=
 =?utf-8?B?andHVWZaMC9uVFZTRTMyUjFIMS9LcXRMTlNyRmQxTVJ2QkRYekVwUTRaaTMz?=
 =?utf-8?B?enRldjhId1dUMjAzZXdMcXBydmMvTGc4VEcxRUZ0dmFqMTdCeFEwckhwNU9s?=
 =?utf-8?B?NTJpd1ZSUnF0RXJ4NUZLaGwyeWxjdk43aW9ydUhJN2ZpRDBZdnNINHlhR1dv?=
 =?utf-8?B?REdCUXh5RnBtR1dVdHhIWmhNeC9wam56NjFBR0hVSitFMjlrdlo3R0JUMFRV?=
 =?utf-8?B?WklORlorUC9IQllTNXVaaVk3Zk9PQXFadUFMUFZBTHliRVJVQUZnbm0wczR3?=
 =?utf-8?B?N1FEcERleG9OWnJMTzhrdTJENGJiekVBSU4vdXMyaGFjMVN5NG5mZS9RdzFS?=
 =?utf-8?B?Vzg5ZnYrVkVyNFVaK3Nic3VFaXlCLzNtYjYzd2dsdXBEcDhSbGsySndWMTBl?=
 =?utf-8?B?bEprOGV0eHlUMSttVHIvMFhOaXFmUnRaTE0vRzRIS3B3SU0yMlh0a05ESE9u?=
 =?utf-8?B?cExMMEozaDZjVWtlNTJQeG5qWmVRMmQvV1N0U0xmQVVBRWdJOWxnM2xLbjVM?=
 =?utf-8?B?MElsTnNQcCtES3dBaFJOU2JRancwdlBNOWtOM1YzcHBobVBhaVFhTWZKdldX?=
 =?utf-8?B?MG1NOHc3cFJuTXE3UkxiMDRZdWtuakNPaFNiNTFaS1BKeThBOVdhYTZmd3Zn?=
 =?utf-8?B?NnYvNnlqMzhCQnpaamIvc0dFQlRCTEUyVGdmd2hHY3JFWmJCejZ6YXZmYngv?=
 =?utf-8?B?RURtRmVuUFJvZUNaUGptNStvUllnbUJFRDU2ay92aHZpWUJ3enNZVGw1MHZl?=
 =?utf-8?B?YWVmcHVLTlpBYlNjQTJ0RHhFak16K1ZFUTBMbk5GRStGcDZpK2o2T0RwOXFI?=
 =?utf-8?B?TUVOQnFKaEE1aEhzT3lPd0pCY1Q0U3Q0aGlacnZKZ2tVZlZ6eVFsSytKVFly?=
 =?utf-8?B?bDFzQndCWFJWSkhJVUJqS2RQUmQrLzNodzFONjF4WkF2ZUhzRnltYWV5cFhU?=
 =?utf-8?Q?O3NmelFw+IkjDzJWO7AlMBYsK?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rojbWFk+nCPbc5txY9Y7Xc62gJsxBjAbScorwTprM0t5cMugPi2lnUUDT7tiFkflzRR4uqoIr+FfG6XHzUWNC8gBiwYGtibWZ+3eZhxlvEhG6hC8Nqh7hG/O4iz7pfkTUN9UUkYHQYsndbiVDKg8iDdvDXvgQrCGt1TPvpvpj3fhkkIzaU+83hxqKP3Faq/diEBHY0FIIw3E+jSGlRhr+PLjzGcDIPiyHm/uRsJqyQnhiHOsKR+iR8nYOwpmb2OPqmEqzXtligJdcX0WKqj4ZASjFGi9iHGgB5u8WfR07IPvSAsuz8Ah99bkoYui5aSYiq0gXxTInCPFwB+KwyxLbT1oEI97wdC8Q5x9TWqvedALnES81sfil8L1/Bcyf6Z+9qWKM7C3Q1WYs87kvxc8X1penc8VcETzA+q5n37wAAsjTaZXeJwZDtR+y882tuc81Q+xJEMBSVhXnKkAhet6cnqKytz/KgPWJN08azPmAGgBX07yBBDIXyradDee8Nn7K7TlmVWhCX9VAtwiMuK1JdNp5e/b9HYx2wJqZmyuEUZGGixKuCCCQAHMj+38z3BzrKxN5sBPXC9YtjXLikxXvlLiSOR+nQ10k4ZaVczZnKs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ad464a-6671-4bd5-372e-08de3e711333
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 20:07:30.8632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r/M+vYZ92b6aCTnsCyPB4KXu6mnOJW84QUBdKcvefyVT3AaUKK1IfJRb/11UbihyseclymeKm7q0pS1kCQyKLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4496
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2512180166
X-Authority-Analysis: v=2.4 cv=YJmSCBGx c=1 sm=1 tr=0 ts=69445f06 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=ICQH5IdO38lauPp8i8UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:12109
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE2NyBTYWx0ZWRfXyRQZSiOPI6Ly
 aSuyOjxR8+iX725eZmn1A3CJQLDn2zlJGPZwOySJxT4GvPpiNCY9GbPXoiuNiYtHcJxF+qJ18/X
 acB06vqCkamHV5mod6R85KSJl5vOHWDGeo/dmZUPvtGeBZDmd2dx3vrpzfIF6/X+4Bgqlk0RQiI
 ryxsATe+1OnqO/kuhePCmqgVaZAyrA4sIVWqdZgfX+ei6aindV3RBJzSD6RQ/kVz70156Pq8qhX
 8DXJuygvddXanvuQ2iTgnL34SmhPf6IOyL00usomw1hUCeYfZPsk/VJLa6S3pIdHbWjkCRKw0xa
 sLhRzutr9A0OGec9oB4Scmd89C8RD2sNQtPRPmWeXsntdel2OozMGPOXyOD4YGJI9Bp3BdhYSDs
 P30KA8mCeIs4HJk/ZOn2FLxMtS4ymwa4afr1eAFaJNDwZOmJ8OeLCE0/ZNnowQYHMejcLqRIgYF
 MK7OAlSjBvXZQPReNd/JVMIuyiGiaqg8IFwBjGI8=
X-Proofpoint-ORIG-GUID: f5QB0JhDdhxUR6_VEMJydl_EbHewDeC5
X-Proofpoint-GUID: f5QB0JhDdhxUR6_VEMJydl_EbHewDeC5

I'd like some context here.  Why are these permissions being changed?  E.g.,

* There are some *.d files that start with "#!" but they're invoked as D 
scripts, not interpreter files.  So, they don't need +x.

* There are some *.r files given +x.  Why?  They aren't being executed, 
are they?

* A D script is turned -x.  Okay, but not consequential?

I'm not against the patch.  I just don't understand it.  There's more to 
x permissions than whether there is a leading shebang.

On 12/17/25 00:09, Kris Van Hees wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   test/demo/script/interp.d                                         | 0
>   test/demo/script/tracewrite.d                                     | 0
>   test/demo/spec/specopen.d                                         | 0
>   test/stress/fbtsafety/tst.vahole.d                                | 0
>   test/unittest/funcs/substr/tst.substr.r                           | 0
>   test/unittest/funcs/tst.basename.r                                | 0
>   test/unittest/funcs/tst.index.r                                   | 0
>   test/unittest/lockstat/tst.lockstat-summary.d                     | 0
>   test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d           | 0
>   test/unittest/scripting/err.D_OP_LVAL.rdonly.d                    | 0
>   test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d              | 0
>   test/unittest/scripting/err.D_SYNTAX.concat.d                     | 0
>   test/unittest/scripting/err.D_SYNTAX.desc.d                       | 0
>   test/unittest/scripting/err.D_SYNTAX.inval.d                      | 0
>   test/unittest/scripting/err.D_SYNTAX.pid.d                        | 0
>   test/unittest/scripting/tst.arg0.d                                | 0
>   test/unittest/scripting/tst.assign.d                              | 0
>   test/unittest/scripting/tst.basic.d                               | 0
>   test/unittest/scripting/tst.pgid.d                                | 0
>   test/unittest/scripting/tst.pid.d                                 | 0
>   test/unittest/scripting/tst.sid.d                                 | 0
>   test/unittest/scripting/tst.trace.d                               | 0
>   .../unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d | 0
>   test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d     | 0
>   test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d   | 0
>   .../unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d | 0
>   test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d     | 0
>   test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d     | 0
>   test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d      | 0
>   29 files changed, 0 insertions(+), 0 deletions(-)
>   mode change 100644 => 100755 test/demo/script/interp.d
>   mode change 100644 => 100755 test/demo/script/tracewrite.d
>   mode change 100644 => 100755 test/demo/spec/specopen.d
>   mode change 100644 => 100755 test/stress/fbtsafety/tst.vahole.d
>   mode change 100644 => 100755 test/unittest/funcs/substr/tst.substr.r
>   mode change 100644 => 100755 test/unittest/funcs/tst.basename.r
>   mode change 100644 => 100755 test/unittest/funcs/tst.index.r
>   mode change 100755 => 100644 test/unittest/lockstat/tst.lockstat-summary.d
>   mode change 100644 => 100755 test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
>   mode change 100644 => 100755 test/unittest/scripting/err.D_OP_LVAL.rdonly.d
>   mode change 100644 => 100755 test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
>   mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.concat.d
>   mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.desc.d
>   mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.inval.d
>   mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.pid.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.arg0.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.assign.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.basic.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.pgid.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.pid.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.sid.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.trace.d
>   mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
>   mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
>   mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
>   mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
>   mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
>   mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
>   mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
>
> diff --git a/test/demo/script/interp.d b/test/demo/script/interp.d
> old mode 100644
> new mode 100755
> diff --git a/test/demo/script/tracewrite.d b/test/demo/script/tracewrite.d
> old mode 100644
> new mode 100755
> diff --git a/test/demo/spec/specopen.d b/test/demo/spec/specopen.d
> old mode 100644
> new mode 100755
> diff --git a/test/stress/fbtsafety/tst.vahole.d b/test/stress/fbtsafety/tst.vahole.d
> old mode 100644
> new mode 100755
> diff --git a/test/unittest/funcs/substr/tst.substr.r b/test/unittest/funcs/substr/tst.substr.r
> old mode 100644
> new mode 100755
> diff --git a/test/unittest/funcs/tst.basename.r b/test/unittest/funcs/tst.basename.r
> old mode 100644
> new mode 100755
> diff --git a/test/unittest/funcs/tst.index.r b/test/unittest/funcs/tst.index.r
> old mode 100644
> new mode 100755
> diff --git a/test/unittest/lockstat/tst.lockstat-summary.d b/test/unittest/lockstat/tst.lockstat-summary.d
> old mode 100755
> new mode 100644
> diff --git a/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d b/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
> old mode 100644
> new mode 100755
> diff --git a/test/unittest/scripting/err.D_OP_LVAL.rdonly.d b/test/unittest/scripting/err.D_OP_LVAL.rdonly.d
> old mode 100644
> new mode 100755
> diff --git a/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d b/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
> old mode 100644
> new mode 100755
> diff --git a/test/unittest/scripting/err.D_SYNTAX.concat.d b/test/unittest/scripting/err.D_SYNTAX.concat.d
> old mode 100644
> new mode 100755
> diff --git a/test/unittest/scripting/err.D_SYNTAX.desc.d b/test/unittest/scripting/err.D_SYNTAX.desc.d
> old mode 100644
> new mode 100755
> diff --git a/test/unittest/scripting/err.D_SYNTAX.inval.d b/test/unittest/scripting/err.D_SYNTAX.inval.d
> old mode 100644
> new mode 100755
> diff --git a/test/unittest/scripting/err.D_SYNTAX.pid.d b/test/unittest/scripting/err.D_SYNTAX.pid.d
> old mode 100644
> new mode 100755
> diff --git a/test/unittest/scripting/tst.arg0.d b/test/unittest/scripting/tst.arg0.d
> old mode 100644
> new mode 100755
> diff --git a/test/unittest/scripting/tst.assign.d b/test/unittest/scripting/tst.assign.d
> old mode 100644
> new mode 100755
> diff --git a/test/unittest/scripting/tst.basic.d b/test/unittest/scripting/tst.basic.d
> old mode 100644
> new mode 100755
> diff --git a/test/unittest/scripting/tst.pgid.d b/test/unittest/scripting/tst.pgid.d
> old mode 100644
> new mode 100755
> diff --git a/test/unittest/scripting/tst.pid.d b/test/unittest/scripting/tst.pid.d
> old mode 100644
> new mode 100755
> diff --git a/test/unittest/scripting/tst.sid.d b/test/unittest/scripting/tst.sid.d
> old mode 100644
> new mode 100755
> diff --git a/test/unittest/scripting/tst.trace.d b/test/unittest/scripting/tst.trace.d
> old mode 100644
> new mode 100755
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
> old mode 100644
> new mode 100755
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
> old mode 100644
> new mode 100755
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
> old mode 100644
> new mode 100755
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
> old mode 100644
> new mode 100755
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
> old mode 100644
> new mode 100755
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
> old mode 100644
> new mode 100755
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
> old mode 100644
> new mode 100755
