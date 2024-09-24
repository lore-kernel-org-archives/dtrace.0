Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EEF139CE9
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727209571; cv=fail; b=u9uuUV/C/VnrZsuNWKD3ejP+H235Ds8//4ec/wQ00+bFa6RSUmLRFwLCSkqprKAJMJfSySpsKO8SUTPksedAMyCCJwgfTUk0FEsouYrIPOY2jSw/bi0nsSiXssRKNg+fmzYQVjg2lfXUm6/mx8Cv0l0pRoekC6kqooFsClyuezw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727209571; c=relaxed/simple;
	bh=z8ipZ6OJYQqGOqvTivoA4C0S0BSsUmS5sMwVjJrif00=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XQMlCyuKJ+fMCiWV5otvWZ2BOVPWg3wTQtYzyRRWDZu4KMdCqTGQhyV65um7Xels8MESgobvlcBQgbDoQKuczeQKH2GIQPICe9jbItxBjm0g6wCxRrXrm/fAdZGvCXWEbTFWWQL0SuK+VoYSSAOxvI0X7P9o4DoFODUVyO7K1ig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IQzEOXvv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fOHVK5IY; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IQzEOXvv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fOHVK5IY"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OHMWqD010201
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=Nrp4MjBvumgye3
	0GU7XYHYgQMvsDXNfg9C/zfA5Hhfw=; b=IQzEOXvvxlL8f/nju8o1aHUw3gaeng
	TRJNo2ncQ6lXpDNRzJbEwM45knU+NG0oLpUbuKUHAQIn0b8YdrnOki7AUB+GwxmB
	jEZT8QTJw1LjWBp+XUmPDYDUzIcpsY8xvZa3P3eq/wrbcFzb3OQex9MsDg87Cu0I
	vwLFVOI/r76ZzjHOmRxkV6amUgcRW+2UhVjCMtgw9EVEYSUriTmNRUNmS0TXyHTb
	89+cplxvxZxy0GtgQs+ieI2C09qWT0Crb/JAz4+rzuoo+xlCiXevI5RlKbJNu1o6
	iqDifdpojdGm5iRq/cZRtP1MJbPIf+fFVyNCm2DM+aME9h/TrVMnuOlw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41smx3645j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:26:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48OIu9qk031249
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:26:06 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2043.outbound.protection.outlook.com [104.47.51.43])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41tkc6bs46-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:26:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0qkp4VMpcOR+BD85cIXIxrh9T2oQEdHQ7Fd7fxP0TBAqu1tIB4Q3+wZ3dfrr3XErbYEQSW8c9ezlAGniclHuNIHQ4Qm6DcnGBIWXMycFyuEgKGwQ1Exnd4ZpgwPsM96yik9JhR3msFpuQ2oALNL9q3X7OEyFnQnhh+pvHdbnFtqejp160Acr9G91oqowZ1IZitFQAsNQM1mcUmpSS3amhBUpiZxBBsNomYG2omNihackrXE0eW34YXmAHg5cuyGRh3xF19cPfQP6yfLx8Nj0pSNHqT2HazduSvab5WPDqt8DzRvBiAa2MRpr+BcGJyXZKMKmWTj5NLvk4R8ac1sUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nrp4MjBvumgye30GU7XYHYgQMvsDXNfg9C/zfA5Hhfw=;
 b=Y2QoijdZlidgd75YeOPJftqwSuDwdBuE5ePDGabNAt+a0NI7Pvj01YwuYvAgIxYenql5L4Stz49Szblptn+0D4XjhJzTdikcXmBck8qME3xQ/2PeDDa6XTSuQo0vqXR3wI99nUsuWqF3Rq55rrcsXmntP3JnrMCbL6XqgSJJUIgXYjv9CLoVIL0i/3f7t4xGx0fNS5tK2WZuZJESOG5ABDFTniHExgEvZbYZOUmmmUZ9Ul8Uxz948EAr1PiQcWKZNWIfhkk88Rv1P8nlDOCCW+FKoMqu327hMJUvL46f4lbFzlBDKqOvjLK7Lobc0EWbmxNyo874af12QU/pdMuUjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nrp4MjBvumgye30GU7XYHYgQMvsDXNfg9C/zfA5Hhfw=;
 b=fOHVK5IYzDz3B8pDNZQ0it02cofpE3wg4tFWZC4DwditBFUM5Bxmle+p7gdaxUPHx2vx2FMIqs0ZW4+pR3vSVRCU8BHhgUOQpm2kaN25m2Ug8xdjubwB0xo+6e6fdSUEwNflz9QcCvv70uiGGJ49FhI026aIUtbkGXINaLdIom0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7269.namprd10.prod.outlook.com (2603:10b6:8:f3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Tue, 24 Sep
 2024 20:26:04 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8005.010; Tue, 24 Sep 2024
 20:26:04 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 05/19] Split dt_pid_create_probes() into pid and USDT functions
Date: Tue, 24 Sep 2024 16:25:49 -0400
Message-Id: <20240924202554.7011-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240924202554.7011-1-eugene.loh@oracle.com>
References: <20240924202554.7011-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0088.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: 35373d03-f0ae-486a-4821-08dcdcd71cd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/wDBmDMdqqsY3Ksbn/NfOOyiS+wnF0jWUERHgg4VUB6m9Z5ffdlP37iHrr+W?=
 =?us-ascii?Q?7KR51TXcPG4QavMa68MhkADpzUBIlfznkMFLOaQr09eIHGWxRZ5eOka/9CWF?=
 =?us-ascii?Q?yyseDHU+xopWM9v29naZMe0EkJE/MwPLDNuaEKy08Jg+EZWT8AdhSfFT/kUA?=
 =?us-ascii?Q?bMKPfp2Sphzy1K2O33IN9sWx+JDcOzUls65++61SVMzShC4Z6Vs5SPnJ7LG1?=
 =?us-ascii?Q?ImhxbK+XWS5/hJ9+RLQyMYNTCN94s9T9UAaEb4FabHbcNNdw9+7kezn+J4YR?=
 =?us-ascii?Q?k9VflvICf5wIZ2dSR+UnatfNJrF8tQiIbZWeqbkkhaHctsT1IVGEkH6ECCgX?=
 =?us-ascii?Q?DbbB3Cdjm6Svq+JoLUk6RfSxTUubhbwidlWmsQVsH/KFoI8BCTFWrmTChTIk?=
 =?us-ascii?Q?/d2BmerOtEuE8qmw5rGX5u2qILM6URGmUwF1USGLcrKw1hNbtc3mZystKtIN?=
 =?us-ascii?Q?MZRQlwRlrocKpmOHZ/hgVYj3JajNB4vE80x5e0VLLOKzJY7tkjNEL2KDjEUf?=
 =?us-ascii?Q?rWFTF3yxyHGq5i7fZwQ1U7Kw2RFqvDOK2iABrbKBzpgBUsbzUYcYdilgtmLj?=
 =?us-ascii?Q?aDp4O/UsFS1w8MTsH2wsTpJeMWDOrljk7z5wphrYo5r+7pxakbrbO0me3sPW?=
 =?us-ascii?Q?kgMgQfcRTraGed+ph/DCcVAeCd65gXnSpjcubu8k3818AEfDI6MF2dbeaDkU?=
 =?us-ascii?Q?tBRZkLoFtROG4xiWQAKv215UHhtCOeyy6+nHVdCaIG6Tn7QVGnWLwR9yGKON?=
 =?us-ascii?Q?7uDT/9y4m1cXI+YTVWBzwW5JJdLAUcM9pPDuqvYBh/Nm08VsTnZnVwoHu+Ym?=
 =?us-ascii?Q?8ne1O2JzmOl/FGzsms7dycU626rS8fvH4UBVoqWNYrr712QFX5wgq/k2prcC?=
 =?us-ascii?Q?ZYoIFDAWZ1mN9l75Vgh1+m3sJs/6hTSUagrvYIb2pyPoRajXezlJq1pYSG5E?=
 =?us-ascii?Q?xv7DvUmHvMxEVFdc6pNkgLEkSzmwkCTI8QCYEP8/0/JDwFhmo0eryiL6jEa6?=
 =?us-ascii?Q?O1pUq/b1bzawpJEV+1XZUjBcvpzdRsn6NtmBflw1M1f9uJZW9PxhmUin3zmY?=
 =?us-ascii?Q?tkA7j+WfeqVfiqDbH8U7KCj5JztAGlfsyEhhgI43RHWVTBiMq809NaBq/lOO?=
 =?us-ascii?Q?kzDak03c0cGmyEr3NdM4WDdJU2OTgtbOexD6t7NcaBPyoWgkbHhJpbU7gw5S?=
 =?us-ascii?Q?Sfwyt2e6Pvrmdlbb0e2wl5yTQGiRk/hzJgsnOQ8pLsLiwf3zHmWQmWRTEbb1?=
 =?us-ascii?Q?/L81iLf9NU7uFKqfONmJDVRVFUVtwabeL5sFd35D4Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h740F4bYpTBgZ8P+vdPW9xpOfzwRKTgF6fg4KalLuwSExuO7QWHboNnMSEPL?=
 =?us-ascii?Q?1p8GcirmEzaSxjOyM6PfYuMkh2ap1plMz0/gUjfyLMnrSK8urVC8A2i7OFyP?=
 =?us-ascii?Q?pFpD6O+xhTX5tk7mE2utELZ06FSSpSLawWfQvZqe4UHGQmxPdUWU5O8MJ1Cd?=
 =?us-ascii?Q?/2d6BRS+GreNhjbNbnda/Yw3Lhaf7ml79dt4OzoXkVGRPs5TDrvFrXyJFEwJ?=
 =?us-ascii?Q?0olbWiTwJs0yw0P1DjY6azQBIlujIhb9ipModNP5yqVhkQFNH7XrS7kjh51n?=
 =?us-ascii?Q?/lO+5sNElH6PB5Ezm0JUt4Ic1mFc5hKsmfq4FrgvbTHCuxD7cOQ8PacGNc6E?=
 =?us-ascii?Q?U24ZfVXnDbciRtorDlQ35OQmgS9MexwjqoAh2zLiHzXqkLvoBrCmOPgGSf0F?=
 =?us-ascii?Q?C71TETUfsPXkszrVJ17EzDBOQWBAgIj7McoTnPIaDuKus6AcQpxgDIwZAHt0?=
 =?us-ascii?Q?+WzenSgzuZg3wf0Skq2jnsHBZihLUDr3ojSHP7LivXPE3sqmru318XjSKhCv?=
 =?us-ascii?Q?sLmp2yOkK9BOl1tQS6jUxP2qd3u7GyjOJjo4uuKyCNX3dZuK94IX+Bsq1QEe?=
 =?us-ascii?Q?jHKoZ8NovBfQlSqxkeG5IFE4yFGUwCm0iMHyWrvmd8058Mvufn2a4/RiCajX?=
 =?us-ascii?Q?wefh5ZCoz4CtuMI5QgqDdgDjJYjFj19KFZi7FJP1D9NA8rjp7Ag3t7hD/t/J?=
 =?us-ascii?Q?OMot9JoKlvwBSXUpsG0TOXeKwwEEe/25Vwp3kVroo6GB88mK3iJaIOVu+KeF?=
 =?us-ascii?Q?+Z5jVfOYzw5qUXq4Iz6PHgBI9WBlIXVnOqy/QVrUIlbFUvu6qDWkE7I/hSS8?=
 =?us-ascii?Q?zEtjy7mXgqOjIawp95VDYaeaoNftR8g+rcI1P1fb3jr78NAs1hKSUubdnBxx?=
 =?us-ascii?Q?II6U6DP1XtQXBkwyQVZCHDfRnLq4j5k22MPxxcMN/ecG8ODonSn+2/9lCBI/?=
 =?us-ascii?Q?pi94B7b7zh0GbTjou/8cQ2R4rPrMI4OH8dIQ8fpgVSjKTgW+fUzXEWo0DHmU?=
 =?us-ascii?Q?/5r21dZkqwAUNxn2iFJIucSqWBFoy5bLBi9y5A4O4na2qPuMRpS8cbXN726I?=
 =?us-ascii?Q?pZRpsVLGefCyyTnCpXJHI1u7mEmxWBjXi1D93AHFUetWwOVtbQI6uzyrtmlR?=
 =?us-ascii?Q?u+m3FpNmPsylWoc5scNWiV4UMtBS0tOVn3Ac2FeJE/iak8F9q87VYs59I+Rr?=
 =?us-ascii?Q?B9HRS0kla1XAgJlsmRfMgIPWeKqqvBKHccKxCxrShBAtJ0E745jCeSMsn7Xj?=
 =?us-ascii?Q?WeH7lCyPAqfZV0UY/6KzJOO6ne+WY2zCugL5Z1UkoSR3gAoEF7exS+0+vikf?=
 =?us-ascii?Q?l8AidjrZe++L67uWwm/b7GHdwmFNFkeNSi6Mb29DywKQHn8dSNJ9Q8IQ7nRo?=
 =?us-ascii?Q?7V1TY3eFSKT7giV9QJmVICYKwojzs4XTvK8evvTbte9+EjeNU9BoIREVbJbF?=
 =?us-ascii?Q?x5qje1NQslmZRaspH4Rlt/ox0hhciPmxz7gOeUTzrWKoBnEJp5BCcFjD4SJp?=
 =?us-ascii?Q?Vb5CxnApvtxEfRAJidDLuVGjjB3qpnL/aQhC3k/qTJ47VRfxsjSK3wBXMPzr?=
 =?us-ascii?Q?xJ2skwQIJz6dG1L7UORLuu+TZSCGXxjIvsjMQJDN?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	H5vUaTizeoNLD4ZvSb+Bx4aPmNJGmYNZ720LKXSv5FbJiTlEhM7pLJcHPptr9LCR6ByFl9Nl+zb7MX6JgI0yOPErL87liX76vl9ZdKCmbyDc+ApGjjlsNbo1Qxw/RB0q2k6iMKYFjXEliOTlUUBTNdpqR+VXZ02W8T42/HwtIAR2S1oXedE+JlONPw/Pab0B8UA/+dW0x/ELJke+65GLPf4t5zgybPw6jlDvC6TPURhw8W0BUv0CUjD9PvuTQNZTmQKM/K753aRAaDYhILfqrSXgGOCC9kK23C2bdkD4Enu0bgIfiOCWZEKuT5/Pqwe5doSAI7HL7iQ/rWImx75frv3gzhWU4uv4xZ6n8WZ2D4UC7kfWtTYi99uXWwsLqG/1y3wR6XlaOl/Q8Rq/cxW31y44WRd0qeeP46ucZZ53KTGp5ryF15/l5Ec3r++GzmqQcHJ/8hjlvget5tTUecE0KKPsMNz4bz/gEcObquYCSlqJp5CGhLfJE9ByN0kJJWsRoyZLJVpQeCstWQAOJZyq896+2FEDnUupg+7hWCehJZZdrpyXe041H83yMmKcHtiZiQxueFfcZM5KVlVNaW4jRJw3l06ACxEf+nh6fKlHsso=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35373d03-f0ae-486a-4821-08dcdcd71cd0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 20:26:04.1458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZJ37qjOxtr0mOttpyDhxo8YWD0hcDsWd0kZE+LKgG9Lw+VQQ3erQBEg03WNx5PuMu5CfPB5LY0to6QPegOdgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7269
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-24_02,2024-09-24_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 adultscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409240143
X-Proofpoint-ORIG-GUID: xQiMXfChpZQNzZvMZir_Z7hTE8JANprr
X-Proofpoint-GUID: xQiMXfChpZQNzZvMZir_Z7hTE8JANprr

From: Eugene Loh <eugene.loh@oracle.com>

The function dt_pid_create_probes() creates both pid and usdt probes.
Once the dtrace session has started, however, we only need to watch
for new usdt probes.

Therefore, reorganize dt_pid_create_probes():

*)  Rename
        dt_pid_create_pid_probes()
    to
        dt_pid_create_pid_probes_proc()
    and rename
        dt_pid_create_usdt_probes()
    to
        dt_pid_create_usdt_probes_proc()
    since these functions create probes for a specified process.

*)  Break dt_pid_create_probes() into two functions:
        dt_pid_create_pid_probes()
        dt_pid_create_usdt_probes()

*)  Make dt_pid_create_usdt_probes() available in dt_pid.h.

Also, start building support for wildcard USDT pid specifications.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_pid.c | 137 +++++++++++++++++++++++++++++++++------------
 libdtrace/dt_pid.h |   2 +
 2 files changed, 102 insertions(+), 37 deletions(-)

diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 996543b1f..62060b592 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -605,9 +605,12 @@ dt_pid_fix_mod(dt_pid_probe_t *pp, dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 	return pmp;
 }
 
+/*
+ * Create pid probes for the specified process.
+ */
 static int
-dt_pid_create_pid_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
-			 dt_pcb_t *pcb, dt_proc_t *dpr)
+dt_pid_create_pid_probes_proc(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
+			      dt_pcb_t *pcb, dt_proc_t *dpr)
 {
 	dt_pid_probe_t pp;
 	int ret = 0;
@@ -702,6 +705,7 @@ dt_pid_create_pid_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 
 	return ret;
 }
+
 /*
  * Read a file into a buffer and return it.
  */
@@ -780,24 +784,21 @@ validate_dof_record(const char *path, const dof_parsed_t *parsed,
 /*
  * Create underlying probes relating to the probespec passed on input.
  *
- * If dpr is set, just set up probes relating to mappings found in that one
- * process.  (dpr must in this case be locked.)
+ * dpr must be set and locked.  Just set up probes relating to mappings found
+ * in this one process.
  *
  * Return 0 on success or -1 on error.  (Failure to create specific underlying
  * probes is not an error.)
  */
 static int
-dt_pid_create_usdt_probes(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
-			  dt_pcb_t *pcb)
+dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
+			       dtrace_probedesc_t *pdp, dt_pcb_t *pcb)
 {
 	const dt_provider_t *pvp;
 	int ret = 0;
 	char *probepath = NULL;
 	glob_t probeglob = {0};
 
-	/*
-	 * Systemwide probing: not yet implemented.
-	 */
 	assert(dpr != NULL && dpr->dpr_proc);
 	assert(MUTEX_HELD(&dpr->dpr_lock));
 
@@ -1094,64 +1095,126 @@ dt_pid_get_pid(const dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb,
 	return pid;
 }
 
+/*
+ * Create pid probes.  Return 0 on success (even if no probes are
+ * created, since there might still be USDT probes) and -1 on error.
+ */
 int
-dt_pid_create_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
+dt_pid_create_pid_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
 {
+	pid_t pid;
 	char provname[DTRACE_PROVNAMELEN];
 	dt_proc_t *dpr;
-	pid_t pid;
-	int err = 0;
+	int err;
 
 	assert(pcb != NULL);
 
-	if ((pid = dt_pid_get_pid(pdp, dtp, pcb, NULL)) == -1)
+	/* Exclude pid0 from being specifically requested. */
+	if (strcmp(pdp->prv, "pid0") == 0) {
+		dt_pid_error(dtp, pcb, NULL, D_PROC_BADPID,
+			     "pid0 does not contain a valid pid");
 		return -1;
+	}
 
+	/* Extract the pid. */
+	pid = dt_pid_get_pid(pdp, dtp, pcb, NULL);
+	if (pid <= 0)
+		return 0;
+
+	/* Check whether pid$pid matches the probe description. */
 	snprintf(provname, sizeof(provname), "pid%d", (int)pid);
+	if (gmatch(provname, pdp->prv) == 0)
+		return 0;
 
-	if (gmatch(provname, pdp->prv) != 0) {
-		if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING) < 0) {
-			dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
-			    "failed to grab process %d", (int)pid);
-			return -1;
-		}
+	/* Grab the process. */
+	if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING) < 0) {
+		dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
+		    "failed to grab process %d", (int)pid);
+		return -1;
+	}
+	dpr = dt_proc_lookup(dtp, pid);
+	assert(dpr != NULL);
 
-		dpr = dt_proc_lookup(dtp, pid);
-		assert(dpr != NULL);
+	/* Create the pid probes for this process. */
+	err = dt_pid_create_pid_probes_proc(pdp, dtp, pcb, dpr);
+	dt_proc_release_unlock(dtp, pid);
 
-		err = dt_pid_create_pid_probes(pdp, dtp, pcb, dpr);
-		dt_proc_release_unlock(dtp, pid);
+	return err;
+}
+
+int
+dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
+{
+	glob_t globbuf;
+	char *globpat = NULL;
+	int err = 0, i, nmatches = 0;
+
+	assert(pcb != NULL);
+
+	/* If it's strictly a pid provider, we're done. */
+	if (strncmp(pdp->prv, "pid", 3) == 0 && isdigit(pdp->prv[3])) {
+		const char *p = &pdp->prv[4];
+
+		while (isdigit(*p))
+			p++;
+		if (*p == '\0')
+			return 0;
 	}
 
-	/*
-	 * If it's not strictly a pid provider, we might match a USDT provider.
-	 */
-	if (strcmp(provname, pdp->prv) != 0) {
+	/* Look for USDT probes. */
+	asprintf(&globpat, "%s/probes/*/%s", dtp->dt_dofstash_path, pdp->prv[0] ? pdp->prv : "*");
+	nmatches = glob(globpat, 0, NULL, &globbuf) ? 0 : globbuf.gl_pathc;
+	for (i = 0; i < nmatches; i++) {
+		char *s = globbuf.gl_pathv[i]
+			  + strlen(dtp->dt_dofstash_path)
+			  + strlen("/probes/");
+		pid_t pid;
+		dt_proc_t *dpr;
+		dtrace_probedesc_t pdptmp;
+
+		/* Pull out the pid. */
+		pid = atoll(s);
+
+		/* Check, since dtprobed takes a while to clean up dead processes. */
+		if (!Pexists(pid))
+			continue;
+
+		/* Grab the process. */
 		if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING |
 				      DTRACE_PROC_SHORTLIVED) < 0) {
 			dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
 			    "failed to grab process %d", (int)pid);
 			return -1;
 		}
-
 		dpr = dt_proc_lookup(dtp, pid);
 		assert(dpr != NULL);
 
-		err = dt_pid_create_usdt_probes(dtp, dpr, pdp, pcb);
+		/* Create USDT probes for this process. */
+		pdptmp.prv = strchr(s, '/') + 1;
+		pdptmp.mod = pdp->mod[0] == '\0' ? "*" : pdp->mod;
+		pdptmp.fun = pdp->fun[0] == '\0' ? "*" : pdp->fun;
+		pdptmp.prb = pdp->prb[0] == '\0' ? "*" : pdp->prb;
+		if (dt_pid_create_usdt_probes_proc(dtp, dpr, &pdptmp, pcb))
+			err = 1;
 
-		/*
-		 * Put the module name in its canonical form.
-		 */
-		dt_pid_fix_mod(NULL, pdp, dtp, dpr->dpr_pid);
+		dt_pid_fix_mod(NULL, &pdptmp, dtp, dpr->dpr_pid);
 
 		dt_proc_release_unlock(dtp, pid);
 	}
-
-	/* (USDT systemwide probing goes here.)  */
+	free(globpat);
+	globfree(&globbuf);
 
 	return err ? -1 : 0;
 }
 
+int
+dt_pid_create_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
+{
+	if (dt_pid_create_pid_probes(pdp, dtp, pcb))
+		return -1;
+	return dt_pid_create_usdt_probes(pdp, dtp, pcb);
+}
+
 int
 dt_pid_create_probes_module(dtrace_hdl_t *dtp, dt_proc_t *dpr)
 {
@@ -1179,7 +1242,7 @@ dt_pid_create_probes_module(dtrace_hdl_t *dtp, dt_proc_t *dpr)
 			pd.fun = strdup(pd.fun);	/* we may change it */
 
 			if (gmatch(provname, pdp->prv) != 0 &&
-			    dt_pid_create_pid_probes(&pd, dtp, NULL, dpr) != 0)
+			    dt_pid_create_pid_probes_proc(&pd, dtp, NULL, dpr) != 0)
 				ret = 1;
 
 			/*
@@ -1187,7 +1250,7 @@ dt_pid_create_probes_module(dtrace_hdl_t *dtp, dt_proc_t *dpr)
 			 * a USDT provider.
 			 */
 			if (strcmp(provname, pdp->prv) != 0) {
-				if (dt_pid_create_usdt_probes(dtp, dpr, pdp, NULL) < 0)
+				if (dt_pid_create_usdt_probes_proc(dtp, dpr, pdp, NULL) < 0)
 					ret = 1;
 				else
 					dt_pid_fix_mod(NULL, pdp, dtp, dpr->dpr_pid);
diff --git a/libdtrace/dt_pid.h b/libdtrace/dt_pid.h
index 497c77510..9277c6bc0 100644
--- a/libdtrace/dt_pid.h
+++ b/libdtrace/dt_pid.h
@@ -16,6 +16,8 @@
 extern "C" {
 #endif
 
+extern int dt_pid_create_usdt_probes(dtrace_probedesc_t *, dtrace_hdl_t *,
+				     dt_pcb_t *);
 extern int dt_pid_create_probes(dtrace_probedesc_t *, dtrace_hdl_t *,
 				dt_pcb_t *);
 extern int dt_pid_create_probes_module(dtrace_hdl_t *, dt_proc_t *);
-- 
2.43.5

