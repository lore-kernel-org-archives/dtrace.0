Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D0D1E5B72
	for <dtrace@lists.linux.dev>; Wed,  1 Oct 2025 14:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759329815; cv=fail; b=j5hF3ZxYaT4xgCUIKOIF0kw0NoG3oITJDoxjGm+wju3H7rjvCoq0oiNHrsBFwzGRotzb7OxiaYeO8OB2T8jo2W/JV+lbib4ccort+KEA5UrI+jMQEqKzQsD/E2My8OSPuymxHJD5evrQnG22dB8EXmQXFsmTZ946nEu0+t7AG5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759329815; c=relaxed/simple;
	bh=KoXnwc2aO5h7ktr6QRfdOsqdfU5bo4jRynUeF4oySno=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=f0rsYQ+QD31nkndCCvO/bFHspncGOy8Jqx0wsmI9ELY9AT4axfIKQNa0FFlBkMcM3fKlD3Ug3ILvLwbfGgW7fH+bNxgrCAFMv0OH15B+5XaGkbJhmFkhYIF8Jrur9BIgDCVo/c+4ldfjRTjJM5soSdh+r/2qaKmTPyfcKxpV/J8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JbOMacIQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=t8uhkF1l; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JbOMacIQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="t8uhkF1l"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591CrDd4019467
	for <dtrace@lists.linux.dev>; Wed, 1 Oct 2025 14:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=fRkHxz4WirgL8E7P+QthUjvR4YJCKWVPuhinkVTtyus=; b=
	JbOMacIQ9qMz3bmXnbkanqhipekQIPpdDwmb6ffE6i9jtsm9aOeySmu6tadvRrii
	Jgq13jf4/Yd+hO4akZO+bWbhfJDS23gKdwTZpmgOkEvDr915aRsh73jPKJBwcCZi
	PjKsng8WkGp/8muR6IMgtVEgF03CE5xM1Ld2Ow8d/ELIududNXvcIgFfrLUmbdl4
	OXS3UtexNHcEuqr3xNWzeaEm6VlIS5dTmvFDnH0dnRlXdJ+C3sUyL6O6H87Pk1E4
	Yu66XJVtTQi8xImSYLOg+2PG2iSs7PVE6rJDYRufMLOBQ/SY9y0AjBE7tjbbce0K
	pq7OCef763zW+S0OsYmMXw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49gm3bhmma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 Oct 2025 14:43:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 591EdOe0000337
	for <dtrace@lists.linux.dev>; Wed, 1 Oct 2025 14:43:31 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011021.outbound.protection.outlook.com [52.101.52.21])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49e6cftaf0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 Oct 2025 14:43:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MvKI8FUYgLxRNP66QiG103oqRjlPUnmyxwwJcrKJRSACpm7JcxO9FcBSpCSioz+nY4mfPQaO5ZR17rd1ma2nTeh8c7xyTY89MjqIvsFFSL4PLsMxiqzlE6CnneT+QHDl71tyl2Y42hzPIqWq7FAqOVhrn/CNanY74fQcSB8kOwOuqZevwMHQVWiVEzXv0k/54O51QwchD04kZRX3PGjMRoU1pui7CYK9KCMn9+PVaN00uDHbX/HZ5H5L0t8JOzKuh95PUrkVBzgY3XeIJje+p2Ag0meBcyYjnkbv2RiRmgMaAeoPwI5QyeUa6zckiWspimsbiK22uhjAYhibce0Xbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRkHxz4WirgL8E7P+QthUjvR4YJCKWVPuhinkVTtyus=;
 b=KPPWgVhojH2cW0og4N4YO8V3WAcHiznBj+lQgHDEsGDGRZEYmfhDNNktMZlfjFlrdEfXtQflVZNe5tY2bphD8wQ8uYl+wu0Xk/b2zW66kgj2tXdGqo2Siila4kJb7xH2fgbQZCnKI0bbE7fE7/8uJQtBUev5VORpZ6iTxxaqU44GIRBqRL8ftP29gTAiCi07D2b0Vn+TpZY+hDM0MvYzWwHuwZZI/9330VwADkKhmki3VcbBpio+hRMQUeYPdaLXNNm+VtvM+vMbLotN0wEY6gji8q2DIn8dOhX08TqmmyBmJfEHueMbTxra+12KFqlrAl5m0HoOsD+r6+XzEgk9sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRkHxz4WirgL8E7P+QthUjvR4YJCKWVPuhinkVTtyus=;
 b=t8uhkF1l9UtwervHZC9NK3pJFCeq4EnflTDymuuE8CVZbCpg+KbL1FQpNC5GLQAyuFQbgmrQqS6J9odfUFgZgr/nnUvBsX5mor/MHNEboWG4iExrzezmXsDuiL0QzR2+aVh+d/nBLdyAVGueV/O5ovWectpd/RG+yXezJHdqhIY=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by MN6PR10MB8023.namprd10.prod.outlook.com (2603:10b6:208:4fb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Wed, 1 Oct
 2025 14:43:14 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 14:43:14 +0000
Date: Wed, 01 Oct 2025 10:43:12 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] cg, agg: fix alignment of key components
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:208:36e::21) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672C0C0B5FEB048DF0CF23CC2E6A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|MN6PR10MB8023:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d63f2d1-e3c3-47dc-9af1-08de00f8d9c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uY78hFbnCW5mIXK5GX9gcKGfcZwSJWIt535Vv3foHIDsYTXVbYJmWlmGUC88?=
 =?us-ascii?Q?P8jHDbcujbaxGRc++SjsxoFhovlrNH5+fxWOYMLPASfzEh0nJlRFklfB88hx?=
 =?us-ascii?Q?7pZjBQa1NYnMr49qN0DoU3vCE7Wjzzq9QfstXskgtfCqwzCNs6iikskpHYHA?=
 =?us-ascii?Q?ytIq0ODPh1FLTwqlbuZ7hRjTGU3+hZqWsEP4rHCVaX/MU4oPEfufF9H9UGf9?=
 =?us-ascii?Q?SfaeCgbfnMD3Otv9LMB4LbmS4caOgvnOPqY+kcbrQATQrED4SezylcKpPtH4?=
 =?us-ascii?Q?BbXGsT6smBwUX/VTWp3+1f/O+Nu4rxN69e5pQPpJpLYOogv/nZm2QRUqt0pa?=
 =?us-ascii?Q?E5kOFQTl2nZuBLiNKwq4k/NgBcId+z0X7qKPjtlq+1+AxK0Y25SNFZFdOTub?=
 =?us-ascii?Q?7aDZZNGClgwhxfu+HPyPPN4IfMpCm/1uVTTkN+ENFF+I2c/Hu3oVddmRWB37?=
 =?us-ascii?Q?pvuftk8O4ELQ5yMDQWhGCfOsDk1kr8ZFEmNekZH1G8iVprHbEqItJ1+g1ZIU?=
 =?us-ascii?Q?GeYN+//8dmhLykVantGW/BP23cBG3tC7iaPPom0o9AKJioEvcioXUY5Be3g6?=
 =?us-ascii?Q?ua2XimCnSVPE9MMKKQpw2xNJpBpGqWXg+lkv+Dx6rxdqFAVe3W/chcr7zpNW?=
 =?us-ascii?Q?YgFhiVQccrz4aBCWTef8LJ+91twE6UT2slVCgQSvlkvD1hxeQNE+aOQIylpP?=
 =?us-ascii?Q?XBzc+7pdmtkjT8jkdURcqIO0+2a19c/YF7zLTyE6V05lTOf1saqG6MmcvM19?=
 =?us-ascii?Q?6yM2Gxa8/NMIcktzQqHraYj5RD1+oglx8xEDQvUPgYb5sz7diJAlFkbe/lKL?=
 =?us-ascii?Q?10uoesUCHoxF2B+pK55Q7/ollktGoFwGE/3Ch77GvmEieCeJRwdy7L43ypLQ?=
 =?us-ascii?Q?VhQpMA45mLhTYoZ1xuyXXh2kKcrkRNoMsJ36h2QOJWOkMp6Q3wt83G9eiiMx?=
 =?us-ascii?Q?GkG3JUFz0ywOqfRBnT6APlGd3eQpFAd7ojeJCN3Llu4Id3y7tSvsLGNL67bI?=
 =?us-ascii?Q?Df+2fq+iHWcWIfYSYaI4Ty/Pky70wCeUwvGsBIWMu8//c+lhcHy7lYRw21V7?=
 =?us-ascii?Q?F1hGjJQ8NxSLHILKYpHoRKz5sVCgxeSVwEPTvcjyX3Fq/XG1NnntUKefDkln?=
 =?us-ascii?Q?OnScufw0boMs/i6dNjK2wqrubV803W3KwL7go4M0F20JvyDAGwplOv33DYdc?=
 =?us-ascii?Q?HGvFcPD1c0LmWxg7s48mkonbUqZSG+QYwlc+CIs3XGi1JgNuTcvwYuFBdAcO?=
 =?us-ascii?Q?XRDJwhXhbNdHU2PR+NBlRu9EIKGIYlQBuK84IHZ8R4RqNgZMDjm1g0O7tE6E?=
 =?us-ascii?Q?RZdME0J0xb9tFemU4FhyZFne/gT/47XWh8crUnPWkW/iPwo6Fd35gNFgGLfW?=
 =?us-ascii?Q?LwvyyMAL7yVIWfkWkp94g3DY/7bES5kLHU8ujT9IiRXkQ9gRAso0YcRK5pAC?=
 =?us-ascii?Q?yCkMf1XmjvpWm7U2mPyiwRWTmAeWrSip?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZOjlvCL195LTK0CAUmOtoVSzQhzZrQG90zx+Qa/1TXKBZU/m8E5sUCc0X5bL?=
 =?us-ascii?Q?sJTnBkp2nLp4ZTrDTKDlLocXlldboUEb3l6/q/wljjkdthH0CXEX2nZwU3HN?=
 =?us-ascii?Q?xGGDruSJjK9ikkNDj5qQ2VRKfHrl7jm3ymVeTmMZaWNGvAi4QH/0vcjpmp/2?=
 =?us-ascii?Q?Oq2in3Leq8G/jBUVq/ypG1gmNFdFLHOI+jH2N9XyZqk2uIXatwpUkPaALRnm?=
 =?us-ascii?Q?/UI89smUT0KaD4/CIxn5LTKr4xzkupOlw6mQBxqZe42LoIllQ0h4O7IAp5ju?=
 =?us-ascii?Q?Lgg8WLsPpZUSVvKDoueWfCyRHM8m0U4RwzebacpEHEkALHUWHCHl1karN/Sm?=
 =?us-ascii?Q?kBLeZeCVpyfRPJ2LcQLjxWPji9maWehX/aG//MGztMgZWeqE/htu39xFxbRa?=
 =?us-ascii?Q?Hlfk2dNiXFLj+K3Zqj2ffrtBpBMqRrmk3+a8ZmZPHsSabc0QGe/T/BhrMCLs?=
 =?us-ascii?Q?TonE9IHAGlHylDU7QTO/33KDeZaBWcs91bme1KtUilWN1jdnxzvaL70gycV+?=
 =?us-ascii?Q?UDQsXXg33zd7UG+pDbXe+CIzaFpyW8uswAn5TZOqMrUh6T0jQhONFLbCu42Y?=
 =?us-ascii?Q?MHboxS7eDEERxhWNK031A/g9+LjE12iFaDnpnIrrN15gE0dMD0pzS82Jid4d?=
 =?us-ascii?Q?dVCcBHAW8zahJNrLBCrMAvYBg+HKR1n1l2r+DTOqc0F9ezI8/352sO9/6P0n?=
 =?us-ascii?Q?MjUAvZ+6x/cP/Chd449+HpA8CZsN0TN/gK05wqdX4T04HZ8mLmo/4baPpIms?=
 =?us-ascii?Q?oaw90yYllqmYn3A8D6fTSuuq3Q4LnADtDFiUyEz9d3w7w8GWn+XQgVVutZdy?=
 =?us-ascii?Q?RCPJBrT/kU9sJcCCsTjdoYjTnv+oVKId0SQ8BE8O7STGAH8a69xTHFD9N98c?=
 =?us-ascii?Q?g9ciS6d2IiWx9vj8EuCjVsZ4jPOKpjPnddK5cUm1Ap01L/2tRdIrYLAosMTe?=
 =?us-ascii?Q?GY/TIPE/FtYiclDibbPzpTnCSyIwGzBgfpXiJxFJhdwYJeNSKcFAfDl3AK0y?=
 =?us-ascii?Q?P2nufqO/02Ibdo4KtzOBNZHSt5MxtOxYF3/34i83DtMaRHCq5RCHtnhgkcKY?=
 =?us-ascii?Q?cGu+I90YJD0NeqXHZNXheFzaNoIorl/M9uPSP0SjSooA14qwhRbo+35OdFT4?=
 =?us-ascii?Q?NCT874cTfM7SPiO6QGvWzhNSvRNsUvmTHj7EDlU6d+C0tc+Kf+v7VQ925hj0?=
 =?us-ascii?Q?jFfFrerX+r/Au42gi8eGaG8EBXkGrZGO9v0VaePlDKNujvTFt5ugjYOgPpD7?=
 =?us-ascii?Q?+AY+iaIxkDfOOhOAAwCX8cGIQWwuqjwU5S2EbB7g54jOw/W7bWstrkEwbSA5?=
 =?us-ascii?Q?AX70uGLHBRZunswXsiRccH8bAL3vSyGVDzKrz965KKx6AIjgbE6jeEwCHmqD?=
 =?us-ascii?Q?4u6t9gc38I5CHnWyt+FwdM6J2S+DIii0m9NKVvKTIOj3jeU/49lbpppniE9p?=
 =?us-ascii?Q?oK8zMGRZrgVLptiVBGBejkySA7Wl190isTbbIuGGO4bZYO4Gev/wEc7XfmvN?=
 =?us-ascii?Q?BaJQ+Gv4mRPt5I1SxpBvzxJf8hwVsjG6WB88WYuUK554I5Q2TaaVviM24Ert?=
 =?us-ascii?Q?5g4KlSZQpp5aIukrjj0H7yC63U2J9iw2Jd4vo/4gE+71dtl8hwE3EjuU0r7t?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Woi15Ro7JJsgN5C0/BoOgjAWLfQMR9jeQmto9gX/eTGHLu/egNMbfXp/z8h2a0vOj4V45QrBOgnPgzFTEkhrGPWDbdHL+381inCVzSdeM+RK+AduOyusItfFGrsLsy1kRgyjaniANvntZZEQeH1OXGCtACbdk3AQclOhpz3nqIX7Vs+IurbH+XbkXFBeKYGXxufcjmnQdyxEHDPGWjOSvqI1GaUEMC6DDJbIEqvfCB9oXzURMenZ8ckIOddXaQc3zHizFXjY1LcFca7cYiRjYvWNXT1CRv5Uu99VlcUhdHdtaYx7TSnb0jLorCREy7mfOz1S5XcwkzfwUuWrK6TaGio0uY1G7MXUXd+gA5+6+OuU4ei5aUTZy2qJkZxj3GW6Da5Jld3CtIwUff4R7oTM6in5PnTKkcYWm8FVzOnTy1OoOv1WD8xaihSKuCIkD6r5JThSHmFKScPF1jYXho0tTUv+IlFY5ndqjcaXMHUNU36TjX9GTlBYEUuQbYjvsLB9STkFHcABHbtwiwz/ZCU3OGv2xYV/XPiMPNPTWTQv3BubXt6zD9cQtIf/vIKY6JuzgYzcTncgd5LSVWoVtlpwAiHCOY4ZcFPdPcR0aW1TLLA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d63f2d1-e3c3-47dc-9af1-08de00f8d9c5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 14:43:14.0170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rSMNFyJqMTh00O44N3Mq2UEkf3Gqy/I2kfjHmZYGERq9F5jm/tDdzJvJ3XC5PN/pA0Tmn3Rq5/b7yaZD6fPvHcwaicV5SV3eE7bnT4yCvBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8023
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=860
 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510010128
X-Proofpoint-GUID: 8kVfTO4Y-PNCEtOyocBGFgDp5yUCFG40
X-Authority-Analysis: v=2.4 cv=GsJPO01C c=1 sm=1 tr=0 ts=68dd3e15 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=9ObycXa3Og6zOuCt8YMA:9 cc=ntf
 awl=host:12089
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDE2MiBTYWx0ZWRfX/lrAazxROy5W
 Kwm5D2hZZuR8v1OhkZquVMuv+C/nZbiHa0MgdwR1IuNvrUJqEvp1xvi8vR8qrHO/4044IYrWVI3
 jLd7gxWWkBpVQ2GoGWtBq2wnFDlkppe0f2ypLbcxBPkjeCcJA05RKDk0IBJ4U/MztGBvChDWPF4
 ipN+unz6DDoJxUsJx2emsmnaqWQNPBUPFTitmj/I8IY4PPV2JpaYobHPRKK/AKfNpvch00c8uGx
 fvi5rdW/eyXj66FNh+f4ZJ1lRhja236Exi1xhDBSDBr8A7t4rx3Y8/thYM9hxR9LMo6HSqSUXRd
 es0A/TU6lVoIDICJBZJELSlClXSchUGOZaWvTfBixuGEvDItFOtDAPAeiZAVyfsESMSsFuaPEAH
 kf1RtQpnizKUwZUaEUELtefUhQAnB9H1L9vmCDlTLQ14L+zwMek=
X-Proofpoint-ORIG-GUID: 8kVfTO4Y-PNCEtOyocBGFgDp5yUCFG40

Reported-by: Ruud van der Pas <ruud.vanderpas@oracle.com>
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_cg.c                      |  2 +-
 test/unittest/aggs/tst.chararray-key.d | 25 +++++++++++++++++++++++++
 test/unittest/aggs/tst.chararray-key.r |  2 ++
 3 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 test/unittest/aggs/tst.chararray-key.d
 create mode 100644 test/unittest/aggs/tst.chararray-key.r

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 1f120e1d..33435226 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -8734,7 +8734,7 @@ dt_cg_agg(dt_pcb_t *pcb, dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 
 				dt_node_diftype(dtp, knp, &t);
 				size = t.dtdt_size;
-				alignment = size;
+				alignment = t.dtdt_align;
 			}
 
 			dt_aggid_rec_add(dtp, aid->di_id, kind, size, alignment, arg);
diff --git a/test/unittest/aggs/tst.chararray-key.d b/test/unittest/aggs/tst.chararray-key.d
new file mode 100644
index 00000000..af45d4a5
--- /dev/null
+++ b/test/unittest/aggs/tst.chararray-key.d
@@ -0,0 +1,25 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Char arrays can be used a key components.
+ *
+ * SECTION: Aggregations/Aggregations
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	@[curpsinfo->pr_fname] = count();
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/aggs/tst.chararray-key.r b/test/unittest/aggs/tst.chararray-key.r
new file mode 100644
index 00000000..a2dcbc2d
--- /dev/null
+++ b/test/unittest/aggs/tst.chararray-key.r
@@ -0,0 +1,2 @@
+
+  dtrace                                                            1
-- 
2.51.0

