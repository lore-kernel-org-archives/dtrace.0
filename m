Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDEA1D2796
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150317; cv=fail; b=UfVjmtMMXCSOPMauqqyOZzCK/HP2VjffytTuTMmSe+4OfeYfP0a36EqPd09uYrqVwzJN4/zbmqjBg05yqMlL1sa+nMENWKxL6DgRXosQ76nd52cDbdH7H7FnlsdQa9VbT5Z3eL/ysKe8UydGdr/YAnUzee1CFy+kWNDco+2wRMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150317; c=relaxed/simple;
	bh=8sCMHpe/pv1qNkQ1sd1uNavczThnwOQSiJXCh0erdfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p1ZEYIKl1I+2KJoSc3MzHnmxtGMeVS0l/TT3ZXf7jTzrtPKRDb7A54ppGZIqJ+vv7vd9sREFqiDJHCbbRbJcCRBEsMvZIxzYY7QmbhQ20DEF1GQQnIpy4w6Wic3CHmu6wiK0RDAI1trS8Ia9l+OBl2ttXpBIlZLKuEw0ONtWF3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=P+NCMuYZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dVxOHpps; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="P+NCMuYZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dVxOHpps"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKtb0d031947;
	Mon, 28 Oct 2024 21:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=j+D1nQOYax5YdUcRC47gY4roBDGWWYdk+kyO+c9dBxU=; b=
	P+NCMuYZ1QWcHFCxM497NGpWr4ViZzv+WDPwnfDtHqgKOwUjaBoTdhxaWRUZutmT
	NlE2PiOPUhQzd0QXbezEronyr8+5WgD5621/n3RG4Nx/mVWsL5yyLXcTgbr5i1GO
	qSKNEhAj2D/u2JDFaqdIPf3P/YsUyYkZ5fucp2rcHxkyUXQxybHMANOJtj+Og1/U
	ARwTJgFv3IRfiGprRo/5ZqAuFbrmbPDRHw93PR+faP2G+QLK0UtgLxC4Ytxheg5C
	7bvuQlZWHVK8wRg583tRiKxHp/PJ2KoReelOR09+sXHvTT2f6JS7GiY1cwbekXlJ
	byUKUvoi26LM8warUdbuCw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grc8v0w1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 21:18:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKcI2Q008666;
	Mon, 28 Oct 2024 21:18:32 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2042.outbound.protection.outlook.com [104.47.55.42])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hne8kfqc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 21:18:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bmItusCPhIUeuPF8gw8Dw3XoxayW6KAYH4qZ4MpRp7ziuS3+hWcGEFwxsmpOnHfwIBD47vHAVDE1Njvq1PbUDjBC6ZxtXrDqbcoUGw8ahnirjpwhaYbK+aOOi4CfEZ/qfcKNeRv3fePYrMuZfomRuxmenOFDZZ5A279LF8oVNOS4gjAHDZL7GTFAR+UKLkLE2bX5ZeVZOXTHdO/QZlYYoojVC6P+bDuAaeyfSmJbVtpNpWDiXzlRN3kK6R+c9Jyg+D6y8CrMK8Jmv/QBGUZLbigZ2xvMxo7tK+Syd7CaliOR7fkEhCMA788FUzwKtKEtSNxIGgu+d/pwIjDuFHj6og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+D1nQOYax5YdUcRC47gY4roBDGWWYdk+kyO+c9dBxU=;
 b=fjjjwJy58Ecp4jdSePFJwAzPv1RblR5nvY6h/MFWdJZlk+vQyytzrV824NksDDNeZOq+XIXGNx06IGCRo8YCocxIUS7Y7keAb2UNLuZBMNbORZjFcwgy17/6NxRryVaYQ6iooMzCuTN+lCB6wjnxsB85IPoAWlKiD3U62Yl3zJTwgVcmcL0Q4V+9h36S407nKPwCimNxduw9wf2y+b4bbDPD1AAs2BPPB0dLwkoqAnlNtqSgzyAC0hHElrNAGsMVBEHt2OVoa17gPHTLU682Gr1/0BXdMwWPgvf+NO8XfQNYbWBcW/0PXU80LjGWzW67Q4TyXhw5AsvWkdP/KZGV1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+D1nQOYax5YdUcRC47gY4roBDGWWYdk+kyO+c9dBxU=;
 b=dVxOHppsEUW7U8Odio26dFLnDMKt67/KDuYwJP0OTbYoQqxvoNY2zMPBIRoPtqq6EkV6HZgPfqoR5FQznhMZpRXhtlQNVZVtmxQIYiLdQWcLPBWDrr/gl4wFzr6XXJ+TAQYodEHOmiWwtwOcYWPZnBrKt7+RRkwwDQdWSCWjSvg=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH3PR10MB7354.namprd10.prod.outlook.com (2603:10b6:610:12f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 21:18:29 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Mon, 28 Oct 2024
 21:18:29 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org, Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH v2 10/14] man: fix blank line in environment variables list
Date: Mon, 28 Oct 2024 21:17:59 +0000
Message-ID: <20241028211803.458685-11-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241028211803.458685-1-nick.alcock@oracle.com>
References: <20241028211803.458685-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP123CA0022.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::34) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH3PR10MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: 5350f357-76f8-4b0a-373a-08dcf7961189
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DJWIxP9E2dAPLHDQi/GHs6z6/grM6aYNGqM/0Ejj/Di5sLLkPaaJppFvvo7D?=
 =?us-ascii?Q?Esb6jIgMoZ5PGy0SpFqU+/kDzI2s5Kfgq3uMxDWiluIQwvmM1KTOWN1oszli?=
 =?us-ascii?Q?6FvQXpCN3XHg1AvU/zMh2wwi1RlcyRRvDWDCTSQkzDO7MR6LKiCBvgmTcucn?=
 =?us-ascii?Q?5B6UWIolFBPsSz53gyBNDp6oFyFDXfjiehJm/07xTBx7DdnRkibv+/jFJSXd?=
 =?us-ascii?Q?W3qjjQNalOx+xbVGfCHBzb/vGJUCR3ZZ6uUOb8LRLDYruI8Hf4iCt1Yamg0I?=
 =?us-ascii?Q?dGfKzfJlOeyIvQCfuwnPwA0PhtaItOc5T229IxxgMpfxSNWsrNHnoa812JO5?=
 =?us-ascii?Q?qrnRpajr6h11ncM6Ae7c0tPDNP111QzcZ7tNPJz+9HIJc4//lJMJOm/0P/gX?=
 =?us-ascii?Q?aRsqi9rhieeHZkj4HAd1SWcNI857DLGwjvczXduyiHxCQKLZOhkMgW2TNO3j?=
 =?us-ascii?Q?DEpuE/a5Hoj6pRuU9HgPjTgNCA6ssaFng2qhmAQFbLo6DSVY2CwtPzkzbigs?=
 =?us-ascii?Q?8nypTSOWBThC5N+FzMfa/H/4f9b6qU8HSs++73E5CZedAypTza1COChw+pgn?=
 =?us-ascii?Q?1c2+im8mSF2wDHceDjFX1Gw4He6JJS0xyxkHV5OGr3pWGJbWL1SMkC4WQzl8?=
 =?us-ascii?Q?yq22hqyG7+KL5DT22lJu/pRu1JXGb1CxhBY357dw8UU92stONCE2WVMHheT6?=
 =?us-ascii?Q?ZKD2pEDVNi73jt1YfBscC7GfoJmX1YqPHpv72StECrv3X28Vsm+bCCt8BDMt?=
 =?us-ascii?Q?HIrbR9dTGJLErl5haVYqMpXu7KPmowvoI73evmYoT8neUnlsZK6WsbmsylTL?=
 =?us-ascii?Q?Xi82cuGRLTPU73Ha/Z6yqtkhEiBjme/D5dEdVHNzVCKynntabdv5kxu+PWQ2?=
 =?us-ascii?Q?8s9OVgxfrbQuyQgTgsUwfB5vL1aGQ5yFJCjF+uhUCibw569LTPk+pex8GvoN?=
 =?us-ascii?Q?155vphXUQhHfkfhadArJwn6GUOHxceOykm/ZSdnJT/2H5+67pEV1HdM6dx1k?=
 =?us-ascii?Q?2ZJo7ec3YqL27oldyYfVdzPJVuMYr10da4K5x/wBMQZsWO4prrMa+WFaAlAA?=
 =?us-ascii?Q?g2/MIAzBmFU0wcyBGNI/zcMeD6STFHcJYY9xHqIck8tYeWkM87tP/cLyGK4I?=
 =?us-ascii?Q?FtK8Docq6RybZhc8JMtvJxk65CZ0H8oLmPecQcGO+nb/z2qmgoG6s+fxIcIE?=
 =?us-ascii?Q?/bmpWHJKS+dkeL0Ukk2/aMmNGRA2Q3HVBaxLyVRFen2wu+l7RnX3Huo+1c+7?=
 =?us-ascii?Q?hSkhkbgu6B0yCx4Gq+Rj5y/7/FDAVa5d9DCkvi2HwlW3gAubiViP2WTK2zdK?=
 =?us-ascii?Q?CqLCA33srdWXJea/HbabtUeS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X7s3Zq52YQlQ92DE6xm6cCxcKGyUgnhmCDZ2htG3V2q0NnBE4mx1bMDSdfLe?=
 =?us-ascii?Q?ixmiHSlfw1Q9VJtcnDNGjQpDg6+YWY6eRiqPJGCGVElX9YYE2YXqBUIIHWkW?=
 =?us-ascii?Q?v+UxNogOjVMz4MF44aLID+/g1q1Zy0SPwt88v5VOm+ktCDEKWJeGQLevEFC3?=
 =?us-ascii?Q?xFUSB7rgNlJ1Pk0eFh94ZMrWHFp+Ybp5iWvP+GdduF+3nI/+/dVDCaPqbU42?=
 =?us-ascii?Q?/O3xJIWekDc8GIJ8WJnfzv5Xj0E2fgtSWKTqMY56ZR41yqIb5auilEiTKTNv?=
 =?us-ascii?Q?wZJve7jdhmHIsCCQMkk3fmRa5dTh7YrI0ncrahaIqUiZWiMOtBNNe9dWGJpn?=
 =?us-ascii?Q?JLnc0Lsf/j8QAu57jl7wirSPpigz6WaMXpSXK0vT8dl6dMqYOpfvmCDBa7Nd?=
 =?us-ascii?Q?QhV7v6/I+NVtnYqRc190YMh8X/urcgAfd04CD1Au5aeSK5mtp7HxQeaGi6m9?=
 =?us-ascii?Q?MWukzb7SwOEqzdqjYS9g8zNZpklO3Yaa7pX4MGdJ0qPhhNe4YCbgCrFo3MH7?=
 =?us-ascii?Q?Vw+QPfKKB5ZxmGTS4MJMTwEKVwoLmjCLTTSoMsP7uwUhaieCNYYjKID90nZr?=
 =?us-ascii?Q?R+6OJ7PtGitvJb7cVUV+z0LDgi7eBRqQBu03vZ6lRYtZzk//HXpaJPBNY7rI?=
 =?us-ascii?Q?vDgh+7Bm+hkFgLwdXmlF8QRCzQFjDoeHRkyuz8pikLvA3N8/Eotpl0SibqIv?=
 =?us-ascii?Q?6vUe9y5h27CuF2CkUs0/ljXGPWN/0znNfIFDDQxP2Jt814D9Q6vcGKYmHJz3?=
 =?us-ascii?Q?LZx5aRE7zOdYu5hBjHpIcETn1GflAqDMVBZs0P0e26rgDrMVuMF0/HtwGckC?=
 =?us-ascii?Q?NL2MNfYc6P8EB4o846yXtQEK7qEZTxH4S4mzeFfm840nMWbTdOfLR11zN1t0?=
 =?us-ascii?Q?0+073rckE3TIan9My2pBeeKx/AipD1PIA87ih6AmzJdfIMzxsP9S/zin+FIL?=
 =?us-ascii?Q?n3i6/EcGbUS8ISnLXum9VbDSRb/7w2Nlbw46DYWTb8glq6i8UAYGkiSzkVKW?=
 =?us-ascii?Q?BqJFWu8pXVmwW/aW0qzO2orCftS5qIZ3zYDakLGyzKD81yy7q3RA4mnPDGla?=
 =?us-ascii?Q?WlDqRY6pFaoHSMNzbYyIFqsyiXw86Wm8PxjKS0X1v4DVBuaqmo9oPO5DfKB8?=
 =?us-ascii?Q?2mNs/q2NcyvFPpZH4AOWsiZ0IY4uyb/WStMpxOb21jQcSYi1lDstZKP61tSF?=
 =?us-ascii?Q?38EH9A4R7mISjZqwBqCx/MZikKo7N63WIdZQ8RsTosbVBW3MMI9c+H48PY6F?=
 =?us-ascii?Q?IAgKw+IsZc9W0zC0cMXDdQbZ8IyAbkOZYYTLejCztcI/M/p6sblXXeOgcusa?=
 =?us-ascii?Q?WyBCweghoSotpeUJjvbDgqmrCCKperU1qcJyFZDlHUliDjXreVUTb1M1Gz5/?=
 =?us-ascii?Q?7BvrlQByMyRxCQRyQXMnLhgq8+YaJ6md9xxiue8HdtuMscbmbmfDjp/IjxeW?=
 =?us-ascii?Q?34cozXDf/k9D5Z7wYlzzH92yQg5waqRLnHDT6bE+HA/GjFJL/i317UCj0Cjg?=
 =?us-ascii?Q?E3/VtTiGaX8WhPVuS9RVb/FWXhNH1hbeu1oPgXnW+xLUZ/A9EX620oeUeMMH?=
 =?us-ascii?Q?cBxWc2rvOYv0MZPjbos2U5d7M2q0yl4ngJh1bt5J8eoYaMvHne5FoZKMNra0?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pJodqYYrAKaD4dKAbeeI+S3W+I6k+8McD2w+HwW+dH877VrFXV1ty/DgYuf9VUv9jz6fxw+qlONDdyH9rI3ShL4KsnujZqidiln1Gte7Sld9/MhYfrU/PUgjg5bpw4pWOs7IgfdxM48dOs8kbWfsMffkKNkKzPrlgAYRq+zmrOCS4fv443QAFZVrXpzoTjchW+B52PCJTtSzE/wdBnW2BleRbmA4xa6DBzuSvvDlilYjVCN1D78k+tzr241/iLupjIGjde6p/hIHmHDMaCoo41ArDIbDByXoF7L4mLu/yXwbgNI1xlHevg1GQ6MNLMzsP4OglFOW74j0gZHSFnvAEyav1pQQukSKtzZTuBRG3P2FxrwO7MB/JTQozDEjEAMegjtSauQXRXiP3w9fEMLYppbyPPHYgzGRC/BtxkzxK7x1EUMNwmOsyzjRcOO+Ax0Jk+FToRqmZ2JYJUJ6G0BALfbTIJiwqB5L1drVyskzvnG6UucqV5tCBxZtjJ1rUj8+ts2wOydVwmhj4AbexRjFM1sy0m412dAVi9CPE8PaBH1Ui8wJee0yGmQR6QFC3vilokajf9bBsTVX9IRZKqsG8rw25jnFtOr47RvoUIaEQ5Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5350f357-76f8-4b0a-373a-08dcf7961189
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 21:18:29.1957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OA6bFHAulBfDbHnhgFkAIXWQ3J60c3f+OiTJPObxCf89KmyKOxJsdyvMLcoQy7TmRiyhApoGL35CxF3qSjfbCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7354
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_10,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280165
X-Proofpoint-GUID: OKvD8AdkJLSN_4Xr4eCM_xbXyl7s2a94
X-Proofpoint-ORIG-GUID: OKvD8AdkJLSN_4Xr4eCM_xbXyl7s2a94

Use .IP instead, to get an indented linebreak.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 cmd/dtrace.8 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
index 0639db2136a7..fb9392d29cb2 100644
--- a/cmd/dtrace.8
+++ b/cmd/dtrace.8
@@ -179,7 +179,7 @@ Print libdtrace debugging output on standard error.
 Print CTF type library debugging output on standard error.
 .IP DTRACE_OPT_*
 Set a given DTrace option.
-.
+.IP
 Options set this way are overridden both by options specified via \fB\-x\fR on the command line, and by \fBsetopt\fR statements.
 .
 .SH SEE ALSO
-- 
2.46.0.278.g36e3a12567

