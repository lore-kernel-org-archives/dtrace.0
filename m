Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D72C1A7262
	for <dtrace@lists.linux.dev>; Thu, 21 Nov 2024 18:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732212697; cv=fail; b=KW63iuaqOz/j7CQmvWukn2gr8BwoQxJcmlECtAckZfqwJa1COU3R3Q7Pv8p6T72OUaXcQG0solMHAQNfe+37UXurDik+FsYeAN1qk4vzFacrpH2eQIJJr81TVWdWQnrgdk7DUwBTR0XdM98BSqgcCWDIgvmlLf9KMXDse1IIBXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732212697; c=relaxed/simple;
	bh=UL5Pej7pXZqfTyDlYRryssA5yZTCnGqxas0wSmDnhNk=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=P+ntJ4CeuGzk3MKB8sNaEuI3Mb5R2clNYbs/kw28e+FfLUHA4jJRAzGwfsLe1WxTGlRBgDOPBQQ/37Q4WxqPO9h3OzXdtcf7Qh0X7bNHSUsT91mic8XKsazjc7IfpvuWe/lu9FlztlsNxOaQW3vGGChzfRM/SyJJZJK2ly6C/1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Nc69G2CJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oBgG/g5+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Nc69G2CJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oBgG/g5+"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALIBZ6U020158
	for <dtrace@lists.linux.dev>; Thu, 21 Nov 2024 18:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=dgm/6NAx8u8c90bXT5+36tghqgPzaCqPyertd+fqn6k=; b=
	Nc69G2CJuKfUlBiDHp7vsroxTxrDzccmTutKIFKG4IFJRA2gmqLFExtpHbmTG8AF
	30IRI80KTJczagLk8ShwoAvGl1gw/6SF/xf5y9Fa4Sq6uq03tlqxi5hBiFKagxg2
	DYeSMUM8flX9mzLku9EljakTMlq8cyDobkd5U4omBh1nBuwTrwxtMBzVXotn6XUZ
	+Wc4WO/D931s55d71gXQpJhslAx8C6LiT4suVeVNFEuJLHYS0ayxPL+b1qnEx/31
	r5PKMguJT6BpZ2Y8Xj2NsVfFwJh0jxyH2efrW1kQBurIGlHGaw2V3Xd3y52zG4Rt
	qJflPRbZ2jOUYrOQqkvvwQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 430rs5dt9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 21 Nov 2024 18:11:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALHPWTb037203
	for <dtrace@lists.linux.dev>; Thu, 21 Nov 2024 18:11:15 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42xhuc7n1p-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 21 Nov 2024 18:11:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WM+bMbqJm6lqY070quP2l5LnF8wA7n9DdqbyiWDNHoTrL1nuZOuinIDddzwDt5GKDiwvGMH0q1MdO0o1fp4Ry0oqyTlKmTraorJoFQjrODcLHirf2Bvyw0WCYWEP3R2lMfeudBkVoOSA46EvAZxIoLgAKW6Xy18dAa/dHvzIfa9Vln7iTv8APGPLJ/PG074AaSK3Wcid7u895PjnRV+T+d4NjjM7o1yc6Kb0QCUHR3BUMWDX9cjk56ddKkbS4jmSi6ECeQ3mPkVA95Tx73jOASEoX5mC2gaQ0vaoqVqolP/tVyeRyn8cRlaNmkyHSjmnaajbSRk6QaCAR0ap5MjWlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgm/6NAx8u8c90bXT5+36tghqgPzaCqPyertd+fqn6k=;
 b=VprOD9lcQFtphYj1wti06AP1+6JaVa3fp08zTCUYtgcKm9Md85mCLBekot40MtptQuYGojK2mXSWqa6l79iEE5gyKuRTzHKJCl24u5QpqplavXLcLS+H10g32kAjaDyIYrKLjQ90cawYyJsmdxITyJC2XAzc2eiBf4qvLtGwkxGlHtloFtKoc4esjx/EZbc5TQYHa+/eLf8yu+6faduANbsfvjYNZi+7JTT3MXP/S/aZagGTuEA6H1F4v2CmAbBpB67AG7liGP61OX0XOrH6OyQ9EGgG/9IRWRqhtChVUQLcVm438mc14eTNQKZg/gutuWNSOVDzfYIgkyI3uIQT1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgm/6NAx8u8c90bXT5+36tghqgPzaCqPyertd+fqn6k=;
 b=oBgG/g5+MxaqQfy9VliKt9j+QdN3gFz7UlIbzJxCMJXK4zs+YGp85aixQhVU4EtyXtqDTL5RF/mFWMPazTC9CD8RW85n8ATf9qOnARxqtPPyO3ZRKR7BGzb6yQ8ysXm3EbHFGdEzSIACTUtsQd+O3P5MHXukt0d7OTTGEeCWCHo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM4PR10MB5967.namprd10.prod.outlook.com (2603:10b6:8:b1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Thu, 21 Nov
 2024 18:10:39 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8182.014; Thu, 21 Nov 2024
 18:10:33 +0000
Message-ID: <ea997f1c-1ccc-cce7-d867-e19109bbcf46@oracle.com>
Date: Thu, 21 Nov 2024 13:10:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] Fix memory leaks
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <SJ0PR10MB635051E2F4FFEA4CBE5B3B02C2222@SJ0PR10MB6350.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB635051E2F4FFEA4CBE5B3B02C2222@SJ0PR10MB6350.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR22CA0027.namprd22.prod.outlook.com
 (2603:10b6:208:238::32) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM4PR10MB5967:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ded004b-731c-466b-75e0-08dd0a57ca71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?clhQejc4ODk0YXQ5a29YUWpmOHplbmxCYjBoT1AzTnZpaFJoWnRzT0NRVjNK?=
 =?utf-8?B?SUNEKzN2by9yQmsyeHJTN0dSTUVudnd3VVM1Z2xCejFkMDlwdms4YTBCOXhm?=
 =?utf-8?B?QlJrUThZU0ZIdkc2ZE9TdXRoUEhzU0JDVStRaFdsSUFKd3RKQ3NWMlo3YitV?=
 =?utf-8?B?RjEvUTVId1k5YTN2SmhTOGZOaDRiK2IzMWdMNDhKd3ZXcjZlSlhNVDJEVU5q?=
 =?utf-8?B?enN3dXZpcVVlcWZ2M0pwT3Q5RkQ3RmVZTDArcjd0NlhiZkliQ2ZXN1NEdG5s?=
 =?utf-8?B?YnptZU15c0pPM2RxVnBNWDlRc21zZnpOQlFVMTB3OWIwSG1tSzE0Z1p5WGRE?=
 =?utf-8?B?Q3FCTjdwSXUraUlEam5xc3VCSFZVZlRHSFZ0QkVZQXNFMjBFTTFUbjM4bDln?=
 =?utf-8?B?YUsva2VNZ2t3Q2hBN1lGV2JBdkQ0U0Rod2QvaTNJZHdnbFR2WUs0YnVsc0V5?=
 =?utf-8?B?NVV4blVRbGYyS25Hc0ZnaXhRZmdSVk4rYmp2ZDJNQnJNdHBrUElWRjZ6VTVs?=
 =?utf-8?B?ckc4VTdSZ29kVDl5NzJ1eWt1REFDcWZxVkNIaWl0cEVlV3lsc1FIaVhoRjNO?=
 =?utf-8?B?ei9oUjJsd0c5U3pTdGpEUUxsREZWMTJUM090VXZ0dDdlVlJSb3NaSDJFazBs?=
 =?utf-8?B?YW91bm9tMkpxVHg1MDQraU5VdFJrQUxETFd6MjlOL3FUbndjWW1zbkFTR1Ar?=
 =?utf-8?B?VXBVbWU5TmRSdHVnS1FocDBWZE4rNTgydG5aMG9zWFZZaEhsVk4waytPdndQ?=
 =?utf-8?B?bWx5MVhBbWVIRGlqSVlLaWtWQ3lzQ1RSNEFkMmJPNHBCQ2R2MS9lVmZBbUli?=
 =?utf-8?B?bXBCQnIwd2tvL3MyT1RsWHZpbkU4c0ZqQUNVY3FsaVVGZ1QvQktuQnhwMWNr?=
 =?utf-8?B?dlhsY2lYTkYwT3REWGtRMHZWN0FBMnlpa0ltVzFsVjNFRkRua24rY211ZlBX?=
 =?utf-8?B?SjBxTkZHTElFdHd3eWE3ZzNQV01ud2dzTllmVVo0R3M3SVhod2NLMlB2eFll?=
 =?utf-8?B?Tk8zbzZnd2xHN0VDZVlKbUlUNXRBTmdWcDdvdk1ZekZFdXZocXRMNG5jUDl5?=
 =?utf-8?B?Yys4QlA4N2ROcUx0eFpwNm56UnVtSVBNaWVybTJnVjBiSVJQdXZvVFNaYjkr?=
 =?utf-8?B?V3dzYVd0ZmY3YnBPa3ZMVS9Jd2k4TnBUdVVRd3A2aWZYcTlnU0tWbWdXMys2?=
 =?utf-8?B?V0ZvUlNrNlRFWTZOcnFQd2FEK2t6Tk4vaTlsclRFZkpHWENrSDgrbmYyUTcy?=
 =?utf-8?B?dlc1bnoxVGt1dTFsOGpubVpMbEx5Wk9KWkJUNDhCZjNoZUhaRi9kVi9NdFJ1?=
 =?utf-8?B?UFRQdGFiUDNsajNvYmpCbDJwRDFoOW5peGo5eEtiL3QrT2Z2YnpBV0RuNEo4?=
 =?utf-8?B?ZUllR2ZwVjE4dmV2UFNnNTJpRE05VzB6bmFQcWR6all2V2FKVjNMZEQ2OTlr?=
 =?utf-8?B?VHl3eVBTcFJJUjh3NTlaVFc3TnI2eTdFUEJpZ1lPQUh5WnpwOTBoQ1N2b1Iw?=
 =?utf-8?B?RjdrZy9oQytHYUlWY2crQm5KQ3dUc0kxOGh1Q2JxaHFiQ2pFMEVVRkFYbzVK?=
 =?utf-8?B?dTFzak51OVFMbnEzWldkYjB4OU9qUG4xM2JRNGZzK2JoODVrOHFNaVg4WmRz?=
 =?utf-8?B?MEdVK1VjVXpCTm5YU01uQlpYS0VqWkdnVGordjBOSThLNEx5OTZkZEVZY20v?=
 =?utf-8?B?Skd4Nkt6VDJlTlNPMEtMVG5uYXdtd250Q1NDM25yR0tGR1A2c29wa1FJZ1RQ?=
 =?utf-8?Q?ju832ph/+0Ps9huqzsDhAK5lHKNnN3esg0ZhMzz?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UDNGYnE2SzFTQzVZbE5LVmU1UjVWMGd6TkxxdGJaOFVYTWZVNGlOREhHckhy?=
 =?utf-8?B?bGpBdEI3QnhiZjYrVTI4Wi9lNzd5eUY2ODlUSjRTNjlnQWUwZDBUWlNVMGVI?=
 =?utf-8?B?d0VoRXNNVXlob2M5a1RqTXJKOG9lQlhOTW9INzhzeTZia0JsdisveXMrZDV4?=
 =?utf-8?B?YzM4c3FIdlkxeUh2M3loSTdZUFN4Q2M4d2Z4OVRzZ0xMZTdSNStsTzl6Q24x?=
 =?utf-8?B?MmxIZnF1cHBFUGlKREtMR2paUXc2MmdYN0ZuRjRrOG4zYWdabHpSNGVESERG?=
 =?utf-8?B?L0t6TWpYSXNFa016UnlMbjl3aWZhbjNvMmJlSGg3Mno0NkdmTnNuUENHKzV6?=
 =?utf-8?B?QWREUSt4S2h3WFpjM3U0T0Z2OEYvZDZ5Tm9Wa2FLWUUrWWRWUGFCUlBtb3F5?=
 =?utf-8?B?Uzc5RG9UeFhFWTYvVXAyZjAxdHdBdEZJTlJmdXFtZ1JSNy9uVFBwQXVjNUxk?=
 =?utf-8?B?WlRzaE00YzFHdXVpN2MreU1UbDFhNWZlb2hnNTQ2cWtyNGxyd2xvNTM5d3Bl?=
 =?utf-8?B?TCtLMmt2QzJiRnphbDFoOHZrREd3YzZWU0xBR3BHTUtKRW9pZTVYMlJkNysv?=
 =?utf-8?B?RmhGZFBvaVQ3NGovWHpWRE1RWm0rN1dIbVBwV25JL1ZBRXpIL3NkSDVqaENH?=
 =?utf-8?B?cmdzaHNHa1VIS01RbUhCUEhhOUs1ZEdhdmp0NGpiSkEzb2FVaS94SnBsNUhi?=
 =?utf-8?B?M2I3NDZrZUJGNFhJTFYzY2Fnd2hPTXovYkxYRWxDUnZZWFlPMVRWRVlRaXVo?=
 =?utf-8?B?OUJlZVZlK09qM0lvZ3FkUnRab3BpbU9selZYYkhrWDk0eThsVWwrd05aWE1h?=
 =?utf-8?B?RWorOFpWNHFzN3hUTEUxKzhBVDR3K0lvWldxbEUvTlMrMmhNR1N2VFlZNExQ?=
 =?utf-8?B?cFJTVGk2amt4NHVQckVndDQxTVU5bTVldEsyTXB3TUlZN2JSb3lTVTJJcm9Q?=
 =?utf-8?B?VXNXQlZhbkMweGNWSVUxc3VVQUU2Ukp0VitSbFl6Y00rQk1xOGFURFdXQ0FT?=
 =?utf-8?B?VCtRRDBIS0lDYkdJVmRobllWZFJEdngxTC9CWEdIMkNkQVBUTk1yenNPNy9a?=
 =?utf-8?B?b3lVcjlhMUFTazVIZzdOczdNb2FLdjFnN2QrMUticUFKZjRmc2F4YUo2RFRK?=
 =?utf-8?B?NFRueWFPd0VDUmZLMGFGOWU3OEVRbVVqZy93d0l3WGJYNWN6VzBhelZUM1pU?=
 =?utf-8?B?THB6ZzdlMkxTTWRremp0ejVza1hmb2U0VEhJZ3pBc2tObUpxTjRaeEtLRTRw?=
 =?utf-8?B?cnMrZWdzTWhjc3E4YVlrbmw2V21IVExCdDF3MDZPUllTSURDRStzR3JoTFcr?=
 =?utf-8?B?bExpamJKSlhPVkNOdDlHWkNnQmNyWXE3cU9jbDZKcFBDM0NpZ1U4cGh3TkRp?=
 =?utf-8?B?Q3lKV283NnE1YUUyWGdiWm9aWkhkd2l6N2xKWlF6UDI2WHhYd0FyZjhSU3Nt?=
 =?utf-8?B?dUxuZHdldTIwL2NJVTFVUnMrNzhUczY5ODlIZ0FHZE1tSys0Mndob0MxM3VR?=
 =?utf-8?B?c0VndTZWck9LeWJqNFFBNTBwNGtEM09uc245Vm1SNHN6WnJmODBGU2hTRDdP?=
 =?utf-8?B?d2h1QmozTDIvc2NBNjJVZHNnVzZuLzQzMUUwaWp4Wmhra05DQmxxZ212bmdF?=
 =?utf-8?B?UGZuTjlqajlDU0JLRnovTTlWeHhvSGpEOTFDMzdna1BaRkkwSUdtamYvSmNq?=
 =?utf-8?B?WVpBeE4vL3lJK01uU09HYXE0WWVFWEZRRTRNNE1xWmt6NEw1OXJVK0tmQzd1?=
 =?utf-8?B?NzRCT0xObW5rYXJNS3pYYVpSc1BTbE84OXpsMkJlU09rdkErbWN2bEVNaTU5?=
 =?utf-8?B?Vkl2bE5sc2pBeWFGWVVwOWE2cUpEMUpEMVcrTmtEdVpHWUtsbnB0RkVoUGZi?=
 =?utf-8?B?QTlIWWJjckVWZHlMbUxoejFvWHBmMjBsaHZmSERrRlBIdWt6a21POVV3UHNS?=
 =?utf-8?B?OS9uZkg2SEJ4RDQzUGNUcEZoS1BBRWJUR2FCY0s3MzFMdHVodHhsckt3dmdU?=
 =?utf-8?B?NVIrVTJ3Tks2cnRmT0pkQnNKVWZUaDBSekV1UllscW5KOGc5d29NcEFzZFh2?=
 =?utf-8?B?VXh5YytOWW9DNUtlNm5sbVdWZ25MNXYxNFhEaDBMM2YwNG9KZjJzR1loaHNw?=
 =?utf-8?Q?dkcaxWRiEZJEcIUW/TBb33ZAI?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
 J7tMULVqTiWrGmN1/9Fanf75/ZV4rN3u+ndl2MxGL2Rtod5B+9fRNyRnSgAhOH1feUDuPHuuLedugjG68ESqZmwZTweY3UXb04txq8RvrFzrBiccZTrzi6T39my/eeXTCPdS+qijUJtEH0i1jrWeo4TQuWB58dfAY6TB+gixLeCQHmXXFIyiB1a2X8qIb+oAjmj7cZ2aaysrYO+1KXae6l5/Of4443bHEFSesAJ5uOuCutgor8kFdFglzLzf0P3el3w/9nVpGupWFLFV5Gju5MKE5sNr7/ONcsSSNNSmcVVC3P9BgCQtXh3KZHHpOGjBF5VWT11wwMtzQYQwfIZOLxd73Q3NGrQx48Y36Zz/RK6YBE8xkok2zJ0L+RXM63JoUrS2repCvDw9kENQf2kOPRQI6ZfZVVVrD8QKXSLGkKcGjpGdGl3Gg3J/6GJxgxJxpisaYqxucQouAFcdmFUSLB925K/Z14hJbGjdojbag7ecXKm8msqlXM5hhrmdMC13G1tdQr4DWNu0B3NkzIf07nGboWX0vudAL262D7yEMN8fC2TGwWruGJyPGqH6ddsHSR1Cwa/SL7FsjQAKVLu0WK/j0Zef711+DO0YazPE+4Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ded004b-731c-466b-75e0-08dd0a57ca71
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 18:10:33.4697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5tEvy+aNYAkh9/+FsQUJyYV8iHuCieplGqB877wy1BDOfBRvKZCEvj6Uft5HLUbMzoYMd3vRyTnT65XUlCqCyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB5967
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-21_11,2024-11-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411210137
X-Proofpoint-GUID: zRl0zH27TSuys0tFveTuD7-7g_1U_Iaw
X-Proofpoint-ORIG-GUID: zRl0zH27TSuys0tFveTuD7-7g_1U_Iaw

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

(Oops by me.)

I don't have a good feel for these things, but in dtrace_close() might 
it make more sense to move the free(dt_stmts) to right after the 
dt_program_destroy() loop?

With this patch, it also makes sense to remove the "CPC will call 
pfm_terminate()" comment in dtrace_close()

On 11/21/24 01:40, Kris Van Hees wrote:
> The array of statements was never freed.
> The PFM library data was never cleaned up.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_open.c     | 2 ++
>   libdtrace/dt_prov_cpc.c | 1 +
>   2 files changed, 3 insertions(+)
>
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index e1972aa8..717a7ad0 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -1314,6 +1314,8 @@ dtrace_close(dtrace_hdl_t *dtp)
>   		free(dirp);
>   	}
>   
> +	free(dtp->dt_stmts);
> +
>   	free(dtp->dt_cpp_argv);
>   	free(dtp->dt_cpp_path);
>   	free(dtp->dt_ld_path);
> diff --git a/libdtrace/dt_prov_cpc.c b/libdtrace/dt_prov_cpc.c
> index 8f33cf58..57b11b13 100644
> --- a/libdtrace/dt_prov_cpc.c
> +++ b/libdtrace/dt_prov_cpc.c
> @@ -484,6 +484,7 @@ static void destroy(dtrace_hdl_t *dtp, void *arg)
>   		dt_free(dtp, probe_map);
>   	}
>   	dt_free(dtp, arg);
> +	pfm_terminate();
>   }
>   
>   dt_provimpl_t	dt_cpc = {
