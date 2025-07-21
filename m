Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0251222D785
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 20:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753129479; cv=fail; b=EDBGdLspdK8r5ZNwaUv9ZvWlezriaA6J/AWcPUmXl/Er+a15bBspiAll+N6+igpifEepiVPNeWA/4tt47SzW9PbxwmO+Ct0XM0wsBl1UrYsSxl6I5oy/yLbk6EIIDLAK9p1qghjs3HdA/ACMcdfFz0iKGYhR84uI5i5gelkDNRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753129479; c=relaxed/simple;
	bh=y6O5NnUlY9hZXbnoX/JV+Xho8OhHTwLtombpbpqQtJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nZtNXkz2UpRMUejKhtfG1zfBxvrQcWPE/g/fUl5EiM+7iuto2g0Uq5m+z8i6iSTRJvE1QsBPJnYLtbGHxbAtkY+BXRWLRuk+EtO65uCQBZ7p9SxOhi4wM0wZVdNR/4wzeTtRtJw/GtZo2qcZjQGsUFTaC5f743XVFVchI3ooOwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ltewKN4m; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UYQmX8N2; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ltewKN4m";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UYQmX8N2"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LHft6W016432
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 20:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=0FoLMsGfmAH04T5q0r
	75Qr6aKntdKVTaBaVIz3XHqO4=; b=ltewKN4m0/ZUFHX2TZkDPa+bMtk/CV9PHc
	Qq5UF9ikAXi8OFUQXI3NY6sqIOUamSJDdZtzPdrhwGw+4GF0/WCB/lVBHq+EcuhW
	HSzXVn970hb43XkysYYdPzSZzWFCc+QeajgcUKQS6SUQrAcg5qnFTSoCXbiojdtd
	RVWBQI2EHDkwyfsnAnedt8ZQUhZcLWHtinpDwhmwYqPug9y0nbAx0cbBGEWJ7Rly
	I4vBaySMVDwXeUaMVeFOfbN7oD0llg6xL8Y0zLxNFkPgMk7vHCDN/7Q0WsD93I18
	mvfdGLKjSvLpo5lw6akhgZ/xh9+rzF9T2QIAl8maB6StvJK2ip5g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805gpkqyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 20:24:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56LK8R8Y031450
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 20:24:35 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801tes8gr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 20:24:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kebz0+ZfspXeo76vmZPFezKSKwzwWdPFYq7y3SaG8+aDO2tsHBcJfEhxkhn+/7XT/DJ6JVWQuDrAPvCHzARiWTA3Whr7Z3HFLJqvDtQ0xScOv9mVR5Gn5E3f5CEBUjBt/gZLuXM3KhAzH3jPl3q/6V1S02l7l9wkrBDCBN4XV8mrCSUwaniQ5DUtbAqR4KgoNB+Nv79tOt75t83+NUR+BqGUNRZUAwZ4Ai0W2Ked5mo1yM0Bhx0wFdBd04M7egECgpz/wyxNLIcHwYCQJLeoP5Ryk73Xi4oQLTPM5bpii/L+rSRgNwKwJhfsGJJqp5FJ/W/FclNuA1CcpfCsTnHWpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FoLMsGfmAH04T5q0r75Qr6aKntdKVTaBaVIz3XHqO4=;
 b=ZFIOqJIl1vlFN+hTQs5o/blU2vJuOF2mVOgDHTGzp5qeI5bb0m22YjBdr2CVacgKPOQX15FhXA8q3W4Mcx+01NRC8oxb15RsBkSyT93z82Pb7JUn1QrQpVFHe8DgfrGioUxVQ7aRDf4yKPuKNs+xAmRSG1TOozv8OYEYfd5VcsiMRFe2D3w9XBWZtnZjDmRVMmDLEEmMRs+Erj4UU7xpJz1dIqzXiQC0ibu8FSufx5Qi6DkB8sH4BbmpMU5Qtoj0DzFEwMhi+HiODPNuk6HhPSHLlmzJuwj6AELSvho43Iledde8ZMcY7SBISCEEjMAG+QDy2W5gh9yCxaNcDUs/Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FoLMsGfmAH04T5q0r75Qr6aKntdKVTaBaVIz3XHqO4=;
 b=UYQmX8N2V3mfxSjdjihXg29JTCdHPs7NaM1OwbQCiz5lJVmNdI2PXNefHZVmrkVuIsN+WdBxi5Zdh33p6Q5RTXRbxVPaTW8pD2o2CKzYzOdsHsvJlA8Olj2lR0CrZ2JVO8g6TnpPBXP2QotWoPouLz+jMzpj9X4KfG316akY/tY=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA4PR10MB8253.namprd10.prod.outlook.com (2603:10b6:208:561::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 20:24:33 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.042; Mon, 21 Jul 2025
 20:24:33 +0000
Date: Mon, 21 Jul 2025 16:24:29 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v4 4/7] providers: move network-generic
 definitions to net.d
Message-ID: <aH6h/RcB2yiRAN3Z@oracle.com>
References: <20250709144700.20591-1-alan.maguire@oracle.com>
 <20250709144700.20591-5-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709144700.20591-5-alan.maguire@oracle.com>
X-ClientProxiedBy: BLAPR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:208:36e::29) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA4PR10MB8253:EE_
X-MS-Office365-Filtering-Correlation-Id: e73fdf1f-ee90-472d-54b5-08ddc8949a81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j/2Ab1T3QimgSrO621o4wnOK5DiOQlMtHQ8ordYOJ+3D9753BYpNzXBIBNsM?=
 =?us-ascii?Q?4mIJuqJZ9ZI3A4XcJNrG7O2Ny/ESV1Hwefc4Yrc0me0NRsBveMu8i/OMarXo?=
 =?us-ascii?Q?afVXCQjETM357Cv1imPPdYNPzRMV+QrlM0qzic6hVxxXAjX+1ITuC/h5u7oV?=
 =?us-ascii?Q?3iWDsLUMOzMet88WexC3IO9F+a76Inms9IJ6439QEY/AI3F1JASYsebNsTP2?=
 =?us-ascii?Q?ifEed1Yadr9j1WdbOjKAQ4XksCc5bbMxo06RAFZc06dfHiceFbmFw/7qh5qx?=
 =?us-ascii?Q?lhQn5NJajdU0Sm1ht+BciuAQx1m8q9/Zf+X5elhRad8EVGiC+g2/t3n/idxq?=
 =?us-ascii?Q?zVM3QFxsTMb2IPeb1Rww8KMoCe4NzGAIEt7eY5NiwmZUgo8ajxnPIdK/B/9Z?=
 =?us-ascii?Q?nJdrTGCjABUnxLVQ4KH3goqXynNxXe591YNetVvKHeguGpJTN50USt9YblJy?=
 =?us-ascii?Q?J97BTdhTP26PglsUeRXppIrgJVROlzCpMCGG9NXw1f7RsQvouVFKqn+Pbhao?=
 =?us-ascii?Q?4jDlhha4rnyPYGtHtDqlYk9eVqEQUCMqsfZqOcZCI7PTVcwcBVvBwN9Pbg4e?=
 =?us-ascii?Q?M26GKAW5VnIAt/DycBiY1JTlbuDMYPG17yC2+sX7JJF32t/LrNQFcghO17vY?=
 =?us-ascii?Q?d7RuYnLqkiL32zqgbm84R3J6VvPL1qlrjWXbX2/SdUa+MnzzlJsNCaiogbuo?=
 =?us-ascii?Q?S7V0wvdNgqlk5IoUC9oXkC3ovBrgyasyfos9vdrxGs4sKWt05zMaaCTd+BfL?=
 =?us-ascii?Q?cdzkkYlZZrm5WrtN38sWkDxM02tqzlZDaIUAyR8iD4b3WxOGYKHA1svHWDiy?=
 =?us-ascii?Q?G3hpVc9w+vXVLRqd8la1bNmzxo9ITjekoxmY7JY80snX4tffdUxxjaKo7hTY?=
 =?us-ascii?Q?+/8Y/fDVFu/kj+q63+umtbboQK9eDopYoJgwyigoHLL2pFRz0v5Zqa/tNM0g?=
 =?us-ascii?Q?k3b4bb1Axy3FdTsvvx2TjKGIaEce6FL3/X7GSDekxaYjYfUywO+wEs4dRB8Q?=
 =?us-ascii?Q?TOHMrw2kv1qbpeJN4beMbcRx5aw+cIilWhzeEDRO9xxv3SHQO7g58wL7qJtz?=
 =?us-ascii?Q?8YX+r2ZN7rUHlPbUPl1V0wYbu3B3qg42aQFk/SW2aIKkciqJWtiQX4zpXhBs?=
 =?us-ascii?Q?UMb9NVUS1UMANzm3U/9Uif23B0d5xbT1/p+QnP1ayVnh6QMNt0BrLkacwkIi?=
 =?us-ascii?Q?DiGXXnTAWiRsF/tUnwRAfJ1gV7/Cl7cM5Ah1xVq52lijpI3WinvGwBJ1+hQF?=
 =?us-ascii?Q?jjH8azZcpuJowNYrGtkekn7jpFooCynXajcYTMC5HtdV+/LH9of7fXbYeEIx?=
 =?us-ascii?Q?H+4hzDnlYTa2Y9Nfw7NWRQ4OJOBipMLFTml6ek4zMgqBgSah33MgTvFlSZDt?=
 =?us-ascii?Q?qo9ueAc4gje0/2MaSQgDAUvc2O/oad3IdnzErAl/JwCX1vPwE+MgCeLLDPI9?=
 =?us-ascii?Q?ptK1drC7wJc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dZZL7WMUxVhIHX5TWLt/kPgdX0hfVOdof0uRGFWjz9jxABomfTuwJagYqI9c?=
 =?us-ascii?Q?4C8tv0WaRI6BL1IpLfSvqbVm9VnwfmQXWgB8a5ArpQTPTUQZC0MKskPbKBD6?=
 =?us-ascii?Q?v/FrulvDe8d4fUD7Q9Pg2m1zwSoiqQcuqtFx5o6wZdK1WYJw0quJZjzV2Zuk?=
 =?us-ascii?Q?/DrSaQn8QojNQu2nmrGoOz7NguKHyVYcCK0LXowcAwkqWzCphk4VdluMSsVK?=
 =?us-ascii?Q?daA6Jfd1IoPgZrGejuzPGO3eAjXhtN/r98oTm/NEHUakMlby5xYeG5li97BN?=
 =?us-ascii?Q?dEsAUy8nTZM9ytKrEMiooVvy7k3z9AqJJkRWEDvvIdJh17H4uBEOpUrPgLTz?=
 =?us-ascii?Q?L5K3IbQl0clFD8LFkS499g95BlY0MiwpS8ybG01b73C3JT9rk4RNHGa+gFBa?=
 =?us-ascii?Q?FQVi+6XyzI03apUid5TqGPPEkuxU+Of16AMcDV2fmOaoW/Cbsqu7q1szJjD9?=
 =?us-ascii?Q?ZyWXjgcfsENCmgNz5HS5afRlHCtzlWE9o9k3IeHTFMBIZs5MsVHMdlkYQAbo?=
 =?us-ascii?Q?VyAWLaorDP2VlXlssp3H+39ud32s6sakzR9fgQNcrBi2POoDqn1Ym2uYoyAV?=
 =?us-ascii?Q?gnxNfr1ZuqkL1oJwXEFqDJuk84tFM7U24HqW9lIaDDqr7QB2gj1vitKOijB/?=
 =?us-ascii?Q?CV9Rg/Wqp9LFoLwER4AIPX01n3Qn3JF1rfZ947gCNGaVh8wvoJXDVlKbL/ZF?=
 =?us-ascii?Q?AplvODX8Zc+4A7bvepTyF6epbg5/FmazgMO7oun0mpcJLjJnSrGu7FKBVv3l?=
 =?us-ascii?Q?/vsmnJbtRTarYaGMZlrbvpd6YLkDHrukTr4N9DK7DUkayPM73GygqAo0CDng?=
 =?us-ascii?Q?2Jg5uCXgT+DvkqjpHhG0xyS9UPxuEqNGIB1eKjA40QSSuTQ7NzPweZCXCahd?=
 =?us-ascii?Q?EspAURa3shAJQhaNq4aSYlwcs9Jgc4tK9z3imPrCCt6HSn2ITDwrjsHSGeSa?=
 =?us-ascii?Q?noHNu+SxokuatcuTya0RO+NCtSk8Jinzi4By8zeN3TJy7SH5tRV1StYGfrvu?=
 =?us-ascii?Q?eW5/9VGNgD3z9e/3grj+D4WddVukvKw6HJKKLc9VsRXdtIG8xtNscX+FwOaM?=
 =?us-ascii?Q?He+7Nvkhb7nJnS4lJiS26oKpS9QjNfJ1mNFH/FcDufdLStfsNeXlvc6ClksB?=
 =?us-ascii?Q?lPKCkr1BmeR8iUjv9rtTZXEjRrsbEi1i56515YPt7CjSKINC/crZedQv/jqD?=
 =?us-ascii?Q?PLQYZnlzXVE52SvosphyDjqOAlvMAJJXlkJuQkp82O4fBfSqKcOpI3bKQlmg?=
 =?us-ascii?Q?9J5B7g/MJSuvIXvO8tHgytQPM7ugUaT9ZiUQDaF75PJgTrUHi99lLrcebHCQ?=
 =?us-ascii?Q?r/0ITjm9eSf2kUdgkMpAs9LcsHRwC2CpJlHmvnVbN39h5TzFo3DU3eGwetSr?=
 =?us-ascii?Q?Ev9buIFmlsBqunhZYWP/ELvsl4KMTRcu9i4VAEKp+W9ycOCDgXfl7Ims695U?=
 =?us-ascii?Q?z8CeP9Tzr10CyQSjQ7JRuP8wKlPAYoBqj37FxZpUg+LZjmRDrDpsgPsPKMfl?=
 =?us-ascii?Q?WDfNYECCbmevBGLn8SflKneiTXI1w5PTzYVSkqvWwg/pf+AdWwOsodyX3WIy?=
 =?us-ascii?Q?EOu+F299ExGgb/AdefBSa1A0YssGYXcL8095s7ZT53VIPgHuu6cApP9uj0zr?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LYfcPjUCKdIoai/EyNBVl7SKoE7QpOrXjFpbNeBnciXJjQWrC2rcC9zvJLlfWypp6j8q3zSSWTv+HpyyrGXykSuZZS2FUGB/SAS0OZtybr1TTaUAkcrY8BWtY8viHJPNribd1I/GdPTpjYCV6hztcHcdUU4bqHi0ng60VTJNpSW+dGxWfDGdRRn1F8dXny+7h//YPpg82UvgVcP5lwZ+yb7C7a6iA9ln5Neif01St2HKbFf259e23nntsbK3owQsZelOXFtxiFMriokUgUQbSs/Yp9joKGShbwwahsrnbxW63bz0QLqdmK8y2vej6Vsqu0QsJP49vqZhSQSGIkB3h9zhYTVwmeeSbIHi778xNq5ej+C9pNjRtfi+R9/NcQs083vyfw601KxGt8yGXEagbdh5Plnnh6+NurXj4ANQL1XiNiQwpuuvYpGrSYAmr9KZXS4FMGVoRPuX3JqmXOe3oUjL3n3XOA0KKudg8Q0ARcKCEdKNAwd+Y6hCDxgxK8z20CxLwwsBCbdQeTP1TxSmoZVPHrrFBfV50OjJIw2fsMDrtWZP0Ch00Du7qnIImeJbbT2JsI9a7KJS8FmM3NnC5cXaIxaI86DYMmvLdSNIo3E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e73fdf1f-ee90-472d-54b5-08ddc8949a81
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 20:24:33.0294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UshghiKQRfHy5IK4Mz9gxmkvK9JDl46KiO970tUkJm6sMMgoiONMFnd1h4m99BhDs97khUUSYzFpMuEthzvvHw//hMx/6hkN4outTBbZN0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8253
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507210181
X-Authority-Analysis: v=2.4 cv=TfGWtQQh c=1 sm=1 tr=0 ts=687ea204 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=aIz_Co64duF09TpWQkwA:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:13600
X-Proofpoint-GUID: s1vAfrfJFmoW9mFa-UggcjuubC3FQImO
X-Proofpoint-ORIG-GUID: s1vAfrfJFmoW9mFa-UggcjuubC3FQImO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE4MSBTYWx0ZWRfXx60HQhf2IQsY
 +8CBHaIeeWFK0rmT7/ckoEAl80DHKQAGNNqvSpy/UBsHp1jItBOFRV0cE34jxsrPaF2ITsyxnkg
 rYkaxhoLrYafsW9jvxUyYiWDetdk4jn6+K3UMooE+6/IGfcZyj9AxOtqCAPNB7UJRfBuD3nZvTP
 0rSRxOa4qJ0mWEXLINDjcupIu2ThX0tNzLQQ9DdI+688/a2crVq51gf4fR6Y0V7nzOVOjyXvZhz
 DlQ5aIjj/R2f+nwiF0MuoNq02vLoNLj7KU70rv2yBPRFtqg52wXRZI9gAjv77q9CSkdYfoZPJz2
 5T0Clf1Aa6mqmFGvHyXPiiL2CPcuJH5a/JfVxmfBd4mLi0kAeVoyH9smQGRxpipyVwlpIVrIzw3
 Uqoh1CpLKeriTIdU17Tr10kDg1lEA/UjnBc7r4aBSCKMJP/VcBBkeS0kmQyDFN8RLgTMpJoT

On Wed, Jul 09, 2025 at 03:46:57PM +0100, Alan Maguire via DTrace-devel wrote:
> tcp.d and ip.d both need some of these generic definitions so move them
> to the net.d library they both depend on.
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/ip.d  | 25 -------------------------
>  libdtrace/net.d | 25 +++++++++++++++++++++++++
>  2 files changed, 25 insertions(+), 25 deletions(-)
> 
> diff --git a/libdtrace/ip.d b/libdtrace/ip.d
> index f8b77f12..b498bc07 100644
> --- a/libdtrace/ip.d
> +++ b/libdtrace/ip.d
> @@ -46,31 +46,6 @@ inline int IPPROTO_MH		=	135;
>  
>  inline int TCP_MIN_HEADER_LENGTH =	20;
>  
> -/*
> - * For compatibility with Solaris.  Here the netstackid will be the pointer
> - * to the net namespace (nd_net in struct net_device).
> - */
> -typedef uint64_t	netstackid_t;
> -typedef __be32		ipaddr_t;
> -typedef struct in6_addr	in6_addr_t;
> -
> -/*
> - * pktinfo is where packet ID info can be made available for deeper
> - * analysis if packet IDs become supported by the kernel in the future.
> - * The pkt_addr member is currently always NULL.
> - */
> -typedef struct pktinfo {
> -	uintptr_t pkt_addr;
> -} pktinfo_t;
> -
> -/*
> - * csinfo is where connection state info is made available.
> - */
> -typedef struct csinfo {
> -	uintptr_t cs_addr;
> -	uint64_t cs_cid;
> -} csinfo_t;
> -
>  /*
>   * ipinfo contains common IP info for both IPv4 and IPv6.
>   */
> diff --git a/libdtrace/net.d b/libdtrace/net.d
> index 6ac34287..4c7bc61f 100644
> --- a/libdtrace/net.d
> +++ b/libdtrace/net.d
> @@ -25,6 +25,31 @@ typedef struct conninfo {
>  	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
>  } conninfo_t;
>  
> +/*
> + * For compatibility with Solaris.  Here the netstackid will be the pointer
> + * to the net namespace (nd_net in struct net_device).
> + */
> +typedef uint64_t	netstackid_t;
> +typedef __be32		ipaddr_t;
> +typedef struct in6_addr	in6_addr_t;
> +
> +/*
> + * pktinfo is where packet ID info can be made available for deeper
> + * analysis if packet IDs become supported by the kernel in the future.
> + * The pkt_addr member is currently always NULL.
> + */
> +typedef struct pktinfo {
> +	uintptr_t pkt_addr;
> +} pktinfo_t;
> +
> +/*
> + * csinfo is where connection state info is made available.
> + */
> +typedef struct csinfo {
> +	uintptr_t cs_addr;
> +	uint64_t cs_cid;
> +} csinfo_t;
> +
>  /*
>   * We use these values to determine if a probe point is associated
>   * with sending (outbound) or receiving (inbound).
> -- 
> 2.39.3
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
