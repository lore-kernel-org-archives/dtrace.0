Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794067406;
	b=ThrztRRzrHl74KH1y3Tyoe1TfETbzlbhVwxKs+tKCkWrzjywEtOZHH3UJLgMKaPwkYZp
	 PhLD1u+Ubd4kXUWzI9wg1kbRaKvv05gaYEtZNEK46750VuB0oA8Cv3K0Euab5U20RIS1y
	 rP+XrGuExwi0bWB2ZVIRiavCL5MoPZCecqFkHVg2zUR2kyKEaJtC+K0D2hLIxibw8nQae
	 ioAMlMGLGJ5vyTKQsDnWTUR0M5jSwXwKCiR9j0d2Ya33HfI5TJBXCfBwrogdWBqTLBDvS
	 za0MZTLjJYgMdhOCJxLj89fLJEA0I1irMs58xzexBQJsYskVUsNuj0qncMr3evsAMZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794067406;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID;
	bh=4y+x9BNPzweNHU+sJM4I20X3kwwGCUZgbiRpytWNuWs=;
	b=ge5mmVTkSvtJow6X+qxGQUcWVj7rDGBx+PU0stTyNGTjJzGElz5+e1U/qlsp/bibouzU
	 Q7DOClpNbug+mmVE8JQ375tTVsgGx/QbOHWgkm/SwmJdClZKPZVvYbX1dJcnz8ebXlBH/
	 2YgKgSjs2KEoAGEvOg3T/LR8HS1o7bL0Mjy9gC37mohHm9WOeu2zOCkLVo95guSWFTzlO
	 9c3al3UadllGDVlqOZ8lvPHabfCJVXRbGD5AKcd5EioBwp0CYkA0bn94sgbQY4H4BDpII
	 qxYv485yPr98YvNXRaS58cyzJLQdpQSKvujCKShCPngQ3AICL2Qqcg54HVFImnmFd3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=jiju8wHS;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=VQM688kQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D34606A326
	for <dtrace@lists.linux.dev>; Sat,  7 Nov 2026 16:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1D34606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=jiju8wHS;
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=VQM688kQ
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A7FxpRS4150632;
	Sat, 7 Nov 2026 16:03:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=4y+x9BNPzweNHU+sJM
	4I20X3kwwGCUZgbiRpytWNuWs=; b=jiju8wHS0Yxgw07pbsyK1VJ3rAbcOk62iE
	OHE2bsG6HG/BRCuL0reyzwCC8VKn3Q+MsQ6roGR3Qd4sy/600noJEJyPTyJ+9iRS
	MP3Kzgi8P1XQYv+eGXe7jOlnzKuA/hmSQlGR6Sbn00VylLuVISiRYxThtLrwDNvQ
	K1JBDCS59wOrL8POG/e38nunuKONFFitLvjSzOf4tQA0Jz5K7GI5efaabQQQUfEO
	PUfa+BLWdWJezxKq4ZR7Fx9CO8SKzKLYYMvykUBeRhbRM8yEyOPPkYVNJsbvUCml
	04ltX+9Zz3BAN1yUWlef2Bsm0FL7GL1OUPuZV19cTXfeMUbfoSUA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hsvhs0ae3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sat, 07 Nov 2026 16:03:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 6A7Fo3cv906488;
	Sat, 7 Nov 2026 16:03:20 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013028.outbound.protection.outlook.com [40.93.196.28])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ht692ruxx-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL);
	Sat, 07 Nov 2026 16:03:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J0KR5PTik0DWh0q4nSGq70B/9dWko+40bes4SID3pxlmGzk/LghCeBL7EIeDDaaH/IbDdfl6WSjfpf4sIpnSn1vhud0/fI0FyIICRViHPYXkVKM14GuS5dXSSxMmU/C9MWK/1jU/j0f5pGkDm6kN6hUnLtVWEozlwD3UyNH8FXMokMMEsCdOXHIKMcT0eOdL0UCuQmn7nls9lByhQkx7mz6zI6/MFvYra0zfSM/ftfQCzUzqcZBMCKD/HM0d57nLsBBxTjAZD1qpk1gTU5W4GZLfz1nU2Hs7sz9+O4wGirFGLK0atnTiYmMSl0qC5LWxzU0QCdbX5oEimA7K9nY5qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4y+x9BNPzweNHU+sJM4I20X3kwwGCUZgbiRpytWNuWs=;
 b=GBn3lOewq05jGfgBRNn5EQzmhwuWlffpVAejp6WYS+AVXaWaELWHaGNEmjPRi9ABpW5H7ozFVmotOa4djjvHM75OOHITm9kNe8Z1nyE32GXX/NHwzHhSuIiX+N+xJhOuXhaWinTxRYj4mkqQ8IyjhwkQYXxJvi3joonNJo3zioqgAE8j/eDQLu2ArDaBQfcz4T+GURyx6jCQpR/Ap2eOrmSI0v5TyyItLKGtB/sx1Bx7wfkSNB+Xn/dGxx/MwnnZngqe/zNjq8y75FFG3hb8UDCwAcXQcjHNPbacoXQLf9oEcbkpnEwFHCAGbUVlsr3QQHh7/tbOqRfnrFh2hSmU1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4y+x9BNPzweNHU+sJM4I20X3kwwGCUZgbiRpytWNuWs=;
 b=VQM688kQ6gNIorJu1dxCu9t1pt9nY0HAXXAjiIlb6shEnpG3Q7dNe/zHQVI5VO4m1sxWTmCZmEwM932J5qhXKdX7NITjSQ5p5MoMP3pSWu6kYo4hK3kblRMaKsNT9ADHLXXd5dSAdiltafrtN3DeU5PUffKXwvskskTwwCOEw68=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SA1PR10MB7854.namprd10.prod.outlook.com (2603:10b6:806:3a3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Sat, 7 Nov
 2026 16:03:18 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0592.010; Sat, 7 Nov 2026
 16:03:17 +0000
Date: Sat, 7 Nov 2026 16:01:36 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nix <nix@esperi.org.uk>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 12/20] libdtrace: index module address ranges across the
 handle
Message-ID: <au9LYOlg6Fy8vWll@kvh-deb-bpf>
References: <c0532405682a4907cacc1737efd195a5@oracle.com>
 <871p8yt8gp.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871p8yt8gp.fsf@esperi.org.uk>
X-ClientProxiedBy: PH7P220CA0160.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::18) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SA1PR10MB7854:EE_
X-MS-Office365-Filtering-Correlation-Id: 260e55ec-eae6-4518-bd8e-08df3ce8a2e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|6133799003|18002099003|10067099003|4143699003|5023799004|261026140227099003|56012099006|261028144727099003|261022075727099003|261021123027099003|261022105027099003|261009223027099003|261102123227099003|261021135927099003|261021121427099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	V+u5Ss6k0Kx56ss4YgGe3nHK9JB1Gthv+i16bVwVaaYjxrnY3ANHu+TvUjudz7JvRAc7h/2gULm9in1sLkE9E8qsB1n/WPVb5qwAAjpzs9RKmspJnxCkQ5LZDptWb9pxQKQSg0GiOh0zGJQIVUZe353AF7jDeF0ozI3PGgDUs4XI+s4+BZDkcNZTv258nw3Wuu55BTnK09YbrrFEhyaMPufD4T5kD5GME2IX5qX5YYgbaTbjaJ2f9Psn6JeTV699rGTH3LCNG8kPA+nYwF67Nl4i7U1O3u5TeRTIND/BzaUoTFWifPzBzanizfGD4esvOBQlJxsSdhmNA/B4hSvPfLN2fZe5cbFte3RPMWBfL5YuXupHejvPFnfH/J6U7lmBfkQCrKVN44oZunTsA5Gatk2T2RKSn1s3UcEVTFcoqfgIe2kE3x+QvsrO+IQTvI8A18cugH4AIHbMwRQ2prIueJRzqknYaDVAyLFrl9MoRLzBoWh1lc0IAKuEIc4NU7Euv7r2p2d/vrwdurohtK48YvMldwn+gOaiiKnXzu86OI8ZlE/l+4XmqHdLG8z1nq+hiybX6d+PvlRofyAfUby3ZzgpxGJ0rK3P9AtLax+NH8I7CVWEmy/rr4qIyusfsv3c12z/LpMt5CFaWnZvr4TaqPxkAT77L0BB6jIQcr6SQyI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(6133799003)(18002099003)(10067099003)(4143699003)(5023799004)(261026140227099003)(56012099006)(261028144727099003)(261022075727099003)(261021123027099003)(261022105027099003)(261009223027099003)(261102123227099003)(261021135927099003)(261021121427099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QE/xLs6udoh+e7UXkSYG3Q8STbjTJPaM5iJTm6Zu92iC2c1kI8TdaKDHLkYF?=
 =?us-ascii?Q?Gut0Cunk3s3I/m81HoYzs1MtDBLk0P+YO486WSxxVJqJssxF7VK0j6KT/gJh?=
 =?us-ascii?Q?2SGupr+BKIO2xvFodbOvrGxu5LlDWVjmHNOv7RC8ASpP9Z7HZLS0tZYEM6II?=
 =?us-ascii?Q?Ao5V4Hu9EJ3wzC8HxO1Jus9RDEnMjWqwVXOxVVmMhf7orZN/E4vZxSZNr9t+?=
 =?us-ascii?Q?NYSmsZmAZMgXGM5LjRWbSnlVcNW0AX5ds4QS/0sAs0BQhFUsNCb1l7YMrk8X?=
 =?us-ascii?Q?lFfSr0Z4X78ZZLp2FE9Tz30tk/KuX6jojS2HHji9ic071S7PUVyOjxcce5sj?=
 =?us-ascii?Q?lhHJdfhO9DiStxttavesrqbSshgepmv26RIR7LZd8fed58/8ZeWZww8x7JSw?=
 =?us-ascii?Q?L9kyG0yFKEdBXM3W8QFunjdqvIy8VYlkhTyZyr0dIYlV35x83+CGuJXlI+/3?=
 =?us-ascii?Q?MpxY+Pgl20YdXKLPnuU47gnMtRpP1HIsToOpI1rTCoSivLILJEh4j3phbkHd?=
 =?us-ascii?Q?/jmqKU827ZtIK94MOLpMfzfFbK0KlIqlFpxeV8XbG88NhXcEjWmQKF/P6Q0l?=
 =?us-ascii?Q?y0PslW3JCVJi0qg4er1NNfqRG26OaPNdQ/KVBRsbSH2Ub+6eFOwdNttad7zw?=
 =?us-ascii?Q?zAmLd8x3otxZeOVfwF3jliD31jtrsOs0XccLtdGD6lF+ZNf4mg0UzE+r+At0?=
 =?us-ascii?Q?n78ogjLo3oztjvcITX1MDhwTt929TDkzHcoEvwrRtrHXclUbskBx+x/IRaUD?=
 =?us-ascii?Q?xHNzmYID93J8ZRvALqohtgOambE7/6VPsBMUYBgdVnbCP3+wcO+hrYJDjT1b?=
 =?us-ascii?Q?yNaSkw5q/BJUgO+ysSzps8MlA6GAvV4jVl2zu3J1MrW0GzScYMrElB/WNS7W?=
 =?us-ascii?Q?0D/LRhlZoa6+bUIg1Z2E7pB23ZeD62o/WsLV+45sodPZKf5HHs86BtbCvPGR?=
 =?us-ascii?Q?Mi2b8Y/ujIUNFIm+DXaXxSboQXBIJ7Ra/rDS7aJHTUA5hkPSxQEL+tN9zkw4?=
 =?us-ascii?Q?fVQ0j8NriByDffTHxjBC9+o+40zTvjC815iRpxNYNk0W+zH3EeTKiuzEOIHC?=
 =?us-ascii?Q?EcUcHwm+xhfgSSgz9646iuG6Fd3Ld6ltqhsg+Zj79BsgV0hzRddXnGQvLcdF?=
 =?us-ascii?Q?TtzVvpnao4BcvmJ5IIwLq3y2B7FUN5PNgi8+JKL+ubFdKQvODaw4EgBT4zba?=
 =?us-ascii?Q?Gby+XE+/2luatmM0gX+Gqvz1grOxWuNKYnaxtc6TGYuwzoLlElDxO5xq8Zzc?=
 =?us-ascii?Q?zfGfI7WS5SJeRzDgF4F1GQGuA9kJU1RSP54GP8+DZ6qaGKm6dPJznnxiVxnf?=
 =?us-ascii?Q?36LZ0BcVSN5MXGNBCZi8Gs+C3x7hjv2ok/vPePmQwkpM3KDG3TG7+AtjyYHe?=
 =?us-ascii?Q?Oo625PW+I80JXzikulxWnmYVtW/l+orXt9C6NkUBKJRXstPnBwDPMzsExuF6?=
 =?us-ascii?Q?lAckGBl3Yn7icvNbyvrFdUQqIcK0O55C8xlQ0P9w6+V6WLcqY7aQEt2jl8oT?=
 =?us-ascii?Q?Cvm5R53zTuNfn0oOdXbg1TNNPJvaGzHjl5Mf5JKwGIuDQI23HswupFWhJuuJ?=
 =?us-ascii?Q?JOjM2yJVvujYBTz8CajVySHCQLbGiXzs6msggvp4y7orcvXC5TunlxRvza0w?=
 =?us-ascii?Q?aQye14m+h7S5MRkQnIWLix4Gae2eKYrIIN2ic9OLNmRhRsDl+e+0Awr6aMPR?=
 =?us-ascii?Q?XmJZzQZvM0RCIgzr8b4I7bWQl5ETjrj6WCcR0Z/kYDVu5Qa0kZLQMGneZCg1?=
 =?us-ascii?Q?EhMuYVbvyg=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	gmBhzUKIt1USCu5YzytEi6lcwPdWr5owfMR3TGBTHUnzFjymLAreEMbqfVXAfA70yeTSusUMcg45VlbfqYi9TN2Jq+RfXVtY/b/Fo08VY9aD4nyscUPWwYAMTu0gQCm0ZSJAo+iYusQylx8g+OUK4UOO44sOiKJkrRJ7f6Aquujul9Fb/8TVFZaHjKV0xCYovA1JsBzF4UveWibSyugSx0xxnMgG4/W9G0BS19h82nHIk2pk7376u/GitcFruMf2vVzqqgBqE8+t44i9XzfRjP/nYPayZYqzecQ3wYRG3Q3WTFsnb4Rzo8IoOwQec/4pKRIv1oo56tmY8QSIjmHiLA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	szvPOz1G96Az7Rj7C+MnaLuoP/e1p74LvfykzI34/UG4uUy6hWyDM7TNX0YdFSTWaMK8vhiKsujXED8+PeHekJT6J0JBx8MAPGN91nHdKteWuH1ShbDQ/5Lqq1wb+FV8hfI5H+aKm2nq2sqxNNz+T4uxOToallcK8t0UOMsM2itpL7gTe1Cn8+y6W4IWPV7fVgKVMnhwRjhB8egxTv8lHQpVCq7LDeiAcAgfgShZ+KaZ1igs0W12A+WPeuhVmZ2JKQGUe5CjbK73gKnJVq9aZnJ9qmWMb93jrGeqb8Z7+PtwBaErxG9KcnmgK3OkI/aBmmJdmyGNIw3TQZ7TKAqONjYN8kAA/HKKqkJiItoFTvLyJ0gfLv7WcXORE7BUt3HxEJEIaKxZPMUazPb0Cwm6lTK4TjNBlgklUp84N1gwEjjBHyEwgCYPc2fcrCpGcjbClAC+79KKf/FfhOEzcgQWTI7k5aTZP8S6HL6EI9wOlk7PYV1jjVAY08ZsPPoQhZzIrVUtN7JmNHdqRL6H3adxZqXu5CnWZCZeEZqhAU4WmFg1sh8AE1jn01ssOtAaezsyDzw0dTlzF7qS5S7AZm1ihRJARx4Ak6SGGLgIHAqcZOI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 260e55ec-eae6-4518-bd8e-08df3ce8a2e4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 16:03:17.3868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qeMWSh7KaCJkynp4OYz6PE6Pradoj3WkXQE7BLkXKk7xAdETl0dofxTxO5XqAyMCEuRp+2xenD2zgpP15G71JwqD95Kazs6csJkMLBNfB4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7854
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2611040001 definitions=main-2611070063
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDA2MyBTYWx0ZWRfX7lvIeXjKp9L0
 h155kQ0DMuANPdEQe8ArGKUurfIX+buyT/NcSqkDirKqZ41aJdouxh4paUVf+YayMQ+1ivMcYVi
 v5Ry3Irj+2wHyoC++TCudX1JVEHn/o6di4SJjH/x4VEqCHhk54IC
X-Proofpoint-GUID: uV2uEM0eDUZd0FuFyt9N97KuJaEweykk
X-Authority-Analysis: v=2.4 cv=B6EsQ+tM c=1 sm=1 tr=0 ts=6aef4bc9 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=7Gl3-_t3PgB9XO-mQDs3:22 a=x0eJIq81Yo2gRm7MZ9cA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDA2MyBTYWx0ZWRfX3xxcoEOTszjV
 GtXuiGjcp7TCHKQ5w/iMCdYz34fCaGT36i2xuYSrsTaJg5ChZeJMBNN7UMFghTs6eB1AE4owABL
 ECL0fFrzVv2fuszonezb2mezREerb7xwGvLNdHlfoExP4x1imCsFT1it2W9W/92+hnDYi757o+0
 etMMzEqw35QeQx3exu6gYtywZk995YJOmFobGPjmhi0DsUCk5TBb0NUlQeAaGp8K4asuGJbVs2x
 nwva8KnDKGwhdkP3fTNmY2306q1IbpkenZ87sw5IZ8fVmbOQGh0dW2wfoHs4AsdApiuinyfl9gx
 mHfXPTvP2qUODgW8FxBozpbN68Ke7D+XiW9UqR/aZXTLkmQiKClqsDHYZ1DofnLIGuAGbWWkBMz
 6EGKsPVChFHGqgu15PUlKBYA6Z82ERQQGOi190RIZfxquGtW+ryaZfOBtVLuZxY01rmksUBs3Fa
 /BFVd3ptO9Mvid2RTrw==
X-Proofpoint-ORIG-GUID: uV2uEM0eDUZd0FuFyt9N97KuJaEweykk

On Fri, Nov 06, 2026 at 01:06:46PM +0000, Nix wrote:
> On 30 Oct 2026, Kris Van Hees outgrape:
> 
> > Build a sorted address-range index lazily and use prefix maxima to bound
> > searches across overlapping ranges. Retain module-list order when more
> > than one module covers an address. Fall back to the existing search if
> > index allocation fails.
> >
> > Invalidate the index when symbols are added, a module is removed, or the
> > module list is reordered. Updates that discover nothing retain the index.
> >
> > Expand discovery coverage for indexed text/data lookup, range boundaries,
> > gaps, overlaps, additive discovery, geometric range growth, and malformed
> > symbol input.
> 
> Nice!
> 
> A few niggles below.
> 
> > ---
> >  libdtrace/dt_impl.h              |  10 +++
> >  libdtrace/dt_module.c            | 143 +++++++++++++++++++++++++++----
> >  libdtrace/dt_open.c              |   1 +
> >  test/triggers/module-discovery.c |  78 +++++++++++++++++
> >  4 files changed, 216 insertions(+), 16 deletions(-)
> >
> > diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> > index 5487bfcf..c83fedb2 100644
> > --- a/libdtrace/dt_impl.h
> > +++ b/libdtrace/dt_impl.h
> > @@ -188,6 +188,13 @@ typedef struct dt_module {
> >  	uint_t dm_aslen;	/* number of entries in dm_asmap */
> >  } dt_module_t;
> >  
> > +/* Handle-wide address index.  order preserves module-list precedence. */
> 
> Maybe you should describe what max_last does here, since it's the tricky
> bit.
> 
> > +typedef struct dt_module_range {
> > +	GElf_Addr start, last, max_last;
> > +	dt_module_t *module;
> > +	size_t order;
> > +} dt_module_range_t;
> > +
> >  /*
> >   * The path to an actual kernel module residing on the disk.  Used only for
> >   * initialization of the corresponding dt_module, since modprobe -l is
> > @@ -308,6 +315,9 @@ struct dtrace_hdl {
> >  	uint64_t dt_maxframes;	/* system limit on stack traces */
> >  	dt_tstring_t *dt_tstrings; /* temporary string slots */
> >  	dt_list_t dt_modlist;	/* linked list of dt_module_t's */
> > +	dt_module_range_t *dt_modranges; /* sorted module address ranges */
> > +	size_t dt_modranges_count;
> > +	int dt_modranges_valid;
> >  	dt_htab_t *dt_mods;	/* hash table of dt_module_t's */
> >  	dt_htab_t *dt_kernsyms; /* htab of kernel symbol names */
> >  	int dt_ctfa_missing;	/* cached ENOENT/ENOTDIR for the archive */
> > diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
> > index f381bdcd..9d93b9d8 100644
> > --- a/libdtrace/dt_module.c
> > +++ b/libdtrace/dt_module.c
> > @@ -239,9 +239,19 @@ dt_module_cmp(const dt_module_t *p, const dt_module_t *q)
> >  
> >  DEFINE_HE_STD_LINK_FUNCS(dt_module, dt_module_t, dm_he)
> >  
> > +static void
> > +dt_module_ranges_invalidate(dtrace_hdl_t *dtp)
> > +{
> > +	free(dtp->dt_modranges);
> > +	dtp->dt_modranges = NULL;
> > +	dtp->dt_modranges_count = 0;
> > +	dtp->dt_modranges_valid = 0;
> > +}
> > +
> >  static void *
> >  dt_module_del_mod(dt_module_t *head, dt_module_t *dmp)
> >  {
> > +	dt_module_ranges_invalidate(dmp->dm_dtp);
> >  	head = dt_module_del(head, dmp);
> >  	dt_list_delete(&dmp->dm_dtp->dt_modlist, dmp);
> >  
> > @@ -1724,6 +1734,9 @@ dt_modsym_addsym(dtrace_hdl_t *dtp, dt_module_t *dmp, dt_kallsym_t *sym,
> >  	dtrace_addr_range_t	*range = NULL;
> >  	int			skip = 0;
> >  
> > +	if (dtp->dt_modranges_valid)
> > +		dt_module_ranges_invalidate(dtp);
> > +
> >  	/*
> >  	 * Add the symbol to the module's kernel symbol table.
> >  	 *
> > @@ -2171,6 +2184,7 @@ dt_module_shuffle_to_start(dtrace_hdl_t *dtp, const char *name)
> >  
> >  	dt_list_delete(&dtp->dt_modlist, dmp);
> >  	dt_list_prepend(&dtp->dt_modlist, dmp);
> > +	dt_module_ranges_invalidate(dtp);
> >  }
> >  
> >  static dt_module_t *
> > @@ -2338,6 +2352,118 @@ dtrace_lookup_by_name(dtrace_hdl_t *dtp, const char *object, const char *name,
> >  	return dt_set_errno(dtp, EDT_NOSYM);
> >  }
> >  
> > +static int
> > +dt_module_range_cmp(const void *a, const void *b)
> > +{
> > +	const dt_module_range_t *p = a, *q = b;
> > +
> > +	return p->start < q->start ? -1 : p->start > q->start;
> > +}
> > +
> > +/* Build lazily: handles that never symbolize addresses need no index. */
> > +static int
> > +dt_module_ranges_build(dtrace_hdl_t *dtp)
> > +{
> > +	dt_module_t *dmp;
> > +	dt_module_range_t *index;
> > +	size_t total = 0, n = 0, order = 0, i;
> > +	GElf_Addr max_last = 0;
> > +
> > +	for (dmp = dt_list_next(&dtp->dt_modlist); dmp;
> > +	     dmp = dt_list_next(dmp)) {
> > +		if (dmp->dm_text_addrs_size > SIZE_MAX - total)
> > +			return -1;
> > +		total += dmp->dm_text_addrs_size;
> > +		if (dmp->dm_data_addrs_size > SIZE_MAX - total)
> > +			return -1;
> > +		total += dmp->dm_data_addrs_size;
> > +	}
> > +	if (total > SIZE_MAX / sizeof(*index))
> > +		return -1;
> > +	index = total ? malloc(total * sizeof(*index)) : NULL;
> > +	if (total && index == NULL)
> > +		return -1;
> > +
> > +	for (dmp = dt_list_next(&dtp->dt_modlist); dmp;
> > +	     dmp = dt_list_next(dmp), order++) {
> > +		int text;
> > +
> > +		for (text = 0; text < 2; text++) {
> > +			dtrace_addr_range_t *ranges = text ? dmp->dm_text_addrs :
> > +							   dmp->dm_data_addrs;
> > +			size_t size = text ? dmp->dm_text_addrs_size :
> > +					    dmp->dm_data_addrs_size;
> > +
> > +			for (i = 0; i < size; i++) {
> > +				GElf_Addr start = ranges[i].dar_va;
> > +				GElf_Addr len = ranges[i].dar_size;
> > +
> > +				if (len == 0)
> > +					continue;
> > +				index[n].start = start;
> > +				index[n].last = len - 1 > UINT64_MAX - start ?
> > +						UINT64_MAX : start + len - 1;
> > +				index[n].module = dmp;
> > +				index[n++].order = order;
> > +			}
> > +		}
> > +	}
> > +	if (n)
> > +		qsort(index, n, sizeof(*index), dt_module_range_cmp);
> > +	for (i = 0; i < n; i++) {
> > +		if (index[i].last > max_last)
> > +			max_last = index[i].last;
> > +		index[i].max_last = max_last;
> > +	}
> > +	dtp->dt_modranges = index;
> > +	dtp->dt_modranges_count = n;
> > +	dtp->dt_modranges_valid = 1;
> > +	return 0;
> > +}
> > +
> > +static dt_module_t *
> > +dt_module_by_addr(dtrace_hdl_t *dtp, GElf_Addr addr)
> > +{
> > +	dt_module_range_t *index;
> > +	dt_module_t *dmp = NULL;
> > +	size_t lo = 0, hi, best = SIZE_MAX;
> > +
> > +	if (!dtp->dt_modranges_valid && dt_module_ranges_build(dtp) != 0) {
> > +		/* An optional index must not make a lookup fail under memory pressure. */
> 
> (this is basically what we used to do, so the fact that it's almost
> untestable is presumably OK... and you can test it locally by making
> dt_module_ranges_build always fail, and presumably you did.)
> 
> > +		for (dmp = dt_list_next(&dtp->dt_modlist); dmp;
> > +		     dmp = dt_list_next(dmp)) {
> > +			if (bsearch(&addr, dmp->dm_text_addrs, dmp->dm_text_addrs_size,
> > +				    sizeof(dtrace_addr_range_t), dtrace_addr_range_cmp) ||
> > +			    bsearch(&addr, dmp->dm_data_addrs, dmp->dm_data_addrs_size,
> > +				    sizeof(dtrace_addr_range_t), dtrace_addr_range_cmp))
> > +				return dmp;
> > +		}
> > +		return NULL;
> > +	}
> > +	index = dtp->dt_modranges;
> > +	hi = dtp->dt_modranges_count;
> > +	while (lo < hi) {
> > +		size_t mid = lo + (hi - lo) / 2;
> > +
> > +		if (index[mid].start <= addr)
> > +			lo = mid + 1;
> > +		else
> > +			hi = mid;
> > +	}
> > +	/* Prefix maxima bound the backwards search, including overlapping ranges. */
> > +	while (lo && index[lo - 1].max_last >= addr) {
> > +		dt_module_range_t *r = &index[--lo];
> > +
> > +		if (r->last >= addr && r->order < best) {
> > +			dmp = r->module;
> > +			best = r->order;
> > +			if (best == 0)
> > +				break;
> > +		}
> 
> So we prefer the first module loaded which contains the address in
> question. Seems right.
> 
> I do wonder if you could do *this* with bsearch, though -- I mean this
> is basically reimplementing bsearch, and we already have that. I guess
> the problem is that 'best' crosses keys, and has to be consulted in
> order within a given run of identical 'lo', and bsearch can't do that...

That is correct.
