Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7EA3B8D65
	for <dtrace@lists.linux.dev>; Mon,  9 Feb 2026 18:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770663311; cv=fail; b=DmR7yPI/qu1A0TYpdouV9xyXz0oW6jHn2Jw0Y7P6yQmlVZry+JTwZJpE67O0UTdowF+tFsPKWLR9bpss0M3l8i7j+mM/IV5Y4kAG5l5KALRAfO6Eh6p1UthfA1z8VuFJcGqhO9mEtJoSOsKdMWu1ET0gvGwvJC37Axq7duS5qWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770663311; c=relaxed/simple;
	bh=0OADhOtbbGL+YHQWts7nVyT1FgQpSAGONqDDza0z9Ew=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jbt/eWavsO8lRrEMeHaJsbxbbwqJGXZLQr7JFpO53zuOwY58RSJlNeIDbih63udJxHCk09IdEgc+JL9DRif+Dg0WDeOi4Ka6f7a44ZSmiXIzERky6JDvo/Be86cZVY+y9hhhGn8Pu1vYSb0jJvxpw2xzscfVj/5jv42PexesNOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qf024kll; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eRDt/HyP; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qf024kll";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eRDt/HyP"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619ECbBL1945118
	for <dtrace@lists.linux.dev>; Mon, 9 Feb 2026 18:55:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=TYH+uOYOE2jA6EdJpSizarTFzq/69iWQ9tSB+yyV6rs=; b=
	qf024klluXVQE/5ywGj4swrWrR+erQCsgdcdy7rI8jdjP5OThu7tDOwMvtVkmxaM
	jpBPuovD2F4jWq8VCEjw0CXo3J4ettW9dCAmiYJCIRy6wUwI0LeRAQMYS+VxZSo9
	jLhER5nOnpD3dL6Kxm61UOjXYw2ZvTMh6whYeaVLaXCg3/+cQI5dtR4eAH/VwV61
	dYWowiciILpdvyLffAvH4qYavG8tGQG0VGLdXUFLyXtgiOFmh+3CUyqPfJuKo/GV
	UGvoNl9h6REzO8Y8Go++nj70Jr7RegMmim6uUsJD16Jx9dXYuu/nyEBjKvLJZRpx
	/GHq+kuoalBozAhZ4BBo9A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c5xj4jhet-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Feb 2026 18:55:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 619Ha1cu035378
	for <dtrace@lists.linux.dev>; Mon, 9 Feb 2026 18:55:09 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011053.outbound.protection.outlook.com [40.93.194.53])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c5uu9ebfg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Feb 2026 18:55:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=af5RGCVbVNnduOvvvZcM5E/RjQAW/witThduLVxflW0XnwDIny0N8O4lRw7whB8Yz0nRb/q90MU6NsTYATDJiuLD5lm0whALjzm0VgANu38en8tz0xT6hlukGbFEDiRYaqy0frKVlRkt8g+Inuo/7L6+a94RVP2LEkJzwd6BIHRmAzhAjJNvgbFtdkaFbnyKh7F0OYJmiiglMByKScy7qr4F1y44zb8zgA8NiQnqpONq2wFIQfsiG5lMY+HIa1Vh0TRMboEZUkAn0gas0O0A7z4vwKQMngM0cRlzILFavl2rjUa3qfWdOY2MoRXve6lDZoyyC2uHh0oiiUfD1jrBDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYH+uOYOE2jA6EdJpSizarTFzq/69iWQ9tSB+yyV6rs=;
 b=jcAVWUK1+ZDZkSq+bNGpCOxs8A123AEXlgixvW1/04O6MZ4/hDAhoUbrrhUvQP7gCmTfEQyw1eeYauqbG55ec7+rYv2Af61t7kiREqtYSrOOaN27QJhFp8bwrjLXtaxvqgcTBcuIV8rsuAjWSxUOpPfrkguaePeoLsoXWLSRTon0BXLaX0F9vYfnCRkw7pXkUdm/iz8EBmorZm+HdUvNLCbPsn7oFC4/BJj0pHLn/b0wprxAd6Vje7qS61wxan1FXR7ljbGvVDHQW0DOk6wc4A83W6sAGT7swJqAl1HX+BOwaeK7Jt/CQesf6T9jZ2u/nseusk5c4xYNosZzVJhHNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYH+uOYOE2jA6EdJpSizarTFzq/69iWQ9tSB+yyV6rs=;
 b=eRDt/HyP2/9sNAIvxMtLObEco8ASqIuTPAUlnSH2gZn9xT4M7WKjTT5NxWvvoDLdCy5HSmqAEdCOnqMWB96qyzbsW5Ve5I/mbXezZYIr8Gy6rwSxbChfSLxGFDUYJ6jrnslWAKwuFPyRJ5f6OWAcRpJCdLK2Ko6s/Y46QXlp+1I=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM6PR10MB4282.namprd10.prod.outlook.com (2603:10b6:5:222::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 18:55:05 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 18:55:05 +0000
Message-ID: <9eec5a13-12b6-8866-a563-022bb94f40d5@oracle.com>
Date: Mon, 9 Feb 2026 13:55:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] test: skip when /proc/kallmodsyms is not present
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB75223D0A585D1EFA33B7C033C265A@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB75223D0A585D1EFA33B7C033C265A@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH2PEPF00003856.namprd17.prod.outlook.com
 (2603:10b6:518:1::78) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM6PR10MB4282:EE_
X-MS-Office365-Filtering-Correlation-Id: 301ec6b3-647b-4784-db0b-08de680cbd14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Nm1ZdnZ4QThvdHVOTHBiOUF2T0QreUlaUmNieGIxbjlGaHJTdDR1aWs2cG1O?=
 =?utf-8?B?WTFRdkEvVHRjRndTZUJKRElMbWtGUlkyc0VwRHhaWWZtcXh5UVVtMGJUZUZx?=
 =?utf-8?B?cExQWEFyUWpzZGVWanJqRXpwSHNaTDI0M1UxcDg2ZWxHNUtSL1hzOWZMV2pu?=
 =?utf-8?B?STIrcnNFT1lYR2p4b28vV1dkeDJtdnlGeXhwNTZ5MWVpM1A0Zmdpc3BhaE90?=
 =?utf-8?B?bHJtRDFYTGdGNGoveFRyVmZkdmxRNlQ3Tm5QQ3FoeE1LVWhUVHMyVUtjcWZX?=
 =?utf-8?B?ZlZMSi9FYVJ6UVZUdGk4OHdyV1RiVVVmTWRFd3Z1Tm1CbUlxQUFndUF5ZEc3?=
 =?utf-8?B?YTJPMmF1SGlqQVV4cDZRRXhKUjVGMkV4dkdaMUhUbDBmdlU2UC9pait1RW45?=
 =?utf-8?B?dWlyZ1FEOTdqQWZFcDhDTUtpWU9GUXhURHFpeHRVcDlXYWxtVGdhREIwRVgv?=
 =?utf-8?B?ZzNtWmdVcG9aYmtZQWxpN1pTYUVvaWRsN2xEZTlyS0RVWS9NVDhqRDVGVjd0?=
 =?utf-8?B?UEZFT3Y3YmVOZE1PUU5kdGpIUC9FM2VlOUs3SE1ZZEk1NU10L0ljdmhQNk1T?=
 =?utf-8?B?THRCSlBiRFB1enNNNS9HVVlSb3RCQVhwVEJUYlpaUHNuZWRYc0pGMXkrVGl6?=
 =?utf-8?B?OHp0c1grUFhpeWJmbE9sYW9zai9rVUk3aVEzZWk5enFMZER3T2c1MnUxTWFU?=
 =?utf-8?B?UGMzMm9pOFFlNHdGaHJRYWp4L1RidE5rTk1XYXB1MmE4Ukp5NDJaM1AvSExG?=
 =?utf-8?B?eTFxcG8zdTNhSWtoVjE1SkxZaXlzSGF2UWl0dDMzNnlUTnI5bFJSU0lQczNG?=
 =?utf-8?B?cWlCcnlubHBkY2lwY3ZFdW1SMnlPUEVzVGx1ZWQralBoMmFPRWhyUjVYNjB3?=
 =?utf-8?B?My9LMkZBdnNkbm1VWmNNOWdtRHFaUnBPMjlzQjZOYkZTVWl0N0g2UXBOZG9w?=
 =?utf-8?B?TytTV0F2WC96c250aENiNWNVSFJFdis5TnlETXdXekpqMlhTaEorVVI1OUJ1?=
 =?utf-8?B?enAzWm5OU0pxeXg2Q3A2MkhiU1cwQ0JFdjJIdXFVYVBFMFJQNEpHQVNwMmpt?=
 =?utf-8?B?R1ppSTZtdWFDZFVlbGJNUlBHOS9keWthVStIV3F3bVN1KzdwQ1ZBT2pqSG01?=
 =?utf-8?B?c2RlRkJZWmRsQTk3NDRnc21XYlF0TjZLVWFvTXR5RzQra2cwY3c5ZWdjWURB?=
 =?utf-8?B?Qy9mQlQ1alJmSXlIVG9Id08rb3N2SVpEVG8wU3JvQXR3NXo1YmlBejExWVVm?=
 =?utf-8?B?OVFEZWtDRVJndEEyYWdoc2lFSDBMMExEc291YVFxcjZuQ3BoSkgxblVwWGlV?=
 =?utf-8?B?NU1iYU5hejBWSWVVQ2lDQ3lNNG9BSnl3WWtmUU5aQ0dpRTJZWnEySmhiN2M0?=
 =?utf-8?B?dmpzN0RsT3l0WFFaeFoxSjVaUUVZa0xia3VTdE8xaUJHRHhUTmJNbC92ZWJQ?=
 =?utf-8?B?c1ArOC9jZFpjQUFtYXZ3Y2xtZ1YvRHJXRkpZNWlkSmZ5ME1ESDJpUVUxRmlN?=
 =?utf-8?B?ejIyVXhaa1pINi9VMVZveHlLMFNuV1ErbU9PVTJhYWRZOTBQdHY4UDRDL1hu?=
 =?utf-8?B?VzJnUHZQeUF5bk5LNkY0SGhZU3lSK1dMZ1FhYjdsWFR6YkhJdjBmZUdZamlj?=
 =?utf-8?B?cjVDV21DOUxrTVRnak5mNVZkSDhaOXNEWWZwYUY3eldGK1FRa3FSYzAzVGZT?=
 =?utf-8?B?SHRtOEhwZWVTMkJMSE9UWnJBMGpleDdTdE9WRVBHalc3Ym1MOGkxREJFaU9w?=
 =?utf-8?B?WERkQ1l1WFNBOXQyRzZqcjJ2b3VySGJKUG5Udlp0bTNhQVhwVGdyQVF5aHZt?=
 =?utf-8?B?NzJ0WklKZ3pRSmR5NnIzbG9YYkRrcTVCT0xTNFJ4SEFuYmNKdFpyNnRIZmI4?=
 =?utf-8?B?aGx2UXA4N3JhNjJYWmhUUXJGaDJjOEtBTVUwc29MdTAwT0pia2YxTzc4YkVq?=
 =?utf-8?B?eTI4TTNMVDRtZ3AycWc3UGkrUndpVmVyeVRPeE5CdzNUMmtobGVrS0tRYkNr?=
 =?utf-8?B?SURlVjFwOHBUUXJkVkdqMk05dEMvY2lkMXFDRDJrSkFSVjlsNWRsK3ByR2h1?=
 =?utf-8?B?U0UrQm5qbkdoVmhKNU95UlJ3VnNuVmxzTXBNeE5ZR1VnZmhBMGlKL0pOVldw?=
 =?utf-8?Q?zXkq91QzK/CAJtltZV04cU8rP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0NvWFJZeTdnN2JTcDVEejMxajF6R2ZzMGtKbVJHTGpubmxjSitLMWtWc2l5?=
 =?utf-8?B?MHNCRXQxa3dWYm85dnhLMmk4ZUJWSVhyUGZLZk03UDloZ2o0MXRkdVhNZzdW?=
 =?utf-8?B?MFdYT1pOcm1DY084Zk1NV3BUMFRPVlZpN09jbXdvOStIK0RXK2o4RlRqWE5a?=
 =?utf-8?B?aXJqSldSbmxDa0lVNHlJUmViVmFoc0dJQjY2ZE1xbmxoelQ2UGk1dGRKVCtZ?=
 =?utf-8?B?WmtLaU8yL0ZOZWRlSTM3WC9BYlZGVytpNUpiTDNHSG1jQjRIa2NuTHUrSFIw?=
 =?utf-8?B?WVlzeUxFUU5NSXc1ZUlZa05nSzZvTlp6ZVlTdG1hS0lXQ3JMTGF2SWlzamFO?=
 =?utf-8?B?Rk9DUmNJZ1JzOUpFZit5V0ZMemxHeUJmT21mRlNWQWRwZjRhdTV5d2ZVYXha?=
 =?utf-8?B?MllYS0o4V1B0U3dqLy9MTWVzWm41R2RkYTVLNk9MYUN1a1B6Nit2UHIxVlhW?=
 =?utf-8?B?VTFRaHpJNHk2NkNtT3UvREJIUmd0YkRIY2p6Q0FneVVCdDlUcVZKUzdhanlw?=
 =?utf-8?B?VE9uOE8xV2JXeWJkbmJsOGw3NkNzTlM1UWVxQkIwV0YwbnJsTWVibGh6bXRp?=
 =?utf-8?B?SkRxeTNsV3Nmb09BSnJEaGRRWVYwdDl4cFRTYVl0ckRpR3RURjFXZllNTU00?=
 =?utf-8?B?YzFzRDIzNy9KckN3Sjd4M2hFUG4zem9VNDkzL2ZkRnRySTNMWmpNT3VLQzRj?=
 =?utf-8?B?ajZPdWEvNStPankzRkwxNFFtTVFlZmJLTGZxVmNiMUd0REdWOGlTell0WG1B?=
 =?utf-8?B?Q3JJRlJoeVlOaGVUNDZhVkRWU3FYMlVkY1Y0QzEyL2JndmJmbFkyaGYyMHlx?=
 =?utf-8?B?ckRMSUVFLzFJU3hUQk0yeTI1RFc3Z0RFM1N5ZnBVNUdGMzQxZ0UvcG9iUk9T?=
 =?utf-8?B?K0Z1T0dGV1FwK3U2cFlOUmRWN1JvWnliQk43MHY4UEJnR1ZWVDQ1RXRwVWcw?=
 =?utf-8?B?MGtPTjFPZ1B1K3k2ek5vYXBKRmoremEvb2YwU1VtWGxNRmRNbkFsQ3kyRys3?=
 =?utf-8?B?THZNakZaekxuUXhqNE5pUWxkNnpYS0JLbU9ZYXlWTEcrYW91amlHSUJLajM5?=
 =?utf-8?B?OUgxYi9JSjM2cHY0ZzZuR1FGQ3ZpeXZEY1hhRUllOTR1RkdvN3BuYmRJVDcr?=
 =?utf-8?B?ZG81UGF2RE9aSVBWMUczdmVLSVBJMXpkSDU2aXVrd0pLU0N1bkVTSHBUR1dV?=
 =?utf-8?B?SkttTlFIUkRPbGd1UmdtejhQR1ZkR0c2REt6TFpJUTlQUFZOZTVGMnU4ZDhC?=
 =?utf-8?B?U3Vkam4wWDAzM0YxQnBHWjc0OFhNZXZ2Q0MvZVlqZWFKZHB6dy9sT1RDbmxa?=
 =?utf-8?B?MHRQZUhUZlVjZVduQ1YzZldoN295SlR6NXNKMU9GTDhWclB6R2RMdW5tRldF?=
 =?utf-8?B?dUJMUEhUaGJucVljSlZKeDRMTWdlTXZHd1lTK1ZxOW8zTm9paWNmazRNcDdn?=
 =?utf-8?B?bGU4MWJzZ3JhRkxVRlZlNmpLRmoyZFE3RHV0NGVLaUFsaUx3Ull1TFMyV1Zz?=
 =?utf-8?B?aVF5NXpsbm5vdk9RYUo1RlhLQVROc3VOaXA0cUlYU0xhTnNYVFNySUQ1dHA0?=
 =?utf-8?B?OWV3cWYrbUhEa3FXSTBBNm5aQ2ROZU50MjJPYVhpSGxnR1lBSWxJRGFubEdz?=
 =?utf-8?B?cHFCQm5VVlpXYjZGVy9vNTQyTGNnZGQrZ0Fnck41SXVTeHV6cVdXODFna1dI?=
 =?utf-8?B?TkVib08rRkVEbFVGRG96aUEvZ2h6UGJKM05zbHpMSnJHSG1UZkR3YnV1YVEv?=
 =?utf-8?B?Y0czdGJhOTVZQUJaV2F4K3JTeFBFRkt5MHlXSUlBVysrbWIxYVp0TDNtNU53?=
 =?utf-8?B?SmQzcGFMMFc5ZlJhNkN5Zm1takVVZVdia2g0OFBaT0ZHcWNLR29JbnpsTkVy?=
 =?utf-8?B?c0pWR2lPd2w3UkZvemJHVjRjaDAxMWdpRjNjYjRwOEp5MHFoTytlNTZvcnlD?=
 =?utf-8?B?WVVZNDF3Wm1icTBoMTJPSDhZYXZKRkU4c013anR5R1lLQjZINzFkeWl4Wkl2?=
 =?utf-8?B?QXVQM0NxQk4xNERpcGxjWDBJeWVELzcyUms1ZWhLTU5aOHRtbENmWHd5ZDVG?=
 =?utf-8?B?ZVhQcXlseUZOemxjYUJVOTZUYTdrTFFSQnZZY2hmam0zdW9IWTBxZ0RETnNU?=
 =?utf-8?B?cjBFQnQ0S1JveW5sZmI2ejV0cFNrYVRyMzhhQ1VKNmVGdU8vdXhBNHNZeVd5?=
 =?utf-8?B?WU5yOE95L1VrZ3RIdUMwSmJjczRXeUh1Tk1UNGgycjkvUjhZeHprSjVLeGJR?=
 =?utf-8?B?NHBGVDJ3eHJ2N1J3alBKTDZxK3ZJOXk0enQ2T3h0RXBDL3Jlb3B6YmtjU3hP?=
 =?utf-8?B?MDVkamZBNHREQnZnMWEyNWhDQ0ZQY3JJSGphL0FJcmNMdEYvRzRvZz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aBDim5z3RDgqTVQS8RYmKisV8xVbgtBNBPUIoOF6cJNUIKIMFBb+lOwijiWBV2RzNI2PHpdCuvPNgAYgnW6eRNE1EYhDitYfoJFiE63p58Q3U+yE7zvXeEtF0zTw1nWyvOMULTzK4iALEwclcBf14k0N62MHncZc3Z15+lT3o9JOOvhhBOJtVJl2yTFjvYoWd9LhVvTknVZxvWDXCYQWgfBDDAEElA1ptxVUYSNiqEbs3DeIVjWpoYKI3oAHECO07b6saSLR8LHyKhSxOYaF10GAme96Hce+glnLMmpXrlA6ZdWcGxkt7lyKa+xsQ5UmN8FaaHiqwUMs+0P+aeNf5gBjnVELNXzlvsA9mWVC9xt6O+C0zn42BEoe/dTHlXxlrq+2xSaltplKdzNxrqh0rnQDjGA1i31m9wp/2MZNp00+qZY+L1RYGEL7Cae9eyv6oIhDXHX6XL/wSu4nqZ9uEP9v8mZVZgjvkLtXdjan6R7CMHec5swvncmlHbvHP7rV2VFcpGgdECwzzydSPynehM3JXCTYZ9QV/6SMYg46/jH6GnbwFlG8aztN3sMrlV75uULFRwqgf+0DdieEF01Hh58+WDTL4aCDv63TubTiCQg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 301ec6b3-647b-4784-db0b-08de680cbd14
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 18:55:05.6091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SCm0l65ZhViqEHu/xA7hWpgzPKzOSvwVA6GVUmDgv7q49LsR/4zhaUmJYQGv1T+ntuYokVoBvuvqp5JT+fqPJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4282
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602090159
X-Authority-Analysis: v=2.4 cv=Adi83nXG c=1 sm=1 tr=0 ts=698a2d8e b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=xnKaph-RN_-80O-147EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: FstbLTcbUOYmkcolNE206gJU4nvpx7_6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE1OSBTYWx0ZWRfXyxsgLCifrYqc
 wVZZoXHcipUuWEAG09MLT84CNEz/SjI9g2Q3grRszz7Y+AVC01IQrHtpRFcq2sKPKxEoyXU0UoR
 6QtyV2+RYDOIW8MbDrW9aU6Of6VAfZ8IJngg9gCKj0hTxUJxZHebMAewxyObAalmPsBg0mdwP9c
 NUtaGgfUTQdLMO9GJiLzFSVpMxSYih5hLLm2dQX7PA+s1TrXSzxcy5F/g7v/NN0Ghb/txXvV1ZR
 A0/spzPBGViRbpDX5VwiODdCNZQ3WQx2ePlNDjDOx+bcZZpdiGDcp2sva2gHUOOWzIA6fESXfbM
 Cix6XHErFMGyER2yLOTvjWzG1ZMYQUoq+J0GX2ynbmBnSKnCjcz4k3EztSq5igl+vvmoBw+HR5W
 aB/hiRrXvUxyxKZcw4Axc53Vk6Dcczfi47ZbASL0liZ18E+Xx9Ym+884jzLJZzh9qCTpnyeKIBx
 VpzQQfDxMQPp19ksHVQ==
X-Proofpoint-GUID: FstbLTcbUOYmkcolNE206gJU4nvpx7_6

I'm rusty on this stuff, but maybe you can help me out.  What happens 
with the test if kallmodsyms is not there?  The test does not directly 
rely on that file.  The test simply makes libdtrace calls, and 
dt_modsym_update() can fail over to kallsyms if kallmodsyms is not present.

On 2/9/26 13:34, Kris Van Hees wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   test/unittest/consumer/tst.merge_ranges_bug25767469.x | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/test/unittest/consumer/tst.merge_ranges_bug25767469.x b/test/unittest/consumer/tst.merge_ranges_bug25767469.x
> index 7e265f2f..a92690ad 100755
> --- a/test/unittest/consumer/tst.merge_ranges_bug25767469.x
> +++ b/test/unittest/consumer/tst.merge_ranges_bug25767469.x
> @@ -1,10 +1,14 @@
>   #!/bin/bash
>   #
>   # Oracle Linux DTrace.
> -# Copyright (c) 2018, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2018, 2026, Oracle and/or its affiliates. All rights reserved.
>   # Licensed under the Universal Permissive License v 1.0 as shown at
>   # http://oss.oracle.com/licenses/upl.
>   
> +# If /proc/kallmodsyms does not exist, there is nothing to test.
> +
> +[[ -r /proc/kallmodsyms ]] || exit 2
> +
>   # The test depends on a kernel fix to report kernel (and built-in-module)
>   # symbol sizes correctly in /proc/kallmodsyms.  An easy check is to count
>   # how many kernel and built-in-module symbols (that is, symbols that appear
