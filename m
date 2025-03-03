Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72935142659
	for <dtrace@lists.linux.dev>; Wed, 12 Mar 2025 15:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741792105; cv=fail; b=dSOT5llS55furAKlf4Rd9i9XZaIi2XPNL7aVw+cwpJdMb1sY0LvBV6Ko67Mrrrzzqzxds1fLgNv3MVL2AgxuYuW/Sj4uRGqFMZyTxctBDqp43uJVAvPB2Cnj/409RnzF+5j+Ja8nCC/lC2ToTh0ty+HRWDHBaVJ1xBGzLNI6wgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741792105; c=relaxed/simple;
	bh=BqCDAkZ7xhjDLzsBKpSNsZL6418YC7z6VVxse16w7+k=;
	h=Message-ID:From:To:Date:Subject:Content-Type:MIME-Version; b=amc/MuNYdDtRgNaaMRoyFHEEEjYXAV/51yx31u6PDe0JMDFd4VOAXilfLvKhk8W0kOtTI5GhvT1cRnFyFDtA7ssFT9/IusgDcLrXcoKMCE5tB+Yr9A6eDboDSceSMGYuAfXBNpv7xnby53p8moDSwR7o05usNmKLVUZ/JkNDNiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lCYDeO6R; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=D2scAuo0; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lCYDeO6R";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="D2scAuo0"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CCEXmg025269
	for <dtrace@lists.linux.dev>; Wed, 12 Mar 2025 15:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=uro0Zbmn1Iuvn1Mt8vsCVhE42xKH14z98dM5wNIrqWU=; b=
	lCYDeO6RJPgYB5eFdMK/IIJdfogFn+jIU/bjsXsD4vzw9nehFH1Mml7IFp3qnGNk
	LbH/UAqHoinl+XfHl0ZZh9Pl8L4CQB0wbapbXdr/lWv482l0QOm6spLGn3nwVwlu
	jnPEYNSj0MK9mwxdnc6f3Hu9VeFBtoPlXaZtsWgdiQ64KWmMrVJjFJ9Se7j0tNiE
	43ujWp20bE4neGOmPKzQNkrv1TRtSwx/LOHZzCNKbLD4NK45qgroCLpe5OqZWSxU
	/p74mGq/vqvTzOHRcLAQLuvkmSTkIz61mFp9OSuoYp0i6knF7LsaLzsqpwqfdwXK
	Pw0C/RXPTLUBXNuR8GqRRg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45au4dt0ha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 12 Mar 2025 15:08:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52CEniMw012283
	for <dtrace@lists.linux.dev>; Wed, 12 Mar 2025 15:08:21 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45atn1d4mx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 12 Mar 2025 15:08:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lgUewyxVahdEPu8zgKwaQz4viOK3t6T+1QMzvrncPXRLwDnnmzaBtL7T34NDxk7K4La0QF2Ir2zWFs86duR3JLQIBl5t13yU2RomNXAbh6GpxB2bn5XTIeLZ0fNvlNYidObOJPnTDINQ4+p99ZMXDXkwK+X/eLcxKJefMjYhINY/AJ+BuRdlV+mtFCqcw7uEJ4zeQ4IlO29874oj+rtWRL1MIkEJytXQnlpgieLbbll3PpQcfkMCMQEOjBQSyI1G0LMmnH/IapW0x44ehMQKGIevjFhtq0ln7eh6786SeAc/oLqIQtaNCTYM88hKzqfqV81shtWXqvBQ5VrB7WMj6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uro0Zbmn1Iuvn1Mt8vsCVhE42xKH14z98dM5wNIrqWU=;
 b=E1geueDWl8dEGwmcwbY24TlulcdswHJk85fm1tVG1EgToNWY+RwCEBxd2WeyHQjbnEmwq6QiSHIi+zt8bbFpMSL/7vugZxg5qhZzONNNlYMV9mrYQqjNvo+6EGWRLWXzKjySRHj6azybDfBV0Q8DOhB91ALFxFrA0hY8HjhwXDIu+hWHiJjy+Klmwm+SddaN7xVUE9fuQ/DSxkXqjmD/FAWH6yMhD7F2sLUxztktkC1sFka9ihBOep32RHcSWXusx6ilEUiGTF956R35EWsWL03uMQqz/WEn98jKd0oEjS8JClP/ETCMIvuzJicalP5jyLOTy2XGCJSwbGo7Uv/LJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uro0Zbmn1Iuvn1Mt8vsCVhE42xKH14z98dM5wNIrqWU=;
 b=D2scAuo0/nDJ9LI1ddzBmeAhSSC5ERBmxvEyZZ+TSwfxeZP81W+j82lAODI/+UYuhkq+Xa148bcEk2IOVDSrcJULKbdVWU2T7DYrVD5xJ54HZjygae3VWfRuphFEwliyP6vzYD9oPoD/0goQnpfD087uV8phUd6lCsarDwvyJ9g=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SA2PR10MB4492.namprd10.prod.outlook.com (2603:10b6:806:11f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 15:08:19 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%4]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 15:08:18 +0000
Message-ID: <09d06928f75f3fbd757909f703fa576f.kris.van.hees@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Date: Mon, 3 Mar 2025 00:38:48 -0500
Subject: [PATCH v2 7/8] rawfbt: performance improvements
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::13) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SA2PR10MB4492:EE_
X-MS-Office365-Filtering-Correlation-Id: d6bdb2b0-868f-4437-7968-08dd6177b8eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eHhyRkSUnkVMHprPkoyaYSs991ba4wpyDwtF3WVJE1SaIFQA0uSV1ter26Z1?=
 =?us-ascii?Q?jWhHkQ5UlnXXcx0kP/AAKjc/ZtJR/a2jsaYTLD19vKzzbpKMhn0iFeLRYa7b?=
 =?us-ascii?Q?V+P/5e6a0VL4tyNBMm36P4feg/Ba8BzeiQ3m+AVNutGk1cS/D7HvKoRpWX1w?=
 =?us-ascii?Q?56GMH28+l1ob5hXvplZRBfh3W0zbN52UkQXV0Uen9N3+ieQGVv94nqcn/s2J?=
 =?us-ascii?Q?rajnUP0YyTrTZ8lMZpAOZKP7f+B/DJ2mrMSfjfRi/AGlAuqT/QZEKVAkeMUd?=
 =?us-ascii?Q?rZrG/hSKyrC//GET9L591bavgMaDsd8ncigNYoLZ2wsKck10kfcWTgZa0UBP?=
 =?us-ascii?Q?XSr9GJOdAuXmVYkDed7VLwruy2KnF6EoWrLGXOewyLhaikqjzm4Ue6HUCHaS?=
 =?us-ascii?Q?erRj7JzL1f4qWpWmGQhfrT8Y9Iu4zdtP4bjG4S0ul/+hATfa7AV2W2wpoIVC?=
 =?us-ascii?Q?CFT6ELXDzPXOHGyEqGUZaperI7/zadvZRIXdYMcFyYWnCdPc5kxCiXXXl1K7?=
 =?us-ascii?Q?pa/kbfEgplzuf6R1lzGVFzu4R0Zo3IFWk5Izl7sMXvxfpYS7jN4v4tEnDsp5?=
 =?us-ascii?Q?ObRLI+3xBLIVKrGLQ9VQ5Ut0r3o94sJ1ynH6Y65iTqBVQgO+yqcjQFO8keq4?=
 =?us-ascii?Q?WRS7YFA2W0NyKJPWilLDJYPKxtmNeadA/c2Scm0P5GEKjjv1CWmkzbB9eoN0?=
 =?us-ascii?Q?edXpqucZGpPeDLcZIH9xLmvgozj8xfix+MNx6qO+L5nRP2kM3s8BfDICF4GV?=
 =?us-ascii?Q?nhyDF1+cztNOJm8VUOhEZ2gVehaL6Zzbj+XGCXb6phWD/x5oBDQqIH04yxFI?=
 =?us-ascii?Q?crnEtV+EyI6X9eF+MYADvfgUTrpB/NcE53K/edkY5sukQs/88tvttoQ8595Y?=
 =?us-ascii?Q?QkpC6C12Lnk8CTJmXZKyYou9zvBT4HqrhG1m6/stglaAFC7aXGU4vdeKtQEN?=
 =?us-ascii?Q?vx4Cei5u+wraaJHOXYIqGBeZV2wqsCTfUCLShp284AYtumkZn1RyT7qPrHyV?=
 =?us-ascii?Q?O0OXRxagsztViDuXLaN2ZiXCS9saVG/3jLdOjh2RE7uNXPH2DXhLC66sw56O?=
 =?us-ascii?Q?CPs+U7Y7YNctYtyLr6sWmMqtHJCwZVfjm5WE9gudCmGvWVB+Tu/1n//pQv7i?=
 =?us-ascii?Q?ESHX9q0RqO6bqxkO0/06W6RuxwC6j53VMfVHY/UFxxzxL5zPtOapU0pQmtJp?=
 =?us-ascii?Q?BtE0nL3sJf0NIer1Nauc+u29X4Ye53lv6o6KtpTQx0ZgseUXdE9H12jDYmqT?=
 =?us-ascii?Q?iXvdNUlQjFHCluJH+KsdgwZiUGqQaSZIqgML9B232RKXOoGuGq8unn5WOdo/?=
 =?us-ascii?Q?3eE+zqJgxIwVo/prBpLRQ6/2zvdM9gQf5MxNTpYaL3cWYXle4c6Gd3XUnDSz?=
 =?us-ascii?Q?c/smc7Gg/aLnDb/h5AcdNnEuUK6p?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+pxa+yqraIm7sjeNSg7qaTdJMTze+VGiT1WMsth3u/TGJtBnyIX7N5u1aJsH?=
 =?us-ascii?Q?xXmsFbTt2+QHIO6JMzOcFGZN+1PDQx9X5iAyMVvDgo17PHGjG2y6FqyLsMFH?=
 =?us-ascii?Q?I6PjW/DeJGGCDf1qXHQDg5ZYbS3ym/Ev9RQ1icp1FEXg9SUlquUYn/q2fJC6?=
 =?us-ascii?Q?xylIs38zw8fEwuZOfKTTaKSdQ1GNVCFrvewUOEmwnWfTDJxfN9tIP6K3lLZm?=
 =?us-ascii?Q?BiisUmCZ0/CI7T/uic4iPANPMyNSdw/CKSTveXdTzo/t3zW8NHlYDibWc9QO?=
 =?us-ascii?Q?ljXf7Ty7ApeMD1wG0fmBUgvV83KeVKyfFdLUiRW/FSSFlS5JRT/VrhFa8J18?=
 =?us-ascii?Q?rsSa8qLXt2YKiOjCi5TmQxkox7p9fPYrWI1vBLr+Xc9/xeed34GWi75TCEii?=
 =?us-ascii?Q?rYQbpkLSYjEF/IdTwehwXAJBY4BozR7jv0R78Cm0WsK0N6/gw30v5WasElmw?=
 =?us-ascii?Q?5OgbyUNZbkye9WhAtQiW/T9woBbZGgYCz573FaS4RZ+EtsdyhOoyanUP6wk3?=
 =?us-ascii?Q?je8P3N19CLoYFaXEb10aCHWy+YaBzu7wvfjlNCPNFmanLbKZmWG0Lc2qHzXE?=
 =?us-ascii?Q?gak31+CDA+lYa9BX0vRyZ/QamaLgjZHVQV9KMizE59kbeUGMXta7HIbMjBD1?=
 =?us-ascii?Q?ANmvwhGuBYCrPxzK/d0FuLhSICyHzA6reIRTeZcLvWhA6Vz/r9NkMTdeMpPa?=
 =?us-ascii?Q?iQ8oZPgsundMX2Rf4BZ2/izVnFuaGwSUQ6+7+7G8XXcbSXjmarqYIxdzU1kW?=
 =?us-ascii?Q?PcGsOXguQDgPm1CkV6S8GIiS2sK36IjbnkW3/eyF4KXLKiJQ4/IxHX5NKvac?=
 =?us-ascii?Q?gNwkwek5tlCYYGebu2WN8UOv5nakYLy/bPCeqOpUDIufeqOmNNZIegu8+KEa?=
 =?us-ascii?Q?TEKqwzTq9cjFl3tTsigIwR+p5NZsBBszk45ytS+Nblci80jEWAAwpFDp0qqB?=
 =?us-ascii?Q?VBgMVn30Np3K5Mts4YqQHuhJJkFKsMYf8rj9jUt/nFhXZBHR47/gMfqVWxNG?=
 =?us-ascii?Q?Q1/15MsjlCEXYo2PVTXM8h8rrbAK99boaWuqSSaCnNp+ICEJAqPH4lzQc+To?=
 =?us-ascii?Q?+j0TKoOF/YuOljr7lmiK6u0BTbdj1+5Jtj5KlLTcVa+msSwgk3GS9OkiBS6b?=
 =?us-ascii?Q?opn577tK/kZfmngUTXyjULK1aFw/bCPkrSxWGKlyp5EcXp2PxXirCQ7OmXbt?=
 =?us-ascii?Q?DCABWcNYTMkHZprygTyyYkVScFiX7Xftyg33twCWWRGhk60aObk9oe7cMvEO?=
 =?us-ascii?Q?rgyXm6E+YhKfzTv/8z01NfH7hersRddjFAnmw4qr9qbQ9FsMnjSQdaX+R87t?=
 =?us-ascii?Q?1paKrMOHb7yFY1pD+wB2he05eZhJvegCQTbvkpGkKP49PQcOPcSJq93O6Lqf?=
 =?us-ascii?Q?g4g5QXsBiz12TR3Q3MkMQIPylZubFDjfbAhH9HsNLUG4p3Ssqfz5RZyOL224?=
 =?us-ascii?Q?c3fCaTfaKJ4Gb6z2y8CIbzhZ9iHXursdQFnNuSyh37eELlkId/w3nIlwtgXL?=
 =?us-ascii?Q?mMG6BOjvZEInxFeWu8hjbCj0jrzl8ktuJSgY0JuErmWsKq9VLD9vSMP4cZhe?=
 =?us-ascii?Q?SCSl5IehE9VlQM1TT/8L+Gb5FbnkNoTlACNzY9HaQO4N+VfluYhLMYSXLzta?=
 =?us-ascii?Q?WdkBKCJC9+nd5OrvCuSvp/4=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	84vNGf9cZMU8nbJmF4+3odi2HmSYTBQdEkBuUzT/0LLoL4OPbmY6ygRrRfuQ3vbXn6x6Qlgn3RzMNwyc7KMUs1Opj/4szS2h6XDzbZ5E323Zvfz5SEEfXtLYuflF7kc60Fp7NHz8eOviXEAloxSc5bKe2akGl6p1iuKyz1S4gJttQBIXNRT1iNW+7E3/wBAOJv1oBWRMaHjQp1h3YPiKYcQBT9OsnfY9y+0994AiQWHhVexm7v7d65xQCS2gIXSwsBhXtiI00OTPLJT9JebXwt++dILJ43+01y/suRP6WomKtrEfqEUrDbsrF7uDSrktQ8yFH/Jj/TMlKrHY1za+vutvzPeRDtBLbFhbKVPE6JYltlDoSOzEKk1iXO2q2l6QEDXZj207jpH2TrnMOiSXl8VU6YnXrd6kSCY1BtHTMRLwvbj5KjBr8QBu3OtefwLZ46elMY5tfZGTLaMnQ4d0rpgm/TePn/TM89bhcyg5AwoWqC3YLW8wnOyYWQIlIJ4SLdNpead0dSBFUmo6XAP3OqKo+OmAYuvql6Ip036Fp0fCqxT6L9k+TUjP+pivEelgxRtzj5Q6ZCR3SXWFj4AW0DrA5xmtGyIli00M8jfZuhY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6bdb2b0-868f-4437-7968-08dd6177b8eb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 15:08:18.9014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mF31xbPPgTOhKWCz8GyLwyZjO3whYAbbraA/qdK1NQwJ8DLu8a+SM/7jzJ00SqqHV5Gi44qEnslTIpuQKJw7xFfwujSLhliG/ua2FnihVl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4492
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_05,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503120103
X-Proofpoint-GUID: mmZZ-rKsNqsmIxyOqvGFcPZgVEwebExe
X-Proofpoint-ORIG-GUID: mmZZ-rKsNqsmIxyOqvGFcPZgVEwebExe

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_rawfbt.c | 218 ++++++++++++++++++++++++-------------
 1 file changed, 145 insertions(+), 73 deletions(-)

diff --git a/libdtrace/dt_prov_rawfbt.c b/libdtrace/dt_prov_rawfbt.c
index 62f2f4f0..ebcd1a16 100644
--- a/libdtrace/dt_prov_rawfbt.c
+++ b/libdtrace/dt_prov_rawfbt.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  *
@@ -44,10 +44,8 @@
 #include "dt_pt_regs.h"
 
 static const char		prvname[] = "rawfbt";
-static const char		modname[] = "vmlinux";
 
 #define KPROBE_EVENTS		TRACEFS "kprobe_events"
-#define PROBE_LIST		TRACEFS "available_filter_functions"
 
 #define FBT_GROUP_FMT		GROUP_FMT "_%s"
 #define FBT_GROUP_DATA		GROUP_DATA, prp->desc->prb
@@ -61,98 +59,171 @@ static const dtrace_pattr_t	pattr = {
 };
 
 /*
- * Scan the PROBE_LIST file and add entry and return probes for every function
- * that is listed.
+ * Create the rawfbt provider.
  */
 static int populate(dtrace_hdl_t *dtp)
 {
 	dt_provider_t		*prv;
-	FILE			*f;
-	char			*buf = NULL;
-	size_t			len = 0;
-	size_t			n = 0;
-	dtrace_syminfo_t	sip;
-	dtrace_probedesc_t	pd;
 
 	prv = dt_provider_create(dtp, prvname, &dt_rawfbt, &pattr, NULL);
 	if (prv == NULL)
 		return -1;			/* errno already set */
 
-	f = fopen(PROBE_LIST, "r");
-	if (f == NULL)
+	return 0;
+}
+
+/* Create a probe (if it does not exist yet). */
+static int provide_probe(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
+{
+	dt_provider_t	*prv = dt_provider_lookup(dtp, pdp->prv);
+
+	if (prv == NULL)
+		return 0;
+	if (dt_probe_lookup(dtp, pdp) != NULL)
 		return 0;
+	if (dt_tp_probe_insert(dtp, prv, pdp->prv, pdp->mod, pdp->fun, pdp->prb))
+		return 1;
 
-	while (getline(&buf, &len, f) >= 0) {
-		char		*p;
-		const char	*mod = modname;
-		dt_probe_t	*prp;
+	return 0;
+}
 
-		/*
-		 * Here buf is either "funcname\n" or "funcname [modname]\n".
-		 * The last line may not have a linefeed.
-		 */
-		p = strchr(buf, '\n');
-		if (p) {
-			*p = '\0';
-			if (p > buf && *(--p) == ']')
-				*p = '\0';
+/*
+ * Try to provide probes for the given probe description.  The caller ensures
+ * that the provider name in probe desxcription (if any) is a match for this
+ * provider.  When this is called, we already know that this provider matches
+ * the provider component of the probe specification.
+ */
+#define FBT_ENTRY	1
+#define FBT_RETURN	2
+
+static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
+{
+	int			n = 0;
+	int			prb = 0;
+	dt_module_t		*dmp = NULL;
+	dt_symbol_t		*sym = NULL;
+	dt_htab_next_t		*it = NULL;
+	dtrace_probedesc_t	pd;
+
+	dt_modsym_mark_traceable(dtp);
+
+	/*
+	 * Nothing to do if a probe name is specified and cannot match 'entry'
+	 * or 'return'.
+	 */
+	if (dt_gmatch("entry", pdp->prb))
+		prb |= FBT_ENTRY;
+	if (dt_gmatch("return", pdp->prb))
+		prb |= FBT_RETURN;
+	if (prb == 0)
+		return 0;
+
+	/*
+	 * If we have an explicit module name, check it.  If not found, we can
+	 * ignore this request.
+	 */
+	if (pdp->mod[0] != '\0' && strchr(pdp->mod, '*') == NULL) {
+		dmp = dt_module_lookup_by_name(dtp, pdp->mod);
+		if (dmp == NULL)
+			return 0;
+	}
+
+	/*
+	 * If we have an explicit function name, we start with a basic symbol
+	 * name lookup.
+	 */
+	if (pdp->fun[0] != '\0' && strchr(pdp->fun, '*') == NULL) {
+		/* If we have a module, use it. */
+		if (dmp != NULL) {
+			sym = dt_module_symbol_by_name(dtp, dmp, pdp->fun);
+			if (sym == NULL)
+				return 0;
+			if (!dt_symbol_traceable(sym))
+				return 0;
+
+			pd.id = DTRACE_IDNONE;
+			pd.prv = pdp->prv;
+			pd.mod = dmp->dm_name;
+			pd.fun = pdp->fun;
+
+			if (prb & FBT_ENTRY) {
+				pd.prb = "entry";
+				n += provide_probe(dtp, &pd);
+			}
+			if (prb & FBT_RETURN) {
+				pd.prb = "return";
+				n += provide_probe(dtp, &pd);
+			}
+
+			return n;
 		}
 
-		/*
-		 * Now buf is either "funcname" or "funcname [modname".  If
-		 * there is no module name provided, we will use the default.
-		 */
-		p = strchr(buf, ' ');
-		if (p) {
-			*p++ = '\0';
-			if (*p == '[')
-				p++;
+		sym = dt_symbol_by_name(dtp, pdp->fun);
+		while (sym != NULL) {
+			const char	*mod = dt_symbol_module(sym)->dm_name;
+
+			if (dt_symbol_traceable(sym) &&
+			    dt_gmatch(mod, pdp->mod)) {
+				pd.id = DTRACE_IDNONE;
+				pd.prv = pdp->prv;
+				pd.mod = mod;
+				pd.fun = pdp->fun;
+
+				if (prb & FBT_ENTRY) {
+					pd.prb = "entry";
+					n += provide_probe(dtp, &pd);
+				}
+				if (prb & FBT_RETURN) {
+					pd.prb = "return";
+					n += provide_probe(dtp, &pd);
+				}
+
+			}
+			sym = dt_symbol_by_name_next(sym);
 		}
 
-#define strstarts(var, x) (strncmp(var, x, strlen (x)) == 0)
-		/* Weed out __ftrace_invalid_address___* entries. */
-		if (strstarts(buf, "__ftrace_invalid_address__") ||
-		    strstarts(buf, "__probestub_") ||
-		    strstarts(buf, "__traceiter_"))
+		return n;
+	}
+
+	/*
+	 * No explicit function name.  We need to go through all possible
+	 * symbol names and see if they match.
+	 */
+	while ((sym = dt_htab_next(dtp->dt_kernsyms, &it)) != NULL) {
+		dt_module_t	*smp;
+		const char	*fun;
+
+		/* Ensure the symbol can be traced. */
+		if (!dt_symbol_traceable(sym))
 			continue;
-#undef strstarts
 
-		/*
-		 * If we did not see a module name, perform a symbol lookup to
-		 * try to determine the module name.
-		 */
-		if (!p) {
-			if (dtrace_lookup_by_name(dtp, DTRACE_OBJ_KMODS, buf,
-						  NULL, &sip) == 0)
-				mod = sip.object;
-		} else
-			mod = p;
+		/* Match the function name. */
+		fun = dt_symbol_name(sym);
+		if (!dt_gmatch(fun, pdp->fun))
+			continue;
 
-		/*
-		 * Due to the lack of module names in
-		 * TRACEFS/available_filter_functions, there are some duplicate
-		 * function names.  The kernel does not let us trace functions
-		 * that have duplicates, so we need to remove the existing one.
-		 */
-		pd.id = DTRACE_IDNONE;
-		pd.prv = prvname;
-		pd.mod = mod;
-		pd.fun = buf;
-		pd.prb = "entry";
-		prp = dt_probe_lookup(dtp, &pd);
-		if (prp != NULL) {
-			dt_probe_destroy(prp);
+		/* Validate the module name. */
+		smp = dt_symbol_module(sym);
+		if (dmp) {
+			if (smp != dmp)
+				continue;
+		} else if (!dt_gmatch(smp->dm_name, pdp->mod))
 			continue;
-		}
 
-		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "entry"))
-			n++;
-		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "return"))
-			n++;
-	}
+		pd.id = DTRACE_IDNONE;
+		pd.prv = pdp->prv;
+		pd.mod = smp->dm_name;
+		pd.fun = fun;
 
-	free(buf);
-	fclose(f);
+		if (prb & FBT_ENTRY) {
+			pd.prb = "entry";
+			n += provide_probe(dtp, &pd);
+		}
+		if (prb & FBT_RETURN) {
+			pd.prb = "return";
+			n += provide_probe(dtp, &pd);
+		}
+	}
 
 	return n;
 }
@@ -306,6 +377,7 @@ dt_provimpl_t	dt_rawfbt = {
 	.name		= prvname,
 	.prog_type	= BPF_PROG_TYPE_KPROBE,
 	.populate	= &populate,
+	.provide	= &provide,
 	.load_prog	= &dt_bpf_prog_load,
 	.trampoline	= &trampoline,
 	.attach		= &attach,
-- 
2.45.2

