Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793389122;
	b=VhB2kUOjFDBr9eZyWxZc9zDGe1JeoDih2Qxh13I8TU1vgxc7SzmJU3J5LdTTPXKu5cVW
	 JY+psoHKITszoC7QhKxd7fdzl9ZTW258GElWaEi2G2YfdJjP32kwvAERQ4detje20stSI
	 LcKuAFKlW0caXR9KW4tDHnQJQ9k0/YdalbKQg1VrmLpdNlroExdXBjViqsOK4flIWA+QQ
	 cFTSTSUYyUmhrx5JyFh7Y72foW2HbAoRDQmINu2nkAqwSiP353uBY1zXsE3yKId/TZTt8
	 YYYbeOl4WSr37qdbEppA7/dkDfZsu5fPq1IYEsUa2lOY6xMVM27PYp84LgaPya9ZqsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389122;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Subject:
	 Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-TrafficTypeDiagnostic:X-MS-PublicTrafficType:client-request-id:
	 request-id:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID;
	bh=BvxyZD9J8HymBFxinKLy8lv+FDcFi5+td86vc3WqOFg=;
	b=5eu6MdmyKxmEU15Jq3ctdet54ocN9dvKOmBg2gFcXpHweB/h5em5mLYNdNmT0JIgDXBI
	 dp8Gjo/J/mK8CdB0sfcAJAOR8F9c0EMt45ZABIktUgHCV2SY0jTpGuhdkDja+O2KkYu3m
	 Z16q4+oQ37v38RwObh/eO1x5Z8wSS/m4klGxaRgFDePMGrPctGCTde9xyLtVBeEkFE+Hc
	 LP7z1Srh/8Q2zgW3j55olFcBTGHJLr8u54UzaNjjb7vbOtbZJSPJmYGdp0fQMHweLd933
	 9lBFT5Y4fXo/B9onZsJcfY1/+z6Rn/B1GtRssd7IzyhSBITM4OzoWQ/YGGxgxM87KHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b="L/+TVQFb";
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=PhzjOn0a;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1897606A31C
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1897606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=L/+TVQFb;
	dkim=pass (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=PhzjOn0a
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UEXSij2455274
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=BvxyZD9J8HymBFxinKLy8lv+FDcFi5+td86vc3WqOFg=; b=
	L/+TVQFbxc74l48FEyH4HQkVeCrcFmgCK1Dg5jtoXh8NEnfkldkKSfGTJvtyVwwO
	qXpJXICJJ2KDGo4lNZw7Fk+WKTuALMtrCVvWnIinZsJnriftrLsuH18qi/QfBU7s
	SvF10DuvMoXijJBpcIsb9UJytjoQZDYkhfcVrMplEtaw9/EN+n/zTmiZ9a9Y7iBK
	l8uZNHIrw0uSh6tDBynXu9ATz3myj63plMEfM9eSVKUj89PupmQa8LJSKEA/wWoY
	nMTYC64suaW0fnT4XGnEJViq23sOuGW9vrpN02wfJ5ft9fam9C2sCG2vb4RuKJaH
	494C4JtgrYsMPdzJuu2IEg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hme5m9chu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 69UHvhSr433641
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:38 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011041.outbound.protection.outlook.com [52.101.62.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4hmyuy3j2m-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aGoiMknJ0NGG692gbo2rlRySpdpfeY7izgnLs5sr2oGzoBZyNffiURw5DG+66DDRtyHS4RL24Q4vdM0NB74QHQrV7/00hCdLB6aRb/1SphYktlT+tmPTYFGsGx4aR4bxAd85EY5UDIePj4em6oL3WcwnpsAoB1djK8EG5Ik5fjnctZalyLwK2Fg6+quEF2IEfnENOAD348ZoLmClfAgMWctmUKEhE8jwAwhBTDNF2JYL4ql3WaxTRoto3u7VboKuXWlAXTSrS/IZ7SzbhA3MGyKwq4hWgpC9Xtnd8VlLNYvQY7pJAwjkYvZmTuYjpwZddErKw5V0/SNDDq8N5IZh7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvxyZD9J8HymBFxinKLy8lv+FDcFi5+td86vc3WqOFg=;
 b=IZorAlAMxg4YWGSmp1iBjNjBnuUWmUqiwLNu7TsBMBVIhDiNxqq5dKiULvwS6Hy290D/9FIoIZiZ285uHRq+cabuceNGyE8nK46OTCT6hDPIbemyoz0EJQkGWUB10ipcvga3nEB5f800SsAKcCdPt2VGZno2xSsBaGm+VpzHA7ba1dP8OUbuJR06YQ20/dTn7Y1pNdPbhA+rGUCpf7voE6S/DEFypCYHnjgcxfZY+DiX68PVFiFDvXA4Jab8Gx3+sdhRrbgXbUbjeKUQ2AkS8kWqlJPPKYFq9jDMWu47KX5ul8/qr/1SMCUlPD15lF2OD0n2h6uKenS/acUCZ7By2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvxyZD9J8HymBFxinKLy8lv+FDcFi5+td86vc3WqOFg=;
 b=PhzjOn0aJ+JpaN4YCaonynhXz9N7tDZXGwh5FUPvRWQrIJ4jvl/icq/bDnmQotNp/kKUC/1eiz2ijnUqp2qDwcakARPhz8ka64pEf2nRLRLy0HTvxNKAlh9saZGymfv3q4nSyUIh506vDwCqr5vCEmts3dM8gY1v37v6U7Z3rBE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by BLAPR10MB5010.namprd10.prod.outlook.com with HTTP via P2P; Fri, 30 Oct
 2026 19:38:34 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 19:38:34 +0000
Date: Fri, 30 Oct 2026 19:36:59 +0000
Message-ID: <3a4910515ffe2cc8b3f3f7bdefda3444@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 17/20] uprobe: add support for uprobe systemwide probes
Content-Type: text/plain
X-ClientProxiedBy: PH7PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:510:339::17) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|BLAPR10MB5010:EE_
X-MS-PublicTrafficType: Email
client-request-id: 2ffb16f3-4a79-42a4-8da2-79fd2785b829
request-id: 5925f011-e155-48f9-b56f-08df36bd629e
X-MS-Office365-Filtering-Correlation-Id: 5925f011-e155-48f9-b56f-08df36bd629e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|5023799004|56012099006|261009223027099003|261026140227099003|261028144727099003|261021121427099003|261021135927099003|261021123027099003|261022075727099003|261022105027099003|261026121527099003|10067099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	+72i8jEV+VIDc2ozP6yLtrz7C9RICM7YCMQ/FgsZvBxpVI+OVGJ5CdcrYWB+f11yiihurpqjXYlC2C8wOh1Sax8gdcmf0qEhWVPhn0iL0jnYW0vq1rSbfGIO116wTWe6CXECgqAhbRqs2WAJkn04Ud8yilBXWTwIPGPb8xF4/HD8ZWIGSRppxHKrEigOTadlES/J4AROxEcdLvtTips0X8tekSvWiQ5HdP65GFak4CLtIe44b5YSkZllTnduFV4HlnoMDNnsMuJFaOfWXkUIFKPLqCzrwejZjeQQ+bWeO3uORRPVZAdDsN9eSft0lfHqMF0M2qc0twmqTyTj4oElLt1BfJbYKrejxPEvLVdskE2Flh9b904PuAP8k3IFxCpLRctLSG5hWAlt11p0G7Q5f1K/aJIcXFn1F/y+uIoK7VBFabe3wV2HJlt3rEbjWC2iQvL3VZaXeyNgJWp9DSri4KzMdEIHGpxwbOqBf1GWKXfKTLUohcSfxCfo8rF9hVhZd4aOJdEtqCb4hlxdhDgqVDSt2Oh0TIhoS9AkkauxWdhtCUji++nG8spuclkGJXSB+fljxXmPCLNf+MMNR/amsML5/wI2ADw8d6GOFBUPvZ8+4rpHtzuqOBKWG4jK4ZUil3s1ckaHNcTZzLefmAP9KTu4K+DFhnVpC+zwsNrBsOg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(5023799004)(56012099006)(261009223027099003)(261026140227099003)(261028144727099003)(261021121427099003)(261021135927099003)(261021123027099003)(261022075727099003)(261022105027099003)(261026121527099003)(10067099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MTMGnVSNHHih/CxCyaG8YYZdDQMO1nFfvRhmWoBr8MloAX00K0nnWzs/23qO?=
 =?us-ascii?Q?CwscOn1vIRMJCTgVa2brZDTD11Mg5+Vc8azqCZheKxrOVlegzJMq+7PDh0s5?=
 =?us-ascii?Q?TpNQl3euwkU55fRaukQcg9S4M145CazB1cih9pc1OXlgmi/JMetGeHdjozGf?=
 =?us-ascii?Q?V1y0amYI2h0dUq6XSxMmVtqZkgnm3Qh7kXZdnE45fFmVUfpX0aTpjOuBWWHQ?=
 =?us-ascii?Q?ULjZJGax+IrUMyP/GsbUIQHVNR9GfyT1Tn1dQnpE66HlsA6o1A21t1dTx+DN?=
 =?us-ascii?Q?fM819FYHzhDZ37RfMC2YGQEhBlxwTxJLfzEOTvZ8DprHmHrCpGDiVhNe2MuP?=
 =?us-ascii?Q?KvYyI23mGiG6BlGt3R+tNNFpuxNMjmH4exUoa11vKdq/oi7vUbW1v/byHc27?=
 =?us-ascii?Q?fxf/pb5S/No3qEERh96VNQofQdXv8a8604e/wmbATMQzIBZGRQKtZyl0Vy+T?=
 =?us-ascii?Q?zzbiMOb76ezpHDw+FFikcfh8JB7mU3jUFacRwa+klp5hCUaHHGFK+QcyYoAI?=
 =?us-ascii?Q?ttb4NhPpGOmp1z7jtzoQG07Riq4gGnG1y+0/aYgu6nWLXUJCKIJAwkRP3mGG?=
 =?us-ascii?Q?UsQ10S6X6t8+AXmt+vYPgdTFYlL0rZsKQAHHpDkS4VeLThjsoT1Uul/pH67E?=
 =?us-ascii?Q?PeEbqnkpQLpQ0raAkO9Ea6esmgxwwEivCnBQKYfb45m+EDGKjCJ9rP7yA+Wq?=
 =?us-ascii?Q?zWTB6tPMTFYk9S3pMFonRTdENrlmVuXD51UjxGhBsOkAm6Fcm8BNlGc/98bF?=
 =?us-ascii?Q?S3PZ2FJnr6eLio6PcQwFEGhBfDwkx0IZmyrMnZM6icuMiRpKTTh8fN9UdCcb?=
 =?us-ascii?Q?X4s4VzjdxqKDD8pFPLXwm4rlqBHGt32whMFQEmVBXgBFD3cvbi35ShvWAdW7?=
 =?us-ascii?Q?cVxno+76nI662Uqv5W4DCnhx6tPdkRQpALhn7cldi0SIMEEJctmBuzqNhfrP?=
 =?us-ascii?Q?cgKc1w6wn3+UhKsp2HuWOBta2Z6qBMl0fjDXhCZviQrt/jZtbhe0o56QQRoa?=
 =?us-ascii?Q?sqfhlfW9UTfAIH2jq7WGHd8z97WV2Y5n0A/jFhDgSppOhmx5uMLgqO7HEsEb?=
 =?us-ascii?Q?Kbq2hw1P6ZNNxAcckr9XVeZeyJeVZX7p5R6vaaboYWc4aqnrf3MwfyGPs0IU?=
 =?us-ascii?Q?At1J61o9B6QjDP+xvCQ4as2Ffx7vJr5RCJDROKxIU6/W4SnMfUArSh6UUKTX?=
 =?us-ascii?Q?znvLaTF0CK6igq7Jkd7I+GFJuHc+MvEsLR9Ciqz2klFb4HF6KQYAXt5TSTPm?=
 =?us-ascii?Q?uJFMWhtVqqHxS1rrLdFRJ/DyynNukmk+GMkzP5q1Z1msna9xIunGCk9CyHP5?=
 =?us-ascii?Q?Zx0sFjkQnUERzci/2PVa4SsmZ6JWou3cmsCI0vOKX/ml/tI2kFRuK8ZLE+13?=
 =?us-ascii?Q?PtdTTqc1gZGDPawdYDi8L+mv6sOcQzE4gGgENtF6kahPrfw8z6oQAUVR5eLr?=
 =?us-ascii?Q?hV8yoFIzfCtwmxqPAMTboaJbuTUMnHnSWPg6iHEblxzK0mNRRbNrDorQD/j0?=
 =?us-ascii?Q?3RsCrdtpYTbY2RpDdDryYkURGrZ6MCMHr/DRqri0XC+Djan1kfMsleIfTBCq?=
 =?us-ascii?Q?XY7gTqWyT9mVvJodoaRF6rb50979kH5QRD24w4qHykg71EDqAxWWG3TgGWMb?=
 =?us-ascii?Q?822TzOIYffb7vsOVi41t6ZHeDUkBXCjvIO69Gmpew/BDrOp/57WjbU3jwmeA?=
 =?us-ascii?Q?QdJIyHrEvhBOpaWDGXq5GtFANIsjURsGWhv2ErIpAXHhcz06rHa0a3/MXxyd?=
 =?us-ascii?Q?ZawaRofqzOWPihLRGPXc5d2vMO8G4Ns=3D?=
X-Exchange-RoutingPolicyChecked:
	ZWNK0QQJ4bMUUeZcbBj5BVVbmnRU2KVJpY3gihHZhNCJGQuCVSsvGFi9PhAOdZ2ADgR1FCvqGTtEQvjqAFGzrk87388nskp3gkhBgAlEJKdymiIxOdSWG685dToqLGo36uiOHYZqdugsAc6fjeUvJKRGXamhVOJ/q/oGHv+eh/b47NtT11l0JIOurwko05mVXU33ABI73baaQBz+7oMIEDtv98qeGSLbHr3zKEIW9O+QLPLFLT2g9m4rg9riT9K3FpaNBlLwxiyG7zYVPdOZqmioU5cAjyk3sBgtm5eDJUSbIcuaYnMwamqVJ0gfVFz0arLrIHarJcJXCX9a6aWSFQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	efO9iH95E7XvGX8AeJV8K26+yIHR/d2MUkZzLdYgtKaipCpGizxPjJEtke51JcQT6cRbBeUHrKM7PtfvkXpiMf3uKNMgGq8su07PAS8W0gHTBJV8jpLfiCuHnJN4ZDTOxyrags3gybz+upHla+H4RbAkCniTggUbGT47YFT8uIfnbdzU+wQ2W4MvBkJmf3k3ThMc8tHuiJiwDTPQYcw0b7BKkaHZEQUQEwBSy1GIrdxk9iEK3HQM5D5DCKkL4tqrpgZjGTCkpwlfQEbziMsrrxDRysjixRSnOgAh4EfjbaCWbXXYGlPLJG6iGuPoCg4kFYIIQO9HI6BTluDAoi5yFPMG+QAiWf9iCioodUtJwP7JzRpYGyOWQvPS1jE7+KC2gMOZ8H7csydYjRMaAlmRDaE2f0FwwK46hV+3mZjyhjHzz6vQp0QoNlbPz+b9OeMRG1MJBD+Y7PZuWlgGdkdIzAIg7nqcvL+p9V83KLpqE6hhqfU6cRi5Vmth/q17LWd+KgYV/XDStNLz0zp5OY+BpkYM0knsYWkLHmZ4zG3rqlU1DUhSQBnuCnQtE44NrTZj3wk9/oP3BP2FDPBNvG8ZyypAFOU5/gX5A5XPa/jTz5o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5925f011-e155-48f9-b56f-08df36bd629e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 19:38:34.2819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WvAfFfrbMn34E2Olir5a6Bp9Q4b7bq5hfYREAemJ3Mf2BoNudGX0MHMBQrsRRW4vo+RCcMjz1FABSvYPYEaYMY4BWtcAkwdDn1DU1Dd3FIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5010
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0 lowpriorityscore=0
 mlxscore=0 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2610190000 definitions=main-2610300078
X-Proofpoint-GUID: pdGaHXSFuxdi9Ns2-1OgbIhGsagOMOqJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfXwFxONtM0VidA
 wOD4HanDW4VGCTT0byxi4eSogG8PvBXPwUgGZg4lVR+wdfBDiuiUCbFv7Dlmw080yQFcI+S3svq
 z+Ucv6M/ldvr65HB2Th3LHyw+h3wOM5bgjeS8rSSpfkJDvdOrnDD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX+LcNxLIQnZEA
 lh9T/GDbTYhHhCMUZjPfr3mIVtfnAo1ChfekNqUDGBFwJH5cjHYUXaMdNE8//Wmd7ryCG8CNo89
 mmZ4b80IXQyyXCX2Cosqe4fJta/50d320awnS5CKEN607u/RRnzfPdhoCQG/PwqR3Nk9ycZV6SL
 tYSCJnBP4YvxkeYXyUvZDusYyCYntyixda3SbGnrnBw2NDYVkh9axUId1zEuqiB65QeVdQK3nkX
 HSuZj3Ai5IY+VosSy8AACiymKJ2Yu3e1pRMuf8a66iPV3C4avuTBGPzE5iRk7qm1UJ340SW/P6p
 alvornnX9ot6oSc6+YL6NQHSpYvwbyaQaMKTqF9CmfUp2QvJMKX5UI9Mw8/6wW8SzA+ivElSrfx
 gGNLxeNW5/27RTjhgkrQXmsuIjTY8hP/hs3478kKXLoM1pZJ2ivpnPHewQf44lsL/OQUyXF/qg1
 4/+UZZTBEwxLSwBNt2g==
X-Authority-Analysis: v=2.4 cv=arsnmiZV c=1 sm=1 tr=0 ts=6ae4f23f b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x4eqshVgHu-cdnggieHk:22 a=yPCof4ZbAAAA:8 a=WlW69kX9RWwn7Jgv88EA:9
 a=O8hF6Hzn-FEA:10 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-ORIG-GUID: pdGaHXSFuxdi9Ns2-1OgbIhGsagOMOqJ

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_uprobe.c                    | 170 ++++++++++-
 test/triggers/Build                           |   9 +-
 test/triggers/uprobe-wildcards.c              | 122 ++++++++
 .../providers/uprobe/tst.dlib-path.sh         |  70 +++++
 test/unittest/providers/uprobe/tst.dlopen.sh  | 135 +++++++++
 .../providers/uprobe/tst.elf-offsets.sh       | 278 ++++++++++++++++++
 .../providers/uprobe/tst.lifecycle.sh         | 134 +++++++++
 test/unittest/providers/uprobe/tst.multicpu.r |   4 +
 .../providers/uprobe/tst.multicpu.r.p         |   8 +
 .../unittest/providers/uprobe/tst.multicpu.sh | 138 +++++++++
 test/unittest/providers/uprobe/tst.multicpu.x |   9 +
 test/unittest/providers/uprobe/tst.multipid.r |  20 ++
 .../providers/uprobe/tst.multipid.r.p         |   4 +
 .../unittest/providers/uprobe/tst.multipid.sh | 117 ++++++++
 .../providers/uprobe/tst.multithread.sh       | 160 ++++++++++
 .../providers/uprobe/tst.probespec.sh         |  68 +++++
 .../providers/uprobe/tst.search-path.sh       |  91 ++++++
 test/unittest/providers/uprobe/tst.shlib.sh   |  81 +++++
 test/unittest/providers/uprobe/tst.symbols.sh |  52 ++++
 .../providers/uprobe/tst.systemwide.sh        | 158 ++++++++++
 20 files changed, 1826 insertions(+), 2 deletions(-)
 create mode 100644 test/triggers/uprobe-wildcards.c
 create mode 100755 test/unittest/providers/uprobe/tst.dlib-path.sh
 create mode 100755 test/unittest/providers/uprobe/tst.dlopen.sh
 create mode 100755 test/unittest/providers/uprobe/tst.elf-offsets.sh
 create mode 100755 test/unittest/providers/uprobe/tst.lifecycle.sh
 create mode 100644 test/unittest/providers/uprobe/tst.multicpu.r
 create mode 100755 test/unittest/providers/uprobe/tst.multicpu.r.p
 create mode 100755 test/unittest/providers/uprobe/tst.multicpu.sh
 create mode 100755 test/unittest/providers/uprobe/tst.multicpu.x
 create mode 100644 test/unittest/providers/uprobe/tst.multipid.r
 create mode 100755 test/unittest/providers/uprobe/tst.multipid.r.p
 create mode 100755 test/unittest/providers/uprobe/tst.multipid.sh
 create mode 100755 test/unittest/providers/uprobe/tst.multithread.sh
 create mode 100755 test/unittest/providers/uprobe/tst.probespec.sh
 create mode 100755 test/unittest/providers/uprobe/tst.search-path.sh
 create mode 100755 test/unittest/providers/uprobe/tst.shlib.sh
 create mode 100755 test/unittest/providers/uprobe/tst.symbols.sh
 create mode 100755 test/unittest/providers/uprobe/tst.systemwide.sh

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 1d2b9755..97276fe0 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -37,6 +37,7 @@
 #include "dt_dctx.h"
 #include "dt_cg.h"
 #include "dt_list.h"
+#include "dt_module.h"
 #include "dt_provider_tp.h"
 #include "dt_probe.h"
 #include "dt_program.h"
@@ -401,6 +402,161 @@ static int populate_usdt(dtrace_hdl_t *dtp)
 	return 0;
 }
 
+/* Create a concrete probe, retaining existing probes across provide calls. */
+static int provide_uprobe(dtrace_hdl_t *dtp, dt_provider_t *prv,
+			  dt_module_t *dmp, const char *fun, uint64_t off,
+			  int flags)
+{
+	dtrace_probedesc_t pd = {
+		.prv = prv->desc.dtvd_name,
+		.mod = dmp->dm_name,
+		.fun = fun,
+		.prb = flags & PP_IS_RETURN ? "return" : "entry",
+	};
+	dt_uprobe_t	*upp;
+
+	if (dt_probe_lookup(dtp, &pd) != NULL)
+		return 0;
+
+	upp = dt_zalloc(dtp, sizeof(dt_uprobe_t));
+	if (upp == NULL)
+		return 0;
+
+	upp->fn = strdup(dmp->dm_file);
+	if (upp->fn == NULL) {
+		dt_free(dtp, upp);
+		return 0;
+	}
+	upp->off = off;
+	upp->fd = -1;
+	upp->pid = -1;
+	upp->flags = flags;
+
+	if (dt_probe_insert(dtp, prv, pd.prv, pd.mod, pd.fun, pd.prb,
+			    upp) != NULL)
+		return 1;
+
+	dt_free(dtp, upp->fn);
+	dt_free(dtp, upp);
+	return 0;
+}
+
+/* Probe kinds selected by provide(), independent of per-probe PP_IS_* flags. */
+#define PROVIDE_ENTRY	0x1
+#define PROVIDE_RETURN	0x2
+
+/* Match defined functions in both regular and dynamic ELF symbol tables. */
+static int provide_module(dtrace_hdl_t *dtp, dt_provider_t *prv,
+			  dt_module_t *dmp, const dtrace_probedesc_t *pdp,
+			  int flags)
+{
+	dtrace_objinfo_t	info;
+	Elf_Scn		*scn = NULL;
+	int		n = 0;
+
+	if ((dmp->dm_flags & DT_DM_KERNEL) || dmp->dm_file[0] == '\0' ||
+	    dtrace_object_info(dtp, dmp->dm_name, &info) == -1 ||
+	    dmp->dm_elf == NULL)
+		return 0;
+
+	while ((scn = elf_nextscn(dmp->dm_elf, scn)) != NULL) {
+		GElf_Shdr	sh;
+		Elf_Data	*data;
+		size_t		i;
+
+		if (gelf_getshdr(scn, &sh) == NULL ||
+		    (sh.sh_type != SHT_SYMTAB && sh.sh_type != SHT_DYNSYM) ||
+		    sh.sh_entsize == 0 || (data = elf_getdata(scn, NULL)) == NULL)
+			continue;
+
+		for (i = 0; i < sh.sh_size / sh.sh_entsize; i++) {
+			GElf_Sym	sym;
+			GElf_Shdr	fsh;
+			Elf_Scn		*fscn;
+			const char	*fun;
+			uint64_t	off;
+
+			if (gelf_getsym(data, i, &sym) == NULL ||
+			    GELF_ST_TYPE(sym.st_info) != STT_FUNC ||
+			    sym.st_shndx == SHN_UNDEF ||
+			    sym.st_shndx >= SHN_LORESERVE)
+				continue;
+
+			fun = elf_strptr(dmp->dm_elf, sh.sh_link, sym.st_name);
+			if (fun == NULL || *fun == '\0' ||
+			    !dt_gmatch(fun, pdp->fun))
+				continue;
+
+			/* perf uprobes take file offsets, not virtual addresses. */
+			fscn = elf_getscn(dmp->dm_elf, sym.st_shndx);
+			if (fscn == NULL || gelf_getshdr(fscn, &fsh) == NULL ||
+			    !(fsh.sh_flags & SHF_EXECINSTR) ||
+			    fsh.sh_type == SHT_NOBITS || sym.st_value < fsh.sh_addr ||
+			    sym.st_value - fsh.sh_addr >= fsh.sh_size)
+				continue;
+			off = sym.st_value - fsh.sh_addr + fsh.sh_offset;
+
+			if (flags & PROVIDE_ENTRY)
+				n += provide_uprobe(dtp, prv, dmp, fun, off, 0);
+			if (flags & PROVIDE_RETURN)
+				n += provide_uprobe(dtp, prv, dmp, fun, off,
+						    PP_IS_RETURN);
+		}
+	}
+
+	return n;
+}
+
+typedef struct provide_module_arg {
+	dt_provider_t		*prv;
+	const dtrace_probedesc_t	*pdp;
+	int			flags;
+	int			n;
+} provide_module_arg_t;
+
+static int provide_module_cb(dtrace_hdl_t *dtp, dt_module_t *dmp, void *arg)
+{
+	provide_module_arg_t	*data = arg;
+
+	data->n += provide_module(dtp, data->prv, dmp, data->pdp, data->flags);
+	return 0;
+}
+
+static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
+{
+	dt_provider_t	*prv = dt_provider_lookup(dtp, pdp->prv);
+	dt_module_t	*dmp;
+	provide_module_arg_t arg = { .prv = prv, .pdp = pdp };
+
+	if (prv == NULL)
+		return 0;
+
+	/* Disallow uprobe probe specifications with empty module component. */
+	if (pdp->mod && pdp->mod[0] == 0)
+		return 0;
+
+	if (dt_gmatch("entry", pdp->prb))
+		arg.flags |= PROVIDE_ENTRY;
+	if (dt_gmatch("return", pdp->prb))
+		arg.flags |= PROVIDE_RETURN;
+	if (arg.flags == 0)
+		return 0;
+
+	if (pdp->mod[0] != '\0' && !strisglob(pdp->mod)) {
+		dmp = dt_module_lookup_by_name(dtp, pdp->mod);
+		if (dmp == NULL)
+			dmp = dt_module_create_user(dtp, pdp->mod);
+		if (dmp == NULL)
+			return 0;
+
+		return provide_module(dtp, prv, dmp, pdp, arg.flags);
+	}
+
+	dt_module_user_iter(dtp, pdp->mod, provide_module_cb, &arg);
+
+	return arg.n;
+}
+
 static void free_probe_list(dtrace_hdl_t *dtp, list_probe_t *elem)
 {
 	while (elem != NULL) {
@@ -1390,6 +1546,16 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	 */
 	dt_cg_tramp_copy_regs(pcb);
 
+	if (!dt_list_empty(&uprp->stmts)) {
+		/* Populate probe arguments.  */
+		if (upp->flags & PP_IS_RETURN)
+			dt_cg_tramp_copy_rval_from_regs(pcb);
+		else
+			dt_cg_tramp_copy_args_from_regs(pcb, 1);
+
+		dt_cg_tramp_call_clauses(pcb, uprp, DT_ACTIVITY_ACTIVE);
+	}
+
 	/*
 	 * pid probes.
 	 *
@@ -1542,7 +1708,8 @@ static int uprobe_create(dtrace_hdl_t *dtp, const dt_uprobe_t *upp,
 	attr.uprobe_path = (uint64_t)upp->fn;
 	attr.probe_offset = upp->off;
 
-	return dt_perf_event_open(&attr, upp->pid, -1, -1, 0);
+	return dt_perf_event_open(&attr, upp->pid, upp->pid == -1 ? 0 : -1,
+				  -1, 0);
 }
 
 static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
@@ -1720,6 +1887,7 @@ dt_provimpl_t	dt_uprobe = {
 	.name		= prvname,
 	.prog_type	= BPF_PROG_TYPE_KPROBE,
 	.populate	= &populate,
+	.provide	= &provide,
 	.load_prog	= &dt_bpf_prog_load,
 	.trampoline	= &trampoline,
 	.attach		= &attach,
diff --git a/test/triggers/Build b/test/triggers/Build
index 0dd546ac..fed3474b 100644
--- a/test/triggers/Build
+++ b/test/triggers/Build
@@ -25,7 +25,8 @@ EXTERNAL_TRIGGERS = $(EXTERNAL_64BIT_TRIGGERS) $(if $(NATIVE_BITNESS_ONLY),,$(EX
 INTERNAL_64BIT_TRIGGERS = libproc-pldd libproc-consistency libproc-sleeper \
     libproc-sleeper-pie libproc-dlmadopen libproc-lookup-by-name \
     libproc-lookup-victim libproc-execing-bkpts libproc-execing-bkpts-victim \
-    btf-cyclic-types btf-lazy-types shared-ctf module-discovery elf-symbols
+    btf-cyclic-types btf-lazy-types shared-ctf module-discovery elf-symbols \
+    uprobe-wildcards
 INTERNAL_32BIT_TRIGGERS := libproc-sleeper-32 libproc-sleeper-pie-32
 INTERNAL_TRIGGERS = $(INTERNAL_64BIT_TRIGGERS) $(if $(NATIVE_BITNESS_ONLY),,$(INTERNAL_32BIT_TRIGGERS))
 
@@ -258,6 +259,12 @@ ustack-tst-spin_CFLAGS := -O0
 ustack-tst-mtspin_CFLAGS := -O0
 ustack-tst-mtspin_LIBS := -lpthread
 
+uprobe-wildcards_CFLAGS := -Ilibproc -Ilibdtrace -Ilibcommon -Wno-pedantic
+uprobe-wildcards_LDFLAGS := -Wl,--export-dynamic
+uprobe-wildcards_DEPS := build-libdtrace.a build-libproc.a libcommon.a libport.a
+uprobe-wildcards_LIBS := $(objdir)/build-libdtrace.a $(objdir)/build-libproc.a \
+    $(objdir)/build-libcommon.a $(objdir)/build-libport.a $(libdtrace_LIBS)
+
 module-discovery_CFLAGS := -Ilibproc -Ilibdtrace -Ilibcommon -Wno-pedantic
 module-discovery_LDFLAGS := -Wl,--wrap=fopen64 \
     -Wl,--wrap=dt_bpf_btf_get_next_id -Wl,--wrap=dt_bpf_btf_get_fd_by_id \
diff --git a/test/triggers/uprobe-wildcards.c b/test/triggers/uprobe-wildcards.c
new file mode 100644
index 00000000..d8815ce5
--- /dev/null
+++ b/test/triggers/uprobe-wildcards.c
@@ -0,0 +1,122 @@
+/*
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <dt_module.h>
+#include <dt_probe.h>
+#include <dt_provider.h>
+
+#define CHECK(expr) do { \
+	if (!(expr)) { \
+		fprintf(stderr, "Check failed at line %d: %s\n", __LINE__, #expr); \
+		return 1; \
+	} \
+} while (0)
+
+/* Export these to exercise both .symtab and stripped .dynsym objects. */
+int uprobe_test_data;
+int uprobe_test_alpha(void) { return 1; }
+int uprobe_test_beta(void) { return 2; }
+
+static int
+count_probe(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp, void *arg)
+{
+	int *count = arg;
+
+	(*count)++;
+	return 0;
+}
+
+typedef struct module_count {
+	int count;
+	int result;
+} module_count_t;
+
+static int
+count_module(dtrace_hdl_t *dtp, dt_module_t *dmp, void *arg)
+{
+	module_count_t *data = arg;
+
+	data->count++;
+	return data->result;
+}
+
+int
+main(int argc, char **argv)
+{
+	dtrace_hdl_t	*dtp;
+	dt_probe_t	*prp;
+	int		err, count = 0;
+	module_count_t	modules = { 0 };
+	dtrace_probedesc_t pd = {
+		.prv = "uprobe", .mod = "uprobe-wildcards-a",
+		.fun = "uprobe_test_*", .prb = "*",
+	};
+
+	CHECK(argc == 2);
+	CHECK(setenv("LD_LIBRARY_PATH", argv[1], 1) == 0);
+	CHECK((dtp = dtrace_open(DTRACE_VERSION, 0, &err)) != NULL);
+	dt_probe_init(dtp);
+	CHECK(dt_uprobe.populate(dtp) == 0);
+
+	CHECK(dt_uprobe.provide(dtp, &pd) == 4);
+	CHECK(dt_uprobe.provide(dtp, &pd) == 0);
+	pd.mod = "uprobe-wildcards-[ab]";
+	CHECK(dt_uprobe.provide(dtp, &pd) == 4);
+	pd.mod = "uprobe-wildcards-?";
+	CHECK(dt_uprobe.provide(dtp, &pd) == 0);
+	pd.prv = "uprob?";
+	pd.fun = "uprobe_test_?lpha";
+	pd.prb = "[er]*";
+	CHECK(dtrace_probe_iter(dtp, &pd, count_probe, &count) == 0);
+	CHECK(count == 4);
+	pd.prv = "uprobe";
+
+	/* Visit cached modules once each and honor callback termination. */
+	CHECK(dt_module_user_iter(dtp, "uprobe-wildcards-[ab]",
+	    count_module, &modules) == 0);
+	CHECK(modules.count == 2);
+	modules.count = 0;
+	modules.result = 7;
+	CHECK(dt_module_user_iter(dtp, "uprobe-wildcards-[ab]",
+	    count_module, &modules) == 7);
+	CHECK(modules.count == 1);
+	modules.count = 0;
+	CHECK(dt_module_user_iter(dtp, "uprobe-no-such-module-*",
+	    count_module, &modules) == 0);
+	CHECK(modules.count == 0);
+
+	pd.mod = "uprobe-wildcards-b";
+	pd.fun = "uprobe_test_alpha";
+	pd.prb = "entry";
+	CHECK((prp = dt_probe_lookup(dtp, &pd)) != NULL);
+	CHECK(strcmp(prp->desc->mod, pd.mod) == 0);
+	CHECK(strcmp(prp->desc->fun, pd.fun) == 0);
+	pd.prb = "return";
+	CHECK(dt_probe_lookup(dtp, &pd) != NULL);
+	pd.fun = "uprobe_test_data";
+	CHECK(dt_uprobe.provide(dtp, &pd) == 0);
+	CHECK(dt_probe_lookup(dtp, &pd) == NULL);
+	pd.fun = "fprintf";
+	CHECK(dt_uprobe.provide(dtp, &pd) == 0);
+	pd.prb = "no-such-probe";
+	CHECK(dt_uprobe.provide(dtp, &pd) == 0);
+
+	/* Empty components match everything, including both probe names. */
+	pd.mod = "uprobe-wildcards-b";
+	pd.fun = "";
+	pd.prb = "";
+	CHECK(dt_uprobe.provide(dtp, &pd) > 0);
+	CHECK(dt_uprobe.provide(dtp, &pd) == 0);
+	pd.mod = "";
+	pd.fun = "uprobe_test_?lpha";
+	CHECK(dt_uprobe.provide(dtp, &pd) >= 0);
+
+	dtrace_close(dtp);
+	return 0;
+}
diff --git a/test/unittest/providers/uprobe/tst.dlib-path.sh b/test/unittest/providers/uprobe/tst.dlib-path.sh
new file mode 100755
index 00000000..6c457daa
--- /dev/null
+++ b/test/unittest/providers/uprobe/tst.dlib-path.sh
@@ -0,0 +1,70 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# ASSERTION: Specifying -L does not break system-wide uprobe probes.
+#
+# @@timeout: 45
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+NWORKERS=20
+DIRNAME="$tmpdir/uprobe-dlib-path.$$.$RANDOM"
+mkdir -p "$DIRNAME/lib"
+cd "$DIRNAME" || exit 1
+
+cat > probe.c <<'EOF'
+__attribute__((noinline, visibility("default")))
+long
+churn_probe(long value)
+{
+	return value + 1;
+}
+EOF
+
+cat > worker.c <<'EOF'
+#include <stdlib.h>
+
+extern long churn_probe(long);
+
+int
+main(int argc, char **argv)
+{
+	long value, got;
+
+	if (argc != 2)
+		return 2;
+
+	value = strtol(argv[1], NULL, 0);
+	got = churn_probe(value);
+
+	return got == value + 1 ? 0 : 3;
+}
+EOF
+
+${CC:-cc} $test_cppflags -fPIC -shared -o lib/libswchurn.so probe.c || exit 1
+${CC:-cc} $test_cppflags -Llib -o worker worker.c -lswchurn || exit 1
+
+export LD_LIBRARY_PATH="$PWD/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
+
+$dtrace $dt_flags -L/nothing -c './worker 1' -qn '
+uprobe:libswchurn.so:churn_probe:entry
+{
+	printf("%ld = PID %d\n", arg0, pid);
+	exit(0);
+}
+
+profile:::tick-1s
+{
+	exit(1);
+}
+'
+
+exit $?
diff --git a/test/unittest/providers/uprobe/tst.dlopen.sh b/test/unittest/providers/uprobe/tst.dlopen.sh
new file mode 100755
index 00000000..04a281af
--- /dev/null
+++ b/test/unittest/providers/uprobe/tst.dlopen.sh
@@ -0,0 +1,135 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# ASSERTION: A system-wide uprobe fires for a library that is dlopen()ed only
+# after tracing has started.
+#
+# @@timeout: 30
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+DIRNAME="$tmpdir/uprobe-dlopen.$$.$RANDOM"
+mkdir -p "$DIRNAME/lib"
+cd "$DIRNAME" || exit 1
+
+cat > probe.c <<'EOF'
+__attribute__((noinline, visibility("default")))
+long
+lazy_probe(long value)
+{
+	return value * 3 + 1;
+}
+EOF
+
+cat > worker.c <<'EOF'
+#include <dlfcn.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <unistd.h>
+
+typedef long (*probe_f)(long);
+
+int
+main(int argc, char **argv)
+{
+	char ch;
+	int fd;
+	long got;
+	void *hdl;
+	probe_f probe;
+
+	if (argc != 2)
+		return 2;
+
+	fd = open(argv[1], O_RDONLY);
+	if (fd == -1)
+		return 3;
+	if (read(fd, &ch, 1) == -1 && errno != EINTR)
+		return 4;
+	close(fd);
+
+	hdl = dlopen("libswlazy.so", RTLD_NOW);
+	if (hdl == NULL) {
+		fprintf(stderr, "dlopen failed: %s\n", dlerror());
+		return 5;
+	}
+
+	probe = (probe_f)dlsym(hdl, "lazy_probe");
+	if (probe == NULL) {
+		fprintf(stderr, "dlsym failed: %s\n", dlerror());
+		return 6;
+	}
+
+	got = probe(17);
+	dlclose(hdl);
+
+	return got == 52 ? 0 : 7;
+}
+EOF
+
+${CC:-cc} $test_cppflags -fPIC -shared -o lib/libswlazy.so probe.c || exit 1
+if ! ${CC:-cc} $test_cppflags -o worker worker.c -ldl; then
+	${CC:-cc} $test_cppflags -o worker worker.c || exit 1
+fi
+export LD_LIBRARY_PATH="$PWD/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
+mkfifo gate
+
+dtrace_pid=
+worker_pid=
+cleanup()
+{
+	[ -n "$dtrace_pid" ] && kill "$dtrace_pid" 2>/dev/null
+	[ -n "$worker_pid" ] && kill "$worker_pid" 2>/dev/null
+}
+trap cleanup EXIT
+
+./worker gate &
+worker_pid=$!
+
+# $dtrace $dt_flags -qn '
+$dtrace $dt_flags -n '
+uprobe:libswlazy.so:lazy_probe:entry
+{
+	self->pid = pid;
+	self->expected = arg0 * 3 + 1;
+	printf("E %ld\n", arg0);
+}
+
+uprobe:libswlazy.so:lazy_probe:return
+/self->pid == pid/
+{
+	printf("R %ld (expected %ld)\n", arg1, self->expected);
+	exit(self->expected == arg1 ? 0 : 1);
+}
+
+profile:::tick-5s
+{
+	exit(1);
+}
+' > dtrace.out 2> dtrace.err &
+dtrace_pid=$!
+
+sleep 2
+printf x > gate
+
+wait "$worker_pid" || exit 1
+worker_pid=
+
+if ! wait "$dtrace_pid"; then
+	cat dtrace.err
+	cat dtrace.out
+	exit 1
+fi
+dtrace_pid=
+
+echo success
+exit 0
diff --git a/test/unittest/providers/uprobe/tst.elf-offsets.sh b/test/unittest/providers/uprobe/tst.elf-offsets.sh
new file mode 100755
index 00000000..af9fe16f
--- /dev/null
+++ b/test/unittest/providers/uprobe/tst.elf-offsets.sh
@@ -0,0 +1,278 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# ASSERTION: System-wide uprobes use correct file offsets for shared objects,
+# PIE executables, and non-PIE executables when the toolchain supports them.
+#
+# @@timeout: 45
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+DIRNAME="$tmpdir/uprobe-elf-offsets.$$.$RANDOM"
+mkdir -p "$DIRNAME/lib"
+cd "$DIRNAME" || exit 1
+
+cat > libprobe.c <<'EOF'
+__attribute__((noinline, visibility("default")))
+long
+lib_offset_probe(long value)
+{
+	return value + 101;
+}
+EOF
+
+cat > libworker.c <<'EOF'
+#include <errno.h>
+#include <fcntl.h>
+#include <stdlib.h>
+#include <unistd.h>
+
+extern long lib_offset_probe(long);
+
+static int
+wait_for_gate(const char *path)
+{
+	char ch;
+	int fd = open(path, O_RDONLY);
+
+	if (fd == -1)
+		return 1;
+	if (read(fd, &ch, 1) == -1 && errno != EINTR)
+		return 1;
+	close(fd);
+	return 0;
+}
+
+int
+main(int argc, char **argv)
+{
+	long value, got;
+
+	if (argc != 3)
+		return 2;
+	if (wait_for_gate(argv[1]) != 0)
+		return 3;
+
+	value = strtol(argv[2], NULL, 0);
+	got = lib_offset_probe(value);
+
+	return got == value + 101 ? 0 : 4;
+}
+EOF
+
+cat > pieprog.c <<'EOF'
+#include <errno.h>
+#include <fcntl.h>
+#include <stdlib.h>
+#include <unistd.h>
+
+__attribute__((noinline, visibility("default")))
+long
+pie_offset_probe(long value)
+{
+	return value + 202;
+}
+
+static int
+wait_for_gate(const char *path)
+{
+	char ch;
+	int fd = open(path, O_RDONLY);
+
+	if (fd == -1)
+		return 1;
+	if (read(fd, &ch, 1) == -1 && errno != EINTR)
+		return 1;
+	close(fd);
+	return 0;
+}
+
+int
+main(int argc, char **argv)
+{
+	long value, got;
+
+	if (argc != 3)
+		return 2;
+	if (wait_for_gate(argv[1]) != 0)
+		return 3;
+
+	value = strtol(argv[2], NULL, 0);
+	got = pie_offset_probe(value);
+
+	return got == value + 202 ? 0 : 4;
+}
+EOF
+
+cat > nopieprog.c <<'EOF'
+#include <errno.h>
+#include <fcntl.h>
+#include <stdlib.h>
+#include <unistd.h>
+
+__attribute__((noinline, visibility("default")))
+long
+nopie_offset_probe(long value)
+{
+	return value + 303;
+}
+
+static int
+wait_for_gate(const char *path)
+{
+	char ch;
+	int fd = open(path, O_RDONLY);
+
+	if (fd == -1)
+		return 1;
+	if (read(fd, &ch, 1) == -1 && errno != EINTR)
+		return 1;
+	close(fd);
+	return 0;
+}
+
+int
+main(int argc, char **argv)
+{
+	long value, got;
+
+	if (argc != 3)
+		return 2;
+	if (wait_for_gate(argv[1]) != 0)
+		return 3;
+
+	value = strtol(argv[2], NULL, 0);
+	got = nopie_offset_probe(value);
+
+	return got == value + 303 ? 0 : 4;
+}
+EOF
+
+${CC:-cc} $test_cppflags -fPIC -shared -o lib/libuoffset.so libprobe.c || exit 1
+${CC:-cc} $test_cppflags -Llib -o libworker libworker.c -luoffset || exit 1
+${CC:-cc} $test_cppflags -fPIE -pie -o pieprog pieprog.c || exit 1
+
+have_nopie=0
+if ${CC:-cc} $test_cppflags -fno-pie -no-pie -o nopieprog nopieprog.c; then
+	have_nopie=1
+else
+	echo "non-PIE executable build failed: non-PIE subtest skipped"
+fi
+
+export LD_LIBRARY_PATH="$PWD/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
+export PATH="$PWD${PATH:+:$PATH}"
+mkfifo gate
+
+cat > trace.d <<'EOF'
+uprobe:libuoffset.so:lib_offset_probe:entry
+{
+	libhit = 1;
+	printf("lib %d %ld\n", pid, arg0);
+}
+
+uprobe:pieprog:pie_offset_probe:entry
+{
+	piehit = 1;
+	printf("pie %d %ld\n", pid, arg0);
+}
+EOF
+
+if [ "$have_nopie" = 1 ]; then
+	cat >> trace.d <<'EOF'
+
+uprobe:nopieprog:nopie_offset_probe:entry
+{
+	nopiehit = 1;
+	printf("nopie %d %ld\n", pid, arg0);
+}
+EOF
+fi
+
+cat >> trace.d <<EOF
+
+profile:::tick-1s
+EOF
+if [ "$have_nopie" = 1 ]; then
+	cat >> trace.d <<'EOF'
+/libhit && piehit && nopiehit/
+EOF
+else
+	cat >> trace.d <<'EOF'
+/libhit && piehit/
+EOF
+fi
+cat >> trace.d <<'EOF'
+{
+	exit(0);
+}
+
+profile:::tick-12s
+{
+	exit(1);
+}
+EOF
+
+dtrace_pid=
+pids=
+cleanup()
+{
+	[ -n "$dtrace_pid" ] && kill "$dtrace_pid" 2>/dev/null
+	[ -n "$pids" ] && kill $pids 2>/dev/null
+}
+trap cleanup EXIT
+
+./libworker gate 10 & pids="$pids $!"
+./pieprog gate 20 & pids="$pids $!"
+if [ "$have_nopie" = 1 ]; then
+	./nopieprog gate 30 & pids="$pids $!"
+fi
+
+$dtrace $dt_flags -qs trace.d > dtrace.out 2> dtrace.err &
+dtrace_pid=$!
+
+sleep 2
+expected=2
+[ "$have_nopie" = 1 ] && expected=3
+i=0
+while [ $i -lt $expected ]; do
+	printf x
+	i=$((i + 1))
+done > gate
+
+for pid in $pids; do
+	wait "$pid" || exit 1
+done
+pids=
+
+if ! wait "$dtrace_pid"; then
+	cat dtrace.err
+	cat dtrace.out
+	exit 1
+fi
+dtrace_pid=
+
+for name in lib pie; do
+	if ! grep -q "^$name " dtrace.out; then
+		echo "ERROR: missing $name uprobe hit"
+		cat dtrace.err
+		cat dtrace.out
+		exit 1
+	fi
+done
+if [ "$have_nopie" = 1 ] && ! grep -q '^nopie ' dtrace.out; then
+	echo "ERROR: missing nopie uprobe hit"
+	cat dtrace.err
+	cat dtrace.out
+	exit 1
+fi
+
+echo success
+exit 0
diff --git a/test/unittest/providers/uprobe/tst.lifecycle.sh b/test/unittest/providers/uprobe/tst.lifecycle.sh
new file mode 100755
index 00000000..2c38a235
--- /dev/null
+++ b/test/unittest/providers/uprobe/tst.lifecycle.sh
@@ -0,0 +1,134 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# ASSERTION: A system-wide uprobe can be enabled, fired, detached, and enabled
+# again repeatedly for the same ELF object.
+#
+# @@timeout: 45
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+DIRNAME="$tmpdir/uprobe-lifecycle.$$.$RANDOM"
+mkdir -p "$DIRNAME/lib"
+cd "$DIRNAME" || exit 1
+
+cat > probe.c <<'EOF'
+__attribute__((noinline, visibility("default")))
+long
+life_probe(long value)
+{
+	return value + 1;
+}
+EOF
+
+cat > worker.c <<'EOF'
+#include <errno.h>
+#include <fcntl.h>
+#include <stdlib.h>
+#include <unistd.h>
+
+extern long life_probe(long);
+
+static int
+wait_for_gate(const char *path)
+{
+	char ch;
+	int fd = open(path, O_RDONLY);
+
+	if (fd == -1)
+		return 1;
+	if (read(fd, &ch, 1) == -1 && errno != EINTR)
+		return 1;
+	close(fd);
+	return 0;
+}
+
+int
+main(int argc, char **argv)
+{
+	long value, got;
+
+	if (argc != 3)
+		return 2;
+
+	value = strtol(argv[1], NULL, 0);
+	if (wait_for_gate(argv[2]) != 0)
+		return 3;
+
+	got = life_probe(value);
+
+	return got == value + 1 ? 0 : 4;
+}
+EOF
+
+${CC:-cc} $test_cppflags -fPIC -shared -o lib/libswlife.so probe.c || exit 1
+${CC:-cc} $test_cppflags -Llib -o worker worker.c -lswlife || exit 1
+export LD_LIBRARY_PATH="$PWD/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
+
+dtrace_pid=
+worker_pid=
+cleanup()
+{
+	[ -n "$dtrace_pid" ] && kill "$dtrace_pid" 2>/dev/null
+	[ -n "$worker_pid" ] && kill "$worker_pid" 2>/dev/null
+}
+trap cleanup EXIT
+
+i=1
+while [ $i -le 5 ]; do
+	gate="gate.$i"
+	mkfifo "$gate"
+	./worker "$i" "$gate" &
+	worker_pid=$!
+
+	$dtrace $dt_flags -qn '
+uprobe:libswlife.so:life_probe:entry
+{
+	printf("%ld\n", arg0);
+	exit(arg0 != $1);
+}
+
+profile:::tick-8s
+{
+	exit(1);
+}
+' $i > "dtrace.$i.out" 2> "dtrace.$i.err" &
+	dtrace_pid=$!
+
+	sleep 2
+	printf x > "$gate"
+
+	if ! wait "$worker_pid"; then
+		cat "dtrace.$i.err"
+		cat "dtrace.$i.out"
+		exit 1
+	fi
+	worker_pid=
+
+	if ! wait "$dtrace_pid"; then
+		cat "dtrace.$i.err"
+		cat "dtrace.$i.out"
+		exit 1
+	fi
+	dtrace_pid=
+
+	if ! grep -qx "$i" "dtrace.$i.out"; then
+		echo "ERROR: iteration $i did not report the expected argument"
+		cat "dtrace.$i.err"
+		cat "dtrace.$i.out"
+		exit 1
+	fi
+
+	i=$((i + 1))
+done
+
+echo success
+exit 0
diff --git a/test/unittest/providers/uprobe/tst.multicpu.r b/test/unittest/providers/uprobe/tst.multicpu.r
new file mode 100644
index 00000000..8f30a28f
--- /dev/null
+++ b/test/unittest/providers/uprobe/tst.multicpu.r
@@ -0,0 +1,4 @@
+1st CPU is A
+2nd CPU is B
+cpu A
+cpu B
diff --git a/test/unittest/providers/uprobe/tst.multicpu.r.p b/test/unittest/providers/uprobe/tst.multicpu.r.p
new file mode 100755
index 00000000..89a1dbb4
--- /dev/null
+++ b/test/unittest/providers/uprobe/tst.multicpu.r.p
@@ -0,0 +1,8 @@
+#!/usr/bin/gawk -f
+
+# 1st CPU is %d
+/^1st/ { cpu_a = $NF; $NF = "A"; print; next; }
+# 2nd CPU is %d
+/^2nd/ { cpu_b = $NF; $NF = "B"; print; next; }
+# cpu %d
+/^cpu/ { $NF = ($NF == cpu_a) ? "A" : ($NF == cpu_b) ? "B" : "X"; print; }
diff --git a/test/unittest/providers/uprobe/tst.multicpu.sh b/test/unittest/providers/uprobe/tst.multicpu.sh
new file mode 100755
index 00000000..9a4760ab
--- /dev/null
+++ b/test/unittest/providers/uprobe/tst.multicpu.sh
@@ -0,0 +1,138 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# ASSERTION: A system-wide uprobe can fires on every CPU allowed by the current
+#	     cpuset.
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+DIRNAME="$tmpdir/uprobe-allcpus.$$.$RANDOM"
+mkdir -p "$DIRNAME/lib"
+cd "$DIRNAME" || exit 1
+
+cat > probe.c <<'EOF'
+#include <unistd.h>
+
+__attribute__((noinline, visibility("default")))
+void
+cpu_probe(unsigned long value)
+{
+	__asm__ volatile("" : : "r" (value) : "memory");
+}
+
+void
+run_probes(void)
+{
+	int i;
+
+	for (i = 0; i < 100; i++) {
+		cpu_probe((unsigned long)i);
+		usleep(10000);
+	}
+}
+EOF
+
+cat > worker.c <<'EOF'
+extern void run_probes(void);
+int main(void) { run_probes(); return 0; }
+EOF
+
+${CC:-cc} $test_cppflags -fPIC -shared -o lib/libswcpu.so probe.c || exit 1
+${CC:-cc} $test_cppflags -Llib -o worker worker.c -lswcpu || exit 1
+
+export LD_LIBRARY_PATH="$PWD/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
+
+# Expand the affinity list and choose up to two actual allowed CPUs.  This is
+# cpuset-safe and intentionally does not assume that CPU 0 is available.
+cpuspec=$(awk '/^Cpus_allowed_list:/ { print $2 }' /proc/self/status)
+cpus=()
+IFS=',' read -ra ranges <<< "$cpuspec"
+for range in "${ranges[@]}"; do
+	if [[ $range == *-* ]]; then
+		lo=${range%-*}; hi=${range#*-}
+		for ((cpu = lo; cpu <= hi; cpu++)); do
+			cpus+=("$cpu")
+		done
+	else
+		cpus+=("$range")
+	fi
+done
+
+[ ${#cpus[@]} -gt 0 ] || { echo ERROR: no allowed CPUs; exit 1; }
+[ ${#cpus[@]} -gt 2 ] || { echo SKIPPED: not enough CPUs; exit 2; }
+
+# We do not want to use CPU 0 because that is specified in perf_event_open()
+cpu_a=${cpus[1]}
+cpu_b=${cpus[${#cpus[@]}-1]}
+
+dtrace_pid=
+workers=
+cleanup()
+{
+	[ -n "$dtrace_pid" ] && kill "$dtrace_pid" 2>/dev/null
+	[ -n "$workers" ] && kill $workers 2>/dev/null
+}
+trap cleanup EXIT
+
+$dtrace $dt_flags -qn '
+dtrace:::BEGIN {
+	printf("1st CPU is %d\n2nd CPU is %d\n", $1, $2);
+}
+
+uprobe:libswcpu.so:cpu_probe:entry
+/seen[cpu] == 0/
+{
+	seen[cpu] = 1;
+	printf("cpu %d\n", cpu);
+}
+
+uprobe:libswcpu.so:cpu_probe:entry
+/seen[$1] > 0 && seen[$2] > 0/
+{
+	exit(0);
+}
+
+profile:::tick-12s
+{
+	exit(1);
+}
+' $cpu_a $cpu_b > dtrace.out &
+dtrace_pid=$!
+
+sleep 2
+taskset -c "$cpu_a" ./worker & w1=$!; workers="$workers $w1"
+if [ "$cpu_b" != "$cpu_a" ]; then
+	taskset -c "$cpu_b" ./worker & w2=$!; workers="$workers $w2"
+fi
+
+wait "$w1" || exit 1
+if [ -n "${w2:-}" ]; then
+	wait "$w2" || exit 1
+fi
+workers=
+
+mv $DIRNAME /tmp/check-it
+
+if ! wait "$dtrace_pid"; then
+	cat dtrace.out
+	exit 1
+fi
+dtrace_pid=
+
+cat dtrace.out
+for cpu in "$cpu_a" "$cpu_b"; do
+	if ! grep -qx "cpu $cpu" dtrace.out; then
+		echo "ERROR: no uprobe fired on allowed CPU $cpu"
+		exit 1
+	fi
+done
+
+exit 0
diff --git a/test/unittest/providers/uprobe/tst.multicpu.x b/test/unittest/providers/uprobe/tst.multicpu.x
new file mode 100755
index 00000000..1a1a05c8
--- /dev/null
+++ b/test/unittest/providers/uprobe/tst.multicpu.x
@@ -0,0 +1,9 @@
+#!/bin/bash
+
+# Skip test if taskset is not available.
+if ! command -v taskset > /dev/null; then
+	echo "taskset not found, skipping test"
+	exit 2
+fi
+
+exit 0
diff --git a/test/unittest/providers/uprobe/tst.multipid.r b/test/unittest/providers/uprobe/tst.multipid.r
new file mode 100644
index 00000000..e2d34299
--- /dev/null
+++ b/test/unittest/providers/uprobe/tst.multipid.r
@@ -0,0 +1,20 @@
+0 = PID NNN
+1 = PID NNN
+2 = PID NNN
+3 = PID NNN
+4 = PID NNN
+5 = PID NNN
+6 = PID NNN
+7 = PID NNN
+8 = PID NNN
+9 = PID NNN
+11 = PID NNN
+10 = PID NNN
+12 = PID NNN
+13 = PID NNN
+14 = PID NNN
+15 = PID NNN
+16 = PID NNN
+17 = PID NNN
+18 = PID NNN
+19 = PID NNN
diff --git a/test/unittest/providers/uprobe/tst.multipid.r.p b/test/unittest/providers/uprobe/tst.multipid.r.p
new file mode 100755
index 00000000..a78716f1
--- /dev/null
+++ b/test/unittest/providers/uprobe/tst.multipid.r.p
@@ -0,0 +1,4 @@
+#!/usr/bin/gawk -f
+
+# n = PID NNN
+$3 == "PID" { $4 = "NNN"; print; }
diff --git a/test/unittest/providers/uprobe/tst.multipid.sh b/test/unittest/providers/uprobe/tst.multipid.sh
new file mode 100755
index 00000000..023092bd
--- /dev/null
+++ b/test/unittest/providers/uprobe/tst.multipid.sh
@@ -0,0 +1,117 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# ASSERTION: A system-wide uprobe remains active for many short-lived
+# processes created after tracing starts.
+#
+# @@timeout: 45
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+NWORKERS=20
+DIRNAME="$tmpdir/uprobe-multipid.$$.$RANDOM"
+mkdir -p "$DIRNAME/lib"
+cd "$DIRNAME" || exit 1
+
+cat > probe.c <<'EOF'
+__attribute__((noinline, visibility("default")))
+long
+churn_probe(long value)
+{
+	return value + 1;
+}
+EOF
+
+cat > worker.c <<'EOF'
+#include <stdlib.h>
+
+extern long churn_probe(long);
+
+int
+main(int argc, char **argv)
+{
+	long value, got;
+
+	if (argc != 2)
+		return 2;
+
+	value = strtol(argv[1], NULL, 0);
+	got = churn_probe(value);
+
+	return got == value + 1 ? 0 : 3;
+}
+EOF
+
+${CC:-cc} $test_cppflags -fPIC -shared -o lib/libswchurn.so probe.c || exit 1
+${CC:-cc} $test_cppflags -Llib -o worker worker.c -lswchurn || exit 1
+
+export LD_LIBRARY_PATH="$PWD/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
+
+dtrace_pid=
+pids=
+cleanup()
+{
+	[ -n "$dtrace_pid" ] && kill "$dtrace_pid" 2>/dev/null
+	[ -n "$pids" ] && kill $pids 2>/dev/null
+}
+trap cleanup EXIT
+
+$dtrace $dt_flags -qn '
+uprobe:libswchurn.so:churn_probe:entry
+/seen[pid] == 0/
+{
+	seen[pid] = 1;
+	hits++;
+	printf("%ld = PID %d\n", arg0, pid);
+}
+
+profile:::tick-1s
+/hits >= $1/
+{
+	exit(0);
+}
+
+profile:::tick-20s
+{
+	exit(1);
+}
+' $NWORKERS > dtrace.out &
+dtrace_pid=$!
+
+sleep 2
+
+i=0
+while [ $i -lt $NWORKERS ]; do
+	./worker "$i" &
+	pids="$pids $!"
+	i=$((i + 1))
+done
+
+for pid in $pids; do
+	wait "$pid" || exit 1
+done
+pids=
+
+if ! wait "$dtrace_pid"; then
+	cat dtrace.out
+	exit 1
+fi
+dtrace_pid=
+
+cat dtrace.out
+if [ "$(grep PID dtrace.out | sort -u | wc -l)" != "$NWORKERS" ]; then
+	echo "ERROR: expected $NWORKERS distinct traced processes"
+	cat dtrace.out
+	exit 1
+fi
+
+echo success
+exit 0
diff --git a/test/unittest/providers/uprobe/tst.multithread.sh b/test/unittest/providers/uprobe/tst.multithread.sh
new file mode 100755
index 00000000..3c44546f
--- /dev/null
+++ b/test/unittest/providers/uprobe/tst.multithread.sh
@@ -0,0 +1,160 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# ASSERTION: System-wide uprobe entry and return probes preserve per-thread
+# self state under concurrent calls from multiple threads.
+#
+# @@timeout: 45
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+NTHREADS=4
+NITER=20
+EXPECTED=$((NTHREADS * NITER))
+DIRNAME="$tmpdir/uprobe-multithread.$$.$RANDOM"
+mkdir -p "$DIRNAME/lib"
+cd "$DIRNAME" || exit 1
+
+cat > probe.c <<'EOF'
+__attribute__((noinline, visibility("default")))
+long
+thread_probe(long thread_id, long iter)
+{
+	return thread_id * 100000 + iter;
+}
+EOF
+
+cat > worker.c <<EOF
+#include <pthread.h>
+#include <stdint.h>
+#include <unistd.h>
+
+#define NTHREADS $NTHREADS
+#define NITER $NITER
+
+extern long thread_probe(long, long);
+
+static void *
+run_thread(void *arg)
+{
+	long id = (long)(intptr_t)arg;
+	long i;
+
+	for (i = 0; i < NITER; i++) {
+		long got = thread_probe(id, i);
+
+		if (got != id * 100000 + i)
+			return (void *)1;
+		usleep(1000);
+	}
+
+	return NULL;
+}
+
+int
+main(void)
+{
+	pthread_t threads[NTHREADS];
+	long i;
+
+	for (i = 0; i < NTHREADS; i++) {
+		if (pthread_create(&threads[i], NULL, run_thread,
+		    (void *)(intptr_t)i) != 0)
+			return 2;
+	}
+
+	for (i = 0; i < NTHREADS; i++) {
+		void *status = NULL;
+
+		if (pthread_join(threads[i], &status) != 0 || status != NULL)
+			return 3;
+	}
+
+	return 0;
+}
+EOF
+
+${CC:-cc} $test_cppflags -fPIC -shared -o lib/libswthread.so probe.c || exit 1
+${CC:-cc} $test_cppflags -Llib -o worker worker.c -lswthread -pthread || exit 1
+export LD_LIBRARY_PATH="$PWD/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
+
+dtrace_pid=
+worker_pid=
+cleanup()
+{
+	[ -n "$dtrace_pid" ] && kill "$dtrace_pid" 2>/dev/null
+	[ -n "$worker_pid" ] && kill "$worker_pid" 2>/dev/null
+}
+trap cleanup EXIT
+
+$dtrace $dt_flags -qn '
+BEGIN
+{
+	entries = 0;
+	bad = 0;
+	tids = 0;
+}
+
+uprobe:libswthread.so:thread_probe:entry
+{
+	entries++;
+	self->active = 1;
+	self->expected = arg0 * 100000 + arg1;
+}
+
+uprobe:libswthread.so:thread_probe:entry
+/seen[tid] == 0/
+{
+	seen[tid] = 1;
+	tids++;
+}
+
+uprobe:libswthread.so:thread_probe:return
+/self->active/
+{
+	returns++;
+	bad += arg1 != self->expected;
+	self->active = 0;
+}
+
+uprobe:libswthread.so:thread_probe:return
+/returns == $1/
+{
+	exit(bad != 0 || entries != $1 || tids != $2);
+}
+
+profile:::tick-20s
+{
+	exit(1);
+}
+' $EXPECTED $NTHREADS > dtrace.out 2> dtrace.err &
+dtrace_pid=$!
+
+sleep 2
+./worker &
+worker_pid=$!
+
+if ! wait "$worker_pid"; then
+	cat dtrace.err
+	cat dtrace.out
+	exit 1
+fi
+worker_pid=
+
+if ! wait "$dtrace_pid"; then
+	cat dtrace.err
+	cat dtrace.out
+	exit 1
+fi
+dtrace_pid=
+
+echo success
+exit 0
diff --git a/test/unittest/providers/uprobe/tst.probespec.sh b/test/unittest/providers/uprobe/tst.probespec.sh
new file mode 100755
index 00000000..ccf2f5fc
--- /dev/null
+++ b/test/unittest/providers/uprobe/tst.probespec.sh
@@ -0,0 +1,68 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# ASSERTION: Exact and globbed system-wide uprobe descriptions create probes
+# with canonical entry and return names.
+#
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+DIRNAME="$tmpdir/uprobe-probespec.$$.$RANDOM"
+mkdir -p "$DIRNAME/lib"
+cd "$DIRNAME" || exit 1
+
+cat > probe.c <<'EOF'
+__attribute__((noinline, visibility("default")))
+long named_probe(long value) { return value + 1; }
+EOF
+${CC:-cc} $test_cppflags -fPIC -shared -o lib/libswpspec.so probe.c || exit 1
+export LD_LIBRARY_PATH="$PWD/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
+
+check()
+{
+	spec=$1
+	shift
+
+	if ! $dtrace $dt_flags -l -n "$spec" > list.out 2> list.err; then
+		cat list.err
+		exit 1
+	fi
+
+	awk '$2 == "uprobe" && $3 == "libswpspec.so" &&
+	    $4 == "named_probe" { print $5 }' list.out | sort -u > names.out
+	printf '%s\n' "$@" | sort -u > expected.out
+	if ! diff -u expected.out names.out; then
+		echo "ERROR: wrong probes for $spec"
+		cat list.err
+		cat list.out
+		exit 1
+	fi
+}
+
+check 'uprobe:libswpspec.so:named_probe:entry' entry
+check 'uprobe:libswpspec.so:named_probe:return' return
+check 'uprobe:libswpspec.so:named_probe:e*' entry
+check 'uprobe:libswpspec.so:named_probe:ret*' return
+check 'uprobe:libswpspec.so:named_probe:*' entry return
+check 'uprobe:libswpspec.so:named_probe:' entry return
+
+for spec in \
+    'uprobe:libswpspec.so:named_probe:offset' \
+    'uprobe:libswpspec.so:no_such_function:entry' \
+    'uprobe:no_such_module.so:named_probe:entry'; do
+	if $dtrace $dt_flags -e -n "$spec" > /dev/null 2>&1; then
+		echo "ERROR: unexpectedly matched $spec"
+		exit 1
+	fi
+done
+
+echo success
+exit 0
diff --git a/test/unittest/providers/uprobe/tst.search-path.sh b/test/unittest/providers/uprobe/tst.search-path.sh
new file mode 100755
index 00000000..5ee8ec9d
--- /dev/null
+++ b/test/unittest/providers/uprobe/tst.search-path.sh
@@ -0,0 +1,91 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# ASSERTION: Userspace modules are resolved in LD_LIBRARY_PATH/PATH order,
+# including empty path components, the current directory, and relative search
+# paths.
+#
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+DIRNAME="$tmpdir/uprobe-search-path.$$.$RANDOM"
+mkdir -p "$DIRNAME/A" "$DIRNAME/B" "$DIRNAME/bin" "$DIRNAME/sub"
+cd "$DIRNAME" || exit 1
+
+cat > a.c <<'EOF'
+__attribute__((noinline, visibility("default"))) void from_a(void) {}
+EOF
+cat > b.c <<'EOF'
+__attribute__((noinline, visibility("default"))) void from_b(void) {}
+EOF
+cat > cwd.c <<'EOF'
+__attribute__((noinline, visibility("default"))) void from_cwd(void) {}
+EOF
+cat > path.c <<'EOF'
+__attribute__((noinline, visibility("default"))) void from_path(void) {}
+int main(void) { from_path(); return 0; }
+EOF
+cat > relative.c <<'EOF'
+__attribute__((noinline, visibility("default"))) void from_relative(void) {}
+EOF
+
+${CC:-cc} $test_cppflags -fPIC -shared -o A/libchoice.so a.c || exit 1
+${CC:-cc} $test_cppflags -fPIC -shared -o B/libchoice.so b.c || exit 1
+${CC:-cc} $test_cppflags -fPIC -shared -o libcwd.so cwd.c || exit 1
+${CC:-cc} $test_cppflags -o bin/swpathprog path.c || exit 1
+${CC:-cc} $test_cppflags -fPIC -shared -o sub/librelative.so relative.c || exit 1
+
+# Retain the runner's path to libdtrace after the test's search directories.
+match()
+{
+	env_ld="$1${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
+	env_path=$2
+	spec=$3
+	if ! LD_LIBRARY_PATH="$env_ld" PATH="$env_path" \
+	    "$dtrace" $dt_flags -e -n "$spec" > dtrace.out 2> dtrace.err; then
+		echo "ERROR: did not resolve $spec"
+		cat dtrace.err
+		exit 1
+	fi
+}
+
+no_match()
+{
+	env_ld="$1${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
+	env_path=$2
+	spec=$3
+	if LD_LIBRARY_PATH="$env_ld" PATH="$env_path" \
+	    "$dtrace" $dt_flags -e -n "$spec" > dtrace.out 2> dtrace.err; then
+		echo "ERROR: unexpectedly resolved $spec"
+		exit 1
+	fi
+}
+
+sys_path=${PATH:-/usr/bin:/bin}
+
+# Search order must select one of two objects with the same module name.
+match "$PWD/A:$PWD/B" "$sys_path" 'uprobe:libchoice.so:from_a:entry'
+no_match "$PWD/A:$PWD/B" "$sys_path" 'uprobe:libchoice.so:from_b:entry'
+match "$PWD/B:$PWD/A" "$sys_path" 'uprobe:libchoice.so:from_b:entry'
+no_match "$PWD/B:$PWD/A" "$sys_path" 'uprobe:libchoice.so:from_a:entry'
+
+# Empty components denote '.', and duplicate components are harmless.
+match ":$PWD/A::$PWD/A" "$sys_path" 'uprobe:libcwd.so:from_cwd:entry'
+
+# Executables can be found through PATH.
+match "" "$PWD/bin:$sys_path" 'uprobe:swpathprog:from_path:entry'
+
+# Relative search paths resolve modules by their basename.
+no_match "" "$sys_path" 'uprobe:librelative.so:from_relative:entry'
+match "sub" "$sys_path" 'uprobe:librelative.so:from_relative:entry'
+
+echo success
+exit 0
diff --git a/test/unittest/providers/uprobe/tst.shlib.sh b/test/unittest/providers/uprobe/tst.shlib.sh
new file mode 100755
index 00000000..a4596166
--- /dev/null
+++ b/test/unittest/providers/uprobe/tst.shlib.sh
@@ -0,0 +1,81 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# ASSERTION: A system-wide uprobe probe in a shared library works.
+#
+# @@timeout: 45
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+DIRNAME="$tmpdir/uprobe-shlib.$$.$RANDOM"
+mkdir -p "$DIRNAME/lib"
+cd "$DIRNAME" || exit 1
+
+cat > probe.c <<'EOF'
+__attribute__((noinline, visibility("default")))
+long
+churn_probe(long value)
+{
+	return value + 1;
+}
+EOF
+
+cat > worker.c <<'EOF'
+#include <stdlib.h>
+
+extern long churn_probe(long);
+
+int
+main(int argc, char **argv)
+{
+	long value, got;
+
+	if (argc != 2)
+		return 2;
+
+	value = strtol(argv[1], NULL, 0);
+	got = churn_probe(value);
+
+	return got == value + 1 ? 0 : 3;
+}
+EOF
+
+${CC:-cc} $test_cppflags -fPIC -shared -o lib/libswchurn.so probe.c || exit 1
+${CC:-cc} $test_cppflags -Llib -o worker worker.c -lswchurn || exit 1
+
+export LD_LIBRARY_PATH="$PWD/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
+
+if ! $dtrace $dt_flags -c "./worker 17" -qn '
+uprobe:libswchurn.so:churn_probe:entry
+{
+	printf("%ld = PID %d\n", arg0, pid);
+	exit(arg0 != 17);
+}
+
+profile:::tick-1s
+{
+	exit(1);
+}
+' > dtrace.out 2> dtrace.err; then
+	cat dtrace.err
+	cat dtrace.out
+	exit 1
+fi
+
+if ! grep -Eq '^17 = PID [0-9]+$' dtrace.out; then
+	echo "ERROR: shared-library probe did not report the expected argument"
+	cat dtrace.err
+	cat dtrace.out
+	exit 1
+fi
+
+echo success
+exit 0
diff --git a/test/unittest/providers/uprobe/tst.symbols.sh b/test/unittest/providers/uprobe/tst.symbols.sh
new file mode 100755
index 00000000..e46c1f76
--- /dev/null
+++ b/test/unittest/providers/uprobe/tst.symbols.sh
@@ -0,0 +1,52 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# ASSERTION: System-wide uprobes accept defined function symbols in stripped
+# DSOs, and reject data, undefined, and nonexistent symbols.
+#
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+DIRNAME="$tmpdir/uprobe-symbols.$$.$RANDOM"
+mkdir -p "$DIRNAME/lib"
+cd "$DIRNAME" || exit 1
+
+cat > symbols.c <<'EOF'
+extern void undefined_function(void);
+__attribute__((visibility("default"))) long exported_data = 123;
+__attribute__((noinline, visibility("default"))) long exported_function(void)
+{
+	if (exported_data == -1)
+		undefined_function();
+	return exported_data;
+}
+EOF
+
+${CC:-cc} $test_cppflags -fPIC -shared -o lib/libswsymbols.so symbols.c || exit 1
+${STRIP:-strip} --strip-unneeded lib/libswsymbols.so || exit 1
+export LD_LIBRARY_PATH="$PWD/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
+
+if ! $dtrace $dt_flags -e -n \
+    'uprobe:libswsymbols.so:exported_function:entry' >/dev/null 2>&1; then
+	echo ERROR: exported function was not found in stripped DSO
+	exit 1
+fi
+
+for symbol in exported_data undefined_function does_not_exist; do
+	if $dtrace $dt_flags -e -n \
+	    "uprobe:libswsymbols.so:$symbol:entry" >/dev/null 2>&1; then
+		echo "ERROR: non-function or undefined symbol $symbol was accepted"
+		exit 1
+	fi
+done
+
+echo success
+exit 0
diff --git a/test/unittest/providers/uprobe/tst.systemwide.sh b/test/unittest/providers/uprobe/tst.systemwide.sh
new file mode 100755
index 00000000..e934d64d
--- /dev/null
+++ b/test/unittest/providers/uprobe/tst.systemwide.sh
@@ -0,0 +1,158 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# ASSERTION: A system-wide uprobe fires for existing and newly-created,
+# unrelated processes, and supplies entry arguments and return values.
+#
+# @@timeout: 30
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+DIRNAME="$tmpdir/uprobe-systemwide.$$.$RANDOM"
+mkdir -p "$DIRNAME/lib"
+cd "$DIRNAME" || exit 1
+
+cat > probe.c <<'EOF'
+__attribute__((noinline, visibility("default")))
+long
+sw_probe(long a, long b, long c, long d, long e, long f)
+{
+	return a + b + c + d + e + f;
+}
+EOF
+
+cat > worker.c <<'EOF'
+#include <errno.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+
+extern long sw_probe(long, long, long, long, long, long);
+
+int
+main(int argc, char **argv)
+{
+	char ch;
+	long base, got;
+	int fd;
+
+	if (argc != 3)
+		return 2;
+
+	fd = open(argv[1], O_RDONLY);
+	if (fd == -1)
+		return 3;
+	if (read(fd, &ch, 1) == -1 && errno != EINTR)
+		return 4;
+	close(fd);
+
+	base = strtol(argv[2], NULL, 0);
+	got = sw_probe(base, base + 1, base + 2, base + 3, base + 4,
+	    base + 5);
+
+	return got == base * 6 + 15 ? 0 : 5;
+}
+EOF
+
+${CC:-cc} $test_cppflags -fPIC -shared -o lib/libswuprobe.so probe.c || exit 1
+${CC:-cc} $test_cppflags -Llib -o worker worker.c -lswuprobe || exit 1
+
+export LD_LIBRARY_PATH="$PWD/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
+mkfifo gate
+
+pids=
+dtrace_pid=
+cleanup()
+{
+	[ -n "$dtrace_pid" ] && kill "$dtrace_pid" 2>/dev/null
+	[ -n "$pids" ] && kill $pids 2>/dev/null
+}
+trap cleanup EXIT
+
+# These workers exist before DTrace attaches.  They are unrelated to DTrace
+# and wait until the tracing process has had time to enable its perf events.
+./worker gate 10 & p1=$!; pids="$pids $p1"
+./worker gate 20 & p2=$!; pids="$pids $p2"
+
+$dtrace $dt_flags -qn '
+dtrace:::BEGIN
+{
+	bad = 0;
+}
+
+uprobe:libswuprobe.so:sw_probe:entry
+{
+	entries++;
+	self->expected = arg0 + arg1 + arg2 + arg3 + arg4 + arg5;
+	bad += arg1 != arg0 + 1 || arg2 != arg0 + 2 ||
+	    arg3 != arg0 + 3 || arg4 != arg0 + 4 || arg5 != arg0 + 5;
+	bad += probemod != "libswuprobe.so" || probefunc != "sw_probe" ||
+	    probename != "entry";
+	printf("E %d %d %ld\n", pid, tid, self->expected);
+}
+
+/* A second clause must share the underlying uprobe and still be called. */
+uprobe:libswuprobe.so:sw_probe:entry
+{
+	extra_entries++;
+}
+
+uprobe:libswuprobe.so:sw_probe:return
+{
+	returns++;
+	bad += arg1 != self->expected;
+	self->expected = 0;
+	printf("R %d %d %ld\n", pid, tid, arg1);
+}
+
+uprobe:libswuprobe.so:sw_probe:return
+/ returns == 3 /
+{
+	exit(bad != 0 || entries != 3 || extra_entries != 3);
+}
+
+profile:::tick-12s
+{
+	exit(1);
+}
+' > dtrace.out 2> dtrace.err &
+dtrace_pid=$!
+
+sleep 2
+printf 'xx' > gate
+
+# This worker is created only after the probe has been enabled.
+./worker /dev/null 30 & p3=$!; pids="$pids $p3"
+
+wait "$p1" || exit 1
+wait "$p2" || exit 1
+wait "$p3" || exit 1
+pids=
+
+if ! wait "$dtrace_pid"; then
+	cat dtrace.err
+	cat dtrace.out
+	exit 1
+fi
+dtrace_pid=
+
+if [ "$(awk '$1 == "E" { n++ } END { print n + 0 }' dtrace.out)" != 3 ] ||
+   [ "$(awk '$1 == "R" { n++ } END { print n + 0 }' dtrace.out)" != 3 ] ||
+   [ "$(awk '$1 == "E" { print $2 }' dtrace.out | sort -u | wc -l)" != 3 ]; then
+	echo ERROR: expected one entry and return from each of three processes
+	cat dtrace.err
+	cat dtrace.out
+	exit 1
+fi
+
+echo success
+exit 0
-- 
2.52.0

