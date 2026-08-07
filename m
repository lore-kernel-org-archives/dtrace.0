Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62C0347BA9
	for <dtrace@lists.linux.dev>; Fri,  7 Aug 2026 01:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786066258; cv=fail; b=trcmP/v2F1EztLV1OF9eHP8PjVweL0uqu+jhU9DCYQtp3gzQrLMtgvp6AAhFL8Q1bm/Icy70powOUUxcqC8XHYdBiADd68hTjpxdHr/4fZwOAIIZv/MKKl42EiotNg84FXTHm1O9fCG4mNySuAAhlfL/WIbWsRU/XS6KkTcUi4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786066258; c=relaxed/simple;
	bh=YmzO66VziKgvSYdcPuvN6b9kSTq54ktXmUr5ipHsqUQ=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=gBynYzis6KbzeaC7fgVHwvWOo+nhZSbkUL8+FivxWijv3P1aTnc2H0iXh/8Io1xpEeBDWVy29UTmy25QVqiy22okyuOkjMqPA1G0JkQOkZWtVfzXxCKLS0UrrMZEP9zMNHMC6w5oG5xjwyyr+vnIjPOy9siB3Iq3MQN7TH4e4c8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lUjXGO3w; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=w0ZEDlvC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lUjXGO3w";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="w0ZEDlvC"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676FtrKP3283103
	for <dtrace@lists.linux.dev>; Fri, 7 Aug 2026 01:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=BLBzzMbuhC56LasVfJi3oT4uw12LlrHsn6hOU/nvs5M=; b=
	lUjXGO3w9fSPfQSmqAGJ1wJyCaqdNGgRwFCNY6VAKOPOVeSw/MD2F7eieQcQ0CiB
	MES9cW0VCxe9hLIHZW/mL6+NOKpkih6l79zj9TriT2X2ui3pGQPy6pUABRDlYbI6
	BtkUDiPcTyBdMLGI9aICbSW/j+q2zpwOMIzFulnBO4Gkr8U2uYyou9bVIc8TB0BX
	/f4lRa8IKPC0xoeMahGzA8Aa8vC44zCLu+sh8eS5Gl7T/tcuv/XHoP1PFjw/Cg64
	CWjSuF0/OBzlrhOi0x8otAiqjW5ZKiWqwhvay84W1XhXiOMwJBQZ6QLxEaAx+amf
	h7igaJWEsh32btI1T1cK7A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4fs8p9ep7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Aug 2026 01:30:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 6771Uj0f003632
	for <dtrace@lists.linux.dev>; Fri, 7 Aug 2026 01:30:45 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010047.outbound.protection.outlook.com [52.101.193.47])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4fs78we9vg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 07 Aug 2026 01:30:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pF2cpb5XKcRaJmFjakE9sV/E0qjm5Z+kmoTMOiW1fqQ0wgrvtjN7IJirjyPalUEHVTQ5k3XG9LDzDwAE5Acj2ZvnPx28glTMAx9gzwK4t4OvE0fa5J/T5HS1yPdusMpOKVmpj3U/HKl9Be0ldgBABcBdRr0Ffrr7XzpG01jAqtEREOx13ogYUZMbahvnr0SIkKISwK3ny9Kx9KRWLK2Vpio5GMfR70f9R1kmesXlzYMwsqaQ+bsXGtaUxCLlv6Xhe6r3SV3NwzhNnnlNFMCXEkOZDrhXGxYfntScWhkHSTbySZsN8pqGQQO0wFsTENl6kRXTtl34UPfCIZDbYPH2cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLBzzMbuhC56LasVfJi3oT4uw12LlrHsn6hOU/nvs5M=;
 b=h2rLzANQB0nzYukJZcjE78KAeW05QzXt2V6ew+6cox0z1Pz4VBKRf1xxZTqAoJotyuS/nDZXG8asc0lfq0IWbWXSnW/iP0BGvWnoqw9FOq75RbBTuj80GZme0qd1WpGVG4lsAwUVr/BPG5S9M1jnu5l2wyS7aHnPhFld08QsZBsgRifhC3H3GwLXE6iDylguqLAi0yijroeGk7IQnzivXOgFleppris/sjTFrRE5VcxKMto+5//mvduZg2YmC5QJpxRrEjqq33bq+IzfWXll5rJYP67fzN/KjlxITu8Q/Pfp7iEpekBXGPkAyYcHBVt26xdmR1KnMi/sU2a9s/AzXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLBzzMbuhC56LasVfJi3oT4uw12LlrHsn6hOU/nvs5M=;
 b=w0ZEDlvCbubGK9kLSvoAlVbbus95a8qnbKm797kkWT1xtaDcs4oKPf3xGElAjanKMAA6lNFWGMhgRHsB8KcnK9igefYGI4EuvtTdsu99EYlTxQ73eIoF8WtoLMGnKtfuIIx+DWtZe5q5r3fPGfRrrsdqY2JUcELMOb2R36OM0eM=
Received: from PH0PR10MB5514.namprd10.prod.outlook.com (2603:10b6:510:106::17)
 by SA1PR10MB997714.namprd10.prod.outlook.com (2603:10b6:806:4be::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 01:29:34 +0000
Received: from PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61]) by PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61%4]) with mapi id 15.21.0292.019; Fri, 7 Aug 2026
 01:29:34 +0000
Date: Thu, 06 Aug 2026 21:29:32 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/2] llm: document skill usage for agentic coding frameworks
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To PH0PR10MB5514.namprd10.prod.outlook.com
 (2603:10b6:510:106::17)
Message-ID:
 <PH0PR10MB5514C6DDBE64DBE23FE781F2C2D12@PH0PR10MB5514.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5514:EE_|SA1PR10MB997714:EE_
X-MS-Office365-Filtering-Correlation-Id: 0612f920-0812-4e75-a4ff-08def4235614
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|5023799004|56012099006|10067099003|6133799003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	RMfx5SOKJuIYX+JUsFixWGceLATKmkE3ihhHmmUXDlTGTtXJfnIQKKyrwiFGZF+LOlM6FDK1IbT0NSvLhkjGZUs33eqYkZJgN+rKmrk9odE/2zTmx1VIIpi8SplXLJEJZgE6txlmeEjEE0KIm09+xWwPtwEhygizmvrMsEpr27Tf22bPfEXg210If+Q6aK2rTYyJ0Y0uXvdz+Bhu4ekVzZR1RCq4zPwfMWHxZbHNgGAsWOaCs+U/njxqPhMAbxkqpDm/bPRkV5Ean31M2dM4edIuH9t8p5NnOEU3deUg2kZI+mVSgv9L+yvDEfKJ8F3f7soQlbh5MQ0LlprEnsCaLBaNTFc9FZGUnPOgDUF6rSAdfgkVbQWiFoJwaY9IOF8CjtOBX9x8Nxvlyet8yiNXfAk7VGI5UidVs85ZUZA3Nd7SCKclUtm7wa9mbKFyII4waM/JMNoqprtfif+RxCy7q0LmR7z0TTfySrmJsWW7Lvec98PmuAOlAT0YROEvIWVZ6Ja7uQgguun1kid4QFHZIwTwIr/kt5pdncyhXWTUlSjEK4Pv+ObKXrYeuZFyME5RX5ReKjRcD4iawPDzvGVx9/1qlniQBzRQPry9ah5q/W/nJACpSErXt+uZcn1q5Hzz9ngeI2v4D7cFYtA5DDJWegTzutd7qiVWiXTZyjT3FIo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5514.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(5023799004)(56012099006)(10067099003)(6133799003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GjJj4Qeg1XVHW1mpVilaRz6hg1yM3m1uJU03o+pXIt+nNajOttOrrOMhyu7Q?=
 =?us-ascii?Q?1oLCn35x3sahqOk+SiOQ3IZMPzVtiOSmjQLQ8Da4OscxcrucEyYClhD37SW/?=
 =?us-ascii?Q?UVqAOWZYM9t0QYxxmMEAfbPA+M94oa2dcrLiGWyu1uiOdt9+EWM7XGJuaC7E?=
 =?us-ascii?Q?D2ovVDSL3T9Y/CouSJ3mAKp2+ee6I6wThFLb8dX/vYhZTOWsH00yaZMLMv8z?=
 =?us-ascii?Q?DVJvuwAXRNLtz62KzfiX1PNFb+qfuXcdsIDVuVgI82FyHeMa8VqVo1HiCVal?=
 =?us-ascii?Q?HouphLPpMBmE5//1sCpBDR4h5T/F+OFiapV27mFafIZDjKcGgovU9X3MiDo+?=
 =?us-ascii?Q?JIGnm9wRHoMk0YcFX79qEFV2zPfHZBAZMJtOZH+QPjw+zL0xUW5YGFGf67X8?=
 =?us-ascii?Q?Cmcrp1jD1GcUpveMUgFsTGBd634BVUJXumf92LdS4qSQteULMcVOZDWOwcot?=
 =?us-ascii?Q?jBK2ZLE9k/88KAFfzeHnnV/ilbrCRORA1q/BfLokxiHP9l3I8RqbKawTlvOf?=
 =?us-ascii?Q?HoEVCb6FMrQOmojkexdg4NWKwSlDkBrdj9lX57WikeyJz98ZDHCSgqQr54Zx?=
 =?us-ascii?Q?pQohm/VfsG+Hgqjx+4tEywqL+gBk452P43Cy1Le7PZ9qA2uR/SryzROyelmX?=
 =?us-ascii?Q?8UagKzPavXIw95ZLMr01Q1x/07z2S8tFs89sqcppvizqxV6UFBcKYwyS09sl?=
 =?us-ascii?Q?13XliYu5Pb8yNAFkXJDOMleTq6PqLE9h5sriQ4laCm5rJPgsKtGtF17wQK0q?=
 =?us-ascii?Q?fVswPWofhvwRyv51/Ba4vufObWfm1AV7t/cYdsQVDFxu57KIN3lBwHWKZo7G?=
 =?us-ascii?Q?DuT6in3bRKBmg6p5WTx13CaMG2tEydHXsloIB2MY+WZg4+PlEU5ATZ+u7obr?=
 =?us-ascii?Q?TrxyuUx07yaR0kmSqB/tZeAcrdqlKLbc3pcJH3Az+0PoalsZrTkgzvY+ZB5z?=
 =?us-ascii?Q?18IOF9QntcGayZ5UeJmRXTW4YJ7870qMRECBSTfe1viBxMkgDIkbvzEsRjLA?=
 =?us-ascii?Q?W3JvLsQ8DLnpEbBtoYbJReTqcwiaXCbTvTgdYjHIiWPuFBEG4UVv56cXLHmU?=
 =?us-ascii?Q?lw8mOG/2l9vpVkGnC+b7Hlcj51WYCgf3/pgPDmJcBgo6VMOP4lIcx7Gh1OZd?=
 =?us-ascii?Q?ukGp/DVM3a2Vw5y77ARDAboGk3ya/abJZ/SMenvMb5ltbn5jQCAKFSm2+K60?=
 =?us-ascii?Q?ic1MC9gaXi4a2eYyviQWbqklUCjWEEgTM2TV0x4lkqD9cJhiwbokQrG8gp4L?=
 =?us-ascii?Q?wstPpvTUQMIieMUkcuzmFeZQXjFkXZFdYuuqd8cec3NwjUtaxvHnrjupyLXC?=
 =?us-ascii?Q?ATpnP1BxhuHNAaHk+NAxiDMXCwJwqrsh2w0qVGbVtR0pxwJ/BZHEMOiNk8Tw?=
 =?us-ascii?Q?kwo3GJ58N2M42m9XLEJs8iJ5pbAMrbHneEHP50LoxMp3MDeElOfa0oGqQxH1?=
 =?us-ascii?Q?QN5G4t8Ha3XoGYMoKLnvB+5mCT6jeVvgC4eqDId2AJAAv+Jbvo74vWY6N5iD?=
 =?us-ascii?Q?Z53hRHZ0R2qUH5wl1Fpvx/9kl3hQSKeC6orKsYCKRzfweDtva/gn1EuQFC7v?=
 =?us-ascii?Q?T2PL90JVQxs0o84f0derEfnKDtpSvzm4+QjjzVPcZSSNf9Q9IaCCgi4i3Jlz?=
 =?us-ascii?Q?WJH5ByL2x/7w7Chy8gvMsEaxSPrb7ZVxzxfD1bIAVzBPpcLqY1U0h++HWG5z?=
 =?us-ascii?Q?QjKCXaxj4tfaCQlpOsXP231dfdBwsk2thzpbilvAzOjMxZqLJDV9tke32z6E?=
 =?us-ascii?Q?iWGGmt23ow=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	FIh1+4sS0lIGl45uO0REzgPScc2TKw7KiCShFUPbRPt+TQDNvam5tasoSngNfAsZbQpjH2xmk+Fw1XsR0SA604Tm71oAyysPWyySk4T7aRtMKerS87kBIOQPbzLq4jf9UUe9ubiU4ktFmHVT774qZ3zwICgvyB/UPSjy4WxnN/NI6fVOTlYi65j4t8D/+xYo/uOOuFVgocM66kRNnwzNf8PMj4hsFw5GWKWNifWXddd7R7qIdfQMCMzF2f1UCyYPm+oVr5OcuiKlyUC0eu45NXuBoByInc3HtJfgI0NekFXBR0JaMUOO/zXKk8TmnucJu8jya1kVcsuAWeE6wKK1gQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	z4uYB4/g6q2IJCQ5BPc+CvOcKfW7TLshfEEmFc8IDwW16UuHm4733as3U9XDIpvJkxs7Zc3pToXbuOWqBO7CCuq3A/tGsMWgCss6oB8AvvyRR72uJcfSV0Iy9DQ/vO6a7qUBhFoN91g0KvOsQlrZDWrWnToC893Y0+8rbELYkmG4AXpnBu/dnIlIBXp+Tx6onLZmUlRLTgvHEXv1EaTYPN2Gss7FHeCHLmpUYd+TdsNhFqME/2LkwCLzxWMBdt6/wwQZH051dVTn2D5vPSsDs6VC1q3uUuyAwXdZ5IRzZuITf+i81d1zORP5XebjRXDWyK1E0S4BRL6HdCtzY+kDESQRR7aJpzx1DbYeySqqH92KII4mCQhU0g3BP+D6Vl7QDnEqn3kUCQ7LqbTKn5LwFGRf8ADq/YIvRCkll9xH+l7qfkANuamhUEBx+8uwIAQ4ms2CnU7lhpUUdtwJe46p2YGxXjtsdRhwPWCzs4zdlX7Gy0Ls5vWnEWlZjDyNw/7DfkjujRM1UUYxQLJcmR06GljS+kZzGY9DBVjcIqzXotojtQZWGa0gPTeUPWFikqDZzL0HLAci6p+H7Ezypvm6DPJ8hZR2A+67jd6VskHMaFg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0612f920-0812-4e75-a4ff-08def4235614
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5514.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 01:29:33.9760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /OjsTIMUgfTA0XniIkJf5yqWNXlOHrxQ+kll2oyOAxF3PfhyfGnlQBqR+5uRhCrnRKT1iRyFninltgupd3ZW+0NjC6daPZ/VYaVuVQuwbOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997714
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 mlxlogscore=896 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606160000 definitions=main-2608070008
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDAwOCBTYWx0ZWRfXzHe5JVRRF73w
 JMyjBmvu9nD57BizfMcrOmIYwtZtwXLUVeCYnzYe6buRs6BkDOUAbIF6JRXQZIvwYM/ezxP9abI
 UbfL8Jplz2W2K85KlBclFvx5Xs3PC6Jc9/S4LcAPoFJgEOVD9Tr+
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a753546 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=NEAV23lmAAAA:8 a=yPCof4ZbAAAA:8
 a=HL5ShBG6baj32WU1HP0A:9 a=3ZKOabzyN94A:10 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13510
X-Proofpoint-GUID: Vwvw-OObUqp-I8ZI4mBUxrwaXe87w9YP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDAwOCBTYWx0ZWRfXxy9WD4xZeJj7
 Zh8x5vMRPpRXPamayRh6Dfdps8JKWFSobyuPYjlpDjDZgKPzeB4ogfaMPdw++HFwkQEaOPtNWfN
 TRWQHgnJqFcNIFLyqTqSo6VR5vJ4eeuwupP8EDW8F97vegFGFE2QxKQSAs+QUkQV5nfvnwEu/sJ
 9szjavmsKvnFBMMpWVYDQG2cH1YW7gSw24MXPVWpwOT0qPp2TqORA+Tah6hUut05PwYFErE6tWJ
 BsEEurzG2PVQDdcnbBGzuPRsHTHC2nAoZ6xzRsIj0a73MqbuUHR+NttOBAqqODZQETwfNHzlTmb
 7n8oifrGMbgxSa4swt8LOx1mesOXoLrP0s9DqTuwPhuqDyNw/DSDKG31ekAuZy0veiv/jvzW7n4
 3Q7CR/8Bd7FwTPTOyxPKUyUpMD54J3DH66qoed42FcjVX/DJb5L+UraJJ8ouGv+htn/jCNSEXr3
 z9LnxPoLDeKHP+V9aqCPR/pnORco19J03h9P64iQ=
X-Proofpoint-ORIG-GUID: Vwvw-OObUqp-I8ZI4mBUxrwaXe87w9YP

Update llm/README.md to describe how SKILL.md is used by an agentic coding framework capable of loading SKILLs.

Add a link explaining what SKILLs are and document the validation flow users can expect when scripts are generated.

Signed-off-by: Greg Marsden <greg.marsden@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 llm/README.md | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/llm/README.md b/llm/README.md
index 5e0feb122b81..8a8babd6639c 100644
--- a/llm/README.md
+++ b/llm/README.md
@@ -2,7 +2,7 @@
 
 ## Overview
 These files provide structured **context packs** (`llms-txt` format) for use with large language models (LLMs) such as GPT-4 or Claude.
-They teach the model how to write **correct, safe, and complete DTrace programs** for Oracle Linux.
+They teach the model how to write **correct, safe, and complete DTrace programs** for Linux systems running DTrace.
 
 The goal is to let engineers and administrators generate working D scripts in natural language — without having to memorize the entire D language syntax.
 
@@ -15,6 +15,34 @@ The goal is to let engineers and administrators generate working D scripts in na
 |------|--------------|
 | `llms-dtrace-short.txt` | [Compact reference](llms-dtrace-short.txt) used to bootstrap LLMs for DTrace knowledge. |
 | `llms-dtrace-complete.txt` | [Full expanded reference](llms-dtrace-complete.txt). |
+| `SKILL.md` | [Skill definition](SKILL.md) for generating and validating runnable Linux DTrace scripts with safety and style constraints. |
+
+---
+
+## Use in an Agentic Coding Framework
+
+`SKILL.md` packages the DTrace guidance into a reusable skill so an agentic coding framework capable of using SKILLs can reliably:
+
+- generate full runnable scripts (not fragments),
+- apply safe defaults (stable providers, predicate-first filtering, aggregation-first output),
+- avoid forbidden control-flow constructs for this workflow, and
+- verify generated scripts before finalizing output.
+
+What is a SKILL: https://github.com/openai/skills
+
+Verification flow used by the skill:
+
+```bash
+sudo dtrace -e -s script.d
+```
+
+Fallback when compile-only verification is not available:
+
+```bash
+sudo timeout 3 dtrace -s script.d
+```
+
+In most Linux environments, `sudo` is required even for `-e` compile-only checks unless the user has sufficient tracing capabilities.
 
 ---
 
@@ -39,7 +67,7 @@ The goal is to let engineers and administrators generate working D scripts in na
 
     -   In ChatGPT, Claude, or another interface that supports file context, click the “+” icon and upload `llms-dtrace-short.txt`.
 
-    -   The model will automatically ingest the reference and understand how to write runnable DTrace programs for Oracle Linux.
+    -   The model will automatically ingest the reference and understand how to write runnable DTrace programs for Linux DTrace environments.
 
 3.  **Start asking questions in natural language**
 
-- 
2.51.2

