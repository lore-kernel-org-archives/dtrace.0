Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A021D5141
	for <dtrace@lists.linux.dev>; Tue, 29 Jul 2025 14:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753798411; cv=fail; b=cfFKpD2Lja+M0SaEqRoE3PMFTsyI5AyKak3da0k3UToAfWtsYwYUK3bwMmRpEOklRXmEHV1YXcwf3iray+1x1dKa2L1IU5WkcFh5vC34oa7mKXMsehwZCLrFGQTBC5B/Swp3TvBMysKQjUpdZaIGCb4RRc0IW73A+F/1t+kLHFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753798411; c=relaxed/simple;
	bh=ljzBrarZR7uEtk7w4Y7xANZj+HP+lqb6mA+2kHs+wbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=W6GuI8b0rg2loeZCxqIEcJ0MSi4L8YEwgMu1A/Q2FutNotQsGcUt021pUhawuI8SDyAe7QKhk8GleD8IV6G6TgHmQqKT2zTyQgs8OTTyyUhsdxjmussIKql+44lLQxkw9fQeONQT7G4KG7FEGQ66sDuEyETlW2dExEZD3pGbVd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=roiFXOZU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JLkUvDDl; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="roiFXOZU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JLkUvDDl"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56TDu4dX018419
	for <dtrace@lists.linux.dev>; Tue, 29 Jul 2025 14:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=E2qjFDdJfml+7Fu1T4
	U/JM9CgKEKk0ERF2UHx2RRYN0=; b=roiFXOZUQwZ9fCsUrQXn3zAJsi7KxGUz8o
	XKpmZD0hS1Ept0RGjgcnBhlCwmSfmnEUuSn+y77b7lyQFv1zkVJtHovX2vSgmbS8
	2ln2WHOf25WpIQ8K3NeRbLKQMiJmR3rCtGqv9tvoyQT9S0Y0qtvJowYwEYOC+xYV
	qrR+xTIUmnp/VvOSe0zS5veihMiTRfwDEZGax9djFdAyMFtFWZ6MoPcxSQ0wbqUB
	jRpmEDQxKULAnG+dPaTyFdNQbAA3hes2ebHOKxQQqAnyCEhPzSeyIbf9UphX8gNp
	gRdzoWgbJqkE/L2pJvcUJmBIufu3GK45rXM4vsv3Rm8DzdNL/B/A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q29qve2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Jul 2025 14:13:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56TDb3Jj037819
	for <dtrace@lists.linux.dev>; Tue, 29 Jul 2025 14:13:28 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 484nf9q787-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Jul 2025 14:13:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLswIELphyzP6sbDEkc0Da01tgWoySUem4hAu7LENGAR6yReJeImRMDT2LHGQYn4gjmjcYkSETqWPJAK58SIhMg4/ggoGhtcja+Fnwn/i3k5yzbv1AmJzP660ZiUc6b+IaOu2hBi8XYzBB36qq2p5wVgnxbLucANPdJxQ0TQGeVWMVTruTNWRS7V4yhMqtPs6WEIKUGq9hVjRSAdGB7wk/dmI5VS/lDRlmMIJ7Jt9PU4yN5ruHN1AwQ66qPvFO97Puq1EnuSUVSeBdoaa1Jub2m+3cJhGHIdtWiGx1L93ZAeRPhp/J5pkDwZ6OHm1rvuKtHHAKrZE9KBOaTb2Oyprg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2qjFDdJfml+7Fu1T4U/JM9CgKEKk0ERF2UHx2RRYN0=;
 b=q1iFO9KyXMa/DxQSpBtOt2PWDscdi8dd1mc7ey0IJkW99eR3UdnDeug/Suz0tCRu0EkmAt+8u7/FsuQf3fksNY3CHT85Izzl+2OrQRXB9kCZYDiYNUgnGD0I3nQcXBTp/rEhke5Je4GdoQfnx8/rL2XvEZaiGTjwcTnqht88bvlsl8nXtEIdOgH4H/4N3G9ieAiAY6iQqsa4Q7gGTaIDd3OKnCoOaXuLvHHBQOVgRaZf8uI+7qpBFCfE1ZHMde3kYVrLMFisn8krUDDX8V8axOB8cl7H1IRDTI0ESoP9AsmT8zGZG0BFESDZ3T01unGR4lmzskorwEP0RvHhpcecfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2qjFDdJfml+7Fu1T4U/JM9CgKEKk0ERF2UHx2RRYN0=;
 b=JLkUvDDl7U+k6HOfaoO560iIwTYhD7PsWAGcZrYPNlJuHld8wz5GO00r3vm5jCltdTa4ObCD2VSz6ImLgDEwHLyA6WztDv/wkC/mjVw0bxDED9q//1JGXr5Ohh+wkYRaNYHmQm0MiNR+JnCt5Rj6oepXTZelqvrxxG5FB2ceTLk=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by PH7PR10MB6252.namprd10.prod.outlook.com (2603:10b6:510:210::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 14:13:24 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8964.023; Tue, 29 Jul 2025
 14:13:24 +0000
Date: Tue, 29 Jul 2025 10:13:20 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2] test: Wait for output to flush out in
 enable_pid
Message-ID: <aIjXAIS6pP+51BMI@oracle.com>
References: <20250628223050.3396-1-eugene.loh@oracle.com>
 <877c005or4.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877c005or4.fsf@esperi.org.uk>
X-ClientProxiedBy: BLAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:208:36e::22) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|PH7PR10MB6252:EE_
X-MS-Office365-Filtering-Correlation-Id: b31a8c5e-1e66-417f-d95a-08ddceaa1453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v4O2bGnyDxyMHO+o0ZRoG+QzUZIxVfLL9XWZjSp0R+BGcT01GLAt02GkkGLT?=
 =?us-ascii?Q?lmte2ZWHqRSiD6phtqX6y0vMsbLhk0wSD3P98uxLtUZ77VLWMCldq5mFO05d?=
 =?us-ascii?Q?ZtWq87zarQ+6Bp7DUe+J73LaSrOOcok3yy1WzYY0Oi4lQkn2KC0ESqKmioMk?=
 =?us-ascii?Q?JiRiChNmHLpj0OXauQdxMxSHgnOcLUarwI5XPZYGHHYVo2Y45IWIe2nvi1KO?=
 =?us-ascii?Q?YumoEEtlsqkbdyY+jvuGFm8Dml4fVM/B/xy+/xTbmS99T4R08zjhVr90TSzy?=
 =?us-ascii?Q?6Kpxo5m5tJ5n0JbkXVn2WeO6/App2vDq/xNiikDC2AQEk3lwe4cE1+utxrEp?=
 =?us-ascii?Q?OetTiEF6mLJIABbuZBUbtbhL8vd4S9o7CO16KKBlydT17Sd1PdGMVqXCt1O2?=
 =?us-ascii?Q?CAxFMGaLGR/TGQhQkYP3U2ClPYwHQX9qVyOUJfVZkzcBrZsAgai495Tv8vIM?=
 =?us-ascii?Q?LiVJANgHNNNhLy9LQ7/F5FiHgiYwkRQ66fK3n+wsXahyxCYubPJsmMOmLzqb?=
 =?us-ascii?Q?QsWG2fvkf/jRkt594fywtqyFTjhWDn3zcyZqy/z8khkxflqSLbI8+z7ctbxS?=
 =?us-ascii?Q?lzh61QddfYokjz5UMngIVlaPfwKOKJJM6xfTUsL0y4mZQIRACPx4npZgDItf?=
 =?us-ascii?Q?qlr8VpGMfEJ6X0g0BHe2dFJnIypiY498pxocTvRZSNKlH0IlQ/4IQhlECcEU?=
 =?us-ascii?Q?SfwUpM3M/rIqO7U193SzPK3q7TfWd8mJoNP20CDDEAjKvk42uzmtdULuUtzs?=
 =?us-ascii?Q?z3mfIZttGnZ3jL1pazooYpFHZNL9OCWGtviJCBBwac4sIAa/GwT6lqB+pHcq?=
 =?us-ascii?Q?Hp2VsBYl4Gdn+LWYN1BJSt4WNCWMjpsaSVZjRTUkMmf7RmDH5sKgkcizHCro?=
 =?us-ascii?Q?9mBWMeRRBCRNOEsSVEG+2TGbenVxIDGcNInqmFLBwc7d26RTC0HY3LLk3QLR?=
 =?us-ascii?Q?ygEA+USiU4CfP9IY86K1byr0sbYFe7M/Uz55lBvslZ3b2SiTe/7nciPopZCY?=
 =?us-ascii?Q?nGWBpRdjhu5ZZKxJ+J5oXWZQlOrWHqCLqAp5e6OlTyVZROSvHTBL81B0hZRy?=
 =?us-ascii?Q?BgZxPRxEY3ygUdCdDW1lqInCNWkcUb9f4X+kBka4wjRzrJSjwhujYuipU4fv?=
 =?us-ascii?Q?W+a7rZclRsxqA3KhfzLwu64YouhAPage77mAwf1Pi/j84qINL1AH+6HNCMfJ?=
 =?us-ascii?Q?1nxucpcPl4YOhvtM8jX81KiXvlx3mXklzYAMhQIXy4gwac1t44HeuP6+9MRh?=
 =?us-ascii?Q?B3/uTnXG2U66aYKXEqgX3trl7lupVmAbzM1OQ/gbKZkErksNp3qDNPX3EWk3?=
 =?us-ascii?Q?wJXNHxqzOfm+d6dAnfL17MXoDDCIBirG64Yu0euRAg8l+9MwoqVfs6UZwVmS?=
 =?us-ascii?Q?H8DhImhgWU5XQrV1omYB5Qu/dlWx97AMxDXZoypgTDnFvQC400V/kn/amG3h?=
 =?us-ascii?Q?NAiLosgxeck=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0wvGMLJFDPMmyTrLrAag/pdIKGsMHJ7rZfG58L5y1F9I0QaLgKAvImNwNx4N?=
 =?us-ascii?Q?bNcigku8QYaxTPIrghA+reuwbUPYWxPGJydlI9DgJp6h+EkaFzY4xgOC73qX?=
 =?us-ascii?Q?oC1fGDJc0RLX9emaE6CdIUP5M0voNpn14fDe2Tbfm2p5v/LgyswZmLIcbxJr?=
 =?us-ascii?Q?se86fjzxtmVGYMZ8utIEzeOQG+vgpgYYd/m00p7Oau/wwCqhtn9/pCfKwVgq?=
 =?us-ascii?Q?s1cAhFGhbR1wrrqgrqcaUQTob1aFt/10QC0uO20GXqwQT+fCgo3DbVFXdn2m?=
 =?us-ascii?Q?tgoXAyNjxC69y5gjJgAWM7H9W8Rrp0FX/yEixcAu91zSHKtbi2K7+HpggVJR?=
 =?us-ascii?Q?a99t/IYrmg9Ea1PJo6PWhCvu+SckAd4WGj57dqkXeSZanDsvC+wmlB8bONDj?=
 =?us-ascii?Q?qj7e7zcLrTkAIuR/3bYXrx2MYUEotjGR7VU+ytAB7cBc5PSV9QOY1F60Yb3v?=
 =?us-ascii?Q?a9uMa1rT035Gxs22c3AtUvUhJydm96DlUoFW3/Yrd2IhkP+QVF0rgoaEllBj?=
 =?us-ascii?Q?kuH2cGIRljc+qSdM6Ts5tNqBvs14QDMoFE1SvZYwhPqJycNh3NKOGu8YAHqW?=
 =?us-ascii?Q?DuclUy8Vndy/GbLnZRCFm+ByrYPi6zbmY9TXp6YM2PwYe0iFSwXtLkgazRAW?=
 =?us-ascii?Q?dvjukY2KVbTFTdnVgxRfnqua11A38Qy8hoQqTjgn6f0d4laTcTnQvD2UTT94?=
 =?us-ascii?Q?1z7EsbqAKX/8fCqbQiQifgzuVkyd14djgfS3ZX0b6h5aD4capBBio1suZad8?=
 =?us-ascii?Q?GKCey1kj2DDH+19FvrXdM0KDjxofaqkuolOWvzUKMlAS2dFmXxtqwMp+pK+9?=
 =?us-ascii?Q?wagYN/N8gLLqK303tjHOjyQO1Sl+IPeKKYIHKh7/A+cSA3LeK5Ty1gy/Bfdi?=
 =?us-ascii?Q?jaTx9bIpnI2mtb1OJylnWzgiDhuAmjznqWYVbvml2A4qiryvaENMZiZnrQQ4?=
 =?us-ascii?Q?TFGg0uAu98R+ElC29MgQXplOldttcWwREcV1XeP7M4zlJrEHPSNs6pY9MNC1?=
 =?us-ascii?Q?4XtYgi1CY1kOA7HHlxKYRH8Cm3HSM5d4RlL+9wNLGWMMdxAladi43KwueYn4?=
 =?us-ascii?Q?9No6+VEAbVVaE/5W64QruisVfilE2qvzJkjZ+gjit+lXnwg7pXopWiS1KW4D?=
 =?us-ascii?Q?MigkbR5YqAEaywLbe2CR4zPNUSrmcikACGcI3N0oK0n5GEldaenAq88TyzSz?=
 =?us-ascii?Q?crsGHNS1jmrLxlvyoaVkqGyQ4WDTLtFh1xxPZfxCigaYY1EIQrGC7bdt1w7P?=
 =?us-ascii?Q?hHQRtO4Fl7aTqTMNxGaJtfRWCf9PO+RrjIEA8i0j8c0pqeAjyWboMyaRnITI?=
 =?us-ascii?Q?B11qagomBfxoYkvtiHsjPeThByWpCw+rCfaAw/RBMA8Uox5SXMDk0PxudFRr?=
 =?us-ascii?Q?kib3JUFCWdn5G9CqiEWATxoQj84/ooxAMF6Mhk2J2hAXXZVRk3wwc1G7eZ0E?=
 =?us-ascii?Q?exYbE6vMA0JGCOfFs8fxDiupl24bZvIMZdzoEMchnDDU++2GW0X/h0JUfJ0Z?=
 =?us-ascii?Q?cKMBlNmsB2H0bAN5gpfauz8bg3khVSisJzJDvqoBQQcB1IxRN/G4pNueD8Xf?=
 =?us-ascii?Q?Og0dWfCnChjHCHxu3v/r5019ljbbPHNEEMOqzkBn7yKhPaADFn76bxGpaNR+?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9jJVfh/jYIeqh0KIthUyFB/8TFYFy6nAoHS5HUEHC1+ii8Ed8vAAN5aSNM8VEbGute0Wgfdn7WulSTOxLOIOcs4pVWRpD1unPHsw5R44PUEDtayM6HrKUQJ75NXE2uH/8rg+X/TVmr71r9jDn51uWkU5z8iu3wI8ueVw345NETOih/UokA0Ci/KUT3fEpeL4T+y+0rYHp89Y1LJX+c/eGf2TrQpG7lXp+z41rWtTaC3FBx792oiRJrD9wIUHALGgl/LF3MNvlILey0DFRGaDcox5gG3JpQ3SY3JfR7AOg7blvhsTHrf1T9fS5RHQMR1spZqRCO3d5h9vWfP/AFdFGMkJJiftTCzhOvsaseeopM+Vzj2t52+p2aRUYkikM6R9TllL64erUIZF1rrvXmtXPx62UrqVIi0Nvn38rfGPeOd+vW1R0TRshBQZclvGEdTk2ZNtio7aXjCdl2GTZgozhet99xtZfT2M2hJxOt+pcMR/sOZGfvlZA+eMUdxc4pRFgnero+Gks4mVJ4YAoSwSQ3U+tN5erWjiQwLP2pplphleQtU8HHEiWZmb0SMGye+M8WOQNWyyUQlUCl/x+h2I8rMuQ8kfKkKqpa8trm2lNRE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b31a8c5e-1e66-417f-d95a-08ddceaa1453
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 14:13:24.1018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUKwgNBxnzoqDZSH8xIKcXRv/Ij0GYnZmThXG5+G8yRB4a7Dc90SRd+BrD8vATN9IbxyLP1i4mQEAPdjvqIp+1osLEhWaGxr+F0fLTfS9sw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6252
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507290109
X-Proofpoint-ORIG-GUID: 3QZzloZKyB9Ra4Jnc9tgo7vQOSzTZ1K6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDExMCBTYWx0ZWRfXzLTPYiq6bloZ
 ShEZbusErMkQGt21EC7fqpNU8l/fd0pKfck0PHt9rPyeGCkNXIAvklQk4lsNm7nBTk9P/fr+VCq
 XL0w4p7tqnIcLtqhG9Vcn5ZibMCZKW+e5sky0du1/4qTXOAxcVLgYFmr3DfOv+KH8yN8xXJBrB0
 mmbbvUyNjstKJ3QH0WMLjotdEiTTiH5GKeNXfEbe/8yrESD0LwXbemzeGYjhgADbJ3UBwHHXZfJ
 mrfFKGFCIp1Yed63sJNBhm5xLRzB1B0UojbOQ8TmNtB/s/+n9XNlNk+SPHfMlfMBqsxXUo31XSf
 v/aWMwNDpY38BnAlj0FAjAbi3fgvciVKO1KtWQOatgMmEAS+saAHyx+G/fuRadJf6HH4hoJOOqm
 2QFJKDn5WPGfl98pivXdAOA/C69pOa+Y3b1lXOCHueRnP4GQW/jdVEdhqHeYWyVslQXuxuE1
X-Authority-Analysis: v=2.4 cv=FvIF/3rq c=1 sm=1 tr=0 ts=6888d708 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=faCgRXlEhQ_I5NWZvcUA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 3QZzloZKyB9Ra4Jnc9tgo7vQOSzTZ1K6

On Tue, Jul 22, 2025 at 02:38:55PM +0100, Nick Alcock via DTrace-devel wrote:
> On 28 Jun 2025, eugene loh said:
> 
> > From: Eugene Loh <eugene.loh@oracle.com>
> >
> > Our luck with this test has been quite good, but it sometimes fails
> > to show its last lines of output.  That is, we send a USR1 to the
> > trigger processes to set off the final output and we immediately
> > cat the output files.  If there is any delay in handling the signal,
> > the last output will be missing.
> >
> > Have the processes terminate themselves when their last output is
> > flushed; then wait for those processes.  Also, skip testing altogether if
> > there is only a single processor to run the two, hard-spinning processes.
> 
> Yeah, much better design.
> 
> > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> 
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

Unfortunately, without this patch the test PASSes for me.
With this patch it FAILs with a time out.

Not sure what is going on, but this needs investigation before the patch can
go in.
