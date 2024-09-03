Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D8E190482
	for <dtrace@lists.linux.dev>; Tue,  3 Sep 2024 17:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725385676; cv=fail; b=p0gX5q/hotT+hOZSo4JP7MuBzpsnFPXY8jHXme5/jt0L1V/xHPb/zsM8U6w74oL227NkfHQSdOFof43xDkwDNQ/ifwuvvVJ3JrZAVTHkcrAobZySZBHdxa2VSlGNze6lR2/wCE0+1nBeF6Ql70I6mjoSKEgLUNCFCS/rMyqdgZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725385676; c=relaxed/simple;
	bh=wYLpFzHeZ+GfYK80tc3j3lFHJQtm+AURs8WjgI2slAg=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RqD35JgFiI9GP/xSs6sX1V/WODAq06kBtXovB2M/RsSCP9cG1RBZk0VTF2w3WL/w4wiRdSEkjU5/IY0s61iPXuQ60l9FLqK4mzAvejSdDXVWNzY22YAxZEmvUycmT023g5UkzqPgppuuwSmir8GK+CP6jf8tyqOS4zsjYoC8jr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FtORjatS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ByfUCu/e; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FtORjatS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ByfUCu/e"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483GtS3b011246
	for <dtrace@lists.linux.dev>; Tue, 3 Sep 2024 17:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:from:to:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=nQ27Wna6cZX0Re0EERJomqiA8/JJyV+bQHvSHmlhYOU=; b=
	FtORjatSggV1iftqDJxMz+/bagzdbcSLo/BLurvniwYDqqc/1DKwVI5cJ4klA6pM
	0UXBevZWJ0EC/ARi/x+6HYnulwa88UJUyMD8Dq2wkqsaM6VUg5eg4/b20BDfper6
	/epqGaUuOVkWnd26egO003rBunTezEJW4A715CY0NE5Yj5CCOPTGhsq4cMsGN/Mp
	F4shLQwBFIGZ/PoZGG2L2c/Bk/2gy9tIeWkCB2xltrQOgvKZjN+dwAIPIKgpKQ5A
	b7VQtojKAWQdpQyorBxoRrCbj47mtbgHiWyTanPLUvOiRaBfecSVCqMRFstw3zbf
	V9f/VXTzV2zrKk6hy3Hr1A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41dk84j879-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Sep 2024 17:47:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 483HSp79036718
	for <dtrace@lists.linux.dev>; Tue, 3 Sep 2024 17:47:51 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2173.outbound.protection.outlook.com [104.47.73.173])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41bsm91hc2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Sep 2024 17:47:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gItC0BsXHXqJ77TQoK0oqldt3ihezsf2xakleur3gYkjgm/N2j7zR/3mDikRUpcPENJ+zZxcrmsdzmX1Mv0XzNCXgtUv1SfW6qe0PI+d2lXHNfX1Y6KDT0Pr1pfqTAUIhXVNLhdR2yXe9kabSsX10kfA4/H5BqGEwFTNEH8HDrrNELiSRY9AzPA4yJiCGH7l/f8S2XikjIwnVpl7EjeSU+/gq2c3JBI6B+gOp2gAH1IzWlInpkbqFXj5XYHw/mgM9E6QwpWtQtRLQLzy2XJcA4AzRxvHF2XeMhildEEga9Q33CHisTpT9GgGRjND2ZrQBrNDj6CkOJum0McrSZYJcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQ27Wna6cZX0Re0EERJomqiA8/JJyV+bQHvSHmlhYOU=;
 b=cUojZGLoqhgdoc7xaCK7ls+YlBoUR34M8gBrfzjLHfXRO6hE0N2gwo7F7z29VSGvERQeputcDUCIBvAdB/BlVdsL09LkwOh+19CYvgo+TviawZbkda/lsAo5j289xnfGBFLF4LRUVYLHmsxpZrJ88WwVj4ADMlgGK5kAQHe+xiWCXjUPaHQouiHw1NO7T0fhQDZv4eeQn8k+B/LPXqfUeJ+0Z312IGX7eOYBVG6RmIAtnF5PhiL7BPn9y913dcEgL6Inx8GGIcCUFC1ZjzCORlUEfLJeoEtGaupfvHjCeLdUOTL2HlB2cC7Jq/XiEu/uRHSsZ+VwpSel/RagrcUbyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQ27Wna6cZX0Re0EERJomqiA8/JJyV+bQHvSHmlhYOU=;
 b=ByfUCu/e1EDV0D9KlJddage2DF4vN3Qyrh5ZijKoeQJv9YVV7UL9njK32WftSpEXdl3/OHxOvloWdoUjxwMyvA2gBmbxFo2BtnPn+wWW//qTleQz95OAqy5OEa7+MjycXzEIcMXr159ryU8paiUDQMYyqwIsQzrq0aFvWT9CJ5M=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA1PR10MB7814.namprd10.prod.outlook.com (2603:10b6:806:3a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.14; Tue, 3 Sep
 2024 17:47:48 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7939.010; Tue, 3 Sep 2024
 17:47:48 +0000
Message-ID: <836e815b-37f3-1313-2796-60e42f7300f2@oracle.com>
Date: Tue, 3 Sep 2024 13:47:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 04/19] Eliminate dt_pdesc
Content-Language: en-US
From: Eugene Loh <eugene.loh@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240829052558.3525-1-eugene.loh@oracle.com>
 <20240829052558.3525-4-eugene.loh@oracle.com>
In-Reply-To: <20240829052558.3525-4-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0049.namprd03.prod.outlook.com
 (2603:10b6:408:fb::24) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA1PR10MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: 92fa0585-800b-4013-6444-08dccc40869b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkxlVWF0L1RVMGhGVWgvODBjVnZIMlRuR2lucnp6TStoSnhtZTEzakhzMGNo?=
 =?utf-8?B?TEY3aGFzVHY0SmNHbFplcWgvRTh4MzdVYlJsVGx5aS9DclByWlQxNlYvN0Vm?=
 =?utf-8?B?dmo4M3ZIVklUMllzWnhLL3J2cVdEcHA2bmVMaXYzQnlYYy8rK0NaWUJBeGw1?=
 =?utf-8?B?MVMzcXRkamZoSWVLaFdhZU5meFFXcHlSc1dYZzVSNUJuOHNFaVUvWW9yUmxw?=
 =?utf-8?B?ZUlDL1BRajRHLzhMVmlmb01BSjhFSy9DNHZ4NWJiTGdRbkFSM3o2YzhGYVhu?=
 =?utf-8?B?WVZjUFpqQ3VNMnZIc3FjUzBkdnBzM2NQdnNyZ0dleDlQNXNoQklmbDRKTXdl?=
 =?utf-8?B?K1JCeEdPTWtMaStYZTVlYXh4WUh6Tm1kanFNREVBcllLN2NLRGNqVDVhTTF2?=
 =?utf-8?B?R2o0dk9CdTkyQXViUkR1dm5CdkJLVWFxeDMrc21XcW1TV1JuNU92Mk1QSThv?=
 =?utf-8?B?eHFSOEdqMmp0d21XME16RlhLNStFRnU1UGFveXYvYlRFT0VYbVprN1ZPSVJJ?=
 =?utf-8?B?WUVrSXUzOTh4bDJmUU01R2tBeElIck12SzMyL00wVkVZT0tIOGd0SWM4ZGo1?=
 =?utf-8?B?dWpqMVZhdEVmbmVGcFoxSVZBN1VDRzdYd0QxYmx5QW44R2Z2WHBXM2xlQ2V3?=
 =?utf-8?B?WU5nZGFQT2Y5WGI1QW1lODI5bnV2V0VHNW5GMkhCbXQ3dEdORFZ1SnJ3ak5M?=
 =?utf-8?B?MXZ6d0lLY2JZUU4wajA4QVd3ZHNQVitCb2NvZzNFb3FhdGUzRmFEWEwyenpj?=
 =?utf-8?B?TExWaGVOc2tHWVhRM3EvK3N6YVB1SW9xNGNJU09MZlZocTNiazJJbUxCek5L?=
 =?utf-8?B?NjgrQ0c3SnJlM0dBRm9VRUtlYkRhaVl0cEpWK0VzV0QycU1DeG5TbVBxZlBP?=
 =?utf-8?B?YmJia3hNQ29BaC9OSS9yRmRJRVRkN1oybnhPTEpLamRnc2ZEY3U0WlNEbDVq?=
 =?utf-8?B?dVVHSmR5aU4za0h4WUdRNnI0VVBzQ2gvNCtpT3dEb2RjVXErb2hCTUxWbzNj?=
 =?utf-8?B?eE1la215RGtiejk0R1RycDI5bVZ6NlpxTlFPa2JWdWZHTkRkTXlIMXpscitF?=
 =?utf-8?B?TEFhRFJzSlA4djZRMlBxYkV4Zno5em5oWnJzcG5lNXJDSkVHd0hXWUNoSUkz?=
 =?utf-8?B?Y0JYV3JzZUY3bS9LZGdtMHpZeFhDbzhyVlMwK3o0WG9jdng3NzFFeG8wMFhI?=
 =?utf-8?B?aGR0R2ZpNkdLL0hwS0EzN2hXdXBEcjFqeVZwOUE4TGdMeFJlYXVmUXN2Tlhi?=
 =?utf-8?B?THE3SUJPcFVyVnlLNE5Vb3gxN3oyclZNZWxINlk0QWNqOGJQYVJuZEU1N0E5?=
 =?utf-8?B?SEVXemloSWJTWGlwMkxqbGNNaS9uMHZjbVFOZVRyZGxlSDZnUUJpZUV6WmhH?=
 =?utf-8?B?Zll5SEZzdnVPMWFXQ2tMSVJVZ0liYUVmTUZwVFQ4ZlptSnBsazlGL0UySE52?=
 =?utf-8?B?aVlrTjE1VG9jZWZWVnVJa21IRXNBS3FNY2JXTUl3TzdOclpGN0l1eFB6K2hu?=
 =?utf-8?B?c1BLL21uTWZaNm1xTXlHNnljMFp3cWpoV0loM0xaTy9hcXZRZDJyNTdQTmVW?=
 =?utf-8?B?SWl2YlhHSWQ3Zy9lUlZPKzRGV0dTSFRYRVZ5NUNiZGdlVkNMcVBNeGRURUU4?=
 =?utf-8?B?RTltODY5TTQ4MTZWTG5PMXdlR0F0aFNwRDNBT3hqbmJzRzBZbjI0VmUzUitI?=
 =?utf-8?B?dlhWa1I2aDBzRzc5enRqcTZvOVlLY0Z3R3hGUVIxdG44akRGRXZENlpqeDNz?=
 =?utf-8?B?d2tCTkRPeVdnRVI0eW9JdHU1K201S3ZsaDFONDY5WjExY3RmNzY3QTkrSDEr?=
 =?utf-8?B?Ry9LWEZEYUUvUEtEZWVxQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnBUdHJCVUJzeDg0VEJ4VnRNbnFwSUd4VEVMUzU4SndmeWREOVo0NmQ2Qytp?=
 =?utf-8?B?NWRkcGliMUl3dDlsL0kvc0RZV0NFUXAycTZLN1R5UTFGVEJUS1NjTkU0ckYr?=
 =?utf-8?B?SVA2K0dXWEdORFFRSEd6SEJDUXI3RUF2SVRTNWRGL1NyekZNenZLcTV5dnNo?=
 =?utf-8?B?S1l1b3RXaVlHZFN1UVI5aUp2MDVzQUEwbi9HeGYzU29VdUdmeExuRzA0VEE0?=
 =?utf-8?B?NzZRZ213aUpZOGVjOENMTGlsYmZadVFyWDBDaGthQU55VXRpTGlvVWZuNExQ?=
 =?utf-8?B?MVByeGs3SUJnbkxuSm9zWmhiRXBtd1ZoM2NlM1d3b2VORG1kbmtFQkFucjJT?=
 =?utf-8?B?RHRWYkxwS3ZvMDVOZ2lJZjlVazF5U1E0cHFaQ3IwdFJhMHBXZjlYVzZ3b05S?=
 =?utf-8?B?T0ZvMWRzUmlSN3dWa0lmV1BST1E3bkNmM1lPNmJyNVJqMXBKcFZvNmlYYjZl?=
 =?utf-8?B?VzcrY01rMWx3dEZVRmNsR29sUW5CMzRFUlNKUm9hVEsxSFJQVDZaSnlQTjJu?=
 =?utf-8?B?bFBveGM5V3IzNHZYVVg3akFzRVZJc2t6bDlqQzNuTUwvMHZxYzNCdDY0Vm9q?=
 =?utf-8?B?MUJmL01hdFdJZDMxRkh0OGtSUFlHb2c0bHduQUsyQ1EyVGlObVpRRTJxWXA5?=
 =?utf-8?B?ZzQ3aVpvK2hzSHBaNEIybmRXODlSeW13QkVncG9ZQWtWL3pMU0dVUFZRNUVN?=
 =?utf-8?B?ZGM5aWJwUHBmcVphSmp4RDVYSlFhOGwxS3hYRzVhekkyZWswZEVFbUhZR29N?=
 =?utf-8?B?VURlbW9qcm1WNm1sL3ZBQlFuVU9ZdGMwUnQrTElEMkk0SnhYQlRvRm9WREV0?=
 =?utf-8?B?dzVmSU1uUEE4M1d2TkVudUlIOTFsZEZJc28rcHhRWjVrUm1TYUVPOHpucnAz?=
 =?utf-8?B?NkVmME96ZDRwQ2M3bjl6dmptSk0xaVF4ZWFYU1BMTG11eTZ3ejkyMStUZGNw?=
 =?utf-8?B?YkRwQWo1Ym41UVRjb3VxV2FRYXl2SzlCT2krQjVUV2hxMjVrbGJOcGNDM3hW?=
 =?utf-8?B?NnJPRFN4U2ppR2hWcmE2OUsrbkN0clZUL3ZUSFVqSGpoNGpIOEtncWw1SEN3?=
 =?utf-8?B?c3BqUlpya0VtbEZzU0RMK21ML0E0NHFobE4rSFh6a3d1N1Z2Um54TGlhY1pj?=
 =?utf-8?B?S2k0STJ3c2VWZnFqY0lGMzkzUnhhNTQ1OEpwQ2F4dEtROWQyb2NFU3FoazYz?=
 =?utf-8?B?Mk9xNHR2TVVkU2hpVk9KNXo3SkM1T0pSZG5PVEQzMjZKdlltdS9taUhBOTl1?=
 =?utf-8?B?eTNSZ2NKUUlyM1JnRWswK1VQRGlJZkJ2b1JvZkcyZlJVSlg0SitaQlAvYzcy?=
 =?utf-8?B?Mk1YaWRYZEFKV3Ryem5pUlIxWG9CbXdtQW12SlpvMjJGM3g1cTNrRFZUaTVM?=
 =?utf-8?B?ZUlibStXOVpicWg5ZVNoOW1ZUnk5NmlCNjduaGtSMkxiVzUrMlR2QnlBWHRl?=
 =?utf-8?B?YTJFcXk2TGhlT3l3OGFpTUVEWnRjeWNKWXo0ZWw2MnIvNnpHa1BmMnRPd2FO?=
 =?utf-8?B?b29vRXgyU2t0b3FmNFBpZ0Z1QzQzbTNPUDUrMnhFOHpvdFlRNGJrckp4czA1?=
 =?utf-8?B?a2lTUWV6VWR6S2s1ZDhDcU0rakxQZlBzM1NjNDlMYVhmTkRGbzZ5TUhRM2F3?=
 =?utf-8?B?c2YyNUZzMEtJdnhpS0xWb045eUFaOWdWcnNaU28vd2x1a0hlMWJzNEswOFF6?=
 =?utf-8?B?eDU4ZmQ5MkdzLzlINDRkWHJ5bWhBVWpQT2ticU8rM21pcUNYRXdVWnJ4a1NI?=
 =?utf-8?B?QjQ1anlZelQ5cXZ1UXBYcW8zVnVqTVphdldvZHRQemRsNWtqWlE3L3dDU25W?=
 =?utf-8?B?WlI1aGJZanVkbEtReVhTZm5EVEdVM2NPTmtya1FuaWFFWDkzZ2sxb05KM2Iy?=
 =?utf-8?B?S0hvZGkzQm9iNlNYYVVJcXR0bXFxb2RuSnBXdjJKdUxrOUU5bXgvY2p1TkJL?=
 =?utf-8?B?VkJ1bzQvZm9uYTdOUmozN0h1SHk5bFg4RXp2Q1dhZWs5SEZVSS83SjlxaTg2?=
 =?utf-8?B?NHgwdW9iNDJ2WEs0MTJ2ckN2UGZkR2JJWHBEcU5IWXpZZi8xaDVwOTJUbkt1?=
 =?utf-8?B?UDZaV0prdDVwcXdtWDFybG5yTCs4ME52MkFKcEJranFmVml4aUZ2eG9yN1dk?=
 =?utf-8?Q?x+jb260aJNYg1zq7eLd88L6Ue?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	S93oYLliTM5zcNQqaSVhqwyABLldopvNzQRYP/B/7H+zrVFPdQTysb9iU4HcvUPH04sO72OGmaKhX7x9avVdA1QBQYLe/gwMjfI/w4NGMb80si0SeQlwcAK+upyM2I4Z5JyB/AptEs7SHWG1Qx9/x6KECTeRgeqgswYE/ElBPsv4VIrrtRJBSzoD9h8qiRoIAXtv8nFstlG//9XyhRo0S5pT4l7WbWTjuMXgAaSxjNzfowTzxSFlO5uxvLQnvG7nwLWliaXKzMAqC8DdiMX1p9Uh24h/7TBVB60I+Xv4+Myp5m/frSxTAiLQiWANj+3UoevWtMmkcIkfQBt8IPMFqpvXkn1IDYSCKRgq0EfttsOMeNr5MgqRYJQ+PGS74OpRHA4f7rGxqRIIWz9FLXMfJXAIuygdkQqS6UFS4e1rX1Z1PUk1+aTMskY+CJSx0hnHcCk0Yik0jW/hngVMXDHr9atDM6AJUv9nH0nJPUM8qvUP6m1pYOkluP1ovVx+M3uHSS4rm9P9Tw483E3UdQoCGWA0qwqz1h1AEu7e3YnybdQKrVYouYlCWWaI4L27W4+TUz5+crI4svSZ5j9Gn2Y3mZU/lPRfwtmK5eUKJlB0qYI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92fa0585-800b-4013-6444-08dccc40869b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 17:47:48.9327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z6AbzUTtbFVSVDINbJ1TRiQ+rVTtb9xtpOzFYc7v+xV5e5TCoqypeWnd4Bxl933zLrEOjbaEBy8+IqBYVMHtNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7814
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_05,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2409030143
X-Proofpoint-GUID: ANHaThXHSmL95ayqZZ-G49vQjcrpXUKc
X-Proofpoint-ORIG-GUID: ANHaThXHSmL95ayqZZ-G49vQjcrpXUKc

Patch withdrawn.  It's been squashed into v2 03/19.

On 8/29/24 01:25, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
>
> The probe descriptions dt_pdesc are superfluous and are
> eliminated here.
>
> Consequently, we also no longer need the last args to
>      dt_epid_add()
>      dt_epid_lookup()
>
> Nor so we need to track prid in dt_link_construct().
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>   libdtrace/dt_cc.c      |  8 +-------
>   libdtrace/dt_consume.c |  3 +--
>   libdtrace/dt_handle.c  |  2 +-
>   libdtrace/dt_impl.h    |  7 ++-----
>   libdtrace/dt_map.c     | 33 ++++++---------------------------
>   5 files changed, 11 insertions(+), 42 deletions(-)
>
> diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
> index cf3c5504..e66d76fb 100644
> --- a/libdtrace/dt_cc.c
> +++ b/libdtrace/dt_cc.c
> @@ -959,7 +959,6 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
>   	uint_t			len = sdp->dtdo_brelen;
>   	const dof_relodesc_t	*rp = sdp->dtdo_breltab;
>   	dof_relodesc_t		*nrp = &dp->dtdo_breltab[rc];
> -	dtrace_id_t		prid = prp->desc->id;
>   	int			no_deps = 0;
>   
>   	if (idp != NULL) {
> @@ -1197,11 +1196,6 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
>   			case DT_CONST_STACK_SKIP:
>   				nrp->dofr_data = prp->prov->impl->stack_skip;
>   				continue;
> -			default:
> -				/* probe name -> value is probe id */
> -				if (strchr(idp->di_name, ':') != NULL)
> -					prid = rp->dofr_data;
> -				continue;
>   			}
>   
>   			continue;
> @@ -1218,7 +1212,7 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
>   			if (rdp == NULL)
>   				return -1;
>   			if (rdp->dtdo_ddesc != NULL) {
> -				nepid = dt_epid_add(dtp, rdp->dtdo_ddesc, prid);
> +				nepid = dt_epid_add(dtp, rdp->dtdo_ddesc);
>   				clid++;
>   			} else
>   				nepid = 0;
> diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> index e3ce2d3b..88083b19 100644
> --- a/libdtrace/dt_consume.c
> +++ b/libdtrace/dt_consume.c
> @@ -2211,8 +2211,7 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
>   	pdat->dtpda_epid = epid;
>   	pdat->dtpda_data = data;
>   
> -	rval = dt_epid_lookup(dtp, epid, &pdat->dtpda_ddesc,
> -					 &pdat->dtpda_pdesc);
> +	rval = dt_epid_lookup(dtp, epid, &pdat->dtpda_ddesc);
>   	if (rval != 0)
>   		return dt_set_errno(dtp, EDT_BADEPID);
>   	pdat->dtpda_pdesc = (dtrace_probedesc_t *)dtp->dt_probes[prid]->desc;
> diff --git a/libdtrace/dt_handle.c b/libdtrace/dt_handle.c
> index b1ba5f9f..79ecbac8 100644
> --- a/libdtrace/dt_handle.c
> +++ b/libdtrace/dt_handle.c
> @@ -150,7 +150,7 @@ dt_handle_err(dtrace_hdl_t *dtp, dtrace_probedata_t *data)
>   	 */
>   	epid = DT_REC(uint64_t, 0);
>   
> -	if (dt_epid_lookup(dtp, epid, &errdd, &errpd) != 0)
> +	if (dt_epid_lookup(dtp, epid, &errdd) != 0)
>   		return dt_set_errno(dtp, EDT_BADERROR);
>   	errpd = (dtrace_probedesc_t *)dtp->dt_probes[epid>>32]->desc;
>   	err.dteda_ddesc = errdd;
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index a2ae84f6..c2b18b0b 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -345,7 +345,6 @@ struct dtrace_hdl {
>   	dtrace_epid_t dt_nextepid; /* next enabled probe ID to assign */
>   	size_t dt_maxprobe;	/* max enabled probe ID */
>   	dtrace_datadesc_t **dt_ddesc; /* probe data descriptions */
> -	dtrace_probedesc_t **dt_pdesc; /* probe descriptions for enabled prbs */
>   	size_t dt_maxagg;	/* max aggregation ID */
>   	dtrace_aggdesc_t **dt_adesc; /* aggregation descriptions */
>   	struct dt_aggregate *dt_aggregate; /* aggregate */
> @@ -774,10 +773,8 @@ extern dtrace_datadesc_t *dt_datadesc_hold(dtrace_datadesc_t *ddp);
>   extern void dt_datadesc_release(dtrace_hdl_t *, dtrace_datadesc_t *);
>   extern dtrace_datadesc_t *dt_datadesc_create(dtrace_hdl_t *);
>   extern int dt_datadesc_finalize(dtrace_hdl_t *, dtrace_datadesc_t *);
> -extern dtrace_epid_t dt_epid_add(dtrace_hdl_t *, dtrace_datadesc_t *,
> -				 dtrace_id_t);
> -extern int dt_epid_lookup(dtrace_hdl_t *, dtrace_epid_t, dtrace_datadesc_t **,
> -			  dtrace_probedesc_t **);
> +extern dtrace_epid_t dt_epid_add(dtrace_hdl_t *, dtrace_datadesc_t *);
> +extern int dt_epid_lookup(dtrace_hdl_t *, dtrace_epid_t, dtrace_datadesc_t **);
>   extern void dt_epid_destroy(dtrace_hdl_t *);
>   typedef void (*dt_cg_gap_f)(dt_pcb_t *, int);
>   extern uint32_t dt_rec_add(dtrace_hdl_t *, dt_cg_gap_f, dtrace_actkind_t,
> diff --git a/libdtrace/dt_map.c b/libdtrace/dt_map.c
> index 87ce5707..9011da5d 100644
> --- a/libdtrace/dt_map.c
> +++ b/libdtrace/dt_map.c
> @@ -92,7 +92,7 @@ dt_datadesc_finalize(dtrace_hdl_t *dtp, dtrace_datadesc_t *ddp)
>    * description.
>    */
>   dtrace_epid_t
> -dt_epid_add(dtrace_hdl_t *dtp, dtrace_datadesc_t *ddp, dtrace_id_t prid)
> +dt_epid_add(dtrace_hdl_t *dtp, dtrace_datadesc_t *ddp)
>   {
>   	dtrace_id_t	max = dtp->dt_maxprobe;
>   	dtrace_epid_t	epid;
> @@ -101,27 +101,19 @@ dt_epid_add(dtrace_hdl_t *dtp, dtrace_datadesc_t *ddp, dtrace_id_t prid)
>   	if (epid >= max || dtp->dt_ddesc == NULL) {
>   		dtrace_id_t		nmax = max ? (max << 1) : 2;
>   		dtrace_datadesc_t	**nddesc;
> -		dtrace_probedesc_t	**npdesc;
>   
>   		nddesc = dt_calloc(dtp, nmax, sizeof(void *));
> -		npdesc = dt_calloc(dtp, nmax, sizeof(void *));
> -		if (nddesc == NULL || npdesc == NULL) {
> -			dt_free(dtp, nddesc);
> -			dt_free(dtp, npdesc);
> +		if (nddesc == NULL)
>   			return dt_set_errno(dtp, EDT_NOMEM);
> -		}
>   
>   		if (dtp->dt_ddesc != NULL) {
>   			size_t	osize = max * sizeof(void *);
>   
>   			memcpy(nddesc, dtp->dt_ddesc, osize);
>   			dt_free(dtp, dtp->dt_ddesc);
> -			memcpy(npdesc, dtp->dt_pdesc, osize);
> -			dt_free(dtp, dtp->dt_pdesc);
>   		}
>   
>   		dtp->dt_ddesc = nddesc;
> -		dtp->dt_pdesc = npdesc;
>   		dtp->dt_maxprobe = nmax;
>   	}
>   
> @@ -129,14 +121,12 @@ dt_epid_add(dtrace_hdl_t *dtp, dtrace_datadesc_t *ddp, dtrace_id_t prid)
>   		return epid;
>   
>   	dtp->dt_ddesc[epid] = dt_datadesc_hold(ddp);
> -	dtp->dt_pdesc[epid] = (dtrace_probedesc_t *)dtp->dt_probes[prid]->desc;
>   
>   	return epid;
>   }
>   
>   int
> -dt_epid_lookup(dtrace_hdl_t *dtp, dtrace_epid_t epid, dtrace_datadesc_t **ddp,
> -	       dtrace_probedesc_t **pdp)
> +dt_epid_lookup(dtrace_hdl_t *dtp, dtrace_epid_t epid, dtrace_datadesc_t **ddp)
>   {
>   	/* Remove the PRID portion of the EPID. */
>   	epid &= 0xffffffff;
> @@ -146,7 +136,6 @@ dt_epid_lookup(dtrace_hdl_t *dtp, dtrace_epid_t epid, dtrace_datadesc_t **ddp,
>   
>   	dtrace_difo_t *rdp = dt_dlib_get_func_difo(dtp, dtp->dt_stmts[epid]->dtsd_clause);
>   	*ddp = dt_datadesc_hold(rdp->dtdo_ddesc);             // FIXME what releases the hold?
> -	*pdp = dtp->dt_pdesc[epid];
>   
>   	return (*ddp == NULL) ? -1 : 0;
>   }
> @@ -156,26 +145,16 @@ dt_epid_destroy(dtrace_hdl_t *dtp)
>   {
>   	size_t i;
>   
> -	assert((dtp->dt_pdesc != NULL && dtp->dt_ddesc != NULL &&
> -	    dtp->dt_maxprobe > 0) || (dtp->dt_pdesc == NULL &&
> -	    dtp->dt_ddesc == NULL && dtp->dt_maxprobe == 0));
> -
> -	if (dtp->dt_pdesc == NULL)
> -		return;
> +	assert((dtp->dt_ddesc != NULL && dtp->dt_maxprobe > 0) ||
> +	       (dtp->dt_ddesc == NULL && dtp->dt_maxprobe == 0));
>   
>   	for (i = 0; i < dtp->dt_maxprobe; i++) {
> -		if (dtp->dt_ddesc[i] == NULL) {
> -			assert(dtp->dt_pdesc[i] == NULL);
> +		if (dtp->dt_ddesc[i] == NULL)
>   			continue;
> -		}
>   
>   		dt_datadesc_release(dtp, dtp->dt_ddesc[i]);
> -		assert(dtp->dt_pdesc[i] != NULL);
>   	}
>   
> -	free(dtp->dt_pdesc);
> -	dtp->dt_pdesc = NULL;
> -
>   	free(dtp->dt_ddesc);
>   	dtp->dt_ddesc = NULL;
>   	dtp->dt_nextepid = 0;
