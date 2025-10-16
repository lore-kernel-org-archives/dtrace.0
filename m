Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DB545C0B
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 01:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760578325; cv=fail; b=TNbiyWMswTI+YTKSOthZeTNKwMzqQ1dUr+PFzMnYxt2uvKQFbJu5Kzx9O+faQeVYelZakV4yRQCIwnm/IXD4IYNFNqx2FdomoFR/cu/PT8KqVhsGLfDhUIkUBe9rHj+/Qx5MF/1eDB5P6zisz1rB6/HhdnebjehDgGxCSzYqd8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760578325; c=relaxed/simple;
	bh=Bab5UN7o8eThQxJdxKoZUpGstMHUpEVtHQZjt0q4X2Y=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=OZledaYIbtJIkCH48v/Ad8ZFSih67L9VUfeqVT4Yw0NIdJi9OT+VTROmYNfO0ABp2O+IKKtZp+2xQxRaP4eEc0fCYp83wvZm90QBifYSi8VRxrp4ihc+r8Qa1qQgh0jt3o5IyjDZSCoKPvhaaBRLZ5apdlcSXS4RrfK0MPtEjcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ru+xLKbH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sARFyD+W; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ru+xLKbH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sARFyD+W"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FJxOOi027573
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 01:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=48Womxx4/y9teao7RmOYh2R6IJLeEZkm2sXsCXxBfto=; b=
	Ru+xLKbHQOrRYd6E/JKrs8FFZwBm+t5w8/gBv4dNTscycDGlDgqumJcop0lYVrVI
	rYDG8AAjtdc7ajKEk/BDH7RSynNyPxuEigoiXwducWbK2U1IOwDhkTOXRKaA+DwV
	U6SzJLZ0ciG/Hp4E3mkRmy6DLtUPInL+6qSUQQGLX3XQ+Anz0JxdEEJef3kengrY
	qFiWQ8uoD2XyYAiQigX1GI53vrxM/4OhLd5C7dc4Xw+sLNg3OSg3hvrG0L3l0ujM
	hRNBCEX1UFDGxfxhs+dTeabX3qbUHS2QRiwsCcOPwkTd3vU13zGRoZJXshPhjCkg
	/q6ndGIbT/AzCkiQpfOhfw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qeusyuhh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 01:32:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59FNUYxA037910
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 01:32:00 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011024.outbound.protection.outlook.com [52.101.62.24])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49qdph325u-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 01:31:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RpXcgXZRQ42uda3E1Z8J4uKHx02sR7hrN+9C2ZdB5VfdScT+MpAssBDVRovMnKJvSNKQlk8GQokEFn4D9GT6yLleJKfYy/PaYeHlEYjQCHzHJCopYD6HGXQIqd7u7r37ma2mFRkEaos92VHPTSpfTUv3CSyMHJq9dFQsbMjvlamUuuh6NKw1IRosUvqsEFYjIvuZosqB/wOmCkvMu1f/Lq+PIn54LRtbC+jmckGFIY7EXRWutdQyMUj+cxwdtfN6hb51RhxB6010YW9DM62PviHkVTsr1ulgmurlHB7OwI2yNxIgvBWyDCSoxS5ZLktq2/AEAb5+T88dX6zKmDPk8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48Womxx4/y9teao7RmOYh2R6IJLeEZkm2sXsCXxBfto=;
 b=X+9+3UNmF5BPaHDCryPm6xdQ3/86004b8vCWHXtfWEF5hT88EztFInH/fomUx5abzhJXGVZSFMDQHlZMqXP7inOfqyyp9TLHZ7CUpTjRtv3SzgrmLNmHN38WQIwfy38ymwbD6AxOMOsE0PW4ZvadV+QdZFPbkR35ajz9chdhrzHXT+7EyBy8ZFCRmV2oVbDt2Vbf6MnrEVVC/IcUy80aRttagb8koYUqcnpy1UtUzag4Ud65SLDeDSJecadYiC8omZRyQM4srVexEvCccoNmTweu16mAeLieACsBfbjGIpULV1P6d0uO0vsw9br7XxP7WqJf+1qLgXL8WoIxz8yScg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48Womxx4/y9teao7RmOYh2R6IJLeEZkm2sXsCXxBfto=;
 b=sARFyD+WgQjZ1Xu3pq+Hpg7J0aMmu46TXU9XlydDZgg0oZ7BEZxlkJOcQ6OD9QNOIktvIYBGafVKGc2rIQC9uEGInW5jfzTy+53Lm9PfyLX8KaGi2zfdmV6Ht2LKOV1f42vmvYKiEXKucCjR76gBItg/DyxiCqLp712EhuttwIk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SN4PR10MB5653.namprd10.prod.outlook.com (2603:10b6:806:20c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 01:31:55 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 01:31:55 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] examples: add a new set of scripts
Date: Wed, 15 Oct 2025 21:31:53 -0400
Message-Id: <20251016013153.2872-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0008.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SN4PR10MB5653:EE_
X-MS-Office365-Filtering-Correlation-Id: f1dbeeed-24f5-42d4-5224-08de0c53ca7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zS+Ma+eAEkp48AykQhigK+UynliVicDqVqYrnipZWfGbzaIWqstF4IvZYYWf?=
 =?us-ascii?Q?/F5k5nz6ddEXo8rFtz6P7/IKHyT8tp55wLaicZcXwuFIAm/xAekUXp01kzZ4?=
 =?us-ascii?Q?68iBhjahLgYE0Yf3GD2GiXjF9LvQaZQl3/DsdalewcC8nqfyakhIUH5JPH/5?=
 =?us-ascii?Q?BVEfbI5i2no3kR9MAEbfJa3L5TytzE0ZPyt425oz04qNIWiz8zWU105Rnd0C?=
 =?us-ascii?Q?VA1aKgIs6Mlo2C36LBoAPgQ24Tmttnti0waTxI06WLfwFiYdC+DjGpd6kSiL?=
 =?us-ascii?Q?HAn2OLgpJxQLoSS2BFlZR0Bujw8AH0QyDjXsu1luhngZO1cZu4h2ib7m4SbE?=
 =?us-ascii?Q?fVeHIUA8fCCqd+oFmJtwp6WcXtRCbyu4U2i2UE4E0O8QEGeqRKDMprZkE3mg?=
 =?us-ascii?Q?3qkCgMXlCW5uGrO4ErYXTZ/IxYWEKmrJhpv2Qo7cUA/CY4Wx/DtCSSUVl+FQ?=
 =?us-ascii?Q?JMCXr4og2PSUrOGSXbs3DcuvvZay29jTkggH2jwTVLCA1A6pSQAToyxf4FsA?=
 =?us-ascii?Q?0DmTWU35qmD5xxZg0Gfo7VYMm4Zo0v/3FnpErWZoWOKz3VXluH9I0QaHxE1W?=
 =?us-ascii?Q?jPJxfdVVWkOBImsbD2beLxLaNKJOJp6GulF8SH+i/HRzHZ7eiq9hdGzKhhpB?=
 =?us-ascii?Q?42RIXtZYrsa6CahqqQ+K0hJpHejt2t8MWzToP/5kGeBMBkKuj12sslKLNu60?=
 =?us-ascii?Q?I3t/Linfws/aPQYzhkdI1R3+bAJOYHrl4z6SPyxD7RjH0JYXI6BElut7Gdtk?=
 =?us-ascii?Q?og2WOylsi+Kri6mhSXJ8MsDfbuNW1fHvs1P0FpDEmO53IFyqGRlpVC9Maa+8?=
 =?us-ascii?Q?3aVdaMGBIwUydmRxd0XtNqtdw0CPDgA3nk/HfQjUHLcuHMNzCQlwGW+b2Z+r?=
 =?us-ascii?Q?wAofCe4CCmvD6GNDWUWAjl1HRCASLszV4OawREx/w+hVPmngSlCx/ZRVjkI4?=
 =?us-ascii?Q?Uwc10WEgieidWpJsf0WMo38S07A+Phnd4hqGqwHu8yPNTqLdMZB824c1ICgD?=
 =?us-ascii?Q?gN7NIkNbBw+uwCLzWEZe46x4OHPY59qKjpEH2/jA7fyLb5rFOUo1Bvd3BgQv?=
 =?us-ascii?Q?AvRQ1mzLqDjT9wB7NUPZO+jtrL4w1kJG3fDpMvzk5s0rExQ4Hp4sKhV/OpLJ?=
 =?us-ascii?Q?FZHUiRUcUS+GksUQ4ThvW3nT9RPN1Y5sN/uW3CJ8K7PRRQ2UGCNa2OzbsYgb?=
 =?us-ascii?Q?hWZrp4Czic48rsV0EoKn3I1UgTEoZDNR2bkAzRtcjd28S27U6R99y8HkXIQV?=
 =?us-ascii?Q?YgvECvOTqcyl0iLNWuswgSC60BW0YmqzL/T3Hv5ja4j+Y67ndFKiuJO8Ax+W?=
 =?us-ascii?Q?haFxepckhtrVm4es3fTSrKboKPeKUDFApAXZXWptbvNQyb2hRdBD8y0Nvhzb?=
 =?us-ascii?Q?iR9xYKHprQNSEKE+8ZuG1NbHvr7Viqaqcvl38fvHKWeUZfeHumEjsUslsXA2?=
 =?us-ascii?Q?mWyb/eN3OOetgaDoEM/WsaGO6EaApzUP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fjW1vxrBBz+YvLZpmHxZGr/4sFt3IcKysm+B52VV12B+HduAw9O8HYjp6JY8?=
 =?us-ascii?Q?xHZ8s08dTWQQoJYaKxSpwm0OM+UFPTg6mFsMEwjr2HfyLOI+TdJ/jsFGEoHb?=
 =?us-ascii?Q?5B/FAXfQONT9xWgPXIsIUXnwQji/98Nox7n512FdFpVE5xMsJbk7xftvTKnf?=
 =?us-ascii?Q?r/9qWXtms0m1h4OUl9DpYh1yqbjiSpQ6dAtvtz7LwTvpIhpAfAAxU7Pbx+II?=
 =?us-ascii?Q?rFWUpZo1/fsTGnvBF1mzKG93oxK1gnYSveV6EbDJ56zW7Y/1UyLtOeUsuhos?=
 =?us-ascii?Q?tOrzkKse4887VRe7hCrSZfgOC89K4oGnw9FmWXjctVSR3VD6241nwvGB+2S+?=
 =?us-ascii?Q?JnGXIyVprr3MMJVTD3ZY0cMdHIhfst/gXeur4j9mp0IUPFhUQ8m0e7e2RQJY?=
 =?us-ascii?Q?yfMgwZchc8KuFkZAlhql0dmVQcCsuDFtUBVHT4MNevLLKacHki/1gZnrn2Et?=
 =?us-ascii?Q?Chnv2/L1UM1ZGd5zLLiA4Rv9vIR3LKwJgsfqqBIvgX935htuZoDu0DSY3JrL?=
 =?us-ascii?Q?QDujslqsSl5qbtAiPQnh46f4UJ+m496mRWn4fAbAXgkeVZcW4D30av7hy/3h?=
 =?us-ascii?Q?NYHFaFuE0fPwOUGs5gs8wZwt5s5THRWvJdTlfTkxJvC4tDbgtBy426U5X/ym?=
 =?us-ascii?Q?xTJlI57jl+rspb4clQckCafxRumP03lkRwUOsommGPsibWVj2T3D4LBslsjP?=
 =?us-ascii?Q?7GppsM3Z9DWfS3QQrd9jgfYxGufG+k/0x/q7INP/KfhGmcyqn85FD5yCuET5?=
 =?us-ascii?Q?deFQvJcwR/J8cISBFAJk9Rboeucmn9jMBT3PwUXFrW2O/k30JU0J5tX8Rx1U?=
 =?us-ascii?Q?0XV0E+TxYxHIX+Yk2yVF4pwbflKIFIthAytX5uU5QzU2AVDyu05X1R6Fkwib?=
 =?us-ascii?Q?dUWxsTEcPw2x+Q1vr/vrzB3L2sR/xGTqLnxpzGrXDdoXDd3k2zI4APm7zv5q?=
 =?us-ascii?Q?XBa+if6hngw5D3lNddh8rzk1tF9O6tiL1ffzd+KCuWFRw62anVUrcmOBGLps?=
 =?us-ascii?Q?z7hY6T3yNPFldVBdEba8cN2QGJ5kkSbYU6kR+dHg+5xThV6kWsF8FTjBczRo?=
 =?us-ascii?Q?xMDC84Ebp9WPYRdW7h40+1Vdw7I4HhRQEeluhQH36Y2AHqjMenVo9DMm2R45?=
 =?us-ascii?Q?spGl3TVcxn2N2g88gvuVx9mHA8Zb6dbqdlRHOUiIda9idShKv7dIIyCAtgzb?=
 =?us-ascii?Q?YaL8r6xh4TvdRSOz5DNU4oWPYXCatvQmwiBgo/H3BSYvSyhYxL37LeeQpczl?=
 =?us-ascii?Q?83rDB8ZrPuO1BvKkqWxJxBLB6lvOv1RmGbNMXHdBFi7B1frQll+6T9GIyr1z?=
 =?us-ascii?Q?ppI8+Tjb24eC9/VdOzz0RDE3KYC7EcGNvqYNY5WRLGwqsSL4KoCEO7n8qCOz?=
 =?us-ascii?Q?l2fCdwZObPB/SRRCJyXpKGihWIBhRH49A1DgH29Cx/8TB+YXsCR+/SmedbYR?=
 =?us-ascii?Q?7jx1AxiDg1dIXN80BMMw8lMPNxYMSlooAcERgQBPi9VaiZdvxpLhUfOXP6Mp?=
 =?us-ascii?Q?il63qUQss2aSO9J3nysuflLQWTq4HlkT49OiDyPawqpOCYuw/rY+dd8vVhPM?=
 =?us-ascii?Q?1d+AFSLHc2+jVttCF/K0F9NYgZUem7IynCf9qg1O?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zcjNPox/9Dyvn2HdZPrZxTUDDnUkg+gqCgP4ZGp0mFvEhr0ZjeB5P7LMAtV+pqqThaN5bXr8QNBy+snOyQ1DuWmaq2hDAKerRkGjzrmKiZq/sWWlQjHzUZm7Blnu5XP/X/7FhlyA+bjs5m9DM1g8Bjui7sUJXlk1v8Na/XndXmoMVVmif0Wx+DDfc5HO2+Bk3zATsffmBhIayC5976g2bOZWdDQgUcE/zxcafwtm029Bxv6ZRuoXvNTrp+BGK4Rje9Y9QE02yHjPm35KKGmb+78ukNDHTbM+pLBiAa3390qoOPQBmKrv5x7rkkTSqyRORyELH1wNVB8yLKU3rzrpJuTpPWpAjuijm2vWHYe1WkNnfqFQlwG70+5Vo0+7LSpWmjgEOE0r3bu3i1qk75s4v95DeqSr09GWbRvhHPK8bwPpzCEftz9fA+MVBsRELJt9P881dIY97Mv48qqX/mTS2Cky76ES14TWgGAkeVbhtlcuRA4pmHeTXTavtwSkcUnJTHjPQ5J4WOiHFB6RMiBlmr4UvrGVVp0ZH+NMBHfPXc/54nLmCpbEplHip7FFqqtGgZUZw1ao/8QmdQBdQmpMlIF9TIg/F4Iz12ENQ6ErhSM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1dbeeed-24f5-42d4-5224-08de0c53ca7f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 01:31:55.5502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tH7DtoGweTSyLUdSxvFi2dAHCqG2jpvT7DTOL74ctBYaiP5WNWptkH6St8Q9MI/Gv3H9sF+4YWo8uE8Yr6I30Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5653
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510160009
X-Proofpoint-ORIG-GUID: HRj3lXdULlHbskhX-G6BtASaym3ze8c6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNCBTYWx0ZWRfX4bcjbAzis2er
 TEgrfqtiGnKRFpEz4dgiD4qfw4FM6Odnhzj/wyfBYJyFt5TcCn/zGbxdMFT4n8v9QtthqqB5dJF
 XNdY4Vl34mXpmkqZlfC+anomC2bgqFcgwWxIouETRqdXbNMLdA2MnDWahqlaG75nW8aL4Uw5rEW
 BduXk9hEyvRn4KNqXbsCFIWVMNyy9PDpxTrZJwoeSB7Uw1tOczJS5pS04qhrGy4a1xV7jrxTOsr
 jO9uqijKD/PVAfYEYI8r/K3/V7/WqWG45q/KAo0z0MX1ZtIe3qhIFS4jevUJ3YEHX1wyFw6XPRl
 zKgGZgC8iXLipeM/WKf96ik1VLd8CzMCvMOhOkgtJCn4u6zA6pxqJf755kjzHspfgGOfnNYm90O
 ALhhai889YFKxcRdTBetGadAZXh9no/3dseM0ovhrGpuiCR5+T0=
X-Authority-Analysis: v=2.4 cv=E7TAZKdl c=1 sm=1 tr=0 ts=68f04b10 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=HmKLAkCTMs8L-BUC-fMA:9 a=RSxGc5aSg-tLStXr:21 cc=ntf awl=host:12091
X-Proofpoint-GUID: HRj3lXdULlHbskhX-G6BtASaym3ze8c6

From: Eugene Loh <eugene.loh@oracle.com>

This is a set of new example scripts.  These are basic programs to
demonstrate specific functionality.  For example to get an overview
of system calls executed, processes running, I/O statistics, etc.
There is also an example of a D script embedded in a shell script.

Signed-off-by: Ruud van der Pas <ruud.vanderpas@oracle.com>
---
 examples/getting-started/activity.d      | 110 ++++++++++++++++++
 examples/getting-started/activity1.d     | 126 +++++++++++++++++++++
 examples/getting-started/calltrace.d     |  88 +++++++++++++++
 examples/getting-started/countcalls.d    |  38 +++++++
 examples/getting-started/countprogs.d    |  37 ++++++
 examples/getting-started/countsyscalls.d |  31 ++++++
 examples/getting-started/cswpercpu.d     |  81 ++++++++++++++
 examples/getting-started/daterun.d       |  35 ++++++
 examples/getting-started/diskact.d       |  99 +++++++++++++++++
 examples/getting-started/errno.d         |  48 ++++++++
 examples/getting-started/errno1.d        | 136 +++++++++++++++++++++++
 examples/getting-started/execcalls.d     |  44 ++++++++
 examples/getting-started/fsact.sh        | 109 ++++++++++++++++++
 examples/getting-started/goodbye.d       |  29 +++++
 examples/getting-started/hello.d         |  21 ++++
 examples/getting-started/readsizes.d     |  39 +++++++
 examples/getting-started/readtrace.d     |  65 +++++++++++
 examples/getting-started/readtrace1.d    |  71 ++++++++++++
 examples/getting-started/rwdiskact.d     | 110 ++++++++++++++++++
 examples/getting-started/syscalls.d      |  44 ++++++++
 examples/getting-started/syscalls1.d     |  53 +++++++++
 examples/getting-started/tick.d          |  48 ++++++++
 examples/getting-started/tick1.d         |  49 ++++++++
 examples/getting-started/wrun.d          |  48 ++++++++
 24 files changed, 1559 insertions(+)
 create mode 100755 examples/getting-started/activity.d
 create mode 100755 examples/getting-started/activity1.d
 create mode 100755 examples/getting-started/calltrace.d
 create mode 100755 examples/getting-started/countcalls.d
 create mode 100755 examples/getting-started/countprogs.d
 create mode 100755 examples/getting-started/countsyscalls.d
 create mode 100755 examples/getting-started/cswpercpu.d
 create mode 100755 examples/getting-started/daterun.d
 create mode 100755 examples/getting-started/diskact.d
 create mode 100755 examples/getting-started/errno.d
 create mode 100755 examples/getting-started/errno1.d
 create mode 100755 examples/getting-started/execcalls.d
 create mode 100755 examples/getting-started/fsact.sh
 create mode 100755 examples/getting-started/goodbye.d
 create mode 100755 examples/getting-started/hello.d
 create mode 100755 examples/getting-started/readsizes.d
 create mode 100755 examples/getting-started/readtrace.d
 create mode 100755 examples/getting-started/readtrace1.d
 create mode 100755 examples/getting-started/rwdiskact.d
 create mode 100755 examples/getting-started/syscalls.d
 create mode 100755 examples/getting-started/syscalls1.d
 create mode 100755 examples/getting-started/tick.d
 create mode 100644 examples/getting-started/tick1.d
 create mode 100755 examples/getting-started/wrun.d

diff --git a/examples/getting-started/activity.d b/examples/getting-started/activity.d
new file mode 100755
index 000000000..8a5b687aa
--- /dev/null
+++ b/examples/getting-started/activity.d
@@ -0,0 +1,110 @@
+/*
+ *  NAME
+ *    activity.d - report on process create, exec and exit
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s activity.d
+ *
+ *  DESCRIPTION
+ *    Show the processes that are created, executed and exited
+ *    while the script is running.
+ *
+ *  NOTES
+ *    - This script uses the proc provider to trace the following process
+ *    activities: create, exec, and exit.
+ *
+ *    - This script is guaranteed to produce results if you start one or
+ *    more commands while the script is running.  There are two ways to do
+ *    this:
+ *    o Execute this script in the background, and type in the command(s).
+ *    o Alternatively, run the script in the foreground and type the
+ *    command(s) in a separate terminal window on the same system.
+ *
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - Associative arrays are used to store the information from the
+ *    proc provider.
+ *
+ *    - The DTrace User Guide documents the proc provider probe
+ *    arguments like args[0] and also structures like psinfo_t.  It is
+ *    strongly recommended to check the documentation for this info.
+ */
+
+/*
+ *  Fires when a process (or process thread) is created using fork() or
+ *  vfork(), which both invoke clone().  The psinfo_t corresponding to
+ *  the new child process is pointed to by args[0].
+ */
+proc:::create
+{
+/*
+ *  Store the PID of both the parent and child process from the psinfo_t
+ *  structure pointed to by args[0].  Use 3 associative arrays to store the
+ *  various items of interest.
+ */
+  childpid  = args[0]->pr_pid;
+  parentpid = args[0]->pr_ppid;
+
+/*
+ *  Store the parent PID of the new child process.
+ */
+  p_pid[childpid] = parentpid;
+
+/*
+ *  Parent command name.
+ */
+  p_name[childpid] = execname;
+
+/*
+ *  Child has not yet been exec'ed.
+ */
+  p_exec[childpid] = "";
+}
+
+/*
+ *  The process starts.  In case proc:::create has fired, store the
+ *  absolute time and the full name of the child process.
+ */
+proc:::exec
+/ p_pid[pid] != 0 /
+{
+  time[pid]   = timestamp;
+  p_exec[pid] = args[0];
+}
+
+/*
+ *  The process starts, but in this case, proc:::create has not fired.
+ *  In addition to storing the name of the child process, store the
+ *  various other items of interest.
+ */
+proc:::exec
+/ p_pid[pid] == 0 /
+{
+  time[pid]   = timestamp;
+  p_exec[pid] = args[0];
+  p_pid[pid]  = ppid;
+  p_name[pid] = execname;
+}
+
+/*
+ *  The process exits.  Print the information.
+ */
+proc:::exit
+/p_pid[pid] != 0 && p_exec[pid] != ""/
+{
+  printf("%-16s (%d) executed %s (%d) for %d microseconds\n",
+    p_name[pid], p_pid[pid], p_exec[pid], pid, (timestamp - time[pid])/1000);
+}
+
+/*
+ *  The process has forked itself and exits.  Print the information.
+ */
+proc:::exit
+/p_pid[pid] != 0 && p_exec[pid] == ""/
+{
+  printf("%-16s (%d) forked itself (as %d) for %d microseconds\n",
+    p_name[pid], p_pid[pid], pid, (timestamp - time[pid])/1000);
+}
diff --git a/examples/getting-started/activity1.d b/examples/getting-started/activity1.d
new file mode 100755
index 000000000..692e8c343
--- /dev/null
+++ b/examples/getting-started/activity1.d
@@ -0,0 +1,126 @@
+/*
+ *  NAME
+ *    activity1.d - report on process create, exec and exit
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s activity1.d '"bash"'
+ *
+ *  DESCRIPTION
+ *    Show the processes that are created, executed and exited
+ *    in the bash shell while the script is running.
+ *
+ *  NOTES
+ *    - This script uses the proc provider to trace the following process
+ *    activities: create, exec, and exit.
+ *
+ *    - A predicate is used to ensure that only those processes executed
+ *    by bash are traced.  While this could be hard coded, here the name
+ *    is passed in as an argument.
+ *
+ *    - This script is guaranteed to produce results if you execute
+ *    one or more commands while the script is running.  There are two
+ *    ways to do this:
+ *    o Execute this script in the background, and type in the command(s).
+ *    o Alternatively, run the script in the foreground and type the
+ *    command(s) in a separate terminal window on the same system.
+ *
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - Associative arrays are used to store the information from the
+ *    proc provider.
+ *
+ *    - There is on important subtlety to pay attention to.  Since
+ *    bash (and other shells) optimize for performance, it may happen
+ *    that proc:::create does not fire, because there is no call to
+ *    fork(), clone(), etc.  This is why two different probes for
+ *    proc:::exec are defined.
+ *
+ *    - The DTrace User Guide documents the proc provider probe
+ *    arguments like args[0] and also structures like psinfo_t.  It is
+ *    strongly recommended to check the documentation for this info.
+ */
+
+/*
+ *  Fires when a process (or process thread) is created using fork() or
+ *  vfork(), which both invoke clone().  The psinfo_t corresponding to
+ *  the new child process is pointed to by args[0].
+ *
+ *  Use a predicate to only execute the clause if the condition is met.
+ *  In this case that means that only processes executed in the bash
+ *  shell are traced.
+ */
+proc:::create
+/ execname == $1 /
+{
+/*
+ *  Store the PID of both the parent and child process from the psinfo_t
+ *  structure pointed to by args[0].  Use 3 associative arrays to store the
+ *  various items of interest.
+ */
+  childpid  = args[0]->pr_pid;
+  parentpid = args[0]->pr_ppid;
+
+/*
+ *  Store the parent PID of the new child process.
+ */
+  p_pid[childpid] = parentpid;
+
+/*
+ *  Parent command name.
+ */
+  p_name[childpid] = execname;
+
+/*
+ *  Child has not yet been exec'ed.
+ */
+  p_exec[childpid] = "";
+}
+
+/*
+ *  The process starts.  In case proc:::create has fired, store the
+ *  absolute time and the full name of the child process.
+ */
+
+proc:::exec
+/ execname == $1 && p_pid[pid] != 0 /
+{
+  time[pid]   = timestamp;
+  p_exec[pid] = args[0];
+}
+
+/*
+ *  The process starts, but in this case, proc:::create has not fired.
+ *  In addition to storing the name of the child process, store the
+ *  various other items of interest.
+ */
+proc:::exec
+/ execname == $1 && p_pid[pid] == 0 /
+{
+  time[pid]   = timestamp;
+  p_exec[pid] = args[0];
+  p_pid[pid]  = ppid;
+  p_name[pid] = execname;
+}
+
+/*
+ *  The process exits.  Print the information.
+ */
+proc:::exit
+/p_pid[pid] != 0 && p_exec[pid] != ""/
+{
+  printf("%-16s (%d) executed %s (%d) for %d microseconds\n",
+    p_name[pid], p_pid[pid], p_exec[pid], pid, (timestamp - time[pid])/1000);
+}
+
+/*
+ *  The process has forked itself and exits.  Print the information.
+ */
+proc:::exit
+/p_pid[pid] != 0 && p_exec[pid] == ""/
+{
+  printf("%-16s (%d) forked itself (as %d) for %d microseconds\n",
+    p_name[pid], p_pid[pid], pid, (timestamp - time[pid])/1000);
+}
diff --git a/examples/getting-started/calltrace.d b/examples/getting-started/calltrace.d
new file mode 100755
index 000000000..a0ff14c15
--- /dev/null
+++ b/examples/getting-started/calltrace.d
@@ -0,0 +1,88 @@
+/*
+ *  NAME
+ *    calltrace.d - time all system calls for the cp command
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s calltrace.d
+ *
+ *  DESCRIPTION
+ *    List and time all the system calls that are executed while
+ *    a file is copied with the cp command.
+ *
+ *  NOTES
+ *    - This script traces all system calls that are executed when
+ *    the cp command is used to copy a file.
+ *
+ *    This means that you need to execute the cp command while the
+ *    script is running.  There are two ways to do this:
+ *    o Execute this script in the background, and type in the cp command.
+ *    o Alternatively, run the script in the foreground and type
+ *    the cp command in a separate terminal window on the same system.
+ *
+ *    - You can use any file to copy, but you can also generate a file
+ *    and then copy it.  This is an example how to create a 500 MB file,
+ *    copy it with the cp command and remove both files again:
+ *    $ dd if=/dev/zero of=tmp_file bs=100M seek=5 count=0
+ *    $ cp tmp_file tmp_file2
+ *    $ rm tmp_file tmp_file2
+ *
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - Although the results of an aggregation are automatically
+ *    printed when the tracing terminates, in this case, we want to
+ *    control the format of the output.  This is why the results are
+ *    printed using printa() in the END probe
+ */
+
+/*
+ *  Set the base value of the timer.  This is used as an offset in the
+ *  return probe to calculate the time spent in a system call.
+ *
+ *  A predicate is used to select the cp command.  All other commands
+ *  skip executing the clause and do not set ts_base.
+ */
+syscall:::entry
+/ execname == "cp" /
+{
+  self->ts_base = timestamp;
+}
+
+/*
+ *  The predicate ensures that the base timing has been set.
+ *  Since this is only done for the cp command, no information
+ *  is collected for the other processes.
+ */
+syscall:::return
+/self->ts_base != 0/
+{
+/*
+ *  Compute the time passed since the entry probe fired and
+ *  convert the nanosecond value to microseconds.
+ *
+ *  Update the aggregation called totals with this time.  The
+ *  execname (which is cp here) and the system call that caused
+ *  the probe to fire, are the fields in the key.
+ */
+  this->time_call = (timestamp - self->ts_base)/1000;
+  @totals[execname,probefunc] = sum(this->time_call);
+
+/*
+ *  Free the storage for ts_base.
+ */
+  self->ts_base = 0;
+}
+
+/*
+ *  Print the results.  Use printf() to print a description of
+ *  the contents of the aggregation.  The format string in printa()
+ *  is used to create a table lay-out.
+ */
+END
+{
+  printf("System calls executed and their duration:\n");
+  printa("%15s executed %18s - this took a total of %@8d microseconds\n",
+         @totals);
+}
diff --git a/examples/getting-started/countcalls.d b/examples/getting-started/countcalls.d
new file mode 100755
index 000000000..fb22b2aba
--- /dev/null
+++ b/examples/getting-started/countcalls.d
@@ -0,0 +1,38 @@
+/*
+ *  NAME
+ *    countcalls.d - count the open(), read(), and write() calls for 5 seconds
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s countcalls.d
+ *
+ *  DESCRIPTION
+ *    List and count the calls to write(), read(), and open() executed, while
+ *    the script is running.  The script automatically stops after 5 seconds.
+ *
+ *  NOTES
+ *    - This script uses the profile provider to stop the tracing after a
+ *    certain amount of time.  This time can easily be adjusted by changing.
+ *    the number and unit.
+ *
+ *    - An anonymous aggregation is used to store the results.  Like a named
+ *    aggregation, it is automatically printed when the tracing terminates.
+ */
+
+/*
+ *  Fires every 5 seconds.  Since exit() is called, the tracing terminates
+ *  the first time this probe fires and the clause is executed.
+ */
+profile:::tick-5sec
+{
+  exit(0);
+}
+
+/*
+ *  Create the key by concatenating the function name and a string.  An
+ *  alternative is to only use probefunc as a key and print the string as
+ *  part of a printa() in the END probe: printa("%s () calls\n",@);
+ */
+syscall::write:entry, syscall::read:entry, syscall::open:entry
+{
+  @[strjoin(probefunc,"() calls")] = count();
+}
diff --git a/examples/getting-started/countprogs.d b/examples/getting-started/countprogs.d
new file mode 100755
index 000000000..14d791b24
--- /dev/null
+++ b/examples/getting-started/countprogs.d
@@ -0,0 +1,37 @@
+/*
+ *  NAME
+ *    countprogs.d - count processes invoked by a specific user
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s countprogs.d
+ *
+ *  DESCRIPTION
+ *    List and count every processes that is started by the user, while
+ *    this script runs.  The user id is passed in as an argument to the
+ *    script.
+ *
+ *  NOTES
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - To ensure a process is started while the script is running,
+ *    either execute this script in the background, and type in one
+ *    or more commands, or run it in the foreground and type in the
+ *    command(s) in a separate terminal window on the same system.
+ *
+ *    - The results of an aggregation are automatically printed when
+ *    the tracing terminates.
+ */
+
+/*
+ *  Fires on every process that starts execution.  An aggregation called
+ *  proc_name uses the executable name as a key and counts the number of
+ *  times this executable, or process, is started.
+ */
+proc:::exec
+/uid == $1/
+{
+  @proc_name[execname] = count();
+}
diff --git a/examples/getting-started/countsyscalls.d b/examples/getting-started/countsyscalls.d
new file mode 100755
index 000000000..31fa750e2
--- /dev/null
+++ b/examples/getting-started/countsyscalls.d
@@ -0,0 +1,31 @@
+/*
+ *  NAME
+ *    countsyscalls.d - count system calls invoked by a specific user
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s countsyscalls.d
+ *
+ *  DESCRIPTION
+ *    List and count all the system calls executed by the specified user id.
+ *    The user id is passed in as an argument to the script.
+ *
+ *  NOTES
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - The results of the aggregation are automatically printed when
+ *    the tracing terminates.
+ */
+
+/*
+ *  Fires on every system call executed.  An aggregation called syscalls
+ *  uses the function name as a key and counts the number of calls to this
+ *  function.
+ */
+syscall:::entry
+/pid == $1/
+{
+  @syscalls[probefunc] = count();
+}
diff --git a/examples/getting-started/cswpercpu.d b/examples/getting-started/cswpercpu.d
new file mode 100755
index 000000000..e2cac6d9c
--- /dev/null
+++ b/examples/getting-started/cswpercpu.d
@@ -0,0 +1,81 @@
+/*
+ *  NAME
+ *    cswpercpu.d - print the number of context switches per CPU per second
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s cswpercpu.d
+ *
+ *  DESCRIPTION
+ *    Every second, print the CPU id, the number of context switches each
+ *    CPU performed, plus the total number of context switches executed
+ *    across all the CPUs.  For each info block, include a time stamp.
+ *
+ *  NOTES
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - The results are stored in an aggregation called cswpersec.
+ *    Every second, the results are printed with printa() and the
+ *    aggregation is cleared.
+ *
+ *    - In addition to using the CPU ID as a key in the cswpersec
+ *    aggregation, also the string "total" is used.  This entry
+ *    is always printed last, because by default, printa() prints
+ *    the results sorted by the value.  The total count for any of
+ *    the CPU Ids is always equal or less than "total".
+ */
+
+/*
+ *  To avoid that the carefully crafted output is mixed with the
+ *  default output by the dtrace command, enable quiet mode.
+ */
+#pragma D option quiet
+
+/*
+ *  Print the header.
+ */
+BEGIN
+{
+  printf("%-20s %5s %15s", "Timestamp", "CPU", "#csw");
+}
+
+/*
+ *  Fires when a process is scheduled to run on a CPU.
+ */
+sched:::on-cpu
+{
+/*
+ *  Convert the CPU ID to a string.  This needs to be done because
+ *  key "total" is a string.
+ */
+  cpustr = lltostr(cpu);
+/*
+ *  Update the count.
+ */
+  @cswpersec[cpustr]  = count();
+  @cswpersec["total"] = count();
+}
+
+/*
+ *  Fires every second.
+ */
+profile:::tick-1sec
+{
+/*
+ *  Print the date and time first
+ */
+  printf("\n%-20Y ", walltimestamp);
+
+/*
+ *  Print the aggregated counts for each CPU and the total for all CPUs.
+ *  Use some formatting magic to get a special table lay-out.
+ */
+  printa("%5s %@15d\n                     ", @cswpersec);
+
+/*
+ *  Reset the aggregation.
+ */
+  clear(@cswpersec);
+}
diff --git a/examples/getting-started/daterun.d b/examples/getting-started/daterun.d
new file mode 100755
index 000000000..f77dc736e
--- /dev/null
+++ b/examples/getting-started/daterun.d
@@ -0,0 +1,35 @@
+/*
+ *  NAME
+ *    daterun.d - display arguments to write() for the date command
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s daterun.d
+ *
+ *  DESCRIPTION
+ *    Trace the calls to write(), but only when executed by the date
+ *    command.  For such calls, print the file descriptor, the output
+ *    string, and the number of bytes printed.
+ *
+ *  NOTES
+ *    - Execute this script in the background, and type in "date", or
+ *    run it in the foreground and type in "date" in a separate window.
+ *
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - The output string is stored in arg1 and contains a newline (\n)
+ *    character.  This is why the byte count is printed on a separate line.
+ */
+
+syscall::write:entry
+/execname == "date"/
+{
+/*
+ *  Use copyinstr() to copy the string from the user address into a
+ *  DTrace buffer.  This function returns a pointer to the buffer.
+ */
+  printf("%s (fd=%d output=%s bytes=%d)\n",probefunc, arg0,
+                                           copyinstr(arg1), arg2);
+}
diff --git a/examples/getting-started/diskact.d b/examples/getting-started/diskact.d
new file mode 100755
index 000000000..77920035b
--- /dev/null
+++ b/examples/getting-started/diskact.d
@@ -0,0 +1,99 @@
+/*
+ *  NAME
+ *    diskact.d - for block devices show the distribution of I/O throughput
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s diskact.d
+ *
+ *  DESCRIPTION
+ *    The io provider is used to gather the I/O throughput for the block
+ *    devices on the system.  A histogram of the results is printed.
+ *
+ *  NOTES
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *   - The bufinfo_t structure is the abstraction that describes an I/O
+ *   request.  The buffer that corresponds to an I/O request is pointed
+ *   to by args[0] in the start, done, wait-start, and wait-done probes
+ *   available through the io provider.
+ *
+ *   - Detailed information about this data structure can be found in
+ *   the DTrace User Guide.  For more details, you can also check
+ *   /usr/lib64/dtrace/<version>/io.d, where <version> denotes the
+ *   DTrace version number(s) in /usr/lib64/dtrace.
+ *
+ *    - Although the results of an aggregation are automatically
+ *    printed when the tracing terminates, in this case, we want to
+ *    control the format of the output.  This is why the results are
+ *    printed using printa() in the END probe
+ */
+
+/*
+ *  To avoid that the carefully crafted output is mixed with the
+ *  default output by the dtrace command, enable quiet mode.
+ */
+#pragma D option quiet
+
+/*
+ *  The pointer to bufinfo_t is in args[0].  Here it is used to get
+ *  b_edev (the extended device) and b_blkno (the expanded block
+ *  number on the device).  These two fields are used in the key for
+ *  associative array io_start.
+ */
+io:::start
+{
+  io_start[args[0]->b_edev, args[0]->b_blkno] = timestamp;
+}
+
+io:::done
+/ io_start[args[0]->b_edev, args[0]->b_blkno] /
+{
+/*
+ *  We would like to show the throughput to a device in KB/sec, but
+ *  the values that are measured are in bytes and nanoseconds.
+ *  You want to calculate the following:
+ *
+ *  bytes / 1024
+ *  ------------------------
+ *  nanoseconds / 1000000000
+ *
+ *  As DTrace uses integer arithmetic and the denominator is usually
+ *  between 0 and 1 for most I/O, the calculation as shown will lose
+ *  precision.  So, restate the fraction as:
+ *
+ *  bytes         1000000000      bytes * 976562
+ *  ----------- * ------------- = --------------
+ *  nanoseconds   1024            nanoseconds
+ *
+ *  This is easy to calculate using integer arithmetic.
+ */
+
+  this->elapsed = timestamp -  io_start[args[0]->b_edev, args[0]->b_blkno];
+
+/*
+ *  The pointer to structure devinfo_t is in args[1].  Use this to get the
+ *  name (+ instance/minor) and the pathname of the device.
+ *
+ *  Use the formula above to compute the throughput.  The number of bytes
+ *  transferred is in bufinfo_t->b_bcount
+ */
+  @io_throughput[strjoin("device name = ",args[1]->dev_statname),
+                 strjoin("path = ",args[1]->dev_pathname)] =
+                   quantize((args[0]->b_bcount * 976562) / this->elapsed);
+
+/*
+ *  Free the storage for the entry in the associative array.
+ */
+  io_start[args[0]->b_edev, args[0]->b_blkno] = 0;
+}
+
+/*
+ *  Use a format string to print the aggregation.
+ */
+END
+{
+  printa(" %s (%s)\n%@d\n", @io_throughput);
+}
diff --git a/examples/getting-started/errno.d b/examples/getting-started/errno.d
new file mode 100755
index 000000000..b22f4b577
--- /dev/null
+++ b/examples/getting-started/errno.d
@@ -0,0 +1,48 @@
+/*
+ *  NAME
+ *    errno.d - list and count the system calls with a non-zero errno value
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s errno.d
+ *
+ *  DESCRIPTION
+ *    Trace every system call that returns a non-zero value in errno.
+ *    Show the name of the function, the value of errno and how often
+ *    this function returned a non-zero value for errno.
+ *
+ *  NOTES
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - The value of errno is available upon the return from the system call.
+ *
+ *    - To present the results in a compact form, we use an aggregation
+ *    called syscalls.  Otherwise we may get several screens with the
+ *    information.  Plus that we then can't easily count the functions.
+ *
+ *    - Although the results of an aggregation are automatically
+ *    printed when the tracing terminates, in this case, we want to
+ *    control the format of the output.  This is why the results are
+ *    printed using printa() in the END probe
+ */
+
+/*
+ *  Use the predicate to only allow non-zero errno values that are
+ *  within the range for errno.
+ */
+syscall:::return
+/ errno > 0 && errno <= ERANGE /
+{
+  @syscalls[probefunc,errno] = count();
+}
+
+/*
+ *  The printf() line prints the header of the table to follow.
+ */
+END
+{
+  printf("%20s %5s %5s\n\n","syscall","errno","count");
+  printa("%20s %5d %@5d\n",@syscalls);
+}
diff --git a/examples/getting-started/errno1.d b/examples/getting-started/errno1.d
new file mode 100755
index 000000000..01f3a229b
--- /dev/null
+++ b/examples/getting-started/errno1.d
@@ -0,0 +1,136 @@
+/*
+ *  NAME
+ *    errno1.d - list and count the system calls with a non-zero errno value
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s errno1.d
+ *
+ *  DESCRIPTION
+ *    Trace every system call that returns a non-zero value in errno.
+ *    Show the process name, the name of the function it executes, the
+ *    user id, the name of the error that corresponds to the value of
+ *    errno, a descriptive message for the error, and how often this
+ *    combination occurred.
+ *
+ *  NOTES
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - The value of errno is available upon the return from the system call.
+ *
+ *    - To present the results in a compact form, we use an aggregation
+ *    called syscalls.  Otherwise we may get several screens with the
+ *    information.  Plus that we then can't easily count the functions.
+ *
+ *    - Although the results of an aggregation are automatically
+ *    printed when the tracing terminates, in this case, we want to
+ *    control the format of the output.  This is why the results are
+ *    printed using printa() in the END probe
+ */
+
+BEGIN
+{
+/*
+ *  Define an associative array called errno_code that maps a value of errno
+ *  to a string with the name of the error.  This information can be found
+ *  in file /usr/include/asm-generic/errno-base.h.
+ *
+ *  File /usr/include/asm-generic/errno.h has the codes for calling a system
+ *  call that does not exist.  This has not been used here though.
+ */
+  errno_code[EPERM]   = "EPERM";    /* Operation not permitted */
+  errno_code[ENOENT]  = "ENOENT";   /* No such file or directory */
+  errno_code[ESRCH]   = "ESRCH";    /* No such process */
+  errno_code[EINTR]   = "EINTR";    /* Interrupted system call */
+  errno_code[EIO]     = "EIO";      /* I/O error */
+  errno_code[ENXIO]   = "ENXIO";    /* No such device or address */
+  errno_code[E2BIG]   = "E2BIG";    /* Argument list too long */
+  errno_code[ENOEXEC] = "ENOEXEC";  /* Exec format error */
+  errno_code[EBADF]   = "EBADF";    /* Bad file number */
+  errno_code[ECHILD]  = "ECHILD";   /* No child processes */
+  errno_code[EAGAIN]  = "EAGAIN";   /* Try again or operation would block */
+  errno_code[ENOMEM]  = "ENOMEM";   /* Out of memory */
+  errno_code[EACCES]  = "EACCES";   /* Permission denied */
+  errno_code[EFAULT]  = "EFAULT";   /* Bad address */
+  errno_code[ENOTBLK] = "ENOTBLK";  /* Block device required */
+  errno_code[EBUSY]   = "EBUSY";    /* Device or resource busy */
+  errno_code[EEXIST]  = "EEXIST";   /* File exists */
+  errno_code[EXDEV]   = "EXDEV";    /* Cross-device link */
+  errno_code[ENODEV]  = "ENODEV";   /* No such device */
+  errno_code[ENOTDIR] = "ENOTDIR";  /* Not a directory */
+  errno_code[EISDIR]  = "EISDIR";   /* Is a directory */
+  errno_code[EINVAL]  = "EINVAL";   /* Invalid argument */
+  errno_code[ENFILE]  = "ENFILE";   /* File table overflow */
+  errno_code[EMFILE]  = "EMFILE";   /* Too many open files */
+  errno_code[ENOTTY]  = "ENOTTY";   /* Not a typewriter */
+  errno_code[ETXTBSY] = "ETXTBSY";  /* Text file busy */
+  errno_code[EFBIG]   = "EFBIG";    /* File too large */
+  errno_code[ENOSPC]  = "ENOSPC";   /* No space left on device */
+  errno_code[ESPIPE]  = "ESPIPE";   /* Illegal seek */
+  errno_code[EROFS]   = "EROFS";    /* Read-only file system */
+  errno_code[EMLINK]  = "EMLINK";   /* Too many links */
+  errno_code[EPIPE]   = "EPIPE";    /* Broken pipe */
+  errno_code[EDOM]    = "EDOM";     /* Math argument out of domain of func */
+  errno_code[ERANGE]  = "ERANGE";   /* Math result not representable */
+
+/*
+ *  This associative array called errno_msg has a brief description of the
+ *  error for each non-zero value of errno.
+ */
+  errno_msg["EPERM"]   = "Operation not permitted";
+  errno_msg["ENOENT"]  = "No such file or directory";
+  errno_msg["ESRCH"]   = "No such process";
+  errno_msg["EINTR"]   = "Interrupted system call";
+  errno_msg["EIO"]     = "I/O error";
+  errno_msg["ENXIO"]   = "No such device or address";
+  errno_msg["E2BIG"]   = "Argument list too long";
+  errno_msg["ENOEXEC"] = "Exec format error";
+  errno_msg["EBADF"]   = "Bad file number";
+  errno_msg["ECHILD"]  = "No child processes";
+  errno_msg["EAGAIN"]  = "Try again or operation would block";
+  errno_msg["ENOMEM"]  = "Out of memory";
+  errno_msg["EACCES"]  = "Permission denied";
+  errno_msg["EFAULT"]  = "Bad address";
+  errno_msg["ENOTBLK"] = "Block device required";
+  errno_msg["EBUSY"]   = "Device or resource busy";
+  errno_msg["EEXIST"]  = "File exists";
+  errno_msg["EXDEV"]   = "Cross-device link";
+  errno_msg["ENODEV"]  = "No such device";
+  errno_msg["ENOTDIR"] = "Not a directory";
+  errno_msg["EISDIR"]  = "Is a directory";
+  errno_msg["EINVAL"]  = "Invalid argument";
+  errno_msg["ENFILE"]  = "File table overflow";
+  errno_msg["EMFILE"]  = "Too many open files";
+  errno_msg["ENOTTY"]  = "Not a typewriter";
+  errno_msg["ETXTBSY"] = "Text file busy";
+  errno_msg["EFBIG"]   = "File too large";
+  errno_msg["ENOSPC"]  = "No space left on device";
+  errno_msg["ESPIPE"]  = "Illegal seek";
+  errno_msg["EROFS"]   = "Read-only file system";
+  errno_msg["EMLINK"]  = "Too many links";
+  errno_msg["EPIPE"]   = "Broken pipe";
+  errno_msg["EDOM"]    = "Math argument out of domain of func";
+  errno_msg["ERANGE"]  = "Math result not representable";
+}
+
+/*
+ *  Store the information in an aggregation called syscalls.
+ */
+syscall:::return
+/ errno > 0 && errno <= ERANGE /
+{
+  @syscalls[execname,probefunc,uid,errno_code[errno],
+            errno_msg[errno_code[errno]]] = count();
+}
+
+/*
+ *  The printf() line prints the header of the table to follow.
+ */
+END
+{
+  printf("%-20s %-16s %-6s %-7s %-35s %5s\n\n","PROCESS","SYSCALL","UID",
+         "ERROR","DESCRIPTION","COUNT");
+  printa("%-20s %-16s %-6d %-7s %-35s %@5d\n",@syscalls);
+}
diff --git a/examples/getting-started/execcalls.d b/examples/getting-started/execcalls.d
new file mode 100755
index 000000000..f12753cbf
--- /dev/null
+++ b/examples/getting-started/execcalls.d
@@ -0,0 +1,44 @@
+/*
+ *  NAME
+ *    execcalls.d - show all processes that start executing
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s execcals.d
+ *
+ *  DESCRIPTION
+ *    The probe in this script traces the exec() system call.  It
+ *    fires whenever a process loads a new process image.
+ *
+ *  NOTES
+ *    - This script traces the processes that start executing while
+ *    the script is running.  If no process is started during the
+ *    time that the script runs, no output is produced.
+ *
+ *    If that is the case, you can always execute a command yourself
+ *    while this script is running.  One such command is "date" that
+ *    causes the probe to fire.
+ *
+ *    - If you'd like to execute command(s) while the script is running,
+ *    execute this script in the background, and type in one or more
+ *    commands.  If you started the script in the foreground, type in
+ *    the command(s) in a separate terminal window on the same system.
+ *
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ */
+
+proc:::exec
+/ args[0] != NULL /
+{
+/*
+ *  This information is from the DTrace user guide.  The proc:::exec
+ *  probe makes a pointer to a char available in args[0].  This has
+ *  the path to the new process image.
+ *
+ *  The strjoin() function is used to add a newline (\n) to the
+ *  string that is to be printed.
+ */
+  trace(strjoin(stringof(args[0]),"\n"));
+}
diff --git a/examples/getting-started/fsact.sh b/examples/getting-started/fsact.sh
new file mode 100755
index 000000000..1919460db
--- /dev/null
+++ b/examples/getting-started/fsact.sh
@@ -0,0 +1,109 @@
+#!/bin/bash
+#
+#------------------------------------------------------------------------------
+# This example embeds a DTrace script in a bash script.  The bash script
+# is used to set the variables needed in the D script.
+#
+# fsact -- Display cumulative read and write activity across a file
+#          system device
+#
+#          Usage: fsact [<filesystem>]
+#------------------------------------------------------------------------------
+
+#------------------------------------------------------------------------------
+# If no file system is specified, assume /
+#------------------------------------------------------------------------------
+[ $# -eq 1 ] && FSNAME=$1 || FSNAME="/"
+[ ! -e $FSNAME ] && echo "$FSNAME not found" && exit 1
+
+#------------------------------------------------------------------------------
+# Determine the mountpoint, major and minor numbers, and file system size.
+#------------------------------------------------------------------------------
+MNTPNT=$(df $FSNAME | gawk '{ getline; print $1; exit }')
+MAJOR=$(printf "%d\n" 0x$(stat -Lc "%t" $MNTPNT))
+MINOR=$(printf "%d\n" 0x$(stat -Lc "%T" $MNTPNT))
+FSSIZE=$(stat -fc "%b" $FSNAME)
+
+#------------------------------------------------------------------------------
+# Run the embedded D script.
+#------------------------------------------------------------------------------
+sudo dtrace -qs /dev/stdin << EOF
+/*
+ *  DESCRIPTION
+ *    The io:::done probe from the io provider is used to get read and write
+ *    statistics.  In particular, the id of the block that is accessed for
+ *    the read or write operation.
+ */
+
+BEGIN
+{
+  printf("Show how often blocks are accessed in read and write operations\n");
+  printf("The statistics are updated every 5 seconds\n");
+  printf("The block IDs are normalized to a scale from 0 to 10\n");
+  printf("The file system is %s\n","$FSNAME");
+  printf("The mount point is %s\n","$MNTPNT");
+  printf("The file system size is %s bytes\n","$FSSIZE");
+}
+
+/*
+ *  This probe fires after an I/O request has been fulfilled. The
+ *  done probe fires after the I/O completes, but before completion
+ *  processing has been performed on the buffer.
+ *
+ *  A pointer to structure devinfo_t is in args[1].  This is used
+ *  to get the major and minor number of the device.
+ *
+ *  A pointer to structure bufinfo_t is in args[0].  This is used
+ *  to get the flags and the block number.
+ */
+io:::done
+/ args[1]->dev_major == $MAJOR && args[1]->dev_minor == $MINOR /
+{
+/*
+ *  Check if B_READ has been set and assign a string to io_type
+ *  based on the outcome of the check.  This string is used as
+ *  the key in aggregation io_stats.
+ */
+  io_type = args[0]->b_flags & B_READ ? "READ" : "WRITE";
+
+/*
+ *  Structure member b_lblkno identifies which logical block on the
+ *  device is to be accessed.  Normalize thise block number as an
+ *  integer in the range 0 to 10.
+ */
+  blkno = (args[0]->b_blkno)*10/$FSSIZE;
+
+/*
+ *  Aggregate blkno linearly over the range 0 to 10 in steps of 1.
+ */
+  @io_stats[io_type] = lquantize(blkno,0,10,1)
+}
+
+/*
+ *  Fires every 5 seconds.
+ */
+profile:::tick-5s
+{
+  printf("%Y\n",walltimestamp);
+
+/*
+ *  Display the contents of the aggregation.
+ */
+  printa("%s\n%@d\n",@io_stats);
+
+/*
+ *  Reset the aggregation every time this probe fires
+ */
+  clear(@io_stats);
+}
+
+/*
+ *  Fires every 21 seconds.  Since exit() is called, the tracing terminates
+ *  the first time this probe fires and the clause is executed.
+ */
+profile:::tick-21s
+{
+  printf("Tracing is terminated now\n");
+  exit(0);
+}
+EOF
diff --git a/examples/getting-started/goodbye.d b/examples/getting-started/goodbye.d
new file mode 100755
index 000000000..01330d97e
--- /dev/null
+++ b/examples/getting-started/goodbye.d
@@ -0,0 +1,29 @@
+/*
+ *  NAME
+ *    goodbye.d - demonstrate the END probe
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s goodbye.d
+ *
+ *  DESCRIPTION
+ *    Demonstrates the use of the END probe.  Function trace() is
+ *    used to print a string.
+ *
+ *  NOTES
+ *    - The advantage of trace() is that it is simple and does not
+ *    require a format string.  If more control over the output is
+ *    needed, printf() is a good alternative.
+ *
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ */
+
+/*
+ *  The END probe fires once when the tracing has terminated.
+ */
+END
+{
+  trace("Goodbye");
+}
diff --git a/examples/getting-started/hello.d b/examples/getting-started/hello.d
new file mode 100755
index 000000000..cb53039c0
--- /dev/null
+++ b/examples/getting-started/hello.d
@@ -0,0 +1,21 @@
+/*
+ *  NAME
+ *    hello.d - demonstrate the BEGIN probe
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s hello.d
+ *
+ *  DESCRIPTION
+ *    Demonstrate the use of the BEGIN probe.  Function trace() is
+ *    used to print a string.  The exit() function terminates the
+ *    tracing.
+ */
+
+/*
+ *  The BEGIN probe fires once when tracing starts.
+ */
+BEGIN
+{
+  trace("Hello, world");
+  exit(0);
+}
diff --git a/examples/getting-started/readsizes.d b/examples/getting-started/readsizes.d
new file mode 100755
index 000000000..222c63513
--- /dev/null
+++ b/examples/getting-started/readsizes.d
@@ -0,0 +1,39 @@
+/*
+ *  NAME
+ *    readsizes.d - show the distribution of bytes read when running find
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s readsizes.d
+ *
+ *  DESCRIPTION
+ *    Trace the calls to read() and use a predicate to only select those
+ *    calls executed as part of executing the find command.  For such
+ *    calls, show the distribution of the sizes.
+ *
+ *  NOTES
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - The results are stored in an aggregation called dist with
+ *    the string "find" as the key.
+ *
+ *    - The results of an aggregation are automatically printed when
+ *    the tracing terminates.
+ */
+
+/*
+ *  A predicate is used to guarantee that the clause for the read:entry
+ *  probe is only executed in case the call to read() was issued by the
+ *  find command.
+ *
+ *  The quantize() function is used to show the distribution of the sizes
+ *  read, or attempted to be read, by the read() call.  This value is
+ *  stored in arg2.
+ */
+syscall::read:entry
+/execname == "find"/
+{
+  @dist["find"] = quantize(arg2);
+}
diff --git a/examples/getting-started/readtrace.d b/examples/getting-started/readtrace.d
new file mode 100755
index 000000000..63d3c0608
--- /dev/null
+++ b/examples/getting-started/readtrace.d
@@ -0,0 +1,65 @@
+/*
+ *  NAME
+ *    readtrace.d - show the time spent in the read() system call
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s readtrace.d
+ *
+ *  DESCRIPTION
+ *    For each combination of a process and its id, show the total
+ *    time in microseconds that is spent in the read() system call(s).
+ *
+ *  NOTES
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - An aggregation is used to accumulate the timings.  An alternative
+ *    is to print the results in the read:return probe and if required,
+ *    process the output when the script has completed.
+ *
+ *    - Although the results of an aggregation are automatically
+ *    printed when the tracing terminates, in this case, the results
+ *    are printed in the END probe.  The format string is optional,
+ *    but is used to produce a table lay-out.
+ */
+
+/*
+ *  Set the base value of the timer.  This is used as an offset in the
+ *  read:return probe to calculate the time spent.
+ */
+syscall::read:entry
+{
+  self->ts_base = timestamp;
+}
+
+/*
+ *  The predicate ensures that the base timing has been set.
+ */
+syscall::read:return
+/self->ts_base != 0/
+{
+/*
+ *  Clause-local variable time_read is used to store the time passed
+ *  since the read:entry probe fired.  This time is converted from
+ *  nanoseconds to microseconds.
+ *
+ */
+  this->time_read = (timestamp - self->ts_base)/1000;
+  @totals[execname,pid] = sum(this->time_read);
+
+/*
+ *  Free the storage for ts_base.
+ */
+  self->ts_base = 0;
+}
+
+/*
+ *  Print the results.
+ */
+END
+{
+  printa("%15s (pid=%-7d) spent a total of %5@d microseconds in read()\n",
+         @totals);
+}
diff --git a/examples/getting-started/readtrace1.d b/examples/getting-started/readtrace1.d
new file mode 100755
index 000000000..984dd3cc6
--- /dev/null
+++ b/examples/getting-started/readtrace1.d
@@ -0,0 +1,71 @@
+/*
+ *  NAME
+ *    readtrace.d - show the time spent in the read() system call
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s readtrace.d
+ *
+ *  DESCRIPTION
+ *    For each combination of a process and its id, show the total
+ *    time in microseconds that is spent in the read() system call(s)
+ *    executed by the df command.
+ *
+ *  NOTES
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - An aggregation is used to accumulate the timings.  An alternative
+ *    is to print the results in the read:return probe and if required,
+ *    process the output when the script has completed.
+ *
+ *    - Although the results of an aggregation are automatically
+ *    printed when the tracing terminates, in this case, the results
+ *    are printed in the END probe.  The format string is optional,
+ *    but is used to produce a table lay-out.
+ */
+
+/*
+ *  Set the base value of the timer.  This is used as an offset in the
+ *  read:return probe to calculate the time spent.
+ *
+ *  A predicate is used to select the df command.  All other commands
+ *  skip the clause and do not set ts_base.
+ */
+syscall::read:entry
+/ execname == "df" /
+{
+  self->ts_base = timestamp;
+}
+
+/*
+ *  The predicate ensures that the base timing has been set.  Since this
+ *  is only done for the df command, no information is collected for the
+ *  other processes.
+ */
+syscall::read:return
+/self->ts_base != 0/
+{
+/*
+ *  Clause-local variable time_read is used to store the time passed
+ *  since the read:entry probe fired.  This time is converted from
+ *  nanoseconds to microseconds.
+ */
+  this->time_read = (timestamp - self->ts_base)/1000;
+  @totals[execname,pid] = sum(this->time_read);
+
+/*
+ *  Free the storage for ts_base.
+ */
+  self->ts_base = 0;
+}
+
+/*
+ *  Print the results.  The format is tailored to the df command.
+ */
+END
+{
+  printa("%-3s (pid=%-7d) spent a total of %5@d microseconds in read()\n",
+         @totals);
+}
diff --git a/examples/getting-started/rwdiskact.d b/examples/getting-started/rwdiskact.d
new file mode 100755
index 000000000..a60a52430
--- /dev/null
+++ b/examples/getting-started/rwdiskact.d
@@ -0,0 +1,110 @@
+/*
+ *  NAME
+ *    rwdiskact.d - for block devices show the read() and write() performance
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s rwdiskact.d
+ *
+ *  DESCRIPTION
+ *    The io provider is used to display the throughput of the read()
+ *    and write calls() for the block devices on the system.  The
+ *    tracing automatically stops after 10 seconds.
+ *
+ *  NOTES
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *   - The bufinfo_t structure is the abstraction that describes an I/O
+ *   request.  The buffer that corresponds to an I/O request is pointed
+ *   to by args[0] in the start, done, wait-start, and wait-done probes
+ *   available through the io provider.
+ *
+ *   - Detailed information about this data structure can be found in
+ *   the DTrace User Guide.  For more details, you can also check
+ *   /usr/lib64/dtrace/<version>/io.d, where <version> denotes the
+ *   DTrace version number(s) in /usr/lib64/dtrace.
+ *
+ *    - Although the results of an aggregation are automatically
+ *    printed when the tracing terminates, in this case, we want to
+ *    control the format of the output.  This is why the results are
+ *    printed using printa() in the END probe
+ */
+
+/*
+ *  To avoid that the carefully crafted output is mixed with the
+ *  default output by the dtrace command, enable quiet mode.
+ */
+#pragma D option quiet
+
+/*
+ *  Fires every 10 seconds.  Since exit() is called, the tracing terminates
+ *  the first time this probe fires and the clause is executed.
+ */
+profile:::tick-10sec
+{
+  exit(0);
+}
+
+/*
+ *  The pointer to bufinfo_t is in args[0].  Here it is used to get
+ *  b_flags (the flags), b_edev (the extended device) and b_blkno (the
+ *  expanded block number on the device).  These three fields are used
+ *  in the key for associative array io_start.
+ */
+io:::start
+{
+  io_type = args[0]->b_flags & B_READ ? "READ" : "WRITE";
+  io_start[args[0]->b_edev, args[0]->b_blkno, io_type] = timestamp;
+}
+
+io:::done
+{
+/*
+ *  We would like to show the throughput to a device in KB/sec, but
+ *  the values that are measured are in bytes and nanoseconds.
+ *  You want to calculate the following:
+ *
+ *  bytes / 1024
+ *  ------------------------
+ *  nanoseconds / 1000000000
+ *
+ *  As DTrace uses integer arithmetic and the denominator is usually
+ *  between 0 and 1 for most I/O, the calculation as shown will lose
+ *  precision.  So, restate the fraction as:
+ *
+ *  bytes         1000000000      bytes * 976562
+ *  ----------- * ------------- = --------------
+ *  nanoseconds   1024            nanoseconds
+ *
+ *  This is easy to calculate using integer arithmetic.
+ */
+  io_type = args[0]->b_flags & B_READ ? "READ" : "WRITE";
+  this->elapsed = timestamp -
+                  io_start[args[0]->b_edev,args[0]->b_blkno,io_type];
+
+/*
+ *  The pointer to structure devinfo_t is in args[1].  Use this to get the
+ *  name (+ instance/minor) and the pathname of the device.
+ *
+ *  Use the formula above to compute the throughput.  The number of bytes
+ *  transferred is in bufinfo_t->b_bcount
+ */
+  @io_throughput[strjoin("device name = ",args[1]->dev_statname),
+                 strjoin("path = ",args[1]->dev_pathname),
+                io_type] =
+                   quantize((args[0]->b_bcount * 976562) / this->elapsed);
+
+/*
+ *  Free the storage for the entry in the associative array.
+ */
+  io_start[args[0]->b_edev, args[0]->b_blkno,io_type] = 0;}
+
+/*
+ *  Use a format string to print the aggregation.
+ */
+END
+{
+  printa(" %s (%s) %s \n%@d\n", @io_throughput);
+}
diff --git a/examples/getting-started/syscalls.d b/examples/getting-started/syscalls.d
new file mode 100755
index 000000000..d01134fb4
--- /dev/null
+++ b/examples/getting-started/syscalls.d
@@ -0,0 +1,44 @@
+/*
+ *  NAME
+ *    syscalls.d - show the read() system calls executed
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s syscalls.d
+ *
+ *  DESCRIPTION
+ *    Show the read() system calls that are executed while the script
+ *    is running.  Since this potentially produces a lot of output,
+ *    an aggregation called totals is used to count the calls.  The
+ *    key has two fields: the name of the process and the file
+ *    descriptor used in the read operation.
+ *
+ *  NOTES
+ *    - This script traces the running processes and the probe fires
+ *    if there are calls to read().  If there are no such calls, no
+ *    output is produced.
+ *
+ *    If that is the case, you can always execute a command that
+ *    executes calls to read().  One such command is "date".  It causes
+ *    the probe to fire, but any other command that issues calls to
+ *    read() will do.
+ *
+ *    - Execute this script in the background, and type in the command,
+ *    or run it in the foreground and type in the command in a separate
+ *    terminal window on the same system.
+ *
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - The results of the aggregation are automatically printed when
+ *    the tracing terminates.
+ */
+
+/*
+ *  The file descriptor used in the read() call is stored in arg0.
+ */
+syscall::read:entry
+{
+  @totals[execname,arg0] = count();
+}
diff --git a/examples/getting-started/syscalls1.d b/examples/getting-started/syscalls1.d
new file mode 100755
index 000000000..3d405ed8c
--- /dev/null
+++ b/examples/getting-started/syscalls1.d
@@ -0,0 +1,53 @@
+/*
+ *  NAME
+ *    syscalls1.d - show the read() system calls executed
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s syscalls1.d
+ *
+ *  DESCRIPTION
+ *    Show the read() system calls that are executed while the script
+ *    is running.  Since this potentially produces a lot of output,
+ *    an aggregation called totals is used to count the calls.  The
+ *    key has four fields: the process id, the user id, the name of
+ *    the process and the file descriptor used in the read operation.
+ *
+ *  NOTES
+ *    - This script traces the running processes and the probe fires
+ *    if there are calls to read().  If there are no such calls, no
+ *    output is produced.
+ *
+ *    If that is the case, you can always execute a command that
+ *    executes calls to read().  One such command is "date".  It causes
+ *    the probe to fire, but any other command that issues calls to
+ *    read() will do.
+ *
+ *    - Execute this script in the background, and type in the command,
+ *    or run it in the foreground and type in the command in a separate
+ *    terminal window on the same system.
+ *
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - Although the results of an aggregation are automatically
+ *    printed when the tracing terminates, in this case, we want to
+ *    control the format of the output.  This is why the results are
+ *    printed in the END probe
+ */
+
+syscall::read:entry
+{
+  @totals[pid,uid,execname,arg0] = count();
+}
+
+/*
+ *  The printf() statement prints a header.  The format string in the
+ *  printa() call is optional.  Here it is used to produce a table lay-out.
+ */
+END
+{
+  printf("%8s %6s %20s %3s %5s\n","PID","UID","EXECNAME","FD","COUNT");
+  printa("%8d %6d %20s %3d %5@d\n",@totals);
+}
diff --git a/examples/getting-started/tick.d b/examples/getting-started/tick.d
new file mode 100755
index 000000000..b452009bc
--- /dev/null
+++ b/examples/getting-started/tick.d
@@ -0,0 +1,48 @@
+/*
+ *  NAME
+ *    tick.d - perform an action at regular intervals
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s tick.d
+ *
+ *  DESCRIPTION
+ *    Use the tick probe from the profile provider to execute a block of code
+ *    at regular intervals.  In this case, this is the update of a variable
+ *    called "i", but the clause can contain any valid D statements.  The
+ *    final value of "i" is printed in the END probe.
+ *
+ *  NOTES
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - Instead of printf(), trace() can be used and vice-versa.  The
+ *    difference is that trace() does not support a format string.
+ */
+
+/*
+ *  Initialize variable "i" to zero.  This is a global variable that
+ *  can be read and written by any probe.
+ */
+BEGIN
+{
+  i = 0;
+}
+
+/*
+ *  This probe fires every 10 milliseconds.  When it fires, it updates
+ *  variable "i" and prints the result.
+ */
+profile:::tick-100msec
+{
+  printf("i = %d\n",++i);
+}
+
+/*
+ *  Print the final result.
+ */
+END
+{
+  trace(i);
+}
diff --git a/examples/getting-started/tick1.d b/examples/getting-started/tick1.d
new file mode 100644
index 000000000..b2bdf59f5
--- /dev/null
+++ b/examples/getting-started/tick1.d
@@ -0,0 +1,49 @@
+/*
+ *  NAME
+ *    tick1.d - perform an action at regular intervals
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s tick1.d
+ *
+ *  DESCRIPTION
+ *    Use the tick probe from the profile provider to execute a block of code
+ *    at regular intervals.  In this case, this is the update of a variable
+ *    called "i", but the clause can contain any valid D statements.  The
+ *    final value of "i" is printed in the END probe.  The printf() function
+ *    is used to format the output.
+ *
+ *  NOTES
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - Instead of printf(), trace() can be used and vice-versa.  The
+ *    difference is that trace() does not support a format string.
+ */
+
+/*
+ *  Initialize variable "i" to zero.  This is a global variable that
+ *  can be read and written by any probe.
+ */
+BEGIN
+{
+  i = 0;
+}
+
+/*
+ *  This probe fires every 10 milliseconds.  When it fires, it updates
+ *  variable "i" and prints the result.
+ */
+profile:::tick-100msec
+{
+  printf("i = %d\n",++i);
+}
+
+/*
+ *  Print the final result.  Use printf() to format the output.
+ */
+END
+{
+  printf("\nFinal value of i = %d\n",i);
+}
diff --git a/examples/getting-started/wrun.d b/examples/getting-started/wrun.d
new file mode 100755
index 000000000..370c6a87b
--- /dev/null
+++ b/examples/getting-started/wrun.d
@@ -0,0 +1,48 @@
+/*
+ *  NAME
+ *    wrun.d - display arguments to write() for the w command
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s wrun.d
+ *
+ *  DESCRIPTION
+ *    Trace the calls to write(), but only when executed by the w
+ *    command.  For such calls, print the file descriptor, the
+ *    output string, and the number of bytes printed.
+ *
+ *  NOTES
+ *    - Execute this script in the background, and type in "w", or
+ *    run it in the foreground and type in "w" in a separate window.
+ *
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - DTrace has a default limit of 256 bytes for strings.  In this
+ *    example, the output string may be longer than this.  If so,
+ *    either use the "-x strsize=<new-length>" command line option,
+ *    or a "#pragma D option strsize=<new-length>" pragma in the
+ *    script to increase the size.  The latter is shown below.
+ */
+
+#pragma D option strsize=512
+
+/*
+ *  Use a predicate to only execute the clause in case the date
+ *  command causes the probe to fire.
+ */
+syscall::write:entry
+/execname == "w"/
+{
+/*
+ *  Use copyinstr() to copy the string from the user address into a
+ *  DTrace buffer.  This function returns a pointer to the buffer.
+ *  The string it points to, is null terminated.
+ *  The third argument in the call to write() is the number of bytes
+ *  to be printed.  This is used as the second argument in copyinstr()
+ *  so that only this many bytes are copied.
+ */
+  printf("%s(fd=%d\noutput=\n%s\nbytes=%d)\n",probefunc, arg0,
+                                              copyinstr(arg1), arg2);
+}
-- 
2.47.3

