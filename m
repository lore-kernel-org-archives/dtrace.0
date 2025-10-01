Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D0B2D77F6
	for <dtrace@lists.linux.dev>; Wed,  1 Oct 2025 06:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759299874; cv=fail; b=h3hp3XAfcmdu0VnjsvGtVo6Yy84g4wHVfGPFqWDiRb5tQ/1sOo/3IRCT/8lDpJHstEORYazwN6czWTATglrL80IzeZEYO1Z1vjVLnLrPhNtjW5uZ1QcePRAo8PQdmu3QKG7zbEr7KZYZ+qdaQ5McGJzGWItbZVPbsco5YEEi9Fs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759299874; c=relaxed/simple;
	bh=QD9OiHdDF9Wio6+fDMDevHQY92nuHFDL3R51rbQmxWw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JsM7taGCTbbGxQvMX0wHhKDnb0Ht+wUauZ/lwKG+Wt942ZOH0yrxwfXGfnDDA1ZRl5T1E2fDMaAM3ROmdNNwknddHHNVYqY+/u5kG0QkGvJYZuLxyLw3co3tE45jCEwYJtQJC6gXNbbeRGjdoU61hDW9NNGQfgN2s8VmhVR7Tdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mii1fJWB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fRQvgnKu; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mii1fJWB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fRQvgnKu"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UKMiMT008624
	for <dtrace@lists.linux.dev>; Wed, 1 Oct 2025 06:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=vgx8Y9E/2x4Occ1MII
	idplqDkrQihkmcjRAh0P5Lpi8=; b=mii1fJWBw3K0gZPypYg4C/SuukjMqliJoV
	I5NOTcIfK5yKFCU18bRccQ73p1tPazzDGQnHXzuQHK+7RroUVesEMZatvkNWmYYQ
	4i8VZCPEvknzp3sx4f6j5X53TIz7cat+VKAXL7RM+J9PVOBlCKGDMQ1+ik+0S7BS
	Kv6pgYCCvPnAnxqnY4oY19Fe5qP16IiyZCvVgy0MiaSkRPfScYMLkEsxZhGuM+RV
	XVrC2zbtcFotKWmvYT3Aj7ALvasH2D02yCzw2lLNH+B5HENk0BFNAqEpnCDES4qB
	OgdpKtpM7x9Brom5D2t2cdFAsyK4OJWYgExrW7cY7e0yOVnfjhuA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49gmabguak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 Oct 2025 06:24:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5915xwMu027430
	for <dtrace@lists.linux.dev>; Wed, 1 Oct 2025 06:24:30 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012069.outbound.protection.outlook.com [40.107.209.69])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49e6c8tnxq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 Oct 2025 06:24:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FzjX20+eq/9q9GO2rCD9tyPBEFMGMpjzAaB9Jhglv4wrDwPNZsXryhp/klsFrJ3SmpKM61eOL7c7Loj9Eo51a4jGyqHP4Up2K2YkVVoj0mON8KLmaeFpSVTanCPIasjeEOBgw3/wwsaBy7CPat1W6FQY9Ba3e+OIZ6BRP0ssvPikOFbZFQWbDYNZ3NT40I3hOzpexzhw9NCmM+86LFj2CKCCyV1dMCWX0XKsPyYAdQ2y+eiECwgZwnR13ADP7r1JcIhkDm21PuaHptT6LvZAyMXKuiakjdiHwsGe/YBzc1STYS8R369G+yRVP3UulQd6lXLMj+HomeEcb2Rro36Mhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgx8Y9E/2x4Occ1MIIidplqDkrQihkmcjRAh0P5Lpi8=;
 b=q9wmXXjuW1uCr5PoNZ1LblqqjCSu/W+nlGbs4s3JJgSQpHnTY1zkYdOazfro+w8UGid8bmAVa85u5sXGuti2pyhQ2TCer2eXm0sVOeJwL7lWOA3J4EJxPI7g9lM+KDTst5bepS2vmUxRUdzFsUTJR/D05lygZXr4HT3czviyIKOBsDF74KMBdWimU7SAy9Kui4sFBz+30WFMI9lmksCZRH5dNhRHTuZ8QIRqn0pjMMPoQ4ZSyVQl00S7ie5/XPWkHKY+wrOI5mmZrWfEYJmWbTFTbq0WBFnholmeSflW1w/7YVKh44ZHu+PueupT4HmwQutYsgCnkNp+if8+qQNOtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgx8Y9E/2x4Occ1MIIidplqDkrQihkmcjRAh0P5Lpi8=;
 b=fRQvgnKub4jXclJ+eA+XRHaheKX23Lb1Tijkmi1pX74Z9/u2WoK6EbbyePs+L/GbrLRPJuj0vQrUfy60abrO/YuEBlYX5DaylaILghhz3Ok1v43bzAYMNu6EXJIRBpgXldYJ1Hsur6g9xzrgicF0T2UCiT9U/j+DXJ/xtPfjNwg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB7078.namprd10.prod.outlook.com (2603:10b6:510:288::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.21; Wed, 1 Oct
 2025 06:24:28 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 06:24:28 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 5/5] test: Remove antiquated special case for aarch64
Date: Wed,  1 Oct 2025 02:24:18 -0400
Message-Id: <20251001062418.6902-5-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20251001062418.6902-1-eugene.loh@oracle.com>
References: <20251001062418.6902-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: PH8P222CA0027.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::28) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB7078:EE_
X-MS-Office365-Filtering-Correlation-Id: d331eed8-ec37-4ff5-b22c-08de00b32ca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RVCUgyFykfCJ/NxsPaaD3lZ2tCbCYchfD67K4ewwOxzkwxGYFBPK4IdJibwE?=
 =?us-ascii?Q?3YHMzN6Ce5wSl/8ot6ZzbfROd9P9cq0+hWWsj6Ayi9k/lpoaBZpjfUTxfVM9?=
 =?us-ascii?Q?lPSEFACoI5cjIquA0OafeABOxmXLOKMZ6nYGxxBupNMU/g8WbZC0KVgZOaSX?=
 =?us-ascii?Q?IU2pYyycXfqkF/n3VWB/Ddtd4yfzLjkGBcg6H+CZ0p727g1G/8dX8/8bzH1x?=
 =?us-ascii?Q?GLoLyJlhYrD6rt9jw335y78HfrRkC+mVmplBa1DXMSH03k+XxNZPVt2FsZLn?=
 =?us-ascii?Q?t1pxZnRrZSnJT1JBaafJYZSjbevCPpTOvwkyaa6kKKjTG39XvpQdwvg5vpyi?=
 =?us-ascii?Q?Ua5IXkQUptVX/0BGD/fVuXgtrjUqatx6Heg9MvJxK0BNmaHzf4zvnQO1c16X?=
 =?us-ascii?Q?hh7HJkfbesNSPgirlojRVOzOLgbiRN8s310g0rxxD6aVimci0FC6hl+USzhc?=
 =?us-ascii?Q?c7RqIOC0Nz2MNu1xd7TuGXTb0LZT1o25RjAVo30hdnp674C507OkNROc4Ui6?=
 =?us-ascii?Q?ZBHKLvdprVaFsSm3LEEH09eNywoKkd5MsiU2i81EIxCU8Hzeuwxu4NOSCSsm?=
 =?us-ascii?Q?NnPg0YQZXcc222D+xL4mPOQctB8U9xQLQ2mZi1z9PDdGeoJfO1muCIIlicUY?=
 =?us-ascii?Q?43Nz+Q9mDMoSzSWoZA0dMZrNXObt1okXr1Vyfy1M5X5WCHr1XEagP6Ojb88S?=
 =?us-ascii?Q?YgvvXLt8GGmK38XTtotVG3dYo26DZjQwUKGBhocRKa2lu6sM+hDzHsRz/THZ?=
 =?us-ascii?Q?nWsqYC5eiFjkCbr2CJV6Woe7zDMHSD4Sma4oqP0T2RDu7fgOD8cNeH/dN2WZ?=
 =?us-ascii?Q?GX61jOYjYJtciAj3zSi98iM4wQtASHwzCO/okYpum7z4BuMoHo8y0OCB3dxG?=
 =?us-ascii?Q?AMNJbOAULjmY4foduvsMNfonu9RjwGuEiRT+FNO5Q6DDY8jWtfYnk0aSGq7H?=
 =?us-ascii?Q?cH3Cc+0a4RfnK4YcVnDfRcGkvqoUw3leRNotra/fza1vfX0VQdrMkcXBQBNR?=
 =?us-ascii?Q?7aKpk+sIQ7WDmnV+qcjzuML7ZSgMRddm9hCTjV6GAjS6h0Sd+dpIDJ1ExMjg?=
 =?us-ascii?Q?7+vpJ53b6cciRo/tn/nDQmqxogW4RSLhGQDfAkNDnypPfUni2lGjNIRf57f1?=
 =?us-ascii?Q?4J0H3qpKpFrkDnQ2thA8m2Z/+y+9aE7H9UfaJeYrIk3l5QQSGLsdodUDD7lh?=
 =?us-ascii?Q?QSKSXbtzpyPBWZkq4qnHXhrGKyesnUqGaHf+P/WwCOLTwk4S85cb3DCR41ov?=
 =?us-ascii?Q?tOcMQDIZqG5N030c9fDbiO29qXkQymF9Ahk5C3KJ3M+ll+RrhVWPp/oKVWJL?=
 =?us-ascii?Q?iEw84bg0NSKy9gWNUBnbQUyDSnQ7Y5Pw0QP9rrmmn71S6LAHf7o0si2pwxxl?=
 =?us-ascii?Q?CpGlEA8fcC+YMUcEfE2WuNuAftip4VTtnexIqff1lw5QDeMFbHLyZZZRHA+7?=
 =?us-ascii?Q?RgoCU8DUkWi7Gn5JUr5b39mEytGjg29k?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wYzXmlzlU6EMUYeeGrQmWMuanOgnacVMbfwufZx8sAov9oO4M4zd0F8NQ8Lw?=
 =?us-ascii?Q?sQXk3RFDe/YHh6s7sJ091FQZU7U0fNirdVsHBk52zK2mI8dyLdokMcPpp0Gl?=
 =?us-ascii?Q?DBpprI4yb2ls35ke4i8vHrXgERDN0awg2ylXUWmsqy4WXjwlGV4sVBPq9VXT?=
 =?us-ascii?Q?Y0skyAnzdQuHjP7siTNORlgGbf0VvpO/lhb7kMBQGyaODy5pGKtnHkgdovm9?=
 =?us-ascii?Q?A0+cf3EZ65/kXJsRevILHnKzNO75R8Ct9a57C9c4j07YDIsoKBHoK724qYdg?=
 =?us-ascii?Q?zIt1mK+JuEvHIo0THUsxWB1CVnrH0xFh5EIOFG2WYSSKdzyCpYuwJm0X+Hr6?=
 =?us-ascii?Q?F3O3JbaM5BGUgomnNVsrZVJ5yGcaU7MAMZ1L2M+vV/0VJX/OVK5gJ6H5fYNd?=
 =?us-ascii?Q?FYITHRFpz8wiVcP2SFiqLtSNMZQ0H3qbNwKP3zDkIh1/CO0v2tZo/bNjZo3M?=
 =?us-ascii?Q?0eB3rWUbtR/CSlnZ33AFeYxyjnBN+hsBOHAnfjWhzp/hrmKpykh4IRHRyQlp?=
 =?us-ascii?Q?qMa+xPNJ6vYsgjw6YW8ICrzaT3LfgjgbNPs/TX+rgOeUteKXeTzqQ+RcRMfR?=
 =?us-ascii?Q?dOWwAAazV59RcsTiW0HlJNLxhHETPNWIUXsRC91mDnoyCqliSF6vjrv2kBL9?=
 =?us-ascii?Q?s0g5C02skwHblqAIfj9P8/9xp85lCkx4oA5M2GZaLNc0PNsWUmQ3PXV0ZRKs?=
 =?us-ascii?Q?1LcKJSzZRqjVP/pz9fg33iWF7eROE2o9JYB+cCVQHwjqI5wQwzLy0gPogiyv?=
 =?us-ascii?Q?SvIXBd5wNIIhF6okIb7EdJ/pktw2wf6xa8yFYR4n+DahdJXdZJLI41AkR3Vj?=
 =?us-ascii?Q?2Ad6wM306p1DsYJlP5kwnsz5J/t+bQJRPUPM+54S50+MAGr/ca1OHLzhhT41?=
 =?us-ascii?Q?U6kcisu5w7/7RrnqzP8XR92ShfLRMelJBdePYB9fft/0Gh4gpBzwq80OxtKL?=
 =?us-ascii?Q?+2w/iYUlxVGJlmS89a+stQn+42HLZYtm79QmzJYrpg8izWAm5UrADeSnHP7P?=
 =?us-ascii?Q?mSCHdc/HT+JkeAngvGQxc6ByVUAmwGJtOoPTejDdLQg1QXavx1i46B7ZhH7R?=
 =?us-ascii?Q?03P9oNpdNO3sPDBzgYaTld4Hw0yWJAGHyBCrExDlxLn1MCE5IEpRuO02+YRJ?=
 =?us-ascii?Q?it7Vy6mesauIHhb6+QquHH9cZy6/YTFfUcfkWinq0sjEln19ysuYtxiZLSCA?=
 =?us-ascii?Q?OX/ZTjYnof4S7z9908bcJA+RZcPTcfTrxvovUdJkC0wxPBmZuaq5ywp1u4RX?=
 =?us-ascii?Q?6uKtq7RlAUozJSUa7n6tnysheId4pifKRKAsil0mFmdD5WI1zC1ZsMA45BAg?=
 =?us-ascii?Q?UXAe+y3yv84tWZDj1EyQGoSHHS4vlT9umdI4Y44KqD4BeAWV0FUT+vAIkSfL?=
 =?us-ascii?Q?/lekdYLwDbcZl5kpfnlTkByRRtUigdnSIIr5W8baokXT2XOGy4gG6neT2rOH?=
 =?us-ascii?Q?dgapWStGvwbrLCtH2Alaw48c93WGWPv/yH2nzie2AHuHaP07mZTfd+sa6rDK?=
 =?us-ascii?Q?K5LSiFg3U5rg6L8IDtR9o1yjaOqyiuwDldz/MPAkxIRQ9TZ7o6IG922ypGsP?=
 =?us-ascii?Q?sF4w3NDf33eiOZpVcbRLsiE1YD5coWjYU6ErRhpI?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Hm0pbc6V8OaeYBaeKQ78gVzeJ9LLFlj5FhUgU0QymlFL0ho3slNxHh8JFMMuuCeRwXSzbLLU3EABPU7+JjPFJqHQfKH5CnwvTCGWU27RqrTvSgYgM/wX0jvhJCdAhPwmIPTu8I5ZjAO/KscMNJGlAZ5X+DrYq9wMEIco+Ni5QTlz9YRNUi42mZs2fz6/PXh0h/EukW/QoL9yaJNr1WRs7T4QeZ4LI2JyGhG5cSj9pry+jLmZymFRulahIGCxecluALL3YnEEvAg1UBq73zms9HAJ2q56y92s1LJWPCROPBtpM33/nNvC6+ui23kKNOzUt83c7smKsbVuZTI8Ljn42DnU9H545LuoH1aMgUw8bCDXlIzW+d+OX6g6u1lpruIfpQUT6r7L+eIfdGcxXJqHgWMtqavYrQ/T7SPvBtL1z5olnY7rywGbjFCwUVcEw4ZtLz7wHmiBlhjh8zPhxZ603Pd8BGTCXDO/mj/ami3eNGwyldN4b9vvqStWlddjvkUtgGPCWK1CE9cnx3zvu71AI8x9c1FM0r4TSoh6/UlYyzRdpSCm6nOTcS6+yDAuh6DxWknV/KLwON4i8HpBFBQtbIUf686MW0FmVImQ2sF9asA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d331eed8-ec37-4ff5-b22c-08de00b32ca5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 06:24:28.2684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dg8NNjxYyhxyJxy5wD6r4OWKCLyZFLGn8TZYJHGfKGjVAwftUGU9HSFq83ROLNpfTsof8zx8sDd3zhlPKdGqBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7078
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510010048
X-Authority-Analysis: v=2.4 cv=SI1PlevH c=1 sm=1 tr=0 ts=68dcc91f cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ZeJAe5Y_Uh-So5GveRoA:9
X-Proofpoint-ORIG-GUID: NYjbLYPYM3oOpJwv9aVQydckTNq0-APf
X-Proofpoint-GUID: NYjbLYPYM3oOpJwv9aVQydckTNq0-APf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDE2NSBTYWx0ZWRfX65sya6hyHPlL
 LZbJxU0U6yONje2NTjW0uRxfoq7ss4a3pbjCIEgsxX9NpOr0MEM+TESTtNzCgxqGZS994auMsJK
 qwh5sOjTIyZLl1fKhL6pbhopQEr6/1gTQJK4Fu1T4EKtPxqcTRdw19N6kRAaY0SHMfjagAMNKU0
 gyELePFXVgOTmUWpJgldH0Ixjkx4C+buO+9CPO7tA2GjDW8T3GfO0GaIzFf2O3lUTYuRILan/K+
 k8GhTCmC/lXrkIz+dYX09kW74whdOVTWyZ2ic5NpOvHfWOcKgNGKDB/oAWrJgqTEH5bTnm+JZDV
 47243B0KawitjdWpST384sx6xBOf+jT2WDt6yZT9YI5H39/uisdP+QUpl/9dbrUpSBTWc0R81Lm
 Ep/Cx9BTU/MiooVwmDpUqhFYr/wXbA==

From: Eugene Loh <eugene.loh@oracle.com>

Also, add some compilation flags while we are at it.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/triggers/Build                         | 1 +
 test/unittest/ustack/tst.bigstack.aarch64.x | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)
 delete mode 100644 test/unittest/ustack/tst.bigstack.aarch64.x

diff --git a/test/triggers/Build b/test/triggers/Build
index d49b996a6..4ff5002a8 100644
--- a/test/triggers/Build
+++ b/test/triggers/Build
@@ -236,6 +236,7 @@ usdt-tst-special_PROV := usdt-tst-special-prov.d
 # ustack wants no optimization
 
 ustack-tst-basic_CFLAGS := -O0 -fno-inline -fno-omit-frame-pointer
+ustack-tst-bigstack_CFLAGS := -O0 -fno-inline -fno-omit-frame-pointer
 ustack-tst-bigstack-spin_CFLAGS := -O0 -fno-inline -fno-omit-frame-pointer
 ustack-tst-spin_CFLAGS := -O0
 ustack-tst-mtspin_CFLAGS := -O0
diff --git a/test/unittest/ustack/tst.bigstack.aarch64.x b/test/unittest/ustack/tst.bigstack.aarch64.x
deleted file mode 100644
index 735f88c35..000000000
--- a/test/unittest/ustack/tst.bigstack.aarch64.x
+++ /dev/null
@@ -1,2 +0,0 @@
-# On aarch64, we are able to handle ustackdepth beyond 4096 so the expected
-# BAD_STACK failure will not occur with this test.
-- 
2.47.3

