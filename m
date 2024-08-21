Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFCC1494D1
	for <dtrace@lists.linux.dev>; Wed, 21 Aug 2024 17:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724261239; cv=fail; b=OWE7xcu/ba5978tysxlc/V5XbiHdfS+ywcGbveqNTvUJcHAKGBLVONf2VwUDhue9EWaOJVNIVknQb4QBicu5IOmnTqZsv/tGKq3apAv4h6pGs7LE9tdauEOdqdySxgDHmaLSNhoWaCbSCqU+5kvzpfCwXGLar4MdDOx/AxCKQfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724261239; c=relaxed/simple;
	bh=k00ZCg8hA9+PbnAZqL0sRh5dFcZtGe4l0mqq7F/5UIY=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=k5I3LyqNVRbFTZ/6rGY4Bf95FE1sw4PGMFCpw7YjBJn63V7tilhB9VglxFBXB5xPJmoUD0K70XvAS+s6D7v8Bh4G5aOn21FAGMMwxnF6I7xIsSiNhjyMWvVYDGt0Qud949nO+Bx6gNQ2VaKvZdXevAgX8RvdJmVPgsQcPoxynlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mYvJLLCh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cmiRWGZG; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mYvJLLCh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cmiRWGZG"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47LDIWgL028555
	for <dtrace@lists.linux.dev>; Wed, 21 Aug 2024 17:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=mPYASP334FpyznPWNgjRXP0gpoTEnJncOT6eoKH0j3Y=; b=
	mYvJLLChn3K6yy3CQSaoSo2ksfRoauLkJHlaYVhWZdktcdJ0vznmQDqnsSJhJaQm
	yKWIUK25HF/vAfzmxLQpMR0H/jE6tI2/WeZ3JHAxNx3cw53r2060kASkuR31juyV
	0soU9FZbcIP0dReRiHIv+aThyX4b9f00Kw4oeVTaRu8NW2ocje2sXL61ptOqlCGJ
	msOffiy1obKLp9+n9cW4EJvf99oSO32KLGtTB0TcNa0/EThvfGXyrjPZ3JAYCNBR
	/jCXWoFZZtVYnjf5rgPDpFDKS/Jg9e2ctk2Ujs8Kd+awHh+nh6XhHR5Rpm/5QJtW
	7sp152yxepd4Hdx55Y7fPw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412mdt04j5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 21 Aug 2024 17:27:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47LGsGDW009619
	for <dtrace@lists.linux.dev>; Wed, 21 Aug 2024 17:27:14 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 415m5vhga0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 21 Aug 2024 17:27:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E73v/AI8I3bHcmQoUb5MQd8Pmm6Vlz/3d5M6cmtjJq9mcAqBRDv/x8f++eujcq50tifJmBFkrg4KDIEbOtefFhF7F7o9Z3DhSXlImXa4R4vewPBw1Vf+SFnHcrGFMKocTLdEum/1y/sQWfoe9bRSA3ONZc30ujS8V7sZ2aTC7XmSSy5bYDDQIixFB8mbR5YoCSbmP8AIoVHkIbL7pU+xVy6XJq9rPChJWJX63XBApLqjPriKnn2sqJs1U3yMTvl0bGrZI88QHdRFLRkIfH7AULaI+9qd+IotBLWzzTIFrg6V50GUBTNHl1Wc5609bfVAtttfdfyUJb3s1PzV1NyDqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPYASP334FpyznPWNgjRXP0gpoTEnJncOT6eoKH0j3Y=;
 b=fSF63EPcoZhibqic3JK3TSWVgePeS2PDebcZ09etGftTKuoiO2NKbdQ2hSDbIGmBIYlvU5508dbDWKQzH5zGWYL3hntOuZo+Ad9VWxaTODfxLbw4MhL2991ZqMKQSNv1sQsrpTmFGmbMo5reoDRgItPCQP2M0yauqKgc2fN6we/viwbyInMSk62mS4V4XgPLwvgYzdyeIP1LDzHFzG//LFb72GAn0JGJ1Xn15/bMdX6BrGlRH4c8GguWvXD4xO8X8T/z0MWu6b3PSyAZVu1idiz2XYRsb03bdyRp4p7Vz/aJ6QWjhBgMndXYodKsSybayj627q8xJWi/rTC0kwsbaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPYASP334FpyznPWNgjRXP0gpoTEnJncOT6eoKH0j3Y=;
 b=cmiRWGZGN8fLsGmokxAMv3gHnWZBNKChQ1ChesGLDIWqivCIEiUxIqoKYLZpZXAS3VhzdxKDRQwrwG+beiFxxTKZf0TNgoLrMDHPXSimA9PHHbJEAmXvoHlZ2znfuNpSBBUFTrHibYjp30Ql78DqrrKvslMKXgWImKTpk/fkBKc=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CH2PR10MB4120.namprd10.prod.outlook.com (2603:10b6:610:7d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Wed, 21 Aug
 2024 17:27:08 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Wed, 21 Aug 2024
 17:27:08 +0000
Date: Wed, 21 Aug 2024 13:27:07 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] ioctl: remove obsolete ioctl definitions and ddead code that
 used them
Content-Type: text/plain
X-ClientProxiedBy: BL6PEPF00016411.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:9) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID:
 <SN7PR10MB6287296B328D2B3163F27C48C28E2@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CH2PR10MB4120:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a727b51-a686-4c73-6011-08dcc2067c05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NIZHwpanTjRgLJ3SxxUxYaPFirp8Wo0PsPh3U3DErMpjJkmlnOMCzGMS/tXw?=
 =?us-ascii?Q?R66Tu+utJKj7+GPfbPXNNIg1pyDG+0NrB0McIp0IH2CfEbo3lMaUWCKNZMQF?=
 =?us-ascii?Q?J1h1g77GLNxsLY7hEOF7U5zicnWZEozQvnEOi/Ln7tcG/L+WtFgSzIFC9AMi?=
 =?us-ascii?Q?waNThuERyi1g3EUuWck0wWSSXLHsfxX2oafsFRSZlltS2L+jMqccEz2i+tXk?=
 =?us-ascii?Q?a5BVoijlUSTQHY5IWRW7upjYPL+pFskl3UfM6u7aB2HLdyjljzuieBi6aFpV?=
 =?us-ascii?Q?GDTU3KyTCXeaMX8B7REDJ8noCaBxDBooou6YmC4DFE/D+9K578VmHdTkTtYY?=
 =?us-ascii?Q?LowX4wVePaMQgRp8I5M6NqdkgWS+0ujLIdH+sHbJdvchrNVq6hycXP/f3bCu?=
 =?us-ascii?Q?zkXRqORK2HsrXelkRPpe/QTR4rWtGNvpfw55jIUh6nPiYbTPdg94zAscaoQo?=
 =?us-ascii?Q?UcApcsX9jvP0fEbQYnjNGOs42LEk0bmmgQ5fVFahF/AxDj8P6jxkMLDgXcjG?=
 =?us-ascii?Q?ZF3Tu3tPrPKCeJyMYcAAxnSTCziUEhJATJnoMI3loeGlz6+ysulkAc/UvZ62?=
 =?us-ascii?Q?4njheGblIhDrrmBt8VZEboux4Alli0hTpol6B9G5LhjElPyF00s/3UHuXJKd?=
 =?us-ascii?Q?599sp6gM0aSdMPE/OwML0V/ebKtyGzaq61DL3YOIh1RNtKJ/024IvOxkV1Uh?=
 =?us-ascii?Q?kX/9R0wi1b0zka1An0Cz/wYkNswcceRSq6JbUjd1BiHFREoosfDilnLRojNN?=
 =?us-ascii?Q?33hwYLFD/J6AWUAUZgJQgSpC+DYgaSIuwFXmxcYL1uRvWBO/SthWeTGagguS?=
 =?us-ascii?Q?yyAu6Z0hnPD494tExqa95BVqOHKBok99EXsGXqhldrwa/YCZofpdcg0EqDw0?=
 =?us-ascii?Q?0UdtMdO+yT70MlYwT2u3LZKFEU3W/wUCBaCMkulJqi8b3xqsO9CD3s8qVUBT?=
 =?us-ascii?Q?OLR4vFN7UaivpY+o8Uxt5AVTQ2Qs2ICb2SH7cUIIdNNsSvyqB82oJtJ5+zxK?=
 =?us-ascii?Q?rx8I1e4vQbG4PTDNDSZ9DVYJqTj7AZVnalXc2ESagCUSARcAsn/zidhqwilW?=
 =?us-ascii?Q?JG/iKt6oeg9OBgJRrmXjTI3vX2UEHPNso37FdwyRBf1saDPZQP1hG/JUmHLI?=
 =?us-ascii?Q?5+XvyyKjOBbJPcqh7dw8R5abGA5i0fAYGAk9UNMICMbXXRml0maWJHdhDUHv?=
 =?us-ascii?Q?Jh7fqZFo7LDBN5Biuf+ZGVP8PcIbY/44l4gpiASWIY2raMzb7cAzgUYz/eOq?=
 =?us-ascii?Q?7Z//B+XEaN6vICIWycTPdNzuRRCYAmg3O40/Q/YxRDa4bYoIzDeqxuhmseaw?=
 =?us-ascii?Q?rFg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/aZyelkt+TdLZYaBETSVbzljy9ohmv9I/L1E1u6Sq/XsSsxnFFX/0zb3ZSNr?=
 =?us-ascii?Q?BEot1GYCQadIHVR30WX6N52FV6oapKMzA+25Hrod+5rHbG1+igVGFAr9p3Wh?=
 =?us-ascii?Q?jFx6wBqPny8YHDpJFKjkiUSDBgSy+2NcM2/ySr8r297sXUnXiOhO85vrDEwV?=
 =?us-ascii?Q?yRFuWnB9dqyPGyF4cPHZWqbFZ2JRSoXSBokK0b5TCYN1br2pfXNZY5ve2KFy?=
 =?us-ascii?Q?hInTUPVmms7vKDzH+TkvGiksbrpzTqd1bX9Bh5slJnEkriIHjvxwjpjRetmf?=
 =?us-ascii?Q?H34q6b90NAuxnQZeo7BWUr2j+YGfCgP08kYSnFK7vTZtJYVK/rBVW+FWMxVG?=
 =?us-ascii?Q?sccPbvb6tgu3kem1bTae9fOrgK/n2Fj4XE9uiYezGlDFiU3gP/tIwb6ecLc4?=
 =?us-ascii?Q?370KnT0k0jKGg9OS8pxhlXICfMhS58qTVGM892vi+LAB/uTgLqUA3P8kP4Da?=
 =?us-ascii?Q?fZ7oGLs6CqTTubiB9AhKDYmMzMKw/zs7YJAHq8ehsOZRi6dmu8l2OVnv8Pk2?=
 =?us-ascii?Q?E9esLq90lXdtMWaW9OjcwWPr18yCHaWtoFh22ch/HNLkf5RKrDjpDXxGN9tH?=
 =?us-ascii?Q?45ZYnx7QWCrRXZVezKH7OB9hzaSK03BxvMAmqmTCrdchqdwubV9CWVeGCnSj?=
 =?us-ascii?Q?ypr0sTLuQfHXsHCbxGeimDkYN781oFaFtKb9xHBt4+E+Ty/7UEZDYudSl21E?=
 =?us-ascii?Q?bTKMqETQq4la1zVMX7/FUZItKqwnOscCEf5uo9/QbqM047qkdI43qwNvRiyE?=
 =?us-ascii?Q?LbFSUWS3+IEBxSNVttgZKxSd0ioHW63wstoQ6RQj51j9Ia9XN+FxQ9+5wP/S?=
 =?us-ascii?Q?t6pH28L1SMYYHahHH8yQCdZ7asoJjWGTOW8cTeigSJ1CxIyQhAi40QY+XHAz?=
 =?us-ascii?Q?PnTBQtoan13MSoOdLLOd6/cwayoTAcizp8tLeyR/ul5Hyng8IhHDkZCTJ3uk?=
 =?us-ascii?Q?OR2KkvnuA0GlGlXylVz12Q7POHnjbxKPB5HAVNxzfrEg+W+lBK71ka9larlW?=
 =?us-ascii?Q?QHqlDiJqyva4L+gt3AaNP88ufZjPpYyaOpA5iwNErGXxENWIpzGPfAWAs7k1?=
 =?us-ascii?Q?v7YANO1nN8qwPQiX8Hn1EROI8bxdwKIh7FxlmWgSWUbB/y517lIzI4jDhQuQ?=
 =?us-ascii?Q?pj/dRwCbkrCJkqw0dXk3It5tEsEP7tN9QlaYukzFsRLlr5CmWcNpYy/PSC0t?=
 =?us-ascii?Q?WbaPnZeKgTr4l7FcqGm4IoPJj/bruJHuhm3vB6MN+yPNa8SnZO3vluchPasF?=
 =?us-ascii?Q?/x8auZBrQowbOxIn66UwhFONSKeIvf4LTA+Qnzqgkjy+kjmApnel96ZLh3Pw?=
 =?us-ascii?Q?0NU3JzdOP3IVic2prIgozwgo4yV8jGz0rWItsHsYO5Sm/2jpv1mIxo8SR0GY?=
 =?us-ascii?Q?jZjaGyV2xOL8zn9Ov+GkFqd32pHCzJ1gUrLtRJ7bBs9yJIyCOm+wW+B0izim?=
 =?us-ascii?Q?i9cwRl5MxTirWU32fcZukgvuEcVC2mTEX64Odif2v10j1HoZ+JPNfMgM71O5?=
 =?us-ascii?Q?U1ZLSHIx/pgNeRgFwYjJS5M2xgGBQZOFYNhWFPgTyZCVq+plfahG50gUAP5R?=
 =?us-ascii?Q?JK4IetTQEToXGtxS1HM85vg6aQNzjKv9JM26FzQYRFFY4roPW4O2zzDsitzD?=
 =?us-ascii?Q?UcOnrI4vyAAgRD5hHJatsnU=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6JB9/9REeWg3z8zjm5b0L4EszMhTPfZvnhBq9CMQHryNjhPWA4FbGvgZY91InvOmcIQ/nQzz5XJnP5lPqNi1C30bgn/BilonOvRnOEHeb62wcPSrfl0jH7DXFoRA4US7oT938w8zAuyVSbdLg7pMrPqeMgeF3ZIUMpIEC3Fgd7yo27edAQu0BeL0349/Cy8BznBh3v0jc8EpGMutOaob4mZue/8fUSB80svL8zSSENqJs/E+XBEa30fl0h2i3bwLYi5zCgeScEtQjT1MlSEIdmAMd1vYJ4UHU3xxd1qTnx4bkwA2N6CMk174QxscnJDEcOCJlcMndUBoOD4gGj4qYxN4p34g2zHkacLGD3tT69cRMWl4DoYlhyuznyipnCp4kgU2WH3y4W0l1K17qVohEd1hQlmxvzc4TAwBOWrCevrXAxMzW7F+jDeVlodSy1h44dKjvdcaUtBzfGRJcHKTLAXe26B81V9fdxUat5CX7Slvdj/fwlOUpSK/Gfg1Oz7CfmvxeFyNJZCgR7BwdNEjqC6xWRu6fBMV7Kglq2Qbt5MqfDHd7QhT2thmWChEb4RDhxh7EE5SWuabxLvLerQ984a1MFb9iH9PA3106n9PQ3k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a727b51-a686-4c73-6011-08dcc2067c05
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 17:27:08.6993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 50SAlRHglwdkbJ+OAv4pKvqZchyoLKcdLX23GyXD/nQJI46oymqUKq5EutG3671lpkjlJOHqRIxpbcFgg2Cg3upsmFTE5VmXmuJG7HxR55A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4120
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_11,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408210126
X-Proofpoint-ORIG-GUID: etvimk4_JdV7LDW8dyGiRU76vz_q1aI9
X-Proofpoint-GUID: etvimk4_JdV7LDW8dyGiRU76vz_q1aI9

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 include/dtrace/ioctl.h |  23 -----
 libdtrace/dt_probe.c   | 132 ----------------------------
 test/utils/Build       |   2 +-
 test/utils/baddof.c    | 191 -----------------------------------------
 4 files changed, 1 insertion(+), 347 deletions(-)
 delete mode 100644 test/utils/baddof.c

diff --git a/include/dtrace/ioctl.h b/include/dtrace/ioctl.h
index a2a3a93b..2273453a 100644
--- a/include/dtrace/ioctl.h
+++ b/include/dtrace/ioctl.h
@@ -9,30 +9,7 @@
 #define _DTRACE_IOCTL_H_
 
 #include <linux/ioctl.h>
-#include <dtrace/arg.h>
-#include <dtrace/conf.h>
-#include <dtrace/dof.h>
-#include <dtrace/enabling.h>
 #include <dtrace/helpers.h>
-#include <dtrace/metadesc.h>
-#include <dtrace/stability.h>
-#include <dtrace/status.h>
-
-#define DTRACEIOC		0xd4
-#define DTRACEIOC_PROVIDER	_IOR(DTRACEIOC, 1, dtrace_providerdesc_t)
-#define DTRACEIOC_PROBES	_IOR(DTRACEIOC, 2, dtrace_probedesc_t)
-#define DTRACEIOC_PROBEMATCH	_IOR(DTRACEIOC, 5, dtrace_probedesc_t)
-#define DTRACEIOC_ENABLE	_IOW(DTRACEIOC, 6, void *)
-#define DTRACEIOC_EPROBE	_IOW(DTRACEIOC, 8, dtrace_eprobedesc_t)
-#define DTRACEIOC_PROBEARG	_IOR(DTRACEIOC, 9, dtrace_argdesc_t)
-#define DTRACEIOC_CONF		_IOR(DTRACEIOC, 10, dtrace_conf_t)
-#define DTRACEIOC_STATUS	_IOR(DTRACEIOC, 11, dtrace_status_t)
-#define DTRACEIOC_GO		_IOW(DTRACEIOC, 12, processorid_t)
-#define DTRACEIOC_STOP		_IOW(DTRACEIOC, 13, processorid_t)
-#define DTRACEIOC_AGGDESC	_IOR(DTRACEIOC, 15, dtrace_aggdesc_t)
-#define DTRACEIOC_FORMAT	_IOR(DTRACEIOC, 16, dtrace_fmtdesc_t)
-#define DTRACEIOC_DOFGET	_IOR(DTRACEIOC, 17, dof_hdr_t)
-#define DTRACEIOC_REPLICATE	_IOR(DTRACEIOC, 18, void *)
 
 #define DTRACEHIOC		0xd8
 #define DTRACEHIOC_ADD		_IOW(DTRACEHIOC, 1, dof_hdr_t)
diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
index e1099d75..a40b90a8 100644
--- a/libdtrace/dt_probe.c
+++ b/libdtrace/dt_probe.c
@@ -186,131 +186,6 @@ dt_probe_key(const dtrace_probedesc_t *pdp, char *s)
 	return s;
 }
 
-/*
- * If a probe was discovered from the kernel, ask dtrace(7D) for a description
- * of each of its arguments, including native and translated types.
- */
-static dt_probe_t *
-dt_probe_discover(dt_provider_t *pvp, const dtrace_probedesc_t *pdp)
-{
-#ifdef FIXME
-	dtrace_hdl_t *dtp = pvp->pv_hdl;
-	char *name = dt_probe_key(pdp, alloca(dt_probe_keylen(pdp)));
-
-	dt_node_t *xargs, *nargs;
-	dt_ident_t *idp;
-	dt_probe_t *prp;
-
-	dtrace_typeinfo_t dtt;
-	int i, nc, xc;
-
-	int adc = _dtrace_argmax;
-	dt_argdesc_t *adv = alloca(sizeof(dt_argdesc_t) * adc);
-	dt_argdesc_t *adp = adv;
-
-	assert(strcmp(pvp->desc.dtvd_name, pdp->prv) == 0);
-	assert(pdp->id != DTRACE_IDNONE);
-
-	dt_dprintf("discovering probe %s:%s id=%d\n",
-		   pvp->desc.dtvd_name, name, pdp->id);
-
-	for (nc = -1, i = 0; i < adc; i++, adp++) {
-		memset(adp, 0, sizeof(dt_argdesc_t));
-		adp->ndx = i;
-		adp->id = pdp->id;
-
-		if (dt_ioctl(dtp, DTRACEIOC_PROBEARG, adp) != 0) {
-			dt_set_errno(dtp, errno);
-			return NULL;
-		}
-
-		if (adp->ndx == DTRACE_ARGNONE)
-			break; /* all argument descs have been retrieved */
-
-		nc = MAX(nc, adp->mapping);
-	}
-
-	xc = i;
-	nc++;
-
-	/*
-	 * Now that we have discovered the number of native and translated
-	 * arguments from the argument descriptions, allocate a new probe ident
-	 * and corresponding dt_probe_t and hash it into the provider.
-	 */
-	xargs = dt_probe_alloc_args(pvp, xc);
-	nargs = dt_probe_alloc_args(pvp, nc);
-
-	if ((xc != 0 && xargs == NULL) || (nc != 0 && nargs == NULL))
-		return NULL; /* dt_errno is set for us */
-
-	idp = dt_ident_create(name, DT_IDENT_PROBE, DT_IDFLG_ORPHAN, pdp->id,
-			      _dtrace_defattr, 0, &dt_idops_probe, NULL,
-			      dtp->dt_gen);
-
-	if (idp == NULL) {
-		dt_set_errno(dtp, EDT_NOMEM);
-		return NULL;
-	}
-
-	prp = dt_probe_create(dtp, idp, 2, nargs, nc, xargs, xc);
-	if (prp == NULL) {
-		dt_ident_destroy(idp);
-		return NULL;
-	}
-
-	dt_probe_declare(pvp, prp);
-
-	/*
-	 * Once our new dt_probe_t is fully constructed, iterate over the
-	 * cached argument descriptions and assign types to prp->nargv[]
-	 * and prp->xargv[] and assign mappings to prp->mapping[].
-	 */
-	for (adp = adv, i = 0; i < xc; i++, adp++) {
-		if (dtrace_type_strcompile(dtp,
-		    adp->native, &dtt) != 0) {
-			dt_dprintf("failed to resolve input type %s "
-			    "for %s:%s arg #%d: %s\n", adp->native,
-			    pvp->desc.dtvd_name, name, i + 1,
-			    dtrace_errmsg(dtp, dtrace_errno(dtp)));
-
-			dtt.dtt_object = NULL;
-			dtt.dtt_ctfp = NULL;
-			dtt.dtt_type = CTF_ERR;
-		} else {
-			dt_node_type_assign(prp->nargv[adp->mapping],
-			    dtt.dtt_ctfp, dtt.dtt_type);
-		}
-
-		if (dtt.dtt_type != CTF_ERR && (adp->xlate[0] == '\0' ||
-		    strcmp(adp->native, adp->xlate) == 0)) {
-			dt_node_type_propagate(prp->nargv[
-			    adp->mapping], prp->xargv[i]);
-		} else if (dtrace_type_strcompile(dtp,
-		    adp->xlate, &dtt) != 0) {
-			dt_dprintf("failed to resolve output type %s "
-			    "for %s:%s arg #%d: %s\n", adp->xlate,
-			    pvp->desc.dtvd_name, name, i + 1,
-			    dtrace_errmsg(dtp, dtrace_errno(dtp)));
-
-			dtt.dtt_object = NULL;
-			dtt.dtt_ctfp = NULL;
-			dtt.dtt_type = CTF_ERR;
-		} else {
-			dt_node_type_assign(prp->xargv[i],
-			    dtt.dtt_ctfp, dtt.dtt_type);
-		}
-
-		prp->mapping[i] = adp->mapping;
-		prp->argv[i] = dtt;
-	}
-
-	return prp;
-#else
-	return NULL;
-#endif
-}
-
 /*
  * Lookup a probe declaration based on a known provider and full or partially
  * specified module, function, and name.  If the probe is not known to us yet,
@@ -339,13 +214,6 @@ dt_probe_lookup2(dt_provider_t *pvp, const char *s)
 	if ((idp = dt_idhash_lookup(pvp->pv_probes, key)) != NULL)
 		return idp->di_data;
 
-	/*
-	 * If the probe isn't known, use the probe description computed above
-	 * to ask dtrace(7D) to find the first matching probe.
-	 */
-	if (dt_ioctl(dtp, DTRACEIOC_PROBEMATCH, &pd) == 0)
-		return dt_probe_discover(pvp, &pd);
-
 	if (errno == ESRCH || errno == EBADF)
 		dt_set_errno(dtp, EDT_NOPROBE);
 	else
diff --git a/test/utils/Build b/test/utils/Build
index 1398822b..494806fe 100644
--- a/test/utils/Build
+++ b/test/utils/Build
@@ -3,7 +3,7 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
-TEST_UTILS = baddof badioctl workload_kernel workload_user showUSDT print-stack-layout
+TEST_UTILS = badioctl workload_kernel workload_user showUSDT print-stack-layout
 TEST_SCRIPTS = check_result.sh clean_probes.sh cpc_get_events.sh cpc_temp_skip_bug.sh perf_count_event.sh workload_analyze_loop.sh workload_get_iterations.sh
 
 define test-util-template
diff --git a/test/utils/baddof.c b/test/utils/baddof.c
deleted file mode 100644
index 5f844625..00000000
--- a/test/utils/baddof.c
+++ /dev/null
@@ -1,191 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2007, 2020, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <stdarg.h>
-#include <fcntl.h>
-#include <errno.h>
-#include <math.h>
-#include <string.h>
-#include <dtrace.h>
-
-void
-fatal(char *fmt, ...)
-{
-	va_list ap;
-
-	va_start(ap, fmt);
-
-	fprintf(stderr, "%s: ", "baddof");
-	vfprintf(stderr, fmt, ap);
-
-	if (fmt[strlen(fmt) - 1] != '\n')
-		fprintf(stderr, ": %s\n", strerror(errno));
-
-	exit(1);
-}
-
-#define	LEAP_DISTANCE		20
-
-void
-corrupt(int fd, unsigned char *buf, int len)
-{
-	static int ttl, valid;
-	int bit, i;
-	unsigned char saved;
-	int val[LEAP_DISTANCE], pos[LEAP_DISTANCE];
-	int new, rv;
-
-again:
-	printf("valid DOF #%d\n", valid++);
-
-	/*
-	 * We are going iterate through, flipping one bit and attempting
-	 * to enable.
-	 */
-	for (bit = 0; bit < len * 8; bit++) {
-		saved = buf[bit / 8];
-		buf[bit / 8] ^= (1 << (bit % 8));
-
-		if ((bit % 100) == 0)
-			printf("%d\n", bit);
-
-		if ((rv = ioctl(fd, DTRACEIOC_ENABLE, buf)) == -1) {
-			/*
-			 * That failed -- restore the bit and drive on.
-			 */
-			buf[bit / 8] = saved;
-			continue;
-		}
-
-		/*
-		 * That worked -- and it may have enabled probes.  To keep
-		 * enabled probes down to a reasonable level, we'll close
-		 * and reopen pseudodevice if we have more than 10,000
-		 * probes enabled.
-		 */
-		ttl += rv;
-
-		if (ttl < 10000) {
-			buf[bit / 8] = saved;
-			continue;
-		}
-
-		printf("enabled %d probes; resetting device.\n", ttl);
-		close(fd);
-
-		new = open("/dev/dtrace/dtrace", O_RDWR);
-
-		if (new == -1)
-			fatal("couldn't open DTrace pseudo device");
-
-		if (new != fd) {
-			dup2(new, fd);
-			close(new);
-		}
-
-		ttl = 0;
-		buf[bit / 8] = saved;
-	}
-
-	for (;;) {
-		/*
-		 * Now we want to get as many bits away as possible.  We flip
-		 * bits randomly -- getting as far away as we can until we don't
-		 * seem to be making any progress.
-		 */
-		for (i = 0; i < LEAP_DISTANCE; i++) {
-			/*
-			 * Pick a random bit and corrupt it.
-			 */
-			bit = lrand48() % (len * 8);
-
-			val[i] = buf[bit / 8];
-			pos[i] = bit / 8;
-			buf[bit / 8] ^= (1 << (bit % 8));
-		}
-
-		/*
-		 * Let's see if that managed to get us valid DOF...
-		 */
-		if ((rv = ioctl(fd, DTRACEIOC_ENABLE, buf)) > 0) {
-			/*
-			 * Success!  This will be our new base for valid DOF.
-			 */
-			ttl += rv;
-			goto again;
-		}
-
-		/*
-		 * No luck -- we'll restore those bits and try flipping a
-		 * different set.  Note that this must be done in reverse
-		 * order...
-		 */
-		for (i = LEAP_DISTANCE - 1; i >= 0; i--)
-			buf[pos[i]] = val[i];
-	}
-}
-
-int
-main(int argc, char **argv)
-{
-	char *filename = argv[1];
-	dtrace_hdl_t *dtp;
-	dtrace_prog_t *pgp;
-	int err, fd, len;
-	FILE *fp;
-	unsigned char *dof, *copy;
-
-	if (argc < 1)
-		fatal("expected D script as argument\n");
-
-	if ((fp = fopen(filename, "r")) == NULL)
-		fatal("couldn't open %s", filename);
-
-	/*
-	 * First, we need to compile our provided D into DOF.
-	 */
-	if ((dtp = dtrace_open(DTRACE_VERSION, 0, &err)) == NULL) {
-		fatal("cannot open dtrace library: %s\n",
-		    dtrace_errmsg(NULL, err));
-	}
-
-	pgp = dtrace_program_fcompile(dtp, fp, 0, 0, NULL);
-	fclose(fp);
-
-	if (pgp == NULL) {
-		fatal("failed to compile script %s: %s\n", filename,
-		    dtrace_errmsg(dtp, dtrace_errno(dtp)));
-	}
-
-	dof = dtrace_dof_create(dtp, pgp, 0);
-	len = ((dof_hdr_t *)dof)->dofh_loadsz;
-
-	if ((copy = malloc(len)) == NULL)
-		fatal("could not allocate copy of %d bytes", len);
-
-	for (;;) {
-		memcpy(copy, dof, len);
-		/*
-		 * Open another instance of the dtrace device.
-		 */
-		fd = open("/dev/dtrace/dtrace", O_RDWR);
-
-		if (fd == -1)
-			fatal("couldn't open DTrace pseudo device");
-
-		corrupt(fd, copy, len);
-		close(fd);
-	}
-
-	/* NOTREACHED */
-	return 0;
-}
-- 
2.45.2

