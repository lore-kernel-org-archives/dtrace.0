Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E3279CD
	for <dtrace@lists.linux.dev>; Fri, 12 Sep 2025 04:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757650610; cv=fail; b=HAW24BWp8jjUJXddQd6idP76RnovysOUWLNbMid6oifeEJJ0bliDxOpF9X9cpGgYfv01FfLclqeC1llo75Al44hGAl2b+QMgQ6t7k2Yl2/IG/TmaCtVldzhM2GT3JsPtAOQew0tFJUWrzGwyPgPnyrD68YNWndtYWPRGCAC7Gb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757650610; c=relaxed/simple;
	bh=ORarxeKjra4A7bd9IfJ+OAc+Z5MTPw+Ad5QFG7SCt4w=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=BZM9XD+jlVbaNmff+ZTbscx7v8Qnzp6CG6ovUE5hNgHl9EwTNcby6SJouv7LjFrkQFFAybyyqAy3pwA/habnxv5m/OxWKTtj1+0fysgRY1fThyDH+kYK/fpF6/SCdVQWz51N7rdkTV0Pjshg9PThT9I3T+gDcokps7PeBPG7U+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fDYglD/N; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TU9GFDcK; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fDYglD/N";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TU9GFDcK"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C1tmsZ027245
	for <dtrace@lists.linux.dev>; Fri, 12 Sep 2025 04:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=NU1Qg1zyutfG4rPoxEstlvnKEbFnJIVotfUIi9/LH6g=; b=
	fDYglD/NuQFcDgyKPk90eMxUl0xZ4qrpYi23ZhFbvex8P7URzZN3xEsETF86g5LV
	lVe6krHKea3sJjlZ9LJHUKfDFozIW6PTHOhrUKnDFXlHKsZT0WE1bRgoD1etY8DL
	j+Oh8X1IxxQpzMXsCYdMC3YNm2O6FpAGX+qpws/4cSk7TEcw53f95v/SX50cXpur
	ZYOTlEyrKBM9y927O7QLp+wvTC4O7Dn4tcxPYUP00xaYXICo3PAanOIC2PqT/bd8
	6s1pmTcbHEQkJb13bHzL4EaOic2H3FDLX+dilup1HYxnvKRE+nWEVdNwiOUYojwo
	Uk+GwPQoZtqyK4uLw0I2Tg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4922shyd0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 12 Sep 2025 04:16:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58C1U3rE025921
	for <dtrace@lists.linux.dev>; Fri, 12 Sep 2025 04:16:45 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011068.outbound.protection.outlook.com [52.101.52.68])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 490bddc9qx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 12 Sep 2025 04:16:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hM7as+KQ2RZW1xhMF95tMICdXw2zB7zyfU/hpM8TkuT2p0FImfmAp/x+7Ps58MR0kHmKOdbyFNTd4JZJDUeL8cj4vxwfoL9PbEJyBAtdOjqXt4sXnblsPMV3+CGJ+vuhlWOMHUniN7yD0RgNsrYo80H53ahwuSvUQfBdI5kK+q9nh4ftMrVMy1mKnUhaqzfoDtvQlh/9OO2HHyUl9QuNASn3IdD8yD8Ka4R2zck4tL2nZxo9w2LSOAY9sZnnaoffagyB9qwxXF+P7Pqdf5EjaNwTj5wFfZ//UoeTVJGDKHu0rBX6SDb1aXuetZ8JETtZsBCdoRQf7xUj4arOLWx2Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NU1Qg1zyutfG4rPoxEstlvnKEbFnJIVotfUIi9/LH6g=;
 b=MQIyQVXuHXUldtwrxB6lb1qZc2lSnEbnDA9k28+D3DUGtwlM9TMifDTJ1Hs2UiF4PaeOnx90NvwQRfh6rwaGwvukf0OyjY2YdJkXEJgOfAj+es5almWkquyRllvC3Xlxzc2tUcANR/sksCnRd56779QxKkG8DplJYEjtGEKUMs30JSAOOBdx3c6dJ8G3H1Hh8bA1qlGuFCxzxOMx4+tBQsfKZAqbRxuF/VZVxtQpl6IVHfk1gJ4Wbyh9fQdQFw8VUREKK3UbgROZgK6qWJdj2hpuNCg9fckrkRTHZjDgtNdmTyLVqwrej3Bb0KsSS3DTLZpZ8X4hyCJO4eKHEL5lyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NU1Qg1zyutfG4rPoxEstlvnKEbFnJIVotfUIi9/LH6g=;
 b=TU9GFDcK/36EoppUKWsbNf6poQYH1/dzNy6v25Axj0GdQrGNvyzBdHMFFTFkPgAJI7Zene2uN3yuTP6Hg5UqrFkBtVvWuWTaxXpnZnL11EASdcATFqik4H+6VnORL25Fn1Dn+CPkyiDOYmccIBrDHzTp0QGzzxI0hG8ftoYL3+I=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by PH0PR10MB5561.namprd10.prod.outlook.com (2603:10b6:510:f0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 04:16:43 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 04:16:43 +0000
Date: Fri, 12 Sep 2025 00:16:41 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] trace: print alloca pointers as actual pointer values
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:36e::15) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB56726ADFB2A8CBF47D3B8C46C208A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|PH0PR10MB5561:EE_
X-MS-Office365-Filtering-Correlation-Id: 602cf4d5-8b21-46aa-3c16-08ddf1b32e1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eHn6ZmIbb+nTrQ/CUxl/ZpcGj+OQMn2cMaTenp+bpPniqiXGzO8jBSD1HrG3?=
 =?us-ascii?Q?kf4bDCFY6c60bX9WVf5uKF+od9XCdeJVKydyCmdl+e3Ymv2pLDgcuhjQ/7Zo?=
 =?us-ascii?Q?xI0QZZSuMy3Y+sZ8pdPz49FaOXKoiG/mItIZMXtp3KbWz6t2FOOSsFE2h1J+?=
 =?us-ascii?Q?XvMHJdOZkkGQ/I81y2nH/FIDcscgjkOfgnLDiKlULj5rPPJdylKxAQU2tEKz?=
 =?us-ascii?Q?5Jvoqn8f3VhR8YKaxh1BzhLez0jmZPEixlq8/SJYoq91q9zqVpL6ctWZHAcc?=
 =?us-ascii?Q?oT3VV7lku2OEkYUXZ+TZjmfS845mv4cD/PaUDnmkenAlWs3XLQ5pJr7WQj4g?=
 =?us-ascii?Q?frr+yAf5GKcCjpQmrrsUSk18DRZUI6ZFCZrAXuY0HG9vtnZW7XlJw6VslsKe?=
 =?us-ascii?Q?suF8lAP5dhCXMgFSlCwvzF8zefqI41/KhH0qW38dJJBnaljhrfeA68DJ0iFW?=
 =?us-ascii?Q?voxGbz2XeiOroMZy8XAPoWFk2wrXqj/ONH8/tFXoy3vqgdqHoQ/VeJAp/STO?=
 =?us-ascii?Q?omqg2XGtTzloirwU8rM1HlR+N9U7UDeT6eC609+F4Zts4Hk/tlQFHFtaBCq8?=
 =?us-ascii?Q?LBM1tyymjKACB9idB6IWnYwF4Bsd3dU7z0l9RizwUN9aEa+dafRTY2E8ha2G?=
 =?us-ascii?Q?bERZ3SLEhajQCM0QtepP89+sr5sLMbs5yxj+o/rWbr0dN1WHOb16vroSfrB9?=
 =?us-ascii?Q?HQSb59jtkUGfJWgcFz5zrBpFAF0ja2ngJ0jLJVfgBM4jL9pifUQD2bp4xK/t?=
 =?us-ascii?Q?MVTZEQ/ltdR8h8txX+n0hwLDJnlEBNIq1VhKE8j5nUzG4oeF00sH61xF+vcM?=
 =?us-ascii?Q?wab1Nr4d45NduPgEztOvm4D5qUrix7IMP62rH4P+ruEujfTFRITzmO5YQgRs?=
 =?us-ascii?Q?Z10XaHnOfVw1a60be3/GSTHnU2UJKpeoeT6j0MF4nngWbtwzK3hq5XCPKjBG?=
 =?us-ascii?Q?2yES+5/UdgE2YCYkr8c6RjIy75skJ5WKefFketS227jQtMFTYR4sbgemKkby?=
 =?us-ascii?Q?n/A0QfwhQKIrWd45zvmEKBMxYrwYlTag5pUYrUfmi8OVw+xXuyOd9Vw1+Z+4?=
 =?us-ascii?Q?Jt+Cma/QbHUpf1le+cQTOpN5RmHYOm/bTIwoO9I94prRyc4xHwMR3u9xvT1X?=
 =?us-ascii?Q?XSGJTqFgVoK6PVCX8F0wwrk/DtTvpskep0Q1AhMuEXhReXeHSuyS8osYwJVz?=
 =?us-ascii?Q?DdZFo6OFbX7Fag1J+A9ZHcKYsqNWr8u4avuqNKMte3aQRQyqy9nuNWvJh5vO?=
 =?us-ascii?Q?NUpvgJU7AaS2QotST3vsHMEOL/miMUikrKsAxiqFuo9+EVlv1rGMizk27uHD?=
 =?us-ascii?Q?ilhSBzs2zCn+0zNGM5eUe2vapa2nwYXCtHK7PzghEvu1Y6kM1ZH1IILIZWEY?=
 =?us-ascii?Q?3UdmbYReiEIUV5xLPIQHeaaIPbdF1ONGno5W3zrw5pej14O1oiRg1zpYJJWt?=
 =?us-ascii?Q?9jsXiQqq6MI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sjrXiufSIlUQjrzqA9PfzImVuboDPrMSu8Blgc1yXD7nV7Ic3/Rt/kAd4XzP?=
 =?us-ascii?Q?ah7i1o9OnQW3aEIQ8uf6so36/tA0+xZw4luo9lYVR4fYti5ay7jQE2s7uuHF?=
 =?us-ascii?Q?n1pTEphxAsGjE0eFZsA5oLNnHwT25ra2AYApwx7xUHsE99581E+nWFpvnLGw?=
 =?us-ascii?Q?hItdOd3jLVqDaYT1pyTFWaBTHY792hmIks0ci3dLr16W2xDytFq503CaowNT?=
 =?us-ascii?Q?CqLLrMiszZ3GqJ/4FxlBrhBl4M3v1YRgQqBQiGbtIb1ja4Bmi41Dfxa0pJ2b?=
 =?us-ascii?Q?51ke/2QGMiNEqnyYL02win8jzWczrW6e20OiTKfFacrFjDK5XNrEMfFyYcrB?=
 =?us-ascii?Q?cAu2197PowR+vVpGg3IVa1nNg+W7aBHcZnKVHiWws+AsOUBz/3y5jbFDd7Pt?=
 =?us-ascii?Q?EKvUZCtHwx/OH/wMiXT/5vB7ovKa2cJVNQugGEKkK3AWW82IWvSlYTEt77WJ?=
 =?us-ascii?Q?iwQk3w1dFh7jDT979Ve7k4I+M6qx2Q5H76aMH9F1HiHenLIEu7h3w+mXpBs8?=
 =?us-ascii?Q?KLmO/zUGAdwM32HsxYgCSFG3bha50mxKSgBYma41GH8RH0hdW34g2OktzCR4?=
 =?us-ascii?Q?czrUyhqNb8HJ7db8M3GWEw2iDLcv0/a5Bb+6pJWkgE3EhW/zgV/p8Of/kuKN?=
 =?us-ascii?Q?m/iCKgWslGCTNvL1IVT2M5mFbyGJGUWxEaAbpYvkxkQUCNuswJzdFi7tZfCT?=
 =?us-ascii?Q?pz2kAtWPaquDgzSUMtV8q3wr3tG/ZOkbN1Au2P2jSp42e2ZiRkuttkrM08WM?=
 =?us-ascii?Q?6GI42dyPm2uCHsf/JheIW8sOoGYKXs3xNZLcb1cq2THxDvLSG+UQnF5THrtT?=
 =?us-ascii?Q?iA3O3puQ1gJdZEAyIommcXVgvkApLcEVuiqBICHBfNdMPELBYxMAdKxwW0zg?=
 =?us-ascii?Q?ce4/PpXq+Po+Fcp/+aaXzIY3pNKI2irHPmYcqxCvnEAUQDpCWqIGBVzjHGd+?=
 =?us-ascii?Q?itbG+o5vCf0wEC3htID+woXAaOjafPmYDNSIRkECIKmO9h8sWoO8+UQiNsa8?=
 =?us-ascii?Q?KbVEpn0DGf2UDUTxIoToDAEeRFVHfYW0eGWNxxcUcUJDwwX0VPKdvLeH71hn?=
 =?us-ascii?Q?Vl/VBP89HD8S9W48Zv3flrUKytKi0ZytyGqWiIiqPywZDFEpfg5WfbP4F1vk?=
 =?us-ascii?Q?s9jkOFVe12KVKYxto4GILferTOjKRVPCjnFrV5vk9ATJY6VBqwllrvpGSKvg?=
 =?us-ascii?Q?ok03ocFgj8qpO/dYDqzUsPgd1YznQJSaYIzUV6u8vFAdoaGcSn8cQtZJ3OQ3?=
 =?us-ascii?Q?I67es2kj/BwE05qnrdn0TX6/M6o5HuBFMYCaUmXPWhZpuuiFWJDRCKa3qrI+?=
 =?us-ascii?Q?4INYpRTUx3Dw0O4NJwZyAZOrp+pxP/r5mZZ3TMvLUrVxS93Bh3s3w4KPRlKP?=
 =?us-ascii?Q?7EhsVPsvG7HJYhQwL9yKgW1+IggncG00UJGe/od59S7Kf3KWYn2FBRmQyrQC?=
 =?us-ascii?Q?zrSDYLeouUWlO4y2/VxyfJ2weu+9865pG9+0tnuYGrlgXoOEAewPFxkEYoRW?=
 =?us-ascii?Q?kBV13dqaEyWBWzriH/RlvpZwkvse3QE2tZLtvYT9IutL2SNzBG4BU6AELx9m?=
 =?us-ascii?Q?KozyGQnCVbkkWxuc6QovZU3d2LnoWH8jqurOkzkFFQcDeix2u9nyVyk6nxy1?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0zN/292/SUMzEfOalGNdAbw/Qcxl4jnwzHhjQT3WrFkJiHc3p9sandGsqmn/cqF6qVqyfPJYOIN0TNE3tGPu6CVsg+ZrcmNid1DaglablmInRicm/xXwxuFkOGG/92d9og/4XIavHuOapMiA/aRAQWRdDrN6fSI/wVnv2fOqefO11XW2ZpdqBX1wEb0/ma2Rt4s0IYrTT8cuaRz0yjJc5yATV3gMT7Qbd21hrsAnamnjxYMON+aSDhR96WKfUfqNFlQJK4LQqLBuMunZbwtHoAmwVnNkea2IIygjqdVrH7bFMtoYpcCix7OUv4mPTKXqbKyIcLxa/Swc/JStZ9Ttj9PC1vsjIUXp1RRn169qeJkS0bA/caTKnnNrEb2FgqAgR6HPFyv/qOyyiCgesbYF5aCOUAgLtvtSLbR9lxP066rLYWChAR/SZSc1bZHLp/30BVuSHc8rn3t7a55/AF++pyYWoe2VlgRLgA70ir5mw6Uj9/6pHK6wCAPGp/b4nS0aasLfdFwYNcI3/Eb28EHj87xREXxrc2MKta2bSylS/1cXpCcFrt5mMrrUaZGUW3o+exujAD48pIYPwIHT2S7aIva6xPV1DDPW5CwLJAvELcw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 602cf4d5-8b21-46aa-3c16-08ddf1b32e1c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 04:16:43.2602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wj+G3ElYKwkgT95z1z4q0WzzX0ryPMI2E/pXqQTLUUEfw1yIl0RAzIe3/A3pHoZj68B3e5bBQTnEf7GjWtQkQ3EYPwLsGFFveI6FMHtIziE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5561
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 suspectscore=0
 mlxscore=0 adultscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509120038
X-Authority-Analysis: v=2.4 cv=esTfzppX c=1 sm=1 tr=0 ts=68c39eae b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=rMDKDOzzwQ21BvzFM60A:9 cc=ntf
 awl=host:13614
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDE2NSBTYWx0ZWRfX88Eo60oC7LZT
 moh3KjEoE5Y54fE4cPlnzZLqR0+zu0FuofSt8hvwRlgeBN+LIgUsi/GTfJwEo8CZuDcpQIEfzXt
 MWPqb1LGXs8DOpAxrS70w/fOCTV1UnZbMGBwNgqJ0+ICkZggR9Q5L07LwgibYPpGokhBvsVrtyQ
 yXJpNqCQ4dyI4NZwsDX1bEBvpCFWjqpvKpw08z5rTkXr0WyFPX+fCGr3TXbYLhSD/UG+pI0fBWe
 TpNFMa/Q605qVkjiKAOk4mu6rzMBPMQkmqsrykvQYGdKHT3ilOyDeib7itNFrrWsjsZqsKu0mfv
 +0NU2Edv5GmZs9gYNc2ppSr+999xhnSLeVV+by4XbImGnZAkUBeHt6uj4Ozi9P1Z5xIIeCeetQw
 hhQHcvxpojX2SNN173CKzpg8HQwMrw==
X-Proofpoint-GUID: n3RAaYciKevCvnbfFhrTukkMIP6dmjcK
X-Proofpoint-ORIG-GUID: n3RAaYciKevCvnbfFhrTukkMIP6dmjcK

Because alloca pointers are stored internally as ofssets into the
scratchmem area, they were printed as small integers.  They are
now printed as actual pointer values into kernel space.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_cg.c                          | 40 ++++++++++++++++------
 test/unittest/actions/trace/tst.alloca.d   | 24 +++++++++++++
 test/unittest/actions/trace/tst.alloca.r   |  1 +
 test/unittest/actions/trace/tst.alloca.r.p | 11 ++++++
 4 files changed, 65 insertions(+), 11 deletions(-)
 create mode 100644 test/unittest/actions/trace/tst.alloca.d
 create mode 100644 test/unittest/actions/trace/tst.alloca.r
 create mode 100755 test/unittest/actions/trace/tst.alloca.r.p

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 78f29a2a..2456e8b2 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -1687,18 +1687,36 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
 		align = vtype.dtdt_align;
 
 		/*
-		 * A DEREF of a REF node does not get resolved in dt_cg_node()
-		 * because the ref node already holds the pointer.  But for
-		 * alloca pointers, that will be the offset into scratchmem so
-		 * we still need to turn it into a real pointer here.
+		 * Alloca pointers are stored as an offset into scratchmem, so
+		 * they need to be converted into real pointers before we go on.
+		 * If the alloca pointer is a REF or ref-by-value is requested,
+		 * we need to do bounds checking before turning the alloca
+		 * pointer into a real pointer.
+		 * If not, we should scalarize it so that the BPF verifier does
+		 * not complain.
 		 */
-		if (dnp->dn_kind == DT_NODE_OP1 &&
-		    dnp->dn_op == DT_TOK_DEREF && (dnp->dn_flags & DT_NF_REF) &&
-		    (dnp->dn_child->dn_flags & DT_NF_ALLOCA)) {
-			dt_cg_alloca_access_check(dlp, drp, dnp->dn_reg,
-						  DT_ISIMM, size);
-			dt_cg_alloca_ptr(dlp, drp, dnp->dn_reg, dnp->dn_reg);
-			not_null = 1;
+		if (dnp->dn_flags & DT_NF_ALLOCA) {
+			if ((dnp->dn_flags & DT_NF_REF) || (arg & DT_NF_REF)) {
+				dt_cg_alloca_access_check(dlp, drp, dnp->dn_reg,
+							  DT_ISIMM, size);
+
+				dt_cg_alloca_ptr(dlp, drp, dnp->dn_reg, dnp->dn_reg);
+				not_null = 1;
+			} else {
+				int	reg;
+
+				dt_regset_xalloc(drp, BPF_REG_0);
+				emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_FP, DT_STK_DCTX));
+				if ((reg = dt_regset_alloc(drp)) == -1)
+					longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
+				emit(dlp, BPF_LOAD(BPF_DW, reg, BPF_REG_0, DCTX_SCRATCHMEM));
+				emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_0, DCTX_MST));
+				emit(dlp, BPF_STORE(BPF_DW, BPF_REG_0, DMST_SCALARIZER, reg));
+				emit(dlp, BPF_LOAD(BPF_DW, reg, BPF_REG_0, DMST_SCALARIZER));
+				dt_regset_free(drp, BPF_REG_0);
+				emit(dlp,  BPF_ALU64_REG(BPF_ADD, dnp->dn_reg, reg));
+				dt_regset_free(drp, reg);
+			}
 		}
 	}
 
diff --git a/test/unittest/actions/trace/tst.alloca.d b/test/unittest/actions/trace/tst.alloca.d
new file mode 100644
index 00000000..d2ff5152
--- /dev/null
+++ b/test/unittest/actions/trace/tst.alloca.d
@@ -0,0 +1,24 @@
+#pragma D option quiet
+
+BEGIN
+{
+	arr = (int *)alloca(5 * sizeof(int));
+	idx = 4;
+	arr[0] = 1;
+	arr[1] = 22;
+	arr[2] = 333;
+	arr[3] = 4444;
+	arr[4] = 55555;
+	trace(arr);
+	trace(" ");
+	trace(*arr);
+	trace(" ");
+	trace(arr + 2);
+	trace(" ");
+	trace(*(arr + 2));
+	trace(" ");
+	trace(arr + idx);
+	trace(" ");
+	trace(*(arr + idx));
+	exit(0);
+}
diff --git a/test/unittest/actions/trace/tst.alloca.r b/test/unittest/actions/trace/tst.alloca.r
new file mode 100644
index 00000000..e9bbf2f5
--- /dev/null
+++ b/test/unittest/actions/trace/tst.alloca.r
@@ -0,0 +1 @@
+OK 1 OK 333 OK 55555
diff --git a/test/unittest/actions/trace/tst.alloca.r.p b/test/unittest/actions/trace/tst.alloca.r.p
new file mode 100755
index 00000000..8515861a
--- /dev/null
+++ b/test/unittest/actions/trace/tst.alloca.r.p
@@ -0,0 +1,11 @@
+#!/usr/bin/gawk -f
+
+{
+	$1 = $1 > 0x7fffffff ? "OK" : "BAD";
+	$3 = $3 > 0x7fffffff ? "OK" : "BAD";
+	$5 = $5 > 0x7fffffff ? "OK" : "BAD";
+}
+
+{
+	print;
+}
-- 
2.43.5

