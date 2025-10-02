Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20F8126BF1
	for <dtrace@lists.linux.dev>; Thu,  2 Oct 2025 05:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759381574; cv=fail; b=swv2PceGh3ynGEwpu2UuCI4aTDJSTcV1B+nSKbGbFRke9WT23N+mC3CEcJ2dhAQdL0II4ew40r7ib3y6cux6QRR9fhyjlnX7G8y0odLHWIfar0jiihZCDBY9SmsefGzZqXyFWts4yLl6JMAssJmrlBZ22+EPanSeYxw4I0nS/qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759381574; c=relaxed/simple;
	bh=4PU9vRjnYvE2wevG+lRQaAD1WExU3rdeONW0Hc25MT4=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=KwD2Q6vGLWB7K0OxmfbsVFM6bss10wgxpvzBv6/t4Bmcp4zdnFxHllCASta88b0EZBhkUleAgnae/lYYftOHKywJxBqrX8wRVgJpKAp2VXlTya91RmTGR3gjCYRsiEHCvJibpCro5QcPzsXKzFOHGCMzU/ZkydgVb+/JxgI7OU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JsF2OZ7K; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ACvk+xnd; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JsF2OZ7K";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ACvk+xnd"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5922Nj3J024955
	for <dtrace@lists.linux.dev>; Thu, 2 Oct 2025 05:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=03IAW1v/z6tkz2mQBo4tHbGUifmH0YP1dTQys/82zGY=; b=
	JsF2OZ7Kr0n/3lQVHtbUHE7sS2wgLLMWx78nhOJHGyKvYfcKyuPRqtHM3amJhbjZ
	ph6To7NhunTV35A4J2DAa+Arma7tRElqOSrQGL4F2NadTfJ+YoaROeTyoP2w9W5x
	crhf3XGCSZRX9ec7F4GWKniz9uFrMV6xCyiMHIRjIPFNpG/rZ37J2QJv3y4axmws
	ZrdkLnW/5sTgqcdrFAFGzp4ouiVI56e1/exxDuicC3o1jXQMtAoD+JU7dPTzIgfT
	7YovaNnQ6xrKqA3DTSZ9JHdyGm7FArwo8o1VKVRgmPhsy3txsrmw9EinkGxdfu1y
	50KcAdUezfH/9UNYAljRNw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49gmactqg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 02 Oct 2025 05:06:06 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59250f9h004213
	for <dtrace@lists.linux.dev>; Thu, 2 Oct 2025 05:06:06 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012067.outbound.protection.outlook.com [40.93.195.67])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49e6ca0cdk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 02 Oct 2025 05:06:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgzgX6UYUH66Q+wl4lUKmQhODBtWpCUCNCrFU1zcnmbUGJywfC6o3QE2bZWyUenov498c8Zv+vP6FKIoiHxvsFQPeY/6YGxHiaVYHcijFGDGeaeva8uCzqzZZ4s/tp3QOM2HX2o2eUAA2HkE/iFTHDfElfVkvQj0IlA0bqnKaSKSGwJbsQIM+jxVKfB2TuVLrUxOwxxZjsFHnTVMURxP2D9lzC0xXXcZxbO0XvTt57z/o72HHiqByKNinUDT6K9I9fjOHARhDBt2iWOKIPbSlAaSWdUtU4Y9WR2iwjudH8nMITA1PRI272Y5Qp72H2xuqMpOKTouRNiPoBUeliiiLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03IAW1v/z6tkz2mQBo4tHbGUifmH0YP1dTQys/82zGY=;
 b=XeDO3AofilJZqkjZgQWiZ91Vir2TjT2H3zlNOBYCuf2/Sjna6N27c4kLe9thJo3yX38uitsazoPAblreD7/BXldpHgxOCMqgEZxHarZTn4x5t4y4+AIgvJtmX4Gyvljd1LHUBcq5HirOxZ8HHkCcsID9KRjYCqde108R4cmpPgCWPyOfHhGel2cWI4MraMpAPN9Y9zz9vt0vY7q0TqFIjOBwj968VAJtcKWRTyuhEg3tS/WbxvTU0Puf0P76vo+fgr5naZuHPvhnwcmHdNon9UzZSuJAX/YGA3lfSCxWj0RcBbmCNamjsy2gaa6sWpfkYow6Sv6gnmCPtMWSw35t5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03IAW1v/z6tkz2mQBo4tHbGUifmH0YP1dTQys/82zGY=;
 b=ACvk+xndW1aOrR7DcwQuSSGuXPyeI8ZLRjXCbWJYB78MKmcW63d66+w4JKMJRlJMsw6+YuvWXJQKozFs5rjc48AqzXa0UOPDjjqMPuQFO+AqS6grvkPSWWJidoOFm6X5P8jL3vAcWDToo6HRcZiN+do8pSuwdFto8DKYTCQcQJs=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM3PPF1BD38130F.namprd10.prod.outlook.com (2603:10b6:f:fc00::c0e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Thu, 2 Oct
 2025 05:06:02 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 05:06:02 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Fix proc:::exec args[0]
Date: Thu,  2 Oct 2025 01:05:58 -0400
Message-Id: <20251002050558.22052-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:36e::10) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM3PPF1BD38130F:EE_
X-MS-Office365-Filtering-Correlation-Id: f53adc83-8ba8-44e3-5f3f-08de017161e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1wWPC6vf1lOEbxqMIkV+WSuKFVhviKY8n5CgiHAc/uVt3oI+ItAkwzXKr2s/?=
 =?us-ascii?Q?2NgBaWinw+6KwS8g+d2IarVW4LkuXabAp9hICNtxXPzKF6k4qcucYlW8FTxl?=
 =?us-ascii?Q?9bakwmFHpnHZqcMoYI6SXky5rbSxZAvJKaA0TQ3GO2meagt0NboXn2UaEv31?=
 =?us-ascii?Q?sm5HFh9Pl9xwjSGqqukB8uAbWNL0Uay8aG279APJruNDSnhzP7cHbnl4MGnq?=
 =?us-ascii?Q?MIZ0RDKzGSW83+IWhV5dtHKl/zhuISJsPc6hsLdtaZGNUkVfP6BoREaUKZQS?=
 =?us-ascii?Q?MS6XVpHRwNNZyiLPesDKjraLdLw9VAONorkNSkcY+Dl+qK2gukavtRipkku5?=
 =?us-ascii?Q?gWM/ZZ0mE1MPR8eXaTFo9IWS+0MA6gRiObbG+vPJkeN5gWJuemirM4LeOmp9?=
 =?us-ascii?Q?6X+nZ9+nr/Pp+0E/hg7s2EAbeYnvifIL1a93dQxqXDs0MBDZ44D1uMyjTtKf?=
 =?us-ascii?Q?SFummL3xL7/hLE+Wt25+T17hiC5GI6pOI+RHlcH1jjU69R3gz5iPiDxa+6uj?=
 =?us-ascii?Q?gaEIpXJ6v1r987fI9BbEjB8rnHASn/kjEk9cP695kTPEFl7A6K8LlS3Rdjoq?=
 =?us-ascii?Q?xtXsOHVsOYyIO+DhrOSKUDeu2+4z/NJCFZUxS2VmZ+E1yf/mtkeca2cIilmo?=
 =?us-ascii?Q?W4Ilemc1A7jgi7pB6FN97yQ4UofmXt3jynzoBMTH2V/x6najC7QhYoXDVXIl?=
 =?us-ascii?Q?JV42UtRm6Wgl4ENXMj7PE59pEPnGGFsmzBs8fMk7di2jquspp6QcKpj8QPNd?=
 =?us-ascii?Q?JBXhr3eXTxCT0mNejwTAxkZ2dulaVdREq69jgSilPhLZvmkBV98y+cbx+J9X?=
 =?us-ascii?Q?dmSgJAa4N7LHt1d+aVAsSVAiQ3Ovq94xeV4JdpaWFQN0Tb3peFhVZEWa7cfg?=
 =?us-ascii?Q?iubwpSmlhD85rcPZGRNRCutrxKi+ZyUG1gh+m/jqGm87FMfJvUEvFG5vkuUC?=
 =?us-ascii?Q?7TIDKZaXzUfa5pe8b7z7K7DxS3QqhDVHFsHFpXJZy5OHfbV/wyN7jc9sLScc?=
 =?us-ascii?Q?dHZM7oKsjYRfRd9B+Vl7hsm4y6a0w4OD3UfOtPJha9ZlpwUsf8robR8u365k?=
 =?us-ascii?Q?Fx3v8wDREKIv/G4ZwGCfK9JyxcvGQax22cuuu820iq/92FZ65jAgxg89Tb3G?=
 =?us-ascii?Q?1oH9cdQt2OSA3ruUrw4wWpjUR9OBIt4SxD4Ds2V6pQYNQTH6xtRWaxU5IHwU?=
 =?us-ascii?Q?K4GY+iXRILpa2lxKmB3PisasNkBnkvtDstoJ7Wxh2dD/D0BuZJkxNqz1oWeu?=
 =?us-ascii?Q?uE26kxNOrsPu5AB0Bp17V0Cm+PHjzYeTVltso2d1+WahGq+RL5aWyb7OPEpX?=
 =?us-ascii?Q?qVLFlUYOHUoFMskh3Xa4Gq7Nvk5Yitk1CAgEcZ8usJby3PxyI5YQqNN6sGdP?=
 =?us-ascii?Q?+Z2APW6ro5VU1haKqxdP3q1hx2luR7OkwEsAl8Akwk9TByHOvl5z+0PoHweo?=
 =?us-ascii?Q?b/ayfLHDsoOUgYpSvKl1HAKCG1SLt8EW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wyz+O5FHYAdv8Dfv+0z3oQM2We8iMahBewBHXGYBqwrXHjI65VKVZyMlWkyU?=
 =?us-ascii?Q?rHNWf09a15WK0TVMYa/W4VZbh1z8QKbYKeEZdzgysU41xHfwCsg3JW291EsV?=
 =?us-ascii?Q?07WLvtc+vVA1yP0mQE9HKx9MmsxyYZCl7JA7z2YPUDPbmOTxk6I+vU6j/ODO?=
 =?us-ascii?Q?g/IPNq0L2On8N8Fq8vUtbooP+EwV1DIJ4QCoRiCiZRE73m8qJmhCP8+BCUlQ?=
 =?us-ascii?Q?Yn0U0cdXNfA294sK1Yz7WAfk9h+eKEHC+ps+ciH2jTwlfB8UPlKcbuS84AeC?=
 =?us-ascii?Q?lsMcW0I3mS+KeeeCRVT8Bu8CBerYJ6IJSxcrsboSnge+UljdjhhJUambJCyr?=
 =?us-ascii?Q?X0kb/Mmnobh9EHiBNTOC74hLUZUt5Ry34tztF0KWe8XuPpw1fP8KX+9QI5tq?=
 =?us-ascii?Q?nMzZPN6LNZoUJsQhxmTe55w0lrkNkwJ0VuC3Kz6ClX8ae4J0M9EiWvLbgyRw?=
 =?us-ascii?Q?jn8qzErcLzLcibzbLQ35DdFDOeB8sTtabFSmj2d0O+SYHrqtzas+MFbzmjqY?=
 =?us-ascii?Q?g4l3/MeZz5UtecwD5oRtHjmX8OrbcQyQNvXmSNWg1YFC7Jlu2jeQOf3a33ds?=
 =?us-ascii?Q?RjYlSreYva3Fr/fgbT4ypQuvEg8A0WywcL+4PoMr08hLpS3nXIkZwK7Od/Xx?=
 =?us-ascii?Q?jImhxhBD7ZpjkfpDIzwMyRrnuVZBZp/TACblg1wq+Mzu24TkWPTqx0kjFFGR?=
 =?us-ascii?Q?PCrEMXRxm7euzI+QWzohGCZ/JrUktaIISM8sUmeTGQO1kbL9nMmg8jDMd3Hx?=
 =?us-ascii?Q?/3/SD93HpKtGHFKfMMBGpBmLuHvMf639arGzPLa8IPulJjt16dXwkWcgF7uf?=
 =?us-ascii?Q?yRPvXjot8WSvFS+NmfY3Q/iOPVbs7zgVD3xf+u2I/HRP+Ae33RsX5yjHMUkD?=
 =?us-ascii?Q?YOUN45okhsVXufsfCcmjf16v2MJOtqHBxgbpvJsU6R3ENh2xc7ue5hUpghnn?=
 =?us-ascii?Q?3b8yvPFTex3BXiesW8lwpYdlATcH87+GqXnTMMkrcPCPjdH30IRvCM7XVItf?=
 =?us-ascii?Q?3ybBen4y1c0tBAJAJQCUKDSfWfm84ATwYTC+JLOI7F4mlsgohwwzdTyq3yUv?=
 =?us-ascii?Q?j75psP1yZjzxaJGKZx2tQLqEprAVdo5G0fGl2R0YtGQFe4E/naBWeYjs5VRO?=
 =?us-ascii?Q?kdCmvuouDKHjtvtIH48eJ3p8TOnT5TSvs9/2VG6yewY2V3FDNn2uWkm2C56F?=
 =?us-ascii?Q?u7U827F5iqbgT9hOSM7YcMGXVF9Ou5M+5mpxvh+32kpBIT+vyJ+koS427BVi?=
 =?us-ascii?Q?NwMMFoeKp2fVwxGjZQXsPPdIQ4iO2j2QXpB9sxOrysJ8n+lUMhWDkiLwe04P?=
 =?us-ascii?Q?lWCP1cTKSHI5ZuT7wfVxKooZa9k3GdSlXzMBPSkmfLycNrvB9GGhZvMAJ7xT?=
 =?us-ascii?Q?AG2obvguQ6ZGl/2V6PQv/YiNzl8oSrFZsKKjyImLp/D10sFKH91nB8exH9Ze?=
 =?us-ascii?Q?5sT1q3KLlAlAL9GIyshG1PXOLvQMge/3/ZpC+VcPxsRivABO4Jk6UBx9Sz09?=
 =?us-ascii?Q?cCF61uI/Au00Y5R9u81jYpWC7fSwvseOY9uMIq/xAV+dxX3FNHrLm+SFibkS?=
 =?us-ascii?Q?oOX2OEuaFgEPu9ta65GljUi/BZICxtDcjpY7eFm+?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xGQyt9hDPeOke6TIisjl0wjCfRE/VU1KdQuAjj5/DEAsy1WkvjWnS1uieXeF+PrXZz6JnQOimqA7r+jfQWhsaxOh4sj8n+IXxGvcidT7PRkzdn3HA/hpuheBaP3Th9+BQ3Ps7jIYSevVvLIWAgDF5jrJGTCQb3eZROLrGepimjg2OhowkYoWrrzfogqkbJ8Ud32hoTFrZW3MN7G85dxyGgV14Hcq9Cif7V0lcLgK8VnkSIqq5KQRkXIJfzg/r9c/1ONvHr/1zLmEIFcOlWlKcXTIqM+ubzxofeGK1/ankrFmL0NgGNJ9O/15GTNUii2fxyPaT8YlW6jMNaXix4jS/wfTBa85Ijw58Wx1ZhOlmEbL9tyPfGPVVKoXGchCi2VV0MTL05R7aBrnSxdl1abKeWXLrp/Xc9oNUhD6p0hco4A1vsoIUFJWpGFb6XCBp0/QMjqtzc2EP3o9HJnwSb3ppQktf7sWk1Mda0x4UUxHQS5vtGpgj8U0d9z/NvFefjfXGoIPs+FLEAqg8htSQ9aDZMqkemYcwQVh5Zxi54zRelqCABUUFFrCL9s4sAtyx7LFFcwPLFDLRil1fghLPb2FnskG5a9rUHsAeJa0plhnynQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f53adc83-8ba8-44e3-5f3f-08de017161e8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 05:06:02.2896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uV5WYnkYb3oo9RbiYsNR9zrPQw4d/k438l5944ZTGBFH+nxBKOigEe0I4vHz9S9bqkCRD17X3qwdBEKGtn8CfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1BD38130F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510020041
X-Authority-Analysis: v=2.4 cv=P5I3RyAu c=1 sm=1 tr=0 ts=68de083f cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=hf2XDalEwU5rV5ktWIUA:9
X-Proofpoint-ORIG-GUID: kfVXsQEIt3BWyO5Wqkjsf7FQjuGzJmsU
X-Proofpoint-GUID: kfVXsQEIt3BWyO5Wqkjsf7FQjuGzJmsU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDE2NSBTYWx0ZWRfXy4L4Oj4qZHsV
 M038T12JBWqWxTiDQwx2UVG8pAuqaUdPOyAlJv70XPlUONSR1Yj6+6HXS+5FXiDcGkvIWAIRu2K
 XlFkFoKXBK5oD/PzhfHRmStctdEDAMaV4ABHyzzSPEMHgGg8DmA7igy4R8v3StORbJ1TBjnqo/e
 vI07e5D96/IGpT/yztWom8Nm4PawuJr8q4qOr1VeyUBkxVdtrF0weM2wEeZ0mhvEOajPYML5G6g
 8JAZdHj+R6i/pgvAdQpthBkvmf0nL6NoWN8MSjhjTliGw2ylzEAWT24NOV8jKfWSyUmm0CRJqFw
 TtsYANDBYwPcrxhp+hF09fjR/Q3uc2Pm3VrLLV19TDOzEYsqJGwRd98zv5XU8aKYSXSu1jJKWvu
 ET+DT3ZfvrV0hMsBK1HFTWTfeSuj0g==

From: Eugene Loh <eugene.loh@oracle.com>

Reported-by: Kris Van Hees <kris.van.hees@oracle.com>
Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_proc.c                | 12 ++++++
 test/unittest/proc/tst.exec-execve.r    |  4 ++
 test/unittest/proc/tst.exec-execve.sh   | 52 ++++++++++++++++++++++++
 test/unittest/proc/tst.exec-execveat.r  |  4 ++
 test/unittest/proc/tst.exec-execveat.sh | 54 +++++++++++++++++++++++++
 5 files changed, 126 insertions(+)
 create mode 100644 test/unittest/proc/tst.exec-execve.r
 create mode 100755 test/unittest/proc/tst.exec-execve.sh
 create mode 100644 test/unittest/proc/tst.exec-execveat.r
 create mode 100755 test/unittest/proc/tst.exec-execveat.sh

diff --git a/libdtrace/dt_prov_proc.c b/libdtrace/dt_prov_proc.c
index 05ad66346..f7e46a5af 100644
--- a/libdtrace/dt_prov_proc.c
+++ b/libdtrace/dt_prov_proc.c
@@ -118,6 +118,18 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(1)));
 		emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, exitlbl));
 		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
+	} else if (strcmp(prp->desc->prb, "exec") == 0) {
+		dt_probe_t	*uprp = pcb->pcb_parent_probe;
+
+		/*
+		 * If the underlying probe is syscall:vmlinux:execve:entry,
+		 * then the arg0 is already right.  If it is execveat, we have
+		 * to copy arg1 to arg0.
+		 */
+		if (strcmp(uprp->desc->fun, "execveat") == 0) {
+			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(1)));
+			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
+		}
 	} else if (strcmp(prp->desc->prb, "exit") == 0) {
 		ctf_file_t	*cfp = dtp->dt_shared_ctf;
 		ctf_id_t	type;
diff --git a/test/unittest/proc/tst.exec-execve.r b/test/unittest/proc/tst.exec-execve.r
new file mode 100644
index 000000000..09791d5b0
--- /dev/null
+++ b/test/unittest/proc/tst.exec-execve.r
@@ -0,0 +1,4 @@
+execve      bogus_direc/bogus_exec
+proc:::exec bogus_direc/bogus_exec
+exec
+
diff --git a/test/unittest/proc/tst.exec-execve.sh b/test/unittest/proc/tst.exec-execve.sh
new file mode 100755
index 000000000..d3f84e0d2
--- /dev/null
+++ b/test/unittest/proc/tst.exec-execve.sh
@@ -0,0 +1,52 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# This script tests that the proc:::exec probe fires for execve() and
+# produces the correct probe arg.
+
+dtrace=$1
+
+DIRNAME="$tmpdir/exec-execve.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+cat << EOF > parent.c
+#include <stdio.h>
+#include <unistd.h>
+
+int main(int c, char **v) {
+  char *argv[] = { "bogus_exec", NULL };
+  char *envp[] = { NULL };
+  int rc;
+
+  printf("exec\n");
+  rc = execve("bogus_direc/bogus_exec", argv, envp);
+
+  return 0;
+}
+EOF
+
+${CC} -o parent.x parent.c
+
+$dtrace $dt_flags -qn '
+BEGIN { dtpid = pid; }
+proc:::exec
+/ppid == dtpid && execname == "parent.x"/
+{
+    printf("proc:::exec %s\n", args[0]);
+}
+syscall::execve:entry
+/ppid == dtpid && execname == "parent.x"/
+{
+    printf("execve      %s\n", stringof(arg0));
+}' -c ./parent.x
+if [ $? -ne 0 ]; then
+    echo ERROR
+    exit 1
+fi
+
+exit 0
diff --git a/test/unittest/proc/tst.exec-execveat.r b/test/unittest/proc/tst.exec-execveat.r
new file mode 100644
index 000000000..696300e0e
--- /dev/null
+++ b/test/unittest/proc/tst.exec-execveat.r
@@ -0,0 +1,4 @@
+execveat    bogus_direc/bogus_exec
+proc:::exec bogus_direc/bogus_exec
+exec
+
diff --git a/test/unittest/proc/tst.exec-execveat.sh b/test/unittest/proc/tst.exec-execveat.sh
new file mode 100755
index 000000000..db68a5043
--- /dev/null
+++ b/test/unittest/proc/tst.exec-execveat.sh
@@ -0,0 +1,54 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# This script tests that the proc:::exec probe fires for execveat() and
+# produces the correct probe arg.
+
+dtrace=$1
+
+DIRNAME="$tmpdir/exec-execveat.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+cat << EOF > parent.c
+#include <stdio.h>
+#include <linux/fcntl.h>      /* Definition of AT_* constants */
+#define __USE_GNU             /* so unistd.h will find execveat */
+#include <unistd.h>
+
+int main(int c, char **v) {
+  char *argv[] = { "bogus_exec", NULL };
+  char *envp[] = { NULL };
+  int rc;
+
+  printf("exec\n");
+  rc = execveat(AT_FDCWD, "bogus_direc/bogus_exec", argv, envp, 0);
+
+  return 0;
+}
+EOF
+
+${CC} -o parent.x parent.c
+
+$dtrace $dt_flags -qn '
+BEGIN { dtpid = pid; }
+proc:::exec
+/ppid == dtpid && execname == "parent.x"/
+{
+    printf("proc:::exec %s\n", args[0]);
+}
+syscall::execveat:entry
+/ppid == dtpid && execname == "parent.x"/
+{
+    printf("execveat    %s\n", stringof(arg1));
+}' -c ./parent.x
+if [ $? -ne 0 ]; then
+    echo ERROR
+    exit 1
+fi
+
+exit 0
-- 
2.47.3

