Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793999619;
	b=odPiUsJBOnOVWzsd2F4w2w+nL3cefO8XYMxGN2gNItyTuik0Tha0e7lzTyLdCx/0yQdt
	 t4OSEuwJRkAlQoBxugGXOt0597X8/LaoIWRXzeqkz+ZmdWUh+8amOeOoFokBp2n+udkLn
	 1Fc8xQrcFjdIxE5GBwb0QxNmY2Vlqi8gCNP4/BgKYC9g78H6IxX3kB2sX2XvFfAHaW1rG
	 r2l64cXwj9Y/YzZDL9rQXaXHkYYd4AzwO0BiEZPDE/okwjNG6IG3F9M2OrlU/e9d1lh+g
	 kd53Pob62BkFT3aDRJWt6eB3zbf0Kzng0cNUNwwFc1/7t1VIQRRTl35SpvGeM3VPa7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999619;
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
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info;
	bh=6JLcRCGlgi0oeSvk1nUFeHjEUVKehazEniDiOeHx0fc=;
	b=H4kg+w0eOvZ7mNkMccnB4WJy6xZ/aM6CYdV8PiCTWThBQrJBqfj2GN2M5b0YIqGqMqaB
	 0qyxGvMjIVPREM1crtFu/e7CDByT6cB7eES68TGJTf6ExKFukM6pHK6ZN+YoQpFvSfCzM
	 nMHVrbn2KF3Fxjhpte8ljLW5pvac0tb4bMn9JP7YmsdMHnFaH2HJJsXOsETO6ruhNoa2G
	 2RQH0SPXO8WiGjZPFIBL3Uo1487vif7AVweth5FK7I/mugqLZ3kQFJCeGtT/VXM8/W5/Z
	 vWB9vhQICNQRusw5rClLQaH/U8OS/2qw+8i6MoWziJxmlLO6RuLNHddE0UFalufXXzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=TEPIymxb;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=xTvYY0LV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F042606A32C
	for <dtrace@lists.linux.dev>; Fri,  6 Nov 2026 21:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F042606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=TEPIymxb;
	dkim=pass (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=xTvYY0LV
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6FSsZY2534557;
	Fri, 6 Nov 2026 21:13:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=6JLcRCGlgi0oeSvk1n
	UFeHjEUVKehazEniDiOeHx0fc=; b=TEPIymxbv9NarBUgWiWri+HcJDhWZKodVF
	UcTdPDqkaJpuro9svHu3xWRFFAk2XGRpEKB8RyqnZEfOGWCQOGc/T9hkFAyj2+KZ
	UQm6++SAvjtGKkVCBJQKi63Ladk62P0yLPfgx9tNCvGsKhXClFguK64iTiPYW3iV
	E68d6plYnGe/GF85oy7KNZv/ZWvNuf+Fl4a0aJe3VIE1RvgXgpM3SU7sGNm7CDkn
	i/kYGcp30S+FKTUzID160Wuzi6OVFKveOOOyr9/5YtgrUeQ/B/HVHaK8A2VPPFdh
	j3bQqCm7qnNVWm1N/D5iM/GLnmb/LG4GpOEecZ7uu9ixTHss8FRQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hs3qk1fp5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 06 Nov 2026 21:13:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6L28S92279688;
	Fri, 6 Nov 2026 21:13:32 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011058.outbound.protection.outlook.com [40.107.208.58])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4hspf0rc8v-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL);
	Fri, 06 Nov 2026 21:13:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lx5MQ/6rKMCo45G+rbY3GwpJDutDGJajU7AQ6r3aiGnvicORJupXrBmXCMExqynd3fnka1LJBEZizlOyZkYPAaMJd4L47A/aqxZkb4IWJsVl+TWXpl48ho+w4+1ONqCGKmghVIdGyFgvlI7Y1cbv5QICnPUyY3J38I4oqSKRx2e7v8IOP3pWJcBwH1VwKV6pwXX+R94bWFIn+CTbdEfVKgCYJ/MnGO/40S3Xl64KCi00apJ/7L+Geefx0cJaJkAjoiqQmzk9dhdvXzg0m37DQfZUh1f/QxUabs2HsdsGtGZQqjCX2yiTNYJ4afh58hQd/x4Bm/4SLTpjygiUWksISQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6JLcRCGlgi0oeSvk1nUFeHjEUVKehazEniDiOeHx0fc=;
 b=HLJV/8x8lxgFmFwQoxvyJplbfKq2kmu2ZnIDB7MDdPvpDUIaniRV2ULnRe3BwfyjmWiDkfjnrAQtdlrBrysKUrQZ1fzlyDawbAUxuKCSvqiXZXFuVXEE0K4v6HY91ggfrrH5KyWA+etq7CEQvtEVJbLESoM7T+6pt855SsbtkMjSMmAUb3rZaO04n/fgU2oEiaa5QX78lG3Hfbf/zbUMjQPhXgqOZim99FesrAV+TzGGBD0atF1EY5jWUqVR3WI84047kVhkq/3SKdK8ZcmlyeYfgASYkokEJc7W0PaYyJxPz/1x7LJjTbuXHRERaYcNIDLTuaZzlKwcHZilRE2yGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6JLcRCGlgi0oeSvk1nUFeHjEUVKehazEniDiOeHx0fc=;
 b=xTvYY0LVd9rxfIuwtTWsgK6D4HRPSz/zZqrKRFF3hgqBH5PPn3muSo4FjLhiqDj+gYLDNuxWWHrgg1VguxNfQdH5+u+5+JS2KEkoQc/pkrn/sEPM5QCPfL2eQ/pTxFW4Kspvc6/5knHeoDKdi6GQc2qCLJ4pwJIFXmxOZPWhURc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS7PR10MB5085.namprd10.prod.outlook.com (2603:10b6:5:38c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 21:13:29 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 21:13:29 +0000
Date: Fri, 6 Nov 2026 16:13:26 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nix <nix@esperi.org.uk>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 03/20] ctf: give shared kernel types a synthetic module
 owner
Message-ID: <au5C9hJYCjivlKhJ@oracle.com>
References: <307cf8d7cbf63295d5448222112686f5@oracle.com>
 <874iduuo8s.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874iduuo8s.fsf@esperi.org.uk>
X-ClientProxiedBy: BLAPR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:36e::13) To CO1PR10MB4769.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS7PR10MB5085:EE_
X-MS-Office365-Filtering-Correlation-Id: 49b885ca-cfe5-4b87-4aac-08df3c4ace43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|261022075727099003|261021121427099003|261102123227099003|261026121527099003|10067099003|4143699003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	J5ScHHwNF/eJqlpAXoBr89tBD/pMVXztLIUpCfOzrackDQn75mmTBsJen11WgIctIUKv5UdtHTNodvKdSLCluDTdUKNT+zS9kFN9XjUOFEHzrmKMeopdSMcIcXkEx8ezTcnZ8xpeHfKi1GngCA+dyXVDPnCDveanhZYqz7tDqOjzln7O2VvtjA7U3W+WStm2LWLUuXYJM0UFpbC/vxOTnSRggGETXgt+EKPis7VTX5Rmw6BE+/EYgdb7u6a3zEJQi1IrLpQjQFU8up6eDzVM09EwsVeZ2k5SsExVIPmUVKWhbliZlrCnjuJege6qAKCAR4+UX3eSOf5sv3kjVEzSlb5lBStuThNiegs1gd3alX/YgKwwEHcYYocIMDUotbkd3m/lQUxHJAb0xX8YsyQiSr/MHyePf6+THh9O+SitllfS4resX8ySRmy+7KqrH1GTwm9Djl1hYbFCpGdZGbVBrcIRnRO0fBQZVLCvL8JkSnag9xXJ8dzTKRGk+wGvt2T3Wcb2CJvS2zocSb/xyHmLlZRIcFCKS0ro6fujwihe2j94/7gVqaUX7PSj+5w0DQnv8yiAaefEBPO7mdCrxUSdm4Skhn3cmr0TfJGVncsGCY/AvwaiLWrYelUm9rnvAb8VAI3f9ci22xb4kUESG+AOqyQHJNxp3EbFaayFGj//G6o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261022075727099003)(261021121427099003)(261102123227099003)(261026121527099003)(10067099003)(4143699003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fLG3zVFl9xJNsB6azg0WjaoAvhuzZGMlu0cp18eoM8SRzaa+LHcFuzcVLk2Z?=
 =?us-ascii?Q?BR7st+aZgQBaULHuvMpF4tSwfCK2YTHggm5UuL5Neb1J++FB7LGTk9tm4gRa?=
 =?us-ascii?Q?Icb5tVRTcoB90RXi5zbVoLVOJ/OBI9KlDmp5cc7ETcshieZ/urrpbcHazYSb?=
 =?us-ascii?Q?WfXXw+vLOAxlxRGT6G9MiJdjqvGdSmsIoytuaQK4y3D+8HzdExOGBL4Ts8pR?=
 =?us-ascii?Q?pDay1e/qllpg674qDICT1Heo4g3srOq9jlsyyfSlCvgik52BSx6/uWmv1nob?=
 =?us-ascii?Q?VJX6iVBVLtbELYWeRDN2myWGP/85ElRGHUlzT8kfX0MXosqgPW1SAjeBtKZc?=
 =?us-ascii?Q?Ea+OhTV/p46/men3nwnOhYdpgjGdZyHePfdbOkU1czrirzbsQAgKmZlt7sSy?=
 =?us-ascii?Q?y+InHY3bH9BAcgQu1o1KXiiyPdIyhdMw1Eb7Pl27J29+jHgI9wNJnYv78SP9?=
 =?us-ascii?Q?1nxSVEgzbGwXgUUD55E/WFMrzwjf/uS58vLm/fdzPggz7BH9AK4j05p7lUQw?=
 =?us-ascii?Q?RNgSh4Uts/3HnNxSJXO3XJQOdkvULU/XueoV3dmxUG1IqrgxFfVQedcQhETD?=
 =?us-ascii?Q?3bH2pBQCtQRuxeNYSx4D0JcZFSWZcglVYrtVEUCLzhB6e7c8rC/ui0gI6R7a?=
 =?us-ascii?Q?qsZA9SWdDxb4Odit0glqv974optGwFBfczc2Au9IucCcgKgBYGuiz7AGmvG9?=
 =?us-ascii?Q?o2awd45yK6q5m6srGh0/cL/UMXIwJPB+SYBqmZkpTOW0faykmJjUkFETw1Tm?=
 =?us-ascii?Q?NtPfiYJ8wwyMXAZjQ/7ulF/xZa9B8OsLvraCV9hM5cBDxct867Id+tS08+wO?=
 =?us-ascii?Q?Gh5MatPcqAm/8pYLGxDQ3UhPU9IWImYBm+gdhmadlfwDRilAly7bYWIhGOXC?=
 =?us-ascii?Q?GFGjCiJPj1TxWtKt8iLA2QJmirDQxK1MSGQE4wLBVo+IgSJLVWzfZFe4Rxh0?=
 =?us-ascii?Q?uc3e3vAVJl6dWhdd7EtfF1f9T35FemnB+lG6/OXQbjj59uvUlfNRKNBtjGEQ?=
 =?us-ascii?Q?FGrqH4/ny8b6b9gz6CfjMr/wKKWJiz0EyRYgxyNN8/HsE18R9+BjlD8vuhC2?=
 =?us-ascii?Q?0OpXvjjitaaEcwpq+ug7ZRX7dhvp0hyeWYI88Os8imBTmLXkspr+jqhIZJcT?=
 =?us-ascii?Q?de+tUAnvChypioFYvIqI1ZbnNY6t70sFn2XO4cmBqXUjCRASuQ+/fXAx6lXA?=
 =?us-ascii?Q?Zgmboy/5pY6egdBOoGTx97NJZ0P/AhbH2vJBhzc9L27M8BYdX11GObjwt4HH?=
 =?us-ascii?Q?QrCzdvEgCx9y5LZSmh1c/vtgV+Q+DrpcE/nfkPKc7PwagFmRswWWoBUUJUTW?=
 =?us-ascii?Q?yL61Kt7acEaGNDjSu1luHaNhgitIzXgywZkSzRjknwNOZDt2X/BS0RZZJJM9?=
 =?us-ascii?Q?iTx4SNPqZ6mKUI6XJKx/o5NOramlrudnUb6J4oLt0lTOJgh6KPTw3YXStSXq?=
 =?us-ascii?Q?KxFDjqITR+xiwicNh/OGnGLArQZWjnhHM9HHbB+2FZB5OKq8tlK2N93MSkUo?=
 =?us-ascii?Q?rajJMcXnIlGe/2Z9KRfM9pwSodS/C4zl6t/vuFpCikNw9bxxkAdx6bfJPoMY?=
 =?us-ascii?Q?r1F+u06inVOld/C335Vh0jVwca/rpxwqNk9sJDwI+vxULENqmhautzNqnXIC?=
 =?us-ascii?Q?EBrK8DgtMbNGxyQpUUDZdTGSNtn30swZ5BkpXLWNu8KX75xWQDS8u/WWll85?=
 =?us-ascii?Q?0ARJTKWTvhMSPJUPYiU0dOAev0FSIl8bT/3YHSzVbrpwuoLtpscL8xJBHf2Q?=
 =?us-ascii?Q?APZ9n7N+cA=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	FS5ifqwfriT7qgampqApNH4TkeOfH7tiiSUj6CeU+ALN9r52rZoTPIq8JW6Z/A/qD45okLhK+6JZVvuTFqWaCjU0Ps7Uz7jc/EBn540hbRjDR4X24FNgOJEg9PzKAGDnpW6lx+q/pgwN3tY0q4P1u9Vj5aToIM8A581Y8zka7toB3j+YvUkW/xPT6q5dbDvEy7vHSsAOeCgjIG63+QbpCzyK8vfD4Rg4vNluClKq8APQ5jBoToV1QOdh8u/WRR14S7lq5XoSJ5GF+PHjU4k0GdMRnOCWGTsuQdhca07R8y6Hmdm+Zf2W/u0DbeXcOATyxkmL5i7a8k04Yp2UEXJEyA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0VUWebKBWbNmT6B2K28xauI0cILZpSlmUohPMvV3xo86IaMKq/2uO6vkxZBHg2DQp+9vEIYImEiLHzMVFKJn94NsgoRCAJy8a1jX2W8DLGcxq4/nCUHt/pvbtwz4hHjrY9bonWPi+i1MUMJIwY93Wya6OjYzCVC/PET8XU0e8R/dz+SLmgCkJBsfrhg1ppIrj49qeSQ5K9d0ts91MZeIo9LoZVwI5L8UySPltwqAwQyDThswcLZHh/LMekKeYf4Mf3EyXnNxBpBW4f3uotg8cGDQ//zVEcUe5NQIgnhr21BTeQqJc4b9GYaK7W0InmkZBxK/t0guA741SyV4fNGqRbheXSf6knu9AWVCy1oAyY4FOgUAWWCclzgqLjXqlWPiKxvYXC3q+rzdzDMPrvTotzyfvVu0PcwOU7+QK/oP+fcebx5w5aLB51n0s4E0QKn2ih9yFj8TUjH26S8Ug/kGIXNX69BvDXgcjp7NI2SIfEY8oOY7F39JAP7hKOIQlY2252nj3jn5Zd4OuXAxXz41n+6J/n/r9CPN4WEv1Vbb/gzRoG3+UlyFNwhKJUS14abmSJkz/Z+DWjd6wkCoc2dV85Lb98/nos9hHm9QYL4wDL4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b885ca-cfe5-4b87-4aac-08df3c4ace43
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 21:13:29.6877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IOaGSoNUXX+0YqbW9oTypUAycVP5fBgHbH0q1HLbCwBRTS3ne8Nw8O+RnioqLUDQtrM2fx4Fox50LNgYkSOCyiLPETvI6B5hOHoIkIO3dPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5085
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=923 spamscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2611040001 definitions=main-2611060084
X-Authority-Analysis: v=2.4 cv=duZOmFg4 c=1 sm=1 tr=0 ts=6aee42fc b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=BqU2WV_vvsyTyxaotp0D:22 a=Q-k7BUx5VD6O64vA5DYA:9
 a=CjuIK1q_8ugA:10 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf
 awl=host:13532
X-Proofpoint-GUID: ViVaTZfRwPQb5Uzlgq1kJ845wHQGWLjB
X-Proofpoint-ORIG-GUID: ViVaTZfRwPQb5Uzlgq1kJ845wHQGWLjB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA4NCBTYWx0ZWRfX9qB6fQqPZh6S
 uTsbf63y+oESj52o5zRDUmLBKQVRDaZTWaCr9RfGEl6dEIsapJSkbtqn4BmdC2W/owpIHVQG18S
 RaB+b4emNAgjgjei2Mu6cRmxnj2fY9efK5cF0TWI5ZBUj2nuQ3ufSualMqh/UDIm9NbBVPkBwWO
 XT0JhZmSUMy9t85sWSO0cTvuqRwEIM47r4dbNXDaU3xsrppiW1J8QJNxGujwrhc0WWj7Wbz9qMa
 byI7dUVUK1rfJnw4a+2ns1amlLiPSpg1Ia3N7tAgOSwfiwcoVTfUhBJNOb3ythMR8TVhif6ZbIc
 WUzzv68PBB3WGn/bGTwu/bcAbELSDd+/E/Nemvv3qiBLi1Zyh2+ZSOmKKIhrX4UgkjQU1ZefkaK
 QGCh4x9k7TXZIMvOV7Gf/RrKzZiNQ1k6yn82ZQgbIKx9lYKyfesLj2PiaqplGIacMyYFrUKjlI7
 +HebUY/u7wgPGRlOwA2V+L4DvNuwdJBDFnpAMJkg=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA4NCBTYWx0ZWRfX8j0Jd5Qd2IJT
 +x1GSH9ryW0D6agV1xlLbzk56TI8/cxeTLF1bk73C/LITzPqAMF52kxQUjNJZauWqEyhSP1WEvr
 fbfe/cVwL87/Dz+rVq/R8a/mhtc+yBTVyQ5z3GHUix6mDpoOZrUZ

On Fri, Nov 06, 2026 at 12:40:35PM +0000, Nix wrote:
> On 30 Oct 2026, Kris Van Hees stated:
> 
> > Store the shared dictionary in shared_ctf->dm_ctfp and remove dt_shared_ctf
> > from the DTrace handle.
> 
> This is effectively reversing a change I made ten years ago :P because
> having it as a separate module was too problematic given that it didn't
> correspond to a *real* module any more (in particular, we don't want
> people to be able to look it up by name with `, etc.)
> 
> As far as I could tell, all the advantages of being a module were
> actually disadvantages for the shared dict, and no advantages were left.
> It's not actually a module, and none of the things you can do to modules
> should be doable on the shared CTF, and it didn't make the code simpler
> to conflate the two either.
> 
> So... what benefits does this bring?

It makes it cleaner to be able to e.g. share the module data between multiple
handles within the same process (which we will be doing with the PCP support
Alan contributed).  It also avoids needing to store the shared_ctf data in the
handle itself, because it is truly associated with kernel module data.

	Kris
