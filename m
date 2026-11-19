Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795063373;
	b=j0yRAEme/ETwNMANfaf1TZT3Qtt+iH5WhNJsM5B42q7cEVKgQo03EBukJ7MTDROklXVn
	 pbqi23YJrEftdGOZb6UqUpt+EzTJVhjIQX7wP1HpcaP6t4x+86vrP8lJ1W3kJMy4rSYXR
	 S0+CCZ8146NmNc+KjsF+qaokBJ/gZ3EyPOwhwWb9TAxFaHu9YchNpVNvxNr8zRLp9qamR
	 Iy/xnY9xn2WggUsF+FOloWhaZTExxwgKRftnYfDu1uVQvYhGKY5K+oWoZ1lNd/k74hxap
	 RMJJU2tDGDsIKuxJTw5geA44yTZnycc0vAkN+gp3t0yU3l+ueY4GE33N4I0/V301aUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795063373;
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
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID;
	bh=EPSUqSDzZkDoF3sgTZnOehjsq/iZzwtZUfWjzfWk70I=;
	b=rHt8KjUUVXkYahx5ZqJKSDRs770mdZatQLRM2CD8pq+FLt1fyHqV3Iwl+MldbofQXfcm
	 pAyYJJZv4dfV6wgBCkBcbsCrG89l47LuFhxVrpcGNuMO7659nRFV1Ka/XpPkmgzjRZQl3
	 2AQseLPYF2UzX0ay3g7ktLweoc4cHJkm2IXX3Q6wq+A+46+vodvJqaeQfXEHKJsbrrA2W
	 YdO2lwSqmkYdRrg+7stblqIljsIG8gIRomRcq1mXahdp279967yvt0cZQDTa/yFivaCcM
	 z6usaRPg3ju6adg5GNzBjzJn04xBUWJ4bKXRRMmy9wmKBH90sDihyc5v+VzelVNRnrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=FoFjqVw1;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=qeHLPUJc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AABE606A320
	for <dtrace@lists.linux.dev>; Thu, 19 Nov 2026 04:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AABE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=FoFjqVw1;
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=qeHLPUJc
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIL70VK1509898;
	Thu, 19 Nov 2026 04:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=EPSUqSDzZkDoF3sgTZ
	nOehjsq/iZzwtZUfWjzfWk70I=; b=FoFjqVw1aoEgg4VfefThMZuD+CyEhTTm45
	N/eSTf7a+bDHPWjj+nYIxngLWSDrgiCffam8j7OmvTLd6rCNFixBOvYrNorgE/pQ
	4LFbJTA99MRyoJBC9TYguFnkrZfyU1z9SzHgnNcH6V1g1U45pDop8MYEInr/tJTi
	wHXqdLo+V6ZymIOurOf/cAUVQjCgAAVyLcm1Z6S3tEU5dFr6+yCMzk6inHJtscRf
	ezbkekS6a8Yt2rVYKEH2KiW1euTnn13OV5OoXCipn4XVprh8YRUFwXQ4o7Fd8DKM
	lWeMnKwLlnAX9gnTS0c8lnItHI0rx/40VsUF2QvsNrd2LYg0RTcw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4j0ytra9x6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Thu, 19 Nov 2026 04:42:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ2Nf7V535094;
	Thu, 19 Nov 2026 04:42:45 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010038.outbound.protection.outlook.com [52.101.193.38])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4j1r9ruk2u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL);
	Thu, 19 Nov 2026 04:42:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b1ewLoH+EoAr5ldIWzVJUshdia0+tFNmyOBjylQk/7v6/GI/k4V4kbcWPU/ohTLvtov0xP8eN2nmFkTo5PZyOP+crIbfV0s46CIp0/oe1RVC8pEAAjHCvTomqtEdNwfkv1owYSzFAbpVBuyhgPR4DOk9MW4+JkCGPTvZqqEbIrYXa07TARDnC7/djaXuHCzeqpX4zFRSpNx0owYZJbgx3QerqswdhZ96Wfsar8vzVWjWmwKqlsiqc5di3MQFuljfsz7B4bOn3l7bi8zgvtsSiMavHtSMalhUI9wfAZgSd62LTHS8x/I7P0tanSgN3e5mOeyTuqTsehdnFDSXmTZb2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPSUqSDzZkDoF3sgTZnOehjsq/iZzwtZUfWjzfWk70I=;
 b=W+GS2V/aVQNvV9iZ31jNLReWO8ShwNXcGjFej9Oc3qNkIVZ5i5pw0CfzgoHYGZc4yg1md7nfUahJX6VzQwoMO5Rn+4F8mQVbTHakH9mj8aStcuOOGoMeD8BQ4dTldrHldtzrKDkR5tIaHGJ4xgqi/v/FBszOVpee8chFPsjNpmbVT5E05DCr3CrKn7z+RPo+53u0Mk/ZPGmZ4X1K8ZKcSktsYX8nK0GARiCj5kdbKirSinfHiZQWrnqT2y97/b5YlrN6JRYa9YMQEggW6VpnSr7Dv4Twvpx3w00c6jDoBZpdROK+maFx6Yf9G4Z+PKB44mWkmF1w2L/OKFTU9V6HBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPSUqSDzZkDoF3sgTZnOehjsq/iZzwtZUfWjzfWk70I=;
 b=qeHLPUJcHmn/zhxhhJanyIaEUztx7nfRvVLYK7OLLObS+uyrIAwr+/QFJo+1rDs2Mmlu2CbzA5VEe3+evOcJkCMk2fHWpgIqMwGuVmyJgEz6LOlao30P/SFHrni0ZXMWBqvv88XykxJdlwHnfJuYQ4DoMz1Uy010L8wHB/KxxuU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS0PR10MB997552.namprd10.prod.outlook.com (2603:10b6:8:316::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 04:42:44 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 04:42:44 +0000
Date: Wed, 18 Nov 2026 23:42:41 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: ealmorshdy@d-matrix.ai
Cc: dtrace@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nix@esperi.org.uk>
Subject: Re: [PATCH 1/2] libproc: fix readlink() typo in Psystem_daemon()
Message-ID: <av5-QbziRJgOa50Y@oracle.com>
References: <20261118-b4-bug008-daemon-readlink-v1-0-187c9eb22d11@d-matrix.ai>
 <20261118-b4-bug008-daemon-readlink-v1-1-187c9eb22d11@d-matrix.ai>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118-b4-bug008-daemon-readlink-v1-1-187c9eb22d11@d-matrix.ai>
X-ClientProxiedBy: BLAPR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:36e::28) To CO1PR10MB4769.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS0PR10MB997552:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ff67c64-df84-47e6-234d-08df45f78d38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|6133799003|22082099003|18002099003|56012099006|4143699003|261026140227099003|261102123227099003|261028144727099003|261021123027099003|261022105027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	3FR8Dy0KZH9Sf+FXSZenpllelEud2D90CsiZ4e8n7x9rqHYlOXgKcooAiiA9lqcdxWqlB+W7VUIgSFPa5UBcp0YiETQHsTWF/dWJ46qFYlPk+36iav1IeBi0bNGL9szXbANkEPXoU9s5uX1D4pHsMSsHOIlJ+29BsUTSaM2OAqLSfBHUstnHnE4ff5oLX4IiNksP9WQqsXahFxEsxDV0FAntTuTZ/XsxOy+vYLoGUpxe4WAwusGBP/YBi6lsvE1Q559qP5I3Ih5+WtTvHSUEi6iucCiqF8N7JRPJXDMNRwW55WK9/8Xr4fjZTcDTol5lvCB/6NMFRZnP1du38W71V4YQhk10y1gNFjaMNBRGKfe1jt26FHTZvZ5JgbwiBR0O6lRA+9Bg77b4qfkLhEBNdRhFHNwJg5oYJATdpkUmuEWnwXIdWtg3E3MTk0hzWmGnYW1NBKRsDFFyn8iyxrR0X4Iad3t0IJ07H9U2qbn468lTe65g/iHghhP36UulzAEjIJbjQ4SD7xePXWMcUqH9WPIg5GoyEmtivWDqdQhflmh+xO3V6iTryBKVUTQnK4R9J36u+FEessLB15vi+qe9i0zKst6OqMxHysLR5SRLVcKnE9tTN9DoJJRyFzNn9VzgFhhO/9uUyY1dElxUWcyOaLBnwSd2zgd89q4/wLreGmg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003)(261026140227099003)(261102123227099003)(261028144727099003)(261021123027099003)(261022105027099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E95obBTrxojg3dVa6/ggxSkzL7pMDIoQLVF9jc3NhO3QZWOBYyOeoyduqI0w?=
 =?us-ascii?Q?8m/FNIWk/guU+CfvgWUY7m+7JruNSLzDZaEgeZtpjZaLl6NnWslV6POZ0YWb?=
 =?us-ascii?Q?vtpEETuL9MJRrYMwUb6CElv0YBWrNaZxJQay4leWfJ1xfY+PLHXj6XJBAzhm?=
 =?us-ascii?Q?xUe/Bekau14yXG3Go2SX/XPAmDwvqteuDJlfj0eZ7vs0xS7wmfwUlA6tSsMa?=
 =?us-ascii?Q?DRXL00sRgZJfRGab8WniMMlSKnEByyGcQq7ZxnpMjT47/k/Ggwh+/grFmLTV?=
 =?us-ascii?Q?PO5SiLv4a845UFGG+Xu/9zgtrcbIrQfIBKJjyc5tyW8zOfOjDUbkZ7YfukQf?=
 =?us-ascii?Q?VbQAzeO0mtiZhJCgBAMUi9dZwcpc/1FsucKDOIZOUq3qumZ7xKGx7isik423?=
 =?us-ascii?Q?bZzBBeJ1w4zNWGT9oNkWqCiGRFOCPS1ueSSJhyg9WZXtQ9YtFHBw2j9gqAo7?=
 =?us-ascii?Q?Z9wdAupChGEI1d/cVDN5inV45z888dFQaRhGSTVnGwfOp1TQTP4Z1LNW2Dwl?=
 =?us-ascii?Q?G9SxZo71PtYzONHt/Ukb8dIurjDVd4mzykxNMAE5Xwl8liB6bBG3ca+lcc1C?=
 =?us-ascii?Q?iYlVDYlpvlcU/LxwhGu342EeCO9CCKv7Uq4ICuobkSHpSSTarz9kocGpPm6T?=
 =?us-ascii?Q?0JNTm3cv/rS6ovjsXQxUKzFIqmkPBZS+7jEaQrHMmqQFpRqzGdVhxDMVAUrv?=
 =?us-ascii?Q?2zsXA2fucAaJgu/k30d9bfs07VZsYaSVPEQh89XVDLMVXpwsSEdoj/8sGMUr?=
 =?us-ascii?Q?bg0nQLRlNqmTVqKq1FuJ+PM/BaYJTyxfavdpU3Xf/Qdpv0WkIrsg9AnSUFPE?=
 =?us-ascii?Q?ugp0S5rDu7mW7zbzTSPysJZGUy2RoPxU53xYfxe43JGKZRWgg45Z/XZg1gJ4?=
 =?us-ascii?Q?1ecVvSoVB7Rd8B/NNA1L2uC/GXLK5EsLH3W40PhYgBpPYaW6Xyo+ku/86qso?=
 =?us-ascii?Q?oL6I8zOXMN+nkatWR7zPRkb3dHrd4GriayYz3AARwNCfNOO9vApE5Y55wxfg?=
 =?us-ascii?Q?c1PmdGcaYSZXNGytPqn2Q4d1GOJGTXPr2kTHDa0fDS2CdxJPmQIRTHGZxnU8?=
 =?us-ascii?Q?erlA5REREGCMOA3cGEzrVOZnFpDXCFc+yAY/XC0T765kuTZ6V8FgEZkMKUoH?=
 =?us-ascii?Q?W/Tjr06wCEW1klls1dbjzDtnlTTxXmXwkrN4zEyPgG3Y7QP7CPTXYPF5z1u8?=
 =?us-ascii?Q?9TDeO0Frx5bpzOSEjptksLT08Gew9sMOxY3TX+GqJh6dtQcYLg7TBoFTyTMb?=
 =?us-ascii?Q?kfPqxf0p8P9IxkwtqSe1BWQxmJ3/ikS7KTNtQoNVVAsxxjmorALPuciEekzu?=
 =?us-ascii?Q?L6+IEL5Knb8eYeB4I3K3i+ENNfkwfKAf0ReN2UBs7taaNuID8QJD8Sd5aGqT?=
 =?us-ascii?Q?wlaUdKHUzUSOkG+AfIBX5avtnip3Qc2oy6zybNZyUTQRTqOv6hUthWT3mgZR?=
 =?us-ascii?Q?dlgersC0NuxgTCD5dKPnsTp+n3nXNnQcYzUz75/NeUj4Se8v+4skKr6HjD2/?=
 =?us-ascii?Q?Ly5J69udbwJt0DD8thHFUHlvjK282UmePqeXr6nizH1wl9dTXUrVdhqa6eNy?=
 =?us-ascii?Q?RcJzmj+I2NrM1EKmfIoJ0d4Y1RDS1qy5l7id4XuIpwJSZU7z71emAzbKhQvw?=
 =?us-ascii?Q?EEa9i3YF7rqOxl3egm5FyHyp3/WwFt0ZWiemxBYAoNhcPhUjTQSRn+QLaxob?=
 =?us-ascii?Q?H/v/rZ5d0NsICWg/jSxKyHlUGzsurpXuc1cRDUj7Pt3mB58+J8WtGrmaZpZg?=
 =?us-ascii?Q?UqTFuXi/3w=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	IwWNKDKKxFVHMrBQzMz8TWNQjnu21sj1BVnNBngg0+zjq9T2C06DyaWE2G4Xuuo5x+9IJrexYt8bECyIcgITICTFXdmpKLfYgjKDjbdKm93JFu0a2SmvmcLYvjqTzJQ/jRlcnC678EZfLK7zJcPEhYgTedQ/9suMmHfh9usR0sWbqcSK58wK5jYzSgupzYUdYyKjdNBCRXXhqTp+AKy51qRZix5pKQxFkgaNY6duJnHTvOogdtn1DDvbWS1ipWLeQRW1MVIEJHK2Q8CTEWtWk2wjxW6MRDvXtX73P7BMlfckX7IP+/dTzkcC+JZlQVs6Uyr+uZPqVtpVYB66hJ2S1g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0cX84LPlhSqjPEn8TvA+KaDCeA6h3qy1+at1lfq760Y5h4gl274hIFAUu8IXNvvUOXmSCdZFjpORRDJXyHfnh2C9YS+ssvpJsHrF15/9/fXgMu/tr7INNB+ZV2VTjaEuUTWCVAb+WmjygXnfk0b4BducNGa2ojB/EkLXnNVtP1A8+sFvdgd0+zAtqPyyjT4PM+jRb/6rRXEk8pk7W5dYDoxynp7mVcGCIQ2B/fXeEYh/GJd0OZ5uVb+XIVLLbPCiFXA3oWHu6XoY/qxPFV4SJoXwIWy/ATyeqcwbqEqagxP7YSm/nohkC8En5RynZ93dyQBJ/1PDl87Zzd3AB8tth1rHsINpBj9xomGYkinRAAatOcI8oOveS5NtBJefKk+81Hl+4WwdClDgXJTxnX23s/Ent6Ktu5EB5NsAWiEiywKhxWnSgeS5d5Z3HR2KdP1wHA6zv0jp8n5PztvIo0YGw326wIEXdoDPPUac+jkVEKXKCW8hIxbKejNvx/aInx21eirTZSKnXJIIVlkzmHDw3hX9dTFrTAj50dv8BbcB6NGknHMAU6ykZ/4lYhmn7yGWOiF5VyA9NAl1NOBfL9M3v0Kmgp1hL9QyLLPB+75s5+Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ff67c64-df84-47e6-234d-08df45f78d38
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 04:42:43.9986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gwVi4KispJjHHb2HPijX5OKkyAyvMuYqEoYeMN/88+On9nn1PIDMtyd9Nt3ROCj4oLndCktB7kYkspirAfPogLwd76dPQdRIVr5xKC1PmlI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB997552
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2611040001 definitions=main-2611190018
X-Authority-Analysis: v=2.4 cv=f+Ldl+yM c=1 sm=1 tr=0 ts=6afe7e46 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=7Gl3-_t3PgB9XO-mQDs3:22 a=yPCof4ZbAAAA:8
 a=6BeKcG7klS0i0e1DYe8A:9 a=CjuIK1q_8ugA:10 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-GUID: dDNM3JPduVqIG2IoIQp_R-yYE5eZurx8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAxOCBTYWx0ZWRfX3eFtcSasIHGI
 tZXr3akG7vnPXRoj9ZFz+4Zsm+5JnEiMXs/STOQHqpgxpISstk87h4t5nZRC1yyIGOKF8GW+eJo
 HkNhjWxOfohBZOD4uwcquiY6oJVd06RpjKxS8hBwsvCWM0fkujI0TBZj/bXNI4bxuYZNiO60jM4
 W6joamUS+KXrG4uJ7sOFHBzQrg5R5On5YxIJ/+uWISUXYY57tptJZ3U6EmANxwKJ9L8kQ9rV0tV
 N98FFvjG5yvIzneBGuD1KvVyqAYsZKgz37E7n5mdgRCyZh0QW/w3QQV6+dsJ9Doqjgcl3Siwta4
 iqH+IV+qWm+R//ZpspT3U6UlJtC8wfZkCOWqA3FNu29JN+gqw+IK4WCKxKab36A/epkQChXG0Vl
 3/H6VUWENjY71lugLwiRzRjUqVpGE4uaEgfqRg+ylVMmpDwpGvSXFVTr2b9ZukEx3l+wAVize6m
 8uTb5skoBdqKBcFaoSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAxOCBTYWx0ZWRfX1X5ACTiPwXJZ
 c8c9MggsJjlazXs30vf9nX1sFK4VeiHpQVIb7JBNOhrBPmByKmxZaqwD3MimOQLgEmQApueYr/D
 sXi7Y0+frM+v6u9RIMatmlFsx0pseYGQTxq2Gu4P5u5lH0VZ/T6p
X-Proofpoint-ORIG-GUID: dDNM3JPduVqIG2IoIQp_R-yYE5eZurx8

On Wed, Nov 18, 2026 at 11:25:04PM +0000, Eslam Almorshdy via B4 Relay wrote:
> From: Eslam Almorshdy <ealmorshdy@d-matrix.ai>
> 
> readlink() returns the number of bytes it stored or -1, never 0, so
> the check for a regular file outside /var never ran.

Thanks for finding and fixing this bug!

> Signed-off-by: Eslam Almorshdy <ealmorshdy@d-matrix.ai>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libproc/Pcontrol.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/libproc/Pcontrol.c b/libproc/Pcontrol.c
> index f8440d5b..ece074e0 100644
> --- a/libproc/Pcontrol.c
> +++ b/libproc/Pcontrol.c
> @@ -3045,7 +3045,7 @@ Psystem_daemon(pid_t pid, uid_t useruid, const char *sysslice)
>  		 */
>  		memset(buf, '\0', sizeof(buf));
>  		if (S_ISREG(s.st_mode) &&
> -		    (readlink(procname, buf, sizeof(buf)-1) == 0)) {
> +		    (readlink(procname, buf, sizeof(buf)-1) > 0)) {
>  			if((buf[0] == '/') && (strcmp(buf, "/var/") != 0))
>  				return 0;
>  		}
> 
> -- 
> 2.55.0
> 
