Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9716030EF92
	for <dtrace@lists.linux.dev>; Sun,  1 Mar 2026 22:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772404792; cv=fail; b=bHU6PY1h4j/B3GwM0d0ESJW4oI0fe3YhbhFLoxL7IxQd7KInspW6j1O0KdxFtYTSIvZ1drFqmzkH04hjpidIj3//52kQDEXUuj18REEzQkChh1u/H4XJIn2HE2gwgDbbhyik6MOjEiANMqFVWVc/06XMBEQrHND4s16Y+6wHvyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772404792; c=relaxed/simple;
	bh=kYZUxMk/CYmuaLggVyWhUIv6PynTzl5Wyvy6xytXbMA=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=CeZNoVfsQ1p7N5aisQiF/bpp068NRw01b3Qh7MgmbJjoywPpzbnc5EP7+JppJIBGXRLjF04xOZUhmY1VcwcR6OW95RIaE2FQxtei706WGBj32kN5nCGMEb0OzUlb5pUIF0DT1H6iZ4REItGuwJIZfKbMa1DaZ8eagM9Jbw1gDzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ebJ/lQd9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VtgI5hrc; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ebJ/lQd9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VtgI5hrc"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621LSBZ9713666
	for <dtrace@lists.linux.dev>; Sun, 1 Mar 2026 22:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=KrhUoiWr67ud8A0yVDRiGlaTcrfsskxe5w5vRBf+zAA=; b=
	ebJ/lQd9ormXDTofmQ3q98ls7StOapMB0iIRiq/YgAlaEZxuD+H2RcjinOV6+iU3
	sE4SWkikIN9fiOGtM/P5yaGcpsE1b89NIP8CppPzauK2itkTh6yTby2ObsrUC6qq
	cD8j/CoOBOzT6JuVnJQp21sgCaO3MdvGeWzwWWfWR2CjZkceWU6Le6PfLCOW4v74
	yFCAFLahjnel2sn1bLFCfOtwgPr6jxJhKN9dfzWzeBeZFULOPtFz54KfCZVJ4Mto
	s5oQ5u2jyn3ZUyWX9fmw7WuxAW0b0xEUG390CHYysez/mUWGOtceK8mvDKVYPdue
	SkNfvd7+Drp2GN7gMOxlAw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4ckshmha6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 01 Mar 2026 22:39:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 621ICwS2029786
	for <dtrace@lists.linux.dev>; Sun, 1 Mar 2026 22:39:48 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012004.outbound.protection.outlook.com [40.107.200.4])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ckpt87uru-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 01 Mar 2026 22:39:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0cQdxmcWwOpE6kQNM9nVYVBI5i4VIhfyKYPjCNYNI8uaKedAHyvqOjcYaNVP6XFQopE3X28RV1fFf+vLJPLdAiRA53ebp6GlpXM9NKdmYA9Rh5V+VbQO1X8sIXUKGaHTl4T2sM1C3pEBgP43DmkYyi4EY3/gSSmRqE1V3wnE2+gPLpy9fpW+WVqhBr8izZ0f1Zhz6W2IHUMc8cuCA+pVtBOHRGObnV1mdgNqQqVSOHFOImuV5Cfrf2CnewUtbAX3lHMUqFDBbgrhunmGG3n+e66bBznJyVh6BpWv8wfO7UYFSvo8vZSEOboUS0FpGEpGPNTqQ6zYCKCMLrmc/sCvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrhUoiWr67ud8A0yVDRiGlaTcrfsskxe5w5vRBf+zAA=;
 b=g4syQaDUrJ2G417nzXf2zs/5zcrfEuZjaKsA68HS+K1GGt8M1EfilOWNfyM1OfzV+4fLQNx57u41CWdZuCKCbLIiMDMISMlg9ZzBHrOWb3LtqZ6UDImn7newtnxQ8gNM90o+6mBnIKduBS89UGyVgpZuLF1bNWpezyu+Rz1+6beHl2jaB1poZwr+lNZrJquGLLd4/avm7fzBAPD8tbPjwqegVCU1sW2gikDrY8CPOnp/TVOFu0W48MHYWeRHKKC0m1+SVC6m/qerZheHKKSZ6kiYo2EjyUJSaIUV7EMeB4wYZHPtjb0UUntGtpR2ZXR7UhiaIsl6uXHE03Z3aFVAaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrhUoiWr67ud8A0yVDRiGlaTcrfsskxe5w5vRBf+zAA=;
 b=VtgI5hrcWmuy9GMTpPSqtCl0jr8pT4njQYsl/9ljVm4mRVr8nEixHQBkTfcZPXrzhXFbhwq1F9UvLL07cnK0MHshIap+TxocsdPVrdgBkJCqghNCnQAkXpu+6AK9Bgw1zZod5XPQidizksDSVXWiFPjWxPbOyNgpFuUqoy/j1AI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH0PR10MB5099.namprd10.prod.outlook.com (2603:10b6:610:ca::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Sun, 1 Mar
 2026 22:39:45 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%4]) with mapi id 15.20.9654.020; Sun, 1 Mar 2026
 22:39:45 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/2] Fix probe discovery loop
Date: Sun,  1 Mar 2026 17:39:42 -0500
Message-Id: <20260301223943.20324-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::26) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH0PR10MB5099:EE_
X-MS-Office365-Filtering-Correlation-Id: 4915a621-e3ed-40a3-4bca-08de77e36fa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7142099003;
X-Microsoft-Antispam-Message-Info:
	lA7e38Pt8IInWOIDygy42nL3p2G18vAZXDR6ae2/3y4GMJW5Y4Rc2p8Go7gDEXaKWrFBuuh5yplSRADz8W27N8mWERQ5lW7mvGug3Ns8Y83ccGyOr1J9dOsXMWuZI2l4Sy9iweyFFCZpWWbB4Opng7KTI+2m4zD84I+9oIR0zY7XMmH6cRViqL7K+S5FI+KNToIVyVMXNBsKQKV4GJGMoQLbTvkKbTkMVzBgTuxXDAzh/BAJh3LkHKuxS7okGHWW8n/EB8XT3tRCyZdpcH2s2TFQIFgtYuOorD++rvtToDl/fqijxYAkvTioNaLcKexDMzAmLTneEttGkhkIEaxscRnFpK2ONKB+zFXf11LOMnZNED40Q8d+BZsG/aitATRl2dg3et4WCCRjZsx5M/jEFbiIuA9Mc1CSlaCAJc1vwYxQoTahLKHFmH0nEWXoOp7N1QJarwMxXl4AZayqNt+G+aI7aTY7DW4QrWVKB8laQneLCWNivHEABwzP8oBu4oY2dvOf65pqvMJw7Y34pBtfEQjVpTXUuE+SmoMeALk409M/HX1AnUgygCUqlWyGL2pVYvwzT02EsIL6fKS14rZTKBUjUYfg6dm5fmmZfOePtvnNtqM95lyKYWG/HPV/XgqARnNq/4oyM2EqY0YE/Gc/NKNc1ulG3T27CAQwumtl98DPOl67kIARC+P/0xH6X4NHriqp0ZsQVWuZ0gt/TuvfXDaahbB4aZ1ow46wHVQZ2hg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WrPfhSbxFxp+3Ts9uX/JNKtj8PHQbOH3MD3BYjknf3S2BizmZSGkfIOpfema?=
 =?us-ascii?Q?Lc8NhWS+n7Dgo5FdeFVIDJ8ADPAjZ5FRKmB+3TXs92jjmD+RGjynWWC4OGCB?=
 =?us-ascii?Q?BQdSqmH2lEmit5i9sOqMJusSLLfqCT/BkLKzAMUWvY+84nSlZPWOPotjXPrR?=
 =?us-ascii?Q?NQNjuUn2WBuRfx11fX9aItTHvWmAX9/vv0NferPOBeIiQm1oDLD5MM64HDfg?=
 =?us-ascii?Q?CuCkhOpUCCUNRsAHRKBVyzuXQosASSewaw+tzPzcpjlyrFJXx7FOicvvIVeh?=
 =?us-ascii?Q?H2vp1MVm8pU14H//idFM8s2g6KUFE7/2jnBSYLx9JKAQj18DbPAZ0HnfpZ+m?=
 =?us-ascii?Q?KDrfV5hlLusuLKwBoIsC4352aFhC4kY2cGZ1izoAl+C0heWN7FjNPU6p21Kh?=
 =?us-ascii?Q?pSMx6nWxHNcm4V4frJdZH0xPAzHXjzZNvxWM76SZJFjlwfkXF6fMRCzIaSiu?=
 =?us-ascii?Q?oApuUL6oSo6PMHgtJMNBsFjMZzzZdptDqIkbStBDMBHOOBXJl8YBJ+s+8idl?=
 =?us-ascii?Q?TKoh7ZakO2e4OHfXRpRTzhl89v2XymscPh9XQCfQIGY2sXCLwRQuLCYwSL7p?=
 =?us-ascii?Q?xCtXJul7IPQF4HTR2xSENxin0x9DIQgMJpvhA4cZMOKBBZQ2UIbya2eVxsye?=
 =?us-ascii?Q?4o43A81JBXjp9K7fvhG8OXiNEPFcK6gZWec6ibTxZtsGFWj0jchuvoX7XmUZ?=
 =?us-ascii?Q?EkUE98j/CMvJT/73fSJxDaruu1JsX3ki8/1aYDx3deQmcZCImC4WGtgKrQfO?=
 =?us-ascii?Q?UlXy2o5HkuE8nLciprwfVXjXip9BwPNmBKELUlQSX4lLMvrpGRr4zCQ0Pqu1?=
 =?us-ascii?Q?hHL7vPIXvqtbbGYeCSHVDmWhBzIyGEFpvxEV08nJ9HdDYqrb6WfxvnyyN9Sc?=
 =?us-ascii?Q?l+vIxShdOXULpiwGxKaCxipQeFi/SPzezwcPoC3ZeicRy6UriPhBVhZnGY+4?=
 =?us-ascii?Q?H9Rq6hPwPMPnRJfW/G8qOPcbjmtRlIt9Jx0J49OoF0KecNysjowOk/MxHEQo?=
 =?us-ascii?Q?Rfoy+EGoUQUMlnWzcZ1ZAPa7uX7lcChL9i7mD3fGj5FFMXnUH0K1Ks7Vdqjq?=
 =?us-ascii?Q?B3a0jCA/JuuxTNAif5Y24qHdUydj7T9s9uIUai9t6m34VC1mKNIhinYzZ9aN?=
 =?us-ascii?Q?97zYWtfVwIhL3jT0pnzHRAgJqzuTpe3zWGAZOoJB8NriOt305vh12Q2Yu8o5?=
 =?us-ascii?Q?/OvEIyuTSKNKwuVefaqCK7/2K18/wALqO3f4zo/CWafboKurLJp/7suxUmMZ?=
 =?us-ascii?Q?WBwiuQG4sLJh3ayHIlVob6kt6PH/9slAOoc2fJWwGdHuHzcIqh8RdRnkYtkq?=
 =?us-ascii?Q?cMZXARKxtjYPrgxyk2VDXXQundnL7PKT738dk0d+yvWkxsEx9wYF1gDFj7uL?=
 =?us-ascii?Q?J46ecXqiikip/FKW+NdrkQp6ijw+81HVpDndVl52q96MemYa6ARDAvyKpDTk?=
 =?us-ascii?Q?WbSnlCeqLUDbnS3Jft/YS/qaoTaAvbNttXi8VSyxewSTn8XcxzMueadd8hak?=
 =?us-ascii?Q?dbRMSAI2gBJOg1E/I9Qn9ZM0/kIADoWI5mAhcCdY99BWTo84Kk30K3OV4alQ?=
 =?us-ascii?Q?AHyJSbaAvffiTQsMdsraTIJ88dwIwhOwYuI5nEK2wsbs/irly0FKfpCiKgfQ?=
 =?us-ascii?Q?y3UsDYwHpZfv4v3QYE80qd1zj5rw71fV1mdPG7REirTHQzh0pCDRLUYHd9wU?=
 =?us-ascii?Q?t1G+HFPsf680b/CsqbAcy/8hW84WE8MfABHN7QZcDo+n4UNOXRAVasAVdrrz?=
 =?us-ascii?Q?/BSf8VQQ6Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZwbJzVXf+aO6octwjFYh9aQ5YVJ0j9etEa69C2BFRNIHUHCsjtm1E43crrenL7kCy9Ggym1A8k3tdSQh0MGjjnR/abkzSUYOmwc8US/28px/M+sLcOCZSkpQYQ/cz8TKrd7khwbxdL3onAaL8xepM54N73JjFrnPu2AkJ2DQVdsKH9GLbGnCnXuCETSalqxlDiYpW6AmiQGT8NNQA2EQQsPQXQN9A1lI/waa/qZosH1ioeV8ebLX8rHQpjPX3VFMBQGLeUCLqL1xeu1Ta2SfcUGCpQcMZ65ElX5/d3aDwYeyosr3wL59U2lDj0CrWCw1HZd6/L1RI2S6CXH3iYsQfZb2D0XCBT90+Qx3IcBGtTnyZowU9YSgviOH7rQE9FpBH1fCiBuE1aLt3+Ayxp3qFSbP841nUMQmYpG16d4q0sAcCdKZMx+pGXQyjxwXU6jWrbMgcgzL+ToWm1sarB6k9pUrxu+xB7QaBIDnSjtEvuiVNHdiEefDMSrK0WmaZSKI3QjjjYNekV+m94yJK2+2PmLzctYoCjXEc61WdoS+zygEah6W+jkGECzF/Uw4MW+WOhJxJ8/NetEU5xEjb4p8iV+81tHoxpJH9i6wTqyj048=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4915a621-e3ed-40a3-4bca-08de77e36fa2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 22:39:44.9267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3gusDLVJvYkrxbwI9zNqRZt6Z5joeczeoRWwyjNqmPV6NP3NWMfnhFMPNOeZ8yWvWlpqS7nPJ9eD8JDgJHnE9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5099
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_05,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2602130000 definitions=main-2603010207
X-Proofpoint-ORIG-GUID: V-R-GKvenqGu_WHNgB7aiTn4hVOoKpKx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDIwNyBTYWx0ZWRfX4rXhj0BO1Rwe
 1zzO9PmKXZAIREjPfK0DVEDCy1DHORFhMAQljN+Zkl+6v3591JR0m08pHe9XDbaRKKSRdeWx56M
 KtXhFXb2vQwl8SPO6dMyDDZgrkmh8jWSHuoPHskK6ZtE2ir4XxlxuvIEuamKcGEWm6kUyvodXt8
 ME5fsCwm+OZUl5SLzZ4/O31Ks/Px9t7mw7Pqwxz15+py1kIvOpGKl5ddFLx+Bh8P5Ixjm7i2zI8
 lRBEwt76iYvYeiZMoCL+BUTirQKRJPfxGCxxuJN/o3EpFjm3RzWfkH2SRiH9jE/1JFiQT+ejMCn
 i9OfdPO8GZV9kLPxz7M+qMOB2yVyuw1vFNqDYUpwYlaAmmQdQ+8R9HLuBsSfbzyklZ8q4zTR5GE
 tXKct10iayvr+v/KyKBafzUGVDkUH0ED1FksnBrzNCdA4wN09jKxft8oy/ajgwK8t+rzbLVD/AY
 cAIsHho3xVxMV3v0kEg==
X-Proofpoint-GUID: V-R-GKvenqGu_WHNgB7aiTn4hVOoKpKx
X-Authority-Analysis: v=2.4 cv=Urlu9uwB c=1 sm=1 tr=0 ts=69a4c035 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=3I1J8UUJPc9JN9BFgKH3:22 a=yPCof4ZbAAAA:8 a=66Y51ZSDRGUA9Q2MOd0A:9

From: Eugene Loh <eugene.loh@oracle.com>

In dt_provider_discover(), we loop over providers to discover new
probes.  For each existing provider whose implementation has a discovery
function, we call the function, thereby possibly adding new providers.

This has at least two problems:

  x The iterator is not designed to handle new table elements
    being added during the loop.

  x New providers that are added will presumably use the same
    implementation that discovered them.  So, new providers are
    simply adding redundant discovery functions.

While neither of these problems apparently causes any errors, the result
is a messy loop that leads potentially to unnecessary probe discovery.

Add dtp->dt_discs, a linked list of provider discovery functions.

Add functions to init and free this linked list.

Replace the iteration over a growing list of providers with an iteration
over the small, fixed list of provider discovery functions.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_impl.h     |  1 +
 libdtrace/dt_open.c     |  6 ++++++
 libdtrace/dt_provider.c | 45 +++++++++++++++++++++++++++++++++++------
 libdtrace/dt_provider.h |  2 ++
 4 files changed, 48 insertions(+), 6 deletions(-)

diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 5282efbdb..ff730319b 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -333,6 +333,7 @@ struct dtrace_hdl {
 	struct dt_probe *dt_error; /* ERROR probe */
 
 	dt_htab_t *dt_provs;	/* hash table of dt_provider_t's */
+	dt_list_t dt_discs;	/* linked list of provider discovery functions */
 	const struct dt_provider *dt_prov_pid; /* PID provider */
 	int dt_proc_signal;	/* signal used to interrupt monitoring threads */
 	struct sigaction dt_proc_oact;
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index a45908047..224f60cf7 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -1250,6 +1250,11 @@ dtrace_init(dtrace_hdl_t *dtp)
 			   dt_providers[i]->name);
 	}
 
+	/*
+	 * Initialize the list of provider discovery functions.
+	 */
+	dt_provider_discs_init(dtp);
+
 	return 0;
 }
 
@@ -1342,6 +1347,7 @@ dtrace_close(dtrace_hdl_t *dtp)
 	dt_probe_fini(dtp);
 
 	dt_htab_destroy(dtp->dt_provs);
+	dt_provider_discs_free(dtp);
 
 	for (i = 1; i < dtp->dt_cpp_argc; i++)
 		free(dtp->dt_cpp_argv[i]);
diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
index 079265b72..f7f76f9c2 100644
--- a/libdtrace/dt_provider.c
+++ b/libdtrace/dt_provider.c
@@ -231,18 +231,51 @@ dt_provider_xref(dtrace_hdl_t *dtp, dt_provider_t *pvp, id_t id)
 	return 0;
 }
 
-int
-dt_provider_discover(dtrace_hdl_t *dtp)
+typedef struct list_disc {
+	dt_list_t	list;
+	int		(*disc)(dtrace_hdl_t *dtp);
+} list_disc_t;
+
+void
+dt_provider_discs_init(dtrace_hdl_t *dtp)
 {
-	int		prid = dtp->dt_probe_id;
 	dt_htab_next_t	*it = NULL;
 	dt_provider_t	*pvp;
 
-	/* Discover new probes. */
 	while ((pvp = dt_htab_next(dtp->dt_provs, &it)) != NULL) {
-		if (pvp->impl->discover && pvp->impl->discover(dtp) < 0)
-			return -1;        /* errno is already set */
+		list_disc_t *disc;
+
+		if (pvp->impl->discover == NULL)
+			continue;
+		disc = dt_alloc(dtp, sizeof(list_disc_t));
+		if (disc == NULL)
+			return;
+		disc->disc = pvp->impl->discover;
+		dt_list_append(&dtp->dt_discs, disc);
 	}
+}
+
+void
+dt_provider_discs_free(dtrace_hdl_t *dtp)
+{
+	list_disc_t *disc;
+
+	while ((disc = dt_list_next(&dtp->dt_discs)) != NULL) {
+		dt_list_delete(&dtp->dt_discs, disc);
+		dt_free(dtp, disc);
+	}
+}
+
+int
+dt_provider_discover(dtrace_hdl_t *dtp)
+{
+	int		prid = dtp->dt_probe_id;
+	list_disc_t	*disc;
+
+	/* Discover new probes. */
+	for (disc = dt_list_next(&dtp->dt_discs); disc; disc = dt_list_next(disc))
+		if (disc->disc(dtp) < 0)
+			return -1;
 
 	/* Add them. */
 	for ( ; prid < dtp->dt_probe_id; prid++) {
diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
index dc1266711..0f8c13a00 100644
--- a/libdtrace/dt_provider.h
+++ b/libdtrace/dt_provider.h
@@ -120,6 +120,8 @@ extern dt_provider_t *dt_provider_create(dtrace_hdl_t *, const char *,
 					 const dtrace_pattr_t *, void *);
 extern int dt_provider_xref(dtrace_hdl_t *, dt_provider_t *, id_t);
 extern int dt_provider_discover(dtrace_hdl_t *dtp);
+extern void dt_provider_discs_init(dtrace_hdl_t *dtp);
+extern void dt_provider_discs_free(dtrace_hdl_t *dtp);
 
 #ifdef	__cplusplus
 }
-- 
2.47.3

