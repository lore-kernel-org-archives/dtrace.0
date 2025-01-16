Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570D1153598
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 21:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737064471; cv=fail; b=lks85JTqQ9vd6wGpQOkxvvk+erdAmMdqAvKC4mWbOWBNSZmid6aWhwpB6EdAwX2oyxqxRLa9e45Pji+ghwnfbZwz3KeiohTxr1wm6n+KaGtJ/8ZTDnzqrbUaxlqwyZ6xKoryT+Br1K21kpLIsH/CwTucyUof58cjZqEF22WIPYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737064471; c=relaxed/simple;
	bh=W0fhYjk0pKu/J/zmEBIVmkCVajnmq5ATarh/mo+0Qtk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BK3AZejAo7m/I6cSwfwXLLUH7awKhu7dFjaPIMWopx0GNU+GDU5lbN2pE0CdRvm4EwOd/AVhbgcFNRiPZpnhKKRmtnZVBUAf7hJyO5/cNB4LX3Xw8Na0KdJRnOuve/oWWMnByl/iP+FkBK2KO+YqL1b8449yEiX9FN7imnPUJa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bzhDq8Ia; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lL4rdO7b; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bzhDq8Ia";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lL4rdO7b"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GJBrEO030533
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 21:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=sVJtAMDB4l79i91w
	lha/JFKwae0MUhBna88ZKH4DNO8=; b=bzhDq8IaMXROr9wXeM6TF+xpjt82kzMB
	wp5NQz5decr6owPworkLb+tiqjnju7VfUPUskrOm+If/shXnQUDAYdptE49W41Nb
	B4rSSvbJ0Y0TnwT5ltQo4/grULEKPdpA9e64izwbGkYZL65aZwvTUj+BY797M87F
	D97rzXval0t3HmZ6l0c41JGINXOoZHAhVApXRIt6sglRa5chMp8SLpPP1Mcn4ODO
	aPxP4bYmZrS6RVUfSXtE7MwodDp7hKKiELcOW4IszDa1GZqY6nYoNOVzl9qT5er7
	e1MkhLtHy1aOW9FfGcvG4ZFdkw4EQmw+WUQbCGfruXXpWr02waDRnw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 446912uyd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 21:54:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50GKPJea036300
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 21:54:27 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 443f3by7fy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 21:54:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WgJAc2jriA18+emcYuOhWxg0tHrb2Ul1F2VfmmV7XLVF1Wqiy+DT6S9aL/L6v+YAmTXEne8lifBvJBg7xnspijTT30Tsw44D5do5T0VC8HBoSaIs0YTbZpqJ3uyjfftdkNzOboE2mW6kOAQ0X/Z9vxa1TvI99ofCRNm3LWr12tMCrCFVm3KPtm7rKFZwLhA65XFNdL2Fm7eX28aES0fhjg7djzjnSj3qIFmtRJRQKnbTpc4HFemdrj8VBjyCC3J3F2+i3EPyV6zlnkzAnx9VphfVe9AKTkDxBVaLzLB/DthwYiACmuj7dvUQT9ynNiphZu8tthk5iBCafeil3I/Y/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVJtAMDB4l79i91wlha/JFKwae0MUhBna88ZKH4DNO8=;
 b=PSBSxl6fAQKIvYvoeifUkLPUFVqpN3a5S4zJOqBYSnCGhFN/9cRRH/gaIcne5B02OOCpsNvb4PULg56ys0aaBjn8Z+cDOhesojbzpwJLoniBDuhpUH281oX11QZBuVqIXV48Oa5fDTClVH9/na2VUYRgdgRpOBG0JjHxdc01y0pcFKTQS8pc2ksxD7Z1ewGE3USyAd23qTIiNARAZgm9krmMc6iXXF/Jwm0U7kEzVdKM0GxkONzN0Mm475CUAwBQpQOYei7qebyZMvAz9N0ijwE/Y2VGGFzazL0OfhIHgOCcJuOOdPZL+k8IwUH0Tus45XylBf1DwhUijDl1lwjgOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVJtAMDB4l79i91wlha/JFKwae0MUhBna88ZKH4DNO8=;
 b=lL4rdO7b9PUdfamZFlie5GoagFIeqzluzYTbhYhSlY9jJXXXPq/HUElG5UOFZQErVDet2smENoFZ5cTTpMI6wW1LT+aecGhpHJEIdOSLnj58Z+UkYtSDdScezpKIvxpzFS/kFAdxmhgQc6+JYE7K9r2OcZDlwjpJrbyc27DmewA=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by SA1PR10MB6367.namprd10.prod.outlook.com (2603:10b6:806:257::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Thu, 16 Jan
 2025 21:54:24 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8356.014; Thu, 16 Jan 2025
 21:54:24 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/2] tests: do not pass -flto to the compiler or linker
Date: Thu, 16 Jan 2025 21:54:17 +0000
Message-ID: <20250116215418.417155-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.47.1.279.g84c5f4e78e
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0171.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::17) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|SA1PR10MB6367:EE_
X-MS-Office365-Filtering-Correlation-Id: c3705210-1a0f-41ad-c322-08dd3678572e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bh6cf4iBd/N5x34l0+lrDfomQXzZ4/4rjcf6Kval+J2PK7Q86c8G34y3jrvH?=
 =?us-ascii?Q?gpZTX9AgM3cSlysQVtHWAh05fdsd2YtWftW2djPDF7TTfiMaRr1Q/QRMHNZd?=
 =?us-ascii?Q?xx/6xgq2FWy2LzpqpUeRxxvmcxMJeerifr+f5Hki3urFy9lvjmBMf8xgjcDA?=
 =?us-ascii?Q?SQ5sA3ZV5r1R2fjCThNBTdyXwwFcXSQhzvLg5WxAWppDvcdxuiObyC9TADzi?=
 =?us-ascii?Q?9qu779pxYf8k48vxHl6+xlkMzYca4ybCDzF+N75EvqkxcLsrZzamD6PnHmCL?=
 =?us-ascii?Q?Z/5XKZOuln2ky3A1IWDRmo/TsaTphJ0DUGu2dfBPqty3XRKAfihYqvWthjmK?=
 =?us-ascii?Q?GvNI8rnuMa9dvdMrU7zx/NwjVxk8sNa7R/mYtRhlzs7XAV1H7TVFmTb4VfuK?=
 =?us-ascii?Q?dLahH6IxRzoVmbcNpOb5V75yC2lWhFux2e2lYsGnagBA0QVshSYDde0ijIJ5?=
 =?us-ascii?Q?AtUjgRPmbiIW/XKPIJ0BWfqRrOiDiab+g9tpPbfgbhxgSI8BvaR0td2cV6c5?=
 =?us-ascii?Q?003OnnwzqjRpVSH8ZHoDW817BogDziOMAxk4VTFMpMthOxO5QeuVf+BXGPta?=
 =?us-ascii?Q?Fcy/f0c9kaq/2beS8B+vUKPSkCdZ6m1ZY/ZofoOp65Co2B/2trGfGSVfwPfY?=
 =?us-ascii?Q?mPIdBUIHOA5kx2pAWUDtJUKeEulHgx2AlEWEHWglev2nKMeJiRc/Gq7230AN?=
 =?us-ascii?Q?6DDWB0psJ+iFhNqF8aWUxBLe2yTFlZHODPisL9yK+TKSkwxHCEddrel3LqFv?=
 =?us-ascii?Q?oKR2SQY/ynvd1wyFtV3dTSm6SdB4JQmawv2dhm6U4hhZ6kx7TK/QfdJm7ZWe?=
 =?us-ascii?Q?S0N8SMh8n8psgAir5iHn8j3p0LgItx+GzSLW1pb3ppL7zpyqc80EgkPZRpIR?=
 =?us-ascii?Q?isUo9WO3fdJsqLsj9hxoGH9v4fyiPl89emQHjWtQMW5L6IB7+sowZ2QZsr5M?=
 =?us-ascii?Q?b8ACnZu2ERR8mwp2VHwGPnG5uVBokJjqs6LLHssB19hrnKNMehkiUip2WUl/?=
 =?us-ascii?Q?7JyivjxVWvx1Ee5PpyzTLtNRpCWGxGf8Ub0jP02JJimd+mcFk6K27lfmgfGB?=
 =?us-ascii?Q?XyyGR32Yup57Y0aYuOphIYuL15YgfJTuR0tMKO7c727ddHT2g0pvaegYvfQo?=
 =?us-ascii?Q?/VSdvgB06ACJVWyBKtN6cF6kLb3a+rpEHrz3Q8Sg5d4v6N+N1V6r+i+hPgL0?=
 =?us-ascii?Q?BlvWk/33zxkFGjKJ6JTFO4F4hGw3ZBGeY+k5p3F7utK/kfbFcPvyQBGHdiDF?=
 =?us-ascii?Q?1DJDOtUvsKQTDTN0V0WpJ7SoG2gFvT33hvz/LmEuwcWcD6NgDiEKzwBWOfrF?=
 =?us-ascii?Q?ThBlD+/Dlp6toD/QP0rViLQWrteExBjgf8RbmU3B2Lun/vHBuko+Ybdt7FnT?=
 =?us-ascii?Q?IyHTaC8wlnxR+TJDKU+42qdAf859?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NXKGT1bzMsEz2pFcFu6U6C6ToJytvtMwFDX48nAJf8WTevCEqZRVCAE3pV16?=
 =?us-ascii?Q?rJ8ayVw7/UK/GlhlVa/VPfRTtKhfnXpn0gcXik6iDG8+58sY3qRuahWJQr7N?=
 =?us-ascii?Q?9ustvCviD0o2XcGvcTUk7JHrgUb7TLlAdOFohO5qdOhbKhUf4hS91Msvml9N?=
 =?us-ascii?Q?Gjvc3rJpX+cQunaBQovvFLl87pxjsojCN82AbGY+RYt5KQNeA9I9akxDirdU?=
 =?us-ascii?Q?//lT4G+3rkCGpXE9mjgycySrAXzSP1seXAmxSGtsBQNFKjFTw53LHmCYN24U?=
 =?us-ascii?Q?ZYHCd6wfE8xuvzHFO+XZeZTMe+lMhcw5JLX3KWZeDWEcIrmNH/MVT9DBowCb?=
 =?us-ascii?Q?dk1OsLNkgy4J2z2pOCwM9Kl/NV8vRgQ9v4KTBuCyDh0/2S2Fjx0rwRpKABbW?=
 =?us-ascii?Q?/nKfKbiqVVvqleQB3clrbqp4ftbrCs95rLdJjNSyYoan+BCy8XCwVHyI/Dxy?=
 =?us-ascii?Q?TQKWkxrPJF5S+9VpI/q1wLh4Wg8ShLlMf7t3/ikSgj9MK7EyaCEx72h6XeVr?=
 =?us-ascii?Q?JdiFJqEN5iOVKAnm1l7vFtD+u1Vzqs6gf+N0oFaeqHHHGPOsmvxEYiV1F1yw?=
 =?us-ascii?Q?UuhdMdkuFNIS+Hw8sxNrjYEfZ2mRF+iRVjncxD/eMfrXAHqZPtPwMXmvxMZM?=
 =?us-ascii?Q?3UKjEueFcnmaDXZQwr/yvY4E8SNv1Cm0I6Ql+637MJ5o0sfIiu49e6htaNvT?=
 =?us-ascii?Q?D4P4rzHNM+wR6NpHIypjgOuaAHfrKE/jcPqht66p/qMDZuI9YrzBxAasQSAY?=
 =?us-ascii?Q?uBtCBDAJwYc1JVncOUhNSr5ZHdoMOOrGbCi7rp8fmRBk5XgwGhJPVcpAVdXc?=
 =?us-ascii?Q?66spwmnCFDao4lxuhmpFqBRKotglgxw0DCvFyZxVcfiHTBZYm69iWz1pT73F?=
 =?us-ascii?Q?82GGTxLPYKppOKBS8lE182wUVMsucautlY3YW7G39RO5L+1ssZCVr/M2hKUh?=
 =?us-ascii?Q?IqNybcaPTHSzHGyHwrutssJGhx3UV1quGmR45Iep1n6TID8YySXTx0Mg2dqf?=
 =?us-ascii?Q?zfNabpXzO/Vo9vglH4jAMpTfeltBbOWC2NLGd8qKVIlzhsDdD3bpfnb9t1E1?=
 =?us-ascii?Q?nWgjmg/lGfxTO2xPKtiqwle2j8jW3zz3FOCBVWdM8shTf6LM7k+v0nYJ5LLH?=
 =?us-ascii?Q?895vzJuiIwg4vz7icF/SAsVcNkyRCXd11L3OUqxVDCZpvhbiQTpUvHQLisDE?=
 =?us-ascii?Q?zAwu9o564G7HFfxQTWzYulr7Akode9WQYIdX61xC7U9qxfx8cmCgwl495JmO?=
 =?us-ascii?Q?tvluvCtHipy2yNBlUR8vY0QwQUakmWMDV+LoX1T4ENGaSyLZYl+IN9BiaxLo?=
 =?us-ascii?Q?07hcLuufhNNTf0ThQ57DAZfILIO/cnjSPi+txQAC/nxADmXlHe2ANWwdNyqG?=
 =?us-ascii?Q?OFGSIPtpvuZlqilkvJYyv7gjhtye+iGTv0oufxWRubJTt/ZbscHK+2+Ezs1q?=
 =?us-ascii?Q?Ai3+sEYrghnijIlLnumy4xup83zjmzepntpXapEAY3inRqxZuq2qD9HHSrZd?=
 =?us-ascii?Q?rsXCv8zZdR3iGiE7QmC3If8Dd41oLjvCstU+HrIlCvTAjqM+ayA3H55R160g?=
 =?us-ascii?Q?UcqDN1wkJ6w8x/xZW7fYoqLnxN+0lnvN5inWt+TUDqgv83kysPwlqjdvjLiY?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0nRyObS+0gT8S1aYsoWHb70D6y0FcSGZ/z53pNIhujLLDcZmY1zgxxTPj/NliraqMFyU2Q8arw3egeniDphuZUlSyxzCRgimfx1450PXVpgDfZ/lcGHpMwdcubVSHWjkR6O8NresQbm6ajs4UW94McjS87Ke1ZZCZ9oCHkqf6AKkWAgxqoUNQgUFmvjupI+y1ziTEc7v6Oouj6KcRNxZSSU0fHXntOtpucLCrj+CCZMDxuHYBFgf1dp22NK78nMEVDHg0DDJV63BM8RSj/UzMQVfEl7zn9NaSLiz4m9YsOejQtgkQKUWEqIagqz4OSa2DpBg/Maj3o/oiONEX3b0+sqWZgE16DXHI4kLKrY4WmfxjnN+yaxZlAKSTiqes2ZDybFNpdFbRmervXCyrgCkbR3rcQascHkSFBOPoFqYi4RYX4IckLVjlOb2E9WGRDmk662moLjBOeriXmIhHRSVDDTi7AnQA1NQXGp4eU//QifBVqqBDdRuZv95ilCl5b8clOqi91uL2B6bUGdnDoAypjKxQbx4V7Qo/Xz1hh2TQ8drtyglPccjA3+R1zRAOsZPJcwN1pM7B2kzX1K40gSnXtIyphIBhPLpNGSTDLJocyk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3705210-1a0f-41ad-c322-08dd3678572e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 21:54:24.3927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ihIRI1IRhMcF1UtwbErp1AjK6lrojEewQszaeIiwSAwQBOLKw3dHqGZW8+oS+lSH/xUvJuynl15axfBc4fDcEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6367
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_09,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501160162
X-Proofpoint-ORIG-GUID: zEIH8frfIujrKXKRX7Kj-ORqsKC982FN
X-Proofpoint-GUID: zEIH8frfIujrKXKRX7Kj-ORqsKC982FN

We don't want to compile tests with -flto by default: if the distro
compiler automatically activates it, turn it off by explicitly passing
-fno-lto to all compiler and linker invocations in the testsuite.

(This is a bit fiddly because this is the first CPPFLAG which is
not also a valid flag to dtrace(1) itself, so we have to split
a variable up a bit.)

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 runtest.sh | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/runtest.sh b/runtest.sh
index 94634f80c2ebf..1cb5be8213396 100755
--- a/runtest.sh
+++ b/runtest.sh
@@ -589,8 +589,9 @@ else
         exit 1
     fi
 fi
-export test_cppflags
-export test_ldflags
+core_raw_dt_flags="$test_cppflags"
+export test_cppflags="$test_cppflags -fno-lto"
+export test_ldflags="$test_ldflags -fno-lto"
 export test_libdir
 
 # Figure out if the preprocessor supports -fno-diagnostics-show-option: if it
@@ -1085,7 +1086,7 @@ for dt in $dtrace; do
         # Default and substitute in flags.  The raw_dt_flags apply even to a
         # sh invocation.
 
-        raw_dt_flags="$test_cppflags"
+        raw_dt_flags="$core_raw_dt_flags"
 
         expected_tag=
         if [[ $testonly =~ ^err\.D_ ]]; then
-- 
2.47.1.279.g84c5f4e78e

