Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA801E8824
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730290374; cv=fail; b=t9pPUibNsZK/xjIlqPIkxcoDgUkzBn8Vi0ZcZsJGAzBmJhL1Mrpuw40aQTMIV3WElMRq9J3ENnYpJqU6LaEg/qTu4fuJMmk3R9vYkbnqt7NjxcJl1oa18rQQ/cadhPq0HOxu2/2HmxzaGVc/Te+hnuVX31spqjvGRaHcVXNrBo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730290374; c=relaxed/simple;
	bh=oi7SPmCCNcbhF6ggnxYDYV9h/XrmghiPFJQto2hKhRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qmzg0d5XOF/G/NeQ30ihWDtbYfaRVEUKThvaYNBHC4ov9YNXmGAljLwQjsk1Ig4K4aeIGPVRwfL+u85e0K/zjpqcpN8votJddJy5vJw4rSwcFR8aKoj8qasvMEH/eweQ45PM5vsEqDHQCL4kJSSrw8Vf0+FxeyRkdAe5+oh/xfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kCeR+bmw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qkwy2tCN; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kCeR+bmw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qkwy2tCN"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U1fcpY021248
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=t7Ydb+f2gPaJ5pI74IUR3n1NayvzICCk/uzUNW8CNlk=; b=
	kCeR+bmwSkRYNxpbrP70qE/FfGZl8OLq5ChwFsYNHB72VOzUgjsqfWflsVPBwOP9
	at/CS8YUDd++QqGOa8uJn1A++Oashfoz+ItEDImnu4ZM0uOEe9m77CZD7Yhshf8j
	BHxh/b++CEXkxnPSRAIp25cZo/JgBB+CGEKwcBTqt8hLzkCGYG9nZe58zOifulNv
	kHxDY3LpM1miCuTL7mv1782to8PM/ZoaPAhhXE3THFMJhBztZjMwv/xv30lRJcEX
	ifyFC7OpDWqH76G5rdKAf5GaTV4cWnp1BcHTMns0Ys4vtjQuWbJ/PIfAAI2ApCMF
	uOF/uswmsyN9kmFUXZVPoQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grc8yu17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49UBLv0L011986
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:50 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2171.outbound.protection.outlook.com [104.47.73.171])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnadx93j-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3wBfSIwBUx06Abtkfv7RLxGEZIr7aE/7tZPKdmV7Wf41/c8n5OrJWiHLWwIpV0daHbYDCKPmx/GMSJATGW2Xn9JbaoreVpXA/Bu1o5iwqUJbXXzhWjzfJ5xO6TUWc9aRlHyQFULVoHD9ZY7kJxFzDLxykFscFgmg2n4JspyTcvYLChw9Hh7qvLdwIiWy9kg9CsPJXcbbdkhKODz5H7r5xERQGVoZiTAbNvK+OiUxOJcOCamBL7F//vQyAS40h2q2/nVycb/EQnvJ8UaXdvZkE3zvGkqfeZte41PdqUvBhFbaF2cOCyjQ2oxtvUargI0Q9eA8bRHnvfGyE7CW84SzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7Ydb+f2gPaJ5pI74IUR3n1NayvzICCk/uzUNW8CNlk=;
 b=fqFMngOneJddQSmMu7TMsFp4ahG6FbmIzey9Qy0tbe4NxXZ7RIIRG2oFjm7l7T2ekJ71Yg7KEoDdL8YRt/mYALq9EUyzwcQ5cY+Ol16aBTxK5CLuYMXQDLybmiSZ5nNnfHwlWRY/9QPILdQW1WwMu9XbXkk/2fi3JgwWA/iVMaI3w1tiny6zeEMwA07XWdIDbHBWUKg+TDVUbbxzkxJJWcQuqAlB/+wCLu71UKp2fkwFQuMhP4ww7wqfCpHEegpSyN0CHv7Hjbii8+1sajzbuiDY8METE2bcIX4prSo6qYHsrAisyJi6k1vAp9Hg9E0FxFjFQ7YISVRD3/N6makycg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7Ydb+f2gPaJ5pI74IUR3n1NayvzICCk/uzUNW8CNlk=;
 b=qkwy2tCNxUIYrqLM60NSsLYUrA4FLr3qW8ph+leGoDwD47P/RCneB4pNHIImGr0JaWW9nYD4ADAsOvByBb8UswANbRmi0UXVWDdKFaL5/dDI3AuenMGRFB+NGiKHoQAxd4DCUJqtcIgkB5UVur/mVF88WBnTEu0Q/Ahyh7in4OE=
Received: from DM6PR10MB4091.namprd10.prod.outlook.com (2603:10b6:5:155::28)
 by SA1PR10MB6469.namprd10.prod.outlook.com (2603:10b6:806:29d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 12:12:45 +0000
Received: from DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02]) by DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02%7]) with mapi id 15.20.8069.027; Wed, 30 Oct 2024
 12:12:45 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH REVIEWED v3 02/14] pkgconfig: drop spaces in variable decls
Date: Wed, 30 Oct 2024 12:12:24 +0000
Message-ID: <20241030121236.257803-3-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241030121236.257803-1-nick.alcock@oracle.com>
References: <20241030121236.257803-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0080.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::10) To DM6PR10MB4091.namprd10.prod.outlook.com
 (2603:10b6:5:155::28)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4091:EE_|SA1PR10MB6469:EE_
X-MS-Office365-Filtering-Correlation-Id: 25bbd5bc-9ea8-42c5-84fc-08dcf8dc28df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5n0TqIt/8oJcsfiBrTJ/Nm7pdNCz6z9D5LqNif9XYs78zYP9uAG2bZdTTA9k?=
 =?us-ascii?Q?8IzBmk6R/RWCIda6bitFng/An+t5oH2zlchrSwjmA3+jsBRabDWftxNJTmml?=
 =?us-ascii?Q?XG+l2LnuK5ziEKKqf4B5MTa504Es4PwYEYi03QuXi3Gg1KSwf65c0rqkMVqq?=
 =?us-ascii?Q?oQpELxPF4eMT4f4KD5PF2t9OWYYTHkeyB8y1oGZAuzGmwZvXJoj7IAJIsdpp?=
 =?us-ascii?Q?9djhdJyQ3LJ+kQsTlKSNovKSo42KT6WFsAuQ86tn+TGOyylTLYaRNrooEHcN?=
 =?us-ascii?Q?O2QHs7RaO2DxgYjTiLV0mHSW+2opXQQe0crwD9kEq1iJ1rEdVjMgS8GqUJ6M?=
 =?us-ascii?Q?P5uscgjuUzPGyu7GWKHXO22HX4ghRCF0d1YFJ1lwVLiIoidbNMyVL0kIr+lz?=
 =?us-ascii?Q?QrVT/uXjV3B2ndOjhU3LxsiuIbrcuvqMvDuk7EuVRU7WAHAF6gq+2bk3Gk2k?=
 =?us-ascii?Q?JUybVUUSmajIKIwI3uoOnzwbjwyNVxqbcGi7NdK0vqZU1kLeKBL4840htM17?=
 =?us-ascii?Q?KIX6iBtRY8frNIojdnFk+5ZWXqHl+6TZdmFjixSrKAXmFiTMyaVILqUcZd6Y?=
 =?us-ascii?Q?dt6N3FH8Pi73Uv1pESgw7VhHWwQTd5aEMtsCDlSMK3kBtgPqBC6f8MdTse2n?=
 =?us-ascii?Q?k4x2tAIb4n0dt2vE++k2FDcXZ3gBOoZ0bfvwanN1L6pbyqMN3fhp3eioeI7y?=
 =?us-ascii?Q?iN6ohCPnOtBc81fnwaMHCwhQMlbH4fPeBQ5kAnY2I4I1zwfgCem91t5p7gJN?=
 =?us-ascii?Q?dwoJYhx8JR2SdPaOEkBgdZq7frU4OXX45qqWMg0YKKDk9xmxD0PiLc0So4Lp?=
 =?us-ascii?Q?35PHlBgw7yykaeLqZNyIl5gozjxPc1wNZ/CbsIsEewyuvrW68YOtStjXNRvW?=
 =?us-ascii?Q?Vz2ZVbsYYUDvy56nPbCvIQDu/wXCfrNl8IfX4txZchCcKK6J9VXQAk/4cBhQ?=
 =?us-ascii?Q?S+XgfbNITRHAjLprZD1wlIIizqLWW/kYu/rprBbKdfvgOBq+Hqmdf39vRPBw?=
 =?us-ascii?Q?fqacHhQYFKlqn5i45q9Cxf8J4l9qKEvJzUHBb2Ie6A80pWVMWAwBrDELFq7C?=
 =?us-ascii?Q?IPsNhIRcIUCWRwZwpb+uQTPTcQ8GhFd8dgQBuJcayYft/yPOzcB1qs8iFAqA?=
 =?us-ascii?Q?oImb2bTtYoxoGvByQcJagr8+ylajGp9vlic3Q8PsTcDOKSWuO6CQWEGpaPS8?=
 =?us-ascii?Q?jvKpd3ZHhiYWbZalVsb9NxVjiWigPlLZ0JPjm1D6SdTWhrI4UZ5GVn3IBmKg?=
 =?us-ascii?Q?TFf8KhhfqxxUx+1QcG27?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4091.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B5/tkGEwG0dGy6PGu9Pkq3dLPfpbvZ1mqYBx0yzDys100gMrrcjcKOQQ1Nl1?=
 =?us-ascii?Q?QN+l3gTKCPipzG16kBLoeV0zPit/gVYtb7W7TJRNm4BhdgNwUv/p7ICw7NFf?=
 =?us-ascii?Q?hgbRvlgYN39PxnnsWta/QN8Az0wU2gdq+kYtq6Kr2y7RG40lF9a+TofabfqH?=
 =?us-ascii?Q?XzpaCGvepLl/2gKsGww3ox8l7rgnGuIBllLc/qguBKtsSSDcAYVZp7gAQksw?=
 =?us-ascii?Q?49aPQPKoYFgbqQrCXUOivYlHLSp6Du39rWlf84M4TqgT3HfbYzJ6xHR7hsWz?=
 =?us-ascii?Q?aS57fR+7oPMHmHPcams2TCz5c4DuU3H1XnCeWffDAUCBQCYAHQInpIzOeph0?=
 =?us-ascii?Q?ddyxAkfcj5HNhWez5j62hz8osJy3OXI/07KmyIY8Qmrl6LMtgoxPRatk2FdP?=
 =?us-ascii?Q?jAfaFDXvo8AL77IrDu7c0gVOhgE6wiHAx5HHZP69M9dMEnxNCzOeafif+hWn?=
 =?us-ascii?Q?iXwMVE09CiJxlSO0BYw7QPm8Mam2YN+XDNSU5fkkGZ+AnfJgmtyOLf5Ny8rG?=
 =?us-ascii?Q?7gU68D0WKT9NgZBlsDGFQP0pyYWuhp6Q5ifNbWEnk9jS7RBI97UxFrRyyJTS?=
 =?us-ascii?Q?40qK1gqUQE1WVjP+jQhFPI+1B1nwrjQfLHp8d0rdfV9WLtKtrHkvQKnv5hgO?=
 =?us-ascii?Q?DsrhcQnhqnDFdjhZ6z96Vpwh+k6ydIMlC/kiPDbNdOnMtrEiZk2FBxcgwwG0?=
 =?us-ascii?Q?/7HgMU26e+HjXr6BNsMWCywC+A2Zr+W3SgmKR0kuPrMTr6RAkvjgwWOPLLQ1?=
 =?us-ascii?Q?+UO2XlWZoxofoUt5KI0yXIrLPeGuheCRwfK/laCXQDnkpIgWLwu7iDyB56k/?=
 =?us-ascii?Q?gKbh770SC5sz0VETm87f5j/+ctSOfH7u+EV9cXjQ8EVTXhRXNTSRxGgCgLnh?=
 =?us-ascii?Q?Vu42A3FP4JE8zZ4Thz7/S+Tz6R04m0kDoCZyNtdsbKYxDOMAZputij/kyTUx?=
 =?us-ascii?Q?SM+hiJQ6h1dqALscbud3IPyrNJWe6KZ8CVxpynppEth+5CHO3wjP5BIqW317?=
 =?us-ascii?Q?w7JdwnvbXeyX6xQ/w0oPfDBWEpKPsvbEOzveVMQLHPgI5t/YMm/LdaDiSDKU?=
 =?us-ascii?Q?PpRGy9Fr+eNBVyLpTyw5pQENkXSlAn6VTa3TX4E8xrLLF5lI6ileSOFjednE?=
 =?us-ascii?Q?HSMM5XBF1vuoqeaKl/WKvY0OxcHRMJ2fz4Iykuff227UcUUI7klPjGqwoL/L?=
 =?us-ascii?Q?beRXN5kKic1ggQ0JrTmbXHMq7zR443cmqvRBmsyecVRCVz1Tw7KBn5yQOJwJ?=
 =?us-ascii?Q?im1NvHQETRwLKF8vFU3hz2z6/ojbo7W+lB780ESJbmWyP8Blb2pPqEii+06w?=
 =?us-ascii?Q?2yHLxoZGT19qFiGX858hwA+X43JK+OcIhq8BKqYGCNfDenJgZaDd8DnvkmBj?=
 =?us-ascii?Q?7ZMaiOJkd2HQL+r9n3kOzGyMV3E7Jf6fGqYC60VnphrCtZyjtB2Tvl+UHl24?=
 =?us-ascii?Q?YVtqgyfzWOhfOodeFv4qsEzxz2IoV7jpo1P2ikSDyC06MEWxaFvskQ1W9JUM?=
 =?us-ascii?Q?enoXJhZo+JrX6NytCfJgRGRRzNXPNOz5MHrFvp/AyYvw38CRV5POr3u/XZLN?=
 =?us-ascii?Q?cjYhZ3co93k50ZeY9x4bZSVLWbKhO2HJ316VlannlttksqcilcefralKnT+3?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	42Ku8hRNdTnopF8dfSytknRhx8KOajXlNkui2kyh5PGdOzk2KVLD2kMftvG+NUEBhj8Oev8ln6H7Xq+R0hWwie3qFhslHqfeapTI0bxvDegdqCwQ1+ZPoMQutIvRIlatnBP80sY5L6LCnQb4NIURfbTg3H1HoHM3WzfWDKKQnc26Ruheuz+geyXff06wVBg+Gf5DiK6FMzJAw+CpG/E1Rl5XpxCBuKubWXr445ycT5to91mlY7oRP4bO7RgdcA1iSKjuIebfVN4vGCTrH0ku/q8KOvueXXhmQ8QS78AUpfo0HqYJ83sTxNGthZ7xjugQdltT5k/cPu42zYvdKwXIe/uwvyf10k8PgVU+Qd5KvH2qiZ80++K9pmbnQ4W6iXX84cFF5hH/t32zVgcgoNysaX2r6n2hl9TOsrCBYNcWUtJE1c8VU8lc2mbgAMA7AdmX+FI4B7TcSODYACXs0cCnaOLT5bemRwlR81q2lXjrGH5P1X/yOETjRGfhWcvcZCoJev8yoPoxROZIhgPpt1u3DOvV+RCn8nT+J7AgXyp7BxQKRkdot61+0l6HB6oaWn9pVPIbSkHOpgu3kC8zxURKqTjyZC6eX9SnQQ1BVzZ+tjQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25bbd5bc-9ea8-42c5-84fc-08dcf8dc28df
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4091.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 12:12:44.3951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2KlPphj3Nkp7805yxBjClatDOK3Uu/Zl0f18i97cSCXXDjSOYUCbVRaXfdiYFiCmK4CVT46BHSiLjzOb0lWyZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6469
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_10,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410300095
X-Proofpoint-GUID: WyPBCDb3Ha1s_XSV0Q9COxf6p_rGTeg1
X-Proofpoint-ORIG-GUID: WyPBCDb3Ha1s_XSV0Q9COxf6p_rGTeg1

The requirement to have variable declarations with no spaces in them is not
documented, nor does pkg-config seem to care, but most pkg-config scripts in
the wild conform to it and pkgconf --validate complains.

(pkgconf --validate may also complain about the Version lines. This is a bug
in pkgconf, <https://todo.sr.ht/~kaniini/pkgconf/15>, and should be
ignored.)

Bug: https://github.com/oracle/dtrace-utils/issues/105
Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 uts/dtrace.pc.in     | 6 +++---
 uts/dtrace_sdt.pc.in | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/uts/dtrace.pc.in b/uts/dtrace.pc.in
index 9977082c5a7c..fda6f755166d 100644
--- a/uts/dtrace.pc.in
+++ b/uts/dtrace.pc.in
@@ -1,6 +1,6 @@
-includedir = @INCLUDEDIR@
-libdir = @LIBDIR@
-dtrace = @DTRACE@
+includedir=@INCLUDEDIR@
+libdir=@LIBDIR@
+dtrace=@DTRACE@
 
 Name: DTrace
 Description: DTrace consumer headers
diff --git a/uts/dtrace_sdt.pc.in b/uts/dtrace_sdt.pc.in
index 32474bc3f75d..90977661b761 100644
--- a/uts/dtrace_sdt.pc.in
+++ b/uts/dtrace_sdt.pc.in
@@ -1,5 +1,5 @@
-sdtincludedir = @SDTINCLUDEDIR@
-dtrace = @DTRACE@
+sdtincludedir=@SDTINCLUDEDIR@
+dtrace=@DTRACE@
 
 Name: DTrace SDT
 Description: DTrace raw SDT headers
-- 
2.46.0.278.g36e3a12567

