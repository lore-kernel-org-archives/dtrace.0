Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B580149DE2
	for <dtrace@lists.linux.dev>; Tue,  4 Jun 2024 18:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717524704; cv=fail; b=SIOvtuNMmRfRw7JwxcjEpDr3rf1AinbnidiOxL6hLYI68bJYaAf8QPsdAWCY6w1Ei9/X/rllLKcODYRoFYBvW6oAsbApYHUKeHBj+4MFOsS32eAyni8vsrOl0IwMBHLgdFF5TYkBI30qpuiEm6ulnPad9HBefuH44w4hy4GO6eI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717524704; c=relaxed/simple;
	bh=qLda1iZuLRu3vOIoiaIQ7OJuI6vKTZqdpsq02S8+vGQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gr6LQnNqivXUKFnM+GYsznqF3eSAH3Ur5KEU8elhx3zbMaPFWjJ09WFlE9L/uLMNRjlTBzi+bE909BGvChMbVZ57tCKFNgA8HjZHRvBwShIrgBqUn6ToxdVOlwgNrN5/rLr8TFaWdKsBNnUok6fNzYMoZ4nac9WFyyBrjfW7pGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454BnLMn028111
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:11:42 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-type:date:from:in-reply-to:message-id:mime-version:r?=
 =?UTF-8?Q?eferences:subject:to;_s=3Dcorp-2023-11-20;_bh=3DduWfj3jYHFPlmlM?=
 =?UTF-8?Q?LbU4igrO+aLJoXJTh9b17rcWQbM4=3D;_b=3DA27jfdSpvTqNVJQV2PpUL144lo?=
 =?UTF-8?Q?vX6TMMS12XXmus6OPDW1k5dVYk+JR5EsvbjfR11o+y_uc/jGKX5x0oIdhySN+44?=
 =?UTF-8?Q?Ajz8Asly9PzK8iZQQeKoFjgISHDcZpzYvA7YsGVBBImCYQIC_ZYtT7YNWsM998N?=
 =?UTF-8?Q?4owyIqC33b87tl2uTEUZ3ai3rIEfDhKT+jdPqQjKkmJVn87uFRhs5w_PPfMzIM6?=
 =?UTF-8?Q?h8Axk/FDrUJx5oY5nxx92PGAAGnRWxxOwZDS9dt7HiCgW4FNRqE2TrtM0Pav_vT?=
 =?UTF-8?Q?zMXfRF8KasB2xUcsxIt0DHUiga2BA+2rnmDHPMqnLTB6haPcN+u7oISA16SqIPT?=
 =?UTF-8?Q?I5S_yw=3D=3D_?=
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yfv58dm2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:11:42 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 454HgYiq025226
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:11:41 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrt8yy2b-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:11:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhgvT4xwWGirq/zq919NfUKbGslgUYa4UDChWFjLy8FBa3hqknTYimLcnUedfM/QOyOhLKySW6ZLrs5lfafdgf8PNOxV97CeUiPeTAqromXvRvkxB9XWJv3yCG/4glQI2bEqf95BRVDhyOSxGKjgIcZHKOP9J3pD8QWsqg7tX3TGaGrZ01HlKWo64b45Vq0Disgn0ct1Lc7RZU5VeOroW/lus8TEQOBRZwE1Qaevwz6fpQELsCjDKg27G4hbFQS/YTMmb04XOShPDrY+DVEEC2hqjdOa9oFxhtoBdbVOihZjtv2p1Ja2ZBIcTuCMKNncDINcx2mVu/PSUXioj1ruBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duWfj3jYHFPlmlMLbU4igrO+aLJoXJTh9b17rcWQbM4=;
 b=FuTS97SwsVzTvRmu2dKc3CuI5i8G7E5KBNUFoBwi5YTgWWQzzTlsVMOPomnMJ1COjLEqPy0uvAyyYoeujv2zKIGn5NC8FrNwED0u73TZFSxZDHvqZlY4VVq2HF4U/Za6HPMwObX6TPGvYgdtEzBb1nTwVjQ9gbdzQx2ervsMdiGNaeKyW5u9qOmJtneL1IDG/nHA/L9EWQpqUyDt/2c+azC1w0bhVgdqf2XxcHggTBVSJIuOSYs30XQt2Zy493c8VCcC+uPGDCMzW1lki+6MkSOVXM7emoxGeXAJ6A/KWpVz9xspvoq3VGrG9ZQbgY2tRFytRG/Upf8y/Uq3N0KaJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duWfj3jYHFPlmlMLbU4igrO+aLJoXJTh9b17rcWQbM4=;
 b=OEEGmkwaHW11LIpabFfIdG2wFtFZG5/FC86e4rOYd34SUOGYvJS6LFnFexaeHWlR639SFBZoZn2NBR8O1tdq0kHQ4MN+f8T2SVDM252kqgKhFXzT+TciX2qrGLkIUREI166sPbLw2G1txRkWNx0qiTOYKvKG/Refpx/lxsR1kvI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB5197.namprd10.prod.outlook.com (2603:10b6:5:3ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Tue, 4 Jun
 2024 18:11:38 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 18:11:38 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 04/14] Track uprobe provider descriptions
Date: Tue,  4 Jun 2024 14:11:03 -0400
Message-Id: <20240604181113.11505-5-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240604181113.11505-1-eugene.loh@oracle.com>
References: <20240604181113.11505-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0322.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::27) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB5197:EE_
X-MS-Office365-Filtering-Correlation-Id: b8ada5e9-b0d6-46ab-883f-08dc84c1c6fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?24VrUpYILO03LT0fCF9Cv3ysUNHPo1IMkOycKUMikRPaGQ+LsZ9AETMbe9MS?=
 =?us-ascii?Q?pg+c2lygi6n5ii+gaoVxgeJHiINeprBmvt1QjUnWrs9Z3zsetGJHB6kW233M?=
 =?us-ascii?Q?zxZBzMme0ImivLL2WYvd2rodgmhf++ofLYPjXx3dsQsKjx3xifSnCqtSu3jY?=
 =?us-ascii?Q?EZ8VaXPHTTdbj3C9rKM9PzOjBZgKG/cS1acUXRciL5zba3w1P4x/aq9tzsBy?=
 =?us-ascii?Q?vbp3oj1j0zXIqO1EWULVgRAz6nZqItaHTdi35pHmSYj7OSSIH4KdGDefwspP?=
 =?us-ascii?Q?IO+ebKLUEeNP566+PIlLsQxkwGZkkP2ws4AQdbkMb5SbjgTYZ8GQHE4lDb4u?=
 =?us-ascii?Q?EA+VK+p299RGtPnpb2WyoRqYG6rcwf1hmJ+OauasBuhVJqRsqChe4E3EQPLD?=
 =?us-ascii?Q?gkGmi54a/JLr3X8a8gv0ih+4wWWkgFncoiz0jZ0TipoZg+5Yq7SUCdmu8Hw5?=
 =?us-ascii?Q?JjZbCQW6OQ9duvr00t6oqVQsy8fYKZdkF8jhVireAGPkDOG5fMb0QhpaOTW8?=
 =?us-ascii?Q?fGLIlIo1t1p89FacEQtEJT5T6yigAIkf2p8lZSzbgL1N+NJqWam7U5QYXKR0?=
 =?us-ascii?Q?g218NPEIQ5swMQgqjWUmmeucIhS0uNC487uH+5YUVJOY2m5exV3v35votJGo?=
 =?us-ascii?Q?CD68zbrWHFTj7IZVE9MtIaFwW53/fKpwpG5fedw4b0PmnXCzIOfzt7Psw2+y?=
 =?us-ascii?Q?5VhDLY7TrrXctJMY9G5DhNKQVM1Pud8cVbEr/gVcQwSa2VLyBjRIKdctfzei?=
 =?us-ascii?Q?AvIkFqE5IYQMboPg0mpNyOw3h4bvBg1n3RLtmsgYtrjsFoO5rWGLsh2mVRux?=
 =?us-ascii?Q?DjG0MVUWCkXErM6UvQ7tG4jg8M2431MnvOmR/tqiW6Dow5WaviMD8ou7VBiP?=
 =?us-ascii?Q?8BtvOu49sRZ760F0Ke8tMxt05H2VhbxKtpRmIcH0VSaN7iF0ASZG1jHcSe24?=
 =?us-ascii?Q?/EY/55TQ3a98CVhVpVG+WpuAVFmaARi5axHPg7ebJ5Wwbpc2WvYviIcnyD3U?=
 =?us-ascii?Q?4Onq65XiPt5/rTciwpkpbsuJSZrcUpKmNQ+2Wu4z+HKvyzd4Rjb+7wOyDbZv?=
 =?us-ascii?Q?UEvjjmvwFqR+3UWqvYVymBVQDQzZ4i4uH0oJQQnmKOfd7YLcq1h5/qP4t7kW?=
 =?us-ascii?Q?glGo7PPAikLu4CnpGO+Qbr+V1X8uuEziUKHCjwE/d+Nc6U9+OSfPk23iVSGB?=
 =?us-ascii?Q?BEIr7edhbf2u0yHlgvPzxg1FgE2uHOSpRqD/5CbByyOtkX6TQ9IdqA3u2TEH?=
 =?us-ascii?Q?n/V9LDZKVu48CQwuP5G9iwWRqv5w8s+LSK0XfLmfSA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?46ADPwkA5UD5d/vGDp5PMzucArhwGSZkDHE1imxZBOd3p5E11txM9hykEgu3?=
 =?us-ascii?Q?mfBElVa0+bAP/QawEuA+mEZCmO+awCf7y3wv9lpSYieJoz3EDJENiY8iE7iD?=
 =?us-ascii?Q?AcxzoWUvnr4gZOfbEezdDBKMH/IqlMCXKFWWa8GYY5zpGThFGRe4qkgGReiA?=
 =?us-ascii?Q?8opVMj3XWIBYh4elNKXbTN5AYzSwomWPqm14HIwbFgvHEKjxj1F6OwgXE0nt?=
 =?us-ascii?Q?/+fVQmgn8GmCOKUNucCOEP0r1iEaQUDlVV0rbet2Wn4q/UnRnmm+fdiKC3fM?=
 =?us-ascii?Q?ciC81RFgCYUNeZUPgfgI6BngUaen0/B8zeM8jnGtqbZzg6rkHHvDjgcBSxKB?=
 =?us-ascii?Q?svquXH2brD3vy9h8IwFw6XhL/Nqsewd59wDW0HYFBjOZ+mR8v820mLg8FPM4?=
 =?us-ascii?Q?yV82DK8yhS1LE5pJuiQW5I9ZAc6lUgmfmgZPNMrm0r9EgRo+/BNLk9BpmrEx?=
 =?us-ascii?Q?FTjyYvYCmwu14KxbWakk+GIXlSoLqiYpvuPjClQ9UIO+P3VN+MgemdMTCSzE?=
 =?us-ascii?Q?O7OG3eiLTVUeH6/5isSWzMb7TN2usmKSdKcuEC+FV14spMJoGK4i2uHyHcrm?=
 =?us-ascii?Q?D/EflqydTWBIURbiSzhY4ikbzTc0jQqPbMdIvxa8VXDektaevGg5S5+3Lo27?=
 =?us-ascii?Q?xMPKcx8bhldAe28zVHjBZPtjAsKgW5owu17ybPhJrecPcaBAMWqo2OvJ6X9E?=
 =?us-ascii?Q?kfS1eTNlf6CAQ0iIQ4LumB8AxPn3IMYrGf1k2J8RauaA2iiCFSOi1aTttR3T?=
 =?us-ascii?Q?7wU6ACixvI9H8oWzogEjUhEm2VuQ9eEUxcoVkIXMeGKSjll3aTk53Vu4wZi5?=
 =?us-ascii?Q?aEUTQZKerru4887JYrjiJr3wjxrlplGeK6pN66c/iFun4ZEwlo7HysWS+VeA?=
 =?us-ascii?Q?TC/2pVmF9sl6OHET0L7t124enxn3ljjHpRoJMDLmxRwse3oHYqFwrGvdr9m2?=
 =?us-ascii?Q?0LedDWJyRg0sFx0oAo5VDybsaNzSflHtBlENbb9CHJjq0HY18Y+NJX48wTLl?=
 =?us-ascii?Q?Y15TIljIf3nbQNuz8pcgWgmsZ3Dob4M2f1yHtGj7tNKMU2N4vXKr1lE+YB4R?=
 =?us-ascii?Q?4dtZdEjgzOLMMH+27hxJa/9Xb+7N23FknQEM0WaxbTxNHnj+fkYFmeKVVgQA?=
 =?us-ascii?Q?2C89iACg+E7481VDA8fZY/cPHtvozdZ6lFPMxqA9iIKnZcDMAmMkNOz7LlN/?=
 =?us-ascii?Q?ILU0tuxlNzJiJ16vizCvrggjuv+i7STAthfYGXS3hOTIPOgBDLWfui5ykMJ8?=
 =?us-ascii?Q?F0s4IAt2paUfJVLS5Rz5DDYpnFc6/qJ0KAm6Ia6EOSBkkgHYDX03TJyiizwK?=
 =?us-ascii?Q?1dIgxupox7g/zCYuIDQ/LS86vqYY5aF3EiPzxEiqtKiBGe//Ws/Zpqo8neln?=
 =?us-ascii?Q?8go7LetFWs12h+f3qqGTFN/2BA/s0Q5qlhGF6mUNU9/Opv6YxwcccdDmdMk4?=
 =?us-ascii?Q?BqzNJIwtlOjpGFg5sW+Uu+cM//6BE+T6SNyDplrimbtYl/+uenohF74nUjv6?=
 =?us-ascii?Q?doy0g+w/zuFpZB7PClR0oo+E7Xjffbu+kzgikbpf9qB5Bc1LLOD6kpKxodkA?=
 =?us-ascii?Q?EZB0Q/DwmMUk4BQWEWK/KFZzzX01jUNFikao0dq1?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	rRZJ0NVAjX0GTPizMXqb/ScHEEb2sC1NgZqdg6IArohdjXq7TlryprAc0WY2jndwFAk9uk2oW3e0Z+IRbMRj6DTvqJg7w8nWXSCas+3U6JharU7VZA39GxywY6LdbDdJdYGNp2xIqdT1PlDm0Cxsegse4AU7/KtRYubKmnmOkgEWMFHrI6k4qX1XAgW2/ojXNw//sm4zYLQY5TU7Yxhb+3h+U99MQ9SKv1BGK8VJdQVuTUuhhSFKFR2/sj5xCnEPUls1Gjv+ePP/2g0RZslpf5c/do2GW4oRLjusWaiXFjQF7yNJghkNxpy9PJAL6T4gpi32y2WlUq98uUrZpY+qT72wuVdCXDrevr7YDT+zceJF1MrZrPmRJ+bayYfuHu/Ev9L8QIahKNeovqXR+7YeG6XomA6IqrMDgKoF2Cn7oaN3PtW4Vs6mOumuPOUUShxJwl6+j22Mg3POs5faQqcOxw/TjnJKuDLGdawer5Z561LDbaYE0KI7hfLgGFA367BgwI5p1BvSSCy3cdvwUbkb20jo2SRgMzjRHZjDUtBhRV2aa5wVlAGI4VyEpntNt9qZ6cBsnfOQZU3Ef/mKxYFZKLkyBjBk2pwMjabOGVewsmI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ada5e9-b0d6-46ab-883f-08dc84c1c6fa
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 18:11:38.2595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/0TNNicLfFvv1N5nZE6Cv0o8OQ8bKAeDrpMq9LlJ3AtxAuiBQYmTu1wYdsYR6UpKVO/M1+E5mPOAp0TRDFkUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5197
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406040146
X-Proofpoint-ORIG-GUID: r4KpAZzEBdiDL9Dg1f-704PEp7k-UIs5
X-Proofpoint-GUID: r4KpAZzEBdiDL9Dg1f-704PEp7k-UIs5

From: Eugene Loh <eugene.loh@oracle.com>

A uprobe will have to decide which of its clauses to run for a
given pid.  For now, keep the provider description for each clause.
There are many shortcomings to the way this is done in this patch,
but it is quick and dirty and helps us bootstrap real support.
Clean this up later, probably turning it into a growable array.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_cc.c   | 1 +
 libdtrace/dt_impl.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index d1ee3843..6bff7e0f 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -215,6 +215,7 @@ dt_compile_one_clause(dtrace_hdl_t *dtp, dt_node_t *cnp, dt_node_t *pnp)
 	 */
 	dt_cg(yypcb, cnp);
 	sdp->dtsd_clause = dt_clause_create(dtp, dt_as(yypcb));
+	dtp->dt_uprovdescs[dtp->dt_clause_nextid - 1] = strdup(pnp->dn_desc->prv);
 
 	assert(yypcb->pcb_stmt == sdp);
 	if (dtrace_stmt_add(yypcb->pcb_hdl, yypcb->pcb_prog, sdp) != 0)
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 01313ff3..1bf79d80 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -310,6 +310,7 @@ struct dtrace_hdl {
 	dt_pcb_t *dt_pcb;	/* pointer to current parsing control block */
 	ulong_t dt_gen;		/* compiler generation number */
 	uint_t dt_clause_nextid; /* next ID to use for programs */
+	char *dt_uprovdescs[256]; /* uprobe provider descriptor per clause... FIXME turn this into a growable array */
 	dt_list_t dt_programs;	/* linked list of dtrace_prog_t's */
 	dt_list_t dt_xlators;	/* linked list of dt_xlator_t's */
 	dt_list_t dt_enablings;	/* list of (to be) enabled probes */
-- 
2.18.4

