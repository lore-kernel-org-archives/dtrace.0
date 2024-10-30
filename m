Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00750214415
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 16:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730306158; cv=fail; b=laebnQ4CBghPfNcT47UnW5Qrv2/0MctJHQpm5UVc8vPSmxxfArmuD+bGbwlLeU2v9QnzIdLeYMg8uQo2+Zl73OGClqgifaZWVQmaVDUHvt0xs71q5zm73QuRQnQSeEYbvoq9NtXsLXdqoNBGdLD10504ps2c54/jkGI8rOTgNik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730306158; c=relaxed/simple;
	bh=dZEiPh5v0zOdGZ7Gfakml4QOc8Qb55wTY1TfZhASkn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kNxW5IHNkbHT3y8NY32E+rXxDtzprOum2Zqe2auC/XcVCacxVGWqhkl0w4p/pPikqdANSwsnq+uTNyncUiBiXNp0JNSlOn+tu8pQH/EFVOIER3uNrqylg9pa215XsJNsQFxUn980F7N+7ECMev9j5ca8+t0iH+Ar+uttsg4NTM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LrnBGbCo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cNHshRg0; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LrnBGbCo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cNHshRg0"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49UGXYNY017358
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 16:35:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=AgVn6Is2Et7hQsXj8q
	YNDe+WWDxZs3tKY40hLXXYZ+Q=; b=LrnBGbColNSFPcL7CTEenPy9O1cImjnHKe
	HzYWgFZ5rEZzt+SUgTgVeSTYqMb1tMaqDgLNDOVGFSr+HDroZssQ1/DFxSDkfM7l
	0E0FEFZC3RvleY/47H9vFc97oW0rv+3uOX70P2H3RwLGY8e1TxJqyR7i5o93OX3G
	U0gcGJe/GDGhmTaU+p+Te8iBUs2yI+nrs5bgHjEDuUPIiesWpwptzNsybbaKxcRI
	WKmnR3SrIX9gxCGaZ77ayFRcKxGg5AezVemch3DGQiI+xXT7QBz0c9+wwfMBkYOI
	dQcHyhizXHSjvbiNGTn8fpKeaUri871+p0DYG6v/4fk86zTA78/A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdxrfe9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 16:35:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49UGLiP3034957
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 16:35:53 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnd9c4wq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 16:35:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ja+pJqL9HSdZlAB9xqM0HP0sm08zl5RQFPkkAQRieslZifdf5kxp65/DlFcPbz9KLsf4fuadnbbJwzu1NoxeIPyFa3j5dHhCst7pGBPOKZbDaMixcbRWaG8jLWL9/ugINLQj71NB4ThMZNh27BBrzdPzRVEWgM74a5FEgVpxO/KCPpm989sOg2sGChnzLobnP8DluVdYafbwXQI9qPAkh0pWVwzG+/tw6gy4zBwLaeZb9lhoEvyAcEFB+R3QSAcTFBzByXhteGHuYEa2sSbJ/m9rJ1tfczhZGboBGTxvBIdPj7+SQpqTToBTF4DQD3Ruy1mQHt+Bv8YfuAmSZXnEtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AgVn6Is2Et7hQsXj8qYNDe+WWDxZs3tKY40hLXXYZ+Q=;
 b=V+AjAZu0xmJprAtlo9Z/yYHVXhOvLABpmOpdYzyc8RxJPAPVF863sA4T7Kzmc+ruFp7b+Tia73Uvq2zpPOctp4xuQ7nGuwdTHtV4SUwGy2ffHJG2ZWa27TfPYR8IGdgs48CHIyyOnqLUXMmYBfXGRJk2eAVZSEj8AWX3shf35O/di3rr41Gy+bPmFKJPTMy8LfaUfTkTcIJFl2KHrul7vNfPmSqx7i67177ZkNvNkoIU4PTImjDm0rDAkACGjk032A5ZRyAUxoe41Mr5jgpO7ArF8h2mu056Z8HCjs4N+oBLXWkRQEhZAI40kgnkOTkTq+gBEV3wj8xkPIHVud6qdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AgVn6Is2Et7hQsXj8qYNDe+WWDxZs3tKY40hLXXYZ+Q=;
 b=cNHshRg0nMERuI22YVHTBqr05l2R/NPy3N/+bQdpl8kfp5Qlm1ysgUN9wH6mHyusnyVRWTa+qigsoNqdxd8xjfzXzz57y6paMxvQsKaKz7fpIn1c1gV+aatDHZ6ZkJd+gvH8amAgDu8fVImXgx9xEdRGTUlpyRo6LSnEgxDAfVI=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SJ2PR10MB7812.namprd10.prod.outlook.com (2603:10b6:a03:574::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 16:35:49 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8114.015; Wed, 30 Oct 2024
 16:35:49 +0000
Date: Wed, 30 Oct 2024 12:35:46 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 03/14] configure, build: make valgrind optional
Message-ID: <ZyJgYnRE77vPNs7I@oracle.com>
References: <20241030121236.257803-1-nick.alcock@oracle.com>
 <20241030121236.257803-4-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030121236.257803-4-nick.alcock@oracle.com>
X-ClientProxiedBy: BN0PR04CA0140.namprd04.prod.outlook.com
 (2603:10b6:408:ed::25) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SJ2PR10MB7812:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eba1f07-f041-4edc-fd61-08dcf900e974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WzkjLU856bYhrbNUPwlODTW1TxlUgfq6TFDnwygyikFu5IeOEbk7IRuP5jmP?=
 =?us-ascii?Q?Nh8+wxsq+AP6cfQCd26CYeDgMFm2gEt6/5fnq4hOXJJYR5mwbw5P8rPkVfml?=
 =?us-ascii?Q?3jS32Vc7mSImU0HnpxH9SIe2YDBdRGzWAdLnf7cuER/ZF4lRq19cG1fZn1U9?=
 =?us-ascii?Q?wZIzYbA4kShIQKjtduznGWCAvkvQFWKPdOVsOudfi1i3OewF7OXfMggW+GHd?=
 =?us-ascii?Q?HOv5T211Qvb32d7KzQrc7FWvDbhRKd8X7/8j37aRwxP7ImpD55D8FcFUQ9Nk?=
 =?us-ascii?Q?xJU7BIYUJdT3ZwQ+vdgIm9LOBlvYYtuK+FQemVxI6Ed0gytxjv7jO3teCqcP?=
 =?us-ascii?Q?uCC7P9AGyJhIyCo54OYDlCyVbYHxCnFHVyFyhYK17eTiUJF2g5zfvwktwxBW?=
 =?us-ascii?Q?5roFSUHsmscIPvRsuSniaD3CAy4haiz2xdAW2VqLWpyzmlgc4S0L9CUj1DPt?=
 =?us-ascii?Q?s+KlGyGKnREGpkVsbaMDLBtOLacGs7btrz9WZ5kSIYRQNwWzdfadSDoVlM3i?=
 =?us-ascii?Q?FOweMN/OUG2hH7OP9P9vgt3i/BPxo1Rh5apDbWxztsxvp5ThLUQ8RCuHNfHz?=
 =?us-ascii?Q?9jmHK/4uWBNLPXM9UxJ7xxvq7Su6WG5dxsizOTP8hPE1Ycxc+BSpv4MoyxjM?=
 =?us-ascii?Q?TNNgBnl5Fa58MkO1UBUARmMCHk7pQVYkURKj8+Y3F41bjm4VD4qp7z9tQdbN?=
 =?us-ascii?Q?RA5ZuJksKZuXueXVeKM2bUsZfO7IO4yTqb3toMbIuS8JQka7Qtf/YoJp2WMo?=
 =?us-ascii?Q?AWBwdvCSSrazSxbhgHemaNXfqUKBAuG5S+p0zFWQDWAgwyofFPSBcEenr288?=
 =?us-ascii?Q?CYgnrXvrVbgtxcOjlvSh/0S5mrPdIdmWZKVAURX5ji+11Fk6SaGxJtJzQhme?=
 =?us-ascii?Q?+nr5e8d0IcKTMUJ9ZJtPQHNSrZzVJQBfO69OtjupYATf9PAmWTjdTjpX6RqK?=
 =?us-ascii?Q?BICvPMd97dVoveaE0A/mFygfXxOtjBgqDEzcNdmdkUiqgWUwDi8xK6XgP+30?=
 =?us-ascii?Q?JNBGmBHUrf1ZQR6eXGn0F1o+tvg+7RvKnVElwxJBMB5fWqbfk5NspRkDJEt7?=
 =?us-ascii?Q?N3Ie0JpRdgvo8dghOF+WeMxXXOODxo9P2hEd9M8+pfLf01DPuHiELtd60CIu?=
 =?us-ascii?Q?eFHKIzgzu6RB0NJNwt/rgzclQNW4DDUWv9ns41+0lTj7Wy6iRtnk5UvxbKaL?=
 =?us-ascii?Q?FJaqcJJ5t/ufbKRcVyvQTcuI2EzEt/hQtxe5LcSu7813qyxsZ9OJzQCicqL2?=
 =?us-ascii?Q?LSO4NuQo61u5BlWdNgm6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wVC5PrIiS74uAhS30t60QryL3pqjXN6euSNWqDgpyfvmff1hj7cARlvan0IR?=
 =?us-ascii?Q?/R6AoxbCscllJNFKYXZvnmd1wHUOcBjHXmKFyf27IRYyGSfLTyCgC2vyW34V?=
 =?us-ascii?Q?6S2WPBR3DD/0QqeW3kK9jQfMNw1tvDoeWg4ctPlKhiBuBKDGO6jEfqyLhz8t?=
 =?us-ascii?Q?rdAxpOJndzrykkWM5iK5tu6fQ4plha3gA+SraQ30QQl79nBoVqnWZS5sn9Ml?=
 =?us-ascii?Q?Xr0Mze0aBhpx0OeA4pLeoX6IyDN3EXB+tAabVBGUHqvgITVCabDHMJed0nzZ?=
 =?us-ascii?Q?pb70q8p4PgFnZZ5kp5BEbdhfv9nHBT78rk6keCadFmgZCyuc//n+N6AwcOm9?=
 =?us-ascii?Q?GtFSklDBNcxgDihGHvSNd8y+og4lZJ72V5dYp3HonZnFqHcB9pRpncfM6dQ3?=
 =?us-ascii?Q?hc8QQUR88pk2/g1nv26HQYPft1ldos5lh4SywDs/p4YhS5oWwpdBzD8StcjZ?=
 =?us-ascii?Q?sZ/jTnsQ98i64eyc9RCOd07bIEgkWpaMoAl+H9WDckyHvNkbto9Cxg72WPH/?=
 =?us-ascii?Q?gnHOCFpMe64iFUb145E8/Js7o08EER1nn+GDTeJp/3Emg3DgWpg2rQ197Y05?=
 =?us-ascii?Q?JTtfOq0O8riQeYMkN+TKiyzuFgPxEI7zp+hCILweiL0Y8lLZBObPOY5/4ePz?=
 =?us-ascii?Q?eMnYr+NVUOrIm7IgPloRzQzGOaDZh51zXGGCJ4pcOUQfb+aThvHLKGtOw+Mq?=
 =?us-ascii?Q?s4h9Kf7SJI1ePJVvvDEF/NvID84NqWRl5e1wMnUKM7IQSF+cTAeptWm7Vy1Q?=
 =?us-ascii?Q?0hgUiLZsCRCfPu3oWshKDQvhig+bnx4Ed9BChUub5rtDGU4do6lMlSHI0wxU?=
 =?us-ascii?Q?9k5Iqak0ve3IVnZmAcyntFv4jsfazmDOxWLPfI7sSU7Jq/nIP3QGARlilUCf?=
 =?us-ascii?Q?uST6lhn2bKLfaplnmfnEbgfMnEJfgKu2u65quzxsQHLeHKA7oSHhsiF9vB5c?=
 =?us-ascii?Q?HnYg/bkThRsa4d7AVWpcR4nxeDILPPyHFsgPpId3K5wNOgqHMFWMUD/QPrmh?=
 =?us-ascii?Q?+slS9Mu9TCZTdkXec4FwD6tl4d7mddNWXQnoeyeJfpk1Yep3YbhyRciFHTIh?=
 =?us-ascii?Q?omJAQCZEl9SiKjmkM3fFm6b7SRU6HgJYyJekPjFbMKw14vrGZjkTEwOx3jmc?=
 =?us-ascii?Q?x3y5aGLj6NGSocmjqVOTJadAizcRTik2SNcHxV8LcxAlBvGSzyinLwUDvd5i?=
 =?us-ascii?Q?fHisOL4HGTgslr3i/kYpwNwoOqFG2KyTbpkJrlyLsAxxXg/sONam77yet810?=
 =?us-ascii?Q?inW6/qqnlkkW1n707jLMvfxTCyKC3D6DShTq5SQ3ycFGnrWvZO6oCl3lqfp+?=
 =?us-ascii?Q?DvFSs+ubHbUpxCeN0MA0/jdsQZrYBBY/yo+0vHxkVgoDsYnaZ51mVPtWlZIv?=
 =?us-ascii?Q?JCB5Hjasg6k8GL4wj2Sq6MKca/D8Hcix55M2enDp/UCtpuiH1+v0mwNSmqYm?=
 =?us-ascii?Q?hnL0UTCds0jH8BNeDhE77rkSfKdA+dCTYbDOGS7t/ImXI0e4fL4DxcOvGrqZ?=
 =?us-ascii?Q?g4+PiSk27/H5yI8e3hMcrwQ1DC4vojCKzsRcslg9D7OXWyY7Aq9dZUc/voxP?=
 =?us-ascii?Q?THJyRBz60xRqBT107IcVdnc/xvNEH9BqJUxAhycGYsCLGiU4COJP2aXZCI6i?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3jnE7kpxowjzvVrMQtFWasS9kIa7v8NInvwGNYCUrwTktjKJ8c4m0/D+XTvDB9QRdOfYj51E8hEPnWUXi46Q0z+Ch80t8vAKKYKVKwZ8SE3R54VsEJGuTCEpwXqPZjvfYOuqrgyeHesNlnwtq4js0AI59YSz/1KmS0GdeoRaZrVWEP2S+H7EMqcwPhj5Mk7yFP9oBeWaSbrfX2GeTnthfCxFANZkYxoNKFfHBiKSuxmFvro2JbHP+GISSGpZEfWjLEoJbWGuVJpSc9Ze8p4Krr9iPyNA27EZsqqJZsNGOZgguMqTg7CH2lRNPTzdUGR33vI3EvMorLrOb58KB93bH5zQZtozn9aSsZdSAE9FTiZTVNRf96ZmkRtFtpsuvrWUT/iqItmVXbjc4s56IyfAhD5vEeI4tqpn8kXrm5Uxi2iJWz3nrwIMMs9nsbO0FZucDf/CIfz4dFw+fIbZ+41bG0RM0atZluf8QZ++DRy/ECQy5pTspH4nQ2Lt0Dd/QmvYJeMaDuz+ay24e8oMljZoJUpU3ZUkeWyLWluyS6NAc84SvZSCzn42skLIoy5p40RiIMD/5Fb5c8pNljJt27sAth0QhV17py60j3pTNu1x+dM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eba1f07-f041-4edc-fd61-08dcf900e974
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 16:35:49.3357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +pO5oHgX1FTE2S8Nd7zyMkhSKxMDbGxog1TMAX2OBdiHEeUWqA/K1YcVuW9Sjrnrq8gb6OF8YtyBkvVVxNlZXULMf7oUAUII03HbdEMOLEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7812
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_14,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410300129
X-Proofpoint-GUID: aIsB2AdpLnRPn1DNRBOQdGwKf7Qn6JFt
X-Proofpoint-ORIG-GUID: aIsB2AdpLnRPn1DNRBOQdGwKf7Qn6JFt

On Wed, Oct 30, 2024 at 12:12:25PM +0000, Nick Alcock wrote:
> We fail building if <valgrind/valgrind.h> is not available, which is
> ridiculous given that the only reason we need it is to make valgrind go away
> at suitable moments to let us drop uprobes.
> 
> A suitable new configure check (using a new check-header-macro-rule
> function) lets us check for <valgrind/valgrind.h> and disable it if not
> present: as usual, defining HAVE_VALGRIND or passing it to configure will
> also suffice to override the check.
> 
> Bug: https://github.com/oracle/dtrace-utils/issues/80
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  Makeconfig          | 36 ++++++++++++++++++++++++++++++++++++
>  configure           |  1 +
>  libdtrace/dt_work.c | 16 ++++++++++++++--
>  3 files changed, 51 insertions(+), 2 deletions(-)
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
> index c44c77383dd0..8cb09942703b 100755
> --- a/configure
> +++ b/configure
> @@ -169,6 +169,7 @@ for option in "$@"; do
>          HAVE_FUSE_NUMA=*) write_config_var FUSE_NUMA "$option";;
>          HAVE_CLOSE_RANGE=*) write_config_var CLOSE_RANGE "$option";;
>          HAVE_GETTID=*) write_config_var GETTID "$option";;
> +        HAVE_VALGRIND=*) write_config_var VALGRIND "$option";;
>          HAVE_BPFV3=*) write_config_var BPFV3 "$option";;
>          HAVE_BPFMASM=*) write_config_var BPFMASM "$option";;
>          *) echo "Unknown option $option" >&2
> diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
> index 11335345a6d7..fd57b59513f1 100644
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
> +#ifdef HAVE_VALGRIND
>  	if (RUNNING_ON_VALGRIND)
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
