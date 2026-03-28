Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463D31FF7C7
	for <dtrace@lists.linux.dev>; Sat, 28 Mar 2026 16:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774716129; cv=fail; b=tDEPq8JRxF/FyJ451MWc/h3tilBzg+JWk5VZwhX7ZPfOabW8j9d6V0VHqlEjYSDOsaHhpqxnoom3+3gcVPEOlvIcQmlsBmALgh0c3fc8h2ozN1WbYc1w+slyM54rf1k7YA5xtX7RnVZHAE95FYHFzfBvbXLMlL4gFnBoVER59fo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774716129; c=relaxed/simple;
	bh=pQlKcsMU4HvjIYqYajxsbc5mIkz6NfTFD/clvv7Guv4=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=GoUMjFtWh1WW7sb+7dm8I9JLBhUQRRMXuRqSwxGLcuIOValI885jvaomSRxZFDjtxOC01BlhhfmgBMPIgbRbrJJe4Lmjc2COwCrkqH4Ema75yJ/V3KE31ERwIXA5b1ItQoljkvozRjxdM90lnZ/u2TmOXmTBpL1D4WAQNEHqXUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DmMFhqM5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=0Eknpnh8; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DmMFhqM5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="0Eknpnh8"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62SEkgUS556719
	for <dtrace@lists.linux.dev>; Sat, 28 Mar 2026 16:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=8UBBVb0kNvpKVWFcHrmFxDAzjTU+wwFM7BfXju3ByBk=; b=
	DmMFhqM5NBqa88SpcnecdKWUS9FCCD+ROp37bwy3WiSTLs4T5/9VAxGAH2jiK501
	L/xAu0qhslFega8gK/6yvP6rwi7a3qk0n7gQUoLFG7g2QOaL9yMBBakqFh13rG2b
	bIKxLQuvg2myHhoPFIDohWCUh97RVtZOB+dp0dWBLmvtVtNlS+7ReB8dwweFmBLF
	XrDtvUNXCMQMYcqFxM7eLu+qYMGQ6agTOdL3U8vQPLMMEkK/nwdBN9nJzoa5wszf
	iCoVEbSCznS86oXoWhfBLxE6cqeyeZidH2YlTuevoLdRMtFK9dtJyFodpnxBkZK8
	nHj/j6FUGvxXTPFCexOXFA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4d671arag7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 28 Mar 2026 16:42:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62SBSgqp036366
	for <dtrace@lists.linux.dev>; Sat, 28 Mar 2026 16:42:06 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011070.outbound.protection.outlook.com [40.93.194.70])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4d65edeswp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 28 Mar 2026 16:42:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rB0HX+rFUXGIEbNV3m1omeuJBr5nEY/Gq5ayGJyMlbIv4XtkxUcpxAUxcWVlF8GknDauoBmD+A+U4cKSiBrGKfGZ97jQ8ubfRQXKsKIG3K/trXQ2HTGMfGnZBL32A006UAu7cEjdAp/Hh7W/I1TMaA6a43hwi7FLezuz7QSJPACHdAAZEHe2pPl8X/1D1+FjLE8pz2c2pnmlAuyiR2AuWqXrs7fVnL1G0heRTMVSooD32pRJq3syz137maINIL/xk+E4vz9+ZHEpqczAZglA4M5Cj1j69xPBIQW7MBFCxE16xs2oZKTpmZvkZdopQsUcOEnqYYVXyi+tn2SOdSLUJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UBBVb0kNvpKVWFcHrmFxDAzjTU+wwFM7BfXju3ByBk=;
 b=B3suXigDQFLLs8NrcyQd8D55cxo5ta0zBC4JhH80IMIKQWpK6yvyFHGGT1vKtHuh3DS3Fe+sH3AoxrRscJOeTUet5u1gIwPe+YncyFq/pw9pEscqRegizrz5WrK/3MxTvBRA3zTV5QdalTvBgQZDSWj07MLheQrtT8qB+AF6A/GMWJKWaryLVaYwcYR6IpVB1KRKH3sEWrrm4wjuAtaHSiPoexXxuTlUMg98pE8mQFZL2B6sWgyTnPyZi+gLB4/4tCpZ/lmmN6gkD/mOAndtftJMYF77ZCUpmzaC6bWYRzZT6i0KrQc0KWGcm3RadIlokfHktWgsGhaIMSvZqgXjcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8UBBVb0kNvpKVWFcHrmFxDAzjTU+wwFM7BfXju3ByBk=;
 b=0Eknpnh87x+RGxq3XbP/QvqbcsVz8rCHyz8s6thpsuVegphcDc6hae7OTggzQ8cJyvH3SSQAmf06Jik7F2gVVgy8xEKhbXEZtGxrobllqHuQf6atR/qgJN25fi0JmaX0okUJYH3i1WGoEcTcy7j3Vfw83TeeDTdQYVO8q7UqpAQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB7062.namprd10.prod.outlook.com (2603:10b6:510:283::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Sat, 28 Mar
 2026 16:42:02 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%4]) with mapi id 15.20.9745.020; Sat, 28 Mar 2026
 16:42:01 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Fix progenyof to compare TGIDs
Date: Sat, 28 Mar 2026 12:41:59 -0400
Message-Id: <20260328164159.15149-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0140.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::17) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB7062:EE_
X-MS-Office365-Filtering-Correlation-Id: c74b2da1-c830-4573-b0f0-08de8ce8ef85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6O/QcGrS7qGYH+WbAoNgE9Ci9j4/MqNf+U+y6ZGGNbQapnXGVF3WWNzAEpsztq2F9fT5Att3OuWeUQgHh0G9w5oXXuGTn9JD2FTryQZluwGxAh079mqTmKhVrCjOmuRixmLMkL64sA91WJh9IkWPt3WgFSKB6gQdI8RiWXS9AlWa2cWmy1+ctp0iX0sY0+uQgsJkNLidJ81BiuoA0m62VeSi6NxxnnxfuyApl4pz/e/OEtAYakoBuM1NI2d2Hbh/5S3AM/qp7BpDYF0N1jc1rAlwPgpyaYdQJ3HtGg2pxJD7nrXcx50DM7JVUxKUuKf50tEIeUak8EUiPhqdOMRRHaFinivGt3AolhXZBpWVifrD6pxE2H7v0ohFNKFVhCBWDLDREq89lc2COvZC2iiskFtRsWK9g45xClA+EOt5OlpmwIN1mSuygtxbTwvh6DtP++0PLHj/KVhjKV+RUQx46lyvanbyRJhaeiDqHtequNGv3tgSYnKmfKLSF6oKC0kEzPyNdlehBsy+n4JpSSG4Xv1XAn7ctG+3dhKhtSez9RbSOxZuwJKuBH2qWA+4JXfnC2ypdK4JBEVShqnhtV9+QPwKNM8dEjHPAMoGBe4Pl+k7vCJ5LAzRfcf+GhuqsIJ2yHIc/Rv56qAUNuRc8z4idy6CmPxS2VdXJ2Tihq4dZ9DkQdShiCXujkpBPfFXS/2lM+iK4rVftLurWD9Y5o8roktQqDWW5sf0GtEpY11zd1TVuXb2hYCoTVKx2+SOk/hC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f02MwJ+FpIFsUQN9Oh+h1kfneE/9yY3cX5apgQO+dhcvBiKY8Aey82xMtgK+?=
 =?us-ascii?Q?x5p+Y5WUS/f1QysQ+3b0btILJd3wCJLOU5s5jSAiDcEDnaf01fjgznJcqGBi?=
 =?us-ascii?Q?x8L+89XxM2MIZ2TJcTlqVAXivcvFmROrK/2b6pxMYSZP75ELCO8bCGQAtMQa?=
 =?us-ascii?Q?u2062f2J2fQZ15bF+XoLuGciYB/63uvVb8MYv82xmj4YRfV9Ew70ixtCYfS5?=
 =?us-ascii?Q?kxB71Swp/XiQi1wsrBffdy3wKNpXDj8ojydlvY2wIROD++noh+k4NHM2MyhM?=
 =?us-ascii?Q?EafFKDfji859xh5RO8cLtnGa7H0CcfjswuVcGhzZ9l5gmYNrtuyJVaMC/4Ze?=
 =?us-ascii?Q?hUs01Pw4chxlr3rzBBx5aNnKQ9XyzC0G31pE9+NKestjLaBHcnOr0OuxaFZp?=
 =?us-ascii?Q?l84dTOnuAY35zQI1WFDdTU4yxcUaOqVA8urb6KrbUZWFIv74JHD+1S9cBy++?=
 =?us-ascii?Q?pxljxRxYDFjliwYywuaG68ZKx+p6qA2RONVO7Sfsst4ptJy6wlIMij1VraA7?=
 =?us-ascii?Q?sHQ/RVdDqcMCLx3RbCrT80wbQWX8tNuS1LyikQjUwshy2pm9K56n19TmXWe+?=
 =?us-ascii?Q?cCZUp5CMGeD7SExbLPX25CS8wuWQZ05Bpkp4OUB2hHD8O5tJdKOHPNcJhqQX?=
 =?us-ascii?Q?X/8CW2vCWP4NzyNSgzc33uHn8TPvO4mrpDcoW88DsA4/TDnndrDVwwNVnyrH?=
 =?us-ascii?Q?i6hYO/B5g62bD/ythtRPkw8kx6R7ILb40cscFVdWdScAKWAHK9T7VFQ9qo1k?=
 =?us-ascii?Q?tkloIx0WC2iOFctdRPbhPlkZgOn0+6ieRLZ3kXv7I5jGrEVHIRCoLeud7b66?=
 =?us-ascii?Q?ndYnRYr/g7wzVwqD2nYk3M+4Ff3VmuSt1ScKtOa2tCngKwWKsD12PiEPaI9K?=
 =?us-ascii?Q?qwatwkXNyyvMl64og9XAOllg3AiFnspyW0ASWiPjzw8xe0pvIoNSchLnOj19?=
 =?us-ascii?Q?+M69WQjjcMCpIiPgqD5ppRlTMvzUagkk5D9XIaa8MxQa4hmTTCzoyd/QXA2P?=
 =?us-ascii?Q?XV1Fcs1Yktc0ZR/CqBtowSEjdx3njwXptJG5077LGL18EmmlqfXRMwez80rC?=
 =?us-ascii?Q?b8fWfYskQTw2d5Nwi+9QOe71aBb2gVhnZfmdmZpfynUsWa7KamQ4+Hmzrafh?=
 =?us-ascii?Q?wiwZINS3orgBq8Wuf5KhdujyHY5pYVTOB5Zpl+F2FJ/r7+AdYswILwps70DE?=
 =?us-ascii?Q?YyFUJpCYKd4HGCzDBFtyBeqTOGX7ZOxYQuTzGejvo6f3+fWqQLHvND6T/ysB?=
 =?us-ascii?Q?h6UXGj1EILn+Dv9GaVW+gaXJ5/5InJMW4oSnaS/iDnMwbAV7i0pi6OEy8SNK?=
 =?us-ascii?Q?4TK90ipXNwjPlayEBD9qCjV8eM98MUpG6mPBlyj/74OwVmrHR8uxDygX7Sur?=
 =?us-ascii?Q?W5UkGmYUKWZp/Y0+8E6K2VikqBau9HG99YOSYw4fGU+oiW9Z//03jXP+8Gyk?=
 =?us-ascii?Q?idBwGlgcJgb7aBCPliK2Pjprf4suNzZRVuUcDq8pYpudv7RR4iy8yhLXCMIs?=
 =?us-ascii?Q?ZJa9vsj4+3uP1CN1tLDwpuSOJfbA7KpMctHuHvCV950n+h1G+1d6bAk8LH96?=
 =?us-ascii?Q?UflqFXsUFGjMlihiRsb74yzETqTzgR81VMh52LwBfuffJGykliZ/LZjLyScH?=
 =?us-ascii?Q?kx0v0qc1xqVI9vntgzYfUaTVt1/fMHZSb4MAiKyuC7l7bQQ4E43w62B0wmEb?=
 =?us-ascii?Q?z3y2885J+sm78venAuRcJ5DmdPmncohgu+1stdq5/AbNJvbFbbB+Kh3jG83L?=
 =?us-ascii?Q?r3zzPghQ/w=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	cIU0eEeBNDFwd3myCGRjTcCr4AS0n4zFJuekqQnvoC7QggRlsq71wvnFNH1RzZxMyVoJLhOheGO6L6j1yG3w/Hf9ANGFr41f9mz8ojeB3uNzdfK876Pb29P3ujG6tclwOVHKRAXcIdjEgdU1x/f4gKA1KzOKsJUMpem79WrlBWrULEuUMKhxtCnl8xii87Cb+Ux4kUylv203zL6D9OBYFcbj2M5zjYmfUQeaXq6DxtySNzBpvWoc8L35NxihS3w1+41hsKRbOmID3dQMnOf9IavcU0GOzjNdb6YjAq3J9sQhOpk/5g0xE9lvLQx34IqMZIE3wv/hx9MjUVVLn7mVRA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PxQlZ7XIktxELANKgau6mj90ms3NM64y5Ya0s+wtNVLVMupl+at+nZUNO+fSZuFOoYJhiy7a6J6Cds0VTDiYi0G3teSGFsOlL9zgtz+2Lgl4epSDEVbCaTYDZwkgpohu20F0Uv+5rxUSqnRIy5IlOFWLMUdIB2rSfSkL/IdtKLCqyhY6ToIrK9QZCs/3E3r9+LsTMm8ExoLnzO78jFmZNKPVz/KgD1D3fRGhBbUV9XLh6rrMVubOYBM6odN36Z9FAqniCDqxBuFXXU3LMdW/uJ8Yo3DjgXYqw9kWbt0+wBPVzpd91EiE7bnSdBeGmC3CzfeiDPIzLx/mkrjdfDUFzEI6h7KGVUOkKhZylykGAtUqmsXUgZXnicHWOXR2rYUrgUYkme6uB1mHt73JwXaKwgWm8J/KEFzpoa/gBH1Y2pkJVhkU724xSGHSrcz6kRnt01rvfkhWSZ6ffc6RNqHYvVNUeXPmyCqZnYKHVx+giAUBCUo/jhlcKhp66h27sgfrocp+hCTwRSdOKffEKWOW35IZ0yac12bS0zTxDR4Y0/AOL/tfbGB4g5YHEG0Donu9acVpGYtUX3yLb1RyGbTYcSYiVG6cIrE6a4vOe9xNE5A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c74b2da1-c830-4573-b0f0-08de8ce8ef85
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2026 16:42:01.5890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0WL9/HeAkDwEXXXa07IXR2d/tKdyhI9J4jqzgCcCzPHEf/+fupY3cCvqeXuR6HigB1VQc5oiwkqhpx29t9Zyzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7062
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-28_02,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2603280122
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI4MDEyMiBTYWx0ZWRfX1rJDmH1ct8r1
 WZOf71Dbf3j/0f/4MkAOQAaId67hem2qN5KNHo81LB1Z8xtfsuAzKg7iQYi1GoisZTymnYD6qQe
 8JyUbEp4M6bdw2ABugtKnYJOej4JIU99IGzBZ8eCsGCjB3kf/0wPcN2+ILdfdg6djnKcLiG5gR/
 pGqfoIqn7ljpOicJPIXZAFlrOK17HOHTxWdFJXzrbgMlxfZsgYdrlqLP12fKqaWhyVmfNAsuovE
 XVS2e8VjrbcBrF90Ty/X6Yodh/8CMYeqnkjkDeeh2w/0OhcovhbFKMU+LTAuQdrrTNVqodVgSh8
 MmznIOV0ic6Y57JTx5lMzx6P8aCPOB6ZqRZAurwW/7XxNgfYUXVgjt0ulb9da7l6/P26ZlWM+3r
 uhp3/d+5IItPdXtH3fZy80qQlA3W88aTk0skE4JGlRYpf6FzkIDWpnPmjaIxYbHXq+k0GWATKLa
 xUu98EndaI47x3v+VquS4xHAGU01/OGey46VmSxM=
X-Authority-Analysis: v=2.4 cv=PJkCOPqC c=1 sm=1 tr=0 ts=69c804df b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=BqU2WV_vvsyTyxaotp0D:22 a=yPCof4ZbAAAA:8 a=OKgKSn94EOckuBnqC3QA:9 cc=ntf
 awl=host:12276
X-Proofpoint-GUID: _GVLbMOfTfMyouzsDbk-rm1Vr9f7viAz
X-Proofpoint-ORIG-GUID: _GVLbMOfTfMyouzsDbk-rm1Vr9f7viAz

From: Eugene Loh <eugene.loh@oracle.com>

Switch the BPF progenyof helper to read TASK_TGID so it matches the
process IDs returned by ppid and expand the progenyof test to cover both
pid and ppid.  The original tst.progenyof.d only exercised probes in the
main DTrace thread where tid == tgid, so it never exposed the mismatch.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 bpf/progenyof.S                       |  6 +++---
 test/unittest/funcs/tst.progenyof2.sh | 31 +++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 3 deletions(-)
 create mode 100755 test/unittest/funcs/tst.progenyof2.sh

diff --git a/bpf/progenyof.S b/bpf/progenyof.S
index 5b4ce60fa..8ee76e63c 100644
--- a/bpf/progenyof.S
+++ b/bpf/progenyof.S
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2022, 2024, Oracle and/or its affiliates.
+ * Copyright (c) 2022, 2026, Oracle and/or its affiliates.
  */
 
 #include <bpf_asm_helpers.h>
@@ -34,11 +34,11 @@ dt_progenyof:
 	/* if (count <= 0) goto Lret0 */
 	jsle	CNT, 0, .Lret0
 
-	/* val = *((uint32_t *)(ptr + TASK_PID)), using [%fp+-8] as temp */
+	/* val = *((uint32_t *)(ptr + TASK_TGID)), using [%fp+-8] as temp */
 	mov	%r1, %fp
 	add	%r1, -8
 	mov	%r2, 4
-	lddw	%r3, TASK_PID
+	lddw	%r3, TASK_TGID
 	add	%r3, PTR
 	call	BPF_FUNC_probe_read
 	jne	%r0, 0, .Lret0
diff --git a/test/unittest/funcs/tst.progenyof2.sh b/test/unittest/funcs/tst.progenyof2.sh
new file mode 100755
index 000000000..1f284cdd8
--- /dev/null
+++ b/test/unittest/funcs/tst.progenyof2.sh
@@ -0,0 +1,31 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+dtrace=$1
+
+DIRNAME="$tmpdir/progenyof2.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# make the trigger
+
+cat << EOF > a.c
+int main(void) {
+	return 0;
+}
+EOF
+$CC $test_cppflags $test_ldflags a.c
+if [ $? -ne 0 ]; then
+	echo ERROR: compiling trigger
+	exit 1
+fi
+
+# check that progenyof(ppid) and progenyof(pid) are nonzero
+
+$dtrace -c ./a.out -qn 'pid$target:a.out:main:* { exit((progenyof(ppid) && progenyof(pid)) ? 0 : 1) }'
+
+exit $?
-- 
2.47.3

