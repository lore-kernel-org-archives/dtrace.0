Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C8837F72C
	for <dtrace@lists.linux.dev>; Wed,  4 Mar 2026 08:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772612735; cv=fail; b=LWq74ufvEqFDs4v7jjzfAvmHWv6xgXK6LMFUc4KMgY/AEFFrTXiTZPXD+vcxfzD/Es34CtH34RFzHb0YGt3NekuppGeVydo5P10jontUl16fEDkhSvEIlBwdh5Sokjf1MJaiagWwST8ccddAugokVcd0su2GJqWI0hNX/99a0nE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772612735; c=relaxed/simple;
	bh=bQs9FH0Vx80PcPjvkFIa1A/g/nre6wt/FXSi1RMaAzg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Y2NEr3T2cZ4lUixk7vg8Ag4cTMhlNDoLIlA6ni7B1lTYpBMXNB32vvshvewAPv+OPp/cxSqpa58/IVS/EbSe4Av4i1am5f4K0ThS5EeOIai/XyDDP0QNw6s6rCuYZLDzbAzD551lACpA6Ex+0owi9AM96u4OP/QSnriH7ti3XJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lvmA/+9i; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tzqtgCwY; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lvmA/+9i";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tzqtgCwY"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62483BHL2336783
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=nnegvsp0MFEz0rTIfDlSqwD8N5N0Kgx+OgDVDNNXFJc=; b=
	lvmA/+9iL/SsibsAzYmPYde6/gTzd3eigq7Uuc04y4J1mbRapRG8deMN/CngxhhO
	aKjylDXXhNrVqwvUuebufJ2jSHM/QUYUQqC08DC+JTgH9Tlhu7f3VrzF/CGu6jst
	IhP8RwOGMBCAT3EWKM4RNEIbTNWxAy33KUJAwByjNoKaaPrjQkKy8fR3QNBrNfkL
	XdM3PqXvT/TqPj8BJUaieI9Hm8fTprcY+AMnp8f7/Y1JAluaGXWr5QcR+XcwNqkD
	Qn/31UzExfZS7bn9Tlt2bbM86VhGQra35MKbYEqIb/mLgMGAzGZsO7QiI58aEUa9
	3dpCNzwCmTit92Xn5mH8TA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cpgvy01dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 08:25:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62476fer029717
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 08:25:31 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012027.outbound.protection.outlook.com [52.101.43.27])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ckptbfu4f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 08:25:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cdlXAR+cKYhbGWWdzOivDBcoGpjjX6gFJppwMrB/XeqiC7pkoiPfru5LkcOhPRnMRYbrPb3alHk292ocb7pXdXfUftM6mzZ4n8pyo9KWS2sLixBy9jzZYplNRDhUbFgWtvbGnjEFmCX6Xpx1ODWH2G1eEg8KByqB866nG98YIb9FxBLP7Pd+MhJGsM/7AufXPjeuvk3vGNSmOFU1Df1y1AHWy0EKNJM60znz+8qxG7y64T23kxK0JbYL5Y/+XtfyCaIf77ZZlY1oczKzF+F2pEjPrMSvBUVrxKvxV1+OWWVZ0acy9s/KcOe3tofXS0Shk1GfRBIomVTXSFaatHdJTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnegvsp0MFEz0rTIfDlSqwD8N5N0Kgx+OgDVDNNXFJc=;
 b=IAiABgDa3n4245Abd4Jf0aSN1JzNOyJWI9qafSVw7upi/cLZ2Xi9yU1WmD+1eRKrj+Tt+qJiJYQBdDBIXs1dmwr/LhDxWEI8uNPV2/KkLo3dBE8PdQgPa/VNpD7CyZP9SZ9rzQd/z/EjrOmxM0Okkg1IDtT9aZSBNsMI6x5AMoJ997c48+HBBSKAudaHm8+qbIWRlq28l5V2YpyBx+8szDhTNYzi/HH8fvIM1UNnYTwSgyWo7fNYqOtyTIZdYrKO76zvkvFrueTyj4Kszt6RAWWXkbAdKsIZUlY7QvWNkvc202NKPv2nydch45VuBaFKgBGzrZ2abahiDo6EgDOUtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnegvsp0MFEz0rTIfDlSqwD8N5N0Kgx+OgDVDNNXFJc=;
 b=tzqtgCwYXlkwcTNZagFU3/XQiZCVKgfQ2/Jp8bb8CB26VCl+UfkXeV30+JT1BufSfhFGjuOWzG9t3eMwrNmVaoS5S7IdCKPRZ874TbWJeUBLmMVrkkAh5NKXA5djW3E+EXiV5cQSMD5PNdTu91XkZqt+5IxRpVYsmBO8shqiFbg=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 PH0PR10MB4504.namprd10.prod.outlook.com (2603:10b6:510:42::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.22; Wed, 4 Mar 2026 08:25:28 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::3292:21a0:97be:4836]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::3292:21a0:97be:4836%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 08:25:28 +0000
Message-ID: <f0a0cdd9-6ae6-4b6c-a3a1-960ad266be84@oracle.com>
Date: Wed, 4 Mar 2026 08:25:19 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/9] stapsdt provider: simple system-wide probing
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20260304080125.649031-1-alan.maguire@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <20260304080125.649031-1-alan.maguire@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0040.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::9) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|PH0PR10MB4504:EE_
X-MS-Office365-Filtering-Correlation-Id: e9155186-5435-4c57-aefc-08de79c79787
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	B9t2DnTVSEqe0l2IvHOb8Zhi1zlSRZlfuBcJ9dZW6WEFibGevl7rSjB0905o+au85Q/dJY+4FMRqkDrp+mUyVmdbDJujVI2Z6dVdSOfXlp4p61odJp0CYNw1V5seSgZKaOLNbnNaLm3A0TK4v8qj9VUWpmZbFuOeGB2lcZDxc72iz6SVmxjNVtJnrA9SY3TTOsREJ26kp651FcB91x50w2/0NhueT+nN0Ys8hikJ4AWvW8Gbur7bz0KiEOwJs6frSfBEXICsPhHQlhtK5Ca1ZnWYvZENKhcYIDYW1HpGfSkyyor8P2e4+eo9PfhRd1ND7oYzaXZ9TGbPvpm3YQNphz2l5O+C8P12PDRQNQlJ4EjGG4wWp++Ao/FnunmwXOp2cT9UThSmPpsengJpghKhR/hQlUQr7Ch3pid6ATeyQtM4kFW5DIDJXMnqMsd9MMxUpfFjKpzTziYRjourNsBvS0wFsQ4FWfUQLMBoFVqU4y+0FcGn7rnYv/z0+Qh5ZIlPRpiN9IcSnV66rLcd3Gt8wiNmyD8eEpABxKXc1pVMecgtZL89WWtvfrD6QPk6luDd9tXSNdmQYi0QEQGskzT+D6AvJvgK7kd/xbToGI7hsKqC816b8iQ9i7fuJWORHtT+aQBbut5P3MyLG0XtCNHNDfwVmlX5nteoicWqLHc0RrcXPeOvudJltvQ3Vd0Nckc5xs37/uZr0HZnfPFqQ9B7lZNnDbIdYm0DcSy5F3FcsI8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTdkY28yZitGYlk3Qkt1MnZJTmVSdzB1Ri9vNlBwc3ZZYTdSbHIvRFJYZkxC?=
 =?utf-8?B?djVNT3VVNk50TWc2VWJVazBUeDN2QkJkcXgyNG9LNlcxa1hQazRMeG53b0V6?=
 =?utf-8?B?cEdIMncraFpsbVN2U1JkdlRicU9LZmNpUU5BejZCSTVxTDZWTzhkeEFPZW0w?=
 =?utf-8?B?bGQxL1hEM1VRbmZBc1l0Mkd1SG5rMDE1VG9PVGwyUy9QY2wrU3FZNlc1UGFZ?=
 =?utf-8?B?TFNkdXIvY0QvZmxYR2llanBBaTlEVEJ1Mmdmazdqa1ZrMnZ1MndOdWNvTFFJ?=
 =?utf-8?B?QVRTUGdZeEVxN1FTZU5ocHo3NXZkZkVIYVY3a1lNR1JPelIrQVNGT1hRV2ZN?=
 =?utf-8?B?a25NaXZQRjdDWlhVMGlNVXhlK00yU1RsbjdyZ3FqWlA2Z085aXR1YXdOWWJ3?=
 =?utf-8?B?MUNuUWt2WW42RkhKbGRlMGVCak1XZTZCVFJxK0thcmpzWjl4clA1WXl4TFV5?=
 =?utf-8?B?eHdBQWh6K051ZzBSKzZQZlI2dXFkMkwyOHRwR3VGejV4MUIzelJpMFFrcFRr?=
 =?utf-8?B?KzIyTWI2dk5qaStnK1BXZVI5ZXdlaVZCQmN0NEhqdnRTbEF5OFJOR1U3SkJI?=
 =?utf-8?B?OXZrRlpoK1k1eFRYdDdseHl1WkRuMlA2b2UzQlpnVXEzZDRrVjFuVWNITDN4?=
 =?utf-8?B?Z290Z2hBQ3haNm9iZHlIL3JKd3pRaUZOZ1R4K0Y4Q1lNS1piSXFRUEZJSHF0?=
 =?utf-8?B?aTNpRmpsa2U0Y0FrSTVucnhvMS9oSW1OMmZMSUE3UlJoUDdJSGVkZ1hmWUZ1?=
 =?utf-8?B?NW1qOUVXZUg4VjBkbEpQWlJFVUxGQy9oU0VyT2tHcjdJVUNNZU1Sb3NvY21H?=
 =?utf-8?B?OXY1MHgyUlJkSmJKWTc1UnpPODdwWWprT0VxV1JFSVRHRjhuaTBTYXJkaCtR?=
 =?utf-8?B?SW9ZcnFiYS9iS1VKQTlZMFVlVDV3dFJDZUVERDN5eDhlWWZXVnZadElSdExV?=
 =?utf-8?B?eXYrYSthWVV6cVJTaTh6ekhuaTRsUjZ2a205dFZUV01OVkQyYnpNQ2Nxb0Jj?=
 =?utf-8?B?aURZRWVKZC8xUTVEMWJpY0VzckhUWTFzYzNNdC9qN0hGY1cyZVpIeFA3ZVZI?=
 =?utf-8?B?cG42VzY3ajBmdlQ3MGRZK3k1V2g0V2RXWVpBTWQrRkdTNGdEQnl5R3JtZnRu?=
 =?utf-8?B?ejRQR0dHLzk4MnoySTBKd1FDZis0c2JiaDVhbXpGdnJIU25rT2NBdk52SWFT?=
 =?utf-8?B?cUJjdUI3ak9MdHd1cFlNb3NRRVFHeFUvaUgxWmluL3M4alNNL25qVEVzZTRo?=
 =?utf-8?B?NWdiNVBRZ0lSZTFWRVAvUmk3dFZ6dW01OEYyTVc5dG1xbG5PSUFHakJaWmVx?=
 =?utf-8?B?YTNmQTRiZVRIdUV3VnB5cUFIVk1FRHpFWHI0NDdPRG5jcmxjYU9DckhUaHNZ?=
 =?utf-8?B?dFVibzR5K2ErMGFMT1BCM3doZ0JCeDFTVmRtempTNTdnSXFEZHd0VENqZjg4?=
 =?utf-8?B?cXFhRTVLVkFHdUY5Y2oxVGxJdW5uckJ3ZEdYbjNPcGtwdmNSelFlbXlRajFB?=
 =?utf-8?B?WXRReitHQnE4YVJlcXYzNVZzaXNNMjBLZUpQdEV6aGRQcjkzK3BiNFZzR2Vy?=
 =?utf-8?B?MzNqYjVjY3lETTZFQ1Q4LzUwMWhBdTcxVER6d3RENDBrVnJEWUh2UFIxaFZ3?=
 =?utf-8?B?NEQ0OGdGb3ZDdi93cjhucDVIbnI5SGdnZGtkbHBrUW54V0J6MlZwenJteHlX?=
 =?utf-8?B?ejBwSllrT0JnUDQ3Z251aC91eUNNTko0TTBlNTlVMnpaUnMwcll3cUYyRk5D?=
 =?utf-8?B?RWRjMElHc3I2eEhhdmQvUGlqSmV4ckNpSTQyaUpQZXZGNFJBVU9zaFdMSnRs?=
 =?utf-8?B?UXYyZFN3VmQvd1hNZzFHSmFadUJPcys3YWZHbmplbjBaVzRNd2FEVUM5QmU2?=
 =?utf-8?B?SXVIN2ZJQ2RZU1FJK2xSemZTb3NjSjg3SS9BSGIwcDMzVzhoOGVPcnJyUTdB?=
 =?utf-8?B?M2o4ZkpzYmwzOGI0cE5IdlNtcUlGTkFKWkczU2J3ZTVGTkRnakRySjZYWTA0?=
 =?utf-8?B?RjV0UitNa3FmSXFndDhWMjJ6MEtGM20relp4M0gvbjlpaituSEd1ckg5Mk5S?=
 =?utf-8?B?NCt5M21oOW9neVYxTzNPY0RmQmFaVEhETU5xS1pxNUJKYnp1c1RuOUt1RXRs?=
 =?utf-8?B?SEVGdHdnTTRkVnNzaEtsS0hjU2xiWDhuVlB2Z0pJcjhkNmRRTnhzaktaYXRp?=
 =?utf-8?B?c2NtTUh3MSt3YktZUkdTckJ4ckdQeHU1dCtYWlNpN3VPcXlRMm1wa1dndkFG?=
 =?utf-8?B?L2tHU2pxeTVVczdrUVQzZlV5ekVwVGZCaS94U3FqRWpRMVNuYWM4M1l6cG5p?=
 =?utf-8?B?R21ld2pCS3VFOHZXczhVMDdJTVBhT0R0QjI0cWh6dklDZXRwMU5HZz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FyEvnnBHGcsOl0FdcgFGVh9Dgm0b6VG7UnIpruSob2ErCUOkeG4WuL1e4brl9PijaYvMKazF6fYUpwB30nnT9BrjbV9O0+5oE10O3FxzMJVoi+r5hbEJjENHyaVhyliOFHGagDK368hRbp3pO7JkYRVYtDS7A0FpZxzWI3+cgCrFD9h/r4nBVpbF9JKl1No8i94kADLBpepY+ND2tDsCgsekOkcSDa8ukC9tbIzGrVmbE6+fu32qzdOeqxFMEwo1CwQD70DFXs+jMcuHjkMaFvTe0DImmAfa962rkk5ee5Ni1MCn9DxU91yDFMWh9kp5+anQCQmvbbxlgS79YVCWDO2gybxLkk0tp6mSsi+HwOah1FgIhCW0ioFLytX0e9PIest57J8kQlZmC0w0RKZExq7HQjeUZ1M6e75Awpsvjd6DhHlLaLiqcHoyRNfTuBqatWJN9olRtj+LLV31xJJYWTqXvklVqVXwGe7vZKNDFzVKfeuLBIRH6KFwQxabiasPm9O5C2Bh4pUBmMuVOMrGSy/KzsgFyC/HYMQjoNC6FCRl4zCiJ0nu6J9eXOrjYHaLjdV0zA/iTXAXjt9L9UFYlr2lSRv0sUpQt8+4TGwLogw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9155186-5435-4c57-aefc-08de79c79787
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 08:25:28.4148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NC3GnWdwmvE41UWt/hF2L9MdCkoYRkC0rNXuyaRGmiQZzagD08mtFwpx+Q1jNhR8LN7Pt3kZ4IVb/36rphUW6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4504
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=889
 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2602130000 definitions=main-2603040064
X-Proofpoint-GUID: mUS2h4gv8XsxqGWYPZutIG3f-wtwBkGx
X-Proofpoint-ORIG-GUID: mUS2h4gv8XsxqGWYPZutIG3f-wtwBkGx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NSBTYWx0ZWRfX50c9n7Z7X1VJ
 ycHQe+Sqnp1sYD8254aTEAOWIcM0iK5OjiV2sAEtpBihzERq29WXZNOUc8g2pmi9K+7yCZG4aaM
 9zccGqm3Aw6bNW4a1vK9/CKtqWt0PspUxeucQT2WWvgwiXrHRgGyOERiFeY3cYTuunwqT/WbBvW
 N1/3AZ9DSnjM+HBadwBakyq0pD0fGm8sHYSl2eESx7BBOVR8iCqWUTJU6Se4WsvV7K1oGXnXQzv
 9S7r3dQCQffLeXlj5Os8jdkiUnkeyw0InfJA0Z80/1rb1AGh0NSZERHPIQvoxLstWPAfSNx5UUH
 gypbQsRUXLh1GjW3CKr2d3FFN90qq+DPPh70LlsNV55hGgtmHSFfHMsanEPEh5Gsi8zqYm4YlTB
 imU7eyEu9WdMQamUxxfcRxMNUmZJcHhLXiLsF1+chSolTeeZUxnP41CmJoeMMTXl4bGiY/5HMRY
 Z/9T5QD3H2lrVJx9jzA==
X-Authority-Analysis: v=2.4 cv=b/i/I9Gx c=1 sm=1 tr=0 ts=69a7ec7c b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=3I1J8UUJPc9JN9BFgKH3:22 a=cmzr7Gm0VwH42XgtHYkA:9
 a=QEXdDO2ut3YA:10

On 04/03/2026 08:01, Alan Maguire wrote:
> This series adds wildcard support to stapsdt probes to allow
> tracing system-wide; this has caveats due to the way the kernel
> implements probe addition.  In essence, probes are added on a
> per-inode basis (actually in the VMA associated with the inode)
> so it is necessary to identify the file where probes are found.
> Probes will fire for existing and new processes (the RFC incorrectly
> said they will not work for existing binaries; they in fact do).
> 
> Patch 2 describes the approach; to facilitate systemwide tracing
> we need to tell DTrace the name of the binary/library via either
> using module absolute path (patch 1 updates parsing to support use
> of a '/' in a module descriptor to faciliate this support) or an
> module name; to expand this we then use [LD_LIBRARY_]PATH
> to resolve the full path.  ELF reading of the file and insertion
> of probes then proceeds in a similar manner to per-pid tracing.
> 
> Patches 3-8 test various aspects of systemwide probes; basic
> binary support, library support, listing support and is-enabled
> probes support, and use of absolute paths.
> 
> Tests ensure wildcards work for
> 
> 1. a process started prior to DTrace
> 2. a process started by DTrace (-c)
> 3. two processes started after DTrace is running
>    (via system())
> 
> Patch 9 updates docs to describe stapsdt wildcard support.
> 
> Changes since v4:
> 
> - Restrict '/' to module names (Kris, patch 1)
> - Name probes as provider0 rather than provider* (Kris, patch 2)

small clarification here; the name I'm referring to here is the
probeprov we see on _firing_ (or listing) not the one we'd use in the tuple in
a DTrace script; i.e. we still do:

$ sudo dtrace -n 'python*:/usr/lib64/libpython3.6m.so:: { printf("%s:%s:%s:%s\n", probeprov, probemod, probefunc, probename);}'

However we see:

  5   6734                            :line python0:/usr/lib64/libpython3.6m.so::line


> - Resync with devel branch
> 
> Changes since v3:
> 
> - Semaphores need to be more carefully declared to handle
>   the is-enabled case where the process is not running when
>   DTrace starts tracing; the kernel handles reference counts
>   so the probes must be added to the ".probes" section; see
>   patches 8/9 for how this is done.
> - Modified tests to start an instance of the test program
>  prior to DTrace execution and start two further during
>   DTrace execution; ensure we see probe firings for all
>   4 of these processes before declaring success (Kris,
>   patches 3, 4, 5, 8)
> 
> Changes since v2:
> 
> - support absolute paths (patch 1, 2)
> - add tests for absolute paths (patch 4, 7)
> - document systemwide probe support for listing/using absolute
>   paths (patch 9)
> 
> Changes since RFC:
> 
> - update documentation/commit messages to reflect that we also
>   catch existing programs/libraries when probes are enabled
> - fixup provider name for wildcard probes to be 'provider*'
>   rather than using the confusing 'provider-1' since the
>   latter is the concatenation of probename and pid (-1 is
>   used to connote all pids)
> - add test for is-enabled systemwide probes
> 
> Alan Maguire (9):
>   dt_lex: support '/' in probe descriptors
>   stapsdt provider: support systemwide probing
>   test: add systemwide stapsdt note test
>   test: add systemwide stapsdt note test using absolute path
>   test: add systemwide stapsdt note test for library
>   stapsdt: add test for listing systemwide probes in object
>   stapsdt: add test for listing systemwide probes in absolute path
>     object
>   stapsdt: add systemwide test for is-enabled probes
>   documentation: update stapsdt docs to describe wildcard support
> 
>  .../reference/dtrace_providers_stapsdt.md     |  91 +++++-
>  libdtrace/dt_lex.l                            |   2 +-
>  libdtrace/dt_pid.c                            | 174 +++++++++---
>  libdtrace/dt_prov_uprobe.c                    |  15 +-
>  libdtrace/dt_subr.c                           |   6 +
>  .../tst.stapsdt-notes-systemwide-abspath.r    |   5 +
>  .../tst.stapsdt-notes-systemwide-abspath.sh   |  89 ++++++
>  .../tst.stapsdt-notes-systemwide-isenabled.r  |  13 +
>  .../tst.stapsdt-notes-systemwide-isenabled.sh | 266 ++++++++++++++++++
>  .../tst.stapsdt-notes-systemwide-l-abspath.sh |  48 ++++
>  .../usdt/tst.stapsdt-notes-systemwide-l.sh    |  48 ++++
>  .../usdt/tst.stapsdt-notes-systemwide-lib.r   |  14 +
>  .../usdt/tst.stapsdt-notes-systemwide-lib.sh  | 215 ++++++++++++++
>  ...tst.stapsdt-notes-systemwide-lv-abspath.sh |  48 ++++
>  .../usdt/tst.stapsdt-notes-systemwide-lv.sh   |  48 ++++
>  .../usdt/tst.stapsdt-notes-systemwide.r       |   5 +
>  .../usdt/tst.stapsdt-notes-systemwide.sh      |  89 ++++++
>  17 files changed, 1125 insertions(+), 51 deletions(-)
>  create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide-abspath.r
>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-abspath.sh
>  create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide-isenabled.r
>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-isenabled.sh
>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-l-abspath.sh
>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-l.sh
>  create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide-lib.r
>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-lib.sh
>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-lv-abspath.sh
>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-lv.sh
>  create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide.r
>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide.sh
> 

