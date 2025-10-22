Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB1B26A0E0
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761103415; cv=fail; b=CEPXN9V48a9CB21sKvIhiS0G+okP2xIYtyvj7RWTd5h6j+7+t7mSUJ0q1IQcjgNihTaRfvd+CMZspSLXpt4i+5tt36ZDu8QAVyaU7DBcbUHlSKW04Savj73yiXLuu0WKUxZkdOYCJlPUiicRIAwfZ26bZORIfE287RSeqGRrwQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761103415; c=relaxed/simple;
	bh=row8gt/JxJde6n41DYXgNWfYvIUtYTTnkRthqktYooo=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pFm9BkpEKa8gULcXbmBp0k78naYpXeUcLjUSKgUCWZsLxG+ncDuN4iHF/cvmkR/tpR/wh9mTXF7/+/8+2/N/GHmAPgnU4feFt/hYo0CrtpHwGk6BfJwF2ZAdUebv3T1YmuI+qa0X2M2BfO+sCTGgioiZBASPhWWU3aXeyV6WZ3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MmSt82cw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dat6H5TT; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MmSt82cw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dat6H5TT"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3NCd3032503
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=k1UdiwyWR4uWKbzbSc
	8mIObnNr540wReWDheI8u5gtE=; b=MmSt82cwKjSHlrFYnQzG8q7SnNXuC+nuqS
	xOr1OdF9GKuAJRGYfm/0zsw/XyU74pZz92yvqb/Fq88a06LQdD7EhVGSqdyPA8Nv
	rzHqSdEjrubXYhmubhCa2LwmVpim7W94XjU/OpPnBB/N4Pd93csEDE5H/Yanb1YV
	xk/DPCGGBws7pPnF+Lo+yqQ8ZDK3CiJjhZm04sxGawIX2s3Z56TRW/aBFHB97qLa
	2+g1txgPWdxmM5afup7OT4rE8F5jM24/X1PY2Q4jgOIoFB28OqvmpYm2BgZL3VWR
	S3V+cCBqxTwPi+r1ZukCz5lT33dD7txLnzAEGgC1A34V5RVAJMUA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49v31d6xxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59M2d3Xg032305
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:31 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010035.outbound.protection.outlook.com [52.101.201.35])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bdn3h0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YsIhE6VMwSSQbJzPsD88Sqge949MDyJuTj5CbfDS+xZtTRNqHVtTXxN3jjxvHrXj3BkkrkisFwWrD/LfMwora5f1daFhtbGzt7pCEie5QMv5Sfn3VuZkBE/I/78ZjfUdVCs6Ru68u1FI3qnDkY2tKI4w+Vd5QNlNNd2IAXMiMsrh+r29iPaBtdoGt313Rjq2c+Hqkw3+qZan6x7KN5PrNrTFiiciOQSpLrWzvyQMVrIf3Vt0PExQQAqSoEFzlAE+Lw6pQr4GzsnTOAAu8EZMfA0VDEPsAdeYGdW2d1umM5MdLScJIZey7OZxqZ2ohaF7Ec8KmQO/Yui2/FQeVrajRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1UdiwyWR4uWKbzbSc8mIObnNr540wReWDheI8u5gtE=;
 b=m7x6m4t4gtw9f1GiUUwPqiRGgG6W6XB5PgKv2ODZERXmAI8TFAY2R5d/mzMLGxxDaQUWETwqN1tUJ12XSdnGEkrdKVNrqJfdhvQ0Y+vuUgSHDBCiFhkiSemo0JK83nQU/Tj4HWOBrFbYhVLZPrx537DCKrytzPI+gaG8x1oinCCSxuectjjiCk+V8qPDtwXL6B4Aefd7FMqe+WXg+G0S9x4a5+xlnNqryusxyo8eDvcW/vsq62hqpNjMnd3EF+kBgEim9ejGr76+7ciZPKkJ/raw3kuQyDSa5SSr82joY3eTkTEsAAxbXseYyYp2oHl7Ovs3lTHHCC33IzWBVI+tGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1UdiwyWR4uWKbzbSc8mIObnNr540wReWDheI8u5gtE=;
 b=dat6H5TT+Tf85TGsFI6D8XdNNIheJaZxV3ZpW51l5Ccj0rUgjeBE06AD2tCgBJa3h/hrMehkM5qHGcH+6bQElOs/JQN+pQGP0lqqiLR2hREj9Tsc6u1BaREsGYHzZrtKDxLb2McVWIWUDtacTI4OiQqz2T+nDe5KpGO3FcFMw4I=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Wed, 22 Oct
 2025 03:23:24 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 03:23:24 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 20/20] doc: Add rawfbt provider documentation
Date: Tue, 21 Oct 2025 23:22:50 -0400
Message-Id: <20251022032251.2010-15-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20251022032251.2010-1-eugene.loh@oracle.com>
References: <20251022032251.2010-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0270.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::35) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: 991f00b7-31fb-4fcb-6e6b-08de111a5b89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LXFe6ekyWqsG8xia1td3I8np4owNjN9F0NEAcWD+E+CnOueOTUZYkjdZE9Yj?=
 =?us-ascii?Q?vTayJaMg+wQbopddWG/VaB7VsXFbfbr0nHCIjSaGHs2qNaRAOEAW5ccyxr7v?=
 =?us-ascii?Q?LdrrA2BhItoewhcfvEYBenu3HMMOFYJGaCw6O5RSXml8rmcroah+SMUA9dK0?=
 =?us-ascii?Q?bHY1Em7Cl2Uk0Jqam8HwT1ToAkvLIEv9B+lhpu8Ti0njRTisgx+xS8RDCyvW?=
 =?us-ascii?Q?5HtkA92KxrIMXajX6S/YG7EV1LTpHFEkR+D0GNE67/GJD+7sOKrjfv5MgEhc?=
 =?us-ascii?Q?uZQBEczCU2w/15K9Zho96Ocfj/8BDaD63zmQm9XEAJ5mrHZmt0SXnD5JRaFl?=
 =?us-ascii?Q?+4/NVNafzAnGiY1VeGoTB+/tjuCNfPZO6vYXbV6ymLB5qwOEqag44EONJpfT?=
 =?us-ascii?Q?kkHj8ZSmEGuMphR5OXlnRB2wnDQWxuRHaPc/5yQYmALUIY2f7t6WyNnOR9Bg?=
 =?us-ascii?Q?3JTFF1b3IpX5q57nkTKIzosb7s2VkPZ01V4jV5/jl5Jq/y7IMqAdcocqL/V9?=
 =?us-ascii?Q?Ne+KyoRktm3jpkhjKq6VkMC/YQyv+1Gh8pTj3GfLr1/baZetvZ2dgdSqJafn?=
 =?us-ascii?Q?wGfU5zI1CXREmwX9sDoxHE7hvkmvYIp/u2hso+eLxEyAkkTMKoMv7/UhAxj5?=
 =?us-ascii?Q?D4hBqyklvB9yDNLtZ1/PANHhG0mNZWmnCbxUm/EEQw3yIacjA9FVN8xnFZdd?=
 =?us-ascii?Q?oP60PuEkiTE/kK1jOo7MI+BXVN93YbUZZcTgoM7ycWdY+yVsewFu5cXeF1lk?=
 =?us-ascii?Q?s4Fi6yeGL1cLdETxvSiKmk+nSpIs8qCuIRzTxvRlvzr2ZogSmmpYhNXqyxfu?=
 =?us-ascii?Q?lNHb7zUpADLsLQnnudXt+2A2r56lURhE+z2Rs3KK47PUNAfonBe9cUwHd3Ae?=
 =?us-ascii?Q?aD9TZfwu3mmFenj4f1XPc6RRRDI9lvXrY4DgnDud/fWt+q4gJFZyktWeq635?=
 =?us-ascii?Q?i1NWfQ1qUuGEbWz4v2Te0Fu7p+/H1QpIGZschq3FTuJO8gP9X1JLpv/lj6a3?=
 =?us-ascii?Q?HrPLAbqKuYWZvJ/JbfqF7YZ+2UvFEhKKjFLOEA/vEjd4m//Q7I9swWge/jcn?=
 =?us-ascii?Q?DG1P5EHZponNNVvCv9OZJO1m8IYrbdfkd+KQzaDX6FA3Rl35jfPevk2tc7L2?=
 =?us-ascii?Q?soyqhSuN0hbKO6zIMQx/4UzxJBE1czEbCShHB7ntYl8qHPdJW5odSiWV03Nn?=
 =?us-ascii?Q?EZI9qtQRYi0mmuEmXYkkgi44ADD6xfNqE6593mMgMSMGwtxab8xmthturtLH?=
 =?us-ascii?Q?vNtkDEpEwswc/eOF9XFR5lofNlg3cU1YT+zuS4LovIOjSGtFcGcRyujAI28d?=
 =?us-ascii?Q?lvi8QVzHH61w8vOMuHZpeEGuUi7NlkffkSo6AJhOVaD6FtjzL8rXSqfZPo89?=
 =?us-ascii?Q?krpROLer3b+VdeaKxONNtK6AKqI2G2ztLbJWBgqwRJQ8l3xAL8XhHufxi//X?=
 =?us-ascii?Q?HRQTCnhM0uvaX2C+xbL1ninu7tqajQVu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t9mO7eCkw1rW5xCk9XNCLfBbyRDKJx9bwghF4cmk40MlwQ35AFd6qwFcVfUm?=
 =?us-ascii?Q?VTSCIH4wR62UYUQH/CbTCYrpqny6S6e9KI/kh7jZtUH7MtGbrm7zpjIMCYFH?=
 =?us-ascii?Q?i0r9BZLKXXQvQqh4QzANL+ZLwOkUviPbv+iWipeBtyhwRpbd3HJZM06GFiDv?=
 =?us-ascii?Q?S2w/GVJ6STYlKKTANv6nbDhedK5/bhBZMdukIQjF5nUTND1lz+5bxDXL/STI?=
 =?us-ascii?Q?iar6QMEpX7gUVEVH6qFeMyWN1q43WsbLTY9sd/H8cncMoP3D4uRGE+RQ7Rsr?=
 =?us-ascii?Q?zoExrQLc82iE0MLvwe0ArqbMQzSh/cfoiMzvKIpQbYNj/mnoDEua9JcI8aH4?=
 =?us-ascii?Q?ToiYDGSpnWnWt3bHM6bQYQj+2+FT69SIbEYYesuvAQv1KAWwVb4yee96YypU?=
 =?us-ascii?Q?AEtSEZprw3FvzUVUEiFRo19q5qc7mU7rmhKAeS+oR2NeTn+wWeVrJ7DxKpAo?=
 =?us-ascii?Q?pkyzmpXChaquM3XaCig9nn5jBgHnLNI4NlBLrr5vbqc2bzMwxAN3n2mxR2wr?=
 =?us-ascii?Q?cOFY0+bZNSz/7ZDLiIHqQFsLJwIhH1AE2ormNinZocEBQiHz66gcJHO9SP5X?=
 =?us-ascii?Q?Daa+CPdrp6aZG1ZFeebXpEsMYnOqpYCKVUl2bQhMq1vFKdLPx8abDtzdK3wk?=
 =?us-ascii?Q?mueqHukMZe6+aP3oQ22LAwfsQm8lyKpjM6PXcttGySI6mM8GApqmcmqjWj9w?=
 =?us-ascii?Q?AeX4Cw5f/VqsVj9A/nL5dhkNBNpZrVBxyLUFAAX8+KGLxWtLuMzyspzQp/nu?=
 =?us-ascii?Q?zCRovFOQY7PSGS6+MBMQB6imqoSJRQFVTnKBOCiTnrKxSlgSl7pobdryIj89?=
 =?us-ascii?Q?7FeevdPjcreHcs90bmOzIMw8d6UzQC5yUEz4FwTLTl6PaAEiSxP4i9+cYSkO?=
 =?us-ascii?Q?6K6Nh5CMAQU/Uwj7kx3N/rkO5/jxf5bP4zPTwDaQZHO4NzEyI3BI5oT4DPyY?=
 =?us-ascii?Q?Z3g7EtSH1GaZF6SYypC4TjgZEyP2JeM0Fh5KP6E6Ko7xmNHAyaKGYwUPPxuj?=
 =?us-ascii?Q?dVit549Ov7Beir0SLHDbRiEr4eztNS+Ul1YZLoI0hDX2qlpBIl7msvsoP+E+?=
 =?us-ascii?Q?XkAM0+SM24TnT0ZFTiQg20NHHVshdU4VclGYQ/qbZyx7sAIhfcG86swtfi+p?=
 =?us-ascii?Q?IpmN1Cp1zbDWC9skl+Y48tHuDRERPvuWDvRJtqp5VcYh4WZm8ADZTycgnD3y?=
 =?us-ascii?Q?h4+nx7G+dxcP1swHl8gZ/8UUVs5PgBwAyoOr8JeBHtX6T781fyWyqx0okkd7?=
 =?us-ascii?Q?9Dugl/7SSUYlXZ3VktMyQOmnQ1S+EtUzMRDy2SW1cuu86HALiVeosSOD/pw9?=
 =?us-ascii?Q?W7NV7svid8juF8PeztoKqvcT0fha2F2zrsWLC7SKMGj0oW+a9sGCeaqrQl1Z?=
 =?us-ascii?Q?2LKAr0AVF4Df58cdGe89ZF/dis9C8ChXXNuWp9O3Noqeq5+NS6hBc8q4j6Z5?=
 =?us-ascii?Q?XXSZLMOP/PYW2m2yelcnJdPnJSAyuM2VXtAxJ9l53+zUvCCECiVD9cCQuUj+?=
 =?us-ascii?Q?r1YkEuMxnOWOF3X/uO3Upt1MxoMdqnRr7bLDlyTptw7Og+IkqJUWvxuXbiYV?=
 =?us-ascii?Q?isbPTSUcYxxZ5a58loaOYD1MnAQ2NfM5OXpeohe0?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VQLgtjBoeMq0735xhd2p7Fo9aSPjX/71jiYHcNm6bprMMAqXUh6DbHdECW5yQ8wTFDLV1K390KS/91ovls2z29obsp2+PjAGFIjHHlOmTUL27zrGHdqaawuFPzY4QXCwWVEQOWOFFffzZMJjRUGj126ZjbnHIRZ7XLvK4gabWwc6GHNWaNrjfE2lLqUIaYYoW8fyGoPeqmn6cAMjUxQZjFXogYfLQjejwCE8kO0QURLGg+svd1VDoGFFXFvFVssny3BIp2iG4EpmM533GQSW1JLsuaqyn2xLoXOQdmL2IR04M71H1m5vEUj/c7wQ7Gel/pMc0rBfg//48OGu7eTVwzsPY5eqSkXo+du4WbI8ASV6hLV/RR9jDfO0tC5eC19iIRFX9jin12HrQvZ23uWp40Q8UQdrrQsp8EUwTEnZUa6BCcBIt+k+1zxM0OGLVCFGNWFAVSUPWnGkoHBj02TE3YUexjrtsZC8+sWa8cl1QsKpX5/iV9WvF+HgUnmoV1/fd1ScF7o8a430BkGz8Tyl1x7avBpJJ4ZcoPZ1VOH/gbzuhMwmWpBxOwqPgk3RAa+LQmXL+Tf+r9FxSIPERgmolSsSO4+4y3280nE0NMUsxn8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 991f00b7-31fb-4fcb-6e6b-08de111a5b89
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 03:23:24.0004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DDKae84SGCLrQPC1DyVzEyj2Ivjscij7ix+VDRwxb9742ZVL4AYZrtqKueV/jWMPzCZJe1Oz1GHFuOj/H5BdnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6974
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510220025
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfXx+ficw6SRK5D
 jZgdw5+8MWzldRGkXyz2q6UK9Jmd8ZIBtsKbTTx7TdRyc6Lod8nyNowFiywTqx+YEBcJrKEVscI
 7oasBgrH7pod160t26Q99dxFS66gxCK2h6E8ylgbL0ML4hVyCjed2VO5o8uf7jWe4RrLowTyICT
 CCexVgEONdUJ5zideDBVSjwtr67Ogk4P2kYuBrlTSoFlB7vtyctwgaBoacPpnaQWWyM6YFOmVGy
 QK6crgu2qaNh/sguxcIe1FRW7S6vlQcmKmgh8uJ3FjTF6irwejotarYxf33D+X+MUyNHg4C1sfg
 buFvlSX7D+AUjeCCjgOxhZ+J2xgXwBFS/G/YEuHglgz5qQPCndhtuij5Ajt5O58rUpOw7o1B1GW
 zWt1PhyWPCgIM+VHjLlylt0fZOU/4pY7zKzGtY+yfw9R+oU5INk=
X-Proofpoint-GUID: H-OlLNJ3FdOLD2OwaCN4OhUDZFAUA8q2
X-Authority-Analysis: v=2.4 cv=KoZAGGWN c=1 sm=1 tr=0 ts=68f84e34 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=v5vgSPytC6PihjlyA-wA:9 cc=ntf awl=host:13624
X-Proofpoint-ORIG-GUID: H-OlLNJ3FdOLD2OwaCN4OhUDZFAUA8q2

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/index.md                        |  4 ++
 doc/userguide/reference/dtrace_providers.md   |  2 +
 .../reference/dtrace_providers_rawfbt.md      | 50 +++++++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100644 doc/userguide/reference/dtrace_providers_rawfbt.md

diff --git a/doc/userguide/index.md b/doc/userguide/index.md
index f86c8b9e5..da9a08687 100644
--- a/doc/userguide/index.md
+++ b/doc/userguide/index.md
@@ -241,6 +241,10 @@
         -   [profile Probe Arguments](reference/dtrace_providers_profile.md#dt_ref_profargs_prov)
         -   [profile Probe Creation](reference/dtrace_providers_profile.md#dt_ref_profprobecreate_prov)
         -   [profile Stability](reference/dtrace_providers_profile.md#dt_ref_profstab_prov)
+    -   [Raw FBT Provider](reference/dtrace_providers_rawfbt.md)
+        -   [rawfbt Probes](reference/dtrace_providers_rawfbt.md#dt_ref_rawfbtprobes_prov)
+        -   [rawfbt Probe Arguments](reference/dtrace_providers_rawfbt.md#dt_ref_rawfbtargs_prov)
+        -   [rawfbt Stability](reference/dtrace_providers_rawfbt.md#dt_ref_rawfbtstab_prov)
     -   [Rawtp Provider](reference/dtrace_providers_rawtp.md#dt_ref_rawtp_prov)
         -   [rawtp Stability](reference/dtrace_providers_rawtp.md#dt_ref_rawtpstab_prov)
     -   [Sched Provider](reference/dtrace_providers_sched.md#dt_ref_sched_prov)
diff --git a/doc/userguide/reference/dtrace_providers.md b/doc/userguide/reference/dtrace_providers.md
index f11bacb2f..741a34fc8 100644
--- a/doc/userguide/reference/dtrace_providers.md
+++ b/doc/userguide/reference/dtrace_providers.md
@@ -21,6 +21,8 @@ The `pid` provider traces a user process, both function `entry` and `return`, an
 The `proc` provider makes available the probes that pertain to the following activities: process creation and termination, LWP creation and termination, execution of new program images, and signal sending and handling.
 -   **[Profile Provider](../reference/dtrace_providers_profile.md)**
 The `profile` provider includes probes that are associated with an interrupt that fires at some regular, specified time interval.
+-   **[Raw FBT Provider](../reference/dtrace_providers_rawfbt.md)**  
+The `rawfbt` provider is a version of the `fbt` provider based on kprobes and allowing probing of synthetic function variants generated by the compiler.
 -   **[Rawtp Provider](../reference/dtrace_providers_rawtp.md)**  
 The `rawtp` provider gives DTrace users access to the raw tracepoints exposed by the kernel tracing system, including access to the untranslated arguments of the associated tracepoint events.
 -   **[Sched Provider](../reference/dtrace_providers_sched.md)**
diff --git a/doc/userguide/reference/dtrace_providers_rawfbt.md b/doc/userguide/reference/dtrace_providers_rawfbt.md
new file mode 100644
index 000000000..7b1fc7723
--- /dev/null
+++ b/doc/userguide/reference/dtrace_providers_rawfbt.md
@@ -0,0 +1,50 @@
+# Raw FBT Provider
+
+The [fbt provider](../reference/dtrace_providers_fbt.md) consists of
+probes that are associated with the entry to and return from most functions
+in the Linux kernel.  It does not support tracing synthetic functions,
+that is, compiler-generated functions with a . in their name.
+
+In contrast, the `rawfbt` provider implements a variant of the FBT provider
+and always uses kprobes.  It does allow tracing of synthetic functions, such
+as compiler-generated optimized variants of functions with . suffixes.
+
+You can see the raw FBT probes on your system with:
+
+```
+sudo dtrace -lP rawfbt
+```
+
+As with the `fbt` provider, there could be tens of thousands of probes,
+and effective use requires knowledge of the kernel implementation.
+
+**Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
+
+## rawfbt Probes <a id="dt_ref_rawfbtprobes_prov">
+
+The module name of a `rawfbt` probe is `vmlinux` for built-in modules.
+The function name is the probed function.
+The probe name is either `entry` or `return`.
+
+## rawfbt Probe Arguments <a id="dt_ref_rawfbtargs_prov">
+
+The arguments to `entry` probes are the same as the arguments to the corresponding operating system kernel function.
+These arguments can be accessed as `int64_t` values by using the `arg0`, `arg1`, `arg2`, ... variables.
+
+If the function has a return value, the return value is stored in `arg1` of the `return` probe.
+If a function doesn't have a return value, `arg1` isn't defined.
+
+There are no typed `args[]` arguments for any `rawfbt` probes.
+
+## rawfbt Stability <a id="dt_ref_rawfbtstab_prov">
+
+The `rawfbt` provider uses DTrace's stability mechanism to describe its stabilities.
+These stability values are listed in the following table.
+
+| Element   | Name Stability | Data Stability | Dependency Class |
+| :---      | :---           | :---           | :---             |
+| Provider  | Evolving       | Evolving       | Common           |
+| Module    | Private        | Private        | Unknown          |
+| Function  | Private        | Private        | ISA              |
+| Name      | Evolving       | Evolving       | Common           |
+| Arguments | Private        | Private        | ISA              |
-- 
2.47.3

