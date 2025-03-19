Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA07170A11
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 16:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742401819; cv=fail; b=MpWN2fTGaztY0Cwon3a1Tx3a3p3rhAHY51nwjkCExY6iwqrYRkAeIubTvinJNvlI4qE0NptUiDZRVLI0jbkzd9ZNpRQFdtHiilNwnYg5vJHPawk5hoTLEb3egbq1XlTW0DoMr21YTrS/lJOK2prPt7koa0EVGEUVLsFCfQXDbtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742401819; c=relaxed/simple;
	bh=enavQI/mPA57R2zIW4tMMztIbeKl/pmw9Esd59E5zLI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TfBb8QjvKgXCZYYaIjuzgxvSKYAa0dvyrLx9ivAf/zX0k3mWISb1+6HxE7BpWYw4yP6Gm3EFxR2vthrdO48/48waIOj7yzch8mrn2EKBDQ94Gsb4ekwT6YaeEQwz60n5ALZSpT2oMhJiXyxm8l+fzzpsuLTN/e7sxD2JkG/8Hqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lylec7Bz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yleNf3ju; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lylec7Bz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yleNf3ju"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JGBdj0002307
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 16:30:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=0eA/IGWOazgzfDUJaBRjdi2KdmFdhCDIT1inI9c96JY=; b=
	lylec7BzVBTRCSyGVwfueAHToh1lLAAJ+QvzJ2DcDdLHTrKdPNNEjZvduG88rmpd
	CpIw0+5h65/TCbCOBbixaRXh2L82T+iV99JNp/UAHjXfQeALfUseL336QKx5yaJI
	pUeOiT+8VerZjR0vDZG6dzhoAFZIUIGsntKLPWDpbGBglxF8NsQnpg62pchBjldK
	wDBYb3MAIidnFPqom22DIdb2AY89hIIAgOFiWy38T/i+OjiU+blF0Jl+uUL+aFVX
	gsEAdoLybebpwEEP84l+mQXPhOGAvwFRsPGbsWL5QhGXiQJYPPh5jhqfalU22PfA
	mk7si4B+JPQzlwV890TqVw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1hg3qs5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 16:30:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52JGAPw0025067
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 16:30:13 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2043.outbound.protection.outlook.com [104.47.70.43])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45dxbk5m6a-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 16:30:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmCjN9VX0ffNqqVLmd8l6BfIAiogmukbJsKNi37lHkjKWiep8tDnmAAKwYq6aSTXxxNOSJ6oj/KV1To5IuYWfhWEYAH9Tb1+s2saqmV4ySOVhTaIAsCFMuKULyUa/N3/JYqfASWhD/57O8KGXnXuZurTTwwXB861Kb98zcjfMo5Fa8DrKkYAf9Z1VLivbEVYcSeWx2v5SClDsma7yk6RUR51FXcKfq809QhrhLBDu8L8fdzX5Sj4D7igq5s1yOFwg7R55ciUUCmkA24929uQjbfbKsMU7HoZvyT6aRCM8Pdk6RtIXJ8xqymLJ+CFF9AwnF2AZU6PrJ88yQrw6ha+MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0eA/IGWOazgzfDUJaBRjdi2KdmFdhCDIT1inI9c96JY=;
 b=YWKza5Xpnb0AqlWj3ruSkhPoEtIZXwjmE2W5gAYIr7HayRhiiCkDKKXq1kQQu1BUvDFMonITgbC3fMBbDzQIQk9xw+2YPZkFclq0Jw4l0WgHpAZVVaDVNsyJoLfGzxdf/ZqPYdwD03NplrETzGBO+MaHweYEMzKo4CeY1fggJ6Egh91LDZxW1Z8EW2UCLSKArL40mwn52Pz6RTBB2gPqrpoBxgPApzsoRLZoHQ/tYn/EPA0h4um+6F2V7uxJCjRh4RjD+tGDDmQmlDlvuTUVUkBqdo9d5hHQlHJb6ZoRwca4ieC6frKXJxnqjK4hTU5RDI/mCdOzoDgIK6XptT6mHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0eA/IGWOazgzfDUJaBRjdi2KdmFdhCDIT1inI9c96JY=;
 b=yleNf3juzbkhxTnuJY6Cmwii4gNpbWdmsnnGJfi4NDVI/qN8cGx8T5GCRyU7xF6tUffCw50Z6hL2IZbEnTZLqfabxObqOxqoqxySWPdlbSgZ4kz898rI3vQtOJA3ZrQD3HlFMOQlK7IspjcfIqAyojoTfAMABFdiNnGIXrUxPIA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO1PR10MB4500.namprd10.prod.outlook.com (2603:10b6:303:98::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 16:30:11 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 16:30:11 +0000
Message-ID: <94c60235-005e-ecc8-497d-3d388fa8819f@oracle.com>
Date: Wed, 19 Mar 2025 12:30:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 1/2] Clarify how the usdt_prids key is
 stored on the BPF stack
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250220044350.14953-1-eugene.loh@oracle.com>
 <Z9rXYvNQxZqODC3o@kvh-deb-bpf.us.oracle.com> <Z9rgKzWMHSqLVQdK@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Z9rgKzWMHSqLVQdK@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0270.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::35) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO1PR10MB4500:EE_
X-MS-Office365-Filtering-Correlation-Id: 56e8c5e8-a67d-4a9f-cd90-08dd670351ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVNUYjY2Z1FZY2drYmk0WTBXSDhZYThxaktJVmVDSDR5YmZhTGp4MFh1MzJQ?=
 =?utf-8?B?TFNGbURMQU5Qb0Z3QjhadXVSTmk2cmZnb1pyL0x4ZVJFZDdIL3NodHZDWjBp?=
 =?utf-8?B?VE5ha3hESlI2ZmlRZy9tdldSczRyZTA3NkF1dnVxL2ZlUk92YTN3NWk3OEth?=
 =?utf-8?B?dDY1a0Ftamkyb3VzS3BlUXRXYi9aUDB3U1ZsZ0h5OHBKYVJxeU1WK3lMSFVu?=
 =?utf-8?B?K3QzUUNSRVlheGVxeHMzMTlxWnBEYWFxYUMyMDNKdW1XWklIcDRzQVpGa1F6?=
 =?utf-8?B?eUVhY3J3dGlsbG8xejJiK1E3ZThpUUx0Qm5KVEt2SHp0NDhMSVJNK2tDYlhN?=
 =?utf-8?B?UTN2UnIwRnNobzNXYU11dHR3enppVXIrWE90ZkRDTXY0bXlTbkYrM2xPR0VW?=
 =?utf-8?B?NmJPRUx1dE5ScllKR2YwNTJZZDd3SnoyMDRKdlZHbmh0UWJqS3FCbkl0R0tp?=
 =?utf-8?B?WFgrdGVLTy84Q3IwMVQzdVUvdWtQMFA5K1RRSWZSdXUycnBmQktnVC9VMHll?=
 =?utf-8?B?ajg2UDllRXIxdTFSK1lObGRxdjAyRmRESGE5Mkw3OFFza2x1M1dRSythYitj?=
 =?utf-8?B?QmpmbDhTV0NlaVV3djVLTHlKUXVxeHV4R1NJTmRBc2J0Z1lwQkFTRXVGSzVs?=
 =?utf-8?B?Z2ppMHgyV2dvMC9yYkdnV0taWEUrbDBlbWplY0ptQW1ZTW84VlhZNy85Szhh?=
 =?utf-8?B?eDV6T1hNeTFtMFQyRzZYWmxYRlVRMGRCT0oyYXAwRmtYOUtLSWtlUTVrUFYz?=
 =?utf-8?B?N3JzM2pPNGM5QkxVdm1yMXhTRUJaR0JwMWszNTA4aEk3SVpFaW1uM1hYQjRX?=
 =?utf-8?B?Ylk5U2E0MXFIMXVaZ2lCNXQyeHJwdjJOaS9NWkxTTllsZjB4dGRBU2NBdjJP?=
 =?utf-8?B?WmNHbWRibnpMZWsvcS9MS2t2S3dPKzlWeW03bEg0U01tYjJoRmpVMXlxL240?=
 =?utf-8?B?bkZjS2gvak5GR2JUT3llMXVEOGVEYnExWWNsOExtNEhwdXdYL1c0cXlPejMy?=
 =?utf-8?B?MVdiMlE0TEMzK3NmUkM4VVBlRmhzQmdDMmRUNG5TVWI0d2tsNGhIZzNTYTdt?=
 =?utf-8?B?K3poS2taY1M0YWhiTThEWHgvSFVQSG5JWnFOa0puMGRWZGxiQ3l1djZiZjBO?=
 =?utf-8?B?TEJZdVZ6OE5zRXFKWk41aW5JR2Z3TEM5QXE1WGM2WXJnalF6Z2lHNkxzMnhh?=
 =?utf-8?B?a1kxYnNzRUd3Zm52NU0vdEt1SkdvOWZ3VzFFMjFqdVJhdUljL2hReDNnTldu?=
 =?utf-8?B?SmptckhTb0Vtc2cybXlRRWZSbzFGRjJkYnVLSnM4cHVZbE5wdVdic2VSd1Nx?=
 =?utf-8?B?Y1JHUVhZQ3kvRnI3K1BRNWxsU3pZSG9xREl3ZHNJdk4ydC9vUW9jcjA2NXk5?=
 =?utf-8?B?bGtGZlREY0I4b2NtY3JISGgwcXV1S1hTNlp6QzRXSUtJMTI3TlVEa24vc3RY?=
 =?utf-8?B?TGt4TmpMYmI4QVk4eEE0MHR5dUZ6cGh1d0FLUStlLy9lN3VibjNvZndnLzQ2?=
 =?utf-8?B?WGpoTTdGQmgyVFVwcWFvVTlNN2JGdnhCczhIZ3I5bTN6Q0VIeUhpWmNHMXVz?=
 =?utf-8?B?SHRZdmRUV0xhWU0xWDIvN3dHTVBVTjJoQVZYRWQxREZuRk4wQ0c0NkVXWVd1?=
 =?utf-8?B?bnNGQkJKKzE1QmRtZEZxUjRSV0dPSTFIOHJyNlFRU2ZhYkpqaURtYlRza2xi?=
 =?utf-8?B?VEt1TTBrdnA5blpHL3RYWUlFL2thM3RGSi9odVRJSUh2a283am9YcTlzbVh0?=
 =?utf-8?B?VGNTSlVLYUFYVlBUdkV1VmRQMzlxcVhPM2xZTlYydUkvOXAwN0FnU2YwSXRI?=
 =?utf-8?B?T2NoaDdTRWt6NGdCNEU5cVV6NUdBbE9CbU1Tc2pHTVJ5azNGVlROOEZrMm8x?=
 =?utf-8?Q?o/ekk8aX8OvNg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ymt1S1h5QjNENlNxUitOZlNibzBKWUNBU05OV3g1QXZMRThUcytYaGI0OXVj?=
 =?utf-8?B?ZzkxOXgwb2F0L1ZIWHBsNmN0M0crTFpCL1dLNXZuY3hTNXkvYkVxYjJFWDZ3?=
 =?utf-8?B?MTkxU242RDYwQlozclkxdUZ5MXlWQlA0RllwSTBpZXdFWDlzaUxCZEE0RGFt?=
 =?utf-8?B?Nm96U0sxK1FyRE9EMktSa0d5amtFRVNjN3FZOEN2RWVxdTI0ZTFTTFFaUW1q?=
 =?utf-8?B?MTFyU1BXUXV6dktzd2VTNjdWRWNBTFIzM1RPMTJET0s4OEJiN0YxNU1zUVNJ?=
 =?utf-8?B?L0Z0WkNoUU5Fd0c0djZBZ1dZejhEekZRWFBhS2pOek5ZdGdFZzYyWGpOMElV?=
 =?utf-8?B?UE0zbEpkTnhxajBudm02Snc1Sk53MU54bDJsQ1QvaUwyczNnMWtJb2pQMVQ3?=
 =?utf-8?B?anBqSVVBUU1haDhUZGtZOXhEbXQyei9URllGZW9YVXRFSVhmdmdoeDdZa3Iw?=
 =?utf-8?B?UFEyMFZGMXJiU3U3K2FmZm94Wm1aZC9oT01tb2FrOUJ2eTR4M0lDSkF4b3Z1?=
 =?utf-8?B?b3Nla2tkNGJjRmhvVE9SR2c1U0xhYlRFa1M3eXBhaEZ3TmRscDlpTjRsWlA2?=
 =?utf-8?B?S3I5bGFlb1BEMFYxWHZyZC9UWjN3OVNGOGdKZStYanA1eHpUM3BIREVVcGxP?=
 =?utf-8?B?Wk50Wk52RVZ4MGc0cG1kMzduUmIyOVY4aVBGR0dCM3d1WTcxRVluZlNHZnBm?=
 =?utf-8?B?VzVZY0t6SU1odFlZKzlsTC92VWl5aCs5dWRBTzJkZkR2VFhPNW13dXNLMzJH?=
 =?utf-8?B?dENUeW4vdHdsTjFHVGlPeVlpOGlsZnV1S09oNTV1M0ZvdW9oK1VXOFF4UHB4?=
 =?utf-8?B?OXVVMHFSVjREVU9EcXZLM1h3UHcxaUxhU3RYZU80TjRjb2tWcGtpWHEwVEVq?=
 =?utf-8?B?ckdNazJ4SzR0Z2FEdnhSVk1rbllXYW5nOGVrSnd3L0p1NTBOdWs4NTBPMk95?=
 =?utf-8?B?Mklqblp6ZzRMZWtVeWlzQ1VYY2szUStNN1MvY0ZJTFVXQ1NZNlNlRjh0Nk1V?=
 =?utf-8?B?WW9KeGo5dXVlRUtBN0V2NkVJQ1VUVVE0SDFOTVlVYlZYRXhqYXMvbHRoYWlR?=
 =?utf-8?B?akNGbFNrd2IwdXVtLzE5QWlYbEJGWlpmYWtJcUNDWWErVHZTK3J0TW85TUJP?=
 =?utf-8?B?NitmQUtrOTlxSEw1dkhHMk02TUhqK2hwWmNIM1RkVCtWbUtWVTdyN3dBWjZJ?=
 =?utf-8?B?QUdPWDhhd0Y2NzZmeElxNXNuaGozK1lyZDlxV1VRem1uVG5rRy90cGZmWGhz?=
 =?utf-8?B?MEkwUTRUcnVLY0ZLU0ZyKzNjMnNaNHZRNEFYSTl5bFFhYTM1OWFGaUpSVTl6?=
 =?utf-8?B?bU1zTzgvYmtrNElQZXg1cGFqTFNLdnV4blRSdk1jQ0xJUWZxYmNLby9LbWhM?=
 =?utf-8?B?eVRuQ0FUbUJkSGdyV2h4cWtMbWVFb1QxNDdQa1JBaFNhMXdQWGJSSDJTSzFj?=
 =?utf-8?B?UGVUOXVuVTIzdUk5ZmZ4VWs5U3dhNlhFRllpK2lwRzIzWkVJdmMvcFd1YUtj?=
 =?utf-8?B?ZWJOelk2MjF2Z0tSTmdESm1yMW9kQnZPQTRhT1ZVMHVDb1dUQnZCcHdwVnZl?=
 =?utf-8?B?R0ppR21HZ3VPZW5yRHpMa2NucEtBYmd0UE9jREV2bkRpY2FnVTUrYmt1Uisx?=
 =?utf-8?B?RTdzNk9iNEpqSTJ4aURVUzcrQlBUMnVqRm16azdrSTVYSWxLeTg3d2h4QjFh?=
 =?utf-8?B?UVMwKzRya2ZpTHZBV2t1VzRaK0tjQlhDcEZXcjhXWUtoMjdGWXdIVFl0a1dR?=
 =?utf-8?B?clJwd043MXZCRkFieDJSVmU2YXRYZmttbWo4bVZkd29SZURBUEFvNDZsVExh?=
 =?utf-8?B?U2Q5OUJkSXdZc0VBM1l0aXBiaGxHM292OEptR2JwWkxEKzJLK0VlcGU4Z1px?=
 =?utf-8?B?VlVJdFdpd0JHYzg3L0FCV3lucGM2bVJvaDAzSnJ4UWtObTIvOHRLeWt6Wk1P?=
 =?utf-8?B?TmlBUjFNalpYRHgzSnZycUVSL21DbnJOZjVYMjBkZUJOK3g5ZGU4bWNJOHY5?=
 =?utf-8?B?aGJzT1kyVFJuRXBTSnFKZ0dReUg4dXZ3bGhSbnk4bG9nU0VWbll2T2RtNE9o?=
 =?utf-8?B?Q2p6WXMyamRHUjc0elMramJuRG1xNCtVV0dOWXBHLy9iM0FuZ0xBQ2wzTEh6?=
 =?utf-8?Q?Q4O1Iy25YzZYGbF0fhULG7DhQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UPLV83nUYukbSxuqcejQiJM4mWFQts3d8FWJo5pAbttOY9sTdYQl2XYBa5oKUVrs9FmGCUdDH3Fys53l+4kV02ZVfoD4vjXMmDDw45eByD02hkju0E1S5wSQ4mMeJ3Kr2XlHBOleZwZ69FWVlneLNugDpDz1Xzi7KOJ3N1LTCGarbMHO774x/LH6wqNhPB56jPmbkL3KT16NgouJ+n3ZUJLe1rbySN7r1ZqzQoZ4CsDgBw2EI05aTMg0P3HopRtDQLpWeFXskWoGQ/htINv9Ke6Wh5Z6urJiCxHrB0SC8y+/8qeZUoFmdkdQVZhtDY2HYGumVeiWzyliq50/+9U64jwZN7jitNL5Wl2uSn8dAMWjRcRgwflUgF7SOvZcSyJxBsxUtQg/97wcNAykw3yTVuvm+Sk+a8ZAN5bixbNdWvD3U9LqeEzqWW4eMcru26EW1a9kIsvBS//HqrhOPmvla0DrvEOv7iPaoLz0NsrG8EE02R/BzjebT3NRapRKzPr3sWnYZnsQokDYJaX2iDhoFag1uBjx5R5oxGFKcyOwUUU15vNbbxzrxlDYazb1PCWOXBbCD30uEnNCNAM2anNW6Y+IkF+E4D42QWR5XVF1XcU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e8c5e8-a67d-4a9f-cd90-08dd670351ec
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 16:30:11.4991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8SvIwywbKeOleOrQMRZDQNd1R+/NKQzsiQKZKFHftBDqnuOmm0l7mLX24ZpsxljolWo+7BScbfSoCWWNAtKMmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4500
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_06,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503190111
X-Proofpoint-GUID: WZkw61PVj6wEO1q282a2CBmBW6EFqBlG
X-Proofpoint-ORIG-GUID: WZkw61PVj6wEO1q282a2CBmBW6EFqBlG

On 3/19/25 11:18, Kris Van Hees wrote:

> On Wed, Mar 19, 2025 at 10:40:34AM -0400, Kris Van Hees via DTrace-devel wrote:
>> On Wed, Feb 19, 2025 at 11:43:49PM -0500, eugene.loh@oracle.com wrote:
>>> While one can access the BPF stack relative to %r9, the whole
>>> point of DT_TRAMP_SP_SLOT(0) is to make trampoline code more
>>> readable.  So use it.
>>>
>>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
> Still applies but see below...
>
>>> ---
>>>   libdtrace/dt_prov_uprobe.c | 21 +++++++--------------
>>>   1 file changed, 7 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
>>> index 5d9f74244..f1323cc31 100644
>>> --- a/libdtrace/dt_prov_uprobe.c
>>> +++ b/libdtrace/dt_prov_uprobe.c
>>> @@ -1015,22 +1015,15 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>>>   	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
>>>   
>>>   	/*
>>> -	 * Look up in the BPF 'usdt_prids' map.  Space for the look-up key
>>> -	 * will be used on the BPF stack:
>>> -	 *
>>> -	 *     offset                                       value
>>> -	 *
>>> -	 *     -sizeof(usdt_prids_map_key_t)                pid (in %r0)
>>> -	 *
>>> -	 *     -sizeof(usdt_prids_map_key_t) + sizeof(pid_t)
>>> -	 *     ==
>>> -	 *     -sizeof(dtrace_id_t)                         underlying-probe prid
>>> +	 * Look up in the BPF 'usdt_prids' map.  The key should fit into
>>> +	 * trampoline stack slot 0.
>>>   	 */
>>> -	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_9, (int)(-sizeof(usdt_prids_map_key_t)), BPF_REG_0));
>>> -	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, (int)(-sizeof(dtrace_id_t)), uprp->desc->id));
>>> +	assert(sizeof(usdt_prids_map_key_t) <= DT_STK_SLOT_SZ);
>>> +	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), BPF_REG_0));
>>> +	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0) + sizeof(pid_t), uprp->desc->id));
> I get a compiler warning here:
>
> libdtrace/dt_prov_uprobe.c: In function â?~trampolineâ?T:
> include/bpf_asm.h:119:24: warning: overflow in conversion from â?~long unsigned intâ?T to â?~short intâ?T changes value from â?~18446744073709551524â?T to â?~-92â?T [-Woverflo]
>    119 |                 .off = (ofs),                                           \
>        |                        ^
> libdtrace/dt_as.h:42:69: note: in definition of macro â?~emitleâ?T
>     42 |                  dt_irnode_t *dip = dt_cg_node_alloc((lbl), (instr)); \
>        |                                                              ^~~~~
>
> libdtrace/dt_prov_uprobe.c:1013:9: note: in expansion of macro â?~emitâ?T
>   1013 |         emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0) + sizeof(pid_t), uprp->desc->id));
>        |         ^~~~
> libdtrace/dt_prov_uprobe.c:1013:20: note: in expansion of macro â?~BPF_STORE_IMMâ?T
>   1013 |         emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0) + sizeof(pid_t), uprp->desc->id));
>
> You need a (int) cast for sizeof(pid_t) similar to the casts that were in
> the code before.  I'll add it in as I merge.

Thanks.  Might this correction already be in the 2/2 patch?  (Not that 
that's the right place for it, but...)

>>>   	dt_cg_xsetx(dlp, usdt_prids, DT_LBL_NONE, BPF_REG_1, usdt_prids->di_id);
>>> -	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_9));
>>> -	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, (int)(-sizeof(usdt_prids_map_key_t))));
>>> +	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
>>> +	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
>>>   	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
>>>   	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, lbl_exit));
>>>   
>>> -- 
>>> 2.43.5
>>>
>>>
>> _______________________________________________
>> DTrace-devel mailing list
>> DTrace-devel@oss.oracle.com
>> https://oss.oracle.com/mailman/listinfo/dtrace-devel
