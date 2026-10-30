Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793389104;
	b=wLK6nfRMX+s93SLHL/kWQumLf+li9fX6jKamcuPAG5iuzmvMSihP8Qd7xoeK4fPv/q7n
	 McubXxLkVrEjKYCtobFNVTCsT9sYO0qs6mw3dLBLr+/wrda3TECV2HkU4xUBLEL85e4Lt
	 wzLEMV+PxmMCTp8IYpgP4MRrlCMs+/0s/0gxnVRVJYcM+KW6P6cVTzIAUgYBVv7byHb8j
	 baUT1orEdh75dLN94h8/UhuSOlKRd0M069kEBMBV4LdjLcp5VbgvzE1g+fZ1IK0mBuFAP
	 ILDVXO8XiVtTbFC6LPgpSTjW43sVyr7Sf+2znhUsJgRKVdi9W0vnc88BP22GJm6RtIQ==
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
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info;
	bh=E+sToUHMHMScaIZmPDVrGRzVWA9QzrxYFoSeySod31A=;
	b=BAFNBlAw62rVCwFx+CZIvqGYWfp0MWKk1AWRpwZjuqLuJ1cuCh/itRtlTZpNy9xvmgkW
	 Eff2IziwMqxfysHXV2YtaP+rn1gNmD2ts2t/iWUmmFEguVZlu9SELCe7MYgKVrzY/OHSH
	 jZAv+mr0um7tgx2XNkcowfULCnVP9wVM5znyftuQ9jc2xJbpvVhvUkOdJxbZeMHkNNy4W
	 ins1Hitba229szGnt/1OlY6fH7c0WeSlcjxY4g4qWLExpy0CCKTn10Nqz8vF8QhOmnzcV
	 HViNJLfedq9zGpY5hfn48UHiwTPRZCx4EnUe27bLxOoPvGY5Z/UhjAYCbxV+//k7Enw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=h3mdFsX6;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=a5kWCHEC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE79606A31C
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AE79606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=h3mdFsX6;
	dkim=pass (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=a5kWCHEC
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UEYPi63954666
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=E+sToUHMHMScaIZmPDVrGRzVWA9QzrxYFoSeySod31A=; b=
	h3mdFsX6ByeALemlsUkj2IXOE1lupywnRGDasm3yuOGQd9i7NlraJ6zp77tDDwwq
	MckGSuYsBHlm2+wFYw6/PgsTDW3jIgbWP3jq1hEQPJVzmM+cl08sQHBiwz869CIU
	dA7MQRYjyJAuxXpj4MzsgzPKzmPeT8OmidTCHNhQC/HomM4jAhxZFNJVXykeHvts
	mX0UQNXgqQA6K3eWy7NEgT0IIxw6HsXohxZlKfRIrmN/OaXaMXNkiWT5rCw7909x
	MXLsuL8CeVqTlTgx8Xm79wYLnECmEu0yRIZgTdjWC/JGBeHR4+z9WaYd3dG5QLUL
	nUqkHpMXt00UZ9TbT+NMUw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hme61sd0m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 69UJLnxc3892254
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:23 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013018.outbound.protection.outlook.com [40.93.201.18])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4hn1b28e01-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QlAWhZcMzCp6ahkP1CwdtXiOGSG1Hav3t4V6AxLQjjhoQIqAqK9ou7z/F4dzVNaR+80tKyiV30YpbA1fehtDg6zBDSKFdPJ25ocPD6UctlUC8PVKJRg2GdxaLEmRonURm2UrgtRc01gPX2Lm/54jfmgqCIsE4bKT/kZNMf68JpV+9Qsi2k85ZvPdgl37HVfedOBXDO4v3YMkRH4VOwUnwIC7FxHkR1vLfvZRjLBFckqpg9irqH9UtxCPkFXZrpxSUod+KwxpLSNm8CXP+VKq//96fmjzXuJ6M8/U+ZiMYkzgtWWsqv9qrotyebxaqzBlt9AMm2Q+2MRp1bRyKLfOxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+sToUHMHMScaIZmPDVrGRzVWA9QzrxYFoSeySod31A=;
 b=U8UBn6ah//7Agzn4njZLMHMERTLrWe8qjz4YngDxbBMKD1cyfcSeZxHB7Njss9MTTYCePv3zSDhCNe7XKRD6egPb5HX5aEvUJ6cb7+gklurZMwSrN0g7y8i7lpm3Z1hbDQNRdAL1Z/5JyfbLyGxp3BqpKlwXSenryh+DiiylqQgY+wuULjehkueNzPSPGFkQ+7SyInl9aoONNfxc+QmZev4a0wpDaem+uKs1FbPEHKd+w29/SplmX5hrktzAqQsqoxXJcGKX0c+8E/BkisDiC0zyQaZgk+qQXLKFlhbrYycohJ6Zypb7ObZvmZ+jJGo//oSL2iqaGz2rjI/FSlyWdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+sToUHMHMScaIZmPDVrGRzVWA9QzrxYFoSeySod31A=;
 b=a5kWCHEChq1FCgXHNytBmtIpk03SY/X4cKNfYMGRqzcB1gQ8G9iScoSM4QIYBcD7FGGAEbsFKJeDmB0DwbaVCKX+ep48vmAZvF/rxFaoqV5jNgJesY/+H2D0QyBv3vLJnIiWlC+IDpqs/QBQg2hoUjH1Njaktl/Vx7I+0b4/jnY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS0PR10MB997959.namprd10.prod.outlook.com with HTTP via P2P; Fri, 30 Oct
 2026 19:38:20 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 19:38:20 +0000
Date: Fri, 30 Oct 2026 19:36:45 +0000
Message-ID: <56247e0c69f34acca1cc8c20ffafc4bd@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 10/20] libdtrace: retain descriptors for cached module BTF IDs
Content-Type: text/plain
X-ClientProxiedBy: PH8PR02CA0028.namprd02.prod.outlook.com
 (2603:10b6:510:2da::29) To CO1PR10MB4769.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS0PR10MB997959:EE_
X-MS-PublicTrafficType: Email
client-request-id: d497682e-d81d-4413-b686-4b63661dabea
request-id: 0b1b148c-f695-44bb-e946-08df36bd5a70
X-MS-Office365-Filtering-Correlation-Id: 0b1b148c-f695-44bb-e946-08df36bd5a70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|18002099003|56012099006|261026140227099003|261026121527099003|261021121427099003|261028144727099003|10067099003|261021123027099003|261022105027099003|261022075727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	nTrgeZ5jPGOeHrJYhIZy1045r8vU3FhXKYrq4VO0BvwNQgHd1ayATXZ7tBLIFZm1iMOJ1Dc4v72xTcuDKiL1Euc/s16HU/LZyniTF4/h5j12uwxxdbp9SAEz+eL8wrmasLXaBuogjJmib6LWxQsgp9TMOTmOMlHJgkROBlhDA324ZDf9fsnUW+Elan3i2ywZV3ne4ox8cTWXtfw94bgKKo0SpKpA5quvHh+gMwJJrT8oFhy2Bs0PU5nMevOq37MGIrG75glqs0Fq8Ys3zDN+BxvCoXB6WwjHi/ZJZwUp7tJ37b73Ci3J3JSljgyX36wjkZ6ZvRWV0RaP4qAiQDpfX1dKOYZfW+aCriZ27HdCaS13mmlkVR/cBKyl898FLPD/vJdzgcmdYkW1O7N3Xafg9Jn1e3yyPSOG1kW4X68ghmr1FsxBLlIWSOrewd0axQyNNtmUElQl4C6Qtaa6uLFGEo3HQRytPG55vJYc+EE9f5XuJXA3G+FkrFZj0y+a9gicRQhuDKwBXBW6Ux7fjvE5OPu9PDo0TDN7+CniiatKcFRdvGDRYpolbi0CG3fFeruE6MbhKQ2Bz4Alkef0hm4ZEjxg2FX29/4mtkKPTDVNs2F33g7xjNLrwlme6mR+F79nhueerlmgKVUxaZI/PWsmBsh/B6YVTsOjxqYseEKKlX8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(18002099003)(56012099006)(261026140227099003)(261026121527099003)(261021121427099003)(261028144727099003)(10067099003)(261021123027099003)(261022105027099003)(261022075727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lW7EzwVKFXp7D2QmCY2oypkiidz4IAsMPKQw35XcLQkL7Fj15sD178cG2Oz2?=
 =?us-ascii?Q?UscW/aTWEQvHGwvtIbvS4T2Z+VCos4cfqm1i2D5yEBTSiV6r+p3Rt3xigPTM?=
 =?us-ascii?Q?NIDSmc5pEdynsPp8VP7zVLXv7KnBHXOtyw9qjh02FzLWwEwXYDUE/6krHmBI?=
 =?us-ascii?Q?SvZGtwKImBl85NHE0o9kemiEaifJtPNr7UXkaKrEQdf2XMHgZ8G9rpil7aBT?=
 =?us-ascii?Q?eaBmR8Efarj4SXYwhz1f0RcPXS/wm6Z4QUzmUwdor9R4QWYfbe46iYLKB39w?=
 =?us-ascii?Q?OWVUOR1q/JYoPBGV2SAF6BM6d/DfBDb0OGcQuM+naVtCIgEFIN2yUTfbpIJ7?=
 =?us-ascii?Q?z1CUzwGqyNslpxJJgn/6VuZZYx0UJ7MrCbHzehsA4yAHTrVY08bqGHwr6S9V?=
 =?us-ascii?Q?lTvSzPRYRD1NC35LCkj7+66oebwVlA0+ZnRwQbwmRdmTWptvVOnngV1mhu/X?=
 =?us-ascii?Q?J6K+tphU+tqwSckuIiYAguI2r6gQj/UW5CnMLpE6NA23WQYmy89o1xZiEa5e?=
 =?us-ascii?Q?HJo8B7+NYJU42vldPdr5dg/+Pwz6/pbC4ZASULRj+WJWmtk9FmVqEpFTNFen?=
 =?us-ascii?Q?hIGEt9POJ5B4cpOdUFDWvhd6D9VQXo4dtcwFzTzoB7LZnXjL7mm0uUFGk1DE?=
 =?us-ascii?Q?W+SpioEm/CqCTO83cct9LT5uoyjB74jVzHQ0qxH0L2WiZ9pskHmIW2k23NvJ?=
 =?us-ascii?Q?67aCGKfPK7g4xJbmiurMaJW90LytKG+aHKteMInGnQ1gKMMhG+DrjRLUZBBY?=
 =?us-ascii?Q?vj3hAHROfjS7TZzJz/uNRvNeqFAWDpMlZSi/w0wQ1ZSjSegjahhyxhPR73EF?=
 =?us-ascii?Q?xrgRZrYFB4rL4HWUxlbU3v8XyFjV5ysMwX7uGwnlkvKeYDQZCX8z4P3qES1+?=
 =?us-ascii?Q?+gnM3uPlapU2GLsw2lX+xUjtgLm/bFNBoc3lJ8H4dbUivf+J8HLdOkWWWvqC?=
 =?us-ascii?Q?zjwGaQrM1XM/DO85TKo1xh6zQB6wvFUeuSuDcDqvyJBbrhTsOf7ToKtH3HY6?=
 =?us-ascii?Q?1v5w6jYFSIhNSv2sz0636XNOA+NVuK9AB2a4G8Fkkq+keytZDOQH13gnUwAO?=
 =?us-ascii?Q?cFvGHpzx/mYPb4vl8gn9XdTQfgobC3w7YTk+RBrY8EIpO+njaI2uOHMmRAlp?=
 =?us-ascii?Q?rfTReKbGZeknImHHE5Hax2SSOs6GV0SY2ry6gWV6DKY63DTtot/QaLEGg/jQ?=
 =?us-ascii?Q?l0l9pWyisIENWB/2hAwCGMc0SMo6ngHoZehfCcJI6osX/sku9pJRsktEa3vM?=
 =?us-ascii?Q?Y6RHE5GDwT5qBhw3ubSMzEO97eOXH+rS/Ef2ame+gmZJhFzFSD7gS/Tp25ar?=
 =?us-ascii?Q?uDpxeBZW2LMVI7yWd5yoIRTLBZFSI4R6yvFPISouCy2JQzbBpLNLfCTBecmA?=
 =?us-ascii?Q?5dfWhmkBOKFijjWQa13Fl6jPlm6jeJJnt3bGD8OHtOmUVuzct5gi8jt7oHEO?=
 =?us-ascii?Q?eZr9QAdQOwyrtU6WaE7PzwfAGZVxwmYaYYFm7oBabVRhBJklsXmlmc7zI3h9?=
 =?us-ascii?Q?Jol3q/Zljq3hcQ7PjGL0QsAsaEOae4rc3gln5QsPinwEpPH8VCMmkvk3K9jI?=
 =?us-ascii?Q?qY0Rz7dOkbGy0RAKHc0OgKyu54XMw+5VhFP4OQD+CzHjuOrF7jfFd2YAJW0c?=
 =?us-ascii?Q?yvOWoC1TY3nVt89Hppd/vXZaSNBJp2sQh0bmu9rl82YJ8jeF5bR6Ur6DoY1g?=
 =?us-ascii?Q?DRXhD1l830kmXWllXIaQANx6Wbe3dr+nrcbO8RvTaQE2cDm2Xpal7Y3kt0NH?=
 =?us-ascii?Q?dHMM9q1Ou5bvNPVWb9Zc6WPkuMjagjo=3D?=
X-Exchange-RoutingPolicyChecked:
	AggpCsmDC5pveolJrLqU3sYQAr4+6ewU1YMRu40rggDSRx2Bb6NwB9F1g9tISWHbVBI2lljNMtYnSRd2fbDV7cLfQ5fbnTc7XL9SLeLO0E58dPTWF91nOQ20xQvUQvcFxUIBm053VzJRkv2noK3q46xzh7TkxQkCBoL/Xcfp4EsjJpGI03Ojzl8lD8AhCXLQw2sPSjIjMv9Jk+Vn6S2oqzUDSLs4wAg4oZv4/RIqSD2WDo66MsNmlIM3s2c18lvLQgw8JtrHnSCVVOHR6fbr26W9yYEuZTRSayhhSg/+zYlmcXPV2Q2hHA63+D/jSD2giLlbIfj+Av4oY+rB3xYnWg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GzzzZ68ka4B4I3KMhPsad8E4JGstCappEE8m+Wyr1FKc0r94ET+eZ/phOvBBzJlzTspyv0wPeB+OEgDxsl30Mx+1kEm+pWNEBuUFCPfoytEIl9MhwwumtOkVfEKVo0jq6qAw5Z8+sspHjefatUAH1bN9vUBI5BRLCBlkfAaH1AEA9pmlch/ZR27yyQqNQPcJ6ezjlHvwKvQvmcux3DBhzbrM0r6t6WkXzRl7J7Mcb1H/HXpNlUx+ZupUgOwpdLIrNjJ+v3pokGg4khsrIb06IdK2bEAh9Ux7fp1d5yvdk3pZ3meejVcuOL6KgcEVJlTIhyEmu1NzUt3F8J3JaFOX7P/leU798fHOzihhMJz0+NJhiqyg/tfKBk39hPm0ub65CgQ3YR3JlPy6aQPutar0rtuKYWw77/CzjZoFy26+qYSunTVM1gX7b+lFbmmuJ2/vsNzzaIuc68vU0T2FB3UYVxBC6jYXyWSZvEAhAxRTi6YRSKpekBSJ8Xwh3gfJuUyoOPNZ7LzYmGexDZdDWZFL9WnMMjXlGRDUrGmyaBSb2vCtKYLa/yHyKc1/4792FkzEqW58rlaOYxtSJl3Ly5tXUDQ33BG20bKu/YL1VJZOriE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1b148c-f695-44bb-e946-08df36bd5a70
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 19:38:20.5095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KDqxJwCn+MD/MZglcODWh3EFJMypYPCXudY/LkSBE35D5joeh/IXYQqfvlQoPEKaoWp+7do7uo+Ho/chRupO5YIDvvhVv6OScOn3XTezq5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB997959
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300078
X-Authority-Analysis: v=2.4 cv=L9qI0OT8 c=1 sm=1 tr=0 ts=6ae4f22f cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=TzbMn_377zKqwF6_HZ4A:9
X-Proofpoint-GUID: -z0cesOS_54r5YxKhvObyW8dN620F7vV
X-Proofpoint-ORIG-GUID: -z0cesOS_54r5YxKhvObyW8dN620F7vV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX3kbTUY79N072
 uW0oCpr83T8gxd/DOfX7DmHBDCvY1ir3cd7uTEffcpx6Dyhm9JS9axR7CiTr79gsaNIjQkKY0Jz
 e7O2x6U5pW6tJHi2llMvOEMN3KaOLhSuIALUFbw/nBMRRkbAf1a8Jx106rvURMBmloC8m+Qmg9m
 XjLeRZSMXEzc6XWxqTTcCx677tvXExsVEIJ3HAxvqFEgWkqcEY7jI5lZ4qLay0UXGWy+3Lb5GfC
 gzhhp7TBCBqcvMQPy4QrSSnnsahE0xM1JdvuHK5vCmcCJYhk2f3951tuHvr3HvMHXCa+I+We1dX
 5h5nSgZ9eqLjVCEGllPxuj1UGgwHKmgWSoAkyyKk1nhk3oYP+OON226re9r5WVPADMZqz1o+0Y8
 PlcaOrrJsC6AkNYzDN9ZGuY+qsN1V+TG5Uz4uNxxNsz6tkrjhFVA8oYMKcJdL+rbT2X1qiAAB/y
 IkFSrxGrlY/kQCCcDUw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfXxR1L7MAN62rZ
 sKbjuTFPIDO4uPNnBFZ2MuDZeq6vcp2kso6YgCF7XwVd13/QH5kPLNo1J8Faa4Re9Q6Hpp2ezIc
 VAgnTlAd6tP9BSqCbt9RnZ4gU2HTBP5hg7huRFNQYrTtm1NvFDas

---
 libdtrace/dt_btf.c               | 79 ++++++++++++++++++++++++++++++--
 libdtrace/dt_impl.h              |  1 +
 libdtrace/dt_open.c              |  1 +
 test/triggers/module-discovery.c | 11 +++++
 4 files changed, 88 insertions(+), 4 deletions(-)

diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
index 617b0128..727e5f54 100644
--- a/libdtrace/dt_btf.c
+++ b/libdtrace/dt_btf.c
@@ -1479,17 +1479,67 @@ dt_btf_lookup_name_kind(dtrace_hdl_t *dtp, dt_module_t *dmp, const char *name,
 	return id;
 }
 
+/*
+ * Retain a descriptor as well as the ID: otherwise an unloaded object's ID
+ * could be reused and a later enumeration could mistake it for a cached one.
+ * Only IDs assigned to modules are retained, bounding descriptor use by the
+ * number of modules discovered by this handle.
+ */
+typedef struct dt_btf_id {
+	dt_hentry_t he;
+	uint32_t id;
+	int fd;
+} dt_btf_id_t;
+
+static uint32_t
+dt_btf_id_hval(const dt_btf_id_t *entry)
+{
+	return entry->id;
+}
+
+static int
+dt_btf_id_cmp(const dt_btf_id_t *a, const dt_btf_id_t *b)
+{
+	return a->id != b->id;
+}
+
+DEFINE_HE_STD_LINK_FUNCS(dt_btf_id, dt_btf_id_t, he)
+
+static void *
+dt_btf_id_release(dt_btf_id_t *head, dt_btf_id_t *entry)
+{
+	head = dt_btf_id_del(head, entry);
+	close(entry->fd);
+	free(entry);
+	return head;
+}
+
+static dt_htab_ops_t dt_btf_id_ops = {
+	.hval = (htab_hval_fn)dt_btf_id_hval,
+	.cmp = (htab_cmp_fn)dt_btf_id_cmp,
+	.add = (htab_add_fn)dt_btf_id_add,
+	.del = (htab_del_fn)dt_btf_id_release,
+	.next = (htab_next_fn)dt_btf_id_next
+};
+
 int
 dt_btf_get_module_ids(dtrace_hdl_t *dtp)
 {
 	uint32_t	id = 0;
 
+	if (dtp->dt_btf_ids == NULL) {
+		dtp->dt_btf_ids = dt_htab_create(&dt_btf_id_ops);
+		if (dtp->dt_btf_ids == NULL)
+			return dt_set_errno(dtp, EDT_NOMEM);
+	}
+
 	for (;;) {
 		int		rc, fd;
 		btf_info_t	info;
 		char		name[PATH_MAX];
 		uint32_t	size = sizeof(info);
 		dt_module_t	*dmp;
+		dt_btf_id_t	tmpl, *entry;
 
 		rc = dt_bpf_btf_get_next_id(id, &id);
 		if (rc) {
@@ -1501,6 +1551,10 @@ dt_btf_get_module_ids(dtrace_hdl_t *dtp)
 			return dt_set_errno(dtp, errno);
 		}
 
+		tmpl.id = id;
+		if (dt_htab_lookup(dtp->dt_btf_ids, &tmpl) != NULL)
+			continue;
+
 		fd = dt_bpf_btf_get_fd_by_id(id);
 		if (fd < 0) {
 			if (errno == ENOENT)
@@ -1513,14 +1567,31 @@ dt_btf_get_module_ids(dtrace_hdl_t *dtp)
 		info.name = (uint64_t)name;
 		info.name_len = sizeof(name);
 		rc = dt_bpf_btf_get_info_by_fd(fd, &info, &size);
-		close(fd);
-		if (rc)
-			return dt_set_errno(dtp, errno);
+		if (rc) {
+			int err = errno;
+
+			close(fd);
+			return dt_set_errno(dtp, err);
+		}
 
 		dmp = dt_module_lookup_by_name(dtp, name);
-		if (dmp == NULL || dmp->dm_btf_id != 0)
+		if (!info.kernel_btf || dmp == NULL || dmp->dm_btf_id != 0) {
+			close(fd);
 			continue;
+		}
 
+		entry = calloc(1, sizeof(*entry));
+		if (entry == NULL) {
+			close(fd);
+			return dt_set_errno(dtp, EDT_NOMEM);
+		}
+		entry->id = id;
+		entry->fd = fd;
+		if (dt_htab_insert(dtp->dt_btf_ids, entry) != 0) {
+			close(fd);
+			free(entry);
+			return dt_set_errno(dtp, EDT_NOMEM);
+		}
 		dmp->dm_btf_id = id;
 	}
 }
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index f89ce2bc..972fceaf 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -314,6 +314,7 @@ struct dtrace_hdl {
 	ctf_archive_t *dt_ctfa; /* ctf archive for the entire kernel tree */
 	void *dt_ctfa_data;	/* backing data for dt_ctfa */
 	char *dt_btf_path;	/* path to vmlinux.btf */
+	dt_htab_t *dt_btf_ids; /* retained module BTF IDs and descriptors */
 	dt_htab_t *dt_kernpaths; /* hash table of dt_kern_path_t's */
 	dt_module_t *dt_exec;	/* pointer to executable module */
 	dt_module_t *dt_cdefs;	/* pointer to C dynamic type module */
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 245ccb70..8291b87d 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -1313,6 +1313,7 @@ dtrace_close(dtrace_hdl_t *dtp)
 	dtp->dt_kernsyms = NULL;
 	dt_htab_destroy(dtp->dt_mods);
 	dt_htab_destroy(dtp->dt_kernpaths);
+	dt_htab_destroy(dtp->dt_btf_ids);
 
 	if (dtp->dt_ctfa != NULL)
 		ctf_arc_close(dtp->dt_ctfa);
diff --git a/test/triggers/module-discovery.c b/test/triggers/module-discovery.c
index 0b09ae2b..d05d2bab 100644
--- a/test/triggers/module-discovery.c
+++ b/test/triggers/module-discovery.c
@@ -22,6 +22,7 @@
 static const char *symbols;
 static int kallsyms;
 static uint32_t btf_generation, btf_id;
+static int btf_queries;
 
 extern FILE *__real_fopen64(const char *, const char *);
 
@@ -78,6 +79,8 @@ __wrap_dt_bpf_btf_get_info_by_fd(int fd, btf_info_t *info, uint32_t *size)
 
 	if (symbols == NULL)
 		return __real_dt_bpf_btf_get_info_by_fd(fd, info, size);
+	btf_queries++;
+	info->kernel_btf = 1;
 	snprintf((char *)(uintptr_t)info->name, info->name_len, "%s",
 		 names[btf_id - btf_generation - 1]);
 	return 0;
@@ -171,6 +174,14 @@ check_discovery(int fallback)
 	}
 	CHECK(count == 2 && found_first == 1 && found_second == 1);
 
+	/* Cached IDs are pinned; enumeration only queries unassigned reload IDs. */
+	btf_queries = 0;
+	CHECK(dtrace_update(dtp) == 0);
+	CHECK(btf_queries == 2);
+	btf_queries = 0;
+	CHECK(dtrace_update(dtp) == 0);
+	CHECK(btf_queries == 2);
+
 	/* Disappearance and reappearance at a new address do not replace metadata. */
 	for (i = 0; i < 4; i++) {
 		symbols = i % 2 == 0 ? "" : fallback ?
-- 
2.52.0

