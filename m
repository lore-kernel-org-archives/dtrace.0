Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C0B14A09C
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 13:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752673822; cv=fail; b=aYJOAsV7BeA5xuOuvz5+gZJ2lc8S/lWNs0JC5C6lq5RRBtFdxIakGLTXB1QaxwDqLhxtxhn0cezUb3kpJI15uY0eFyTBubVg5EnAsDid818yz968HjaNB3cdVaCfsWvvGqe1vQfb8yEVgTEMydI/1psRqaXvsCwb8WNBKOoaex0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752673822; c=relaxed/simple;
	bh=gtb27slOz38+lzfUf2Ao3HgP5OaaE1ZeRGcL1PUT9tc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=ke9R7WC7a5BVZNbFDAJxztm0VGXrUig8C6Fp/h94ejq3YBEA9THegpeNnViX5cAdmw85yT+hpGe5l6zmE51BzQ57/2IA6xEEqR8lBx9JrF2CyjYTkIUJxH5TvPz7h/z5eagrmpaHTNscZXWf0/MLJdDwGtKCeKvCXDBffae2aC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KP+WUGSW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IdtxciMl; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KP+WUGSW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IdtxciMl"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G7gsVf019738
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 13:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ol8jFItbo/TgDOOvkR
	jiclLIp3rS4ZyxKF6oPWhbu9M=; b=KP+WUGSWd0hzvvkxHZ9x4jVYpDhHSgRa49
	skMh+mIN84LVvqLqJIehn2to+EKD3uSsG0By+IrsleDfyDFID/9fTy95h/3z0hF8
	aBAV1mYQlWFhR2ki5h0DFuGY6coUYqFFzrFFXw+u6UBEjmNBjOL3HKgFoXjpnPAZ
	gT09GGMnAHw9njh7Jkuow9cgXsbf+GEcdVd4ftEfRHCKWqr6eOh7KnPKAVD6Tlue
	UkmfNc9CeLMcELs5Hb+hqJ7M1xCsq8VXEVtNIRoQZQC7RN4Oz8IrtnZ//TwoY3b8
	3iH/6tHGoBaPA4+R+2Wg9dy9kzXdPG4qA63gKQWiTTHrOSp5CIfg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ufnqsqra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 13:50:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56GBuuti011645
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 13:50:18 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2060.outbound.protection.outlook.com [40.107.236.60])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5bcnwm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 13:50:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=myNCW4fMb/RBoGp9pnC0zzvsQIUPN092XUC7iCekJNElO1sdWQjlvxyV3Ra6Y7OAgEog5u83WKlmOA4LsSjzi35Jj8baU6sIgQcivvI8CUw7ckEYhJayyyNVQk6n1CLbPZxGEt6FQRD6zdb3gZ5m8oanGLFOxEiSmYb/uUL92Gp7TAwkAKridEKlPbNAw94YfHx5XR8nX6TQjlBra9b2FwJIvg/efFFKGmw4MujjsKCXx+u/PUih88ZCG+EGIw/kakV45rFk41e0caV5PUgde39/5KchI9K6M7D4+XXUX6cbi3aJSQab7NIwWebLnQdt2J3pvfigdOiI57ZMFBaFXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ol8jFItbo/TgDOOvkRjiclLIp3rS4ZyxKF6oPWhbu9M=;
 b=hUTUzER4diPYeGO1RbowjKnS4i5YBUn4uWXTrNBcgkhkpDQeb6lwmtFfdIMvZQ5BOD651ix45E2g6wNO+zxTqrwkkweizmjwOAmVcIT5IyGEHYx7rFJhUK4+jn5wYC8zi8fJFj/JaexofQcyy0lDDNAhmrjwLkcaa65vAMMwcczGxQ1iNUHppZDfn8SdAwKDKvbYLcim4eze+yJ9UrbyFHKehEuiKwuKeXwjj5tSm9EzoYGhbjEavIaRw9xSaA6dFj1aCCJ428Mpx+5N2iLGNqGUDXRXgv95Efux587CWwtqqdaCcR6FlYlADFjZRL7b+ayiB4MD86A+Isz8DW06TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ol8jFItbo/TgDOOvkRjiclLIp3rS4ZyxKF6oPWhbu9M=;
 b=IdtxciMlywlEnS0hRdUf4kiy+PnGKmook6heYqFNH62WuPqQS+TadSdJTarzjgZjEI/M/YiibWznh22mH78P3jQAt0yJkkw8s5NN4frv+aZ4QcXdPgtOccQAdGt1EgZqmpmcgDjOl1u/xZ467/T9CwlQvF+XDE9riFy4LGx3geM=
Received: from BN0PR10MB5029.namprd10.prod.outlook.com (2603:10b6:408:115::16)
 by MW4PR10MB5677.namprd10.prod.outlook.com (2603:10b6:303:18e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Wed, 16 Jul
 2025 13:50:15 +0000
Received: from BN0PR10MB5029.namprd10.prod.outlook.com
 ([fe80::b85a:c2fa:6a79:393f]) by BN0PR10MB5029.namprd10.prod.outlook.com
 ([fe80::b85a:c2fa:6a79:393f%6]) with mapi id 15.20.8922.035; Wed, 16 Jul 2025
 13:50:14 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH 1.5/3] Remove unused map-of-maps functions
References: <20250501183759.27917-1-eugene.loh@oracle.com>
Emacs: impress your (remaining) friends and neighbors.
Date: Wed, 16 Jul 2025 14:50:08 +0100
In-Reply-To: <20250501183759.27917-1-eugene.loh@oracle.com> (eugene loh's
	message of "Thu, 1 May 2025 14:37:59 -0400")
Message-ID: <87ikjsmei7.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0012.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::24) To BN0PR10MB5029.namprd10.prod.outlook.com
 (2603:10b6:408:115::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5029:EE_|MW4PR10MB5677:EE_
X-MS-Office365-Filtering-Correlation-Id: c8e361f6-e1c7-4867-1a88-08ddc46fb0be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qcoYmwHR14WqiJTlCy2xEPnkSXnnF2S8gcV7LpaNKZgbFFOBkrej99hEDD3r?=
 =?us-ascii?Q?CHVhP7jNiAhURS6+5Nb7Phs/3zIR4mTO28Kf7vU/Qgf16KNo4u9AqiFQTaY0?=
 =?us-ascii?Q?vyevzmZk/4NF7P4/I0NvGbksPQ9SvzgAtOscvgP4VsMKUKa1S1hzx+FkazYo?=
 =?us-ascii?Q?XLzP0nC30j/tlFkF4bo+NXpDH5eqzjhTB6ek5EG71sfn9qGJNSCwAfK3Akye?=
 =?us-ascii?Q?0lYPOJ+qvLZvVo0XEWtEsCKjb2uFMT+ig5Rw0F/QusHOOt3padfeIIcfDHz2?=
 =?us-ascii?Q?dtwhqdKtZNZf3gs3X3oJBZl7ZVuy7YLLacJUoiXtBwbc5PLxn6TV5wK2Z2Xv?=
 =?us-ascii?Q?iSeP6TBxf4aQl0EzKfq4cDDn7KH26W6a3DcL/oyGHHjngWxM1i8DKEKa9edx?=
 =?us-ascii?Q?MGxYRPbSol7BtlLYkUpZQmXVPwTsd+kLF+ZYsslaA6fTvO49P6zBKL3CBAiH?=
 =?us-ascii?Q?NvXr/wSmNh9NDyuW6rMqiM+2MrOwVpS5CdFY3jSnpJ4rSAgYJc07lnEb2mot?=
 =?us-ascii?Q?C7dCKvwC6erxcGil0MVhR8jlUY/tP7f39Xme+i6xJwc9pr0IP36+E6dn4eT3?=
 =?us-ascii?Q?9eKcsKEg1l6Sj1+jlZPjQg5RN4cRPNCWJOe2HO8Irt1b4naiH/bCXkVdyats?=
 =?us-ascii?Q?S5kPetaL4JykiWV3FZbL5lzdoJlh53FqtJ2vWkpstazoCQRKzKvfQhXsmmbb?=
 =?us-ascii?Q?GuCttBXW7Biz2YyHMj9eepemuKFozl4BYUCF87RPIHTCOOO5FGzQuSL8F7kB?=
 =?us-ascii?Q?8q1vGpMg9NC816FRP7nXSF3SVAFeuT+DO1n4aqDbyd3RjHDLyrG7A8+/+PSv?=
 =?us-ascii?Q?jnykh/fUD+zxeRct0Ewjp1FNkej0RSzdgz0w4/qJFa1wgYCWPJIuc3z1dK6b?=
 =?us-ascii?Q?+9T11OD165rH5yuBETN74DqzDvB+BcqKNjFJS2z3eOhDf5wDqUwxy9M3HjWF?=
 =?us-ascii?Q?qkxekacf2sUnbKw8ydYTm6U0PfuEg6IFcOquARHo6QQSiqups+TyRYoMEzLa?=
 =?us-ascii?Q?ES00IZg104bfjok2fC1D+Ij9EfFWCvGZBeXaOA6zmok1r74W4cDzJSB5YP05?=
 =?us-ascii?Q?3F0mWUEQ4hRecHtqiwjdamEp7uA14pBnLFmWle4yaMP5eiCXBSSBx1HI0CcH?=
 =?us-ascii?Q?rr+a+qpbE3+VPEfEIai6kIemYyzvFTxHzQpg7ZTdG5kQhslH6AKV6+aHxmCB?=
 =?us-ascii?Q?06pTwnfR6czyPJVeUDCP2qRQk6R6dzzKzQbqEdqvJLr+o6FJywuxpRY+VY7b?=
 =?us-ascii?Q?u0r86iA2YXxOGXy9n3snFtvlGcC5+GOndM5ePQw3QcGiYYdululPq9jlahcZ?=
 =?us-ascii?Q?NnlHGi0FquWgvKGCrsiCdOHUZgeyeyvLLuVPjMUiKn5yKQhWO1iFXvZB+euy?=
 =?us-ascii?Q?y22lt52k0tU7qNa+uj56BClThdOxRRxt3BUY7JQ9Yazn1ckUyQjFOLlwT52t?=
 =?us-ascii?Q?D4D3Y8fcnI4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5029.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9hkGoozLDreMVd9e3wGC6yiRvOezypVPG+iREmPS0GAHMOucP9DVoy9OMTkt?=
 =?us-ascii?Q?ZjZ45YzqxQckDCaitPTXyJGaa9h6A1+qOxPrhAWlf3bhRnKIxg+VGN3naWwu?=
 =?us-ascii?Q?WcNWceV8/EAMtoRxq3TZk9smL5HB61xtg0jp1LymVAyg5/0jUG0WeUwoICJ0?=
 =?us-ascii?Q?8rDzztdH4NU5bs2A9Z/L4Csq6Nu87EwXLpNvkU7oJGB7HlP8ZDZjGFp6jMln?=
 =?us-ascii?Q?gvXoypTqzke3x+gCJclofe0Nt9yYYkMxrnPRU73DpK94JzS8hwr55N8CyfRy?=
 =?us-ascii?Q?MNhEFH1FX6gsYfYpNTTjjxrsrke4SUnBYugxYdWFbEPq+gzr2aEqCY60t0zg?=
 =?us-ascii?Q?dtfN+WSM3mQq/Ms1AmPWLlS/TEIOhjN9YB5ofdTmhG4SXsRW6vfTCiuOpXqY?=
 =?us-ascii?Q?ZCPV4FyCfYpddChnn0qewb99pLdFDL6hNCRVZR25QrFzE1EIKoVzkbOYRwZN?=
 =?us-ascii?Q?FCSZOXRt4Htcvbrmc+ebc2/obWb4PEoQBhJ0iF20s8kJgpTnHUGdneDt2Fa0?=
 =?us-ascii?Q?SHmgoqQ3gMO8jwdDEquRYYHNWJDd724dXltZSoihHyLZkn9kU7VHKK4vgCRi?=
 =?us-ascii?Q?lepMouN3LO9H2iJGrjJFl8/XOe4JkAaz08atU853HUbRTb4PaGUrJFvjZu2w?=
 =?us-ascii?Q?OyH84uOPQuGTw51AIpjUKFcltcb7PEQTOSCbrbP3X1FQItSK5oNBQkZ/7Gs0?=
 =?us-ascii?Q?7g7MiZcO0YmAWe+TueMGX3bwoh8szlEMNyE3901RRNku+JAZGxdYwVGIXpmX?=
 =?us-ascii?Q?Vz8GoJ2wPTUgCFRBeO6iGLQYGkhZRixjTwSTBJRN8bThmWeiRUpvmnatWKaL?=
 =?us-ascii?Q?u1EUg5erSbXMqmFBEayptC6Mppy03TAlcsrwY9kU5Kl/F7BHohrFvpapaNLv?=
 =?us-ascii?Q?Li1Hwqk4ArMSl+zcne0Lq3WBd/rDtgV3lreufFJrRosvAWRe8rXpHRfU/T+i?=
 =?us-ascii?Q?P0Y2ISNZDqKwpicpVfBvF/WzjVsFzZ+P/wTJ5IuDeE/61t4OEp7ENM/kFPR9?=
 =?us-ascii?Q?p0lbhwDAUIbJJ6nEsSEQ5Yiysty9iCcfcm8SHw8F+oc81vkv46mjP70HKuET?=
 =?us-ascii?Q?hZ9zTH/OG8xG3afJiePoH1JJF3ABiu/FV9N6fe6WNJeKcEEjoxN+R/FWAriG?=
 =?us-ascii?Q?ds609WRDvc64yXuJZ1Kw6zQ8R+Sjnkb2X5ON1sORx+zfk55U/qwkoVJeyd80?=
 =?us-ascii?Q?MukPvvZJgQaSokB6Wz5rjeVNiaRGU6NQU4T9VLHYtruqPIlqYdIvmMGhzLN4?=
 =?us-ascii?Q?ZUCfBBoubCcbAqet3P5dRWSpUQpaPgccr3PnPrzCAseblxefL5j1vbCzu8CF?=
 =?us-ascii?Q?H22iaRrzZxDMTQItbGxP1ZW5QrG3US/DCKcnFG+6d6EkBLrRIgzircv0hQiO?=
 =?us-ascii?Q?49ohfLpQCVwBAV4hYB5yb6XZ9ixlxsJRwV5wbwbIfTnKpHRmCE7SdI6UOwZJ?=
 =?us-ascii?Q?Qyf7Zft7oEfrM8coedry9aKK7T09/pEtl3Ed4ZL79/wq7Z5N2nq+I2Kexl0P?=
 =?us-ascii?Q?rocjel0J+bTa8LrJ9DQxvAoT1h7tnARAvt7q7/uX9LZBkLs939vCvPjRtfVL?=
 =?us-ascii?Q?4NgkvkA9Ke1fZNpI0RziQXN+1+zg4Zwrngpj3u3Fesf1wrHSXask0yynPjFu?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JminU+jFQSePu/oF1B5CW7sVxIbJ8E2Xs67kQ+dgB6kawYHNrLt4b7moUMdBCcwD0zROYovTp0Mf9VgpNTtXIisqDq0OCVChi2v22v1sGFAMTt3Ui3tyT3dAuKrDrI8w6F/MXoq3XJLESQzk2hRlYkMmeruTPUsMs3Fj63sIVQ9rVEjIw+0Q7/xbXZzw7Bn+EloXNtT1/91X2QQ+tla9dGLkLoKvhhOWG/SeGLo+r1U9QVzTMwIY2HQ/A/S8OkyUWeNDN/HpzimJnD0Fmv4uEeRNNU7PnLC9Jz5MFonh4+od2r/9Tq+0LgwmT8WMh4XaMBppJ+pKVCUnC6uVdTN0Q5vuSxJfJaColYk5UC20ogdnC0OVzFBJDDBfJo4LRqNYoIariau9OgOZmU+NwhattZ0n2Es7sbxTC959MEkEDWyfnaWDVKar30hTwDC3d+3Rr/dNlsPy8Iazmt39qccOeSzKsv26mLfA75KK3HyI84pSnvDZaOn5gNm7MFnwysOLHgvbrLDc6OaV42/Zxr/OQzfiGjFYMh3nHRLUeApq5sjzkhd+yuBHmGTGUtpHEeabgbAx3EvEcBrd00Rln3+HTW9IY9FWmPjZxh8thAtalB8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e361f6-e1c7-4867-1a88-08ddc46fb0be
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5029.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 13:50:14.5108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hbg5faUhfRagwK7p7WZ7RymaVnJS8lM2ictreoimsP9baggqT8xesLGrDmXFp16TacKRn+1nJiIUvZncBt9dzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5677
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507160124
X-Proofpoint-GUID: LwdNoPG9JqyQQx--18SLRspaOFuQ5IIp
X-Proofpoint-ORIG-GUID: LwdNoPG9JqyQQx--18SLRspaOFuQ5IIp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEyNCBTYWx0ZWRfX/d33iAbQK+TP tY1KyzzWrt/SS5UjlQuDjxz76Q8cDr10faRQXFeyhymLgDaUmONxX5SrjPX/Uzigy7Jfk6Mu/z/ 8NGeNzHuub8EtuRFMyZKjkV/ACvjHZ2wVY5F+btwSOQkwWZYUCaf96uRW6f/9I7y8bJDoVo07o3
 xvf8am4MYPB6Lw7pijFyGgn8mpjFxtLDg9B6nOu4tKCTbz/MZLHjHrT+8se1i7mqq2GxFA32Hoe NbcRBVpF6S9ULk4jFhBaiylRsOgzce1wEn6vhoPHinLesebsIvKbSBZRptjJFCf3GOMIqsTQKyk OwmVwMzyCqddK90xF8rPvqgAFh7OnrBIhNpAT7+TmJy8S5hIhBWAEECnZSRsY43jJWt6vu+RMr/
 ydNciz0BZAOX8g9x0X7jE8BDmS6eMFB9WrqVZnG7jUukerSNUR5XQPy6JzRCiAqmT6xc2OPo
X-Authority-Analysis: v=2.4 cv=U9ySDfru c=1 sm=1 tr=0 ts=6877ae1b b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ttqUlfu53Zy3l2AAJ6wA:9 a=bQS9OzEy0soA:10 cc=ntf awl=host:12062

On 1 May 2025, eugene loh outgrape:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

-- 
NULL && (void)
