Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1239C31A041
	for <dtrace@lists.linux.dev>; Fri, 14 Nov 2025 20:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763150726; cv=fail; b=tvq5y01PmVySw5wcGPLJdvt8c0OwHryFqrLW/rzKWZ7avtYyBBEB8DdKqaMZcNmSPzte+GECUgGhXcbkjvo/CUhOnic3Yb30JToq53X6NX9rR5fhZJWVJitw8aQ2M1jRJhydb0dKGTrmIdgxJZo2WNU/xPlrLbqgmRa2OyQWJJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763150726; c=relaxed/simple;
	bh=J8eaemieAPlt8GR/8pkflm2wHwbwSUogwz3MPbQ4NTo=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=AKw1cjh/TZM6DtY8EiETRjHNZbyJ6V5LBzK/s2OCrGlYCorQKfgZPNmbnuafTipauZnQvg6wmti8GbhgbJLaExjbEHWuG8e/qQC6IV1iiObbHnAHsyoUiFPmyKmSV0NTuKE2uFc/6sJl40+IntfC7FxMugif2rbrDnfDqxK2BjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YJGeGNn2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=m7EJfLxN; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YJGeGNn2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="m7EJfLxN"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AEJuBY3022237
	for <dtrace@lists.linux.dev>; Fri, 14 Nov 2025 20:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=x43drWJItFLoV+TMEcKYwPul/2bGHYgmI7ShFWsswEE=; b=
	YJGeGNn2ouSiQMXoyZT2U3Iu8mWnZRJi/qXwaqkrbk3GR9VGrJik6IJll4Kv8pFg
	XNLpve9IU6wmBbdLvvy2Qv8bcduuI1+9IfgfiTL2awlX1EZ4qm1ON+SrbCj8sRrY
	9MG/00gw+fZBzGgI5oikpI/z0kcPVakinh6f48KjK+Ohsw4IocGoy2+6z4fgpo7s
	gl0KBrrr3J7JBttyEvE93QLmehwpLgjhFWNA1P4mE0pOJXEBxS48menFH1mJjqID
	YqD9hTiS7vRVJDoAtBgp1hwZhaqC6cu2R1LQ4r+LDgS8ECVKLNivM4U21uv13/5v
	MrpfIXh3tqA8Jj8oRxNbhw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4adr8ssx6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 14 Nov 2025 20:05:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AEJxux1027695
	for <dtrace@lists.linux.dev>; Fri, 14 Nov 2025 20:05:21 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010047.outbound.protection.outlook.com [52.101.193.47])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4a9vaj2ehs-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 14 Nov 2025 20:05:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pjs89d5PtEICpoErA/fbrDug3gDlO4ArqzFQKXidkvJHzqGk6yxmqIIgPx4k1qsXSn2/Snunof7Qxab5W5lPi1GWWVVk1wUFS9vFUdtt/a69CgbxdIKk+xMRV+I0Mq6M8niRYDGKS5r4S975eqrp9SvuZHU7C7IdcjVpfVI8qD7Nrdc3oC8MilCvV8mrAc0FABMfKZOVn7rAPhyxjFMsFxB7tCGNixYZ5UHR92ljfEzOpBe/psW1kG3B0V+Sw7wt4tvCYZXKkTn/uEpMUvQ5tuT6bByGHoI8SfqnzwIaK2gyTq0ouLQ242myo1WNVF+8IcztkdEJQYQ62IQTecX4KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x43drWJItFLoV+TMEcKYwPul/2bGHYgmI7ShFWsswEE=;
 b=UveZ0ge0s45FrU6ANpijRzSkirRRta8Ne+0sCakt6qtoe8SHctzLxK7vH2qO7s9/6v/iH7NmOJqtDwk5ZhMGCkmTCxHtnzEIW1haVRF9675ywO5Q+bmkhNWFNMhFM7Ah9xvx/DG1kKwXn18464hUUdPuxgBgO1PLgifb3VprWe/W85uwL5E6xQr7SuA1rH5duKHVXMMEdHPaJARLackih6NjnP8t6hh5RgcVg3lldgEqmWXmdy8LJG3MqGm3nUMMvW4S4lvDz3U+oXG2Y55gAdH5c4+MNO3PnmO5vNr8ADXtbS3h84QAaQd1nPnCI/8UpayTJw3OdFB+RThRoU3C7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x43drWJItFLoV+TMEcKYwPul/2bGHYgmI7ShFWsswEE=;
 b=m7EJfLxNm/HjVOcow1ebJuJsURvZwkUhFq9+BjpdVicykh19MPaW8ETYWDpJyTlsn4eHyFdPk51oeNAzJlm647vIdJAeYNoMO8/O/4QDzdvf4VRx/r+eFzHc/G+jWIVRwnfIzx1EvCfzXrWkARhsOrhqmgb2lkWBD9554nMFkNE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM4PR10MB6061.namprd10.prod.outlook.com (2603:10b6:8:b5::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.18; Fri, 14 Nov 2025 20:05:18 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 20:05:16 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Update README.md for RPM info
Date: Fri, 14 Nov 2025 15:05:14 -0500
Message-Id: <20251114200514.27242-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH8PR07CA0030.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM4PR10MB6061:EE_
X-MS-Office365-Filtering-Correlation-Id: 8965c167-960b-4854-46e6-08de23b92139
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G1oQBnkSflbsJnwfWQ08bfjNWAtz2TuimXXwVjOg5q2x6t6qGCG4loQyKxJ5?=
 =?us-ascii?Q?4VaqEDZcNKqPkDIah4yGgpa+XSjO9HQXABY00q3qX6nEhVLUl/9fYN757Bcr?=
 =?us-ascii?Q?GMJ9O7BX9IUBiGw0Ke19mZN0KPglfLws2VqR/O4e4gdILMPtO/9kWOnl8Lc7?=
 =?us-ascii?Q?YmiF2XaINqRIogdFKIJM7qeoU9tGcvOt6DizU79mfPUWE+qiZXjlNXBmPo28?=
 =?us-ascii?Q?g1arApqiIKo2VoxalcLpE2rnTQoVsZGZ3edApZpJ2uOZ0rgtW0vCBjMVe1gZ?=
 =?us-ascii?Q?8Zm2K4sBYB5EzYX7ESUI45e3X9O7YI4SRb0JrO/Nz0hT18iinVShuoyL+/aM?=
 =?us-ascii?Q?SKJz87kjTeiMIXMVlQgp0nDofvj7a84/vc5IhnOvuO+CVEQycS1EZB535ZsK?=
 =?us-ascii?Q?tfjGrydpdrCL3pWTK5XXaiqf4mdd8pEaz3PtyfATpMgp7HuCMsSdj/sFxzv1?=
 =?us-ascii?Q?hc6KHIX1p2Nq9AzQaU++y3+D43HAqBzoJDiX85LNWeax4HxfxbBCRqIiX4YF?=
 =?us-ascii?Q?HXTKsLzn9iInVTwo4RMzoRvowAAwH58geKqDTSgfZ/+A2jcoO7Arpw0pu5s0?=
 =?us-ascii?Q?auVJ61A2Vtj/O/vOWBcbACP+igbN1D1b//1BBlJqDNhf7ew1f9ZpObDUeO+i?=
 =?us-ascii?Q?d4Me0h5+W0h9RCM9h8A0oe4hNruGYRaFZOnOhqqEGlWzg16oRltO9+Kt9Lt2?=
 =?us-ascii?Q?H69AjCHWwhz6qDZm8yMhIG75RVcLQHNRDc3iFgUH7yaObWYu4yFQCo+F9Tvw?=
 =?us-ascii?Q?DfBT/EflMc09YnojUkprnuBX+3uh3HSu9D/u6/I601GDzkOzpOKJLlwSy9A4?=
 =?us-ascii?Q?1IN5YAg90y4YzNxd/epDxYjxGxOjK/wdl7A2SOPXB8NkD4QemarohhRrA1r2?=
 =?us-ascii?Q?y30d2Is5ElbCTVZJ01yLCExWDRvETMAkFVCTqGOfk7fBn8PekJvLqIjcUU4g?=
 =?us-ascii?Q?kiQl20eHkGxzEFhKxw74p3XWbSChbVOYOYlihxUqJqeLcP/IggPq8ppzeumv?=
 =?us-ascii?Q?0tJyWm0SwWL0cJq/c8gI/AUJt6NS1N0ylRCQBG62i93Tu3LWWwAj+k7mSTJN?=
 =?us-ascii?Q?B8Qegx0XSLQ+6paSTxZME+uX/YOqWCDjE80OpiBINYBrC8iIzxpQbptsfJOx?=
 =?us-ascii?Q?sTb18SYqoEMvrpbRHxzWN50mrkgJpJtf57mQoH8sH6755PvJee9DlqhuEw4Z?=
 =?us-ascii?Q?WxwXHLlmBtxJgP94qyz2tV8kSchkOeKx0cN4raf/vtpTPz4Jne1NmyFliSqi?=
 =?us-ascii?Q?JXSMNsUUpJlsxBrbUKcQ2XPFLwVQTRmfmBl2kO4+gwpY9cen7EcxzqW+VLRD?=
 =?us-ascii?Q?CE7v3rNhJawrBcidau4NyxdpHP++1FDkHtFdWeGa4QekSFKQQaH8ohYDobYb?=
 =?us-ascii?Q?AOKqat7xQBhPN6eCM0hnZbc4ZGiu0yz8f38kgIHD2cbTc6JF4/NqcX0WOP/J?=
 =?us-ascii?Q?NDUq6nDPqwg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gk/48F9AQZe3QGZXQsZu5g9eR8RkP0qzCNTQG7E12ODawKtV7lHRyFxZwig+?=
 =?us-ascii?Q?b01lCSUdavGDwr00vZ8Ykne8VcLfnRQRUpQ+BEJOywsufsEmfTYCi0GVV+1Z?=
 =?us-ascii?Q?ZVlqsDNjdvodiyxrcoyUV8ygD5DKPnsuNkv/wU4gREQ9w/1FlmOkx2HeC9Ru?=
 =?us-ascii?Q?qa6GJE6ieeOG2qSHUiqm/JFFi5f0ZcSuaJ0o405YKHsfZwez/S1WgiEoUMkw?=
 =?us-ascii?Q?j6XG7/oStf6I79cbJBkSkQrQ4VFySnixBqIpI7/9PZhjX0yS+EmvHAvzZmIc?=
 =?us-ascii?Q?uauge5fa4BnuG6maypQj7T50Oj1gGsVj2QsfMkGHs8C++fAB06erFj8Uj72B?=
 =?us-ascii?Q?5eX/TstIiAvr/J5Nmq8ygYA5XU4vQBFeOLAOQJAha6FUv0A180XBCpa/m/WF?=
 =?us-ascii?Q?OfJ4/hxMn0ih3lx21fbV6+pSUSOohxa0SRnJqypCd8kw7Q4Ufa9wr6vHYO6m?=
 =?us-ascii?Q?CFVnoulwZ3C+Z0Yv0LyXgnVRyy1HgCOBQGNHhSlvL+X4tKrF1AZH3q2+8ocV?=
 =?us-ascii?Q?q2cnNs4nB01g61eyQ+a6UuQ03gqGNotUafPw2QrSvHR20HdT2uhZXzNxShJa?=
 =?us-ascii?Q?rVJtyFO5qHPDF6ocdqXOyxkOWN/f0saOei9hvVJtIzRX6behXKpprgOYCblV?=
 =?us-ascii?Q?bCZOSpQN93i0QKRdaWuX+cKWjcB+Xa52WgVRyni+WEABviWcoYKpSc7a7lRh?=
 =?us-ascii?Q?P+929YgPWV9KylhJtz4cGc2joYwsEPmiN0pYSqQSXMfyep8rrBeu2MyyqYV3?=
 =?us-ascii?Q?F7NpO1A7a1Ra832ewGFwPwLXp9jaeYZoFvWtfCDffAiFqu1lANXpTTFa/TJ6?=
 =?us-ascii?Q?dNMOJXdGfve0zjvDi1IkiecfT5M9UQKx9Tf+uST3/wZWOXZukRwQV03IkrJz?=
 =?us-ascii?Q?4yPcov70QMFb7V2i04VB5NsrXxZyu4o9Rj7bPgw+Iu/0hNGRgQCF014XSMjV?=
 =?us-ascii?Q?h8iwzXrnndDV/TuvqPdzUNjNAlf5SYaekJMjh3JHd/x0DkeJh1fcm0KP509e?=
 =?us-ascii?Q?qll4DQD2xseAVOdNNBTPDdbFxqOLSOQvaAcNeDu5dw09F9UCUNfLJIXdaXad?=
 =?us-ascii?Q?AFuBl72aI47UlpR49KYg+ioivoqJNHxZef6RjZNHsz/jDJfKISgHgnfnrIei?=
 =?us-ascii?Q?yRCw6EgYuyDgwUJOpNVfvpzjAitizH9SItS8lif7utUWuB2yyfcZXeAZtP1C?=
 =?us-ascii?Q?cOMrub6+29zwrQlvuafcMv0qFXdlHKeKlX4h8TxajeMCsiy+ckDZ3dFd/5pw?=
 =?us-ascii?Q?t8xV6MgWV0CHvJqotYdLc5eNbNhuIXaHcYjA/4fFyHLiJrGJRhXkAvs1RLXE?=
 =?us-ascii?Q?quzUeJAmOG75DD4CitMjF7aKQ0eMEYDR2+xJ51jw8foDw4YmfLGNizfkngnx?=
 =?us-ascii?Q?dRVlmLS1iD9VWmw+EwbSISZIH3gM0Wy+aNxnmQb66XQvBWre+JsMnssDG6G0?=
 =?us-ascii?Q?j1brWpNmyMqTQVhiUsBUL4XHF2zWyARCimInwuzjG/20MvvjF0k/E+eNxmAQ?=
 =?us-ascii?Q?gXxz761cb2NNXX0DIKTd8S/SoR5FZmp/gryi70qyx6VBI42W8IEJnP16LsyP?=
 =?us-ascii?Q?VawR2GWmT7cxv0/JeFBXlaZ3kCGISnXs/kmtpV6K?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8YmTz+eRRQZ1wDfCdZKONM9dE4+M78iVeIXZzH36kujZnsNZNH/zfm0otw2O4GWOBll72CTkDwNsVB40VBGFFdbGTKT+Aov97K1Rcbhfh4v/+rkSXKdUvkEOs9ls7fyU95WWhANUMJMQ1ZY9IS+hjd81t1bRXw+NQIikysWtrqgBy52RGSLQx8+j2cgadOTdOX9Zsrz04Y9LmwWT05aPjjqOdzCmj67yiNAdkOAGdndiH6pQuRPqidOV63g2ooycqMcBVOerhxv26EWyvXdCxNcTEZaomvhsqJUrEOR3cBJG6vZRgUMqQmwdOa0CloJiaLpqCwOh/zVRC069DR4Ueft6Wfe5ROsJhxtfp6RS/HlNc2AjJLqRQiJyeJUkcFobZGnyUIFc4eBdEtNZ6sdMLOlVfdQBhCktVQnyFT316sW8XPRVnjMh79rtbt9LnAfaM5uavoG2Y6UGELgOYnY6dyP+qHJgAACJHqauJsKVJETtcM3CslOcqHJ3dY/2+xUoA/46H5TnIsk1Sv/MCcX53jjhZ9DoxyP1JiCTEWQVMBwAI4G26baCKAWcu/H4ScgDOkvN4OqBk+MfaAp1lsFZa/7ws5Vnz9e0NSzjSd2qdUU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8965c167-960b-4854-46e6-08de23b92139
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 20:05:16.8988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4057vSzoWuMBEfwmxomO2z5AncfpoZemPsIMT0sHp/RkY/kYZGI8f4mUSQGzmn+KIZXN2xa52Mj+4mWH4a4EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6061
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510240000 definitions=main-2511140163
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE3OCBTYWx0ZWRfXztaafBvX4VO3
 /TXL+gWm5rkQ4qRlgU9oTGzv+KJ/orhsdpvl2SA8LiEu+CBXNK6wBrOWLRB2vxRGtLQZm0FcFRu
 txQJAKRjoaVy9J9yssC7iebjt3nrTgmQ0Dy7QMNjo2/bHickDknE3axFO02a8DTLEGr9cBaafbD
 KYpEj/gh6gMyZL1gBAfuXTnSAz8HDeRYB1hlutnkNeNAub/6p27MuJ3HFaRfTquEAZsGzNGOFfG
 UjsPCHFcwIVCTqgrk7IArL+DbkrAEU7CWfZaqAbVGvOrVYwhXZUvYxurPRpVB/HD6DYGXhUyjcR
 +Zu9j/4cLLyy03LRVoYZERkhxaiooisFyqOdhIyeH44OwSGVQBOpmfk9BSrM4bNGPh6AsNWb+wd
 NQDabHVAWnI6yyeJTvhgcseO7wHUPcpswHluOeUsh18q5N0ju0Y=
X-Authority-Analysis: v=2.4 cv=WuYm8Nfv c=1 sm=1 tr=0 ts=69178b81 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=yPCof4ZbAAAA:8
 a=WPn2QM1W4K-mbIwS7OUA:9 cc=ntf awl=host:13643
X-Proofpoint-GUID: PBSrVvhU4amk03uw3LLeUjMG1QLmbNZH
X-Proofpoint-ORIG-GUID: PBSrVvhU4amk03uw3LLeUjMG1QLmbNZH

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 README.md | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/README.md b/README.md
index b54189b1d..3abd8a367 100644
--- a/README.md
+++ b/README.md
@@ -9,21 +9,28 @@ community.
 
 The main development branch is [devel](https://github.com/oracle/dtrace-utils/tree/devel).
 
-We provide prebuilt x86_64 and aarch64 DTrace userspace packages for Oracle
-Linux 9 (UEK7 kernel), Oracle Linux 8 (UEK7 or UEK6 kernel), and Oracle Linux 7
-(UEK6 kernel).  These packages are based on the Oracle Linux specific release
-branch [2.0-branch](https://github.com/oracle/dtrace-utils/tree/2.0-branch).
+We provide prebuilt x86_64 and aarch64 DTrace userspace packages for
+Oracle Linux 10 (UEK8 kernel),
+Oracle Linux 9 (UEK8 or UEK7 kernel),
+Oracle Linux 8 (UEK7 or UEK6 kernel),
+and Oracle Linux 7 (UEK6 kernel).
+These packages are based on the Oracle Linux specific release
+branch [stable](https://github.com/oracle/dtrace-utils/tree/stable).
 
 The latest packages can be obtained from the following
 [Oracle Linux yum server](https://yum.oracle.com) repositories: 
+- Oracle Linux 10 (x86_64) UEK Release 8: https://yum.oracle.com/repo/OracleLinux/OL10/UEKR8/x86_64/
+- Oracle Linux 10 (aarch64) UEK Release 8: https://yum.oracle.com/repo/OracleLinux/OL10/UEKR8/aarch64/
+- Oracle Linux 9 (x86_64) UEK Release 8: https://yum.oracle.com/repo/OracleLinux/OL9/UEKR8/x86_64/
+- Oracle Linux 9 (aarch64) UEK Release 8: https://yum.oracle.com/repo/OracleLinux/OL9/UEKR8/aarch64/
 - Oracle Linux 9 (x86_64) UEK Release 7: https://yum.oracle.com/repo/OracleLinux/OL9/UEKR7/x86_64/
 - Oracle Linux 9 (aarch64) BaseOS Latest: https://yum.oracle.com/repo/OracleLinux/OL9/baseos/latest/aarch64/
 - Oracle Linux 8 (x86_64) UEK Release 7: https://yum.oracle.com/repo/OracleLinux/OL8/UEKR7/x86_64/
 - Oracle Linux 8 (aarch64) UEK Release 7: https://yum.oracle.com/repo/OracleLinux/OL8/UEKR7/aarch64/
 - Oracle Linux 8 (x86_64) UEK Release 6: https://yum.oracle.com/repo/OracleLinux/OL8/UEKR6/x86_64/
 - Oracle Linux 8 (aarch64) BaseOS Latest: https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/aarch64/
-- Oracle Linux 7 (x86_64) UEK Release 6: https://yum.oracle.com/repo/OracleLinux/OL7/UEKR6/x86_64/
-- Oracle Linux 7 (aarch64) UEK Release 6: https://yum.oracle.com/repo/OracleLinux/OL7/UEKR6/aarch64/
+- Oracle Linux 7 (x86_64) UEK Release 6: https://yum.oracle.com/repo/OracleLinux/OL7/UEKR6/x86_64/ (up to dtrace-2.0.1-1)
+- Oracle Linux 7 (aarch64) UEK Release 6: https://yum.oracle.com/repo/OracleLinux/OL7/UEKR6/aarch64/ (up to dtrace-2.0.1-1)
 
 Source code for the UEK kernel is available on github in the
 [linux-uek repo](https://github.com/oracle/linux-uek).
-- 
2.47.3

