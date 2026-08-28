Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534BA22126C
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787944227; cv=fail; b=AU75h3kDxKgCyv1pW6mOyhjSV8E7XeEuXh5ewVMVbbx8h7fjrdD6nozo44/ZlFUiDOCNfKaJx+uzsA0pcp0AHjjSQY4BFrTSxOm2WUnhkLkGZRZO+3eAQwSgVznehuLLV1GOaWa2FTXtoJ+Vca6zoVJ9DTNCwraWNlH0gTGbiQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787944227; c=relaxed/simple;
	bh=Gjk6ECIOdCv0C62TeAaPDA1Z+tEjeOW5XOq8B1GyPkA=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=SPeZX5NJx5CMe9kw6qHTUNDeeh6GSFoNvOtmGBYTZajbn2TZq1DLLgpJdTtEriSS8LU5AWknUl0ojW3HzJk78p+aaLyKB/6LHprHmdQCKWo5h3fJMgSGhiElyixN/iCJo9tkF9Vax9+RAoSjBQ2cFk8ZwL9s5i0TW/tQ+mF9A7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Z9CfMPsg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qczc8OBO; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Z9CfMPsg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qczc8OBO"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SHK2GF3166789
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:10:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=nrigmHwHwbT04mWBvE+x5sJcLUsX86IgdpypXhZYSfo=; b=
	Z9CfMPsgT7J/fXaF9E2A5L+W7Mh8Z5ojdcocxH0flpMrHNe6P2b0FBzDmtXKLYAr
	vOtJPM/qk0BV6sE/jBpsfoFna5hkvc3iUpeuC5mXBaFwOWkkLJpNcCqc0TegNo6H
	Rxp2Mv8zUGgYsuNDf+1o1eOku7U+micSQ8WgvH/g4KckvuJjsVBZdqsRZyJnHEvu
	riUz6pAU7tq3bfeBTw54kpG7s5qxL7wMS0xdwWM/W7YAhdLDCf/2KgAyyvJ7veme
	h0yRq+6Tf2+dlWyFDTPAJrYODdzDJqhDVdXR6V3q4Hh1+66pPn3/tdAd7d/Ohrok
	mRCLlHwE79Kxlz5oQik54w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g73ct2fvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:10:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67SJAFqg013457
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:10:24 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011006.outbound.protection.outlook.com [40.93.194.6])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4g846hf6sf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:10:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+xm4WFUpmm/+QuUjcPbSipI0yebKFL4DsMRyDNxQN2Nhq1d44XruRDpJfPk+Zaa2tZ4Rk0vv5h6YzRT2EJX1/is17tWEZ2rMHVdD0L/UTzd5Fsn7j9uHcr6fnomQhF2w2rPiincJZbISMXkcKT3RkZV5/l5bCQDebexS2vbIvU7HNjZoUNvO9rkURs/UgWV8IYA/8g6BlZXeE3OPrW+1tdzVbMBI9UXe70meq1rF++oSfgWT/3cC8AvB61iGigLmaliTpRcq6AS4Jyj4QyKS5ZdWnD09admq6tc5eIvXzqT/NrVQne2ihOPbsn8ScfYmuc4SbBKDbZs3sumP51MqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nrigmHwHwbT04mWBvE+x5sJcLUsX86IgdpypXhZYSfo=;
 b=PPrljIs6dpmucz7ZbaLoWpgj6DYFO4HNDx9kFF6HwkI9LK1JcrlKUfDUnm0yC5tbrywMfC3m6AkcdyYFEijqB3frUk/6wfcJ3muT9NJAnGMWlPajEAfiUyAk7BTnB19Z4/HxObBzx9Hnxy4K9pnX2TSftzxXHh3fVzpNuwxlIif0A0VNJEqJumdrOf04xyh2ecY3u+vwSVJMgxt0jaPvSTr3qjA4KNzoKcVzBLzw6h+sE/zSHJ55ju037ODNFuCwjsWsdKNjdMxtsm7cdtACJ48MmHRPMIuntH9dt9wxdnlgepREsdatByj2xzbaV36vE9obMhOAetAfXPrqC571bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nrigmHwHwbT04mWBvE+x5sJcLUsX86IgdpypXhZYSfo=;
 b=qczc8OBOsoqv0rDYNUibH729tqwMRmWjvT1nZsnDfaZNyd9A03hvdDCGnW8yfKlrt57cyXerXi6zxOcJpwRGakaZNq+dhnwAzw0EUeZM1u1//0zB6s2dYPNfMszpEsTFau1LS8Tgnn8EO3V312A7XyXvi6Hn4/EdPRMQUFFQhZM=
Received: from DM6PR10MB2476.namprd10.prod.outlook.com (2603:10b6:5:ae::24) by
 IA4PR10MB8397.namprd10.prod.outlook.com (2603:10b6:208:566::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8; Fri, 28 Aug 2026 19:10:10 +0000
Received: from DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537]) by DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537%5]) with mapi id 15.21.0382.007; Fri, 28 Aug 2026
 19:10:07 +0000
Date: Fri, 28 Aug 2026 19:09:12 +0000
Message-ID: <aad44d4b8ca3a2cc9de1a25c9beb3863@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/6] dtprobed: reject oversized DOF consistently
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0093.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::16) To DM6PR10MB2476.namprd10.prod.outlook.com
 (2603:10b6:5:ae::24)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB2476:EE_|IA4PR10MB8397:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b6e57db-737f-4434-1604-08df0537f97d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	MdifZ0LwBw/TSnADhN2oYDv7rqyOr6g+vUIVKBabLeLhMtGF9GZJf6869/9UZqF9jId/ztitNemcvG5d1StpyxEYosUrQ4HgicHyOG3xSH2eXw8+lRXMmg/PGyjT5rzWjKUdfifm2WCpkZhuu+ISQ+toCbL+K1R00YZuN1HLl0NqsC1UR9bNDzvjYKtfhck55TtbnIfIeu7SQInNbuOSjhBm2wuQCEfa6arbZaoD0nOxLT0tsIF2Vwu64ZUOBqVe3rmCdCjiQ56P3IUFdf0ueLjwyTZ7sWiAt0mc/OjqPIlvQyhBm+tUzeU0xIY4TUnB4zh+hHse/ImuCMPk2WwJZr63Hm5vjC0V/7HC/p0fEUElhWIQawvscVLivB5RKRUzRF4YDmUs+3VhNO6apvGqMLM3tFstukrwU7q5bSfC8Obp5Z9BpUuDN3DiRHyZzFke2xhayYvIzIWkgueDmxthzFoPvYhNPHH0Mfrdj1e0qfhCmeQMM8Q06Q0xAuxTJVdp6OnMugW4QwOCN4YveTNCzFcx0CyWDgcUV4dn0OX+dg+80eSTE8ByNzEyFqC+oJlf91tmRFPIUfTczXrLLu30RywXEllJm+ZVzPI5eDICrzAXdofY1MS6Y55yeNRwRK7RTmrWX6vEfFpOFZhtAfYHMzyu+KtwwGsykDMaHx0tXio=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB2476.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZxJtoH8wkArqBdbQY1ocZOGb8LsbtuliU/y5gVUhj5CYjvueeOH2CnD9hR2x?=
 =?us-ascii?Q?6etq+X7uVhRhDFDDZMTfNBXnSlVVMgEKSsSB9q5BEAlX01GvJ/UzIsAA6TA5?=
 =?us-ascii?Q?oOc6/WrO7HTfImfRIvR0O5gR1RN4krlgfzkcFbWi4MqSE2lJTsZLnhsZMNEe?=
 =?us-ascii?Q?/zMt24nOjcQnSWquspciBqKiUZwFq33URukOIjeHCs5UFJFgRN6LBqkkQimo?=
 =?us-ascii?Q?lulwlN65oSV37GfsMbRp1VDV295N3YJYU5bPbo5JcBe8ZRKYEfZCo9CU9R7w?=
 =?us-ascii?Q?BiC4eAfutebE6if+gcQMhBfMzo/yQdkuxJLakXJMn2+cfVwoG1nPSY9oZahF?=
 =?us-ascii?Q?6v6wOWzzwsrrUfgu3+D6Og8XI3XgIXXp+iYGSNy+XvFlxQyo62BKAsk2RFYT?=
 =?us-ascii?Q?MhKVhCg+vuysVALrUbLeWB4X+rnDXLb7T1RudqP7xIJjSy0j+v8HSSVr7CWc?=
 =?us-ascii?Q?lvwq9PBi+Gd8eoZDE2n74t4aKMyf9Rmg9k5SQ9pmdiUYZOCyH5SpIDZS3+hk?=
 =?us-ascii?Q?5hOIJCMKxsXBmje/CY+Y/q64QsWfpHtEypkVE+wqCa7gf2mNp3t6YT/OunIv?=
 =?us-ascii?Q?b7V6h9aEtZx+3dBEhSb+SnYugPMNGe14E/uXEcQefTwGcb+p4sayIYsMxuW0?=
 =?us-ascii?Q?TYtIjfMmhSDBqpAFtttjzUmI2Tvn4p9A4FVWqbsk4rNxBrea1z4KPqHOZLMY?=
 =?us-ascii?Q?djKfXvPeTuNNH3ASgzSwAWjkOYc3HnDIbW+AXHqCG9BHVvwfV2vOGHFvNGlW?=
 =?us-ascii?Q?5AjEn1AaCVrDkLLwcFv8sAo0ylW0y/b6JjrFFdSTKMuzjGdHm9zxMRobr3CZ?=
 =?us-ascii?Q?RJIL90nNMTz9BfCXA8wLL/XfDRR2TZJ6zWB0JsFP8CJPWzLs5qjAUxYWc1Bf?=
 =?us-ascii?Q?cvOCq5Ha7BZ5A92ucjcYUOpggQSu0dDv7BIISB6o5q5ji7SZMpLK++JdPG1n?=
 =?us-ascii?Q?GbpkGokJHYQTVPRJtpDDTkvGkMutT5jYKzu/DMrsFP1XsqkDrbw0w1gGHsIw?=
 =?us-ascii?Q?SlN5Q/wcjMW2j4jUSJa5VzF08+sPz6m39dJ76/trmy7HCLBZJfUpIb9E75t2?=
 =?us-ascii?Q?468vIVgS244OAb4VyC3yhzc5kBhlq8Fdj86VRUiZHgWuPLorIAr9mwSH/wmN?=
 =?us-ascii?Q?fiClKPdr8oXF+ISDIDtjpgWyuDXwXeDalu15gvCm+VFyAKSgMJSYnsbc1y8c?=
 =?us-ascii?Q?sm4V9EHD/KPiAlhZMVAV53QY9rzh5Rb+apXHkqJiJ0PzfJw6wND8VpasUrWx?=
 =?us-ascii?Q?FCcPUz9tKmP5FxoH0+MLKRCJ4O0gu1UtEf9phdgV//LIb6qzxzWV9dKpSLT7?=
 =?us-ascii?Q?k6fj0vXIh63JbBID2eKufS5bV0gOlbEMjeZkwqo+fEpUmh5cseLBUGjHMNOc?=
 =?us-ascii?Q?WigNi7kmHjvGMB/Aro+LK3qf2tlE+LdyJfPPSPg934oNbZeX24Te/eDTB+KD?=
 =?us-ascii?Q?tocj4lyndGllXZHhvgrGdvc7VILXerE+iCOpCfxZO5CrkOv5Z8a6BHf933af?=
 =?us-ascii?Q?x17hfJ1tw2wMWBuI+b5k1bzv9G9TAnbNGrrF10j55rZtCY8gYo8+4k/ZX+9z?=
 =?us-ascii?Q?cQO8GPfpr2rm0PFSx9PluQthelzCVorBoWwUkfPHgg6E3hwUaV2LVfJj4pl+?=
 =?us-ascii?Q?yVPwsCCEaP4fYtdFnHeBi9/mOF0FJ2qa8damsuBff8ci2PuTbjItXm+yxdgW?=
 =?us-ascii?Q?Qi3jn413X1drcUAAM9b6GGOSF9AkWDmgk+SM4xX/WGUZDwpNpFHKlMLnHo19?=
 =?us-ascii?Q?Y6IiJWOeOc6OPCgaiqgi5pTzzoA+mf4=3D?=
X-Exchange-RoutingPolicyChecked:
	POkZrZ8Jb7SfqQkbcBe9d/wpu+yHg7bmEAneapYx1S5fD+DQtIKqoMy6YKVw2NdXBLcCle0jyKzNEYaddXlzagP0snW52OQ7tZ3zx/zU0wWsrC+7xEAVnsvxUfdxboo6hjasFf/h/5Onpgg0UQUGKfhLB6U2kldPk2MdcAKNuhCHUq/d9Fe8hoQV41TXqVi3PfyAw9CJ62uIuZDaaWKsXa3aUKME4rKhy51/4FyDnXXYcULq8997aK/qHejDOvpwptzcyWhpFqf5Uvxds6bXNdbEzFAPLSUkUmlq4G2usvecP25FDKN24KtmV2FqVUYWRA2S1T/hBAxih8sLoyVJhQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QFccY0ZGMUPmYnWnV9rmwBnSEgc8wZ5m9ZdKBmu0RdayHo8KcdhJMLSMiWfvwDFArMGabwmdFN1TAD6TQ3RP7q8pHKjUxmEaHr+2AaiaHmx2eywZVAfi5jGT45T8oyJXAxd6Ci7FxlNotiDwMcMJAoU000XmEXhCdqOMi/J3CcCGQIRsgaCtZJT2SxyeTm0oP14BhC3otKBudzs0Pcm9aMneOa+Ta3GjaMQLrR1yrVtJDoHmWVx4xNQt+aG6Wxb8O8GSnBVu33yrq/g50SBZOAWWPmxTPLryDzNA0i+4ngY8U9Xbvp/bCrwhq0ptMcfCsnB0AtELauotIUT3Gub9ti/L/4yMWzV/7V4o6Oe4Csjl78LeZGIGvbgApRmMd6G663wQA4JOGbygZNONhUhDhZmQHWBWozBlLQ7m3hgZ7V53B6MwWnKzPuLG/gLxBNacTgkd9xT5VLiEcL0nNceRa08aqbUSrw44jDRV/zrzojBkA6lD8FV+KqyBhffFqtjWFcDa4QMBs35GoOqbRb334G5fLmam1Pd9lj8zWLxgQ46ZSSFnRoVkXGoTVNmPGeW7knrXGZHZgzzBomrGlYW/TN66g/bw2/hQFKnzz4WW4gk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6e57db-737f-4434-1604-08df0537f97d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2476.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 19:10:07.7877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D8gKLKqBKsz/Hqch+8QCRlLIALarVNx2QpYbeZTIt+bbV5zzS/kaZKqvD9iZsb5YxJBF8kWqRqWmd7LQu4F7LWF948jC4w9gDDXHWwV0r0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8397
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=832 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608280167
X-Authority-Analysis: v=2.4 cv=D+h37PRj c=1 sm=1 tr=0 ts=6a91dd21 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=3I1J8UUJPc9JN9BFgKH3:22 a=yPCof4ZbAAAA:8 a=pu6FpPkusqEyjUOZSJcA:9
 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE2NyBTYWx0ZWRfX9NIimSl5EDu/
 9sPCjLhOe+d4yARGI9wpHh6dPqZ7l+PPWf6nFIAkayID0XYv6H9TwT2myzQCuVt44NBgGj3tFZT
 zN7QFjbKsX3WCSjHRiwhFg8mnTa5SFIv2YMVQaqMj0f2U/nkrsQu
X-Proofpoint-ORIG-GUID: mHh3QR9zX-oY8zc7wCqWhAkbhmlfCRe7
X-Proofpoint-GUID: mHh3QR9zX-oY8zc7wCqWhAkbhmlfCRe7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE2NyBTYWx0ZWRfX73rO96aNyCxl
 prHBNwBbMIZ4TImuB0C38+GvXSjPtoq5Ny9opPhcIvwk5Ja163477dkSrIT21iOVpsJ+EE/NN7a
 kDgykCVXtylJj7HeINVa86GNlHZ4XSG3qaIhVhLUhZAlBxidOll3bwb3oK8k7za/8dMhPfNYdbE
 ZLoccodFrdtsWSsvufEGI/uDZrabKRdoUTJmOj6t1zmghSqAt73tCyoM4iRsT3801IaBF+KNwF9
 88kV5qmmwVKiII+jJiXjtr1/JGvs55L42tgrTw7Io5SXcVMKrTMeSpypgBbuZJkppVqxIGtPmp6
 A25t7xMQsIfrsBkLo35kSKlHpTD1G4ZVQdMmI15rGraj/6qlsNzqScILiB7exuEOsDysg7jnlz+
 EqTm+AQ/3PdRr+gEbhj28WIdz2D+2Hjhtanhpfdei1D8Ze0GtIh1HtCA9B+Pbnd0T8FTRilG+JH
 bUW82a1VO93VPdXcBBw==

The dtprobed ioctl handler warned when helper DOF exceeded the parser
limit, but still attempted to allocate and copy it.  Share DOF_MAXSZ with
the parser and fail the ioctl when dofh_loadsz is too large, so both paths
enforce the same 256MB limit.

Orabug: 39351859
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtprobed/dtprobed.c     | 8 ++++----
 libcommon/usdt_parser.c | 7 +++----
 libcommon/usdt_parser.h | 2 ++
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index 37d615bb..81b28e6d 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -69,7 +69,6 @@
 
 #include "seccomp-assistance.h"
 
-#define DOF_MAXSZ 512 * 1024 * 1024
 #define DOF_CHUNKSZ 64 * 1024
 
 static struct fuse_session *cuse_session;
@@ -769,11 +768,12 @@ helper_ioctl(fuse_req_t req, int cmd, void *arg,
 		}
 		memcpy(&userdata->dof_hdr, in_buf, sizeof(dof_hdr_t));
 
-		if (userdata->dof_hdr.dofh_loadsz > DOF_MAXSZ)
-			fuse_log(FUSE_LOG_WARNING, "%i: dtprobed: DOF size of %zi longer than is sane\n",
+		if (userdata->dof_hdr.dofh_loadsz > DOF_MAXSZ) {
+			fuse_log(FUSE_LOG_ERR, "%i: dtprobed: DOF size of %zi longer than is sane\n",
 				 pid, userdata->dof_hdr.dofh_loadsz);
 
-		/* Fall through. */
+			goto fuse_err;
+		}
 	}
 
 	/*
diff --git a/libcommon/usdt_parser.c b/libcommon/usdt_parser.c
index 86419809..1dc2fffb 100644
--- a/libcommon/usdt_parser.c
+++ b/libcommon/usdt_parser.c
@@ -19,7 +19,6 @@
 #include "usdt_parser.h"
 
 size_t			usdt_maxcount = 2;
-size_t			usdt_maxsize = 256 * 1024 * 1024;
 
 _dt_printflike_(3, 4)
 void
@@ -131,9 +130,9 @@ usdt_copyin_block(int in, int out, int *ok)
 		abort();
 
 	/* Validate the data size. */
-	if (data->size >= usdt_maxsize) {
-		usdt_error(out, E2BIG, "data size %zi exceeds maximum %zi",
-			   data->size, usdt_maxsize);
+	if (data->size > DOF_MAXSZ) {
+		usdt_error(out, E2BIG, "data size %zi exceeds maximum %i",
+			   data->size, DOF_MAXSZ);
 		return NULL;
 	}
 
diff --git a/libcommon/usdt_parser.h b/libcommon/usdt_parser.h
index d33370e4..b11207d1 100644
--- a/libcommon/usdt_parser.h
+++ b/libcommon/usdt_parser.h
@@ -15,6 +15,8 @@
 #include <dtrace/dof.h>
 #include <dtrace/helpers.h>
 
+#define DOF_MAXSZ	(256 * 1024 * 1024)
+
 /*
  * Data transfer unit for the DOF parser.
  */
-- 
2.52.0

