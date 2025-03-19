Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2735D1AF0D7
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 19:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742411952; cv=fail; b=Q/t29ommlu4igw7JxFmzed5QPsSDn5QmdjXNT37q4O/2jD3UMB1tTShDdvnwidZcH6n6rwlChP4diaVLxxmHJNqJzkyGP42o9zXKYFes/hzfMbnGc07ZAI1a3xpgiaDE/vS1KxfnHLfuMjuF/oMtPy+MoOtTuUhLeR/Wf9h+5rA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742411952; c=relaxed/simple;
	bh=r45a2zcrEebnDL413p7LgDcIKvJVmBlqdt0JfS3cR8U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=esHDnfBRD4B0w3fzxcSJ7LBx1bzshAOB/h299KttH9H1VsG5GZcbKphsnQJ0F6JaUWo/htH1oXUeVq3hdXkMfjNnw6TiJU6+X7nhhfYK/vtY5huinizNLj8gNUclt4wz8iTcQ/NX5iogHh9Vg4H6XaoU/JFvxoDV2v+7Uxjskpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eEIH3lhn; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nazNJW7m; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eEIH3lhn";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nazNJW7m"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JItliA027989
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 19:19:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=7WvlkuxpL2lv0PsP9NIpDglmJfEyfSMfo4TDGtP2DOg=; b=
	eEIH3lhnrVM3TgsfKXfSAfUsGXolVrjTqOj3bj8S9yO5m6ST5teU6tK0FGiqojQJ
	d4xBaNB51qs1xbARZIAHvEHAFvIs0qEgovlsOeunGir+VQcgr/D5o9lqQ89iMOaX
	7dUkhZ7IiPhjPAz5gEZ1vtTL06PSUKhimsadubLpLPfOngISduhYYN5PoD59IY5s
	4EYgLog+MdvStyFY4rdW+M5UYCmQY2vQiGEhyZB8eK28VwK99SHopP+UbAbwd166
	rG1d9FP8fRYepw3aZrW3xWgpgnT52Y6nbIgciCJ2DF8bn4q3CVfztHqu9nH9pfek
	OiAoT7nSm+AS0s8PDzgSAA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1m140yx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 19:19:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52JI57Pv022416
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 19:19:09 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2044.outbound.protection.outlook.com [104.47.73.44])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45dxc7hxju-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 19:19:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YsE0TLP8Vmk30NZItRwMctoj3FmY5cKqfIOPJdav6JzCZGWgxZk0pNPYWDh/yxDE32/ivnLk3P+Tld+GHjc4Rf9eDO/7r6clAND3WWPswnWXU1JqVQJUzuLm6PRrNVkNj8vGAIJbjHDI7DjnUgbMgPGXhPu1c6qIY/fNRk23m5s2zQPgPYm1CXA+K/ptbNz2uVKGqWQNMuT5uhmNqQDHuVzSghQHhCiP6mH/X2dDsEqpaqxCc3Wl4nqnu4s0HQiMoSMwPZ8fMqeDPcn0UQaCP2onm+hsrho+ypDsyF4IwkYFYHhT8AjdatmQJPPMU7EeY7WCWa7l6XiAdptn8jb8Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WvlkuxpL2lv0PsP9NIpDglmJfEyfSMfo4TDGtP2DOg=;
 b=OQQU+f7eHGmSC/4q47YIA7rgM9sneDGYE253csbd/hM3JunCegmisBOLRA7gfV+PXFwzfhY3E5kyQZKQR4eqVNf01ICZ3AOUbfPopvkL7Shjt1indE54Hn6nJRz67uZ5zRAgvp+eAE87gmaJqWqo0GgJMZ8sVrZHrHfKqHV/q3XbCWHHNMklFX/v0k97faQ8e5SF+fbaDewg0xKChvSXtETqNjJAKggP3dhwkm/HtatGR+TVGJ91JJ4I/MOMVtWMVeq1xBetK0/UgVCtRh4e6x1LE76+mKK8SWL1lrwb6wzlt97z/j1VzLTwTsp5JwwWZshJRUqpj7zfqenUjZq5kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WvlkuxpL2lv0PsP9NIpDglmJfEyfSMfo4TDGtP2DOg=;
 b=nazNJW7mtTRkXF9ae6LPRALPOp6mADFESTL7J61M+p0aaLhR5p/Yb5OTKvi2FvciDFWBUDWkmK0Mxr4zIDenmNMwN3LbTLUoB0dSbM+5OVUOxcHMP/CuPqZ/2cy7j2qSL2Fkr7LwdX7WoKrIfJ6cA72XaLD5u0DPBqpck3Mwtus=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB5021.namprd10.prod.outlook.com (2603:10b6:5:38f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 19:19:06 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 19:19:06 +0000
Message-ID: <7d0f5417-ee02-815f-03e1-f2fe0a544bbd@oracle.com>
Date: Wed, 19 Mar 2025 15:19:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] Get execargs from user space
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250319063230.28171-1-eugene.loh@oracle.com>
 <20250319063230.28171-5-eugene.loh@oracle.com> <Z9sV5egl8ameuk+u@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Z9sV5egl8ameuk+u@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:a03:180::20) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB5021:EE_
X-MS-Office365-Filtering-Correlation-Id: dffd4762-9445-4b3f-f704-08dd671aea79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MU1IVDFuMjBjeE95bHV0ZGxVRzJKay9tMFBydkEyd3hoczBMNjQ2bFQwcWlq?=
 =?utf-8?B?WG1RaSt6RTF6MEw5NGR0WjFoKzVMVHJkUmJiMGxjK3psN1JWRkxJckdtNzRV?=
 =?utf-8?B?cThYQVZPMkhZbG8waDlSRU9XQ1ZOVHQ3a2MwVnQzQ3FuT2NTTHdRQkg5M2JE?=
 =?utf-8?B?aWFwc2tlRDFDNGpOWEYyMjFDeDh5QkhRMXQ3VzdxWW5vaGNnMXgwamVlWDNq?=
 =?utf-8?B?TTI3dVd0ZHhrRHlaVTdyUU5RZEpJdEdCay9kSzJsYzhldGtCSDJ0aVp0NEFZ?=
 =?utf-8?B?YWlhSkx1d3ROZmEwYkh4ZXZXTXNaSnU5aUpCWFloTUZOdHdqRkZhVWhqd2dF?=
 =?utf-8?B?SzdLb3BDdnRHaVNDd0R2NnZRYkFYVmJMTTJCSlhOaGxjSCtaZFlWWnQ1cDJw?=
 =?utf-8?B?d0RFWmEwdGVmaGVIMzQwRlhWTDN5L3QwNXB2VUx1SlJxaVF6RjJIZmlmTnFo?=
 =?utf-8?B?SU82RlJqN3g5aHUwNmQ3My9vOVc3T1JkUVh0M3U4RnkyZmFUWDYvU3lJYktO?=
 =?utf-8?B?U09PVTV0UWRnWkd2VzN0eHNJUW9WcExoK1dyaWxQYjY2bHF1V1NHbFVxdHJT?=
 =?utf-8?B?RTBwZFZLQnN6azFNdlJ0V2hSeXRWWloweWhUNTBIV0hGNEs3WS9weUNzVDIv?=
 =?utf-8?B?RVN4VklUbU5wRWc1elh5alE1S0VjbGMvc0duTzNORVN2WHpaMzJ6KzhQOUlk?=
 =?utf-8?B?ZlljWjFaaFFFcWszd3ZHY05VVXBEdldIaFVFYmpoNC8zOHZUNTFTZ0ZIQnVQ?=
 =?utf-8?B?c1pTNTQ2QW5rYzlMVmxWbmI2cko5U3dGSldGUnc0cmJVajZrb3NlRGhBK3pZ?=
 =?utf-8?B?dG5vendlNmpMQW1TMkNSdFEvZlBZOEV4akpsSHFVWDRFeDFKamhsSWhSZGxI?=
 =?utf-8?B?SkhJeGw3NE1NZFFBRWl4eEhqblJMbXo3ZHhvYWdXbG9ISW1IaDR6ZUViUlpG?=
 =?utf-8?B?eFFxdndrU2I3clNrUzZMNDZ5MTR2RTUrTGtrbDN4Z0EzVlA1WkZQYlVNL1Nm?=
 =?utf-8?B?RFlEdUtSY3NyNjZlZ1o1TlMxSnQ4bFpQa1hHUU5OaWtmaXNXZkg4SStqZlMv?=
 =?utf-8?B?ekE5Qm8yNGZpUEZsREJlRXo4a29rcEpyYjJVRFlwODc4QkNkL3VaRFI2Q2FP?=
 =?utf-8?B?VVkzSmhkVE9wMzhweEJYaFp6TUJSRzFHT3V3eXVjdE5qU1lwUXNhWFBmTzNy?=
 =?utf-8?B?d1dRd1I3azR5NTlDOE95aDZ6dUx2VzRDUkFGTG5mb0h3RnN6Q3VHSGFkRW0z?=
 =?utf-8?B?c1NpeUFvWlJaaXFPL0R4OWVad2xJZlBUSUtJcmNHT2U2TW1Gb3hyeGk0b0pj?=
 =?utf-8?B?MG95aWRTSjFrMWEyM0JZVGE3d1FpYnhRKythWkJrdkdUd3c1QnlsZ0tJblVP?=
 =?utf-8?B?L1dPRlR6WkZVbjlMSzl6d1FYUm9ScEoyUysySzBqaWxRNmFGS2VvQUpIRzhz?=
 =?utf-8?B?d1FXUHN4OVpIVzdpSVdmNFp2V2JLemp1YjdFM095ZFg3Y2Z3eVJOR0tFS1hX?=
 =?utf-8?B?V3h1TmpVRXpLcjROdkN6MHZHTGc0Z1dmUFpnQUVhS0l0c2NvWSs0ck1kQnZw?=
 =?utf-8?B?RFplVHYwZjQrRTd3UGl3WmE1QkR2YklXZmkrTVo2QjJ4ZGwzQWVwL0huckVO?=
 =?utf-8?B?d01oTyt1WGdDTlozQnJNTHU4SXFMZHlyMW0xbGtmdnBPN2ZQbzZoYWpORDI2?=
 =?utf-8?B?b1ltZXA5eE1RMnZhSUVBREhLU3k0QTh4T0hJOSttT3ErdUJrSGFERDJiU1h3?=
 =?utf-8?B?K0d3YkIrTmd6Qml2ejcxbmR6R1VYNUdjTktpaG5hSjhCR3lNaDlhOTdvakk2?=
 =?utf-8?B?ajBuYVZuRytDbiszTnpwSVVZTjdrYVE4TTVwb0FNOE5YTG5DUHY4QjI3WmNr?=
 =?utf-8?Q?VyPAJiS4PqImX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2xocjhrYkJXRVU3NDZuNWszd3owek1qU0lsQU03d2ZGU0U5d0FJd3RRamJ3?=
 =?utf-8?B?R0FyTGxVamZWSkx4Y0hjdXBLU1lHOGFRTzhwV2F6bFNGbVZjbmk3eFJwazFa?=
 =?utf-8?B?R1dQaXlWWjl3ZkhPaDJTSERvYjl3T1djeG15OUN5WG53RWk2Umh5MTFCMHpi?=
 =?utf-8?B?NCsrVVVIZ3VSUW5QQnJHRmdwczU3Z2tVRDJUQk5YME1IZXFnUVAwK0VJQ1kz?=
 =?utf-8?B?bUl6NXNkYnZEc3Z4bFhoYVBzNGdHTW1zeVQ2Y3A1cGc1aGhQVDIxM21HendH?=
 =?utf-8?B?K0hRUlBoQ0srTFE0K0JZRFBMbHR0YVBlaTF6ZTRWRDJsOGh4SmhXdUNLWVdy?=
 =?utf-8?B?M0ZjWElRczRWOGR5ekxkdlErd3orbmhpK3BtWmdCR09qWHVzZWYrYTZ0SFpD?=
 =?utf-8?B?aGFCUnNNQ0o5N0JhcUdwUStOdURMRWFBRHE4ekhLQTI2QU5vdDk2azUxaGxy?=
 =?utf-8?B?aEJQZHZ0ZVJ1OTVpUyt1KzVjSjVlWDdFQWtNM2ZYNnVtREdLV1N5b0V6TTVK?=
 =?utf-8?B?L0psdThvSHBrQ0VZZC9JK3ZRUEFMMUFqSjBGOVkvbmpyOXorUStyUXFVVFVW?=
 =?utf-8?B?d3V5c2YrdFIwK2t1dzYzTGhYRTBuZW5MeFdpeWQ5NEpxeXNyd0FZYUp4UHBr?=
 =?utf-8?B?YWtDSFM5T3pCMTBaZDQ0dkh3ZHlaQVFTbVk5QVBRTWZYRFZ6UWVvN0VGTDl5?=
 =?utf-8?B?UzFJcDlZZG5Nc2pDdlJBT05SeWUwZ2JabGx5K3Z3VmRuMksyanZwTUM2eS9T?=
 =?utf-8?B?L3pPMFRVQlR0eTJYQjZwK1ZWWVRtR042NjFsT2ViUkk4TmcweXNnN3ZyekNU?=
 =?utf-8?B?bDRMV2FxZHZXWm12NTFmbjdMLzNYbzlQRGtTNlpRYlpNTUd6MmxLelVsbnd2?=
 =?utf-8?B?cEtNVkxIbGlNK0l2UmFvTkFlaWRqNXJzc3R1MlcxZTFKWEhaY2VTcSswdDJM?=
 =?utf-8?B?bCtZOHhBUnZkNU94bWZxUCtQNW51WkJPVndjUnAyR0JEVU9MaXlzcHZtVkFU?=
 =?utf-8?B?WDI3Rk1DQ3c0ekVENGcvQ0s0NUNmK2NwMjNhNFdUZjRwM3FxMWNZTEVmRUla?=
 =?utf-8?B?eHc1REN6ZVpkdWlOWmVNRDBFWldzVWR6MnpsL3B6MncrYjZrVkhLaWdHOFVY?=
 =?utf-8?B?OFRhUThhTVlocWIyM3k5OVY5K0lUNEdEY0xxU3VlUnJPMkt2cWtOQ3NRczlZ?=
 =?utf-8?B?QVFRWjBDRm9wUTdYdThKVSt1NUlIeGo1aWl6d1Fydmw2UnFRaUhrVVVMbWVP?=
 =?utf-8?B?aldVL1JJb2J5VzcwSnhWVWNHK1ZOcS8zU3QrSUZFcWNleGlSOTRPYmgzYWdN?=
 =?utf-8?B?N0dlNUEvOEdyZjNwY3lFeW9RelpzeHF3L2tLSlRZRnB5RG8xdDJubFRyR2hN?=
 =?utf-8?B?R0tMOEJMZmxUaTFWTC9XaTVBMVJVS1VrQ3k4dnNobCtBcytGaE5XYVhxVDVF?=
 =?utf-8?B?QUlyK0FiUndoNWQ1bFBJTjJiSjN4TUJLR1pBL2hGWnFTcm83aGpkeXFJNG1a?=
 =?utf-8?B?aFVTcjBTT1VRUWs1Y0J3T0VzZ3Y2MjZYV0QxemtFU0tSNWVtbXBHanErWGt2?=
 =?utf-8?B?aVBXYVhzckpRV3ZKQTFEZXdoeHVyTm9GZ1BWREduMEZUZ1R2MHZZUGN5aG5Y?=
 =?utf-8?B?RFBDbXdqbm9UQTY0ZVpSUmJwSGNUN09YdXFKdzFiZFJmNjVQbDJHSTA0Rm91?=
 =?utf-8?B?Smp2RlZFL1g0OG92NmNUVVJMUTNzY24vVWNKODBUSmx2S1I4Z0JFYlU5ME1a?=
 =?utf-8?B?VDI0bFk0UFBQQTF6aXh3Ky9lcndNN3doTGxUOHMzaE1wSTEwdDRDTkhzbWRx?=
 =?utf-8?B?M0lObGFlUFFUbXgwa3ZmQmhrME02eCtwRlNza01FNEowaUVqK2VzMm0wUmFv?=
 =?utf-8?B?cDBNY28veTZCUU80cjRZN2NOOExaYXlwWXZ5b3o4YjhSNG9tRGRGYUJaR2Ry?=
 =?utf-8?B?aTIvWi9PdmhoSElUbHFXVllUN0MybC9BbzQvWUlVZUdDN29qcExyV0hVSmhC?=
 =?utf-8?B?Ym8rT010NEpHcDRxaEM3S05KWlFpTzhIWVplL0ovMkdHTEYzc3EwZnY1cys1?=
 =?utf-8?B?b1NZTk5paDJYMFJTS1ZnOU9Sam1pYXlQSE0rdDdtd01BVmpmTHFIQURGa1h4?=
 =?utf-8?Q?+zW1h7TOGdjzHJAjPt1d5Emlj?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nk3nPvYY3osjhHskdrGEG0wUo5C6lzXTjRoanUlmES7xK2ItSe8aF+HkAi0WyoPr8KX5DjMV8oildomOunvzSezUDbeilVZW75Oup7wJy6+XYL4suyILJAQpkeXZScGDSkmxBf3LN/X/ZkPe1wruB/JY7C52BHvNQzwfUHWVisJT5oubEZJrhF1Qa+3EWNpPbIR3gxtAKtHLoaBie/x0sOrdqJphO8K7p5XOsQYHIXkJWiSlETIf1rZ7yIBP0CVPWFNt2zdTSKHE0oMSLWk7gjGvzlfmxIvBpD01UbJ+5ro0sl9DSi0Um04DFSfTbr0e4opqjoLCjh74sjdg54CHQ/8ttH41RIW2udJp39Hfp8wkChdTWJ73rMSHKuMQqr57hEGPMz6fJtdZoxlI9cRYyc/sgDFAa9+u6NMtg2erfVhfZDL0ZJXbsRWX3gWqS0F04jMBD/oUCMkqFAfzaRfthCseZdvVSkBm51ttMSE0ngRg8DozP3e91OX9NKvcUxL0HNQWyYoVKju1jLPYWv3duNa+QMExkGNUcJSfFV94XnE4wFnEVQi2GkNbBIgfzJ3dPZy6z+bjmhis4jClA1d6bK/hVFflxjgmaOofqcRa7u0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dffd4762-9445-4b3f-f704-08dd671aea79
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 19:19:05.9600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bVk+gX2wvGl0LjPvZuDJq0JJTGje4m1Yha/+ZuCNRsDupDG4ePa7fXLmVgxL4wOC8AlSFKHwKmVniLMUSFiU8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5021
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_07,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503190129
X-Proofpoint-GUID: N0RhUJGxpQjLsSkTXz25aTHfgnJXsM0Q
X-Proofpoint-ORIG-GUID: N0RhUJGxpQjLsSkTXz25aTHfgnJXsM0Q

On 3/19/25 15:07, Kris Van Hees wrote:

> On Wed, Mar 19, 2025 at 02:32:30AM -0400, eugene.loh--- via DTrace-devel wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
>
> I expect this is a failure on arm64 only?
Right.
> That would make sense since it is
> the only arch we currently work with for DTrace that has kernels where the
> specific probe_read_kernel/user separation is enforced.
>
> I'll fix the comment as indicated below while merging.
Thanks.
>> ---
>>   bpf/bvar_execargs.S | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/bpf/bvar_execargs.S b/bpf/bvar_execargs.S
>> index 1c47cafb2..08844f15f 100644
>> --- a/bpf/bvar_execargs.S
>> +++ b/bpf/bvar_execargs.S
>> @@ -65,7 +65,7 @@ dt_bvar_execargs:
>>   	mov	%r1, %r9
>>   	mov	%r2, %r8
>>   	mov	%r3, %r7
>> -	call	BPF_FUNC_probe_read		/* bpf_probe_read(&args, len + 1, arg_start) */
>> +	call	BPF_FUNC_probe_read_user	/* bpf_probe_read(&args, len + 1, arg_start) */
> comment should also mention bpf_probe_read_user
>
>>   	jne	%r0, 0, .Lerror
>>   
>>   	/* loop over args and replace '\0' with ' ' */
>> -- 
>> 2.43.5
>>
>>
>> _______________________________________________
>> DTrace-devel mailing list
>> DTrace-devel@oss.oracle.com
>> https://oss.oracle.com/mailman/listinfo/dtrace-devel
