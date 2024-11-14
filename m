Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C301EEDE
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 22:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731621693; cv=fail; b=V2XfoQfSkE83OHzP3ARgCEvrupBipHJdASkdm+5jO6RRCgdO+Ub72jiR536P5GQ6BX2h6DAmGJ7kndakqudq3M2vJUqUmnsY9uGXSg09QnrASSYxNOHKb0sh2vz3944fAeO2rVe/dRep0TkiXMNrFN0Y4V/NXZ/OGd/JZDXTjyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731621693; c=relaxed/simple;
	bh=IZ17XlTmoYmp/RxB+cYepZyQtkIcbRBm9KYu/NfU1a8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oYtQJ0DoTCwZcQ+TF8bVg/bPafaGMnmodyMSrNLc9AAe4TkxBZr/h2aObBGAtyNgmBuLcY0bJbj1qdiDgyPcOqgMRB0ZC6FZlwQLHJSQQco2MPHO4LiDUF1KIGdwq7VUdP/OxDeKBHkeEbUVuhmSJlnZe0b8rQ6SF/ImsYXl4JE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=R7P1MN3V; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ietGpLhc; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="R7P1MN3V";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ietGpLhc"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AELfe42008029
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 22:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=xfxe0vTUBjt7FdRs7Ud1CRPtaJMGlVxYPrqm8CKF0Q8=; b=
	R7P1MN3VnnkU/urOvAXK83z8U0eJtFoY6zroVzrT/V3oq9QxuvHcnqX2e94p5zPF
	6ggqU8xFpi+NgkwQ3V16LWpeEFMoNtjZbjwgutcg2hSgv9AhgCkuI7c2FNWygtet
	tVOSlr0BPrAXN2v3mbrhj+CG63F5+lcvejJdIia9OCjsBHBNxmYeIQ6VMb8Rpsn6
	b/7chTkP6kzX7TSJbb65JVON3qJ/u0sYIB8vwky+YlbrHJXuxjRfJLGP5DkBGDPQ
	TFNGtQTEYKabRrD92HgEnSBg/qORsu5ojSmC2ZTKArZfvEeoSnX4f4vQ61m9Wk2s
	sn9js2kz3F9oy9+PEpVTJQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0mbjcw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 22:01:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AELVFSu036004
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 22:01:18 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42sx6bec29-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 22:01:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jo/eFGzF/E8x/vOvoyeIHfChOjMwocRmnuxJTzInVydBQrxoldBMk5U/Ls1kKV3OPTYF9M/h2uWZ4abJEy7t7S1FeMMoLNorf/czv5UHGOHQb4D9uFdb48Uc0rKYv3aCLmr1CcVm5QEh7XgKsPdqOOQmlx3MjarcRxuWmmQhtvD5Uwy4TRwNOMADpxDDUZwInbYKiJt9tQnwJFAAD329eJCzq0g4szek50utawXZ5MGmaVEiMjIMIlLlcwg6neLMBLSO087aD6BEplQE5PL9HggF5o5wtme+U+Rf6/x6/Y7qnOQ0Q5dGQ/xWdbvS/Gxp0z1jypSO03q+SheQRR2/RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfxe0vTUBjt7FdRs7Ud1CRPtaJMGlVxYPrqm8CKF0Q8=;
 b=woQCt0FsVqIq0F9atsDi9HSDybr69aB9FADxe4ptcVUFaJif6x3sVYqTpjWSQKfJIc5H1IX99ujDOXCPBbfxo7aONmA/6bBwELlZDcWKT+QJL4V75DHjZ+2vMKpIicZgHz+1WkEWyXkoIhPO8KnSbP/EWRrNLk/dkGol72ReSwERGKtX2/buJGgoM7vsCWPt2PiPGEg4u53BO5yJa6EdtBUnjrk3cnA+nC/ledUM+vn30BYwnZjUwsz6pwQho0LuIHoJCGwmtK0B88zeGecoKiecF7RJukElw2c6CmCDsthu4KAM2H4+lhyvwIC7ZX8P9xIpEmupTU4g2ZzQFjJU1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfxe0vTUBjt7FdRs7Ud1CRPtaJMGlVxYPrqm8CKF0Q8=;
 b=ietGpLhcJycKC3j7Sfuey9B/UWvNm1VBzJlBjyfNWKYAUz0JLejxFttyYLccf/N+9L8m1+S/27sgVOqSia8epvaEKtIWXD804dgebxulBbjGZZiZoW7MkW8mBdXnTbtDel4bvREyM17mABaLsdemiI8yupjNjo0Gb+R/vPQeDsI=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by MW5PR10MB5873.namprd10.prod.outlook.com (2603:10b6:303:19b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Thu, 14 Nov
 2024 22:01:15 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8158.017; Thu, 14 Nov 2024
 22:01:15 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: eugene.loh@oracle.com
Subject: [PATCH v2 2/4] runtest: detect coredumps in more cases
Date: Thu, 14 Nov 2024 22:01:06 +0000
Message-ID: <20241114220108.95647-2-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241114220108.95647-1-nick.alcock@oracle.com>
References: <20241114220108.95647-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0450.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::30) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|MW5PR10MB5873:EE_
X-MS-Office365-Filtering-Correlation-Id: eb4b5b1f-4db1-4f49-e1c4-08dd04f7dc49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j4hCA8yhPDmdTJeGHEU8De6jSFQf/czDdWB/O80MpBjvRitroasjN8LKhEBb?=
 =?us-ascii?Q?NXkzFkVeWfMxi6MnjgIEvDedCou2VJhkowT0H3GYq/D3/OxNy5s4lvum4+hO?=
 =?us-ascii?Q?x1okUqDyZN2QXuZ/asLgBm8U9/zSf9rzdyp2KwEaRn7TkFm3orI3OtanQU01?=
 =?us-ascii?Q?uWzG0+vErOP3hTh1fjRKEHOJS94orBlVrHApgfAVtRY1ERtJxp49iHNOuQou?=
 =?us-ascii?Q?IYfIKLMYWb1yzO8UGKPhf4v9kbocWqkyR2W5k4GQJ9gIypOFZL7dTXQ6V5Bl?=
 =?us-ascii?Q?N2VN2LOfipnnepaLzdpRuV2sjU79WhBvSGWOhcd0bX6UBtiSAf8UYOxU2i1i?=
 =?us-ascii?Q?r/CleZ0GvBlUYnD30ImJmxj4s5ROAzDXgvXSah+EE3JrvJMIALuezpX+mLvX?=
 =?us-ascii?Q?8ddxAqNRLFNIoMx21FxIZOaDt98y83jd1l9OQ6VMERwyRSn7AggcBksd1+Le?=
 =?us-ascii?Q?nV3CdVPIXNoPWQTyfZ2DqMpuEGEf4+nxnvBcRCiu/ekAZAvfjIOw37LQxaI5?=
 =?us-ascii?Q?NY9HkPAYykPnpNiElOE+OabvC9eJFUysoL05XXK2SpVIm6mCmfocEPlayZNf?=
 =?us-ascii?Q?N5W4P1m/RcMfVbjy247231Bb8z+1ZqdR7JYXekwH0/NAL8QpvB5uR+yJhO+J?=
 =?us-ascii?Q?5UT471x+OgeCoP+PB96zqQKiMdBvpN/CdXCu+W5amxO5ycGOOOIY+jAqWu7K?=
 =?us-ascii?Q?y/AQheLyXoJcDa2UTQ+5Uuwi6qjAU6lcMGB/kLJt/vu8s6h+4MzgGtsdOAS3?=
 =?us-ascii?Q?af6RgMdmaMDndrTJ9uceA+SXFT7gcAb+KSX2czE9wNX3Sh9v18RRaV3nS1wO?=
 =?us-ascii?Q?maQ/1mla2GF6fOjl9oYjDcG1hnUDkKdismSgqsoJhPEZVwQ9WUR9X+VIV0V9?=
 =?us-ascii?Q?BaPBb8Cwn+X34b1x3RQwXDF/e0zq3TgavrRqbDUUo4Rbqs0JXBFNtMtpbyX9?=
 =?us-ascii?Q?yryxysbUeVstdbcTzOkxVcCi7EajVXYK6Ssy01tK0pv3b1vw2F5PEB3uokOR?=
 =?us-ascii?Q?I3Zbr5E5n+IzS474YzpAzgOkwPFkWIJghRdgGpW6Qr/DtgWB8qcS0tkBO42K?=
 =?us-ascii?Q?Ou/M5czaEIJZ18rbMFrURNIW+iY+zD7pTkvv9F+OROXIBBIJssdTXWc8lVHy?=
 =?us-ascii?Q?aS/k16rGwgcTCxPMp9essuuz5pKYnp9Q32PEu+hlohCpM6tH/yt4RoShMs+y?=
 =?us-ascii?Q?fSrg/J0DsrFI5fMfH5Jk2pNARPdUTqHNnUWZShh6lGy8AGohmkFQIawEHtfO?=
 =?us-ascii?Q?8BQF7t4Eb31A1dZByS5ebnl8plF6s5bURkP25HAZEdl18tdbVUlN4T8QZo6M?=
 =?us-ascii?Q?CCmWEKFUHkrYxAYg/ofzjioR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OWWjZxThIkSdGCUQ1/q5k1RJVCHNKAH4V1+SE60NPAW6FThZ/ULlEX4jw32F?=
 =?us-ascii?Q?ujvM7pebmXYrSW69EADHS+AoP69gQNJWCjaX1WgEcYwzMVzt46aufBM7PTRJ?=
 =?us-ascii?Q?gNch3y3qxkyaNdC32ce+7nnsxLK0TBN7Bt53RwzT2dyBomcxutBsqDPZQEun?=
 =?us-ascii?Q?rHYjwQOt/b9HEfiPUu87ZBeCDXiWzxKMQmLesAIu7c/0xJjqGGqkkHjfItUd?=
 =?us-ascii?Q?7r2AcC8Oz4LboFPImeeQpbek3b3EU3Akh9vhwu7Rkzg/Pj8pvxnX8QwdmxFh?=
 =?us-ascii?Q?aywxkhqU3up80nDUYRveNRQ0r0wCoXGuM+vfUG3FR7uZXthCtKTKi20S6xMh?=
 =?us-ascii?Q?zHzLMOBfv7bJnuxOhn9yvNfemuA6XwFhW3XbJtTkUAtxcdp1EVTmsB9IEgNQ?=
 =?us-ascii?Q?8BnOnPDolKo9rpReeXNpNL6/+ZuGCXDv4nFDFs4IUL71OJeKCPWLsDjnHU+z?=
 =?us-ascii?Q?EE1SAU0ugvKCDnuNHFquMJD/d0WCOMWCVV5FFKeYMb6sZyUGrNBMBBJH4+LV?=
 =?us-ascii?Q?PXvXCNclrGIcT6zaDfWvkfyYdH/omNchQe7GyUP2/Xpa9f0qmjuyNVYpdXyR?=
 =?us-ascii?Q?mD68BEQN2T+xa42QA3LlnqAwh/D7D3Sgeg8rAme/s+H4i8fovgszDBqPWxr6?=
 =?us-ascii?Q?n5vIghGOLgzkgGS/z69ybHI6laKhldXYWSNGBUZ/lXWlVNsEncivfqgDTDBb?=
 =?us-ascii?Q?xs5HL9vPXEsOlwB7uE8CpeU9YQdQmNfTn1BEHXnXM4gFPiJ1LSRhTMq0DnYh?=
 =?us-ascii?Q?T22/Z6wyxWZc8czEaKrR6YxSAzJHuntYsH/ckv7rKqOMzZwlGWWkPTePl7NP?=
 =?us-ascii?Q?ZSQQFXlNHyqMBVLpaOmHt4IINwFk+zoGva0R3d3JWLf5SBn1h+VkS0gEOrsD?=
 =?us-ascii?Q?XRKY3LJXI2NUZbTik9Sx4DATGKJyDM0laauKci/Dc/ktlR+ugjvgL/K5D860?=
 =?us-ascii?Q?lDmKjRuEbfE+R8EkK38f9yAQNglp95hWzFFLhs4USMMg+Bp9lm2v8igMyOsI?=
 =?us-ascii?Q?mgCMifvbUk90Rd3+d0D+8qfL18igDP+PzMSYXqlVPhcf37cO1uBJxsfKaiww?=
 =?us-ascii?Q?BlAfeBNmQFIzuuwcXr1uAcg1A8h73EgL5MpsltX4QOZxoUQj6LWrOdWqoINS?=
 =?us-ascii?Q?6f4FyEH5noDLCtuD3J5zQYcCryt1xj1by0j/G7JLfXmSLgZ61Wmzzbei0ooa?=
 =?us-ascii?Q?C3VfGsT+aJtPf6M7Q0XL9yAhrNKJQpmz8HRs8BSwOHAwzcY3RrUYjv1Rbi0R?=
 =?us-ascii?Q?C2Ga+NAi0cEo+cp/rZbpkfJUI1rQfueOoMBLfr6vp/TWisZlzzJ7Ff1W9rsS?=
 =?us-ascii?Q?P5TS5yugy/WPd3vn8rQ0NA50vT1O8+0ZHxZ528XmQr/DhgTfacuu/KCPibYH?=
 =?us-ascii?Q?m/ZRXVI+ILxxnuyp0DgvzBB7rrUo+BsQZ1yUfZ/u1Oi8JtfP5Y2rL5wpInri?=
 =?us-ascii?Q?WHS4zwYm8xAhaZClzNp7ZC8FrLoZAIurNEVMcg/ZNhUShoG0WXZVlPNeKik9?=
 =?us-ascii?Q?Iyv0e83WomD11Bb5y/QNnL+bpzEtWuWeqqZehVgilR+1bgkyVpFAmNMESpRG?=
 =?us-ascii?Q?r/IhwLdqtsqIa6QrZXqTahO+Jd/ATOXm9UPQWAK8uQFo8Uh/nohZPINcJy21?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yxAD2NmM04dGwpwOTFhEatFjjj4WpIBeMQXTeJ8dPtaMkuBsVm6qCQgT6xFdduA09rzKRVVIWei6/4J04xQw7dMT3FAPWfYs5aL/s+9hVWxQqzdC9Th1sRynSxriv8e/DHJuz70u3qTfRcgik3xLOsgzMUuEhJx5RASFX5zFmUtRCjBI2TWzJW6TNGkXT0zC+7Gm4RIXyHaFfxjv2Zg02JZukhU2r3kKTjFCqEK4W9f2r2flr5BF+dPrnJsP5Nzwn5h0NOZ6TIPV2whG3cNEHrCcRxLRuz0guvfPr8UhxEeoQ0mihLeC3GfMHmNyx/0sdYwIvQfpzyhyoV/1J3jUTd1INVllp7NfX87BySRUdyizfeOsBrBQKaDvaW6THrSsTfHYbEldd/xv1/30PtD9eF04H3vQF4M2qecCx9+EbwFWS5z+Zmxh/Q7ic1dIJioISWsFYxVijxSz6vBQgxe5jLOazmsBARu+h6rL/PCLZU2fNE35I5aEA/T2rQyIEOyXzzJ8USuowyy9KogDlyyWs1YMgCQb+A8aKxg56sL23bedliQUpr5JslbSzjEGu2iI4hF+BXKpGhXLldcsa05X1SMa/4Id4gYY8RKYs8eGZq4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb4b5b1f-4db1-4f49-e1c4-08dd04f7dc49
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 22:01:15.7015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LV11PUvdX7fol9TvJzzvM5YWUu3blwdmPAsXP5KpgFnEMrT+/PLzKZIs9euuwvjoqNbR6msIdWgwYEPbdnp7Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5873
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_05,2024-11-13_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411140173
X-Proofpoint-GUID: PpYG8U-9UkJc25d3sHWuxDftdOHgFl5S
X-Proofpoint-ORIG-GUID: PpYG8U-9UkJc25d3sHWuxDftdOHgFl5S

Exitcode 139 == signal 11 == a coredump that should be reported as such,
even if we can't find a core file anywhere.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 runtest.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/runtest.sh b/runtest.sh
index 46b532d7e161f..94634f80c2ebf 100755
--- a/runtest.sh
+++ b/runtest.sh
@@ -1361,9 +1361,9 @@ for dt in $dtrace; do
                 want_all_output=t
             fi
 
-            if [[ -f core ]] || [[ "$(find $tmpdir -name core -print)" != "" ]]; then
+            if [[ -f core ]] || [[ "$(find $tmpdir -name core -print)" != "" ]] || [[ $exitcode = 139 ]]; then
                 # A coredump in the current directory or under the tmpdir.
-                # Preserve it in the logdir.
+                # Preserve it in the logdir, if possible.
 
                 mv core $logdir/$(echo $base | tr '/' '-').core 2>/dev/null || true
                 find $tmpdir -name core -type f -print0 | xargs -0r -I'{}' mv --backup=numbered '{}' $logdir/$(echo $base | tr '/' '-').core
-- 
2.46.0.278.g36e3a12567

