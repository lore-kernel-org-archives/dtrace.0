Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866BE165F0C
	for <dtrace@lists.linux.dev>; Fri,  1 Nov 2024 23:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730504779; cv=fail; b=BPivwMTN3Cpgkz9EZUvzdO16F+KA5R8mTTXI7PaYsqidrLsQNBf/FG5859XSeXeVU3B4QbTveYfG6oJAEdudJ5aCbMlR55ThG6adNhFqKVRk6tq1jwvHg4pi/EsqHYRzXqSNNoBmNbF3PyC7e3FMalvqXA8OwFdC1bf2E+YBPo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730504779; c=relaxed/simple;
	bh=ID8CpEtalp4iivhuqo9E2i9QKLRdUu+pdRYjEyZ1t5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MgqU1PHTz8KGY488bd5JgH08VWg/qoi3EqjK0Ir57i3I/S96US1NVH6GMBXjCDLCGZUXIua/+63GKYEX+GufRElUxA/CKlV2z9/Ukbo5KK53WpzuixmOqt6+6teagWoqWR4fSqZV75545QztxWOSY/pIxX3+zYfhkv4g5QSHUqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=P6kWnrey; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DbhxJwm7; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="P6kWnrey";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DbhxJwm7"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1GBckJ010908
	for <dtrace@lists.linux.dev>; Fri, 1 Nov 2024 23:46:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=Qi2s9JxE+msObKqZTX
	UfLVtJ4L1mSRE+imxbD0O7s+k=; b=P6kWnreycsyYWr5wxi7sTGDRjGESy3Qkos
	AqwUFPt3ZB2LRraV1a7X+wgZ0ZG/+KvLAR0/uX1eYrXLLorUuVrEwoU3iWcgkPDv
	RGDqB90Eh1nreoDK7B3ynK/8mSRMBD93gGXgSB9LlY3VhCGrSY0O+ipNaot/sDgD
	Yw9CQjeunxa0aNQTqtoZZj8Zv6W9SsRiIOb4EPg1QS28UAZu3mB1YxRikRpdNbTk
	mbGg5UM83Llq41VvrBd8Dun9dVO9mjT/PqzTlpKrNYODJWfFdhcrKKGBZ79xa+o4
	lM5lyjMszvmiJBn95Z6lDxevvBYUF1ctHMKM5KUAf96DoJdvdgrA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grysd9ky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Nov 2024 23:46:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1MHBm8034807
	for <dtrace@lists.linux.dev>; Fri, 1 Nov 2024 23:46:12 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hndc36vd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Nov 2024 23:46:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uvjnFcXBAaS3caFMSYIDWtfKcqiUKR7rEihwlx7QZhWEMAm/92GTQku7Q89T7UqTUP0z5NulH/gnRPiK94eFbjYxpFciuyNDSm6ej7om2cxLIknkvKxHlXbCoc84RYnzW3QnoUaMnGiIWxuXo4/HHwcpi8Jxz/htvEuXxNBH2TJnI3XheIePtJhQT+AE2cVFIgL4Czcq9ZfGdHQVB47+9hnZMjEoY6IgSo3xTuRo9DJ54IPcxMKqqbRpjyBDfgboj/jVIePWXP/8gybyKL3k1SKoBOrJYja85mZAxdsXWfPiQrLQ1spLuC7MD7eXZ1Lu2Pk+mWWk0lH+X5k6+dRbTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qi2s9JxE+msObKqZTXUfLVtJ4L1mSRE+imxbD0O7s+k=;
 b=Mvkp9nVkp6Ii30HDBfMzrNmxdn4l5ZqcvWT/1juaZvmwpJ3L6O6AhyZk8loiTKbgU16dnU3VqCuBYUgXRc3Pd4nff7n/zNYKki1rx1a5u6eVxo/ju/p/2M24cMMMp7RsqMF2FhwJ5xQpEfvj7DEIk4sD4WzwaxYAgkIg3SdU01lOX4csRsAK4uXXHsPVgPnWOf6/cmpB7xSpicsd2/ABviU96dnOnDEnORG7nFg1UMEoII+Pjrgyk7dR/uLsKDl/KXcfC0e9/BWkME076Hr0fv8qlvsEYc1pjX8S0hOemHbY8S8s5XfUzzwmT7bkAtr9EmEYBrO2ua3jLtMzMcofBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qi2s9JxE+msObKqZTXUfLVtJ4L1mSRE+imxbD0O7s+k=;
 b=DbhxJwm76jmRvSNtdNNK61ftH0GQwVQO/L8OqHcwPcjuqNxY9ZZIqH842WuMW0s+2YBPX2Jv+EamAQ/+eT367gid0iQ0Pi+V3K3eU1ZUMYSnBXB8a+YudWelNfVDHzizaICVnJM98+h1keUyg+hQr1gwAwCzc5/PvIdcDistWKM=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by CH3PR10MB7612.namprd10.prod.outlook.com (2603:10b6:610:17b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.26; Fri, 1 Nov
 2024 23:46:07 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8114.023; Fri, 1 Nov 2024
 23:46:07 +0000
Date: Fri, 1 Nov 2024 19:46:04 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v4 1/5] usdt: get arg types and xlations
 into DTrace from the DOF
Message-ID: <ZyVoPD2QmbcoA0el@oracle.com>
References: <20241101155712.397674-1-nick.alcock@oracle.com>
 <20241101155712.397674-2-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101155712.397674-2-nick.alcock@oracle.com>
X-ClientProxiedBy: BYAPR08CA0024.namprd08.prod.outlook.com
 (2603:10b6:a03:100::37) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|CH3PR10MB7612:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bf5cceb-73b0-42f9-b926-08dcfacf5b1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LFusVT9j+D6/sputgcgO3uGVKmZzdFD3wkClo6zRCZMmd9OVvs+LfXb4kJSi?=
 =?us-ascii?Q?0ebrT/HseMlg0CWl5jry2MqtrUN8I1TAZliC3HBDU9q5Zq6+zSDPYofd4hXi?=
 =?us-ascii?Q?F9oGKFzNxuLFFqVR+DnAx9Nmx6br5NoLRv2pnvsfxwv2N+dd00RStwMiWaAX?=
 =?us-ascii?Q?e8XoqgZ4drf3+ZfgkBHl7k+ErKRirc9knx+QJ0JQBr04p7QnsUkl/kDabdQZ?=
 =?us-ascii?Q?SKRs9HarW2xag5ZXlWE2zksyC8Hu5CTInM3p/jskYqshA9poRsfnmVmTWEb/?=
 =?us-ascii?Q?hUCFgcmctSnw1Btad0+SMyHG0/A37x/y27RwELR8p6NVSD+o+CAxI7q8gj77?=
 =?us-ascii?Q?upy9CLTuw0ufuFc5UTXqxLwqeEtzQCBIPpBR4OZ2dFJJVSwCeywB95qaWewq?=
 =?us-ascii?Q?axpejI9SfCxectXn8TENXVZDNrXbdoFuwgCOSQ/4sUEGxbpWbufPtnLJn/yF?=
 =?us-ascii?Q?2wPS14JMf2hZDhlgYuc3VojsZ4Xhabp9Tg7eEa5zPMZhH4SdZULM/kiG+C2H?=
 =?us-ascii?Q?aQm9BBBcQ1+oaViLfUSgNvEP2PeNe5dDlX4CVGcWS5f2X2PU5f7IPxDg2Kjv?=
 =?us-ascii?Q?DoPxSzfinQoS60LgC/VJIq5kGFKO1r5CfULIBautRFBGVR84Gsc7ANf6J2Jh?=
 =?us-ascii?Q?Vf3SQnQ0awSQ8+CHsBSFir53ikE7vLAy4iTv640HOaq/GgDyDMPGhGUZSMDs?=
 =?us-ascii?Q?+gop1eUhCmfBVuG+1251aRfnipCRSld+uVvrYMYGIR1sR8o/I2IH9HdBEVC4?=
 =?us-ascii?Q?oMaebYrOTbFxkwQ8dUdM/WLdtWIwXvQl+8YdnWD8VoJPbGCfwJ00UCm/QVEf?=
 =?us-ascii?Q?Ge8B+VJz4I+Ls4ORcv33SX3ZGKq4flvEAw1fQcidYhrak6G2fbKMRJwfMSeR?=
 =?us-ascii?Q?EQ8fG6fpgKjlCuDKyOcBgxUmoHeKd2QIfjBpSPvdv9uprCCQqLT4Ukk6qjAX?=
 =?us-ascii?Q?5NbJk1D4Xms8+IO7BOzy5wQkL1RfyqeVslOc9bThbpYK5E9jtASvKOTpXQYI?=
 =?us-ascii?Q?t3MQ+hf6Qnrf4qLufOvqzaTmwUZjRSHl77SbZLXStPMAgQ7UdmZC1U444iVv?=
 =?us-ascii?Q?KdYkyn8t5r17Zo+19z5bW6N4jWoHhRaXrcpWVbFHiZEKvsubjlHkCE3WyG2D?=
 =?us-ascii?Q?yUIDcY+1M4wONAE4GxXMsMsJaTJN2O5FEp361asi9+RzYtUtvAY9Kig8ilDD?=
 =?us-ascii?Q?NOREYkivWNm3ARf2hcUJM0cG4tW21g8hDoh4LwbYGwJgBqBOqfbVOs7mBw3w?=
 =?us-ascii?Q?QNOloMDcalHe/RILAC7Kpsyd8k/5sTFVY7GCUOQSlcjffZfFNw3pngj0A4ZU?=
 =?us-ascii?Q?0Pt5/UAg0lYPQmWpZodP2EK4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wV1OJfRfub12c21fqQEwRyddUB+DNbxt1zbE5SwiAlFaEyCJJuSEnoVM3ylR?=
 =?us-ascii?Q?j2P9Slm1MSl5/9KhjYYnaEL+y2pt1ogHOlKEjeXm+LklQhVR6g0uAC9MH7+u?=
 =?us-ascii?Q?YsRhjH6EsXDLckykV45JzgYiUgFB7AyOrVQ+btf01kanH5YwAEZL5FMies+r?=
 =?us-ascii?Q?rW1jl3wjReET77HJdchFDwtd1VEj+XZYcIi+UiL8y9fD4yQIklTKNX9popm0?=
 =?us-ascii?Q?8BzE9JZXeebHse0CD/KUQsbMAsbd2Ewae05nt+/pmURjn6fTejEOuC7ZCxrn?=
 =?us-ascii?Q?pPSbC6eJj2Eq82zV0W0My7+6bAcV69Oj3SbgYkvkeDZmfPsRriJ/FTN6njtD?=
 =?us-ascii?Q?kuOJ5Q6O+P+KHFI6HS9ubu4DbtOisyJ/UTLNv00oqMoWgml6PK1hIuhcnDa5?=
 =?us-ascii?Q?etjQOf1LSWpjYE64Ql76bwVbAXdc+DJM6LCZ28L7m1yw+qJ0zLY3vLZPCFd2?=
 =?us-ascii?Q?5OBpZ1WAx7dyUicqrRWioJJktI7zWRADf3ERdaAdEqxyosdf9HxstuZ9aZ9Y?=
 =?us-ascii?Q?WUSFxeubPTOLKQYP31Z6ABlaEoJ95OakWTepQu6J65xx4xbnv7UuqjVibzp2?=
 =?us-ascii?Q?IyHj5IpNUrXNl407p/YLkMhvyVq5S9+E3Mh21YoeYe/RGK+r3P+wAUq2/jq/?=
 =?us-ascii?Q?eX+ckRHb4IzkTlKuTYwbVYaqqBLuvoULexeDNCFKk3m5hPBgn9/Vf6ABlUIP?=
 =?us-ascii?Q?Sg3KZF4CzAVrwenr46VwXg77VK1x0RHuo+4ajmaZnqBKUW1omDHo6YxmKz46?=
 =?us-ascii?Q?Frjd1Fem5+kk1Eiq58pwQaDsVlyX80B5O47PZQr2rqAdLVvXeUzdAEwJ7UZM?=
 =?us-ascii?Q?pin9R13oIcLH+3LBW9NP1xjAHAABn7Wlgz4q9OI48I8kRJ5s04HQQqUksJI3?=
 =?us-ascii?Q?g4htasYwOpjT8m8hMJwl2suzqdOWMiEiop5XcuPK4u/4cM6xZavu54npEeW/?=
 =?us-ascii?Q?anuVNabaagBXkESaPEIQdV3lmeflrOn+ofNFkWKhDr/5vEvgwRZJhBWlnhcF?=
 =?us-ascii?Q?DmE8nNnrJLyKVnp6fXGbyB3gwXbgnxzQJu8zdnhNj6DGCOWmoh0T5Jv3BaTB?=
 =?us-ascii?Q?TjoXEmU602IRQ6kVwOcsVimhXL6tGS+PhHdrDCcZAlgcnLChOb+zO7tGO1rc?=
 =?us-ascii?Q?HgQgFwmEIl72dE+HocJwOgBHPJ65ZxMauEYpKhdArELraNuOMlkqFF8jEFrl?=
 =?us-ascii?Q?IoQYMJ9okyaJ8CxkG3Nt360SxLDO/+3vuhJQhmMv+68ffXcEypYDJ5FgVqMU?=
 =?us-ascii?Q?mohreV0/olBAqaEALIL5lixS4pvXMv8iuY4kl5o7pAJqHGHr+pMrY9fYl1T+?=
 =?us-ascii?Q?Xfta+/nlVt4I8qqBMWDBEw6e2FzfMkZJ1W0nH0CbQpuzPAq4AbtcDaSB0vnT?=
 =?us-ascii?Q?NTLmFGuP0TwER74Gp5pdlTFw1Gd96OkqfMstHlgbXkb99jP9BbGX0uLUe74M?=
 =?us-ascii?Q?1Jwp8tp2jCWBd8l06CFiK938h8JZsqDPh/N0p4sJAhMFJeAxViPd405FUdeF?=
 =?us-ascii?Q?d7IemmYKpJlErlbloQr15j+nbjZnFlzWNX7KBQE02Qrp6T8IJefeEC6wQIVv?=
 =?us-ascii?Q?GucIdIbkNCzOSRnlCcA21depfgJzCfAjpoeTqiTuLlpa6V7sMWc1sCRSKTdQ?=
 =?us-ascii?Q?wQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vr6B1DizjNdNDm9lLCdFyIDFW/XLxCdO00xvCTRdzkKj2LTB75B5M856p2wLLS9fuXKgZ1bi9OWt3UVwYtOk3PUB+ZIW3CkuDsezAS4Uqy91s+qPxynj6V79QneqWUlX4oeVWCm7gHDWtWPayXldq4WsSZLIwHGhZ4BgrkUpgfEDgCL/QAeAYfcv9izpek4zDH/ajgS7ZukhsRYk0ECgwtuMnRTgRVpSBv5vT/vruRWYZ7dfK5QPp1bD0uIDHOOLXUifmVbaTd2e1U8GyMzfX3INOOgNWX4Z7ErQk1orw8X8W8up8IQf7NodRbvcyrWOIKV1+bvicY5bcewSjx2YkIMBgbFh1qFPDwPKLzsk4KBufwOyYOQypyETIjfOIlWOh3SZ86Vmj08byKAxrgp4/F2NQAWK5ytc/sMgfE5RGfHZd1UUrDmLcYBOOimu++a5SGW8Wp9pGcWLeaZOQBNhd6J5WezWgNP5lozx9vNVvGic6iSTOkBZWp9RXYJjcV6fiyZNFpeTmJrkZ3z72Pr+1lvabPxRNnRNZCdKLcHZ8VOIothcK6mN9PJ98mX+BKUqUMKrGeYBkLX80xyW2OzzPf+LO6fad67LNVRGAVg0dao=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bf5cceb-73b0-42f9-b926-08dcfacf5b1d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 23:46:07.5758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5QwoE7oNveFLONM/WfOpWfGwJTvDx51YMoYyFm3sC8NAF8SGtV9xxmZTDoDBnfahWr4gUlyQBXGDdFtwvGWPeldEA+MdD3zV0fInkFUHaVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7612
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-01_18,2024-11-01_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411010175
X-Proofpoint-ORIG-GUID: w0Cy9h5YjNtCo5vDNt9-MiwIBkbiq3-_
X-Proofpoint-GUID: w0Cy9h5YjNtCo5vDNt9-MiwIBkbiq3-_

Two comments below (one tiny thing, and one explanatory comment that I *think*
I have a better suggestion for, but you may want to rephrase it).

On Fri, Nov 01, 2024 at 03:57:08PM +0000, Nick Alcock via DTrace-devel wrote:
> This change propagates native and xlated arg types and mapping info all
> the way from the DOF, through the parser and dtprobed and the DOF stash,
> into DTrace, where they end up in the pid_probespec_t for USDT probes.
> We don't do anything with them once they get there in this commit: no
> user-visible impacts expected.
> 
> We bump the DOF_PARSED_VERSION since we add three new types of record to the
> dof_parser_t, all optional, covering native and xlated args and arg mapping
> tables; to make life easier for consumers we emit them in a defined order
> (documented in dof_parser.h), and add arg counts to the DIT_PROBE record
> that precedes them indicating which will be present and how many args are in
> them.  This means we retain the property that you can always tell which
> records within a provider are coming next purely from records you already
> have: there's no need to make decisions once the records turn up.  The DOF
> stash hardly changes: all that happens is that the parsed data written to
> each per-probe file gains some extra types of record (it can have
> DIT_ARGS_NATIVE, DIT_ARGS_XLAT and DIT_ARGS_MAP entries following the
> DIT_PROBE record now).
> 
> As usual with DOF_PARSED_VERSION bumps, DTraces that cross this change will
> refuse to read probes added by dtprobeds that are on the other side of it.
> (Restarting dtprobed will reparse all the probes in the stash to match the
> new layout, and newly-started DTraces will pick that up -- so this only
> affects running DTraces picking up new probes, which DTrace cannot do yet:
> so no visible effects are expected.)
> 
> The code is a bit repetitive, with nargs, xargs and arg mapping all handled
> separately even though the code is very similar.  In future maybe we could
> unify them (but my attempts led to code that was much harder to read than
> the original).
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>  dtprobed/dof_stash.c   |  15 +++--
>  dtprobed/dtprobed.c    |  10 ++-
>  include/dtrace/pid.h   |   7 ++
>  libcommon/dof_parser.c | 150 +++++++++++++++++++++++++++++++----------
>  libcommon/dof_parser.h |  64 ++++++++++++++++--
>  libdtrace/dt_pid.c     |  59 ++++++++++++++++
>  6 files changed, 256 insertions(+), 49 deletions(-)
> 
> diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
> index 0e639076f655..8bf465678217 100644
> --- a/dtprobed/dof_stash.c
> +++ b/dtprobed/dof_stash.c
> @@ -59,8 +59,10 @@
>   *    startup if the dof_parsed_t structure changed.  The file consists of a
>   *    uint64_t version number (DOF_PARSED_VERSION), then a stream of
>   *    dof_parsed_t records, the first of type DIT_PROVIDER, the second
> - *    DIT_PROBE, then as many struct dof_parsed_t's of type DIT_TRACEPOINT as
> - *    the DIT_PROBE record specifies.
> + *    DIT_PROBE, then optionally some DIT_*ARGS records (if the count of native
> + *    args in the probe is >0, you get a DIT_NATIVE_ARGS: if the count of xlated
> + *    args is >0, you get DIT_XLAT_ARGS and DIT_MAP_ARGS), then as many struct
> + *    dof_parsed_t's of type DIT_TRACEPOINT as the DIT_PROBE record specifies.
>   *
>   * /run/dtrace/probes/: Per-probe info, written by dtprobed, read by DTrace.
>   *
> @@ -640,9 +642,14 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
>  			break;
>  		}
>  
> -		/* Tracepoint: add to already-open file.  */
> +		/* Args info or tracepoint: add to already-open file.  */
> +		case DIT_ARGS_NATIVE:
> +		case DIT_ARGS_XLAT:
> +		case DIT_ARGS_MAP:
>  		case DIT_TRACEPOINT:
> -			assert(state == DIT_PROBE || state == DIT_TRACEPOINT);
> +			assert(state == DIT_PROBE || state == DIT_ARGS_NATIVE ||
> +			       state == DIT_ARGS_XLAT || state == DIT_ARGS_MAP ||
> +			       state == DIT_TRACEPOINT);
>  			state = accump->parsed->type;
>  
>  			if (write_chunk(parsed_fd, accump->parsed, accump->parsed->size) < 0)
> diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
> index f4c6be1e045d..2ca39b26f88a 100644
> --- a/dtprobed/dtprobed.c
> +++ b/dtprobed/dtprobed.c
> @@ -791,16 +791,20 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
>  		if (dof_stash_push_parsed(&accum, probe) < 0)
>  			goto oom;
>  
> -		for (j = 0; j < probe->probe.ntp; j++) {
> +		j = 0;
> +		do {
>  			dof_parsed_t *tp = dof_read(pid, in);
>  
>  			errmsg = "no tracepoints in a probe, or parse state corrupt";
> -			if (!tp || tp->type != DIT_TRACEPOINT)
> +			if (!tp || tp->type == DIT_PROVIDER || tp->type == DIT_PROBE)
>  				goto err;
>  
>  			if (dof_stash_push_parsed(&accum, tp) < 0)
>  				goto oom;
> -		}
> +
> +			if (tp->type == DIT_TRACEPOINT)
> +				j++;
> +		} while (j < probe->probe.ntp);
>  	}
>  
>  	if (!reparsing)
> diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
> index 0129674adf0c..25bfacfdbfe2 100644
> --- a/include/dtrace/pid.h
> +++ b/include/dtrace/pid.h
> @@ -35,6 +35,13 @@ typedef struct pid_probespec {
>  	ino_t pps_inum;				/* object inode */
>  	char *pps_fn;				/* object full filename */
>  	uint64_t pps_off;			/* probe offset (in object) */
> +	int pps_nargc;				/* number of native args */
> +	int pps_xargc;				/* number of xlated and mapped args */
> +	char *pps_nargv;			/* array of native args */
> +	size_t pps_nargvlen;			/* (high estimate of) length of array */
> +	char *pps_xargv;			/* array of xlated args */
> +	size_t pps_xargvlen;			/* (high estimate of) length of array */
> +	int8_t *pps_argmap;			/* mapped arg indexes */
>  
>  	/*
>  	 * Fields below this point do not apply to underlying probes.
> diff --git a/libcommon/dof_parser.c b/libcommon/dof_parser.c
> index d6631a1afdcb..dd3a6cd2b887 100644
> --- a/libcommon/dof_parser.c
> +++ b/libcommon/dof_parser.c
> @@ -807,10 +807,11 @@ validate_provider(int out, dof_hdr_t *dof, dof_sec_t *sec)
>  		}
>  
>  		dt_dbg_dof("      Probe %d %s:%s:%s:%s with %d offsets, "
> -			   "%d is-enabled offsets\n", j,
> +			   "%d is-enabled offsets, %i args, %i nargs, argidx %i\n", j,
>  			   strtab + prov->dofpv_name, "",
>  			   strtab + prb->dofpr_func, strtab + prb->dofpr_name,
> -			   prb->dofpr_noffs, prb->dofpr_nenoffs);
> +			   prb->dofpr_noffs, prb->dofpr_nenoffs,
> +			   prb->dofpr_xargc, prb->dofpr_nargc, prb->dofpr_argidx);
>  	}
>  
>  	return 0;
> @@ -879,12 +880,26 @@ validate_probe(int out, dtrace_helper_probedesc_t *dhpb)
>  	return 0;
>  }
>  
> +static size_t
> +strings_len(const char *strtab, size_t count)
> +{
> +	size_t len = 0;
> +
> +	for (; count > 0; count--) {
> +		size_t this_len = strlen(strtab) + 1;
> +
> +		len += this_len;
> +		strtab += this_len;
> +	}
> +	return len;
> +}
> +
>  static void
>  emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
>  {
>  	int		i;
> -	dof_parsed_t	*probe_msg;
> -	size_t		probe_msg_size;
> +	dof_parsed_t	*msg;
> +	size_t		msg_size;
>  	char		*ptr;
>  
>  	dt_dbg_dof("      Creating probe %s:%s:%s:%s\n", dhpb->dthpb_prov,
> @@ -893,35 +908,106 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
>  	if (validate_probe(out, dhpb) != 0)
>  		return;
>  
> -	probe_msg_size = offsetof(dof_parsed_t, probe.name) +
> -	    strlen(dhpb->dthpb_mod) + 1 + strlen(dhpb->dthpb_func) + 1 +
> -	    strlen(dhpb->dthpb_name) + 1;
> +	/*
> +	 * Compute the size of all the optional elements first, to fill out the
> +	 * flags.
> +	 */
>  
> -	probe_msg = malloc(probe_msg_size);
> -	if (!probe_msg) {
> -		dof_error(out, ENOMEM, "Out of memory allocating probe");
> -		return;
> -	}
> +	msg_size = offsetof(dof_parsed_t, probe.name) +
> +		   strlen(dhpb->dthpb_mod) + 1 +
> +		   strlen(dhpb->dthpb_func) + 1 +
> +		   strlen(dhpb->dthpb_name) + 1;
>  
> -	memset(probe_msg, 0, probe_msg_size);
> +	msg = malloc(msg_size);
> +	if (!msg)
> +		goto oom;
>  
> -	probe_msg->size = probe_msg_size;
> -	probe_msg->type = DIT_PROBE;
> -	probe_msg->probe.ntp = dhpb->dthpb_noffs + dhpb->dthpb_nenoffs;
> -	ptr = stpcpy(probe_msg->probe.name, dhpb->dthpb_mod);
> +	memset(msg, 0, msg_size);
> +
> +	msg->size = msg_size;
> +	msg->type = DIT_PROBE;
> +	msg->probe.ntp = dhpb->dthpb_noffs + dhpb->dthpb_nenoffs;
> +	msg->probe.nargc = dhpb->dthpb_nargc;
> +	msg->probe.xargc = dhpb->dthpb_xargc;
> +
> +	ptr = stpcpy(msg->probe.name, dhpb->dthpb_mod);
>  	ptr++;
>  	ptr = stpcpy(ptr, dhpb->dthpb_func);
>  	ptr++;
>  	strcpy(ptr, dhpb->dthpb_name);
> -	dof_parser_write_one(out, probe_msg, probe_msg_size);
> +	dof_parser_write_one(out, msg, msg_size);
>  
> -	free(probe_msg);
> +	free(msg);
>  
> -	/* XXX TODO translated args
> -	   pp->ftp_nargs = dhpb->dthpb_xargc;
> -	   pp->ftp_xtypes = dhpb->dthpb_xtypes;
> -	   pp->ftp_ntypes = dhpb->dthpb_ntypes;
> -	*/
> +	/*
> +	 * Emit info on all native and translated args in turn.
> +	 *
> +	 * FIXME: this code is a bit repetitious.
> +	 *
> +	 * First native args (if any).
> +	 */
> +
> +	if (dhpb->dthpb_nargc > 0) {
> +		size_t	nargs_size;
> +
> +		nargs_size = strings_len(dhpb->dthpb_ntypes, dhpb->dthpb_nargc);
> +		msg_size = offsetof(dof_parsed_t, nargs.args) + nargs_size;
> +
> +		msg = malloc(msg_size);
> +		if (!msg)
> +			goto oom;
> +
> +		memset(msg, 0, msg_size);
> +
> +		msg->size = msg_size;
> +		msg->type = DIT_ARGS_NATIVE;
> +		memcpy(msg->nargs.args, dhpb->dthpb_ntypes, nargs_size);
> +		dof_parser_write_one(out, msg, msg_size);
> +
> +		free(msg);
> +
> +		/* Then translated args. */
> +
> +		if (dhpb->dthpb_xargc > 0) {
> +			size_t	xargs_size, map_size;
> +
> +			xargs_size = strings_len(dhpb->dthpb_xtypes,
> +						 dhpb->dthpb_xargc);
> +			msg_size = offsetof(dof_parsed_t, xargs.args) +
> +				   xargs_size;
> +
> +			msg = malloc(msg_size);
> +			if (!msg)
> +				goto oom;
> +
> +			memset(msg, 0, msg_size);
> +
> +			msg->size = msg_size;
> +			msg->type = DIT_ARGS_XLAT;
> +			memcpy(msg->xargs.args, dhpb->dthpb_xtypes, xargs_size);
> +			dof_parser_write_one(out, msg, msg_size);
> +
> +			free(msg);
> +
> +			/* Then the remapping table. */

remapping -> mapping

> +
> +			map_size = dhpb->dthpb_xargc * sizeof(int8_t);
> +			msg_size = offsetof(dof_parsed_t, argmap.argmap) +
> +				   map_size;
> +
> +			msg = malloc(msg_size);
> +			if (!msg)
> +				goto oom;
> +
> +			memset(msg, 0, msg_size);
> +
> +			msg->size = msg_size;
> +			msg->type = DIT_ARGS_MAP;
> +			memcpy(msg->argmap.argmap, dhpb->dthpb_args, map_size);
> +			dof_parser_write_one(out, msg, msg_size);
> +			free(msg);
> +		}
> +	}
>  
>  	/*
>  	 * Emit info on each tracepoint in turn.
> @@ -938,18 +1024,10 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
>  	for (i = 0; i < dhpb->dthpb_nenoffs; i++)
>  		emit_tp(out, dhpb->dthpb_base, dhpb->dthpb_enoffs[i], 1);
>  
> -	/*
> -	 * XXX later:
> -	 * If the arguments are shuffled around we set the argument remapping
> -	 * table. Later, when the probe fires, we only remap the arguments
> -	 * if the table is non-NULL.
> -	 *
> -	for (i = 0; i < dhpb->dthpb_xargc; i++) {
> -		if (dhpb->dthpb_args[i] != i) {
> -			pp->ftp_argmap = dhpb->dthpb_args;
> -			break;
> -		}
> -	} */
> +	return;
> + oom:
> +	dof_error(out, ENOMEM, "Out of memory allocating %zi bytes for probe",
> +		  msg_size);
>  }
>  
>  static void
> diff --git a/libcommon/dof_parser.h b/libcommon/dof_parser.h
> index d3a6836f15fd..8f42d00551e3 100644
> --- a/libcommon/dof_parser.h
> +++ b/libcommon/dof_parser.h
> @@ -15,10 +15,19 @@
>  #include <dtrace/helpers.h>
>  
>  /*
> - * Result of DOF probe parsing.  We receive a provider info structure, followed
> - * by N probe info structures each of which is followed by possibly many
> - * tracepoint info structures, all tagged.  Things not yet used for probe
> - * creation (like args, translated types, etc) are not returned.
> + * Result of DOF probe parsing.  The order of elements in the parsed stream
> + * is:
> + *
> + * DIT_PROVIDER (at least 1, which contains...)
> + *   DIT_PROBE (at least 1, each of which has...)
> + *     DIT_ARGS_NATIVE (1, optional)
> + *     DIT_ARGS_XLAT (1, optional)
> + *     DIT_ARGS_MAP (1, optional)
> + *     DIT_TRACEPOINT (any number >= 1)
> + *
> + * The dof_parsed.provider.flags word indicates the presence of the
> + * various optional args records in the following stream (you can rely on
> + * them if it simplifies things, but you don't have to).
>   *
>   * On error, a DIT_ERR structure is returned with an error message.
>   */
> @@ -27,7 +36,10 @@ typedef enum dof_parsed_info {
>  	DIT_PROVIDER = 0,
>  	DIT_PROBE = 1,
>  	DIT_TRACEPOINT = 2,
> -	DIT_ERR = 3
> +	DIT_ERR = 3,
> +	DIT_ARGS_NATIVE = 4,
> +	DIT_ARGS_XLAT = 5,
> +	DIT_ARGS_MAP = 6,
>  } dof_parsed_info_t;
>  
>  /*
> @@ -37,7 +49,7 @@ typedef enum dof_parsed_info {
>   * start which is the version of the dof_parseds within it.  The data flowing
>   * over the stream from the seccomped parser has no such prefix.
>   */
> -#define DOF_PARSED_VERSION 1
> +#define DOF_PARSED_VERSION 2
>  
>  typedef struct dof_parsed {
>  	/*
> @@ -59,18 +71,58 @@ typedef struct dof_parsed {
>  			 */
>  			char name[1];
>  		} provider;
> +
>  		struct dpi_probe_info {
>  			/*
>  			 * Number of tracepoints that follow.
>  			 */
>  			size_t ntp;
>  
> +			/*
> +			 * Number of native arguments that follow (if > 0, a
> +			 * DIT_ARGS_NATIVE will be received).
> +			 */
> +			size_t nargc;
> +
> +			/*
> +			 * Number of xlated arguments that follow (if > 0, a
> +			 * DIT_ARGS_XLAT and DIT_ARGS_MAP will be received).
> +			 */
> +			size_t xargc;
> +
>  			/*
>  			 * Probe module, function, and name (\0-separated).
>  			 */
>  			char name[1];
>  		} probe;
>  
> +		/* V2+ only.  */
> +		struct dpi_probe_args_native_info {
> +			/*
> +			 * Array of native args.  nargc in length.
> +			 */
> +			char args[1];
> +		} nargs;
> +
> +		/* V2+ only.  */
> +		struct dpi_probe_args_xlat_info {
> +			/*
> +			 * Array of translated args.  xargc in length.
> +			 */
> +			char args[1];
> +		} xargs;
> +
> +		/*
> +		 * V2+ only.
> +		 */
> +		struct dpi_probe_args_map_info {
> +			/*
> +			 * Mapping from native arg index to xlated arg index.
> +			 * xargc in length.

This comment is confusing...  I think it might be better served by really
spelling out which is which.  I.e. each of the xargc elements specifies the
native arg index that the translated arg gets its value from.

> +			 */
> +			int8_t argmap[1];
> +		} argmap;
> +
>  		struct dpi_tracepoint_info {
>  			/*
>  			 * Offset of this tracepoint.
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index 41a87955ec1b..71ac1754d343 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -866,6 +866,9 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
>  		uint64_t *dof_version;
>  		char *prv, *mod, *fun, *prb;
>  		dof_parsed_t *provider, *probe;
> +		ssize_t nargvlen = 0, xargvlen = 0;
> +		char *nargv = NULL, *xargv = NULL;
> +		int8_t *argmap = NULL;
>  
>  		/*
>  		 * Regular files only: in particular, skip . and ..,
> @@ -917,6 +920,47 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
>  		p += probe->size;
>  		seen_size += probe->size;
>  
> +		/*
> +		 * Assume the order given in dof_parser.h, for simplicity.
> +		 */
> +		if (probe->probe.nargc > 0) {
> +			dof_parsed_t *args = (dof_parsed_t *) p;
> +
> +			if (!validate_dof_record(path, args, DIT_ARGS_NATIVE,
> +						 dof_buf_size, seen_size))
> +				goto parse_err;
> +
> +			nargv = args->nargs.args;
> +			nargvlen = args->size - offsetof(dof_parsed_t, nargs.args);
> +			assert(nargvlen >= 0);
> +
> +			p += args->size;
> +			seen_size += args->size;
> +		}
> +		if (probe->probe.xargc > 0) {
> +			dof_parsed_t *args = (dof_parsed_t *) p;
> +
> +			if (!validate_dof_record(path, args, DIT_ARGS_XLAT,
> +						 dof_buf_size, seen_size))
> +				goto parse_err;
> +
> +			xargv = args->xargs.args;
> +			xargvlen = args->size - offsetof(dof_parsed_t, xargs.args);
> +			assert(xargvlen >= 0);
> +
> +			p += args->size;
> +			seen_size += args->size;
> +
> +			if (!validate_dof_record(path, args, DIT_ARGS_MAP,
> +						 dof_buf_size, seen_size))
> +				goto parse_err;
> +
> +			argmap = args->argmap.argmap;
> +
> +			p += args->size;
> +			seen_size += args->size;
> +		}
> +
>  		/*
>  		 * Now the parsed DOF for this probe's tracepoints.
>  		 */
> @@ -967,6 +1011,21 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
>  			psp.pps_off = tp->tracepoint.addr - pmp->pr_file->first_segment->pr_vaddr;
>  			psp.pps_nameoff = 0;
>  
> +			if (nargv) {
> +				psp.pps_nargc = probe->probe.nargc;
> +				psp.pps_nargvlen = nargvlen;
> +				psp.pps_nargv = nargv;
> +			}
> +
> +			if (xargv) {
> +				psp.pps_xargc = probe->probe.xargc;
> +				psp.pps_xargvlen = xargvlen;
> +				psp.pps_xargv = xargv;
> +			}
> +
> +			if (argmap)
> +				psp.pps_argmap = argmap;
> +
>  			dt_dprintf("providing %s:%s:%s:%s for pid %d\n", psp.pps_prv,
>  				   psp.pps_mod, psp.pps_fun, psp.pps_prb, psp.pps_pid);
>  			if (pvp->impl->provide_probe(dtp, &psp) < 0) {
> -- 
> 2.46.0.278.g36e3a12567
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
