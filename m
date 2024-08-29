Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559F71494A5
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724908980; cv=fail; b=THgH5vIXmme5S+Ha1O23oSvjI+5G8CA6q6pw07u/R4S5hdCyKxUOQvulSDJz/O5a552WaSHqChnn/Otx0DXOjIEUfKR+xPs7ERueWFwykieLD6PzVaEsAQeiQltfUiDXo8TyGVhXz5TnGupTTg6WK9iVGOabe4PdKz2a9x6/Q38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724908980; c=relaxed/simple;
	bh=Vz26lSIXbRag1GVCzj8nrYTub23Wtu6+lhN8dIIl9G0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ukaB99jGP1gKB1+fDEiGuRd/wkHDdW5urrPnBCd4CP5Kg9nVMz4/WHfbKJAfpImvgu9n/6ZW28giMdJi8TUKtqV5UfWUyl2zEOO0ayPoGHhcVMpgvL56pL7IzlMORHD/gjKsvZtIZuFF42QG7MTOa6v37CPq4QGylgakODz3xpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SbrIdoxi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xivfK03R; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SbrIdoxi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xivfK03R"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1g2Bo006650
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=/HkzJizZieiojB
	H3Hk4Oz7gbm/7lt9RKKtqgRT+wvcQ=; b=SbrIdoxigvPBvMgHa/b1QHff1QZ9EL
	Z5jIeqyZR9Vc+GsXGRiKMz0MTH4akmmWgbN+HCrtNA+5URzGEPk+5d4Ctx7afsLJ
	0gxXStNVEo2oD0dc6edN0GMbmED6kEQ6UUhxrWPn2ARQcZ4oQdLWL3Qg2MsJ1rhD
	0Kd27r+F0El+wG6LnXftuAAE/A4EsfHkHguAveqSv5DE+7hEqmMpmCo+jTLPly83
	TUjOffEHEFAgs1nI4mFY67vHG+JJfHWpivtMnNfkfCAEkNHnq40msUavIM41SKjX
	40T+rTKbOIVGssxKa2aUQxxG4UeHhLV7a52bH/HM5eXzZspNt0iiAoRA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pwyu99a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T3dIU8020287
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:55 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 418j8pywv4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WEgBUEpBK38s6GOBlZSET9qSR9xrgbtBq8AMRubt2cp147TdLSAYTZUPI+4R/mi4xRW937CPoQB1604UuaHiUWk9CqdghgsRWWUpinSmD02RUogtDiqWjQU9CHqqOS+6FnoMMU+MdwTLccWuliRWv1RibXFddIl4nkNA5jO/4tPB4JHwwOuE4OoLBZIACOXVpRpOwYKtvDr8ZLKNosZdP76xcpFgwUfIr0uzd2xPwbeWq/pfTNzWBqev8ytGgKHh1Kr77Tbf21k7BfRUKKeAYf58InJCAhoz+7DYY083rYSI8iVv4qrpAiJVaGcUJVS31yd0Xv4CoRcdIODgPyZOZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HkzJizZieiojBH3Hk4Oz7gbm/7lt9RKKtqgRT+wvcQ=;
 b=O2M0oeuEjy7O0OHDmnyM6TuMybe+69W4aaCWl/YwUTysvnZIV+3qQiTiHHAYDFjs7PWnoQ99TBlQSdR0e4WjDdhI4KloFsZveFJmvICr9kAxiDX46+On/tnNRXuCs0B6Lf0mJlWDGOl+ijtbV/QTFMa7sZAVT4FgCGz0XlBujS5d57P7qJQM/ZGbaAL/EO5kLP5K3SRvf+4ft/cmLdku1klOZ5XFUB6xBbK2IOBYtRL1QgjKxnhO4pKwRBTOqVqs0EExhkNUwE1f1YOSPEobGlwcKKfLTobzdLOLzQkDA3aiwJfD5jN/jKomcF/RR6UXRtFgFdVEIiQagQce5bwRsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HkzJizZieiojBH3Hk4Oz7gbm/7lt9RKKtqgRT+wvcQ=;
 b=xivfK03R8ivj634YucvUOXtcid+KfJdVbLrvfmEa/1Pclk6qdFtqh3WwxYHjdiPZPM3KqoEVWdp6l5PUl7e3l9a/b4g2+HVAFTz2bxFbtKzD6m6nzkxfhPK2Ug4PTLw8DpmxbPJF1gRqXvGBB6BJW3OUD0HybngGpWNPRLuvrpY=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB7008.namprd10.prod.outlook.com (2603:10b6:510:287::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.18; Thu, 29 Aug
 2024 05:22:53 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:22:53 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 15/22] test: Clean up the specsize tests
Date: Thu, 29 Aug 2024 01:22:12 -0400
Message-Id: <20240829052219.3234-15-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052219.3234-1-eugene.loh@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0844.namprd03.prod.outlook.com
 (2603:10b6:408:13d::9) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: 34b8d015-f0c4-4638-a4ac-08dcc7eaa1d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yRB99N2k/Yhl++rev55zGl0zOMNuC3a3hyYCuDdssW76HKZDizg3S/Z3tOpn?=
 =?us-ascii?Q?9KdynTDpYI8IPM8ltG+hlGT+XS314bK7lBhTp+wOHlmWxRs2GqQLjGPdGl1x?=
 =?us-ascii?Q?kWaYSXbtLuma04Bwz+L6c09OScWss0sZQliFyRcoNJAM53bwbIcoGCXaHbNM?=
 =?us-ascii?Q?wUQHCZHsobVaaaddusBdG9Z47ZurQo0aWPAscSZIMAzFApO91OY0c6z8wxN9?=
 =?us-ascii?Q?9VEK75TIWA2g14A1KrbnbIzc7vwtlUwPTheR9iI9bUP3M3cLwiMpfssLyKPu?=
 =?us-ascii?Q?17m/kJGyXlVVYcvfyPgDIImu4Ie3sgJi2yEgbRf6zvsF2i2tLhJzpqfflcVA?=
 =?us-ascii?Q?5dnvB3kI9OLNr7pmfDloD6KMYgjtFrRJCgyxx26P9JShnfdoLgjaEkIZKQ0d?=
 =?us-ascii?Q?PaZmJt2im+C0MjJzTZphFfH4xg4eOKwVlHlrosVlFohrtHuu612fC7Wymkem?=
 =?us-ascii?Q?2bJxhxq1WlEzLlONJbXvO/VIVz4ktF6QooHAHFARuT6CCdoQQmjDK8hnp/qS?=
 =?us-ascii?Q?ACmp+Qzr4/Z8lNS6IQkOGpAGG8mOaS9VxYRKHNzhbMaaKBO9tPPAkaYz6XNe?=
 =?us-ascii?Q?Pi+/yYKO6agZCAO4EQMAmzZHWaAMqLqCpqJge/h/nFjRBhkqwiuptfCLcgoL?=
 =?us-ascii?Q?12bYbAC8ypXxkQlBypdrGi5aIxg5wx4X0pVi2HljvLNM/ewyDEtsyxNccQRf?=
 =?us-ascii?Q?s7eeAhEk0/o3OtkQcBRnSKb3E9Ck6q7d9spWgJFuF1kywkSL7uPbkgndikq6?=
 =?us-ascii?Q?Ayq7bmWQChv/bCncouaeMHAZt9elCWtYk3KsU/CFwSSJkO6z7caxdPO2gKrU?=
 =?us-ascii?Q?H634VgVGfzyzKaneEqyBts9XSJY+oeP8HiBlX9JFNpE4q0F1lDnjltCtJidh?=
 =?us-ascii?Q?t+Z6hTdkWJBwRjBZxtsLtTuU56SuISWobPh3EXQ93l4VzYMhEisEc9wJPfzB?=
 =?us-ascii?Q?ykOGVsE8aKHxgwznFzaWmlDeYCtO8CTSgezWOoRhsGSgJ+56MS2EnARBIpNr?=
 =?us-ascii?Q?amrY5vBF6DFyIPqZ3kwMKtJoJWzeJlLSWmsKhhGpRBww4gv0uzDRd8y5mQ3G?=
 =?us-ascii?Q?TIsa70qt3s5V9L0I+Qgd/Nv7TuXVSq/sEYZy4P/MqoHbB3mY3IH+bwWSA/k4?=
 =?us-ascii?Q?ZedahhM6Tc2d8+dAuku8+UDbu6w3sQ1cKwc0hz1gkuPIVcUFifY3SKvqVCNf?=
 =?us-ascii?Q?73SrxEoTxvHeLfK6tp69e3QPQoWaE+G6HMjbHucRRWNUPJXNh+Q6v4Et+hiA?=
 =?us-ascii?Q?g4jlVkMHe0GzGbCTsThRL21/sXrgTxjs237IkBlSE1NQGMqJ2Q2NSGFQunn3?=
 =?us-ascii?Q?o1E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RhHlquZwR/ZCo3Y0qygeSUWUmy3jShztAEnBkjEoUKwKvAkoLi1M5AikTwbq?=
 =?us-ascii?Q?x4BBpJhNHWim829NAcXPuttPj7CYZWvd29y9Ge4vqWz4t1FwkscqKGsX6w8O?=
 =?us-ascii?Q?0IcNPbLJyXoqpCUbi2Af2kCxvZgBPgxXHqMYwlpk27+yGMcmpFbcxYvwq/LC?=
 =?us-ascii?Q?UP7SLlcqz8ZBSInvQrjQHYgLDGhQtzgJwhiYq5Z6LAXLSvYEklkgXPct+xry?=
 =?us-ascii?Q?osZlEeOxzlaInxI9bsWrWzYzmty2yxvI/7Y30xK4x2ELliddw0HgFg2mxFgU?=
 =?us-ascii?Q?KLrKO2MSlcAH3FK7otck3MlMLocLLYPiDqGT4wk7zlYr8j3lHvWB1sHEthQB?=
 =?us-ascii?Q?3/hXQ4OrlPUIa/DQ1iQ9j6hvJ93ZzH8UGjbVC2JfO2uCMtIQt/EpjSZ1vTf3?=
 =?us-ascii?Q?lIYxQ/UIB4B9CimDO7j249QLofVtz20VRzF8/KKqwM3qNqsg8MRH99TJJ+cj?=
 =?us-ascii?Q?mAd3+lRzWG7felLx6a+5AXglmP680eNgZdObotMTsYbI0G/IS8WWpCPFDl7g?=
 =?us-ascii?Q?Hk0AJBTQ4AymoOMGQALWv1r8vO05gMlCrlV/SjiJEoG9jox9RtCh4GIX52in?=
 =?us-ascii?Q?+KBWh3N4fKF20iU9YzP1IrYlwMtDpDQRqdJMHvXN8sQTR3P2TuVEUldTHrY7?=
 =?us-ascii?Q?dCfrBQz1WP1Pp5G8FyERcpvpT/l8esOEbqTqFINuVbm74xaTm+OHEuQvKRSs?=
 =?us-ascii?Q?GUzhf19U2qGGaTtGdavpYvJkEezz2W5+17bcLSTlRsWm0XyidPUTqI8IgZ6h?=
 =?us-ascii?Q?IsBnvXPNPK1mymqvsXdRxXWwSrqWbZRwCR59101tz66H6lNr/d+BHx2bpjq6?=
 =?us-ascii?Q?TX1DGcTSEUrsooSV+ec1KwjBPaMY0euRSc91FAFk1HK6AwWFfxS2u5QuJfb/?=
 =?us-ascii?Q?O/HbIXB9ya4rFHZ/5ijERG1vZrNDpillFMWJ/bG/FGIa356vDxwkpEdtTGhc?=
 =?us-ascii?Q?kqELfh6zpEesDOoFcTUTg/Wuin5gOAdapC1HMAUtiFzuqHpGqhb/70oRVnS6?=
 =?us-ascii?Q?ybSWbhuXQbsJQXuAnCQqhpdwjTbLH+qHUGj94H/J+AoJuJRoJVGCbRQxU8wF?=
 =?us-ascii?Q?K8p1ABXjcNt2QR4TwhyXQSMvUMKfNzUJauAYksCXK6kg/mj3L7RR9cnvHn3b?=
 =?us-ascii?Q?wPSESehKOTX4bLcbEjDt/oPNwWz8hP/Qa4HnswM0UlvmfHcmdxIYWM4j5CV7?=
 =?us-ascii?Q?pJxpMxAGA5GG/ceLLc4K5lFtzfhzGiKa1hPClUWb6pvGMZ11csg6/cCjzmC1?=
 =?us-ascii?Q?cWwoA6RBicuvzCeVSVy1uGjCVdUWHWYRft7u9WSvXZtn3KJ8ffyqlya+kL0Y?=
 =?us-ascii?Q?U7YtnJncbjgiBgynfLoQQMJqjuR3jBl3RPOLdvB0iicyu3cTmgTf+PUM3S/C?=
 =?us-ascii?Q?eVHyPJHDjX5TI090O+etf6d8d5M6rFkj+kVhV5imSqRvW8Y8h58u4p9N2I9N?=
 =?us-ascii?Q?Ed6IZ4lBr8+IHHLzM1kE7rB7S9OBBGSlNmw0NPDiuMLSF68DIP/RnkgRzh8D?=
 =?us-ascii?Q?U1kNhIs4Iws74tDG9LPesfP+uSn3XWWZq/SAwejRl/CasiOSeaPx2TOJDMcB?=
 =?us-ascii?Q?tb502PA+aUFl8mFz6GdWdHgOaKmSICc4tK9KtoBG?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	79xTmseBk7OdkkvUmd1u+Ra/TPy9ZOWmUtZAUnbafrZX/5pPzB3LnFlYzUTjWVXnb9xKqZZQ4w3rWSOKuyQ2+kGzORpktwJO7QHGNIesTOyneXQ5y5gmWTTjuNuoMBypUboAuiojLI4huJGDSlHDz4C1h8faBCEr7AzXq4j8jAqy4Z9OfLZlhMvCSdPGlQqu7+sAmh0+SB+fMLy98VuYB9FXwd69PZiJ3Ll/b6hnM3zQDyNjTvi3kgdmRw1PIFLCYuoSPNVN3+8KYEKgRI+yV044WB+M3uNg+EKkpNb3BfHCGKKfZmI0Azk0g/DMPSy2ryM2QKveZfFzjZsV/ScqjM6KuVoCmBHXsQZLRKkwfkzpBr8mVFfZjoCKi/L7a6Z+tX7u1tqkhYy5YUA8bz5dBOSYIUsu3Mni5C2A58gAlf9Aqlwc459V0mLGPB77eWKe+HnXlpO69226QY7YRM2qA8QM1tPlmWExewMY2FMgHfqKbynZhIcwyjJvkAwmcT+NGnknDtj3oM1Ijp1hj0w/cQZiC1Sz8S4JkeyzICEUu1m+GeBwXIVnuUHnu8nfJI8e6ZAinm3RQBGpzVJXVLEXJyEw9CybgzGbhjtALuIdf0A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34b8d015-f0c4-4638-a4ac-08dcc7eaa1d6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:22:53.2866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MbwKchiZqp7IA7QMhsKTasKFDBuzNxz9i5VV6XVLbOLWGmDgYTcsNVJWq31FeegK98YwMvZG1tCExTbFqQ4epg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7008
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408290037
X-Proofpoint-ORIG-GUID: 4686JqMQDu3NxU5Z_6tq7SKzzTB-jTXy
X-Proofpoint-GUID: 4686JqMQDu3NxU5Z_6tq7SKzzTB-jTXy

From: Eugene Loh <eugene.loh@oracle.com>

The tests had actions like
    printf("%lld: Lots of data\n", x);
    printf("%lld: Has to be crammed into this buffer\n", x);
    printf("%lld: Until it overflows\n", x);
    printf("%lld: And causes flops\n", x);
suggesting that these strings were crowding the buffer, but these
strings are not passed from producer to consumer at all.

The tests also only tested one clause per speculation.  It would be
nice also to test multiple clauses per speculation.

There is much replicated code from one of the tests to the other, a
shortcoming that is amplified if we want to test more specsize values,
which is the case when we test multiple clauses per speculation.

Therefore, replace the multiple tests with a single test that checks
multiple clauses per speculation and more values of specsize.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 .../speculation/tst.SpecSizeVariations.r      | 68 +++++++++++++++++
 .../speculation/tst.SpecSizeVariations.sh     | 74 +++++++++++++++++++
 .../speculation/tst.SpecSizeVariations4.d     | 66 -----------------
 .../speculation/tst.SpecSizeVariations4.r     |  5 --
 .../speculation/tst.SpecSizeVariations5.d     | 61 ---------------
 .../speculation/tst.SpecSizeVariations5.r     |  7 --
 6 files changed, 142 insertions(+), 139 deletions(-)
 create mode 100644 test/unittest/speculation/tst.SpecSizeVariations.r
 create mode 100755 test/unittest/speculation/tst.SpecSizeVariations.sh
 delete mode 100644 test/unittest/speculation/tst.SpecSizeVariations4.d
 delete mode 100644 test/unittest/speculation/tst.SpecSizeVariations4.r
 delete mode 100644 test/unittest/speculation/tst.SpecSizeVariations5.d
 delete mode 100644 test/unittest/speculation/tst.SpecSizeVariations5.r

diff --git a/test/unittest/speculation/tst.SpecSizeVariations.r b/test/unittest/speculation/tst.SpecSizeVariations.r
new file mode 100644
index 00000000..51f0596c
--- /dev/null
+++ b/test/unittest/speculation/tst.SpecSizeVariations.r
@@ -0,0 +1,68 @@
+Speculative buffer ID: 1
+counts: 0 1
+
+Speculative buffer ID: 1
+123456700
+123456701
+123456702
+123456703
+123456704
+123456705
+123456706
+counts: 1 1
+
+Speculative buffer ID: 1
+123456700
+123456701
+123456702
+123456703
+123456704
+123456705
+123456706
+counts: 1 1
+
+Speculative buffer ID: 1
+123456700
+123456701
+123456702
+123456703
+123456704
+123456705
+123456706
+counts: 2 1
+
+Speculative buffer ID: 1
+123456700
+123456701
+123456702
+123456703
+123456704
+123456705
+123456706
+counts: 2 1
+
+Speculative buffer ID: 1
+123456700
+123456701
+123456702
+123456703
+123456704
+123456705
+123456706
+123456800
+123456801
+123456802
+123456803
+123456804
+123456805
+123456806
+123456807
+123456808
+counts: 2 1
+
+-- @@stderr --
+dtrace: 2 speculative drops
+dtrace: 1 speculative drop
+dtrace: 1 speculative drop
+dtrace: 1 speculative drop
+dtrace: 1 speculative drop
diff --git a/test/unittest/speculation/tst.SpecSizeVariations.sh b/test/unittest/speculation/tst.SpecSizeVariations.sh
new file mode 100755
index 00000000..75e527d9
--- /dev/null
+++ b/test/unittest/speculation/tst.SpecSizeVariations.sh
@@ -0,0 +1,74 @@
+#!/bin/bash
+
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+dtrace=$1
+
+for x in 63 64 79 80 143 144; do
+	$dtrace $dt_flags -xspecsize=$x -qn '
+	BEGIN
+	{
+		x = 123456700ll;
+		self->nspeculate = 0;
+		self->ncommit = 0;
+		self->spec = speculation();
+		printf("Speculative buffer ID: %d\n", self->spec);
+	}
+
+	/* 16 + 7 * 8 = 72 bytes */
+	BEGIN
+	{
+		speculate(self->spec);
+		printf("%lld\n", x++);
+		printf("%lld\n", x++);
+		printf("%lld\n", x++);
+		printf("%lld\n", x++);
+		printf("%lld\n", x++);
+		printf("%lld\n", x++);
+		printf("%lld\n", x++);
+		self->nspeculate++;
+	}
+
+	BEGIN
+	{
+		x = 123456800ll;
+	}
+
+	/* 16 + 9 * 8 = 88 bytes */
+	BEGIN
+	{
+		speculate(self->spec);
+		printf("%lld\n", x++);
+		printf("%lld\n", x++);
+		printf("%lld\n", x++);
+		printf("%lld\n", x++);
+		printf("%lld\n", x++);
+		printf("%lld\n", x++);
+		printf("%lld\n", x++);
+		printf("%lld\n", x++);
+		printf("%lld\n", x++);
+		self->nspeculate++;
+	}
+
+	BEGIN
+	{
+		commit(self->spec);
+		self->ncommit++;
+	}
+
+	BEGIN
+	{
+		printf("counts: %d %d\n", self->nspeculate, self->ncommit);
+		exit(0);
+	}
+
+	ERROR
+	{
+		exit(1);
+	}'
+done
diff --git a/test/unittest/speculation/tst.SpecSizeVariations4.d b/test/unittest/speculation/tst.SpecSizeVariations4.d
deleted file mode 100644
index 4221c89e..00000000
--- a/test/unittest/speculation/tst.SpecSizeVariations4.d
+++ /dev/null
@@ -1,66 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2006, 2023, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * ASSERTION:
- * Verify the behavior of speculations with changes in specsize.
- *
- * SECTION: Speculative Tracing/Options and Tuning;
- *	Options and Tunables/specsize
- *
- */
-
-#pragma D option quiet
-#pragma D option specsize=39
-
-long long x;
-
-BEGIN
-{
-	x = 123456789;
-	self->speculateFlag = 0;
-	self->commitFlag = 0;
-	self->spec = speculation();
-	printf("Speculative buffer ID: %d\n", self->spec);
-}
-
-BEGIN
-{
-	speculate(self->spec);
-	printf("%lld: Lots of data\n", x);
-	printf("%lld: Has to be crammed into this buffer\n", x);
-	printf("%lld: Until it overflows\n", x);
-	printf("%lld: And causes flops\n", x);
-	self->speculateFlag++;
-
-}
-
-BEGIN
-/1 <= self->speculateFlag/
-{
-	commit(self->spec);
-	self->commitFlag++;
-}
-
-BEGIN
-/1 <= self->commitFlag/
-{
-	printf("Statement was executed\n");
-	exit(1);
-}
-
-BEGIN
-/1 > self->commitFlag/
-{
-	printf("Statement wasn't executed\n");
-	exit(0);
-}
-
-ERROR
-{
-	exit(1);
-}
diff --git a/test/unittest/speculation/tst.SpecSizeVariations4.r b/test/unittest/speculation/tst.SpecSizeVariations4.r
deleted file mode 100644
index 7c4bb3b7..00000000
--- a/test/unittest/speculation/tst.SpecSizeVariations4.r
+++ /dev/null
@@ -1,5 +0,0 @@
-Speculative buffer ID: 1
-Statement wasn't executed
-
--- @@stderr --
-dtrace: 1 speculative drop
diff --git a/test/unittest/speculation/tst.SpecSizeVariations5.d b/test/unittest/speculation/tst.SpecSizeVariations5.d
deleted file mode 100644
index fb71dfed..00000000
--- a/test/unittest/speculation/tst.SpecSizeVariations5.d
+++ /dev/null
@@ -1,61 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * ASSERTION:
- * Verify the behavior of speculations with changes in specsize.
- *
- * SECTION: Speculative Tracing/Options and Tuning;
- *	Options and Tunables/specsize
- *
- */
-
-#pragma D option quiet
-#pragma D option specsize=40
-
-long long x;
-
-BEGIN
-{
-	x = 123456789;
-	self->speculateFlag = 0;
-	self->commitFlag = 0;
-	self->spec = speculation();
-	printf("Speculative buffer ID: %d\n", self->spec);
-}
-
-BEGIN
-{
-	speculate(self->spec);
-	printf("%lld: Lots of data\n", x);
-	printf("%lld: Has to be crammed into this buffer\n", x);
-	printf("%lld: Until it overflows\n", x);
-	printf("%lld: And causes flops\n", x);
-	self->speculateFlag++;
-
-}
-
-BEGIN
-/1 <= self->speculateFlag/
-{
-	commit(self->spec);
-	self->commitFlag++;
-}
-
-BEGIN
-/1 <= self->commitFlag/
-{
-	printf("Statement was executed\n");
-	exit(0);
-}
-
-BEGIN
-/1 > self->commitFlag/
-{
-	printf("Statement wasn't executed\n");
-	exit(1);
-}
diff --git a/test/unittest/speculation/tst.SpecSizeVariations5.r b/test/unittest/speculation/tst.SpecSizeVariations5.r
deleted file mode 100644
index d09013a2..00000000
--- a/test/unittest/speculation/tst.SpecSizeVariations5.r
+++ /dev/null
@@ -1,7 +0,0 @@
-Speculative buffer ID: 1
-123456789: Lots of data
-123456789: Has to be crammed into this buffer
-123456789: Until it overflows
-123456789: And causes flops
-Statement was executed
-
-- 
2.43.5

