Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A676EAE7
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 19:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759175251; cv=fail; b=ICd8iUJZ25Vs9UI5zwbLwiQ2YdmZwdB0PuWtZ7zznfFiuuXqI7FF/nPOx2LLZvuNBmyRE6W2VHskmEC11Bq4i/THx5Qr15vm3VWPFUlSf0AIqS44Su3DmojaJgRAe7iiC85GI/z/Kzhyj/tX3yDn7+A858x1gmrDEUIzYGPUNJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759175251; c=relaxed/simple;
	bh=mPiwkhzWrbfvR37i/MOutNjqIsM7nt0+svTWpQBFa1g=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=hPuDgCB6xmHQsyc0fOcWvi+g7imZXodcEZ2lFYIGd6Yc7+G7hFij9nvS+qgbDVfRr1YtWYTynoe9t5vsI6h2yiutrqDqXgjdebi/1v6gRKCRaFrVb5lDMW9B9gASZCy5D1ccm3KxNJpy3UI/824L2QRSMy5gO1rMkEk5j6RAX7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UdB6jmTm; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mZ6S2bwC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UdB6jmTm";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mZ6S2bwC"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58TJK2CR017130
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 19:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=g9B06WRBsPCXpSIluurQPpUYgAF1rkiNNrRrRihDRX4=; b=
	UdB6jmTmeV7uPZaadE6T22hG0q4Z0ajh0pdQERGqoLUXN/w78lr9lBNPr7N43IMC
	a4ulz9P41Lyw/E3RV2rr4FJX7xsx0JsBbY0y/5uln4yBOTh4+AB3wXxLk8VEiJgg
	R1+5EQod/TbHfFdOC2hXB6QWVFaTZts/0WrrHU72A/Ou0VtpJQ22avBviIyCSFSd
	s68ujP1rAliSgpbpip6v4gi3rR9rzCGEA9IRLtrDZ6BWBjvsQVNmEJY2ClYiv5VP
	tD9EoGnyM1qi7e0EE03sbVmfZYI8XzV/K5yWDLA0vsJgImgoJS3FcNtMHmswxOOp
	UROD34AY1NmhWbjm2tTGiw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49g05u81bn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 19:47:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58TI3W5x001490
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 19:47:26 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010045.outbound.protection.outlook.com [52.101.46.45])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49e6c6wacu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 19:47:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0RvlCrN2AtitwwpyLr4hn2+chwSxARfOWpLA8KzAqlwzbqgYFUTXJNBNpFffz5F5pgdeWFBce3cLqbfllWx3lYPIIdMI36VYCv3SS2OivkgscoRiNosPkG++CxruthPWYuh7dJ4wyyt5sK/QpDqXt/RFRF8kpbU7tcJCkWfWKLBt35ZwTPfnhjtZdpy8EADFOZ+pn9RX1Y12UMzkuUtCHeQ4mhRXV316sUULopU7AKYNRu2hqjeS+0d9GhPDiNlYXZgYtmTi+eOmYoiOcH/3J50X7r/uhchInVFeEPsXfsyl8Wvj8EBnM/zL8Q2RIO2tJYkDN4vr48WY/GvFEqZRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g9B06WRBsPCXpSIluurQPpUYgAF1rkiNNrRrRihDRX4=;
 b=R10H8q2XtHn5w6wkp+vsMCRGCTS7Xes3tW1lZzAtdydJ1IdQzkCbFaNqJc4tdZDKQSkR0T8k+BU0zr6E3O1Rak05GnRJ5+XWjJUmHwAbRasXRMAikBUYL/exdMax15FdepUbfYpjLxINVURXdP7CDuIUtHtKedZ8r6uSV+pFzvTrRlbL97loIQGealimOOjEzWlIfz5g9idk+hc28EW8uY6ukpcr+d5vqY4M6vyRPTC7I9FwQ7HAK4Ubc2SiOb1ypEFPNVrsMIC77ys7yd9mQq+zDHaRAuzvOb+4yW5MUWL1VnlFYIIfQ3cMh0ymB34BGIPPh8zUGWWyJnkx2UYEKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9B06WRBsPCXpSIluurQPpUYgAF1rkiNNrRrRihDRX4=;
 b=mZ6S2bwCLWklloOYuuOMlJ5ZRS/1uDx/2e0ygMUmM66Wij1qL5/aOyDl/BezvHDxZT/Kz4UUPu4A6PFff2SCEOlJKLj7VKF2dU1IL5/D+AEJiAwo1WPrK9aUG1RimA/e/zRcSm38/NUJbQxLp1edvCRpmdT3J0And5ujxgExlkk=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA3PR10MB8299.namprd10.prod.outlook.com (2603:10b6:208:576::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 29 Sep
 2025 19:47:20 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 19:47:20 +0000
Date: Mon, 29 Sep 2025 15:47:18 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 1/2] Unify the handling of stack traces in the consumer
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:208:36e::20) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672F069BAF1EFCA418B0A91C21BA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA3PR10MB8299:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a08e337-a8fa-4549-d3c5-08ddff910095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+AeSNwM3GBtJK1kQanQGeSwPADEGfhaBEjMwVaTIvHjXPiMo6QOGbTSdu0xL?=
 =?us-ascii?Q?H+/IbxsQ9kid4ub2XQCiSHoIaR6P36pX8J4TZR4mVtF9w8Wwq8sA+9NLr8yr?=
 =?us-ascii?Q?gopAJnIL6pmW4e7ttKr9Ljje1DgtqoEgBlG4musZDLRTowDVXPv30Vw0CbUz?=
 =?us-ascii?Q?zJTT4zTckqYCSag51XVc9iI3rYsw40H+uifcognOgMKRQxZQdv0puEwpS7/I?=
 =?us-ascii?Q?dKIXTKdk2WASCDdse7SuRgfw2qoMvF1EjKo3F7JPNhjop6WxqERK5DUCswsm?=
 =?us-ascii?Q?VICHkJHhnIomka1xTnzNekmcKCV7eUUPUQXAuW7Fj5sdJFLR8pvvd9XS2lOK?=
 =?us-ascii?Q?LT20vqwCaRMrHWbIclay7JEyGDJUHgt0/0Rxg3Amq4UWIxWNTfElSRC2mI0W?=
 =?us-ascii?Q?kl3BbTKZurXKwxVKz6+9JUKZG4z0BZQyKWE/fGeSZDZZZ9PvvKzk0nnYRHXR?=
 =?us-ascii?Q?Pm2DO/Mbz7aYYjmf426sL+AkzCp9Tmto0GeaVFZjNgahUCfh/hd5fbw3pIF5?=
 =?us-ascii?Q?eknJ8lZQLXYZwN9J8sRCPrDTRp1uNVyyxS6c8fiQ5vjqlTfI6B4jfMt0YI/I?=
 =?us-ascii?Q?bqWXGdTZxsf7V2IIksyGYaH7efYbaDOQzP8aMI2qU9wj1tKfjmmRoT4pYKLI?=
 =?us-ascii?Q?7l+WXFqHRo3FZ8H1RiLA7Pa/InrpPOdip3R0oPCrNqLYX2Dsh25JALaYiUuq?=
 =?us-ascii?Q?gEKW3Dcr0mO6O82IXrIwthmui58dtCItHVrOFov4YUIJ5QS/kt/muB32XpZS?=
 =?us-ascii?Q?Pv9tNUB3Ap+1TuPrLzo0GZtWXRqfgtrxy7SAOMXedPQZpFkPUQerLtaO/Qmi?=
 =?us-ascii?Q?nkB0rLcSzSKo9hGFmw9Qq0sSCN6gwig5gQZg9KvozN8H9+jxmLyoHt+KUYyT?=
 =?us-ascii?Q?5V9tMczJ6VCPY8ivHWs8roiGEeMbUQwdh+JJTSoY5tCUPW+BWmrJNwOuB6mc?=
 =?us-ascii?Q?yZLmpuhDcHPnmSKjeyafpQLzn47tAHRbsuSpZyYzTTgfZFBexSJ2561dwAnS?=
 =?us-ascii?Q?awL5XmNrcJULKIbfncs2fcVP99VN8xJ9lZFBVVk5z4vVBEI6VVhZgxoHImGW?=
 =?us-ascii?Q?70bbJMS8DFVQCz+M0BdbFMUiFu2HGQAxPu7q3ORW504FRYnnHPKgd281BSuw?=
 =?us-ascii?Q?iDP/hj85EFNd0zcVGN1aNVNrtzyMqvi+akxfktmmeYLr7IYVO8zCOW2lI6P5?=
 =?us-ascii?Q?00Kj85O//iMMML6GKpoqPWEx2TcAeUvdnoJPwcGy9iIZpXLM+R/fwbz2EacU?=
 =?us-ascii?Q?ueOgFGjIDTFwU+vnN3jyZmd+5Y2wTNMRZgbEDyVjla5rT/xRuwrxuadv8KHv?=
 =?us-ascii?Q?Qmt4B8/no3MmvCyisRtGWFRgrjyfV7PjRGMw3G1PvphKT8E2FgIKznt0THTK?=
 =?us-ascii?Q?XwJ3Njl//XgLou9vWDvJintKEgnPeptmod5TJnpn+O/481ET3g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Iz1UxrYg1aSb10kwLXEI0MrSN7ylEwcOu5+7GxNQMr9brWbI2xGVCITQydMP?=
 =?us-ascii?Q?u3Isp4PiUf7fT/zGP1nXQ0n37G3v3JBpnfk2udtsFWCmQSgudRRecsqEz5O9?=
 =?us-ascii?Q?34uZQ5BY4jLWGfN52vKtryQajyz3kCyR1K88/a3S6YSQuxNsSVsNxZOakJ0i?=
 =?us-ascii?Q?V82oNXxPDXGcYVxfNnwD63Uf9genPty4ECHN5PJ2YzB9nndMG+P1hZvnCAZl?=
 =?us-ascii?Q?NA8VqSV+mLi7VvpviGiH2eSOxpfDvJsrb4fsGraHC+8ML+UcW97dd18Gc46E?=
 =?us-ascii?Q?dAbLOq8XoNIfxh7fGtFvTjs47BXqFmdKe/atItJhFoe2YHq1cg26vT6buZmO?=
 =?us-ascii?Q?xTjeXoVh/FaTluWgsTiXlMwScZXAteFCQk4Wr/DuSkS0WdVKJN8FYI/jmzox?=
 =?us-ascii?Q?APBngQzRviHyNFzvip3+wFc7/PsLsVOIXLZCCMSudfuGRSKvjFyd+3PPnrey?=
 =?us-ascii?Q?X9TFAcvF3aVS7i4L2NePDlEiXx3bd8RtN2yoYlikycXrI+yHQ6NysEWISgad?=
 =?us-ascii?Q?YHLXCb6xFjsVQFWEOEM+JzpFbCX6q60AfQWChxbZadOZNmuyQ1lWXtv0kr9K?=
 =?us-ascii?Q?3V9pNyzFBTO4hT985ROE8TzXk2uZBePkJu0Rp7pOVEnvdXoIPI9oRtazN510?=
 =?us-ascii?Q?aRTpYBl9HNbDmpYkMoETHvlr7RJUQTaTZJCGJoQFFGivzVJyE7QOz+7mHmtV?=
 =?us-ascii?Q?r0A4mKmM8XtzT1cx8X87/wyTMJo5YzGgogQzDC0qDaVKlGqbKc3gBBH5KQ55?=
 =?us-ascii?Q?HWd+yv//V3qRRKg03gclCUZJGdJoBXPPD2ikWDLU2VQ0Zi3vlkj3NUQGUHk1?=
 =?us-ascii?Q?BN5BQZZuABGrEj5cJhEvGp3DMsMWIAOggOvH5O5eKYwShndw6iwkUMKb2Qs6?=
 =?us-ascii?Q?fgrk71nlgVMyZ2yUbsvNr4D2WCnkjGwzTrKqyJaYSjnZ36BdIJCst2G/xrjP?=
 =?us-ascii?Q?oxH1Whqt/w3T4DuGEcWoJLFrDWyQ7TKigvoIlDz+dAD7UM1HffLq+Djnnli9?=
 =?us-ascii?Q?vPs6AaXaRkKup2a8uni6BVza5wEYzWNy3eULf82UlygGL0THJBaGRbxNK9vf?=
 =?us-ascii?Q?5iCOc38jMWKYpnXfDcfeK1Uciw2Mfy9Na4d9aYec7CCeZj2ZVmlrbPVWnhh+?=
 =?us-ascii?Q?e0n6sCkmQEAaZszyPMIMio1md2BY8OY3rXLPIDUi9N4Z8VOvurDxPPn43GdE?=
 =?us-ascii?Q?p2wmuIXVgPlDzNFtDyKB5wIz2GWPwHSgu06h1X3nRis1XQjLr5D+3gDmcIc5?=
 =?us-ascii?Q?BMovvWAE83pXngUVj1Dg29ZNYx4LdMTSHDEghzhRxwHE/FYL4Ja6I8RS+Z7e?=
 =?us-ascii?Q?ebNxjo2L0EfSYHRHKn6Jp1dBe6tMiMQBuFw0I3n1vWUEZHXP3AFl/5zqv8KL?=
 =?us-ascii?Q?Ngd+qmSpJPWCxrzURQzYBzPJMncVKlJ3lIG8DuUXNxrkHgRak6wEP0oquWcU?=
 =?us-ascii?Q?MFIMXWL6XcRT2ag1z/oSP06HERxNWlVRCRsoeaiC8+qZGBeHeV5UlVnfB7Md?=
 =?us-ascii?Q?jRHxAMVSp9Kkl4Sju1HVDGDdn4u8MFIliXTTUCKtXHOhb1AdqWwBdv3imGd0?=
 =?us-ascii?Q?7xYzvPDs/Wj+wABK4ihEmwgayLzmUNSgepmasF2Xs9IAfQuOx+SaW+byyHIq?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	C9FdAnl0Ul9hluqtQoae883x/V0mNv8UmKj9w+L5VpO/x5HEZgq+LiafJwAwEg3gTvkGy16Zszf2tRuHorKvXzNmpwpQaOD/IyE6+shaxCKWasGK6FabVTsDdYDOHehYO3e+vJSXuQtrbQheHbNdP6n7nXK3Wx63f4+j49rfhK2ml8S1aVPVyI/g6lNx0zmE17Z3NhQRXnh6CO52HhozaIPxs7g9zHVUzX5uDUXj9FH9IFzapM2/oho1QTRbeEoSj08M6e9h9FtVD7lvnLs9aHCqW5SQ28PWYpBKsC50BIAosh1BwWCfsW1QBOUAVET5LfoFsuj80xS4JaUs7lq3wCTPg1vGmv6w9mN3LjD3eqsese/hFgpluXqO4rfY8mZqASkF4M97+3VHZy44mTxkGEOugeXFZqZP7hW7Yos80mxD8cuOzNMgMhWadnudHrGWPP9MoUIaMBsHsF5ZQWpm2gg5zpE5pQEd18eVBfcdULie2EF7PRUB/M5ijy1J3uyU18ADZg8kISAc/APLE+KlxsXedhNCf3Wd3LFldAdsqtB6vhzUqk6cK463nDK3+TwfwF3WDP+e41I+MvIr6/dzI8LDcyUCjIWusYvvpqbZhvE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a08e337-a8fa-4549-d3c5-08ddff910095
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 19:47:20.2896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Jg84HRNoLW0u/OnBVJogutWL75acpPyEOd2vcNifP6A6cwv0g6NAoDnMRi3Lq5O63Y+bk6Ocj5qM5/QRqz5SBCq9uIPQhLBgvr6fKFDSN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8299
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2509290183
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3OSBTYWx0ZWRfX5nO/ejTv/fbI
 CFMJgcfyfrab6PXMLfJX55CB/jkXNdQPEJQ9NgDDCptVdvncRaZbqjXBXTT7ukURCGsT+8aiS8H
 x+uqpPiqreujAS7f5YKikQOV+ahoUAPaCLxrQ0uz9A8L6adpiGIBq294L//cpnCK0DvBNJYxrpJ
 VlJ8T8QOWgzMQA7D3hufnnPPUaabkYGhgz2oWCcStvSYrw8w38Cl0eul3AR5GW0NYp943lVjnlE
 9U4Y7ezOsA7Nxv6X+pC8qFq9L0eNPeTmIcwaPz4YNnwcGknTxi7Vxn5ySBjJiHB8w7KI3Z+BGjW
 Jkvx1sGt+0LC511jMOCTWafjGMYX6iNMkI445JzZlnJLJ5J8+PkPf6qXzh1JNnv2RddHpBfyBet
 BU4FmW10p1XbeOJaDXLsVuVVMoJ/DyWYKC9BcxlS0JMGdvOYw5o=
X-Proofpoint-ORIG-GUID: LuQ_tfT_qsaVoZwqFnI5uPbnC7pw02J-
X-Authority-Analysis: v=2.4 cv=NJLYOk6g c=1 sm=1 tr=0 ts=68dae250 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=COeFz9NrP-T0hWRnN0AA:9 cc=ntf
 awl=host:12090
X-Proofpoint-GUID: LuQ_tfT_qsaVoZwqFnI5uPbnC7pw02J-

Distinguishing between kernel stacks and userspace stacks was done
based on the action id, even when used outside of action context
(i.e. in aggregation keys).  That is far from ideal.

Encode the stack type along with the nframes and strsize values in
the  data record description argument for stack() and ustack()
records.

The macros for managing that argument are moved to dt_impl.h since
they are internal to the DTrace implementation.

All printing of stack traces is now consolidated in dt_printf.c as
well.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 include/dtrace/actions_defines.h |   5 -
 libdtrace/dt_cg.c                |   6 +-
 libdtrace/dt_consume.c           | 256 ++----------------------------
 libdtrace/dt_impl.h              |  13 ++
 libdtrace/dt_printf.c            | 263 ++++++++++++++++++++++++++++---
 libdtrace/dt_printf.h            |  14 +-
 6 files changed, 272 insertions(+), 285 deletions(-)

diff --git a/include/dtrace/actions_defines.h b/include/dtrace/actions_defines.h
index 1a9c1a81..7c2f7dda 100644
--- a/include/dtrace/actions_defines.h
+++ b/include/dtrace/actions_defines.h
@@ -156,11 +156,6 @@
 		(uint16_t)(((x) & DTRACE_LLQUANTIZE_FACTORMASK) >> \
 			DTRACE_LLQUANTIZE_FACTORSHIFT)
 
-#define DTRACE_USTACK_NFRAMES(x)	(uint32_t)((x) & UINT32_MAX)
-#define DTRACE_USTACK_STRSIZE(x)	(uint32_t)((x) >> 32)
-#define DTRACE_USTACK_ARG(x, y)		\
-		((((uint64_t)(y)) << 32) | ((x) & UINT32_MAX))
-
 #ifndef _LP64
 # ifndef _LITTLE_ENDIAN
 #  define DTRACE_PTR(type, name)	uint32_t name##pad; type *name
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 6e70331f..51473667 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -2701,7 +2701,7 @@ dt_cg_stack_arg(dtrace_hdl_t *dtp, dt_node_t *dnp, dtrace_actkind_t kind)
 		strsize = arg1->dn_value;
 	}
 
-	return DTRACE_USTACK_ARG(nframes, strsize);
+	return DTRACE_STACK_ARG(kind == DTRACEACT_USTACK, nframes, strsize);
 }
 
 /*
@@ -2738,7 +2738,7 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
 	/* Get sizing information from dnp->dn_arg. */
 	arg = dt_cg_stack_arg(dtp, dnp, kind);
 	prefsz = kind == DTRACEACT_USTACK ? sizeof(uint64_t) : 0;
-	nframes = DTRACE_USTACK_NFRAMES(arg);
+	nframes = DTRACE_STACK_NFRAMES(arg);
 	stacksize = nframes * sizeof(uint64_t);
 
 	/* Handle alignment and reserve space in the output buffer. */
@@ -8700,7 +8700,7 @@ dt_cg_agg(dt_pcb_t *pcb, dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 				case DT_ACT_USTACK:
 					arg = dt_cg_stack_arg(dtp, knp, DTRACEACT_USTACK);
 					kind = DTRACEACT_USTACK;
-					size = 8 + 8 * DTRACE_USTACK_NFRAMES(arg);
+					size = 8 + 8 * DTRACE_STACK_NFRAMES(arg);
 					break;
 				case DT_ACT_JSTACK:
 					kind = DTRACEACT_JSTACK;
diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index 280ed42a..eca2139f 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -1079,232 +1079,6 @@ dt_print_tracemem(dtrace_hdl_t *dtp, FILE *fp, const dtrace_recdesc_t *rec,
 	return nconsumed;
 }
 
-int
-dt_print_stack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
-    caddr_t addr, int depth, int size)
-{
-	dtrace_syminfo_t dts;
-	GElf_Sym sym;
-	int i, indent;
-	char c[PATH_MAX * 2];
-	uint64_t pc;
-
-	if (dt_printf(dtp, fp, "\n") < 0)
-		return -1;
-
-	if (format == NULL)
-		format = "%s";
-
-	if (dtp->dt_options[DTRACEOPT_STACKINDENT] != DTRACEOPT_UNSET)
-		indent = (int)dtp->dt_options[DTRACEOPT_STACKINDENT];
-	else
-		indent = _dtrace_stkindent;
-
-	for (i = 0; i < depth; i++) {
-		switch (size) {
-		case sizeof(uint32_t):
-			/* LINTED - alignment */
-			pc = *((uint32_t *)addr);
-			break;
-
-		case sizeof(uint64_t):
-			/* LINTED - alignment */
-			pc = *((uint64_t *)addr);
-			break;
-
-		default:
-			return dt_set_errno(dtp, EDT_BADSTACKPC);
-		}
-
-		if (pc == 0)
-			break;
-
-		addr += size;
-
-		if (dt_printf(dtp, fp, "%*s", indent, "") < 0)
-			return -1;
-
-		if (dtrace_lookup_by_addr(dtp, pc, &sym, &dts) == 0) {
-			if (pc > sym.st_value)
-				snprintf(c, sizeof(c), "%s`%s+0x%llx",
-					 dts.object, dts.name,
-					 (long long unsigned)pc - sym.st_value);
-			else
-				snprintf(c, sizeof(c), "%s`%s",
-					 dts.object, dts.name);
-		} else {
-			/*
-			 * We'll repeat the lookup, but this time we'll specify
-			 * a NULL GElf_Sym -- indicating that we're only
-			 * interested in the containing module.
-			 */
-			if (dtrace_lookup_by_addr(dtp, pc, NULL, &dts) == 0)
-				snprintf(c, sizeof(c), "%s`0x%llx",
-					 dts.object, (long long unsigned)pc);
-			else
-				snprintf(c, sizeof(c), "0x%llx",
-				    (long long unsigned)pc);
-		}
-
-		if (dt_printf(dtp, fp, format, c) < 0)
-			return -1;
-
-		if (dt_printf(dtp, fp, "\n") < 0)
-			return -1;
-	}
-
-	return 0;
-}
-
-int
-dt_print_ustack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
-    caddr_t addr, uint64_t arg)
-{
-	/* LINTED - alignment */
-	uint64_t *pc = ((uint64_t *)addr);
-	uint32_t depth = DTRACE_USTACK_NFRAMES(arg);
-	uint32_t strsize = DTRACE_USTACK_STRSIZE(arg);
-	const char *strbase = addr + (depth + 1) * sizeof(uint64_t);
-	const char *str = strsize ? strbase : NULL;
-	int err = 0;
-
-	const char *name;
-	char objname[PATH_MAX], c[PATH_MAX * 2];
-	GElf_Sym sym;
-	int i, indent;
-	pid_t pid = -1, tgid;
-
-	if (depth == 0)
-		return 0;
-
-	tgid = (pid_t)*pc++;
-
-	if (dt_printf(dtp, fp, "\n") < 0)
-		return -1;
-
-	if (format == NULL)
-		format = "%s";
-
-	if (dtp->dt_options[DTRACEOPT_STACKINDENT] != DTRACEOPT_UNSET)
-		indent = (int)dtp->dt_options[DTRACEOPT_STACKINDENT];
-	else
-		indent = _dtrace_stkindent;
-
-	/*
-	 * Ultimately, we need to add an entry point in the library vector for
-	 * determining <symbol, offset> from <tgid, address>.  For now, if
-	 * this is a vector open, we just print the raw address or string.
-	 */
-	if (dtp->dt_vector == NULL)
-		pid = dt_proc_grab_lock(dtp, tgid, DTRACE_PROC_WAITING |
-		    DTRACE_PROC_SHORTLIVED);
-
-	for (i = 0; i < depth && pc[i] != 0; i++) {
-		const prmap_t *map;
-
-		if ((err = dt_printf(dtp, fp, "%*s", indent, "")) < 0)
-			break;
-		if (dtp->dt_options[DTRACEOPT_NORESOLVE] != DTRACEOPT_UNSET
-		    && pid >= 0) {
-			if (dt_Pobjname(dtp, pid, pc[i], objname,
-			    sizeof(objname)) != NULL) {
-				const prmap_t *pmap = NULL;
-				uint64_t offset = pc[i];
-
-				pmap = dt_Paddr_to_map(dtp, pid, pc[i]);
-
-				if (pmap)
-					offset = pc[i] - pmap->pr_vaddr;
-
-				snprintf(c, sizeof(c), "%s:0x%llx",
-				    dt_basename(objname), (unsigned long long)offset);
-
-			} else
-				snprintf(c, sizeof(c), "0x%llx",
-				    (unsigned long long)pc[i]);
-
-		} else if (pid >= 0 && dt_Plookup_by_addr(dtp, pid, pc[i],
-							  &name, &sym) == 0) {
-			if (dt_Pobjname(dtp, pid, pc[i], objname,
-					sizeof(objname)) != NULL) {
-				if (pc[i] > sym.st_value)
-					snprintf(c, sizeof(c), "%s`%s+0x%llx",
-						 dt_basename(objname), name,
-						 (unsigned long long)(pc[i] - sym.st_value));
-				else
-					snprintf(c, sizeof(c), "%s`%s",
-						 dt_basename(objname), name);
-			} else
-				snprintf(c, sizeof(c), "0x%llx",
-				    (unsigned long long)pc[i]);
-			/* Allocated by Plookup_by_addr. */
-			free((char *)name);
-		} else if (str != NULL && str[0] != '\0' && str[0] != '@' &&
-		    (pid >= 0 &&
-			((map = dt_Paddr_to_map(dtp, pid, pc[i])) == NULL ||
-			    (map->pr_mflags & MA_WRITE)))) {
-			/*
-			 * If the current string pointer in the string table
-			 * does not point to an empty string _and_ the program
-			 * counter falls in a writable region, we'll use the
-			 * string from the string table instead of the raw
-			 * address.  This last condition is necessary because
-			 * some (broken) ustack helpers will return a string
-			 * even for a program counter that they can't
-			 * identify.  If we have a string for a program
-			 * counter that falls in a segment that isn't
-			 * writable, we assume that we have fallen into this
-			 * case and we refuse to use the string.
-			 */
-			snprintf(c, sizeof(c), "%s", str);
-		} else {
-			if (pid >= 0 && dt_Pobjname(dtp, pid, pc[i], objname,
-			    sizeof(objname)) != NULL)
-				snprintf(c, sizeof(c), "%s`0x%llx",
-				    dt_basename(objname), (unsigned long long)pc[i]);
-			else
-				snprintf(c, sizeof(c), "0x%llx",
-				    (unsigned long long)pc[i]);
-		}
-
-		if ((err = dt_printf(dtp, fp, format, c)) < 0)
-			break;
-
-		if ((err = dt_printf(dtp, fp, "\n")) < 0)
-			break;
-
-		if (str != NULL && str[0] == '@') {
-			/*
-			 * If the first character of the string is an "at" sign,
-			 * then the string is inferred to be an annotation --
-			 * and it is printed out beneath the frame and offset
-			 * with brackets.
-			 */
-			if ((err = dt_printf(dtp, fp, "%*s", indent, "")) < 0)
-				break;
-
-			snprintf(c, sizeof(c), "  [ %s ]", &str[1]);
-
-			if ((err = dt_printf(dtp, fp, format, c)) < 0)
-				break;
-
-			if ((err = dt_printf(dtp, fp, "\n")) < 0)
-				break;
-		}
-
-		if (str != NULL) {
-			str += strlen(str) + 1;
-			if (str - strbase >= strsize)
-				str = NULL;
-		}
-	}
-
-	if (pid >= 0)
-		dt_proc_release_unlock(dtp, pid);
-
-	return err;
-}
-
 static int
 dt_print_usym(dtrace_hdl_t *dtp, FILE *fp, caddr_t addr, dtrace_actkind_t act)
 {
@@ -1355,7 +1129,7 @@ dt_print_umod(dtrace_hdl_t *dtp, FILE *fp, const char *format, caddr_t addr)
 		format = "  %-50s";
 
 	/*
-	 * See the comment in dt_print_ustack() for the rationale for
+	 * See the comment in dt_print_stack_user() for the rationale for
 	 * printing raw addresses in the vectored case.
 	 */
 	if (dtp->dt_vector == NULL)
@@ -1660,12 +1434,15 @@ dt_print_datum(dtrace_hdl_t *dtp, FILE *fp, dtrace_recdesc_t *rec,
 
 	switch (act) {
 	case DTRACEACT_STACK:
-		return dt_print_stack(dtp, fp, NULL, addr, rec->dtrd_arg,
-				      rec->dtrd_size / rec->dtrd_arg);
+	case DTRACEACT_USTACK: {
+		dtrace_probedata_t	pdat;
 
-	case DTRACEACT_USTACK:
-	case DTRACEACT_JSTACK:
-		return dt_print_ustack(dtp, fp, NULL, addr, rec->dtrd_arg);
+		/* dt_print_stack() uses dtpda_data only */
+		memset(&pdat, 0, sizeof(pdat));
+		pdat.dtpda_data = addr;
+
+		return dt_print_stack(dtp, fp, NULL, &pdat, rec, 1, NULL, 0);
+	}
 
 	case DTRACEACT_USYM:
 	case DTRACEACT_UADDR:
@@ -2467,14 +2244,6 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
 			return dt_set_errno(dtp, EDT_BADRVAL);
 
 		switch (act) {
-		case DTRACEACT_STACK: {
-			int depth = rec->dtrd_arg;
-
-			if (dt_print_stack(dtp, fp, NULL, recdata,
-					   depth, rec->dtrd_size / depth) < 0)
-				return -1;
-			continue;
-		}
 		case DTRACEACT_SYM:
 			if (dt_print_sym(dtp, fp, NULL, recdata) < 0)
 				return -1;
@@ -2483,11 +2252,10 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
 			if (dt_print_mod(dtp, fp, NULL, recdata) < 0)
 				return -1;
 			continue;
+		case DTRACEACT_STACK:
 		case DTRACEACT_USTACK:
-			if (dt_print_ustack(dtp, fp, NULL,
-					    recdata, rec->dtrd_arg) < 0)
-				return -1;
-			continue;
+			func = dt_print_stack;
+			break;
 		case DTRACEACT_USYM:
 		case DTRACEACT_UADDR:
 			if (dt_print_usym(dtp, fp, recdata, act) < 0)
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 7d8e4432..4dc4c9a7 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -236,6 +236,19 @@ typedef struct dt_tstring {
 	int		in_use;			/* In use (1) or not (0) */
 } dt_tstring_t;
 
+/*
+ * The stack()/ustack() data record argument encodes:
+ *  - the stack type (kernel or userspace)
+ *  - the number of frames in the stack trace
+ *  - the size of the optional string area for ustack()
+ */
+#define DTRACE_STACK_IS_USER(x)		((x) & (1 << 31))
+#define DTRACE_STACK_NFRAMES(x)		(uint32_t)((x) & INT32_MAX)
+#define DTRACE_STACK_STRSIZE(x)		(uint32_t)((x) >> 32)
+#define DTRACE_STACK_ARG(t, x, y)	((((uint64_t)(y)) << 32) | \
+					 ((t) ? (1UL << 31) : 0) | \
+					 ((x) & INT32_MAX))
+
 typedef struct dt_dirpath {
 	dt_list_t dir_list;		/* linked-list forward/back pointers */
 	char *dir_path;			/* directory pathname */
diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
index 1e01d468..0d7c0bb4 100644
--- a/libdtrace/dt_printf.c
+++ b/libdtrace/dt_printf.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2009, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2009, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -374,6 +374,200 @@ pfprint_uaddr(dtrace_hdl_t *dtp, FILE *fp, const char *format,
 	return dt_printf(dtp, fp, format, s);
 }
 
+static int
+dt_print_stack_kernel(dtrace_hdl_t *dtp, FILE *fp, const char *format,
+		      caddr_t addr, int indent, uint32_t depth)
+{
+	dtrace_syminfo_t dts;
+	GElf_Sym sym;
+	int i;
+	char c[PATH_MAX * 2];
+	uint64_t pc;
+
+	if (format == NULL)
+		format = "%s";
+
+	for (i = 0; i < depth; i++) {
+		pc = *((uint64_t *)addr);
+		if (pc == 0)
+			break;
+
+		addr += sizeof(pc);
+
+		if (dt_printf(dtp, fp, "%*s", indent, "") < 0)
+			return -1;
+
+		if (dtrace_lookup_by_addr(dtp, pc, &sym, &dts) == 0) {
+			if (pc > sym.st_value)
+				snprintf(c, sizeof(c), "%s`%s+0x%llx",
+					 dts.object, dts.name,
+					 (long long unsigned)pc - sym.st_value);
+			else
+				snprintf(c, sizeof(c), "%s`%s",
+					 dts.object, dts.name);
+		} else {
+			/*
+			 * We'll repeat the lookup, but this time we'll specify
+			 * a NULL GElf_Sym -- indicating that we're only
+			 * interested in the containing module.
+			 */
+			if (dtrace_lookup_by_addr(dtp, pc, NULL, &dts) == 0)
+				snprintf(c, sizeof(c), "%s`0x%llx",
+					 dts.object, (long long unsigned)pc);
+			else
+				snprintf(c, sizeof(c), "0x%llx",
+				    (long long unsigned)pc);
+		}
+
+		if (dt_printf(dtp, fp, format, c) < 0)
+			return -1;
+
+		if (dt_printf(dtp, fp, "\n") < 0)
+			return -1;
+	}
+
+	return 0;
+}
+
+static int
+dt_print_stack_user(dtrace_hdl_t *dtp, FILE *fp, const char *format,
+		    caddr_t addr, int indent, uint32_t depth, uint32_t strsize)
+{
+	/* LINTED - alignment */
+	uint64_t *pc = ((uint64_t *)addr);
+	const char *strbase = addr + (depth + 1) * sizeof(uint64_t);
+	const char *str = strsize ? strbase : NULL;
+	int err = 0;
+
+	const char *name;
+	char objname[PATH_MAX], c[PATH_MAX * 2];
+	GElf_Sym sym;
+	int i;
+	pid_t pid = -1, tgid;
+
+	if (depth == 0)
+		return 0;
+
+	tgid = (pid_t)*pc++;
+
+	if (format == NULL)
+		format = "%s";
+
+	/*
+	 * Ultimately, we need to add an entry point in the library vector for
+	 * determining <symbol, offset> from <tgid, address>.  For now, if
+	 * this is a vector open, we just print the raw address or string.
+	 */
+	if (dtp->dt_vector == NULL)
+		pid = dt_proc_grab_lock(dtp, tgid, DTRACE_PROC_WAITING |
+		    DTRACE_PROC_SHORTLIVED);
+
+	for (i = 0; i < depth && pc[i] != 0; i++) {
+		const prmap_t *map;
+
+		if ((err = dt_printf(dtp, fp, "%*s", indent, "")) < 0)
+			break;
+		if (dtp->dt_options[DTRACEOPT_NORESOLVE] != DTRACEOPT_UNSET
+		    && pid >= 0) {
+			if (dt_Pobjname(dtp, pid, pc[i], objname,
+			    sizeof(objname)) != NULL) {
+				const prmap_t *pmap = NULL;
+				uint64_t offset = pc[i];
+
+				pmap = dt_Paddr_to_map(dtp, pid, pc[i]);
+
+				if (pmap)
+					offset = pc[i] - pmap->pr_vaddr;
+
+				snprintf(c, sizeof(c), "%s:0x%llx",
+				    dt_basename(objname), (unsigned long long)offset);
+
+			} else
+				snprintf(c, sizeof(c), "0x%llx",
+				    (unsigned long long)pc[i]);
+
+		} else if (pid >= 0 && dt_Plookup_by_addr(dtp, pid, pc[i],
+							  &name, &sym) == 0) {
+			if (dt_Pobjname(dtp, pid, pc[i], objname,
+					sizeof(objname)) != NULL) {
+				if (pc[i] > sym.st_value)
+					snprintf(c, sizeof(c), "%s`%s+0x%llx",
+						 dt_basename(objname), name,
+						 (unsigned long long)(pc[i] - sym.st_value));
+				else
+					snprintf(c, sizeof(c), "%s`%s",
+						 dt_basename(objname), name);
+			} else
+				snprintf(c, sizeof(c), "0x%llx",
+				    (unsigned long long)pc[i]);
+			/* Allocated by Plookup_by_addr. */
+			free((char *)name);
+		} else if (str != NULL && str[0] != '\0' && str[0] != '@' &&
+		    (pid >= 0 &&
+			((map = dt_Paddr_to_map(dtp, pid, pc[i])) == NULL ||
+			    (map->pr_mflags & MA_WRITE)))) {
+			/*
+			 * If the current string pointer in the string table
+			 * does not point to an empty string _and_ the program
+			 * counter falls in a writable region, we'll use the
+			 * string from the string table instead of the raw
+			 * address.  This last condition is necessary because
+			 * some (broken) ustack helpers will return a string
+			 * even for a program counter that they can't
+			 * identify.  If we have a string for a program
+			 * counter that falls in a segment that isn't
+			 * writable, we assume that we have fallen into this
+			 * case and we refuse to use the string.
+			 */
+			snprintf(c, sizeof(c), "%s", str);
+		} else {
+			if (pid >= 0 && dt_Pobjname(dtp, pid, pc[i], objname,
+			    sizeof(objname)) != NULL)
+				snprintf(c, sizeof(c), "%s`0x%llx",
+				    dt_basename(objname), (unsigned long long)pc[i]);
+			else
+				snprintf(c, sizeof(c), "0x%llx",
+				    (unsigned long long)pc[i]);
+		}
+
+		if ((err = dt_printf(dtp, fp, format, c)) < 0)
+			break;
+
+		if ((err = dt_printf(dtp, fp, "\n")) < 0)
+			break;
+
+		if (str != NULL && str[0] == '@') {
+			/*
+			 * If the first character of the string is an "at" sign,
+			 * then the string is inferred to be an annotation --
+			 * and it is printed out beneath the frame and offset
+			 * with brackets.
+			 */
+			if ((err = dt_printf(dtp, fp, "%*s", indent, "")) < 0)
+				break;
+
+			snprintf(c, sizeof(c), "  [ %s ]", &str[1]);
+
+			if ((err = dt_printf(dtp, fp, format, c)) < 0)
+				break;
+
+			if ((err = dt_printf(dtp, fp, "\n")) < 0)
+				break;
+		}
+
+		if (str != NULL) {
+			str += strlen(str) + 1;
+			if (str - strbase >= strsize)
+				str = NULL;
+		}
+	}
+
+	if (pid >= 0)
+		dt_proc_release_unlock(dtp, pid);
+
+	return err;
+}
+
 /*ARGSUSED*/
 static int
 pfprint_stack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
@@ -381,19 +575,20 @@ pfprint_stack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
 	      uint64_t normal, uint64_t sig)
 {
 	int width;
-	dtrace_optval_t saved = dtp->dt_options[DTRACEOPT_STACKINDENT];
 	const dtrace_recdesc_t *rec = pfd->pfd_rec;
 	caddr_t addr = (caddr_t)vaddr;
+	uint32_t depth = DTRACE_STACK_NFRAMES(rec->dtrd_arg);
 	int err = 0;
 
+	if (depth == 0)
+		return 0;
+
 	/*
-	 * We have stashed the value of the STACKINDENT option, and we will
-	 * now override it for the purposes of formatting the stack.  If the
-	 * field has been specified as left-aligned (i.e. (%-#), we set the
-	 * indentation to be the width.  This is a slightly odd semantic, but
-	 * it's useful functionality -- and it's slightly odd to begin with to
-	 * be using a single format specifier to be formatting multiple lines
-	 * of text...
+	 * If the field has been specified as left-aligned (i.e. (%-#), we use
+	 * the field width as indentation.  This is a slightly odd semantic
+	 * but it's useful functionality -- and it's slightly odd to begin with
+	 * to be using a single format specifier to be formatting multiple
+	 * lines of text...
 	 */
 	if (pfd->pfd_dynwidth < 0) {
 		assert(pfd->pfd_flags & DT_PFCONV_DYNWIDTH);
@@ -404,24 +599,14 @@ pfprint_stack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
 		width = 0;
 	}
 
-	dtp->dt_options[DTRACEOPT_STACKINDENT] = width;
-
-	switch (rec->dtrd_action) {
-	case DTRACEACT_USTACK:
-	case DTRACEACT_JSTACK:
-		err = dt_print_ustack(dtp, fp, format, addr, rec->dtrd_arg);
-		break;
-
-	case DTRACEACT_STACK:
-		err = dt_print_stack(dtp, fp, format, addr, rec->dtrd_arg,
-		    rec->dtrd_size / rec->dtrd_arg);
-		break;
-
-	default:
-		assert(0);
-	}
+	if (dt_printf(dtp, fp, "\n") < 0)
+		return -1;
 
-	dtp->dt_options[DTRACEOPT_STACKINDENT] = saved;
+	if (DTRACE_STACK_IS_USER(rec->dtrd_arg))
+		err = dt_print_stack_user(dtp, fp, format, addr, width, depth,
+					  DTRACE_STACK_STRSIZE(rec->dtrd_arg));
+	else
+		err = dt_print_stack_kernel(dtp, fp, format, addr, width, depth);
 
 	return err;
 }
@@ -2287,3 +2472,29 @@ dt_print_type(dtrace_hdl_t *dtp, FILE *fp, void *fmtdata,
 
 	return 2;
 }
+
+int
+dt_print_stack(dtrace_hdl_t *dtp, FILE *fp, void *fmtdata,
+	       const dtrace_probedata_t *data, const dtrace_recdesc_t *recs,
+	        uint_t nrecs, const void *buf, size_t len)
+{
+	const char	*format;
+	dt_pfargd_t	pfd;
+
+	if (fmtdata == NULL)
+		format = "%s";
+	else
+		format = ((dt_pfargv_t *)fmtdata)->pfv_format;
+
+	/* pfprint_stack() uses pfd_rec, pfd_flags, and pfd_width only */
+	memset(&pfd, 0, sizeof(pfd));
+	pfd.pfd_rec = recs;
+	pfd.pfd_flags = DT_PFCONV_LEFT;
+
+	if (dtp->dt_options[DTRACEOPT_STACKINDENT] != DTRACEOPT_UNSET)
+		pfd.pfd_width = (int)dtp->dt_options[DTRACEOPT_STACKINDENT];
+	else
+		pfd.pfd_width = _dtrace_stkindent;
+
+	return pfprint_stack(dtp, fp, format, &pfd, data->dtpda_data, 0, 0, 0);
+}
diff --git a/libdtrace/dt_printf.h b/libdtrace/dt_printf.h
index f08e48eb..1ebdd8aa 100644
--- a/libdtrace/dt_printf.h
+++ b/libdtrace/dt_printf.h
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2005, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2005, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -102,16 +102,16 @@ extern void dt_printf_validate(dt_pfargv_t *, uint_t,
 
 extern void dt_printa_validate(struct dt_node *, struct dt_node *);
 
-extern int dt_print_stack(dtrace_hdl_t *, FILE *,
-    const char *, caddr_t, int, int);
-extern int dt_print_ustack(dtrace_hdl_t *, FILE *,
-    const char *, caddr_t, uint64_t);
 extern int dt_print_mod(dtrace_hdl_t *, FILE *, const char *, caddr_t);
 extern int dt_print_umod(dtrace_hdl_t *, FILE *, const char *, caddr_t);
 extern int dt_print_type(dtrace_hdl_t *dtp, FILE *fp, void *fmtdata,
 			 const dtrace_probedata_t *data,
-			 const dtrace_recdesc_t *recs,
-			 uint_t nrecs, const void *buf, size_t len);
+			 const dtrace_recdesc_t *recs, uint_t nrecs,
+			 const void *buf, size_t len);
+extern int dt_print_stack(dtrace_hdl_t *dtp, FILE *fp, void *fmtdata,
+			  const dtrace_probedata_t *data,
+			  const dtrace_recdesc_t *recs, uint_t nrecs,
+			  const void *buf, size_t len);
 
 #ifdef	__cplusplus
 }
-- 
2.43.5

