Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B6A1E572F
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730290156; cv=fail; b=DU99WIsXyaLvGwN6Z6VLuQ7C+zN8MCBHlBbS8hhfw+aQwGfQmGbSllzyxKL8X1dP3b/2sNp5lk76mr8IHBMoLvj4nd2Ra8SjtjfwkqIcaK+Nd7XeJACje0aGImeIPYWkTzfH5Tz5DdgkvrOS08d8P8FfjAvsM7SRLuUufK63AK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730290156; c=relaxed/simple;
	bh=bq8IQXYMYv496+ZzTAB89OvilSNDrOjymo3WI4IQVzU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VNvQVmoBMnVuwL/2svG4pJddprFOMP6DRUvxl8AEf3CxH/v5HcabJhD/aCqd1+ZQbiYTVpfOb0tFmA4ic4osZof7APxcAaIt0ziYTQi0+3wpPFvpyjflhF/eKaeTmBb8+H232sZy3yYgs/Um3mbRYZObJtnYAzZKF18OJEmn8eo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=E8d7zfVr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lmHclayF; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="E8d7zfVr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lmHclayF"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U1fi5X009220
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=YIDYNVBV/2ppHd/uE88qHaObD3i3f5lHaoM3ziOqyuw=; b=
	E8d7zfVrO9SymJDsZXRBS34yf2c3tDOvO/K2vpxTGJsUn1dUt3uGusQJB0oLpscS
	pMKarNBQTGUq/DiBiuqA/l+Fz60pdHFUbxmkvg1tg55SSEWO7xoszO/872dXuRKP
	cnTnUlrg5WUDDoQj3dIU5hELhEkBrQssXvLj3Z2367AE4/o9IUaEtWln48uy476L
	J0vhIculx5jGELjypvQ5Pe+SORx7akPU3I9C/de16NJQezKJdMTImcJzAQPgNS1z
	GoWfy6GC8kRWRp8+LLUByPEWAIMIUohMX7qkgw6GLCRgQ6bkETTVTF0pFGZPHD1A
	m/XvuK6qiPZe2HLwkT4QUQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdp7u52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:09:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49UC7A1J010067
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:09:10 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hn8y70s1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:09:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cmcOf+HhTAcf0EUKkGWoma5bnKZ6aF8IwJAUtngChuidVMH6QJJhDCfwetO2O0d6ODyo1Re95aBuprZ4J8bzsdbIn7WJDVQS4hLoNBpz6nfTA2O3tAjLVvrnFy1NJhqsQd6ovifx7dmx1YViqFPkKUC6xqYiCXW8oqcwDooG2hkcClPdmv53lu/RPiTkZycCXEe7lDNslJC+eZD9NnBduHfeuaXPQ/spD/OEB4NDs/jvQnNGTSgou7l0meTSiRNCfCIvssPirFJxAM2CLdzeCNY3n/6ias0CSfjbMrzAdURGiAgEeVQxhUUhAnWukG23TVqDR95HWWOA/xQqaYb4Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIDYNVBV/2ppHd/uE88qHaObD3i3f5lHaoM3ziOqyuw=;
 b=hI+oC9Yfir5QLBpls18/0QFuSLJ+/NUEAd037qreKKM9FoVGStWrNmOSIsh572ELht/bug6woVF+Zhg5kdvHbO+WKJuqZNErgXAL++yunXX3NV0nWWvZktBhlNt7kDouDnvLoeXYj5W8if9JqNl6Mlm1Mqluyeo8xnxmf8arprwxBbFMgY65RTmZPudDO1cwUw3y8gCV569MZqKDAaYLEEfG6S90UXgDcPa5Y1C9bgJp8YbiembXqPEnnoPRyaQao5Qn88/VUTtR0JUppLavZKrWuKH3VvihHFK8anQ8CIn04NrdE4adkhgsoD1/fcFuUIQecQEGAyW8tBtMN941Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIDYNVBV/2ppHd/uE88qHaObD3i3f5lHaoM3ziOqyuw=;
 b=lmHclayFfbNPk0X1P3SARXLOeK9pnOvqshuOU5ipFy8Puh8EYE0ZY8mqa72R7E/mC9Rd/n5Etp+pVjK6M5rMedJxu81lHhpvuglKUJXctGVfOcElUGTFjOSKatCUqsB99X1WFFuggM3uKWD7jaMeeGcp0A6B5/nMspTDw0ySFXQ=
Received: from DM6PR10MB4091.namprd10.prod.outlook.com (2603:10b6:5:155::28)
 by SA1PR10MB6469.namprd10.prod.outlook.com (2603:10b6:806:29d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 12:09:06 +0000
Received: from DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02]) by DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02%7]) with mapi id 15.20.8069.027; Wed, 30 Oct 2024
 12:09:06 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3 5/6] usdt: typed args and arg mapping
Date: Wed, 30 Oct 2024 12:08:49 +0000
Message-ID: <20241030120850.256884-6-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241030120850.256884-1-nick.alcock@oracle.com>
References: <20241030120850.256884-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0291.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::15) To DM6PR10MB4091.namprd10.prod.outlook.com
 (2603:10b6:5:155::28)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4091:EE_|SA1PR10MB6469:EE_
X-MS-Office365-Filtering-Correlation-Id: 172a2607-638e-4819-3f5e-08dcf8dba72e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2soWqIfzEwBfrXctJdsleOuABqINH5YfloCaWRO1jOA7/AtS6EjUlHPcRKQC?=
 =?us-ascii?Q?jjdU1+ZVriH4jGBiYKY4cJFIhKG/TA09s+/OH91DvVxHxLh/m7K8ONfbmQ3f?=
 =?us-ascii?Q?Yl0EtMGwGH9NHB6QVHk73vNc/eTENj+OXsI+tCbOJHzfQT37MjpY9dNuWTeU?=
 =?us-ascii?Q?pZ0qTKyYGPCblQA/NnWt3+Cyz9sZ1AoRayTF9PeKWIHUU2eiZjdwCa+pGMdS?=
 =?us-ascii?Q?5q+Yaa/iAQcZUY400GcIsgByAq6MS8jFeTguftBE+VrsXvYZN4XEUXM8cyPR?=
 =?us-ascii?Q?P9+LrgKKFSwJXdPxn/OLo1xa00BA4hpl9taHrW79NSiw3e8TY+FNfbTB/0h3?=
 =?us-ascii?Q?kaEJ2Jviwy8v/bYPs3PcNWkO62RGvERvCRVNN0/NlfpQPIfIg0Tiexccv5HE?=
 =?us-ascii?Q?MYjWCQzC/fTggh4wLXT3BhrJWyEBUvpHAz48m5NN6QHZBsNpYIQHJxTVndGO?=
 =?us-ascii?Q?S6VPTEc3D2NeZGDGMUzO9UGFRTFhQj4mTbB4nLcD2b7W9fyDt3CE+xX5ZDVd?=
 =?us-ascii?Q?g08fYlomXHhlz+GTTil0kyBQgbMT2hpGM+7ne+GyKXvbaKuYNEdeMdnXAuQU?=
 =?us-ascii?Q?B7K3Bok3xaWdhn17ym5CU65gZcao/NkzErUZVW/wja3W1tiv0S4RAUX6gxR8?=
 =?us-ascii?Q?CSx6POESwg0E9i9rsO7h86XGZ38iKtptmAR66F9Glp39yczZtV3jwKJ9rlJ/?=
 =?us-ascii?Q?Wp1YS9oSpKv4dqAMUf1y9bn44gzqT8zST0reRtefnwqiO0eFaIQ3KTRgBZb3?=
 =?us-ascii?Q?un3LT50dU10ZIXNXntcQcw6tU5DLopNbXw7QVfGDMsU1igUoB0u9oQSwd5IE?=
 =?us-ascii?Q?9nWTBeP32kiyQ2skle1uORB/UZomG3NQ3XEYfa22EskqJ/Inbj2AXl3hDesy?=
 =?us-ascii?Q?d2EtZMYGl1DJqNk3KlsZ/6vCP4ZomkosOKp8cXzYzB1W5li40jvVKTI1Gpqs?=
 =?us-ascii?Q?LUN2Ig/AYcihDzzIJGPlw54D4VDsehHEPhkwZEJzToaU8IneetEOInV04ykR?=
 =?us-ascii?Q?Fc//yCHY2Ooc+Rsv1/XHIZ3lOGiOJAEfJ85qeA08ldRK03MZ5Xgh1R8iAudZ?=
 =?us-ascii?Q?98X9IciOZsemg84Y4FadsiNmnBNftFw4iyVX42JjXoGYeW+SUAAy4z45pCHI?=
 =?us-ascii?Q?Pjp6Y6vAEcgGYlW9AowYVC7jh4qkLLll7mxfQsmQvEpwR6VfvsH+Gk32aRr3?=
 =?us-ascii?Q?xNFWaTqRfHB9gJRim5n1aAQ1A+x9df2K+g9kFMPViYBjLON4eGW/KBHEHtS4?=
 =?us-ascii?Q?h/4slnc7hivB5BiCoJBsQjaIZJElv7fRfp6cGq14VjhMDPds38xvhW4WYSK4?=
 =?us-ascii?Q?Co/PT6/KFEPGQaWCTG5ePw00?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4091.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VOJSxBP90ZqFdFXRNPCEjH8jN34ZuvbrLSgB9G1FqoT3nG/SSnQ8y5jdyQWp?=
 =?us-ascii?Q?fkgJNi+GT5Uz5RFnCraA3TR9kYWOAWMfwOvMCa7YSEojaLs863rZKKRjqfY6?=
 =?us-ascii?Q?rsqBwcWlEcRibqTXq16nrNge39+Cblk7Pa37+GIw5y54IYbou2l1Mwqhq8Ne?=
 =?us-ascii?Q?v4Lzh74nX2vFcnlsCQeUsLFKb9BPVo9yN8qennoD1uj1Y9IQrDmQtEE63sD3?=
 =?us-ascii?Q?Po5Zv6bq73wCBcMxZka8G+kMToTmFqyM73lOpJjC6NBmNjbt4TEogWE4jqvL?=
 =?us-ascii?Q?Oz7axsWOpMDyn5vGgfh/u8clPb8eXOE1tzdvmddcKJoAUfj9F0g+pvIBSZ+M?=
 =?us-ascii?Q?rHlvueZr/du5j/iv3Ni6c5UjWnTOSXo7c1yTi95vCZix+X4S/mBF3uy4JDz2?=
 =?us-ascii?Q?DSJq1XFbyUs6UxVGOG56xHTgTbFtZ+mDjxUA6fnbjd7KNY5awyGbv3kjPAWZ?=
 =?us-ascii?Q?WNTo7IZCzy9wTBMkbwh5mZbIcYBy+HQeuD2cn0+LMY1FkZoFQ6MN6j131db1?=
 =?us-ascii?Q?XIodwhAh+7lMFF+xLfN5RsIaKWtU48vOQM2AgXxJQc5c/pj2AfdmURb3W5iH?=
 =?us-ascii?Q?nbO6efRugrMwMT3jCXBjNQDhjWliPlOTeG68wiXvmTRf4GyixbIleW3kaVMo?=
 =?us-ascii?Q?zFU8YAAkvOk+ri0M9AfrvjXBczHJHV/NyB+pV8xiC8Zpd5qV1sn74FYa/jO1?=
 =?us-ascii?Q?rafSARTan4vaCtJQIsyXK6pjL39wS0OdObJmawLhd6oyp3w5TbxpP6VMeKou?=
 =?us-ascii?Q?Q6L7O9dyg65NH6Upr8SXG0IrKED4VXxuLHMnO7OSeSuOiDdb5JRSZ2KRzTWu?=
 =?us-ascii?Q?uEst96oMUzOLYR8lp/8POhePnbVg2BuDzzQ70dZGzA/anhBYo25qcqx3NUiW?=
 =?us-ascii?Q?6j6AcujLHF0rjYLKAF5/mNNZqYWhVJ+a3ZScTzemael2e1V41Ccwk6uP+st9?=
 =?us-ascii?Q?4pj20n+t7eS4UQ6AK5Iy4LXbAymQUWOp2dwMVwqPJUZMRyQqgFzjTBCk2GGV?=
 =?us-ascii?Q?t3Bz+XV23GnJH877k02LFwhu4Hy0Y2BkXxhhgU+iEwdEHr8A6TLLaKk9wK+p?=
 =?us-ascii?Q?9nk9PXNOhAQIrfalqb7SDZYyG9OVybac8jhX8hBiH8FjE1j75upyLhbqy+7c?=
 =?us-ascii?Q?TN8sXFw0hc1jrULlYcPVBpvmmxFMAI76sZjTVYPFg8lDKdLhnrM3buZEfzmn?=
 =?us-ascii?Q?tevyK96XAsECQ3BTtarMiJZm7XBTQ6b8/3lAKCVaUN1u9KqnzPe+2P2yzO9P?=
 =?us-ascii?Q?LfP/6vJ9/qA75L9ZuJXhH98+raxrikPBEyJTFZMpw3HtpLl8Uca+eq4njsff?=
 =?us-ascii?Q?OEVKslNWK51dWYOtwurp6JfkXrpgTjJbFhIU3LMFldcLg1indX8ImLlpLyFq?=
 =?us-ascii?Q?v//T8jMPjb0Fd1Ij7g+qLRLQpQ4C/ZpqdG/yRbEE5TjSC2IOf6cko0HfXfBM?=
 =?us-ascii?Q?tfCH5oWtqzJDbfmzUYc8jhwPXBIXGGQFsGNX7F8KZ+XXAZEJdVuNFf3BD0+V?=
 =?us-ascii?Q?6JPZTbvh/WdhMZXhoUtM3+yfvmUBg0Umh7GM/D3aQ8+7mRY8U0RwfH5oYAA5?=
 =?us-ascii?Q?UiDBaexnRzzUpmT6yT03417jPTuOSRKRS1B8Br32Ijizbz6gUuFeUuxWvhwM?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6NF9jsp2IaMfqi7l4ADklBoFBy76dViehmPx1JZAsb9TWu6iN+t6CFRVHYfXf0Dyw4p4Rq46b9KKsgBMJ8S1k0czQ+w612ydhunUixnCNxOH7KDPIrWgMMkXhaUlKcSmsRcLjU5QbKz2Uv+l6EUq05UySPffTkATYqrJty2PC/5qSYYueOloptaVweyA7sK7Azs3N2cJclp92l+0UpLiYIxJwpsjwL5//pjOi3Ta0ugHgwkd0WfHENBGGYUnOMAHh8qvJ7HL5OJwQHVD111wBNukp1Nixr5LV9TLrEoAaxWqdJf+mQ4xzkhkQkGTefPLFR00lbHEpYnHB+JOl1pddy3/Sa84LG4V/CO9SDA0gzMpWF9YRlkxHJgSWbWfTUILCd0cjV6Mq+zPgKLwOv6xFspoi2jSCEZ3iCCDCaBSYh741nNZ2vlclMhKEen3iw5xs77sZiytbsuUR9K9ZWNK6a0+8pAVyuSoGQBO1eerVTtsj6f7+zDwWCr9oYQkSo3Z97dQdPYmljp1IKLUAJ3xaXe0lCwAlRQJ03TTNaGTwpWtJahEKcFeXuJmLazwhrfoUrsOnCFZuct56jcQOjVEYUAAGXWW8f72AQLxoiQv+IQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 172a2607-638e-4819-3f5e-08dcf8dba72e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4091.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 12:09:06.8070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +iozPQSdIf9egbSpgbTGWF50GBLaX906CUy3KBEovD7AcG+IcrwNekAwtlaafVTAoB0Yv51NitB66pjAlAiLzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6469
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_10,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410300095
X-Proofpoint-ORIG-GUID: C2O1hvTnMKo1FTmXI-ZPU8hrGu9Mg3MD
X-Proofpoint-GUID: C2O1hvTnMKo1FTmXI-ZPU8hrGu9Mg3MD

This change propagates the arg type and mapping info we just got into the
pid_probespec_t onward into the underlying dt_uprobe_t, shuffles the native
types before handing off a 1:1 mapping to the dt_probe_t, and calls
dt_cg_tramp_map_args() to apply the requested mappings.  With this, USDT
probes should now have visible types which obey the :-notation translators
specified in their .d fils (this is now tested).

The probe info has been moved from the underlying probe to the overlying one
as part of this: underlying probes don't have any user-visible args to
get info for, and their probe_info functions are never called.  We do all
the arg reshuffling in a function ultimately called from USDT probe
discovery via provide_underlying, so it predates trampoline setup let alone
probe_info on the overlying probe and all the args info is present before
it is needed.  (We intentionally do not shuffle the args in
dt_cg_tramp_map_args specifically so that we are not sensitive to the
relative call order of trampoline() versus probe_info(), but there's no
escaping the requirement for USDT probe discovery to predate all of this:
but this was already a requirement in any case.)

We make a couple of assumptions for simplicity, noted by TODOs in the source:

 - overlying probes all have the same native types and mappings, so we don't
   need to look at more than one underlying probe to figure out what they
   are.  DTrace always generates such a thing, but DOF specifying multiple
   overlapping probes seems perfectly possible for other programs to generate.
   This should probably be validated in dof_parser.c in future.

 - any given underlying probe locus is either a PID or a USDT probe, never
   both, so we can just map the args at the start of the trampoline and then
   never touch them again.  The both-at the-same-locus case, while in theory
   possible, is not yet implemented, and significant changes need to be made
   to create_underlying() to fix this.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/dt_cg.c                             |  16 +-
 libdtrace/dt_cg.h                             |   2 +-
 libdtrace/dt_pid.c                            |   1 +
 libdtrace/dt_prov_uprobe.c                    | 166 +++++++++++++++++-
 test/triggers/usdt-tst-argmap-prov.d          |   5 +-
 test/triggers/usdt-tst-argmap.c               |   5 +-
 .../dtrace-util/tst.ListProbesArgsUSDT.r      |  34 ++++
 .../dtrace-util/tst.ListProbesArgsUSDT.r.p    |   2 +
 .../dtrace-util/tst.ListProbesArgsUSDT.sh     |  83 +++++++++
 test/unittest/usdt/err.argmap-null.d          |  40 +++++
 test/unittest/usdt/err.argmap-null.r          |   2 +
 test/unittest/usdt/err.argmap-null.r.p        |   2 +
 test/unittest/usdt/tst.argmap-null.d          |  32 ++++
 test/unittest/usdt/tst.argmap-typed-partial.d |  49 ++++++
 test/unittest/usdt/tst.argmap-typed.d         |  48 +++++
 test/unittest/usdt/tst.argmap.d               |   3 +-
 16 files changed, 470 insertions(+), 20 deletions(-)
 create mode 100644 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
 create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
 create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
 create mode 100644 test/unittest/usdt/err.argmap-null.d
 create mode 100644 test/unittest/usdt/err.argmap-null.r
 create mode 100755 test/unittest/usdt/err.argmap-null.r.p
 create mode 100644 test/unittest/usdt/tst.argmap-null.d
 create mode 100644 test/unittest/usdt/tst.argmap-typed-partial.d
 create mode 100644 test/unittest/usdt/tst.argmap-typed.d

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 959be5601ea8..1a5384ae8a4f 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -832,16 +832,16 @@ dt_cg_tramp_restore_args(dt_pcb_t *pcb)
 }
 
 /*
- * Remap arguments according to the array of mappings given.  The original
- * arguments are overwritten (but saved).  In effect, this changes the native
- * arguments: the caller should adjust the mappings array accordingly, and
- * shuffle the native arg types to match.
+ * Remap arguments according to the mappings in the array of arguments given.
+ * The original arguments are overwritten if necessary (but saved).  In effect,
+ * this changes the native arguments: the caller should adjust the mappings
+ * array accordingly, and shuffle the native arg types to match.
  *
  * The caller must ensure that %r7 contains the value set by the
  * dt_cg_tramp_prologue*() functions.
  */
 void
-dt_cg_tramp_map_args(dt_pcb_t *pcb, uint8_t *mappings, size_t nmappings)
+dt_cg_tramp_map_args(dt_pcb_t *pcb, dt_argdesc_t *args, size_t nargs)
 {
 	dt_irlist_t	*dlp = &pcb->pcb_ir;
 	int		i;
@@ -852,9 +852,9 @@ dt_cg_tramp_map_args(dt_pcb_t *pcb, uint8_t *mappings, size_t nmappings)
 	 */
 	dt_cg_tramp_save_args(pcb);
 
-	for (i = 0; i < nmappings; i++) {
-		if (mappings[i] != i) {
-			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ORIG_ARG(mappings[i])));
+	for (i = 0; i < nargs; i++) {
+		if (args[i].mapping != i) {
+			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ORIG_ARG(args[i].mapping)));
 			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
 		}
 	}
diff --git a/libdtrace/dt_cg.h b/libdtrace/dt_cg.h
index 8f66b7a7cb98..fb26c125adbc 100644
--- a/libdtrace/dt_cg.h
+++ b/libdtrace/dt_cg.h
@@ -34,7 +34,7 @@ extern void dt_cg_tramp_get_var(dt_pcb_t *pcb, const char *name, int isstore,
 extern void dt_cg_tramp_del_var(dt_pcb_t *pcb, const char *name);
 extern void dt_cg_tramp_save_args(dt_pcb_t *pcb);
 extern void dt_cg_tramp_restore_args(dt_pcb_t *pcb);
-extern void dt_cg_tramp_map_args(dt_pcb_t *pcb, uint8_t *mappings, size_t nmappings);
+extern void dt_cg_tramp_map_args(dt_pcb_t *pcb, dt_argdesc_t *args, size_t nargs);
 extern void dt_cg_tramp_call_clauses(dt_pcb_t *pcb, const dt_probe_t *prp,
 				     dt_activity_t act);
 extern void dt_cg_tramp_return(dt_pcb_t *pcb);
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index e4dc5368897d..d7c93afab1ec 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -950,6 +950,7 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 
 			p += args->size;
 			seen_size += args->size;
+			args = (dof_parsed_t *) p;
 
 			if (!validate_dof_record(path, args, DIT_ARGS_MAP,
 						 dof_buf_size, seen_size))
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 481159b01c24..8187d832ff1e 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -55,7 +55,11 @@ typedef struct dt_uprobe {
 	uint64_t	off;
 	int		flags;
 	tp_probe_t	*tp;
-	dt_list_t	probes;		/* pid/USDT probes triggered by it */
+	int		argc;		   /* number of args */
+	dt_argdesc_t	*args;		   /* args array (points in */
+	char		*nargvbuf;	   /* array of native args */
+	char		*xargvbuf;	   /* array of xlated args */
+	dt_list_t	probes;		   /* pid/USDT probes triggered by it */
 } dt_uprobe_t;
 
 typedef struct list_probe {
@@ -112,6 +116,9 @@ static void probe_destroy_underlying(dtrace_hdl_t *dtp, void *datap)
 	dt_tp_destroy(dtp, tpp);
 	free_probe_list(dtp, dt_list_next(&upp->probes));
 	dt_free(dtp, upp->fn);
+	dt_free(dtp, upp->args);
+	dt_free(dtp, upp->nargvbuf);
+	dt_free(dtp, upp->xargvbuf);
 	dt_free(dtp, upp);
 }
 
@@ -123,6 +130,86 @@ static void probe_destroy(dtrace_hdl_t *dtp, void *datap)
 	free_probe_list(dtp, datap);
 }
 
+/*
+ * Populate args for an underlying probe.  This really relates to the overlying
+ * probe (all underlying probes associated with a given underlying probe must
+ * have the same args), but the overlying probe doesn't exist at the point this
+ * is populated, so we must put it in the underlying probe instead and pull it
+ * out when the overlying probe info is called for.
+ *
+ * Move it into dt_argdesc_t's for use later on. The char *'s in that
+ * structure are pointers into the nargvbuf and xargvbuf arrays, which
+ * are straight copies of the nargc/xargc in the pid_probespec_t.
+ */
+static int populate_args(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
+			 dt_uprobe_t *upp)
+{
+	char	**nargv = NULL;
+	char	*nptr = NULL, *xptr = NULL;
+	size_t	i;
+
+	upp->argc = psp->pps_xargc;
+
+	/*
+	 * If we have a nonzero number of args, we always have at least one narg
+	 * and at least one xarg.  Double-check to be sure.
+	 */
+	if (upp->argc == 0 || psp->pps_xargv == NULL || psp->pps_nargv == NULL
+		|| psp->pps_xargvlen == 0 || psp->pps_nargvlen == 0)
+		return 0;
+
+	upp->xargvbuf = dt_alloc(dtp, psp->pps_xargvlen);
+	if(upp->xargvbuf == NULL)
+		return -1;
+	memcpy(upp->xargvbuf, psp->pps_xargv, psp->pps_xargvlen);
+	xptr = upp->xargvbuf;
+
+	upp->nargvbuf = dt_alloc(dtp, psp->pps_nargvlen);
+	if(upp->nargvbuf == NULL)
+		return -1;
+	memcpy(upp->nargvbuf, psp->pps_nargv, psp->pps_nargvlen);
+	nptr = upp->nargvbuf;
+
+	upp->args = dt_calloc(dtp, upp->argc, sizeof(dt_argdesc_t));
+	if (upp->args == NULL)
+		return -1;
+
+	/*
+	 * Construct an array to allow accessing native args by index.
+	 */
+
+	if ((nargv = dt_calloc(dtp, psp->pps_nargc, sizeof (char *))) == NULL)
+		goto fail;
+
+	for (i = 0; i < psp->pps_nargc; i++, nptr += strlen(nptr) + 1)
+		nargv[i] = nptr;
+
+	/*
+	 * Fill up the upp->args array based on xargs.
+	 */
+
+	for (i = 0; i < upp->argc; i++) {
+		int map_arg = psp->pps_argmap[i];
+
+		if (xptr) {
+			upp->args[i].native = nargv[map_arg];
+			upp->args[i].xlate = xptr;
+			xptr += strlen(xptr) + 1;
+		} else {
+			upp->args[i].native = nptr;
+			nptr += strlen(nptr) + 1;
+		}
+		upp->args[i].mapping = map_arg;
+		upp->args[i].flags = 0;
+	}
+
+	free(nargv);
+	return 0;
+
+ fail:
+	free(nargv);
+	return -1;
+}
 
 /*
  * Look up or create an underlying (real) probe, corresponding directly to a
@@ -138,7 +225,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	char			prb[DTRACE_NAMELEN];
 	dtrace_probedesc_t	pd;
 	dt_probe_t		*uprp;
-	dt_uprobe_t		*upp;
+	dt_uprobe_t		*upp = NULL;
 	int			is_enabled = 0;
 
 	/*
@@ -201,8 +288,11 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 		if (upp->tp == NULL)
 			goto fail;
 
+		if (populate_args(dtp, psp, upp) < 0)
+			goto fail;
+
 		uprp = dt_probe_insert(dtp, pvp, pd.prv, pd.mod, pd.fun, pd.prb,
-				      upp);
+				       upp);
 		if (uprp == NULL)
 			goto fail;
 	} else
@@ -224,6 +314,8 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	return uprp;
 
 fail:
+	dt_dprintf("Failed to instantiate %s:%s:%s:%s\n", psp->pps_prv,
+		   psp->pps_mod, psp->pps_fn, psp->pps_prb);
 	probe_destroy(dtp, upp);
 	return NULL;
 }
@@ -413,6 +505,9 @@ static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
  *
  * The trampoline will first populate a dt_dctx_t struct.  It will then emulate
  * the firing of all dependent pid* probes and their clauses.
+ *
+ * uprobe trampolines will also arrange for argument shuffling if the argmap
+ * array calls for it.
  */
 static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 {
@@ -437,6 +532,23 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		dt_cg_tramp_copy_args_from_regs(pcb,
 						!(upp->flags & PP_IS_FUNCALL));
 
+	/*
+	 * Remap args, if needed.
+	 */
+
+	/*
+	 * TODO: pid probes are never mapped, so a mapped set of args
+	 * for UDST probes need saving/restoring to reverse the mapping
+	 * for pid probes at the same locus -- but right now pid and
+	 * usdt probes hitting the same locus simply end up as whichever
+	 * registered first because create_underlying cannot handle this
+	 * case, so we can avoid it here too.  dt_cg_tramp_map_args
+	 * already saves regs: all we need to do is restore them before
+	 * any pid probe is hit.
+	 */
+	if (upp->args != NULL)
+		dt_cg_tramp_map_args(pcb, upp->args, upp->argc);
+
 	/*
 	 * Retrieve the PID of the process that caused the probe to fire.
 	 */
@@ -710,8 +822,49 @@ attach_bpf:
 static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 		      int *argcp, dt_argdesc_t **argvp)
 {
-	*argcp = 0;			/* no known arguments */
-	*argvp = NULL;
+	size_t		i;
+	list_probe_t	*pup = prp->prv_data;
+	dt_uprobe_t	*upp;
+	size_t		argc = 0;
+	dt_argdesc_t	*argv = NULL;
+
+	/* No underlying probes?  No args.  */
+	if (!pup)
+		goto done;
+
+	upp = pup->probe->prv_data;
+	if (!upp || upp->args == NULL)
+		goto done;
+
+	argc = upp->argc;
+
+	argv = dt_calloc(dtp, argc, sizeof(dt_argdesc_t));
+	if (argv == NULL)
+		return dt_set_errno(dtp, EDT_NOMEM);
+
+	for (i = 0; i < argc; i++) {
+		argv[i].native = strdup(upp->args[i].native);
+		if (upp->args[i].xlate)
+			argv[i].xlate = strdup(upp->args[i].xlate);
+		argv[i].mapping = i;
+
+		if (argv[i].native == NULL ||
+		    (upp->args[i].xlate != NULL && argv[i].xlate == NULL)) {
+			size_t j;
+
+			for (j = 0; j <= i; j++) {
+				free((char *) argv[i].native);
+				free((char *) argv[i].xlate);
+			}
+
+			dt_free(dtp, argv);
+			return dt_set_errno(dtp, EDT_NOMEM);
+		}
+	}
+
+done:
+	*argcp = argc;
+	*argvp = argv;
 
 	return 0;
 }
@@ -779,7 +932,6 @@ dt_provimpl_t	dt_uprobe = {
 	.load_prog	= &dt_bpf_prog_load,
 	.trampoline	= &trampoline,
 	.attach		= &attach,
-	.probe_info	= &probe_info,
 	.detach		= &detach,
 	.probe_destroy	= &probe_destroy_underlying,
 };
@@ -794,7 +946,6 @@ dt_provimpl_t	dt_uprobe_is_enabled = {
 	.load_prog	= &dt_bpf_prog_load,
 	.trampoline	= &trampoline_is_enabled,
 	.attach		= &attach,
-	.probe_info	= &probe_info,
 	.detach		= &detach,
 	.probe_destroy	= &probe_destroy_underlying,
 };
@@ -818,5 +969,6 @@ dt_provimpl_t	dt_usdt = {
 	.prog_type	= BPF_PROG_TYPE_UNSPEC,
 	.provide_probe	= &provide_usdt_probe,
 	.enable		= &enable_usdt,
+	.probe_info	= &probe_info,
 	.probe_destroy	= &probe_destroy,
 };
diff --git a/test/triggers/usdt-tst-argmap-prov.d b/test/triggers/usdt-tst-argmap-prov.d
index 28134baa6fa3..d8c3e88c4616 100644
--- a/test/triggers/usdt-tst-argmap-prov.d
+++ b/test/triggers/usdt-tst-argmap-prov.d
@@ -1,10 +1,13 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
 provider test_prov {
 	probe place(int i, int j) : (int j, int i, int i, int j);
+	probe place2(int i, char *j) : (char *j, int i, int i, char *j);
+	probe place3(int i, char *j) : (char *j);
+	probe place4(int i, char *j) : ();
 };
diff --git a/test/triggers/usdt-tst-argmap.c b/test/triggers/usdt-tst-argmap.c
index 89a0a53fc1d5..9244092514ff 100644
--- a/test/triggers/usdt-tst-argmap.c
+++ b/test/triggers/usdt-tst-argmap.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -12,6 +12,9 @@ main(int argc, char **argv)
 {
 	for (;;) {
 		DTRACE_PROBE2(test_prov, place, 10, 4);
+		DTRACE_PROBE(test_prov, place2, 255, "foo");
+		DTRACE_PROBE(test_prov, place3, 126, "bar");
+		DTRACE_PROBE(test_prov, place4, 204, "baz");
 	}
 
 	return 0;
diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
new file mode 100644
index 000000000000..8bcfa92ff6b0
--- /dev/null
+++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
@@ -0,0 +1,34 @@
+   ID   PROVIDER            MODULE                          FUNCTION NAME
+ XX test_provXXXX              test                              main go
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Types
+		args[0]: char *
+		args[1]: int
+
+   ID   PROVIDER            MODULE                          FUNCTION NAME
+ XX test_provXXXX              test                              main go
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Types
+		args[0]: char *
+		args[1]: int
+
diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
new file mode 100755
index 000000000000..c575983adf65
--- /dev/null
+++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
@@ -0,0 +1,2 @@
+#!/bin/sed -rf
+s,test_prov[0-9]*,test_provXXXX,g; s,^ *[0-9]+, XX,g;
diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
new file mode 100755
index 000000000000..ad8dc2e7c267
--- /dev/null
+++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
@@ -0,0 +1,83 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2013, 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+##
+#
+# ASSERTION:
+# Testing -lvn option with USDT probes with a valid probe name.
+#
+# SECTION: dtrace Utility/-ln Option
+#
+##
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+CC=/usr/bin/gcc
+CFLAGS=
+
+DIRNAME="$tmpdir/list-probes-args-usdt.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+cat > prov.d <<EOF
+provider test_prov {
+	probe go(int a, char *b) : (char *b, int a);
+};
+EOF
+
+$dtrace -h -s prov.d
+if [ $? -ne 0 ]; then
+	echo "failed to generate header file" >& 2
+	exit 1
+fi
+
+cat > test.c <<EOF
+#include <sys/types.h>
+#include "prov.h"
+
+int
+main(int argc, char **argv)
+{
+	TEST_PROV_GO(666, "foo");
+	sleep(10);
+}
+EOF
+
+${CC} ${CFLAGS} -c test.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test.c" >& 2
+	exit 1
+fi
+$dtrace -G -s prov.d test.o
+if [ $? -ne 0 ]; then
+	echo "failed to create DOF" >& 2
+	exit 1
+fi
+${CC} ${CFLAGS} -o test test.o prov.o
+if [ $? -ne 0 ]; then
+	echo "failed to link final executable" >& 2
+	exit 1
+fi
+
+script()
+{
+	$dtrace -c ./test -lvn 'test_prov$target:::go'
+	./test &
+	PID=$!
+	disown %+
+	$dtrace -p $PID -lvn 'test_prov$target:::go'
+	kill -9 $PID
+}
+
+script
+status=$?
+
+exit $status
diff --git a/test/unittest/usdt/err.argmap-null.d b/test/unittest/usdt/err.argmap-null.d
new file mode 100644
index 000000000000..8b805cfcfd5f
--- /dev/null
+++ b/test/unittest/usdt/err.argmap-null.d
@@ -0,0 +1,40 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: usdt-tst-argmap */
+/* @@trigger-timing: before */
+/* @@runtest-opts: $_pid */
+
+/*
+ * ASSERTION: Verify that a probe with no args at all has no args.
+ */
+
+BEGIN
+{
+	/* Timeout after 5 seconds */
+	timeout = timestamp + 5000000000;
+}
+
+test_prov$1:::place4
+/args[0] != 204 || args[0] == 204/
+{
+	printf("this should never happen");
+	exit(1);
+}
+
+test_prov$1:::place4
+{
+	printf("nor should this");
+	exit(1);
+}
+
+profile:::tick-1
+/timestamp > timeout/
+{
+	trace("test timed out");
+	exit(1);
+}
diff --git a/test/unittest/usdt/err.argmap-null.r b/test/unittest/usdt/err.argmap-null.r
new file mode 100644
index 000000000000..ff34ffba5054
--- /dev/null
+++ b/test/unittest/usdt/err.argmap-null.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/usdt/err.argmap-null.d: line 23: index 0 is out of range for test_provXXXX:::place4 args[ ]
diff --git a/test/unittest/usdt/err.argmap-null.r.p b/test/unittest/usdt/err.argmap-null.r.p
new file mode 100755
index 000000000000..c575983adf65
--- /dev/null
+++ b/test/unittest/usdt/err.argmap-null.r.p
@@ -0,0 +1,2 @@
+#!/bin/sed -rf
+s,test_prov[0-9]*,test_provXXXX,g; s,^ *[0-9]+, XX,g;
diff --git a/test/unittest/usdt/tst.argmap-null.d b/test/unittest/usdt/tst.argmap-null.d
new file mode 100644
index 000000000000..b672df3470d6
--- /dev/null
+++ b/test/unittest/usdt/tst.argmap-null.d
@@ -0,0 +1,32 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: usdt-tst-argmap */
+/* @@trigger-timing: before */
+/* @@runtest-opts: $_pid */
+
+/*
+ * ASSERTION: Verify that you can remap to no args at all.
+ */
+
+BEGIN
+{
+	/* Timeout after 5 seconds */
+	timeout = timestamp + 5000000000;
+}
+
+test_prov$1:::place4
+{
+	exit(0);
+}
+
+profile:::tick-1
+/timestamp > timeout/
+{
+	trace("test timed out");
+	exit(1);
+}
diff --git a/test/unittest/usdt/tst.argmap-typed-partial.d b/test/unittest/usdt/tst.argmap-typed-partial.d
new file mode 100644
index 000000000000..14e7e0992045
--- /dev/null
+++ b/test/unittest/usdt/tst.argmap-typed-partial.d
@@ -0,0 +1,49 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: usdt-tst-argmap */
+/* @@trigger-timing: before */
+/* @@runtest-opts: $_pid */
+
+/*
+ * ASSERTION: Verify that args[N] variables are properly typed when remapped,
+ *            even if some args are unused.
+ */
+
+BEGIN
+{
+	/* Timeout after 5 seconds */
+	timeout = timestamp + 5000000000;
+}
+
+test_prov$1:::place3
+/stringof(args[0]) != "bar"/
+{
+	printf("arg is %s; should be \"bar\"",
+	    stringof(args[0]));
+	exit(1);
+}
+
+test_prov$1:::place3
+/stringof(copyinstr(arg0)) != "bar"/
+{
+	printf("arg is %s; should be \"bar\"",
+	    stringof(copyinstr(arg0)));
+	exit(1);
+}
+
+test_prov$1:::place3
+{
+	exit(0);
+}
+
+profile:::tick-1
+/timestamp > timeout/
+{
+	trace("test timed out");
+	exit(1);
+}
diff --git a/test/unittest/usdt/tst.argmap-typed.d b/test/unittest/usdt/tst.argmap-typed.d
new file mode 100644
index 000000000000..ef5b32d1d372
--- /dev/null
+++ b/test/unittest/usdt/tst.argmap-typed.d
@@ -0,0 +1,48 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: usdt-tst-argmap */
+/* @@trigger-timing: before */
+/* @@runtest-opts: $_pid */
+
+/*
+ * ASSERTION: Verify that args[N] variables are properly typed when remapped.
+ */
+
+BEGIN
+{
+	/* Timeout after 5 seconds */
+	timeout = timestamp + 5000000000;
+}
+
+test_prov$1:::place2
+/stringof(args[0]) != "foo" || args[1] != 255 || args[2] != 255 || stringof(args[3]) != "foo"/
+{
+	printf("args are %s, %d, %d, %s; should be \"foo\", 255, 255, \"foo\"",
+	    stringof(args[0]), args[1], args[2], stringof(args[3]));
+	exit(1);
+}
+
+test_prov$1:::place2
+/stringof(copyinstr(arg0)) != "foo" || arg1 != 255 || arg2 != 255 || stringof(copyinstr(arg3)) != "foo"/
+{
+	printf("args are %s, %d, %d, %s; should be \"foo\", 255, 255, \"foo\"",
+	    stringof(copyinstr(arg0)), arg1, arg2, stringof(copyinstr(arg3)));
+	exit(1);
+}
+
+test_prov$1:::place2
+{
+	exit(0);
+}
+
+profile:::tick-1
+/timestamp > timeout/
+{
+	trace("test timed out");
+	exit(1);
+}
diff --git a/test/unittest/usdt/tst.argmap.d b/test/unittest/usdt/tst.argmap.d
index 7896dc07e0e2..9cd3425bf8e0 100644
--- a/test/unittest/usdt/tst.argmap.d
+++ b/test/unittest/usdt/tst.argmap.d
@@ -1,11 +1,10 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
-/* @@xfail: dtv2 */
 /* @@trigger: usdt-tst-argmap */
 /* @@trigger-timing: before */
 /* @@runtest-opts: $_pid */
-- 
2.46.0.278.g36e3a12567

