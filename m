Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514AE1F8901
	for <dtrace@lists.linux.dev>; Tue,  3 Dec 2024 18:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733249403; cv=fail; b=FgiAcsnmLCH0iJ51kJLA+BZrq5nuu88/mKDilEY4hj7YtGod8RjPTDZALipwl1IqcyV1SQ+rDvmgDdlTPGCcZ+fC9rx+WzemeKywKAF5NowYzVaK/lenS8t8RCrpPA3vy0NLaLWfgTHXZgFLQxFasQLLdIGKtbaVtmTvZpqWt10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733249403; c=relaxed/simple;
	bh=0ND84Qbga7ycXaBC/KJmZzmL5SMiPK01xPARsp6ZZ1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o9Z5u6IiuWadF61+sK0ZhkoJGWezecVLY7mgICW/iSUPWz9V8SAcqNX9rRm78MGQT4vj9ctUxixMMyA/9L+SY/QmnuRqhQ1myJ/3PCrbJ8Tf4gDGLTgVR5YFzupEIAKJ/ciIKQLoxt1+I0FR2dEG2UnEG9ls1071+ydjAvlCOu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=h1XPrcvF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zbTGapv2; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="h1XPrcvF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zbTGapv2"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3HtZ5t025756
	for <dtrace@lists.linux.dev>; Tue, 3 Dec 2024 18:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=MN/nJw2HRsFW284s6D2wSrFcY6NwGAUjOAspIDhxx+M=; b=
	h1XPrcvFNUEbJhvNBVY74jhdNHHg/l+Kmyu/1qudyAD78cJ95X9BZSHNGdMxSK5l
	DW1HKxt+i/G9kaTP3iyY7acZmhHqOZgXt4UKY7ETeQz7OOj6jOTPOKGnJw3+ZFl5
	owwjRJ7ND/261FAD6w5/Mo4TyrOpM+EWrqPSkrd8ffDxq1Zjz5GQr2B21R21I6nv
	Jz8tcfZCVtqdS4a3eMGQw6wtGxhGQQQaGrD/MO4h8ScS9BPlTSKlfHj6ZWKxOkC5
	Jf5Xr/JAA13g8R3eHKhYPxO5eIMsGoKnKYk1Lrku25jFYGtJhuofpHX9mFd2iZNV
	VhXvB72qIeuaYkDWNQrP0Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437s9yxn4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Dec 2024 18:10:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3GjQrX030357
	for <dtrace@lists.linux.dev>; Tue, 3 Dec 2024 18:09:59 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 437wjcuuxm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Dec 2024 18:09:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xM1X3nACXd1Q776cOMKWV/yft042RkKhMaWKbd/62QWXqpzS7IsOewetNqGHWwT8Tm+GtuMB4izwtek4uvQTvM91SMwDamtf2rZdkgR+UqQmfqGADdK/9y9FQeHPg9dvUs+49wDqcv6hcIfxb9nbu3U+CWSwVsym5uFZfmK00DbNAvTAM/tjIgltldfyUxu5w6x4/+L49T4pq4tbbfYTxwc3dORoQ4DDPJjTrX55OD9hMOSVPPGPMWiB5/b3NRQXDmtYQBLALXl97Bgg3l3pZ2GaOVOl+uhUpkWJpJ2uuqU+F2zy4H5kZeOn2zCT5jPnbcR9zRc0BdGdQIscS8smEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MN/nJw2HRsFW284s6D2wSrFcY6NwGAUjOAspIDhxx+M=;
 b=Tu+gi2/dnemaxBqiyeU+GSs9p2hbx0a8MUEtkd0WnJWayyCh4UycNlrPz0OBimM1GaG1UpqxTULlo2GPCI6o9fFuRY8hw/LJH1bgIfjMl8XQLeAAUnVOBBu8MghFdq/cRdejWvIXPeyxT9A17lbj3fju5H2CXr/qnwD+zm9Oor/THxxRAURxae8N8ReJQBUHhXrX+hj1vn8YGbxFk+bpfoql1gXKRm56RLGhMpJPD/0Ua2eTCk0CL7V9SjVY9aSJktZ7CUA793zH6K7+d9bTXBsJEuZybCKQaZILZtoSlMG6biw8mQvMqqR8bfN4bpZqtFOwFJ+FMKXbhi3zJCpjuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MN/nJw2HRsFW284s6D2wSrFcY6NwGAUjOAspIDhxx+M=;
 b=zbTGapv2aOzsI1DNyuAatshDCkP0XwHZ7m75m1yhw5Yd0GeDvQi962yYigy6jx/D8k/SAU64K5h2ROb1gQZXndjJO6n9EfRAPTLqDUqxWCSsREd8vhfDp7WhMbJjUcFB0q+Vjra02v7OuMZxyNoE0I+MXVeaKuDc4oF1YjLLT6E=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by DS0PR10MB6174.namprd10.prod.outlook.com (2603:10b6:8:c2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 18:09:49 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%3]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 18:09:49 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: eugene.loh@oracle.com
Subject: [PATCH 4/5] libproc: guard against Puntrace() of terminated processes
Date: Tue,  3 Dec 2024 18:09:46 +0000
Message-ID: <20241203180946.371404-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.47.1.279.g84c5f4e78e
In-Reply-To: <87ed2ozlnd.fsf@esperi.org.uk>
References: <87ed2ozlnd.fsf@esperi.org.uk>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0095.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::35) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|DS0PR10MB6174:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a463a70-277e-45d4-fa29-08dd13c5ad41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ke62y4mMhR5trIC/jiCFHq0OT8bMBrRYli1YGsrtMhxar1o32I0Tpl4cHolB?=
 =?us-ascii?Q?V2U5qSKpzdwoM1Shw3Pk4LneZ7fPdcoFH4YFGVqMzg/nphJF7YjIeFTCpddL?=
 =?us-ascii?Q?ep1azEjxO8ud0J0QYlK3lYLFqD4Wtlo/YeDnzdP6VCaW/DjxjGMlmxhj2NFY?=
 =?us-ascii?Q?p3NbQSc5LmObXMlcg52uqHAudNz99B4Fouq0L1wB2WIIERfsAW5TeIwDjRdN?=
 =?us-ascii?Q?XTxA0CPyB/FEgS3l+sK3d54rnk0SBVJsRthD/EFbvtAc0QLayV6eNvP2AASN?=
 =?us-ascii?Q?hpOb8INfX/haISmNcVgLyljn7/jv3yOPfck8xqBdotWLaQhWEUSVcszar40m?=
 =?us-ascii?Q?/X0rfXN7Eh44RJE2M6eGTFwVC0OY41ttS7wasDYfQ4yShxQn5V1WJfDPIJpJ?=
 =?us-ascii?Q?/lMpi4/cbw6TB+lUE09q36KjXAfUxMmR6deGlIdbNTgHAa+axxsICaSJuq3l?=
 =?us-ascii?Q?WRKVbywiPNi4R8zkS5k4gHtoByXyB3KMLyuNyfD422mp/7+LBXLJGMS2Bewm?=
 =?us-ascii?Q?YSoOjlhSOymcmi2ZGJ5T3QrLfXjBvX1mWmduyLuJXDvE6h5wJNy13Sk3nfQQ?=
 =?us-ascii?Q?Da6XhsEJxHuPAAn8bUUQB8CAWmbE5WZ8Wjhwipt0/zpI6ePgnD1zwQ8CeWfd?=
 =?us-ascii?Q?j2Rm1AcxfsUbrjv+eQCfewBUMLru1zrVbkmx1MSbn7H0kp13MgvpelWn14p5?=
 =?us-ascii?Q?/fym9OjDt8Fmwri8apyRVSkAHufNyIryVgf1Njr9nSpn7Bav/ybfqXfHdTck?=
 =?us-ascii?Q?RE18q6GAnx2vMAUJOgHBNMBk3IUXUFc9dPM9riavdcFaGigSLrv1gFR6TNvK?=
 =?us-ascii?Q?GxnPFtwTNJ/8puAd85QFqz01GSVzzu7qZRaoomiv7UoisypcdtqopKCIALMP?=
 =?us-ascii?Q?82/cX3aoa8nCt7QwWLxuNoZPtO6NQ0jAoOTouMpEDz9o73SwoLutY1wY9XhA?=
 =?us-ascii?Q?wrsfUlCWMX+L1Qx+ptnam9/TrNi5WqAmKpukuNxq6s+bIwzk4I+rGQNLTma0?=
 =?us-ascii?Q?02gmfOKBQy4A0L1UQBl75ixo3I8Aeep2GefvLzP4ojxujoglOFmqjfCym59e?=
 =?us-ascii?Q?Nz2oa24wZl3uY8BxUCeny/CLn7Kw0CQetAlAHBWo06Q7TQMUrcOWzDl2061M?=
 =?us-ascii?Q?03I9rzZycoElrg6RQF6Q+UlFz1kRU/hj2K1sFZD1gPJZ8vY4UigKzVpZF4po?=
 =?us-ascii?Q?KILuHvdfLzpKsed5f20Aoy5cakLS8mgiVsEJlJ5JN5+DNWsq4ivLRgBSl5RL?=
 =?us-ascii?Q?8kJuNXrBlG6Fp9Q3N+3dcKSr5y5HVGX9vmwhw8Wo/dWWC4iS4lMFlvtdvgkc?=
 =?us-ascii?Q?vjRKbq8d1dzckZnkg10KmV1dvRxmtQ3L+EMiaa85u+LMsw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U++kNf+IGqrItd2SxBfRWrYN613GAyDsX1DazfbdAeDCQTPBCbLh2MCR0AXF?=
 =?us-ascii?Q?XHx7kH78CFtk6wn2W60PZLpLcPzApe8BEie1Y76VHoJqbsIqKfHIj43uilee?=
 =?us-ascii?Q?v40EEzo/FVJqX+kVTpmOnpK1SjFHNfnYTQ5oS3BiqT0G8khQFCjVjlWwD/bw?=
 =?us-ascii?Q?0r1YQdk59Sdj8kG+nc1UPGw0dHdcP/1Kbe16L3DlsBduCdjitFMePYzjOb0G?=
 =?us-ascii?Q?SROV6w7q92qwSzTeHoxID4hyGWVcEwryVECc4OX1DgMT5LntF9Sp1gsEkuJK?=
 =?us-ascii?Q?BhCE8caz4LnxRdSTHrplFHBgzj4yPefzvoYWBzF/3LYgwld+m138+CwYvvBo?=
 =?us-ascii?Q?0oCa2kFv/blJgEQ5NgCkyECbswHYBZSZq2/V0DRj6Lx/9gCjshqyMZmw9N82?=
 =?us-ascii?Q?NUfvAPe+c10a5X9MYoy3BK4CxWh7qKszEJihx12vuOLegMX+zqdT3dVtMcIK?=
 =?us-ascii?Q?29e+NKN5YDxZADx7ZzHpvAsuyKkVTcHwiHEOa1HKksGYtYkpyfyJJmNCsac8?=
 =?us-ascii?Q?4GRm450Qx4dpDgqxNpreY3YBg+cX1ooC+cWpOxwt6q/qGqGLoBxmgwWKG1Wl?=
 =?us-ascii?Q?QEQ+lNxw1OEydM5aDI8QgZVkObQVgcEMXP89KZpvGKVqNxuUqqkLgu3ST4RT?=
 =?us-ascii?Q?dGBjtw6k/Ip+RtTSCJ2vnj3jTbNZLTDBUpSSXRu7a0OyhwhCeXvQMnrxBOI1?=
 =?us-ascii?Q?++cO9Sn900cQ1XTyDRe8c3IzK9AmS/khVsnAf2VexjnFwsm0i2mc3pYJFIBh?=
 =?us-ascii?Q?Uum28aS4WqVyPdyR2fXZ8RkchM8jrxfUa7bczaQqGxn6YY5NPVP3jyC3bpTd?=
 =?us-ascii?Q?Clvo6dwd1Q4MB86U3tWzPk3WltbUXHD1VC239VPDe9+DA7etN3zHwJ3K2Tub?=
 =?us-ascii?Q?xphXBWrmx3sX82O/XcUy+GTxCPyFmISQp6LihIVrwJAhLcIIbaxOG8NW5EvA?=
 =?us-ascii?Q?EE/3IichSyq/gT9vhKF6wfsn3ntW2cvVXdfYhqPCRVhmGIzB72yPE/Y9fMA/?=
 =?us-ascii?Q?g9ObbrXnF2vtJizQ+n96XRoHDVvyDjKUgsFE7nrijjJiq5pnVPzoGPTjPtdb?=
 =?us-ascii?Q?Cc12I35vMr7sauYBSmWlGjw80iPKaSQp5HJNvkLNu56e4WJ8VYdWjfb2oXSD?=
 =?us-ascii?Q?MI7nw/hBNR6+L4u0KRbKfbJbmooXuC7kXLGrnWvb2rrD9+n4lX7jXJsK1Q1P?=
 =?us-ascii?Q?b8/8vT8YOokz+GGreHPkDMRa/rZk+QksATcphT4xpv9zpWS8HufKToaOUd6j?=
 =?us-ascii?Q?MikaWcVowWIwlqUZ1Mt/U78LTUJtfUvtwbYpZ60XxTfCpRNTx3hm5Th/u1Nv?=
 =?us-ascii?Q?c2v33MH/gjU34cGDOEvOHuuIu3cSrj1SEn+hbE7jWvG0GNbM8tkjbZAUkYsg?=
 =?us-ascii?Q?jAZiLUH8WiR4yd+ude0fLdu7LhOvcw/w3kwVgbPn/zxIy3EGwVptPr5kII9/?=
 =?us-ascii?Q?Bq5P18F7FnhkicotPM0Wxd3pd2rAuAzTvb+EC6/Y3F9l//rB1T9YXO1q34E+?=
 =?us-ascii?Q?+/ShBAi/RxCUActxrLHm5uTGDJhLLAt8bfFzv5UX6xZJI5viKFkDzWN0vP0A?=
 =?us-ascii?Q?z1oprCb0NOxkqs/CJp9SGD0hAZw3A0kor+E/GGu7kK7rUMWVFrUnJWIYSjJW?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5IpuRTiFHRqoo50P8OdtodlEHSzyNCh1GHyoRoSyD4zH3w6HUjlMZ5aGL9af+5xs4VUd5nJ9JMHwy/kkCSIEfuDBlmOck77Adh2RN7iFoUjsgLTqZ2po53eyTDgzLAv1FnWhFRp4XoICxO53LFTtQe4QH4/Z/Rxw2L8rvFwELwYkTvBRZ1mC9zIjhoQewBq2f7IJrjnx06vUmM8+e9iYtYj8v8GrCw6VbFOH/VRetXPGS2VOtHGwSNyynvaJ7Y05Lva/mUQmOKnBTjdcWKphTBj0UkqW0hgOefJag5D0CZc47SoCsF+JRj5nph+W8vF3Jmve+3Ki5LPAkVeATV6HkylxMc91o1ZZMSb50yz2aZGNIG4+g+uUx0Za8ohPVPEftJKdXvstMW0zFkfeC6IrcoQQjTRj8WWoGBh2LZ0lYX44zZEtd7/12yI4iBkZPlI15jaU0t/Z4f0vyLImsgNjY6lje3XeEcH8Gn8NRQhziAsxcM1BOegEqobWYgK3hz4k3YBhX88hl8NAzSGLYI5heJynrGHHFxjKIc0hh7baWRKTRKmsBTpLU2sM+63tVMyyacercLazn8vUdz3n7laIizRAoNAp/ER6w/wSt/n6tj4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a463a70-277e-45d4-fa29-08dd13c5ad41
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 18:09:49.5397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4KBgrcMYz7phmkY+V9WKxNPKcvnPPwmaNX9Xaf3cf1NGx0O2XdhJ/mOkJAPklnKL7kKbbrKm2ok8vpuOdEYqtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6174
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-03_06,2024-12-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412030152
X-Proofpoint-GUID: fAf60SqNAPkhAZbg_QoUN6lBbtYdzR3t
X-Proofpoint-ORIG-GUID: fAf60SqNAPkhAZbg_QoUN6lBbtYdzR3t

If processes terminate while the main dtrace thread is doing something in
libproc, the process-control thread will clean up, releasing all resources,
including cancelling all ptraces.  Unfortunately if the main thread is in
the middle of a Ptrace()-related operation at the time, it will finish off
by doing a balancing Puntrace().  This is of course now unbalanced, because
the process cleanup did all the Puntrace()s for us; it will then try to pop
a state vector that has already been freed, yielding a crash that looks like
this:

 #0  0x00007f55dbe8035f in dt_list_delete (dlp=0x7f55d0001428, existing=0x0) at libcommon/dt_list.c:81
 #1  0x00007f55dbe8239b in Ppop_state (P=0x7f55d0001410) at libproc/Pcontrol.c:1280
 #2  0x00007f55dbe827fb in Puntrace (P=0x7f55d0001410, leave_stopped=0) at libproc/Pcontrol.c:1456
 #3  0x00007f55dbe8bffd in rd_ldso_consistent_end (rd=0x7f55d00046e0) at libproc/rtld_db.c:1113
 #4  0x00007f55dbe8d5d8 in rd_loadobj_iter (rd=0x7f55d00046e0, fun=0x7f55dbe863cb <map_iter>, state=0x7f55d0001410)
     at libproc/rtld_db.c:1934
 #5  0x00007f55dbe876d3 in Pupdate_lmids (P=0x7f55d0001410) at libproc/Psymtab.c:813
 #6  0x00007f55dbe87827 in Paddr_to_map (P=0x7f55d0001410, addr=4199075) at libproc/Psymtab.c:883
 #7  0x00007f55dbe5354c in dt_pid_create_usdt_probes_proc (dtp=0x1a47ebb0, dpr=0x29234ea0, pdp=0x7fff392bb090, pcb=0x7fff392bb170)
     at libdtrace/dt_pid.c:987
 #8  0x00007f55dbe54056 in dt_pid_create_usdt_probes (pdp=0x2ac157c0, dtp=0x1a47ebb0, pcb=0x7fff392bb170)
     at libdtrace/dt_pid.c:1265
 #9  0x00007f55dbe71ce2 in discover (dtp=0x1a47ebb0) at libdtrace/dt_prov_uprobe.c:520
 #10 0x00007f55dbe747a2 in dt_provider_discover (dtp=0x1a47ebb0) at libdtrace/dt_provider.c:183
 #11 0x00007f55dbe7c1b1 in dtrace_work (dtp=0x1a47ebb0, fp=0x7f55dbcfc780 <_IO_2_1_stdout_>, pfunc=0x404211 <chew>,
     rfunc=0x40419e <chewrec>, arg=0x0) at libdtrace/dt_work.c:377
 #12 0x00000000004066d5 in main (argc=11, argv=0x7fff392bb7b8) at cmd/dtrace.c:1556

(This can also kick in when DTrace erroneously considers a process dead even
though it isn't, which is actually what happened here: we fix that in a
later commit.)

Fixed by simply checking to see if the process has been Prelease()d in
Puntrace(), and returning early.  The process is released and all
Puntrace()s have already been done: there is nothing left to do.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libproc/Pcontrol.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/libproc/Pcontrol.c b/libproc/Pcontrol.c
index a32a362eaa1fb..6a454ef86bc3b 100644
--- a/libproc/Pcontrol.c
+++ b/libproc/Pcontrol.c
@@ -1455,12 +1455,22 @@ Puntrace(struct ps_prochandle *P, int leave_stopped)
 	int prev_state;
 
 	/*
-	 * Protect against unbalanced Ptrace()/Puntrace().
+	 * Protect against unbalanced Ptrace()/Puntrace() and already-
+	 * terminated processes; operations interrupted by process termination
+	 * might reasonably do a Puntrace() to balance out a previous Ptrace(),
+	 * but everything is freed and we just want to drop out after balancing
+	 * the ptrace() count.
 	 */
 	if ((!P->ptraced) || (P->ptrace_count == 0))
 		return;
 
 	P->ptrace_count--;
+
+	if (P->released) {
+		_dprintf("%i: Puntrace(): early return, process is released\n", P->pid);
+		return;
+	}
+
 	prev_state = Ppop_state(P);
 
 	/*
-- 
2.47.1.279.g84c5f4e78e

