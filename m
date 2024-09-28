Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98620111A8
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727489740; cv=fail; b=Jb6hOLuZwUa+nsHiPE0o0Sj2KBSJyblfxMjJDBnm5jCRXVFkl4Klgx2Wtyqfuvk0iZz4c0neNFkyNtvOx7bQ6U6t9iX2g+V0CQGhQqMFh7YtFueRg7YzTTIDxfRWu4djGGRKdNI93B/huf4fZVxVvE3tG1ft+AwOWiJODipwlp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727489740; c=relaxed/simple;
	bh=9AScKEzbnmwwtzz8gJz8DFKT/fjm4ZT18eC3K3B95cs=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=gCyU4aFzz8LaYqAlltpnz1PpkOmELHV9VcSTyxsVrW99wHv3EsNpEhiAGs0ARQPptD3Q/lCALcVIrjCQB+T0MORQ2Plz7I/N1h8PG3KPX0cMPPT9VtCqNplOg2MuOG0fv/1ebuInzLxocyr7Mpg7wtaEASmCqCzfYKc+AFYKxEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mRoZp0gI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=e1GBROpq; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mRoZp0gI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="e1GBROpq"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48S262mI021199
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=TSHExVAGHpk0zIZGVVo79V8IG9mICwLfSGS3J4Rr5H4=; b=
	mRoZp0gIJ5vHvs6bxbY8qKJjs1iw8IfGUZiGz+9e5Ya3xctmfcy1BaKGBA+cj8g2
	o30undcN58MVTwnlRZjT/OHkq4JWBe19NM9cyaPhHTnsiOlS7OxFb4nwdkvaOx34
	1/BTHVoUwrpyWuUCNGQbXBR9JNELYWNGPZEo3zfBPuI5YqPWPOIOf/LuxiDDfWF+
	sZwcr5R+3jYy/hZmOgpW2luDCWBf1sCgCX8n9yK/IidwCSixqdBPL5PJ1KGavvQ9
	yTX2ZZIpzb5t2firHEUKXNipB4QpJBs4oali05Wnqz+LabaW7uQ1P7htsuDTDjt8
	q2EDnw8/6FjinIbkov8GGQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41x8qb0071-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:15:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48S1XFD9040580
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:15:30 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41x8848m1f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:15:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JBf5qOnqxLciP3nJSrN2CFycetwhMe3hB2lBwmBL0cgTp0j1WsxAvJVjfoWQ2+WQdVZFptvYtPxxyMrihZjKpMJ/Wngfn1qJtKLSMP6M1yy9FH4kKg19coKLJYD6i6VQ2Bb3dLeABWsrHi/3lpClmBu8MZ6IBc2qkZ+CFsvmRO+eDfbcGMaMBmbkh7YDCDwKASxUs/oPKUuCkElvS3QNbcLeqL0pR5KqsbAvWH1RIOhYXevbsW1z5n2zoVh5qnMsoC9Su4Lhfq0xGmT+CY70NJHr+zw3xPvrcDFx7jEWqoOXAYWVpJuTbTiL1a0OqyoBAyJ8pX0laFl2EG7npJf5jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSHExVAGHpk0zIZGVVo79V8IG9mICwLfSGS3J4Rr5H4=;
 b=b9Xh//QE8o+yNpC3/9INFcspbW4SitmWdT7XoaTSkw22nUYreIqkyxxAhXMJqeUEKxq0iOmiFXp15PWVKCvaF7wWEY6bMP7kq1+unckz7D2dsLvRcEQ6tRGKEIy2FiXEWPGG7boKFDUykYza29g6BgwitoUXDtkPW/gyLAb+7rW+ydU2fFiISw0ixAezik1Yq74jzocrTFXkRC+aiM+Pfgvn4iSWnWnPt+wlOjc1NiaCP93ZJjAMqWX7jEPTwuVMcQd6wC9lrqqURsdH3DbCqxPqlvMM8SNq7ptXmQFU/4AB239yI/5F0yNSfIvH/YTH2D3LQg9KzvEMNNUrUX5Ndg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSHExVAGHpk0zIZGVVo79V8IG9mICwLfSGS3J4Rr5H4=;
 b=e1GBROpqla7ZxccscPWU0yKZHQ3MBbgEg9Xvw1pIUjYru79e+BrUyurWe5vn4/t739BIdifeKpAaXXM7fg4kKt5x6rtCsKyG2SFxxGbeDBB/68Lln/3gQxhx+/6/Ye5ZQQBu8oHfgu5SYqMFVcWvOazVnSq4L6BPkG7qNmi/Oc8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA6PR10MB8206.namprd10.prod.outlook.com (2603:10b6:806:441::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.8; Sat, 28 Sep
 2024 02:15:27 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8026.009; Sat, 28 Sep 2024
 02:15:27 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 02/19] Add a hook for a provider-specific "update" function
Date: Fri, 27 Sep 2024 22:15:24 -0400
Message-Id: <20240928021525.8987-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0034.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::47) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA6PR10MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ddf5132-0b8f-4314-f12c-08dcdf636b4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CJ3IrtKCuwueS6IKFLXGBAV67THb1K3NffoJ4KPBl0aKNUdkIZkBsy7NdVjZ?=
 =?us-ascii?Q?mokmnIA0SvRzlsRBBbonEMY9XVrXK0F6Izy/wzU9XkEFQIVJT1fs4ie61cmu?=
 =?us-ascii?Q?dekD/ef3te2RKh5ixWi4YmNsOzUFaiCp+TwYDvJ6Y0zM4117p1Faej4FJHe1?=
 =?us-ascii?Q?6Vb6mw+YfHJV+He1+CFHJoCEKwJgrG6GOx7NDyt+WhdVuiYJSLVE/o/wIvxb?=
 =?us-ascii?Q?vnzLhsuQhg5iGs3g6lcwVvLMnr6Xo2zIMrhaJTEQ2F8VBt+mB8ii7kl9/aPk?=
 =?us-ascii?Q?IAZ1qKQRPwRBvStZklcFj/6WpqYLx2ZF9B65xbXO8o0iXzHBj7FOELwUM0dD?=
 =?us-ascii?Q?5e9pMTvVm3h1VVk+lpzydhgnpT2PaUV5LjOZX7LcEEjlZP18IpDs8YSl+oPH?=
 =?us-ascii?Q?cnjhCZt4T5HHzslttyEz5NdwvYRZ3TiSLztgFWtM4Bdx2042Oy+U87tm2A3E?=
 =?us-ascii?Q?oPs567TEEuhrdjkJIkG+EVxnHB+G7efjnrPZ3YSNIcKk2hRJBTQ3rcqhlsAd?=
 =?us-ascii?Q?xsRl5kS+i5FsNd9o+gHOivrZSUmvmLMDCFLiw5I246wJVc6U0eEptWM5Q3BE?=
 =?us-ascii?Q?hqxaBlrxe6bkWWuXHvxTpvH9citIHCaADzWSrM+uWndVA3aaYT6CekU2EwOE?=
 =?us-ascii?Q?f+Q/pBdLcQfxZHAAJCcxx9NYkjssrG1zQICfzg7XoJ4TcdVbLYgKk38sr7at?=
 =?us-ascii?Q?zCNt4bRXizCVBprzedMnrFKcoq4gZdy74rCQriEycpqFdlsndzavs4zkixVL?=
 =?us-ascii?Q?3QW+WhPrRFn0eoH6EX00iSbqxhgqEuZG4q3zbnS2ZdSNDHoqY30eb7+ElVS/?=
 =?us-ascii?Q?ViXS2hlk/H/aqQR3d/1/fb6KKYLG1RBnuQxxPQLMpmPPHN2gzcZ5eCtIlsSN?=
 =?us-ascii?Q?a/konceu9FdZ30k1GM31O41Y14SoB98Be2IbwqfkKrGWwMa/no4GIKfOju8S?=
 =?us-ascii?Q?fh/XQ1M/U4NPxj6I5mPyBeWA0tSpMRfhb5ZhqWwqoevu0nQ5UH9xBeHzc6zP?=
 =?us-ascii?Q?eoxJvEYm0U8wWkeahGluuzdlFlshcfAHDfSJNJyBmZujVpvbITcacTUd3AHs?=
 =?us-ascii?Q?oFnl/ZEUm7M+b8R0TxqMW9TRN3v5is0LGqrsBgrDTOih1KO1wWXXiilcDeOm?=
 =?us-ascii?Q?HS244zIIaHZcL7UKgmqB5XXurpX1J4fiYujHJzbve2ibYaTkEXdcZa17Yq0y?=
 =?us-ascii?Q?k/+IduN19/Yi2ZtqGJ5GK6pUmLwc7lFEMavwbcuJU5CCDyroTkPT4+Aus5GZ?=
 =?us-ascii?Q?CpYYtPVraWIUdJHrIkwYRKSJTIPevB0W2MQJI6ZXnA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5brzv8u9l8mUU3P5j0KuizosAQIvulCv6vsPlAI4vbvnX9jNgbPsHxtOlT0k?=
 =?us-ascii?Q?Uqtwi2OhJxYMGj2IAME4ssWTqTRL+WyIFT7Oo+Pf+bYSfFVdXJ7u6Z4C6Aal?=
 =?us-ascii?Q?hd+6w5dd0t7z31qT4etXl59XazzzgViljcU1Wm4RKEMtLrYXKrRkyciBbZbS?=
 =?us-ascii?Q?tvamwTuNWKO1Qh6b6vfHldVdGnoGmR7GyciRUT8+reupUrSvatBJzox+Syg7?=
 =?us-ascii?Q?BHEI82Fq6QYckinQj2iN3Vcts0SKZGjVwTgfsKsqF2Kvsmh5Q/xeTtaBiIrQ?=
 =?us-ascii?Q?Dhl2rBvQidFFVYaENEjHstkhuGqQYymjU1vGmp9WFV4egI+QivAmt57BfOtI?=
 =?us-ascii?Q?6SWnY88NDqGbANFb8CqVdhOySNPZ1AuhuBdbSfeXJNGZrlv14+vtutyqpOVE?=
 =?us-ascii?Q?zC7uV5KYtz6gz2kofaNK5iKKld+KEixXopeog7nfcxQbjFKq5zf5yKRJwAu3?=
 =?us-ascii?Q?/Dby4ijhlCgDOcQoO56fJe8XjRP1UVBCtJARvPEdNrifkvnwjZrFRbwgMD5M?=
 =?us-ascii?Q?sRh2VcKG/wI8czJy8LvnI9FAKa6wJKz35nYWqnNyeKb41gM8TD+cwyL9Wxk1?=
 =?us-ascii?Q?ewS/T6S7gmSZ72pkDFTcR550I8XpHNopKV+7/uRlXUqTQXOITxlXcBokRQ8X?=
 =?us-ascii?Q?VoG+v9gbdGfMMNcAos/fXpk6hJZu8zCdJGwwPcKISiQPmcAj8hJPThBL7RXi?=
 =?us-ascii?Q?+IbgaPQiw1Iv4Dw6wYO36QpFxj0quL8Lteri+lQ6G/+W1rt3abXOBNBbsi8r?=
 =?us-ascii?Q?N7KnDUAceJ3kbX/mFkEunQA7JunIwvdYoigwHmmTuxdpIa2+ioR0BmrCsefc?=
 =?us-ascii?Q?v5DGnCR9b+wiOJpDWHg62qV+WAXltpn2nzhdUvrPjqmqBYp+3SHsirn19vVQ?=
 =?us-ascii?Q?pe6zUMaqQW3t73HBZO+KezH3GjXEM024xjtBRu6b45hHT2mAcHybAylreCUl?=
 =?us-ascii?Q?nAg9OAaBZrx2hRQ4F0mvuIL9RyPR9LmPvfHNI9kmq8tYERme/O6i1raPWalZ?=
 =?us-ascii?Q?Yj/QeM0SUiW38Oscqbd+tJ3HsjGR3dDMR9JmvHGCzQv27Eew6Hzr/6Whx7eI?=
 =?us-ascii?Q?VS9+YD4wt26SlHYL+KdWavrPfArpb8JWyW0Lrq6NFCMUJq8iRcCrWHez6r+r?=
 =?us-ascii?Q?Jn6xUIzu2mmM2ruXGTRzZrFGB9JRHuC0S15vrSAPIM2zDaKVEBJomJnOZlPk?=
 =?us-ascii?Q?EqiLGh7MQ0OfCWryKcROKAF+x/rOeiatzzShMBpDLSC9r1/lsUiinUILXVhA?=
 =?us-ascii?Q?Y8Bds6DpDWFXdGIevaHjWWrgx7/Tg0M1U9vdFRTbUDvIfrNUEj5ttBZzuOhr?=
 =?us-ascii?Q?wTggQUS4i3YNf69M+F2svnXrfb6uFvARiNS+kcrAAHkVB+gpwRO8UdpdKBsY?=
 =?us-ascii?Q?LEK1yc/VBvXxbeFuABD2tssGCspHpbIn/voMXtMlh2UYej34ckuI1FaKxuu2?=
 =?us-ascii?Q?l8bo31C6xiOk/S7fZeRCxCQYz7VTshaHasEmhmLJALovLML50orT8FREblg4?=
 =?us-ascii?Q?Q1PbPcuNdrju0+8LdM0Klekx1njePo4nRwH9bMlcAAf1Ukhdb4+sDnzAFrYF?=
 =?us-ascii?Q?BnpHjFTCmTAi4DHwucE9cvvh3/CBxCeod9FBV0Uk?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ST+nS9mrbWIHuLH3nkFJebfs/ojp/jWdjE2EYtv48pBlQ/H15jeMqMQiIVU0HuNqZQhwoCbHEz1cKPw9ot8gEWoIk4G46+qxMT8MJmztfY06rXPdX/WRH/sxeYCyIjRfxnwrIBlf2BKTqo9ZwC+iU1MTLT5Kg3rsX3jd97IQMpq3WjmF7EgtM/TuKkgzIxeOYa5VgWKNKxff8Sb9SEi92h6PuaEe5XvHSaP0ahuinbn2r7RjEbZO+FVYM8BGyRpHsvox/nRKtrWr7TMFU+BwU7iQD+YmOKG7uRBsrWCvCa6L9o0iyRd3rSLqt42cCpLnidrEYeflY/1XqmJFIRskQ+O727BNWlYxEASDYneYWXFWxxS0pyduPGm/NZAtrIv5ja5l48ravF/WSvImXMCTy4c2b4CBrBSCztcLL61Shf9jfFEJ2i3G8xBpryG5DMpjfzJ6gX3uwpMYJvxeOvALkGa0rK4WLk6QhlAxu3TaijgC/7zce7l5y1SKjuwFlGSGUBBdRUtfwZ8riQltuJnhTyPmN6V3eV0WNderAGP6Kzi54ehqu3zz+v5p6JGl7X4USf03Nwvg666lLQzVn2xleKl3twyNytcqm7bbQtJqOsU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ddf5132-0b8f-4314-f12c-08dcdf636b4a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2024 02:15:27.5901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z4CL23CrnfwNkJW687nzJd8aAl9bJgBTog9hscQaRpVyV+oFLS2vhA1qUmNvGRLwSBW2lA/X/KeUYR5JVF/Zlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8206
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-27_08,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409280015
X-Proofpoint-GUID: kooaiL0O9e7KAVoOPhL457EUlWS-cH-3
X-Proofpoint-ORIG-GUID: kooaiL0O9e7KAVoOPhL457EUlWS-cH-3

From: Eugene Loh <eugene.loh@oracle.com>

For up-coming USDT-probe support, we need to update a BPF map
-- at least when the dtrace session starts but possibly also later
to support systemwide USDT tracing for processes that may start up
later.

One way to do this is with a USDT-specific update function.

For now, let's add a hook for providers to have provider-specific
update functions.  User space can either call

    for (i = 0; i < ARRAY_SIZE(dt_providers); i++) {
        if (dt_providers[i]->update)
            dt_providers[i]->update(...);
    }

any time it likes.  Or it can call dt_usdt.update(...).

This is for WIP.  A different approach can be adopted later instead.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_provider.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
index 17b1844cb..92df0cd28 100644
--- a/libdtrace/dt_provider.h
+++ b/libdtrace/dt_provider.h
@@ -68,6 +68,8 @@ typedef struct dt_provimpl {
 			      void *datap);
 	void (*destroy)(dtrace_hdl_t *dtp,	/* free provider data */
 			      void *datap);
+	int (*update)(dtrace_hdl_t *dtp,	/* update provider-specific info */
+			      void *datap);
 } dt_provimpl_t;
 
 /* list dt_dtrace first */
-- 
2.43.5

