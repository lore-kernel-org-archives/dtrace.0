Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583BC2110E
	for <dtrace@lists.linux.dev>; Fri, 11 Jul 2025 04:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752208838; cv=fail; b=Q/P5TmH+TnTitB47k55xksWUEYLpAmQ36Aiaf6sA2v54v4ZO0CQHWEHqYGBJT2m7mu1ze85uO5hYFkNvBRY6vbma+S67ElsKQnsK6KNCkc7yscyXAgE6EB/V3tg5O1q/1YhTnl+o1IqUGUbJgGaJnic7Ak9oYH+z6+3ekDo6wPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752208838; c=relaxed/simple;
	bh=T/EQX1PafRKmboUdOBx1wj0Z+6eoYu8GNchwuqVflSg=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=CYpcsocFMavXZ7TuLpm/gXrlYg1/qL9Gz0KEGlWfo0RGHen2qh+VwTnlMzyF7bguHRKbcxmRYcsF88MsQqXpFwOtXiF2sW/Ua9mdWt19rMHKq30gAnJnjikQI8WICZMSu+FADodZkRbUPWMzfvqTZTdfilRQidbEuoy5CnTbnfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TWFH1EJT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IBtVPu9I; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TWFH1EJT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IBtVPu9I"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B370kW013343
	for <dtrace@lists.linux.dev>; Fri, 11 Jul 2025 04:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=0ZncidrU6SfMiriIEM6+/UeWPPfQrjCcbxGIdOaEGrs=; b=
	TWFH1EJTcu31lfL1zQlDbEDCuvEzdXmrzeKK8s+xc07U9w0uBRRw/xEd8ilz2yB3
	MK//Z9A3lyX9GLzl8aQFfUHVxOB8XZQE4LfCDOI+1V1glSmR90r6GEeSRB2kqSaE
	IIX3hZo2hAc7FDs8LHGSWqp74Z/PQfJ9ehXFcAyEvCPTDwpfu9Uk5X5QL+4rqmnX
	IimcWxsCptzYrZfTcKHzK87oYz+pq4XyfPZY9Qol8c72KeRRuIGQL834BGjs3q1o
	yvE4Q1IHZbfKrv+8tYWyffb0BxwFYMkxxZC0rYys8BwF1xQgrzyxeO35F/53Wigv
	M12BRdpqd/b3fKlzBco4wg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ttdug273-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Jul 2025 04:40:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56B4Cgti014264
	for <dtrace@lists.linux.dev>; Fri, 11 Jul 2025 04:40:34 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ptgdvmsu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Jul 2025 04:40:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W5qBTppCM1ub07KulK5pKRkcsEBSss3zDYpfXzmXva1YgBEAHHoZNsjxISCO01L8tRuv3q9s3Q6Ku3vn2qF6u4I6uVuY+GuRyghkf+l5MiN1A7UcGV5TwlQKUJaJ1/I/s0ppcAzCNkXYx5zpmv4NdBh7H3DcBq7n0dhQ+1unkP6vX5EavVjpKRJjpPfdEed61yPfVwn28l4gyQu6JGlRpTv1SIwCV9d/Raz5Qi0jho30kX24nUneF40Z/bBsW+oEoZ43t0n8wWFauIFI+6taxZLtBOQ4CHHxIA2D/gCxg6k3P9BrWyE/ZSHTg/M4XQWJ5+4fOojYN36olKO5x7hTsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZncidrU6SfMiriIEM6+/UeWPPfQrjCcbxGIdOaEGrs=;
 b=Htt4jBoBWUSFo1807v7Ep6N8sy9x7+z9XBgJ/tuuk6wotqSpr9BodnuH8kHbK0tm38prjfIQB893EPyxigVd7wa4bjVaAPdg9KyFAX5b8AFjESvZe915DZ3YhYANpsAorWHXGoKt1xuPJdROsfudTeJTIPf1WY+NubAN3PnWbnvm3PPq88/qOnAKv3j+Ox+NoyQkennS+KtUilQo8bpKBj/W4BTiTASdmZR/MWFz6Jn1Yr7Ge2YU7YEtNVDaLppGmdwrumoXJ50oLmbfVOCSbrrfkve/vXcYMfQt8CfLiFgc3sGvAQRZ0NGwbRSHIG1GBSs1C72tQ7oZdzTFMs+/Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZncidrU6SfMiriIEM6+/UeWPPfQrjCcbxGIdOaEGrs=;
 b=IBtVPu9Iy68AkNNNKFxzjtTJex9hEqZlDidSmv02u9CV99gMGWG1yhows79gZlhsmZifMo+E6FuoKUTTKYtFQJ9uUAAm1VEcjvblVmWIYvNUUKvX5WhQj700CocNJv0XTF8je3sm9uk7jcodOtcmgBws0ytVAFqfyVmANtz6kqk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA1PR10MB5887.namprd10.prod.outlook.com (2603:10b6:806:23e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 11 Jul
 2025 04:40:26 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8922.017; Fri, 11 Jul 2025
 04:40:26 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Need -w for destructive actions, even if clause is not used
Date: Fri, 11 Jul 2025 00:40:24 -0400
Message-Id: <20250711044024.1587-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH8P221CA0008.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::35) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA1PR10MB5887:EE_
X-MS-Office365-Filtering-Correlation-Id: 9542f133-2298-4b28-c8a7-08ddc0350e52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M8jZg98ddYB4CKE8TUNuEdgop9dWw3iEfP1dbGn18viR1MtBZteKzmSjcG4x?=
 =?us-ascii?Q?PgI85DzqJFL9+aQySj9L9IHhixgVOfzgNHBWZt4sE+fsg/0hX0geboYaaZCb?=
 =?us-ascii?Q?LZCyPZ97sIaZ7iVpFrlFUNCzGcJ2XB13XE0SCC9jVi4ffhycpypquvneivew?=
 =?us-ascii?Q?rsafjeV/FgNBz1AlE6wtaQMwpst8SBIhI8Z3DEAYJaKjW8585/Uc71llQrkH?=
 =?us-ascii?Q?cSkb2HlXFyhXwIgCMLyvjmIOQv7832X8p0gYq3HC6m71fiHTopiplnufJaMZ?=
 =?us-ascii?Q?uw04V93HBdVRBO+KUWgk9yrv+Qk+UnFuXzMMcPw81gRdwC1pfQXm6Bjj/YyE?=
 =?us-ascii?Q?ayhbsS81Kcnvg68lNSv2Ab2wP4UMmer1ecnGbL5f5ZxargBiftQcQ72YYaUw?=
 =?us-ascii?Q?GSA2EGr2mpZ+kI14xPeCZf27ouefx8u++xPX0N7IsYsdrzHDm9+P9bBsGKkg?=
 =?us-ascii?Q?ElpSBGsfn/lu3/9REY3duQVFqiX8BsmJVzH9egj49TIPHWySqF6wSopi9QzH?=
 =?us-ascii?Q?ab39WkvmyvT2gksjP307djfX7HCiGWj/xUnvWGJHU2CMq3t8WGCW6De0kvxe?=
 =?us-ascii?Q?EF0ZVfy8vlZuXtr8drcmDxXhjR2LWz4XgcmLjsOO55r9o3f3vqYOTguX/nuf?=
 =?us-ascii?Q?a6AJkfT7CLpyRmAKsclSF2GLC7MKkPkSASCghNL1DjS95021BZSt5oJyfctt?=
 =?us-ascii?Q?Qt62aDTOTOXkGxzdSg1Bjlv7+BinqJvaqU75cuIJM31CWHJNNHfqk81Uc8Bf?=
 =?us-ascii?Q?YNaDEzDNrncCyjFh9xGxna1vU1xgudbJbwsHMJlAG56IELlaL5J7q5mm6MiL?=
 =?us-ascii?Q?uUqCPE91NS3wBTP5kRAeNT3MTODmyoHznh18yrL/+dJjwptk+Wz9QRiN4R5X?=
 =?us-ascii?Q?oCNjFz1cJDMApGGBmLXMwAmOeFm18/PMp1ThRhdWbHOlKjn5rp3e3CncrerO?=
 =?us-ascii?Q?JV4k5HXk23gL/lFoCYo5XSqRgrKMCn6xY80MeP1cQvQIF7cMpyZNap7xn0M/?=
 =?us-ascii?Q?qbdMkjtXr8jeWmqQwKFIsYbIvG8iAsI6N5lDyrQApb16n32O/6kVa30EUld+?=
 =?us-ascii?Q?wCdj6JRMxrK9R9PF4KlB5Yu2A/b8bX/7Ujg2duVXuI4SYrk7Ei5QCgSKvxFO?=
 =?us-ascii?Q?8wzeuPRrtS8AOG1hWYWCVma7cla92rfMAqAcPOARrOcN/S5Rqo1LwnMSRyX/?=
 =?us-ascii?Q?LZ/BjQjqNTo5LHsPh5sQC0n1+0olFZ0Fotw9E+zoXeK5cISuwmf+Z8i4W3b5?=
 =?us-ascii?Q?ORF6f7ibvOTw6+Ew6iL7elgJWm69rDHHTld0sZrXfal5kJbBYmJVBjyblqxK?=
 =?us-ascii?Q?XJO9hBtU0m23u2c07wUe4tI0iIZC/MiOfB0Em3ISu+3mqLRa+cTLJMzUrR3E?=
 =?us-ascii?Q?nC0nai4VdOrG47UPjNNFQJNy73homYxHf93L9heF1kEIyg4D98HSLHxuSNcv?=
 =?us-ascii?Q?+Irfbrmfuzk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZDtB8u6H3/HEwiUO07aViNzSZcgmLG4MQLgk5qJxBa9jWddMrAP5wEAVTMva?=
 =?us-ascii?Q?aniIoiF4ZD5/NY4jwInkUabiW8iDE1z62cUR97XmxlVz1SWZj/rQOkevfNvs?=
 =?us-ascii?Q?cCdEuTQuDWxR/AgIaF2luxoeS32JjByPP7w+0Jh16cjUs9Zf83YZjHkDqrfr?=
 =?us-ascii?Q?so2Dxs0NAp+AZqSezcY8LV7umSGQeIIxGbJWcS92gFevdlwsKLX/UaqYJQUv?=
 =?us-ascii?Q?r9EbmSXNuF7AlRefAE5byZ5gXIMGNLuwAawTIXOeUCA0AxYbFt1uizgMbAmm?=
 =?us-ascii?Q?VQvkyyNNRAijRHSH6w+gMmb3paAnB6ozhzMHAo6KOq6rTwHXZoPRu76iw5Be?=
 =?us-ascii?Q?bUhr3zVsG5y6jGzK5+luG4Hjz56PR+75MGhOA4kW3qUUPjwoyEKbsLTdjzMK?=
 =?us-ascii?Q?+etZVttmPQgDFcm2Df7IEa4zpXqQLgqFhwZ+CwxK8ed4IN8RnkAG8YGcLprq?=
 =?us-ascii?Q?kzoZ/hBNW+a8H84nwkM9o4jJI9l2ntu7zh4b7J2VUaJwo8BUhtr2o4wP0kPh?=
 =?us-ascii?Q?dOwSaW8x2Kid8imk0J9oJExhd8KyXfHosmiWVGTS4RdgcFXX2w/5QXZSyHH7?=
 =?us-ascii?Q?906zpNxLI6iuImNQlzmVw4msm1Iu6QDVTRsFbKjIFBYiCqXEvJwj5c8F6NU0?=
 =?us-ascii?Q?8vbsEoiigEMqlNSMx6DYGUNEeVtGIYzhabN2QNiv0FUcdZT3q+i/Z5+19sYg?=
 =?us-ascii?Q?vb5jC+ituJzeDKZlEFoH3H/GmhNRb7kaFV6frWVq8Im+C3wAuq11+8WHmnKS?=
 =?us-ascii?Q?Nllfz1G0CvkrtegK9l6w3XM0qAqCkeounjpTYz5CnVzAz6zyxMQv4M6Bti+b?=
 =?us-ascii?Q?BBr8qUPAqyE29+tLMhbj35yrp0ac9h/7nMWrdn2gaG3f6GL4Ul2WKd173qzd?=
 =?us-ascii?Q?IN7XlN9iQC9juUygGbteI3p+a1/M9aPi6bBYYAiQth9DwUylkZIEKxdUyHrP?=
 =?us-ascii?Q?NrYGmO5imjTv8YCVXCyp2YHBifSWuPt7mQkM7kGBoGDrDypA+MAFxbjjMQk4?=
 =?us-ascii?Q?KIYRXLIW1cLrQgnpvrgMEpgg5RUl0Y+VaE0hwVgooblVDVwu1trEwtXfhws9?=
 =?us-ascii?Q?x3dPl/Ei9C8TTvw/lQeKNaaNfPgU1fENFSFb+7OpG6X8K4T86kT5ozm/DqdI?=
 =?us-ascii?Q?L/0SYWe465hXJ2xiKX4MF2DFBRZZh8WQ1+9Kb8KmRQbgQYuNIjevdLK9i0WQ?=
 =?us-ascii?Q?4u7Z9GnQel1BNYwUVQKzLKDnl+WXm1TB8Hcd977xWL0G+mtfToe9NEKwkcWU?=
 =?us-ascii?Q?hjNM8ji2zWhdYD6cCgUhyl9yCOMHF34PP518TVXfODXzuDbmWaO5/0/EspMC?=
 =?us-ascii?Q?64/4M8/74F25wo4xTGfDdh2MAyTbX5j/cQlyYjnMzyE8/9FGuitlpLOVbwh5?=
 =?us-ascii?Q?PX3pdtV259S+w7urZJzF6l9vdTikxtBwgCmo9f+MpgkoEAsf2Od0zGLHkhIY?=
 =?us-ascii?Q?Z+y7wtjFTTlQoqMj3dB3Nrqyc8Q74kTunkftcyq3LjD0MlZs7gIgZwXyPzQI?=
 =?us-ascii?Q?jCoONIx4+72J9ir9/yYNoCz2dtv64pTpY2/9Cvl8OOdC54NB5kKmMrcBm2aU?=
 =?us-ascii?Q?infGR9Nld6cwpvfez5Yni77Mru8Yv+3cEau+kV/s?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	z8ONxY7vM1JlfY13nGnnGLAYmfV62EOBd5syt87AqGdpARU7gh9gQXMmuNX/DcFtJOTWPIFgm7a4k6AFIKlnIx2o9sN6LDqManBf33TgcL5yYDXqYlK86DiycFS4T0pnQ7lAfbuxi68GSKCOWq4mR+WLUdY7B91byC6afsNmZbcS9kEU87Mkcm+lhvNA5CFBk7bQ4RgR4GisxMe8uzipqbXT7gM8CuoSXcRj4xb3FBoNo6At0LkEhs2Y3cGZPcpk98yI7j+csDYi58hX12xHn9ww9q5Q68oOb9TiwhuBySRjC2mJZquNVU3unfcFX0NNSipXK/KbDfcVlqkN25W70xMN65Q1vPzAv5yRPcDSk5qE747F4rUJBhGPFNFKGJweADCMkJfGvxlNRVG7YQq4ooZmcG0kQkAheTzaHTRSx+yMN8lz6Vin9Iot5NNKL2m0ZStpQY79Pt4tZ05FfFrux+KTx3sJAXR9k+DyZsI38dZLRAXnAWd7eG1ILYVYVdweI3mCWu522nurp/8zJGniNgAxq+Lyl4Lexu5bQFCDdarq+MzneB4juxVN334N1XCwC7UEo03nuL/xmaWCk7sjz0yCFowniNKGY9jpVziiIzA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9542f133-2298-4b28-c8a7-08ddc0350e52
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 04:40:26.4096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMyd/0JvXDdJEKPLA6IWL4ES/P75tUz/G+mC5FcK5QxPYsviatRxoK4ym2Gk1jewGZHbowRexVRfamYCwUa88A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5887
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507110030
X-Proofpoint-ORIG-GUID: V2lnzn3KngGoq0uNSsIO0ocWO5fUeFhP
X-Authority-Analysis: v=2.4 cv=T96MT+KQ c=1 sm=1 tr=0 ts=687095c3 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=lb8mcbRyFir6xY-D:21 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=u-IsWzi3DQYiqw6rGxIA:9 cc=ntf awl=host:13600
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDAyOSBTYWx0ZWRfXxbDTXRD+G74L 2uNBTL7opKyzX9kfvTv0AMr4S4dFUiqEeUZIxLEssNaWeOX8zRbY1wwo9WCfU2Jt1YdTBOJ0Wd5 928LxMD3GBsFw0BqKaIE5Q6Gp3hfBlohHWnElch23m1/wdblVBV05Et03EFPLl1XOP0btz7qtNu
 bV/yM7anJB+7efa+T4lspSyV0w4MQ0E4mNe1jp86zBXgvD3/mGAn1RScnabWATHmh0MvCEvlTF7 4vrmxxlJrMo15aguvZsIGJ1W5xmqtgzkOob70GSoR5W2TW8umVhALvlML14Pt5S0VgRQHuuhon7 pCSlGGZcs7O9+dbDVUUzh6HbHVx6LC9s68KHEiUtVM51UcYSirFr8+DW5KtlGvXpVEiA2K8RssK
 ghPvmFE+j1eUVNgC7Ryy51mWvZoQHtGzisefOpy3tFSt4gpiHJWBUoyqE0T3pli+lnJO+bOQ
X-Proofpoint-GUID: V2lnzn3KngGoq0uNSsIO0ocWO5fUeFhP

From: Eugene Loh <eugene.loh@oracle.com>

If a clause includes a destructive action but -w is not used, dtrace
should not start up, even if the clause is ignored (due to -Z).
Solaris treated this as a runtime error.  We should do the same.

The test err.Z_no-w.sh was misguided and is replaced by a more
direct test.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_bpf.c                            | 14 ++++
 libdtrace/dt_cg.c                             |  4 +-
 libdtrace/dt_impl.h                           |  1 +
 .../options/err.no-w-or-destructive2.d        | 25 ++++++
 .../options/err.no-w-or-destructive2.r        |  3 +
 test/unittest/usdt/err.Z_no-w.r               |  4 -
 test/unittest/usdt/err.Z_no-w.sh              | 76 -------------------
 7 files changed, 46 insertions(+), 81 deletions(-)
 create mode 100644 test/unittest/options/err.no-w-or-destructive2.d
 create mode 100644 test/unittest/options/err.no-w-or-destructive2.r
 delete mode 100644 test/unittest/usdt/err.Z_no-w.r
 delete mode 100755 test/unittest/usdt/err.Z_no-w.sh

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 4e7618e05..e2c3bfebc 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -1286,6 +1286,15 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
 	 */
 	dtrace_getopt(dtp, "destructive", &dest_ok);
 
+	/*
+	 * If we have any destructive actions at all and -w is not set,
+	 * error out.  Solaris would reject this as a runtime error.  So,
+	 * although we could have detected this problem at compilation,
+	 * we mimic Solaris and wait until now to report.
+	 */
+	if (dtp->dt_havedest && dest_ok == DTRACEOPT_UNSET)
+		return dt_set_errno(dtp, EDT_DESTRUCTIVE);
+
 	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL;
 	     prp = dt_list_next(prp)) {
 		int		fd;
@@ -1304,6 +1313,11 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
 
 		DT_DISASM_PROG_LINKED(dtp, cflags, dp, stderr, NULL, prp->desc);
 
+		/*
+		 * This check should never fail since, if any action is
+		 * destructive and -w is not set, we should already have
+		 * failed.
+		 */
 		if (dp->dtdo_flags & DIFOFLG_DESTRUCTIVE &&
 		    dest_ok == DTRACEOPT_UNSET)
 			return dt_set_errno(dtp, EDT_DESTRUCTIVE);
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index e1bb59289..0e0648969 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -1833,8 +1833,10 @@ dt_cg_clsflags(dt_pcb_t *pcb, dtrace_actkind_t kind, const dt_node_t *dnp)
 {
 	int		*cfp = &pcb->pcb_stmt->dtsd_clauseflags;
 
-	if (DTRACEACT_ISDESTRUCTIVE(kind))
+	if (DTRACEACT_ISDESTRUCTIVE(kind)) {
 		*cfp |= DT_CLSFLAG_DESTRUCT;
+		pcb->pcb_hdl->dt_havedest |= 1;
+	}
 
 	if (kind == DTRACEACT_COMMIT) {
 		if (*cfp & (DT_CLSFLAG_DATAREC | DT_CLSFLAG_AGGREGATION))
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 1e105b6e9..cdb222b3f 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -431,6 +431,7 @@ struct dtrace_hdl {
 	dt_list_t dt_lib_dep_sorted;	/* dependency sorted library list */
 	dt_global_pcap_t dt_pcap; /* global tshark/pcap state */
 	char *dt_freopen_filename; /* filename for freopen() action */
+	int dt_havedest;	/* have any destructive actions */
 };
 
 /*
diff --git a/test/unittest/options/err.no-w-or-destructive2.d b/test/unittest/options/err.no-w-or-destructive2.d
new file mode 100644
index 000000000..eb9365fea
--- /dev/null
+++ b/test/unittest/options/err.no-w-or-destructive2.d
@@ -0,0 +1,25 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Without -w or -xdestructive, destructive operations are not ok,
+ *            even if a clause will be ignored since it does not exist and
+ *            -Z was specified.
+ *
+ * SECTION: Options and Tunables/Consumer Options
+ */
+/* @@runtest-opts: -Z */
+
+BEGIN
+{
+	exit(0);
+}
+
+bogus:bogus:bogus:bogus
+{
+	system("echo ok");
+}
diff --git a/test/unittest/options/err.no-w-or-destructive2.r b/test/unittest/options/err.no-w-or-destructive2.r
new file mode 100644
index 000000000..1a6959475
--- /dev/null
+++ b/test/unittest/options/err.no-w-or-destructive2.r
@@ -0,0 +1,3 @@
+-- @@stderr --
+dtrace: script 'test/unittest/options/err.no-w-or-destructive2.d' matched 1 probe
+dtrace: could not enable tracing: Destructive actions not allowed
diff --git a/test/unittest/usdt/err.Z_no-w.r b/test/unittest/usdt/err.Z_no-w.r
deleted file mode 100644
index b81622481..000000000
--- a/test/unittest/usdt/err.Z_no-w.r
+++ /dev/null
@@ -1,4 +0,0 @@
-dtrace is running so start the trigger
-dtrace died as expected after trigger started
--- @@stderr --
-dtrace: processing aborted: Destructive actions not allowed
diff --git a/test/unittest/usdt/err.Z_no-w.sh b/test/unittest/usdt/err.Z_no-w.sh
deleted file mode 100755
index 4f129341d..000000000
--- a/test/unittest/usdt/err.Z_no-w.sh
+++ /dev/null
@@ -1,76 +0,0 @@
-#!/bin/bash
-#
-# Oracle Linux DTrace.
-# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
-# Licensed under the Universal Permissive License v 1.0 as shown at
-# http://oss.oracle.com/licenses/upl.
-#
-# This test verifies that dtrace will not run a destructive script
-# for USDT probes if -w is not specified.
-#
-# Specifically, the script is launched with -Z and no USDT processes are
-# initially present.  Only once a USDT process is detected does dtrace
-# fail due to the destructive action.
-
-dtrace=$1
-trigger=`pwd`/test/triggers/usdt-tst-defer
-
-# Set up test directory.
-
-DIRNAME=$tmpdir/Z_no-w.$$.$RANDOM
-mkdir -p $DIRNAME
-cd $DIRNAME
-
-# Make a private copy of the trigger executable so that we get our
-# own DOF stash.
-
-cp $trigger main
-
-# Run dtrace.
-
-$dtrace $dt_flags -Zq -o dtrace.out -n '
-testprov*:::foo
-{
-	raise(SIGUSR1);
-}' &
-dtpid=$!
-
-# Wait up to half of the timeout period for dtrace to start up.
-
-iter=$((timeout / 2))
-while [ $iter -gt 0 ]; do
-	sleep 1
-	if [ -e dtrace.out ]; then
-		break
-	fi
-	iter=$((iter - 1))
-done
-if [[ $iter -eq 0 ]]; then
-	echo ERROR starting DTrace job
-	cat dtrace.out
-	exit 1
-fi
-
-# Start a trigger process.
-
-echo dtrace is running so start the trigger
-./main > main.out &
-pid=$!
-
-# Check again if dtrace is still running.
-
-sleep 2
-if [[ ! -d /proc/$dtpid ]]; then
-	echo dtrace died as expected after trigger started
-else
-	echo dtrace is unexpectedly still running
-	kill -9 $dtpid
-	wait    $dtpid
-fi
-
-# Tell the trigger to proceed to completion.
-
-kill -USR1 $pid
-wait       $pid
-
-exit 1
-- 
2.43.5

