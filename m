Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E95616F8EB
	for <dtrace@lists.linux.dev>; Thu,  1 Aug 2024 17:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722532401; cv=fail; b=NJY1rSPxfhW4dso3eXzxAxOQi7etOBaQkVbsufaEIz9PTRzYjD+jpVJeUR1cP6c1PSQmbjL2jLB1A0kRSzfugjGgETGP/sXS4ooifFi5Jz6vxaok7A6ELuhB7USqe2KsG2RPjLjJc4kY6HOPn/C25PvbmfNaExa+cd6aQt68UEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722532401; c=relaxed/simple;
	bh=Kwl1zUaDKK+/kr1HeYdo8qJTPzBjrPjeNcQOEvGIlqg=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=TKQCz2d/i2hnozXrM+k/WGZ4vf91BaliC8Kx6WCyzNt5X2DxayD8J9OO0wlSDVN6ZFo9j0T21zU2gAJi5eCFeT8LYcn8/A9tKm71+oMj+8SsxxjwBUEAhHWRjGq4DrkcaR7nshLKX2ZHlLdFrgKfLKC+Ove37IEgbJllbN3r64g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FRM86ewQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xRhBK4ST; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FRM86ewQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xRhBK4ST"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471H0TDj025651
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 17:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=tutFGgqbFEHlhLO5nDVnz7kaPdsQs2UGsyFAQMYuATE=; b=
	FRM86ewQxj5oZxSaCNmqcqpy/yQcasx+hW/8Qlrd/1GzJpMmmwl8MqP7ku2QTISj
	BH8XWuGgCHUGpCexFv/GymQTerdAVIXeugzGxHg04AaYziKVH8VRyGd5x8dIrUEs
	SgD225yvmwOtC3ZSYxAgY4DXoXY7Fzz1VvC1GSjzRKDj1bO2obD6yRU71muJCMdZ
	tQ+mCfh8Ibszisq8KAijXuUltILIk+zERe79sNAEQXAc4v4Fk6y8sVYMlPaYw+MY
	3skNGytAqHZT8NwSGx+ZEhGf3ExZYnEYZmFeTgmyMxgqPKx80xBjJV9CUhfy+wHQ
	3ds75fdtaKSFEMJv+AfYUw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mrgsa8y8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 17:13:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 471GIbPt000548
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 17:13:15 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40pm868c9w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 17:13:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ut/FgfL3n/rdaB/7xdj80/jmzZXVJBXGieMVMU5ZgoUo04rr4oh0Z5bGAtcuSBtAAN0RusUh2fyLJFFNkpJ30pjZ5XAUo1e8aAYS/+wmEuVHIkXVGr2X3BQPmwtJ8UO4zYQIiXVtiY6uIMqVw4fo12L/8gvhYCvAsu5WrYcWTkMmfjU6CVeGRTfsSYWyCqpug0GCh26CEWaiyP8W0E6RAjFhaUn4c/He7Kj7APTO7AfFGpR2gjeWo4khbU0XVhSEzbXb1LioQrQkVjpXhIC3OAaN9Munfo0fm7w40T6Pe8OFu6NGm3hfK/eqJRToxoGYcPzBeRGi67qr2FCv6ZIt5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tutFGgqbFEHlhLO5nDVnz7kaPdsQs2UGsyFAQMYuATE=;
 b=al+1o27BD/ri6MconzqUJGX4YxZTb6NCW7KzSZBZ03RXJnB0K2MkbP9I01jwtJpmRaD0cMHb4Rztz1guPiGKD+jWrPv8lYJfNrW8BMjKBUz18gb2uWTbbheF+Oe52hAeyauOOZXrf8XAg6D/qJv43347obNmN6fAF+0616skE7eT9p0sFPu/e+YodyA6vgtGFuMIpPDVPs0aR8Zy9GesZsxF5WGBt64ujvgbQJ67I9Y4Hz3FqDaq6u5zZOyF4rk+PL73nfzAPPpGfiNnLwQQBEPyiB89Z0g5/e1uWkJ9ZlhlTPtk3KG58gPkeQVVUExTQiNVg8IP8Dg5VNoDHmpCxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tutFGgqbFEHlhLO5nDVnz7kaPdsQs2UGsyFAQMYuATE=;
 b=xRhBK4STx8SFbLz1ve+sf2KimGj+nDksMDg/AK4YUlqU/mufd4QNWVh40Uzb66dZU+9skP5fw2FOYcpzg8rZxX8HHdadL8C1YaZKYb+pzF6P+xYOS7AEsCUI5grRV9P58qmAnquif6KMUqwPOzk4OMqs6X6mUFx+jGB0AuMsrGU=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CY8PR10MB7265.namprd10.prod.outlook.com (2603:10b6:930:79::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 17:13:12 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7828.016; Thu, 1 Aug 2024
 17:13:12 +0000
Date: Thu, 01 Aug 2024 13:04:28 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: adjust err.unloaded_var.x to match test
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0085.namprd03.prod.outlook.com
 (2603:10b6:208:329::30) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID:
 <SN7PR10MB6287E893C7C56380F927732CC2B22@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CY8PR10MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e327740-e2a9-443b-0a83-08dcb24d397f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EBgBOK1xTfTZvbdnUbpluJGYhZf9DAtCtjt5Dv2e4LhzjN9EfCVcURrass3/?=
 =?us-ascii?Q?v2BzmTtgeOiJiBRTQS95fRh9EfDTdEpNShj7RyqE8KcykWnw+K2CE4NmKZU0?=
 =?us-ascii?Q?dVxNptwM0VcXJ7dQNwaznHZRB6We9HUyE2ujKmfy19sGYkNU6QnXGmzjrE7s?=
 =?us-ascii?Q?iOc4w5pUMgJonOweQReOZ+Syuq7foOED7OKPEZAvhDpWjCYQ00bUuPgvy4/Y?=
 =?us-ascii?Q?HpNIy1R0XQWgiSDRK+XMpLAQfc1F/5AzpRin9m0Bq0K4C0yXxI93Co9rEajE?=
 =?us-ascii?Q?6cUMGXCaGnKmt00M/omB3JwANQsdwUpXVcBSXNJ6uRcwnCj/ZVMPPFwfSiW/?=
 =?us-ascii?Q?ZlT7P+vsLDnliUqF34YR4NZdlXpwkTUkJL50cZITsz+eL3q+23z73Rg4N4Vu?=
 =?us-ascii?Q?kxfX35Ko9+HU6lui8qtbWrp4wW0/1/Qz+zwo22SXCeQfIi2yAXZSo7xJMVYR?=
 =?us-ascii?Q?R23xmFmjBxceofJTAxxNzg4+R7dFQubvMUZGfhK6kbMtieRsNeXYjfZIgDlZ?=
 =?us-ascii?Q?fKYcK3avf6ygchs1FJKqWdl0qDHw75f0IcGGjOPdvFwzKGEa2JmKwEkoz7R4?=
 =?us-ascii?Q?GSHHf2inljf0/T2e976Sib1rJck5ZTwd8pQ1tl0F19EO9b6XgfnFbljrhxu9?=
 =?us-ascii?Q?oFD5y3srIZW9ARfR4ALsUsDdbFryLZb57IC2ZCShmuZmD7JGWrDwPeTHKJy/?=
 =?us-ascii?Q?WoJ/3gG8TG1vdqqVPEmSgf573CR9DZV93KLfthpX756xotoO82Ss0q/mX386?=
 =?us-ascii?Q?tHJO/66jV9Ir7OQiHUOMZXdL4deXkL7Y6saZuqmgZ6jBs69tNP5VhI+5CRmT?=
 =?us-ascii?Q?/2Ph1zZx4eALu2K703ECmwiMfR8jEqIKSK2ie/rkp8w5ij7q2jBB0eOf9qKw?=
 =?us-ascii?Q?ReKxriAFXJUuaR0Jiu41cnZAuOY82nq01eyBGIzSb6MduCjFg+wPc2recG9E?=
 =?us-ascii?Q?OukEuks+CljBNYRt9pfnyFTpW4DRJ/0n6uAFwo4tUDjJ97q0cNreSmOHNPrQ?=
 =?us-ascii?Q?1AUKcPyWRmLzD4SRrEUCYeEJV20iI8/i8wlKF4e8TKvQ3Sa9MrKvDvMTeeBy?=
 =?us-ascii?Q?AAw2g8oJh1WwBSsmMtcxG9B3yUZPjvKhdXi37FtRf4JXN1/176gLE51WK8wh?=
 =?us-ascii?Q?KVgB1Q8VvoRemEWoAYEKbRRKj6DvnJ7QcMH9yOCOQvjm4ukX+u/iS9pB2M8N?=
 =?us-ascii?Q?M7yQf/o3cLGNjzWFGNBPJ7yzYxaOycM60VoM9Djt4+tYmnR7+ODyZPSA7yS8?=
 =?us-ascii?Q?V6dMt2pJ+AfOHPzhea3YKU0GR92vPvqRqdyq5OvC7Ob2gFz5iU5eG8EthiMT?=
 =?us-ascii?Q?aJHNuyuGsj//Gquy8eYxuicf9rhDzT301CmePKYMm0Vm4ZnanCSYkWNLrf2v?=
 =?us-ascii?Q?Yqjcs3Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+NEbYq/FclWMeJD9AF5DbVNKfhg+gewy1rFN/YG6Dicb4RI5rAzm219WCtpN?=
 =?us-ascii?Q?u7S/WDEKxtxvZlWuk0ySsEQo6zy1LCGeRDuOZKIR419/wUQPMEspw3RSZhjc?=
 =?us-ascii?Q?rTB7KnPQaWLZN9F8/GmvkqhE+z03r0+gD75DUXqmxGcr59t5ORWF6Yn+Iscw?=
 =?us-ascii?Q?uT6Hvs0fInAne6HMzL+QIvioyIe13yS/2odAkj9+mPcVrKpbQEuEPhtA/TGe?=
 =?us-ascii?Q?ocg0PK9ydON8A13oT6ZMOnZE/aoI8Bxuuh/YqJPGFZfKjG3GDz/eXDCPIB9y?=
 =?us-ascii?Q?inwD034ebOpY/YHNnLkgsHKSBUizP5D1xmoc2n7HUAIn1UML3TRhSf+Pj5Mw?=
 =?us-ascii?Q?4+sUlgMhgBgCrT5yVOmnEX4vZxFRhbndh16LJ1PkB3MuXKBqicb/8DxTFpqa?=
 =?us-ascii?Q?FzOeqPj+7VY1qJZotBJoHCq1F23eUdTXqHdICKojdHRn5c3liQriZTkf4JXQ?=
 =?us-ascii?Q?grgckwVJBWFhSrL+1Ajy3YGk6vBZ00Dhh/Bu6QZucofyxgBNwExf142lmIBv?=
 =?us-ascii?Q?z6TqC1dWWUQU5ReeZzW6X0o2TY2e/P+iYEX5ZLXqcpozW697UM9Nc7rD4KYN?=
 =?us-ascii?Q?lNZx7rpjvTuiQ85mFXtDq7a0uA3AFbmqqfACdgow2fMfRIYBEJ6Xf7nfjgWH?=
 =?us-ascii?Q?X56wJ3lRfYp5NAHJaxnA9jy1JqDIfh0J3znFIxDzEVGywgi8luy07NNwiDY2?=
 =?us-ascii?Q?WSLT4PecvK5s6EKsvmMD0HM3Sy4nJv90VWcxCqOY1fs8sxnq7fIIRh4tr9fH?=
 =?us-ascii?Q?1iQD2to2FXdwHaAlmkwkHZM4uy4uF1iNXAf4WS8DQK8VC9tqjWZFByph+Cfx?=
 =?us-ascii?Q?1cCkrH5ID22uZRhC+7TSmYmWOsBL5H42hsL5UomEaTjy41/v00CjZmKRxGDi?=
 =?us-ascii?Q?DDuE8STB/Vxv27xMVn1oCiwcNPNPfoZHINqe5ubsPKWuXiy24NLhUSocorb4?=
 =?us-ascii?Q?nRcpek0ik4kUKep4yUeS5VlYivPqEwpAos8YyM+DD9iyvLk6R2Ur2Vmjr8Kk?=
 =?us-ascii?Q?vYTOUrPteLF0y5VxQ0vGL/+Za5umICcTjPB5c/ke+puBv/aUyN6KkzFrIuI/?=
 =?us-ascii?Q?nYWt5k+vfUnvM35XsQ1ClCQKO8VQfYWZkFIPVTgO4YirsW+OtpRPjxFsPTZd?=
 =?us-ascii?Q?vZNwtBMMGXXczi6VjSsM+HjIHZdUGc/0NRKoB6noZKHw1UzTUIqZ9ku2/pmM?=
 =?us-ascii?Q?ScdHxr2AKAG6t6OQGAmJqBvyeO+eziupqrNxIXIY+MOmf18TIM2qo2jRV5+2?=
 =?us-ascii?Q?kQicYTT0C4+5wZL5RY/QbxUaoQReM1x1Ky8rHQTYCpf6cNRdgxrOBa/MP5zg?=
 =?us-ascii?Q?KYI7wUiz5LCAUqc5ivkvJqdadGiGgMvTCp8k/829LE6YsHF93Ui/Nq04uBLI?=
 =?us-ascii?Q?X1zD+BjUnrCR47R79VFV2sOdktattWnhQA5RMQn4UQxhCE+FYDgAiu54GTW0?=
 =?us-ascii?Q?aRjMOmfdUE5/aS2uycnuKZcssSj6jzHuRxlDvojqEEhquZMhKucYcSbjSFQy?=
 =?us-ascii?Q?dEUTGBERwZemmb5gkDL01fFB3AdujWUbQYA8nsnP4FrJXD9aSrCwfnKaRGfp?=
 =?us-ascii?Q?p5WLiMy8okx0u6m0SNZWdDjZrJ1qPFBd12s+aEfyFE2ibAoyy6DD+EA222e8?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FQL0gyXDUNUq8LASUUraalX8TrLi57Mpdh5cRM/uHEXuk+uRL/rOchn1LpLvTrii2XwTm303E4mI/y8TKgE+6eeHDOKwH7igksX7tjE3HkAopSMISP88urkxFU0VTB6fQ37THSClIBuN3HIAzZhB4y1qXeXA+ZeXGFy3gst37JTVcNLxMio9eJnaKOKN33z/uXYaM3OtQzxtPVcD0dNnDu/lHS6DvYtdEbz/w5J4MCY3XG0L7tTjiE4oy8PpcEV3k/23dPCRyQbAHQGbfO9KN5jYNqleD628IuyxaUwZgO2ryk+UfmG+u0Hqvh2MrQ7WksRWh4MBC5TNjxndUGPzdzhCQ1f7/eSTJCTI2ZOJasByuwqSFZvvPuubf9cFGsgPsfmt5OJ/9Bhzgn+WnJYlatMxwY6OO6R68RZr5fVri5jqOHR0t49IhfwjeZEx6J8r7QaNeJwdJVx6gjVwjQ9GdTcZ8GFdeFkMs83YBeHo/Qg4VUdel0boGeFyiMWko9QyktMnuEOZJLAsPC5TUUXdufRpVzgEHs2mZO/weFKf+x3CWIW1cLucL2tabkOIjpzsdaO2vPVIk5bQLpr2IYUhx09BURvw1wHrbWwdI4JDR94=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e327740-e2a9-443b-0a83-08dcb24d397f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 17:13:12.7659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aBwpScC3k1fKM0uByzImgOP2UNQd6vdynkYtT+JmfSJ+K5nF5zKqNQBn9Ukyibg8KwwVJn9D5dP6+2wBt0e713P5CBQzxK2VwTm9bRnHOZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7265
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_15,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 mlxscore=0
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408010112
X-Proofpoint-GUID: nYrl5-kDZ_2xWbGeeL3szFnrKCmv79H-
X-Proofpoint-ORIG-GUID: nYrl5-kDZ_2xWbGeeL3szFnrKCmv79H-

Commit d9158b26 ("test: adjust err.unloaded_var.d again.") adjusted the
test but failed to adjust the matching .x file.  Along with changing
the kernel module name (and location), we can also drop the testing for
the CTF archive since it is not necessary.  In addition, we allow for
either gfs2.ko or gfs2.ko.xz to handle compressed kernel modules.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/types/err.unloaded_var.x | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/test/unittest/types/err.unloaded_var.x b/test/unittest/types/err.unloaded_var.x
index e8ad2e76..54c61d57 100755
--- a/test/unittest/types/err.unloaded_var.x
+++ b/test/unittest/types/err.unloaded_var.x
@@ -2,7 +2,7 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# XFAIL if hysdn.ko not found (exit 1)
-[[ ! -e /lib/modules/$(uname -r)/kernel/drivers/isdn/hysdn/hysdn.ko ]] &&
-[[ ! -e /lib/modules/$(uname -r)/kernel/vmlinux.ctfa ]] && exit 1;
+# XFAIL if gfs2.ko not found (exit 1)
+[[ ! -e /lib/modules/$(uname -r)/kernel/fs/gfs2/gfs2.ko ]] &&
+[[ ! -e /lib/modules/$(uname -r)/kernel/fs/gfs2/gfs2.ko.xz ]] && exit 1;
 exit 0
-- 
2.45.2

