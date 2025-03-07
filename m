Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056651B0416
	for <dtrace@lists.linux.dev>; Fri,  7 Mar 2025 21:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741383306; cv=fail; b=pgDeLDFP1IVPe5+twps534D1sj/KpLgeL/RqBWtIs+kKPP7rbOGZ1G0F72PLDbrnSmeT+uXCOncXG5aa++09DIj+hhFIXLfRraIvcHkml8DuWGn31DiPRmZKmiESViIUqCh9Vb+dGILZPefL/fcoHQcoNn2gSEh6yMoMsay8MlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741383306; c=relaxed/simple;
	bh=ZUo5on0Y1Xp0jXoGf06SCJKnvP4hET4PBSZ0pcrm2OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AUyrSThB6XusWThZSzTTFjXLNeOzAJ+2jzrPtQStaxmAXfh2RElayKDcLPavU0qVtRQjkycZUesnIjjdClCO8jslU78DyE/LHvxYIS0qIAgzQ5N2nJmHiJdw+Ku0vWouUnT8Pz+VCB9DKb5ontg3bsTKu0c6e8cI52kjG28eyuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=enTsis1w; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Zz0efbJZ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="enTsis1w";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Zz0efbJZ"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 527LITTt014795
	for <dtrace@lists.linux.dev>; Fri, 7 Mar 2025 21:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=+zUtnsbuUrBOxsFvgE27olB6oUyYRrIULCZdtSueZxk=; b=
	enTsis1wYf3moGy6w8Lv7w4hjSgVsSt+eg5c6VRHJT6JT/n06IHC89E37YixH9qh
	JisIKzaSAEPufxZrtMKmtvzeT0WCXo/uKUIIc2dJCWLzHZsFKtyOy8LFK+75Imh2
	mb9dGKmlEaI8YWDZL+OLIelFe1gUXmcEJFpscT1NiaNWd/cN2lLOKRQNcRMaAec3
	gbS5xxSjVuVfCCSMrVnQaAmFU7I8dRpt1BhCRd/XJI3q2jSD8ea8GG1Xtt09pVQP
	Oa5dakkxzN5iM/FpBiqyFw7vKultcU4B/G4By/kpCfaO5GHysZSnIE0v5HD7tAUt
	gUwENAgAkA+5vwPQYuSLDg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 453u8257rs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Mar 2025 21:35:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 527Ktgpn003202
	for <dtrace@lists.linux.dev>; Fri, 7 Mar 2025 21:35:02 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 453rpe29ke-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Mar 2025 21:35:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1A+m/x5dFncqCwO4QKGkBPlcHI8bchiySsUTSGqR3z80/VP6vPGNOMqDw8epDwOokmWkeOg75n7s9PI0rva6AHb02ZXN31uN0Oiw1rQZtj8PCdoTf2f3zagdsG4DZNRfOnrXm4XM2IakOTN24naACFwMQ54hvziXB8xuK63iclecFfytBKbOU33X2q+5OdEpTt9nGp32v+2AhbKocgPfjRvl8YkbXfmqIqVjT3rkhudkcdwKFuBddgITWPZoMqIft56ICOpF2UuXff5W99dwwj900awtKwvL36JIa/S42GWm549tjblTheAghnZabrp1nii8+qDCh6yXEhcLRm9yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zUtnsbuUrBOxsFvgE27olB6oUyYRrIULCZdtSueZxk=;
 b=ntO55Hpi1yRgeQQz1z6/eNnBMAJKT/dfcF0nNOXGVuFWhe0rktlRHSonXokeuZodwX7faYHCUEuXOA1fE/i6Yw9wDDSUAoBqyC8ciyD8yvSwsjgZc59lc6ytUbLTWRE/wKNW24eZcpf1lYKyfvrRmRE/KC7V9Fy5qaE9C39enTiZ8ttWPaWWvRfvNLSvEfH2P80IseXJhHJ4jpUi5YzpJ3OoLn3dXfUWVNYWmatjbGsDYlw4+k8TmsVou2qWNVq27AgBJLlsx5V+D7BT06x0F/eiyNzPd5Ds5Q9E/Senux3SjqEJjrU+IUFXMpG5HegMuNnE9C0mKPwke70ZYmHSyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zUtnsbuUrBOxsFvgE27olB6oUyYRrIULCZdtSueZxk=;
 b=Zz0efbJZ8dH9sWIxwLpWNAEj5G2MD0n4DmB/wNIZ66AeqT9jZjgLQkPEHAFXxz+/vwX//g+I4gr/iUnFiocfeQbKIzQUcDYmOrPBypnnvH/ZXLrgO4t3ZbZMPddWXmah6nr3PG0LbpdL97+dYCMvH4CIqKK8TNFxbk2tDNW8Ii4=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SN7PR10MB7029.namprd10.prod.outlook.com (2603:10b6:806:346::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 21:34:59 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8511.019; Fri, 7 Mar 2025
 21:34:59 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH 4/8] ksyms: make symbol name filters less picky
Date: Fri,  7 Mar 2025 16:34:37 -0500
Message-ID: <20250307213441.9495-3-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250307213441.9495-1-kris.van.hees@oracle.com>
References: <20250307213441.9495-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0371.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::16) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SN7PR10MB7029:EE_
X-MS-Office365-Filtering-Correlation-Id: 43dd7099-adaa-48b7-54ee-08dd5dbfe987
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?03+J8jJlxDtMd3gOiLrolQWwyBdQnkwtHmL4RdCt02MmL7zOHg2dCF/I3xou?=
 =?us-ascii?Q?ZZjGZRrQBfN65b+m+K6oviO77P6rG3zj6pu31Wf5p3YdqCENfAnQT9EYMHdl?=
 =?us-ascii?Q?lytHtsRyGL6mh40kJgKCNLhc+PGjGohtLF16DXLXH+1RJZ4IZvS90snPR7gf?=
 =?us-ascii?Q?OFRFhmVu7c+5xSZlTd0axTlSx1qaK7DYwrnWDaIH7tJENI5OXg3dn7vZNYxl?=
 =?us-ascii?Q?obVAUuH/uoqXrVvyxu5spU/HMkbJll36/R/D3RghgSUcTC6MVrFK1R09/VIj?=
 =?us-ascii?Q?Xyb+lrY+Wir8i7lXMQ3Lxqbj93SVoSEhH//5TPFpSE3yTay3g6eCVwGdr4vl?=
 =?us-ascii?Q?QbzrHCJsZFCigl1NkqPPKw283qUMl/rHKohDYRfXGr9yD84nfFRgCyRegAIH?=
 =?us-ascii?Q?f27QuyKc5CNPuIa/mGsp/R3VmVfjASexnHVB7S5pWZsNt6RsMJxTrT4ke0/W?=
 =?us-ascii?Q?+gwU7PXEWyBiUtLcCLOf5wu8otMLf/VVNPYQG3qySV76jJsKOySh1q2e7laF?=
 =?us-ascii?Q?C9glV6JokEysKcuvUITz9PIHk1X8YBqdn+m/E84BHjHlcG0hgt8ap/Y0GJmt?=
 =?us-ascii?Q?37DbhnwHGhA2Y4QYwh3c58e7f/nR7wrAbDyZwMvOKGT7z9zJaPiLvNi1I5LT?=
 =?us-ascii?Q?VqWY7Lzigg2hdbCIkVKykdFc/PDE6kWwrrwRLvZ79MLQYXTEKKHqKQsFlV+T?=
 =?us-ascii?Q?ej98GVo8c+UzYLg/d83m4jc5CIb7HrNy+hsR0eFVH5c/72iNtQ7U+mH4x2xG?=
 =?us-ascii?Q?3nyXfE6ZVvjXI2lSZtcMIPvgYohXeCmgqPwzsgkk4/1CsgAq7JtA/7o18sQc?=
 =?us-ascii?Q?pkH2vUUecztbiJ2YPDtwp+CMTvue9a1X4vKUTEp2sXEGVJwe9Dh1/x/oS37R?=
 =?us-ascii?Q?BWtP2dpUTvlYUBCrCSg1B8CwCKoMKdFBxK4s8RkxmkdnMqyHwQppg0ITebUf?=
 =?us-ascii?Q?/CglI1NwDFTLoEEslijqAKfbDslCBZaJDGEF9qfSI4sLLkX8grPT1i9k5svy?=
 =?us-ascii?Q?3cE5eQOETfbUOT0du8ThLAa5gTapZ/HYcumj1qGqox8Snc4m0wWjkeHOZvzG?=
 =?us-ascii?Q?awfZTxvfEZJzdLZ0OJQlYDpUaAe7QjOPfF5ecQjkJ0zQVGKTOU6loG+R3HR5?=
 =?us-ascii?Q?T2oQKE2t4tVt+byHqnTj8Fu7ZGa9pXhv+H3Ednznc2wEnvAQjyYLbdRWtJPR?=
 =?us-ascii?Q?uJT+c/OQuwfAjeFKvNwpJf8M/S0/L40Uqrf+nKbuHD0u3JYI+MrUnQWzvAoh?=
 =?us-ascii?Q?n2CqqorloN1ORXmxmV+5ua8vPj7M98VBHF5FzyMODCfkdKY64LxtX+FldvIy?=
 =?us-ascii?Q?E2kv2FOfE0x06d+SaclwkCduqUC3a5/YrdS1hHgSt7Vd/clswx/Wj1CcjbMT?=
 =?us-ascii?Q?odouZ7pYB+naG6N/4UkdSZgQoNSd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Oowz416UhXUz0LrHFFOHkdk6JGPVD7Ft/SJLZqBJhgydJ1v0nMCExMPc7/HE?=
 =?us-ascii?Q?8dGkZWpbA1Ml7wYY9lrLN/o0u5/oLbGFUAzCto2YQdqXAiadajKasMTIzvtO?=
 =?us-ascii?Q?PZ+leglT7UYiPlz3gV/jWC4QLTai3HMYk0uZif4tedwqpKLpTqi58VWYpBOC?=
 =?us-ascii?Q?oyoLlvB1PYMRG/hqYK+snE0U/+0/zw87pahQNEJRWFQ5B3LV+0qXk3GpJI1J?=
 =?us-ascii?Q?6EXEEs9/xJLHaCCs8ebzv8kE7Kbp8fZL+igoXR9hXMqJ+2JTHy+qWKpSaGIC?=
 =?us-ascii?Q?Bmzs1uZlCPLwUF3Jn/Mib4u9RAePz4p9yowtoiqBap9CMjuh4AkYZ9Oubyfn?=
 =?us-ascii?Q?flXMUH0GW2U5w57XPS7HX+StszrCdH0ztUal5CFkoX1c8ToYELPA5Ql8ELwR?=
 =?us-ascii?Q?FQ7W0AqQ6xKXHkk34xvEzOud4P9mS4En4auQ5IM2I0YmP44ZN9sx5aGEON9Q?=
 =?us-ascii?Q?BJwQq8VIfNmFN8L1PY9hqvGNqM3t6wgL+lsojNU4rdCh8fR4X/t1JNbxk7zB?=
 =?us-ascii?Q?Ar99kCvaQIVTHYuOoY6EJlzMIH3J52K2AZO0PrDRFq03BZS18Kua7RyObLm/?=
 =?us-ascii?Q?Hc1YKcFtdxMm13iwe9BvrijYjzemqy+xAwgihLc0c3nBFxMQZwwL/XcP4dvb?=
 =?us-ascii?Q?QBSC1iTjSsgi2gdxBJZzx+Js8ty9orZoDnffVgXxO3k2tHU/bu5P9zwZBfgq?=
 =?us-ascii?Q?yxupE+TB0VtNFe8SSO9jXu++B0BUvmg/uEaVtRyjpGbSm/78+DaWCsuxUY+Y?=
 =?us-ascii?Q?o8uk1I0pbPcFaDTjawGevP3jMCOPmd/Tae63G0KcX56z9sdkMlig17fKIGjS?=
 =?us-ascii?Q?pkL/rfhwm+Hi5o0FKILL4bualh/jDPCWojzYW/cWoDiwc8PoLPVOdLUKUOfT?=
 =?us-ascii?Q?KmoT7nivE8jXcYovINztn6tYR7nfsiReVuult+JgeFJQT1Tcjq3TFJgihVaj?=
 =?us-ascii?Q?QL6pQVddK1wBPErPyo+zLDdVpuD9utsrUy13t6V1Yym/RozZeAh0CU8anSqc?=
 =?us-ascii?Q?w8AQk+2x00RYs8LZiaBv4xQyYMQhz+/qiHkmzwSf0LvcOo/SJPhqzTQirW3n?=
 =?us-ascii?Q?FcsLDvfpys34rYv+8XsgRzZEQDGKe6hu7Az4cOSaE9mlPUjvBnu2PCMzcCcd?=
 =?us-ascii?Q?yZPHOF1Cq2DmGf6uNG4qi8ot61IBLuTjszr9TRJWV9dRoPziHJeat5pM58Z8?=
 =?us-ascii?Q?jYfNzwTmGCEeqFC7IQIcekKOfAfQxbbonIh9hfw4VrNvBDqORK75yzFlyOiV?=
 =?us-ascii?Q?U3mJKWyhx0n2I3yDUrhykdhQfS0QjSiTy7ok4/ikuegkI2uIItIf5EeUAYju?=
 =?us-ascii?Q?nAsbSgijUoibHDR+aIlHV5MceEUbsjG9e6zf+Q0ylb9+zzl4dXR59iJevXeC?=
 =?us-ascii?Q?KYjqL/FyPbrdXmBOCZTG3rh7L1WX7WIi1EwMLfohRRByscvlzs8KtFZm2DxG?=
 =?us-ascii?Q?H5gHnMtbH9PQqmIxuVVZm1FtouFNXW+78lhvzcnSf5oUzV0N+BCiggmaEw94?=
 =?us-ascii?Q?zYfc7Hi3CGDAsZImiU+F7lrbyveYbfp4QZhu4qovpt2J1Sw+naFUune6hkD1?=
 =?us-ascii?Q?u+29AYUw+o7nb80vkdF7xTD+SuLtykDXfn9QSGrNnxK0YsxD95EPQvyEuDkl?=
 =?us-ascii?Q?dBNCRwdZEq3gRcl8Xnv8k5k=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9RoFzARHfoTCELtePVSFLWHVmsLhoRhGCnElLyaM8ua0B9Ej3GafAbSgwcux4yTnRGXOckKjECYBDDT4eEhKAu0Kut/gk8N7QltLmszswryUh+MbbiohQFq7R7SNEMkkB4MBK/NB+Q70h4D6GCvH+ouW4/YWh1Pt2o0zjPS0Ekp80/ANH/hg1NaB/mKTZZJ3jMi3wsp2Uw30TYaPm98/j1Qby4RafaDR+YZFnlTrfaLIGN1Ix4y73xWaM7O+Uv5tW3aE6ei+05TkHdJb76KjCmbZcqj7zHHMVxn+KagE/zrOEpDYsrqvv+tMPa+W1Nkfjnwv7Iw5DgexCBGKIP3TO6EfoGNhDyVpM+RRl3+4zYWs2i0Lc8lTRRTHjwjwQYxzWfCpW2hSVrLOh8Cf76HX3kSvAziN3kSJiElRiR4j3pVexHUCKymlJgalJICWJDBxweZRMT5boKtTpx1ARkDsR9Fce43w3AuhwGs1YPZF+NgLvp3xNNp6uzk2seoxdu+3aYPWLS5ujT28uTxNqYn11nhSw8J95OUHeRYVRB4/+PLO+1ZeHM+dkBj6ijonWvR2+V0vkZ8mGDVbMOx3ojfr6NB7SsJ7W82XsK9qyDP+1jE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43dd7099-adaa-48b7-54ee-08dd5dbfe987
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 21:34:59.5692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /iylU6GqMY9+V/sjTBnYVjFX34suKERjr85x9ZWwk9v7c4edTBw9ckLkCRzQp5Jgxj3o4lEXsm0I+InwHVe+nj15aGUSMwtTgXtM98A/bg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7029
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_08,2025-03-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 bulkscore=0
 mlxlogscore=943 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2503070163
X-Proofpoint-GUID: _bzSgIhHgknTyLriEaQs_S7BD6yPDTAb
X-Proofpoint-ORIG-GUID: _bzSgIhHgknTyLriEaQs_S7BD6yPDTAb

Some symbols were being filtered out even though they represent symbols
that can actually be probed.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_module.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
index dc00aa88..2e915e2f 100644
--- a/libdtrace/dt_module.c
+++ b/libdtrace/dt_module.c
@@ -1215,7 +1215,7 @@ dt_modsym_addsym(dtrace_hdl_t *dtp, dt_module_t *dmp, dt_kallsym_t *sym,
 	    (strstarts(sym->name, "__syscall_meta__")) ||
 	    (strstarts(sym->name, "__p_syscall_meta__")) ||
 	    (strstarts(sym->name, "__event_")) ||
-	    (strstarts(sym->name, "event_")) ||
+	    (strstarts(sym->name, "event_") && sym->type == 'd') ||
 	    (strstarts(sym->name, "ftrace_event_")) ||
 	    (strstarts(sym->name, "types__")) ||
 	    (strstarts(sym->name, "args__")) ||
@@ -1223,7 +1223,6 @@ dt_modsym_addsym(dtrace_hdl_t *dtp, dt_module_t *dmp, dt_kallsym_t *sym,
 	    (strstarts(sym->name, "__tpstrtab_")) ||
 	    (strstarts(sym->name, "__tpstrtab__")) ||
 	    (strstarts(sym->name, "__initcall_")) ||
-	    (strstarts(sym->name, "__setup_")) ||
 	    (strstarts(sym->name, "__pci_fixup_")))
 		skip = 1;
 #undef strstarts
-- 
2.45.2

