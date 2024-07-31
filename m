Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7D7381D5
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722454729; cv=fail; b=bihUnE6rQ4rrNBuHeRUS+E7zPJp0/beqH6+y/8fMGGfIzevATteraWeX/IT44Cg5bC8bWGG0MiGbo8bT6ak/L09wjuJb7pRi0MEl9z01fGePrr7yq/ky8PiuQNPxjt3nHGpZ7PspfMheqrKqdZW0bqcWElFeS9XJItwPn6jLXE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722454729; c=relaxed/simple;
	bh=wRmJ9yGU6MERNN9B62+jOXlPOH26MY/wjBllczv8TH0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=We7WvIt5vO+HpHA4YT+7a/P57lQQzz+7mrWLXHimPf9joirk7KuUASmQ/DP8cRn9nnKUspZnQPGc3vqrVMd+BnbT+mbhy0O1KmeJCdK+Z9/anKCLI5m34ALgGqyPfxr3VXX4ApDMILDg+uscPuValjFwlRuXMeQXTQ64MgWHbQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=O3nBjy8A; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EFfyxzvr; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="O3nBjy8A";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EFfyxzvr"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VHu8cr027185
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=Yyi11HxdESAVoxs13HQH2B2gXsy1sKjhBrf9VecY884=; b=
	O3nBjy8AR+1KAhyAF/ANABv8XTLekkJJjktm6Key3c+47PGzesUaAUiDxQ82CJMI
	0Qv/NkgnWDnEWpSYBt2eHcTpIY1evFg8UfyTby0u+d/wPCKcmb1R4I4iRkgemkvE
	8d2cSDPgWjinB2v8PM+O7Ddq1aMBwG5DxFt7bIv6a5GOfE6VvqqppWZofxJ+UqyE
	+SuOP59ceVWMdeq0eqXHRuJ55A0XbXYe4BHEd6umnNUgUVg7VPtrPomW8Psr06Qm
	nPmZlGumg5Ts1/fBy8aHdOew1Iwo9hff367Mdb3BtDx8xdoPSV2KTh+3oNBkNw6F
	6r2PThZa79IkLaexCzmAmw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mrgs87hg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:38:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46VIpvRM030823
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:38:46 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40nehuvy6q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:38:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXYLDzQO/UyDncG9Nr+tg8a/uFFhynRAZljbaC8Jm1w+OGwT8dfozSXmyB4gevusEVGUXNaduOCdZbXhzCHTzO4sdUhD6WA1bqbzuii9Zg4JYQSgH3n0LWIkA0BtNR4Mn84AHipt8TTtWmWNaMiocDAQc/UJ7AuWIPe2UuIiISkP8p0vt/WC0pcOr80M91chftpRY/5oVgXIuiBm8S67cutEUY0+iHbPZZSlMXrv6YTM2k3wpHEkvNxk46UwjxbKU2oxDZez5dlpXSxImoT1Vu6Uyvhjd2jpj/+0+PbeMrAr6fNwKEUB74c+8rNnXia7RSFHV5WadZ8omkKgFxBZ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yyi11HxdESAVoxs13HQH2B2gXsy1sKjhBrf9VecY884=;
 b=qV+S3se8uh+9XhhUE2tLzY82PE82Q5/SuHVSCrsCRlJRaJpH+eBtKYo4Tuknjb7XBsGKzEPEr03qJQfAUxox08r9Bc+RsTJqxpSWGl7mA3DUYV9/9FKQZ+lWlx+T6NBCy7xpX3x8WPyQD43nPQwJZ/YxDURFzni4LdzDcdYtv+IFMbW+TKTbquHFxzTa0corwmUQxc/sf/VVREAcQo/3k7kjVe2Fd0y3A1S6yfBqOh1vtwWR32b7qlAytrAgKd588aS3CIRQlmptyWGNbDwzKGoO05SyLEJd8eaYNWaF9ZcsN3wQuLOSrMldhE1QexrjrWrG2iGGKOyKr85Nc9eDSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yyi11HxdESAVoxs13HQH2B2gXsy1sKjhBrf9VecY884=;
 b=EFfyxzvr/5mpxqpj5m/fZhO3hr1bgc3Y3FVX1RtAqjX+MZrZ9Ppw7ftNcsrotK0tiGlIQxk2wRJYCu86WEbHTO3FF+iYiv7Xsi0aDEGYqgmyGcpRkcTgdLE8BwCB3/2rubAfatHxr9Fu3LXvZj6wKuHt+qWwnF6V8QS0mniqWM8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM4PR10MB7428.namprd10.prod.outlook.com (2603:10b6:8:190::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19; Wed, 31 Jul
 2024 19:38:37 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 19:38:37 +0000
Message-ID: <38ece7dd-cf80-ce8f-ae1f-3cf8f8fb51ef@oracle.com>
Date: Wed, 31 Jul 2024 15:38:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] test: remove unnecessary dependency on /proc/kallmodsyms
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SN7PR10MB6287DC372A5DEF4375CAE9E6C2B12@SN7PR10MB6287.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SN7PR10MB6287DC372A5DEF4375CAE9E6C2B12@SN7PR10MB6287.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0193.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::18) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM4PR10MB7428:EE_
X-MS-Office365-Filtering-Correlation-Id: e4ea4a47-5168-4120-c67f-08dcb1985f6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVVucEpwaW5PU1RGQkU3WWY3dERNUGpZOWJLU0kwV1ZQbVJBS3ZNSUtMTmxo?=
 =?utf-8?B?blpETkpxdUt2YzBSY2xvaGhJVms1SWExQ1d3ZnV2T1RnWDE2aTcwOUNhZ21u?=
 =?utf-8?B?bVpEckFkVTQxRlNwUnZudEJZQ29Lck1GVjV0a2ZjeDhsZ3Y5TUoxVEMzcUEw?=
 =?utf-8?B?UzJWeDhkODNGclJPU2ZBS2NyUnpaQ3hUYWYweTJFaVA1RTU4RWRLb0NsM2x0?=
 =?utf-8?B?b0Z2Z2NUS3NjdW91OENyQ25xSERnOUZaWDlPSVZkdE4ySU9hdk54SU5NZ1lY?=
 =?utf-8?B?enR5YXBhcSt1SHk1MXBmeXI2TDVCeFA2R2F4Q0JtaXNIM3VQU0owSWRkYVFF?=
 =?utf-8?B?ejRmYnZFVGx2RkluQjcxeDE3Z1NyMEhkV1I3eTYrR20zMjIvQlB0bkxSdEts?=
 =?utf-8?B?RlRDaVFSNGZXTmpTR1pyeG5Kb2dncWlhditvMENucVpnbVZFMTdacTYxK2R1?=
 =?utf-8?B?eWtFdk84VExwL0hOMWo1TUNBcU9WM2dWYUk1Q0IzVGU2MWZ3NmFJREJBQ2lT?=
 =?utf-8?B?MVo5RExkREhvYmhBWit2UmJmdU4zZTZtcDJBTDFLdVJBOGRJVjZIeG9icDJ2?=
 =?utf-8?B?YkwzSU5aK1c1UXBpcmpWTExEYnB6WUpYUWsvbm4xMUgxYmhDakFkMU5ndzFz?=
 =?utf-8?B?d1MrK1ZmeHZCc1MvaWZPWmFxV0srV1BwZWhkWkZVMjZpUjRxc1UvMzc4TzVa?=
 =?utf-8?B?N25TaThVQm5tdjdDUVZkTTRSSHowR2JiOGpCMGhJalN5Z2lmTnhyOFc2ZlNq?=
 =?utf-8?B?UlBFUkY1OTdNemt3cUpESEVkWVJaSllpUTdRc2VIVjhzZTB4cnQ5STkxZUk3?=
 =?utf-8?B?MXFEVWE3KzYzZmJIcm14NUJuSmMvem5XTEVheXcwSTdTOHA5Tld3RHNtaDZw?=
 =?utf-8?B?Ni9mWUpaMEwvM3VGQ1MrazVoY29HZEtNb1lmWk1WSzZ0ZCtMOHY4LzEvRWR2?=
 =?utf-8?B?UUNPZ2Z1ZjF0amNYMlE4R05pSnJ2Tzl2V0VmZ091QVVZc3A5N2IrV0FHdi8w?=
 =?utf-8?B?NDNaaThQdEcrSzdWNVA5aWMxR2xoRG9XYnQ0NnMwY0V3azlyYi9hUWV1TzVJ?=
 =?utf-8?B?TVVPTU9ZdDJJQy9xN0srbi80ODFXZEZ5bVJlQk1zK3pMemZUVEx5WWVGVldD?=
 =?utf-8?B?eCtucFNoRjVrUXA5QU1sbHpNa3dHeHNTQ09IT2k5OVV5aDhTSEFLVmRsUE42?=
 =?utf-8?B?WitvQkFQcnVuTW5GSENubGZFdlMyQzUzQVhBQ2JvVWpENlF4RlFLR1lNRmlE?=
 =?utf-8?B?U0swNndsRTU1QnhLMFN4d21VbWZNcGxHMnZZSE1pamV3dHRYako3ajMxeFhH?=
 =?utf-8?B?bGZQS2JlTWc1OGxtaFQ1MXVDMVJwYXRqSDlxUUlHazBMQVBMTHRIZ1Y1dEI2?=
 =?utf-8?B?bnRvK0JkUkVVT2xpUEcxdk9IbE10eHF4SkF0ZmJoSzA0VnNqUDI3YXZSZFhH?=
 =?utf-8?B?SU5yUU1FeWt6bXdieUVnajd6SnlVdkRtLyt6dGJFakk5RVFBMndpTjFDeitr?=
 =?utf-8?B?Vmx6QmthSWNjQUpKcm1renFPWGNiVmoxcTdjVWgzbURTd0lyWWp6YWN4ZFpq?=
 =?utf-8?B?bXoxbHNVM0ZVa3JDcjNQcWdkT1NTUUJ2Q1BPaGZFUUk1MzI2VU9takJxMStm?=
 =?utf-8?B?dlBDaUJFUkw0UHdqOCtwdGlxaHZvMHlnREU4OU9XYmJKNmVvM0RMMVAwS3ZW?=
 =?utf-8?B?bHY0RmVtbnhKanVuTG10K3NEaHJGWEsrODM5MkxxMHJTZng3L01tQ3BXaHJR?=
 =?utf-8?B?TmVxSVdPVkFjNmNUM1psYUxHQ0V3SGlNZ254dENpRGVlOW1sWnFacEkwT2Nj?=
 =?utf-8?Q?dp1LI5NdW+ruraJBIl64ZfD67sXu7kcJF+Br8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFIrdWJNL1gwSXowbzBUUlZjbTBEN0o4MndBRzJBTkpYQUtEOU5BNFZYT1lY?=
 =?utf-8?B?TWhDWmQ4ZzVxWmpSOFJ5MlJ2K1N3aVdsTXd1L0lWWWV2eE8vNVVDOUViRDly?=
 =?utf-8?B?UnJQUFJHZThjelRNa1lNM0R4aWs2aFRuMzF2WWNtTDlrUE12dnBuL0lMVi9p?=
 =?utf-8?B?OFdBV1BYVlgrdlNUazVoeEh0UFRjbllDcDdEeERvcWtMVklUckhRcVo5QWgy?=
 =?utf-8?B?MTBpR3YxVHBTQ3hVSDNiTDBreStkT0lONHVqREZIOFJJYksxcGxBdVI0TU5y?=
 =?utf-8?B?SnlGZ1JsbS9IYkxjUDVqc3VWTG41QnhvTW1ZT3ViU3BhRWRhbW8xaEc5dkdy?=
 =?utf-8?B?OXRUR2hFeDlxcWtkeU1VV0Q5MzNOeXYvakpYd0diOEhRVXRhK1JDU3JabDZC?=
 =?utf-8?B?RDRDcTdCRm9SY0h0NVBqK3poMmU5dkIzcDlrWXlnU3gvUkM4WVgvdjhuYllY?=
 =?utf-8?B?NkpWeHBNdy9wQm9NT3JGdnZSaDFSL3ViRjI4NTVONHhhSTZ3Z2l6aXUzaUp6?=
 =?utf-8?B?STRkREtNOFl5RUVJNjBMeEdvNEUwK3VQakRaUmMrc3VNVlFwK3paM3M3Y215?=
 =?utf-8?B?SFNxanE4TWFBbW9iUkpOOG5DZGJ2Wm96YnhBUFFIT2MzZmRZQWJTejVzbEpJ?=
 =?utf-8?B?SzM2YkF5NGhDMUVUdmhNOHJscnZuRm5yMWtYcHBtVGhFWFZpMTlsSk1nWjFp?=
 =?utf-8?B?SzV2Yy9xcEJPV2xZUDh4bUwyNzd4eGtWc204YTZJdWZjUXFaNzA1a2xEZ1ZM?=
 =?utf-8?B?Q295L1M1cEZlL1hSTno4MkRBR0lyY01iZk5lUE05WVZ0YVRpbSs0Z1BLMVJK?=
 =?utf-8?B?RDFaengybG8zMHhhQkRkT3VRL2d0Z21QMG5ZN1NkeUNBYmRaL2tvMzc5d1o4?=
 =?utf-8?B?b1FQQktRN2F0TCtFMGVwK2dET29vYXQrcjMrUmxkVnlTdTdRRFUwVFh3bE5t?=
 =?utf-8?B?aGNvMUZSZUtTckQ3RTByOFlsZjRteS9tZUY0MTJ4VnRNN0dVTXNRa0dBcEpR?=
 =?utf-8?B?aXNhK3pUVEJQbWhJd3FSRG5jeVpPVEhtN09EN3ZoTVBwUFh3SEo1bnNGVzIz?=
 =?utf-8?B?TVlkcllzaXprR2ZBejRTaVZ4ZHNtRXJwNVFpSXljOGVsMjc5cEkxRjk0a1NN?=
 =?utf-8?B?MS9MRzhvMVQ4cml5WXRFRXVuZ1BXQVlZQzloVVUvS2JrNlRTQkJGWnlnMWIz?=
 =?utf-8?B?M3lTOXFIZDJhd2p4TG9vcmEveElEMzhYZnhmc2ZBbnJ1cEtLT042cnlWTVFw?=
 =?utf-8?B?aHV1M3VQa3FNa3lLNWZRV25KVWdWSVdyYzFNR01HL3pLbmwrSEVHTk1UNFNN?=
 =?utf-8?B?RHdCS2xxVkg0aUY2SlVHWXNsVXBUdWdteW9qa1lEczQvUWEvZzFFaytBZGR5?=
 =?utf-8?B?anl6RDBWVkwzZEJBZG1HODlXNko4NU1YQVkxUHBjUlltKyt2UmpnME93QUI2?=
 =?utf-8?B?MkRhcXZXa2JqMVMxNW5YY3RIYnYwcjYweE1ZbzlzbW43RmRqQ1MzdWtkeHZQ?=
 =?utf-8?B?YlVmb1E5NVVQQ1dsOFhFaGdnTnE4RkM5Nkdub2hBeFY2d3Q2V2w3S0VVUlNB?=
 =?utf-8?B?Tkl1VSsyT1VUYmVYYXcyYUhFTDFDVFkvVXlwanpQcUxnUk1SYllHNlpXTzhS?=
 =?utf-8?B?S3AyQk8vZ2xLS083azNFS0o1b1AxZ2tRaUQ5c28yYURHQU9VVmJBRDBDWU4v?=
 =?utf-8?B?K0I2SnVWWTRPTVd2ZTNzWjNQTUI4QmJLSm1tbkVjOXJiM3ZkYWJHbHl3QmRq?=
 =?utf-8?B?R0swSkVneVpqWU85MTBsOXR5N3NHRkluQjNvVHhTSUQyQWRmQzY0SWRpWkZq?=
 =?utf-8?B?bGlQTlZpbTFiVDMzNldWUkZYbTNIYThKeitVTmpHaGltWkM2SUt6QlI0MG52?=
 =?utf-8?B?bzRZbkVDTmd0SWwvcVMzV2lDTnYyZzgySDFsNyttem1VdGs3RUpJaml3b2Uw?=
 =?utf-8?B?YWFpaWZqSnpPOVlPR3ZSanZIZlpIQUZSZVRCYytlbjhBZ1Z4a1p3QW80MDBH?=
 =?utf-8?B?dDdHdlhmN1RONGd0bE4wYUltWUJDSzN5TmRPMHZlT2srWjNYT29kUzl5WFhI?=
 =?utf-8?B?Yzg1a2ltRWNMalBnNTErV1RwRWJzVjVjMnk2bGd1UWVxZGlaNGwyNCthQjFS?=
 =?utf-8?Q?9IoEKXJLc0cPSDxj9p7bXdmKB?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2Tl9J8SekBn1uD9pg/L+nx4MAbxVKvgh/HrN7vceSwbMgj7EY1QX2SCXYnBM9UiXKy0a3imFqn5t1Iw0RF2AB2M3gGZhIjDNfan0v0AkuCZJFCN0KovPAF75TiwzFHGLt90DqVmh4usi/Z+mUKlH/Cm5kQSykJ/isIuAHJEwV2P+yjt4yJXXwAfH1wLraRu5EXRWLoXgoL64IRQg3Ixkgcuxz0Zvm5N6z1TNrQMFlsQbZHavAnx9+xmEQmKg0ELdAcTJcxi9anPtW+zhh6zbTWpsNB+0J6Mnu1hyHfW0LTBQsNZYO7EsupI+1hfOSXAhxEKuqPuP43H/9PPPjE8gEC9ZhZaTVtNR/xRqRN2y43vuUy/23Yci6cKuB36ZAXuh1L5HlGJsafCB9q2+l0qq/AaWbET94V891rrsdY2hcpGc7UOIEY/gsQHV01qDIGjeEz4oDjLF0c+s4pKFAMZGG/lic/1bs1viTwVOTSyg6gtvgT5eRJI5pE/s/lgHUrlc8SLp9nk6/8eQynaZcQYFvMNccGGB1bd6m05dJSl7rkgt9f7SaRLfRnPIplqswKizZzTOEiqOfHRNNotzhpV4HVuYJfazJXuuUg7X90qa8SM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4ea4a47-5168-4120-c67f-08dcb1985f6d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 19:38:37.4913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: laknMxol++wrGzJmelGBbVzsStVRlxeWC6DRB8ev/tAYdxknDtHuuKXx8sz5fEApnNHCtKmOFGwNr0H6VrNGng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7428
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_10,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407310138
X-Proofpoint-GUID: pPg6ktzKlPmZgi3K7E1sQo6pSTNVTJmy
X-Proofpoint-ORIG-GUID: pPg6ktzKlPmZgi3K7E1sQo6pSTNVTJmy

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 7/31/24 15:01, Kris Van Hees wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   test/unittest/actions/symmod/tst.symmod.sh | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/test/unittest/actions/symmod/tst.symmod.sh b/test/unittest/actions/symmod/tst.symmod.sh
> index 340baf53..f34a538d 100755
> --- a/test/unittest/actions/symmod/tst.symmod.sh
> +++ b/test/unittest/actions/symmod/tst.symmod.sh
> @@ -1,15 +1,15 @@
>   #!/bin/bash
>   #
>   # Oracle Linux DTrace.
> -# Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2021, 2024, Oracle and/or its affiliates. All rights reserved.
>   # Licensed under the Universal Permissive License v 1.0 as shown at
>   # http://oss.oracle.com/licenses/upl.
>   #
>   
>   dtrace=$1
>   
> -# pick a test symbol from /proc/kallmodsyms
> -read ADD NAM MOD <<< `awk '/ksys_write/ {print $1, $4, $5}' /proc/kallmodsyms`
> +# pick a test symbol from /proc/kallsyms
> +read ADD NAM MOD <<< `awk '/ ksys_write/ {print $1, $3, $4}' /proc/kallsyms`
>   
>   # a blank module means the module is vmlinux
>   if [ x$MOD == x ]; then
