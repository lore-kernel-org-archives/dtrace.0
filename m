Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48CC2BE7BE
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 17:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788025242; cv=fail; b=TBR8u7p4/TL5Fcsiui/l/Y420vj3XRtQ4RFSiAGLtpt+lFBtHSdn3rzIGxHSnCtTFRZe33WcQBjcVX11l/juBSTV6DetfiJyPiJGEkmjyngcj/Wd4l5q4CcHVKxDBFOKnpheO14a+SCEolbgN8r6r+oXxL2Rf7z6HfxkbKFj71c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788025242; c=relaxed/simple;
	bh=cou1EhiO/dhdY0gAhKVC28XtTknQQlyNLrP5VEo/6vM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ce0Xn+nIdEP10K7qnzwFpHpFZEgODjiRCPrMO8VEOypQ3L9z++aNOt4Q1JnjL8TIMzziq7HA/zvAKeOGjiKCDUInM3Ince6GkpvKrUMA3lpoETf8+p5JERE1CfLdA/japv5DDwKRNNvxzzNDB+EsfUi8BU5l19hqNtEaDKodK5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cfOJyih7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BTHfL/8Y; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cfOJyih7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BTHfL/8Y"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67THOQQO1878058
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 17:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=TxwYnCRdQCHy5C1T7O8dVczuvVOsbWWWFyGB7XpZ7yQ=; b=
	cfOJyih7i5GdnbOfH66DcZOMDih1QDKfb0FTJ8QHyMrvNidhB0R6efaHAtEWI3kt
	hwnm/BGcRsEj8pI8SiFIfSKiSWovFCSOkQ5Hn8GrND37hE84aMmWdk+yGHrkSiiI
	11AcrouFPs4A+IT8vsiiWdA1p/LIWGjj9XS72PNR+ZLfw89nSdx0ptGwkWnP4b/m
	N6dVjvLPuPWAN3fyr0/SBDmxnLJRt9zN8n35sNcvlfONIIPTv73BQCpX2VYKFwMB
	xMG/NHy3rRoiU0gbyAu20OLyGC0l8WbiZK6o+D+8TSxW9zRQAbvwVy49um9je9/b
	69vKiAu3pfc5QsJcLbV1tA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gbpbargpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 17:40:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67THeWQE017258
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 17:40:38 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011040.outbound.protection.outlook.com [52.101.62.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4gbnvmv8de-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 17:40:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WIoUULxt1Y4X2iADMxVuX9IJjS/TItSvi8TMc0/nCR/nCuUM6TKLHvrMIue8q5bxmGU6018r+PZNOQrmknvkqGFqavudJZqxJRoH96GPXCvUmKN/fIqVLEzCbqvTUGDaxXfoTdlKW7dNW/JHbexFRkgX0k2Rl/qOXOb0FhjGblnMJKELw7RGvP1yYPGkQcZ1NdTIWKwS24rfMcSSFp1eZDssbRGdePbUEpmVtaitGwxYs0cDlq3MFhAhrdoiuspRRHeTK57ySagLRGGC3uqCEyTYonRu1+rU4l5vKY1ecKTkMm4qiQQefc4klai0ZG1vn3kApx0C+pm89wAzmXT5GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TxwYnCRdQCHy5C1T7O8dVczuvVOsbWWWFyGB7XpZ7yQ=;
 b=HcD/uKIb+6q1938WMvMYiRuXgPYXf2yasVINuDQnitlHOwOpeCiBpMXGCveysrHHIf7KnyXe67T3yLewtMkEL9pmMYVW2sCtPO+fYGXGPE+6+/8ffWVoU+eIwBRDppbT4OUXzM9aiHNaSHBpr+aKu995i5R8pJDnVkzvYFR9uqIFL8gTtSPlKy22aJeDVuPSquOpHHnmrScrX5VJEfknDNfLr7jwvmFSF+zQTvzd8IkiHo75u0X/4EdlvcDuV56wrWEuvKFZ27S/jCCoMGu4X7Rg4tkllbbKeaHWu6UsbJCMA4ItVmqM0ddemtI/ZiFR0pDo4l18ATTQyhgk4DlKLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TxwYnCRdQCHy5C1T7O8dVczuvVOsbWWWFyGB7XpZ7yQ=;
 b=BTHfL/8YaE2CVpKXVcgPpgYMKkWgioap0MwcL0CEsCev/C7yeH4I7aqRz1N3K0feyvG4BR7JKgNRbOFsxABaTuA+Z3b6mB0bki7+8KFBwD4sSDE7ut3Bs5XLjYLc819KsRVrvyweauOF03fKWu7sQo42U7EtCQYFbW8gUy5Rh4M=
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by PH7PR10MB6156.namprd10.prod.outlook.com (2603:10b6:510:1f3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.9; Sat, 29 Aug
 2026 17:40:25 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%5]) with mapi id 15.21.0382.007; Sat, 29 Aug 2026
 17:40:25 +0000
Message-ID: <3d0f05fa-8899-4484-9b48-8c1c25b429f3@oracle.com>
Date: Sat, 29 Aug 2026 11:40:23 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] debian: add distribution specific patches
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <0421dc5b41984a0b1747c0da2c215b83@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <0421dc5b41984a0b1747c0da2c215b83@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYZPR02CA0005.namprd02.prod.outlook.com
 (2603:10b6:930:a1::19) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|PH7PR10MB6156:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c4ca311-28d6-4a3c-4e3b-08df05f49baa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|3023799007|10067099003|56012099006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	laMxOpRYJPBIOtwXZXLSgwEFP1zTEtq/47Ig63gQ1uJ0H6s5i01IxpEJ7acU/j4u4vpnlNZu+Vy+4oyn6LP/Rjwb7JMn2c+vv69bqgC/8vAfGzHuzZpyQajPJzUtXbHAtFieWhFrvWaYGDhchp45MEfyUsmgSANpQGJgW3JyL0U0O8YsS6M2G3sHaNxxl/wwQ4XPxtsyf9oTtbcwks4iCjY3hilEYUIIpvpUn6xXwYuNB3WAPVuMWtEsQzwxez1y6KuZpqLy2nI0OGfWAJ7RQ9UPKAa+KYQ0JwOB5YzkRgEVbPUJzYIsYRR+ePd+jcL4mnG8ksG/KOMxmT0v7sEQPUFAOFcZF0AMsKsY5G0Yi1X1UyyBd+89ok0cu6U+21b2f+V42eTjtEy3OiIs0inJbSdhUCGkWdSARt4Emd1Lgg5iH2iS80Eyzt6cBBJXkdIk08/DOdmkjjDjV2wBAHknZUSwoXl4Sp9cJUDYWisjKBMjmDQxTqYp4XzKNfc86mQISEqg/V7kG83aGR+9L+xE5MRS9o/rxKv/Wn4iI3t2DaTvSb+8rVWY71hQPTMCS2hv4Fbucfk4KfgqCyuJgzd3uQqUCLhiIK56Ph5ZFE2oseJpxzpfGb4M2K//Z2z/hU5jfZvA/nE17KcUfXvx7DKpovz3NaUr2SMhari+lc4h2cg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(3023799007)(10067099003)(56012099006)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkdDMzNCdVRmM1RkWjVqc0QxaUEzaU1ydmppRythOHZRcGQ0RlBjUGc3K2dX?=
 =?utf-8?B?Zy8xd3dGb2VzMDFHVFV3RFBlMThDSlZsMkJqNjdRL09rZ3BDanh1VDRQMlJO?=
 =?utf-8?B?aVJLT1FMVEhXTmVmbWNRMGV3YXIrT0JKY0tXZ0VpR3dZMGxtQnpKUUhLbmVX?=
 =?utf-8?B?S2R4cldTb2hSRnJFTWZvUlVEbmlvaXNSR0xkeGh4TlBnVUNuODYrd0tNMkZL?=
 =?utf-8?B?L1NWMmx1U3U4cmNjZUU3UUhSd1RpSFc4d3ppNlZ1ZHIyZlFyS1pxaU0zR3NK?=
 =?utf-8?B?dG5mQ2FjYkVEUXh6ck40bkEwTE1DbWVzZTZHNUxsNVZCRFQ1dFNIMFFZN3lm?=
 =?utf-8?B?UzdqRUdQRTJyR3huNE5WamNoRE9SNFU1bVFpYzBCVWtIYzNLRncrMUVKNGIy?=
 =?utf-8?B?Tm1Yei96ZUt3N3lJeWhuQmt1aWdJaXdGYWZJL2FjTkJyUXYxL0dsME1odzU0?=
 =?utf-8?B?RWpWcXhXdmYrOTQvRTJsS3p6NytsQU91ZkczYzB1YlQ1MzlEZFJnTG9OWDBx?=
 =?utf-8?B?WWtpRWlUQ1kvMTFDRnFhcllPenBwRzdXNGF0Zm91Ni9WUGFzUENmOHIyUzhr?=
 =?utf-8?B?SXFrNHUwTUZTSDIwNXUxeklJL0FxZUp3aGNVakdIdk5zc2t2Ti85TjVKUnBr?=
 =?utf-8?B?UWpRMDBSdmVzVFNEeXBraGJocE5ab1Y4VkNqdzlvam1tUVNrM2VUdVl5SDBr?=
 =?utf-8?B?ZUd2dG5zajB5WFRNQU1oMFFJZ3grM1YvZHdJdm56dEF2bmIvbHZ1dmFrZldU?=
 =?utf-8?B?eGNRS3BZTG5JeUlISFg3cTdHazlXbEJ5VEppRHNmKzVvenl6Uy9OMVR2T2kx?=
 =?utf-8?B?bnF6Y21FeW52WjlsY01qYVhQbUhTUTVMM0ZZVmZMZXdPcHNXcDE1eE9yTVl1?=
 =?utf-8?B?aWZEQ1ZKVWx3WU9jWGlKaWlPTTZQU05YeEJkcnB4MTV1YkhRMXlHN1JKYXFp?=
 =?utf-8?B?dVVmSUpMVVpVM0VPSXpjM25BUUR5YWNaTXBoZmZxeWdpNytNTDI5ZjNGaUl3?=
 =?utf-8?B?MlBsaHI0WHZUWWxDTlNNd0tFWXVaMm1PT3BaVzZKSndkaVUySWZPelpYS3pW?=
 =?utf-8?B?RU9tLzRRa2I5Q3RFYXpoWkUwVGxmb3Q2WmI1NVFmOVQrL3JuMG9KeXMydEZp?=
 =?utf-8?B?bTRwRERBQzJJR01UK1NNd2MzUGdFSkJ4OVUxUllsem95by9ORld4MG5sY0xP?=
 =?utf-8?B?ckFEQmJUZDFsSUxidVNpWGdhYWExU2tlZEJjN01talVFNHpTVGFhNkc5U1JK?=
 =?utf-8?B?bHJSRDhtdzhmVXdnZWU5VTdSOTRDSVptZmlqNE5HV1FTOUh0NkpQY2lGRE5Q?=
 =?utf-8?B?enZQMEJUYjh3NmRwTzVUVXR4UUhuSFo5NGErOVFrTkZVem9NVHUxdUJYZm5V?=
 =?utf-8?B?MWpvMGVRV0NlYmFUTWd2a2tFY3dhN2Z6b1Y3UStOa1Q0Wlp2YUFMV0hZb2NF?=
 =?utf-8?B?NlN5TDJhbkIxOE04THh1VHpoOVdOVU5kNHhlUWNuOFd3cXZ6dEtVeHByalZn?=
 =?utf-8?B?QjZVZjdFN1lyb2pVNDhUdW9JZkR0QWZ3NEVCZVJkd1lqbmhnUzBCT01WM2NO?=
 =?utf-8?B?VHJqRkVzWWdsbm5ZdlNoYlNjcEVCdTFDQTNHcStvMjFiN3RaYTFyam53ZjFH?=
 =?utf-8?B?VUliTEJ2Skx4REx0R29XeEVsbVRHOEQvVGpWeG5kVWdjNWtncjYwU3BLTm90?=
 =?utf-8?B?L01waGo3WSsrYlhCSVZ1UlBIWXhVREppUnpranpoZm5LWG5zd214UEFSV2VI?=
 =?utf-8?B?MGczTzZkbGZWRE1KbGxGS0ZnVkJKWW8wN0h0N0pSRXp3bnhpWWdyV0kyQWtG?=
 =?utf-8?B?ZzZJU0tQQkpUMUE1RVN1dlhGUjdrZlN2OS81SEpnek9GcXRLVWk4RnJBTmly?=
 =?utf-8?B?Q0I5VzduWmliWGtrbmlIMXptcE5URm5GUklBbFdkNXBvR0UrL2w4aGtPQmhD?=
 =?utf-8?B?YXFVaGtLSUEzM3FNWkw2b2h1K010SmFROWdubzdKZFd6Y2NkY0RZRU5TVEk5?=
 =?utf-8?B?NDVyaU9FL2lGZnBnVkp2T0Qva3lHa0lTMVJrcUFDYlJUZEZxMG95cDd1NExq?=
 =?utf-8?B?UjQyNTN1eHZIQSt5QXNHcjhVMzBWeVJPR0hsZnZ0a0l5KzNWMTNiU01FR3Jk?=
 =?utf-8?B?Q1ZNc0tmTW9oN3ZnSVJ1cGpKcWZtbzlod3pzOE5aelNKS0M3c3N6QW5TbHZQ?=
 =?utf-8?B?TWJ0V0dzSXhuWWJwOWpiU1lqc2xWMHFvemtLYWhPL2psV0t1TXY1SmVrUjN1?=
 =?utf-8?B?MmQzUytsSldEZXNCODRyMEpRbVFjY09uUmkyVDVjWmEvbW5vcWRCNDBPMWFk?=
 =?utf-8?B?c2FtMGdWbWtMdHlXZjV1MG1kMDNxVEI5NmlBVy9BTG9DVHRqbkU0QT09?=
X-Exchange-RoutingPolicyChecked:
	CNCzbxXJRJU4uISmvoIjbqBViU6uFIaQZglPsS42K9ewSBFwUsLsb7OKouabO81MoMrsiCd77FjLRb+xOgio0ZtOnk0s1wpb2hDjkdF5wOo3DzelezTl0NK4Q3LeMlz0bR//gir8h7WyErn1srOAWSgNXKbU0FQhMURNAOZTj3BI0x2tZtA/oVwW86i0zGv0/St6lcyk9WEqUrQgzgRMTs11z9hbNBzGKHt+EN5m8PigHh09NOUokXtlKIHeFdkr70FZ1dN1x9LZCm8UDuawjhtitk77FaDjYjAUIm4t3N+qs4eaJROY6ut1ke5JKvG+ZLTD8akN9bJ7oFLIS2+6Ww==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	h0YiZ6p+l10aeIHi1lArgnEIgCFFR1/Aq6iIiU2ZdJEs9Fv4bdUTBWv5+V2gRJ0T7j/e95b+KoVNtB2V/OapqTrImtALrzIlzk0BYioCydhJKc3gEc86yMbc73L1hCidyZLaFi7ogj9r7jnjbx60It6WthwvYWRXYp2zrWu/qnDIFrQ4mU03XXQXAgE5BuFpfXgoy8g0ZiU75UxRBsTuaLBfhAACC2qgvpywYw3vqeXSNltQAtxzekNUaqiN2+i6c5gePWAxlMz56iB5EKSIDS1S0FkshPbbDTrtLtnSq4pudWUoB5VcyvV8maHvnq/b9boEYPn0+oeA3EuIlLqZ9LTsORGCA33dgnDNZbA9JGexIG7JlnlLRsxhuRlkrfpN4/h4NiXMbQwhMmFHsjjAmKHvVd5OmtokbM7orSOmi/SuullqfNhRxzqTgw9eswZGrAa5L0PDvnlcoSaUVld8IuucE0zeNE0QjCw1tAyawO/dHQVvgB/cfsEKXChyneGZbhuw1PKK1YbqFWQRRF+XZI4S/4/bSsGO16w/+itwkPtKRbkOpjzdRLAxDR83mHXhOZfzGMuhauFYAS5m/fOEOUkO+SOl2Og+/q3wdc6wGZQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c4ca311-28d6-4a3c-4e3b-08df05f49baa
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 17:40:25.2800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nL8O33P5Es9dE07e3YtpON+VVIWqWJGLpKSusfIYA+fDF6lTfD6keDNa/BixzpkqpmulpIUMfK5eie/6gL09D2bKpG/8gusCRkbLnvww9/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6156
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606160000 definitions=main-2608290153
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE1MiBTYWx0ZWRfX5mrlT2bN2qb8
 6AMgWkjT3yzvZPlmFtk7Qv19EervIBBynNJtEPHCJxjeVDX9luQmiNOuI3D+zAipHBXzqA5THK9
 VuSdnxL9/HiisWCI671ccy/NnAiE4DhwvFgJMuHlftHkEbhsNyoe
X-Proofpoint-ORIG-GUID: ze12UdfPvPjsyOqNwwTbbZLza_OFm6oq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE1MiBTYWx0ZWRfX4z63fGbK7ld3
 ysJU5PI49fY8Qje7wH99svN7XBQ7HPzNnwbjhoQHlBwfRmY07p31wlaWw6Ke/0FRrDwHzodQM/Q
 2IC3ZHBvNqDu4ssD/f4/OBlQKe192AuL9Is0kYiWKrrvP3E4nLfhEAIl5rf7T3DkeIoIhCnvH97
 Da7MOVwMbOMCRjyZ8fJKpwCQuzzG68eVGdy0EvAnCAUSsOVmujhCzbnjYRJnD8wmTGf0ZP6csxD
 zKF3L53wKAiranI8jmRbBFyZGsE3L6UtNbga+RpbTEZoiXq+Drp6Yx5pgsuEkQstb89gJkzMKO4
 vIGPqyzNmqZc1PZ1vmAdV21ADsjirwCOa2tszVHY3N7bEk2+ya/53EdoqJj2dq2MbBP7YFDnC05
 1xeHGWpRFQixA91Teltt6CSby/QUWFEhJD5HoEp1LMknkMfoNGyTjwuUqJUfD79yaGoTFQLfqCd
 3JVt/gH+e+MC4wEx+8ozgG4SqXDvhkDUF8q0Ay/I=
X-Authority-Analysis: v=2.4 cv=DMi/JSNb c=1 sm=1 tr=0 ts=6a931997 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x0eKOSpe3m1H3M0S9YoZ:22 a=NEAV23lmAAAA:8
 a=yPCof4ZbAAAA:8 a=pGLkceISAAAA:8 a=F0UJzwRjd8pebuNXpxQA:9 a=QEXdDO2ut3YA:10
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12102
X-Proofpoint-GUID: ze12UdfPvPjsyOqNwwTbbZLza_OFm6oq


Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>

On 8/29/26 7:52 AM, Kris Van Hees wrote:
 
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  dists/debian/changelog                        |   8 +
>  dists/debian/control                          |   8 +-
>  .../patches/debian-static-linking.patch       | 248 ++++++++++++++++++
>  .../debian-surpress-utsname-in-note.patch     |  15 ++
>  dists/debian/patches/series                   |   1 +
>  5 files changed, 276 insertions(+), 4 deletions(-)
>  create mode 100644 dists/debian/patches/debian-static-linking.patch
>  create mode 100644 dists/debian/patches/debian-surpress-utsname-in-note.patch
> 
> diff --git a/dists/debian/changelog b/dists/debian/changelog
> index b176f3cd..dfb05e2b 100644
> --- a/dists/debian/changelog
> +++ b/dists/debian/changelog
> @@ -1,3 +1,11 @@
> +dtrace (2.0.7-2) unstable; urgency=medium
> +
> +  * Apply fixes in control file.  (Closes: #1140165)
> +  * Use static linking for libbinutils.  (Closes: #1140166, #1140168)
> +  * Surpress adding utsname info in USDT ELF notes.  (Closes: #1140167)
> +
> + -- Kris Van Hees <kvanhees@gmail.com>  Tue, 16 Jun 2026 19:46:35 -0400
> +
>  dtrace (2.0.7-1) unstable; urgency=medium
>  
>    * Fix CVE-2026-21996: divide-by-zero if section header data corruped.
> diff --git a/dists/debian/control b/dists/debian/control
> index 7560dc9a..0861ed17 100644
> --- a/dists/debian/control
> +++ b/dists/debian/control
> @@ -5,7 +5,8 @@ Maintainer: Kris Van Hees <kvanhees@gmail.com>
>  Build-Depends: debhelper-compat (= 13),
>   bison, flex, gawk, gcc-bpf (>= 14.2) , valgrind, binutils-dev (>= 2.44),
>   login.defs, libbpf-dev (>= 1.5), libc-dev (>= 2.34), libelf-dev, libfuse3-dev,
> - libpcap-dev, libpfm4-dev, libsystemd-dev, libz-dev
> + libpcap-dev, libpfm4-dev, libsystemd-dev, libz-dev, libsframe-dev,
> + libiberty-dev
>  Standards-Version: 4.7.4
>  Homepage: https://github.com/oracle/dtrace/
>  Rules-Requires-Root: no
> @@ -25,8 +26,7 @@ Description: Dynamic tracing for Linux (DTrace)
>  
>  Package: libdtrace2
>  Architecture: amd64 arm64
> -Depends: ${misc:Depends}, ${shlibs:Depends},
> - fuse3, libctf0, libelf1t64, libfuse3-4, libpcap0.8t64, libpfm4, libz1
> +Depends: ${misc:Depends}, ${shlibs:Depends}
>  Description: Dynamic tracing for Linux (DTrace) (library)
>   This is the official Linux port of the advanced tracing tool DTrace.
>   .
> @@ -60,7 +60,7 @@ Description: Dynamic tracing for Linux (DTrace) (development)
>  Package: dtrace-tests
>  Architecture: amd64 arm64
>  Depends: ${misc:Depends}, ${shlibs:Depends}, ${perl:Depends},
> - binutils, cpp, gawk, gcc, make, pkgconf, tshark, bpftool
> + binutils, cpp, gawk, gcc, make, pkgconf, tshark, bpftool, libdtrace2-dev
>  Description: Dynamic tracing for Linux (DTrace) (testsuite)
>   This is the official Linux port of the advanced tracing tool DTrace.
>   .
> diff --git a/dists/debian/patches/debian-static-linking.patch b/dists/debian/patches/debian-static-linking.patch
> new file mode 100644
> index 00000000..363cdb56
> --- /dev/null
> +++ b/dists/debian/patches/debian-static-linking.patch
> @@ -0,0 +1,248 @@
> +diff --git a/cmd/Build b/cmd/Build
> +index 98d0ebd7..3492638d 100644
> +--- a/cmd/Build
> ++++ b/cmd/Build
> +@@ -13,7 +13,7 @@ dtrace_SOURCES = dtrace.c
> + dtrace_DEPS = libdtrace.so libport.a
> + dtrace_SRCDEPS := $(objdir)/dt_git_version.h
> + ifdef HAVE_LIBCTF
> +-dtrace_LIBS = -ldtrace -lctf -lport -lelf
> ++dtrace_LIBS = -ldtrace -lctf-nobfd -lport -lelf
> + else
> + dtrace_LIBS = -ldtrace -ldtrace-ctf -lport -lelf
> + endif
> +diff --git a/libdtrace/Build b/libdtrace/Build
> +index 3a6c0466..3bf6c7c0 100644
> +--- a/libdtrace/Build
> ++++ b/libdtrace/Build
> +@@ -82,10 +82,16 @@ SHLIBS += libdtrace
> + libdtrace_DIR := $(current-dir)
> + libdtrace_TARGET = libdtrace
> + ifdef HAVE_LIBCTF
> +-libdtrace_LIBS := -lctf
> ++libdtrace_LIBS := -lctf-nobfd
> + else
> + libdtrace_LIBS := -ldtrace-ctf
> + endif
> ++
> ++# Required for dt_pid.c for varying instruction lengths on x86
> ++ifeq ($(shell uname -m), x86_64)
> ++libdtrace_LIBS += -lopcodes_pic -lbfd_pic -lsframe  -liberty
> ++endif
> ++
> + libdtrace_LIBS += -lelf -lz -lrt -lpcap -lpthread -ldl -lm -lpfm
> + libdtrace_VERSION := 2.0.0
> + libdtrace_SONAME := libdtrace.so.2
> +@@ -93,11 +99,6 @@ libdtrace_VERSCRIPT := libdtrace.ver
> + libdtrace_LIBSOURCES := libdtrace-build libproc libport libcommon
> + libdtrace_SECONDARY := libproc libport
> + 
> +-# Required for dt_pid.c for varying instruction lengths on x86
> +-ifeq ($(shell uname -m), x86_64)
> +-libdtrace_LIBS += -lopcodes
> +-endif
> +-
> + # Disable certain warnings for these files
> + dt_bpf.c_CFLAGS := -Wno-pedantic
> + dt_btf.c_CFLAGS := -Wno-pedantic
> +diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> +index 5282efbd..f757c866 100644
> +--- a/libdtrace/dt_impl.h
> ++++ b/libdtrace/dt_impl.h
> +@@ -304,6 +304,7 @@ struct dtrace_hdl {
> + 	dt_htab_t *dt_kernsyms; /* htab of kernel symbol names */
> + 	char *dt_ctfa_path;	/* path to vmlinux.ctfa */
> + 	ctf_archive_t *dt_ctfa; /* ctf archive for the entire kernel tree */
> ++	void *dt_ctfa_data;	/* backing data for dt_ctfa */
> + 	char *dt_btf_path;	/* path to vmlinux.btf */
> + 	struct dt_btf *dt_shared_btf; /* BTF data for the kernel (shared) */
> + 	ctf_file_t *dt_shared_ctf; /* Handle to the shared CTF */
> +diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
> +index 00978911..14ca18fb 100644
> +--- a/libdtrace/dt_module.c
> ++++ b/libdtrace/dt_module.c
> +@@ -194,8 +194,16 @@ dt_module_lookup_by_ctf(dtrace_hdl_t *dtp, ctf_file_t *ctfp)
> + 	return ctfp ? ctf_getspecific(ctfp) : NULL;
> + }
> + 
> ++static void
> ++dt_module_delete_registered(dtrace_hdl_t *dtp, dt_module_t *dmp)
> ++{
> ++	if (dt_module_lookup_by_name(dtp, dmp->dm_name) == dmp)
> ++		dt_htab_delete(dtp->dt_mods, dmp);
> ++}
> ++
> + static int
> +-dt_module_init_elf(dtrace_hdl_t *dtp, dt_module_t *dmp)
> ++dt_module_init_elf_impl(dtrace_hdl_t *dtp, dt_module_t *dmp,
> ++    int unregister_on_error)
> + {
> + 	int fd, err, bits;
> + 	size_t shstrs;
> +@@ -226,7 +234,8 @@ dt_module_init_elf(dtrace_hdl_t *dtp, dt_module_t *dmp)
> + 	    elf_getshdrstrndx(dmp->dm_elf, &shstrs) == -1) {
> + 		dt_dprintf("failed to load %s: %s\n", dmp->dm_file,
> + 		    elf_errmsg(elf_errno()));
> +-		dt_htab_delete(dtp->dt_mods, dmp);
> ++		if (unregister_on_error)
> ++			dt_module_delete_registered(dtp, dmp);
> + 		return dt_set_errno(dtp, EDT_OBJIO);
> + 	}
> + 
> +@@ -242,7 +251,8 @@ dt_module_init_elf(dtrace_hdl_t *dtp, dt_module_t *dmp)
> + 	default:
> + 		dt_dprintf("failed to load %s: unknown ELF class\n",
> + 		    dmp->dm_file);
> +-		dt_htab_delete(dtp->dt_mods, dmp);
> ++		if (unregister_on_error)
> ++			dt_module_delete_registered(dtp, dmp);
> + 		return dt_set_errno(dtp, EDT_ELFCLASS);
> + 	}
> + 
> +@@ -252,6 +262,12 @@ dt_module_init_elf(dtrace_hdl_t *dtp, dt_module_t *dmp)
> + 	return 0;
> + }
> + 
> ++static int
> ++dt_module_init_elf(dtrace_hdl_t *dtp, dt_module_t *dmp)
> ++{
> ++	return dt_module_init_elf_impl(dtp, dmp, 1);
> ++}
> ++
> + static int
> + dt_module_load_sect(dtrace_hdl_t *dtp, dt_module_t *dmp, ctf_sect_t *ctsp)
> + {
> +@@ -297,6 +313,91 @@ dt_module_load_sect(dtrace_hdl_t *dtp, dt_module_t *dmp, ctf_sect_t *ctsp)
> + 	return 0;
> + }
> + 
> ++#ifdef HAVE_LIBCTF
> ++/*
> ++ * libctf-nobfd cannot use the BFD-backed ctf_arc_open() helper, so extract
> ++ * the .ctf section ourselves and open that with ctf_arc_bufopen().
> ++ */
> ++static ctf_archive_t *
> ++dt_ctfa_open(dtrace_hdl_t *dtp, const char *ctfa_name)
> ++{
> ++	ctf_archive_t	*ctfa = NULL;
> ++	ctf_sect_t	ctsp = { 0 };
> ++	dt_module_t	*dmp;
> ++	char		dm_file[PATH_MAX];
> ++	const dt_modops_t	*dm_ops;
> ++	Elf		*dm_elf;
> ++	void		*ctfa_data = NULL;
> ++
> ++	dmp = dtp->dt_exec;
> ++	if (dmp == NULL || strcmp(dmp->dm_name, "vmlinux") != 0)
> ++		dmp = dt_module_lookup_by_name(dtp, "vmlinux");
> ++	if (dmp == NULL) {
> ++		dtp->dt_ctferr = ECTF_INTERNAL;
> ++		return NULL;
> ++	}
> ++
> ++	/*
> ++	 * Borrow the registered vmlinux module as the ELF loader context, but
> ++	 * leave its persistent module state exactly as we found it.
> ++	 */
> ++	memcpy(dm_file, dmp->dm_file, sizeof(dm_file));
> ++	dm_ops = dmp->dm_ops;
> ++	dm_elf = dmp->dm_elf;
> ++
> ++	if (strlcpy(dmp->dm_file, ctfa_name, sizeof(dmp->dm_file)) >=
> ++	    sizeof(dmp->dm_file)) {
> ++		dtp->dt_ctferr = ENAMETOOLONG;
> ++		goto out;
> ++	}
> ++
> ++	errno = 0;
> ++	if (dt_module_init_elf_impl(dtp, dmp, 0) != 0) {
> ++		dtp->dt_ctferr = errno != 0 ? errno : ECTF_FMT;
> ++		goto out;
> ++	}
> ++
> ++	ctsp.cts_name = ".ctf";
> ++	ctsp.cts_entsize = 0;
> ++
> ++	if (dt_module_load_sect(dtp, dmp, &ctsp) == -1) {
> ++		dtp->dt_ctferr = ECTF_FMT;
> ++		goto out;
> ++	}
> ++
> ++	if (ctsp.cts_data == NULL || ctsp.cts_size == 0) {
> ++		dtp->dt_ctferr = ECTF_NOCTFDATA;
> ++		goto out;
> ++	}
> ++
> ++	ctfa_data = malloc(ctsp.cts_size);
> ++	if (ctfa_data == NULL) {
> ++		dtp->dt_ctferr = errno;
> ++		goto out;
> ++	}
> ++	memcpy(ctfa_data, ctsp.cts_data, ctsp.cts_size);
> ++	ctsp.cts_data = ctfa_data;
> ++
> ++	ctfa = ctf_arc_bufopen(&ctsp, NULL, NULL, &dtp->dt_ctferr);
> ++	if (ctfa != NULL) {
> ++		free(dtp->dt_ctfa_data);
> ++		dtp->dt_ctfa_data = ctfa_data;
> ++		ctfa_data = NULL;
> ++	}
> ++
> ++out:
> ++	free(ctfa_data);
> ++	if (dmp->dm_elf != dm_elf) {
> ++		if (dmp->dm_elf != NULL)
> ++			elf_end(dmp->dm_elf);
> ++		dmp->dm_elf = dm_elf;
> ++	}
> ++	dmp->dm_ops = dm_ops;
> ++	memcpy(dmp->dm_file, dm_file, sizeof(dmp->dm_file));
> ++	return ctfa;
> ++}
> ++#endif
> ++
> + /*
> +  * Only used for linked-in modules.  Archived modules are uncompressed
> +  * automatically.
> +@@ -928,7 +1029,11 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
> + 		} else
> + 			ctfa_name = dtp->dt_ctfa_path;
> + 
> ++#ifdef HAVE_LIBCTF
> ++		dtp->dt_ctfa = dt_ctfa_open(dtp, ctfa_name);
> ++#else
> + 		dtp->dt_ctfa = ctf_arc_open(ctfa_name, &dtp->dt_ctferr);
> ++#endif
> + 		if (dtp->dt_ctfa != NULL) {
> + 			/*
> + 			 * Load in the shared CTF immediately.
> +@@ -941,6 +1046,8 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
> + 				    ctfa_name, ctf_errmsg(dtp->dt_ctferr));
> + 				ctf_arc_close(dtp->dt_ctfa);
> + 				dtp->dt_ctfa = NULL;
> ++				free(dtp->dt_ctfa_data);
> ++				dtp->dt_ctfa_data = NULL;
> + 			} else {
> + 				dt_dprintf("Loaded shared CTF from archive %s.\n",
> + 				    ctfa_name);
> +@@ -958,7 +1065,7 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
> + 			 * data for shared_ctf from.
> + 			 */
> + 			mod = dt_module_lookup_by_name(dtp, "vmlinux");
> +-			if (mod->dm_btf != NULL) {
> ++			if (mod != NULL && mod->dm_btf != NULL) {
> + 				dt_kern_module_ctf_from_btf(dtp, mod);
> + 				dtp->dt_shared_ctf = mod->dm_ctfp;
> + 			} else
> +diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> +index 54adec02..a3932790 100644
> +--- a/libdtrace/dt_open.c
> ++++ b/libdtrace/dt_open.c
> +@@ -1319,6 +1319,7 @@ dtrace_close(dtrace_hdl_t *dtp)
> + 		ctf_close(dtp->dt_shared_ctf);
> + 	if (dtp->dt_ctfa != NULL)
> + 		ctf_arc_close(dtp->dt_ctfa);
> ++	free(dtp->dt_ctfa_data);
> + 
> + 	dt_pcap_destroy(dtp);
> + 
> diff --git a/dists/debian/patches/debian-surpress-utsname-in-note.patch b/dists/debian/patches/debian-surpress-utsname-in-note.patch
> new file mode 100644
> index 00000000..d058d8da
> --- /dev/null
> +++ b/dists/debian/patches/debian-surpress-utsname-in-note.patch
> @@ -0,0 +1,15 @@
> +diff --git a/libdtrace/dt_link.c b/libdtrace/dt_link.c
> +index 6d733881..5a7d414c 100644
> +--- a/libdtrace/dt_link.c
> ++++ b/libdtrace/dt_link.c
> +@@ -398,8 +398,10 @@ create_elf64(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, int fd, uint_t flags)
> + 	if (!(flags & DTRACE_D_STRIP)) {
> + 		if (note_add_version(usdt) == -1)
> + 			goto fail;
> ++#f 0
> + 		if (note_add_utsname(usdt) == -1)
> + 			goto fail;
> ++#endif
> + 	}
> + 
> + 	dt_free(dtp, usdt);
> diff --git a/dists/debian/patches/series b/dists/debian/patches/series
> index 99f0cdc5..3c97f198 100644
> --- a/dists/debian/patches/series
> +++ b/dists/debian/patches/series
> @@ -1,3 +1,4 @@
>  # You must remove unused comment lines for the released package.
>  debian-configure.patch
>  debian-fix-sed-path.patch
> +debian-static-linking.patch
> -- 
> 2.53.0
> 
> 

