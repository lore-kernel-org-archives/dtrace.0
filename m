Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794000303;
	b=ZvLl3eZ31B6XjAsSh4axZAufM0uwU7Escly1e2pb3PZ/adg6LYQyLdSAzfjlIUO1H84G
	 QHhRMxwV1hTRFgEU7RBY13CqzkXFDicisuf5P6uYBcCD0GAjAOa+uI89/PpfCzX0+0twM
	 /GsTEWW7A8cGWmzC1wH43/3Cz1S6IWHUW0GIxXPkS4+4epK/Jt1uNR+bJV6c2sVSlMm/b
	 aQoSq8tUNsmKB+BLzKPNECLk7biiP+Cgst5zcQEq/reCh3gyv+/9O+8iuKyF0M9pyc6jr
	 73ZUXYU3CnXc30w+VjgrLrJaQ+RTWFOjQxjrVDd1o+BRYNLSD6QNEPIeLJGYDqr4KGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794000303;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc;
	bh=Xkepx+1g7oFgY/SIvQ1/xr2fLSJDqJsrH8GQm/LTpYg=;
	b=PQHyo9XwBzHBs4GEWz9xjRrsfVJcC7+I4acRret0hfF+uoPeWAbFNYFjehEGufC8nSHc
	 01hewyO8RYpYbKDOts2ZOyMIK+EB+bHHp8OoG8bYBfpNO6sR/QWIrUc0cJQfCocgcV5LM
	 7HtTcGDTrafMgzS50rXb9pucsTGBbhh6v2MX+TCrFOCtLvDDr9QTpBoCS37hZh+Nn1qjn
	 f2u2nzTQYf8+j9NF6HX/8L70aWvYtfObv9i/UsSAUg1dtYTonwgF6waw598eylrDuLb0r
	 JMG+f9RlYc7Q1Kianh14m1oGBtMK9Xr437sw1k3OLbLpDorjtVUzDLCgrnWT8IJgIKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=qLVUotgw;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=EQz0yilJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D46606A32C
	for <dtrace@lists.linux.dev>; Fri,  6 Nov 2026 21:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73D46606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=qLVUotgw;
	dkim=pass (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=EQz0yilJ
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6FT9g54118795;
	Fri, 6 Nov 2026 21:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Xkepx+1g7oFgY/SIvQ
	1/xr2fLSJDqJsrH8GQm/LTpYg=; b=qLVUotgwiUoH8K/FVhqKxXM1fDkv7IIp3k
	KxfYMrGHsZOmPX0WLHtBKZ1haUeKnPwjY1jG9DDf2XwQ+ssskqeCgVhYC9hZOdg1
	MUW+pEa1i0Zp1hjv9P1vs2iWDtk+JTFpwT8JIjHMI41rPM2vReG3ZaOdqD1E/MTG
	GXAZzxEY9XRXrLNl0PkXZkQApl3NIMwpEHhfqXyABexiQDmEBtLxww2a5G1RS0lq
	WyQ+BXFeW4P/IAXzeekf96QklJP/wYSKhYCCIZ1APHcaybmcokws7rHtKelWZvx4
	1YHeUjQ3p85FCV0zLCxyMPYzukN92cu8HaGB+HnVKIV9DJUe4uFQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hs3qp9fjf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 06 Nov 2026 21:24:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6LI2BW2872772;
	Fri, 6 Nov 2026 21:24:56 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012000.outbound.protection.outlook.com [52.101.43.0])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4hsmqfmsg4-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL);
	Fri, 06 Nov 2026 21:24:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qzmaDGgWMiHibbAFJpvkPk5q1uCkK9mD3DN6PKXfrQdnaR19Zv5UaQ/C7nXIIyMb0SJBc7pFBog6ms9uYw4lzFvvb2EY9cS1eprmS4WR76wyOG3s3Hq8KXo7mEhHyxhBA/Jvx94OqfP5uT3jbCpLY0zCqsPK78XJCkPhomIWmKcn29nhABvsRpkj6JoHNu99IDsKUbdrTvuZSNVVZPO7nO72mjdy/yAw9bouvDvGfYbShtmdYjoquiOo/2B8iua8LaCYZEl/KLvCK8hX+7Hqk59xyhVTjeoO8zhSMVLnBMg6rm62e7XXd21bBrtDe3KtHZ4B270ER/dgdBW6ZDDCcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xkepx+1g7oFgY/SIvQ1/xr2fLSJDqJsrH8GQm/LTpYg=;
 b=fNqKKyD4J8up/Nkpessh4jDat+ksqB84pGMZS1Bxx6XattnKngyxDmjTxfuQlNAmLAEAAEkHmZRNLdyLGiLMvonwF2TQ7jA5pEZo3xIvjfKgYExfh/tFRTDIqIR6LFn3k58t3NlSZM7hemUkV2XK2tZxIOWwnAZ9o8IAYVQh2D0bzJfWfYDM490W8pXe+FxJjEczF1x7N4uJ74dSL5+n13TjpIZ8DYjRhmEaFup6sH0X50lJTC5TgrPUCL2tXce3XuLevTRLTfJbXunZxYGnwNkT8J0XLXc7xnjyJ3TOboCgO/K+ibgFvGT+gct9HxR1GByj348kElWzO7SxCuqb4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xkepx+1g7oFgY/SIvQ1/xr2fLSJDqJsrH8GQm/LTpYg=;
 b=EQz0yilJqOmQTZ1N9D35Ydlx7aNRAwh6HendXAD9wMLLDxcvHiaKx117ovfzigE48kbsolfaAmxaO+sGtih+FVYhZUNoF+W5S+PsD1pa3r9z+9DhHCsMfD4m+z+hgz0LDSdiSAlH8+PacP7/J126FOjzVZ2Dm58WAWtB8OSofzw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS0PR10MB6993.namprd10.prod.outlook.com (2603:10b6:8:153::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Fri, 6 Nov
 2026 21:24:52 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 21:24:52 +0000
Date: Fri, 6 Nov 2026 16:24:49 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nix@esperi.org.uk>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 11/20] libdtrace: cache missing kernel CTF archives until
 paths change
Message-ID: <au5FobRpMWygAUHU@oracle.com>
References: <24b4b0f9f1f1b21146f37d5f08386734@oracle.com>
 <875wyat8qq.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875wyat8qq.fsf@esperi.org.uk>
X-ClientProxiedBy: BLAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:36e::7) To CO1PR10MB4769.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS0PR10MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a730b38-a90e-4873-4eb5-08df3c4c6538
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|22082099003|10067099003|261102123227099003|18002099003|261028144727099003|4143699003|261022105027099003|261026140227099003|261026121527099003|261021135927099003|261009223027099003|261022075727099003|261021121427099003|56012099006|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	cy4cUMSlDxul+37yFWAyETSTR1NMOpwPht2uLM//4sKU6vd4Wvfr7hyxlcbX00MeObguAIPCAg+VAkyYPeQTAfKDhQ4f2OCBW7Otn6tjeJFitCBDmTed4U/kMT3ObDHCF+ZiFFmVOqKNEvhb92Gb7lZfj0dMyyhNV8MBBR5gAn81Kz9RyelFR+QDctigXx0PvUSvkEv0QX7OpUvHQG9bTZS6tOVSMa05GwneVPxAEPLGx21H8ubjFep5Xhjvwuyo09SSshFgaAmmdfckl8JXyPnYgexlMUAh18Ph/PWMnQoEM/Ch28qxxE0syaRutm8jYYS3/J17MkrTCUtnwflnWOBcHXy9nrv1ymVvx8pqwefvWJ1evRtXNxg8Nn3VCr0E3UORRiAdOXGg2Yf/7hDCZGzJefVvuQivZNPFWjcKzYX55vkoTgId0pnpPtgJYVxpHzDkv8xWfw8mQrDr4LCXdXYfMXahbqQYvLvjPHlMEBg3NgzDN/nLAjTPLdzq0B8xccmzCltOhtyPUotoQSeh3AUZThOO9/Vh6KlGBF2mkuOTdTVFXnMdjn+hkzA102E7SqJXeP6rhcBdAnGJREl38F/YW6+vvfFHMKFywOJQ1SeuUX63iwvcmSaJMJUdcn0HNmytyXNdPxk/ds8hqYRbBTDP1vqRFJlarhOHpaDIjb0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(22082099003)(10067099003)(261102123227099003)(18002099003)(261028144727099003)(4143699003)(261022105027099003)(261026140227099003)(261026121527099003)(261021135927099003)(261009223027099003)(261022075727099003)(261021121427099003)(56012099006)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UmqUaxLRZVv9kDjwpJwQrEDjaHFVI67A5xJziJvEC4SQ3Zqg9OcDXaPfimIA?=
 =?us-ascii?Q?ppGQDkBRv8qPt8qURrwpTSTDiTke2yWZ6GMAvh3utlav2V3OcwN6yXDe0CHI?=
 =?us-ascii?Q?ZISo3sLAb66NhikjzRZhbskFPqoMEjLGsClXtEiHxy7LR+nZwJ8hVRbldDOe?=
 =?us-ascii?Q?qapUuZjfGuQYT9IgBNWuEcBGE4krrrBrpSr76MmlZ6YK9glACY/kkQsef87/?=
 =?us-ascii?Q?TrqlDPhChhNyugwu+kNZD4vcK5AkaQPvY3yiSxRmvLC2TkPeN643sfehmHv9?=
 =?us-ascii?Q?FRKRoWSdOdNHm6er1mPOpyrMNYrrtuIAmEcgF9H2u2VtF74S41im8muvFyVf?=
 =?us-ascii?Q?NgAH0B5GWm6BUz87Zg5sC5GS7uiWjAzXieKkGdw4DOK2iIayJ2F7TFd++TuK?=
 =?us-ascii?Q?7Juo65zxvtrwJEjq31BFZndIbcAP/xxsrCxJQyMAj2Du3/ejyAOZexyCosq0?=
 =?us-ascii?Q?yt3zY5fFG9BNs9qPlFvukiAlfNiJpjU5nf5gxpLK6XHC4tSV2BwMexbiEVVk?=
 =?us-ascii?Q?oumIvHrOxMejqvrtWb1MFBbfKsbcqGBwOHQZlSKAJa1Hu1SJc3CKopk/0s1Y?=
 =?us-ascii?Q?Hh3vnIpV8rozn5z38jJdWoJD/s0UJ3R2HVb7uxMjdxGTXFKy4IszkVyA40bV?=
 =?us-ascii?Q?RVjISFjCIiAvFfnn30o2CzXxho0e7zCRmSt2Troi2uT09Rx3quBp+0bhFHMM?=
 =?us-ascii?Q?rVvqZ5P/zS8kG0V8x/EgxhqCsmZdjd16fW6q63u5MtbONg+hBGtWphfdou1P?=
 =?us-ascii?Q?+nNOSRHg1JptSW8WJchutTdrFf52DED54j/LUxDbcV1Tv44Dm29BZTBKOram?=
 =?us-ascii?Q?1kcGlbtauOhDF9pQTtoygNvy6rGYLubfwiR5yejaZCDw6prIFqABmjA7sDAr?=
 =?us-ascii?Q?f3nN8No6WzmIvOI2S+TaPCdfj4gIjA+F3eka4OZQdVzG9b8Y0RfZxBqGsr1G?=
 =?us-ascii?Q?OpvPYrsx3HW7eE3T2QsR4ZBjMzEcbAjRZacI1KydURX53N9hkkV7uGy0PvoW?=
 =?us-ascii?Q?7FTo1CjTU06VotDvj47OGSdpikmJeeoBTg5B2QMVv/xt1ycu5BlksOx4ICfS?=
 =?us-ascii?Q?A5wc8vE6xZGnH7akj99qdDKGpUEMZR8gVxkZ8DEzhKTrX9KHsuDraioHnuJo?=
 =?us-ascii?Q?8WbVlPsHHuWaipFIG/SZq4SishgT26tPropC+rz2WUKkdRkq8XnoW7A5X1Hk?=
 =?us-ascii?Q?btmrjD9bUavsXGvflpmlRmizckJPfHuGQb+P2nlqjYE4nLK5Bd+lg9T6a280?=
 =?us-ascii?Q?HEVpPfR48Q1ckIhDO8CDc7uOUAVFTw/4Ck23xZr44gOpIt3PjS/eUf8g7xuc?=
 =?us-ascii?Q?24tcI0YSkdO/frgETaafOzybVPtLfrSvDtlpNiAB5tP9DJcrXKDBWirUoEQR?=
 =?us-ascii?Q?Di/QVNmo3/Z5G6I5l845GhJGi0X4L4Xog0vVMTakRjfxMZiCTKWaMKGP2rMc?=
 =?us-ascii?Q?pHWBKGqNak+yks4LO82ObzTJX6jDqy0agmMeYEUl2l9Z+sVjoTZSnjge2CRW?=
 =?us-ascii?Q?QOosSzEuFIqKhC608tSspEUAVp8xv64ASYcplljYgZeEXuzyGmHm2lOkcg54?=
 =?us-ascii?Q?IvmlzW6e3kDUd1FBpBFFH/bwhr9n6/xLYYpFBt1TDM16qXkacCrBHxDwgfnI?=
 =?us-ascii?Q?HJQzmRvpP+4ySsfp70ck27Hck/MsvSOTRTeSyWGs5YEa/SCvx8FcY0lP0bPm?=
 =?us-ascii?Q?n4GIHzIe6al7dHCJneEMCY9Avb0beAB5UdQdIjQ4TmE2Z3bBh81kcfjhveYB?=
 =?us-ascii?Q?ga1A408OLQ=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	2uadvisX6ZmHcQ5OYCHG2RjDfxgcNkGmX0ljOEWFEoOOHdDifURSJWjV195tFNYagz+M+/JNhmIOw2pAV8LqsuRx5YBynXu0eVLCXRo+Ur28nqvE9La/1IyNXoEmTrWFFf2NgiESIT2IHRy9lMWIHODuVIXCM8ZkKz69EpkZsihXUloVNsNduGfqKuScJEz6tPOTYHnJE16fguA2y6kYOWs25gmfcgztShluB3lbg89iLHxkucVyXchXnVQ6Zz0g6Q+qaV8F90EDBdUATdPRpVMTyD8ifStywh3dUBPkG19KsegCGioC6tQNk45gNbRJJoxgPDa2LjNX1cfnFM3fhw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uMieHfFKACv2RGhaBIykt0CIzn94AuhIsQv5Ro8Q+O3WG5WmLv45uzgt27AyhQtoK/4cf/+3q2drQgCN4SjrhbQg6hT/aqtYkNlrMqkQwr4rfQWZa7FO1uz0le7GnoPz1fV6TgUt6B4I8ivDmXTawbipAjBbCTd3pjOxO5pVgFqCFeRxoZA8EJWQ03e92qQ3YXi57aL69cmQLXi2vrOCEBICATV/U5tl2RvqtzhmJU2k4k5nxEURLZrhHXpSkVv0lPLCWx9+slgiQqFnuXvJYgqFKIs+QbzP+5shIJkcCZ63L1vSiPnRDm/gLmcyIT4RFEf50Xc1c3maDd8zFhRchqUX9bcfwkBml8HE9EuKQ6bUsp/KBSLy11WbL3PO/KCtA9ZYQa3vDJ6cAB9w4balpn1ANJfRqRG4V0B3CoZ73eaOJJeMBnDaAy6nRSvLXPv+juCaN7qvzRr+xjobBWrA4wrvnIVPJQaKUHeLn2xmyLah0JDch3+S/VbY4eUkU2Hb+AAvvMqklBi+0yfCIxcJlVcZhzDb9FLJg5ht1rxccxZsf5GiF0K1XmiKnxab7RjYBT4dl5v/0q7idKWh+jvmB/jgH7MZk8BGM9plQVoSC24=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a730b38-a90e-4873-4eb5-08df3c4c6538
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 21:24:52.5029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 56zGmfxhzO/hHeIz75dWYRsdZ14XXoik7ogXJwNiQzX3Cc/XayonP7LcEnzcca4nS6d63ygKC3hyVKSwzVpwO2vobPXkTXi4YbYY1EZWdR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6993
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 mlxscore=0 mlxlogscore=999 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2611040001 definitions=main-2611060085
X-Proofpoint-GUID: VIg-KJxn4mTxkCLZIisD6w1e3SDf2Dr1
X-Authority-Analysis: v=2.4 cv=GLqdgeNK c=1 sm=1 tr=0 ts=6aee45a8 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=EIcjfB9IiI4px24ztqRk:22 a=SgraraH804pNu0wxMBMA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: VIg-KJxn4mTxkCLZIisD6w1e3SDf2Dr1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA4NSBTYWx0ZWRfX2eJSKJnm26Ba
 Saj8z8PAJYW1A8KRY3xbHMWFxC0YZ5IJWcrXdieQExayPa9quBcfeI4XQeF0feurvWwh1BcpJr0
 lgNrSircqRBKvAQsIn7ThCg9PFnp1T4PJzfvYWbP/rHdoR3ecwRc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA4NSBTYWx0ZWRfX8iLM4zGwiDRZ
 nDsforUfEh/TGziOXFGULYTNc67rL4C7iotNV/0hovMIr9ze3BzxVYeKXUxUAYVgi/UHqhY0l4s
 8BLQEtEXd84e6IucNhp/1T4se5Yi42iLKrB1p9OvNt5yDfDPMZv5mf4u9/CXVtsIVoy1/FlsNPo
 gnNpYUOsWG2yhlsyj9ygznvsRDl15SEhSszrxKnQeUeLr8r0dTaDBF+fYXxadh/ilqBWtVXZXIm
 bqtOeOsX7CI7IhaI/ThvkU8X+wphSBy6BAXoDLEOsxUhjfYmZZbOSaVE0Jvn4TW91fJo7m3yPxT
 gvWH+4XC/xRQi1z0hbtwKSR5/7/u28STSvV7bD1gvUjmSqzCCltrjOOJ4VQS3OgPCWVNpoT16aF
 lzEyxvA3hPfrPPZwUgYodzCoekrLEdPZpG/KLZArgFhIXcy7OEEa81x13Mv7D1hV14mQ9dM5+As
 E6uW6SoUoI+z7aRAdiQ==

On Fri, Nov 06, 2026 at 01:00:45PM +0000, Nick Alcock wrote:
> On 30 Oct 2026, Kris Van Hees said:
> 
> > ---
> >  libdtrace/dt_impl.h        |  1 +
> >  libdtrace/dt_module.c      | 16 +++++++++++--
> >  libdtrace/dt_options.c     |  3 +++
> >  test/triggers/Build        |  1 +
> >  test/triggers/shared-ctf.c | 49 ++++++++++++++++++++++++++++++++++++++
> >  5 files changed, 68 insertions(+), 2 deletions(-)
> 
> ... why on earth would they ever be missing? Surely fixing that instead
> is a good idea? (Or is this something to do with chroots and containers
> and the CTFA being in a filesystem path whose meaning will change in the
> middle of execution or something?)

This was prompted by tests for the ctfpath option.
