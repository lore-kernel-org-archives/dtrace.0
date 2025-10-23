Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0342834D934
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761249121; cv=fail; b=URsNjgX+/KzEY+sYnI0EJLuP519vEWihzELk4UveAf/yBMSl+/D/7aAlrKyAaXLDpru2m2fxP7YrvzOZYmrCqY2iXraijMwpWQp2fk6jQvdRCDj5s5IJdfKQaGsM+G8qrD/1fem+tJc6I13LoFOjPOJqrjsp5d8JRcTjQgmsz0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761249121; c=relaxed/simple;
	bh=p2DRsTgnye7pLj748h0yRo/nT1YQ9TZ2tt0eGyWZNN0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=euxvXHcNqSZJtx1CImgFfD29WgXmgdXWsbnNSHPstUTXQQU3yluluNlMAKZrGjL2+8YpNwqvHnOIPkFuCod+yxbGbqGgPMIGjNS7ax92X1UqTC3ax1HPFjVHiDoiNUJwYqnjvmOGjJo9ulYtS/dKDVRrXw2VyVqTfGytjE95xXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=pZhkePor; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sQt8k9ku; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="pZhkePor";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sQt8k9ku"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NIBxOF009642
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=5IbBXVqdjuw1GQW3z4hqIFmUfNdeyv3bqRWJNXD1drA=; b=
	pZhkePorARGkXH93MkSIn/1rNmXxkuCc9hNttqFQpFbYHOb7fr3QXW/BbZCCH11s
	44t0GoJvbbbPs6YQBiporH3c6XHB5RHFyNk0za98XLNKbx04Li0Kg3YGFZgW0r4t
	bI16PR/F7NfV0GakxejqijNCEiKjfJfxMAi5inr7aCaOkJl5GqFmIggXihJey7do
	vp7ULn6zlfuQ3kaKSv1OPfSFyi5ZDVM4NxovjpUZLHuf2jIZ36zbdjddv7AU41YT
	wjNZ0j6IVkfxtrJdzYqVGWROGIo9tdbIZe97w7+RMd7Rq9uAZnyPTtTxLd2muwao
	H5o8DWYr0/BZFQKe/zIlRQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49ykah12ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:51:59 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59NJ6jOp012481
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:51:58 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011050.outbound.protection.outlook.com [52.101.62.50])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bf1a9g-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:51:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KaPG01AfMBkYRIS7PM3gYbTrYeszsfGPgwYhP7E4Ot3bBVyo8tKJVYtw75QFA5qc6P/JBDOGuP85ixMjzqkCkjJ7s2SXIVrM1lRRt2CjWzDCouZWiWU9izk+LpeVm/gkm2hFZdK+cPpWy7h2+4HGO7rWAcSuhGRAPeQOOtrgsbXjPNmR5o4B1wmBY4IPgH6bn8XeNhCVimCzaI8mZfmzeGYRYyFefxC1TdkTxyCK2tmjkc79uyTlwwkwFsTZ4voXtafZxxe43MlO54vEBTOabAGEt3IOyx8Y2VKRhUQKZ/teW7v2RPWNI55Q+FPEK10GXVe91LHPM3D5Sbesbj1HPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IbBXVqdjuw1GQW3z4hqIFmUfNdeyv3bqRWJNXD1drA=;
 b=jH6g5KSJYy5D7r6Lgbt5559IHvh+UQiqUzqMvixom46fmztCBvNy7Ap4jYh2osAbEl/JXvGkVxLpRyImYuu+spozkT6cKHX03PTxz3SWH2nGWbEcD/R7efW5VAyuyCd6YUFD+HmmOebfcge1NPEcbpORfhNj3D/IZHm3vgfaMypY8a84w10ef7mc39RFiutym1znMJ28M9NW6dOe2WDj0+cN1s6CleQfRX9HPV/ff5jS1VTGEL3kHNsYVOvudO3uE5nI6c9HXqKpufboNpMH8j8LrN03vht/m2xv6YpscEChv4ZHGmv9NoQk6eTeuBNkT+K95z7Np/C0pi/mBGsNgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5IbBXVqdjuw1GQW3z4hqIFmUfNdeyv3bqRWJNXD1drA=;
 b=sQt8k9ku+wzYemah0KQGmDr6OIpa9Fwn9/BTchCzFnBBn8bpJrD782QEtCvDNyAar/vQIBfd+Crzi45KyeAtqvoi3H4MxWLFRxjkywBSf+IBlKb3roudG7Zbjky23hquMzCNNemWfr5FJmjaERT7ZDsQA8FTCZBOZcmq6nA3EGw=
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by PH3PPF077CE0592.namprd10.prod.outlook.com (2603:10b6:518:1::785) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 19:51:54 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%5]) with mapi id 15.20.9228.010; Thu, 23 Oct 2025
 19:51:51 +0000
Message-ID: <7f0e6f5c-1415-4b14-b773-5cab541ff072@oracle.com>
Date: Thu, 23 Oct 2025 13:51:47 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH 03/20] doc: Add separator lines to cpc
 Markdown tables
To: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250926190557.8485-1-eugene.loh@oracle.com>
 <20250926190557.8485-3-eugene.loh@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <20250926190557.8485-3-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH0PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:510:5::27) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|PH3PPF077CE0592:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dc12e8d-af35-4ed9-07ca-08de126d9c39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHN1RlpML29rTDB2NXlNMUxGR2VIZzZnVWFsSmZVcGhaNVdqaU5CMHF6R2pC?=
 =?utf-8?B?N0lqVFpLMm1Vc2FRWUFucHllMWJza3Z4dlZ0Ui9VRlJkemhoT1Rqek94WXdu?=
 =?utf-8?B?N1pUNjVjRTQvQnBnSHQ4RFM4amZNTnlVZWdwM0gzUGxzQUs2TkVVSnBUcnZp?=
 =?utf-8?B?bHdtOGUvUlNBRW9Kc0xIWHRGYll6Nm9JeVFDYWg5d21NWFQ4Z2IwTjcxc1U5?=
 =?utf-8?B?c1hJcmxFNGlaWTlLSTJ5QW4xWXhpeldUWWlndXdsQmFabk5pNVNLWk9pQTNu?=
 =?utf-8?B?a1lweE5QWFhlNnI0K0ZPaGljeWlSMWorR3NKZzRpMGJBdnZTdTdtWDNZd2Jt?=
 =?utf-8?B?L2Yxb3Juei9XZDlJNEh0ODNDQi9naWlMMjEwYzFweHlaa1hxUHpMN3llcUs1?=
 =?utf-8?B?L282SW9VZVFPczRNcmp5NS9sL0VocXhlUWJZeVY0Z3hVVElNeWVuUmdxcUI0?=
 =?utf-8?B?VlRzWkRrMTZZU09wTjV4YnUzc2QyRnBzTWN6MWpCeWpybGFlOHRVeXFwTWV0?=
 =?utf-8?B?Ty9kLzJSSWhLUFBudzNlTUhRTmNuUjlSUHhMT1ErTWx0QnBna01qUU9peWoy?=
 =?utf-8?B?QnB6MlZFSzlTS2p1WDVKeHJ3RXZOYWNiRWx5cHM0KzBYWjFmWFV2RHJ0aHdy?=
 =?utf-8?B?YnhhbVZXNXRLUW9sYVBUMUF3NjlUckR2YlpRVnhlTVlpTWlmcW0vWkZTeVo0?=
 =?utf-8?B?UGJ1NjhBSU83UjVKZTdadVRJMjBtd1p0enRJdnk2QkZ5WktXUmUvZnZiUHVC?=
 =?utf-8?B?UnpXMVN6dFdjUkxIalJJbGZWOFpwR1Bacm8zWlVhWkxFdEYwTVRUTHVhaW5W?=
 =?utf-8?B?SDVvUHhEbFBMMWlUbWp6TXdYQVRVVWhLMlE4N1ArdXlBbTZtc2JTZGZ1elBE?=
 =?utf-8?B?eFVkeFpCKzREOS94VlU4VzJlMnpoNGNHbGF5ekV1bkt0OTI4N0E2d3ExczJs?=
 =?utf-8?B?REVMQkZRMi9od2tIU0YxZUFrdWdnUWdDWDN4ckQ3UHZYZlFaeDgyUHNsUi8w?=
 =?utf-8?B?elRaeFZKcWZLVWZYcDgwUHdqNk5wZmhzWnVSSExyamRDTmNxWkJSTnlqUVZC?=
 =?utf-8?B?Tjg2b2NaNkc4MHE5YjhwM0Y3V0pET3FoOTFBY1RFRnEyejNmMkJRK3NxVEhH?=
 =?utf-8?B?KzBPbHhtYTdvWG9mS0luNUhvREZsUnVEd04zVklqYzdqenFJYW9hdk1aK3pZ?=
 =?utf-8?B?Zit3b1RYQ2IyNVlmcUdPeHVrNnpTQXdzMU5TcmpFeU54Wk9IaHF0RUR0aTA1?=
 =?utf-8?B?ZEw5anNLNmdiUlp0aHlqYkwxem90TjM5Rm5NR1o3bDUzcE84K2NBOThFU2Zq?=
 =?utf-8?B?dThzZ25vR0F1NDJ2dEVzVmhkUTlCeEozWG5SdnA3bDJ0N2I1Y1dpbjFTdExR?=
 =?utf-8?B?L25PWXIyQnVsWWxkdEtrTjQwamZnbkhDL2I5SThKaGd6NDE4YmxHT09GYk1B?=
 =?utf-8?B?aXFPbGZoNS9DRm9xUCtPUnQ5dUJaQSt4UFAwLzNiMTR4UThUWkJxS3VLT21K?=
 =?utf-8?B?MDNlcmx2Tjd0YWhGc0tTbUdrak55VzlVWmVNSU1DVG5YRUNBc0lyc3EwQ2dk?=
 =?utf-8?B?Rzc0KzFCT3IycG5TYXV1ay9sR3ZNUWdnalFTaEhKemdqVFoxcmNvaytnLzRs?=
 =?utf-8?B?b3U2VXROb3dUbWFBSlpQOFhYd09jaFUwZnhlbHhhU3pHTHJwN2ZCWTN1TFNx?=
 =?utf-8?B?YUV2NDFGTVFhR0t1Tldqb2N6azRlWEFkdS9JcThKalM1UnNxM3lEWjlIQzU1?=
 =?utf-8?B?aGp3WTFvTllFNkthKzhjMTFyMEN3K1pMMmlRMEZuaDZubmNaeXN6NDBod2dD?=
 =?utf-8?B?Y1IveVRJM0Y3RU53VHNIOXMzRVV2cUdNZlBjKzdDM0RoaG5kR3BNd0VZSHA4?=
 =?utf-8?B?dUUzL3JBcDNaSHZKOGx5bGxsN1ltVGhnL2NpTmM4RnZoZVk5OGtYb3pJWHlo?=
 =?utf-8?Q?puiWhHREBx0tBUyNsPHsmT64WVhTa+Kx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkVpOENZV2NaMUs2ZnYwa3Z1aWI5T2IzVDB2bFNMMjhESWNkRUx2TzFvdnhl?=
 =?utf-8?B?SDZhbzl4RWRtalk4OHYvbUJDSlF1RTkzWmdvM2prZ2JpNTcybklMcmRwKzV3?=
 =?utf-8?B?MXNSaGdCclZMaVlqRzZtclNGOTFNcEVqWEZ5eU9jMkF2NWZLWmN4Tk11bmNz?=
 =?utf-8?B?ODRTVTkxY2RvY1VqOThDeDB0cGhRRStLYWZkdTVzWDRGUURSN2N6Mm5qTytl?=
 =?utf-8?B?bUkvNlExN04yOGxUVmlVWTdLVURJcDdCY3E5N2lJVXVhRVRrUWx1RzJCVGJX?=
 =?utf-8?B?UFE4RjV1My91K0I5NVA3dVlhci94UnEwVTV4ZnZ6ZFkxK2VPbnNFOFpHVWlw?=
 =?utf-8?B?MjN6cUdzcWR5UGMvcXYxdHJzY3h3K0ZvbzNjc1FxY2lxQTRvN2FudUcvYVNs?=
 =?utf-8?B?MFhGcHRIbFNBM1h1em1xZmFENEk3OHdaclljYU9DYXh4RWdGUEZ2aW05dmpn?=
 =?utf-8?B?TnJmTUIyQjFPdlZEa0YyclRselU2Ti9xYzUwU1NxbllEdlFzNlRTbzM0a0h6?=
 =?utf-8?B?UkV1cENTK2RRdkdBNTN6QkE4RVdjbHI1aWNQZzA5SVhxSWxwT1hUZUFmS3Bk?=
 =?utf-8?B?M0kxZksxVExCV2hlZkhNNHd4S09LNXhZQWxPOFg1SW9XdTZodVpYdWJ6Y2FT?=
 =?utf-8?B?WE0weFFldkNsdUpKWGkzd0lwQXd1MU1yMHBkdGlYbm41aFFBNkRNUmlLTmxj?=
 =?utf-8?B?ampJYjhBUVVOdEoxY0FocFZDNHc4SXUwN09HaFBnTElYaEtSeGhDaFFmZHE4?=
 =?utf-8?B?NTc4R1d2c0ZEaldFd1NNMDNQTVdRRzhlRTEzTCt4V05ST1FEelFSYmhaamhi?=
 =?utf-8?B?ODQ4TWsxT0JiVWNHNmdZS245b1FlU2w5MERDWFpLSG5DUis5UzRWSU1mSC9H?=
 =?utf-8?B?ZU14VUV6VEtHekFvUzJSamFlZ3hvdFk1bmlSQyswMEp5STF1RjlUZDNDVGhZ?=
 =?utf-8?B?YTJIVXY2UlFCd0NrZFRTakw1RVJSeEoreWsrdHoybFk0TnFUcUdmUkhrTTgr?=
 =?utf-8?B?cVd6L2FBb0liSVU4UWl1MEM2NUlWV1k2Unk0d0lFak5Jam5UTFV0VnZJem03?=
 =?utf-8?B?aWpuYVpybW9tMkFvb1NEUFRuZm5yL0JjckthYTFGUlUveWE2cTVsNzYyanlC?=
 =?utf-8?B?RjJmU0ZZMVh5WU13Z3RQUURVNVNKN3pYbkIxTEdRZEFxVU9PWXl1cHBCdGFH?=
 =?utf-8?B?YWx5a0xKMlVtejRkc05MVjRkemc1ajYvZHVxc2g4TUVDZmdpV0RPN0pFQlhI?=
 =?utf-8?B?aWY3d3F0NjdvcXAyQWJvcWVPY2pucE9idnJSY0VNdlFjTmsrU2hPV203alVa?=
 =?utf-8?B?SlNYQXdGTmhCSDAxbzI5M2MrVzhCdThhSG05aTl0K0JPeHpvZFZ0ZmMyV2x1?=
 =?utf-8?B?NU5xTnIraFVvQmYzSXBOU3grNFN6WWc4TU5jck1zU3IyejVaN2wrOUpvQ0Mx?=
 =?utf-8?B?V1puTmYvNHNnbi8vZmxwNmFIMDl3MXh4VzcwdjJ1NDFvMGljRnl6UmxGcGhE?=
 =?utf-8?B?YmRXa2R5WkpDS1E4dUNuZlRSOVdYUStlL2xZd04vdmtIV2hmLytndlhUb1NC?=
 =?utf-8?B?dHN1UW1Ca2ZRblBUT3JPZTlqK3dZVUxNY1Fsa2JueENKajIyb0lEcUlBZ0ZJ?=
 =?utf-8?B?YVB4WUN6RXNGQlBYdFArV28yZ2hvZHV0TmxZQXB1aEJGdUVsZDF3R0M4bU9y?=
 =?utf-8?B?U1ovVi9mcTVKK1BWNS80cXdpREsweHBOQUFtVlpablpXekg4UXN0cUl0WkdH?=
 =?utf-8?B?N3lDOVk4a1lROUpabWoxUlJBODRoQ2JsZ0QxVDN2K3N6ejZUSUVLSEpMQVpZ?=
 =?utf-8?B?UHJCVXBaZm9Wd1dObTQrMEVyWURNM2R0L3k3eVBDUHVCdWZZZmEwdlBtQ1ZS?=
 =?utf-8?B?RXdMM2pERmJOZWV2L0xUZ2hIeUltMENaU3JTZzlOcHVhZGZnWEhpTUJmUjZO?=
 =?utf-8?B?MWE2SWgxR2pvVUJsdXU2eVNHb2g3V2xlcmxUelAxaGdLTWJtekFvNFI3L3Nx?=
 =?utf-8?B?d1IxTGtMcGV5WEV3VXZoZE5nbkpBTXJQR2JPckhyRW05SXMrMitXR1FUU0xO?=
 =?utf-8?B?Z0JuUWRvWlVFdjVjK3N0a3RzR2hNUDV4VlNDWVZ3cy9MbjJaZnpsNjVCSy90?=
 =?utf-8?B?cEovclk0MWlCWTNaNldnVktMNjFRNk1iR3FiOWVJbDNGbzJvaWE2K0FPUGNW?=
 =?utf-8?Q?AU0myPXImvvggys7+GVEMLo=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ee+OSxtVw5UyQzVkODVcu7LyZLXEtfeMmJeaJ1aTCNNnhbSOPxaETlNSDanxhCOlu8J8Nmr9o6g1eoECs4HTkgZCgBPFK+CnFx7+jUAgu3764hKp+Pz77QQJfugq9Ddr4kmJr6dZGRf6GxUTIXNz/ZDnVDZtfj/N2EndqL4ZW6XKemuQqJjoSOOj/TJkXo0BP3jDQn1DA1GAHyXUTX0CkfM4igMEdmA7sPKEfFKbA3L4vKHe17PXFICR9spvl2+Eq5340jSFq1XPE4msdvw450a2fCEzFhXr8Xs4IwMFVW6/mNkFFqtVBk5EONfEQriwzxG2WOa4LqICPhcDncxOsCnphX7FcdT7N8uTuf/rHAMLClycabIafCPTMuYyyQQx2daFwOC6FRrdz84XMDSAX0Phm9pprlDRSJRa4oJ5AKd8MyGPID+88EPyMxekTw8svyCTv6QLJjcGPp0NfsI5HFd7xyw3j5xjhSmXLaVzJw5GA5EXxC+sxQp+PVSX38xCEbjEWcse1pWqmpyY7+KjorVO4Sf3IezN8Ihgi8NXxrqNDfLs3LBtZHpQMmluOlzvMXPeY+2+Wp9yu0Jkt45+VGbfC7uSfimccttJhTkQwZs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc12e8d-af35-4ed9-07ca-08de126d9c39
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 19:51:51.7169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZVp0I1Cpd5gJ2Yht57JafAF/B23JdWfAivEV/4zS0fJcGj9iIITBBVYNDCAItTVxdFmMoBT9t/30Gr7onI77rtQRUm9g2yuo7ZU2PgOoq4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF077CE0592
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510230181
X-Proofpoint-ORIG-GUID: QvPTbO6zXYXRsYHJyTO5_bYqsqmicabz
X-Authority-Analysis: v=2.4 cv=XJc9iAhE c=1 sm=1 tr=0 ts=68fa875f cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=1Ikow6F82xXR-FYjaoMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDEwMiBTYWx0ZWRfX5X/2Lerg2Ld6
 GVlPaDErKk3wdD1+b9IwsoGv15rNdpGgAOnu5kwS1QsF42X+ZXKuPtrbCVeH83ZzNFGLEjIN1z+
 3CdM9lgvcz3PEU295Qq7w710vUuv/9XV6XkekCiZ3FpWEiT2ViiPYJ3F7PKmBW/72cJV07i5ye/
 ltNc+i+B2k1J/sX1VVmnpu2KrZC6WsqtlbfiX0roATQOkwoUMWCUqUK5OlP+AQSv2BNbYBpmLGr
 hH2OhUXXXLQNO1ZTb+gM1oY6nSw1TVHW3Q1B/mBURPS89QoTUjtnccBbE61SXBV/y/zWFKsOWRU
 rNHbR0opo2jIE2IJfzqLeqBU6rJZz1BtWhT6WuDaAKOEu3mjqZqt7zcPncXlBXP4bbSTVmozyJX
 W+safLwvSKakRyjj/Vyr5rW5d2s2og==
X-Proofpoint-GUID: QvPTbO6zXYXRsYHJyTO5_bYqsqmicabz


Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


On 9/26/25 1:05 PM, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Separator lines are needed so that Markdown renderers recognize that the
> associated text should be rendered as a table.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  doc/userguide/reference/dtrace_providers_cpc.md | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/doc/userguide/reference/dtrace_providers_cpc.md b/doc/userguide/reference/dtrace_providers_cpc.md
> index fd08567c3..5128d8e8b 100644
> --- a/doc/userguide/reference/dtrace_providers_cpc.md
> +++ b/doc/userguide/reference/dtrace_providers_cpc.md
> @@ -22,6 +22,7 @@ cpc:::<event name>-<mode>-<count>
>  The definitions of the components of the probe name are listed in table.
>  
>  |Component|Meaning|
> +| :---    | :---  |
>  |event name|The platform specific or generic event name.|
>  |mode|The privilege mode in which to count events. Valid modes are *user* for user mode events, *kernel* for kernel mode events and *all* for both user mode and kernel mode events.|
>  |count|The number of events that must occur on a CPU for a probe to be fired on that CPU. Note that the count is a configurable value. If the count value is too high, then the probe fires less often and the statistics are less reliable. If the count value is too low, the probe fires too often and the system is inundate with tracing activity. When selecting a count value, start with a higher value and then decrease it to get more accurate statistics.|
> @@ -32,6 +33,8 @@ Note that when you list CPC probes, example count values are provided in the pro
>  
>  The following table lists the argument types for the `cpc` probes.
>  
> +| args | Description |
> +| :--- | :--- |
>  |`arg0`|The program counter \(PC\) in the kernel at the time that the probe fired, or 0 if the current process wasn't running in the kernel at the time that the probe fired|
>  |`arg1`|The PC in the user-level process at the time that the probe fired, or 0 if the current process was running at the kernel at the time that the probe fired|
>  

