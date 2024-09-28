Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2C8210F8
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727490141; cv=fail; b=fWcUMqah7tdLKbt3/vQPqZ8Uau3Huyg0hDjElwuokU8gV8of5oCS5yim5Rmrx3kH0EvdMIIn1sQ8w8Mm9PcgaOT2LLdaoIppxRxseoJLyjSoXa9PufFNe3/RAMkumjXr7ATQ8louZ5nbmgFdkA85qxulU8MRmAlvs4dPBquSDS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727490141; c=relaxed/simple;
	bh=NT/cPfEI1kiae59dzvyiy0dk+2F9nEMfWB8rzdKcJs4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UwuqRs6Td3Z+Cb6vyAKlX94LGy6lImMTJKG5qn6Wo5gg12yQvyB9N+YZIXm2YAS4DfnLDXCFzAN6pLuX6Ssn63jo9Sx3zQ9sktH9dVaaRk7sQXhbO/n+5b/T7qdre82ywiLWH7a/L3QGolkYRPNtt03OewHrmqThXLmeXkVuT8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oslaEgQA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=0OKE6/iy; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oslaEgQA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="0OKE6/iy"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48S20ONm004093
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=pJ1AjAbZgmg7YH
	sIAPS648gbKCUDyB0+np06HTnxPvw=; b=oslaEgQAzsID4QpAKcGWOHH2mfnaN/
	IDYHHE8gHA+OudCg4vhPO3FCebVuUFy0c5SXk1ARIbd5kWj8e0ICnu7hVUVzlfFk
	kmoZrl7QS7+q6zW38YsjN3CnkbbP7OZOiWMYEWJU0bj9YPUfADxbF9yzU3vxlCXX
	2bCVxOFYS2mD+rFPjLdhqOu6362LNr25TkEJOkVLLinzdEM69IiJR+D67oWKI9th
	BcLLg5whh4aKDLLeQB62pgB/oDnE8Ls8AZuy21L8kRV2xtoWR3ClsYsdVZqNrIHy
	ajzAlEIiKmq0CVAFSluQxKv86FCcqzir5NdkVwVlUdu5vgm3z2SajYtA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41x8k300k2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:22:18 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48S1XHgu028440
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:22:17 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41x884gpjc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:22:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWOOAM0ipeT6YQt2YUwu+6dGksaLPz1hUwno+k2NFOOqtdyEGZH6cflm6ib+xdrdvjAqcJh0K63jogZiXIL468OqF6usuf91K23R+DkwaHz+z+WeXtuZzhsXJUkxMeAdNiHwNG+s6iBq9YO5WRTqAqv2FNTVHOXN7qatoF/Ms4sbjFIh0Qpk3gEyg5+CsR508v6OSRZDKZZPQZR4BxGFwr2irGK84z1o+jEUMaSFj5Lpvg+BVbAIiBurWTZNJ63x/f3LjF/9Y1Rw7CQ9xEbyDqqk5bgA2DH9tZ1aXNWyQgSfV4HdT3ELUieLMdFEhuBRrgD5wMIEc7CeESF2pZJCIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJ1AjAbZgmg7YHsIAPS648gbKCUDyB0+np06HTnxPvw=;
 b=lq93zBCuyZWP8PRtGzy0bnBS1wNUH0FH+f5LykHs4eBMRcJsoKKSdHv/8f9V4YbmFVPQTQzzDK783TsDDqSj+p9D+0gZ/CzUAXrobQhKXBCpO+OQagLFkvWra1rhvJPZae4bJb6WK1ik/xyAfYWNjl+sPTVxEzftswH5E/Qo6ktv/HJbqsW8ZUWvEgsSTKZoEmxm3G/Xnfx4x7L1X3nt0SZp4zvyT0F1pOGZwaePoI+5qPcjOcMo6ueXrzA7JGBcdAFt897mm7i2TkLEzY84Qr0aEKF6XRbMXNwGcWdsG5uqd9ZJpEG7pazkWR5kZFSYp23mUnM7t07gYFzBxmqQAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJ1AjAbZgmg7YHsIAPS648gbKCUDyB0+np06HTnxPvw=;
 b=0OKE6/iyEGzM08Xryb4sf0YkJrlJThAc3S/ruu8e1RQrxj31T3Hk/QrsH0TF95qNPy2LvpR7T7ei+bxf/HFup6ymvR6wn+jTVkpdPzcQ93G/8GZVC45+MUVSYhYCz/hlTogYIOos+NfX2DJeqDJibPq/ESio+5FbzCqqqS/YlWI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA6PR10MB8206.namprd10.prod.outlook.com (2603:10b6:806:441::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.8; Sat, 28 Sep
 2024 02:22:14 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8026.009; Sat, 28 Sep 2024
 02:22:14 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/6] test: Remove some outdated and unhelpful comments
Date: Fri, 27 Sep 2024 22:21:55 -0400
Message-Id: <20240928022158.9206-3-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240928022158.9206-1-eugene.loh@oracle.com>
References: <20240928022158.9206-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0038.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA6PR10MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: a2260bab-a568-4dbc-9e62-08dcdf645dea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8mvhxDINgZDnMJvv1mPThsGo5PQgUiexdsLEM76cMwNTPUebwCOI2dMhoAsl?=
 =?us-ascii?Q?oTkxk3spHOL4G8m64StL2afxAfOvJvAJxYgYsYTwAeYbAN5BGwWCkSHtUCdo?=
 =?us-ascii?Q?GI23e7P5DGzooIKu1/Vl+LigfOFOVOxGinH3npxzyp98qpmuxHiiRihXKdxB?=
 =?us-ascii?Q?PGdrnk4hjDexk5WAxPqgQbMKeMkRVX/Z/lrszqN0DbR+uGzt+i5qgFp0VWnm?=
 =?us-ascii?Q?Hw29uKVhGiGq392Mx75deZtAIxeiIQjOGPE0FNYps/wkcAlFVxr5kS2gFLr/?=
 =?us-ascii?Q?0bZH9raRudhtT6Yu5FMC2b2KOJGeAkXw9IfkFA7DhwJQDZBSij/qfqPfOc31?=
 =?us-ascii?Q?FQ/tQye4rcJbyZpAptlKD8TOHF5lWDLp1a/1sM0fBgkFg0byOrbNt7D6mLD/?=
 =?us-ascii?Q?F0s2DUyWF2czDVD6JaD2qqHouo3zaZ5f2fgSdD5ofhPBsgky8roxyxMkf2eA?=
 =?us-ascii?Q?pIkzx6FE3HUa/PzVAc6aYosTPqrbJ9vfnREwFgRUJi481acLQBLBTttYAGML?=
 =?us-ascii?Q?mmIo9h7luxR2CNL4RKIQQMVNclzlfDVcwZvzG7cHfAj93n6ZYfhdP588xfxX?=
 =?us-ascii?Q?FeABIyJxLJ0nCSfDfs9lrNeOlNn6OsWdbSZkXZRRKRaiNDq7gQmL3Yl6/lHm?=
 =?us-ascii?Q?tNScjgg3l+ua2oQYyEsYqFg0uE++8NKwWgUG+UeX6RWU+8JBE+Wp/ZsLTZ4y?=
 =?us-ascii?Q?+9+v6oBzdzcV8vy7BpufsX3e6jC9oeSwnhX+y5DykIMKtpvHQMINiG9/ycpi?=
 =?us-ascii?Q?gyGYaH90ZYI9Yf42+0tsV0GQaFNlKfU58QdZqpxOBKgS3m0kEB2BT3aKG7pd?=
 =?us-ascii?Q?vHfscW5QbN03t1Wu+xkY82bw9XnTHgIsQoYV5oCGMhc7yjXnFAmEea2E4VDH?=
 =?us-ascii?Q?Q2jQHdv7UCK8P0DhhoaE6HLb+uEQEyfXwuxWwKZ+L2njcfrDNdTU9qyDyLS7?=
 =?us-ascii?Q?r0H760r+33mzRwUExn8f6iz9yc1cRJB67XiyiK3wGjkODrNrlbYjVyrLShU4?=
 =?us-ascii?Q?IRtfl+2mAlKeRM1d9PXBG7u17c+9BwH2QMbQYuXuO5zINf8uLxVj/sf3MBzN?=
 =?us-ascii?Q?UlisIraFp2mXTlxa/3qgzrcwFiPBaMFgSXDWpcmdCYp+UIfIrQ/uk8CX2xEs?=
 =?us-ascii?Q?UGhclSAZl7iuq5zjih/tMM8sWizfvkRqrj/mN2IiVeXLNa3XwS5SQovCohHt?=
 =?us-ascii?Q?uzsSHdtu7fVvW+fUswUe+wC3KZrAG6FMdP0Ck5VrhE64Ci3G1ooDngHJRV0x?=
 =?us-ascii?Q?WBv6W/Lhc8pN8DLXeNisCWpiQqc9bMsbHAHkMJnwSg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ez9/6SjYP5rWkEmEJID3H/ltokeRhYyLkFjpm04oAFxkuqUu4GpGb+j2NfcM?=
 =?us-ascii?Q?61IZ4ptbqWiT8gMSNQHowj7+xMTYmiWkxsmJh8s01HyCIEBJFoTi0k+6aYnP?=
 =?us-ascii?Q?OQkGQy77Ghco4UiSRDWXnlr/M3X9HKG5FnbxDwJMHQ2sCl+3MEDG/qYasJnJ?=
 =?us-ascii?Q?V4eWWBLgsLB3efDIrA4W4wVO35Ai9QXVKSNFB9cScywD7x+QJ3vuGIA9swMl?=
 =?us-ascii?Q?0/Uu3LIZypSlT8oUaomaYfLZonW8Akr/vyYyrjFtemjM+uMH8sz6Y1YecD1z?=
 =?us-ascii?Q?V7rsM1HiNPqK49mrk4rCq7obm4byNpxd3Ka0zcI/Avnf2L35876SNWCqd0y+?=
 =?us-ascii?Q?Y0gtK2FOsalB+Z1B45leWROpkIr5tKccSMiWpOrH41d13aBC+/aEcXmKx+B3?=
 =?us-ascii?Q?ajrb2XYsxZVQF0X1AHte1JhpqOvmdYuBrn4ON3gD7t82m58UNBZ+/mSe/Y6g?=
 =?us-ascii?Q?HWZIPTgnt2ppXHj2ckgfUjNP4FVdwjZE/X+tuZIjrTa5+ZZ7+ka43iTp7s0V?=
 =?us-ascii?Q?TWJTPPECKHPiDSs8fmXHshNEyG5CO9EixpUMbnEVcoGybr3z+XeH0EbcSEZN?=
 =?us-ascii?Q?rzxBAE0rUGyIym+u4cZ4shV0MXamCubveOTOh0SFYLPP6VyQMmE8tV/t1oWk?=
 =?us-ascii?Q?+zbomBngtIBoxAGLt67nhu39C5duqo6TBfj8usNd2H5iUP1J/2erDW3zqxzQ?=
 =?us-ascii?Q?Oc2hcJ0vjjiJfHdaTCWmofJL2mmkq72RXpQ2mPt8Wb5XlCf2W6Bcjp1pnsdj?=
 =?us-ascii?Q?Eedfp/0QShW6ZYAzTv1cKsvynsCukepVcOY76GC3DN9ISin5SbFdBqyDB2sa?=
 =?us-ascii?Q?ETX/BOkkQmSEFM5FDl/OQWoX3RPm5ELH0cYbwt7EXbiz+KNcGFZfbJdccQGi?=
 =?us-ascii?Q?DmI/cM6RwLf/DbGg2o46gjVmDrysJhhPJpcKUfy7OslIXnJP91piQLVb1KZD?=
 =?us-ascii?Q?gPNEumnmzAPYoIQWOlItV44BH13BysgywsBNUSonYoCt41ducncItZb2FqoE?=
 =?us-ascii?Q?aZuKQv+jgmBL4rJZgyJEpxFA8yHcKyxkXEsWYTQrkyEb1uAvrmu/sws+CiBM?=
 =?us-ascii?Q?jCLVrPVwlDEw5irfJvACLEtfED1wIGOV+032bRIW86qDndEG0jKMHfKC0vwm?=
 =?us-ascii?Q?7AhX7OXg8S5ztkXos6zHxFurHKvATW1iGLcIL5Q/z6UHoV5cRTSQVI3IqbTA?=
 =?us-ascii?Q?IIs2WgVHY9JdKA225tCOWJfyeE73016HJzKLiU9upPaKCu1WU1gZAqpXov/i?=
 =?us-ascii?Q?njW8xfXHAdRJxlvMx2eekLFyqqXl2Y4RJsjM26gevRUlOzKEFMeGoFksf5pu?=
 =?us-ascii?Q?iYX1+LPySYMnAEATe7sJopvkToWvSDb3ZmqJoU0qHbaq0hTbOdrYlDIrf+eT?=
 =?us-ascii?Q?BDvkxMfWp0Aw2jJ4QGizMK7aJYRQyxY49sD+jSgRkyFO8iZX/ZdlNGZ/79/o?=
 =?us-ascii?Q?J/pfkmnRTmT4O3KQJNWBeAGE5aatbiTosG++naINhX9z31qlO7CJ4v0LMVGM?=
 =?us-ascii?Q?6zjZE6FXgRC8IkrJcdeQlNsP/TWFGvKaNeRCMzEY0EOU7jy8wEj/+AjeUFj4?=
 =?us-ascii?Q?WVSn88yTmd9zzl8tYKSTCQ/NGhs2GRfTfZJuC722?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4tsfuZARHbK2Y6kJuAbms0maBjAUi+cryaxgswkbVTwu9hvJ114E1bIS20UraahhcFpsROOHb1Phb49dGxeOpQIMMqJVVr+c6q5M5Is8FAFaUIwmoDyATNwDvPKheykW/Ta+UPaBf3dtFlRfvTftOhhNZ1rctVjo5cIU330Ndvs966gob6QqpQ41cjYqVY5RoYmApzhYAlzrY/HyU+tS9ZwpRmT8xeeg2yUJHOGCeInIqU/a2RTU1iNKHM/XA2HCi+ze0qd14fFZvHQz9v+ZiL9u92D1/zYCXAIddY/tI8uezNLzI8hxgCVqT44/0GUvHMDMgT5Cwnebjjq4S1z/ZKq4Dd1qtYQxkFTpwGaIjHy3zS+zjT2q8WwMvVMEL3tLXMiclUQCrVW4ggU0W+dqlFUpMBT2NOnW59E5o//r3p87zNymmaVZ2lDd+oFcDxJIlbRjZ++PmafWdp17CnXv+TEKnd12H+1sI5G779Uj+JGsAzEaxgFbNFJ5qUsXIKEHM6rCdXm4UsQrAZ2Y26vY5EGWJW5psIOrf5eB5q/59H4wgwvqxl35QO5B+AfPRR3LJj6A4mY7VpN3XindlopSUKKTckPtgEDlFMjvwDhcz/g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2260bab-a568-4dbc-9e62-08dcdf645dea
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2024 02:22:14.7609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QuZNQDWfSKRIWmGrxMPmg9hbYMzVfr7cfqZyIbAiiXQCx8T5JhPDfSLFuSvcbBgaU34UAiElZvCM1Uy1HJLrbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8206
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-27_08,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409280015
X-Proofpoint-GUID: lt7dG1AmU-f1tLO8nC67X9u4998m8hIJ
X-Proofpoint-ORIG-GUID: lt7dG1AmU-f1tLO8nC67X9u4998m8hIJ

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/triggers/Build | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/test/triggers/Build b/test/triggers/Build
index 0e8660e59..db80b30ed 100644
--- a/test/triggers/Build
+++ b/test/triggers/Build
@@ -192,18 +192,18 @@ pid-tst-weak1_CFLAGS := -O0
 pid-tst-weak2_CFLAGS := -O0
 profile-tst-ufuncsort_CFLAGS := -O0
 
-# usdt-tst-argmap calls USDT probes (defined in argmap.d) using sys/sdt.h
+# usdt-tst-argmap calls USDT probes using sys/sdt.h
 usdt-tst-argmap_CFLAGS := -Iuts/common
 usdt-tst-argmap_PROV := usdt-tst-argmap-prov.d
 
-# usdt-tst-args calls USDT probes (defined in args.d) using sys/sdt.h
+# usdt-tst-args calls USDT probes using sys/sdt.h
 usdt-tst-args_CFLAGS := -Iuts/common
 usdt-tst-args_PROV := usdt-tst-args-prov.d
 
-# usdt-tst-forker calls USDT probes (defined in args.d) based on dtrace -h
+# usdt-tst-forker calls USDT probes based on dtrace -h
 usdt-tst-forker_PROV := usdt-tst-forker-prov.d
 
-# usdt-tst-special calls USDT probes (defined in prov.d) based on dtrace -h
+# usdt-tst-special calls USDT probes based on dtrace -h
 usdt-tst-special_CFLAGS := -fno-inline -O2
 usdt-tst-special_PROV := usdt-tst-special-prov.d
 
-- 
2.43.5

