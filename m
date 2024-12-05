Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FB72EB1F
	for <dtrace@lists.linux.dev>; Thu,  5 Dec 2024 19:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733426007; cv=fail; b=iqz+BCF+0r1q3hp0PXmWIMHMFlcbQ4/xY8pdhpg35ee5WN3t2guR3RWayn9dqXUB6DESKNzHTV2Chp/W/5TA6hlU8sSihlLC1vlnZ85AMVtEDeffefX/KffHwvH7m8D08IHk0JyXF/n6+AhBtKJGTPj2c9hmcEOAtP+xMPslZ9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733426007; c=relaxed/simple;
	bh=ldJHwlFk/OtW3DVgLcgIcIsG3vF+GSpaqyQrTwmO0GE=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=hGxEvjMygHxI9dRizZ7oOE7nlW/gIA3GOAjapU0H0un8ZVP05qMOzGSxcs6T/NMeU8q3HpknO0pe7AMtYdLLH3Em+Kq/VUetK9bEYCK3GTpFlzKz9vt2MF7xg3G4Qv8jR7YUZCJB9b8yPi/YQe6SUQ5U3Uzw3NRHtpgoSgoEb20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=le51l7NP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=AJPIJHO+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="le51l7NP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AJPIJHO+"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5JCQxk022209
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 19:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=ZYd4d872grU7X/Go5W2KFicanArvYQcwj4YqI2LnEXc=; b=
	le51l7NPahG3NkiUItVOQRNR5BGSLYj1XTiZeYerAJebfYp1lr8sL2djcmUSYbd6
	fzdLmavmjoefewzqv439POSjstZgAKXMywgVszDuOCGrmru9OjAscDV1mSOoTJWg
	HcQ3BCeUZ14L37FKgnbr7OJXsIl4zpDqT+QOneZMxx8I+uWWfLnZ+RbSO0O28OT7
	FI8ZTn5678VB2bCypGu6Rp5e73U34aaQrcNRhD87aY5WCgQ/4UaWzGzEwSYQ2mwo
	oF6Z74YsOX4y9xRyriCv4eJLyecmxMx0bDV/upZzpGxaIdh/HPgHmiy7umlCTg+Y
	XvhVhCPn//fR7l/jnaIrKw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437sg2bup3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 19:13:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5ITZ5I020107
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 19:13:23 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 437wjfxwkb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 19:13:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p18jBPw/kP99ZtOZjlvcOwYVVWRbVc3EGUg327KoJ1yXiaQMuY1Z5/30AkuP+/MEgaV42vPIw56IQwOs9K4KeyK2wcEMviTPqXrwjsc6n/ToXTNH+b1yX0NOErd3UOolOoBHWSyTyNgJzIKabmyB51gfYicFLlTkyfx7iKRe+RAuOz4S7a0e0sSGxOtgviM3Q8J/vrm+oa+s96hUFg4JUIdAfvPF3Arq2EHEFIdMUYQ8DGHnftex5gbVZwe5+1ZJw+gknHZTI2iND2Dkv38oDu28q0z6lI4aOI6IgXSvZ7lrXwyr67XBRdVTmbAJQgxFM3PSY+YeyJS9BWOWCRpDww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZYd4d872grU7X/Go5W2KFicanArvYQcwj4YqI2LnEXc=;
 b=REhLllNWi5h7fnh4aWq5iCVj4oVND9LEl8+TypyEUwB0E5x+oNq1JWgYlinvRQEZWM+LXQ1oiO/Y5uItk4A33qbxLMD9E9m5PbgfsPKKAZfK3nnTFuwrVH+C1Mqsoasaiwun5a59kysVxCe9U7DFq8WhVhp9X6iJnaGjt9982Z6BG4hWSJNgBU5wb9u0TcqsxCgr8DzgEa5zFOOT+E7qpHbpQu0leSQW98XP0EtLvO0tS63kSJRJ+WwSpUjnZmpRRL0a8FdzfypcrN+dfr+wQqGhVzYPsIEEQvVySylxP54bxPEB0UlJSQ7smMYdVNvxzmAd5MmYrlGjXXMWLLa+rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYd4d872grU7X/Go5W2KFicanArvYQcwj4YqI2LnEXc=;
 b=AJPIJHO+M9yCBR4pXnAV018OFUnufYNX3nQmCR5RHF3R17yr+Bi25BPnPeKF28/Z2AMrMYA1vYsFUmTJiRX0aFlHE9XyU18/KtcP9MnCsw2xwJSh03do5iMG4WfqjuUQcPGlAb8ex0CChFC34qaXejG7CXh+mSTZZkkkqH+hq6U=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BLAPR10MB4929.namprd10.prod.outlook.com (2603:10b6:208:324::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Thu, 5 Dec
 2024 19:13:19 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 19:13:19 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Allow duplicate usym/umod/uaddr if for different pids
Date: Thu,  5 Dec 2024 14:13:18 -0500
Message-Id: <20241205191318.18587-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::29) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BLAPR10MB4929:EE_
X-MS-Office365-Filtering-Correlation-Id: f27a3683-2232-4def-559b-08dd1560e121
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wGIvdCnMC+ZFmLz484RkCEexT7+X33+ZBIjMZQ1MIcRps2lw+D3Iv5pYcHn4?=
 =?us-ascii?Q?Ou3HxYklU1iRo+SqXvQTIrXBz6vwD3z7SbK+s0qrr/nk64C0FaO13573nfbC?=
 =?us-ascii?Q?0N2dEBtKC6/Lx9Joz2bKyOm38CtNYZB4EBubVAN9gJMVM02e4pKL+LtLAS+A?=
 =?us-ascii?Q?Jo7eAo3QuPwsH1xGs0iTdijh6gz+TNLjGLeBzP3IiC2vy4cb26wzKsQNIeVJ?=
 =?us-ascii?Q?pd3bol4fPVsqrXMSxmY3SYj+AUfaKoH9Jp82gYj7M5ZhtfFWeEkfhV0197dU?=
 =?us-ascii?Q?0B5vw+7Jh6cVSwF21e91r41TtkCawYS7D0EHuKk8LVpKto1UIAvvhnpTFdqo?=
 =?us-ascii?Q?WHvmBHozaqvePXSJpdKKIq0mpYsPy6whKBHyfPLWqlucS8SPoOxL54mBycZ/?=
 =?us-ascii?Q?azh2kcCQ0cXcwMJDmc7yjmvehWVIgSDz+3shoZb2L76kZrYxIWvQRdiyD1sY?=
 =?us-ascii?Q?Ho4na+EshEfWU1EhjvtgL4hroeEnLY8umrnHtAbLm07t94KHiLr/lmbx1v/i?=
 =?us-ascii?Q?sk7W9aq/Vf8+pIt7ihlUeVbmMQgATRE8QrrTd9GdC2/Q07eUCltHnXS1xQfA?=
 =?us-ascii?Q?QIUjvPH2BejoI95LsaNXvKUtg3VcCdIOlBJBQsJEoC2oAKFiF/XAfx12pNQ6?=
 =?us-ascii?Q?PbT4Psdt14UBlcXfdp9xkZADXSJoMqqYC0yXfhcT8JcbMbLuo99ruEpCPyWM?=
 =?us-ascii?Q?KC4hL5NmctUrC/t8F/0NERoolSGRP7ALrKRTSxe83R88WMcE9BEAmwDcd0Ea?=
 =?us-ascii?Q?vQ+AZHtZFWHV3FoQzT7VFh2JBcKXE263BOfFzU+gvurMMc4al1hhMIlYeNOA?=
 =?us-ascii?Q?EBbMMyD2phs4qhMGmuvvNKrXfimOFz/zGWYYV2LJBwvu5gbLpjdUpzjkiOMq?=
 =?us-ascii?Q?NKwxcKyiJBJo/ni3jEHFUduRohlDAUp7K4Plne7PieVo+eI1rWQAd/YyLqqC?=
 =?us-ascii?Q?vs3ll89/j47DQenV6Ni7lftUa4DKG2OkhFKy825F/3OjZCFcGXD6fEMrUvaB?=
 =?us-ascii?Q?qMxyRjPB3hosldvImYOKi6xHeL9zbPgrM2pVjiyn2IFdmkxHLAsW8PuWaSJC?=
 =?us-ascii?Q?9xZGoGtEVXmmqUMcCjLPuUmfyULcB6mLt7l6AsrdpBMUtOPb0BxR0KgoIugc?=
 =?us-ascii?Q?vqdfn/RE51q+JouKBFG6lKuZLO3FyUFwCO2Rky5sxepnurcLa8ADfsTexwX7?=
 =?us-ascii?Q?0Y2BLOnoIQQhf2k7bqOXb7zS4zYdnUmAHiQAoTorWR12nfr1NrWnrypWaiOv?=
 =?us-ascii?Q?Z+DxPjrsfUVx2L6j03puQNr3B8wgyjg7PQizw6pqT+/2ZEGWev+Va4A/bS98?=
 =?us-ascii?Q?bY/aCDMVpdOF6u5A3NXKkyHFoeU3FcVGCHBNQtouG1lGng=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Brst6zrE+SNYv++GjTxWnlTqeVmj/2vAt6WtGeF5Lnos1sc4hz2DyNt6g7lT?=
 =?us-ascii?Q?cThdik6ERjppsdE0VydCZQRUckqKE/2eunQwUtvTcjO6nGa5ScbNiFqZtie3?=
 =?us-ascii?Q?/k8kVU9Ync+3+1A0q45XT1W24CD6IrGBc++XMjGjNw2i9AOBAJpuvbWFHWi5?=
 =?us-ascii?Q?Gr/t3HFnsGMquscMBIs9Hnx47Uewkr0CmN8nRET4+E8/37yGd0VAIizJBcaQ?=
 =?us-ascii?Q?I30ssVK+yCkoJTm8ctTOeFbhuPDpcZnNpSYybU8txXBifhsMdEzbWZLpoUiw?=
 =?us-ascii?Q?BQp3CM73TqdKRJUm+VVmE1gqF4q7xJ2/PSM7RZi5urE/4S9Dle8ACnxfeCo7?=
 =?us-ascii?Q?shOt1f+N7X4U7JBxzmlSDFMq+yEc3iylGhCpBZpPJkhrtP7jxIYyYu9okD3L?=
 =?us-ascii?Q?5Z/qV1CrfVc6hnDJXDZ+ksZSHqopaEkTlHW2M4u3W/6bnrjMam8P/pO4xAV0?=
 =?us-ascii?Q?uiu+hIfNrkjYdhl195UMU8VQufYQtd/qZv6IPkJsjjzwW0OnNfuum2fWE3dr?=
 =?us-ascii?Q?V3WaBSSZaI27cVdOXLUJZPu/XJA7q2JOk19o4MxXE9RsR2t5vb/VcEQZYlqg?=
 =?us-ascii?Q?WwrGUXLqiOFIKI+Og2AYcQqF/0N+dq0IIn7LSy6aMSDNfdyL6GwuQ9gnp7vy?=
 =?us-ascii?Q?/LIJvDlXQuAiL83Hpx6FCvZZyHfCcrfsE3YeVRCdFpOU9068CHMjO4COZu1L?=
 =?us-ascii?Q?575A+PFFtvb3d5KJqedp135jaVQustNO692Rnx3qBk4RlV7H9moJ2acLgqq8?=
 =?us-ascii?Q?luT2YhTn5sjWSoSKc/2e7ZPqFEdp3VOeIo4Y6jSji35aBM9cvKIH5MMClvvs?=
 =?us-ascii?Q?tETwt0+ZM+zz5GmVsQY+KgZzvubBqluoATQnsFEG9Z6NAgGphClUlGLe4TUd?=
 =?us-ascii?Q?QtPFbDk9z61MPcrqI469t1C6ZCBMcZfBp8HZXz9jOGwUip6/05HlqmUU1qZC?=
 =?us-ascii?Q?ha0kwV+wlEm0FNPF6nFPD3zeCJzY6a0KmuRiGZ1owc24WpkY1BuIzm6e/L0+?=
 =?us-ascii?Q?8YCZ4BI6dxRNyea7R2R/i9TwWICn6Z/JtGAKxJFHN9G1P9KrWT/M1Z6wfEHw?=
 =?us-ascii?Q?p5uH2twFk/qxAoLesp7Ofw/+X7KKQelGDYkr1yE4BG6cv4fxIhBQQNfd6wcG?=
 =?us-ascii?Q?OSOF24yMcjRj8i7hxPoVzhCyR1iBFXqOgryl2EiE2cuTTRDod1otlWUdRCT7?=
 =?us-ascii?Q?KkjlrAlREDBMj+57DYrM8UQNu4j6jn+uM5b8gevzVprL3UwlH4hjCQXIONdR?=
 =?us-ascii?Q?J1hLT3NFkbqq4ThkWpvOnRfQimmu9fgQik2E3ogOLcMGsPbZgfFyP1DFiVS6?=
 =?us-ascii?Q?/1r5Dy6x9YCoHsjZgZq9DXqaBlbNbOgmVApB4Oc3pviWbJXIp7tXCt+Cn+of?=
 =?us-ascii?Q?73Szt4zFfFLmVI8xEKcDeUF/JYL+qh59zjlqwKua0aqOrFpBd29QLMRG5jVh?=
 =?us-ascii?Q?wEfnxFxDF5kP1yjUXEDrtGfmxMdxcPJgKUCLscErtnvi8UDVc+yCr4g7/QJk?=
 =?us-ascii?Q?zA2UojvQrTizrRGkXXHx5XiHx2txjKU1YR8s7+Ptyp45kC1LQDRRoXKg8RXx?=
 =?us-ascii?Q?4f5MGSuOHG406VqyGwxlJLDUFQVCaZ77fPKEtIUF?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LPTH+U7G05/rmWXrON/T6FqBbJ3YJ15PULgqJK6od6hHoHknxygvpB4DdA4oTZIL3udy1bs9kbD0lpHDtDc9feD+oNNeMredW21fbTXVl9glO7JrHJl3KAi7S90XopOmmEy/bW1Clqt9Ig950r+d9QAkVSHRva3YjyzvSpiidXBCQy+++s28VQIgSbyKS0I8g9wCf4+BI3FNq8Ib1sF4fTBZrkH0B5ml2pZa2zo+CnFgCu/ry1DvzJ/fclLSJshloXzBdK39nqlLLux9BSWBIV0jIB6XqubqlxvhRiUwvmGgHT1CRD9emWsTlC+LNj4webnzotkrNM1jfOJ0Cn+GVBXnPOU73B1qEbc4dOl6NFpCYc0yaI3hfZv2SABIU/Hh6jA3MD9JhPY6xIZBv1nQzRyrWaweO0RLxBVZn50N8QEbDghZj8gGvqM8LIGyd4pcWeJana0cOeFGPRllNz6pbUtJnVW/6CnKKjOyuUhNkuteT4OYyFaWzTJeECj/UjobLi2LI6/zY1WJXCtvFESpUsgZ0z5EaCyz05RLTq8sEqRbQr0PF1Q7lO/UGoacX1smshLXUPuJqD5VtKkNVUWe1PCnc2QjgSg/afwtFNgJX9U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f27a3683-2232-4def-559b-08dd1560e121
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 19:13:19.6488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dss2sNw6PN/SbLXkEHGHJWKPgV7wfD7OkHc370MV76Za9IAuwK20pmj9K8AM/g4xzunMPDjoTwqsGgYZd8+LYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4929
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_14,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412050141
X-Proofpoint-ORIG-GUID: IEe_ijalDd7TD16bwhliU8NSiwjUBfJ7
X-Proofpoint-GUID: IEe_ijalDd7TD16bwhliU8NSiwjUBfJ7

From: Eugene Loh <eugene.loh@oracle.com>

In 83da884cbdc5 ("Preface usym/umod/uaddr with pid"), a bug was fixed
in which addresses in the same module (or function) might be mapped to
multiple agg entries.  This fix helped the associated tests run much
more successfully.  Nonetheless, tests would sometimes still fail.

Another problem is that the tests themselves were overly narrow.  It
is fine for a module (or function) to appear multiple times in the
aggregation output... if those entries correspond to different pids.

Further, odd behaviors can result for some of the processes running on
a system.

Change the tests to add a "pid" agg key.  Filter on only a few, select
pids.  Distinguish agg entries by pid.

There are still occasional time outs observed with these tests,
presumably because the tick-2s probe is not firing (when profile-1234hz
is running).

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/profile-n/tst.ufunc.sh | 12 ++++++++----
 test/unittest/profile-n/tst.umod.sh  | 11 ++++++++---
 test/unittest/profile-n/tst.usym.sh  | 11 ++++++++---
 3 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/test/unittest/profile-n/tst.ufunc.sh b/test/unittest/profile-n/tst.ufunc.sh
index 243822407..f5174a1e2 100755
--- a/test/unittest/profile-n/tst.ufunc.sh
+++ b/test/unittest/profile-n/tst.ufunc.sh
@@ -11,10 +11,14 @@ tmpfile=$tmpdir/tst.profile_ufunc.$$
 script()
 {
 	$dtrace $dt_flags -qs /dev/stdin <<EOF
+	BEGIN
+	{
+		printf("dtrace is %d\n", \$pid);
+	}
 	profile-1234hz
 	/arg1 != 0/
 	{
-		@[ufunc(arg1)] = count();
+		@[ufunc(arg1), pid] = count();
 	}
 
 	tick-2s
@@ -52,9 +56,9 @@ if ! grep -q 'bash`[a-zA-Z_]' $tmpfile; then
 	status=1
 fi
 
-# Check that functions are unique.  (Exclude shared libraries and unresolved addresses.)
-if gawk '!/^ *(ld-linux-|lib|([^`]*`)?0x)/ {print $1}' $tmpfile | \
-     sort | uniq -c | grep -qv " 1 "; then
+# Check that functions are unique for each pid that interests us.
+dtpid=`awk '/^dtrace is [0-9]*$/ { print $3 }' $tmpfile`
+if gawk '$2 == '$child' || $2 == '$dtpid' {print $1, $2}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
 	echo ERROR: duplicate ufunc
 	status=1
 fi
diff --git a/test/unittest/profile-n/tst.umod.sh b/test/unittest/profile-n/tst.umod.sh
index 45d2b1e9b..7cfe2a073 100755
--- a/test/unittest/profile-n/tst.umod.sh
+++ b/test/unittest/profile-n/tst.umod.sh
@@ -11,10 +11,14 @@ tmpfile=$tmpdir/tst.profile_umod.$$
 script()
 {
 	$dtrace $dt_flags -qs /dev/stdin <<EOF
+	BEGIN
+	{
+		printf("dtrace is %d\n", \$pid);
+	}
 	profile-1234hz
 	/arg1 != 0/
 	{
-		@[umod(arg1)] = count();
+		@[umod(arg1), pid] = count();
 	}
 
 	tick-2s
@@ -52,8 +56,9 @@ if ! grep -wq 'bash' $tmpfile; then
 	status=1
 fi
 
-# Check that modules are unique.  (Exclude shared libraries and unresolved addresses.)
-if gawk '!/^ *lib/ && !/^ *ld-.*\.so / && !/^ *0x/ {print $1}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
+# Check that modules are unique for each pid that interests us.
+dtpid=`awk '/^dtrace is [0-9]*$/ { print $3 }' $tmpfile`
+if gawk '$2 == '$child' || $2 == '$dtpid' {print $1, $2}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
 	echo ERROR: duplicate umod
 	status=1
 fi
diff --git a/test/unittest/profile-n/tst.usym.sh b/test/unittest/profile-n/tst.usym.sh
index 634e633b3..8e373b976 100755
--- a/test/unittest/profile-n/tst.usym.sh
+++ b/test/unittest/profile-n/tst.usym.sh
@@ -11,10 +11,14 @@ tmpfile=$tmpdir/tst.profile_usym.$$
 script()
 {
 	$dtrace $dt_flags -qs /dev/stdin <<EOF
+	BEGIN
+	{
+		printf("dtrace is %d\n", \$pid);
+	}
 	profile-1234hz
 	/arg1 != 0/
 	{
-		@[usym(arg1)] = count();
+		@[usym(arg1), pid] = count();
 	}
 
 	tick-2s
@@ -52,8 +56,9 @@ if ! grep -q 'bash`[a-zA-Z_]' $tmpfile; then
 	status=1
 fi
 
-# Check that symbols are unique.  (Exclude shared libraries and unresolved addresses.)
-if gawk '!/^ *lib/ && !/^ *0x/ {print $1}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
+# Check that symbols are unique for each pid that interests us.
+dtpid=`awk '/^dtrace is [0-9]*$/ { print $3 }' $tmpfile`
+if gawk '$2 == '$child' || $2 == '$dtpid' {print $1, $2}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
 	echo ERROR: duplicate usym
 	status=1
 fi
-- 
2.43.5

