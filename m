Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797183A7F69
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 17:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788025243; cv=fail; b=OIbNfodCECt3BqqvwaF6p9xwEehx4pTG0/Qumz+e0Zfg0AjNhINQNCNqim+L3McIF1SizvNj6M+uTRCBCFxJEO6I+y2G0phRpSzb0lI9gKP1kNjEqZwsysZNFWMzifMcbrXnHUrQVpG3xmnfRwh13VTId5/cVzfhADjN7zGA53E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788025243; c=relaxed/simple;
	bh=jeWU2QNORlZ9TYML6+zCJ62zIP7UcaLVjUqXfwvBJ2g=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BU/25/2NQYozwCj1haMh6yOxIe9WGK4DeSlnL9hKqC2Qp6CinyOyu/KYci2sltFWq/Q+6hsWi7nTXt4FunLjKwEuceA/JTFMzi9QVAoZtakFZ93FFRW0H9J87Grsizk8C8uw2Fi30+qBBwnf56DJcOKfwyvAOTp9Myr3rRH6Uwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aMi/dfyE; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QLubyLQ3; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aMi/dfyE";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QLubyLQ3"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67THZmAG1280580
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 17:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=nHyBdec2FiJINQQjJFg9D/MTDrnYgDsAlxvF9NIuoYw=; b=
	aMi/dfyE0SRlQIDOfZd23vPWVzOIFx/mgkb4pPqGG7jHyrssO2xiQ25XZx5FK7fq
	Pory4geQHJTWsbh8FRXFyb2djQSdWGJmMb9QiHkeHbiENFwL7+oRf1bG7SSPICrH
	xfx6dACJbV2vDaFSoB8JtRgzy4YqJsXftdG6j+B23TDwZmrDLiMYe1bnTxLu6rLz
	x2nTDW0KHLqqCPlVdKJpD94AyPn2bRK4LgQn2KwqvKQBjkUsGXyu9Opdmwd8aAIp
	nqX6ITneqgAIUMpyGg52E5JejJBhAxAfwVuN+6ZcUtnew+3ejORaKl4eIvLl2u6n
	7psiSmd/+rAOPhvvS1PQoQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gbqyrrf2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 17:40:40 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67THeYn3013667
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 17:40:39 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010054.outbound.protection.outlook.com [52.101.61.54])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4gbnvn5fhp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 17:40:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJDR8cqxpJf4223rgkVFlW2HQR8mAPplQK0L2oOZz3/6ZUJsi9/q9EvNj4VxRYMdqhY1M3jE8bFCKex61Yxmc4oSJvpFvWpQwoMwbzBW9pRtu19xBb2fYo+QNXny6C1cYASzjmCtR/pr6XIHOuKL0yuwQgyCURSEni99WJ7lq2W8AJXMX39nCGPHFNEYQ7qJ5nI9wvsCX9y3WAxQcH6A9Zy1uEumsilUsFQl77zHqYtRDyvdtXjXrev60dmPC4UsIhOTdvqdAb6MvMV0HA+grfvkV6EcP0fL0bSmvC2AW07ACseEqWa/v6XkkhZd7mbLRBXQ4+CYpY3AsZOjNJ8Byw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHyBdec2FiJINQQjJFg9D/MTDrnYgDsAlxvF9NIuoYw=;
 b=VlJ7dNF82+N+wGyjMlh3WkXDvFOuq6bnc6j4yon+iugW3OTN4l7HniajhiPl8Ch+TqZaFluYfsojYIi8d0hriKVVbAQBH1P5eGCmInOua39R6Kb8Nc+Fbf3tvjm/lyNyw0GW/yzT3Qc5Z29E/W+fNlu+WVQt4iTBXIHJIKuIGwINRRPzoFQ9yqLznukNOqKCWFS0OHNu7bdp+xD+/iw9w/S03inRsdbbjx1rO2oMGHD0qrRgqRxRrKMm3iBd+USnvjCnoTUzKw2sFYF1HPXuhl2M6+gQOfCwjTYb3oNZj5Z1ET1siIzqWVE6W88IrwFHFHtlSWkY1TeerftIUKod4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHyBdec2FiJINQQjJFg9D/MTDrnYgDsAlxvF9NIuoYw=;
 b=QLubyLQ3OUCWyRYyGH0LwB4psiAxfi0IMq8GkprCYMHlF1jba/vDtGWn/arCuLAgvYpFFHh9vymWV5O0izsnixa6noMba6jaZIoITeEnJuPa6SxL+IdjzayfjwUnp6MPvh08tK0uR0Yhy2x18lWMq/BNwljOzNafXMsUOyu70Jk=
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by PH7PR10MB6156.namprd10.prod.outlook.com (2603:10b6:510:1f3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.9; Sat, 29 Aug
 2026 17:39:44 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%5]) with mapi id 15.21.0382.007; Sat, 29 Aug 2026
 17:39:43 +0000
Message-ID: <8077115e-26f1-420d-b596-f36c8a04161f@oracle.com>
Date: Sat, 29 Aug 2026 11:39:41 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH 1/2] Add packaging configuration for Debian
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <10554a491a4523d4a81b676828508d1e@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <10554a491a4523d4a81b676828508d1e@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY5PR19CA0077.namprd19.prod.outlook.com
 (2603:10b6:930:69::26) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|PH7PR10MB6156:EE_
X-MS-Office365-Filtering-Correlation-Id: 799aba6b-311f-4c21-8462-08df05f482ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|13003099007|6133799003|3023799007|10067099003|56012099006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YAC5n7a3w94IjbI5s2mbPrKEPFOg95HRzxomJ1FNJsmfgQzhbJCwthfqVMwnW/x10O/TBUTJo4c52MIS8vqTCsK8y70zMOXBbGezmJXCBe7cY6N1NJAKm8BgZKEpO/29ZBAwZ/YlaH4p0nxHO8JLhygTdjtC5BPkE6iRW+bM3Qz6g8PgnBFb8U684/dZbU/GdoTF9oooglDTBxAxWLbyu1z9wzPR3cpdAO2IQfR2KOoMmfzcAqPIGeM0KC7yPBeLIFl5+1LjuUfLq7Pxv5H4BQ8RP2d3viFf6UnHnmHGIsXAzYKoQHgqGrHOwWGXY9EMOKcrUfz2cvxcGEepoSRbbO5ojjbLgJZK1vacMmyFcHK+eGIZeJOukevJIKfgms4+okHmjAETCuqOVkfDNam0IBwMaDK5Iw5QUP7sasxRjbTLRFTM4JZMP0gu35tDA/ApDczoxiWPzX7TJBdUmNsTDUsQS6y4OfYhV0Z+r3GK3258sc9MoaCCaCydbsVANEjEOkD9m7aRoKuAJnJfioGFBIHTqXx2NGnCkGGNY+LBtAvA7bAiw3eHG8nSdpFt874nz2b28MKGNVOudx9dPYLGIC26WAQP/EUoQjC0gFnbKO7OMLDySdcSWjL5d1DeNUl1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(13003099007)(6133799003)(3023799007)(10067099003)(56012099006)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YndXM3RZdjFJOXJvQTdpRytrY3hzYWJpVXdQZXRJTEVYc3l0OHd2d2FWOTZu?=
 =?utf-8?B?dmxoaTJoNmhIN1VaaGV6ZmtUV0lxZzZoN2J1K1ZDeGFSZjFFWFFnVlpGNTkw?=
 =?utf-8?B?VnNJQXI3elVyV0xNYTMrRGpObGNQU0M2ektmTHhKaFlLNk9Nd1ZVUU5UUERs?=
 =?utf-8?B?ZkdFcEh3amQ5RUp1aVp1b2xMa3htRWZIRlZja3FvK1hpMjdHV3dMUVZxdkdj?=
 =?utf-8?B?YlpYb3V0cmJYbHMzVUg0L091bEwwWGIxOXZ4UUNSSG1PU3pzT1I1Y3dVdEVI?=
 =?utf-8?B?eW11amlmaTVHbzEvb2VZNStUbUlaaU8wbUV1UC8rQXNJZUxNdDljNVRJenZk?=
 =?utf-8?B?cVdVQkZOM2RBdHpEQ3J6WDgrSzV1TVdhbHMvdTB2M3FzNlVtYmFqa052WkxM?=
 =?utf-8?B?RUFUT013Y0pDL2xTQmtIZXk2MldLZEZIUEtGNmVQV1k3eWpMeEJ4Z09sM0ox?=
 =?utf-8?B?MC9LS3hLSlVQMVdRbmJQeC81c2xpc2JzYVpZY1JZYWd0UktGaGVPNDBEZjd1?=
 =?utf-8?B?Vy9WZkpMYmRXUk90S3B1OFIweHRPMUlzWGgyMjlQY28wbWhvM2xmR0NuNVBk?=
 =?utf-8?B?TDhBTU1pcHZSY29CbUdyaENaWUNzYzlrV2hydnpsOVdweHFlOGEwYjBlRmdo?=
 =?utf-8?B?bW1vNWFWN0JnMTBST1ZsaTVBOXNrQ1VEaWpMUDByTUhLYWkxQjVQUlJ2Znc2?=
 =?utf-8?B?V1RKV29CR2s2MzlJY2FrNkVxUXQvZ0JZMmtzUzdoWlpYRWYzbTkvcTY4VVJ0?=
 =?utf-8?B?QWlRS01QMXFYcTd3cjRISGhXT0NseldWTmF1WmVlekRjR0czMkZsMDExTGpi?=
 =?utf-8?B?b1pJbDNJMzdXcHJmbXVBb1BYSTVhYXVoajNoOHA0cktrMW1ZNE9ybnJQa3Yy?=
 =?utf-8?B?aG5uVng0OEU4eFltWDFLL01XeCs3NkQ5WS9WTmRQWWs0K2FsSERrZ1h4aGY0?=
 =?utf-8?B?UkozeEtDdElsd0lBdDd1a080YU9WTDJZWk1ZVVpXcEw2UG9obDVoOUMvZXBK?=
 =?utf-8?B?bTZmM0c2R2I2NDVHYTdQWWQ2UW0velRjalZhMHFCMXJCaVFCQ2VGUVJZUE9K?=
 =?utf-8?B?Ui8rZ2V1UDZzbmd5TW5UZS9aY2dZZVptQTBONXhWR0hsTEp4MzFpbHVTRUhV?=
 =?utf-8?B?LzQxSnhUT3c3b0RnM3Bzb2NBeVRYeUJwVWc2NEd0M0ZSU3NXZDljNWZrTGJs?=
 =?utf-8?B?clpBSDRNMEVIQ1R5UnFSS0pNWXk1WStPRS91NDFDdWx4eEdVVkdOaW9hcEww?=
 =?utf-8?B?Tnh3RzErTnRWQjVJQWdBWG03a0dWY0RCQjBPWlhORzY3bFlkR2tIcXV5UE9a?=
 =?utf-8?B?V1IwSm45M0gwa2FEUUtieFJrbTRRYlJadjBFUFlpSS9uaG10ejhOL0RWVVV6?=
 =?utf-8?B?anhNNHFwSnQrNnFBV2tJcWlMbGRTVlFReVdMSnZiaFNzN0czN2ZpVUZwYnhl?=
 =?utf-8?B?V0xvUndxdm9lQ2Fvdm8yT3N1cHQyenVOaW1Sa015Uk1ubWpvd3RHa25pajhv?=
 =?utf-8?B?Y0NSZ3VuaklmcDk3Qys0Q092QmN3Y0xuc0t1aWpPd3ZZOFRPdTFqZm53bGt0?=
 =?utf-8?B?MzRPRUJ0WUdiK0xyWVk4cVV0QkptcEdkUUh2T1VVSUtmSUw4dHU5VVJzMWpr?=
 =?utf-8?B?YTFTam5aOXN1YjVETWtEMVBPSFd6aDVjK215ZkpOUEtiak15VWY0ZUxkRUpw?=
 =?utf-8?B?d1lyaXlQVkZtNSt2OHVTMlQ5MVg0V09hczFHZWpOM1BIR1ovd256azVlb0U2?=
 =?utf-8?B?bEQ4MG5XbmR3S2RiRFF0Y0JXYzNScHl2NGFBL0IySUNwUmxkdWJoeXhOWGE3?=
 =?utf-8?B?WU1nMTB0SXlyeENyM1BqUnRWd0VqMHFsYWh2dHMrTUxqdTNPeGs0eDFWSE5m?=
 =?utf-8?B?NVY0bExhcmsySmFuTGp4TXcycFFzb1dtN2RrSllvNDROOWRXZkN6RkhORXh0?=
 =?utf-8?B?b05HOXFSSElMc3VPdkxuUSswVmxqNFViR3dYeVRXSTRiR2pwMGxDMUtJdkI0?=
 =?utf-8?B?MDlaVkE2eTNmVUQrOGtxY0dISmdWaWZWWGJrd0dJSGkzQXFuRnc2KzZscENp?=
 =?utf-8?B?dHV6cU1XeXVXQStHMkg2QzNVM2kwRk5PSWtaZEJNY1JpWHNBWGpINDFqMlpv?=
 =?utf-8?B?WjhQaDBwbUhFSXdUT0Z6RXpmMWxVVnV6SW5NcHBnL2dBbDZwb2U0dGFMTEU3?=
 =?utf-8?B?bFVQUlZ2VGE5L2VsZEY5SmdxazhnaXZRbEhIdmhqeGZFOVJyZ20wYnpjZjZT?=
 =?utf-8?B?WWhHUWRvKys5Z0lNODB5SDVpeW0xK3ZPMWFLM2JTTjRKRDdVN2ZzazNJalFU?=
 =?utf-8?B?SkNkTGtJY1dIaTBOTVdNakJuL2dUZVQ1Q2VxSmxKR2pDSHYyV1lzbnBjSERW?=
 =?utf-8?Q?hCXtZkhqwVUbX24I=3D?=
X-Exchange-RoutingPolicyChecked:
	YJvmNKXPxnvmiePwJK2p5SQup7KlPM1bFr6M5AFtNEBAovcaCv0aVvZRVZsxP2wPdMo2ryeWRO5gekKZOFRiqEK/ugDKXluTYhtlglgphTf2EJ5jQnYaNWjDSbv5K/60EtZz2N+HxiCKN1xmmyzUGu8iUcHLGEch95H/Mc5WSQgNskRoO80EM7g9SE5BPVDBY3s2s5FIOVCgkUYVS2aQLzxSkIT3bZ4dqGN4vwg4f/Qil8UvyykM+FegPf78fznJg+M9buW7JMaDnv2GGV4e0NtbAfcdvh5ZzdMxGDsi+4bE6eAqMmDp0vql+mzofBuwnOkc9Bc0/Y8S5FyZU7CGFQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iwTTZidpiXwskbmmoJiQoqQIC8KvbZ+XNemHmdh3VGhSeH8QuBhPd0y8f7BClLWJnQIe1/OGglgq7Uk3oa1DnhdODHMAhybxk0UXSrnGkLiG8ufhY9etcIDVX2/U03M1Aa5KWwFd2UEn8IA4pDNuX8Try/epyjwXHy9IXNvRhKyd3tKqMgXCOjv+BtNVIrWMv4q1o/bknq0l73X6Wf6JM9Vr4H8maQfYWINkzpmi8Qx+kPwypL+x6XfNt7uMamBpGxyJKxU8+7KAC45nHywKcie3Mvli7VYq/rHU/aWlZWCtyfnT1WLul0fPBOGXcv+HcA6yReSd+9sG7+FKEzDO0scD64fHT/KvDuqX7Sq1htx3htQlJRy7vZoLKgZHue18CKpHg4uzuOWJFK5RO57+OmdLcMdpKkc3HZ6ipxpm0AdJH5uK8NaTkAd2+z+dsronCoQxO/q9EZGKygJAoyf7EfT485jOLrpInypJ2qk9dNpv7akz10V1ovvHtI+OPXdkqvT6C2USnggO5DmGRsG+pILyy7lDHy3w5CSogEmnXtAf1wwvacTcNRHlvUq6XiTD1+r6mW/GXR9Dp0FT5CyynduEFiBWcplYJgx8dcNYI8s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 799aba6b-311f-4c21-8462-08df05f482ad
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 17:39:43.7155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PNSQevaaq+eVFWAmcIeAZQacdVBVO5T6b4grQTr68iCQAeRyrvia6OKtHpeIBusLgiAUte1XPq0DOloYLqLx7d+HhoQP2s04hFeQEEi1Zfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6156
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606160000 definitions=main-2608290153
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE1MiBTYWx0ZWRfX1swUt89lTIEz
 4cfmQhNeLXzx4kWmrF0R+dS9tHnO3/e0dV2QmXZA/TyK4HYogyXL+PsM8uxEc7SDpbwKbgD/i0i
 3I4rkwPiK7dfgDt/vd+hAOE7fObBWuBRQrsUeGYMJe1hxDBtczSIuzIZugr1rulySu4ENopG8bM
 gzzViQ+ULCez3teD1j5n0FKENWtUlhhj/aJhw2N5nP6IDSPyiPXx289XMJMb1ALXyxdCsxYxZvL
 8dVnjSarKRi12xjkRpPe2vp7sdz/Z+aK5PaY1+ZYFtWBGbBYVW8X5A69eDmGf4dt+1pzyQvay8P
 VyF6LAIPQhKrFPLgYL19y11ut2Xjz9TMxdBpW5hX1EPsIRZoGstLFbhT1h7V9mognVmLHzb7wAS
 Hd5kKwdvNPGFUx1Xz3srFJ5/xphKvaDitc0a25XaSgtRxRkox0lqV51oLFUBTW4/qZkwI2Ne8Df
 I+9X/5bSErU+zsKzNe1BcfnWGWcFm4AYcVkj+Ad0=
X-Proofpoint-ORIG-GUID: gJPaHvvD9yhxEsra_d9czxaSXFgoVQYZ
X-Authority-Analysis: v=2.4 cv=fbCdDUQF c=1 sm=1 tr=0 ts=6a931998 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=7Gl3-_t3PgB9XO-mQDs3:22 a=yPCof4ZbAAAA:8
 a=NEAV23lmAAAA:8 a=xNf9USuDAAAA:8 a=mDV3o1hIAAAA:8 a=pGLkceISAAAA:8
 a=FKPg5YRAlW6owOH49H8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12101
X-Proofpoint-GUID: gJPaHvvD9yhxEsra_d9czxaSXFgoVQYZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE1MiBTYWx0ZWRfXxHZS0drzhTEC
 gZ8vmJ8LuGB8LDi8tsnxLiEdN+K4ZCiCDo1tZI/2HX8GNzEhPlF40uaCUMPOeSKsfwZsSa6BNKW
 CZYzMCePH1lBjcS36TGHonLLrga5VMpEUNp5xf4+oQs2CmCTwwTi


Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>

On 8/29/26 7:52 AM, Kris Van Hees via DTrace-devel wrote:
 
> Packaging configuration files for Debian are provided in dists/debian.
> 
> Sample steps to build DEB packages:
> 
>  - make dist
>  - cp dtrace-x.y.z.tar.bz2 $D/dtrace_x.y.z.orig.tar.bz2
>  - cd $D
>  - tar -jxpSf dtrace_x.y.z.orig.tar.bz2
>  - cd dtrace-x.y.z
>  - make prep-debian
>  - debuild
> 
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  dists/Build                                   |  14 ++
>  dists/debian/changelog                        |  20 ++
>  dists/debian/control                          |  74 ++++++++
>  dists/debian/copyright                        | 149 +++++++++++++++
>  dists/debian/dtrace-tests.install             |   1 +
>  dists/debian/dtrace-tests.lintian-overrides   |   8 +
>  dists/debian/dtrace.docs                      |   1 +
>  dists/debian/dtrace.install                   |   1 +
>  dists/debian/dtrace.lintian-overrides         |   1 +
>  dists/debian/dtrace.manpages                  |   1 +
>  dists/debian/libdtrace2-dev.install           |   5 +
>  dists/debian/libdtrace2.install               |  12 ++
>  dists/debian/libdtrace2.lintian-overrides     |   4 +
>  dists/debian/libdtrace2.manpages              |   1 +
>  dists/debian/mkChangelog                      | 174 ++++++++++++++++++
>  dists/debian/patches/debian-configure.patch   |  17 ++
>  .../debian/patches/debian-fix-sed-path.patch  |  12 ++
>  dists/debian/patches/series                   |   3 +
>  dists/debian/rules                            |  24 +++
>  dists/debian/source/format                    |   1 +
>  20 files changed, 523 insertions(+)
>  create mode 100644 dists/Build
>  create mode 100644 dists/debian/changelog
>  create mode 100644 dists/debian/control
>  create mode 100644 dists/debian/copyright
>  create mode 100644 dists/debian/dtrace-tests.install
>  create mode 100644 dists/debian/dtrace-tests.lintian-overrides
>  create mode 100644 dists/debian/dtrace.docs
>  create mode 100644 dists/debian/dtrace.install
>  create mode 100644 dists/debian/dtrace.lintian-overrides
>  create mode 100644 dists/debian/dtrace.manpages
>  create mode 100644 dists/debian/libdtrace2-dev.install
>  create mode 100644 dists/debian/libdtrace2.install
>  create mode 100644 dists/debian/libdtrace2.lintian-overrides
>  create mode 100644 dists/debian/libdtrace2.manpages
>  create mode 100755 dists/debian/mkChangelog
>  create mode 100644 dists/debian/patches/debian-configure.patch
>  create mode 100644 dists/debian/patches/debian-fix-sed-path.patch
>  create mode 100644 dists/debian/patches/series
>  create mode 100755 dists/debian/rules
>  create mode 100644 dists/debian/source/format
> 
> diff --git a/dists/Build b/dists/Build
> new file mode 100644
> index 00000000..882939c3
> --- /dev/null
> +++ b/dists/Build
> @@ -0,0 +1,14 @@
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
> +dists_DIR := $(current-dir)
> +
> +# Prepare package building on Debian (copy ./dists/debian in ./debian.
> +
> +prep-debian::
> +	$(call describe-target,DIST-PREP,Debian)
> +	rm -rf debian
> +	cp -rp $(dists_DIR)/debian .
> diff --git a/dists/debian/changelog b/dists/debian/changelog
> new file mode 100644
> index 00000000..b176f3cd
> --- /dev/null
> +++ b/dists/debian/changelog
> @@ -0,0 +1,20 @@
> +dtrace (2.0.7-1) unstable; urgency=medium
> +
> +  * Fix CVE-2026-21996: divide-by-zero if section header data corruped.
> +  * Fix CVE-2026-35233: OOB memory access.  (Closes: #1135619)
> +
> + -- Kris Van Hees <kvanhees@gmail.com>  Tue, 12 May 2026 17:55:24 -0400
> +
> +dtrace (2.0.6-1) unstable; urgency=medium
> +
> +  * Fix CVE-2026-21991: dtprobed unsafe probe description handling.
> +  * Limit building to supported architectures. (Closes: #1129637)
> +  * Remove unnecessary dependency ob binutils-bpf. (Closes: #1131271)
> +
> + -- Kris Van Hees <kvanhees@gmail.com>  Tue, 17 Mar 2026 17:53:17 -0400
> +
> +dtrace (2.0.5-1) unstable; urgency=medium
> +
> +  * Initial release. (Closes: #1128435)
> +
> + -- Kris Van Hees <kvanhees@gmail.com>  Fri, 20 Feb 2026 00:31:21 -0500
> diff --git a/dists/debian/control b/dists/debian/control
> new file mode 100644
> index 00000000..7560dc9a
> --- /dev/null
> +++ b/dists/debian/control
> @@ -0,0 +1,74 @@
> +Source: dtrace
> +Section: utils
> +Priority: optional
> +Maintainer: Kris Van Hees <kvanhees@gmail.com>
> +Build-Depends: debhelper-compat (= 13),
> + bison, flex, gawk, gcc-bpf (>= 14.2) , valgrind, binutils-dev (>= 2.44),
> + login.defs, libbpf-dev (>= 1.5), libc-dev (>= 2.34), libelf-dev, libfuse3-dev,
> + libpcap-dev, libpfm4-dev, libsystemd-dev, libz-dev
> +Standards-Version: 4.7.4
> +Homepage: https://github.com/oracle/dtrace/
> +Rules-Requires-Root: no
> +
> +Package: dtrace
> +Architecture: amd64 arm64
> +Depends: ${misc:Depends}, ${shlibs:Depends}
> +Description: Dynamic tracing for Linux (DTrace)
> + This is the official Linux port of the advanced tracing tool DTrace.
> + .
> + DTrace is a high-level dynamic tracing tool for Linux, built on kernel
> + tracing features (tracepoints, function probes (fentry/fexit), dynamic
> + kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
> + leveraging BPF as execution engine.  It features an integrated compiler
> + for its high-level tracing language and native support for interacting
> + with the BPF engine, significantly reducing runtime dependencies.
> +
> +Package: libdtrace2
> +Architecture: amd64 arm64
> +Depends: ${misc:Depends}, ${shlibs:Depends},
> + fuse3, libctf0, libelf1t64, libfuse3-4, libpcap0.8t64, libpfm4, libz1
> +Description: Dynamic tracing for Linux (DTrace) (library)
> + This is the official Linux port of the advanced tracing tool DTrace.
> + .
> + DTrace is a high-level dynamic tracing tool for Linux, built on kernel
> + tracing features (tracepoints, function probes (fentry/fexit), dynamic
> + kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
> + leveraging BPF as execution engine.  It features an integrated compiler
> + for its high-level tracing language and native support for interacting
> + with the BPF engine, significantly reducing runtime dependencies.
> + .
> + This package contains the shared library.
> +
> +Package: libdtrace2-dev
> +Architecture: amd64 arm64
> +Depends: ${misc:Depends},
> + libdtrace2 (= ${binary:Version})
> +Description: Dynamic tracing for Linux (DTrace) (development)
> + This is the official Linux port of the advanced tracing tool DTrace.
> + .
> + DTrace is a high-level dynamic tracing tool for Linux, built on kernel
> + tracing features (tracepoints, function probes (fentry/fexit), dynamic
> + kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
> + leveraging BPF as execution engine.  It features an integrated compiler
> + for its high-level tracing language and native support for interacting
> + with the BPF engine, significantly reducing runtime dependencies.
> + .
> + This package contains the development files necessary to develop
> + alternative implementations of the user interface for libdtrace, i.e.
> + replacements for dtrace(1) itself.
> +
> +Package: dtrace-tests
> +Architecture: amd64 arm64
> +Depends: ${misc:Depends}, ${shlibs:Depends}, ${perl:Depends},
> + binutils, cpp, gawk, gcc, make, pkgconf, tshark, bpftool
> +Description: Dynamic tracing for Linux (DTrace) (testsuite)
> + This is the official Linux port of the advanced tracing tool DTrace.
> + .
> + DTrace is a high-level dynamic tracing tool for Linux, built on kernel
> + tracing features (tracepoints, function probes (fentry/fexit), dynamic
> + kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
> + leveraging BPF as execution engine.  It features an integrated compiler
> + for its high-level tracing language and native support for interacting
> + with the BPF engine, significantly reducing runtime dependencies.
> + .
> + This package contains the testsuite.
> diff --git a/dists/debian/copyright b/dists/debian/copyright
> new file mode 100644
> index 00000000..5c5553b3
> --- /dev/null
> +++ b/dists/debian/copyright
> @@ -0,0 +1,149 @@
> +Format: https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/
> +Upstream-Name: dtrace
> +Upstream-Contact: Kris Van Hees <kris.van.hees@oracle.com>
> +Source: https://github.com/oracle/dtrace/
> +
> +Files: *
> +Copyright: Copyright (c) 2003, 2026, Oracle and/or its affiliates. All rights reserved.
> +License: UPL-1.0
> +
> +Files: bpf/*
> +Copyright: Copyright (c) 2019, 2026, Oracle and/or its affiliates.
> +License: GPL-2
> +
> +Files: debian/*
> +Copyright: Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> +License: UPL-1.0
> +
> +Files: bpf/Build bpf/GNUmakefile
> +Copyright: Copyright (c) 2003, 2026, Oracle and/or its affiliates. All rights reserved.
> +License: UPL-1.0
> +
> +Files: include/linux/bpf.h
> +Copyright: Copyright (c) 2011-2014 PLUMgrid
> +License: GPL-2 with Linux-syscall-note exception
> +
> +Files: include/linux/btf.h
> +Copyright: Copyright (c) 2018 Facebook
> +License: GPL-2 with Linux-syscall-note exception
> +
> +Files: include/sys/auxv.h include/sys/bitmap.h
> +Copyright: Copyright (c) 1984, 1986, 1987, 1988, 1989 AT&T
> +License: UPL-1.0
> +
> +Files: include/sys/glibc_internal_link.h
> +Copyright: Copyright disclaimed (all content required for interoperability)
> +License: LGPL-2.1+
> +
> +Files: libport/systemd_notify.c
> +Copyright: Copyright disclaimed (all content required for interoperability)
> +License: MIT-0
> +
> +Files: libproc/libproc.h libproc/Pcontrol.c
> +Copyright: Copyright (c) 2003, 2025, Oracle and/or its affiliates. All rights reserved.
> +License: UPL-1.0
> +
> +License: UPL-1.0
> + The Universal Permissive License (UPL), Version 1.0
> + .
> + Subject to the condition set forth below, permission is hereby granted
> + to any person obtaining a copy of this software, associated
> + documentation and/or data (collectively the "Software"), free of charge
> + and under any and all copyright rights in the Software, and any and all
> + patent rights owned or freely licensable by each licensor hereunder
> + covering either (i) the unmodified Software as contributed to or
> + provided by such licensor, or (ii) the Larger Works (as defined below),
> + to deal in both
> + .
> + (a) the Software, and
> + (b) any piece of software and/or hardware listed in the lrgrwrks.txt
> + file if one is included with the Software (each a “Larger Work” to which
> + the Software is contributed by such licensors),
> + .
> + without restriction, including without limitation the rights to copy,
> + create derivative works of, display, perform, and distribute the
> + Software and make, use, sell, offer for sale, import, export, have made,
> + and have sold the Software and the Larger Work(s), and to sublicense the
> + foregoing rights on either these or other terms.
> + .
> + This license is subject to the following condition:
> + The above copyright notice and either this complete permission notice or
> + at a minimum a reference to the UPL must be included in all copies or
> + substantial portions of the Software.
> + .
> + THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
> + OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> + MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
> + LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
> + OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
> + WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> + Licensed under the Universal Permissive License v 1.0 as shown at
> + https://oss.oracle.com/licenses/upl.
> +
> +License: GPL-2
> + This program is free software; you can redistribute it
> + and/or modify it under the terms of the GNU General Public
> + License version 2 as published by the Free Software Foundation.
> + .
> + On Debian systems, the full text of the GNU General Public
> + License version 2 can be found in the file
> + `/usr/share/common-licenses/GPL-2'.
> +
> +License: GPL-2 with Linux-syscall-note exception
> + This program is free software; you can redistribute it
> + and/or modify it under the terms of the GNU General Public
> + License version 2 as published by the Free Software Foundation.
> + .
> + On Debian systems, the full text of the GNU General Public
> + License version 2 can be found in the file
> + `/usr/share/common-licenses/GPL-2'.
> + .
> + NOTE! This copyright does *not* cover user programs that use kernel
> + services by normal system calls - this is merely considered normal use
> + of the kernel, and does *not* fall under the heading of "derived work".
> + Also note that the GPL below is copyrighted by the Free Software
> + Foundation, but the instance of code that it refers to (the Linux
> + kernel) is copyrighted by me and others who actually wrote it.
> + .
> + Also note that the only valid version of the GPL as far as the kernel
> + is concerned is _this_ particular version of the license (ie v2, not
> + v2.2 or v3.x or whatever), unless explicitly otherwise stated.
> +
> +License: LGPL-2.1+
> + This file is part of the GNU C Library.
> + .
> + The GNU C Library is free software; you can redistribute it and/or
> + modify it under the terms of the GNU Lesser General Public
> + License as published by the Free Software Foundation; either
> + version 2.1 of the License, or (at your option) any later version.
> + .
> + The GNU C Library is distributed in the hope that it will be useful,
> + but WITHOUT ANY WARRANTY; without even the implied warranty of
> + MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + Lesser General Public License for more details.
> + .
> + You should have received a copy of the GNU Lesser General Public
> + License along with the GNU C Library; if not, see
> + <https://www.gnu.org/licenses/>.
> +
> +License: MIT-0
> + MIT License
> + .
> + Permission is hereby granted, free of charge, to any person obtaining a
> + copy of this software and associated documentation files (the "Software"),
> + to deal in the Software without restriction, including without limitation
> + the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + and/or sell copies of the Software, and to permit persons to whom the
> + Software is furnished to do so, subject to the following conditions:
> + .
> + The above copyright notice and this permission notice shall be included in
> + all copies or substantial portions of the Software.
> + .
> + THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> + AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> + DEALINGS IN THE SOFTWARE.
> diff --git a/dists/debian/dtrace-tests.install b/dists/debian/dtrace-tests.install
> new file mode 100644
> index 00000000..a04ebfb9
> --- /dev/null
> +++ b/dists/debian/dtrace-tests.install
> @@ -0,0 +1 @@
> +usr//lib/${DEB_HOST_MULTIARCH}/dtrace/testsuite/
> diff --git a/dists/debian/dtrace-tests.lintian-overrides b/dists/debian/dtrace-tests.lintian-overrides
> new file mode 100644
> index 00000000..22cbd6eb
> --- /dev/null
> +++ b/dists/debian/dtrace-tests.lintian-overrides
> @@ -0,0 +1,8 @@
> +dtrace-tests binary: unstripped-binary-or-object [*]
> +dtrace-tests binary: unusual-interpreter dtrace [*.d]
> +dtrace-tests binary: interpreter-not-absolute dtrace [*.d]
> +dtrace-tests binary: executable-not-elf-or-script [*.d]
> +dtrace-tests binary: relative-library-search-path RUNPATH test/triggers [*]
> +dtrace-tests binary: statically-linked-binary [*]
> +dtrace-tests binary: package-has-unnecessary-activation-of-ldconfig-trigger
> +dtrace-tests binary: shared-library-lacks-prerequisites [*/dtrace/testsuite/test/triggers/libproc-dlmlib.so.0.0.0]
> diff --git a/dists/debian/dtrace.docs b/dists/debian/dtrace.docs
> new file mode 100644
> index 00000000..7696583d
> --- /dev/null
> +++ b/dists/debian/dtrace.docs
> @@ -0,0 +1 @@
> +usr/share/doc/dtrace-${env:DEB_VERSION_UPSTREAM}/
> diff --git a/dists/debian/dtrace.install b/dists/debian/dtrace.install
> new file mode 100644
> index 00000000..6be68ccb
> --- /dev/null
> +++ b/dists/debian/dtrace.install
> @@ -0,0 +1 @@
> +usr/sbin/dtrace
> diff --git a/dists/debian/dtrace.lintian-overrides b/dists/debian/dtrace.lintian-overrides
> new file mode 100644
> index 00000000..11005f4a
> --- /dev/null
> +++ b/dists/debian/dtrace.lintian-overrides
> @@ -0,0 +1 @@
> +dtrace binary: unstripped-binary-or-object [*]
> diff --git a/dists/debian/dtrace.manpages b/dists/debian/dtrace.manpages
> new file mode 100644
> index 00000000..e54b52b3
> --- /dev/null
> +++ b/dists/debian/dtrace.manpages
> @@ -0,0 +1 @@
> +usr/share/man/man8/dtrace.8
> diff --git a/dists/debian/libdtrace2-dev.install b/dists/debian/libdtrace2-dev.install
> new file mode 100644
> index 00000000..b5e66db5
> --- /dev/null
> +++ b/dists/debian/libdtrace2-dev.install
> @@ -0,0 +1,5 @@
> +usr/lib/${DEB_HOST_MULTIARCH}/libdtrace.so
> +usr/include/dtrace
> +usr/include/dtrace.h
> +usr/include/sys/dtrace.h
> +usr/include/sys/dtrace_types.h
> diff --git a/dists/debian/libdtrace2.install b/dists/debian/libdtrace2.install
> new file mode 100644
> index 00000000..36294de3
> --- /dev/null
> +++ b/dists/debian/libdtrace2.install
> @@ -0,0 +1,12 @@
> +usr/lib/${DEB_HOST_MULTIARCH}/dtrace/[0-9]*/
> +usr/lib/${DEB_HOST_MULTIARCH}/dtrace/bpf_dlib.o
> +usr/lib/${DEB_HOST_MULTIARCH}/dtrace/drti/
> +usr/lib/${DEB_HOST_MULTIARCH}/dtrace/include/
> +usr/lib/${DEB_HOST_MULTIARCH}/libdtrace.so.*
> +usr/lib/${DEB_HOST_MULTIARCH}/pkgconfig/dtrace.pc
> +usr/lib/${DEB_HOST_MULTIARCH}/pkgconfig/dtrace_sdt.pc
> +usr/lib/systemd/system/dtprobed.service
> +usr/lib/systemd/system/dtrace-usdt.target
> +usr/lib/systemd/system-preset/50-dtprobed.preset
> +usr/lib/udev/rules.d/60-dtprobed.rules
> +usr/sbin/dtprobed
> diff --git a/dists/debian/libdtrace2.lintian-overrides b/dists/debian/libdtrace2.lintian-overrides
> new file mode 100644
> index 00000000..34b4011d
> --- /dev/null
> +++ b/dists/debian/libdtrace2.lintian-overrides
> @@ -0,0 +1,4 @@
> +libdtrace2 binary: binary-from-other-architecture [*/dtrace/bpf_dlib.o]
> +libdtrace2 binary: unstripped-binary-or-object [*]
> +libdtrace2 binary: appstream-metadata-missing-modalias-provide usr/lib/udev/rules.d/60-dtprobed.rules
> +libdtrace2 binary: systemd-service-file-refers-to-unusual-wantedby-target basic.target [usr/lib/systemd/system/dtprobed.service]
> diff --git a/dists/debian/libdtrace2.manpages b/dists/debian/libdtrace2.manpages
> new file mode 100644
> index 00000000..fef53dc3
> --- /dev/null
> +++ b/dists/debian/libdtrace2.manpages
> @@ -0,0 +1 @@
> +usr/share/man/man8/dtprobed.8
> diff --git a/dists/debian/mkChangelog b/dists/debian/mkChangelog
> new file mode 100755
> index 00000000..69958dca
> --- /dev/null
> +++ b/dists/debian/mkChangelog
> @@ -0,0 +1,174 @@
> +#!/usr/bin/awk -f
> +
> +#
> +# This script can be used to convert the dtrace.spec into a Debian changelog
> +# file.  It is intended to be invoked from the 'prep-debian' make target, but
> +# it can be used manually as well:
> +#	mkChangelog debian/control dtrace.spec > debian/changelog
> +#
> +
> +function error(msg) {
> +	print "E:"msg >"/dev/stderr";
> +	err = 1;
> +	exit(1);
> +}
> +
> +BEGIN {
> +	if (!dist)
> +		dist = "UNRELEASED";
> +	else if (dist != "unstable" && dist != "experimental")
> +		error("Bad dist ("dist")");
> +}
> +
> +/^Maintainer:/ {
> +	sub(/^Maintainer: +/, "");
> +	m_name = $0;
> +	i = index(m_name, " <");
> +	m_mail = substr(m_name, i + 1);
> +	m_name = substr(m_name, 1, i - 1);
> +
> +	nextfile;
> +}
> +
> +/^Name:/ {
> +	pkg = $2;
> +	next;
> +}
> +
> +/^%changelog/ {
> +	in_changelog = 1;
> +	next;
> +}
> +
> +!in_changelog {
> +	next;
> +}
> +
> +function lineWrap(p, s, line, len, l, n, m, i) {
> +	n = length(p);
> +	line = p;
> +	len = n;
> +
> +	m = split(s, arr, / +/);
> +	for (i = 1; i <= m; i++) {
> +		l = length(arr[i]);
> +		if (len + 1 + l >= 80) {
> +			print line;
> +			line = sprintf("%*s %s", n, "", arr[i]);
> +			len = n + 1 + l;
> +		} else {
> +			line = line " " arr[i];
> +			len += 1 + l;
> +		}
> +	}
> +	delete arr;
> +
> +	print line;
> +}
> +
> +function emitEntry(i, j, n) {
> +	# Loop through the contributions, determining who each contribution
> +	# should be credited to.  If there are multiple contributors, we pick
> +	# the first one who is not the commit author (if any).
> +	# If all contributions are from the commit author, we do not emit an
> +	# explicit credit line.
> +	for (i = 1; i <= lc; i++) {
> +		gsub(/ \[Orabug[:;] [1-9][0-9]*(, [1-9][0-9]*)*\]/, "", lv[i]);
> +		sub(/[ \t]+$/, "", lv[i]);
> +		gsub(/  +/, " ", lv[i]);
> +
> +		cont = name;
> +		if (match(lv[i], /\([^)]+\)$/) > 0) {
> +			auth = substr(lv[i], RSTART + 1, RLENGTH - 2);
> +			lv[i] = substr(lv[i], 1, RSTART - 1);
> +			sub(/[ \t]+$/, "", lv[i]);
> +			n = split(auth, arr, /, */);
> +
> +			# Find the first contributor not the commit author.
> +			for (j = 1; j <= n; j++) {
> +				if (arr[j] == name)
> +					continue;
> +				cont = arr[j];
> +				break;
> +			}
> +			delete arr;
> +		}
> +
> +		# Add to the list of contributions for this contributor.
> +		if (cont in map)
> +			map[cont] = map[cont] " " i;
> +		else
> +			map[cont] = i;
> +	}
> +
> +	print pkg" ("vers") "dist"; urgency=medium";
> +
> +	# First emit contributions by people other than the commit author.
> +	n = 0;
> +	for (cont in map) {
> +		if (cont == name)
> +			continue;
> +
> +		n++;
> +		print "\n  [ "cont" ]";
> +		$0 = map[cont];
> +		for (i = 1; i <= NF; i++)
> +			lineWrap("  *", lv[int($i)]);
> +	}
> +	if (n > 0)
> +		print "\n  [ "name" ]";
> +	else
> +		print "";
> +
> +	$0 = map[name];
> +	for (i = 1; i <= NF; i++)
> +		lineWrap("  *", lv[int($i)]);
> +
> +	delete map;
> +
> +	if (m_name) {
> +		name = m_name;
> +		mail = m_mail;
> +		m_name = m_mail = 0;
> +	}
> +	print "\n -- "name" "mail"  "date" 00:00:00 +0000\n";
> +}
> +
> +/^\* (Sun|Mon|Tue|Wed|Thu|Fri|Sat) [A-Z][a-z][a-z] [ 0-3][0-9] / {
> +	date = $2", "$4" "$3" "$5;
> +	i = index($0, " - ");
> +	vers = substr($0, i + 3);
> +	name = substr($0, 19, i - 19);
> +	i = index(name, " <");
> +	mail = substr(name, i + 1);
> +	name = substr(name, 1, i - 1);
> +	if (name == "")
> +		error("No name in: "$0);
> +
> +	lc = 0;
> +	delete lv;
> +
> +	next;
> +}
> +
> +/^- / {
> +	sub(/^- +/, "");
> +	lv[++lc] = $0;
> +	next;
> +}
> +
> +NF == 0 {
> +	emitEntry();
> +	date = "";
> +	next;
> +}
> +
> +{
> +	lv[lc] = lv[lc] $0;
> +	next;
> +}
> +
> +END {
> +	if (date && !err)
> +		emitEntry();
> +}
> diff --git a/dists/debian/patches/debian-configure.patch b/dists/debian/patches/debian-configure.patch
> new file mode 100644
> index 00000000..f8a6a698
> --- /dev/null
> +++ b/dists/debian/patches/debian-configure.patch
> @@ -0,0 +1,17 @@
> +Description: issue a warning for unknown configure options
> + The Debian build system specifies configure options that are not known to
> + the DTrace configure script.  They should not cause the configure script
> + to abort.
> +
> +--- dtrace-2.0.5.orig/configure
> ++++ dtrace-2.0.5/configure
> +@@ -188,8 +188,7 @@ for option in "$@"; do
> +               echo "Unknown option $option" >&2
> +               exit 1
> +            fi;;
> +-        *) echo "Unknown option $option" >&2
> +-           exit 1;;
> ++        *) echo "Unknown option $option" >&2;;
> +     esac
> + done
> + 
> diff --git a/dists/debian/patches/debian-fix-sed-path.patch b/dists/debian/patches/debian-fix-sed-path.patch
> new file mode 100644
> index 00000000..9a4865a2
> --- /dev/null
> +++ b/dists/debian/patches/debian-fix-sed-path.patch
> @@ -0,0 +1,12 @@
> +Description: change /usr/bin/sed into /bin/sed
> + A new test was added in 2.0.7 that refers to /usr/bin/sed which should be
> + changed to /bin/sed.  This patch will be applied to upstream as well.
> +
> +--- dtrace-2.0.5.orig/test/internals/libproc/err.bad_sh_link.r.p
> ++++ dtrace-2.0.5/test/internals/libproc/err.bad_sh_link.r.p
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/sed -Ef
> ++#!/bin/sed -Ef
> + # Fix up DEBUG lines
> + s/DEBUG [0-9]+:/DEBUG:/
> + s/, [0-9]+\]/, NNN]/
> diff --git a/dists/debian/patches/series b/dists/debian/patches/series
> new file mode 100644
> index 00000000..99f0cdc5
> --- /dev/null
> +++ b/dists/debian/patches/series
> @@ -0,0 +1,3 @@
> +# You must remove unused comment lines for the released package.
> +debian-configure.patch
> +debian-fix-sed-path.patch
> diff --git a/dists/debian/rules b/dists/debian/rules
> new file mode 100755
> index 00000000..8646ac1a
> --- /dev/null
> +++ b/dists/debian/rules
> @@ -0,0 +1,24 @@
> +#!/usr/bin/make -f
> +# You must remove unused comment lines for the released package.
> +export DH_VERBOSE = 1
> +export DEB_BUILD_MAINT_OPTIONS = hardening=+all
> +export DEB_CFLAGS_MAINT_APPEND  = -Wall -pedantic
> +export DEB_LDFLAGS_MAINT_APPEND = -Wl,--as-needed
> +
> +include /usr/share/dpkg/pkg-info.mk
> +
> +export DEB_VERSION_UPSTREAM
> +
> +%:
> +	dh $@
> +
> +override_dh_auto_configure:
> +	dh_auto_configure -- --pkg-config-dir=\$${LIBDIR}/pkgconfig BPFC=bpf-gcc BPFLD=bpf-ld
> +
> +override_dh_strip:
> +	dh_strip -Xdtrace
> +
> +override_dh_auto_test:
> +
> +override_dh_auto_install:
> +	dh_auto_install -- install-test
> diff --git a/dists/debian/source/format b/dists/debian/source/format
> new file mode 100644
> index 00000000..163aaf8d
> --- /dev/null
> +++ b/dists/debian/source/format
> @@ -0,0 +1 @@
> +3.0 (quilt)
> -- 
> 2.53.0
> 
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel

