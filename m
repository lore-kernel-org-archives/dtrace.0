Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E7722B64B
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 02:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729823461; cv=fail; b=VIsCl/Ul9lnXglSBM31PgCgmHbKWb5xHQMjyBqx3YYqZgOGnPvQ6zG6ha7gbRq1iwcY5mjgnjhuzdqsWmUQYgkpGRI9N+DapIDHo4aGANRF+4wDyxGWm6muZBSp7sYNssnmZPbArpy+e/ajLDsUfX460p8xq1IZVqh65BTu0f2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729823461; c=relaxed/simple;
	bh=aemBTuCXTn08KeTxeyHTrUmV1IelgbbAG37s23leZIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Z+nDGIUi1dtfvcgUKa6kGIL8zUPm8YBWFHvHOJGojZsN+YPV7zEXUKBNxfgP0Rx/pvEsesceXuk2XoyLMXu5kvk0S+jW1OIG72XwrxTM8H1mOGm/JnZI9oMM5RqYZMgjkVR9j8X0CW7lh2WE/iQjtcablPp2jgJ8bLGNWYFiFrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CUxfI6OT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vdm1XlEc; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CUxfI6OT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vdm1XlEc"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OLMdvC017662;
	Fri, 25 Oct 2024 02:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=mYQCpPuST4qn2WyUt0
	Iki6qxQOkhP7vmtVy1HGcxJ1I=; b=CUxfI6OTTTm0thXE1nbUdRjPuRX1LjzIxz
	tFQaGJ0VZWb6yh/hnYfxLDK63ZfYYuTHqM2WUZsOtHbTkvcgUUPieIfF6BeLdBxz
	X3HVTuYXye+MQc2ayMkVK6vKukLuuNeXLX1CKrE6Em2khxEsks5dJOVUuZUW1VUX
	kmoqH6Li2fRniia1PiJEhde+uE5a+pbILD3eus/fR/GDSE/R5sURu52zPke99aSE
	MJPOrujTZ4z74Hr9rQaltJgejtF9IwakRm1uKVwK9EZex+pe+jGiLYz46HNsvh9F
	r2N0rpJSWustkq481DvJn7Bp1qnQ8rJ39KhAQ+n4JriMjeIvrUIQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42cqv3k49k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 02:30:48 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49P1hwg0036040;
	Fri, 25 Oct 2024 02:30:47 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emh4s1qw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 02:30:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lm3Kogg9WDVv74oF9oLIDvG4VsQWwbI3akr8Uq7lV+b/LTEXwiazw0BiNaFeEY5TyqEGEHH+LSEfwQUDtgjz2cd9W2Xcj+kdnF4bP/+uZrGsVPRqwTXkBz1nsgVok3mWUqeh2r0Wy0L2Ox5NNyE6ETyDxOuiMFBuhCQYDnsN4gUgn5ETn2Kqwe8j5O6IqXEUwknAyDUGgMvCV1xgbYFYeFWasda6DVEGutUWNrTfjFjArbf3alGQSpSzGowSaJQY2Whv0CDfi89nh8WeUGnE8bNvso3SeQvF8/OR7C9slUMk/H7o/kO4uz/X/naw0wY1DbjbKQcMRNX7hX7hd3reTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mYQCpPuST4qn2WyUt0Iki6qxQOkhP7vmtVy1HGcxJ1I=;
 b=ADn/j3rNbXPRVxmLmAVrDx+uZYhBv1RJ2vtx74asYlT/xJ2BPy5HH0+hdAXAqwXFuSIRJpYfxc6DKyqhjPrsMd3C4RMc7Vc9BHKRd72rgAHtm0VoqFgHIuANPjWbRBRpBOCTLuqYgKMu5EmDwcVy6FCaE9aKVPysKaUB6+djHnhhCTgDz1gsKhO70upiGSs881nCHYnqUhyt0hSIIPDic/l0KzfRS7HQRhoLaR9ochER5tlV4JgHOv7mgJB65J/vkgUzRVhP+s6I1q23vZhxuCWihZIB9pwYMK9Z7ib8psFkH2ADWFyaHjx0Rc4Ph7PvjRpq+opNi/lcaa63VPzLbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYQCpPuST4qn2WyUt0Iki6qxQOkhP7vmtVy1HGcxJ1I=;
 b=vdm1XlEcDPpXk+lN7YK5JStxJzw2IZlIhFlXVcYpN4lBJVHAVsWwJjtSKei+xK95qADDyoIphlmTeCs+dQWs2jtEph89iLUMiu9TqXgCeW2nDApiGsBRRYr0i8hikkpGP4UJ8s2bbhVEkjRwYYozAvKWNqwPHhuMs+PLky/+tPY=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SJ0PR10MB5552.namprd10.prod.outlook.com (2603:10b6:a03:3da::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Fri, 25 Oct
 2024 02:30:43 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 02:30:43 +0000
Date: Thu, 24 Oct 2024 22:30:39 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com, sam@gentoo.org
Subject: Re: [PATCH 03/14] configure, build: make valgrind optional
Message-ID: <ZxsCzzF7JV2iYCJE@kvh-deb-bpf.us.oracle.com>
References: <20241024113758.182050-1-nick.alcock@oracle.com>
 <20241024113758.182050-4-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024113758.182050-4-nick.alcock@oracle.com>
X-ClientProxiedBy: BL1P223CA0021.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::26) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SJ0PR10MB5552:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a3cda1f-cc96-4ccc-72ee-08dcf49d0647
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lvIMbUTR2WKsEexCp3E+DxN29wFQFMdc0RTy8zcym/Vmmw3A44uJE8MxjiyZ?=
 =?us-ascii?Q?Eglg3akfc9S58IjeIu0yuv/Wx5eKZmXIyy1bs2V2UCpEJo6XzgVBlx3frLzz?=
 =?us-ascii?Q?4nRh4oWUQypTiApqUe9vs9m5Fdlqxd79ZOKkLtKCCUZCS16bof0eKN/fw54r?=
 =?us-ascii?Q?RuvpV7TMM/rDHNsbE8Di38JNqhnObNzaN7rp+xW5hW0VvOV4R3Mq71Crh2uz?=
 =?us-ascii?Q?/pIcq5Ip8LmHbAuQRfPAmW7ZnRiqNT7m6A9BmKBtg78nt/gZyOnZzBl5qwKt?=
 =?us-ascii?Q?tHtzxIJmC8qMcAfKbpYlv98y0YiJ//H+5LISIaADom9mMAakygWwDurHjk0V?=
 =?us-ascii?Q?IlmZG51yv2rl/zsWY0muqa4rH+prHDoyeAUqtj5hhp2cHbX2yc4SOvKmRDV5?=
 =?us-ascii?Q?Iniz3e25BFaXJP6WuIN2w8wxCBnke8EnWqJ1PUOvFRtFeYOd4TOxdJUsq8Bg?=
 =?us-ascii?Q?8WYpItG8+Sjl7EYBBSmQgD3dW2mAa/aL/tvj5yPAHLcFL8ZIqr90f9fpAsAA?=
 =?us-ascii?Q?k0hkH1HH7jATqx91r14RNsNfWAhrai7W3NR4reMR8d+Go2R032uBQM7vSYPn?=
 =?us-ascii?Q?o57chLwtUpdVihsg38sXdpPXr40OKYoK/HeCzffgOUTDREFbH6KBnp59LRcv?=
 =?us-ascii?Q?Cp5RG1gRx9MthUAPWjs2DZFYSR9PB84QLZH0KOJQQYv5WSUkydORaZtVdaVp?=
 =?us-ascii?Q?PXx8BuIquHJjfkP3/+SohjTVRsBUFpmq6U8/psvl6zydtzBeFCRku0ci+x/l?=
 =?us-ascii?Q?pCJlvmWVnumc7l0DuN23oVzEu3c8LsfhrPORwGq8gi/nRtwtrERietCUTUST?=
 =?us-ascii?Q?AyJxnl/rChylDvceW9POpuIJ5cXGeU1NfVslz3vZdkA13+ey4iCCvv1Qe5WI?=
 =?us-ascii?Q?zmhsLzz/2MAdzRR3dp6/fDObdWvLQ9WbV/yK2AXc9nSXDXRrzZO+ke8yQulC?=
 =?us-ascii?Q?vs2zT+cjRGeO7Rh+VZfehWhOH/9YC0uU2Fyaz9syekKLyzRZ/k4JBjSxCVpz?=
 =?us-ascii?Q?zGxsPomXed9XXc3IZO50PGiXS8wHOi6Kp7iCbhc37uLA+ZTdMUMc65OCppxe?=
 =?us-ascii?Q?QDEY54IejgRXjDxLUcUmzAsyLIj+JtokSzvnGzD92w6DYNAwLljzcC9dpenJ?=
 =?us-ascii?Q?Yoy1p6yRN4TtnSpyIk1rObVaxl34+Q/gpXoGCG4cgPZLk30zt495bSrphrqg?=
 =?us-ascii?Q?HgPKjXW70L61caH1A6rPt38XNHmiP6KqfIVvBkT99Q0uD595OetKD3PEdwo2?=
 =?us-ascii?Q?A4kK4uYOHfTE9htLc1qJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dwD70kZ5bBU2s9v66uLe6wIb2vfnddJwAIUCqSsbhYBCgYsg2yWIDrKcFTLp?=
 =?us-ascii?Q?beSm7bUGKD+mwZ7QqG+4kJsbCyTLrHJG/0jBHCLFKxzO21lu8hJmaSeReqt1?=
 =?us-ascii?Q?dd2AJNt2lfSsOgnwL7a0L6/DkxvozH5kUO1Okja6bS3cgoHoL6jL0ax9w9mj?=
 =?us-ascii?Q?eDpAHaxJaOnrv32WUYAXPijXaBlvE61S9kEFUibs/5GKj6Uzcij1Is1+u3NO?=
 =?us-ascii?Q?4y8amig0k9as9GCnq/2IuaSXXFMnnX6OWXABKQQqdpegueWc3Tvb9YhXM44s?=
 =?us-ascii?Q?VqmkquxmTEc9+SCkkjUlpG8OpwTs17yDD8e4twE/ILy4r0xFBiKHZdYf7BGi?=
 =?us-ascii?Q?Y2lonXiv+bW+l89zyTQo3Ugxd7mfxKZMYs9tc/pkpdbQnX62/YE9+THgaGsB?=
 =?us-ascii?Q?zKyQACw6DP5sgdJ47hr2e28JBXOIQtyCi68FsmyG7Qeq2GZULnF0qeJEDHoc?=
 =?us-ascii?Q?HDGG8+j04XZ7mOEBasj/bA59lEBaWLQBf4b8ez5l857EXr6wOTXe7djD516J?=
 =?us-ascii?Q?AfCuUpR1XE+T7uxcsWYLN8vtV8bKUDUGwU246Rekqb+xjRlXeiuXzIkxchEK?=
 =?us-ascii?Q?UILm2oYR8lCvGJpfsKgrFnVlLKLP41x2cbcjEFG4/PIhCftezR6jVLz2Hn7V?=
 =?us-ascii?Q?zl4n4Aa02uUmci0GhFG6BxEu52tWWSxctLWyouIGvcDS7cytIxGj/w2RedBk?=
 =?us-ascii?Q?0OW5nQ5/lBk/5xs07qj2/MYW3AFVJ1H6bksOpK6caNNvYNBfbsfVKOMiDuqO?=
 =?us-ascii?Q?4HweN0Y9+borE26V65UFBM/WtFYr1r3i0YZeR+sqOdboOgRJFC8EWJQ6s4xe?=
 =?us-ascii?Q?tY2OxjjZr7G0DK8EIC58c4vlQG9jMYG+/zhXn5ksnlW6spKs18dBQaqgpFjU?=
 =?us-ascii?Q?bWl6mPVaauZK57G+rAZoQyuICcVvPPM0b3/OOvyrBSi1p6EESB+DxirUU1Jw?=
 =?us-ascii?Q?jLvVL5+1pgib/zRypkS7v6MvwFh/DJzB5JeGsyJCiSGBrLar32sg3b2tzh7/?=
 =?us-ascii?Q?t2E4BduUm5PnfI5EaRI7WNhNWXxhcnRlCqgcG8nEBcWHV1BdAiuaD8/Io7iE?=
 =?us-ascii?Q?J24fo0qK+Q9ldHkRgdj18oEkjNqwpHe0pPEPa2facMRmlPJU5Zic2D3gTcmM?=
 =?us-ascii?Q?xESg/AgNqX2V/mHrLeOcB9raYzCAXse2iLfWpbi7wxRuriyWScZiP5P5631b?=
 =?us-ascii?Q?ojhoVH7L94xPKAkxa0S0afF7BCacfEJzh1mS3HIVflj8AIPO5+wjPBkEGp17?=
 =?us-ascii?Q?0JFGNe/GC016gig3urtcjXmvtfGHwvqmDx0P8gkSpO1fXrzVe3qbJEe/yqIX?=
 =?us-ascii?Q?OUCaMx1VKx5ZjEuCiNTJLPIaZmFVjv0PxI2a2k/8epHJyDApOL3wIwq1lY7r?=
 =?us-ascii?Q?HIZQ+4Gdww1ROEuiUTEpEuGYt6Gx/NYosdMkS0DNLYFj0BS6GWDUMA0+lI6f?=
 =?us-ascii?Q?8T4tENShQFJIfx4CPARmm6dzC9UaIGVPHoqOB9bGrTLp+E9TopHlEFq8RZ3v?=
 =?us-ascii?Q?52f4SdAvTuuRzUlekPmy/ZIFmOs2p2W1n74Y+yV9R1g2Ejj5Q63/oUCPqMRk?=
 =?us-ascii?Q?GxNGwDKZSnRnN6wpbbTVdCzQh/eo1qCZPpr0WvO0b1PRNaH2Wp8mB0NaXBaN?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xgh7PaXPaqbwt+kQhh5+/3TH3QD/tlMf/5P6atF9GwYhCm9Ae9G5tMuU5Y2EPQcOqTZv1Kk59dDIhk0Q2xkb+MT8EUU4RPJgoxssXaHgkoQ2QcOcF4b8sBAZVdDC5TTfTNu9sCyU/r1VmG54cS/5nDid0nrvwAiAWYz19HldrQ3QqMpaT0iSPTITtUvz6Gau9nEX6Lo612iZbO8Ag4+32DbcFzW49U1pYj9vYzcsEFRAD3axTdbd7HKBB+nLgB+LXIxvEp6kohg/fWRaxjsukfzFdlUGgpXqaCyCF2NIFKyf/B7ElPl6SWR7ipHeKYtO6w00WyiSLydJ7LFMNghNPyy/fLSCUWFJh4NaKnzjtR0BgmhJ+VSIqkO2quOs1xA7Js7faTdGF84A+lEvLWFW8dxyi9nRiHiTWd9SCOvE0+k1oauNGEveUARg7rhMFgfwORafWDQSFmhCO9Of/Ed1Dq5EM2Zsm1CgAX8u+KS+ZnkssNXc8DgAY8HKLjSveaw9aDCBSlcJDed0CrOugD9277RchPJ55zSE6dEnt4tx4GpZVH/CgWaoavLlqkNJfNcjkekj5x+dq0HIYwJrvyIGT2Qarx4KNzeXSbT0SDjORIo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a3cda1f-cc96-4ccc-72ee-08dcf49d0647
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 02:30:43.3015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sT5BJ/BGkTiYiMC1ZXGCn4lIpTVR3jMKxvNYyAhVj74Xu4a4Bg5wH1EkQ1HcCm0R5xPyeuKRzzfDp56ZCiaW+BcojWCNKtL9EnFILrYR1d8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5552
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_02,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410250017
X-Proofpoint-ORIG-GUID: QeL7RjtNq6o0OVSyNIHy9Lm5d2fnRR08
X-Proofpoint-GUID: QeL7RjtNq6o0OVSyNIHy9Lm5d2fnRR08

On Thu, Oct 24, 2024 at 12:37:47PM +0100, Nick Alcock wrote:
> We fail building if <valgrind/valgrind.h> is not available, which is
> ridiculous given that the only reason we need it is to make valgrind go away
> at suitable moments to let us drop uprobes.
> 
> A suitable new configure check (using a new check-header-macro-rule
> function) lets us check for <valgrind/valgrind.h> and disable it if not
> present: as usual, defining HAVE_VALGRIND or passing it to configure will
> also suffice to override the check (though since the code this enables
> doesn't require any part of valgrind at runtime, I don't see why one would
> ever need to do so).

I would remove the final ( ... ) since it is speculative about people's intent.

> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> Bug: https://github.com/oracle/dtrace-utils/issues/80

Put Bug: before Signed-off-by:
Indentation issue (see below).

With that fixed...
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  Makeconfig          | 36 ++++++++++++++++++++++++++++++++++++
>  configure           |  1 +
>  libdtrace/dt_work.c | 18 +++++++++++++++---
>  3 files changed, 52 insertions(+), 3 deletions(-)
> 
> diff --git a/Makeconfig b/Makeconfig
> index 346078598624..752bd79b01fc 100644
> --- a/Makeconfig
> +++ b/Makeconfig
> @@ -163,6 +163,41 @@ $(CONFIG_H): $(objdir)/.config/config.$(1).h
>  $(CONFIG_MK): $(objdir)/.config/config.$(1).mk
>  endef
>  
> +# Generate a makefile rule to check for the presence of MACRO
> +# in HEADER and emit an appropriate header file fragment into a file
> +# under $(objdir)/.config.
> +#
> +# The first argument must be suitable for a filename fragment,
> +# for a makefile rule name and for a #define.
> +#
> +# Syntax: $(call check-header-macro-rule,name,macro,header)
> +define check-header-macro-rule
> +$(objdir)/.config/config.$(1).h $(objdir)/.config/config.$(1).mk: $(objdir)/.config/.dir.stamp
> +	case x$(HAVE_$(1)) in \
> +	xyes) echo '#define HAVE_$(1) 1' > $(objdir)/.config/config.$(1).h; \
> +	     echo 'HAVE_$(1)=y' > $(objdir)/.config/config.$(1).mk;; \
> +	xno) echo '/* #undef HAVE_$(1) */' > $(objdir)/.config/config.$(1).h; \
> +	     echo '# HAVE_$(1) undefined' > $(objdir)/.config/config.$(1).mk;; \
> +	*) if printf '#include <%s.h>\n#ifndef %s\n#error %s not found.\n#endif' "$(3)" "$(2)" "$(2)" | \
> +	       $(CC) $(filter-out --coverage,$(CFLAGS) $(LDFLAGS)) -Iinclude -D_GNU_SOURCE -Werror=implicit-function-declaration -c -o /dev/null -x c - >/dev/null 2>&1; then \
> +	       echo '#define HAVE_$(1) 1' > $(objdir)/.config/config.$(1).h; \
> +	       echo 'HAVE_$(1)=y' > $(objdir)/.config/config.$(1).mk; \
> +	   else \
> +	       echo '/* #undef HAVE_$(1) */' > $(objdir)/.config/config.$(1).h; \
> +	       echo '# HAVE_$(1) undefined' > $(objdir)/.config/config.$(1).mk; \
> +	   fi;; \
> +	*) echo "HAVE_$(1) must be yes or no, not $(HAVE_$(1))" >&2; \
> +	   false;; \
> +	esac
> +	rm -f $(CONFIG_H)
> +	rm -f $(CONFIG_MK)
> +
> +$(eval $(call make-override-help,HAVE_$(1), presence of preprocessor macro $(2) in $(3).h))
> +
> +$(CONFIG_H): $(objdir)/.config/config.$(1).h
> +$(CONFIG_MK): $(objdir)/.config/config.$(1).mk
> +endef
> +
>  # Generate a makefile rule to check for support for OPTION in BPFC and emit an
>  # appropriate header file fragment into a file under $(objdir)/.config.
>  #
> @@ -229,6 +264,7 @@ $(eval $(call check-header-rule,DIS1,disassembler(NULL),disasm))
>  $(eval $(call check-header-rule,DIS4,disassembler(0,0,0,NULL),disasm))
>  $(eval $(call check-header-rule,INITDISINFO3,init_disassemble_info(NULL,NULL,NULL),disasm))
>  $(eval $(call check-header-rule,INITDISINFO4,init_disassemble_info(NULL,NULL,NULL,NULL),disasm))
> +$(eval $(call check-header-macro-rule,VALGRIND,VALGRIND_NON_SIMD_CALL0,valgrind/valgrind))
>  $(eval $(call check-bpfc-option-rule,BPFV3,-mcpu=v3))
>  $(eval $(call check-bpfc-option-rule,BPFMASM,-masm=normal))
>  
> diff --git a/configure b/configure
> index 42e496b97a7d..0c9fb309c494 100755
> --- a/configure
> +++ b/configure
> @@ -169,6 +169,7 @@ for option in "$@"; do
>          HAVE_FUSE_NUMA=*) write_config_var FUSE_NUMA "$option";;
>          HAVE_CLOSE_RANGE=*) write_config_var CLOSE_RANGE "$option";;
>          HAVE_GETTID=*) write_config_var GETTID "$option";;
> +        HAVE_VALGRIND=*) write_config_var VALGRIND "$option";;
>          HAVE_BPFV3=*) write_config_var BPFV3 "$option";;
>          HAVE_BPFMASM=*) write_config_var BPFMASM "$option";;
>  	*) echo "Unknown option $option" >&2
> diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
> index 11335345a6d7..c6de15414481 100644
> --- a/libdtrace/dt_work.c
> +++ b/libdtrace/dt_work.c
> @@ -13,7 +13,9 @@
>  #include <port.h>
>  #include <linux/perf_event.h>
>  #include <sys/epoll.h>
> +#ifdef HAVE_VALGRIND
>  #include <valgrind/valgrind.h>
> +#endif
>  #include <dt_impl.h>
>  #include <dt_aggregate.h>
>  #include <dt_peb.h>
> @@ -187,9 +189,11 @@ beginend_child(void *arg) {
>  	read(args->tochild[0], &cmd, sizeof(cmd));
>  	if (cmd != CMD_BEGIN)
>  		exit(1);
> -	if (RUNNING_ON_VALGRIND)
> +#ifdef HAVE_VALGRIND
> +        if (RUNNING_ON_VALGRIND)

Indentation issue (spaces vs tabs).

>  		VALGRIND_NON_SIMD_CALL0(BEGIN_probe);
>  	else
> +#endif
>  		BEGIN_probe();
>  	cmd++;
>  	write(args->frchild[1], &cmd, sizeof(cmd));
> @@ -198,9 +202,11 @@ beginend_child(void *arg) {
>  	read(args->tochild[0], &cmd, sizeof(cmd));
>  	if (cmd != CMD_END)
>  		exit(1);
> +#ifdef HAVE_VALGRIND
>  	if (RUNNING_ON_VALGRIND)
>  		VALGRIND_NON_SIMD_CALL0(END_probe);
>  	else
> +#endif
>  		END_probe();
>  	cmd++;
>  	write(args->frchild[1], &cmd, sizeof(cmd));
> @@ -300,9 +306,12 @@ dtrace_go(dtrace_hdl_t *dtp, uint_t cflags)
>  		}
>  		if (cmd != CMD_BEGIN + 1)
>  			return -1;
> -	} else if (RUNNING_ON_VALGRIND)
> +	}
> +#ifdef HAVE_VALGRIND
> +	else if (RUNNING_ON_VALGRIND)
>  		VALGRIND_NON_SIMD_CALL0(BEGIN_probe);
>  	else
> +#endif
>  		BEGIN_probe();
>  
>  	dtp->dt_active = 1;
> @@ -344,9 +353,12 @@ dtrace_stop(dtrace_hdl_t *dtp)
>  			return -1;
>  		pthread_join(args->thr, NULL);
>  		dt_free(dtp, args);
> -	} else if (RUNNING_ON_VALGRIND)
> +	}
> +#ifdef HAVE_VALGRIND
> +	else if (RUNNING_ON_VALGRIND)
>  		VALGRIND_NON_SIMD_CALL0(END_probe);
>  	else
> +#endif
>  		END_probe();
>  
>  	dtp->dt_stopped = 1;
> -- 
> 2.46.0.278.g36e3a12567
> 
