Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807591531C4
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 02:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729824631; cv=fail; b=bTcV+KbjCEdUSxw+nqk5/Dcr1BMGYkDmPLrzmoePN1vbHSXiGEythSQ8tgi2HmyjaLqQWV60/5Fo8l5YFLUPemJ7BSmWPFDI1UMRhR0lejYTSSTI1tZsz9C7CwHAq7IA81x0aqRKFmlAIxcsg95uvEHLy9yjgm8RwZqfzu9fNrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729824631; c=relaxed/simple;
	bh=GCjgk4fy1rk2RqUkMFZ9Sr56VCnxo1RtqTgtQ0rn7tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=T9VL+Bryz225amg790ppIkX2FcxzsfrbB9+UQw5DaUtOnTEfX7AGzs28VMpBtGI765aPAukZjC2yhSrNcvidmSh8gVTr7CAqDNADb8Q4CZCB509XB1xmRTUf84SipqL22pnZR2+QEa3usM90iJxs9xhYiJDwq7PHtumIi2YfaIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ggiIcofu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QJWURBMr; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ggiIcofu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QJWURBMr"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P2hTxO024550;
	Fri, 25 Oct 2024 02:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=lMSusNSoFKCOcTMTFo
	YfmtD+WgI1j13tmlm+vM/fTBY=; b=ggiIcofu5U9MP8AGKNTSd/1bd35JJHTqxj
	rgGC8YXjrjA6Ibe4QJ705JRhhyIzhiv0JmbJcyyhZ/liGsi8pRmhlQxfLA3pnpsB
	dN4YrKgUqKnPZLM88q4Smov5JBrCES6ZEohTlUxsh6l4ZyODr3pkX3djKNXBgnig
	SkN+iubNbEwHAfFl2eMOGeZD7NUcGuHzd15nlVeB+3KPvIX8fH3ZsUTdN2uFVqdI
	aj5/BtRYRnNGQMHFZjbYklboIZYYv19bPQ6lJ7M92qcLjULSA7zXg6bNX4dKpOvR
	XJpwVM+eWlcPj+zkpbiTcbAd7kzeuPflsUxg2rcPh6k7/bsHTziw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42ckkr39wq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 02:50:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49P0c2du018552;
	Fri, 25 Oct 2024 02:50:26 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emhmu4d0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 02:50:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mILp5QD05cLS5J332Wi2HcYuyIXZPBOo7NdhPRQglYId1kAHDvFMsmANyeMUjMmegSPcfH3iPo/pFaATc8VtGoTA4oE+ONvfV8aBQqvt8/05HpzFoH+TXh1n491m5XUv3QyeHEUkSbSCd/Q6P+aZUqQpKdZIlW8Cuhx+3dqIRlZee+Q6m6fCylLKaepY4xJ4GnA3bC8exKbbkLWqGVf070bYeVbjnPTDwnTRvReTPJ8RU82uh6aB8/c/FZgxfcFo+ZWdmCE3bVEt4TbSpzh6YCIbo9XFgzN4n6+S1dlfWdyQHha3R6l382LfAiTlG3AljDi/HoOHdgcc7z0Bu+ZLng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMSusNSoFKCOcTMTFoYfmtD+WgI1j13tmlm+vM/fTBY=;
 b=UGvc2eOV1+YLnFD35Gl6euSvqPTXxjIKVa71Xll93qZ+TFGMAoRtwcFHaaAUwND6g/oov6ll9kBiRew1LBNTtHSO9PMIl0XkNVmzvxZhgLrWMG3rfPSHRI4TXxAXQ7rbLIjNJQfpxQHCOWlEM65dU613bLldxAuWP8XZoLdgieiLF2mtjUKxuFjyILU0bWNQeAMFhzyUqiCac22TlfNASo37BSF39QChBmZZ/xtihvJSilIEji6AwK9i5FAmotDz6ia3cq5rjAjxE6P/ZycEZCDOu5qhYEhvDod67WsAFXuAKcTULpuSXQHlZo8wD3nZ0XEXWAtMfh9bljWC2LEbLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMSusNSoFKCOcTMTFoYfmtD+WgI1j13tmlm+vM/fTBY=;
 b=QJWURBMrlty87EVBkrdt/KC3ooSG9xaj4dAZfcSWy7XnxgMwBTlwc1RblZTcOrKnTmQHkY2RGtegAisGSNp0NJ8T1yDd2G6jp4/j9EEw30msCYNQaVOHR1zz3rMBTpXFZ0fp1LHjLjZ0JBQpPow6e71eJBEv9yxxLnsPzun6t7k=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by IA0PR10MB7135.namprd10.prod.outlook.com (2603:10b6:208:401::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Fri, 25 Oct
 2024 02:50:23 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 02:50:23 +0000
Date: Thu, 24 Oct 2024 22:50:19 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com, sam@gentoo.org
Subject: Re: [PATCH 09/14] man: drop blank lines
Message-ID: <ZxsHa6XRUNxrpm-T@kvh-deb-bpf.us.oracle.com>
References: <20241024113758.182050-1-nick.alcock@oracle.com>
 <20241024113758.182050-10-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024113758.182050-10-nick.alcock@oracle.com>
X-ClientProxiedBy: MN2PR15CA0008.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::21) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|IA0PR10MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: ffc71486-739a-4705-f986-08dcf49fc5e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RpseSDEDDUk8wBE1faYEBe3DBPx8Bxl96N5paSfYODsoYJmAGj+4PPdt5OEP?=
 =?us-ascii?Q?nAKV52awAqtrqQndDf0bSeSDKHeIx2tHF+5HdvYC0rU+AqL9LVdYykcUfERn?=
 =?us-ascii?Q?q88QejVqyXQmRUAJvL38sIQNKBofsGxCVb6xe/u1rGnf4BhbionA+0OwyupV?=
 =?us-ascii?Q?giyxEuHY0awv/LlZ1iiXWz90L9kLLcqNfWRexLlTdbiUxw5Q1OcpCg/Bm/5N?=
 =?us-ascii?Q?SdxUxhrzakcUjRCg3XuLvIQwJfHNF+N3gx4WlDflOJQI93Tz//d7vV56ElSA?=
 =?us-ascii?Q?48czqR65YQ0xBt20bbRTMnZJYADjkGvhb/aRYLRF2X7Eka0vGMR1VI6+sXFK?=
 =?us-ascii?Q?rSDnpWlk5z9F/DWyRxRjk1RE1KYZ1Hdt07XT+2kxrWlDjCy7sYvQondWLbdk?=
 =?us-ascii?Q?rCbPSKe/ehAz8jvpFJ01gcBydm/9TXT3S2awkiVqj+Yj+rXWsLusti50VhkU?=
 =?us-ascii?Q?XIvAnoC7upxKB7MsXj6NgcVHkDzqXCaNb/nPkkFayhE9qYDps0Pe8l6OqaMw?=
 =?us-ascii?Q?uvV6DEATE/oiGRLYHyonWO+ORwPatI9nMxhN41P+OtwNTe01ZBbEnVOOGIMv?=
 =?us-ascii?Q?D1Cy8t2VbdBQMbq3W6eRzmizqBHqFJt4YZ5icqp7x/3kyu25bDoUFoQBuUJi?=
 =?us-ascii?Q?oqENAi/fazOXn2vX5Lcb5p+Hd4Gjy/wmbVKQmbstH+xW5KNYaej6VHP5efEO?=
 =?us-ascii?Q?+H68ViVHTdyXl1XqVbnc/mbX4P3QbS+qHEeUJGLjEFSveCzfMAI4nsNLFq7w?=
 =?us-ascii?Q?dl+F2cAKvuA6g5XkKSX573kqp3HzD5pTWs5Vd6SF1zugCu5D2+2rucHvnxEG?=
 =?us-ascii?Q?p4CkakTSprE5Pd97lS7KGdCx+T5kYtxd9CYa1T21JpLyNljwvDymbVruBht9?=
 =?us-ascii?Q?RjsuG4vcNBYIbjTW8BIF5+YugGeWoGTUYuzzFXhUNIgEDvgQlF6EgN5NSwgC?=
 =?us-ascii?Q?2h96rsmd0/o/P5Z6AMKnpfchmgzE5pBYRxt8NKXjnv+msZPiw1ZftG2/gBQl?=
 =?us-ascii?Q?YrajZtrQueUk4+u6oJwpfJQrYSMFsgREOvcFn5wNNZdwIooVqpAbQLU4MrqF?=
 =?us-ascii?Q?9573T5u+Lw+OT/nBsYVOEEUZjHpJD/eppRth9uRhMN0MBDKdThT6SXn7v1Sd?=
 =?us-ascii?Q?t26wgzmkjzmKul4z+abT4p/9JqJV/vjS1wcxsqCc3KP7ez+6crEVnxR7IkrK?=
 =?us-ascii?Q?0kMn2H4SaYDyu/TonECpU6tRaXsAEGhQ62PQmQtHX+RvTrywvfw+zzxNiIfm?=
 =?us-ascii?Q?ZXu67vP/M34t9bnmMPwiirM9nNjLwTTJelWyxXRlJbv3ZV3Pm9t6ZMxfdOBf?=
 =?us-ascii?Q?ipy3EV+yY046H0efR5LCV2gU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BMIcMG3W6fosCl9NZhtS6XgXiv2dJUIP/rHQN9PXFCcUObglxHd5EQDLMkTC?=
 =?us-ascii?Q?pDeIpDK+PBQb5z0cnPPYpVX/tyYuAtLwTsq+Zf/OaFhqIa7VOQfzdy/whwC6?=
 =?us-ascii?Q?ql80N2vU8/WVqdRxOY2ygjG3FTWdf1T5SOxtjanO3mW3okurjX++Z8SKOZKJ?=
 =?us-ascii?Q?QLil3kGiXt36fgIfRlZ9sw1jOm3YYPWzU972k2BkGpF7vAcoW9cJZcwMzfkQ?=
 =?us-ascii?Q?+LVp+5lauNNKDQIz4NzVMVoOP9+t1j3ZYji63U9No/g3BrCYQXDYc0VrjueF?=
 =?us-ascii?Q?6g2a24wcJtH/RMSm35bJKyoCi1MPQQPW2HI1r0+NLg9FFXpG19v7GlLq/WMI?=
 =?us-ascii?Q?fMEduvWibnDrYQiAviOE/25VaHiTtLj+Pzz2dHJk5PM3YTyJXHVsT9mcxTva?=
 =?us-ascii?Q?vgIvMOlE73SQU1zH8cSmK6YkWs/jXf2zicSg6niU1HuMZxCg8WBByHwv4mnC?=
 =?us-ascii?Q?6xHk0C7byIbAKAnF6lFXPCvHeMXp42u1nH/mhNaAaih1UWvNU1M2JGG5SSv5?=
 =?us-ascii?Q?vrGnUEYGbaCHgUO/jUHoojGYCcYSxl0HpixIouh6Kd0Pm7UgyBQea6Mwp2KW?=
 =?us-ascii?Q?qllfONO/eecBvMZsFiqmkXpyJgUOyOrQic+/sO2xx5JjQ9b2gXFv7y3Kdgxi?=
 =?us-ascii?Q?qqbKLwpN7pXmzbMz+FNgqNOFxcLHx10mY8Cemc1tn06uPVq2jIFIVcAOpjyv?=
 =?us-ascii?Q?oxwKsv2RjWlpdTmrv4YSTVkngBnqtx+S7xV3gc0iQQlQ9NlmavHAjEigcOks?=
 =?us-ascii?Q?qMrQDlzqXHmGNRspKqeY3bF7NS3FlEvhltGGRhl2FwDovb/AuMf9RWaaV4fL?=
 =?us-ascii?Q?znFHwJnjbQb3SESKb/MtMkscOyMvrxowlQVT+1RWpeKuxz0OZioZm2Tb+5wQ?=
 =?us-ascii?Q?FdBRsZApxKvtS/uWIC9b6dy3PaAAHCYE6Qdx4sPHhJKcF2MxY/eUS79m41V2?=
 =?us-ascii?Q?oubiCIUZetCeodpmKpJZ46EFyL2F0C+MceyTr0l857G9dK0232mzD3hjnGKY?=
 =?us-ascii?Q?Hvh8IVL3n36BfJUi+Gqywf4jIBCi0OpdsE/1zPUpI+QFJU0p25sz87QI5oxQ?=
 =?us-ascii?Q?ahAUy9Ex4HVE5czq33FDo9PgvSoXX/ZX7x72EmmhVluB0KOEfdAXqDzF6kTI?=
 =?us-ascii?Q?7o9VqXhdFOjPwULkYxHEJRrKSMItfYaxOWEgMqOk8nS63/Pcksjt+7eNmnNQ?=
 =?us-ascii?Q?g329GrH8F1SKMDE/JnbLGdKgUP1QdeGF6EWQfGd/EVQ/QK3gYoH6JRMmc915?=
 =?us-ascii?Q?S5bpxa9k6JE85dy6TXBI3HiLkwxYzpWFxu9KKfImB3S00LfDbqZV2keOrShu?=
 =?us-ascii?Q?wnfCQuk54/qH3ZkNwCJcn0vRXYmi4eV23Wx2Ks3/23zNnlEzg020YDxMCyH7?=
 =?us-ascii?Q?VhgjgSgVmxBrKBb/liC1mGtcjT/eiaa36RibL1hdR2pfbVLUqwreYCnM2bqn?=
 =?us-ascii?Q?1XTGqXrO8i0rRIRPQDO1bdUgbak5foeghw5DhY+mxnUXXgyRKukXbXb0lQzh?=
 =?us-ascii?Q?WJAqci6zAxTekU9u8lLXTltc0iGo9zn50ZbgRXRWXIn6FvUNeO4RKxVHQxr8?=
 =?us-ascii?Q?jDwKQJ6ga7fuH+GrU0X5oV4CQmAfUQ8WLppDNoUyFgW/XRQoIKRDgxreWNT3?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	r+kX/MWYFwoBpoOvAVxjsd3KvjgsjM31kB2dlgji+eTnlVpTtcGX75E3D3S1OSw3sZ0nB3TgfLlBNLZbxdCDapaQBNNFlX8VFsuSlK387Zi1qfzyoPxhEVQ55Wr25N/QhFCOrIagqLnJx6vTEUszE46XV9l5eK3bENsdfM5KVaE/vMTJXZEIl/HvXImu1MPDzo6IVA0mfzLNnZjCXJoyUnZOtCbSjQ5SVRXXEJfdMJu0hi2506N3JvRqcbUYSxmYduL3tukWp6ta8hjJhZORnCxLesPdeWIGf3wdvUsyu6svWrz/76pxzSoMtIVgPuTDMZd6mvRImV/PJ2f/PdLPLNG5lA0gSqoJtjbiuRrBjLgSnRoFUElrcU62sqb+AmyuRD72FRTcvkxGVsg3dJbBbUKXYGKuPN/gLpkeyi9isgvpzGBj1VBJfJBluxM31+tD2XXuCUMZnqizowMivhsrOR+Uovelk3uBqos8IhHpx1xxvaR2/AKqjBdIl/I7S5WL8JoB4pR5fCOiIw9V5qo9vnsCJG9TfB9xGee1Fxl56NtVWVLuNIGvnsdSG8kXowtKUH+E+rVqQecHU5BMnAzL/WU7/u1LfXb31/twxJgcZ5U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffc71486-739a-4705-f986-08dcf49fc5e1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 02:50:23.7507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IOw3hKpQp+8YOdO84siIW+hTIfhrmDGQp6dsWc8btzON8CnpUIgTXb4dX/SeGfYV73MnULBk0YaqRzWcLmITUTxYCYnEvftmYnQkEEDlCj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7135
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_02,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410250019
X-Proofpoint-GUID: l-Ur6BTcK18cKq4ehqIRIGiUiR7EhvrO
X-Proofpoint-ORIG-GUID: l-Ur6BTcK18cKq4ehqIRIGiUiR7EhvrO

On Thu, Oct 24, 2024 at 12:37:53PM +0100, Nick Alcock wrote:
> They don't do what you might expect in troff: a leading . is preferable.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  cmd/dtrace.8 | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
> index a53632949e72..0639db2136a7 100644
> --- a/cmd/dtrace.8
> +++ b/cmd/dtrace.8
> @@ -179,15 +179,15 @@ Print libdtrace debugging output on standard error.
>  Print CTF type library debugging output on standard error.
>  .IP DTRACE_OPT_*
>  Set a given DTrace option.
> -
> +.
>  Options set this way are overridden both by options specified via \fB\-x\fR on the command line, and by \fBsetopt\fR statements.
> -
> +.
>  .SH SEE ALSO
>  .BR cpp (1),
>  .BR ssh (1)
>  .LP
>  .I Oracle Linux DTrace Guide
> -
> +.
>  .SH USAGE
>  .LP
>  When using the \fB\-p\fR flag, \fBdtrace\fR stops the target processes while it is inspecting them and reporting results. A process can do nothing while it is stopped. This means that, if, for example, the X server is inspected by \fBdtrace\fR running in a window under the X server's control, the whole window system can become deadlocked, because the \fBdtrace\fR tool would be attempting to display its results to a window that cannot be refreshed. In such a case, logging in from another system using \fBssh\fR(1) and killing the offending \fBdtrace\fR tool clears the deadlock.
> -- 
> 2.46.0.278.g36e3a12567
> 
