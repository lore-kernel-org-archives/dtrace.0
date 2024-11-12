Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395991CEAC9
	for <dtrace@lists.linux.dev>; Tue, 12 Nov 2024 13:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731419013; cv=fail; b=oekkEciHAc7ZT421R1EFoyLI97WqV99nBXRa+Cw4ElNBviaJsjnD0puYJ6iWZkoSh1Ooas48p+yRPmAmsl5PI+6f587/ZXIC6F7RDBDGYzTQanyN5riQq6+7jIuu58/yYREfU+Ug03Ul5IP6yBde7s7dLcY5J7x9kvu6ddFS7SY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731419013; c=relaxed/simple;
	bh=Z1BFMvbedYk5DLlMHGd2zNQnjQ7r3Ls9FiUtbXTg5zw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ArSBzBvuZ+yEnwEawJL4uQ0Rv2VJOyI2mf35/woWHWnNTvAq3itUHzfSVyspgk8HLuWJkSAHDTHhx82H/nDhGwiZmN09LvbqoSgrTbrVkAj8rWzZPLVTkSqDp70iBxsuL78KKM/7f7BdHRvRqCvq8FB5WT9EHe4cBtRaF3WgcME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CFX6iVq/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=w2FpwTa0; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CFX6iVq/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="w2FpwTa0"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACDBavG005194
	for <dtrace@lists.linux.dev>; Tue, 12 Nov 2024 13:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=Qid5JhAPq2hhuHSU
	7xvqxTWO42dQXDNl6Zy4Fu9gSxo=; b=CFX6iVq/CF3U6XkwmxpDKd3TNBXwydT9
	hHrEP5EUVYiqeo/x67cYM1hSwY1Go7GpS+O7lGyHTC1N5b/dqy095ozM6NjLztng
	JHzs3FftJ1EWV4RIPDa1XCfWYD1GeUPvfsfWX9i8ecG5bCVQaPo4/GELVhHB2bfs
	BfHn521etZn8DULvSLU7fhgNbxFKwy6D2HS90DwZ8Z8670/GWrVKvPWFfymXLyKa
	Fqf0Vab8v9SVUAJvqWNZTDV7AwVAfKREXFrwxZIMiHirXnqEUi33Aod6swQJVSBR
	06voCvL5+q3NVvfcsnJjzeRzNIyphorTskwTu6HPoWQdZ34eZSFfOw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0k5caku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 12 Nov 2024 13:43:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACCTGat025929
	for <dtrace@lists.linux.dev>; Tue, 12 Nov 2024 13:43:26 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42sx67wb8m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 12 Nov 2024 13:43:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qRyMI0oEhaE6BzvZFIxbGSxAFjeRY3YIL4+vtGe1LcaBFoG8EdyIFtFcEVbR6CdJNAPlxt9oy4pRpSzgl//VLwRUbGucJKe24QppGDqsI7uJY94XqX5BeYZgTYDfPIZcxXLAPqqE04q7RLw6CjFIpyPQ1xCkyJ3zW3p1NRw88hNow1/Ig5MkhCBcumwwhSIPcX8z/NRMwg3axGDL1bXEKFrG/LCsacmuanLJhPakFUYDsgPDpRTmHxZSNPW+KyoIkHWGzpVcq/b7jUmrD5UP1BufSu0JN5Yb7u+Plo6KdTGh0TgHO76XgkjifvInm/QeQFDfbMTboekjni7unUpuzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qid5JhAPq2hhuHSU7xvqxTWO42dQXDNl6Zy4Fu9gSxo=;
 b=h/Luuz68maywpnushyc6SjapzhtlWJqiKc1ADyQsbM7Yna6ubVg+XBl/26G22sVA/xf79SJtnGVvzxuoqC5ZneVP1rWOcCdKiHUsRjU8yFJigqWRXMVz5uUBRnY/xmu19u3F8llV+YiRfLfBx5KN9BMSTdXBJHWVN28yC3yypnnROQ9Eh23lBUgpEeYvwmfzoXGy4/X5Vhl3HNkRyQGz9T9qWRGQWjiauyH9FFdsWGiz3OIdVpRf5BHFpmwgXSevXQnjjd1u3heS+yDUMu4qcVh4qDsbNKSZfQ5Zj3oCGuhj0oPGv+nZA6kyzLe7MxAYqh2GAVvHZdgm0LMMxe61Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qid5JhAPq2hhuHSU7xvqxTWO42dQXDNl6Zy4Fu9gSxo=;
 b=w2FpwTa0w13BsMrWkt5eiVPa4RkRXPfqmS1sDzTngUwSUpRo21wYVByBllSPNFZAftt71hhLqqAaeMzXE/WFo1JtbEGDQdEnOceU4i6tmgbo71RpChVVKA3mQgAEp5A6L/PQNkl5alBrv76yA39xjNiPlKSVtWGRkuUGEG0yzWU=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by DS7PR10MB5134.namprd10.prod.outlook.com (2603:10b6:5:3a1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Tue, 12 Nov
 2024 13:43:04 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8158.013; Tue, 12 Nov 2024
 13:43:04 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3] Allow arbitrary tracefs mount points
Date: Tue, 12 Nov 2024 13:42:56 +0000
Message-ID: <20241112134256.118717-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0291.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::8) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|DS7PR10MB5134:EE_
X-MS-Office365-Filtering-Correlation-Id: a1aa6001-e4dd-4828-439e-08dd031fef06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ioNTUG/V/QvKD+PYDvitSxBNhcSiECyOopcCjKQVNpgltn7cbGEKVpUqhnwo?=
 =?us-ascii?Q?1Jsz74DEauoumK1vNOX2hdgPWhzuO9hlxbBTVhRnoCF8QDhav4/14HYDlDca?=
 =?us-ascii?Q?yUMqV1MFCDliqekyKaXVfTfxde5MrtyjTR0ko2ttfOOmsYcRYcoLp0qIaN9Z?=
 =?us-ascii?Q?xBvu5SgGZlfwI3cglMw9+z84AAtJc6g7ouQjthTr92EUzbEQ2vKjrFIIeGgz?=
 =?us-ascii?Q?QODwiCXgPIelhK+xHED3dP5Vc1slnEM8LpC76D27hOKvO48RK6+p2NVfpnV6?=
 =?us-ascii?Q?ZCWwb/8MNRMG9ACDG7QJOc7EFAH7XWvtEbQk9zgL+17OGYpXWTbhRpSSFb9O?=
 =?us-ascii?Q?Pvp1zwKdY86YefWBmikiFgTZ+INNRTyLs7vrFOUWYEObsQzAqOIoUeHONvqJ?=
 =?us-ascii?Q?I/pXFximBcHPVtKb/VuDIaQBMyhZ+wy5lW50FN+e+jS7aDP6wj8mXp6XK5Z1?=
 =?us-ascii?Q?XjyRuNje8gUqBkJ7ur56ParvivbAHjUcSqKn2cQHu05jQIXRzwDlSE+fn/Ot?=
 =?us-ascii?Q?HTSwVRdWFVbyup3/64vWZIgExsCMX3f8IVASu8AuGN3g+Z8wYsB4cv/6qANL?=
 =?us-ascii?Q?p9J8VRtOhX4AbHMjR33CuVpB2QLmoVhxEMGqwY60Ao2A54V5XF7hjsiw1vGI?=
 =?us-ascii?Q?pAmb2atuQa31tD+3cppSK+sle0u9A0Uit6r9QPK/K8tNiLTJo6lhOCP+Mnbt?=
 =?us-ascii?Q?sTHFqusESXWenhJiWvGkComBta5BFLUI5dJj0pK42Wv+cR/flSsu+uBlmupz?=
 =?us-ascii?Q?BRhBuMEfSOlmL8S/8nsM/fZeVhWbC8o02iBdZJxdT2vY7lN3xap9DWozNccF?=
 =?us-ascii?Q?W/K+vvLL4Xl6CgharNXRtkGs067nYeh0oxbv9U5oRvbgLS45T9KmrvP6qlBw?=
 =?us-ascii?Q?qv8C+t2r+ccvXRCN/MiakJU8HTNow9RWM/W/P/lAjQg2FH7Meu2QT6txzmvI?=
 =?us-ascii?Q?mOPrNIEBbPGMQAp4PNsmOGmlYMD2pOmnhYmVF9Tog8mE3MyizViR7gW+aYYL?=
 =?us-ascii?Q?KhBfEmHOxqURlkDapG6BuJCUVn8xwLwmR7pioFrfoRp7AnbkrkqX73jJTpWw?=
 =?us-ascii?Q?WBYhbtwnGqaYgwuFfFSasOHdAriblqzdH7d4IwHbCnCg3l2D1d8cObqKoIk6?=
 =?us-ascii?Q?oANy8kDf/YqY0CV7k3gpQ7rA+h3tV47U1AEG5W/fPeobOS4fZd87G0yTQyOh?=
 =?us-ascii?Q?oKnjeOkS9i+dKUg3DLePoL9IDYADa5rsDPeGUr9mj738c6eL2LOAFdWt+cCl?=
 =?us-ascii?Q?o3hTm/gMlyl1F4wpvZRO/CCla/5XienF4enztp3+kquD7Q6Rbo5TFxedr4pO?=
 =?us-ascii?Q?78coAIuOFM8Oo7iFDdEx/RV0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yBnzVtlo2tfcntAyQdTnEeTlYBupRlyekrVuf6TI37PENtc6tq+zpjVxtfti?=
 =?us-ascii?Q?GU9NBnWwagQtu4T4Q70zmMMotbA1/H3aC2gwabIDInVNkXPgnTALJIywXpmP?=
 =?us-ascii?Q?FFWwiWcK8amUjXYrMNd4vjuIKyk9J460KCPjh9FJE4M9nPRh9y4aSGkg33Yo?=
 =?us-ascii?Q?IKBza6luJ3UmP9gfN04lVjUxxj7jZXTMZAXxhK/L4V4a+oeBJbk4QX9qgxut?=
 =?us-ascii?Q?PXDMBXWtCWCsCjc7iEuJSq1+27M2iuS5U8dt1O1sPT0JkidwBvMQ1Ws+ukAM?=
 =?us-ascii?Q?vcADeWFRaRdQVQuWJHexCTaQX5jxIIvUUaGBar4oGhQDpr3hI7i70tq1MhKH?=
 =?us-ascii?Q?i52q0C10k2Hw6yPlToT+0WW8vZWl0xT1wxTPXQr6hiewXTBtBzYE61u90qWC?=
 =?us-ascii?Q?X6KGDK8XV2v/Wip998PaDZYIVeuc0HeSbmPafR86xj6qwaHk9mAYgdX63yk2?=
 =?us-ascii?Q?pFo2XiVfbT+zf/cFK18utr1ywfOiPu35k4AZpfvwhog1+yL/cwjEXTy00m2C?=
 =?us-ascii?Q?vqxRsZkJMWyToNCUZNMm6SrHOjKXXcgapPwfZCcZJa3/pf6EsUkgqlgOskOx?=
 =?us-ascii?Q?UscZ7xVIMGqzu0BheEU+pAg9xFvboZk37v5IZlWoyLcWX9AgrXf3exJKmdKb?=
 =?us-ascii?Q?rCl1dl2qzPrg6e97kgjfQm49hI9dAkXuZJr2B8ipkVE7b05CzvH4cxMmTJjj?=
 =?us-ascii?Q?IlgOP7argTSobJVYv9g479ZDp8jwObbeUgIzRAfQdXjxbi1SRCBXn3frWfQr?=
 =?us-ascii?Q?7uvtaz9iY2xWDvvhpQwbL6RmN1Qs+NAP2d+F8ib5lpyVkIVfDJfP37fpEplQ?=
 =?us-ascii?Q?ZQpLN/1Y6L7PulqsiiFUrzqeHmDaglKvCWrpZxrlYxGdVQcbwUBNDamL5NK/?=
 =?us-ascii?Q?5mf6qhXlalEDMghWmagndy170ap3vsUhQ6FKfW+vujMHcYMFUICeClyfI798?=
 =?us-ascii?Q?KQ/ws6eIemAChVG3I8S0iphyGG5Xv4b+DLsdtWtuMhPSGTkJZEAO737cDHlF?=
 =?us-ascii?Q?mwAEVraA6xiSt9AuQVyx8wuysywHGSUCPfqLREj2sv+3Fnk1XfePP/wo/TTh?=
 =?us-ascii?Q?Vgjs2yS1ysvqq6judODy5bNRPayGDVyfoCAa4tlEDlt2I5VqYf3fXxzaDTwP?=
 =?us-ascii?Q?r0ON5EIx5c5eQ60uHEjLHtDBVO5IJOQje7Bjv9Ryq0J46e4vvFscqvP8bI6q?=
 =?us-ascii?Q?B4lDH+2iuU+ZfnC3uDw2qaOVGqOKb90fXYTznKBGbPLJRvBD+fCQ9QRkZ99w?=
 =?us-ascii?Q?48QdW65l/IXsVEhNUHOh95TqNG2LeMjaCl9ufiyu7uAQJB0Ub1W7OPMqH9fQ?=
 =?us-ascii?Q?oTz4/oFAQlFsK3Rm6cgFAZg8FcuTpqOq5VHr/ZYXHhQUBqo7VfLNUEJ4PrNw?=
 =?us-ascii?Q?ehYEbOPofE+yiNLROtjYfos9Q3knt3e/oc40w2mzHvKEgECg1UdFzjLoEthE?=
 =?us-ascii?Q?irXxqU74v25cVRAhJsPX5KEYqc+3yru3x+pXjPbJ4z9hBlsAhcuNnC41dB45?=
 =?us-ascii?Q?6OCUBy8EmjvRJS8jyJnPMlltCt+/PgI/bCDr4Xrmda3z02EGEY9Jw6bYeEx1?=
 =?us-ascii?Q?dp+BIw6fwk8Ie7tdUyiZjYMNJcp8MoI819GQdMP+KLNNYFUlEZ+6wcJzu31a?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5z/DbVjrkFJpYRmWtbZeH+1tLInciWyldprTXo3o8tkBb3KacOkPLS/118YVkOq/Ld9LIZ4zhdjVYV8xYWyW7o3dQv//T3SQTSL/My5QX4x9/wrEmORZBgz1dY2yU8LLlF7gnkJC9xLrSJsG5xXoAzIJ5tAGPellWyue794cFb1HLMG3eICsumwkNxg+KtXb5mA3td3jpL02gC/18K92o39Nr4PHkFvuY+u/ltLT47Auf9cjwq2UsC0KKRmTrZ0akRGsLpvCDm2VA+LCV+gcu9QsT5HO8EIkf9gmiTHm3E4UiMve6LZrhpMzYf6HlWCLbhdcPC9h3zWq9EvqtyZb4nZMnEEekcyldXAGL7ZNw+G9KdPLzR0DXEawq0Ej496ko+nZeI5w4+couQRGA3KyNphseACgvCVH3fometQxMhVYsGaMvWQ12IMTeM/qnOogMyQjHMfvQlUWsN3fBRjekUlknlr3QDTa8KBIPu3gnVrb9u9RNDD9XMlaLP2ncrfRchHCLq501zPWpqon8iF4mBQSQT8yNQYDhNhFeBbVykLwiiLgi6gWi39byXXWzS3CIse335agm/ONEaVYzKWkucsKOwTm92dx9h1LZ7skl2Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1aa6001-e4dd-4828-439e-08dd031fef06
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 13:43:04.7745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nfkyxcd6VYra9tO2b8Cd3zxu/xeltCLI2aAUOXbfwpiKqwhngyZL3DiZwOn4toEAV7TXBQ5cDHV+FCVxzVYRuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5134
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-12_05,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411120111
X-Proofpoint-ORIG-GUID: B1MhF8PU8-ApfpHN4_JXMtCLD9ofkeBW
X-Proofpoint-GUID: B1MhF8PU8-ApfpHN4_JXMtCLD9ofkeBW

So as of kernel 6.3 (upstream commit 2455f0e124d317dd08d337a75), the
canonical tracefs location has moved to /sys/kernel/tracing.  Unfortunately
this requires an explicit mount, and a great many installations have not
done this and perhaps never will.  So if the debugfs is mounted on
/sys/kernel/debug, it automatically makes /sys/kernel/debug/tracing appear
as it used to, as another tracefs mount.  And of course there's nothing
special about the "canonical location": it's up to the admin, who might
choose to remount the thing anywhere at all.

To make this even more fun, it's quite possible to end up with the tracefs
on /sys/kernel/debug/tracing, but an empty directory at /sys/kernel/tracing
(I got that during testing with no effort at all).

All this means that the existing DTrace hardwiring for tracefs/eventsfs
locations isn't good enough.  Instead, hunt for a suitable tracefs mount with
getmntent(), and add a function to open files under that directory, allowing
the path to be created using a printf-style format string (mimicking the
things we used to do with EVENTSFS defines and the like).  This is actually
all we need; there is no need to ever return these paths at all, so there
is no clogging up the code with free()s -- and actually there's a
noticeable simplification in most cases.

Tested with both in-practice-observed locations of debugfs, and the
obviously crazy and bad-in-a-format-string path of "/%s/%s/%n" to make sure
that is properly rejected.

Bug: https://github.com/oracle/dtrace-utils/issues/111
Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 include/tracefs.h                             | 14 ----
 libdtrace/dt_error.c                          |  3 +-
 libdtrace/dt_impl.h                           |  3 +
 libdtrace/dt_open.c                           |  1 +
 libdtrace/dt_prov_dtrace.c                    | 27 +++----
 libdtrace/dt_prov_fbt.c                       | 37 ++++-----
 libdtrace/dt_prov_rawtp.c                     |  9 ++-
 libdtrace/dt_prov_sdt.c                       | 30 ++++---
 libdtrace/dt_prov_syscall.c                   | 27 ++++---
 libdtrace/dt_prov_uprobe.c                    | 41 +++++-----
 libdtrace/dt_provider.h                       |  1 -
 libdtrace/dt_subr.c                           | 80 +++++++++++++++++++
 runtest.sh                                    |  8 ++
 test/unittest/funcs/tst.rw_.x                 |  7 +-
 test/unittest/providers/tst.dtrace_cleanup.sh |  9 ++-
 test/utils/clean_probes.sh                    | 12 ++-
 16 files changed, 203 insertions(+), 106 deletions(-)
 delete mode 100644 include/tracefs.h

diff --git a/include/tracefs.h b/include/tracefs.h
deleted file mode 100644
index d671f51adefc..000000000000
--- a/include/tracefs.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/*
- * Oracle Linux DTrace; simple uprobe helper functions
- * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-#ifndef	_TRACEFS_H
-#define	_TRACEFS_H
-
-#define TRACEFS		"/sys/kernel/debug/tracing/"
-#define EVENTSFS	TRACEFS "events/"
-
-#endif /* _TRACEFS_H */
diff --git a/libdtrace/dt_error.c b/libdtrace/dt_error.c
index 213f0d9e1385..9c4a2b32888e 100644
--- a/libdtrace/dt_error.c
+++ b/libdtrace/dt_error.c
@@ -98,7 +98,8 @@ static const struct {
 	{ EDT_READMAXSTACK, "Cannot read kernel param perf_event_max_stack" },
 	{ EDT_TRACEMEM, "Missing or corrupt tracemem() record" },
 	{ EDT_PCAP, "Missing or corrupt pcap() record" },
-	{ EDT_PRINT, "Missing or corrupt print() record" }
+	{ EDT_PRINT, "Missing or corrupt print() record" },
+	{ EDT_TRACEFS, "Cannot find tracefs" }
 };
 
 static const int _dt_nerr = sizeof(_dt_errlist) / sizeof(_dt_errlist[0]);
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 68fb8ec53c06..950cb34819aa 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -354,6 +354,7 @@ struct dtrace_hdl {
 	char *dt_module_path;	/* pathname of kernel module root */
 	dt_version_t dt_kernver;/* kernel version, used in the libpath */
 	char *dt_dofstash_path;	/* Path to the DOF stash.  */
+	char *dt_tracefs_path;	/* Path to tracefs.  */
 	uid_t dt_useruid;	/* lowest non-system uid: set via -xuseruid */
 	char *dt_sysslice;	/* the systemd system slice: set via -xsysslice */
 	uint_t dt_lazyload;	/* boolean:  set via -xlazyload */
@@ -643,6 +644,7 @@ enum {
 	EDT_TRACEMEM,		/* missing or corrupt tracemem() record */
 	EDT_PCAP,		/* missing or corrupt pcap() record */
 	EDT_PRINT,		/* missing or corrupt print() record */
+	EDT_TRACEFS,		/* cannot find tracefs */
 };
 
 /*
@@ -713,6 +715,7 @@ extern void dt_conf_init(dtrace_hdl_t *);
 
 extern int dt_gmatch(const char *, const char *);
 extern char *dt_basename(char *);
+extern int dt_tracefs_open(dtrace_hdl_t *, const char *fn, int flags, ...);
 
 extern ulong_t dt_popc(ulong_t);
 extern ulong_t dt_popcb(const ulong_t *, ulong_t);
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index e1972aa821e7..775830f64492 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -1317,6 +1317,7 @@ dtrace_close(dtrace_hdl_t *dtp)
 	free(dtp->dt_cpp_argv);
 	free(dtp->dt_cpp_path);
 	free(dtp->dt_ld_path);
+	free(dtp->dt_tracefs_path);
 	free(dtp->dt_sysslice);
 	free(dtp->dt_dofstash_path);
 
diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
index 34b5d8e2467f..670954beb4c9 100644
--- a/libdtrace/dt_prov_dtrace.c
+++ b/libdtrace/dt_prov_dtrace.c
@@ -23,8 +23,6 @@ static const char		funname[] = "";
 
 #define PROBE_FUNC_SUFFIX	"_probe"
 
-#define UPROBE_EVENTS		TRACEFS "uprobe_events"
-
 static const dtrace_pattr_t	pattr = {
 { DTRACE_STABILITY_STABLE, DTRACE_STABILITY_STABLE, DTRACE_CLASS_COMMON },
 { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
@@ -229,11 +227,9 @@ out:
 static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 {
 	if (!dt_tp_probe_has_info(prp)) {
-		char	*spec;
-		char	*fn;
-		FILE	*f;
-		size_t	len;
-		int	fd, rc = -1;
+		char		*spec;
+		FILE		*f;
+		int		fd = -1, rc = -1;
 
 		/* get a uprobe specification for this probe */
 		spec = uprobe_spec(getpid(), prp->desc->prb);
@@ -241,7 +237,8 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 			return -ENOENT;
 
 		/* add a uprobe */
-		fd = open(UPROBE_EVENTS, O_WRONLY | O_APPEND);
+		fd = dt_tracefs_open(dtp, "uprobe_events", O_WRONLY | O_APPEND);
+
 		if (fd != -1) {
 			rc = dprintf(fd, "p:" GROUP_FMT "/%s %s\n",
 				     GROUP_DATA, prp->desc->prb, spec);
@@ -252,16 +249,12 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 			return -ENOENT;
 
 		/* open format file */
-		len = snprintf(NULL, 0, "%s" GROUP_FMT "/%s/format",
-			       EVENTSFS, GROUP_DATA, prp->desc->prb) + 1;
-		fn = dt_alloc(dtp, len);
-		if (fn == NULL)
+		fd = dt_tracefs_open(dtp, "events/" GROUP_FMT "/%s/format",
+				     O_RDONLY, GROUP_DATA, prp->desc->prb);
+		if (fd < 0)
 			return -ENOENT;
 
-		snprintf(fn, len, "%s" GROUP_FMT "/%s/format",
-			 EVENTSFS, GROUP_DATA, prp->desc->prb);
-		f = fopen(fn, "r");
-		dt_free(dtp, fn);
+		f = fdopen(fd, "r");
 		if (f == NULL)
 			return -ENOENT;
 
@@ -296,7 +289,7 @@ static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
 
 	dt_tp_probe_detach(dtp, prp);
 
-	fd = open(UPROBE_EVENTS, O_WRONLY | O_APPEND);
+	fd = dt_tracefs_open(dtp, "uprobe_events", O_WRONLY | O_APPEND);
 	if (fd == -1)
 		return;
 
diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 21f63ddffc73..b5c1f5d22a06 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -43,8 +43,8 @@
 static const char		prvname[] = "fbt";
 static const char		modname[] = "vmlinux";
 
-#define KPROBE_EVENTS		TRACEFS "kprobe_events"
-#define PROBE_LIST		TRACEFS "available_filter_functions"
+#define KPROBE_EVENTS		"kprobe_events"
+#define PROBE_LIST		"available_filter_functions"
 
 #define FBT_GROUP_FMT		GROUP_FMT "_%s"
 #define FBT_GROUP_DATA		GROUP_DATA, prp->desc->prb
@@ -65,6 +65,7 @@ static int populate(dtrace_hdl_t *dtp)
 {
 	dt_provider_t		*prv;
 	dt_provimpl_t		*impl;
+	int			fd;
 	FILE			*f;
 	char			*buf = NULL;
 	char			*p;
@@ -79,7 +80,11 @@ static int populate(dtrace_hdl_t *dtp)
 	if (prv == NULL)
 		return -1;			/* errno already set */
 
-	f = fopen(PROBE_LIST, "r");
+	fd = dt_tracefs_open(dtp, PROBE_LIST, O_RDONLY);
+	if (fd < 0)
+		return 0;
+
+	f = fdopen(fd, "r");
 	if (f == NULL)
 		return 0;
 
@@ -363,16 +368,14 @@ static int kprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 {
 	if (!dt_tp_probe_has_info(prp)) {
-		char	*fn;
-		FILE	*f;
-		size_t	len;
-		int	fd, rc = -1;
+		FILE		*f;
+		int		fd, rc = -1;
 
 		/*
 		 * Register the kprobe with the tracing subsystem.  This will
 		 * create a tracepoint event.
 		 */
-		fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
+		fd = dt_tracefs_open(dtp, KPROBE_EVENTS, O_WRONLY | O_APPEND);
 		if (fd == -1)
 			return -ENOENT;
 
@@ -383,19 +386,13 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 		if (rc == -1)
 			return -ENOENT;
 
-		/* create format file name */
-		len = snprintf(NULL, 0, "%s" FBT_GROUP_FMT "/%s/format",
-			       EVENTSFS, FBT_GROUP_DATA, prp->desc->fun) + 1;
-		fn = dt_alloc(dtp, len);
-		if (fn == NULL)
+		/* open format file */
+		fd = dt_tracefs_open(dtp, "events/" FBT_GROUP_FMT "/%s/format",
+				     O_RDONLY, FBT_GROUP_DATA, prp->desc->fun);
+		if (fd < 0)
 			return -ENOENT;
 
-		snprintf(fn, len, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
-			 FBT_GROUP_DATA, prp->desc->fun);
-
-		/* open format file */
-		f = fopen(fn, "r");
-		dt_free(dtp, fn);
+		f = fdopen(fd, "r");
 		if (f == NULL)
 			return -ENOENT;
 
@@ -431,7 +428,7 @@ static void kprobe_detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
 
 	dt_tp_probe_detach(dtp, prp);
 
-	fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
+	fd = dt_tracefs_open(dtp, KPROBE_EVENTS, O_WRONLY | O_APPEND);
 	if (fd == -1)
 		return;
 
diff --git a/libdtrace/dt_prov_rawtp.c b/libdtrace/dt_prov_rawtp.c
index 778a6f9cde90..6940edce6a6d 100644
--- a/libdtrace/dt_prov_rawtp.c
+++ b/libdtrace/dt_prov_rawtp.c
@@ -38,7 +38,7 @@
 static const char		prvname[] = "rawtp";
 static const char		modname[] = "vmlinux";
 
-#define PROBE_LIST		TRACEFS "available_events"
+#define PROBE_LIST		"available_events"
 
 #define KPROBES			"kprobes"
 #define SYSCALLS		"syscalls"
@@ -64,6 +64,7 @@ static const dtrace_pattr_t	pattr = {
 static int populate(dtrace_hdl_t *dtp)
 {
 	dt_provider_t	*prv;
+	int		fd;
 	FILE		*f;
 	char		*buf = NULL;
 	char		*p;
@@ -73,7 +74,11 @@ static int populate(dtrace_hdl_t *dtp)
 	if (prv == NULL)
 		return -1;			/* errno already set */
 
-	f = fopen(PROBE_LIST, "r");
+	fd = dt_tracefs_open(dtp, PROBE_LIST, O_RDONLY);
+	if (fd < 0)
+		return 0;
+
+	f = fdopen(fd, "r");
 	if (f == NULL)
 		return 0;
 
diff --git a/libdtrace/dt_prov_sdt.c b/libdtrace/dt_prov_sdt.c
index 675e0458ca4c..7ebe010efa79 100644
--- a/libdtrace/dt_prov_sdt.c
+++ b/libdtrace/dt_prov_sdt.c
@@ -36,7 +36,7 @@
 static const char		prvname[] = "sdt";
 static const char		modname[] = "vmlinux";
 
-#define PROBE_LIST		TRACEFS "available_events"
+#define PROBE_LIST		"available_events"
 
 #define KPROBES			"kprobes"
 #define SYSCALLS		"syscalls"
@@ -62,6 +62,7 @@ static const dtrace_pattr_t	pattr = {
 static int populate(dtrace_hdl_t *dtp)
 {
 	dt_provider_t	*prv;
+	int		fd;
 	FILE		*f;
 	char		*buf = NULL;
 	char		*p;
@@ -71,7 +72,11 @@ static int populate(dtrace_hdl_t *dtp)
 	if (prv == NULL)
 		return -1;			/* errno already set */
 
-	f = fopen(PROBE_LIST, "r");
+	fd = dt_tracefs_open(dtp, PROBE_LIST, O_RDONLY);
+	if (fd < 0)
+		return 0;
+
+	f = fdopen(fd, "r");
 	if (f == NULL)
 		return 0;
 
@@ -192,16 +197,16 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 static int probe_info_tracefs(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 			      int *argcp, dt_argdesc_t **argvp)
 {
+	int				fd;
 	FILE				*f;
-	char				*fn;
 	int				rc;
 	const dtrace_probedesc_t	*pdp = prp->desc;
 
-	if (asprintf(&fn, EVENTSFS "%s/%s/format", pdp->mod, pdp->prb) == -1)
-		return dt_set_errno(dtp, EDT_NOMEM);
+	fd = dt_tracefs_open(dtp, "events/%s/%s/format", O_RDONLY, pdp->mod, pdp->prb);
+	if (fd < 0)
+		return -ENOENT;
 
-	f = fopen(fn, "r");
-	free(fn);
+	f = fdopen(fd, "r");
 	if (!f)
 		return -ENOENT;
 
@@ -223,15 +228,18 @@ static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 	int			argc = 0;
 	dt_argdesc_t		*argv = NULL;
 	dtrace_typeinfo_t	sym;
+	int			fd;
 	FILE			*f;
 	uint32_t		id;
 
 	/* Retrieve the event id. */
-	if (asprintf(&str, EVENTSFS "%s/%s/id", prp->desc->mod, prp->desc->prb) == -1)
-		return dt_set_errno(dtp, EDT_NOMEM);
 
-	f = fopen(str, "r");
-	free(str);
+	fd = dt_tracefs_open(dtp, "events/%s/%s/id", O_RDONLY,
+			     prp->desc->mod, prp->desc->prb);
+	if (fd < 0)
+		return dt_set_errno(dtp, EDT_ENABLING_ERR);
+
+	f = fdopen(fd, "r");
 	if (!f)
 		return dt_set_errno(dtp, EDT_ENABLING_ERR);
 
diff --git a/libdtrace/dt_prov_syscall.c b/libdtrace/dt_prov_syscall.c
index 20843c6f538e..63ce3bc43ae1 100644
--- a/libdtrace/dt_prov_syscall.c
+++ b/libdtrace/dt_prov_syscall.c
@@ -38,7 +38,7 @@
 static const char		prvname[] = "syscall";
 static const char		modname[] = "vmlinux";
 
-#define SYSCALLSFS		EVENTSFS "syscalls/"
+#define SYSCALLSFS		"events/syscalls/"
 
 /*
  * We need to skip over an extra field: __syscall_nr.
@@ -61,7 +61,7 @@ struct syscall_data {
 
 #define SCD_ARG(n)	offsetof(struct syscall_data, arg[n])
 
-#define PROBE_LIST	TRACEFS "available_events"
+#define PROBE_LIST	"available_events"
 
 #define PROV_PREFIX	"syscalls:"
 #define ENTRY_PREFIX	"sys_enter_"
@@ -71,6 +71,7 @@ struct syscall_data {
 static int populate(dtrace_hdl_t *dtp)
 {
 	dt_provider_t	*prv;
+	int		fd;
 	FILE		*f;
 	char		*buf = NULL;
 	size_t		n;
@@ -79,7 +80,11 @@ static int populate(dtrace_hdl_t *dtp)
 	if (prv == NULL)
 		return -1;			/* errno already set */
 
-	f = fopen(PROBE_LIST, "r");
+	fd = dt_tracefs_open(dtp, PROBE_LIST, O_RDONLY);
+	if (fd < 0)
+		return 0;
+
+	f = fdopen(fd, "r");
 	if (f == NULL)
 		return 0;
 
@@ -195,23 +200,21 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 		      int *argcp, dt_argdesc_t **argvp)
 {
+	int		fd;
 	FILE		*f;
-	char		fn[256];
 	int		rc;
 
 	/*
 	 * We know that the probe name is either "entry" or "return", so we can
 	 * just check the first character.
 	 */
-	strcpy(fn, SYSCALLSFS);
-	if (prp->desc->prb[0] == 'e')
-		strcat(fn, "sys_enter_");
-	else
-		strcat(fn, "sys_exit_");
-	strcat(fn, prp->desc->fun);
-	strcat(fn, "/format");
+	fd = dt_tracefs_open(dtp, SYSCALLSFS "/sys_%s_%s/format", O_RDONLY,
+			     (prp->desc->prb[0] == 'e') ? "enter" : "exit",
+			     prp->desc->fun);
+	if (fd < 0)
+		return -ENOENT;
 
-	f = fopen(fn, "r");
+	f = fdopen(fd, "r");
 	if (!f)
 		return -ENOENT;
 
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 205014617586..6a02243ff572 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -1116,13 +1116,13 @@ static char *uprobe_name(dev_t dev, ino_t ino, uint64_t addr, int flags)
  * uprobe may be a uretprobe.  Return the probe's name as
  * a new dynamically-allocated string, or NULL on error.
  */
-static char *uprobe_create(dev_t dev, ino_t ino, const char *mapping_fn,
-			   uint64_t addr, int flags)
+static char *uprobe_create(dtrace_hdl_t *dtp, dev_t dev, ino_t ino,
+			   const char *mapping_fn, uint64_t addr, int flags)
 {
-	int	fd = -1;
-	int	rc = -1;
-	char	*name;
-	char	*spec;
+	int		fd = -1;
+	int		rc = -1;
+	char		*name;
+	char		*spec;
 
 	if (asprintf(&spec, "%s:0x%lx", mapping_fn, addr) < 0)
 		return NULL;
@@ -1132,8 +1132,8 @@ static char *uprobe_create(dev_t dev, ino_t ino, const char *mapping_fn,
 		goto out;
 
 	/* Add the uprobe. */
-	fd = open(TRACEFS "uprobe_events", O_WRONLY | O_APPEND);
-	if (fd == -1)
+	fd = dt_tracefs_open(dtp, "uprobe_events", O_WRONLY | O_APPEND);
+	if (fd < 0)
 		goto out;
 
 	rc = dprintf(fd, "%c:%s %s\n", flags & PP_IS_RETURN ? 'r' : 'p', name, spec);
@@ -1153,8 +1153,8 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
 {
 	dt_uprobe_t	*upp = uprp->prv_data;
 	tp_probe_t	*tpp = upp->tp;
+	int		fd;
 	FILE		*f;
-	char		*fn;
 	char		*prb = NULL;
 	int		rc = -1;
 
@@ -1163,7 +1163,7 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
 
 	assert(upp->fn != NULL);
 
-	prb = uprobe_create(upp->dev, upp->inum, upp->fn, upp->off,
+	prb = uprobe_create(dtp, upp->dev, upp->inum, upp->fn, upp->off,
 			    upp->flags);
 
 	/*
@@ -1177,12 +1177,12 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
 				  upp->flags);
 
 	/* open format file */
-	rc = asprintf(&fn, "%s%s/format", EVENTSFS, prb);
+	fd = dt_tracefs_open(dtp, "events/%s/format", O_RDONLY, prb);
 	free(prb);
-	if (rc < 0)
+	if (fd < 0)
 		return -ENOENT;
-	f = fopen(fn, "r");
-	free(fn);
+
+	f = fdopen(fd, "r");
 	if (f == NULL)
 		return -ENOENT;
 
@@ -1251,21 +1251,20 @@ done:
  * Destroy a uprobe for a given device and address.
  */
 static int
-uprobe_delete(dev_t dev, ino_t ino, uint64_t addr, int flags)
+uprobe_delete(dtrace_hdl_t *dtp, dev_t dev, ino_t ino, uint64_t addr, int flags)
 {
-	int	fd = -1;
-	int	rc = -1;
-	char	*name;
+	int		fd = -1;
+	int		rc = -1;
+	char		*name;
 
 	name = uprobe_name(dev, ino, addr, flags);
 	if (!name)
 		goto out;
 
-	fd = open(TRACEFS "uprobe_events", O_WRONLY | O_APPEND);
+	fd = dt_tracefs_open(dtp, "uprobe_events", O_WRONLY | O_APPEND);
 	if (fd == -1)
 		goto out;
 
-
 	rc = dprintf(fd, "-:%s\n", name);
 
 out:
@@ -1297,7 +1296,7 @@ static void detach(dtrace_hdl_t *dtp, const dt_probe_t *uprp)
 
 	dt_tp_detach(dtp, tpp);
 
-	uprobe_delete(upp->dev, upp->inum, upp->off, upp->flags);
+	uprobe_delete(dtp, upp->dev, upp->inum, upp->off, upp->flags);
 }
 
 /*
diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
index 8f143dceaed7..4598a380b950 100644
--- a/libdtrace/dt_provider.h
+++ b/libdtrace/dt_provider.h
@@ -12,7 +12,6 @@
 #include <dt_impl.h>
 #include <dt_ident.h>
 #include <dt_list.h>
-#include <tracefs.h>
 
 #ifdef	__cplusplus
 extern "C" {
diff --git a/libdtrace/dt_subr.c b/libdtrace/dt_subr.c
index d5dca164861e..f129e5591465 100644
--- a/libdtrace/dt_subr.c
+++ b/libdtrace/dt_subr.c
@@ -20,6 +20,7 @@
 #include <assert.h>
 #include <limits.h>
 #include <sys/ioctl.h>
+#include <mntent.h>
 #include <port.h>
 
 #include <dt_impl.h>
@@ -998,3 +999,82 @@ uint32_t dt_gen_hval(const char *p, uint32_t hval, size_t len)
 
 	return hval;
 }
+
+/*
+ * Find the tracefs and store it away in dtp.
+ */
+static int
+find_tracefs_path(dtrace_hdl_t *dtp)
+{
+	FILE *mounts;
+	struct mntent *mnt;
+
+	if ((mounts = setmntent("/proc/mounts", "r")) == NULL) {
+		dt_dprintf("Cannot open /proc/mounts: %s\n", strerror(errno));
+		return dt_set_errno(dtp, EDT_TRACEFS);
+	}
+
+	while ((mnt = getmntent(mounts)) != NULL) {
+		/*
+		 * Only accept tracefs paths that do not contain percent
+		 * characters in their mounted paths, since we use this
+		 * to augment a format string in dt_tracefs_vfn().
+		 */
+		if ((strcmp(mnt->mnt_type, "tracefs") == 0) &&
+		    (strchr(mnt->mnt_dir, '%') == NULL)) {
+			dtp->dt_tracefs_path = strdup(mnt->mnt_dir);
+			break;
+		}
+	}
+	endmntent(mounts);
+
+	if (!dtp->dt_tracefs_path) {
+		dt_dprintf("Cannot find a suitable tracefs path.\n");
+		return dt_set_errno(dtp, EDT_TRACEFS);
+	}
+
+	dt_dprintf("Found tracefs at %s\n", dtp->dt_tracefs_path);
+
+	return 0;
+}
+
+static char *
+dt_tracefs_vfn(dtrace_hdl_t *dtp, const char *fn, va_list ap)
+{
+	char *full_fn;
+	char *str;
+
+	if (!dtp->dt_tracefs_path)
+		if (find_tracefs_path(dtp) < 0)
+			return NULL;		/* errno is set for us. */
+
+	if (asprintf(&full_fn, "%s/%s", dtp->dt_tracefs_path, fn) < 0) {
+		dt_set_errno(dtp, EDT_NOMEM);
+		return NULL;
+	}
+
+	if (vasprintf(&str, full_fn, ap) < 0) {
+		str = NULL;
+		dt_set_errno(dtp, EDT_NOMEM);
+	}
+	free(full_fn);
+	return str;
+}
+
+int
+dt_tracefs_open(dtrace_hdl_t *dtp, const char *fn, int flags, ...)
+{
+	va_list ap;
+	char *str;
+	int fd;
+
+	va_start(ap, flags);
+	if ((str = dt_tracefs_vfn(dtp, fn, ap)) == NULL) {
+		va_end(ap);
+		return -1; 			/* errno is set for us. */
+	}
+
+	fd = open(str, flags, 0666);
+	free(str);
+	return fd;				/* errno is set for us. */
+}
diff --git a/runtest.sh b/runtest.sh
index 46b532d7e161..fbf4e60c82a9 100755
--- a/runtest.sh
+++ b/runtest.sh
@@ -607,6 +607,14 @@ elif ! /usr/bin/cpp -x c -fno-show-column - /dev/null < /dev/null 2>&1 | \
     export DTRACE_OPT_CPPARGS="-fno-show-column"
 fi
 
+# Find the tracefs.
+tracefs="$(awk '$3 == "tracefs" { print $2; exit; }' /proc/mounts)"
+if [[ -z $tracefs ]]; then
+    echo "Cannot find any tracefs mounts in /proc/mounts.  Some tests will fail." >&2
+fi
+
+export tracefs
+
 # More than one dtrace tree -> run tests for all dtraces, and verify identical
 # intermediate code is produced by each dtrace.
 
diff --git a/test/unittest/funcs/tst.rw_.x b/test/unittest/funcs/tst.rw_.x
index 29c581116154..5737c7575a26 100755
--- a/test/unittest/funcs/tst.rw_.x
+++ b/test/unittest/funcs/tst.rw_.x
@@ -1,6 +1,11 @@
 #!/bin/sh
 
-FUNCS=/sys/kernel/debug/tracing/available_filter_functions
+FUNCS=${tracefs}/available_filter_functions
+
+if [[ ! -e $FUNCS ]]; then
+	echo no tracefs found
+	exit 1
+fi
 
 if ! grep -qw  _raw_read_lock $FUNCS; then
         echo no _raw_read_lock FBT probe due to kernel config
diff --git a/test/unittest/providers/tst.dtrace_cleanup.sh b/test/unittest/providers/tst.dtrace_cleanup.sh
index 4ac59ccb4315..f3e434ae76fc 100755
--- a/test/unittest/providers/tst.dtrace_cleanup.sh
+++ b/test/unittest/providers/tst.dtrace_cleanup.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2020, 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2020, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -14,7 +14,12 @@
 ##
 
 dtrace=$1
-UPROBE_EVENTS=/sys/kernel/debug/tracing/uprobe_events
+UPROBE_EVENTS=${tracefs}/uprobe_events
+
+if [[ ! -e $UPROBE_EVENTS ]]; then
+	echo "no tracefs/uprobe_events" >&2
+	exit 67
+fi
 
 out=/tmp/output.$$
 $dtrace $dt_flags -n BEGIN,END &>> $out &
diff --git a/test/utils/clean_probes.sh b/test/utils/clean_probes.sh
index 8292b3096424..cfd100088eb7 100755
--- a/test/utils/clean_probes.sh
+++ b/test/utils/clean_probes.sh
@@ -1,9 +1,13 @@
 #!/usr/bin/bash
 
-TRACEFS=/sys/kernel/debug/tracing
-EVENTS=${TRACEFS}/available_events
-KPROBES=${TRACEFS}/kprobe_events
-UPROBES=${TRACEFS}/uprobe_events
+EVENTS=${tracefs}/available_events
+KPROBES=${tracefs}/kprobe_events
+UPROBES=${tracefs}/uprobe_events
+
+# We can't work without the tracefs: just give up quietly.
+if [[ ! -e $EVENTS ]]; then
+    exit 0
+fi
 
 # Check permissions
 if [[ ! -r ${EVENTS} ]]; then
-- 
2.46.0.278.g36e3a12567

