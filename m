Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517BB370ADB
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618602; cv=fail; b=Pvao5Tsvv/jW7T+4/6yUXnuhy1tFM4Et64sJttRlMcgnN7GGBlTWgYr+6We1TfrD3S4ANfJ7caETIQLZMcOnLici70JFxt/ct0NESpx80n3GsCm53LCrM0wFSAEIpQ4IfdgrxojPnmyPvaiaJ5o9a6xZnUY1dgk5Cjs8vjSAwdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618602; c=relaxed/simple;
	bh=cHqfH9QZ4HAWEWYDHfFp2TO78BdN1DlsWzfmR7xjgl4=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=EOpYW5AyWPmalLr86TpvQrpkOerxT3kM5Sk3g0l2sKw21cilW4qO7YuzL4x10xS3ulXy7Nw88AtBGVE2bU3qlUDtNszfs6wa9GMlmsoi4pS6i1hfmdknnKUwx9fpC4ZrcyTvomusKX1HV4WE2j3fYITE29S5ZvFqOxiWfwCvsfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nNtBVOS5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yyXPqxfe; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nNtBVOS5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yyXPqxfe"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SDixNO1697138
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=1hX/qO7fFuGs1MnNTZx7Vt+cTpLegrx6kSHjn3w5q/Y=; b=
	nNtBVOS5kF1fU/fjab03PN3ORFMwY3v3a/gFS9CsfQC1sElehOh4OchP6ZZt2rmF
	g2T7b0jx85u/IHCt/gnSD04Xowspl3jBbm/NjI2yZFNKPx/2FoM+eaQwJmzvTKWc
	WIIRG9rnbEUV9SDpBZvlA+T7ZgiJ5MZeZc/aMzWQLczLcKT8bFL53fEfItmJbowI
	LDyu7JObHKlGebJv1elk9PrS/GMpmp7KAVwYMVObYxIAubcHTCa7/Zf4byBxViXr
	oP6y5TmNQNvP50Ld+hli1yn5GXhxurAVlaqpwVRGkEWc4YmPx6OTaNjpXIMxuapb
	Z/sEYjcEjhYdunotoZBNkw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gx4fbbauw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68SHoLJI018875
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:17 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012016.outbound.protection.outlook.com [52.101.53.16])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4gx4gp2q2n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yk0/fkcVRuwxzDJhz+5iN6julsVdtcZu1vNJEVpTt7BL7ANh67XMyuWl4bSLcMylWtM0JHsvFRCozmf69Of3iPJNS+HRqBjPyxdIMKnjGxvCWLHQ+JOM437c0ts5LC/crWksbePfsyrC0oGi7QdU01zyPW5aTF+zHr12+zXagWOUb8438ZuLqhmelfJ7wIC20RiD2ZiOcZfrDNx5ZIkN3A2VS2cj9a3MtkIVQAptcxSeiKGIZDSfMSANy50/bXMfvot04WKd5VI369+ffOGjr96N66GdV8Y8/R82UJp2yVAyEqZTVFhY4W3WBY7yTcEZdmfV9eNXKxyjwrPqFy57kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hX/qO7fFuGs1MnNTZx7Vt+cTpLegrx6kSHjn3w5q/Y=;
 b=JFCzWsr/Wb0tqj5XcoZc5KbsHhzgprLXsf/MbcnciZ7dNvuylayMcfculB9MZyflUG0c7C3hSUCE5k5rSKTPw+4T66/a+gJpgwp4vVx3Lk9a1i2UT7eA8IqYljPXEGbMhWntoN0Jlc6mKM5oaWfKFuNGNM0ddUczc6dPC+caPLUQwR/hppz3GId8VHYw2RL2sk8LeLEOVHKN6Se+/UB6dvDIVbNSvXJaJebNRXLFX2sAx8h70tLezdJAs50cwlSiSGSLH89adX8nOzp/CdqJtfhd1foV1Tii2JUPcwtesv3Otjc26jWZO1Kxcw0QtByM66M18WjhzcwBqJGlGI0RJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hX/qO7fFuGs1MnNTZx7Vt+cTpLegrx6kSHjn3w5q/Y=;
 b=yyXPqxfepvja74YcKP4zMA9ItMtJv5bQHiieUYUN8s3vNtGLLGSCtGIGs8xqaWVefzBeSB3y6zgB88P5jnwpkh5uaz9661Qf26wMARaITCHRhN+9FYvjx9p8KwGQBvPYHO4SrhopxyNZkQHI+BR8FVkYsXYwkmAViW5SfOvJLWQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS7PR10MB5925.namprd10.prod.outlook.com (2603:10b6:8:87::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Mon, 28 Sep
 2026 18:03:14 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0472.005; Mon, 28 Sep 2026
 18:03:13 +0000
Date: Mon, 28 Sep 2026 18:01:58 +0000
Message-ID: <8f28ccd1f4fdb30ab6054c7d3f51355b@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/8] parser: validate scoped external names
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::21) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS7PR10MB5925:EE_
X-MS-Office365-Filtering-Correlation-Id: fe89a939-6806-4dc5-bf8b-08df1d8ac385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|56012099006|10067099003|18002099003|6133799003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	+Q2eIptfp287Kn68RUs+Jrpue6JXLC/m56yT9gLxV3DYc2ijhScV5Od89Lteukb9mMtuKdzEXykA7DD4fulYkMKMX65HsRDvgKGlL2RuvXlrTPPZ9KmQFS3JckR7+K6R0vX/6DUju7FPqDLTy0WGDZd2VSberXewO6oE3B7w47Zg7DTNqHH9lq8Mv04n+2x13h/PT2cx0ej7M/iOm6gqL/AXBBU478NkhRJK4RwJB7hT8U4dCOqFLGkZjyUyAg7TRBQ7XjlhGOeuE/cym4yrXrgX6KHzAJbGBgXzu4Rgb7y1LemxG7b17Cfc87AYSkSNr220qcc50EJFXt8TBfVr2b6//oEMAgoI0UWj/MZG4Jd6j1mmGjbea6A9L/lMJ80jdJhZ6rYQ1rzGhBdYqQo+fBTt6eeM6GfVfua+JzoD4L8StYiL0xhF9gdxdeTZJWVm8JRlrzA2NbUEXdNMntg3/WloUQG954k+T1h/E3HZmxz3sQai+1zacKNvgWoSyajjKv9fygtInhYL8WnmLmAhRwZztn57tPVa493vqY1S4HZOyva/D159HfGriJKvffjtOdRzwrXp5h/L+1LtB7+Br5fZDwRYBOBdZZkVRmnKEan0B+jRwwUB/7tc1xafSsWadZdDf3jdCEpe10EaZJ/I/2KqfahQrXcTiKpKDc18bXE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(10067099003)(18002099003)(6133799003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D/DyDtbcGe6/8/giDyjdA0w6ySgCpKUJDb5iOanDkDyXEPtuUZ+pvKv0GWi3?=
 =?us-ascii?Q?tvLAN6Mm+R1cDc0kty4SeAlN/tM27s7TdvD/P1veV/v1tY9t9UNaE9bVCatn?=
 =?us-ascii?Q?3b3qW4lb1KeG1MZh/ihy1Eyda6foJwCoTTR05IIKabdctQVrkRc80kyqhxz4?=
 =?us-ascii?Q?hPRo8GiQGkGb+p1jStMELOsJFsFwdsm/Z5nZWRoablbZlOLEwzbX7dcQsbVC?=
 =?us-ascii?Q?hxSy2zT9U/n+APj4NRAHRz1Aap7m96DeGUiYb3GDpauD/9Tz+z/OvT54Jlnw?=
 =?us-ascii?Q?dC1ttWQIMoYL22AGzY3F+zqN0kk4e+2b7euxc8A4U83cdHP6/D7rvoLjwVfG?=
 =?us-ascii?Q?yHFx1FcTM1MaQeFWM1hEpXGWkpbM9xzCIwFrsv9iyWw8m4GEzhVU/qK6tS0o?=
 =?us-ascii?Q?1rc1ykkJ4HosSKceYXzM+1IPSMGnTiH7DC+tE0vIhMnEscZGclYO8JEfaGY2?=
 =?us-ascii?Q?DIx/ch8kfgxJa99FhubetkZwpKAXPx6eCMInvTZMqm5c+PBV9eaJFOnfdt5R?=
 =?us-ascii?Q?G3Ms4F7EAWdW3sfy1jnEyByeOj+hY7agtuSsA71IpWIocyPOHj/gg7cwXuX9?=
 =?us-ascii?Q?DvD7bAaeEWspAfu174RHvQprHel7Jyt+lY1t/ZLBgmIjxrzzEzU867OMVlbZ?=
 =?us-ascii?Q?6LD5IrYZgElfJIpuLbYI0gD/iUyaFM8eJ9zThqEhIMhLwKllQDSmM3i+Cc6E?=
 =?us-ascii?Q?MGsgOHJZfV3q1icoaVicq5HbeMkP5NPlKKy9c119v6qNDTJjuVWeJU1kV9qs?=
 =?us-ascii?Q?mUAjxnIA3SSH5clU3NUuScT7MHeJClBltTcTwXMMpVQsml31clQ7lfK6VLC9?=
 =?us-ascii?Q?C9kjE4/Qm6GUHjmhqm/0hxfthpv0lQI1VQpT7R67wVl44ExTgmo95HTFJe1p?=
 =?us-ascii?Q?2nwJ+8vRiUjsVFx6MmM9bXUpEVXOPKtlhPEoinNEZUUKXNNcZZrTzLTBRo1a?=
 =?us-ascii?Q?8kX8++Pc6iA+UuroyJfETMYUR7XOUs6JIPDEZTKIbe1BFuD5XjqLlF+fRihi?=
 =?us-ascii?Q?CKlXxixXcfqNn4l5ucBn+HGLP3oc9uva4WZS9j3dPQOA1TBIai/gXoVTrvE5?=
 =?us-ascii?Q?RZnUa1F2rwtmI6urP9gZ5+N5zzErCDDqa0+2QYJHsz1QWH0a/ooNcVnRhbmR?=
 =?us-ascii?Q?ieZgkJwc1JEuP8Z6DVhma6AsuSiiDksXkKwJg6rIAfqloE2bj1NdOTputGaA?=
 =?us-ascii?Q?JVr0pfJ9qF7WtSjsXRKh+lrdJIyCVvw0zqd+E+OIkAYdJPGivXwfZDIjf5H9?=
 =?us-ascii?Q?aB850aKkKxIzXhgeDS10pi4nhSDdKLIIyicX1+AsU6wI9qhs6TmjzTlxPQ2i?=
 =?us-ascii?Q?Bsu4hCw6hRnN/ihC4Ucjk4kpTjGtEoMsKYcqf/7a2sp58qtKcj2bRAxp7pJI?=
 =?us-ascii?Q?Z77wgvWrPlG+RopUlpAWKniSGB1pgzqcqJ4u63MinVsBRWYHE4vLVUiwEtyL?=
 =?us-ascii?Q?ND4LlSUvtaKxjfn7e9bI1jt0dHNPnqyd0xExhLWDkAwcI9DRZS4CC2zWlIJS?=
 =?us-ascii?Q?JcQ0QLBzIV24xzfJ3yAGtOqNUR4y5M2XNC0KFXUvAaJWUpcxLBNr1Nfxq+Mu?=
 =?us-ascii?Q?2E1Wgk5llQQTI+paiSWTeZgPWJOJey6y5+DcvcVOxsZtHWsexiXTnHNm6cGa?=
 =?us-ascii?Q?A5QokQp96DZUj2ltVP69KFMMh+geZhMIk9dfucMNqggJtzABomcfuyHoCtLD?=
 =?us-ascii?Q?22I+iA3bUM7fFuZgpD7MZlZUdFJHYIjkabDh1ae7JeMrTyt0JmHzoPcr9Eg8?=
 =?us-ascii?Q?nIbWBWc+sGinpRTsHQzdpdJm83hPaFY=3D?=
X-Exchange-RoutingPolicyChecked:
	QNf3kbcZRSt45vPDeZYIKm2yHI5KQvlZCGcWJMdQNfk+JvuGCzutCV1HhltoDVcf9Gc/0EZthgsiFlELahZ945sksWos2cmFc0Q6KEJq2ZL/tmcO2leVpUf8Ohp8JJBspbAf7mPHvHqlhPPY6gvQzZ6Ri2HfOvdozAxUJW5EKl2Gdxz8dYgYjQfZiI8MIwf78kSe0mSF3wzoY1lm72mvJdQLr79MzNGmh1yUrb4VXqlAKNWpunDHgTcpqRb0uzrBeokI3Hek6swcsAt6KuR7fiQP8mgJhGR8kMyYonCwFUKHE6JaSumeM0IK3Z6dA3zT6ukVbNCOHoaCmIG8uASoyw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eeKNeGuEZJHwUxqxNIDFP/a6u883YmIm6zIGzG4wZ90IiISPRwuaI3Rf9Y8H+Gtt3sZuYs3wB15vp+9152Pt3mf0buZkCdTn9OPTBKkqw/ZsdzrGaBvqmPlx/SUDksiogY6gjLuYiyLrpvawFKRFeef/VOW+XwKIIEPNaN6o/sjN7x33wZ1T5JRvvStrkohvKZkPj9/vGoxtIy5eVJ+C2/x/hsZ2sIEbDa/AXmt6aflOiH4HJC4MZmBFNsIR/W02cFFJdYfXyLEJbivIwhc2XpHYu2gGp5/pdGjWwGdoox6Ez1AuaPWadQLRfDDJ4F74zjq5CoDo7vfJ4p48QDrjSowi5qv3Om3GhPffWqMjyZMNbywQUpBjPaShe9Nqi9UR9RclZ+eDq4Rqko9LljQz92fdxW6s5bn3D7kpF/dlvGEKKTbr/ff7ewmOKCZk5k/8c4qxmyEKN5U7F26ynvIoOX6XG23zhS+0V2Us8jyIhR3uM0l3BMch0pms9yfelEhF3vgAGkvQEsAkaqDtWrgdRoGcMvS7qqBzsKn7VzafeEXyVO5eMGrnRiKfHEJkaLNHJmUSbouy/G5qHEktKPKqdYDj3deAeNXTsdmz0wrOIzo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe89a939-6806-4dc5-bf8b-08df1d8ac385
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 18:03:13.4320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eWGk6jKwVMKqjf91C5g3t/BvGKAX6z1Sp5uedbWLG5i6rYfnJqzxJNijKtm61SlnOBNAaGVgb1H7jh7b+cv5KwtMMqMJw7PL4uxgbFdg+3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5925
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2609280071
X-Proofpoint-ORIG-GUID: FpOzpvvlBogssplDlFf73XHrY4i3_jTr
X-Proofpoint-GUID: FpOzpvvlBogssplDlFf73XHrY4i3_jTr
X-Authority-Analysis: v=2.4 cv=eJCGH3p1 c=1 sm=1 tr=0 ts=6abaabe6 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x4eqshVgHu-cdnggieHk:22 a=yPCof4ZbAAAA:8 a=4JIFZwGedSQb7AANOCAA:9
 a=rEqNaWj0-quomjz8:21 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22
 cc=ntf awl=host:12107
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA3MSBTYWx0ZWRfX5VL3aDKtl3Te
 pFGqCysVGT6v3dNB9s0zgAL3ZYtzv40KhG7jXTUyJUjaahGMCBpOwpMiLQC0FgxPtU+U3lvfHbO
 2CyFke01UGJe6TaX162aipb9tvYmUfbWi5VYDfPacMwV4RJj1fri
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA3MSBTYWx0ZWRfX+WCnvJladPyC
 6EYSbFbE9QYc1kaBJ0M4SADRZXVvM/YwDjucqdFfMTae4HNCy4mhRGwBw2fsUEqRDzzED0F31tM
 986cAduatKnDdETZ777ABZQGo20uIUoCAiNqEeBuR7P4f0wnehFcNlmUeOjSZxMyb7a7/7c3cWD
 8lrzHR4Z0rt9TiUiXpQawXeBfGBlRxFzjbycrMjKTZcfgv5iDPlrG07qEoSJLhmAYq/L3LfPOVu
 jwbxHwTDJb0fa30TXh4fTvzyYAuptv5mmSAamgP5GFXQRhzgbBrum2jcchT60GJKzGiYLq7BZaa
 1+2KLkRceWUWsdC//T1F+MFnaf8ce5TZnL/VQZ2Zonz3mYSb3o2f2IZdPqPbNElG0dQZKbYiafw
 p7uDiK/XbQz7BNkgiIVWDHW5QfsFoCaNwiARY2ZHumXUwKZNqt7G/8TxV/OmVsGm7mlVkckEcXh
 Y6j1rsnByF46qLQEItQB1awp3TSOHD+yfsdxyxdw=

Centralize parsing of D scoping markers used by external type and symbol
references.  The helper now returns the resolved scope and identifier
pieces, supports kernel and userspace markers for both type and symbol
lookup, and rejects empty operands, runs longer than two backticks, and
repeated scoping markers as D_SYNTAX instead of falling through to lookup
failures.

Recognize dotted scoped identifiers as a single lexer token so module
names like foo.bar resolve as one external symbol reference.

Add lexer and type regression tests for malformed scoped identifiers,
dotted scopes, empty scope operands, scope-kind mismatches, and scoping
operators in declarations.  Update the sizeof unknown-symbol test to use
a non-empty symbol name.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_decl.c                           |   6 +-
 libdtrace/dt_lex.l                            |   5 +
 libdtrace/dt_parser.c                         | 140 ++++++++++++------
 libdtrace/dt_parser.h                         |   1 +
 .../err.D_IDENT_UNDEF.scope-dot-kernel.d      |  19 +++
 .../err.D_IDENT_UNDEF.scope-dot-kernel.r      |   2 +
 .../lexer/err.D_IDENT_UNDEF.scope-dot.d       |  19 +++
 .../lexer/err.D_IDENT_UNDEF.scope-dot.r       |   2 +
 .../err.D_SYM_BADREF.scope-kernel-as-user.d   |  18 +++
 .../err.D_SYM_BADREF.scope-kernel-as-user.r   |   2 +
 .../err.D_SYM_BADREF.scope-user-as-kernel.d   |  20 +++
 .../err.D_SYM_BADREF.scope-user-as-kernel.r   |   2 +
 .../err.D_SYNTAX.scope-empty-bare-user.d      |  19 +++
 .../err.D_SYNTAX.scope-empty-bare-user.r      |   2 +
 .../lexer/err.D_SYNTAX.scope-empty-bare.d     |  19 +++
 .../lexer/err.D_SYNTAX.scope-empty-bare.r     |   2 +
 .../lexer/err.D_SYNTAX.scope-empty-dot-user.d |  19 +++
 .../lexer/err.D_SYNTAX.scope-empty-dot-user.r |   2 +
 .../lexer/err.D_SYNTAX.scope-empty-user.d     |  19 +++
 .../lexer/err.D_SYNTAX.scope-empty-user.r     |   2 +
 .../unittest/lexer/err.D_SYNTAX.scope-empty.d |  18 +++
 .../unittest/lexer/err.D_SYNTAX.scope-empty.r |   2 +
 .../lexer/err.D_SYNTAX.scope-multiple.d       |  19 +++
 .../lexer/err.D_SYNTAX.scope-multiple.r       |   2 +
 .../lexer/err.D_SYNTAX.scope-triple.d         |  19 +++
 .../lexer/err.D_SYNTAX.scope-triple.r         |   2 +
 test/unittest/lexer/tst.scope-user-explicit.d |  22 +++
 .../sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d  |   2 +-
 .../sizeof/err.D_IDENT_UNDEF.UnknownSymbol.r  |   2 +-
 .../err.D_DECL_SCOPE.scopeop-enumerator.d     |  16 ++
 .../err.D_DECL_SCOPE.scopeop-enumerator.r     |   2 +
 .../types/err.D_DECL_SCOPE.scopeop-ident.d    |  19 +++
 .../types/err.D_DECL_SCOPE.scopeop-ident.r    |   2 +
 .../types/err.D_DECL_SCOPE.scopeop-member.d   |  16 ++
 .../types/err.D_DECL_SCOPE.scopeop-member.r   |   2 +
 35 files changed, 414 insertions(+), 51 deletions(-)
 create mode 100644 test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d
 create mode 100644 test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r
 create mode 100644 test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d
 create mode 100644 test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r
 create mode 100644 test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d
 create mode 100644 test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.r
 create mode 100644 test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d
 create mode 100644 test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.r
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.d
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.r
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.d
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.r
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.d
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.r
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-user.d
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-user.r
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty.d
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty.r
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-multiple.d
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-multiple.r
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-triple.d
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-triple.r
 create mode 100644 test/unittest/lexer/tst.scope-user-explicit.d
 create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d
 create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r
 create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.d
 create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.r
 create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-member.d
 create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-member.r

diff --git a/libdtrace/dt_decl.c b/libdtrace/dt_decl.c
index 1f4936dd..68999422 100644
--- a/libdtrace/dt_decl.c
+++ b/libdtrace/dt_decl.c
@@ -233,10 +233,8 @@ dt_decl_spec(ushort_t kind, char *name)
 	ddp->dd_kind = kind;
 	ddp->dd_name = name;
 
-	if (name != NULL && strchr(name, '`') != NULL) {
-		xyerror(D_DECL_SCOPE, "D scoping operator may not be used "
-		    "in a type name\n");
-	}
+	if (name != NULL && dt_scope_parse(name, NULL, NULL) < 0)
+		xyerror(D_SYNTAX, "syntax error near \"%s\"\n", name);
 
 	return dt_decl_check(ddp);
 }
diff --git a/libdtrace/dt_lex.l b/libdtrace/dt_lex.l
index fd70aa0a..bf133676 100644
--- a/libdtrace/dt_lex.l
+++ b/libdtrace/dt_lex.l
@@ -50,6 +50,7 @@ static size_t dt_input(char *buf, size_t max_size);
 RGX_AGG		"@"[a-zA-Z_][0-9a-zA-Z_]*
 RGX_PSPEC	[-$:a-zA-Z_.?*\\\[\]!][-$:0-9a-zA-Z_.`?*\\\[\]!]*
 RGX_IDENT	([a-zA-Z_`][0-9a-zA-Z_`]*)|([0-9][0-9a-zA-Z_]*`[0-9a-zA-Z_`]*)
+RGX_SCOPE_IDENT	[0-9a-zA-Z_][0-9a-zA-Z_]*(\.[0-9a-zA-Z_]+)+``?[0-9a-zA-Z_]+
 RGX_INT		([0-9]+|0[xX][0-9A-Fa-f]+)[uU]?[lL]?[lL]?
 RGX_FP		([0-9]+("."?)[0-9]*|"."[0-9]+)((e|E)("+"|-)?[0-9]+)?[fFlL]?
 RGX_WS		[\f\n\r\t\v ]
@@ -299,6 +300,7 @@ if (yypcb->pcb_token != 0) {
 			return DT_TOK_INT;
 		}
 
+<S0>{RGX_SCOPE_IDENT} |
 <S0,SIDENT>{RGX_IDENT}	{
 			return id_or_type(yytext);
 		}
@@ -728,6 +730,9 @@ id_or_type(const char *s)
 	int c0, c1;
 	dt_ident_t *idp;
 
+	if (dt_scope_parse(s, NULL, NULL) < 0)
+		xyerror(D_SYNTAX, "syntax error near \"%s\"\n", s);
+
 	if ((s = yylval.l_str = strdup(s)) == NULL)
 		longjmp(yypcb->pcb_jmpbuf, EDT_NOMEM);
 
diff --git a/libdtrace/dt_parser.c b/libdtrace/dt_parser.c
index e71c0985..1fd0f5b4 100644
--- a/libdtrace/dt_parser.c
+++ b/libdtrace/dt_parser.c
@@ -168,45 +168,96 @@ opstr(int op)
 	}
 }
 
+/*
+ * Parse the D scoping mark used in external type and symbol names.  A scoped
+ * name can contain one mark only: ` for kernel scope, or `` for user scope.
+ * Longer runs and repeated marks are malformed.  Return the scope kind as 0
+ * for no scope, 1 for kernel scope, or 2 for user scope.
+ */
 int
-dt_type_lookup(const char *s, dtrace_typeinfo_t *tip)
+dt_scope_parse(const char *s, const char **scopep, const char **identp)
 {
-	static const char delimiters[] = " \t\n\r\v\f*`";
-	dtrace_hdl_t *dtp = yypcb->pcb_hdl;
-	const char *p, *q, *end, *obj;
+	static const char delimiters[] = " \t\n\r\v\f*";
+	const char *mark = strchr(s, '`');
+	const char *scope;
+	size_t marklen = 1;
+
+	if (mark == NULL) {
+		if (scopep != NULL)
+			*scopep = DTRACE_OBJ_EXEC;
+		if (identp != NULL)
+			*identp = s;
+		return 0;
+	}
 
-	for (p = s, end = s + strlen(s); *p != '\0'; p = q) {
-		while (isspace(*p))
-			p++;	/* skip leading whitespace prior to token */
+	if (mark[1] == '`') {
+		marklen = 2;
+		if (mark[2] == '`')
+			return -1;
+	}
 
-		if (p == end || (q = strpbrk(p + 1, delimiters)) == NULL)
-			break;	/* empty string or single token remaining */
+	if (mark[marklen] == '\0')
+		return -1;
 
-		if (*q == '`') {
-			char *object = alloca((size_t)(q - p) + 1);
-			char *type = alloca((size_t)(end - s) + 1);
+	if (strchr(mark + marklen, '`') != NULL)
+		return -1;
 
-			/*
-			 * Copy from the start of the token (p) to the location
-			 * backquote (q) to extract the nul-terminated object.
-			 */
-			memcpy(object, p, (size_t)(q - p));
-			object[(size_t)(q - p)] = '\0';
+	for (scope = mark;
+	    scope > s && strchr(delimiters, scope[-1]) == NULL; )
+		scope--;
 
-			/*
-			 * Copy the original string up to the start of this
-			 * token (p) into type, and then concatenate everything
-			 * after q.  This is the type name without the object.
-			 */
-			memcpy(type, s, (size_t)(p - s));
-			memcpy(type + (size_t)(p - s), q + 1,
-			    strlen(q + 1) + 1);
+	if (scope == mark)
+		scope = marklen == 2 ? DTRACE_OBJ_UMODS : DTRACE_OBJ_KMODS;
+
+	if (scopep != NULL)
+		*scopep = scope;
+	if (identp != NULL)
+		*identp = mark + marklen;
+
+	return marklen;
+}
+
+int
+dt_type_lookup(const char *s, dtrace_typeinfo_t *tip)
+{
+	dtrace_hdl_t *dtp = yypcb->pcb_hdl;
+	const char *scope, *ident, *start, *obj;
+	int scopekind;
+
+	scopekind = dt_scope_parse(s, &scope, &ident);
+	if (scopekind < 0)
+		return dt_set_errno(dtp, EDT_BADSCOPE);
 
-			if (strchr(q + 1, '`') != NULL)
-				return dt_set_errno(dtp, EDT_BADSCOPE);
+	if (scopekind > 0) {
+		char *type;
+
+		/*
+		 * If there is no explicit object before the mark, search all
+		 * kernel or user objects depending on the mark width.
+		 */
+		if (scope == DTRACE_OBJ_KMODS || scope == DTRACE_OBJ_UMODS) {
+			start = ident - scopekind;
+			obj = scope;
+		} else {
+			size_t objlen = (size_t)(ident - scope) - scopekind;
+			char *object = alloca(objlen + 1);
 
-			return dtrace_lookup_by_type(dtp, object, type, tip);
+			memcpy(object, scope, objlen);
+			object[objlen] = '\0';
+			start = scope;
+			obj = object;
 		}
+
+		/*
+		 * Copy the original string up to the start of this token
+		 * into type, and then concatenate everything after the scoping
+		 * mark.  This is the type name without the object and mark.
+		 */
+		type = alloca((size_t)(start - s) + strlen(ident) + 1);
+		memcpy(type, s, (size_t)(start - s));
+		memcpy(type + (size_t)(start - s), ident, strlen(ident) + 1);
+
+		return dtrace_lookup_by_type(dtp, obj, type, tip);
 	}
 
 	if (yypcb->pcb_idepth != 0)
@@ -2767,9 +2818,10 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
 	dtrace_syminfo_t dts;
 	GElf_Sym sym;
 
-	const char *scope, *mark;
+	const char *scope, *ident, *markstr;
 	uchar_t dnkind;
 	char *name;
+	int scopekind;
 
 	/*
 	 * Look for scoping marks in the identifier.  If one is found, set our
@@ -2779,18 +2831,16 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
 	 * Otherwise we set scope to DTRACE_OBJ_EXEC, indicating that normal
 	 * scope is desired and we should search the specified idhash.
 	 */
-	if ((name = strrchr(dnp->dn_string, '`')) != NULL) {
-		if (name > dnp->dn_string && name[-1] == '`') {
-			uref++;
-			name[-1] = '\0';
-		}
-
-		if (name == dnp->dn_string + uref)
-			scope = uref ? DTRACE_OBJ_UMODS : DTRACE_OBJ_KMODS;
-		else
-			scope = dnp->dn_string;
+	scopekind = dt_scope_parse(dnp->dn_string, &scope, &ident);
+	if (scopekind < 0) {
+		xyerror(D_SYNTAX, "syntax error near \"%s\"\n",
+		    dnp->dn_string);
+	}
 
-		*name++ = '\0'; /* leave name pointing after scoping mark */
+	if (scopekind > 0) {
+		uref = scopekind == 2;
+		name = (char *)ident;
+		*(char *)(ident - scopekind) = '\0';
 		dnkind = DT_NODE_VAR;
 
 	} else if (idkind == DT_IDENT_AGG) {
@@ -2810,7 +2860,7 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
 	 * errno appropriately and that error will be reported instead.
 	 */
 	dt_set_errno(dtp, EDT_NOVAR);
-	mark = uref ? "``" : "`";
+	markstr = uref ? "``" : "`";
 
 	if (scope == DTRACE_OBJ_EXEC && (
 	    (dhp != dtp->dt_globals &&
@@ -2902,13 +2952,13 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
 				xyerror(D_SYM_MODEL, "cannot use %s symbol "
 					"%s%s%s in a %s D program\n",
 					dt_module_modelname(mp), dts.object,
-					mark, dts.name,
+					markstr, dts.name,
 					dt_module_modelname(dtp->dt_ddefs));
 			}
 
 			xyerror(D_SYM_NOTYPES, "no symbolic type information "
 				"is available for %s%s%s: %s\n",
-				dts.object, mark, dts.name,
+				dts.object, markstr, dts.name,
 				dtrace_errmsg(dtp, dtrace_errno(dtp)));
 		}
 
@@ -3014,7 +3064,7 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
 
 	} else if (scope != DTRACE_OBJ_EXEC) {
 		xyerror(D_IDENT_UNDEF, "failed to resolve %s%s%s: %s\n",
-		    dnp->dn_string, mark, name,
+		    dnp->dn_string, markstr, name,
 		    dtrace_errmsg(dtp, dtrace_errno(dtp)));
 	} else {
 		xyerror(D_IDENT_UNDEF, "failed to resolve %s: %s\n",
diff --git a/libdtrace/dt_parser.h b/libdtrace/dt_parser.h
index d74d658a..b9149220 100644
--- a/libdtrace/dt_parser.h
+++ b/libdtrace/dt_parser.h
@@ -211,6 +211,7 @@ extern dt_node_t *dt_node_tstring(dt_node_t *, uintmax_t);
 extern dt_node_t *dt_node_link(dt_node_t *, dt_node_t *);
 extern dt_node_t *dt_node_cook(dt_node_t *, uint_t);
 extern void dt_cook_taint_alloca(dt_node_t *, dt_ident_t *, dt_node_t *);
+extern int dt_scope_parse(const char *, const char **, const char **);
 
 extern dt_node_t *dt_node_xalloc(dtrace_hdl_t *, int);
 extern void dt_node_free(dt_node_t *);
diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d
new file mode 100644
index 00000000..2a267567
--- /dev/null
+++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Dotted kernel module scopes lex as a single external symbol
+ * reference.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(foo.bar`baz);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r
new file mode 100644
index 00000000..89a9f9c5
--- /dev/null
+++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d: [D_IDENT_UNDEF] line 17: failed to resolve foo.bar`baz: Module is no longer loaded
diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d
new file mode 100644
index 00000000..6b3dcfda
--- /dev/null
+++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Dotted userspace module scopes lex as a single external symbol
+ * reference.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(foo.bar``baz);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r
new file mode 100644
index 00000000..7734e29f
--- /dev/null
+++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d: [D_IDENT_UNDEF] line 17: failed to resolve foo.bar``baz: Module is no longer loaded
diff --git a/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d b/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d
new file mode 100644
index 00000000..d332191b
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d
@@ -0,0 +1,18 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Kernel symbols cannot be referenced using userspace scoping.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(vmlinux``major_names);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.r b/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.r
new file mode 100644
index 00000000..718b2b31
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d: [D_SYM_BADREF] line 16: kernel module 'vmlinux' symbol 'major_names' may not be referenced as a user symbol
diff --git a/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d b/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d
new file mode 100644
index 00000000..bc7e8b9f
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d
@@ -0,0 +1,20 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: testprobe */
+
+/*
+ * ASSERTION: Userspace symbols cannot be referenced using kernel scoping.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(&testprobe`main);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.r b/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.r
new file mode 100644
index 00000000..87169597
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d: [D_SYM_BADREF] line 18: user module 'testprobe' symbol 'main' may not be referenced as a kernel symbol
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.d b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.d
new file mode 100644
index 00000000..d7cff89f
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: A bare userspace D scoping operator with an empty identifier is a
+ * syntax error.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(``);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.r b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.r
new file mode 100644
index 00000000..8e9cd1ff
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.d: [D_SYNTAX] line 17: syntax error near "``"
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.d b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.d
new file mode 100644
index 00000000..44b4f60e
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: A bare D scoping operator with an empty identifier is a syntax
+ * error.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(`);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.r b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.r
new file mode 100644
index 00000000..bbba5fe8
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.d: [D_SYNTAX] line 17: syntax error near "`"
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.d b/test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.d
new file mode 100644
index 00000000..5ead7b3e
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: A dotted userspace D scoping operator with an empty identifier is
+ * a syntax error.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(foo.bar``);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.r b/test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.r
new file mode 100644
index 00000000..b07c07b1
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.d: [D_SYNTAX] line 17: syntax error near "bar``"
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-user.d b/test/unittest/lexer/err.D_SYNTAX.scope-empty-user.d
new file mode 100644
index 00000000..d3a927d7
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-user.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: A userspace D scoping operator with an empty identifier is a
+ * syntax error.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(bar``);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-user.r b/test/unittest/lexer/err.D_SYNTAX.scope-empty-user.r
new file mode 100644
index 00000000..dbf319ea
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-user.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-empty-user.d: [D_SYNTAX] line 17: syntax error near "bar``"
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty.d b/test/unittest/lexer/err.D_SYNTAX.scope-empty.d
new file mode 100644
index 00000000..e32b3812
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty.d
@@ -0,0 +1,18 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: A D scoping operator with an empty identifier is a syntax error.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(foo`);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty.r b/test/unittest/lexer/err.D_SYNTAX.scope-empty.r
new file mode 100644
index 00000000..d78728b2
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-empty.d: [D_SYNTAX] line 16: syntax error near "foo`"
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-multiple.d b/test/unittest/lexer/err.D_SYNTAX.scope-multiple.d
new file mode 100644
index 00000000..5e236c45
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-multiple.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Multiple D scoping operators in one identifier are a syntax
+ * error.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(foo``bar``baz);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-multiple.r b/test/unittest/lexer/err.D_SYNTAX.scope-multiple.r
new file mode 100644
index 00000000..cefc56ad
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-multiple.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-multiple.d: [D_SYNTAX] line 17: syntax error near "foo``bar``baz"
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-triple.d b/test/unittest/lexer/err.D_SYNTAX.scope-triple.d
new file mode 100644
index 00000000..41f7391c
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-triple.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: More than two consecutive D scoping operator characters are a
+ * syntax error.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(foo```bar);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-triple.r b/test/unittest/lexer/err.D_SYNTAX.scope-triple.r
new file mode 100644
index 00000000..4474c502
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-triple.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-triple.d: [D_SYNTAX] line 17: syntax error near "foo```bar"
diff --git a/test/unittest/lexer/tst.scope-user-explicit.d b/test/unittest/lexer/tst.scope-user-explicit.d
new file mode 100644
index 00000000..2d649f6f
--- /dev/null
+++ b/test/unittest/lexer/tst.scope-user-explicit.d
@@ -0,0 +1,22 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: testprobe */
+/* @@runtest-opts: -e */
+
+/*
+ * ASSERTION: Explicit userspace module scoping resolves as a userspace
+ * external symbol reference.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(&testprobe``main);
+	exit(0);
+}
diff --git a/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d b/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d
index 56c93d43..4de9322d 100644
--- a/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d
+++ b/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d
@@ -16,6 +16,6 @@
 
 BEGIN
 {
-	printf("sizeof(`): %d\n", sizeof(`));
+	printf("sizeof(`unknown_symbol): %d\n", sizeof(`unknown_symbol));
 	exit(0);
 }
diff --git a/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.r b/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.r
index 462469b7..0f46ad1e 100644
--- a/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.r
+++ b/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d: [D_IDENT_UNDEF] line 19: failed to resolve `: Unknown symbol name
+dtrace: failed to compile script test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d: [D_IDENT_UNDEF] line 19: failed to resolve `unknown_symbol: Unknown symbol name
diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d
new file mode 100644
index 00000000..51068c20
--- /dev/null
+++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d
@@ -0,0 +1,16 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: D scoping operators are not permitted in enumerator names.
+ */
+
+#pragma D option quiet
+
+enum scopeop_enum {
+	foo`bar
+};
diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r
new file mode 100644
index 00000000..06ef912b
--- /dev/null
+++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d: [D_DECL_SCOPE] line 15: D scoping operator may not be used in an enumerator name (foo`bar)
diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.d b/test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.d
new file mode 100644
index 00000000..6042e208
--- /dev/null
+++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: D scoping operators are not permitted in declaration names.
+ */
+
+#pragma D option quiet
+
+int foo`bar;
+
+BEGIN
+{
+	exit(1);
+}
diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.r b/test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.r
new file mode 100644
index 00000000..7b2e6797
--- /dev/null
+++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.d: [D_DECL_SCOPE] line 14: D scoping operator may not be used in a declaration name (foo`bar)
diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-member.d b/test/unittest/types/err.D_DECL_SCOPE.scopeop-member.d
new file mode 100644
index 00000000..5fe36a00
--- /dev/null
+++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-member.d
@@ -0,0 +1,16 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: D scoping operators are not permitted in struct member names.
+ */
+
+#pragma D option quiet
+
+struct scopeop_struct {
+	int foo`bar;
+};
diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-member.r b/test/unittest/types/err.D_DECL_SCOPE.scopeop-member.r
new file mode 100644
index 00000000..978ef79d
--- /dev/null
+++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-member.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/types/err.D_DECL_SCOPE.scopeop-member.d: [D_DECL_SCOPE] line 15: D scoping operator may not be used in a member name (foo`bar)
-- 
2.52.0

