Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32B11E7C12
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730290391; cv=fail; b=Y5HqASUMAMbbnR7LzBzDHHX5zuxUzPfBFvJKmppieZjz54+a4szpsOI6oIoYUJqC7B5PL2rwGsG4YWBsniXAPAl1nCNPDAt0D2o2GtJHlDnTQxqW8QwxGpWYI+hWelqHYa0fNDtX0/J62VoQR+8Aiu2NQvAxZyOdbBKcUTRBfRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730290391; c=relaxed/simple;
	bh=Abdd7f1lsy0UadykT0pYx1QAGZW+4mkJdgwWfwv761w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BFOqdDcru/xK7QvjKqErM2JFp8/tNsaFg6nwWJIF+pHvJ5nG2bWOEu5AfCzusPQMEfevnkh+JO+RQaV6MJDCYzjPptCB9oYOHsAvUGLR2VlH0A1WqUCUctb6VLofK7HTGHGBx1W8cwLMZpBxtFK7oeKfsRRIA2+76GBFjkPqBJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Rq1fzPLe; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=G/L65CJ+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Rq1fzPLe";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="G/L65CJ+"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U1fg2u018736
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=AjFCqDDfpbYDtSBH0PqsU/mUNVvYI3/bPp4WVPsxOU4=; b=
	Rq1fzPLe7JoCCm0QCe//Zr8JjOD1rjdyeBl53/c7shwYzNrso8dDZCPHMd/VF/Uf
	i3Hne+NjmZapmZrnE5bbzaBFJWhMCdFQJLhalnQbDtSQ5Nv8MgqopcEn+novQ9y7
	ytsmuCWH18qHE1h8NSaZ0aOFGaZECE+GZK+9vlE2eGhLPFgxrtXhzvvhJLoeT+Iz
	akPV+1fVZk4sF05ujMuog3YErFTiKXuEvZgmRSCAs80W1plEZ6m9ymDed70PQ9QE
	LjrmcLgfpuOzvbXEjuu8ke8b6wBgRRpYpxHRv9p/8PVNgiswIDQUDvuZvsAvrasi
	yWHTEZxMcudLWaFAMkQwCA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grc1ys2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49UB74hq008693
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:08 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2043.outbound.protection.outlook.com [104.47.55.43])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hneb0mw4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GqLdnzQ4pAtYg9uIIQN+M8vN9wRF69xjxIfXB7ODTlUDc/EItzgI0izyhvw8gOAx8qCnirqvARMzh4zc/s3Icl+vq5gI9uhlv10D5BzD0tPOA6vX0FqHP2wKzwLcn1gmTO0agacS6rvuZjr//jzCFsUkhFv9fRJllLI/a5iifmctyVmMoQrAUVnMkkBbnYlzKsWcxjui4ZdJFLIQDnlFBhpiqDlMzkShyMC60kKQ2f3or2Mfzs0166jc1zch5jOonU7Be1at6Uiu8XKHOZurMb0+Q2JMrhXyEFPaeXuJ43SBUZCl3vfNImYrPRPx1vIzOYOjpuDx5OiTqjGPc2pOkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjFCqDDfpbYDtSBH0PqsU/mUNVvYI3/bPp4WVPsxOU4=;
 b=EnVIRreC8aawOJgioIC1AjiqOIXz4nvkRkASzqQWxdfHMuNSbv92YXMsP3Sjny8RcbQBelHwN8sAWgMa1iSv0o+e46beBHmuIRRKof+XYQwxFog6Y/BOx2q7Yk71rCXCNnaFOUQcTFJaRwke+QY7SFhUQITWsOUFdj6pX0bNZTqU+m54OHj5OdxsQw4TuFww6T35bLqZEhhNrVzIfgLBF8wYNOPsHrBsoTu0p1JbIrKU2wfRYLdQaRvLr9PMw5NOJD1zhmgrQQswvUCDX/cMVOhEvo30mYMUEQ42x7LvYIzUIuaS9fVYNa7AY4ZzXDsPnNcycMhKCQp1a13UpCSp4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjFCqDDfpbYDtSBH0PqsU/mUNVvYI3/bPp4WVPsxOU4=;
 b=G/L65CJ+5vVAgaZ1wxVjiuKPLLsUQfCV73x61DU0qeQwv0bjDSZt/tcbL7x3ko/z7z/yVrqZ1hJqiYca5B6PUtCfyS36oN+Lgg4vwto55rcyjHJyRqAElfUwAbPP4MuC41F75qaNTcOFtMDPIYd1gI6KXdpWTREK4CB/DbHRrEI=
Received: from DM6PR10MB4091.namprd10.prod.outlook.com (2603:10b6:5:155::28)
 by SJ2PR10MB7111.namprd10.prod.outlook.com (2603:10b6:a03:4c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Wed, 30 Oct
 2024 12:13:05 +0000
Received: from DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02]) by DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02%7]) with mapi id 15.20.8069.027; Wed, 30 Oct 2024
 12:13:05 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH REVIEWED v3 11/14] dtprobed: fix parser child timeout
Date: Wed, 30 Oct 2024 12:12:33 +0000
Message-ID: <20241030121236.257803-12-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241030121236.257803-1-nick.alcock@oracle.com>
References: <20241030121236.257803-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0356.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::32) To DM6PR10MB4091.namprd10.prod.outlook.com
 (2603:10b6:5:155::28)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4091:EE_|SJ2PR10MB7111:EE_
X-MS-Office365-Filtering-Correlation-Id: 9277dc89-f9ce-4e21-28b3-08dcf8dc3553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NfUCfqA8uDz0vMoDJ6wXgLXLwCXrGIDXzUPKs+gvcDSNytbvYOl2dof0nl7o?=
 =?us-ascii?Q?LPusgrfQAKCynFQxNfe3/5jjwirP3x0XfKfwJ2Ia1onDi9wuVgS8u9+vLzhw?=
 =?us-ascii?Q?Rkmg10LNGtZy/e+omM8ikzp8K7KudLCOz4E/w3lAfvip9Ed8JkH/2ReHqTRm?=
 =?us-ascii?Q?SHPoBxZ4oQE7sYSlcYfJesdegLifVlT56QP5JwRTzwtwhdoR9utS3UuyVHod?=
 =?us-ascii?Q?ZfXhDxCcLn8KA9ROGK6mPBiTd7nHWFvfIMuuqcapvZaYpMyI9evgFwM+G2Es?=
 =?us-ascii?Q?LdEfotXxVrP0AjZjJHd0eKXk904YOLYpEmIbwNFLREeNBUmODXsXu69WuRSW?=
 =?us-ascii?Q?IbAp6PClNfaYDDxBt3r4cuG1DgeBhtORPbRhPH05KhFLEvW3hk8cbVbEdlHK?=
 =?us-ascii?Q?nre0hpFumCvnLe7BzZY058p6lCC2qBTaY9towymAcCG4dZE1h08bi/N4ouW7?=
 =?us-ascii?Q?LK6sbpf8TOxjjCbkNtDq1qNopBwMdulLwXpq0YfSmo8By9+TMjfAOaTpSF3w?=
 =?us-ascii?Q?McqcUVH+BoSJ+qnbMp2DO9Q5LL/WQavv9NCGFJD4aecnJFRnDnQz5Bbsa5dE?=
 =?us-ascii?Q?gp6EltVf5Fw816oUnfUkxPrq7QaJMIIomgt98zAN9RYgYWN3Yu4/INF7+bOd?=
 =?us-ascii?Q?lp1WvA2ix2fjvmJuQTHhstXajnwWTyhUk5S7AvgeOW2w9NtAS0igma4bml0P?=
 =?us-ascii?Q?wMIDqNw8Ro0i3rKqx8OgytiWEZAF7ymIpik95KUjZNMa9NwZ7ZKLl7AhcqH6?=
 =?us-ascii?Q?S84mlM7uFhIp5EhYeAe+y3i5QIsPQwIbEqf8waG5jbyoUcO6auzBr+2wUeHX?=
 =?us-ascii?Q?LBAQEAEYz0HE1TcaagI5pxiDeqRlOCQVlbtCGaLH/AAG+XyWJ8NSRy9c9rDT?=
 =?us-ascii?Q?q35Qls1wIHB2kczZole7iEWc94rFiet1ALlE0FIagR5lGhtz/4gUFnLTULnE?=
 =?us-ascii?Q?hok9rDMYCZMYwdxmmv0Ir5ydgiu0r7fK/xHD4ZcrhYFo7foqFOmOfgg7J9la?=
 =?us-ascii?Q?LCwcIk5AgykHu1U76GG0YE+rXBjW0UIC+eN2tpyxzy9EV4eXxXQfAsqtuUD3?=
 =?us-ascii?Q?gz17QePCREvCW6XAqiFQb1Oq4sFDxOUY5LRhUC5NNff53lFMM9qfpzZ+F+Dr?=
 =?us-ascii?Q?RUJagy8wcCEF2EJ/GPiUgd4BLqtmLOHpSgsMLP34SZof41lbp6ZT/NvwajGT?=
 =?us-ascii?Q?kqTqWH60U9b1ikEeq0ejbLMpwmFDSX4fCpu+CjLMj5pQ1e024wX5yOW8wg+g?=
 =?us-ascii?Q?PdWvVXKhhB8UIhpXF6smCy+DT+YCM9A9CWsciT/j+GfBZ2q8mEbLrSMVkEpz?=
 =?us-ascii?Q?AHs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4091.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZIvPfRE+54RYLv4kDWFYVtKtJi4t1y1+tVqqL36VSCe3J4ovUvvNY/46NRtS?=
 =?us-ascii?Q?Anr7TS+oF8/CZ+Hp7F/Di0c4cINEeBrmlSbMTX2FycCB8CzUCzYzFDgg+hoz?=
 =?us-ascii?Q?JyOygN7psbQfKDRAsAwKGf2ehy8DZiWaTWJS9ijAf+MDZJZ1N7JE4g4V7iDX?=
 =?us-ascii?Q?5TVD3arFhXmAwcVwPhXzJfPeK3oCvu54o2iBBQ5evWIfB2w7lNqCCLc+WyUu?=
 =?us-ascii?Q?6T3AoYI1Xlew6Z9jJ+EB6+TuvjnYkeuzAY+K3V1GPJFu3UXZKRsYbw4kDMgt?=
 =?us-ascii?Q?4cMlvzWfgwEN74jGM0y+CJ4CDyBJmAxNAWSNBWMEUInjSE0NsQftQuDsam7n?=
 =?us-ascii?Q?8lgsbyd5NhQGcugN6fkiGVnb6rCNoDdm2I+Xkg3w6kp3B3LJkwArEAjU6/gN?=
 =?us-ascii?Q?N2czAkqUidtiRV72gm2viGAm5ndqJ8T3MTLJ/eYRhe70HGVDRENkzvsuOFXQ?=
 =?us-ascii?Q?s1Em92Ja85bGs/uW8IX3XRxf28iSV56QWRxf1h4toizhU+X3A2Zzi+LYWgcs?=
 =?us-ascii?Q?9h8uqPTAAVy2GiiHB9ro8U1IRly1g8iQs7VIwwJ4cES4+ArGzu59djvJiDT/?=
 =?us-ascii?Q?L0fwuYuBCVSVufVLZ3PeZd4vMPccbt/kUJf6U8SvvkG0KQ3NDn1k8RssT5eN?=
 =?us-ascii?Q?Odo7V1U6+FH2glVoLWj72FKXyD0XXKFR1jQkchFCKQm3wGqxiy4ki+nsxv8z?=
 =?us-ascii?Q?iPpWsi5fganfbCnisCuvniBe1Udv3d1+d9JXLefE7PumoK1sXFnvEcCJsKdn?=
 =?us-ascii?Q?9QYhDrzUY7LJgE1cJgPe4ckF6P1qnObWRjrLQcK4tmmAOnnY/Zo9vxxjwg+v?=
 =?us-ascii?Q?JOptfsbDUCtwGAyZj2uv2xS50fHtsRIGkOohcFB6Lt5L/gMY+0FIdFXz65Ve?=
 =?us-ascii?Q?DINOCn/0hcRdxp5gJARfLZBWHUI7TeRHkhSO/BxQjNHt2rxj9EqOEEcDjfWS?=
 =?us-ascii?Q?MT+I/hhHhiTNm6mGoEsYLHAcn538hHhsNye5x/CtN0t3HRMmTYCsFfW+CME+?=
 =?us-ascii?Q?ifgXo3HB/pkmCi0uNpPK8HE/m2KRLRYTTZmb4i8iIYVErvL9wjIwEFEXJre1?=
 =?us-ascii?Q?+ukOFXWCbW6vz96zOXM1ukDyTdJFW+XgSgWbfBWno1etXmxxRqIOGSay88KZ?=
 =?us-ascii?Q?BQnciviFE8pJEjM0TjaCQt3YYfBBCgFUNLr+1VtnewXQ7J2U8TIhlpnKD0A1?=
 =?us-ascii?Q?Tv3Y0sP3r1x9FkEZzDIiNulpMihuwE/GlHt3I0Fj/RnMjKr2SUXvR/8vSdBF?=
 =?us-ascii?Q?VmQ2eAUAgVoEpO8Q1ut/1df7V12PLQMicing+rtZDdY32xpVMEPUvjTYIwqn?=
 =?us-ascii?Q?VE9D+0bhfgi842/6I1+VLyyTmB7GAJMFqqifFM+hGnEJapWmNL/nN0nER+oD?=
 =?us-ascii?Q?1IBoV589Mq0m62To9ulFQudCbquo3xvop1t0/edi7X92vlbFLqxR4QVwJD0a?=
 =?us-ascii?Q?br1obvLIfWz4TSLofA3ol/mWjddl2UF9A4dxIzvjUAFIoFsSbELpv9VOB0Tp?=
 =?us-ascii?Q?Y5JP1Q5P+ObbWO8I6XSbga29FMA0TTBwTDwQ9Ao76fehgzQRzRHEc+rDzcWf?=
 =?us-ascii?Q?65uCS71NAmDlyLPA1sUJbS5n18K6qjp7efILiB5bUS9YHWtv8Poq68DOcIuw?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9XgHQT/pNpduLmldNuhoA7iHekeb0smEt6gMuQWhK/ycFdgsJaEX7Od7S2PFO5IcuwwyFXT/pHHNVlKpcBVZvYkrLhpJg537KoQE8SJ4YWLfwvMIP2NuNT54GDeT1RCnRSZvG+MEumE4pNBjK/9S6QERTYe7zu8u/T8DCu6TlvgnYFxzkrB54ilMGhan2QKLtkRRYKRRM7oEtwjkhDXW2WOsJ1FzgQVHzI45p/XBOKkwNq/NTybkgZGf+1MKiYbXEkmbc0/yshnr7I7jYfdEm7QTBRyfFKKTTo9pp69Ioe933MtGwOBYCZvBdWYJM9Gk9l2cSjWU8jAYVLdkBr2exJywMCqFieUMgYmJD0e0+mMcrruT6hfLou9FNj08ARSZf99QgiYweeymLgrbuVKbghmtgS3Y4Kr38L4iC9or6SdRU3hfBw8BWEC1AhjAcrc6UiwqVE1NhPtTChWRyjvRrTkCi6zZVtUs9Awnxo4Q17jqi+i1wIRP5nWFw/fFY6knFSll0wHEYvo0XRN4uCnUwcNPYbz0vTRIfqIhaDOEXtZFF6Isnio1wjpTiRusjHLOI47yJbqzRVBRAC9ez4Yx9SW+G9nfUOT508j9PL/w8VM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9277dc89-f9ce-4e21-28b3-08dcf8dc3553
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4091.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 12:13:05.2070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WEyOlzgCVH3E3k+TXF9boQEdEV7G7d2Iz+0SDYCUqM5siidzX6QfnRO+mhC7x/oC8LDaEaCuMTElqTRW47WzoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7111
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_10,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410300095
X-Proofpoint-GUID: Pqw0K418rgvDq4UE8A9F2ZLxkBPhRssR
X-Proofpoint-ORIG-GUID: Pqw0K418rgvDq4UE8A9F2ZLxkBPhRssR

This was always meant to be five seconds, but when the option was
rejigged to take seconds rather than milliseconds, the default was
not changed, leading to a ridiculously huge multi-hour default
timeout.  We definitely don't want the parser child hanging for
nearly two hours: go back to seconds again.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtprobed/dtprobed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index c83f0adb56c4..f4c6be1e045d 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -82,7 +82,7 @@ static pid_t parser_pid;
 static int parser_in_pipe;
 static int parser_out_pipe;
 static int sync_fd = -1;
-static int timeout = 5000; 			/* In seconds.  */
+static int timeout = 5; 			/* In seconds.  */
 static int rq_count = 0;
 static int cleanup_interval = 128;		/* In requests.  */
 
-- 
2.46.0.278.g36e3a12567

