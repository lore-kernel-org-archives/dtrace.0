Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722BC4A08
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 04:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753416126; cv=fail; b=GxoH4QDxjNRh3fPvuL9pPt3W2ULWonaJcUTW7T9+WNiwNCbyGwdHkVxx1SBQkoXzQQdq8lWhIHciYWYP1CR0ZehePG2S/vNLv+m4rWpunPx3Kw38XCmIzX4fnAiouCWRhAjIXI6CnoNl4lsn83GB3HdkL/bicjpLrV3A3iAd8kM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753416126; c=relaxed/simple;
	bh=z4XK6JN3HWbdtyh3Fk2Zg/gaawxOfn9Y7AnFGDfsxIo=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=KtAdQIFXWcQpXNI5W6ItEFdxwl6i9aYmkykanG3Xc6wwB8milVnXcCloCvC6noBx8s0zHWW59/7SIAyA61bVIgKRNMPKDnJBSImAAZLBICYGIMkj8ILKUtFiWEZm6Qbj+Xz2RDkabvA6C3rW5/xny1I1F1KX3ak5uS5yvm01lW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mtcz7kG2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ndMsapB4; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mtcz7kG2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ndMsapB4"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P2tGuC008306
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 04:02:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=eIYMcp5qDqce/pMEcMs0gIh2u7JUDLGQHFZ/dj3j8Rc=; b=
	mtcz7kG2a6+QWKJKbh+EWysUyrQWxO9N4WO0efSsriKHe62M/RJR+SbgcSkcs4Kq
	L8RZeK8Lzw7GPc6nLsaeJi8N3gBOOKx3ayo8gWDVt5NuU4uT1ZBv8yD+Yn/c9Kpa
	tPWUAXSb0BzyW2c18huwWn208qyFdCi1JuDHCq7g25tu0KfKSodQvF+HEivEqG/f
	npBfttpOVUS2hhWJAGzZ+Yh0anqv2v1/sM6TFdmxbXZqEGiEvND1B99hDHu4cGAE
	qHPs2FycaMo9orSD4ikdDTrN5RJMggt4/jgiwPfTMb3Gtqz9sHU1sfE0nktm2v9p
	n8jvBVImS/3qNLXABavaVA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 483w3vg9ka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 04:02:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56P2NRnu011425
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 04:02:02 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801tcjqb0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 04:02:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ec3oUexGCrLftKp7e2OEsD+FnDaboo+40hVkDLrZmTgL6BRwqXWdxH5R/b90//bN2bd1J1p1UmgOJPOgaiZVHsMDgTL+xir183LNNWGaTClhCXdsFWAQdvW05sj4+XzXwtHsruSmR+C4ZcneTGuHoOcOHHR8dAkCo06Hhga7/xxOF5jPDqGWiyGnpd3RuPepeAWSC5bA6NoI3GIe1J7KIg6rz2jNjPdyi80WMOGi619Juwx3/MWr4KwEJcbRz5KZpTJlwOJsyeEO3NfG11R39Ki7YHxLfn0q2082YaijA156/0Wp/8q4sZ6TDAo0l2FpVug7/pR6UJxBKIBDHiLehg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIYMcp5qDqce/pMEcMs0gIh2u7JUDLGQHFZ/dj3j8Rc=;
 b=cfJPw3GrvAp3D03DvNQxIgGOcf3zaRDX7c8IP9nJjMmbRUzNSilL5awxw1FVLVkPQUGlHESa5/q6Szc4uB717aZB2yy7igMdE8c5rL1egLlNq/mvUupiuHTf9aSgH/DewSA3mTSi4S65r12H5RbqImeuwiRUFKLs8HM12maE8jl+XSeGM2aPcSFAyOzTB+psxYH9O8UzeScieWrbwH8LN+IKX6y1dtt7k7SUOPrIbrUx2MvCMbwoIonjSXTjgl8O1ZeRGXpNMAuAjm5dN6n0xPPEj3OmdBqt7vjTRL3FA7zMgES03WpEdHGN42JNnB08Y5u2/KPuPMUf1Kie5nv5Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIYMcp5qDqce/pMEcMs0gIh2u7JUDLGQHFZ/dj3j8Rc=;
 b=ndMsapB4vcOUVNrUpEE+DlMX+/eUPvk5y+AcwGrZhysbN8/jwsr+dFbn6ZtylpbGj1F6pOIshhyhUfDwuvWpqQaK37CunWt6rY2P5A42BHJpgLJrBAPzOmomPmAzG/DXcgp6CmcpVR84ZMp2mbRZk0CI0CjTUXR84DL7+xuGp94=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA3PR10MB8735.namprd10.prod.outlook.com (2603:10b6:208:576::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 04:01:58 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.042; Fri, 25 Jul 2025
 04:01:58 +0000
Date: Fri, 25 Jul 2025 00:01:56 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Free the DIFO for a probe once it is loaded
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672176142BF978BF54B249AC259A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA3PR10MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: 2067a2b8-6706-4b5a-4254-08ddcb300069
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZPLnOPGF9SjylGcWj5KJGQdbbKgNiUeL9VDX6eSmPyKQRIQdKSH5nuG2PRb4?=
 =?us-ascii?Q?g+aszT7ULh2DrG5wNjLjJEdXIKaX6sQH4uZ2PkTGodKPuQLv/Ly2BJkVgs1k?=
 =?us-ascii?Q?mYgwXinEd65e2wH6RRMOkS8FXvuWpdxxeJHziTpbiwAskqlrXR9fh8QFpgRI?=
 =?us-ascii?Q?ypDL7ibPAmtsQ6l3by0ehC2mCSPMuaQ9dBnhVnzLt4pU8vnK4G8XGpH65RpM?=
 =?us-ascii?Q?6hKyd0PPzEHO2Ud6OGl1cqTybUH/EXS/ClZuTYdBuOBW3uI2g9jNrpZA2prJ?=
 =?us-ascii?Q?nlIzGpzrQWfEeORfx+HyWjCF5sbcg+qJaAhhnBvSFQwQI3HOWB5PkBofx46Z?=
 =?us-ascii?Q?ZX3zU7D5ENp0RsjL4376/KiLQyYqM8ayTOKlNhhXGhSJr17b0uIabi5E3NlP?=
 =?us-ascii?Q?K6MoYEj2DmM5YUrMSzRYlxif2XcQDUxlHlvVq/kHhMQV/sXoFMaQVNingRNR?=
 =?us-ascii?Q?3AQPDYT1RaZiwxfbhr9KatZR21qlHdz03saiUIl2VBQJtaPiDrV6k7xosNNy?=
 =?us-ascii?Q?3FHWNG/9djAaVNQRWFDLQ/pRcBdRUPO46X4ax3TjF+7q60HCPLuqRmYAGQJs?=
 =?us-ascii?Q?NmGX/4+udN5ts+n36uYwj+OeI5eYgvAMj/lKcgiWEzoUUlTCJvEluJSig5OE?=
 =?us-ascii?Q?nCZb602mh7GFL23cfHFRLb3llF0n5MERJsrwJlzUWi5e591s32rkriZ/eYWT?=
 =?us-ascii?Q?yRGzWlYKiP9CQbawbtqRo0pNGV91qcC76m7e0/QXGIVdGJ1IkOWy8e6nq0k1?=
 =?us-ascii?Q?XOWGYYo8wJDC64IbtyI/ITPjJj4s6g+yb8ZE06Q2DRrmK7X4U7oFrbOYsWb+?=
 =?us-ascii?Q?CXy/LWGvU+hLxLy+K0tklBJvaEHdE/R16S9HLkmYGbmEAvobMiFfVuc9yRGf?=
 =?us-ascii?Q?OWi5TDNk29HoRrxONyB7Dvu7Y/HDVEHD3LniqHF5CdkXxnnyaqqwle+0Bl+v?=
 =?us-ascii?Q?4EnDR28pTLZ2HssfbqtByPwMtzry/JZC4Tl2Aoe6Xe0vC0JKnPv7AugNmMaW?=
 =?us-ascii?Q?gWbUwrZ45oZBtdtg+si3JN0y6Ky6cgafxf1zlKj9InXBzo65y2sWxYt6FawZ?=
 =?us-ascii?Q?yf1aJYmbzlNH9zU+AKURcaMcAUYP2UklLF1ebBvdTAUBCIsqzOF/IFqUMBaq?=
 =?us-ascii?Q?+nRQNQabRhn0bgprYXAFqWzYfjNDLasgyDxJ7XRzLZruf6qiS9VxxOgs5avy?=
 =?us-ascii?Q?R0ICpAcBGSpQmEiTSMdXug68S9y1IAC5v7sf9HPGjH2bqPdskebRbIntSRkZ?=
 =?us-ascii?Q?8IqKRFbxdizQleKQkbFTEhAJf9ohr2jOXi2ZCUnCcp9xJRR4gRTTqkai5j8S?=
 =?us-ascii?Q?QfVlT4akTngRCGkJoww/DdROTi+lbur3YVdi6zSqz4vM4NzYS+XPLXaJy9p2?=
 =?us-ascii?Q?q6FQDjz/jlrf4i0LnDygwSR7Tkiw/6aKDp1Q57ZuGdJs/GCrmHX1J1Crozsb?=
 =?us-ascii?Q?zEiSaMgceyI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F595hH2QdaXk7mwFe1Tz8Dq2nHtBVyHegxVopu3pBTj4MKn1pE2L9umVqZQ/?=
 =?us-ascii?Q?DqhCRAKwsGY1qe6egH5kq0Ds2ibreo4rUr5Ky8j3BmQm+7/ZN7QUiPjCmTda?=
 =?us-ascii?Q?lcoGUkkUGklLb710d8BPYpnpqZAeeq+7cMPBqwhy2lhwmEBYEo0aMh1WRQqD?=
 =?us-ascii?Q?AecfNdteVI/GNqI19mBXlRPeS7pOOKhHaWQCDDyqw2X8T0jBjU96dUCsAsKz?=
 =?us-ascii?Q?bWl9m+jjJvfMhF4HpO2sByAY3Dj6gPpKxSZZf7dyA1/t3uSCg/to9cLHkPC/?=
 =?us-ascii?Q?aOc3i3Pqji9cA/LvziaLI3lsBDFiONZtg9upn6VKnR6xdq91hD8lyJWrS9V3?=
 =?us-ascii?Q?Ky5xu+eTyAfk+YS4c47iynMGF1rf++EWkBAWiDHFzBLgfEWNZfm6OBVg8AOg?=
 =?us-ascii?Q?mbG4/eSigOTyPULBjRVHhdlGW8/nD1WMP3A5CX6xDGvqGRZXpSz6kDk4mueq?=
 =?us-ascii?Q?/wmf8M3dukxVlDfJSmx/vdJRT2eNVCTSGIjlyH5ZoKddWdiqdfXY9VKlvY3B?=
 =?us-ascii?Q?7H1BbCHh73BuguPoEH38DFkgd3bROANwQFD0EOj/+3sL2RkmCUJf16VoZADr?=
 =?us-ascii?Q?TccOd7CihRzeN2XCu9rsBB1yr8Ds3bQFlUWylsEQCMvnpHK3hZZ2yc0ftTho?=
 =?us-ascii?Q?OZ8im6cfC0G0SvCpG/UzSv7fSUSbXbb3iZbXI9tuNhM+TdRoIxIOaw7JqeT3?=
 =?us-ascii?Q?dpmkWQGquj1VuXIuuymjk/ldSl+oi/1s2AZh/DezCzEKHq91hZtnWiOz+ka3?=
 =?us-ascii?Q?eULFwr68ki9ulXCK1OiQym5gwUtVpnoZbIRdYtplVNZ6T4/9Yxr+0sw2sY/W?=
 =?us-ascii?Q?10LiIOladTnK1c23mIwkUAbQeDAwy0E3R9A7pg2q0vV4rN3rBzp78IR+YSUB?=
 =?us-ascii?Q?D9Bq9ezH2qgQK1d5fRDsUZ55P0/UgPhQTTwQtHDIR4DE11WTVgyKSOC0hInl?=
 =?us-ascii?Q?XwDNsOYXtwqn546oJvSLEdfHWcJrsiEmJGXyxmXoQ7Cc1hUAkmBP/QuM4LRT?=
 =?us-ascii?Q?Q2ogCB3wJTPikrDuNH4FwBldsNZsuxWriOcR/i0ehcq+vKQ/MmDPVLe9s+je?=
 =?us-ascii?Q?gSIuesJNXLRFyGWhfNIyoIZa6Wg9J+iSA2hiZascLeSBk+On6KquW4wG6hiR?=
 =?us-ascii?Q?+jjGlq7Iybrk39i0BYjV7h4DRhvPhhMsLhWSpN0GZ3Jdo9//O2Q5BIa7DRLY?=
 =?us-ascii?Q?VdlXsR7c3thoPhPaNtaffo+DbwkP+Tyti6fhmRNlKe4skxvtyQG3IoRlvYpi?=
 =?us-ascii?Q?6Abjch127vnSvx6HskXIgsWL/CCZxNJtWJ5jRNhcOPAa876+24bT9BoPdbg3?=
 =?us-ascii?Q?jMQ/jfUwhfh6QryahTjlcAJQ8ylHthHzWymucIvAT3L1m6VOLVRKsrR1T5J1?=
 =?us-ascii?Q?2XFo0MOfRFwGdsJBtlK+y2S8DmYQ9xewloKdpPQvhLjV6oNhXVy6Xxqoaaxj?=
 =?us-ascii?Q?RE7nXq5tgBgQG3sIoi2zoK8IqO52NeGGVa65lxzwevGzCVT5GHi6sUoZ7Uij?=
 =?us-ascii?Q?hpwRIolCMJkENcHLQmHXwEfL1bResUO0wZco+Z6JiuyQuSYOpEQcNP6RIC1I?=
 =?us-ascii?Q?IVrudvBZlcOtmxsXgQbFeZea4erx7s/cEZEoNFocYD2JDB0Ovp23nL2UMxmC?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FlxCIehCbk3fVZ02PrFD2eTEPcKrPDA3SQFGGfehUMayyBcRGx7+7SB6lcDlgS4wbA7WTdL/RIJgLncqTrLzUyVkYPtmXxHUq7b0HvXi76ZcNg2t0Ly9o37WRfScLX9RAG1knSjcwCwO3wkUJH/RmCCAuwU5rLQM1jGq4kMBPgVywQdQ/YFTDtYLCNrTNCfETrykG6XGpsuTRVQR+wZtKpzcl5DOePMmITklDOEyd333sLhD4aPhxiqqB7W6tq6/n+5eVEnEPKhpaUc9Hbhb8IbqVPaogVC+iOy5lwRlDjhbjK8VXAYilJkY5shvR5lZmNsZt2WNVsSHJ7uSQj5G99dZmJGBtUYXOAhsuTGcb/vzaTJ4w8rQKrzDcoMLZ4aWLssTHFrsL8TdLW+7XY8Dp/E75MkKZpbgptbW6YR0AzBP3zhyqc6VCzvSBynUQ4bJ3pnDm1siPGkb28AdCQj3tRGo/JnfHLOIPqARQ4Vznwm0DfGgPjVZwDjlQLKMthqyyw5TdYR++EbMmEYn94L7Il1HUW0D5Mz5MfSzTyEhjWmMrBpFYtI+GMqxJZkH9/zW2lL0Iff8VxRE/tES5X4cFOi41zIGdvg2M20Nyet7Zms=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2067a2b8-6706-4b5a-4254-08ddcb300069
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 04:01:58.3272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FKOffYPrQTxwYV8Fptl0tmtnIyKh1gc+NbZKa/TN51hLWao5LJPa9Ub82cnXPOQtcBmBtF++C4PoRJCy3aJmYuHCpsMfUUR08pMxvOW7RyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8735
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507250029
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDAzMCBTYWx0ZWRfX4dgzvwrwRriR
 Wq7P01r7aH+JRa1ob6ecCwBFK9DWj2ZGPSA+DMvVOJ7V+9eogLRegJqpxBjDRJJBs/rM6/KYks+
 ESfat3AuHKKw5ocdFpaN/HCI/AZLOl2JGUPDyHlHT712VckOqRzAXswyKtoquo6k6Tb5VCSWDS/
 pyFurrYQtHF2aaXHRR3rSPvO5jbNlysIiEYShKwdZOWit93ELHSdQXEIlNhAoGRgGDVY02hWg2c
 1ZJNnNOGqnxobNqtPMYLNwc4Jbjz4IpY6Y+rIOdFOHLXWuLsIZLXIlWjPcq+KOjYwVRFSOWhJnw
 B9GdjeJ2HK6ar6mQRE8L5BMSelzq79l8HubusshZT0aIuy4gz+GE8tNOpYZRBXcmuHbJirTxjKU
 hN6tNKuD7cn1RSG7ZRI0DEtKx3kuwSBF8MtIR0JuMWZ3GNGItOW/epSOkmPj+UHWx2XzNX4a
X-Authority-Analysis: v=2.4 cv=VqMjA/2n c=1 sm=1 tr=0 ts=688301bb b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=CuelDG_OGeiJGSSr:21 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=ckOOxjz9NQYVDD98x8UA:9
X-Proofpoint-GUID: Y4Yg2DXEZGp1LKlVZuv0NP8KwFbnJQ_L
X-Proofpoint-ORIG-GUID: Y4Yg2DXEZGp1LKlVZuv0NP8KwFbnJQ_L

When a lot of probes are being probed, keeping all DIFO around consumes
a lot of memory.  Once the BPF program is loaded, the DIFO can be freed.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_bpf.c         | 23 ++++++++++++++++-------
 libdtrace/dt_prov_uprobe.c | 22 +++++++++++++++-------
 2 files changed, 31 insertions(+), 14 deletions(-)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index ccec8b43..56b6b01d 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -1339,6 +1339,7 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
 	 */
 	dtrace_getopt(dtp, "destructive", &dest_ok);
 
+	dp = NULL;
 	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL;
 	     prp = dt_list_next(prp)) {
 		int		fd;
@@ -1353,28 +1354,36 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
 			continue;
 
 		if (dt_link(dtp, prp, dp, NULL) == -1)
-			return -1;
+			goto fail;
 
 		DT_DISASM_PROG_LINKED(dtp, cflags, dp, stderr, NULL, prp->desc);
 
 		if (dp->dtdo_flags & DIFOFLG_DESTRUCTIVE &&
-		    dest_ok == DTRACEOPT_UNSET)
-			return dt_set_errno(dtp, EDT_DESTRUCTIVE);
+		    dest_ok == DTRACEOPT_UNSET) {
+			dt_set_errno(dtp, EDT_DESTRUCTIVE);
+			goto fail;
+		}
 
 		fd = dt_bpf_load_prog(dtp, prp, dp, cflags);
 		if (fd == -1)
-			return -1;
+			goto fail;
 
 		if (prp->prov->impl->attach)
 			rc = prp->prov->impl->attach(dtp, prp, fd);
 
 		if (rc < 0) {
 			close(fd);
-			return dt_attach_error(dtp, rc,
-					       prp->desc->prv, prp->desc->mod,
-					       prp->desc->fun, prp->desc->prb);
+			dt_attach_error(dtp, rc,
+					prp->desc->prv, prp->desc->mod,
+					prp->desc->fun, prp->desc->prb);
+			goto fail;
 		}
 	}
 
 	return 0;
+
+fail:
+	dt_difo_free(dtp, prp->difo);
+	prp->difo = NULL;
+	return -1;
 }
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index f60bdceb..8e7aa4b0 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -609,32 +609,40 @@ static int add_probe_uprobe(dtrace_hdl_t *dtp, dt_probe_t *prp)
 	/* Make program. */
 	dp = dt_construct(dtp, prp, cflags, NULL);
 	if (dp == NULL)
-		return 0;        // FIXME in dt_bpf_make_progs() this is a fatal error; should we do the same here?
+		return 0;
 	prp->difo = dp;
 
 	/* Load program. */
 	if (dt_link(dtp, prp, dp, NULL) == -1)
-		return 0;        // FIXME in dt_bpf_load_progs() this is a fatal error; should we do the same here?
+		goto fail;
 
 	dtrace_getopt(dtp, "destructive", &dest_ok);
 	if (dp->dtdo_flags & DIFOFLG_DESTRUCTIVE &&
-	    dest_ok == DTRACEOPT_UNSET)
-		return dt_set_errno(dtp, EDT_DESTRUCTIVE);
+	    dest_ok == DTRACEOPT_UNSET) {
+		dt_set_errno(dtp, EDT_DESTRUCTIVE);
+		goto fail;
+	}
 
 	fd = dt_bpf_load_prog(dtp, prp, dp, cflags);
 	if (fd == -1)
-		return 0;        // FIXME in dt_bpf_load_progs() this is a fatal error; should we do the same here?
+		goto fail;
 
 	if (prp->prov->impl->attach)
 		rc = prp->prov->impl->attach(dtp, prp, fd);
 
 	if (rc < 0) {
 		close(fd);
-		return dt_attach_error(dtp, rc, prp->desc->prv, prp->desc->mod,
-						prp->desc->fun, prp->desc->prb);
+		dt_attach_error(dtp, rc, prp->desc->prv, prp->desc->mod,
+					 prp->desc->fun, prp->desc->prb);
+		goto fail;
 	}
 
 	return 0;
+
+fail:
+	dt_difo_free(dtp, prp->difo);
+	prp->difo = NULL;
+	return 0;	// FIXME in dt_bpf_make_progs() this is a fatal error; should we do the same here?
 }
 
 static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
-- 
2.45.2

