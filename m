Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2192BAE8
	for <dtrace@lists.linux.dev>; Wed, 14 Aug 2024 02:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723604380; cv=fail; b=UOwkAbCA5XkeEWvS9VVIsApDaSefCQC69eXmhh8AEpbcMb8s+DpCXytQWP9R1k5Gol3ttSKMzD1D1dBzbqeT4XZC40qCF4epaMaZwo+iowfpkL+a4Yeq3hqMU/XFfYRWDWuoGMAjS/WMQejdlyU09Ojajs68uXfD/FM+r0B8t40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723604380; c=relaxed/simple;
	bh=VFSxhBULRvswhOTkbgM5nF+zsNlRmeuAqYs1Hh7z/XE=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Ydxj/BF9LTFOcHqojGJ7EZFKUzftVLrXaPm/ILloDtR9YBxRrim4qTo5bcjblVy+SKAnYhkVLxkPHmdPE2LIJ8vDbvD5v8QLSR6Wo2bLKWrJYLzcwyNKta8UNtLLiE3s/PC09Sy1tMly55KEvSeGTf/lxkfiI+2RthjxvXmNmQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YPq+aEbR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=b4G5MRtp; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YPq+aEbR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="b4G5MRtp"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47DN9TEg019601
	for <dtrace@lists.linux.dev>; Wed, 14 Aug 2024 02:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=CXSUSY8hbw1QoA8Yov4Wll/0bL2XyJGBfbErVlwmDc8=; b=
	YPq+aEbRyQIGc3XMAGS2latcHdKNCWoAR3PQywhYPXYQqniylFg752d638GjzGSu
	G5VgR4bPzjcJw68oyKWIiqEDiEmUgRi8+hXAgzFG6bvENB8pHW/RK5NN/QOzi3PR
	Zj0oRbRyGgp7PA1JqjbDMvidPU47Lx9Hb+UzqeBd3r//mpEMnAiRm6SOdYU0dkOa
	VpKi+rlUTAEaBXJqppT2XN0/9UmvAM0glqu/X6WPK04BeuuIHaFpQO1zE+V3Hlv8
	/bi7FmtuM3uMOxCBzHA+0DN+5nnx39czymr57YkK4ejuxXS9DeH42izIZGxgOCTS
	aTCEUwpavYnD2d55gdxGqg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40wy4bfeat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 14 Aug 2024 02:59:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47E0JKcV006097
	for <dtrace@lists.linux.dev>; Wed, 14 Aug 2024 02:59:35 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40wxnac6n0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 14 Aug 2024 02:59:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hv2wEHYX7I+uCtQGD0RYsxRmzfD1HW3X0UnRZ8FmXxp2VGVI1/aVso/Ie2nBUg7RK4snwq5KzxhLE7OJyeWDHp02hs72DtOK6uFfFQ2VcCIs62VD5vGygkMj5SljweoXWTRfVfRzkZSPwFeiVpnoAvQ7FVP8qFvn4PDwKs9VHr203PKGgu4JOLAZ8S0/jlLvppWtexdDAA7Sh7UUZWC4jMbyillw8nq9KAZY3glkR3ESL9LfTyQ6C5ausBKhoxSKLaXo0c1AZiC8QFA46mh1vm2iwvqatbVxUnDU1nx6i1ajw2evmz9v/pDrVTbQsUjxwMJ7TPD1pWgwRCfcSMNj4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXSUSY8hbw1QoA8Yov4Wll/0bL2XyJGBfbErVlwmDc8=;
 b=FzIojNLcn8J5o5geHll8ajh1sZNM7yL7YJO3QM9HM6UO+KzsnhEaRI0wsQl2uAkdWgeGfvBt63NHFzR1/FsWiFZbP6wRtoyuDtF1u1HqP/huTWArOMF4MH2QXaPMiwN/d1ytsHR0STmwFcOZAyjCFr5qsLJUUClcmep0BvshYwUo569ZjqDLC5+qTfFLmEmeHa3icdfgWGJiFuxZlhMQXcGjtmAV7XrvLqjmuJEnQesoyHRVYRs4L/kfqdogR2wPteo4PlXp0lHayi8XDvvoM4KRb3QbpeXwbOH87pjABdaW/2SNJUawCLK+s/VFW3dSba5+3fUPW1akZQQxQF2ncQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXSUSY8hbw1QoA8Yov4Wll/0bL2XyJGBfbErVlwmDc8=;
 b=b4G5MRtpAxTPMxxh5zRMAUJEX2eqNH1AHshuYJsdfOhg8vV3oVCzbunL1U0YRHPaIXMDDQoF1soY5sdRHop3AOC6M1uvStiU8Z1+GTqYgOsXpeO1juwW5f27EM0WvFZYXLfQW9Yqnveo07KYCiVOgFTZ+Upox3FTi6T98yAKm4s=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ2PR10MB7857.namprd10.prod.outlook.com (2603:10b6:a03:56f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.15; Wed, 14 Aug
 2024 02:59:32 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7875.016; Wed, 14 Aug 2024
 02:59:32 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Action clear() should clear only one aggregation
Date: Tue, 13 Aug 2024 22:59:25 -0400
Message-Id: <20240814025925.25408-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0551.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::19) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ2PR10MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: e4167515-4c10-4062-2a34-08dcbc0d1edf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SBoSs5D6/4X49gTm6seuotO5bFMNgki+cAQWWDt0sQkWoYFuG87w+etkXthY?=
 =?us-ascii?Q?4WdWz+xW5wX0xbooFH/mZGmVDHg15jhD4LkQ0bNfaTXe41BDz7Twz9CXKoX9?=
 =?us-ascii?Q?B7r3+GbLvh9trQgPxfIWCUsDk7tYu//YQpChssbYbUgxHzISWai0RrFN2D/M?=
 =?us-ascii?Q?MC91Vr/KhWnjeofqmtG0Sx8NPfCk00YozeW+6L0wfFNz9lXYpGXuHOH6ytIz?=
 =?us-ascii?Q?C8eqAh0+Vwa1f3fY5N9he3RnUG+Tnb3nNWhTZTpV3uLn0P5y/6C4x9cIn7Oe?=
 =?us-ascii?Q?xdN8O/XzJOII7kH1FpNcxfeACm5AMUnbDqmt2n/9xnH+wGp671PM5etPUieE?=
 =?us-ascii?Q?+NfSbqwg5Bmz9M39pjCDzg5NVpYU9KUvw6alYQovsl2f6/+sQCMZGEunIaDu?=
 =?us-ascii?Q?9GCsdLUQLTGjjqAvphF8cpdGuH1uVl+HtI9lwqLTDe8CXe7l8Ztxtf0NsGEi?=
 =?us-ascii?Q?msruZGcwX1FLp9l/IkbrNQdAgcyemk2jQPS5xM1Qo56fN6zupvuRCc4SKfrz?=
 =?us-ascii?Q?AAIrUwS4RP2wHDiWf/uCyNmkIeS2FXpVFPwjyKmj0OelYX6VJnCRFQ6UxEz2?=
 =?us-ascii?Q?JbOIxM0RSfOYwNAsXxYBqtjPD3smpJH28KRBmGl7pySPi9IfduZRXLx1ajWX?=
 =?us-ascii?Q?g4p4B4GLHZ+zlRCNMqbzyQf1OM4zJeDAM6K0yOuwgNggLXxzIIAyDG2nMEPU?=
 =?us-ascii?Q?AX6lO/+rCq9VcH8VzEspNBfrSPhsOYUtJGN+Iy21d0aEDsb9vXNghASs3shp?=
 =?us-ascii?Q?rmIzTxXvoyXRkhKyySUq22rum4CJH1jOZvM53cGjL2dbkXzYhCHALFZxYJBe?=
 =?us-ascii?Q?Q+1xAmqQJhNkSeAjZ8iwI0XKGSppEEyIgabbJM0A0RQAYfYOXyvEr13G+3P6?=
 =?us-ascii?Q?gsOzsO/fLN+kcYHFI+kVQM+A6VrhFQfd3whNvuIZh3uVOt2L+daM6OgOlI1z?=
 =?us-ascii?Q?QYW2Sh2jhBBpAIErH1T8ruuwE8qiSJT31F5DbGTVWjKOcavvK6HLLXEFh+1P?=
 =?us-ascii?Q?ItVPKZSZmIJxXbfT/Au9txusuwbGXCAXdgflBFeFjARn3agjtQuQcAFWcAtT?=
 =?us-ascii?Q?2IlWiVGfXt1smvSyiSgqZAAjTQBq9SZzpb4NzsmfdUTGPTKQw27oWvGW8exN?=
 =?us-ascii?Q?C+BGec9TiNGfFYts+noT5wKzKKQNlz5E60cgEVO+PtQ2Fjtcf2okOKGdnsB8?=
 =?us-ascii?Q?A/tyvUJ5l/zJrHOut9+l2TIuKVGDTV4P6w9wTnX1q50RHeOThZxk+dY5Yb8I?=
 =?us-ascii?Q?/w2WxLmyKucGDZied/N6aFiUMIlB3/c1/NEcw2z3hBbJs7Aj16JqK0adE1jd?=
 =?us-ascii?Q?g7uxg2mz4RgEY1WU+sXYgIbVR3tSN1Rp2ohd6R7K4jgXtpmPoL95gAejvftB?=
 =?us-ascii?Q?0QfZ/3g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6JGE6hIPV88fYwBv6yB6tU214jlOlxYHPj4zW10Encp5i1od2uSvgZvZB4Ms?=
 =?us-ascii?Q?7gKL/mnQaKVoMmaOcI9Ylcx50/vS76yvTs718dq9Ok7+h43KXdR0ny+B/CPs?=
 =?us-ascii?Q?Kps9fSFqX/tGDtFU6oorM9ReBx7nRsi+yJMuuqNZxYFc1V9wmPh/h86m8MBW?=
 =?us-ascii?Q?ecuz77COVy4xJemarxXpQRn16dEVEfdPlK1fF/wKBz7ZjGLcx14x9qbZ4kkc?=
 =?us-ascii?Q?bE8o1QDiWH/XcpCoOXP1zgFtIAxZ2lGEe2JRgun22n47t7+e3vVfa31Afraq?=
 =?us-ascii?Q?yH4v2aqdrCEPhuN9gQu80qhcRBiTAk/Leg6z0prRTSEcMfBrPz5KX+KhvWo4?=
 =?us-ascii?Q?uHd2puOpwsBpFSY82nGZ9y1Am82SrNsdB1T0VGZgw2sxwK8WLXGBdGWp7TwU?=
 =?us-ascii?Q?bsNuU1SFwDg5QbsmzpNKUnwwzsF4uwWkMSjsA2OqPfiCEt1sqQWXobtOuC4B?=
 =?us-ascii?Q?+Y+LgUYmnppUc1ZGzQssdoviBZmdH4K9gzejnQ3eJA72v2dM7aP/ar8qFU26?=
 =?us-ascii?Q?W2DoDezMTRayUSzfK7P3YN7A6I/Ots7i1oYp12ZXfrYkiJxKWsjx81eIFdrm?=
 =?us-ascii?Q?3ky1f+RAR/ogLprkTyQaqwTPo9aKUXJBz9zwBHZ3Qe0ospg6sywooOSUM9TI?=
 =?us-ascii?Q?/vlH1WUexkyrdc5yXhFB+ZkgJLYdjEQi8DywhT6oH+fLG3L6n/m+yVvi5X9g?=
 =?us-ascii?Q?6qkGabhJVDmUT3rkHrivdpL89WGAZZMkuyAmu4j2oaRwD+RyPjj3mYV/eMi8?=
 =?us-ascii?Q?cX+SYLaqubIYl1QzgoJk+2VuDq5y9ORCV9bKmeiw6JW4wY1pXMyijqOE9XyP?=
 =?us-ascii?Q?spusyMtF+hxCwNbnhKT1b7xSjfmVljCT5kUXtechIx3cWBYTqbTCcoLM/a7P?=
 =?us-ascii?Q?dyg3rdsPZ68Ht3knDR6gGdJU+cvldUtGejM8qRAVrJI0JwGDXxwiHoM8/L8J?=
 =?us-ascii?Q?ZdMZMRcA8cr/34QWGy07wXPWa0k29xa6y4PfuMAAK9eEcLDVA9UsirV+Aokq?=
 =?us-ascii?Q?T0wY+yfimckrW16IQBR+uHLJ+o4OT1ZOEMGSGCCkRimhYYblBEsuWzJSEhNG?=
 =?us-ascii?Q?w5zKqyDLnoV4Soh6UMFm7XiaSgwsu9yaYhX3e4q+iw9XnTmOkb8sS6ydnWgN?=
 =?us-ascii?Q?ZPLs5rQOj+eD5JFnhGzAlhU4YGma61behDur6O0MqnBQqcTmgWl+swIO7Cmv?=
 =?us-ascii?Q?FtzpaiXv14YcR5Q+rtAFYRdYYvQdRIN9HW5mOErJuhYvEx8fMJAnbpkGugh7?=
 =?us-ascii?Q?qtaDyX+Lxd3OTZ4IhGdOLKzo0mFjJ0NJ1ekYBmF2pKEkMdNHWN7naL2zVt40?=
 =?us-ascii?Q?FIxOIJX03CbcNPQCzmarp0gOyQvuTjqisH87RkKbCZIICSY0MQWlpnfU/Hxd?=
 =?us-ascii?Q?XRBZdNibprY5BfXY57BBURGVdXiUHscjvuJr9HdQDDKCS3tLFLdzGHisBKw3?=
 =?us-ascii?Q?MeqgB1ftqTAANWBITTcClxOUIO2F9EmrMOzvbVVNbVF03Zvt28pHHwCZ4hh4?=
 =?us-ascii?Q?oC40JmnNmoyIe6o9q/GLY+66CrgRL+5UcrpJJe6b8U7WZ2wAbsUZxoQWvf3k?=
 =?us-ascii?Q?vSdEt8re7qdUg2uV4aPScN2xNhoB57IylDyDZli3?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IvA+OfkNvOhUkFylDX1IYixmQxbHZiiI87gGyAr8sfK52PUh7N9ze0Cv5Gl4hlZNoTHBW8PNAtH43czWHN9P1Fx+mOhYyOeZnhnn2LQrTeEca1bk71q8DHqd5YNWXWrzL8CnNgqvBizYh1HssyLEcK/gfqEVBzlNCqS/QDvF/2DYXhMzZ7CU74auBlVCCX1jd4n5psC0MmtKEkiR0xcUKotVH8jAJMea0vGbstYXpZ2sfQJCSl0wohMgNpg/6+DFBLXvGba6KvBa/bqkPDhdgnkFMOF+PXx+KqFmpGJCuYf4UknGFPP7lY3G35Ns2oRbdP9hCDEpDYZqB8LQlnol+Me5fdqXMqr5z/xSEetGIM54GRK2jJ6xgp68A022v2Z5jsN+UDZesRdU5aJT5UdqQNmXcsv6EZ0+5vK/13mTtp403V+x398ksYrps7y9eQtNV5HkJKHQoHTjEOht9C8L2iHuzWB2ZiTn22B8hcXRUyDsw9P1bz89IUmrJiUMUqi3v9mHu66NQZCYNZH+3KpcYjrT3emYbry7Aft3UiYjyUnmwbNizt7VPcujEN+KxaXqbU90DSpARuuuTBbtH1bJJI8WI9lA7YXXr1WZbI81S44=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4167515-4c10-4062-2a34-08dcbc0d1edf
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 02:59:32.0472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MxVpJIcSvEVab9fBSBIodQgqo741xIIrdraCRVTEGa6OK0f4cXzgzrquv2WINUFccN86C+HdOqGG3grvZwV6KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7857
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_02,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408140021
X-Proofpoint-GUID: edH6zQKflyZndfXsCG8ArCXoI9xPT-bP
X-Proofpoint-ORIG-GUID: edH6zQKflyZndfXsCG8ArCXoI9xPT-bP

From: Eugene Loh <eugene.loh@oracle.com>

FIXME:  Is libdtrace/libdtrace.ver correctly updated?

In dt_clear(), we:

*)  extract an aggregation ID (dtrace_aggid_t)

*)  increment the gen counter for this aggregation ID

*)  clear the consumer copy of the aggregation, using:

      /* Also clear our own copy of the data, in case it gets printed. */
      dtrace_aggregate_walk(dtp, dt_aggregate_clear_one, dtp);

However, this clears all the aggregations.  While the next snapshot of
the aggregations will refresh our copies of the aggregations -- after all,
dtrace_aggregate_snap() itself starts with a call to dtrace_aggregate_clear()
-- if we print aggregations before the next snapshot, we would display an
erroneously cleared aggregation.

Therefore, change dt_clear() to clear only those aggregations that
correspond to the specified aggregation ID.

Note that while we have "aggregation-walk" functions like

    dtrace_aggregate_walk()
    dtrace_aggregate_walk_joined()
    dtrace_aggregate_walk_*sorted() (many of these)

the first one (dtrace_aggregate_walk) is used only twice:

    - in dtrace_aggregate_clear() to clear all aggregations

    - in dt_clear(), where we should clear only a specific aggregation ID

Therefore, rename dtrace_aggregate_walk() to be
dtrace_aggregate_walk_oneid() that takes an aggid argument.  If
aggid==DTRACE_AGGVARIDNONE, walk all aggregations.  Otherwise, walk
only those aggregations that match the specified id.

Though trunc() appears not to be similarly afflicted, add a test for it
too.

Orabug: 36900180
Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_aggregate.c           |  8 ++++++--
 libdtrace/dt_consume.c             |  2 +-
 libdtrace/dtrace.h                 |  4 ++--
 libdtrace/libdtrace.ver            |  4 ++--
 test/unittest/aggs/tst.clear-one.d | 33 ++++++++++++++++++++++++++++++
 test/unittest/aggs/tst.clear-one.r | 13 ++++++++++++
 test/unittest/aggs/tst.trunc-one.d | 33 ++++++++++++++++++++++++++++++
 test/unittest/aggs/tst.trunc-one.r | 10 +++++++++
 8 files changed, 100 insertions(+), 7 deletions(-)
 create mode 100644 test/unittest/aggs/tst.clear-one.d
 create mode 100644 test/unittest/aggs/tst.clear-one.r
 create mode 100644 test/unittest/aggs/tst.trunc-one.d
 create mode 100644 test/unittest/aggs/tst.trunc-one.r

diff --git a/libdtrace/dt_aggregate.c b/libdtrace/dt_aggregate.c
index 51f0d622..e06025de 100644
--- a/libdtrace/dt_aggregate.c
+++ b/libdtrace/dt_aggregate.c
@@ -1278,7 +1278,8 @@ dt_aggregate_qsort(dtrace_hdl_t *dtp, void *base, size_t nel, size_t width,
 }
 
 int
-dtrace_aggregate_walk(dtrace_hdl_t *dtp, dtrace_aggregate_f *func, void *arg)
+dtrace_aggregate_walk_oneid(dtrace_hdl_t *dtp, dtrace_aggregate_f *func,
+			    void *arg, dtrace_aggid_t aid)
 {
 	dt_ahashent_t *h, *next;
 	dt_ahash_t *hash = &dtp->dt_aggregate.dtat_hash;
@@ -1291,6 +1292,8 @@ dtrace_aggregate_walk(dtrace_hdl_t *dtp, dtrace_aggregate_f *func, void *arg)
 		 */
 		next = h->dtahe_nextall;
 
+		if (aid != DTRACE_AGGVARIDNONE && aid != h->dtahe_data.dtada_desc->dtagd_varid)
+			continue;
 		if (dt_aggwalk_rval(dtp, h, func(&h->dtahe_data, arg)) == -1)
 			return -1;
 	}
@@ -1820,10 +1823,11 @@ dtrace_aggregate_print(dtrace_hdl_t *dtp, FILE *fp,
 	return 0;
 }
 
+/* FIXME: dtrace_aggregate_clear() is called from only one site.  Should we inline it? */
 void
 dtrace_aggregate_clear(dtrace_hdl_t *dtp)
 {
-	dtrace_aggregate_walk(dtp, dt_aggregate_clear_one, dtp);
+	dtrace_aggregate_walk_oneid(dtp, dt_aggregate_clear_one, dtp, DTRACE_AGGVARIDNONE);
 }
 
 void
diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index 8d8c0f54..238b93ca 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -1551,7 +1551,7 @@ dt_clear(dtrace_hdl_t *dtp, caddr_t base, dtrace_recdesc_t *rec)
 		return -1;
 
 	/* Also clear our own copy of the data, in case it gets printed. */
-	dtrace_aggregate_walk(dtp, dt_aggregate_clear_one, dtp);
+	dtrace_aggregate_walk_oneid(dtp, dt_aggregate_clear_one, dtp, aid);
 
 	return 0;
 }
diff --git a/libdtrace/dtrace.h b/libdtrace/dtrace.h
index 1f54c10c..4df3ebf4 100644
--- a/libdtrace/dtrace.h
+++ b/libdtrace/dtrace.h
@@ -396,8 +396,8 @@ extern int dtrace_aggregate_snap(dtrace_hdl_t *dtp);
 extern int dtrace_aggregate_print(dtrace_hdl_t *dtp, FILE *fp,
     dtrace_aggregate_walk_f *func); /* func must take dtrace_print_aggdata_t */
 
-extern int dtrace_aggregate_walk(dtrace_hdl_t *dtp, dtrace_aggregate_f *func,
-    void *arg);
+extern int dtrace_aggregate_walk_oneid(dtrace_hdl_t *dtp, dtrace_aggregate_f *func,
+    void *arg, dtrace_aggid_t);
 
 extern int dtrace_aggregate_walk_joined(dtrace_hdl_t *dtp,
     dtrace_aggid_t *aggvars, int naggvars,
diff --git a/libdtrace/libdtrace.ver b/libdtrace/libdtrace.ver
index edbd5a1d..1510ad95 100644
--- a/libdtrace/libdtrace.ver
+++ b/libdtrace/libdtrace.ver
@@ -1,6 +1,6 @@
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2009, 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2009, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -10,7 +10,7 @@ LIBDTRACE_1.0 {
 	dtrace_aggregate_clear;
 	dtrace_aggregate_print;
 	dtrace_aggregate_snap;
-	dtrace_aggregate_walk;
+	dtrace_aggregate_walk_oneid;
 	dtrace_aggregate_walk_joined;
 	dtrace_aggregate_walk_keyrevsorted;
 	dtrace_aggregate_walk_keysorted;
diff --git a/test/unittest/aggs/tst.clear-one.d b/test/unittest/aggs/tst.clear-one.d
new file mode 100644
index 00000000..f96c2db0
--- /dev/null
+++ b/test/unittest/aggs/tst.clear-one.d
@@ -0,0 +1,33 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Clearing one aggregation clears only that one.
+ *
+ * SECTION: Aggregations/Clearing aggregations
+ */
+/* @@nosort */
+
+#pragma D option quiet
+
+BEGIN
+{
+	@a[1] = sum(100);
+	@a[2] = sum( 20);
+	@a[3] = sum(  3);
+	@b[4] = sum(400);
+	@b[5] = sum( 50);
+	@b[6] = sum(  6);
+	@c[7] = sum(700);
+	@c[8] = sum( 80);
+	@c[9] = sum(  9);
+	clear(@b);
+	printa(@a);
+	printa(@b);
+	printa(@c);
+	exit(0);
+}
diff --git a/test/unittest/aggs/tst.clear-one.r b/test/unittest/aggs/tst.clear-one.r
new file mode 100644
index 00000000..101d173f
--- /dev/null
+++ b/test/unittest/aggs/tst.clear-one.r
@@ -0,0 +1,13 @@
+
+        3                3
+        2               20
+        1              100
+
+        4                0
+        5                0
+        6                0
+
+        9                9
+        8               80
+        7              700
+
diff --git a/test/unittest/aggs/tst.trunc-one.d b/test/unittest/aggs/tst.trunc-one.d
new file mode 100644
index 00000000..0556bb34
--- /dev/null
+++ b/test/unittest/aggs/tst.trunc-one.d
@@ -0,0 +1,33 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Truncating one aggregation truncates only that one.
+ *
+ * SECTION: Aggregations/Clearing aggregations
+ */
+/* @@nosort */
+
+#pragma D option quiet
+
+BEGIN
+{
+	@a[1] = sum(100);
+	@a[2] = sum( 20);
+	@a[3] = sum(  3);
+	@b[4] = sum(400);
+	@b[5] = sum( 50);
+	@b[6] = sum(  6);
+	@c[7] = sum(700);
+	@c[8] = sum( 80);
+	@c[9] = sum(  9);
+	trunc(@b);
+	printa(@a);
+	printa(@b);
+	printa(@c);
+	exit(0);
+}
diff --git a/test/unittest/aggs/tst.trunc-one.r b/test/unittest/aggs/tst.trunc-one.r
new file mode 100644
index 00000000..a611026d
--- /dev/null
+++ b/test/unittest/aggs/tst.trunc-one.r
@@ -0,0 +1,10 @@
+
+        3                3
+        2               20
+        1              100
+
+
+        9                9
+        8               80
+        7              700
+
-- 
2.43.5

