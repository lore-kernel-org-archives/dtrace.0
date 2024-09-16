Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CD6139D04
	for <dtrace@lists.linux.dev>; Mon, 16 Sep 2024 22:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726527514; cv=fail; b=HiDS/ZjAst9/4GUBOpXitC5PjW6hfNMxSkUW72BCqvp9tgL3MaSwx4O636HUDvORPhsN3Zhb93tpTnCxeRRijZsO8DJx73Mr5zPERCOSi+dSVvWNeLzocS/ADaiCCyOW0oodyQgjdrSH//jdRnf5xvw+fn/TjIER+kTQ98CfTwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726527514; c=relaxed/simple;
	bh=q9dje27AqrXhTNGl6X6ToOe1Pt2EXBU7MOuCrMlMcuA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R4aQNVgvSQGZnPYFq534ZXmMR2DXRXxllS8hov/kfF2a6cpJmwbK8O/mfZ/9YXy+tccg3RnHNyM4wHvLKduEorUV6NYxWhPirCvl3nVrW0O6zAO0I87nRrk2gyZMDmkHthXoiwfDYOLDgsErLk7/hIUO4SuadTtBQtO+Wx4lnqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=J8nHLL8m; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XhuT2zSi; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="J8nHLL8m";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XhuT2zSi"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48GJwXEG001470
	for <dtrace@lists.linux.dev>; Mon, 16 Sep 2024 22:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=xjQktfmQ5Ys+9LSgPeZjUhSA1JQ4o3ijOuiR/QxSxo0=; b=
	J8nHLL8mE8A5Y05d3CJKLwVMcIrK4M9Q32LLjE0o6Q+GP7MGlaRHHq46NOiAjUue
	Dv+xGYCHzjgTmIdR7OVVedHBF7jPl2pjM2JjS4F/IPfiJ4Khybav9NqmK/WaUtWP
	uJmk5DG1pBtEVBJUXXjlF47vKzTfumqr8LJU9cg5xb6BktAAvsGKo3aiCf+QF2Go
	EMzGKRm9d2mRRBLAYWpOUsoDws2sH5FOeEmHG1+s62pfSVzYQUrUqHhNKEZPlkGD
	jchPuqxrp8awTP1mNy+lIGTzJdiWFN+TP5SQuAdR8vFko5X2NnneUZXuiO9NSMV0
	bsWUlzS8n2c1aQ1gA4twYw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3scvprk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 16 Sep 2024 22:58:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48GMcPqH011588
	for <dtrace@lists.linux.dev>; Mon, 16 Sep 2024 22:58:29 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41nyb677bq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 16 Sep 2024 22:58:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sFGr/8UIK2JdRRs/LlZULVjBW7OrO+OryCXRVyTp8aM3BuKBEievIA+Vngs8qIPOtHOi0eklI8jkoZZCg6Y39mSlaZO5qfZqHdU9oTJRnudmeMQbquL7tFdzPKQ2eJuy/6C/I3coeT1/3IX+KHitqjvt0kSEfciVRem1pqmwbG9lQGge0d6JSi2o06FoZtj9LSYKsXjVkke1fBpJ3I3nUAkfxETfoB/JIyu0n1Y2bjRLkWs+VrHPKu2xHbbRttgkE9SgocFd5E+mT+UflluiD2nxJ1TYwiqa6g1vtZi99tvP6QqOyUBkHbkMA+AdKY9ZgziWQ1bDvFtxMuhibL6HvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjQktfmQ5Ys+9LSgPeZjUhSA1JQ4o3ijOuiR/QxSxo0=;
 b=Z8vC5VqqS2hyaF04bg2jheY8eBXARwqsfZHZ5cQlVEGayIX+iAQY8Yvk/SzzF1gTKZ0aGy+FUdCuz6QvM4xGcd2oRvYwaAue/RDCWN2asj97qdGbM6oIljfYMQxZ+VAqLAt+rzgmWV8DFGiBtQRcspw3nsyNs1Y2zgpJtYbJK92WGPKkyK5ve+dE9YkRjwRbSUJGj4LY6OfNLd5HmAHG4tMT4FvvY7BtOwL10UYJHLatfqGpgkzLuDwdhN6aOA7MjF408hzB5iE1RFeBnDr3YStM+g9UhC40bjL3ImSm5fNDtUrg+Ogt151INhaxoHEGCNGvqR5daYei+cnaRmWtCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjQktfmQ5Ys+9LSgPeZjUhSA1JQ4o3ijOuiR/QxSxo0=;
 b=XhuT2zSiE4BxBwvjZSSa9bmqVwHsezTkJKmmb2rSlBeEYTgoKONcB3OM0RT3Vd9Ou0AZ+uCo0JJhuCZBnhmpKoXxO6ZPmjxmmEBwyAfGbXgw8EeP7zIL2wk4soTMAH8wopcfFjq0xY76TIEimopvBkDCEHHPmDK9v7AtAkJKJE0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by LV3PR10MB8179.namprd10.prod.outlook.com (2603:10b6:408:28a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.14; Mon, 16 Sep
 2024 22:58:02 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7982.012; Mon, 16 Sep 2024
 22:58:02 +0000
Message-ID: <389fd430-37aa-d16e-8b3c-9034dc41d6fd@oracle.com>
Date: Mon, 16 Sep 2024 18:58:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] Relocation processing for the ERROR program is done too
 early
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <ZuT7zAFGovJBCJzE@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZuT7zAFGovJBCJzE@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::10) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|LV3PR10MB8179:EE_
X-MS-Office365-Filtering-Correlation-Id: c4ead44a-952d-40cf-fa42-08dcd6a30444
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WDFZM1krQkdVSUVoZ0IwMTZOOEZ4Vzg4SU9lQk1RVWRvWW1URGYwamtEcXFQ?=
 =?utf-8?B?Y3ZvRTExUjFjOFpoVW90WjVSM0RWbDFXUGFDNXozUk0xVE44TGxoYVQ3c09l?=
 =?utf-8?B?dHhSYU9vazRScTZ4L2pLbUhrM3c2Z2IxbWRoS3VtVWtXSStJOUZjN2pubDV0?=
 =?utf-8?B?Y2tKTGRIRjlGa241ZWZzclByblN3YnJFYWl1NVQwY24zQ2p1Tm9NTGhDVHpr?=
 =?utf-8?B?Z3RzUWpkRWxrZGZIY3cvK3hncDEvQUxlVzFRbm56dS9ET2RYaVlaSWYrY29i?=
 =?utf-8?B?ZCtEZ0RGMjU4eVVzZ0F5WHpFeElYc253WFNjTStCWXpjRGh3andmMHZkNkYv?=
 =?utf-8?B?ZVpEYUhOSUo1c0RXd3R1WENGYnFoUSs0VVJSRlBBbGZEZGxvTDRnbzdBdGI0?=
 =?utf-8?B?SnBlZHI1YlE2ZzdhVWZidjBDenIyNGU4QUpiWHFrR3lVWUY0YVpwVHNHUVlO?=
 =?utf-8?B?c3QvSUJpVE1TOWZJRzdRL3ltRzJPMUJxb1VmdXFuWVdrb09GbzNZbFpsZFhC?=
 =?utf-8?B?VGU3T1F1bmRZTlpuZ1BGUUZqeHlvUEp5Q3pYaHpPY3BDMlphazNQNW5BNlU5?=
 =?utf-8?B?RVlTZTEzSGFPTDlEdTlzK1lxZkx6SkRJRmtSYWNsSmlIdzdkNDZ6Y0tRMG5Y?=
 =?utf-8?B?Q2EvWGtWUDlPbmV6WnpudGF2Z1phTDFTdnk4cUF0eElmZEdyVVZCeG5nT0hG?=
 =?utf-8?B?aGZTTjlTRURPOWVZa2N0RFdTMVNCZGlwVGhOUHVjSWdCWHlzQlBXRW10c29Z?=
 =?utf-8?B?elNZSndQVUVKRy9SVU9HNXJQaTdUVEkvT2JxcjZad1pzV1NLV0lSRmZ6R0o1?=
 =?utf-8?B?TDRQMHloQWNXeTRXVUYxSXRSazZhVGl4WmZmbitCMG5WQU15a3BXY0x6aWRv?=
 =?utf-8?B?NU5lVzdhcnRsd21iQkExcjB1cHhrY0MwZVM3bDVyV3RjbmhkbEpBSHBLQnFQ?=
 =?utf-8?B?MmRYQmpuSER2YVo5SmIxS3VWTFhzZjBNcDZHTWtTVHRpU3NMUW1FeTlBQ1ZC?=
 =?utf-8?B?elRzckp4L0kvUGEvV1lJZjBBWFBmbDVVTjEvUDRoTjBONDNBWjUrUGI5M2Mx?=
 =?utf-8?B?YU00MmlaU3VUSGlNam11YU9ST3Ftd01qLzF5NzZuTGZSOFEwcU0wdU1ENURG?=
 =?utf-8?B?eHlXZmhhREE0VExmZE1ZQzdiNWpNY1o1NWc2cnRTSThObkVpU3lGT05qWG44?=
 =?utf-8?B?WVdPS2xUYmpnWEFkU2cxQnVaOFV3RW9tU2RZb29meUxhMjRBbEhnR2lDOWIz?=
 =?utf-8?B?V1loZFVRMnY4N3FhbUJkT0Z1S3dQalhWNi82RTZ3NHdPVnZiVEs1Uk5NcTR3?=
 =?utf-8?B?VW13d0l0cmhoRWl4eS82NXEzc29SZU1iRnFOVDdZN2N0MXRDcmVXN0VoY0or?=
 =?utf-8?B?amxIdTh1TmQzMDR0YVJnbTBwWjZvM0hwZTNweTJWWWxydE5MTUtGWGxFV3hi?=
 =?utf-8?B?OFdTTWkzRzZpcWMrQXVvbXlMa1J4MDdSTWEzdUFTN3F0ekZ6dytpeW1Odmpl?=
 =?utf-8?B?SXNMQmt4VzZ2Ync3QzlVMnVLdUJIckJGdmdNa1E2ZUFOYlFaTndQT01udmJ6?=
 =?utf-8?B?NG1ZaXc5ZW9mZ0lWaEh2a0EvdkN2WXNVdGc5QitSNGRqUTNoR1NNWDdobEEw?=
 =?utf-8?B?ZlFUZHNPMkEzOWU1Syt1T0gwSm40Uzg1eGRncnA1eDJZanBNeGR6QTlyTHhH?=
 =?utf-8?B?RFpJUkZGL0tQREZua0EvczlocUFpbVFEUGJqcVF2RFBuUjdObmJyRVZMTW5q?=
 =?utf-8?B?ZER4MTM5SkRqRC8rWVVCY2lmSkEyRGE2OS9TSWlnNG1kUTkvOUd4ampGcGVB?=
 =?utf-8?B?UWgwMnR0dWZmR3A4OSs5UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3Babm1rSnFGVVVYM2FQWXNnRk5PN3pkMEUySlN1NUlzeEpqS25sM0k5VXFl?=
 =?utf-8?B?dzYyV0xNdjJMQ1FDeGNvQVZlUW5EZFpITEd2SXhpaDgrY3RUcjFuSVpKYnJI?=
 =?utf-8?B?RXdCYmFEd0dVdWtpeTl1bWN2QkIvWXZkYUxiN2w3UnZhemU4UTI4dWUydzI2?=
 =?utf-8?B?V1Zkbk44cXRyMTBSMlVuT1ZSWlNHeDFxYnJlbDRKYmRPZzdBbzhjNWl6Ymtx?=
 =?utf-8?B?MmozMUdOakMzSVpyWHd0aGJWSFR1c2cvQXpuVzA5dExja2hpVmtvelpHdnly?=
 =?utf-8?B?VUdrRFFjVDhhSzdKdURBNUU5TjBqMHZIZDZGVU16S3duYTJpWU5yUmdIM3ow?=
 =?utf-8?B?MDFYQVBCcUt4b2tRUDBDZnFVVjg3TEtFUEE4eW1scjR1OVdhaWdJaXJKeGFr?=
 =?utf-8?B?Nm0wZ1NsdlgwNDVRaXVuellVWVJ0eGx2QlI3bW13ZDduVlptUURlaWxXSmds?=
 =?utf-8?B?bm84UHdZTGdkTHUxU0NhMVI5TFpEcDN6MDZlUmhLRGNZK09EMll1WnRLUVhO?=
 =?utf-8?B?alQzblVmOGpsVnp3ZElxNW5XZ2pVYkdKMG9vbVZIQlJ6SmR2VVRzN2pQNW9H?=
 =?utf-8?B?UFh3RGFFZzNMK1h2VzZYUEtVVzVvMkswNno2cG9YVy9nd1NTWkZBaEFham8r?=
 =?utf-8?B?TXFzbFhyY0ZxN3FONGxoY2VyVDA5M2Z1dGREM3hsMGhmQzQxVW00aU40cmpR?=
 =?utf-8?B?MkxuWVFDcCtZT2pZT3JPOGFOSjNCRk8wUE81WndqZjl6SkdZK3lZK0ZxWTgw?=
 =?utf-8?B?V1VLbjlWd3lnZ3c3eFhmb0xFRnBOOCtBOER3SmMxNHJVME1OeVNvWlVtWmRM?=
 =?utf-8?B?NlN3a3MySjR6WFlsSm5aMEdFbFJpQS9KVmwzU1poYlNXWTUyaGxvajZQWUk1?=
 =?utf-8?B?d1NKdDg1SlhlRE1FWk1sUmxFVWk4QU95b0FVVWszRFlvMmdHRGJtUkM3aEFv?=
 =?utf-8?B?ak04MVUzdWZHWGw1U0JWclZ4NWU1dkZjMWZva1hyeGJWQWhzR01lY3k1V0N3?=
 =?utf-8?B?eVpyeFppbUwvbVdDYVArNnB5azFIcExzc05Iajk1OXZPbkVjR1BadStRYUs3?=
 =?utf-8?B?N1FOZ1RzWW1ROUl4M2hRTWFldmxLSTUwazhjZ3JNV2dvTytPeUdocEVSTGxa?=
 =?utf-8?B?ZFFndDdCZG9jL1M4eEVqV2g0TlJyL0NDREloUUZ3dHMzVWpTc2NvL1Y3K2Jv?=
 =?utf-8?B?eGcvR1ltS2RKWGJYYmNrZHVUd3FwdWFVMDRicjM1WkRIeHBCQmhHRHJFaksx?=
 =?utf-8?B?eUtYQ2tLNW1hWGswR1pNakdiWGdTdUxsN0hHcThURWRGZ3RXZkg3YzlzTXha?=
 =?utf-8?B?SGJqc2FLRlZobG5vVW5sRkF3YmdIUTVtWVhRbkZCR1RPREpnZWdUaHoyN21F?=
 =?utf-8?B?NFB4YTRrb2ZaWTNsVzVRWXRPY3B5ZHBpYmNRREhsbUtLY1FwNTE2bDQra0J1?=
 =?utf-8?B?RS9HT3hEdHQrR0E1SmN2ZFh0ejk2OFJ4eUNzK2t2NzFaK21PeXNZWDNnS1Yr?=
 =?utf-8?B?OE5YUFczcEpRK3FtRzhJaERNemREOE1ad3lDOENQUTBLYXRtZjk5d2VxZEJV?=
 =?utf-8?B?MXJXSGgxUThpU3RzLzJUN0wyanUvZVowSkpmUzEvVUtxd2VLY0NIR05BbU8y?=
 =?utf-8?B?c2ZySkMzU1JOVVgxVkZXNXFZdTZPdzYzQ0RJUFNBSG43Y3BUTmxqZ1RNYUd1?=
 =?utf-8?B?Qy9nOE8vMFllTm1XRzI1cXdaQ1BXMmZjb0duV1dld0RhUHI3SG41NGVvcHBl?=
 =?utf-8?B?Q2dQQ0QxcmZWQm93SXZydjUxeWNrcVBWZXprTWpqUkg4N1M2TlNHS3lKV1Fk?=
 =?utf-8?B?TEp1RCt1d3F3QUowRldJa01iNTlkSDhMZXlJQUtVVVdMdkI3NVJnRS9VQW9J?=
 =?utf-8?B?endMTGFzaVJ4eXNVZVh3NlJqR1FIYk95dm80eDNzdVVDYzV2cGdoeEt2SmVy?=
 =?utf-8?B?QTlZeFo0eVZVRW9ZOHM2RnM0M0EyR0tSUUFRUjB4alBodC9NWUM5RDJFQWpk?=
 =?utf-8?B?bFZKMzFlNU5hTlYvN1RHWG4xam9TT3NLMEpHYWxMZjBreHgyWW1jUUJWS29G?=
 =?utf-8?B?M2hXai8xMHY2KzFPOHg5aGt6ajVWVzNGZEs4VjBVb01ESFBOS1N3UytPR0g5?=
 =?utf-8?Q?hObahXjs14pr19Xlj4mm4g71M?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GZpbuKU6l9/gTzWSQ/WXynfrs0jWNtK0SxN3pdEcHZx28QuvVnptjkZCK8bwwxQD8OTg107GJDb1akLVthQyeeXJmBFlgEmwuyu6NegTDuDv/XoYh7Au8A/878hl4I0fp1KQZOYSBWUBbHQa0BWuLQT58lD9qw/uzhPvYHsZKxBqAuSeRk602KmUGZS8lrIBVPkJElDGUJJjNpLdR3TcJyIZTU4COZflf/lntyuzs1ZD0s5bhgARYRQ256Uij+8jkccO2xW321lhKF3LH3rBFJHKq9kXPiLQvVnZgtQ7bXL8i6zSJpEqMe+4ojHp63nySY+ZWcuDdSzKGlX7W6m3c0rwicAuPHh3AYKbeBf1P0d1BXzULJpGBiD7U5X9PYsWP2/+0AvC38Vq7tL1nGZs7tCKxbNXEBRF8dlFQmfrN2mJw8vBj6s7ZpTosd+SJk3BkCDVvaTtGvWQA+4XTUm62VtrUFbedR4wRPNvzNKYfPcdPl0M3ExnfH5Kx+MHtUMB8iV/sz63EuA6eF+L81qDyBIaB2tMuvSui10FXsb1YZHvu00kGuS6oS+HxbPsEhASr289ZP9bHlyRIBEsIrN5btWK/Hw+BBwsqXpc7L/kdsE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ead44a-952d-40cf-fa42-08dcd6a30444
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 22:58:02.0779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k7WvPIbcPwXAxz6Xoi3OmzCKaeLePKm5alpRF7PdcmCHSJFc2YLgZVXE6WQDFddUqeXaRbhFxWlLz1JmK2ASaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8179
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-16_15,2024-09-16_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409160157
X-Proofpoint-ORIG-GUID: sN-hM9zIe6vSpFUSfoYPfLpVVymQhqpK
X-Proofpoint-GUID: sN-hM9zIe6vSpFUSfoYPfLpVVymQhqpK

Thanks.  I see your R-b.  So, no further review is needed?  If this 
patch has broader scope than the initial patch, should further checks be 
added to the test -- e.g., to demonstrate that other issues are fixed as 
well?

On 9/13/24 22:58, Kris Van Hees wrote:
> When we call dtrace_go(), we do something like this:
>
>      dt_bpf_make_progs()
>          dt_program_construct()        // just for ERROR
>              dt_link()
>                  dt_link_construct()
>      dt_bpf_gmap_create()
>      dt_bpf_load_progs()               // other
>              dt_link()
>                  dt_link_construct()
>
> In dt_link_construct() we dive down and find dt_get_bvar().  One of the
> relocations is to supply the value of STBSZ.  The first dt_link() is for
> ERROR, while the subsequent calls in dt_bpf_load_progs() are for other
> clauses -- that is, two separate versions of dt_get_bvar() are used.
> Meanwhile, the value of STBSZ is not set until dt_bpf_gmap_create().
> This means that the ERROR copy of dt_get_bvar() does not have STBSZ set
> properly. This means that if ERROR accesses probeprov or probename,
> dt_get_bvar() returns the beginning of the string table, which is a NUL
> terminator.  Some other relocation values have similar issues.
>
> Move the ERROR program construction to dt_bpf_load_progs().
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_bpf.c                          | 40 +++++++++++----------
>   test/unittest/builtinvar/tst.probe_dtrace.d | 34 ++++++++++++++++++
>   test/unittest/builtinvar/tst.probe_dtrace.r |  6 ++++
>   3 files changed, 61 insertions(+), 19 deletions(-)
>   create mode 100644 test/unittest/builtinvar/tst.probe_dtrace.d
>   create mode 100644 test/unittest/builtinvar/tst.probe_dtrace.r
>
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index 70597d65..df427c86 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -1212,30 +1212,14 @@ int
>   dt_bpf_make_progs(dtrace_hdl_t *dtp, uint_t cflags)
>   {
>   	dt_probe_t	*prp;
> -	dtrace_difo_t	*dp;
> -	dt_ident_t	*idp = dt_dlib_get_func(dtp, "dt_error");
> -
> -	assert(idp != NULL);
> -
> -	/*
> -	 * First construct the ERROR probe program (to be included in probe
> -	 * programs that may trigger a fault).
> -	 *
> -	 * After constructing the program, we need to patch up any calls to
> -	 * dt_error because DTrace cannot handle faults in ERROR itself.
> -	 */
> -	dp = dt_program_construct(dtp, dtp->dt_error, cflags, idp);
> -	if (dp == NULL)
> -		return -1;
> -
> -	idp->di_flags |= DT_IDFLG_CGREG;	/* mark it as inline-ready */
> -	dt_bpf_reloc_error_prog(dtp, dp);
>   
>   	/*
>   	 * Now construct all the other programs.
>   	 */
>   	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL;
>   	     prp = dt_list_next(prp)) {
> +		dtrace_difo_t	*dp;
> +
>   		/* Already done. */
>   		if (prp == dtp->dt_error)
>   			continue;
> @@ -1263,7 +1247,25 @@ int
>   dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
>   {
>   	dt_probe_t	*prp;
> +	dtrace_difo_t	*dp;
>   	dtrace_optval_t	dest_ok = DTRACEOPT_UNSET;
> +	dt_ident_t	*idp = dt_dlib_get_func(dtp, "dt_error");
> +
> +	assert(idp != NULL);
> +
> +	/*
> +	 * First construct the ERROR probe program (to be linked in probe
> +	 * programs that may trigger a fault).
> +	 *
> +	 * After constructing the program, we need to patch up any calls to
> +	 * dt_error because DTrace cannot handle faults in ERROR itself (yet).
> +	 */
> +	dp = dt_program_construct(dtp, dtp->dt_error, cflags, idp);
> +	if (dp == NULL)
> +		return -1;
> +
> +	idp->di_flags |= DT_IDFLG_CGREG;	/* mark it as inline-ready */
> +	dt_bpf_reloc_error_prog(dtp, dp);
>   
>   	/*
>   	 * Determine whether we can allow destructive actions.
> @@ -1272,10 +1274,10 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
>   
>   	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL;
>   	     prp = dt_list_next(prp)) {
> -		dtrace_difo_t	*dp = prp->difo;
>   		int		fd;
>   		int		rc = -1;
>   
> +		dp = prp->difo;
>   		if (dp == NULL)
>   			continue;
>   
> diff --git a/test/unittest/builtinvar/tst.probe_dtrace.d b/test/unittest/builtinvar/tst.probe_dtrace.d
> new file mode 100644
> index 00000000..d08067ad
> --- /dev/null
> +++ b/test/unittest/builtinvar/tst.probe_dtrace.d
> @@ -0,0 +1,34 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION:
> + * Built-in variables listing provider, module, function, and name
> + * are correct from dtrace-provider probes.
> + *
> + * SECTION: Variables/Built-in Variables
> + */
> +
> +#pragma D option quiet
> +
> +/* Check build-in variables from the dtrace-provider probes. */
> +BEGIN,ERROR,END
> +{
> +	printf("%s:%s:%s:%s\n", probeprov, probemod, probefunc, probename);
> +}
> +
> +/* Cause the ERROR probe to fire. */
> +BEGIN
> +{
> +	*((int*)0);
> +}
> +
> +/* Cause the END probe to fire. */
> +BEGIN,ERROR
> +{
> +	exit(0);
> +}
> diff --git a/test/unittest/builtinvar/tst.probe_dtrace.r b/test/unittest/builtinvar/tst.probe_dtrace.r
> new file mode 100644
> index 00000000..e6cccc88
> --- /dev/null
> +++ b/test/unittest/builtinvar/tst.probe_dtrace.r
> @@ -0,0 +1,6 @@
> +dtrace:::BEGIN
> +dtrace:::ERROR
> +dtrace:::END
> +
> +-- @@stderr --
> +dtrace: error in dt_clause_3 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
