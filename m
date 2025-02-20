Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9487F1E0B86
	for <dtrace@lists.linux.dev>; Thu, 20 Feb 2025 04:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740026639; cv=fail; b=dwSKH+sD2vw80olbKB6WMozsV98ZLTnLYRhoMbprbzOB/4qv/iKCRHR/rU3kBZsOlkuo6BR3W0tbKAwtyS3w3FzEiVCZRIFHoT3b/RvavtEPNKBIhicFzwK3Glry54/rrgS56aONJIs+qjUAqC79Dplik71YcuUjoGoPf6TwyWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740026639; c=relaxed/simple;
	bh=wjyM3EixpgLiCF82x7y4Yu/MGC5mIyo7Rqp0Hd/fwKE=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=qZsi2UodfH3lsS0A6uy05PfLnC3wtMAtSA6isXlPG8I/BlnytIj+9aSWqJlKy35f2rtJYqCHN/UNO52O2l24t2PKOeUFsm7F0u5AMYpI4cmXh9AFGG0OhXbfXNwGOypNJ6MWymqJgVujYjMSYqE5JFBTWpMo/pm0KQjE3k6/Dgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=j9Ux7QtQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=L0dVDw8t; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="j9Ux7QtQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="L0dVDw8t"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JMZdP2012632
	for <dtrace@lists.linux.dev>; Thu, 20 Feb 2025 04:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=AlaopYqDsEh/pMqGbbQr2k+Q/owZbWFcW+C7Ta8PFSk=; b=
	j9Ux7QtQINaJ5klgPB5irRl+OhH34NJxCiiddAhz2UHk/s2X3U8X5zF79ECk0nGU
	q/nlt/WD5PvrKggHj6KefYVovleuaYZ6cJQbDaqeAJXlYvibducL1zZxz2evNngA
	DpSyhT4sM2ktM8MNOoSdXHVB/LNrOjHfuYCiHrQrjl7iTdMp9PncGHvEAqMmcIha
	kMztp9ClnXgSlLYALh/FYQtpgacG9MyG7T506di28ChBP7Dha04yv1aT5eO+EC+a
	Gc2lzfvE0rwCLnCbOUcG/kyOXzJNOZaVwIeO1tyOxPB/uSao1jeO/twcB+G94ADK
	UX7wfHeSSWkRr5I4Z2k7Nw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44w00kkc9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 20 Feb 2025 04:43:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51K2PWZR002107
	for <dtrace@lists.linux.dev>; Thu, 20 Feb 2025 04:43:55 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44w0tmn4kc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 20 Feb 2025 04:43:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhRSf3lqWrugjR0mQe5FZmCOjTP+m49eQ0mdJILBkAtZX8jxFKvgVhi1hGq24aaN7V5GhK5SqoSNrVXshJ0Lw8qpNDKAmaegtT5/0s0Pymbt4SZHtYwJCDTx9nNDC/+shir438Ykrjat7yxuqRiJEmTvT2y6h4/scXR/5cNcpo1X8cHyOJJQmTRYG039C5LswUOF7B8H0ccxFqX1KD2SFun1b+VKk+YHctYKC4J1QJcYSIp1eslfQ6L3z8+Z/eLgCAxHo+qLJDYnPTyIlgATzmJxpDuwh2S0GX3tfJXrhJleCyL3qsl0LyAQ2fXbaitS8UQgJI+aBzYO93F3WRyknw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlaopYqDsEh/pMqGbbQr2k+Q/owZbWFcW+C7Ta8PFSk=;
 b=wjo47TuVO3qWlIsVram1/NhlSHj7jbkhJUOhWyRLTDC6OxubUxK8iRLjSeaezkNVr3vJRWUkoUc3sHQGKZ9Y6Kje7jL4uf6DZzrT6Gh6HDaQN7Rg3e3liuAEZCTV6nhrkPHHGzoJKV7ZoGMziiAAbjJ/ujnKGybOpHSP9T9Bn1P+jJLKrfo09L/239k3lvL+B4UMr6DnLssnXyoUX1ca8RHC8bycdIWUHYWfNLyNbkoe5myTRpAML9d2pFyTW271sQj/DJ0evQ8QroAERoHlT2ZWvLkKhOtsRlNhLb66QOj2J6J6dBqih6r/MwEBvCF7dkStKjtP2c9aK2aT3veUhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AlaopYqDsEh/pMqGbbQr2k+Q/owZbWFcW+C7Ta8PFSk=;
 b=L0dVDw8tJOOjx6kyufNjCswvJDKJ9IMY7e2mGtorR06VrhXqTAtDf79uSRr2i3P1+7K2G0Kir1yizQziAg3SCkpms9in+JcWCYJ2GZCkT5wZCzhBp6vCPwJeK1+jgJsDixX2l1YfXKEmP0IAUxMDYWf312X5fN7stqmXk2Vxoas=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ2PR10MB7084.namprd10.prod.outlook.com (2603:10b6:a03:4c4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Thu, 20 Feb
 2025 04:43:53 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8466.013; Thu, 20 Feb 2025
 04:43:52 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/2] Clarify how the usdt_prids key is stored on the BPF stack
Date: Wed, 19 Feb 2025 23:43:49 -0500
Message-Id: <20250220044350.14953-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0077.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::22) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ2PR10MB7084:EE_
X-MS-Office365-Filtering-Correlation-Id: 691acfb3-7db6-4be6-4f75-08dd51692caf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UbT4NL5f+KbG1XMn75atSL4RpfdS7ChYn6qydni8AZr3jH7e4PQ4N4dunGF5?=
 =?us-ascii?Q?bRrbhXKYApteMal8pS1Zg9dv4NEvDdvcjZ7J6DacK47/idrqkvOaoBMYWeOW?=
 =?us-ascii?Q?+QaIURP6X6hAahQ3SL4Diow9co/qfX7SM5f2k2xAk26GCLIZcOpADnK4iQ5s?=
 =?us-ascii?Q?w2A1BJuQxIPiFflLlYG6fnZf0F6RjwdACYXa0GucHBb57kZtBJ9M6nnQ9oxS?=
 =?us-ascii?Q?anwQVSvxHMU/ho2GGq2Ixg0aZuF6uSmFRRZAanC55GxEzMBj738YDW6MSTqI?=
 =?us-ascii?Q?GTfbKuCbPOqXFw4iW3NdZMcs6OJF11kzaPAKGeALpQH6zdY915gvYSpkfARr?=
 =?us-ascii?Q?MYbNy27sQJLAGlqqx1yORlimQ4sQrNykIaY5X2qPymXDY65SD8vLmZ4zvV8S?=
 =?us-ascii?Q?26E94VgpyfiGwIWmvF6YIR0d1KFh48yBybvxUEkI9waW96/k688Kv2BDF+qy?=
 =?us-ascii?Q?OSPk0is/FyzqjeQP63koM3nbrhnTS7RNaMomDSNDQ9UZE33jvVNvXVOh+YpY?=
 =?us-ascii?Q?wzUtfwxatFJn8MjalEf6Vb/jKLYyRQEPILN7fO3NSS+OdaSW2DJpRz/qnkCB?=
 =?us-ascii?Q?Fb0clt17hZAH436RzKGSPwV8RzCG1rDogN1TEn+DeelshNlE46yBKNZUCHE7?=
 =?us-ascii?Q?QfRMGa+AGsLZ0XyvshRAaRFF32+XpzZEARmJ11j+yXfmX9qxu1qS/k0w78te?=
 =?us-ascii?Q?pZFlEzq4X9vL8R5nU95hvuewW5IxlQ/EuRRoV50KtTuOLVc1Reyxg3FXtD/5?=
 =?us-ascii?Q?ucnToTBsiX67ASyDJKA1RebKODIwr04TFQnHVDDs8qdZAqrwWpWUJdnX1vrk?=
 =?us-ascii?Q?IS4mXtxhH0eajlVLYLU5oshgxp1e3siGCBet91dqluGcOpbt2HXQBWmHLpr3?=
 =?us-ascii?Q?ZmEth1yw2q8fFcdwHyjYDX8f/PokdpRmmjdvsV3ccebt7J+iRDJnj7lZuAKA?=
 =?us-ascii?Q?Q4O6yj5+ShkgI0vxkw6ckSlnai8MJMarSn6aW+LRZFkMqXgADizGIZjovvQc?=
 =?us-ascii?Q?SSITqz3Y6JZDMiA4MOLjtfl1Jn7ZRi3Vl6Fpbhwjzsq8uGiAIdZ+3BOAyZxZ?=
 =?us-ascii?Q?DEw6tM0Phkeer8McrOtE4jRhq+aFZ7NAAIlEfT0SKf+T9eTc2aHumIfb8Ni2?=
 =?us-ascii?Q?IjYVOkc9c9p6Rr1ddiGgz9rZ/ETMbycGy42AtOHjsTcBqTyEwustS2kuXobu?=
 =?us-ascii?Q?94xJ1C/OzNB915gaIiU5WGN6a/YaJYib549z2kZWiN3wX435UZyCGJnzuOhx?=
 =?us-ascii?Q?8w4j7aEW1/MXkpXipUX/sdCJGQugS8PGaEOLTD5j+njlqi9tlY6rmzptxV4U?=
 =?us-ascii?Q?MWOT6w4ljI60oTRNZTTEc1/Gof/nEubwSfSFCvkaO/WALmmjpcc77QUzs2V1?=
 =?us-ascii?Q?SVt2hLeU5PepDCD9bevHMY0tb+7t?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4rcD3bWWeVobNAlS/qdIQQSxRtpx+4QL7fq9NKvPMi7tv+2RvnWH6FkQrSF5?=
 =?us-ascii?Q?1JEVArhkpAOeCa2nQfepDIkz+IiddXy1zwiLxzpxK0ihojk7mVkBaw/MndDH?=
 =?us-ascii?Q?5/wWRKtoDdaU5fsZyAO57z7CL95+6r+IAHMbq0IGcjoSDVrgLs+kS56zh4iC?=
 =?us-ascii?Q?AYttGfAgqgHaZiqpR+W1GmtdtwwVbOkom2M4NsuYBs0GQzj/IaqCqBnB+EY8?=
 =?us-ascii?Q?dWnPL83DQukLdJszm7xAMW5TluA6ogIKZC6Gc4xt0uUwqk2P+vkB8AWgxtTL?=
 =?us-ascii?Q?pke0n/XGMGTXxP4cBCi2/r+wWX23Bto3Wubv/TMpo+6Hji1w5vuETNKvPbTg?=
 =?us-ascii?Q?8iN1YBcvA1pqkDjq4huRNn5wzYkmTAQXbCtGn75T1utS2QNM+49EnTtfBmCi?=
 =?us-ascii?Q?zPhoMSaPPFY4MfOQA5rAoRhBqebqnprzzMbzqVBUPRXIbHQ7hyURkmIGArXT?=
 =?us-ascii?Q?TweF1ZMQqT96dOWDcn6JOi3ZqtuNJMDMxR4z8IYosI0cJDI8bm+A31ZCkDWO?=
 =?us-ascii?Q?f9Kv9n0tNMk+qXShjbmAmamfk6fhqd1cvxmD7wsCaCmWxKjHIR60nJe0vm2p?=
 =?us-ascii?Q?lxshphEbmEwF7xZPiGt7iGMRohCRM+BS1DJV37gO8qw5zRpaBozLoxwzGo0z?=
 =?us-ascii?Q?7RE88k6GBhu+FZJLvsJRQ+nJdock6FmIx55UjOL7VkYgNzM2gZZhz78u2QaF?=
 =?us-ascii?Q?FusWfFsoFeWJNmPMN4//nXnleQJyr+g/YnFA78mp+3ZzuIHJ+KwhFbF5Cdgm?=
 =?us-ascii?Q?89IDeRY/xgtA2NTk7BFUxxsYgXG0r6UGq+v928rnNIEExzwBs5MkbOime5Ib?=
 =?us-ascii?Q?EXHs7JlGftaf9bO/OxOlrW4PaoYDS3TwryCqv5BIuMgsgZXdCGSCH9/31o65?=
 =?us-ascii?Q?zoaKLLHqgREpQOn0HpahC8nOwr3leVPnClPYSKidPu808Tp3hWKX+FhPXVrM?=
 =?us-ascii?Q?6CbKLwtcynMe0IRnseDhcknoprfHIOQ/aDXxz/TxR/m/ZYkZn8UZxGopypOk?=
 =?us-ascii?Q?91Hlk4DiwP+DAt/OMXVZQ46phfCqM+DQ19P/eRsfBxdBBqY6+dYQLlLjlIr8?=
 =?us-ascii?Q?26QbBUzk5ipmIs4fg6e0EnzCJPFSp2Mr7h8tPxJpCzV8QNDz1D+44FeFJm9C?=
 =?us-ascii?Q?EqsAQm0URRHy4VI4bTPW4znRLH0wbyaQqY/LFg01wyNgRaqR2WJwt1jkaltq?=
 =?us-ascii?Q?uWFZk6VLZ7UxKrVyYhg+1uXLrFXab5BXyUgL2FeOBHD8UK5PSLHIzYg+vNl/?=
 =?us-ascii?Q?J5TzNzaQATLBoROXlAhm8ZDjHKbITTxVRtzZaP6H/xEwVMbsLmD9GrN8DMJy?=
 =?us-ascii?Q?kEUlzaVdQilzLz8k85cmCbwtjrml0Czxx1vb0zJHPerCVbSa73RZiQmX7U3t?=
 =?us-ascii?Q?NCEIvGQBnMorbDIp4AgSr/+JiZOz6v8B0bJhZ2q058QybuvjpmVh6Pr1+oV/?=
 =?us-ascii?Q?QcXsoW0UCc7yUZ+6lap8Yw7hXNS35lNiYrpVgCCLTz155Gmzpdd/+f5YnEL2?=
 =?us-ascii?Q?VVfGgDOJcZl44fTd4FfavRvgXDSmwA0TJV0OWjp2EZcQwT+9tIrS7RpvLgZd?=
 =?us-ascii?Q?RBJzn2kdYAm8VvjZ5HtGhlMaO8tySLl1h11NVXpx?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bZvoaHiS7q2S5bZ8OCNuVVywHF4W+J4phIFJae4yGauW5hMN5QfukdVRqXwKYoiqHiHkSdIS7kki5yvfPCOcc+WPXaQlrkcLZ++ASVLuozutj+epPysKS7gqFbK0ZPvpFSYD7HuWWO4NvkNlB/+xOoybzEwpLS0ko7hlcyHpHt6FqaBjcmTXLSeeHhsbExasr571SEDeROIWD8ZkbHkjBloQ7d8e8vowX43zGbCnkvqy6R3jB84dCIIEORLOri5BBOnpwopE2ssGZBXm5okdTecgkpNhnHZMOQKMk9pUegiL6lj12flbu6+AYnvYB3u/mzF5HV7NOInng+usD4nBjMitL0m5t6zbUVoI1ejV4RGm8nB4xcBnmkpFQhqsZyWff51iR6IAcLSyr+S4kCIQmeej/VGiex2/8r1JmGanJenA0mC5bX6HSIJndZQNTPZOcqbPenMPosSIcKc9gW2TYaLKElHpVLrY4OrB0G2dxBpKY9oogR4dsx7Gqa6qzapwDf/TXyKNNmEzxogLPypHRGgC5YUqOW6Knlqgzrb6iVH5Tld2+lQs7QEYIaWgo9nF+2s9hcWwXKYffq6cEkTKhupH5HDNTzagSTxQQKIB698=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 691acfb3-7db6-4be6-4f75-08dd51692caf
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 04:43:52.1556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pXHr8iKqpmOqsD4GJ3qs/wtXVaiJb8i8c0DqfMP3jAExBvY1Zvs3ZfoYISiSrE0kxPt5m4cHuAmf601VWooH2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7084
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_11,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2502200030
X-Proofpoint-ORIG-GUID: 3-kldcTnHCzS_Jsp9rquKfJKLs6UHQ5O
X-Proofpoint-GUID: 3-kldcTnHCzS_Jsp9rquKfJKLs6UHQ5O

From: Eugene Loh <eugene.loh@oracle.com>

While one can access the BPF stack relative to %r9, the whole
point of DT_TRAMP_SP_SLOT(0) is to make trampoline code more
readable.  So use it.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 5d9f74244..f1323cc31 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -1015,22 +1015,15 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
 
 	/*
-	 * Look up in the BPF 'usdt_prids' map.  Space for the look-up key
-	 * will be used on the BPF stack:
-	 *
-	 *     offset                                       value
-	 *
-	 *     -sizeof(usdt_prids_map_key_t)                pid (in %r0)
-	 *
-	 *     -sizeof(usdt_prids_map_key_t) + sizeof(pid_t)
-	 *     ==
-	 *     -sizeof(dtrace_id_t)                         underlying-probe prid
+	 * Look up in the BPF 'usdt_prids' map.  The key should fit into
+	 * trampoline stack slot 0.
 	 */
-	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_9, (int)(-sizeof(usdt_prids_map_key_t)), BPF_REG_0));
-	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, (int)(-sizeof(dtrace_id_t)), uprp->desc->id));
+	assert(sizeof(usdt_prids_map_key_t) <= DT_STK_SLOT_SZ);
+	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), BPF_REG_0));
+	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0) + sizeof(pid_t), uprp->desc->id));
 	dt_cg_xsetx(dlp, usdt_prids, DT_LBL_NONE, BPF_REG_1, usdt_prids->di_id);
-	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_9));
-	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, (int)(-sizeof(usdt_prids_map_key_t))));
+	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
+	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
 	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
 	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, lbl_exit));
 
-- 
2.43.5

