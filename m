Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793389104;
	b=SZwwse9PzpbXdMFq45UN1Lgau/nf+6GrRRSa9BLKCpC9aP0fL2cXhc1Qf00i6E6O/d/D
	 KdyWqAee/Fbobn6wU3dNHVvKJhQaGkdW3sZkL0miMiSj9KkCWKPY8O4OmIZNP5fpqJiBv
	 pSRCLXJePU8vx3urbXmnwyA59CbmyihHXNcm2bSvvPiP4EGL5WXcuYUo7FeSyLjCLIdO0
	 01P82UTKBrMsanI7AXC2sfY7gTIlKcwJeTxdfFpk9sdsND4pY5z3vca7GlRxzFldJygcR
	 isOmNPLiiTyg0ibAdBioN6xWfzWslHOIdNR0/3dUpzMJl8WRdSeI/bk96seybCtxaJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389104;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Subject:
	 Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-TrafficTypeDiagnostic:X-MS-PublicTrafficType:client-request-id:
	 request-id:X-MS-Office365-Filtering-Correlation-Id:
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
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID;
	bh=AkouzdMB1nno3wiRYdvn8pA7U3CjdiPWy1NlcHXf5SM=;
	b=lRF4kvQjAKNdqIwpeiS+hhjF3J/suJBEPdLBN6dd0KHijNoR3drD5VtWkHfZaPJHUsnx
	 1CVgCwu3NwTOaI55cYwwHMK/vrg+dpE6Z33J76OHixAJmme3LskAe++HRkKnCcaV+Fe6Y
	 GvYvq5j5lnNCmW/gFw/zyGzK+i39QzQwf7j1AIkskLJQWyaou85WFra1V+lSjoIjX9+x6
	 fev1jG8X8RxY7LD62qNOQkC9gH7P8YvXrHDGnZQn6U/fkjAHvuPmsuMqzWn1HAvHFm5L3
	 aJpW6CwDcegZPMq1C3+3ZRtJKUgmV1MoPDCQ00Js3+TU37GlotTu1PHuo6vzn74dJNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=KX6rJ7Sz;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=wzv2qhBc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C41606A31A
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07C41606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=KX6rJ7Sz;
	dkim=pass (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=wzv2qhBc
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UEXUp32455396
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=AkouzdMB1nno3wiRYdvn8pA7U3CjdiPWy1NlcHXf5SM=; b=
	KX6rJ7Sz0jCldkoWtWDbeyMeBNB3v7DUbh9LnKm4VuVnla0dsVN1u4HLcq07kK6V
	FAiV+okQpYHOpkuXXdSbrYwfBZ2DICIZZIsXfR686NPDU/LIMzLi1xiHiLukzKi2
	hVO8Y6kosHO5DoRcuFr5DGRPlU+hfvcQ7bZv4M9/d6WZwx8k0TmAyTp62Quwcg8B
	yBzNLLtFlLNM71TbNEDQ0cTP5Fd65WzM51titGAfZfrmNFlqB0pEPfQcQgpXFGKE
	1pQTgrUScH7tB0UJIk8n3l6GVxPwczM/5UlfMSQmsVVT8/DeK5BTXxv0dU8HGgNc
	duMZcwyBhVCNhdQdLLZNDA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hme5m9cha-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:22 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 69UJLnMW3892253
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:22 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011019.outbound.protection.outlook.com [40.107.208.19])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4hn1b28dy5-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FRFER3KM3LJEKRTzfceZDKBB8Q05OYSjMccvWoYEGfMRG02xFgyUghDNQ+XJzxhxowwo6l6KMzLxLKnqU/gJwFGT0q04Us+HY3GZLb/ZsqrbEvJh38GK2xVPU73QhyyRela+t96RPJvEsx9gYv7uR+YPFkFBkRIuFQKGEQSWUNPnTGoTjwbz9qIL/n4eL05fX/4aM7YVGfeOPSIXAr2OqA/uEVLcroUeKIKhtayrQBO4DxwLp/9lHVQssbthVBGdFAmHWUIO6Ig3FyuKRYZbuiVZPugMS1Ih5QGrRImD7Wp+M8yNPM8GitfUB9PNZldaZZWfUZM69C4OXAeihZPKRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AkouzdMB1nno3wiRYdvn8pA7U3CjdiPWy1NlcHXf5SM=;
 b=DE0xtFlODyZpovBp09OJ2mJRmRReRnROr4QTrwJyJY4utDRlJOGSh/BrunWGoWsSGc2vqkVmmiWHk0iC+n4tjUqoMAC2cr58Iu4xAD/q3uFd4Ftr4HqPS03LLAkfWlR98RdEXIT9nMm6Si+zBFDBNFSh4qNT0lCWlaRfRzUQ2HAe1TlrPhm5E0cmCxRvTdHs9G8cpuHMfMUq/3gXd/7NuxXnujGg3jKi61Aua2tdMQHc+WIkMmNBTVQL3M57+gPyz+X5U3/0rDYnc0/R/VDunu0RlwOzezXKN4X6ogayHFQ+my85rA3c5oj/G5qhsQbUtfkov8Osg3//vmM84iGbDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkouzdMB1nno3wiRYdvn8pA7U3CjdiPWy1NlcHXf5SM=;
 b=wzv2qhBcRAXCte0gDA0KU6A8AK3acHecDI5KHlhkNKgH6S1TNt4gKvjFlMX0AMDDohTzF1S7GNNkxulXaFFl+9AY8H4/7GpXSdkxkOKc5/+mRdVcswD7bwZC1Puj9D6s1IbhA9MVqkX2tdAq4LnSgheS4cnRDx/ARhh8GFzQksE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DM4PR10MB6742.namprd10.prod.outlook.com with HTTP via P2P; Fri, 30 Oct
 2026 19:38:14 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 19:38:14 +0000
Date: Fri, 30 Oct 2026 19:36:39 +0000
Message-ID: <39f8bf63bedf882b1101174da917d6b8@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 07/20] libdtrace: reuse the built-in module range line buffer
Content-Type: text/plain
X-ClientProxiedBy: PH7PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:510:339::29) To CO1PR10MB4769.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DM4PR10MB6742:EE_
X-MS-PublicTrafficType: Email
client-request-id: abaa2c10-411d-4f4a-8fe8-b0752d32600d
request-id: 38e3287d-bf78-4b95-e07f-08df36bd56be
X-MS-Office365-Filtering-Correlation-Id: 38e3287d-bf78-4b95-e07f-08df36bd56be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|5023799004|56012099006|261028144727099003|261026140227099003|261026121527099003|261022105027099003|261022075727099003|261021123027099003|10067099003|261021121427099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8VqTMU0QJ0la6bQi9/jY61Tzq3LtO5gKsbyhEJlHjHKUcUWHlLZVovJ+nabzbGuPs15rlI2wG5U5ubzL8focPn+alhB4ylRM5Fji+ztF+1MUyvpDmIod7+4W4ujfTSlyoRkBX8ZIzOUgIMxw3U/k6i7YpplRv5NCB/HIO5jnMEqqqBBp+H51sNY/1eDlJCo4DfYeXdhnYJ1/eZeU0gs4nVdOxvsxApb6QIZc07wV0SdunVLhf0i5R9L/cVvgAx/nToGWzkzPdixWSmuwRTP9CR/KnEm+3qrL++CuPt/MI7Dd/PQyXsi2z/UPut0hh8tC2AbsE6oCpUkSTsrBVrydnTLSsTR8XrpwPKnjHbp3AJNU9cOqHsFMukB9ywNI36ROXQ4fi9MtsB/kVWX9z78GEoY+4hILj3EVicj2FYc7UzhduXhmRZNA31i5aeyoTeYP6jb1xvmoBMUJptWmvyH7sr9VyuYiGVqbl1A+m9b/9nYUkILvnPUoMPu2UzsUd7Gp5nUW4ZcCjfyHm5lFEKXn8DqiyKJq5zi2NODGDOd7k+fzHezKbQpxBZBFqbpwPZy1/nLq+Zx8QTC4yS/3B+wOIKnTTZ+iwVO+cJfyzZpCMwTjFt8sMA6eWz7gXGEAYaT48iTULVUomUIDE4N4kz109oQ5V81COOD5l85gwMxG2Vk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(5023799004)(56012099006)(261028144727099003)(261026140227099003)(261026121527099003)(261022105027099003)(261022075727099003)(261021123027099003)(10067099003)(261021121427099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iBEEN6L0ReMwKEuSeIJcCPuLXrsD50P01fsdXh14N3BmGpO0m1KTIYLZPdnE?=
 =?us-ascii?Q?d0XD2GFhMBHdO+P6jyW7PwoVZ8de+DVg6WxxH5XBLbr9E4HeZBn9K+OATDtb?=
 =?us-ascii?Q?GgZlelg5kyhp23a1s24MmA79l2ItVR3Dt09T/2xUHn+9dV62yz7eQORG2L0d?=
 =?us-ascii?Q?7Dlq0wHuUkPRYbmzavW182Fp3dEamBloTgOfNjrQHgpEPu5uoJvFqSu3p02o?=
 =?us-ascii?Q?fQgN+bqMonz9r4w3fNoG9WnL/PZOX3+8wL1as/IWbLi4mZUfD5swqjPnmn2S?=
 =?us-ascii?Q?v9O721vJWbsHwlcuvhgA4CI/PcvzIYgGDUUKmFcq5ej0xw7sddFm4ZphRp6L?=
 =?us-ascii?Q?dvILteEP38FwOgRw6DA6ri5WwfB46aaUPySzhRDLxDcPY8RbsGu+Xe9UGqVQ?=
 =?us-ascii?Q?s2mQXjORQ9f2i4RXsD2Wi0NXSlcb+57Xbltihk8DG17zvSHRkgdEjhm5bsJ8?=
 =?us-ascii?Q?opNmiJ0NwdW8Y8t6CpyqLykt2DcYVuoAcMGmwFupHUKvn7QMmUgOwPOq26qs?=
 =?us-ascii?Q?UvX+e+MJ/Q6EYndOYlRYGhx94CcZm5bjBZDnIfSIkBnOY7q+chRcNi1vmGNu?=
 =?us-ascii?Q?87E1HGpTAibE/vzZ5uPGzKrN7znrkY3Fxu3qRMmnEk7SCaOggMNqQ02sumM4?=
 =?us-ascii?Q?59qXqIOZXykzspsqJafdBLKw/W/XMND4HIZhUrp6K89KNBTaRT+dJ3IGakc/?=
 =?us-ascii?Q?Dh58xDoCWMIeIpF5vM0pY1nf/yyne7UHbSHDf/+tQFW/o4WeQxjenlHTfP3o?=
 =?us-ascii?Q?q6d/7IndMcQ//FOwL5vqkv5NcQSbZ5KJQGMMY56F+cTLehkpfU4jgEkaPcrh?=
 =?us-ascii?Q?q+RM3VlShLrXghwJLG/HVHxy/wWa/K6i9j//5EKW0XKCXPMCDnnfZhHvlajE?=
 =?us-ascii?Q?8Lvp83GSOktDfqRaUw9Z2RqJezxxM6N9BFhjgzhy8+XIXqBDgRL2siAwQ515?=
 =?us-ascii?Q?5nTdzNa4vORxRy56SJks9LfQVCZv0unxnRZYZ40rEy5t1CkR1zm4cCDrk/TM?=
 =?us-ascii?Q?KrZcQ7cL3RQvmjKTMyxSJSGY4os9ow7Fc6Y67+Q/3pi5WKoMg9PAbjfIRVkk?=
 =?us-ascii?Q?qXh5gdyMvWRMenaYFNrRXys8TPeZTITYntI7pmxRjQioPsYFIh5hk41l4wop?=
 =?us-ascii?Q?e2pe0xSpy/VU9bQz9jxCQzs6QvPm4HZzCZzraxjoA8F3WFGJmNlVIck5AOkM?=
 =?us-ascii?Q?Jw+65I5/fX2wjII8zSNFrkDQ/HsP6C0gD1e5TwSXMb6bp99pF47qZWL0riZt?=
 =?us-ascii?Q?AgtBoR51WypIiIrzUc1C50jCzTIPVoYain1qQjR6wt44NyM/l2oM4Bnr0D1e?=
 =?us-ascii?Q?E4VavtMHnOjCmcadRqPTt1/CuC5YU/QLkr/1a303w0AKVR3GhpWRNbbMJjS7?=
 =?us-ascii?Q?SfgdZ1yov4DzKqkSfUwa+6HQZtcXOUaXSGsFIQscUPsOkLbP/W6qV4lp24kR?=
 =?us-ascii?Q?LUAdqyeT0HZ1hxuVNx/Rh4AgbEj32OP3iYx14V4AEmUahE9hACI3SP+cJEwI?=
 =?us-ascii?Q?JZixVmgIwV80efZ22M3/XSlpvpgQR9SXjsRm/bOfy1XAlurcxafMIxDkpU8H?=
 =?us-ascii?Q?MUK6C3+yx5EwHWeoCs1X2DzIdzSbRCpi1YBx8S3wmfmK+m8pYnDkTYZxuPBX?=
 =?us-ascii?Q?s80v8wR3yQS3B9cppYcnhSGHXvh4NGO2/CZ2etvOcW+CIdOB5PaDE3crS81y?=
 =?us-ascii?Q?43WHtBjHLTPYVMW5XOBBExwUaoy2v1Ct31oY0eGOMq4+eT0zDylFTo0PzEys?=
 =?us-ascii?Q?It/nYvPd5xA+rzI2vzz7eidFT+5VIIA=3D?=
X-Exchange-RoutingPolicyChecked:
	ceKtrSygJIjNJCGZAUQEuxyLDVKkXjcLFLvs+jEJ7uTav3ankXdDHNzKsj08QOdFFSVfMp6tLDgNWoGU32Tu6aw7jug5wHWb4PeO/ewVSDlJpCvycp4dZ6KnSy/jhd0guYhDaY6fzjlshCntqUq8QQ+ndcHmm2nYdY0sWzUFpFhBxAkyi88N/68YWbX0N4V16vkGWMiQNs+IVs7H+fKP9aVzD/Jvr3PrslmRdLX4xMuynD8e/84zUGwqtSqzAMszxXX8wOS077BDBWVz3lcFQnvPlYNoNQDr2Mn++QJLEsUrE+IRjiAhPikebREOqdoOsFAonXG73+HiW5TdSPftxQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	li3+L9AqP953itGZz2eAzKkhwpfSZoWGqr1P81//mNm1sgH5EvbUJvigttwX5bOWQdf5/KH1nffI3FbFEfiKwOkDgPj7kFeA1iH6l7qKA1/U2NwYCMMwmctDigFLWR2ged/uD4JvjLQKcKeAjHpwxu75BwYr6zPn8C7WxjAqcnLS4YTG55Bnna0VGZBpL4u2Pyr3XtCF4pfLSlcbXCE6W77fx9moL5xOkZqqjYLZIwOYMTbkvArBH3cZQsNEXkzZJ4Dwka3Hm821BkYMf0s7gfzlGk0J/Yi8Y0H9lboosblsRPOW4jBVPLOznAGg1giU3bXVfM8TMML9UJFPoNdDDD/AxVb6ju/sqf1HzBqAuGSTReZNaIWaafVEUzl1uC11lfV2LybamwtB9HtwcpoGuUzGsEkRSUlpcUGXzVblaxiBim1cXzM8j3/I+fRSlcNaIf7HKTV4WCiEErcYBvsbNe19I0fp5EMTUfWwtBpwpNKMf4p4ooxZFcq0FUh1gLBcObEBguJneLwcA9yaAf0cupv778bmVxNv/ghdCGf1esLOXDhZoDFFiJe6xCeE9/rYspYxQH5UEaw7SY0/v2+NtKJ+GIomXzFuZc5PHtZvWj8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38e3287d-bf78-4b95-e07f-08df36bd56be
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 19:38:14.2763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BuxZL9C0To9JMycEp6CCGfSo3poggnAjiqCtl37z24qrzVgPM1yC4ENYDH+bmTOpMa0WOMO2OzNa9thcfOI31/Bcusm7flOZRclLGcBRlFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6742
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 adultscore=0 mlxlogscore=965
 suspectscore=0 phishscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300078
X-Proofpoint-GUID: wxo9obahI2h-bgHLGMOxb2XC-miOegJQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX+INdG4ijYww0
 5J8YVaWGSoYKJUrnka19qba9T6RLMRWNNdwGh02Jl7Af2Y4rNnckgKmcvnsqPo9e0unj/lQsB9z
 v6+1e/W6s3YZkYomZEHwCsCn8mdAl9ooCrlfP77oNe6tOfn8DfBE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX4E9UVJdthsyA
 /MD+oQkaGq83gLt2RJY4H6U6uf7ibmD0Nzieg5pbXD5SrMUwJ/ieiQ9fHg/FOGPQm06uqqNHGAr
 ra792edZ87M3y2AbsHa8Q7KQAiWsDR4jBI3k0bIWlSk3VsX6/7W/he8UV3bHZo4gvHIpxH7zB4Q
 7Xsq0/Vz9upj/0mbja1nsQTl9JR5AcVCclVR2RmA7tOFD2SNi57EkIGf1sTCBWAvPhA3SvL5+Ps
 vZfU6PRW4VpgEGyA3ovy1ZcZ7mGwhglM+JjeHAc7F0+/4VYwdpHoLSr5mXN3S+gdnATNe6NHbgZ
 ilqpX3iKYBcpBUzwL21RTAYHcj5B99Zxr1Jitmi1Wy3cR08MYJ1jruuVt6FWgDjpQUjdz8dcQyn
 IuILxy4V65GCBQ/PHV9BvTZQ4h2hBwbDReQUQaF3sqTx3Wycn+CdBL8qgDKGU3zwjDxrS6XMNAM
 0mAVNz8faHJoHFvU+lw==
X-Authority-Analysis: v=2.4 cv=arsnmiZV c=1 sm=1 tr=0 ts=6ae4f22e cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x4eqshVgHu-cdnggieHk:22 a=r3ebCIc__9ZSGVoFWUYA:9
X-Proofpoint-ORIG-GUID: wxo9obahI2h-bgHLGMOxb2XC-miOegJQ

---
 libdtrace/dt_module.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
index bd92d126..6868268e 100644
--- a/libdtrace/dt_module.c
+++ b/libdtrace/dt_module.c
@@ -1588,6 +1588,8 @@ typedef struct dt_kasstate {
 	GElf_Addr	mod_saddr, mod_eaddr;
 	char		mod_name[PATH_MAX];
 	FILE		*rfp;
+	char		*line;
+	size_t		line_n;
 	int		kind;
 
 	int		kernel_flag;
@@ -1630,8 +1632,7 @@ dt_kasstate_new(dtrace_hdl_t *dtp, int kind)
 static char *
 dt_kasstate_modname(dt_kasstate_t *state, GElf_Addr addr, const char *name)
 {
-	char	*line = NULL;
-	size_t	line_n = 0;
+	char	*line;
 
 	/* Nothing to be done if there is no modules.builtin.ranges file. */
 	if (state->rfp == NULL)
@@ -1658,9 +1659,10 @@ dt_kasstate_modname(dt_kasstate_t *state, GElf_Addr addr, const char *name)
 	 * is found that either contains the address or goes beyond.
 	 */
 	while (addr > state->mod_eaddr) {
-		if (getline(&line, &line_n, state->rfp) == -1)
+		if (getline(&state->line, &state->line_n, state->rfp) == -1)
 			break;
 
+		line = state->line;
 		if (sscanf(line, "%*s %lx-%lx %[A-Za-z0-9_ ]",
 			   &state->mod_saddr, &state->mod_eaddr,
 			   state->mod_name) == 3) {
@@ -2051,6 +2053,7 @@ dtrace_update(dtrace_hdl_t *dtp)
 		if (state->rfp)
 			fclose(state->rfp);
 
+		free(state->line);
 		dt_free(dtp, state);
 	}
 
-- 
2.52.0

