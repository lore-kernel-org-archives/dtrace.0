Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFB119DF7A
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 21:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737063230; cv=fail; b=RyVvqLzw1J1pjYP9AdIlI21lsStMBxwTTajNUI5RRCfW4ui1Z4fm4GGV/jmBqfXr3M4f6CrZpKZFZ5qpMq0laS0thf3QeWnb1mEjVZw3d/2MnwnC4Q43lsIO+XCKLQi+hyI5DPcACbKlO6i0OmvMI8A3D3lWBYGP05y6fznyQOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737063230; c=relaxed/simple;
	bh=jyPh/cp4y+pLbZASpIp7kU1KooiENPac0pAX6o5/GfM=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=eb0fbCTXYPll0IueUGk+M0rVXIttTcsbcOJmGfhVTBVAUcViZJ5Y5A213rSveuuizK1zYmDRZ4VZGhT89e++E9ZZP/NOMDHVQ0cu/gmfgtY4MVvrZJfTii/bQkdal3hdz8WB4xO2p70/9UYyripSxwYnOBnVgVycRLSNcbOfy3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gdBLHUy0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=U4JiEvuC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gdBLHUy0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="U4JiEvuC"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GJBokQ022243
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 21:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=7A7w3703K5rf3RYR
	T2omO7vLj5pgNxkvB8g6wYjEfiQ=; b=gdBLHUy0ir44uubK8QT/HetJD84//tnr
	N4FkBG65d6gFoYAAKeOYU2r2qL9dkwbF8tn+XvPutyoKUmNnnPgEVCiRkmtmFXOI
	MB6RjvYRM9moEeKHhBp460489KWhsO4o4397Kzy7K6gTSDUNcfiiL/05NqDHHMTl
	lKnlPh8ozgl9m/Kp/W0PTtTVO3iryQ0jv2IC/FHQpjvJsjl8XdgUuTnxhi5Xut8z
	oAHpiK//OQnCmTtlg4qqLX0xS2apm5L9hH7gPZxW1raWTJ7Tx9jWgU23PYYbHxss
	jaw6jkLq6tAaO2sdACc+vNQxZPLJaJI27ObbWAqAoV3ywGIIrj/kJQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443f7yb8qq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 21:33:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50GL4Kw7020272
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 21:33:44 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 443f3hqrd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 21:33:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a523F2xox4QcjOpHZ0r9qwkZ+5ZDuiwY1yluuk9fB1jh9MvP41ZVKhsZVXeSaYMC9T6qIQU2g0WKVj4dZNFl378pLbFev1U3EHkar6iHeEBC1zvw+Jo9qtiUIs0tfIfw5UWXLS9ln5h72/PHvyjD4ANSpdmCFFxFg/314+MyZd/WYfoZw4Ay6xj6kJ5e8DIq5q5bc6yH25nhyXkeBXWTNk+U8FsOJ4aKfQ6xfNqLYoDKaJjOq2HFAuDk9FLUNQ/+4UITq7Pwks9iDts5V6LiSk/GyEHjyY+f2scRy6CyeEgKmlHpiRqUf3vwjXl2B1iH60CdSqgzE8YS+pDnlgGsEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7A7w3703K5rf3RYRT2omO7vLj5pgNxkvB8g6wYjEfiQ=;
 b=Js4Rr4VB2M2w5qYDutY4+6XQHaD3pFJGWjAN+6ztJT326n6VaTx3QLqfQr50ftZo1O+YWVcU8MzVjbdRoVtWrLMTr4N4zdJ/wPQKuD/eO2GGW3uwcHAk6bGMzzxpF9OAhwABoNbvO8lelW45axNFrvyE+s1B4d0cr3xMdAwy/wqP7KDOlpmCvb0e90hvzxBhiyJuq48i6Fn4Du+9y21KvTroflR4TRSR14t0M7XcwmMzVoQPS/PsGbY/KWxnlQalzJGwilbvO6UGCXjBoIZCEOI0c3FZZCsvUx1IwXTBHy+sZEFQdlwZwdsku6vJLzav8Teh3DKxd2QmQ/tdvsn3fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7A7w3703K5rf3RYRT2omO7vLj5pgNxkvB8g6wYjEfiQ=;
 b=U4JiEvuCZQA7eGEHSFrF2bW+hphZkiv+UW26/CwGokXsuU5ag5bPaR2v1j5/ys9mQHXitMnqZ/o3KQWT1Inyekd8wuhzSTS2MCtN4RP3zNVkVFUaOmK3AEFkFAH70GOkBxd64KRJ3H8GnIRqT4eHPf9u6mtaNYCeCpHLQ+clZDg=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by IA0PR10MB7642.namprd10.prod.outlook.com (2603:10b6:208:481::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Thu, 16 Jan
 2025 21:33:40 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8356.014; Thu, 16 Jan 2025
 21:33:40 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/2] dtprobed: handle a crashed parser child better
Date: Thu, 16 Jan 2025 21:33:31 +0000
Message-ID: <20250116213332.415905-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.47.1.279.g84c5f4e78e
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0605.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::7) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|IA0PR10MB7642:EE_
X-MS-Office365-Filtering-Correlation-Id: e2dfc8a5-d5c7-45ec-bdd1-08dd367571f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JOZTNAlE+VgATIL5pXlH3lxc70cbNNiWrkrqVGCZdBoqamGbPQfdgMJapdHC?=
 =?us-ascii?Q?3mENavstqLjftLc/MAflBcDpchyk71bSbwG9Ro+H62ldKI8owHjzJZD/r6eb?=
 =?us-ascii?Q?OdWnouwUOphCpif12Z64Fs+LPsFW6beQ74kreVm6+OF1iD9VnURZp91dnZGK?=
 =?us-ascii?Q?UgpRsDmRyyFOMaxSuT13kQkXq6mIq9mbAjtwbfqPYMKV+LWXTFqk0z0cHCzn?=
 =?us-ascii?Q?N2XCGBf3uCPEwZEOifkqUKb7YKyjSwCJB+W7Zd8DLgfFDkgbqBLrnV0kQ4Ad?=
 =?us-ascii?Q?ZVb0EUtBNqdIDDeMsqqsHSLhQCEz9m2VuF8khU4Fr9E1ISUJn23q0NxK3pxr?=
 =?us-ascii?Q?0lwWO+7PKUFxjArIuAnk1Cf29QosztCsys8P59wgruo2X1bCMi0w9Ay6kfTx?=
 =?us-ascii?Q?xVdRGdQkiMEZoHG20qXhlceEL/HYbfrnyDr83zkZkLil4HAUOPHdq9iSTscP?=
 =?us-ascii?Q?RP9M7E34bY3jnEQqEhQWbKDxq0zaPu4av0ft8obT/SB1R2Oone97qTd7PDJb?=
 =?us-ascii?Q?tg9EH0KB46tJWZQQLjwFBNcIYK6HePBQD3i6n8uFBselzuRKWDj/SPv+F6CM?=
 =?us-ascii?Q?S1Owo9nPTbMwWAu5DDB3ZJksgcAnx3eabennch1FIvj1WPxFS1uNTKMHsV3R?=
 =?us-ascii?Q?9LP5WL1KW5Lw/QlaXIe6ALwIyZ0mSHi3d7bi0vhvvP2tdNMjK0uBdmFnL/pI?=
 =?us-ascii?Q?2W0ePej41aV58meAhcX1q1sZYJgDjMOkbGY96auut+BwCjiNjR7ENRR9vmtl?=
 =?us-ascii?Q?NiG6MnxwCa6DOahVZYrtWPuuJKgWFLD5rZ/I4YVCxfK4AUZPAN++78WUMva7?=
 =?us-ascii?Q?KLKBxUVyWqGNVhDM+it8lLBq85iAAJY/4TRRQgfaMAhuVqcSjheKIMTGXn6l?=
 =?us-ascii?Q?rJVpL7Ef6IBYTR44p6sFbRyEwa0+3vi36iJtBQ3bDqS1MnBlqHpUpaU23X2X?=
 =?us-ascii?Q?hRMAtrOscDyfnd83eyv9FBz+NfZGUB3l3lkR8ZG2siOzG1bBX0Ww2x5mca5C?=
 =?us-ascii?Q?3N1VhYoPjLM4SptWli1KSmFsudk1epJ8lvDaCuFTQ9TU8r5mWVzsnZQSWN+y?=
 =?us-ascii?Q?bvQKgNc4/RRV3OLRTpFoibhkyoRQk4qMRgNSZQIMmOIlb/9NaHLj1LDd6gzW?=
 =?us-ascii?Q?S6sTadba45aZDHD9HTpSDa2bes2XT3Z8Lo/5T02lV/GUX7In2ScPIoeNW9bm?=
 =?us-ascii?Q?FPzDbiQS/T9O21umyNEXvjll4IF+02WCBTAlEbIak7AsIIXmDWnxgO389dqV?=
 =?us-ascii?Q?x5WLZ1PqXRAScDoKWNDUI4G8st+cXfdVevMuZA+1Vz8z3nUqwqfJLyGPHYpX?=
 =?us-ascii?Q?nj0l8U9nlAMw2QMyIJwOTidhaI2Y4mb7Lyss8fURI6saQT4+ELndYra6o+PD?=
 =?us-ascii?Q?txdsKEfOlOM0DsU1ZxxCnpq3zcJB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D9L+Owljme0dECuEer1YQX5DSvDfV0MznStizQj+YRqt07VO4f8JR2Qo8Pqc?=
 =?us-ascii?Q?eghGW1PdGCsLiwEnBLHyh/SCfuaXt5q4g42+okq9QEIVJ1VlwavUYXjYWjYM?=
 =?us-ascii?Q?exz2U11o76nhjUB0fZ75wlbnpsnvwG7MRZ6bKwvYBEkBtGVuybVyczJ2PnSW?=
 =?us-ascii?Q?aXIZ/KYCb+OnMa9++uQxnRXyMA9q1gQ6iq+Ua4slfQzxBhk1h8/ziMPeOTNd?=
 =?us-ascii?Q?RqhLyH25o9Vo889spEDLhjnWzIIJ1gSNUxoqpRt8D0VSGyZyv6g3S0K+awVS?=
 =?us-ascii?Q?llp4MGsJRROCImQQR9WfDvY3QKBmLYK9f4DuAkwYCv/70DA/mp884FQFfL6Z?=
 =?us-ascii?Q?RFxGCFfBvmjmZnM26TjBXSCAqa1iXCiCsJfZ0hU/Y2VT9eTl2OPjfQxJQAHL?=
 =?us-ascii?Q?8htDoIjQaNy8e3krjFrEFD5ccVg8mrE/MiVkNnvErCkmqc9jhXO7TLpDNGdF?=
 =?us-ascii?Q?BkWMRp7Yq6A+rlBTlnd5Ax9HqYKXn0rBpDF68LtJ6ZfVprNUlFqWQUz0litl?=
 =?us-ascii?Q?iA5Trb+rRD5TPUN5PLXp5sCGlQ8LK1LITZXKtLWUl0HYYAtA/0bPKNHSZ5e/?=
 =?us-ascii?Q?VRoiDohdLq/eQWd+Zd1wjNOEMxMUYMoWn7YtWRmC/Ui7wW6q/WteoOMgQ49f?=
 =?us-ascii?Q?WqWHOpysr6yhy7gJwbKFfnBXDaocKANaUKH0lyji6mExM2QjOX9g+ZiJbUlH?=
 =?us-ascii?Q?Gki4oih5pkCo9iUX1QJZd+IZHLv6QwvlxVyL/iafOdAQXioaR7dUnrVjBJ3M?=
 =?us-ascii?Q?qMMAqRdXYsyjpsZxi9zROMG3cnrgpSx83sic6W73EXKqqlckDf4BLfAY/ISY?=
 =?us-ascii?Q?ooIHggTWRFfK8A4mLSqntHhRQDwJqvmqSjueVxBIPQw9lBnYa+IIesYgj8RH?=
 =?us-ascii?Q?4VadA4FnLVjkTfPbT6ZhHYKshosJdKpHKRmOdzS6aeqgIrgGjwsrhHwy0xOv?=
 =?us-ascii?Q?6ZY+PcDqsF42r51r+d7MSb9qBpYYgAwkpLhCWQV+6g2FP3eLrtejcpl7mT0L?=
 =?us-ascii?Q?SxkGgV+r42soEGLgikp2gIzxmJWVOl6082yltRNlDxhCjHv7qWQ6v4uXkl8Q?=
 =?us-ascii?Q?AL/7qM+GlIdMLBobgURCVp1cwEpR/vIm1jZi2iq69liA5VLqQaGXMzDpRLMH?=
 =?us-ascii?Q?BBKgNutdcTvg6os2EaAGtAM2CIzTWW67ChudWKVYbaC1dCXE278LxdSkbR7d?=
 =?us-ascii?Q?5Xa0ElwVERUwApBVoyasqZUeBaKE60HLIqYccd+Ui9EMZXgL5I2UomI0otcZ?=
 =?us-ascii?Q?/r9OeXmwH+1nwKWnhz1vyaOtdq7dWBfbBPeanGsNkWQWKbY8evc8MxtTrGg8?=
 =?us-ascii?Q?zjZTH0c3jJtzZw3vRWvouMGomFGzS/+/HurFAnqM7jkwkayyjaxxZ+pcZLCx?=
 =?us-ascii?Q?jTzeHcMg8GJC5u4SBN7Yr85f90rD88CFosIBkL3EsfIzhBUgPaXrJNJHWrwg?=
 =?us-ascii?Q?595gmquCHHvRhiQni3dYTVkXK84iHqgdO709PwNbteojS4jbc+gnvIFsX19G?=
 =?us-ascii?Q?x5uQppuXhmVcVXVcMyFgNnVLek+mGmB8/pH6SkdrejNE7epd7EJlHYDS2tZI?=
 =?us-ascii?Q?8duHA54SaFCyOYgd08Y+ZnQjV9w1y/sgBOX0mcZXW4ZAs0NSPAkvb/ULQAIA?=
 =?us-ascii?Q?wQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PcaeGFgCbUjK6hjde+XI7eDm08GKtamPtOy1eKNaH62K0kIOp2nrz/cIqI04GRHj7/XxO1mkncNHONQcpU0aQHMH2H4OwWo0EzO7FSULcAAOos6P6E/MLDg26dqcdL/bhtRes0HE2HRhPJh0ZuFWBZpzwrr+ZM/oTOGFMX+F2A5YL361jZTw5uw2EgV6p3REzO3gsq2cowcdS6vl74C1xyqfVVOFgdGOcAGV1qWbgPEJrDfx7w1gQk0CmMi2k3zZyN90+aq/RtFk6MKXtRX+FlR1cs2xqN+GHFqX1C8Ipxwgj7rCUF3VbHlQrg/lgXWP0CNSACiNab/3/6/J9gjc9MoZ2pg4rmPsrvXu5KUEEqNsNXME1rQydmWgNPDklgN0A0+0f6wnjXJXHUpyySrfuNMnvRPObozYISlCnug+wwkb3X+BdrQUp7s3xW1klLMTuSD1xJEnWFZKyVnlR62QRBxxNgzJIUluOGLXCSkXehrrZgbV0cn6Ro4DXEXakNjK7oJOXp/gXHKujHZBjA1rvzZ8ndKEJVxdQB/TQBVffGPaxY8zsYtImzhZs730PbL1pFxcLqy4aTChLnSt1muF58T/B5qX4FmAl3Uv1jmGE0Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2dfc8a5-d5c7-45ec-bdd1-08dd367571f3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 21:33:40.8531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q8StxGibSdZySYIwC8gYUQZXKqRq5W3IiGER6vQqNSMkHdh89IAwlA+5xvqR6oGnIqOpNL9UHJvzeXNuQxmMAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7642
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_09,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501160159
X-Proofpoint-ORIG-GUID: KYMJFdYeJwLzbTBhOE9hXxTN6oTpeMey
X-Proofpoint-GUID: KYMJFdYeJwLzbTBhOE9hXxTN6oTpeMey

When a parser child crashes and is restarted, its file handles
might change: we should pick up the new fhes if so.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 dtprobed/dtprobed.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index 86865eb467b67..c0597b7329d37 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -769,7 +769,13 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
 		if (!provider) {
 			if (tries++ > 1)
 				goto err;
+			/*
+			 * Tidying reopens the parser in and out pipes: catch
+			 * up with this.
+			 */
 			dof_parser_tidy(1);
+			out = parser_out_pipe;
+			in = parser_in_pipe;
 			continue;
 		}
 		if (provider->type != DIT_PROVIDER && provider->type != DIT_EOF)
-- 
2.47.1.279.g84c5f4e78e

