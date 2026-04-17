Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B2D329C66
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 17:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776445533; cv=fail; b=dyFhlbAs+QFYSDG6wO13z4GDS2r8UUh5Zm6Al6JPMqR1GyFBdPX7frRCre+7fDdgJpgCTBIlgFZC/SEew8kMvJvzze7k2T2vNX0ukg11w2sly27oCWJQ6Rbuas0wS4LiJJ+z9vH/Tb7x648qHh/kQxnLF5lG6IY03LguCxkXUrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776445533; c=relaxed/simple;
	bh=jzt+Jz9StU9BuwtRzHZu+ui3NdIE4rQ3/I7a/6XUkzE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=MimEDE/G8pt6yLUg135rKNcNQdQk5FsilX8ZtIQbpD3Uu9edcYrXx/jQTlagyo51fhchHUWIXXeq69gYVpcRZ4cQ/yo6VKqahWayDNqQvuagryRSkrMS3jdlxwWRIZrJn+2nEVuASzBZ/7yM6Fdj8M9c7hnZYamwPSqvzYj3BvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gxy/sxGX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=irPwxY+i; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gxy/sxGX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="irPwxY+i"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HCJAXX3334002
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 17:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=/s1buDda90PeQ/ZKh2
	nNsnf06LYgLeHlrwCkjzjsw4Y=; b=gxy/sxGXOSufKw+D0DmP+j3KF2KXelQMbB
	X1f5kqRjRmkUrWX4mAbKeg6hhedt5IlRxHD+0edjfp3jdu8Fc30jK2xEio2wDZvs
	pNw518VPUBhsFaawCimumwOgCkheIu4RjUwnuGl4JSrG875YP/EsMCVpagpCENdr
	HDBWhsyluPCX/gtH7B1zDRc3gHQrFvYih57v/ZANbWqVOm/gRC0e0Dg7tFD3KZry
	MejTSTT9LGBmeGCej6xzVYjNUBjP6e8F7bTWHAnkc9D7JfeGRLORAuNDohMrUOHX
	1L7daGtp9y9zvIqLYhr3z05w+t0bY/QYUU70SX/GEgVcGPJChs8Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dh85qj6yp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 17:05:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 63HGxRWe039079
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 17:05:28 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010002.outbound.protection.outlook.com [40.93.198.2])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4dh7nr1swq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 17:05:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nlXrZxTZx7sIJgRDavM+6fuywKHfHC/iFys/SAEGBwBscuQ6EpXfzc4kV574f6j5FBWt4fVOAdgEgJeg/vzVcidPlv57jdO+pEsVvr0LRCoaCdGlbGB1xJYTWKxMhBhjyYsx23qEGyXU4YaFB/cm7Zexfk+RNQpAtysyIH9m6iGH8AvqD6PJEBQVZ+Jd+oCGvTiFe+U1USz4jRMlQfhHx3EgJWReqawsEWYSxuq/nNLgKLXra2ozZva+aGgZ9NEWC70Gd9aszMLFvGvdCxNLScTkLxtMxSaXBV97MJvVWmONmcR45Hx0BsAlFj9N6m73o9/YE5hymO/BL0qiIYeciA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/s1buDda90PeQ/ZKh2nNsnf06LYgLeHlrwCkjzjsw4Y=;
 b=MKoqb8PI3Lk2NJwlYxytwQW7/sMvMp/fckldBjGeKzAgIEEvjFfvhLxwh8CsjKn6xX+Aot1Xmi8jb2Oon1aweFlVlAq7Wn2G1z4FiFkX3KWXIcwqighiRo4GOqq7hurD3MNU0Fo4Gq5mmXIc/0BCzKK7gTYW81cgjdLYq9gOOOBjFFwSyKKIfvYWuqRhRqYROffoJtOHtQTV4HNiFjpU4cQ6rFwXOwADd5wbM2QMPxYua5HK968V2KhwJZ0GGhu7g91KTvLebjAH/OjMMHbTb11oYrY6nExZgiIgQKHaGiXk0WQ+7lX1I3cTCa950wWTx9r2Yb74Q73xqknzy3OnDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/s1buDda90PeQ/ZKh2nNsnf06LYgLeHlrwCkjzjsw4Y=;
 b=irPwxY+i2ErhOtTHFQ56OMFaQV82Si4n4TYXKbvQYKdJge4Md0+aKU/AGhDeeqnO3jrjcnN+IXdvsfhbusPLDeIO1Kssv+RsOmb41GtIlq7JJUh6GRb4c2hpxknTTgSUT01Df0/J6LoL1txSX7Z0FF3uXv4xZD5HaKX9h0krsQU=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by DS4PPFE2CFC098F.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Fri, 17 Apr
 2026 17:05:23 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6%7]) with mapi id 15.20.9769.046; Fri, 17 Apr 2026
 17:05:22 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/4] btf: use dt_btf_real_type_by_id() to resolve types
In-Reply-To: <IA0PR10MB732561FE075BF04C79C5CA54C2252@IA0PR10MB7325.namprd10.prod.outlook.com>
	(Kris Van Hees's message of "Tue, 14 Apr 2026 02:27:46 -0400")
References: <IA0PR10MB732561FE075BF04C79C5CA54C2252@IA0PR10MB7325.namprd10.prod.outlook.com>
Emacs: don't cry -- it won't help.
Date: Fri, 17 Apr 2026 18:05:19 +0100
Message-ID: <87ik9pzfe8.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0047.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34a::6) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|DS4PPFE2CFC098F:EE_
X-MS-Office365-Filtering-Correlation-Id: 23054c10-1ea4-48af-faf6-08de9ca3829b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SIRQV2erf5HWG8Tb0yF8wsMJ/DcN7C0lNepC9cRuRo8tmwkO3fP/TxmShPTm8P5EYR7dP+6GRAVjQ1hMLcF06qjxMnS3TAizdAw6ZZvQEp9avrUEv/7dIonNvmFAByn07ePIOk7yF5+6Rz3/x5fNu+pTGQxI+ZKl88wYlEvedDdPqEpbicWOhzqFlw0c3QXGAIGBkE7zW4BIDMv5QFSMuv2MrFm6V4lhR7WAR3zySYIargxXO/f71XpsqJecGX+H7FujPixXcNMUw+ovRNcNK02tz1U5NzItfAweZisNNuzejq71C8Joq1bi7Vj8UIzfTRSbA0ksK1EX3Nu5uL6utlBbqxhNS/7nbDa2pruAdqJucuWlj5TmOX92QKW7GZRPSto921NklpjK90Dy3qHpjhWXSOZbyjEEkIcgSEWDhXEHGTO5ToFA8Mr+KG5Pyn2hUv05qfuBc9jIFFg4z8lC8hJpry9Fcwr4QALa0hN+8cWWBWE3iWTlLQUJYP+aiBmHOVeRuA/gMQPRVkRmsl14RHzuYd6X/eh2Uq3NLcSv18aArfQLBHTwXNtlfKZMmuRR9xHUiFGF+HXxMoYDIFHzDpor73ccPE0/bVG4m2wMTP05179usVl2ieZpkdFeuNcvlOSZLLXCqC6+OZVrTSNLKw0lKzAewzEzYunivOWozfjd5GPgpB088Eo2ddJ7r526cevOKQIPfVWrPg8Xr2dRLBTfZf0AbJvS3iQ7EqYitL8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EIbYflqwlhZruZ9CVwXHYLvbkEKTYxpyBEbwr/iEjVu/42/zTiwoc0kpqD/v?=
 =?us-ascii?Q?CNu68gI/04rTgrop1jVIo+wirIeFpXkokRIcMHECkA8k+0aXSFNYr58kXKaC?=
 =?us-ascii?Q?0RM3CYLnPvLazy3P8dKHM7mdYt/i3uCPv4iilq8IWUZCgMivAmBjoP0dVqnc?=
 =?us-ascii?Q?fQarmqIvHPAM16v63eTKhtfy81mwpe/MFis3GmmhP0XosNQ/CcCZYKmFg+aR?=
 =?us-ascii?Q?iliu9T5h3Qqj1zYshMh0kMTcb3SWBWmfXHGje/vVwk4s7z/F0lyYOjS8J5Vw?=
 =?us-ascii?Q?K23Z/fKyFRt74p0CJnE5vwKwwT2GATqKLWLBTHLvV7W18bs+AEAr5U42hqLA?=
 =?us-ascii?Q?6wVDsnXWGmjBWGcaj+MNrfE9wSlWPRhc6yQ3+eLuLNlMy0ZBmlNxZ/ezvNwh?=
 =?us-ascii?Q?CIm0DosG1HLL/Z/kbPcVq6owme8JkmcBoeFHMgc+zIPNZIl7LI5F51VWAlI+?=
 =?us-ascii?Q?XqqTpdH5W85J3g7h+zLlXdtLgKGwYPB19T4BTh9p51X4oasgWBZNEQwvfvs9?=
 =?us-ascii?Q?dFuuFaRDnYsMpC6NU6dpUCakG+w75DZe0bjWBACVyNxD8UH/QFj7ZRwda9KB?=
 =?us-ascii?Q?I1xY4PK+KpHBo92nXSUa/Zen+JppK4JUfpS0xYtLI7utr9uOJgxiUvKc+PTU?=
 =?us-ascii?Q?E0NyYqotPZDs6eKptCd/34DXNqRQkeH3b6nCVkYfc5ngYmrjNDTfL8edzZcS?=
 =?us-ascii?Q?IpOwWFf+g53rC+EnsuyUSCoKanU/LZrMxUrJvCtA71ZrO257lSgTi/FkCTPv?=
 =?us-ascii?Q?hTxE1HKcEBBdvMAt7j6KFRKFgT4Hud7s2Ap+hwNbSv6rpKPAJQlYo/rmUbe8?=
 =?us-ascii?Q?XPTdIwK2vAwlyT7YhvdT/VGyzWuiCkueruNbOOdI3uFWJUkTOJ2GxzTeyDRm?=
 =?us-ascii?Q?Jbh+ndeJ7ciDDG8FDd0M6TJ46cAqFek5uRZAn6+PyxcCe7a+zgfzf1kYvni/?=
 =?us-ascii?Q?uLTT3h62pzoEPIqWJ/xVi8RDDhiPEiNTEGoMvZjCzu57MqaceJ3EXhm7YwH9?=
 =?us-ascii?Q?4uKQCKs2B4oPhbHFzdlpQ6EF9Q2UDomtOV4fjpFru0qfBmUFTNkrIOOls+vE?=
 =?us-ascii?Q?11eArvwVgIeV0Pf8vp3W2hwer02tGnBZVbtpgQECzZaWtkseXGLxMehJqdYb?=
 =?us-ascii?Q?WA0SjgeZKvPAAifs+uOpGMKLlmVXoWIFe4/p0/aiNio4FZG7BY5kitWDj7xX?=
 =?us-ascii?Q?Fw5ghFaHBC9mo9vTKR68NhJJky5do3cCtZB2BuT9o6XPSkaQkAuSlCHpfBcH?=
 =?us-ascii?Q?e4om+2dYBAF+QP0FYWUvnyw8Pq1XNzcxbLjcPzkXWNolZrqW4xWlsQS4Wr2/?=
 =?us-ascii?Q?n0P2OOopxlgVD+dW53EStts1NV0WFHqqhm/a+fBZAvJP63sm7rzbd+DgR1ab?=
 =?us-ascii?Q?bGU1tb4Muqk6x1hA9UgdLNCNigTxoABk6J0zLv9ksN88COiPQlo+qf1MXTHh?=
 =?us-ascii?Q?cCqPJRCnmxyPW9Qjsiy/Lp9Y+ZLFVxFv76Uuyd830N1VzHcu2wQ2tycNwBuw?=
 =?us-ascii?Q?1oiCZAPcoShw3kNOmKaVGzu4z5kALBVYq3Sjd/2OhpPa0v3YNtQvY5yOcxC2?=
 =?us-ascii?Q?D6HvGSs9S32KrBtdjKU7UBVtiT9jDlg713lQNa+26TfI8ElHQ5/HOB7gue2Q?=
 =?us-ascii?Q?/TEO5RFsVrRII82dcip38fvEAmhLHmWlFjx3ZeGkc2qtlTHZnkP8gJVagxBB?=
 =?us-ascii?Q?nf91+9Zo4AlSk3FhRlb6CSf0N+u3+0ormfvbPNGJ0D562VHluKFDaWdCbN18?=
 =?us-ascii?Q?GRwPJl3mDQ=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	a+F5fj+XJOV/ZXKfNf2oNiUinZk05bp+QNF1S6U53K0SrObwplbJSm3j3Oo3z5sRvKIi+FUs6CzVwI7g/wFktMvtXsvfr08Dj1vQBmcqJEpWlxLgKhdLwhh3O+R9GoAGb1MeBvJYwRGOv4ISn6gD9J92evjHxnCzzCDg8Jx7+rIkdX+6HqYD2mtxy/NdTFHvTqfHZzie1vVX5p8jAg8RJBqqFy5qpY6aWdQYMwes/63CEWdvKkVZvIzMzLKnUASAvSSRmb1UFcdLmI2mHRrKtOC1QG7Rimf0LioBV/HF6b9SPSl3Y5dn7muArHv0EOkGVwGyvYGGgLrqQwN/E81Itg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aiAzx+G7jouS303b2NRycEC8tgOMeH6rHQ772Y27Uezymk2TcgWjLK0golJO/H2vrnYBbT22wleBt4ZuiGvQaIrQJeWUweVJgBVyMnXXsUeqHB/TsbuLgUGW0YpC8zFVKKenKeM0JlGZCqaUWF9EN7dQpGusG51l/PFkggxs/1Gg5T0pXGL83LGq8BsR2GwsyS25J9NLpeS0JzhrghtA9sotw9qDkDk8R8zgPv3BEER2Lu33HNhB8Hk5T4AgeozRCJ6jm27HDWoQg+L+1znZ7SCb4FRw70v0spy+4xh7urdf+Zq3t4SwCpLU9s8WzVuX6IHsMXlfnHFlVbskvlditD1WJwFYkE/gKosH7BHJgyt3DRkUTMHQySIQTpowLdcWF7mZR5PMteya8zGg0tXwwRQn8NFbrPJj9UV3Od0b+3EzIdG+zhkvCaIlw84Y1JDfVYeaU1CXf71L14CbpNfGIKvyWuatMzrlQEzve4xAApcHAp4o0faBLQznV9ZKnbOlTbj5gOvInYJnzxMUq3dJOn7LfuWrX5FC0jx065re6q6wR+tHDMUnzOPZQM7Tb/Q7WmyTjP554tNoJshBFBMC/TK1Cgg5XbLvC+Cz2ehZEd0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23054c10-1ea4-48af-faf6-08de9ca3829b
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 17:05:22.0050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NxJWT7BaVGaFcO7UpPsKOO8LM6mtFIHr3zhdm0Sn4+MLHoeNM3p97Uk2ps3uLg0DaUwAw7uZ4zkZIaxQNJAeHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFE2CFC098F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=827 mlxscore=0 phishscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2604070000 definitions=main-2604170171
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE3MSBTYWx0ZWRfXxSy5ihskE2AS
 a3TGHtDwSElImoOzT5RR/KZiZTZ1I9a2HHNU1M34mAgK2gbWMidfebfzu14ozgwA4+pZidG8pgY
 87XNdEeQiqUiie/ugURNFVr1nG5oxHFYbC2ARLyS7etifYLt2yQnJ9VoNlDHClKxh9PXdc3kQT9
 eqp6061lhBXR4myXS3U9SUnvoS9TqV72IiNvjzzDFn254/JVkXMAJkMLijAeg7Sz1WSVVGOymGR
 WBfGABtsawqMkT+rg+YxkaJxiyTKI0SziFOFyq+gv4N3NgZ2va9ttt45Y3wDaXK2De+cI6MBPrc
 A4dv7MlsPJSRbvfmS88EmupfdOrePxkdTi4rDcFbWR8rDgwWRSfFHBhVWwlfbMxy0G4ciJGl5sy
 YpY2XwPWjnxhcMVE3EsgWPI2kuXC6cUVdTZD2JIQzf71tmQnJYTeCCsPRPS90BQruTvY5w4z6VP
 xWxaQCLgX6lNRy7GK7qEn7iXgGHHICjGWIk4v3Vw=
X-Proofpoint-GUID: r-C5gfUZ2S-lJ8XS3cMkQxdvi1soGoLn
X-Authority-Analysis: v=2.4 cv=V49NF+ni c=1 sm=1 tr=0 ts=69e26859 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=RD47p0oAkeU5bO7t-o6f:22 a=05qjapnJ2mq34fsy7ZYA:9 cc=ntf awl=host:12292
X-Proofpoint-ORIG-GUID: r-C5gfUZ2S-lJ8XS3cMkQxdvi1soGoLn

On 14 Apr 2026, Kris Van Hees said:

> Functions that need to check type data operate on the real type rather
> than a typedef or a type with modifiers.  Similarly, when a type of a
> function is needed, the prototype (BTF type BTF_KIND_PROTO) is what is
> really needed.
>
> Introducing dt_btf_real_type_by_id() removed duplication of code in other
> functions.

Perhaps dt_btf_resolve_type(), for consistency with the libctf function
naming?

Other than that...

> ---
>  libdtrace/dt_btf.c | 43 +++++++++++++++++++++++++++++--------------
>  1 file changed, 29 insertions(+), 14 deletions(-)
>
> diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
> index d08599192..56eb96a4e 100644
> --- a/libdtrace/dt_btf.c
> +++ b/libdtrace/dt_btf.c
> @@ -848,6 +848,26 @@ dt_btf_type_by_id(dtrace_hdl_t *dtp, const dt_btf_t *btf, int32_t id)
>  	return btf->types[id - (dtp->dt_shared_btf->type_cnt - 1)];
>  }
>  
> +static btf_type_t *
> +dt_btf_real_type_by_id(dtrace_hdl_t *dtp, const dt_btf_t *btf, int32_t id)
> +{
> +	btf_type_t	*type = dt_btf_type_by_id(dtp, btf, id);
> +
> +	do {
> +		switch (BTF_INFO_KIND(type->info)) {
> +		case BTF_KIND_CONST:
> +		case BTF_KIND_FUNC:
> +		case BTF_KIND_TYPEDEF:
> +		case BTF_KIND_VOLATILE:

Probably this should traverse BTF_KIND_RESTRICT as well. (The kernel
*does* use restrict qualifiers in some places. I was surprised too.)

-- 
NULL && (void)
