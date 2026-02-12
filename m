Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F783EBF3F
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 19:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770923865; cv=fail; b=Cp7bKyxE+6qZJ1algR2pe5IGPMJ6O9Yt1kJLjS+h7zKrjPVwPdTK8/CSfNZ2x9ROLvJz5HhivrdlZqoPJ1yFnjuka+GDDwQXRCxaZfWxmg9f26yg05Sb278ypOfKEYZ2vePunZMXHGt4e9DwZr9uzZQEcyijQa05aIdp6L3ZQEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770923865; c=relaxed/simple;
	bh=HtRba0g3sjcD/0t5ADlbx1H0EU9mQuST0rB2RFGwcqo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=J5VzRFM9/hQ0llszFdpgWQpwiIfRVKS+mMRJxSuU7t38RCaLQTY0pGhjmEoyPSjA8u66I/VriwSHTrw8CpHMibpn17x/dx6YDE/j61/9zeU4qElz81Or8pYUCo7MeyHO0ct9A39/lPtKB1SH4qEJUbY8j/XCvz5iHe4pIeCrH88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ItAfMctA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=T29xLvFg; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ItAfMctA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="T29xLvFg"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CGNCvW1041595
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 19:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=s5sl5FPi5teZHUeh
	KlGXHELeMQ0Pu95UCdIv3Ko8xps=; b=ItAfMctAsTskEtOuwmbf62j/OAZXeHqN
	Gs8HA2CgdNW3nRTRYSca7dl+rnxa8dt8KBC6b/aIMAho/CifEi16dQ0PZKzNNaVV
	3jus10Xxa1acfdIji54ENmSvN36IOU2nQKeKvJjSs3Um7w7zluUB8u1c0utPpgND
	OGG4tLOBa1ukA7gC635u7RsaGahmjELAB2wJagdmfJKx/EWv/Y2PdDFHJRQ165oJ
	+4oFS8ICKe6RhdTQRN+lhgPaLgmekLUSzoqbvpWItixG5wDNLXTMFd7n3sIopE5m
	KvDjSKE541934LfWZT470Gr2RKyVk4+MkCaB2i75teFYIjSoX5ji/Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c5xfp8epe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 19:17:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61CHTlB7033100
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 19:17:36 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011001.outbound.protection.outlook.com [52.101.62.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c825wudp2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 19:17:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knCfLhv94nT6Nhuz2mN9kYEJcqMSkeJw8Aczs7I1WKM7Ocd4aNhjFJtFTECMHAT+q7ZJip2VNrMcMNaOkxeUvNuCGkZgtRggK8zxUoBogPp0dRoGVa3/F4u+sgot1YoWXfbRlGXtuaxq6k04Mvjdye+ndLNsG9dtVOIB8dJ9LYKZ4aHZlz+yI4IveYqElKjYP/zgVj8MrCK0zOU13BZo1TssMavs9ilotzEnel6GBmxRnp0YBnFFuVrI18nnQc4+irHRvQtaZ3nGFGlm3/Y84HRRi8FP4ZyDQFThAN5mYlb9AvwO+qdwW0DT9mQntLtFhLmHneommMJgDzyotag8HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5sl5FPi5teZHUehKlGXHELeMQ0Pu95UCdIv3Ko8xps=;
 b=H/rGHgvdDS3ZCMpw8NSaNdjkUh2WZm5r0eemGk9PLvniZiAd8iPxWwmj7tzZJufh1Uz3tdkoyatnyOegjfszNneIzQsef/a+LZocAKuTLV5owVn/w5VncZpm7gRlB4nPDTYPOg2zzVzYflcv/bi0b/K3mpKMLBL4rYIxkW12rx0oBFXzChI5d5r3qde9LgqLdrnlcVG85hjjc+zow5sXo4CmXWkqJDLKtYQen70wJZcSo4eT6ZRmOc/RpsbT7mJkgmik8iWs1UmXBiAymY/XGWsG2RKml0j8JaYIjUeUm6hlqNR5NgZhDtWzC8SQCT2FmiYa2tPZb74Lj3wkfbQPzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5sl5FPi5teZHUehKlGXHELeMQ0Pu95UCdIv3Ko8xps=;
 b=T29xLvFg8LjdBAdAk2usjlCvEN1BBrVsAwzlDrf+lnv6NcjR8y9vMf9lBwJYb7KLgbBYxiiElmdLy7xS0WMrZ0OZYDU20nmbXiqWiMQPsXb7aLXJLI2EAnN57kK/we301Epv409r0slDz2aEcyPpHCF41NkXCrS8FtfmBi5K+mQ=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by LV3PR10MB7868.namprd10.prod.outlook.com
 (2603:10b6:408:1b4::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 19:17:33 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6%6]) with mapi id 15.20.9611.012; Thu, 12 Feb 2026
 19:17:33 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Cc: Eugene Loh <eugene.loh@oracle.com>
Subject: [PATCH v3] dtprobed: use /proc/$pid/map_files, not the filename of the mapping
Date: Thu, 12 Feb 2026 19:17:29 +0000
Message-ID: <20260212191729.225384-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.53.0.286.g870d7528e3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0075.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::16) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|LV3PR10MB7868:EE_
X-MS-Office365-Filtering-Correlation-Id: a2c70450-68e0-4157-5fe5-08de6a6b5f99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UHymUhxQTMA2iEeEBZ7xlYTFjRtfJiIEj5X9bHTo/Ldj8+o8et2FXx5TX6gr?=
 =?us-ascii?Q?PTzYx4XrC4Pn81DQl89YKyhTUaY0Wkjl9SG1F+bNmIWCKCk3LfQIKcjKfvJu?=
 =?us-ascii?Q?vCc62z/60r2wWPJaS76LmmxmGLMT0IysYPWG0K6TNverKAjV7T8F82pS5FUf?=
 =?us-ascii?Q?rxthUIaetjH1I3szaaqyZgt+1FwYgLxXPXL7RI889p3fOusosOsyiC2b5fmN?=
 =?us-ascii?Q?9krBcWMhVKOpOd7snK1/YKD/MqugXbur38yjQQEEH1tPj+8ereTjLcrTKgEM?=
 =?us-ascii?Q?rrW7v6gsC/eG+P+NJ9UsbTTKTSefIqoVD0YJ0ZDSQoJtDmjhvUGpPV/NSTZ3?=
 =?us-ascii?Q?b7hMZQZJBBKpu4Zlkrrmj6zM2i7mhguzqM+o9KRwPuw2WtPCSSE26K8LQv5E?=
 =?us-ascii?Q?rnUNFT5GVvbA/CRXWh2IwCQ2EAqiPACF88W2j/SNbCvnZBw+DCANpiQO3pX2?=
 =?us-ascii?Q?M004ZrxDcLtrzey/JmotcogglrGYKt3LDwgKPqbi4nVdUveLjY3hrPpK5D5Y?=
 =?us-ascii?Q?EM84dKZIzHrJQ2G1RUT72pUVK7Ka/ULGy0LFq8tHB7g8nnYGF+V7fAUQB0Lw?=
 =?us-ascii?Q?ZCSVyVYc6M7SM9tZePKTDh6DndurFy4pjRxuVuRsMgPphOSbGelQGWZHbs8z?=
 =?us-ascii?Q?NpUJx0FalIsGLHJXyR2xhowhFgaAraDLcykZ3EaexViPhiL9Kv96a4jqcczV?=
 =?us-ascii?Q?6pse6iK09CmWnFh/PGWuR3z3oOUpxcY+yejQpu+KRYJzWYeehUXCPvwPwmlq?=
 =?us-ascii?Q?kMs8bKqbjxHPQfiJP4fv3OSF0uBD+vXfaYzLzRxSWW6XXeN9OHSlyvS+gIH6?=
 =?us-ascii?Q?Co08rkMcOaWSiQCZVzCJfDWimC5ihNyKjHOmuOnPMRy53sVchqjyr6iwuxzq?=
 =?us-ascii?Q?ZT4IfGf9UI/jehIxrNRGoT/4PvhVnhXJGccEg/HML46jSImM9bkev5TUTte2?=
 =?us-ascii?Q?1+xdP6l71HGq6BeyQd+mIV9C784TGdhIE3b0uC1xMO4oGkmOw0RKzsfCV1e7?=
 =?us-ascii?Q?w8Ae7eDoSSOdR5Er70dNpA5kEHVbpOHALyoOG2JYj2WJyjmgW90ZnV7oRk4L?=
 =?us-ascii?Q?SKaq1JU6yA6W1LyfYLOFsA1mKs1tB3a+q/x9zilP7HTaVT1OMwwf6MpCzv71?=
 =?us-ascii?Q?n10ehvl/GsKh/sRVf35WNJnQ0l170/nmS7kaBs5TPbUKBi2OSJ06XkvPBJ+n?=
 =?us-ascii?Q?3DhCj1j0Rh0nRxTGfAaGnoL1LEY+8JEW6cHz8RU9MU1CYDVlocFKiE51w5Ym?=
 =?us-ascii?Q?5yL+RQVkddkmmlWj0bLKm2oOJ++xuPVT63ykd7PHB4tFtkfYwIZ0WNrMbGNT?=
 =?us-ascii?Q?zih4De7Qe+kkhfbYlRnjvps1uZh0nEU7uTxOC1xc64W3iU49d/1jNX3IweMp?=
 =?us-ascii?Q?Pf2ag5rc8XmPtGRDKUT5w1ZinsKgiudfVztlU332D+dUi3sZf6AGFuYi53My?=
 =?us-ascii?Q?lLluWY9kcnGwq+Axt4nwp4tphCf/9rt4pSTeVZKsEL63UNI5HVnGCFooz/Eh?=
 =?us-ascii?Q?sy1XSXZFaVmA6HZuKLflhZiVwnMy5ttiu9/kl4cbe7XaHDHDvZzSQQkwY/Rr?=
 =?us-ascii?Q?tqU0lw/QyS7tZZdqBuI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l/eVnl58I2Nyz40vuC0sHNNuBPZq93Elykct1xeSJe6GmwTihyyqqIctsoA8?=
 =?us-ascii?Q?f4a5kjc4bVVrkATW3gBuGa2KayC7w7PfsHEL4RwotdaSx2IxQPAkLHv9bvLR?=
 =?us-ascii?Q?JKB9c1xJiWGa0H47mJVUKHGRqSvQythr/Crl7WrVilusDw2b30VM3jEfpt4a?=
 =?us-ascii?Q?3rNHnsNkp+7D4VJjuhLJ/PaOtsGDyyyiGMAc4iK3zrMy3OkAO8JbUcnTJCLn?=
 =?us-ascii?Q?4p8PzxmyfGo/VgEfKUVSMoPxEU7QRGMNZ/96mzL1aGh1lBphjxrE/4GaTKPg?=
 =?us-ascii?Q?O79vDJc/5Y2u/YgTpV5NZrKdSPJRhodtlLgoAwrHh18TDl9Oaq9eSBnxTuYY?=
 =?us-ascii?Q?gZ5/rCUXimrBPjd/MzQWovRDw4QgWCf99vYYpSSLQhbLD+5+5Ysz46a4cvBX?=
 =?us-ascii?Q?sCowNB0Q1BNa5uyEwR0IxeCfnr8wvdddx9D/cxKmv1QfopwGvTE4/oVMQv2E?=
 =?us-ascii?Q?6XQRMVyCyZUmzTuXilHAvwqLAK184Zw0EmyN6CZAnj/r0JKt9Y48gDfmlfiY?=
 =?us-ascii?Q?X56v5FhrdNtKzgKdeqFYGL5Z9GqUHwzyvp+MMwQ1d/EmCMrYld5o11YVYyhX?=
 =?us-ascii?Q?+4fWaZ9Hx01tzxoK2OtTSOa5DA9FT5BcfOx4OMr/VldBxDN5RBiRE42DpjRu?=
 =?us-ascii?Q?635PdBGXmL/er3w6JJ9YYRs68nBMdj14G0qOIblmlCCEmjBtmIIeraLv1pRG?=
 =?us-ascii?Q?Qs8sJ3DdLBsMyLcE5/6tHkg9+/W+NZHmRGg0gxJ1HR2lvQJGQs3byszAlu8T?=
 =?us-ascii?Q?BSCbhlRt1ZYXHWgpAWWOCnD1/A+UqO+p3+XskBNUgeUBPh9RJTa91r3z6i7+?=
 =?us-ascii?Q?cLMwrTiTZQdfnFHpGzV7ARpTEdeAGG8BjmRQfbxqJ/F6YRq4YctAQdjoLx50?=
 =?us-ascii?Q?hHLg2m4MPEas4HFdSrXpiUpBk+8bhC9kt+JKQV5fjnWHyU2h4kCsB6tbglCT?=
 =?us-ascii?Q?YDlZc4XekfNBjTpCaVDKa8jfBVanqS7xhfme/uuVv/mh7DxvC2BLBah2+glS?=
 =?us-ascii?Q?UUMx45a37ZbaWc6jevQGTCZDUdg1rYvaia4ALtabfvLu+p4nkEbnTJWS3u29?=
 =?us-ascii?Q?/HtZyaQA0hnaZKxBUnYSa7F/rR29JSlxr6COxe5dq7UAUr4zgY7jG2uhkywa?=
 =?us-ascii?Q?w4sIRdfhCMfcZn7/O2dUcu3wgeQ58kux+GFyF0jEjmjzZgLDpXNChIJft0Yk?=
 =?us-ascii?Q?KsJX9HRNOfe+nDX7eerrDwibuHC6fY7ev9IVIy76fYrZ+6Nsn1ElVRwaKhzf?=
 =?us-ascii?Q?PPubzCqQS9M4Vus44qft/ckSLxMBdn+io0Ik6IpQp40lmS5qjRdJuldhTmDI?=
 =?us-ascii?Q?IRKH5v6uh1N+bDz4AzqqFYAzMSSLFKITLyO0RbsstSyHKynT8yfHT4mV4VmZ?=
 =?us-ascii?Q?WoOSxhkiZBiNmcMNR5I7xO9SqUIImmRmPxF3lKkAR4VFqiS+yqnjQgv2/70x?=
 =?us-ascii?Q?MLCQ0Vfyyz7v5tqc5vt0yiygZAqeQi5bg/Cyq0Bm0y3c27dFc4JpftXRvAX4?=
 =?us-ascii?Q?s4fCSOw6lbW8zyzqDV9FTdC73WvtQllQYyQZVpb6mbG/OpiZqhBRRuAEwwH4?=
 =?us-ascii?Q?yJfa0JUOQbR/SfvVNbOjWf2zv5prBvrdHso8vTxmefhEyYWDiXN2IAu1Nzxg?=
 =?us-ascii?Q?89EiomeiBYx2UrgV3h/3jK1QXUIVqejWgBRv3SAyuE2disSWieD88LWtRbOc?=
 =?us-ascii?Q?c1QkAIQRa2KPVno+XInQqLHHluyBE7VKhQlG63rRareDKg8d/cPn+5iveaUd?=
 =?us-ascii?Q?q4ArnDXAYQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ERlt6l2Hp2VQNrvDL8BVVxz/ACg/HAlVLlRveTNPUz0uWl+itvUYoXTNe84LDjiTdvCbj8E2our5n4uE4hX6qjR2163sjJMDzybg6R0YbAzC2R/onPgha0LQdGGdW2RgO0zseNwdAu0pvcz4uVrBPriwqnzxTN6YoINcwY2j8unYiCASAJJIX9ZzP160jfhwbwsiVPvEDH3GeJypt+lvg5OqS00CxZA5BxIeRphp5HHmfFJuGwKrW1gCxP1IBAmG03B8+hYApT/Y0C+/bOymB35nIMQM5bnSEKQzg3mMlRzwKmtPfTn7kDOJhedfTbTGIM1QuuyE5/U9/oekk8CAiD/sY/HTpZLV16tsxSnUGHu+HvGr/YBkxBMNApXiPiC4eSpu4Kig1jQu+beCzKno0wBjJHznIOco7TUDTm31FfC3l46I7DSODDXN5HkxPY111ZPUL+FgINpp9jpBrJhRum4jrji+s8MAlPywL3EuTMzjElJK67kx/dKW39e293/tJpJxo1WxZ67Xu8dWNAQIPtqELDXw9DtzxYIxn5FBOzzz9Mh7sUYQXTSl0HEqt4TvNmUzluNfCbf4VMCJ73SqfyYsWtW39YT5l8HgTwARLPY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2c70450-68e0-4157-5fe5-08de6a6b5f99
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 19:17:33.3245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KEI6imx8wYbASxhMMsXpUtIQXR/sB6hVmpAEl2MRgyEr77jz3OikkFxVXNXoP5m0hTNEr0fb59G3AzTB/Orbdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7868
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602120149
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDE0OSBTYWx0ZWRfX0WLtNlukz/f8
 U9fFL8r8tiPtaHNWZqX0Xs3OLZ7raKCbBubIuVn1ivTwVN/QYp7/w5OwVxULp7RT51+XswW33RL
 5c1+XF8MBAGDrODLqyU6Y6fS3puzUZS+IFL5zYCKTtt72C1BW1/D4mJFmWmb5TIH1URgorp+oL4
 eWuQBwL9GFlnmfzxSjxUpqW9pGMK9lhMn8NQ/ydFBAQrPiQeHEx+7e8KK0Ja4MgCSYYiGNTtCTa
 VqfdEaoKjNf9Vrtxjxf+LdJDvYPI8aNF0aLU13jvTOsSP1TsCaLr9rkHkqmTSC5snwTx/DiaDop
 +Ip4DoUw5Ogc9tIESVwOa5LgS8Hlqpqox4mmjQ2dqWpAZEs/CwWDWDE23dOVugjuEngZWd4MR3t
 Ahn+Ew3VVMyzFtGbgl2prtD6fqc1ThPl1WoXcLSKZqe7ixBrSquuF5oD3L6/yjcArlrMkuIuVf6
 pIyuW1htrJ3KubFQsortWVEoQ1t4Snqk0eWt9e3g=
X-Proofpoint-GUID: rXID8K2iGNpJ0vOz6z26QlJjZfuJZTQE
X-Authority-Analysis: v=2.4 cv=V8xwEOni c=1 sm=1 tr=0 ts=698e2750 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=jofXROvRTLIUg2xmTr8A:9 cc=ntf
 awl=host:12148
X-Proofpoint-ORIG-GUID: rXID8K2iGNpJ0vOz6z26QlJjZfuJZTQE

From: Eugene Loh <eugene.loh@oracle.com>

Instead of using prf->prf_mapname (which resolves to the mapped file's
target), use Pmap_mapfile_name() to get the actual
/proc/$pid/map_files/* path.  These magic symlinks can be opened even
when their corresponding files are deleted or in an inaccessible
filesystem namespace, ensuring we can read the mapping contents
reliably.  DTrace already does this to read mappings during USDT probe
lookup.

(We still use prf->prf_mapname to determine the module name used in the
dof helper, and thus ultimately in the probespec, because that should be
an actual user-readable module name, not some random address-space-like
filename: it doesn't matter that that name might not exist on the
filesystem.  Thanks to Eugene Loh for spotting this and Kris van Hees
for fixing it.)

Fixes issues with probes in paths like /home when dtprobed
is sandboxed by systemd.

Tested on both systemd and non-systemd (non-jailed) systems, with USDT
programs running out of /tmp, /usr/local and /home.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 dtprobed/dtprobed.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index a808586559d96..34349deb028be 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -487,16 +487,17 @@ handle_usdt_notes(pid_t pid, uintptr_t addr)
 		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapping (process dead?)\n",
 			 pid);
 		goto out;
-	} else if ((fn = prf->prf_mapname) == NULL) {
+	} else if (prf->prf_mapname == NULL ||
+		   (fn = Pmap_mapfile_name(P, mapp)) == NULL) {
 		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapname (process dead?)\n",
 			 pid);
 		goto out;
 	}
-	mod = strrchr(fn, '/');
+	mod = strrchr(prf->prf_mapname, '/');
 	if (mod)
 		mod++;
 	else
-		mod = fn;
+		mod = prf->prf_mapname;
 	snprintf(dh.dofhp_mod, sizeof(dh.dofhp_mod), "%s", mod);
 
 	dh.dofhp_addr = mapp->pr_vaddr;

base-commit: 9abccde65bd924a5b63258eebb5210952709768d
prerequisite-patch-id: d178f9e04afa5cca97d93ef7659a72dff6d364b6
-- 
2.53.0.286.g870d7528e3

