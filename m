Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFAB1FB8BB
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 14:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729866924; cv=fail; b=rjbg7tgwyneqlKSEioM/epbCZaXPl83qckJOENzBtNnG07hlWRuDVEAgsDpn7dh+8xQEG48/RsTyKuwfpVJFKnZfkzW2OIxGujyyyfMGvD1oNv3h5Py1pJNKflMYsJDGTZbE+fhsF1KYtdZwabww4MxXfVcmRf1fJKtJhwif/NQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729866924; c=relaxed/simple;
	bh=uDL+sKH+SqU1Lvpq5ruQe52QMFTL5RCFDJnbyakAxxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WS+k36wcT11bk4SlVi9334a2TsJvWK+fOhRzk+nTYOHisKZLDocLBKBhRRcX1RdJ2q29QkomX04XWlo7Xq7x1rPVXhlDwAHzZzYtexwxQ6KIWOQBfW+DI2xPDJWznf49IQcurdz2KNJgyjSC1yTCLnjIwzGOIUYtOY7UFvaJutE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nG6J+Kl9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JkZCjqBO; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nG6J+Kl9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JkZCjqBO"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PDhe61008288
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 14:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=EapwEBm1b8xfAdt8Aj
	ch4KPMSHa+7kCU1QDKkelp5bg=; b=nG6J+Kl9Pd66mr1WHhkamUcFSGJjMz5wiH
	zQXPQiquY5/IeYJjqlCmz7Iguv9d2fP6Qub2FOpwpfdhIkhTMfg+UAdySD8W/lPN
	lT6EeXbgptFMjmjdlNA9A4QPty4bvqcXRzF+XJ1+UbhwwW5+U///CG9s64Zp8vZk
	GKW3LExLY9OMVXU70rsQ+ttsE5xSHvlNuAlFITr1+M9aY1pjdhxnoxBTk428Ih3K
	iR/VgAtq1wb0X7SwBiVdRaG41NkLAgKqMzdsGX40xsBzTq9RdiB6hisavJ8AAMpr
	Bk9QyAwT3CqNAKq82Ppd+5cQHvfZlu6+vXKE5t1HiMjdROn4PV+w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42cqv3m5rj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 14:35:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49PE13TR016432
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 14:35:20 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emhdxeyf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 14:35:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tma0LKwpSlnMuifXL/Iw04FqXYrN5nbGtwPD9Voz6C51Xqbrytze6gf8uZFu6lOm45+kSUlw5i+5HnZD/esPoReIIIyoUshhw8meRte5/mmddefAoXfWH4QRqsUCjz0SgLdKuyKqu5FbyY2CN7hCj4hBgbIv5I5WZDVBnLTLryKw2eiU0OaKHuSwTPQylvSzR/vGz/JPQ0Z9ia3C8RgqjwGmgPzDnDOLYYEsO7NJHqy685MiCjABb7cNbFL1aG9IN0BiFXxOC68dY1x4mmcMeDtOwoTNtn8gUvNdqN3sqxid76YbebzvhQhmUJlO/nvu4cgqULsWzonCxqhm7Wq6wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EapwEBm1b8xfAdt8Ajch4KPMSHa+7kCU1QDKkelp5bg=;
 b=gcXvbkQxgm/C97B92YcufLT8rT1Im/+qiWZAbDi2y3f3CpWGrslnL9SICZ3J9dvW33xaSMykI7RRhZGzZasAYahbURybsYsF0m5W9wtGmv+0lBgRDPOAXYl9UJLnyprTukeqhQX1MdA78XebuD+J1Vvgl6VYbyZR5n2DTw8O9CkgoQW+tWg/PruB1p3c6twRXaKq4CNkBbXMAbYFmsFwwQAJ6F1p4n5rldZyzSoUDeIeeLzpdA63sRX8abtBrN83ZCKkJnM15InaWTdgCJAazOceZ0CnV9mZkNF1MH9mpRYTa9WaM6wEntjAa/8rWyebwndgrbizAsPpLxWi0rXeHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EapwEBm1b8xfAdt8Ajch4KPMSHa+7kCU1QDKkelp5bg=;
 b=JkZCjqBOJCZldsI9L3ZHtjb+T9nHrKuIZymb2EQOrvAOHXhL0AD/UnmQNT+GHEOT+0DiMdsrkM8unxBAtIpRMSVIDxWShjbUfAgOCCMKjmsP8p6871XKrpZhkMIi+RvpCI5n9w+iD4rfzTtk+LoQBERY+SgBo0YIyx5E6LErsTU=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SA1PR10MB6341.namprd10.prod.outlook.com (2603:10b6:806:254::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Fri, 25 Oct
 2024 14:35:16 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.021; Fri, 25 Oct 2024
 14:35:16 +0000
Date: Fri, 25 Oct 2024 10:35:12 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 15/19] Ignore clauses: some clauses are impossible
 regardless of uprp
Message-ID: <ZxusoNa0f1ysuhQW@kvh-deb-bpf.us.oracle.com>
References: <20241025063423.20479-1-eugene.loh@oracle.com>
 <20241025063423.20479-3-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025063423.20479-3-eugene.loh@oracle.com>
X-ClientProxiedBy: MN2PR18CA0022.namprd18.prod.outlook.com
 (2603:10b6:208:23c::27) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SA1PR10MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: 6289c0f9-d0c8-4147-abbf-08dcf5023e45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ejiBC9+o5cO9Xy0NgXHa1CAnjCG5Hd6QV1/TWrPA/EDJY/AmdMTgyvIehB5C?=
 =?us-ascii?Q?f9RhHGMyjw6teVuOIlQRsH84oVaBUZralL0z0EPUnP3P0ngCjuLFYUgby5Pa?=
 =?us-ascii?Q?seoH+146PbQ/5vv/z7UcyRjNsqc3760JU5y06IeDsCDSMsv1huYQ+dKHPKZ1?=
 =?us-ascii?Q?DcqZ2QXgBFZ7RLkiD7I4SIGAZZY6EK8V5q04LSH10/GOMKz/xGqwFA/4c1hi?=
 =?us-ascii?Q?Cml30SpjuS0l8tMlGSAsqli14/Fch/RrP51mTetXk1Spo/XTC4EsDIE8aJ3p?=
 =?us-ascii?Q?l5UVy51LLYVow+gctiU1a+qVsj7avQrpeHNbzy3VtxzOEp4iyCThh9SxfRpv?=
 =?us-ascii?Q?EJ3ci8QlTPsFphZSVLiu1jsvug4pUCGPsQeFyQauVp5k2m+S47DrOp33Mctd?=
 =?us-ascii?Q?pIcljDX6FgwU3jPp3ivZkpvId+0m+15oB3wQMKums9z8LBrk1nacKotovedX?=
 =?us-ascii?Q?B3HB5zj17p0IUY49oBhNKNaYC95QmUwYYkIYgla0vc8wNYSI8b2uPwBEQgf6?=
 =?us-ascii?Q?Q3dgXkOFNxNHbv9qz/rCvyDB7RPZ8KQcwtSnUBW9/j1/EIMeavbxefOJgJR6?=
 =?us-ascii?Q?JjSG+7nTWxpM+U0FVVG0sMcHq7RLbEoK8MIKmRuA9HwIo+omaMbTFS23L4YL?=
 =?us-ascii?Q?K1yTqn34fCkkaPY4KtKxJI8rc3Vib7kAkveiA+B0hTZo8k1BZ4I5aNk4vHq3?=
 =?us-ascii?Q?xf9iIG+9d/ETk3WYN3nxdU99WJut/zgU6tXQ8Ms3aYpujCrBzFi1FRVOX4vS?=
 =?us-ascii?Q?1hOc4HxxtKrPsc0xQ1h9+pySh5OLHV93DPrOhhrdn+bJcH5Cp+JW3XV045nE?=
 =?us-ascii?Q?bTGSomhTAlMPCVelYFKXsjfFRdAIgPPJvjeWwDUECxuAiAROt50jH3/gG/nF?=
 =?us-ascii?Q?P36MVauuItM2vo1IAOElLfhvRBOIe+9yJ+Zg/oOZCRXRgpxK8SY1bIl8eiW7?=
 =?us-ascii?Q?AwSKiO1SMd9EPNFwXx0ugjjWBRFricSLAZfED+N5CJka2D2EOzcfCjGBn6Cw?=
 =?us-ascii?Q?myaesTmJEzIXBun6NsNY3KUzj4gf7vvlTRFwtGW4e4n5+NkaL/Kf7EhSnJ9h?=
 =?us-ascii?Q?YFcSDOg8vxdzUWr5dKxu4jDFXsJJJ7zO1jCaWHo/d6mLLlgt3y06rU73C+V1?=
 =?us-ascii?Q?4TAwYacDh+oFL318uRlfbuWpdJBgC/Wk9TgazVZcEkCO/MajhaegOOtrAa0q?=
 =?us-ascii?Q?EonT+kon/pN1t+VRHCxGMcKH1i9DfLQ06FJvB7NKxU0MfZFaq5fpw4kok5Ds?=
 =?us-ascii?Q?W3QHsBkSy2SYEyLbgMgBoLwW+kBMfhOzUtY98+CPisFhZ2pyY+ZHtXNjgM3y?=
 =?us-ascii?Q?OLO3wTiug+qNQ63zeDtEV+++?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vXzx3SFNDC3HcrfSOwCrzoFCBD51Wdlf04pydD5ZpmdBSMzi5fco0Rq42acp?=
 =?us-ascii?Q?J7piwS6kTtxbpZJ88OyOr0RqH4Zt0X7yVwd2U+8E7oKQS2qZ+Ag5BUjyWGrk?=
 =?us-ascii?Q?t4MvATT/e83VCFSqTMEEvfkGlXPL68r/3T7rKf2NE3g8TGpgqgGTy2oWHh9t?=
 =?us-ascii?Q?1NlqhVK1+DQpZ5BtwReIkO8X/RVGfuFMvsOlgMuyTWfaIgY61x49S5nYK/rM?=
 =?us-ascii?Q?So7jx+vkBvt8mDoCR49bGLr8hPDY0GZnDmWbXAeXV0i+8jIWz7vK+ippAvoz?=
 =?us-ascii?Q?7U9u6qk2r4mmzJrJc6KnT+GpvRbbOgQSNq4+Sbbk0Eczy3YNvM5uNjRVmwF+?=
 =?us-ascii?Q?VINQL3ka3OcNSX4QHXTc0eTSJOYFctChvPpUy/rWuLOp0vVxikvX4+vIYnoI?=
 =?us-ascii?Q?YKxREBlIns6pYuX1+FryrfQa+tstICJLktkYJq9xx1xO3MAarU46YtduAI5c?=
 =?us-ascii?Q?LxlH8/ynPTZlvx1KjNhJbL6EoSnj4FBKWZiBrDcACWs2wrv2fJ4YBqmaVYDf?=
 =?us-ascii?Q?nJpMewx8wznl3V73BC/gI/RqmC9q1zD29kvwl4Y47FTRFy5z752HS0ZPktvZ?=
 =?us-ascii?Q?wVy3ev0/GPb76KT7U9TqYBV1/VVJwWzdV1/b6eVVdCeHqe2hvHtUGSrp609k?=
 =?us-ascii?Q?RX/ES+F9n+7HBHIrNYPjkSzxGsYIaLSoDAd0w/XlFyZUG7iLJ6J/jvindb3/?=
 =?us-ascii?Q?qz7nf2euXjqGgzRW7Ll2/laSz/GsQPHPNf8KftoWsdsmfDwVsTaCm5z41ltx?=
 =?us-ascii?Q?TYXBSYl2HaNmJQb1/y0HXRX01n22QkKaQI8bphZkae77C/iDioPRuPqOytvb?=
 =?us-ascii?Q?i6VuWz13upDj+rteDBCIrdaAujVSVMnw3pRwT88AOZJmoeCr25Uno+N9SGd1?=
 =?us-ascii?Q?xjWFKnv5+vLtycGxRhnAuWpfRFCgqDJuWwAn6VFRosg2deci4e9ZTxm6ntrG?=
 =?us-ascii?Q?lD0tpvUEE3VHym3ggPgSjY96P8JZ+yFl/v33tx4NM2aV60zHcsbG+wvkm/pH?=
 =?us-ascii?Q?UPWr/bUqEa4cRkk+C2xKmorKoINLjlWYomNm1MGMZNG9U6JUWHt05CJySrOB?=
 =?us-ascii?Q?qzYKwqs3Wl/+oyLxRXXiZGOrXvReshc/8OGwzIbEWQG655pd0GI0Y7lXW4Au?=
 =?us-ascii?Q?Wjdy7Yw6zOo2JiFCNoFt0I3a/595UcXD1CukVZHCBAkkiJVeNF6z73+2yPET?=
 =?us-ascii?Q?U9+G/pCvDbb1B1HpONTk2ZDK96j0zImjIN+edtyIMPX0c+Uo+MpAuvFxKLE0?=
 =?us-ascii?Q?QwQTRHHSbbMilG2qK4FPHyWP5B1WhLpkY4Fw47J0toEoDwTyVfSjb6lqBDxf?=
 =?us-ascii?Q?gokdkzHMZTB43+uyL0UIJz3EnnFrnsmxyuS9LMCzDvb34cORymuRTzX0BJ8r?=
 =?us-ascii?Q?XSBMR/Xl3/JD3zVU+F3OMTAQodfpdwGF0C8DEiMlMtKUm+nwrfde7FeBiLQf?=
 =?us-ascii?Q?k7isyzFqnbWicb1MGl1oLW/RUyZZByeew1uQOrwGyCMHX15z+qqUEYS9AGkd?=
 =?us-ascii?Q?2l5ACKWlLS5/iVC12wmA1aSfX/1nnFCPrO9ajHHzYu3/4VycAvZJgKnOZIcZ?=
 =?us-ascii?Q?TiDMcNU/ZfsV+NhhHNIvN9JiHP0rOVrwT+Fqms5aqD6epMBPiiFDUa+eY2Hg?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	35EeZDil/zMa2pKD4LJGxCB1468MI305YY62UiPs4oY+4IHzR9xSAWXVTO8ZCNlNhsF9/nJyVPK7fAF5Bwd6DHux/pudL/k2Cp6OAlzILDfeoj91yzedOFrsxzCCGqDf4ykKUA97h4WjDwsHf4yuYinNT33SlHbRtCpVwaKEo+imTZKqMoJbhvz+T/c/XrbSok4/7rvzJQ9tlADAstrIzFFwIkwiDBVVp9XiHSI5kXOw8tT9+LPTb2svp/QEdXpDdASxHMn/klTcuHqdeBOE+lJW01lPXInbTfESDHPZ7/XB/V+JPOS6gGPKJkeXGVvTIHK0bEqP6LPJ2CmwXpzWg0EmaTEGE8T3YiBx/44LwY/5vGUpW6OuSsWACWGoczhYQyMFs5C78yncSa7uajX6pX/JQvD9/HnmFx4yBNneexvYHUVEr5g3hBfmUfAEwXauBd1M7QFcAvesSpqive6kbWhGq/IlXBv27GCesLfFhiXWfVdkDYPw2x6xDqUNNb+XGIdkWb10lQyOQxyfiXWJyfX74bwnGecvNtQ7WXC7GANxQHuKoftSzl+XDgzeM7YN82OTWA+W2DN/WmbeTRCnkiAQ5OJOlSNmNe4USz/ozF8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6289c0f9-d0c8-4147-abbf-08dcf5023e45
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 14:35:16.4660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ILqgK4LA+kbAUFxE3zVLrcexcfO2fYk/WUlolY+vGI7UUy65gLdrdFV/+k8UUVW+SXUmCWDCD8izzQZmmI6FlQRi0S7BGoyDMAlXqgFvUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6341
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_13,2024-10-25_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 phishscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410250113
X-Proofpoint-ORIG-GUID: K9TtXVm4H6na8vQpr6s2GrKZPNE3wu5Y
X-Proofpoint-GUID: K9TtXVm4H6na8vQpr6s2GrKZPNE3wu5Y

On Fri, Oct 25, 2024 at 02:34:23AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> In ignore_clauses, for an underlying probe uprp, we try to
> decide if we can safely ignore clause n.
> 
> Meanwhile, for some clauses, the probe description tells us the
> clause will not be called for any USDT probe, regardless of the
> underlying probe.  For example, "syscall::write:" can safely be
> ignored, for all uprp.
> 
> Add clause flags to track a statement's status.  Specifically,
> a flag may indicate that a statement can be excluded for every
> possible USDT probe or included because it might be needed for
> some possible USDT probe.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_program.c     | 15 +++++++++++
>  libdtrace/dt_program.h     |  3 +++
>  libdtrace/dt_prov_uprobe.c | 53 ++++++++++++++++++++++++++++++++++++--
>  libdtrace/dtrace.h         |  2 ++
>  4 files changed, 71 insertions(+), 2 deletions(-)
> 
> diff --git a/libdtrace/dt_program.c b/libdtrace/dt_program.c
> index 45da4f206..23b91fb2e 100644
> --- a/libdtrace/dt_program.c
> +++ b/libdtrace/dt_program.c
> @@ -20,6 +20,21 @@
>  #include <dt_probe.h>
>  #include <dt_bpf.h>
>  
> +int
> +dt_stmt_clsflag_set(dtrace_stmtdesc_t *stp, int flags) {
> +	stp->dtsd_clauseflags |= flags;
> +
> +	return 0;
> +}
> +
> +int
> +dt_stmt_clsflag_test(dtrace_stmtdesc_t *stp, int flags) {
> +	if (stp->dtsd_clauseflags & flags)
> +		return 1;
> +
> +	return 0;
> +}
> +
>  dtrace_prog_t *
>  dt_program_create(dtrace_hdl_t *dtp)
>  {
> diff --git a/libdtrace/dt_program.h b/libdtrace/dt_program.h
> index 5f57e3615..5f11ef3a6 100644
> --- a/libdtrace/dt_program.h
> +++ b/libdtrace/dt_program.h
> @@ -28,6 +28,9 @@ struct dtrace_prog {
>  	uint8_t dp_dofversion;	/* DOF version this program requires */
>  };
>  
> +extern int dt_stmt_clsflag_set(dtrace_stmtdesc_t *stp, int flags);
> +extern int dt_stmt_clsflag_test(dtrace_stmtdesc_t *stp, int flags);
> +
>  extern dtrace_prog_t *dt_program_create(dtrace_hdl_t *);
>  extern void dt_program_destroy(dtrace_hdl_t *, dtrace_prog_t *);
>  
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index 11ff01051..9ca190b72 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -27,6 +27,7 @@
>   */
>  #include <sys/types.h>
>  #include <assert.h>
> +#include <ctype.h>
>  #include <errno.h>
>  #include <string.h>
>  
> @@ -37,6 +38,7 @@
>  #include "dt_list.h"
>  #include "dt_provider_tp.h"
>  #include "dt_probe.h"
> +#include "dt_program.h"
>  #include "dt_pid.h"
>  #include "dt_string.h"
>  #include "port.h"
> @@ -270,7 +272,53 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
>  static int
>  ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
>  {
> -	/* To be safe, ignore nothing. */
> +	dtrace_stmtdesc_t	*stp = dtp->dt_stmts[n];
> +	dtrace_probedesc_t	*pdp = &stp->dtsd_ecbdesc->dted_probe;
> +
> +	/*
> +	 * Some clauses could never be called for a USDT probe,
> +	 * regardless of the underlying probe uprp.  Cache this
> +	 * status in the clause flags for dt_stmts[n].
> +	 */
> +	if (dt_stmt_clsflag_test(stp, DT_CLSFLAG_USDT_INCLUDE | DT_CLSFLAG_USDT_EXCLUDE) == 0) {
> +		char lastchar = pdp->prv[strlen(pdp->prv) - 1];
> +
> +		/*
> +		 * If the last char in the provider description is
> +		 * neither '*' nor a digit, it cannot be a USDT probe.
> +		 */
> +		if (lastchar != '*' && !isdigit(lastchar)) {
> +			dt_stmt_clsflag_set(stp, DT_CLSFLAG_USDT_EXCLUDE);
> +			return 1;
> +		}
> +
> +		/*
> +		 * If the provider description is "pid[0-9]*", it
> +		 * is a pid probe, not USDT.
> +		 */
> +		if (strncmp(pdp->prv, "pid", 3) == 0) {
> +			int i, l = strlen(pdp->prv);
> +
> +			for (i = 3; i < l; i++)
> +				if (!isdigit((pdp->prv[i])))
> +					break;
> +
> +			if (i == l) {
> +				dt_stmt_clsflag_set(stp, DT_CLSFLAG_USDT_EXCLUDE);
> +				return 1;
> +			}
> +		}
> +
> +		/* Otherwise, it is possibly a USDT probe. */
> +		dt_stmt_clsflag_set(stp, DT_CLSFLAG_USDT_INCLUDE);
> +	}
> +	if (dt_stmt_clsflag_test(stp, DT_CLSFLAG_USDT_EXCLUDE) == 1)
> +		return 1;
> +
> +	/*
> +	 * If we cannot ignore this statement, try to use uprp.
> +	 */
> +
>  	return 0;
>  }
>  
> @@ -453,7 +501,8 @@ static int discover(dtrace_hdl_t *dtp)
>  		stp = dtp->dt_stmts[i];
>  		if (stp == NULL)
>  			continue;
> -		dt_pid_create_usdt_probes(&stp->dtsd_ecbdesc->dted_probe, dtp, &pcb);
> +		if (dt_stmt_clsflag_test(stp, DT_CLSFLAG_USDT_EXCLUDE) != 1)
> +			dt_pid_create_usdt_probes(&stp->dtsd_ecbdesc->dted_probe, dtp, &pcb);
>  	}
>  
>  	return 0;
> diff --git a/libdtrace/dtrace.h b/libdtrace/dtrace.h
> index e636c5065..20672d3fc 100644
> --- a/libdtrace/dtrace.h
> +++ b/libdtrace/dtrace.h
> @@ -161,6 +161,8 @@ typedef struct dtrace_stmtdesc {
>  #define DT_CLSFLAG_EXIT			16	/* exit */
>  #define DT_CLSFLAG_DESTRUCT		32	/* destructive */
>  #define DT_CLSFLAG_AGGREGATION		64	/* aggregation */
> +#define DT_CLSFLAG_USDT_INCLUDE		128	/* could be used in USDT clause */
> +#define DT_CLSFLAG_USDT_EXCLUDE		256	/* could not be used in USDT clause */
>  
>  typedef int dtrace_stmt_f(dtrace_hdl_t *dtp, dtrace_prog_t *pgp,
>      dtrace_stmtdesc_t *sdp, void *data);
> -- 
> 2.43.5
> 
