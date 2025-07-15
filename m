Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D47F1C8616
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 19:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752609055; cv=fail; b=TZWjUglRD/ozVFNt6rz0WM4lZTRK6qTACtkB54DCyoXQse50T3GYEnfvgZN3Y1xhHOkS9btoBp708IRtkLZQ2PHdMwLQbdZ/w0888m9v415PSJwDL4iNmXtpXDx/kgeWnbOumL8vNRWKEgoNVwqT1M4C+Yr3f6KygDPspezCuy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752609055; c=relaxed/simple;
	bh=F8jURiUhMczzPlrjqayvEZiyn4XtaH/ViuLsIEjvCqw=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=lZcH7E+vBtTzJuQgrIp0Q2PKpIt6yfmmNW0Fv5znfikLd+gEtfAiswujo3OKxgovfPsDplgaCaVSCEVUm/+j9A+Ew6hSDlez+38mR4ul4+hUJ9xiHrmiXtg9fi+kIh+LhqMiPaPEuT43rQOPtWSTiAJJp5kjab3lEcy5eaXV4zI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VVhFLdBe; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yLgzq2Se; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VVhFLdBe";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yLgzq2Se"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FDZEjb031245
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 19:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=DNpVS+Tg6AfESsEIwTv0xMcGWkZB9glxdX5XA/wPS4w=; b=
	VVhFLdBe/lYNHs5/GtlN3Px3r/og78wXtIbVqDZcHyqOTdbo1NIJb6oPjyteu2A7
	fhj4I2Iv5xUBmaq3cn8GKXUKgOcSedAoRS5kaKvKRhR5URZZ6LyTmngXfGvIVChj
	YXj6g8SJQFBHEn7wxPlMEaKeGWyZ+aFmhnvlDXCBrVYvKjbsfP0QQdmk6SLArgJL
	L4KLj3ZaevrvCA1ZTzIbPcHLLVX1ucbSquNskRIEg+Zp1S0uONADM9fL7QpNRr6x
	/ma+9AGHWyXzH2nxxSGmsx6WZwN+bsdFoOw7pkEJrlV2FdtAiw5oo4Jb4lMMWjcu
	TlMfZVj/ezwUMNQ5wBg5Tg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uk8fyjbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 19:50:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56FIYjmm023714
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 19:50:52 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2068.outbound.protection.outlook.com [40.107.101.68])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5aer3f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 19:50:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWux3Qonu9DnjjMKcr0Gh+ilvhxRKsueTPV49zJVka+9ZGj2ObxQ71bUzDuixX8DNYBmOL/e2liHL5MpwYjOkKLClFP9EBGqOjMBXsC5Oom/KNRTMUI5/tphulA4kGzbQT9bHOxiEqA8VDXPZiTUGadR/nF2j2WRVTXYxd8T4l4mCVYkaOcgS4b7s+6ZtYtH0wi33m23+xPxzhASylDYNNtZ+5oaOoKN3IGr5W5O4cB59QPNoserVtZUSAhGWMZg6kAC1ntIHrpzGz08MzDE9R9xITZqG0C0CHAlFPSPLY3SjrldG+ow9+0Amr2O9v3jCgFjmlcMPbvrMK5FxEvezg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNpVS+Tg6AfESsEIwTv0xMcGWkZB9glxdX5XA/wPS4w=;
 b=VnJliVuwSmxihOMfb+okCSass/W1vuh7x/vLmWC0Gx69TKkzvRGYCJ20YDf9E44ubwFVu9KN230m/wwg3uz8X2u1KgPTMtyyT5a0i/hATSCmXQWKCoKGP6K1T8qyC/tV+G247z1TblO555XecRs9FrCyc0Vn/4shMfxB7938To6zIxP0ebua3VZu2G02U3TKxql34//aYJi3+/lG7sEmziHEBY4t5MqarcIM6qEc1i2jScU/jSkgGvd9hfi8o7VNRcI3jx7nhVBeLu/XEq6YP6g2ABsAwxZ2/4WjK5aRsVkNd8JbI/rpCC8a/6WaXmgoD20mi6RnIuE2cd/qO+vKRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNpVS+Tg6AfESsEIwTv0xMcGWkZB9glxdX5XA/wPS4w=;
 b=yLgzq2SeJW//VYMinHJnOp2+uTZsRwn9+A+s0yx9b4DYQi6Vi731pcrhLmTL4zZI+JOGDRuqTKYnyu2pi3Gkb25rKuXFXTmClx7IKrHOhzEW6GWrHibO4A5HQJGd8OrDNeIahAUejri7yOq1g1EMCKx3pTlK8xd/70JTPB/StKQ=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by BY5PR10MB4225.namprd10.prod.outlook.com (2603:10b6:a03:20f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 15 Jul
 2025 19:50:49 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 19:50:48 +0000
Date: Tue, 15 Jul 2025 15:50:47 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/3] parser: add dt_node_is_tstring()
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:36e::28) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB56724E05E20180520803DE8DC257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|BY5PR10MB4225:EE_
X-MS-Office365-Filtering-Correlation-Id: c349772c-ce33-4059-5521-08ddc3d8e587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qNJ9QSXencrfWKdmMYD6x4WxB9aE9iNBz2HmGMucuPsEhn+JlYctXuBW0WQw?=
 =?us-ascii?Q?VUbn5lW/yFJkcxOUOQj65hNdDWvaWc2yRLPNya+2G4TFy4TqNJA+rZ1Vf2Q6?=
 =?us-ascii?Q?UQa8xxlHHGsERLYQk+KIoqa9+WvrSS3u6F1bG1+tl1ifpSvoQOQdWs74aiHs?=
 =?us-ascii?Q?r6iZh2MCbsGY/Plk9GWpB4RaJ4QNviSOcCDFq6gLkV2EPYfj7jklirHVKnPD?=
 =?us-ascii?Q?/KWrDCeaM1Q9pEpLq83HCfNHChAV7mwCTs6AI5XmKJsTxUNWVt4SiHPsxncJ?=
 =?us-ascii?Q?USQw8rmlqHG9ufJQXMWtc0/NfafNFg2wOy2F8PJKdzXcrXDv4K3IdZ/Sc1qT?=
 =?us-ascii?Q?Dv8KASKzBlLBMO0Gb6gjw8Rstqehv+8rjnWApUxUhtj6TObVATQNrk8U8a45?=
 =?us-ascii?Q?rOTc+3p/5z2AmVzS4+pI4MXMAk+BbONsyhbus+6LzxPWOT+EB4p1Qp8vPnwW?=
 =?us-ascii?Q?swh/U5n7ZS2wyoa8eqsBF9gflYowhS2nC2nNHJIJEb4HJp+x3RnZXZiM3y3m?=
 =?us-ascii?Q?Ay6s5JH5FEqQ4qzjc2ZIxIbXhBYFIKJ+L8IEXAAJnqlBsihVP+dRSCATb+Zg?=
 =?us-ascii?Q?3qzHxZMyromvGLuX5riYWF/yqsrNAOt+idZsglcPpibIaZLeZqGntGy4kKCe?=
 =?us-ascii?Q?yKZ57wOKsHWY6OT/8Sol2fLr+kSmQl1W4AK6xyYjpPz+xCn+LxQBlfEOY0lH?=
 =?us-ascii?Q?LsqV/ENa9Ek9wO3DKbuABwj/KIPeXmcSEXRnd1iv1x6g3IcrsMD0SmtVwBeY?=
 =?us-ascii?Q?fkmTvKtC1MHywkcur2nWsdBTnPGwktNpYMomPDfi46TcEmcKRg3nRKMtwBuc?=
 =?us-ascii?Q?4W4At/g9xv1FzZ/yyAo2Zcz5QIpcdysa2giixrp9hWnLT8MiZwfp2B6Tu/IO?=
 =?us-ascii?Q?/lCUwqxzY5Hncd0k2nQ2u9AvxJNFHfkq2Y9JhzaJIxbk+49eL26/VSWFOyNd?=
 =?us-ascii?Q?IsGefz3lpfWyjzZyLjP53ahQ5B+oAyHCdRxMOpl3ZlLZSzfZIJnK/9Mg9OzE?=
 =?us-ascii?Q?7EJQyEAMA2Jo5AewBbBA+5DBEhdlt0O8dBwtROHB0yW1yQlu6q1rEhxvLAnh?=
 =?us-ascii?Q?ipMh3V0IqTDgiEKUxS/qyswVD41ZaxY4OgOvSvqK+bkt2WtvC5NFi6n0I9z1?=
 =?us-ascii?Q?mxHM4NXWWEES6cvksB9eoK3yOXtxZV1SYwi/oho5hzHwgHr9Iwy07INgHUov?=
 =?us-ascii?Q?TEXiACQi5++6mzQnhqVZS7hrqpCCWT43hv7y6Vp2ABAu9Ot6VjBrBpS39N6+?=
 =?us-ascii?Q?RCNkIxn5ju6ZkZbVIoGg4c74xCZ5UsKCKRqeEH9qV09g44SGpzsI4/i1W3HP?=
 =?us-ascii?Q?y3poyTEGwMO3jPLzUl9TTGA4qhFVpr94HCRZ94DzjQ67+P4jIee5Ogezxvfn?=
 =?us-ascii?Q?Kc6WJQNhLUmyjOjgpGxcu0kXLG0P67gSbdiDaNaXWraIiuto7PjcwOK+g2WE?=
 =?us-ascii?Q?P/s4j/jlERw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L16/jTpc1U/bFeCBkQunkG4lxvSNXLb4T9vw1w7NWe6PnVixpe4s+e2QKcjA?=
 =?us-ascii?Q?TtqLXNEsXSwWzUTxwdd5osEKCJeAcf6zRcSQu8NOSbKEZkLc+jtynG8d6UHs?=
 =?us-ascii?Q?bUJNslMlADeG4RwDdxgNT2cTi+8MGQ4xz6wJBb7UcVjuI9wGJXPUqvY0k5fV?=
 =?us-ascii?Q?HuRhHWPX12cSPYoXuAN3gk8anD2plly3z0O4BX9u5qtQysbvuRuk/wRivKj1?=
 =?us-ascii?Q?O01aHkLAq+cer9VbVTDE1bPOlnbuuMcEjRGqLO8Bkr4UJWOANG0RoDxaWx2b?=
 =?us-ascii?Q?fA3qnBmCkn/K7EK+5Wyx5MG3SOesPk+/0DXVoKEjKdLCM6ybTOtaJkOZDAYU?=
 =?us-ascii?Q?2cBdyFTlZ5V5fmnHMzk0Hf/7Z8WixCvfR+LU2BLhqt7s5l0261dPru9D9sKs?=
 =?us-ascii?Q?MCaT/VAK2Jri0ScqDfysMCVzNm9RdOcTfzKbZ405rauWwjvvuLiXds7TswoX?=
 =?us-ascii?Q?Vsf1RxgnbjWxXgzJTuuqYKp14zGRvlaCZt6JY92ebfnnNTXqvhj1YR0htOq4?=
 =?us-ascii?Q?QTIRWUgQ0hvSuWXPY1KOKcjIvCpMZI1T75KgqcfhpUTPFVA3VBLbL41WZ0NO?=
 =?us-ascii?Q?3U4YQdXStK8w+57SWM/9DT5EjHgvpzICffJQeG1pu9nVkU3yebSUtQPw2aNy?=
 =?us-ascii?Q?fxKEuDbz4vakH1pRDNGCEEh52U4217qAIWQY4AHYjBZyP7PjNZ7D27MSjU+f?=
 =?us-ascii?Q?JFLrUMA3edzZdHyYmOwpObC0ue2a6coPbdNmRji3DSETG/al/LsYXjPWUtyf?=
 =?us-ascii?Q?JWSjtoAKlUCJm7doY7kDWFBELSArRIR4oOKAfyc8w9lg+HWNxX1EWZDmoGBT?=
 =?us-ascii?Q?WJ0r2UOTceGvafqgSt8/KxD5cmf8iUbPKQojmmVtLMlPYjOukaNvb5bNUxiX?=
 =?us-ascii?Q?pLmMSkDrzTFPqBtGfeLzoOZmU/4LOuRgspYDtyvGA6HYhiEHR2Ny3gf/pOJD?=
 =?us-ascii?Q?WUoyvU4MdgpqTrs7yUD5/eoVENyf9kzLx+iFLMTqOXpYRIDJzb+D4yqDiQpy?=
 =?us-ascii?Q?OIqiBqhlT5IZKFfeir/2CPaQ7mLKHDf/OvG10zYT0Wn6fCScHlkUmymiKxyR?=
 =?us-ascii?Q?KorVgDVDqP1bvX1jKuRRi6puahDu5hQsa4u6TfOy+H4vdjGETcQ7+i1TTEui?=
 =?us-ascii?Q?TXChL/vl3FX7nrPFCl5+K1x8qmQBoHAva56aq1SwmijMoYLflVjBaxZOCkKa?=
 =?us-ascii?Q?SFqLDqO1Bhd6Gp2FDO92o+ge3Eb1ywLXo0+tjVB1S6OSODP+vBIiZITCzhuv?=
 =?us-ascii?Q?1wp68COxfB8QgDLThkDIejNDAIZA2lQFijrneXRo/OguFxXftvbdkwY9CYY8?=
 =?us-ascii?Q?83tcz5sUr0qXYutdoaQUj1CtsXCdUUH4IcSX/sCfuJVZvWk7lFHt7jURy/Bi?=
 =?us-ascii?Q?B4DbFgchcduUR6v0Flzoj+ZhOcO7X57qIgSQZs4OS/pesDmk6TpMrTuwcXSM?=
 =?us-ascii?Q?VpsC+JdXUzRTuRnJ4r8o4qAb4WYu4JSdfHsqnqUCmWjYzENsO1tRESHCTUob?=
 =?us-ascii?Q?uimNxNCDXCJ3J7iwt4z6LzlPR0GAGeevp9T+TBdIW03JiZZHLTscjUhzisat?=
 =?us-ascii?Q?hj7mNqf0H6e/OyqdqWO6DPKIQ7QXV/yln/t46rihiJswd7SvbuDVpnX5V7jo?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Q2sqzdG7P5Bp3zVLlW8s12JDGkqdRxrwKiSUQkbGA+pJuBdom0s1Zay0xNhZcncKxdhb+ZjlJu6YMhergpFCUF8HzSHd3w0g6AAzV91sIDf0E8V2C9aXHQOFu34dhCaMB6/Wr2n08SuAT927E+a0OnJZfFhe9+8S8g05gbjLtt3Nbla+aFv9aufM26o3D9iIOJqUcD/Zul290aJs4YXz9PDHB0B/CLSPP1+vL9PNfjnj1gEa7iwL4G17E5Bj0g7WPW5GnhnFjPN7godwQbELJvpuT66e9qACxIHTLkuMxq22gDXbQSq8m0Ws4IENhXpaq/YDyOQndOptG4Cc19wtvdeW4YKTQ03cAl5AUDqr3N70ZmJyfs0OE8clChhiY58FbkoQfXAFkYXV5gA26NMHi/CzR9P1xfkS+pQPozY5kv13Z+LKmURgl1B5UWnIEP0GG3P5MUVBTP1dUOQODYOL31YsV/APD7atMfco+47VJBXccxC8mGhFyCYUe4RtnmDx3i1+JGYLvEO+wbAfoiEWQ08vRz1FIjF3YvMU4pOdgZ8+udlrQs6Y8peISBbmbHf1izUDpfOZhb5C992wPizXYBub2YM2IragsnyNnF0kt9c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c349772c-ce33-4059-5521-08ddc3d8e587
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 19:50:48.9197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mimNN4uPws40pfo6Yd5L2jrPdrBzPBfJuXmXvDYiyrrbzrKkWECipGmOYFolnyCIITLluSDMmy/RUumDIWLYIPk5vJiufeR84jiy9UAedxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4225
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507150183
X-Proofpoint-ORIG-GUID: z8YkthBLm_sACSK7lNnCe8YNxnCzlMga
X-Authority-Analysis: v=2.4 cv=Of+YDgTY c=1 sm=1 tr=0 ts=6876b11d b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=3DLIYNNlfpBoVDRhRbIA:9
X-Proofpoint-GUID: z8YkthBLm_sACSK7lNnCe8YNxnCzlMga
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE4MiBTYWx0ZWRfX2XoZyxQszHd6 vF09TcX+z6+5u8nyWE3l8LJ5jwqlHPC9VZn3qLz0fMCgQS0WXsE4NnXxqSXE65QrGt62fgPin15 hU8C9kc+lorIy+2MW8/VyGrH9bNme8KNc/QHUxdZtALpoA4ukBrIiXn1f/UOhtWkHK3QBhaWVoH
 ysfAuOh0eX3RYCcvk9mtT662hnXz+ziRs/NM6UdXK1ldLOA170FYhBKdurDZL/Ot9w/Iq01dw9f kZQMtE/Ls5O3NxACVps17pQrHooMesNFey8GZLZdb8rvEufCfc6dtP9h8RNO5Y3NcICFoxZXN/6 hU7zvBJgAhTk3582KaQKMoqJZOIsyxelWi7YnWDXHKLqKJ+tX7MMCqYmUTdmqoxcHF/qKeKs07q
 RXvK78Y5XL+kopZgsan4rV4Y/0duqyH33f+QAN3dXaIjQbfpHdbzOV6xReF6xavIA5TijxeG

Returns 1 if the given node has a tstring associated with it.  Internal
change to make implementing optimized tstring-handling easier.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_parser.c | 15 +++++++++++++++
 libdtrace/dt_parser.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/libdtrace/dt_parser.c b/libdtrace/dt_parser.c
index eefe8341..f777a910 100644
--- a/libdtrace/dt_parser.c
+++ b/libdtrace/dt_parser.c
@@ -1227,6 +1227,21 @@ dt_node_is_actfunc(const dt_node_t *dnp)
 	    dnp->dn_ident->di_kind == DT_IDENT_ACTFUNC;
 }
 
+int
+dt_node_is_tstring(const dt_node_t *dnp)
+{
+	switch (dnp->dn_kind) {
+	default:
+		return 0;
+	case DT_NODE_FUNC:
+	case DT_NODE_OP1:
+	case DT_NODE_OP2:
+	case DT_NODE_OP3:
+	case DT_NODE_DEXPR:
+		return dnp->dn_tstring != NULL;
+	}
+}
+
 /*
  * The original rules for integer constant typing are described in K&R[A2.5.1].
  * However, since we support long long, we instead use the rules from ISO C99
diff --git a/libdtrace/dt_parser.h b/libdtrace/dt_parser.h
index 13f3cc99..ff32a84a 100644
--- a/libdtrace/dt_parser.h
+++ b/libdtrace/dt_parser.h
@@ -182,6 +182,7 @@ extern int dt_node_is_ptrcompat(const dt_node_t *, const dt_node_t *,
 extern int dt_node_is_argcompat(const dt_node_t *, const dt_node_t *);
 extern int dt_node_is_posconst(const dt_node_t *);
 extern int dt_node_is_actfunc(const dt_node_t *);
+extern int dt_node_is_tstring(const dt_node_t *);
 
 extern dt_node_t *dt_node_int(uintmax_t);
 extern dt_node_t *dt_node_string(char *);
-- 
2.45.2

