Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EF01A702
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719465927; cv=fail; b=p/Y+/2XhDEvAnSjgOPccZK3Gux1PQsnpphirM9rUoG7cp8VBYcTHy3uVsikucbk1utYOV6T4UYOv9w90qmDwn/em4H+ag1yoQ37V5oxeOyvgfECQVgTZ0OPyQdFkdRIrRPCigkweaE3uQ+3LSeJ3bKzmdRkxwC/M7e1UrnzIl50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719465927; c=relaxed/simple;
	bh=67i1vgU3akHCEGf76jDT/QxlDO2T1xfyUIg7LpZ1pA0=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=e4QPZ4qHLOAUFzadA5UoCYS4fYP0Z5O9vDE3WBviCmrNVo+JKgYZuuRl6/D+n61Qa8Tc5HbroMfyP0DzmsfZnpu+q9Ggcyx7DH62QyvGDN5SpO90pZl8+DGksNKDoc28Z+k3iz/AfuxXKx1+m91mDywfSOGglHPd2AVDDtzw7gw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WKdz9d8D; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DWZInKrS; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WKdz9d8D";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DWZInKrS"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLNTNs011771
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=EgDkpqbpyL7+emSnNbV7ZKQ1HBciHW2A610JzKalDiw=; b=
	WKdz9d8Dv3N3HQjgYs9XwU/RI/YfhApviQD4ozoRBAFcyoTFT/5jfeIFjAm9ckZQ
	uH4WyXe//3M4tSxEJHx3X80cOGBamQEGl+uo7JQZVR7K2iPVRd8nb9Xa/n4rGLSU
	UAUkPj6d0L+ThP6ee6KuutYfKSP7Ig4Sx3gQO4BKSltYYBQsjKfpC4I6VAqB8f2g
	DZ63+9vMCcLOf2Ch619boGKdTzvZZ7Coy1jKniESNZxXz5FfTmxrOLpdS6vOYQQi
	A4rdIVrrUChYLW5dYIAIH4P73xv//bC14QR0U2P07nXML0+Hq19GDP4VHmKcdjdy
	jixokwkRcGmya9V7pGzbjw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywq5t528p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:25:23 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R3rmZp010749
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:25:22 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2gdvxt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:25:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=corb9vR8ZWqPmWp3wh8AwBY+GVsLnvwdK/+fwYL02lmTo4v7kiNK/UX4OBsNLTupkaJJwu+S3hHMIhGdyX1aLEkRoz0G1WHqr8wA5PmY3bozbrvqaVALOPbpC2DqcdnqEFnsXuFCWDaRVNqJrXf9FEuruWENSG4+P/LhgIqVOW6OGvheMgLhJF+uwpsS1RmJhbB7zCnwvBNlQlJC7EsVy/FeFKs6msI8mKYg55IYSiKOLzHLzSZX+zKJOAdY/2uPMwsjuvEGOQLrFckydiyuSnep1f3J/D+iU16X5uxUkZsfNK7EHcusIttNpNEiG4BgMNpYuBd037MvvHi/grmX2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EgDkpqbpyL7+emSnNbV7ZKQ1HBciHW2A610JzKalDiw=;
 b=hizA4KQjCQ8hWWMz+9lCRM8/b+B44BM6NectdRBpT+Hodbal3SYc8SkvVKoSDnu/E7ZoYzaMJpI3qPIdb66hjaPNwwQDAXsOL/Cf3SZlC+9yZslekiEIKRqLM5jJCZfGAuzcrXI9jGz14CyXZLtOzQztc9HcVCqbSgq+swa6yGLw1sO/ovGOe+rpMFlDPCFVhS7RU341NrWHNEvSFTAyklEwBvPx8YypqL13kAKB5XwG0lFUu3Ne4COjJys2LiLGdqB4m8/f3u7mj1FTdA6obWTARBfatTTdAtA7kTgcJF3TXNMPIY5sWrcBDXXZ5/EkWQvoUX6r4jmwcOMlXUnC6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgDkpqbpyL7+emSnNbV7ZKQ1HBciHW2A610JzKalDiw=;
 b=DWZInKrSSf4HU5xxCxiO01qHnQDBTR4Ec4LlNMJAcQAllm842AhLXN/ZpGCV4wbnU2a+XbDSZpV9XWFH0ZrDVI/r2CK/uK/hYI+zb68fN8gohZwf4MyyygzmSlOPuWPtKCj9XbtqN8DuRQRsoVWFzBCsSIVZMllZjgsCzAqq/PU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA1PR10MB6899.namprd10.prod.outlook.com (2603:10b6:208:421::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 05:25:19 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:25:19 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 6/8] test: Check dtrace return status in USDT tst.forker.sh
Date: Thu, 27 Jun 2024 01:25:16 -0400
Message-Id: <20240627052516.21220-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::48) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA1PR10MB6899:EE_
X-MS-Office365-Filtering-Correlation-Id: 46096152-9de8-4e07-72fe-08dc966988a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?axSp7uCWwiEvBeq+wiuSe5ihTTd7kjKg5J7vNfub6iIRd9AEfoW9l7lF4Uy+?=
 =?us-ascii?Q?gih7LvRBz1JBXuN+cdhTWMQFvlrQxZVegRh4r48kq7lf7lmsR8ROmo8p8JLC?=
 =?us-ascii?Q?ifGcHwIJTMmiYpI85Cno53UUaDqBCMbw8ewPOfWNeHNBWhWZIo4YgfgS/Xor?=
 =?us-ascii?Q?+Tawq3/0xg+TbJi9veFzE4QaMafV+b28XEki4Q7n60Ta6fKXQ6JCYPbGvZ4m?=
 =?us-ascii?Q?03gGvxGzrWu6netw7DKZRMPK4Dhv1AY9MNBDuDVvxKD7ZQtf9HzoVkP9uNMu?=
 =?us-ascii?Q?aIZCRrdic2oxVyTwGDaI7A4phn47MA1x8DxmrQWtOuWsosg1Y8WAVmmlwktf?=
 =?us-ascii?Q?tOunwvGWzGYATZ8jUQFj+3jAhsfXlQerFkdP2FCm1MlQZFGAGldi2kwUbsfg?=
 =?us-ascii?Q?oSYowhbwv3hkj5LCS9f4MPT45MgzsrkOZg2b5zlqJQpBd3TWaXSuJBZW9GCQ?=
 =?us-ascii?Q?d3qXfTUowM22SdD4GBgK3D5k3n06EFaRx0GipF5ikdUpK+DSlHW245Q3F9Aw?=
 =?us-ascii?Q?/QH9G/HnL7e9LZ/II4NBye4fseDT31IKHza+7/yLD4dUlCEKb22xRRnThix1?=
 =?us-ascii?Q?O+m3TPPrMRMpFnWijwkt/Czub+KD0CD4uTMNsR6R1dbSNfIZBSeVHim7dHeH?=
 =?us-ascii?Q?O3paC5l+4feZ3OrPOLJYsAElHw3PlvtiDqcvfkD2G20Yn7aeFZvitxZXza4e?=
 =?us-ascii?Q?1XzdmRzbNjchs5y5rMvpAFRLQzZPnfUn946dvPsPMswOp4J2YK3HUuyv5nkk?=
 =?us-ascii?Q?SFXaAtN5HxyDwaW7unlbvJdSzrch9HVTbDRh1Y0h+QLP9WdSUBbuq8aN++vz?=
 =?us-ascii?Q?XWfCIx+Town68zWT99vJ7176Erst6xyhQkjwvMaAs9FxsC7nDVW+vRZPFtYA?=
 =?us-ascii?Q?beSIFlomE4BM02oFFLvzuHD7+ByBcmlEVpbaPWOjkjnSknsK3BifY2g+S61p?=
 =?us-ascii?Q?WoKegbItuu1Ewj63+7goYtpYpfiFsKboaUopqWtWpct7Ks555rC6567Kjdtq?=
 =?us-ascii?Q?4hR/X8wQD4lEHAwtwxm6vC22in7iGRDj5KXWwd0ELf9xrXm3PB1bQIYddgMI?=
 =?us-ascii?Q?JsQ7jK78Vle2ZCPiVL7vEF+9oaaybr9IX3gTe45Zf4XNMPuSl73hLHxSbPbC?=
 =?us-ascii?Q?CCpSbStUW6i2N8eZxRFsb3dnU26zfgZ/gaw+YGgpHgKDXkLcm/OiZNnz6Uy8?=
 =?us-ascii?Q?4z5WkzNTsOgZ0ngeXAbJ4lEeirbquxpitdrOUjtW6qbDAFICzEAJmZkCLKWl?=
 =?us-ascii?Q?aoZb+kykSh2HeaTvMa6SDvQcQgPS1kWIfS+AYOAj3NkvY9Bpb38ExOWI1vi3?=
 =?us-ascii?Q?43t1Wy4EB+3PPVKgsRlaCi3WTpcKIVdD7a69vaYol9TCfPBxfnBUYXSLHM43?=
 =?us-ascii?Q?yy28sk4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?luiTDDw4n6n4Rz1U3r1VSd0AV/0muXDX06gSOw9kQnBcMTk3z4ha8iQG2B0R?=
 =?us-ascii?Q?ib2z+0Rwu6r8UMoEdNNxNni1UrI99CU7Wxz3YKrhe0zAjtA78G5LY8lK/j8R?=
 =?us-ascii?Q?EUJRc1jnhSA+dpvawG6OEt4THQLQsT4qmARAqc3qTmDyR+xb9xFs3kLbtk5Q?=
 =?us-ascii?Q?64AlVEQ1Dmf7qifLSIYh01VDiT55IFlHFAIm2JBhL8GwuC0HX52COCZZMFTQ?=
 =?us-ascii?Q?dUuzs6BZIEhHGxhKI4FhP341/vmRzkH0ii8nZuLBy46Mt1aPjjXOXX8kGalC?=
 =?us-ascii?Q?PlSMZ3v1ZS5txsnIvVnF0RkEfaNWZy8y/2r9g0X/L5mNfhSgjbJzBIrjCJ1R?=
 =?us-ascii?Q?x76a2JGw1TTg03hUfnO9IpdojUDXYRWENK+4aDPu5p3qJ80ywh595OULRZME?=
 =?us-ascii?Q?f3509ck6ab0cmM/q4K9XlWNZzrB87wedFtbl/x60qgTJP0jZ2gY7O5nlEfbj?=
 =?us-ascii?Q?e04CuTLbcItB8d01gx/sApE4guJTf4qimLLSQ2fs1SIm3NtXwMASF+U8hKFY?=
 =?us-ascii?Q?73r8rxr7Fi7XuF4uHGPrQbgWkV4ejiZtrT3WeOgHlIPOCaK6VPoZFR+P6O78?=
 =?us-ascii?Q?AxRXeNnO3xSf64IipbouwEwwhlBxImQAdDBHuoH3+KsIortYnFlFf2jVjcJB?=
 =?us-ascii?Q?3CUsAYvLtkvyfm+7hOT0xbpHoPH06/U0oobPOfibje07YHlgZtoJNeuthM3P?=
 =?us-ascii?Q?3UtyXmt+THIjZQi7j+/hG5O2t9tnskQygTAJ+ejfDSN6FefL4CF2yAW2E9Hi?=
 =?us-ascii?Q?Li5x/hSqGv/wcdFTBgQP/URHbyfUVRLYLhvUWTtorxsDC5TS18o56uUlYJ3a?=
 =?us-ascii?Q?1OL8YiQMraoex0+/CZLQIo5tv737gOOBedeX4U5txr9O1wuUVOEsWLbKGGFG?=
 =?us-ascii?Q?ByKufTDsLtHEqrHoG0rZpNH0F/z/Gw2KzDtcYfgus0l5ArUeTVV0NKAEnICu?=
 =?us-ascii?Q?A8D0ehzM2hktqezgId9Yco9gvkm73x/BzU5n1J59b+6yPBUM+yjwvGoWvpH+?=
 =?us-ascii?Q?BWypwYupBoZzGUhQSETa2+XEJNTRvwktJnC8Xm4GwYtrwGoFQcnSumtlQyAI?=
 =?us-ascii?Q?ynQ1osQ5oB8AiTYZj/iZPSvfYmyhNr4kkzLtiLoCvYjyPSzW+zn08eLSYQMQ?=
 =?us-ascii?Q?vA1wRJiMNOajx0HlIuAqoOzM00f1alAeDwQ2u+wdfhyGI0cI3RF4IbOSJgdE?=
 =?us-ascii?Q?0Sx/Pw/90jGLYGgWO/Fx4WUGjBEmG4M6F0c5XGToPndPIexqvN0I7zy5B50D?=
 =?us-ascii?Q?M5sA9RR3/+fqiuqGH53+g8KyaG+82he9ZlwiNR0r78CR0EW9BDJ3MVTBupI7?=
 =?us-ascii?Q?mxEIep5LWsFh4TtWb2GL59iuTnM6ZnKhGARqvhdxXRjr5s2TSN+dRbo9gHO5?=
 =?us-ascii?Q?SOkKzikH8rrV9aYz5pjuBS/NygLLpgtgdMRRZA+E+CVVTGQ+TPsPLfaVk7tz?=
 =?us-ascii?Q?2pGnjH08k1CHkjn8EEHJIperbLJ4zKrWlaMCmBE46F6jHJynx6OlWpUAGsqZ?=
 =?us-ascii?Q?7LYmGcuzfZ8xUdbj/aXbF2TDC0+bCiJRorMOkLRIPFGGKeOfw6z3iuStIfGj?=
 =?us-ascii?Q?T/AaqY98xBSyorJ6ByxnmqNY0u0rIa2lg3uq0QP5?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	WM+/Rooa01gBYWVY2UUd/Nlngl+ZLyKQJvfP3M/qKdPtq1OmTGZNxuVK8DpN3gkmo6RGs+sOJ5EcAy7Koz6Fb5U+CHF/aFnPzKoWRQ/cM8q5YtW/sIXLcWQSOyVotwnf6RySE/W1ehCIKS5iBDm/X2cUkcA+JhBka7XtkXmNfbC3w7u1ECDp1X8EFGVrzzR4u/6oQDW5Hh1V88ZIZTulfccHITcopspc/ZaZvjPQdBy86PpBGmVgIeoPELGlQm96nBlNj1dQeVPvOLhC2Knb35hLhEaq8BgbWusoOdKGZdv2MwAmu1yaI0alaNVVJp503HKqwUI2bnmZ2s4oGC6+fLA3sgXPJA0q3IQk1xa2mHtfSxnsUaQ2BQnCrh0PTvSuiIGO07npYQrVSHClQVdr/7WSYd4CFSOhNNTnov0xyG0oz1D9NRaqS6QeRU/g+rRvWYmBf9VNB1+lEcY2RT2/E7H+94jO5mo3TA96AAI4p3SeKsV09ptOxw9Mwi5Puwu5+3wn9uQO7B4wn2VGLTmN37+VDHaD0zhg65Vj0SOx9hHLDacjNemORNIymYqu5CMtBGC8v2qCawt+Mf265ptuZSweo0Sc7YV4zFwrfep67UQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46096152-9de8-4e07-72fe-08dc966988a0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:25:18.9753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dowz+1KUTOvCaZDZRg5rouhvVCwnGxhcZSgT3ehlyVIbd+oNoHnWkQFkDgmXB/ctgZhAYpq+DsHopvzJ4vt6HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6899
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2406270039
X-Proofpoint-GUID: 8B7UY6gwlT6WIN1vkzs9kXT2KCfHkync
X-Proofpoint-ORIG-GUID: 8B7UY6gwlT6WIN1vkzs9kXT2KCfHkync

From: Eugene Loh <eugene.loh@oracle.com>

This test was spuriously passing.  DTrace failed to run -- many error
messages in the log file indicated as much -- and yet the test passed.

Check the dtrace return status.

The test will pass once USDT supports wildcard provider names.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/usdt/tst.forker.sh | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/test/unittest/usdt/tst.forker.sh b/test/unittest/usdt/tst.forker.sh
index 018a6572..7cfa9eb5 100755
--- a/test/unittest/usdt/tst.forker.sh
+++ b/test/unittest/usdt/tst.forker.sh
@@ -1,12 +1,13 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2007, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
 #
 # @@timeout: 120
+# @@xfail: dtv2 USDT wildcard
 
 if [ $# != 1 ]; then
 	echo expected one argument: '<'dtrace-path'>'
@@ -32,6 +33,10 @@ while kill -0 $id >/dev/null 2>&1; do
 			exit(0);
 		}
 	EOF
+	if [ $? -ne 0 ]; then
+		echo ERROR: DTrace failed to run
+		exit 1
+	fi
 done
 
 exit 0
-- 
2.18.4

