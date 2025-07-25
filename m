Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34D22D052
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 19:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753472113; cv=fail; b=kiR5/MUlj0C3Btc8QtFYCEG7WSOSfegKFXif+zD0npbUMuaIhx0Pl9m0T2Jwb9Xg8bOO7uU86mhSmr7ElveSmJLlBohopt16LAsbnprx4TTZvb4d6uHZ8YcAHDotPEKyTSMfzJvlWIXvS/acusm3c2we9fQjLDdUqYcotkxdRHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753472113; c=relaxed/simple;
	bh=LmrjSyrtJqLU6Gf/4bsk91ol5tkT9GifYC1s9ICZp2c=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=fcCLGfA+SMSdB5HCYf5yKQsWdBtueqA9K3rXgOLhHqO/qEUS6llVdoTFkzps5m6/vjAg4fGCJIixGI4siXKnJThXwsW2ShL5/xXWaIyVr9HuoCB/58J8eSjgY2vwHrpmAPounbDk2FTpWaVqYjBg9G1/HNUwZyuSMQ0heSOp72c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VPQcH5y+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lcQbnVPS; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VPQcH5y+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lcQbnVPS"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PGCid1001129
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 19:35:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=8StJ27Q/uyGCkcmJvkFWKVEFhQ/dmxURtTWtSVSWLZg=; b=
	VPQcH5y+GL3lE1QJubuAEhtyRROO/IN2KRnfJgBKysV200RpOdulHEubEeaUnz4r
	fUTgEQScpqaMGuPx5p12XTMQsOgnoQm3QTJ9qydd+6A1rAxfpxKMmFyvZigFOWN7
	wGg2I2mYY29WT/6wTDxhvWPxZd3DxNArirWYEd2HusVa8N3RzZEGUuk78nguIaFD
	C6hMv0eNHvGT6h7/Uw9ONm6jYfhWflAxu24zzxmQYnADRwSLdx+LLKft8yh3zM9F
	d/dQOq8lmfQtnI66uG6mFOHr7UFfX6xRDj+dovRX5syhWCCJ6E9J1ViwGd3WvQ1u
	Xn50CgRBbT1fAOmGUT7zgg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 483w1n1nyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 19:34:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56PHfcAm031545
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 19:34:49 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801tkt204-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 19:34:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MGYCFdPCI6CXYUMrC3I4gDv8YGxVvfT8Aw2l23qLfl6qWKD3X6B6tIuG40bYN9u2+C4bcb3RCZZ9/LpdjBUrg1VPf1LIKZJQMTb0mtKbCnnr87tYxMJKXFjn0BybvOF1jsZ0ZWbyG27YVQG3hbyO1k79b0lr2w6zA8/SjfMfSc0KDNQcoL3vHDii2MpTWeDcoVdQFutrk4RYDG6wSsGpdzAkytCKpzV/wzEJOlc9xQmhkyViGBpB3ANYj79GVBPaLQpA64EwtntxC7LGMnugipM+cLrLXSebl1Sq+GMnFXQcj5i0D++CwbJpIm/StHTotHGe5bvnAEIuLi06QxCqTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8StJ27Q/uyGCkcmJvkFWKVEFhQ/dmxURtTWtSVSWLZg=;
 b=fc+pJFM98dgQAeo90MXyPX1WDXBfhLHu28J/e2IMvF5Hd3P2FY8p33P+8mzSTEJhtYZgzWUts7UEbniw2aS/SYXMUmgAsLpmNJA18lTLMBAOhoPO3LTnjjH3hHY5GNregZA7Fnc2HBZBV0JEDuBhLOjyiRX1zpPAP8x2inxCYZ0oIxgfWNVGGd6QBUJWIZgmzcpDfNKcmlqYmg+Egg3ByYjy4+ZlOa+rXeu7JJ+MN2eJ0dgLD0TGmThJhcv1C39ISXiphQG1Rc4ftgCBuC2kJt5CoUI8JL973WSwNeuBRjPCX4W4CZmCBMlUIbTbPfFnpMOJ05xN9uoJui4iZq3tYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8StJ27Q/uyGCkcmJvkFWKVEFhQ/dmxURtTWtSVSWLZg=;
 b=lcQbnVPSaU+woQGJUnw6D3WN60l68XAvNLmCpW3Fs4XVldvXn40pvH2yptbiTzAnonvPlP14BuolSr6/Al2shkeIeuc/u3X08YQomoyjcSqfhKoMKtj0LGWF+qp+Y+XcK5/YLSS5vKAjasTjE0w+Xw9vyr6diszvPwLn4rwMyFo=
Received: from MW4PR10MB5679.namprd10.prod.outlook.com (2603:10b6:303:18d::14)
 by DS7PR10MB7299.namprd10.prod.outlook.com (2603:10b6:8:ea::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.22; Fri, 25 Jul 2025 19:34:45 +0000
Received: from MW4PR10MB5679.namprd10.prod.outlook.com
 ([fe80::d79b:96d:b777:fe74]) by MW4PR10MB5679.namprd10.prod.outlook.com
 ([fe80::d79b:96d:b777:fe74%6]) with mapi id 15.20.8943.029; Fri, 25 Jul 2025
 19:34:45 +0000
Date: Fri, 25 Jul 2025 15:34:44 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] Free the DIFO for a probe once it is loaded
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:208:36e::8) To MW4PR10MB5679.namprd10.prod.outlook.com
 (2603:10b6:303:18d::14)
Message-ID:
 <MW4PR10MB5679C13A1178269C13E67207C259A@MW4PR10MB5679.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB5679:EE_|DS7PR10MB7299:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bf753fa-1b83-4c5f-1926-08ddcbb24f8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gqXVgN7HoI75Y3nM7xkh/y+xWt/fmVkOBBjNWr/AJedTwn7MF8eSXXZCK/lx?=
 =?us-ascii?Q?xr/e1UxNEhojJjx8IyYon/K1W2LzdAZ6TyEaOJOonzczZcd1aV1fUGaoRJ4t?=
 =?us-ascii?Q?rnDvSLChBlWRi5RMhbiTL6JSIzcppgrPWpn+bWm9VkwYAFCzld8wsdwct28v?=
 =?us-ascii?Q?IWvx+oz5xXz9xJRs6W7kMANm8+TpKH8sNff4EczPGGguNJqKv8kumqP52C+U?=
 =?us-ascii?Q?GBu2qGlOZDvvOs3pmaiy6473xlSLAiUjdf+bjxBrbIBazMMK1xeImwbSeFe6?=
 =?us-ascii?Q?GDSLi8NSn6U3yA82Jno1Z6y2n1LLSAyGj9BKOYCK3360Ri2Yk1knasRqQ4vs?=
 =?us-ascii?Q?gh+m+8b485WJXevFq5I8nXQBRzTX0RoHXdRVT8g7UkIFryUdyRc8BzrFesYl?=
 =?us-ascii?Q?dOkuhQLaFVszvDlXKABqs8VEMw9owP3FP92Xe+WRcdQlDcfNFNNHLCjitPlt?=
 =?us-ascii?Q?o6/LQo0FLOdvHMc36Gi1QGMFdDB2UJjIVErRLibJyGmmKb5fHaPbccSvh2hD?=
 =?us-ascii?Q?BKYQfUG+sRoVc9RqRRT9QPp0DCmMO3RBI3ytUtAoGkpNgICl9wWAtXhYJJNe?=
 =?us-ascii?Q?agtRZE9ZltLEfnjCkF8sAUw2bB4XxBZpmSNkgEWysIzrDw3yY8Qe+wA6Cz8Y?=
 =?us-ascii?Q?Zf23V88AcgfwErUNRaZX6vPNnNNx2yrfBWNXwVmv86FemB/f9e/iUCsPmomb?=
 =?us-ascii?Q?iBaFa/L+cw3crFtp80fKE9a6nApMDx3RAOyTUH46Fpk2JJkvUG4hNak+1YZ+?=
 =?us-ascii?Q?i3n/Q6ofyakg6qNa3GE0twH5z053X+XbCKOxOnaJ4cNaYl1ozikpByMz2RWz?=
 =?us-ascii?Q?Ncd7ZIeVLejT6dHVwC2CvQ+vibiTqoM45EYeg6jSsQtfyjL7np0VBakFyirK?=
 =?us-ascii?Q?ksUl0+/mK9MPwjT8B1CpI/H7EJA6bhsT8qx2aJQK4QmtO9qYR4w4yUxZAGM+?=
 =?us-ascii?Q?HLDIXxs91rrV9a2bfo106yscZJ7DCon/iojdejuu/AiqH6DZSwBEkZPWiBJK?=
 =?us-ascii?Q?5psbUO+LFzFKq3r2Jy0Z3P1FZUIb9o0dtjx6qGcxCDnC/+rxUoy1VG6cThIA?=
 =?us-ascii?Q?R1GOFcGJHwze8lpMLORmHJ7cxaQhLfA+phkOoVsfhaD4PNZ8Vw5SOuy52yKi?=
 =?us-ascii?Q?09tcWFK+JKzFBwb5D/INvHVkvfZnptBn2Ykd1eWDqrKgtRUdouoqpJqXrE7P?=
 =?us-ascii?Q?9am0eLpTRQrCR2FH/49UGUZQXf3X+p4bN36iF0ff5hJjZTIovc6pE7Avx78C?=
 =?us-ascii?Q?7B1SwasqOQ7F82ZzTjUCRFW1NrO8lu4nR54h2TOvoHJzP2y9saHlH2F4Ewrz?=
 =?us-ascii?Q?R9iUsG0Htel+AeTE4KAQpbxNadx+fiq556/F3Ns/W9DsxToILYmY+grPnZi4?=
 =?us-ascii?Q?XT1S6uqwiw79iHuRPnkiWGiuaBSgjN2/3z6wstgo/JQ5U05KcsY08MvT4pkk?=
 =?us-ascii?Q?ROPe+XZYvcQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB5679.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E1LDYAl19rl4O64XwKSZFgFM385tG5Nczy/5Z4/tK0PD6WWfitACCsb8+nCF?=
 =?us-ascii?Q?4zLizvl2uTjiNv5jeiEK4r/lseYIjHCxSmE3koVvZqMCWqYj4bRh9A6Fgzpd?=
 =?us-ascii?Q?ks4yPvJo4ieNOYB1UuzWOZZ25cmowmLy57EbgjQ6UbdxRVYnSiZLDCM751pJ?=
 =?us-ascii?Q?bH+HiULmNxlH8qGYN+OiTv+8TwIN8kuGlgiJBj2cod18YgLjc3ZiQHBZVDYr?=
 =?us-ascii?Q?VSmIbNl49vunXUTjiRNJW75rs3jvwyQm7nbbu2bWTZp9cfYnjg72mu0TFeLU?=
 =?us-ascii?Q?FhXIl4krqq6YSNbk1xwpBuUuoQ1CKeHIc91nh4HJGqVs+sCOoEbMuOsv6A8W?=
 =?us-ascii?Q?QCN04/NOXhaiX1S+dN3orGxU6KP9O4sGWHscztiIFuFparPdnpzNzTN3LdM9?=
 =?us-ascii?Q?CSIsQwUeYmwNKgSZg9L1DWuYr0SFfrvszICXwY4lkkmHxIQ58A2SErnLnNMX?=
 =?us-ascii?Q?juq5EHl0WLw4fwgmyJlgP+TFZKeQoNjfYavSBcSdHX4LuRGBumX7LWMYDVNt?=
 =?us-ascii?Q?LcLeDbNSNshKgT3NtXoVAjfqcSMmQ/+bs7C7yIw0+L+Sl1SPL2Gu1FTCXSef?=
 =?us-ascii?Q?oXAibcxiZL+JgEnnh49T8vLbeqMh/2hJLmQtamrzjnkTBCmAHgyNDVHvMDxa?=
 =?us-ascii?Q?BaUj/+1VCGDFcuPen8+/HJBRbf52maym0IVZrTdpSEB5v0lhYyzQr0RE6hXu?=
 =?us-ascii?Q?xvO3yq+kcReiwJz1ebKNfNf61F+bGFYMLOA4qRIKDLIrjrcje+qjbgiOr4NL?=
 =?us-ascii?Q?DVE40P20xJClbp1p6IjsBHUTUoAvG26KkfCvCx78nQlaxZe9VOYzz/LPohXr?=
 =?us-ascii?Q?FuiK8A6u5ypbWCgSgp0LLQ9nqOr4ZyaoNztPGyefKStIe6loYoYhxCMK26Dr?=
 =?us-ascii?Q?IDWfOlOTY0PCHxeyOzAgXiGI6AIk7qlpSAP+V8SrsHKKPN2BVOc1cYitfV8l?=
 =?us-ascii?Q?SRC/w370LJNF3+PtEuOUFYI7yKNvCNQfyZ+I9GE5Oqhh34QmoW45d0h6Hm68?=
 =?us-ascii?Q?+UtBBZDQB7+mTcHU9mvGzIgjtrvLLcvJDYySe/i6myvSI/hfkoGT4u8Y7bHV?=
 =?us-ascii?Q?M+G/8Ytkv6MhUFA+wEs5rCtgHUM3MNj2h2LWQv00hDR4VuOW/SIe9taAQMCX?=
 =?us-ascii?Q?TXXFA4qadw3c28GotRGydM0HhQdkA86cyOIEVuM/SGV1rBXRpJ3VwvSC2GDZ?=
 =?us-ascii?Q?PhCZ3pwalkpNMeLj4wSXAXS7UG2E8JcjMcV37ex8G3KFRefhAgf9+GFgvSoR?=
 =?us-ascii?Q?BKPMPrrHs5sHAoKO4eIed2ZlqNl8PrDb2nd80gJ3hWlTShLnrj/Fu0xwPn3y?=
 =?us-ascii?Q?95U78/Qwc0iZpgR4o2M8/00l8ORf7o2l77b4B6sKFxFZtT3C/cDKiAZ8qK/D?=
 =?us-ascii?Q?YjvkY2KJ0vuj+ImRxABR5JYh3KJ7Kt429kNk8loEhwJlfJipNeh8HJllIdxJ?=
 =?us-ascii?Q?TU8I6CO3HoeCZugqRErJeMeu+0/FvQqmwDuke2LdVnIb+Frzhakkk4hazz1o?=
 =?us-ascii?Q?GOykbmNT+W/4gACOZgIgLv700dIlm/kKHXI7qtVJbheOiX8N6ICxYGZgzE7G?=
 =?us-ascii?Q?3CKmlRs8r/A9LtENldElOrIQHVFkE5UH+wYW3lgIdwqsV2lLb/m/OlOBOxmu?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bMJMVIZdL/gZ0LDj3Y9FKN+K6XmqihVcX8/02L7xt1NiC3eizrvfz9yvaebos9+EBr8OCJYnW4gbuIWZs2XVppHzH0EtGDEZt9OvrOoN4jeYOg5IMtaUXiyJNkNmHXpgBMR0vBt5QzLgh7S8NiwxsRuFYl9M3eMyvYnk2b8MHhgkNB/QG3cHtDghNulsiK51j2VQvcbFhGra55WU+FVLcVNvfWvvw16E6icGLmDQzUMfzMBJMPMgeesRxTzQJtkv6XkFys5e40vc6XRMAq32RRTCLm4qzRIN2UipDvMH8RydYtilXKZUCdo14vlm1Lmxg5UeYgGW5FsYkDRq1x+O6RB4G9W62rV3Yh7yRKsHN93bSr2qlbWDRYUPf6ig3MKFJC7z/paGyG/SEwquM7RUC7Y3BTkwb9/txuQ9j93z3mMsE0XlAY7WK2WJKvddZN7USWAE9fGJs3l3g8lNM8o1gIK37fYi2eewod5Gc2w0r4vGN3gBrRbEW3jxlq6YMcv3NaGK1BLLtbS53kijpyATe/EV9oKmGT8+6SusRx2rjbmCsfrhzFi/M9Cw/+D80hfaidBASmQPdg6WQ/NhCtzET4hIDi/qcJ71zVp+TZpY8yI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf753fa-1b83-4c5f-1926-08ddcbb24f8a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB5679.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 19:34:45.7085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zvvrz0PZEKykTs/0Y3xdUT38SpwuWjP9xrlJZugRZhcLQO29uAXoLM7Q63HgyYX0sp18ZPxEzKk7UXg1VsX1yolu02jQGyEPSz9fvd0yk9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7299
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507250167
X-Authority-Analysis: v=2.4 cv=ObmYDgTY c=1 sm=1 tr=0 ts=6883dc6c b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=CuelDG_OGeiJGSSr:21 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=IuVmcCxAHAl2FACE9sMA:9 cc=ntf awl=host:13600
X-Proofpoint-GUID: QOJFNE12XJ_vdu2RBa7UgL80AoLQ6d-V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDE2OCBTYWx0ZWRfX06htCoXJPMdq
 ovmkyRTrKGxVOWv4c0mvVukf0/wq+/vpLtFqT4JiG6NhNlNd4PdPjnsyw6khatcaPGPp8ej5gcx
 37qpHs3xPI88DOUYBbfQrm0Omgbnt1qDacRq6VdJOYgN80l6Cxx6akFVci0DGDJOJ3zVgBsh4Xj
 K1VtU4aY6er5PD00FznVS7bxfaN7eMrsQSWslMkUIRCGvJVxeXUS7ks9JD6iDt+e4tE/aAf6Qp4
 92lr2JLmeBcqSxJxmDno0OKmP5A3FEPiuJy1jH0/UJTwI5HacameAexpgmXBDITI59dqUJDgB/q
 Suqs/PRNynw8XD+u3R40QwUA6Ma9OdrylThnau8kXICmIVTTXyWvgQXF02qzq56hmE5stkLH8jP
 6DxGi/9aDPxLGyuwdUiqMBj4Wt04EbvKQwzE6KIZaVUgfjvWIYoHfntr+vU0UaRF63sA41GL
X-Proofpoint-ORIG-GUID: QOJFNE12XJ_vdu2RBa7UgL80AoLQ6d-V

When a lot of probes are being probed, keeping all DIFO around consumes
a lot of memory.  Once the BPF program is loaded, the DIFO can be freed.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_bpf.c         | 26 +++++++++++++++++++-------
 libdtrace/dt_prov_uprobe.c | 22 +++++++++++++++-------
 2 files changed, 34 insertions(+), 14 deletions(-)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index ccec8b43..ad8cc0e1 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -1339,6 +1339,7 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
 	 */
 	dtrace_getopt(dtp, "destructive", &dest_ok);
 
+	dp = NULL;
 	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL;
 	     prp = dt_list_next(prp)) {
 		int		fd;
@@ -1353,28 +1354,39 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
 			continue;
 
 		if (dt_link(dtp, prp, dp, NULL) == -1)
-			return -1;
+			goto fail;
 
 		DT_DISASM_PROG_LINKED(dtp, cflags, dp, stderr, NULL, prp->desc);
 
 		if (dp->dtdo_flags & DIFOFLG_DESTRUCTIVE &&
-		    dest_ok == DTRACEOPT_UNSET)
-			return dt_set_errno(dtp, EDT_DESTRUCTIVE);
+		    dest_ok == DTRACEOPT_UNSET) {
+			dt_set_errno(dtp, EDT_DESTRUCTIVE);
+			goto fail;
+		}
 
 		fd = dt_bpf_load_prog(dtp, prp, dp, cflags);
 		if (fd == -1)
-			return -1;
+			goto fail;
 
 		if (prp->prov->impl->attach)
 			rc = prp->prov->impl->attach(dtp, prp, fd);
 
 		if (rc < 0) {
 			close(fd);
-			return dt_attach_error(dtp, rc,
-					       prp->desc->prv, prp->desc->mod,
-					       prp->desc->fun, prp->desc->prb);
+			dt_attach_error(dtp, rc,
+					prp->desc->prv, prp->desc->mod,
+					prp->desc->fun, prp->desc->prb);
+			goto fail;
 		}
+
+		dt_difo_free(dtp, prp->difo);
+		prp->difo = NULL;
 	}
 
 	return 0;
+
+fail:
+	dt_difo_free(dtp, prp->difo);
+	prp->difo = NULL;
+	return -1;
 }
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index f60bdceb..8e7aa4b0 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -609,32 +609,40 @@ static int add_probe_uprobe(dtrace_hdl_t *dtp, dt_probe_t *prp)
 	/* Make program. */
 	dp = dt_construct(dtp, prp, cflags, NULL);
 	if (dp == NULL)
-		return 0;        // FIXME in dt_bpf_make_progs() this is a fatal error; should we do the same here?
+		return 0;
 	prp->difo = dp;
 
 	/* Load program. */
 	if (dt_link(dtp, prp, dp, NULL) == -1)
-		return 0;        // FIXME in dt_bpf_load_progs() this is a fatal error; should we do the same here?
+		goto fail;
 
 	dtrace_getopt(dtp, "destructive", &dest_ok);
 	if (dp->dtdo_flags & DIFOFLG_DESTRUCTIVE &&
-	    dest_ok == DTRACEOPT_UNSET)
-		return dt_set_errno(dtp, EDT_DESTRUCTIVE);
+	    dest_ok == DTRACEOPT_UNSET) {
+		dt_set_errno(dtp, EDT_DESTRUCTIVE);
+		goto fail;
+	}
 
 	fd = dt_bpf_load_prog(dtp, prp, dp, cflags);
 	if (fd == -1)
-		return 0;        // FIXME in dt_bpf_load_progs() this is a fatal error; should we do the same here?
+		goto fail;
 
 	if (prp->prov->impl->attach)
 		rc = prp->prov->impl->attach(dtp, prp, fd);
 
 	if (rc < 0) {
 		close(fd);
-		return dt_attach_error(dtp, rc, prp->desc->prv, prp->desc->mod,
-						prp->desc->fun, prp->desc->prb);
+		dt_attach_error(dtp, rc, prp->desc->prv, prp->desc->mod,
+					 prp->desc->fun, prp->desc->prb);
+		goto fail;
 	}
 
 	return 0;
+
+fail:
+	dt_difo_free(dtp, prp->difo);
+	prp->difo = NULL;
+	return 0;	// FIXME in dt_bpf_make_progs() this is a fatal error; should we do the same here?
 }
 
 static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
-- 
2.43.5

