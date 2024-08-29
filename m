Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7176BDDA6
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724909188; cv=fail; b=bDWHod2oS6fxz1lZ0TJLHRXoIddmeytSrCO6aVlM5oR/MP8b0euyw4BjTa0KGp4l3yVBEd7N51TtLiX+nYjQypb3iTTmGL0GXcRZZi08/tDKl4dxmp5KIewt51X6xNPTUo4Lo+Om/5S0OqnZ1jb5Lo6W5smB3j6NsX1rQT76U2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724909188; c=relaxed/simple;
	bh=Dke83UlVooJQTh7oM6OMXav9o/Eh4yq634WzkKkdACs=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o6wTf9ooIPlPiW9HENs9+7rqFkbv6lpaUCBWKC6VzLUKxbLnKLihGCDplUkhkoIoBg2iFEzEAi9Mu63xJzY+/5EyPS+yBTV4nKN3PPiNdrBOghPwHnqc+Yw/BY3/fsiPWpwa/qIq6OwvXB2arKmGk96VIrPQmLR2nLsaLUxL4+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BOOFzTb3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gE2B4nON; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BOOFzTb3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gE2B4nON"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fbDh005691
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=wgg5AHoiM5zD71
	4fQWdiuJ+iy+yhcreTfPbchFreQ3U=; b=BOOFzTb3xEZHeokySqf5t1GuQWOpRJ
	xoyR5cqQXEEnbwzaAYLLW8PE7T2geQNud608aH897r27aQnCkyx7OUfiYAJL51cl
	sbQvnTKe3SPaEqWm3k45dKETjbiRcMcx0ehMK5H5N+FBo4PKD/hvFOF+YuqiQsw2
	lhhib3zwubMLC11VLqtUnE3mxkqnP/EXaK0KkNQ5pKIn6yJPfRRhtgfXJLMHJ/Bj
	upWaqx6fRUySS3SXj4agKXU6k1s/cuaCbLc66iDI5jyn9P32H7Lkm+49QTp0MHy7
	2h6r6ZNR9CEsCMJG8HfqcM8THkjnl3/7+lspC63A/xYTg5diAywKxdRw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pwyu9ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T4Bsjr034954
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:24 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4189svfp66-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTTDLgcCq9EfrCjNimMgwbBpNzV864/pIQWSSj2TbiPAJ1RAyViL2ESN15izucbPodCqToCOeCIzkrc/y2+sFeF/UQU1vBxFU/6xPo8fGLE8eOFK82OZ7b4sNSkbLW5r7Sy5/3q1U9yjmK9TWyUfMGjcAQdR7N3Fj0mPXlW8/eIW2Itd1XPTdo1mMSv9S52CIC6yhuK/MTWu2XTIPIxVRjaYUXoM659+wO7mzedHic7E/OI9UHYp+B7xUy2afArvkIRhgKaXUk9Yoilgsxu9kn/4AUEu3zmYvT4wadRf6bQ0ws6YgP2qoEwubWTyKk6F4RxRcvHcXOUiSdtRdN8rbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgg5AHoiM5zD714fQWdiuJ+iy+yhcreTfPbchFreQ3U=;
 b=kIULJQLhM0vOBGs+b7funiDBJSlKTMSAjVSjU2KCklzh1gaWUtVtmBP/ouadNy9RyNQC0nqWz0VF/VLjmIw9+e1s2Q2yx20qrzkcN8nwN/Cx3Rwg5RUOEGhczzjBxwxHB4NRuERNY2JAuzYzRHZ0nfr0+y1RdUM18AqJdQMZSaMQF6cl6Uu1yWeOESSWN/PaZe9jglX7XCTjTipw3vRnizn5qNUw33i9h3lG2TMKY7FnNPyBGUDJLjWobCyLMHHuuH159emot5WYK+qNKSs7Y9D+TncfTtm3D7B5ylDVZkmc3Ng5GqBrS9Peu56Jamaj2W9s6IYsjZsFdPb1WnYv7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgg5AHoiM5zD714fQWdiuJ+iy+yhcreTfPbchFreQ3U=;
 b=gE2B4nONJsc29UYOHRg+9nMuieo97UKvzOzKxQPtuRrPCnoa+OYIP5IG89+WoimaQ9T4qyD3zUwncb7jV5rU+/wy+xvraa8J+fA+0VFl0fJ8vcUelP8dbcLoOYK5v5pYq6nKNXN/xkEAtDVdNUTB4rnT9D5228d78g9bHEcK9O8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO1PR10MB4577.namprd10.prod.outlook.com (2603:10b6:303:97::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.19; Thu, 29 Aug
 2024 05:26:20 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:26:20 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 07/19] Create the BPF usdt_prids map
Date: Thu, 29 Aug 2024 01:25:46 -0400
Message-Id: <20240829052558.3525-7-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052558.3525-1-eugene.loh@oracle.com>
References: <20240829052558.3525-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0078.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::19) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO1PR10MB4577:EE_
X-MS-Office365-Filtering-Correlation-Id: c392a41e-2842-47b5-d3f2-08dcc7eb1d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/6V4pxBLm7NAhpOtsmHheTODzuJPD1837Hd4OCKL+abJNcYXcg/o8gTDM4jr?=
 =?us-ascii?Q?ndca5p9nQHqjeRmjygM+1Amo9LV/HnRnvWRAVYOzCd6qV7JRiuVx16y+DghE?=
 =?us-ascii?Q?xJscpPMN2S9QVgED66oalcqZHtwW0ZtJTzF1NITlHQtPFqPjUEOu8rkESua5?=
 =?us-ascii?Q?ZGh8iuKVuzOViPzCAwHtUOpxV6XoYpbQkmgM+5T16avsT3tPI6xX+6/n7W0A?=
 =?us-ascii?Q?c9iwduj98XROnpI6bLkkulwavaERn/lAQQm+QFAX7S9VXZY7FsoS0HBgYlvm?=
 =?us-ascii?Q?Y35m/gDgZE34s7quUF9c40zqzif9ShK2uZDkWSuiYYLz7aiZgQkee0xy4mGb?=
 =?us-ascii?Q?Ibo+ctCQJFTk0ZVun274BZYjK/P0A694aSw8OrQ2M/4Bz8MVTI/YB8RiRLvb?=
 =?us-ascii?Q?2EB+DQFCIiZHpu+30MidWweO6pjKnNEU41htThICROmDYIVcwUXM98a3w4lx?=
 =?us-ascii?Q?3G12MPYt0gFvhtqilrhVO9ipvq/Z1GLmV4jWlARmxzZKyo0kl1n2LLnaFQ3h?=
 =?us-ascii?Q?TcZo/uatTpPgOedFL9ncuw0cXTqXykDpPswQgbUIMw02is4RNq+wjd9EBbVk?=
 =?us-ascii?Q?o3kKOaOodYgahl145ukmQInWfuh6t04bcSzAjnsBp+0yv6KcN/xnbxY9yRxn?=
 =?us-ascii?Q?t8fyZzdzbGrM0L3KjeLmNaRUmVZxQUDkfmLdpJJdjFqV9+TKxKQtzz+wS++L?=
 =?us-ascii?Q?yTomnsZcxm72jyx00tpu7JGU6VXNAtEYLdeLwSOe7EGq6qf6UOXeh+q7JlxH?=
 =?us-ascii?Q?3dZGw3rzUtB9fYAHpoWTcPRls6oIZ11NXyCxqPKc3iCPA2+VqSTcTUNFKs3n?=
 =?us-ascii?Q?dthCF3j6jIqdnxmfWuI2lm43zh5yKcfRNoaHvj1n7fvI5db0Ug7xrVQLro41?=
 =?us-ascii?Q?+tQDXwhX3aNB1ESgeuPQL0z7eIjrLKFb/vv5j0i1IRY/RcdiSYszJli8x8Kr?=
 =?us-ascii?Q?9wZSMwZo+kG6lQ4SpojBiAJKOUeCBubk5Wvd9Z1oDLxuf15QqACVvuBjOr2Q?=
 =?us-ascii?Q?yane4VUPXYhme8xEZLieSN20Pj2lPF+v5kU6cGUwK82Cj/xRuajIqC7oZvDG?=
 =?us-ascii?Q?eYvEs0W5Vw12quqxbvMLolTAr4/2qAISEA3YN5ZbbqNUEGdo7bb1BaLeuyD0?=
 =?us-ascii?Q?wd/GUehqD4IBICtvBA2dxaLjQO9v3Mr3SwVqYI9vxS4DMzlxmBGgFXP2Anp0?=
 =?us-ascii?Q?A/VvZ58SpeDHOcVP7nuODmIh1lCR/u9/HoT0tVM07DVO15mUsIOE4ygDINrt?=
 =?us-ascii?Q?UlL4X0pmJKOJ7Wur55d0cXro+4JaAdOxy5bTrSIsWZJLKdTrsyZW0ZMMknMY?=
 =?us-ascii?Q?clzPRpplzOee2mMHUh+DoiJxzoIUvchdqke2/dIka50jLQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wKxj+evoZoHDUvTz42M3nkqQdBjxUqPe9HhJL4xQWL7paqqIoclE6G5cwcAK?=
 =?us-ascii?Q?md2C04SGYmMg0BOlqjbO35/E7y0WNlm7E6VhZLWGUdtWouaU0XusU7sXEFeS?=
 =?us-ascii?Q?CFrrYApBhKnv43RszcuStqN3PXdmiHMZstsbkxrY0TjNqT2XGcAReMXgvr23?=
 =?us-ascii?Q?M8B74YsXPSXG31EAWIFe689sP5iTiorqxtj/080UIncjeF0epsTYelmdofVR?=
 =?us-ascii?Q?fDJBnpqLxeGcEGL6HpeU9OplRsA9L5ok3fzjJEqm+foU3PpbzDxYash9zRUm?=
 =?us-ascii?Q?1G+gDSSBy7QMxJwy98v6t31+pax90Lbm0FLCKm0qyPcrUFF1aDTr0YGfGIZr?=
 =?us-ascii?Q?UUvBzEyYhskIB4b/RTfqpKEJSA7YsiPG/jH5KFKeP6rl7AciR1W+rR7nmtb/?=
 =?us-ascii?Q?zC+gd91H7VeY472KW+lPs0djNE60f9A1cujSJUhEKW/7kyrjwrHSmOz8A99n?=
 =?us-ascii?Q?0wVmv6WQMYmU5KahMuNSbuNdDc3qBvmtxsHiPaD4mItfoJ3dVK/a2/1Qe28s?=
 =?us-ascii?Q?T3j91BfVh/4pktt+LARUIgrrQ2AFQEHWTpJgP/Kb44tIoaYw5G5UzGAEHeEi?=
 =?us-ascii?Q?5C4eZf0PABXgZdiAAp8Mjc+vXBIWoBf5K4qaN0rqCuEFZJZW0Zi5BcNGxALW?=
 =?us-ascii?Q?TI/J/bQ9Di6fEburSm+KzCJTs6UoTv5QMU3QWgcW0W0ustsbRKoVdn6diJ7r?=
 =?us-ascii?Q?NtTobueP75Hq0LtPBE7ZsrOQz8rybmIWVThsQfGXqSA+9grlM/DiL7ajlBQV?=
 =?us-ascii?Q?QoborZTloXtqgXijXoQjt78gXD7O4H6XOwmnBorBBKKmR2Wos8hepAlNudei?=
 =?us-ascii?Q?1MB3vhrvH+aQlNV0A/PrMcJBdhtXytu6Qeg0Etj6IjWZhi4BI9h1UyCp/cut?=
 =?us-ascii?Q?wgbnCd60mlze0TtIXDyL2ALawawwwWG+wvlYZslr8gML0Nns5Vm5ZsmDH0uH?=
 =?us-ascii?Q?viHzTExTJP/fzdSd2gPnKfXkMegIPNwaQuP8V5hlSLAhVyqEO2IzknyH2Iro?=
 =?us-ascii?Q?wJL+QSDgqPuApTJv82Tjd/8SEIQyPhOtUqGnUYikhr5Zdf6V42wJ1+V+3X//?=
 =?us-ascii?Q?5pHXZj3BKSJuLjQpQVqj80PuiPh/k50optBVD3TEH4jSaiGcPYtZlVHkpU95?=
 =?us-ascii?Q?ODo6Q9eHTue+gvDyYsBbR3NdLW3MIjaQyILOTwMrro9WBpIcoJHC0Z2N0snE?=
 =?us-ascii?Q?o6uB4fE/4iCfDGwXLJ2/vbAuSmF5ypHDcYihe0+NVZT8MU0OxuJSmTg93YBS?=
 =?us-ascii?Q?/wlVuaMc06BusB/Z8+y+lcyPtT+dUepHxLcop3qearvlw8tw+ny1YWA2ku57?=
 =?us-ascii?Q?1vhoOQj/2mvCyalMlsahV3z9IdAN+BdpssfEk7aM+G2KOeslQDtxiUKaBGHA?=
 =?us-ascii?Q?Ni3DfcjyKJaqzrv0d736UODGZXU2sGESC4o4ajW7MHxuIJoR0xWZi3+K6dJ6?=
 =?us-ascii?Q?EAkOG1cCljuZoNPNnm7iy58gK9LhigbkuBT0ZFJe1yvgBc/w+5DtXpq51YW5?=
 =?us-ascii?Q?1dDgFcnQcu34+EvWnVBCq9wNZYcYIxlyvQqsfRugU+ntx/xpwafbId+epg+j?=
 =?us-ascii?Q?R6rgINhj3HRpkKDA/aGCXoGymV7gqED2MFP7GL/A?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	v1krs/CWbS/ACP/J041XkNcjpNAMvz1QvWwvNg3KAoq2LJqhyAop75s+OzKtNAWxVr6dQYYejXo7KU3bc2UOiOXxhd1b1Cf2zBoOQbvufoQNGyVD5kPZ5WaejNn0GWYA6IknrXCbLw+bMFT13Rh9jzv9/dUc1VdG4XNxucFo83HbN9ZuLnIBKS2vtbDxAV5Vj32/98L6N9zgYcO/0H1fd7SSArOdT15MxokpLK1tU8khzTQm7d55aeP6HedHNPOawCGSYH/H5gITZePavCVyn5HLsTYZiNdBATbIyEUllreHxQeTmvj/Q9ACxsHgcMYMv+MWLtBhXetnHyLUieJBc/44vFEJVC+UOnFv7+oAY3AX3f2Ta1kZYzFcONXTJ4bHWWzHoQZh4B5B08k4bRQ/B3ww9iI1/6oZxE3QFynItUyCe6N6IndkjrRiog22tmyugWsYSfdPi/CBOAt5GnCmE2Eh1WSpV4fH1Q1zoQikc9lnZXTH/OXYr2SUK4ujEI9gdhlfH/fLQf4Mbj+i01okETW1+SzfQnDG9y6tKwNpWI1pctu6uvO1U0+imsTT7rchZ0Z9ctMiK2njzZ4JoSxW0kC9yENt1HAtppASOINwHjY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c392a41e-2842-47b5-d3f2-08dcc7eb1d2f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:26:20.1488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yiyuvE2IViy+pekSr/zHDcgxrKl1hwD3MWWMojc/9GXqNHfeyLWxM/bfTqkYh2IhirQ7L45DwwnPn5C9CmKhaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4577
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-ORIG-GUID: 4Ig5FEZV2BYMw73NFzHW76SLWGxncNBV
X-Proofpoint-GUID: 4Ig5FEZV2BYMw73NFzHW76SLWGxncNBV

From: Eugene Loh <eugene.loh@oracle.com>

As USDT processes come and go, the overlying probes for an underlying
probe will change.  Hence, we will move to a scheme in which an
underlying probe will walk all possible clauses it could call,
deciding at run time (using a bit mask for the overlying USDT probe)
which of the clauses to call.

In this patch, we create and update the BPF "usdt_prids" map.  This
is a hash map, where:

  *)  the key (size: dtp->dt_usdt_pridsmap_ksz) comprises
        - the PID of the firing process
        - the PRID of the underlying probe

  *)  the value (size: dtp->dt_usdt_pridsmap_vsz) comprises
        - the PRID over the overlying USDT probe
        - a bit mask indicating which clauses should be called

As processes start up, we also add new overlying USDT probes,
requiring updates of the BPF "probes" and "strtab" maps and of
the list of enablings.

The underlying-probes "update" function is called sporadically.
The focus of this patch is the function.  When it is called can
be tuned in future patches.

This patch guesses certain sizes very crudely.  These sizes should
be handled more robustly in future patches:

  *)  The allocated size of the string table.  For example,
      new provider names have to be added as new processes
      start.

  *)  The number of entries in the BPF "usdt_prids" map.
      There is a little relief here in that, as processes
      terminate, they can be removed from the map.

  *)  The size of the bit mask -- that is, the greatest
      number of clauses an underlying probe might call.
      This is relatively easy to extend;  nevertheless,
      that work is left for a future patch.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_bpf.c         |  42 +++++-
 libdtrace/dt_cc.c          |   2 +-
 libdtrace/dt_dlibs.c       |   1 +
 libdtrace/dt_impl.h        |   6 +
 libdtrace/dt_prov_uprobe.c | 266 +++++++++++++++++++++++++++++++++++++
 libdtrace/dt_work.c        |   2 +
 6 files changed, 317 insertions(+), 2 deletions(-)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 3f9c42ea..70803e3c 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -841,7 +841,8 @@ gmap_create_strtab(dtrace_hdl_t *dtp)
 	int		fd, rc, err;
 
 	dtp->dt_strlen = dt_strtab_size(dtp->dt_ccstab);
-	dtp->dt_rooffset = P2ROUNDUP(dtp->dt_strlen, 8);
+	dtp->dt_strmax = dtp->dt_strlen + 1000;            // FIXME pad some arbitrary amount to account for new USDT probes as new processes start
+	dtp->dt_rooffset = P2ROUNDUP(dtp->dt_strmax, 8);
 	dtp->dt_rosize = dt_rodata_size(dtp->dt_rodata);
 	dtp->dt_zerooffset = P2ROUNDUP(dtp->dt_rooffset + dtp->dt_rosize, 8);
 	dtp->dt_zerosize = 0;
@@ -899,6 +900,7 @@ gmap_create_strtab(dtrace_hdl_t *dtp)
 	if (rc == -1)
 		return dt_bpf_error(dtp, "cannot update BPF map 'strtab': %s\n",
 				    strerror(err));
+	dtp->dt_strtabmap_fd = fd;
 
 	return 0;
 }
@@ -936,6 +938,43 @@ gmap_create_probes(dtrace_hdl_t *dtp)
 				dtp, "cannot update BPF map 'probes': %s\n",
 				strerror(errno));
 	}
+	dtp->dt_probesmap_fd = fd;
+
+	return 0;
+}
+
+/*
+ * Create the 'usdt_prids' BPF map.
+ *
+ * USDT-PRID information map.  This is a global hash map for use
+ * with USDT probes.  It is indexed by (pid, underlying probe ID).
+ * The value is a probe ID for the overlying USDT probe and a bit
+ * mask indicating which clauses to execute for this pid.
+ *
+ * WIP.  Just make up some sizes for now.
+ *
+ *     How big is a probe ID?  Sometimes, it's a dtrace_id_t.
+ *     And uts/common/sys/dtrace_types.h gives us "typedef uint32_t dtrace_id_t".
+ *     Meanwhile, libdtrace/dt_impl.h has "uint32_t dt_probe_id".
+ *     So either uint32_t or dtrace_id_t is fine.
+ *
+ *     How big should our bit mask be?  Start with 8*sizeof(long long) bits.
+ *
+ *     How many entries should we allow?  Start with 1000.
+ *
+ * Note that for a given (pid, PRID) key, there can be at most one
+ * overlying USDT probe.
+ */
+static int
+gmap_create_usdt_prids(dtrace_hdl_t *dtp)
+{
+	dtp->dt_usdt_pridsmap_fd = create_gmap(dtp, "usdt_prids", BPF_MAP_TYPE_HASH,
+			 dtp->dt_usdt_pridsmap_ksz, dtp->dt_usdt_pridsmap_vsz, 1000);
+	if (dtp->dt_usdt_pridsmap_fd == -1)
+		return -1;
+
+	/* Populate the newly created map.  FIXME:  this is probably not the right place for this. */
+	dt_uprobe.update(dtp, NULL);
 
 	return 0;
 }
@@ -1045,6 +1084,7 @@ dt_bpf_gmap_create(dtrace_hdl_t *dtp)
 	CREATE_MAP(scratchmem)
 	CREATE_MAP(strtab)
 	CREATE_MAP(probes)
+	CREATE_MAP(usdt_prids)
 	CREATE_MAP(gvars)
 	CREATE_MAP(lvars)
 	CREATE_MAP(dvars)
diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index a9934d10..2510db86 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -1058,7 +1058,7 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 				nrp->dofr_data = 0;	/* FIXME */
 				continue;
 			case DT_CONST_STBSZ:
-				nrp->dofr_data = dtp->dt_strlen;
+				nrp->dofr_data = dtp->dt_strmax;
 				continue;
 			case DT_CONST_STRSZ:
 				nrp->dofr_data =
diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
index bc883e11..060cf28b 100644
--- a/libdtrace/dt_dlibs.c
+++ b/libdtrace/dt_dlibs.c
@@ -66,6 +66,7 @@ static const dt_ident_t		dt_bpf_symbols[] = {
 	DT_BPF_SYMBOL(lvars, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(mem, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(probes, DT_IDENT_PTR),
+	DT_BPF_SYMBOL(usdt_prids, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(scratchmem, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(specs, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(state, DT_IDENT_PTR),
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index c2b18b0b..2378235c 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -287,6 +287,7 @@ struct dtrace_hdl {
 	dt_strtab_t *dt_ccstab;	/* global string table (during compilation) */
 	dt_rodata_t *dt_rodata;	/* global read-only data */
 	uint_t dt_strlen;	/* global string table (runtime) size */
+	uint_t dt_strmax;	/* global string table (runtime) size, allocated */
 	uint_t dt_rooffset;	/* read-only data offset */
 	uint_t dt_rosize;	/* read-only data size */
 	uint_t dt_zerooffset;	/* zero region, offset */
@@ -397,6 +398,11 @@ struct dtrace_hdl {
 	int dt_aggmap_fd;	/* file descriptor for the 'aggs' BPF map */
 	int dt_genmap_fd;	/* file descriptor for the 'agggen' BPF map */
 	int dt_cpumap_fd;	/* file descriptor for the 'cpuinfo' BPF map */
+	int dt_strtabmap_fd;	/* file descriptor for the 'strtab' BPF map */
+	int dt_probesmap_fd;	/* file descriptor for the 'probes' BPF map */
+	int dt_usdt_pridsmap_fd; /* file descriptor for the 'usdt_prids' BPF map */
+	int dt_usdt_pridsmap_ksz; /* 'usdt_prids' BPF map key size */
+	int dt_usdt_pridsmap_vsz; /* 'usdt_prids' BPF map value size */
 	dtrace_handle_err_f *dt_errhdlr; /* error handler, if any */
 	void *dt_errarg;	/* error handler argument */
 	dtrace_handle_drop_f *dt_drophdlr; /* drop handler, if any */
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index cbde6a48..70e5c32d 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -37,8 +37,10 @@
 #include "dt_list.h"
 #include "dt_provider_tp.h"
 #include "dt_probe.h"
+#include "dt_program.h"
 #include "dt_pid.h"
 #include "dt_string.h"
+#include "port.h"
 
 /* Provider name for the underlying probes. */
 static const char	prvname[] = "uprobe";
@@ -63,6 +65,15 @@ typedef struct list_probe {
 	dt_probe_t	*probe;
 } list_probe_t;
 
+typedef struct usdt_prids_map_key {
+	pid_t		pid;
+	dtrace_id_t	uprid;
+} usdt_prids_map_key_t;
+typedef struct usdt_prids_map_val {
+	dtrace_id_t	prid;
+	long long	mask;
+} usdt_prids_map_val_t;
+
 static const dtrace_pattr_t	pattr = {
 { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
 { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
@@ -77,6 +88,9 @@ dt_provimpl_t	dt_usdt;
 
 static int populate(dtrace_hdl_t *dtp)
 {
+	dtp->dt_usdt_pridsmap_ksz = sizeof(usdt_prids_map_key_t);
+	dtp->dt_usdt_pridsmap_vsz = sizeof(usdt_prids_map_val_t);
+
 	if (dt_provider_create(dtp, dt_uprobe.name, &dt_uprobe, &pattr,
 			       NULL) == NULL ||
 	    dt_provider_create(dtp, dt_uprobe_is_enabled.name,
@@ -123,6 +137,257 @@ static void probe_destroy(dtrace_hdl_t *dtp, void *datap)
 	free_probe_list(dtp, datap);
 }
 
+/*
+ * Clean up the BPF "usdt_prids" map.
+ */
+static int
+purge_BPFmap(dtrace_hdl_t *dtp)
+{
+	int			fd = dtp->dt_usdt_pridsmap_fd;
+	usdt_prids_map_key_t	key, nxt;
+	usdt_prids_map_val_t	val;
+
+	/* Initialize key to a pid/uprid that cannot be found. */
+	key.pid = 0;
+	key.uprid = 0;
+
+	/* Loop over all entries. */
+	while (dt_bpf_map_next_key(fd, &key, &nxt) == 0) {
+		memcpy(&key, &nxt, sizeof(usdt_prids_map_key_t));
+
+		if (dt_bpf_map_lookup(fd, &key, &val) == -1)
+			return dt_set_errno(dtp, EDT_BPF);
+
+		/* Check if the process is still running. */
+		if (!Pexists(key.pid)) {
+			dt_bpf_map_delete(fd, &key);          // FIXME:  bpf_map_next_key() iteration restarts each time we delete an elem!!!
+			continue;
+		}
+
+		/*
+		 * FIXME.  There might be another case, where the process
+		 * is still running, but some of its USDT probes are gone?
+		 * So maybe we have to check for the existence of one of
+		 *     dtrace_probedesc_t *pdp = dtp->dt_probes[val.prid]->desc;
+		 *     char *prv = ...pdp->prv minus the numerial part;
+		 *
+		 *     /run/dtrace/probes/$pid/$pdp->prv/$pdp->mod/$pdp->fun/$pdp->prb
+		 *     /run/dtrace/stash/dof-pid/$pid/0/parsed/$prv:$pdp->mod:$pdp->fun:$pdp->prb
+		 *     /run/dtrace/stash/dof-pid/$pid/.../parsed/$prv:$pdp->mod:$pdp->fun:$pdp->prb
+		 */
+	}
+
+	return 0;
+}
+
+/*
+ * Grow the string table map.  It includes the string table (which might
+ * grow due to new USDT probes).  It also includes the read-only data and
+ * the block of zeros, but these remain fixed.
+ *
+ * FIXME Is there a danger of the BPF map update colliding with map reads?
+ */
+static int
+grow_strtab(dtrace_hdl_t *dtp)
+{
+	size_t		sz = dtp->dt_zerooffset + dtp->dt_zerosize;
+	char		*strtab;
+	uint8_t		*buf, *end;
+	size_t		strsize = dtp->dt_options[DTRACEOPT_STRSIZE];
+	uint32_t	key = 0;
+	int		rc, err;
+
+	strtab = dt_zalloc(dtp, sz);
+#if 0
+	// FIXME do something
+	if (strtab == NULL)
+		return dt_set_errno(dtp, EDT_NOMEM);
+#endif
+
+	/* Copy the string table data. */
+	dt_strtab_write(dtp->dt_ccstab, (dt_strtab_write_f *)dt_strtab_copystr, strtab);
+
+	/* Loop over the string table and truncate strings that are too long. */
+	buf = (uint8_t *)strtab;
+	end = buf + dtp->dt_strlen;
+	while (buf < end) {
+		uint_t	len = strlen((char *)buf);
+
+		if (len > strsize)
+			buf[strsize] = '\0';
+
+		buf += len + 1;
+	}
+
+	/* Copy the read-only data. */
+	dt_rodata_write(dtp->dt_rodata, (dt_rodata_copy_f *)dt_rodata_copy, strtab + dtp->dt_rooffset);
+
+	rc = dt_bpf_map_update(dtp->dt_strtabmap_fd, &key, strtab);
+	err = errno;
+	dt_free(dtp, strtab);
+
+	// FIXME do something
+	if (rc == -1) {
+		strerror(err);
+		return -1;
+		// return dt_bpf_error(dtp, "cannot update BPF map 'strtab': %s\n", strerror(err));
+	}
+
+	return 0;
+}
+
+/*
+ * Update the uprobe provider.
+ */
+static void update_uprobe(dtrace_hdl_t *dtp, void *datap)
+{
+	dt_probe_t	*prp;
+	dt_probe_t	*prp_next;
+	int		i, prid = dtp->dt_probe_id;
+	uint_t		old_strlen = dtp->dt_strlen;
+	dt_pcb_t	pcb;
+
+	/* Clear stale pids. */
+	purge_BPFmap(dtp);
+
+	/* Update dt_probes[] and dt_enablings. */
+	/*
+	 * pcb is only used inside of dt_pid_error() to get:
+	 *     pcb->pcb_region
+	 *     pcb->pcb_filetag
+	 *     pcb->pcb_fileptr
+	 * While pcb cannot be NULL, these other things apparently can be.
+	 */
+	memset(&pcb, 0, sizeof(dt_pcb_t));
+	for (i = 0; i < dtp->dt_clause_nextid; i++)
+		dt_pid_create_probes(&dtp->dt_stmts[i]->dtsd_ecbdesc->dted_probe, dtp, &pcb, 1);
+
+	while (prid < dtp->dt_probe_id) {
+		dt_bpf_probe_t pinfo;
+		const dtrace_probedesc_t *pdp = dtp->dt_probes[prid]->desc;
+		int fd = dtp->dt_probesmap_fd;
+
+		dt_probe_enable(dtp, dtp->dt_probes[prid]);
+
+		pinfo.prv = dt_strtab_index(dtp->dt_ccstab, pdp->prv);
+		pinfo.mod = dt_strtab_index(dtp->dt_ccstab, pdp->mod);
+		pinfo.fun = dt_strtab_index(dtp->dt_ccstab, pdp->fun);
+		pinfo.prb = dt_strtab_index(dtp->dt_ccstab, pdp->prb);
+
+		if (dt_bpf_map_update(fd, &pdp->id, &pinfo) == -1)
+			assert(0);   // FIXME do something here
+
+		prid++;
+	}
+
+	/* Grow the strtab if it has gotten bigger. */
+	dtp->dt_strlen = dt_strtab_size(dtp->dt_ccstab);
+
+	if (dtp->dt_strlen > dtp->dt_strmax)
+		assert(0);               // FIXME handle this more gracefully
+	if (dtp->dt_strlen > old_strlen)
+		grow_strtab(dtp);
+
+	/* Review enablings. */
+	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL; prp = prp_next) {
+		pid_t		pid;
+		list_probe_t	*pup;
+
+		prp_next = dt_list_next(prp);
+
+		/* Make sure it is an overlying USDT probe. */
+		if (prp->prov->impl != &dt_usdt)
+			continue;
+
+		/* FIXME passing in NULL pcb and dpr wreaks havoc on error reporting? */
+		/*
+		 * Nick writes:
+		 * This is a general problem with running compiler-adjacent things outside
+		 * compile time. I think we should adjust dt_pid_error() so that it works
+		 * with NULL pcb and dpr at once, probably by using the code path for
+		 * pcb != NULL and augmenting it so that it passes in NULL for the region and
+		 * filename args and 0 for the lineno if pcb is NULL. (dt_set_errmsg can
+		 * already handle this case.)
+		 */
+		pid = dt_pid_get_pid(prp->desc, dtp, NULL, NULL);
+
+		if (!Pexists(pid)) {
+			/* Remove from enablings. */
+			dt_list_delete(&dtp->dt_enablings, prp);
+
+			/* Make it evident from the probe that it is not in enablings. */
+			((dt_list_t *)prp)->dl_prev = NULL;
+			((dt_list_t *)prp)->dl_next = NULL;
+
+			/* Free up its list of underlying probes. */
+			while ((pup = dt_list_next(prp->prv_data)) != NULL) {
+				dt_list_delete(prp->prv_data, pup);
+				dt_free(dtp, pup);
+			}
+			dt_free(dtp, prp->prv_data);
+			prp->prv_data = NULL;
+
+			/* Free up BPF "probes" map entry. */
+			dt_bpf_map_delete(dtp->dt_probesmap_fd, &prp->desc->id);
+
+			continue;
+		}
+
+		for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
+			dt_probe_t		*uprp = pup->probe;
+			long long		mask = 0, bit = 1;
+			usdt_prids_map_key_t	key;
+			usdt_prids_map_val_t	val, oval;
+			dt_uprobe_t		*upp = uprp->prv_data;
+
+			/*
+			 * For is-enabled probes, the bit mask does not matter.
+			 * It is possible that we have this underlying probe due to
+			 * an overlying pid-offset probe and that we will not know
+			 * until later, when some new pid is created, that we also
+			 * have an overlying USDT is-enabled probe, but missing this
+			 * optimization opportunity is okay.
+			 */
+			if (uprp->prov->impl == &dt_uprobe && !(upp->flags & PP_IS_ENABLED)) {
+				int n;
+
+				for (n = 0; n < dtp->dt_clause_nextid; n++) {
+					if (dt_gmatch(prp->desc->prv, dtp->dt_stmts[n]->dtsd_ecbdesc->dted_probe.prv) &&
+					    dt_gmatch(prp->desc->mod, dtp->dt_stmts[n]->dtsd_ecbdesc->dted_probe.mod) &&
+					    dt_gmatch(prp->desc->fun, dtp->dt_stmts[n]->dtsd_ecbdesc->dted_probe.fun) &&
+					    dt_gmatch(prp->desc->prb, dtp->dt_stmts[n]->dtsd_ecbdesc->dted_probe.prb))
+						mask |= bit;
+
+					bit <<= 1;
+				}
+			}
+
+			key.pid = pid;
+			key.uprid = uprp->desc->id;
+
+			val.prid = prp->desc->id;
+			val.mask = mask;
+
+			/* linux/bpf.h says error is -1, but it could be -2 */
+			if (dt_bpf_map_lookup(dtp->dt_usdt_pridsmap_fd, &key, &oval) < 0) {
+				/*
+				 * Set the map entry.
+				 */
+				// FIXME Check return value, but how should errors be handled?
+				dt_bpf_map_update(dtp->dt_usdt_pridsmap_fd, &key, &val);
+			} else if (val.prid != oval.prid || val.mask != oval.mask) {
+				/*
+				 * This can happen when two overlying probes map to the same underlying probe for the same pid.
+				 * E.g., pid:::entry and pid:::0, or pid:::$offset and usdt:::.
+				 */
+			} else {
+				/*
+				 * Nothing to do, it already is in the map.
+				 */
+			}
+		}
+	}
+}
 
 /*
  * Look up or create an underlying (real) probe, corresponding directly to a
@@ -782,6 +1047,7 @@ dt_provimpl_t	dt_uprobe = {
 	.probe_info	= &probe_info,
 	.detach		= &detach,
 	.probe_destroy	= &probe_destroy_underlying,
+	.update		= &update_uprobe,
 };
 
 /*
diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
index 599e2ae3..79da46fa 100644
--- a/libdtrace/dt_work.c
+++ b/libdtrace/dt_work.c
@@ -373,6 +373,8 @@ dtrace_work(dtrace_hdl_t *dtp, FILE *fp, dtrace_consume_probe_f *pfunc,
 	dtrace_workstatus_t	rval;
 	int			gen;
 
+dt_uprobe.update(dtp, NULL);
+
 	switch (dtrace_status(dtp)) {
 	case DTRACE_STATUS_EXITED:
 	case DTRACE_STATUS_STOPPED:
-- 
2.43.5

