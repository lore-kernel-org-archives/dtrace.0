Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9988D292B2B
	for <dtrace@lists.linux.dev>; Wed,  6 Aug 2025 16:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754496306; cv=fail; b=QGRjkXm/kSLvIqFly/TnJUZEQ9CeA1H/wNSV7RICiEWQ6N5LjvCeo66T9DUdHWJ3D76KPcwPx9FfIE6Wtu6Qkk0QvKalJk0aELsLkqOqYfmPhtO65A2IccyDmgWz0Z68vFalQ6i/1jji6vJxwyjvN7ZN9xIIJL2fxbndIsT1L9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754496306; c=relaxed/simple;
	bh=FNv7OvPCZVVkn6C+uXWOLQJ9ob595zuAWhw7ytCpySY=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=P4F8E2L9OlGh/OyUDewRGyOgBUyyOgImprMaa/IF1wm4Pvq290h1LfRm2XUdeYaF8OKWz9rwOqMhLEnAXMZ91wKNufOj070qA/L3ZXEltJWat+LORC3zHKfGlpizdd6wK/yBkDF2MczZj/tjiLluoC0OC4jUGpIszuPj19nMouw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UqLzSSUt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fDuY+B1g; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UqLzSSUt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fDuY+B1g"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576CRd6R002720
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 16:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=IELr/qLB0zmhKqoL43M5Nks9Fbn9Xbb80fZ2e/5tAQ4=; b=
	UqLzSSUtmUjTRH3ejgVKkx7DVoryvr9ZwMcWk6sRM+G9qbV4fNFgDSkFM5p3ESFD
	rhf3MTZYaViyAv+kFvTcY9lpHYGOcN3S2d651pIxtsJu3fykvcPiP2Bn4+8AXV7t
	SmPQeHaBv9F+/4Y8dbSyLklSe91xkTmWOKs7BocCIjJ1hwqkIIasgzhiHF8OUXGs
	FnnZi1+zaLADOATmipwAHZbdNge/l5rUJQ9EWmtxcNDcsY0SrhSC0h/Po8nNSLFh
	vVYdq2bP8uMU5eV5cEIV/0BkcDclPobS+/E1Vt5wqH+yjG9p93ZvEXVeR45ZAkZD
	XRxT5ARjfBCgTtOf9SpvsA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpve2402-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 16:05:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 576F8tfO032290
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 16:05:02 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwqr5n8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 16:05:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VF0tiXvYV1H36wpKIxt7oPpeRSoVXaPBsKHvI/lTakv0OjCLHdZ3euDOGGngGvSuI1ik15EA++P80gFncUCuvz0rIu+x6FaD8AuVR0+NTB/+A0iUn8FMqMYcFP9PC/A/doZqj4snYJQLhC7SwE3MAfMf2w1ubIItYVwWxA42vfEm8aksbbOLjlhXShX+sXh2uQFD0O4Uz06P6RFNJ1GnLEtXWs0B1zvChVfZWh5FJINFR+EC3j1ASfZJeZFI0q57cwmtn6sfJtwP6HR5w5+JYmcAVaCo1bboLJlkgSSPQqC2lVU9qOUAdENHcbNQgQ+kQ3CWgYfxK0bgjMAHXxRujg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IELr/qLB0zmhKqoL43M5Nks9Fbn9Xbb80fZ2e/5tAQ4=;
 b=I8kc49CFGBNfEuwsU4BS84g7DB6BB/vGsFCtUxDh7fMUkgMm0R4CgyYXyqaitqU7OTLhtsM1+bgh4A8d6/ImNIkub+ABO/IYvujGjfcu+g05HSxvDIWdpIRHEuAOtOlRzDO+iNl+pcmmqUifG3fsfEBrmM01FRkuTLt55v9+EMrQPePC8gp+787UtTP0uFCzTF5jjKzJYFtnlbrBSKLJnoeIrBL1ZRt/jTW5mAauFitD7NtluRR0HYXohO1TxahgwUzsinaYyfADqAFZ5fuhwVOulh1so70MyKitA7EuYLTfajEmxIa5PYXHgCp5c57PE0Nrl/8aDsVMy6id1GhtVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IELr/qLB0zmhKqoL43M5Nks9Fbn9Xbb80fZ2e/5tAQ4=;
 b=fDuY+B1g/MLUDWD05L3IsEPKbsBFmu1udhG9Zs/go7SGkLtE454mmQ5OZgzqMYVJxzxxWdpy3MiNmUV8nqie/vof7KaJSEPjcfj3mFp4gbJ/ETGntol5NM8PzVn77CNd7yDmp3bBCBTEggQsAs8NnJaQt6OIxljJ/He5AatAHz4=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SJ0PR10MB5670.namprd10.prod.outlook.com (2603:10b6:a03:3ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Wed, 6 Aug
 2025 16:04:58 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 16:04:58 +0000
Date: Wed, 06 Aug 2025 12:04:56 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: add -l and -lv tests for stapsdt probes
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:36e::7) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB56723A5B7174C2DF77C01DC2C22DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SJ0PR10MB5670:EE_
X-MS-Office365-Filtering-Correlation-Id: ad392306-0360-46df-843e-08ddd502fd98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?epSTCeE+JaI4awFSFYIqe7sgjUrbzPcnyYk4w0/UlBaODZWjhtcz1S+FfdBY?=
 =?us-ascii?Q?QsjBCilzQF5ZYyZL5Wyo6FUhaOB4ubtaU5gfTVBGn0Ap59oiPxUR3Gzg7NOT?=
 =?us-ascii?Q?iBELuG447IWiV3QdZYhDtSA+EU6ARa4TvhsTT/le9mCCyd8BpGChVvmVGxJh?=
 =?us-ascii?Q?dj31u5fq8BJkUVuZtxMhXI43FAUJPnvJXXuibXL3lyhG2rjzdQDRaieCJby1?=
 =?us-ascii?Q?HHU9XuO2lVwgD1Cq7N3x2jDDM6Ox3eRlIUSLYFu2H7Rnp7MWuS1WF8gEqUs4?=
 =?us-ascii?Q?b+SIzIITvPjTE+jji9kcpc1TTlvFpXXrOSkfS6wQFI7KkaNrzC8PrdZgH2Ks?=
 =?us-ascii?Q?jW+YRWQVX9Zw2kj938qpSIlRZv9wQZUW5WdWcu4wJleBKzVYA6QT118ByssJ?=
 =?us-ascii?Q?kPpKSXdAP2Mqsfc3VLvIzSJeHo2wztfirB0g7D6+ftYh6a4LGhUa1sNXMfm8?=
 =?us-ascii?Q?r34kF7v4+iEvzl7T0K1wEz+il8itTdPPcdhp4PFoJUxVKE9Ut12122QG+M91?=
 =?us-ascii?Q?r32jBLj83yz1Egu663A7LB0t3r/z/yPv57b+5KEt9zGUw2QzA/9ZWYdm0lF3?=
 =?us-ascii?Q?2CFv8PR+05kRMrhR9mqqeZaJV6bVcnw5Ve7uGbbDfeY/vYymNmRKed0ZT1HM?=
 =?us-ascii?Q?gn5ayS7rU0Jy7ZBq2uUNxLmVgXFcnwz6WPGErUKBZ62mrFFAOAPnePGxSIAl?=
 =?us-ascii?Q?FTw5ip5WrN5Yv6E9OF358Mm314Qln/rDAPN/4ZMemqBqfJ8LIe/7ZTJX+d2s?=
 =?us-ascii?Q?XmAd+eDlYrI6aCAzFrcjpQvYEUsXbW5G9Ht/tO00yudmhOn9Fj7Y3qKV4XsZ?=
 =?us-ascii?Q?UL7lt6h/n7dHegHguTkIoJekKZkxpcqpIxxSoHB2sHmHXlBf4nwqWi2+06Jn?=
 =?us-ascii?Q?0Ce7JysHvOgM3jLh/uM3VQ3mNSszZmZU7B/7PCf6D7BI1f0ehfxH7R5nChka?=
 =?us-ascii?Q?LXmw+VYHZ6iZ3z8sjov8QkFDAW57GfSGwfbRQxTHZZJxxX305tF9d4cBJNEq?=
 =?us-ascii?Q?WUCO87/fpXi8wkQTd16uZGqRtDktcQnWR3bj2HkgRQDSJefVsZROY26MCrKf?=
 =?us-ascii?Q?z6qfxlWr95yoM2Qo5bz7KEN6e/qRRbE1diBq5rNXF36/Y+yZVeyyd+qH2YtG?=
 =?us-ascii?Q?0Wfa5x8+zDZ1C/5qtcqDLiGKIDxFce1g40sY+v2ICEn9gvaoPvcUqrZhJE9W?=
 =?us-ascii?Q?/ZoR7str1wb3xfKK3fBhNjSu3N3VPue0RMeOkJ0/s8LYGsC31rbvM/8GKda1?=
 =?us-ascii?Q?yxBDIs1s0fu8UUNDoBmXyPhhwidLy5AbodVgjGR6LnL+ftZFX4EZ0b7E39h0?=
 =?us-ascii?Q?dQGfJ2fVcxuTgALMavMab/SKQtvEu3Tv6veSxEM3EMTZmyNJfhACIXfuueIp?=
 =?us-ascii?Q?xo0bhXQp7UAymWh5eotk+XbxHQfXZvASVRZwSzsKrW+xzcc0JIJEKR44Oi7g?=
 =?us-ascii?Q?405jgBi9QW4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lOzY8lqkIm0bS1nAGc5kHARDDlR+LxVmS3nnhi3y0C/Jq2i8c5DGXVW1LLVu?=
 =?us-ascii?Q?DGSpnwt1GR0p2HPEHBCS+IYadTu9iCHSZh7G37mcJ2xJsVbwsylYh1U+RLlp?=
 =?us-ascii?Q?sHliiImhrpEeae6Sa7u0R7g7rBTKwfyvO1plh0FX5ltq6PKXH8dTDV1wlq3l?=
 =?us-ascii?Q?nlm/I0kLkZl8T+G4nfNn4EBoAbrnjpYqejkUF+0a8vsrzG1CvVJToLbNio5s?=
 =?us-ascii?Q?jIy8kbHWjRR+aRVDb2RbBJmstVp8zKQ0jrNCoWnR5AkZYIO1eQSN1u5H4OzZ?=
 =?us-ascii?Q?5cjDHnhYP0S3khfdOK/jwAyjJcYR3r2571QjfdlcWHhYkA54OxWR6ZPOWA9n?=
 =?us-ascii?Q?8zkplNMf4Fgk4YvYNvfrbatliCoqZy4WIqAj39I//hCjp1sanrzBRSGZMLKb?=
 =?us-ascii?Q?oyrgKKTF8M0gDi4KrDS0qNl8O31rOHoOJRVmA36p9GINbPqc+8IcgmyZ7Hgo?=
 =?us-ascii?Q?iEW2UQRc0vUTF44eY9YAqIs7sE85y9EMLlsH/NqQ4UwWP7Or7j1GNiireqTx?=
 =?us-ascii?Q?VF95oR5Taovfj6zhKXAbeSLteeZknI9TfnygJKkCAslta+fLBcDXVgujxd9X?=
 =?us-ascii?Q?P3CyPTQMeDvGXcUP2zQXmIxcekQ0/6W9Dna446hDqp8kCpTzq1ghZtTKP/Xq?=
 =?us-ascii?Q?mZU0ZxnM362XQ43B7QPZgkqFZlhFPMV0dFva6/Iqav1ZJFZPsVP+jqFxFLX6?=
 =?us-ascii?Q?aJVSF3d/bhSfNL1duYvr5de0SZwBAfK83I0hGNxKRd42Pld5ekW6QBUWmE/D?=
 =?us-ascii?Q?OGcqQcrQq5LiKPQCGYHVMm/F0gyD3y6QBKh57pe5aDP9NSbEQ+sXxM/E4mAN?=
 =?us-ascii?Q?5RVkn93V1wXos+6q2XwSLcrlkcoAtHx+XYFsKZXkm2HU5/uh64l3lKysaKjn?=
 =?us-ascii?Q?mVJf8JX0bgZt3o6nOok1YCC1xu2cV2Pa0g3sS5EH6VzR3/9s8VXBBk8d8AAF?=
 =?us-ascii?Q?+PQXC7QqbaUDJEnvqploBwmWgLivk3TqCT5DNR6RMw5LUuag91k8VFTgDa74?=
 =?us-ascii?Q?iVut1vEKhicfdpMqJFpEXrJYRC+Mic+09SPoZN+EKZUZgo85nbThF32bpQF5?=
 =?us-ascii?Q?JPyTPzIrtxAmrQ1wBqmcpm9CUH8SI8+S0MenrtfSDpi9Lbt18pTMIFfX84MP?=
 =?us-ascii?Q?b4WZthiHGcp7QXjKv/ds9DByQCweQh46SW7YeoIHg7gKgy2qgST26p+CKbds?=
 =?us-ascii?Q?dU/CZxJlCblCgRaFJ3XFFkOB5CcN4KIMBb93Ih7nsifV58ajZ2r3gKFVWWjK?=
 =?us-ascii?Q?lCBH6OXxDWM0f+Hx1tKJGftbRdcll4omTA3gpMYsikvlTXjZvoSN+OGuxwLV?=
 =?us-ascii?Q?sTzSvrVr5euITtm0tN6k0og4MC1hWaYCwKbg2qHS/RcYEXMmiQxtxtDOswgK?=
 =?us-ascii?Q?lJXSBtSvv43n26dym6fV+KnR3P89tWt8mf8ESavDgPowkg3mkthhk96eVys1?=
 =?us-ascii?Q?JfzNn2zhH4xjJAiYjS+WSPTnNT816bPB2AW6IH0WqER7WAFDWH5Z7OHDabIM?=
 =?us-ascii?Q?plcrA8rnHQIS9Gghsd4pYNh70GqcLrbaF2LJ3+ilX4wNbRA7HpGrpoHkaObg?=
 =?us-ascii?Q?HQLtovIYKIXEW29pZrhQUxrzS4eTkRGQhNt8V7IVTMqKAxRBc/97FJL8mgi5?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Xw5N9X39ODIiu6R+se9Wcs2BIhjZLXU4HI6CstvT4cQ/3GxaB77A2GvggDobTfD7n6FndpnL80qnr5UewdfY62eZi9tWBkY7HgnSi6vnwtkWS8QxUj1iCNcCF1DhgaXrqCnGdK4uFL75OgS6fkM8NjemaLfAIJadb4Elu1o6DA+YENT2l5R5J9YoeCFx2JMvH68kRnE5a+lfrQdsjv+huv5P0gYEgAoFgLVVXfMsCGgrjczsqIl3hwXDJIe7E1M0bF7oqdTlPhAXEM8JSbqH/ydmunNvkkq8mz6zLjsMLWG3ixYPworqs52uf+y+HBJn90FUhGU5LCtt0tWtGGnVweCTgWDERoDv739usaglq9J6AP+9zcPw31WWPlTXZeeqYDyXjjGtT/fdO8Kc65E5McCvBVdCmn8v+C/ERlBsmm83LqHiea898T22dw4wnfj7kDhkilNAiVZSWLGpKMv+mt2r1xAi9r8NawQfgEiZ6RHpjDuDVluK7cBJggLPj7fVGXhelaxh9ie0s/Of1kWNBftvQ3MKsfFgd447BM6hdHm4zwNdBtgFwp2StcSDOVn7OinXAgUFlBGBUb++8IB8qWAKkNvNZS0BrC6f3JZUSgc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad392306-0360-46df-843e-08ddd502fd98
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 16:04:58.0960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JH0i1MkpBOc2XxY54uH9aGRvDH0dxBgv1NDVAygox6cBjs2kLePCIHL5NTyUSWMIQ6Vi/voJVovBwKB+Objal+tXvuGNK0NGtGK8DJapj78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5670
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 phishscore=0 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508060101
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDEwMSBTYWx0ZWRfX3iwG8B2FC+T/
 lcv+wgtXHd8GlAbr+h7EMbwYHM+Nz9OkZVk1R15k+iD+Sbb6SQB6oChjI99+9DVjwrI0wBEFt+z
 Ol3GQaQP234Z6kaGdxgWjo2bViw4KVriEZ5pKcIWPxFPyugFGq77ArBIqnaRJUU1TKlmZqYa8tz
 V2iasbxLBtKs/otZvzD6D5mZrAP2EQtGcygzQZ67GfnzySxKUN0y8l59TwCCc6OoeDvQOqWOAly
 My1mA3YdVu1UC0RxjN9RvYlXRpUNrW6Qc4A+uGAK1DEkZ4HDHeUfugBUdrQzMoK9NG2hSOBZ3o1
 yPLsKyEwluYhRuYWHpHsm715NtT35m5SJ37MStzohTlFSFHuuUSpTFo+ovEsAr8RWQHRFix5kc6
 6RIwJ6fU/mlS/YRGHeKk9VXZKqTkEDHuld0R3oQC9GCEv1IPGwWVqp+lz2GL/dmjBpxSXs/0
X-Authority-Analysis: v=2.4 cv=ApPu3P9P c=1 sm=1 tr=0 ts=68937d2f b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=LI9ZReWfE3bMri0OhO0A:9 cc=ntf
 awl=host:13600
X-Proofpoint-ORIG-GUID: fUue9nizzIxtZZTulmMuC-uTArCbznNK
X-Proofpoint-GUID: fUue9nizzIxtZZTulmMuC-uTArCbznNK

The stapsdt support in DTrace provides limited support for argument data
for probes.  The number of arguments passed to a probe and their native
type (signed or unsigned int of size 1, 2, 4, or 8 bytes) is discoverable.

Signed-off-by: Kris Van Hees
<kris.van.hees@oracle.com>
---
 test/unittest/usdt/tst.stapsdt-notes-l.sh  | 46 ++++++++++++++++++++++
 test/unittest/usdt/tst.stapsdt-notes-lv.sh | 46 ++++++++++++++++++++++
 2 files changed, 92 insertions(+)
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-l.sh
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-lv.sh

diff --git a/test/unittest/usdt/tst.stapsdt-notes-l.sh b/test/unittest/usdt/tst.stapsdt-notes-l.sh
new file mode 100755
index 000000000..663ba07b1
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-l.sh
@@ -0,0 +1,46 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+# This test covers stapsdt probes fired by the STAP_PROBEn macros,
+# testing listing probes.
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+CC=/usr/bin/gcc
+CFLAGS="-I${PWD}/test/unittest/usdt"
+
+DIRNAME="$tmpdir/usdt-notes.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+cat > test.c <<EOF
+#include <sdt_notes.h>
+
+int
+main(int argc, char **argv)
+{
+	STAP_PROBE(test_prov, zero);
+	STAP_PROBE1(test_prov, one, argc);
+	STAP_PROBE2(test_prov, two, 2, 3);
+	STAP_PROBE4(test_prov, args, argc, argv[0], argv[1] + 4, 18);
+}
+EOF
+
+${CC} ${CFLAGS} -o test test.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test.c" >& 2
+	exit 1
+fi
+
+$dtrace -c './test arg1val' -lP test_prov\$target
+status=$?
+
+exit $status
diff --git a/test/unittest/usdt/tst.stapsdt-notes-lv.sh b/test/unittest/usdt/tst.stapsdt-notes-lv.sh
new file mode 100755
index 000000000..f7b2d8691
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-lv.sh
@@ -0,0 +1,46 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+# This test covers stapsdt probes fired by the STAP_PROBEn macros,
+# testing listing probes.
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+CC=/usr/bin/gcc
+CFLAGS="-I${PWD}/test/unittest/usdt"
+
+DIRNAME="$tmpdir/usdt-notes.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+cat > test.c <<EOF
+#include <sdt_notes.h>
+
+int
+main(int argc, char **argv)
+{
+	STAP_PROBE(test_prov, zero);
+	STAP_PROBE1(test_prov, one, argc);
+	STAP_PROBE2(test_prov, two, argc, argv[0][0]);
+	STAP_PROBE4(test_prov, args, argc, argv[0], argv[1] + 4, 18);
+}
+EOF
+
+${CC} ${CFLAGS} -o test test.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test.c" >& 2
+	exit 1
+fi
+
+$dtrace -c './test arg1val' -lvP test_prov\$target
+status=$?
+
+exit $status
-- 
2.45.2

