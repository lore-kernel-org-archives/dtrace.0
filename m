Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41461A76DA
	for <dtrace@lists.linux.dev>; Fri,  7 Mar 2025 21:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741383248; cv=fail; b=SYwY4ICKAd7OrKUvRB+1IPwZAl4IxnXeh63ZkQ93aWOzUO6saQQovu4vx17inYYrvhVvbgz/D4ppzmPGTZGN1eBXJaEHwfHvCuadK4GZOANPefgtqwDVyOdTpWkU0Osc6KDyExuQfygbvEb3Kk5Glw8HF5bh2YBUs/F9M5reiH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741383248; c=relaxed/simple;
	bh=JI4Qwaj0bO3nvBsBUBYqzSz+I+FDnIHkyLMZp/T3+Is=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=bLogaCJp5efwo2m5/FXkrMbAV40HoaCW0Rrj+hdut2P8qFqvxctEilNXfJVhokIbC6IUqJJpGmWfJuebvo5wOcma8vVkTGo9TXJrbvQy3dC65P+sstiHWTqmJLf2ZBEOE0KDCi4bv2r8KyjczeCBJm5VS/Rta8jGg6oxsnbWNPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Sn9gg8KI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IHIrfUh1; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Sn9gg8KI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IHIrfUh1"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 527LI6tM010052
	for <dtrace@lists.linux.dev>; Fri, 7 Mar 2025 21:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=xr/mhh4QMBMQ5rOk
	irtvo5wbfQ7DCLIm9Bi0QWFCIOc=; b=Sn9gg8KI+gwjgasd8uhu//xQamex5dU7
	RNCJ31UWID4wU5y/Ut7suXqt5vB375ip7WSeud1h2fzupShIzXwo31kPHuPn7lCc
	SA6LwwtHd044Yf7y0Shf8oLjOUiqW9PEJ+V5jpS3FB1BxK0qSiAg/WxPGGsJOsIE
	eCkZCI28khosuLXvUz+7D6jLGezq9EFLfkF7bWjA/1G9us7zj6Gyoe/UxEYzIh09
	ZshK/OcX2JWxijh0qReBrE2SDeW7eo5q2gORfiru/i3b+TqzFuH4HpjwHlhwvWFe
	mqdub2LC1OcUq29EdHOo6KgRnyqwn/lJETfHWIyb1Fi2IGJn2KaA+A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 453u8hn445-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Mar 2025 21:34:05 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 527KqqSm039727
	for <dtrace@lists.linux.dev>; Fri, 7 Mar 2025 21:34:04 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 453rpeqxs5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Mar 2025 21:34:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRfEJltM5siEOYHm6/uBgOAsFaYhSTRqCRQGcHlKDA6MxTv6e3DCiHB6E0kmNZXLSXh68qjqYrfz4eOD115TkhSrObGHiu8g4KTND+LFMneyJH0sjV6St7GszQ64HY67pp0I5/6eB5vrfun2xTkosyZs1UeKKx6Jh/cof7ZkcS7ajdgf053Q6X/lfosHTjGsSB+qf4vb86HOcykbjJ5ezUCYngpfJmVcCHehEO89slP5Q3vZethqGOCxWoPCA0aRBOkjy8STwZPajon3O8Ei4TlTum6i8U3BdDDFpE7/IQDFE2EaMF06jEu5AS2lW/2is0q7uoav+MNSwcmA7KiwUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xr/mhh4QMBMQ5rOkirtvo5wbfQ7DCLIm9Bi0QWFCIOc=;
 b=JA4MMHPKO6QX3dlElbroDD4nKIWd1EjV2oeNcCtoDu13GRHk2TwN+v5HW+cszn8uSV366AS4yJshFAPOSPr8QzaVtE8Fv/Poa7DVfMMBAnJo8v90UCAYzuLrO+LIb9msDe8+qcU9Fn/O8YjSQR2Tmypaa3SxAbf8M7qRgEr0rZcQy7R/doggPCgTq4VaVcUwo5PFHAkELuiYOS3dYPbI/REckMO9QzEDZvD9szxUxNG5Dj8Kv6JyDUSsTyhu8ZSt6NHo8OJp+J0ImL4YgzR/KheTyyXHAsicDpcSe3iZ+WL2vPXFa/hZEB12po1QnYyOWKrux9nkAZegrBCqFfXNVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xr/mhh4QMBMQ5rOkirtvo5wbfQ7DCLIm9Bi0QWFCIOc=;
 b=IHIrfUh17IYPoKs3RnjH38461X2t+3Jc+qVgEyB4qCd6Rf0cKAEhSgoHK4georH5TVEh76XyMe+qObxZ/RzuHdzibulEXVGASnJxlWM6f/ARQTKofDEgsPyPH8H2NYNqos2uE2JLrWnvo0/Oe+hhfChQMm6MdseSq4+z96JIdLQ=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SN7PR10MB7029.namprd10.prod.outlook.com (2603:10b6:806:346::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 21:34:01 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8511.019; Fri, 7 Mar 2025
 21:34:00 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH 1/8] proc: convert to use standard SDT provider implementation
Date: Fri,  7 Mar 2025 16:33:20 -0500
Message-ID: <20250307213320.9439-1-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR07CA0029.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::39) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SN7PR10MB7029:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b1897b5-62c4-4f9a-e00c-08dd5dbfc691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?stW26CosstzPDQYyuC3KWQX5RsWWq0oTZ2Pr3xjZuq1rqmlCOc0VVjWCvukn?=
 =?us-ascii?Q?kivEZfkxqGYujLR3B+D3GZvo/FUBoX1GIp2ZspLLOkG6shubf9DkSPxKXYi7?=
 =?us-ascii?Q?sTjFFI7YQ/cs5M6BSBs9KLLm47Qh08Det5Tncku7ACaW5cFSR+tNe/GGzW9O?=
 =?us-ascii?Q?w+y59IdStdwgt8pLeDOW2MKHEl7X640qwaEK5sJMx31eynIUZgtm2HDWw9zF?=
 =?us-ascii?Q?JGi75mDtMHO9+zDOE86KR8DLFktaJiixJr6yF1qG2B/nopTiAoaXvbwqpemz?=
 =?us-ascii?Q?L7LUFQU26fni5hTh2kVOWkpoBZLYwcExa/6i5mwjcFJTjxnC6YcanxKyG2Cd?=
 =?us-ascii?Q?RyGjzmW4P4/zqO6/anbJTrGpbdb0j4MIidA9nTTkv8uL9YRwKpkyDXODYHb+?=
 =?us-ascii?Q?7YguUcs476rzJyr5ucfKbq4XXQvApZm0ogbrEmSvahXveLl4mfyAlc6/gqg5?=
 =?us-ascii?Q?CwJrP+JonVFxy0FaT3IxSL5byQ5ga07rY1rKrhgzqkW6mxkg9qQCjgUsWJt8?=
 =?us-ascii?Q?I6EXu/ImzTUAcecc3v8CYHzUvwwoxKyH+dc5j9vN1C8uLYmAATmzjuRQ7Aq4?=
 =?us-ascii?Q?gsJ19qYs5aW9SRTfAB/madvmWoldmr0PTevLI/9OZ8K5pENMjRF8ZUgIHlOy?=
 =?us-ascii?Q?JiHEYAuutq5Xpi2dGJldjSpJgusboHrgNg4xFp+GDxowixCFYOpH/kSx6Z0p?=
 =?us-ascii?Q?n03BLw/Qi+MSKvAiQeEa36TEnZNSKOY3q035CZk9Xpyhyv/us7CNAmfSs84h?=
 =?us-ascii?Q?+yT/rpkJuVCKv5p61n8NYgn+yKbGGUqfh5ANyr+4vwywDr0NZ9FU7EeFnU/7?=
 =?us-ascii?Q?jMCEfMGnNkpHIeWw2mtrSZjbMXrAYZfyx03XhCkLktdLXJOMscFXtuJbmobt?=
 =?us-ascii?Q?nF7RBrFI4QsxQDItG0cu+61K0ZkT/0Nks8jEsI6GAdIb7YRP+7En97Mw2i7R?=
 =?us-ascii?Q?5lWh+XqVczuTqotrgWupOdFAEgtFUVHtC0cVpSYcmqT/QRgJJg4mQrgkORpp?=
 =?us-ascii?Q?s4ZwlzO9fcnDPQumZ20ZVRU+JRGYy8iutjVV1IX7b8iSLOifI96NOlmlQAs8?=
 =?us-ascii?Q?y12RCFMxUNAQykMT/UpGlcB019arrhVyxTP5C0eB00ZHscPMpRHzkoOurn1j?=
 =?us-ascii?Q?O6IOLKbgtwnbLNhL3IsXGQIUgGsXNu+5ooXXJGAospKENUr9DKeAOiw/p2hh?=
 =?us-ascii?Q?r1AY5M+y4ryBci3EuQmYLgw6nyR6zATskHC6xPXnPE6qXmpucEvU87qNMpFf?=
 =?us-ascii?Q?3+c1MV7muYEDTBSKN3XreQw6cLZdvIzz9E5joLIFzhfLlTq4ck5l5aMag54N?=
 =?us-ascii?Q?4nJW12JaZnDgboL1wySdlkwUMAzBrd2tRjKaoaLXszV9kr8ClPiRAOADJENL?=
 =?us-ascii?Q?M0J63eKilpZQbQfQo/90dvkAI4h9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GJxpKDkgzxBN0c9D+Aqp1X0QkY/vLVkAzMkx1uIHueFcUkNumzmCeFOLXhpT?=
 =?us-ascii?Q?eXewbpJ4pjAZhoX+Jc7+V9nC1Zgu+YCU6c8KDa4DG4Mj8FARHgXgbmvcjx+2?=
 =?us-ascii?Q?m2pVptIp7WbCrruFfrphXaHWGKb3Pu1LYnyylLqWLhMZ6U5zac2XrMkEZ5Ui?=
 =?us-ascii?Q?M2rTq41oSl5xhqF38pXat+hgaXW7Hx4Rth9tmBTHsnwamir9Dq2XzrdaPzpO?=
 =?us-ascii?Q?Fh8V5zt0Y9MV5KfSlYFgVsKhRdD6Oab5Aua1QFsLyvgzDSiqoLSTXHzQZKEM?=
 =?us-ascii?Q?6fXF/8NEbjCo15KTElW/NNNn65oLdILshuXQ9kus4mr6X5tWj2FM8LGzigbA?=
 =?us-ascii?Q?gAR19c0UyhHum/UqlcWuUC6/5T/LXffPJBMDqoKrwJ5edRhYY6x2vUiggObf?=
 =?us-ascii?Q?wdKJ06Vwr+Je3/PB/oHqdVofxu4NvXcxll0PQ2LtmErjByNDz0biMT9FzwmG?=
 =?us-ascii?Q?KNDDaQc/4QSkxOClFWA9vzUvwTCRddAKgUTW7V3ddXJvi/95FcPgU80v5t2R?=
 =?us-ascii?Q?mPEc9te0BI1OTBjncgEt/ZH+ZKfMwC2hL26Fii8zyJDmAgQbyHKoQe+5NX4o?=
 =?us-ascii?Q?euhAInUGkqJG8ttiNrVs24A2dwe7YmW3O2Hr+lOp4iHT+IPhmb5n8FgLx/aN?=
 =?us-ascii?Q?CYJgJ7gC0EdN6OyxhLPD1WlL1L7I7focftlMAEeh1btKTp3igHg6DJmH1u6V?=
 =?us-ascii?Q?kMfjKkmrsTKFXQns0zZl/ugFIjcVSuqIH/QLYpT4mvOiqIZ+FqMZYH2uNvcf?=
 =?us-ascii?Q?PD/lvNKa1mIr0UgQLmI5dUCp1x8TBkO3U5rja71/D0tOJaFLpvht42Uh8nER?=
 =?us-ascii?Q?R6n8Ocjb5yoh3ImCHkoynfUe0YDUbo78yUcPrwzfwIIryDtCCuhU034wildl?=
 =?us-ascii?Q?xpFrP8WHr5bx6qVc/4i1cgPAR1M5dVAQ9EyFQgyCgqKJClXQU4gllhJB7iIA?=
 =?us-ascii?Q?38JeijJWaIrSYL4wZTbb8UshgGzd/ZNL+81TTt1VRk06KZTpU5LfWUxCyRia?=
 =?us-ascii?Q?KVl5hhbVvbapv2EiBPhzgKYuLeQWtiKjuLsYxkNleyoO2I9Q71GEe4sAoSXG?=
 =?us-ascii?Q?nRu2bsAoflnKV5LKz/CYeE4SmTrfCjSuYUzWBKkpuh/I7IPQbmQvdV3IzfVw?=
 =?us-ascii?Q?yJsd486zwWRp+KalIE9V5QaIsMFLHEFsP1PWnWXNB9A5dxWA9y/Br8T35g6l?=
 =?us-ascii?Q?IxauOvBY+2PGn+w+dveHWo97iPojTmHdwOTEyevKckQZgXtmadPDanCFgRGJ?=
 =?us-ascii?Q?Sz+amEeD27/b62SBzRjZC8kqM2hz77Ve6XrXUJpiTfr20KvonFmLG1mI9tEE?=
 =?us-ascii?Q?AizVdmAlmD7YGPvqq5mIrbcL4sLJ3wDtyu4Y8YqoNzx0i/iDonDVzJLBsodn?=
 =?us-ascii?Q?NLEvqrQPMfhzRApbyDjhKdJN8JcvnIhn+wMR7uoWcgjLzwPi2OtkBoeXQzoF?=
 =?us-ascii?Q?wduyKwj4wZ1QuarZ1JfI6rqp2+r0bEIAmT7iZ9fXVDuXEjG/McuK++9/Q3si?=
 =?us-ascii?Q?Z2Kgv9LW63TTYERcqi3qK819JNWVr7a9IlkDRVTnxMLpIS490665G0mp9GjG?=
 =?us-ascii?Q?q0dfvBswlRXQ21SUT6d+6uPVOXRCmUdRtmBddgLgawyE+6EFwU6PL+3YC9qr?=
 =?us-ascii?Q?jGZZchojtOXczl+yUcIG6dc=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	r8iNIiVMpqE4SZO9TJm78TVOO9ClAX+63rsoqohkFL+kJX7qdK/GfCk4CWd7YvW6PHRti7yvyuJBICOMIO1YWVD81swDiHx5lF4zT4mWY0KH8S8iucouv7HkZ0K5T0KPA4aGMSBlrecnadGDiIU4v/eGd+qqSe6mrAvC1k+iPBsr6iPf5AYazzsK133hNxkHjZVTN1KwP3yZvZTRGbx3LSgT+RLUuqIgh+xzO2d7xfjG5AWh3mPLA8Dz+1bVf/91e6QAFK+NuKOhnCUudCrdW/nMN0tTURmICHVzIKlXUDmrVpoGvEX3C+4lXZKoldVK/21pSs91SJRHAcq8xabx6wKUQxar6Uei/Bhfcxh5XrFVYa4m8CHKAfDSXkUWjJrhfo7CcGbHYnEpl87FUBC46/hGjTJE91RnczAECoO1rSya83XzI0kgyhdi584RskY8sT42HWNKEAsVCHvBzNo2hl41EsyZyqxrZmZVC6o2BbDbg53GOL15QmiUbqfyYYrAbbaLppGPCq5z0GYa1ZSwd3b8m9n+I6GzvLt+KPcKnNnps0gyYjsLIklbtst6hEHjlhb3QN2VGrr5Zgkx7Ax8WRVym4jhxwNpM6YX9/+gQ5E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1897b5-62c4-4f9a-e00c-08dd5dbfc691
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 21:34:00.9215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nbyyCDAIRcmZUpXttNRV0cSOftreEviHVoVB9FjPk2cyqiP9+U1WdBX71yClWXlaAwR2iepFFO3XgO54vFO0+wlqdW+BpUjv/d+sTHP3KaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7029
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_08,2025-03-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2503070163
X-Proofpoint-GUID: BORleNc6LLy2CCL1rJI7VpdWSEQMd5e1
X-Proofpoint-ORIG-GUID: BORleNc6LLy2CCL1rJI7VpdWSEQMd5e1

The prov provider was the first SDT-based provider implememted in this
version, and therefore handled the enabling of probes with custom code.
When the other SDT-based providers (sched, ...) were implemented, a
generic SDT-framework was developed.

The proc provider now uses the SDT-framework.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_proc.c | 316 +++++----------------------------------
 1 file changed, 36 insertions(+), 280 deletions(-)

diff --git a/libdtrace/dt_prov_proc.c b/libdtrace/dt_prov_proc.c
index 2e514860..15fde6c9 100644
--- a/libdtrace/dt_prov_proc.c
+++ b/libdtrace/dt_prov_proc.c
@@ -8,77 +8,45 @@
  */
 #include <assert.h>
 #include <errno.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <unistd.h>
-#include <sys/ioctl.h>
-#include <linux/bpf.h>
-#include <linux/perf_event.h>
-#include <sys/stat.h>
-#include <sys/types.h>
-
-#include <bpf_asm.h>
 
 #include "dt_dctx.h"
 #include "dt_cg.h"
+#include "dt_provider_sdt.h"
 #include "dt_probe.h"
-#include "dt_pt_regs.h"
 
 static const char		prvname[] = "proc";
 static const char		modname[] = "vmlinux";
 
-/*
- * The proc-provider probes make use of probes that are already provided by
- * other providers.  As such, the proc probes are 'dependent probes' because
- * they depend on underlying probes to get triggered and they also depend on
- * argument data provided by the underlying probe to manufacture their own
- * arguments.
- *
- * As a type of SDT probes, proc probes are defined with a signature (list of
- * arguments - possibly empty) that may use translator support to provide the
- * actual argument values.  Therefore, obtaining the value of arguments for
- * a proc probe goes through two layers of processing:
- *
- *  (1) the arguments of the underlying probe are reworked to match the
- *	expected layout of raw arguments for the proc probe
- *  (2) an argument mapping table (and supporting translators) is used to get
- *	the value of an arguument based on the raw variable data of the proc
- *	probe
- *
- * To accomplish this, proc probes generate a trampoline that rewrites the
- * arguments of the underlying probe.  (The dependent probe support code in the
- * underlying probe saves the arguments of the underying probe in the mstate
- * before executing the trampoline and clauses of the dependent probe, and it
- * restores them afterwards in case there are multiple dependent probes.)
- *
- * Because proc probes dependent on an underlying probe that may be too generic
- * (e.g. proc:::exec-success depending on syscall::execve*:return), the
- * trampoline code can include a pre-condition (much like a predicate) that can
- * bypass execution unless the condition is met (e.g. proc:::exec-success
- * requires syscall::execve*:return's arg1 to be 0).
- *
- * FIXME:
- * The dependent probe support should include a priority specification to drive
- * the order in which dependent probes are added to the underlying probe.  This
- * is needed to enforce specific probe firing semantics (e.g. proc:::start must
- * always precede proc:::lwp-start).
- */
-
-typedef struct probe_arg {
-	const char	*name;			/* name of probe */
-	int		argno;			/* argument number */
-	dt_argdesc_t	argdesc;		/* argument description */
-} probe_arg_t;
+static probe_dep_t	probes[] = {
+	{ "create",
+	  DTRACE_PROBESPEC_NAME,	"rawtp:sched::sched_process_fork" },
+	{ "exec",
+	  DTRACE_PROBESPEC_NAME,	"syscall::execve*:entry" },
+	{ "exec-failure",
+	  DTRACE_PROBESPEC_NAME,	"syscall::execve*:return" },
+	{ "exec-success",
+	  DTRACE_PROBESPEC_NAME,	"syscall::execve*:return" },
+	{ "exit",
+	  DTRACE_PROBESPEC_NAME,	"rawtp:sched::sched_process_exit" },
+	{ "lwp-create",
+	  DTRACE_PROBESPEC_NAME,	"rawtp:sched::sched_process_fork" },
+	{ "lwp-exit",
+	  DTRACE_PROBESPEC_NAME,	"rawtp:sched::sched_process_exit" },
+	{ "lwp-start",
+	  DTRACE_PROBESPEC_NAME,	"fbt::schedule_tail:return" },
+	{ "signal-clear",
+	  DTRACE_PROBESPEC_NAME,	"syscall::rt_sigtimedwait:return" },
+	{ "signal-discard",
+	  DTRACE_PROBESPEC_NAME,	"rawtp:signal::signal_generate" },
+	{ "signal-handle",
+	  DTRACE_PROBESPEC_NAME,	"rawtp:signal::signal_deliver" },
+	{ "signal-send",
+	  DTRACE_PROBESPEC_NAME,	"fbt::complete_signal:entry" },
+	{ "start",
+	  DTRACE_PROBESPEC_NAME,	"fbt::schedule_tail:return" },
+	{ NULL, }
+};
 
-/*
- * Probe signature specifications
- *
- * This table *must* group the arguments of probes.  I.e. the arguments of a
- * given probe must be listed in consecutive records.
- * A single probe entry that mentions only name of the probe indicates a probe
- * that provides no arguments.
- */
 static probe_arg_t probe_args[] = {
 	{ "create", 0, { 0, 0, "struct task_struct *", "psinfo_t *" } },
 	{ "exec", 0, { 0, DT_NF_USERLAND, "string", } },
@@ -100,6 +68,7 @@ static probe_arg_t probe_args[] = {
 	{ "signal-send", 1, { 0, 0, "struct task_struct *", "psinfo_t *" } },
 	{ "signal-send", 2, { 1, 0, "int", } },
 	{ "start", },
+	{ NULL, },
 };
 
 static const dtrace_pattr_t	pattr = {
@@ -115,173 +84,8 @@ static const dtrace_pattr_t	pattr = {
  */
 static int populate(dtrace_hdl_t *dtp)
 {
-	dt_provider_t	*prv;
-	int		i;
-	int		n = 0;
-
-	prv = dt_provider_create(dtp, prvname, &dt_proc, &pattr, NULL);
-	if (prv == NULL)
-		return -1;			/* errno already set */
-
-	/*
-	 * Create "proc" probes based on the probe_args list.  Since each probe
-	 * will have at least one entry (with argno == 0), we can use those
-	 * entries to identify the probe names.
-	 */
-	for (i = 0; i < ARRAY_SIZE(probe_args); i++) {
-		probe_arg_t	*arg = &probe_args[i];
-
-		if (arg->argno == 0 &&
-		    dt_probe_insert(dtp, prv, prvname, modname, "", arg->name,
-				    NULL))
-			n++;
-	}
-
-	return n;
-}
-
-static void enable(dtrace_hdl_t *dtp, dt_probe_t *prp)
-{
-	dt_probe_t		*uprp = NULL;
-	dtrace_probedesc_t	pd;
-
-	if (strcmp(prp->desc->prb, "create") == 0 ||
-	    strcmp(prp->desc->prb, "lwp-create") == 0) {
-		pd.id = DTRACE_IDNONE;
-		pd.prv = "rawtp";
-		pd.mod = "sched";
-		pd.fun = "";
-		pd.prb = "sched_process_fork";
-
-		uprp = dt_probe_lookup(dtp, &pd);
-		assert(uprp != NULL);
-
-		dt_probe_add_dependent(dtp, uprp, prp);
-		dt_probe_enable(dtp, uprp);
-	} else if (strcmp(prp->desc->prb, "exec") == 0) {
-		pd.id = DTRACE_IDNONE;
-		pd.prv = "syscall";
-		pd.mod = "";
-		pd.fun = "execve";
-		pd.prb = "entry";
-
-		uprp = dt_probe_lookup(dtp, &pd);
-		assert(uprp != NULL);
-
-		dt_probe_add_dependent(dtp, uprp, prp);
-		dt_probe_enable(dtp, uprp);
-
-		pd.fun = "execveat";
-
-		uprp = dt_probe_lookup(dtp, &pd);
-		assert(uprp != NULL);
-
-		dt_probe_add_dependent(dtp, uprp, prp);
-		dt_probe_enable(dtp, uprp);
-	} else if (strcmp(prp->desc->prb, "exec-failure") == 0 ||
-		   strcmp(prp->desc->prb, "exec-success") == 0) {
-		pd.id = DTRACE_IDNONE;
-		pd.prv = "syscall";
-		pd.mod = "";
-		pd.fun = "execve";
-		pd.prb = "return";
-
-		uprp = dt_probe_lookup(dtp, &pd);
-		assert(uprp != NULL);
-
-		dt_probe_add_dependent(dtp, uprp, prp);
-		dt_probe_enable(dtp, uprp);
-
-		pd.fun = "execveat";
-
-		uprp = dt_probe_lookup(dtp, &pd);
-		assert(uprp != NULL);
-
-		dt_probe_add_dependent(dtp, uprp, prp);
-		dt_probe_enable(dtp, uprp);
-	} else if (strcmp(prp->desc->prb, "exit") == 0 ||
-		   strcmp(prp->desc->prb, "lwp-exit") == 0) {
-		pd.id = DTRACE_IDNONE;
-		pd.prv = "rawtp";
-		pd.mod = "";
-		pd.fun = "";
-		pd.prb = "sched_process_exit";
-
-		uprp = dt_probe_lookup(dtp, &pd);
-		assert(uprp != NULL);
-
-		dt_probe_add_dependent(dtp, uprp, prp);
-		dt_probe_enable(dtp, uprp);
-	} else if (strcmp(prp->desc->prb, "signal-clear") == 0) {
-		pd.id = DTRACE_IDNONE;
-		pd.prv = "syscall";
-		pd.mod = "";
-		pd.fun = "rt_sigtimedwait";
-		pd.prb = "return";
-
-		uprp = dt_probe_lookup(dtp, &pd);
-		assert(uprp != NULL);
-
-		dt_probe_add_dependent(dtp, uprp, prp);
-		dt_probe_enable(dtp, uprp);
-	} else if (strcmp(prp->desc->prb, "signal-discard") == 0) {
-		pd.id = DTRACE_IDNONE;
-		pd.prv = "rawtp";
-		pd.mod = "signal";
-		pd.fun = "";
-		pd.prb = "signal_generate";
-
-		uprp = dt_probe_lookup(dtp, &pd);
-		assert(uprp != NULL);
-
-		dt_probe_add_dependent(dtp, uprp, prp);
-		dt_probe_enable(dtp, uprp);
-	} else if (strcmp(prp->desc->prb, "signal-handle") == 0) {
-		pd.id = DTRACE_IDNONE;
-		pd.prv = "rawtp";
-		pd.mod = "signal";
-		pd.fun = "";
-		pd.prb = "signal_deliver";
-
-		uprp = dt_probe_lookup(dtp, &pd);
-		assert(uprp != NULL);
-
-		dt_probe_add_dependent(dtp, uprp, prp);
-		dt_probe_enable(dtp, uprp);
-	} else if (strcmp(prp->desc->prb, "signal-send") == 0) {
-		pd.id = DTRACE_IDNONE;
-		pd.prv = "fbt";
-		pd.mod = "";
-		pd.fun = "complete_signal";
-		pd.prb = "entry";
-
-		uprp = dt_probe_lookup(dtp, &pd);
-		assert(uprp != NULL);
-
-		dt_probe_add_dependent(dtp, uprp, prp);
-		dt_probe_enable(dtp, uprp);
-	} else if (strcmp(prp->desc->prb, "start") == 0 ||
-		   strcmp(prp->desc->prb, "lwp-start") == 0) {
-		pd.id = DTRACE_IDNONE;
-		pd.prv = "fbt";
-		pd.mod = "";
-		pd.fun = "schedule_tail";
-		pd.prb = "return";
-
-		uprp = dt_probe_lookup(dtp, &pd);
-		assert(uprp != NULL);
-
-		dt_probe_add_dependent(dtp, uprp, prp);
-		dt_probe_enable(dtp, uprp);
-	}
-
-	/*
-	 * Finally, ensure we're in the list of enablings as well.
-	 * (This ensures that, among other things, the probes map
-	 * gains entries for us.)
-	 */
-	if (!dt_in_list(&dtp->dt_enablings, prp))
-		dt_list_append(&dtp->dt_enablings, prp);
+	return dt_sdt_populate(dtp, prvname, modname, &dt_proc, &pattr,
+			       probe_args, probes);
 }
 
 /*
@@ -434,61 +238,13 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	return 0;
 }
 
-static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
-		      int *argcp, dt_argdesc_t **argvp)
-{
-	int		i;
-	int		pidx = -1;
-	int		argc = 0;
-	dt_argdesc_t	*argv = NULL;
-
-	for (i = 0; i < ARRAY_SIZE(probe_args); i++) {
-		probe_arg_t	*arg = &probe_args[i];
-
-		if (strcmp(arg->name, prp->desc->prb) == 0) {
-			if (pidx == -1) {
-				pidx = i;
-
-				if (arg->argdesc.native == NULL)
-					break;
-			}
-
-			argc++;
-		}
-	}
-
-	if (argc == 0)
-		goto done;
-
-	argv = dt_zalloc(dtp, argc * sizeof(dt_argdesc_t));
-	if (!argv)
-		return -ENOMEM;
-
-	for (i = pidx; i < pidx + argc; i++) {
-		probe_arg_t	*arg = &probe_args[i];
-		dt_argdesc_t	*argd = &arg->argdesc;
-		dt_argdesc_t	*parg = &argv[arg->argno];
-
-		*parg = *argd;
-		if (argd->native)
-			parg->native = strdup(argd->native);
-		if (argd->xlate)
-			parg->xlate = strdup(argd->xlate);
-	}
-
-done:
-	*argcp = argc;
-	*argvp = argv;
-
-	return 0;
-}
-
 dt_provimpl_t	dt_proc = {
 	.name		= prvname,
 	.prog_type	= BPF_PROG_TYPE_UNSPEC,
 	.populate	= &populate,
-	.enable		= &enable,
+	.enable		= &dt_sdt_enable,
 	.load_prog	= &dt_bpf_prog_load,
 	.trampoline	= &trampoline,
-	.probe_info	= &probe_info,
+	.probe_info	= &dt_sdt_probe_info,
+	.destroy	= &dt_sdt_destroy,
 };
-- 
2.45.2

