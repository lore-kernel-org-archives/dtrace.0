Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9000D126C00
	for <dtrace@lists.linux.dev>; Sat, 12 Oct 2024 04:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728706326; cv=fail; b=smJ9kC2O9aesBc01G6Y7WA9oPrc+kY+j+yQ24x+Bma+Bp3OU0dM/FR+PEcYe6TnnNQOM3RjlwpdWZTLrtp+6rrQ30dWiATxdi3wB8HcqK7IIuLtAF6kyYq8cvWsGw7MdcAzY8fETvULna99MXXQ6p5YjwkuybPoIZuws7iBce1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728706326; c=relaxed/simple;
	bh=YNa5CM0wRIDRf3UhwL/MAg1P7qI5tgAVj9Wv0ODzwUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ui+uIYrDSW3KtwrouvRCcBIvHUJsaLGKlL65JJ6hOIk6sa5n/zjFgI43lVd7AIsBMB7uBnVwZGX11SbFtTdfdokAhfaD0BN3gm+YmwoxXSSO+nu3oApO0oUGAGDd3ZCvv/lS5lX4D1Wwi0dmpyU6k9ONVk4VLKrKysif+dtpFtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NYLkzCaP; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=V3fy6ZZj reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NYLkzCaP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="V3fy6ZZj"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49C3D7I1014933
	for <dtrace@lists.linux.dev>; Sat, 12 Oct 2024 04:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=wKWQ4RZrN7XIMjdvvsOUt0LXfaaXA60JQWl8DEdff/w=; b=
	NYLkzCaPzuV3gbAIR90xYygXcB/Cm0mpgdC2mbfMjzD+HpF0TnDregvi2jZjWMHB
	AJZuraSIi7nKLLNdB6RSFZ7Io0jJgLTsnpHbUsFHnmhIUFZML0xgBh3hpGFLYL9D
	y4VbikhYOXcxeVSHvuTIEWonfNmNV4zNO0bsV+W/R0a4lCJZ6LbjX7NmGarX6lqp
	V4BG4NGNXfE/kMWbx13YxMUCXQb5CcydnQfr91sh9mlshonqA6me88huEhday50O
	y/Yf71xF1FoMIoVysaJ5HtFjkBqtEXKogw/ZUdp4GF5I+q/WMujmECeYJSZPE3O/
	oORrirOkyAYQdsf2ZC4bAw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427h0980t8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 12 Oct 2024 04:12:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49C1XbYc026728
	for <dtrace@lists.linux.dev>; Sat, 12 Oct 2024 04:12:02 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjat8ex-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 12 Oct 2024 04:12:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHqgNrlEpbspTbsnZO3ag1TorUFiyvCa29NZce0OYFFF1piI0IjNx8Z78Vyb5ww8KBowjdVrSgs/a/W3vtryLmiWAiCij20mcKUHgt+OTuNmTjG34G0UWtt8nIxOn0QRNIH3w9aQ1ynBQX8c3p2EdeM0zKmFYVhH2eEzIg97XYP0PdWxWTA0rFJJRTfdexoWXHvv6xdnelemuDSF+h+t3nRM9Agoi18y7SB6jbz0FbcvzQSEhfqN+hvQxBUzNLdwBh+v8YZtdXJGix0Ov6jn2BxQ6e5QZwUmq3X7qtzfRUaFSMTd0XPXXTBv9lyYkRrn9M5sJQF+UiWhj6xWLp/4zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8ccokuoL/ZQSWzD8HrDHIXTyHRzPVfNEuLY3vjg2EU=;
 b=aDvl/5OKHhAE9u940p2M3uiq4KI2kG47JqDl5bqPZQXvFV0qdSl4jYgIqlrGZiJ/+4AKb0w7d5wmgcfHjerC2mmei4GIGyJwxdIRGLmmFlHj2a4v5GVk+zhOd/wt60Ah1MQqh6hroOC6kvjgTcJxFKsyWi5pCTYrUmA3oEOXhzkRUmU4a8s5F2FcIiAPbZDvu4WVCqshLcFsjn0Qjo0FSPMiGWvKa03k6gXalXzXeR6IZ1IuDO73Y5psheT8EHr+APlRjE50D1oiL7b2T3o+YGkolIuejhbqCqwWt65aV+z/x0NpRTRSis0lkIdMKIyKiZHEUlUX727rnrH0zRTJ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8ccokuoL/ZQSWzD8HrDHIXTyHRzPVfNEuLY3vjg2EU=;
 b=V3fy6ZZjntiJuXmT7WerkN8ouBYN8JvANR4dSYGCcECAum2s1IIj6vK1t9gfh6HvDiC1PVNQuyKINnDre/4gXjgA9UujSYFOHi06SXjyigLiruzFgq5/z3mNPqODv9YyZeGuyng52SZqK25QGXlkBDHOkMcYxQlRtsFUzMOBLR0=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DM6PR10MB4300.namprd10.prod.outlook.com (2603:10b6:5:221::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.21; Sat, 12 Oct
 2024 04:11:59 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8048.018; Sat, 12 Oct 2024
 04:11:59 +0000
Date: Sat, 12 Oct 2024 00:11:55 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v5 07/19] Create the BPF usdt_names and
 usdt_prids maps
Message-ID: <Zwn3C8AeutHoi7hz@oracle.com>
References: <20241009054535.28199-1-eugene.loh@oracle.com>
 <ZwdeK90de5dmBFT4@oracle.com>
 <44ae36fb-9065-d761-5571-d1d2657e5ce0@oracle.com>
 <Zwm6lBLQGeFQS2Mu@oracle.com>
 <890f24d7-aaa6-c957-97f4-e15954eed54e@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <890f24d7-aaa6-c957-97f4-e15954eed54e@oracle.com>
X-ClientProxiedBy: SJ0PR13CA0042.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::17) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DM6PR10MB4300:EE_
X-MS-Office365-Filtering-Correlation-Id: 686d10bd-d708-4d95-7f3b-08dcea740443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?YzatT4FlAGY9sNhKZfQsMPBcBIGFBtWzGHsBJ5ep/JlFzSd+zdT61ekg94?=
 =?iso-8859-1?Q?x2u1B2FqM7B/+QocsO8sSzLKfU6EYawdmvCH2BVN3mY9L5GX7e6xBTNwt5?=
 =?iso-8859-1?Q?pIqhRG7rorpq01aD3PzmeA/vRS8oxcqw/sOZSG5rpru9CRMABE22zTIAOZ?=
 =?iso-8859-1?Q?OUCfGIeoCxjfsQsNgRnf24FMHRiuFpnqnXGrd3rh29e2ss8a4Cgsgd3vjX?=
 =?iso-8859-1?Q?XSTeUoFsoJuXqviQQXxnrOOqhKj81jiB/XJ8kfrT7t8+77+i2CbnpCACQz?=
 =?iso-8859-1?Q?0tQ6YNcp6pluMzMAGyCV0cQh3bLnZgoy+Htx/V8qmwrXiBnvItUHP+NpZi?=
 =?iso-8859-1?Q?52z2OHkja4lcCwnXc8rhutOZ4O4W9AfNGaYUJQk3E3aEKgTf7/3/sQ5EAh?=
 =?iso-8859-1?Q?XSxxTqaEaQHI7+lXOObPPVkCgF+pe2i1BXV0LUwRihzYUyRzj+guLKlLXZ?=
 =?iso-8859-1?Q?WKqRQU4JSHTipUA3PzvkBfv72kaBPjUSD3FiMm7M/PzcW6sm9mcMOZgDox?=
 =?iso-8859-1?Q?KtDKNe/RWzkerfY6tkHXc8A2hfdg6DQOOpFQcNnwP+AAEQT6vJ+lPsc0s9?=
 =?iso-8859-1?Q?X7CpgzEc/Ij1gJTkBA6bo+AM+k6woQHoVQOjjC6Iev8rSiqgL+dvofWoCR?=
 =?iso-8859-1?Q?zvaWaSLWAmD18U2nAXE4+9BPyTq27fmhhljpuOYXz+o36DKY38p6N9zHod?=
 =?iso-8859-1?Q?TA/7gfoYJvO38LigXDGVhVSO4bUgxDt6G5lTFykUu7epPfgBPLwTPQP8aC?=
 =?iso-8859-1?Q?BISlXWuaE5hz3cIGav3BGe0jAG1DLIaYtOk15KM9PPHeWBVJv56hCUcjbo?=
 =?iso-8859-1?Q?Fr1kLFCqYEzreBMO/Up1Ls7+oPMebcHM2SqXYl0OaYT/43O/+W8qbM0eS3?=
 =?iso-8859-1?Q?Ih1weumGuiiwQQzlRUMJAg3kQJ9s/JFOMl9CmpPvxtQSQdvQf1mIR2gU4R?=
 =?iso-8859-1?Q?Lg/y2ErZH5elbuecYlrgRfPpOaPx5JJutwj/LdUitdzLMVLBgfO0Hpj90j?=
 =?iso-8859-1?Q?ccUzH7s9l4dHznkhEUa1jiVMvmirEQSi8AWEI0zNKP1N4Y9FscTwa+cu/V?=
 =?iso-8859-1?Q?YbhJ8NVvPfjAIR1A/rUJvxmm/daCv/7rRCIj0XQBdoewIESAXXyuSqw5Wk?=
 =?iso-8859-1?Q?23VRrf5vVNfCh0BAfrrq+5kVaWYfSKD6879dgHGDkKrfWgXprMqF0N77kV?=
 =?iso-8859-1?Q?J8pVvdHh75P5wJIZ9TkAETL5k8mIP6Sra0Cv8cDt3VsaCfYMt9VaiTeAjF?=
 =?iso-8859-1?Q?6uSkky86R3LbBILK9ZDkeIAA2WmdqkKB0I0KlxP1biqOusDtygm2KJhdgW?=
 =?iso-8859-1?Q?FBp2KniXGh2wcb3XayCE68TqCw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?I9uSUnozLv4mWlHJtnEVh6zvzP52sTt0r1MVMQgEgKzcqttkKE7F4YoqEF?=
 =?iso-8859-1?Q?HF/PGUp2Q5qC+GER1rXXr7ZGdhb4yjDsNSMs67oTj5+ANtmTwh+Vo3D+D3?=
 =?iso-8859-1?Q?V1+z0cYqrUh8KPK5oh4kI0SgIqpV8PVhJUjhJ/L+nmcPtGCy2P5BkExBVu?=
 =?iso-8859-1?Q?f3VpuaYS/eWJvFt365XDN0yiIsAKYLMLRz7lyC65ZfRR5Vs0LeCmdIem7j?=
 =?iso-8859-1?Q?5prRlt0F8xftP4/jVe2t5vvcZrf4136nUz0zjn5KXIntJKw1YE/OE98aiF?=
 =?iso-8859-1?Q?FFr2wAqDTd7oiZ4Nd+SZfK9gxK2zuhMjzcbTUvfrEmMQrpmD10aOewjasD?=
 =?iso-8859-1?Q?yFveTkFcUjvTh5He8Oa0NQab9msHikAgTCLIxVmywfPj3FWT96slPyPt8z?=
 =?iso-8859-1?Q?NzKYl2Xp1l8gUzCRUZZ1/g7X1Umgj9UZOQdjIigQigkuQ+nB8VH+XrzWFU?=
 =?iso-8859-1?Q?Ne6NIETnRLPYoUsV60QAqBdfhsqriInS+rn2XXpnRQ4JdvZMGtv/bTDYjT?=
 =?iso-8859-1?Q?y+97o/XvwIU/TRFor7TC4wyZYijQ9zI0PRwi8pwUawd1GtG5ZN1QUxy1Io?=
 =?iso-8859-1?Q?xSTkxIsiY208552Jw66IjemRg1Zd+UHWLGY3T0tAU7ZU0i0Ur1sVCVO8hd?=
 =?iso-8859-1?Q?RubW8/3NZmgfN7SYENQqa6rFMwNui6A4kW90I066lqrrCFjUIUqanXzN8S?=
 =?iso-8859-1?Q?Gwm5pbbSEbfsN/NbdDmUOr/ooIr5NaSwb2M4O9Pvxgwb7HFuiBLQey1Vyx?=
 =?iso-8859-1?Q?U7u9tKcx5bfqPkmuM+gc/ChE3pblXoB3ULQL4O82O5X8as3b/7Rff1aAH+?=
 =?iso-8859-1?Q?R8tfM5UWOXIeLGRW/3FpuQKSwsUmTuh/K5IwPWYDdPCUtDd5DT7uKcKaTS?=
 =?iso-8859-1?Q?i7S4k1ziMybk4FhCNgioP9+SlKd647j+ajhsBpJyXcIh867A7WAjVePgIE?=
 =?iso-8859-1?Q?ayePk+ozgNfLOozrKCJEZpJ4py+3aIdO2ab+SnNmYrMWI7gz8x2PgNxTXX?=
 =?iso-8859-1?Q?24JMu0KSV+Tbj9FU50tu2SL7CyHtGSNTp07fIzOZbjbM508DzQMoYh82Wv?=
 =?iso-8859-1?Q?4grCgu8F5xW1/B1d6JHFyynDk4RHR+kE0VYxVD5VjemtlUkKY+EzoZpbac?=
 =?iso-8859-1?Q?WGOF93FCf5kYYQ1Tq0GxLzBr0keH0zVwCYuxb30DpOUqz3/xfQfJKjevKU?=
 =?iso-8859-1?Q?O6jzO5Qdkoj5i2Xtwqgxvxd/q7ew0aCqfr9Pb3ibwI7QClqo0lCeh4IZw5?=
 =?iso-8859-1?Q?xES9/NxsmiA0JlXNLRPJASwHMUvhLHKG+tL0Lp7O9MaL2nsM/kvr0R6q6g?=
 =?iso-8859-1?Q?aQyBMg14Fo1k+JCRnZ7nNzxCuSVJ61f8pymP+1E0zW7LKXJRBIDMjhl41C?=
 =?iso-8859-1?Q?B9mz94N1CbeY6qVnPO6qodvYu177KNdUrNvzFFjmCb3ysUivdLrH9M5tcs?=
 =?iso-8859-1?Q?2iMXGpFH47FtYETofo3uwKYfDmFxrJipHXt32DUo4RJ2ZRPSv+vbPbqPEB?=
 =?iso-8859-1?Q?dqhcgJbCphvdSsPw0lmToi0VFtKAzVzkZIuC6z600/s78HcHXiu42f91eG?=
 =?iso-8859-1?Q?teytGOzR8dO4L6A0Bl3C9xpe+H21uqYA+v8dEWuHEea5Lfrg+89g5w0fSD?=
 =?iso-8859-1?Q?uQKo8u/uoqxDlVVYoteGk7V2kAMzzxkRcMPoEWxF5YbyusXxGM/jNBvw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Izt1ceXXblMukxoE4qYDCxn9gtIbeq7is9wTZTMI50b7zoCVZJmiv0E4KcHP/KPwI2t0Ac3sJvjOk7EoKr70haqKBJ1LwuLN4/ucbV+m1sz0oXMT8zwV0HK23j+KWjU3m6v+q8Hfn3RpLkdra8BvmFiPZSlPgKJQDg+MFlSJwT2sP8ipBDKpCmQXtdj/wWh7IxcfaSQraYeHRBid8b1X+YbF7lU01C8RDmG+A/M3fdTSLc06AG/fXTTco/WBC5mgPt1XcfxxvcpsUb7CnDXw/vQuXIihYlP0EP/zZsKcaBPGRz5ULGQcCJgM883l6hY2flUoSw1NoqTWZo+6RhMnnKXhIqzlWNsnIngXLaLO9KTbc7rAu8UjbhQZ6eeBmPsHZppBnQHhQlh2j3mswwTjyPUPmo6qi1X6xtw+41o729U8JSAp1axT4Fy3zMEiSLx1/PUXrnFfYotRNFZfI5TwWv6NJ0Pd29+LDJZPXLz3Ks56BSeC31iBxABsZueJG06xxoA5Q7G6d+HorIJlPzTkIJ7Qdyzvy1ehV/yFymNjtOwdmv3sCNyIisa6utdJkvvDX/ZiR6X0uoLNeOtTGr2JCywuTdWmWC9JkA4P6T03vzM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 686d10bd-d708-4d95-7f3b-08dcea740443
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 04:11:58.9709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: buc87ynVYZQZ8hyZNet4XYmJRsY8I4LqlQJ/T1S8RFd3KlvfoFPDu2loqWJu5X38cp0jlNTz0BiKJSdE9BGb4I1BeqytoANns1lda7b5cxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4300
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_23,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410120024
X-Proofpoint-GUID: xTIl9uQejrA1jzrgEvupvMd7YYxh16Dj
X-Proofpoint-ORIG-GUID: xTIl9uQejrA1jzrgEvupvMd7YYxh16Dj

On Sat, Oct 12, 2024 at 12:04:59AM -0400, Eugene Loh wrote:
> On 10/11/24 19:53, Kris Van Hees wrote:
> 
> > On Fri, Oct 11, 2024 at 06:56:16PM -0400, Eugene Loh via DTrace-devel wrote:
> > > On 10/10/24 00:55, Kris Van Hees wrote:
> > > > On Wed, Oct 09, 2024 at 01:45:34AM -0400, eugene.loh@oracle.com wrote:
> > > > > From: Eugene Loh <eugene.loh@oracle.com>
> > > > > +	if (dtp->dt_usdt_namesmap_fd == -1)
> > > > > +		return -1;
> > > > > +
> > > > > +	dtp->dt_usdt_pridsmap_fd = create_gmap(dtp, "usdt_prids", BPF_MAP_TYPE_HASH,
> > > > > +	    dtp->dt_usdt_pridsmap_ksz, dtp->dt_usdt_pridsmap_vsz,
> > > > > +	    dtp->dt_options[DTRACEOPT_NUSDTPROBES]);
> > > > empty line perhaps?0~
> > > Sorry, I don't understand this comment.
> > Similar to the previous assignment followed by a conditional, I think that it
> > would make sense to insert an empty line between the assignment and the
> > conditional.
> 
> Curious.  It seemed to me to be very common for us to assign something and
> then immediately (no blank line) check its validity. Just a quick sanity
> check (not using this file, which at this point I've touched extensively), I
> tried libdtrace/dt_bpf.c.  Indeed, lots of this practice, and you seemed to
> be the last person to touch those spots.  I like the close spacing, but
> don't care a whole lot; I just wanted to double check since the patch seems
> to follow common practice in this particular regard.

Ah, oops, ignore me.  That was a comment I originally wrote, then meant to
delete (note the odd characters following it in my original review email), but
clearly botched that.  And then when you asked about it, I interpreted my
comment rather than actually looking back at what code it was really refering
to.

My mistake - please ignore.  Sorry for the confusion.
