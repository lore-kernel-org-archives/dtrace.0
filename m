Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2EA1EABA9
	for <dtrace@lists.linux.dev>; Fri,  8 Nov 2024 13:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731071658; cv=fail; b=JjRyEFPa55qbnRIy4ngx7SGjzyPvzlMnOU1S3Xl0w0svEVxeA0W58CvCq1vUhdaLuL2Wbtx7/wBbLli/w56hO3P6eWI0dEthUeNo9akGfapc9zcHigfi89b056U0X+iWcF/tl1clflARHeTFJoOKkbhkviffqo6Mu9BX60S7nMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731071658; c=relaxed/simple;
	bh=410BbYYjFJg3O/rVHuhrCtq3xx5BwEmucx9CyOl8hcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aNCspxoyfPezmcmhMxkk0hUN2dB1aPTWvAobU3rxq7DiQX8S9TxmRfjT3pjE4WQTWi1JHOWhFvNTT3xy7CtFr38aLXBrpTCeCLAzcovIbCSzmhqPgO7MzULBR1/GaMpFEXQJ3nAf2s3G0pzoCF6gRnO1KHTmEJ9r7mG+gWUxHv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=j8uzpwL6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=L7gAcQ5X; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="j8uzpwL6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="L7gAcQ5X"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A8Bh2r9011952
	for <dtrace@lists.linux.dev>; Fri, 8 Nov 2024 13:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=UC+cHcvw4kuV1D8/NOaspkWknwIlR0TCtRiC5sJ36VM=; b=
	j8uzpwL6OoWurbFz4pfzWhKoD7kfWkU7Eq+lScHnUKoZ4lxruDTPTqXKcgCbd7To
	78F8ZzjkdcCAqBO98DM0HMI9sLerqAj1Zwk9RJJu1aPIVkPduh+DWQB+D73h1xUP
	BQ3wtvWceKgZVKYnHwl+zn/ZrIpOsi35ClqW4TR3/BAWb2LQv3tuS0KL9XD7wVnT
	4NjMLd3jeZcuwbUcc2lpCe08ZXmc0nymppfvMvYuNgwKEmGI7n8l6qJ+Izvb6C7K
	X9NyjKqdVUnYRtrgG87LXE/Hziaced893Fui+56cYK/2BgDEmMA9AhkV31WdVQZD
	dt58mhzRU33AzY7JmrQbPQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42s6gkhfbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 08 Nov 2024 13:14:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A8BoKOq036788
	for <dtrace@lists.linux.dev>; Fri, 8 Nov 2024 13:14:12 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42nahhrg1d-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 08 Nov 2024 13:14:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUtMb0B/dX36JZu0vuDtKC2PPv5nxAWrgWHMd3xkoHb6M4ZnKBHmXiJTooMZjCN7Rd6Lsw92bssVLXIjPPQeIuxSGzr2lBDmgxDbJPWatMUKTN3pKCkTXOWYM5Aq2hhk8ldkB49AwaICkhmUfcpYEj0PG+WRrQwnvKRBZDuHmhsSmLtkiiHWjYNQUDvCYEuZS0nQbUGiYeLphN/DnpxVeyxe+xzNHgWK5Co4xhZ4916IYPYFGvfFCOUXe+GDU7pbFfLsPvQkIXYMy9To02Kd0odyeZlaErKFApe/5tePe46+/zpuz27gav+WygW3o9ecgZcq8nAm166A3DW3d69wkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UC+cHcvw4kuV1D8/NOaspkWknwIlR0TCtRiC5sJ36VM=;
 b=mySaT3TKXra9BhzflLhHXnJrHjzcpVBCzueHk5qnWgCoeRDddDpkoPcMa1SFwOyfvZyAYzGr+Bwu1LOzmuFyohPul7/w2q2wZmn7ulV58efxyoRKK08+9NfgnZW8u1lTuIZe8lLYJl7XB/ApidVfkKxrg7GfGlJj1A4PmIIJCeW9YpBnojBR6VmZyOoAT9SVPW906mqy6urdEMdvPYd2oMbuhzS1a8z4VD2WMh994rHNKLwfh6AXrPop32dj1g8p8WRN9PenIdA9Dew8V/4V6uJ0WLFuHQDfEFJ5YmTYdkGuA0YUwHOT2XWd7aGGyJo1+tIjg1P8OobOHnbAZKVxwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UC+cHcvw4kuV1D8/NOaspkWknwIlR0TCtRiC5sJ36VM=;
 b=L7gAcQ5XJDEzL0tGQjyfcsHnRTFKuWcMvjaqh1ZY6XnrY7SPX6qc9mkNFTdpp6BctjvfR04MEfoyuV2aSuTQ2wkczzpSmT9lLb6vUF01qD7Ve0sHgTBZ8mAC4nTltn0IhShqlt1LNUdzVanmLgZYbe3LWL0fjoA7TDK8wyUVFRs=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by MN2PR10MB4303.namprd10.prod.outlook.com (2603:10b6:208:1d8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Fri, 8 Nov
 2024 13:14:08 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Fri, 8 Nov 2024
 13:14:08 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: eugene.loh@oracle.com
Subject: [PATCH v8 5/6] usdt: new tests for USDT arg sanity with overlapping pid probes
Date: Fri,  8 Nov 2024 13:13:58 +0000
Message-ID: <20241108131358.299214-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <87r07l7tsx.fsf@esperi.org.uk>
References: <87r07l7tsx.fsf@esperi.org.uk>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0272.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::12) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|MN2PR10MB4303:EE_
X-MS-Office365-Filtering-Correlation-Id: 18df5958-4347-402c-ef24-08dcfff73a55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dA0+8jnGaeUPDYh939gLKBgYzJ2OaR5npSTFOgf2FFIJ42iOjrTTnFiKM/aL?=
 =?us-ascii?Q?aRQq4CYgs4WHYL4e2CTONrD8IF9dN+IGq95OYRyB5NdSBfcZBRcoVVjdWQIR?=
 =?us-ascii?Q?QBAkWoUGbelLvUHU6HyU93luqW6R1buKotACQiX3nFvRUIfuai53WjWEim0n?=
 =?us-ascii?Q?D8VsuI4EMSkRRfMQ/QABixxJFWWaGbmj+RmOJStUexcJD4EbTyV/2DWP464G?=
 =?us-ascii?Q?M6yhygvDDhazMWuqj4A2vODtal++Z+ztLrAy+geRw3kcTTBDv5es1xS9/doH?=
 =?us-ascii?Q?XWDFePVV/XpWd6TpMEeVbvFsJqO0gnE6kt/5FeMD1VD6WfpIAwGZLJtp8koJ?=
 =?us-ascii?Q?Hv3C0zFMrQQfovE+LLQgHXy/006KizP41aKzeDwIrV269F/jioa+9DzcQ7S8?=
 =?us-ascii?Q?JlsgYVqIiQ0p4C64EajjZEtUqEiuwCKsHAdrwsjBiSTiDI5ONtmd1a6lkln9?=
 =?us-ascii?Q?vGcqvPY8uwHQEtEsqVLTMESbnewjTBbUwKtf/4IynTYv23F7vy8xr23CDxK9?=
 =?us-ascii?Q?fbBFSjT3APiv7hnK2QZEbIUGgZfAiSh18LFi4Y5QRzd2FEp3y4en3KikC//c?=
 =?us-ascii?Q?gs4WuBNv6sh4i9P+C9eCyAJzxyt6Oz0qkkYn0fAGF5EQz++wMKMkCGv8J74r?=
 =?us-ascii?Q?Jidna3dU+HrJRZktb0Xs19uceyTfnYcDypBS8fZXD0Ar+OV8YaYho71DSszP?=
 =?us-ascii?Q?RqPJIuRRx7GVGt5rmMFpGfJ6i5cTEI2AK0qBORGT4UMubiF2CUYJK4Q5cgAN?=
 =?us-ascii?Q?fnnaDoD67OROaKQ5/USPjR/E8dHchAMWDfzYEpqCUmDS0DLgemlQ6rjnwAbj?=
 =?us-ascii?Q?pjHeNtARlqI7Kh7Kd0iZIGeDNSMf1/FgdGWO8piPgEzTQOxpSERqYfsMCt4B?=
 =?us-ascii?Q?hkx9EY+6R0NAx3zPEi2pAqAFqyuQNYoaL4iJLK1Op7W6dJU/1T3NkkPA/lP7?=
 =?us-ascii?Q?Ms3yz+gY9JTK0tyNHS7akEcctvTLvf7OlU3FMcP7WKp1bdeW+AvnK1ZqtdXJ?=
 =?us-ascii?Q?gSEesg6/0R9BdY6HdNifiqe6Th8W39X6vSQz68VqNeyeusTiZ8w8rErQKe7m?=
 =?us-ascii?Q?rXg4fVn8+DKIV8xRC+JHkClN+zt6XLNFMDuyi7yiLFLLpb83jr3xtgR/oK5/?=
 =?us-ascii?Q?+S11pVk9Ap7I1ENKJKYYheL5UDe9OltbmZRaSyrS+EWCRMxr26NKrUAKC8wq?=
 =?us-ascii?Q?xCLyfLzz44yO+0DLpU5aSUdahilnEwOvLYRL/hENIZf+2HzoNgHwTUPXcMVU?=
 =?us-ascii?Q?I/Fk2qDfQDhzRPlc+0YxzeNqdYTReqIVYKW5A7iD/hSxBq+vV3GNaakE70V3?=
 =?us-ascii?Q?B6ifmi+v7TjLlriC7QX8LHtq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kjm5Agu6KEru32UQHdS5EBRTwecpZXuEEGyVt7MUHUtXLSLcDipeY6skZr6w?=
 =?us-ascii?Q?EfzQtsPP93WtCKT8bp6lHzPaLqPyrwLUcGYcDKgGDfm3bwbbqm2Qv9q5Gs64?=
 =?us-ascii?Q?WaPE8Cl1uGFv8MCyPcfXqviTGJkxw3u+0Y+oS0lZwHcRd0lwKpS+i+RdFXxd?=
 =?us-ascii?Q?UjvP/NzwbMAjBr3rltMgUBuLzUorDzLBhL3Iy04q62bE7GNZPaMu1Zr5A4y8?=
 =?us-ascii?Q?0MYCoiei2cJUJpTCmrUsUVLyGJ2isoqgTfGLgXToZAj764tiPNSUd1vO/H2f?=
 =?us-ascii?Q?qXDvYNzmHBy7IlRf7GJS7kSGBky/3mYvZCxg9Nu+7z1qkgA458JDBCjair7N?=
 =?us-ascii?Q?/dFLw9k31dsdItKcSesv3kWU/dx6YKSJGQ7pr5sW2eysybxKgOsEReOXhFK7?=
 =?us-ascii?Q?9yW2yfWOdj1wd9tDV4A2+J6eFmhy+pj2iuvoN5REAV7EJ05avreVlupxWCTl?=
 =?us-ascii?Q?UPxkgeonCsVZwxNdLRxp43dn9IQ5d0zQeikQMqdna4Vx5zb/ZP8h7t630XpN?=
 =?us-ascii?Q?wlHLQ4rKW/G7AJeKmqKitGaGiqVg+9wUEYLa1W1D5Mk5ecao8zSBdl3tMFg9?=
 =?us-ascii?Q?bJ2WEZ5xK1Rz0dr6UgnpWiK+cV1L+jPX+OoZsbp1ZvQM+EThQX+kvs3Cr4Fy?=
 =?us-ascii?Q?iHmh5d7M7TbS5cW2DGUvFtCHASvXz25vuy1py3/86a/DzS2r8h/BcM22MxiS?=
 =?us-ascii?Q?rH/CebJ+/FOY12Y15HwT/v0KkEO742WW9kQfHxgQ5wH5O80i17LFmwVlh1JN?=
 =?us-ascii?Q?91HliTFjsr/8snCn3FBqnjVsJsQmh6O0Pgx2IZqE9guOlrzCS5wkWc2Cz3ce?=
 =?us-ascii?Q?B0MSTnAR2qtscbTobeIrVLoyVL8sCrk12VF9zNZCctVU9Mkg/VQFks7I59Xi?=
 =?us-ascii?Q?A/ikLu372T2dGL7XczTDRkGeErnIyFuqXYmMoQi8QTHBWjmuFzjgK8rAaKp9?=
 =?us-ascii?Q?RVCkaBOUsfjlhADVMrdEPHJDftE6T2tApwm0HzZcFe+3aw4RcNEhIwPK668a?=
 =?us-ascii?Q?uOBqXjXi0/iwELFl6XC00ujv8kFrcqZRykmojkL42g/0/ApH43XPc2Ns7h8j?=
 =?us-ascii?Q?8TzrydAALl/cfj7b7L98KsFsV3dqcULw+yZSEGEDSRYwW0svixjJVppLZ2Iq?=
 =?us-ascii?Q?zpgNO8/3GuMsZisoIZVEtDTVMaRDWFjkgYtCZlKhkZscHpF96y8PuOerlE9T?=
 =?us-ascii?Q?sInQf8xbQFmvbuibvi+0aDYdVYlsH5RKWLrQW8mgyB4JJ3KaJDE9KGqwiXZc?=
 =?us-ascii?Q?Dftit737XxTLiNiwgfjArn4rJwbrOx1UzcRPihcQYJnnGVV/7rBvOy4VHGf4?=
 =?us-ascii?Q?Zp55GTxHLMm51sWDXt+K+PNxwKmB4Ziztu5bD89gv5I0FFveVbhL0P+Doq9B?=
 =?us-ascii?Q?eYkQ9N46CP+d6Rib70UBJk5DCd8hn5j/ROo9LtNG6qgFQbn+EBGvthNjUe5x?=
 =?us-ascii?Q?FSzvJJdMHUkpHZ+sGaibI1sewh7MwxcvvV99J21MUsqosaLugrHkY+ZoKZzU?=
 =?us-ascii?Q?WTDEqjr7X/2wfE5wBGYm+xeRLvOhAvyCBPGbQPL6G8VGHClt/Aczc64u6/Io?=
 =?us-ascii?Q?XYGuyoX3ni93DTITVC4YRdrMUgUhnx8BQJU35ayU1lnYNWIhb5FTKtkowTmS?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cqT6j0MYcpBWXhyhUac0YD+Cnsoy6gQaDJAQ3xfz/Gn5A9AYxA18NaQk4i2KNze2vwAwbPHEnXQ6kJ5qNhIfelyQ4rYp/FKDgh4bX0MGCEMqGKneXGy1GYnH+Ml83WaihcezYbHPzkCtn8SagS0epJcmwj89KyrIUktR37moLCPl4DNRopoulHcoFUfU6PDkwP7Ae02pknEf2aYY31+51nZzjIEntFNvp5WJiB6ZjfoejdGkxqISkcLmZvwILmc/lEUVokdF3rcZj1U4BP27qOsDurF8Qfn07NWQJ4TOg21YPqiLqNLH6uwYadlhaXIuXFH/UohEOOYtoeDScBP/rTi3Eg5VUeY1lB3diESnkeJe9UfwwsFU8SJXtdhXmRis3v778THRaV/F41XubUu2F94U1X9M0mCpN0o+84rkVuP+sUpxHIOTV7sHdRMaTpYoBdZBqeBNOF5Gtv/fSFBgs8rkpOCzuMZizjv+8XNqB38qt+HeMG8m8tmIKqUwXRYYNSnQzGUn6UFJL+awHB2yaaCkoDxNvFVocoY4ThN1+uAsXvLKRKk36zRRTsIQrOwL3FBkUtjcCb4G3124L8F2Kkx3KJY8YuqTyOG96McqyMc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18df5958-4347-402c-ef24-08dcfff73a55
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 13:14:08.2303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IxSuNc8gtgjsLijNRWXVdHUFKMXrycapY4UoSuYKLzqDLNdvkQkHyx1BvdrOyaNXZxp8cP3cDgWGFcUuPmkU6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4303
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-08_09,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411080110
X-Proofpoint-GUID: FAz1V9wnsU3aVxRklEVWOfTySrc3pwJm
X-Proofpoint-ORIG-GUID: FAz1V9wnsU3aVxRklEVWOfTySrc3pwJm

This generalizes the existing tst.pidprobes.sh to check the args
reported by the probe both with and without arg mapping in place.

Everything seems to work.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 .../usdt/{tst.pidprobes.sh => pidprobes.sh}   |  50 +++-
 test/unittest/usdt/tst.pidargmap.sh           |  11 +
 test/unittest/usdt/tst.pidargs.sh             |  11 +
 test/unittest/usdt/tst.pidprobes.sh           | 275 +-----------------
 4 files changed, 65 insertions(+), 282 deletions(-)
 copy test/unittest/usdt/{tst.pidprobes.sh => pidprobes.sh} (84%)
 create mode 100755 test/unittest/usdt/tst.pidargmap.sh
 create mode 100755 test/unittest/usdt/tst.pidargs.sh

diff --git a/test/unittest/usdt/tst.pidprobes.sh b/test/unittest/usdt/pidprobes.sh
similarity index 84%
copy from test/unittest/usdt/tst.pidprobes.sh
copy to test/unittest/usdt/pidprobes.sh
index 25fee85537fc..0840805b70fd 100755
--- a/test/unittest/usdt/tst.pidprobes.sh
+++ b/test/unittest/usdt/pidprobes.sh
@@ -5,9 +5,12 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# This test verifies that USDT and pid probes can share underlying probes.
+# This test verifies various properties of USDT and pid probes sharing
+# underlying probes.
 
 dtrace=$1
+usdt=$2
+mapping=$3
 
 # Set up test directory.
 
@@ -17,13 +20,21 @@ cd $DIRNAME
 
 # Create test source files.
 
-cat > prov.d <<EOF
+if [[ -z $mapping ]]; then
+    cat > prov.d <<EOF
 provider pyramid {
 	probe entry(int, char, int, int);
 };
 EOF
+else
+    cat > prov.d <<EOF
+provider pyramid {
+	probe entry(int a, char b, int c, int d) : (int c, int d, int a, char b);
+};
+EOF
+fi
 
-cat > main.c <<EOF
+cat > main.c <<'EOF'
 #include <stdio.h>
 #include "prov.h"
 
@@ -48,7 +59,7 @@ EOF
 
 # Build the test program.
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >&2
 	exit 1
@@ -61,12 +72,12 @@ fi
 if [[ `uname -m` = "aarch64" ]]; then
 	objdump -d main.o > disasm_foo.txt.before
 fi
-$dtrace -G -64 -s prov.d main.o
+$dtrace $dt_flags -G -64 -s prov.d main.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >&2
 	exit 1
 fi
-cc $test_cppflags -o main main.o prov.o
+cc $test_ldflags -o main main.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >&2
 	exit 1
@@ -88,11 +99,25 @@ fi
 
 # Run dtrace.
 
-$dtrace $dt_flags -q -c ./main -o dtrace.out -n '
+cat >> pidprobes.d <<'EOF'
 p*d$target::foo:
 {
 	printf("%d %s:%s:%s:%s %x\n", pid, probeprov, probemod, probefunc, probename, uregs[R_PC]);
-}' > main.out2
+}
+EOF
+
+if [[ -n $usdt ]]; then
+	echo 'pyramid$target::foo: {' >> pidprobes.d
+
+	if [[ -n $mapping ]]; then
+		echo 'printf("%d %s:%s:%s:%s %i %i %i %c\n", pid, probeprov, probemod, probefunc, probename, args[0], args[1], args[2], args[3]);' >> pidprobes.d
+	else
+		echo 'printf("%d %s:%s:%s:%s %i %c %i %i\n", pid, probeprov, probemod, probefunc, probename, args[0], args[1], args[2], args[3]);' >> pidprobes.d
+	fi
+	echo '}' >> pidprobes.d
+fi
+
+$dtrace $dt_flags -q -c ./main -o dtrace.out -s pidprobes.d > main.out2
 if [ $? -ne 0 ]; then
 	echo "failed to run dtrace" >&2
 	cat main.out2
@@ -262,6 +287,15 @@ for pc in $pcs; do
 done
 echo $usdt_pcs | awk '{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $1);}' >> dtrace.out.expected
 echo $usdt_pcs | awk '{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $2);}' >> dtrace.out.expected
+if [[ -n $usdt ]]; then
+	if [[ -z $mapping ]]; then
+		echo "$pid pyramid$pid:main:foo:entry 2 a 16 128" >> dtrace.out.expected
+		echo "$pid pyramid$pid:main:foo:entry 4 b 32 256" >> dtrace.out.expected
+	else
+		echo "$pid pyramid$pid:main:foo:entry 16 128 2 a" >> dtrace.out.expected
+		echo "$pid pyramid$pid:main:foo:entry 32 256 4 b" >> dtrace.out.expected
+	fi
+fi
 
 # Sort and check.
 
diff --git a/test/unittest/usdt/tst.pidargmap.sh b/test/unittest/usdt/tst.pidargmap.sh
new file mode 100755
index 000000000000..0c83f8703539
--- /dev/null
+++ b/test/unittest/usdt/tst.pidargmap.sh
@@ -0,0 +1,11 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# This test verifies that USDT and pid probes that share underlying probes
+# do not apply arg mappings (incorrectly) to the pid probes.
+
+exec $(dirname $_test)/pidprobes.sh $1 t t
diff --git a/test/unittest/usdt/tst.pidargs.sh b/test/unittest/usdt/tst.pidargs.sh
new file mode 100755
index 000000000000..53cba7c39624
--- /dev/null
+++ b/test/unittest/usdt/tst.pidargs.sh
@@ -0,0 +1,11 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# This test verifies that USDT and pid probes that share underlying probes
+# get the arguments correct for the USDT probes.
+
+exec $(dirname $_test)/pidprobes.sh $1 t ""
diff --git a/test/unittest/usdt/tst.pidprobes.sh b/test/unittest/usdt/tst.pidprobes.sh
index 25fee85537fc..e63d9f5dc096 100755
--- a/test/unittest/usdt/tst.pidprobes.sh
+++ b/test/unittest/usdt/tst.pidprobes.sh
@@ -7,277 +7,4 @@
 #
 # This test verifies that USDT and pid probes can share underlying probes.
 
-dtrace=$1
-
-# Set up test directory.
-
-DIRNAME=$tmpdir/pidprobes.$$.$RANDOM
-mkdir -p $DIRNAME
-cd $DIRNAME
-
-# Create test source files.
-
-cat > prov.d <<EOF
-provider pyramid {
-	probe entry(int, char, int, int);
-};
-EOF
-
-cat > main.c <<EOF
-#include <stdio.h>
-#include "prov.h"
-
-void foo() {
-	int n = 0;
-
-	PYRAMID_ENTRY(2, 'a', 16, 128);
-	if (PYRAMID_ENTRY_ENABLED())
-		n += 2;
-	PYRAMID_ENTRY(4, 'b', 32, 256);
-	if (PYRAMID_ENTRY_ENABLED())
-		n += 8;
-	printf("my result: %d\n", n);
-}
-
-int
-main(int argc, char **argv)
-{
-	foo();
-}
-EOF
-
-# Build the test program.
-
-$dtrace -h -s prov.d
-if [ $? -ne 0 ]; then
-	echo "failed to generate header file" >&2
-	exit 1
-fi
-cc $test_cppflags -c main.c
-if [ $? -ne 0 ]; then
-	echo "failed to compile test" >&2
-	exit 1
-fi
-if [[ `uname -m` = "aarch64" ]]; then
-	objdump -d main.o > disasm_foo.txt.before
-fi
-$dtrace -G -64 -s prov.d main.o
-if [ $? -ne 0 ]; then
-	echo "failed to create DOF" >&2
-	exit 1
-fi
-cc $test_cppflags -o main main.o prov.o
-if [ $? -ne 0 ]; then
-	echo "failed to link final executable" >&2
-	exit 1
-fi
-
-# Check that the program output is 0 when the USDT probe is not enabled.
-# That is, the PYRAMID_ENTRY_ENABLED() is-enabled checks should not pass.
-
-./main > main.out
-echo "my result: 0" > main.out.expected
-if ! diff -q main.out main.out.expected > /dev/null; then
-	echo '"my result"' looks wrong when not using DTrace
-	echo === got ===
-	cat main.out
-	echo === expected ===
-	cat main.out.expected
-	exit 1
-fi
-
-# Run dtrace.
-
-$dtrace $dt_flags -q -c ./main -o dtrace.out -n '
-p*d$target::foo:
-{
-	printf("%d %s:%s:%s:%s %x\n", pid, probeprov, probemod, probefunc, probename, uregs[R_PC]);
-}' > main.out2
-if [ $? -ne 0 ]; then
-	echo "failed to run dtrace" >&2
-	cat main.out2
-	cat dtrace.out
-	exit 1
-fi
-
-# Check that the program output is 10 when the USDT probe is enabled.
-# That is, the PYRAMID_ENTRY_ENABLED() is-enabled checks should pass.
-
-echo "my result: 10" > main.out2.expected
-
-if ! diff -q main.out2 main.out2.expected > /dev/null; then
-	echo '"my result"' looks wrong when using DTrace
-	echo === got ===
-	cat main.out2
-	echo === expected ===
-	cat main.out2.expected
-	exit 1
-fi
-
-# Get the reported pid.
-
-if [ `awk 'NF != 0 { print $1 }' dtrace.out | uniq | wc -l` -ne 1 ]; then
-	echo no unique pid
-	cat dtrace.out
-	exit 1
-fi
-pid=`awk 'NF != 0 { print $1 }' dtrace.out | uniq`
-
-# Disassemble foo().
-
-objdump -d main | awk '
-BEGIN { use = 0 }             # start by not printing lines
-use == 1 && NF == 0 { exit }  # if printing lines but hit a blank, then exit
-use == 1 { print }            # print lines
-/<foo>:/ { use = 1 }          # turn on printing when we hit "<foo>:" (without printing this line itself)
-' > disasm_foo.txt
-
-# From the disassembly, get the PCs for foo()'s instructions.
-
-pcs=`awk '{print strtonum("0x"$1)}' disasm_foo.txt`
-pc0=`echo $pcs | awk '{print $1}'`
-
-# From the disassembly, get the PCs for USDT probes.
-# Check libdtrace/dt_link.c's arch-dependent dt_modtext() to see
-# what sequence of instructions signal a USDT probe.
-
-if [[ `uname -m` = "x86_64" ]]; then
-
-	# It is the first of five nop instructions in a row.
-	# So track pc[-6], pc[-5], pc[-4], pc[-3], pc[-2], pc[-1], pc[0]
-	# as well as whether they are nop.
-
-	usdt_pcs_all=`awk '
-	BEGIN {
-		pc6 = -1; is_nop6 = 0;
-		pc5 = -1; is_nop5 = 0;
-		pc4 = -1; is_nop4 = 0;
-		pc3 = -1; is_nop3 = 0;
-		pc2 = -1; is_nop2 = 0;
-		pc1 = -1; is_nop1 = 0;
-	}
-	{
-		# pc0 is current instruction
-		pc0 = strtonum("0x"$1);
-
-		# decide whether it is a nop
-		is_nop0 = 0;
-		if (NF == 3 &&
-		    $2 == "90" &&
-		    $3 == "nop")
-			is_nop0 = 1;
-
-		# report if pc[-5] is a USDT instruction
-		if (is_nop6 == 0 &&
-		    is_nop5 == 1 &&
-		    is_nop4 == 1 &&
-		    is_nop3 == 1 &&
-		    is_nop2 == 1 &&
-		    is_nop1 == 1 &&
-		    is_nop0 == 0)
-			print pc5;
-
-		# prepare advance to next instruction
-		pc6 = pc5;  is_nop6 = is_nop5;
-		pc5 = pc4;  is_nop5 = is_nop4;
-		pc4 = pc3;  is_nop4 = is_nop3;
-		pc3 = pc2;  is_nop3 = is_nop2;
-		pc2 = pc1;  is_nop2 = is_nop1;
-		pc1 = pc0;  is_nop1 = is_nop0;
-	}' disasm_foo.txt`
-
-	# We expect 4 USDT probes (2 USDT and 2 is-enabled).
-	if [ `echo $usdt_pcs_all | awk '{print NF}'` -ne 4 ]; then
-		echo ERROR: expected 4 USDT probes but got $usdt_pcs_all
-		cat disasm_foo.txt
-		exit 1
-	fi
-
-	# Separate them into regular and is-enabled PCs.
-	# We assume they alternate.
-	usdt_pcs=`echo $usdt_pcs_all | awk '{ print $1, $3 }'`
-	usdt_pcs_isenabled=`echo $usdt_pcs_all | awk '{ print $2, $4 }'`
-
-elif [[ `uname -m` = "aarch64" ]]; then
-
-	# The initial compilation of foo() makes it obvious where the
-	# USDT probes are.  We just have to add the function offset in.
-	usdt_pcs=`awk '/<__dtrace_pyramid___entry>/ { print strtonum("0x"$1) + '$pc0' }' disasm_foo.txt.before`
-	usdt_pcs_isenabled=`awk '/<__dtraceenabled_pyramid___entry>/ { print strtonum("0x"$1) + '$pc0' }' disasm_foo.txt.before`
-
-	# We expect 4 USDT probes (2 USDT and 2 is-enabled).
-	if [ `echo $usdt_pcs | awk '{print NF}'` -ne 2 -o \
-	     `echo $usdt_pcs_isenabled | awk '{print NF}'` -ne 2 ]; then
-		echo ERROR: expected 4 USDT probes but got $usdt_pcs and $usdt_pcs_isenabled
-		cat disasm_foo.txt.before
-		exit 1
-	fi
-
-else
-	echo ERROR unrecognized machine hardware name
-	exit 1
-fi
-
-# We expect all of the USDT probe PCs to be among the PCs in objdump output.
-
-for pc in $usdt_pcs $usdt_pcs_isenabled; do
-	if echo $pcs | grep -q -vw $pc ; then
-		echo ERROR: cannot find USDT PC $pc in $pcs
-		exit 1
-	fi
-done
-
-# Get the PC for the pid return probe.  (Just keep it in hex.)
-
-pc_return=`awk '/'$pid' pid'$pid':main:foo:return/ { print $NF }' dtrace.out`
-
-objdump -d main | awk '
-/^[0-9a-f]* <.*>:$/ { myfunc = $NF }         # enter a new function
-/^ *'$pc_return'/ { print myfunc; exit(0) }  # report the function $pc_return is in
-' > return_func.out
-
-echo "<main>:" > return_func.out.expected    # since we use uretprobe for pid return probes, the PC will be in the caller
-
-if ! diff -q return_func.out return_func.out.expected > /dev/null; then
-	echo ERROR: return PC looks to be in the wrong function
-	echo === got ===
-	cat return_func.out
-	echo === expected ===
-	cat return_func.out.expected
-	exit 1
-fi
-
-# Build up a list of expected dtrace output:
-# - a blank line
-# - pid entry
-# - pid return
-# - pid offset
-# - two USDT probes (ignore is-enabled probes)
-
-echo > dtrace.out.expected
-printf "$pid pid$pid:main:foo:entry %x\n" $pc0 >> dtrace.out.expected
-echo   "$pid pid$pid:main:foo:return $pc_return" >> dtrace.out.expected
-for pc in $pcs; do
-	printf "$pid pid$pid:main:foo:%x %x\n" $(($pc - $pc0)) $pc >> dtrace.out.expected
-done
-echo $usdt_pcs | awk '{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $1);}' >> dtrace.out.expected
-echo $usdt_pcs | awk '{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $2);}' >> dtrace.out.expected
-
-# Sort and check.
-
-sort dtrace.out          > dtrace.out.sorted
-sort dtrace.out.expected > dtrace.out.expected.sorted
-
-if ! diff -q dtrace.out.sorted dtrace.out.expected.sorted ; then
-	echo ERROR: dtrace output looks wrong
-	echo === got ===
-	cat dtrace.out.sorted
-	echo === expected ===
-	cat dtrace.out.expected.sorted
-	echo === diff ===
-	diff dtrace.out.sorted dtrace.out.expected.sorted
-	exit 1
-fi
-
-echo success
-exit 0
+exec $(dirname $_test)/pidprobes.sh $1 "" ""
-- 
2.46.0.278.g36e3a12567

