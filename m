Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B671C2AD
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466518; cv=fail; b=INq+nuHGnVLa05dF59wNWmtBQGqlqGk1+TR/cjAcVuvbeVKqof+9EEtgGWSJUYeLljGGVVM92GLCMSIUsikgC2VhDvqh7bRnUsDWzYm9jwaiRPgL1ajbpsVK/C7F/UeZexn43xlNU39zY/yjLlXe2pukWVBynQ7dNGXKrBJ0z5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466518; c=relaxed/simple;
	bh=ylIIN4O6pH1B06mOHKG8oQJPMSAT+psTKv5uIwO6L5g=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O3wDniBJ+IdoVVCAzIeZ1qoZQnT5bTERAfCLcTlCfRutSg6sUKH9TOIPAAS6ISA/ntm9qGiPjGzVxCpofKr9dlZb5RD4By9z/De/X3pxg0SfV8TXaTRIimxqH8Xr+XaK7tW6yxrXF5MWTqBkW0f94prVoOVzVH31MguRdWNVG5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IX0/YEC+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WI19bkY1; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IX0/YEC+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WI19bkY1"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMVwd007330
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=xQrJvkR29206DA
	ygVLLYIgxUlkmVXR3h545CM11CmHo=; b=IX0/YEC+uOllE7nIrbE0OFz2+Mm+uB
	62GEzmh6YsmyG4NxA+t0Sz/qvYjvV7eqsrvKeUNYuK7Z2bZeR6GGACtHzWH8nEE2
	WPzVdm2oOPA499FGJ076SJH8coir7cVo0mtyz7aiFJQfP2G2fQPCEs1ZLKlxiPMq
	aw2v1cEBYLjJbIwQWWHhX2YHrBV8VHD1za+sRpC8vCeEAmRCscK32zVEfR5vWM6v
	jde/bQIjL5W5QHlWU3dM0LqlQgxgasTNM2tpIzU3DvUz0pbJUrZgx+PqsR/+5/im
	JtvApJTsWChE5tSID0l4a8Hfzl71nc0UDRpDKo8djKaEge4KuRmR/5MA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywp7smx5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R3jGNo021445
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:15 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3yxys6usbu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxelZFGX+GN96SZLC7CDIodXbGFTt32GFI5lvuRl6HfT+LAELlQqBZFZG2qO4wCyDuYmh0dMbhFYJe35JWr5T7ZokQb5yLOjDnGvQxHav6LSISI5Hg/55HSRREj+bpJaMOJnwTo2ziof0qiQgwUa/37K+f8O62mwnKKjxMPYN8lWkYd/pn5jL+J1v1iqBJrDdG3CWlJMIEin0eiSL4Mp8QifLiE/U08iX9r01UE1/E31qJQqouhvdu5cN3BE1StC/JPbYkdKKGOcT4xIhjQ7fhdQBw0ymb1J5sQ4hKXlBNupwzsP5fTKoqGfNlKsrTDQ1KLlJTlV8flOyFKw0T2diA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQrJvkR29206DAygVLLYIgxUlkmVXR3h545CM11CmHo=;
 b=VEQFKaqYkTXaZqYxmhDS2b1h63kF2C9aq2SUgFOHhKXFVfIDb7dxXiFoE9xIgWaqX3Ra6qS1E9veTpcByzxKq7cpKvn9iuY+t6fEoN49iWAgX/djcrLIlLiZdNVpQNHpfCLQs5hYKInKXZ4gBlweRSBUUByZ4qQApd5n1L+2u4WUQccdaKsBA455rOlmmbnqPVOAghqHTpgpVSvkvUcN8DhR564AHaAsDo095FuBbpRf7nLkwBBJ5410Vztl6egNhRTStnDs92iBjjgvCyaUtfo064HakBPlWw2A62xht2yF18hO4AnqJbBA4kRAZXYxik2pR/2M/K1e0s4l0dVv2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQrJvkR29206DAygVLLYIgxUlkmVXR3h545CM11CmHo=;
 b=WI19bkY1Nlw4C53tdrYk96tnOklDZs6WmuWP3mJt7V2ygUC0+OdzQlncdpcS/zqqzAJrVN7mA/HxaxR6uSlKE9sfjALHWLy+y455M5NA9Zu9Yg6B3kO2QnahsEf4coS7nisnASvuV41Pm0Xbi7Xh9iX3RrQO6lt7Xj8sDkmk4OU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BL3PR10MB6041.namprd10.prod.outlook.com (2603:10b6:208:3b1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.33; Thu, 27 Jun
 2024 05:35:12 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:35:12 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 03/38] Get rid of apparently orphaned status[2]
Date: Thu, 27 Jun 2024 01:34:20 -0400
Message-Id: <20240627053455.21567-4-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053455.21567-1-eugene.loh@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:40::15) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BL3PR10MB6041:EE_
X-MS-Office365-Filtering-Correlation-Id: 83ae0221-ec26-4b6c-fbac-08dc966aea26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8Y/bQi1sPn99C1HXftZ0rpqhiIZoGgiiQ4PfnfxkVhgfRYE+eJAwI4CuhWbW?=
 =?us-ascii?Q?c5irnbjP1rR22bBJB/rSMOfFDuDQksOBWvM4YJpuDDjAU56/cvjM9OjACAWe?=
 =?us-ascii?Q?efCn6w/WVgU51GU8zcHta+F2q3/jnauvh1enue40fFfmz70+k/rrMGdiiJ2X?=
 =?us-ascii?Q?5ur8B2dPF5gH/KGWP9rbAQ2KRl8jdGWDb5c+fSC/HClZiMzutVw0Hqs92HPW?=
 =?us-ascii?Q?Z227qaglDfRb7v2rilSFeP5fsYo3SHyhsOY8wucOzDKoE3HonZ98FZQDDzzT?=
 =?us-ascii?Q?kp9CpSVtfM0PGOZdMk7S4K5BBI7HsgvEOkL97GyHVJocILgAOAW9uucUD3qk?=
 =?us-ascii?Q?FFqLfF13qzD6Qohz+xEdTZHdxkFZJbyfz0TdlKESizA7RMZRr9KvTreaAv4Z?=
 =?us-ascii?Q?eVEboFdoy2FCViz4x4k1cQ3L1oRpWbWZmovWvFRR7uT4yx/h9mM8TOuVn8ma?=
 =?us-ascii?Q?PrdwbB71IeqSLHH5h3xVIbk04QH2S36a+nBAUkqh1KaeEpWlCLEWgR60G8bJ?=
 =?us-ascii?Q?D75D+1bj5b9e3+iJVDSXd+EGMwO2uUqS1mOVEtw7fGAkdzfmosMMkSXa+ZGT?=
 =?us-ascii?Q?gHeq2I2tN+/JwPq5lehWetLmmfnXEnSgCmxdzqNDvogr4pPS3bwKB3+M2o+l?=
 =?us-ascii?Q?KgYm+Fb/j8Q9mAdq30gPh4CNimK9LsPN2ZHcAU2MaAs4CDvU5jl1uoMt7nmm?=
 =?us-ascii?Q?gKdRrxAHlIu1tkORbhFootg9amRmnepKTayV0MlBD/tcbdY5FYpOqnjzxbhy?=
 =?us-ascii?Q?q9VtCnMo2eVF8E+AMmXNlWFq2qJi2y/j+noAF+ITYdZ6axFuk6pU2UZACqn8?=
 =?us-ascii?Q?XPkxiL6s8VvHzjlIY174Z0Vxlz7wq7hxDFB60FZnyzugIqlnEa8G3d36wWcN?=
 =?us-ascii?Q?IFIrydRx+66RCSuhOYdfJM6pIua9gRcaXHZjZeVYOw4E2KDoHimEKqdb9rBd?=
 =?us-ascii?Q?9nDczpXFSMbhIByunClw5VRJbqcSTXEy0GjW0Ww4fEUi4DHuiztWVl88AYNp?=
 =?us-ascii?Q?krV+vKF5m7YsWDJZyLC5Mjjwsc6hw+X+zTsojSy4oWkNz9d44E9StCQ+X39F?=
 =?us-ascii?Q?ZrpmEeWgqhLYE1w5tUfZSPievepopvbYI+ruMG3BirhOZiPJ+8RyrjGoB2wQ?=
 =?us-ascii?Q?KtlgFBnuCiLSv20aIF7AONk5fkSr8UsigEfHdNrIrFrVuIUikU6iVkNHLG04?=
 =?us-ascii?Q?KFN+6zOdPIyRgWp4WZBGAb9DE+g4BzVWaehIBjD2qk0uSauzYFkcce5ZyVcM?=
 =?us-ascii?Q?YGSpu7pVbHMJ+2/4NXt+h9rzyfQ+py3kEF07eZtD9J6reC5jndpwgWto4pPz?=
 =?us-ascii?Q?BkwBVpGJaXxEu+BNZMm6bUWP?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2TK7jqjRw62UFVRPBKw+2XpsxRWc5zXGS1WIv7phBslN8WTDV0eyHO5cnRRy?=
 =?us-ascii?Q?NPbjUv8v8nlH5AKZiCwqteGdRyZZeKqUowBbHhTVhb+mSaALp1Gx6PoUWfmk?=
 =?us-ascii?Q?jQqNDz3vz/YJYYgpvdT7wr5GZXjr+ndyEEwgoOh0r6OoJg6n7EZH41Ek84R2?=
 =?us-ascii?Q?DXzsvEYisXyu3/y9p7U76BPkbSwiNN5M2d2csh+GKhUfwXjTRQ9HZYysx6Oq?=
 =?us-ascii?Q?lwqQ7184pL2D7DlhXDlGooEwvGOsRkg7otcMEDN0BZnxYYLdF5duhb48NDG0?=
 =?us-ascii?Q?55Fw9m/xlWQUvnaMQuNnVz9Jir1T5jYU6unZfftwbl3gKQdez52Gf4x+oWcB?=
 =?us-ascii?Q?0RRAN8sxtzYjobUE+zN90zTyosGkim/9ibzXrI+f6+xkPHToySfwvICZhazV?=
 =?us-ascii?Q?COu5nf2fFvBXG3QqK5ch+3uqKM+kxnGNoYGVjRRbrkzGHeeokK8x15N6ACzp?=
 =?us-ascii?Q?EzCpEcEln8EOXZDG59ms6P7/kmOB1GueeYgtZcrwWeG3zh35UkNEeOvSScRo?=
 =?us-ascii?Q?n18t0TlefPxJ+yqODdDr5O8H0V0T4XscCbyJdLNPLKs5WZRUUWO/13CsXn2b?=
 =?us-ascii?Q?oU0AtoxWBFwY6WFNrq1ekpXnXHxPAtelfIPezuDqy2l90Z2R9fLGIiG5qSe/?=
 =?us-ascii?Q?PNWP5ndghW75M50kg70wby8eplJUn9AGztrS4CVyvcZF2eRJUPFIeacHD83G?=
 =?us-ascii?Q?NIdurkaQRmkeSdCwfVMVmLZmrEmxZboU8V7f1j3HLqZZdThdK4y1HT/2tg0B?=
 =?us-ascii?Q?jMWaGsVV4iZehH1AITEHVmnUYx5Y6BOv1YJaKTrKkqhHpG4FhOyG9mu9N2Cw?=
 =?us-ascii?Q?WjYI2sjY42mY3XhyyDJVrEVhmXTQOfE2ac1qZolu6FdMJtgna0WI7D/aFBtN?=
 =?us-ascii?Q?L1jKnZRXNHRGTtE1zJ0arFtxTek9lZqUq+AGi6I5qOTpGZ8ioF/iNOEZ6HMs?=
 =?us-ascii?Q?Y+SzeXeV33faSF0oV+5SnPp9tfnn5CZCdpOiJbp/SctqVRB3Sysq0d+2CjlT?=
 =?us-ascii?Q?CnlTjWHC5eH2gJ7X7BGYavYE5gj5j0qKPBOWo6h80w/CI/pGSNYJyu4mMSnV?=
 =?us-ascii?Q?5XQ1MxgZ+vrgxKWsHij+ggsgVNgalSKoYDrktSPVv6xLGuRZ9geFvAWO0RJ0?=
 =?us-ascii?Q?AXbQv+G/56FWdznAqSyjCs5Bee98ID6GRKORin9kOwpDYeKvahQhlXyTQSan?=
 =?us-ascii?Q?3lEXqE92LgiyTR6z2H6S7PIatH30IYgOi0h0axYK2YQfOLwKIAaoGshsG78r?=
 =?us-ascii?Q?OshYkrD0hiGKTVvLzcYeygmUqTZ4X98VoNdtst88NveYISBjpXlgZ5zXyuGS?=
 =?us-ascii?Q?PgXUWblwQS0aBm6K5+RIZI1XbO29Xpl2aSTiQ5sL1tMTFSEGDk1zadHuGKVR?=
 =?us-ascii?Q?Zcwq005QmwjtjtzeHkZlZuK5f1JWgmU7S2cWgWuJY0zjj2uwMa/4Qj7cFxkN?=
 =?us-ascii?Q?yLk8auyIAdAvryeMlipy4UOkXN0p5KHaYHUwVDun2yBJx/Cdefu7n2cIGDNC?=
 =?us-ascii?Q?i8FWHOwRwgEpKDxidcvYGs1f2Qe6jW1vhCV55NwiVg1AeCy59jzhKxCJWKJC?=
 =?us-ascii?Q?G4CVoUf32O1wDKObFxtPTBRRcurm8sckvH2lsyIC?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	+pSVQhgswdPat7Yi1eWpv1QlHKGYBVRPU27qFCfMIvMsyMUM2B67OVY91Q0QzXrVD6WxIG1w6D+Hhb8dd7k6ngo92oUFjZ6soox62aCuNs8xkejLpN0yEilWh3ym2v+tPZnNyx09mmU4ZnciAqcIbBAl/QShQ0OlcVufsqxXmuNxyHixaAh/giKAPBboebM830SaV/hyUUf2eJ+154dBEQJ4riwXo0ybJi7IAFfu0EOjZoEGDSqyNW8P2L5IqOZJHcnrHKOGjkqyEteYnlsLZJLyWMLSUFA6RpBuGGnhIl0HzsQB5a5YDMcvLD38PknwLysD6HMhyKF/RRLbnUbfjBS/pZ2+S6UwuLTEjDCaQT3dNSHmw/jJXDT8u1/EcmnAnreoXeb3+d/FGxEmuzBJ0YDff/113JMcWjw9W9BgPVq2DEZau5OTYZacBZr0SApJ5uTn9x+CGvOrZzaakgtkihLFt8Ooe2fcLLkf0JhaoVbom5oTIpCJnv2FPyH9Xoik0QXGjioP9TbWxJpwO3lWb2C4QKFeXSX03A7fJ2VWapzwMmtDJ3I5e2q4500gnBXBniqG1hqOGijwXXa6Kz5CkccY0i6wtFh+YjBgdYLvvi8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83ae0221-ec26-4b6c-fbac-08dc966aea26
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:35:12.0177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0zJtgs1CZW3K5D9w/DGHgAFHHkEhRRK+LRbO1jPQPXqKX5UBG2PohqD2Uc4mzYhi6GDpPiLdxOlj3oDN5Dz0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6041
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270040
X-Proofpoint-GUID: raVVMT_EtAqsHrZBG5zdtvRd_mqe0f9a
X-Proofpoint-ORIG-GUID: raVVMT_EtAqsHrZBG5zdtvRd_mqe0f9a

From: Eugene Loh <eugene.loh@oracle.com>

This has apparently been replaced by the dtp component
"dtrace_status_t dt_status[2]".

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 cmd/dtrace.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/cmd/dtrace.c b/cmd/dtrace.c
index 9c820686..ba1c22c5 100644
--- a/cmd/dtrace.c
+++ b/cmd/dtrace.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2022, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -916,7 +916,6 @@ main(int argc, char *argv[])
 {
 	dtrace_bufdesc_t buf;
 	struct sigaction act, oact;
-	dtrace_status_t status[2];
 	dtrace_optval_t opt;
 	dtrace_cmd_t *dcp;
 
@@ -941,7 +940,6 @@ main(int argc, char *argv[])
 	g_argv[g_argc++] = argv[0];	/* propagate argv[0] to D as $0/$$0 */
 	argv[0] = g_pname;		/* rewrite argv[0] for getopt errors */
 
-	memset(status, 0, sizeof(status));
 	memset(&buf, 0, sizeof(buf));
 
 	/*
-- 
2.18.4

