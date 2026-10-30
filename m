Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793389093;
	b=LX/tNK3xeodx+5CUikPKrzqlqgc1OcifBS4073xavXV7+R5TPr8rvV2PLXYiWLZE6mx0
	 kJW4OmhFyOqSInU13Un9NuxwIVs6g1NJXyVtkfepdcdsU1WaT9NTCz96ZOo1DxelfueAk
	 iXXi2ZM4LGGqL5bFE5uUnrXkgle9fGbltJWuJ0WwCJV4B8ekiE36+Aujz9gm6PFSl0bsf
	 SSfJMljEaidkVMxJKxvVIj2Ml3o8BO4yjcDSzQajL5r3uwBjHKubD4DTE1olYiuhzA/29
	 oKJKP3mSbLy00KB+i1YHcGyMos2ybZcJgnf6cgcgIF1quettlPgTKRqd3rqBKqEoMzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389093;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Subject:
	 Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-TrafficTypeDiagnostic:X-MS-PublicTrafficType:client-request-id:
	 request-id:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID;
	bh=CSBHUT+Y5Y0OhsXCMPZsVkejeSgcjO02a3cWrTgRv7E=;
	b=uT9+sm47ncQ41tJQ5GeDTAshmasp0Pdb//WwWMHejEiRtnpNOebncVbArIxl0aveN11/
	 v/ch3WcJPmIX02RGbUusDbWoKIM2tldEOfA96Z9nrmlrucxX502ofK9pFRh4bw2WNch5y
	 Vqm2s8b0PDvQVQ/NklnArGQZkCd5wude7VnC1V92APgJ9JnTLzAS/8QmGn88lgzG9VkmR
	 0RbNiyxBE1xb4uW7AoCa5LQyrGLpoCPhd1OY5+vKL9rCVj7b+tGiI6HfTgY65Q1p9MjVZ
	 sUoiRNHKdXMbN7vdd2a3BIP+ouVoM7xQarWgxZFMtSV2SetYCzqpGKqOw1y2IUFwYeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=C7FZcNHo;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=mdU2aHrG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A60D606A31A
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A60D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=C7FZcNHo;
	dkim=pass (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=mdU2aHrG
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UEYMrv3605861
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=CSBHUT+Y5Y0OhsXCMPZsVkejeSgcjO02a3cWrTgRv7E=; b=
	C7FZcNHoFsPKeiuJP6iHeRmRMLqQ88F2NipVGf/qU7sWmJnmPX1dcjIEv/4I/6F+
	vdhPj7SD/jz86PI1laG1hslXSKKvBtb+WGI2l8nkeCDLsIzERVtMh08Wf1xpJVQo
	zLj4gnYe/I9q834Wh5PcGc3fNE+kUCrpAdqq2IVEexjZ9lNSqhwAOU7H4EhgrnvO
	iDAQ5D0ry7Do1TpcFMISodWam7L7sEuqkpDCbruflAEBL+jQKuTBdaS8By/qJR0W
	TzjMailY1LxiqoTNkUO3i/ZoND7pAXIuCJgIlJRtYAy0HAxm6GXev0yvO7gjje5t
	oa7dALtfftmY3v2oso7mPg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hme5s1cbv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 69UHvrln2444478
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:10 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011031.outbound.protection.outlook.com [52.101.62.31])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4hmxs4x3wx-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xoMVF2gbNrOgBJFqZOIhJnRioXE1Cn/XWT/6g4RybHkuCnaThOt3NWrHlUhbNsyInHu9fU4a12F+tvr8jZ7oly+Fw2YUqEDfYRnWKOfMPFikGI9cBQhNrwTeoW2hNjb9I3OX0ePyJ1CZggK3SUJLeod8cEsZWcNolMeY3zD+eidhI8hbOui4l27bhWyw/rvMk+5AgGQmb9w4iFWdGpmRY1SHjImHwwg5exLMg7j0nV9tHqMlJ/HyeCXvIT2/h9FpjJwK5yR7yc4pzWb0MKFBSeQ0JaT/OZ3qU/+57W/c+jhICoVxkGS0pAlo75BPLm4249xuYFhIt9Acc+bcPRJ+WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSBHUT+Y5Y0OhsXCMPZsVkejeSgcjO02a3cWrTgRv7E=;
 b=rVPovuXjfTjJAsW+GE3hE7AR+tTlWl/0uy0NxNrdmv3JTCWIxmITN9w0Ix+RLN50T6h3qJfG+y0wiYfRw+Bt0w+a9et7vCVLvjl8nExg2SmidmabV0ooZRelbBJgPua8mOt1ZJ9P4ez3zcKYiht2BfMZOy08sMII/gKYN4TTj1oPnE6w+zJb4bM47uYgORjKUBIgGcekYdyRekuH+h7iLQMaYWzmGgLaJHrbypPSEnd9XLz4/HGmMYzGfg1hd4xdtKEk2VgrHXtCzl2HrE9Szsl8Wg7hrkC4A6calXCOtjCVdAgBaNEEqImAUuHLvntQoEc9r1T/ikGQPd0Czr9kUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSBHUT+Y5Y0OhsXCMPZsVkejeSgcjO02a3cWrTgRv7E=;
 b=mdU2aHrGYO2m2jK/v0pNsjeVndsibTaHEs8PTVHtVmz2SVwH6Vy/BQ2eWt6zWGYV7ISNSD7M5Lz6J0tl67oRRxhJt2GJ4LMtubuez1XTJz9edXg2a/36djQL8aKCL/dJaZZDkIby0dTZdVi/6AaCiLELhKT3VIJ2q14Ny+THcNI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by PH0PR10MB997690.namprd10.prod.outlook.com with HTTP via P2P; Fri, 30 Oct
 2026 19:38:06 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 19:38:06 +0000
Date: Fri, 30 Oct 2026 19:36:31 +0000
Message-ID: <307cf8d7cbf63295d5448222112686f5@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 03/20] ctf: give shared kernel types a synthetic module owner
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0066.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::21) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|PH0PR10MB997690:EE_
X-MS-PublicTrafficType: Email
client-request-id: 8b4f6989-344e-4a31-8392-09faea6c26bd
request-id: e1614839-7b2a-4e16-cf3e-08df36bd51d6
X-MS-Office365-Filtering-Correlation-Id: e1614839-7b2a-4e16-cf3e-08df36bd51d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|56012099006|261009223027099003|261026130827099003|261026121527099003|261026140227099003|261028144727099003|261022075727099003|261021135927099003|261021130227099003|261021123027099003|261021121427099003|261022105027099003|261022113327099003|261022115727099003|10067099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	RbKkynnICa5xIdpcZBVmUd9Tm3f+4rzNsmA1oqXq8JJC7MZqegGYqt0ZjfkVkKxfQQsDG/tgRCSwaSsLjF0XLBPlXyyIpFSJv/twe7mndikATbOcp5unQgrK4Qbpm81xXpPRcMwvC4mxoWjHrp+7haiYzK7yRa8pkb30SM5fJNGuYCl/6EWa2WPlDiSBdrtMUGc6lqoVmXxHNvItoXYN3A0kpDgQWzzdAptJJJYfVamJtSbfQCsIgAlQ4xvLSnHY1uHwG1cqN6YDG4RhDNVV1L0VJHRQQHipULnyb6smQ4Zkv0cLcSSr9sFlsRGiWk5fEkfN5rR/k4kRhHzmSO1vLtSJ5zbpg/j4pKjYRntqJmT2ijd+H15GNQx/6mJDTYdAKN9kvtVo4zbg5Rn057j5MvjvJO6tCiOhBxGSQ7q6Fg0qkiazNR0KMvy6rFgFXrgn6pRl20aBW1/W0hGEdC9EGTphaXOnF9VLmNb0Tuc5s/EdsfsUADbdPbIUxv0Au1Skq2zizB6bDZOqLM1cZ4BPwA4cu0tLUtIZG6AUOTbNhVKt/wfs3q3DdbXhf/ItCDtE+i9gx6BM5iMi8wMBqA/x1MBkYGPYgA4sXu8f2a8GerLnE87SUCMrfocyl+Ri9B56SL87rub2TA/4DQXiUfGePzGDY0syJEwUdd0BQyaqXIk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(261009223027099003)(261026130827099003)(261026121527099003)(261026140227099003)(261028144727099003)(261022075727099003)(261021135927099003)(261021130227099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022113327099003)(261022115727099003)(10067099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B3gliJFD3MNXHhqHMxz+R/GWCR3Q53mLH0aCL94Oo3qJVzTieeQegyTggCpI?=
 =?us-ascii?Q?/pda17w8rmmaxscangUQrVVaOjrNaN0sFRaHppp9UoOIINIn+Cfl/wbE/HA7?=
 =?us-ascii?Q?eCTUK/oX2nwlZIaIKtaCYFLqYIcLfCZfWxgJq2v9p1Lh6+If4EBB8QevTNds?=
 =?us-ascii?Q?MZgAvA5XbpFPFwwgyJXDTeC0twIBNC+cpvj9suo/P0T1dl+LJg6taVbXyJwD?=
 =?us-ascii?Q?jT8zPttkGmvtJH84tpfBEhC7A1fngatlu1Dy5c7duauEuFydJFX+pXS9r0/w?=
 =?us-ascii?Q?joKl1Rhbv3rffZAPN//H/JBiGHZOVL+ynuhDZFnU1dhv7F9e1uyaicYaEBGM?=
 =?us-ascii?Q?ocGBS6JH18K8MWF2VY82fcwftO0QCmZ5CQNfyoUvJQDeW0sDc9A3dQaGg5Dm?=
 =?us-ascii?Q?25amtLLnETVeGA3te7aBVixTokx9AYQ043Es1evrQCurnZSnWBTS8le3T9pa?=
 =?us-ascii?Q?4vRIHJPSI6QOgrA9/rtS1L8SS39Fo+r+mI7EQbmnRyus0h6krmLmQkHz+Csh?=
 =?us-ascii?Q?5vB4Aby4RxVj96haILDchjw8TrX7IvPW2IxdiGR3b4SXM43/PDe94VhxSXgj?=
 =?us-ascii?Q?Rc4zHU8K5YA7MFdQ65omutqUMxmjjkqJjEw6c2jxgQvprUUt8cyM/U9iHhv8?=
 =?us-ascii?Q?gt9/eFGVpZ12a5JKMeW+/xJ+3nlVGH19mP3md7I/qCmTnGU/64eW5A1DhpSo?=
 =?us-ascii?Q?beQJCvJSUvRDyN3/5hkYU7UiPvM55EHb6L+M923jVVJ/uwMWnBrpb8KIemAY?=
 =?us-ascii?Q?pMCd3bB8HplQcydPKQrKb40Ma2XRAslzd0osALp1RFJhFKdxsISBg3aVN0TP?=
 =?us-ascii?Q?uL+c6dLLapFlv9VGKMCTnh+dsytTQtgZAT5nAsSV+LoZOn9jg5YzSmYKec/U?=
 =?us-ascii?Q?gIEciHh0XksO0SpznoOdYXv6t8XfW4AoO2AIdJ1/ncKpzGHyv8xHmSuwGcfm?=
 =?us-ascii?Q?729VcAr2enq7PxIZkJDyblfeaDQYe3/jW4i49nOS0E/JqMQA95AjpO/pHI1Z?=
 =?us-ascii?Q?S6MSPMketf7UAeBSw3db4V4K59/VSM/4zPf+ARKguxev5zfIj73xhLXuolhN?=
 =?us-ascii?Q?+JtOV90U9R3hZo4iZRP1J87ed/e107+hLNE506gvQnUjknX2nzbE1PcDg/xU?=
 =?us-ascii?Q?h07SCe3Qs+RhbnJDG/kRi0tl1gskDY6oYvaJiO6Ncy2dklQfegaUjPHEbJSq?=
 =?us-ascii?Q?ISFholWTNvUdWNB/Q39L+3uWBepHke09pi/AteuU2iNGEF2asbMqNkjubC2u?=
 =?us-ascii?Q?5srFV8nmdL5I5sfYSsfqevruhEJ5Yckb9HnHc8cUrsXkX8/4TZBxeji7D35o?=
 =?us-ascii?Q?9i9wLYSfNkAZtEwf8RkM45T+1BZEnXaJHSSQfQ4al+WKRO3Z/Av/5tm5WLQn?=
 =?us-ascii?Q?SHgbTubEgEjVu0P3OJj3DZmOhGkC3L4Im6RvrQtjEel3bHik3PBYfmwecRSo?=
 =?us-ascii?Q?6xOCLo3QctY5LMmw1ivYoz5MgG6jZyQe1R3D4Bgwbjsd8MX7llGwcyG3KVJX?=
 =?us-ascii?Q?eh3yIzmUUVrxx5EmNn1Kol+3D91eUZBu/l3xccnSElMJu27np+BmAjcYgLjZ?=
 =?us-ascii?Q?5BzbnSVPjAxnQLOJv7jAuXmz247Fwz8IKxArBjvhMJv52uhRUJmHLMqkVL6F?=
 =?us-ascii?Q?ftB4MeewpNEK5qsGisYMN9u6ztnLnMpa7iXMYqYAfjN/G/4TJeG7pFQfRVUI?=
 =?us-ascii?Q?Xs8kHN2d9gKhbMs8bSD8CDwtpUqKBOlkKTdvgjDqe5a/HWVzSBCOO4cEAedi?=
 =?us-ascii?Q?FEQQTjMJT/veqIAW0Q/DXBH8mWhEeSw=3D?=
X-Exchange-RoutingPolicyChecked:
	A9bmt+mGSj7cKPXT+fLNjshQLL2hZRv4vZWgteKPbplwVIryHyz8nXy40olb1JA8rA5WkRLKovzLXw1ucWU6Qv89E+ixWvNThO+tmI76KHwaWQaoJIb8jkYBNpxHrIBmytSmxzSD2TPSR1Gp010saGrExNFFRrMnSMIZpUTNpME9OtNNDJJTAN0mmZL70ykwphR/G+SPS8924pKwcxe4NVpwn/LZG5li+E2QFGKRmbr8s/aMcijrVx6LbIduToP+iT4O2iVP9gzuSw7rLlphz1Hv5Ym/janhN3JHKGqw6BeMicFQ/tKjymX1JssBgv46iIcvGvQzGWqZpNXbnrZXKQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MQNnHrBfZ03+1+V/Y8jIE8cZ4dquFPTAfT1JnYha7QKRlwZyFXV/NCVxila917t3DSgLiJZQsvKKsv0GPJDdBA9WvpmiUokB7EnQ0ndy1JoeOKZAFwE7Zj9PuCY3HEDD4fBqLF+nVtIGyAdyBlFaLAMvVbcmiY83giS0GtUnWHqKLX8DPzakMowygTaLXYwDA19i6C1ru2e7IDM/tNBLbM5UYqRAteCGnLNa4A+DIGKh/DL16Vdh4muWlwHoO40tppWOWG1egPfeLUOXVPxaGcGiI8g6n8wml1Gbrbg066C21jpzmc94rsqFtkLZSrEKtOSBbVCOsXchqEhE9xLf71L12uj/uoocM0phApmD2xBSdxfTe909bcmH/GXBzBOzBfJ468gkTOMv2GdMNDcdUrx2os8X+vAp6nOnYeYWkMtAfJMx2Piy3NPSKkItoP+lXoY1euwnkY63gEAFlA7yhgrSqDd6x6xf/Ns93mkCU+sWvCcDrmtN5HDoxCdcRk9lgnj2oigNe4Hv4HJEhbnJO1UekyYArPOiKQUlP91khecFc9nyz8nQC3ZCU0RdoW4BTOaMswjPR3UvhPBgmuVK8vL+kY0RJ6QXA/NaiWk+1hs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1614839-7b2a-4e16-cf3e-08df36bd51d6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 19:38:06.1260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6TMc70sRsfKPglB9cFyOwXp798+VKDwKNddeHFBemwsSWLDQQaYMxcTJYPJP9KMNIbFxQxefTQtVfo3ZTgxuGpbHfAQI9YQKkKYbpKNU5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997690
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 spamscore=0 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2610190000 definitions=main-2610300078
X-Authority-Analysis: v=2.4 cv=BdJNQbt2 c=1 sm=1 tr=0 ts=6ae4f223 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=o5oIOnhZENCTenyL_yNV:22 a=yPCof4ZbAAAA:8 a=XA6aF9dOBZ_BrZwZIowA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12107
X-Proofpoint-ORIG-GUID: hHXRIPYhGv87nYlNJmTlQQhZ7spcN26n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX8haRNme6cwHh
 Se7gtt9s1Nh3MdZ/iTFr+Y/o2Gt6wXmdpAjCrSkZdrJAkVdwBXg/Q2i5gS0tSVuOE0ptkeRLTiT
 +ABGiuifMZW/IzNBhB8nMrKp7CtMwqsJ++YzjVmqYUyqEK+VSBu3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfXyP2oXb3KwKeX
 eGllGqrU1Jo6T2PWxYhqQEjgAWLy515ZTpSZ2OLZ6+MsYCsEMFMNOASalGt0IU22Ggu74q3L2XT
 Q/OIPCnsGIpmE/CNHVoglk1cLJA6ZGGqWbyXZHkJnyYM68Zi5sULJcJnfYFEKFa/Jx+VOQ8S4sJ
 USUXKHgRMaTxQRsDhGuJp5t6wTI7gUySnNeM5zYVxZB+DMJbSLlBSYk5xVwSzgdr5j7Q6lmW2J6
 wyZNmZ9i/f4JWbl0umiGiLvFErlrWopO7s3Vfa5Ipi5V4kHs3kti55/RbiXTeIhEReOv8Ny4LhU
 jpAYly6UTUVlF30tvO81jXpe18fZM36SnYRiiXnnbnPbSHmoFxEaDWTILwEDm7t3yizMbX0+tl/
 cj/DVRVQAXeleJZk7ic9xbR61jPiCogEkpmuR1bcYXjRQpcaaaxCzCHKYKxtrog9Vh3ZlbZ5cx+
 2R+wEz58J8wqhKwJi0YEhDY3z3A9EUObLEyy8MNQ=
X-Proofpoint-GUID: hHXRIPYhGv87nYlNJmTlQQhZ7spcN26n

Store the shared dictionary in shared_ctf->dm_ctfp and remove dt_shared_ctf
from the DTrace handle. Archive, embedded, and BTF sources use the same
owner; BTF-backed vmlinux imports the parent instead of aliasing it.
Register each dictionary owning module and use a module lookup helper for
shared type consumers.

Release the shared dictionary through module destruction and reserve its
name against userspace module creation. Retain handle-owned shared BTF until
explicit BTF parents are introduced, and release the BTF path string on
handle teardown.

Add regression coverage for archive and BTF parent imports, embedded CTF,
missing data, and persistence across module discovery. Exercise shared-first
and vmlinux-first loading on separate handles.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_btf.c                   |  47 +++--
 libdtrace/dt_cc.c                    |  11 +-
 libdtrace/dt_cg.c                    |   2 +-
 libdtrace/dt_impl.h                  |  10 +-
 libdtrace/dt_module.c                |  74 ++++++--
 libdtrace/dt_module.h                |   1 +
 libdtrace/dt_open.c                  |   3 +-
 libdtrace/dt_prov_proc.c             |   5 +-
 libdtrace/dt_provider_tp.c           |   3 +-
 test/internals/btf/tst.shared-ctf.sh |  14 ++
 test/triggers/Build                  |   7 +-
 test/triggers/shared-ctf.c           | 265 +++++++++++++++++++++++++++
 12 files changed, 392 insertions(+), 50 deletions(-)
 create mode 100755 test/internals/btf/tst.shared-ctf.sh
 create mode 100644 test/triggers/shared-ctf.c

diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
index 54011e4d..dce44987 100644
--- a/libdtrace/dt_btf.c
+++ b/libdtrace/dt_btf.c
@@ -383,7 +383,7 @@ dt_btf_add_to_ctf(dtrace_hdl_t *dtp, dt_btf_t *btf, ctf_dict_t *ctf,
 	 * If we already have shared_ctf, we may be looking for a type in that
 	 * shared_ctf.
 	 */
-	if (dtp->dt_shared_ctf && btf != dtp->dt_shared_btf) {
+	if (dt_module_shared_ctf(dtp) && btf != dtp->dt_shared_btf) {
 		if (type_id < dtp->dt_shared_btf->type_cnt)
 			return dtp->dt_shared_btf->ctfids[type_id];
 
@@ -724,9 +724,13 @@ dt_btf_to_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp, dt_btf_t *btf)
 	if (dmp) {
 		int	err;
 
-		err = ctf_import(ctf, dtp->dt_shared_ctf);
-		if (err == CTF_ERR)
+		err = ctf_import(ctf, dt_module_shared_ctf(dtp));
+		if (err == CTF_ERR ||
+		    ctf_parent_name_set(ctf, "shared_ctf") == CTF_ERR) {
+			dt_ctf_error(dtp, ctf);
+			ctf_close(ctf);
 			return NULL;
+		}
 
 		ctf_setspecific(ctf, dmp);
 
@@ -775,8 +779,11 @@ dt_btf_to_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp, dt_btf_t *btf)
 	}
 
 out:
-	if (ctf_update(ctf) == CTF_ERR)
+	if (ctf_update(ctf) == CTF_ERR) {
+		dt_ctf_error(dtp, ctf);
+		ctf_close(ctf);
 		return NULL;
+	}
 
 	return ctf;
 }
@@ -830,23 +837,25 @@ dt_btf_module_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 
 #ifdef HAVE_LIBCTF
 	/*
-	 * If the module is 'vmlinux', we are creating the shared CTF.
-	 * If the module uses the shared BTF, we create CTF for a NULL BTF.
-	 * Otherwise, convert the module BTF.
+	 * The shared module owns the dictionary generated from vmlinux BTF.
+	 * vmlinux itself, like every other module, imports this dictionary.
 	 */
-	if (strcmp(dmp->dm_name, "vmlinux") == 0)
-		ctf = dt_btf_to_ctf(dtp, NULL, btf);
-	else if (btf == dtp->dt_shared_btf)
-		ctf = dt_btf_to_ctf(dtp, dmp, NULL);
-	else
-		ctf = dt_btf_to_ctf(dtp, dmp, btf);
+	if (dmp == dtp->dt_exec && dt_module_shared_ctf(dtp) == NULL) {
+		dt_module_t *shared = dt_module_create(dtp, "shared_ctf");
 
-	/*
-	 * If generating CTF data for the main kernel, store it as the shared
-	 * CTF.
-	 */
-	if (!dtp->dt_shared_ctf && dtp->dt_shared_btf && btf == dtp->dt_shared_btf)
-		dtp->dt_shared_ctf = ctf;
+		if (shared == NULL) {
+			dt_set_errno(dtp, EDT_NOMEM);
+			return NULL;
+		}
+		shared->dm_ctfp = dt_btf_to_ctf(dtp, NULL, btf);
+		if (shared->dm_ctfp == NULL)
+			return NULL;
+		ctf_setspecific(shared->dm_ctfp, shared);
+		shared->dm_flags |= DT_DM_LOADED;
+	}
+
+	ctf = dt_btf_to_ctf(dtp, dmp,
+			    btf == dtp->dt_shared_btf ? NULL : btf);
 
 	dt_dprintf("Generated %s CTF from BTF (%d types).\n", dmp->dm_name,
 		   btf->type_cnt);
diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index b49ecb0e..4b639bdd 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -79,6 +79,7 @@
 #include <dirent.h>
 #include <port.h>
 #include <dt_pcap.h>
+#include <dt_module.h>
 #include <dt_program.h>
 #include <dt_provider.h>
 #include <dt_probe.h>
@@ -1084,7 +1085,7 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 			case DT_CONST_TASK_REAL_PARENT:
 			case DT_CONST_TASK_COMM:
 			case DT_CONST_TASK_MM: {
-				ctf_file_t *cfp = dtp->dt_shared_ctf;
+				ctf_file_t *cfp = dt_module_shared_ctf(dtp);
 				ctf_id_t type;
 				ctf_membinfo_t ctm;
 				int rc = 0;
@@ -1120,7 +1121,7 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 			}
 			case DT_CONST_TASK_MM_ARG_START:
 			case DT_CONST_TASK_MM_ARG_END: {
-				ctf_file_t *cfp = dtp->dt_shared_ctf;
+				ctf_file_t *cfp = dt_module_shared_ctf(dtp);
 				ctf_id_t type;
 				ctf_membinfo_t ctm;
 				int rc = 0;
@@ -1146,7 +1147,7 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 				continue;
 			}
 			case DT_CONST_MUTEX_OWNER: {
-				ctf_file_t *cfp = dtp->dt_shared_ctf;
+				ctf_file_t *cfp = dt_module_shared_ctf(dtp);
 				ctf_id_t type;
 				ctf_membinfo_t ctm;
 				int rc;
@@ -1175,7 +1176,7 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 				 *
 				 * FIXME: what about CONFIG_PREEMPT_RT?
 				 */
-				ctf_file_t *cfp = dtp->dt_shared_ctf;
+				ctf_file_t *cfp = dt_module_shared_ctf(dtp);
 				ctf_id_t type;
 				ctf_membinfo_t ctm;
 				int rc;
@@ -1256,7 +1257,7 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 	return pc;
 
  err_ctf:
-	dtp->dt_ctferr = ctf_errno(dtp->dt_shared_ctf);
+	dtp->dt_ctferr = ctf_errno(dt_module_shared_ctf(dtp));
 	return dt_set_errno(dtp, EDT_CTF);
 }
 
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 275a311d..03d114d4 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -5329,7 +5329,7 @@ dt_cg_uregs(unsigned int idx, dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp
 		 * since it can be smaller, at least on aarch64.
 		 */
 		{
-			ctf_file_t *cfp = yypcb->pcb_hdl->dt_shared_ctf;
+			ctf_file_t *cfp = dt_module_shared_ctf(yypcb->pcb_hdl);
 			ctf_id_t type;
 
 			type = ctf_lookup_by_name(cfp, "struct pt_regs");
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 0290e0b4..682dda82 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -198,10 +198,11 @@ typedef struct dt_kern_path {
 	char *dkp_path;		       /* full name including path */
 } dt_kern_path_t;
 
-#define DT_DM_LOADED		0x1	/* module symbol and type data is loaded */
-#define DT_DM_KERNEL		0x2	/* module is associated with a kernel object */
-#define DT_DM_CTF_ARCHIVED	0x4	/* module found in a CTF archive */
-#define DT_DM_KERN_UNLOADED	0x8	/* module not loaded into the kernel */
+#define DT_DM_LOADED		0x01	/* module symbol and type data is loaded */
+#define DT_DM_KERNEL		0x02	/* module is associated with a kernel object */
+#define DT_DM_CTF_ARCHIVED	0x04	/* module found in a CTF archive */
+#define DT_DM_KERN_UNLOADED	0x08	/* module not loaded into the kernel */
+#define DT_DM_SHARED		0x20	/* module owns shared kernel CTF */
 #define DT_DM_KERN_SYMS		0x40	/* kernel symbols discovered and finalized */
 
 /*
@@ -311,7 +312,6 @@ struct dtrace_hdl {
 	void *dt_ctfa_data;	/* backing data for dt_ctfa */
 	char *dt_btf_path;	/* path to vmlinux.btf */
 	struct dt_btf *dt_shared_btf; /* BTF data for the kernel (shared) */
-	ctf_file_t *dt_shared_ctf; /* Handle to the shared CTF */
 	dt_htab_t *dt_kernpaths; /* hash table of dt_kern_path_t's */
 	dt_module_t *dt_exec;	/* pointer to executable module */
 	dt_module_t *dt_cdefs;	/* pointer to C dynamic type module */
diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
index c98297e7..10e54412 100644
--- a/libdtrace/dt_module.c
+++ b/libdtrace/dt_module.c
@@ -342,6 +342,10 @@ dt_module_create(dtrace_hdl_t *dtp, const char *name)
 	else
 		dmp->dm_ops = &dt_modops_32;
 	dmp->dm_dtp = dtp;
+	if (strcmp(name, "shared_ctf") == 0) {
+		dmp->dm_flags |= DT_DM_KERNEL | DT_DM_SHARED;
+		dmp->dm_ops = NULL;
+	}
 
 	dt_dprintf("created module %s\n", dmp->dm_name);
 
@@ -398,6 +402,11 @@ dt_module_create_user(dtrace_hdl_t *dtp, const char *name)
 	if (p != NULL)
 		name = p + 1;
 
+	if (strcmp(name, "shared_ctf") == 0) {
+		dt_set_errno(dtp, EEXIST);
+		goto fail;
+	}
+
 	if (strlen(name) >= DTRACE_MODNAMELEN ||
 	    strlen(file) >= sizeof(dmp->dm_file)) {
 		dt_set_errno(dtp, ENAMETOOLONG);
@@ -455,6 +464,15 @@ dt_module_lookup_by_ctf(dtrace_hdl_t *dtp, ctf_file_t *ctfp)
 	return ctfp ? ctf_getspecific(ctfp) : NULL;
 }
 
+/* Return the shared dictionary without loading or creating a module. */
+ctf_file_t *
+dt_module_shared_ctf(dtrace_hdl_t *dtp)
+{
+	dt_module_t *dmp = dt_module_lookup_by_name(dtp, "shared_ctf");
+
+	return dmp == NULL ? NULL : dmp->dm_ctfp;
+}
+
 static void
 dt_module_delete_registered(dtrace_hdl_t *dtp, dt_module_t *dmp)
 {
@@ -762,7 +780,8 @@ dt_module_load(dtrace_hdl_t *dtp, dt_module_t *dmp)
 	 */
 	if ((dmp->dm_flags & DT_DM_KERNEL) || dmp->dm_file[0] == '\0') {
 		/* Load BTF data for the kernel module. */
-		dt_kern_module_find_btf(dtp, dmp);
+		if (!(dmp->dm_flags & DT_DM_SHARED))
+			dt_kern_module_find_btf(dtp, dmp);
 
 		/*
 		 * Find where the kernel module is and preliminarily load its CTF.
@@ -771,13 +790,23 @@ dt_module_load(dtrace_hdl_t *dtp, dt_module_t *dmp)
 		dt_kern_module_find_ctf(dtp, dmp);
 	}
 
+	/* An archive- or BTF-backed shared dictionary has no ELF symbols. */
+	if (dmp->dm_flags & DT_DM_SHARED) {
+		if (dmp->dm_ctfp != NULL) {
+			dmp->dm_flags |= DT_DM_LOADED;
+			return 0;
+		}
+		if (dmp->dm_file[0] == '\0')
+			return dt_set_errno(dtp, EDT_NOCTF);
+	}
+
 	/*
 	 * Modules not found in the CTF archive, including non-kernel modules,
 	 * must pull in the symbol and string tables (in addition to, perhaps,
 	 * the CTF section.)
 	 */
 
-	if (!(dmp->dm_flags & DT_DM_CTF_ARCHIVED)) {
+	if (dmp->dm_ctfp == NULL) {
 		if ((dmp->dm_elf == NULL) && (dt_module_init_elf(dtp, dmp) != 0))
 			return -1; /* dt_errno is set for us */
 
@@ -960,7 +989,7 @@ dt_module_getctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 
 	if ((parent = ctf_parent_name(dmp->dm_ctfp)) != NULL) {
 		assert(strcmp(parent, "shared_ctf") == 0);
-		if (ctf_import(dmp->dm_ctfp, dtp->dt_shared_ctf) < 0) {
+		if (ctf_import(dmp->dm_ctfp, dt_module_shared_ctf(dtp)) < 0) {
 			dt_dprintf("Importing of CTF for %s failed: %s\n",
 			    dmp->dm_name, ctf_errmsg(ctf_errno(dmp->dm_ctfp)));
 			dtp->dt_ctferr = ctf_errno(dmp->dm_ctfp);
@@ -1018,8 +1047,7 @@ dt_module_destroy(dtrace_hdl_t *dtp, dt_module_t *dmp)
 {
 	if (dmp->dm_btf != dtp->dt_shared_btf)
 		dt_btf_destroy(dtp, dmp->dm_btf);
-	if (dmp->dm_ctfp != dtp->dt_shared_ctf)
-		ctf_close(dmp->dm_ctfp);
+	ctf_close(dmp->dm_ctfp);
 	dt_module_clear_elf(dmp);
 	dt_symtab_destroy(dtp, dmp->dm_kernsyms);
 	free(dmp->dm_text_addrs);
@@ -1215,8 +1243,6 @@ dt_kern_module_ctf_from_btf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 		dt_dprintf("Cannot generate CTF for module %s from BTF: %s; "
 			   "looking for out-of-tree module.\n",
 			   dmp->dm_name, ctf_errmsg(dtp->dt_ctferr));
-	else
-		dmp->dm_flags |= DT_DM_CTF_ARCHIVED;
 }
 #endif
 
@@ -1254,6 +1280,13 @@ dt_kern_module_find_btf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 static void
 dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 {
+	dt_module_t *shared = dt_module_create(dtp, "shared_ctf");
+
+	if (shared == NULL) {
+		dt_set_errno(dtp, EDT_NOMEM);
+		return;
+	}
+
 	/*
 	 * Module not already known as a kernel module?  It must be an unloaded
 	 * one, since we do not support userspace modules yet.
@@ -1279,7 +1312,7 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 	 *
 	 * Check for a CTF archive containing the specified module.
 	 */
-	if (dtp->dt_ctfa == NULL && dtp->dt_shared_ctf == NULL) {
+	if (dtp->dt_ctfa == NULL && shared->dm_ctfp == NULL) {
 		char *ctfa_name;
 		char *to;
 
@@ -1301,10 +1334,10 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 			/*
 			 * Load in the shared CTF immediately.
 			 */
-			dtp->dt_shared_ctf = ctf_arc_open_by_name(dtp->dt_ctfa,
+			shared->dm_ctfp = ctf_arc_open_by_name(dtp->dt_ctfa,
 			    "shared_ctf", &dtp->dt_ctferr);
 
-			if (dtp->dt_shared_ctf == NULL) {
+			if (shared->dm_ctfp == NULL) {
 				dt_dprintf("Cannot get shared CTF from archive %s: %s.",
 				    ctfa_name, ctf_errmsg(dtp->dt_ctferr));
 				ctf_arc_close(dtp->dt_ctfa);
@@ -1312,6 +1345,8 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 				free(dtp->dt_ctfa_data);
 				dtp->dt_ctfa_data = NULL;
 			} else {
+				shared->dm_flags |= DT_DM_LOADED | DT_DM_CTF_ARCHIVED;
+				ctf_setspecific(shared->dm_ctfp, shared);
 				dt_dprintf("Loaded shared CTF from archive %s.\n",
 				    ctfa_name);
 			}
@@ -1328,9 +1363,10 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 			 * data for shared_ctf from.
 			 */
 			mod = dt_module_lookup_by_name(dtp, "vmlinux");
+			if (mod != NULL && mod->dm_btf == NULL)
+				dt_btf_load_module(dtp, mod);
 			if (mod != NULL && mod->dm_btf != NULL) {
 				dt_kern_module_ctf_from_btf(dtp, mod);
-				dtp->dt_shared_ctf = mod->dm_ctfp;
 			} else
 				dt_dprintf("No BTF data for vmlinux; "
 					   "looking for in-module CTF instead.\n");
@@ -1345,6 +1381,14 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 			free(ctfa_name);
 	}
 
+	/* The shared module already owns the archive/BTF parent dictionary. */
+	if (dmp == shared && shared->dm_ctfp != NULL)
+		return;
+
+	/* Older kernels carry the shared dictionary in the ctf module. */
+	if (dmp != shared && shared->dm_ctfp == NULL)
+		dt_module_getctf(dtp, shared);
+
 	if (dtp->dt_ctfa != NULL) {
 		dt_dprintf("Loading CTF for module %s from archive.\n",
 		    dmp->dm_name);
@@ -1378,7 +1422,7 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 		 */
 		if ((parent = ctf_parent_name(dmp->dm_ctfp)) != NULL) {
 			assert(strcmp(parent, "shared_ctf") == 0);
-			if (ctf_import(dmp->dm_ctfp, dtp->dt_shared_ctf) < 0) {
+			if (ctf_import(dmp->dm_ctfp, dt_module_shared_ctf(dtp)) < 0) {
 				dt_dprintf("Importing of CTF for %s "
 				    "failed: %s\n", dmp->dm_name,
 				    ctf_errmsg(ctf_errno(dmp->dm_ctfp)));
@@ -1391,7 +1435,8 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 			    dmp->dm_name, (void *)dmp->dm_ctfp);
 		}
 
-		dmp->dm_flags |= DT_DM_CTF_ARCHIVED;
+		if (dtp->dt_ctfa != NULL)
+			dmp->dm_flags |= DT_DM_CTF_ARCHIVED;
 		ctf_setspecific(dmp->dm_ctfp, dmp);
 #ifdef HAVE_LIBCTF
 	} else if (dmp->dm_btf != NULL) {
@@ -1412,7 +1457,8 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 	if ((dmp->dm_ctfp == NULL) || (dmp->dm_flags & DT_DM_KERN_UNLOADED)) {
 		dt_kern_path_t *dkpp = NULL;
 
-		dkpp = dt_kern_path_lookup_by_name(dtp, dmp->dm_name);
+		dkpp = dt_kern_path_lookup_by_name(dtp,
+		    dmp == shared ? "ctf" : dmp->dm_name);
 
 		/*
 		 * Not found, or not a kernel module at all?  That's quite
diff --git a/libdtrace/dt_module.h b/libdtrace/dt_module.h
index a5327d37..c94cf7b5 100644
--- a/libdtrace/dt_module.h
+++ b/libdtrace/dt_module.h
@@ -22,6 +22,7 @@ extern dt_module_t *dt_module_lookup_by_name(dtrace_hdl_t *, const char *);
 extern dt_module_t *dt_module_lookup_by_ctf(dtrace_hdl_t *, ctf_file_t *);
 extern int dt_module_sym_iter(const dt_module_t *, proc_sym_f *, void *);
 
+extern ctf_file_t *dt_module_shared_ctf(dtrace_hdl_t *);
 extern ctf_file_t *dt_module_getctf(dtrace_hdl_t *, dt_module_t *);
 extern dt_ident_t *dt_module_extern(dtrace_hdl_t *, dt_module_t *,
     const char *, const dtrace_typeinfo_t *);
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 9dd15483..6182a5da 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -1316,8 +1316,6 @@ dtrace_close(dtrace_hdl_t *dtp)
 
 	if (dtp->dt_shared_btf != NULL)
 		dt_btf_destroy(dtp, dtp->dt_shared_btf);
-	if (dtp->dt_shared_ctf != NULL)
-		ctf_close(dtp->dt_shared_ctf);
 	if (dtp->dt_ctfa != NULL)
 		ctf_arc_close(dtp->dt_ctfa);
 	free(dtp->dt_ctfa_data);
@@ -1369,6 +1367,7 @@ dtrace_close(dtrace_hdl_t *dtp)
 	free(dtp->dt_drops);
 	free(dtp->dt_module_path);
 	free(dtp->dt_ctfa_path);
+	free(dtp->dt_btf_path);
 	free(dtp);
 
 	dt_debug_dump(0);
diff --git a/libdtrace/dt_prov_proc.c b/libdtrace/dt_prov_proc.c
index f7e46a5a..af3105e4 100644
--- a/libdtrace/dt_prov_proc.c
+++ b/libdtrace/dt_prov_proc.c
@@ -1,11 +1,12 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2023, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  *
  * The 'proc' SDT provider for DTrace specific probes.
  */
+#include <dt_module.h>
 #include <assert.h>
 #include <errno.h>
 
@@ -131,7 +132,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
 		}
 	} else if (strcmp(prp->desc->prb, "exit") == 0) {
-		ctf_file_t	*cfp = dtp->dt_shared_ctf;
+		ctf_file_t	*cfp = dt_module_shared_ctf(dtp);
 		ctf_id_t	type;
 		ctf_membinfo_t	ctm;
 		int		rc = 0;
diff --git a/libdtrace/dt_provider_tp.c b/libdtrace/dt_provider_tp.c
index 564cb66c..93fa8417 100644
--- a/libdtrace/dt_provider_tp.c
+++ b/libdtrace/dt_provider_tp.c
@@ -6,6 +6,7 @@
  *
  * Provider support code for tracepoint-based probes.
  */
+#include <dt_module.h>
 #include <errno.h>
 #include <ctype.h>
 #include <stdio.h>
@@ -322,7 +323,7 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, dt_valid_arg_f *valid_arg,
 
 			strp = tstr;
 			if (alpha) {
-				ctf_file_t	*ctfp = dtp->dt_shared_ctf;
+				ctf_file_t	*ctfp = dt_module_shared_ctf(dtp);
 				ctf_id_t	type;
 				size_t		esize = 1;
 
diff --git a/test/internals/btf/tst.shared-ctf.sh b/test/internals/btf/tst.shared-ctf.sh
new file mode 100755
index 00000000..ade9cc6a
--- /dev/null
+++ b/test/internals/btf/tst.shared-ctf.sh
@@ -0,0 +1,14 @@
+#!/bin/bash
+#
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# ASSERTION: A shared CTF module owns archive, BTF, and embedded dictionaries,
+#            survives module discovery, and reports missing type data.
+#
+
+dir=$tmpdir/shared-ctf.$$
+mkdir -p "$dir" || exit 1
+
+test/triggers/shared-ctf "$dir"
diff --git a/test/triggers/Build b/test/triggers/Build
index 20763860..947341c6 100644
--- a/test/triggers/Build
+++ b/test/triggers/Build
@@ -25,7 +25,7 @@ EXTERNAL_TRIGGERS = $(EXTERNAL_64BIT_TRIGGERS) $(if $(NATIVE_BITNESS_ONLY),,$(EX
 INTERNAL_64BIT_TRIGGERS = libproc-pldd libproc-consistency libproc-sleeper \
     libproc-sleeper-pie libproc-dlmadopen libproc-lookup-by-name \
     libproc-lookup-victim libproc-execing-bkpts libproc-execing-bkpts-victim \
-    module-discovery
+    module-discovery shared-ctf
 INTERNAL_32BIT_TRIGGERS := libproc-sleeper-32 libproc-sleeper-pie-32
 INTERNAL_TRIGGERS = $(INTERNAL_64BIT_TRIGGERS) $(if $(NATIVE_BITNESS_ONLY),,$(INTERNAL_32BIT_TRIGGERS))
 
@@ -253,3 +253,8 @@ module-discovery_LDFLAGS := -Wl,--wrap=fopen64 \
 module-discovery_DEPS := build-libdtrace.a build-libproc.a libcommon.a libport.a
 module-discovery_LIBS := $(objdir)/build-libdtrace.a $(objdir)/build-libproc.a \
     $(objdir)/build-libcommon.a $(objdir)/build-libport.a $(libdtrace_LIBS)
+
+# Exercise shared dictionary ownership using libdtrace's private module APIs.
+shared-ctf_CFLAGS := -Ilibproc -Ilibdtrace -Ilibcommon -Wno-pedantic
+shared-ctf_DEPS := build-libdtrace.a build-libproc.a libcommon.a libport.a
+shared-ctf_LIBS := $(objdir)/build-libdtrace.a $(objdir)/build-libproc.a $(objdir)/build-libcommon.a $(objdir)/build-libport.a $(libdtrace_LIBS)
diff --git a/test/triggers/shared-ctf.c b/test/triggers/shared-ctf.c
new file mode 100644
index 00000000..8d06e9da
--- /dev/null
+++ b/test/triggers/shared-ctf.c
@@ -0,0 +1,265 @@
+/*
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <linux/btf.h>
+#include <dt_module.h>
+#include <dt_kernel_module.h>
+
+#ifdef HAVE_LIBCTF
+#define CHECK(expr) do { \
+	if (!(expr)) { \
+		fprintf(stderr, "Check failed at line %d: %s\n", __LINE__, #expr); \
+		return 1; \
+	} \
+} while (0)
+
+static int
+write_elf(const char *path, void *contents, size_t size)
+{
+	Elf *elf;
+	Elf64_Ehdr *ehdr;
+	Elf_Scn *scn;
+	Elf64_Shdr *shdr;
+	Elf_Data *data;
+	char strings[] = "\0.shstrtab\0.ctf";
+	int fd;
+
+	/* Kernel archives are ELF files containing a .ctf section. */
+	CHECK(elf_version(EV_CURRENT) != EV_NONE);
+	CHECK((fd = open(path, O_WRONLY | O_CREAT | O_TRUNC, 0600)) >= 0);
+	CHECK((elf = elf_begin(fd, ELF_C_WRITE, NULL)) != NULL);
+	CHECK((ehdr = elf64_newehdr(elf)) != NULL);
+	ehdr->e_type = ET_REL;
+	ehdr->e_shstrndx = 1;
+	CHECK((scn = elf_newscn(elf)) != NULL);
+	CHECK((shdr = elf64_getshdr(scn)) != NULL);
+	shdr->sh_name = 1;
+	shdr->sh_type = SHT_STRTAB;
+	CHECK((data = elf_newdata(scn)) != NULL);
+	data->d_buf = strings;
+	data->d_size = sizeof(strings);
+	data->d_align = 1;
+	CHECK((scn = elf_newscn(elf)) != NULL);
+	CHECK((shdr = elf64_getshdr(scn)) != NULL);
+	shdr->sh_name = sizeof("\0.shstrtab");
+	shdr->sh_type = SHT_PROGBITS;
+	CHECK((data = elf_newdata(scn)) != NULL);
+	data->d_buf = contents;
+	data->d_size = size;
+	data->d_align = 1;
+	CHECK(elf_update(elf, ELF_C_WRITE) > 0);
+	CHECK(elf_end(elf) == 0);
+	CHECK(close(fd) == 0);
+	return 0;
+}
+
+static int
+write_archive(const char *path, const char *embedded)
+{
+	ctf_dict_t *dicts[2];
+	const char *names[] = { "shared_ctf", "vmlinux" };
+	ctf_encoding_t enc = { CTF_INT_SIGNED, 0, 32 };
+	ctf_id_t integer, structure;
+	FILE *raw;
+	void *contents;
+	long size;
+	size_t embedded_size;
+	void *embedded_data;
+	int err;
+
+	CHECK((dicts[0] = ctf_create(&err)) != NULL);
+	CHECK((dicts[1] = ctf_create(&err)) != NULL);
+	CHECK(ctf_setmodel(dicts[0], CTF_MODEL_LP64) == 0);
+	CHECK(ctf_setmodel(dicts[1], CTF_MODEL_LP64) == 0);
+	integer = ctf_add_integer(dicts[0], CTF_ADD_ROOT, "shared_test_int", &enc);
+	CHECK(integer != CTF_ERR);
+	structure = ctf_add_struct(dicts[0], CTF_ADD_ROOT, "shared_test");
+	CHECK(structure != CTF_ERR);
+	CHECK(ctf_add_member(dicts[0], structure, "member", integer) == 0);
+	CHECK(ctf_update(dicts[0]) == 0);
+	CHECK(ctf_import(dicts[1], dicts[0]) == 0);
+	CHECK(ctf_parent_name_set(dicts[1], "shared_ctf") == 0);
+	CHECK(ctf_add_integer(dicts[1], CTF_ADD_ROOT, "module_test_int", &enc) != CTF_ERR);
+	CHECK(ctf_update(dicts[1]) == 0);
+	CHECK((raw = tmpfile()) != NULL);
+	CHECK(ctf_arc_write_fd(fileno(raw), dicts, 2, names, 0) == 0);
+	CHECK(fseek(raw, 0, SEEK_END) == 0);
+	CHECK((size = ftell(raw)) > 0);
+	CHECK((contents = malloc(size)) != NULL);
+	rewind(raw);
+	CHECK(fread(contents, size, 1, raw) == 1);
+	CHECK(fclose(raw) == 0);
+	embedded_data = ctf_write_mem(dicts[0], &embedded_size, (size_t)-1);
+	CHECK(embedded_data != NULL);
+	CHECK(write_elf(embedded, embedded_data, embedded_size) == 0);
+	free(embedded_data);
+	ctf_close(dicts[1]);
+	ctf_close(dicts[0]);
+
+	CHECK(write_elf(path, contents, size) == 0);
+	free(contents);
+	return 0;
+}
+
+static int
+write_btf(const char *path)
+{
+	const struct {
+		struct btf_header hdr;
+		struct btf_type integer;
+		uint32_t encoding;
+		struct btf_type structure;
+		struct btf_member member;
+		char strings[sizeof("\0shared_test_int\0shared_test\0member")];
+	} data = {
+		.hdr = {
+			.magic = BTF_MAGIC, .version = BTF_VERSION,
+			.hdr_len = sizeof(struct btf_header),
+			.type_len = 2 * sizeof(struct btf_type) + sizeof(uint32_t) +
+				    sizeof(struct btf_member),
+			.str_off = 2 * sizeof(struct btf_type) + sizeof(uint32_t) +
+				   sizeof(struct btf_member),
+			.str_len = sizeof(data.strings),
+		},
+		.integer = { .name_off = 1, .info = BTF_KIND_INT << 24, .size = 4 },
+		.encoding = (BTF_INT_SIGNED << 24) | 32,
+		.structure = { .name_off = sizeof("\0shared_test_int"),
+			       .info = (BTF_KIND_STRUCT << 24) | 1, .size = 4 },
+		.member = { .name_off = sizeof("\0shared_test_int\0shared_test"),
+			    .type = 1 },
+		.strings = "\0shared_test_int\0shared_test\0member",
+	};
+	int fd = open(path, O_WRONLY | O_CREAT | O_TRUNC, 0600);
+
+	CHECK(fd >= 0);
+	CHECK(write(fd, &data, sizeof(data)) == sizeof(data));
+	CHECK(close(fd) == 0);
+	return 0;
+}
+
+static int
+check_source(const char *ctfpath, const char *btfpath, int archived,
+    int kernel_first)
+{
+	dtrace_hdl_t *dtp;
+	dtrace_typeinfo_t ti;
+	dt_module_t *shared, *kernel, *child;
+	ctf_file_t *parent = NULL;
+	ctf_file_t *kernel_ctf = NULL;
+	struct dt_btf *kernel_btf = NULL;
+	ctf_membinfo_t member;
+	int err, i;
+
+	CHECK((dtp = dtrace_open(DTRACE_VERSION, DTRACE_O_LP64, &err)) != NULL);
+	CHECK(dtrace_setopt(dtp, "ctfpath", ctfpath) == 0);
+	CHECK(dtrace_setopt(dtp, "btfpath", btfpath) == 0);
+
+	/* Updates preserve dictionaries and BTF after parents and children load. */
+	for (i = 0; i < 3; i++) {
+		CHECK(dtrace_update(dtp) == 0);
+		CHECK(dt_module_shared_ctf(dtp) == parent);
+		kernel = dtp->dt_exec;
+		CHECK(kernel != NULL && kernel->dm_ctfp == kernel_ctf);
+		CHECK(kernel->dm_btf == kernel_btf);
+		CHECK((shared = dt_module_create(dtp, "shared_ctf")) != NULL);
+
+		/* Both the synthetic module and vmlinux can initialize the source. */
+		if (kernel_first) {
+			CHECK(dtrace_lookup_by_type(dtp, "vmlinux",
+			    "struct shared_test", &ti) == 0);
+			CHECK(!!(kernel->dm_flags & DT_DM_CTF_ARCHIVED) == archived);
+		}
+		CHECK(dtrace_lookup_by_type(dtp, "shared_ctf", "struct shared_test", &ti) == 0);
+		parent = dt_module_shared_ctf(dtp);
+		CHECK(parent != NULL && parent == shared->dm_ctfp);
+		CHECK(dt_module_lookup_by_ctf(dtp, parent) == shared);
+		CHECK(ctf_member_info(parent, ti.dtt_type, "member", &member) == 0);
+		CHECK(member.ctm_offset == 0);
+		CHECK(ctf_type_size(parent, ti.dtt_type) == 4);
+		CHECK(dtrace_lookup_by_type(dtp, "vmlinux", "struct shared_test", &ti) == 0);
+		CHECK(ti.dtt_ctfp == kernel->dm_ctfp && ti.dtt_ctfp != parent);
+		kernel_ctf = kernel->dm_ctfp;
+		kernel_btf = kernel->dm_btf;
+		CHECK(dt_module_lookup_by_ctf(dtp, ti.dtt_ctfp) == kernel);
+		CHECK(ctf_parent_dict(ti.dtt_ctfp) == parent);
+
+		if (archived) {
+			CHECK(dtrace_lookup_by_type(dtp, "vmlinux", "module_test_int", &ti) == 0);
+			CHECK(ctf_lookup_by_name(parent, "module_test_int") == CTF_ERR);
+		} else {
+			/* A module without local BTF must import the same parent. */
+			CHECK((child = dt_module_create(dtp, "shared_ctf_test_child")) != NULL);
+			child->dm_flags |= DT_DM_KERNEL;
+			CHECK(dtrace_lookup_by_type(dtp, child->dm_name, "struct shared_test", &ti) == 0);
+			CHECK(ctf_parent_dict(ti.dtt_ctfp) == parent);
+			CHECK(dt_module_lookup_by_ctf(dtp, ti.dtt_ctfp) == child);
+		}
+	}
+	dtrace_close(dtp);
+	return 0;
+}
+static int
+check_embedded(const char *missing, const char *embedded)
+{
+	dtrace_hdl_t *dtp;
+	dtrace_typeinfo_t ti;
+	dt_module_t *shared;
+	int err, i;
+
+	CHECK((dtp = dtrace_open(DTRACE_VERSION, DTRACE_O_LP64, &err)) != NULL);
+	CHECK(dtrace_setopt(dtp, "ctfpath", missing) == 0);
+	CHECK(dtrace_setopt(dtp, "btfpath", "none") == 0);
+	CHECK(dtrace_update(dtp) == 0);
+	/* Use a private path map so host ctf.ko files cannot satisfy this lookup. */
+	dt_htab_destroy(dtp->dt_kernpaths);
+	dtp->dt_kernpaths = NULL;
+	CHECK(dt_kern_path_create(dtp, strdup("shared_ctf_test"), strdup(missing)) != NULL);
+	CHECK((shared = dt_module_create(dtp, "shared_ctf")) != NULL);
+	CHECK(dt_module_getctf(dtp, shared) == NULL);
+	CHECK(dtrace_errno(dtp) == EDT_NOCTF);
+	CHECK(dt_module_shared_ctf(dtp) == NULL);
+
+	/* The old ctf.ko dictionary becomes the synthetic module's dictionary. */
+	CHECK(dt_kern_path_create(dtp, strdup("ctf"), strdup(embedded)) != NULL);
+	for (i = 0; i < 3; i++) {
+		CHECK(dtrace_lookup_by_type(dtp, "shared_ctf", "struct shared_test", &ti) == 0);
+		CHECK(ti.dtt_ctfp == dt_module_shared_ctf(dtp));
+		CHECK(dt_module_lookup_by_ctf(dtp, ti.dtt_ctfp) == shared);
+		CHECK(ctf_type_size(ti.dtt_ctfp, ti.dtt_type) == 4);
+		CHECK(dtrace_update(dtp) == 0);
+		CHECK(dt_module_shared_ctf(dtp) == ti.dtt_ctfp);
+	}
+	dtrace_close(dtp);
+	return 0;
+}
+
+#endif
+
+int
+main(int argc, char **argv)
+{
+#ifdef HAVE_LIBCTF
+	char archive[PATH_MAX], btf[PATH_MAX], missing[PATH_MAX], embedded[PATH_MAX];
+
+	CHECK(argc == 2);
+	snprintf(archive, sizeof(archive), "%s/test.ctfa", argv[1]);
+	snprintf(btf, sizeof(btf), "%s/vmlinux", argv[1]);
+	snprintf(missing, sizeof(missing), "%s/missing.ctfa", argv[1]);
+	snprintf(embedded, sizeof(embedded), "%s/ctf.ko", argv[1]);
+	CHECK(write_archive(archive, embedded) == 0);
+	CHECK(write_btf(btf) == 0);
+	CHECK(check_source(archive, "none", 1, 0) == 0);
+	CHECK(check_source(archive, "none", 1, 1) == 0);
+	CHECK(check_source(missing, argv[1], 0, 0) == 0);
+	CHECK(check_source(missing, argv[1], 0, 1) == 0);
+	CHECK(check_embedded(missing, embedded) == 0);
+#endif
+	return 0;
+}
-- 
2.52.0

