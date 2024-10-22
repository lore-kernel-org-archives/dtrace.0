Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21F81BFE1F
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 17:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729619046; cv=fail; b=jHOtErBXLesnsBrn9rR99gURG7M+iEOtgCuCq//IOBD8W6g8ulaNcHZMpGv/rPIMIOKRnX0owawOYNlcIBtHx7HR2FxvZqclBz+PpV81v+6ztKN7WaqGGQulgXa4x/QzNOmFY57H/16y6Vbv3rd2gfU5eqaKT+Qe6BvO0zd6Ps0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729619046; c=relaxed/simple;
	bh=YxHwP5aSMEipQbf8zurFCXYyPjoJUxfVgY0ET8Lvh+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=C/qODQr1uVEvVBzk1DNYTU556n7k69UwQc/xae4Ic8b/b6AMQ2uUiIy6rIRNpT3Sq0k5Qd/Ig2KDlT3EkV1hjDYZGoT8r3Ne093fArGYBQUzT1YXuR3c347EvFJvJBlMt0PzFBQYeRn+k9aJ3vKSItbpRcvhsArAN3HuAgc3pmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kVOjLquq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=j0lhCTl2; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kVOjLquq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="j0lhCTl2"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MHfdLO023595
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 17:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=wAB1pAXMen+6CICqps
	EXgeGcUq5l3UXh0WcfGwt+eV4=; b=kVOjLquq28G/dFzjJc2nexJQr22joMvUX+
	hq/wTvSwB83NC3v54XYY0a+T9hLNoP2AHK8bqv8uAChJciPwkWKRcCcgos1rJJ91
	hDZplGhAfjiGPZ7EZk6K1uWY4KUQywiQ1Ib6Wf/gM+Xw7i0u2O69/YEy6FMd/QMc
	O0hoIwAkhvRkHk91v+04fINXEg+QXLCJYhO7oXDRTd73M/KZYQudyI/i7i+m8BwN
	abMkB3VHpw2y0eV0XrllKU2H2uWMSMZnegfgqPxOO9j7OIQtf5vb6lzyF50DcxUL
	CeFufB4Yv6UMt8zwRWmMXvOyjKp6HaVFpgmm+P3Stk3rBiCNHYXg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c57qe8xh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 17:44:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49MH0V24019706
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 17:44:00 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42c37e89ph-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 17:44:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=crM0LxqhQnaWxc2AYUv9vFkiLk86NW/KTyXORY3Qapncb17/vk091BPcO9RjHyN+X4U824z99XUhhqMsKU0x1pYMO3s0gja8E8OBfjnIKACyTQpHmLRWWAvP5egofI3C1kSpPSR7O5JEvA7Uvl+/XYpNCxWVWUdZHwr8zCJ+MxXiAaM1j5RQx8d24hPh7UIekDRYukE8FwAvD0iq3jAsvk5lIIVShWnHYTs25wUo6qJ7WbdTJpDNowUdK6dldhfPzXQLyL2PAuqV3GD2vzXUIAtF+GBqSDPXRdfG55K5pj41MeqjelRo3MtoOLLBrhewYfsRO107Mye4QGu6XmeprQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAB1pAXMen+6CICqpsEXgeGcUq5l3UXh0WcfGwt+eV4=;
 b=dGtY1vHf2xz0n61eulhUi3rykJeyRiVDSUHgwrPpZXDW24LSA8MDUgVNRFv/e6Z1CWsRk13kxEpn6NcuCK4pptDsqZZIvzDqq4fUKRj68LTQuGx36fKvbWXbok4NIzFY7iCv7tPUQHppsBogjo7mau1Y5dgPNlQ+w/x8dBStGMBhsJaW8HqByWuP5ZcEAamFonPFuKTlLn4pJjkPekiMPq+yTezUEzvGCftH/MSM3FqPYAK8J/yaQJ6Mk30aHgqXFpZ584DNHIK9iAiWbm668vVRR+jYhFL/5swbpwxLe/hcS+JTDzWQ9ytJym7UxF4/Tte1h2Pr4pbyG5n8IKhnVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wAB1pAXMen+6CICqpsEXgeGcUq5l3UXh0WcfGwt+eV4=;
 b=j0lhCTl2K+dV/zY0s0K3SO86ctp/YN05+Y817HcSAy+7mF46TXceBTScBjm6Xj0XVQ9nK5BnZCcO7nHkBKpCzM8IMcBDpf91/n2Pa+Y8rMqWj2B+lny9lFJUNAW/RPCAnJrKl36furfjhxi7NPZwm+aq8FQO8lxcmRhfJVxojrM=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS7PR10MB7277.namprd10.prod.outlook.com (2603:10b6:8:d8::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.28; Tue, 22 Oct 2024 17:43:57 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8069.024; Tue, 22 Oct 2024
 17:43:57 +0000
Date: Tue, 22 Oct 2024 13:43:54 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 4/6] cg: add argument remapping in the trampoline
Message-ID: <ZxfkWjbS1c0vXLvn@oracle.com>
References: <20241018195808.270688-1-nick.alcock@oracle.com>
 <20241018195808.270688-5-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018195808.270688-5-nick.alcock@oracle.com>
X-ClientProxiedBy: SJ0PR03CA0049.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::24) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS7PR10MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: 8652ecfc-3449-4383-9c01-08dcf2c11a92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NhnMuBvKq3AlAuC3ULQClWloy44F0oYPfJs4KirmzvwaP4XSk7hJLQHcgH07?=
 =?us-ascii?Q?XwQ3L/S62JOBWzfdrHY3kD4qlixGUujS9niekoB4CDnwMG4DND/mdgGW4MCc?=
 =?us-ascii?Q?TqUpa6pYS2it97OT4GklmP2RAeYmxgd1/8FvFIu9zM4Fv/pVFOH1B708tU1D?=
 =?us-ascii?Q?c6HYqJyt7kmlVKiOEDUIjdOMy1+2hBvMhEF+T+fyoAy4Z6Lsui0P43BI8Djy?=
 =?us-ascii?Q?WCCVU+gBaUH3wKtMiIgjnDJucLx/XYg4Yq/4d/xQoLaPhh3xKzXYTynRd3ZA?=
 =?us-ascii?Q?blKdbD9+zYDS17n3FFoYTn+dnXfs/QtfkYXkW8up7jH2m2iph09Esypp19nC?=
 =?us-ascii?Q?HudrMci1n9ocPYyjqBOnCG7brCMSWz2wQsGwVZY95nnHK8l5PrbaSmgAlQib?=
 =?us-ascii?Q?k5L59jUHopCENWfFZeyqE6iykkddRH5GI9o6zCFFYHwvm1QaQ3I+AryCr6MT?=
 =?us-ascii?Q?+lAJJAKyXrOqAoI5d6tflrVwqJA4WyeVwkWuXbGs3pArMYaR7YwSVMqlXfX5?=
 =?us-ascii?Q?8ilQqz0fGNHa6uNYIeiS6OLJAKM94dJAYRDrAK5ZYhJUGRDIsnd8cVje+3hS?=
 =?us-ascii?Q?DznBsKrMW1Ucm0Oqf1e20/ms/EIf2AbxxpPEIGHHkkXmVjDXEoTwK8yxcz+x?=
 =?us-ascii?Q?rXgeeD5oclt7pW8z1lPdRbvn/Y1l5i8ATXg2n+nE4zvZ6EbX3AhUDSsiyjeE?=
 =?us-ascii?Q?ATFu7jX0nTfAPiskgOJkWS4m05CBr2n+olfI6wDUzag9h+Pil6xMhCFfaYbs?=
 =?us-ascii?Q?Xrjdua3If+jMfyP/F4mPrDhXjnqBt3gZOAF0JaE5McFqoc9YxoDZPcol8HsJ?=
 =?us-ascii?Q?MBrTI5PCaeMYBkJZhiY78DkTEVYNuUPXPKWm8AKfdBQUGSX4brv/yS6GelhG?=
 =?us-ascii?Q?F2p5Lhv6S5skQ4YKBmU6KyQLvFt4vzpu2J15TJ+DU17u4Uaq4cyn43sso97F?=
 =?us-ascii?Q?wl+zg4+HSfa1EO985P0VvvL9CezoR//ywV1FqKDeJ1bkB5cJ7/ivCKhj4P0m?=
 =?us-ascii?Q?6isMOsqBqLlZ/ZPy202UzOFUvtbB8IvZ8pfp8XTkI+RRQFSV9tl0XuHKJS5c?=
 =?us-ascii?Q?MUCVBjV70IdY1ght7vL6d24TOxsesz9HrxK55yFQ2gRWxC7Pukcn9UpArm7l?=
 =?us-ascii?Q?w79hyd72ALNHjmJMGzXN04eooEMhnB0kzcoCP3ZP9WJhEzeYFfkKtCw5U6jd?=
 =?us-ascii?Q?2VYbqNO9RTPyB8qEWUZV0gH9C1wzjeNBv8qxEohHbKMfN7lgofEiRS1EUHMz?=
 =?us-ascii?Q?85Kp8OeuT//C90p5DHWKRu94P9tu08HpeEgq44x1VLbLimHqvbqC+mJBpPkm?=
 =?us-ascii?Q?w39M91LD/k+Ny8POPc7U4cyU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HgpRW4ZvKvm31zpF5qF+n+/d6veHWrxXbZSz/tp/GXWFmOLuhoNN4BfKqZkY?=
 =?us-ascii?Q?El4ThQooTR7Zd+3iQVQaSjiw1We/p3xtM7ZcORiHsYHMPB+EzS+uHyh2jLCW?=
 =?us-ascii?Q?/46hqXn2BdWSS8YaKHEzZG7AFVvz+zQprTAa73N3SlLNGTw5PfEvk2idAYrP?=
 =?us-ascii?Q?VW6sbl8RtRoWaDg+l9RaYN3aOa6xm/mu1VCfsAeLwzL2RsMjhWh00pcr6Vaa?=
 =?us-ascii?Q?aPDtXobSmKy1rtgkhepcMoAmgYD/ttqEBCSidyP7yEA11fGc1UDXZVrdYh+B?=
 =?us-ascii?Q?rry1LFOEyVEwI3Apw1JL/qBdj7gye8U+M5eE8lj71r9OXBnrUJbfNKZcsbyC?=
 =?us-ascii?Q?PhUxBJU6bIbEr6CnXulc4kUhCkUyotR1cFLMg9vbKGA4R5n2VtfeiCZvK8cX?=
 =?us-ascii?Q?bjViHsThLCufW8Bzb9mSbX64Qvyy69K/JLcKtjeBPEMFwXJAN0/OgziXAj0N?=
 =?us-ascii?Q?7CqxIQNvBhU9CtO4Hq43AbmaF4Ks8bWP9gBrfBDCMpPGDr9yGzhOxy9bvdS9?=
 =?us-ascii?Q?aPCEN2J3oC0FiqdAN4Obr631PqQJW7dFDsDT13KTfMYcJyET4DPqVr0GWRL9?=
 =?us-ascii?Q?lYXEGHWyRuMpDIQsA/FsGpKwBKFdMm/7S0o5PQCVilLu3GzjMG4VLDqmt+aL?=
 =?us-ascii?Q?UDUP5idRjk9VISkvUN1PAz/9p7MLB7SrBOtGIAhJs6Aeq/TVwKUsl28dofDd?=
 =?us-ascii?Q?x6EKK6Nryhvs6d0vsVogS1imvEcW7fCe9Jpi+A2C2CzONdAhQ7FlNIUa2ZI3?=
 =?us-ascii?Q?21MrYPDrdHAZf6MgQxghqpvxp3BC3jf6Ms5EunxI+PlhtZmNAZ2nQcNrEFS8?=
 =?us-ascii?Q?nMc4cJ96wnpDrKBpHH/JjTYtJ8vxw5nHij6YWOLHNkzzas3+xJd8fASeczxM?=
 =?us-ascii?Q?UmKq6S197UreWBSv/da90NejJrBULNNShzgX9DT03OyAke9NkRG8cmOsTGc9?=
 =?us-ascii?Q?MKvzGneAWyIxmZhpTEEteBTQqztpo6GEJ7QWrp01PFr5lskyKq535uTEz69i?=
 =?us-ascii?Q?tEmCXkEoeTquAo417zkcPLh6olQsVC1MnufmS84zqxv/S+acbDvdaIdIW0em?=
 =?us-ascii?Q?rgzqgjctvK8YBVk775ImI3h2zkV96CD7DuwRlxDnFIt5zSkrBzDzU3BGMrNN?=
 =?us-ascii?Q?OW4dYe6p7cbPW/aXv0nLfoYXYQNgL01flVpbS8ffmtp+hbhNCNGYBFc4nrzx?=
 =?us-ascii?Q?DkpMOzrXRh7hssRWmqGkDrqniroEgVqvn4GDqLZc+B7TSs/u5ws1qNzklhus?=
 =?us-ascii?Q?PJ0KWJw+wEhQ5jAIpVM2nMOZYhRB0ZapeDXTmr7aGdoL3WCUsr+m0QdBvUOK?=
 =?us-ascii?Q?fYzCLW1yX6M+1MTVVb3chZdFwm8n2srcdDYq2J+9jxsM4ChAAY2W12XiN1YT?=
 =?us-ascii?Q?A06E0bKS9dLUiI7IFAuD5cADOEFAlDSvjS6lgYfLUnYRSagNbiTOSyOVdoaZ?=
 =?us-ascii?Q?d/3MGq0JwxIcULmbs6rwBnTc9z4Ucoc8tsL9Dgy8SjJ0I4hcscqTtusIQA0W?=
 =?us-ascii?Q?Un98CVhiPy+YL86XzhQBGDHGZTAZ/9HXIvUf0OFiOYRplXyPhSLuc1694WK+?=
 =?us-ascii?Q?RlreuKZyVRy/QkDp8u9heq5iHSa+1s2z6F/JUS+yimDqVFy0RqaM5wRFwG1Q?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Rjaet3XoTucTCQQmBZj2byEsZ6UgH0Efco7aTuclaVANqiFz5atsRv7XPDS9dUJ0X8Xd7SJRLn/xbNneYp2evWvLufVMDJjzSBzoQjslwKHUmpTa0ARU3f5snWaer7c/XIQd1VELIcCr+nOydX8kH5x+xAYFINUWlVAVN3Sn6c6we6TqMnbOcmFQI8jTYTv7oHjubNYZIOs5MjQj6FplWvIRZKm5/4vpi5TjNbOyBIiaixoErjcCLhZr6e3hpamphS77TcfyNacZffjbgNX9TYzk310JjcGWc0atQ7YUhzbL1n0OLrGUgRw9dDlGV5lzt8Dq7Aa+DhbV7XR181wo4hNXA4ytQPUkImupeZrj7Rvqkahf9FuA552jQzK4owtnNVN5gqyn8CcpvnQPIRVtJEY7vj8bSYS6kT4Vs2oZc03AutuCNKYPCDkibqclki5basaxmB4lJ8YgmMGNll7NwozZNa+IdIFe1Z36f6zAo5z+GVI4kfcozGAP+uCLLC37yfEg4N4/un7xPLOPOMZh9z40RLZABm3F1RjfSc4/AlVRuGM3N6U1EqTEp99LcVhsbdJyu4ePb0wt46oE/xWwaQiYfHiMlM487u22YeKvzPI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8652ecfc-3449-4383-9c01-08dcf2c11a92
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 17:43:56.9959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PwtazA6rbcuhyK3gn/L4BwvHf+qekP3opuepEPXseV0FRlLGA9jQK5GsYMLVgF5cZVDtqYH7T1VCb2yGMiRRDoNdN6fxFsEiKjqOTVyWwgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7277
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-22_18,2024-10-22_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410220114
X-Proofpoint-ORIG-GUID: 1rILfHa63fs19LwCu4AKTz20fQDCeKSH
X-Proofpoint-GUID: 1rILfHa63fs19LwCu4AKTz20fQDCeKSH

On Fri, Oct 18, 2024 at 08:58:06PM +0100, Nick Alcock wrote:
> Before now, argument remapping was restricted to the args[] array, and was
> implemented in dt_cg_array_op in the same place where we decide whether
> to automatically copyin() userspace strings.

remapping -> mapping (everywhere in this patch, and similarly, remap -> map)

> But existing DTrace testcases suggest that remapping is also applied to argN
> for USDT, and it would definitely be more *convenient* if it were (so that
> argN and arg[N] always contain the same content, and only their types
> differ).  Add a new function dt_cg_tramp_remap_args(), which can be
> called from trampolines to apply remappings (destructively, but it keeps a
> copy of the old args in the save area so you can unapply them if you need
> to).  No existing providers do any remapping, so this is not yet called, but
> it's about to be.

I think that the preceding paragraph makes some wild assumptions that are not
really in line with what the anticipated behaviour is.  For one, there is only
a single existing DTrace testcase that involves argument mapping, and it is
uncertain whether that reflects a conscious design decision.  It is certainly
not consistent with the SDT implementation where argN reflects native values
and args[] is to be used for translated arguments.

The documentation states:

  args[]
  The typed arguments, if any, to the current probe. The args[] array is
  accessed using an integer index, but each element is defined to be the type
  corresponding to the given probe argument. For information about any typed
  arguments, use dtrace -l with the verbose option -v and check Argument Types.

  int64_t arg0, ..., arg9

  The first ten input arguments to a probe, represented as raw 64-bit integers.
  Values are meaningful only for arguments defined for the current probe.

Now, granted, this is a bit vague and does not entirely apply to SDT probes
because there we actually have types for probe arguments anyway.  But I think
a valid case can be made for argN to *always* be a raw 64-bit integer value
(which you could explicitly cast to the type it really is) and to *always* be
the raw arguments of the probe, i.e. what traditionally was passed as the
argument to the dtrace_probe() function.  That would correspond to the native
arguments for SDT and USDT.

Anyway, rather than making assumptions on what would be better or implying
that there is sufficient evidence for one versus the other implementation,
you should simply document that a test in the testsuite implies that the
expectation is that argNM and args[N] are the same for USDT probes, and that
you are adding a function to do apply this mapping, for use in trampoline code.

I also disagree that the function performs the saving of arguments itself.
I think that the caller ought to take care of that, because the caller has a
much better idea about when/if to save arguments, and when/if to restore them.

> The remapping info is still propagated up out of per-provider state so that
> the parser can use it to tell what types the remapped arguments are and
> to apply array-op remapping: users of dt_cg_tramp_remap_args() should set
> the probe remapping to 1:1 and shuffle the native types correspondingly,
> to match what dt_cg_tramp_remap_args() has done (in effect, calling it has
> moved the native types around).

I would drop this paragraph.  It is unnecessary and speculative at best about
what other code should or should not do.

However, I think it might be a good idea to have this function actually rewrite
the mapping data to become a pure i -> i mapping.  That seems appropriate
given that it applying the mapping and thereby should ensure that the mapping
will not be applied again by any other code.

> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>  libdtrace/dt_cg.c | 35 ++++++++++++++++++++++++++++++++++-
>  libdtrace/dt_cg.h |  1 +
>  2 files changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 39c27ab0ec0b..9709667d97fb 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -831,6 +831,34 @@ dt_cg_tramp_restore_args(dt_pcb_t *pcb)
>  	}
>  }
>  
> +/*
> + * Remap arguments according to the array of remappings given.  The original

Remap -> Map
remapping -> mapping

> + * arguments are overwritten (but saved).

Caller should save.

> + *
> + * The caller must ensure that %r7 contains the value set by the
> + * dt_cg_tramp_prologue*() functions.
> + */
> +void
> +dt_cg_tramp_remap_args(dt_pcb_t *pcb, uint8_t *remappings, size_t nremappings)

remap -> map
remappings -> mapping (or argmap)
nremappings -> mapc (or xargc)
> +{
> +	dt_irlist_t	*dlp = &pcb->pcb_ir;
> +	int		i;
> +
> +	/*
> +	 * Work from saved args so we don't need to worry about overwriting regs
> +	 * we're about to remap.
> +	 */
> +	dt_cg_tramp_save_args(pcb);

Caller should save.

> +
> +	for (i = 0; i < nremappings; i++) {
> +		if (remappings[i] != i) {
> +			dt_dprintf("Remap: loading from %i, storing to %i\n", remappings[i], i);

I would remove this debugging statement.  We don't really report debugging data
at this level anywhere else, really.

> +			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ORIG_ARG(remappings[i])));
> +			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));

I would add:
			argmap[i] = i;
to convert the mapping into a pure i -> i mapping, so no other code will apply
argument mapping again.

> +		}
> +	}
> +}
> +
>  typedef struct {
>  	dt_irlist_t	*dlp;
>  	dt_activity_t	act;
> @@ -5060,7 +5088,12 @@ dt_cg_array_op(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>  	 * array index according to the static argument mapping (if any),
>  	 * unless the argument reference is provided by a dynamic translator.
>  	 * If we're using a dynamic translator for args[], then just set dn_reg
> -	 * to an invalid reg and return: DIF_OP_XLARG will fetch the arg later.
> +	 *
> +	 * If dt_cg_tramp_remap_args is in use, you should apply the remapping
> +	 * at the probe_info stage, since the effective "native" arg positions
> +	 * will be changed.
> +	 *
> +	 * If this is a userland variable, note that we need to copy it in.

Not needed.  The original comment is sufficient.

>  	 */
>  	if (idp->di_id == DIF_VAR_ARGS) {
>  		if ((idp->di_kind == DT_IDENT_XLPTR ||
> diff --git a/libdtrace/dt_cg.h b/libdtrace/dt_cg.h
> index 0a7c7ba6a8c5..4c6d0f5dac6a 100644
> --- a/libdtrace/dt_cg.h
> +++ b/libdtrace/dt_cg.h
> @@ -34,6 +34,7 @@ extern void dt_cg_tramp_get_var(dt_pcb_t *pcb, const char *name, int isstore,
>  extern void dt_cg_tramp_del_var(dt_pcb_t *pcb, const char *name);
>  extern void dt_cg_tramp_save_args(dt_pcb_t *pcb);
>  extern void dt_cg_tramp_restore_args(dt_pcb_t *pcb);
> +extern void dt_cg_tramp_remap_args(dt_pcb_t *pcb, uint8_t *remappings, size_t nremappings);

dt_cg_tramp_map_args

>  extern void dt_cg_tramp_call_clauses(dt_pcb_t *pcb, const dt_probe_t *prp,
>  				     dt_activity_t act);
>  extern void dt_cg_tramp_return(dt_pcb_t *pcb);
> -- 
> 2.46.0.278.g36e3a12567
> 
