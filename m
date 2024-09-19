Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C52191F74
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 17:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726767763; cv=fail; b=IysUbIlkIH+efPggLLUWLh1gSNiq6xuhPmA3g6p6yyvFHKrkMG7XuikefqU5sj7D4WWw4iWCojnI0KEGXJLriFDO7FsEabTdIr/T4oKu+YE20vneV7hc8RhtIXTEr0c0kP+lQrjMvTdmux597Mq5I0/FPpSOS1zcsO2xl4Mdzlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726767763; c=relaxed/simple;
	bh=qbRis363kzF1iis4imRZLbtWUNQdOwOiIRUsXAEzozA=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oKBoPHlcF/8WJXGiLibEPnsc0lQwb07qtD6U6fYtkvVx6mXh9C+8gLfrFyepjNArApMOaWy7F/khSZuPtRtFiLfhUq3pTvSe/MgSo6KUPT/xJ+DziO5ksGzR7/6ZgJnAT5uWyAKZznMuE0owLZ/wVxxvrqRNgp3zkU4T7WCUU1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fuFqH6LV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ziiHU7T0; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fuFqH6LV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ziiHU7T0"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48JGtj8X031421
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 17:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=Ljlcagi9VhjzxWQHIk/pWUIarb6Kg8kWHZYgNz8imf4=; b=
	fuFqH6LV/mtEAZQkXuZrP9PxVVLWCT7AHprD9N1N8fzBJoi13ZmePoiHLfLX70/C
	ak3rmrVBFJh2Y7frrPQ3joXV7YwgKGrSvxc0ohW7mmqa1CIjJxenTYrG1DA0cH4o
	ZAvLNVMI781xurIfRIHPzhn5Nn+o12+4fB8d2avzVGuCsCpzy+MvCn8CB5n9HB93
	36A/AqaprgulPCc3iueesEWUhnJEntkg8fdmaUz3TMvoV/Xarhfs1oMAC6TBiclx
	8k0s/WMu8eLCJgIBIX/8uq3FqZxLY0zJdZLFFyNfl/fafs2sydM4BKhk6Jo0QkfK
	dsHN1los/Zi+xoc9bfeBRQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3n3mtej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 17:42:40 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48JH0KGV015841
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 17:42:38 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41nyg6drje-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 17:42:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dft4+Bk5FuyaL9K5mkGNBbkhfLMwPieN5W1Y+SiMrpceGjLBYJgwqOI7k8+aBwzQIAlVZ1Ye3VH/2Lk5QSRTIzs/Rv+rPdQIXK7BwhhefnEmceTeueTZ8bH80t4DIw0ZS95oQvA7agH4EmcbtUSkKcvPtAKFP9CKlx/l3pMl9JJG/JXzd6HJ82/1ytcsXSianv40ye4efp1uF8WVB44VFVxmsLRPracJnRPgKMcXjtJVu+M5eteINW0hF9v20rz4OxRURQSt+ydQII/E/zJs3IDqSAGD88W8P0gjdHAQ6rtIveWOohBR2Jbl/Kn1C/gKNFug4/rgCFWsdQ19bXPsnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ljlcagi9VhjzxWQHIk/pWUIarb6Kg8kWHZYgNz8imf4=;
 b=DJp4TND904cKsfj8Gw9xvUSldS/wWPe9VuLWAod6GZwNAGU2DQhyP7/lqhnVhaNcSgQqIGr4Lee3eKDB/IzHw++ZEZwQhEJvC0tDPfve7D4bpni0SvwY+dtOhqBuqIObkfPA3wIqRdjSEeZZ+s2oV+y+3iPHJnAXG2mri4a8REnFio3/ZYRdGxpetV6pvvmgwwLDjcQaDistunoOA26NCpZlXz12AE0i3gtNA9+fmk0kTrtnRZkC2my4E8XDYEVeVaAN9WWK9gsUrJ3hMV6E8XDWmEeF7ESmFOaLX6X0DJGwD3yjo2+y56SpGBt9RWTMbCZmZY8YzP9MYFtZHrxh6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ljlcagi9VhjzxWQHIk/pWUIarb6Kg8kWHZYgNz8imf4=;
 b=ziiHU7T0mIs4eymMtV1PzBxYnuQllX7xkqMRNxwX1MG6PJSUC/z4Qclse8q4GOeL8dGZn/k7c2HP2ECltmcjVjzHgnQHFE90MNLnS3eGYh0Qa6Z5zVRThY7FJIfmTFHuMwf12tMVf0vHp/6mwzcylumFQG/i8FI1fHtyMQHrEyc=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CY8PR10MB7218.namprd10.prod.outlook.com (2603:10b6:930:76::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.7; Thu, 19 Sep
 2024 17:42:34 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.012; Thu, 19 Sep 2024
 17:42:34 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>,
        "dtrace@lists.linux.dev"
	<dtrace@lists.linux.dev>,
        "dtrace-devel@oss.oracle.com"
	<dtrace-devel@oss.oracle.com>
Subject: Re: [DTrace-devel] [PATCH 10/22] Simplify dtrace_stmt_create() attr
 init
Thread-Topic: [DTrace-devel] [PATCH 10/22] Simplify dtrace_stmt_create() attr
 init
Thread-Index: AQHbBsLJ2nlSqhFpUEyqw6kfyMebE7JXefQAgAfuFoCAAACpUA==
Date: Thu, 19 Sep 2024 17:42:34 +0000
Message-ID:
 <SN7PR10MB6287440CD336F2408E1A2645C2632@SN7PR10MB6287.namprd10.prod.outlook.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
 <20240829052219.3234-10-eugene.loh@oracle.com> <ZuW5FYlled3rjac3@oracle.com>
 <ZuW6sov45DyFF4Pe@oracle.com>
 <1c5ffd82-506c-aff3-587a-20002d3a45ed@oracle.com>
In-Reply-To: <1c5ffd82-506c-aff3-587a-20002d3a45ed@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR10MB6287:EE_|CY8PR10MB7218:EE_
x-ms-office365-filtering-correlation-id: c89db70d-c2e4-4186-6bc7-08dcd8d2720d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?DqIiLSCfB/tAGU5wuhRcp9Q/w+xbGyKSJy1+ZK/YE2rf61S2jbybplIaiwNE?=
 =?us-ascii?Q?BVyTK9LJxZYQ90nQdSekzJLRo5oKs9sr2YAd+9h4+vp+Vkru+rDaUDeXnU+4?=
 =?us-ascii?Q?51sUolycGxCAMObOOGe8i6bah1mSSQNYFT52gn2Dejm8RmKYJaqWEA/0B8o4?=
 =?us-ascii?Q?gNGhO+4uxTXPDAxIh/lLXLpsNGXPCQ54hera4eYUPw/Nu+wAioVepEw2Nsuo?=
 =?us-ascii?Q?nU8nObnq7spu5l5nWhPJisJeYYQQAsGUYWAbtWIglXeIw9mkhE00X/mK3hOz?=
 =?us-ascii?Q?2jK6IdyhvsyyNiw36c6/Dlli6eFftUOCJ4SOk7dTIdTLuKUcrlCiBPd7Kpap?=
 =?us-ascii?Q?/McS48DlTEqDwmP88L7OboGtxpLcUw4HxySOeXl+KQfL5HNBky/ire2uP+8p?=
 =?us-ascii?Q?v/33bnL9VLLY6zkTRq6C/T9Mylw5aT3BzW8A6LimuG26OaSIzw6Bq8nHnfbg?=
 =?us-ascii?Q?Odms/HohFGRR2AS7MK3SSwC1jTsCMUBNgshRJdNN2k1sPyrMBj1jHFji1C9Q?=
 =?us-ascii?Q?TemezWb3H+kMhfIfLw3/O5ODbJFmNYdXuKrRX6trGpoal74/ewpATj4Vi428?=
 =?us-ascii?Q?KR8Pad3LxRrGnc4hkBertIAjiZdj6VB2V+6fdJJ8CpA/aWXxFweHJRD7g5Q/?=
 =?us-ascii?Q?4MLll5L496+dOn3hB04tSdi+UP42/QB+6ki6d+TCLE/BSAfQ78nL6pqw7Vie?=
 =?us-ascii?Q?euQj9YbIJCSx9kckPnrMWivBt64JVKm3297NZRMCLKtcUwozfV+3IyTbHW/e?=
 =?us-ascii?Q?rF/Hz03OvtTx22hAtLZYGihu5H2ozEQd/RBucMgpTLLj1hdpmquzEMUagT1m?=
 =?us-ascii?Q?X3iSoECF8qIiXEK6nzXBHJ8yuz4nY3J24Ki5NuD6vFswtPK3YZIsv4arZmr9?=
 =?us-ascii?Q?QkU3LwEht4kJL8oRo43JxGOioG4A9R5qBnbM+7AzqUYYdccwzEKAvNTcLJE8?=
 =?us-ascii?Q?quwwLk2AfRhbrMO1g443FtnNQeiRVouJIzNL/sKW+vnQyCebpQNKQyqUQvhe?=
 =?us-ascii?Q?AfcIf1Dz47X452nQryJeYfadfAyY3E/VndBkRwjOmzdV0/grSxhV08GTcxA0?=
 =?us-ascii?Q?ZTVS6Sodqa1A66P0WK/tm5nN9251ht/GKGgHo/9wrly0YDh8L4saZPSNYKx+?=
 =?us-ascii?Q?4O/DXbiRdFnfwubjceKl+KDL4gtnr/bnqj0zBkkEgCvBjknhYkLfEx5zgs4b?=
 =?us-ascii?Q?UlwB3V7AC8wggS3e460udPqh7ooCOch+i/b2mmOsvR0mS3x9mbCfIAvqUfn2?=
 =?us-ascii?Q?II/eneeEym6oxcxpFZwzf0mF2nRcHsZLRJJbvge17yo7TOAw0wkLocwyLuIk?=
 =?us-ascii?Q?/r19TQGXfjKZU5KbqnQVVfSH/t4gOJ2akxdOmYra5kR2OF8WyX6JGS8QZYME?=
 =?us-ascii?Q?44kaA0Xt85g1j+p4Lr/JarebRqgqQ91cAoCKOG322iKgFQ0YIQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?dFoOh75sy6QMKNiezrFzgGroNkiiXIsNUMfBvJx+YJnBDGaTtpWWdM42pkv8?=
 =?us-ascii?Q?nt0+RvqmhXOTAAjf/R/PtMwgFc6KNMRIGOpp8uNvo/6yjWvHlsUdd/VMFL9X?=
 =?us-ascii?Q?PBofBEX2osSCAu7Ubl++5JwhNsAkDcOAm6GyWZW8XSSBlGGBB40dLbKxvYsG?=
 =?us-ascii?Q?5r+lktQ2YsFzyon9JqiJEseBk8Q7SPxivXYDLjax638KjuBRAAJSZzCD4Ox4?=
 =?us-ascii?Q?4lBJ9ZjYfKl1q8dXIYNA0MiUqeYoPw+HfphhshpOMMxEtKjGuY6/uLi2JCxd?=
 =?us-ascii?Q?hhKfQnikk6/0rQnosgukbiD5pH11Eej4b00gkHg9hAcfccNAMdgmzWpAc4y6?=
 =?us-ascii?Q?l64Gq1qjDv2djJ572yZMooHGMPLp79VuF/r70Lwi7e4lmzLP7z7Co/OsNThY?=
 =?us-ascii?Q?5+KvX5pWstf4CNywLNv7Yc/yLRgLe9rlg/UF55bHEOG8UTHRK7Do03umzfyT?=
 =?us-ascii?Q?ezd0O++wm1kSWQcgIqJF0778AMFSPnRZB7dmbUpOL+DITYS8R46ae38h8doO?=
 =?us-ascii?Q?ekIQRoKgWuAxiz2pu8l/Vvx7fs9SXy8blbCcEn8npTFXjfxF+CmSw3LeCQjc?=
 =?us-ascii?Q?6+6SMJoUjJ/2gfcdixb3jpRqy7dkoQVmCI42aJR54JhPt1tdnLKHBM5JcWOh?=
 =?us-ascii?Q?m3CKyUpcdY1fLxB89/UwB9HfzHmzOqCAfnaNfkfC+pCyJIqJXzynAmw8o3f9?=
 =?us-ascii?Q?qWzRmBBa1Ctz5DZoCE+JBpGzbOdUfQZbhWAmYv1badU2TiEmjcDM+dhpWPPi?=
 =?us-ascii?Q?7plGZ2RQCvgycQw4hDyDK4cX2zqTsvk5rynXUy+c1w1EuXeni5BY+HsJhYgC?=
 =?us-ascii?Q?C/D1nBSDn6ppWWBgDqoRp8jqyHb8mMqDJV6DRf3TwYgy+AKeUvXa7JOi/l6x?=
 =?us-ascii?Q?sUnAuhEnPfQYb1Ia/ldeyuQmbUCXMI76uftcV3U7Ms7SX2SsrfwhiKEbrKNu?=
 =?us-ascii?Q?mm0o8x3kCnkkb0jXPXK3KmTxsP5AxByIoZW2ntEIjMF/5aez3cNAI6+SzEPZ?=
 =?us-ascii?Q?mc+XwPEYekGYoIXAT4/kOqLzfMzpMtl8lReBm+ZfThEdR0zPTJ/3CygVVPEe?=
 =?us-ascii?Q?YABz5uPeQrgeB4LOjGCJacBYhZDP1Sgt4c7WwYADrMJBo81ouqoF1QorCfv1?=
 =?us-ascii?Q?wuePVE1kZTHRdljJlRYWmWeo46VizzfJQ1J9VjqsN+O9BFzSUB07o8Nf0CJK?=
 =?us-ascii?Q?Sv+EmVEcNw0UHOOAExtT0sGur3ho1dvAkjHNYwkcHBV9BLF3TzrbTSLYFDy9?=
 =?us-ascii?Q?58v15UmsvfCuAdJjYeFr9UDjMTkoEzGfuJHTxA0/e9AWr5AOcWnDjsVpgaMD?=
 =?us-ascii?Q?xeAS4AMe2atxCG7kAQhZHJ15AEZILLlOLn6HXPqcgWLVIjgYbDE8dZyU0GdV?=
 =?us-ascii?Q?7oK+8hepasOkljzhjkik28WZjYaksvRGGw18RRqWTkDuzEGYwtqynD/W5/cT?=
 =?us-ascii?Q?/3kVvbcjKNnxWvnsi27QgU5nBSavMEwmRhU+XJXbACOKt203SCo9mLOtA+JO?=
 =?us-ascii?Q?/CZ7We3ucbOrI+hxSDuS1EF12a3d/i6j5MXAG1mT5O5LKCmedauMTGj3k84r?=
 =?us-ascii?Q?iPuofWrzt71RRYDyKImuKSyo1AMUMc7MtCJ1Dto5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KB8un1LVW6nidib1+UA3XA1kNcoXm8MZMsVG0tfQgD1beJ1EDvx2QNn0SaVIYEE3VTIjWsB5xBNjM8aZ5Uu+Wu9akLnvUmyswUEcsAf16RT4fewKZc5LezOrimRm8a3I6pEQ010U7NnEYt0jE5j+D32g0a671ORxjc+WRtXcTZl3VZDE0O5Il3N7iw9o2S4qioFld1Et7cM/Xu8Mq6t4JOkBTvLMH4kABHXKDqiJ3hHx4TstgM4TpVQU9CLNtzeW3fJfKqbCABq5ql/PVUde14YH7FPSViHWexDaweNs1/3+69RPTDl8b+ShKJBioDl8jrrFgKcWi+FyZU2Ej/DLPYUdJIj1Omc6W2QPnx3ODudLiks6wHWWSZzpxxm3t73KjtbH9iRCbB7himOcvStg3df2JjJkYIoaMqHMVLd617OczMIYA0CjijHtA++wgKPo2M7DXKPf9DwUkjND5PgR9BhY1pelm3XRV1pRYbsTxQByHj/I6GRtkbfxbPm/bdQDswJFoILFgIfovyyWxU0WOPr24+suEEPIEy6Za7Q6BlU0SROMCpQla2TXiC3bQar2qwQ1jxJnH1t4MFwYNGUq4PixXQKfXAVpEsiyMJF8d+Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c89db70d-c2e4-4186-6bc7-08dcd8d2720d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2024 17:42:34.7628
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dGsowDmj4wdt0dAHMYun/lWwcr2iE2tr9N111S9e35XVlADP9Kfmrv4Sz6MTO+Pr3NDkNSJ+86FAxYKxyU+9W7MOwU+YmVrDej3ZzXnkqMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7218
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-19_16,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409190118
X-Proofpoint-GUID: KhZLFxsKDniJPEFQpSibM2dP78kN6qos
X-Proofpoint-ORIG-GUID: KhZLFxsKDniJPEFQpSibM2dP78kN6qos

Ah yes, good point.  I should have realized that.  Yes, then we should just=
 drop the patch (for now).  Thanks for catching my mistake.

I'll have to do a revert since I already pushed to dev....  My bad - thanks=
 for pointing it out.

________________________________________
From: Eugene Loh <eugene.loh@oracle.com>
Sent: Thursday, September 19, 2024 1:38 PM
To: dtrace@lists.linux.dev; dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 10/22] Simplify dtrace_stmt_create() att=
r init

On 9/14/24 12:32, Kris Van Hees wrote:

> I adjusted the patch, and changed the commit message to be:
>
>      Simplify dt_stmt_create() attr init
>
>      Even though dt_stmt_create() initializes dtsd_descattr and dtsd_stmt=
attr,
>      there is no point to doing so.  It calls dtrace_stmt_create(), which=
 also
>      sets these members.
>
> and added my R-b.

That doesn't seem to work.  In dtrace_stmt_create(), we have:
         sdp->dtsd_descattr =3D _dtrace_defattr;
         sdp->dtsd_stmtattr =3D _dtrace_defattr;

In dt_stmt_create(), we have:
         dtrace_stmtdesc_t *sdp =3D dtrace_stmt_create(dtp, edp);
         sdp->dtsd_descattr =3D descattr;
         sdp->dtsd_stmtattr =3D stmtattr;
which means that whatever dtrace_stmt_create() does, we overwrite it
with the attributes passed in by dt_stmt_create()'s caller.  So, what
dtrace_stmt_create() does is irrelevant and what dt_stmt_create()'s
caller asks for matters.  So removing the assignments from
dtrace_stmt_create() makes sense (except for the API issue) and removing
the assignments from dt_stmt_create() is wrong.

Specifically, removing the attr assignments in dt_stmt_create() causes
test/unittest/dtrace-util/tst.VerboseStabilityReport.d to fail.

Either we should go with the original version of the patch or, more
likely, to preserve the API, the patch should be withdrawn.

> On Sat, Sep 14, 2024 at 12:25:57PM -0400, Kris Van Hees via DTrace-devel =
wrote:
>> On Thu, Aug 29, 2024 at 01:22:07AM -0400, eugene.loh@oracle.com wrote:
>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>
>>> Even though dtrace_stmt_create() initializes dtsd_descattr and
>>> dtsd_stmtattr, there is no point to doing so.  Its only caller
>>> is dt_stmt_create(), which itself sets these members.
>> No, it is the other way around...  It should be done in dtrace_stmt_crea=
te()
>> and thus it is no longer needed in dt_stmt_create().  As dtrace_stmt_cre=
ate()
>> is a libdtrace API function, it can be called from other code, and since=
 it
>> is the function that actual creates the statement and initializes some o=
f its
>> members, it is the logical place to retain setting the attr fields.
>>
>> So, instead remove the assignments from dt_stmt_create().
>>
>>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>>> ---
>>>   libdtrace/dt_program.c | 2 --
>>>   1 file changed, 2 deletions(-)
>>>
>>> diff --git a/libdtrace/dt_program.c b/libdtrace/dt_program.c
>>> index a4b052fc..bdb434e0 100644
>>> --- a/libdtrace/dt_program.c
>>> +++ b/libdtrace/dt_program.c
>>> @@ -240,8 +240,6 @@ dtrace_stmt_create(dtrace_hdl_t *dtp, dtrace_ecbdes=
c_t *edp)
>>>
>>>     dt_ecbdesc_hold(edp);
>>>     sdp->dtsd_ecbdesc =3D edp;
>>> -   sdp->dtsd_descattr =3D _dtrace_defattr;
>>> -   sdp->dtsd_stmtattr =3D _dtrace_defattr;
>>>
>>>     return sdp;
>>>   }
>>> --
>>> 2.43.5
>>>
>> _______________________________________________
>> DTrace-devel mailing list
>> DTrace-devel@oss.oracle.com
>> https://oss.oracle.com/mailman/listinfo/dtrace-devel

