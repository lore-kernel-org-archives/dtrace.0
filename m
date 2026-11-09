Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794255062;
	b=ykbJffLyj+Nc+7c64h5tVh95Xoh0GLq+EYoYGyjuZdTgeHJ/IgZ+B0JL5XU+oLBHWMnj
	 lUN6Q+X8hkUjcWUDRRztNSM9iMXN+akhMbUchPK+LQ8DbTW4fm3CUkRoBaD0/mvqA3Ugx
	 f272hj3NiZ7vGmYcO0cbso+iSyBAr4ysvqMbim+hWVWZcmODeDRk/884sUrRRU9vli7ME
	 jlpE6AXwTHWNz+nigqL0OH7pLgK8ES8tnZR7zimAdGve4+/6eqeEBhPyxRYgNx+rj/QgU
	 GHGTDFG5DwG5XiTEC7L3M9jk8+qfhhAsnGW5n081/rOq/eKEsGXn8xGr5GtbNLrfYbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794255062;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Subject:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc;
	bh=dfQINx3P1e7xB4oSC0By/zIwi2Sc6ufHUn24b/XVPpY=;
	b=PDfqjDh8YwkJDnF6iQFuk1Ov5cJDLRtlsrHsw8TNmp9WTVj5he7lSlNbKpWDhYY/FaI+
	 4GDvNVna7odvkJht78v1tP59VhPCDxubiVdLJhAAAJvb//Z/3EtjggUpbDXztIc7sEMu9
	 TFDBB94hhniza8Q+7+UzOgYnQEgNoLQ0ZmQNT0DOlLJyp2z9JYndGauf7ILeS9omY5UV6
	 ftqzzH3xu4WrsHnDvsyjLGCpAzyuQT1vJ7wzGsd9cjSvkJ56r9E8+0aH/FcoLBgzfu7JF
	 qxtV0CxPOr4sck19ylRcd6VgSO2beM2j4/6fCRXY2ebDs1Xd8qlr9zV6gPl5soG6fPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=cFNtjFB2;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=CJb1AWLF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE4A606A31C
	for <dtrace@lists.linux.dev>; Mon,  9 Nov 2026 20:11:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DE4A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=cFNtjFB2;
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=CJb1AWLF
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9EH2t42381635
	for <dtrace@lists.linux.dev>; Mon, 9 Nov 2026 20:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=dfQINx3P1e7xB4oSC0By/zIwi2Sc6ufHUn24b/XVPpY=; b=
	cFNtjFB2fU5nyoCdAh6TA5Yi034Pg1Xrbi8TwtG0qhRfJPiGoOpx4rngR/8KBzvy
	SMkYsQ6NFSihrqaaqOEjYBol6DHSdM50Sy6T7I560m+WWoZBI77G3W98HVpbF/D4
	kB3oL8lb8tG8elTwpwZ+NH2iJleYxocCwUfFKaE7ba0zUNuC3vB47ubjBOGs6Idz
	V9Lj62hYyfNID2wTRZJ3lfinCqIp0yscfThLiEUWTW7ZloBit39v18vUZkAukaGi
	8GrIdN0KDtlM2a0REqXGT/nAZNAVzhup23OYr0YFI+rTncekXQtIy/gB07GaEDdL
	T69hNC9sY/4BEyedHz6x+w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hsukru0wu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Nov 2026 20:11:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9Jamn0554911
	for <dtrace@lists.linux.dev>; Mon, 9 Nov 2026 20:10:59 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010028.outbound.protection.outlook.com [52.101.56.28])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4huhxb6jrr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Mon, 09 Nov 2026 20:10:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LdpV4N8LwVHM1HIUgnseQDJ6lEAWwJy4fJQHIyhjHlfGEll/8V07kILbi2QOXsgO7LdgtI4wzd1p8THbiDFAG4Jxw/PpsYllprxtXsP93DDHDgUPvXCiHQEHRui5PRK/NvHmMslVgFxA4UlPcG1B0Vw9WYO6kEd990e/NaO5AuvBVtBvbOSGpEu3M1Zofrs+Gx+WgfL6ay23gASQT2LRBbjwQ9K8TovdNCUWRW7w9FRzXCF0jI2q+0eYwL3k+eyKmD1kipqC/8p/gXtrL0vMx/F4CKx8+hq7VGizd1UBTRhqipuU0pVqjmjmlerZgFir9j4rlfuXLHzfKhZRmr3Gdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfQINx3P1e7xB4oSC0By/zIwi2Sc6ufHUn24b/XVPpY=;
 b=bXGzNcnr5fDZ53+023IOQXC8e57slT+5a2MVC7VZ17j3khovz6Z4cgB1pUAg7HYdAkizk0R4GkYgc0ZFu/6W84RAyXnQQAP2xFqrj7sk/5ISbcGqzWaybbeSt2EGSFRddQA13Wm8ZPc3ROlSSEFTwyIgIzX/bosxjlrOa2ndTRVtmrNNvtfccP92VbybOdd9BeTP2QrCHEeC989RcRP5YZLtpqBbUEpg+gmMGwEv2KgI7PTKaXb/bSTOjxnewdbntNZFipAi5jWD41YVSqbuAGiP4NYImo/lvsMwsqnU0hBZe0RJNYBaMwnAW/KnadmXR0P09761HSJdqgxmZeeZuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfQINx3P1e7xB4oSC0By/zIwi2Sc6ufHUn24b/XVPpY=;
 b=CJb1AWLFb51fZ4zAUBxA+7Lj3fq8GcJtApTCx18+UhV8+8ABciYWn/cDc+h9rdQ9BYr4/FGPSBkucwS6dNOYn9b3EdGII+qdTxCiQl5Mhl5x/XXOu1ONxp/3ED7wBihY5vFoqYnss9eTD5yfQjUlqNBDz2eRg+tNVxYzjroRB2I=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by CY8PR10MB7171.namprd10.prod.outlook.com (2603:10b6:930:75::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 20:10:57 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 20:10:57 +0000
Date: Mon, 09 Nov 2026 20:09:16 +0000
Message-ID: <192dc1a5c9806037591b9fe47fca29fb@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/4] parser: accept typedef names as offsetof members
Content-Type: text/plain
X-ClientProxiedBy: PH8P221CA0060.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::9) To CO1PR10MB4769.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|CY8PR10MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: c7019142-3e10-455e-5556-08df3e9d90d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|10067099003|13003099007|261102123227099003|261022075727099003|56012099006|261021123027099003|261021121427099003|261022113327099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	8sT7BUBJL/prn7EtYou4gK7xOmPoUYkWwmqqJ6Zp/n5E/sNS3PyyUqgPv251d58AuMfnuRl7zXwmwqjHHBDpAYwvfDv4LCFKUev8cLktGp93LCavN3ejxIHyPJqVzY8tk3YG9+YxubNbagdWZzflYP22+E7GGOeEkY64l4m3pMjuouUEvrqX/uOybG9kWpi1mkim/hFOT/HX3cgB0I6ktJBFEve9dr3PXbHV+taE23JFU1Etql4ctowNDL86WSMfqeDcXzmQBnnyRg77Q34ABIWeNCawdHTHx19PMKYMxAs1tbKG/N8BqaYqmNdwQ8drndGSJ9eT6cchI1wRng3STau/IvFtfE2vEkL19DQV/mcUERHlIq/clQg3sqpUzvtRO72b/8q9y/IwkkQuFgDtqz+N+vReFj96kF5HOuXGu2QX1WdNEf5e1GA27opqRF6/RQGbzY1GK7s1TlMlyx9ln+l2oiSEI49z5T2x2raNkTTudcL816hnxBySEsWerS9F4PJo9ohTHQT7+bR15XRysIBdFe+xmFpoBUsIoUJxcHKlPwuzyeKCwEbIjN2zhMVdn4bFz6zBl25oLh+Uwk8/8l1XPEaVN2rL4h/l+wL9v9xjJSzeY/xW1bfZF/enDP1rE0NXAaR5rvZ44GTmOwApLd5pFjWTVevtSDOW+GQKvDY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(10067099003)(13003099007)(261102123227099003)(261022075727099003)(56012099006)(261021123027099003)(261021121427099003)(261022113327099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XsYC1CnHJB1h4h/SDb7tzVlYxbIGp2fhkkzTs+5EoF/siYd7JviiEYXrBsMq?=
 =?us-ascii?Q?Mqsc94hfjZDhx6Xh/3uG95Fmb7rf+4Ub9aLCgTfb4Z/fmE/iiQPCdJ62S70O?=
 =?us-ascii?Q?/bC78qD/OULoCcX5xkVr+ExfVKW2v1L86ZQawvRwGMSVEzjQJ+yiSPMnZbfB?=
 =?us-ascii?Q?riC/TOe+KIuWczcPr10yRcEDXN3iwgyzva5gqD7wfrgWVtZCX2PPuiy/AnYA?=
 =?us-ascii?Q?EztpxaAVkLguQ52lLJFhL82PTVwDGpUrO4+zfz9/oOiVCBY/X2LKHP7qkokA?=
 =?us-ascii?Q?rwZsk7Kczxrlq6OkcJn6mOPqptQCwvsb/bmkB8X40dJck+35vPBoSQ1z3lGC?=
 =?us-ascii?Q?XvO+JVsD2444Na09jM2dHTD7o4o5kWAukSBUpBHwcg62eFxCfV+/fKrK5gD4?=
 =?us-ascii?Q?09rUv126rgnXxlnpDaMgPikNgQqgyuiBOrIHlr+jGfB0S0L4Whhjh59ak98Q?=
 =?us-ascii?Q?tGf5VpPwp3C2AlH53tK9j0kv9KZeCOAw4XuNiRAiMrzic+qhQOYbrIoroFio?=
 =?us-ascii?Q?LB16X2NLP+sOhFYpGd0L+nuqmzn5e4XPIRNDeU3egnHV9WJEqG7vB7cfg7rs?=
 =?us-ascii?Q?1hKpeDGhD1TWppWSzlvdEbE3ZlhDRqwIwU3TZPsIdJakiaRNDhkKonREts0H?=
 =?us-ascii?Q?gBHYMPIoA+MAiRo/01EZ5xiXBWrfeUrinB8PazLj65OW+Ns9JkdHCT1s9G9u?=
 =?us-ascii?Q?sESS1PJAyW6HR5/Lqb3gSvywbCf8H0bsqHk2p9eQWQPOph82FGMtw2+q+UFl?=
 =?us-ascii?Q?JOPeNj3Km9Sj7ZT12aVhqTt9MoCQs/tVx2sA8GjBPkzlSO+AMTrrEfNuV87c?=
 =?us-ascii?Q?jBTuxsNRp4whtp6jwGmE8ndWaZvYodd/xgdHWDJvnxN1uFB9unKO8jEsjKpq?=
 =?us-ascii?Q?RrFWHNFrBvRYi7xrhB5cbKTwfIUNyvki9sM7JlwRl2ExOinPqP6tnGXNkpfp?=
 =?us-ascii?Q?ZiZ3h7DKnR0CRq4PzKQYqMAuyoUc6eLJPJm81v+27PDeAwUiIIhvaRdTxb3U?=
 =?us-ascii?Q?G3p+C9TouBaWTkpsORhNAI1ZLy79Wk9e/9HJ9C3OdXbCF38kwaYgzsS7aNU3?=
 =?us-ascii?Q?Q7OsEvpPhwQ4rgy3U2d5lyzNdQbQUwDbgK4dPGMf1qA08v8XoRX7v5fz2YwX?=
 =?us-ascii?Q?IHVyAr/axS40y3+D1DHbpp9pYubgsxz6zZusffJX3TIr6Jq/eZvrNXjIUaOq?=
 =?us-ascii?Q?eNSb3VCtODT/K7BH0NWm64dddB1HVFeKPXQlz68t9Wt8SYHmTNvlalVZtqYQ?=
 =?us-ascii?Q?X/MbKcnSAhmqiOJ7Q121vmtXhW+SWP15jghTjYAB4XpTHuioWtEIKUDHPaxx?=
 =?us-ascii?Q?UxBiMIclxPqvzqLfKRubugitq5EheQZLJbXKHie8S9kab6m3jq8KnE/+QRaP?=
 =?us-ascii?Q?le96ljqWu1gFb02XawyWbNuA2WBItfc+kHRw8wbLBWdXq3K3+ZR5L2TD2i+x?=
 =?us-ascii?Q?7dD6by627fSYurtUjrtmD3rtb+r5WO7qA55YuHqwNdboyMhfg/folORwYPhJ?=
 =?us-ascii?Q?PzDLXV51cMq/CO3gfO5zEUSiEDogGffpjKgZLHl6jkUK8uD85KRKDgHaUqrU?=
 =?us-ascii?Q?9CmqHj684M+NNo+xrgVrV2rAVf2VNLWt+2BbNcZu9wbBrqaROf/JU0JhSztP?=
 =?us-ascii?Q?syVrsKPJPdjCJgFFbSGbutxlldNm34GaAPxY7xav4K8oHelaVe0NzCj67uoo?=
 =?us-ascii?Q?JEsuhTo2YOdQQheW49ZoERq4FgWWKGBgl1hpz0u4LI4DDoEb7DmH28GKMSei?=
 =?us-ascii?Q?ixWnXmm73Q=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	4mN0CdP75whTs0JP0HvrdyYP658EGlCtHv+CubcmgWSBXrHezV4DcXAWTaqqpr62FatJNO+iWdseBcjYi5ACTvHoarAUN3jxsLoTWl5eT3Cc6s9v2ufFyPkpfG8o8Iax4qxXwWPneMkFCRpWldMVIoB0RUP9S5BaZ2L56oWhA7jSGH5MKi5TyB6kUar/gbUDOF+U0DtAJyfV9qntlYkiNX97MZDvSO33IGHyxfTGOIccYmh3RinVj2l5eozBPnDVXv5HB2O+wAbio0LTLzZu7qOiCdMDrOY4oL6amvtDutiEtioa5IOJhqWQGnHa+9IRVRR6wB8ovjOZ4HLYgBv7Iw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0TFgS40o5g1j4BLpueMmexq8+6vMzozRE5yPaCpfUnaDPWyWrD+rYnYg0QDZuTREPjtsZdLEb8OUvxdcsbH2Fs6V8/5whWJaCA2VICv0vtFd9sQ16bmcqPYuSdLey7V9LBScdT6Y7dQTAy5w/HzWBh7E6H9SC1vv44HExzZWZecOGtVmkivpqRrMGrD4jV453RCOxfVolpmZLtALZ8EJ26E3r3tHzbsG0dQs9xHgjcyfPygaaNESHjeJaCj5hRKabB604hfcqex2IvP0Hjs6ARjqGBYojwHp6oBtKM521BEgZhQt/j6rPrsBGVabgufEM3hNIHVnLnee9hD8qkpxIXB3AOFx7Qtc5t6Rev86eFZ+LVCe3rwCXQlVIUc46w0FJpxmaeG/ioiiyFitqYMzmA+KViZXiTBiQ0gTPLMNlPzImWCCq+1XXYJgQdsZiwUlwI39exKDG68XzNYEEw2KOlw8tn8SQfc+9Bae/YI24ggMmIQ2/vQ00UJ3PP34l4lk3yK3QrcdnhoIPDy56jjBucRYbLR1//Flwz5PfRjn+YzNtK7fDDr7CZIbuTMZAMaJTL1WUQMZPlBmryqXbRoKpacspTQDRHY1PT0IiG6YXHc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7019142-3e10-455e-5556-08df3e9d90d8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 20:10:57.1547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnIwSf7Mb2/QKsKC9euzwvpw5A431gbgRRdS+MGiUN6khBKyUDRaNuG/CjqLp7OQonOIUXgHJx0tcKTtyh1nwt0WQREAfQ/OBvItVWLu9bQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7171
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2611040001 definitions=main-2611090080
X-Proofpoint-GUID: rSudRbPBxg7_BTgsOvgk3TNVKSEPSw6B
X-Proofpoint-ORIG-GUID: rSudRbPBxg7_BTgsOvgk3TNVKSEPSw6B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4MCBTYWx0ZWRfX5jcfxMVfY/nJ
 mcteM0Smo9v1m/yx1LblqJk4J9TEKYY6vmyJHwW9fzaBy+rGgUutARjhgn+yvSJ2FvYCCfNw20/
 nlQvPPDfov5uwSWVxj4y4Yadd1Ju/yErexIOivX+0HTFxgMQ9ojF
X-Authority-Analysis: v=2.4 cv=TIPQ2Fla c=1 sm=1 tr=0 ts=6af228d4 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=3I1J8UUJPc9JN9BFgKH3:22 a=yPCof4ZbAAAA:8 a=EQ0WIsTDd1SEWdMzpYUA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12101
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4MCBTYWx0ZWRfXw5D0ep6QXr3J
 MygJbSFi26reUSlPfy5cBZN/4szf2wcwcjKzRu3iLC+HANBFwgu24kZAyz3lPQ5htwMlrcfSJnc
 0YSLcCquWyBpyUcSyvrLBzqEFn2rRn9c3pSvzQ/P5wW2JabzEzvQCvqwSziL9rwQpm71hzGRvra
 Spngnvwmwnj37GY+GBijg3LsVv0IZDoMPVGsrt670z9oF00f6JqRiUT4E7hV7tNxlrW+sjZOE1M
 MONFQ+U1COkzHel0o4CStmawI4UVkm74MLOKhWvpMaPRFRXDk9rRmOjmOVzLj+nI4gtC0PgcO0R
 d2d3S/+0WxKiZldCe/9XNfwhF2vqREucXWkAWQhJW5KYdjuol/dclyd1LqQn6totcGKl0NwNE4Q
 M5AyAGyWwVuWNvD0yjO2Qx/XaIvpq2NUVN7YKDKp4jTNTzdAXdJGgbpeggQmXQww7tSR8yujAvv
 GvC6ds06cHd949OvWo9XVFC4syNJe1MSvzpp9GmA=

Allow the member argument of offsetof() to be either an identifier or a
type-name token. Kernel typedefs such as code can otherwise cause valid
member names to being recognized during parsing.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_grammar.y                      | 12 ++++++++++--
 test/unittest/offsetof/tst.typedef-member.d | 21 +++++++++++++++++++++
 test/unittest/offsetof/tst.typedef-member.r |  2 ++
 3 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 test/unittest/offsetof/tst.typedef-member.d
 create mode 100644 test/unittest/offsetof/tst.typedef-member.r

diff --git a/libdtrace/dt_grammar.y b/libdtrace/dt_grammar.y
index 7984b85d..83feb9f7 100644
--- a/libdtrace/dt_grammar.y
+++ b/libdtrace/dt_grammar.y
@@ -1,7 +1,7 @@
 %{
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -153,6 +153,8 @@ int yylex (void);
 %type	<l_decl>	direct_abstract_declarator
 %type	<l_decl>	translator_input_type
 
+%type	<l_str>		offsetof_member
+
 %type	<l_node>	parameter_type_list
 %type	<l_node>	parameter_list
 %type	<l_node>	parameter_declaration
@@ -387,7 +389,7 @@ postfix_expression:
 			$$ = OP1(DT_TOK_POSTDEC, $1);
 		}
 	|	DT_TOK_OFFSETOF DT_TOK_LPAR type_name DT_TOK_COMMA 
-		    DT_TOK_IDENT DT_TOK_RPAR {
+		    offsetof_member DT_TOK_RPAR {
 			$$ = dt_node_offsetof($3, $5);
 		}
 	|	DT_TOK_XLATE DT_TOK_LT type_name DT_TOK_GT
@@ -396,6 +398,12 @@ postfix_expression:
 		}
 	;
 
+/* A member name can also be a typedef name in an unrelated scope. */
+offsetof_member:
+		DT_TOK_IDENT
+	|	DT_TOK_TNAME
+	;
+
 unary_expression:
 		postfix_expression
 	|	DT_TOK_ADDADD unary_expression { $$ = OP1(DT_TOK_PREINC, $2); }
diff --git a/test/unittest/offsetof/tst.typedef-member.d b/test/unittest/offsetof/tst.typedef-member.d
new file mode 100644
index 00000000..e3838b61
--- /dev/null
+++ b/test/unittest/offsetof/tst.typedef-member.d
@@ -0,0 +1,21 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION:
+ * offsetof() accepts a member name that is also a typedef name.  The kernel
+ * defines both the code typedef and flow_dissector_key_icmp.code, which is
+ * inside an anonymous struct.
+ */
+
+#pragma D option quiet
+
+dtrace:::BEGIN
+{
+	printf("offset is %d\n", offsetof(struct `flow_dissector_key_icmp, code));
+	exit(offsetof(struct `flow_dissector_key_icmp, code) != 1);
+}
diff --git a/test/unittest/offsetof/tst.typedef-member.r b/test/unittest/offsetof/tst.typedef-member.r
new file mode 100644
index 00000000..96366d41
--- /dev/null
+++ b/test/unittest/offsetof/tst.typedef-member.r
@@ -0,0 +1,2 @@
+offset is 1
+
-- 
2.52.0

