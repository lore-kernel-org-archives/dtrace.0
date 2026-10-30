Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793389122;
	b=fJScn1FP2iTPd+XMQEiYV9qOQtghTV53iur82BeGh4KJxfPBkqkueEjeSmXg1+3T5Yuk
	 44nMF4docDwCVw2Eammk1GfeHO+wftMJwwse4904Vv12fEyERI7kbn/y49Tuxm2qLhi3k
	 8c+Tb65t5wKtEKTgCZXWQ2trsQjPVl2WAXxzunq2DoJ566kPcALd7Dm3WzYCRpCUYvCtH
	 e6MO4lJ63b9h/9Yg26S38/zItIwBeNb0/WrTXjVNkjRRgH0vqvVlAPsU8K1AOS4yhhApO
	 lKUgiiPbJ970oBSK+Pj3PZnVZiNlwLDxyVnyeT8QRTs25VjZQd0IBkfwbhfoRZPKwBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389122;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Subject:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID;
	bh=lJ9bZnvVZs1l5IW8lqEbi0b7hn6p43e5GPSz+927nCM=;
	b=J3n0GFLrUHJGtQu+SZyawJUGqYbR8s5D8UZ7YKxVnMMoi69dyNYulgRqHs8P1cnqKT5B
	 qfq7XezgUdJ7XB+Nr+Tc4h94Og+94sukucHo1/A0gGzbc8ybCcSQ/hcz9abmwBNVEqwsG
	 +P9lko5HzAxJ/YYJ1uCIyYN0mqrOv8C8Jc3xPSCOPaqnuKjBRPE/3SCM97OgoMl+O1Wcs
	 zZBL8gbP9TcR/NKlEgtdsIOUfBFik3mFql4aBwu6n+HNHOuPGu1YNEwMrd/F4XtTR6ehN
	 tuo6C4Ly6Lp4FAs10YCWDEwRQV32zCQNj1cRIzrrjaBQF8YFbVqgmqjxvYHpctF0ShQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=PhnhTEgD;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b="uT/6Blqp";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661D7606A31A
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 661D7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=PhnhTEgD;
	dkim=pass (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=uT/6Blqp
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UEXTht437421
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=lJ9bZnvVZs1l5IW8
	lqEbi0b7hn6p43e5GPSz+927nCM=; b=PhnhTEgDEtAUQY3Xs58HbDyj9b3JJ0yU
	kaFSm2LHvgvlhWjjbvPiGSTTTW4twx4b/36JeMoUyP/eygAM1zb4TS39L3be0DI1
	saSmw2JXvwnQbKrPIKKSTtYln7Be1xfknuiIS44fs9pW2NFvf4iDvSnCRpF8coCp
	9/F2z3jil2dP/yYheh5YuDDHOcddtQOyONz8YPHFDXTD7RSsSUFa9u4MddxpIBD7
	Ch1XsDslfOOV6vNGKJhmHfnYhWiH8/ZeYMIGgQwc7fxIfQlx1chmd/3tgVKwZkRk
	DOjLvoqimew2DycQhj/BneV9mA+2WsaU+OEXcGHgry7j1sdZerFTsw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hme5p1dra-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 69UHvmiE433956
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:36 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012010.outbound.protection.outlook.com [40.93.195.10])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4hmyuy3j1x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mM3DqBtk3mG7+GXhykKvmz7a/tmN8F+jMt/LowAJ+lAfaUhPOpCK3Md6Bsqq6H8gnCZwHxttvQlvdOQTRPbdH34FESD8RN0yw0zHwjwOT/SdM1PQ0jA+KW6TM4PSEI+5WjAhXva7CpEjNAid9WQhSt+leF8/q1EE+mSm+cexPRbanXDfMz9hvt9lx4uLVkDfhfYV4oS0kMxGg/N0QoGmsPQzX+k+Hiz3mk22FY2n8PWb7pP3RQ23VaYCrxS9uSKn2EPjB0sMDT2FO59syrrAk/SPzKjJ7DNdtJMfiz9fhVDNhldpN6LoQUmgxrCCGm1BQakorzGUk7lErH7i4f7yZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJ9bZnvVZs1l5IW8lqEbi0b7hn6p43e5GPSz+927nCM=;
 b=IvApxeplQrHZFeQlkwAGOWrcKMHWKNGh1SZpc8j7h3wfUinGbw+mRxyB8RjQn9KGdZQfgwUKsdosyWD2TMqQ8HIonYqcGWDRys1UGC0n7p829QLweclOZ9N9EqCTNIV4khkJFLsfFIR3CPMIj8dPgyqeLxYAwrijBN9jfeB3uIA7TzIudUSjCgJ3IN0EYSes/ohtB76jrXJm8Zrr+4/F7xuw56LLkCQLzmtJF58sw88zslyctPd3NNqjH7G+LCF9d3HiisP5DVG2Mv+rUxso6gfEzuYia69IVLYM0CvV+xL+rlw+YhwLcj2zi2TGN0a7kK9Ait63DGlcJ8ipGQTgEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJ9bZnvVZs1l5IW8lqEbi0b7hn6p43e5GPSz+927nCM=;
 b=uT/6BlqpttboBFhWRXKxOxDpAMjGus+/bBCDhGKyksKT+DyHf/G30p7Eft03me6nggdTANC40can7H4SGYKOPw7bAJjlmm2eZM24lRQUF0WGP1N+2rSYrkjq+yXTUFhiIfMHIJHL5SPcD5SHnf2Nfk43ntB3xrCVX1C+MXPnGCE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by IA1PR10MB6052.namprd10.prod.outlook.com with HTTP via P2P; Fri, 30 Oct
 2026 19:38:30 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 19:38:30 +0000
Date: Fri, 30 Oct 2026 19:36:55 +0000
Message-ID: <9a3ef30ca35af2d994b6f8a42a8e6700@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 15/20] libdtrace: search both ELF symbol tables for module
 symbols
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:510:174::17) To CO1PR10MB4769.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|IA1PR10MB6052:EE_
X-MS-PublicTrafficType: Email
client-request-id: 07fa0d0e-8c37-43ce-b3d2-778c48b820a1
request-id: 40c0a625-b7ba-45b4-5b5e-08df36bd601f
X-MS-Office365-Filtering-Correlation-Id: 40c0a625-b7ba-45b4-5b5e-08df36bd601f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|261028144727099003|10067099003|261026140227099003|261009223027099003|56012099006|261022105027099003|261022075727099003|261021121427099003|261021123027099003|6133799003|261026121527099003|18002099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	CiMZUPt6aBrFGkj0CuxR1byUCGsY5p9yD7Tlk8znYBWPalcrj48ZZnrgUuveRXwjOwi+ZnSYXQa54E4/6Z+M54O8S4B1n8QP9BNrWZb7GyrRsV0ZkYP7MZhiCjpDFpvEjD7Y5EIUh28q9QtxfGZKYDFy1id/GGJ1wzeMLQycdLelqNvQ8LQCKn7NThdA1W3bzqCl3X/YQEi+lAEQkDv/GKX4fYszrgtgIoL7SOLjj0FdQplkZFx9p8Z5KZQd1BKqIwi9IGUT4XQiBDQCbpjyOaV9YbFit5ysKZRvOC7+8xChIq6YE1VwwVQUZuPnjoeRbqPyx8EE5we1mf2GqJvqFdP4PTp2+vdG3isfNec/tFh1oIRgNwPYC6dYDM2rz/4Yt7LTq8YWmVHlfic/zdoarFnEQMza70z2eK7QIQKTKpkM2uCK+j6Z0nzAeAAGJL7HsFu17W/eF9LhuE1Pd59xKCiszD8viYDQwjTXuxEPs1WJh0J74tqo7Ft3u40SNyrGS++zTAA9Lvd8Sk+lGTk2csoHLf5ixBSmtl6KONBpEibHcGWqRJU2+wX28YVwHuYZa5/gXz5iZiM5jUmDJjyp4ss2CCvaM9yxZRU7fYBOtKGSAxfGMwF/hqEPhqzM4kJ4IdnoRSTNhrx5jhBiSmJJdhq9Ga4qYQHm4cVjJy1y2z4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(261028144727099003)(10067099003)(261026140227099003)(261009223027099003)(56012099006)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(6133799003)(261026121527099003)(18002099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDNJanladGYrNWcycHV4QkQ1ZlBjTkRRay9nV3FzVEh0OHdHL21wekdncG1Z?=
 =?utf-8?B?cFg2UUhVTEk2ZXlHUzBsM05oOU5FTTJlaFR1Rk40ZjRGY1dZQlBISjBkTzJH?=
 =?utf-8?B?MjFOZ1o4NW9oZWVkQmh2STNIa0kwQUR3R0s3eUxJbHdVVFR5RE5TWHpSM3lp?=
 =?utf-8?B?UjJCUjVjaG9QdlFmRWF3N3VZQnU3ZkN2ZGJhYlNYeGUyYWx0N1J3MUVJRWVu?=
 =?utf-8?B?eHNKYUFGQzVqbGtyS1VHMFUzekJoSHhkRE5SVnVIeElzSFBJTXFrR21FN3VC?=
 =?utf-8?B?N1ZRWnVGK1FyNFZodWo1Ri9pQjdkcDU3bTRtNjZ1RnJvaXM5bEtZSGRlQ2Ju?=
 =?utf-8?B?UjZZS242RHdSTnY3WGRTRmNlRDNlZEJsa09xT2REejJMQktqTG51Q01MaHZh?=
 =?utf-8?B?RU5FTnRCWkdIYjBvUlNrNHp1MXZNV01seVBXTVFlN0FIWHpha3UxNFlZcGo5?=
 =?utf-8?B?UnNSTG9SWjBhdlRZMzhHc205UTN2S0g1bGZlQXE4NzAzdkJCYlZHaUdUNEZB?=
 =?utf-8?B?aldQa205OVVHNmxmUGFDNFhtT2pWRlNkTzJoZWNNMVcySzBIdFg0SFJPS2h5?=
 =?utf-8?B?NkVUM25FRUM4L0hoYmVzOTJuSGZubmFSNlk0Wi91RkhZdkVZMk5wZEhBd29C?=
 =?utf-8?B?cDBtUjNGU0luOHU5VGlLY284MjUwd2NxZUl0bW5RNVIwTW1NTTdXUGFpbVBI?=
 =?utf-8?B?TXhoMzd4TDh5cHlmUE1RR3JLTEVhWTNqd3ZyMUdESFIwc1J5WTBLcnYvL3VU?=
 =?utf-8?B?KzlhalRQMThIOHdOa1lpamIvRXRYTmxPNHUrTkw2MWl1TStsU3NLYkVsNyt6?=
 =?utf-8?B?UlY5OXZkV00zTTh1N1V2ckVIYmlLWGNXYWJMbjAxYjVzN01FdXc5TjBGWTR3?=
 =?utf-8?B?T1NQa3NkMmFKWmJRS2o2NHI2dWFqWFgwT01NODRZeldmY3Evb0loSkQwYmF6?=
 =?utf-8?B?dyt6MW54USs3QVRUNGhxMmFHZjNYbEd6ZzhrdU9HOE1mQTc4bklKWDVUTEwr?=
 =?utf-8?B?QXJJSmRoWWE2bHMzTnphUTdMUmY3NVlsUGtrVzNnazcweW8vQWFmMkFSMHRn?=
 =?utf-8?B?L0pqdUwzSnlaTzAwMHFGc05vT2pNWEsvWTgxR2l1SzVJNnJZWEpTUzg5ZlZs?=
 =?utf-8?B?Sk41VWprOXQwZTFMb0xGUTBzSEhiRzA3YlJ2c3k3NnJmZUR6VDR4eHQxc1Nz?=
 =?utf-8?B?Nkw4M1ZEaW4yR1F1b0lCeHltMitxWTBhb2VpZGYrR0VxL0dhMFBPREhscnRm?=
 =?utf-8?B?eHFyVG90bm52M0NHblNLWnduNTlITmkxVGdZMkRsbEU2V1Q1TjJEV2pnd2xv?=
 =?utf-8?B?NlNBREliTGZISnlJUUtldnV6QjNhZTEvK09BQTV5K2FiRWcvWTdRd1oxVVRR?=
 =?utf-8?B?SEhEeEZjYW5zVFZpZjlpSnoxdXhxN2llWStaUU9zQ3FTUWVwL29pMTR4cDhO?=
 =?utf-8?B?VU5vNkVDaXhBcmkvdEgrcXJiVmFDMmhQRXJVQXdpT0xMakFxYllNTEcrM3FM?=
 =?utf-8?B?TisycXVvT0h1MnFTZUVuWWtGdTVKME1JNTVmenZLN3VtZ3g3Y2Z5VW9qb1dB?=
 =?utf-8?B?c2FRRFJsZ0hmNkJJc2NyQWhPK2g3dk1QODlsQ2kyK241TzVzUiswNzc0WWt5?=
 =?utf-8?B?czdXY2RUQlZCbmFxbDIrbHFzUXVJWlJ4UVR2UGJHWkIxeVZFZFpWSVB6Y0pT?=
 =?utf-8?B?TDRWaFZEblVPMUs2WVNTS0FRTjdXNjMyYXFFZEZaeUdzdElPYmNMQ3hWcmJB?=
 =?utf-8?B?M0JwYi9hZEJTM3phT2dSV2VQK1JRRTF5ZTZyWVkvZjBWdjhGVTBxa1lsTDla?=
 =?utf-8?B?QU1BYTJzeUJyNzRqWldEaDd5dlR4NXI4di95UHhWZWFEcjF0Yk1WaWxOcXMw?=
 =?utf-8?B?N0FXR21nTjVUYllwYzlZSWZMc2l0enZnWk5hTjhxdS9kdDJTYTBIcjZySGdm?=
 =?utf-8?B?eVdzNE9YNm9mR3RQdzNBeXJOZEQ5ZXdZOGNqMUl2eDdLY0ZMMmUrTlJRajVG?=
 =?utf-8?B?ZFJFN3VBZ3NxMG01bWlaalVORTJTbk1EcUFOaDRIaUVOMVUwMW44c0REUHdC?=
 =?utf-8?B?bmluYk5EbHBwZ085YjNlZk5nTmNWSWMzS1VxdFN3VkNuZ3J3cW15eDF6eTY5?=
 =?utf-8?B?RnVyTFIwSGxEeWdkTksyRlpKSUpIQ2kyQTVCL2YwN2pCd1BhL3NnWExSZjht?=
 =?utf-8?B?bTY4TDBRYU52Y0VJOE9xa3NWUndvYjBkbndsZllJbEdaR29VTk52SnR0c1do?=
 =?utf-8?B?ZmdKRWtoaGNLcDNEbnNiNU51RGtlVnZvWjRZQnJUTEl1Sm5JYWdGM3ErL2w3?=
 =?utf-8?B?RCt0OEJJWit5R2gvRkVTQTBXbDRzR2JIUUtyVUFDeVdNV1hZdGg3a2g3cDVB?=
 =?utf-8?Q?sq6brf9vG9qXpHrs=3D?=
X-Exchange-RoutingPolicyChecked:
	4qu9A6hg5xx8I02T+rh8UJtsiY5tKUYnPQGZFwT4j/st7SO6ZJUPotd/VjKHdEOOiIre4ikKi5hvW7DiUqoc5LVSUFC/CeoYwHzs9yFwxSpqaRiZRJPn8vAmojS47JxTu1JPdNFKV0ISe5r5lWr4MQJFrE0GcPmzTn6I3HaqXmVCBvYHvQdTucuBmvsHmwUAPX8O9YzXV2afUi5qY+5DCtKzb0mgx9/Af9NnuIMm9v33W7nSFgf4A5P0AnchOGQ5TaDw5rzLI4pz71L/BrARFsLpif0mz75zKkwe1yo6dRhohDdwJtUk8SojiwnQm4cfSIv3dUigvFArPzkT3zhjLA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CigB+j1ziz37WilIHtMsSlWSshLdrO9kaEZpBjcYH9EHWF0/j29M7sSNYkaGz+CXVKS2qFPuY7yH7DE64yhA2eEvKv8LgHJUu6Mkxam/LwWFrzG7hv9pb8mlrlee2wrUh3Q8ooz43QG3PQWp33e9MiIW9KxFfZIIFInT8mbyUDu2K4FI8OV6i2p4NpvZadGNGMXjl2NavArepP437wpIMqNoI3kH2EFHd/moD0bUztoNb2AKFyaxSGdsJd8Y48VhhiEEhZ3jlCYS+QMW2Op9YuKBso77LyjPcO69Ae4lmxPXR1n09jpzy15C1uSCU/BiCZ2hjOj1TWVQXib0na95Ez7vbumBGTSWQ7S/oeOctyZhsDqq4o/GORW1hvryy8vV6fsR3N8D/MJw+D/JLnFQJMVe7+XAa/DfkfUORL0lCM41K7KVpJSLnvDjkoJun7/r9lq0lwjORKZgG1YQqjSQQNRabP9bx/inlzXD4hpy5aagWl6C79qHLMZMIu9EzzxCLSbcvIKh46Pu9xdAyRoyDQ2WxCVNSOgdNc7kqvLQxrPVSBK6C5C357QzxNTOwCxqGvBIR0SVo3hso311BsYzSX/g8moqDUN0KAHYEk+dOHs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c0a625-b7ba-45b4-5b5e-08df36bd601f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 19:38:30.0640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6FVTwtapwyLVqH32LfdIRN7gjgGSGvYft8ZN/a0hJjmdpR5V7NsPIoXGvqHya/u6uuqto+MOcswJumzOFBSvUHTsoV/uz9y81CayXHOImj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6052
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0 lowpriorityscore=0
 mlxscore=0 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2610190000 definitions=main-2610300078
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX0UFzhA131f2P
 lr0wciXdSrgFqbqCttA085c1oPEcmM3pT4z3i8jhB/n0WpPsAhImlnfwkwnvJCXiss1G3L821Yw
 wBQ9ARIdAyyqD2J4muAR4Wh/7jEGoG0Gx1TT9ZvOYDV98MX2bkqiQRtrv0P+SX7Nb+4nvl2/lFr
 p8W2iCx94hXs08wv8+Hmc1WEwhLd/ieQ2KlyTsO06WRYm2HKuzQVHGI5ohTDqGtsqEj7BT/3Whm
 AwoTZCCZvoJKRIOgmssSO5oZ9nRqR9foIn9Afob0gEXRQTK/dBMc2HBTsESUMEBq4PMU1fBR/ph
 vjsQ4EhIL4qpb1L18wf/E82kFOJPelqkeI9Yer63+asozWfY+gPG0KL+oYyM00ABYAFicHTM9+V
 VuIrlWXxTv7Zm1Fmiw50z3GQp+uaTPqOowJq0UqEzqQMM7kW9KGx3+9FazIUtHmQVsVn8YQEx71
 7XKGHUgtfbFKCTRc9jA==
X-Proofpoint-GUID: _puSpNa159b2vxvmxKNngHJokrNMXepE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX5+G+VNvO3maf
 0847PYbXZ3ttvmjg3iUsrrw5jqFkquFEKsd2CUBO1xZd4FN0RX/5kZsfALzrcCvND4DpWR8r7Xb
 bDpp+SjfQ235Qcef6YF9RbBPH94U/6qYTYeK8J2XmqLtLkpdC6WJ
X-Authority-Analysis: v=2.4 cv=fKGsTpae c=1 sm=1 tr=0 ts=6ae4f23c b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8
 a=apRNN_dqIWFuG4AA3T0A:9 a=klqMXVf4mAwJMg4J:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-ORIG-GUID: _puSpNa159b2vxvmxKNngHJokrNMXepE

Keep independent symbol and address indices for SHT_SYMTAB and SHT_DYNSYM,
loading strings through each table’s sh_link. Search .symtab before .dynsym
and include dynamic-only names in module symbol iteration.

Preserve .symtab indices for CTF, place dynamic and external symbols in
separate ID ranges, and use .dynsym for CTF when .symtab is absent. Allow
offline kernel modules with known address ranges to use ELF address lookup
while retaining runtime symbol lookup for loaded kernel modules.

Add synthetic 32-bit and 64-bit ELF tests for missing and individual tables,
duplicate-name precedence, distinct linked string tables, public name and
address lookup, symbol IDs, and iteration for user and offline kernel
modules.
---
 libdtrace/dt_impl.h               |  41 +++--
 libdtrace/dt_module.c             | 281 +++++++++++++++++++-----------
 libdtrace/dt_symbol_modops.h      |  16 +-
 test/internals/elf/tst.symbols.sh |  10 ++
 test/triggers/Build               |   8 +-
 test/triggers/elf-symbols.c       | 203 +++++++++++++++++++++
 test/triggers/shared-ctf.c        |   6 +
 7 files changed, 433 insertions(+), 132 deletions(-)
 create mode 100755 test/internals/elf/tst.symbols.sh
 create mode 100644 test/triggers/elf-symbols.c

diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index c83fedb2..adb20884 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -115,12 +115,14 @@ typedef struct dt_intdesc {
 	uintmax_t did_limit;	/* maximum positive value held by type */
 } dt_intdesc_t;
 
+struct dt_module_symbols;
+
 typedef struct dt_modops {
-	uint_t (*do_syminit)(struct dt_module *);
-	void (*do_symsort)(struct dt_module *);
-	GElf_Sym *(*do_symname)(struct dt_module *,
+	uint_t (*do_syminit)(struct dt_module_symbols *);
+	void (*do_symsort)(struct dt_module_symbols *);
+	GElf_Sym *(*do_symname)(const struct dt_module_symbols *,
 	    const char *, GElf_Sym *, uint_t *);
-	GElf_Sym *(*do_symaddr)(struct dt_module *,
+	GElf_Sym *(*do_symaddr)(const struct dt_module_symbols *,
 	    GElf_Addr, GElf_Sym *, uint_t *);
 } dt_modops_t;
 
@@ -138,6 +140,20 @@ typedef struct dt_modsym {
 	uint_t dms_next;	/* index of next element in hash chain */
 } dt_modsym_t;
 
+/* Independent ELF symbol tables: preserve indices used by CTF. */
+typedef struct dt_module_symbols {
+	ctf_sect_t dm_symtab;
+	ctf_sect_t dm_strtab;
+	uint_t *dm_symbuckets;	/* symbol table hash buckets (chain indices) */
+	dt_modsym_t *dm_symchains; /* symbol table hash chains buffer */
+	void *dm_asmap;		/* symbol pointers sorted by value */
+	uint_t dm_symfree;	/* index of next free hash element */
+	uint_t dm_nsymbuckets;	/* number of elements in bucket array */
+	uint_t dm_nsymelems;	/* number of elements in hash table */
+	uint_t dm_asrsv;	/* actual reserved size of dm_asmap */
+	uint_t dm_aslen;	/* number of entries in dm_asmap */
+} dt_module_symbols_t;
+
 typedef struct dt_module {
 	dt_list_t dm_list;	/* list forward/back pointers */
 	char dm_name[DTRACE_MODNAMELEN]; /* string name of module */
@@ -157,7 +173,7 @@ typedef struct dt_module {
 	dt_idhash_t *dm_extern;	/* external symbol definitions */
 
 	/*
-	 * Kernel modules populate the fields below only for the sake of CTF.
+	 * Loaded kernel modules populate these fields only for the sake of CTF.
 	 * When a CTF archive is available, most are not populated at all.
 	 */
 	const dt_modops_t *dm_ops; /* pointer to data model's ops vector */
@@ -165,8 +181,7 @@ typedef struct dt_module {
 	ctf_file_t *dm_ctfp;	/* CTF container handle */
 	void *dm_ctdata_data;	/* CTF section data (dynamically allocated) */
 	ctf_sect_t dm_ctdata;	/* CTF data for module */
-	ctf_sect_t dm_symtab;	/* symbol table */
-	ctf_sect_t dm_strtab;	/* string table */
+	dt_module_symbols_t dm_symbols[2]; /* .symtab, then .dynsym */
 	uint32_t dm_btf_id;	/* BTF dict id */
 	struct dt_btf *dm_btf;	/* BTF data for module */
 
@@ -174,18 +189,6 @@ typedef struct dt_module {
 	 * Kernel modules only.
 	 */
 	dt_symtab_t *dm_kernsyms; /* module kernel symbol table */
-
-	/*
-	 * Userspace modules only.
-	 */
-	uint_t *dm_symbuckets;	/* symbol table hash buckets (chain indices) */
-	dt_modsym_t *dm_symchains; /* symbol table hash chains buffer */
-	void *dm_asmap;		/* symbol pointers sorted by value */
-	uint_t dm_symfree;	/* index of next free hash element */
-	uint_t dm_nsymbuckets;	/* number of elements in bucket array */
-	uint_t dm_nsymelems;	/* number of elements in hash table */
-	uint_t dm_asrsv;	/* actual reserved size of dm_asmap */
-	uint_t dm_aslen;	/* number of entries in dm_asmap */
 } dt_module_t;
 
 /* Handle-wide address index.  order preserves module-list precedence. */
diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
index 3b40c1cb..2b91f1e6 100644
--- a/libdtrace/dt_module.c
+++ b/libdtrace/dt_module.c
@@ -270,11 +270,11 @@ static dt_htab_ops_t dt_module_htab_ops = {
 };
 
 /*
- * Symbol table management for userspace modules, via ELF parsing.
+ * Symbol table management for ELF-backed modules.
  */
 
 static void
-dt_module_symhash_insert(dt_module_t *dmp, const char *name, uint_t id)
+dt_module_symhash_insert(dt_module_symbols_t *dmp, const char *name, uint_t id)
 {
 	dt_modsym_t *dsp = &dmp->dm_symchains[dmp->dm_symfree];
 	uint_t h;
@@ -322,6 +322,56 @@ dt_module_symgelf64(const Elf64_Sym *src, GElf_Sym *dst)
 #include <dt_symbol_modops.h>
 #undef BITS
 
+/*
+ * Keep the ELF tables independent so .symtab IDs remain valid CTF IDs.
+ * Dynamic symbols occupy the public ID range following .symtab.
+ */
+static GElf_Sym *
+dt_module_symname(dt_module_t *dmp, const char *name, GElf_Sym *symp,
+    uint_t *idp)
+{
+	uint_t id;
+
+	if (dmp->dm_ops->do_symname(&dmp->dm_symbols[0], name, symp, &id)) {
+		if (idp != NULL)
+			*idp = id;
+		return symp;
+	}
+	if (dmp->dm_ops->do_symname(&dmp->dm_symbols[1], name, symp, &id)) {
+		if (idp != NULL)
+			*idp = dmp->dm_symbols[0].dm_nsymelems + id;
+		return symp;
+	}
+	return NULL;
+}
+
+static GElf_Sym *
+dt_module_symaddr(dt_module_t *dmp, GElf_Addr addr, GElf_Sym *symp,
+    uint_t *idp)
+{
+	uint_t id;
+
+	if (dmp->dm_ops->do_symaddr(&dmp->dm_symbols[0], addr, symp, &id)) {
+		if (idp != NULL)
+			*idp = id;
+		return symp;
+	}
+	if (dmp->dm_ops->do_symaddr(&dmp->dm_symbols[1], addr, symp, &id)) {
+		if (idp != NULL)
+			*idp = dmp->dm_symbols[0].dm_nsymelems + id;
+		return symp;
+	}
+	return NULL;
+}
+
+static const char *
+dt_module_symstr(dt_module_t *dmp, uint_t id, const GElf_Sym *sym)
+{
+	int t = id >= dmp->dm_symbols[0].dm_nsymelems;
+
+	return (const char *)dmp->dm_symbols[t].dm_strtab.cts_data + sym->st_name;
+}
+
 dt_module_t *
 dt_module_create(dtrace_hdl_t *dtp, const char *name)
 {
@@ -777,6 +827,73 @@ static void *dt_ctf_uncompress(dt_module_t *dmp, ctf_sect_t *ctsp)
 	return NULL;
 }
 
+/* Load a symbol table and its linked string table, including stripped ELFs. */
+static int
+dt_module_load_symbols(dtrace_hdl_t *dtp, dt_module_t *dmp,
+    dt_module_symbols_t *syms, uint_t type)
+{
+	Elf_Scn *scn = NULL, *strscn;
+	Elf_Data *data, *strdata;
+	GElf_Shdr sh, strsh;
+	size_t entsize = dmp->dm_ops == &dt_modops_64 ?
+	    sizeof(Elf64_Sym) : sizeof(Elf32_Sym);
+
+	while ((scn = elf_nextscn(dmp->dm_elf, scn)) != NULL) {
+		if (gelf_getshdr(scn, &sh) == NULL || sh.sh_type != type)
+			continue;
+
+		if (sh.sh_entsize != entsize || sh.sh_size % entsize != 0 ||
+		    sh.sh_size / entsize >= UINT_MAX ||
+		    (strscn = elf_getscn(dmp->dm_elf, sh.sh_link)) == NULL ||
+		    gelf_getshdr(strscn, &strsh) == NULL ||
+		    strsh.sh_type != SHT_STRTAB ||
+		    (data = elf_getdata(scn, NULL)) == NULL ||
+		    (strdata = elf_getdata(strscn, NULL)) == NULL ||
+		    data->d_size != sh.sh_size || strdata->d_size != strsh.sh_size ||
+		    (data->d_size != 0 && data->d_buf == NULL) ||
+		    (strdata->d_size != 0 && strdata->d_buf == NULL))
+			return dt_set_errno(dtp, EDT_NOMOD);
+
+		syms->dm_symtab.cts_name = type == SHT_SYMTAB ? ".symtab" : ".dynsym";
+		syms->dm_symtab.cts_data = data->d_buf;
+		syms->dm_symtab.cts_size = data->d_size;
+		syms->dm_symtab.cts_entsize = entsize;
+		syms->dm_strtab.cts_name = type == SHT_SYMTAB ? ".strtab" : ".dynstr";
+		syms->dm_strtab.cts_data = strdata->d_buf;
+		syms->dm_strtab.cts_size = strdata->d_size;
+#ifndef HAVE_LIBCTF
+		syms->dm_symtab.cts_type = type;
+		syms->dm_strtab.cts_type = SHT_STRTAB;
+#endif
+		syms->dm_nsymelems = data->d_size / entsize;
+		if (syms->dm_nsymelems == 0)
+			return 0;
+
+		syms->dm_nsymbuckets = _dtrace_strbuckets;
+		syms->dm_symfree = 1;
+		syms->dm_symbuckets = calloc(syms->dm_nsymbuckets, sizeof(uint_t));
+		syms->dm_symchains = calloc((size_t)syms->dm_nsymelems + 1,
+		    sizeof(dt_modsym_t));
+		if (syms->dm_symbuckets == NULL || syms->dm_symchains == NULL)
+			return dt_set_errno(dtp, EDT_NOMEM);
+
+		syms->dm_asrsv = dmp->dm_ops->do_syminit(syms);
+		if (syms->dm_asrsv != 0) {
+			syms->dm_asmap = calloc(syms->dm_asrsv, sizeof(void *));
+			if (syms->dm_asmap == NULL)
+				return dt_set_errno(dtp, EDT_NOMEM);
+			dmp->dm_ops->do_symsort(syms);
+		}
+
+		dt_dprintf("loaded %s [%s] (%u symbols, %u addresses)\n",
+		    dmp->dm_name, syms->dm_symtab.cts_name,
+		    syms->dm_symfree - 1, syms->dm_aslen);
+		return 0;
+	}
+
+	return 0;
+}
+
 static int
 dt_module_load(dtrace_hdl_t *dtp, dt_module_t *dmp)
 {
@@ -864,76 +981,23 @@ dt_module_load(dtrace_hdl_t *dtp, dt_module_t *dmp)
 		return 0;
 	}
 
-	dmp->dm_symtab.cts_name = ".symtab";
-#ifndef HAVE_LIBCTF
-	dmp->dm_symtab.cts_type = SHT_SYMTAB;
-	dmp->dm_symtab.cts_flags = 0;
-	dmp->dm_symtab.cts_offset = 0;
-#endif
-	dmp->dm_symtab.cts_data = NULL;
-	dmp->dm_symtab.cts_size = 0;
-	dmp->dm_symtab.cts_entsize = dmp->dm_ops == &dt_modops_64 ?
-	    sizeof(Elf64_Sym) : sizeof(Elf32_Sym);
-
-	dmp->dm_strtab.cts_name = ".strtab";
-#ifndef HAVE_LIBCTF
-	dmp->dm_strtab.cts_type = SHT_STRTAB;
-	dmp->dm_strtab.cts_flags = 0;
-	dmp->dm_strtab.cts_offset = 0;
-#endif
-	dmp->dm_strtab.cts_data = NULL;
-	dmp->dm_strtab.cts_size = 0;
-	dmp->dm_strtab.cts_entsize = 0;
+	/* Cached CTF does not supply the ELF symbols of an unloaded module. */
+	if (dmp->dm_elf == NULL && dt_module_init_elf(dtp, dmp) != 0)
+		return -1; /* dt_errno is set for us */
 
-	/*
-	 * Now load the module's symbol and string table sections.
-	 */
-	if (dt_module_load_sect(dtp, dmp, &dmp->dm_symtab) == -1 ||
-	    dt_module_load_sect(dtp, dmp, &dmp->dm_strtab) == -1) {
+	if (dt_module_load_symbols(dtp, dmp, &dmp->dm_symbols[0],
+	    SHT_SYMTAB) == -1 ||
+	    dt_module_load_symbols(dtp, dmp, &dmp->dm_symbols[1],
+	    SHT_DYNSYM) == -1) {
 		dt_module_clear_elf(dmp);
-		return -1; /* dt_errno is set for us */
+		return -1;
 	}
 
-	/*
-	 * Allocate the hash chains and hash buckets for symbol name lookup.
-	 * This is relatively simple since the symbol table is of fixed size
-	 * and is known in advance.  We allocate one extra element since we
-	 * use element indices instead of pointers and zero is our sentinel.
-	 */
-	dmp->dm_nsymelems =
-	    dmp->dm_symtab.cts_size / dmp->dm_symtab.cts_entsize;
-
-	dmp->dm_nsymbuckets = _dtrace_strbuckets;
-	dmp->dm_symfree = 1;		/* first free element is index 1 */
-
-	dmp->dm_symbuckets = malloc(sizeof(uint_t) * dmp->dm_nsymbuckets);
-	dmp->dm_symchains = malloc(sizeof(dt_modsym_t) * dmp->dm_nsymelems + 1);
-
-	if (dmp->dm_symbuckets == NULL || dmp->dm_symchains == NULL)
-		goto oom;
-
-	memset(dmp->dm_symbuckets, 0, sizeof(uint_t) * dmp->dm_nsymbuckets);
-	memset(dmp->dm_symchains, 0, sizeof(dt_modsym_t) * dmp->dm_nsymelems
-	    + 1);
-
-	/*
-	 * Iterate over the symbol table data buffer and insert each symbol
-	 * name into the name hash if the name and type are valid.  Then
-	 * allocate the address map, fill it in, and sort it.
-	 */
-	dmp->dm_asrsv = dmp->dm_ops->do_syminit(dmp);
-
-	dt_dprintf("hashed %s [%s] (%u symbols)\n",
-	    dmp->dm_name, dmp->dm_symtab.cts_name, dmp->dm_symfree - 1);
-
-	if ((dmp->dm_asmap = malloc(sizeof(void *) * dmp->dm_asrsv)) == NULL)
+	/* Keep the combined public symbol ID space representable. */
+	if (dmp->dm_symbols[1].dm_nsymelems >
+	    UINT_MAX - dmp->dm_symbols[0].dm_nsymelems)
 		goto oom;
 
-	dmp->dm_ops->do_symsort(dmp);
-
-	dt_dprintf("sorted %s [%s] (%u symbols)\n",
-	    dmp->dm_name, dmp->dm_symtab.cts_name, dmp->dm_aslen);
-
 	dmp->dm_flags |= DT_DM_LOADED;
 	return 0;
 oom:
@@ -949,6 +1013,7 @@ dt_module_getctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 {
 	const char *parent;
 	int model;
+	dt_module_symbols_t *syms;
 
 	if (!(dmp->dm_flags & DT_DM_LOADED))
 		if (dt_module_load(dtp, dmp) != 0)
@@ -981,12 +1046,14 @@ dt_module_getctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 		return NULL;
 	}
 
+	syms = &dmp->dm_symbols[dmp->dm_symbols[0].dm_nsymelems == 0];
 	if (dmp->dm_flags & DT_DM_KERNEL)
 		dmp->dm_ctfp = ctf_bufopen(&dmp->dm_ctdata, NULL, NULL,
 		    &dtp->dt_ctferr);
 	else
 		dmp->dm_ctfp = ctf_bufopen(&dmp->dm_ctdata,
-		    &dmp->dm_symtab, &dmp->dm_strtab, &dtp->dt_ctferr);
+		    &syms->dm_symtab, &syms->dm_strtab,
+		    &dtp->dt_ctferr);
 
 	if (dmp->dm_ctfp == NULL) {
 		dt_dprintf("ctf loading for module %s failed: error: %s\n",
@@ -1027,23 +1094,14 @@ dt_module_clear_elf(dt_module_t *dmp)
 	dmp->dm_ctdata_data = NULL;
 
 	memset(&dmp->dm_ctdata, 0, sizeof(ctf_sect_t));
-	memset(&dmp->dm_symtab, 0, sizeof(ctf_sect_t));
-	memset(&dmp->dm_strtab, 0, sizeof(ctf_sect_t));
-
-	free(dmp->dm_symbuckets);
-	dmp->dm_symbuckets = NULL;
+	for (int i = 0; i < 2; i++) {
+		dt_module_symbols_t *syms = &dmp->dm_symbols[i];
 
-	free(dmp->dm_symchains);
-	dmp->dm_symchains = NULL;
-
-	free(dmp->dm_asmap);
-	dmp->dm_asmap = NULL;
-
-	dmp->dm_symfree = 0;
-	dmp->dm_nsymbuckets = 0;
-	dmp->dm_nsymelems = 0;
-	dmp->dm_asrsv = 0;
-	dmp->dm_aslen = 0;
+		free(syms->dm_symbuckets);
+		free(syms->dm_symchains);
+		free(syms->dm_asmap);
+		memset(syms, 0, sizeof(*syms));
+	}
 
 	elf_end(dmp->dm_elf);
 	dmp->dm_elf = NULL;
@@ -1079,7 +1137,9 @@ dt_module_extern(dtrace_hdl_t *dtp, dt_module_t *dmp,
 	uint_t id;
 
 	if (dmp->dm_extern == NULL && (dmp->dm_extern = dt_idhash_create(
-	    "extern", NULL, dmp->dm_nsymelems, UINT_MAX)) == NULL) {
+	    "extern", NULL,
+	    dmp->dm_symbols[0].dm_nsymelems +
+	    dmp->dm_symbols[1].dm_nsymelems, UINT_MAX)) == NULL) {
 		dt_set_errno(dtp, EDT_NOMEM);
 		return NULL;
 	}
@@ -2315,11 +2375,10 @@ dtrace_lookup_by_name(dtrace_hdl_t *dtp, const char *object, const char *name,
 		} else {
 			uint_t id;
 
-			if (dmp->dm_ops->do_symname(dmp, name, symp, &id) != NULL) {
+			if (dt_module_symname(dmp, name, symp, &id) != NULL) {
 				if (sip != NULL) {
 					sip->object = dmp->dm_name;
-					sip->name = (const char *)
-					    dmp->dm_strtab.cts_data + symp->st_name;
+					sip->name = dt_module_symstr(dmp, id, symp);
 					sip->id = id;
 				}
 				return 0;
@@ -2494,13 +2553,11 @@ dtrace_lookup_by_addr(dtrace_hdl_t *dtp, GElf_Addr addr,
 	if (dt_module_load(dtp, dmp) == -1)
 		return -1; /* dt_errno is set for us */
 
-	if (dmp->dm_flags & DT_DM_KERNEL) {
+	if ((dmp->dm_flags & DT_DM_KERNEL) &&
+	    !(dmp->dm_flags & DT_DM_KERN_UNLOADED)) {
 		dt_symbol_t *dt_symp;
 
-		/*
-		 * This is probably a non-loaded kernel module.  Looking
-		 * anything up by address in this case is hopeless.
-		 */
+		/* Loaded kernel modules use runtime addresses from /proc. */
 		if (!dmp->dm_kernsyms)
 			return dt_set_errno(dtp, EDT_NOSYMADDR);
 
@@ -2521,7 +2578,7 @@ dtrace_lookup_by_addr(dtrace_hdl_t *dtp, GElf_Addr addr,
 		return 0;
 	} else {
 		if (symp != NULL) {
-			if (dmp->dm_ops->do_symaddr(dmp, addr, symp, &id) == NULL)
+			if (dt_module_symaddr(dmp, addr, symp, &id) == NULL)
 				return dt_set_errno(dtp, EDT_NOSYMADDR);
 		}
 
@@ -2529,8 +2586,7 @@ dtrace_lookup_by_addr(dtrace_hdl_t *dtp, GElf_Addr addr,
 			sip->object = dmp->dm_name;
 
 			if (symp != NULL) {
-				sip->name = (const char *)
-				    dmp->dm_strtab.cts_data + symp->st_name;
+				sip->name = dt_module_symstr(dmp, id, symp);
 				sip->id = id;
 			} else {
 				sip->name = NULL;
@@ -2712,20 +2768,33 @@ dt_module_sym_iter(const dt_module_t *dmp, proc_sym_f *func, void *arg)
 	uint_t		i;
 	int		rv = 0;
 
-	for (i = 0; i < dmp->dm_aslen; i++) {
-		const char	*name;
+	for (int t = 0; t < 2; t++) {
+		const dt_module_symbols_t *syms = &dmp->dm_symbols[t];
 
-		if (dmp->dm_ops == &dt_modops_64)
-			dt_module_symgelf64(
-			    ((const Elf64_Sym **)dmp->dm_asmap)[i], &sym);
-		else
-			dt_module_symgelf32(
-			    ((const Elf32_Sym **)dmp->dm_asmap)[i], &sym);
+		for (i = 0; i < syms->dm_aslen; i++) {
+			const char *name;
 
-		name = (const char *)dmp->dm_strtab.cts_data + sym.st_name;
+			if (dmp->dm_ops == &dt_modops_64)
+				dt_module_symgelf64(
+				    ((const Elf64_Sym **)syms->dm_asmap)[i], &sym);
+			else
+				dt_module_symgelf32(
+				    ((const Elf32_Sym **)syms->dm_asmap)[i], &sym);
 
-		if ((rv = func(arg, &sym, name)) != 0)
-			break;
+			name = (const char *)syms->dm_strtab.cts_data + sym.st_name;
+
+			/* Do not report symbols already covered by .symtab. */
+			if (t != 0) {
+				GElf_Sym primary;
+
+				if (dmp->dm_ops->do_symname(
+				    &dmp->dm_symbols[0],
+				    name, &primary, NULL) != NULL)
+					continue;
+			}
+			if ((rv = func(arg, &sym, name)) != 0)
+				return rv;
+		}
 	}
 
 	return rv;
diff --git a/libdtrace/dt_symbol_modops.h b/libdtrace/dt_symbol_modops.h
index d05cb172..e5c2ceda 100644
--- a/libdtrace/dt_symbol_modops.h
+++ b/libdtrace/dt_symbol_modops.h
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2009, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2009, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -18,7 +18,7 @@
 #define ELFIZE(suffix) EXJOINMID(ELF,BITS,_##suffix)
 
 static uint_t
-BITIZE(dt_module_syminit)(dt_module_t *dmp)
+BITIZE(dt_module_syminit)(dt_module_symbols_t *dmp)
 {
 	const ElfIZE(Sym) *sym = dmp->dm_symtab.cts_data;
 	const char *base = dmp->dm_strtab.cts_data;
@@ -27,7 +27,7 @@ BITIZE(dt_module_syminit)(dt_module_t *dmp)
 	uint_t asrsv = 0;
 
 	for (i = 0; i < n; i++, sym++) {
-		const char *name = base + sym->st_name;
+		const char *name;
 		uchar_t type = ELFIZE(ST_TYPE)(sym->st_info);
 
 		if (type >= STT_NUM || type == STT_SECTION)
@@ -36,6 +36,10 @@ BITIZE(dt_module_syminit)(dt_module_t *dmp)
 		if (sym->st_name == 0 || sym->st_name >= ss_size)
 			continue; /* skip null or invalid names */
 
+		name = base + sym->st_name;
+		if (memchr(name, '\0', ss_size - sym->st_name) == NULL)
+			continue; /* skip unterminated names */
+
 		if (sym->st_value != 0 &&
 		    (ELFIZE(ST_BIND)(sym->st_info) != STB_LOCAL || sym->st_size))
 			asrsv++; /* reserve space in the address map */
@@ -83,7 +87,7 @@ BITIZE(dt_module_symcomp)(const void *lp, const void *rp, void *strtabp)
 }
 
 static void
-BITIZE(dt_module_symsort)(dt_module_t *dmp)
+BITIZE(dt_module_symsort)(dt_module_symbols_t *dmp)
 {
 	ElfIZE(Sym) *symtab = (ElfIZE(Sym) *)dmp->dm_symtab.cts_data;
 	ElfIZE(Sym) **sympp = (ElfIZE(Sym) **)dmp->dm_asmap;
@@ -106,7 +110,7 @@ BITIZE(dt_module_symsort)(dt_module_t *dmp)
 }
 
 static GElf_Sym *
-BITIZE(dt_module_symname)(dt_module_t *dmp, const char *name,
+BITIZE(dt_module_symname)(const dt_module_symbols_t *dmp, const char *name,
     GElf_Sym *symp, uint_t *idp)
 {
 	const ElfIZE(Sym) *symtab = dmp->dm_symtab.cts_data;
@@ -136,7 +140,7 @@ BITIZE(dt_module_symname)(dt_module_t *dmp, const char *name,
 }
 
 static GElf_Sym *
-BITIZE(dt_module_symaddr)(dt_module_t *dmp, GElf_Addr addr,
+BITIZE(dt_module_symaddr)(const dt_module_symbols_t *dmp, GElf_Addr addr,
     GElf_Sym *symp, uint_t *idp)
 {
 	const ElfIZE(Sym) **asmap = (const ElfIZE(Sym) **)dmp->dm_asmap;
diff --git a/test/internals/elf/tst.symbols.sh b/test/internals/elf/tst.symbols.sh
new file mode 100755
index 00000000..2d41e4dd
--- /dev/null
+++ b/test/internals/elf/tst.symbols.sh
@@ -0,0 +1,10 @@
+#!/bin/bash
+#
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# ASSERTION: ELF-backed modules search .symtab and .dynsym independently.
+#
+
+test/triggers/elf-symbols
diff --git a/test/triggers/Build b/test/triggers/Build
index 8d648bab..0dd546ac 100644
--- a/test/triggers/Build
+++ b/test/triggers/Build
@@ -25,7 +25,7 @@ EXTERNAL_TRIGGERS = $(EXTERNAL_64BIT_TRIGGERS) $(if $(NATIVE_BITNESS_ONLY),,$(EX
 INTERNAL_64BIT_TRIGGERS = libproc-pldd libproc-consistency libproc-sleeper \
     libproc-sleeper-pie libproc-dlmadopen libproc-lookup-by-name \
     libproc-lookup-victim libproc-execing-bkpts libproc-execing-bkpts-victim \
-    btf-cyclic-types btf-lazy-types shared-ctf module-discovery
+    btf-cyclic-types btf-lazy-types shared-ctf module-discovery elf-symbols
 INTERNAL_32BIT_TRIGGERS := libproc-sleeper-32 libproc-sleeper-pie-32
 INTERNAL_TRIGGERS = $(INTERNAL_64BIT_TRIGGERS) $(if $(NATIVE_BITNESS_ONLY),,$(INTERNAL_32BIT_TRIGGERS))
 
@@ -272,3 +272,9 @@ shared-ctf_CFLAGS := -Ilibproc -Ilibdtrace -Ilibcommon -Wno-pedantic
 shared-ctf_DEPS := build-libdtrace.a build-libproc.a libcommon.a libport.a
 shared-ctf_LIBS := $(objdir)/build-libdtrace.a $(objdir)/build-libproc.a \
     $(objdir)/build-libcommon.a $(objdir)/build-libport.a $(libdtrace_LIBS)
+
+# Exercise both ELF symbol tables without relying on host binaries.
+elf-symbols_CFLAGS := -Ilibproc -Ilibdtrace -Ilibcommon -Wno-pedantic
+elf-symbols_DEPS := build-libdtrace.a build-libproc.a libcommon.a libport.a
+elf-symbols_LIBS := $(objdir)/build-libdtrace.a $(objdir)/build-libproc.a \
+    $(objdir)/build-libcommon.a $(objdir)/build-libport.a $(libdtrace_LIBS)
diff --git a/test/triggers/elf-symbols.c b/test/triggers/elf-symbols.c
new file mode 100644
index 00000000..dc6adb58
--- /dev/null
+++ b/test/triggers/elf-symbols.c
@@ -0,0 +1,203 @@
+/*
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <dt_module.h>
+
+#define CHECK(expr) do { \
+	if (!(expr)) { \
+		fprintf(stderr, "Check failed at line %d: %s\n", __LINE__, #expr); \
+		exit(1); \
+	} \
+} while (0)
+
+/* No section names: the loader must use section types and sh_link. */
+static void
+write_elf(int fd, int bits, int tables)
+{
+	Elf *elf;
+	GElf_Ehdr eh;
+	char strings[] = "\0common\0private";
+	char dynstrings[] = "\0dynamic\0common";
+	union {
+		Elf64_Sym s64[2][3];
+		Elf32_Sym s32[2][3];
+	} storage = { 0 };
+
+	CHECK(ftruncate(fd, 0) == 0);
+	CHECK((elf = elf_begin(fd, ELF_C_WRITE, NULL)) != NULL);
+	CHECK(gelf_newehdr(elf, bits) != 0);
+	CHECK(gelf_getehdr(elf, &eh) != NULL);
+	eh.e_type = ET_DYN;
+	eh.e_machine = bits == ELFCLASS64 ? EM_X86_64 : EM_386;
+	CHECK(gelf_update_ehdr(elf, &eh) != 0);
+
+	for (int t = 0; t < 2; t++) {
+		Elf_Scn *strscn, *symscn;
+		Elf_Data *strdata, *symdata;
+		GElf_Shdr sh = { 0 };
+		GElf_Sym sym = { 0 };
+		size_t entsize = bits == ELFCLASS64 ? sizeof(Elf64_Sym) : sizeof(Elf32_Sym);
+
+		if (!(tables & (1 << t)))
+			continue;
+		CHECK((strscn = elf_newscn(elf)) != NULL);
+		CHECK((strdata = elf_newdata(strscn)) != NULL);
+		strdata->d_buf = t == 0 ? strings : dynstrings;
+		strdata->d_size = t == 0 ? sizeof(strings) : sizeof(dynstrings);
+		strdata->d_type = ELF_T_BYTE;
+		strdata->d_version = EV_CURRENT;
+		sh.sh_type = SHT_STRTAB;
+		sh.sh_addralign = 1;
+		CHECK(gelf_update_shdr(strscn, &sh) != 0);
+
+		CHECK((symscn = elf_newscn(elf)) != NULL);
+		CHECK((symdata = elf_newdata(symscn)) != NULL);
+		symdata->d_buf = bits == ELFCLASS64 ?
+		    (void *)storage.s64[t] : (void *)storage.s32[t];
+		symdata->d_size = 3 * entsize;
+		symdata->d_type = ELF_T_SYM;
+		symdata->d_version = EV_CURRENT;
+		sh.sh_type = t == 0 ? SHT_SYMTAB : SHT_DYNSYM;
+		sh.sh_link = elf_ndxscn(strscn);
+		sh.sh_info = 1;
+		sh.sh_entsize = entsize;
+		sh.sh_addralign = bits == ELFCLASS64 ? 8 : 4;
+		CHECK(gelf_update_shdr(symscn, &sh) != 0);
+		CHECK(gelf_update_sym(symdata, 0, &sym) != 0);
+		sym.st_name = t == 0 ? 1 : 9; /* common */
+		sym.st_info = GELF_ST_INFO(STB_GLOBAL, STT_FUNC);
+		sym.st_shndx = SHN_ABS;
+		sym.st_value = t == 0 ? 0x1000 : 0x1100;
+		sym.st_size = 16;
+		CHECK(gelf_update_sym(symdata, 1, &sym) != 0);
+		sym.st_name = t == 0 ? 8 : 1;
+		sym.st_value = t == 0 ? 0x1200 : 0x1300;
+		CHECK(gelf_update_sym(symdata, 2, &sym) != 0);
+	}
+	CHECK(elf_update(elf, ELF_C_WRITE) != -1);
+	CHECK(elf_end(elf) == 0);
+}
+
+static int
+count_symbol(void *arg, const GElf_Sym *sym, const char *name)
+{
+	int *counts = arg;
+
+	if (strcmp(name, "common") == 0)
+		counts[0]++;
+	else if (strcmp(name, "private") == 0)
+		counts[1]++;
+	else if (strcmp(name, "dynamic") == 0)
+		counts[2]++;
+	else
+		CHECK(0);
+	return 0;
+}
+
+int
+main(void)
+{
+	dtrace_hdl_t *dtp;
+	int fd, err;
+	char path[] = "/tmp/dtrace-elf-symbols-XXXXXX";
+
+	CHECK(elf_version(EV_CURRENT) != EV_NONE);
+	CHECK((fd = mkstemp(path)) >= 0);
+	CHECK((dtp = dtrace_open(DTRACE_VERSION, 0, &err)) != NULL);
+
+	for (int bits = ELFCLASS32; bits <= ELFCLASS64; bits++) {
+		for (int tables = 0; tables <= 3; tables++) {
+			for (int kernel = 0; kernel <= 1; kernel++) {
+				dt_module_t *dmp;
+				GElf_Sym sym;
+				dtrace_syminfo_t si;
+				char name[64];
+				int counts[3] = { 0 };
+
+				write_elf(fd, bits, tables);
+				snprintf(name, sizeof(name), "elf_%d_%d_%d", bits, tables, kernel);
+				CHECK((dmp = dt_module_create(dtp, name)) != NULL);
+				strcpy(dmp->dm_file, path);
+				if (kernel)
+					dmp->dm_flags |= DT_DM_KERNEL | DT_DM_KERN_UNLOADED;
+
+				if (tables == 0) {
+					CHECK(dtrace_lookup_by_name(dtp, name, "common", &sym, &si) == -1);
+					continue;
+				}
+				CHECK(dtrace_lookup_by_name(dtp, name, "common", &sym, &si) == 0);
+				CHECK(sym.st_value == (tables & 1 ? 0x1000 : 0x1100));
+				CHECK(strcmp(si.name, "common") == 0 && si.id == 1);
+
+				if (tables & 1) {
+					CHECK(dtrace_lookup_by_name(dtp, name, "private", &sym, &si) == 0);
+					CHECK(sym.st_value == 0x1200 && si.id == 2);
+				}
+				if (tables & 2) {
+					CHECK(dtrace_lookup_by_name(dtp, name, "dynamic", &sym, &si) == 0);
+					CHECK(sym.st_value == 0x1300);
+					CHECK(strcmp(si.name, "dynamic") == 0);
+					CHECK(si.id == (tables & 1 ? 5 : 2));
+				}
+				CHECK(dt_module_sym_iter(dmp, count_symbol, counts) == 0);
+				CHECK(counts[0] == 1);
+				CHECK(counts[1] == !!(tables & 1));
+				CHECK(counts[2] == !!(tables & 2));
+
+				/* Give only this fixture a range for public address lookup. */
+				CHECK((dmp->dm_text_addrs = calloc(1,
+				    sizeof(dtrace_addr_range_t))) != NULL);
+				dmp->dm_text_addrs[0].dar_va = 0x1000;
+				dmp->dm_text_addrs[0].dar_size = 0x400;
+				dmp->dm_text_addrs_size = 1;
+				dtp->dt_modranges_valid = 0;
+
+				for (int t = 0; t < 2; t++) {
+					GElf_Addr addr = t == 0 ? 0x1204 : 0x1304;
+					int found = dtrace_lookup_by_addr(dtp, addr, &sym, &si);
+
+					CHECK((found == 0) == !!(tables & (1 << t)));
+					if (found == 0) {
+						CHECK(sym.st_value == addr - 4);
+						CHECK(strcmp(si.name, t == 0 ? "private" : "dynamic") == 0);
+						CHECK(si.id == (t == 1 && (tables & 1) ? 5 : 2));
+					}
+				}
+				CHECK(dtrace_lookup_by_addr(dtp, 0x13ff, &sym, &si) == -1);
+				dmp->dm_text_addrs_size = 0;
+				dtp->dt_modranges_valid = 0;
+			}
+		}
+	}
+	dtrace_close(dtp);
+
+	/* An unloaded module still needs ELF symbols when its CTF is cached. */
+	CHECK((dtp = dtrace_open(DTRACE_VERSION, 0, &err)) != NULL);
+	{
+		dt_module_t *shared = dt_module_create(dtp, "shared_ctf");
+		dt_module_t *dmp = dt_module_create(dtp, "elf_cached_ctf");
+		GElf_Sym sym;
+
+		CHECK(shared != NULL && dmp != NULL);
+		CHECK((shared->dm_ctfp = ctf_create(&err)) != NULL);
+		CHECK((dmp->dm_ctfp = ctf_create(&err)) != NULL);
+		dmp->dm_flags |= DT_DM_KERNEL | DT_DM_KERN_UNLOADED;
+		dmp->dm_ops = NULL;
+		strcpy(dmp->dm_file, path);
+		write_elf(fd, ELFCLASS64, 3);
+		CHECK(dtrace_lookup_by_name(dtp, dmp->dm_name, "common",
+		    &sym, NULL) == 0);
+		CHECK(sym.st_value == 0x1000);
+	}
+	dtrace_close(dtp);
+	close(fd);
+	unlink(path);
+	return 0;
+}
diff --git a/test/triggers/shared-ctf.c b/test/triggers/shared-ctf.c
index 74c55c44..5772429a 100644
--- a/test/triggers/shared-ctf.c
+++ b/test/triggers/shared-ctf.c
@@ -229,6 +229,12 @@ check_source(const char *ctfpath, const char *btfpath, int archived,
 			CHECK(dtrace_lookup_by_type(dtp, "vmlinux", "module_test_int", &ti) == 0);
 			CHECK(ctf_lookup_by_name(parent, "module_test_int") == CTF_ERR);
 		} else {
+			GElf_Sym sym;
+
+			/* Inherited BTF must not make an absent ELF module loadable. */
+			CHECK(dtrace_lookup_by_name(dtp, "shared_ctf_test_absent",
+			    "missing_symbol", &sym, NULL) == -1);
+
 			/* A module without local BTF must import the same parent. */
 			CHECK((child = dt_module_create(dtp, "shared_ctf_test_child")) != NULL);
 			child->dm_flags |= DT_DM_KERNEL;
-- 
2.52.0

