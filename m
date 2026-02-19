Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E17346FA7
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 15:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771516581; cv=fail; b=WHt6kPgy2FyK6dVBBg+txh0arEr9WqlZvUZ0dKH+qHss73eW4bCHX7kxKtvro14qDg5PAq4c/yamG9nkRvGgeuTS7Gm+isbXpvPBWP1OVojNfDyXRTo5HkC4/qeESNrNqq48B4TMo9riY2mgI/Dj8GKNsr8C+UUGmO8Qty0GUJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771516581; c=relaxed/simple;
	bh=LLNa330h8Ji4AAvtCu5raM9rfO8DHkgPiLYJWUiVOJ8=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=An0DMi6jlDlthKWhOj87poffF5mMTxtMoqXsxbHVb9KMc3RIuHA0LUB+mheFFjapJFdDoGvg3NBBUP4S6bCZeU3pPXw5i3pi2AtCOy/jm5jSbXE0egPRpYKPF0fjZEIODDFkdUuR8l68/K1ABORxnq4okjvMLLgD3eUWefqjhEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SMM/wXis; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MrR2ag/O; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SMM/wXis";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MrR2ag/O"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J5SdoF3789122
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 15:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=sm+ivb70ASJkWoJoL+EwR4gE7UjDQZ2RKfr1u3JsdxE=; b=
	SMM/wXisJU84zcdqmBF0HO9V02Nmyns7EErHmQgnxyEMu6o8u0q9/f6KqzdlPd0M
	jVxPS1q53COBt0bbjcCkB1aUqoTBx45VSLeeI9blcW/2+cUlcQOGjE7zRWa/EtWs
	4vFeU5Ijs2T3e2aUITvWfeHxBr1aXsaLqbZlxpG6ybZOQv00Jc5NCfyBTKvegNGD
	QakoNHbxHhyNxf0hxQT3LVqw3AGob3Iwn+VUvOxWGh0dz7UW9PgHaev/2XAUtBOq
	nbyv7u5GLD0L6QiG83junq4mPJ1zJxagfel+cG8q32JAFE6LKEARoXiX+w4sGe1D
	TW0o9BoAGRg2O/0KOi4gzg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj5r7pnp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 15:56:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61JEbFDk037209
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 15:56:18 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013014.outbound.protection.outlook.com [40.93.196.14])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ccb2a4cnw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 15:56:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFb6osJvwBfk6ybaapZoWkW/5IFgoArKBeW4YlS9YjOlXM3YDpjw+OA5YVaTutPIX5oHNCKVCUju26DSKcK2ORqNvTicFnC4nIfpK/j3Vn8ZGrostyWALqXKENvfgUJwI5StmZgan9EwDN7NOp0m9g5W1oUIIx+HVGHN43a5U9AQy8Xcq8FE+/BO/H4lzU0JpMSVdw0m9ck8/+AHFxbPoQ5YSESHUnxywdrU4t6N5fWsOfJJcSIfdlebbV6MNktXtWhZsw3w2XGQh6JmBLC1wqkJ4EnToOB/u5PQf/EdLjvaUSjkJxT7fgfHo3bLvcESMc+WMJN68qYvp0iXAxpTLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sm+ivb70ASJkWoJoL+EwR4gE7UjDQZ2RKfr1u3JsdxE=;
 b=bbQZxfPMJf+FMpSvgXNjCzCP1CGGOG8mTT3/qxzUTd1kvwI83dBBfYwIeU+Q+cl/uuMRkPmaQTB6lYQdqrYdbIOmVohldYhSLHFQ13tAGX4z9KlSAKdp33sAC8Vq/zTnEdAoDXVn0JEH0i8B/VLrJRe5jtbrjd4U42ASr/SpIsdJqlQJEp6aMPVKa4mvZON/2aCF3Xkqor3Ep6b4U0TBIzDeXZMYvXUKbuBzzgd/MEADknPqmV3t0m9asvUgiUp+eyjFNZPE1l+DUByTzVp+9PWC7NWmjJeUOxXWZ3k347d52s00f9ZlRhGlfqkGmaHb8Z4fuSsVzDJ8JQoWs9INoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sm+ivb70ASJkWoJoL+EwR4gE7UjDQZ2RKfr1u3JsdxE=;
 b=MrR2ag/OCnemE3HS688YKxALouol3/VVVoaEaQZvISQxJvXUucpiMjCovBpcLwEjSSKOMOCDKZhPr0iY3bVQ6FvNVovlKqlq62fV1i8O9rfEXxePE658FK55vasM867+aTzd3rqy0+kyHLZfjO4PFjFM1NZpB8edc7oyfCMIUBs=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by IA3PR10MB8395.namprd10.prod.outlook.com (2603:10b6:208:57f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Thu, 19 Feb
 2026 15:56:14 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 15:56:14 +0000
Date: Thu, 19 Feb 2026 10:56:12 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] configure: add support for
 --(disable|enable)-dependency-tracking
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:208:36e::21) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB752215A59CAA79B00AB329F6C26BA@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|IA3PR10MB8395:EE_
X-MS-Office365-Filtering-Correlation-Id: 42a54470-642e-4a0f-576f-08de6fcf68b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QCrBb5Wk7/Qg3jJqSeraDENIRAXTA+g9YnrPO/ym915J51bArIkaeuPp3PYC?=
 =?us-ascii?Q?vzOp7BWtEnQrWIwR4aGQbouzh3TujHma86/Q7bwAxk5oeThCUYihP236/fj8?=
 =?us-ascii?Q?rVga7KyIPwbl8g+Ut4y3J8JjmBcwkTM1onbAY34XvtZWZCNk3w6viKcPFVfb?=
 =?us-ascii?Q?wJTWF6KtrD0FqizRzvZSW2BpE81qu6G5GEeyidZ/xNgr2M/MyewTe800t73l?=
 =?us-ascii?Q?z+GzmjqcFQ+48aiinU4Kad04jsst6OSL8iTNHHZTtnShJzv2Mf0S7p79uBbp?=
 =?us-ascii?Q?m9u6TEIsoXaLQzMy3wV/A8z1VL7h68luIv9t1UmyZQefcauCCW/bBlgFojHy?=
 =?us-ascii?Q?s52hjPNs6EyyA7lQ8O/KRWa9C7jgVEQf6u0aBliYRF9nuDxA5dolvU+fh9iJ?=
 =?us-ascii?Q?xHOm8UR66P5Eg1mgt6AL/m9NFkQdiQavODUu6OVJHxxP9rWZ4BxB1x2DFcpa?=
 =?us-ascii?Q?8xhhancy/iceFGKlGlwWTXlmXqI7aCv9ewYESDQ12OGbSjJyozcEiAqGW1Fb?=
 =?us-ascii?Q?wd4CWwpHC/8mUSziO8kZX3smIfI7X2kGNjStjkzEW0X3IxDyWwa7bQGMIFYr?=
 =?us-ascii?Q?bnQnfYrJCokXnhAePITmdSvkwjAVPRYiONU32odBbZ04OUAtssj0Vl+T4pbF?=
 =?us-ascii?Q?1V4j+h1ezpOxDVBi9GnPkYj4XpdoPBIzLR+qP9U6e0zAzsklXs3C/lyVYfdG?=
 =?us-ascii?Q?PAwCPL18G2pQrG//xH9ts8mWM1HoMB+EtUYz9mqGnMsrKk1h2jdoiw9quENX?=
 =?us-ascii?Q?M8psyq/JBiMP8/tvmtUqLSqQZhNNtax5DzrkBrQXngg6zEiGFpcIHs3wZtHi?=
 =?us-ascii?Q?Vwgwr3rSHbReKmvzfvMiazBqj4OhMhFWzm2J/TLr0G9cwD+jcuSnMf2rOJOd?=
 =?us-ascii?Q?jhBVAlWShyfJx4ETvIGp/iAOPjXm4U7OfDgJEy7L28w/DxtD2AZlc5vQOEYa?=
 =?us-ascii?Q?MYssYGluvghx66FiOzX9/OyFaAt7hb7f49Y0oHUkORtslewwsX/ieBgJQD9V?=
 =?us-ascii?Q?wSEsZTM/CrSHdaKfLmIb+MdEK9/Hf1aBoe5wAoj1Ykk6vRhJFfaqr3kLnQOk?=
 =?us-ascii?Q?lKp2Cg7WVkiZ0qfXwG6huKMJTCCvxer1XaeoMeKjyHJW+dPe7UrBsaVDI4HS?=
 =?us-ascii?Q?yzOhSUxPEyHZDh0KT5HijDIy74TPyqPH7cW0OuhrcalA/XdtMOsmNhgAsiaY?=
 =?us-ascii?Q?iJYnp+fSRVJgusaU82WG5ubTJTnZi8N0LyNX8x8BhmPTILvu7yQEFh4m15Em?=
 =?us-ascii?Q?GXe7fktOfqp+rwWjFT221IxaKdR1+ufqDvIn1ikMB5oKXt4dyzI51N7f7Don?=
 =?us-ascii?Q?1yUFBjJqPfstrIdRI21XrptnF6u5BYcvVtwIJcMzlnSD2sAw5K2PSFZgu1EW?=
 =?us-ascii?Q?Zm8+mFBCFEMkFRMHGsHNNqHsfTZtDZY6J4Tg9EyFZb9o4GhlrrkC7zWAVhy7?=
 =?us-ascii?Q?F8uoCK2t8gK972RYSXEnfq1yXFSjQ2VTEkO0ByYG08Y6tg9GUT0+L6UdBl7u?=
 =?us-ascii?Q?acVEPKev+405dqNIKbHNE1iSCb9XysisAZEwHjtNZvPEQ4qCm1KWRreGGdec?=
 =?us-ascii?Q?WGw0LrOQ6G2rfai3fxQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q0LTQBxVErWaHUXN1DwKcotOL8fSUWLo5rSskTm0EpupYIDpQJEdSfNAUrIa?=
 =?us-ascii?Q?Z3E2Wtv5ev3p2PpGt0YonXmw3M+b70FLho7d+EcI2ylzo5nK52dKQt4Zu30G?=
 =?us-ascii?Q?CFYk2zkimR8zHITYYgyI7XQPYEF8WB0kocwQi1vMwbmAXr9O0VzrCvKHZHfb?=
 =?us-ascii?Q?X9gCOi8KrhcWxecx9WsGRRbZZm3USmnuc3hrSfU5XHp26zFgKRsi5zYoxOR7?=
 =?us-ascii?Q?NIJ9xRpjPuXSPsFsMCZiiyu1PnfC62Sth9rPQQ6tGaFtMY+Z5+a45gw3TlUB?=
 =?us-ascii?Q?R/qNEFaL1WiussoOfP+DvAwHTa1vMOUFTMwK2bCgk8p3tGLaOz+dKxPn8DKj?=
 =?us-ascii?Q?R2cuxrr8vrY3faIn2WIOEGqctgkWjV9jKHhsvvGoigp17BJnVp9rjFUSkCDE?=
 =?us-ascii?Q?47SuzavmM+8rQchmtUh1+wCGfTL51Qw6KaWtOgjr9gS0J03TYGuKpMX8Fh+W?=
 =?us-ascii?Q?aUKVRO9yHa1DZGbyTSdzEYidjWSZUOBDcnSw0gb9LvUojt1WupJIadaLKJcN?=
 =?us-ascii?Q?WxiYD1nG4ExpxPbYranga9pae6WjxvniDHo8G/j7xtRz/qcfHWOMcVbU7F0f?=
 =?us-ascii?Q?kz6Aj5OVbPVV5UzrCyePfmwe8mprozXkgMoA/565r0Id39om6uLnqBI2ScAX?=
 =?us-ascii?Q?gDFnncUMKMCScpbOHvWbgSGqm70FePx48t1skitYlOneCq2KrxgsEfFnDiT3?=
 =?us-ascii?Q?+udioJplT5rbZLOB5P28EoxSHYbTcaXDpjTUEuMTML4oZWXWwTlcCJmznTLE?=
 =?us-ascii?Q?DzAQQjRr0hvk5IdeMoBFi0+AwlK6oxstpoiMAA+oJujSkneF+tLwHDY75RmD?=
 =?us-ascii?Q?QGNaNJlq4xVl9MDBWSBFlPaU6fwZXV4I5v8rzKZ6NmpinncISACRSVjGbWvo?=
 =?us-ascii?Q?+I31b2vV+vMFPywZ59aVDYThBqSyReIpNVwW9OcInND5wh1OvMFA6b4lGA11?=
 =?us-ascii?Q?K8gL8VLTOFl2r/edX36p5+H5GJmykpchQ/UJxDgVt81GlfAwcITKtmFgiBEZ?=
 =?us-ascii?Q?SaYiBrWC1uB61gFPDOfABfli7LaAkCj1AZfduo5DMZr0eXMKNMG1sIFOi/mg?=
 =?us-ascii?Q?g/RSk7ryeFgVz7RsBkhGptvVIpqjm2F13VWLGd4Zv65Zfk5QW3EL8Ssftxu/?=
 =?us-ascii?Q?KDFdGwbg0AX7+t11XMGTDD5Nb4XSLfORQDulM3KYWLwebbML6jUUtGS2Bo8Y?=
 =?us-ascii?Q?SAKxXOD+HdquV+nbgSGPoCoz6cp0x8jLnT5qmfGVKdLi4ZySpwARCIn+bKPD?=
 =?us-ascii?Q?lwfd29nyg3wHo+85iirEYQCjIfqxpx0vBvYU2CVIqxbB/qRRR1BCE6/dvROd?=
 =?us-ascii?Q?m2Cc4vzfUqrEiciPq0ntNPgjtYLy+lGxpTTAHxHmdgzTgTdZ53dSgRvwdcB+?=
 =?us-ascii?Q?XFOQa7ilkOSrf7VTTggmZU/3l8+acYrEXUMqAdGL26YlyUb8R7AsN2vEhtZN?=
 =?us-ascii?Q?5p9b1rZLnJoWDOZl1utcEeF6XBWKWR23486Zrlqn8MBrjsVn/D9KXFQxDl0+?=
 =?us-ascii?Q?dVew2zepctvRO9b3KIR/5fprd/y4KMZSnvDAhHhnQAD7FqUiwkEiMM0rRTjg?=
 =?us-ascii?Q?NfnthbarimwQte2/b8gzPIbtfaTGKDGopuxtBf+ONL6sZFNdVSnt8hvHudg6?=
 =?us-ascii?Q?torP+nBW0+WuDNXQUWz7OGWQh/ruJX9gScuPOSTiR6FKpcgAyGytHObyZ6MI?=
 =?us-ascii?Q?TPhbpWI4yNBwLmbDx4upTMHPQn//ISCFYO1ke8+CFt+DrkXniJMNL6QCGZTD?=
 =?us-ascii?Q?9alw93LjMA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JjsoHQI8kF6KgxsTji/61B4Y8ZWqZx9A2Y/GywgbvBXiVTw7MoKEgioK3iGj2wXUr7W0fqjHGPFb44bFe1anRi+fSdLy1+3fZMjmIk8K3HyaZcvgZnYcEosD6geW3LkonqMx40vx6zIcX1A0sY54A8bw78MSTFi08C87X39C03mLV3kWsNOSxQcHVSaQsOMAKz83/XMvm37emVL/nXeYiKIFZ3IG9+sPPCLmSqWmB5viQGOFQ3gW5MlhqVQdHVw91ktg+uWiR87gioKK2nseAYAgJefK4RGn3qEjGTJOKj2+zJRxze3fLm59dz2euL7iD+aLGgll6iRoJUIYL2tyq4+nKRvhkuji+laUN3U7xdUL4CYOGZ/8ZncRpOSu0oteHkC2lDadRye95Y3VMoh02tp+IGqcnpWRAiJUeNUDMRqPde8g/pISUPF+lW3AOPPq5QlaVLBhTt0Plku/B5KbP25IXHzkR8Zqf0PmF11aHcDrGdv7jMidMwRw9b+7ryqJZAn/BV5WLI6yTsQjSVW1efnb7MtLfG2J15FLe19hXxZrU13PL6gdqA8Krn9kaMIzme+beil0Wx0PmPpjqaVBDZp+fsZv7oiIbldIsT2URbA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a54470-642e-4a0f-576f-08de6fcf68b7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 15:56:14.0375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1PZlN/ali9U6uSrL1Re0sCP0CutsleyQyUSrkHwDTiflYP1OIQMuz8V6aveVlGnEPKrCNq8yAkgaeFNRZPXoa8Iayz6Rb6gdYyDGBwDT88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8395
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0 adultscore=0
 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602190144
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE0NCBTYWx0ZWRfXypRXBIPdpMzQ
 zdFq8wy7V5+XV1ErPXvrEPOqNb1WeRcb8ao25+AIO8dpF1ibhjwJ7drUBRNqrjhZG/yXfL1lInp
 yQvV4+LqXrEFQu0aTR9tVCvN33/XcyxKvCFEBdwhuQtUejg6xpZC/V4bWVFiVcCUPHPzftlQU4Z
 HaiaZn/kAtj7fSAQQIFBeT7FLom7rnw7M1Ka224R+Iijuy7qZE9pHyz+otj9tbleHNxRnHE2DMC
 Aqjbc58o+b3re9Evv+7K6XKGTrrNYKdLRMbJdqnIn64QqWDowsRsVofqw5IjpP5eS4jL46I/jwW
 unY2z4plJrjnsj50nD8YOxv+KtQpOxG7z4LeDuiQyUJP2lKp8BjbSYRaAa1FPzcgsagt4HrMs7i
 kiKMt78l4KgXF0tuV60ajIm2yDfUr2cF7Jh5iQyevl419PhTI9BOR9LvI9z3D7/P7mlATWYf6El
 2Bb6zWUzdxpumVsO69O3LZ3MecpLLPnJRW/b7TxI=
X-Authority-Analysis: v=2.4 cv=Saz6t/Ru c=1 sm=1 tr=0 ts=699732a3 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=r5YuJWUM53Zo-GnW0OQA:9 cc=ntf
 awl=host:12263
X-Proofpoint-GUID: jms8bIZ4TUpJHVu02xBV2iNO6cfs9ddO
X-Proofpoint-ORIG-GUID: jms8bIZ4TUpJHVu02xBV2iNO6cfs9ddO

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 Makefunctions | 2 ++
 configure     | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/Makefunctions b/Makefunctions
index 15836dc3..1f308967 100644
--- a/Makefunctions
+++ b/Makefunctions
@@ -52,7 +52,9 @@ endef
 # Rule to build a C source file.
 # Syntax: $(call cc-template,primary,filename-without-dir,optional flags)
 
+ifndef WITHOUT_DEPENDENCIES
 cc-dependencies = -MP -MMD -MF $(obj-name).deps -MT $(obj-name)
+endif
 
 define cc-template
 $(obj-name): $(src-name) $(foreach dep,$($(1)_SRCDEPS),$(call src-name,$(1),$(dep))) $(foreach prov,$($(1)_PROV),$(call hdr-name,$(1),$(prov))) $(CONFIG_H)
diff --git a/configure b/configure
index 04c28369..a3107fd0 100755
--- a/configure
+++ b/configure
@@ -99,6 +99,9 @@ EOF
         echo >&2
         make help-overrides
         cat >&2 <<'EOF'
+Optional features:
+
+--disable-dependency-tracking	Suppress automatic dependency tracking
 
 Options controlling the compiler (pass on the command line):
 
@@ -172,6 +175,8 @@ for option in "$@"; do
         HAVE_VALGRIND=*) write_config_var VALGRIND "$option";;
         HAVE_BPFV3=*) write_config_var BPFV3 "$option";;
         HAVE_BPFMASM=*) write_config_var BPFMASM "$option";;
+        --disable-dependency-tracking) write_make_var WITHOUT_DEPENDENCIES "y";;
+        --enable-dependency-tracking) write_make_var WITHOUT_DEPENDENCIES "n";;
         *) echo "Unknown option $option" >&2
            exit 1;;
     esac
-- 
2.51.0

