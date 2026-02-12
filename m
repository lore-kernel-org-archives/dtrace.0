Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19539242D78
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770920918; cv=fail; b=RArM+xhivOUiKOudMXG9TbbUWTJ8ARod5qwFJeqaN4eOEKymHdBpC3L1iFuVCTWynwdPyvU3mp+LmuqGDSrTB8ej3dxpYvZ6gL80CVw/+F14xuAVJarStefxQos7vaMcAXqv8OQC2dN2qdaXS1Quzw4vxXY3F+Ooo2GFhERUOLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770920918; c=relaxed/simple;
	bh=X3ajV98WGjV28ZLZolUfYVhpZKlreHDEwSwki3gztjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t2U6bn2mawU+FlYz757NjKnNMweM0DO9AoJwMH48U75d1l5oHDZzxGtAwcTP4swpgDMmJbZZop/6wAhmApZzFI4w2V5kkIErYL5F9ddKYrQIGCxroN4W4EejK6gYfuRAkv85P61ImJfYcCF3wBa1lW0apCoK9A7GJrUiwNUj+oc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CTUlTrFH; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uLEcsleN reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CTUlTrFH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uLEcsleN"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CGNHjb839276
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=5ui3AMdAOZt+cJ2IT9viszr0WlXfSffSkenW03pl4PI=; b=
	CTUlTrFHA/cagW6NZ9yxTANsEz+wNqdPdqlO0YTTnDIJBD5Pq/fWzH+T+F1Kcd94
	xl4+8KXfUBP0JiM4Yr2vFv5pLADRe352Aa2a21aci8sQt3FBSUr5L2FPDnfW16Bj
	tgUztpFUv11Q3UFmRG+c7Ah143K+m17HjvcLshucSWD1l3SVWPaPmS7L4uOCu5X1
	rOdzWwypVQKRazMQzqE1AgYCxJfL2mOkgDylEN3pITKrHjyQNmgdcI6LuFPI1WLe
	Lom4pIa37gNS6KWm1QeVzTq0ALDi6kWZ+AUhXIaO9vWi9ZKIm0tOfcZxxvLR4k2E
	wRZGqK+srtNxOCWhVxAQ5g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c7s7rwavr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:28:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61CGMFB1008472
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:28:34 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012009.outbound.protection.outlook.com [40.93.195.9])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c8237h5d5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:28:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVIHV2Oo+lfFZ+pjMJAOiCFmvbWFfO2ie6nUpi3w3/h3AtzTQVkvZkZWFngv3rR3QX28Rvj9AR6fHNdWmT8nAK6s8agzcbh1hMeXcefDfrM5vJl5gdoKEb9NYqd6Kr88lRD8FNigdF3DB993RKuFMhEZLZoYZfkWlL2Z9P7sDmElCVynrLQ4G32NroqabWi8wuUu7ckmP7hPEqO0xKO+NLjk5BOWsJMLhENrnablKip1lt+0WvRv/ICsRezyfjcWUzkdMMJAUUAmMuu5Zw99zBTMWHjmg0mX3HJsI75LIfmUq5SgRCMjQ/ZDtOGat5kFu9mFJIHFyINERbTcUGkWTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Z1kQ4gv1h7Eef8wSuU/bT/k5ThMhcVRxi5gcwiRnx4=;
 b=p5qAXK3bTHWRPM60wzOpVvOGlS/PpnR+Z6Eh+JvFxTvc0WTCUQv4p1UUQiyT6/glQ3/Vu0mzOMT5k9TCURde7bCKIjQExkJrB8az+oBLcgI+uHmsgEFbKcfDRBU7KpjfS869qXLDSkkW2ZNiEkFtnHbpzw69Hc6Ls18I66nDXDflbtHtwjcSa75b5KVE7PS0KkhN2G77on/h+UfzppEUGMVxOZFmdfUJKcihnqYCFddL3IGWC0zSKIvR9XIUjbQsHR1a+OldJ7QiSRKSl31L3f1qgK0lI/tWYfnaabuTSlcDiQMLJsVN2AxnYZfd0Dp8hAQkb7kpNYi4eKCFY4bWKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Z1kQ4gv1h7Eef8wSuU/bT/k5ThMhcVRxi5gcwiRnx4=;
 b=uLEcsleNU+fOybndKUmkk4vHrltnOjmZEl+FEuToybiQCAXLnxpHtnpXxLRed8vhutu0WL/36goB9adxAK0LoMv4ZBnTaSea6fUD4QzC2fl6wPjQKwpYjQ//drU5fq8GIhLKW5sCMm7/Gzow5iO3Wpk7WhR27JEaNDx+mX45DoU=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by SN7PR10MB6978.namprd10.prod.outlook.com (2603:10b6:806:34d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Thu, 12 Feb
 2026 18:28:11 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 18:28:11 +0000
Date: Thu, 12 Feb 2026 13:28:08 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Eugene Loh <eugene.loh@oracle.com>, dtrace-devel@oss.oracle.com,
        dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH v2] dtprobed: use /proc/$pid/map_files,
 not the filename of the mapping
Message-ID: <aY4buJOhWlmm9CvW@oracle.com>
References: <20251202230453.124306-1-nick.alcock@oracle.com>
 <20260120162051.183028-1-nick.alcock@oracle.com>
 <08f076e7-9573-7ca7-f89a-a3fd33bf683c@oracle.com>
 <489a5755-af8e-6eff-48a6-9fbeb8c9b4cd@oracle.com>
 <878qcxomfi.fsf@esperi.org.uk>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878qcxomfi.fsf@esperi.org.uk>
X-ClientProxiedBy: BLAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:36e::27) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|SN7PR10MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b1fa3fb-1f44-445e-b31e-08de6a647a06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?+EvJMzlEiOBXrU29FS4Qbs7nMUgPXBlMMKduwBo2XavXKzi/TJqmNZUtdH?=
 =?iso-8859-1?Q?4hSUktpY8TKgsCrxadG0GyKapLUt3VuBkEE0hCZLe5tnkIs5fzylVMejK1?=
 =?iso-8859-1?Q?WSO69g+/9R/sx4IKaBLN1gBuKe/L8U5NCBth4tfgpBVnuhRCZ+qYBRAVVk?=
 =?iso-8859-1?Q?nPdfEQIDhCdci7SJiicYD8rFZlN0gp6pkxHdJXjC8TlMnHifx6x+DE4Rch?=
 =?iso-8859-1?Q?CjR/tMgIncghSCuzBtTcKmwa45HkeRYAdUZWSjQcaXY1GX551fm8ENglzC?=
 =?iso-8859-1?Q?rAISZMryNsK8YAR74qsLDIqSdjuyJc/KefGUrg84GffMcASB63Z2k1Nroy?=
 =?iso-8859-1?Q?3vFo/0xt0bGl79LAWAt+hvZuYMMREddTR5XQQ4QpO8cuCiQ6l6jVfiNcSz?=
 =?iso-8859-1?Q?q6bYBDbHOVkF/4qL6OCkQVFZHrefmY3d5OH7vaUqm/YglblCdgUAr+0+3o?=
 =?iso-8859-1?Q?Ukhqea2YkomWFio0LPOWIvxKDyugGvsUlOq61AoxIEeoKWNHxZ0LM1J7gp?=
 =?iso-8859-1?Q?Jh3w5sz33h3II4FjAyoQXF60a2gLc+phOQ3lKV48Ft5iIL2lFBq4fW7ljk?=
 =?iso-8859-1?Q?Lbp92rJ877NLXVvFVWR6fhOdse2DdyLrFNgJnH9vcrciCiL5Y2SzHZvXpe?=
 =?iso-8859-1?Q?lU2y+V127tBl93x9ulFuhTqrYTFIYFeuLF77LJ/kTpR3vcHnmfDUrQB5Jm?=
 =?iso-8859-1?Q?xYQIg0jaI8ZTpN8yhWilHH1TSr+cafl+75yU0hVjUQgNLvlznqvxIFu921?=
 =?iso-8859-1?Q?VODG001dzny5/HF9sJ9edCk8PB4FDXt8VOa3ghc1nESiv8W98x6ekuLH90?=
 =?iso-8859-1?Q?MvVjYfjkH9Ss/tTIny3psNDIuzJqB3ndAHDX7Zu5Sqgo/1V0lQcuxuJcwT?=
 =?iso-8859-1?Q?RiVYv7suwsZGLAT9uIHW4kkWXktR8t74UB9YabrJ7/lfAdUQaVHKAxW9WN?=
 =?iso-8859-1?Q?79eK1uQVEF7OGQ1f8Vpgge0hL6Fz8ruM6r6K3rTS7bl3g6hMSrwLUbtatI?=
 =?iso-8859-1?Q?PJG9KDzEAoS7Pgp+cYfRE7OOFCPvZuot86lSIcAKsTi/kGhFX99F4IKKVo?=
 =?iso-8859-1?Q?9hxLvmNxjXB0Kkf1RoXkLDk2mzDeUE7TcqVi9ouXQ6lkl0Dp74uGBaPNHY?=
 =?iso-8859-1?Q?z+kUfxNXpg7KnHLEIUuRvAofG9KKyvASZzx6NckjOD/yxHLPLfRVapt1d3?=
 =?iso-8859-1?Q?5rfro3kntIGeWFqLVjVJTbeorCvCXwNO9FO/Gv3vrgLsmo1uNfHKC3NQVd?=
 =?iso-8859-1?Q?vz29unkRC2SFh9ttIvw9tVZ6PjYVpTGNfbqbaqAad0xOe3f1BiwsajmWkV?=
 =?iso-8859-1?Q?KuhxDKp6Iw7WnyMxHPsYsZ5JnOwAgUM2aSsn51NFSaAJVa1ACIwN1mTPRI?=
 =?iso-8859-1?Q?zBHIxvOa7cgbzgFDMMMYZzrSc7caqVRZYssDCfNKXkjQgGtz9FgqHFBpui?=
 =?iso-8859-1?Q?nkAHnALbfpG9fu0321KWUA3fWLqlNc4NsUmI0vgBTVNNHHWdchPmf05dt/?=
 =?iso-8859-1?Q?RSCd4cZtXy5OCC1TRHEftYP5QWaWgtjLanuVllzftkI3zG++yIwJ5Dw/+i?=
 =?iso-8859-1?Q?dF9U9e/YFuJMpf+X9kmWvbklGWnKoSzcpahHVCSVIpCQeQol/GXAKwOa3G?=
 =?iso-8859-1?Q?GL+BO6rlMdYc4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?zmuddjUq+GbVyLVQEGdC9XN2zsUZkeb0WCpZSMqfMB7QrVuptJ+1ewFZ9b?=
 =?iso-8859-1?Q?e3E/IYkwBtPu/6zvC1VYzgVUY9znHa6o3gkmw8JA5yfjM6LA1xtDG7YWPZ?=
 =?iso-8859-1?Q?RStqEqPVrejLP1kof6q9Thkb8P2FeaFP08XtGkUtDY/WHir4xpEMnvi+Zg?=
 =?iso-8859-1?Q?R2vAnkvm54OSshd5qLN8IZnsHIWculZrK1N2XRYuLrP6d85py0Ke0SWwq3?=
 =?iso-8859-1?Q?2ge2lZChjgqtAtbS4E51bpovc0qMjFT08hvhgM7kqBmG2/GhN8/vDctPru?=
 =?iso-8859-1?Q?pWcUfTpDyoKpbfspt9qWCaj2Ycu24vuVaWmeAK/dlVOMZwvMwSDhtckvDu?=
 =?iso-8859-1?Q?3cy7T1I9H8VJ/QcEoOm6isFVnHoOQJhPvNYVHLfWGnEbic3BJZwn/YcuIY?=
 =?iso-8859-1?Q?4j0+IqKEvwjFVkGW2PTAFLNvOE1fBDrtKMX8mGbNYfC65eO+qGvoz3ESHx?=
 =?iso-8859-1?Q?/vkwoMzJHh9eaFUZmFsRQhQ31JvAPS7K9agYW4isYzLZkmZaa0FW/czpzW?=
 =?iso-8859-1?Q?9JiZPMdmqz9MVHR6db4mr+zNrMv6WNT+cxtSKVjoMPp8Ua7ksLCWO4HoHF?=
 =?iso-8859-1?Q?gSqi6un55oGmIlrMr3+8shZ2SorFbbhsOdnHsoPaUDwdaudM9wgj3AN5Fl?=
 =?iso-8859-1?Q?Dt4AVbqhGmtHnH9kfoRPC/l++YKrNeupFcuClcgMVoIuxEE7+377kPvlFm?=
 =?iso-8859-1?Q?1Vv1a0RQdyD3p6PYwgHhOg+dZriVHzBCMzTa8wVKNTEH91AC2UPbXpU6fi?=
 =?iso-8859-1?Q?4v7h0psI4R+ccvXhQEimXRXshX3xcvol3Rma4DcJWYkJwNAI+q5Arnh85g?=
 =?iso-8859-1?Q?syapr00pVteCCuOaUOMiHTqUqCIkxsIdkZItKtIQ0WASPZnAWyeXoq7ZA8?=
 =?iso-8859-1?Q?gjU84qPBrdasDcCX287s9QysuCGgfmrF68r5Kz3XcYyPkm0f+QEaTBXvLF?=
 =?iso-8859-1?Q?ih37uAt4qxmlkdgGKuuXGtJzj4Gwu0V7crUhsieiP1KTucHCy6FfVcBlvn?=
 =?iso-8859-1?Q?MqnE8Y1OsUyf3+nK0S8BsZ7PajPcVRP9Oh6KUnSdXuAsrj/shADxas+zFL?=
 =?iso-8859-1?Q?iQshl2QWgiiu1IUjCYLa3dsPu5UjxQCjIb0BJLarYsPllREjpAMLAbpraX?=
 =?iso-8859-1?Q?03PVrKqzGYotYrhIWAlj1L8XLOhE6yrQ00NLGWGDTvS/PWEHDp7oMcfIH+?=
 =?iso-8859-1?Q?9cGehvu4Z1vh6CFw5Bp2mfQkxSY/jZ8G84JLktfLwEPoj1ciD/ZGvEpL5N?=
 =?iso-8859-1?Q?noxsRYdlAUIxi4UZT2FICjKIEIyWE8BTJ+kw5GvTF5Su4XtznWgjMsDP/V?=
 =?iso-8859-1?Q?JMXa7L8zyPusbJFSNb3Q/ffh0QZ/o1c+jDUpEim5eyvx8JpnzqGQQyML3s?=
 =?iso-8859-1?Q?KDrxq/Ds8p6FOT1SwAghRI35pUi7rAGHSofy2OsY/VVClFfgcko3ApQ0NM?=
 =?iso-8859-1?Q?UDIlkQOODVSEG7V85SxtfNmjIdyyYAKMVbJ9OjeJjlYP0GMfgwrTWZ+pei?=
 =?iso-8859-1?Q?mFBz77mQfe6XL0LxmY/ifB7ZMn+S/7bJVrWlP4BvnFpVYrN3nWPD+C6k8c?=
 =?iso-8859-1?Q?Q7JHGgETs5MNn0gcEfxQYb6J/s/JnBZ6NN5T3gGnmgthyTcfeyup+LDA0f?=
 =?iso-8859-1?Q?QzcidGhnJ8DTmeXnme1iJSFV30J5KDAeEDSBJNwYCac7kzC/MxVxgxdIkt?=
 =?iso-8859-1?Q?AoiC6yVXBGirIFRuwz1nsfQU4SKckopNffdqgaRiIM9TQ8kOTt8SXk7ovR?=
 =?iso-8859-1?Q?92AIB6L0U4iU36W3KxdrhFQ2/W0hH4sEYZk4HnlAf+YPwTcrbIW2g0U9et?=
 =?iso-8859-1?Q?Y8iO7fOKLA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ynn+dsn8300R+9MohSEFkQ3eMu2PR98RzdpuVgYELmnz5X7FOw96tAtn3UmHEnCbh1Uz68hKhf7IVJ65N0YsYuo2xqEsatfzKp+cqAVEO+0lRgx+bCv3w+y1pp1xMMh6Mo34k6Xu2XCEGYrL0Rk/wF1RX67OfzvE+HaYW5d5fRFeziV8BS6s9nxZAy/47qnsI9q/Ads7GihtKj516w/kI/lAMPh11YFJvOEqwDdVBph/QmBvA35L1MYbT19ZkOVdAO5zeoohfpvBZAfehKxuK+rzvk6xDs3OF7nY0/Yf06xKB/j12J6MaRuY01/37+InSXLA8rrpI/ykMNV1zeI6g4SMzOdwBC15C1DidWaiTJwz5tRBYJkfttmDNvnBNghfoXi4NsmgFhnODHdRm/juLARhblglDi2bQN3ZQMr5cTHumV7OQoz8LfGScONjhbKDjSeA3Ks1WIFDdvPHn/pXTYohw4wAyrNOzmieR3CMngmxO5GXtkrgq8KxMv8BKP4kI2SjRn7LHqw5/aAumunMah1ly65CCKNbIcb9XPZW68OOvRaVgjdBcsZpA+mWYBWTz6EXZeR/g8tnBbHuQJ03rAX+5cEmiiQ1AVUL7jC5/Us=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b1fa3fb-1f44-445e-b31e-08de6a647a06
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:28:11.1829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mb5bx4zQRCk9PYvPUMYHusUQs3hVmURr2XaCWsql9sz8MwPYstyH+PhTGT+Z4sfhMMpjvzIAjMrYsSXEuSiPfy9L0CvRfWJ2BGhiZkhlfCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6978
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602120143
X-Authority-Analysis: v=2.4 cv=PZbyRyhd c=1 sm=1 tr=0 ts=698e1bd3 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=igv6b8l3P8z7-IIQU3wA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDE0MiBTYWx0ZWRfX3A4N8daP612/
 oyv/oTBl7MaKCvGBUPdG5Vj++Qe230Vd9Eu2xxBye4VGEsen14cnwBrUFjXQBkUH3R3nNLvVDaO
 fFQND9LUkco6s3JQZMyil3Nl4aLOUj4W3L7uXkKdAh4r4gRdxAfYyxvKcTAPnCbN15yBMAc6Ucg
 B53jZ25+UB5E1B28pFnVE87Mer/v1ezHVl38VFmqVX/2cldp4UtyZVgjLi7aR8QWvWh1D8lfIQw
 NxIdLRgpI/YlJmB71JU5oMrWsNpEOf7VxnyLembDzFKlGygv9ZUagLnK3bm9/PeUSaNaBpQU0YT
 6B/K+zH6Crw6nUb5qbXgEwyWeK4fjUQeVBFYgGHBKR0UqhrPNhSUFsiU5Z8o46stcNzjwNxhre7
 KNSELjbqWuGF007R7qXZwdlanPNRtBw+DaVHwETPtBybPfT2wJdpn/KOO350ERlIoBrZyeXPGMz
 po6kQELd/B39h50tY8Q==
X-Proofpoint-ORIG-GUID: VH-4pMGp_TyiRf09ULgj_RDZBM2UNliG
X-Proofpoint-GUID: VH-4pMGp_TyiRf09ULgj_RDZBM2UNliG

Here is the problem:

        prf = mapp->pr_file;
        if (prf == NULL || (mapp = prf->first_segment) == NULL) { 
                fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapping (process dead?)\n",
                         pid);
                goto out;
        } else if ((fn = Pmap_mapfile_name(P, mapp)) == NULL) {
                fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapname (process dead?)\n",
                         pid);
                goto out;
        }
        mod = strrchr(fn, '/');
        if (mod)
                mod++;
        else
                mod = fn;

Since you changed this to get the mapping filename in map_files, you get a
name that has the address range as its filename, and since that gets used as
the module name, you end up with the wrong module name in the probe spec.

It needs to be the actual filename of the source file that the mapping came
from.

On Thu, Feb 12, 2026 at 06:18:25PM +0000, Nick Alcock wrote:
> On 12 Feb 2026, Eugene Loh outgrape:
> 
> > I do not know what went wrong here.  I would have bet big money that I
> > tested this, but here is what I find now with this patch:
> 
> So did I!
> 
> > test/unittest/usdt/tst.enabled.sh: Running timeout --signal=TERM 41 test/unittest/usdt/tst.enabled.sh /home/.../build/dtrace
> > FAIL: expected results differ.
> > 400000-401000:main:go
> >
> > Diff against expected:
> > --- test/unittest/usdt/tst.enabled.r    2026-02-12 05:31:24.000000000 +0000
> > +++ /tmp/runtest.6196/test.out  2026-02-12 18:09:58.980466976 +0000
> > @@ -1,2 +1,2 @@
> > -test:main:go
> > +400000-401000:main:go
> 
> This suggests that symbol lookup is failing, which it shouldn't be,
> because that *too* uses /proc/$pid/map_files, or should.
> 
> I clearly need to debug this. Got a system on which it goes wrong?
