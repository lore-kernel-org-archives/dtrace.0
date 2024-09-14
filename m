Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0811E487
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 15:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726328471; cv=fail; b=Kui2J7o7NcqeXUm3XxyCH5jJUXi3G7AOhT239WTE5ywdYLtAVaP7ubGG+xFrNgLL6GLKmC+j1+DyXhWb189tBGjgwHfMAhWEGbra1J+OvDTCQuhPxpDRiNfNNCVLpRPhbnFSOfGfY39bHV1rDNRTID18nBH95kJi7vOHf0sRhN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726328471; c=relaxed/simple;
	bh=ESyWfgD2rBZORVNMPYA605OjS5J6I93+yIW7kXa5mzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=o0MUClFkz4lB9uwbTYvUvYCLBL909+TCKc1az1yiiwi8afxSNTcDR1Y7LsmKMyXm5gthhrRcf9cmFshzl1+9UoBBIoaRia1KJkC9iOPzd7oysUTS59Vbx/GVPBA5dFKUSqBwA+ScWPUrleB926jKZ2petGlpAJ4E0t6R3/Vd56k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RSLw4lCl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QoLExh+w; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RSLw4lCl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QoLExh+w"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48EEkId2019913
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 15:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=T//xXWlMzeQopn1
	bHHiyrjuAn3Ptv4qKDdIjsOSnb+4=; b=RSLw4lClfnKbu8PyMkz5TBq59RaCJoP
	nH2h7icuDgw9viubszvQaFj2MZaAvXBMleSrYE28//o0mNTwyeDYBZ1+uD+MeL1h
	x5pxRK9Fsi0cvEaS+Bmh5Gi8VZlxvQq7E6KihwwwTF9DG9z01C/HTNZV33BgIouJ
	5ZDLg51OTe//l/so2wW+DIeT2dyRhuaiVxi+Lb1moqQrvfmI20yMQ2al/k5hM3p/
	HiJD0TL1m6Pv/gk489edQoYADBJagr0gbTqCkThW/M3T8L4LFZCAm0R+ENvcRcTU
	A72j3UWqthWMM5He8rbSfwEeWzOQ2uVZ39/b3IFg3Y2qn+MCOsfM0ow==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3sfgjgf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 15:41:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48EEqfJd034661
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 15:41:07 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2042.outbound.protection.outlook.com [104.47.55.42])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41n0xcm308-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 15:41:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gOtej2b4ty9doZNf5MgV7AtPqRbdlqx54S6j69acRwBquNKn6poRWeEjQFPzaHtidmLJy5qQSALrK55XlsSmLZYs3z1XpgP4LjoFDdXWRu0jfaXd7+yJ8WGDRfpyHXafgAGnRwCDucGomTMW3B1IbmoGkbGqJfx3iCwrH9ZrLGl3TyixWjtPxsa/ZmzeB+bZq4DemCxGYzgnMr/0QeadurVVl9EPPYzBgwvv5A+tOMtX6gEPv/0S3YNMU72OgTuzzN1LLu6IqYsnt9DAa4nZ4EguUilR5qUr+f3DpMBAMH7wKG1zCxkWIY2Fb+0iVhza5Xp/em7BrluarGm73DBo/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T//xXWlMzeQopn1bHHiyrjuAn3Ptv4qKDdIjsOSnb+4=;
 b=WhcguUtK+U6wnxdMTlbxJfguqNzd7L0LNxutUFg/nOxLEOA9jxNLGaSjdZpCihgqlWLQevcAycnaeN2B3cR/8RS1ZhQ2GN5f4n0Iz+JBYvj/eWcvK45m40PbifmA5F1Wq4Xb9Si9qKF8Iw98Uj4mucKP6vgCRM5Mj4S2bq4g006nPByKPogGPPzeYrl3RNJSjpuDQBJXKefdeftnRS3EdOSdxUG53bWLu9JhqwQADjADArgVoH34zLEHYYBdH+FaJ5d7HKvW+3EWClCULmOH+JZjR7G/dsyItL0RTE24oPlsoaIEY+KeV6q+u0Kg80S9QUlPbUh0W3kXsoIM4d2srA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T//xXWlMzeQopn1bHHiyrjuAn3Ptv4qKDdIjsOSnb+4=;
 b=QoLExh+wK7qsljmg6Rv4ZS1gLis1PhbZoLV2SrZamjb+tvWcwJrmTIZRu+T7U04CLE6hNo7nOmDGNgxKL50TcwUvMgR/O+2tjgGbeD07ZSL6z76ZyjGrDrnedbPjUoMtmLHlUrvA7rkn40PUJZQfmGAUyU41YDWpLOQRMuIRI4g=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by IA0PR10MB7229.namprd10.prod.outlook.com (2603:10b6:208:400::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.11; Sat, 14 Sep
 2024 15:41:04 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.003; Sat, 14 Sep 2024
 15:41:04 +0000
Date: Sat, 14 Sep 2024 11:41:02 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 08/22] dtprobed: Fix comment typo
Message-ID: <ZuWujjmp0QVDEXPQ@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
 <20240829052219.3234-8-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829052219.3234-8-eugene.loh@oracle.com>
X-ClientProxiedBy: BL1P223CA0015.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::20) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|IA0PR10MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: bdc3f502-8ebc-4e8a-c2c4-08dcd4d3a484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tBMWy9LW0MD+qyJBdyGp/dM6hYXjFEk60t+uqj/AQbFXwop4MJWFng4H8Cyz?=
 =?us-ascii?Q?pVccGOBixMfMrVNFx2IY6zOcbx96tfkK+K3/nXZtik4IogfS9B1ITy1Iez42?=
 =?us-ascii?Q?kA4npQg+g1ToXe+7Lt9XIkFIBWYp9cavRP8EPJMkYgj7dsm9i9ruHbUBlbDW?=
 =?us-ascii?Q?CqkC+W4gXUPZnZbJE05Kr5mtI0i8deHzIc40fYM5MI69/UbF1LC0CNj4OWNH?=
 =?us-ascii?Q?LRDrUzfYkvk1rJ8zzCZMWizJFfCaVUc7UZ/XAhuarpm59VwA+AdYle7Y44Zh?=
 =?us-ascii?Q?a8pzHm+4gqvc3Bflfpx/EBwSNdVkXX2NiK7VgQF+aWnlEbnIZNo3P8mj7G3C?=
 =?us-ascii?Q?aPlhKKS45Mgqsre+s/64A/qdlSkh8ZiGycfLBAoXpFzsrM4GdCBGZe2U/BrM?=
 =?us-ascii?Q?wp46QqKs9guPgs9QDi6UECBSOxEfjgPxnZwdq9o74muYorUoBkE/istdMLvX?=
 =?us-ascii?Q?Zngm7QqJJhoAA0tXwIKa5m/rc1tZ7yhDtUVIZ9goOnflZDPloH12knnZK+LI?=
 =?us-ascii?Q?Q/1b4vnK0YHPT5hfQgnduvHXLiRSLuFuCcC/Ci1j6rVHJdRSnb6vWbFl5wnF?=
 =?us-ascii?Q?HB94LJJMf4WhF4QbjKdBXI64vOQPNqlPgOo1juE32ACsT3Qsgabqaj6BGOUs?=
 =?us-ascii?Q?rSjqoLffO0Kn9hvG6+1ulAOswkXDnX6Fe36A+F7Rbf6PmXtA9ACRNAVsdWjM?=
 =?us-ascii?Q?AMk+ECmbS+mn6vu5YOUs+nx4Tdz9Va6WsGGx8lhGfpBvVWCbTcp5E/VJqr5z?=
 =?us-ascii?Q?NkohiTakPYpAwjJXv+8sVMySnRKmjTn5zknlsBQWOMusXRBw6GizOoCk+Ztx?=
 =?us-ascii?Q?RuONGewQBvOlzk90Ab7v1rbo9kcdCdw+alsTkfN1/rCXwooAzHJKXDiFFeDm?=
 =?us-ascii?Q?0IABn+TRgSn0MPmSy+xVuOcybxKtMv5yNZwh9z1mTpQNVsp9XHlehxwirHYb?=
 =?us-ascii?Q?b1wFA93SFaPSq4brG0tykDP4Q5mwb/UOyo3DkotGUqhm7FTEg2wWwqXTyj90?=
 =?us-ascii?Q?EZorTwa3DmCt87VWMIWVNUL2ADsJKvlaI1Hrlfen417bSkAeJa5OThFGyJ+o?=
 =?us-ascii?Q?tREw24l5z3+cyxJ0juhoR+993y9kNxH4V29XgL9gBJppLB27J+KAbUd/eLKo?=
 =?us-ascii?Q?+Wc1groVyXyI1o5VyGjqiZxjfbC3Z5H9i60Gp9RPSpYGgZEO4Ja/ebQtAbZE?=
 =?us-ascii?Q?MQePFWepawwpE62PlwQ2EqAvgRADx30SQzRly+6vVLKTSZQ+ZzBhgd8E10QH?=
 =?us-ascii?Q?on6QCBp8sFe/FOUS5vs0BZKMjx1QhoY/LtE18JWjjsArhUQls5MQisceAiKt?=
 =?us-ascii?Q?iLkxb78/JbWAa1jXjDeA1mCRBDMRZL8btpe0+agvXyu+DQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tV1IPcPwDGPBG32I9zebcVdgpswsZ+zZLu9M+itQFfDpocVIE0qpVxiyRFLU?=
 =?us-ascii?Q?RoXnNGvwd6sPAwFiJZxyDoOAlAvOrXL4rwIIZ6XtpoUgfQczZLwfMuRB3dAi?=
 =?us-ascii?Q?mnErWrv+ElsYWmcnz7Druj4KUq+TqPGL03UdZk30tGnoOCzXKwGSITxpuWRt?=
 =?us-ascii?Q?0rpHwcncawjFt7ucmLWjk1G2ahbgtAhXvWna20bxtVxOTXKNxYyhZweBMRv+?=
 =?us-ascii?Q?MW/xJ9yOUhsICyZR6ook2XSlwQqJLgnzkcpRNJT2UsiN1RM+EnFQfHSSZU8o?=
 =?us-ascii?Q?uVI30GYaetkPDki21Kmtm3ESvNIhoNmuCl7gcMx96soOhBWVj/699EsXYF+1?=
 =?us-ascii?Q?XDE3EcFzQN8WkuCxAZi7I1GmVnwoIvBmOm4h4KxrgD8r0yN6TxCyd0tlkjRi?=
 =?us-ascii?Q?AumFE3GHi6mkXjQqts12FhwH4cJSXwzrBHw9VVe8q4LoJBDJ0WPxQuHF4CS/?=
 =?us-ascii?Q?wtHdP57ZvGtpSaaDsqo9W2Lo9Fp7HmooWASZt69Hrr/OU7WRZZa96UX7z0zb?=
 =?us-ascii?Q?aTGmaqyH6eD5ZzjVoUsbtPuJvdcHtrZkL/OTC4AboEv3WTwyFeZcXH2nDJxD?=
 =?us-ascii?Q?Fbk7nlUtt4SVfScGq+SKAhTvSlUWTvTy4p6xOg9w7LjSbfonXZuYQCfXEmbg?=
 =?us-ascii?Q?4fovzc9lQ8osOIr4gfBxm9i+xjI2hWu3Nvuh+/pH03tPNSaLZLRft1DMrdUU?=
 =?us-ascii?Q?gOK7kiMR/wbSgGM1A0SvdVUKq8+8rX2M/ZNB6nBxLtfL4ax2EuOw5r6zR+9N?=
 =?us-ascii?Q?4nbaCecb0iVB31ITA4ddnL+LFAFLyjZvTwyb/dPl3ogyOBRWTy1mTV/c5sHS?=
 =?us-ascii?Q?H4C54MkkK9mztPPnG57l0Ii0qMIG/RaD5Zn3A+kE+WOGtXbOsX3CaVzXiFpH?=
 =?us-ascii?Q?Q+kmG0YROwCo1ShgiOPWj/WYliaARQKszvYUSKdS5JOawtRo0xQkKdtooPf7?=
 =?us-ascii?Q?4WIaRYNCAMhR9juCeeiJa/j2p5QIxX+F3Rs/rbks9kvaCgH9g6UicpkH6cft?=
 =?us-ascii?Q?9ao6vLL6Zm+walgOIYg5itqYq4+aPcO15/9CwW8k/KQsgBx2CC2TPRhG9n6Q?=
 =?us-ascii?Q?xudV8ipUxTBOgwfptFOUAaQRi4FDLbdHYF1Rqff+ET2+iQ4c0AXfctYDZxcY?=
 =?us-ascii?Q?irhdVTFcZJpCukvprE0UAelg21GVf+yR98eY/fPr7h+goUCJD/Fft3k432gj?=
 =?us-ascii?Q?7Qrdkk8sstmSGAH55yvllSq64pX09a7G6BP3gmWAJ+i5lY2HF6DOHFUqFTOP?=
 =?us-ascii?Q?jQF20vvOUbotC/qu5hGxQ1lT9tb66aRXeFfOij259aNpuwDhnOjKIWOWsnut?=
 =?us-ascii?Q?xe7PcojlFjQ4tDKMK66SkhDhRBv3NjXD4UMRSt2j9PTLgMGnQ51Svzv1HheR?=
 =?us-ascii?Q?HFq/dZw3WwtFu1D73H44G4v3+sxGKcVSd7rZBKKvjwv3GVEJ4cUHNSt8CVEB?=
 =?us-ascii?Q?mrXhvxPxn/LzjmUyTKgr5vPq1B9Xi0RQ1p0lW8SM2TgLnzrHeDKlem6ovead?=
 =?us-ascii?Q?tpLcEQAXc3dszlYWcI7+IGGz0LGvGIfRIUc5VJx29aIq8jIWopnHd3g2+Wvv?=
 =?us-ascii?Q?7FcRmWv6kbakkTPPUjSdHiyrima6VP67u8Le+8SNVer0hz6zCfRRZWY0j/Xu?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dWSvWT2jEgOT4xGbYkFOXglxoa/bH0lawaBAjKoD36o2w/k0vHjxUNDjv0Ln5NXlZzGExYnCgmWBLLZ7i4Y631oHkxUYKMeYxnLvjY3yEQhbQIKYtVES25BsxI8SeBTp0aNOxqxYmlzXQYn4+1TLPAyHFd2r4bF7FWbHHWbIBdiMuxUrLy/UI95m5QwrVLN1cX/b1m46f1BKMNbji7rsrDZXdKZM1yLVHELQdeKf8WwKPkcq8OXE7ND9d+T69pGGSEQMxhCVUo+EYmPW5HBczM8apiKjlFFdxgcODknWUOLEJZcVFC84aDUdbEuYYNwmeFI+qWUusERvDKjU34wLDRZAQdPLaRj0zMWP7wRcLQTMUyIewwP3L1dfavz83druNeD4VUniAWbaqGgAtYmxWFQ6v6g+sMjkKUAhQt1d7hUDkmxZUic5XbGmWy1ps0TeO7JivnBgXRhslZxzRVRKxG1q8ROCUUHO6zdlSa1+KKXnTzA8sDxn0imUNmoUTYqTy8Nac54fj+SEAcEWx8AJzhM9U2vqPmPzK18V7oSfTadSWxHG4XEfFkm2cZk8cLKY9/yHjaq8ACKS8OXkXCrJWFWRcLo8O/sHmAGRArjlUyQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdc3f502-8ebc-4e8a-c2c4-08dcd4d3a484
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 15:41:04.3970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pDGagbhVExNk7LS+Oih4UCZPbBB4UlFgMduAvT3NVL6ib4Mwe6r3319GqHXo0ngoqzN3MGCk7hqcBXStsPKC2iIDV0uwh1GpYNs4PliP19I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7229
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-14_09,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409140110
X-Proofpoint-GUID: Ec9C5GoJofsVsjlY5teqQSVOpVBlVtsU
X-Proofpoint-ORIG-GUID: Ec9C5GoJofsVsjlY5teqQSVOpVBlVtsU

On Thu, Aug 29, 2024 at 01:22:05AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  dtprobed/dof_stash.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
> index 625572d5..0e639076 100644
> --- a/dtprobed/dof_stash.c
> +++ b/dtprobed/dof_stash.c
> @@ -64,7 +64,7 @@
>   *
>   * /run/dtrace/probes/: Per-probe info, written by dtprobed, read by DTrace.
>   *
> - *    .../$pid/$prv$pid/$mod/$fun/$prb: Hardlink from $prv$pid:$mod:$fun:$prb
> + *    .../$pid/$prv$pid/$mod/$fun/$prb: Hardlink from $prv:$mod:$fun:$prb
>   *    above; parsed representation of one probe in a given process. Removed by
>   *    dtprobed when the process dies, or if all mappings containing the probe
>   *    are unmmapped.  Used by DTrace for tracing by PID.
> -- 
> 2.43.5
> 
