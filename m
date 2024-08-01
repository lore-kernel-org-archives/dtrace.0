Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E2E19DF7D
	for <dtrace@lists.linux.dev>; Thu,  1 Aug 2024 13:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722518560; cv=fail; b=AcKpXEjWoO4Cp9Ivs/ZfYXkJt4ZRbt3oYsNNqhBfiNVkEZfv4wKBxr+O09C2cnSF4oMvALmMUxzhE+JaMuOG6CfMY7eKAyodfYOUyvRMIdCI1r++TQDvCEBRb95HZwJfDPanbOrwHjuEe3AF4v7I0FmxaGmZQEBlli6owM6VgWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722518560; c=relaxed/simple;
	bh=owXSERWaGhYx95Jk2gZYnbQSIzZ2r03USt3KbVTKHK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NX7BB8jW5n1tcYV1JKo24PC/zeFV69WmjFahzbWPOuHzLdNsAlY2Ib6oCGC5bQFUCLemYxSzJV3TNSTKZx+QPab8bP8/MqK4NNR6h2AyhdT3N+8N8u4eeoJ+adc3yMM3Ev7X4vD0Af5DlI21BcIhfNwJUlWAI11xL0hqOJBV0K0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eTclxafF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=D097SBf4; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eTclxafF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="D097SBf4"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4717tVIW030745
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 13:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=ebQ7VdvPAfsT/J4kDQvAOgX8MPBBuWKhO9iZrYVcJ80=; b=
	eTclxafFuaHLBBk6eRKwPT1Y/hFZ8IROgnd/+mFYQJjK7+sy2jsblayy4Pzyvj13
	5pVPiOYg7DdFxHG82mt7w0l1Ae+fWL8S8dUhIaEkYnBpoMsMlZBNQhe9I87as6Ps
	RFVdTR7p9fr8CR0wjwt07xiMIEWc2JzpVKBEBoreYsulkqutPXaVAVSOCR33EF1h
	jQuhv6dHD7ePuQr7k8K1vtzRveZCmcOnS8RcoUCsnbcTq1BwBFclZZ4Udk02bB0Q
	Y6UqiXEffOUI/w10Nyzca0pxllwSSdUjOhC/EeY+XYcbIBsLAUzymtVtgouMA/Rq
	uH+lJicH1hxyj7qfxMy9UA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40msessqjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 13:22:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 471DMCkt035644
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 13:22:37 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40nvp06fve-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 13:22:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oguiVBCTIRoBIetkoZMKtIBDkPbPaACWZCaKhiPrqdmNadqLHOap5mjt5OvOQXixdWHFWwHiI5+9lnbgv/HEUM5lb9cvUjwJrFa6zXxSucRI8YRYAMdf5cBfIYCnIoq7BsKdfGKvr8xKdxupeFKtrfFjFv6iZhT0c2cS5x40p1tVpj/BnddhDJzsRf57zmmH5lBx9gPxiOXnxf10ruvkaUPef8P+VfZkJFouTd9b7Ki3/oUlEeysY42WdhgO1StUu5O2/ntdt/RRUKu3JyzYg1OhdbhDdpAvbvqKlTOplHrgFKfRd2xJkA77vln4RTRm1SBxrrE8C3lA7sH6cQMkQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ebQ7VdvPAfsT/J4kDQvAOgX8MPBBuWKhO9iZrYVcJ80=;
 b=eAcYWN/mdmyi3KDZUhaYQbJIf9PGl39tv8tVMgEXnp+MYC0NL9lXiF95BG9GHICu3Oreq5Sexvx7lNMmVBI+Pyxub/0l7CzOM5qc/IDRJFiPRQkuYO7mzSp0/dS5A/fdVjG63cEKduZknjayXEMf9lWDeRFBJsTDaK266/9XroSrN9fOL8lEbYa414s04UJEgWNIvmzTP0Tlxrp+ROV9g2DLoGhImMBmuYGHpNxyyMcDmWshthoZlCTDYRVsDpQ1XQBT7MhqZMS4Zs96g3rOSqWxPxs1fnKlTNm0BJuLf1/PBOZCGjjgJKgPJ1zPwvhgJZQJEgsJ9l0GPw7F9aWnqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ebQ7VdvPAfsT/J4kDQvAOgX8MPBBuWKhO9iZrYVcJ80=;
 b=D097SBf42jVp6dExd51QBv/0VbFFLVW8CIl4KOnb46ExUn54+hcBtRUyMdi1IboE8i6rDj50UhE7joerR0hU6Mkt+nxzMJfvsEF8MwrBwUKMEjkkrtXzEgRq1s7dqPHkgGkvsEaEV+C5HGgFEZ3Jtg8mDrr6A+k/IxGsyl2scgY=
Received: from SN7PR10MB6595.namprd10.prod.outlook.com (2603:10b6:806:2ab::18)
 by BLAPR10MB4881.namprd10.prod.outlook.com (2603:10b6:208:327::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 13:22:34 +0000
Received: from SN7PR10MB6595.namprd10.prod.outlook.com
 ([fe80::4384:e7a8:8394:dfbf]) by SN7PR10MB6595.namprd10.prod.outlook.com
 ([fe80::4384:e7a8:8394:dfbf%4]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 13:22:34 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: kris.van.hees@oracle.com
Subject: [PATCH v2 4/9] build: --bindir is supposed to be equivalent to --sbindir
Date: Thu,  1 Aug 2024 14:21:51 +0100
Message-ID: <20240801132156.286780-5-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.277.ge12b8151ed
In-Reply-To: <20240801132156.286780-1-nick.alcock@oracle.com>
References: <20240801132156.286780-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0026.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::6) To SN7PR10MB6595.namprd10.prod.outlook.com
 (2603:10b6:806:2ab::18)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6595:EE_|BLAPR10MB4881:EE_
X-MS-Office365-Filtering-Correlation-Id: 471d6146-fa73-4a1a-b2ee-08dcb22d00ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1mgGw4S59qpf//0AGPOwdv8zNn3JugUSxL+unmYPhbl3qFVzYw65G+noUkWz?=
 =?us-ascii?Q?5x6HhDC4DEJUcpv+3ipI3DMOumwvTnoo3ginJEAbHrhWoBOOg02lcwzfY4nc?=
 =?us-ascii?Q?n0fqyA8JY0EwANTLb7cIyC/l2HX17cqU6D9qLH+OnH3yiqmn6jYQMRr3lzUf?=
 =?us-ascii?Q?0wdhkXCE7/Lt1qks7vaM5ZkFB2U7Wwi18Ista3M5o+/WMVR5mlL/Y1jfKm0c?=
 =?us-ascii?Q?8oBqx8Fees2qXDRlWclUkUCV34Puv7fPzLG7sXLaMLnnjKJb9vtHkv8uz6V8?=
 =?us-ascii?Q?YAqi0jRyxO8/kGWE5zb1/E7Rb4icBhnHHkbk7Q6KJWtahFfGWOKdnTTJTrez?=
 =?us-ascii?Q?O4j71EsjBI6eApLyqOA3mdAnRb4IDdEMtHpWRN/X86QZryVGuEaxUyw+JpVz?=
 =?us-ascii?Q?UwLqoHIPSrRT2AGfmb4SKJhe7BDu/egDatImM/VGeN8+X/d1JJZIhTjDrfr5?=
 =?us-ascii?Q?7lPp1F5QaaPQkHEHvM7FTWEjdCaMlDJ6ZvKvZUxwTRzSj04DjUSOge/J3R3g?=
 =?us-ascii?Q?AEiQ2PwZr9xAVqYbzd0ToVf0PogUX0rvEvbY5HyGwxZgmMVXAxaOiOgBJM0h?=
 =?us-ascii?Q?HS3XPABwKh+V/Rb27dyCbm7VkT5+eaR+RSNqwJZiwCfjHgZPOT0BwyRTjXIx?=
 =?us-ascii?Q?hBlRpA1e1osbBpiHqml1PqZS7wO+Ja4tO61WEFJsY6ZlXLKP/X062PZFSTTI?=
 =?us-ascii?Q?4i1s+bf3/kvH3WCau7dvMgz8ermO+7On+Y9dvCHiNOJJtIzym7uuETY86Qb6?=
 =?us-ascii?Q?4ozF4E+teA4QdDpuntGq6vItIpjQnK+ZitMNefwNGrNpxVA267wtcxz9F+3C?=
 =?us-ascii?Q?12gHHR4SiBV2tUsCHwXBNLRQgRytbj/wL6Gmla8BpTZ/JudtYM/2xoqn3iey?=
 =?us-ascii?Q?Hd/6vvamW7diN6QTzaGkIIVoOvawfHcoUQDTRQ9E2tSlc2Ps+cMIiNKEHOhJ?=
 =?us-ascii?Q?/L7hOJmQFYrb17x5Djs3fIPix7YPKcmSfGyROYoA9Fft6IVHH6fl1VNEUDZG?=
 =?us-ascii?Q?d2tcd9W84JzX6PBmNYC3r67+zEUxJ+vJBCKKja1PuUPvQfAx37KJZh+EMhv6?=
 =?us-ascii?Q?TZW9Wlre46x9z1jLkHYoSjLjwpSdX88ddyQt9FjNqwORmG6J2SJmM6bJ7m5F?=
 =?us-ascii?Q?qKcIMZgk59ongXCTnMBYYI1ifBI4qL1B7pOwU1TGaQ/yM/t/M2bMcUkqS0bQ?=
 =?us-ascii?Q?uWrejk/w/P5YPPp4UjCLGODxaukVGWwzIaIddtC0lgvxOVQxz/AYUGnvRgU+?=
 =?us-ascii?Q?wUo8stfdH8OKq89GDGI/hV623LY/E7vUUHSsqjI8vkInpCgub09qVVvl/z8D?=
 =?us-ascii?Q?Zf0RgY478mCSo1+RmlFsgJVCZtvGmObfHdaDNJd5X/AezQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6595.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uItKMiABtezQ/OWSvIdKG+n5MuOssukbie7MbgLFUqszoY21gr4QzCYudncH?=
 =?us-ascii?Q?v2TaFgPVgtt0SgSTkW28OWI+/qRFQwIFFWPvOLzovhnYTYxXIcltVXA2n1v8?=
 =?us-ascii?Q?visYqSFWVnj9DXioejxHvH4/l53uBHovda2STO/rBNJWdMuH2pWTY1ADJ41O?=
 =?us-ascii?Q?ZX7bFXuMcLPsX8GETzLxM0sLUdHxI5FIwQCgEz97W9UO/KpcgbtWp2GX3rrQ?=
 =?us-ascii?Q?qh+YG6jcTkpZVSD1nBmZ2MYeIQaucc7O63XgdSI3hgVSmVV+g/lRrIrg4xOO?=
 =?us-ascii?Q?uP8uhzZf4rb/g6NneCSIt0FRdW2KiVteMT7Eym4s7d14hXjXOGNMK+vqGw4A?=
 =?us-ascii?Q?TKtwTNgsH1vxTXb9OemwUG6bcutJa1Pz0cIlTqKjOf7EDo8vlGe30KITv7ke?=
 =?us-ascii?Q?kg0zq8HU7YFMCrJqYQp1gLYsxd3T67pE/8THQHbE/RzDwKsjErl+iI5eeajW?=
 =?us-ascii?Q?5CUxqXh1TsNwf5LfZPNAi93qPnahNJJkn23dqIn2JBpWBxatnhN6LURkeQWT?=
 =?us-ascii?Q?PzB6TJohb5E7XOd2LOCcjdXaMd4dR+cE1p4O408RdfCER3XfQxd2G0bXLclv?=
 =?us-ascii?Q?UHDn+VwS9FelJO7lopdTlnC6t0xPAbNX/0AI16nF4GRTa6xrkDwsIkckUK4N?=
 =?us-ascii?Q?odndCb0DlAppHe8Qk2OTCUIoreZKJozu6GtdX0yOri0/++n3Iae1NaNkDGXH?=
 =?us-ascii?Q?TstP342b+VoJ5XAFHyYaOoPu40PjIMiYYeQj0HQ65q0fP974FMbplvfA8fT4?=
 =?us-ascii?Q?BNzzAII9CGxKgYRTHsBzOgMha2XjalkNuSBQoR7xhDRMKdUshljmJca1/WI/?=
 =?us-ascii?Q?xO2CLhN/Opxxb9uVQ62dBP8BpitC/0k72wdDejLRJuM4zVVGQfM7iegWPY8R?=
 =?us-ascii?Q?6UzttlV85tUsjQDoe5ludGGLgvNt5YTUy7UPIncehSrcUhOXGf1CLxaelP2r?=
 =?us-ascii?Q?PRwTNicJ9rP+qoHUimcHpQ7ZYz6cwwc2MIuJLMx8M8eJZUmF+o0u9C5DorlY?=
 =?us-ascii?Q?+cheH2Rv1KCNnSrA30lKu8sQPDQnaEctXwnuhAxcU4AYrDO1T4C5P3voM2Ep?=
 =?us-ascii?Q?6lJgRra1vF9gEhElNPFwQ0M2FkVdDifeZPT9vOLETU35wDA4ATDuupQWPj3C?=
 =?us-ascii?Q?xwsBm8DdtTOMkqlD1sPaxmnf4lXL09AZ8h0yu/gdUY00xBFicHjFUmKLveWv?=
 =?us-ascii?Q?rotuoBxhDt2GyLAKtBbAKcOLQA7QlpsEO8H/wtj4JcPbDqUvvHJ6subN1Dpt?=
 =?us-ascii?Q?KSUWI7RH+nyrZnpxw1SWusEHNmt3EYmn0h18gPNKVmGR1TGU0h4/Sq6O0OiA?=
 =?us-ascii?Q?y+QQwp0RJjVqV1o+ELQq/Xe+HY6UNtIIRPFb9+dbWC2U70vUC89pgb0c8P3I?=
 =?us-ascii?Q?nlUWY5Ag6DDD/+VzI7I2gyIiqNgcGpi1O8mF9wAE2c0dXWj9ybDS4dSon+YX?=
 =?us-ascii?Q?n2sYMzUYRhu3ltS1wp26RLM+Vr3GoSgT33LCyqU5KWZLBk81W9I1hrBYB+OI?=
 =?us-ascii?Q?4qKqwOJNYnL7JSHqXTTbFyG9cDlDN67dR0fxzS41Y/oIQh4uAtMwqQv7/Riu?=
 =?us-ascii?Q?zPU/Y7xXkHLKbzMgHGq93qhUR092t8QGttDgjqQOjdtWIqsx6HBdreTnLeu0?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9x85/4eoRh29Bv+3CRF0dd8E5AqM9/kiTJfrRvhx4VQLurtjwtF1Sv9VDoi2ibHhcUI3CuGRKrt1FYmcYo+6fRX7NRn3WjMkkrdQTM2o7skJBRlw7GvQuxz8s9aDxPpzMdSKqkOOhVC7N8uN0ONe+sTsC3MAXjYO4rTwcRgNHpKO4b8W565nM962vX9NFHSW0hQ6vKyGEQVJgOWUZfl2lq34dhceaFnlmwuaSTvhpINix/4BDYG81wfBQYg0giTMZh+byhJgqVVTaHxp02qiuKRI8sYluxe7uf6z3bhqjLKkGpXqN6+8AdbsIlbt/fKYUoMsRuriAYju2/OC8GT8RWAaJzJNf35E8TxrUY8/udXSe5qaTrMOAdfCuKCUcGRiVcaIYbAcJyNU/MV+tPN48u/sIyrTS/D4g/odXYzf5WHHpqehSoD+Lfio5ZyVQ8MLc7jj8nwRr+lQ/v9FLM3Q01RfsVGIl5zl6QORz34NTlf8C4Pm5o4rE+QrDB3U3eW9HqD93+NDOlcu6xc2DgxtqBso8xvbpjhBLSffNN7EofA3+WVWX7lqDuUpr7yJoiQWlfH58Lb+XEjw0ldTckRkojDbhUXYlOS+Q0Nn/QjNLCA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 471d6146-fa73-4a1a-b2ee-08dcb22d00ef
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6595.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 13:22:34.3068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WbHSnf6Uz3CFAVrUB6xgGcs9+Ox4IgOVP4S2kpwWh9m/iJgpcL4FAk+kf2JX/4YPHoY1K9J+rI7sLfQ7ahWUEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4881
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_10,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408010086
X-Proofpoint-ORIG-GUID: M9aEFO1OjByBzBBZzG4OcW10u7B0nf-P
X-Proofpoint-GUID: M9aEFO1OjByBzBBZzG4OcW10u7B0nf-P

The configure script said as much, but actually it set a
BINDIR variable that was never used for anything.

Fix this.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 GNUmakefile | 2 --
 configure   | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/GNUmakefile b/GNUmakefile
index 0fc9b3b5e85c..5903a8e355f6 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -82,8 +82,6 @@ prefix ?= /usr
 export objdir := $(abspath build)
 LIBDIR = $(prefix)/lib$(BITNESS)
 INSTLIBDIR = $(DESTDIR)$(LIBDIR)
-BINDIR = $(prefix)/bin
-INSTBINDIR = $(DESTDIR)$(BINDIR)
 INCLUDEDIR = $(prefix)/include
 INSTINCLUDEDIR = $(DESTDIR)$(INCLUDEDIR)
 SDTINCLUDEDIR = $(LIBDIR)/dtrace/include
diff --git a/configure b/configure
index fb9a45cda1b7..4026a3eafcd3 100755
--- a/configure
+++ b/configure
@@ -125,7 +125,7 @@ for option in "$@"; do
 	--prefix=*) write_make_var prefix "$option";;
         --objdir=*) write_make_var objdir "$option";;
         --libdir=*) write_make_var LIBDIR "$option";;
-        --bindir=*) write_make_var BINDIR "$option";;
+        --bindir=*) write_make_var SBINDIR "$option";;
         --sbindir=*) write_make_var SBINDIR "$option";;
         --includedir=*) write_make_var INCLUDEDIR "$option";;
         --udevdir=*) write_make_var UDEVDIR "$option";;
-- 
2.46.0.277.ge12b8151ed

