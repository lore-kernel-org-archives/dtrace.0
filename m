Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0F31A0BF3
	for <dtrace@lists.linux.dev>; Sat, 11 Oct 2025 03:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760153750; cv=fail; b=IHqyTATrnHC9yfVDeQ2L6EVt7PyZJlo3bfP1MN33CLm800ernrid/f9W83vR37o0LAV4hftQgkEIru0BIs3NzJnF9RPawoRfJMco1t6mpotY+/kUm+SjMLqXmJBCxy7/YDvEp0Jq6C4s5ibvwHm3cRVSReNe3FDYvmsUIE8XBEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760153750; c=relaxed/simple;
	bh=uB6i15TsczQaIeZGX9zkOjHyMZAAj2XK2KDx+ZP4d5A=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=sVM7XqUCjcm+9utA3SX/F6wdWtspqeVL7eMXCvrYY87o0klFwLOC2b4X0OCeMd0pWyHp6bdhA/jWyPwYluEu2WTtBnhjP3EZbBtPod8abEg0P9qGpq5Yyk1TakkteJL1HX9gFd0K/wMojh/pEcobaWhehTaHbD1hgLSDCYtGbns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OXMGGgRE; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fS1+RR8G; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OXMGGgRE";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fS1+RR8G"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59B2uSSY018414
	for <dtrace@lists.linux.dev>; Sat, 11 Oct 2025 03:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=rHZJuN58vX2tFc1KKgqKi9H3T+p0Xnd5dBc1vJesx0c=; b=
	OXMGGgRE/N/awuFuyhsGi/UXCNyQLhoVe1JKurUYLQSX6DI7pBI2MAysS5dgYyJ0
	mq4lTBZQYZWmODBcMlOFnwdfK2X6P44nV8KD/LuF++rpPeeop+e8Sso30WTkFhx6
	wyn8XBnVI0P0KnbN64CGrAzpEliS3BpYcSgHw4Qs6nfebAj13Vr262+8n17vNC8x
	5r1HqqhXLPtCn/2TTmCCrqeh0JDN66b1gPOQ9O2TRhmn4GAQR5QNdK3Fg9mcDGm4
	2p0vctxVs+nXMtLtGhqpu2M8AO1l4kOTA7xmksez+7ZrjZ6m+4tPPGVerNOiiFkW
	cYMUd+WUx7geRAXTF3rkIg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qe1201d1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 11 Oct 2025 03:35:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59B1Y1mr037912
	for <dtrace@lists.linux.dev>; Sat, 11 Oct 2025 03:35:41 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012053.outbound.protection.outlook.com [52.101.48.53])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49qdpbsxw6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 11 Oct 2025 03:35:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQptJLfqHIS/QLHU3qII7oSndfbkIAJ2GuywVJzZr/0pY6hJd2RdhHRQRwMipBwnE/1Qo36KgzIsVf8pVKz1Kz38vP4yXQm7ZX+K+irEGHp/IayeXQsE0CtckgZk1h46DZcOOb3QszKGEtmIo8jrA3gFhuw8rO6+9dM1NsF6Aate1KXMSUiNHfNnhjFPVNPtgKBX1RMS2aBPyFrzSN7RP0RCah7bFJZtlivcAp22L3TSOMAEH02E8HHZ2ERWwt/BcF7J/+oshZoj+NcyaEIAiPop9X1GKcGTZ09kYf63iSNCbeDWCjJg4IewAX6S3DRvB2sQ0zBc90M1be7SjJodMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rHZJuN58vX2tFc1KKgqKi9H3T+p0Xnd5dBc1vJesx0c=;
 b=AwTL+NYwYXrKSVi8AQ0EnoMBv6B0Vhs+l490YJdJtc3cchYbuH4USENaDOeOyrv+6xMYFOMWwdUYix7/O/9lTvfzLMTzkHAmDtg9dR+3BwvQy7uE244wcmKaVmn0rEckz5QSsf9E8DNLl5DNqp34cyuTN3MrctdadF3U4i8N5tJGkg88D/PjW2qCmYY21oiSF1nriDnu/6ROHMen2mxVI2deeI8ev9VzN/M+BL3r36qbSHpmqiso7P6y8neogk7/s3pcz3c3UB2ZYKRR7VNKguJSZ3X4DRube6xT9+Yunst8ulPDwNjnL1DkR0BzEyCRWZY6fn3uf7bv3QxQ1s22Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHZJuN58vX2tFc1KKgqKi9H3T+p0Xnd5dBc1vJesx0c=;
 b=fS1+RR8GhbHqfM8cKd3JuAkiVz7PAlRA6dCdpm2UEvn3Mn1YZfvwd9XfWKGvxTTr58kL4QuLH07IrhF87YfrceZl1lbtCNodjXWJFMgBWtaYmsueVoRynq1Nio5JBKsokQBLN437EX+sU/B7a0tnPQWrMhy6sw/4hvmRhi4mjCM=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SJ2PR10MB6961.namprd10.prod.outlook.com (2603:10b6:a03:4d1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Sat, 11 Oct
 2025 03:35:33 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9203.007; Sat, 11 Oct 2025
 03:35:32 +0000
Date: Fri, 10 Oct 2025 23:35:30 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] usdt; perform __ to - conversion for usdt and prov notes
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:208:36e::17) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672738898FBCFFE5C13ADEAC2ECA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SJ2PR10MB6961:EE_
X-MS-Office365-Filtering-Correlation-Id: 422e974c-5455-41a5-bd90-08de08773b45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MR87IOQwgmPlvVS/M4Ie1nEor1FLo+F6Oc7zjx9AD7r57Lwr1Zb7D/Fgp6iy?=
 =?us-ascii?Q?X2noFiTajbvZldnmgbLgntlUsctIcCMyrS4jiBYf9m1oe7nBN1lVNpYiBtqj?=
 =?us-ascii?Q?LExkgx3WduNvCM8o9GSO0fZNPphITJhLEBZkAXHlLxKOdwP8bwE9fxnMUWle?=
 =?us-ascii?Q?j1uxrn4CP4phmPTF1WSctTB4R0IpI+zgT66gG6Q3M0LPtHSNQBj+lO4tSily?=
 =?us-ascii?Q?p005br+0nM8r2T2EwHPopwG2LOtJYuOIDIMWxTNsQuTY7JHcZJvSwt53F5hY?=
 =?us-ascii?Q?1ySUYZk4NIj7A9vZHfQpwtV2z8twLuwh3K41sPBKzYjFwzz8fpiyXuJuET/J?=
 =?us-ascii?Q?SddEZCf0lbj2fsuf6Zr4wP9k6j4KcNYpdjCWbsfwUfbTQwI7krGIP/5t91yK?=
 =?us-ascii?Q?9+CBv+oSnG7NFv5lTeZpghVTi904fmnAGE3Ax23BnMBNZoSj+WZUURxbRytP?=
 =?us-ascii?Q?j40YnNNf0FBuU/XKZ1DQ0QjXhw7OowZCVb1G2orD8ZRSpCfi2pipj4IFCa5n?=
 =?us-ascii?Q?XaLTdWDyd8bd3mNIHZjhLTQqFFCwzfMfbqrrObHGHfLVChT5wj89LJOiXszD?=
 =?us-ascii?Q?Eb4nYMHcVF1Jj7mDhHe49dqRukCh77tb3kMQNRM01uxQuPs3OlfEQMZrfh5v?=
 =?us-ascii?Q?KonxWiNC6FwGRMAURPlYf5UvWW8aUanycsQqODweXhl5GOZT5k7XtrEW6WTO?=
 =?us-ascii?Q?FP37ut/nGpGsVACMeF/qkzaL1al0nhfdrUpNqYa4M2uva6yUwLmV52Cn30KI?=
 =?us-ascii?Q?9xQUvaxA7Dw92yUMYm3BMzD5/Sh4WCDJ+MBTZ3G46CjHMDr5cADj0EVKerEs?=
 =?us-ascii?Q?WdnahbcwZUIarqRWWZv+bPv2QVrostcgGOZcs2xEp+YaK00VTZl2ALV/c3Gu?=
 =?us-ascii?Q?CU/DE15TQAdrXl/Ve+DQFf2/PpuKayPKq+3pNHYETt2p/S+weKSQ50j9pAV7?=
 =?us-ascii?Q?4oej9RrLipqQ2WjeVw6pdIsUVhImTv/wuSeHuvSMLlP2rllfcOyrpqVRgEwB?=
 =?us-ascii?Q?u0ymZd4uiQRx9WhFvZrj5b/8ES52QxitUvQiuKdo1IvPnqGoO/glR60PjOYw?=
 =?us-ascii?Q?S3vKqUVwImUscw/RgkkS0sqNDTuXwjOefKlA9tyOmcJWqWbWLpxqw/M2XD/U?=
 =?us-ascii?Q?PhHYc3eBT26cjhHCjxSeeYNcHZiPKEZEbK5B9jPtmgQABk4GdlV0HhcZua4N?=
 =?us-ascii?Q?tRpmiBHF60qljba/kblOikSy7OzVMmZhp2JnHEiKII36EZH6InsR8MIsA14P?=
 =?us-ascii?Q?G3IKE+1NUKSWUOhvAOFGLUgMcEexNmKruNKlLLTlCyeQfHYLEjrod4vcrCkk?=
 =?us-ascii?Q?+0AW5v5YLFYTTa0GAQ9kiWmIM4+Fc9/f+aGXHt+1p/FV4AA1uSpc5P9Zump3?=
 =?us-ascii?Q?F0BxoYbjVj3OExj6F5UtKwLhUxrXHKMeovYhVMSKCDu/1774Fu7cAuf4AgHY?=
 =?us-ascii?Q?5Tos+rPUD9Z7rb8KHz7LrtNB6yD19FKd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AsDO5fdN5saIg8DnqRdpL9X/OB3WHxfcMaJlyQnpJFlsvGWdosCELG30k467?=
 =?us-ascii?Q?kJDtADD+hhN/t2adilNesX1Pt6KXVnYdS7+TgkQMj7lRurwGyBGWJ2Fug+XL?=
 =?us-ascii?Q?NZVTWDDmN7T0JHC+MI63YZ7vagItJ/hJCQIHZYprgay31ZG6YC5/g620pMe9?=
 =?us-ascii?Q?9XkhalCkfkTU/EOGDJvr87bySpoGaktoglExfUfccGoWzTR/FB5/jCBUN77+?=
 =?us-ascii?Q?o6cx7bbSpAJn8H5LEMWTK+dWq5fve+PiDNHXXeeoFqHhXnTqkEVJTs9NlkLM?=
 =?us-ascii?Q?JWqLfqh1k06m9N/Qqi7cEPC/TB7CA4PZI25AYk2RhfT+dD9Q2E5Xpw3BFwkh?=
 =?us-ascii?Q?ZRDs3zK/ATxMkqTsNCXF/qVAE//OJFOfgY7QblK+WY2N1hk2X4WObzKt3ibI?=
 =?us-ascii?Q?b3h4ZFQpbBFRTq3qHBhH/fHwouYbGlYCpkfCAdmrjGGcZAxHLypia65KgD9X?=
 =?us-ascii?Q?LCXJBH9rUAeN9DRmE1HYXSysisAmUtwtmpNbLUfjyMWCH7dkwWpaGKWEjesw?=
 =?us-ascii?Q?x6ODwWsNO7/R0Fk/9mqzE5gjRKypM4zaKGixaY1asTc8y90YLbWtLotFtWMe?=
 =?us-ascii?Q?Y11pJNumEjgUEUsPhQV8gLQamvu+HINqz3bVCyY4/zJGAlJVvM4iZVh7iMXw?=
 =?us-ascii?Q?duHITHw8yrdBQ5g8ivMtm1iXkLWhii+L4RIvBNqblYxCq+pQewLyRPLCuwcs?=
 =?us-ascii?Q?ttcn1YWYoUZjMwY01L+nbbDfMkzNQRTbJ/y2nuiraZBkIb2smGMlAa4XvOhe?=
 =?us-ascii?Q?URWhyFI3wEbUShPGCxxvCzhoC8YnHcidKXk7EnFgpQIRSC6IssgyvnN95cxo?=
 =?us-ascii?Q?fG4ijaZQWKwaVv/FNvss6aX24opmc4FJU01aKb9HkcchpAbdw91N2ezJTLf6?=
 =?us-ascii?Q?ELLE4CdklAOygSVkAXu/toUbv+c2+TKFznbHGeYYTRnnG+D1BkmwqJZb/aEH?=
 =?us-ascii?Q?n1XtiUAN1z75Xn4BWx9Ru0qYknYKwdWbwrE6Ea5+Aj0eBVgNTwGFc9IPpgo/?=
 =?us-ascii?Q?QWqd/PiDcxgnOprGG8/rYQi24lYjIxbF2RKQ4JhLUh2JsxK97HTMayfCa3w2?=
 =?us-ascii?Q?Rpl4Z4w8PKgXPpEhGCilMsFtZjnNFaAGKGiCjgebdyMBF0qxzZKbLdsXLc+j?=
 =?us-ascii?Q?VIecALLqRK8RmKP6/D8YIGdVFs52SuMA3KdSNm0/tQ0sDB6P9Z2DAded2YHh?=
 =?us-ascii?Q?VTPNv6RRcdw8H00WpXvy70bEdNXFunfhbnYtA+o3gGG6YOv82Z4mtZr46KRq?=
 =?us-ascii?Q?B3Si/Lybd01JOuXszW6QyFMmdomAQZhTDeM2dhMQysD0sOXeCbJ7CMxf+sCJ?=
 =?us-ascii?Q?A3PJdqsuRoJqhON/AR0dB0pXVpiz9kI9MsDY5kJvm8Bj0KOEUBVaudDp1Enc?=
 =?us-ascii?Q?6tSWzxvzxZm0s/3KZ66cylu8KtQxuWdHMZm1U+OKclPu/guhiuyhAk03G1/A?=
 =?us-ascii?Q?Lb6C87NWRXV/VMXjfbTJhBVVSpEC7gEmY8d2CrAvrTrxNoi4H0vVmzi5O5A7?=
 =?us-ascii?Q?hYnaO6ZmUU8GY8LelvKu4YgRUBYhjzPszzmGxKbLbjde020gbHbWELV1unhL?=
 =?us-ascii?Q?ZJzzS3Do8LaLXiG5tNnai42LTrXFiIL6neTGcm2dbJqratkSvIE41AC/7NDn?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QFIZy0qBuG6WGKYwuTRpoZ7jvE0KUHx1U7+DPPJk0FCypuJIJFNiiEJ0KJGw2G98dF8E+waS3BGsXtZ94Oycphw498UKHpn3TbfIxKveyLBjuwsfmtQoxCMkKcFB65Zjba0O72E+NvYuvfYM3Om6W7Ai5usW+65k9+LF3nxAKlt1r8N06hxcAODjiYqjVw7lY89mveJ1z2seAY+QT+HgxRb5i5R+1m6JpyRTN3g5z14ZnAtuSAN6e9n5xnBGnqtTvkkwJncDiLrzO7qoOIQD0BddQX/vz4w1v/pW9fOO01JENm8706un3meIkyO4V42Qy06eWzhB/3KMnGWcsbPS17jij1zni71qlsX64A7KskyURVHS1wxCMUFD96ZbYReeOD+nHpR85vkpy4bFYQq+MivIwIK25gJIPPdwCY7foem3ErGdyu15ZpIviL3/LOg4L6879xMBMGUVVMPB0WEMbQFMqfsLUgATiUS/mcKF3QH/Foelt8th4aZ6UYGDFvdr42zbnSW513tbmkcrfuNpnjgLouEvhagSvyd6he2nyV7/LE87a10Z9HtF+4tGQ+96a8lCTLZycoRmi8SfgPjNsoUitqgHOfKspRP4UlsFVfU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 422e974c-5455-41a5-bd90-08de08773b45
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 03:35:32.2913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pfuFMmHZXn1tz9gveGu9Ch2ARyio2mwsncal/g1x9nPZIHNLIEAuC3ea+TH6lMMOnI/+okBUOr7GQZZBHF8DLBiDXovh2jdCVkYgwBYQoV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB6961
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-11_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510110019
X-Proofpoint-ORIG-GUID: S3DMR6a9hVv_PJOm1CUDj66dOR7guz-n
X-Authority-Analysis: v=2.4 cv=JNg2csKb c=1 sm=1 tr=0 ts=68e9d08d b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=bxbJ0QwG2q7AAQuaNyoA:9 cc=ntf
 awl=host:12091
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAwOSBTYWx0ZWRfXydY+WcqfMa9D
 vYDrDp9YgbHolmpdHeJKPnjhsl+kV2T4wJpRnc67ucBGrTuoCWOkOlcYDfTdiuvq4pN5PO68z6z
 rQ0jULCNHC1M+ZwkKIDEbom3V9D/1UGpepVXVp8C5oASwdMKsUnLyRmQeZRWCey/IT8nIG+wVL2
 FoAr3Cnh1ZaDkhiOMVuWJR7BephJJ3ZjDFtocan4NJ5eCKJvO9PF/oh7uQh9L5lh1HslYzOcNMX
 +JaHrok9jIhpmSDQKfg57TF6097cIj5IBO3VdlKjzrOxoGBmpQINbdTmGHyPLD3BDjljg6v7sKz
 0wvnvowVrFd1AMuCSzRsM85g9P2hH0KFeFhPCg04TB8VktUmoNFwOWUXMMGgnFChz0FxD5STvSl
 oD/d4jJSsjw0PpagNfTxQFvPov0Cay+FEMAm5/sYmea7Jyeue50=
X-Proofpoint-GUID: S3DMR6a9hVv_PJOm1CUDj66dOR7guz-n

The __ to - conversion was only done for usdt notes.  It needs to be
done for both usdt and prov notes because they both contain probe
names that may need converting.

Reported-by: Ruud van der Pas <ruud.vanderpas@oracle.com>
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libcommon/usdt_parser_notes.c | 40 +++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/libcommon/usdt_parser_notes.c b/libcommon/usdt_parser_notes.c
index c98c9fb0..a8b46e65 100644
--- a/libcommon/usdt_parser_notes.c
+++ b/libcommon/usdt_parser_notes.c
@@ -293,6 +293,27 @@ strarray_size(uint8_t cnt, const char *str, const char *end, size_t skip)
 	return p - str;
 }
 
+/*
+ * If the probe name has encoded hyphens, perform in-place changing from "__"
+ * into "-".
+ */
+static void
+fix_probe_name(const char *prb, const char *end)
+{
+	if (strstr(prb, "__") != NULL) {
+		char		*q;
+		const char	*s = prb;
+
+		for (q = (char *)s; s < end; s++, q++) {
+			if (s[0] == '_' && s[1] == '_') {
+				*q = '-';
+				s++;
+			} else if (s > q)
+				*q = *s;
+		}
+	}
+}
+
 static int
 parse_prov_note(int out, dof_helper_t *dhp, usdt_data_t *data,
 		usdt_note_t *note)
@@ -353,6 +374,8 @@ parse_prov_note(int out, dof_helper_t *dhp, usdt_data_t *data,
 			return -1;
 		}
 
+		fix_probe_name(prbt.prb, p);
+
 		if ((prp = dt_htab_lookup(pvp->pmap, &prbt)) == NULL) {
 			if ((prp = malloc(sizeof(dt_probe_t))) == NULL) {
 				usdt_error(out, ENOMEM, "Failed to allocate probe");
@@ -471,22 +494,7 @@ parse_usdt_note(int out, dof_helper_t *dhp, usdt_data_t *data,
 	}
 	prbt.off = off;
 
-	/*
-	 * If the probe name has encoded hyphens, perform in-place changing
-	 * from "__" into "-".
-	 */
-	if (strstr(prbt.prb, "__") != NULL) {
-		char		*q;
-		const char	*s = prbt.prb, *e = p;
-
-		for (q = (char *)s; s < e; s++, q++) {
-			if (s[0] == '_' && s[1] == '_') {
-				*q = '-';
-				s++;
-			} else if (s > q)
-				*q = *s;
-		}
-	}
+	fix_probe_name(prbt.prb, p);
 
 	if ((prp = dt_htab_lookup(prbmap, &prbt)) == NULL) {
 		if ((prp = malloc(sizeof(dt_probe_t))) == NULL) {
-- 
2.43.5

