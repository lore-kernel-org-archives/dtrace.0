Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F2B9475
	for <dtrace@lists.linux.dev>; Fri,  4 Oct 2024 04:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728017721; cv=fail; b=MSj32DEn5G3zcUnPDmSAqHblwGZ0m8qoGkd9LeSNcyHif4SIKfC7N/pjvODg63eiLQSl2Q04U2OmGSNP1a43nsOVLIQCKwrXaoitV8AajqCFTzRI73j5HTeq0FgIvQb4p0w9jwatXivDMxNgHPgM+i7S6NOiUwime4kBFeJ3cfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728017721; c=relaxed/simple;
	bh=5OGDr0kq9bEj5udifJ0FCxY/gNqAF/tI8AEybG5sfGI=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=NfG5eyUHTu91f6ClPfTzLmdMy/bYC1WR/ui3WlBjRSxdImXnJmKxbXoVOJ9+cKhD42x57qvYKR/QGEPuEaCv/H5oZOGtx0G4fo5//3x98M/MoHQ+JuiE0VHepAIEfk5SR8w7vK2qS6Kp6RCJNcGn7+DXrR9EugVpLO7GP4+H+Uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=B4/JEiFX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=M4ck/+cT; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="B4/JEiFX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="M4ck/+cT"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4940uRVS019125
	for <dtrace@lists.linux.dev>; Fri, 4 Oct 2024 04:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=xw/Ug8xPJZw8NKkwXkROCQy9CtQBEHsd4B5S+7Xoucs=; b=
	B4/JEiFX8Nqc88wzcJjo9y5G6+/aK+wPuwUzNwY4mBYzuD8/vB4CXNtc6PjWOCwV
	Z6YTuiKMcdNQRTKZ6wgtzkpexgaIufMCzGEml9B8mCpZ9STFo7Qaz+2BDP9uyNgl
	2LHTSvE/Qf8T/QiFHXtqGbUP9kwuc+rqIZVkuiUmWEDd27mDxVIonB6xgbfjKjjp
	4N+hy9b4ovtLTZodEkLRvfG4brHzefUrkuwpA/xaL5JMU0qjd1R+vMVbsQp8IFYX
	VhNc44Ikb1zTiJxPqClhBT4wofCyXSbdJKP1v9eXtQI3cPN70L8lzMniZ33MdTNw
	gauvsccbAsbOqeDMOwPbAQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4220488u07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 04 Oct 2024 04:55:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4943qYRR037269
	for <dtrace@lists.linux.dev>; Fri, 4 Oct 2024 04:55:17 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2042.outbound.protection.outlook.com [104.47.73.42])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 422054hr6m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 04 Oct 2024 04:55:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQ9oBzeNcEQRSGN8kE5Oc+HBaqfFzPlkx7qJe7lesEfri7jBnK6/oK/x9cYe9ctuT1yaJgY5+d2iTscjRJv6jdr9yu8+VaGh/zj4jjiLI3NAK/jpXN8UyrER/QAwtRqgu4XsdqcR6Bc7cR5PaVMyEoCDdyB/zvetqfO7lfUEaphclkVJpu3pbtbHV/zuXYYMv6bAU3JbpV9ZZeeAI6dflejOTaRgCD8tRVflII+2vemosWmREqNchTJtCXGyK/LU78yCL412QS16cc2GaXFv58Eyq4vhFecoW7lbTBS5u4xbOgXPtKRwcFqlZGYk0EHXU55Wr9pIXJMzWSOkHhhp0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xw/Ug8xPJZw8NKkwXkROCQy9CtQBEHsd4B5S+7Xoucs=;
 b=h6lxKbHDkCDEJ5LD33QR3mU2VjWPNNnM79KPeikg25EXTkBhtw0Z9Sv00/eqc0LrAkNaYxyb1GO80eU7XMAM/9imin+8ldCH5y5WAUMt9JYGdU9aTTLNZwSwZ50IAXa/jtd34swOVjfb8nWgMMG/GmIdzhz5kFNdMADkqh86UqKT3SHtd5NY+PQDzukFVi5UWqRrS8qHrePeBMRvK6ATL3u0Ras7Ww+NFSr8vviW3ibAqimsTx1SdBtRu95alQ31LqDfOujiFJogO2H5Hltr3Wx82jvx5N+R3OU4M2K19RVA39tswDH2/s8jVcwYLKjJhjeZBDywh7zW7DR01RpScg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xw/Ug8xPJZw8NKkwXkROCQy9CtQBEHsd4B5S+7Xoucs=;
 b=M4ck/+cTGjToo3XUk248JuFn1sffqMFfl1MpcSu+3T9oWRBs2RsT8tBEAdtbt5kR40cOY0pFtSpBcOQYHc38IZmBOsU4QGfafmUGQgoqVTKvyigf3BSA1dVKjqqKe3KgczD9++Y8u3ZyjBYd5kpH29vMGclXMxrW1mp6mimJTMk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB7226.namprd10.prod.outlook.com (2603:10b6:8:ed::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.16; Fri, 4 Oct 2024 04:55:15 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 04:55:14 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 6/6] test: Add USDT error tests for -w and -Z
Date: Fri,  4 Oct 2024 00:55:08 -0400
Message-Id: <20241004045508.26235-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0616.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB7226:EE_
X-MS-Office365-Filtering-Correlation-Id: d62d9bf4-f886-409d-cc0e-08dce430bbd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q6BVVEORzIJYrIUL/FqD/dDkTf+mQxVvtHnFwLVFoffBcjCVGCCuSSbcCKeQ?=
 =?us-ascii?Q?VYr1kGOHxbdMZ0FrDTRGBU1syoDm4ZvcUX+r4vEG3BqfUCj0pQK7q1GuByzL?=
 =?us-ascii?Q?emnwQzv9ETWvTieIugDJstYVvDUnjh0ds68gDqcZNco1wr3BgQT3gi4WZrGO?=
 =?us-ascii?Q?nFuKsQ5Pbo++5gmSydcXu812HVD+o+oZzogQx4cysWOnYcszveYtn8sAGTRf?=
 =?us-ascii?Q?f6mWp3EvNNSW53Yp5IJGYwOOZvfRnv7IEEkYjl3YbgWnqiomKHaW0DTGgYjS?=
 =?us-ascii?Q?x3BK3SxH50SBMpqbdd3SRuB3um6DBQC4CcSfncg+w+kVRRbfRB7LFX2/RYEE?=
 =?us-ascii?Q?bvY5bp27zMl89phFwWr783FPs41ID3rpNn3VK1eJg+s/3ek9g8D9tTI75SnU?=
 =?us-ascii?Q?49jabAoobBx6qIGyTiG1Hibc2h1vgfXrehuypl3ZWeru2kI11dQ5dRjwY0lZ?=
 =?us-ascii?Q?l3gHdlDvXPbYIlcKnEzmsC93lf+3zKkFzs8mmi0jesasiF4J16kc/PlG3lfr?=
 =?us-ascii?Q?gmE9KOTGa4PGLLQC8Q0sHufIf3tEEcXsrUs+HPSay1+QFVXbDuw4FYcUFJH3?=
 =?us-ascii?Q?CFNBLxULnfma+71TvADHThMWe0GCIx42kDVpoky6Uy4qrWH74r/tPO4Z2Op0?=
 =?us-ascii?Q?FNt+yjXVrgqoN036sLxLzLHR7o3MrRg+XQPktdsJi18ysC30qFxoDbHvTLCt?=
 =?us-ascii?Q?FmVL1b+DGrWH0Bwn5HsoaQtV2ChwlAaidAOGy4814cu8GKIU9DCQ+fpZaBx1?=
 =?us-ascii?Q?QnqwuoCIz4Qnu49pmPV5EtlaIZzVYG7AUPvtfOz+DVPE8ElnnoxLe5a21ylm?=
 =?us-ascii?Q?YvcpmU3mcUwCBysXx1bb7HNuS1e6Ga/wxfXvHw26Kb2nZ4Y+n5+/YM8ZRm7+?=
 =?us-ascii?Q?V5hQdwtfXoVXOVx3qfs3rdt+fYAyFVGbpo5R5VTjrajrzB6YX+q8ywtqKlBm?=
 =?us-ascii?Q?iCfycPGlGLKwtRpk+UyoeceWATjEUBLJVrAr4iI1k+/T+OjrFmx4MI9EnsgN?=
 =?us-ascii?Q?w7tmchwFjFZklQGV8uHv83qjbQUdi0IE7FoNWmsSq88GKVIp9M3ejvvrzUMr?=
 =?us-ascii?Q?l8NtNo4dzpCxMMO3g3z+NLU9anx0pRd1RvWy9y14Qt4zmD1tya4ozHe+xUaT?=
 =?us-ascii?Q?vbbitnVFnI49pp4g/oFcBLg9RiWJrgVoL3zadQUHHA/VaMSiqlUVHWu5YCJ2?=
 =?us-ascii?Q?GtEg14dl2xu1MgOvAGTlbv/wePORQmAPuDQ078BFTaUz0+XY1Sx+lfhtl4bt?=
 =?us-ascii?Q?2sAqrl3NZuM4TD1A281+XzEJ1uAyzbcD346URhtKZg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hBfBOaBUddBwHo+skJtL8bUqzdiXipGlwb9VMiU0IB7HIwzHZ0en4pQNVNT9?=
 =?us-ascii?Q?JmfPaC6yAab/ELms1lWgatgBgLY5qGvrzuOHkvF1lyma2O2yL8FHu7c3umma?=
 =?us-ascii?Q?RlTXSRnXziyA48xM2mgsehDzSnBAWJeCSaR9pG/KFrGtYfwcp9MjGAVeVuYP?=
 =?us-ascii?Q?5uExRtLhy3KTZIHLwgqNtg0uXLaNawVJsvNuIQ9ELJDaN9b/ZFV+/dYjjyhd?=
 =?us-ascii?Q?wkaDiIopeT469ZLIEgBPon8Xvy/9cs3jU9L0EK6+VwYvD5cxXsCeun8CATSW?=
 =?us-ascii?Q?GbTFJSISD3k1TQU8/ncZw/IGljfWZv9nlPUCYKECy3Vb9rDfZWN2OGxQrbL0?=
 =?us-ascii?Q?Q9kv2WFFNrP1T1Rx7xqBXoJyipx6Y2jze8x1Zqq/ZbyFGDI7eq6aDGrJD+mv?=
 =?us-ascii?Q?HLaWBWI/+yMtykRhHDDzagS2Nm5vAYsZVSghpkzbXJe5imrnm8NgK7FT7Fnr?=
 =?us-ascii?Q?nHlq1CFK54V/oyTc0nZJlTOVe8a4NXUSxcKD3nqtoKaJjbaT814YuaPhKrH5?=
 =?us-ascii?Q?eZwVcTyt09//thITs2X8zCvEsIkQKQd/dBAG19Vseo+NhnrSWqGwCwtZx6Jm?=
 =?us-ascii?Q?ELEj6eoh/2M4X39Y6p7UmUzKlL131rUx7zvcmdhZ4SuIFkpI3FLZN/oVubqw?=
 =?us-ascii?Q?EEyZABdAYUS4pm2FUapYxSIcMftHKBjsNMJAC9V6BHgfKTD2/P03+EkYtOyR?=
 =?us-ascii?Q?4rEhnVSZps/xRML5uJFlIgB5WWYjMsHAQxii2b9qT2eMzadCX1rJcge10Umo?=
 =?us-ascii?Q?a5YiSTajkMLUN8lMplQIpIvcvkvA78Pok/mChpwEAD4VglpV+x3MK90xzTzM?=
 =?us-ascii?Q?ddRtf3lc4+RI3lefaxQ1oqxa8HGo7VRmQVf2AjYzg5porsVINbSheN+DIDAf?=
 =?us-ascii?Q?B74QIiV61RinTale5Mh5fUTokCWZDHFt/nIG6bmwXMWangCkpvrDkkOTGSbZ?=
 =?us-ascii?Q?hVtBqSdIz8PLcD1PyDsrsiyb8ofhjgDaSRB13pkrOZ5jaLm5e3J+Gesg5nIg?=
 =?us-ascii?Q?9f7qOWmJ2BeSvy5w2cj7yF1LiSNacj45SJ5Fks35+gw2KQRpp0PIovHLiyJL?=
 =?us-ascii?Q?0QFlRjBEuEkkGKAgmzvKetex5iIABZijm2vSU13Q34ImuXLFdasof1hKbpfL?=
 =?us-ascii?Q?z9osvsY6BaOLMBrfcaUn0O93bn3HD4WZnL2KwFItfOUpUIm5U9FYKXHGucma?=
 =?us-ascii?Q?9Acm0o1VVYDXWRU/GYqys9rs5wEKoF+mA++EIV7ywORdkdlNu3uSbATYgVgM?=
 =?us-ascii?Q?vLnX1pr4l1dINugyuLzFqQ1k5/+elGz1yfBXiVCy9S8XSm1YvNfmVhsUZgEj?=
 =?us-ascii?Q?3/5fgMsMmBoKXBE2OWeirRnPYugP6IyxqGX2TqOtoQAK3niAolEbXQCOfgtI?=
 =?us-ascii?Q?hSHV4CSIRXyzXWSAvpQ7ewZFDLLDm4DuuBzl6gGUcpw49FgRY5xU2fx8g0kM?=
 =?us-ascii?Q?VvIQI3W8PIffXRV7pecWrcbOykm2Q6XsaHXNXz6RIGU+NaUnY1wFuyjadr8H?=
 =?us-ascii?Q?K1G20tLVGdaC5yhQ9FkFop8Bag4H6SI76P3lJyx7LDrXyZpgE4U1ukGQlgEw?=
 =?us-ascii?Q?lINosYtpBB7RfLFiFK7Pnsg/x9HGz7pJAEwnUusp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	S7B0E/+IOH7QJzN6Q0NNXNbwDhonkm6shbKk+MMGI/FFqJm9dsNAXJezY/shnqQjF9P6xxi6XZHw5EILz6RIHItiRmTLYoJC3+bII7aUg8xuOINnqQUjQi3VKVVgl8ClVl0WaoePkyMphevNNFrrI9RtpgrLyn6L9+fKHhVU/ESb2GQnLdqIDrDpufj3K9eODmtXObcIFU6GfGm9b1WO11ehE6xgO9eZN7NaGG3RaR+R9G3Humx7jJC3A1Gj1jGh9//Xi5s4QzWI5eLGwWAfmfMQAVLsWqZZ6X8OQMqcVq6DnBaICV4yZjvq91lCwiGl6X4HLJC567Qfhz+LSfqs1vm/fHHe2v0fFGmM5KXURI3xdCMv/HdH8jO9gzfpq3VqaRfncST/mARoYg8xqufjhnIc2ipReUY8pwn3i09cX975jtcEkHs2eJwE9bkYyN1jCcbuSAu042O6426xVMCRsLdGxCP+GG/kIeHeAwlLwN1YJo3NBA9kQMxutUs4I6O8jv+8kKg5tRUkkXhex6knEDOJKhdi7+dMqV8OqEykLR52Yn1BYExwrF+YTRrFI1jVB9LnZvwfsl6ANO7d85y/CMicOB4XzpN3Up285tRskHs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d62d9bf4-f886-409d-cc0e-08dce430bbd7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 04:55:14.2841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oJUBm0/WZOuyfpwMz/So37zvUz/A7kJ6HCDdfj7jVHCX/fDkxrND0rznqMttAe/cZY1+2gmToBiERSC0U+e35Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7226
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-04_03,2024-10-03_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 mlxscore=0
 bulkscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410040033
X-Proofpoint-ORIG-GUID: iuKiJsFjuhmkmz4Pv1aYbq-5ZLEQgSag
X-Proofpoint-GUID: iuKiJsFjuhmkmz4Pv1aYbq-5ZLEQgSag

From: Eugene Loh <eugene.loh@oracle.com>

Error checking for USDT probes can be different from other probes.
So add specific USDT tests for -Z and -w.  Specifically:

    err.no-Z  No USDT process yet when dtrace is launched
              and -Z is not specified.  Therefore, dtrace
              will not start up.

    err.no-w  A USDT process is running when dtrace is
              launched, so -Z is not needed.  However, the
              action is destructive and -w is not specified.
              Therefore, dtrace will not start up.

    err.Z_no-w  No USDT process yet when dtrace is launched,
                but -Z is specified.  So, dtrace starts
                successfully.  But the action is destructive
                and -w is not specified.  So when the USDT
                process starts, dtrace fails.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/usdt/err.Z_no-w.r  |  4 ++
 test/unittest/usdt/err.Z_no-w.sh | 65 ++++++++++++++++++++++++++++++++
 test/unittest/usdt/err.no-Z.r    | 13 +++++++
 test/unittest/usdt/err.no-Z.sh   | 31 +++++++++++++++
 test/unittest/usdt/err.no-w.r    |  3 ++
 test/unittest/usdt/err.no-w.sh   | 31 +++++++++++++++
 6 files changed, 147 insertions(+)
 create mode 100644 test/unittest/usdt/err.Z_no-w.r
 create mode 100755 test/unittest/usdt/err.Z_no-w.sh
 create mode 100644 test/unittest/usdt/err.no-Z.r
 create mode 100755 test/unittest/usdt/err.no-Z.sh
 create mode 100644 test/unittest/usdt/err.no-w.r
 create mode 100755 test/unittest/usdt/err.no-w.sh

diff --git a/test/unittest/usdt/err.Z_no-w.r b/test/unittest/usdt/err.Z_no-w.r
new file mode 100644
index 000000000..b81622481
--- /dev/null
+++ b/test/unittest/usdt/err.Z_no-w.r
@@ -0,0 +1,4 @@
+dtrace is running so start the trigger
+dtrace died as expected after trigger started
+-- @@stderr --
+dtrace: processing aborted: Destructive actions not allowed
diff --git a/test/unittest/usdt/err.Z_no-w.sh b/test/unittest/usdt/err.Z_no-w.sh
new file mode 100755
index 000000000..3833b4400
--- /dev/null
+++ b/test/unittest/usdt/err.Z_no-w.sh
@@ -0,0 +1,65 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# This test verifies that dtrace will not run a destructive script
+# for USDT probes if -w is not specified.
+#
+# Specifically, the script is launched with -Z and no USDT processes are
+# initially present.  Only once a USDT process is detected does dtrace
+# fail due to the destructive action.
+
+dtrace=$1
+trigger=`pwd`/test/triggers/usdt-tst-defer
+
+# Set up test directory.
+
+DIRNAME=$tmpdir/Z_no-w.$$.$RANDOM
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Make a private copy of the trigger executable so that we get our
+# own DOF stash.
+
+cp $trigger main
+
+# Run dtrace.
+
+$dtrace $dt_flags -Zq -o dtrace.out -n '
+testprov*:::foo
+{
+	raise(SIGUSR1);
+}' &
+dtpid=$!
+sleep 4
+if [[ ! -d /proc/$dtpid ]]; then
+	echo ERROR dtrace died prematurely
+	exit 1
+fi
+
+# Start a trigger process.
+
+echo dtrace is running so start the trigger
+./main > main.out &
+pid=$!
+
+# Check again if dtrace is still running.
+
+sleep 2
+if [[ ! -d /proc/$dtpid ]]; then
+	echo dtrace died as expected after trigger started
+else
+	echo dtrace is unexpectedly still running
+	kill -9 $dtpid
+	wait    $dtpid
+fi
+
+# Tell the trigger to proceed to completion.
+
+kill -USR1 $pid
+wait       $pid
+
+exit 1
diff --git a/test/unittest/usdt/err.no-Z.r b/test/unittest/usdt/err.no-Z.r
new file mode 100644
index 000000000..52d9492ab
--- /dev/null
+++ b/test/unittest/usdt/err.no-Z.r
@@ -0,0 +1,13 @@
+expected failure
+-- @@stderr --
+dtrace: invalid probe specifier 
+BEGIN
+{
+	exit(0);
+}
+
+testprov*:::foo
+{
+	raise(SIGUSR1);
+	exit(0);
+}: probe description testprov*:::foo does not match any probes
diff --git a/test/unittest/usdt/err.no-Z.sh b/test/unittest/usdt/err.no-Z.sh
new file mode 100755
index 000000000..29d63d9ce
--- /dev/null
+++ b/test/unittest/usdt/err.no-Z.sh
@@ -0,0 +1,31 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# This test verifies that dtrace will not wait for USDT processes to
+# appear if -Z is not used.
+
+dtrace=$1
+
+$dtrace $dt_flags -qn '
+BEGIN
+{
+	exit(0);
+}
+
+testprov*:::foo
+{
+	raise(SIGUSR1);
+	exit(0);
+}'
+if [ $? -ne 0 ]; then
+	echo expected failure
+	exit 1
+fi
+
+echo unexpected success
+
+exit 0
diff --git a/test/unittest/usdt/err.no-w.r b/test/unittest/usdt/err.no-w.r
new file mode 100644
index 000000000..7a4d60cd0
--- /dev/null
+++ b/test/unittest/usdt/err.no-w.r
@@ -0,0 +1,3 @@
+expected failure
+-- @@stderr --
+dtrace: could not enable tracing: Destructive actions not allowed
diff --git a/test/unittest/usdt/err.no-w.sh b/test/unittest/usdt/err.no-w.sh
new file mode 100755
index 000000000..407654981
--- /dev/null
+++ b/test/unittest/usdt/err.no-w.sh
@@ -0,0 +1,31 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# This test verifies that dtrace will not run a destructive script
+# for USDT probes if -w is not specified.
+
+dtrace=$1
+
+$dtrace $dt_flags -c test/triggers/usdt-tst-defer -qn '
+BEGIN
+{
+	exit(0);
+}
+
+testprov*:::foo
+{
+	raise(SIGUSR1);
+	exit(0);
+}'
+if [ $? -ne 0 ]; then
+	echo expected failure
+	exit 1
+fi
+
+echo unexpected success
+
+exit 0
-- 
2.43.5

