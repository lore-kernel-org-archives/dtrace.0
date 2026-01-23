Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C4D23E35F
	for <dtrace@lists.linux.dev>; Fri, 23 Jan 2026 19:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769195169; cv=fail; b=PiXOinNX0Zch/t4Y7caODPgX90aDngeJbxPQ0BMADa1SjKlqB+orVxSxCFhVSOoT2IVpwzD1GZI29EQcZoXTkKcEZIWJZ5uMIUAj7apOzJn6i/crmXH9cbts0STIKLUngi5tiEqF1TyZ7wX4tmSD6GODzdZ9KOkgP86rvKoW+/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769195169; c=relaxed/simple;
	bh=owdmi10EaZ7WlqLondrkdml5yx3QmBJ+lFv22JMebRE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=aXzsQvcz8HqOr6DPE3ieYDbujqC2lwtYS4XOUw4fs6L8BaM/wH6JEg/ps+SXCcZgCAV5QiawkuJkuFYMxKkG68NTD6fdZ8wAeJG64lGU+PCLQ+KUlhTaJtAWhyx7rG+3vHPiOV0b3XbJxStqN6s4sNGbgwyAJL4N5llf4aG6N5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LfMS+lsw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XZMcrDAZ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LfMS+lsw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XZMcrDAZ"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NFT8p41884670
	for <dtrace@lists.linux.dev>; Fri, 23 Jan 2026 19:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=quRw8FVkuj11qITGnP
	KzZnFnBXHB99p9o7Q099Gm7hY=; b=LfMS+lswZ2moG2ola6igX3tlxcTmJfmjCe
	aqZ5fLstf4gAfl5qhOBxHkqtRg+BO/Ir1Aa1YrXeN+gPW4Vyymxgx7p6Rp9T5gyY
	8MW1CJQP1vKRpTwOWs4EWvZAOP3QGXu8SFwnItvE+8B2jfGyBxv5KHtWe1LW/pVw
	L/9S9hzSoc1IQWu1DXd3FPT119Lsfxq+KIHIK2R+QvNXApNIiN0hV60t00MACoEC
	qkrccgU++3B/lZnXuzRJcudbKIKtAjKfFkn0ACwTHE21yxUnhS+ibnhOQPHuPLu5
	06CPfDkV/aEoqV1MYpkkr0AKZrtrNEHmi4MsrpjYQDEUh5hXe2lg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4br1b8jy46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 23 Jan 2026 19:06:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60NIbDOs037974
	for <dtrace@lists.linux.dev>; Fri, 23 Jan 2026 19:06:05 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012000.outbound.protection.outlook.com [52.101.48.0])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4buswce2ep-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 23 Jan 2026 19:06:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OpMG5vFJ00Tmh3lP9ZdTXbyC02Rq1RFQBwuZ6PNo+Gfl6EsGt9BoWoKSAQS8fkQ+q0wMt8fRrV+P/2aTrttAGLPLjHC0o+vX580cRrDNJFtzbfiPwF3YDe5lh05WjDF+piFiHiEf6PZhoq1axHtZp0DpbUhZ536DAS5JicgmqkwDNKWS+Ww9vNdkoDD2qj4f9JmGJZzAeDzPzwSWUNvQB4O8S7O3soq/x98aplKA2fHnGXhDALWyEUZCYIK8PojeUCHBavYVYzcu9fnf39TsXSJ9YtzRhy+C83TWaLKtZSp0thawyZF6etiMhNc0CwdhBKF0+oTJPlt6dD+1C50YBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=quRw8FVkuj11qITGnPKzZnFnBXHB99p9o7Q099Gm7hY=;
 b=Qla5+iSezYqJgZD7wqnjYIzCk2Y/Wia9HLz+xecP/u2EW7rC5WMP1byZdjqO3tHYtN+pb3hzonRhKP6vIGiMhIoVeFCpUWCpWs3Hd3VcGGFzZu5EttzpM5zwbgcMsxUZKnSvvHxb599rY/z1N/YyAxlbLQ/JFi1/zt+yGOW0tZ2VlQ8TJCKtv6lQ1zAy6DYGMQVY0y7DuNA98Jkrxx5AE6vud8VaFFScwTDiznHhE5vj1vXDXHzQyyjqqGij4rltbhfWHnmzhH0FtXTkxKnF4z1/1RT6cVgVfo0v7p62+hGSHhFEH13pXb4K9ru5RkrI1ZoY7p2qQMWbB2Sj6888Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quRw8FVkuj11qITGnPKzZnFnBXHB99p9o7Q099Gm7hY=;
 b=XZMcrDAZ8npI5+A/4CckTIPlEVrWAUZVV09sdKjh6D3Qgi70nwtm/NpR0c3tcjJP75TJOTPq2yimeNvdcLQ3NaDMUM/mracXC3dAhg5y9+X87/exjVzPhKlVozPF9EHSP0vISAO8uqmWFqTjupn/EMabZhkcSPJx+d7l2H7TNa4=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by PH7PR10MB5831.namprd10.prod.outlook.com
 (2603:10b6:510:132::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 19:06:01 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::afbe:3417:6b0a:43e]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::afbe:3417:6b0a:43e%7]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 19:06:01 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Change stack_skip to 3
References: <20260121235154.4600-1-eugene.loh@oracle.com>
Emacs: the road to Hell is paved with extensibility.
Date: Fri, 23 Jan 2026 19:05:57 +0000
In-Reply-To: <20260121235154.4600-1-eugene.loh@oracle.com> (eugene loh's
	message of "Wed, 21 Jan 2026 18:51:54 -0500")
Message-ID: <875x8s40a2.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0282.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::14) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|PH7PR10MB5831:EE_
X-MS-Office365-Filtering-Correlation-Id: 18c5f702-944a-44ed-957f-08de5ab272bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?teXQAJawgiR2zCNsFEGWjVL/dDn8pLSiNau3Fu92j25m4/MGNHmEkiDAjyBs?=
 =?us-ascii?Q?ojTqw3tbu0hjUnAzJw8l4Z7ilTCjvy2XRlUxzlmBfOxSBYXdHOGoZO0uaIE7?=
 =?us-ascii?Q?WpZ3GnwrF7AsBFGiowi9iLAhPguph33sbUlKHKzVhytv9Z54R5kjbADB2Qqf?=
 =?us-ascii?Q?Q7K6oVYg3I/SpEZI/zJMcwHJGRVfHsZtCndpo8TTYD5c8NyBmjEooxV2EJgr?=
 =?us-ascii?Q?IB0mIolJdCsC8RR9DBi1vhj3itbsOL61wXqlyBTFzl94dEzV1HxHN9DulBD1?=
 =?us-ascii?Q?PIeIh6DuJreYnfiOVyApXvYuEu1Lw+gN7W61J7yei7t7Es8/Ni5NfEYvs/8s?=
 =?us-ascii?Q?g1IW0rpAWvP6sPvEQXoQcl+Osl4eZ9Hv8TPKv4nxL7iphxrKIb7Bqk5JJkE8?=
 =?us-ascii?Q?bK3WAaw9aUkVe+d8S2Puk5BBZFSNbYB6nCvduEacOBtErgCfLn9D12991Lnn?=
 =?us-ascii?Q?WkoZozQQw9aXE3VwzQU/3meeCutKD1KrWfcOmIfYJI9S8/FA3KN2HOIkYIAj?=
 =?us-ascii?Q?3IqgEqsCiALQBerdvozIq+yEiIgu3V9QXDjmC7GLJkouDER93oE7TqfDsHPG?=
 =?us-ascii?Q?gcXVq49E6Cwastt4k/Y/eilMSvmQU92rkCvjon8Kn8hshxId5rnzDpTSQoKf?=
 =?us-ascii?Q?85lYiOexvYRmY0qlUI8yUh0qtC/iKNxs13M1iiQ1VU1ByVuydRpeqbhpY1uq?=
 =?us-ascii?Q?+QTxVAkzGBRHcQ6IQyh3ndQKhk3ng/oRzMnlLFt5ofwE0n8Eq/RUg+GyFUBb?=
 =?us-ascii?Q?Ixh94aNENKunUu5fpUkbCkdcFE0s4113WJZDm6aM6HUI0Ijmv0Mib4SEe8CE?=
 =?us-ascii?Q?QmI9LF1dfsv2QZEap5YVVQnoJ/XCQoAjjc0jXKFhINxUXNhR/L8lPrMnQTou?=
 =?us-ascii?Q?g23WhLJNNhCZmvgwZnshQ1mhAzljCn6Q3z8jRscUKtPpyhWxEVeOUKjcM+dc?=
 =?us-ascii?Q?Usz9qrm5q60YitmPWD5ouam+ETO3QDQcWsuNfiUbVGjBbyGey1KtRh5EgIG5?=
 =?us-ascii?Q?k1Oh9k0wIEFbNWRT65czjgGszP4BzRF7xpGe0BuxJ1FATEPXnNiY+Xf/Qj3i?=
 =?us-ascii?Q?2YtYKyr9xlqZbqqjaxRwlRIp8lzh6grH1DBC02nKWt+Du/neG7qqHOD9nZse?=
 =?us-ascii?Q?vhWyF7CwL/goUrLC0g4qSwoPXXYv5eocy16X8FlBr0m6oOtu7w3h00f91cFm?=
 =?us-ascii?Q?Zl7az0B4HAVhlPsjDCeVWy6kfLRlTeLGvdDbVjRCqljFsQrCySFRcN7tO4cb?=
 =?us-ascii?Q?hcSPF9N5EUpe5lHDgVHc6xcoPIAkDTBGTm+9oo3cDQ30ouzSUYdg9O7RJG8Z?=
 =?us-ascii?Q?myHGh0MO7ff31/Wpe8IiY5Bc0iiRZr/6c08AyPUdCgG6pvvP/LB1WdFfaY7c?=
 =?us-ascii?Q?SW0SMTdhl9reyzulZVLI4u6wwZEUW+7B4cvF7+vEOEfOdzszNdD4J3Wp83QZ?=
 =?us-ascii?Q?P9Kuerf1OPNNe3T2Wu27nUqMAnE8jjnDJ1byY5A5P9yiaivwlkbWxIafRM/C?=
 =?us-ascii?Q?nCJRIya0lEj6D/NcBfwmcZxPiGXVL+uoeXGuUcnGI4aqAuUeWyZSFy4NStK5?=
 =?us-ascii?Q?z8GOq6ECJkR71XG9fBfoPSSH9AhffptunhllXynG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/BV7kC6zwPlQxVhpejxhif0FxqIn48hdeQcScXTrqU0W36Wz2+lE4FiCoDS5?=
 =?us-ascii?Q?Z81KAuEaF+cAL55rmzRm5vrOvDEV5GpFfq+k4a5GfghdyX6EudjypCFPCJjb?=
 =?us-ascii?Q?xIv2qup/G6OBl3UpuTgolKRjrgfepj+Ma4SEtbCCqbqA+yGyrykppL01tpyx?=
 =?us-ascii?Q?WT/+QuA7yZQ+EC6GhVdy1VhUEVmCiyHkWnNGz2AB1xF7YxpTH7Kh0XiekR9L?=
 =?us-ascii?Q?K5lpZys8nGmJMhoKbWxMTomKJIPAglpKOJG+2EOWucWckePy6+z61DMbagjG?=
 =?us-ascii?Q?DPvN5zihR6/VgVR33+0bjOlbZMqXlQCx3X8gcVJaaQUtGgcpIZI707PbHUCj?=
 =?us-ascii?Q?wpXqHRql4pG3H3jCDHzxpeA+d4sQ68vjWaiSehL0ldH4FJzCV155zKkZ6cDb?=
 =?us-ascii?Q?BJCXTnRIBmjaX8NrqMmLkC9LJHEK8H2ejRR8YXwkg5RFDnrMWAOVOoj6Wki7?=
 =?us-ascii?Q?crECQqgSbJty9l0TGamHy2aUIyIhFVv6SIKAfK68g6Jwx3s0AA0iZCpvEWmU?=
 =?us-ascii?Q?xsOfvaoWR4C2LuJ6/OHvITCZUyiW3kQdL5CZVj/fIPX6wL12ifdCRfO2CQ4a?=
 =?us-ascii?Q?MM9CrCiV1Z5pumD8IbZReiv9OgA16CFRaRo5JTfBTCCH/3cc2Jyfs/lZpeUL?=
 =?us-ascii?Q?oZzhMwVBBMXzuBt8ptp9URC12HNRkztCQANLj4T+0QuDR+xSyYnQHH7NgIQm?=
 =?us-ascii?Q?BpICOKohm/0vNOeofuLkjWzovAN02xBXeFT4MXx8N0eMbzB46Z6WX1/Dc0OQ?=
 =?us-ascii?Q?kRyWY6wLt5Pi5DJvQF0YcMX8RgYEkqV4fliuuRI37V0vSDCgQtAXY6Q1heqf?=
 =?us-ascii?Q?IEvO1QtbiWswpxIpTSKZJkgRfZ9a3KbVvo9wl6ieYXMVd6sup3LumKJJSIyz?=
 =?us-ascii?Q?apGOWfhiw24s9wjSU/0bRkXUMdReKpOc9TaMmnU9aE/0ahJxqTPPj2ReLEt0?=
 =?us-ascii?Q?eFovA+cjma+I1TxJgS+yKhd6ijE296YhtI+8ZGfGrCMENY1YrEqxCVjkPrrk?=
 =?us-ascii?Q?OkmAfaFr9qgKI7WmiKMj7y9XiWdIfJUaaqh+qtGiJIYSYjg2RVyz90L9/rK9?=
 =?us-ascii?Q?qU6M18UHnBIB7cEBDaZ9AGCBQGaps6yOPxccxGVCII8MM67YO4+Snz/kz1LE?=
 =?us-ascii?Q?B3styZdrT//RI1v1G6b0R5HJTUd4pgur7l7wZ7ue1Xs/9yTvLBJKO4cPcuqT?=
 =?us-ascii?Q?5Pl1zAwWhSwd6c1ks7IyaoU5bJVz/QYquEFKjZMBSoKYKk8Ddc9ss9wPo1lX?=
 =?us-ascii?Q?ehr4JAsvFxnRsTWv+WyzRikz28CK9nAM0AcEU3bJWYj5ZaO7mUHYKrBxD7Eh?=
 =?us-ascii?Q?DEMFdsT4W9r8CJWHUcTL86kiT5d/zhElEnVMVmEhF3RuB7Z9Lrd/anzXHa5d?=
 =?us-ascii?Q?k0+Dwe9kl+2tMuUHQQAORBpHrT8GtOd9Djg5IT59Z4UP3NFwORpNZwvdu4ZG?=
 =?us-ascii?Q?+oym3AH/2uCvsiCaDzMKBAM42i3ah72E9l/WFhSD9PlEzsIljE4xzR5724UY?=
 =?us-ascii?Q?yOeDy1nUBWH+VJhaRQ9Eq/QbXpaBK54hqVbsyuGmOw5J9xiAtkPJQ0Q3F4cr?=
 =?us-ascii?Q?Lij+CPUOeYL49bKZaVlcn4JO9zdWtiMi8ZsrR6HkuNeh8j4RMlZmwqcgrCNw?=
 =?us-ascii?Q?hE9hBQjiljdkk88gP/2bMwy/6QIRRbtrcMVfTxTlBwZf1bDAgAsKEdRYPjBE?=
 =?us-ascii?Q?+LX7T5qaAfvrPGqiDh8j2Y6m/1N+BZIZ5npJ0YF+gHiZ4BMXhFrOVwk2GOyJ?=
 =?us-ascii?Q?JHoaz2O8tw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dHjBfOGDFNu+W338Bo3Wvv9JeD/hd2pbnI62j+Vf/N6ju473rTlMsoQgp/giTx80cBB3slWtKXGzTJhfdSqFdRIxiZAz0r0zAxNYcuADD2kX82Ht+6BPQrIzpQxjgIQcU4zOUUfTCetlhMjQNc7bK/z+OFC60QN0FG3e04UGuJYYgDsgGeh0qrCu0XftGLJ4HBDSYFWKs5rSl4/4kGKlfPOj+6NJpHccoExWgo6d4wt8q7fbROskZb9WXtF+gIp9vXjMT4R1Th1xdA9TYfwXzkXw5JbWH3cPyDFmNZHtXaZK6lZr907mIEUZ+jkBkF0g9GfD0EB2+1GNRIdXCmsVf+tkWeXgY0BVjE2JnGqZ9Brv1K3oAYJZTspwLnoZ9WGHwKmX9TOTNACVS+bst+fEx3PIdaBYuhKXfPQcNxcgHrKhDLQ0a9TLF7pCJee5KXtNy5CB5dVy2WloOoXVHZo8oRlIWHygnjbShF8XWFabnEqUzCiXY2faMwdSUAolT/lI2w1TCwGyE6fhsJhF7uDxt0pRMES0VrqEgaQsTawI9Y/yoM+pad8bW2DF77XYRi2jklRxMrOdRFv6lyPn482KR2aE5CXj3r1Ea102FGqY3Pk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c5f702-944a-44ed-957f-08de5ab272bc
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 19:06:01.1554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OmAsDejjuJk7mLsNZjN6eAzzbLc7/8SvEVGWpD63OfRn++7ntXvPPnuFuZiYRFgizcdqGmKxm9Fvc7CSZhQjPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5831
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 adultscore=0 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601230145
X-Authority-Analysis: v=2.4 cv=WbcBqkhX c=1 sm=1 tr=0 ts=6973c69e b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=yPCof4ZbAAAA:8 a=RBgWSan9oGArEJNKI9sA:9 cc=ntf awl=host:13644
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDE0NiBTYWx0ZWRfXzSy2ndLHpbM0
 x1Lh7KU24MtyAyFkRsCjFa3lKQzxheILYSnonJah8/zYlhwNzELMjrpqoQSor9xzBA3KCwBB1ax
 CnVXeohUmTMMZcCxtLipE4dGVO9qghS0Wer7ZxXHrmkFcICs8VnVeMSa5xJ7mVvSwDOSCuCsR/K
 goiBg9xWQ6KHdDTjKX/03Qqi/A+tChqrNZGW0dfD1kEY2sPI4cg29U1Is3hUOW2CH8thOnZXaBS
 V8+3WyCYODgHC+j8FOPBafxSiihnKoAX1CGwImUhJ13ZNjC6gzwvqf+AnY6r8PtS+YCS9AzBd54
 TOZIzidR4rQRsCSVUQTgLXLhOM0kqtGEnOojOis/ZQ3Eap6UvGyRs+ALdr7H98WhM43IUvIb+7r
 g1iV5BFjia9SM1PxXfffcLtCfs//Gh5GprENIYbXeDHPfkQrXFAo+8iZEpugG0nIz8GM7e2LFwZ
 gu6lMDRvwicN18Ul8mbmc2CD82h69qdt7uXblba0=
X-Proofpoint-ORIG-GUID: RalUVigmXEJCwaOdlVvIYx9-uDYw7JXR
X-Proofpoint-GUID: RalUVigmXEJCwaOdlVvIYx9-uDYw7JXR

On 21 Jan 2026, eugene loh told this:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> For most probes, bpf_get_stack() strips off artificial BPF JIT stack
> frames.  In a few cases -- like fprobes and rawtp -- we have to skip
> the first few frames manually.  Typically, we should skip 3 frames
> (trampoline, clause, and the bpf_get_stack call itself).  Further,
> our BPF functions like
>     get_bvar_caller()
>     get_bvar_stackdepth()
>     get_bvar_ucaller()
>     get_bvar_ustackdepth()
> skip an additional frame to account for that call.
>
> Change stack_skip to 3 for the dt_fbt_fprobe and dt_rawtp providers.
>
> This raises the thorny question of testing.  Until recently, the
> stack_skip value we had been using -- 4, not 3 -- worked since it was
> chosen empirically:  there was a bug in the kernel that added an extra
> frame.  But now, the kernel situation is muddled.  The bug has been
> fixed in recent kernels, but only for x86.  See
>
> https://github.com/torvalds/linux/commit/6d08340d1e354787d6c65a8c3cdd4d41ffb8a5ed
> Revert "perf/x86: Always store regs->ip in perf_callchain_kernel()"
>
> A broader fix, for non-x86, is also expected.  See the thread that
> starts at:
> https://lore.kernel.org/all/a38fed68-67bc-98ce-8e12-743342121ae3@oracle.com/
>
> So, for now, XFAIL tests on "unfixed" (older) kernels.
>
> Orabug: 38776929
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

(verified that it fixes these tests and doesn't break older kernels,
which XFAIL with the appropriate message.)

-- 
NULL && (void)
