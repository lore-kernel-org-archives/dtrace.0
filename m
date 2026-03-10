Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B053C944F
	for <dtrace@lists.linux.dev>; Tue, 10 Mar 2026 19:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773169604; cv=fail; b=EuHF771NRiTwzU9Y5uEjn8/K8tn8ddacCPnvOqB42mY1DER6fNPK4MD77Xga0gntnkNj/P7RCDABumpcwRX8yevq9fgnZ+OwsZ2QN611KmKfNnUsv4tu3sNz9dEkcatYNo70pyjZN3LQhJ9aQUNI4Rtm0stICTqjhvhpXePN/GY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773169604; c=relaxed/simple;
	bh=o7ffT0Ig5FFS0HMkPtHwGucwVPGjID26qWttFTXXZrw=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=dfuMy3JwCKoEfFvbdIMZBVBAu4723TCX0wbAfM+EX9XWtK3H4KWQcWGTiPkMhKO/46XkWcb5WnsLj2joZiZquaXmAlEXzi/igTmLRLxZoaWyQce9BVCXGO0JecQ7b6zfZTdjL76WhgwMwiO3xP7jJsHRpHi7Yc9h1+/NkMJPKq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZTqeowt4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zStWEe9j; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZTqeowt4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zStWEe9j"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIo1uK2345132
	for <dtrace@lists.linux.dev>; Tue, 10 Mar 2026 19:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=lqhQuILjsTY3yGGL
	TI7DHOqTDXhwtJ4tyUo1QwqMBpg=; b=ZTqeowt40yZ3JF0N+wb16xG2ZWaGKOJb
	wqRkSJSU2e0AqMrqEQc7m52qr9I7lfoGhc1EXn+/ZvBiPAErjGo9enuL/QhrcCUR
	6xzkyxTIkRu2V7IfJjfkYgyRKZlxOKMS+tYUtEH+n6pMeT2A6/pQH0dtoRvi4klI
	bY3fkiE2Q0e8Nif7STvQ20gvyUpHQtuuiazj5rfnZJXAkjHfdvN6s1fOiXNP+0nv
	MrRnHdTEsjb8k7vsg5EqSDwYTXZRyj9bS5GO5UsCtqzejXx8MWXr9Es3vdMMl8ML
	54cV2uTu9+DXmy6ZDYSjWF5NKXoXZl9s88cPQYS1sZwQ13jmi3x5XQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4csks2kh9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Mar 2026 19:06:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62AHYRUB014886
	for <dtrace@lists.linux.dev>; Tue, 10 Mar 2026 19:06:40 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010059.outbound.protection.outlook.com [52.101.61.59])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4crafessxv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Mar 2026 19:06:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2PhSXASAgcY2flQ84AK+mpsExl/IFQJfQLyjWEriOH8lxmePqVhFThj5efxE35t9Nt4Qt3j9yd6CCebkjEYiMXx10e+llkyFixPf2C2AwrgVixWF5IkcTU0KzCNrazWp4prgd+37LL3BQ0QX9ez/l8gWIbwRQdtEVAP+3nssBzkst2BCJcqkq4LJAm4n2UFSZnv+z4grFTb1os8fQ5wMfhvECaXpQ6UC8InoefK8u9YIF6d6MuBEoAFocsOxXGAl5cWUxHstBg5R53tsBXGaKOEPXM+sgFZZ3fGw1q3WR+oCv8nylB6psrTP7Fjkase+Y/YZKPXFfvRxoXiBEL4tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqhQuILjsTY3yGGLTI7DHOqTDXhwtJ4tyUo1QwqMBpg=;
 b=Ny3qkeHVODM6hg7tg8+PWkJPnOrJWG0TZFgFNvt1fUzse9B8pbo+I5oquXRIcBe5Thb6Ge14INdKD3FO6D5/8YG8JaJKYQYwaZJMC3z9y7fAwM/ZkDd+eQQKowvBS2JLL8CNsJ69fzILOjDj5+1XEKguguj+rAq1xXXNQpLKrfmU6dVJAa8H0d5t1xphv01SVJNym6JZ3ZTmFAp+eok1OOyX/vfwZvNXqC4RQi2qvdrR9u2MUuizdrY6r/HuffSSQwE7i48/LThjkV33EgqpKO597rA4MyBWWq34sUo9hxEn1x3RHFIZbnkQ0h8M+JIU5+Hq3o/n8vcGOAWMEVXZ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqhQuILjsTY3yGGLTI7DHOqTDXhwtJ4tyUo1QwqMBpg=;
 b=zStWEe9jeX1nKVsJGN12aGKtoKohg0V3xSV64+ln2FugWMBLl2x6rp5lo1rOy3H3WQJLx1q3WkdnN2PBi96fLD1xHUbJGmp4FumczC3rfgf2AeFFqMSQ6OvWwRj9xnYzj2ig54CNy2461tbbgzDbUllJX8GlQpi/Ogl5ostyLh8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH0PR10MB7410.namprd10.prod.outlook.com (2603:10b6:610:190::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 19:06:35 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%4]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 19:06:34 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Remove spurious references to Oracle
Date: Tue, 10 Mar 2026 15:06:31 -0400
Message-Id: <20260310190631.15858-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR04CA0056.namprd04.prod.outlook.com
 (2603:10b6:610:77::31) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH0PR10MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fbf7998-af47-4935-85a0-08de7ed825ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Bh49mEnDNxUOn80VOG8nsMfG7d97dQLobvA/uE5grvdSsXAvcc046ua4mLMX/4yfmHVvisixed3+yUyPaHbF/lal48vQjOAp0ReswpFIA2IVLyvLwdeaL4JAiB/Tf+hzXf02EMq10P4gbJUBS/g4j4tJThL2GilGr+/lHN9K7hG0P7tT+1CDgJLR9Y4zPd1eZiJIs+ro/RGQC3t89rZGW8UYWa8qihPJ7EuV8G8oTW8xZkUFBJqE86p2zcKFmu5YeyE091cZwY8+bmJGPv8p+i28fIxTZh2LjSqYv67cBDdDWHAW1WGu2L+KBjKxBBwHWYyDhXZkeF7OUsQxsSQ92qGiR530TC3b4+ORVqNEyYpeWsMdLTe4mbMbK3/hXA5ID3uUjSKcBHTWx2SMDlkZ9IJu6FD+e2VkJf1K0smDYwaRPVVjX/6cPItVGnBBOzQi4qAhjWnwg0oOKuHhPF2hSIt8NnfdcCLQClIP++oG3LaByvWwyjsmxOwrtvU7V/jrnKSHvKX0bSiGo8qEA5z+gQ4hkOFe8etVWF3Jq+3/ZQRmJrHL7y2UxJ2c0HJecKYmmPHNrLCOrylwcwR+6TWGtkRKLT8XTU7UVMxOda+J9F96yZawr500IgiVh2rxng2xU51wzud09FZEs59Xrl3So8PvBfcs4RaHvxydps7jfLXxTZmSM6geDnWeXAPOj4/pgtYqU+KwPZNSG1+wQShJi47J7B43rylgR646EDn2j6c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3loTWVVbTZwVjZNc2ZhRWpBRlFZV2FvUkpnQWVoaUV0b1hmZjErTDF4RFlW?=
 =?utf-8?B?c2ZhRldzK2NReGdObnBPOUYwb0RCSGwwcDBzdGtoeXdpWlhBWmZIT1RUQ0pC?=
 =?utf-8?B?c2luK2lJZDZGM1BCM2NOUzR5Y1JkSTQwcmpjSjMrR0M4SlBvMGMxcEI3Rzl3?=
 =?utf-8?B?dWpxdy8rR0tqOW91YW5QY3FWRFQyek9wcDM4V2JJRGJBYWtvQW1qRU1Femo5?=
 =?utf-8?B?TUt1LzBVd1dUbFZsa05Yc0VvQXUwWHJ1QjZ3WTNFQmhiUkQwMXNFZ0kyMUR1?=
 =?utf-8?B?Q3NpQThLVUY4SUY3RkNjMjZKa3lBeWNzVFRVMEZlTW1WcUxwOE5oU3puZGpV?=
 =?utf-8?B?M2NiV2ROYlRXdm5GaEZPVjRlWmM0S2JyNFVlOWM5WVZ5VnlEdFNtRXg1U3pL?=
 =?utf-8?B?T3J6eFMwWFl4NWttT2NYdjhGczlFUWl5S0RCRmIxTjNOei9kZ0tYaFBjaDZH?=
 =?utf-8?B?QzN2MHlNdXR4MzFVWkV5NG90RGc1ZCtuaGpaSDhuVlcvL0IvdnpzclNZTitK?=
 =?utf-8?B?UHB5dVpwazRKUWhiZzZOdzFhOGJNa2loQzl2djA3WUVJbUxQMEF6REY4RmlT?=
 =?utf-8?B?UmhnSDZxSGR3emF2R1RZaVlyT056UE9MOE1QTlk1ZG1QSGpmRW1xaDZKVDF2?=
 =?utf-8?B?WHlrT0hCa3NsV28yRFJnNWV5TUplbm54Uno0MEFzNkNOYXZpNE92d21ZZjBY?=
 =?utf-8?B?WWErQk9DZ1MvNWJiTXFCOURwYXFLQW1rQW9CYVBJUFlVYkJ2QTV2UC8xREFv?=
 =?utf-8?B?TzdNL3FSc084QlUxWEh0YkY1aGw4aXJwVS9RbWdSNTBhZFpQT3B3ODhqWHIv?=
 =?utf-8?B?NGlhZzJ2c3RvTVdkbGwxanJXTGFLc09Id2gycjBNcWtpQUJaSVI5akFnT1JY?=
 =?utf-8?B?eE5RZ2Z6MDJqSmp1RVFIZDBIQ01PNjNWSUQ5RWxFTTdtK1NJRGJZU1FHY3Yy?=
 =?utf-8?B?VHlnTXFLeTFMS1p3NG9DSUwxQ3NxRHk4cU50VkRZMzJsVVNSM2RGTExLZSt6?=
 =?utf-8?B?Y09DdjkwU3JTQ3FWWlNtSFlkaFRkRlBiNldnc3lKMzFOOEo0Z0dIWThHTllX?=
 =?utf-8?B?d0s0Y0pKZGVPMm9NQ2tralJ6dU84UE9sV0lNV1RnR2JHR1FwSkJ6Vk1MOVJO?=
 =?utf-8?B?RXg3UG91bmdKTmdNQ2pjRjNqLzY4RUpCUS9EZ2RGVjkycm5tVDNQMVFqU29s?=
 =?utf-8?B?WlZsekJHeHUxWGROUW9iS29lZ1RBazRHTjR2bkhCQkJTNy80NTltdE4rYnFr?=
 =?utf-8?B?K1ZjWmRST2VRN2dJSlBkaW1sRUt0Qm16MzNxRklBQktlQkkya1VIZXFQWGRl?=
 =?utf-8?B?dm5Db1FJVXdscmJUdm1WNmdGUStuOGxPZERQaTlwQXREUzAxYWszRlFxUUtR?=
 =?utf-8?B?L0RUcHh1cFNJQU9OZ0JKRmRlbXpSNkcvM3Vmb0RZMmlvOHROL3NzT2ovcXhy?=
 =?utf-8?B?NDhGNXByM09ySXlPSmpjNlBnZnRBalZOcjh6RFR0V3RvLzNmaVNCYk0wRzBy?=
 =?utf-8?B?cVRVMmdZSU13UlVVQytmeERINFVaa01wYjBldjZzNjcrbzJtYTR0OFNsbEx4?=
 =?utf-8?B?SUVxaFpEc3liWUFoTUpkeXJKNmtsZVZWZXpHRzJUa2thL1ZXU25JV0F4QXll?=
 =?utf-8?B?ZkpMRFQ1YU51N0lnWjVjNm1oSS9RVXAyVUpsR2UwdmRkZGJXMFAzcWZ2aUNQ?=
 =?utf-8?B?cE1mc3ZIUVZ2MmVzMUNGNVl2UUV4MnhRVW5sUWlPZUJBb2E5SzB0R1hEbklU?=
 =?utf-8?B?ZTRQaDgzRWloQm1XVzY5V3dvb0xTWmhaZ2VyaFZhdDlvdlFwRFUvNm9Tckov?=
 =?utf-8?B?dU00OGFOYWZOczFET3VqUzVlYS9WeUdSZ0JFRjhvYnh3b2VjWkEzSE5jenJH?=
 =?utf-8?B?WXQ2NUJQS2N0NVhQNUZXMjlKNzJWWEdhVmFQNjFqOWRkdzd5dkpYT0Rnc2Fy?=
 =?utf-8?B?SE44enNDRVZXbEpkQ1VaUHoyZmd3ajc0ZVBWcnFwMUswV3VpYW1NOUFqTE45?=
 =?utf-8?B?eXRQcHViUC96VkJwd0Q2WjVzMWF0UnI2T3VZaitoOEZSVDc1cktvNUhQT09Z?=
 =?utf-8?B?RHhNWXEzTWk1SVpvMUF1MkZROVl1cHA1aWpVSVc2ajZSVUxuQVNiMlFQeXJI?=
 =?utf-8?B?V3IzRzhzT3dJZVdMMnJpdERhZ1lQaXVEdTZ6c2s0TjBvQzhuQmhMcWR3Wmgr?=
 =?utf-8?B?dCt6dmduWkVQTVhJWFlmeURxaEZXSkFJaFh1NGU1YXlIYjUyb1BIS2QwWC9C?=
 =?utf-8?B?cHAzbnYxRVdMcjJSdGVRSFVKMXd2VEprUU9iTjgrcnR2VHJGTEZsL0FkSU5q?=
 =?utf-8?B?NlZ1dWU1YnNQVFlEK1V6SFJrb0x3b2RWYjMwN3l6aGVJTUsxeHBnZz09?=
X-Exchange-RoutingPolicyChecked:
	b6I37A5/1b10kg+aNz+o5aUC5s/PtFxzk4oaL/YrjHT4FrLb2uvyWesDLgQVEZC4KoLh5zaklzbxdwkAAMczoEh8GKzxqlX1OuWGipzOzUN+aHhYAAmcanm5KEnMmTM7wRiFDw+1ONH2GsfScU+SHW9LvTthCFoekG9B8ScqK/5Hx5Lk36URVBLEgaIZUAhuBFLCDADKP3GfgUFcePN0Ha2bsTJyPL8Y6uxYiFREb7TCv25zYQgsS6TngbFoTM5EVR9/zfuoz4BRFe9qxiRtxlbOrvu6t6G0RtQmYjPiecXGAQTSpCBmtnv7TxVrNzIQZSQv6i9e94B7/ds3vxMR0Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UkWmxl2XBHMLd5aFVO3dkKaFu/iMrt6J1BdNGwi6amQpNgBNwcs9klOCaCcNcsGoKI4x+dgEIESUan6uURdPfvpjJVOQhZQV7odLnovKqCe9WVal1CZa+Dn0tJ+549j8zzsnc5BamHsN/RnqrwYqFZcMgjatyMbn/0MbLGqf9ne2jQquJ7FXChNETSVgUA4k7iL3lGkabKuzcBjgIMlLcCdM1IiNtcDuSJPVTvESsL6tQAXfv49wiflJ6PZmgVNcOLSm2v40JSy102897EFSG05VqUzfr72M8E8RKA1hIfPoEb5SafcSXqi8S/foTOn3QWIJTlsTAADRsIaaH/aiWVfdnVno4vWZn07/oh8CB9/8zPSdOmy40n1KHJ/itpBAtmDUFIsHfPsDtDi7rsTa3YuktUkx1HrLEo7HbXnJ1ks3BMnFsg7NBKNu5nlCZbZSSvhuxQxcviyBOfiIpN6CECgyCy4bNeaVj6+8D/7xvueZThO0/OGDYOiZDtXbWE+/vuIYi/ZZhPJBhOS+ITU+vXaJEPeZKxfr5FPIKPRxCgOwQKc3rDAI+BMGaLpFcb3skL7LcT6R5eDt5GdniXIv87vE5XvkUuRv9a/nA3ZDsm0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fbf7998-af47-4935-85a0-08de7ed825ee
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 19:06:34.9282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C967+qt83HovSZcQbtYsq6yBJ0Xt1nHL8VUKAAXecEVujP9gTIlVufMFrrXcdD29qus6O0buSFQcuas9mmqgdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7410
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 phishscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603100166
X-Proofpoint-ORIG-GUID: 4m_8OfyePPAcnAZovc1ABwa1tHlszXUE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE2NiBTYWx0ZWRfX4sf8nERFiixh
 x8Bvh3Al/BRYO+QPU1phbVTrzO8KsgTMWhSlSzzQkCfLgdDIoAaOHq5ZMMALzyDPinS4hQY0nXl
 BV8RxkcGV2lpr8w2sxDepHXiEjZTufT45rB0qEeMTny0CArCevOGmbbO0eKMcY5ZNBaYoklZtOH
 WMUQj0TqRZP+9f3xG6dq8lzDlpppZkjCUnotgpUCFKaKW9A26OyTRVZuRs9IWIkIYzREOa1Lzpm
 N3h6nF6Fowi9O54JjUcIVXR5jZXLI4+DuGz6QPuQI8WgYTztZ1bio2OY6RV7yvBV75G2XdUkupF
 nNJ+znW5W+1UU8G4Yjakvqp0C2NEQJ7vPB/EJuKxPyL3BypgtIcOtwZusUTVw5d/ITYmhCcR0GE
 QkgCK6EtG3L2AYXuiHB4K49dx3Y1i12ekYegNIx4xPhlMIs3FlcFuFIm4UglxhV66EnTxSFFtd0
 +k1x3DiBGCGQPyABDF7ir8OW57ERFgg96eFr1pA8=
X-Authority-Analysis: v=2.4 cv=S4vUAYsP c=1 sm=1 tr=0 ts=69b06bc1 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8
 a=hTr97slKLSIXUDr1u74A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12273
X-Proofpoint-GUID: 4m_8OfyePPAcnAZovc1ABwa1tHlszXUE

From: Eugene Loh <eugene.loh@oracle.com>

Another file to clean up at some point would be cmd/dtrace.8.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 README                                        |  2 +-
 doc/tutorial/1.IntroducingDTrace.md           |  4 +-
 .../2.TracingOperatingSystemBehavior.md       | 44 +++++++++----------
 .../3.TracingUserSpaceApplications.md         | 16 +++----
 libdtrace/dt_prov_io.c                        |  2 +-
 libdtrace/dt_prov_profile.c                   |  2 +-
 llm/README.md                                 |  4 +-
 llm/llms-dtrace-complete.txt                  |  8 ++--
 llm/llms-dtrace-short.txt                     |  8 ++--
 test/unittest/options/tst.strip.sh            |  2 +-
 10 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/README b/README
index c7f704ed7..3dd487695 100644
--- a/README
+++ b/README
@@ -1,4 +1,4 @@
-Linux DTrace v2.0 for Oracle Unbreakable Enterprise Kernel 6.
+Linux DTrace v2.0.
 ------------
 
 This is the official Linux port of the advanced tracing tool DTrace.
diff --git a/doc/tutorial/1.IntroducingDTrace.md b/doc/tutorial/1.IntroducingDTrace.md
index 3236edf82..dffca17f7 100644
--- a/doc/tutorial/1.IntroducingDTrace.md
+++ b/doc/tutorial/1.IntroducingDTrace.md
@@ -60,7 +60,7 @@ you can choose which method best suits your needs.
 
 DTrace is a comprehensive dynamic tracing facility that was first
 developed for use on the Solaris operating system (now known as
-Oracle Solaris) and subsequently ported to Oracle Linux.
+Oracle Solaris) and subsequently ported to Linux.
 You can use
 DTrace to explore the operation of your system to better
 understand how it works, to track down performance problems across
@@ -126,7 +126,7 @@ For more information about using DTrace, see the
 
 ### About DTrace Providers
 
-Here are the providers in the Oracle Linux implementation of DTrace:
+Here are the providers in the Linux implementation of DTrace:
 
 ```
            kernel       user space
diff --git a/doc/tutorial/2.TracingOperatingSystemBehavior.md b/doc/tutorial/2.TracingOperatingSystemBehavior.md
index b3445ab6d..edfc89c01 100644
--- a/doc/tutorial/2.TracingOperatingSystemBehavior.md
+++ b/doc/tutorial/2.TracingOperatingSystemBehavior.md
@@ -9,8 +9,8 @@ investigate what is happening in the operating system.
 The `proc` probes enable you to trace process creation and termination,
 execution of new program images, and signal processing on a system. See
 [Proc Provider](../userguide/reference/dtrace_providers_proc.md)
-in the
-[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
+in
+[Using DTrace for System Tracing](../userguide/index.md)
 for a description of the `proc` probes and their arguments.
 
 #### Example: Monitoring the System as Programs Are Executed (execcalls.d)
@@ -122,8 +122,8 @@ to copy arg2 bytes and then add a NUL terminating character after those bytes,
 which are possibly already NUL-terminated.
 See
 [Pointers and Address Spaces](../userguide/reference/dtrace-ref-PointersandScalarArrays.md#pointers_and_address_spaces)
-in the
-[Oracle Linux: DTrace Reference Guide](../userguide/index.md).
+in
+[Using DTrace for System Tracing](../userguide/index.md).
 
 ```
 # dtrace -q -s syscalls.d
@@ -149,8 +149,8 @@ Use a conversion specifier such as `%-4d`.
 
 See
 [printf](../userguide/reference/function_printf.md)
-in the
-[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
+in
+[Using DTrace for System Tracing](../userguide/index.md)
 for a description of the function.
 
 The process ID and user ID are available as the variables
@@ -291,8 +291,8 @@ Replace the `trace()` call in
 
 See
 [Profile Provider](../userguide/reference/dtrace_providers_profile.md)
-in the
-[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
+in
+[Using DTrace for System Tracing](../userguide/index.md)
 for a description of the probes.
 
 #### Solution to Exercise and Example: Using tick Probes
@@ -713,8 +713,8 @@ is determined by examining the `pr_pid` member of the `psinfo_t` data
 structure that is pointed to by the `args[0]` probe argument.
 For more information about the arguments to `proc` probes, see
 [Proc Provider](../userguide/reference/dtrace_providers_proc.md)
-in the
-[Oracle Linux: DTrace Reference Guide](../userguide/index.md).
+in
+[Using DTrace for System Tracing](../userguide/index.md).
 
 The program uses the value of the child process ID to initialize
 globally unique associative array entries, such as `p_pid[childpid]`.
@@ -845,8 +845,8 @@ minimum value, standard deviation, and summation of the data being gathered,
 respectively.
 See
 [Aggregations](../userguide/reference/aggregation.md)
-in the
-[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
+in
+[Using DTrace for System Tracing](../userguide/index.md)
 for descriptions of aggregation functions.
 
 DTrace indexes the results of an aggregation by using a tuple
@@ -1107,8 +1107,8 @@ See
 [`fds`](../userguide/reference/dtrace_builtin_variable_reference.md#dt_ref_var_fds)
 and
 [`fileinfo_t`](../userguide/reference/dtrace_providers_io.md#dt_ref_iofile_prov)
-in the
-[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
+in
+[Using DTrace for System Tracing](../userguide/index.md)
 for more information.
 
 The [`trunc()`](../userguide/reference/function_trunc.md) function
@@ -1133,8 +1133,8 @@ number or `"total"`.
 
   See
   [Sched Provider](../userguide/reference/dtrace_providers_sched.md)
-  in the
-  [Oracle Linux: DTrace Reference Guide](../userguide/index.md)
+  in
+  [Using DTrace for System Tracing](../userguide/index.md)
   for a description of the `sched:::on-cpu`
   probe.
 
@@ -1226,8 +1226,8 @@ Use the `lquantize()` and `quantize()` functions to display
 linear and power-of-two frequency distributions of data.
 See
 [Aggregations](../userguide/reference/aggregation.md)
-in the
-[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
+in
+[Using DTrace for System Tracing](../userguide/index.md)
 for a description of aggregation functions.
 
 #### Example: Displaying the Distribution of Read Sizes Resulting From a Command
@@ -1312,15 +1312,15 @@ function is used to display the results of the aggregation.
 
 See
 [IO Provider](../userguide/reference/dtrace_providers_io.md)
-in the
-[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
+in
+[Using DTrace for System Tracing](../userguide/index.md)
 for a description of the arguments to the
 `io:::start` and `io:::done` probes.
 
 See
 [printa](../userguide/reference/function_printa.md)
-in the
-[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
+in
+[Using DTrace for System Tracing](../userguide/index.md)
 for a description of the function.
 
 After running the program for approximately a minute, type
diff --git a/doc/tutorial/3.TracingUserSpaceApplications.md b/doc/tutorial/3.TracingUserSpaceApplications.md
index 1d9bf69f2..1121a583f 100644
--- a/doc/tutorial/3.TracingUserSpaceApplications.md
+++ b/doc/tutorial/3.TracingUserSpaceApplications.md
@@ -293,21 +293,21 @@ For more information on how to use the `pid` provider to trace
 user function entry and return or on specific instruction offsets,
 see
 [Pid Provider](../userguide/reference/dtrace_providers_pid.md)
-in the
-[Oracle Linux: DTrace Reference Guide](../userguide/index.md).
+in
+[Using DTrace for System Tracing](../userguide/index.md).
 
 ### Adding USDT Probes to an Application
 
 In this section, we practice adding USDT probes to an application.
 For background information and other details, see
 [Adding USDT Probes to Application Code](../userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdt_probe_add_prov)
-in the
-[Oracle Linux: DTrace Reference Guide](../userguide/index.md).
+in
+[Using DTrace for System Tracing](../userguide/index.md).
 
 To get started, you will need to create a `.d` file, as described in
 [Defining USDT Providers and Probes](../userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdtprobes_prov)
-in the
-[Oracle Linux: DTrace Reference Guide](../userguide/index.md).
+in
+[Using DTrace for System Tracing](../userguide/index.md).
 
 >Note:
 >
@@ -431,8 +431,8 @@ and a false value if the associated probe is not enabled.
 Next, you will need to modify the `makefile` file.
 For step-by-step instructions, See
 [Building Applications With USDT Probes](../userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdt_build_prov)
-in the
-[Oracle Linux: DTrace Reference Guide](../userguide/index.md).
+in
+[Using DTrace for System Tracing](../userguide/index.md).
 
 #### Exercise: Directing makefile to Re-Create the dprime.h File
 
diff --git a/libdtrace/dt_prov_io.c b/libdtrace/dt_prov_io.c
index db768bb72..7e2238564 100644
--- a/libdtrace/dt_prov_io.c
+++ b/libdtrace/dt_prov_io.c
@@ -591,7 +591,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 done:
 	/*
 	 * Note: DTrace does not currently support the use of fileinfo_t with
-	 * io probes.  In Oracle Linux, there is no information about the file
+	 * io probes.  In Linux, there is no information about the file
 	 * where the I/O request originated at the point where the io probes
 	 * fire.
 	 */
diff --git a/libdtrace/dt_prov_profile.c b/libdtrace/dt_prov_profile.c
index 60da094a2..de7e02120 100644
--- a/libdtrace/dt_prov_profile.c
+++ b/libdtrace/dt_prov_profile.c
@@ -224,7 +224,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	 * TODO: For profile-n probes:
 	 *     dctx->mst->argv[2] = elapsed nsecs
 	 * The documentation does not say elapsed since when?
-	 * From the legacy port to Oracle Linux, in dtrace/profile_dev.c,
+	 * From the legacy port to Linux, in dtrace/profile_dev.c,
 	 * in profile_prof_fn(), it appears that we have a per-CPU variable
 	 * that tracks the expected time of the next profile probe.
 	 * Each time the probe fires, we compute arg2 = time - expected
diff --git a/llm/README.md b/llm/README.md
index 2992bf7bc..117783f92 100644
--- a/llm/README.md
+++ b/llm/README.md
@@ -2,7 +2,7 @@
 
 ## Overview
 These files provide structured **context packs** (`llms-txt` format) for use with large language models (LLMs) such as GPT-4 or Claude.
-They teach the model how to write **correct, safe, and complete DTrace programs** for Oracle Linux.
+They teach the model how to write **correct, safe, and complete DTrace programs** for Linux.
 
 The goal is to let engineers and administrators generate working D scripts in natural language — without having to memorize the entire D language syntax.
 
@@ -39,7 +39,7 @@ The goal is to let engineers and administrators generate working D scripts in na
 
     -   In ChatGPT, Claude, or another interface that supports file context, click the “+” icon and upload `llms-dtrace-short.txt`.
 
-    -   The model will automatically ingest the reference and understand how to write runnable DTrace programs for Oracle Linux.
+    -   The model will automatically ingest the reference and understand how to write runnable DTrace programs for Linux.
 
 3.  **Start asking questions in natural language**
 
diff --git a/llm/llms-dtrace-complete.txt b/llm/llms-dtrace-complete.txt
index 818e0086f..07275cb9d 100644
--- a/llm/llms-dtrace-complete.txt
+++ b/llm/llms-dtrace-complete.txt
@@ -1,4 +1,4 @@
-You are a senior systems engineer with deep expertise in writing DTrace programs for Oracle Linux. You understand that DTrace is one of the most powerful tools for diagnosing complex system behavior, and you will always provide complete, correct scripts that compile and run cleanly. Every answer must include the full text of a runnable D program, with appropriate shebangs, predicates, and comments where helpful.
+You are a senior systems engineer with deep expertise in writing DTrace programs for Linux. You understand that DTrace is one of the most powerful tools for diagnosing complex system behavior, and you will always provide complete, correct scripts that compile and run cleanly. Every answer must include the full text of a runnable D program, with appropriate shebangs, predicates, and comments where helpful.
 
 You favor stable providers (such as syscall, proc, sched, profile, io, usdt, pid) and safe idioms that avoid invalid memory access or unnecessary output. You use predicates to filter load, aggregations instead of unbounded per-event prints, and you always include an ERROR clause when relevant. Your answers are precise, professional, and free of placeholders or half-solutions.
 
@@ -7,15 +7,15 @@ DO NOT RECOMMEND DANGEROUS OPERATIONS UNLESS THERE IS AN ALTERNATIVE. Do not rec
 WARNING:  Forbidden constructs: if, else, for, while, switch, etc.
 For example, instead of using `if`, use predicates and ternary operators only.
 
-Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Oracle Linux.
+Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Linux.
 
-After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Oracle Linux.
+After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Linux.
 
 DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
 PART 1: PROGRAM STRUCTURE, PROBE DESCRIPTIONS, PREDICATES, STATEMENTS
 
 ## GOAL
-Provide a compact, machine-optimized reference so an LLM can generate correct DTrace D programs for Oracle Linux.
+Provide a compact, machine-optimized reference so an LLM can generate correct DTrace D programs for Linux.
 
 ## PROGRAM STRUCTURE
 A D program is a set of probe clauses; each clause may include an optional predicate and a statement block.
diff --git a/llm/llms-dtrace-short.txt b/llm/llms-dtrace-short.txt
index 19d5f73e5..7430f4ba5 100644
--- a/llm/llms-dtrace-short.txt
+++ b/llm/llms-dtrace-short.txt
@@ -1,4 +1,4 @@
-You are a senior systems engineer with deep expertise in writing DTrace programs for Oracle Linux. You understand that DTrace is one of the most powerful tools for diagnosing complex system behavior, and you will always provide complete, correct scripts that compile and run cleanly. Every answer must include the full text of a runnable D program, with appropriate shebangs, predicates, and comments where helpful.
+You are a senior systems engineer with deep expertise in writing DTrace programs for Linux. You understand that DTrace is one of the most powerful tools for diagnosing complex system behavior, and you will always provide complete, correct scripts that compile and run cleanly. Every answer must include the full text of a runnable D program, with appropriate shebangs, predicates, and comments where helpful.
 
 You favor stable providers (such as syscall, proc, sched, profile, io, usdt, pid) and safe idioms that avoid invalid memory access or unnecessary output. You use predicates to filter load, aggregations instead of unbounded per-event prints, and you always include an ERROR clause when relevant. Your answers are precise, professional, and free of placeholders or half-solutions.
 
@@ -7,15 +7,15 @@ DO NOT RECOMMEND DANGEROUS OPERATIONS UNLESS THERE IS AN ALTERNATIVE. Do not rec
 WARNING:  Forbidden constructs: if, else, for, while, switch, etc.
 For example, instead of using `if`, use predicates and ternary operators only.
 
-Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Oracle Linux.
+Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Linux.
 
-After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Oracle Linux.
+After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Linux.
 
 DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
 PART 1: PROGRAM STRUCTURE, PROBE DESCRIPTIONS, PREDICATES, STATEMENTS
 
 ## GOAL
-Provide a compact, machine-optimized reference so an LLM can generate correct DTrace D programs for Oracle Linux.
+Provide a compact, machine-optimized reference so an LLM can generate correct DTrace D programs for Linux.
 
 ## PROGRAM STRUCTURE
 A D program is a set of probe clauses; each clause may include an optional predicate and a statement block.
diff --git a/test/unittest/options/tst.strip.sh b/test/unittest/options/tst.strip.sh
index d25f76af3..a6762cfb9 100755
--- a/test/unittest/options/tst.strip.sh
+++ b/test/unittest/options/tst.strip.sh
@@ -64,7 +64,7 @@ fi
 $objdump >& out.default.txt
 
 # Check results.  One can imagine a more stringent check -- like
-# seeing if the string "Oracle D 2.0" appears in the default case
+# seeing if particular strings appear in the default case
 # but not in the stripped case -- but here we settle for the stripped
 # case simply being smaller than the default case.
 
-- 
2.47.3

