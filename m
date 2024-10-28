Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD650646
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 05:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730092725; cv=fail; b=OXwep6cVP7d2A+sO4LckkVXGr17FwBlx9uIlbEcU4lCyGDG4x3Ct4JKt7Z5agxBWAOqm83HgerAe6eE3nf463n5qGICgTH37lg5QRceaMAu36uZj1RBtNNcFnfpd84AR2b10SZAhQWZB3v//ZZ67IWzS4AUjG2kl0Iu0MwrSCVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730092725; c=relaxed/simple;
	bh=PB7bZc5DYRXdR0hUOGtMbZqfQqaex133/ZCayR4xR/Y=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=lPRn3RnDPBXEmm48oARHpX1sjuPqwJmm+3AdliLFUcRbKAWGLJN2LN4XA3Lafiu7R0iOGifqu8sV4UzYleuf0ayIhAY1vrn2qUopeNYatc5b4IFz1C5o7HsbkWOvLCto8e4pbqVj1gk+3Zb02uzoegVP7d31gr5H8dbB1VyFaPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CadiUYHN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Eb3+sNsh; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CadiUYHN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Eb3+sNsh"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RNcx6w016646
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 05:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=n7llYMwDonckgw6WnipKolE2zgd4da8l1JvCfoi1wmQ=; b=
	CadiUYHNJfyANXZlER/FU+9/f9UM/y9V8zBv/0nG94XBUTCURS9eUBt8AI4jxMsK
	WqujVrye4BLIyEByvbrK1iECtvT2KZ7ppjUW6PVFE2JsUBa82tTFAR/LJAH8sx2W
	346HqNvoUsILcA0/jL5sfUtG15W6ZqmPXJkYo6km9m3dghNt4RigewPqHh3Ahlfk
	03E5cwKEkDidScqZmH+CjKx8l+vw3SQTy2CC98Hx8Amau8L82lJmGLRu/eGfzFqT
	mdi9tdapKRj+3DiJQYvIDCm1QUoNKc5hlRIgd4f5i64PlagY2fTQSruHlPv8ZpGb
	ZtfeXh1usgufTcYeDLhMpA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grys1wh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 05:18:41 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49S4I1L5040411
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 05:18:41 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2048.outbound.protection.outlook.com [104.47.55.48])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hnakxhnn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 05:18:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGPq8MlgZnPxFAbYMlzT9e0MJc31mh/nMhPKUHq13qEmUjHqc+0kGnFWWDmgvvOk9Ii1si2eTlXwR1ITpWc6AHUndHDyMuSykz4PcI9svSeiPwlGYGmZhIqMLmFMKbURvoCAkEHDworzBfBLhJQsXYjHxGfftpLRirksEfRbheQpHn8KpB6nR5/Ow+x4YDf4IDfVsWZWIFtbSTl8BxmER8lOm6AZtbyLy1DzyK0AAXk+Ear8QdAqDSL9Ozr7B2EfNRAl46x6/2sYXbFX41UZXN03Zb2c5PP2Yke+viICg64oMBYM+wYdjYx061Sc8QkKJMa1frlRfch8o0pE91yeLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7llYMwDonckgw6WnipKolE2zgd4da8l1JvCfoi1wmQ=;
 b=ZhA2u2sZPLAhZz5CUt00Z39f6BVZ9zDnr6WhDybQLt18cQXRlKdhxUC6h1lEMzQr4Po58vjO/BtZ4M5U07vGw6XMaZzkH93+FSQciWIeJFUFeXw2LpQtPexrjJsTcFncMQ+KHXRo3gmWGpSq8Xu+oSLuA9hQfwqHoufmQlpW+JQv2IOcI+O4DCjkoE7GDUGQnsrpOGy9Xqj7JhD1XOOSHepkxbjJb8hOgGqWOsNcQtViSGfz3fAmzzLlPm3dG4W1BcyUXcgwFkSRKEP28lCw7jldp1AuL+MXutdGqHViZdRnsCi6x9/Ghq6jK0knouBRwGDOJvcg9NPA+6YnMRsNyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7llYMwDonckgw6WnipKolE2zgd4da8l1JvCfoi1wmQ=;
 b=Eb3+sNshFLOrnvjcEmtxSPhJ9FhoY+j1xjiPRm/QqbjmtDNZr3O3lnUCuDSpqCZtWICJqJAQ9sFQkqeF+h0vV38LBIQiU7OI85cHQnR2G1WWLFNdtDpgsRVvp46KsvGVK4++6GWNa/4xdedx4+N/xrrJRVSFryPFBoffLdJeO6U=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA1PR10MB5757.namprd10.prod.outlook.com (2603:10b6:806:23e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Mon, 28 Oct
 2024 05:18:38 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8093.023; Mon, 28 Oct 2024
 05:18:38 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v4 02/19] Add a dt_provider_discover() function
Date: Mon, 28 Oct 2024 01:18:35 -0400
Message-Id: <20241028051836.16792-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0134.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::19) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA1PR10MB5757:EE_
X-MS-Office365-Filtering-Correlation-Id: bb4ea623-cfd8-4552-11c9-08dcf70ffa78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NAI0Vm2GidAGIqrPN1oREeB4/AisXRkzdwPge93muf13oSppoJxIvCm/mqB4?=
 =?us-ascii?Q?skSTL9ztP0NcYAXwdHLt0m5ojyAAFFKfRANtUKd5EN76tLZrsDld+OgzlJnL?=
 =?us-ascii?Q?uEK2mC4opiPkMDGGpAopP+Rd3k2NKKL93vijLXgk1JNU1D8U9IuWj25ylvEE?=
 =?us-ascii?Q?vmVuW6e6vhjdndl1qDvCZfyNd76LXnVolauWHufYg5x7BI6ak78lu3pxUzdg?=
 =?us-ascii?Q?aFgayiwuLO+w5Kw9BfKa618XknfUY7A9xhAKlqT1t8qcwPV313xHlhRUJU9d?=
 =?us-ascii?Q?3PLal2+agwlNgY9g/2TR63lH/gdO6+/52wFfj3Qizxss1UA73i8A6/nlnRRo?=
 =?us-ascii?Q?eUvArLhPRTQkTg5pxxjapwnpgb9Qk2x6/bw3gQ5cpddv0CIgi85IwPK4L7Th?=
 =?us-ascii?Q?ZbrBwo5avXDunUC0VxsHale2rpSgO1SjG1qiRHtsZfpIj40ywLtjG9qZ6Qe4?=
 =?us-ascii?Q?xFWnzkpf4OpQraQyA5m0z5Bw4gSC1X79LyAkSNdi5HkEglgHwPXa+5lDXiWi?=
 =?us-ascii?Q?vOa909I4+EdwslLi5Mhg3SFcZhA46wYL7OidKU+WfHGkBd61jWB8NjMbyz+f?=
 =?us-ascii?Q?qBY8a+xExFIwX+Qb00rB/twi7v1efGQaiiPp4QFG6mAxqVPujnD1NcMJNA+2?=
 =?us-ascii?Q?hCS6uM7d/gfRuXYmT5ywiMIh2hh/K7QrKqZZgcMg1bP08qIgafgK710t8K3P?=
 =?us-ascii?Q?1lAChWzry88ot0a6mE9zFsLrZtYVtw7qBCPCCWj58+wIrH5iVNcacKd7awVn?=
 =?us-ascii?Q?m2Ry7IXcldJoDf8McAE28tEyidSsD4Q7bkokdQsKekiJo7wlrPi/EMm7Y6p/?=
 =?us-ascii?Q?wC8yLRZza/zv95QKWy7N77n1rVeBNSLXzRDWgdGjzSb6an7eQxYFo1avAIOM?=
 =?us-ascii?Q?SVHsMo7QoDoU4brPPODEtK6r+wC4G8g2gXWfbhmhkPAH118L1ZohKRbJF2K9?=
 =?us-ascii?Q?b1PwEIv1tYDwR6GRZ8/NHWQGz3LJapcuN/Evq3lVr/wi+Xx3myxNGGfQvhIj?=
 =?us-ascii?Q?nd3D4gVv2RYBoxGLuNL/+JT8spFO3CaRPE6VKndNbswX8unu3nKukrbamC42?=
 =?us-ascii?Q?erIsftlRGQBKfk3ZWcSJEW5J2dRP+l3M9Mn1yfvGL7q8A+fIyklqw0Kv4Q2A?=
 =?us-ascii?Q?5DZV9DpGheePQ6a/UtpqaYy/GqvuGzrZWB7tU5NsLgOAhEKd1x2c48Kn42WZ?=
 =?us-ascii?Q?9pd1KVFs0Ksi3OpjHXdT/GeP2VwLtlBcy9/p9LNLj9nLWC20HypN/KhLlIZs?=
 =?us-ascii?Q?qbOb5ylzY+6zfgS0WMWKbDAmxuzedt84Tpv7/dEdZ4MJb1Nytxa3txph8fvc?=
 =?us-ascii?Q?HboPvByWc0qCv4uyUvKSeA8Y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a/LH8PxkwT7BhPvRN29Uw//uota5DBrChAUBLR5DoAHrbiGh+A0QPJ4Rywaq?=
 =?us-ascii?Q?aHHdChyJh8W+2R7C7WOBbz0pHAhtc/IFWnAkjcZ4wC6UnlwQPBPuShLv19q/?=
 =?us-ascii?Q?DqOIHg1ASdfSb0q6DHKztdTR0rYawPr6jmMAKIF0+NDc5H4pwfWj6LxMN+Gh?=
 =?us-ascii?Q?fBS9GkTAtGovBRNLg51xK/N/MO603pQ9sa9K7734h0yrQPz4BIwTGXB5ioJ/?=
 =?us-ascii?Q?piN/L3cOnj9NQiw5u3I9ZoS+wk5TbHo9AGaCKaYhf2TBWM6s9rEQFoGN2R6w?=
 =?us-ascii?Q?DDHS7mc+eIQ/WK7CYQVbqJ4PQPpltY2treGgCvhJGSr1AEWTPfChuW64mvDV?=
 =?us-ascii?Q?2+EYTd/3RiM9LM1nw85P+uLw/Nm7xZXQUbrX+31ctjAI6CdFBourNwyiC5pl?=
 =?us-ascii?Q?HCgPFtCNYr5advU66U9P8+EBQsUISaFyfnKX+MWGFhlP8TBWl5dEESE5q6dO?=
 =?us-ascii?Q?yGd7QqFi2VPTr3JWlvrwjf5d1JyqX754kHhNDHqUX+VunvsfIl80dzQr7BnJ?=
 =?us-ascii?Q?JiUzLEqL+N7jloAiMFGJvtSTsIc427Tf9W+GoodP2PYrNx47IwB8H0bxkeuA?=
 =?us-ascii?Q?BYYuzZDMXMBuYLchff4tNGEBCEs89Ov/Vqr3eUb/B7lqMF4lFegwSpHRjleZ?=
 =?us-ascii?Q?kIkiiUUxAIT1pdtsoHEmvQouAnG6ZF469zFfyrn77S02ZdEg2wcsRFyA/Nq9?=
 =?us-ascii?Q?outquJxtclbDuy18Y28MwRN2bSKEj4+BWOEANv/WwpasBgKEXj4wT711eL5b?=
 =?us-ascii?Q?byxqvGD2F4p7ZJKjXtp1IOM//NHfxqiTKIXt7aLQV2el+lywN6Z5TwXkRo9y?=
 =?us-ascii?Q?H5PgD61+9vNW6+FSdl/a29tq+sLd9ASziafWxqLvsj3kUHd4LuK2y4A4xk/l?=
 =?us-ascii?Q?gx644rBC0vtKZApxV9nCJP8PJWEW4wn2gPBAIvw5/W/Ts0/N8PPTOR83ZUkw?=
 =?us-ascii?Q?NSMu6ZkYT58x/MoJFD1OktoY6r02Dvnp6/do7nvCCDOBtOvtjD4LlVtsHP6y?=
 =?us-ascii?Q?LIwwWmXV3fBfxJDjc86ELT1g/QahQrY/CyYISWx0aZhadDGnvlWqnZWYegAH?=
 =?us-ascii?Q?5QI7gd5laNOdGDWXd+GuHmUM6tV0fJvy03jJCiNCbVzbsx43W2oKsJ1SuO2C?=
 =?us-ascii?Q?Z8+3BszOsANOKgzamzkvkSOJOaVXaRD2S0nuSa/Bo58HfffuKipNm34MDJJe?=
 =?us-ascii?Q?sXrHZjcJtR0eYY+7r5b91xZ7VbiwwkaaBi/8TnPQjUgotDWnWHds99LqGCP+?=
 =?us-ascii?Q?FNAXMFld9JufXqa6LidJ+391YPowGKvl8bAoEn+sVVzmkqKJPPdsX24qWopy?=
 =?us-ascii?Q?mJuoVRWiGMx9OYe/kQ0itKyJReLUN8rBEPwMT+ejKgQtyLR1BBtv38chm0PE?=
 =?us-ascii?Q?HVQZNgtEr5gdkIulQGL8Te9L5UXzJtJXKlf2XYC1Yr1aUQOHaggJN1RV72q4?=
 =?us-ascii?Q?/wx3MVzMCHgJqAlCkUJ1ZasB3cQxomj0e6Og71CRTwzJjWulIoOwr19wQ9kV?=
 =?us-ascii?Q?KVZnwskgUKGDry3+zKSXk+BTSA5BVFUXPxg8BS3bQalplXOVTBZK5JVLnwbE?=
 =?us-ascii?Q?zFrJAnSJ/hSuRb9oo9l6gs/Y36D0kB0JcgMLY18J?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sWI+fvPMN+C7+/G8+Jwie3He4cjL1iRD4hCyYq/uUpL7J2S/QNPRg/2GjCTIMSPU2nlgtBALOIQLfjNWvheFX+O0lZwT856f63TnNDMQ0IXQ05rumP4qzGf7Mm8dC7hXnYIddv42FIP8MXIoX9KA5XA2KWauQqMa2wwGGL5AoUqR2v5oCmqXzVHaaSq7Ddp8uP44989rUmjuPCC0HQmKvPsEVSZvWrv9nlrGZdJLAk/80QpUWlqGwruewBoDQ+AyHkyvmsreCxbaVKLMy6FDYbp1NPM90ENPM/bpPVOcJEsDYLr1X5/lblfd+a4oW9v8hjiEWRg0cLBnW9WET7mpsOt5wM4RRBhBlXeaZx+8tn2wb3za0Wwr1dTjoKvzljvksLmKSM+xjSo5yeMDfg2kkli44lA8uspMUABMPzdnlVu9goxAXgzi69T3p0fnm9KsWQOag7LEtglvRZQ8FPVDWHeY8R0rA+EcT+RzisQDdEFMbdq67C3SwJFkh1Uc6M8LeS4Bn9qCFWgNrj3MWIwZMC/IiPQtxooXonPy404m1eJn2tRLKsZ3NtwJFwuTh6SRaDCxSP+cd/dpIBWuaD+n4wXknO4RoH5chzUp9N5OQ94=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb4ea623-cfd8-4552-11c9-08dcf70ffa78
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 05:18:38.0632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Flac/nJR0KjVR3U3OFSMyiQJUiyazOFP6OweXUo9+Jn94SXr/dSJWwEKbmkePHgbLMOUEY2HBRprxkQ8nWjtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5757
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-27_08,2024-10-28_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280043
X-Proofpoint-ORIG-GUID: ExolJpN7XyrwiJMuAs_YCkW_eoh-erBu
X-Proofpoint-GUID: ExolJpN7XyrwiJMuAs_YCkW_eoh-erBu

From: Eugene Loh <eugene.loh@oracle.com>

It is possible for new providers and probes to appear after dtrace_go().
Add a function that can be called for such discovery, on a per-provider
basis.  Each provider that supports such discovery needs to provide:

*)  a function discover() that performs discovery on behalf of the provider

*)  a function add_probe() that adds a particular (discovered) probe

To support looping over providers, move dt_providers[] from
dt_open.c to dt_provider.c and extern it in dt_provider.h.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_bpf.c      |  4 +++
 libdtrace/dt_open.c     | 22 +---------------
 libdtrace/dt_provider.c | 57 +++++++++++++++++++++++++++++++++++++++++
 libdtrace/dt_provider.h |  6 +++++
 libdtrace/dt_work.c     |  3 +++
 5 files changed, 71 insertions(+), 21 deletions(-)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index ad11d178e..856110306 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -1275,6 +1275,10 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
 		int		fd;
 		int		rc = -1;
 
+		/* Handle probes discovered after compilation. */
+		if (prp->prov->impl->add_probe)
+			prp->prov->impl->add_probe(dtp, prp);
+
 		dp = prp->difo;
 		if (dp == NULL)
 			continue;
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 848141ddc..1f586fc4f 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -61,26 +61,6 @@ const dt_version_t _dtrace_versions[] = {
 	0
 };
 
-/*
- * List of provider modules that register providers and probes.  A single
- * provider module may create multiple providers.
- */
-static const dt_provimpl_t *dt_providers[] = {
-	&dt_dtrace,		/* list dt_dtrace first */
-	&dt_cpc,
-	&dt_fbt_fprobe,
-	&dt_io,
-	&dt_ip,
-	&dt_lockstat,
-	&dt_proc,
-	&dt_profile,
-	&dt_rawtp,
-	&dt_sched,
-	&dt_sdt,
-	&dt_syscall,
-	&dt_uprobe,
-};
-
 /*
  * Table of global identifiers.  This is used to populate the global identifier
  * hash when a new dtrace client open occurs.  For more info see dt_ident.h.
@@ -1210,7 +1190,7 @@ dtrace_init(dtrace_hdl_t *dtp)
 	 * known providers.
 	 */
 	dt_probe_init(dtp);
-	for (i = 0; i < ARRAY_SIZE(dt_providers); i++) {
+	for (i = 0; dt_providers[i]; i++) {
 		int	n;
 
 		n = dt_providers[i]->populate(dtp);
diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
index 8cfef0ba2..5f9766183 100644
--- a/libdtrace/dt_provider.c
+++ b/libdtrace/dt_provider.c
@@ -18,10 +18,32 @@
 #include <port.h>
 
 #include <dt_provider.h>
+#include <dt_probe.h>
 #include <dt_module.h>
 #include <dt_string.h>
 #include <dt_list.h>
 
+/*
+ * List of provider modules that register providers and probes.  A single
+ * provider module may create multiple providers.
+ */
+const dt_provimpl_t *dt_providers[] = {
+	&dt_dtrace,		/* list dt_dtrace first */
+	&dt_cpc,
+	&dt_fbt_fprobe,
+	&dt_io,
+	&dt_ip,
+	&dt_lockstat,
+	&dt_proc,
+	&dt_profile,
+	&dt_rawtp,
+	&dt_sched,
+	&dt_sdt,
+	&dt_syscall,
+	&dt_uprobe,
+	NULL
+};
+
 static uint32_t
 dt_provider_hval(const dt_provider_t *pvp)
 {
@@ -149,3 +171,38 @@ dt_provider_xref(dtrace_hdl_t *dtp, dt_provider_t *pvp, id_t id)
 	BT_SET(pvp->pv_xrefs, id);
 	return 0;
 }
+
+int
+dt_provider_discover(dtrace_hdl_t *dtp)
+{
+	int i, prid = dtp->dt_probe_id;
+
+	/* Discover new probes. */
+	for (i = 0; dt_providers[i]; i++) {
+		int n;
+
+		if (dt_providers[i]->discover == NULL)
+			continue;
+
+		n = dt_providers[i]->discover(dtp);
+		if (n < 0)
+			return -1;        /* errno is already set */
+	}
+
+	/* Add them. */
+	for ( ; prid < dtp->dt_probe_id; prid++) {
+		dt_probe_t	*prp = dtp->dt_probes[prid];
+		int		rc;
+
+		dt_probe_enable(dtp, prp);
+
+		if (prp->prov->impl->add_probe == NULL)
+			continue;
+
+		rc = prp->prov->impl->add_probe(dtp, prp);
+		if (rc < 0)
+			return rc;
+	}
+
+	return 0;
+}
diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
index 17b1844cb..384d4fd33 100644
--- a/libdtrace/dt_provider.h
+++ b/libdtrace/dt_provider.h
@@ -62,6 +62,9 @@ typedef struct dt_provimpl {
 	int (*probe_info)(dtrace_hdl_t *dtp,	/* get probe info */
 			  const struct dt_probe *prp,
 			  int *argcp, dt_argdesc_t **argvp);
+	int (*discover)(dtrace_hdl_t *dtp);	/* discover new probes */
+	int (*add_probe)(dtrace_hdl_t *dtp,	/* add a new probe */
+			 struct dt_probe *prp);
 	void (*detach)(dtrace_hdl_t *dtp,	/* probe cleanup */
 		       const struct dt_probe *prb);
 	void (*probe_destroy)(dtrace_hdl_t *dtp, /* free probe data */
@@ -86,6 +89,8 @@ extern dt_provimpl_t dt_sdt;
 extern dt_provimpl_t dt_syscall;
 extern dt_provimpl_t dt_uprobe;
 
+extern const dt_provimpl_t *dt_providers[];
+
 typedef struct dt_provider {
 	dt_list_t pv_list;		/* list forward/back pointers */
 	struct dt_hentry he;		/* htab links */
@@ -110,6 +115,7 @@ extern dt_provider_t *dt_provider_create(dtrace_hdl_t *, const char *,
 					 const dt_provimpl_t *,
 					 const dtrace_pattr_t *, void *);
 extern int dt_provider_xref(dtrace_hdl_t *, dt_provider_t *, id_t);
+extern int dt_provider_discover(dtrace_hdl_t *dtp);
 
 #ifdef	__cplusplus
 }
diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
index 11335345a..5318cdb7e 100644
--- a/libdtrace/dt_work.c
+++ b/libdtrace/dt_work.c
@@ -362,6 +362,9 @@ dtrace_work(dtrace_hdl_t *dtp, FILE *fp, dtrace_consume_probe_f *pfunc,
 	dtrace_workstatus_t	rval;
 	int			gen;
 
+	if (dt_provider_discover(dtp) < 0)
+		return DTRACE_WORKSTATUS_ERROR;
+
 	switch (dtrace_status(dtp)) {
 	case DTRACE_STATUS_EXITED:
 	case DTRACE_STATUS_STOPPED:
-- 
2.43.5

