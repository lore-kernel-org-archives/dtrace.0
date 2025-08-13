Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E17227A10F
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 15:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755100659; cv=fail; b=nH/Tv2tpCWPBbS7VDNX8YuRUg3Jtc2LCGm90h19nvbX8RPdN/ThUeKKw4XS+MhIcYr4vaehVzZ3u6sY+aO9hc1Fiq9+yj8YPkAoEifhNlYxa7HYyx9piXEb/9nWxC2FmLP/W+W2k4QJ99s309hTTHBvl1/1ZCAliiVHUkhdSuxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755100659; c=relaxed/simple;
	bh=yXIbqh5vWqHJeFE0t6k1OTF40FMA/3vGF8WL0aICuCE=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=ZhFO5cxda5ZocNlHpOsLN36/SjUGQoxp2jwJxqYBoXAKW/t3kimENxpobi7dp1lhitTr821JePP/1dDUup51Cl7Xlgf0JaHLkQoffqPHDZ2O4HufqfC40NzaiNptfietczWK1vwHnXnMn0VLRSGaJW/KzUrslVVVZvLEBZbIgso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MJBiGtuz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FKKrPye/; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MJBiGtuz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FKKrPye/"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DDNAAM022873
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 15:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=szM5PEMiz9IXKm5mw6MyHjK3YioYOxesm5ECxQbgEHo=; b=
	MJBiGtuzlbhBci3NIZ6JNctyiHA0GjUcSpT4AhqaJ6TQjsu9XtU9lMG/NMaqO80Y
	Z7rZ50Zi3gqHpsP+g7hI8n6h2zPcTJmHk/r5aBf30uhauhasoedTZ5h0Q18DoMj4
	eWjcLliJ5bXDzuH4P+g8NCTO3hhZPh3nE27qOn5SUkOaTPAxNcPgT4CoS82nd9iH
	J0THbtw5TqKLt29OdEhLJ35is1oQN9VUO8YfIEXhucknb7idDmeQIrXYJAxO1Mps
	ODU/wzcQb1dhflrwjebQpBPuux6ZDrR0s7gqPAFxH4TP8ER1dWNJ/kDXQgQfMz+u
	ulAGWAcCYna4tDyp+JOCIg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dvrfyuc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 15:57:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57DFiipO030057
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 15:57:34 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2079.outbound.protection.outlook.com [40.107.100.79])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsbkcw0-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 15:57:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=erpYFaemWjdB2qEgiRc7TQ9p9PXyfk6MhbSsEbJ8J1XyMTwegcGFU9aXfKK/Vu+hQkJTv1lKoGfwZYSOkz3tDdTPrCgtO+5bB/ZbF7qf067axzi1Tu4H9OOjybyA4CvVcHAUVJy0EtFYNFO3ub1SAxO1uMT1n4GHEQTtvP2jS+U0lKCLYRBczUl6HmGysnO20EQLRdU/qSaA22GTlhmbZ/3NlZaHMcc052HvlgG/nijz7O5gLukyl2drwpTm/wYMR2xoYlHykAl5VZtTbvNW0kokvvVgJfe1Zg/L9Uqx5ldOp0j6U98/PYez8fBtxB69GQFqCTp6AOzhp9zMe9j/2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szM5PEMiz9IXKm5mw6MyHjK3YioYOxesm5ECxQbgEHo=;
 b=BPMxP/hPPehi/cur17kokxBX0BtKkhemJpQeLbpHMEkPdhCal/CbZq2t/FoWDTiZOfZ/8+ygb/a/peTN6X4L8fQj+sJ8remmyWwmH+ji+Su9sm2KVgcnBhGc1xq8aHe2tCyaQRvpgzQBalRP81BtCumcaeOkPrub1tGyAyKEhM3fj4iJX1auPsbn5UcrYf7UFrsmfdtPSCwN7ChSaqgaPvDuL0Cjl6NvBmsMvBu2IN555PDn4Iy63GPGpbq+YIvbGl8tuGbtiHmyVoQGPpyYpUnt/CCFPl2Fmdjfi/07o/R8nlWbw+NaLsw2jtyIh2vryC6jPcDnAQSYZb2/VxLBGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szM5PEMiz9IXKm5mw6MyHjK3YioYOxesm5ECxQbgEHo=;
 b=FKKrPye/AmqyYXSZplitIR4wqiqZZPOXaOznxIocfMFac1N1OwWfh+LNnDjeUnHTuPRaXCIjYzj16makWmik/FQxEUfGWWThf2UAj5BMLoChioQNMgpieRjxop5PgAPKEzplPGWEFgirWR4QOfpPvvIBRzcEvk7wItbzZT4lDyI=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS0PR10MB6222.namprd10.prod.outlook.com (2603:10b6:8:c0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Wed, 13 Aug
 2025 15:57:31 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Wed, 13 Aug 2025
 15:57:31 +0000
Date: Wed, 13 Aug 2025 11:57:29 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/5] test: fix expected output for tst.struct-1-byte.d
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:208:36e::20) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB56725E4CF606CC1484550FC4C22AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS0PR10MB6222:EE_
X-MS-Office365-Filtering-Correlation-Id: c7fe8b2f-5bdb-42a3-939e-08ddda821c87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ue4PdSBNMtJrwjMQ6yIUwNyzTTRc7N+Y+zgPeldS8ooj9RWApl7FxaWx+vvH?=
 =?us-ascii?Q?WhRyIje2hN1dS+k0lBPaEBGMTIW3FyJa/vRlbsZecUxX1bL+i7y5xz03O/3Q?=
 =?us-ascii?Q?kS3TO1BwnhzAzRs7pH5t+NdmT3Y1NdZdBZuxscrAR9qeWjl75gr2fzJSj910?=
 =?us-ascii?Q?YQd2sC9X29R3Agf7Gs5tRXnDejzG7BzK8mKlh13NS+hmJAuVzdU3IHFEqjtH?=
 =?us-ascii?Q?1NuWefwuZdLtPGh/lEnfK+SPD7NqIm35YEFZDui0vFt7xrppvZILORAf39o1?=
 =?us-ascii?Q?q2e+mY+zX0j5YBPtWnzxjWJZ8XNnVbtZP8FQd5X+j5LBJcJHxJJtvp2eYP6u?=
 =?us-ascii?Q?SfEfIqdLaPJYKiFgBDSLUXXKH4pDS4iylN/7BoPUYua9hoxULasw/g/Qh2WM?=
 =?us-ascii?Q?Xm0kMwnY5ugq7R0GfhFVOuKw61OVeq2S5CrwwVZy4qjEdf2VEThHZ0zgwi2D?=
 =?us-ascii?Q?dcyICw5T+6hJZnc9XfbkHPpe9kdR6JoQ/e4ob54gsrr5BalmvPDABbVoalKi?=
 =?us-ascii?Q?/ItgOIXx6OZhPtEnQqR4APIdzTNc+mGtZCAt8WnWDvRSnUXHCyvfcq8PbqDz?=
 =?us-ascii?Q?VlT6BbRV7h11Yem2/mnSEXI8D3AKG0kUIENSzGFWjiSQCBNwkOrG9aD959+L?=
 =?us-ascii?Q?a9WOFLSBizour3bVvTID+XWZ5c/mIVEtt9ZL0wU0AJfyvwJgl1JkRpW+Vc21?=
 =?us-ascii?Q?64IFuxRyY5//NEeWBRnCrPJ6OvZNM3hrFQmWEQPB+tujjLp+ewbbuq2TYtBR?=
 =?us-ascii?Q?33BsCx7TE8bo6gNKtsk3HWfnnd/jdRvbEPcRn/PzLzL5am8INJmIxeXN7CQ9?=
 =?us-ascii?Q?MMQQIuvELnOvGmSb4p8A1YwjRcQiMQ3iO+Uez9eJFSpZmdIpaZRgEaszmrIZ?=
 =?us-ascii?Q?PtEKLvLEsdErlteQpo5KIXGjXhnfJv1vcL7aa9D/9AwNpdFZmcOXCrZBwEz5?=
 =?us-ascii?Q?SAdoXrQqMEXxPszU0a8cG0ocfD2LLQhrQqkZgoAViht1oBee6BoPqWhOsEa/?=
 =?us-ascii?Q?5kyfJV6oi2ljpKTSWLOxLv90KKmJ5I1srkLgit78LpK2GrD3sl9Ffaxz1KKg?=
 =?us-ascii?Q?zqcE0xyij/lPkYSVrTtCRfVok+BjG6Jc9e4HUXuCN3n/DGeGEyGt2rT4uhPv?=
 =?us-ascii?Q?UV3RdzL5isCEN+1pD29DqgGvzroKioqPfgMP8zY3FR8+FO+5X4batZXc6x94?=
 =?us-ascii?Q?xO5tSOWCgJzus2LnUuMiltowg3QszqZD7k+yL6qKgyjEfhsnko9HWCHsRzXi?=
 =?us-ascii?Q?KP5ATM5GzW9faYisTeb0ga30C3HwYH8OirHSBZY0OS/JIlNinEoQme04pDp3?=
 =?us-ascii?Q?Dzk/5JGwT6J7EeZVU2tdKtt7s5dSA8+R+eQsvpsVE/aAp1oeJ2hU0oLlbRvJ?=
 =?us-ascii?Q?xIj9PPOgeGoTziFWFhmK8YfNbtMPwcqxYOy5MeD0OWK7SBi2KIAiHGr1fFY9?=
 =?us-ascii?Q?4ApEGbjNRu8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ym02i2vMxDmKqj/753RGdixySLsRYK4GVWxK08wUrOP7v71hJP9U0TVyOfA3?=
 =?us-ascii?Q?a5v3tl+mLfO5Fmaj5vjSgDDo8VE80A8KrSZfG6eueOYtdwAcq4oBQ91rxcQP?=
 =?us-ascii?Q?JqIkPnYH5Wr208NZoiDUrUEf2NAodpk8vzQfC39PIPbNUP39cFe3yXc+kst3?=
 =?us-ascii?Q?Z0KVYMvJL4c9+FJu6m4j0veQZkslr2H7HoD0bflNgNzlIPZSDjjHXEdarqgR?=
 =?us-ascii?Q?sdIUnSGI33+DbJIspvKugOsYuS+VLU3lS5BLOVASXOgfVczmjfBkPfAQti/K?=
 =?us-ascii?Q?rD3TsI8C5Q7djj4plCzPr/286k54+ttfMbQZ9P6AoRYMUjRlq7ho7osHO23V?=
 =?us-ascii?Q?TgNs94gH/DDbWVmBAjOeRBMYM/1k5cefMQ/db9VZ7KDErFLxJ6YoCts0UhqY?=
 =?us-ascii?Q?l6jOMDFyqY4FLEplONY3NBLUIiYrKE9y7kPxQX0/6o7mJOgFTiqu49Kt4h63?=
 =?us-ascii?Q?kJ9195YWZSSLTN/HCUkQ/adT3lXao7CWJNDS1wXfPAhToWj56BmF87IiGLhb?=
 =?us-ascii?Q?uBLBF+XF/8kY2Lpi11J2KBBOBhTEStKi0jSJ4uk2QZ2PkDJRHMAxRBw2uPi5?=
 =?us-ascii?Q?LmWLyG4xwPNcXe5n2a+dwSydur1ROOb/mpOg8eHg+bXpJhHbxHkelQbcFLoI?=
 =?us-ascii?Q?uuuM0RdEigTAOjQ+Bl6Lq+vRNIftWD5ke5IHyLzFJzSld/fc4TjY36xRlUcZ?=
 =?us-ascii?Q?e76nlgvudKztrkoOPOg+NzJ2/Pez9KhngywLmM8RKMz7FAdXRFmuy41GxFg2?=
 =?us-ascii?Q?MUy+bi5fWaF4dsh6nwb0g9KgXTjpWmcXtJM2VOA3F9eq0nVcDcfXYmKZXjAl?=
 =?us-ascii?Q?hkOwqUnICmOSiansBruN7PJUR5BWhny/btvrZBG3wXv1Hn1O0D8vm2mr/bkL?=
 =?us-ascii?Q?H/o3qSjdV8uYzk2gWdmkPlGzZVK/ZVVOF1bEtfzG6yYLx+eQW1j7+oN+gxe6?=
 =?us-ascii?Q?5zl7ScNf8ZGIwHUIANvfScAvNEI18+zFVhHDtDFKHdlGug8b9y5gsqEgL9B0?=
 =?us-ascii?Q?2/GvSeIDyuorr8pd4Wj+9X4tI8q4jfrWYBkAQhVVDD5YLWHUcfSe7ugKX2Lx?=
 =?us-ascii?Q?Knz4Ncc9wkTxA9mxxtrPejL9k4fdz5q88+f5ZJj4ixNKpRu3ZET9OMTPY+gz?=
 =?us-ascii?Q?FWf2Spc6WjBcbPyLX8ZdhCG68dIvf3TjKsy5utGLXGSktAQQ8YOvYNcoHK9K?=
 =?us-ascii?Q?kdU3mZy/v6FVsY6eCfVjFaMIhvn8jqPoJE2iExalWvMbf7VSSiYzlDzkiyiT?=
 =?us-ascii?Q?pX68KkEIpyiHBkwTOX/Yvqwt++5lWjLSC7CIKM3U+2PafulQ3cbasinVzvcR?=
 =?us-ascii?Q?OwhNRfDkKvWgLnqwsT5LRqu8VtlCuPMqSsYoXRPhIG1S3b948z1HRA4uzqEi?=
 =?us-ascii?Q?JsoVDavGKUAXI3SIdct/aHF71+AVrqxEtVmtZJd3zZcAzLBxofIsKn1fHyE9?=
 =?us-ascii?Q?G/h1vBlYahoEuVDSoegcEYDvWSQyJRjkOScwRduX+8vTFvR9EfDNuQKH7MNf?=
 =?us-ascii?Q?IeHCI2nvT1QYyS/KX/jZHDWYgw3VWPjYfXtl119FcDkfBXBL4bYCe6s6FzPi?=
 =?us-ascii?Q?XL/jV9NH5v7dQVPwl28Egzt5Oxnh7RX041u9bWzNAjVSTvsLuUaOCUerjMzu?=
 =?us-ascii?Q?xQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XMa/ohkrV/Gq6LKaVqsXm39GSRxYahbgYfUCRqfObxUN+Q9Sx9hataG3R+NwilSnGnxDg7NRFng/Bpo0zTTe4p2tIB89s4kq1nFOgZvGy7O/Xc6Q+vqs/6r6VRr8DBI0BBNu98e/uylURjK75TTohax1mNwditGqKWgXneXK1qfXu6LfiJ+J8BDZSCT3YhZOm5f/px1lMn5pR1U2d0lR1jOEyRtHgTbvIMp9ps0qWi7vbFhuakSTDbPlE6FdgR+lc119UDIbRWGLVTHt+qMlttd2E0hAHTV1puaRUpb3TE18cr4qJ04C31vptLcAXa4npfD4s8ZByrcc54Q7SvrhH8dIttXNquXBTib7G9CiDIBfVm8J1XHq/8NzgfSxpo1KSzjr/ikuG9CvFo0DCBZq/Nu2m7Pl/xVP1b3IF4/tc1Zzi7dRNwmGjR20bPMGeYkNW8ko+Rx9R/uVhNhuG++0n2G1Ncqh6LN1/PHXD/pz9Atw3Ojnv6oJ//Nha/XK3RDe8Ak1h+5NT/Bi4CukBTT7RO5tI9bFSLkQBgAPcDlnkEHpNMvubqkUD9WXwWkg4kfWrPS+3oK00O+c0Z7DsDGK531weV2T4g1o7Y2RkZARZj4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7fe8b2f-5bdb-42a3-939e-08ddda821c87
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 15:57:31.6833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oGYam5tMpPccvHEcDLlmy0JyZ19qFBXKOjrN40rIJjEFmSQlwNk72BiUIsNgAfq9r2iUSulYwLGcCRm2MeeKKhcRvgNbb6//ScR1/vRa1mY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6222
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508130149
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=689cb5ef cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=0YUWAOXGOinVyyYO6mQA:9
X-Proofpoint-ORIG-GUID: lh11Wuub6hZYvLgnhcQUVOzcrtyBXf7a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDE0OSBTYWx0ZWRfX15Z8uT9dxi2y
 mv6fywT93bzFXsEe5q2nDroVrTBolpDYdbPuP8ZeJTPbRVSrwGx7D+59aUJUN+OU6bqvDmUSEp1
 fd4ANSxpw1wBJk1XLfFhX6PWy235JRR5aLJ0Y0ri4CuoVbDUPyWppBQHaAzqeaSexWQMaI9tILz
 M975HMnDWpMOAdKLlWyObMu4edhcHeVgt8fKOX/j/CQLEMIrK5Mre/JsJO5LCPKl3oQnU3Hv4BX
 Mlr8ddg5T90qH76VogpnlOZ7fFfrQ5uaxPbMeL5iLNpl+0Qqaar5cLhcr9yDHeArwgqd1Ezjj4v
 ZAlI0xuu3Cdny5PurcaNyBOSAyjvyBTWJ1LZR05a9/lIDkOZASrWp7eZdFkWQM9H9KoOU3oL17w
 B1S0WzQXF9QrtNWA2nfOiNZ+rz/nvvgJyejYsyX1s3C0G4JhzOKysmW0Q7Ee8AMvK89RL9+t
X-Proofpoint-GUID: lh11Wuub6hZYvLgnhcQUVOzcrtyBXf7a

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/actions/trace/tst.struct-1-byte.r | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/test/unittest/actions/trace/tst.struct-1-byte.r b/test/unittest/actions/trace/tst.struct-1-byte.r
index d620aafb3..e6b00074e 100644
--- a/test/unittest/actions/trace/tst.struct-1-byte.r
+++ b/test/unittest/actions/trace/tst.struct-1-byte.r
@@ -1,8 +1,5 @@
                    FUNCTION:NAME
-                          :BEGIN 
-             0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f  0123456789abcdef
-         0: 34                                               4
-
+                          :BEGIN   4                                
 
 -- @@stderr --
 dtrace: script 'test/unittest/actions/trace/tst.struct-1-byte.d' matched 1 probe
-- 
2.45.2

