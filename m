Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D155317D355
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 17:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730222060; cv=fail; b=UOhOcidlWHDL0MudKG9xmzzavRqaQztgyo5UVXEiXj76YWwiprrotBDWqPTeSTsK+M9cSqBsj1WLoDtn2NQreAJu4ptG6bo/uadkjwGbij+OAvm6jTibTQkqhYJmXRm8jnUstohsEtGkp94Pui3FenjTwJXUr+FA9wuxQBEpBN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730222060; c=relaxed/simple;
	bh=yVFpAbFprXfwof4BGc/ycxk9vXBMlI6ulFEGIi99z7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=h9lkP3Vv32McRe0/uwo68cAw0p+H9w22lQ0NGaGU/guRnDhgJYFZEcFWDglfL1NIPwfw3Feb74Wv8TntYp8I99fTZIBCQGHCMT3l1pFGG6Slkifel8zdD/d2LjIYSOGJ5jpM8c4/PBqjOGzyJdPiS+RMnT9JD5eE6OVUcqxwukI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HfirlPnE; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WUEqwSdg; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HfirlPnE";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WUEqwSdg"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TGfg9F004509
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 17:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=X4gT6OkEMWy7I81olY
	DJTQuQc0TvJjLo4JyNJvZsgyU=; b=HfirlPnEEeiTMR6vZxn+lThwVXMxenc3Wb
	GG2TM5NMxU89B+WgUv9qGHJ2a431mUgk3Dr2GfZ4AXf8iiVdvLRrw260ybkMARO6
	m0OytmIlKYW7diVp/uWj/hORRVlR1gaIL63tAFjSNjWwD2RyLEH4vWR820hBatSp
	IZDCqfQ/7b1CzqNyAIMNOVtLeOCB1v/RZTOhJbl2F1QEHRymGvl31VhgvYkmX84Z
	OjMckjzfCu+jO5yrynlO0d0ZYuGB2vUJs6QSjF3xK90fIFIBYE1WYzzeSZFxv5OL
	HCe6SdzCKYFOUVFrfdQmfBPUXSHSZU0K/WDeLUe2QuFVgbf2hD4w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdxp4fc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 17:14:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49TGiaqJ040258
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 17:14:15 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2048.outbound.protection.outlook.com [104.47.58.48])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hnapevre-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 17:14:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ccwNFza9fdBnGwAmBBTtHjfDi1eNg2bkrayS0vuf9aRxyBv2tE7gXweSsFUqr+M7KZ27+p5Na+m4yIYgwYbCr5Jj2A6cw5cYZj3pK4bzmI+LgwGcaV7MgU2l6QdK2slgNxEhV2H5AKd2GVTaOFuFcJJSHQaf5C+7eWy+YkFNbFV9LmwAGyGwDa5JP+RduVqcrMUqyKC8YoGwoyqULGUAwf5e113Mjy34SiFGFaq8V0dKdPB8yQdVCnL8TUz9raBzx7pF0+my9u64bjRDGLY48C9UbIFixBQFU58Fi0m6VAZh+0B1/xO+OOazZcxTBnIroASdHekjJ4Avapa5eO3HJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4gT6OkEMWy7I81olYDJTQuQc0TvJjLo4JyNJvZsgyU=;
 b=kKRl6na4meBiN3iv0n+Zbb+Yc7UUUgchQnzRJdM7D9KYNe4x1ZkctoukhNbxqFvQUIdyTJ8g61+y60aWzOj/U0k63dMQeApbCRh26mFpM4cMewzE5S45wrNp0FEVuIbelUoeq7Z2vfMC5vu4F4IDusmjkhAI4HQrcJgJgPzhQzILbMOs0NXxKHtYq7Hs536To2I/w5Oe0sLE6vbSGlj30UvIA5LQ2ea2yx+S2dGQAEdiyRHYyeVunKr0YzAJsbucK0aS6he0oLzcz4VbYy6rIKIlaXHlT7reR5IYP++xRpz1SJjd5O+8JsqqB9BoaCpPWPVxbC6yG2qwuVFbzl17tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4gT6OkEMWy7I81olYDJTQuQc0TvJjLo4JyNJvZsgyU=;
 b=WUEqwSdgu6FEAsg7v/mGev666U0M4lHa+ZbVfPVWz35fcIiDThtQPq8izSEOvO5AafZAG3ZAJfs5NjA5s5cNLVpDS7xItrhLE/pgf1FLJKFIGzbgQAV82N1nRYsjcD8RWRy6Jwo3F/uaQDzvjT08LYe1goiK+yEjP3aEZ2fzBJE=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by CO6PR10MB5604.namprd10.prod.outlook.com (2603:10b6:303:14b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.19; Tue, 29 Oct
 2024 17:14:09 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8114.015; Tue, 29 Oct 2024
 17:14:09 +0000
Date: Tue, 29 Oct 2024 13:14:06 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 19/22] test: Fix tst.probestar.d trigger
Message-ID: <ZyEX3pqD-zqrosP2@kvh-deb-bpf.us.oracle.com>
References: <20241017230005.12504-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017230005.12504-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BYAPR06CA0066.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::43) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|CO6PR10MB5604:EE_
X-MS-Office365-Filtering-Correlation-Id: b91bf71d-8316-4362-8618-08dcf83d19e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fZ5Vk+WtbB9qBHTpJP/7Ix9U/B6xETtSyE6hJ+KoJg3Pj1J+mmyFw318tV57?=
 =?us-ascii?Q?grferQ1bMTPdPcMfzaH7jh5NWho5v95Zsiko9GB+fKu23M/s6Ekobc9O9UoS?=
 =?us-ascii?Q?63Md7P4K/ANZezzqBr7CiuxlEeO3ceYOAIHiOgT9mxoZEwSRdEpS+z2Tyd88?=
 =?us-ascii?Q?xBBUvunumV/N2A3LP8kNoX7teUYjKM2Ticv0yPdlLpFsB3Qg7hitPfW7eMVk?=
 =?us-ascii?Q?Tgzq/Spe1WGfAb4oZ+hUujflCXkozIq4DXPWCq6pv99emjNIRR5R3WEiDfTq?=
 =?us-ascii?Q?VqUwj0jIvbIi4MW0lceiRvvCSBBJceSD85J0sIM5VQHaSwABKwiGc6/CePNb?=
 =?us-ascii?Q?CzLQi3SE32S75poddkse3hNgOoF4REVCM3zhQn1VsZileHFKT/eSb3XdD0c5?=
 =?us-ascii?Q?YSnXV/QUu8SzBgN5XM3o+33pdiFF4qKiOJC7VcPx1bZ393mXyCty24A57TIZ?=
 =?us-ascii?Q?k85eMjhD2MG2Lct7LIOGErfOdgtMsxzyEWH3eCyHfOh2AAMTNx41hlw48a9t?=
 =?us-ascii?Q?0xObGMatk9thHcMJgf+8Kv6guGH2NAisVRHvE1m68iURwSAm3YwbUJcOCxs7?=
 =?us-ascii?Q?hsuy7ZyGl1UizBuDQ9Mzgc5CyC7YCRVDa7pPRd5DD2GAoqGeDqT3MIqNyWB6?=
 =?us-ascii?Q?mGTvKP2dHARRs8tsXh7vku/qdGA1MPwkRdoa+rUMIT90Pf9wV+SQYAHJIdaj?=
 =?us-ascii?Q?V7No4Y7/fhX2x2+V2T6TW5lMH7PITH7sl0BwX10SjjqYMoMDhwOic4CHkqKR?=
 =?us-ascii?Q?5noYzmnEu9iZmQXz43dZdkLt6mR8gyoOFwUQiKO/qcRAhjWlkwkSN55TbaD8?=
 =?us-ascii?Q?vMmJ6RSoIfeg3DAZtRaxCKCshXpzKyq4FTZpDJjLJNZtxQKOHLoc1fa3Aggt?=
 =?us-ascii?Q?argqPcdunQcKolloFIpoUUxWl4lm/TKlnfzK+7iaL8i02ex+/FLybaDNAjF6?=
 =?us-ascii?Q?+0HRE+JgQAOMb3DMhpEDtXITDBA9x+wUU/fHspF/SgWbfSqcHfwrOFG89okn?=
 =?us-ascii?Q?+Ql7Kp44GB2yTzeHBZtrASxrQmwy+kx4hwkjHH9RCpYrwujILfsd4EfOqahG?=
 =?us-ascii?Q?Gl6E0IG3LF41TjBe9EuEo3Iqyo5+NAfM9NLPhOqTYt2mATmStDqwIrvNK/ap?=
 =?us-ascii?Q?KcRVcvS9SO5Q8yF5VWdHisrYUKh4YncLjuFTr1RSYWimewtZvm6zVsjm52TV?=
 =?us-ascii?Q?rsK/hbCcgSLfUJuz2MR0TohQDtb1Xjbe+40ayME17aVQOsF+20+g02A+2Xic?=
 =?us-ascii?Q?8+VTh+beLcOpRayGMkMQO24EddYC8+x1vGbv4JoTpqU09lSI5sbnaRK+6D/L?=
 =?us-ascii?Q?iAiUYF83uj+igkF0oYSJU6+H?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cFlOt4Bhchf/U800McpbnN6onlXvTWodcdnbn68aT/SCuzoHLQjcbMVqYTGK?=
 =?us-ascii?Q?6Hbw0CRY3GwWV+O9ONJGNL6wdieY5dLDfGXVJJpKT/oPUsw65JgSj5KEgbt8?=
 =?us-ascii?Q?9bbvhNyg/2YwoEj2pB55ii3giX5CcCd3thWi3UfDsy4T4ZtsoOfXhxC0Fhuf?=
 =?us-ascii?Q?eKqA7WRzWn7zC0kyNXehZnAUzTaJbAvKapiN5t+iqDWeQ9yYrJPW6J0D8U08?=
 =?us-ascii?Q?FLfPjRfEdWhJkwdm1eTaPgWfZj8/7BN61H4x/xXaa+K6F7Djqg/phIN0C67N?=
 =?us-ascii?Q?a7hTCjbte9nNDirnJcuH6mXqecoG7ezXB+BKU3E1C0p3lFxNksyWdXRZRJ+q?=
 =?us-ascii?Q?YTqjC7+Ss2L2fsnRB+VZDaOgivsftcvNhnhn1odoVErL1PzeByIbU7i/tfyf?=
 =?us-ascii?Q?AXJkzjU9XP3F93U8d7dn2Xj+UW61u0iebprM3/LaSoE/c/FVpPltMVwig+33?=
 =?us-ascii?Q?q9uj3aLpTkyyUVYAHhhiBBoTIi8WkUZ6UlnrQQfvFewrCNmft0CvBzaFCUZx?=
 =?us-ascii?Q?qx2HZkFRxiNfXkrdcNFVhG/DNi5jVc25u/VYSQURFf9zZoEOjQigQYwlJXlJ?=
 =?us-ascii?Q?3VGGqWHGD4IpAwn8uFExcWscD1jjZXOF0syRlmvdtLfm+AC69F2c6NZTa/kA?=
 =?us-ascii?Q?rKdjxrLv8DkK+FNDBKAIVbMNsRO4l4D8gxorCpU7EdlWIr5ab/SZetrqZHfP?=
 =?us-ascii?Q?/cToK8WiRKfF8qz5Dnkt6VPaGGqMrRR5FWlqb8U6SHF981EQukKnrBvYJhcn?=
 =?us-ascii?Q?5b6c/fiew1QvGG04qx1O0nti9rg1RZcvvzYHFhrJ+ukHQjPk/whoR5lGOxGM?=
 =?us-ascii?Q?iyDfp+jpkr27M7rRZ6c+yE0Ql/V07BNel7N7nxbyGjG0veafNj53j1vyZlht?=
 =?us-ascii?Q?Q/xjGEMbhleR+LVSmnbFCCBUo0za0zG+WAv2S/OL0L+6UFGBO2BRjbaBmw64?=
 =?us-ascii?Q?Bqyj3ydRp9mSIeyf838E+3F7ku8iMGJTaXXtZoFlKYeMFR0C6YV3p82UJx0m?=
 =?us-ascii?Q?hosYYtH0JeqOXULBiM1ADxiXqd7D5yRDgmq5lLYNDC5qy/cYpufstnXLwy/F?=
 =?us-ascii?Q?ICXywZX3N++P7ytcPMKuL8PYYTBaivWnzyDdWx1nyslOv6+YuNaHvq3GTbCM?=
 =?us-ascii?Q?GFopx9U1ruI6xQYOBzp3i39vLel3fPkOEJrp/jnalOa0e325tVXGTdUkNe1c?=
 =?us-ascii?Q?WVaMW+eCAFsNIXjRO0wPLJjhddXEALFfCTo6eV4Jy0vUwHSvKTb3aSDKtTAX?=
 =?us-ascii?Q?GkZ/1+asE4Ws+S9tzkgEIcgK7N/u7C4145fCdekleV5+/cdsIRWpIBg58xYQ?=
 =?us-ascii?Q?7RD5rILrogTljWcFHUZb7MZtBrdyKBwibi2ZGEqvMJN1fmxOGcYHCtYEZf57?=
 =?us-ascii?Q?PARPpqaKabwArh1vxecLzlwTNOpwpYGLfouZ2RnZLHXqCDdL9lvWhDAaM1RO?=
 =?us-ascii?Q?XxoItjHmhkW/euzk5v886xsHYk2Liv7iF9IXubB50fZQ4/9pIYgA+lV6Jt+l?=
 =?us-ascii?Q?ptNnEHSPSPu6RbYgBLEvErr0FPVhAhyk9dlBVrhqlgQ+UmjAhkeSMUbuUskj?=
 =?us-ascii?Q?ZlXkYB5FVoXrnwmGVEqf0WzbHyTdGnW+LBMmFIPS1o4L2DLgbBOYkyzCqoFk?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	R3ZIXuHN7wnH1TYAK7kuYizRLTEXeLVMKuwpOKGBVUvsif84rjUUgXkFT1KvTGUHRiq013BxH2Z6G49ntRdt6yhEPLDVK1VHFATALisC1fhwnRBw2XirzV9hL6h23FebP75AjatrNVtiU6+ZXrr1wl8NLJTYS39jKMP9POJrFJssreFFZxP298GC1+snQVEMguROXasItWmC0XM7HyGx+La8RFgeEQHxodDG1X59KHrPWSE2EQiioVIeCVazxTYyYUB5ZnAn4wMMRgPIvVmEtCAj/ZOmK2T3lRKo3Yz+pfvxoT8ihVRq7OC4KeY1qnu0i+wHPAmqVbjVBo5xlaLroC99QtY3bJjUBnDca4MXimUuH6jhydJ+obJ4SC7fHSxsjhka93SkwteWuqrF231bgPt3AbwJ3SsQjHRWTMZR5lrTipfZgM3pBz7tepNxWvaZgH1FUexLD7dXQhUmD7Sib4ddRh/pEAIo/SKQtgq0LNESo3SR5ISS1EXf9JTniVG35UCUDQNYjScx8jLV5eF8RyJ48arBqxqEtyVyjp4qGApiJrCLHeze07d7snNXcFSmmYFy0Pk6oCvN5M/jAtKS3ICJMzk6o0P/odNaV4gZRzg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b91bf71d-8316-4362-8618-08dcf83d19e0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 17:14:09.1899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xgwx8O16ZN89pI5nVn7OLtHE/eNnrm8pDjS8cLUxFq2hTG1qz318GrlaqUJf6zGLgNW4iHvoudtV37eFXQl/eQ1/g+5xADHIqwCynRFPcws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5604
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-29_12,2024-10-29_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410290131
X-Proofpoint-GUID: PVs7jxPNl-XVLWU0SGqWguX6o4rGYRUu
X-Proofpoint-ORIG-GUID: PVs7jxPNl-XVLWU0SGqWguX6o4rGYRUu

On Thu, Oct 17, 2024 at 07:00:05PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> This test was relying on a trigger that uses the obsolete
> dt_test, even though dt_test is irrelevant to the test.
> 
> Use a different trigger.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/probes/tst.probestar.d | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/test/unittest/probes/tst.probestar.d b/test/unittest/probes/tst.probestar.d
> index dad7741e4..1f433d900 100644
> --- a/test/unittest/probes/tst.probestar.d
> +++ b/test/unittest/probes/tst.probestar.d
> @@ -1,11 +1,10 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2011, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2011, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> -/* @@xfail: dtv2 */
> -/* @@trigger: testprobe */
> +/* @@trigger: readwholedir */
>  
>  /*
>   * ASSERTION:
> @@ -13,10 +12,8 @@
>   * Call matching probe clauses with given name using "*"
>   *
>   * SECTION: Program Structure/Probe Clauses and Declarations
> - *
>   */
>  
> -
>  #pragma D option quiet
>  
>  int i;
> -- 
> 2.43.5
> 
