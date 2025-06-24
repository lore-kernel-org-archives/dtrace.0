Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6CA2D5C90
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 14:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750774739; cv=fail; b=NnpD4yWCr6bppufiIG0eiTxFGQd12Dmm0u73DBml6doQiP8bY/xSZTzpvPKwBYlsrXTO6IXfZVQgEVXqm1XdHsH8ak7S3QBfWyStBI0cZpP03l31AOi7c6lyxBmbk7h2k2evDA7W1S1JUwmtJ9SM4AjoAp96G4Q1EAUxVXD3n/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750774739; c=relaxed/simple;
	bh=aTVLnykeq4tK73T1KgR5I9QlqnNXm0bBWNoXmLWwL5E=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=c/2tnH5df/lrh1I6C9kjV3fhhh9bK1pPecAAVc73uzdLwYjyV7Hw1RvSYEDcUwqDh8iSHpksbOwLCcPv2Suv5xQaUJHYJ1lQsLVICHGi+tQDxM/DIZ9jAdPB9RXKteW2txaUbrQWIjUw4eT4YOa0m4AAm+Qdm+v37OloHIDsnxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fFwB/Fgc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=czxMJii+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fFwB/Fgc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="czxMJii+"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OCiLN0012774
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 14:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=kOG8JA4w8Z0dYDEIqB
	oKbU4TIyk8++1khMlWCskNYak=; b=fFwB/FgcZwdWpfS3WSAvTl8QCsulJvoI2r
	z8kpHYzW+fbhW42vLTeaTqHNXDuPkZKMoO9Q0b91MP7Qw02AHLPaycgioZGmGCNh
	cZ+5gtG0tS6xgH2Fk8h8Gb15W3VhOFVpfbcUHgMfAztLzcBKErOCxOatJ2DtOq9l
	fWRDfNqFC/TNjh3JW5tcGhuhzFh1zQQpPW/CY2BkhAYh5AdQRmGm+7yVVlM3NJr8
	aiLYV/QC3J0oGVKid//8hwHXmxFswXUCru4eg8IGruX9FrhYs8+d2JzVmx4joxYh
	uVgmMJ0cFd8xH819BQYd90MVUoC5IqV0tX88BMPe03QyhGuEApzQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt7c4bh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 14:18:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55OECfaA024347
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 14:18:55 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2054.outbound.protection.outlook.com [40.107.212.54])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehkqq4sc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 14:18:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M9VdD40N+0TrUiSTfFo0+WrEdhwMWMNMbEIEgcHFFmA6A6nsquFWjZkz1CRCZlP0x004w8T6LZLQTCKRbxYOh3tpPYbUoOqZMP3k0hvXVLp1vmNDqmmg/RCawmH4NYcghbWOxreVT8NMzDSkCJ13rG8jlGAWYxizmK3LHBuP6RBgs08+Y5d1uvFtaRpgUrAqAeb71tBGN0VDlMQvLs2Yug//dm+JxWwiujvUsmKHD1w08qKxfGVzl/0vCrE794GH0XFRBCDty8iKfzi8S77ytms69NbJrRZuUQRm59JTczUQf1oxPUatGzmPnNTnBkSKqGrdieW6Py04iPTYwA+5zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOG8JA4w8Z0dYDEIqBoKbU4TIyk8++1khMlWCskNYak=;
 b=IPo3yGveTwU4J0YDvXj6PTxbTajylKJxKjkekALk5PTUOj1h5sLXSOqR9SpK9XfnLhZMn9fZC0ZsQAMvhdyrgaLiw/teJA+4uc1ua/4fPF0kgDO7PDgclKHLjd1B/ky2QtfkEyvYKG8Gr+k1wUZdBTBymCHeuUN/fOTmqa3JOAoXP3osgjIOfDGWtPF8v8Rm/5zDZH1HqkSkQsGcRkXZHDi6q5p/GVpEaP4y2svfkqw28s+hreTChOnan5UKlQKfTJc9c4e2SQimgmdh9jwXXUqhR8NqoKdJUH4hhL/WLmu4lukKSKP/54hOvB2CEOBVlfKriRUixORHGUHPENZVEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOG8JA4w8Z0dYDEIqBoKbU4TIyk8++1khMlWCskNYak=;
 b=czxMJii+cp2cJOrv9EqmfFuGjPFoFV6Udlybxqzi8kKmBbShgBMi0Uf1Qc4zyPGBija2QEbj/+Fo2B5gQ1kHEJOBNI+IcafdSszSKyVviC0AHMyRm6Fvsjb6IF9VgF+kSSBrXn1blwGwUc4xatXaegOZ9wXaNjmg3B7Jgz+Cb4c=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by CY8PR10MB6683.namprd10.prod.outlook.com (2603:10b6:930:92::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 14:18:50 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 14:18:50 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees via DTrace-devel <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>
Subject: Re: [DTrace-devel] [PATCH 3/3] dlibs: report missing CTF and BTF
 data for vmlinux
References: <SJ0PR10MB5672A28ED52DBF398B01EBF8C279A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Emacs: indefensible, reprehensible, and fully extensible.
Date: Tue, 24 Jun 2025 15:18:47 +0100
In-Reply-To: <SJ0PR10MB5672A28ED52DBF398B01EBF8C279A@SJ0PR10MB5672.namprd10.prod.outlook.com>
	(Kris Van Hees via DTrace-devel's message of "Mon, 23 Jun 2025
	19:37:21 -0400")
Message-ID: <87wm91p6ig.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0109.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::25) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|CY8PR10MB6683:EE_
X-MS-Office365-Filtering-Correlation-Id: a0525bd0-4076-4161-64e8-08ddb32a0a34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yySe06y4IGbTWM/HA5LO/nahYFS1HkU9LWQ6g3x5LKv2KrKYL33xJQUHWDYO?=
 =?us-ascii?Q?ypXhIFe58KwPqNm3SfLImDHfVHJLV+Hvqjd3RPrMSBSrp5wRWSNAlzwHPsxJ?=
 =?us-ascii?Q?DzaWyG6pOyObJgANHROmPU04siOudJQgJAVIFiLXmmOpkb6HPmfOpS4Z511T?=
 =?us-ascii?Q?YFG/OeIHlTRY+1ViaYuO1Ob0YO0e71SU1aZXCktZpBUF58YSUK5hylWGqIRU?=
 =?us-ascii?Q?RdM59aLvb1ofgGqi+/xaFlvf/Rj5acTR7rvwRBYZ7U8AtJdTS3Wir+aqli09?=
 =?us-ascii?Q?FNPvKUThfbvHHzLouK9GphsvQCpVWD5Z7mSbXZoz9zwfms59LSrrthEbm7Sh?=
 =?us-ascii?Q?x9iln9/TwVtw1qYgyL1FuljSD0I68yJosC5KyiI1f7/q/1Wl0mTKA5QJkKnl?=
 =?us-ascii?Q?T2npnsYK4h3c2CNGS3/WDrvzKN/xaymKAGbJ9hCqx5eIO3xP3SzZPJeJG5Fb?=
 =?us-ascii?Q?WdBamSAkll1PPSpWhm6wHjfWkG7a1ivmJvj2/I+mMjcAXWhx0PSml2QtIjHt?=
 =?us-ascii?Q?FSHcnYdcaJ6KjUaSaWVSDikQQyNSd2EYHzTEtnLMLuBPexMpaHt7wm80vD7u?=
 =?us-ascii?Q?9eQtejBhClix0shZbPFcPkSWl8DXEk7bQ/b1dpWUnKoAAw2fqpx0n+7U5y1J?=
 =?us-ascii?Q?vylV7P65S9Sj+nHuNFHbk4Xqp6sqURl0Hl5DcG36aDgNS8nuJjJBV07/2xoz?=
 =?us-ascii?Q?5CvguEQYpGMptHmGS45IIZs1jYu5EJKeFxE0ODxSlg+1S3UaB5oz8oHJx6JN?=
 =?us-ascii?Q?mXqguKAqBA+bAewMjcJweGIVgnojdqcEPEbLTF8QuXaMHxCeuCbgF0J5iGjn?=
 =?us-ascii?Q?BDbyW78fJg3dLlXtR9igZvvODT8u0ctimsTZ8RIiOJweuo8QPT8b8AA13693?=
 =?us-ascii?Q?4xMRV/LVOTpQdziJtN4o5IcDNXalkMNYWyRU/gF1SZmWEXVIycngfGknEV2c?=
 =?us-ascii?Q?PXsFe3uGPvv18DF0gh6XoSWRwz7P50enMuOzwzAerFXXj112rwe+msCMR5Xx?=
 =?us-ascii?Q?IHY8Z4h6of0cXYvnnUEaoFGlUU9yzbknrqDZf+g04xhFX81i8v4pMzwhBqOT?=
 =?us-ascii?Q?hL/00+FOLDlKW91s3MSwLf9M2/hBIfIkkyI1LipVliWJh3n/FFjs72+D4NvF?=
 =?us-ascii?Q?xkZf0tYbpzJ5cHnCZMWpVXJLgnIYQPZZLjLJBSzvtyeaoZynfJaKhITGDPfK?=
 =?us-ascii?Q?DlNB2NtMWqlIFmNzZV1vP0MYYtn7yFfiAPFEZ+kaaKBADVSh7zvKOSUbVcwn?=
 =?us-ascii?Q?/YXdcbRxss5XDgHTf9oreQHdofImwwxzfmQh9L2hIpUcSgdgl38PxVyC3j0y?=
 =?us-ascii?Q?hBsvgqDNXV6OrKUU8u111/D8Z2bxF+yEyHF0y9STM6h7uPm45FdeqJg/SSDp?=
 =?us-ascii?Q?EkvSFH18SygzkzySUOy/dwd3xSDKatfG8pHKsGU4fTL0VotFl30b1J4LeyK3?=
 =?us-ascii?Q?P9SmklBzNEs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xDUDVxQ+uLFy3srwzg4lnO9CtRAdGmSYnG1cR/VIRBJ7CarPeY6OmBxDsAX+?=
 =?us-ascii?Q?+YOz6xuLbYxUUlrHSBDr5PIxfbx+aN4jGAD0hETuq+GKP/D/D4RNO/dNkrvq?=
 =?us-ascii?Q?+8ApRpH3iO1nysuu5v8pY3A0UbrFyZ+kO33kjbC7DI0tkOGbcMav4sGlRaMe?=
 =?us-ascii?Q?rhz1QQbb6mKZGoUpRjFQEdXk+ezup55j+2i/KXjomBXyVCJKyoLo9faWwV2r?=
 =?us-ascii?Q?9SQAGwR+iyzVpsvTsf+qHishDNDiftO5WTgOjoEkadqQ8VMlo8cuXVEKSKeB?=
 =?us-ascii?Q?I2YCK0l7sXUO3dqzQWTAzxPEBOwPivf36atdJoe0Dl+6i7FTho/lFrszAvGs?=
 =?us-ascii?Q?2AzQSPN27LTyEC8SeF9/iDB2LZJjrJuTP++8K7W3L9uUYjoWAcBYBST2BXaP?=
 =?us-ascii?Q?yL6sRFVuoUzF4eZns6eR9DOISRNlUmdpnoNSE9a1oDF7FxHtbv40O4CB39rl?=
 =?us-ascii?Q?uZgwkIvVWYPZFyop26Q7ZvTvVEiE0A9tNEIZpAK58PyDEVXfYsjj2UqG4B+c?=
 =?us-ascii?Q?5MvNs5TQTE4RS5QZnw1ms074H9JnIgmAG7Dp1VWpO7U+8o6b3sTnyq4a8tFs?=
 =?us-ascii?Q?4K4GkOjwhPu5s9CWya+kFBt8+q6znIJ2EVuRNyiDizzRJ8bJ4W4hdHmTwC9G?=
 =?us-ascii?Q?gr60pa6XfqkrLoI3iGul82bb/wnSj/0hLw/edgT4W8HzaNO1U9XJIuD0osLr?=
 =?us-ascii?Q?l1nFz0b1ViJlBGjLinHam4LimhWvhTehagyqoBBsrCroUz4l0Oh0LfRETRy9?=
 =?us-ascii?Q?w8D7UuQouY/yOvlfONDQZTFQFARd1xtYkUvZ8zuYRqrkG+6HJ0hOE5rLpBtB?=
 =?us-ascii?Q?n3LLf06HOHO01Jruemp+kxePRh3np3Ru5twVaajAwr6pxc9BNna9o7ALjURj?=
 =?us-ascii?Q?l2oICwfHYxjLp+rEXEDx6LT0e6y4w4HE5AdwDagHk6qOfjKe9unj/MG47Q++?=
 =?us-ascii?Q?in0x+rteuQXjZxDcaHvz6XYPbB0Pcw2WQ7nE+Cou0oeOF0eJtp4oiqjPd9+Y?=
 =?us-ascii?Q?V6xL8pY+AAg6G6N3OYnFrJu0LuIERj+yTo8xGhNYHAUVbPoQW8k4wSHnKaj7?=
 =?us-ascii?Q?m5diPLSkENuXehOEDpfnDc3gRPR/ZYYRmk4P4KFXLk5TjLyclK8PpFcW6FD5?=
 =?us-ascii?Q?kV8XUo8k75igoFIeBoJu5qs9bkVIkDTKLEtaGtxzcYQ6SaJwGmwI9eoAH37j?=
 =?us-ascii?Q?bN17UX7+Z/W+2N5kO2ruiIXAvIBwSsp4K67Zl0mgBd5KkjLjWOqAF7dgR7pu?=
 =?us-ascii?Q?teqFhN+em4alQHI94o5Dkl6VnpvWWrxobbBwNXU1pB/Wk9i7FmaRDvIK1ouX?=
 =?us-ascii?Q?X1/0G60ddsN7OA5FHofAvz+YRML7obrOtHThtQsJjlwvHPL5g4VbLpu0v5Yg?=
 =?us-ascii?Q?zegNowhNUM5PPCkpCCqwENJVqaD1BSFUfZsS72i3E8Vfaobad1yG3vAK7FNt?=
 =?us-ascii?Q?+l2cpm6C5bjAXQNW4zmCUqCvbPixXreaDaEC9KHugWdB5UV04/8tZ6Balto5?=
 =?us-ascii?Q?imp3QxxUw2xiqBEOXnpbk1IhA3ielpyx9dYKaIp5PcsqjTQfVgANteO2Eu3e?=
 =?us-ascii?Q?p7G1x140cB5D9xcVIk/ZAR7BSlVgeQJBwuCDTkeHtg7mUJ9IQP0xIMDAjzzy?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dT1Ah7HZG8JfGgfA2NfRQ3p9uYlR8NkVyTw+q3Svo91Qzak0/MHNHSaIDca+EDm2iq4NYiXaAYfcKHa7PUpAUfiPHD+mluDWXYpK7solaIlxoxf0eq47zS9loNfJ+UfQVKCZ4F/t67OjapWZAePcBc+Rp53AbNFlBlL9LxEunHcdF3vaLFDVqYAi8YYpqLijk2wPgvL9mnzGBrODZiRYscBbH4mbtoi6FcfaKtqMDs7rvXN91h43J5rJ1KbeKxrG5Dhgbv7pYQDIujD9aT5YakLV2tJkCJdOYnwvqOUu2FYnAY/Vj05r+UdVOyLe5mAdNFXwK0Mtya5SlRHKfxRsrqh43f0tbeSyklstQ+EJoamw6RqtW3I6cumS/pPc50bB7NrxQCX/OG4/wK5GSUn1a/n8p8j3emQSpDXQGVQ6rcq1O5MYGppbnhPaB3doILwMOpG4uSIT3RbQdQ8dhxX11lUbmM/RvmGVTFISEjdFVQSZd6W7HYw3aJttq5Osa8qiDukjMFnI10dpx5HyHDj801u54Q9YMgOW6HgoD3PamhBv6fsHtKUIF7qneZh74qIWiYMfCZhTMOTjHWn7t7HUBqACmqy0TIKzL5q7GeUAbbE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0525bd0-4076-4161-64e8-08ddb32a0a34
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 14:18:50.0276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PiW2EFiCd3wb33Hmj6PPgPmIomrNtnZ8E3i58IcrCQYe+H+/DTNXk5bHUdoS/VjoW32rOXGFGFucxVVQba/Q3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6683
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_05,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506240120
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEyMCBTYWx0ZWRfXwl5DSGUdtkRh DvPUSeYxspoDn059sWhgiutoebDZVv0/tbVhX8HxvFrBr9d5GE31bm6TZYOhoOUV25+HEqJZP0t 8syDZCN8D/e60WOqwXlPQk3wbi1EuzpCYoALaucW/5MBYNbhCrnJgYhWBgFhoT9+Th3Bevi5uwu
 IoI2I1YrYDZuz2j9rqFsW3ceKi8CYpyMt64FahIU9jOpjWUdorJXT6jyZoV5OlQVwMA5DHIG7dJ X1sqmmfuSOzaJL0n1hG+Z9W8hUZVLo6e5SsMFIHOXQA5UwCinkaPbIYVME0/XTar/3e5hmFtLdj T9lLRqLDnmkuhEDKHQx0tQb3S+5F0iECxCspZPhvVxUK2gOvhsniUw8UCm+txS7zH5l3TjAG1AZ
 qLQdLmYbMm33d44duX8bFwUNHKoTPDVf7Pn7ySts4Vi5h71bmBcwJfuZIRQufFahHOG8fL2t
X-Proofpoint-GUID: 8B4a33toMjAAXox3B2P5-vzW092z8R8-
X-Authority-Analysis: v=2.4 cv=QNpoRhLL c=1 sm=1 tr=0 ts=685ab3cf b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=5gj4RqnO_xeZ1SRWqrwA:9 cc=ntf awl=host:13207
X-Proofpoint-ORIG-GUID: 8B4a33toMjAAXox3B2P5-vzW092z8R8-

On 24 Jun 2025, Kris Van Hees via DTrace-devel spake thusly:

> If the kernel is not compiled with CTF and/or BTF enabled, DTrace will
> not work.  This used to result in an assert, which is rather harsh and
> not user friendly.  We now report a nice error.
>
> Doing this in the pragma 'depends on' handling may seem odd but that is
> where the initial type data load is triggered.  If for some strange
> reason no dlibs exist (and thus no 'depends on' are encountered), the
> compiler will complain about missing type information anyway.

I'm honestly wondering if we should do a type lookup for something
trivial that will always be present in a hardwired fashion, so we don't
have to depend on a side effect this delicate (which will fail the first
time a .d is introduced which sorts lexicographically before any
existing one, depends on any types other than the built-in ones -- which
is why errno.d doesn't trigger a type lookup -- and does not start with

#pragma D depends_on module vmlinux

like io.d happens to.)

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

even if I think this feels wrong, it does work...
