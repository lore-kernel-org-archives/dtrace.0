Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBD7801
	for <dtrace@lists.linux.dev>; Tue,  5 Nov 2024 00:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730765190; cv=fail; b=VAqJtLCc5wtldB+ZkNxaIeJPFedsEd9nvFG/4ZVSXAYIJVeWt1Mgna7+POne98sLc2WOWxCBa9lYp/MKn7051Gtg55bdOLXkwNqzabnCBY/nmFcvVjkBI2d9okY71SuPNv7tvTR0y0oNLgZ0p0MZMGstcdNW4/kd8zkI0b3y9pk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730765190; c=relaxed/simple;
	bh=2CIdcoXRnYxyWGUbaFj9cNfbF2cMx0GKvo8hl1XEHCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VBst0mF2sNjJ+SJ7UT94x9nmWBCZHecYntCJcy649pl9UFZoQzzWfP0FRnZCHpf71j2bfF58LP+luAS+jxKgKLRNKqpfHrH3VHkUMoQqS2anRh40ru2mxSbPuDR5NyCZ09dN1YrsxScuBHr3H5dpaq/0xlZmibBvFr/0XuM/38c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jpJTPt+3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rptcu5Ax; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jpJTPt+3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rptcu5Ax"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4LhCVS026732
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 00:06:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Q/FmapA5JZabI4jAIaHquu7eVxT/8CJY0mSINUoXDo4=; b=
	jpJTPt+3bm/mS1es4Wnfs1OTUEwvhWchSE0cjn8SvJtfg92S6SSmN3LM0mx0NZvv
	MW7odwrHtLcSGgJIhWQolGdAS3feTlo4KH+FAMBKBOB2xRjU2bWQPLUdFg2UQL9c
	jvORlQ7DiTDHGxB7r92W6Es+8Ldqfk9w07wKlClEb7J5NXeDmmhRKIP/dW/YfBlj
	AlJVoOGH8pSZnHh6HdFnDWs70pD0BgF6XHROBHwlP0xfW+/iPiLQU71Qs+8ra2x+
	DNVHhB/ptWVxoAbMHVqSqqVr6cK5LcJmsFlWEEYSuX0kOh0SjhH5Pqpd7kOSJ/Vt
	ZlXAac+aztnZWxGOE9AAyw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nagc44gd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 00:06:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4MoLj1031447
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 00:06:22 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42nah67dnc-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 00:06:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JrhX5//YuJuvZO1J09wnoxpJgQsetEkkbUIbMsxBbKAmj5qa97GXHYA5OcwRYMfPsJIjvWesS1IWww5euUVhgpombyeuPbs0hP970KfokC/WMZ4HgH1U5W4y3Dtv2K/bZ+0JXilifYA/OfwU/VL9YOqWZkcGtqQMpu1n94+kykAwoJkH98NEuetMritKsISosA3DN3kyU6NwrKuWEXMYKGHZTaPuRQ6r/+DQo3oAJvN9wtUC6Ax2XdL7mw6GGnUqNXfH62pn0/nIO7rD+5Q5xW9hRZMGO7zjeCXCneGOnMYr5UShxKWILIPhmNgispVaVtk2onES+ENdFhKLhxhnww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/FmapA5JZabI4jAIaHquu7eVxT/8CJY0mSINUoXDo4=;
 b=jlb3WVHesVTBGmSqhAJgWZmu5HRk4uhHnABjiHLCNfqD5BC1t20BfdjCsrm6z8O00V3+lD0XlkrcR+gsPMA3vCHd6x7MvNMFQJHYSkqi346q1Qbz6xQ4B6kpRr7qJZBNjojziE8O1g/K4C1WIsQ+mQFoYkaFPsRRLi2LJu8m7QfPAGrJJm5Eiys+qeIxjd6fkrM1VTcznl08gRbw4T1o8/Ek5g7s2f+cCAekVdJAMh/Ni10ob5MTcHQRg6MF0g/l9aYrDH9ifBjlgXnTF7n6Zwtlmi7z4cXMJnT1g7B7ua4HoGSv0myKK2bjohY9HxjCAe6JvjJbNTg+8o4mNMQfcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/FmapA5JZabI4jAIaHquu7eVxT/8CJY0mSINUoXDo4=;
 b=rptcu5Axp34Gvt9CqHtQ11TPmSJN2g9dsr29P1Ey6M8xM/dZ/Ok37gyXu6NlSs9H9V6+AGpapiJMpYIYJSTqkFEiNACN0wDFr8WKDTRCe5oTH/Q6onEh9lht4NMDrGNEcT2vVLB1KdU0YhwtUCyMawiTT2LglIaBJkUEl7O0Xtk=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by DM4PR10MB6693.namprd10.prod.outlook.com (2603:10b6:8:113::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 00:06:19 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Tue, 5 Nov 2024
 00:06:19 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH v5 2/6] dtprobed: stop skipping zero-tracepoint probes in dof_stash.c
Date: Tue,  5 Nov 2024 00:06:04 +0000
Message-ID: <20241105000608.333229-3-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241105000608.333229-1-nick.alcock@oracle.com>
References: <20241105000608.333229-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0358.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::21) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|DM4PR10MB6693:EE_
X-MS-Office365-Filtering-Correlation-Id: a77a653a-3bee-4669-e70d-08dcfd2dac97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TbznYRXP+ImNkn8wZZOdsyfBcuqrceWMj/JhVQtQnS6jZd/MDZ1c59IGKxRR?=
 =?us-ascii?Q?5o1x15qGFrojGI3IZIC/rTW43UHEBBgfMwb8i+BM3GqMr3OKM+CaucoHjNgb?=
 =?us-ascii?Q?IJBpIYqpd91/ChDE2hZnHOVtv35QACSsFS6tmXEmxzOcRct7NTQLmF3ZMcyg?=
 =?us-ascii?Q?F5hpUSFpsqo+QInKD9cX0012lW+C56mxB/In/FO3TcA2K8Dx1DtBGkx/N1k5?=
 =?us-ascii?Q?DMdsydc9Y4zmm09uA9wAlG2F5tcDYrJ9FHWDdxwH10DwViZXca6QvjYxI5rz?=
 =?us-ascii?Q?kCf6NwF6ENYSMofwfrK9LGrYrVctt2uCRgVwlalsmDEUaQ9yaV+PRPYEIu20?=
 =?us-ascii?Q?2vi6YNzJOMswcOnOxOIQpvTvWeoo3TkAQpRUBed9vK3qK5bHfHfqOONEul3l?=
 =?us-ascii?Q?bQKvduzH3CVrgChaqp2tXItSmmwBI6tqLXGq7I3rVmCCtbqpe/rP6RInhPK5?=
 =?us-ascii?Q?7DzD89fPAG3ibjK2mYpR/7gCRy9a5gDaq9hqSllZJgVwoiWTpeGWA40cidfT?=
 =?us-ascii?Q?d+QOKRFLWEP3TXzMeadwaiBbZVwScjmZ01/NR6vC1d0Z8chaBVyPyUvpRE9i?=
 =?us-ascii?Q?qOTLNK4/Aonyg5aRWseyziDWX9pN89mCO0TBvDKkiipC7lfY0vAoPJGPJ9WI?=
 =?us-ascii?Q?3WMiNjYCwL2hy5MvIlDsPycxPNZDbDPIgnoqzwBm+An9TrVugs1DHS+IxTD/?=
 =?us-ascii?Q?iC22hepKd1lCCcy4TNXTZuEUOgCsGQtr8in/5KUPVVM71+Cybw7oLgqQ5isw?=
 =?us-ascii?Q?qMXSnyYcRu0NkGjncnOQDxVZcSfm/QmYtJuofWZ9QeMWH16m3YdWBGNtpI8P?=
 =?us-ascii?Q?7eeQfyGJS4u+dQgV4P7+GhJMppx/Rqaiw9+RBcJ/n9b+TBfL/s3CCdmWrwUg?=
 =?us-ascii?Q?2yM64XZ5NY0WWLIAfNkk0yIPpdxRlWDKnQhfbPJ1hkZsAL3Hv45kmOWRCPN0?=
 =?us-ascii?Q?QfrTh0klKHBJmXUU7hPWiCaVL8uN6somShFDvBNyDWsw3R1y3us46G2K8p52?=
 =?us-ascii?Q?65ew2/0sjtE51hCiWm8eLQOoiFYSB2ymcNTnosi+wAoyq4hwSED6jjHeBk9v?=
 =?us-ascii?Q?MaOr2AiIOkei/2yf1PP2fbD/OcFq6dt/73ItvkqoA9ZgWkfkvgJx7txW40TN?=
 =?us-ascii?Q?6jGmk0pEl5MW6siRhFmm+CiKpMOAAgwukkMJ8grTEbjs3mHyKYGW31aXTViG?=
 =?us-ascii?Q?RIqTiVFw0UYwTIh7BAjwelEFvVK7MORqcf9O3PPpUoTVDlmPsV2gLzGZsCYu?=
 =?us-ascii?Q?3j2iF+GzjE+QXahpOCX49R9M5IxHjpCt7MEqOtte5dEQ7RnJrxBpHtgYaAWq?=
 =?us-ascii?Q?FKM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hT7PLm2SSgJlHaAfkK2cK+EYnK9zoRI4hHFZtUI4PnYiqFA8noUvDDKJbTI1?=
 =?us-ascii?Q?PZOJWS0NMXLMNJvVEvBfn1sC6DBrmPJCPs8wICkoh9z1SC0lIj9u57AVxxco?=
 =?us-ascii?Q?1ESABFvvIffIsROhSiCnOYn2OAL4wPWUYZetFHdv6L4MLIZa0xQdFQ6qYKl8?=
 =?us-ascii?Q?bt+I+kEFzeWTJuxjHcto7vL/LXF3qw+mdMsr9kYxYWu3Tr4eIOWnFUkBq/lf?=
 =?us-ascii?Q?0BzvgfAbcchHpX7hh6qBm+7YsAx0r0YFAyvndDDYz1GwQKMJh5ej7WeSpaMX?=
 =?us-ascii?Q?Vhtmsct54EGGP21ZsJXOHHBRKepQhwfEUDyg6NTUnopvHazrJgITg8lBdo5l?=
 =?us-ascii?Q?+rbloiMlaoO9LyDL+SzSAV3Py3Pl1dUMG4SUgOX1xOTje4pUtuvm537Zlxzg?=
 =?us-ascii?Q?dJcLZg9FAaEpi81lPRgRDW3ug/QRoW4DBrVHmxCpgzbI3wx/5rMKAaFsj0sN?=
 =?us-ascii?Q?5+3QDj0GasX3cy96/kqHEvpdYxU2UGYKBxkSpxK+iUMKfZSHU8mDF9UnvX7N?=
 =?us-ascii?Q?xGTguZNtrVhYMTVDKIWM7+vnL2gQ44ANf8qTOCRpfnXQACHfiMcaiXUjA2Xq?=
 =?us-ascii?Q?OL6yt78w5YsP4hjqlcXF4MOiwJ0PJTcXchJNMUexVL/ACrh8AV4I9veIUMJl?=
 =?us-ascii?Q?1KCJ0yrJ2gydkYtMoiFCJJsXLCG+M2qOX/4XXnYo9enRtk7h2Ry1N2CIa+zS?=
 =?us-ascii?Q?/EHm2RL1raxL3qREHqw6yGbGJEQvsCybIDCmXzDYxVpoRsTq7bIht5dMm8hu?=
 =?us-ascii?Q?OcBTaUkCvXzcc720ovbM0KWLIbC9YZL8RUC+pRqHKQjka/cW5z9TbWz1JSd4?=
 =?us-ascii?Q?COz9uxBwahBb9Z9mbKgNeuSTHjxTGEWgh1SuW04AxFTl3cP2pLhM7qZrTbcC?=
 =?us-ascii?Q?5EMCogB/HwnZkCwxMVLIin/M4KrSLbWgSG0T2acaaXPphE1IuOra5ZiNXQnM?=
 =?us-ascii?Q?nkfs4ZEmXTBhwceUshRm6URuIuxTpkb9UbU+4++2LncjylW0sFitqUEXCRTQ?=
 =?us-ascii?Q?AjzVkFR/kmmK/wW0u43GiEp5evahMmc4M03qBin+xRi/guft1xE7Tj+60u89?=
 =?us-ascii?Q?MC0gjuuF3cEtMU457Iv6Gctvw9YGZKvK++iqOy+bl40Ltvx8N9k0WL652KPT?=
 =?us-ascii?Q?Y+MIF8dihG5sCK9D+yjA/gZHlOX2pLFORUbuGGeQ853nZZmEnWA4Wn5ksEyy?=
 =?us-ascii?Q?uO1423PMMOeMKHznHKZlFTx9nB/Vh4bXOLqy64bl/1upgRenPrI4cb5z+J6T?=
 =?us-ascii?Q?S6f0aTodVF7FqP6Rc56f8rjwCaZ3Fg6oy4jxBIBO7FQFvzP7kTMVpeMZWxjV?=
 =?us-ascii?Q?tHS8MVSLAgumJR7HlBeSCfHm1raSYEAJEecIFKsw6lOOLm+HmRbGFxcq4c79?=
 =?us-ascii?Q?3amEZ5nrutQKV5YQfP8FqWvoD84sz8KxjBc5KRLerxYeASNrgRFdS06MbYRw?=
 =?us-ascii?Q?DR/yRk4/t+rct+HpoLRUII3Ij5PjSD4/Kmsz9ErM80JmMXl3PZhPUQ4u1Wrs?=
 =?us-ascii?Q?oyZ/Xv7ld5OyaWy7KtHBL3MmVy3dAk5stASDcNbofJXKnMbg3eA/NZrP8poR?=
 =?us-ascii?Q?IEnFksgAWO3mEInpvNSQ5i7H29HbTOmch/7fMeqmurOnBeWjqtKotqOuh2IL?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ayqA47evk4+kZ2rDnpRi1zgdhDdRUB0XMJUBNP/fj8wBURgJBpJ7EiE6kA5YTs6GVQ7yIKLbUMYMRC6KF7cOCyPMxuTA1Xijfdcq0rxTGBS70TL5K8f67bJ57ysP3z/CnxWSpOqgli4J/FnwnC4TVvo+kwtisORDTurr8gTLlRPh9UUX4ojG0UZ1GTf+VU1oHNQlUh96XNmlH952zzAVTD7PTgGHQBiBBwwYHUpSY1EyvXOJ1ntb2GPAba6PdHjN2YXaOGTSXwMI3K3Y/xnPvkKU40LVHh2uWuFGjALN7cDbm5mzUuusYafqKvTGt0WZDLZi7NFoGRBbp1xXvVOpK0KgQfyPME0VnrwC2BodTWRDB1AqmNivIHE4bY0xZVKvmyL0JAbrpuZKbbqE5r6VZeYzQz/vMF04ROpLIh6ZrkIQQI8qJPGRwZj/KiIgyyIOYgojRtn0ZvmtgPtzxbCmM40G9zce2qJWpOgtfV2jWc+ZWKGVP2+DnqWyRfrxghy3BnalLi+gXWSx9+DdzWDgJFN+ywuI7wpGL7g+NlC/zEz3H++uS2UlEcIQL/hDHLOW2CqYeq6L52oluGjoudN6Gmz2gPBqBGavhB6s8OHfWCQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a77a653a-3bee-4669-e70d-08dcfd2dac97
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 00:06:19.1967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ytgNkc+OzvlkG4fEsIb+WClxF7K0UPB9K6vGOEi0nv497VEoaQ4qj9k1r/Q2Chcnus1UM5dCoD1ubRpZJMlOHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6693
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_21,2024-11-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=880 spamscore=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411040192
X-Proofpoint-ORIG-GUID: A0mExgs91_FPiVP_0bORSYnAbIkQ9V7j
X-Proofpoint-GUID: A0mExgs91_FPiVP_0bORSYnAbIkQ9V7j

We already validate that they don't exist in dof_parser.c, so no such probes
can ever get here.  Handling this impossible, untestable case has just got
harder, because we'd have to skip DIT_ARGS_{NATIVE,XLAT,MAP} records too.
Just stop considering it.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtprobed/dof_stash.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
index 8bf465678217..82fdd3174759 100644
--- a/dtprobed/dof_stash.c
+++ b/dtprobed/dof_stash.c
@@ -586,12 +586,6 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
 			if (err != 0)
 				goto err_provider;
 
-			/*
-			 * Skip probes with zero tracepoints entirely.
-			 */
-			if (accump->parsed->probe.ntp == 0)
-				break;
-
 			mod = accump->parsed->probe.name;
 			assert(accump->parsed->size > (mod - (char *) accump->parsed));
 			fun = mod + strlen(mod) + 1;
-- 
2.46.0.278.g36e3a12567

