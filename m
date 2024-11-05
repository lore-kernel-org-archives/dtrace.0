Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B58D215C7B
	for <dtrace@lists.linux.dev>; Tue,  5 Nov 2024 21:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730840410; cv=fail; b=c4zxuu6oe/iA9fd2xzF5m4aRA99Cp/wylOcc1NRdl5CfnrwYLam7JFIYn99R2NKo/3g7lKUSGaI4OYaXUjClA64bWXbxtGNKtjsVWjcUtAo9MalD7N8n13Ovpw0iubLXf4UoAjM/TpjClyLPl43RYRvqzGGnq1R6HbneVFfiYK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730840410; c=relaxed/simple;
	bh=kO9hV/zHy69yZVzPRIKszY+tsUyJLrOh6ikSA4eddS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T6OSKb0L7MrlgANEmwX6YywEdnkFxXl43x79QRL6OAmG8P+0yHn/0sCnIAo/k6STx6v8q8MtX8Cd0JXpCdj9vh9ISocXMDxZ1OevHz1EIVEe0b/21MYcw+bBXm/MyQsUyGMnN9qgnkiMGa0ZouFoF7GjDC09d3Tp9n3s/w6nDAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NTFVx/z8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Xz18hcmv; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NTFVx/z8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Xz18hcmv"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5KfZJ3019859
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 21:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=WqThyDsc+QWpITc3Mo9SKJgyfReIBTBPQIQiMAVhmz0=; b=
	NTFVx/z83TFBtrP729JQH9hWk3VIKoF2ZVaMgdSFj4c2UmYmLNL53Clgk7F8areb
	bunfJ9jE2cTFRLs7Go+nsgxQC2Sn5Cy9Wl97qTFcm/N/uQDMJMIxxlD/Ch2HRn9P
	NDd50UBBD6O7tJSQX9Rcc2oqgRrW8ykHVl8nYegHiHTZYU3GFCwIK2H0YLuM8fyV
	qv9X1VFrp7NGw5Tt1AKMXdx+eOyb2BGDx4ZkOEJI9pL934gESiT+q+csBj9tKOGd
	K+lTJ6RdzvUZlLyyq4j8CZtgstElmHz8jy+YdcuDlsAEsAn6R6RJGtDeh1+Y6b1H
	lwkIrpmNRUhxw+i75HyQHA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nav26ffb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 21:00:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5Keb04036822
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 21:00:06 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42nah7nm5m-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 21:00:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYlSGL1VqRKeAaEAokPeYdsJuOL9V19Bpd2XmOAuwmMU+icJqjuCqMM81ra29RgcXR2JKMPCUZHbnMsMfGONmUxvuSV2y12d03O+E+6NOBRRrB3uMn1ormpPEjv9x2L66mjRoDF5hyMiCdilrJ7XJOl/iEaKjyFVVaOclkLFAOoNLgowMj/vYzZRsxwt3OHlNFEPIbhxhUwfdLQiRYL4WVic9KaENiDKBxbRrODDCfgRwQVK41M4bHl4QGZVpbtvmr+CuIbPFwHiVdIGriLNR8nq7miJHYUoWXj/vZX5G2c/dqOgt5/vikVJePsJcpGKXyoBspvAFkiIXtyqV+4pLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqThyDsc+QWpITc3Mo9SKJgyfReIBTBPQIQiMAVhmz0=;
 b=RtO1DmV1AETbw5cloVr5sogYrSGA6sVfwKAWk/q0NkwDaSFaBbmMIhBbQCobwwiK5vz+tp3beqRs920qv92jJ1CDwBnKlQRyEARiXoA79Ki74+u0nx/4J1nE8CbTBw9lxKmzZ4FKQScOBEbVbK34Dc77AK2x0kDC/rjWFmH/VO2+A0Q6NFPwWuKnu3G57E+Ls+N9NsZMrCPYqpTrfA+Tssw05+sES9neSRFRk9M3Qfd/rVDIKgWOq4QZvTOC6VRNRkCpLVIYgrVyjfbn8XPM/HtzE2PwX+Y4O8v6YoG9cw78hcWRWtaqUvJ/5jL6V+TKT08gVLMEEdDIulCExibhAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqThyDsc+QWpITc3Mo9SKJgyfReIBTBPQIQiMAVhmz0=;
 b=Xz18hcmvBx1Avpdr01jgXhw9gE/ruKr1jBMPQXBBOY8rYqa1ZqzKQaT0D0T8grpByXH1KyX54tnDxaCWQVTTOIzAe3MDgMQGOSJOcdZzI0UunJFlh+Yw4TGnW5AMtm5tVD08NjJXXrOLAvIaVroxcpSDm08Cdo1ZyodlvSqfZ7c=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by SA1PR10MB6295.namprd10.prod.outlook.com (2603:10b6:806:252::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Tue, 5 Nov
 2024 20:59:59 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Tue, 5 Nov 2024
 20:59:59 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH v6 6/6] usdt: fix create_underlying error path
Date: Tue,  5 Nov 2024 20:59:42 +0000
Message-ID: <20241105205942.192409-7-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241105205942.192409-1-nick.alcock@oracle.com>
References: <20241105205942.192409-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::12) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|SA1PR10MB6295:EE_
X-MS-Office365-Filtering-Correlation-Id: bd775c69-781e-4c69-a8c1-08dcfddccf21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KiE6nijWUdHEdBSCtQ9pZwB/+ZFRaS2f/02RwwW2jZNKuTIgymnt01QCCnyh?=
 =?us-ascii?Q?DjQzQbP4pa5AZHvZitBl+2jAsiAOgd3iKJ5GYE8yuwEgLUWaAZyBFBDqzLT6?=
 =?us-ascii?Q?9Obfhu9DvAtGGK2AlfTmqp7rl60kAIX1h5sb4iZs7gvnUENbEC816II1IFv4?=
 =?us-ascii?Q?XlkKrHP57hCNwugmwUBxg8HlXYdKOf24kJk+yuTBh8VGipHVZl7dIPWXIruq?=
 =?us-ascii?Q?VUR+lhiYhn9Q/3A0ojshnOoqtinhcP4rX197PtiLGR8iN4hb8YwoYX68EkoL?=
 =?us-ascii?Q?rNLoD/ghZ3krbkSgtlrpKI9wqJW/GJmzH78dNfH9WHjX+HGeMfN/53c7KTKj?=
 =?us-ascii?Q?rKpJYNC5+BkoLPlGbIBBov0jMH5Ge4YJWh35+eTV1RBys1/OrjwB0YmkUCKz?=
 =?us-ascii?Q?FPSdEXLDXv6bbBuhT7Ej9WjvUKNnuV8fVtZvVUieZHlhcyLAFmFZNPlZesoP?=
 =?us-ascii?Q?Wae1kUKdPdgqX7PwBq99Z0qRbRgRyC9M7aU0xcPwc+WGysKT6DzmPO9V/ShU?=
 =?us-ascii?Q?17lD96nxYrjSH99S2XWxpDsk1ranMBpIWfw/QNqCuKMJ8bWzUNgk8P6SZl6l?=
 =?us-ascii?Q?fTl93zATnT1TPYVkC2m4G4q1Nd9+z6hiM3H+WXdUeAYJIIMs11jMM44ONppR?=
 =?us-ascii?Q?Eza3Y76FGd9/zzByEryrm9vfwD+Iorn6MPJon88rnOBfXiJEYKBs+fDeR1fT?=
 =?us-ascii?Q?N+W1FhSYRtfZ7Rbtxh6g4/W6n665QFt0XnymdPqUQneZ+i50Ea9BIvg51rgz?=
 =?us-ascii?Q?6aZe3srlwz1NBiSNpHGlmhOmv+NBbslMkikDDV2STPRj+SRZaUOKyySpEyUl?=
 =?us-ascii?Q?G2+vcJCnUEuhO8p6ZOMionLlwLd3JeBbxhWN963iHWcP8Cq43KAiERzx0yhq?=
 =?us-ascii?Q?ZVUnJVu4ThQFyAVdNxn5iK4ywMf3zdwrTUm3jKwFH5QHnWkjHblTb0gZi7Ek?=
 =?us-ascii?Q?233LF8uOftHPgoatKvNOoqk+umJRHrkY9czjVgvC3gibYFwNeodmOB0czO8O?=
 =?us-ascii?Q?CJUqzTOBVxQ1J2nQeAEwqPN1lQhrYip8H2n4AynsGbHQ+EBbX3qS97cuCzP+?=
 =?us-ascii?Q?kLn4glWxE9Hc0PFbeiqgXboQxX/zdAQnAcKUbvNtRRm9hBAlx9EttlBKuq9p?=
 =?us-ascii?Q?ekoigEd+LV2c3YVnr9eZnjxWtpyh1WLPbzKgQs24RAN3xUcptYRlmiHVrcL3?=
 =?us-ascii?Q?TDhb/vnX8d6nUn4TrgVauXQMgQrSJrA+BiYH3R5uZrjuZYAmxoBA5YSKt8rQ?=
 =?us-ascii?Q?uoiwe7qduiqSX61G4QEFS01FXzdDnWEeVoXlTeFfaXKx5gOrGspuviYI2fB9?=
 =?us-ascii?Q?JgnCxZBq2f2+tuTn0iZnCZDN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KiFl9CVNmN/rJw4moSICq22GiKud6COmPEPk4MtZZPnA/izgeidRJX6Ro2YD?=
 =?us-ascii?Q?3eCR1X2NQPLGCMm5dDR5/3UMaq6lC8k/mrZFrOwPTfhq+Ux2uz3shgoSoV43?=
 =?us-ascii?Q?PNWVCnycZPrf4vCBx19S25nej0itWvxLzErAmhpldiY3x3VC94OjfGXZ42CZ?=
 =?us-ascii?Q?Lt3eRXTESpCGNmOE/0Lz3kVA2Ahwcn57xtz7L863BTbONAfPvHCHRqPa3UXN?=
 =?us-ascii?Q?Xs/c/6N/8frT5CZQBMOVcGvrZGl0S9BwJIwp7k+BfOLpcMqAr3Zliyvzd+Qi?=
 =?us-ascii?Q?RjT0I8mZvs+u6cQBRCyXmPNdUkQWpXLjmfuVGummDK1rKluxlLvSCw6JleL8?=
 =?us-ascii?Q?GLcpGRNegiDoEzGA+gJ7mXT+nMy0syx8JyxFgsYV4mhIhHysLM91phn6WSuR?=
 =?us-ascii?Q?q+Te6AVwucCnOKOxDLCpJ3z+bEVLuHrVkArW03O6Qut2CdfpqTiT5e4VfFUg?=
 =?us-ascii?Q?EtrxGH156EM5v5bGYVbCfdKAZDPuYUTbd0FEIO6+lDDK1MTzfKaaRJeg+udx?=
 =?us-ascii?Q?1waD/VsoQ1BzAVCIzKXsWfioCUOApoVSWmEsV9lqtcOMjfRWqiwM/cPbDt5h?=
 =?us-ascii?Q?JRcBrXSK8wk1du2PupgczcDXLWK/ds8zY9b22BjiubApUqv4aztFiMljGjHn?=
 =?us-ascii?Q?cAaHgzbGx8bcdOln2ukpiZsmp/KttT3JSWCx6UeTwj+kXthpQAeRfMLI4Aqu?=
 =?us-ascii?Q?Dhqeww40bFCM2kIgIdjSkaA060ZOghN8NyKymJaNkF/UkWc6vEI8OEme0sp7?=
 =?us-ascii?Q?YplAUUtq5mTS8S/NtS9Dqx7FCJNdo+dllKPk5SA6h0YPjXKO8GOTXfIkx59D?=
 =?us-ascii?Q?ikAZvx3TOYZ4LAJMrUK4vZHRtED2NVFRuCV7lb0+w2j4fFtQ2TjphT32Y2y/?=
 =?us-ascii?Q?lGFPn3/ykbWqkhaX02doTSPcfwWU9Pb4SEsojUpxeQQtGAwcB6hFgkiZUA8n?=
 =?us-ascii?Q?Y61MpbgguSdwIDu+Pj59U+n/4riclg+HeoTjx2FPhPmbQ7Y7MUNKyUMVYoeq?=
 =?us-ascii?Q?PmJQqcZQUTWwA3gQFUdWbtvlgSUiS45MtF/mltLKgjPxkFruXgmoVXEgvU8R?=
 =?us-ascii?Q?LZ2ahGGE/8uAEqkyFG6dnzzUOo9T5jSNtynwCHfwMPmVMmenc7FSeIxvy/W1?=
 =?us-ascii?Q?g4wdE4NRcM+9DR5IxpFwP5cttAIQZjzXQQ5QBbVYa9oFJtJYU/AI8eW7h3dh?=
 =?us-ascii?Q?b9YqFZsfuoRzNvB3wfHplRV2vU/55210B9Fq8zp4qUk2ryMDg+DtoYenbp9a?=
 =?us-ascii?Q?4Kie9VAaicuNBcnMA0NLwhBJxi8o7EXc9HS+DtnOfIuUpg3RKa6SGC6lYucZ?=
 =?us-ascii?Q?SQyXOxoblk8KcOCpH8rXFNeu0jCo3blLioZmGeal4BwtPGlwr+xrTNW4h3XS?=
 =?us-ascii?Q?QkcoCituSCZ5bfghaSnyDogJZYrNM1Nh9AJaI0JYdIQdkXrL0A7ixCtnkiDE?=
 =?us-ascii?Q?xgLRevxUCowbrdCQskdcNl1yZawGqj56xS4S0PoL1WQ/prTIDS/J/RzZPiOj?=
 =?us-ascii?Q?cNTY/R8fxbAfvaXIMiHFKsu/pOW+2e7Ld4W39NexNGV1vp8T0o+bNbfr643N?=
 =?us-ascii?Q?7HRHd1l6sbSTAw/rtyztDM7eFY+zKXEqiSNh+bsi6qu0UtQ2HjM18416Eks6?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4cxgVveyw8eFi1WruynlVf/gZSXQpFzxuITxLFb7ShPY57uGFeBNXglRsK0UreIIyBoloMwfGNluQeP7exM6Q3erTxGW69PhZowJy8Buqk1zXt4i4ar0rdCW0HwN6r3osNkHT5TTwNomQEArY+rsRZIR6CFMznqyQBujuTTVcL+NEHmyQFBGnsHChjXgQ7edTNSvwPBpEyyOnck5BE2SNGuy58Va/mhzoKgTCFoWh5iFYUyWuVM9sFZtbKjyfU6x355FA0Agash049NQ0GWxONhYJUuAPYfPF7Cai6DHTn4ZLNv6Q3K+ZfLpvLNI/j6LUzKaRrZXcHhfNloLMjytye1h7sf5IC/Ub9XyRHrQqCGFikl6gesTfSZX3Jo6pZ9J8VWMX459qC/r2cvmnSJA3G+eQiv0lq0g6fkKiL/JrlGGJXmaGbwP7e3JXGPDcvSCLdq1sowWFd0YbD1fZKs6JRStLUbdnIkiWUhl9veQvBdhAGIe3wwl2z8Z+etwkhXfdXbx3OBGmiytVzAx4gAqsLp5kwwvycy2JNcOUBZhFRS+XcgFSdFfaH2oyum5tBWjm5tJD2hY2WebNNwe1+CROtc59DviW+pMro0GegC969c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd775c69-781e-4c69-a8c1-08dcfddccf21
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 20:59:59.0363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jyaT+SdDy/5PdkqutrwiBlgBuDdhN3oZ38S0zv74oAxRbKPQjX17hSRgL6+bvC4tNGWhwG1xPEAwuM5a7g6vAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6295
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-05_06,2024-11-05_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411050162
X-Proofpoint-GUID: kdJqMYFLHWiaDiphqzvhPGiVhTNDkyEv
X-Proofpoint-ORIG-GUID: kdJqMYFLHWiaDiphqzvhPGiVhTNDkyEv

On error, we were destroying the underlying probe using the wrong call,
as if it were an overlying probe.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 1a1500c03ecc..205014617586 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -714,7 +714,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 fail:
 	dt_dprintf("Failed to instantiate %s:%s:%s:%s\n", psp->pps_prv,
 		   psp->pps_mod, psp->pps_fn, psp->pps_prb);
-	probe_destroy(dtp, upp);
+	probe_destroy_underlying(dtp, upp);
 	return NULL;
 }
 
-- 
2.46.0.278.g36e3a12567

