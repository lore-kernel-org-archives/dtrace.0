Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794255059;
	b=HcsT84rDvi1AuwyLbMDw7ybey5qGfVT9+u+vj3le7m2SPj1jxNHSlnEMF/1O2j4XF6xI
	 eHrzigREzmQM4wVlbR+37myFBEOxDYWZ34/wNChMuN2mvtXh1EEIKhFzOA/j6GD61OgrX
	 KsT917Nr4q/AGyy/KsitwL8TFvn8n0+hvI5BEQ511dRYroyFN2Y45+zWqzEJBEep08oDb
	 vOoSnmTTWQC9Tcg9UD4ndp2a/uSMJWznwBttWIykedVLiVOIZDlCJmjeh7rFGXIgvJ3R7
	 MRwwqXvKZmlTLdbyBA+KECn8FNuUY80tnppaC0X4LRAiobAGQ8p5Y1t4UaARS3L0oaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794255059;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Subject:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID;
	bh=cilYoBFykNE9Om33tb3xeellCiMrLAwdoRwsrytV++A=;
	b=COsqNGO1s642jPwin+gcKAwbHYxkUFVOCCgFNoLO8sllWLfvaLwWyvwcRpIkrSUy3E76
	 jUQFoLVyWWV9S9NO/aZ5UH/RSs+Yi2aEwzmBHyBAyEcJ1et4n5ZdnUGdnEG4l9DFbFCJg
	 +VEx6jtfp7jk4keocozKd9gPkjglKOEyu/0wmqlpMq72OiUTmZx0vADx2sUizlYDJl2oD
	 EG4vZ5xfHyPM1oV98w7HPAXy5miRiravxorTS5esqfFuAuBNaAHDo7Y1yc2lL38Cx/AIX
	 RAYy44iVBwk6n9kOjTt9O0yPxh8T/Fk9oJ6OrggrhFLTj+EU9IotRy9kAK0/R5nkoRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=ZQt5Emzq;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=B5c4iDMb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E25606A31C
	for <dtrace@lists.linux.dev>; Mon,  9 Nov 2026 20:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40E25606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=ZQt5Emzq;
	dkim=pass (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=B5c4iDMb
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9EH8961240611
	for <dtrace@lists.linux.dev>; Mon, 9 Nov 2026 20:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=cilYoBFykNE9Om33tb3xeellCiMrLAwdoRwsrytV++A=; b=
	ZQt5EmzqbFayhQ4bNIi4bT3dLFwqOm1L76HG4wZi/fueC9HViPvng+8ZfQXX2noX
	La2mv57IH1Oz+Lvd7rZlvI7e5+6a3TJFUFzZuouRFZ/15k+LTfKIN22fUuGdGU/2
	1fokmLzYeZugHndW797OmPSaIZV3zPrNskY1/kx65o9HYAidWmsFVCEc4BgxgoSI
	7jwYCMZfhmDuH+1SMsfCfNmHMf+icFHwizBn7lGh2SRKIa6OBJIjecF/qOsoXzGy
	wgeKt2T8sQwVPvUkBrlWgrGiuOEd0ihVwc0dpTvq//i9kytGFZSn1AXckA/nlYOY
	B3wfkncIp8ShGB8X7Dky0g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hstdbk1w5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Nov 2026 20:10:57 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9Hrjq22583285
	for <dtrace@lists.linux.dev>; Mon, 9 Nov 2026 20:10:56 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010042.outbound.protection.outlook.com [52.101.46.42])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4hujyq44bu-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Mon, 09 Nov 2026 20:10:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zosibb4STFRSbXD0uGeUtCi5OmrVurF2kIr5Gpe4Lq7inlZqzUPA5Q2kC48vagMil3T1GmT6lYtGP16GOV+tlat6a2gfs9exVz1dHiGiShA2edpKyz8x5M01UaelFeojXpxlMD+buo28EmrzVFP26Jv5i2nPlrooyOYQRejcbDqf/a6K5nxfT3I1VIya4vPp9mNKrwzdh6AQR9WcFO4LCojuyzLIz3ZTVzCz2TtERrUp7VJNlfmQxo6lnYctasAcCyq79B2NJsBI56BDHEVJ3tqCPGxMwmksNqgnYm7YrFTOA450CxR1ixKKDCUCBsSM8w52pPoRvVrIPXSrNmH2Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cilYoBFykNE9Om33tb3xeellCiMrLAwdoRwsrytV++A=;
 b=Fa+5ueUMqZadkq7iEMDzwaKOdvee6/JVofrpusvr5kAMvDPfSjrQCSMv6uJLC7rCa5MUjwJjJ+i5r56lERzJu4nZK+V2AduXtkCoau403Oua5+z5eRHwtkmOrQKqCk+bVrtPd8SBPeXnKcRfN997ZOfuC0X2/YtpfT7Glm7UnRu/Qm2z74tWHEM1Fa90RXbEqMJ8zHk01AsEtEOLG35jttn63BkyxR8tLyCt1F3u7ts998BctW+e5oJjNzAZMyY6adQ1c75DKPELzkFsP2y5zBJR0ayA8BagJtG7H9IClsRdCJ6PIvzRIjGvJCxGNr/A/eqx4M+peKt4dAvN0Dqt0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cilYoBFykNE9Om33tb3xeellCiMrLAwdoRwsrytV++A=;
 b=B5c4iDMbHEgCwOiTtbDMlN42QbODsQAcTtwtACxab5X/BZveyt8L9vduWT2x0e5RPgauaqyYiOyPGA1Zc8Tg2kclQbOEwupn+uwf1jHeNgyZ5c+PR2JcU0kELbdcN60P16BpQZrtu48T1B/nHvOYyX54lJ0c7d7W6+o3bFajMcI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS0PR10MB6198.namprd10.prod.outlook.com (2603:10b6:8:c2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Mon, 9 Nov 2026
 20:10:53 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 20:10:53 +0000
Date: Mon, 09 Nov 2026 20:09:12 +0000
Message-ID: <8ae83c7a93f20b725d46fd3553a21c1b@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/4] ctf: restore support for raw CTF archives
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0103.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::29) To CO1PR10MB4769.namprd10.prod.outlook.com
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS0PR10MB6198:EE_
X-MS-Office365-Filtering-Correlation-Id: d8c3e573-5dcf-4a8b-d8eb-08df3e9d8e8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|9063799003|10067099003|18002099003|6133799003|261021121427099003|261022105027099003|56012099006|261021135927099003|261009223027099003|261026140227099003|261026135527099003|261022113327099003|261026121527099003|261028144727099003|261021130227099003|261022075727099003|261021133027099003|5023799004|261022115727099003|261102123227099003|261026130827099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	cYnYY64yzKxl/RLlJ30xvkgdfNj2vIh4yWaHgjQJmjsXXhr6gF65vrmaEHSLyq65eikXQafNUm2IA2gIUYhFqz7Y/98WA7NXphE/WwmIXvmi1DHNURX5xt9sAmVZaNZWhH7rbmGQH7WFZMdcYViMj/B73xZcFijNKgZk7dnhsFavpqKeb5XVws2gqz4Nmswt20Cx2Tv4oiFggFikIhR/3U9OU+FKYpaW/BcA65t+ETVrakk2R392Q2lmVGnU6SjlxLNbufyRu6hhkTaxzrxYjb4OtjLULHUJNH4+Mm21ltsM8IpFKth2xrGY2N9q4CKq4vAoTYS3TnO9xI1e+KWvHZoVefrC8x+HJO7GqdmDNx2OihoqYvimu6J8c9W+0XPaAEJ5vRYSHYSbTSmDNmpV2+vVJHhQKbrmJgJYTDykd9go2J0tn+NXOXDkfKw98jdyLi9KTpU6LWL7yeOMhxBSa2SV6JQPNS6U1fY+P8wfqlLFunBjQ2Vcp3FUqifHHFRuR0/tzeJLRNwTqXK1nHX2d9eJh+MQuitfzQL8uiZVKguEU55PL8hxzH8bIByl9ZOIQpBrLOlsGKDMtWf0oBwhzm6MFIW3HSeclJIrli3ReQCZLgcilKssW5W8IIji3ovKUjucoReHZYn29yG8f6vIfsru4i/KBVPNei91PheUgS0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(9063799003)(10067099003)(18002099003)(6133799003)(261021121427099003)(261022105027099003)(56012099006)(261021135927099003)(261009223027099003)(261026140227099003)(261026135527099003)(261022113327099003)(261026121527099003)(261028144727099003)(261021130227099003)(261022075727099003)(261021133027099003)(5023799004)(261022115727099003)(261102123227099003)(261026130827099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kWjmr76ZgS2CUoG9ijRAA7Ulg1wAEeND19vPYPVEhbcbv5c/kFtxV1TCC4tQ?=
 =?us-ascii?Q?LneuHMf2Hp8Gizpc6GJPRteT8B1EdKfAoBZquoZ/r8VVdH4r0pQZ2wsA3zlj?=
 =?us-ascii?Q?WLzy757x4azI5MKy1pSCEB6aJqH7CKXT6knFNNfWnkaXZmaHKQVEZluewdBc?=
 =?us-ascii?Q?uChtzyE75F3l88W/FZvnSPiYluB5AU5+f4QAcuuQtFK0QIb5GqVUfOrgt/Te?=
 =?us-ascii?Q?bpZ7ExRZ4+rrswS8qEnZWMnOkDODK0/oFoO2sy5DvCyUdSiqwJIn9Pbcvz+Y?=
 =?us-ascii?Q?LYok1ozOu8Js3lkauNtU3qoYA4Xqua10jekW1sK9JFhq9PKksRyBJLPw4FIW?=
 =?us-ascii?Q?w4KYwlQu5RXjxw4thn7ixqRuNqMwm6ulBBBro1uglkkG03dJHUR0jCTtc5Lk?=
 =?us-ascii?Q?D91c9NuMfRIJPZpiZFEsO0/yMkZ8VGDPZgcBg66KE/p0pgk9EhbE5LeacJNk?=
 =?us-ascii?Q?jsOXNXPdTIqbi/Fm+5kVQY3J6iaqs7Dk+u6qDZT/+0uEJNM/jugcU8g3w+4+?=
 =?us-ascii?Q?Ch7yKUDzkBoeEH84wxuDfD5Bd7b+cfZqH7A5ptBlq6B25G5KMcKkfkLaKS+O?=
 =?us-ascii?Q?3UYHzi65F+ASx3zm1dKQ2Kt0ZcNa4NBabt0oh0C+f9wGq8UvbdfTNv3q8ulf?=
 =?us-ascii?Q?nojpgBfw9RTW8NJJ/m7+1NQXPV3T2467TBQGMMBxQ7zlynHcVbfrJgfo21+R?=
 =?us-ascii?Q?jBJ3ufPyirAYdYwCiYr4S9nB7cRx9z2VYYPPJ1tfVu6I+HkLyi/DryORvYpb?=
 =?us-ascii?Q?VHumqB/gG8OVRzRk27/tGkXXl+xyFCd2Dbyk2i+X+hTWvMamviHPTZsgtgfV?=
 =?us-ascii?Q?Atu0RRv/uqD9MhhpQBFbRhB2Df2vdPXUFhy8Pox+TEngEcLFQaQOY9j8OTDb?=
 =?us-ascii?Q?OpuczKe2OpWk9XmISzW7aKIwwD0fpB5aP8Lsbwf8yObMbXI6kTF63+Vgu+/r?=
 =?us-ascii?Q?CgcUUvgVyKh2A7JfzYZ7i+X+YI2ZS7+QqVy1vpXC9BWPAo3NUKOTY4aBhebw?=
 =?us-ascii?Q?kWxeVHj3T0ihn2nLH+xOv17JFVXYVJL2Rli352si45cCz49tjFnBeFrDyzCX?=
 =?us-ascii?Q?woY4abnfKuAQj37JS2+d6oqHdKiUL43ddG7uZ/XmPto0/GEJi6DfgnDrPrbu?=
 =?us-ascii?Q?iWUdWjhZHAg6wfJ9GD7dr7J4ATaBhQlkmkHxyFO+qG1qjTFNW+dS/EY4qDx/?=
 =?us-ascii?Q?SHi7bxvBMtrIAo48dOMYWW3X8AF8gwmvI3z4TxKKnQAfIKlp6s2idRto9cSt?=
 =?us-ascii?Q?Y0iVnUnG1mUDvg4BGG1tIVPCnN0zd8pgii3xqLeR7aRufbDyKDVj+dekD2XS?=
 =?us-ascii?Q?1pqHQW7mbtPcRTMOzXefW3tApoHjKH5iKF2Qo46Gn2HVl0vORIBs1AHLtwgK?=
 =?us-ascii?Q?FtsePIBiXqdTYA5wm9QDBZs9wc4s77kFwNtuxxmI/zWe6Pp3BtJgv33PZsfd?=
 =?us-ascii?Q?yzWVHJTsqTmPi8d//gDFMYONi2as3OTy+GjOyf66Jj8D4Idrbam2zDaOTUQv?=
 =?us-ascii?Q?UCfSyJ5WbEitUF8oBNyynnVp/w0Q9mzJ6dY64NzzIXZz+e7VNt1lxRupiSjM?=
 =?us-ascii?Q?vFkNbH792cuYGWMCz23iYfDmE3Lx73QQSLWJN5luDD8RE7OQPLCaT9WBYJ1T?=
 =?us-ascii?Q?QbC37z4CZGzGR+PWC4uNzXuTRKxGQ4lq9nafPsRTbjIUyl6rItsjKnJz2GQl?=
 =?us-ascii?Q?0DL3y57Ey3Q//sT4j+35rwE24Egbr3hmcegKBmP8nsCOwWzv1lJx8DaLRt8H?=
 =?us-ascii?Q?HCRUHCfRelNobMNadSz+Rlmisa4K+Io=3D?=
X-Exchange-RoutingPolicyChecked:
	BMzJdFz9CepibsVHiOLBZdaV0ZLKWgK2C7HjUx1jnGggSq5mlikeCP1ztvijCKoSoZlWO7OWp+WO6eDPvt8b4bBEGx9wkAXsqPJpT7BAF7BrEIGrrwsQWqdYNFt2K/YRTpr7vsHQ7kCqkHb5xORx/12ak2M61dlBd2CV3DOy86jGoReMl3I4/0P5sfSKIA6cv4+f6kw2kyC+VcWshUwFvsLlR8WochlSlgWRlSNLxuM6pgwbuwp/fHTNHBTSob0DoFX5FU6D6xTtPGu4oOVAe9lfGO2Zi+2NfnSe0vHQLtEnHjnY+dz3YfEYFHZbPENFjTmEHsng9Cu2tG6OiNcSDQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fHMOEhiAONX40tQr3fkJEFMVi+JJEPF+Sqs8huvtz40RHZTfFlrf2BTgLXjxiGzpuu8BB/FHt/wtFJgtPgpWG88leDCB2HxWHbwSEOfe0lVQ76liBC/jsdL2/2oxLZ7BPIv7Qcpzf5Zjl9OeyYU6xb7DG2TKYYXPwTw+Kmj2X6EIl4SbPIdPocCwFRNRWl8UyipavC8QSB28PImfxZHiY3d5VcswTJLD+533lLdprVEDO2dZl73OjLW8S6IQHbAmB6+Qcfh2DirT6TYJqYLKrhrqqn9mp19/fW4JwZGjGES1NMfLAzIyAeeuHxaSHq/RQVcuZM4xR2mtdYiFcsXcmjIUJa9n0yiXUmdstx8Rvm2M1QT84+JwIQTiVK3uBcKE0V7SqXJAsxshSPpVC/Lwr6B/Q2jRHyp80nxerz2dwaggLh0mD3aKCuePqum0nvVM9fhbeEgXh7WY39nAgBo1qPiEpkTl+Gv4TMMlOOUGqGpELl5kj6hyNo5ipxGvkI/uv/ELqJTRu8eBrHUkETqgWxjBxf+dYRCdU+0ODSqA/uWmxQlkHH0+rHP3zGDTZdiR3HI9K8lka3NpQJjDS0EEEsNiK1CuOYDeWIcx2W3NMFo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c3e573-5dcf-4a8b-d8eb-08df3e9d8e8c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 20:10:53.3153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ucyGMy9Ioty1rvEBl6lH75C/Ie5vfvI4RHFGNcHJNcJ+1gx+IVF3+Nwh7o33GYSP5EvYSiNvVb97jiXSvQVMKwLczSS2Qwyogk3norih+8c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6198
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090080
X-Authority-Analysis: v=2.4 cv=cfBHPXDM c=1 sm=1 tr=0 ts=6af228d1 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x4eqshVgHu-cdnggieHk:22 a=yPCof4ZbAAAA:8 a=tdmymGYhn94rLZmogr4A:9
 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4MCBTYWx0ZWRfX1ICSysQ57GBW
 +Kn9VHGmFIULiWV+dNHzuLYnApgnM0YnqM2WWE/zdZCTIhqtjLqxGyFljC4Yxy/5Su4c91QR9CK
 uhx/GCiL7IB+8G6jrz6ZHTb6G59tGSNrga30TGA48oALeqJ/479Kom56W69TqDZ9h55pG70X/3n
 sr1slymwfgRDrewd/NtsewHOz2mFZIIg3jqlIiqJdQKbf6wTCb7Eu2FF0XQoY17wsBcIoesulYW
 qQWJ63nr0hrEfkTu8sxGICbQgBhh0tCTFEhU/y88nuiDNSDEmFSKdqJqA5q4SX2VII4BoaZRYCW
 TUh7N3b03tYByNbJuTRMFNf0JiY9iqCmozzjKaMgY2Bqk932/ZMYhhtWTcT02weaHPLg2hOkN3E
 YBih8wf3gJsPPP2CiYRqh6mHbzCGo0kzNNxTK0xiAqvYTq5gRHasND8MHa8LS4pR3oHkqHT4nPa
 OXF6Hotxu+wM1dOoaMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4MCBTYWx0ZWRfXwPYIl1TyW6ft
 x4uRzbwK9Y9U9j53DFdpEbF4TwdFcIeQ0rMVmqA+GBJUKjqT9LVy675l9zZr2NMndP4aQsRrgRA
 z/xu/Wt2eWZtjSDTL/1UoK1/2aw7eIAfPXPl1XLw04veKfWfuSsP
X-Proofpoint-GUID: Z6cWFcxSDU3pjWAq6q6c8U_VfNSlTDvI
X-Proofpoint-ORIG-GUID: Z6cWFcxSDU3pjWAq6q6c8U_VfNSlTDvI

dt_ctfa_open() replaced ctf_arc_open() for GNU libctf builds but required
the input to be an ELF file with a .ctf section. Raw CTF archives were
rejected before reaching libctf.

Use a temporary libelf context to distinguish ELF inputs from raw data.
Extract .ctf for ELF files and pass the whole buffer for raw archives,
retaining the backing data until the archive is closed. This also avoids
borrowing the registered vmlinux module as an ELF loader context.

Extend the shared CTF test to load the same archive in raw and ELF form,
with both shared_ctf and vmlinux initiating dictionary loading across
repeated module updates.

Fixes: f49e2063d6c1 ("ctf: introduce dt_ctfa_open to support ctf-nobfd")
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_module.c      | 57 ++++++++++++++------------------------
 test/triggers/shared-ctf.c | 13 +++++++--
 2 files changed, 31 insertions(+), 39 deletions(-)

diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
index 06bd55d9..887a4b4e 100644
--- a/libdtrace/dt_module.c
+++ b/libdtrace/dt_module.c
@@ -720,44 +720,27 @@ dt_module_load_sect(dtrace_hdl_t *dtp, dt_module_t *dmp, ctf_sect_t *ctsp)
 
 #ifdef HAVE_LIBCTF
 /*
- * libctf-nobfd cannot use the BFD-backed ctf_arc_open() helper, so extract
- * the .ctf section ourselves and open that with ctf_arc_bufopen().
+ * libctf-nobfd cannot use the BFD-backed ctf_arc_open() helper.  Open raw
+ * archives directly, or extract the .ctf section from ELF files, and pass
+ * the data to ctf_arc_bufopen().
  */
 static ctf_archive_t *
 dt_ctfa_open(dtrace_hdl_t *dtp, const char *ctfa_name)
 {
 	ctf_archive_t	*ctfa = NULL;
 	ctf_sect_t	ctsp = { 0 };
-	dt_module_t	*dmp;
-	char		dm_file[PATH_MAX];
-	const dt_modops_t	*dm_ops;
-	Elf		*dm_elf;
+	dt_module_t	mod = { 0 };
 	void		*ctfa_data = NULL;
+	int		fd;
 
-	dmp = dtp->dt_exec;
-	if (dmp == NULL || strcmp(dmp->dm_name, "vmlinux") != 0)
-		dmp = dt_module_lookup_by_name(dtp, "vmlinux");
-	if (dmp == NULL) {
-		dtp->dt_ctferr = ECTF_INTERNAL;
+	if ((fd = open(ctfa_name, O_RDONLY)) == -1) {
+		dtp->dt_ctferr = errno;
 		return NULL;
 	}
 
-	/*
-	 * Borrow the registered vmlinux module as the ELF loader context, but
-	 * leave its persistent module state exactly as we found it.
-	 */
-	memcpy(dm_file, dmp->dm_file, sizeof(dm_file));
-	dm_ops = dmp->dm_ops;
-	dm_elf = dmp->dm_elf;
-
-	if (strlcpy(dmp->dm_file, ctfa_name, sizeof(dmp->dm_file)) >=
-	    sizeof(dmp->dm_file)) {
-		dtp->dt_ctferr = ENAMETOOLONG;
-		goto out;
-	}
-
 	errno = 0;
-	if (dt_module_init_elf_impl(dtp, dmp, 0) != 0) {
+	mod.dm_elf = elf_begin(fd, ELF_C_READ_MMAP, NULL);
+	if (mod.dm_elf == NULL) {
 		dtp->dt_ctferr = errno != 0 ? errno : ECTF_FMT;
 		goto out;
 	}
@@ -765,9 +748,15 @@ dt_ctfa_open(dtrace_hdl_t *dtp, const char *ctfa_name)
 	ctsp.cts_name = ".ctf";
 	ctsp.cts_entsize = 0;
 
-	if (dt_module_load_sect(dtp, dmp, &ctsp) == -1) {
-		dtp->dt_ctferr = ECTF_FMT;
-		goto out;
+	if (elf_kind(mod.dm_elf) == ELF_K_ELF) {
+		strcpy(mod.dm_name, "CTF archive");
+		if (dt_module_load_sect(dtp, &mod, &ctsp) == -1) {
+			dtp->dt_ctferr = ECTF_FMT;
+			goto out;
+		}
+	} else {
+		/* libctf validates the raw archive or dictionary header. */
+		ctsp.cts_data = elf_rawfile(mod.dm_elf, &ctsp.cts_size);
 	}
 
 	if (ctsp.cts_data == NULL || ctsp.cts_size == 0) {
@@ -792,13 +781,9 @@ dt_ctfa_open(dtrace_hdl_t *dtp, const char *ctfa_name)
 
 out:
 	free(ctfa_data);
-	if (dmp->dm_elf != dm_elf) {
-		if (dmp->dm_elf != NULL)
-			elf_end(dmp->dm_elf);
-		dmp->dm_elf = dm_elf;
-	}
-	dmp->dm_ops = dm_ops;
-	memcpy(dmp->dm_file, dm_file, sizeof(dmp->dm_file));
+	if (mod.dm_elf != NULL)
+		elf_end(mod.dm_elf);
+	close(fd);
 	return ctfa;
 }
 #endif
diff --git a/test/triggers/shared-ctf.c b/test/triggers/shared-ctf.c
index 5772429a..8e20fb7b 100644
--- a/test/triggers/shared-ctf.c
+++ b/test/triggers/shared-ctf.c
@@ -61,7 +61,7 @@ write_elf(const char *path, void *contents, size_t size)
 	char strings[] = "\0.shstrtab\0.ctf";
 	int fd;
 
-	/* Kernel archives are ELF files containing a .ctf section. */
+	/* Wrap CTF data in an ELF file containing a .ctf section. */
 	CHECK(elf_version(EV_CURRENT) != EV_NONE);
 	CHECK((fd = open(path, O_WRONLY | O_CREAT | O_TRUNC, 0600)) >= 0);
 	CHECK((elf = elf_begin(fd, ELF_C_WRITE, NULL)) != NULL);
@@ -91,7 +91,7 @@ write_elf(const char *path, void *contents, size_t size)
 }
 
 static int
-write_archive(const char *path, const char *embedded)
+write_archive(const char *path, const char *embedded, const char *rawpath)
 {
 	ctf_dict_t *dicts[2];
 	const char *names[] = { "shared_ctf", "vmlinux" };
@@ -134,6 +134,9 @@ write_archive(const char *path, const char *embedded)
 	ctf_close(dicts[0]);
 
 	CHECK(write_elf(path, contents, size) == 0);
+	CHECK((raw = fopen(rawpath, "wb")) != NULL);
+	CHECK(fwrite(contents, size, 1, raw) == 1);
+	CHECK(fclose(raw) == 0);
 	free(contents);
 	return 0;
 }
@@ -307,16 +310,20 @@ main(int argc, char **argv)
 {
 #ifdef HAVE_LIBCTF
 	char archive[PATH_MAX], btf[PATH_MAX], missing[PATH_MAX], embedded[PATH_MAX];
+	char raw[PATH_MAX];
 
 	CHECK(argc == 2);
 	snprintf(archive, sizeof(archive), "%s/test.ctfa", argv[1]);
 	snprintf(btf, sizeof(btf), "%s/vmlinux", argv[1]);
 	snprintf(missing, sizeof(missing), "%s/missing.ctfa", argv[1]);
 	snprintf(embedded, sizeof(embedded), "%s/ctf.ko", argv[1]);
-	CHECK(write_archive(archive, embedded) == 0);
+	snprintf(raw, sizeof(raw), "%s/raw.ctfa", argv[1]);
+	CHECK(write_archive(archive, embedded, raw) == 0);
 	CHECK(write_btf(btf) == 0);
 	CHECK(check_source(archive, "none", 1, 0) == 0);
 	CHECK(check_source(archive, "none", 1, 1) == 0);
+	CHECK(check_source(raw, "none", 1, 0) == 0);
+	CHECK(check_source(raw, "none", 1, 1) == 0);
 	CHECK(check_source(missing, argv[1], 0, 0) == 0);
 	CHECK(check_source(missing, argv[1], 0, 1) == 0);
 	CHECK(check_embedded(missing, embedded) == 0);
-- 
2.52.0

