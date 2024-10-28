Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B16B1DEFCF
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 20:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730146928; cv=fail; b=a3xkAXpXvnAXXGqQq1lJJFD7EtXlNUnaEdodLnxKMwArUtxUiCl4aC/mYvwgXz/NqoibfpQt3aNMFT+VDzRD4ImjK4rSwX3xkQuL05LBVW4k4dLS+W1JBEKQ03UDTL8u/HTYAvA8r4Ouq8BPjSAiPe6Ybuh+D96GnBVkGfrfMMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730146928; c=relaxed/simple;
	bh=Q52wUExTw1etUyt180rsOGtbMJJhlb1dcGqjMP6evg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jCzqMQn+ONpf968SdYm8WL39zkkbarpknJavxOVnFen9e2g8PLxHbSN10u8/0sZII7wlisK5N4d19g60pkagcfNL0S6NKwQcKPIwuTnqAqPpXd7BQw67sIy1r2dUHOwXZ2ZbjfVeCR5PtevG/tFHg4r0znjthEKzu1pLYTkYLNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Fdkz3zp9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wpEH+7Ij; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Fdkz3zp9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wpEH+7Ij"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SEtc2l016702
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 20:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=4FhLQIBKAK1kR1WtEM
	qW/VtiYKLfO6++R1pY/iP2aJU=; b=Fdkz3zp9qw/58ezaYqt8OBHI0AOmyJXdos
	igCrH/khl2qrO4MVq3+2inSs2WZjoZYzuBM0L/MvsZSqaREsGNOwFPunxWN+e90x
	GRnAyUdssHEcQfaTr6W5HPvpS+NHmFvHWMCWrTmzTqNvBBNW0kd+M5HRB4y6jENQ
	6wP4eTjhp8c6ys5UnrBfv33P4pXJvqHJELAH5OLXtX7DHGtaUjfpHwGj83ukifNj
	2SSgMcGfY460qH/uQKEusZTroxbyvSXQTiJHK1EniW85V43Ix3ThLvtMWBhMJH3a
	ojjxlQx70r/pgk8yUhA2y+Kw5bbCmiRrffJ8ATW8wC4BEZfnquyw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grc8uvut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 20:22:05 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SK3U6L004927
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 20:22:04 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42jb2t50pf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 20:22:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=du+sok23IABf4GmMySuMLm6XCwhwhMBtWEJH8hyq2XXqyektShloL9MnWMg57PJ3WVcVukoriEXaxDDHi7Zj+d/TKXLDMEETVxcelzwf5aeOot1kt/nzmtfScZPxX64jGUYeFytJCS9R6qAeF6DNhkcHRUva8osJIjStuvzpLn76aF57Y9v67FOAmGM9o2Dc/vIYxbwrf597fqUQmk1y1trCpwf1u+Gu37rQf95XqyHlST8F0FFeDRGC013JGt9N3MUmnJghYFaHClmIivoXfd+oOGzDdgIALrkICy4ja9dMkTuBLUryQfiiCf+asAMSoSBOdatT+2hW+AQ1a0fgNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FhLQIBKAK1kR1WtEMqW/VtiYKLfO6++R1pY/iP2aJU=;
 b=zLZRyHhXMfb9XGlnKI+XWg3vlqzlpykZocNZtP54LojnfUNUfR/gnXK7oZmvWFp4BC1/Sve7+N0n34enCopbts1kBu8E4IV3zLUjlxqtoN8TBka7j+7xqxmo1SJ2e3gcVo9Zm5wfo1TQS1OyToGa4DilLaJbvA9xE/7GU6zdlvIBLNUGhVp6L6wX8aPM0ddO9DGm7nmM6Tt2rF8qLAKDzsnUQxSNGNPSVnbYlqiB9gUyEhEGeC6rzP6uqVE+aID2eUiz52ZNTt6ARWrKcLqZ2n68783+p/KL3b0600GV0jaXaxL3y6SUfSwXy1aediqC6eQiMtpiOm33tR00bbaQZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FhLQIBKAK1kR1WtEMqW/VtiYKLfO6++R1pY/iP2aJU=;
 b=wpEH+7Ijzk9DR7usWt5Y9teBX1mKfe+c8kfw4tffdcZb/O263Xjff3S8wzkzuBmvlZoyAQbwxHVSN+tVP0dIfCQ04svG/aFJWlB/TXmtILBitmFDWJONp1ZHstS7BVkIAHcRHHBqVDpOpLw6s44ykxO8oybPV3G4CEmCJMOL87c=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SA1PR10MB6613.namprd10.prod.outlook.com (2603:10b6:806:2be::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 20:19:13 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 20:19:13 +0000
Date: Mon, 28 Oct 2024 16:19:08 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Cast should not change writable
Message-ID: <Zx_xvCUal2PP79HF@kvh-deb-bpf.us.oracle.com>
References: <20241022204727.27718-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022204727.27718-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BN9PR03CA0471.namprd03.prod.outlook.com
 (2603:10b6:408:139::26) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SA1PR10MB6613:EE_
X-MS-Office365-Filtering-Correlation-Id: a0e6d162-3b1d-4b8c-2bbb-08dcf78dc9e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?evWYqgpu87H+n0pnc70fXXKyPw4/nT8gLsTf2ezsLRsxjILxatle7c0npYq2?=
 =?us-ascii?Q?AyjwoFhJ2huEXwopo4yGX7aHqmPS8g4kN7CFKwxPRtpkJelsvPClKHT4cMZB?=
 =?us-ascii?Q?jw4cRq5044sjvvjE+PZzJZ8jVf65aeXQ7BZwe39kzW9bBmyOu/Xwa3wYAFQF?=
 =?us-ascii?Q?CosaMYkNdaeYY1FZGfgAYazBWAMhi5NSJMMvBvfwQT6B41D3dBUezAf+IIt6?=
 =?us-ascii?Q?Zh4Kr/AINT/HQ97vsbxzUvLjpeewGZGGxcWrYcYtyh2frbYb1X7GYQebvWZN?=
 =?us-ascii?Q?LO7/NcjIZssxEgNwEvXN5iUBGPINXrmLVmbQw51NxtREUNwXkPGStJhiS2Mr?=
 =?us-ascii?Q?klN7O/+WC7reHN2Xfu/BOmG6LDujKPeYOnyhYtXBz0febaDVE1awNiU32TNj?=
 =?us-ascii?Q?+5cPkZXtPFMW0QoRIeBae8N9dLf2q9LNqjUdNMjmRafvhANq05RThrGfMoIk?=
 =?us-ascii?Q?VeTeOUByQoAVVW5VzFwOX42+aZ8lovzvdgewDTHyklnYficr5SM8AEqEljjN?=
 =?us-ascii?Q?2HPvOVeqMoBYcROWCkIBeYuWXsPiOZoIhLcXx9Ao4SzgSvbAbqvFqeHWIqWW?=
 =?us-ascii?Q?Pp8IUpt5O4CNsEYKXTfoZ8oGsvA3QgvNw/RPXA8dJl2Hona3FnrAp9XIgBiz?=
 =?us-ascii?Q?A4O5l7p4Sey1TjS5+w+p1jUI/gwRoLE9TK2ly6NNFR+hwX6scaJM9gKOdwEG?=
 =?us-ascii?Q?uFTdivy7FM68+Sj0mIFPY+DY4USvTQJy1CfMs/EJ7zlG5pbcOQDJ5ykX/cEh?=
 =?us-ascii?Q?SJ1xaOqaraWVObfLyaBb8ipeEpo6dDWp7yhlpVYq43suH4VPUZhGluei2/ag?=
 =?us-ascii?Q?M3OshTWn/mlboPmPKOThcr2fOao2Tv3rCMKt+4m8Zw6fxRBytJng4aI4kZRW?=
 =?us-ascii?Q?pzc+C5dy4KP2FF0jtLNVrbwb8ZiAb+QZCaN3IZXSehKbX1RRPObj2mDxcS66?=
 =?us-ascii?Q?BvSFWSGIoybEWMFTdHBD8PQ0Q7q18+3H4ZRDl+Rfcvmi1/Rj/IKLt21AQ0Rh?=
 =?us-ascii?Q?1v+rlknfwyPqKzmigylImogchNnf3MvaDkj5DGYUukS0r8Q9yXqNUjL3mDR6?=
 =?us-ascii?Q?wb9qgnks9qszHwNX9WTE3bkAgSlT7prc0me0EHNf0JP0hJ1s27zOTRHCg8pK?=
 =?us-ascii?Q?CBxcrY5BWpOVrus2QlL/kKaHM2dd6JUdMY5VViLWd3CBAdvTWu3WJq861Xbf?=
 =?us-ascii?Q?wlGiSb6VCE9VGElVlgp0TN2+6+bq8Qslt70zCLFdA4qfeXIXndqaGEI3Kj81?=
 =?us-ascii?Q?iVStToFC+xx/cAOO2sTSFfjLpLaZVHYhg7AahFoBbSt9vjRs7vS0Jbehx8ta?=
 =?us-ascii?Q?WlziO4I1B3DdYih0gj8Uep7H?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sqvMGWHxvSaUn9nzuVgf903NyxqO+yQ8ULh/JGfGryzMYlLdidILdGRSgmax?=
 =?us-ascii?Q?hmiq7icmo0ehk7lTTJXykpPEjFjGQIZo+8tL19oEqPao1la/187sXITwO3lD?=
 =?us-ascii?Q?FcraOvdUQFTnskuvttRw/xYLrgCLjDutAtAQkc7WeTLJEgZ8/vfb9C7g6q1v?=
 =?us-ascii?Q?Avf/0z1IpA5CuSEBuGRA8zI0lj/X9Ha606qj2UPMpr/DVdwZNz5OlSnOm/Oy?=
 =?us-ascii?Q?fa7gNx9D86JBD4Jt4aufib8qhoFqUzUyySRO1+GSOzWXyv1AaAyufR2b9IPo?=
 =?us-ascii?Q?cxejdGqlfDYRKS3J+jMp6+eaHZFCw7K3SuJzmOr9ozE/bFCKUYESuxfhM3SB?=
 =?us-ascii?Q?ngk9yB50NmPxOT+LAr8xAXD7kwu5xCzn7FViT5W2Ae0KUFLuHRvsgPUnnlZC?=
 =?us-ascii?Q?VqKRPZE0R6FK9kmV/XmFGTwvHpBp8z47xvoPxjKICCATzUeol3cUNL4LNkdS?=
 =?us-ascii?Q?b+GZpO0WMH8MfpBhFrFyBbu1YmAfWXpG1tzfhd7gkqyzYYfGTAsgs1MFALGK?=
 =?us-ascii?Q?Mno8q9H0o8dxZY+AegvS1uKVrjwCAJ5tLiLHgZ/mujhoLr3pgHUmNlwRltIU?=
 =?us-ascii?Q?gjlo+yGWqLJWLln+8S/wFG5h4r0IIR3mRL3z2jo7TVAZVINBEtXLMxoBWSaw?=
 =?us-ascii?Q?4NJ34m4lMCokeKO2eP/lI4ay/mSo7y9Wx42cNx5yVYlDKLzB/aupVzsdB5V/?=
 =?us-ascii?Q?EZPg3lTFNRFQbkMFR3bY3SoCV5RjmnqPgzXms8vJDk8B+GGkff3C7NKkgkqG?=
 =?us-ascii?Q?GfKeQWXktFDzyz4ByuL1yCxEqe336/7hdpp0oEmlLBqY+IfzNWQuY6GEChld?=
 =?us-ascii?Q?khMHDh+UsXx1hI4Jm8Oqhix5VHYkm/dK1QKEMIIJDiI27W25NzS3OiXyR1kV?=
 =?us-ascii?Q?meTQdTY7dpDc3eQYAz+IQFFspKVG9DcYl3zHv0XPSf5UGN6DWUe8oMbm4+yA?=
 =?us-ascii?Q?c32whFl6FLOvb+SdKlxHDMYD98ZtgYr7prQll03rX3wcg8fz4hrjIpnKIQ13?=
 =?us-ascii?Q?Hwum2g1y9DTPRciMajy+8Z9JasZ1CEnBUQNEcPTq1C3xk/Y5NkaubftJfJvB?=
 =?us-ascii?Q?DLfASAJND9ru4tm9odOe11celzsp4qc1COpwsBZ2ccEh68RD/ECE6bZ/FnWI?=
 =?us-ascii?Q?QAnAFwW5i3U8BiKPbI/ajGtpQjpTY0MFQmp/bxu1NVtLw4BJj62FdB9TW6AO?=
 =?us-ascii?Q?wXugKRdSfUl1oWZSomdkLoSKOBokq+WKGwTjfenJMVvKSvbspA1We3Pa75T+?=
 =?us-ascii?Q?9qcCuMHOQNNAi5f8Z9PId0rU1hFsa0gwo5UASxUBdG1gfnbqKWCG5I7CdZhU?=
 =?us-ascii?Q?QNrpz6MwT+fhLfmlLOZpNy9a7Tqe5U9INdqYa/YKuZ23PrumGZaNCOIYm5+G?=
 =?us-ascii?Q?lA8SDWVDGoQ59Owlne753ghwJDdCeB1bVfhRqjpz3xg5YbnL9vNp03HO5ygd?=
 =?us-ascii?Q?4Sh9x9+8VQ+2rBDYpaZPxtPCo7sl4m6wECVHutAaLbYYXv9V8cZlYId7s1ro?=
 =?us-ascii?Q?PUWtp/dEnX/8S/EuyFUIdR0auFftTmMxPv48lhnNe4yCsu0yi5hSgcKqKEgC?=
 =?us-ascii?Q?rNz/vOIrx4XLnIDoRpxfw+au5kl+vAoDCi65iQWGAEWbXehS4gF3IErr2Ygz?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nw0n6mDh33pOBNT8/t3SGQYUsAQR1aEnHR2VHwFt52m+5DpU7AXPeLjlKIJO9IvaUsdbNHqrgrNZDjbag1VOeGY+1UagKLMK6HVgQA0i7bywcmmUAmiAua+5TF2JZwD93UsXBjjx5TJcDGbAnnVMses4L5rKI4CCDcFAPgzmINL4+JJ85BIEwgigWfO91Dh6+1vtPJP+FewOKnLVXAVrJC18iKHknr2qHs38rK6OwlqQVhoI9PZOvr70bQtAd5MzkXI+r++ZxOkhn6ACqY6CR7qD2IzxMp6gIdeaNc9dXzBCwWtlN9O2YiXjw1FMVW9fwTcFktp6eQeZnBdmvcMm8Gu5b/B9WdUq3O5kYyHJd7GlcOmqxvN7wF/4R+3O5ykuQPaPsRIZT8JcOzEfQpMsQ1qqSlbJmbbCgtFBcykVhtPOcbwaMvHlTi+bM9ZNT05sSBfFdfM5MsFeU+PcjxthdRTGFBUml5oqaTo+DyeuDbevo0anFrch2T8DypiRXhKupunJgcGY6aQEOWPkQgDj0jyQawiKqsaQletjPRDZcfVvr7r4rXPEbOrn0ksiFjNMbByo9kMIG97hs1NyNo0Mwcfl+fv5VJXx37zwNNJDjrY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e6d162-3b1d-4b8c-2bbb-08dcf78dc9e5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 20:19:13.0589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZconhIXagbFalHvHwmzUlDCbrmcHuRfCVjxx1zy6ErrkWwtSHzo8uqhOrFyOMv6W8TUpu/6q7isTQ/3TQuGMJIwy7wmhtwbpk37GDy/HRdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6613
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_09,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=935 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280158
X-Proofpoint-GUID: WuKMNqiDf-eViyNZFyis0iX-2PoJnJZj
X-Proofpoint-ORIG-GUID: WuKMNqiDf-eViyNZFyis0iX-2PoJnJZj

On Tue, Oct 22, 2024 at 04:47:27PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_parser.c                  |  4 ++++
>  test/unittest/types/tst.castwritable.d | 22 ++++++++++++++++++++++
>  test/unittest/types/tst.castwritable.r |  1 +
>  3 files changed, 27 insertions(+)
>  create mode 100644 test/unittest/types/tst.castwritable.d
>  create mode 100644 test/unittest/types/tst.castwritable.r
> 
> diff --git a/libdtrace/dt_parser.c b/libdtrace/dt_parser.c
> index 59293ebce..325ba881e 100644
> --- a/libdtrace/dt_parser.c
> +++ b/libdtrace/dt_parser.c
> @@ -4209,6 +4209,10 @@ asgn_common:
>  			dt_cook_taint_alloca(lp, NULL, rp);
>  
>  		dt_node_type_propagate(lp, dnp); /* see K&R[A7.5] */
> +
> +		if (rp->dn_flags & DT_NF_WRITABLE)
> +			dnp->dn_flags |= DT_NF_WRITABLE;
> +
>  		dt_node_attr_assign(dnp, dt_attr_min(lp->dn_attr, rp->dn_attr));
>  		break;
>  	}
> diff --git a/test/unittest/types/tst.castwritable.d b/test/unittest/types/tst.castwritable.d
> new file mode 100644
> index 000000000..1b419228c
> --- /dev/null
> +++ b/test/unittest/types/tst.castwritable.d
> @@ -0,0 +1,22 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION:  casting keeps a variable writable.
> + *
> + * SECTION: Types, Operators, and Expressions/Constants
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	x = (char *) alloca(8);
> +	*((long long*)x) = 0x0067666564636261;
> +	trace(stringof(x));
> +	exit(0);
> +}
> diff --git a/test/unittest/types/tst.castwritable.r b/test/unittest/types/tst.castwritable.r
> new file mode 100644
> index 000000000..b5b9ef6c6
> --- /dev/null
> +++ b/test/unittest/types/tst.castwritable.r
> @@ -0,0 +1 @@
> +abcdefg
> -- 
> 2.43.5
> 
