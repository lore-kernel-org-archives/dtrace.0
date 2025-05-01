Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF731F130A
	for <dtrace@lists.linux.dev>; Thu,  1 May 2025 15:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746112109; cv=fail; b=lIlmJaevjJ2N4KIFjJbStf6iDxE3ivFihdMVv+vK7bEOmWq93VC4dC5ZMhA5mfbDRSd9oxW3ochfkeboFQTjNjK3ldW+xvlA0nqK7BE7/q1gys6v2n3V6WUd4oBkeFQYF2oVB6Ge8ZMqVaLPwFF1cqoyJei1CAIIC+enAD7mLgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746112109; c=relaxed/simple;
	bh=ch4brsZfBGM/XO7DzjreNI8n+mEEmjyFB86tyf/iz0g=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=jaE9Lc53adnMZo5mxEX2xHkBouNjLfk9DfJUBAFIT8MdabJjcP7EGXnAWdjNJSD9lmlLzTSSmE+nE2s7uS8aWE3YDxr3VLiYYOkc46ZuZW9/oDds0YhnqfqnUEzTwdR2/+62SnITRyosDfhQzM0M/2rxLdj8Zew18uw2pGmD7kU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aCDDtSC1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gq9DqMcx; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aCDDtSC1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gq9DqMcx"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541EtrSA027596
	for <dtrace@lists.linux.dev>; Thu, 1 May 2025 15:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=gs/ZDy53o/zWynhzvQXBKEceZklO+np5+RYDM9ufNWU=; b=
	aCDDtSC1/5IJzF95VaoUq5S79UQ1nPss3/rrvaM+hXbRqY3MHk8LksO1QRsbyfvB
	wrPK4Lj5a64JTHovynHSjoOFLiF9cMvJ3PBa5HlIXf4tynOPnuNkInUuJBHnTyqC
	Ehc9oeUSAjsxI89JJfDrwi8028ArNrl6vu4sma6xwzH2mLmDfKXUVvLQpymPtezZ
	5xSHpJjHtqEmNtEmPOjz4Glkhu0LMgin5GSSyp2HQkfmHdKL2EcH7Lxbe5LJDg6o
	h3lWuSEqUin4H+tyc4Nu3grIlX/lTqUQLKDBdduVSOWdn9Mo0UyEij7yI8FtdNHD
	IesRnPKccHrjzf806gH9Iw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6uku7tb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 May 2025 15:08:26 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 541F05Z5001325
	for <dtrace@lists.linux.dev>; Thu, 1 May 2025 15:08:25 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazlp17011029.outbound.protection.outlook.com [40.93.6.29])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nxcmat8-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 May 2025 15:08:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NxkZsopa6FEyqJrlkBA4O1ZkpJ2B5r6iRWF1N8gkuIsT3gck+1UljsyA3D8raTI5yvYsIbRKYkLXql3rngFlFTP5+bVO/A6UiY+FFbcz2SKcfPwul7Mryu0vXnfSbObL+lakHXDI81t/40nHxRyVPeMQADxWPG5wGyjPd6fD8E09vm553p5Ezb7Hq1DwpWckBZ+cBrSAxANSCpaIjCW2OkSLmlPPEwfkrQThvMFDcuLi80BzckR7F/tdSKhFPPhjwTZ6gADlKy8/TSCi8RpYLtBoKIA43ZXSFcSDGn0TvhU1+GwQt7OVsoKQ0V2XAn1Amb9+RaHdYe56NqDrhqZQKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gs/ZDy53o/zWynhzvQXBKEceZklO+np5+RYDM9ufNWU=;
 b=cu0UAqxwn6MIujogIf9p4xOtBerA3wQCGuCUEuj4zmogowjAWXJ8Jbrm10aZU6eJ4N9GUIim0abKmdDb2G8OMDG59TzeyiY5SiQa+9CuQhrKuooLSyVC302JNyphCqqAlD0ch6z5x1v0f/tf75+FdjfKKoECER66rmggkflSgiZHmzLmtd1VMo0Bkuimdc1Uiu4RwCQV2DHBg6clgrbOsAQzAGHdEdZ/WaZtsdXE79uuOiYr/lzqcAOPGjBsEckEZI2E30vhZ8yVYQpL8JrjAqgtw9qGxZYoFdQ/r1/nGNm9kY/OlRn3BqTLbRWjNJJ4N8pzNYRIu3CsMeVv+JjOTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gs/ZDy53o/zWynhzvQXBKEceZklO+np5+RYDM9ufNWU=;
 b=gq9DqMcxBPUtZvcaUzHGj6tIr1aWW9in1yGCLgqCAh8mnSc3kPc7clvwXV7Ypsefq4A39PyW+weyKZ7qq5d8pnL7drd08vlp4VthOIe9smBqGPzXMYGBmz0eUnd0/4zFIz72/iZYqelXSWc43pH+zNiBo/vnOqtWuSOyHwfjUyk=
Received: from SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7ae) by DS7PR10MB7179.namprd10.prod.outlook.com
 (2603:10b6:8:ef::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 1 May
 2025 15:08:23 +0000
Received: from SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 ([fe80::10d5:90dc:428e:437]) by SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 ([fe80::10d5:90dc:428e:437%4]) with mapi id 15.20.8678.028; Thu, 1 May 2025
 15:08:23 +0000
Date: Thu, 01 May 2025 11:08:21 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 4/4] dof_parser: remove pointless comment
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:208:36e::25) To SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7ae)
Message-ID:
 <SJ5PPF7F7BBD994D8436184B5792303EB77C2822@SJ5PPF7F7BBD994.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7F7BBD994:EE_|DS7PR10MB7179:EE_
X-MS-Office365-Filtering-Correlation-Id: ae9f2c61-b0cb-41ec-cdc5-08dd88c20451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lVMm1sxcpzqpLg5Pim4YZd83Hc041Q6u3qnfsE2soYiSeJAClJZ68jL6MSwj?=
 =?us-ascii?Q?5M26Kzwz5aDuJgehNdJtWMcpH8FRQAmgl3HsCgAWuulj2RD9yxTOLyaDiDLN?=
 =?us-ascii?Q?FiS4rGaD+prlsFK5/oQmXA34AqYXIGtJLfECn3GxvxJhWMer/8u7OjXMha51?=
 =?us-ascii?Q?Jz/KVMptCbb20A/dGcLGnuiNvdQWewAp21mqfNMwJtDrGEBzWjulXf4v8kw4?=
 =?us-ascii?Q?wIQJvDZZ87IAnvOFQFyP25bYa+9Dr3tgeRET+tzAZQ5VjENQXWBza+bSy6Ce?=
 =?us-ascii?Q?ZGWsyXfA4wMqqmb/FubBQIA6+VUVVKfQEgbphKtJ4Gggdyqq3dq2RJKhl+RV?=
 =?us-ascii?Q?60k2VUEzPN2EYqXCpcA5mbqlNQd50Qfq3Kr+lYo1WWyOxUsD2VpvFiY1+CoJ?=
 =?us-ascii?Q?YfXRA+Im4eH2Yz1ZG1emqB/tVgsp0cmIVM0rIyDB8rc0EOI2df7Z8Cj/NA5s?=
 =?us-ascii?Q?9Yl2IEhFmf2TCniguaXYxnWefIJDUy0+cF4qBAna9yzx6/vbWYvb61VyLkKI?=
 =?us-ascii?Q?Qn2ENKmiAbzlwsU4dpN9NgXkGMaXO0Wd8/dByIvIsmvjrgyvAp90Y+TXD/Pl?=
 =?us-ascii?Q?DHxbFBWUUTHxy6grAg3HWSzKELf++oo1xRnWw63I9pKk0HqcQZAab9SP0kCW?=
 =?us-ascii?Q?/jyOqW5O1YbNmER5ARc2O9WBOvg5WAb9xeCTANRluqlyG/a+yjH1KSBw2rHI?=
 =?us-ascii?Q?81/QKJ8JFHuLGYPsGrGsahNPxHev1zev5e6q3qblLbr/ltw0R4DgOVq97hxq?=
 =?us-ascii?Q?ppnmJxR0FDa5ys7jo1y0H1ki95duNtsL/eRxSp6Q4QIBX4y4/MPd/1vNYN3r?=
 =?us-ascii?Q?WIVF9gO+Ak14lbo/dvdgFD/1lAg+JR4QyMdOxYqhFETIiJkhTC1fHRuFJ6Df?=
 =?us-ascii?Q?z6vrIuawgmTQvWA+g+OpDL5t0+zmw743Wwp21m/c91SId6HrjHRH0ys37NUo?=
 =?us-ascii?Q?1ALobqQw0bPyT64h12IK9nE0h/8kozkuRT/5HDrbEmz5CgmU9Zat8cruneYB?=
 =?us-ascii?Q?xOqqhfjFB60CB8BqDRr2f8RbYRdB/kJeVQiYhaNDHwTCEz/+jJEWit0yUPdO?=
 =?us-ascii?Q?8kuLqsZqwWfXQEJ8I+IQ/VZrBPQuJOvmTlVD/bhs5yibFOQENNQG/ZimpsjZ?=
 =?us-ascii?Q?vzU/B0tZXLArPDd1S/6HDX6CatkH/ar/rV5qScZ9H/KSIe+oszYRflz5NEaE?=
 =?us-ascii?Q?U33V2fdnIq1/ehgNFPGPWRY2U9GPvkeDKC4Bt07kajzRojpBPIuy8/LB6gye?=
 =?us-ascii?Q?vH+XALfeeIqSfRX7zefEK/g3BokhOIKBaFE6p8T2iTZ/ZhJ13jFWtr80dTkx?=
 =?us-ascii?Q?yuu7XlhB7NxpB2s/x6xJB2pdjRX3umwiY0P6tnlzTwQ7MuEqEIfuVp3mzInL?=
 =?us-ascii?Q?t3PuiqOVmPul6Iu7ww6GqRcJpcNO3YSDIXmB767CQtOjV3RgyVbOpI5+OYSC?=
 =?us-ascii?Q?cdkivDIKJWs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF7F7BBD994.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/7yUPDL0NC5XoSTJS3I2CeUjERHgl566SBMhgaHGC+FJBKkckBmnQs0hORmd?=
 =?us-ascii?Q?JqTvV8aZbI9e+Dv9MwItF1MtkQni0aXU07yWAWjdEeI8B5JO5Nnjvx+z2U1b?=
 =?us-ascii?Q?KWJ25PZDp3tmCqr4gbwD+WETqOwgl66x8GKue0WojSURjJkWtuq+lkQ8A6SW?=
 =?us-ascii?Q?Bzf8M2ZaN4qxk9JI8b/DmeRvNacPNFh2hNI5FUmoLxJWttjDH/EisbVsuq9G?=
 =?us-ascii?Q?GO7Fwan58E2gp1rJEsSFci50ePyYyPQZXvdjRfPO/SmC916Ai1t7gpdYe52K?=
 =?us-ascii?Q?ma01/QHa/DeccDtApHWDDD31ptjET+1PMCVF+KRz6brmzLcywImlEKluaYK6?=
 =?us-ascii?Q?zEr3UzNa+YpCQfd7ptjtb2+yy2rtkotwMO2m9YsWxTOxiMLne7yq+y+RbshI?=
 =?us-ascii?Q?2lnSf1J/KobDR6TmuR86u/LMrE8kIlx/9DYgJN8ZnyI1Ku4S+6HnLzcAc/fc?=
 =?us-ascii?Q?kPUnn5BpFG03MlxA6iX9THebfq81L6NXo3uH9cF2toI+5KjSeq8L/VYJmHhq?=
 =?us-ascii?Q?2w24hJU5wfbL9y7A/bU7uGWtkeJ2xU9MMC2ps95OL0v/Zx17VqOjAilCj2Uu?=
 =?us-ascii?Q?XkBqD/4tXK/NNSuIsFQMkR7z5gDA5Lh3ODPkf8NR4Kh27lWJNsaVXPFIE3yo?=
 =?us-ascii?Q?/RcPY4FQ7vFCK9y7sP8fIKXKvolvsdtINIJan5Wes8OF5GQ/qn6+tFbWDp0P?=
 =?us-ascii?Q?L3urUp7gbZ9+BuaegJ8AqeGPRUJcNCUPs6iD2jqmdw0UeFqt8Lio77ivOUme?=
 =?us-ascii?Q?VCnT44+/KepCM7vTeX4/5uH8GR0QfkFQaDbvYxTN15s0pjVK/GlsfxtwYstG?=
 =?us-ascii?Q?zRVxL+5v2ydcB0w8w7ZlVlpZ66hIwlpmj9qyF1F4oPRuTb+fIS+B8azWzbpx?=
 =?us-ascii?Q?aHoHDcZG4LFWk4dG3/dtfhwqdf/Cj4z1sCI9mrwUdBUj/KSm7YXrW0R6NUB+?=
 =?us-ascii?Q?/lkqN9lMsDSjXdsU12Z2d1zjkasPjIFmr5eWWx+/J8eVWyrB0djpBRL9p3CX?=
 =?us-ascii?Q?JN1u6zc57rF/yv4qlXu6pngmUcRpNHcmvN38b3fwPOQiKmxJ2A2lJCgM7DhE?=
 =?us-ascii?Q?rRDFNzT0VEcWK89Bev9aor68RefabZE78PJSI7gIHVwz8c0xx52d4oaQie+t?=
 =?us-ascii?Q?ZWLsnXYdE5n3195bZewJV5ppL0KjJyIkv7k2JZt4e3HY6kvnt0XLtGQKMn/W?=
 =?us-ascii?Q?b8pygSLg/ozrgXd+iKG2y5SrEVQJF973Whws3x0KItDc9dsLsd4cKWFNjUx+?=
 =?us-ascii?Q?BEeIT478cDUOWSfvd7FRBXyiOrBUVyYLqvr006Au7BM9nZq2Be6DTniJrYrj?=
 =?us-ascii?Q?MMfp5cNmfq1mfGvfWdEgMvsvqTZUYMUGyXi12pLJN2i5Zq5TXVcnUkCK2tDb?=
 =?us-ascii?Q?yCKoWvLOI+eiq6j2mVjRoDC1LK0184TfNjUDKe9wUau6P6Bugy2Ny2KlKN5w?=
 =?us-ascii?Q?IHARHqwMWsiOrMfwJtVaGJXN/uYTxKKultjy5y6DlhpuiiQO2tXqrfWaXco6?=
 =?us-ascii?Q?KIQDwkxl3oEKxiIH2m2foBYdNm7tKc6Sibj1WrVLSC++41GPhgtVn5hiUgji?=
 =?us-ascii?Q?8K1sDCHl3awMdfBb1SrwZGTpvh7sdD+w/ik8EkRTpgCGQSoC9QX2wXgQGmta?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JW9YjiCTFlWGn/Zg8wPYE+aMdrjt+EmzCCLwF+VeO5SdYlwzLv8wJJRcEqnxsNCMQ5Wlm/O6ei2Y54TUXpRk73N/VOlDhPIiGX7sV/7kiE5d9qD2SeH5KvhU0YVq8yDW+1jyGvKHVPBCIGNXmvGwa6GONoVmsnp8qOFCiY91T/xLVMnhcktJvzFmbGaFALe5I/ucqMsSFoob9FmpSexoOCK30YwUYlBnV86HYUIbIfSgwmi0ebQxOPcG+ponQ38oI5Nv5TXleKZ4pM2yRbI3mlCUAI1aI9eoPlKNWYRdI5rZsiGiKHUJxlrjiLM4P/OLCQwldBmJkmD+sSytEyTCHuTirNnlByKGjJXq7fdC3myH47vlA22DRTdLYpbKkiV/qAwr9gkreHmNUCfrJ+LFKl47+dcs/qMEMYV6N8+dPl5kEThb90ZflrgvHineYNkHELGPonFo2pMy1FZJDtJmBOkStNGTmR7Iyezjti/QxAzqGit8sIn/Uabn64qUAnD5pU+dKV2aRmH6KKfNSDlighns/yVuQW+e6g7Lw1tperMASTADWLOVYOLmv9cyn4HJGzO2PkYVdxa+i5huClJdX4OWp5pLi6fMGtPPBttXQ+M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae9f2c61-b0cb-41ec-cdc5-08dd88c20451
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7F7BBD994.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 15:08:23.4916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y8uYbn6Vv+RePSnpvyCvJwMc6qnbOfzc0DOi34slkfLUuz7IjsbfJCvFG3y3hDbn6/YTZdg6Dj+NuR1Vx0CKULh6SfoagTDCJa6uCUvEWvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7179
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 mlxlogscore=841 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505010114
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDExNCBTYWx0ZWRfXwrQfFmaBbafx BOHhP7iU00ZEZAtSvJhPnY7/4IvNFlgMFHaB/KY2D2LSlvqaldnW8Xny3mXFRH1fKzptVWWcsVy V+Pt2zoKD37hWpWwvbFfCsTV4Q0eqHndzuQLBS07Gb8rLesAZx9iMm5dktKty1j7otsM/u9IuJI
 tZvULIq8HLYHw3k68Vb2oEul0c2hb/J8ZClIx7cowHzmhzVmDpRTZxFmXsbXI1hjRBDTmmlEHBy fM8usnrHgAXu8f36r5UZeqIokjPOUKIxKJ0dBZqv7RSvAlFByaPoElFWVBIi+/w6UyTZaqjCXCT N0VLgoGdUFtk6xFjM6xwrLcMgJuym6SUfn5BDMHGrmewD8nkbjhn+pNypw3UXbex1TBjr4upwXJ
 NPKXzEE8VYYu3mrPLV7OwtVgd0snhxs5QrXwpc9Mi9hLIk2oM4a3IaN0tZ+qWA95Al+WgwFj
X-Proofpoint-GUID: CUK3Lbc9RIhWozOrrQBa8_Fi-YgElhvj
X-Authority-Analysis: v=2.4 cv=A5VsP7WG c=1 sm=1 tr=0 ts=68138e6a b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=zkWfoiePm6r8fsw7icwA:9 cc=ntf awl=host:13129
X-Proofpoint-ORIG-GUID: CUK3Lbc9RIhWozOrrQBa8_Fi-YgElhvj

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libcommon/dof_parser.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/libcommon/dof_parser.c b/libcommon/dof_parser.c
index 5b3dde36..58bbd604 100644
--- a/libcommon/dof_parser.c
+++ b/libcommon/dof_parser.c
@@ -89,9 +89,6 @@ dof_copyin_helper(int in, int out, int *ok)
 	dof_helper_t *dh;
 	size_t i;
 
-	/*
-	 * First get the header, which gives the size of everything else.
-	 */
 	dh = malloc(sizeof(dof_helper_t));
 	if (!dh)
 		abort();
-- 
2.42.0

