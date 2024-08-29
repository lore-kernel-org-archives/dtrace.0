Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF03014A0A4
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724908974; cv=fail; b=mir6xpOTS+RwTAItKmHi5LDUKgu3I/YxYTKzd8H+VTttZ30HeWD4q+iAaQLB4EmxSmQlGUSEqsVomvDLMPCc2m3NSAMYnm0xxfM+lQchnFjGsg+8aarNLS8V8Byl9ll/mYQbnZfu2Xz41LT4UfhPh+8GeKpB9zRK6Tz5SbH/VSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724908974; c=relaxed/simple;
	bh=mNUtSCFnGOdcTvcC7/8qNz3h60OAqXG/XQbA98MtvAE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mVQQPiF++cyYUP4VACQHvq+kcfnVxb3lk5Y9yj8EzCmJ0JGt23Xoulk0UGf33y+Lp7b5FRGtFyiiqqE+1/wk2RnVywVSNwPxJP+o/z3MPevyTb5YD8A53JMUgsFIwlmdOZHFpL6sq+1PXY1NompybZ29YhlESZthGeCHJoBhri4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Y7Tcq/Lh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XrwjORue; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Y7Tcq/Lh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XrwjORue"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1g99g024945
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=/Zb3Q0lGQEHoVj
	Wd6MfwL6LoNttcR1hOve33X7wfSGY=; b=Y7Tcq/LhsF1XZ22r1i3nYBokMp9m0K
	GOLhHqYFm48vMkCFvdFg3X/J4id/SL6fpWGUpVvwSSJK73sQm07Wa3xLffW2fNsT
	YFHKSNzDu6yGCcl1Mtf4OWjZw4TSq/NfqXPN1KraAO//BbN+1QqtVaiE5xbh5LF8
	PEv/Iq8AL4/cMW8ym+cjP1KXWa0n3Is0sDqmhHNAZlPI1zWRPbPeQtmF/kuMR8nN
	nG0yaFrftLzDGiUibSA25VJRGbB3UAhVheJwE8BwBHVlP9er36nQIT7RNEY7Pm09
	HfW6gaE8Lq6+E5QFN7JroXYsI+FUHZDcsGOijtidSNtBr4azbV4KHOEw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419purbaqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T54P4Z034765
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:51 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4189svfhv7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJncuCeSHGtsArVnuSSyGszOs/KsErh2rAvmbwifk5OTwAJdZaDk89crWAmQHXU+Z9o5O91Kp6WRD/1tcu4pjWoxg/ENn4SWrFaxI/EMIaR6TbnwJm0El9TVWUPfBS+87a42TMvZJ9eLxpYtwSnrhd3iGAMvveOODoaulwb66TGmY5XxHCA+Ndrf2CF+5epGVGVw5ChXXFNOI/jMB917ApkSZK00qA8uFOd8aBEjxf3mcvWXYeiI5LM04yca3im9HOfRqgqfYve8+PQXNK6mwyEbxSLMIt7ebROXPBDRftluyz+1nuP8JFlNyXOuVCijSQFmxxiMploAhIAipsKlOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Zb3Q0lGQEHoVjWd6MfwL6LoNttcR1hOve33X7wfSGY=;
 b=APtvdDqrFlSwt4Za4cZKxOArNC+YEuuCHcKjPnz/PqejrIKoq1MZwlHfoU5NA21aCoqdc/K7A+m2xR7OGZcroBX2S7q9KGngBBmw9+LsvLFJMm1uS7apMfvBUMFu4p99Av7027nVkkun8RLxW0QzFeghx2DO4d8/ktq+iiYm9hEiSol2rJmdqD2rLE8dBnGtw+LkjinbqqPDM0U8X/J6mKRAgZuhlZmYlbT8l2q+OvVNDuYD0f4nPxF8rOCmSG7LIu4VO+2gPksKwzszAaJ4mR6x7nlzkh/6J94n/uzb4K78QJiGhBhfA3ACq3fvIOTM2Oq7LBN10G2AA9e3CUeTuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Zb3Q0lGQEHoVjWd6MfwL6LoNttcR1hOve33X7wfSGY=;
 b=XrwjORueWF8C8pctmURQ6tsDRc8qLsEmpvIgzwPC0cuvtuH6ZkG4GOlDwCyymobAN+qQ62JUydK07BUthmnTI3f2pzO98ij3BQS4PHDVQzHF0LWRiXFL0llyAaJ8Q7Y+35kATjICyuZBWGfzUR4yy3d1mETtPX8oc/jMd7ig1ww=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB7008.namprd10.prod.outlook.com (2603:10b6:510:287::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.18; Thu, 29 Aug
 2024 05:22:47 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:22:46 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 13/22] Eliminate unused args to dt_spec_buf_add_data()
Date: Thu, 29 Aug 2024 01:22:10 -0400
Message-Id: <20240829052219.3234-13-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052219.3234-1-eugene.loh@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BN7PR06CA0060.namprd06.prod.outlook.com
 (2603:10b6:408:34::37) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: 618cd009-14a2-4d07-7a6a-08dcc7ea9dfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cA4nBcPRt2lTc6EcPZDnV0hGd4Q+oUK7L7FdktYG+4v54Zk1T4vB7f1nGFKb?=
 =?us-ascii?Q?zsF3OK9vVWprAQ5lbn49TfSUTVAWZIAXJBeasHhIXy395Q5suVKb+dm2WJVB?=
 =?us-ascii?Q?usmzgZaYLPdXwEvU6qfSpWZF7oz4kOhao0aPpbYBX0NILE+pHSfvTitCr0Y+?=
 =?us-ascii?Q?RpLInOrCNrhuVczEgqHAAtHEgLqL0P+NPsFwRyMhAYsW3NJJPQy9AukGWvPt?=
 =?us-ascii?Q?Pb5oKcW67uFBJbwAggZB61Cen3NjpiLVrjMVT1P8mfdiPjJFPi1mUfFr7KyY?=
 =?us-ascii?Q?j+ebk+86eokmbdrjdECj3mTwhhP/GIv7miNo8MwY7NLOpmEgQGs0xlBiexwi?=
 =?us-ascii?Q?c1212BZoK5Nncn53TQNYVsLZYxnuQ22+gojemf0y3v1/zyIbK6r9VH6LswZI?=
 =?us-ascii?Q?ZsSZTdxtc5PjRC2Ic1yPFDMAxQqsPUFumxzCvvz+sgthKKkfJo7PxGla4al4?=
 =?us-ascii?Q?EGAabZ+qU0BR3AQz2IG/fBpkGB9yOctxRjgVgg5HN4uWCF3f2VCvTpWKqIME?=
 =?us-ascii?Q?HW+9hNy5jq+kHPn9KEbPaSgy8bVS+ZDzccQv6HkNHgy47XylgtbPmZiw3Xau?=
 =?us-ascii?Q?PMtjyx3fhsxi4ehU11SNW5fqp+YCbGQmief2BWspHSwcmm4e5USpRBnnV9EC?=
 =?us-ascii?Q?cedBhWtE66W0Y4Mk7FpLAFF0nC23psxx32GRPGM9V3AWjuW24KYBRPUcc2+J?=
 =?us-ascii?Q?eSXx1Y6k1sGXsHbFXnv8YheXiCCUjspxgjy7jENjusnXeu9QmdOYj6HtSt2O?=
 =?us-ascii?Q?oS34Ez8qczTCX/7Fm3azqBE9yWiSo8dxzw6r/GIPLysxIu7SgElsoTv7OkbQ?=
 =?us-ascii?Q?1A4PHH+oR2kzwXUUDM8HK9fAgZIAjNjbB7iROw6tALZTmBfzYBi72+AfF5S2?=
 =?us-ascii?Q?ShPAZr0QL/c5gr7s3cDonZ9Ff/6b2a3SmsV/IekHcjWeYcX5ca5WZf8Efkp9?=
 =?us-ascii?Q?QtUmUqBHeY9zTfa+TmLrPvYtd45NotSjhiwHmwXiAtGFjMTwc8hXPPVCZXGX?=
 =?us-ascii?Q?QEQH7ZUazi/jW4TiUkgtEmcmNmxR/52l64d572thsMFwaYlkNoPOelqFd6s9?=
 =?us-ascii?Q?HDMODNFqJHzk3QY7kQi8iO343K0SGEGwfMcD+m0rtRfFoIgbajw+yEXLkBUs?=
 =?us-ascii?Q?4VGcYmLqBz5fZcGt/LutO45EPu8hLxYxWpPwippx8kU5/6rA6Fk9M35ZyCxz?=
 =?us-ascii?Q?bwfrBL+toUXrrqINYlAskLbBdwn6zAfB0aEcs3itx8zmvjE2RvETryr6jhPU?=
 =?us-ascii?Q?XYI8EhlcQ1d5Az2sGYimhymLjejdh3S2ZEwf9fEGN+F0NmoiYBED+3RyHhdH?=
 =?us-ascii?Q?6kuZwvhXIGzq+jGzg6+/70yuUdLLZeyFrts1TACR+q5Jeg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RQXzd02cETIE1EVks9AxLUv1fhGc85sOFL1vYMOipZZQwoOvGi6rocO9gzOW?=
 =?us-ascii?Q?VeICVbGu6n3PPUMS8pd/CLHFCOpNWQaGOitHRkZXKxdSqcmhD99IwUfarosB?=
 =?us-ascii?Q?GAUlcJnpLX+zbx1z5XAu5786NaG2K67074oIKqqkpFAz7OVglWttly2EnV8D?=
 =?us-ascii?Q?U6pTx1V3bmxKqP5LN1q99pwnOs3INLOX2xqE9MX9M5FTgosN9YoC2bx69ijb?=
 =?us-ascii?Q?yzS0SXcBB5wUCeV5L6IqNHrwzTikcybUpUiBFoOiqfnFXbO1f9LyEh/sS4TQ?=
 =?us-ascii?Q?wwyZB/9CL2Y6bNYDYTfo3Y+mZo9iODdntjMoKWKdJ14mcFPN9ebjnrbkgr4E?=
 =?us-ascii?Q?ugjXaS9YOW5VqAXgdwTjuEU4JZeUInrO++zRRFJtbaL+QaLjHeztSdVeA1Bq?=
 =?us-ascii?Q?NaM6LWaEkcjD/4lOU+5Tex4d4qfqWzXUGIwQbcleM7gMgc4bUssQ6kYFGdy+?=
 =?us-ascii?Q?wPrVO4o5NxYxoqXQErTLQGdV4mEkLsMpynzo9ypHISap9L4HYZJs3cEOhk5G?=
 =?us-ascii?Q?52eVwyLVQRJJMnhY+G6dU4Vlm9m0dZkJTKXdMKhGkhBfXP6tWfQ1xXGZBoNx?=
 =?us-ascii?Q?8UQMYGowp6UQ5ri0SrjqQs4S6yvQ5tOsBKj+RlJ4WtX1k/oM190iJOIpUktg?=
 =?us-ascii?Q?HUa5PuliDhLhw0y+Lb+nEgvxFrAu/zku9mdFLYJ5YQ8KS/427G/n1W+m2/ue?=
 =?us-ascii?Q?eRcl5H6mRHaJpGQZ0UoHBgZB7tTZSoGUY/KVl2x4hn7mflK9KoxnoDsN/wT/?=
 =?us-ascii?Q?6oOFrqNsiFcpae1grO/1j9zTAjjZFU+TyGyyOXcWM+i+tdpEeT+gvJSGpio0?=
 =?us-ascii?Q?eNCUOBRPaZ6kSVJsvrNvKs7pivuOo4jKlQJGwFB5idpKxgP9Q2CB91mLV5d/?=
 =?us-ascii?Q?X6zIWGVQmK6Gg4wU9qe3S9ajZXWQqv+O+nl+SlEKr8cfMoVDl529FVEXwTLp?=
 =?us-ascii?Q?diKZGgdgNKKEtfRrdMReWO5ZwpQl3F3Mw/yf5E8eS2d5xdbE64PTNRHGoRvq?=
 =?us-ascii?Q?yfN5HcezNcClw1l1OBKIwNUpkuq+nW8VBHJ9xUK4SMsCyQi/jrC/lYK9tr6E?=
 =?us-ascii?Q?FiRNempAfshA9AXiawko0zSrMxeGCjesO4WcDFp4zsc4YCXIYdWMLatWjKdz?=
 =?us-ascii?Q?oFp1Fe7QNFGFNRwojQXsl0ZQWVOzWtoLbkG2rMrvBUr/EjdVwcZpP/977RAR?=
 =?us-ascii?Q?lzzmWDST9dL9iITk6UYv8LWKq/Z/Hl5cF2lPg7YO1Dko2bgZRvDp+cGOHKZc?=
 =?us-ascii?Q?gl7wUWX7fdc46YFdB4QzzReJ08mkwPUU3VIEszgMqzDiw/ifmc91FRLekiwB?=
 =?us-ascii?Q?m+DnWaiF+b7su4FzAMWJqcM0EahXE3HmAEMc3EwwvYBZKUSKuv297BNjsup0?=
 =?us-ascii?Q?Z5k8XODNFfsBnRPNkMWE43OCqrVB6kEa0r7OVzaUDtOKsaGNLW9nn7lzcCyl?=
 =?us-ascii?Q?PhzFklBx5vCczQkvBeqammfv0D+AwqfOa0XuJHxipfQBdHVBx4CC/iIunQ9J?=
 =?us-ascii?Q?6doHx39zGJF7AmicySQZ2ju3bppw2+IsELJb2TLDgWc3Khf81jeNy8YsA4/m?=
 =?us-ascii?Q?WpQdxqoRzHxx7JSwxm/RCs9bh5nLbhm135R4tUA7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BJ6CMOIk+nHGYGtQAhTsqihGwid8dICj0Q6oi+M7Z6FiTgWD6c9jm3XEmWEDLWY+xl1oSukp5nowU8JKYfzWvunJehUY0BpDIFgqz5GheQPwv3vG41kRdV7s2xtBkiNM3t45Aa8+3GL6CRj5b/fpEsO1cKvHlz8QFEpao+5cNjzJOCTgXWzmkevQTOZg+/4DItjA6kNF03nP1TxS0IZb7VK8yLBJYvznV/CLJn5Z12WHwLsxMiPRhm5uaMfvRMC4EtWMEL6DyyGGBB++8o6VbuBE9JpQbi29Bn1iVh1lKPWt8vk+8bgI4QdxxefE0MO73rQLKyLA3CqlTUjxWIhNQW7QhnBhWV1El5C43YELve5dP6W/dWlEe5RvR/P1EQ7FSjfASYwYsPqb70rYAy00MtacNTp5ygpuAGm4zaHJIHEvuVV5r4OdHe7Swb688RHRSLSzBSA7mvfwzvcSKALVXlh2PfTnG6UjGz/Hn4cTTEzAGgpnlpmBlCbMnBgK+TacNbgj84ulZip36AKpt0tgRC+kU5FGz/1WNMMj865+ZilNGuXYkUsuIPPIyitshHbOZ/K60mulM3kL1r+ZJC6KS7NUAeJILmvs88Ynv1c7/Kc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 618cd009-14a2-4d07-7a6a-08dcc7ea9dfc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:22:46.9554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MQX5d6jQSRsWTLLgENTTTU7zyJLM5VmWX9TFR9358yUl8zgkluQzG7n1dOZLsYAqApphbnMIbzDxqAXL6dpRog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7008
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-ORIG-GUID: itAWGv7y_A5FSRuLqbxY-AUEe_GqKFgP
X-Proofpoint-GUID: itAWGv7y_A5FSRuLqbxY-AUEe_GqKFgP

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_consume.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index 6aa9812e..51eb6c80 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -2060,9 +2060,7 @@ oom:
 
 static dt_spec_buf_data_t *
 dt_spec_buf_add_data(dtrace_hdl_t *dtp, dt_spec_buf_t *dtsb,
-		     dtrace_epid_t epid, unsigned int cpu,
-		     dtrace_datadesc_t *datadesc, char *data,
-		     uint32_t size)
+		     unsigned int cpu, char *data, uint32_t size)
 {
 	dt_spec_buf_data_t *dsbd;
 
@@ -2265,8 +2263,7 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
 			}
 		}
 
-		if (dt_spec_buf_add_data(dtp, dtsb, epid, pdat->dtpda_cpu, epd,
-					 data, size) == NULL)
+		if (dt_spec_buf_add_data(dtp, dtsb, pdat->dtpda_cpu, data, size) == NULL)
 			dtp->dt_specdrops++;
 
 		return DTRACE_WORKSTATUS_OKAY;
-- 
2.43.5

