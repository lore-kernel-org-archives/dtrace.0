Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454C71865FA
	for <dtrace@lists.linux.dev>; Mon, 30 Jun 2025 21:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751320394; cv=fail; b=ckRAriXUsOVK+Kfp0jYUVbFqDVuHpjKCHlnWFWWS1gYFEeKgpyVXVhz7QE2m6Wjm7TvMj08VfYhxrCEgl9HCRMD5Uun/5fzf/jhZcPOygPkTelhVysfoSNDRlh2vVWBdmIrfJhgabN+il6/S6ImgmyLubYhd2zO59kaF+oRjMec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751320394; c=relaxed/simple;
	bh=8IXuLBuGUmSgupTLMxtUI2lmafW9U9Gb1A0ZwABdLvY=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qjtqQMlRhL9/3MmFdOeRsdRcbDctRF7unvOVG+4SfKAVjJE5qKvz9raex4GWEeDPp82gGcmd2eAHhDdBTEWLrF8xift/yE8zioZjuenHzd+FtBj9/1ujKdOX2pN+zR6m6vSGA2dmE/DZvkPV7KaIw9YFp/RYuaWCBOR4n9BgQR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=C/4ub/0O; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UR5ygwnY; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="C/4ub/0O";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UR5ygwnY"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UICIex003865
	for <dtrace@lists.linux.dev>; Mon, 30 Jun 2025 21:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=/IEvP1lgYb7b4uE9PtqL+wfwx7jkSkMzMT8Hhei+02U=; b=
	C/4ub/0ODgUYf+pL9KhqAT+uOv4+oTvQAeKpVlZeiHZrPNaPQTcRkhYrICbcKqUT
	lyn/XdPbYFi8gO7brnczhrohA9VI3b4imcdMT3G94a4RqZX9FA4ctCcgF44Ca5ru
	Ur+dWSXRFtlmSICvgPffulOfyPLIvXyvrEGI9h4w9Nx0m2b82jpUHR/cBJ0DGx+G
	MCRxF+g6XC5/vB023fPEtCtVclR07//fvLu4BEtUzArwhsYs7TzkZy7ulX8/wfkR
	OKPIAXPlX8ejde+dRGc08+rIR5U2sVO2b39Y4XLiXRIgk7q2bAl1zBRtQ380cDN2
	cpkW1R0vXAo090k63+8cNA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j80w3eaw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 30 Jun 2025 21:53:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55UKe2Tv029826
	for <dtrace@lists.linux.dev>; Mon, 30 Jun 2025 21:53:08 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u8wrvw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 30 Jun 2025 21:53:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kRHLKprTN7IgS7XYtDSMuOIYrNY4Lt7T2TO1P+lDqiQ+AyR+7Kdh1pMlojX1Do78NKtbTDkuVvZPgHzDob1OMkkE9f/159Leo5PThXFSrX4KY/SOxmjLqWrd/dKoTAyyRTS/8lb0LNKJ2J0XSl4TsoVB3Eoqb3CO8ghCz2yxi3zowyQ9uvMHxC75p+p5xpiQQiYs3y9COzwuBRy23F9ftYYOVWwuJohKORCkXjulh6OpdcUj2I0kiFkkQYXJ82lxexjijX8F6tJdyoymcztEYZxzd2F85NOT073b9V33G8azdrG/Nu6XV/e9a23F9pfDwQ9kfcOak/CvvTT7HD3DsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/IEvP1lgYb7b4uE9PtqL+wfwx7jkSkMzMT8Hhei+02U=;
 b=fzLXbgTrLTNRW0PzW/zZDsxAGQNfmRq0oHnu/n8n4TeQBpUVfd4iXrNJg/8WQT9fYwvfZx/60cLZGZ/IZFO4JwHCGYBGKVH9llZoONhhg6bocFa0x0WCHwULDMCC0OFwtN6md5L+8kdGYeW7w7HeOauGYJfhaxo2lVAE6m/lDzj/poEdjugv5zdVCQJsj3XLyT+kSNxBky5lnFJbAwQmz2sVZfD/zRtOILOLJofo94+RkllgkIN2V68gJlzkQSBWlR+Lk2oC7awf/gI/ukKBvCjvjXnkxOQCOpZT5KaGo+1yOCZnNooJRJKRX7tLC97/THONNYOiqzzHz3SPqPHHJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/IEvP1lgYb7b4uE9PtqL+wfwx7jkSkMzMT8Hhei+02U=;
 b=UR5ygwnYZHVzaDn1ez4v/e9K+BcKwgrwf6yMF96lnU5fnqLwrMu1173KXwr0dACH/KErvEld/VuXGDpuNG17QOAwFsTO5vBt154iQiG7jenLoBjChRpxGMebzys5AQQ7rzQwQTk80VsAyeMlu3+N5a2lXGYbH4JLVTcE28mjcZg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA2PR10MB4506.namprd10.prod.outlook.com (2603:10b6:806:111::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.28; Mon, 30 Jun
 2025 21:53:06 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8857.026; Mon, 30 Jun 2025
 21:53:05 +0000
Message-ID: <2a9a08cf-8261-e09a-abf4-0a3eb0f8db80@oracle.com>
Date: Mon, 30 Jun 2025 17:53:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 2/3] usdt parser: handle encoded hyphens
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672B6C002E022B838F4E832C278A@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB5672B6C002E022B838F4E832C278A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0284.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::19) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA2PR10MB4506:EE_
X-MS-Office365-Filtering-Correlation-Id: 93d6b191-1ce5-4889-602a-08ddb8207e63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGt3NjNWQi9GQ3kzNWo0NlhuK3pWL3ZUdWFTQXV4YjcrbTZ4T2xvQXBzZ3Vl?=
 =?utf-8?B?SU5GQ3hLckxYeDhTU283ZG0wOTdRa0t0ZmFzSlN6S3pNZUJmY2hlSXlwWm9n?=
 =?utf-8?B?RXAvY2RDclMvcXF0eHRhNTloYVNxa1F6UllvSXppZWZnSXpzRHVSYUl4eVJL?=
 =?utf-8?B?UjZURmtkcVlvdEZpVGlkdlVYbndHUlhUMXNWZGdvTVhpRGJMdEFTekxVOCtm?=
 =?utf-8?B?aWRjWU9HeVdTUTNUajRNQUR5ZHljL3F5ZkxZbXRRaXAvNnpZVitzUnZrNHVV?=
 =?utf-8?B?aEFoUDNBeXo3eXVjR2FhUmFOK2k3TXNkaGJndTcvdjhJTFRsRi84OGdRVVZG?=
 =?utf-8?B?eUQrMksyOUNjdG14YzVYQ0VMNEtxN2M4VUtnVEh1d3NGaWhqK2xyV29Bb3ZI?=
 =?utf-8?B?Q0xWWjk5Z1RMTFgxa3ZJcWY3TlNCVktrNWF3UjJPTFpQdHZMVytGWGNCbnpB?=
 =?utf-8?B?TDg4d2hEdTRTWmk5MDdsbmVjM1JMRDViaXZ5WWxLYzJGdDl0bVljQkFQMUFz?=
 =?utf-8?B?R3VPeThCWDM1OTlQeWFBV3kwcTgvNHZGTzhiVEFESzFxeGRJSVFlY0lER1NO?=
 =?utf-8?B?ZmVyNjlSQ1U0eXZGMjhTdVVSdnZ1SDQ3dTRzMWVpeHRKdXJPVGZ2Tmc3SStP?=
 =?utf-8?B?M2hFSEI5aVJ2OUJOSk15a3lmVlY2b0NpZGRtUWo4TnFrL1B0LzVHcDVvZkpm?=
 =?utf-8?B?ai9DOXlrUjlhK2J5cVU1UEkzZjkvaGZSUkpaMHdPbzNxdUFibmsrOFNaM2FU?=
 =?utf-8?B?ZDkyUDFvV3VKcFJEOUtGSmE4blRSd3QweElTVHI4M01maUxOMTNXcm1mMm9U?=
 =?utf-8?B?Mk1VQ2E3bXRtTVIzQXNNQ01zYWRoY3c5N2MwVFNQWGtjT1lLRU4xTW1DdzBE?=
 =?utf-8?B?Mm1nS1dSdEZBWWE4YStTRjd1NlZkZnhKeUlFUE0yV0Y4Mkw1Q21rYnZwYlNs?=
 =?utf-8?B?S2hLTHJWUXp1UTFyOFRGRUk4TmZ1NEd4M3JhYmtsMGlScmlNV3VPb1NKbXNG?=
 =?utf-8?B?K0RRQWZqc1d5ZVhhN00xc1dnWU1zNCt6RjFmeGxOTFlSTXc0cE1tLytuYjgy?=
 =?utf-8?B?c3ZFUDBHTUNBRWducVc5ZHlyemROcmVMUlNteXlpS3VPOGNBalNFTURucHE2?=
 =?utf-8?B?bmdrQS9TaU50c1VxWTR5cjV3dG81azFyK2g5cXhaTVFITmxFeVNqL3NFcVkz?=
 =?utf-8?B?WVFqOFhoSGpQSGpNR2ZlU3B4L1JYMEdhdFJ1U2poTDV4NTUvZjJVdFViM3BT?=
 =?utf-8?B?ZTB2UzVGQlpWd2RXVzU1VHozRG15L2lhYUlIU0tNamFjL3ZKT0ZTZUFhekhj?=
 =?utf-8?B?Rmk3US9GajR6R2VyM2llZEVDOWJ1Q25CcHVPRUF0VXJPOWVYTGhJY0hRakF0?=
 =?utf-8?B?YmJrMWFRNytvOFFmVnpLOFVSWjFNTGw1M0U5ZlJxcHByZXhUUm9CVFdGbit4?=
 =?utf-8?B?UEdOcStDYUdzd0NoZHZvK0pvc2xEcFEwbVkwNHB4STNUUTlxNWlaMTBxTmZa?=
 =?utf-8?B?TkJ4M1ZPYURUalRmeVlGeWFOOVVXcm9QNFNkS0dTTnJuK21tdXJKeUcvSTVy?=
 =?utf-8?B?bVQxUnFoWDZDMVBuZ0NwQjUraDN2dkJxM0tWbGlvekRsS2x6OUpBMzdhZ2JF?=
 =?utf-8?B?bTZmUUR2ZmU0VVkvdEd6MVM2YjQwKzNLQ0FTNWJoZDFtcVZJRE9jOGZVSVky?=
 =?utf-8?B?bEpZYkl2OXJsR3JCamRrRkh2d1RUL24xcWJjM2ZkY1duaFNLaUJ0VzFCb3dh?=
 =?utf-8?B?TUJmQWE1eEd5bFZoak9kbFBiY1c4WDZJMGlTOFFEZDFVNjM2SXJSTHByTGN4?=
 =?utf-8?B?ZEpSYmlPdGhsdWZiOHBXU0tIY1FJaEl2R1J0aC9Sci9uOG01TDE2OWRmSEFR?=
 =?utf-8?B?cm9sait3cjEyYW1JUS9XSXN2VE96QXlGL0xVbEo4QnQxZ3E4Vmk2RkYzeG5W?=
 =?utf-8?Q?2k/tsQpTqeU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDA2cXhxVlhuK2FTVEhVWE13VGNJRFV3Q2IrNkQ3aVIvbzQxWFdzaGdPaXYx?=
 =?utf-8?B?MXVacjNFeEdpV09VWFJCZmVKZ05Kb2NPNnhrOHRyc01YYjVkZkltbGd5QWty?=
 =?utf-8?B?c2c3UHVzRVVLbDB3TTk0OE9HS3kvb0w1Yy9udTQ4bzBXUzJQNUFMOGRpS1ZL?=
 =?utf-8?B?VG9zd1pYQlE1SEJQTlJaZUdQMWRtTEIwaVpVQzZNQlhmK2V5ZGxUaHd3ODlH?=
 =?utf-8?B?RXlqVXBVUE1yL3Z3SVhrTGJhTlVYRUZmemxpMnZpaDAvTExkZng5S1hLbDFQ?=
 =?utf-8?B?ZmtnWGRVaWI0MSt1ZCtETWk5TDA3VFBNczY2aUx3NHdCYzloRGVWaXFYUUpZ?=
 =?utf-8?B?ZDhhRkZLektkVENmUERFUDA0aWJoV293bXdUWGZKLzE2SElWeXJMQVRKNnF2?=
 =?utf-8?B?NjBpMm02d2dhK1MrUjVodGp3V291dDdmb216Yk9LTDQxd3ZkY3M3WjgyVSt5?=
 =?utf-8?B?QWVGNWxoTXpZR3lES3kva3JIWXhlZ2JDenlhVHdpMDBJK0JZSVpPbU5JSits?=
 =?utf-8?B?RFdsczJXZkFkQUFVNWRjQnphUmlPWUNJQ3ZIVzlvOWE2S2dnK3VjWkh1eGlp?=
 =?utf-8?B?cmppWENBNzM5MHFvZFh1dG1vYlBsTUxSRVZpbHMxZU9kTkh6N3c1dytvK3g0?=
 =?utf-8?B?Y0tCcHc2NlYwYy9PUDlGL0JYcFNnOGNNNXQycm80ZTVGVXNpNG9QT0NmZmZB?=
 =?utf-8?B?czhBSjJwaEl0RUd0MGpSa1NSQ3hhLzZXSmNJbmM0RWRWRnROYzRMRitzSm80?=
 =?utf-8?B?Q1VpcFJHc2NXQit6MzltcVVUMXZvM0ZSVENuTWZBK09vVkdaOFBkKzlxQ29x?=
 =?utf-8?B?SU9kbVZWZWNzcGFJb1ovLzdHMVZzeUxPUFBZb2JaajlNb0wybFNseDJsTmV2?=
 =?utf-8?B?Z2ROaDZsRXp1TFNhc2hTRDJWK0xRWmVDWkdJeExlN1VvdXRBTVVvUTFDdURQ?=
 =?utf-8?B?MElmdXRIUVVHalZPaklhbTBvTTdxanBKcU94NGExci9yQU85Uk5abTJMS1Vh?=
 =?utf-8?B?QjVqbGJvSlpzVFg1UnI2NG9kSTQ4OE5DQXBYNWVkdGp3WlJUelNPRnBsYTJP?=
 =?utf-8?B?VnB4R1ZsNjlwOXpDcDA5SlAxVjU2SlgxTHBGVnk4SXpucHNmaURJQVJSVnVG?=
 =?utf-8?B?MlNkZXVMdDQxRUUvZGYyZ0Q1bi9EWW43RXBvell6THdmOXZOU0RGNC83T2dk?=
 =?utf-8?B?VVNZYmw5VHFzQTV6bmVuOHI4RHNXNU1sTmJJb1pNdWV4ZW12Vk44VGFITENW?=
 =?utf-8?B?Y21YczF5cHhrQVdSNWVLL1NKODBud1kxUzRLMVlZMG9GL2F6T3orSnJTSjdN?=
 =?utf-8?B?RjY2aUVaSFp0SGs1UU83amNWNlJwMTlpWHVJOVlGaTRrVlcrT3lVVUMzNTd2?=
 =?utf-8?B?MmJZRnhyaFhEcGpNUGlYdEtoSG9vMXhBYTVPVUYyTWNWVUlnUG1DRit4WXUx?=
 =?utf-8?B?dW01aFJIdjRUVGVJN1o4SHRoVW1KN2FmTmEvMHI3OTBUWCttaFdlWDArWVlS?=
 =?utf-8?B?K1RnRXVBcnRNQXprRWhIT2xTTjNHZG55OHM1bGRSVWJjbzgrVWUrZWhyZ2pi?=
 =?utf-8?B?emRjMUVLMzdURjgveDdnclp3cm05SHNlNFdaUWpNL1M5UzkxNjVaQktDcGNO?=
 =?utf-8?B?MWNiNEcyTDV5VE9UYVBWUU9FQ3dqak1yU1o1ZWpBamh1Vmdkb0xvWXZzU2t6?=
 =?utf-8?B?TWs2azBIVVNkOUc2cERlYWNnVG1Jc0NxdWoxbDVIQjROVDZ4V0RtWUtrSFF5?=
 =?utf-8?B?Q3F4cHQ0bm1Ua1d0R3FBVzVnQXdiMTBiODJkczAwNFpOa1c0dmhVdkJuc1Z2?=
 =?utf-8?B?WG1iaVM1WDlWVUo3WlR4QUIyN0hiWmEraDZwZTRRQXVPb2NVdXNNUmcyOUFm?=
 =?utf-8?B?YTMxZGczQzdUaCtLeEYvajhLM2ZjS21nS0VxYzhZNUt3bWlaY0l0TjFJTnow?=
 =?utf-8?B?Y1dGaEVGQlhiNU9ROHd0VjlsbEJnRDhQZnYybmdxbUNkQ3ZUdHdkTlM1TTA4?=
 =?utf-8?B?VjlyNkdZZ0FYQVpvcndEVGl5RkVWdGNuN2xidkdTOEF3b29iU2EzTmc1UnZ3?=
 =?utf-8?B?VjdaQk5KTTNZZXY1VllCWXdFREpCU3pJSWN4TDMzeUxTUkRZK1krdWpGYTZk?=
 =?utf-8?Q?e5ziE1A4mPX1Wpb+CDRqnLyBJ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	P2TFE3D321w3NN5Jzjo1NBjEHYgBnhsAzfX+kkm524Y7PnGoQGHI99QOu3nGEV2xE5KK7h1izSLgIp8tvx0/7DMVxl00qKWzZr+BiKBLRjnIO0sqhCk8ujxqXps8U5vc2FLXhk08EvYSg8dBiw93GosF/i2oyBYogcg9WfJtL8sahCsqIHtHe8yV3FA4A/z3EtjC4DEv4HL4Xo4gZScvYBA39jVnkuh64dJ29XovyIhWIw7KgrXCnzD5QkQBD+f8V8amvzHsvFNeN/uwOKm7MpUuKWzWMwOCZmZ68yJHLOfkO+CF/uBezoVg/+dT2I3yPYzPFHdzt0obYgTfyVixKPtt5PyIl+BgbhMoNq2eMk+WPiTB3hhLrfLbsK8EKQ2pazYt4uKMamw8oKay7oUY4w6xAlfcjLARpMdG9SxZ4PF+Xib99HHrcw6z6beGcMCLnErzVp/HTKh1YqT3LqsWGcPHPHfMX4d1zA8ucbVzFzZsWgCdZMNcgO3WS/bh2ehi3e9LDp1dfGDS2VKx/2EtXtrMEXap3N6XxnuyGlBLPOKWZr0HY+R+uaewOOcQtkk2DJfGVSpISzFJKFHbcxE3uAbjftM+aNFaNbX8quE8Gqg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d6b191-1ce5-4889-602a-08ddb8207e63
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 21:53:05.7475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7IYP5X9Uu07wcgWm+RehN5abjfYaroODEcMYoMEb8mxUkhEBYtnxDPipdZmr5fuCRKpksRtEMGMbv+Mtsbdrbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4506
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506300179
X-Proofpoint-GUID: 1kZteQQ5b4-LAF-cQ9daujOFIWcTlBQc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE4MCBTYWx0ZWRfX8gYwMLrIFQ9r vDwjClQDS1raKsOTFi0b4Ij84jkCa2E5ar+Jqf0u7nQREJ75sWPpzDGklYDIxkO39kX2strWawQ Q0LcJ/a0MpAt32BzTCQosc7DPxsXbLzC9YWJFuSBHHPbNH8MLdv5zoOIORQ3LWQ21fECf45ATh8
 Xmw0Xi3YYjhIqbOkO361TMwcIgztI9PtVi0DWdYqTdI4vSF3FF1XrQmTeVkRUJl1B1dELBuTXbo y1NNLFDwq0HynXpAb8O3Ke0mrXcv1LRVAjt359lzNga6bZTMwbdT2Fs45RfaF8rHObstzmAVvrJ nu7axUnf+lsPZnbx/F0wn+nHjxCnZDa7H08s4Yxz/lFw3UO/GDir6bhVCVBWvU+jN48zMuGZAlY
 ztNtqYG/28ZltwS8SPXHcEsVJRsQBU1Cb/X/b7ZFPt1iczEmkgGjG5Petn3XEIU0AbzT+iX8
X-Authority-Analysis: v=2.4 cv=D6hHKuRj c=1 sm=1 tr=0 ts=68630745 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ydeH1UXThzSiW_fNc-wA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 1kZteQQ5b4-LAF-cQ9daujOFIWcTlBQc

I would expect a patch like this to have a test to checks the behavior.

On 6/24/25 17:40, Kris Van Hees via DTrace-devel wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libcommon/usdt_parser_notes.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/libcommon/usdt_parser_notes.c b/libcommon/usdt_parser_notes.c
> index fb57f119..d3d744fb 100644
> --- a/libcommon/usdt_parser_notes.c
> +++ b/libcommon/usdt_parser_notes.c
> @@ -471,6 +471,23 @@ parse_usdt_note(int out, dof_helper_t *dhp, usdt_data_t *data,
>   	}
>   	prbt.off = off;
>   
> +	/*
> +	 * If the probe name has encoded hyphens, perform in-place changing
> +	 * from "__" into "-".
> +	 */
> +	if (strstr(prbt.prb, "__") != NULL) {
> +		char		*q;
> +		const char	*s = prbt.prb, *e = p;
> +
> +		for (q = (char *)s; s < e; s++, q++) {
> +			if (s[0] == '_' && s[1] == '_') {
> +				*q = '-';
> +				s++;
> +			} else if (s > q)
> +				*q = *s;
> +		}
> +	}
> +
>   	if ((prp = dt_htab_lookup(prbmap, &prbt)) == NULL) {
>   		if ((prp = malloc(sizeof(dt_probe_t))) == NULL) {
>   			usdt_error(out, ENOMEM, "Failed to allocate probe");
