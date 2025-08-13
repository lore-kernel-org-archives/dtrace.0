Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC85F4FA
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 21:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755119948; cv=fail; b=URADxkWk4V259lYLDQ0VPeMSZUUijey7TuUmnY5VwKd+DjvogEuDLft3ctd2fUEbWUzS9VD0cy2xiGys/fA9ltpvfW3Q70DMcCA762hyDym5OclQHOFAbkDz9MR1LmLErJ9k7LRjt+E0h19GgcdjPnmhljfcKXB77iHFnqeT6vw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755119948; c=relaxed/simple;
	bh=ZRvrS3UI63VN2baGzUx6fPbJzg+bb1khLAzkMMIOam0=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=IG4IInTqBC2chj4L63C5R2fFEtXT4rRxVoshFIvKpgOsg6Qn52CqbuQc+L+QJ6wFo09MGnQQVFBQQ3EX/NVwkvo33AQq//7XF/JZBcc/cgMfr8kO+TAxKdUJdea+2IlGoj5y8Swq3d8yjtUZTiFF+sa+n02bC0s3WcwWdqmWbIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lBYWn2+C; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cRlZec8S; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lBYWn2+C";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cRlZec8S"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DIN13f007253
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 21:19:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=P9F1NYq8iASkUiT+KqHEEcCf7RccMSNw6pwv++cSoeI=; b=
	lBYWn2+CUj3ZO04hsF71NV7KMQefyUr+XOygjgaAqI3elMw94+6aR3gsjBu3UZfH
	pQ2PqWmQPj3veyqRxdv24x0QxCStYwWYM/38uzq3vd+/KnGZhqYI5cpT+AV6MfHC
	eBoeLSTW5gfw8kLcczmcVpmcc/ExaFa/nkALi2rEnhAc0O/hlu7NlzAX63cRi7Kd
	KTKiNdD13r7YFL5xRiDBAtXEoFRwpvRb2DlT4qZf9rJqeeK58prorBLdglX7BoP+
	YMo+6ZNulHUwaZ27qhOY4FBFfiob/A6hqiL/agbEoqoA0iY1wGTvlo8RlDKXaTLd
	GuF50hBwizquYpyzHcN8Fw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dvrg0dus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 21:19:05 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57DL1FpG030268
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 21:19:04 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsbx3hn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 21:19:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p12RvgGZf2usMi7tZ4y99kdL8IFe99FaYA27eqtCX+bbQLYMWuv+mixv8kk4rCKgsR3AAcCdFoyoh7l3y7UQCZAQ7TuQBtOVTXWp37xYDwyATg7m5elWjYM520KoILpS+yearQ9hBCutYbLDBrtrkZ90QfBRD4K7XM/CTVTfCT2iSfbejhZd5MRJsa2TiPxk/o2C2RlwKNjx7jwE/jnW8c26p5Gxg0vjmemGNfYsviXe4qWygDV5jdrecdU0Hvkc5LhkZNkKzsgnJHRow9JRGIeZ4TUh7RnD7hA85PzbEDrMiGinMSHgmg2P/ontqDkMHq7e6kJ1BLgHgUdZOVzFWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9F1NYq8iASkUiT+KqHEEcCf7RccMSNw6pwv++cSoeI=;
 b=Y8FSU4VoafhcA+QKtvM34i5q/bzD/wsMjpF9V6YgJbDqIJza2g8XfHTSrnQ/EYx+QiQLo3G/mdXjKuFJTFL9sF/9WZnXaZdVWLWXTUeAgLtxaaQCRIb5A9wwJDKEAEP7iUrTGxdNxTBaNJkn/8TPog+RdD2WSo3l8hiLJul4BnQRn2a+Q2TiURdjjNCboyFUq3PlY3nJRz+WFh/ujEFhmO5WzL9PiwJ+prB0ZDAKovTgDsxoHKwjEtD4fERfF9hMPX6mDVTH848xamZ6SjBdghPrnLp4WFb/NJRT5DB76vZxNvqzwsRfSlVPO/EdE18AEbXkva6fdqggNT/5mwkZaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9F1NYq8iASkUiT+KqHEEcCf7RccMSNw6pwv++cSoeI=;
 b=cRlZec8SQlvVhKTExor6RlfWxTW/HRytePSoRpM1AFJgLJa5qbvwLrLDjvAumYvHW155438haDIeHj7bIfbLB4/7I6qYZVNflF7PeMxjJO1WH83WYnvyJFy/DOkvDv+p82BnbpcXCLjhYhUVrIADS1P/fHtSUiiP1q5btJk5e38=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by PH0PR10MB4727.namprd10.prod.outlook.com (2603:10b6:510:3f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Wed, 13 Aug
 2025 21:18:28 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Wed, 13 Aug 2025
 21:18:27 +0000
Date: Wed, 13 Aug 2025 17:18:26 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] bpf: force generating code that all verifiers accept
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672B2F52AD47A7F26420D14C22AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|PH0PR10MB4727:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b790085-f0f5-435c-6d39-08dddaaef228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ia40ZpaQ54+202LuhGQjQ4mWRmUCXPyvPuCpk1AGnpNlglmAMg+qUIQujEDA?=
 =?us-ascii?Q?bq3QcohoYNFdk9KI5RYpfEYB2dk4sPxb3i1kr2QoOpjkaHvQqaIBJx+FR420?=
 =?us-ascii?Q?FMozRvBaWx/4/QpeYZP/3wizp1AnTOGDPMZy6P63yvj35CqzvxZ0YVsxd9ZH?=
 =?us-ascii?Q?CX9KEKhauQb++0DEmW+d/oVmU8S8i+F+lOXh82RCfCkZOoyZL9ya5BHagae7?=
 =?us-ascii?Q?3aWeaxZal9uOD3UWXkTycbw1E+iSV2nozksWYss6v5bzbVw9JT66zoHAHVlx?=
 =?us-ascii?Q?SZjyXwDZpqua4fVPSuOPEaanp531Tu9of7GBpTr1uftDkLIO75PRfkjKynij?=
 =?us-ascii?Q?XiaqJ6lcnzzCM3v3ClutyUv5P0BE37JVsS5vIPP0TThew2gxxOICJE6YZSXC?=
 =?us-ascii?Q?WFrXUz7dpRfWBdzCS9DqfKXFzEphd+VnxxxIHUDz33JTvc/yRjsLhkpwPDat?=
 =?us-ascii?Q?7i6ff/WkS0gpT/PcoU+BJ5v3q5FiUCIdT6tW2Xpyly4z3vZIvhSNtAR2iyPz?=
 =?us-ascii?Q?le50bd/FcOHfUZZOTSHZHA263sneMovngvfSoFlkxNAJiRzsJgYR2Zfn/JUm?=
 =?us-ascii?Q?jIl/QY4D6qlywqLFregVe7vsXU8RJwWrYtsYdUcMCtAx94TcetDgAdpQ9LyR?=
 =?us-ascii?Q?o7yCWUDWTUKHwHHbXAOLnZnkEbGU4PkFkaqew3nvmOzU+frsoWr6/I+PQtqt?=
 =?us-ascii?Q?OwhxCR5WHmRgJ7sIGQ40FKOXeoQr+HF3YJmm0+R0ZMlZbOAKvqxxytSc9QO4?=
 =?us-ascii?Q?N4GnfW7HlSutMInNIuPaymvXw7QUi1a4J3Ew0iTH9JXh5nQ/6x26I2+I1ltc?=
 =?us-ascii?Q?pUWVbBhiRPg75GK93z5fymSu9TJZ1IQccqL+wyzW0cTLJBZwsYYQ3Sb+7ylg?=
 =?us-ascii?Q?aUkQycvazo1nts9aw6MRQNiryWYwpu3zrEVoV3OZdX6ioQgo4AknMhgl9Mdf?=
 =?us-ascii?Q?c68PAsn+xDUAWSdohKrrjG7e8B8VxMy+YZzbICo3qR9MubYCdZdNHpFAf/a/?=
 =?us-ascii?Q?w8f34MZBvYXcj/DV7WKaFJhD7DBPCG+TUu7txroVHt78lS7p75Fh6L+d5XVS?=
 =?us-ascii?Q?yMkwcJLS84060ggdoiMrADabsynAGY+OWEqDqwRUjhkeVCZ6wGAUhUK595XC?=
 =?us-ascii?Q?F7SSzteOyzWktIlGruekjqpfnoA8dvo7vzHdkAR2ckj8j3i9uPq92Jq8Uxpd?=
 =?us-ascii?Q?sONyeClHGmeAkGoEEcENJNq5ol9LS/g4ONz2kbpSavtLA+GHxFhB0DmMns3n?=
 =?us-ascii?Q?6XDyiZq7VFe3CUIQnVORCofaO4u4qBMhLzum9Hffe4RxkfEk569W3XIRfHY0?=
 =?us-ascii?Q?Hd191WdA6oaxuvxhQeJQJmX4hFnNNotWC95aDdZGJIzLfre8amCDSuPFs4Jb?=
 =?us-ascii?Q?N1/HErOThSgf/qzOJIsHn3nBtEW5evzNdSAahe/NLvDYvd96NpMHbXVdyxxY?=
 =?us-ascii?Q?uRii4M1mDSk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jQN40sOJfb1GxCKKQJzzjrhs0x0Nv8RQxHzaBN7mfJovLZf44OVhpFbuOROr?=
 =?us-ascii?Q?/l0R2LQm4taZ+tmXDPNDZxDuE+eCQuEM37GNg0VJMrckttXLwRtDpji3pq4z?=
 =?us-ascii?Q?mrFusSs4hPKJoBhnJrCTKba351OCI2lqZUUFj+/0VamkDvfmV54jzNRpzrdP?=
 =?us-ascii?Q?O/z/NCjzUuvIHAB59dyUyyf3P2d5GbwKHuzbE6wYoJ0jFjkdcZc4X1pNoh5r?=
 =?us-ascii?Q?VBf82e61NE5v2zS87LrKNzSkLjJsg4JPek1oRHTo/9Xikf+E0FtCL84liUZI?=
 =?us-ascii?Q?3+hHUo7E9pZV4bmeeAv+qoi3HZ6anIm2qTGbH0p4xUic+Fx7ltsom5oFlPDf?=
 =?us-ascii?Q?+JGgyVqAB4TBl1mlhImydXVoa/OgwD/10Y0AwPjP4u5WqbzG/hwpzohvAI0O?=
 =?us-ascii?Q?zMKlmhO8w1LHmyTk/5pndCzvcZFUrhos2bjwnmZYW019xOYRP2DPvLDvLi3L?=
 =?us-ascii?Q?N+QU+dypceNM0w6hc2EM6e3FrSSR6oPtXXx5/XZ+IkyvB1yf5716gE8d28Fl?=
 =?us-ascii?Q?roPXTzBD0r7fBPHBmyjp+74vZMAT5PRuAygto6condsEUC7GpPrgBX9Ydu7i?=
 =?us-ascii?Q?u5xQFvATdsoWQNk4hH57H83mMQbZ/Q1ld9tRCdnOgsyvCsab8gY9H95uJU5N?=
 =?us-ascii?Q?W+o+VSpXf/vDPZmmpILb17WRBfvAVCBqZhmDYV9trloQcrhcN/7BRNlwgo3q?=
 =?us-ascii?Q?+anA8H8DB4yRB5Z+1LXMMczRd+4cKo5zLobgtvE52JnqcghDwXkftlczXFjZ?=
 =?us-ascii?Q?vT3BKlr4JrCbTUmk7CrygII9BLWCn4iq3eKmbBnnfoJKaRz7y6mOm3DAZrCe?=
 =?us-ascii?Q?uSZYSKKzJg2yHGWumiNj3TSu2XoJy5OTUCEckP0NakNTH8pvw0LoJ80tTm2Z?=
 =?us-ascii?Q?jbUhz9e2xO3wxJU+E2Nl5LdKUKBD7JC2AAD9g11TL5dV14MFsQ8aKeLH1VnL?=
 =?us-ascii?Q?oKe9T4lXnG70vdc2+R5kB1sH6xfXSBDEFlPtH6aHxJc0MrJJ3JymU3cPjhdx?=
 =?us-ascii?Q?i3CYWIKK4c95ueq4QQbiZS+VZlTW+7BE2frBoeek5tLV4PIUWuRgR83Ck+0F?=
 =?us-ascii?Q?TnzAKQWqbIP9H21TtnKyyOMiSK+gr6KhBnesvZyUCxbFI+TdbTxUHw3hU6w3?=
 =?us-ascii?Q?huN8EiohFaTfSoBPIlffog0gfjSqgSB+IXY7Ug/LHQH8wFV6bN5aUTuF9/EG?=
 =?us-ascii?Q?Czk3RDAwp4NRqLw5IrTmXtlnIWlsHYqmS5qqYynZQYy3YAx6ogm5aXw3xpAP?=
 =?us-ascii?Q?/0KLBgGyYHnnG8aCwwQBAeCmXnYjuGCSovy3zJxDuxGGZR4kfc3AmUhwEYeh?=
 =?us-ascii?Q?NO4j+wpZT3i7qpVL83WS30dZIj4JlBnD1sCVOMkxDlpB8DTMyAsIhx/Y2yYE?=
 =?us-ascii?Q?QNX+ujU2tY9VntA/O0v201YHFq+de9rPyQGYl+fZ3EslncjW0DAy5XLReKcA?=
 =?us-ascii?Q?d7QSvvGXkokthmxsU/6XYoKDH7Fupb7Pt5/pk90vGcn84q2OqFyKVNOQdJon?=
 =?us-ascii?Q?LngNiuIBAZ5UexP3hldVKtliZABQzM/fiOfzHiX9RHEBBg10H4I4A4bgDVb5?=
 =?us-ascii?Q?8tnsVeqCeaCHQGyO+P4z/VhEBA7mX9Yo4/zzN6LeiNmxlxXGcw4cwaoOFoRc?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CzH9/8XLmtlO0Xet3UNIN+XAYG8udXxA6i8H7fhbfz1It56Vf/jLsDPr/pKLqBfkn2AH6EsEV0xY0Ruxr1sA3aCtPtqosBSUI/4ixZbcpU5ad49N2Lm0S2a6cJ/7/lzuu2nxMb6JvpofcEPFZSCGATk3MCv6/cDO4YkpEgGrpm/hazsDDAT0cVVydVQ+fYBehm6Hw4qtaga8lN6vhtShslD4I9kt2PgqMJa0RpL/xorJTGN8LjeT5DmsiT8HkprJWp4zl9gk3xvytsrbW1uQghUlKl/1no0GZF0Jekv2Vc0E9l86mPJVyiQ6tLykJ/RkxyJ+ls1JQ/G9+ErIz+V6GASGfL0pwcsq4LCayhd/tYRLm9xoRmirDLPtwAd+1E0Oqn8iN/YcYA8MF1h+pVUY3ZkuoQlOq7sCFuy91et9BCgkVMdEAr6Z+p5afvzRjGsFXR1oHlxw9HpZVkVdXWIKAjOrEC5nCiCwsbUh5HtRHSgWOMKkCT7vi4fx9LB8q2plT7p2cGU7TolLFbGLlZHOXtp52O+AODIxo3UL+jjB9l18MLGasA5sKicLRGwxaYqgyS4eKuy8vq+nyG98ThdD1kKZ2C1uqov5mozoY30YQ3Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b790085-f0f5-435c-6d39-08dddaaef228
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 21:18:27.9448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdpQmHoKd4XKz+PCuB0yCTvvftqHPmIssl4qdM9+m371XG4kr/j5szE/inN08PPFqLiS4idN00p+jBLzglx3i0KOVA9VHJr4Ez98HKMEjR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4727
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 adultscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508130198
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=689d0149 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=T3-o6uaRItC7Zn91x9UA:9
X-Proofpoint-ORIG-GUID: f1abCP83eZZ_6fuioLB5rv_Y_RUN6slR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDE5OCBTYWx0ZWRfX2I8xLDvBrKgm
 wQkpOmyIVHopjwY1mTohhIsvvLuaGgdEO7Fe9lzKCduyCWJOzwt4sliARr0JWaq4+fe9yVMS+jf
 WiKpHCN/leH3Nh13Jsmr/XSvmTg5wkAM7475/S/2bhM/euPyy6E2CX21V3xEpLrVoQ9lLQBuulA
 /y1TCpZL7EdYIVMEBrJJVMCzfrQJ/k4/+F6M2bjQlGqz5PQUiEaqutP2ChrcR+9WlrakZazvI+n
 EqxLcf4+b3UXs2zeSSHY3Tv07jqtAnLR9/iaACs/amBgoOqYOJDvoj+C+xWmsNBhdci4dZoYuDA
 5jsaR0J2ZWKEmZo9QX89/hnWu/ruIg4mFGqtidvFU5NxegmM5m2jg949AQoIb2/e1ZRvCCbBglX
 cyZsQXWsmyXWNgFGq22HS9afG0x6Ke8HOnwhA07po98Q+ZtP4zbGgR8Nx7wBuyHsMeKMgfaI
X-Proofpoint-GUID: f1abCP83eZZ_6fuioLB5rv_Y_RUN6slR

The compiler could optimize val = *valp in a way where the verifier on
older kernels would complain.  We use inline assembler to force the
not optimize this expression and instead to always read the value as a
scalar.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 bpf/get_dvar.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/bpf/get_dvar.c b/bpf/get_dvar.c
index 073cca57c..aa14eca58 100644
--- a/bpf/get_dvar.c
+++ b/bpf/get_dvar.c
@@ -150,7 +150,24 @@ noinline void *dt_get_assoc(uint32_t id, const char *tuple, uint64_t store,
 		if (valp == 0)
 			return dt_no_dvar();
 		*valp = (uint64_t)valp;
-		val = *valp;
+		/*
+		 * We used to do:
+		 *	val = *valp;
+		 * but the compiler could use knowledge that *valp is valp from
+		 * the assignment above, and use that same value (whith is a
+		 * map_value address).  Older kernels do not allow a map_value
+		 * address to be used as map key, and a verifier failure would
+		 * be triggered by this code optimization.
+		 *
+		 * We use inline assembler to force reading the value from the
+		 * map value rather than allowing the compiler to optimize this
+		 * code.  This works for all kernels.
+		 */
+		asm ("ldxdw %0, %1" \
+			: "=r" (val) \
+			: "m" (*valp) \
+			: /* no clobber */
+		);
 	} else {
 		/*
 		 * Record the value (used as key into the dvars map), and if we
-- 
2.45.2

