Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C8716F288
	for <dtrace@lists.linux.dev>; Fri, 13 Sep 2024 23:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726270578; cv=fail; b=jlG1QlOWov3YsOE8Jf0oGnes0ao1X5V2rKMOUupZo9zuuUQPwCd3eQyAgvfwL+Uz1D4tA31dNfZssKqg8EMZQ1hD0xpbHDfTn2Oqnv2sNic01LqS55yXgSnvnEzAp+FEJ1O1KY6axZVrjFeiVdWxQV8mc/vcnwxOckaYsZD8lVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726270578; c=relaxed/simple;
	bh=McwcPMR9r6yCtAnP0q7MY9U3/pcLMvQl34+YIh4Nz7E=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=F1nVxloBaC5JPcGF3lBJc7+qZGP+Z9ljz8twV4h4GCBTecd7n9WKeskOxyDpTctqdIwlPph6f64Rwf2odBQC7NsvLHbivXnwNwbKw7PMS/CkYvuSab4CyQRltReJpnUqSCjDk23/PL/8g0RQ6J1a4BTA5qGSoE1rj2SprLqitwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=f/j8JdOT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=h7QbsfBG; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="f/j8JdOT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="h7QbsfBG"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48DJ0Xar015620
	for <dtrace@lists.linux.dev>; Fri, 13 Sep 2024 23:36:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=BOrDlgYSKU6y9oMqiewR0XbtCRv/jn3akrM+haxSNlk=; b=
	f/j8JdOT8UAlvSkZANzaQL55ZfkAPBx+IntwFysbagAwW8pbWxnB90I8W9X548ee
	5kjUiYpECCEeqbpRbo1p6v7tJJARfjUkSbpAvEq6ImgikNwA3EP9hiTFXdezD9S2
	FQ1syDKquoEH6nxg2/XB1mxutVSC4dGNusUsWEEpKFNh2nNQKGpIwbAuS+AXb/qk
	dlGBxVw1133TfmhKWpBH6QTyRsaEKx4JF16gWwDhmuplZnCNSdmm5/vECIB/vc4d
	MKdut1P/hozjpqLl9ouoYNH7M6+udmBoIulD0iKBdIwgM1PQ6d/xErfWT6s6IMBH
	llVisSNRu7Ak5vZReYidAg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gde0evnf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Sep 2024 23:36:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48DLSZLt033021
	for <dtrace@lists.linux.dev>; Fri, 13 Sep 2024 23:36:12 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41gd9kk3qt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Sep 2024 23:36:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MJ+EH8ChtU9yS4jOtxUzoKi2/DFHaghB4SB57wuUFfqP5/cTNDUGvpEqfykHHQoRG6fwJGHuHcHM0QJAquxGPdgHxpX46JlOcT/z7MCbvEZB+HqWE32zGOIenCFWJeU3Bs9lNHclea5eVMHvnNYezN1gdHzIoFZy7wvLWoUSGad3uzmbt3jruP2kfYTbXN8fkm0qjXiGRSF+R4cJGN/BIGnC5t/sd6hZT/8qAceE4RCk9pW1sZGEHdEfWun9dYlIv1DuqYBqztIqZlrwGsjGBxiJbatmdLoo8hM4y09A3SRW8ilLBbvWo8ACB0aGJ3okdEEgSfW0SSjSX1Z94I1O7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOrDlgYSKU6y9oMqiewR0XbtCRv/jn3akrM+haxSNlk=;
 b=x7i48fm5LY3RKvb0zx2D8CVFVS9p/16+Ej3RA++ZgeqPt4BwoeLwnzvYU2V7nfFP2fJVhqoipql9v1M3eIvvMxh7ztaTt/Ba6yCgchWzFmel5s/atn2iNg5JHutgByVKMoB7t2yLYnv+a98V3+X7wz8ucRdjPSS4h72kE0wYmvp2OFNL+A4EnUolnKG/YW+qAmHMl/b/KeKpRiiDG6QUSqy9o0aLgGG92VRXX9MhJMoXbLleOWBwR58kI8oLzny80fhl8q0+imkw3zfGcEhylgcOnmU7PqWyOTjDapfm5f8jJyfj5i/1/ceHtTMwYCWZnUSEGyd3q8uc8R2HjnM/Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOrDlgYSKU6y9oMqiewR0XbtCRv/jn3akrM+haxSNlk=;
 b=h7QbsfBGTD9R+blbJVS/ozcrNmFWh2XolWshwZyki3ft6ULuTWbbmshpq93nKjwuVitaaddcx9Ef43g450gJQjPpTyfFZhVVAx02b5o6PQULENEyCQ1VSP1IRZp/og1Mf0Ir7eoEoEkkufHeD0DW7wZr2OItikFwEK8zt4qar2A=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA1PR10MB6124.namprd10.prod.outlook.com (2603:10b6:208:3a8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.14; Fri, 13 Sep
 2024 23:36:09 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7982.003; Fri, 13 Sep 2024
 23:36:08 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Relocation processing of STBSZ in ERROR's get_bvar() is too early
Date: Fri, 13 Sep 2024 19:36:04 -0400
Message-Id: <20240913233604.21269-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0086.namprd03.prod.outlook.com
 (2603:10b6:408:fc::31) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA1PR10MB6124:EE_
X-MS-Office365-Filtering-Correlation-Id: 998bb0e6-0ccd-47d1-8804-08dcd44cd7a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2xZ7ER+eCiWnTGONkAoeM8NoWHamWUePbLjQ9wRTnFhu2k2MKT5sf0mLhKMY?=
 =?us-ascii?Q?IRZ1sln4Xz3zH4lbb2bOdpO4RWHnqbFondtDnbLlq4h3eQkHhVG/b75pp9jQ?=
 =?us-ascii?Q?NH5b2ZRWOppOTpw2mgKXeyT1iFHdgQfnfmHTC3tkWaiAEwI9OB3ON2El7Vva?=
 =?us-ascii?Q?aUvXx9eONS9NPMtNZcXwmOsBDlSRs9JQaHrretrFFwE7GyYO0hjp7AQ2lfxF?=
 =?us-ascii?Q?eBkT8yHlf1cNb3MrPIwzwVITpi6xYH/VufNfMYm4r43AX3SzCevbVnEEwzt/?=
 =?us-ascii?Q?ZB5jhtH/XVQ4rXx3mGhM/BO2mUj3Rm7wBkhTTi5pX8Wucl4N9P8WpOfLkDvL?=
 =?us-ascii?Q?LFM6izLj6fkZn7yE3KyyW+97PxBwhptSQwHrXC8kUHyYI5OStP1MYoYW8FQC?=
 =?us-ascii?Q?VqnomnSLiSjIPXIZuafsN2IQaxWiqo9SlX0Ubyaq/Bau4nhdKkGkr2RBayIY?=
 =?us-ascii?Q?rGfBaYQyI35FkJhHg4ywGfbGFkCzWwTOvb08GqJKhB6WG8WK8yAdw2gSjoVQ?=
 =?us-ascii?Q?XS2PPNGEBEk9gfGgmS/BYAOnzjgurafCgsl2+DvzysvRbhOF5C88gF4lAnUa?=
 =?us-ascii?Q?6ZLvzgDSvhzLe/MYPq1hhbsyTERfMqaM9ybaR8AJr3YMFDNiedoF3p7iqWlX?=
 =?us-ascii?Q?CraW3MnnvhBcUzHVhjHeM63i1yUDTaaM4IHGX3IDjj9WC1zgKQEC5cvr/3uR?=
 =?us-ascii?Q?OXIc1L6tUlXng9HgBdR9rwQPouZ/6H5/CChfGuU7gey98pQrTXZKXt3dqY9d?=
 =?us-ascii?Q?0X2TZp1Mmx2bIGT4DF5/to40NppRaZ6GI+qyust8zg02y7GXPYRz8Kye/omW?=
 =?us-ascii?Q?mPTV+zjS9SE0KjSxlpEhP03NFb0UN6ZCi4Fs0pmInDgclPf6dn9+7Aau+X6e?=
 =?us-ascii?Q?FpJ0FB3xTD3GnAKz5DOUTe1gyaxCFf9SL3cP8GWH7r4F4NJYU//32PoGP4I4?=
 =?us-ascii?Q?Rs7x/u35eqekBf8bJHFxxHGv/vk7FR1oW0rmMqNX3jpFFQ6bBYkONC3Ueqd2?=
 =?us-ascii?Q?WDxz6qp2Yo//t+aj6ycQvGLYqgxHrS90Vw5EBX4Xs2dx94Jcp7Y+RzW3SkcD?=
 =?us-ascii?Q?s3HPcJkRkkSAFRTStbWH4tB5ZSkzKg5fRhIyxUrhNRYaSzYdgB/u1CPyM6m+?=
 =?us-ascii?Q?8Urnxrztkr56CqEZnwtZU8ob0roGtS2z04y21SMEkSA5LLDRELYgooz112Yk?=
 =?us-ascii?Q?ilnjJOhvUBOh+i3iVD55ycmnj7qV3EftE+1M2yHxxKxDiYeQ528nRELAHFF9?=
 =?us-ascii?Q?lfAMSE8MAQWSrai89IqUhb3cMAMEvN013IQJrF7KtQGxX6MJ6VaL9pfvv6qE?=
 =?us-ascii?Q?v93y4z0C8ppOZSNUdey0O2TuU1Ticd1OERZNfbFJ5lI1xQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J1Es7hz5a2RhXGlpEGPNgTtjxuc++Pu78pTXwVLS4czDQpVkG5whiUzEHFiy?=
 =?us-ascii?Q?BXbzuWGUHbFjRDoDSg4YB8knmZvWo2RSInV4nWIdibAr6I73kYO+jQH+ewKx?=
 =?us-ascii?Q?tOsX4IZbsHNfZx2lrecX15woTsDtux3qRrwDQR+qjG6m3XJcu1hKDJBUJIdN?=
 =?us-ascii?Q?QIMVS28GQ2iJvh16K8TUnT0SXtFA03LRER8fdsm+Fq7CPxhgq2hAc+W9xE/U?=
 =?us-ascii?Q?kdwSixWx+MxZc6WPh8fyExv7gQL1D0olHhqKW+OxZPowKX/8bwxKk7kQq4Xj?=
 =?us-ascii?Q?gHDpV8sd/SumCWVwgxDHO4RVWZ7JqWCD5wF0wA1zGkS64iHcXlJ6ZbUc7rVa?=
 =?us-ascii?Q?yVsC8poGAW8HAJaBhJBY5lASVWsV9Tr3xbn9YGUNWbX0QOXQEc0p+4xvKTqI?=
 =?us-ascii?Q?QSoOG5i1/28wstZSA4rIKXgi0tjlgSL+GqL3l0Vkvkmt5PwbhlBTZw0mDD3k?=
 =?us-ascii?Q?fmbFH3Mm8udDKsCzQ3bjmHcahfa4UC7TmUA/suv9b2yXsfh1+IqZj3Qs3stz?=
 =?us-ascii?Q?P6wrhWRjC848nr2MCfh5QMUf0f+FKqMQPAAoPJF5iS59/IG1lbnxl8RATAM0?=
 =?us-ascii?Q?7imSDa4/zqOdaiANTMKG6j8VjXoqP8DPs6CawW8/53wQ28420ThWuPUw3/pR?=
 =?us-ascii?Q?NnRSeG8hq/VI/Tj5AN6S97vG5U2mfIzMMTcr+I5EXU2EwSgp55+EqjIEkC+b?=
 =?us-ascii?Q?cz1D2CgdXEDrId9O5lSUGhSgAbob3QQSZiunZhFGfsxoHCYKZ62v7xftWuaW?=
 =?us-ascii?Q?GnOjQ+Ka3BDkkfnwgIHMekYeinxuXovEvRO5/2DKT12co3hhI4TpDeX2M9fC?=
 =?us-ascii?Q?92y0Nq8ZDY9phsTupUghIhtGeAC/Pb1F8bUlm8h0OZSmiFyu9Wgi1F7TXNbv?=
 =?us-ascii?Q?slV9EDkJ4btABwQ99Xh+f4V06JTc2EpxixlTaD5GVrVNOtFgPSDdSgSHFnC8?=
 =?us-ascii?Q?dDMGwdnngdiGB/VqSGbQKaGM8lqOawVx22IKYiMjismjR699iom3MvjMl7MW?=
 =?us-ascii?Q?dk4esGUmBtz0WpgR8Qrwvni/MmcNxqzMOL9PjOIz5JDX/5Lw52bA3W/WRw05?=
 =?us-ascii?Q?yT3hZTZlIZsjo0zqbPCDRxHFN0NGIQXH5j61m91JZ4tugWYvTPsV+fZsDfsV?=
 =?us-ascii?Q?9Bw5LqbHG1keqB/COIz/UxsKKH6e2S8BuYqyKWgll/CvtuUogN9m1n2lvi4D?=
 =?us-ascii?Q?8lWDYZqU1M5Bz5/kJrojiY8XbvyfOUJ1iQAL9QNFS+spWhLTb3EAraQRHTxF?=
 =?us-ascii?Q?s6qnqjPZHlINK46H15HPGMONB8eCagVQiYTR9NFnrKCjOHGtfE4h/n9TYuTp?=
 =?us-ascii?Q?LT3IAL3+ZefGKcT/IoVKd66kwPOpWC6UV5irQVsowYomjQkIUfoN9eTkEH70?=
 =?us-ascii?Q?DGBT2TVjWJlwAgkrYxorejMtIlD1W289erFIiEN6xk+4/TO+yqokG4BLoPCM?=
 =?us-ascii?Q?JUtjsb681aTvBpkIcQ3VInDvR5wdlBXO6JOFo7jksFXDfQxS21CAcq1AVtFo?=
 =?us-ascii?Q?mtGFIBCwhGpM8iNMdtBE1TAIe8nfxXkGUnRCCaI6pdjSZIlxuCwvnpSxjdI+?=
 =?us-ascii?Q?7JIZDJGCOigDiJDGmGkaGXNkVAcl76+QAkilbALV?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pLv973TDjwn1Qhj3qM2Ut4SpynPJzLRggwfintSRWuqjv6EQnG4QgnSXNwUwOU6yFUPhv3b9j0MimEPMlH3h1be/SLGAwVrD1mq4mP0y2AXuPBJLonFvZFpuSgfU6pAiKG3AQl2JovNqRczvdEjA8fMzCtxoNE7o2SgW/dJz1tl3JTX+eDPyGj1/025ixvNh7cNpzSk9T91eME883F+zDLqttjrzHYRzGs0+aq7cj35VVBL79qc66Rr1Te4EHZ9Xr2dfmE0uOXo7Hzp6WT8qEOeYZGGD6mGfpUTpFUWCh1AZpUYc/KTfXpovsqeuXDxMrX+CBP5PkAI/XOxq8x2TqUrgBAYX8IZc86KTKGA3vsyKw8sP7737VvmWw8fjxNOaXbbaAICTvRrac1FRPhayoCIMcZgHbzHjihbn99VSYn/nPERHxHcA0YJWO3EnXR/hVzd48g6TrKBToW/5dYmNaZmTdAE62xcfltka5QgjYoutEwgYTPVAtNi5bAOYpsBcT59uuQIdXvPrUtNgxm7S+bHTTN4hbx04wteqH3oX5FsUtvlfOdPG+ntaRQMpqz9/CQB4YGGUGLmaGhx1Pxp0HQbwUrdDdjtLW6F7EAqAgNc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 998bb0e6-0ccd-47d1-8804-08dcd44cd7a1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 23:36:08.2373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r6vCXQ7AU8Lr/vQoUpOLScI28RoDfc4cZ0PVA7jvjm5WcFXZsVwHjLUBuBpJNtnH9606MrHggqSzfmRnQZQ1dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6124
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-13_12,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 spamscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409130167
X-Proofpoint-ORIG-GUID: 9U3Ejfj92Ms2JjXl1J9Lig2YFcykmklw
X-Proofpoint-GUID: 9U3Ejfj92Ms2JjXl1J9Lig2YFcykmklw

From: Eugene Loh <eugene.loh@oracle.com>

When we call dtrace_go(), we do something like this:

    dt_bpf_make_progs()
        dt_program_construct()        // just for ERROR
            dt_link()
                dt_link_construct()
    dt_bpf_gmap_create()
    dt_bpf_load_progs()               // other
            dt_link()
                dt_link_construct()

In dt_link_construct() we dive down and find dt_get_bvar().  One of the
relocations is to supply the value of STBSZ.  The first dt_link() is for
ERROR, while the subsequent calls in dt_bpf_load_progs() are for other
clauses -- that is, two separate versions of dt_get_bvar() are used.
Meanwhile, the value of STBSZ is not set until dt_bpf_gmap_create().
This means that the ERROR copy of dt_get_bvar() does not have STBSZ set
properly. This means that if ERROR accesses probeprov or probename,
dt_get_bvar() returns the beginning of the string table, which is a NUL
terminator.

Change dt_bpf_reloc_prog() -- which performs relocation processing for
BPF maps, necessarily after dt_bpf_gmap_create()! -- to check STBSZ
and set its value if necessary.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_bpf.c                          | 17 +++++++++++
 test/unittest/builtinvar/tst.probe_dtrace.d | 34 +++++++++++++++++++++
 test/unittest/builtinvar/tst.probe_dtrace.r |  6 ++++
 3 files changed, 57 insertions(+)
 create mode 100644 test/unittest/builtinvar/tst.probe_dtrace.d
 create mode 100644 test/unittest/builtinvar/tst.probe_dtrace.r

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 0df1a9b9b..5cce747fe 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -1124,6 +1124,23 @@ dt_bpf_reloc_prog(dtrace_hdl_t *dtp, const dtrace_difo_t *dp)
 				text[ioff + 1].imm = 0;
 			} else if (rp->dofr_type == R_BPF_64_32)
 				text[ioff].imm = val;
+		} else if (idp->di_kind == DT_IDENT_SCALAR &&
+			   idp->di_id == DT_CONST_STBSZ) {
+			/*
+			 * There is one other case.  Although STBSZ is not a map
+			 * pointer, the string table size is set when the BPF maps
+			 * are created.  So we may have to set its value here.
+			 */
+			assert(strcmp(name, "STBSZ") == 0);  // FIXME:  extra check for development
+
+			/*
+			 * Worry only about the cases that have not yet
+			 * been handled.
+			 */
+			if (rp->dofr_type != R_BPF_64_64 && rp->dofr_data == 0) {
+				text[ioff].imm = dtp->dt_strmax;
+				text[ioff + 1].imm = 0;
+			}
 		}
 	}
 }
diff --git a/test/unittest/builtinvar/tst.probe_dtrace.d b/test/unittest/builtinvar/tst.probe_dtrace.d
new file mode 100644
index 000000000..d08067ad0
--- /dev/null
+++ b/test/unittest/builtinvar/tst.probe_dtrace.d
@@ -0,0 +1,34 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION:
+ * Built-in variables listing provider, module, function, and name
+ * are correct from dtrace-provider probes.
+ *
+ * SECTION: Variables/Built-in Variables
+ */
+
+#pragma D option quiet
+
+/* Check build-in variables from the dtrace-provider probes. */
+BEGIN,ERROR,END
+{
+	printf("%s:%s:%s:%s\n", probeprov, probemod, probefunc, probename);
+}
+
+/* Cause the ERROR probe to fire. */
+BEGIN
+{
+	*((int*)0);
+}
+
+/* Cause the END probe to fire. */
+BEGIN,ERROR
+{
+	exit(0);
+}
diff --git a/test/unittest/builtinvar/tst.probe_dtrace.r b/test/unittest/builtinvar/tst.probe_dtrace.r
new file mode 100644
index 000000000..e6cccc88d
--- /dev/null
+++ b/test/unittest/builtinvar/tst.probe_dtrace.r
@@ -0,0 +1,6 @@
+dtrace:::BEGIN
+dtrace:::ERROR
+dtrace:::END
+
+-- @@stderr --
+dtrace: error in dt_clause_3 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
-- 
2.43.5

