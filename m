Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217584570F9
	for <dtrace@lists.linux.dev>; Wed,  7 Oct 2026 10:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791367629; cv=fail; b=CPhz9xeMv3NcsyYtGx1lNW30qLlgfbC8arCQqHOmMSofSHZPPr3owPtaGnFJG0s201uXGdV/CSErIgN87rVFdMJx4zq0lpWDb8w8OVJqpSKrAyh0qcbHO/SoXvJh6TS0+a8XHEu7N+h2UZaG78YAdNHF8ZjiU8bGB99YqkIpLJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791367629; c=relaxed/simple;
	bh=APMGRUro6yLoi31SQoHOksUF9U0wGBwNuPYW2PTTEss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CtN0/fCyVADT5J4ts+wfB7vXdCAOwjOuvXfivkw4EtK4tU5KekxKDfz0keDzaz4j14L+Bi71NQrZtm0HIzi01wfHnFptaKPYvAHJORjpjsqzKsFLYzJ/nVrnQFPmiRqXFoYO4FQo9hTvVz29+tQGLZ7444mxXGHzZeHgjW02egY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lkSO6eUX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=woRj9KX1; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lkSO6eUX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="woRj9KX1"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977g8bb2105994
	for <dtrace@lists.linux.dev>; Wed, 7 Oct 2026 10:06:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=9YvKZOq+p/xAaERlvB
	j812+rf3ip3BuPa5aYCzmPHMU=; b=lkSO6eUXpK2ekQeLO/EDpwmCgNith2tpwW
	4820VaJQGip+DKJQTR4B8PY8FQaCV1Am08UqgkuQ7TGbw/OYuWZ5FL9DhajIgNkI
	dPHMoXyeuwRa959S+PNVlWTMz96PwMPfMAxvx4DHgYIXjiq08lNtVP59PnMO2gOD
	3pWT9gQNPdMhoJWL6EE3XgE+GuvQA18TL+UZ6WcFYKywgM/fdtLLPorVDAfx9tVL
	St2C8lFKTvrD0jpq4vt1LxF7OOWLozgOHfksuikKWuw0apPBdAR+ld0SjpnrI+jE
	BI42ucVJ9IXqH1uDzSqoAzKEWsaXuPILleYyOpp3UrDaAs77fkIA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4h2sk7ndaw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 07 Oct 2026 10:06:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 697A6iXn004948
	for <dtrace@lists.linux.dev>; Wed, 7 Oct 2026 10:06:55 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012026.outbound.protection.outlook.com [40.107.200.26])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4h4cyewhu6-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Wed, 07 Oct 2026 10:06:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wBXzWMEanvHBUEt/r8zHYDsWUTPSees+MyD2FhGnwPjAjZ+Q0EVs3LqF6cuIo9Nykj8OnvDy6OxMvzQVlJTBGqMRrjVYI3XGUaRyXWycg94K/i04b4a++HMkGcSRkyk3szChUW+JFasqyj284dM/TXXqPxL1pCcUoFSyf2asBZCtVvFqt891E2hpiwbJ4yBWp6BYe+wPXrZ8Lax4+tY7yQt+xyiXZpj0KN6HAiX+Ub0tvKRRyqdU7/LW5xd2v4+mGndCCtQBgBS3vpOF6lQgkm0agppO7uVV3w1U/OpL8l7H3JfEAOTWs+g4tfKW4kBmwjhbfZYLM1DVyQYXeSwpcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YvKZOq+p/xAaERlvBj812+rf3ip3BuPa5aYCzmPHMU=;
 b=Ld4Derxj3xz0sb3Lh2mQhreiTm3hSQN+gTanVTGvjl3Tc1E0rvpR1ViHgbNdePWGpbYYVZE1XvXA5hHC4QapD4e7sfl0awmnq58V58HHnuuyLoJnWzXtdoUUHdkU1X5v9BxN9XtUEJSjkAFM6JLtPz8YQsJhfJhBU79bUsVtNo9Ld5tYPGNJ7ASAI6WnKIg0v4cQTccFeZiMTMG3WRSe00KgVelPMYEgOhZDK0Gnf8e2b+QTR28bwJiVbXbQuZ8xvFxTD6/3OxHOIk2W5iapdCwWmYSqU6pqg0QvDWes3IR7TrqM4l6l/LhYsszymhbFB/3tTnh19HCJ+E9hIqQGhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YvKZOq+p/xAaERlvBj812+rf3ip3BuPa5aYCzmPHMU=;
 b=woRj9KX1nbo2tzBJt0PyWMgSpVv/g0G2oyJJlS/Ykdm+UjI7EQwn+NfSK0oobPh5iL2cFUR0EYjC2IfnXiWfQIDTzXnpxIlyd+Y19eHdlHnZeB63fofI6ukAd2ozdCJVZDTTzDo86UYPW+TQnfgyC+2VgW4RBAFHAsGT8k+unGo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SJ5PPFB6A054FAC.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7c5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.14; Wed, 7 Oct
 2026 10:06:36 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0496.008; Wed, 7 Oct 2026
 10:06:36 +0000
Date: Wed, 7 Oct 2026 10:05:15 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v5 02/11] libdtrace: share vmlinux BTF/CTF globally to
 support faster startup
Message-ID: <asYZW1jEmQqof1pD@kvh-deb-bpf>
References: <20260821161100.41710-1-alan.maguire@oracle.com>
 <20260821161100.41710-3-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821161100.41710-3-alan.maguire@oracle.com>
X-ClientProxiedBy: CH0P221CA0038.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11d::24) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SJ5PPFB6A054FAC:EE_
X-MS-Office365-Filtering-Correlation-Id: 91ed8517-eff9-45cd-1c02-08df245aabd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|10067099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Chisa8tMVdyNypDqS9ZNezxbQ+9RXe16c6RHH7Zfjk1d5gr+4EJmhqlBbKRFtifj64aot+K0pp4jPWs0zdAeDuCcxW3OBnvMHxHuL3m5kA34fMdtfQzdeSMtUI8fPRDE2vV8QGkmN1Wl/UAF2xqEWFkKf/9TjHOlPUnML38UlRlgHIvfsdAJNKYMRHjBWVqUQ4NO5Bcxp10PJPNdwv2PsNmgCLwgKZyZV66AuIo3rzXn0M5cSZ2RUyAxLeW1I2JpCxkds4GC2Q1dMCZ6lZBZvAcrV979d7xDX4iNG/NgM1iijht45ysBZwOtcAqgyNJ6peq5frKMiLQeiDYwiem+sXAQZAfZzrd0GjJ1MBGePF7pw8vLNqa2Im8xuP9XNaYzMZkjHn0XGP7clT4NtpAf+M/IwrMr6Ij9tjr7Z5k8hXeEyRxJDAdhK3IfUdarGZNbfJqhzkeSIIAzxdaU/BKoM0SeD4KpjIF9rbVkHJq5bARpPOppCvw4U//achSOXJsVdYOnYlhBpvF4ZPrs7Cv2KwrCbCmwfjtG77P6NNtqXG/8gFJ+GDXkrOpuh45AHzc0edUaNW7cqJlSVwE0PUbzabiqWzksYG/gJFYJZMfowW/omAhRWoIKS8Vxv9ksv0Z0oxo/jDhC0tcPusFUsOiXM4rpZ3w/U8lwFiVPaQ23hmo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F+VwXUpbtdUGHLwDXxUOJW7I2czv+1OHQRsxdB4ZFff7pPX1tJuIx4EWmmAB?=
 =?us-ascii?Q?uZZ36mliJG1eyQvsPtxgUB+K3PNxSkhCHdf+6/mhlw8UygAtIj7ocHuTHHyo?=
 =?us-ascii?Q?o9glZqxj+SUDO5nOKBAQ32NB6qBQL6ogHSM8fTWNOblDDyEbrA5fYfr76m3B?=
 =?us-ascii?Q?dspZ6MXBQOy/TBOhbrfhsyi9CS28LcoPwCyemMA/fNv4sL4zu6VsN56cLmd2?=
 =?us-ascii?Q?FDezv1KalGtNkGff+Ci+AgNzg0TL/EPobKLSk8lstXMpF8uKNBJL4mY7cGJn?=
 =?us-ascii?Q?ok7r8T0mvygDAaydq4IDkTPS0Tjd+Iv9BKgnlvQsZDgzvLsGNmLnZj/9wiQp?=
 =?us-ascii?Q?+4E4dJmqmymiOTzhOjHXSd+S160ilLej3um+W7ezWl5WM99TT50LL+x1KnvS?=
 =?us-ascii?Q?v0GrJV1jw8AepkZbjtFQAISeEli62ZltJDU8ae3AqHdXEvDVXI1gNCtyq4Q0?=
 =?us-ascii?Q?wTtqA46P3htVfSAH/aJwPaU5xM4YHdc1bDP7bQu/pkVHBTF3kRVpa4ZBAnhf?=
 =?us-ascii?Q?24b/iOzHQtvWOKJzHvnpRjXE4RQ2nd7xid5u4aCsS9OsJTy5NjCU7ohBf5Cx?=
 =?us-ascii?Q?FfIW6kMfxqwou0vfu5KaKQZfzxFGsKeB6Yc4hRTNWOKZKTbad7lBSxxuWmDK?=
 =?us-ascii?Q?HinrgJtcm94uG5FdbdXJMGVGxlOCwKAQh6fUu7j5NPnE8AvcmiEsih5LwYQb?=
 =?us-ascii?Q?zASUXb79AftKDfUr/yzt5LiPYatrUPpN0sFJA5QArAlojChdw//oIpEObH61?=
 =?us-ascii?Q?ZkHg20UGFuouEr5BdwHCGBx/k0cnvMJXly6HIKlidR8OFy79w951g4T9QiCT?=
 =?us-ascii?Q?ZbdboxLWazS6CU59FTZzXO4i3M/kowOAFTQdH2xFpPQiMsMsztiReWX5D4Ic?=
 =?us-ascii?Q?HzV1sJFLQjwLrOorrl5UbLZh1vZ+bRsMg0o7MD2lCZIxIXXElpmrm/WCgPmy?=
 =?us-ascii?Q?889LGiTSp+NzRap2lr04oq9PPZ5nGbeMw0yn750HMG6+CkP1I8M/poI61AOW?=
 =?us-ascii?Q?KuEUGm4XfTc4HifrTH0miz2JwCIfPGkesDb68iEEqzehBemdtn0H3l7dY+dT?=
 =?us-ascii?Q?XWjfdcEaZS4Cp7GcJuHlV2yB77UVBXiJphMdl94NtrZEHoAVDQ6rf54KOtXV?=
 =?us-ascii?Q?MCA2C4z1pfcnx5FkdphH0Sebeo/mVQi239cVw8OH3s08nO2Tnr9qoRJHUPAs?=
 =?us-ascii?Q?XXvZDWuOPSRyN+rBp1DedOMLz5pvzF0pguBsxpprt15wfLgCAc4ngDJwQxmN?=
 =?us-ascii?Q?vrnlGkxT5U6gU3cwel7e0sWhIUidkkR2dM+I8exl3WtqIy5s/sNW6gENNlpt?=
 =?us-ascii?Q?lvKhcLfoq2xI4iSVGb7uc8zd0gZgZjrsk2XPgh5lzf/aKLrqVYCHT7dggssh?=
 =?us-ascii?Q?KsN0tP/QxP3F80zv7bsRxaPIBfgyB2q4BWKri/52hKKb/EfS2N97sik/OD+d?=
 =?us-ascii?Q?ZI462O4P7bJ6+Z5feBfH6qn1NVh8Qw8lcm9UP7n3thWUoJCdRmlLGkZyodhA?=
 =?us-ascii?Q?Fly68r3R1872fRfbe8dmkjOXPwNhit2BL4Q4EwSDmgdrekFNjqWTkN0r4WsU?=
 =?us-ascii?Q?T5YwntaZuNGk/cJsN+cMPa6trR1GyOERIMtu/wOtL4/p7PhIFVxl0Q97dm7l?=
 =?us-ascii?Q?NTYWU6evCYnRrnGaXBQO0Gg13aNepiTSAoS7porXhIPE8PmZsQV5GbZt68KZ?=
 =?us-ascii?Q?OuE52i2yErdp8XygXtCfESvemsMBaE9e9p1+VyJpU1mGKlcsbkXL4W09sRr5?=
 =?us-ascii?Q?j7zsn2aX0n04oBq9THn+Ay74s7xepsU=3D?=
X-Exchange-RoutingPolicyChecked:
	5sx2d0qrmPCRCCb4Xx0+Nck+UW2Yg75LNMKMc/RHQYlNBO33GPcYL0uKPPSme2sIY/KgjVJMawWbwnHnDBZXBeak/ujHOc9c0ifPJRTQHqEmwZZRTPKv528jbYRADs1Agb5Hx1yv8XJY1Ic5iIVrO1z2KRJQ9eX+Y1+ZVVrczEaXoq9IuUBVNZsjnxX2JGuJlWYQRMenheK024NWxuc3Yil1ClnpMHqMyjVZHcpqvl9ybxra/FQ64auNbz2v06c4bkOt+sLr8ZilYGFQ2ruhump+LKlko5aQt7KSNLNASCq8Ul0n5uPaHw2rJNcvtALA3JUGvOHDOWaUQCyg+cyQgQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Yd3GUOQH/L7Cf+TK5u545/iYYKnF/6m3kbXPqb3jEym0E1r8uQQqn7qK7KNTLbwxpUlfwV76dTdqoOGnAbEZnbiMM+tDl7Tnp7gXUSFbXV2zzdaxh9K1eiwduCTL1QG8eXK6W6hEBiJshQQ7C4Vyo5p2Ogrr2bpji663DpBwn0mYICBLaISvtYGyn/hYSGifU1Trq1/WNqmkdY9N24lMosp3WsUpuRJgWLsXF6sVgrpVidXBViTCZjAMggBUVi8uxdH89K8XUUWeNEqJh+DVEshx0DJo1RzSwsT8Ru424rpcy9Izsi+AnV7yJp707fij4+TFkEBukRrSDRZSeCtQMdQaAcFsF453/YnbuZypDb1tqtQ0mVMhpNta/Yi6/55rnPT+2lIBbnjPzFW68NYZ/AK911rkMF9HIhUXVUXmBpm9fIa9KaL/kmBwtsH4b28A8nwM/t84t6yGgHMgDYjT4uH4HVt3lW241HiWyrBIQ5bqe1Dvwzr1xfwtccFd4zVD0yhj3SO7iCK1IVb6EDp7ShAoFvxmOUwYja2GNDIqzxUux8HHxRHhTNMvO2Qtaw6MZSF480L0yMsPh3hO87TIuTrtaVSe5kaKuLqKB5kFKSE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ed8517-eff9-45cd-1c02-08df245aabd9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:06:36.0916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TIcktQCwsAvpxT8ojdGTugEnqx3ZsLTGdd0mLg3CSp4KtOfAaEnzs9Yl9kzNgIzE9xDxF2b1abY85xR6CWFqX4NKH+ZDYHAeN2jcIblZ6SU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFB6A054FAC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2610070040
X-Authority-Analysis: v=2.4 cv=Cpsq4X4D c=1 sm=1 tr=0 ts=6ac619c1 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=EIcjfB9IiI4px24ztqRk:22 a=yPCof4ZbAAAA:8
 a=xpV4rS8AyNnMs0jAGRsA:9 a=CjuIK1q_8ugA:10 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12108
X-Proofpoint-ORIG-GUID: RuvTW_AHI5buooS20xQio4iBEg8nmRp5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MCBTYWx0ZWRfXzZ71bzQT0OIE
 kuGUM2NoVmX0jbvn3WCpSqsVyT6i4e/dYGi0VVmC3gbh13dQwLvP6gxO3mlRgm9cmA6MCAbQJvH
 i2CAtAJLhQtwniShN/luLLZccvRl3nMaEqwKnoy8hub5EUnbFyty
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MCBTYWx0ZWRfXzuNTyMa69j6j
 af9FD/978R1FGzE1irDdRpRmvMdwupW1wSpX2pxw4N8iWJxuWEkhmb1MNdaIAMVZ4Lvk43qywuY
 JWFRlfiIAgIFFCA8hkLXWP5QipDHt2Wp3I+IEvr0R1c8eQe5kXaTp0hI8pZhWU88TVZgO277QJm
 iadycYiYpkoxWiG0piiDIHxrMPCnxbhJF2MkNO4oKhZRFf0Ze1jxS8MUSVSJ6QeEoNwwe8jq2G3
 n66GgzesTBLEFkrYEACoc7zpQ9f0ZvglsEMe13sSoidwqs1E3Dd3RTcek4rMWl7dD9v+/kSGc/e
 KYYbXaCHczGFbIFK+JBQt4y04g2MIrZ+7owqvfs4IEMAdfUgZmCSIG9oyyIWj96buNr72QeHJD4
 AP2IUyLazhUpgtotxrD7e/n8TdEDztua59rIL2h3kI/+KuFGFyd8iDHiZ0rN0/6kC11g5lSXIYf
 IG3npkrk/HYqNEAZedKU/BdCiIp3qh5OAUeMarwc=
X-Proofpoint-GUID: RuvTW_AHI5buooS20xQio4iBEg8nmRp5

First of all, this is great work and definitely a major improvement for
start-up time for DTrace.

That said, I am debating with myself whether to take it as is, or to do
more work on this.  The point being that while your patch is certainly
an improvement, the code it deals with is in need of a major overhaul.
There are multiple problems with it, the biggest one being that DTrace
provides dtrace_update() as an API function, and its result is a reload
of all modules and their data (including BTF and CTF), but the shared
pointers in dtp are never updated to new versions. In practice that is
thankfully not a problem since the kernel is not getting changed from
underneath us (at least not unfil live update comes along).  But it is
wrong either way.

There is also the point that the dtp->dt_shared_ctf and
dtp->dt_shared_btf pointers are just ugly, and shouldn't exist.  It is
easy enough to just use the dmp->dm_ctf and dmp->dm_btf pointers from
the vmlinux module if the "shared" CTF or BTF is needed.  Since the
shared version is mostly used for BTF because modules' BTF is an
extension of the kernel BTF, introducing a parent BTF pointer in
dt_module_t is probably better.

I had work going on in that area a few months ago, and I'll dig it up to
see if that is sufficiently complete to replace your patch and get the
same overall functionality or whether it needs more work.

Stay tuned...

On Fri, Aug 21, 2026 at 05:10:50PM +0100, Alan Maguire wrote:
> In a multiple DTrace session per process environment, it makes sense
> to avoid doing expensive operations like reading in vmlinux BTF and
> converting it to CTF more than once. Shared (vmlinux) BTF and CTF
> generated from it are shared and reference-counted globally here
> to cut down on cost.  With this change, we can launch ~1 DTrace
> session per second.
> 
> Note that we need to handle case where  -xbtfpath/DTRACE_OPT_BTFPATH
> are used as non-default BTF paths; in such cases global shared
> BTF is not used in the handle.
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>  libdtrace/dt_btf.c  | 92 ++++++++++++++++++++++++++++++++++++++++++++-
>  libdtrace/dt_btf.h  |  1 +
>  libdtrace/dt_impl.h |  4 +-
>  libdtrace/dt_open.c |  5 +--
>  4 files changed, 94 insertions(+), 8 deletions(-)
> 
> diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
> index 1f793397..e7980969 100644
> --- a/libdtrace/dt_btf.c
> +++ b/libdtrace/dt_btf.c
> @@ -693,6 +693,9 @@ dt_btf_to_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp, dt_btf_t *btf)
>  	ctf_dict_t	*ctf;
>  	ctf_encoding_t	enc = { CTF_INT_SIGNED, 0, 0 };
>  
> +	if (dmp == NULL && dtp->dt_shared_ctf)
> +		return dtp->dt_shared_ctf;
> +
>  	ctf = ctf_create(&dtp->dt_ctferr);
>  	if (ctf == NULL)
>  		return NULL;
> @@ -764,6 +767,81 @@ out:
>  }
>  #endif
>  
> +static dt_btf_t *dt_shared_btf = NULL;
> +#ifdef HAVE_LIBCTF
> +static ctf_dict_t *dt_shared_ctf = NULL;
> +static int dt_shared_ctfmodel = -1;
> +#endif
> +static pthread_mutex_t dt_shared_mutex = PTHREAD_MUTEX_INITIALIZER;
> +static int dt_shared_refcnt = 0;
> +
> +static int
> +dt_shared_get(dtrace_hdl_t *dtp, dt_module_t *dmp)
> +{
> +	int	rc = -1;
> +
> +	pthread_mutex_lock(&dt_shared_mutex);
> +	if (!dt_shared_btf)
> +		dt_shared_btf = dt_btf_load_file(dtp, "/sys/kernel/btf/vmlinux");
> +	if (!dt_shared_btf)
> +		goto out;
> +
> +#ifdef HAVE_LIBCTF
> +	/* BTF-to-CTF type IDs and CTF data models cannot be shared. */
> +	if (dt_shared_ctf && dt_shared_ctfmodel != dtp->dt_conf.dtc_ctfmodel)
> +		goto out;
> +
> +	if (!dt_shared_ctf) {
> +		dt_shared_ctf = dt_btf_to_ctf(dtp, NULL, dt_shared_btf);
> +		if (!dt_shared_ctf) {
> +			dt_btf_destroy(dtp, dt_shared_btf);
> +			dt_shared_btf = NULL;
> +			goto out;
> +		}
> +		dt_shared_ctfmodel = dtp->dt_conf.dtc_ctfmodel;
> +	}
> +	dtp->dt_shared_ctf = dmp->dm_ctfp = dt_shared_ctf;
> +#endif
> +	dtp->dt_shared_btf = dmp->dm_btf = dt_shared_btf;
> +	dt_shared_refcnt++;
> +	rc = 0;
> +out:
> +	pthread_mutex_unlock(&dt_shared_mutex);
> +	return rc;
> +}
> +
> +void
> +dt_shared_put(dtrace_hdl_t *dtp)
> +{
> +	int shared;
> +
> +	pthread_mutex_lock(&dt_shared_mutex);
> +	shared = dtp->dt_shared_btf && dtp->dt_shared_btf == dt_shared_btf;
> +	if (shared && --dt_shared_refcnt != 0)
> +		goto out;
> +
> +	dt_btf_destroy(dtp, dtp->dt_shared_btf);
> +	dtp->dt_shared_btf = NULL;
> +	if (shared)
> +		dt_shared_btf = NULL;
> +
> +#ifdef HAVE_LIBCTF
> +	if (shared) {
> +		if (dt_shared_ctf != NULL)
> +			ctf_close(dt_shared_ctf);
> +		dt_shared_ctf = NULL;
> +		dt_shared_ctfmodel = -1;
> +	} else {
> +		if (dtp->dt_shared_ctf != NULL)
> +			ctf_close(dtp->dt_shared_ctf);
> +	}
> +	dtp->dt_shared_ctf = NULL;
> +#endif
> +
> +out:
> +	pthread_mutex_unlock(&dt_shared_mutex);
> +}
> +
>  dt_btf_t *
>  dt_btf_load_module(dtrace_hdl_t *dtp, dt_module_t *dmp)
>  {
> @@ -774,6 +852,13 @@ dt_btf_load_module(dtrace_hdl_t *dtp, dt_module_t *dmp)
>  	if (dmp->dm_btf)
>  		return dmp->dm_btf;
>  
> +	/* Share only the system-default vmlinux BTF. */
> +	if (dtp->dt_btf_path == NULL &&
> +	    strcmp(dmp->dm_name, "vmlinux") == 0) {
> +		if (dt_shared_get(dtp, dmp) == 0)
> +			return dmp->dm_btf;
> +	}
> +
>  	/*
>  	 * Default: /sys/kernel/btf/<module>
>  	 * If "none", disable BTF.
> @@ -899,9 +984,12 @@ dt_btf_lookup_name_kind(dtrace_hdl_t *dtp, dt_module_t *dmp, const char *name,
>  	if (strcmp(name, "void") == 0)
>  		return 0;
>  
> -	/* Ensure the shared BTF is loaded. */
> -	if (!dtp->dt_shared_btf)
> +	/* Ensure the vmlinux BTF base is loaded before considering a module. */
> +	if (!dtp->dt_shared_btf) {
>  		dt_btf_load_module(dtp, dtp->dt_exec);
> +		if (!dtp->dt_shared_btf)
> +			return -ENOENT;
> +	}
>  
>  	/* If the module does not have BTF data yet, try to load it. */
>  	if (!btf) {
> diff --git a/libdtrace/dt_btf.h b/libdtrace/dt_btf.h
> index 2c921a03..b1ed2b65 100644
> --- a/libdtrace/dt_btf.h
> +++ b/libdtrace/dt_btf.h
> @@ -18,6 +18,7 @@ typedef struct dt_btf		dt_btf_t;
>  typedef struct bpf_btf_info	btf_info_t;
>  
>  extern void dt_btf_destroy(dtrace_hdl_t *, dt_btf_t *);
> +extern void dt_shared_put(dtrace_hdl_t *);
>  extern dt_btf_t *dt_btf_load_module(dtrace_hdl_t *, dt_module_t *);
>  extern ctf_dict_t *dt_btf_module_ctf(dtrace_hdl_t *, dt_module_t *);
>  extern const char *dt_btf_get_string(dtrace_hdl_t *, const dt_btf_t *,
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 7db2ba93..7ccdc271 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -305,8 +305,8 @@ struct dtrace_hdl {
>  	char *dt_ctfa_path;	/* path to vmlinux.ctfa */
>  	ctf_archive_t *dt_ctfa; /* ctf archive for the entire kernel tree */
>  	char *dt_btf_path;	/* path to vmlinux.btf */
> -	struct dt_btf *dt_shared_btf; /* BTF data for the kernel (shared) */
> -	ctf_file_t *dt_shared_ctf; /* Handle to the shared CTF */
> +	struct dt_btf *dt_shared_btf; /* BTF data shared by kernel modules */
> +	ctf_file_t *dt_shared_ctf; /* CTF shared by kernel modules */
>  	dt_htab_t *dt_kernpaths; /* hash table of dt_kern_path_t's */
>  	dt_module_t *dt_exec;	/* pointer to executable module */
>  	dt_module_t *dt_cdefs;	/* pointer to C dynamic type module */
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index 30b8758d..352cec49 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -1299,10 +1299,7 @@ dtrace_close(dtrace_hdl_t *dtp)
>  	dt_htab_destroy(dtp->dt_mods);
>  	dt_htab_destroy(dtp->dt_kernpaths);
>  
> -	if (dtp->dt_shared_btf != NULL)
> -		dt_btf_destroy(dtp, dtp->dt_shared_btf);
> -	if (dtp->dt_shared_ctf != NULL)
> -		ctf_close(dtp->dt_shared_ctf);
> +	dt_shared_put(dtp);
>  	if (dtp->dt_ctfa != NULL)
>  		ctf_arc_close(dtp->dt_ctfa);
>  
> -- 
> 2.43.5
> 
