Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE66C15747C
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734733655; cv=fail; b=FS0pTCkzb54l0Lv3SLVVo+hnNcVJJNsx6BwOPDFt47HqXVNcm0lK1H/IaqOoA6AMEou5pjrI/1+WJOUrYSra+g6xZIOkTFk0CxNrvgY/kPU91VuxhjJatkwbW9fKSdhrHreCe7JFWUhzPJxvZw/iqWe7tb9nbcLFFygYE31nzZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734733655; c=relaxed/simple;
	bh=k9viIJrUiAWwmDL238AT99qoAtA6H0QAu9Z7N3dYIbw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=upC80vEo18AIbRCTip9h36UywNenytE4B0chJUeDRTLVT/cUMYaWL4uBqxougHJbHRyBbFrH5rU2p5pfaM5JNDCAnXOkDC0N7wVLJMeGMCW3+MOFtPpoK43IM7tO8AFZEuPOqN+4YA2sb2pBB6UwlEoFO/fPVbtpHu/Zfcj08Jg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nK5emNiq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ofGFO5C6; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nK5emNiq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ofGFO5C6"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKMMpqX018433
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=xPgEmA+Fmj8bkol47T
	8q6N2MzqnJNGySxjy2607WDkM=; b=nK5emNiq9JnfqJp5fVLeAcmpnny6x+zIlJ
	bSltScVEWpGyk4qYuzv+gy/reEMgqZHmks1jfnvzgBzGZSmnHsPSHxcBJliVxMpC
	2o5L9QqE/Rm/mN/UO1/cSq8wMcQ6JoBiIhmPeINSgJ6yQnJtYjPBxJfHvKuuLr7H
	6uMZ91JBwaxZIVlYQxMgSg/csorsFawkzmgIjoSSzyi2g8fC8+8bF8EqtzDgiHZA
	gRssIO42uKbOUk4x8l4UwSYldeNL9eQjidFfRQlPVbAKcXffTCw3mFnOW5SzsxiO
	7mTHtch83QJLcc8CkD/mJkhYPZiOmFuOgzbZGsy0PHEI7fnitY8g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43jaj5ktx5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:27:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKKnon0035296
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:27:31 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43h0fcymk6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:27:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G0oEoimlH5K4hWO6jc5f38g0U7c7yCsRuZC6DuHDvwGcHGbeRlnBas5dIzq7E4bQcrofr4mASRjwd+QcueYBdSPAlvanLt653+qJq1u2qNk3mlP1Qyj0+IwVyRTfBbCmxKpRnfx7TkF4MK7Z5b4o1CyV8fhkebQUThcq3BD8vTtSzcT8y1XQXcqOuD9fupbXCVDm8XsosPyRPDR3SxLQYJ3f3IRf532Q4jyY0Y1rqKjAVhyX4QEX5Cygbn5l8sWe1YNH62a4aF5MAhlqzpwKgr7eGovWqdHDZfPEccUtJb+bCAOZgOKup1MKrthAreLjJN/LTE66gGTB7uBy5Q3/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPgEmA+Fmj8bkol47T8q6N2MzqnJNGySxjy2607WDkM=;
 b=sLREbi+Ll7iormjeYXwsFTxIckDVkfwBsnMZ/dCcRFLPEhKtFwjf8zf5YWsCe9M7cnlvSVFh9OTPYFQXIx35wOLbZzAAcPugZNQonjqfgLYeYYeBL3qQFN2Rt6M1O2ybwp37sCyGYDBYa9YzWvmH24gYm+dQKsJe9XZmZBdoTvx3ZDLkwe7fy4SQ6qoSfm63S/qWGRIhxnN6/EptrbWlmhAi0Z+h1ifk0SDRKyIlJ8AysVYsR1zS+/ahVUFbLL8NeTx0MsHBUyIrVtEym0mBttp7A0G882jnRMOo+HOJxRW8lIM9Y4hrvTZiQ8VNpvczKQi3fBaN2/uNiZ8wysdtVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPgEmA+Fmj8bkol47T8q6N2MzqnJNGySxjy2607WDkM=;
 b=ofGFO5C6oJLwPdgNK86qb6pJoL2fPd5Rxrp77TyorQqnE8I4K/f89Sn5swWrd/0ehLpNRC+5kLe7hlR/ZSINyG2AHPNPAyU+rNflgFfWGyoWO+izdz44X1W/AC4MxP2nCvQMqT6nt+ghEfhR99DAfBoyC+6u0TQoQonUpXhX6/c=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CY8PR10MB7380.namprd10.prod.outlook.com (2603:10b6:930:97::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Fri, 20 Dec
 2024 22:27:29 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 22:27:29 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 4/6] Remove unused function arg
Date: Fri, 20 Dec 2024 17:27:14 -0500
Message-Id: <20241220222716.18511-4-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20241220222716.18511-1-eugene.loh@oracle.com>
References: <20241220222716.18511-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0232.namprd03.prod.outlook.com
 (2603:10b6:408:f8::27) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CY8PR10MB7380:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b398e90-72ef-4084-f798-08dd21457d23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AP6bOeAn+whFikKXFkM/p0vcZxflDt5zNw477y5IF8lBcSzEbta4tmrFNuFn?=
 =?us-ascii?Q?O9im9tanGVx18p7FwH9fRxZJx7YMVaEi2Cvjs3FvpEV+c3vahRpBC5BbMhD6?=
 =?us-ascii?Q?XLsrRhlFWSNHS5wz3eg7mQShR3HZkavg/eyqtQV1cKbZUhnKkI2OjnwnUHUS?=
 =?us-ascii?Q?AyALjkmzjKQvOsxlExc+2Rw7a4nC2YuAnxdmcAhRvFVX5+3aMNlkR8B98cqU?=
 =?us-ascii?Q?0t/A7g8DZvpSGITNHNCYxIpDoyrCecDooHOYPRa7/Or8aO9gULH9bdZMiY5C?=
 =?us-ascii?Q?zsaRJWfCstVeabluOChq/6nvwSn5dhi/4YSoFCt60kipvVnwN5ILsZ95k5as?=
 =?us-ascii?Q?vX5E19uOADBdJEQE8HUH+mNCJxlMnu1Ub5JeLSogXWlaA7q02ORcjbhjUXrH?=
 =?us-ascii?Q?wwRbS8oPbvowaakabgcNFMoQBw8veJCESjO9SudpXtBt47pm6jKu8xwhpSVG?=
 =?us-ascii?Q?0RzaFHoFAiuMpfz2hbPE6QpOUbiGXLGKJU3Hdi4co74Ffyc4sFLbfDthLQrS?=
 =?us-ascii?Q?QzS0eeOla/HTCGAar1j/9g9GpLAmSUdeMvF3DXtb1NfUD3U1wbCeJub9Uk3u?=
 =?us-ascii?Q?PYmkmwqagrJF7bB4DEaWyltJglQRcIGMiL7/lb6L0HGCITtKGL278eHJTqYC?=
 =?us-ascii?Q?uzzKSBQqW3MOwnssVo2uHW8YVJpbbB9Fk6NgBBGa/K1LMu3JCwySJS5bKQ6h?=
 =?us-ascii?Q?2VyTVddFMkcBrEutHIZ0GyCRFmjUnWnp3hWqQ1s/69NwQMVvJDHMo3uix5/h?=
 =?us-ascii?Q?PBtCjkiqXjMns7ioXp6YS84YZBIKNO3No2IrbcGOceJPQPY39iUIO73TUGKg?=
 =?us-ascii?Q?zw/OPjD4mF8NiamXHkvm6ez8GD/kaO1qguWmBDchPTowri1CMLDV094RWjMb?=
 =?us-ascii?Q?MIamc+/HVFynzR9VcJJhSe1X8s20A6NZeuiSQwmVpvBOFFzI99AWirGcIXXJ?=
 =?us-ascii?Q?pLAf99rZ3yfhGQUC9g+oZoWYw2CJ9JHY3uB2oYzppXpyJOgkE4EF66E8VTew?=
 =?us-ascii?Q?/kQCQVcXJe/U+QtGMajQpyLRsDnR8H72mykjATLrXIrXYSxbVA/q8z3JVS/s?=
 =?us-ascii?Q?xg7dUrrvxCRuP8fvltfhIt8oZB7T/nHJJZoHh6r512+4c9aiWsTazu1adrlQ?=
 =?us-ascii?Q?WN+7crhdvA2nRPsgtruj0mH7cP2E9XTv3NQ5bhOgGQI8NUKzB0U9dWEIHSM2?=
 =?us-ascii?Q?0uBoUqjGXXil5EaF7f+VlkrO7y/Jg5DpZT7VgPCAUUpryyuMd0IxpAjKxpbC?=
 =?us-ascii?Q?/NbJsQEqIqQfCX2enlu62Yxqb1bw6R23kbCwHnXZPkC5OOAkwclCQ2C0CEyO?=
 =?us-ascii?Q?hFrsoGwCD4ovTQ/93RXONPsrCUhJS8woPUlToGKBGwMglgP2jTjLsaIQMyje?=
 =?us-ascii?Q?DOAAt5ek9N/Wj3z4q5GYpAdbKPOZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hJFMAyEZzLKsqh7jE1X5kuaXtj+MHh4c7hHhsKATAfnDVo6+lwFhZM24lpmE?=
 =?us-ascii?Q?MxUxMGgl8C/2o8xvXl+xBhKxpHj3QBqsiDNAL50IofsPw7IL2aXiWn9xoTQX?=
 =?us-ascii?Q?SnauU++XGvaWGMp0cyGG2D5GD8Pt2x3HgPVkpgsOxH+zreM9WTZOVGFu8Hbx?=
 =?us-ascii?Q?0NxOcs4xC/aYuwD68L4/rFXs0JZR0K8W2aJntAk1AxUNnEIPp4vjQIFNWqkm?=
 =?us-ascii?Q?sfGe8ldY3YPwpGEloUgg0ttgYE+gZM1MeXYMz6qTKu/dl8m3ySky9CnJ/4Sy?=
 =?us-ascii?Q?hrWwthDFCcuTw1Q+x4BQjwvRTn0ScfK1xwORrjxZX3zl0RNLWtTWHqbtasxz?=
 =?us-ascii?Q?wl8KlGRDxldlHsSKeFjOUenTtv4FnNZZUfNXWwKAT53apVl/RlFSzhs1jTpR?=
 =?us-ascii?Q?vi9tNBamDsLITIIGTCNTt9ZcvyF+rbIRIQHLjLzIf8N1RYbX29kXB5S/2Ho+?=
 =?us-ascii?Q?eOtARQTUEnoBIGnM2S11ZyRLWCpCX9bCIfngzKWN5k70BD1/j/9UyLipeJcu?=
 =?us-ascii?Q?QKpWerrjLYVtv8RGaajJAJVn5bLwHx63rzuaFZ9u7gtP/rcoO7ZUOqoLLbGm?=
 =?us-ascii?Q?+s2QqrC3bz1UBkNZRqVosWCcy9rIEesbfXZImR9SCGWEklvf9gnGYc/KmCvM?=
 =?us-ascii?Q?SSqziDb/4GEmWx1EhPIzLe1gF2MGLHWqDXFaOCqcHd09QmbYmdIXxaAiBxUC?=
 =?us-ascii?Q?Ygtd/ixfXJVFHGK3rFDsTVBgyq3mv+EFyIU1OIKRhmhdTqrjYwJ83enroLvT?=
 =?us-ascii?Q?LvxW+07QoMeB2Hu+4fP7YyesFm+pkTFHtMwMKFvR5MkLFr0IrsRWX+SQ1ucn?=
 =?us-ascii?Q?aaX3VMgHhUWtEWr9B2UAPv884scHHxbmsTHnK/F1VIBNuxTn7klNEPhRv3q3?=
 =?us-ascii?Q?7qcbzvaXC8Qa6R7AU5DaqK1c6DlIbBhMEzP2Rgqq64rl5ydMS8j5bD7Lv952?=
 =?us-ascii?Q?IPepLw14GLQi1wk8pi6L6diOKySXyr7VG2c1vYo529T16diwWM3e87PsJFsv?=
 =?us-ascii?Q?hBES8Rhet6QEPViN9tBxQi35HMwYjVBpE2wZPa3byXguhLZAIdq41UP8yRRT?=
 =?us-ascii?Q?q1e4dR6hKeplG9F7219nb6OrW0SS9FrLBzdhxzuTaoUgxVFsBry4nUSCVahK?=
 =?us-ascii?Q?9Meto4TnvRvzgNQCAjE/7bW/IC3CwAqIyQ21gOfq1kc21IwxLzHA/+BP1sEg?=
 =?us-ascii?Q?VMZEe9g/Eif/TN6AKwbHtjsIgEP6pmjzxlsgOeSLyPu3jzXUNyD6cM2Gx7Zg?=
 =?us-ascii?Q?MQP37NAR7/MsUouOekYrY8F5EznJDLY5rTMQQFkLfk2//+DTzhmeqlyHZCFi?=
 =?us-ascii?Q?op+zJvliqsrRk8DNJWHCt37rG5WJ25HzryQDIbGbk/QG56Y1hDQJz8zw1NLN?=
 =?us-ascii?Q?MNumiryrrlmuW34OuS2VgRE6AwKkgR/vegr/D/vA8HORCv9nUEoIsWLs6aTo?=
 =?us-ascii?Q?lI7HbXka00cc8ePda/920JXfQ0adMaF1KDaWLw6fMkuiKWn5Wvb6e1qLLD+z?=
 =?us-ascii?Q?yAaGogqU7CxVM/jlY+xvxe6bdlmkisXqornLfzpz4t2p0UPK56e4wz2c41Jx?=
 =?us-ascii?Q?/KxFc5PPa//aPUETSYLGrpiZD9RcIuUdI4INUIJw?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UsEV10Dq1icr5uaClWSTedon20E97RU5KPehypwcnL0yPDMlXvpfiY+dVt/yFUHVvoDI9DOfkelBvK89wpzqFLcCBWSZb7ZpQwjzqx3PJQ8FSv8FWmAeyoOCl+3c6ciHKl9UVm3PXDH+RJJMr/F/k7gD1UH7m/WvHzeWMF2OjWQCp7V+5K4z4xO5MI0VS/DbNgL2Q9JZvBfC9WRV54V3JeqZFJkZzNI4uUdg/R/Zj4ZaOLA8YqrVPnwgSrseza723koMUHeYPMzGNQhKoiu5RD07OQZTdOUgvAi4fiWaGzJoSj1zmK2uUOQhqBNoJMoA3UHR65ppdi+Tf30bIFya84JdbMs75r3EUS6CgJNdlKJVoEkHcoGwROusKTd0FvxZml17Zm5f+cUVwYCX5ZIDihu0HC2d2YfYieLOGC9Ul32pZotu89QQPzZEM1Cs5UGo88Y4ECbzbDRV+/3HEekGkizN86cJxjgsYX/qUUab94LxIqa4nqnXpROiJk84MWb24fkMpXk5Nz4zMmKVAfaRL/x7x8m18yaG2OnSuV8w/PDjWQRvJxk4USqqVVDPhCyfe03i9SivAtuOf+KSLVdvizwphDoCHe6LSJcK6epvUQo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b398e90-72ef-4084-f798-08dd21457d23
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 22:27:29.4107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5MXUOYJQzUcQMKP5JzwJgypoFXTeHzm3+0YbdvrRR8mtQFqud4fJk63wtVeiCPwAqFEohzLZuVN3VjGe40pbIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7380
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-20_07,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 spamscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412200181
X-Proofpoint-GUID: UupuktpcYXyl5Le9MAV2wtEzsI7tPjAD
X-Proofpoint-ORIG-GUID: UupuktpcYXyl5Le9MAV2wtEzsI7tPjAD

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_pid.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index e57478450..b8bbb0396 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -104,7 +104,7 @@ dt_pid_error(dtrace_hdl_t *dtp, dt_pcb_t *pcb, dt_proc_t *dpr,
 
 static int
 dt_pid_create_one_probe(struct ps_prochandle *P, dtrace_hdl_t *dtp,
-    pid_probespec_t *psp, const GElf_Sym *symp, pid_probetype_t type)
+    pid_probespec_t *psp, pid_probetype_t type)
 {
 	const dt_provider_t	*pvp = dtp->dt_prov_pid;
 
@@ -184,8 +184,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 	psp->pps_off = symp->st_value - pp->dpp_vaddr;
 
 	if (!isdash && gmatch("return", pp->dpp_name)) {
-		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, symp,
-		    DTPPT_RETURN) < 0) {
+		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, DTPPT_RETURN) < 0) {
 			rc = dt_pid_error(
 				dtp, pcb, dpr, D_PROC_CREATEFAIL,
 				"failed to create return probe for '%s': %s",
@@ -197,8 +196,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 	}
 
 	if (!isdash && gmatch("entry", pp->dpp_name)) {
-		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, symp,
-		    DTPPT_ENTRY) < 0) {
+		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, DTPPT_ENTRY) < 0) {
 			rc = dt_pid_error(
 				dtp, pcb, dpr, D_PROC_CREATEFAIL,
 				"failed to create entry probe for '%s': %s",
@@ -232,7 +230,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 		psp->pps_nameoff = off;
 		psp->pps_off = symp->st_value - pp->dpp_vaddr + off;
 		if (dt_pid_create_one_probe(pp->dpp_pr, dtp,
-					psp, symp, DTPPT_OFFSETS) < 0) {
+					psp, DTPPT_OFFSETS) < 0) {
 			rc = dt_pid_error(
 				dtp, pcb, dpr, D_PROC_CREATEFAIL,
 				"failed to create probes at '%s+0x%llx': %s",
@@ -363,7 +361,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 			psp->pps_nameoff = off;
 			psp->pps_off = symp->st_value - pp->dpp_vaddr + off;
 			if (dt_pid_create_one_probe(pp->dpp_pr, dtp,
-						psp, symp, DTPPT_OFFSETS) >= 0)
+						psp, DTPPT_OFFSETS) >= 0)
 				nmatches++;
 		}
 
-- 
2.43.5

