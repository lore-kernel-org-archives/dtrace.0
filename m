Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3568F70
	for <dtrace@lists.linux.dev>; Sat,  7 Sep 2024 01:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725672323; cv=fail; b=plIK4VbuP6duatkUqPrhJuptOnMp/sNiIMQNM9ksMukpiKISFVxNKu7WhxcHACovJuKIUSO3/yVm/CtoFAZt5oZX6GFzYQYUAnep3prGP832+zyOG2NtaeLOba3o2iBTvhTcw+bAxlqoMAO8QiVFqeS2s1+WnKtDCkMl1/8WVlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725672323; c=relaxed/simple;
	bh=fvsX5WIX0x2YkguBsxqEJeCRGHXvY+bf+957lz8Y5WU=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=diSQCrKw2SY5g2H7YpRBYNz6tTeInmIHh/2c9w+syxhbXRc+daLfzqpuSu0kjGoZaj3i0TV0U9e5T4wcejAOIfEzq3gHFcYWIOix0LNbHlkkZXV/fjxiHlHS2gNGNFT/BXPyeF032Z8VGTj6ZKYPuDo4mJ1Reap7hrPCgSKtJEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hGKm9rk4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=k57SZGOo; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hGKm9rk4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="k57SZGOo"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 486KXYwf032665
	for <dtrace@lists.linux.dev>; Sat, 7 Sep 2024 01:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=XaYG9GG95cYDtbEjB45onPtFSr8lqeXHKMZw8c+B0ss=; b=
	hGKm9rk4CnsYwbAkCZnhHaHjTsftr1N1oiUFQYGP1/Xv/cskWybI2xNhuKxva9GL
	U/nls+8wVQiKi7pWBZ4pDmFQ03+PISjsZI4w+0WpI/9IC5KoLD+QpYEdueCnelF0
	xTdWXpB7OjeRn6u8im3OqWMeK3JwV8EQvbtDgzhqmZjJ7AIh3qe49VS/XGvwic7s
	NF1XHEoYrElxS+kVghXThg4iItLYyEmkU9LNnqVKM5ENiy8QEHjNkOS1AAw872zs
	X2ahPPOm/jI5DFSOK0PCsMs3lhtsxjb6ca25eRKjtHhkKYtlcl/N+RijLB5SvlF/
	FTxIxUlmhWRmlg7b8ToAoQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41fhwhjupj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Sep 2024 01:25:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 486NHchC006926
	for <dtrace@lists.linux.dev>; Sat, 7 Sep 2024 01:25:19 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2045.outbound.protection.outlook.com [104.47.74.45])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41fhydk8j5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Sep 2024 01:25:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sj1sKDTb2ucvQ67PxSkXYGbBNj6NeXoxG/zrdRu0jeu4izX1zkUxyiOqdlzEn81TBMcPv9ho0pZ5cmChfvh14YFbbMwYZcZoyUdU/2zXcS9/IFhBRmfjiEWIcvQLNbQFtGvKUiLdrnU7y3bD9u27MUqwQ6y55kzOT+WHphynJpJ6RgSvtC9uAvVp5tI0oAUqKTZjdBaCSEu+QV3WOwZsuXhPIBEiB4V9cwmjT6StGbKHa47XsFpffxdJbXNhs0q4FQUYUhRx1I/3FPEe4tc34uv972xTCKgxfRLaehuXhjAgTMLF7zI/Q2UednQvTA8qOQiZXj4GygrnGsu1Px8wXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaYG9GG95cYDtbEjB45onPtFSr8lqeXHKMZw8c+B0ss=;
 b=ChrjUREFZQB+WJ+4t1QHid5zBi0mTs9eip5Piw673/+rQgnadxZG7g9/LcWZtg9RW0keZ5yuRTzCESjba1/bGIIvU8EDwkC437JCw1ZDd84Kj3lykI/g8lMYpzVeUVPieXadKb/9zkfGpPvr+1eojSNn90gDUn06WQTqWia86NcWTuf4T4qS3bbzYfMlmAJQp77s/itnvZVkJN0jZzlD1HgN3dEixe/J8q/+oUpLHsjGix6nBM82O7C3qiFCN3nKBVOd+u/5mCtObiydbhQCGHEMyLQsBlRK+nrvD1+sfbZNO9Iki1tZqHfL3h9Y90JIK8T/r0WBy2yTI7K7t9lq/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaYG9GG95cYDtbEjB45onPtFSr8lqeXHKMZw8c+B0ss=;
 b=k57SZGOoZ+R1nQ/nAb55fvkDHx8xxBdbTWvXaTbQDwyQBkE/WHNxvM6f8qbGwyxCHnVr5f25XyJVAzN/xAt+E7Low26prlCh7c8cmhXSmDhW9dH0p1x4Noxj8EthCZYDXiqMyiTyajhD43rG2Znvvhh9u3ftIemmjku0KLISgbw=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SN7PR10MB6329.namprd10.prod.outlook.com (2603:10b6:806:273::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.9; Sat, 7 Sep
 2024 01:25:16 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7939.010; Sat, 7 Sep 2024
 01:25:15 +0000
Message-ID: <d009801f-28e4-3b69-3f2f-ae99b577c1bd@oracle.com>
Date: Fri, 6 Sep 2024 21:25:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 05/22] Set the ERROR PRID in BPF code
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240829052219.3234-1-eugene.loh@oracle.com>
 <20240829052219.3234-5-eugene.loh@oracle.com> <ZtucZiRk7G7UVktd@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZtucZiRk7G7UVktd@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR15CA0041.namprd15.prod.outlook.com
 (2603:10b6:208:237::10) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SN7PR10MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: ef96bbc1-5b20-41f4-7119-08dccedbed44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXRVU05MQnpkSU9xeWt4Qm02UE9ZbmtZV3FvVkxOZFBiVm5xbU5OV25lM0FZ?=
 =?utf-8?B?WDdQYlQzMkJDOWVleWNTdlllOGU4T3ZIQ3RhbWRxQU9XbTQzSGl3QmsyREc2?=
 =?utf-8?B?RmxraWs2bll0TGJnVml0S0VqSmtBWEZRSkhKa24vQjFZV3lzME4rUmxGclc3?=
 =?utf-8?B?V2dHbUlQMllHM0YzVDBtUmRSQmZzRjBRdlhqcWZRUTN2S2kzWE41Z1ZZQ3JZ?=
 =?utf-8?B?Q0pic2FMbEE4NjlEdUtLOVNwbnExV0hSQVlmNGMwL0FFTDRISkc3VDJQTllk?=
 =?utf-8?B?cXVQbDBRbzRFNUJ0RDZyK0t1VmRObmQ3YnRjMlNQUXhRTDVaSVQvczRVTjd3?=
 =?utf-8?B?dW9GM0Q2aHVQWjRPRG1RYlNkaFBnMU90WkZ0RlJJcGdoME5WZkRqTzczL1dU?=
 =?utf-8?B?SkZNSFZxcHFEaUtxUVY5dHBzSVRZYmJ6UFk1T2tlVzVrVHRJNERqOG1yeFZy?=
 =?utf-8?B?dzlMMStqV2tleFZnM2kyVE1YUUt0QURYQkYyb0s0ZGd6ZUd2NHlJNzg0R3Aw?=
 =?utf-8?B?QUQrSDVIZFhuZ2ZFS2hPelRqSWVoUXYxcmVSajZyVGpGQWdSSFowZkREcnhB?=
 =?utf-8?B?SFNsdG9mR0N6TjY5VUJFTU9CR1NSZExRdzB2MW9IWXNRd3pMekF1TFhtM2hv?=
 =?utf-8?B?NTlUcDZydGp2QlVqeGhjUmljRU8xYm9IS1JTZXlDZDRhZXRDdmRNQnBReTho?=
 =?utf-8?B?dEVlSTNKdVhXaDZNdEtSVmh2YjNNWU5KeTJKSWc3SXlubng0T2owMmZuNksy?=
 =?utf-8?B?S1pRaE5WUnlvUVlmdmorOEF3cnNRcTBLZU5OSmg4UHZ0YzhnNmNyd3hTYTV6?=
 =?utf-8?B?QlNmKzlqNHcrQ3JQdFJHb2wvSGtxQnpLUURMQzdzb2l1MU1Bdk1hT3NOUnJP?=
 =?utf-8?B?SmdUMkhwQ25Kb1NWNnF4K05rK0dYNHlBVng3VkdwTllLYTZLQit3NG1jRmZF?=
 =?utf-8?B?NkpnaWQ3K3ZrTk9KK2J1bG5wZEdYUUFtSjlka3F2UWZEMHNFdWtPbWFieit4?=
 =?utf-8?B?MkR4WWEyMGNKRnE3cjZzbjRLVHFPbHpIaXdWU2JXRWlvVHd0aTRiU3UydjVv?=
 =?utf-8?B?ZWpaRk82MUIrOGhuaGFXNytGeVdPK3hYb2cvNVZLVUZKM3RlYzdGMWZJMTdT?=
 =?utf-8?B?a0pKbHdYVFpJeXVIQ0V4Y2swbE5IaFBBeEJZQ3luNmcxYklLVzNKSVllMHhk?=
 =?utf-8?B?T21jTmRFWnRKTnNDTWRRMUxxVGlmR3J1M3grWVA3c2VQVFN3bE9hNkFobUlW?=
 =?utf-8?B?Y0NZYXU2eWVrSmtRZFJ5dThvMnY4ak42T3lhbnZyeVEyOWcyNlJvQWFCMzlB?=
 =?utf-8?B?Q0luYUc0cklHNzBHa2hHVFJJdmhiL25ESk53Zkg2SGVqL3d5YkFDMWZucjlU?=
 =?utf-8?B?WWVXZi81d2tJVVJTT09CQ1RJbUlyWTBOUVY4SGtFQUZhbWV1MkExTzVxM2pU?=
 =?utf-8?B?MXpMT3RZb0tBelVNeGdQcERDZkUrNHpzdUJPY1haSmpHbk51b29HRGFqYzNI?=
 =?utf-8?B?elJsakdhUWpXU2hNQmp0N1pUZzNWaDJBNVN1WG0zRElxT0pPTnBhYUZZRkdN?=
 =?utf-8?B?bnZtcXp5Nlp6amVwU3JrdnMzUHpSSStHbitzY1FpVjI5YzVhaWg5cERlcktO?=
 =?utf-8?B?djU2Q3YrT2RPOFRMRzkvdTNmWE9MWndkNk1jRDR2aWkxRkx4aTlpOVp3WXpn?=
 =?utf-8?B?NjlQdXRRT1pmUmZjeGxYSVh2R3Z4UldFQzVROHFjaWpiMUF1emc1eXl0NjI2?=
 =?utf-8?B?RE96ZzRGOHhtRnhYdWZPT3ZNUHEvOVNVbmIxbDVqTDRBSmhHa0EzUk1kVmxs?=
 =?utf-8?Q?uonsSJFRW5k8ePfWfPWQQO4HRq5LlKhGK9N/k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkZtaERQUU9HY2d0alE3ZWxUcWNmVHVYeXdLQ1c4ZFBrWTV0Zzl2cmhnMEEr?=
 =?utf-8?B?UHhXZmMyR2lURXdFei9TRXFMd3FtbXZmdWpSYldhMElXc2E5NjBoMjZJa0h2?=
 =?utf-8?B?UkVGTXd0ZE5jU0lDMnZBQUgxMi93QUV2bS9DNmc1OVI4MWRraXppaURqOTc0?=
 =?utf-8?B?MzlkODJneTBZK0liUlVWRjFhSkFBM3h6YnJlY3FHU1prUUNKb29LaUVFaFhN?=
 =?utf-8?B?OTlOMERpZEdBUEcrWVFGYU5JZlNHRHFUYWV0Uk50KzJMSGdHQTF1cGdadHZp?=
 =?utf-8?B?anlsR0plVGxqUGdmVXhEQTl2SVpsZEZtRkRZc0NURkxJS1hzOS9xc0VvU0ZO?=
 =?utf-8?B?dEFQK01JVTFZZlg3aCsrbWZSZTk1MzEybWlFSnZKdHpvWWRQWUgvNWFpOW42?=
 =?utf-8?B?Yk9Kbkx3OVRNY3FNSzdBOXJBZEhXbjdlYmNNamw2S0dyK3RxVGtKYkYrcjE5?=
 =?utf-8?B?ZTFQaTF1OUlPcG15SFVmVGtjcmFWVzcwN0tJSlBOWXNndGVOWTg0N2pxdjFu?=
 =?utf-8?B?anRxZWZ0c25DMEJYVVBGV0ZQcnN1aEFUWnVCU3RXRk1KazVSUmx6NzhnMGh3?=
 =?utf-8?B?T1FSd2poUXJqclJBL1BlaDlqbFFUeHAzTFdxK3FTRytodmwrR2x2ZVNRc3hC?=
 =?utf-8?B?UHdrUmwxdTBUL21xUGVyZjlHYlRkNHJYRElrM2QxcFBmdVhEYjEyUERraHJv?=
 =?utf-8?B?bE1yaFFWajJ5NGxxN0ttUm0xbHVFZm1sZi9BNmZDVjNOLzFTSGtJSWM4UXdM?=
 =?utf-8?B?OUJyRTJ6UGNoZWZsb2QvMWF4NjhJVHNHTG1PUnpsaU1BbUI5N0ZJeDJCbFVI?=
 =?utf-8?B?VUxGOW9qeUdkaXBKbWF0b1dlMjFkOEpoTlc2ZGw5T1hGWVBUcmJSTDhoNFpq?=
 =?utf-8?B?d0J2YkVzYTEySXAzL0p1Ykl5c3d0K3JZSEExVkp0LzhlTzJ6eVpDTXBwaHh6?=
 =?utf-8?B?UzVzUkhpbkpJK2l2R0g0MnlOSjgvLzBrbk41MG5ZTlZIWUEvejFvTlFlVDZ4?=
 =?utf-8?B?ZWQxdVFIbG8zaGUvLy9oaTFHdy9lMmlTekxSYWZKcEhyZmIvek83ZCtzc1NK?=
 =?utf-8?B?S29ORE9aZHphL0dLUHpzQllBOW9xVS9LN1VRLzdpSE1TRmliU25yck5uSHY3?=
 =?utf-8?B?Z041RmdrazkrLzZzbWU2U3RDcWdZMnAvTmtlTEo2bDNNam9yNU5hSVRaS0dE?=
 =?utf-8?B?Q2dDL0J3aldzVXFLWEcyNGV4R2F5dVlubXE1MGRNWmxpcUxGTVJwL3J0MzlB?=
 =?utf-8?B?eEVRSURVZzBQeW5udVhRYllYbS8zdDFPOVJ2NnVBYVFBOWI1U0dXcS93cnB1?=
 =?utf-8?B?SVdQbW5kSG1HU3pwd3BCZExrVXZTdFQ3TnFadGFWc2hIaHN5ZVcycEF0ODN0?=
 =?utf-8?B?WUw4RTdaaVIyRkZYcVlyUXBGeUI2UmYwSUwvdjY5Vzl1UWZ1Q0xINmpaYmI3?=
 =?utf-8?B?K0ZJK2E4a3RyekhkTUtpQ2RhSVdQUE41UzRObkFVMldJQlN4OUVVZnNZMFg3?=
 =?utf-8?B?VXZ1V0pIMnpZd0h6Rm5NeWxTMnRvVk82Q2VpdFB1cDdzcGI1QmNIc2RxZnFu?=
 =?utf-8?B?Qk16VXhPdzY2QWhNVUtpK3d2ODNiN3VXTVcvODhzVHlNOXpzbVFHcFVudmFy?=
 =?utf-8?B?dENFMVdTOS8rMGIySk9VSnl5V2FwVzdoTlo1RWl5cGZWOEQ0V0N2bmJ5WkRi?=
 =?utf-8?B?bkdRR0RBdlZ6WEM0UEMyUCsrcmVLUTFTNDBsZENZL1o3djhoNURwSVFzdmV3?=
 =?utf-8?B?bkVra280ejlRdWYzdnhtSmNoTDZZcVY2a0VlNk9CWGlmZDJHa2pKY3RkMzlO?=
 =?utf-8?B?SVVCOVl0TTA2MHIxRUI3d1VWR0lEOGFMYVFQWmZkS1Q0WXJwSUhaM0FUMlRh?=
 =?utf-8?B?TVRXdGNvY2xSejZIV2ZJUzFhaEt6b1FLbDZIMEFHRmwzUDgvS2tYd1puYit6?=
 =?utf-8?B?dHNWWnZSY0M0Q212OC8rejRZWVRHcW9CeUFBcG1wWGgxSCsraWJrc1lwQXFP?=
 =?utf-8?B?aVZ1L3VoN3kyTDdER3R1b2RJYmQwblZTYTVLR1RDWTBITnZrVWE0eW5IVHYy?=
 =?utf-8?B?L3hLa0g3eDVDRTg4T2V3akx3WDF5eG9ZSnVIaU1BRXY2eWlMMStFclZjem5Q?=
 =?utf-8?Q?/wUZoyPFGvSCC2oYqAiOuMQP1?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9B8hQJXyalLFiCqTlzuYQIibwbM+i2i3bQqTnLu/NkxqTRItQa/ZP86ocmPk6bTdIuHRfYqyGz4LvBnNTQ5cIPmr9U7UpRt5zgHieaFY2NnL+Hb0OfjkmsDGb6yWaHjMzyuw3bTPqzAKyNs5lwsIQyUxuxYn9anbJena3iMvbAy11kkcltNBLrpx44A/15mjnUGHp7EY3XmF/fwGYMMtPdcFdehz4XYsBG68pGt/7Px/irplR4Z/XK3fksSinQ8N19TxkwJnGdLsTXuBGRMLPzKv0KOjfsUFaiV2LcX2EYTrtCE1bbKoRyD9YrA2LyY+TsK0A5XTY8dXyb5t7UgUIUZIeTnsnZo9nlKbmFghytBgIgNXG2OM4BAsIIS3niNNMvonZBVq8RhmbI4WOSSLxB6U/3Lkue3Kl0R2eIi3XeTgD5ytjbTB2PDf+T26DNtd+L52WsMVkGrERaKoD1AiEdkgploAiEUX6U6VXBhW8Hws2++27WaS83IU1y6FsEGpwe8oddjlNdenUuamtVBoaxwDKYzyL7Pxd07u57MN68T/vBUCOYOZfHpO9Ga/QYijpRX46C2o/hCcgl17xv2RoTMLZMdwgvMMMOaFD5Wze48=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef96bbc1-5b20-41f4-7119-08dccedbed44
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2024 01:25:15.5407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qGAtiYQ/wyXmi3J5f3OTFvVzuS4I7pUUhrptzexz/dvFWyLVWxNhqu1vuBYV6gz6rH594mFAUcMPQA1VES4bNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6329
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409070009
X-Proofpoint-ORIG-GUID: aLclKhwxanyxyv9c1qFwxcIvdcIVcnHI
X-Proofpoint-GUID: aLclKhwxanyxyv9c1qFwxcIvdcIVcnHI

On 9/6/24 20:20, Kris Van Hees wrote:

> On Thu, Aug 29, 2024 at 01:22:02AM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> We use the fact that the ERROR PRID is always 3.
> Where do we use it?  We certainly should never override the probe id that is
> assigned by dtrace when providers provide probes.  Will it always be 3?  Almost
> certainly, yes.  But the right way to do this is to actually make the ERROR
> PRID available as a symbol that can be resolved at program load time, so that
> the dt_probe_error function can get to its value.

I'm confused?  I thought I did this and you suggested simply hardwiring 
the value 3. 
https://oss.oracle.com/pipermail/dtrace-devel/2024-July/004989.html

> Anyway, the need to restore the mst->prid value in this patch also highlights
> that there is a much bigger problem...  A fault in one clause contaminates the
> first 6 arguments of the probe, and since a fault only interrupts the execution
> of the current clause, following clauses will no longer see the correct values
> of the first 6 arguments but rather the ones that dt_probe_error() stored in
> mst->argv[0 .. 5].  That is a bug for sure!

Good point, but... a separate issue/patch?

> Here is a test that demonstrates this issue:
>
> #pragma D option quiet
>
> syscall::write*:entry
> {
> 	self->arg0 = arg0;
> 	self->arg1 = arg1;
> 	self->arg2 = arg2;
> 	self->arg3 = arg3;
> 	self->arg4 = arg4;
> 	self->arg5 = arg5;
>
> 	printf("%d / %d / %d / %d / %d / %d\n",
> 	       arg0, arg1, arg2, arg3, arg4, arg5);
> }
>
> syscall::write*:entry
> {
> 	trace(*(int *)0);
> }
>
> syscall::write*:entry,
> ERROR {
> 	printf("%d / %d / %d / %d / %d / %d\n",
> 	       arg0, arg1, arg2, arg3, arg4, arg5);
> }
>
> syscall::write*:entry
> {
> 	exit(self->arg0 != arg0 || self->arg1 != arg1 || self->arg2 != arg2 ||
> 	     self->arg3 != arg3 || self->arg4 != arg4 || self->arg5 != arg5
> 		? 1 : 0);
> }
>
> So, we need the ERROR prid value exposed as an external symbol so that it can
> be used in dt_probe_error(), and a patch that fixes the contamination of the
> arg values.
>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   bpf/probe_error.c                         |  3 +++
>>   test/unittest/builtinvar/tst.id_ERROR.d   | 32 +++++++++++++++++++++++
>>   test/unittest/builtinvar/tst.id_ERROR.r   |  3 +++
>>   test/unittest/builtinvar/tst.id_ERROR.r.p |  4 +++
>>   4 files changed, 42 insertions(+)
>>   create mode 100644 test/unittest/builtinvar/tst.id_ERROR.d
>>   create mode 100644 test/unittest/builtinvar/tst.id_ERROR.r
>>   create mode 100755 test/unittest/builtinvar/tst.id_ERROR.r.p
>>
>> diff --git a/bpf/probe_error.c b/bpf/probe_error.c
>> index c8ddcdfa..ee1a1793 100644
>> --- a/bpf/probe_error.c
>> +++ b/bpf/probe_error.c
>> @@ -26,6 +26,7 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
>>   			     uint64_t illval)
>>   {
>>   	dt_mstate_t	*mst = dctx->mst;
>> +	int		oldprid = mst->prid;
>>   
>>   	mst->argv[0] = 0;
>>   	mst->argv[1] = mst->epid;
>> @@ -34,7 +35,9 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
>>   	mst->argv[4] = fault;
>>   	mst->argv[5] = illval;
>>   
>> +	mst->prid = 3;
>>   	dt_error(dctx);
>> +	mst->prid = oldprid;
>>   
>>   	mst->fault = fault;
>>   }
>> diff --git a/test/unittest/builtinvar/tst.id_ERROR.d b/test/unittest/builtinvar/tst.id_ERROR.d
>> new file mode 100644
>> index 00000000..59021c60
>> --- /dev/null
>> +++ b/test/unittest/builtinvar/tst.id_ERROR.d
>> @@ -0,0 +1,32 @@
>> +/*
>> + * Oracle Linux DTrace.
>> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
>> + * Licensed under the Universal Permissive License v 1.0 as shown at
>> + * http://oss.oracle.com/licenses/upl.
>> + */
>> +
>> +/*
>> + * ASSERTION:
>> + * The id in the ERROR probe is 3.
>> + *
>> + * SECTION: Variables/Built-in Variables
>> + */
>> +
>> +#pragma D option quiet
>> +
>> +tick-1s
>> +{
>> +	/* trigger the ERROR probe */
>> +	trace(*((int*)0));
>> +}
>> +
>> +tick-2s
>> +{
>> +	exit(1);
>> +}
>> +
>> +ERROR
>> +{
>> +	printf("id of the ERROR probe = %d\n", id);
>> +	exit(0);
>> +}
>> diff --git a/test/unittest/builtinvar/tst.id_ERROR.r b/test/unittest/builtinvar/tst.id_ERROR.r
>> new file mode 100644
>> index 00000000..95974abe
>> --- /dev/null
>> +++ b/test/unittest/builtinvar/tst.id_ERROR.r
>> @@ -0,0 +1,3 @@
>> +id of the ERROR probe = 3
>> +
>> +-- @@stderr --
>> diff --git a/test/unittest/builtinvar/tst.id_ERROR.r.p b/test/unittest/builtinvar/tst.id_ERROR.r.p
>> new file mode 100755
>> index 00000000..884b43f4
>> --- /dev/null
>> +++ b/test/unittest/builtinvar/tst.id_ERROR.r.p
>> @@ -0,0 +1,4 @@
>> +#!/usr/bin/gawk -f
>> +
>> +# Drop the line with run-dependent PRID for profile probe.
>> +!/error on enabled probe ID/ { print }
>> -- 
>> 2.43.5
>>
