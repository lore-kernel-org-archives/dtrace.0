Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104EF38FA1
	for <dtrace@lists.linux.dev>; Tue, 17 Sep 2024 18:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726596359; cv=fail; b=LOktEuqHjE8Po4ChqcIbTTC2z7FY7t/O8HTJo1yaXz0ffCqKiKhSlJ8NKHZVhzYO43lfD1jnNe2LBQg+sFdAyz7KuB5NftJxGSILVGIkewNlCIGgqlpDH8nB5b3zCrqTLkzJ7iIaoZDsuKl2TnipMYOuSPRn2NOFU5cmlJIaZDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726596359; c=relaxed/simple;
	bh=vkrs9qgjYGq6DNatPLz+gD+RO1quQK20fp+MUB99Hn0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=J3x0+fLlorbua6aDe3wHyz1CKeJSHmpbvK/K30YN5o5ShFH55MXXui2PWBR5bz43n5WkM203bvXlwBRVXcGmEV2qyQuZLUIoADXNvCY/lVGEHfvNEjorBKalR3Rydz7vym+DrMBRKflpTYjTbas5/Ivsf4oyFT3KL1IvhClb3iE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=or8kKHFr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hI/JIAJG; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="or8kKHFr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hI/JIAJG"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48HEMdk3025652
	for <dtrace@lists.linux.dev>; Tue, 17 Sep 2024 18:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=HyCU5bz10VJMq90wMEB7c1xINGA1dEaakIJKv16ux70=; b=
	or8kKHFrqyuyFiYAzu8ptngcdeKg15PWEOKR3dQXC4Ix65xEJyMXBrTv7938/ilT
	BcWIK1St0s526EjibDtU0DSrSNJ0bEyb7kmxZK3aMy1iDwGVRg4Ftgcot2bAfS9o
	oAImGEpOXyiUzshZVHMJBu0lwk1N4tyF6PPmSIZqtNsZ02c9CA32CkwbMlZp7Af5
	9DLmAK0z9Lq8YU+RVH8Df4d2phFXRhQ2Z1ZMZnT9DMqGw8VzxUfF9ezDCHrDgA5E
	GgOqbuVEbzjwk3P+fGI1HlrA1dRGuTI4gACaqTK8KmTmuHRn7Ec7etneyNnD4Juk
	OYwBc7Ou5zK8eXb/cRaTrA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3rjxtym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 17 Sep 2024 18:05:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48HGt9EF034196
	for <dtrace@lists.linux.dev>; Tue, 17 Sep 2024 18:05:55 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41nych51hd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 17 Sep 2024 18:05:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C3AiwPnPQaI/VONpVBrKX+qUmi6EyEJdqxfzSI7sY5uegB4wl6FY43d2ydQpEz3L6OeiLoZW7YSuSpagy0rm72/b0iIS6dlKaKMnRw5z6TUrIWoFSpAvK4euWUvkZy4JduIhNCFAwXHKL8xYv6Car54bdIGvHDed8A3lIUDHzxd35TCUnPvW8SLLQ8xrKERv885fR4vND205ZrZjWuVZ9PHdY4fmPLkCehAsJrprZ32cxaSAcAJIquMl6JAttypwbxG9NHaViNNhotDp6vKlW0iv9CBTS1HUyZ9pZMV8NIo3VGrWcF2iqs7x1SCMa6bdEwoCVzt7od3DArFZuLftnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyCU5bz10VJMq90wMEB7c1xINGA1dEaakIJKv16ux70=;
 b=lB7QdKzFqCWy2+MsmpcxcEfYXssE7BlxWSS5K2v7+FsZhCrChH7mIkuS5wAsqG6jKYefbMeqeiPGh+aM0XqRUBBwnnzX/8cFeNbIE32wKGhv8ZE7eq98Gwq/WH2vGRcvPMVQbZI9dvnmhXNTDS9m5VrqAITZz/1I5QGLNClPOYFuim7Fa2wtY/URfNYJNmKVZL2jcCnxX1V+yAnY6GaZWzOZnjx9/sUflbrZZpIm8Kk4cwKoj9U2YrIuNz3cgWnMpkI27qjQSzkQeBtKQ7WzK7zQHbA6VaELLUCa0DOzQUiueMogamfqOLHoTakUa34ehBoOhVO7f2i4Of31sbHW1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyCU5bz10VJMq90wMEB7c1xINGA1dEaakIJKv16ux70=;
 b=hI/JIAJGPCNgU2Z0QfC1/HXYehMxOB2sF6wQHu4jQYT43S7lR6oI471V2DdZ4pmY5dg02ZU7CFGBFLYJMS1yVgVfaiwxvton+z5iXhUZ5bPdHCmGvuHVr252LmnRAan177iSpfvc26lMQfGZuClTZuD+fVsJsCzwxxRuceUIcW0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by LV3PR10MB7984.namprd10.prod.outlook.com (2603:10b6:408:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Tue, 17 Sep
 2024 18:05:50 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7982.012; Tue, 17 Sep 2024
 18:05:50 +0000
Message-ID: <d8404fc7-2253-0ee5-8a74-d38bd3401eb4@oracle.com>
Date: Tue, 17 Sep 2024 14:05:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 17/22] test: Tweak spec sizes to bracket size jumps more
 narrowly
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240829052219.3234-1-eugene.loh@oracle.com>
 <20240829052219.3234-17-eugene.loh@oracle.com> <ZuXQ/4CMmzk0nUmo@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZuXQ/4CMmzk0nUmo@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0100.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::15) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|LV3PR10MB7984:EE_
X-MS-Office365-Filtering-Correlation-Id: 07db9766-b966-4a87-8add-08dcd7435cc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UFY5eDh5b0RVWURxMzVMYTBqbHJrMERFV2pyaEt5SnNweHVNL3hjRzBaRkQ2?=
 =?utf-8?B?SjJyeG4vYUFHNFUzK2dnM1VwcHV3aEZyV2FRa1lreHlCeFRzTU9tc29hWGRD?=
 =?utf-8?B?MUhvaW1TN3pNZER2R3BOck9yUk1Jc2YwejRBdW1hRzJybnJoRTBUOFp4dXBm?=
 =?utf-8?B?a3YyTW02YVZiSG1ySC8remo1RGRtK29PREFvNWM4WlREbkZmQnJhdGRlY1F2?=
 =?utf-8?B?ekVXbWpHLzMwQklIZkxCb2xpV2h1aEo2NEliUGs0Nm9oV3kvWGtJSjBXU3hP?=
 =?utf-8?B?MDdPbGRWcis0bXhQcEordTREcFlWR1U4eC9PcDJvbWtnbWJhcjIwZjlSWktz?=
 =?utf-8?B?YkEzYko1aFZaMExhWnQreEpRTG9xci9GeEZWQlBtZWI3ZnYyK2tqUVR6MEJ0?=
 =?utf-8?B?dk5HQXNZNXZsZmlhaUhwSXZ3eCtpVlBldkZISnQyQXBPc3M1SzI2ZGNGVS9o?=
 =?utf-8?B?TFgzUWhhaE1yUG44YjcrWmZiNEpIM0dIcitlbzA5Y2p4YllBL0h2b3NrT2Zj?=
 =?utf-8?B?ZUVRaEYzOU1JZ2lCNXBRa3NZdkhFY1VSaFM1MTdtTFkrVDRkQVFRSXpSeUJn?=
 =?utf-8?B?cnp6U3NHSFdTdVcwZ0QyTFpRN2lYMEZ6MmxZVTYzWC9yaFFPWHlKdVJsdnZm?=
 =?utf-8?B?a2hsWHBKNE1abVM3RFc0WHJadm53cFVpYlJVb3hEZDIxb2pPUFhtVGdlZTE2?=
 =?utf-8?B?YmZmZ0l6REhvQ21xYmlGT1lZeUo5RXh6TlJ2Y2dlOU1VOUZsRjBORDhyN2ty?=
 =?utf-8?B?aXBJblBMbGYzYlRkckpBV1V5NmoySi9lc2pjMUNDQXROaXNmUDdiNi9WR3hh?=
 =?utf-8?B?VExIeG53dk1BWkJoL0R4UmwrREVsRUk3eS9Kc3pnbDJBbHJCTVJUSVQxZ01C?=
 =?utf-8?B?Y1VQWC91enNXNHR0TVBOTUFHeTRSSUk1MGkxVHFaTUpiS0toeGRMdTFRMGVE?=
 =?utf-8?B?M0NMNmM1R3A0b1Bpc3lad2R1c3RQaFBqVVVrK2R3TGZNWE5DcmtFbk56SjdY?=
 =?utf-8?B?ZlpzR0pPMGo4UlNWU2libjZldWo3ZDVKdXZuTms4VTZDVjJ6RlJ2VFdEaGxK?=
 =?utf-8?B?ck5wdE90S1ZFNnpqRTM5VUFMc25kS1FZYmZrY1laQzg2b0VndDBUdlB2N0RV?=
 =?utf-8?B?RWUxUFlYb01VdzlTM0VvZ240RmMwT2FDRnVlYXkzVUZJVW5SRFprYWJOcW9m?=
 =?utf-8?B?SFRITlY5MGxHZnI3dlRVenN2a0lWT05idk54aW03N3gwOE9mRVB6V0ZBNU5H?=
 =?utf-8?B?UHd3ZXNKQVBHdldvRjdIdlgzeVNtSlpWcWlCS3BFaG5GQVdLMitXNi85bjBp?=
 =?utf-8?B?eHNFVzNyaXM4RDNGbEY2R2JHUmtGditRV2hNN0ozREVtNk5BNTF6Q0RCTDZH?=
 =?utf-8?B?MEkrNUNxN1BUYWUyQTBQay91UVRabXNpV3E2Q3JaYnRnbUtYMi9scG1HTU14?=
 =?utf-8?B?REhUSE9iRkw2aks0L3Z3THdQWHgxVkczcWxqNW5jOVJtVGdrbUpyL1haVS9s?=
 =?utf-8?B?RURUczd1d2swMllMQ2lQWmQ5OHZ4anNwZWtXZGVqTXRudTZHYTcrN1hLSnNp?=
 =?utf-8?B?YW9JZ09Fb2lad2dQbFFWZmNBTlRhUzQ0NzdQQ3dzbjE1UWJneXpFYUlVV0hU?=
 =?utf-8?B?YjBYS3pSbUIrdnozdXNJY3lwSXZtaEVRRHJnVml2dVVKdzNkemdtVGdwK1Bz?=
 =?utf-8?B?OWhyYUdPUXJsalZsMVFGcGcxcHQrU3EyNWV1cktCUW5DT2tpd0VsTFBDVklF?=
 =?utf-8?B?cmJ1aU10dGxoWDB6amUyd3loRmk2ZzBGSS8zbEwrV1ByVFM1aHVHMjJqUTRn?=
 =?utf-8?B?b0pjcWE2R1JKQ1haVjl3UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFRWakxkMDRzYnNzaEd5akFUMmFoWHhDbS92allseEJMeUk2VERycTdzV1ZK?=
 =?utf-8?B?ZXFDaFgyTk9DZnBOZFZPS1JqQ0pPVnFlaEF6dDlML0owTW5jVW9zc2xvZ040?=
 =?utf-8?B?YVQraXpUNlNZQjlXRnN4MlppWnVsaHhBRkR0RDdrd0pkRW5BRGRndk9heTky?=
 =?utf-8?B?Y0NnaTFZaUZYalh6RWtLMDY1Vm5zRlNXa1hDanJCWFVsMTJQUkN2Rm54Qjl6?=
 =?utf-8?B?bjZCbkJ0TlBnTTkya0tOeml5VStqSGpqMGJQVU9rb1BGOHE4aVoyODU2cHh3?=
 =?utf-8?B?TTB4aHl3REpLM1FWVWMrMC9mTXk0NUdVaC9uRzAzbWxDRlRJM25wbENnazRQ?=
 =?utf-8?B?eFB4Qnh5bXZvYVkrUWFKa01ybkQ0TGJTRWxhdHpXMUh0elJaUXM2cHpkOEoy?=
 =?utf-8?B?YVZRRkZFSnNtOWlBTEdGNHBwdW10UGJhYURwVExVYkJPem1SYURLaFJZdUdP?=
 =?utf-8?B?cXdxRS9KQzF0VXZmYnl3MTN2SStoUmdhTk94ajVQOG9MN0IwQS95U2RVTjVo?=
 =?utf-8?B?dWtLSENBTnNvTjVSRjVKMzlwYjRjTVJUU21jUVlCaURaWDRrVTh5a2RkTUxE?=
 =?utf-8?B?MDNDQm9DQmgvNS9TeUc1S01Wc2E0MjF5cTBHbGJ4RzVDUk5aR2gyWFhJWkgv?=
 =?utf-8?B?czNpUUlXb2ZtN0s1OFhWRktQYzhZemp4dXhHNUs2Mi96a1dsV2ltN0xGclFr?=
 =?utf-8?B?L2hlYVJkNVovaGxsMU9HM2trY3NERE1ma3Awdm5EaTdEUjQyT1c2QzdnSHpE?=
 =?utf-8?B?K3IyTE5KRFRHdC94RHlObjlLK01RN1U4a2piUzNIdlErSGVmUUFjTVFSWGtY?=
 =?utf-8?B?eWJadDREdkNhWEhxRDBWcHFoUWRKdEd3K2pJa3A3RmJTc2dkSUFjWDdrSUdX?=
 =?utf-8?B?aElYNFZzK0VzZHhYV2wvMHRydnRiMzROd1k1Qkg0L2huMGZvTGtjR0ZPdEZW?=
 =?utf-8?B?UTRCR3czdWJQclQwRWNZQVpQczBLRStjdTVERlB0cWpiYkZYY1RrY0RuN0F1?=
 =?utf-8?B?S3MyeUZ4a0kxOCtaY3dKdFBneFBBQ2lFeVBJVE5UcGtJWnhxcllPR2VaUTZ3?=
 =?utf-8?B?QUEyQ3lXVUE3V1RSMDNVYjhSK2RiZUoxbjZSV3hkUE5MSW5aK0dmQnA0SkZn?=
 =?utf-8?B?UFh2YUYrQjZFd1lDRmpKenB1WTZuVjlOODJ0K3c2NXpYVldQTHB1QzdVM3kw?=
 =?utf-8?B?TU1ZYXN3NEZSbCtyN1dPaUVQQk9RRXVRSy9DRU4rWHlLV1UxTG05cVRzc0lt?=
 =?utf-8?B?dVlXVjk2ekh0OVBrMm9lY1BUZlJLMERJaWErTGVoV1FPc1RqcmxPMFVHcDVy?=
 =?utf-8?B?VGRUaFlORk1qOVo3YWpoK3JNc25uQmhZdVk4ajQ2Tng4TUl6TmhUTVVHMGlZ?=
 =?utf-8?B?VlFzck9KMWt2ZHdNaGhXaXIvc1hZYW4zSW9rSHNPdmxoTzYwcDV5WTVRYnRZ?=
 =?utf-8?B?MWE1cDFUQ2hkZzhJNXhVaU54YnR0bGRtQm14S0lsbzhzMFZPamhjS255ajhk?=
 =?utf-8?B?bjdnbW1ORzZxaVh2ZFFYSy8vZ2pHVUtadmhIQnlCMzNlYUVxUzNMb3J0WFZZ?=
 =?utf-8?B?bmp5d3U4UFR5YkdPL2NaYXl2Y0ZYa2EvTjcxd2ZTd1pIcTJUanZlVE42WHRl?=
 =?utf-8?B?b2xGaC96YnJNU2FmMldIdjlPQ3ZDVXhFcTRuZDRSZTA4TjYySkp3U3loRnZa?=
 =?utf-8?B?VitHY3FjNVZTME8velh0TzRkSHBxSFN1Wk4yZElKRTBhM2dINEZ6YWF3dFFN?=
 =?utf-8?B?WUFjbmFQdUY0eTd3TEZ3Wld5ZGZnZDNidW1WQ0g1QVlJZFVZSTdYOEkzbkxm?=
 =?utf-8?B?b0tmOG9MUnFwODR1WlFyNlViVVo5b1lPTG5WYWt1MEhVOWJ2RVU0TGhPSWJX?=
 =?utf-8?B?NEVyUFZLM0hia3ZvVkRqVUI0bS9KSTZCRlJjUmNFZ1J3d2hQTlN3cmo3L3Ux?=
 =?utf-8?B?Nzk1MmFzcnlRVC9MZHZKaEhHYVdRK2F5dFZrWGxZM2NRaER6Nk9KWW1TbkhO?=
 =?utf-8?B?YTB2NkNCOHNxWWVteU5kWW5QSkd5TEhQN25QSDY2aUJ0UnFtUDRTRmlEZ2JZ?=
 =?utf-8?B?S05PMUxNWmlRNzdmbkd0ZEZZcW9PMTFHWWF0aG1CSFNDeEpudGpYMXRNaWFl?=
 =?utf-8?Q?OcYJU5VlnZRWif7uGBOuV+Oih?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/O1A1Ei6ef6ngFpNpVMwuloAjzMdmddT6QiC5gCXW3fcjpt0x0yqjVlqCVYdfWM93GGFDU2+idiHagw22zohXJM90xtJZe0bN7bCmnYjj8gLlw8y3qFP1wQiS0mToAMKlc2theA5a93R9a3xAm1h1rNqiiJ+bnRCVkecRL97rRRZG/tLSbOVe9AFs5ohAd2K8zlIhLNT0BtI6dyFDilkGj7sph1F7ohkV5kWu1bALRUJm4TxuNJ58i0W0uzfjltw7jwA9ha4lXFERyTHsrc/Qg3HoFvsfP+w9aAsbgLP00vvU99qWfrtgwO/wio5JVW2G7w76xuptSYznukDHZ2USTpNxH/Rsz8eXHD204G92zCPAc5hld+8EIoKYkL7ZgkTJkuE9bq4NlBgUW+c62tSnynhkdgucHaRwlmUBK4p8tMZl7lQd5HTZw/IKB64z3xI9V/VxWnZJhsb/pEXm6tKEzW3iMMrWgmpvHYjTeuA1txitfQ0kEu71ztcMmlvq3oTxuSECjrYLNT4mKk0SFQYUa+0p4R/1fbTGIOPrLzn63yFHyyhJ740okNIA14lAtm5b6XtKwwLdaJA6pmpuNLTYb8P6iyECZilVkSt7nMobpQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07db9766-b966-4a87-8add-08dcd7435cc8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 18:05:50.1796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c1uJfu/44PNJIct5yVvCWiqNMklsiXANMNAHrMW3NTC6Rq1tFM3tKd/9c4QTxmK3XXdzIVSfxeni5frhC9GF5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7984
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-17_08,2024-09-16_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409170128
X-Proofpoint-ORIG-GUID: iH6pc9Kt3dU9QzPRBl4Cxn7IjbrIkUk_
X-Proofpoint-GUID: iH6pc9Kt3dU9QzPRBl4Cxn7IjbrIkUk_

Yeah.  I think this is due to patch ordering.  The sizes depend on the 
new "Deprecate EPID" patch;  that patch, in turn, needs new sizes, 
whether narrow or not.

I guess I'll withdraw this 17/22 patch and just squash it into the 
already large 03/19 "Deprecate enabled probe ID (epid)"... v6.

On 9/14/24 14:07, Kris Van Hees wrote:
> This test gives me faqilures.
>
> runtest.log in attachment
>
> On Thu, Aug 29, 2024 at 01:22:14AM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   .../speculation/tst.SpecSizeVariations.r      | 22 -------------------
>>   .../speculation/tst.SpecSizeVariations.sh     |  2 +-
>>   2 files changed, 1 insertion(+), 23 deletions(-)
>>
>> diff --git a/test/unittest/speculation/tst.SpecSizeVariations.r b/test/unittest/speculation/tst.SpecSizeVariations.r
>> index 51f0596c..2748b307 100644
>> --- a/test/unittest/speculation/tst.SpecSizeVariations.r
>> +++ b/test/unittest/speculation/tst.SpecSizeVariations.r
>> @@ -11,26 +11,6 @@ Speculative buffer ID: 1
>>   123456706
>>   counts: 1 1
>>   
>> -Speculative buffer ID: 1
>> -123456700
>> -123456701
>> -123456702
>> -123456703
>> -123456704
>> -123456705
>> -123456706
>> -counts: 1 1
>> -
>> -Speculative buffer ID: 1
>> -123456700
>> -123456701
>> -123456702
>> -123456703
>> -123456704
>> -123456705
>> -123456706
>> -counts: 2 1
>> -
>>   Speculative buffer ID: 1
>>   123456700
>>   123456701
>> @@ -64,5 +44,3 @@ counts: 2 1
>>   dtrace: 2 speculative drops
>>   dtrace: 1 speculative drop
>>   dtrace: 1 speculative drop
>> -dtrace: 1 speculative drop
>> -dtrace: 1 speculative drop
>> diff --git a/test/unittest/speculation/tst.SpecSizeVariations.sh b/test/unittest/speculation/tst.SpecSizeVariations.sh
>> index 75e527d9..79995b59 100755
>> --- a/test/unittest/speculation/tst.SpecSizeVariations.sh
>> +++ b/test/unittest/speculation/tst.SpecSizeVariations.sh
>> @@ -9,7 +9,7 @@
>>   
>>   dtrace=$1
>>   
>> -for x in 63 64 79 80 143 144; do
>> +for x in 71 72 159 160; do
>>   	$dtrace $dt_flags -xspecsize=$x -qn '
>>   	BEGIN
>>   	{
>> -- 
>> 2.43.5
>>
