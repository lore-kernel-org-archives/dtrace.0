Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793389112;
	b=yfDhYVoA37qyKIECu819fGh8zTAZt7xcwvt9z3u+96uAEVSVSl0rcKvGck/f9ec4MFfY
	 1+JqlXwPRCpxhQWvfkRNgbHLwWa2nESjKrr6E8EqWZ/PMZfY2xf5lzReNuFPAQgelywTe
	 9+Dwsnu5nVL6pcfd2ne2+Asfws6m3tmBBGCAtNGYH+Ta8gUML7Det7to28XGlnFADK1iy
	 MwkQ0poiY1HBiO0Ddrk2ldbiwtGAO7eH5JNrysyxiIDBtQT9c4DUpaIigkYEmrh3wI2AO
	 qq7XKwfnn2R+t3phLBIbBudXr8gBqcraqqgaZ8xknQhYhclvai4u6kmla/k7ZulW7xQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389112;
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
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info;
	bh=LK1B58Ml6crWgHs5m+Q2KsDvoU1EYUTPlMfxvbocGNE=;
	b=4bC0cJc8OPy0jfEmOySegdcMupGXWZivQNI/o9PUYQ+bEXa0RaLZLLIsZjTqeVQcEqRJ
	 63Mr16kYGXlQvA/63i6rVUiEun151AtMHHcEqYCwiOFfpL/j/TUWTE3lbGq10aJ7mo/cC
	 wwBWAI23oT62Sw38+RE+8EELNK5VFaNZ1d0jD8eGJJ53/GSwNJk990mULuEOTUEkQ/KFh
	 G1oZ+iPTE+1NEcaszuy91YVAh5lRJvyH1VKMiGsAMa1E6E2x0GX6wC3z2SGRhpL90kCvj
	 NGAmXp3z/Zdt9JjSEZWqCQqHKodiIi6oqKx4joySAfQ3Nx+QwP8VLAdIcVvy49s1rRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=mfV+AXYA;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=RGTjYkog;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1202606A31A
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1202606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=mfV+AXYA;
	dkim=pass (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=RGTjYkog
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UEYO9L3954646
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=LK1B58Ml6crWgHs5m+Q2KsDvoU1EYUTPlMfxvbocGNE=; b=
	mfV+AXYAJcIN+6Y6al5rSv4Mnb4rtv0pZ58cCrEz+2KvGjHY0Z7vZhNvH8Q5apIa
	nNo2JwRQP+VmzKJC4Y8fwoAo+Q/PhuZHOfKEbeNry89I7iO1ZXScLzXCUAGlsh5R
	Inev1SE0B8vFToJ0+eT7+/NSw4HS8fJC2miR0oaGJHNfLGY+lwX65TtBGQnVivFt
	bxFmdWHgW1QiTmy9IHUBJq9u5h7rdhVMdxf0JSVJb3EXMzRBNC7CvgiO0f7elbXD
	JBv28F/RZU+HLz9cbe8/1wXDwQhvg4DER4RD6B4QkkblnH2zoNhtwiGJR0VhGFwH
	anZru/C4eNSyzQveNk/g1g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hme61sd0v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 69UHvwcs474865
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:30 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013042.outbound.protection.outlook.com [40.93.201.42])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4hn01jb74s-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d6MAyK/ZgnvDQbuh1PHQbjZZMS2r3SNlpZ8yw2HGW6/p46Z8UPxxeP2vXgmJT07PJ7qI4cURW+Iw/7Yg5Fea2TxPg3lgqEd+zx/AALct+P+mXWekMYKStkTdZYsKzEWpXHDdoA+7GIvh7p2pWKsAH2HHzk+OGN6eqAlQhc8Ab4EBncYhWtdNe9nOEc3gPb45SUFYVSWbUOaO/07qW7mSFLMZ8DW067KGQRSBisy1joCYXJxI7JaQaHFTF2jGlglaWi17JEtR7i8jgFJ81GQMxbxzIdETYmPEi5NtDbRIXK7l8FZ5MWOcwv9GxGprycuhPiyLr+9pHtNErEgfCITY+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LK1B58Ml6crWgHs5m+Q2KsDvoU1EYUTPlMfxvbocGNE=;
 b=CrfTuOUt4FA20JlB0fuXzx3kW4BTBCNQfMyPdSuPrqIvxyEbQ70R12cSG7KwtTKcJlBIPoQEFYwh8pt4uUPYtosNhh9F5HJjvid/AOjerDeOQrN05jvWDoLHbOy1Zw2FE0MLkmflm3l47CqusL9swCwXd7Olmxhro8NrjBrdhchND0E/4LFZrHVkxOjyE2o4aoU77w9x1rikSrlfwKmIaRk5/IREVJ4yaGyQZvH0PVPKDxwG9CAC/mZSvYUdpVeorLZEeddK5Ar4rV+EsmFtO/V4gnuyvhSoicPhWAxGf/iAxWEevF/FWxOPxADaAcHpKI5Xc7fJAo4FQiTg6bvNCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LK1B58Ml6crWgHs5m+Q2KsDvoU1EYUTPlMfxvbocGNE=;
 b=RGTjYkogN3VkyzN+1+/cZYintCq3PKF5Ps6h9cA6cs1K7va6i/0Vhe/f/wNzEC+RM9Djh9Tu9Kpe9NuDsri4UPZWDrV+9+btcuTsLKncQnvU95zlI7s160rT5llQhrrcwO9VexAMUgqgaHi5lF8jsdQxoDOQFoNuZVEeKFh9ypc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by IA4PR10MB8495.namprd10.prod.outlook.com with HTTP via P2P; Fri, 30 Oct
 2026 19:38:28 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 19:38:27 +0000
Date: Fri, 30 Oct 2026 19:36:53 +0000
Message-ID: <9a6be1ae2acce8402d1cf79e4a2e7b42@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 14/20] test: detect strlen corruption of strtab rodata and
 zeros
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0068.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::24) To CO1PR10MB4769.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|IA4PR10MB8495:EE_
X-MS-PublicTrafficType: Email
client-request-id: b97ceb54-63c0-4deb-8399-e668f0574ecc
request-id: 8db29c72-b657-400d-4776-08df36bd5ee0
X-MS-Office365-Filtering-Correlation-Id: 8db29c72-b657-400d-4776-08df36bd5ee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261026140227099003|261009223027099003|261022105027099003|261021121427099003|56012099006|261028144727099003|10067099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	IDRkKyWYgRSYMc5G4LJO3cF1PHn/c77QETbRkFdE79ALdOQqBPeis3eeWRqJnik+s0XzeLxENZLnrMFdjaAIjo7aoau1EHnrOypoA3emU6Chx1Hc2PzeF5BbX8xPNZjcw2cZTX2BK5BO2oo1Qd9/Zeq1jJfmEAPmiAuApZRNmEyK9AxKzqaHfdZ/4Pb43H6sBWROXhRx5vBMV62SiJRGIdS4QII4reL8L38CQAt+aB6vXrchNQ7GnXT8UFMXUl+/GXo1W7tGhGu+jyNG+XfpB1Oj+dM4aAidzCd8bLGoEcbNW120VLG69IqX5RugcJZ6QMdm5kNc1a7Oy9G0FXFRutDHwbIpll5Xt8SuGbWOaJ1D9qRDW/+gHrdfFAAWVM9jfuu2n0HqGZY0x14meKNWRK+B1OZjeDMc80h+IzirZs1sNIxAnoQPN0uY7n2lgq6CJlQVvGJkTfiwkyX494lBCtNDmMBxYI3M1LoVsxkJcAOmHVbap47rlLcbXJRmupYbI23cbFtyn60pVXO+XkFT7vFtYin+QP1gOV4LMGYAvHZXl2iUqU2WVze+0k7ivzMPgsfBfoRXLeB6qM6PuQHAswITQCxXB/tviirM1QY+5BI/y+TN4LFzo2iq4IE9SH0YKVYxJXByWi9l6F+tQrD6HM0yhRYbFUt3QNzU30Ctwsc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261026140227099003)(261009223027099003)(261022105027099003)(261021121427099003)(56012099006)(261028144727099003)(10067099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ABcM5pZs6cezdYJGIfpooGx1PYkxIchGGGiQ62epuYMRbWnmy6YEKoZ81QXR?=
 =?us-ascii?Q?g3WvQCPvRYHt5y27pr70/OL46Gsod8KnUfXjhuI48bABqtSk5b6uztDqoAdD?=
 =?us-ascii?Q?TR3YR5lsxL0vSJ5DbAbhipdhC6xr0yPk69KYXQ01O3rmKO7rQHbjebtLP/YR?=
 =?us-ascii?Q?SpMdCvO8rSDG9zeijwkoaSe8yOUKvucGYARJDbiwdb4pBa8B8LSfXn3Iv+Sn?=
 =?us-ascii?Q?tB0CyI5+67W5q9qStOlR9gOgOxGZwvqIW9l47uHMuHWL3eRehJVcGFDQg7+F?=
 =?us-ascii?Q?qwYdF1UyE4hI2ngZmrYWsApbN7sRq0JeXJ4C8NONCAEkZAq4/qruVdty1gGR?=
 =?us-ascii?Q?XTvCK4cWzlBs5mHPOUVL8M50ZMdCJMh8GEn/lrH9GQEQZyGQxKXf4Ij/XRaY?=
 =?us-ascii?Q?LACZUglmWe4XCoHbogdG58sxbNKuMAkceIJBCllmK3DfGPOvX8bKWyNgt1Mo?=
 =?us-ascii?Q?Ac4keRtR/wWhE4Anx55hv/W2tXkicrHRkdFhaz5lDuvt1++V2FMPYgl9+NOO?=
 =?us-ascii?Q?eORq/Fh1NoK41APCorYvWywZQqDFJiPaq3C7USC5CyDyuju2652zsxUjALQX?=
 =?us-ascii?Q?Mj4pHdod/bP8AHY8GlZ64S8fj82x7CQMoDLx02yf75r2+/DDpZMKip+Zf55n?=
 =?us-ascii?Q?ArwovowXmEBkcmkH06RaspZqiVbSq4d0XnWMgFCXOljOKBUuUg9t2sPUOc2b?=
 =?us-ascii?Q?KHq9biygsyfpS9FOfG+Zn9ReSxV8kU8r382PzFouwWmjaMygJajViU2lc+uE?=
 =?us-ascii?Q?Rv2ucvmZfmeboGS93GyIE++KuKX58bRfCauLZHOhJs+oE/FgHBqoXBqdQtGd?=
 =?us-ascii?Q?4i1pGfpr7PAeagrhxAO3ndtxsoC7rOxCbEj358ZcIgmDc57/oHvJj0WzEl7M?=
 =?us-ascii?Q?1vSuVFNwg8pMk2Wa2jnXof+fcliTvyjmt9IKAobhyPvaVO4edWKYsUGbrd8V?=
 =?us-ascii?Q?+8Dwlmlx3D0RRoPBm41RRFqDOOQpXopUSaV4qS92ou7DqFjNWxqvvvn71I4x?=
 =?us-ascii?Q?2aF03JB8urNszw2Z0FM7lr99+lw4U1mmt1w4ANXG+rBHSahnhT9NsWQXOns2?=
 =?us-ascii?Q?ibZ5b6dG6S6fUh76h2XGRmd5K7VrbiC+d4Dwjn7x4Am5AnPMhAaTYkR8JKNF?=
 =?us-ascii?Q?7e1PQGPmBWF5kMA5oWLUowKDIK4mjUnm4oD9NlA+wqsOwTilt5I0stSPQ6KU?=
 =?us-ascii?Q?Z0IZsGCFroi5YBa2WZCoEytMB2m9eujVdXTDYVJ0lXL2WyYiNfxLEIzDtwm2?=
 =?us-ascii?Q?S0VyB9VLFN0QK5KKc0J6F4FTWEcu01g6uCYSZlF4lhzr5vby0f8KY6ZvJ8Wz?=
 =?us-ascii?Q?N0/PQ04E5VblwBJasgzVrsbBf0NzS5iQms7hwVOjskrqgJ06SaLviWWlsMGl?=
 =?us-ascii?Q?ZTUKqsidHALJ1Dn8OU+f7RtSe8sOXAHckdCMX+zEiHczqAZG/odERruqwZx6?=
 =?us-ascii?Q?WiGcVcaympjTe1UVBAPD1CX2SoKiM+OFaKuZHmME/9YUmEIosrDwH/E+/JEz?=
 =?us-ascii?Q?9A5pkIk2yt4K1jGJA5R3+aReg81MiFjFrG430Tc6w8vaGiUjLJ32N6bvv8xZ?=
 =?us-ascii?Q?KCXwiWSC5uITjwj4hMkQ5uWWR9bzyyAudGtzkgIrbhcHzBpddxY8fHGv7YL5?=
 =?us-ascii?Q?ChDYApYul7HOogEJCfPjyURmuihkBHt5563qV76ygn/RgrCtCGTG/U+JIKfM?=
 =?us-ascii?Q?SI3ntAtv4BbVdbbibdeTi/UvUIneDkbg7IXR+e+JGf+qWPgFZA0hyb574t/s?=
 =?us-ascii?Q?9FAE35/2IM1AARRisYP5CuIwah36c5g=3D?=
X-Exchange-RoutingPolicyChecked:
	pgSKxKzqbG5n863wgWAHtjoY5fgygqOH+/22P+0McZTziFzEt2csONGr5TNFgwsr84WFZGKTVCdILtpCiemLjLj9Vg1jy2HUve54BjuAYOuEl+ivE6OA/Af21RGWPBlHXIsPxFA8imtGhx31bqJrheq+D01A8hZIu+4532lLwDuIesZLfyHz/xTxG4B9S+Sww3CzAAhr/NuCXyHB8vAVwXxwPlRNlxlXzK19Hc8sg+r5DRJ7acKbavwTkad8QqihBhMK5JTZX4FS98dy+gZg7Y5V85YnkfMnN2gN7gyz1vIVrchrvYQIFn6pOZJXEYO8DLyTI5prGMnqRwb2C2/pYw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ngWDiItbHTAC5pD6d2GJcTTMgnsHPbkcxyoKTYzZiah19ZSHYbu1aK6saoxVU4gzfZMqyMPuqkNeeeEG66xux1ClwKKA9HilGBzOxB+ipG/kh8iC3TqpGEPBJ+gFbVdxAR36Hq62HSfGSL8XbP/LWB1MiQrkpPwqqgF+DCotzkgeDZOKdQVNSfe8v6nbaxbp+zT/4MnnLBFdVQe/jFAQ0NQqIkOwK9GimbCSgvabj05RtwairWLZcl2EoJ+1yAhGwVqyIuxP0A7JUgZOP+U4pZcAf6LHI77ByHXRe63+OP/dB69QtLhmxg7va1bc4MtBQZt8414HpjoIOmvdLAtPixF2g2t6bVQQgLwiXhPo77+fyqmL7wTFjd0k1HB/517kCvmf1gsJbsSdv5DD9zvajgIhrvZVCFgQG0Yjh5g3dSgl5hPF+UsjAUKzxhWBIz2bknzUJx40XyB4UE120yGPS0Gjy4/y3cw3bh51JUfhDz7w9/h/5XE6bXS800+vHyDN0d4Gsdd4dYivxnu2mbubn06vehtY3X1aJll1f+4DUuTSQLS5X9As+uIpsgTNaSyaDWrOGsyNowALaiS0iLHAZCyKwhUff9A/q0NtelbXKUY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db29c72-b657-400d-4776-08df36bd5ee0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 19:38:27.9329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nNtXANO1fT+U6xKUPq4/H6qfLLF+zjz7qefz7Ydaqozaodtk2jo3KP4w3oQyr6XhqNGUEKet5zwe7L9zcjdAVD/kN/TM0TN0UYndBT3w8jw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8495
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300078
X-Authority-Analysis: v=2.4 cv=L9qI0OT8 c=1 sm=1 tr=0 ts=6ae4f236 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=yPCof4ZbAAAA:8 a=w2eR_6Yiws0szRuK_NcA:9
X-Proofpoint-GUID: GYHy2vmHEvPKrts2OCremxjnJ1Q_fOYN
X-Proofpoint-ORIG-GUID: GYHy2vmHEvPKrts2OCremxjnJ1Q_fOYN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX2IMQ40hWivaK
 IlMa3HzORmrkpo1UX+KMnsWHlNdb+bN7xyScxiuZ8trklkDJSyKpprov24oieAiLAHTC261qk4t
 kQNbjZnpgx662nT7JUgC+kzRJgydilJ0niTycFWZ8NYjSWA7ZgkiZFMK4D1drZkcy2ebiLKTlHO
 o5TyqotPFIvMWbyKnJhvQ0me6AHWr5MfZT+q8r8sEGHtu4NHmfybvaLID5exNzt0zzRMtx58LJd
 E199XYZF2iX4w7X0y1Wj9/a21gWjH6zUsX4dt9A0S5qYdHtePCXwxuBvf7muHUWVGqJBDXbkEvR
 66TXj5zIyenr+MXdaxCQUL2Xpr4sNRiXcupbyAb4ctOk58Xk/U565NoTdVC9wM8ri19JcXpBKIN
 8JkIoc7wcAZVxJLoxZ6nUvCHpxtqkmx0Ocw+/ImNSTP2vulnH1dGJINAQgNIPJqC7tQEOKS/TwW
 qzDe0fZPOXcs1XMGt6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX2efKU68IdlP7
 yYZRyaVAaDxnCU7vR4qDTnkyGpawKcowZ9flwMSehaT2gZMZQEIwcLP4MwJhfKerMXa1+rNVzkN
 pmRuUz7bc2Ggp9qJ5RHk5sexz3jQI/VjYC+tDU1uUQfkQJdFQLNL

---
 test/unittest/funcs/strlen/tst.rodata.d | 41 +++++++++++++++++++++++++
 test/unittest/funcs/strlen/tst.rodata.r |  4 +++
 test/unittest/funcs/strlen/tst.zeros.d  | 38 +++++++++++++++++++++++
 test/unittest/funcs/strlen/tst.zeros.r  |  3 ++
 4 files changed, 86 insertions(+)
 create mode 100644 test/unittest/funcs/strlen/tst.rodata.d
 create mode 100644 test/unittest/funcs/strlen/tst.rodata.r
 create mode 100644 test/unittest/funcs/strlen/tst.zeros.d
 create mode 100644 test/unittest/funcs/strlen/tst.zeros.r

diff --git a/test/unittest/funcs/strlen/tst.rodata.d b/test/unittest/funcs/strlen/tst.rodata.d
new file mode 100644
index 00000000..765a7717
--- /dev/null
+++ b/test/unittest/funcs/strlen/tst.rodata.d
@@ -0,0 +1,41 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: strlen() must not overwrite the IPv6 lookup table in the
+ *            rodata block of the strtab map.
+ *
+ * SECTION: Actions and Subroutines/strlen()
+ */
+/* @@nosort */
+
+#pragma D option quiet
+#pragma D option strsize=128
+
+BEGIN
+{
+	this->addr = (struct in6_addr *)alloca(sizeof(struct in6_addr));
+	this->addr->in6_u.u6_addr32[0] = 0;
+	this->addr->in6_u.u6_addr32[1] = 0;
+	this->addr->in6_u.u6_addr32[2] = 0;
+	this->addr->in6_u.u6_addr32[3] = 0;
+	printf("before: %s\n", inet_ntoa6(this->addr));
+
+	/*
+	 * Reach past any alignment padding and the reserved rodata byte into
+	 * the first lookup table entries, without reaching the zeros block.
+	 */
+	printf("length: %d\n", strlen(
+	    "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"));
+	printf("after: %s\n", inet_ntoa6(this->addr));
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/funcs/strlen/tst.rodata.r b/test/unittest/funcs/strlen/tst.rodata.r
new file mode 100644
index 00000000..0ad81e36
--- /dev/null
+++ b/test/unittest/funcs/strlen/tst.rodata.r
@@ -0,0 +1,4 @@
+before: ::
+length: 64
+after: ::
+
diff --git a/test/unittest/funcs/strlen/tst.zeros.d b/test/unittest/funcs/strlen/tst.zeros.d
new file mode 100644
index 00000000..c8928a1d
--- /dev/null
+++ b/test/unittest/funcs/strlen/tst.zeros.d
@@ -0,0 +1,38 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: strlen() must not overwrite the zeros block used to initialize
+ *            aggregations in the strtab map.
+ *
+ * SECTION: Actions and Subroutines/strlen()
+ */
+/* @@nosort */
+
+#pragma D option quiet
+#pragma D option strsize=128
+
+BEGIN
+{
+	/*
+	 * With no IPv6 lookup table, rodata contains only its reserved byte.
+	 * This string reaches past it and all padding into the zeros block.
+	 */
+	printf("length: %d\n", strlen(
+	    "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"));
+
+	/* A new aggregation copies its initial value from the zeros block. */
+	@total = sum(1);
+	printa("total: %@d\n", @total);
+	clear(@total);
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/funcs/strlen/tst.zeros.r b/test/unittest/funcs/strlen/tst.zeros.r
new file mode 100644
index 00000000..d8929b1a
--- /dev/null
+++ b/test/unittest/funcs/strlen/tst.zeros.r
@@ -0,0 +1,3 @@
+length: 64
+total: 1
+
-- 
2.52.0

